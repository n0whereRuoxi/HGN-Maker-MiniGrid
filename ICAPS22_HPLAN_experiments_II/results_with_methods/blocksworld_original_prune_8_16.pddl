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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176904 - BLOCK
      ?auto_176905 - BLOCK
      ?auto_176906 - BLOCK
      ?auto_176907 - BLOCK
      ?auto_176908 - BLOCK
      ?auto_176909 - BLOCK
      ?auto_176910 - BLOCK
      ?auto_176911 - BLOCK
    )
    :vars
    (
      ?auto_176912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176912 ?auto_176911 ) ( CLEAR ?auto_176912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176904 ) ( ON ?auto_176905 ?auto_176904 ) ( ON ?auto_176906 ?auto_176905 ) ( ON ?auto_176907 ?auto_176906 ) ( ON ?auto_176908 ?auto_176907 ) ( ON ?auto_176909 ?auto_176908 ) ( ON ?auto_176910 ?auto_176909 ) ( ON ?auto_176911 ?auto_176910 ) ( not ( = ?auto_176904 ?auto_176905 ) ) ( not ( = ?auto_176904 ?auto_176906 ) ) ( not ( = ?auto_176904 ?auto_176907 ) ) ( not ( = ?auto_176904 ?auto_176908 ) ) ( not ( = ?auto_176904 ?auto_176909 ) ) ( not ( = ?auto_176904 ?auto_176910 ) ) ( not ( = ?auto_176904 ?auto_176911 ) ) ( not ( = ?auto_176904 ?auto_176912 ) ) ( not ( = ?auto_176905 ?auto_176906 ) ) ( not ( = ?auto_176905 ?auto_176907 ) ) ( not ( = ?auto_176905 ?auto_176908 ) ) ( not ( = ?auto_176905 ?auto_176909 ) ) ( not ( = ?auto_176905 ?auto_176910 ) ) ( not ( = ?auto_176905 ?auto_176911 ) ) ( not ( = ?auto_176905 ?auto_176912 ) ) ( not ( = ?auto_176906 ?auto_176907 ) ) ( not ( = ?auto_176906 ?auto_176908 ) ) ( not ( = ?auto_176906 ?auto_176909 ) ) ( not ( = ?auto_176906 ?auto_176910 ) ) ( not ( = ?auto_176906 ?auto_176911 ) ) ( not ( = ?auto_176906 ?auto_176912 ) ) ( not ( = ?auto_176907 ?auto_176908 ) ) ( not ( = ?auto_176907 ?auto_176909 ) ) ( not ( = ?auto_176907 ?auto_176910 ) ) ( not ( = ?auto_176907 ?auto_176911 ) ) ( not ( = ?auto_176907 ?auto_176912 ) ) ( not ( = ?auto_176908 ?auto_176909 ) ) ( not ( = ?auto_176908 ?auto_176910 ) ) ( not ( = ?auto_176908 ?auto_176911 ) ) ( not ( = ?auto_176908 ?auto_176912 ) ) ( not ( = ?auto_176909 ?auto_176910 ) ) ( not ( = ?auto_176909 ?auto_176911 ) ) ( not ( = ?auto_176909 ?auto_176912 ) ) ( not ( = ?auto_176910 ?auto_176911 ) ) ( not ( = ?auto_176910 ?auto_176912 ) ) ( not ( = ?auto_176911 ?auto_176912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176912 ?auto_176911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176914 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_176914 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_176914 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176915 - BLOCK
    )
    :vars
    (
      ?auto_176916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176915 ?auto_176916 ) ( CLEAR ?auto_176915 ) ( HAND-EMPTY ) ( not ( = ?auto_176915 ?auto_176916 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176915 ?auto_176916 )
      ( MAKE-1PILE ?auto_176915 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176924 - BLOCK
      ?auto_176925 - BLOCK
      ?auto_176926 - BLOCK
      ?auto_176927 - BLOCK
      ?auto_176928 - BLOCK
      ?auto_176929 - BLOCK
      ?auto_176930 - BLOCK
    )
    :vars
    (
      ?auto_176931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176931 ?auto_176930 ) ( CLEAR ?auto_176931 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176924 ) ( ON ?auto_176925 ?auto_176924 ) ( ON ?auto_176926 ?auto_176925 ) ( ON ?auto_176927 ?auto_176926 ) ( ON ?auto_176928 ?auto_176927 ) ( ON ?auto_176929 ?auto_176928 ) ( ON ?auto_176930 ?auto_176929 ) ( not ( = ?auto_176924 ?auto_176925 ) ) ( not ( = ?auto_176924 ?auto_176926 ) ) ( not ( = ?auto_176924 ?auto_176927 ) ) ( not ( = ?auto_176924 ?auto_176928 ) ) ( not ( = ?auto_176924 ?auto_176929 ) ) ( not ( = ?auto_176924 ?auto_176930 ) ) ( not ( = ?auto_176924 ?auto_176931 ) ) ( not ( = ?auto_176925 ?auto_176926 ) ) ( not ( = ?auto_176925 ?auto_176927 ) ) ( not ( = ?auto_176925 ?auto_176928 ) ) ( not ( = ?auto_176925 ?auto_176929 ) ) ( not ( = ?auto_176925 ?auto_176930 ) ) ( not ( = ?auto_176925 ?auto_176931 ) ) ( not ( = ?auto_176926 ?auto_176927 ) ) ( not ( = ?auto_176926 ?auto_176928 ) ) ( not ( = ?auto_176926 ?auto_176929 ) ) ( not ( = ?auto_176926 ?auto_176930 ) ) ( not ( = ?auto_176926 ?auto_176931 ) ) ( not ( = ?auto_176927 ?auto_176928 ) ) ( not ( = ?auto_176927 ?auto_176929 ) ) ( not ( = ?auto_176927 ?auto_176930 ) ) ( not ( = ?auto_176927 ?auto_176931 ) ) ( not ( = ?auto_176928 ?auto_176929 ) ) ( not ( = ?auto_176928 ?auto_176930 ) ) ( not ( = ?auto_176928 ?auto_176931 ) ) ( not ( = ?auto_176929 ?auto_176930 ) ) ( not ( = ?auto_176929 ?auto_176931 ) ) ( not ( = ?auto_176930 ?auto_176931 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176931 ?auto_176930 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176932 - BLOCK
      ?auto_176933 - BLOCK
      ?auto_176934 - BLOCK
      ?auto_176935 - BLOCK
      ?auto_176936 - BLOCK
      ?auto_176937 - BLOCK
      ?auto_176938 - BLOCK
    )
    :vars
    (
      ?auto_176939 - BLOCK
      ?auto_176940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176939 ?auto_176938 ) ( CLEAR ?auto_176939 ) ( ON-TABLE ?auto_176932 ) ( ON ?auto_176933 ?auto_176932 ) ( ON ?auto_176934 ?auto_176933 ) ( ON ?auto_176935 ?auto_176934 ) ( ON ?auto_176936 ?auto_176935 ) ( ON ?auto_176937 ?auto_176936 ) ( ON ?auto_176938 ?auto_176937 ) ( not ( = ?auto_176932 ?auto_176933 ) ) ( not ( = ?auto_176932 ?auto_176934 ) ) ( not ( = ?auto_176932 ?auto_176935 ) ) ( not ( = ?auto_176932 ?auto_176936 ) ) ( not ( = ?auto_176932 ?auto_176937 ) ) ( not ( = ?auto_176932 ?auto_176938 ) ) ( not ( = ?auto_176932 ?auto_176939 ) ) ( not ( = ?auto_176933 ?auto_176934 ) ) ( not ( = ?auto_176933 ?auto_176935 ) ) ( not ( = ?auto_176933 ?auto_176936 ) ) ( not ( = ?auto_176933 ?auto_176937 ) ) ( not ( = ?auto_176933 ?auto_176938 ) ) ( not ( = ?auto_176933 ?auto_176939 ) ) ( not ( = ?auto_176934 ?auto_176935 ) ) ( not ( = ?auto_176934 ?auto_176936 ) ) ( not ( = ?auto_176934 ?auto_176937 ) ) ( not ( = ?auto_176934 ?auto_176938 ) ) ( not ( = ?auto_176934 ?auto_176939 ) ) ( not ( = ?auto_176935 ?auto_176936 ) ) ( not ( = ?auto_176935 ?auto_176937 ) ) ( not ( = ?auto_176935 ?auto_176938 ) ) ( not ( = ?auto_176935 ?auto_176939 ) ) ( not ( = ?auto_176936 ?auto_176937 ) ) ( not ( = ?auto_176936 ?auto_176938 ) ) ( not ( = ?auto_176936 ?auto_176939 ) ) ( not ( = ?auto_176937 ?auto_176938 ) ) ( not ( = ?auto_176937 ?auto_176939 ) ) ( not ( = ?auto_176938 ?auto_176939 ) ) ( HOLDING ?auto_176940 ) ( not ( = ?auto_176932 ?auto_176940 ) ) ( not ( = ?auto_176933 ?auto_176940 ) ) ( not ( = ?auto_176934 ?auto_176940 ) ) ( not ( = ?auto_176935 ?auto_176940 ) ) ( not ( = ?auto_176936 ?auto_176940 ) ) ( not ( = ?auto_176937 ?auto_176940 ) ) ( not ( = ?auto_176938 ?auto_176940 ) ) ( not ( = ?auto_176939 ?auto_176940 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_176940 )
      ( MAKE-7PILE ?auto_176932 ?auto_176933 ?auto_176934 ?auto_176935 ?auto_176936 ?auto_176937 ?auto_176938 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176941 - BLOCK
      ?auto_176942 - BLOCK
      ?auto_176943 - BLOCK
      ?auto_176944 - BLOCK
      ?auto_176945 - BLOCK
      ?auto_176946 - BLOCK
      ?auto_176947 - BLOCK
    )
    :vars
    (
      ?auto_176949 - BLOCK
      ?auto_176948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176949 ?auto_176947 ) ( ON-TABLE ?auto_176941 ) ( ON ?auto_176942 ?auto_176941 ) ( ON ?auto_176943 ?auto_176942 ) ( ON ?auto_176944 ?auto_176943 ) ( ON ?auto_176945 ?auto_176944 ) ( ON ?auto_176946 ?auto_176945 ) ( ON ?auto_176947 ?auto_176946 ) ( not ( = ?auto_176941 ?auto_176942 ) ) ( not ( = ?auto_176941 ?auto_176943 ) ) ( not ( = ?auto_176941 ?auto_176944 ) ) ( not ( = ?auto_176941 ?auto_176945 ) ) ( not ( = ?auto_176941 ?auto_176946 ) ) ( not ( = ?auto_176941 ?auto_176947 ) ) ( not ( = ?auto_176941 ?auto_176949 ) ) ( not ( = ?auto_176942 ?auto_176943 ) ) ( not ( = ?auto_176942 ?auto_176944 ) ) ( not ( = ?auto_176942 ?auto_176945 ) ) ( not ( = ?auto_176942 ?auto_176946 ) ) ( not ( = ?auto_176942 ?auto_176947 ) ) ( not ( = ?auto_176942 ?auto_176949 ) ) ( not ( = ?auto_176943 ?auto_176944 ) ) ( not ( = ?auto_176943 ?auto_176945 ) ) ( not ( = ?auto_176943 ?auto_176946 ) ) ( not ( = ?auto_176943 ?auto_176947 ) ) ( not ( = ?auto_176943 ?auto_176949 ) ) ( not ( = ?auto_176944 ?auto_176945 ) ) ( not ( = ?auto_176944 ?auto_176946 ) ) ( not ( = ?auto_176944 ?auto_176947 ) ) ( not ( = ?auto_176944 ?auto_176949 ) ) ( not ( = ?auto_176945 ?auto_176946 ) ) ( not ( = ?auto_176945 ?auto_176947 ) ) ( not ( = ?auto_176945 ?auto_176949 ) ) ( not ( = ?auto_176946 ?auto_176947 ) ) ( not ( = ?auto_176946 ?auto_176949 ) ) ( not ( = ?auto_176947 ?auto_176949 ) ) ( not ( = ?auto_176941 ?auto_176948 ) ) ( not ( = ?auto_176942 ?auto_176948 ) ) ( not ( = ?auto_176943 ?auto_176948 ) ) ( not ( = ?auto_176944 ?auto_176948 ) ) ( not ( = ?auto_176945 ?auto_176948 ) ) ( not ( = ?auto_176946 ?auto_176948 ) ) ( not ( = ?auto_176947 ?auto_176948 ) ) ( not ( = ?auto_176949 ?auto_176948 ) ) ( ON ?auto_176948 ?auto_176949 ) ( CLEAR ?auto_176948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176941 ?auto_176942 ?auto_176943 ?auto_176944 ?auto_176945 ?auto_176946 ?auto_176947 ?auto_176949 )
      ( MAKE-7PILE ?auto_176941 ?auto_176942 ?auto_176943 ?auto_176944 ?auto_176945 ?auto_176946 ?auto_176947 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176952 - BLOCK
      ?auto_176953 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_176953 ) ( CLEAR ?auto_176952 ) ( ON-TABLE ?auto_176952 ) ( not ( = ?auto_176952 ?auto_176953 ) ) )
    :subtasks
    ( ( !STACK ?auto_176953 ?auto_176952 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176954 - BLOCK
      ?auto_176955 - BLOCK
    )
    :vars
    (
      ?auto_176956 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_176954 ) ( ON-TABLE ?auto_176954 ) ( not ( = ?auto_176954 ?auto_176955 ) ) ( ON ?auto_176955 ?auto_176956 ) ( CLEAR ?auto_176955 ) ( HAND-EMPTY ) ( not ( = ?auto_176954 ?auto_176956 ) ) ( not ( = ?auto_176955 ?auto_176956 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176955 ?auto_176956 )
      ( MAKE-2PILE ?auto_176954 ?auto_176955 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176957 - BLOCK
      ?auto_176958 - BLOCK
    )
    :vars
    (
      ?auto_176959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176957 ?auto_176958 ) ) ( ON ?auto_176958 ?auto_176959 ) ( CLEAR ?auto_176958 ) ( not ( = ?auto_176957 ?auto_176959 ) ) ( not ( = ?auto_176958 ?auto_176959 ) ) ( HOLDING ?auto_176957 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176957 )
      ( MAKE-2PILE ?auto_176957 ?auto_176958 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176960 - BLOCK
      ?auto_176961 - BLOCK
    )
    :vars
    (
      ?auto_176962 - BLOCK
      ?auto_176964 - BLOCK
      ?auto_176965 - BLOCK
      ?auto_176963 - BLOCK
      ?auto_176968 - BLOCK
      ?auto_176967 - BLOCK
      ?auto_176966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176960 ?auto_176961 ) ) ( ON ?auto_176961 ?auto_176962 ) ( not ( = ?auto_176960 ?auto_176962 ) ) ( not ( = ?auto_176961 ?auto_176962 ) ) ( ON ?auto_176960 ?auto_176961 ) ( CLEAR ?auto_176960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176964 ) ( ON ?auto_176965 ?auto_176964 ) ( ON ?auto_176963 ?auto_176965 ) ( ON ?auto_176968 ?auto_176963 ) ( ON ?auto_176967 ?auto_176968 ) ( ON ?auto_176966 ?auto_176967 ) ( ON ?auto_176962 ?auto_176966 ) ( not ( = ?auto_176964 ?auto_176965 ) ) ( not ( = ?auto_176964 ?auto_176963 ) ) ( not ( = ?auto_176964 ?auto_176968 ) ) ( not ( = ?auto_176964 ?auto_176967 ) ) ( not ( = ?auto_176964 ?auto_176966 ) ) ( not ( = ?auto_176964 ?auto_176962 ) ) ( not ( = ?auto_176964 ?auto_176961 ) ) ( not ( = ?auto_176964 ?auto_176960 ) ) ( not ( = ?auto_176965 ?auto_176963 ) ) ( not ( = ?auto_176965 ?auto_176968 ) ) ( not ( = ?auto_176965 ?auto_176967 ) ) ( not ( = ?auto_176965 ?auto_176966 ) ) ( not ( = ?auto_176965 ?auto_176962 ) ) ( not ( = ?auto_176965 ?auto_176961 ) ) ( not ( = ?auto_176965 ?auto_176960 ) ) ( not ( = ?auto_176963 ?auto_176968 ) ) ( not ( = ?auto_176963 ?auto_176967 ) ) ( not ( = ?auto_176963 ?auto_176966 ) ) ( not ( = ?auto_176963 ?auto_176962 ) ) ( not ( = ?auto_176963 ?auto_176961 ) ) ( not ( = ?auto_176963 ?auto_176960 ) ) ( not ( = ?auto_176968 ?auto_176967 ) ) ( not ( = ?auto_176968 ?auto_176966 ) ) ( not ( = ?auto_176968 ?auto_176962 ) ) ( not ( = ?auto_176968 ?auto_176961 ) ) ( not ( = ?auto_176968 ?auto_176960 ) ) ( not ( = ?auto_176967 ?auto_176966 ) ) ( not ( = ?auto_176967 ?auto_176962 ) ) ( not ( = ?auto_176967 ?auto_176961 ) ) ( not ( = ?auto_176967 ?auto_176960 ) ) ( not ( = ?auto_176966 ?auto_176962 ) ) ( not ( = ?auto_176966 ?auto_176961 ) ) ( not ( = ?auto_176966 ?auto_176960 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176964 ?auto_176965 ?auto_176963 ?auto_176968 ?auto_176967 ?auto_176966 ?auto_176962 ?auto_176961 )
      ( MAKE-2PILE ?auto_176960 ?auto_176961 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176975 - BLOCK
      ?auto_176976 - BLOCK
      ?auto_176977 - BLOCK
      ?auto_176978 - BLOCK
      ?auto_176979 - BLOCK
      ?auto_176980 - BLOCK
    )
    :vars
    (
      ?auto_176981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176981 ?auto_176980 ) ( CLEAR ?auto_176981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176975 ) ( ON ?auto_176976 ?auto_176975 ) ( ON ?auto_176977 ?auto_176976 ) ( ON ?auto_176978 ?auto_176977 ) ( ON ?auto_176979 ?auto_176978 ) ( ON ?auto_176980 ?auto_176979 ) ( not ( = ?auto_176975 ?auto_176976 ) ) ( not ( = ?auto_176975 ?auto_176977 ) ) ( not ( = ?auto_176975 ?auto_176978 ) ) ( not ( = ?auto_176975 ?auto_176979 ) ) ( not ( = ?auto_176975 ?auto_176980 ) ) ( not ( = ?auto_176975 ?auto_176981 ) ) ( not ( = ?auto_176976 ?auto_176977 ) ) ( not ( = ?auto_176976 ?auto_176978 ) ) ( not ( = ?auto_176976 ?auto_176979 ) ) ( not ( = ?auto_176976 ?auto_176980 ) ) ( not ( = ?auto_176976 ?auto_176981 ) ) ( not ( = ?auto_176977 ?auto_176978 ) ) ( not ( = ?auto_176977 ?auto_176979 ) ) ( not ( = ?auto_176977 ?auto_176980 ) ) ( not ( = ?auto_176977 ?auto_176981 ) ) ( not ( = ?auto_176978 ?auto_176979 ) ) ( not ( = ?auto_176978 ?auto_176980 ) ) ( not ( = ?auto_176978 ?auto_176981 ) ) ( not ( = ?auto_176979 ?auto_176980 ) ) ( not ( = ?auto_176979 ?auto_176981 ) ) ( not ( = ?auto_176980 ?auto_176981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176981 ?auto_176980 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176982 - BLOCK
      ?auto_176983 - BLOCK
      ?auto_176984 - BLOCK
      ?auto_176985 - BLOCK
      ?auto_176986 - BLOCK
      ?auto_176987 - BLOCK
    )
    :vars
    (
      ?auto_176988 - BLOCK
      ?auto_176989 - BLOCK
      ?auto_176990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176988 ?auto_176987 ) ( CLEAR ?auto_176988 ) ( ON-TABLE ?auto_176982 ) ( ON ?auto_176983 ?auto_176982 ) ( ON ?auto_176984 ?auto_176983 ) ( ON ?auto_176985 ?auto_176984 ) ( ON ?auto_176986 ?auto_176985 ) ( ON ?auto_176987 ?auto_176986 ) ( not ( = ?auto_176982 ?auto_176983 ) ) ( not ( = ?auto_176982 ?auto_176984 ) ) ( not ( = ?auto_176982 ?auto_176985 ) ) ( not ( = ?auto_176982 ?auto_176986 ) ) ( not ( = ?auto_176982 ?auto_176987 ) ) ( not ( = ?auto_176982 ?auto_176988 ) ) ( not ( = ?auto_176983 ?auto_176984 ) ) ( not ( = ?auto_176983 ?auto_176985 ) ) ( not ( = ?auto_176983 ?auto_176986 ) ) ( not ( = ?auto_176983 ?auto_176987 ) ) ( not ( = ?auto_176983 ?auto_176988 ) ) ( not ( = ?auto_176984 ?auto_176985 ) ) ( not ( = ?auto_176984 ?auto_176986 ) ) ( not ( = ?auto_176984 ?auto_176987 ) ) ( not ( = ?auto_176984 ?auto_176988 ) ) ( not ( = ?auto_176985 ?auto_176986 ) ) ( not ( = ?auto_176985 ?auto_176987 ) ) ( not ( = ?auto_176985 ?auto_176988 ) ) ( not ( = ?auto_176986 ?auto_176987 ) ) ( not ( = ?auto_176986 ?auto_176988 ) ) ( not ( = ?auto_176987 ?auto_176988 ) ) ( HOLDING ?auto_176989 ) ( CLEAR ?auto_176990 ) ( not ( = ?auto_176982 ?auto_176989 ) ) ( not ( = ?auto_176982 ?auto_176990 ) ) ( not ( = ?auto_176983 ?auto_176989 ) ) ( not ( = ?auto_176983 ?auto_176990 ) ) ( not ( = ?auto_176984 ?auto_176989 ) ) ( not ( = ?auto_176984 ?auto_176990 ) ) ( not ( = ?auto_176985 ?auto_176989 ) ) ( not ( = ?auto_176985 ?auto_176990 ) ) ( not ( = ?auto_176986 ?auto_176989 ) ) ( not ( = ?auto_176986 ?auto_176990 ) ) ( not ( = ?auto_176987 ?auto_176989 ) ) ( not ( = ?auto_176987 ?auto_176990 ) ) ( not ( = ?auto_176988 ?auto_176989 ) ) ( not ( = ?auto_176988 ?auto_176990 ) ) ( not ( = ?auto_176989 ?auto_176990 ) ) )
    :subtasks
    ( ( !STACK ?auto_176989 ?auto_176990 )
      ( MAKE-6PILE ?auto_176982 ?auto_176983 ?auto_176984 ?auto_176985 ?auto_176986 ?auto_176987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178322 - BLOCK
      ?auto_178323 - BLOCK
      ?auto_178324 - BLOCK
      ?auto_178325 - BLOCK
      ?auto_178326 - BLOCK
      ?auto_178327 - BLOCK
    )
    :vars
    (
      ?auto_178329 - BLOCK
      ?auto_178328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178329 ?auto_178327 ) ( ON-TABLE ?auto_178322 ) ( ON ?auto_178323 ?auto_178322 ) ( ON ?auto_178324 ?auto_178323 ) ( ON ?auto_178325 ?auto_178324 ) ( ON ?auto_178326 ?auto_178325 ) ( ON ?auto_178327 ?auto_178326 ) ( not ( = ?auto_178322 ?auto_178323 ) ) ( not ( = ?auto_178322 ?auto_178324 ) ) ( not ( = ?auto_178322 ?auto_178325 ) ) ( not ( = ?auto_178322 ?auto_178326 ) ) ( not ( = ?auto_178322 ?auto_178327 ) ) ( not ( = ?auto_178322 ?auto_178329 ) ) ( not ( = ?auto_178323 ?auto_178324 ) ) ( not ( = ?auto_178323 ?auto_178325 ) ) ( not ( = ?auto_178323 ?auto_178326 ) ) ( not ( = ?auto_178323 ?auto_178327 ) ) ( not ( = ?auto_178323 ?auto_178329 ) ) ( not ( = ?auto_178324 ?auto_178325 ) ) ( not ( = ?auto_178324 ?auto_178326 ) ) ( not ( = ?auto_178324 ?auto_178327 ) ) ( not ( = ?auto_178324 ?auto_178329 ) ) ( not ( = ?auto_178325 ?auto_178326 ) ) ( not ( = ?auto_178325 ?auto_178327 ) ) ( not ( = ?auto_178325 ?auto_178329 ) ) ( not ( = ?auto_178326 ?auto_178327 ) ) ( not ( = ?auto_178326 ?auto_178329 ) ) ( not ( = ?auto_178327 ?auto_178329 ) ) ( not ( = ?auto_178322 ?auto_178328 ) ) ( not ( = ?auto_178323 ?auto_178328 ) ) ( not ( = ?auto_178324 ?auto_178328 ) ) ( not ( = ?auto_178325 ?auto_178328 ) ) ( not ( = ?auto_178326 ?auto_178328 ) ) ( not ( = ?auto_178327 ?auto_178328 ) ) ( not ( = ?auto_178329 ?auto_178328 ) ) ( ON ?auto_178328 ?auto_178329 ) ( CLEAR ?auto_178328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178322 ?auto_178323 ?auto_178324 ?auto_178325 ?auto_178326 ?auto_178327 ?auto_178329 )
      ( MAKE-6PILE ?auto_178322 ?auto_178323 ?auto_178324 ?auto_178325 ?auto_178326 ?auto_178327 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177000 - BLOCK
      ?auto_177001 - BLOCK
      ?auto_177002 - BLOCK
      ?auto_177003 - BLOCK
      ?auto_177004 - BLOCK
      ?auto_177005 - BLOCK
    )
    :vars
    (
      ?auto_177008 - BLOCK
      ?auto_177006 - BLOCK
      ?auto_177007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177008 ?auto_177005 ) ( ON-TABLE ?auto_177000 ) ( ON ?auto_177001 ?auto_177000 ) ( ON ?auto_177002 ?auto_177001 ) ( ON ?auto_177003 ?auto_177002 ) ( ON ?auto_177004 ?auto_177003 ) ( ON ?auto_177005 ?auto_177004 ) ( not ( = ?auto_177000 ?auto_177001 ) ) ( not ( = ?auto_177000 ?auto_177002 ) ) ( not ( = ?auto_177000 ?auto_177003 ) ) ( not ( = ?auto_177000 ?auto_177004 ) ) ( not ( = ?auto_177000 ?auto_177005 ) ) ( not ( = ?auto_177000 ?auto_177008 ) ) ( not ( = ?auto_177001 ?auto_177002 ) ) ( not ( = ?auto_177001 ?auto_177003 ) ) ( not ( = ?auto_177001 ?auto_177004 ) ) ( not ( = ?auto_177001 ?auto_177005 ) ) ( not ( = ?auto_177001 ?auto_177008 ) ) ( not ( = ?auto_177002 ?auto_177003 ) ) ( not ( = ?auto_177002 ?auto_177004 ) ) ( not ( = ?auto_177002 ?auto_177005 ) ) ( not ( = ?auto_177002 ?auto_177008 ) ) ( not ( = ?auto_177003 ?auto_177004 ) ) ( not ( = ?auto_177003 ?auto_177005 ) ) ( not ( = ?auto_177003 ?auto_177008 ) ) ( not ( = ?auto_177004 ?auto_177005 ) ) ( not ( = ?auto_177004 ?auto_177008 ) ) ( not ( = ?auto_177005 ?auto_177008 ) ) ( not ( = ?auto_177000 ?auto_177006 ) ) ( not ( = ?auto_177000 ?auto_177007 ) ) ( not ( = ?auto_177001 ?auto_177006 ) ) ( not ( = ?auto_177001 ?auto_177007 ) ) ( not ( = ?auto_177002 ?auto_177006 ) ) ( not ( = ?auto_177002 ?auto_177007 ) ) ( not ( = ?auto_177003 ?auto_177006 ) ) ( not ( = ?auto_177003 ?auto_177007 ) ) ( not ( = ?auto_177004 ?auto_177006 ) ) ( not ( = ?auto_177004 ?auto_177007 ) ) ( not ( = ?auto_177005 ?auto_177006 ) ) ( not ( = ?auto_177005 ?auto_177007 ) ) ( not ( = ?auto_177008 ?auto_177006 ) ) ( not ( = ?auto_177008 ?auto_177007 ) ) ( not ( = ?auto_177006 ?auto_177007 ) ) ( ON ?auto_177006 ?auto_177008 ) ( CLEAR ?auto_177006 ) ( HOLDING ?auto_177007 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177007 )
      ( MAKE-6PILE ?auto_177000 ?auto_177001 ?auto_177002 ?auto_177003 ?auto_177004 ?auto_177005 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177009 - BLOCK
      ?auto_177010 - BLOCK
      ?auto_177011 - BLOCK
      ?auto_177012 - BLOCK
      ?auto_177013 - BLOCK
      ?auto_177014 - BLOCK
    )
    :vars
    (
      ?auto_177016 - BLOCK
      ?auto_177017 - BLOCK
      ?auto_177015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177016 ?auto_177014 ) ( ON-TABLE ?auto_177009 ) ( ON ?auto_177010 ?auto_177009 ) ( ON ?auto_177011 ?auto_177010 ) ( ON ?auto_177012 ?auto_177011 ) ( ON ?auto_177013 ?auto_177012 ) ( ON ?auto_177014 ?auto_177013 ) ( not ( = ?auto_177009 ?auto_177010 ) ) ( not ( = ?auto_177009 ?auto_177011 ) ) ( not ( = ?auto_177009 ?auto_177012 ) ) ( not ( = ?auto_177009 ?auto_177013 ) ) ( not ( = ?auto_177009 ?auto_177014 ) ) ( not ( = ?auto_177009 ?auto_177016 ) ) ( not ( = ?auto_177010 ?auto_177011 ) ) ( not ( = ?auto_177010 ?auto_177012 ) ) ( not ( = ?auto_177010 ?auto_177013 ) ) ( not ( = ?auto_177010 ?auto_177014 ) ) ( not ( = ?auto_177010 ?auto_177016 ) ) ( not ( = ?auto_177011 ?auto_177012 ) ) ( not ( = ?auto_177011 ?auto_177013 ) ) ( not ( = ?auto_177011 ?auto_177014 ) ) ( not ( = ?auto_177011 ?auto_177016 ) ) ( not ( = ?auto_177012 ?auto_177013 ) ) ( not ( = ?auto_177012 ?auto_177014 ) ) ( not ( = ?auto_177012 ?auto_177016 ) ) ( not ( = ?auto_177013 ?auto_177014 ) ) ( not ( = ?auto_177013 ?auto_177016 ) ) ( not ( = ?auto_177014 ?auto_177016 ) ) ( not ( = ?auto_177009 ?auto_177017 ) ) ( not ( = ?auto_177009 ?auto_177015 ) ) ( not ( = ?auto_177010 ?auto_177017 ) ) ( not ( = ?auto_177010 ?auto_177015 ) ) ( not ( = ?auto_177011 ?auto_177017 ) ) ( not ( = ?auto_177011 ?auto_177015 ) ) ( not ( = ?auto_177012 ?auto_177017 ) ) ( not ( = ?auto_177012 ?auto_177015 ) ) ( not ( = ?auto_177013 ?auto_177017 ) ) ( not ( = ?auto_177013 ?auto_177015 ) ) ( not ( = ?auto_177014 ?auto_177017 ) ) ( not ( = ?auto_177014 ?auto_177015 ) ) ( not ( = ?auto_177016 ?auto_177017 ) ) ( not ( = ?auto_177016 ?auto_177015 ) ) ( not ( = ?auto_177017 ?auto_177015 ) ) ( ON ?auto_177017 ?auto_177016 ) ( ON ?auto_177015 ?auto_177017 ) ( CLEAR ?auto_177015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177009 ?auto_177010 ?auto_177011 ?auto_177012 ?auto_177013 ?auto_177014 ?auto_177016 ?auto_177017 )
      ( MAKE-6PILE ?auto_177009 ?auto_177010 ?auto_177011 ?auto_177012 ?auto_177013 ?auto_177014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177021 - BLOCK
      ?auto_177022 - BLOCK
      ?auto_177023 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_177023 ) ( CLEAR ?auto_177022 ) ( ON-TABLE ?auto_177021 ) ( ON ?auto_177022 ?auto_177021 ) ( not ( = ?auto_177021 ?auto_177022 ) ) ( not ( = ?auto_177021 ?auto_177023 ) ) ( not ( = ?auto_177022 ?auto_177023 ) ) )
    :subtasks
    ( ( !STACK ?auto_177023 ?auto_177022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177024 - BLOCK
      ?auto_177025 - BLOCK
      ?auto_177026 - BLOCK
    )
    :vars
    (
      ?auto_177027 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177025 ) ( ON-TABLE ?auto_177024 ) ( ON ?auto_177025 ?auto_177024 ) ( not ( = ?auto_177024 ?auto_177025 ) ) ( not ( = ?auto_177024 ?auto_177026 ) ) ( not ( = ?auto_177025 ?auto_177026 ) ) ( ON ?auto_177026 ?auto_177027 ) ( CLEAR ?auto_177026 ) ( HAND-EMPTY ) ( not ( = ?auto_177024 ?auto_177027 ) ) ( not ( = ?auto_177025 ?auto_177027 ) ) ( not ( = ?auto_177026 ?auto_177027 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177026 ?auto_177027 )
      ( MAKE-3PILE ?auto_177024 ?auto_177025 ?auto_177026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177028 - BLOCK
      ?auto_177029 - BLOCK
      ?auto_177030 - BLOCK
    )
    :vars
    (
      ?auto_177031 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177028 ) ( not ( = ?auto_177028 ?auto_177029 ) ) ( not ( = ?auto_177028 ?auto_177030 ) ) ( not ( = ?auto_177029 ?auto_177030 ) ) ( ON ?auto_177030 ?auto_177031 ) ( CLEAR ?auto_177030 ) ( not ( = ?auto_177028 ?auto_177031 ) ) ( not ( = ?auto_177029 ?auto_177031 ) ) ( not ( = ?auto_177030 ?auto_177031 ) ) ( HOLDING ?auto_177029 ) ( CLEAR ?auto_177028 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177028 ?auto_177029 )
      ( MAKE-3PILE ?auto_177028 ?auto_177029 ?auto_177030 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177032 - BLOCK
      ?auto_177033 - BLOCK
      ?auto_177034 - BLOCK
    )
    :vars
    (
      ?auto_177035 - BLOCK
      ?auto_177040 - BLOCK
      ?auto_177036 - BLOCK
      ?auto_177037 - BLOCK
      ?auto_177038 - BLOCK
      ?auto_177039 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177032 ) ( not ( = ?auto_177032 ?auto_177033 ) ) ( not ( = ?auto_177032 ?auto_177034 ) ) ( not ( = ?auto_177033 ?auto_177034 ) ) ( ON ?auto_177034 ?auto_177035 ) ( not ( = ?auto_177032 ?auto_177035 ) ) ( not ( = ?auto_177033 ?auto_177035 ) ) ( not ( = ?auto_177034 ?auto_177035 ) ) ( CLEAR ?auto_177032 ) ( ON ?auto_177033 ?auto_177034 ) ( CLEAR ?auto_177033 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177040 ) ( ON ?auto_177036 ?auto_177040 ) ( ON ?auto_177037 ?auto_177036 ) ( ON ?auto_177038 ?auto_177037 ) ( ON ?auto_177039 ?auto_177038 ) ( ON ?auto_177035 ?auto_177039 ) ( not ( = ?auto_177040 ?auto_177036 ) ) ( not ( = ?auto_177040 ?auto_177037 ) ) ( not ( = ?auto_177040 ?auto_177038 ) ) ( not ( = ?auto_177040 ?auto_177039 ) ) ( not ( = ?auto_177040 ?auto_177035 ) ) ( not ( = ?auto_177040 ?auto_177034 ) ) ( not ( = ?auto_177040 ?auto_177033 ) ) ( not ( = ?auto_177036 ?auto_177037 ) ) ( not ( = ?auto_177036 ?auto_177038 ) ) ( not ( = ?auto_177036 ?auto_177039 ) ) ( not ( = ?auto_177036 ?auto_177035 ) ) ( not ( = ?auto_177036 ?auto_177034 ) ) ( not ( = ?auto_177036 ?auto_177033 ) ) ( not ( = ?auto_177037 ?auto_177038 ) ) ( not ( = ?auto_177037 ?auto_177039 ) ) ( not ( = ?auto_177037 ?auto_177035 ) ) ( not ( = ?auto_177037 ?auto_177034 ) ) ( not ( = ?auto_177037 ?auto_177033 ) ) ( not ( = ?auto_177038 ?auto_177039 ) ) ( not ( = ?auto_177038 ?auto_177035 ) ) ( not ( = ?auto_177038 ?auto_177034 ) ) ( not ( = ?auto_177038 ?auto_177033 ) ) ( not ( = ?auto_177039 ?auto_177035 ) ) ( not ( = ?auto_177039 ?auto_177034 ) ) ( not ( = ?auto_177039 ?auto_177033 ) ) ( not ( = ?auto_177032 ?auto_177040 ) ) ( not ( = ?auto_177032 ?auto_177036 ) ) ( not ( = ?auto_177032 ?auto_177037 ) ) ( not ( = ?auto_177032 ?auto_177038 ) ) ( not ( = ?auto_177032 ?auto_177039 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177040 ?auto_177036 ?auto_177037 ?auto_177038 ?auto_177039 ?auto_177035 ?auto_177034 )
      ( MAKE-3PILE ?auto_177032 ?auto_177033 ?auto_177034 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177041 - BLOCK
      ?auto_177042 - BLOCK
      ?auto_177043 - BLOCK
    )
    :vars
    (
      ?auto_177046 - BLOCK
      ?auto_177045 - BLOCK
      ?auto_177047 - BLOCK
      ?auto_177049 - BLOCK
      ?auto_177048 - BLOCK
      ?auto_177044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177041 ?auto_177042 ) ) ( not ( = ?auto_177041 ?auto_177043 ) ) ( not ( = ?auto_177042 ?auto_177043 ) ) ( ON ?auto_177043 ?auto_177046 ) ( not ( = ?auto_177041 ?auto_177046 ) ) ( not ( = ?auto_177042 ?auto_177046 ) ) ( not ( = ?auto_177043 ?auto_177046 ) ) ( ON ?auto_177042 ?auto_177043 ) ( CLEAR ?auto_177042 ) ( ON-TABLE ?auto_177045 ) ( ON ?auto_177047 ?auto_177045 ) ( ON ?auto_177049 ?auto_177047 ) ( ON ?auto_177048 ?auto_177049 ) ( ON ?auto_177044 ?auto_177048 ) ( ON ?auto_177046 ?auto_177044 ) ( not ( = ?auto_177045 ?auto_177047 ) ) ( not ( = ?auto_177045 ?auto_177049 ) ) ( not ( = ?auto_177045 ?auto_177048 ) ) ( not ( = ?auto_177045 ?auto_177044 ) ) ( not ( = ?auto_177045 ?auto_177046 ) ) ( not ( = ?auto_177045 ?auto_177043 ) ) ( not ( = ?auto_177045 ?auto_177042 ) ) ( not ( = ?auto_177047 ?auto_177049 ) ) ( not ( = ?auto_177047 ?auto_177048 ) ) ( not ( = ?auto_177047 ?auto_177044 ) ) ( not ( = ?auto_177047 ?auto_177046 ) ) ( not ( = ?auto_177047 ?auto_177043 ) ) ( not ( = ?auto_177047 ?auto_177042 ) ) ( not ( = ?auto_177049 ?auto_177048 ) ) ( not ( = ?auto_177049 ?auto_177044 ) ) ( not ( = ?auto_177049 ?auto_177046 ) ) ( not ( = ?auto_177049 ?auto_177043 ) ) ( not ( = ?auto_177049 ?auto_177042 ) ) ( not ( = ?auto_177048 ?auto_177044 ) ) ( not ( = ?auto_177048 ?auto_177046 ) ) ( not ( = ?auto_177048 ?auto_177043 ) ) ( not ( = ?auto_177048 ?auto_177042 ) ) ( not ( = ?auto_177044 ?auto_177046 ) ) ( not ( = ?auto_177044 ?auto_177043 ) ) ( not ( = ?auto_177044 ?auto_177042 ) ) ( not ( = ?auto_177041 ?auto_177045 ) ) ( not ( = ?auto_177041 ?auto_177047 ) ) ( not ( = ?auto_177041 ?auto_177049 ) ) ( not ( = ?auto_177041 ?auto_177048 ) ) ( not ( = ?auto_177041 ?auto_177044 ) ) ( HOLDING ?auto_177041 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177041 )
      ( MAKE-3PILE ?auto_177041 ?auto_177042 ?auto_177043 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177050 - BLOCK
      ?auto_177051 - BLOCK
      ?auto_177052 - BLOCK
    )
    :vars
    (
      ?auto_177058 - BLOCK
      ?auto_177053 - BLOCK
      ?auto_177054 - BLOCK
      ?auto_177057 - BLOCK
      ?auto_177055 - BLOCK
      ?auto_177056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177050 ?auto_177051 ) ) ( not ( = ?auto_177050 ?auto_177052 ) ) ( not ( = ?auto_177051 ?auto_177052 ) ) ( ON ?auto_177052 ?auto_177058 ) ( not ( = ?auto_177050 ?auto_177058 ) ) ( not ( = ?auto_177051 ?auto_177058 ) ) ( not ( = ?auto_177052 ?auto_177058 ) ) ( ON ?auto_177051 ?auto_177052 ) ( ON-TABLE ?auto_177053 ) ( ON ?auto_177054 ?auto_177053 ) ( ON ?auto_177057 ?auto_177054 ) ( ON ?auto_177055 ?auto_177057 ) ( ON ?auto_177056 ?auto_177055 ) ( ON ?auto_177058 ?auto_177056 ) ( not ( = ?auto_177053 ?auto_177054 ) ) ( not ( = ?auto_177053 ?auto_177057 ) ) ( not ( = ?auto_177053 ?auto_177055 ) ) ( not ( = ?auto_177053 ?auto_177056 ) ) ( not ( = ?auto_177053 ?auto_177058 ) ) ( not ( = ?auto_177053 ?auto_177052 ) ) ( not ( = ?auto_177053 ?auto_177051 ) ) ( not ( = ?auto_177054 ?auto_177057 ) ) ( not ( = ?auto_177054 ?auto_177055 ) ) ( not ( = ?auto_177054 ?auto_177056 ) ) ( not ( = ?auto_177054 ?auto_177058 ) ) ( not ( = ?auto_177054 ?auto_177052 ) ) ( not ( = ?auto_177054 ?auto_177051 ) ) ( not ( = ?auto_177057 ?auto_177055 ) ) ( not ( = ?auto_177057 ?auto_177056 ) ) ( not ( = ?auto_177057 ?auto_177058 ) ) ( not ( = ?auto_177057 ?auto_177052 ) ) ( not ( = ?auto_177057 ?auto_177051 ) ) ( not ( = ?auto_177055 ?auto_177056 ) ) ( not ( = ?auto_177055 ?auto_177058 ) ) ( not ( = ?auto_177055 ?auto_177052 ) ) ( not ( = ?auto_177055 ?auto_177051 ) ) ( not ( = ?auto_177056 ?auto_177058 ) ) ( not ( = ?auto_177056 ?auto_177052 ) ) ( not ( = ?auto_177056 ?auto_177051 ) ) ( not ( = ?auto_177050 ?auto_177053 ) ) ( not ( = ?auto_177050 ?auto_177054 ) ) ( not ( = ?auto_177050 ?auto_177057 ) ) ( not ( = ?auto_177050 ?auto_177055 ) ) ( not ( = ?auto_177050 ?auto_177056 ) ) ( ON ?auto_177050 ?auto_177051 ) ( CLEAR ?auto_177050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177053 ?auto_177054 ?auto_177057 ?auto_177055 ?auto_177056 ?auto_177058 ?auto_177052 ?auto_177051 )
      ( MAKE-3PILE ?auto_177050 ?auto_177051 ?auto_177052 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177064 - BLOCK
      ?auto_177065 - BLOCK
      ?auto_177066 - BLOCK
      ?auto_177067 - BLOCK
      ?auto_177068 - BLOCK
    )
    :vars
    (
      ?auto_177069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177069 ?auto_177068 ) ( CLEAR ?auto_177069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177064 ) ( ON ?auto_177065 ?auto_177064 ) ( ON ?auto_177066 ?auto_177065 ) ( ON ?auto_177067 ?auto_177066 ) ( ON ?auto_177068 ?auto_177067 ) ( not ( = ?auto_177064 ?auto_177065 ) ) ( not ( = ?auto_177064 ?auto_177066 ) ) ( not ( = ?auto_177064 ?auto_177067 ) ) ( not ( = ?auto_177064 ?auto_177068 ) ) ( not ( = ?auto_177064 ?auto_177069 ) ) ( not ( = ?auto_177065 ?auto_177066 ) ) ( not ( = ?auto_177065 ?auto_177067 ) ) ( not ( = ?auto_177065 ?auto_177068 ) ) ( not ( = ?auto_177065 ?auto_177069 ) ) ( not ( = ?auto_177066 ?auto_177067 ) ) ( not ( = ?auto_177066 ?auto_177068 ) ) ( not ( = ?auto_177066 ?auto_177069 ) ) ( not ( = ?auto_177067 ?auto_177068 ) ) ( not ( = ?auto_177067 ?auto_177069 ) ) ( not ( = ?auto_177068 ?auto_177069 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177069 ?auto_177068 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177070 - BLOCK
      ?auto_177071 - BLOCK
      ?auto_177072 - BLOCK
      ?auto_177073 - BLOCK
      ?auto_177074 - BLOCK
    )
    :vars
    (
      ?auto_177075 - BLOCK
      ?auto_177076 - BLOCK
      ?auto_177077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177075 ?auto_177074 ) ( CLEAR ?auto_177075 ) ( ON-TABLE ?auto_177070 ) ( ON ?auto_177071 ?auto_177070 ) ( ON ?auto_177072 ?auto_177071 ) ( ON ?auto_177073 ?auto_177072 ) ( ON ?auto_177074 ?auto_177073 ) ( not ( = ?auto_177070 ?auto_177071 ) ) ( not ( = ?auto_177070 ?auto_177072 ) ) ( not ( = ?auto_177070 ?auto_177073 ) ) ( not ( = ?auto_177070 ?auto_177074 ) ) ( not ( = ?auto_177070 ?auto_177075 ) ) ( not ( = ?auto_177071 ?auto_177072 ) ) ( not ( = ?auto_177071 ?auto_177073 ) ) ( not ( = ?auto_177071 ?auto_177074 ) ) ( not ( = ?auto_177071 ?auto_177075 ) ) ( not ( = ?auto_177072 ?auto_177073 ) ) ( not ( = ?auto_177072 ?auto_177074 ) ) ( not ( = ?auto_177072 ?auto_177075 ) ) ( not ( = ?auto_177073 ?auto_177074 ) ) ( not ( = ?auto_177073 ?auto_177075 ) ) ( not ( = ?auto_177074 ?auto_177075 ) ) ( HOLDING ?auto_177076 ) ( CLEAR ?auto_177077 ) ( not ( = ?auto_177070 ?auto_177076 ) ) ( not ( = ?auto_177070 ?auto_177077 ) ) ( not ( = ?auto_177071 ?auto_177076 ) ) ( not ( = ?auto_177071 ?auto_177077 ) ) ( not ( = ?auto_177072 ?auto_177076 ) ) ( not ( = ?auto_177072 ?auto_177077 ) ) ( not ( = ?auto_177073 ?auto_177076 ) ) ( not ( = ?auto_177073 ?auto_177077 ) ) ( not ( = ?auto_177074 ?auto_177076 ) ) ( not ( = ?auto_177074 ?auto_177077 ) ) ( not ( = ?auto_177075 ?auto_177076 ) ) ( not ( = ?auto_177075 ?auto_177077 ) ) ( not ( = ?auto_177076 ?auto_177077 ) ) )
    :subtasks
    ( ( !STACK ?auto_177076 ?auto_177077 )
      ( MAKE-5PILE ?auto_177070 ?auto_177071 ?auto_177072 ?auto_177073 ?auto_177074 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177078 - BLOCK
      ?auto_177079 - BLOCK
      ?auto_177080 - BLOCK
      ?auto_177081 - BLOCK
      ?auto_177082 - BLOCK
    )
    :vars
    (
      ?auto_177085 - BLOCK
      ?auto_177084 - BLOCK
      ?auto_177083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177085 ?auto_177082 ) ( ON-TABLE ?auto_177078 ) ( ON ?auto_177079 ?auto_177078 ) ( ON ?auto_177080 ?auto_177079 ) ( ON ?auto_177081 ?auto_177080 ) ( ON ?auto_177082 ?auto_177081 ) ( not ( = ?auto_177078 ?auto_177079 ) ) ( not ( = ?auto_177078 ?auto_177080 ) ) ( not ( = ?auto_177078 ?auto_177081 ) ) ( not ( = ?auto_177078 ?auto_177082 ) ) ( not ( = ?auto_177078 ?auto_177085 ) ) ( not ( = ?auto_177079 ?auto_177080 ) ) ( not ( = ?auto_177079 ?auto_177081 ) ) ( not ( = ?auto_177079 ?auto_177082 ) ) ( not ( = ?auto_177079 ?auto_177085 ) ) ( not ( = ?auto_177080 ?auto_177081 ) ) ( not ( = ?auto_177080 ?auto_177082 ) ) ( not ( = ?auto_177080 ?auto_177085 ) ) ( not ( = ?auto_177081 ?auto_177082 ) ) ( not ( = ?auto_177081 ?auto_177085 ) ) ( not ( = ?auto_177082 ?auto_177085 ) ) ( CLEAR ?auto_177084 ) ( not ( = ?auto_177078 ?auto_177083 ) ) ( not ( = ?auto_177078 ?auto_177084 ) ) ( not ( = ?auto_177079 ?auto_177083 ) ) ( not ( = ?auto_177079 ?auto_177084 ) ) ( not ( = ?auto_177080 ?auto_177083 ) ) ( not ( = ?auto_177080 ?auto_177084 ) ) ( not ( = ?auto_177081 ?auto_177083 ) ) ( not ( = ?auto_177081 ?auto_177084 ) ) ( not ( = ?auto_177082 ?auto_177083 ) ) ( not ( = ?auto_177082 ?auto_177084 ) ) ( not ( = ?auto_177085 ?auto_177083 ) ) ( not ( = ?auto_177085 ?auto_177084 ) ) ( not ( = ?auto_177083 ?auto_177084 ) ) ( ON ?auto_177083 ?auto_177085 ) ( CLEAR ?auto_177083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177078 ?auto_177079 ?auto_177080 ?auto_177081 ?auto_177082 ?auto_177085 )
      ( MAKE-5PILE ?auto_177078 ?auto_177079 ?auto_177080 ?auto_177081 ?auto_177082 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177086 - BLOCK
      ?auto_177087 - BLOCK
      ?auto_177088 - BLOCK
      ?auto_177089 - BLOCK
      ?auto_177090 - BLOCK
    )
    :vars
    (
      ?auto_177093 - BLOCK
      ?auto_177092 - BLOCK
      ?auto_177091 - BLOCK
      ?auto_177094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177093 ?auto_177090 ) ( ON-TABLE ?auto_177086 ) ( ON ?auto_177087 ?auto_177086 ) ( ON ?auto_177088 ?auto_177087 ) ( ON ?auto_177089 ?auto_177088 ) ( ON ?auto_177090 ?auto_177089 ) ( not ( = ?auto_177086 ?auto_177087 ) ) ( not ( = ?auto_177086 ?auto_177088 ) ) ( not ( = ?auto_177086 ?auto_177089 ) ) ( not ( = ?auto_177086 ?auto_177090 ) ) ( not ( = ?auto_177086 ?auto_177093 ) ) ( not ( = ?auto_177087 ?auto_177088 ) ) ( not ( = ?auto_177087 ?auto_177089 ) ) ( not ( = ?auto_177087 ?auto_177090 ) ) ( not ( = ?auto_177087 ?auto_177093 ) ) ( not ( = ?auto_177088 ?auto_177089 ) ) ( not ( = ?auto_177088 ?auto_177090 ) ) ( not ( = ?auto_177088 ?auto_177093 ) ) ( not ( = ?auto_177089 ?auto_177090 ) ) ( not ( = ?auto_177089 ?auto_177093 ) ) ( not ( = ?auto_177090 ?auto_177093 ) ) ( not ( = ?auto_177086 ?auto_177092 ) ) ( not ( = ?auto_177086 ?auto_177091 ) ) ( not ( = ?auto_177087 ?auto_177092 ) ) ( not ( = ?auto_177087 ?auto_177091 ) ) ( not ( = ?auto_177088 ?auto_177092 ) ) ( not ( = ?auto_177088 ?auto_177091 ) ) ( not ( = ?auto_177089 ?auto_177092 ) ) ( not ( = ?auto_177089 ?auto_177091 ) ) ( not ( = ?auto_177090 ?auto_177092 ) ) ( not ( = ?auto_177090 ?auto_177091 ) ) ( not ( = ?auto_177093 ?auto_177092 ) ) ( not ( = ?auto_177093 ?auto_177091 ) ) ( not ( = ?auto_177092 ?auto_177091 ) ) ( ON ?auto_177092 ?auto_177093 ) ( CLEAR ?auto_177092 ) ( HOLDING ?auto_177091 ) ( CLEAR ?auto_177094 ) ( ON-TABLE ?auto_177094 ) ( not ( = ?auto_177094 ?auto_177091 ) ) ( not ( = ?auto_177086 ?auto_177094 ) ) ( not ( = ?auto_177087 ?auto_177094 ) ) ( not ( = ?auto_177088 ?auto_177094 ) ) ( not ( = ?auto_177089 ?auto_177094 ) ) ( not ( = ?auto_177090 ?auto_177094 ) ) ( not ( = ?auto_177093 ?auto_177094 ) ) ( not ( = ?auto_177092 ?auto_177094 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177094 ?auto_177091 )
      ( MAKE-5PILE ?auto_177086 ?auto_177087 ?auto_177088 ?auto_177089 ?auto_177090 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_178614 - BLOCK
      ?auto_178615 - BLOCK
      ?auto_178616 - BLOCK
      ?auto_178617 - BLOCK
      ?auto_178618 - BLOCK
    )
    :vars
    (
      ?auto_178620 - BLOCK
      ?auto_178621 - BLOCK
      ?auto_178619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178620 ?auto_178618 ) ( ON-TABLE ?auto_178614 ) ( ON ?auto_178615 ?auto_178614 ) ( ON ?auto_178616 ?auto_178615 ) ( ON ?auto_178617 ?auto_178616 ) ( ON ?auto_178618 ?auto_178617 ) ( not ( = ?auto_178614 ?auto_178615 ) ) ( not ( = ?auto_178614 ?auto_178616 ) ) ( not ( = ?auto_178614 ?auto_178617 ) ) ( not ( = ?auto_178614 ?auto_178618 ) ) ( not ( = ?auto_178614 ?auto_178620 ) ) ( not ( = ?auto_178615 ?auto_178616 ) ) ( not ( = ?auto_178615 ?auto_178617 ) ) ( not ( = ?auto_178615 ?auto_178618 ) ) ( not ( = ?auto_178615 ?auto_178620 ) ) ( not ( = ?auto_178616 ?auto_178617 ) ) ( not ( = ?auto_178616 ?auto_178618 ) ) ( not ( = ?auto_178616 ?auto_178620 ) ) ( not ( = ?auto_178617 ?auto_178618 ) ) ( not ( = ?auto_178617 ?auto_178620 ) ) ( not ( = ?auto_178618 ?auto_178620 ) ) ( not ( = ?auto_178614 ?auto_178621 ) ) ( not ( = ?auto_178614 ?auto_178619 ) ) ( not ( = ?auto_178615 ?auto_178621 ) ) ( not ( = ?auto_178615 ?auto_178619 ) ) ( not ( = ?auto_178616 ?auto_178621 ) ) ( not ( = ?auto_178616 ?auto_178619 ) ) ( not ( = ?auto_178617 ?auto_178621 ) ) ( not ( = ?auto_178617 ?auto_178619 ) ) ( not ( = ?auto_178618 ?auto_178621 ) ) ( not ( = ?auto_178618 ?auto_178619 ) ) ( not ( = ?auto_178620 ?auto_178621 ) ) ( not ( = ?auto_178620 ?auto_178619 ) ) ( not ( = ?auto_178621 ?auto_178619 ) ) ( ON ?auto_178621 ?auto_178620 ) ( ON ?auto_178619 ?auto_178621 ) ( CLEAR ?auto_178619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178614 ?auto_178615 ?auto_178616 ?auto_178617 ?auto_178618 ?auto_178620 ?auto_178621 )
      ( MAKE-5PILE ?auto_178614 ?auto_178615 ?auto_178616 ?auto_178617 ?auto_178618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177104 - BLOCK
      ?auto_177105 - BLOCK
      ?auto_177106 - BLOCK
      ?auto_177107 - BLOCK
      ?auto_177108 - BLOCK
    )
    :vars
    (
      ?auto_177112 - BLOCK
      ?auto_177110 - BLOCK
      ?auto_177109 - BLOCK
      ?auto_177111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177112 ?auto_177108 ) ( ON-TABLE ?auto_177104 ) ( ON ?auto_177105 ?auto_177104 ) ( ON ?auto_177106 ?auto_177105 ) ( ON ?auto_177107 ?auto_177106 ) ( ON ?auto_177108 ?auto_177107 ) ( not ( = ?auto_177104 ?auto_177105 ) ) ( not ( = ?auto_177104 ?auto_177106 ) ) ( not ( = ?auto_177104 ?auto_177107 ) ) ( not ( = ?auto_177104 ?auto_177108 ) ) ( not ( = ?auto_177104 ?auto_177112 ) ) ( not ( = ?auto_177105 ?auto_177106 ) ) ( not ( = ?auto_177105 ?auto_177107 ) ) ( not ( = ?auto_177105 ?auto_177108 ) ) ( not ( = ?auto_177105 ?auto_177112 ) ) ( not ( = ?auto_177106 ?auto_177107 ) ) ( not ( = ?auto_177106 ?auto_177108 ) ) ( not ( = ?auto_177106 ?auto_177112 ) ) ( not ( = ?auto_177107 ?auto_177108 ) ) ( not ( = ?auto_177107 ?auto_177112 ) ) ( not ( = ?auto_177108 ?auto_177112 ) ) ( not ( = ?auto_177104 ?auto_177110 ) ) ( not ( = ?auto_177104 ?auto_177109 ) ) ( not ( = ?auto_177105 ?auto_177110 ) ) ( not ( = ?auto_177105 ?auto_177109 ) ) ( not ( = ?auto_177106 ?auto_177110 ) ) ( not ( = ?auto_177106 ?auto_177109 ) ) ( not ( = ?auto_177107 ?auto_177110 ) ) ( not ( = ?auto_177107 ?auto_177109 ) ) ( not ( = ?auto_177108 ?auto_177110 ) ) ( not ( = ?auto_177108 ?auto_177109 ) ) ( not ( = ?auto_177112 ?auto_177110 ) ) ( not ( = ?auto_177112 ?auto_177109 ) ) ( not ( = ?auto_177110 ?auto_177109 ) ) ( ON ?auto_177110 ?auto_177112 ) ( not ( = ?auto_177111 ?auto_177109 ) ) ( not ( = ?auto_177104 ?auto_177111 ) ) ( not ( = ?auto_177105 ?auto_177111 ) ) ( not ( = ?auto_177106 ?auto_177111 ) ) ( not ( = ?auto_177107 ?auto_177111 ) ) ( not ( = ?auto_177108 ?auto_177111 ) ) ( not ( = ?auto_177112 ?auto_177111 ) ) ( not ( = ?auto_177110 ?auto_177111 ) ) ( ON ?auto_177109 ?auto_177110 ) ( CLEAR ?auto_177109 ) ( HOLDING ?auto_177111 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177111 )
      ( MAKE-5PILE ?auto_177104 ?auto_177105 ?auto_177106 ?auto_177107 ?auto_177108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177113 - BLOCK
      ?auto_177114 - BLOCK
      ?auto_177115 - BLOCK
      ?auto_177116 - BLOCK
      ?auto_177117 - BLOCK
    )
    :vars
    (
      ?auto_177120 - BLOCK
      ?auto_177121 - BLOCK
      ?auto_177118 - BLOCK
      ?auto_177119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177120 ?auto_177117 ) ( ON-TABLE ?auto_177113 ) ( ON ?auto_177114 ?auto_177113 ) ( ON ?auto_177115 ?auto_177114 ) ( ON ?auto_177116 ?auto_177115 ) ( ON ?auto_177117 ?auto_177116 ) ( not ( = ?auto_177113 ?auto_177114 ) ) ( not ( = ?auto_177113 ?auto_177115 ) ) ( not ( = ?auto_177113 ?auto_177116 ) ) ( not ( = ?auto_177113 ?auto_177117 ) ) ( not ( = ?auto_177113 ?auto_177120 ) ) ( not ( = ?auto_177114 ?auto_177115 ) ) ( not ( = ?auto_177114 ?auto_177116 ) ) ( not ( = ?auto_177114 ?auto_177117 ) ) ( not ( = ?auto_177114 ?auto_177120 ) ) ( not ( = ?auto_177115 ?auto_177116 ) ) ( not ( = ?auto_177115 ?auto_177117 ) ) ( not ( = ?auto_177115 ?auto_177120 ) ) ( not ( = ?auto_177116 ?auto_177117 ) ) ( not ( = ?auto_177116 ?auto_177120 ) ) ( not ( = ?auto_177117 ?auto_177120 ) ) ( not ( = ?auto_177113 ?auto_177121 ) ) ( not ( = ?auto_177113 ?auto_177118 ) ) ( not ( = ?auto_177114 ?auto_177121 ) ) ( not ( = ?auto_177114 ?auto_177118 ) ) ( not ( = ?auto_177115 ?auto_177121 ) ) ( not ( = ?auto_177115 ?auto_177118 ) ) ( not ( = ?auto_177116 ?auto_177121 ) ) ( not ( = ?auto_177116 ?auto_177118 ) ) ( not ( = ?auto_177117 ?auto_177121 ) ) ( not ( = ?auto_177117 ?auto_177118 ) ) ( not ( = ?auto_177120 ?auto_177121 ) ) ( not ( = ?auto_177120 ?auto_177118 ) ) ( not ( = ?auto_177121 ?auto_177118 ) ) ( ON ?auto_177121 ?auto_177120 ) ( not ( = ?auto_177119 ?auto_177118 ) ) ( not ( = ?auto_177113 ?auto_177119 ) ) ( not ( = ?auto_177114 ?auto_177119 ) ) ( not ( = ?auto_177115 ?auto_177119 ) ) ( not ( = ?auto_177116 ?auto_177119 ) ) ( not ( = ?auto_177117 ?auto_177119 ) ) ( not ( = ?auto_177120 ?auto_177119 ) ) ( not ( = ?auto_177121 ?auto_177119 ) ) ( ON ?auto_177118 ?auto_177121 ) ( ON ?auto_177119 ?auto_177118 ) ( CLEAR ?auto_177119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177113 ?auto_177114 ?auto_177115 ?auto_177116 ?auto_177117 ?auto_177120 ?auto_177121 ?auto_177118 )
      ( MAKE-5PILE ?auto_177113 ?auto_177114 ?auto_177115 ?auto_177116 ?auto_177117 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177126 - BLOCK
      ?auto_177127 - BLOCK
      ?auto_177128 - BLOCK
      ?auto_177129 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_177129 ) ( CLEAR ?auto_177128 ) ( ON-TABLE ?auto_177126 ) ( ON ?auto_177127 ?auto_177126 ) ( ON ?auto_177128 ?auto_177127 ) ( not ( = ?auto_177126 ?auto_177127 ) ) ( not ( = ?auto_177126 ?auto_177128 ) ) ( not ( = ?auto_177126 ?auto_177129 ) ) ( not ( = ?auto_177127 ?auto_177128 ) ) ( not ( = ?auto_177127 ?auto_177129 ) ) ( not ( = ?auto_177128 ?auto_177129 ) ) )
    :subtasks
    ( ( !STACK ?auto_177129 ?auto_177128 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177130 - BLOCK
      ?auto_177131 - BLOCK
      ?auto_177132 - BLOCK
      ?auto_177133 - BLOCK
    )
    :vars
    (
      ?auto_177134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177132 ) ( ON-TABLE ?auto_177130 ) ( ON ?auto_177131 ?auto_177130 ) ( ON ?auto_177132 ?auto_177131 ) ( not ( = ?auto_177130 ?auto_177131 ) ) ( not ( = ?auto_177130 ?auto_177132 ) ) ( not ( = ?auto_177130 ?auto_177133 ) ) ( not ( = ?auto_177131 ?auto_177132 ) ) ( not ( = ?auto_177131 ?auto_177133 ) ) ( not ( = ?auto_177132 ?auto_177133 ) ) ( ON ?auto_177133 ?auto_177134 ) ( CLEAR ?auto_177133 ) ( HAND-EMPTY ) ( not ( = ?auto_177130 ?auto_177134 ) ) ( not ( = ?auto_177131 ?auto_177134 ) ) ( not ( = ?auto_177132 ?auto_177134 ) ) ( not ( = ?auto_177133 ?auto_177134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177133 ?auto_177134 )
      ( MAKE-4PILE ?auto_177130 ?auto_177131 ?auto_177132 ?auto_177133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177135 - BLOCK
      ?auto_177136 - BLOCK
      ?auto_177137 - BLOCK
      ?auto_177138 - BLOCK
    )
    :vars
    (
      ?auto_177139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177135 ) ( ON ?auto_177136 ?auto_177135 ) ( not ( = ?auto_177135 ?auto_177136 ) ) ( not ( = ?auto_177135 ?auto_177137 ) ) ( not ( = ?auto_177135 ?auto_177138 ) ) ( not ( = ?auto_177136 ?auto_177137 ) ) ( not ( = ?auto_177136 ?auto_177138 ) ) ( not ( = ?auto_177137 ?auto_177138 ) ) ( ON ?auto_177138 ?auto_177139 ) ( CLEAR ?auto_177138 ) ( not ( = ?auto_177135 ?auto_177139 ) ) ( not ( = ?auto_177136 ?auto_177139 ) ) ( not ( = ?auto_177137 ?auto_177139 ) ) ( not ( = ?auto_177138 ?auto_177139 ) ) ( HOLDING ?auto_177137 ) ( CLEAR ?auto_177136 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177135 ?auto_177136 ?auto_177137 )
      ( MAKE-4PILE ?auto_177135 ?auto_177136 ?auto_177137 ?auto_177138 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177140 - BLOCK
      ?auto_177141 - BLOCK
      ?auto_177142 - BLOCK
      ?auto_177143 - BLOCK
    )
    :vars
    (
      ?auto_177144 - BLOCK
      ?auto_177147 - BLOCK
      ?auto_177146 - BLOCK
      ?auto_177145 - BLOCK
      ?auto_177148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177140 ) ( ON ?auto_177141 ?auto_177140 ) ( not ( = ?auto_177140 ?auto_177141 ) ) ( not ( = ?auto_177140 ?auto_177142 ) ) ( not ( = ?auto_177140 ?auto_177143 ) ) ( not ( = ?auto_177141 ?auto_177142 ) ) ( not ( = ?auto_177141 ?auto_177143 ) ) ( not ( = ?auto_177142 ?auto_177143 ) ) ( ON ?auto_177143 ?auto_177144 ) ( not ( = ?auto_177140 ?auto_177144 ) ) ( not ( = ?auto_177141 ?auto_177144 ) ) ( not ( = ?auto_177142 ?auto_177144 ) ) ( not ( = ?auto_177143 ?auto_177144 ) ) ( CLEAR ?auto_177141 ) ( ON ?auto_177142 ?auto_177143 ) ( CLEAR ?auto_177142 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177147 ) ( ON ?auto_177146 ?auto_177147 ) ( ON ?auto_177145 ?auto_177146 ) ( ON ?auto_177148 ?auto_177145 ) ( ON ?auto_177144 ?auto_177148 ) ( not ( = ?auto_177147 ?auto_177146 ) ) ( not ( = ?auto_177147 ?auto_177145 ) ) ( not ( = ?auto_177147 ?auto_177148 ) ) ( not ( = ?auto_177147 ?auto_177144 ) ) ( not ( = ?auto_177147 ?auto_177143 ) ) ( not ( = ?auto_177147 ?auto_177142 ) ) ( not ( = ?auto_177146 ?auto_177145 ) ) ( not ( = ?auto_177146 ?auto_177148 ) ) ( not ( = ?auto_177146 ?auto_177144 ) ) ( not ( = ?auto_177146 ?auto_177143 ) ) ( not ( = ?auto_177146 ?auto_177142 ) ) ( not ( = ?auto_177145 ?auto_177148 ) ) ( not ( = ?auto_177145 ?auto_177144 ) ) ( not ( = ?auto_177145 ?auto_177143 ) ) ( not ( = ?auto_177145 ?auto_177142 ) ) ( not ( = ?auto_177148 ?auto_177144 ) ) ( not ( = ?auto_177148 ?auto_177143 ) ) ( not ( = ?auto_177148 ?auto_177142 ) ) ( not ( = ?auto_177140 ?auto_177147 ) ) ( not ( = ?auto_177140 ?auto_177146 ) ) ( not ( = ?auto_177140 ?auto_177145 ) ) ( not ( = ?auto_177140 ?auto_177148 ) ) ( not ( = ?auto_177141 ?auto_177147 ) ) ( not ( = ?auto_177141 ?auto_177146 ) ) ( not ( = ?auto_177141 ?auto_177145 ) ) ( not ( = ?auto_177141 ?auto_177148 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177147 ?auto_177146 ?auto_177145 ?auto_177148 ?auto_177144 ?auto_177143 )
      ( MAKE-4PILE ?auto_177140 ?auto_177141 ?auto_177142 ?auto_177143 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177149 - BLOCK
      ?auto_177150 - BLOCK
      ?auto_177151 - BLOCK
      ?auto_177152 - BLOCK
    )
    :vars
    (
      ?auto_177153 - BLOCK
      ?auto_177154 - BLOCK
      ?auto_177157 - BLOCK
      ?auto_177155 - BLOCK
      ?auto_177156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177149 ) ( not ( = ?auto_177149 ?auto_177150 ) ) ( not ( = ?auto_177149 ?auto_177151 ) ) ( not ( = ?auto_177149 ?auto_177152 ) ) ( not ( = ?auto_177150 ?auto_177151 ) ) ( not ( = ?auto_177150 ?auto_177152 ) ) ( not ( = ?auto_177151 ?auto_177152 ) ) ( ON ?auto_177152 ?auto_177153 ) ( not ( = ?auto_177149 ?auto_177153 ) ) ( not ( = ?auto_177150 ?auto_177153 ) ) ( not ( = ?auto_177151 ?auto_177153 ) ) ( not ( = ?auto_177152 ?auto_177153 ) ) ( ON ?auto_177151 ?auto_177152 ) ( CLEAR ?auto_177151 ) ( ON-TABLE ?auto_177154 ) ( ON ?auto_177157 ?auto_177154 ) ( ON ?auto_177155 ?auto_177157 ) ( ON ?auto_177156 ?auto_177155 ) ( ON ?auto_177153 ?auto_177156 ) ( not ( = ?auto_177154 ?auto_177157 ) ) ( not ( = ?auto_177154 ?auto_177155 ) ) ( not ( = ?auto_177154 ?auto_177156 ) ) ( not ( = ?auto_177154 ?auto_177153 ) ) ( not ( = ?auto_177154 ?auto_177152 ) ) ( not ( = ?auto_177154 ?auto_177151 ) ) ( not ( = ?auto_177157 ?auto_177155 ) ) ( not ( = ?auto_177157 ?auto_177156 ) ) ( not ( = ?auto_177157 ?auto_177153 ) ) ( not ( = ?auto_177157 ?auto_177152 ) ) ( not ( = ?auto_177157 ?auto_177151 ) ) ( not ( = ?auto_177155 ?auto_177156 ) ) ( not ( = ?auto_177155 ?auto_177153 ) ) ( not ( = ?auto_177155 ?auto_177152 ) ) ( not ( = ?auto_177155 ?auto_177151 ) ) ( not ( = ?auto_177156 ?auto_177153 ) ) ( not ( = ?auto_177156 ?auto_177152 ) ) ( not ( = ?auto_177156 ?auto_177151 ) ) ( not ( = ?auto_177149 ?auto_177154 ) ) ( not ( = ?auto_177149 ?auto_177157 ) ) ( not ( = ?auto_177149 ?auto_177155 ) ) ( not ( = ?auto_177149 ?auto_177156 ) ) ( not ( = ?auto_177150 ?auto_177154 ) ) ( not ( = ?auto_177150 ?auto_177157 ) ) ( not ( = ?auto_177150 ?auto_177155 ) ) ( not ( = ?auto_177150 ?auto_177156 ) ) ( HOLDING ?auto_177150 ) ( CLEAR ?auto_177149 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177149 ?auto_177150 )
      ( MAKE-4PILE ?auto_177149 ?auto_177150 ?auto_177151 ?auto_177152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177158 - BLOCK
      ?auto_177159 - BLOCK
      ?auto_177160 - BLOCK
      ?auto_177161 - BLOCK
    )
    :vars
    (
      ?auto_177162 - BLOCK
      ?auto_177163 - BLOCK
      ?auto_177166 - BLOCK
      ?auto_177165 - BLOCK
      ?auto_177164 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177158 ) ( not ( = ?auto_177158 ?auto_177159 ) ) ( not ( = ?auto_177158 ?auto_177160 ) ) ( not ( = ?auto_177158 ?auto_177161 ) ) ( not ( = ?auto_177159 ?auto_177160 ) ) ( not ( = ?auto_177159 ?auto_177161 ) ) ( not ( = ?auto_177160 ?auto_177161 ) ) ( ON ?auto_177161 ?auto_177162 ) ( not ( = ?auto_177158 ?auto_177162 ) ) ( not ( = ?auto_177159 ?auto_177162 ) ) ( not ( = ?auto_177160 ?auto_177162 ) ) ( not ( = ?auto_177161 ?auto_177162 ) ) ( ON ?auto_177160 ?auto_177161 ) ( ON-TABLE ?auto_177163 ) ( ON ?auto_177166 ?auto_177163 ) ( ON ?auto_177165 ?auto_177166 ) ( ON ?auto_177164 ?auto_177165 ) ( ON ?auto_177162 ?auto_177164 ) ( not ( = ?auto_177163 ?auto_177166 ) ) ( not ( = ?auto_177163 ?auto_177165 ) ) ( not ( = ?auto_177163 ?auto_177164 ) ) ( not ( = ?auto_177163 ?auto_177162 ) ) ( not ( = ?auto_177163 ?auto_177161 ) ) ( not ( = ?auto_177163 ?auto_177160 ) ) ( not ( = ?auto_177166 ?auto_177165 ) ) ( not ( = ?auto_177166 ?auto_177164 ) ) ( not ( = ?auto_177166 ?auto_177162 ) ) ( not ( = ?auto_177166 ?auto_177161 ) ) ( not ( = ?auto_177166 ?auto_177160 ) ) ( not ( = ?auto_177165 ?auto_177164 ) ) ( not ( = ?auto_177165 ?auto_177162 ) ) ( not ( = ?auto_177165 ?auto_177161 ) ) ( not ( = ?auto_177165 ?auto_177160 ) ) ( not ( = ?auto_177164 ?auto_177162 ) ) ( not ( = ?auto_177164 ?auto_177161 ) ) ( not ( = ?auto_177164 ?auto_177160 ) ) ( not ( = ?auto_177158 ?auto_177163 ) ) ( not ( = ?auto_177158 ?auto_177166 ) ) ( not ( = ?auto_177158 ?auto_177165 ) ) ( not ( = ?auto_177158 ?auto_177164 ) ) ( not ( = ?auto_177159 ?auto_177163 ) ) ( not ( = ?auto_177159 ?auto_177166 ) ) ( not ( = ?auto_177159 ?auto_177165 ) ) ( not ( = ?auto_177159 ?auto_177164 ) ) ( CLEAR ?auto_177158 ) ( ON ?auto_177159 ?auto_177160 ) ( CLEAR ?auto_177159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177163 ?auto_177166 ?auto_177165 ?auto_177164 ?auto_177162 ?auto_177161 ?auto_177160 )
      ( MAKE-4PILE ?auto_177158 ?auto_177159 ?auto_177160 ?auto_177161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177167 - BLOCK
      ?auto_177168 - BLOCK
      ?auto_177169 - BLOCK
      ?auto_177170 - BLOCK
    )
    :vars
    (
      ?auto_177174 - BLOCK
      ?auto_177171 - BLOCK
      ?auto_177172 - BLOCK
      ?auto_177173 - BLOCK
      ?auto_177175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177167 ?auto_177168 ) ) ( not ( = ?auto_177167 ?auto_177169 ) ) ( not ( = ?auto_177167 ?auto_177170 ) ) ( not ( = ?auto_177168 ?auto_177169 ) ) ( not ( = ?auto_177168 ?auto_177170 ) ) ( not ( = ?auto_177169 ?auto_177170 ) ) ( ON ?auto_177170 ?auto_177174 ) ( not ( = ?auto_177167 ?auto_177174 ) ) ( not ( = ?auto_177168 ?auto_177174 ) ) ( not ( = ?auto_177169 ?auto_177174 ) ) ( not ( = ?auto_177170 ?auto_177174 ) ) ( ON ?auto_177169 ?auto_177170 ) ( ON-TABLE ?auto_177171 ) ( ON ?auto_177172 ?auto_177171 ) ( ON ?auto_177173 ?auto_177172 ) ( ON ?auto_177175 ?auto_177173 ) ( ON ?auto_177174 ?auto_177175 ) ( not ( = ?auto_177171 ?auto_177172 ) ) ( not ( = ?auto_177171 ?auto_177173 ) ) ( not ( = ?auto_177171 ?auto_177175 ) ) ( not ( = ?auto_177171 ?auto_177174 ) ) ( not ( = ?auto_177171 ?auto_177170 ) ) ( not ( = ?auto_177171 ?auto_177169 ) ) ( not ( = ?auto_177172 ?auto_177173 ) ) ( not ( = ?auto_177172 ?auto_177175 ) ) ( not ( = ?auto_177172 ?auto_177174 ) ) ( not ( = ?auto_177172 ?auto_177170 ) ) ( not ( = ?auto_177172 ?auto_177169 ) ) ( not ( = ?auto_177173 ?auto_177175 ) ) ( not ( = ?auto_177173 ?auto_177174 ) ) ( not ( = ?auto_177173 ?auto_177170 ) ) ( not ( = ?auto_177173 ?auto_177169 ) ) ( not ( = ?auto_177175 ?auto_177174 ) ) ( not ( = ?auto_177175 ?auto_177170 ) ) ( not ( = ?auto_177175 ?auto_177169 ) ) ( not ( = ?auto_177167 ?auto_177171 ) ) ( not ( = ?auto_177167 ?auto_177172 ) ) ( not ( = ?auto_177167 ?auto_177173 ) ) ( not ( = ?auto_177167 ?auto_177175 ) ) ( not ( = ?auto_177168 ?auto_177171 ) ) ( not ( = ?auto_177168 ?auto_177172 ) ) ( not ( = ?auto_177168 ?auto_177173 ) ) ( not ( = ?auto_177168 ?auto_177175 ) ) ( ON ?auto_177168 ?auto_177169 ) ( CLEAR ?auto_177168 ) ( HOLDING ?auto_177167 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177167 )
      ( MAKE-4PILE ?auto_177167 ?auto_177168 ?auto_177169 ?auto_177170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177176 - BLOCK
      ?auto_177177 - BLOCK
      ?auto_177178 - BLOCK
      ?auto_177179 - BLOCK
    )
    :vars
    (
      ?auto_177181 - BLOCK
      ?auto_177183 - BLOCK
      ?auto_177180 - BLOCK
      ?auto_177184 - BLOCK
      ?auto_177182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177176 ?auto_177177 ) ) ( not ( = ?auto_177176 ?auto_177178 ) ) ( not ( = ?auto_177176 ?auto_177179 ) ) ( not ( = ?auto_177177 ?auto_177178 ) ) ( not ( = ?auto_177177 ?auto_177179 ) ) ( not ( = ?auto_177178 ?auto_177179 ) ) ( ON ?auto_177179 ?auto_177181 ) ( not ( = ?auto_177176 ?auto_177181 ) ) ( not ( = ?auto_177177 ?auto_177181 ) ) ( not ( = ?auto_177178 ?auto_177181 ) ) ( not ( = ?auto_177179 ?auto_177181 ) ) ( ON ?auto_177178 ?auto_177179 ) ( ON-TABLE ?auto_177183 ) ( ON ?auto_177180 ?auto_177183 ) ( ON ?auto_177184 ?auto_177180 ) ( ON ?auto_177182 ?auto_177184 ) ( ON ?auto_177181 ?auto_177182 ) ( not ( = ?auto_177183 ?auto_177180 ) ) ( not ( = ?auto_177183 ?auto_177184 ) ) ( not ( = ?auto_177183 ?auto_177182 ) ) ( not ( = ?auto_177183 ?auto_177181 ) ) ( not ( = ?auto_177183 ?auto_177179 ) ) ( not ( = ?auto_177183 ?auto_177178 ) ) ( not ( = ?auto_177180 ?auto_177184 ) ) ( not ( = ?auto_177180 ?auto_177182 ) ) ( not ( = ?auto_177180 ?auto_177181 ) ) ( not ( = ?auto_177180 ?auto_177179 ) ) ( not ( = ?auto_177180 ?auto_177178 ) ) ( not ( = ?auto_177184 ?auto_177182 ) ) ( not ( = ?auto_177184 ?auto_177181 ) ) ( not ( = ?auto_177184 ?auto_177179 ) ) ( not ( = ?auto_177184 ?auto_177178 ) ) ( not ( = ?auto_177182 ?auto_177181 ) ) ( not ( = ?auto_177182 ?auto_177179 ) ) ( not ( = ?auto_177182 ?auto_177178 ) ) ( not ( = ?auto_177176 ?auto_177183 ) ) ( not ( = ?auto_177176 ?auto_177180 ) ) ( not ( = ?auto_177176 ?auto_177184 ) ) ( not ( = ?auto_177176 ?auto_177182 ) ) ( not ( = ?auto_177177 ?auto_177183 ) ) ( not ( = ?auto_177177 ?auto_177180 ) ) ( not ( = ?auto_177177 ?auto_177184 ) ) ( not ( = ?auto_177177 ?auto_177182 ) ) ( ON ?auto_177177 ?auto_177178 ) ( ON ?auto_177176 ?auto_177177 ) ( CLEAR ?auto_177176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177183 ?auto_177180 ?auto_177184 ?auto_177182 ?auto_177181 ?auto_177179 ?auto_177178 ?auto_177177 )
      ( MAKE-4PILE ?auto_177176 ?auto_177177 ?auto_177178 ?auto_177179 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177189 - BLOCK
      ?auto_177190 - BLOCK
      ?auto_177191 - BLOCK
      ?auto_177192 - BLOCK
    )
    :vars
    (
      ?auto_177193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177193 ?auto_177192 ) ( CLEAR ?auto_177193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177189 ) ( ON ?auto_177190 ?auto_177189 ) ( ON ?auto_177191 ?auto_177190 ) ( ON ?auto_177192 ?auto_177191 ) ( not ( = ?auto_177189 ?auto_177190 ) ) ( not ( = ?auto_177189 ?auto_177191 ) ) ( not ( = ?auto_177189 ?auto_177192 ) ) ( not ( = ?auto_177189 ?auto_177193 ) ) ( not ( = ?auto_177190 ?auto_177191 ) ) ( not ( = ?auto_177190 ?auto_177192 ) ) ( not ( = ?auto_177190 ?auto_177193 ) ) ( not ( = ?auto_177191 ?auto_177192 ) ) ( not ( = ?auto_177191 ?auto_177193 ) ) ( not ( = ?auto_177192 ?auto_177193 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177193 ?auto_177192 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177194 - BLOCK
      ?auto_177195 - BLOCK
      ?auto_177196 - BLOCK
      ?auto_177197 - BLOCK
    )
    :vars
    (
      ?auto_177198 - BLOCK
      ?auto_177199 - BLOCK
      ?auto_177200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177198 ?auto_177197 ) ( CLEAR ?auto_177198 ) ( ON-TABLE ?auto_177194 ) ( ON ?auto_177195 ?auto_177194 ) ( ON ?auto_177196 ?auto_177195 ) ( ON ?auto_177197 ?auto_177196 ) ( not ( = ?auto_177194 ?auto_177195 ) ) ( not ( = ?auto_177194 ?auto_177196 ) ) ( not ( = ?auto_177194 ?auto_177197 ) ) ( not ( = ?auto_177194 ?auto_177198 ) ) ( not ( = ?auto_177195 ?auto_177196 ) ) ( not ( = ?auto_177195 ?auto_177197 ) ) ( not ( = ?auto_177195 ?auto_177198 ) ) ( not ( = ?auto_177196 ?auto_177197 ) ) ( not ( = ?auto_177196 ?auto_177198 ) ) ( not ( = ?auto_177197 ?auto_177198 ) ) ( HOLDING ?auto_177199 ) ( CLEAR ?auto_177200 ) ( not ( = ?auto_177194 ?auto_177199 ) ) ( not ( = ?auto_177194 ?auto_177200 ) ) ( not ( = ?auto_177195 ?auto_177199 ) ) ( not ( = ?auto_177195 ?auto_177200 ) ) ( not ( = ?auto_177196 ?auto_177199 ) ) ( not ( = ?auto_177196 ?auto_177200 ) ) ( not ( = ?auto_177197 ?auto_177199 ) ) ( not ( = ?auto_177197 ?auto_177200 ) ) ( not ( = ?auto_177198 ?auto_177199 ) ) ( not ( = ?auto_177198 ?auto_177200 ) ) ( not ( = ?auto_177199 ?auto_177200 ) ) )
    :subtasks
    ( ( !STACK ?auto_177199 ?auto_177200 )
      ( MAKE-4PILE ?auto_177194 ?auto_177195 ?auto_177196 ?auto_177197 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177201 - BLOCK
      ?auto_177202 - BLOCK
      ?auto_177203 - BLOCK
      ?auto_177204 - BLOCK
    )
    :vars
    (
      ?auto_177206 - BLOCK
      ?auto_177205 - BLOCK
      ?auto_177207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177206 ?auto_177204 ) ( ON-TABLE ?auto_177201 ) ( ON ?auto_177202 ?auto_177201 ) ( ON ?auto_177203 ?auto_177202 ) ( ON ?auto_177204 ?auto_177203 ) ( not ( = ?auto_177201 ?auto_177202 ) ) ( not ( = ?auto_177201 ?auto_177203 ) ) ( not ( = ?auto_177201 ?auto_177204 ) ) ( not ( = ?auto_177201 ?auto_177206 ) ) ( not ( = ?auto_177202 ?auto_177203 ) ) ( not ( = ?auto_177202 ?auto_177204 ) ) ( not ( = ?auto_177202 ?auto_177206 ) ) ( not ( = ?auto_177203 ?auto_177204 ) ) ( not ( = ?auto_177203 ?auto_177206 ) ) ( not ( = ?auto_177204 ?auto_177206 ) ) ( CLEAR ?auto_177205 ) ( not ( = ?auto_177201 ?auto_177207 ) ) ( not ( = ?auto_177201 ?auto_177205 ) ) ( not ( = ?auto_177202 ?auto_177207 ) ) ( not ( = ?auto_177202 ?auto_177205 ) ) ( not ( = ?auto_177203 ?auto_177207 ) ) ( not ( = ?auto_177203 ?auto_177205 ) ) ( not ( = ?auto_177204 ?auto_177207 ) ) ( not ( = ?auto_177204 ?auto_177205 ) ) ( not ( = ?auto_177206 ?auto_177207 ) ) ( not ( = ?auto_177206 ?auto_177205 ) ) ( not ( = ?auto_177207 ?auto_177205 ) ) ( ON ?auto_177207 ?auto_177206 ) ( CLEAR ?auto_177207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177201 ?auto_177202 ?auto_177203 ?auto_177204 ?auto_177206 )
      ( MAKE-4PILE ?auto_177201 ?auto_177202 ?auto_177203 ?auto_177204 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177208 - BLOCK
      ?auto_177209 - BLOCK
      ?auto_177210 - BLOCK
      ?auto_177211 - BLOCK
    )
    :vars
    (
      ?auto_177213 - BLOCK
      ?auto_177214 - BLOCK
      ?auto_177212 - BLOCK
      ?auto_177215 - BLOCK
      ?auto_177216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177213 ?auto_177211 ) ( ON-TABLE ?auto_177208 ) ( ON ?auto_177209 ?auto_177208 ) ( ON ?auto_177210 ?auto_177209 ) ( ON ?auto_177211 ?auto_177210 ) ( not ( = ?auto_177208 ?auto_177209 ) ) ( not ( = ?auto_177208 ?auto_177210 ) ) ( not ( = ?auto_177208 ?auto_177211 ) ) ( not ( = ?auto_177208 ?auto_177213 ) ) ( not ( = ?auto_177209 ?auto_177210 ) ) ( not ( = ?auto_177209 ?auto_177211 ) ) ( not ( = ?auto_177209 ?auto_177213 ) ) ( not ( = ?auto_177210 ?auto_177211 ) ) ( not ( = ?auto_177210 ?auto_177213 ) ) ( not ( = ?auto_177211 ?auto_177213 ) ) ( not ( = ?auto_177208 ?auto_177214 ) ) ( not ( = ?auto_177208 ?auto_177212 ) ) ( not ( = ?auto_177209 ?auto_177214 ) ) ( not ( = ?auto_177209 ?auto_177212 ) ) ( not ( = ?auto_177210 ?auto_177214 ) ) ( not ( = ?auto_177210 ?auto_177212 ) ) ( not ( = ?auto_177211 ?auto_177214 ) ) ( not ( = ?auto_177211 ?auto_177212 ) ) ( not ( = ?auto_177213 ?auto_177214 ) ) ( not ( = ?auto_177213 ?auto_177212 ) ) ( not ( = ?auto_177214 ?auto_177212 ) ) ( ON ?auto_177214 ?auto_177213 ) ( CLEAR ?auto_177214 ) ( HOLDING ?auto_177212 ) ( CLEAR ?auto_177215 ) ( ON-TABLE ?auto_177216 ) ( ON ?auto_177215 ?auto_177216 ) ( not ( = ?auto_177216 ?auto_177215 ) ) ( not ( = ?auto_177216 ?auto_177212 ) ) ( not ( = ?auto_177215 ?auto_177212 ) ) ( not ( = ?auto_177208 ?auto_177215 ) ) ( not ( = ?auto_177208 ?auto_177216 ) ) ( not ( = ?auto_177209 ?auto_177215 ) ) ( not ( = ?auto_177209 ?auto_177216 ) ) ( not ( = ?auto_177210 ?auto_177215 ) ) ( not ( = ?auto_177210 ?auto_177216 ) ) ( not ( = ?auto_177211 ?auto_177215 ) ) ( not ( = ?auto_177211 ?auto_177216 ) ) ( not ( = ?auto_177213 ?auto_177215 ) ) ( not ( = ?auto_177213 ?auto_177216 ) ) ( not ( = ?auto_177214 ?auto_177215 ) ) ( not ( = ?auto_177214 ?auto_177216 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177216 ?auto_177215 ?auto_177212 )
      ( MAKE-4PILE ?auto_177208 ?auto_177209 ?auto_177210 ?auto_177211 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177217 - BLOCK
      ?auto_177218 - BLOCK
      ?auto_177219 - BLOCK
      ?auto_177220 - BLOCK
    )
    :vars
    (
      ?auto_177222 - BLOCK
      ?auto_177224 - BLOCK
      ?auto_177223 - BLOCK
      ?auto_177225 - BLOCK
      ?auto_177221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177222 ?auto_177220 ) ( ON-TABLE ?auto_177217 ) ( ON ?auto_177218 ?auto_177217 ) ( ON ?auto_177219 ?auto_177218 ) ( ON ?auto_177220 ?auto_177219 ) ( not ( = ?auto_177217 ?auto_177218 ) ) ( not ( = ?auto_177217 ?auto_177219 ) ) ( not ( = ?auto_177217 ?auto_177220 ) ) ( not ( = ?auto_177217 ?auto_177222 ) ) ( not ( = ?auto_177218 ?auto_177219 ) ) ( not ( = ?auto_177218 ?auto_177220 ) ) ( not ( = ?auto_177218 ?auto_177222 ) ) ( not ( = ?auto_177219 ?auto_177220 ) ) ( not ( = ?auto_177219 ?auto_177222 ) ) ( not ( = ?auto_177220 ?auto_177222 ) ) ( not ( = ?auto_177217 ?auto_177224 ) ) ( not ( = ?auto_177217 ?auto_177223 ) ) ( not ( = ?auto_177218 ?auto_177224 ) ) ( not ( = ?auto_177218 ?auto_177223 ) ) ( not ( = ?auto_177219 ?auto_177224 ) ) ( not ( = ?auto_177219 ?auto_177223 ) ) ( not ( = ?auto_177220 ?auto_177224 ) ) ( not ( = ?auto_177220 ?auto_177223 ) ) ( not ( = ?auto_177222 ?auto_177224 ) ) ( not ( = ?auto_177222 ?auto_177223 ) ) ( not ( = ?auto_177224 ?auto_177223 ) ) ( ON ?auto_177224 ?auto_177222 ) ( CLEAR ?auto_177225 ) ( ON-TABLE ?auto_177221 ) ( ON ?auto_177225 ?auto_177221 ) ( not ( = ?auto_177221 ?auto_177225 ) ) ( not ( = ?auto_177221 ?auto_177223 ) ) ( not ( = ?auto_177225 ?auto_177223 ) ) ( not ( = ?auto_177217 ?auto_177225 ) ) ( not ( = ?auto_177217 ?auto_177221 ) ) ( not ( = ?auto_177218 ?auto_177225 ) ) ( not ( = ?auto_177218 ?auto_177221 ) ) ( not ( = ?auto_177219 ?auto_177225 ) ) ( not ( = ?auto_177219 ?auto_177221 ) ) ( not ( = ?auto_177220 ?auto_177225 ) ) ( not ( = ?auto_177220 ?auto_177221 ) ) ( not ( = ?auto_177222 ?auto_177225 ) ) ( not ( = ?auto_177222 ?auto_177221 ) ) ( not ( = ?auto_177224 ?auto_177225 ) ) ( not ( = ?auto_177224 ?auto_177221 ) ) ( ON ?auto_177223 ?auto_177224 ) ( CLEAR ?auto_177223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177217 ?auto_177218 ?auto_177219 ?auto_177220 ?auto_177222 ?auto_177224 )
      ( MAKE-4PILE ?auto_177217 ?auto_177218 ?auto_177219 ?auto_177220 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177226 - BLOCK
      ?auto_177227 - BLOCK
      ?auto_177228 - BLOCK
      ?auto_177229 - BLOCK
    )
    :vars
    (
      ?auto_177232 - BLOCK
      ?auto_177234 - BLOCK
      ?auto_177233 - BLOCK
      ?auto_177230 - BLOCK
      ?auto_177231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177232 ?auto_177229 ) ( ON-TABLE ?auto_177226 ) ( ON ?auto_177227 ?auto_177226 ) ( ON ?auto_177228 ?auto_177227 ) ( ON ?auto_177229 ?auto_177228 ) ( not ( = ?auto_177226 ?auto_177227 ) ) ( not ( = ?auto_177226 ?auto_177228 ) ) ( not ( = ?auto_177226 ?auto_177229 ) ) ( not ( = ?auto_177226 ?auto_177232 ) ) ( not ( = ?auto_177227 ?auto_177228 ) ) ( not ( = ?auto_177227 ?auto_177229 ) ) ( not ( = ?auto_177227 ?auto_177232 ) ) ( not ( = ?auto_177228 ?auto_177229 ) ) ( not ( = ?auto_177228 ?auto_177232 ) ) ( not ( = ?auto_177229 ?auto_177232 ) ) ( not ( = ?auto_177226 ?auto_177234 ) ) ( not ( = ?auto_177226 ?auto_177233 ) ) ( not ( = ?auto_177227 ?auto_177234 ) ) ( not ( = ?auto_177227 ?auto_177233 ) ) ( not ( = ?auto_177228 ?auto_177234 ) ) ( not ( = ?auto_177228 ?auto_177233 ) ) ( not ( = ?auto_177229 ?auto_177234 ) ) ( not ( = ?auto_177229 ?auto_177233 ) ) ( not ( = ?auto_177232 ?auto_177234 ) ) ( not ( = ?auto_177232 ?auto_177233 ) ) ( not ( = ?auto_177234 ?auto_177233 ) ) ( ON ?auto_177234 ?auto_177232 ) ( ON-TABLE ?auto_177230 ) ( not ( = ?auto_177230 ?auto_177231 ) ) ( not ( = ?auto_177230 ?auto_177233 ) ) ( not ( = ?auto_177231 ?auto_177233 ) ) ( not ( = ?auto_177226 ?auto_177231 ) ) ( not ( = ?auto_177226 ?auto_177230 ) ) ( not ( = ?auto_177227 ?auto_177231 ) ) ( not ( = ?auto_177227 ?auto_177230 ) ) ( not ( = ?auto_177228 ?auto_177231 ) ) ( not ( = ?auto_177228 ?auto_177230 ) ) ( not ( = ?auto_177229 ?auto_177231 ) ) ( not ( = ?auto_177229 ?auto_177230 ) ) ( not ( = ?auto_177232 ?auto_177231 ) ) ( not ( = ?auto_177232 ?auto_177230 ) ) ( not ( = ?auto_177234 ?auto_177231 ) ) ( not ( = ?auto_177234 ?auto_177230 ) ) ( ON ?auto_177233 ?auto_177234 ) ( CLEAR ?auto_177233 ) ( HOLDING ?auto_177231 ) ( CLEAR ?auto_177230 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177230 ?auto_177231 )
      ( MAKE-4PILE ?auto_177226 ?auto_177227 ?auto_177228 ?auto_177229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_178928 - BLOCK
      ?auto_178929 - BLOCK
      ?auto_178930 - BLOCK
      ?auto_178931 - BLOCK
    )
    :vars
    (
      ?auto_178934 - BLOCK
      ?auto_178933 - BLOCK
      ?auto_178932 - BLOCK
      ?auto_178935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178934 ?auto_178931 ) ( ON-TABLE ?auto_178928 ) ( ON ?auto_178929 ?auto_178928 ) ( ON ?auto_178930 ?auto_178929 ) ( ON ?auto_178931 ?auto_178930 ) ( not ( = ?auto_178928 ?auto_178929 ) ) ( not ( = ?auto_178928 ?auto_178930 ) ) ( not ( = ?auto_178928 ?auto_178931 ) ) ( not ( = ?auto_178928 ?auto_178934 ) ) ( not ( = ?auto_178929 ?auto_178930 ) ) ( not ( = ?auto_178929 ?auto_178931 ) ) ( not ( = ?auto_178929 ?auto_178934 ) ) ( not ( = ?auto_178930 ?auto_178931 ) ) ( not ( = ?auto_178930 ?auto_178934 ) ) ( not ( = ?auto_178931 ?auto_178934 ) ) ( not ( = ?auto_178928 ?auto_178933 ) ) ( not ( = ?auto_178928 ?auto_178932 ) ) ( not ( = ?auto_178929 ?auto_178933 ) ) ( not ( = ?auto_178929 ?auto_178932 ) ) ( not ( = ?auto_178930 ?auto_178933 ) ) ( not ( = ?auto_178930 ?auto_178932 ) ) ( not ( = ?auto_178931 ?auto_178933 ) ) ( not ( = ?auto_178931 ?auto_178932 ) ) ( not ( = ?auto_178934 ?auto_178933 ) ) ( not ( = ?auto_178934 ?auto_178932 ) ) ( not ( = ?auto_178933 ?auto_178932 ) ) ( ON ?auto_178933 ?auto_178934 ) ( not ( = ?auto_178935 ?auto_178932 ) ) ( not ( = ?auto_178928 ?auto_178935 ) ) ( not ( = ?auto_178929 ?auto_178935 ) ) ( not ( = ?auto_178930 ?auto_178935 ) ) ( not ( = ?auto_178931 ?auto_178935 ) ) ( not ( = ?auto_178934 ?auto_178935 ) ) ( not ( = ?auto_178933 ?auto_178935 ) ) ( ON ?auto_178932 ?auto_178933 ) ( ON ?auto_178935 ?auto_178932 ) ( CLEAR ?auto_178935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178928 ?auto_178929 ?auto_178930 ?auto_178931 ?auto_178934 ?auto_178933 ?auto_178932 )
      ( MAKE-4PILE ?auto_178928 ?auto_178929 ?auto_178930 ?auto_178931 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177244 - BLOCK
      ?auto_177245 - BLOCK
      ?auto_177246 - BLOCK
      ?auto_177247 - BLOCK
    )
    :vars
    (
      ?auto_177249 - BLOCK
      ?auto_177250 - BLOCK
      ?auto_177252 - BLOCK
      ?auto_177251 - BLOCK
      ?auto_177248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177249 ?auto_177247 ) ( ON-TABLE ?auto_177244 ) ( ON ?auto_177245 ?auto_177244 ) ( ON ?auto_177246 ?auto_177245 ) ( ON ?auto_177247 ?auto_177246 ) ( not ( = ?auto_177244 ?auto_177245 ) ) ( not ( = ?auto_177244 ?auto_177246 ) ) ( not ( = ?auto_177244 ?auto_177247 ) ) ( not ( = ?auto_177244 ?auto_177249 ) ) ( not ( = ?auto_177245 ?auto_177246 ) ) ( not ( = ?auto_177245 ?auto_177247 ) ) ( not ( = ?auto_177245 ?auto_177249 ) ) ( not ( = ?auto_177246 ?auto_177247 ) ) ( not ( = ?auto_177246 ?auto_177249 ) ) ( not ( = ?auto_177247 ?auto_177249 ) ) ( not ( = ?auto_177244 ?auto_177250 ) ) ( not ( = ?auto_177244 ?auto_177252 ) ) ( not ( = ?auto_177245 ?auto_177250 ) ) ( not ( = ?auto_177245 ?auto_177252 ) ) ( not ( = ?auto_177246 ?auto_177250 ) ) ( not ( = ?auto_177246 ?auto_177252 ) ) ( not ( = ?auto_177247 ?auto_177250 ) ) ( not ( = ?auto_177247 ?auto_177252 ) ) ( not ( = ?auto_177249 ?auto_177250 ) ) ( not ( = ?auto_177249 ?auto_177252 ) ) ( not ( = ?auto_177250 ?auto_177252 ) ) ( ON ?auto_177250 ?auto_177249 ) ( not ( = ?auto_177251 ?auto_177248 ) ) ( not ( = ?auto_177251 ?auto_177252 ) ) ( not ( = ?auto_177248 ?auto_177252 ) ) ( not ( = ?auto_177244 ?auto_177248 ) ) ( not ( = ?auto_177244 ?auto_177251 ) ) ( not ( = ?auto_177245 ?auto_177248 ) ) ( not ( = ?auto_177245 ?auto_177251 ) ) ( not ( = ?auto_177246 ?auto_177248 ) ) ( not ( = ?auto_177246 ?auto_177251 ) ) ( not ( = ?auto_177247 ?auto_177248 ) ) ( not ( = ?auto_177247 ?auto_177251 ) ) ( not ( = ?auto_177249 ?auto_177248 ) ) ( not ( = ?auto_177249 ?auto_177251 ) ) ( not ( = ?auto_177250 ?auto_177248 ) ) ( not ( = ?auto_177250 ?auto_177251 ) ) ( ON ?auto_177252 ?auto_177250 ) ( ON ?auto_177248 ?auto_177252 ) ( CLEAR ?auto_177248 ) ( HOLDING ?auto_177251 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177251 )
      ( MAKE-4PILE ?auto_177244 ?auto_177245 ?auto_177246 ?auto_177247 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177253 - BLOCK
      ?auto_177254 - BLOCK
      ?auto_177255 - BLOCK
      ?auto_177256 - BLOCK
    )
    :vars
    (
      ?auto_177261 - BLOCK
      ?auto_177257 - BLOCK
      ?auto_177259 - BLOCK
      ?auto_177258 - BLOCK
      ?auto_177260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177261 ?auto_177256 ) ( ON-TABLE ?auto_177253 ) ( ON ?auto_177254 ?auto_177253 ) ( ON ?auto_177255 ?auto_177254 ) ( ON ?auto_177256 ?auto_177255 ) ( not ( = ?auto_177253 ?auto_177254 ) ) ( not ( = ?auto_177253 ?auto_177255 ) ) ( not ( = ?auto_177253 ?auto_177256 ) ) ( not ( = ?auto_177253 ?auto_177261 ) ) ( not ( = ?auto_177254 ?auto_177255 ) ) ( not ( = ?auto_177254 ?auto_177256 ) ) ( not ( = ?auto_177254 ?auto_177261 ) ) ( not ( = ?auto_177255 ?auto_177256 ) ) ( not ( = ?auto_177255 ?auto_177261 ) ) ( not ( = ?auto_177256 ?auto_177261 ) ) ( not ( = ?auto_177253 ?auto_177257 ) ) ( not ( = ?auto_177253 ?auto_177259 ) ) ( not ( = ?auto_177254 ?auto_177257 ) ) ( not ( = ?auto_177254 ?auto_177259 ) ) ( not ( = ?auto_177255 ?auto_177257 ) ) ( not ( = ?auto_177255 ?auto_177259 ) ) ( not ( = ?auto_177256 ?auto_177257 ) ) ( not ( = ?auto_177256 ?auto_177259 ) ) ( not ( = ?auto_177261 ?auto_177257 ) ) ( not ( = ?auto_177261 ?auto_177259 ) ) ( not ( = ?auto_177257 ?auto_177259 ) ) ( ON ?auto_177257 ?auto_177261 ) ( not ( = ?auto_177258 ?auto_177260 ) ) ( not ( = ?auto_177258 ?auto_177259 ) ) ( not ( = ?auto_177260 ?auto_177259 ) ) ( not ( = ?auto_177253 ?auto_177260 ) ) ( not ( = ?auto_177253 ?auto_177258 ) ) ( not ( = ?auto_177254 ?auto_177260 ) ) ( not ( = ?auto_177254 ?auto_177258 ) ) ( not ( = ?auto_177255 ?auto_177260 ) ) ( not ( = ?auto_177255 ?auto_177258 ) ) ( not ( = ?auto_177256 ?auto_177260 ) ) ( not ( = ?auto_177256 ?auto_177258 ) ) ( not ( = ?auto_177261 ?auto_177260 ) ) ( not ( = ?auto_177261 ?auto_177258 ) ) ( not ( = ?auto_177257 ?auto_177260 ) ) ( not ( = ?auto_177257 ?auto_177258 ) ) ( ON ?auto_177259 ?auto_177257 ) ( ON ?auto_177260 ?auto_177259 ) ( ON ?auto_177258 ?auto_177260 ) ( CLEAR ?auto_177258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177253 ?auto_177254 ?auto_177255 ?auto_177256 ?auto_177261 ?auto_177257 ?auto_177259 ?auto_177260 )
      ( MAKE-4PILE ?auto_177253 ?auto_177254 ?auto_177255 ?auto_177256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177267 - BLOCK
      ?auto_177268 - BLOCK
      ?auto_177269 - BLOCK
      ?auto_177270 - BLOCK
      ?auto_177271 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_177271 ) ( CLEAR ?auto_177270 ) ( ON-TABLE ?auto_177267 ) ( ON ?auto_177268 ?auto_177267 ) ( ON ?auto_177269 ?auto_177268 ) ( ON ?auto_177270 ?auto_177269 ) ( not ( = ?auto_177267 ?auto_177268 ) ) ( not ( = ?auto_177267 ?auto_177269 ) ) ( not ( = ?auto_177267 ?auto_177270 ) ) ( not ( = ?auto_177267 ?auto_177271 ) ) ( not ( = ?auto_177268 ?auto_177269 ) ) ( not ( = ?auto_177268 ?auto_177270 ) ) ( not ( = ?auto_177268 ?auto_177271 ) ) ( not ( = ?auto_177269 ?auto_177270 ) ) ( not ( = ?auto_177269 ?auto_177271 ) ) ( not ( = ?auto_177270 ?auto_177271 ) ) )
    :subtasks
    ( ( !STACK ?auto_177271 ?auto_177270 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177272 - BLOCK
      ?auto_177273 - BLOCK
      ?auto_177274 - BLOCK
      ?auto_177275 - BLOCK
      ?auto_177276 - BLOCK
    )
    :vars
    (
      ?auto_177277 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177275 ) ( ON-TABLE ?auto_177272 ) ( ON ?auto_177273 ?auto_177272 ) ( ON ?auto_177274 ?auto_177273 ) ( ON ?auto_177275 ?auto_177274 ) ( not ( = ?auto_177272 ?auto_177273 ) ) ( not ( = ?auto_177272 ?auto_177274 ) ) ( not ( = ?auto_177272 ?auto_177275 ) ) ( not ( = ?auto_177272 ?auto_177276 ) ) ( not ( = ?auto_177273 ?auto_177274 ) ) ( not ( = ?auto_177273 ?auto_177275 ) ) ( not ( = ?auto_177273 ?auto_177276 ) ) ( not ( = ?auto_177274 ?auto_177275 ) ) ( not ( = ?auto_177274 ?auto_177276 ) ) ( not ( = ?auto_177275 ?auto_177276 ) ) ( ON ?auto_177276 ?auto_177277 ) ( CLEAR ?auto_177276 ) ( HAND-EMPTY ) ( not ( = ?auto_177272 ?auto_177277 ) ) ( not ( = ?auto_177273 ?auto_177277 ) ) ( not ( = ?auto_177274 ?auto_177277 ) ) ( not ( = ?auto_177275 ?auto_177277 ) ) ( not ( = ?auto_177276 ?auto_177277 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177276 ?auto_177277 )
      ( MAKE-5PILE ?auto_177272 ?auto_177273 ?auto_177274 ?auto_177275 ?auto_177276 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177278 - BLOCK
      ?auto_177279 - BLOCK
      ?auto_177280 - BLOCK
      ?auto_177281 - BLOCK
      ?auto_177282 - BLOCK
    )
    :vars
    (
      ?auto_177283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177278 ) ( ON ?auto_177279 ?auto_177278 ) ( ON ?auto_177280 ?auto_177279 ) ( not ( = ?auto_177278 ?auto_177279 ) ) ( not ( = ?auto_177278 ?auto_177280 ) ) ( not ( = ?auto_177278 ?auto_177281 ) ) ( not ( = ?auto_177278 ?auto_177282 ) ) ( not ( = ?auto_177279 ?auto_177280 ) ) ( not ( = ?auto_177279 ?auto_177281 ) ) ( not ( = ?auto_177279 ?auto_177282 ) ) ( not ( = ?auto_177280 ?auto_177281 ) ) ( not ( = ?auto_177280 ?auto_177282 ) ) ( not ( = ?auto_177281 ?auto_177282 ) ) ( ON ?auto_177282 ?auto_177283 ) ( CLEAR ?auto_177282 ) ( not ( = ?auto_177278 ?auto_177283 ) ) ( not ( = ?auto_177279 ?auto_177283 ) ) ( not ( = ?auto_177280 ?auto_177283 ) ) ( not ( = ?auto_177281 ?auto_177283 ) ) ( not ( = ?auto_177282 ?auto_177283 ) ) ( HOLDING ?auto_177281 ) ( CLEAR ?auto_177280 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177278 ?auto_177279 ?auto_177280 ?auto_177281 )
      ( MAKE-5PILE ?auto_177278 ?auto_177279 ?auto_177280 ?auto_177281 ?auto_177282 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177284 - BLOCK
      ?auto_177285 - BLOCK
      ?auto_177286 - BLOCK
      ?auto_177287 - BLOCK
      ?auto_177288 - BLOCK
    )
    :vars
    (
      ?auto_177289 - BLOCK
      ?auto_177292 - BLOCK
      ?auto_177291 - BLOCK
      ?auto_177290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177284 ) ( ON ?auto_177285 ?auto_177284 ) ( ON ?auto_177286 ?auto_177285 ) ( not ( = ?auto_177284 ?auto_177285 ) ) ( not ( = ?auto_177284 ?auto_177286 ) ) ( not ( = ?auto_177284 ?auto_177287 ) ) ( not ( = ?auto_177284 ?auto_177288 ) ) ( not ( = ?auto_177285 ?auto_177286 ) ) ( not ( = ?auto_177285 ?auto_177287 ) ) ( not ( = ?auto_177285 ?auto_177288 ) ) ( not ( = ?auto_177286 ?auto_177287 ) ) ( not ( = ?auto_177286 ?auto_177288 ) ) ( not ( = ?auto_177287 ?auto_177288 ) ) ( ON ?auto_177288 ?auto_177289 ) ( not ( = ?auto_177284 ?auto_177289 ) ) ( not ( = ?auto_177285 ?auto_177289 ) ) ( not ( = ?auto_177286 ?auto_177289 ) ) ( not ( = ?auto_177287 ?auto_177289 ) ) ( not ( = ?auto_177288 ?auto_177289 ) ) ( CLEAR ?auto_177286 ) ( ON ?auto_177287 ?auto_177288 ) ( CLEAR ?auto_177287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177292 ) ( ON ?auto_177291 ?auto_177292 ) ( ON ?auto_177290 ?auto_177291 ) ( ON ?auto_177289 ?auto_177290 ) ( not ( = ?auto_177292 ?auto_177291 ) ) ( not ( = ?auto_177292 ?auto_177290 ) ) ( not ( = ?auto_177292 ?auto_177289 ) ) ( not ( = ?auto_177292 ?auto_177288 ) ) ( not ( = ?auto_177292 ?auto_177287 ) ) ( not ( = ?auto_177291 ?auto_177290 ) ) ( not ( = ?auto_177291 ?auto_177289 ) ) ( not ( = ?auto_177291 ?auto_177288 ) ) ( not ( = ?auto_177291 ?auto_177287 ) ) ( not ( = ?auto_177290 ?auto_177289 ) ) ( not ( = ?auto_177290 ?auto_177288 ) ) ( not ( = ?auto_177290 ?auto_177287 ) ) ( not ( = ?auto_177284 ?auto_177292 ) ) ( not ( = ?auto_177284 ?auto_177291 ) ) ( not ( = ?auto_177284 ?auto_177290 ) ) ( not ( = ?auto_177285 ?auto_177292 ) ) ( not ( = ?auto_177285 ?auto_177291 ) ) ( not ( = ?auto_177285 ?auto_177290 ) ) ( not ( = ?auto_177286 ?auto_177292 ) ) ( not ( = ?auto_177286 ?auto_177291 ) ) ( not ( = ?auto_177286 ?auto_177290 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177292 ?auto_177291 ?auto_177290 ?auto_177289 ?auto_177288 )
      ( MAKE-5PILE ?auto_177284 ?auto_177285 ?auto_177286 ?auto_177287 ?auto_177288 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177293 - BLOCK
      ?auto_177294 - BLOCK
      ?auto_177295 - BLOCK
      ?auto_177296 - BLOCK
      ?auto_177297 - BLOCK
    )
    :vars
    (
      ?auto_177301 - BLOCK
      ?auto_177298 - BLOCK
      ?auto_177300 - BLOCK
      ?auto_177299 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177293 ) ( ON ?auto_177294 ?auto_177293 ) ( not ( = ?auto_177293 ?auto_177294 ) ) ( not ( = ?auto_177293 ?auto_177295 ) ) ( not ( = ?auto_177293 ?auto_177296 ) ) ( not ( = ?auto_177293 ?auto_177297 ) ) ( not ( = ?auto_177294 ?auto_177295 ) ) ( not ( = ?auto_177294 ?auto_177296 ) ) ( not ( = ?auto_177294 ?auto_177297 ) ) ( not ( = ?auto_177295 ?auto_177296 ) ) ( not ( = ?auto_177295 ?auto_177297 ) ) ( not ( = ?auto_177296 ?auto_177297 ) ) ( ON ?auto_177297 ?auto_177301 ) ( not ( = ?auto_177293 ?auto_177301 ) ) ( not ( = ?auto_177294 ?auto_177301 ) ) ( not ( = ?auto_177295 ?auto_177301 ) ) ( not ( = ?auto_177296 ?auto_177301 ) ) ( not ( = ?auto_177297 ?auto_177301 ) ) ( ON ?auto_177296 ?auto_177297 ) ( CLEAR ?auto_177296 ) ( ON-TABLE ?auto_177298 ) ( ON ?auto_177300 ?auto_177298 ) ( ON ?auto_177299 ?auto_177300 ) ( ON ?auto_177301 ?auto_177299 ) ( not ( = ?auto_177298 ?auto_177300 ) ) ( not ( = ?auto_177298 ?auto_177299 ) ) ( not ( = ?auto_177298 ?auto_177301 ) ) ( not ( = ?auto_177298 ?auto_177297 ) ) ( not ( = ?auto_177298 ?auto_177296 ) ) ( not ( = ?auto_177300 ?auto_177299 ) ) ( not ( = ?auto_177300 ?auto_177301 ) ) ( not ( = ?auto_177300 ?auto_177297 ) ) ( not ( = ?auto_177300 ?auto_177296 ) ) ( not ( = ?auto_177299 ?auto_177301 ) ) ( not ( = ?auto_177299 ?auto_177297 ) ) ( not ( = ?auto_177299 ?auto_177296 ) ) ( not ( = ?auto_177293 ?auto_177298 ) ) ( not ( = ?auto_177293 ?auto_177300 ) ) ( not ( = ?auto_177293 ?auto_177299 ) ) ( not ( = ?auto_177294 ?auto_177298 ) ) ( not ( = ?auto_177294 ?auto_177300 ) ) ( not ( = ?auto_177294 ?auto_177299 ) ) ( not ( = ?auto_177295 ?auto_177298 ) ) ( not ( = ?auto_177295 ?auto_177300 ) ) ( not ( = ?auto_177295 ?auto_177299 ) ) ( HOLDING ?auto_177295 ) ( CLEAR ?auto_177294 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177293 ?auto_177294 ?auto_177295 )
      ( MAKE-5PILE ?auto_177293 ?auto_177294 ?auto_177295 ?auto_177296 ?auto_177297 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177302 - BLOCK
      ?auto_177303 - BLOCK
      ?auto_177304 - BLOCK
      ?auto_177305 - BLOCK
      ?auto_177306 - BLOCK
    )
    :vars
    (
      ?auto_177310 - BLOCK
      ?auto_177309 - BLOCK
      ?auto_177308 - BLOCK
      ?auto_177307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177302 ) ( ON ?auto_177303 ?auto_177302 ) ( not ( = ?auto_177302 ?auto_177303 ) ) ( not ( = ?auto_177302 ?auto_177304 ) ) ( not ( = ?auto_177302 ?auto_177305 ) ) ( not ( = ?auto_177302 ?auto_177306 ) ) ( not ( = ?auto_177303 ?auto_177304 ) ) ( not ( = ?auto_177303 ?auto_177305 ) ) ( not ( = ?auto_177303 ?auto_177306 ) ) ( not ( = ?auto_177304 ?auto_177305 ) ) ( not ( = ?auto_177304 ?auto_177306 ) ) ( not ( = ?auto_177305 ?auto_177306 ) ) ( ON ?auto_177306 ?auto_177310 ) ( not ( = ?auto_177302 ?auto_177310 ) ) ( not ( = ?auto_177303 ?auto_177310 ) ) ( not ( = ?auto_177304 ?auto_177310 ) ) ( not ( = ?auto_177305 ?auto_177310 ) ) ( not ( = ?auto_177306 ?auto_177310 ) ) ( ON ?auto_177305 ?auto_177306 ) ( ON-TABLE ?auto_177309 ) ( ON ?auto_177308 ?auto_177309 ) ( ON ?auto_177307 ?auto_177308 ) ( ON ?auto_177310 ?auto_177307 ) ( not ( = ?auto_177309 ?auto_177308 ) ) ( not ( = ?auto_177309 ?auto_177307 ) ) ( not ( = ?auto_177309 ?auto_177310 ) ) ( not ( = ?auto_177309 ?auto_177306 ) ) ( not ( = ?auto_177309 ?auto_177305 ) ) ( not ( = ?auto_177308 ?auto_177307 ) ) ( not ( = ?auto_177308 ?auto_177310 ) ) ( not ( = ?auto_177308 ?auto_177306 ) ) ( not ( = ?auto_177308 ?auto_177305 ) ) ( not ( = ?auto_177307 ?auto_177310 ) ) ( not ( = ?auto_177307 ?auto_177306 ) ) ( not ( = ?auto_177307 ?auto_177305 ) ) ( not ( = ?auto_177302 ?auto_177309 ) ) ( not ( = ?auto_177302 ?auto_177308 ) ) ( not ( = ?auto_177302 ?auto_177307 ) ) ( not ( = ?auto_177303 ?auto_177309 ) ) ( not ( = ?auto_177303 ?auto_177308 ) ) ( not ( = ?auto_177303 ?auto_177307 ) ) ( not ( = ?auto_177304 ?auto_177309 ) ) ( not ( = ?auto_177304 ?auto_177308 ) ) ( not ( = ?auto_177304 ?auto_177307 ) ) ( CLEAR ?auto_177303 ) ( ON ?auto_177304 ?auto_177305 ) ( CLEAR ?auto_177304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177309 ?auto_177308 ?auto_177307 ?auto_177310 ?auto_177306 ?auto_177305 )
      ( MAKE-5PILE ?auto_177302 ?auto_177303 ?auto_177304 ?auto_177305 ?auto_177306 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177311 - BLOCK
      ?auto_177312 - BLOCK
      ?auto_177313 - BLOCK
      ?auto_177314 - BLOCK
      ?auto_177315 - BLOCK
    )
    :vars
    (
      ?auto_177318 - BLOCK
      ?auto_177316 - BLOCK
      ?auto_177317 - BLOCK
      ?auto_177319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177311 ) ( not ( = ?auto_177311 ?auto_177312 ) ) ( not ( = ?auto_177311 ?auto_177313 ) ) ( not ( = ?auto_177311 ?auto_177314 ) ) ( not ( = ?auto_177311 ?auto_177315 ) ) ( not ( = ?auto_177312 ?auto_177313 ) ) ( not ( = ?auto_177312 ?auto_177314 ) ) ( not ( = ?auto_177312 ?auto_177315 ) ) ( not ( = ?auto_177313 ?auto_177314 ) ) ( not ( = ?auto_177313 ?auto_177315 ) ) ( not ( = ?auto_177314 ?auto_177315 ) ) ( ON ?auto_177315 ?auto_177318 ) ( not ( = ?auto_177311 ?auto_177318 ) ) ( not ( = ?auto_177312 ?auto_177318 ) ) ( not ( = ?auto_177313 ?auto_177318 ) ) ( not ( = ?auto_177314 ?auto_177318 ) ) ( not ( = ?auto_177315 ?auto_177318 ) ) ( ON ?auto_177314 ?auto_177315 ) ( ON-TABLE ?auto_177316 ) ( ON ?auto_177317 ?auto_177316 ) ( ON ?auto_177319 ?auto_177317 ) ( ON ?auto_177318 ?auto_177319 ) ( not ( = ?auto_177316 ?auto_177317 ) ) ( not ( = ?auto_177316 ?auto_177319 ) ) ( not ( = ?auto_177316 ?auto_177318 ) ) ( not ( = ?auto_177316 ?auto_177315 ) ) ( not ( = ?auto_177316 ?auto_177314 ) ) ( not ( = ?auto_177317 ?auto_177319 ) ) ( not ( = ?auto_177317 ?auto_177318 ) ) ( not ( = ?auto_177317 ?auto_177315 ) ) ( not ( = ?auto_177317 ?auto_177314 ) ) ( not ( = ?auto_177319 ?auto_177318 ) ) ( not ( = ?auto_177319 ?auto_177315 ) ) ( not ( = ?auto_177319 ?auto_177314 ) ) ( not ( = ?auto_177311 ?auto_177316 ) ) ( not ( = ?auto_177311 ?auto_177317 ) ) ( not ( = ?auto_177311 ?auto_177319 ) ) ( not ( = ?auto_177312 ?auto_177316 ) ) ( not ( = ?auto_177312 ?auto_177317 ) ) ( not ( = ?auto_177312 ?auto_177319 ) ) ( not ( = ?auto_177313 ?auto_177316 ) ) ( not ( = ?auto_177313 ?auto_177317 ) ) ( not ( = ?auto_177313 ?auto_177319 ) ) ( ON ?auto_177313 ?auto_177314 ) ( CLEAR ?auto_177313 ) ( HOLDING ?auto_177312 ) ( CLEAR ?auto_177311 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177311 ?auto_177312 )
      ( MAKE-5PILE ?auto_177311 ?auto_177312 ?auto_177313 ?auto_177314 ?auto_177315 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177320 - BLOCK
      ?auto_177321 - BLOCK
      ?auto_177322 - BLOCK
      ?auto_177323 - BLOCK
      ?auto_177324 - BLOCK
    )
    :vars
    (
      ?auto_177328 - BLOCK
      ?auto_177327 - BLOCK
      ?auto_177325 - BLOCK
      ?auto_177326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177320 ) ( not ( = ?auto_177320 ?auto_177321 ) ) ( not ( = ?auto_177320 ?auto_177322 ) ) ( not ( = ?auto_177320 ?auto_177323 ) ) ( not ( = ?auto_177320 ?auto_177324 ) ) ( not ( = ?auto_177321 ?auto_177322 ) ) ( not ( = ?auto_177321 ?auto_177323 ) ) ( not ( = ?auto_177321 ?auto_177324 ) ) ( not ( = ?auto_177322 ?auto_177323 ) ) ( not ( = ?auto_177322 ?auto_177324 ) ) ( not ( = ?auto_177323 ?auto_177324 ) ) ( ON ?auto_177324 ?auto_177328 ) ( not ( = ?auto_177320 ?auto_177328 ) ) ( not ( = ?auto_177321 ?auto_177328 ) ) ( not ( = ?auto_177322 ?auto_177328 ) ) ( not ( = ?auto_177323 ?auto_177328 ) ) ( not ( = ?auto_177324 ?auto_177328 ) ) ( ON ?auto_177323 ?auto_177324 ) ( ON-TABLE ?auto_177327 ) ( ON ?auto_177325 ?auto_177327 ) ( ON ?auto_177326 ?auto_177325 ) ( ON ?auto_177328 ?auto_177326 ) ( not ( = ?auto_177327 ?auto_177325 ) ) ( not ( = ?auto_177327 ?auto_177326 ) ) ( not ( = ?auto_177327 ?auto_177328 ) ) ( not ( = ?auto_177327 ?auto_177324 ) ) ( not ( = ?auto_177327 ?auto_177323 ) ) ( not ( = ?auto_177325 ?auto_177326 ) ) ( not ( = ?auto_177325 ?auto_177328 ) ) ( not ( = ?auto_177325 ?auto_177324 ) ) ( not ( = ?auto_177325 ?auto_177323 ) ) ( not ( = ?auto_177326 ?auto_177328 ) ) ( not ( = ?auto_177326 ?auto_177324 ) ) ( not ( = ?auto_177326 ?auto_177323 ) ) ( not ( = ?auto_177320 ?auto_177327 ) ) ( not ( = ?auto_177320 ?auto_177325 ) ) ( not ( = ?auto_177320 ?auto_177326 ) ) ( not ( = ?auto_177321 ?auto_177327 ) ) ( not ( = ?auto_177321 ?auto_177325 ) ) ( not ( = ?auto_177321 ?auto_177326 ) ) ( not ( = ?auto_177322 ?auto_177327 ) ) ( not ( = ?auto_177322 ?auto_177325 ) ) ( not ( = ?auto_177322 ?auto_177326 ) ) ( ON ?auto_177322 ?auto_177323 ) ( CLEAR ?auto_177320 ) ( ON ?auto_177321 ?auto_177322 ) ( CLEAR ?auto_177321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177327 ?auto_177325 ?auto_177326 ?auto_177328 ?auto_177324 ?auto_177323 ?auto_177322 )
      ( MAKE-5PILE ?auto_177320 ?auto_177321 ?auto_177322 ?auto_177323 ?auto_177324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177329 - BLOCK
      ?auto_177330 - BLOCK
      ?auto_177331 - BLOCK
      ?auto_177332 - BLOCK
      ?auto_177333 - BLOCK
    )
    :vars
    (
      ?auto_177334 - BLOCK
      ?auto_177335 - BLOCK
      ?auto_177336 - BLOCK
      ?auto_177337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177329 ?auto_177330 ) ) ( not ( = ?auto_177329 ?auto_177331 ) ) ( not ( = ?auto_177329 ?auto_177332 ) ) ( not ( = ?auto_177329 ?auto_177333 ) ) ( not ( = ?auto_177330 ?auto_177331 ) ) ( not ( = ?auto_177330 ?auto_177332 ) ) ( not ( = ?auto_177330 ?auto_177333 ) ) ( not ( = ?auto_177331 ?auto_177332 ) ) ( not ( = ?auto_177331 ?auto_177333 ) ) ( not ( = ?auto_177332 ?auto_177333 ) ) ( ON ?auto_177333 ?auto_177334 ) ( not ( = ?auto_177329 ?auto_177334 ) ) ( not ( = ?auto_177330 ?auto_177334 ) ) ( not ( = ?auto_177331 ?auto_177334 ) ) ( not ( = ?auto_177332 ?auto_177334 ) ) ( not ( = ?auto_177333 ?auto_177334 ) ) ( ON ?auto_177332 ?auto_177333 ) ( ON-TABLE ?auto_177335 ) ( ON ?auto_177336 ?auto_177335 ) ( ON ?auto_177337 ?auto_177336 ) ( ON ?auto_177334 ?auto_177337 ) ( not ( = ?auto_177335 ?auto_177336 ) ) ( not ( = ?auto_177335 ?auto_177337 ) ) ( not ( = ?auto_177335 ?auto_177334 ) ) ( not ( = ?auto_177335 ?auto_177333 ) ) ( not ( = ?auto_177335 ?auto_177332 ) ) ( not ( = ?auto_177336 ?auto_177337 ) ) ( not ( = ?auto_177336 ?auto_177334 ) ) ( not ( = ?auto_177336 ?auto_177333 ) ) ( not ( = ?auto_177336 ?auto_177332 ) ) ( not ( = ?auto_177337 ?auto_177334 ) ) ( not ( = ?auto_177337 ?auto_177333 ) ) ( not ( = ?auto_177337 ?auto_177332 ) ) ( not ( = ?auto_177329 ?auto_177335 ) ) ( not ( = ?auto_177329 ?auto_177336 ) ) ( not ( = ?auto_177329 ?auto_177337 ) ) ( not ( = ?auto_177330 ?auto_177335 ) ) ( not ( = ?auto_177330 ?auto_177336 ) ) ( not ( = ?auto_177330 ?auto_177337 ) ) ( not ( = ?auto_177331 ?auto_177335 ) ) ( not ( = ?auto_177331 ?auto_177336 ) ) ( not ( = ?auto_177331 ?auto_177337 ) ) ( ON ?auto_177331 ?auto_177332 ) ( ON ?auto_177330 ?auto_177331 ) ( CLEAR ?auto_177330 ) ( HOLDING ?auto_177329 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177329 )
      ( MAKE-5PILE ?auto_177329 ?auto_177330 ?auto_177331 ?auto_177332 ?auto_177333 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177338 - BLOCK
      ?auto_177339 - BLOCK
      ?auto_177340 - BLOCK
      ?auto_177341 - BLOCK
      ?auto_177342 - BLOCK
    )
    :vars
    (
      ?auto_177343 - BLOCK
      ?auto_177344 - BLOCK
      ?auto_177346 - BLOCK
      ?auto_177345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177338 ?auto_177339 ) ) ( not ( = ?auto_177338 ?auto_177340 ) ) ( not ( = ?auto_177338 ?auto_177341 ) ) ( not ( = ?auto_177338 ?auto_177342 ) ) ( not ( = ?auto_177339 ?auto_177340 ) ) ( not ( = ?auto_177339 ?auto_177341 ) ) ( not ( = ?auto_177339 ?auto_177342 ) ) ( not ( = ?auto_177340 ?auto_177341 ) ) ( not ( = ?auto_177340 ?auto_177342 ) ) ( not ( = ?auto_177341 ?auto_177342 ) ) ( ON ?auto_177342 ?auto_177343 ) ( not ( = ?auto_177338 ?auto_177343 ) ) ( not ( = ?auto_177339 ?auto_177343 ) ) ( not ( = ?auto_177340 ?auto_177343 ) ) ( not ( = ?auto_177341 ?auto_177343 ) ) ( not ( = ?auto_177342 ?auto_177343 ) ) ( ON ?auto_177341 ?auto_177342 ) ( ON-TABLE ?auto_177344 ) ( ON ?auto_177346 ?auto_177344 ) ( ON ?auto_177345 ?auto_177346 ) ( ON ?auto_177343 ?auto_177345 ) ( not ( = ?auto_177344 ?auto_177346 ) ) ( not ( = ?auto_177344 ?auto_177345 ) ) ( not ( = ?auto_177344 ?auto_177343 ) ) ( not ( = ?auto_177344 ?auto_177342 ) ) ( not ( = ?auto_177344 ?auto_177341 ) ) ( not ( = ?auto_177346 ?auto_177345 ) ) ( not ( = ?auto_177346 ?auto_177343 ) ) ( not ( = ?auto_177346 ?auto_177342 ) ) ( not ( = ?auto_177346 ?auto_177341 ) ) ( not ( = ?auto_177345 ?auto_177343 ) ) ( not ( = ?auto_177345 ?auto_177342 ) ) ( not ( = ?auto_177345 ?auto_177341 ) ) ( not ( = ?auto_177338 ?auto_177344 ) ) ( not ( = ?auto_177338 ?auto_177346 ) ) ( not ( = ?auto_177338 ?auto_177345 ) ) ( not ( = ?auto_177339 ?auto_177344 ) ) ( not ( = ?auto_177339 ?auto_177346 ) ) ( not ( = ?auto_177339 ?auto_177345 ) ) ( not ( = ?auto_177340 ?auto_177344 ) ) ( not ( = ?auto_177340 ?auto_177346 ) ) ( not ( = ?auto_177340 ?auto_177345 ) ) ( ON ?auto_177340 ?auto_177341 ) ( ON ?auto_177339 ?auto_177340 ) ( ON ?auto_177338 ?auto_177339 ) ( CLEAR ?auto_177338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177344 ?auto_177346 ?auto_177345 ?auto_177343 ?auto_177342 ?auto_177341 ?auto_177340 ?auto_177339 )
      ( MAKE-5PILE ?auto_177338 ?auto_177339 ?auto_177340 ?auto_177341 ?auto_177342 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177350 - BLOCK
      ?auto_177351 - BLOCK
      ?auto_177352 - BLOCK
    )
    :vars
    (
      ?auto_177353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177353 ?auto_177352 ) ( CLEAR ?auto_177353 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177350 ) ( ON ?auto_177351 ?auto_177350 ) ( ON ?auto_177352 ?auto_177351 ) ( not ( = ?auto_177350 ?auto_177351 ) ) ( not ( = ?auto_177350 ?auto_177352 ) ) ( not ( = ?auto_177350 ?auto_177353 ) ) ( not ( = ?auto_177351 ?auto_177352 ) ) ( not ( = ?auto_177351 ?auto_177353 ) ) ( not ( = ?auto_177352 ?auto_177353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177353 ?auto_177352 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177354 - BLOCK
      ?auto_177355 - BLOCK
      ?auto_177356 - BLOCK
    )
    :vars
    (
      ?auto_177357 - BLOCK
      ?auto_177358 - BLOCK
      ?auto_177359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177357 ?auto_177356 ) ( CLEAR ?auto_177357 ) ( ON-TABLE ?auto_177354 ) ( ON ?auto_177355 ?auto_177354 ) ( ON ?auto_177356 ?auto_177355 ) ( not ( = ?auto_177354 ?auto_177355 ) ) ( not ( = ?auto_177354 ?auto_177356 ) ) ( not ( = ?auto_177354 ?auto_177357 ) ) ( not ( = ?auto_177355 ?auto_177356 ) ) ( not ( = ?auto_177355 ?auto_177357 ) ) ( not ( = ?auto_177356 ?auto_177357 ) ) ( HOLDING ?auto_177358 ) ( CLEAR ?auto_177359 ) ( not ( = ?auto_177354 ?auto_177358 ) ) ( not ( = ?auto_177354 ?auto_177359 ) ) ( not ( = ?auto_177355 ?auto_177358 ) ) ( not ( = ?auto_177355 ?auto_177359 ) ) ( not ( = ?auto_177356 ?auto_177358 ) ) ( not ( = ?auto_177356 ?auto_177359 ) ) ( not ( = ?auto_177357 ?auto_177358 ) ) ( not ( = ?auto_177357 ?auto_177359 ) ) ( not ( = ?auto_177358 ?auto_177359 ) ) )
    :subtasks
    ( ( !STACK ?auto_177358 ?auto_177359 )
      ( MAKE-3PILE ?auto_177354 ?auto_177355 ?auto_177356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177360 - BLOCK
      ?auto_177361 - BLOCK
      ?auto_177362 - BLOCK
    )
    :vars
    (
      ?auto_177364 - BLOCK
      ?auto_177363 - BLOCK
      ?auto_177365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177364 ?auto_177362 ) ( ON-TABLE ?auto_177360 ) ( ON ?auto_177361 ?auto_177360 ) ( ON ?auto_177362 ?auto_177361 ) ( not ( = ?auto_177360 ?auto_177361 ) ) ( not ( = ?auto_177360 ?auto_177362 ) ) ( not ( = ?auto_177360 ?auto_177364 ) ) ( not ( = ?auto_177361 ?auto_177362 ) ) ( not ( = ?auto_177361 ?auto_177364 ) ) ( not ( = ?auto_177362 ?auto_177364 ) ) ( CLEAR ?auto_177363 ) ( not ( = ?auto_177360 ?auto_177365 ) ) ( not ( = ?auto_177360 ?auto_177363 ) ) ( not ( = ?auto_177361 ?auto_177365 ) ) ( not ( = ?auto_177361 ?auto_177363 ) ) ( not ( = ?auto_177362 ?auto_177365 ) ) ( not ( = ?auto_177362 ?auto_177363 ) ) ( not ( = ?auto_177364 ?auto_177365 ) ) ( not ( = ?auto_177364 ?auto_177363 ) ) ( not ( = ?auto_177365 ?auto_177363 ) ) ( ON ?auto_177365 ?auto_177364 ) ( CLEAR ?auto_177365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177360 ?auto_177361 ?auto_177362 ?auto_177364 )
      ( MAKE-3PILE ?auto_177360 ?auto_177361 ?auto_177362 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177366 - BLOCK
      ?auto_177367 - BLOCK
      ?auto_177368 - BLOCK
    )
    :vars
    (
      ?auto_177369 - BLOCK
      ?auto_177371 - BLOCK
      ?auto_177370 - BLOCK
      ?auto_177372 - BLOCK
      ?auto_177373 - BLOCK
      ?auto_177374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177369 ?auto_177368 ) ( ON-TABLE ?auto_177366 ) ( ON ?auto_177367 ?auto_177366 ) ( ON ?auto_177368 ?auto_177367 ) ( not ( = ?auto_177366 ?auto_177367 ) ) ( not ( = ?auto_177366 ?auto_177368 ) ) ( not ( = ?auto_177366 ?auto_177369 ) ) ( not ( = ?auto_177367 ?auto_177368 ) ) ( not ( = ?auto_177367 ?auto_177369 ) ) ( not ( = ?auto_177368 ?auto_177369 ) ) ( not ( = ?auto_177366 ?auto_177371 ) ) ( not ( = ?auto_177366 ?auto_177370 ) ) ( not ( = ?auto_177367 ?auto_177371 ) ) ( not ( = ?auto_177367 ?auto_177370 ) ) ( not ( = ?auto_177368 ?auto_177371 ) ) ( not ( = ?auto_177368 ?auto_177370 ) ) ( not ( = ?auto_177369 ?auto_177371 ) ) ( not ( = ?auto_177369 ?auto_177370 ) ) ( not ( = ?auto_177371 ?auto_177370 ) ) ( ON ?auto_177371 ?auto_177369 ) ( CLEAR ?auto_177371 ) ( HOLDING ?auto_177370 ) ( CLEAR ?auto_177372 ) ( ON-TABLE ?auto_177373 ) ( ON ?auto_177374 ?auto_177373 ) ( ON ?auto_177372 ?auto_177374 ) ( not ( = ?auto_177373 ?auto_177374 ) ) ( not ( = ?auto_177373 ?auto_177372 ) ) ( not ( = ?auto_177373 ?auto_177370 ) ) ( not ( = ?auto_177374 ?auto_177372 ) ) ( not ( = ?auto_177374 ?auto_177370 ) ) ( not ( = ?auto_177372 ?auto_177370 ) ) ( not ( = ?auto_177366 ?auto_177372 ) ) ( not ( = ?auto_177366 ?auto_177373 ) ) ( not ( = ?auto_177366 ?auto_177374 ) ) ( not ( = ?auto_177367 ?auto_177372 ) ) ( not ( = ?auto_177367 ?auto_177373 ) ) ( not ( = ?auto_177367 ?auto_177374 ) ) ( not ( = ?auto_177368 ?auto_177372 ) ) ( not ( = ?auto_177368 ?auto_177373 ) ) ( not ( = ?auto_177368 ?auto_177374 ) ) ( not ( = ?auto_177369 ?auto_177372 ) ) ( not ( = ?auto_177369 ?auto_177373 ) ) ( not ( = ?auto_177369 ?auto_177374 ) ) ( not ( = ?auto_177371 ?auto_177372 ) ) ( not ( = ?auto_177371 ?auto_177373 ) ) ( not ( = ?auto_177371 ?auto_177374 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177373 ?auto_177374 ?auto_177372 ?auto_177370 )
      ( MAKE-3PILE ?auto_177366 ?auto_177367 ?auto_177368 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177375 - BLOCK
      ?auto_177376 - BLOCK
      ?auto_177377 - BLOCK
    )
    :vars
    (
      ?auto_177379 - BLOCK
      ?auto_177382 - BLOCK
      ?auto_177383 - BLOCK
      ?auto_177378 - BLOCK
      ?auto_177381 - BLOCK
      ?auto_177380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177379 ?auto_177377 ) ( ON-TABLE ?auto_177375 ) ( ON ?auto_177376 ?auto_177375 ) ( ON ?auto_177377 ?auto_177376 ) ( not ( = ?auto_177375 ?auto_177376 ) ) ( not ( = ?auto_177375 ?auto_177377 ) ) ( not ( = ?auto_177375 ?auto_177379 ) ) ( not ( = ?auto_177376 ?auto_177377 ) ) ( not ( = ?auto_177376 ?auto_177379 ) ) ( not ( = ?auto_177377 ?auto_177379 ) ) ( not ( = ?auto_177375 ?auto_177382 ) ) ( not ( = ?auto_177375 ?auto_177383 ) ) ( not ( = ?auto_177376 ?auto_177382 ) ) ( not ( = ?auto_177376 ?auto_177383 ) ) ( not ( = ?auto_177377 ?auto_177382 ) ) ( not ( = ?auto_177377 ?auto_177383 ) ) ( not ( = ?auto_177379 ?auto_177382 ) ) ( not ( = ?auto_177379 ?auto_177383 ) ) ( not ( = ?auto_177382 ?auto_177383 ) ) ( ON ?auto_177382 ?auto_177379 ) ( CLEAR ?auto_177378 ) ( ON-TABLE ?auto_177381 ) ( ON ?auto_177380 ?auto_177381 ) ( ON ?auto_177378 ?auto_177380 ) ( not ( = ?auto_177381 ?auto_177380 ) ) ( not ( = ?auto_177381 ?auto_177378 ) ) ( not ( = ?auto_177381 ?auto_177383 ) ) ( not ( = ?auto_177380 ?auto_177378 ) ) ( not ( = ?auto_177380 ?auto_177383 ) ) ( not ( = ?auto_177378 ?auto_177383 ) ) ( not ( = ?auto_177375 ?auto_177378 ) ) ( not ( = ?auto_177375 ?auto_177381 ) ) ( not ( = ?auto_177375 ?auto_177380 ) ) ( not ( = ?auto_177376 ?auto_177378 ) ) ( not ( = ?auto_177376 ?auto_177381 ) ) ( not ( = ?auto_177376 ?auto_177380 ) ) ( not ( = ?auto_177377 ?auto_177378 ) ) ( not ( = ?auto_177377 ?auto_177381 ) ) ( not ( = ?auto_177377 ?auto_177380 ) ) ( not ( = ?auto_177379 ?auto_177378 ) ) ( not ( = ?auto_177379 ?auto_177381 ) ) ( not ( = ?auto_177379 ?auto_177380 ) ) ( not ( = ?auto_177382 ?auto_177378 ) ) ( not ( = ?auto_177382 ?auto_177381 ) ) ( not ( = ?auto_177382 ?auto_177380 ) ) ( ON ?auto_177383 ?auto_177382 ) ( CLEAR ?auto_177383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177375 ?auto_177376 ?auto_177377 ?auto_177379 ?auto_177382 )
      ( MAKE-3PILE ?auto_177375 ?auto_177376 ?auto_177377 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177384 - BLOCK
      ?auto_177385 - BLOCK
      ?auto_177386 - BLOCK
    )
    :vars
    (
      ?auto_177387 - BLOCK
      ?auto_177390 - BLOCK
      ?auto_177388 - BLOCK
      ?auto_177391 - BLOCK
      ?auto_177389 - BLOCK
      ?auto_177392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177387 ?auto_177386 ) ( ON-TABLE ?auto_177384 ) ( ON ?auto_177385 ?auto_177384 ) ( ON ?auto_177386 ?auto_177385 ) ( not ( = ?auto_177384 ?auto_177385 ) ) ( not ( = ?auto_177384 ?auto_177386 ) ) ( not ( = ?auto_177384 ?auto_177387 ) ) ( not ( = ?auto_177385 ?auto_177386 ) ) ( not ( = ?auto_177385 ?auto_177387 ) ) ( not ( = ?auto_177386 ?auto_177387 ) ) ( not ( = ?auto_177384 ?auto_177390 ) ) ( not ( = ?auto_177384 ?auto_177388 ) ) ( not ( = ?auto_177385 ?auto_177390 ) ) ( not ( = ?auto_177385 ?auto_177388 ) ) ( not ( = ?auto_177386 ?auto_177390 ) ) ( not ( = ?auto_177386 ?auto_177388 ) ) ( not ( = ?auto_177387 ?auto_177390 ) ) ( not ( = ?auto_177387 ?auto_177388 ) ) ( not ( = ?auto_177390 ?auto_177388 ) ) ( ON ?auto_177390 ?auto_177387 ) ( ON-TABLE ?auto_177391 ) ( ON ?auto_177389 ?auto_177391 ) ( not ( = ?auto_177391 ?auto_177389 ) ) ( not ( = ?auto_177391 ?auto_177392 ) ) ( not ( = ?auto_177391 ?auto_177388 ) ) ( not ( = ?auto_177389 ?auto_177392 ) ) ( not ( = ?auto_177389 ?auto_177388 ) ) ( not ( = ?auto_177392 ?auto_177388 ) ) ( not ( = ?auto_177384 ?auto_177392 ) ) ( not ( = ?auto_177384 ?auto_177391 ) ) ( not ( = ?auto_177384 ?auto_177389 ) ) ( not ( = ?auto_177385 ?auto_177392 ) ) ( not ( = ?auto_177385 ?auto_177391 ) ) ( not ( = ?auto_177385 ?auto_177389 ) ) ( not ( = ?auto_177386 ?auto_177392 ) ) ( not ( = ?auto_177386 ?auto_177391 ) ) ( not ( = ?auto_177386 ?auto_177389 ) ) ( not ( = ?auto_177387 ?auto_177392 ) ) ( not ( = ?auto_177387 ?auto_177391 ) ) ( not ( = ?auto_177387 ?auto_177389 ) ) ( not ( = ?auto_177390 ?auto_177392 ) ) ( not ( = ?auto_177390 ?auto_177391 ) ) ( not ( = ?auto_177390 ?auto_177389 ) ) ( ON ?auto_177388 ?auto_177390 ) ( CLEAR ?auto_177388 ) ( HOLDING ?auto_177392 ) ( CLEAR ?auto_177389 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177391 ?auto_177389 ?auto_177392 )
      ( MAKE-3PILE ?auto_177384 ?auto_177385 ?auto_177386 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177393 - BLOCK
      ?auto_177394 - BLOCK
      ?auto_177395 - BLOCK
    )
    :vars
    (
      ?auto_177398 - BLOCK
      ?auto_177397 - BLOCK
      ?auto_177401 - BLOCK
      ?auto_177399 - BLOCK
      ?auto_177400 - BLOCK
      ?auto_177396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177398 ?auto_177395 ) ( ON-TABLE ?auto_177393 ) ( ON ?auto_177394 ?auto_177393 ) ( ON ?auto_177395 ?auto_177394 ) ( not ( = ?auto_177393 ?auto_177394 ) ) ( not ( = ?auto_177393 ?auto_177395 ) ) ( not ( = ?auto_177393 ?auto_177398 ) ) ( not ( = ?auto_177394 ?auto_177395 ) ) ( not ( = ?auto_177394 ?auto_177398 ) ) ( not ( = ?auto_177395 ?auto_177398 ) ) ( not ( = ?auto_177393 ?auto_177397 ) ) ( not ( = ?auto_177393 ?auto_177401 ) ) ( not ( = ?auto_177394 ?auto_177397 ) ) ( not ( = ?auto_177394 ?auto_177401 ) ) ( not ( = ?auto_177395 ?auto_177397 ) ) ( not ( = ?auto_177395 ?auto_177401 ) ) ( not ( = ?auto_177398 ?auto_177397 ) ) ( not ( = ?auto_177398 ?auto_177401 ) ) ( not ( = ?auto_177397 ?auto_177401 ) ) ( ON ?auto_177397 ?auto_177398 ) ( ON-TABLE ?auto_177399 ) ( ON ?auto_177400 ?auto_177399 ) ( not ( = ?auto_177399 ?auto_177400 ) ) ( not ( = ?auto_177399 ?auto_177396 ) ) ( not ( = ?auto_177399 ?auto_177401 ) ) ( not ( = ?auto_177400 ?auto_177396 ) ) ( not ( = ?auto_177400 ?auto_177401 ) ) ( not ( = ?auto_177396 ?auto_177401 ) ) ( not ( = ?auto_177393 ?auto_177396 ) ) ( not ( = ?auto_177393 ?auto_177399 ) ) ( not ( = ?auto_177393 ?auto_177400 ) ) ( not ( = ?auto_177394 ?auto_177396 ) ) ( not ( = ?auto_177394 ?auto_177399 ) ) ( not ( = ?auto_177394 ?auto_177400 ) ) ( not ( = ?auto_177395 ?auto_177396 ) ) ( not ( = ?auto_177395 ?auto_177399 ) ) ( not ( = ?auto_177395 ?auto_177400 ) ) ( not ( = ?auto_177398 ?auto_177396 ) ) ( not ( = ?auto_177398 ?auto_177399 ) ) ( not ( = ?auto_177398 ?auto_177400 ) ) ( not ( = ?auto_177397 ?auto_177396 ) ) ( not ( = ?auto_177397 ?auto_177399 ) ) ( not ( = ?auto_177397 ?auto_177400 ) ) ( ON ?auto_177401 ?auto_177397 ) ( CLEAR ?auto_177400 ) ( ON ?auto_177396 ?auto_177401 ) ( CLEAR ?auto_177396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177393 ?auto_177394 ?auto_177395 ?auto_177398 ?auto_177397 ?auto_177401 )
      ( MAKE-3PILE ?auto_177393 ?auto_177394 ?auto_177395 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177402 - BLOCK
      ?auto_177403 - BLOCK
      ?auto_177404 - BLOCK
    )
    :vars
    (
      ?auto_177410 - BLOCK
      ?auto_177408 - BLOCK
      ?auto_177406 - BLOCK
      ?auto_177409 - BLOCK
      ?auto_177407 - BLOCK
      ?auto_177405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177410 ?auto_177404 ) ( ON-TABLE ?auto_177402 ) ( ON ?auto_177403 ?auto_177402 ) ( ON ?auto_177404 ?auto_177403 ) ( not ( = ?auto_177402 ?auto_177403 ) ) ( not ( = ?auto_177402 ?auto_177404 ) ) ( not ( = ?auto_177402 ?auto_177410 ) ) ( not ( = ?auto_177403 ?auto_177404 ) ) ( not ( = ?auto_177403 ?auto_177410 ) ) ( not ( = ?auto_177404 ?auto_177410 ) ) ( not ( = ?auto_177402 ?auto_177408 ) ) ( not ( = ?auto_177402 ?auto_177406 ) ) ( not ( = ?auto_177403 ?auto_177408 ) ) ( not ( = ?auto_177403 ?auto_177406 ) ) ( not ( = ?auto_177404 ?auto_177408 ) ) ( not ( = ?auto_177404 ?auto_177406 ) ) ( not ( = ?auto_177410 ?auto_177408 ) ) ( not ( = ?auto_177410 ?auto_177406 ) ) ( not ( = ?auto_177408 ?auto_177406 ) ) ( ON ?auto_177408 ?auto_177410 ) ( ON-TABLE ?auto_177409 ) ( not ( = ?auto_177409 ?auto_177407 ) ) ( not ( = ?auto_177409 ?auto_177405 ) ) ( not ( = ?auto_177409 ?auto_177406 ) ) ( not ( = ?auto_177407 ?auto_177405 ) ) ( not ( = ?auto_177407 ?auto_177406 ) ) ( not ( = ?auto_177405 ?auto_177406 ) ) ( not ( = ?auto_177402 ?auto_177405 ) ) ( not ( = ?auto_177402 ?auto_177409 ) ) ( not ( = ?auto_177402 ?auto_177407 ) ) ( not ( = ?auto_177403 ?auto_177405 ) ) ( not ( = ?auto_177403 ?auto_177409 ) ) ( not ( = ?auto_177403 ?auto_177407 ) ) ( not ( = ?auto_177404 ?auto_177405 ) ) ( not ( = ?auto_177404 ?auto_177409 ) ) ( not ( = ?auto_177404 ?auto_177407 ) ) ( not ( = ?auto_177410 ?auto_177405 ) ) ( not ( = ?auto_177410 ?auto_177409 ) ) ( not ( = ?auto_177410 ?auto_177407 ) ) ( not ( = ?auto_177408 ?auto_177405 ) ) ( not ( = ?auto_177408 ?auto_177409 ) ) ( not ( = ?auto_177408 ?auto_177407 ) ) ( ON ?auto_177406 ?auto_177408 ) ( ON ?auto_177405 ?auto_177406 ) ( CLEAR ?auto_177405 ) ( HOLDING ?auto_177407 ) ( CLEAR ?auto_177409 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177409 ?auto_177407 )
      ( MAKE-3PILE ?auto_177402 ?auto_177403 ?auto_177404 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179269 - BLOCK
      ?auto_179270 - BLOCK
      ?auto_179271 - BLOCK
    )
    :vars
    (
      ?auto_179276 - BLOCK
      ?auto_179275 - BLOCK
      ?auto_179273 - BLOCK
      ?auto_179274 - BLOCK
      ?auto_179272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179276 ?auto_179271 ) ( ON-TABLE ?auto_179269 ) ( ON ?auto_179270 ?auto_179269 ) ( ON ?auto_179271 ?auto_179270 ) ( not ( = ?auto_179269 ?auto_179270 ) ) ( not ( = ?auto_179269 ?auto_179271 ) ) ( not ( = ?auto_179269 ?auto_179276 ) ) ( not ( = ?auto_179270 ?auto_179271 ) ) ( not ( = ?auto_179270 ?auto_179276 ) ) ( not ( = ?auto_179271 ?auto_179276 ) ) ( not ( = ?auto_179269 ?auto_179275 ) ) ( not ( = ?auto_179269 ?auto_179273 ) ) ( not ( = ?auto_179270 ?auto_179275 ) ) ( not ( = ?auto_179270 ?auto_179273 ) ) ( not ( = ?auto_179271 ?auto_179275 ) ) ( not ( = ?auto_179271 ?auto_179273 ) ) ( not ( = ?auto_179276 ?auto_179275 ) ) ( not ( = ?auto_179276 ?auto_179273 ) ) ( not ( = ?auto_179275 ?auto_179273 ) ) ( ON ?auto_179275 ?auto_179276 ) ( not ( = ?auto_179274 ?auto_179272 ) ) ( not ( = ?auto_179274 ?auto_179273 ) ) ( not ( = ?auto_179272 ?auto_179273 ) ) ( not ( = ?auto_179269 ?auto_179272 ) ) ( not ( = ?auto_179269 ?auto_179274 ) ) ( not ( = ?auto_179270 ?auto_179272 ) ) ( not ( = ?auto_179270 ?auto_179274 ) ) ( not ( = ?auto_179271 ?auto_179272 ) ) ( not ( = ?auto_179271 ?auto_179274 ) ) ( not ( = ?auto_179276 ?auto_179272 ) ) ( not ( = ?auto_179276 ?auto_179274 ) ) ( not ( = ?auto_179275 ?auto_179272 ) ) ( not ( = ?auto_179275 ?auto_179274 ) ) ( ON ?auto_179273 ?auto_179275 ) ( ON ?auto_179272 ?auto_179273 ) ( ON ?auto_179274 ?auto_179272 ) ( CLEAR ?auto_179274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179269 ?auto_179270 ?auto_179271 ?auto_179276 ?auto_179275 ?auto_179273 ?auto_179272 )
      ( MAKE-3PILE ?auto_179269 ?auto_179270 ?auto_179271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177420 - BLOCK
      ?auto_177421 - BLOCK
      ?auto_177422 - BLOCK
    )
    :vars
    (
      ?auto_177427 - BLOCK
      ?auto_177426 - BLOCK
      ?auto_177428 - BLOCK
      ?auto_177425 - BLOCK
      ?auto_177423 - BLOCK
      ?auto_177424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177427 ?auto_177422 ) ( ON-TABLE ?auto_177420 ) ( ON ?auto_177421 ?auto_177420 ) ( ON ?auto_177422 ?auto_177421 ) ( not ( = ?auto_177420 ?auto_177421 ) ) ( not ( = ?auto_177420 ?auto_177422 ) ) ( not ( = ?auto_177420 ?auto_177427 ) ) ( not ( = ?auto_177421 ?auto_177422 ) ) ( not ( = ?auto_177421 ?auto_177427 ) ) ( not ( = ?auto_177422 ?auto_177427 ) ) ( not ( = ?auto_177420 ?auto_177426 ) ) ( not ( = ?auto_177420 ?auto_177428 ) ) ( not ( = ?auto_177421 ?auto_177426 ) ) ( not ( = ?auto_177421 ?auto_177428 ) ) ( not ( = ?auto_177422 ?auto_177426 ) ) ( not ( = ?auto_177422 ?auto_177428 ) ) ( not ( = ?auto_177427 ?auto_177426 ) ) ( not ( = ?auto_177427 ?auto_177428 ) ) ( not ( = ?auto_177426 ?auto_177428 ) ) ( ON ?auto_177426 ?auto_177427 ) ( not ( = ?auto_177425 ?auto_177423 ) ) ( not ( = ?auto_177425 ?auto_177424 ) ) ( not ( = ?auto_177425 ?auto_177428 ) ) ( not ( = ?auto_177423 ?auto_177424 ) ) ( not ( = ?auto_177423 ?auto_177428 ) ) ( not ( = ?auto_177424 ?auto_177428 ) ) ( not ( = ?auto_177420 ?auto_177424 ) ) ( not ( = ?auto_177420 ?auto_177425 ) ) ( not ( = ?auto_177420 ?auto_177423 ) ) ( not ( = ?auto_177421 ?auto_177424 ) ) ( not ( = ?auto_177421 ?auto_177425 ) ) ( not ( = ?auto_177421 ?auto_177423 ) ) ( not ( = ?auto_177422 ?auto_177424 ) ) ( not ( = ?auto_177422 ?auto_177425 ) ) ( not ( = ?auto_177422 ?auto_177423 ) ) ( not ( = ?auto_177427 ?auto_177424 ) ) ( not ( = ?auto_177427 ?auto_177425 ) ) ( not ( = ?auto_177427 ?auto_177423 ) ) ( not ( = ?auto_177426 ?auto_177424 ) ) ( not ( = ?auto_177426 ?auto_177425 ) ) ( not ( = ?auto_177426 ?auto_177423 ) ) ( ON ?auto_177428 ?auto_177426 ) ( ON ?auto_177424 ?auto_177428 ) ( ON ?auto_177423 ?auto_177424 ) ( CLEAR ?auto_177423 ) ( HOLDING ?auto_177425 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177425 )
      ( MAKE-3PILE ?auto_177420 ?auto_177421 ?auto_177422 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177429 - BLOCK
      ?auto_177430 - BLOCK
      ?auto_177431 - BLOCK
    )
    :vars
    (
      ?auto_177433 - BLOCK
      ?auto_177436 - BLOCK
      ?auto_177437 - BLOCK
      ?auto_177434 - BLOCK
      ?auto_177432 - BLOCK
      ?auto_177435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177433 ?auto_177431 ) ( ON-TABLE ?auto_177429 ) ( ON ?auto_177430 ?auto_177429 ) ( ON ?auto_177431 ?auto_177430 ) ( not ( = ?auto_177429 ?auto_177430 ) ) ( not ( = ?auto_177429 ?auto_177431 ) ) ( not ( = ?auto_177429 ?auto_177433 ) ) ( not ( = ?auto_177430 ?auto_177431 ) ) ( not ( = ?auto_177430 ?auto_177433 ) ) ( not ( = ?auto_177431 ?auto_177433 ) ) ( not ( = ?auto_177429 ?auto_177436 ) ) ( not ( = ?auto_177429 ?auto_177437 ) ) ( not ( = ?auto_177430 ?auto_177436 ) ) ( not ( = ?auto_177430 ?auto_177437 ) ) ( not ( = ?auto_177431 ?auto_177436 ) ) ( not ( = ?auto_177431 ?auto_177437 ) ) ( not ( = ?auto_177433 ?auto_177436 ) ) ( not ( = ?auto_177433 ?auto_177437 ) ) ( not ( = ?auto_177436 ?auto_177437 ) ) ( ON ?auto_177436 ?auto_177433 ) ( not ( = ?auto_177434 ?auto_177432 ) ) ( not ( = ?auto_177434 ?auto_177435 ) ) ( not ( = ?auto_177434 ?auto_177437 ) ) ( not ( = ?auto_177432 ?auto_177435 ) ) ( not ( = ?auto_177432 ?auto_177437 ) ) ( not ( = ?auto_177435 ?auto_177437 ) ) ( not ( = ?auto_177429 ?auto_177435 ) ) ( not ( = ?auto_177429 ?auto_177434 ) ) ( not ( = ?auto_177429 ?auto_177432 ) ) ( not ( = ?auto_177430 ?auto_177435 ) ) ( not ( = ?auto_177430 ?auto_177434 ) ) ( not ( = ?auto_177430 ?auto_177432 ) ) ( not ( = ?auto_177431 ?auto_177435 ) ) ( not ( = ?auto_177431 ?auto_177434 ) ) ( not ( = ?auto_177431 ?auto_177432 ) ) ( not ( = ?auto_177433 ?auto_177435 ) ) ( not ( = ?auto_177433 ?auto_177434 ) ) ( not ( = ?auto_177433 ?auto_177432 ) ) ( not ( = ?auto_177436 ?auto_177435 ) ) ( not ( = ?auto_177436 ?auto_177434 ) ) ( not ( = ?auto_177436 ?auto_177432 ) ) ( ON ?auto_177437 ?auto_177436 ) ( ON ?auto_177435 ?auto_177437 ) ( ON ?auto_177432 ?auto_177435 ) ( ON ?auto_177434 ?auto_177432 ) ( CLEAR ?auto_177434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177429 ?auto_177430 ?auto_177431 ?auto_177433 ?auto_177436 ?auto_177437 ?auto_177435 ?auto_177432 )
      ( MAKE-3PILE ?auto_177429 ?auto_177430 ?auto_177431 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177444 - BLOCK
      ?auto_177445 - BLOCK
      ?auto_177446 - BLOCK
      ?auto_177447 - BLOCK
      ?auto_177448 - BLOCK
      ?auto_177449 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_177449 ) ( CLEAR ?auto_177448 ) ( ON-TABLE ?auto_177444 ) ( ON ?auto_177445 ?auto_177444 ) ( ON ?auto_177446 ?auto_177445 ) ( ON ?auto_177447 ?auto_177446 ) ( ON ?auto_177448 ?auto_177447 ) ( not ( = ?auto_177444 ?auto_177445 ) ) ( not ( = ?auto_177444 ?auto_177446 ) ) ( not ( = ?auto_177444 ?auto_177447 ) ) ( not ( = ?auto_177444 ?auto_177448 ) ) ( not ( = ?auto_177444 ?auto_177449 ) ) ( not ( = ?auto_177445 ?auto_177446 ) ) ( not ( = ?auto_177445 ?auto_177447 ) ) ( not ( = ?auto_177445 ?auto_177448 ) ) ( not ( = ?auto_177445 ?auto_177449 ) ) ( not ( = ?auto_177446 ?auto_177447 ) ) ( not ( = ?auto_177446 ?auto_177448 ) ) ( not ( = ?auto_177446 ?auto_177449 ) ) ( not ( = ?auto_177447 ?auto_177448 ) ) ( not ( = ?auto_177447 ?auto_177449 ) ) ( not ( = ?auto_177448 ?auto_177449 ) ) )
    :subtasks
    ( ( !STACK ?auto_177449 ?auto_177448 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177450 - BLOCK
      ?auto_177451 - BLOCK
      ?auto_177452 - BLOCK
      ?auto_177453 - BLOCK
      ?auto_177454 - BLOCK
      ?auto_177455 - BLOCK
    )
    :vars
    (
      ?auto_177456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177454 ) ( ON-TABLE ?auto_177450 ) ( ON ?auto_177451 ?auto_177450 ) ( ON ?auto_177452 ?auto_177451 ) ( ON ?auto_177453 ?auto_177452 ) ( ON ?auto_177454 ?auto_177453 ) ( not ( = ?auto_177450 ?auto_177451 ) ) ( not ( = ?auto_177450 ?auto_177452 ) ) ( not ( = ?auto_177450 ?auto_177453 ) ) ( not ( = ?auto_177450 ?auto_177454 ) ) ( not ( = ?auto_177450 ?auto_177455 ) ) ( not ( = ?auto_177451 ?auto_177452 ) ) ( not ( = ?auto_177451 ?auto_177453 ) ) ( not ( = ?auto_177451 ?auto_177454 ) ) ( not ( = ?auto_177451 ?auto_177455 ) ) ( not ( = ?auto_177452 ?auto_177453 ) ) ( not ( = ?auto_177452 ?auto_177454 ) ) ( not ( = ?auto_177452 ?auto_177455 ) ) ( not ( = ?auto_177453 ?auto_177454 ) ) ( not ( = ?auto_177453 ?auto_177455 ) ) ( not ( = ?auto_177454 ?auto_177455 ) ) ( ON ?auto_177455 ?auto_177456 ) ( CLEAR ?auto_177455 ) ( HAND-EMPTY ) ( not ( = ?auto_177450 ?auto_177456 ) ) ( not ( = ?auto_177451 ?auto_177456 ) ) ( not ( = ?auto_177452 ?auto_177456 ) ) ( not ( = ?auto_177453 ?auto_177456 ) ) ( not ( = ?auto_177454 ?auto_177456 ) ) ( not ( = ?auto_177455 ?auto_177456 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177455 ?auto_177456 )
      ( MAKE-6PILE ?auto_177450 ?auto_177451 ?auto_177452 ?auto_177453 ?auto_177454 ?auto_177455 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177457 - BLOCK
      ?auto_177458 - BLOCK
      ?auto_177459 - BLOCK
      ?auto_177460 - BLOCK
      ?auto_177461 - BLOCK
      ?auto_177462 - BLOCK
    )
    :vars
    (
      ?auto_177463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177457 ) ( ON ?auto_177458 ?auto_177457 ) ( ON ?auto_177459 ?auto_177458 ) ( ON ?auto_177460 ?auto_177459 ) ( not ( = ?auto_177457 ?auto_177458 ) ) ( not ( = ?auto_177457 ?auto_177459 ) ) ( not ( = ?auto_177457 ?auto_177460 ) ) ( not ( = ?auto_177457 ?auto_177461 ) ) ( not ( = ?auto_177457 ?auto_177462 ) ) ( not ( = ?auto_177458 ?auto_177459 ) ) ( not ( = ?auto_177458 ?auto_177460 ) ) ( not ( = ?auto_177458 ?auto_177461 ) ) ( not ( = ?auto_177458 ?auto_177462 ) ) ( not ( = ?auto_177459 ?auto_177460 ) ) ( not ( = ?auto_177459 ?auto_177461 ) ) ( not ( = ?auto_177459 ?auto_177462 ) ) ( not ( = ?auto_177460 ?auto_177461 ) ) ( not ( = ?auto_177460 ?auto_177462 ) ) ( not ( = ?auto_177461 ?auto_177462 ) ) ( ON ?auto_177462 ?auto_177463 ) ( CLEAR ?auto_177462 ) ( not ( = ?auto_177457 ?auto_177463 ) ) ( not ( = ?auto_177458 ?auto_177463 ) ) ( not ( = ?auto_177459 ?auto_177463 ) ) ( not ( = ?auto_177460 ?auto_177463 ) ) ( not ( = ?auto_177461 ?auto_177463 ) ) ( not ( = ?auto_177462 ?auto_177463 ) ) ( HOLDING ?auto_177461 ) ( CLEAR ?auto_177460 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177457 ?auto_177458 ?auto_177459 ?auto_177460 ?auto_177461 )
      ( MAKE-6PILE ?auto_177457 ?auto_177458 ?auto_177459 ?auto_177460 ?auto_177461 ?auto_177462 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177464 - BLOCK
      ?auto_177465 - BLOCK
      ?auto_177466 - BLOCK
      ?auto_177467 - BLOCK
      ?auto_177468 - BLOCK
      ?auto_177469 - BLOCK
    )
    :vars
    (
      ?auto_177470 - BLOCK
      ?auto_177472 - BLOCK
      ?auto_177471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177464 ) ( ON ?auto_177465 ?auto_177464 ) ( ON ?auto_177466 ?auto_177465 ) ( ON ?auto_177467 ?auto_177466 ) ( not ( = ?auto_177464 ?auto_177465 ) ) ( not ( = ?auto_177464 ?auto_177466 ) ) ( not ( = ?auto_177464 ?auto_177467 ) ) ( not ( = ?auto_177464 ?auto_177468 ) ) ( not ( = ?auto_177464 ?auto_177469 ) ) ( not ( = ?auto_177465 ?auto_177466 ) ) ( not ( = ?auto_177465 ?auto_177467 ) ) ( not ( = ?auto_177465 ?auto_177468 ) ) ( not ( = ?auto_177465 ?auto_177469 ) ) ( not ( = ?auto_177466 ?auto_177467 ) ) ( not ( = ?auto_177466 ?auto_177468 ) ) ( not ( = ?auto_177466 ?auto_177469 ) ) ( not ( = ?auto_177467 ?auto_177468 ) ) ( not ( = ?auto_177467 ?auto_177469 ) ) ( not ( = ?auto_177468 ?auto_177469 ) ) ( ON ?auto_177469 ?auto_177470 ) ( not ( = ?auto_177464 ?auto_177470 ) ) ( not ( = ?auto_177465 ?auto_177470 ) ) ( not ( = ?auto_177466 ?auto_177470 ) ) ( not ( = ?auto_177467 ?auto_177470 ) ) ( not ( = ?auto_177468 ?auto_177470 ) ) ( not ( = ?auto_177469 ?auto_177470 ) ) ( CLEAR ?auto_177467 ) ( ON ?auto_177468 ?auto_177469 ) ( CLEAR ?auto_177468 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177472 ) ( ON ?auto_177471 ?auto_177472 ) ( ON ?auto_177470 ?auto_177471 ) ( not ( = ?auto_177472 ?auto_177471 ) ) ( not ( = ?auto_177472 ?auto_177470 ) ) ( not ( = ?auto_177472 ?auto_177469 ) ) ( not ( = ?auto_177472 ?auto_177468 ) ) ( not ( = ?auto_177471 ?auto_177470 ) ) ( not ( = ?auto_177471 ?auto_177469 ) ) ( not ( = ?auto_177471 ?auto_177468 ) ) ( not ( = ?auto_177464 ?auto_177472 ) ) ( not ( = ?auto_177464 ?auto_177471 ) ) ( not ( = ?auto_177465 ?auto_177472 ) ) ( not ( = ?auto_177465 ?auto_177471 ) ) ( not ( = ?auto_177466 ?auto_177472 ) ) ( not ( = ?auto_177466 ?auto_177471 ) ) ( not ( = ?auto_177467 ?auto_177472 ) ) ( not ( = ?auto_177467 ?auto_177471 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177472 ?auto_177471 ?auto_177470 ?auto_177469 )
      ( MAKE-6PILE ?auto_177464 ?auto_177465 ?auto_177466 ?auto_177467 ?auto_177468 ?auto_177469 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177473 - BLOCK
      ?auto_177474 - BLOCK
      ?auto_177475 - BLOCK
      ?auto_177476 - BLOCK
      ?auto_177477 - BLOCK
      ?auto_177478 - BLOCK
    )
    :vars
    (
      ?auto_177481 - BLOCK
      ?auto_177479 - BLOCK
      ?auto_177480 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177473 ) ( ON ?auto_177474 ?auto_177473 ) ( ON ?auto_177475 ?auto_177474 ) ( not ( = ?auto_177473 ?auto_177474 ) ) ( not ( = ?auto_177473 ?auto_177475 ) ) ( not ( = ?auto_177473 ?auto_177476 ) ) ( not ( = ?auto_177473 ?auto_177477 ) ) ( not ( = ?auto_177473 ?auto_177478 ) ) ( not ( = ?auto_177474 ?auto_177475 ) ) ( not ( = ?auto_177474 ?auto_177476 ) ) ( not ( = ?auto_177474 ?auto_177477 ) ) ( not ( = ?auto_177474 ?auto_177478 ) ) ( not ( = ?auto_177475 ?auto_177476 ) ) ( not ( = ?auto_177475 ?auto_177477 ) ) ( not ( = ?auto_177475 ?auto_177478 ) ) ( not ( = ?auto_177476 ?auto_177477 ) ) ( not ( = ?auto_177476 ?auto_177478 ) ) ( not ( = ?auto_177477 ?auto_177478 ) ) ( ON ?auto_177478 ?auto_177481 ) ( not ( = ?auto_177473 ?auto_177481 ) ) ( not ( = ?auto_177474 ?auto_177481 ) ) ( not ( = ?auto_177475 ?auto_177481 ) ) ( not ( = ?auto_177476 ?auto_177481 ) ) ( not ( = ?auto_177477 ?auto_177481 ) ) ( not ( = ?auto_177478 ?auto_177481 ) ) ( ON ?auto_177477 ?auto_177478 ) ( CLEAR ?auto_177477 ) ( ON-TABLE ?auto_177479 ) ( ON ?auto_177480 ?auto_177479 ) ( ON ?auto_177481 ?auto_177480 ) ( not ( = ?auto_177479 ?auto_177480 ) ) ( not ( = ?auto_177479 ?auto_177481 ) ) ( not ( = ?auto_177479 ?auto_177478 ) ) ( not ( = ?auto_177479 ?auto_177477 ) ) ( not ( = ?auto_177480 ?auto_177481 ) ) ( not ( = ?auto_177480 ?auto_177478 ) ) ( not ( = ?auto_177480 ?auto_177477 ) ) ( not ( = ?auto_177473 ?auto_177479 ) ) ( not ( = ?auto_177473 ?auto_177480 ) ) ( not ( = ?auto_177474 ?auto_177479 ) ) ( not ( = ?auto_177474 ?auto_177480 ) ) ( not ( = ?auto_177475 ?auto_177479 ) ) ( not ( = ?auto_177475 ?auto_177480 ) ) ( not ( = ?auto_177476 ?auto_177479 ) ) ( not ( = ?auto_177476 ?auto_177480 ) ) ( HOLDING ?auto_177476 ) ( CLEAR ?auto_177475 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177473 ?auto_177474 ?auto_177475 ?auto_177476 )
      ( MAKE-6PILE ?auto_177473 ?auto_177474 ?auto_177475 ?auto_177476 ?auto_177477 ?auto_177478 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177482 - BLOCK
      ?auto_177483 - BLOCK
      ?auto_177484 - BLOCK
      ?auto_177485 - BLOCK
      ?auto_177486 - BLOCK
      ?auto_177487 - BLOCK
    )
    :vars
    (
      ?auto_177489 - BLOCK
      ?auto_177488 - BLOCK
      ?auto_177490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177482 ) ( ON ?auto_177483 ?auto_177482 ) ( ON ?auto_177484 ?auto_177483 ) ( not ( = ?auto_177482 ?auto_177483 ) ) ( not ( = ?auto_177482 ?auto_177484 ) ) ( not ( = ?auto_177482 ?auto_177485 ) ) ( not ( = ?auto_177482 ?auto_177486 ) ) ( not ( = ?auto_177482 ?auto_177487 ) ) ( not ( = ?auto_177483 ?auto_177484 ) ) ( not ( = ?auto_177483 ?auto_177485 ) ) ( not ( = ?auto_177483 ?auto_177486 ) ) ( not ( = ?auto_177483 ?auto_177487 ) ) ( not ( = ?auto_177484 ?auto_177485 ) ) ( not ( = ?auto_177484 ?auto_177486 ) ) ( not ( = ?auto_177484 ?auto_177487 ) ) ( not ( = ?auto_177485 ?auto_177486 ) ) ( not ( = ?auto_177485 ?auto_177487 ) ) ( not ( = ?auto_177486 ?auto_177487 ) ) ( ON ?auto_177487 ?auto_177489 ) ( not ( = ?auto_177482 ?auto_177489 ) ) ( not ( = ?auto_177483 ?auto_177489 ) ) ( not ( = ?auto_177484 ?auto_177489 ) ) ( not ( = ?auto_177485 ?auto_177489 ) ) ( not ( = ?auto_177486 ?auto_177489 ) ) ( not ( = ?auto_177487 ?auto_177489 ) ) ( ON ?auto_177486 ?auto_177487 ) ( ON-TABLE ?auto_177488 ) ( ON ?auto_177490 ?auto_177488 ) ( ON ?auto_177489 ?auto_177490 ) ( not ( = ?auto_177488 ?auto_177490 ) ) ( not ( = ?auto_177488 ?auto_177489 ) ) ( not ( = ?auto_177488 ?auto_177487 ) ) ( not ( = ?auto_177488 ?auto_177486 ) ) ( not ( = ?auto_177490 ?auto_177489 ) ) ( not ( = ?auto_177490 ?auto_177487 ) ) ( not ( = ?auto_177490 ?auto_177486 ) ) ( not ( = ?auto_177482 ?auto_177488 ) ) ( not ( = ?auto_177482 ?auto_177490 ) ) ( not ( = ?auto_177483 ?auto_177488 ) ) ( not ( = ?auto_177483 ?auto_177490 ) ) ( not ( = ?auto_177484 ?auto_177488 ) ) ( not ( = ?auto_177484 ?auto_177490 ) ) ( not ( = ?auto_177485 ?auto_177488 ) ) ( not ( = ?auto_177485 ?auto_177490 ) ) ( CLEAR ?auto_177484 ) ( ON ?auto_177485 ?auto_177486 ) ( CLEAR ?auto_177485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177488 ?auto_177490 ?auto_177489 ?auto_177487 ?auto_177486 )
      ( MAKE-6PILE ?auto_177482 ?auto_177483 ?auto_177484 ?auto_177485 ?auto_177486 ?auto_177487 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177491 - BLOCK
      ?auto_177492 - BLOCK
      ?auto_177493 - BLOCK
      ?auto_177494 - BLOCK
      ?auto_177495 - BLOCK
      ?auto_177496 - BLOCK
    )
    :vars
    (
      ?auto_177499 - BLOCK
      ?auto_177498 - BLOCK
      ?auto_177497 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177491 ) ( ON ?auto_177492 ?auto_177491 ) ( not ( = ?auto_177491 ?auto_177492 ) ) ( not ( = ?auto_177491 ?auto_177493 ) ) ( not ( = ?auto_177491 ?auto_177494 ) ) ( not ( = ?auto_177491 ?auto_177495 ) ) ( not ( = ?auto_177491 ?auto_177496 ) ) ( not ( = ?auto_177492 ?auto_177493 ) ) ( not ( = ?auto_177492 ?auto_177494 ) ) ( not ( = ?auto_177492 ?auto_177495 ) ) ( not ( = ?auto_177492 ?auto_177496 ) ) ( not ( = ?auto_177493 ?auto_177494 ) ) ( not ( = ?auto_177493 ?auto_177495 ) ) ( not ( = ?auto_177493 ?auto_177496 ) ) ( not ( = ?auto_177494 ?auto_177495 ) ) ( not ( = ?auto_177494 ?auto_177496 ) ) ( not ( = ?auto_177495 ?auto_177496 ) ) ( ON ?auto_177496 ?auto_177499 ) ( not ( = ?auto_177491 ?auto_177499 ) ) ( not ( = ?auto_177492 ?auto_177499 ) ) ( not ( = ?auto_177493 ?auto_177499 ) ) ( not ( = ?auto_177494 ?auto_177499 ) ) ( not ( = ?auto_177495 ?auto_177499 ) ) ( not ( = ?auto_177496 ?auto_177499 ) ) ( ON ?auto_177495 ?auto_177496 ) ( ON-TABLE ?auto_177498 ) ( ON ?auto_177497 ?auto_177498 ) ( ON ?auto_177499 ?auto_177497 ) ( not ( = ?auto_177498 ?auto_177497 ) ) ( not ( = ?auto_177498 ?auto_177499 ) ) ( not ( = ?auto_177498 ?auto_177496 ) ) ( not ( = ?auto_177498 ?auto_177495 ) ) ( not ( = ?auto_177497 ?auto_177499 ) ) ( not ( = ?auto_177497 ?auto_177496 ) ) ( not ( = ?auto_177497 ?auto_177495 ) ) ( not ( = ?auto_177491 ?auto_177498 ) ) ( not ( = ?auto_177491 ?auto_177497 ) ) ( not ( = ?auto_177492 ?auto_177498 ) ) ( not ( = ?auto_177492 ?auto_177497 ) ) ( not ( = ?auto_177493 ?auto_177498 ) ) ( not ( = ?auto_177493 ?auto_177497 ) ) ( not ( = ?auto_177494 ?auto_177498 ) ) ( not ( = ?auto_177494 ?auto_177497 ) ) ( ON ?auto_177494 ?auto_177495 ) ( CLEAR ?auto_177494 ) ( HOLDING ?auto_177493 ) ( CLEAR ?auto_177492 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177491 ?auto_177492 ?auto_177493 )
      ( MAKE-6PILE ?auto_177491 ?auto_177492 ?auto_177493 ?auto_177494 ?auto_177495 ?auto_177496 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177500 - BLOCK
      ?auto_177501 - BLOCK
      ?auto_177502 - BLOCK
      ?auto_177503 - BLOCK
      ?auto_177504 - BLOCK
      ?auto_177505 - BLOCK
    )
    :vars
    (
      ?auto_177507 - BLOCK
      ?auto_177506 - BLOCK
      ?auto_177508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177500 ) ( ON ?auto_177501 ?auto_177500 ) ( not ( = ?auto_177500 ?auto_177501 ) ) ( not ( = ?auto_177500 ?auto_177502 ) ) ( not ( = ?auto_177500 ?auto_177503 ) ) ( not ( = ?auto_177500 ?auto_177504 ) ) ( not ( = ?auto_177500 ?auto_177505 ) ) ( not ( = ?auto_177501 ?auto_177502 ) ) ( not ( = ?auto_177501 ?auto_177503 ) ) ( not ( = ?auto_177501 ?auto_177504 ) ) ( not ( = ?auto_177501 ?auto_177505 ) ) ( not ( = ?auto_177502 ?auto_177503 ) ) ( not ( = ?auto_177502 ?auto_177504 ) ) ( not ( = ?auto_177502 ?auto_177505 ) ) ( not ( = ?auto_177503 ?auto_177504 ) ) ( not ( = ?auto_177503 ?auto_177505 ) ) ( not ( = ?auto_177504 ?auto_177505 ) ) ( ON ?auto_177505 ?auto_177507 ) ( not ( = ?auto_177500 ?auto_177507 ) ) ( not ( = ?auto_177501 ?auto_177507 ) ) ( not ( = ?auto_177502 ?auto_177507 ) ) ( not ( = ?auto_177503 ?auto_177507 ) ) ( not ( = ?auto_177504 ?auto_177507 ) ) ( not ( = ?auto_177505 ?auto_177507 ) ) ( ON ?auto_177504 ?auto_177505 ) ( ON-TABLE ?auto_177506 ) ( ON ?auto_177508 ?auto_177506 ) ( ON ?auto_177507 ?auto_177508 ) ( not ( = ?auto_177506 ?auto_177508 ) ) ( not ( = ?auto_177506 ?auto_177507 ) ) ( not ( = ?auto_177506 ?auto_177505 ) ) ( not ( = ?auto_177506 ?auto_177504 ) ) ( not ( = ?auto_177508 ?auto_177507 ) ) ( not ( = ?auto_177508 ?auto_177505 ) ) ( not ( = ?auto_177508 ?auto_177504 ) ) ( not ( = ?auto_177500 ?auto_177506 ) ) ( not ( = ?auto_177500 ?auto_177508 ) ) ( not ( = ?auto_177501 ?auto_177506 ) ) ( not ( = ?auto_177501 ?auto_177508 ) ) ( not ( = ?auto_177502 ?auto_177506 ) ) ( not ( = ?auto_177502 ?auto_177508 ) ) ( not ( = ?auto_177503 ?auto_177506 ) ) ( not ( = ?auto_177503 ?auto_177508 ) ) ( ON ?auto_177503 ?auto_177504 ) ( CLEAR ?auto_177501 ) ( ON ?auto_177502 ?auto_177503 ) ( CLEAR ?auto_177502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177506 ?auto_177508 ?auto_177507 ?auto_177505 ?auto_177504 ?auto_177503 )
      ( MAKE-6PILE ?auto_177500 ?auto_177501 ?auto_177502 ?auto_177503 ?auto_177504 ?auto_177505 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177509 - BLOCK
      ?auto_177510 - BLOCK
      ?auto_177511 - BLOCK
      ?auto_177512 - BLOCK
      ?auto_177513 - BLOCK
      ?auto_177514 - BLOCK
    )
    :vars
    (
      ?auto_177516 - BLOCK
      ?auto_177515 - BLOCK
      ?auto_177517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177509 ) ( not ( = ?auto_177509 ?auto_177510 ) ) ( not ( = ?auto_177509 ?auto_177511 ) ) ( not ( = ?auto_177509 ?auto_177512 ) ) ( not ( = ?auto_177509 ?auto_177513 ) ) ( not ( = ?auto_177509 ?auto_177514 ) ) ( not ( = ?auto_177510 ?auto_177511 ) ) ( not ( = ?auto_177510 ?auto_177512 ) ) ( not ( = ?auto_177510 ?auto_177513 ) ) ( not ( = ?auto_177510 ?auto_177514 ) ) ( not ( = ?auto_177511 ?auto_177512 ) ) ( not ( = ?auto_177511 ?auto_177513 ) ) ( not ( = ?auto_177511 ?auto_177514 ) ) ( not ( = ?auto_177512 ?auto_177513 ) ) ( not ( = ?auto_177512 ?auto_177514 ) ) ( not ( = ?auto_177513 ?auto_177514 ) ) ( ON ?auto_177514 ?auto_177516 ) ( not ( = ?auto_177509 ?auto_177516 ) ) ( not ( = ?auto_177510 ?auto_177516 ) ) ( not ( = ?auto_177511 ?auto_177516 ) ) ( not ( = ?auto_177512 ?auto_177516 ) ) ( not ( = ?auto_177513 ?auto_177516 ) ) ( not ( = ?auto_177514 ?auto_177516 ) ) ( ON ?auto_177513 ?auto_177514 ) ( ON-TABLE ?auto_177515 ) ( ON ?auto_177517 ?auto_177515 ) ( ON ?auto_177516 ?auto_177517 ) ( not ( = ?auto_177515 ?auto_177517 ) ) ( not ( = ?auto_177515 ?auto_177516 ) ) ( not ( = ?auto_177515 ?auto_177514 ) ) ( not ( = ?auto_177515 ?auto_177513 ) ) ( not ( = ?auto_177517 ?auto_177516 ) ) ( not ( = ?auto_177517 ?auto_177514 ) ) ( not ( = ?auto_177517 ?auto_177513 ) ) ( not ( = ?auto_177509 ?auto_177515 ) ) ( not ( = ?auto_177509 ?auto_177517 ) ) ( not ( = ?auto_177510 ?auto_177515 ) ) ( not ( = ?auto_177510 ?auto_177517 ) ) ( not ( = ?auto_177511 ?auto_177515 ) ) ( not ( = ?auto_177511 ?auto_177517 ) ) ( not ( = ?auto_177512 ?auto_177515 ) ) ( not ( = ?auto_177512 ?auto_177517 ) ) ( ON ?auto_177512 ?auto_177513 ) ( ON ?auto_177511 ?auto_177512 ) ( CLEAR ?auto_177511 ) ( HOLDING ?auto_177510 ) ( CLEAR ?auto_177509 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177509 ?auto_177510 )
      ( MAKE-6PILE ?auto_177509 ?auto_177510 ?auto_177511 ?auto_177512 ?auto_177513 ?auto_177514 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177518 - BLOCK
      ?auto_177519 - BLOCK
      ?auto_177520 - BLOCK
      ?auto_177521 - BLOCK
      ?auto_177522 - BLOCK
      ?auto_177523 - BLOCK
    )
    :vars
    (
      ?auto_177526 - BLOCK
      ?auto_177524 - BLOCK
      ?auto_177525 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177518 ) ( not ( = ?auto_177518 ?auto_177519 ) ) ( not ( = ?auto_177518 ?auto_177520 ) ) ( not ( = ?auto_177518 ?auto_177521 ) ) ( not ( = ?auto_177518 ?auto_177522 ) ) ( not ( = ?auto_177518 ?auto_177523 ) ) ( not ( = ?auto_177519 ?auto_177520 ) ) ( not ( = ?auto_177519 ?auto_177521 ) ) ( not ( = ?auto_177519 ?auto_177522 ) ) ( not ( = ?auto_177519 ?auto_177523 ) ) ( not ( = ?auto_177520 ?auto_177521 ) ) ( not ( = ?auto_177520 ?auto_177522 ) ) ( not ( = ?auto_177520 ?auto_177523 ) ) ( not ( = ?auto_177521 ?auto_177522 ) ) ( not ( = ?auto_177521 ?auto_177523 ) ) ( not ( = ?auto_177522 ?auto_177523 ) ) ( ON ?auto_177523 ?auto_177526 ) ( not ( = ?auto_177518 ?auto_177526 ) ) ( not ( = ?auto_177519 ?auto_177526 ) ) ( not ( = ?auto_177520 ?auto_177526 ) ) ( not ( = ?auto_177521 ?auto_177526 ) ) ( not ( = ?auto_177522 ?auto_177526 ) ) ( not ( = ?auto_177523 ?auto_177526 ) ) ( ON ?auto_177522 ?auto_177523 ) ( ON-TABLE ?auto_177524 ) ( ON ?auto_177525 ?auto_177524 ) ( ON ?auto_177526 ?auto_177525 ) ( not ( = ?auto_177524 ?auto_177525 ) ) ( not ( = ?auto_177524 ?auto_177526 ) ) ( not ( = ?auto_177524 ?auto_177523 ) ) ( not ( = ?auto_177524 ?auto_177522 ) ) ( not ( = ?auto_177525 ?auto_177526 ) ) ( not ( = ?auto_177525 ?auto_177523 ) ) ( not ( = ?auto_177525 ?auto_177522 ) ) ( not ( = ?auto_177518 ?auto_177524 ) ) ( not ( = ?auto_177518 ?auto_177525 ) ) ( not ( = ?auto_177519 ?auto_177524 ) ) ( not ( = ?auto_177519 ?auto_177525 ) ) ( not ( = ?auto_177520 ?auto_177524 ) ) ( not ( = ?auto_177520 ?auto_177525 ) ) ( not ( = ?auto_177521 ?auto_177524 ) ) ( not ( = ?auto_177521 ?auto_177525 ) ) ( ON ?auto_177521 ?auto_177522 ) ( ON ?auto_177520 ?auto_177521 ) ( CLEAR ?auto_177518 ) ( ON ?auto_177519 ?auto_177520 ) ( CLEAR ?auto_177519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177524 ?auto_177525 ?auto_177526 ?auto_177523 ?auto_177522 ?auto_177521 ?auto_177520 )
      ( MAKE-6PILE ?auto_177518 ?auto_177519 ?auto_177520 ?auto_177521 ?auto_177522 ?auto_177523 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177527 - BLOCK
      ?auto_177528 - BLOCK
      ?auto_177529 - BLOCK
      ?auto_177530 - BLOCK
      ?auto_177531 - BLOCK
      ?auto_177532 - BLOCK
    )
    :vars
    (
      ?auto_177534 - BLOCK
      ?auto_177533 - BLOCK
      ?auto_177535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177527 ?auto_177528 ) ) ( not ( = ?auto_177527 ?auto_177529 ) ) ( not ( = ?auto_177527 ?auto_177530 ) ) ( not ( = ?auto_177527 ?auto_177531 ) ) ( not ( = ?auto_177527 ?auto_177532 ) ) ( not ( = ?auto_177528 ?auto_177529 ) ) ( not ( = ?auto_177528 ?auto_177530 ) ) ( not ( = ?auto_177528 ?auto_177531 ) ) ( not ( = ?auto_177528 ?auto_177532 ) ) ( not ( = ?auto_177529 ?auto_177530 ) ) ( not ( = ?auto_177529 ?auto_177531 ) ) ( not ( = ?auto_177529 ?auto_177532 ) ) ( not ( = ?auto_177530 ?auto_177531 ) ) ( not ( = ?auto_177530 ?auto_177532 ) ) ( not ( = ?auto_177531 ?auto_177532 ) ) ( ON ?auto_177532 ?auto_177534 ) ( not ( = ?auto_177527 ?auto_177534 ) ) ( not ( = ?auto_177528 ?auto_177534 ) ) ( not ( = ?auto_177529 ?auto_177534 ) ) ( not ( = ?auto_177530 ?auto_177534 ) ) ( not ( = ?auto_177531 ?auto_177534 ) ) ( not ( = ?auto_177532 ?auto_177534 ) ) ( ON ?auto_177531 ?auto_177532 ) ( ON-TABLE ?auto_177533 ) ( ON ?auto_177535 ?auto_177533 ) ( ON ?auto_177534 ?auto_177535 ) ( not ( = ?auto_177533 ?auto_177535 ) ) ( not ( = ?auto_177533 ?auto_177534 ) ) ( not ( = ?auto_177533 ?auto_177532 ) ) ( not ( = ?auto_177533 ?auto_177531 ) ) ( not ( = ?auto_177535 ?auto_177534 ) ) ( not ( = ?auto_177535 ?auto_177532 ) ) ( not ( = ?auto_177535 ?auto_177531 ) ) ( not ( = ?auto_177527 ?auto_177533 ) ) ( not ( = ?auto_177527 ?auto_177535 ) ) ( not ( = ?auto_177528 ?auto_177533 ) ) ( not ( = ?auto_177528 ?auto_177535 ) ) ( not ( = ?auto_177529 ?auto_177533 ) ) ( not ( = ?auto_177529 ?auto_177535 ) ) ( not ( = ?auto_177530 ?auto_177533 ) ) ( not ( = ?auto_177530 ?auto_177535 ) ) ( ON ?auto_177530 ?auto_177531 ) ( ON ?auto_177529 ?auto_177530 ) ( ON ?auto_177528 ?auto_177529 ) ( CLEAR ?auto_177528 ) ( HOLDING ?auto_177527 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177527 )
      ( MAKE-6PILE ?auto_177527 ?auto_177528 ?auto_177529 ?auto_177530 ?auto_177531 ?auto_177532 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_177536 - BLOCK
      ?auto_177537 - BLOCK
      ?auto_177538 - BLOCK
      ?auto_177539 - BLOCK
      ?auto_177540 - BLOCK
      ?auto_177541 - BLOCK
    )
    :vars
    (
      ?auto_177544 - BLOCK
      ?auto_177543 - BLOCK
      ?auto_177542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177536 ?auto_177537 ) ) ( not ( = ?auto_177536 ?auto_177538 ) ) ( not ( = ?auto_177536 ?auto_177539 ) ) ( not ( = ?auto_177536 ?auto_177540 ) ) ( not ( = ?auto_177536 ?auto_177541 ) ) ( not ( = ?auto_177537 ?auto_177538 ) ) ( not ( = ?auto_177537 ?auto_177539 ) ) ( not ( = ?auto_177537 ?auto_177540 ) ) ( not ( = ?auto_177537 ?auto_177541 ) ) ( not ( = ?auto_177538 ?auto_177539 ) ) ( not ( = ?auto_177538 ?auto_177540 ) ) ( not ( = ?auto_177538 ?auto_177541 ) ) ( not ( = ?auto_177539 ?auto_177540 ) ) ( not ( = ?auto_177539 ?auto_177541 ) ) ( not ( = ?auto_177540 ?auto_177541 ) ) ( ON ?auto_177541 ?auto_177544 ) ( not ( = ?auto_177536 ?auto_177544 ) ) ( not ( = ?auto_177537 ?auto_177544 ) ) ( not ( = ?auto_177538 ?auto_177544 ) ) ( not ( = ?auto_177539 ?auto_177544 ) ) ( not ( = ?auto_177540 ?auto_177544 ) ) ( not ( = ?auto_177541 ?auto_177544 ) ) ( ON ?auto_177540 ?auto_177541 ) ( ON-TABLE ?auto_177543 ) ( ON ?auto_177542 ?auto_177543 ) ( ON ?auto_177544 ?auto_177542 ) ( not ( = ?auto_177543 ?auto_177542 ) ) ( not ( = ?auto_177543 ?auto_177544 ) ) ( not ( = ?auto_177543 ?auto_177541 ) ) ( not ( = ?auto_177543 ?auto_177540 ) ) ( not ( = ?auto_177542 ?auto_177544 ) ) ( not ( = ?auto_177542 ?auto_177541 ) ) ( not ( = ?auto_177542 ?auto_177540 ) ) ( not ( = ?auto_177536 ?auto_177543 ) ) ( not ( = ?auto_177536 ?auto_177542 ) ) ( not ( = ?auto_177537 ?auto_177543 ) ) ( not ( = ?auto_177537 ?auto_177542 ) ) ( not ( = ?auto_177538 ?auto_177543 ) ) ( not ( = ?auto_177538 ?auto_177542 ) ) ( not ( = ?auto_177539 ?auto_177543 ) ) ( not ( = ?auto_177539 ?auto_177542 ) ) ( ON ?auto_177539 ?auto_177540 ) ( ON ?auto_177538 ?auto_177539 ) ( ON ?auto_177537 ?auto_177538 ) ( ON ?auto_177536 ?auto_177537 ) ( CLEAR ?auto_177536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177543 ?auto_177542 ?auto_177544 ?auto_177541 ?auto_177540 ?auto_177539 ?auto_177538 ?auto_177537 )
      ( MAKE-6PILE ?auto_177536 ?auto_177537 ?auto_177538 ?auto_177539 ?auto_177540 ?auto_177541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177547 - BLOCK
      ?auto_177548 - BLOCK
    )
    :vars
    (
      ?auto_177549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177549 ?auto_177548 ) ( CLEAR ?auto_177549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177547 ) ( ON ?auto_177548 ?auto_177547 ) ( not ( = ?auto_177547 ?auto_177548 ) ) ( not ( = ?auto_177547 ?auto_177549 ) ) ( not ( = ?auto_177548 ?auto_177549 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177549 ?auto_177548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177550 - BLOCK
      ?auto_177551 - BLOCK
    )
    :vars
    (
      ?auto_177552 - BLOCK
      ?auto_177553 - BLOCK
      ?auto_177554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177552 ?auto_177551 ) ( CLEAR ?auto_177552 ) ( ON-TABLE ?auto_177550 ) ( ON ?auto_177551 ?auto_177550 ) ( not ( = ?auto_177550 ?auto_177551 ) ) ( not ( = ?auto_177550 ?auto_177552 ) ) ( not ( = ?auto_177551 ?auto_177552 ) ) ( HOLDING ?auto_177553 ) ( CLEAR ?auto_177554 ) ( not ( = ?auto_177550 ?auto_177553 ) ) ( not ( = ?auto_177550 ?auto_177554 ) ) ( not ( = ?auto_177551 ?auto_177553 ) ) ( not ( = ?auto_177551 ?auto_177554 ) ) ( not ( = ?auto_177552 ?auto_177553 ) ) ( not ( = ?auto_177552 ?auto_177554 ) ) ( not ( = ?auto_177553 ?auto_177554 ) ) )
    :subtasks
    ( ( !STACK ?auto_177553 ?auto_177554 )
      ( MAKE-2PILE ?auto_177550 ?auto_177551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177555 - BLOCK
      ?auto_177556 - BLOCK
    )
    :vars
    (
      ?auto_177559 - BLOCK
      ?auto_177557 - BLOCK
      ?auto_177558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177559 ?auto_177556 ) ( ON-TABLE ?auto_177555 ) ( ON ?auto_177556 ?auto_177555 ) ( not ( = ?auto_177555 ?auto_177556 ) ) ( not ( = ?auto_177555 ?auto_177559 ) ) ( not ( = ?auto_177556 ?auto_177559 ) ) ( CLEAR ?auto_177557 ) ( not ( = ?auto_177555 ?auto_177558 ) ) ( not ( = ?auto_177555 ?auto_177557 ) ) ( not ( = ?auto_177556 ?auto_177558 ) ) ( not ( = ?auto_177556 ?auto_177557 ) ) ( not ( = ?auto_177559 ?auto_177558 ) ) ( not ( = ?auto_177559 ?auto_177557 ) ) ( not ( = ?auto_177558 ?auto_177557 ) ) ( ON ?auto_177558 ?auto_177559 ) ( CLEAR ?auto_177558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177555 ?auto_177556 ?auto_177559 )
      ( MAKE-2PILE ?auto_177555 ?auto_177556 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177560 - BLOCK
      ?auto_177561 - BLOCK
    )
    :vars
    (
      ?auto_177563 - BLOCK
      ?auto_177562 - BLOCK
      ?auto_177564 - BLOCK
      ?auto_177568 - BLOCK
      ?auto_177567 - BLOCK
      ?auto_177565 - BLOCK
      ?auto_177566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177563 ?auto_177561 ) ( ON-TABLE ?auto_177560 ) ( ON ?auto_177561 ?auto_177560 ) ( not ( = ?auto_177560 ?auto_177561 ) ) ( not ( = ?auto_177560 ?auto_177563 ) ) ( not ( = ?auto_177561 ?auto_177563 ) ) ( not ( = ?auto_177560 ?auto_177562 ) ) ( not ( = ?auto_177560 ?auto_177564 ) ) ( not ( = ?auto_177561 ?auto_177562 ) ) ( not ( = ?auto_177561 ?auto_177564 ) ) ( not ( = ?auto_177563 ?auto_177562 ) ) ( not ( = ?auto_177563 ?auto_177564 ) ) ( not ( = ?auto_177562 ?auto_177564 ) ) ( ON ?auto_177562 ?auto_177563 ) ( CLEAR ?auto_177562 ) ( HOLDING ?auto_177564 ) ( CLEAR ?auto_177568 ) ( ON-TABLE ?auto_177567 ) ( ON ?auto_177565 ?auto_177567 ) ( ON ?auto_177566 ?auto_177565 ) ( ON ?auto_177568 ?auto_177566 ) ( not ( = ?auto_177567 ?auto_177565 ) ) ( not ( = ?auto_177567 ?auto_177566 ) ) ( not ( = ?auto_177567 ?auto_177568 ) ) ( not ( = ?auto_177567 ?auto_177564 ) ) ( not ( = ?auto_177565 ?auto_177566 ) ) ( not ( = ?auto_177565 ?auto_177568 ) ) ( not ( = ?auto_177565 ?auto_177564 ) ) ( not ( = ?auto_177566 ?auto_177568 ) ) ( not ( = ?auto_177566 ?auto_177564 ) ) ( not ( = ?auto_177568 ?auto_177564 ) ) ( not ( = ?auto_177560 ?auto_177568 ) ) ( not ( = ?auto_177560 ?auto_177567 ) ) ( not ( = ?auto_177560 ?auto_177565 ) ) ( not ( = ?auto_177560 ?auto_177566 ) ) ( not ( = ?auto_177561 ?auto_177568 ) ) ( not ( = ?auto_177561 ?auto_177567 ) ) ( not ( = ?auto_177561 ?auto_177565 ) ) ( not ( = ?auto_177561 ?auto_177566 ) ) ( not ( = ?auto_177563 ?auto_177568 ) ) ( not ( = ?auto_177563 ?auto_177567 ) ) ( not ( = ?auto_177563 ?auto_177565 ) ) ( not ( = ?auto_177563 ?auto_177566 ) ) ( not ( = ?auto_177562 ?auto_177568 ) ) ( not ( = ?auto_177562 ?auto_177567 ) ) ( not ( = ?auto_177562 ?auto_177565 ) ) ( not ( = ?auto_177562 ?auto_177566 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177567 ?auto_177565 ?auto_177566 ?auto_177568 ?auto_177564 )
      ( MAKE-2PILE ?auto_177560 ?auto_177561 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177569 - BLOCK
      ?auto_177570 - BLOCK
    )
    :vars
    (
      ?auto_177576 - BLOCK
      ?auto_177577 - BLOCK
      ?auto_177572 - BLOCK
      ?auto_177575 - BLOCK
      ?auto_177574 - BLOCK
      ?auto_177573 - BLOCK
      ?auto_177571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177576 ?auto_177570 ) ( ON-TABLE ?auto_177569 ) ( ON ?auto_177570 ?auto_177569 ) ( not ( = ?auto_177569 ?auto_177570 ) ) ( not ( = ?auto_177569 ?auto_177576 ) ) ( not ( = ?auto_177570 ?auto_177576 ) ) ( not ( = ?auto_177569 ?auto_177577 ) ) ( not ( = ?auto_177569 ?auto_177572 ) ) ( not ( = ?auto_177570 ?auto_177577 ) ) ( not ( = ?auto_177570 ?auto_177572 ) ) ( not ( = ?auto_177576 ?auto_177577 ) ) ( not ( = ?auto_177576 ?auto_177572 ) ) ( not ( = ?auto_177577 ?auto_177572 ) ) ( ON ?auto_177577 ?auto_177576 ) ( CLEAR ?auto_177575 ) ( ON-TABLE ?auto_177574 ) ( ON ?auto_177573 ?auto_177574 ) ( ON ?auto_177571 ?auto_177573 ) ( ON ?auto_177575 ?auto_177571 ) ( not ( = ?auto_177574 ?auto_177573 ) ) ( not ( = ?auto_177574 ?auto_177571 ) ) ( not ( = ?auto_177574 ?auto_177575 ) ) ( not ( = ?auto_177574 ?auto_177572 ) ) ( not ( = ?auto_177573 ?auto_177571 ) ) ( not ( = ?auto_177573 ?auto_177575 ) ) ( not ( = ?auto_177573 ?auto_177572 ) ) ( not ( = ?auto_177571 ?auto_177575 ) ) ( not ( = ?auto_177571 ?auto_177572 ) ) ( not ( = ?auto_177575 ?auto_177572 ) ) ( not ( = ?auto_177569 ?auto_177575 ) ) ( not ( = ?auto_177569 ?auto_177574 ) ) ( not ( = ?auto_177569 ?auto_177573 ) ) ( not ( = ?auto_177569 ?auto_177571 ) ) ( not ( = ?auto_177570 ?auto_177575 ) ) ( not ( = ?auto_177570 ?auto_177574 ) ) ( not ( = ?auto_177570 ?auto_177573 ) ) ( not ( = ?auto_177570 ?auto_177571 ) ) ( not ( = ?auto_177576 ?auto_177575 ) ) ( not ( = ?auto_177576 ?auto_177574 ) ) ( not ( = ?auto_177576 ?auto_177573 ) ) ( not ( = ?auto_177576 ?auto_177571 ) ) ( not ( = ?auto_177577 ?auto_177575 ) ) ( not ( = ?auto_177577 ?auto_177574 ) ) ( not ( = ?auto_177577 ?auto_177573 ) ) ( not ( = ?auto_177577 ?auto_177571 ) ) ( ON ?auto_177572 ?auto_177577 ) ( CLEAR ?auto_177572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177569 ?auto_177570 ?auto_177576 ?auto_177577 )
      ( MAKE-2PILE ?auto_177569 ?auto_177570 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177578 - BLOCK
      ?auto_177579 - BLOCK
    )
    :vars
    (
      ?auto_177585 - BLOCK
      ?auto_177583 - BLOCK
      ?auto_177581 - BLOCK
      ?auto_177586 - BLOCK
      ?auto_177582 - BLOCK
      ?auto_177580 - BLOCK
      ?auto_177584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177585 ?auto_177579 ) ( ON-TABLE ?auto_177578 ) ( ON ?auto_177579 ?auto_177578 ) ( not ( = ?auto_177578 ?auto_177579 ) ) ( not ( = ?auto_177578 ?auto_177585 ) ) ( not ( = ?auto_177579 ?auto_177585 ) ) ( not ( = ?auto_177578 ?auto_177583 ) ) ( not ( = ?auto_177578 ?auto_177581 ) ) ( not ( = ?auto_177579 ?auto_177583 ) ) ( not ( = ?auto_177579 ?auto_177581 ) ) ( not ( = ?auto_177585 ?auto_177583 ) ) ( not ( = ?auto_177585 ?auto_177581 ) ) ( not ( = ?auto_177583 ?auto_177581 ) ) ( ON ?auto_177583 ?auto_177585 ) ( ON-TABLE ?auto_177586 ) ( ON ?auto_177582 ?auto_177586 ) ( ON ?auto_177580 ?auto_177582 ) ( not ( = ?auto_177586 ?auto_177582 ) ) ( not ( = ?auto_177586 ?auto_177580 ) ) ( not ( = ?auto_177586 ?auto_177584 ) ) ( not ( = ?auto_177586 ?auto_177581 ) ) ( not ( = ?auto_177582 ?auto_177580 ) ) ( not ( = ?auto_177582 ?auto_177584 ) ) ( not ( = ?auto_177582 ?auto_177581 ) ) ( not ( = ?auto_177580 ?auto_177584 ) ) ( not ( = ?auto_177580 ?auto_177581 ) ) ( not ( = ?auto_177584 ?auto_177581 ) ) ( not ( = ?auto_177578 ?auto_177584 ) ) ( not ( = ?auto_177578 ?auto_177586 ) ) ( not ( = ?auto_177578 ?auto_177582 ) ) ( not ( = ?auto_177578 ?auto_177580 ) ) ( not ( = ?auto_177579 ?auto_177584 ) ) ( not ( = ?auto_177579 ?auto_177586 ) ) ( not ( = ?auto_177579 ?auto_177582 ) ) ( not ( = ?auto_177579 ?auto_177580 ) ) ( not ( = ?auto_177585 ?auto_177584 ) ) ( not ( = ?auto_177585 ?auto_177586 ) ) ( not ( = ?auto_177585 ?auto_177582 ) ) ( not ( = ?auto_177585 ?auto_177580 ) ) ( not ( = ?auto_177583 ?auto_177584 ) ) ( not ( = ?auto_177583 ?auto_177586 ) ) ( not ( = ?auto_177583 ?auto_177582 ) ) ( not ( = ?auto_177583 ?auto_177580 ) ) ( ON ?auto_177581 ?auto_177583 ) ( CLEAR ?auto_177581 ) ( HOLDING ?auto_177584 ) ( CLEAR ?auto_177580 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177586 ?auto_177582 ?auto_177580 ?auto_177584 )
      ( MAKE-2PILE ?auto_177578 ?auto_177579 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177587 - BLOCK
      ?auto_177588 - BLOCK
    )
    :vars
    (
      ?auto_177593 - BLOCK
      ?auto_177595 - BLOCK
      ?auto_177590 - BLOCK
      ?auto_177592 - BLOCK
      ?auto_177591 - BLOCK
      ?auto_177594 - BLOCK
      ?auto_177589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177593 ?auto_177588 ) ( ON-TABLE ?auto_177587 ) ( ON ?auto_177588 ?auto_177587 ) ( not ( = ?auto_177587 ?auto_177588 ) ) ( not ( = ?auto_177587 ?auto_177593 ) ) ( not ( = ?auto_177588 ?auto_177593 ) ) ( not ( = ?auto_177587 ?auto_177595 ) ) ( not ( = ?auto_177587 ?auto_177590 ) ) ( not ( = ?auto_177588 ?auto_177595 ) ) ( not ( = ?auto_177588 ?auto_177590 ) ) ( not ( = ?auto_177593 ?auto_177595 ) ) ( not ( = ?auto_177593 ?auto_177590 ) ) ( not ( = ?auto_177595 ?auto_177590 ) ) ( ON ?auto_177595 ?auto_177593 ) ( ON-TABLE ?auto_177592 ) ( ON ?auto_177591 ?auto_177592 ) ( ON ?auto_177594 ?auto_177591 ) ( not ( = ?auto_177592 ?auto_177591 ) ) ( not ( = ?auto_177592 ?auto_177594 ) ) ( not ( = ?auto_177592 ?auto_177589 ) ) ( not ( = ?auto_177592 ?auto_177590 ) ) ( not ( = ?auto_177591 ?auto_177594 ) ) ( not ( = ?auto_177591 ?auto_177589 ) ) ( not ( = ?auto_177591 ?auto_177590 ) ) ( not ( = ?auto_177594 ?auto_177589 ) ) ( not ( = ?auto_177594 ?auto_177590 ) ) ( not ( = ?auto_177589 ?auto_177590 ) ) ( not ( = ?auto_177587 ?auto_177589 ) ) ( not ( = ?auto_177587 ?auto_177592 ) ) ( not ( = ?auto_177587 ?auto_177591 ) ) ( not ( = ?auto_177587 ?auto_177594 ) ) ( not ( = ?auto_177588 ?auto_177589 ) ) ( not ( = ?auto_177588 ?auto_177592 ) ) ( not ( = ?auto_177588 ?auto_177591 ) ) ( not ( = ?auto_177588 ?auto_177594 ) ) ( not ( = ?auto_177593 ?auto_177589 ) ) ( not ( = ?auto_177593 ?auto_177592 ) ) ( not ( = ?auto_177593 ?auto_177591 ) ) ( not ( = ?auto_177593 ?auto_177594 ) ) ( not ( = ?auto_177595 ?auto_177589 ) ) ( not ( = ?auto_177595 ?auto_177592 ) ) ( not ( = ?auto_177595 ?auto_177591 ) ) ( not ( = ?auto_177595 ?auto_177594 ) ) ( ON ?auto_177590 ?auto_177595 ) ( CLEAR ?auto_177594 ) ( ON ?auto_177589 ?auto_177590 ) ( CLEAR ?auto_177589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177587 ?auto_177588 ?auto_177593 ?auto_177595 ?auto_177590 )
      ( MAKE-2PILE ?auto_177587 ?auto_177588 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177596 - BLOCK
      ?auto_177597 - BLOCK
    )
    :vars
    (
      ?auto_177598 - BLOCK
      ?auto_177603 - BLOCK
      ?auto_177604 - BLOCK
      ?auto_177602 - BLOCK
      ?auto_177601 - BLOCK
      ?auto_177599 - BLOCK
      ?auto_177600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177598 ?auto_177597 ) ( ON-TABLE ?auto_177596 ) ( ON ?auto_177597 ?auto_177596 ) ( not ( = ?auto_177596 ?auto_177597 ) ) ( not ( = ?auto_177596 ?auto_177598 ) ) ( not ( = ?auto_177597 ?auto_177598 ) ) ( not ( = ?auto_177596 ?auto_177603 ) ) ( not ( = ?auto_177596 ?auto_177604 ) ) ( not ( = ?auto_177597 ?auto_177603 ) ) ( not ( = ?auto_177597 ?auto_177604 ) ) ( not ( = ?auto_177598 ?auto_177603 ) ) ( not ( = ?auto_177598 ?auto_177604 ) ) ( not ( = ?auto_177603 ?auto_177604 ) ) ( ON ?auto_177603 ?auto_177598 ) ( ON-TABLE ?auto_177602 ) ( ON ?auto_177601 ?auto_177602 ) ( not ( = ?auto_177602 ?auto_177601 ) ) ( not ( = ?auto_177602 ?auto_177599 ) ) ( not ( = ?auto_177602 ?auto_177600 ) ) ( not ( = ?auto_177602 ?auto_177604 ) ) ( not ( = ?auto_177601 ?auto_177599 ) ) ( not ( = ?auto_177601 ?auto_177600 ) ) ( not ( = ?auto_177601 ?auto_177604 ) ) ( not ( = ?auto_177599 ?auto_177600 ) ) ( not ( = ?auto_177599 ?auto_177604 ) ) ( not ( = ?auto_177600 ?auto_177604 ) ) ( not ( = ?auto_177596 ?auto_177600 ) ) ( not ( = ?auto_177596 ?auto_177602 ) ) ( not ( = ?auto_177596 ?auto_177601 ) ) ( not ( = ?auto_177596 ?auto_177599 ) ) ( not ( = ?auto_177597 ?auto_177600 ) ) ( not ( = ?auto_177597 ?auto_177602 ) ) ( not ( = ?auto_177597 ?auto_177601 ) ) ( not ( = ?auto_177597 ?auto_177599 ) ) ( not ( = ?auto_177598 ?auto_177600 ) ) ( not ( = ?auto_177598 ?auto_177602 ) ) ( not ( = ?auto_177598 ?auto_177601 ) ) ( not ( = ?auto_177598 ?auto_177599 ) ) ( not ( = ?auto_177603 ?auto_177600 ) ) ( not ( = ?auto_177603 ?auto_177602 ) ) ( not ( = ?auto_177603 ?auto_177601 ) ) ( not ( = ?auto_177603 ?auto_177599 ) ) ( ON ?auto_177604 ?auto_177603 ) ( ON ?auto_177600 ?auto_177604 ) ( CLEAR ?auto_177600 ) ( HOLDING ?auto_177599 ) ( CLEAR ?auto_177601 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177602 ?auto_177601 ?auto_177599 )
      ( MAKE-2PILE ?auto_177596 ?auto_177597 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177605 - BLOCK
      ?auto_177606 - BLOCK
    )
    :vars
    (
      ?auto_177613 - BLOCK
      ?auto_177607 - BLOCK
      ?auto_177610 - BLOCK
      ?auto_177609 - BLOCK
      ?auto_177611 - BLOCK
      ?auto_177608 - BLOCK
      ?auto_177612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177613 ?auto_177606 ) ( ON-TABLE ?auto_177605 ) ( ON ?auto_177606 ?auto_177605 ) ( not ( = ?auto_177605 ?auto_177606 ) ) ( not ( = ?auto_177605 ?auto_177613 ) ) ( not ( = ?auto_177606 ?auto_177613 ) ) ( not ( = ?auto_177605 ?auto_177607 ) ) ( not ( = ?auto_177605 ?auto_177610 ) ) ( not ( = ?auto_177606 ?auto_177607 ) ) ( not ( = ?auto_177606 ?auto_177610 ) ) ( not ( = ?auto_177613 ?auto_177607 ) ) ( not ( = ?auto_177613 ?auto_177610 ) ) ( not ( = ?auto_177607 ?auto_177610 ) ) ( ON ?auto_177607 ?auto_177613 ) ( ON-TABLE ?auto_177609 ) ( ON ?auto_177611 ?auto_177609 ) ( not ( = ?auto_177609 ?auto_177611 ) ) ( not ( = ?auto_177609 ?auto_177608 ) ) ( not ( = ?auto_177609 ?auto_177612 ) ) ( not ( = ?auto_177609 ?auto_177610 ) ) ( not ( = ?auto_177611 ?auto_177608 ) ) ( not ( = ?auto_177611 ?auto_177612 ) ) ( not ( = ?auto_177611 ?auto_177610 ) ) ( not ( = ?auto_177608 ?auto_177612 ) ) ( not ( = ?auto_177608 ?auto_177610 ) ) ( not ( = ?auto_177612 ?auto_177610 ) ) ( not ( = ?auto_177605 ?auto_177612 ) ) ( not ( = ?auto_177605 ?auto_177609 ) ) ( not ( = ?auto_177605 ?auto_177611 ) ) ( not ( = ?auto_177605 ?auto_177608 ) ) ( not ( = ?auto_177606 ?auto_177612 ) ) ( not ( = ?auto_177606 ?auto_177609 ) ) ( not ( = ?auto_177606 ?auto_177611 ) ) ( not ( = ?auto_177606 ?auto_177608 ) ) ( not ( = ?auto_177613 ?auto_177612 ) ) ( not ( = ?auto_177613 ?auto_177609 ) ) ( not ( = ?auto_177613 ?auto_177611 ) ) ( not ( = ?auto_177613 ?auto_177608 ) ) ( not ( = ?auto_177607 ?auto_177612 ) ) ( not ( = ?auto_177607 ?auto_177609 ) ) ( not ( = ?auto_177607 ?auto_177611 ) ) ( not ( = ?auto_177607 ?auto_177608 ) ) ( ON ?auto_177610 ?auto_177607 ) ( ON ?auto_177612 ?auto_177610 ) ( CLEAR ?auto_177611 ) ( ON ?auto_177608 ?auto_177612 ) ( CLEAR ?auto_177608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177605 ?auto_177606 ?auto_177613 ?auto_177607 ?auto_177610 ?auto_177612 )
      ( MAKE-2PILE ?auto_177605 ?auto_177606 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177614 - BLOCK
      ?auto_177615 - BLOCK
    )
    :vars
    (
      ?auto_177622 - BLOCK
      ?auto_177621 - BLOCK
      ?auto_177616 - BLOCK
      ?auto_177619 - BLOCK
      ?auto_177617 - BLOCK
      ?auto_177620 - BLOCK
      ?auto_177618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177622 ?auto_177615 ) ( ON-TABLE ?auto_177614 ) ( ON ?auto_177615 ?auto_177614 ) ( not ( = ?auto_177614 ?auto_177615 ) ) ( not ( = ?auto_177614 ?auto_177622 ) ) ( not ( = ?auto_177615 ?auto_177622 ) ) ( not ( = ?auto_177614 ?auto_177621 ) ) ( not ( = ?auto_177614 ?auto_177616 ) ) ( not ( = ?auto_177615 ?auto_177621 ) ) ( not ( = ?auto_177615 ?auto_177616 ) ) ( not ( = ?auto_177622 ?auto_177621 ) ) ( not ( = ?auto_177622 ?auto_177616 ) ) ( not ( = ?auto_177621 ?auto_177616 ) ) ( ON ?auto_177621 ?auto_177622 ) ( ON-TABLE ?auto_177619 ) ( not ( = ?auto_177619 ?auto_177617 ) ) ( not ( = ?auto_177619 ?auto_177620 ) ) ( not ( = ?auto_177619 ?auto_177618 ) ) ( not ( = ?auto_177619 ?auto_177616 ) ) ( not ( = ?auto_177617 ?auto_177620 ) ) ( not ( = ?auto_177617 ?auto_177618 ) ) ( not ( = ?auto_177617 ?auto_177616 ) ) ( not ( = ?auto_177620 ?auto_177618 ) ) ( not ( = ?auto_177620 ?auto_177616 ) ) ( not ( = ?auto_177618 ?auto_177616 ) ) ( not ( = ?auto_177614 ?auto_177618 ) ) ( not ( = ?auto_177614 ?auto_177619 ) ) ( not ( = ?auto_177614 ?auto_177617 ) ) ( not ( = ?auto_177614 ?auto_177620 ) ) ( not ( = ?auto_177615 ?auto_177618 ) ) ( not ( = ?auto_177615 ?auto_177619 ) ) ( not ( = ?auto_177615 ?auto_177617 ) ) ( not ( = ?auto_177615 ?auto_177620 ) ) ( not ( = ?auto_177622 ?auto_177618 ) ) ( not ( = ?auto_177622 ?auto_177619 ) ) ( not ( = ?auto_177622 ?auto_177617 ) ) ( not ( = ?auto_177622 ?auto_177620 ) ) ( not ( = ?auto_177621 ?auto_177618 ) ) ( not ( = ?auto_177621 ?auto_177619 ) ) ( not ( = ?auto_177621 ?auto_177617 ) ) ( not ( = ?auto_177621 ?auto_177620 ) ) ( ON ?auto_177616 ?auto_177621 ) ( ON ?auto_177618 ?auto_177616 ) ( ON ?auto_177620 ?auto_177618 ) ( CLEAR ?auto_177620 ) ( HOLDING ?auto_177617 ) ( CLEAR ?auto_177619 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177619 ?auto_177617 )
      ( MAKE-2PILE ?auto_177614 ?auto_177615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179641 - BLOCK
      ?auto_179642 - BLOCK
    )
    :vars
    (
      ?auto_179643 - BLOCK
      ?auto_179645 - BLOCK
      ?auto_179646 - BLOCK
      ?auto_179648 - BLOCK
      ?auto_179644 - BLOCK
      ?auto_179647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179643 ?auto_179642 ) ( ON-TABLE ?auto_179641 ) ( ON ?auto_179642 ?auto_179641 ) ( not ( = ?auto_179641 ?auto_179642 ) ) ( not ( = ?auto_179641 ?auto_179643 ) ) ( not ( = ?auto_179642 ?auto_179643 ) ) ( not ( = ?auto_179641 ?auto_179645 ) ) ( not ( = ?auto_179641 ?auto_179646 ) ) ( not ( = ?auto_179642 ?auto_179645 ) ) ( not ( = ?auto_179642 ?auto_179646 ) ) ( not ( = ?auto_179643 ?auto_179645 ) ) ( not ( = ?auto_179643 ?auto_179646 ) ) ( not ( = ?auto_179645 ?auto_179646 ) ) ( ON ?auto_179645 ?auto_179643 ) ( not ( = ?auto_179648 ?auto_179644 ) ) ( not ( = ?auto_179648 ?auto_179647 ) ) ( not ( = ?auto_179648 ?auto_179646 ) ) ( not ( = ?auto_179644 ?auto_179647 ) ) ( not ( = ?auto_179644 ?auto_179646 ) ) ( not ( = ?auto_179647 ?auto_179646 ) ) ( not ( = ?auto_179641 ?auto_179647 ) ) ( not ( = ?auto_179641 ?auto_179648 ) ) ( not ( = ?auto_179641 ?auto_179644 ) ) ( not ( = ?auto_179642 ?auto_179647 ) ) ( not ( = ?auto_179642 ?auto_179648 ) ) ( not ( = ?auto_179642 ?auto_179644 ) ) ( not ( = ?auto_179643 ?auto_179647 ) ) ( not ( = ?auto_179643 ?auto_179648 ) ) ( not ( = ?auto_179643 ?auto_179644 ) ) ( not ( = ?auto_179645 ?auto_179647 ) ) ( not ( = ?auto_179645 ?auto_179648 ) ) ( not ( = ?auto_179645 ?auto_179644 ) ) ( ON ?auto_179646 ?auto_179645 ) ( ON ?auto_179647 ?auto_179646 ) ( ON ?auto_179644 ?auto_179647 ) ( ON ?auto_179648 ?auto_179644 ) ( CLEAR ?auto_179648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179641 ?auto_179642 ?auto_179643 ?auto_179645 ?auto_179646 ?auto_179647 ?auto_179644 )
      ( MAKE-2PILE ?auto_179641 ?auto_179642 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177632 - BLOCK
      ?auto_177633 - BLOCK
    )
    :vars
    (
      ?auto_177639 - BLOCK
      ?auto_177638 - BLOCK
      ?auto_177635 - BLOCK
      ?auto_177634 - BLOCK
      ?auto_177636 - BLOCK
      ?auto_177637 - BLOCK
      ?auto_177640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177639 ?auto_177633 ) ( ON-TABLE ?auto_177632 ) ( ON ?auto_177633 ?auto_177632 ) ( not ( = ?auto_177632 ?auto_177633 ) ) ( not ( = ?auto_177632 ?auto_177639 ) ) ( not ( = ?auto_177633 ?auto_177639 ) ) ( not ( = ?auto_177632 ?auto_177638 ) ) ( not ( = ?auto_177632 ?auto_177635 ) ) ( not ( = ?auto_177633 ?auto_177638 ) ) ( not ( = ?auto_177633 ?auto_177635 ) ) ( not ( = ?auto_177639 ?auto_177638 ) ) ( not ( = ?auto_177639 ?auto_177635 ) ) ( not ( = ?auto_177638 ?auto_177635 ) ) ( ON ?auto_177638 ?auto_177639 ) ( not ( = ?auto_177634 ?auto_177636 ) ) ( not ( = ?auto_177634 ?auto_177637 ) ) ( not ( = ?auto_177634 ?auto_177640 ) ) ( not ( = ?auto_177634 ?auto_177635 ) ) ( not ( = ?auto_177636 ?auto_177637 ) ) ( not ( = ?auto_177636 ?auto_177640 ) ) ( not ( = ?auto_177636 ?auto_177635 ) ) ( not ( = ?auto_177637 ?auto_177640 ) ) ( not ( = ?auto_177637 ?auto_177635 ) ) ( not ( = ?auto_177640 ?auto_177635 ) ) ( not ( = ?auto_177632 ?auto_177640 ) ) ( not ( = ?auto_177632 ?auto_177634 ) ) ( not ( = ?auto_177632 ?auto_177636 ) ) ( not ( = ?auto_177632 ?auto_177637 ) ) ( not ( = ?auto_177633 ?auto_177640 ) ) ( not ( = ?auto_177633 ?auto_177634 ) ) ( not ( = ?auto_177633 ?auto_177636 ) ) ( not ( = ?auto_177633 ?auto_177637 ) ) ( not ( = ?auto_177639 ?auto_177640 ) ) ( not ( = ?auto_177639 ?auto_177634 ) ) ( not ( = ?auto_177639 ?auto_177636 ) ) ( not ( = ?auto_177639 ?auto_177637 ) ) ( not ( = ?auto_177638 ?auto_177640 ) ) ( not ( = ?auto_177638 ?auto_177634 ) ) ( not ( = ?auto_177638 ?auto_177636 ) ) ( not ( = ?auto_177638 ?auto_177637 ) ) ( ON ?auto_177635 ?auto_177638 ) ( ON ?auto_177640 ?auto_177635 ) ( ON ?auto_177637 ?auto_177640 ) ( ON ?auto_177636 ?auto_177637 ) ( CLEAR ?auto_177636 ) ( HOLDING ?auto_177634 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177634 )
      ( MAKE-2PILE ?auto_177632 ?auto_177633 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177641 - BLOCK
      ?auto_177642 - BLOCK
    )
    :vars
    (
      ?auto_177645 - BLOCK
      ?auto_177647 - BLOCK
      ?auto_177643 - BLOCK
      ?auto_177649 - BLOCK
      ?auto_177646 - BLOCK
      ?auto_177644 - BLOCK
      ?auto_177648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177645 ?auto_177642 ) ( ON-TABLE ?auto_177641 ) ( ON ?auto_177642 ?auto_177641 ) ( not ( = ?auto_177641 ?auto_177642 ) ) ( not ( = ?auto_177641 ?auto_177645 ) ) ( not ( = ?auto_177642 ?auto_177645 ) ) ( not ( = ?auto_177641 ?auto_177647 ) ) ( not ( = ?auto_177641 ?auto_177643 ) ) ( not ( = ?auto_177642 ?auto_177647 ) ) ( not ( = ?auto_177642 ?auto_177643 ) ) ( not ( = ?auto_177645 ?auto_177647 ) ) ( not ( = ?auto_177645 ?auto_177643 ) ) ( not ( = ?auto_177647 ?auto_177643 ) ) ( ON ?auto_177647 ?auto_177645 ) ( not ( = ?auto_177649 ?auto_177646 ) ) ( not ( = ?auto_177649 ?auto_177644 ) ) ( not ( = ?auto_177649 ?auto_177648 ) ) ( not ( = ?auto_177649 ?auto_177643 ) ) ( not ( = ?auto_177646 ?auto_177644 ) ) ( not ( = ?auto_177646 ?auto_177648 ) ) ( not ( = ?auto_177646 ?auto_177643 ) ) ( not ( = ?auto_177644 ?auto_177648 ) ) ( not ( = ?auto_177644 ?auto_177643 ) ) ( not ( = ?auto_177648 ?auto_177643 ) ) ( not ( = ?auto_177641 ?auto_177648 ) ) ( not ( = ?auto_177641 ?auto_177649 ) ) ( not ( = ?auto_177641 ?auto_177646 ) ) ( not ( = ?auto_177641 ?auto_177644 ) ) ( not ( = ?auto_177642 ?auto_177648 ) ) ( not ( = ?auto_177642 ?auto_177649 ) ) ( not ( = ?auto_177642 ?auto_177646 ) ) ( not ( = ?auto_177642 ?auto_177644 ) ) ( not ( = ?auto_177645 ?auto_177648 ) ) ( not ( = ?auto_177645 ?auto_177649 ) ) ( not ( = ?auto_177645 ?auto_177646 ) ) ( not ( = ?auto_177645 ?auto_177644 ) ) ( not ( = ?auto_177647 ?auto_177648 ) ) ( not ( = ?auto_177647 ?auto_177649 ) ) ( not ( = ?auto_177647 ?auto_177646 ) ) ( not ( = ?auto_177647 ?auto_177644 ) ) ( ON ?auto_177643 ?auto_177647 ) ( ON ?auto_177648 ?auto_177643 ) ( ON ?auto_177644 ?auto_177648 ) ( ON ?auto_177646 ?auto_177644 ) ( ON ?auto_177649 ?auto_177646 ) ( CLEAR ?auto_177649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177641 ?auto_177642 ?auto_177645 ?auto_177647 ?auto_177643 ?auto_177648 ?auto_177644 ?auto_177646 )
      ( MAKE-2PILE ?auto_177641 ?auto_177642 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177657 - BLOCK
      ?auto_177658 - BLOCK
      ?auto_177659 - BLOCK
      ?auto_177660 - BLOCK
      ?auto_177661 - BLOCK
      ?auto_177662 - BLOCK
      ?auto_177663 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_177663 ) ( CLEAR ?auto_177662 ) ( ON-TABLE ?auto_177657 ) ( ON ?auto_177658 ?auto_177657 ) ( ON ?auto_177659 ?auto_177658 ) ( ON ?auto_177660 ?auto_177659 ) ( ON ?auto_177661 ?auto_177660 ) ( ON ?auto_177662 ?auto_177661 ) ( not ( = ?auto_177657 ?auto_177658 ) ) ( not ( = ?auto_177657 ?auto_177659 ) ) ( not ( = ?auto_177657 ?auto_177660 ) ) ( not ( = ?auto_177657 ?auto_177661 ) ) ( not ( = ?auto_177657 ?auto_177662 ) ) ( not ( = ?auto_177657 ?auto_177663 ) ) ( not ( = ?auto_177658 ?auto_177659 ) ) ( not ( = ?auto_177658 ?auto_177660 ) ) ( not ( = ?auto_177658 ?auto_177661 ) ) ( not ( = ?auto_177658 ?auto_177662 ) ) ( not ( = ?auto_177658 ?auto_177663 ) ) ( not ( = ?auto_177659 ?auto_177660 ) ) ( not ( = ?auto_177659 ?auto_177661 ) ) ( not ( = ?auto_177659 ?auto_177662 ) ) ( not ( = ?auto_177659 ?auto_177663 ) ) ( not ( = ?auto_177660 ?auto_177661 ) ) ( not ( = ?auto_177660 ?auto_177662 ) ) ( not ( = ?auto_177660 ?auto_177663 ) ) ( not ( = ?auto_177661 ?auto_177662 ) ) ( not ( = ?auto_177661 ?auto_177663 ) ) ( not ( = ?auto_177662 ?auto_177663 ) ) )
    :subtasks
    ( ( !STACK ?auto_177663 ?auto_177662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177664 - BLOCK
      ?auto_177665 - BLOCK
      ?auto_177666 - BLOCK
      ?auto_177667 - BLOCK
      ?auto_177668 - BLOCK
      ?auto_177669 - BLOCK
      ?auto_177670 - BLOCK
    )
    :vars
    (
      ?auto_177671 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177669 ) ( ON-TABLE ?auto_177664 ) ( ON ?auto_177665 ?auto_177664 ) ( ON ?auto_177666 ?auto_177665 ) ( ON ?auto_177667 ?auto_177666 ) ( ON ?auto_177668 ?auto_177667 ) ( ON ?auto_177669 ?auto_177668 ) ( not ( = ?auto_177664 ?auto_177665 ) ) ( not ( = ?auto_177664 ?auto_177666 ) ) ( not ( = ?auto_177664 ?auto_177667 ) ) ( not ( = ?auto_177664 ?auto_177668 ) ) ( not ( = ?auto_177664 ?auto_177669 ) ) ( not ( = ?auto_177664 ?auto_177670 ) ) ( not ( = ?auto_177665 ?auto_177666 ) ) ( not ( = ?auto_177665 ?auto_177667 ) ) ( not ( = ?auto_177665 ?auto_177668 ) ) ( not ( = ?auto_177665 ?auto_177669 ) ) ( not ( = ?auto_177665 ?auto_177670 ) ) ( not ( = ?auto_177666 ?auto_177667 ) ) ( not ( = ?auto_177666 ?auto_177668 ) ) ( not ( = ?auto_177666 ?auto_177669 ) ) ( not ( = ?auto_177666 ?auto_177670 ) ) ( not ( = ?auto_177667 ?auto_177668 ) ) ( not ( = ?auto_177667 ?auto_177669 ) ) ( not ( = ?auto_177667 ?auto_177670 ) ) ( not ( = ?auto_177668 ?auto_177669 ) ) ( not ( = ?auto_177668 ?auto_177670 ) ) ( not ( = ?auto_177669 ?auto_177670 ) ) ( ON ?auto_177670 ?auto_177671 ) ( CLEAR ?auto_177670 ) ( HAND-EMPTY ) ( not ( = ?auto_177664 ?auto_177671 ) ) ( not ( = ?auto_177665 ?auto_177671 ) ) ( not ( = ?auto_177666 ?auto_177671 ) ) ( not ( = ?auto_177667 ?auto_177671 ) ) ( not ( = ?auto_177668 ?auto_177671 ) ) ( not ( = ?auto_177669 ?auto_177671 ) ) ( not ( = ?auto_177670 ?auto_177671 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177670 ?auto_177671 )
      ( MAKE-7PILE ?auto_177664 ?auto_177665 ?auto_177666 ?auto_177667 ?auto_177668 ?auto_177669 ?auto_177670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177672 - BLOCK
      ?auto_177673 - BLOCK
      ?auto_177674 - BLOCK
      ?auto_177675 - BLOCK
      ?auto_177676 - BLOCK
      ?auto_177677 - BLOCK
      ?auto_177678 - BLOCK
    )
    :vars
    (
      ?auto_177679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177672 ) ( ON ?auto_177673 ?auto_177672 ) ( ON ?auto_177674 ?auto_177673 ) ( ON ?auto_177675 ?auto_177674 ) ( ON ?auto_177676 ?auto_177675 ) ( not ( = ?auto_177672 ?auto_177673 ) ) ( not ( = ?auto_177672 ?auto_177674 ) ) ( not ( = ?auto_177672 ?auto_177675 ) ) ( not ( = ?auto_177672 ?auto_177676 ) ) ( not ( = ?auto_177672 ?auto_177677 ) ) ( not ( = ?auto_177672 ?auto_177678 ) ) ( not ( = ?auto_177673 ?auto_177674 ) ) ( not ( = ?auto_177673 ?auto_177675 ) ) ( not ( = ?auto_177673 ?auto_177676 ) ) ( not ( = ?auto_177673 ?auto_177677 ) ) ( not ( = ?auto_177673 ?auto_177678 ) ) ( not ( = ?auto_177674 ?auto_177675 ) ) ( not ( = ?auto_177674 ?auto_177676 ) ) ( not ( = ?auto_177674 ?auto_177677 ) ) ( not ( = ?auto_177674 ?auto_177678 ) ) ( not ( = ?auto_177675 ?auto_177676 ) ) ( not ( = ?auto_177675 ?auto_177677 ) ) ( not ( = ?auto_177675 ?auto_177678 ) ) ( not ( = ?auto_177676 ?auto_177677 ) ) ( not ( = ?auto_177676 ?auto_177678 ) ) ( not ( = ?auto_177677 ?auto_177678 ) ) ( ON ?auto_177678 ?auto_177679 ) ( CLEAR ?auto_177678 ) ( not ( = ?auto_177672 ?auto_177679 ) ) ( not ( = ?auto_177673 ?auto_177679 ) ) ( not ( = ?auto_177674 ?auto_177679 ) ) ( not ( = ?auto_177675 ?auto_177679 ) ) ( not ( = ?auto_177676 ?auto_177679 ) ) ( not ( = ?auto_177677 ?auto_177679 ) ) ( not ( = ?auto_177678 ?auto_177679 ) ) ( HOLDING ?auto_177677 ) ( CLEAR ?auto_177676 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177672 ?auto_177673 ?auto_177674 ?auto_177675 ?auto_177676 ?auto_177677 )
      ( MAKE-7PILE ?auto_177672 ?auto_177673 ?auto_177674 ?auto_177675 ?auto_177676 ?auto_177677 ?auto_177678 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177680 - BLOCK
      ?auto_177681 - BLOCK
      ?auto_177682 - BLOCK
      ?auto_177683 - BLOCK
      ?auto_177684 - BLOCK
      ?auto_177685 - BLOCK
      ?auto_177686 - BLOCK
    )
    :vars
    (
      ?auto_177687 - BLOCK
      ?auto_177688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177680 ) ( ON ?auto_177681 ?auto_177680 ) ( ON ?auto_177682 ?auto_177681 ) ( ON ?auto_177683 ?auto_177682 ) ( ON ?auto_177684 ?auto_177683 ) ( not ( = ?auto_177680 ?auto_177681 ) ) ( not ( = ?auto_177680 ?auto_177682 ) ) ( not ( = ?auto_177680 ?auto_177683 ) ) ( not ( = ?auto_177680 ?auto_177684 ) ) ( not ( = ?auto_177680 ?auto_177685 ) ) ( not ( = ?auto_177680 ?auto_177686 ) ) ( not ( = ?auto_177681 ?auto_177682 ) ) ( not ( = ?auto_177681 ?auto_177683 ) ) ( not ( = ?auto_177681 ?auto_177684 ) ) ( not ( = ?auto_177681 ?auto_177685 ) ) ( not ( = ?auto_177681 ?auto_177686 ) ) ( not ( = ?auto_177682 ?auto_177683 ) ) ( not ( = ?auto_177682 ?auto_177684 ) ) ( not ( = ?auto_177682 ?auto_177685 ) ) ( not ( = ?auto_177682 ?auto_177686 ) ) ( not ( = ?auto_177683 ?auto_177684 ) ) ( not ( = ?auto_177683 ?auto_177685 ) ) ( not ( = ?auto_177683 ?auto_177686 ) ) ( not ( = ?auto_177684 ?auto_177685 ) ) ( not ( = ?auto_177684 ?auto_177686 ) ) ( not ( = ?auto_177685 ?auto_177686 ) ) ( ON ?auto_177686 ?auto_177687 ) ( not ( = ?auto_177680 ?auto_177687 ) ) ( not ( = ?auto_177681 ?auto_177687 ) ) ( not ( = ?auto_177682 ?auto_177687 ) ) ( not ( = ?auto_177683 ?auto_177687 ) ) ( not ( = ?auto_177684 ?auto_177687 ) ) ( not ( = ?auto_177685 ?auto_177687 ) ) ( not ( = ?auto_177686 ?auto_177687 ) ) ( CLEAR ?auto_177684 ) ( ON ?auto_177685 ?auto_177686 ) ( CLEAR ?auto_177685 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177688 ) ( ON ?auto_177687 ?auto_177688 ) ( not ( = ?auto_177688 ?auto_177687 ) ) ( not ( = ?auto_177688 ?auto_177686 ) ) ( not ( = ?auto_177688 ?auto_177685 ) ) ( not ( = ?auto_177680 ?auto_177688 ) ) ( not ( = ?auto_177681 ?auto_177688 ) ) ( not ( = ?auto_177682 ?auto_177688 ) ) ( not ( = ?auto_177683 ?auto_177688 ) ) ( not ( = ?auto_177684 ?auto_177688 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177688 ?auto_177687 ?auto_177686 )
      ( MAKE-7PILE ?auto_177680 ?auto_177681 ?auto_177682 ?auto_177683 ?auto_177684 ?auto_177685 ?auto_177686 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177689 - BLOCK
      ?auto_177690 - BLOCK
      ?auto_177691 - BLOCK
      ?auto_177692 - BLOCK
      ?auto_177693 - BLOCK
      ?auto_177694 - BLOCK
      ?auto_177695 - BLOCK
    )
    :vars
    (
      ?auto_177696 - BLOCK
      ?auto_177697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177689 ) ( ON ?auto_177690 ?auto_177689 ) ( ON ?auto_177691 ?auto_177690 ) ( ON ?auto_177692 ?auto_177691 ) ( not ( = ?auto_177689 ?auto_177690 ) ) ( not ( = ?auto_177689 ?auto_177691 ) ) ( not ( = ?auto_177689 ?auto_177692 ) ) ( not ( = ?auto_177689 ?auto_177693 ) ) ( not ( = ?auto_177689 ?auto_177694 ) ) ( not ( = ?auto_177689 ?auto_177695 ) ) ( not ( = ?auto_177690 ?auto_177691 ) ) ( not ( = ?auto_177690 ?auto_177692 ) ) ( not ( = ?auto_177690 ?auto_177693 ) ) ( not ( = ?auto_177690 ?auto_177694 ) ) ( not ( = ?auto_177690 ?auto_177695 ) ) ( not ( = ?auto_177691 ?auto_177692 ) ) ( not ( = ?auto_177691 ?auto_177693 ) ) ( not ( = ?auto_177691 ?auto_177694 ) ) ( not ( = ?auto_177691 ?auto_177695 ) ) ( not ( = ?auto_177692 ?auto_177693 ) ) ( not ( = ?auto_177692 ?auto_177694 ) ) ( not ( = ?auto_177692 ?auto_177695 ) ) ( not ( = ?auto_177693 ?auto_177694 ) ) ( not ( = ?auto_177693 ?auto_177695 ) ) ( not ( = ?auto_177694 ?auto_177695 ) ) ( ON ?auto_177695 ?auto_177696 ) ( not ( = ?auto_177689 ?auto_177696 ) ) ( not ( = ?auto_177690 ?auto_177696 ) ) ( not ( = ?auto_177691 ?auto_177696 ) ) ( not ( = ?auto_177692 ?auto_177696 ) ) ( not ( = ?auto_177693 ?auto_177696 ) ) ( not ( = ?auto_177694 ?auto_177696 ) ) ( not ( = ?auto_177695 ?auto_177696 ) ) ( ON ?auto_177694 ?auto_177695 ) ( CLEAR ?auto_177694 ) ( ON-TABLE ?auto_177697 ) ( ON ?auto_177696 ?auto_177697 ) ( not ( = ?auto_177697 ?auto_177696 ) ) ( not ( = ?auto_177697 ?auto_177695 ) ) ( not ( = ?auto_177697 ?auto_177694 ) ) ( not ( = ?auto_177689 ?auto_177697 ) ) ( not ( = ?auto_177690 ?auto_177697 ) ) ( not ( = ?auto_177691 ?auto_177697 ) ) ( not ( = ?auto_177692 ?auto_177697 ) ) ( not ( = ?auto_177693 ?auto_177697 ) ) ( HOLDING ?auto_177693 ) ( CLEAR ?auto_177692 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177689 ?auto_177690 ?auto_177691 ?auto_177692 ?auto_177693 )
      ( MAKE-7PILE ?auto_177689 ?auto_177690 ?auto_177691 ?auto_177692 ?auto_177693 ?auto_177694 ?auto_177695 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177698 - BLOCK
      ?auto_177699 - BLOCK
      ?auto_177700 - BLOCK
      ?auto_177701 - BLOCK
      ?auto_177702 - BLOCK
      ?auto_177703 - BLOCK
      ?auto_177704 - BLOCK
    )
    :vars
    (
      ?auto_177705 - BLOCK
      ?auto_177706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177698 ) ( ON ?auto_177699 ?auto_177698 ) ( ON ?auto_177700 ?auto_177699 ) ( ON ?auto_177701 ?auto_177700 ) ( not ( = ?auto_177698 ?auto_177699 ) ) ( not ( = ?auto_177698 ?auto_177700 ) ) ( not ( = ?auto_177698 ?auto_177701 ) ) ( not ( = ?auto_177698 ?auto_177702 ) ) ( not ( = ?auto_177698 ?auto_177703 ) ) ( not ( = ?auto_177698 ?auto_177704 ) ) ( not ( = ?auto_177699 ?auto_177700 ) ) ( not ( = ?auto_177699 ?auto_177701 ) ) ( not ( = ?auto_177699 ?auto_177702 ) ) ( not ( = ?auto_177699 ?auto_177703 ) ) ( not ( = ?auto_177699 ?auto_177704 ) ) ( not ( = ?auto_177700 ?auto_177701 ) ) ( not ( = ?auto_177700 ?auto_177702 ) ) ( not ( = ?auto_177700 ?auto_177703 ) ) ( not ( = ?auto_177700 ?auto_177704 ) ) ( not ( = ?auto_177701 ?auto_177702 ) ) ( not ( = ?auto_177701 ?auto_177703 ) ) ( not ( = ?auto_177701 ?auto_177704 ) ) ( not ( = ?auto_177702 ?auto_177703 ) ) ( not ( = ?auto_177702 ?auto_177704 ) ) ( not ( = ?auto_177703 ?auto_177704 ) ) ( ON ?auto_177704 ?auto_177705 ) ( not ( = ?auto_177698 ?auto_177705 ) ) ( not ( = ?auto_177699 ?auto_177705 ) ) ( not ( = ?auto_177700 ?auto_177705 ) ) ( not ( = ?auto_177701 ?auto_177705 ) ) ( not ( = ?auto_177702 ?auto_177705 ) ) ( not ( = ?auto_177703 ?auto_177705 ) ) ( not ( = ?auto_177704 ?auto_177705 ) ) ( ON ?auto_177703 ?auto_177704 ) ( ON-TABLE ?auto_177706 ) ( ON ?auto_177705 ?auto_177706 ) ( not ( = ?auto_177706 ?auto_177705 ) ) ( not ( = ?auto_177706 ?auto_177704 ) ) ( not ( = ?auto_177706 ?auto_177703 ) ) ( not ( = ?auto_177698 ?auto_177706 ) ) ( not ( = ?auto_177699 ?auto_177706 ) ) ( not ( = ?auto_177700 ?auto_177706 ) ) ( not ( = ?auto_177701 ?auto_177706 ) ) ( not ( = ?auto_177702 ?auto_177706 ) ) ( CLEAR ?auto_177701 ) ( ON ?auto_177702 ?auto_177703 ) ( CLEAR ?auto_177702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177706 ?auto_177705 ?auto_177704 ?auto_177703 )
      ( MAKE-7PILE ?auto_177698 ?auto_177699 ?auto_177700 ?auto_177701 ?auto_177702 ?auto_177703 ?auto_177704 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177707 - BLOCK
      ?auto_177708 - BLOCK
      ?auto_177709 - BLOCK
      ?auto_177710 - BLOCK
      ?auto_177711 - BLOCK
      ?auto_177712 - BLOCK
      ?auto_177713 - BLOCK
    )
    :vars
    (
      ?auto_177714 - BLOCK
      ?auto_177715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177707 ) ( ON ?auto_177708 ?auto_177707 ) ( ON ?auto_177709 ?auto_177708 ) ( not ( = ?auto_177707 ?auto_177708 ) ) ( not ( = ?auto_177707 ?auto_177709 ) ) ( not ( = ?auto_177707 ?auto_177710 ) ) ( not ( = ?auto_177707 ?auto_177711 ) ) ( not ( = ?auto_177707 ?auto_177712 ) ) ( not ( = ?auto_177707 ?auto_177713 ) ) ( not ( = ?auto_177708 ?auto_177709 ) ) ( not ( = ?auto_177708 ?auto_177710 ) ) ( not ( = ?auto_177708 ?auto_177711 ) ) ( not ( = ?auto_177708 ?auto_177712 ) ) ( not ( = ?auto_177708 ?auto_177713 ) ) ( not ( = ?auto_177709 ?auto_177710 ) ) ( not ( = ?auto_177709 ?auto_177711 ) ) ( not ( = ?auto_177709 ?auto_177712 ) ) ( not ( = ?auto_177709 ?auto_177713 ) ) ( not ( = ?auto_177710 ?auto_177711 ) ) ( not ( = ?auto_177710 ?auto_177712 ) ) ( not ( = ?auto_177710 ?auto_177713 ) ) ( not ( = ?auto_177711 ?auto_177712 ) ) ( not ( = ?auto_177711 ?auto_177713 ) ) ( not ( = ?auto_177712 ?auto_177713 ) ) ( ON ?auto_177713 ?auto_177714 ) ( not ( = ?auto_177707 ?auto_177714 ) ) ( not ( = ?auto_177708 ?auto_177714 ) ) ( not ( = ?auto_177709 ?auto_177714 ) ) ( not ( = ?auto_177710 ?auto_177714 ) ) ( not ( = ?auto_177711 ?auto_177714 ) ) ( not ( = ?auto_177712 ?auto_177714 ) ) ( not ( = ?auto_177713 ?auto_177714 ) ) ( ON ?auto_177712 ?auto_177713 ) ( ON-TABLE ?auto_177715 ) ( ON ?auto_177714 ?auto_177715 ) ( not ( = ?auto_177715 ?auto_177714 ) ) ( not ( = ?auto_177715 ?auto_177713 ) ) ( not ( = ?auto_177715 ?auto_177712 ) ) ( not ( = ?auto_177707 ?auto_177715 ) ) ( not ( = ?auto_177708 ?auto_177715 ) ) ( not ( = ?auto_177709 ?auto_177715 ) ) ( not ( = ?auto_177710 ?auto_177715 ) ) ( not ( = ?auto_177711 ?auto_177715 ) ) ( ON ?auto_177711 ?auto_177712 ) ( CLEAR ?auto_177711 ) ( HOLDING ?auto_177710 ) ( CLEAR ?auto_177709 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177707 ?auto_177708 ?auto_177709 ?auto_177710 )
      ( MAKE-7PILE ?auto_177707 ?auto_177708 ?auto_177709 ?auto_177710 ?auto_177711 ?auto_177712 ?auto_177713 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177716 - BLOCK
      ?auto_177717 - BLOCK
      ?auto_177718 - BLOCK
      ?auto_177719 - BLOCK
      ?auto_177720 - BLOCK
      ?auto_177721 - BLOCK
      ?auto_177722 - BLOCK
    )
    :vars
    (
      ?auto_177723 - BLOCK
      ?auto_177724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177716 ) ( ON ?auto_177717 ?auto_177716 ) ( ON ?auto_177718 ?auto_177717 ) ( not ( = ?auto_177716 ?auto_177717 ) ) ( not ( = ?auto_177716 ?auto_177718 ) ) ( not ( = ?auto_177716 ?auto_177719 ) ) ( not ( = ?auto_177716 ?auto_177720 ) ) ( not ( = ?auto_177716 ?auto_177721 ) ) ( not ( = ?auto_177716 ?auto_177722 ) ) ( not ( = ?auto_177717 ?auto_177718 ) ) ( not ( = ?auto_177717 ?auto_177719 ) ) ( not ( = ?auto_177717 ?auto_177720 ) ) ( not ( = ?auto_177717 ?auto_177721 ) ) ( not ( = ?auto_177717 ?auto_177722 ) ) ( not ( = ?auto_177718 ?auto_177719 ) ) ( not ( = ?auto_177718 ?auto_177720 ) ) ( not ( = ?auto_177718 ?auto_177721 ) ) ( not ( = ?auto_177718 ?auto_177722 ) ) ( not ( = ?auto_177719 ?auto_177720 ) ) ( not ( = ?auto_177719 ?auto_177721 ) ) ( not ( = ?auto_177719 ?auto_177722 ) ) ( not ( = ?auto_177720 ?auto_177721 ) ) ( not ( = ?auto_177720 ?auto_177722 ) ) ( not ( = ?auto_177721 ?auto_177722 ) ) ( ON ?auto_177722 ?auto_177723 ) ( not ( = ?auto_177716 ?auto_177723 ) ) ( not ( = ?auto_177717 ?auto_177723 ) ) ( not ( = ?auto_177718 ?auto_177723 ) ) ( not ( = ?auto_177719 ?auto_177723 ) ) ( not ( = ?auto_177720 ?auto_177723 ) ) ( not ( = ?auto_177721 ?auto_177723 ) ) ( not ( = ?auto_177722 ?auto_177723 ) ) ( ON ?auto_177721 ?auto_177722 ) ( ON-TABLE ?auto_177724 ) ( ON ?auto_177723 ?auto_177724 ) ( not ( = ?auto_177724 ?auto_177723 ) ) ( not ( = ?auto_177724 ?auto_177722 ) ) ( not ( = ?auto_177724 ?auto_177721 ) ) ( not ( = ?auto_177716 ?auto_177724 ) ) ( not ( = ?auto_177717 ?auto_177724 ) ) ( not ( = ?auto_177718 ?auto_177724 ) ) ( not ( = ?auto_177719 ?auto_177724 ) ) ( not ( = ?auto_177720 ?auto_177724 ) ) ( ON ?auto_177720 ?auto_177721 ) ( CLEAR ?auto_177718 ) ( ON ?auto_177719 ?auto_177720 ) ( CLEAR ?auto_177719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177724 ?auto_177723 ?auto_177722 ?auto_177721 ?auto_177720 )
      ( MAKE-7PILE ?auto_177716 ?auto_177717 ?auto_177718 ?auto_177719 ?auto_177720 ?auto_177721 ?auto_177722 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177725 - BLOCK
      ?auto_177726 - BLOCK
      ?auto_177727 - BLOCK
      ?auto_177728 - BLOCK
      ?auto_177729 - BLOCK
      ?auto_177730 - BLOCK
      ?auto_177731 - BLOCK
    )
    :vars
    (
      ?auto_177732 - BLOCK
      ?auto_177733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177725 ) ( ON ?auto_177726 ?auto_177725 ) ( not ( = ?auto_177725 ?auto_177726 ) ) ( not ( = ?auto_177725 ?auto_177727 ) ) ( not ( = ?auto_177725 ?auto_177728 ) ) ( not ( = ?auto_177725 ?auto_177729 ) ) ( not ( = ?auto_177725 ?auto_177730 ) ) ( not ( = ?auto_177725 ?auto_177731 ) ) ( not ( = ?auto_177726 ?auto_177727 ) ) ( not ( = ?auto_177726 ?auto_177728 ) ) ( not ( = ?auto_177726 ?auto_177729 ) ) ( not ( = ?auto_177726 ?auto_177730 ) ) ( not ( = ?auto_177726 ?auto_177731 ) ) ( not ( = ?auto_177727 ?auto_177728 ) ) ( not ( = ?auto_177727 ?auto_177729 ) ) ( not ( = ?auto_177727 ?auto_177730 ) ) ( not ( = ?auto_177727 ?auto_177731 ) ) ( not ( = ?auto_177728 ?auto_177729 ) ) ( not ( = ?auto_177728 ?auto_177730 ) ) ( not ( = ?auto_177728 ?auto_177731 ) ) ( not ( = ?auto_177729 ?auto_177730 ) ) ( not ( = ?auto_177729 ?auto_177731 ) ) ( not ( = ?auto_177730 ?auto_177731 ) ) ( ON ?auto_177731 ?auto_177732 ) ( not ( = ?auto_177725 ?auto_177732 ) ) ( not ( = ?auto_177726 ?auto_177732 ) ) ( not ( = ?auto_177727 ?auto_177732 ) ) ( not ( = ?auto_177728 ?auto_177732 ) ) ( not ( = ?auto_177729 ?auto_177732 ) ) ( not ( = ?auto_177730 ?auto_177732 ) ) ( not ( = ?auto_177731 ?auto_177732 ) ) ( ON ?auto_177730 ?auto_177731 ) ( ON-TABLE ?auto_177733 ) ( ON ?auto_177732 ?auto_177733 ) ( not ( = ?auto_177733 ?auto_177732 ) ) ( not ( = ?auto_177733 ?auto_177731 ) ) ( not ( = ?auto_177733 ?auto_177730 ) ) ( not ( = ?auto_177725 ?auto_177733 ) ) ( not ( = ?auto_177726 ?auto_177733 ) ) ( not ( = ?auto_177727 ?auto_177733 ) ) ( not ( = ?auto_177728 ?auto_177733 ) ) ( not ( = ?auto_177729 ?auto_177733 ) ) ( ON ?auto_177729 ?auto_177730 ) ( ON ?auto_177728 ?auto_177729 ) ( CLEAR ?auto_177728 ) ( HOLDING ?auto_177727 ) ( CLEAR ?auto_177726 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177725 ?auto_177726 ?auto_177727 )
      ( MAKE-7PILE ?auto_177725 ?auto_177726 ?auto_177727 ?auto_177728 ?auto_177729 ?auto_177730 ?auto_177731 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177734 - BLOCK
      ?auto_177735 - BLOCK
      ?auto_177736 - BLOCK
      ?auto_177737 - BLOCK
      ?auto_177738 - BLOCK
      ?auto_177739 - BLOCK
      ?auto_177740 - BLOCK
    )
    :vars
    (
      ?auto_177741 - BLOCK
      ?auto_177742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177734 ) ( ON ?auto_177735 ?auto_177734 ) ( not ( = ?auto_177734 ?auto_177735 ) ) ( not ( = ?auto_177734 ?auto_177736 ) ) ( not ( = ?auto_177734 ?auto_177737 ) ) ( not ( = ?auto_177734 ?auto_177738 ) ) ( not ( = ?auto_177734 ?auto_177739 ) ) ( not ( = ?auto_177734 ?auto_177740 ) ) ( not ( = ?auto_177735 ?auto_177736 ) ) ( not ( = ?auto_177735 ?auto_177737 ) ) ( not ( = ?auto_177735 ?auto_177738 ) ) ( not ( = ?auto_177735 ?auto_177739 ) ) ( not ( = ?auto_177735 ?auto_177740 ) ) ( not ( = ?auto_177736 ?auto_177737 ) ) ( not ( = ?auto_177736 ?auto_177738 ) ) ( not ( = ?auto_177736 ?auto_177739 ) ) ( not ( = ?auto_177736 ?auto_177740 ) ) ( not ( = ?auto_177737 ?auto_177738 ) ) ( not ( = ?auto_177737 ?auto_177739 ) ) ( not ( = ?auto_177737 ?auto_177740 ) ) ( not ( = ?auto_177738 ?auto_177739 ) ) ( not ( = ?auto_177738 ?auto_177740 ) ) ( not ( = ?auto_177739 ?auto_177740 ) ) ( ON ?auto_177740 ?auto_177741 ) ( not ( = ?auto_177734 ?auto_177741 ) ) ( not ( = ?auto_177735 ?auto_177741 ) ) ( not ( = ?auto_177736 ?auto_177741 ) ) ( not ( = ?auto_177737 ?auto_177741 ) ) ( not ( = ?auto_177738 ?auto_177741 ) ) ( not ( = ?auto_177739 ?auto_177741 ) ) ( not ( = ?auto_177740 ?auto_177741 ) ) ( ON ?auto_177739 ?auto_177740 ) ( ON-TABLE ?auto_177742 ) ( ON ?auto_177741 ?auto_177742 ) ( not ( = ?auto_177742 ?auto_177741 ) ) ( not ( = ?auto_177742 ?auto_177740 ) ) ( not ( = ?auto_177742 ?auto_177739 ) ) ( not ( = ?auto_177734 ?auto_177742 ) ) ( not ( = ?auto_177735 ?auto_177742 ) ) ( not ( = ?auto_177736 ?auto_177742 ) ) ( not ( = ?auto_177737 ?auto_177742 ) ) ( not ( = ?auto_177738 ?auto_177742 ) ) ( ON ?auto_177738 ?auto_177739 ) ( ON ?auto_177737 ?auto_177738 ) ( CLEAR ?auto_177735 ) ( ON ?auto_177736 ?auto_177737 ) ( CLEAR ?auto_177736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177742 ?auto_177741 ?auto_177740 ?auto_177739 ?auto_177738 ?auto_177737 )
      ( MAKE-7PILE ?auto_177734 ?auto_177735 ?auto_177736 ?auto_177737 ?auto_177738 ?auto_177739 ?auto_177740 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177743 - BLOCK
      ?auto_177744 - BLOCK
      ?auto_177745 - BLOCK
      ?auto_177746 - BLOCK
      ?auto_177747 - BLOCK
      ?auto_177748 - BLOCK
      ?auto_177749 - BLOCK
    )
    :vars
    (
      ?auto_177751 - BLOCK
      ?auto_177750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177743 ) ( not ( = ?auto_177743 ?auto_177744 ) ) ( not ( = ?auto_177743 ?auto_177745 ) ) ( not ( = ?auto_177743 ?auto_177746 ) ) ( not ( = ?auto_177743 ?auto_177747 ) ) ( not ( = ?auto_177743 ?auto_177748 ) ) ( not ( = ?auto_177743 ?auto_177749 ) ) ( not ( = ?auto_177744 ?auto_177745 ) ) ( not ( = ?auto_177744 ?auto_177746 ) ) ( not ( = ?auto_177744 ?auto_177747 ) ) ( not ( = ?auto_177744 ?auto_177748 ) ) ( not ( = ?auto_177744 ?auto_177749 ) ) ( not ( = ?auto_177745 ?auto_177746 ) ) ( not ( = ?auto_177745 ?auto_177747 ) ) ( not ( = ?auto_177745 ?auto_177748 ) ) ( not ( = ?auto_177745 ?auto_177749 ) ) ( not ( = ?auto_177746 ?auto_177747 ) ) ( not ( = ?auto_177746 ?auto_177748 ) ) ( not ( = ?auto_177746 ?auto_177749 ) ) ( not ( = ?auto_177747 ?auto_177748 ) ) ( not ( = ?auto_177747 ?auto_177749 ) ) ( not ( = ?auto_177748 ?auto_177749 ) ) ( ON ?auto_177749 ?auto_177751 ) ( not ( = ?auto_177743 ?auto_177751 ) ) ( not ( = ?auto_177744 ?auto_177751 ) ) ( not ( = ?auto_177745 ?auto_177751 ) ) ( not ( = ?auto_177746 ?auto_177751 ) ) ( not ( = ?auto_177747 ?auto_177751 ) ) ( not ( = ?auto_177748 ?auto_177751 ) ) ( not ( = ?auto_177749 ?auto_177751 ) ) ( ON ?auto_177748 ?auto_177749 ) ( ON-TABLE ?auto_177750 ) ( ON ?auto_177751 ?auto_177750 ) ( not ( = ?auto_177750 ?auto_177751 ) ) ( not ( = ?auto_177750 ?auto_177749 ) ) ( not ( = ?auto_177750 ?auto_177748 ) ) ( not ( = ?auto_177743 ?auto_177750 ) ) ( not ( = ?auto_177744 ?auto_177750 ) ) ( not ( = ?auto_177745 ?auto_177750 ) ) ( not ( = ?auto_177746 ?auto_177750 ) ) ( not ( = ?auto_177747 ?auto_177750 ) ) ( ON ?auto_177747 ?auto_177748 ) ( ON ?auto_177746 ?auto_177747 ) ( ON ?auto_177745 ?auto_177746 ) ( CLEAR ?auto_177745 ) ( HOLDING ?auto_177744 ) ( CLEAR ?auto_177743 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177743 ?auto_177744 )
      ( MAKE-7PILE ?auto_177743 ?auto_177744 ?auto_177745 ?auto_177746 ?auto_177747 ?auto_177748 ?auto_177749 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177752 - BLOCK
      ?auto_177753 - BLOCK
      ?auto_177754 - BLOCK
      ?auto_177755 - BLOCK
      ?auto_177756 - BLOCK
      ?auto_177757 - BLOCK
      ?auto_177758 - BLOCK
    )
    :vars
    (
      ?auto_177760 - BLOCK
      ?auto_177759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177752 ) ( not ( = ?auto_177752 ?auto_177753 ) ) ( not ( = ?auto_177752 ?auto_177754 ) ) ( not ( = ?auto_177752 ?auto_177755 ) ) ( not ( = ?auto_177752 ?auto_177756 ) ) ( not ( = ?auto_177752 ?auto_177757 ) ) ( not ( = ?auto_177752 ?auto_177758 ) ) ( not ( = ?auto_177753 ?auto_177754 ) ) ( not ( = ?auto_177753 ?auto_177755 ) ) ( not ( = ?auto_177753 ?auto_177756 ) ) ( not ( = ?auto_177753 ?auto_177757 ) ) ( not ( = ?auto_177753 ?auto_177758 ) ) ( not ( = ?auto_177754 ?auto_177755 ) ) ( not ( = ?auto_177754 ?auto_177756 ) ) ( not ( = ?auto_177754 ?auto_177757 ) ) ( not ( = ?auto_177754 ?auto_177758 ) ) ( not ( = ?auto_177755 ?auto_177756 ) ) ( not ( = ?auto_177755 ?auto_177757 ) ) ( not ( = ?auto_177755 ?auto_177758 ) ) ( not ( = ?auto_177756 ?auto_177757 ) ) ( not ( = ?auto_177756 ?auto_177758 ) ) ( not ( = ?auto_177757 ?auto_177758 ) ) ( ON ?auto_177758 ?auto_177760 ) ( not ( = ?auto_177752 ?auto_177760 ) ) ( not ( = ?auto_177753 ?auto_177760 ) ) ( not ( = ?auto_177754 ?auto_177760 ) ) ( not ( = ?auto_177755 ?auto_177760 ) ) ( not ( = ?auto_177756 ?auto_177760 ) ) ( not ( = ?auto_177757 ?auto_177760 ) ) ( not ( = ?auto_177758 ?auto_177760 ) ) ( ON ?auto_177757 ?auto_177758 ) ( ON-TABLE ?auto_177759 ) ( ON ?auto_177760 ?auto_177759 ) ( not ( = ?auto_177759 ?auto_177760 ) ) ( not ( = ?auto_177759 ?auto_177758 ) ) ( not ( = ?auto_177759 ?auto_177757 ) ) ( not ( = ?auto_177752 ?auto_177759 ) ) ( not ( = ?auto_177753 ?auto_177759 ) ) ( not ( = ?auto_177754 ?auto_177759 ) ) ( not ( = ?auto_177755 ?auto_177759 ) ) ( not ( = ?auto_177756 ?auto_177759 ) ) ( ON ?auto_177756 ?auto_177757 ) ( ON ?auto_177755 ?auto_177756 ) ( ON ?auto_177754 ?auto_177755 ) ( CLEAR ?auto_177752 ) ( ON ?auto_177753 ?auto_177754 ) ( CLEAR ?auto_177753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177759 ?auto_177760 ?auto_177758 ?auto_177757 ?auto_177756 ?auto_177755 ?auto_177754 )
      ( MAKE-7PILE ?auto_177752 ?auto_177753 ?auto_177754 ?auto_177755 ?auto_177756 ?auto_177757 ?auto_177758 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177761 - BLOCK
      ?auto_177762 - BLOCK
      ?auto_177763 - BLOCK
      ?auto_177764 - BLOCK
      ?auto_177765 - BLOCK
      ?auto_177766 - BLOCK
      ?auto_177767 - BLOCK
    )
    :vars
    (
      ?auto_177768 - BLOCK
      ?auto_177769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177761 ?auto_177762 ) ) ( not ( = ?auto_177761 ?auto_177763 ) ) ( not ( = ?auto_177761 ?auto_177764 ) ) ( not ( = ?auto_177761 ?auto_177765 ) ) ( not ( = ?auto_177761 ?auto_177766 ) ) ( not ( = ?auto_177761 ?auto_177767 ) ) ( not ( = ?auto_177762 ?auto_177763 ) ) ( not ( = ?auto_177762 ?auto_177764 ) ) ( not ( = ?auto_177762 ?auto_177765 ) ) ( not ( = ?auto_177762 ?auto_177766 ) ) ( not ( = ?auto_177762 ?auto_177767 ) ) ( not ( = ?auto_177763 ?auto_177764 ) ) ( not ( = ?auto_177763 ?auto_177765 ) ) ( not ( = ?auto_177763 ?auto_177766 ) ) ( not ( = ?auto_177763 ?auto_177767 ) ) ( not ( = ?auto_177764 ?auto_177765 ) ) ( not ( = ?auto_177764 ?auto_177766 ) ) ( not ( = ?auto_177764 ?auto_177767 ) ) ( not ( = ?auto_177765 ?auto_177766 ) ) ( not ( = ?auto_177765 ?auto_177767 ) ) ( not ( = ?auto_177766 ?auto_177767 ) ) ( ON ?auto_177767 ?auto_177768 ) ( not ( = ?auto_177761 ?auto_177768 ) ) ( not ( = ?auto_177762 ?auto_177768 ) ) ( not ( = ?auto_177763 ?auto_177768 ) ) ( not ( = ?auto_177764 ?auto_177768 ) ) ( not ( = ?auto_177765 ?auto_177768 ) ) ( not ( = ?auto_177766 ?auto_177768 ) ) ( not ( = ?auto_177767 ?auto_177768 ) ) ( ON ?auto_177766 ?auto_177767 ) ( ON-TABLE ?auto_177769 ) ( ON ?auto_177768 ?auto_177769 ) ( not ( = ?auto_177769 ?auto_177768 ) ) ( not ( = ?auto_177769 ?auto_177767 ) ) ( not ( = ?auto_177769 ?auto_177766 ) ) ( not ( = ?auto_177761 ?auto_177769 ) ) ( not ( = ?auto_177762 ?auto_177769 ) ) ( not ( = ?auto_177763 ?auto_177769 ) ) ( not ( = ?auto_177764 ?auto_177769 ) ) ( not ( = ?auto_177765 ?auto_177769 ) ) ( ON ?auto_177765 ?auto_177766 ) ( ON ?auto_177764 ?auto_177765 ) ( ON ?auto_177763 ?auto_177764 ) ( ON ?auto_177762 ?auto_177763 ) ( CLEAR ?auto_177762 ) ( HOLDING ?auto_177761 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177761 )
      ( MAKE-7PILE ?auto_177761 ?auto_177762 ?auto_177763 ?auto_177764 ?auto_177765 ?auto_177766 ?auto_177767 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_177770 - BLOCK
      ?auto_177771 - BLOCK
      ?auto_177772 - BLOCK
      ?auto_177773 - BLOCK
      ?auto_177774 - BLOCK
      ?auto_177775 - BLOCK
      ?auto_177776 - BLOCK
    )
    :vars
    (
      ?auto_177778 - BLOCK
      ?auto_177777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177770 ?auto_177771 ) ) ( not ( = ?auto_177770 ?auto_177772 ) ) ( not ( = ?auto_177770 ?auto_177773 ) ) ( not ( = ?auto_177770 ?auto_177774 ) ) ( not ( = ?auto_177770 ?auto_177775 ) ) ( not ( = ?auto_177770 ?auto_177776 ) ) ( not ( = ?auto_177771 ?auto_177772 ) ) ( not ( = ?auto_177771 ?auto_177773 ) ) ( not ( = ?auto_177771 ?auto_177774 ) ) ( not ( = ?auto_177771 ?auto_177775 ) ) ( not ( = ?auto_177771 ?auto_177776 ) ) ( not ( = ?auto_177772 ?auto_177773 ) ) ( not ( = ?auto_177772 ?auto_177774 ) ) ( not ( = ?auto_177772 ?auto_177775 ) ) ( not ( = ?auto_177772 ?auto_177776 ) ) ( not ( = ?auto_177773 ?auto_177774 ) ) ( not ( = ?auto_177773 ?auto_177775 ) ) ( not ( = ?auto_177773 ?auto_177776 ) ) ( not ( = ?auto_177774 ?auto_177775 ) ) ( not ( = ?auto_177774 ?auto_177776 ) ) ( not ( = ?auto_177775 ?auto_177776 ) ) ( ON ?auto_177776 ?auto_177778 ) ( not ( = ?auto_177770 ?auto_177778 ) ) ( not ( = ?auto_177771 ?auto_177778 ) ) ( not ( = ?auto_177772 ?auto_177778 ) ) ( not ( = ?auto_177773 ?auto_177778 ) ) ( not ( = ?auto_177774 ?auto_177778 ) ) ( not ( = ?auto_177775 ?auto_177778 ) ) ( not ( = ?auto_177776 ?auto_177778 ) ) ( ON ?auto_177775 ?auto_177776 ) ( ON-TABLE ?auto_177777 ) ( ON ?auto_177778 ?auto_177777 ) ( not ( = ?auto_177777 ?auto_177778 ) ) ( not ( = ?auto_177777 ?auto_177776 ) ) ( not ( = ?auto_177777 ?auto_177775 ) ) ( not ( = ?auto_177770 ?auto_177777 ) ) ( not ( = ?auto_177771 ?auto_177777 ) ) ( not ( = ?auto_177772 ?auto_177777 ) ) ( not ( = ?auto_177773 ?auto_177777 ) ) ( not ( = ?auto_177774 ?auto_177777 ) ) ( ON ?auto_177774 ?auto_177775 ) ( ON ?auto_177773 ?auto_177774 ) ( ON ?auto_177772 ?auto_177773 ) ( ON ?auto_177771 ?auto_177772 ) ( ON ?auto_177770 ?auto_177771 ) ( CLEAR ?auto_177770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177777 ?auto_177778 ?auto_177776 ?auto_177775 ?auto_177774 ?auto_177773 ?auto_177772 ?auto_177771 )
      ( MAKE-7PILE ?auto_177770 ?auto_177771 ?auto_177772 ?auto_177773 ?auto_177774 ?auto_177775 ?auto_177776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177780 - BLOCK
    )
    :vars
    (
      ?auto_177781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177781 ?auto_177780 ) ( CLEAR ?auto_177781 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177780 ) ( not ( = ?auto_177780 ?auto_177781 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177781 ?auto_177780 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177782 - BLOCK
    )
    :vars
    (
      ?auto_177783 - BLOCK
      ?auto_177784 - BLOCK
      ?auto_177785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177783 ?auto_177782 ) ( CLEAR ?auto_177783 ) ( ON-TABLE ?auto_177782 ) ( not ( = ?auto_177782 ?auto_177783 ) ) ( HOLDING ?auto_177784 ) ( CLEAR ?auto_177785 ) ( not ( = ?auto_177782 ?auto_177784 ) ) ( not ( = ?auto_177782 ?auto_177785 ) ) ( not ( = ?auto_177783 ?auto_177784 ) ) ( not ( = ?auto_177783 ?auto_177785 ) ) ( not ( = ?auto_177784 ?auto_177785 ) ) )
    :subtasks
    ( ( !STACK ?auto_177784 ?auto_177785 )
      ( MAKE-1PILE ?auto_177782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177786 - BLOCK
    )
    :vars
    (
      ?auto_177787 - BLOCK
      ?auto_177788 - BLOCK
      ?auto_177789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177787 ?auto_177786 ) ( ON-TABLE ?auto_177786 ) ( not ( = ?auto_177786 ?auto_177787 ) ) ( CLEAR ?auto_177788 ) ( not ( = ?auto_177786 ?auto_177789 ) ) ( not ( = ?auto_177786 ?auto_177788 ) ) ( not ( = ?auto_177787 ?auto_177789 ) ) ( not ( = ?auto_177787 ?auto_177788 ) ) ( not ( = ?auto_177789 ?auto_177788 ) ) ( ON ?auto_177789 ?auto_177787 ) ( CLEAR ?auto_177789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177786 ?auto_177787 )
      ( MAKE-1PILE ?auto_177786 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177790 - BLOCK
    )
    :vars
    (
      ?auto_177792 - BLOCK
      ?auto_177793 - BLOCK
      ?auto_177791 - BLOCK
      ?auto_177794 - BLOCK
      ?auto_177797 - BLOCK
      ?auto_177798 - BLOCK
      ?auto_177795 - BLOCK
      ?auto_177796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177792 ?auto_177790 ) ( ON-TABLE ?auto_177790 ) ( not ( = ?auto_177790 ?auto_177792 ) ) ( not ( = ?auto_177790 ?auto_177793 ) ) ( not ( = ?auto_177790 ?auto_177791 ) ) ( not ( = ?auto_177792 ?auto_177793 ) ) ( not ( = ?auto_177792 ?auto_177791 ) ) ( not ( = ?auto_177793 ?auto_177791 ) ) ( ON ?auto_177793 ?auto_177792 ) ( CLEAR ?auto_177793 ) ( HOLDING ?auto_177791 ) ( CLEAR ?auto_177794 ) ( ON-TABLE ?auto_177797 ) ( ON ?auto_177798 ?auto_177797 ) ( ON ?auto_177795 ?auto_177798 ) ( ON ?auto_177796 ?auto_177795 ) ( ON ?auto_177794 ?auto_177796 ) ( not ( = ?auto_177797 ?auto_177798 ) ) ( not ( = ?auto_177797 ?auto_177795 ) ) ( not ( = ?auto_177797 ?auto_177796 ) ) ( not ( = ?auto_177797 ?auto_177794 ) ) ( not ( = ?auto_177797 ?auto_177791 ) ) ( not ( = ?auto_177798 ?auto_177795 ) ) ( not ( = ?auto_177798 ?auto_177796 ) ) ( not ( = ?auto_177798 ?auto_177794 ) ) ( not ( = ?auto_177798 ?auto_177791 ) ) ( not ( = ?auto_177795 ?auto_177796 ) ) ( not ( = ?auto_177795 ?auto_177794 ) ) ( not ( = ?auto_177795 ?auto_177791 ) ) ( not ( = ?auto_177796 ?auto_177794 ) ) ( not ( = ?auto_177796 ?auto_177791 ) ) ( not ( = ?auto_177794 ?auto_177791 ) ) ( not ( = ?auto_177790 ?auto_177794 ) ) ( not ( = ?auto_177790 ?auto_177797 ) ) ( not ( = ?auto_177790 ?auto_177798 ) ) ( not ( = ?auto_177790 ?auto_177795 ) ) ( not ( = ?auto_177790 ?auto_177796 ) ) ( not ( = ?auto_177792 ?auto_177794 ) ) ( not ( = ?auto_177792 ?auto_177797 ) ) ( not ( = ?auto_177792 ?auto_177798 ) ) ( not ( = ?auto_177792 ?auto_177795 ) ) ( not ( = ?auto_177792 ?auto_177796 ) ) ( not ( = ?auto_177793 ?auto_177794 ) ) ( not ( = ?auto_177793 ?auto_177797 ) ) ( not ( = ?auto_177793 ?auto_177798 ) ) ( not ( = ?auto_177793 ?auto_177795 ) ) ( not ( = ?auto_177793 ?auto_177796 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177797 ?auto_177798 ?auto_177795 ?auto_177796 ?auto_177794 ?auto_177791 )
      ( MAKE-1PILE ?auto_177790 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177799 - BLOCK
    )
    :vars
    (
      ?auto_177802 - BLOCK
      ?auto_177807 - BLOCK
      ?auto_177806 - BLOCK
      ?auto_177804 - BLOCK
      ?auto_177800 - BLOCK
      ?auto_177801 - BLOCK
      ?auto_177805 - BLOCK
      ?auto_177803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177802 ?auto_177799 ) ( ON-TABLE ?auto_177799 ) ( not ( = ?auto_177799 ?auto_177802 ) ) ( not ( = ?auto_177799 ?auto_177807 ) ) ( not ( = ?auto_177799 ?auto_177806 ) ) ( not ( = ?auto_177802 ?auto_177807 ) ) ( not ( = ?auto_177802 ?auto_177806 ) ) ( not ( = ?auto_177807 ?auto_177806 ) ) ( ON ?auto_177807 ?auto_177802 ) ( CLEAR ?auto_177804 ) ( ON-TABLE ?auto_177800 ) ( ON ?auto_177801 ?auto_177800 ) ( ON ?auto_177805 ?auto_177801 ) ( ON ?auto_177803 ?auto_177805 ) ( ON ?auto_177804 ?auto_177803 ) ( not ( = ?auto_177800 ?auto_177801 ) ) ( not ( = ?auto_177800 ?auto_177805 ) ) ( not ( = ?auto_177800 ?auto_177803 ) ) ( not ( = ?auto_177800 ?auto_177804 ) ) ( not ( = ?auto_177800 ?auto_177806 ) ) ( not ( = ?auto_177801 ?auto_177805 ) ) ( not ( = ?auto_177801 ?auto_177803 ) ) ( not ( = ?auto_177801 ?auto_177804 ) ) ( not ( = ?auto_177801 ?auto_177806 ) ) ( not ( = ?auto_177805 ?auto_177803 ) ) ( not ( = ?auto_177805 ?auto_177804 ) ) ( not ( = ?auto_177805 ?auto_177806 ) ) ( not ( = ?auto_177803 ?auto_177804 ) ) ( not ( = ?auto_177803 ?auto_177806 ) ) ( not ( = ?auto_177804 ?auto_177806 ) ) ( not ( = ?auto_177799 ?auto_177804 ) ) ( not ( = ?auto_177799 ?auto_177800 ) ) ( not ( = ?auto_177799 ?auto_177801 ) ) ( not ( = ?auto_177799 ?auto_177805 ) ) ( not ( = ?auto_177799 ?auto_177803 ) ) ( not ( = ?auto_177802 ?auto_177804 ) ) ( not ( = ?auto_177802 ?auto_177800 ) ) ( not ( = ?auto_177802 ?auto_177801 ) ) ( not ( = ?auto_177802 ?auto_177805 ) ) ( not ( = ?auto_177802 ?auto_177803 ) ) ( not ( = ?auto_177807 ?auto_177804 ) ) ( not ( = ?auto_177807 ?auto_177800 ) ) ( not ( = ?auto_177807 ?auto_177801 ) ) ( not ( = ?auto_177807 ?auto_177805 ) ) ( not ( = ?auto_177807 ?auto_177803 ) ) ( ON ?auto_177806 ?auto_177807 ) ( CLEAR ?auto_177806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177799 ?auto_177802 ?auto_177807 )
      ( MAKE-1PILE ?auto_177799 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177808 - BLOCK
    )
    :vars
    (
      ?auto_177816 - BLOCK
      ?auto_177813 - BLOCK
      ?auto_177814 - BLOCK
      ?auto_177815 - BLOCK
      ?auto_177812 - BLOCK
      ?auto_177810 - BLOCK
      ?auto_177811 - BLOCK
      ?auto_177809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177816 ?auto_177808 ) ( ON-TABLE ?auto_177808 ) ( not ( = ?auto_177808 ?auto_177816 ) ) ( not ( = ?auto_177808 ?auto_177813 ) ) ( not ( = ?auto_177808 ?auto_177814 ) ) ( not ( = ?auto_177816 ?auto_177813 ) ) ( not ( = ?auto_177816 ?auto_177814 ) ) ( not ( = ?auto_177813 ?auto_177814 ) ) ( ON ?auto_177813 ?auto_177816 ) ( ON-TABLE ?auto_177815 ) ( ON ?auto_177812 ?auto_177815 ) ( ON ?auto_177810 ?auto_177812 ) ( ON ?auto_177811 ?auto_177810 ) ( not ( = ?auto_177815 ?auto_177812 ) ) ( not ( = ?auto_177815 ?auto_177810 ) ) ( not ( = ?auto_177815 ?auto_177811 ) ) ( not ( = ?auto_177815 ?auto_177809 ) ) ( not ( = ?auto_177815 ?auto_177814 ) ) ( not ( = ?auto_177812 ?auto_177810 ) ) ( not ( = ?auto_177812 ?auto_177811 ) ) ( not ( = ?auto_177812 ?auto_177809 ) ) ( not ( = ?auto_177812 ?auto_177814 ) ) ( not ( = ?auto_177810 ?auto_177811 ) ) ( not ( = ?auto_177810 ?auto_177809 ) ) ( not ( = ?auto_177810 ?auto_177814 ) ) ( not ( = ?auto_177811 ?auto_177809 ) ) ( not ( = ?auto_177811 ?auto_177814 ) ) ( not ( = ?auto_177809 ?auto_177814 ) ) ( not ( = ?auto_177808 ?auto_177809 ) ) ( not ( = ?auto_177808 ?auto_177815 ) ) ( not ( = ?auto_177808 ?auto_177812 ) ) ( not ( = ?auto_177808 ?auto_177810 ) ) ( not ( = ?auto_177808 ?auto_177811 ) ) ( not ( = ?auto_177816 ?auto_177809 ) ) ( not ( = ?auto_177816 ?auto_177815 ) ) ( not ( = ?auto_177816 ?auto_177812 ) ) ( not ( = ?auto_177816 ?auto_177810 ) ) ( not ( = ?auto_177816 ?auto_177811 ) ) ( not ( = ?auto_177813 ?auto_177809 ) ) ( not ( = ?auto_177813 ?auto_177815 ) ) ( not ( = ?auto_177813 ?auto_177812 ) ) ( not ( = ?auto_177813 ?auto_177810 ) ) ( not ( = ?auto_177813 ?auto_177811 ) ) ( ON ?auto_177814 ?auto_177813 ) ( CLEAR ?auto_177814 ) ( HOLDING ?auto_177809 ) ( CLEAR ?auto_177811 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177815 ?auto_177812 ?auto_177810 ?auto_177811 ?auto_177809 )
      ( MAKE-1PILE ?auto_177808 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177817 - BLOCK
    )
    :vars
    (
      ?auto_177818 - BLOCK
      ?auto_177823 - BLOCK
      ?auto_177821 - BLOCK
      ?auto_177824 - BLOCK
      ?auto_177822 - BLOCK
      ?auto_177825 - BLOCK
      ?auto_177819 - BLOCK
      ?auto_177820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177818 ?auto_177817 ) ( ON-TABLE ?auto_177817 ) ( not ( = ?auto_177817 ?auto_177818 ) ) ( not ( = ?auto_177817 ?auto_177823 ) ) ( not ( = ?auto_177817 ?auto_177821 ) ) ( not ( = ?auto_177818 ?auto_177823 ) ) ( not ( = ?auto_177818 ?auto_177821 ) ) ( not ( = ?auto_177823 ?auto_177821 ) ) ( ON ?auto_177823 ?auto_177818 ) ( ON-TABLE ?auto_177824 ) ( ON ?auto_177822 ?auto_177824 ) ( ON ?auto_177825 ?auto_177822 ) ( ON ?auto_177819 ?auto_177825 ) ( not ( = ?auto_177824 ?auto_177822 ) ) ( not ( = ?auto_177824 ?auto_177825 ) ) ( not ( = ?auto_177824 ?auto_177819 ) ) ( not ( = ?auto_177824 ?auto_177820 ) ) ( not ( = ?auto_177824 ?auto_177821 ) ) ( not ( = ?auto_177822 ?auto_177825 ) ) ( not ( = ?auto_177822 ?auto_177819 ) ) ( not ( = ?auto_177822 ?auto_177820 ) ) ( not ( = ?auto_177822 ?auto_177821 ) ) ( not ( = ?auto_177825 ?auto_177819 ) ) ( not ( = ?auto_177825 ?auto_177820 ) ) ( not ( = ?auto_177825 ?auto_177821 ) ) ( not ( = ?auto_177819 ?auto_177820 ) ) ( not ( = ?auto_177819 ?auto_177821 ) ) ( not ( = ?auto_177820 ?auto_177821 ) ) ( not ( = ?auto_177817 ?auto_177820 ) ) ( not ( = ?auto_177817 ?auto_177824 ) ) ( not ( = ?auto_177817 ?auto_177822 ) ) ( not ( = ?auto_177817 ?auto_177825 ) ) ( not ( = ?auto_177817 ?auto_177819 ) ) ( not ( = ?auto_177818 ?auto_177820 ) ) ( not ( = ?auto_177818 ?auto_177824 ) ) ( not ( = ?auto_177818 ?auto_177822 ) ) ( not ( = ?auto_177818 ?auto_177825 ) ) ( not ( = ?auto_177818 ?auto_177819 ) ) ( not ( = ?auto_177823 ?auto_177820 ) ) ( not ( = ?auto_177823 ?auto_177824 ) ) ( not ( = ?auto_177823 ?auto_177822 ) ) ( not ( = ?auto_177823 ?auto_177825 ) ) ( not ( = ?auto_177823 ?auto_177819 ) ) ( ON ?auto_177821 ?auto_177823 ) ( CLEAR ?auto_177819 ) ( ON ?auto_177820 ?auto_177821 ) ( CLEAR ?auto_177820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177817 ?auto_177818 ?auto_177823 ?auto_177821 )
      ( MAKE-1PILE ?auto_177817 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177826 - BLOCK
    )
    :vars
    (
      ?auto_177832 - BLOCK
      ?auto_177828 - BLOCK
      ?auto_177833 - BLOCK
      ?auto_177831 - BLOCK
      ?auto_177830 - BLOCK
      ?auto_177827 - BLOCK
      ?auto_177829 - BLOCK
      ?auto_177834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177832 ?auto_177826 ) ( ON-TABLE ?auto_177826 ) ( not ( = ?auto_177826 ?auto_177832 ) ) ( not ( = ?auto_177826 ?auto_177828 ) ) ( not ( = ?auto_177826 ?auto_177833 ) ) ( not ( = ?auto_177832 ?auto_177828 ) ) ( not ( = ?auto_177832 ?auto_177833 ) ) ( not ( = ?auto_177828 ?auto_177833 ) ) ( ON ?auto_177828 ?auto_177832 ) ( ON-TABLE ?auto_177831 ) ( ON ?auto_177830 ?auto_177831 ) ( ON ?auto_177827 ?auto_177830 ) ( not ( = ?auto_177831 ?auto_177830 ) ) ( not ( = ?auto_177831 ?auto_177827 ) ) ( not ( = ?auto_177831 ?auto_177829 ) ) ( not ( = ?auto_177831 ?auto_177834 ) ) ( not ( = ?auto_177831 ?auto_177833 ) ) ( not ( = ?auto_177830 ?auto_177827 ) ) ( not ( = ?auto_177830 ?auto_177829 ) ) ( not ( = ?auto_177830 ?auto_177834 ) ) ( not ( = ?auto_177830 ?auto_177833 ) ) ( not ( = ?auto_177827 ?auto_177829 ) ) ( not ( = ?auto_177827 ?auto_177834 ) ) ( not ( = ?auto_177827 ?auto_177833 ) ) ( not ( = ?auto_177829 ?auto_177834 ) ) ( not ( = ?auto_177829 ?auto_177833 ) ) ( not ( = ?auto_177834 ?auto_177833 ) ) ( not ( = ?auto_177826 ?auto_177834 ) ) ( not ( = ?auto_177826 ?auto_177831 ) ) ( not ( = ?auto_177826 ?auto_177830 ) ) ( not ( = ?auto_177826 ?auto_177827 ) ) ( not ( = ?auto_177826 ?auto_177829 ) ) ( not ( = ?auto_177832 ?auto_177834 ) ) ( not ( = ?auto_177832 ?auto_177831 ) ) ( not ( = ?auto_177832 ?auto_177830 ) ) ( not ( = ?auto_177832 ?auto_177827 ) ) ( not ( = ?auto_177832 ?auto_177829 ) ) ( not ( = ?auto_177828 ?auto_177834 ) ) ( not ( = ?auto_177828 ?auto_177831 ) ) ( not ( = ?auto_177828 ?auto_177830 ) ) ( not ( = ?auto_177828 ?auto_177827 ) ) ( not ( = ?auto_177828 ?auto_177829 ) ) ( ON ?auto_177833 ?auto_177828 ) ( ON ?auto_177834 ?auto_177833 ) ( CLEAR ?auto_177834 ) ( HOLDING ?auto_177829 ) ( CLEAR ?auto_177827 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177831 ?auto_177830 ?auto_177827 ?auto_177829 )
      ( MAKE-1PILE ?auto_177826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177835 - BLOCK
    )
    :vars
    (
      ?auto_177837 - BLOCK
      ?auto_177841 - BLOCK
      ?auto_177842 - BLOCK
      ?auto_177843 - BLOCK
      ?auto_177839 - BLOCK
      ?auto_177840 - BLOCK
      ?auto_177838 - BLOCK
      ?auto_177836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177837 ?auto_177835 ) ( ON-TABLE ?auto_177835 ) ( not ( = ?auto_177835 ?auto_177837 ) ) ( not ( = ?auto_177835 ?auto_177841 ) ) ( not ( = ?auto_177835 ?auto_177842 ) ) ( not ( = ?auto_177837 ?auto_177841 ) ) ( not ( = ?auto_177837 ?auto_177842 ) ) ( not ( = ?auto_177841 ?auto_177842 ) ) ( ON ?auto_177841 ?auto_177837 ) ( ON-TABLE ?auto_177843 ) ( ON ?auto_177839 ?auto_177843 ) ( ON ?auto_177840 ?auto_177839 ) ( not ( = ?auto_177843 ?auto_177839 ) ) ( not ( = ?auto_177843 ?auto_177840 ) ) ( not ( = ?auto_177843 ?auto_177838 ) ) ( not ( = ?auto_177843 ?auto_177836 ) ) ( not ( = ?auto_177843 ?auto_177842 ) ) ( not ( = ?auto_177839 ?auto_177840 ) ) ( not ( = ?auto_177839 ?auto_177838 ) ) ( not ( = ?auto_177839 ?auto_177836 ) ) ( not ( = ?auto_177839 ?auto_177842 ) ) ( not ( = ?auto_177840 ?auto_177838 ) ) ( not ( = ?auto_177840 ?auto_177836 ) ) ( not ( = ?auto_177840 ?auto_177842 ) ) ( not ( = ?auto_177838 ?auto_177836 ) ) ( not ( = ?auto_177838 ?auto_177842 ) ) ( not ( = ?auto_177836 ?auto_177842 ) ) ( not ( = ?auto_177835 ?auto_177836 ) ) ( not ( = ?auto_177835 ?auto_177843 ) ) ( not ( = ?auto_177835 ?auto_177839 ) ) ( not ( = ?auto_177835 ?auto_177840 ) ) ( not ( = ?auto_177835 ?auto_177838 ) ) ( not ( = ?auto_177837 ?auto_177836 ) ) ( not ( = ?auto_177837 ?auto_177843 ) ) ( not ( = ?auto_177837 ?auto_177839 ) ) ( not ( = ?auto_177837 ?auto_177840 ) ) ( not ( = ?auto_177837 ?auto_177838 ) ) ( not ( = ?auto_177841 ?auto_177836 ) ) ( not ( = ?auto_177841 ?auto_177843 ) ) ( not ( = ?auto_177841 ?auto_177839 ) ) ( not ( = ?auto_177841 ?auto_177840 ) ) ( not ( = ?auto_177841 ?auto_177838 ) ) ( ON ?auto_177842 ?auto_177841 ) ( ON ?auto_177836 ?auto_177842 ) ( CLEAR ?auto_177840 ) ( ON ?auto_177838 ?auto_177836 ) ( CLEAR ?auto_177838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177835 ?auto_177837 ?auto_177841 ?auto_177842 ?auto_177836 )
      ( MAKE-1PILE ?auto_177835 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177844 - BLOCK
    )
    :vars
    (
      ?auto_177849 - BLOCK
      ?auto_177851 - BLOCK
      ?auto_177847 - BLOCK
      ?auto_177845 - BLOCK
      ?auto_177846 - BLOCK
      ?auto_177850 - BLOCK
      ?auto_177848 - BLOCK
      ?auto_177852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177849 ?auto_177844 ) ( ON-TABLE ?auto_177844 ) ( not ( = ?auto_177844 ?auto_177849 ) ) ( not ( = ?auto_177844 ?auto_177851 ) ) ( not ( = ?auto_177844 ?auto_177847 ) ) ( not ( = ?auto_177849 ?auto_177851 ) ) ( not ( = ?auto_177849 ?auto_177847 ) ) ( not ( = ?auto_177851 ?auto_177847 ) ) ( ON ?auto_177851 ?auto_177849 ) ( ON-TABLE ?auto_177845 ) ( ON ?auto_177846 ?auto_177845 ) ( not ( = ?auto_177845 ?auto_177846 ) ) ( not ( = ?auto_177845 ?auto_177850 ) ) ( not ( = ?auto_177845 ?auto_177848 ) ) ( not ( = ?auto_177845 ?auto_177852 ) ) ( not ( = ?auto_177845 ?auto_177847 ) ) ( not ( = ?auto_177846 ?auto_177850 ) ) ( not ( = ?auto_177846 ?auto_177848 ) ) ( not ( = ?auto_177846 ?auto_177852 ) ) ( not ( = ?auto_177846 ?auto_177847 ) ) ( not ( = ?auto_177850 ?auto_177848 ) ) ( not ( = ?auto_177850 ?auto_177852 ) ) ( not ( = ?auto_177850 ?auto_177847 ) ) ( not ( = ?auto_177848 ?auto_177852 ) ) ( not ( = ?auto_177848 ?auto_177847 ) ) ( not ( = ?auto_177852 ?auto_177847 ) ) ( not ( = ?auto_177844 ?auto_177852 ) ) ( not ( = ?auto_177844 ?auto_177845 ) ) ( not ( = ?auto_177844 ?auto_177846 ) ) ( not ( = ?auto_177844 ?auto_177850 ) ) ( not ( = ?auto_177844 ?auto_177848 ) ) ( not ( = ?auto_177849 ?auto_177852 ) ) ( not ( = ?auto_177849 ?auto_177845 ) ) ( not ( = ?auto_177849 ?auto_177846 ) ) ( not ( = ?auto_177849 ?auto_177850 ) ) ( not ( = ?auto_177849 ?auto_177848 ) ) ( not ( = ?auto_177851 ?auto_177852 ) ) ( not ( = ?auto_177851 ?auto_177845 ) ) ( not ( = ?auto_177851 ?auto_177846 ) ) ( not ( = ?auto_177851 ?auto_177850 ) ) ( not ( = ?auto_177851 ?auto_177848 ) ) ( ON ?auto_177847 ?auto_177851 ) ( ON ?auto_177852 ?auto_177847 ) ( ON ?auto_177848 ?auto_177852 ) ( CLEAR ?auto_177848 ) ( HOLDING ?auto_177850 ) ( CLEAR ?auto_177846 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177845 ?auto_177846 ?auto_177850 )
      ( MAKE-1PILE ?auto_177844 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177853 - BLOCK
    )
    :vars
    (
      ?auto_177860 - BLOCK
      ?auto_177855 - BLOCK
      ?auto_177858 - BLOCK
      ?auto_177856 - BLOCK
      ?auto_177861 - BLOCK
      ?auto_177854 - BLOCK
      ?auto_177859 - BLOCK
      ?auto_177857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177860 ?auto_177853 ) ( ON-TABLE ?auto_177853 ) ( not ( = ?auto_177853 ?auto_177860 ) ) ( not ( = ?auto_177853 ?auto_177855 ) ) ( not ( = ?auto_177853 ?auto_177858 ) ) ( not ( = ?auto_177860 ?auto_177855 ) ) ( not ( = ?auto_177860 ?auto_177858 ) ) ( not ( = ?auto_177855 ?auto_177858 ) ) ( ON ?auto_177855 ?auto_177860 ) ( ON-TABLE ?auto_177856 ) ( ON ?auto_177861 ?auto_177856 ) ( not ( = ?auto_177856 ?auto_177861 ) ) ( not ( = ?auto_177856 ?auto_177854 ) ) ( not ( = ?auto_177856 ?auto_177859 ) ) ( not ( = ?auto_177856 ?auto_177857 ) ) ( not ( = ?auto_177856 ?auto_177858 ) ) ( not ( = ?auto_177861 ?auto_177854 ) ) ( not ( = ?auto_177861 ?auto_177859 ) ) ( not ( = ?auto_177861 ?auto_177857 ) ) ( not ( = ?auto_177861 ?auto_177858 ) ) ( not ( = ?auto_177854 ?auto_177859 ) ) ( not ( = ?auto_177854 ?auto_177857 ) ) ( not ( = ?auto_177854 ?auto_177858 ) ) ( not ( = ?auto_177859 ?auto_177857 ) ) ( not ( = ?auto_177859 ?auto_177858 ) ) ( not ( = ?auto_177857 ?auto_177858 ) ) ( not ( = ?auto_177853 ?auto_177857 ) ) ( not ( = ?auto_177853 ?auto_177856 ) ) ( not ( = ?auto_177853 ?auto_177861 ) ) ( not ( = ?auto_177853 ?auto_177854 ) ) ( not ( = ?auto_177853 ?auto_177859 ) ) ( not ( = ?auto_177860 ?auto_177857 ) ) ( not ( = ?auto_177860 ?auto_177856 ) ) ( not ( = ?auto_177860 ?auto_177861 ) ) ( not ( = ?auto_177860 ?auto_177854 ) ) ( not ( = ?auto_177860 ?auto_177859 ) ) ( not ( = ?auto_177855 ?auto_177857 ) ) ( not ( = ?auto_177855 ?auto_177856 ) ) ( not ( = ?auto_177855 ?auto_177861 ) ) ( not ( = ?auto_177855 ?auto_177854 ) ) ( not ( = ?auto_177855 ?auto_177859 ) ) ( ON ?auto_177858 ?auto_177855 ) ( ON ?auto_177857 ?auto_177858 ) ( ON ?auto_177859 ?auto_177857 ) ( CLEAR ?auto_177861 ) ( ON ?auto_177854 ?auto_177859 ) ( CLEAR ?auto_177854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177853 ?auto_177860 ?auto_177855 ?auto_177858 ?auto_177857 ?auto_177859 )
      ( MAKE-1PILE ?auto_177853 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177862 - BLOCK
    )
    :vars
    (
      ?auto_177863 - BLOCK
      ?auto_177867 - BLOCK
      ?auto_177870 - BLOCK
      ?auto_177865 - BLOCK
      ?auto_177864 - BLOCK
      ?auto_177866 - BLOCK
      ?auto_177868 - BLOCK
      ?auto_177869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177863 ?auto_177862 ) ( ON-TABLE ?auto_177862 ) ( not ( = ?auto_177862 ?auto_177863 ) ) ( not ( = ?auto_177862 ?auto_177867 ) ) ( not ( = ?auto_177862 ?auto_177870 ) ) ( not ( = ?auto_177863 ?auto_177867 ) ) ( not ( = ?auto_177863 ?auto_177870 ) ) ( not ( = ?auto_177867 ?auto_177870 ) ) ( ON ?auto_177867 ?auto_177863 ) ( ON-TABLE ?auto_177865 ) ( not ( = ?auto_177865 ?auto_177864 ) ) ( not ( = ?auto_177865 ?auto_177866 ) ) ( not ( = ?auto_177865 ?auto_177868 ) ) ( not ( = ?auto_177865 ?auto_177869 ) ) ( not ( = ?auto_177865 ?auto_177870 ) ) ( not ( = ?auto_177864 ?auto_177866 ) ) ( not ( = ?auto_177864 ?auto_177868 ) ) ( not ( = ?auto_177864 ?auto_177869 ) ) ( not ( = ?auto_177864 ?auto_177870 ) ) ( not ( = ?auto_177866 ?auto_177868 ) ) ( not ( = ?auto_177866 ?auto_177869 ) ) ( not ( = ?auto_177866 ?auto_177870 ) ) ( not ( = ?auto_177868 ?auto_177869 ) ) ( not ( = ?auto_177868 ?auto_177870 ) ) ( not ( = ?auto_177869 ?auto_177870 ) ) ( not ( = ?auto_177862 ?auto_177869 ) ) ( not ( = ?auto_177862 ?auto_177865 ) ) ( not ( = ?auto_177862 ?auto_177864 ) ) ( not ( = ?auto_177862 ?auto_177866 ) ) ( not ( = ?auto_177862 ?auto_177868 ) ) ( not ( = ?auto_177863 ?auto_177869 ) ) ( not ( = ?auto_177863 ?auto_177865 ) ) ( not ( = ?auto_177863 ?auto_177864 ) ) ( not ( = ?auto_177863 ?auto_177866 ) ) ( not ( = ?auto_177863 ?auto_177868 ) ) ( not ( = ?auto_177867 ?auto_177869 ) ) ( not ( = ?auto_177867 ?auto_177865 ) ) ( not ( = ?auto_177867 ?auto_177864 ) ) ( not ( = ?auto_177867 ?auto_177866 ) ) ( not ( = ?auto_177867 ?auto_177868 ) ) ( ON ?auto_177870 ?auto_177867 ) ( ON ?auto_177869 ?auto_177870 ) ( ON ?auto_177868 ?auto_177869 ) ( ON ?auto_177866 ?auto_177868 ) ( CLEAR ?auto_177866 ) ( HOLDING ?auto_177864 ) ( CLEAR ?auto_177865 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177865 ?auto_177864 )
      ( MAKE-1PILE ?auto_177862 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180041 - BLOCK
    )
    :vars
    (
      ?auto_180043 - BLOCK
      ?auto_180047 - BLOCK
      ?auto_180046 - BLOCK
      ?auto_180045 - BLOCK
      ?auto_180048 - BLOCK
      ?auto_180044 - BLOCK
      ?auto_180042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180043 ?auto_180041 ) ( ON-TABLE ?auto_180041 ) ( not ( = ?auto_180041 ?auto_180043 ) ) ( not ( = ?auto_180041 ?auto_180047 ) ) ( not ( = ?auto_180041 ?auto_180046 ) ) ( not ( = ?auto_180043 ?auto_180047 ) ) ( not ( = ?auto_180043 ?auto_180046 ) ) ( not ( = ?auto_180047 ?auto_180046 ) ) ( ON ?auto_180047 ?auto_180043 ) ( not ( = ?auto_180045 ?auto_180048 ) ) ( not ( = ?auto_180045 ?auto_180044 ) ) ( not ( = ?auto_180045 ?auto_180042 ) ) ( not ( = ?auto_180045 ?auto_180046 ) ) ( not ( = ?auto_180048 ?auto_180044 ) ) ( not ( = ?auto_180048 ?auto_180042 ) ) ( not ( = ?auto_180048 ?auto_180046 ) ) ( not ( = ?auto_180044 ?auto_180042 ) ) ( not ( = ?auto_180044 ?auto_180046 ) ) ( not ( = ?auto_180042 ?auto_180046 ) ) ( not ( = ?auto_180041 ?auto_180042 ) ) ( not ( = ?auto_180041 ?auto_180045 ) ) ( not ( = ?auto_180041 ?auto_180048 ) ) ( not ( = ?auto_180041 ?auto_180044 ) ) ( not ( = ?auto_180043 ?auto_180042 ) ) ( not ( = ?auto_180043 ?auto_180045 ) ) ( not ( = ?auto_180043 ?auto_180048 ) ) ( not ( = ?auto_180043 ?auto_180044 ) ) ( not ( = ?auto_180047 ?auto_180042 ) ) ( not ( = ?auto_180047 ?auto_180045 ) ) ( not ( = ?auto_180047 ?auto_180048 ) ) ( not ( = ?auto_180047 ?auto_180044 ) ) ( ON ?auto_180046 ?auto_180047 ) ( ON ?auto_180042 ?auto_180046 ) ( ON ?auto_180044 ?auto_180042 ) ( ON ?auto_180048 ?auto_180044 ) ( ON ?auto_180045 ?auto_180048 ) ( CLEAR ?auto_180045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180041 ?auto_180043 ?auto_180047 ?auto_180046 ?auto_180042 ?auto_180044 ?auto_180048 )
      ( MAKE-1PILE ?auto_180041 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177880 - BLOCK
    )
    :vars
    (
      ?auto_177888 - BLOCK
      ?auto_177887 - BLOCK
      ?auto_177881 - BLOCK
      ?auto_177883 - BLOCK
      ?auto_177884 - BLOCK
      ?auto_177882 - BLOCK
      ?auto_177885 - BLOCK
      ?auto_177886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177888 ?auto_177880 ) ( ON-TABLE ?auto_177880 ) ( not ( = ?auto_177880 ?auto_177888 ) ) ( not ( = ?auto_177880 ?auto_177887 ) ) ( not ( = ?auto_177880 ?auto_177881 ) ) ( not ( = ?auto_177888 ?auto_177887 ) ) ( not ( = ?auto_177888 ?auto_177881 ) ) ( not ( = ?auto_177887 ?auto_177881 ) ) ( ON ?auto_177887 ?auto_177888 ) ( not ( = ?auto_177883 ?auto_177884 ) ) ( not ( = ?auto_177883 ?auto_177882 ) ) ( not ( = ?auto_177883 ?auto_177885 ) ) ( not ( = ?auto_177883 ?auto_177886 ) ) ( not ( = ?auto_177883 ?auto_177881 ) ) ( not ( = ?auto_177884 ?auto_177882 ) ) ( not ( = ?auto_177884 ?auto_177885 ) ) ( not ( = ?auto_177884 ?auto_177886 ) ) ( not ( = ?auto_177884 ?auto_177881 ) ) ( not ( = ?auto_177882 ?auto_177885 ) ) ( not ( = ?auto_177882 ?auto_177886 ) ) ( not ( = ?auto_177882 ?auto_177881 ) ) ( not ( = ?auto_177885 ?auto_177886 ) ) ( not ( = ?auto_177885 ?auto_177881 ) ) ( not ( = ?auto_177886 ?auto_177881 ) ) ( not ( = ?auto_177880 ?auto_177886 ) ) ( not ( = ?auto_177880 ?auto_177883 ) ) ( not ( = ?auto_177880 ?auto_177884 ) ) ( not ( = ?auto_177880 ?auto_177882 ) ) ( not ( = ?auto_177880 ?auto_177885 ) ) ( not ( = ?auto_177888 ?auto_177886 ) ) ( not ( = ?auto_177888 ?auto_177883 ) ) ( not ( = ?auto_177888 ?auto_177884 ) ) ( not ( = ?auto_177888 ?auto_177882 ) ) ( not ( = ?auto_177888 ?auto_177885 ) ) ( not ( = ?auto_177887 ?auto_177886 ) ) ( not ( = ?auto_177887 ?auto_177883 ) ) ( not ( = ?auto_177887 ?auto_177884 ) ) ( not ( = ?auto_177887 ?auto_177882 ) ) ( not ( = ?auto_177887 ?auto_177885 ) ) ( ON ?auto_177881 ?auto_177887 ) ( ON ?auto_177886 ?auto_177881 ) ( ON ?auto_177885 ?auto_177886 ) ( ON ?auto_177882 ?auto_177885 ) ( ON ?auto_177884 ?auto_177882 ) ( CLEAR ?auto_177884 ) ( HOLDING ?auto_177883 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177883 )
      ( MAKE-1PILE ?auto_177880 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177889 - BLOCK
    )
    :vars
    (
      ?auto_177895 - BLOCK
      ?auto_177894 - BLOCK
      ?auto_177892 - BLOCK
      ?auto_177897 - BLOCK
      ?auto_177891 - BLOCK
      ?auto_177890 - BLOCK
      ?auto_177893 - BLOCK
      ?auto_177896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177895 ?auto_177889 ) ( ON-TABLE ?auto_177889 ) ( not ( = ?auto_177889 ?auto_177895 ) ) ( not ( = ?auto_177889 ?auto_177894 ) ) ( not ( = ?auto_177889 ?auto_177892 ) ) ( not ( = ?auto_177895 ?auto_177894 ) ) ( not ( = ?auto_177895 ?auto_177892 ) ) ( not ( = ?auto_177894 ?auto_177892 ) ) ( ON ?auto_177894 ?auto_177895 ) ( not ( = ?auto_177897 ?auto_177891 ) ) ( not ( = ?auto_177897 ?auto_177890 ) ) ( not ( = ?auto_177897 ?auto_177893 ) ) ( not ( = ?auto_177897 ?auto_177896 ) ) ( not ( = ?auto_177897 ?auto_177892 ) ) ( not ( = ?auto_177891 ?auto_177890 ) ) ( not ( = ?auto_177891 ?auto_177893 ) ) ( not ( = ?auto_177891 ?auto_177896 ) ) ( not ( = ?auto_177891 ?auto_177892 ) ) ( not ( = ?auto_177890 ?auto_177893 ) ) ( not ( = ?auto_177890 ?auto_177896 ) ) ( not ( = ?auto_177890 ?auto_177892 ) ) ( not ( = ?auto_177893 ?auto_177896 ) ) ( not ( = ?auto_177893 ?auto_177892 ) ) ( not ( = ?auto_177896 ?auto_177892 ) ) ( not ( = ?auto_177889 ?auto_177896 ) ) ( not ( = ?auto_177889 ?auto_177897 ) ) ( not ( = ?auto_177889 ?auto_177891 ) ) ( not ( = ?auto_177889 ?auto_177890 ) ) ( not ( = ?auto_177889 ?auto_177893 ) ) ( not ( = ?auto_177895 ?auto_177896 ) ) ( not ( = ?auto_177895 ?auto_177897 ) ) ( not ( = ?auto_177895 ?auto_177891 ) ) ( not ( = ?auto_177895 ?auto_177890 ) ) ( not ( = ?auto_177895 ?auto_177893 ) ) ( not ( = ?auto_177894 ?auto_177896 ) ) ( not ( = ?auto_177894 ?auto_177897 ) ) ( not ( = ?auto_177894 ?auto_177891 ) ) ( not ( = ?auto_177894 ?auto_177890 ) ) ( not ( = ?auto_177894 ?auto_177893 ) ) ( ON ?auto_177892 ?auto_177894 ) ( ON ?auto_177896 ?auto_177892 ) ( ON ?auto_177893 ?auto_177896 ) ( ON ?auto_177890 ?auto_177893 ) ( ON ?auto_177891 ?auto_177890 ) ( ON ?auto_177897 ?auto_177891 ) ( CLEAR ?auto_177897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177889 ?auto_177895 ?auto_177894 ?auto_177892 ?auto_177896 ?auto_177893 ?auto_177890 ?auto_177891 )
      ( MAKE-1PILE ?auto_177889 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_177906 - BLOCK
      ?auto_177907 - BLOCK
      ?auto_177908 - BLOCK
      ?auto_177909 - BLOCK
      ?auto_177910 - BLOCK
      ?auto_177911 - BLOCK
      ?auto_177912 - BLOCK
      ?auto_177913 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_177913 ) ( CLEAR ?auto_177912 ) ( ON-TABLE ?auto_177906 ) ( ON ?auto_177907 ?auto_177906 ) ( ON ?auto_177908 ?auto_177907 ) ( ON ?auto_177909 ?auto_177908 ) ( ON ?auto_177910 ?auto_177909 ) ( ON ?auto_177911 ?auto_177910 ) ( ON ?auto_177912 ?auto_177911 ) ( not ( = ?auto_177906 ?auto_177907 ) ) ( not ( = ?auto_177906 ?auto_177908 ) ) ( not ( = ?auto_177906 ?auto_177909 ) ) ( not ( = ?auto_177906 ?auto_177910 ) ) ( not ( = ?auto_177906 ?auto_177911 ) ) ( not ( = ?auto_177906 ?auto_177912 ) ) ( not ( = ?auto_177906 ?auto_177913 ) ) ( not ( = ?auto_177907 ?auto_177908 ) ) ( not ( = ?auto_177907 ?auto_177909 ) ) ( not ( = ?auto_177907 ?auto_177910 ) ) ( not ( = ?auto_177907 ?auto_177911 ) ) ( not ( = ?auto_177907 ?auto_177912 ) ) ( not ( = ?auto_177907 ?auto_177913 ) ) ( not ( = ?auto_177908 ?auto_177909 ) ) ( not ( = ?auto_177908 ?auto_177910 ) ) ( not ( = ?auto_177908 ?auto_177911 ) ) ( not ( = ?auto_177908 ?auto_177912 ) ) ( not ( = ?auto_177908 ?auto_177913 ) ) ( not ( = ?auto_177909 ?auto_177910 ) ) ( not ( = ?auto_177909 ?auto_177911 ) ) ( not ( = ?auto_177909 ?auto_177912 ) ) ( not ( = ?auto_177909 ?auto_177913 ) ) ( not ( = ?auto_177910 ?auto_177911 ) ) ( not ( = ?auto_177910 ?auto_177912 ) ) ( not ( = ?auto_177910 ?auto_177913 ) ) ( not ( = ?auto_177911 ?auto_177912 ) ) ( not ( = ?auto_177911 ?auto_177913 ) ) ( not ( = ?auto_177912 ?auto_177913 ) ) )
    :subtasks
    ( ( !STACK ?auto_177913 ?auto_177912 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_177914 - BLOCK
      ?auto_177915 - BLOCK
      ?auto_177916 - BLOCK
      ?auto_177917 - BLOCK
      ?auto_177918 - BLOCK
      ?auto_177919 - BLOCK
      ?auto_177920 - BLOCK
      ?auto_177921 - BLOCK
    )
    :vars
    (
      ?auto_177922 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177920 ) ( ON-TABLE ?auto_177914 ) ( ON ?auto_177915 ?auto_177914 ) ( ON ?auto_177916 ?auto_177915 ) ( ON ?auto_177917 ?auto_177916 ) ( ON ?auto_177918 ?auto_177917 ) ( ON ?auto_177919 ?auto_177918 ) ( ON ?auto_177920 ?auto_177919 ) ( not ( = ?auto_177914 ?auto_177915 ) ) ( not ( = ?auto_177914 ?auto_177916 ) ) ( not ( = ?auto_177914 ?auto_177917 ) ) ( not ( = ?auto_177914 ?auto_177918 ) ) ( not ( = ?auto_177914 ?auto_177919 ) ) ( not ( = ?auto_177914 ?auto_177920 ) ) ( not ( = ?auto_177914 ?auto_177921 ) ) ( not ( = ?auto_177915 ?auto_177916 ) ) ( not ( = ?auto_177915 ?auto_177917 ) ) ( not ( = ?auto_177915 ?auto_177918 ) ) ( not ( = ?auto_177915 ?auto_177919 ) ) ( not ( = ?auto_177915 ?auto_177920 ) ) ( not ( = ?auto_177915 ?auto_177921 ) ) ( not ( = ?auto_177916 ?auto_177917 ) ) ( not ( = ?auto_177916 ?auto_177918 ) ) ( not ( = ?auto_177916 ?auto_177919 ) ) ( not ( = ?auto_177916 ?auto_177920 ) ) ( not ( = ?auto_177916 ?auto_177921 ) ) ( not ( = ?auto_177917 ?auto_177918 ) ) ( not ( = ?auto_177917 ?auto_177919 ) ) ( not ( = ?auto_177917 ?auto_177920 ) ) ( not ( = ?auto_177917 ?auto_177921 ) ) ( not ( = ?auto_177918 ?auto_177919 ) ) ( not ( = ?auto_177918 ?auto_177920 ) ) ( not ( = ?auto_177918 ?auto_177921 ) ) ( not ( = ?auto_177919 ?auto_177920 ) ) ( not ( = ?auto_177919 ?auto_177921 ) ) ( not ( = ?auto_177920 ?auto_177921 ) ) ( ON ?auto_177921 ?auto_177922 ) ( CLEAR ?auto_177921 ) ( HAND-EMPTY ) ( not ( = ?auto_177914 ?auto_177922 ) ) ( not ( = ?auto_177915 ?auto_177922 ) ) ( not ( = ?auto_177916 ?auto_177922 ) ) ( not ( = ?auto_177917 ?auto_177922 ) ) ( not ( = ?auto_177918 ?auto_177922 ) ) ( not ( = ?auto_177919 ?auto_177922 ) ) ( not ( = ?auto_177920 ?auto_177922 ) ) ( not ( = ?auto_177921 ?auto_177922 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177921 ?auto_177922 )
      ( MAKE-8PILE ?auto_177914 ?auto_177915 ?auto_177916 ?auto_177917 ?auto_177918 ?auto_177919 ?auto_177920 ?auto_177921 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_177923 - BLOCK
      ?auto_177924 - BLOCK
      ?auto_177925 - BLOCK
      ?auto_177926 - BLOCK
      ?auto_177927 - BLOCK
      ?auto_177928 - BLOCK
      ?auto_177929 - BLOCK
      ?auto_177930 - BLOCK
    )
    :vars
    (
      ?auto_177931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177923 ) ( ON ?auto_177924 ?auto_177923 ) ( ON ?auto_177925 ?auto_177924 ) ( ON ?auto_177926 ?auto_177925 ) ( ON ?auto_177927 ?auto_177926 ) ( ON ?auto_177928 ?auto_177927 ) ( not ( = ?auto_177923 ?auto_177924 ) ) ( not ( = ?auto_177923 ?auto_177925 ) ) ( not ( = ?auto_177923 ?auto_177926 ) ) ( not ( = ?auto_177923 ?auto_177927 ) ) ( not ( = ?auto_177923 ?auto_177928 ) ) ( not ( = ?auto_177923 ?auto_177929 ) ) ( not ( = ?auto_177923 ?auto_177930 ) ) ( not ( = ?auto_177924 ?auto_177925 ) ) ( not ( = ?auto_177924 ?auto_177926 ) ) ( not ( = ?auto_177924 ?auto_177927 ) ) ( not ( = ?auto_177924 ?auto_177928 ) ) ( not ( = ?auto_177924 ?auto_177929 ) ) ( not ( = ?auto_177924 ?auto_177930 ) ) ( not ( = ?auto_177925 ?auto_177926 ) ) ( not ( = ?auto_177925 ?auto_177927 ) ) ( not ( = ?auto_177925 ?auto_177928 ) ) ( not ( = ?auto_177925 ?auto_177929 ) ) ( not ( = ?auto_177925 ?auto_177930 ) ) ( not ( = ?auto_177926 ?auto_177927 ) ) ( not ( = ?auto_177926 ?auto_177928 ) ) ( not ( = ?auto_177926 ?auto_177929 ) ) ( not ( = ?auto_177926 ?auto_177930 ) ) ( not ( = ?auto_177927 ?auto_177928 ) ) ( not ( = ?auto_177927 ?auto_177929 ) ) ( not ( = ?auto_177927 ?auto_177930 ) ) ( not ( = ?auto_177928 ?auto_177929 ) ) ( not ( = ?auto_177928 ?auto_177930 ) ) ( not ( = ?auto_177929 ?auto_177930 ) ) ( ON ?auto_177930 ?auto_177931 ) ( CLEAR ?auto_177930 ) ( not ( = ?auto_177923 ?auto_177931 ) ) ( not ( = ?auto_177924 ?auto_177931 ) ) ( not ( = ?auto_177925 ?auto_177931 ) ) ( not ( = ?auto_177926 ?auto_177931 ) ) ( not ( = ?auto_177927 ?auto_177931 ) ) ( not ( = ?auto_177928 ?auto_177931 ) ) ( not ( = ?auto_177929 ?auto_177931 ) ) ( not ( = ?auto_177930 ?auto_177931 ) ) ( HOLDING ?auto_177929 ) ( CLEAR ?auto_177928 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177923 ?auto_177924 ?auto_177925 ?auto_177926 ?auto_177927 ?auto_177928 ?auto_177929 )
      ( MAKE-8PILE ?auto_177923 ?auto_177924 ?auto_177925 ?auto_177926 ?auto_177927 ?auto_177928 ?auto_177929 ?auto_177930 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_177932 - BLOCK
      ?auto_177933 - BLOCK
      ?auto_177934 - BLOCK
      ?auto_177935 - BLOCK
      ?auto_177936 - BLOCK
      ?auto_177937 - BLOCK
      ?auto_177938 - BLOCK
      ?auto_177939 - BLOCK
    )
    :vars
    (
      ?auto_177940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177932 ) ( ON ?auto_177933 ?auto_177932 ) ( ON ?auto_177934 ?auto_177933 ) ( ON ?auto_177935 ?auto_177934 ) ( ON ?auto_177936 ?auto_177935 ) ( ON ?auto_177937 ?auto_177936 ) ( not ( = ?auto_177932 ?auto_177933 ) ) ( not ( = ?auto_177932 ?auto_177934 ) ) ( not ( = ?auto_177932 ?auto_177935 ) ) ( not ( = ?auto_177932 ?auto_177936 ) ) ( not ( = ?auto_177932 ?auto_177937 ) ) ( not ( = ?auto_177932 ?auto_177938 ) ) ( not ( = ?auto_177932 ?auto_177939 ) ) ( not ( = ?auto_177933 ?auto_177934 ) ) ( not ( = ?auto_177933 ?auto_177935 ) ) ( not ( = ?auto_177933 ?auto_177936 ) ) ( not ( = ?auto_177933 ?auto_177937 ) ) ( not ( = ?auto_177933 ?auto_177938 ) ) ( not ( = ?auto_177933 ?auto_177939 ) ) ( not ( = ?auto_177934 ?auto_177935 ) ) ( not ( = ?auto_177934 ?auto_177936 ) ) ( not ( = ?auto_177934 ?auto_177937 ) ) ( not ( = ?auto_177934 ?auto_177938 ) ) ( not ( = ?auto_177934 ?auto_177939 ) ) ( not ( = ?auto_177935 ?auto_177936 ) ) ( not ( = ?auto_177935 ?auto_177937 ) ) ( not ( = ?auto_177935 ?auto_177938 ) ) ( not ( = ?auto_177935 ?auto_177939 ) ) ( not ( = ?auto_177936 ?auto_177937 ) ) ( not ( = ?auto_177936 ?auto_177938 ) ) ( not ( = ?auto_177936 ?auto_177939 ) ) ( not ( = ?auto_177937 ?auto_177938 ) ) ( not ( = ?auto_177937 ?auto_177939 ) ) ( not ( = ?auto_177938 ?auto_177939 ) ) ( ON ?auto_177939 ?auto_177940 ) ( not ( = ?auto_177932 ?auto_177940 ) ) ( not ( = ?auto_177933 ?auto_177940 ) ) ( not ( = ?auto_177934 ?auto_177940 ) ) ( not ( = ?auto_177935 ?auto_177940 ) ) ( not ( = ?auto_177936 ?auto_177940 ) ) ( not ( = ?auto_177937 ?auto_177940 ) ) ( not ( = ?auto_177938 ?auto_177940 ) ) ( not ( = ?auto_177939 ?auto_177940 ) ) ( CLEAR ?auto_177937 ) ( ON ?auto_177938 ?auto_177939 ) ( CLEAR ?auto_177938 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177940 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177940 ?auto_177939 )
      ( MAKE-8PILE ?auto_177932 ?auto_177933 ?auto_177934 ?auto_177935 ?auto_177936 ?auto_177937 ?auto_177938 ?auto_177939 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_177941 - BLOCK
      ?auto_177942 - BLOCK
      ?auto_177943 - BLOCK
      ?auto_177944 - BLOCK
      ?auto_177945 - BLOCK
      ?auto_177946 - BLOCK
      ?auto_177947 - BLOCK
      ?auto_177948 - BLOCK
    )
    :vars
    (
      ?auto_177949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177941 ) ( ON ?auto_177942 ?auto_177941 ) ( ON ?auto_177943 ?auto_177942 ) ( ON ?auto_177944 ?auto_177943 ) ( ON ?auto_177945 ?auto_177944 ) ( not ( = ?auto_177941 ?auto_177942 ) ) ( not ( = ?auto_177941 ?auto_177943 ) ) ( not ( = ?auto_177941 ?auto_177944 ) ) ( not ( = ?auto_177941 ?auto_177945 ) ) ( not ( = ?auto_177941 ?auto_177946 ) ) ( not ( = ?auto_177941 ?auto_177947 ) ) ( not ( = ?auto_177941 ?auto_177948 ) ) ( not ( = ?auto_177942 ?auto_177943 ) ) ( not ( = ?auto_177942 ?auto_177944 ) ) ( not ( = ?auto_177942 ?auto_177945 ) ) ( not ( = ?auto_177942 ?auto_177946 ) ) ( not ( = ?auto_177942 ?auto_177947 ) ) ( not ( = ?auto_177942 ?auto_177948 ) ) ( not ( = ?auto_177943 ?auto_177944 ) ) ( not ( = ?auto_177943 ?auto_177945 ) ) ( not ( = ?auto_177943 ?auto_177946 ) ) ( not ( = ?auto_177943 ?auto_177947 ) ) ( not ( = ?auto_177943 ?auto_177948 ) ) ( not ( = ?auto_177944 ?auto_177945 ) ) ( not ( = ?auto_177944 ?auto_177946 ) ) ( not ( = ?auto_177944 ?auto_177947 ) ) ( not ( = ?auto_177944 ?auto_177948 ) ) ( not ( = ?auto_177945 ?auto_177946 ) ) ( not ( = ?auto_177945 ?auto_177947 ) ) ( not ( = ?auto_177945 ?auto_177948 ) ) ( not ( = ?auto_177946 ?auto_177947 ) ) ( not ( = ?auto_177946 ?auto_177948 ) ) ( not ( = ?auto_177947 ?auto_177948 ) ) ( ON ?auto_177948 ?auto_177949 ) ( not ( = ?auto_177941 ?auto_177949 ) ) ( not ( = ?auto_177942 ?auto_177949 ) ) ( not ( = ?auto_177943 ?auto_177949 ) ) ( not ( = ?auto_177944 ?auto_177949 ) ) ( not ( = ?auto_177945 ?auto_177949 ) ) ( not ( = ?auto_177946 ?auto_177949 ) ) ( not ( = ?auto_177947 ?auto_177949 ) ) ( not ( = ?auto_177948 ?auto_177949 ) ) ( ON ?auto_177947 ?auto_177948 ) ( CLEAR ?auto_177947 ) ( ON-TABLE ?auto_177949 ) ( HOLDING ?auto_177946 ) ( CLEAR ?auto_177945 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177941 ?auto_177942 ?auto_177943 ?auto_177944 ?auto_177945 ?auto_177946 )
      ( MAKE-8PILE ?auto_177941 ?auto_177942 ?auto_177943 ?auto_177944 ?auto_177945 ?auto_177946 ?auto_177947 ?auto_177948 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_177950 - BLOCK
      ?auto_177951 - BLOCK
      ?auto_177952 - BLOCK
      ?auto_177953 - BLOCK
      ?auto_177954 - BLOCK
      ?auto_177955 - BLOCK
      ?auto_177956 - BLOCK
      ?auto_177957 - BLOCK
    )
    :vars
    (
      ?auto_177958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177950 ) ( ON ?auto_177951 ?auto_177950 ) ( ON ?auto_177952 ?auto_177951 ) ( ON ?auto_177953 ?auto_177952 ) ( ON ?auto_177954 ?auto_177953 ) ( not ( = ?auto_177950 ?auto_177951 ) ) ( not ( = ?auto_177950 ?auto_177952 ) ) ( not ( = ?auto_177950 ?auto_177953 ) ) ( not ( = ?auto_177950 ?auto_177954 ) ) ( not ( = ?auto_177950 ?auto_177955 ) ) ( not ( = ?auto_177950 ?auto_177956 ) ) ( not ( = ?auto_177950 ?auto_177957 ) ) ( not ( = ?auto_177951 ?auto_177952 ) ) ( not ( = ?auto_177951 ?auto_177953 ) ) ( not ( = ?auto_177951 ?auto_177954 ) ) ( not ( = ?auto_177951 ?auto_177955 ) ) ( not ( = ?auto_177951 ?auto_177956 ) ) ( not ( = ?auto_177951 ?auto_177957 ) ) ( not ( = ?auto_177952 ?auto_177953 ) ) ( not ( = ?auto_177952 ?auto_177954 ) ) ( not ( = ?auto_177952 ?auto_177955 ) ) ( not ( = ?auto_177952 ?auto_177956 ) ) ( not ( = ?auto_177952 ?auto_177957 ) ) ( not ( = ?auto_177953 ?auto_177954 ) ) ( not ( = ?auto_177953 ?auto_177955 ) ) ( not ( = ?auto_177953 ?auto_177956 ) ) ( not ( = ?auto_177953 ?auto_177957 ) ) ( not ( = ?auto_177954 ?auto_177955 ) ) ( not ( = ?auto_177954 ?auto_177956 ) ) ( not ( = ?auto_177954 ?auto_177957 ) ) ( not ( = ?auto_177955 ?auto_177956 ) ) ( not ( = ?auto_177955 ?auto_177957 ) ) ( not ( = ?auto_177956 ?auto_177957 ) ) ( ON ?auto_177957 ?auto_177958 ) ( not ( = ?auto_177950 ?auto_177958 ) ) ( not ( = ?auto_177951 ?auto_177958 ) ) ( not ( = ?auto_177952 ?auto_177958 ) ) ( not ( = ?auto_177953 ?auto_177958 ) ) ( not ( = ?auto_177954 ?auto_177958 ) ) ( not ( = ?auto_177955 ?auto_177958 ) ) ( not ( = ?auto_177956 ?auto_177958 ) ) ( not ( = ?auto_177957 ?auto_177958 ) ) ( ON ?auto_177956 ?auto_177957 ) ( ON-TABLE ?auto_177958 ) ( CLEAR ?auto_177954 ) ( ON ?auto_177955 ?auto_177956 ) ( CLEAR ?auto_177955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177958 ?auto_177957 ?auto_177956 )
      ( MAKE-8PILE ?auto_177950 ?auto_177951 ?auto_177952 ?auto_177953 ?auto_177954 ?auto_177955 ?auto_177956 ?auto_177957 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_177959 - BLOCK
      ?auto_177960 - BLOCK
      ?auto_177961 - BLOCK
      ?auto_177962 - BLOCK
      ?auto_177963 - BLOCK
      ?auto_177964 - BLOCK
      ?auto_177965 - BLOCK
      ?auto_177966 - BLOCK
    )
    :vars
    (
      ?auto_177967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177959 ) ( ON ?auto_177960 ?auto_177959 ) ( ON ?auto_177961 ?auto_177960 ) ( ON ?auto_177962 ?auto_177961 ) ( not ( = ?auto_177959 ?auto_177960 ) ) ( not ( = ?auto_177959 ?auto_177961 ) ) ( not ( = ?auto_177959 ?auto_177962 ) ) ( not ( = ?auto_177959 ?auto_177963 ) ) ( not ( = ?auto_177959 ?auto_177964 ) ) ( not ( = ?auto_177959 ?auto_177965 ) ) ( not ( = ?auto_177959 ?auto_177966 ) ) ( not ( = ?auto_177960 ?auto_177961 ) ) ( not ( = ?auto_177960 ?auto_177962 ) ) ( not ( = ?auto_177960 ?auto_177963 ) ) ( not ( = ?auto_177960 ?auto_177964 ) ) ( not ( = ?auto_177960 ?auto_177965 ) ) ( not ( = ?auto_177960 ?auto_177966 ) ) ( not ( = ?auto_177961 ?auto_177962 ) ) ( not ( = ?auto_177961 ?auto_177963 ) ) ( not ( = ?auto_177961 ?auto_177964 ) ) ( not ( = ?auto_177961 ?auto_177965 ) ) ( not ( = ?auto_177961 ?auto_177966 ) ) ( not ( = ?auto_177962 ?auto_177963 ) ) ( not ( = ?auto_177962 ?auto_177964 ) ) ( not ( = ?auto_177962 ?auto_177965 ) ) ( not ( = ?auto_177962 ?auto_177966 ) ) ( not ( = ?auto_177963 ?auto_177964 ) ) ( not ( = ?auto_177963 ?auto_177965 ) ) ( not ( = ?auto_177963 ?auto_177966 ) ) ( not ( = ?auto_177964 ?auto_177965 ) ) ( not ( = ?auto_177964 ?auto_177966 ) ) ( not ( = ?auto_177965 ?auto_177966 ) ) ( ON ?auto_177966 ?auto_177967 ) ( not ( = ?auto_177959 ?auto_177967 ) ) ( not ( = ?auto_177960 ?auto_177967 ) ) ( not ( = ?auto_177961 ?auto_177967 ) ) ( not ( = ?auto_177962 ?auto_177967 ) ) ( not ( = ?auto_177963 ?auto_177967 ) ) ( not ( = ?auto_177964 ?auto_177967 ) ) ( not ( = ?auto_177965 ?auto_177967 ) ) ( not ( = ?auto_177966 ?auto_177967 ) ) ( ON ?auto_177965 ?auto_177966 ) ( ON-TABLE ?auto_177967 ) ( ON ?auto_177964 ?auto_177965 ) ( CLEAR ?auto_177964 ) ( HOLDING ?auto_177963 ) ( CLEAR ?auto_177962 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177959 ?auto_177960 ?auto_177961 ?auto_177962 ?auto_177963 )
      ( MAKE-8PILE ?auto_177959 ?auto_177960 ?auto_177961 ?auto_177962 ?auto_177963 ?auto_177964 ?auto_177965 ?auto_177966 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_177968 - BLOCK
      ?auto_177969 - BLOCK
      ?auto_177970 - BLOCK
      ?auto_177971 - BLOCK
      ?auto_177972 - BLOCK
      ?auto_177973 - BLOCK
      ?auto_177974 - BLOCK
      ?auto_177975 - BLOCK
    )
    :vars
    (
      ?auto_177976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177968 ) ( ON ?auto_177969 ?auto_177968 ) ( ON ?auto_177970 ?auto_177969 ) ( ON ?auto_177971 ?auto_177970 ) ( not ( = ?auto_177968 ?auto_177969 ) ) ( not ( = ?auto_177968 ?auto_177970 ) ) ( not ( = ?auto_177968 ?auto_177971 ) ) ( not ( = ?auto_177968 ?auto_177972 ) ) ( not ( = ?auto_177968 ?auto_177973 ) ) ( not ( = ?auto_177968 ?auto_177974 ) ) ( not ( = ?auto_177968 ?auto_177975 ) ) ( not ( = ?auto_177969 ?auto_177970 ) ) ( not ( = ?auto_177969 ?auto_177971 ) ) ( not ( = ?auto_177969 ?auto_177972 ) ) ( not ( = ?auto_177969 ?auto_177973 ) ) ( not ( = ?auto_177969 ?auto_177974 ) ) ( not ( = ?auto_177969 ?auto_177975 ) ) ( not ( = ?auto_177970 ?auto_177971 ) ) ( not ( = ?auto_177970 ?auto_177972 ) ) ( not ( = ?auto_177970 ?auto_177973 ) ) ( not ( = ?auto_177970 ?auto_177974 ) ) ( not ( = ?auto_177970 ?auto_177975 ) ) ( not ( = ?auto_177971 ?auto_177972 ) ) ( not ( = ?auto_177971 ?auto_177973 ) ) ( not ( = ?auto_177971 ?auto_177974 ) ) ( not ( = ?auto_177971 ?auto_177975 ) ) ( not ( = ?auto_177972 ?auto_177973 ) ) ( not ( = ?auto_177972 ?auto_177974 ) ) ( not ( = ?auto_177972 ?auto_177975 ) ) ( not ( = ?auto_177973 ?auto_177974 ) ) ( not ( = ?auto_177973 ?auto_177975 ) ) ( not ( = ?auto_177974 ?auto_177975 ) ) ( ON ?auto_177975 ?auto_177976 ) ( not ( = ?auto_177968 ?auto_177976 ) ) ( not ( = ?auto_177969 ?auto_177976 ) ) ( not ( = ?auto_177970 ?auto_177976 ) ) ( not ( = ?auto_177971 ?auto_177976 ) ) ( not ( = ?auto_177972 ?auto_177976 ) ) ( not ( = ?auto_177973 ?auto_177976 ) ) ( not ( = ?auto_177974 ?auto_177976 ) ) ( not ( = ?auto_177975 ?auto_177976 ) ) ( ON ?auto_177974 ?auto_177975 ) ( ON-TABLE ?auto_177976 ) ( ON ?auto_177973 ?auto_177974 ) ( CLEAR ?auto_177971 ) ( ON ?auto_177972 ?auto_177973 ) ( CLEAR ?auto_177972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177976 ?auto_177975 ?auto_177974 ?auto_177973 )
      ( MAKE-8PILE ?auto_177968 ?auto_177969 ?auto_177970 ?auto_177971 ?auto_177972 ?auto_177973 ?auto_177974 ?auto_177975 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_177977 - BLOCK
      ?auto_177978 - BLOCK
      ?auto_177979 - BLOCK
      ?auto_177980 - BLOCK
      ?auto_177981 - BLOCK
      ?auto_177982 - BLOCK
      ?auto_177983 - BLOCK
      ?auto_177984 - BLOCK
    )
    :vars
    (
      ?auto_177985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177977 ) ( ON ?auto_177978 ?auto_177977 ) ( ON ?auto_177979 ?auto_177978 ) ( not ( = ?auto_177977 ?auto_177978 ) ) ( not ( = ?auto_177977 ?auto_177979 ) ) ( not ( = ?auto_177977 ?auto_177980 ) ) ( not ( = ?auto_177977 ?auto_177981 ) ) ( not ( = ?auto_177977 ?auto_177982 ) ) ( not ( = ?auto_177977 ?auto_177983 ) ) ( not ( = ?auto_177977 ?auto_177984 ) ) ( not ( = ?auto_177978 ?auto_177979 ) ) ( not ( = ?auto_177978 ?auto_177980 ) ) ( not ( = ?auto_177978 ?auto_177981 ) ) ( not ( = ?auto_177978 ?auto_177982 ) ) ( not ( = ?auto_177978 ?auto_177983 ) ) ( not ( = ?auto_177978 ?auto_177984 ) ) ( not ( = ?auto_177979 ?auto_177980 ) ) ( not ( = ?auto_177979 ?auto_177981 ) ) ( not ( = ?auto_177979 ?auto_177982 ) ) ( not ( = ?auto_177979 ?auto_177983 ) ) ( not ( = ?auto_177979 ?auto_177984 ) ) ( not ( = ?auto_177980 ?auto_177981 ) ) ( not ( = ?auto_177980 ?auto_177982 ) ) ( not ( = ?auto_177980 ?auto_177983 ) ) ( not ( = ?auto_177980 ?auto_177984 ) ) ( not ( = ?auto_177981 ?auto_177982 ) ) ( not ( = ?auto_177981 ?auto_177983 ) ) ( not ( = ?auto_177981 ?auto_177984 ) ) ( not ( = ?auto_177982 ?auto_177983 ) ) ( not ( = ?auto_177982 ?auto_177984 ) ) ( not ( = ?auto_177983 ?auto_177984 ) ) ( ON ?auto_177984 ?auto_177985 ) ( not ( = ?auto_177977 ?auto_177985 ) ) ( not ( = ?auto_177978 ?auto_177985 ) ) ( not ( = ?auto_177979 ?auto_177985 ) ) ( not ( = ?auto_177980 ?auto_177985 ) ) ( not ( = ?auto_177981 ?auto_177985 ) ) ( not ( = ?auto_177982 ?auto_177985 ) ) ( not ( = ?auto_177983 ?auto_177985 ) ) ( not ( = ?auto_177984 ?auto_177985 ) ) ( ON ?auto_177983 ?auto_177984 ) ( ON-TABLE ?auto_177985 ) ( ON ?auto_177982 ?auto_177983 ) ( ON ?auto_177981 ?auto_177982 ) ( CLEAR ?auto_177981 ) ( HOLDING ?auto_177980 ) ( CLEAR ?auto_177979 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177977 ?auto_177978 ?auto_177979 ?auto_177980 )
      ( MAKE-8PILE ?auto_177977 ?auto_177978 ?auto_177979 ?auto_177980 ?auto_177981 ?auto_177982 ?auto_177983 ?auto_177984 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_177986 - BLOCK
      ?auto_177987 - BLOCK
      ?auto_177988 - BLOCK
      ?auto_177989 - BLOCK
      ?auto_177990 - BLOCK
      ?auto_177991 - BLOCK
      ?auto_177992 - BLOCK
      ?auto_177993 - BLOCK
    )
    :vars
    (
      ?auto_177994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177986 ) ( ON ?auto_177987 ?auto_177986 ) ( ON ?auto_177988 ?auto_177987 ) ( not ( = ?auto_177986 ?auto_177987 ) ) ( not ( = ?auto_177986 ?auto_177988 ) ) ( not ( = ?auto_177986 ?auto_177989 ) ) ( not ( = ?auto_177986 ?auto_177990 ) ) ( not ( = ?auto_177986 ?auto_177991 ) ) ( not ( = ?auto_177986 ?auto_177992 ) ) ( not ( = ?auto_177986 ?auto_177993 ) ) ( not ( = ?auto_177987 ?auto_177988 ) ) ( not ( = ?auto_177987 ?auto_177989 ) ) ( not ( = ?auto_177987 ?auto_177990 ) ) ( not ( = ?auto_177987 ?auto_177991 ) ) ( not ( = ?auto_177987 ?auto_177992 ) ) ( not ( = ?auto_177987 ?auto_177993 ) ) ( not ( = ?auto_177988 ?auto_177989 ) ) ( not ( = ?auto_177988 ?auto_177990 ) ) ( not ( = ?auto_177988 ?auto_177991 ) ) ( not ( = ?auto_177988 ?auto_177992 ) ) ( not ( = ?auto_177988 ?auto_177993 ) ) ( not ( = ?auto_177989 ?auto_177990 ) ) ( not ( = ?auto_177989 ?auto_177991 ) ) ( not ( = ?auto_177989 ?auto_177992 ) ) ( not ( = ?auto_177989 ?auto_177993 ) ) ( not ( = ?auto_177990 ?auto_177991 ) ) ( not ( = ?auto_177990 ?auto_177992 ) ) ( not ( = ?auto_177990 ?auto_177993 ) ) ( not ( = ?auto_177991 ?auto_177992 ) ) ( not ( = ?auto_177991 ?auto_177993 ) ) ( not ( = ?auto_177992 ?auto_177993 ) ) ( ON ?auto_177993 ?auto_177994 ) ( not ( = ?auto_177986 ?auto_177994 ) ) ( not ( = ?auto_177987 ?auto_177994 ) ) ( not ( = ?auto_177988 ?auto_177994 ) ) ( not ( = ?auto_177989 ?auto_177994 ) ) ( not ( = ?auto_177990 ?auto_177994 ) ) ( not ( = ?auto_177991 ?auto_177994 ) ) ( not ( = ?auto_177992 ?auto_177994 ) ) ( not ( = ?auto_177993 ?auto_177994 ) ) ( ON ?auto_177992 ?auto_177993 ) ( ON-TABLE ?auto_177994 ) ( ON ?auto_177991 ?auto_177992 ) ( ON ?auto_177990 ?auto_177991 ) ( CLEAR ?auto_177988 ) ( ON ?auto_177989 ?auto_177990 ) ( CLEAR ?auto_177989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177994 ?auto_177993 ?auto_177992 ?auto_177991 ?auto_177990 )
      ( MAKE-8PILE ?auto_177986 ?auto_177987 ?auto_177988 ?auto_177989 ?auto_177990 ?auto_177991 ?auto_177992 ?auto_177993 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_177995 - BLOCK
      ?auto_177996 - BLOCK
      ?auto_177997 - BLOCK
      ?auto_177998 - BLOCK
      ?auto_177999 - BLOCK
      ?auto_178000 - BLOCK
      ?auto_178001 - BLOCK
      ?auto_178002 - BLOCK
    )
    :vars
    (
      ?auto_178003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177995 ) ( ON ?auto_177996 ?auto_177995 ) ( not ( = ?auto_177995 ?auto_177996 ) ) ( not ( = ?auto_177995 ?auto_177997 ) ) ( not ( = ?auto_177995 ?auto_177998 ) ) ( not ( = ?auto_177995 ?auto_177999 ) ) ( not ( = ?auto_177995 ?auto_178000 ) ) ( not ( = ?auto_177995 ?auto_178001 ) ) ( not ( = ?auto_177995 ?auto_178002 ) ) ( not ( = ?auto_177996 ?auto_177997 ) ) ( not ( = ?auto_177996 ?auto_177998 ) ) ( not ( = ?auto_177996 ?auto_177999 ) ) ( not ( = ?auto_177996 ?auto_178000 ) ) ( not ( = ?auto_177996 ?auto_178001 ) ) ( not ( = ?auto_177996 ?auto_178002 ) ) ( not ( = ?auto_177997 ?auto_177998 ) ) ( not ( = ?auto_177997 ?auto_177999 ) ) ( not ( = ?auto_177997 ?auto_178000 ) ) ( not ( = ?auto_177997 ?auto_178001 ) ) ( not ( = ?auto_177997 ?auto_178002 ) ) ( not ( = ?auto_177998 ?auto_177999 ) ) ( not ( = ?auto_177998 ?auto_178000 ) ) ( not ( = ?auto_177998 ?auto_178001 ) ) ( not ( = ?auto_177998 ?auto_178002 ) ) ( not ( = ?auto_177999 ?auto_178000 ) ) ( not ( = ?auto_177999 ?auto_178001 ) ) ( not ( = ?auto_177999 ?auto_178002 ) ) ( not ( = ?auto_178000 ?auto_178001 ) ) ( not ( = ?auto_178000 ?auto_178002 ) ) ( not ( = ?auto_178001 ?auto_178002 ) ) ( ON ?auto_178002 ?auto_178003 ) ( not ( = ?auto_177995 ?auto_178003 ) ) ( not ( = ?auto_177996 ?auto_178003 ) ) ( not ( = ?auto_177997 ?auto_178003 ) ) ( not ( = ?auto_177998 ?auto_178003 ) ) ( not ( = ?auto_177999 ?auto_178003 ) ) ( not ( = ?auto_178000 ?auto_178003 ) ) ( not ( = ?auto_178001 ?auto_178003 ) ) ( not ( = ?auto_178002 ?auto_178003 ) ) ( ON ?auto_178001 ?auto_178002 ) ( ON-TABLE ?auto_178003 ) ( ON ?auto_178000 ?auto_178001 ) ( ON ?auto_177999 ?auto_178000 ) ( ON ?auto_177998 ?auto_177999 ) ( CLEAR ?auto_177998 ) ( HOLDING ?auto_177997 ) ( CLEAR ?auto_177996 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177995 ?auto_177996 ?auto_177997 )
      ( MAKE-8PILE ?auto_177995 ?auto_177996 ?auto_177997 ?auto_177998 ?auto_177999 ?auto_178000 ?auto_178001 ?auto_178002 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178004 - BLOCK
      ?auto_178005 - BLOCK
      ?auto_178006 - BLOCK
      ?auto_178007 - BLOCK
      ?auto_178008 - BLOCK
      ?auto_178009 - BLOCK
      ?auto_178010 - BLOCK
      ?auto_178011 - BLOCK
    )
    :vars
    (
      ?auto_178012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178004 ) ( ON ?auto_178005 ?auto_178004 ) ( not ( = ?auto_178004 ?auto_178005 ) ) ( not ( = ?auto_178004 ?auto_178006 ) ) ( not ( = ?auto_178004 ?auto_178007 ) ) ( not ( = ?auto_178004 ?auto_178008 ) ) ( not ( = ?auto_178004 ?auto_178009 ) ) ( not ( = ?auto_178004 ?auto_178010 ) ) ( not ( = ?auto_178004 ?auto_178011 ) ) ( not ( = ?auto_178005 ?auto_178006 ) ) ( not ( = ?auto_178005 ?auto_178007 ) ) ( not ( = ?auto_178005 ?auto_178008 ) ) ( not ( = ?auto_178005 ?auto_178009 ) ) ( not ( = ?auto_178005 ?auto_178010 ) ) ( not ( = ?auto_178005 ?auto_178011 ) ) ( not ( = ?auto_178006 ?auto_178007 ) ) ( not ( = ?auto_178006 ?auto_178008 ) ) ( not ( = ?auto_178006 ?auto_178009 ) ) ( not ( = ?auto_178006 ?auto_178010 ) ) ( not ( = ?auto_178006 ?auto_178011 ) ) ( not ( = ?auto_178007 ?auto_178008 ) ) ( not ( = ?auto_178007 ?auto_178009 ) ) ( not ( = ?auto_178007 ?auto_178010 ) ) ( not ( = ?auto_178007 ?auto_178011 ) ) ( not ( = ?auto_178008 ?auto_178009 ) ) ( not ( = ?auto_178008 ?auto_178010 ) ) ( not ( = ?auto_178008 ?auto_178011 ) ) ( not ( = ?auto_178009 ?auto_178010 ) ) ( not ( = ?auto_178009 ?auto_178011 ) ) ( not ( = ?auto_178010 ?auto_178011 ) ) ( ON ?auto_178011 ?auto_178012 ) ( not ( = ?auto_178004 ?auto_178012 ) ) ( not ( = ?auto_178005 ?auto_178012 ) ) ( not ( = ?auto_178006 ?auto_178012 ) ) ( not ( = ?auto_178007 ?auto_178012 ) ) ( not ( = ?auto_178008 ?auto_178012 ) ) ( not ( = ?auto_178009 ?auto_178012 ) ) ( not ( = ?auto_178010 ?auto_178012 ) ) ( not ( = ?auto_178011 ?auto_178012 ) ) ( ON ?auto_178010 ?auto_178011 ) ( ON-TABLE ?auto_178012 ) ( ON ?auto_178009 ?auto_178010 ) ( ON ?auto_178008 ?auto_178009 ) ( ON ?auto_178007 ?auto_178008 ) ( CLEAR ?auto_178005 ) ( ON ?auto_178006 ?auto_178007 ) ( CLEAR ?auto_178006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178012 ?auto_178011 ?auto_178010 ?auto_178009 ?auto_178008 ?auto_178007 )
      ( MAKE-8PILE ?auto_178004 ?auto_178005 ?auto_178006 ?auto_178007 ?auto_178008 ?auto_178009 ?auto_178010 ?auto_178011 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178013 - BLOCK
      ?auto_178014 - BLOCK
      ?auto_178015 - BLOCK
      ?auto_178016 - BLOCK
      ?auto_178017 - BLOCK
      ?auto_178018 - BLOCK
      ?auto_178019 - BLOCK
      ?auto_178020 - BLOCK
    )
    :vars
    (
      ?auto_178021 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178013 ) ( not ( = ?auto_178013 ?auto_178014 ) ) ( not ( = ?auto_178013 ?auto_178015 ) ) ( not ( = ?auto_178013 ?auto_178016 ) ) ( not ( = ?auto_178013 ?auto_178017 ) ) ( not ( = ?auto_178013 ?auto_178018 ) ) ( not ( = ?auto_178013 ?auto_178019 ) ) ( not ( = ?auto_178013 ?auto_178020 ) ) ( not ( = ?auto_178014 ?auto_178015 ) ) ( not ( = ?auto_178014 ?auto_178016 ) ) ( not ( = ?auto_178014 ?auto_178017 ) ) ( not ( = ?auto_178014 ?auto_178018 ) ) ( not ( = ?auto_178014 ?auto_178019 ) ) ( not ( = ?auto_178014 ?auto_178020 ) ) ( not ( = ?auto_178015 ?auto_178016 ) ) ( not ( = ?auto_178015 ?auto_178017 ) ) ( not ( = ?auto_178015 ?auto_178018 ) ) ( not ( = ?auto_178015 ?auto_178019 ) ) ( not ( = ?auto_178015 ?auto_178020 ) ) ( not ( = ?auto_178016 ?auto_178017 ) ) ( not ( = ?auto_178016 ?auto_178018 ) ) ( not ( = ?auto_178016 ?auto_178019 ) ) ( not ( = ?auto_178016 ?auto_178020 ) ) ( not ( = ?auto_178017 ?auto_178018 ) ) ( not ( = ?auto_178017 ?auto_178019 ) ) ( not ( = ?auto_178017 ?auto_178020 ) ) ( not ( = ?auto_178018 ?auto_178019 ) ) ( not ( = ?auto_178018 ?auto_178020 ) ) ( not ( = ?auto_178019 ?auto_178020 ) ) ( ON ?auto_178020 ?auto_178021 ) ( not ( = ?auto_178013 ?auto_178021 ) ) ( not ( = ?auto_178014 ?auto_178021 ) ) ( not ( = ?auto_178015 ?auto_178021 ) ) ( not ( = ?auto_178016 ?auto_178021 ) ) ( not ( = ?auto_178017 ?auto_178021 ) ) ( not ( = ?auto_178018 ?auto_178021 ) ) ( not ( = ?auto_178019 ?auto_178021 ) ) ( not ( = ?auto_178020 ?auto_178021 ) ) ( ON ?auto_178019 ?auto_178020 ) ( ON-TABLE ?auto_178021 ) ( ON ?auto_178018 ?auto_178019 ) ( ON ?auto_178017 ?auto_178018 ) ( ON ?auto_178016 ?auto_178017 ) ( ON ?auto_178015 ?auto_178016 ) ( CLEAR ?auto_178015 ) ( HOLDING ?auto_178014 ) ( CLEAR ?auto_178013 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178013 ?auto_178014 )
      ( MAKE-8PILE ?auto_178013 ?auto_178014 ?auto_178015 ?auto_178016 ?auto_178017 ?auto_178018 ?auto_178019 ?auto_178020 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178022 - BLOCK
      ?auto_178023 - BLOCK
      ?auto_178024 - BLOCK
      ?auto_178025 - BLOCK
      ?auto_178026 - BLOCK
      ?auto_178027 - BLOCK
      ?auto_178028 - BLOCK
      ?auto_178029 - BLOCK
    )
    :vars
    (
      ?auto_178030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178022 ) ( not ( = ?auto_178022 ?auto_178023 ) ) ( not ( = ?auto_178022 ?auto_178024 ) ) ( not ( = ?auto_178022 ?auto_178025 ) ) ( not ( = ?auto_178022 ?auto_178026 ) ) ( not ( = ?auto_178022 ?auto_178027 ) ) ( not ( = ?auto_178022 ?auto_178028 ) ) ( not ( = ?auto_178022 ?auto_178029 ) ) ( not ( = ?auto_178023 ?auto_178024 ) ) ( not ( = ?auto_178023 ?auto_178025 ) ) ( not ( = ?auto_178023 ?auto_178026 ) ) ( not ( = ?auto_178023 ?auto_178027 ) ) ( not ( = ?auto_178023 ?auto_178028 ) ) ( not ( = ?auto_178023 ?auto_178029 ) ) ( not ( = ?auto_178024 ?auto_178025 ) ) ( not ( = ?auto_178024 ?auto_178026 ) ) ( not ( = ?auto_178024 ?auto_178027 ) ) ( not ( = ?auto_178024 ?auto_178028 ) ) ( not ( = ?auto_178024 ?auto_178029 ) ) ( not ( = ?auto_178025 ?auto_178026 ) ) ( not ( = ?auto_178025 ?auto_178027 ) ) ( not ( = ?auto_178025 ?auto_178028 ) ) ( not ( = ?auto_178025 ?auto_178029 ) ) ( not ( = ?auto_178026 ?auto_178027 ) ) ( not ( = ?auto_178026 ?auto_178028 ) ) ( not ( = ?auto_178026 ?auto_178029 ) ) ( not ( = ?auto_178027 ?auto_178028 ) ) ( not ( = ?auto_178027 ?auto_178029 ) ) ( not ( = ?auto_178028 ?auto_178029 ) ) ( ON ?auto_178029 ?auto_178030 ) ( not ( = ?auto_178022 ?auto_178030 ) ) ( not ( = ?auto_178023 ?auto_178030 ) ) ( not ( = ?auto_178024 ?auto_178030 ) ) ( not ( = ?auto_178025 ?auto_178030 ) ) ( not ( = ?auto_178026 ?auto_178030 ) ) ( not ( = ?auto_178027 ?auto_178030 ) ) ( not ( = ?auto_178028 ?auto_178030 ) ) ( not ( = ?auto_178029 ?auto_178030 ) ) ( ON ?auto_178028 ?auto_178029 ) ( ON-TABLE ?auto_178030 ) ( ON ?auto_178027 ?auto_178028 ) ( ON ?auto_178026 ?auto_178027 ) ( ON ?auto_178025 ?auto_178026 ) ( ON ?auto_178024 ?auto_178025 ) ( CLEAR ?auto_178022 ) ( ON ?auto_178023 ?auto_178024 ) ( CLEAR ?auto_178023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178030 ?auto_178029 ?auto_178028 ?auto_178027 ?auto_178026 ?auto_178025 ?auto_178024 )
      ( MAKE-8PILE ?auto_178022 ?auto_178023 ?auto_178024 ?auto_178025 ?auto_178026 ?auto_178027 ?auto_178028 ?auto_178029 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178031 - BLOCK
      ?auto_178032 - BLOCK
      ?auto_178033 - BLOCK
      ?auto_178034 - BLOCK
      ?auto_178035 - BLOCK
      ?auto_178036 - BLOCK
      ?auto_178037 - BLOCK
      ?auto_178038 - BLOCK
    )
    :vars
    (
      ?auto_178039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178031 ?auto_178032 ) ) ( not ( = ?auto_178031 ?auto_178033 ) ) ( not ( = ?auto_178031 ?auto_178034 ) ) ( not ( = ?auto_178031 ?auto_178035 ) ) ( not ( = ?auto_178031 ?auto_178036 ) ) ( not ( = ?auto_178031 ?auto_178037 ) ) ( not ( = ?auto_178031 ?auto_178038 ) ) ( not ( = ?auto_178032 ?auto_178033 ) ) ( not ( = ?auto_178032 ?auto_178034 ) ) ( not ( = ?auto_178032 ?auto_178035 ) ) ( not ( = ?auto_178032 ?auto_178036 ) ) ( not ( = ?auto_178032 ?auto_178037 ) ) ( not ( = ?auto_178032 ?auto_178038 ) ) ( not ( = ?auto_178033 ?auto_178034 ) ) ( not ( = ?auto_178033 ?auto_178035 ) ) ( not ( = ?auto_178033 ?auto_178036 ) ) ( not ( = ?auto_178033 ?auto_178037 ) ) ( not ( = ?auto_178033 ?auto_178038 ) ) ( not ( = ?auto_178034 ?auto_178035 ) ) ( not ( = ?auto_178034 ?auto_178036 ) ) ( not ( = ?auto_178034 ?auto_178037 ) ) ( not ( = ?auto_178034 ?auto_178038 ) ) ( not ( = ?auto_178035 ?auto_178036 ) ) ( not ( = ?auto_178035 ?auto_178037 ) ) ( not ( = ?auto_178035 ?auto_178038 ) ) ( not ( = ?auto_178036 ?auto_178037 ) ) ( not ( = ?auto_178036 ?auto_178038 ) ) ( not ( = ?auto_178037 ?auto_178038 ) ) ( ON ?auto_178038 ?auto_178039 ) ( not ( = ?auto_178031 ?auto_178039 ) ) ( not ( = ?auto_178032 ?auto_178039 ) ) ( not ( = ?auto_178033 ?auto_178039 ) ) ( not ( = ?auto_178034 ?auto_178039 ) ) ( not ( = ?auto_178035 ?auto_178039 ) ) ( not ( = ?auto_178036 ?auto_178039 ) ) ( not ( = ?auto_178037 ?auto_178039 ) ) ( not ( = ?auto_178038 ?auto_178039 ) ) ( ON ?auto_178037 ?auto_178038 ) ( ON-TABLE ?auto_178039 ) ( ON ?auto_178036 ?auto_178037 ) ( ON ?auto_178035 ?auto_178036 ) ( ON ?auto_178034 ?auto_178035 ) ( ON ?auto_178033 ?auto_178034 ) ( ON ?auto_178032 ?auto_178033 ) ( CLEAR ?auto_178032 ) ( HOLDING ?auto_178031 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178031 )
      ( MAKE-8PILE ?auto_178031 ?auto_178032 ?auto_178033 ?auto_178034 ?auto_178035 ?auto_178036 ?auto_178037 ?auto_178038 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178040 - BLOCK
      ?auto_178041 - BLOCK
      ?auto_178042 - BLOCK
      ?auto_178043 - BLOCK
      ?auto_178044 - BLOCK
      ?auto_178045 - BLOCK
      ?auto_178046 - BLOCK
      ?auto_178047 - BLOCK
    )
    :vars
    (
      ?auto_178048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178040 ?auto_178041 ) ) ( not ( = ?auto_178040 ?auto_178042 ) ) ( not ( = ?auto_178040 ?auto_178043 ) ) ( not ( = ?auto_178040 ?auto_178044 ) ) ( not ( = ?auto_178040 ?auto_178045 ) ) ( not ( = ?auto_178040 ?auto_178046 ) ) ( not ( = ?auto_178040 ?auto_178047 ) ) ( not ( = ?auto_178041 ?auto_178042 ) ) ( not ( = ?auto_178041 ?auto_178043 ) ) ( not ( = ?auto_178041 ?auto_178044 ) ) ( not ( = ?auto_178041 ?auto_178045 ) ) ( not ( = ?auto_178041 ?auto_178046 ) ) ( not ( = ?auto_178041 ?auto_178047 ) ) ( not ( = ?auto_178042 ?auto_178043 ) ) ( not ( = ?auto_178042 ?auto_178044 ) ) ( not ( = ?auto_178042 ?auto_178045 ) ) ( not ( = ?auto_178042 ?auto_178046 ) ) ( not ( = ?auto_178042 ?auto_178047 ) ) ( not ( = ?auto_178043 ?auto_178044 ) ) ( not ( = ?auto_178043 ?auto_178045 ) ) ( not ( = ?auto_178043 ?auto_178046 ) ) ( not ( = ?auto_178043 ?auto_178047 ) ) ( not ( = ?auto_178044 ?auto_178045 ) ) ( not ( = ?auto_178044 ?auto_178046 ) ) ( not ( = ?auto_178044 ?auto_178047 ) ) ( not ( = ?auto_178045 ?auto_178046 ) ) ( not ( = ?auto_178045 ?auto_178047 ) ) ( not ( = ?auto_178046 ?auto_178047 ) ) ( ON ?auto_178047 ?auto_178048 ) ( not ( = ?auto_178040 ?auto_178048 ) ) ( not ( = ?auto_178041 ?auto_178048 ) ) ( not ( = ?auto_178042 ?auto_178048 ) ) ( not ( = ?auto_178043 ?auto_178048 ) ) ( not ( = ?auto_178044 ?auto_178048 ) ) ( not ( = ?auto_178045 ?auto_178048 ) ) ( not ( = ?auto_178046 ?auto_178048 ) ) ( not ( = ?auto_178047 ?auto_178048 ) ) ( ON ?auto_178046 ?auto_178047 ) ( ON-TABLE ?auto_178048 ) ( ON ?auto_178045 ?auto_178046 ) ( ON ?auto_178044 ?auto_178045 ) ( ON ?auto_178043 ?auto_178044 ) ( ON ?auto_178042 ?auto_178043 ) ( ON ?auto_178041 ?auto_178042 ) ( ON ?auto_178040 ?auto_178041 ) ( CLEAR ?auto_178040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178048 ?auto_178047 ?auto_178046 ?auto_178045 ?auto_178044 ?auto_178043 ?auto_178042 ?auto_178041 )
      ( MAKE-8PILE ?auto_178040 ?auto_178041 ?auto_178042 ?auto_178043 ?auto_178044 ?auto_178045 ?auto_178046 ?auto_178047 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178185 - BLOCK
    )
    :vars
    (
      ?auto_178186 - BLOCK
      ?auto_178187 - BLOCK
      ?auto_178188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178185 ?auto_178186 ) ( CLEAR ?auto_178185 ) ( not ( = ?auto_178185 ?auto_178186 ) ) ( HOLDING ?auto_178187 ) ( CLEAR ?auto_178188 ) ( not ( = ?auto_178185 ?auto_178187 ) ) ( not ( = ?auto_178185 ?auto_178188 ) ) ( not ( = ?auto_178186 ?auto_178187 ) ) ( not ( = ?auto_178186 ?auto_178188 ) ) ( not ( = ?auto_178187 ?auto_178188 ) ) )
    :subtasks
    ( ( !STACK ?auto_178187 ?auto_178188 )
      ( MAKE-1PILE ?auto_178185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178189 - BLOCK
    )
    :vars
    (
      ?auto_178192 - BLOCK
      ?auto_178191 - BLOCK
      ?auto_178190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178189 ?auto_178192 ) ( not ( = ?auto_178189 ?auto_178192 ) ) ( CLEAR ?auto_178191 ) ( not ( = ?auto_178189 ?auto_178190 ) ) ( not ( = ?auto_178189 ?auto_178191 ) ) ( not ( = ?auto_178192 ?auto_178190 ) ) ( not ( = ?auto_178192 ?auto_178191 ) ) ( not ( = ?auto_178190 ?auto_178191 ) ) ( ON ?auto_178190 ?auto_178189 ) ( CLEAR ?auto_178190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178192 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178192 ?auto_178189 )
      ( MAKE-1PILE ?auto_178189 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178193 - BLOCK
    )
    :vars
    (
      ?auto_178196 - BLOCK
      ?auto_178194 - BLOCK
      ?auto_178195 - BLOCK
      ?auto_178197 - BLOCK
      ?auto_178200 - BLOCK
      ?auto_178201 - BLOCK
      ?auto_178198 - BLOCK
      ?auto_178199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178193 ?auto_178196 ) ( not ( = ?auto_178193 ?auto_178196 ) ) ( not ( = ?auto_178193 ?auto_178194 ) ) ( not ( = ?auto_178193 ?auto_178195 ) ) ( not ( = ?auto_178196 ?auto_178194 ) ) ( not ( = ?auto_178196 ?auto_178195 ) ) ( not ( = ?auto_178194 ?auto_178195 ) ) ( ON ?auto_178194 ?auto_178193 ) ( CLEAR ?auto_178194 ) ( ON-TABLE ?auto_178196 ) ( HOLDING ?auto_178195 ) ( CLEAR ?auto_178197 ) ( ON-TABLE ?auto_178200 ) ( ON ?auto_178201 ?auto_178200 ) ( ON ?auto_178198 ?auto_178201 ) ( ON ?auto_178199 ?auto_178198 ) ( ON ?auto_178197 ?auto_178199 ) ( not ( = ?auto_178200 ?auto_178201 ) ) ( not ( = ?auto_178200 ?auto_178198 ) ) ( not ( = ?auto_178200 ?auto_178199 ) ) ( not ( = ?auto_178200 ?auto_178197 ) ) ( not ( = ?auto_178200 ?auto_178195 ) ) ( not ( = ?auto_178201 ?auto_178198 ) ) ( not ( = ?auto_178201 ?auto_178199 ) ) ( not ( = ?auto_178201 ?auto_178197 ) ) ( not ( = ?auto_178201 ?auto_178195 ) ) ( not ( = ?auto_178198 ?auto_178199 ) ) ( not ( = ?auto_178198 ?auto_178197 ) ) ( not ( = ?auto_178198 ?auto_178195 ) ) ( not ( = ?auto_178199 ?auto_178197 ) ) ( not ( = ?auto_178199 ?auto_178195 ) ) ( not ( = ?auto_178197 ?auto_178195 ) ) ( not ( = ?auto_178193 ?auto_178197 ) ) ( not ( = ?auto_178193 ?auto_178200 ) ) ( not ( = ?auto_178193 ?auto_178201 ) ) ( not ( = ?auto_178193 ?auto_178198 ) ) ( not ( = ?auto_178193 ?auto_178199 ) ) ( not ( = ?auto_178196 ?auto_178197 ) ) ( not ( = ?auto_178196 ?auto_178200 ) ) ( not ( = ?auto_178196 ?auto_178201 ) ) ( not ( = ?auto_178196 ?auto_178198 ) ) ( not ( = ?auto_178196 ?auto_178199 ) ) ( not ( = ?auto_178194 ?auto_178197 ) ) ( not ( = ?auto_178194 ?auto_178200 ) ) ( not ( = ?auto_178194 ?auto_178201 ) ) ( not ( = ?auto_178194 ?auto_178198 ) ) ( not ( = ?auto_178194 ?auto_178199 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178200 ?auto_178201 ?auto_178198 ?auto_178199 ?auto_178197 ?auto_178195 )
      ( MAKE-1PILE ?auto_178193 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178202 - BLOCK
    )
    :vars
    (
      ?auto_178210 - BLOCK
      ?auto_178203 - BLOCK
      ?auto_178207 - BLOCK
      ?auto_178204 - BLOCK
      ?auto_178206 - BLOCK
      ?auto_178208 - BLOCK
      ?auto_178205 - BLOCK
      ?auto_178209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178202 ?auto_178210 ) ( not ( = ?auto_178202 ?auto_178210 ) ) ( not ( = ?auto_178202 ?auto_178203 ) ) ( not ( = ?auto_178202 ?auto_178207 ) ) ( not ( = ?auto_178210 ?auto_178203 ) ) ( not ( = ?auto_178210 ?auto_178207 ) ) ( not ( = ?auto_178203 ?auto_178207 ) ) ( ON ?auto_178203 ?auto_178202 ) ( ON-TABLE ?auto_178210 ) ( CLEAR ?auto_178204 ) ( ON-TABLE ?auto_178206 ) ( ON ?auto_178208 ?auto_178206 ) ( ON ?auto_178205 ?auto_178208 ) ( ON ?auto_178209 ?auto_178205 ) ( ON ?auto_178204 ?auto_178209 ) ( not ( = ?auto_178206 ?auto_178208 ) ) ( not ( = ?auto_178206 ?auto_178205 ) ) ( not ( = ?auto_178206 ?auto_178209 ) ) ( not ( = ?auto_178206 ?auto_178204 ) ) ( not ( = ?auto_178206 ?auto_178207 ) ) ( not ( = ?auto_178208 ?auto_178205 ) ) ( not ( = ?auto_178208 ?auto_178209 ) ) ( not ( = ?auto_178208 ?auto_178204 ) ) ( not ( = ?auto_178208 ?auto_178207 ) ) ( not ( = ?auto_178205 ?auto_178209 ) ) ( not ( = ?auto_178205 ?auto_178204 ) ) ( not ( = ?auto_178205 ?auto_178207 ) ) ( not ( = ?auto_178209 ?auto_178204 ) ) ( not ( = ?auto_178209 ?auto_178207 ) ) ( not ( = ?auto_178204 ?auto_178207 ) ) ( not ( = ?auto_178202 ?auto_178204 ) ) ( not ( = ?auto_178202 ?auto_178206 ) ) ( not ( = ?auto_178202 ?auto_178208 ) ) ( not ( = ?auto_178202 ?auto_178205 ) ) ( not ( = ?auto_178202 ?auto_178209 ) ) ( not ( = ?auto_178210 ?auto_178204 ) ) ( not ( = ?auto_178210 ?auto_178206 ) ) ( not ( = ?auto_178210 ?auto_178208 ) ) ( not ( = ?auto_178210 ?auto_178205 ) ) ( not ( = ?auto_178210 ?auto_178209 ) ) ( not ( = ?auto_178203 ?auto_178204 ) ) ( not ( = ?auto_178203 ?auto_178206 ) ) ( not ( = ?auto_178203 ?auto_178208 ) ) ( not ( = ?auto_178203 ?auto_178205 ) ) ( not ( = ?auto_178203 ?auto_178209 ) ) ( ON ?auto_178207 ?auto_178203 ) ( CLEAR ?auto_178207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178210 ?auto_178202 ?auto_178203 )
      ( MAKE-1PILE ?auto_178202 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178211 - BLOCK
    )
    :vars
    (
      ?auto_178219 - BLOCK
      ?auto_178212 - BLOCK
      ?auto_178216 - BLOCK
      ?auto_178213 - BLOCK
      ?auto_178217 - BLOCK
      ?auto_178218 - BLOCK
      ?auto_178214 - BLOCK
      ?auto_178215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178211 ?auto_178219 ) ( not ( = ?auto_178211 ?auto_178219 ) ) ( not ( = ?auto_178211 ?auto_178212 ) ) ( not ( = ?auto_178211 ?auto_178216 ) ) ( not ( = ?auto_178219 ?auto_178212 ) ) ( not ( = ?auto_178219 ?auto_178216 ) ) ( not ( = ?auto_178212 ?auto_178216 ) ) ( ON ?auto_178212 ?auto_178211 ) ( ON-TABLE ?auto_178219 ) ( ON-TABLE ?auto_178213 ) ( ON ?auto_178217 ?auto_178213 ) ( ON ?auto_178218 ?auto_178217 ) ( ON ?auto_178214 ?auto_178218 ) ( not ( = ?auto_178213 ?auto_178217 ) ) ( not ( = ?auto_178213 ?auto_178218 ) ) ( not ( = ?auto_178213 ?auto_178214 ) ) ( not ( = ?auto_178213 ?auto_178215 ) ) ( not ( = ?auto_178213 ?auto_178216 ) ) ( not ( = ?auto_178217 ?auto_178218 ) ) ( not ( = ?auto_178217 ?auto_178214 ) ) ( not ( = ?auto_178217 ?auto_178215 ) ) ( not ( = ?auto_178217 ?auto_178216 ) ) ( not ( = ?auto_178218 ?auto_178214 ) ) ( not ( = ?auto_178218 ?auto_178215 ) ) ( not ( = ?auto_178218 ?auto_178216 ) ) ( not ( = ?auto_178214 ?auto_178215 ) ) ( not ( = ?auto_178214 ?auto_178216 ) ) ( not ( = ?auto_178215 ?auto_178216 ) ) ( not ( = ?auto_178211 ?auto_178215 ) ) ( not ( = ?auto_178211 ?auto_178213 ) ) ( not ( = ?auto_178211 ?auto_178217 ) ) ( not ( = ?auto_178211 ?auto_178218 ) ) ( not ( = ?auto_178211 ?auto_178214 ) ) ( not ( = ?auto_178219 ?auto_178215 ) ) ( not ( = ?auto_178219 ?auto_178213 ) ) ( not ( = ?auto_178219 ?auto_178217 ) ) ( not ( = ?auto_178219 ?auto_178218 ) ) ( not ( = ?auto_178219 ?auto_178214 ) ) ( not ( = ?auto_178212 ?auto_178215 ) ) ( not ( = ?auto_178212 ?auto_178213 ) ) ( not ( = ?auto_178212 ?auto_178217 ) ) ( not ( = ?auto_178212 ?auto_178218 ) ) ( not ( = ?auto_178212 ?auto_178214 ) ) ( ON ?auto_178216 ?auto_178212 ) ( CLEAR ?auto_178216 ) ( HOLDING ?auto_178215 ) ( CLEAR ?auto_178214 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178213 ?auto_178217 ?auto_178218 ?auto_178214 ?auto_178215 )
      ( MAKE-1PILE ?auto_178211 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178220 - BLOCK
    )
    :vars
    (
      ?auto_178225 - BLOCK
      ?auto_178223 - BLOCK
      ?auto_178224 - BLOCK
      ?auto_178222 - BLOCK
      ?auto_178221 - BLOCK
      ?auto_178227 - BLOCK
      ?auto_178228 - BLOCK
      ?auto_178226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178220 ?auto_178225 ) ( not ( = ?auto_178220 ?auto_178225 ) ) ( not ( = ?auto_178220 ?auto_178223 ) ) ( not ( = ?auto_178220 ?auto_178224 ) ) ( not ( = ?auto_178225 ?auto_178223 ) ) ( not ( = ?auto_178225 ?auto_178224 ) ) ( not ( = ?auto_178223 ?auto_178224 ) ) ( ON ?auto_178223 ?auto_178220 ) ( ON-TABLE ?auto_178225 ) ( ON-TABLE ?auto_178222 ) ( ON ?auto_178221 ?auto_178222 ) ( ON ?auto_178227 ?auto_178221 ) ( ON ?auto_178228 ?auto_178227 ) ( not ( = ?auto_178222 ?auto_178221 ) ) ( not ( = ?auto_178222 ?auto_178227 ) ) ( not ( = ?auto_178222 ?auto_178228 ) ) ( not ( = ?auto_178222 ?auto_178226 ) ) ( not ( = ?auto_178222 ?auto_178224 ) ) ( not ( = ?auto_178221 ?auto_178227 ) ) ( not ( = ?auto_178221 ?auto_178228 ) ) ( not ( = ?auto_178221 ?auto_178226 ) ) ( not ( = ?auto_178221 ?auto_178224 ) ) ( not ( = ?auto_178227 ?auto_178228 ) ) ( not ( = ?auto_178227 ?auto_178226 ) ) ( not ( = ?auto_178227 ?auto_178224 ) ) ( not ( = ?auto_178228 ?auto_178226 ) ) ( not ( = ?auto_178228 ?auto_178224 ) ) ( not ( = ?auto_178226 ?auto_178224 ) ) ( not ( = ?auto_178220 ?auto_178226 ) ) ( not ( = ?auto_178220 ?auto_178222 ) ) ( not ( = ?auto_178220 ?auto_178221 ) ) ( not ( = ?auto_178220 ?auto_178227 ) ) ( not ( = ?auto_178220 ?auto_178228 ) ) ( not ( = ?auto_178225 ?auto_178226 ) ) ( not ( = ?auto_178225 ?auto_178222 ) ) ( not ( = ?auto_178225 ?auto_178221 ) ) ( not ( = ?auto_178225 ?auto_178227 ) ) ( not ( = ?auto_178225 ?auto_178228 ) ) ( not ( = ?auto_178223 ?auto_178226 ) ) ( not ( = ?auto_178223 ?auto_178222 ) ) ( not ( = ?auto_178223 ?auto_178221 ) ) ( not ( = ?auto_178223 ?auto_178227 ) ) ( not ( = ?auto_178223 ?auto_178228 ) ) ( ON ?auto_178224 ?auto_178223 ) ( CLEAR ?auto_178228 ) ( ON ?auto_178226 ?auto_178224 ) ( CLEAR ?auto_178226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178225 ?auto_178220 ?auto_178223 ?auto_178224 )
      ( MAKE-1PILE ?auto_178220 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178229 - BLOCK
    )
    :vars
    (
      ?auto_178231 - BLOCK
      ?auto_178236 - BLOCK
      ?auto_178234 - BLOCK
      ?auto_178233 - BLOCK
      ?auto_178237 - BLOCK
      ?auto_178235 - BLOCK
      ?auto_178230 - BLOCK
      ?auto_178232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178229 ?auto_178231 ) ( not ( = ?auto_178229 ?auto_178231 ) ) ( not ( = ?auto_178229 ?auto_178236 ) ) ( not ( = ?auto_178229 ?auto_178234 ) ) ( not ( = ?auto_178231 ?auto_178236 ) ) ( not ( = ?auto_178231 ?auto_178234 ) ) ( not ( = ?auto_178236 ?auto_178234 ) ) ( ON ?auto_178236 ?auto_178229 ) ( ON-TABLE ?auto_178231 ) ( ON-TABLE ?auto_178233 ) ( ON ?auto_178237 ?auto_178233 ) ( ON ?auto_178235 ?auto_178237 ) ( not ( = ?auto_178233 ?auto_178237 ) ) ( not ( = ?auto_178233 ?auto_178235 ) ) ( not ( = ?auto_178233 ?auto_178230 ) ) ( not ( = ?auto_178233 ?auto_178232 ) ) ( not ( = ?auto_178233 ?auto_178234 ) ) ( not ( = ?auto_178237 ?auto_178235 ) ) ( not ( = ?auto_178237 ?auto_178230 ) ) ( not ( = ?auto_178237 ?auto_178232 ) ) ( not ( = ?auto_178237 ?auto_178234 ) ) ( not ( = ?auto_178235 ?auto_178230 ) ) ( not ( = ?auto_178235 ?auto_178232 ) ) ( not ( = ?auto_178235 ?auto_178234 ) ) ( not ( = ?auto_178230 ?auto_178232 ) ) ( not ( = ?auto_178230 ?auto_178234 ) ) ( not ( = ?auto_178232 ?auto_178234 ) ) ( not ( = ?auto_178229 ?auto_178232 ) ) ( not ( = ?auto_178229 ?auto_178233 ) ) ( not ( = ?auto_178229 ?auto_178237 ) ) ( not ( = ?auto_178229 ?auto_178235 ) ) ( not ( = ?auto_178229 ?auto_178230 ) ) ( not ( = ?auto_178231 ?auto_178232 ) ) ( not ( = ?auto_178231 ?auto_178233 ) ) ( not ( = ?auto_178231 ?auto_178237 ) ) ( not ( = ?auto_178231 ?auto_178235 ) ) ( not ( = ?auto_178231 ?auto_178230 ) ) ( not ( = ?auto_178236 ?auto_178232 ) ) ( not ( = ?auto_178236 ?auto_178233 ) ) ( not ( = ?auto_178236 ?auto_178237 ) ) ( not ( = ?auto_178236 ?auto_178235 ) ) ( not ( = ?auto_178236 ?auto_178230 ) ) ( ON ?auto_178234 ?auto_178236 ) ( ON ?auto_178232 ?auto_178234 ) ( CLEAR ?auto_178232 ) ( HOLDING ?auto_178230 ) ( CLEAR ?auto_178235 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178233 ?auto_178237 ?auto_178235 ?auto_178230 )
      ( MAKE-1PILE ?auto_178229 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178238 - BLOCK
    )
    :vars
    (
      ?auto_178243 - BLOCK
      ?auto_178240 - BLOCK
      ?auto_178239 - BLOCK
      ?auto_178241 - BLOCK
      ?auto_178244 - BLOCK
      ?auto_178246 - BLOCK
      ?auto_178245 - BLOCK
      ?auto_178242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178238 ?auto_178243 ) ( not ( = ?auto_178238 ?auto_178243 ) ) ( not ( = ?auto_178238 ?auto_178240 ) ) ( not ( = ?auto_178238 ?auto_178239 ) ) ( not ( = ?auto_178243 ?auto_178240 ) ) ( not ( = ?auto_178243 ?auto_178239 ) ) ( not ( = ?auto_178240 ?auto_178239 ) ) ( ON ?auto_178240 ?auto_178238 ) ( ON-TABLE ?auto_178243 ) ( ON-TABLE ?auto_178241 ) ( ON ?auto_178244 ?auto_178241 ) ( ON ?auto_178246 ?auto_178244 ) ( not ( = ?auto_178241 ?auto_178244 ) ) ( not ( = ?auto_178241 ?auto_178246 ) ) ( not ( = ?auto_178241 ?auto_178245 ) ) ( not ( = ?auto_178241 ?auto_178242 ) ) ( not ( = ?auto_178241 ?auto_178239 ) ) ( not ( = ?auto_178244 ?auto_178246 ) ) ( not ( = ?auto_178244 ?auto_178245 ) ) ( not ( = ?auto_178244 ?auto_178242 ) ) ( not ( = ?auto_178244 ?auto_178239 ) ) ( not ( = ?auto_178246 ?auto_178245 ) ) ( not ( = ?auto_178246 ?auto_178242 ) ) ( not ( = ?auto_178246 ?auto_178239 ) ) ( not ( = ?auto_178245 ?auto_178242 ) ) ( not ( = ?auto_178245 ?auto_178239 ) ) ( not ( = ?auto_178242 ?auto_178239 ) ) ( not ( = ?auto_178238 ?auto_178242 ) ) ( not ( = ?auto_178238 ?auto_178241 ) ) ( not ( = ?auto_178238 ?auto_178244 ) ) ( not ( = ?auto_178238 ?auto_178246 ) ) ( not ( = ?auto_178238 ?auto_178245 ) ) ( not ( = ?auto_178243 ?auto_178242 ) ) ( not ( = ?auto_178243 ?auto_178241 ) ) ( not ( = ?auto_178243 ?auto_178244 ) ) ( not ( = ?auto_178243 ?auto_178246 ) ) ( not ( = ?auto_178243 ?auto_178245 ) ) ( not ( = ?auto_178240 ?auto_178242 ) ) ( not ( = ?auto_178240 ?auto_178241 ) ) ( not ( = ?auto_178240 ?auto_178244 ) ) ( not ( = ?auto_178240 ?auto_178246 ) ) ( not ( = ?auto_178240 ?auto_178245 ) ) ( ON ?auto_178239 ?auto_178240 ) ( ON ?auto_178242 ?auto_178239 ) ( CLEAR ?auto_178246 ) ( ON ?auto_178245 ?auto_178242 ) ( CLEAR ?auto_178245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178243 ?auto_178238 ?auto_178240 ?auto_178239 ?auto_178242 )
      ( MAKE-1PILE ?auto_178238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178247 - BLOCK
    )
    :vars
    (
      ?auto_178255 - BLOCK
      ?auto_178253 - BLOCK
      ?auto_178249 - BLOCK
      ?auto_178250 - BLOCK
      ?auto_178252 - BLOCK
      ?auto_178251 - BLOCK
      ?auto_178254 - BLOCK
      ?auto_178248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178247 ?auto_178255 ) ( not ( = ?auto_178247 ?auto_178255 ) ) ( not ( = ?auto_178247 ?auto_178253 ) ) ( not ( = ?auto_178247 ?auto_178249 ) ) ( not ( = ?auto_178255 ?auto_178253 ) ) ( not ( = ?auto_178255 ?auto_178249 ) ) ( not ( = ?auto_178253 ?auto_178249 ) ) ( ON ?auto_178253 ?auto_178247 ) ( ON-TABLE ?auto_178255 ) ( ON-TABLE ?auto_178250 ) ( ON ?auto_178252 ?auto_178250 ) ( not ( = ?auto_178250 ?auto_178252 ) ) ( not ( = ?auto_178250 ?auto_178251 ) ) ( not ( = ?auto_178250 ?auto_178254 ) ) ( not ( = ?auto_178250 ?auto_178248 ) ) ( not ( = ?auto_178250 ?auto_178249 ) ) ( not ( = ?auto_178252 ?auto_178251 ) ) ( not ( = ?auto_178252 ?auto_178254 ) ) ( not ( = ?auto_178252 ?auto_178248 ) ) ( not ( = ?auto_178252 ?auto_178249 ) ) ( not ( = ?auto_178251 ?auto_178254 ) ) ( not ( = ?auto_178251 ?auto_178248 ) ) ( not ( = ?auto_178251 ?auto_178249 ) ) ( not ( = ?auto_178254 ?auto_178248 ) ) ( not ( = ?auto_178254 ?auto_178249 ) ) ( not ( = ?auto_178248 ?auto_178249 ) ) ( not ( = ?auto_178247 ?auto_178248 ) ) ( not ( = ?auto_178247 ?auto_178250 ) ) ( not ( = ?auto_178247 ?auto_178252 ) ) ( not ( = ?auto_178247 ?auto_178251 ) ) ( not ( = ?auto_178247 ?auto_178254 ) ) ( not ( = ?auto_178255 ?auto_178248 ) ) ( not ( = ?auto_178255 ?auto_178250 ) ) ( not ( = ?auto_178255 ?auto_178252 ) ) ( not ( = ?auto_178255 ?auto_178251 ) ) ( not ( = ?auto_178255 ?auto_178254 ) ) ( not ( = ?auto_178253 ?auto_178248 ) ) ( not ( = ?auto_178253 ?auto_178250 ) ) ( not ( = ?auto_178253 ?auto_178252 ) ) ( not ( = ?auto_178253 ?auto_178251 ) ) ( not ( = ?auto_178253 ?auto_178254 ) ) ( ON ?auto_178249 ?auto_178253 ) ( ON ?auto_178248 ?auto_178249 ) ( ON ?auto_178254 ?auto_178248 ) ( CLEAR ?auto_178254 ) ( HOLDING ?auto_178251 ) ( CLEAR ?auto_178252 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178250 ?auto_178252 ?auto_178251 )
      ( MAKE-1PILE ?auto_178247 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178256 - BLOCK
    )
    :vars
    (
      ?auto_178262 - BLOCK
      ?auto_178264 - BLOCK
      ?auto_178263 - BLOCK
      ?auto_178259 - BLOCK
      ?auto_178258 - BLOCK
      ?auto_178257 - BLOCK
      ?auto_178260 - BLOCK
      ?auto_178261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178256 ?auto_178262 ) ( not ( = ?auto_178256 ?auto_178262 ) ) ( not ( = ?auto_178256 ?auto_178264 ) ) ( not ( = ?auto_178256 ?auto_178263 ) ) ( not ( = ?auto_178262 ?auto_178264 ) ) ( not ( = ?auto_178262 ?auto_178263 ) ) ( not ( = ?auto_178264 ?auto_178263 ) ) ( ON ?auto_178264 ?auto_178256 ) ( ON-TABLE ?auto_178262 ) ( ON-TABLE ?auto_178259 ) ( ON ?auto_178258 ?auto_178259 ) ( not ( = ?auto_178259 ?auto_178258 ) ) ( not ( = ?auto_178259 ?auto_178257 ) ) ( not ( = ?auto_178259 ?auto_178260 ) ) ( not ( = ?auto_178259 ?auto_178261 ) ) ( not ( = ?auto_178259 ?auto_178263 ) ) ( not ( = ?auto_178258 ?auto_178257 ) ) ( not ( = ?auto_178258 ?auto_178260 ) ) ( not ( = ?auto_178258 ?auto_178261 ) ) ( not ( = ?auto_178258 ?auto_178263 ) ) ( not ( = ?auto_178257 ?auto_178260 ) ) ( not ( = ?auto_178257 ?auto_178261 ) ) ( not ( = ?auto_178257 ?auto_178263 ) ) ( not ( = ?auto_178260 ?auto_178261 ) ) ( not ( = ?auto_178260 ?auto_178263 ) ) ( not ( = ?auto_178261 ?auto_178263 ) ) ( not ( = ?auto_178256 ?auto_178261 ) ) ( not ( = ?auto_178256 ?auto_178259 ) ) ( not ( = ?auto_178256 ?auto_178258 ) ) ( not ( = ?auto_178256 ?auto_178257 ) ) ( not ( = ?auto_178256 ?auto_178260 ) ) ( not ( = ?auto_178262 ?auto_178261 ) ) ( not ( = ?auto_178262 ?auto_178259 ) ) ( not ( = ?auto_178262 ?auto_178258 ) ) ( not ( = ?auto_178262 ?auto_178257 ) ) ( not ( = ?auto_178262 ?auto_178260 ) ) ( not ( = ?auto_178264 ?auto_178261 ) ) ( not ( = ?auto_178264 ?auto_178259 ) ) ( not ( = ?auto_178264 ?auto_178258 ) ) ( not ( = ?auto_178264 ?auto_178257 ) ) ( not ( = ?auto_178264 ?auto_178260 ) ) ( ON ?auto_178263 ?auto_178264 ) ( ON ?auto_178261 ?auto_178263 ) ( ON ?auto_178260 ?auto_178261 ) ( CLEAR ?auto_178258 ) ( ON ?auto_178257 ?auto_178260 ) ( CLEAR ?auto_178257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178262 ?auto_178256 ?auto_178264 ?auto_178263 ?auto_178261 ?auto_178260 )
      ( MAKE-1PILE ?auto_178256 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178265 - BLOCK
    )
    :vars
    (
      ?auto_178267 - BLOCK
      ?auto_178269 - BLOCK
      ?auto_178273 - BLOCK
      ?auto_178271 - BLOCK
      ?auto_178266 - BLOCK
      ?auto_178270 - BLOCK
      ?auto_178268 - BLOCK
      ?auto_178272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178265 ?auto_178267 ) ( not ( = ?auto_178265 ?auto_178267 ) ) ( not ( = ?auto_178265 ?auto_178269 ) ) ( not ( = ?auto_178265 ?auto_178273 ) ) ( not ( = ?auto_178267 ?auto_178269 ) ) ( not ( = ?auto_178267 ?auto_178273 ) ) ( not ( = ?auto_178269 ?auto_178273 ) ) ( ON ?auto_178269 ?auto_178265 ) ( ON-TABLE ?auto_178267 ) ( ON-TABLE ?auto_178271 ) ( not ( = ?auto_178271 ?auto_178266 ) ) ( not ( = ?auto_178271 ?auto_178270 ) ) ( not ( = ?auto_178271 ?auto_178268 ) ) ( not ( = ?auto_178271 ?auto_178272 ) ) ( not ( = ?auto_178271 ?auto_178273 ) ) ( not ( = ?auto_178266 ?auto_178270 ) ) ( not ( = ?auto_178266 ?auto_178268 ) ) ( not ( = ?auto_178266 ?auto_178272 ) ) ( not ( = ?auto_178266 ?auto_178273 ) ) ( not ( = ?auto_178270 ?auto_178268 ) ) ( not ( = ?auto_178270 ?auto_178272 ) ) ( not ( = ?auto_178270 ?auto_178273 ) ) ( not ( = ?auto_178268 ?auto_178272 ) ) ( not ( = ?auto_178268 ?auto_178273 ) ) ( not ( = ?auto_178272 ?auto_178273 ) ) ( not ( = ?auto_178265 ?auto_178272 ) ) ( not ( = ?auto_178265 ?auto_178271 ) ) ( not ( = ?auto_178265 ?auto_178266 ) ) ( not ( = ?auto_178265 ?auto_178270 ) ) ( not ( = ?auto_178265 ?auto_178268 ) ) ( not ( = ?auto_178267 ?auto_178272 ) ) ( not ( = ?auto_178267 ?auto_178271 ) ) ( not ( = ?auto_178267 ?auto_178266 ) ) ( not ( = ?auto_178267 ?auto_178270 ) ) ( not ( = ?auto_178267 ?auto_178268 ) ) ( not ( = ?auto_178269 ?auto_178272 ) ) ( not ( = ?auto_178269 ?auto_178271 ) ) ( not ( = ?auto_178269 ?auto_178266 ) ) ( not ( = ?auto_178269 ?auto_178270 ) ) ( not ( = ?auto_178269 ?auto_178268 ) ) ( ON ?auto_178273 ?auto_178269 ) ( ON ?auto_178272 ?auto_178273 ) ( ON ?auto_178268 ?auto_178272 ) ( ON ?auto_178270 ?auto_178268 ) ( CLEAR ?auto_178270 ) ( HOLDING ?auto_178266 ) ( CLEAR ?auto_178271 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178271 ?auto_178266 )
      ( MAKE-1PILE ?auto_178265 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178274 - BLOCK
    )
    :vars
    (
      ?auto_178277 - BLOCK
      ?auto_178279 - BLOCK
      ?auto_178276 - BLOCK
      ?auto_178281 - BLOCK
      ?auto_178278 - BLOCK
      ?auto_178282 - BLOCK
      ?auto_178280 - BLOCK
      ?auto_178275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178274 ?auto_178277 ) ( not ( = ?auto_178274 ?auto_178277 ) ) ( not ( = ?auto_178274 ?auto_178279 ) ) ( not ( = ?auto_178274 ?auto_178276 ) ) ( not ( = ?auto_178277 ?auto_178279 ) ) ( not ( = ?auto_178277 ?auto_178276 ) ) ( not ( = ?auto_178279 ?auto_178276 ) ) ( ON ?auto_178279 ?auto_178274 ) ( ON-TABLE ?auto_178277 ) ( ON-TABLE ?auto_178281 ) ( not ( = ?auto_178281 ?auto_178278 ) ) ( not ( = ?auto_178281 ?auto_178282 ) ) ( not ( = ?auto_178281 ?auto_178280 ) ) ( not ( = ?auto_178281 ?auto_178275 ) ) ( not ( = ?auto_178281 ?auto_178276 ) ) ( not ( = ?auto_178278 ?auto_178282 ) ) ( not ( = ?auto_178278 ?auto_178280 ) ) ( not ( = ?auto_178278 ?auto_178275 ) ) ( not ( = ?auto_178278 ?auto_178276 ) ) ( not ( = ?auto_178282 ?auto_178280 ) ) ( not ( = ?auto_178282 ?auto_178275 ) ) ( not ( = ?auto_178282 ?auto_178276 ) ) ( not ( = ?auto_178280 ?auto_178275 ) ) ( not ( = ?auto_178280 ?auto_178276 ) ) ( not ( = ?auto_178275 ?auto_178276 ) ) ( not ( = ?auto_178274 ?auto_178275 ) ) ( not ( = ?auto_178274 ?auto_178281 ) ) ( not ( = ?auto_178274 ?auto_178278 ) ) ( not ( = ?auto_178274 ?auto_178282 ) ) ( not ( = ?auto_178274 ?auto_178280 ) ) ( not ( = ?auto_178277 ?auto_178275 ) ) ( not ( = ?auto_178277 ?auto_178281 ) ) ( not ( = ?auto_178277 ?auto_178278 ) ) ( not ( = ?auto_178277 ?auto_178282 ) ) ( not ( = ?auto_178277 ?auto_178280 ) ) ( not ( = ?auto_178279 ?auto_178275 ) ) ( not ( = ?auto_178279 ?auto_178281 ) ) ( not ( = ?auto_178279 ?auto_178278 ) ) ( not ( = ?auto_178279 ?auto_178282 ) ) ( not ( = ?auto_178279 ?auto_178280 ) ) ( ON ?auto_178276 ?auto_178279 ) ( ON ?auto_178275 ?auto_178276 ) ( ON ?auto_178280 ?auto_178275 ) ( ON ?auto_178282 ?auto_178280 ) ( CLEAR ?auto_178281 ) ( ON ?auto_178278 ?auto_178282 ) ( CLEAR ?auto_178278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178277 ?auto_178274 ?auto_178279 ?auto_178276 ?auto_178275 ?auto_178280 ?auto_178282 )
      ( MAKE-1PILE ?auto_178274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178283 - BLOCK
    )
    :vars
    (
      ?auto_178290 - BLOCK
      ?auto_178289 - BLOCK
      ?auto_178287 - BLOCK
      ?auto_178288 - BLOCK
      ?auto_178291 - BLOCK
      ?auto_178286 - BLOCK
      ?auto_178284 - BLOCK
      ?auto_178285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178283 ?auto_178290 ) ( not ( = ?auto_178283 ?auto_178290 ) ) ( not ( = ?auto_178283 ?auto_178289 ) ) ( not ( = ?auto_178283 ?auto_178287 ) ) ( not ( = ?auto_178290 ?auto_178289 ) ) ( not ( = ?auto_178290 ?auto_178287 ) ) ( not ( = ?auto_178289 ?auto_178287 ) ) ( ON ?auto_178289 ?auto_178283 ) ( ON-TABLE ?auto_178290 ) ( not ( = ?auto_178288 ?auto_178291 ) ) ( not ( = ?auto_178288 ?auto_178286 ) ) ( not ( = ?auto_178288 ?auto_178284 ) ) ( not ( = ?auto_178288 ?auto_178285 ) ) ( not ( = ?auto_178288 ?auto_178287 ) ) ( not ( = ?auto_178291 ?auto_178286 ) ) ( not ( = ?auto_178291 ?auto_178284 ) ) ( not ( = ?auto_178291 ?auto_178285 ) ) ( not ( = ?auto_178291 ?auto_178287 ) ) ( not ( = ?auto_178286 ?auto_178284 ) ) ( not ( = ?auto_178286 ?auto_178285 ) ) ( not ( = ?auto_178286 ?auto_178287 ) ) ( not ( = ?auto_178284 ?auto_178285 ) ) ( not ( = ?auto_178284 ?auto_178287 ) ) ( not ( = ?auto_178285 ?auto_178287 ) ) ( not ( = ?auto_178283 ?auto_178285 ) ) ( not ( = ?auto_178283 ?auto_178288 ) ) ( not ( = ?auto_178283 ?auto_178291 ) ) ( not ( = ?auto_178283 ?auto_178286 ) ) ( not ( = ?auto_178283 ?auto_178284 ) ) ( not ( = ?auto_178290 ?auto_178285 ) ) ( not ( = ?auto_178290 ?auto_178288 ) ) ( not ( = ?auto_178290 ?auto_178291 ) ) ( not ( = ?auto_178290 ?auto_178286 ) ) ( not ( = ?auto_178290 ?auto_178284 ) ) ( not ( = ?auto_178289 ?auto_178285 ) ) ( not ( = ?auto_178289 ?auto_178288 ) ) ( not ( = ?auto_178289 ?auto_178291 ) ) ( not ( = ?auto_178289 ?auto_178286 ) ) ( not ( = ?auto_178289 ?auto_178284 ) ) ( ON ?auto_178287 ?auto_178289 ) ( ON ?auto_178285 ?auto_178287 ) ( ON ?auto_178284 ?auto_178285 ) ( ON ?auto_178286 ?auto_178284 ) ( ON ?auto_178291 ?auto_178286 ) ( CLEAR ?auto_178291 ) ( HOLDING ?auto_178288 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178288 )
      ( MAKE-1PILE ?auto_178283 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178292 - BLOCK
    )
    :vars
    (
      ?auto_178299 - BLOCK
      ?auto_178293 - BLOCK
      ?auto_178300 - BLOCK
      ?auto_178295 - BLOCK
      ?auto_178294 - BLOCK
      ?auto_178296 - BLOCK
      ?auto_178297 - BLOCK
      ?auto_178298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178292 ?auto_178299 ) ( not ( = ?auto_178292 ?auto_178299 ) ) ( not ( = ?auto_178292 ?auto_178293 ) ) ( not ( = ?auto_178292 ?auto_178300 ) ) ( not ( = ?auto_178299 ?auto_178293 ) ) ( not ( = ?auto_178299 ?auto_178300 ) ) ( not ( = ?auto_178293 ?auto_178300 ) ) ( ON ?auto_178293 ?auto_178292 ) ( ON-TABLE ?auto_178299 ) ( not ( = ?auto_178295 ?auto_178294 ) ) ( not ( = ?auto_178295 ?auto_178296 ) ) ( not ( = ?auto_178295 ?auto_178297 ) ) ( not ( = ?auto_178295 ?auto_178298 ) ) ( not ( = ?auto_178295 ?auto_178300 ) ) ( not ( = ?auto_178294 ?auto_178296 ) ) ( not ( = ?auto_178294 ?auto_178297 ) ) ( not ( = ?auto_178294 ?auto_178298 ) ) ( not ( = ?auto_178294 ?auto_178300 ) ) ( not ( = ?auto_178296 ?auto_178297 ) ) ( not ( = ?auto_178296 ?auto_178298 ) ) ( not ( = ?auto_178296 ?auto_178300 ) ) ( not ( = ?auto_178297 ?auto_178298 ) ) ( not ( = ?auto_178297 ?auto_178300 ) ) ( not ( = ?auto_178298 ?auto_178300 ) ) ( not ( = ?auto_178292 ?auto_178298 ) ) ( not ( = ?auto_178292 ?auto_178295 ) ) ( not ( = ?auto_178292 ?auto_178294 ) ) ( not ( = ?auto_178292 ?auto_178296 ) ) ( not ( = ?auto_178292 ?auto_178297 ) ) ( not ( = ?auto_178299 ?auto_178298 ) ) ( not ( = ?auto_178299 ?auto_178295 ) ) ( not ( = ?auto_178299 ?auto_178294 ) ) ( not ( = ?auto_178299 ?auto_178296 ) ) ( not ( = ?auto_178299 ?auto_178297 ) ) ( not ( = ?auto_178293 ?auto_178298 ) ) ( not ( = ?auto_178293 ?auto_178295 ) ) ( not ( = ?auto_178293 ?auto_178294 ) ) ( not ( = ?auto_178293 ?auto_178296 ) ) ( not ( = ?auto_178293 ?auto_178297 ) ) ( ON ?auto_178300 ?auto_178293 ) ( ON ?auto_178298 ?auto_178300 ) ( ON ?auto_178297 ?auto_178298 ) ( ON ?auto_178296 ?auto_178297 ) ( ON ?auto_178294 ?auto_178296 ) ( ON ?auto_178295 ?auto_178294 ) ( CLEAR ?auto_178295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178299 ?auto_178292 ?auto_178293 ?auto_178300 ?auto_178298 ?auto_178297 ?auto_178296 ?auto_178294 )
      ( MAKE-1PILE ?auto_178292 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178314 - BLOCK
      ?auto_178315 - BLOCK
      ?auto_178316 - BLOCK
      ?auto_178317 - BLOCK
      ?auto_178318 - BLOCK
      ?auto_178319 - BLOCK
    )
    :vars
    (
      ?auto_178320 - BLOCK
      ?auto_178321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178320 ?auto_178319 ) ( CLEAR ?auto_178320 ) ( ON-TABLE ?auto_178314 ) ( ON ?auto_178315 ?auto_178314 ) ( ON ?auto_178316 ?auto_178315 ) ( ON ?auto_178317 ?auto_178316 ) ( ON ?auto_178318 ?auto_178317 ) ( ON ?auto_178319 ?auto_178318 ) ( not ( = ?auto_178314 ?auto_178315 ) ) ( not ( = ?auto_178314 ?auto_178316 ) ) ( not ( = ?auto_178314 ?auto_178317 ) ) ( not ( = ?auto_178314 ?auto_178318 ) ) ( not ( = ?auto_178314 ?auto_178319 ) ) ( not ( = ?auto_178314 ?auto_178320 ) ) ( not ( = ?auto_178315 ?auto_178316 ) ) ( not ( = ?auto_178315 ?auto_178317 ) ) ( not ( = ?auto_178315 ?auto_178318 ) ) ( not ( = ?auto_178315 ?auto_178319 ) ) ( not ( = ?auto_178315 ?auto_178320 ) ) ( not ( = ?auto_178316 ?auto_178317 ) ) ( not ( = ?auto_178316 ?auto_178318 ) ) ( not ( = ?auto_178316 ?auto_178319 ) ) ( not ( = ?auto_178316 ?auto_178320 ) ) ( not ( = ?auto_178317 ?auto_178318 ) ) ( not ( = ?auto_178317 ?auto_178319 ) ) ( not ( = ?auto_178317 ?auto_178320 ) ) ( not ( = ?auto_178318 ?auto_178319 ) ) ( not ( = ?auto_178318 ?auto_178320 ) ) ( not ( = ?auto_178319 ?auto_178320 ) ) ( HOLDING ?auto_178321 ) ( not ( = ?auto_178314 ?auto_178321 ) ) ( not ( = ?auto_178315 ?auto_178321 ) ) ( not ( = ?auto_178316 ?auto_178321 ) ) ( not ( = ?auto_178317 ?auto_178321 ) ) ( not ( = ?auto_178318 ?auto_178321 ) ) ( not ( = ?auto_178319 ?auto_178321 ) ) ( not ( = ?auto_178320 ?auto_178321 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_178321 )
      ( MAKE-6PILE ?auto_178314 ?auto_178315 ?auto_178316 ?auto_178317 ?auto_178318 ?auto_178319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178439 - BLOCK
      ?auto_178440 - BLOCK
    )
    :vars
    (
      ?auto_178441 - BLOCK
      ?auto_178445 - BLOCK
      ?auto_178446 - BLOCK
      ?auto_178444 - BLOCK
      ?auto_178442 - BLOCK
      ?auto_178443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178439 ?auto_178440 ) ) ( ON ?auto_178440 ?auto_178441 ) ( not ( = ?auto_178439 ?auto_178441 ) ) ( not ( = ?auto_178440 ?auto_178441 ) ) ( ON ?auto_178439 ?auto_178440 ) ( CLEAR ?auto_178439 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178445 ) ( ON ?auto_178446 ?auto_178445 ) ( ON ?auto_178444 ?auto_178446 ) ( ON ?auto_178442 ?auto_178444 ) ( ON ?auto_178443 ?auto_178442 ) ( ON ?auto_178441 ?auto_178443 ) ( not ( = ?auto_178445 ?auto_178446 ) ) ( not ( = ?auto_178445 ?auto_178444 ) ) ( not ( = ?auto_178445 ?auto_178442 ) ) ( not ( = ?auto_178445 ?auto_178443 ) ) ( not ( = ?auto_178445 ?auto_178441 ) ) ( not ( = ?auto_178445 ?auto_178440 ) ) ( not ( = ?auto_178445 ?auto_178439 ) ) ( not ( = ?auto_178446 ?auto_178444 ) ) ( not ( = ?auto_178446 ?auto_178442 ) ) ( not ( = ?auto_178446 ?auto_178443 ) ) ( not ( = ?auto_178446 ?auto_178441 ) ) ( not ( = ?auto_178446 ?auto_178440 ) ) ( not ( = ?auto_178446 ?auto_178439 ) ) ( not ( = ?auto_178444 ?auto_178442 ) ) ( not ( = ?auto_178444 ?auto_178443 ) ) ( not ( = ?auto_178444 ?auto_178441 ) ) ( not ( = ?auto_178444 ?auto_178440 ) ) ( not ( = ?auto_178444 ?auto_178439 ) ) ( not ( = ?auto_178442 ?auto_178443 ) ) ( not ( = ?auto_178442 ?auto_178441 ) ) ( not ( = ?auto_178442 ?auto_178440 ) ) ( not ( = ?auto_178442 ?auto_178439 ) ) ( not ( = ?auto_178443 ?auto_178441 ) ) ( not ( = ?auto_178443 ?auto_178440 ) ) ( not ( = ?auto_178443 ?auto_178439 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178445 ?auto_178446 ?auto_178444 ?auto_178442 ?auto_178443 ?auto_178441 ?auto_178440 )
      ( MAKE-2PILE ?auto_178439 ?auto_178440 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178449 - BLOCK
      ?auto_178450 - BLOCK
    )
    :vars
    (
      ?auto_178451 - BLOCK
      ?auto_178452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178449 ?auto_178450 ) ) ( ON ?auto_178450 ?auto_178451 ) ( CLEAR ?auto_178450 ) ( not ( = ?auto_178449 ?auto_178451 ) ) ( not ( = ?auto_178450 ?auto_178451 ) ) ( ON ?auto_178449 ?auto_178452 ) ( CLEAR ?auto_178449 ) ( HAND-EMPTY ) ( not ( = ?auto_178449 ?auto_178452 ) ) ( not ( = ?auto_178450 ?auto_178452 ) ) ( not ( = ?auto_178451 ?auto_178452 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178449 ?auto_178452 )
      ( MAKE-2PILE ?auto_178449 ?auto_178450 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178453 - BLOCK
      ?auto_178454 - BLOCK
    )
    :vars
    (
      ?auto_178455 - BLOCK
      ?auto_178456 - BLOCK
      ?auto_178461 - BLOCK
      ?auto_178459 - BLOCK
      ?auto_178458 - BLOCK
      ?auto_178460 - BLOCK
      ?auto_178457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178453 ?auto_178454 ) ) ( not ( = ?auto_178453 ?auto_178455 ) ) ( not ( = ?auto_178454 ?auto_178455 ) ) ( ON ?auto_178453 ?auto_178456 ) ( CLEAR ?auto_178453 ) ( not ( = ?auto_178453 ?auto_178456 ) ) ( not ( = ?auto_178454 ?auto_178456 ) ) ( not ( = ?auto_178455 ?auto_178456 ) ) ( HOLDING ?auto_178454 ) ( CLEAR ?auto_178455 ) ( ON-TABLE ?auto_178461 ) ( ON ?auto_178459 ?auto_178461 ) ( ON ?auto_178458 ?auto_178459 ) ( ON ?auto_178460 ?auto_178458 ) ( ON ?auto_178457 ?auto_178460 ) ( ON ?auto_178455 ?auto_178457 ) ( not ( = ?auto_178461 ?auto_178459 ) ) ( not ( = ?auto_178461 ?auto_178458 ) ) ( not ( = ?auto_178461 ?auto_178460 ) ) ( not ( = ?auto_178461 ?auto_178457 ) ) ( not ( = ?auto_178461 ?auto_178455 ) ) ( not ( = ?auto_178461 ?auto_178454 ) ) ( not ( = ?auto_178459 ?auto_178458 ) ) ( not ( = ?auto_178459 ?auto_178460 ) ) ( not ( = ?auto_178459 ?auto_178457 ) ) ( not ( = ?auto_178459 ?auto_178455 ) ) ( not ( = ?auto_178459 ?auto_178454 ) ) ( not ( = ?auto_178458 ?auto_178460 ) ) ( not ( = ?auto_178458 ?auto_178457 ) ) ( not ( = ?auto_178458 ?auto_178455 ) ) ( not ( = ?auto_178458 ?auto_178454 ) ) ( not ( = ?auto_178460 ?auto_178457 ) ) ( not ( = ?auto_178460 ?auto_178455 ) ) ( not ( = ?auto_178460 ?auto_178454 ) ) ( not ( = ?auto_178457 ?auto_178455 ) ) ( not ( = ?auto_178457 ?auto_178454 ) ) ( not ( = ?auto_178453 ?auto_178461 ) ) ( not ( = ?auto_178453 ?auto_178459 ) ) ( not ( = ?auto_178453 ?auto_178458 ) ) ( not ( = ?auto_178453 ?auto_178460 ) ) ( not ( = ?auto_178453 ?auto_178457 ) ) ( not ( = ?auto_178456 ?auto_178461 ) ) ( not ( = ?auto_178456 ?auto_178459 ) ) ( not ( = ?auto_178456 ?auto_178458 ) ) ( not ( = ?auto_178456 ?auto_178460 ) ) ( not ( = ?auto_178456 ?auto_178457 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178461 ?auto_178459 ?auto_178458 ?auto_178460 ?auto_178457 ?auto_178455 ?auto_178454 )
      ( MAKE-2PILE ?auto_178453 ?auto_178454 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178462 - BLOCK
      ?auto_178463 - BLOCK
    )
    :vars
    (
      ?auto_178470 - BLOCK
      ?auto_178466 - BLOCK
      ?auto_178464 - BLOCK
      ?auto_178468 - BLOCK
      ?auto_178467 - BLOCK
      ?auto_178465 - BLOCK
      ?auto_178469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178462 ?auto_178463 ) ) ( not ( = ?auto_178462 ?auto_178470 ) ) ( not ( = ?auto_178463 ?auto_178470 ) ) ( ON ?auto_178462 ?auto_178466 ) ( not ( = ?auto_178462 ?auto_178466 ) ) ( not ( = ?auto_178463 ?auto_178466 ) ) ( not ( = ?auto_178470 ?auto_178466 ) ) ( CLEAR ?auto_178470 ) ( ON-TABLE ?auto_178464 ) ( ON ?auto_178468 ?auto_178464 ) ( ON ?auto_178467 ?auto_178468 ) ( ON ?auto_178465 ?auto_178467 ) ( ON ?auto_178469 ?auto_178465 ) ( ON ?auto_178470 ?auto_178469 ) ( not ( = ?auto_178464 ?auto_178468 ) ) ( not ( = ?auto_178464 ?auto_178467 ) ) ( not ( = ?auto_178464 ?auto_178465 ) ) ( not ( = ?auto_178464 ?auto_178469 ) ) ( not ( = ?auto_178464 ?auto_178470 ) ) ( not ( = ?auto_178464 ?auto_178463 ) ) ( not ( = ?auto_178468 ?auto_178467 ) ) ( not ( = ?auto_178468 ?auto_178465 ) ) ( not ( = ?auto_178468 ?auto_178469 ) ) ( not ( = ?auto_178468 ?auto_178470 ) ) ( not ( = ?auto_178468 ?auto_178463 ) ) ( not ( = ?auto_178467 ?auto_178465 ) ) ( not ( = ?auto_178467 ?auto_178469 ) ) ( not ( = ?auto_178467 ?auto_178470 ) ) ( not ( = ?auto_178467 ?auto_178463 ) ) ( not ( = ?auto_178465 ?auto_178469 ) ) ( not ( = ?auto_178465 ?auto_178470 ) ) ( not ( = ?auto_178465 ?auto_178463 ) ) ( not ( = ?auto_178469 ?auto_178470 ) ) ( not ( = ?auto_178469 ?auto_178463 ) ) ( not ( = ?auto_178462 ?auto_178464 ) ) ( not ( = ?auto_178462 ?auto_178468 ) ) ( not ( = ?auto_178462 ?auto_178467 ) ) ( not ( = ?auto_178462 ?auto_178465 ) ) ( not ( = ?auto_178462 ?auto_178469 ) ) ( not ( = ?auto_178466 ?auto_178464 ) ) ( not ( = ?auto_178466 ?auto_178468 ) ) ( not ( = ?auto_178466 ?auto_178467 ) ) ( not ( = ?auto_178466 ?auto_178465 ) ) ( not ( = ?auto_178466 ?auto_178469 ) ) ( ON ?auto_178463 ?auto_178462 ) ( CLEAR ?auto_178463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178466 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178466 ?auto_178462 )
      ( MAKE-2PILE ?auto_178462 ?auto_178463 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178471 - BLOCK
      ?auto_178472 - BLOCK
    )
    :vars
    (
      ?auto_178478 - BLOCK
      ?auto_178474 - BLOCK
      ?auto_178473 - BLOCK
      ?auto_178476 - BLOCK
      ?auto_178475 - BLOCK
      ?auto_178477 - BLOCK
      ?auto_178479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178471 ?auto_178472 ) ) ( not ( = ?auto_178471 ?auto_178478 ) ) ( not ( = ?auto_178472 ?auto_178478 ) ) ( ON ?auto_178471 ?auto_178474 ) ( not ( = ?auto_178471 ?auto_178474 ) ) ( not ( = ?auto_178472 ?auto_178474 ) ) ( not ( = ?auto_178478 ?auto_178474 ) ) ( ON-TABLE ?auto_178473 ) ( ON ?auto_178476 ?auto_178473 ) ( ON ?auto_178475 ?auto_178476 ) ( ON ?auto_178477 ?auto_178475 ) ( ON ?auto_178479 ?auto_178477 ) ( not ( = ?auto_178473 ?auto_178476 ) ) ( not ( = ?auto_178473 ?auto_178475 ) ) ( not ( = ?auto_178473 ?auto_178477 ) ) ( not ( = ?auto_178473 ?auto_178479 ) ) ( not ( = ?auto_178473 ?auto_178478 ) ) ( not ( = ?auto_178473 ?auto_178472 ) ) ( not ( = ?auto_178476 ?auto_178475 ) ) ( not ( = ?auto_178476 ?auto_178477 ) ) ( not ( = ?auto_178476 ?auto_178479 ) ) ( not ( = ?auto_178476 ?auto_178478 ) ) ( not ( = ?auto_178476 ?auto_178472 ) ) ( not ( = ?auto_178475 ?auto_178477 ) ) ( not ( = ?auto_178475 ?auto_178479 ) ) ( not ( = ?auto_178475 ?auto_178478 ) ) ( not ( = ?auto_178475 ?auto_178472 ) ) ( not ( = ?auto_178477 ?auto_178479 ) ) ( not ( = ?auto_178477 ?auto_178478 ) ) ( not ( = ?auto_178477 ?auto_178472 ) ) ( not ( = ?auto_178479 ?auto_178478 ) ) ( not ( = ?auto_178479 ?auto_178472 ) ) ( not ( = ?auto_178471 ?auto_178473 ) ) ( not ( = ?auto_178471 ?auto_178476 ) ) ( not ( = ?auto_178471 ?auto_178475 ) ) ( not ( = ?auto_178471 ?auto_178477 ) ) ( not ( = ?auto_178471 ?auto_178479 ) ) ( not ( = ?auto_178474 ?auto_178473 ) ) ( not ( = ?auto_178474 ?auto_178476 ) ) ( not ( = ?auto_178474 ?auto_178475 ) ) ( not ( = ?auto_178474 ?auto_178477 ) ) ( not ( = ?auto_178474 ?auto_178479 ) ) ( ON ?auto_178472 ?auto_178471 ) ( CLEAR ?auto_178472 ) ( ON-TABLE ?auto_178474 ) ( HOLDING ?auto_178478 ) ( CLEAR ?auto_178479 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178473 ?auto_178476 ?auto_178475 ?auto_178477 ?auto_178479 ?auto_178478 )
      ( MAKE-2PILE ?auto_178471 ?auto_178472 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178480 - BLOCK
      ?auto_178481 - BLOCK
    )
    :vars
    (
      ?auto_178487 - BLOCK
      ?auto_178482 - BLOCK
      ?auto_178484 - BLOCK
      ?auto_178483 - BLOCK
      ?auto_178485 - BLOCK
      ?auto_178486 - BLOCK
      ?auto_178488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178480 ?auto_178481 ) ) ( not ( = ?auto_178480 ?auto_178487 ) ) ( not ( = ?auto_178481 ?auto_178487 ) ) ( ON ?auto_178480 ?auto_178482 ) ( not ( = ?auto_178480 ?auto_178482 ) ) ( not ( = ?auto_178481 ?auto_178482 ) ) ( not ( = ?auto_178487 ?auto_178482 ) ) ( ON-TABLE ?auto_178484 ) ( ON ?auto_178483 ?auto_178484 ) ( ON ?auto_178485 ?auto_178483 ) ( ON ?auto_178486 ?auto_178485 ) ( ON ?auto_178488 ?auto_178486 ) ( not ( = ?auto_178484 ?auto_178483 ) ) ( not ( = ?auto_178484 ?auto_178485 ) ) ( not ( = ?auto_178484 ?auto_178486 ) ) ( not ( = ?auto_178484 ?auto_178488 ) ) ( not ( = ?auto_178484 ?auto_178487 ) ) ( not ( = ?auto_178484 ?auto_178481 ) ) ( not ( = ?auto_178483 ?auto_178485 ) ) ( not ( = ?auto_178483 ?auto_178486 ) ) ( not ( = ?auto_178483 ?auto_178488 ) ) ( not ( = ?auto_178483 ?auto_178487 ) ) ( not ( = ?auto_178483 ?auto_178481 ) ) ( not ( = ?auto_178485 ?auto_178486 ) ) ( not ( = ?auto_178485 ?auto_178488 ) ) ( not ( = ?auto_178485 ?auto_178487 ) ) ( not ( = ?auto_178485 ?auto_178481 ) ) ( not ( = ?auto_178486 ?auto_178488 ) ) ( not ( = ?auto_178486 ?auto_178487 ) ) ( not ( = ?auto_178486 ?auto_178481 ) ) ( not ( = ?auto_178488 ?auto_178487 ) ) ( not ( = ?auto_178488 ?auto_178481 ) ) ( not ( = ?auto_178480 ?auto_178484 ) ) ( not ( = ?auto_178480 ?auto_178483 ) ) ( not ( = ?auto_178480 ?auto_178485 ) ) ( not ( = ?auto_178480 ?auto_178486 ) ) ( not ( = ?auto_178480 ?auto_178488 ) ) ( not ( = ?auto_178482 ?auto_178484 ) ) ( not ( = ?auto_178482 ?auto_178483 ) ) ( not ( = ?auto_178482 ?auto_178485 ) ) ( not ( = ?auto_178482 ?auto_178486 ) ) ( not ( = ?auto_178482 ?auto_178488 ) ) ( ON ?auto_178481 ?auto_178480 ) ( ON-TABLE ?auto_178482 ) ( CLEAR ?auto_178488 ) ( ON ?auto_178487 ?auto_178481 ) ( CLEAR ?auto_178487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178482 ?auto_178480 ?auto_178481 )
      ( MAKE-2PILE ?auto_178480 ?auto_178481 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178489 - BLOCK
      ?auto_178490 - BLOCK
    )
    :vars
    (
      ?auto_178491 - BLOCK
      ?auto_178497 - BLOCK
      ?auto_178496 - BLOCK
      ?auto_178494 - BLOCK
      ?auto_178493 - BLOCK
      ?auto_178492 - BLOCK
      ?auto_178495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178489 ?auto_178490 ) ) ( not ( = ?auto_178489 ?auto_178491 ) ) ( not ( = ?auto_178490 ?auto_178491 ) ) ( ON ?auto_178489 ?auto_178497 ) ( not ( = ?auto_178489 ?auto_178497 ) ) ( not ( = ?auto_178490 ?auto_178497 ) ) ( not ( = ?auto_178491 ?auto_178497 ) ) ( ON-TABLE ?auto_178496 ) ( ON ?auto_178494 ?auto_178496 ) ( ON ?auto_178493 ?auto_178494 ) ( ON ?auto_178492 ?auto_178493 ) ( not ( = ?auto_178496 ?auto_178494 ) ) ( not ( = ?auto_178496 ?auto_178493 ) ) ( not ( = ?auto_178496 ?auto_178492 ) ) ( not ( = ?auto_178496 ?auto_178495 ) ) ( not ( = ?auto_178496 ?auto_178491 ) ) ( not ( = ?auto_178496 ?auto_178490 ) ) ( not ( = ?auto_178494 ?auto_178493 ) ) ( not ( = ?auto_178494 ?auto_178492 ) ) ( not ( = ?auto_178494 ?auto_178495 ) ) ( not ( = ?auto_178494 ?auto_178491 ) ) ( not ( = ?auto_178494 ?auto_178490 ) ) ( not ( = ?auto_178493 ?auto_178492 ) ) ( not ( = ?auto_178493 ?auto_178495 ) ) ( not ( = ?auto_178493 ?auto_178491 ) ) ( not ( = ?auto_178493 ?auto_178490 ) ) ( not ( = ?auto_178492 ?auto_178495 ) ) ( not ( = ?auto_178492 ?auto_178491 ) ) ( not ( = ?auto_178492 ?auto_178490 ) ) ( not ( = ?auto_178495 ?auto_178491 ) ) ( not ( = ?auto_178495 ?auto_178490 ) ) ( not ( = ?auto_178489 ?auto_178496 ) ) ( not ( = ?auto_178489 ?auto_178494 ) ) ( not ( = ?auto_178489 ?auto_178493 ) ) ( not ( = ?auto_178489 ?auto_178492 ) ) ( not ( = ?auto_178489 ?auto_178495 ) ) ( not ( = ?auto_178497 ?auto_178496 ) ) ( not ( = ?auto_178497 ?auto_178494 ) ) ( not ( = ?auto_178497 ?auto_178493 ) ) ( not ( = ?auto_178497 ?auto_178492 ) ) ( not ( = ?auto_178497 ?auto_178495 ) ) ( ON ?auto_178490 ?auto_178489 ) ( ON-TABLE ?auto_178497 ) ( ON ?auto_178491 ?auto_178490 ) ( CLEAR ?auto_178491 ) ( HOLDING ?auto_178495 ) ( CLEAR ?auto_178492 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178496 ?auto_178494 ?auto_178493 ?auto_178492 ?auto_178495 )
      ( MAKE-2PILE ?auto_178489 ?auto_178490 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178498 - BLOCK
      ?auto_178499 - BLOCK
    )
    :vars
    (
      ?auto_178506 - BLOCK
      ?auto_178500 - BLOCK
      ?auto_178503 - BLOCK
      ?auto_178505 - BLOCK
      ?auto_178502 - BLOCK
      ?auto_178504 - BLOCK
      ?auto_178501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178498 ?auto_178499 ) ) ( not ( = ?auto_178498 ?auto_178506 ) ) ( not ( = ?auto_178499 ?auto_178506 ) ) ( ON ?auto_178498 ?auto_178500 ) ( not ( = ?auto_178498 ?auto_178500 ) ) ( not ( = ?auto_178499 ?auto_178500 ) ) ( not ( = ?auto_178506 ?auto_178500 ) ) ( ON-TABLE ?auto_178503 ) ( ON ?auto_178505 ?auto_178503 ) ( ON ?auto_178502 ?auto_178505 ) ( ON ?auto_178504 ?auto_178502 ) ( not ( = ?auto_178503 ?auto_178505 ) ) ( not ( = ?auto_178503 ?auto_178502 ) ) ( not ( = ?auto_178503 ?auto_178504 ) ) ( not ( = ?auto_178503 ?auto_178501 ) ) ( not ( = ?auto_178503 ?auto_178506 ) ) ( not ( = ?auto_178503 ?auto_178499 ) ) ( not ( = ?auto_178505 ?auto_178502 ) ) ( not ( = ?auto_178505 ?auto_178504 ) ) ( not ( = ?auto_178505 ?auto_178501 ) ) ( not ( = ?auto_178505 ?auto_178506 ) ) ( not ( = ?auto_178505 ?auto_178499 ) ) ( not ( = ?auto_178502 ?auto_178504 ) ) ( not ( = ?auto_178502 ?auto_178501 ) ) ( not ( = ?auto_178502 ?auto_178506 ) ) ( not ( = ?auto_178502 ?auto_178499 ) ) ( not ( = ?auto_178504 ?auto_178501 ) ) ( not ( = ?auto_178504 ?auto_178506 ) ) ( not ( = ?auto_178504 ?auto_178499 ) ) ( not ( = ?auto_178501 ?auto_178506 ) ) ( not ( = ?auto_178501 ?auto_178499 ) ) ( not ( = ?auto_178498 ?auto_178503 ) ) ( not ( = ?auto_178498 ?auto_178505 ) ) ( not ( = ?auto_178498 ?auto_178502 ) ) ( not ( = ?auto_178498 ?auto_178504 ) ) ( not ( = ?auto_178498 ?auto_178501 ) ) ( not ( = ?auto_178500 ?auto_178503 ) ) ( not ( = ?auto_178500 ?auto_178505 ) ) ( not ( = ?auto_178500 ?auto_178502 ) ) ( not ( = ?auto_178500 ?auto_178504 ) ) ( not ( = ?auto_178500 ?auto_178501 ) ) ( ON ?auto_178499 ?auto_178498 ) ( ON-TABLE ?auto_178500 ) ( ON ?auto_178506 ?auto_178499 ) ( CLEAR ?auto_178504 ) ( ON ?auto_178501 ?auto_178506 ) ( CLEAR ?auto_178501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178500 ?auto_178498 ?auto_178499 ?auto_178506 )
      ( MAKE-2PILE ?auto_178498 ?auto_178499 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178507 - BLOCK
      ?auto_178508 - BLOCK
    )
    :vars
    (
      ?auto_178513 - BLOCK
      ?auto_178514 - BLOCK
      ?auto_178510 - BLOCK
      ?auto_178511 - BLOCK
      ?auto_178509 - BLOCK
      ?auto_178512 - BLOCK
      ?auto_178515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178507 ?auto_178508 ) ) ( not ( = ?auto_178507 ?auto_178513 ) ) ( not ( = ?auto_178508 ?auto_178513 ) ) ( ON ?auto_178507 ?auto_178514 ) ( not ( = ?auto_178507 ?auto_178514 ) ) ( not ( = ?auto_178508 ?auto_178514 ) ) ( not ( = ?auto_178513 ?auto_178514 ) ) ( ON-TABLE ?auto_178510 ) ( ON ?auto_178511 ?auto_178510 ) ( ON ?auto_178509 ?auto_178511 ) ( not ( = ?auto_178510 ?auto_178511 ) ) ( not ( = ?auto_178510 ?auto_178509 ) ) ( not ( = ?auto_178510 ?auto_178512 ) ) ( not ( = ?auto_178510 ?auto_178515 ) ) ( not ( = ?auto_178510 ?auto_178513 ) ) ( not ( = ?auto_178510 ?auto_178508 ) ) ( not ( = ?auto_178511 ?auto_178509 ) ) ( not ( = ?auto_178511 ?auto_178512 ) ) ( not ( = ?auto_178511 ?auto_178515 ) ) ( not ( = ?auto_178511 ?auto_178513 ) ) ( not ( = ?auto_178511 ?auto_178508 ) ) ( not ( = ?auto_178509 ?auto_178512 ) ) ( not ( = ?auto_178509 ?auto_178515 ) ) ( not ( = ?auto_178509 ?auto_178513 ) ) ( not ( = ?auto_178509 ?auto_178508 ) ) ( not ( = ?auto_178512 ?auto_178515 ) ) ( not ( = ?auto_178512 ?auto_178513 ) ) ( not ( = ?auto_178512 ?auto_178508 ) ) ( not ( = ?auto_178515 ?auto_178513 ) ) ( not ( = ?auto_178515 ?auto_178508 ) ) ( not ( = ?auto_178507 ?auto_178510 ) ) ( not ( = ?auto_178507 ?auto_178511 ) ) ( not ( = ?auto_178507 ?auto_178509 ) ) ( not ( = ?auto_178507 ?auto_178512 ) ) ( not ( = ?auto_178507 ?auto_178515 ) ) ( not ( = ?auto_178514 ?auto_178510 ) ) ( not ( = ?auto_178514 ?auto_178511 ) ) ( not ( = ?auto_178514 ?auto_178509 ) ) ( not ( = ?auto_178514 ?auto_178512 ) ) ( not ( = ?auto_178514 ?auto_178515 ) ) ( ON ?auto_178508 ?auto_178507 ) ( ON-TABLE ?auto_178514 ) ( ON ?auto_178513 ?auto_178508 ) ( ON ?auto_178515 ?auto_178513 ) ( CLEAR ?auto_178515 ) ( HOLDING ?auto_178512 ) ( CLEAR ?auto_178509 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178510 ?auto_178511 ?auto_178509 ?auto_178512 )
      ( MAKE-2PILE ?auto_178507 ?auto_178508 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178516 - BLOCK
      ?auto_178517 - BLOCK
    )
    :vars
    (
      ?auto_178524 - BLOCK
      ?auto_178521 - BLOCK
      ?auto_178522 - BLOCK
      ?auto_178523 - BLOCK
      ?auto_178520 - BLOCK
      ?auto_178518 - BLOCK
      ?auto_178519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178516 ?auto_178517 ) ) ( not ( = ?auto_178516 ?auto_178524 ) ) ( not ( = ?auto_178517 ?auto_178524 ) ) ( ON ?auto_178516 ?auto_178521 ) ( not ( = ?auto_178516 ?auto_178521 ) ) ( not ( = ?auto_178517 ?auto_178521 ) ) ( not ( = ?auto_178524 ?auto_178521 ) ) ( ON-TABLE ?auto_178522 ) ( ON ?auto_178523 ?auto_178522 ) ( ON ?auto_178520 ?auto_178523 ) ( not ( = ?auto_178522 ?auto_178523 ) ) ( not ( = ?auto_178522 ?auto_178520 ) ) ( not ( = ?auto_178522 ?auto_178518 ) ) ( not ( = ?auto_178522 ?auto_178519 ) ) ( not ( = ?auto_178522 ?auto_178524 ) ) ( not ( = ?auto_178522 ?auto_178517 ) ) ( not ( = ?auto_178523 ?auto_178520 ) ) ( not ( = ?auto_178523 ?auto_178518 ) ) ( not ( = ?auto_178523 ?auto_178519 ) ) ( not ( = ?auto_178523 ?auto_178524 ) ) ( not ( = ?auto_178523 ?auto_178517 ) ) ( not ( = ?auto_178520 ?auto_178518 ) ) ( not ( = ?auto_178520 ?auto_178519 ) ) ( not ( = ?auto_178520 ?auto_178524 ) ) ( not ( = ?auto_178520 ?auto_178517 ) ) ( not ( = ?auto_178518 ?auto_178519 ) ) ( not ( = ?auto_178518 ?auto_178524 ) ) ( not ( = ?auto_178518 ?auto_178517 ) ) ( not ( = ?auto_178519 ?auto_178524 ) ) ( not ( = ?auto_178519 ?auto_178517 ) ) ( not ( = ?auto_178516 ?auto_178522 ) ) ( not ( = ?auto_178516 ?auto_178523 ) ) ( not ( = ?auto_178516 ?auto_178520 ) ) ( not ( = ?auto_178516 ?auto_178518 ) ) ( not ( = ?auto_178516 ?auto_178519 ) ) ( not ( = ?auto_178521 ?auto_178522 ) ) ( not ( = ?auto_178521 ?auto_178523 ) ) ( not ( = ?auto_178521 ?auto_178520 ) ) ( not ( = ?auto_178521 ?auto_178518 ) ) ( not ( = ?auto_178521 ?auto_178519 ) ) ( ON ?auto_178517 ?auto_178516 ) ( ON-TABLE ?auto_178521 ) ( ON ?auto_178524 ?auto_178517 ) ( ON ?auto_178519 ?auto_178524 ) ( CLEAR ?auto_178520 ) ( ON ?auto_178518 ?auto_178519 ) ( CLEAR ?auto_178518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178521 ?auto_178516 ?auto_178517 ?auto_178524 ?auto_178519 )
      ( MAKE-2PILE ?auto_178516 ?auto_178517 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178525 - BLOCK
      ?auto_178526 - BLOCK
    )
    :vars
    (
      ?auto_178529 - BLOCK
      ?auto_178533 - BLOCK
      ?auto_178532 - BLOCK
      ?auto_178530 - BLOCK
      ?auto_178527 - BLOCK
      ?auto_178531 - BLOCK
      ?auto_178528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178525 ?auto_178526 ) ) ( not ( = ?auto_178525 ?auto_178529 ) ) ( not ( = ?auto_178526 ?auto_178529 ) ) ( ON ?auto_178525 ?auto_178533 ) ( not ( = ?auto_178525 ?auto_178533 ) ) ( not ( = ?auto_178526 ?auto_178533 ) ) ( not ( = ?auto_178529 ?auto_178533 ) ) ( ON-TABLE ?auto_178532 ) ( ON ?auto_178530 ?auto_178532 ) ( not ( = ?auto_178532 ?auto_178530 ) ) ( not ( = ?auto_178532 ?auto_178527 ) ) ( not ( = ?auto_178532 ?auto_178531 ) ) ( not ( = ?auto_178532 ?auto_178528 ) ) ( not ( = ?auto_178532 ?auto_178529 ) ) ( not ( = ?auto_178532 ?auto_178526 ) ) ( not ( = ?auto_178530 ?auto_178527 ) ) ( not ( = ?auto_178530 ?auto_178531 ) ) ( not ( = ?auto_178530 ?auto_178528 ) ) ( not ( = ?auto_178530 ?auto_178529 ) ) ( not ( = ?auto_178530 ?auto_178526 ) ) ( not ( = ?auto_178527 ?auto_178531 ) ) ( not ( = ?auto_178527 ?auto_178528 ) ) ( not ( = ?auto_178527 ?auto_178529 ) ) ( not ( = ?auto_178527 ?auto_178526 ) ) ( not ( = ?auto_178531 ?auto_178528 ) ) ( not ( = ?auto_178531 ?auto_178529 ) ) ( not ( = ?auto_178531 ?auto_178526 ) ) ( not ( = ?auto_178528 ?auto_178529 ) ) ( not ( = ?auto_178528 ?auto_178526 ) ) ( not ( = ?auto_178525 ?auto_178532 ) ) ( not ( = ?auto_178525 ?auto_178530 ) ) ( not ( = ?auto_178525 ?auto_178527 ) ) ( not ( = ?auto_178525 ?auto_178531 ) ) ( not ( = ?auto_178525 ?auto_178528 ) ) ( not ( = ?auto_178533 ?auto_178532 ) ) ( not ( = ?auto_178533 ?auto_178530 ) ) ( not ( = ?auto_178533 ?auto_178527 ) ) ( not ( = ?auto_178533 ?auto_178531 ) ) ( not ( = ?auto_178533 ?auto_178528 ) ) ( ON ?auto_178526 ?auto_178525 ) ( ON-TABLE ?auto_178533 ) ( ON ?auto_178529 ?auto_178526 ) ( ON ?auto_178528 ?auto_178529 ) ( ON ?auto_178531 ?auto_178528 ) ( CLEAR ?auto_178531 ) ( HOLDING ?auto_178527 ) ( CLEAR ?auto_178530 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178532 ?auto_178530 ?auto_178527 )
      ( MAKE-2PILE ?auto_178525 ?auto_178526 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178534 - BLOCK
      ?auto_178535 - BLOCK
    )
    :vars
    (
      ?auto_178540 - BLOCK
      ?auto_178539 - BLOCK
      ?auto_178537 - BLOCK
      ?auto_178542 - BLOCK
      ?auto_178538 - BLOCK
      ?auto_178541 - BLOCK
      ?auto_178536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178534 ?auto_178535 ) ) ( not ( = ?auto_178534 ?auto_178540 ) ) ( not ( = ?auto_178535 ?auto_178540 ) ) ( ON ?auto_178534 ?auto_178539 ) ( not ( = ?auto_178534 ?auto_178539 ) ) ( not ( = ?auto_178535 ?auto_178539 ) ) ( not ( = ?auto_178540 ?auto_178539 ) ) ( ON-TABLE ?auto_178537 ) ( ON ?auto_178542 ?auto_178537 ) ( not ( = ?auto_178537 ?auto_178542 ) ) ( not ( = ?auto_178537 ?auto_178538 ) ) ( not ( = ?auto_178537 ?auto_178541 ) ) ( not ( = ?auto_178537 ?auto_178536 ) ) ( not ( = ?auto_178537 ?auto_178540 ) ) ( not ( = ?auto_178537 ?auto_178535 ) ) ( not ( = ?auto_178542 ?auto_178538 ) ) ( not ( = ?auto_178542 ?auto_178541 ) ) ( not ( = ?auto_178542 ?auto_178536 ) ) ( not ( = ?auto_178542 ?auto_178540 ) ) ( not ( = ?auto_178542 ?auto_178535 ) ) ( not ( = ?auto_178538 ?auto_178541 ) ) ( not ( = ?auto_178538 ?auto_178536 ) ) ( not ( = ?auto_178538 ?auto_178540 ) ) ( not ( = ?auto_178538 ?auto_178535 ) ) ( not ( = ?auto_178541 ?auto_178536 ) ) ( not ( = ?auto_178541 ?auto_178540 ) ) ( not ( = ?auto_178541 ?auto_178535 ) ) ( not ( = ?auto_178536 ?auto_178540 ) ) ( not ( = ?auto_178536 ?auto_178535 ) ) ( not ( = ?auto_178534 ?auto_178537 ) ) ( not ( = ?auto_178534 ?auto_178542 ) ) ( not ( = ?auto_178534 ?auto_178538 ) ) ( not ( = ?auto_178534 ?auto_178541 ) ) ( not ( = ?auto_178534 ?auto_178536 ) ) ( not ( = ?auto_178539 ?auto_178537 ) ) ( not ( = ?auto_178539 ?auto_178542 ) ) ( not ( = ?auto_178539 ?auto_178538 ) ) ( not ( = ?auto_178539 ?auto_178541 ) ) ( not ( = ?auto_178539 ?auto_178536 ) ) ( ON ?auto_178535 ?auto_178534 ) ( ON-TABLE ?auto_178539 ) ( ON ?auto_178540 ?auto_178535 ) ( ON ?auto_178536 ?auto_178540 ) ( ON ?auto_178541 ?auto_178536 ) ( CLEAR ?auto_178542 ) ( ON ?auto_178538 ?auto_178541 ) ( CLEAR ?auto_178538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178539 ?auto_178534 ?auto_178535 ?auto_178540 ?auto_178536 ?auto_178541 )
      ( MAKE-2PILE ?auto_178534 ?auto_178535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178543 - BLOCK
      ?auto_178544 - BLOCK
    )
    :vars
    (
      ?auto_178546 - BLOCK
      ?auto_178551 - BLOCK
      ?auto_178550 - BLOCK
      ?auto_178549 - BLOCK
      ?auto_178545 - BLOCK
      ?auto_178548 - BLOCK
      ?auto_178547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178543 ?auto_178544 ) ) ( not ( = ?auto_178543 ?auto_178546 ) ) ( not ( = ?auto_178544 ?auto_178546 ) ) ( ON ?auto_178543 ?auto_178551 ) ( not ( = ?auto_178543 ?auto_178551 ) ) ( not ( = ?auto_178544 ?auto_178551 ) ) ( not ( = ?auto_178546 ?auto_178551 ) ) ( ON-TABLE ?auto_178550 ) ( not ( = ?auto_178550 ?auto_178549 ) ) ( not ( = ?auto_178550 ?auto_178545 ) ) ( not ( = ?auto_178550 ?auto_178548 ) ) ( not ( = ?auto_178550 ?auto_178547 ) ) ( not ( = ?auto_178550 ?auto_178546 ) ) ( not ( = ?auto_178550 ?auto_178544 ) ) ( not ( = ?auto_178549 ?auto_178545 ) ) ( not ( = ?auto_178549 ?auto_178548 ) ) ( not ( = ?auto_178549 ?auto_178547 ) ) ( not ( = ?auto_178549 ?auto_178546 ) ) ( not ( = ?auto_178549 ?auto_178544 ) ) ( not ( = ?auto_178545 ?auto_178548 ) ) ( not ( = ?auto_178545 ?auto_178547 ) ) ( not ( = ?auto_178545 ?auto_178546 ) ) ( not ( = ?auto_178545 ?auto_178544 ) ) ( not ( = ?auto_178548 ?auto_178547 ) ) ( not ( = ?auto_178548 ?auto_178546 ) ) ( not ( = ?auto_178548 ?auto_178544 ) ) ( not ( = ?auto_178547 ?auto_178546 ) ) ( not ( = ?auto_178547 ?auto_178544 ) ) ( not ( = ?auto_178543 ?auto_178550 ) ) ( not ( = ?auto_178543 ?auto_178549 ) ) ( not ( = ?auto_178543 ?auto_178545 ) ) ( not ( = ?auto_178543 ?auto_178548 ) ) ( not ( = ?auto_178543 ?auto_178547 ) ) ( not ( = ?auto_178551 ?auto_178550 ) ) ( not ( = ?auto_178551 ?auto_178549 ) ) ( not ( = ?auto_178551 ?auto_178545 ) ) ( not ( = ?auto_178551 ?auto_178548 ) ) ( not ( = ?auto_178551 ?auto_178547 ) ) ( ON ?auto_178544 ?auto_178543 ) ( ON-TABLE ?auto_178551 ) ( ON ?auto_178546 ?auto_178544 ) ( ON ?auto_178547 ?auto_178546 ) ( ON ?auto_178548 ?auto_178547 ) ( ON ?auto_178545 ?auto_178548 ) ( CLEAR ?auto_178545 ) ( HOLDING ?auto_178549 ) ( CLEAR ?auto_178550 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178550 ?auto_178549 )
      ( MAKE-2PILE ?auto_178543 ?auto_178544 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178552 - BLOCK
      ?auto_178553 - BLOCK
    )
    :vars
    (
      ?auto_178557 - BLOCK
      ?auto_178555 - BLOCK
      ?auto_178554 - BLOCK
      ?auto_178556 - BLOCK
      ?auto_178560 - BLOCK
      ?auto_178559 - BLOCK
      ?auto_178558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178552 ?auto_178553 ) ) ( not ( = ?auto_178552 ?auto_178557 ) ) ( not ( = ?auto_178553 ?auto_178557 ) ) ( ON ?auto_178552 ?auto_178555 ) ( not ( = ?auto_178552 ?auto_178555 ) ) ( not ( = ?auto_178553 ?auto_178555 ) ) ( not ( = ?auto_178557 ?auto_178555 ) ) ( ON-TABLE ?auto_178554 ) ( not ( = ?auto_178554 ?auto_178556 ) ) ( not ( = ?auto_178554 ?auto_178560 ) ) ( not ( = ?auto_178554 ?auto_178559 ) ) ( not ( = ?auto_178554 ?auto_178558 ) ) ( not ( = ?auto_178554 ?auto_178557 ) ) ( not ( = ?auto_178554 ?auto_178553 ) ) ( not ( = ?auto_178556 ?auto_178560 ) ) ( not ( = ?auto_178556 ?auto_178559 ) ) ( not ( = ?auto_178556 ?auto_178558 ) ) ( not ( = ?auto_178556 ?auto_178557 ) ) ( not ( = ?auto_178556 ?auto_178553 ) ) ( not ( = ?auto_178560 ?auto_178559 ) ) ( not ( = ?auto_178560 ?auto_178558 ) ) ( not ( = ?auto_178560 ?auto_178557 ) ) ( not ( = ?auto_178560 ?auto_178553 ) ) ( not ( = ?auto_178559 ?auto_178558 ) ) ( not ( = ?auto_178559 ?auto_178557 ) ) ( not ( = ?auto_178559 ?auto_178553 ) ) ( not ( = ?auto_178558 ?auto_178557 ) ) ( not ( = ?auto_178558 ?auto_178553 ) ) ( not ( = ?auto_178552 ?auto_178554 ) ) ( not ( = ?auto_178552 ?auto_178556 ) ) ( not ( = ?auto_178552 ?auto_178560 ) ) ( not ( = ?auto_178552 ?auto_178559 ) ) ( not ( = ?auto_178552 ?auto_178558 ) ) ( not ( = ?auto_178555 ?auto_178554 ) ) ( not ( = ?auto_178555 ?auto_178556 ) ) ( not ( = ?auto_178555 ?auto_178560 ) ) ( not ( = ?auto_178555 ?auto_178559 ) ) ( not ( = ?auto_178555 ?auto_178558 ) ) ( ON ?auto_178553 ?auto_178552 ) ( ON-TABLE ?auto_178555 ) ( ON ?auto_178557 ?auto_178553 ) ( ON ?auto_178558 ?auto_178557 ) ( ON ?auto_178559 ?auto_178558 ) ( ON ?auto_178560 ?auto_178559 ) ( CLEAR ?auto_178554 ) ( ON ?auto_178556 ?auto_178560 ) ( CLEAR ?auto_178556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178555 ?auto_178552 ?auto_178553 ?auto_178557 ?auto_178558 ?auto_178559 ?auto_178560 )
      ( MAKE-2PILE ?auto_178552 ?auto_178553 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178561 - BLOCK
      ?auto_178562 - BLOCK
    )
    :vars
    (
      ?auto_178564 - BLOCK
      ?auto_178565 - BLOCK
      ?auto_178563 - BLOCK
      ?auto_178567 - BLOCK
      ?auto_178569 - BLOCK
      ?auto_178566 - BLOCK
      ?auto_178568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178561 ?auto_178562 ) ) ( not ( = ?auto_178561 ?auto_178564 ) ) ( not ( = ?auto_178562 ?auto_178564 ) ) ( ON ?auto_178561 ?auto_178565 ) ( not ( = ?auto_178561 ?auto_178565 ) ) ( not ( = ?auto_178562 ?auto_178565 ) ) ( not ( = ?auto_178564 ?auto_178565 ) ) ( not ( = ?auto_178563 ?auto_178567 ) ) ( not ( = ?auto_178563 ?auto_178569 ) ) ( not ( = ?auto_178563 ?auto_178566 ) ) ( not ( = ?auto_178563 ?auto_178568 ) ) ( not ( = ?auto_178563 ?auto_178564 ) ) ( not ( = ?auto_178563 ?auto_178562 ) ) ( not ( = ?auto_178567 ?auto_178569 ) ) ( not ( = ?auto_178567 ?auto_178566 ) ) ( not ( = ?auto_178567 ?auto_178568 ) ) ( not ( = ?auto_178567 ?auto_178564 ) ) ( not ( = ?auto_178567 ?auto_178562 ) ) ( not ( = ?auto_178569 ?auto_178566 ) ) ( not ( = ?auto_178569 ?auto_178568 ) ) ( not ( = ?auto_178569 ?auto_178564 ) ) ( not ( = ?auto_178569 ?auto_178562 ) ) ( not ( = ?auto_178566 ?auto_178568 ) ) ( not ( = ?auto_178566 ?auto_178564 ) ) ( not ( = ?auto_178566 ?auto_178562 ) ) ( not ( = ?auto_178568 ?auto_178564 ) ) ( not ( = ?auto_178568 ?auto_178562 ) ) ( not ( = ?auto_178561 ?auto_178563 ) ) ( not ( = ?auto_178561 ?auto_178567 ) ) ( not ( = ?auto_178561 ?auto_178569 ) ) ( not ( = ?auto_178561 ?auto_178566 ) ) ( not ( = ?auto_178561 ?auto_178568 ) ) ( not ( = ?auto_178565 ?auto_178563 ) ) ( not ( = ?auto_178565 ?auto_178567 ) ) ( not ( = ?auto_178565 ?auto_178569 ) ) ( not ( = ?auto_178565 ?auto_178566 ) ) ( not ( = ?auto_178565 ?auto_178568 ) ) ( ON ?auto_178562 ?auto_178561 ) ( ON-TABLE ?auto_178565 ) ( ON ?auto_178564 ?auto_178562 ) ( ON ?auto_178568 ?auto_178564 ) ( ON ?auto_178566 ?auto_178568 ) ( ON ?auto_178569 ?auto_178566 ) ( ON ?auto_178567 ?auto_178569 ) ( CLEAR ?auto_178567 ) ( HOLDING ?auto_178563 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178563 )
      ( MAKE-2PILE ?auto_178561 ?auto_178562 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178570 - BLOCK
      ?auto_178571 - BLOCK
    )
    :vars
    (
      ?auto_178572 - BLOCK
      ?auto_178574 - BLOCK
      ?auto_178577 - BLOCK
      ?auto_178578 - BLOCK
      ?auto_178573 - BLOCK
      ?auto_178575 - BLOCK
      ?auto_178576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178570 ?auto_178571 ) ) ( not ( = ?auto_178570 ?auto_178572 ) ) ( not ( = ?auto_178571 ?auto_178572 ) ) ( ON ?auto_178570 ?auto_178574 ) ( not ( = ?auto_178570 ?auto_178574 ) ) ( not ( = ?auto_178571 ?auto_178574 ) ) ( not ( = ?auto_178572 ?auto_178574 ) ) ( not ( = ?auto_178577 ?auto_178578 ) ) ( not ( = ?auto_178577 ?auto_178573 ) ) ( not ( = ?auto_178577 ?auto_178575 ) ) ( not ( = ?auto_178577 ?auto_178576 ) ) ( not ( = ?auto_178577 ?auto_178572 ) ) ( not ( = ?auto_178577 ?auto_178571 ) ) ( not ( = ?auto_178578 ?auto_178573 ) ) ( not ( = ?auto_178578 ?auto_178575 ) ) ( not ( = ?auto_178578 ?auto_178576 ) ) ( not ( = ?auto_178578 ?auto_178572 ) ) ( not ( = ?auto_178578 ?auto_178571 ) ) ( not ( = ?auto_178573 ?auto_178575 ) ) ( not ( = ?auto_178573 ?auto_178576 ) ) ( not ( = ?auto_178573 ?auto_178572 ) ) ( not ( = ?auto_178573 ?auto_178571 ) ) ( not ( = ?auto_178575 ?auto_178576 ) ) ( not ( = ?auto_178575 ?auto_178572 ) ) ( not ( = ?auto_178575 ?auto_178571 ) ) ( not ( = ?auto_178576 ?auto_178572 ) ) ( not ( = ?auto_178576 ?auto_178571 ) ) ( not ( = ?auto_178570 ?auto_178577 ) ) ( not ( = ?auto_178570 ?auto_178578 ) ) ( not ( = ?auto_178570 ?auto_178573 ) ) ( not ( = ?auto_178570 ?auto_178575 ) ) ( not ( = ?auto_178570 ?auto_178576 ) ) ( not ( = ?auto_178574 ?auto_178577 ) ) ( not ( = ?auto_178574 ?auto_178578 ) ) ( not ( = ?auto_178574 ?auto_178573 ) ) ( not ( = ?auto_178574 ?auto_178575 ) ) ( not ( = ?auto_178574 ?auto_178576 ) ) ( ON ?auto_178571 ?auto_178570 ) ( ON-TABLE ?auto_178574 ) ( ON ?auto_178572 ?auto_178571 ) ( ON ?auto_178576 ?auto_178572 ) ( ON ?auto_178575 ?auto_178576 ) ( ON ?auto_178573 ?auto_178575 ) ( ON ?auto_178578 ?auto_178573 ) ( ON ?auto_178577 ?auto_178578 ) ( CLEAR ?auto_178577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178574 ?auto_178570 ?auto_178571 ?auto_178572 ?auto_178576 ?auto_178575 ?auto_178573 ?auto_178578 )
      ( MAKE-2PILE ?auto_178570 ?auto_178571 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_178606 - BLOCK
      ?auto_178607 - BLOCK
      ?auto_178608 - BLOCK
      ?auto_178609 - BLOCK
      ?auto_178610 - BLOCK
    )
    :vars
    (
      ?auto_178611 - BLOCK
      ?auto_178613 - BLOCK
      ?auto_178612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178611 ?auto_178610 ) ( ON-TABLE ?auto_178606 ) ( ON ?auto_178607 ?auto_178606 ) ( ON ?auto_178608 ?auto_178607 ) ( ON ?auto_178609 ?auto_178608 ) ( ON ?auto_178610 ?auto_178609 ) ( not ( = ?auto_178606 ?auto_178607 ) ) ( not ( = ?auto_178606 ?auto_178608 ) ) ( not ( = ?auto_178606 ?auto_178609 ) ) ( not ( = ?auto_178606 ?auto_178610 ) ) ( not ( = ?auto_178606 ?auto_178611 ) ) ( not ( = ?auto_178607 ?auto_178608 ) ) ( not ( = ?auto_178607 ?auto_178609 ) ) ( not ( = ?auto_178607 ?auto_178610 ) ) ( not ( = ?auto_178607 ?auto_178611 ) ) ( not ( = ?auto_178608 ?auto_178609 ) ) ( not ( = ?auto_178608 ?auto_178610 ) ) ( not ( = ?auto_178608 ?auto_178611 ) ) ( not ( = ?auto_178609 ?auto_178610 ) ) ( not ( = ?auto_178609 ?auto_178611 ) ) ( not ( = ?auto_178610 ?auto_178611 ) ) ( not ( = ?auto_178606 ?auto_178613 ) ) ( not ( = ?auto_178606 ?auto_178612 ) ) ( not ( = ?auto_178607 ?auto_178613 ) ) ( not ( = ?auto_178607 ?auto_178612 ) ) ( not ( = ?auto_178608 ?auto_178613 ) ) ( not ( = ?auto_178608 ?auto_178612 ) ) ( not ( = ?auto_178609 ?auto_178613 ) ) ( not ( = ?auto_178609 ?auto_178612 ) ) ( not ( = ?auto_178610 ?auto_178613 ) ) ( not ( = ?auto_178610 ?auto_178612 ) ) ( not ( = ?auto_178611 ?auto_178613 ) ) ( not ( = ?auto_178611 ?auto_178612 ) ) ( not ( = ?auto_178613 ?auto_178612 ) ) ( ON ?auto_178613 ?auto_178611 ) ( CLEAR ?auto_178613 ) ( HOLDING ?auto_178612 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178612 )
      ( MAKE-5PILE ?auto_178606 ?auto_178607 ?auto_178608 ?auto_178609 ?auto_178610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178719 - BLOCK
      ?auto_178720 - BLOCK
      ?auto_178721 - BLOCK
    )
    :vars
    (
      ?auto_178722 - BLOCK
      ?auto_178725 - BLOCK
      ?auto_178724 - BLOCK
      ?auto_178723 - BLOCK
      ?auto_178726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178719 ) ( not ( = ?auto_178719 ?auto_178720 ) ) ( not ( = ?auto_178719 ?auto_178721 ) ) ( not ( = ?auto_178720 ?auto_178721 ) ) ( ON ?auto_178721 ?auto_178722 ) ( not ( = ?auto_178719 ?auto_178722 ) ) ( not ( = ?auto_178720 ?auto_178722 ) ) ( not ( = ?auto_178721 ?auto_178722 ) ) ( CLEAR ?auto_178719 ) ( ON ?auto_178720 ?auto_178721 ) ( CLEAR ?auto_178720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178725 ) ( ON ?auto_178724 ?auto_178725 ) ( ON ?auto_178723 ?auto_178724 ) ( ON ?auto_178726 ?auto_178723 ) ( ON ?auto_178722 ?auto_178726 ) ( not ( = ?auto_178725 ?auto_178724 ) ) ( not ( = ?auto_178725 ?auto_178723 ) ) ( not ( = ?auto_178725 ?auto_178726 ) ) ( not ( = ?auto_178725 ?auto_178722 ) ) ( not ( = ?auto_178725 ?auto_178721 ) ) ( not ( = ?auto_178725 ?auto_178720 ) ) ( not ( = ?auto_178724 ?auto_178723 ) ) ( not ( = ?auto_178724 ?auto_178726 ) ) ( not ( = ?auto_178724 ?auto_178722 ) ) ( not ( = ?auto_178724 ?auto_178721 ) ) ( not ( = ?auto_178724 ?auto_178720 ) ) ( not ( = ?auto_178723 ?auto_178726 ) ) ( not ( = ?auto_178723 ?auto_178722 ) ) ( not ( = ?auto_178723 ?auto_178721 ) ) ( not ( = ?auto_178723 ?auto_178720 ) ) ( not ( = ?auto_178726 ?auto_178722 ) ) ( not ( = ?auto_178726 ?auto_178721 ) ) ( not ( = ?auto_178726 ?auto_178720 ) ) ( not ( = ?auto_178719 ?auto_178725 ) ) ( not ( = ?auto_178719 ?auto_178724 ) ) ( not ( = ?auto_178719 ?auto_178723 ) ) ( not ( = ?auto_178719 ?auto_178726 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178725 ?auto_178724 ?auto_178723 ?auto_178726 ?auto_178722 ?auto_178721 )
      ( MAKE-3PILE ?auto_178719 ?auto_178720 ?auto_178721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178727 - BLOCK
      ?auto_178728 - BLOCK
      ?auto_178729 - BLOCK
    )
    :vars
    (
      ?auto_178734 - BLOCK
      ?auto_178730 - BLOCK
      ?auto_178731 - BLOCK
      ?auto_178733 - BLOCK
      ?auto_178732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178727 ?auto_178728 ) ) ( not ( = ?auto_178727 ?auto_178729 ) ) ( not ( = ?auto_178728 ?auto_178729 ) ) ( ON ?auto_178729 ?auto_178734 ) ( not ( = ?auto_178727 ?auto_178734 ) ) ( not ( = ?auto_178728 ?auto_178734 ) ) ( not ( = ?auto_178729 ?auto_178734 ) ) ( ON ?auto_178728 ?auto_178729 ) ( CLEAR ?auto_178728 ) ( ON-TABLE ?auto_178730 ) ( ON ?auto_178731 ?auto_178730 ) ( ON ?auto_178733 ?auto_178731 ) ( ON ?auto_178732 ?auto_178733 ) ( ON ?auto_178734 ?auto_178732 ) ( not ( = ?auto_178730 ?auto_178731 ) ) ( not ( = ?auto_178730 ?auto_178733 ) ) ( not ( = ?auto_178730 ?auto_178732 ) ) ( not ( = ?auto_178730 ?auto_178734 ) ) ( not ( = ?auto_178730 ?auto_178729 ) ) ( not ( = ?auto_178730 ?auto_178728 ) ) ( not ( = ?auto_178731 ?auto_178733 ) ) ( not ( = ?auto_178731 ?auto_178732 ) ) ( not ( = ?auto_178731 ?auto_178734 ) ) ( not ( = ?auto_178731 ?auto_178729 ) ) ( not ( = ?auto_178731 ?auto_178728 ) ) ( not ( = ?auto_178733 ?auto_178732 ) ) ( not ( = ?auto_178733 ?auto_178734 ) ) ( not ( = ?auto_178733 ?auto_178729 ) ) ( not ( = ?auto_178733 ?auto_178728 ) ) ( not ( = ?auto_178732 ?auto_178734 ) ) ( not ( = ?auto_178732 ?auto_178729 ) ) ( not ( = ?auto_178732 ?auto_178728 ) ) ( not ( = ?auto_178727 ?auto_178730 ) ) ( not ( = ?auto_178727 ?auto_178731 ) ) ( not ( = ?auto_178727 ?auto_178733 ) ) ( not ( = ?auto_178727 ?auto_178732 ) ) ( HOLDING ?auto_178727 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178727 )
      ( MAKE-3PILE ?auto_178727 ?auto_178728 ?auto_178729 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178735 - BLOCK
      ?auto_178736 - BLOCK
      ?auto_178737 - BLOCK
    )
    :vars
    (
      ?auto_178738 - BLOCK
      ?auto_178742 - BLOCK
      ?auto_178739 - BLOCK
      ?auto_178740 - BLOCK
      ?auto_178741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178735 ?auto_178736 ) ) ( not ( = ?auto_178735 ?auto_178737 ) ) ( not ( = ?auto_178736 ?auto_178737 ) ) ( ON ?auto_178737 ?auto_178738 ) ( not ( = ?auto_178735 ?auto_178738 ) ) ( not ( = ?auto_178736 ?auto_178738 ) ) ( not ( = ?auto_178737 ?auto_178738 ) ) ( ON ?auto_178736 ?auto_178737 ) ( ON-TABLE ?auto_178742 ) ( ON ?auto_178739 ?auto_178742 ) ( ON ?auto_178740 ?auto_178739 ) ( ON ?auto_178741 ?auto_178740 ) ( ON ?auto_178738 ?auto_178741 ) ( not ( = ?auto_178742 ?auto_178739 ) ) ( not ( = ?auto_178742 ?auto_178740 ) ) ( not ( = ?auto_178742 ?auto_178741 ) ) ( not ( = ?auto_178742 ?auto_178738 ) ) ( not ( = ?auto_178742 ?auto_178737 ) ) ( not ( = ?auto_178742 ?auto_178736 ) ) ( not ( = ?auto_178739 ?auto_178740 ) ) ( not ( = ?auto_178739 ?auto_178741 ) ) ( not ( = ?auto_178739 ?auto_178738 ) ) ( not ( = ?auto_178739 ?auto_178737 ) ) ( not ( = ?auto_178739 ?auto_178736 ) ) ( not ( = ?auto_178740 ?auto_178741 ) ) ( not ( = ?auto_178740 ?auto_178738 ) ) ( not ( = ?auto_178740 ?auto_178737 ) ) ( not ( = ?auto_178740 ?auto_178736 ) ) ( not ( = ?auto_178741 ?auto_178738 ) ) ( not ( = ?auto_178741 ?auto_178737 ) ) ( not ( = ?auto_178741 ?auto_178736 ) ) ( not ( = ?auto_178735 ?auto_178742 ) ) ( not ( = ?auto_178735 ?auto_178739 ) ) ( not ( = ?auto_178735 ?auto_178740 ) ) ( not ( = ?auto_178735 ?auto_178741 ) ) ( ON ?auto_178735 ?auto_178736 ) ( CLEAR ?auto_178735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178742 ?auto_178739 ?auto_178740 ?auto_178741 ?auto_178738 ?auto_178737 ?auto_178736 )
      ( MAKE-3PILE ?auto_178735 ?auto_178736 ?auto_178737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178746 - BLOCK
      ?auto_178747 - BLOCK
      ?auto_178748 - BLOCK
    )
    :vars
    (
      ?auto_178752 - BLOCK
      ?auto_178751 - BLOCK
      ?auto_178753 - BLOCK
      ?auto_178750 - BLOCK
      ?auto_178749 - BLOCK
      ?auto_178754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178746 ?auto_178747 ) ) ( not ( = ?auto_178746 ?auto_178748 ) ) ( not ( = ?auto_178747 ?auto_178748 ) ) ( ON ?auto_178748 ?auto_178752 ) ( not ( = ?auto_178746 ?auto_178752 ) ) ( not ( = ?auto_178747 ?auto_178752 ) ) ( not ( = ?auto_178748 ?auto_178752 ) ) ( ON ?auto_178747 ?auto_178748 ) ( CLEAR ?auto_178747 ) ( ON-TABLE ?auto_178751 ) ( ON ?auto_178753 ?auto_178751 ) ( ON ?auto_178750 ?auto_178753 ) ( ON ?auto_178749 ?auto_178750 ) ( ON ?auto_178752 ?auto_178749 ) ( not ( = ?auto_178751 ?auto_178753 ) ) ( not ( = ?auto_178751 ?auto_178750 ) ) ( not ( = ?auto_178751 ?auto_178749 ) ) ( not ( = ?auto_178751 ?auto_178752 ) ) ( not ( = ?auto_178751 ?auto_178748 ) ) ( not ( = ?auto_178751 ?auto_178747 ) ) ( not ( = ?auto_178753 ?auto_178750 ) ) ( not ( = ?auto_178753 ?auto_178749 ) ) ( not ( = ?auto_178753 ?auto_178752 ) ) ( not ( = ?auto_178753 ?auto_178748 ) ) ( not ( = ?auto_178753 ?auto_178747 ) ) ( not ( = ?auto_178750 ?auto_178749 ) ) ( not ( = ?auto_178750 ?auto_178752 ) ) ( not ( = ?auto_178750 ?auto_178748 ) ) ( not ( = ?auto_178750 ?auto_178747 ) ) ( not ( = ?auto_178749 ?auto_178752 ) ) ( not ( = ?auto_178749 ?auto_178748 ) ) ( not ( = ?auto_178749 ?auto_178747 ) ) ( not ( = ?auto_178746 ?auto_178751 ) ) ( not ( = ?auto_178746 ?auto_178753 ) ) ( not ( = ?auto_178746 ?auto_178750 ) ) ( not ( = ?auto_178746 ?auto_178749 ) ) ( ON ?auto_178746 ?auto_178754 ) ( CLEAR ?auto_178746 ) ( HAND-EMPTY ) ( not ( = ?auto_178746 ?auto_178754 ) ) ( not ( = ?auto_178747 ?auto_178754 ) ) ( not ( = ?auto_178748 ?auto_178754 ) ) ( not ( = ?auto_178752 ?auto_178754 ) ) ( not ( = ?auto_178751 ?auto_178754 ) ) ( not ( = ?auto_178753 ?auto_178754 ) ) ( not ( = ?auto_178750 ?auto_178754 ) ) ( not ( = ?auto_178749 ?auto_178754 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178746 ?auto_178754 )
      ( MAKE-3PILE ?auto_178746 ?auto_178747 ?auto_178748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178755 - BLOCK
      ?auto_178756 - BLOCK
      ?auto_178757 - BLOCK
    )
    :vars
    (
      ?auto_178762 - BLOCK
      ?auto_178759 - BLOCK
      ?auto_178763 - BLOCK
      ?auto_178761 - BLOCK
      ?auto_178760 - BLOCK
      ?auto_178758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178755 ?auto_178756 ) ) ( not ( = ?auto_178755 ?auto_178757 ) ) ( not ( = ?auto_178756 ?auto_178757 ) ) ( ON ?auto_178757 ?auto_178762 ) ( not ( = ?auto_178755 ?auto_178762 ) ) ( not ( = ?auto_178756 ?auto_178762 ) ) ( not ( = ?auto_178757 ?auto_178762 ) ) ( ON-TABLE ?auto_178759 ) ( ON ?auto_178763 ?auto_178759 ) ( ON ?auto_178761 ?auto_178763 ) ( ON ?auto_178760 ?auto_178761 ) ( ON ?auto_178762 ?auto_178760 ) ( not ( = ?auto_178759 ?auto_178763 ) ) ( not ( = ?auto_178759 ?auto_178761 ) ) ( not ( = ?auto_178759 ?auto_178760 ) ) ( not ( = ?auto_178759 ?auto_178762 ) ) ( not ( = ?auto_178759 ?auto_178757 ) ) ( not ( = ?auto_178759 ?auto_178756 ) ) ( not ( = ?auto_178763 ?auto_178761 ) ) ( not ( = ?auto_178763 ?auto_178760 ) ) ( not ( = ?auto_178763 ?auto_178762 ) ) ( not ( = ?auto_178763 ?auto_178757 ) ) ( not ( = ?auto_178763 ?auto_178756 ) ) ( not ( = ?auto_178761 ?auto_178760 ) ) ( not ( = ?auto_178761 ?auto_178762 ) ) ( not ( = ?auto_178761 ?auto_178757 ) ) ( not ( = ?auto_178761 ?auto_178756 ) ) ( not ( = ?auto_178760 ?auto_178762 ) ) ( not ( = ?auto_178760 ?auto_178757 ) ) ( not ( = ?auto_178760 ?auto_178756 ) ) ( not ( = ?auto_178755 ?auto_178759 ) ) ( not ( = ?auto_178755 ?auto_178763 ) ) ( not ( = ?auto_178755 ?auto_178761 ) ) ( not ( = ?auto_178755 ?auto_178760 ) ) ( ON ?auto_178755 ?auto_178758 ) ( CLEAR ?auto_178755 ) ( not ( = ?auto_178755 ?auto_178758 ) ) ( not ( = ?auto_178756 ?auto_178758 ) ) ( not ( = ?auto_178757 ?auto_178758 ) ) ( not ( = ?auto_178762 ?auto_178758 ) ) ( not ( = ?auto_178759 ?auto_178758 ) ) ( not ( = ?auto_178763 ?auto_178758 ) ) ( not ( = ?auto_178761 ?auto_178758 ) ) ( not ( = ?auto_178760 ?auto_178758 ) ) ( HOLDING ?auto_178756 ) ( CLEAR ?auto_178757 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178759 ?auto_178763 ?auto_178761 ?auto_178760 ?auto_178762 ?auto_178757 ?auto_178756 )
      ( MAKE-3PILE ?auto_178755 ?auto_178756 ?auto_178757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178764 - BLOCK
      ?auto_178765 - BLOCK
      ?auto_178766 - BLOCK
    )
    :vars
    (
      ?auto_178768 - BLOCK
      ?auto_178771 - BLOCK
      ?auto_178767 - BLOCK
      ?auto_178769 - BLOCK
      ?auto_178770 - BLOCK
      ?auto_178772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178764 ?auto_178765 ) ) ( not ( = ?auto_178764 ?auto_178766 ) ) ( not ( = ?auto_178765 ?auto_178766 ) ) ( ON ?auto_178766 ?auto_178768 ) ( not ( = ?auto_178764 ?auto_178768 ) ) ( not ( = ?auto_178765 ?auto_178768 ) ) ( not ( = ?auto_178766 ?auto_178768 ) ) ( ON-TABLE ?auto_178771 ) ( ON ?auto_178767 ?auto_178771 ) ( ON ?auto_178769 ?auto_178767 ) ( ON ?auto_178770 ?auto_178769 ) ( ON ?auto_178768 ?auto_178770 ) ( not ( = ?auto_178771 ?auto_178767 ) ) ( not ( = ?auto_178771 ?auto_178769 ) ) ( not ( = ?auto_178771 ?auto_178770 ) ) ( not ( = ?auto_178771 ?auto_178768 ) ) ( not ( = ?auto_178771 ?auto_178766 ) ) ( not ( = ?auto_178771 ?auto_178765 ) ) ( not ( = ?auto_178767 ?auto_178769 ) ) ( not ( = ?auto_178767 ?auto_178770 ) ) ( not ( = ?auto_178767 ?auto_178768 ) ) ( not ( = ?auto_178767 ?auto_178766 ) ) ( not ( = ?auto_178767 ?auto_178765 ) ) ( not ( = ?auto_178769 ?auto_178770 ) ) ( not ( = ?auto_178769 ?auto_178768 ) ) ( not ( = ?auto_178769 ?auto_178766 ) ) ( not ( = ?auto_178769 ?auto_178765 ) ) ( not ( = ?auto_178770 ?auto_178768 ) ) ( not ( = ?auto_178770 ?auto_178766 ) ) ( not ( = ?auto_178770 ?auto_178765 ) ) ( not ( = ?auto_178764 ?auto_178771 ) ) ( not ( = ?auto_178764 ?auto_178767 ) ) ( not ( = ?auto_178764 ?auto_178769 ) ) ( not ( = ?auto_178764 ?auto_178770 ) ) ( ON ?auto_178764 ?auto_178772 ) ( not ( = ?auto_178764 ?auto_178772 ) ) ( not ( = ?auto_178765 ?auto_178772 ) ) ( not ( = ?auto_178766 ?auto_178772 ) ) ( not ( = ?auto_178768 ?auto_178772 ) ) ( not ( = ?auto_178771 ?auto_178772 ) ) ( not ( = ?auto_178767 ?auto_178772 ) ) ( not ( = ?auto_178769 ?auto_178772 ) ) ( not ( = ?auto_178770 ?auto_178772 ) ) ( CLEAR ?auto_178766 ) ( ON ?auto_178765 ?auto_178764 ) ( CLEAR ?auto_178765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178772 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178772 ?auto_178764 )
      ( MAKE-3PILE ?auto_178764 ?auto_178765 ?auto_178766 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178773 - BLOCK
      ?auto_178774 - BLOCK
      ?auto_178775 - BLOCK
    )
    :vars
    (
      ?auto_178777 - BLOCK
      ?auto_178779 - BLOCK
      ?auto_178776 - BLOCK
      ?auto_178780 - BLOCK
      ?auto_178781 - BLOCK
      ?auto_178778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178773 ?auto_178774 ) ) ( not ( = ?auto_178773 ?auto_178775 ) ) ( not ( = ?auto_178774 ?auto_178775 ) ) ( not ( = ?auto_178773 ?auto_178777 ) ) ( not ( = ?auto_178774 ?auto_178777 ) ) ( not ( = ?auto_178775 ?auto_178777 ) ) ( ON-TABLE ?auto_178779 ) ( ON ?auto_178776 ?auto_178779 ) ( ON ?auto_178780 ?auto_178776 ) ( ON ?auto_178781 ?auto_178780 ) ( ON ?auto_178777 ?auto_178781 ) ( not ( = ?auto_178779 ?auto_178776 ) ) ( not ( = ?auto_178779 ?auto_178780 ) ) ( not ( = ?auto_178779 ?auto_178781 ) ) ( not ( = ?auto_178779 ?auto_178777 ) ) ( not ( = ?auto_178779 ?auto_178775 ) ) ( not ( = ?auto_178779 ?auto_178774 ) ) ( not ( = ?auto_178776 ?auto_178780 ) ) ( not ( = ?auto_178776 ?auto_178781 ) ) ( not ( = ?auto_178776 ?auto_178777 ) ) ( not ( = ?auto_178776 ?auto_178775 ) ) ( not ( = ?auto_178776 ?auto_178774 ) ) ( not ( = ?auto_178780 ?auto_178781 ) ) ( not ( = ?auto_178780 ?auto_178777 ) ) ( not ( = ?auto_178780 ?auto_178775 ) ) ( not ( = ?auto_178780 ?auto_178774 ) ) ( not ( = ?auto_178781 ?auto_178777 ) ) ( not ( = ?auto_178781 ?auto_178775 ) ) ( not ( = ?auto_178781 ?auto_178774 ) ) ( not ( = ?auto_178773 ?auto_178779 ) ) ( not ( = ?auto_178773 ?auto_178776 ) ) ( not ( = ?auto_178773 ?auto_178780 ) ) ( not ( = ?auto_178773 ?auto_178781 ) ) ( ON ?auto_178773 ?auto_178778 ) ( not ( = ?auto_178773 ?auto_178778 ) ) ( not ( = ?auto_178774 ?auto_178778 ) ) ( not ( = ?auto_178775 ?auto_178778 ) ) ( not ( = ?auto_178777 ?auto_178778 ) ) ( not ( = ?auto_178779 ?auto_178778 ) ) ( not ( = ?auto_178776 ?auto_178778 ) ) ( not ( = ?auto_178780 ?auto_178778 ) ) ( not ( = ?auto_178781 ?auto_178778 ) ) ( ON ?auto_178774 ?auto_178773 ) ( CLEAR ?auto_178774 ) ( ON-TABLE ?auto_178778 ) ( HOLDING ?auto_178775 ) ( CLEAR ?auto_178777 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178779 ?auto_178776 ?auto_178780 ?auto_178781 ?auto_178777 ?auto_178775 )
      ( MAKE-3PILE ?auto_178773 ?auto_178774 ?auto_178775 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178782 - BLOCK
      ?auto_178783 - BLOCK
      ?auto_178784 - BLOCK
    )
    :vars
    (
      ?auto_178789 - BLOCK
      ?auto_178786 - BLOCK
      ?auto_178785 - BLOCK
      ?auto_178788 - BLOCK
      ?auto_178790 - BLOCK
      ?auto_178787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178782 ?auto_178783 ) ) ( not ( = ?auto_178782 ?auto_178784 ) ) ( not ( = ?auto_178783 ?auto_178784 ) ) ( not ( = ?auto_178782 ?auto_178789 ) ) ( not ( = ?auto_178783 ?auto_178789 ) ) ( not ( = ?auto_178784 ?auto_178789 ) ) ( ON-TABLE ?auto_178786 ) ( ON ?auto_178785 ?auto_178786 ) ( ON ?auto_178788 ?auto_178785 ) ( ON ?auto_178790 ?auto_178788 ) ( ON ?auto_178789 ?auto_178790 ) ( not ( = ?auto_178786 ?auto_178785 ) ) ( not ( = ?auto_178786 ?auto_178788 ) ) ( not ( = ?auto_178786 ?auto_178790 ) ) ( not ( = ?auto_178786 ?auto_178789 ) ) ( not ( = ?auto_178786 ?auto_178784 ) ) ( not ( = ?auto_178786 ?auto_178783 ) ) ( not ( = ?auto_178785 ?auto_178788 ) ) ( not ( = ?auto_178785 ?auto_178790 ) ) ( not ( = ?auto_178785 ?auto_178789 ) ) ( not ( = ?auto_178785 ?auto_178784 ) ) ( not ( = ?auto_178785 ?auto_178783 ) ) ( not ( = ?auto_178788 ?auto_178790 ) ) ( not ( = ?auto_178788 ?auto_178789 ) ) ( not ( = ?auto_178788 ?auto_178784 ) ) ( not ( = ?auto_178788 ?auto_178783 ) ) ( not ( = ?auto_178790 ?auto_178789 ) ) ( not ( = ?auto_178790 ?auto_178784 ) ) ( not ( = ?auto_178790 ?auto_178783 ) ) ( not ( = ?auto_178782 ?auto_178786 ) ) ( not ( = ?auto_178782 ?auto_178785 ) ) ( not ( = ?auto_178782 ?auto_178788 ) ) ( not ( = ?auto_178782 ?auto_178790 ) ) ( ON ?auto_178782 ?auto_178787 ) ( not ( = ?auto_178782 ?auto_178787 ) ) ( not ( = ?auto_178783 ?auto_178787 ) ) ( not ( = ?auto_178784 ?auto_178787 ) ) ( not ( = ?auto_178789 ?auto_178787 ) ) ( not ( = ?auto_178786 ?auto_178787 ) ) ( not ( = ?auto_178785 ?auto_178787 ) ) ( not ( = ?auto_178788 ?auto_178787 ) ) ( not ( = ?auto_178790 ?auto_178787 ) ) ( ON ?auto_178783 ?auto_178782 ) ( ON-TABLE ?auto_178787 ) ( CLEAR ?auto_178789 ) ( ON ?auto_178784 ?auto_178783 ) ( CLEAR ?auto_178784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178787 ?auto_178782 ?auto_178783 )
      ( MAKE-3PILE ?auto_178782 ?auto_178783 ?auto_178784 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178791 - BLOCK
      ?auto_178792 - BLOCK
      ?auto_178793 - BLOCK
    )
    :vars
    (
      ?auto_178797 - BLOCK
      ?auto_178799 - BLOCK
      ?auto_178798 - BLOCK
      ?auto_178795 - BLOCK
      ?auto_178796 - BLOCK
      ?auto_178794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178791 ?auto_178792 ) ) ( not ( = ?auto_178791 ?auto_178793 ) ) ( not ( = ?auto_178792 ?auto_178793 ) ) ( not ( = ?auto_178791 ?auto_178797 ) ) ( not ( = ?auto_178792 ?auto_178797 ) ) ( not ( = ?auto_178793 ?auto_178797 ) ) ( ON-TABLE ?auto_178799 ) ( ON ?auto_178798 ?auto_178799 ) ( ON ?auto_178795 ?auto_178798 ) ( ON ?auto_178796 ?auto_178795 ) ( not ( = ?auto_178799 ?auto_178798 ) ) ( not ( = ?auto_178799 ?auto_178795 ) ) ( not ( = ?auto_178799 ?auto_178796 ) ) ( not ( = ?auto_178799 ?auto_178797 ) ) ( not ( = ?auto_178799 ?auto_178793 ) ) ( not ( = ?auto_178799 ?auto_178792 ) ) ( not ( = ?auto_178798 ?auto_178795 ) ) ( not ( = ?auto_178798 ?auto_178796 ) ) ( not ( = ?auto_178798 ?auto_178797 ) ) ( not ( = ?auto_178798 ?auto_178793 ) ) ( not ( = ?auto_178798 ?auto_178792 ) ) ( not ( = ?auto_178795 ?auto_178796 ) ) ( not ( = ?auto_178795 ?auto_178797 ) ) ( not ( = ?auto_178795 ?auto_178793 ) ) ( not ( = ?auto_178795 ?auto_178792 ) ) ( not ( = ?auto_178796 ?auto_178797 ) ) ( not ( = ?auto_178796 ?auto_178793 ) ) ( not ( = ?auto_178796 ?auto_178792 ) ) ( not ( = ?auto_178791 ?auto_178799 ) ) ( not ( = ?auto_178791 ?auto_178798 ) ) ( not ( = ?auto_178791 ?auto_178795 ) ) ( not ( = ?auto_178791 ?auto_178796 ) ) ( ON ?auto_178791 ?auto_178794 ) ( not ( = ?auto_178791 ?auto_178794 ) ) ( not ( = ?auto_178792 ?auto_178794 ) ) ( not ( = ?auto_178793 ?auto_178794 ) ) ( not ( = ?auto_178797 ?auto_178794 ) ) ( not ( = ?auto_178799 ?auto_178794 ) ) ( not ( = ?auto_178798 ?auto_178794 ) ) ( not ( = ?auto_178795 ?auto_178794 ) ) ( not ( = ?auto_178796 ?auto_178794 ) ) ( ON ?auto_178792 ?auto_178791 ) ( ON-TABLE ?auto_178794 ) ( ON ?auto_178793 ?auto_178792 ) ( CLEAR ?auto_178793 ) ( HOLDING ?auto_178797 ) ( CLEAR ?auto_178796 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178799 ?auto_178798 ?auto_178795 ?auto_178796 ?auto_178797 )
      ( MAKE-3PILE ?auto_178791 ?auto_178792 ?auto_178793 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178800 - BLOCK
      ?auto_178801 - BLOCK
      ?auto_178802 - BLOCK
    )
    :vars
    (
      ?auto_178808 - BLOCK
      ?auto_178806 - BLOCK
      ?auto_178805 - BLOCK
      ?auto_178804 - BLOCK
      ?auto_178807 - BLOCK
      ?auto_178803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178800 ?auto_178801 ) ) ( not ( = ?auto_178800 ?auto_178802 ) ) ( not ( = ?auto_178801 ?auto_178802 ) ) ( not ( = ?auto_178800 ?auto_178808 ) ) ( not ( = ?auto_178801 ?auto_178808 ) ) ( not ( = ?auto_178802 ?auto_178808 ) ) ( ON-TABLE ?auto_178806 ) ( ON ?auto_178805 ?auto_178806 ) ( ON ?auto_178804 ?auto_178805 ) ( ON ?auto_178807 ?auto_178804 ) ( not ( = ?auto_178806 ?auto_178805 ) ) ( not ( = ?auto_178806 ?auto_178804 ) ) ( not ( = ?auto_178806 ?auto_178807 ) ) ( not ( = ?auto_178806 ?auto_178808 ) ) ( not ( = ?auto_178806 ?auto_178802 ) ) ( not ( = ?auto_178806 ?auto_178801 ) ) ( not ( = ?auto_178805 ?auto_178804 ) ) ( not ( = ?auto_178805 ?auto_178807 ) ) ( not ( = ?auto_178805 ?auto_178808 ) ) ( not ( = ?auto_178805 ?auto_178802 ) ) ( not ( = ?auto_178805 ?auto_178801 ) ) ( not ( = ?auto_178804 ?auto_178807 ) ) ( not ( = ?auto_178804 ?auto_178808 ) ) ( not ( = ?auto_178804 ?auto_178802 ) ) ( not ( = ?auto_178804 ?auto_178801 ) ) ( not ( = ?auto_178807 ?auto_178808 ) ) ( not ( = ?auto_178807 ?auto_178802 ) ) ( not ( = ?auto_178807 ?auto_178801 ) ) ( not ( = ?auto_178800 ?auto_178806 ) ) ( not ( = ?auto_178800 ?auto_178805 ) ) ( not ( = ?auto_178800 ?auto_178804 ) ) ( not ( = ?auto_178800 ?auto_178807 ) ) ( ON ?auto_178800 ?auto_178803 ) ( not ( = ?auto_178800 ?auto_178803 ) ) ( not ( = ?auto_178801 ?auto_178803 ) ) ( not ( = ?auto_178802 ?auto_178803 ) ) ( not ( = ?auto_178808 ?auto_178803 ) ) ( not ( = ?auto_178806 ?auto_178803 ) ) ( not ( = ?auto_178805 ?auto_178803 ) ) ( not ( = ?auto_178804 ?auto_178803 ) ) ( not ( = ?auto_178807 ?auto_178803 ) ) ( ON ?auto_178801 ?auto_178800 ) ( ON-TABLE ?auto_178803 ) ( ON ?auto_178802 ?auto_178801 ) ( CLEAR ?auto_178807 ) ( ON ?auto_178808 ?auto_178802 ) ( CLEAR ?auto_178808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178803 ?auto_178800 ?auto_178801 ?auto_178802 )
      ( MAKE-3PILE ?auto_178800 ?auto_178801 ?auto_178802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178809 - BLOCK
      ?auto_178810 - BLOCK
      ?auto_178811 - BLOCK
    )
    :vars
    (
      ?auto_178814 - BLOCK
      ?auto_178816 - BLOCK
      ?auto_178813 - BLOCK
      ?auto_178815 - BLOCK
      ?auto_178817 - BLOCK
      ?auto_178812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178809 ?auto_178810 ) ) ( not ( = ?auto_178809 ?auto_178811 ) ) ( not ( = ?auto_178810 ?auto_178811 ) ) ( not ( = ?auto_178809 ?auto_178814 ) ) ( not ( = ?auto_178810 ?auto_178814 ) ) ( not ( = ?auto_178811 ?auto_178814 ) ) ( ON-TABLE ?auto_178816 ) ( ON ?auto_178813 ?auto_178816 ) ( ON ?auto_178815 ?auto_178813 ) ( not ( = ?auto_178816 ?auto_178813 ) ) ( not ( = ?auto_178816 ?auto_178815 ) ) ( not ( = ?auto_178816 ?auto_178817 ) ) ( not ( = ?auto_178816 ?auto_178814 ) ) ( not ( = ?auto_178816 ?auto_178811 ) ) ( not ( = ?auto_178816 ?auto_178810 ) ) ( not ( = ?auto_178813 ?auto_178815 ) ) ( not ( = ?auto_178813 ?auto_178817 ) ) ( not ( = ?auto_178813 ?auto_178814 ) ) ( not ( = ?auto_178813 ?auto_178811 ) ) ( not ( = ?auto_178813 ?auto_178810 ) ) ( not ( = ?auto_178815 ?auto_178817 ) ) ( not ( = ?auto_178815 ?auto_178814 ) ) ( not ( = ?auto_178815 ?auto_178811 ) ) ( not ( = ?auto_178815 ?auto_178810 ) ) ( not ( = ?auto_178817 ?auto_178814 ) ) ( not ( = ?auto_178817 ?auto_178811 ) ) ( not ( = ?auto_178817 ?auto_178810 ) ) ( not ( = ?auto_178809 ?auto_178816 ) ) ( not ( = ?auto_178809 ?auto_178813 ) ) ( not ( = ?auto_178809 ?auto_178815 ) ) ( not ( = ?auto_178809 ?auto_178817 ) ) ( ON ?auto_178809 ?auto_178812 ) ( not ( = ?auto_178809 ?auto_178812 ) ) ( not ( = ?auto_178810 ?auto_178812 ) ) ( not ( = ?auto_178811 ?auto_178812 ) ) ( not ( = ?auto_178814 ?auto_178812 ) ) ( not ( = ?auto_178816 ?auto_178812 ) ) ( not ( = ?auto_178813 ?auto_178812 ) ) ( not ( = ?auto_178815 ?auto_178812 ) ) ( not ( = ?auto_178817 ?auto_178812 ) ) ( ON ?auto_178810 ?auto_178809 ) ( ON-TABLE ?auto_178812 ) ( ON ?auto_178811 ?auto_178810 ) ( ON ?auto_178814 ?auto_178811 ) ( CLEAR ?auto_178814 ) ( HOLDING ?auto_178817 ) ( CLEAR ?auto_178815 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178816 ?auto_178813 ?auto_178815 ?auto_178817 )
      ( MAKE-3PILE ?auto_178809 ?auto_178810 ?auto_178811 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178818 - BLOCK
      ?auto_178819 - BLOCK
      ?auto_178820 - BLOCK
    )
    :vars
    (
      ?auto_178824 - BLOCK
      ?auto_178822 - BLOCK
      ?auto_178826 - BLOCK
      ?auto_178825 - BLOCK
      ?auto_178823 - BLOCK
      ?auto_178821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178818 ?auto_178819 ) ) ( not ( = ?auto_178818 ?auto_178820 ) ) ( not ( = ?auto_178819 ?auto_178820 ) ) ( not ( = ?auto_178818 ?auto_178824 ) ) ( not ( = ?auto_178819 ?auto_178824 ) ) ( not ( = ?auto_178820 ?auto_178824 ) ) ( ON-TABLE ?auto_178822 ) ( ON ?auto_178826 ?auto_178822 ) ( ON ?auto_178825 ?auto_178826 ) ( not ( = ?auto_178822 ?auto_178826 ) ) ( not ( = ?auto_178822 ?auto_178825 ) ) ( not ( = ?auto_178822 ?auto_178823 ) ) ( not ( = ?auto_178822 ?auto_178824 ) ) ( not ( = ?auto_178822 ?auto_178820 ) ) ( not ( = ?auto_178822 ?auto_178819 ) ) ( not ( = ?auto_178826 ?auto_178825 ) ) ( not ( = ?auto_178826 ?auto_178823 ) ) ( not ( = ?auto_178826 ?auto_178824 ) ) ( not ( = ?auto_178826 ?auto_178820 ) ) ( not ( = ?auto_178826 ?auto_178819 ) ) ( not ( = ?auto_178825 ?auto_178823 ) ) ( not ( = ?auto_178825 ?auto_178824 ) ) ( not ( = ?auto_178825 ?auto_178820 ) ) ( not ( = ?auto_178825 ?auto_178819 ) ) ( not ( = ?auto_178823 ?auto_178824 ) ) ( not ( = ?auto_178823 ?auto_178820 ) ) ( not ( = ?auto_178823 ?auto_178819 ) ) ( not ( = ?auto_178818 ?auto_178822 ) ) ( not ( = ?auto_178818 ?auto_178826 ) ) ( not ( = ?auto_178818 ?auto_178825 ) ) ( not ( = ?auto_178818 ?auto_178823 ) ) ( ON ?auto_178818 ?auto_178821 ) ( not ( = ?auto_178818 ?auto_178821 ) ) ( not ( = ?auto_178819 ?auto_178821 ) ) ( not ( = ?auto_178820 ?auto_178821 ) ) ( not ( = ?auto_178824 ?auto_178821 ) ) ( not ( = ?auto_178822 ?auto_178821 ) ) ( not ( = ?auto_178826 ?auto_178821 ) ) ( not ( = ?auto_178825 ?auto_178821 ) ) ( not ( = ?auto_178823 ?auto_178821 ) ) ( ON ?auto_178819 ?auto_178818 ) ( ON-TABLE ?auto_178821 ) ( ON ?auto_178820 ?auto_178819 ) ( ON ?auto_178824 ?auto_178820 ) ( CLEAR ?auto_178825 ) ( ON ?auto_178823 ?auto_178824 ) ( CLEAR ?auto_178823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178821 ?auto_178818 ?auto_178819 ?auto_178820 ?auto_178824 )
      ( MAKE-3PILE ?auto_178818 ?auto_178819 ?auto_178820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178827 - BLOCK
      ?auto_178828 - BLOCK
      ?auto_178829 - BLOCK
    )
    :vars
    (
      ?auto_178830 - BLOCK
      ?auto_178831 - BLOCK
      ?auto_178832 - BLOCK
      ?auto_178834 - BLOCK
      ?auto_178833 - BLOCK
      ?auto_178835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178827 ?auto_178828 ) ) ( not ( = ?auto_178827 ?auto_178829 ) ) ( not ( = ?auto_178828 ?auto_178829 ) ) ( not ( = ?auto_178827 ?auto_178830 ) ) ( not ( = ?auto_178828 ?auto_178830 ) ) ( not ( = ?auto_178829 ?auto_178830 ) ) ( ON-TABLE ?auto_178831 ) ( ON ?auto_178832 ?auto_178831 ) ( not ( = ?auto_178831 ?auto_178832 ) ) ( not ( = ?auto_178831 ?auto_178834 ) ) ( not ( = ?auto_178831 ?auto_178833 ) ) ( not ( = ?auto_178831 ?auto_178830 ) ) ( not ( = ?auto_178831 ?auto_178829 ) ) ( not ( = ?auto_178831 ?auto_178828 ) ) ( not ( = ?auto_178832 ?auto_178834 ) ) ( not ( = ?auto_178832 ?auto_178833 ) ) ( not ( = ?auto_178832 ?auto_178830 ) ) ( not ( = ?auto_178832 ?auto_178829 ) ) ( not ( = ?auto_178832 ?auto_178828 ) ) ( not ( = ?auto_178834 ?auto_178833 ) ) ( not ( = ?auto_178834 ?auto_178830 ) ) ( not ( = ?auto_178834 ?auto_178829 ) ) ( not ( = ?auto_178834 ?auto_178828 ) ) ( not ( = ?auto_178833 ?auto_178830 ) ) ( not ( = ?auto_178833 ?auto_178829 ) ) ( not ( = ?auto_178833 ?auto_178828 ) ) ( not ( = ?auto_178827 ?auto_178831 ) ) ( not ( = ?auto_178827 ?auto_178832 ) ) ( not ( = ?auto_178827 ?auto_178834 ) ) ( not ( = ?auto_178827 ?auto_178833 ) ) ( ON ?auto_178827 ?auto_178835 ) ( not ( = ?auto_178827 ?auto_178835 ) ) ( not ( = ?auto_178828 ?auto_178835 ) ) ( not ( = ?auto_178829 ?auto_178835 ) ) ( not ( = ?auto_178830 ?auto_178835 ) ) ( not ( = ?auto_178831 ?auto_178835 ) ) ( not ( = ?auto_178832 ?auto_178835 ) ) ( not ( = ?auto_178834 ?auto_178835 ) ) ( not ( = ?auto_178833 ?auto_178835 ) ) ( ON ?auto_178828 ?auto_178827 ) ( ON-TABLE ?auto_178835 ) ( ON ?auto_178829 ?auto_178828 ) ( ON ?auto_178830 ?auto_178829 ) ( ON ?auto_178833 ?auto_178830 ) ( CLEAR ?auto_178833 ) ( HOLDING ?auto_178834 ) ( CLEAR ?auto_178832 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178831 ?auto_178832 ?auto_178834 )
      ( MAKE-3PILE ?auto_178827 ?auto_178828 ?auto_178829 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178836 - BLOCK
      ?auto_178837 - BLOCK
      ?auto_178838 - BLOCK
    )
    :vars
    (
      ?auto_178844 - BLOCK
      ?auto_178843 - BLOCK
      ?auto_178842 - BLOCK
      ?auto_178841 - BLOCK
      ?auto_178839 - BLOCK
      ?auto_178840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178836 ?auto_178837 ) ) ( not ( = ?auto_178836 ?auto_178838 ) ) ( not ( = ?auto_178837 ?auto_178838 ) ) ( not ( = ?auto_178836 ?auto_178844 ) ) ( not ( = ?auto_178837 ?auto_178844 ) ) ( not ( = ?auto_178838 ?auto_178844 ) ) ( ON-TABLE ?auto_178843 ) ( ON ?auto_178842 ?auto_178843 ) ( not ( = ?auto_178843 ?auto_178842 ) ) ( not ( = ?auto_178843 ?auto_178841 ) ) ( not ( = ?auto_178843 ?auto_178839 ) ) ( not ( = ?auto_178843 ?auto_178844 ) ) ( not ( = ?auto_178843 ?auto_178838 ) ) ( not ( = ?auto_178843 ?auto_178837 ) ) ( not ( = ?auto_178842 ?auto_178841 ) ) ( not ( = ?auto_178842 ?auto_178839 ) ) ( not ( = ?auto_178842 ?auto_178844 ) ) ( not ( = ?auto_178842 ?auto_178838 ) ) ( not ( = ?auto_178842 ?auto_178837 ) ) ( not ( = ?auto_178841 ?auto_178839 ) ) ( not ( = ?auto_178841 ?auto_178844 ) ) ( not ( = ?auto_178841 ?auto_178838 ) ) ( not ( = ?auto_178841 ?auto_178837 ) ) ( not ( = ?auto_178839 ?auto_178844 ) ) ( not ( = ?auto_178839 ?auto_178838 ) ) ( not ( = ?auto_178839 ?auto_178837 ) ) ( not ( = ?auto_178836 ?auto_178843 ) ) ( not ( = ?auto_178836 ?auto_178842 ) ) ( not ( = ?auto_178836 ?auto_178841 ) ) ( not ( = ?auto_178836 ?auto_178839 ) ) ( ON ?auto_178836 ?auto_178840 ) ( not ( = ?auto_178836 ?auto_178840 ) ) ( not ( = ?auto_178837 ?auto_178840 ) ) ( not ( = ?auto_178838 ?auto_178840 ) ) ( not ( = ?auto_178844 ?auto_178840 ) ) ( not ( = ?auto_178843 ?auto_178840 ) ) ( not ( = ?auto_178842 ?auto_178840 ) ) ( not ( = ?auto_178841 ?auto_178840 ) ) ( not ( = ?auto_178839 ?auto_178840 ) ) ( ON ?auto_178837 ?auto_178836 ) ( ON-TABLE ?auto_178840 ) ( ON ?auto_178838 ?auto_178837 ) ( ON ?auto_178844 ?auto_178838 ) ( ON ?auto_178839 ?auto_178844 ) ( CLEAR ?auto_178842 ) ( ON ?auto_178841 ?auto_178839 ) ( CLEAR ?auto_178841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178840 ?auto_178836 ?auto_178837 ?auto_178838 ?auto_178844 ?auto_178839 )
      ( MAKE-3PILE ?auto_178836 ?auto_178837 ?auto_178838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178845 - BLOCK
      ?auto_178846 - BLOCK
      ?auto_178847 - BLOCK
    )
    :vars
    (
      ?auto_178849 - BLOCK
      ?auto_178852 - BLOCK
      ?auto_178851 - BLOCK
      ?auto_178853 - BLOCK
      ?auto_178850 - BLOCK
      ?auto_178848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178845 ?auto_178846 ) ) ( not ( = ?auto_178845 ?auto_178847 ) ) ( not ( = ?auto_178846 ?auto_178847 ) ) ( not ( = ?auto_178845 ?auto_178849 ) ) ( not ( = ?auto_178846 ?auto_178849 ) ) ( not ( = ?auto_178847 ?auto_178849 ) ) ( ON-TABLE ?auto_178852 ) ( not ( = ?auto_178852 ?auto_178851 ) ) ( not ( = ?auto_178852 ?auto_178853 ) ) ( not ( = ?auto_178852 ?auto_178850 ) ) ( not ( = ?auto_178852 ?auto_178849 ) ) ( not ( = ?auto_178852 ?auto_178847 ) ) ( not ( = ?auto_178852 ?auto_178846 ) ) ( not ( = ?auto_178851 ?auto_178853 ) ) ( not ( = ?auto_178851 ?auto_178850 ) ) ( not ( = ?auto_178851 ?auto_178849 ) ) ( not ( = ?auto_178851 ?auto_178847 ) ) ( not ( = ?auto_178851 ?auto_178846 ) ) ( not ( = ?auto_178853 ?auto_178850 ) ) ( not ( = ?auto_178853 ?auto_178849 ) ) ( not ( = ?auto_178853 ?auto_178847 ) ) ( not ( = ?auto_178853 ?auto_178846 ) ) ( not ( = ?auto_178850 ?auto_178849 ) ) ( not ( = ?auto_178850 ?auto_178847 ) ) ( not ( = ?auto_178850 ?auto_178846 ) ) ( not ( = ?auto_178845 ?auto_178852 ) ) ( not ( = ?auto_178845 ?auto_178851 ) ) ( not ( = ?auto_178845 ?auto_178853 ) ) ( not ( = ?auto_178845 ?auto_178850 ) ) ( ON ?auto_178845 ?auto_178848 ) ( not ( = ?auto_178845 ?auto_178848 ) ) ( not ( = ?auto_178846 ?auto_178848 ) ) ( not ( = ?auto_178847 ?auto_178848 ) ) ( not ( = ?auto_178849 ?auto_178848 ) ) ( not ( = ?auto_178852 ?auto_178848 ) ) ( not ( = ?auto_178851 ?auto_178848 ) ) ( not ( = ?auto_178853 ?auto_178848 ) ) ( not ( = ?auto_178850 ?auto_178848 ) ) ( ON ?auto_178846 ?auto_178845 ) ( ON-TABLE ?auto_178848 ) ( ON ?auto_178847 ?auto_178846 ) ( ON ?auto_178849 ?auto_178847 ) ( ON ?auto_178850 ?auto_178849 ) ( ON ?auto_178853 ?auto_178850 ) ( CLEAR ?auto_178853 ) ( HOLDING ?auto_178851 ) ( CLEAR ?auto_178852 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178852 ?auto_178851 )
      ( MAKE-3PILE ?auto_178845 ?auto_178846 ?auto_178847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178854 - BLOCK
      ?auto_178855 - BLOCK
      ?auto_178856 - BLOCK
    )
    :vars
    (
      ?auto_178860 - BLOCK
      ?auto_178862 - BLOCK
      ?auto_178859 - BLOCK
      ?auto_178857 - BLOCK
      ?auto_178858 - BLOCK
      ?auto_178861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178854 ?auto_178855 ) ) ( not ( = ?auto_178854 ?auto_178856 ) ) ( not ( = ?auto_178855 ?auto_178856 ) ) ( not ( = ?auto_178854 ?auto_178860 ) ) ( not ( = ?auto_178855 ?auto_178860 ) ) ( not ( = ?auto_178856 ?auto_178860 ) ) ( ON-TABLE ?auto_178862 ) ( not ( = ?auto_178862 ?auto_178859 ) ) ( not ( = ?auto_178862 ?auto_178857 ) ) ( not ( = ?auto_178862 ?auto_178858 ) ) ( not ( = ?auto_178862 ?auto_178860 ) ) ( not ( = ?auto_178862 ?auto_178856 ) ) ( not ( = ?auto_178862 ?auto_178855 ) ) ( not ( = ?auto_178859 ?auto_178857 ) ) ( not ( = ?auto_178859 ?auto_178858 ) ) ( not ( = ?auto_178859 ?auto_178860 ) ) ( not ( = ?auto_178859 ?auto_178856 ) ) ( not ( = ?auto_178859 ?auto_178855 ) ) ( not ( = ?auto_178857 ?auto_178858 ) ) ( not ( = ?auto_178857 ?auto_178860 ) ) ( not ( = ?auto_178857 ?auto_178856 ) ) ( not ( = ?auto_178857 ?auto_178855 ) ) ( not ( = ?auto_178858 ?auto_178860 ) ) ( not ( = ?auto_178858 ?auto_178856 ) ) ( not ( = ?auto_178858 ?auto_178855 ) ) ( not ( = ?auto_178854 ?auto_178862 ) ) ( not ( = ?auto_178854 ?auto_178859 ) ) ( not ( = ?auto_178854 ?auto_178857 ) ) ( not ( = ?auto_178854 ?auto_178858 ) ) ( ON ?auto_178854 ?auto_178861 ) ( not ( = ?auto_178854 ?auto_178861 ) ) ( not ( = ?auto_178855 ?auto_178861 ) ) ( not ( = ?auto_178856 ?auto_178861 ) ) ( not ( = ?auto_178860 ?auto_178861 ) ) ( not ( = ?auto_178862 ?auto_178861 ) ) ( not ( = ?auto_178859 ?auto_178861 ) ) ( not ( = ?auto_178857 ?auto_178861 ) ) ( not ( = ?auto_178858 ?auto_178861 ) ) ( ON ?auto_178855 ?auto_178854 ) ( ON-TABLE ?auto_178861 ) ( ON ?auto_178856 ?auto_178855 ) ( ON ?auto_178860 ?auto_178856 ) ( ON ?auto_178858 ?auto_178860 ) ( ON ?auto_178857 ?auto_178858 ) ( CLEAR ?auto_178862 ) ( ON ?auto_178859 ?auto_178857 ) ( CLEAR ?auto_178859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178861 ?auto_178854 ?auto_178855 ?auto_178856 ?auto_178860 ?auto_178858 ?auto_178857 )
      ( MAKE-3PILE ?auto_178854 ?auto_178855 ?auto_178856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178863 - BLOCK
      ?auto_178864 - BLOCK
      ?auto_178865 - BLOCK
    )
    :vars
    (
      ?auto_178870 - BLOCK
      ?auto_178867 - BLOCK
      ?auto_178869 - BLOCK
      ?auto_178871 - BLOCK
      ?auto_178868 - BLOCK
      ?auto_178866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178863 ?auto_178864 ) ) ( not ( = ?auto_178863 ?auto_178865 ) ) ( not ( = ?auto_178864 ?auto_178865 ) ) ( not ( = ?auto_178863 ?auto_178870 ) ) ( not ( = ?auto_178864 ?auto_178870 ) ) ( not ( = ?auto_178865 ?auto_178870 ) ) ( not ( = ?auto_178867 ?auto_178869 ) ) ( not ( = ?auto_178867 ?auto_178871 ) ) ( not ( = ?auto_178867 ?auto_178868 ) ) ( not ( = ?auto_178867 ?auto_178870 ) ) ( not ( = ?auto_178867 ?auto_178865 ) ) ( not ( = ?auto_178867 ?auto_178864 ) ) ( not ( = ?auto_178869 ?auto_178871 ) ) ( not ( = ?auto_178869 ?auto_178868 ) ) ( not ( = ?auto_178869 ?auto_178870 ) ) ( not ( = ?auto_178869 ?auto_178865 ) ) ( not ( = ?auto_178869 ?auto_178864 ) ) ( not ( = ?auto_178871 ?auto_178868 ) ) ( not ( = ?auto_178871 ?auto_178870 ) ) ( not ( = ?auto_178871 ?auto_178865 ) ) ( not ( = ?auto_178871 ?auto_178864 ) ) ( not ( = ?auto_178868 ?auto_178870 ) ) ( not ( = ?auto_178868 ?auto_178865 ) ) ( not ( = ?auto_178868 ?auto_178864 ) ) ( not ( = ?auto_178863 ?auto_178867 ) ) ( not ( = ?auto_178863 ?auto_178869 ) ) ( not ( = ?auto_178863 ?auto_178871 ) ) ( not ( = ?auto_178863 ?auto_178868 ) ) ( ON ?auto_178863 ?auto_178866 ) ( not ( = ?auto_178863 ?auto_178866 ) ) ( not ( = ?auto_178864 ?auto_178866 ) ) ( not ( = ?auto_178865 ?auto_178866 ) ) ( not ( = ?auto_178870 ?auto_178866 ) ) ( not ( = ?auto_178867 ?auto_178866 ) ) ( not ( = ?auto_178869 ?auto_178866 ) ) ( not ( = ?auto_178871 ?auto_178866 ) ) ( not ( = ?auto_178868 ?auto_178866 ) ) ( ON ?auto_178864 ?auto_178863 ) ( ON-TABLE ?auto_178866 ) ( ON ?auto_178865 ?auto_178864 ) ( ON ?auto_178870 ?auto_178865 ) ( ON ?auto_178868 ?auto_178870 ) ( ON ?auto_178871 ?auto_178868 ) ( ON ?auto_178869 ?auto_178871 ) ( CLEAR ?auto_178869 ) ( HOLDING ?auto_178867 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178867 )
      ( MAKE-3PILE ?auto_178863 ?auto_178864 ?auto_178865 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_178872 - BLOCK
      ?auto_178873 - BLOCK
      ?auto_178874 - BLOCK
    )
    :vars
    (
      ?auto_178877 - BLOCK
      ?auto_178875 - BLOCK
      ?auto_178876 - BLOCK
      ?auto_178878 - BLOCK
      ?auto_178880 - BLOCK
      ?auto_178879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178872 ?auto_178873 ) ) ( not ( = ?auto_178872 ?auto_178874 ) ) ( not ( = ?auto_178873 ?auto_178874 ) ) ( not ( = ?auto_178872 ?auto_178877 ) ) ( not ( = ?auto_178873 ?auto_178877 ) ) ( not ( = ?auto_178874 ?auto_178877 ) ) ( not ( = ?auto_178875 ?auto_178876 ) ) ( not ( = ?auto_178875 ?auto_178878 ) ) ( not ( = ?auto_178875 ?auto_178880 ) ) ( not ( = ?auto_178875 ?auto_178877 ) ) ( not ( = ?auto_178875 ?auto_178874 ) ) ( not ( = ?auto_178875 ?auto_178873 ) ) ( not ( = ?auto_178876 ?auto_178878 ) ) ( not ( = ?auto_178876 ?auto_178880 ) ) ( not ( = ?auto_178876 ?auto_178877 ) ) ( not ( = ?auto_178876 ?auto_178874 ) ) ( not ( = ?auto_178876 ?auto_178873 ) ) ( not ( = ?auto_178878 ?auto_178880 ) ) ( not ( = ?auto_178878 ?auto_178877 ) ) ( not ( = ?auto_178878 ?auto_178874 ) ) ( not ( = ?auto_178878 ?auto_178873 ) ) ( not ( = ?auto_178880 ?auto_178877 ) ) ( not ( = ?auto_178880 ?auto_178874 ) ) ( not ( = ?auto_178880 ?auto_178873 ) ) ( not ( = ?auto_178872 ?auto_178875 ) ) ( not ( = ?auto_178872 ?auto_178876 ) ) ( not ( = ?auto_178872 ?auto_178878 ) ) ( not ( = ?auto_178872 ?auto_178880 ) ) ( ON ?auto_178872 ?auto_178879 ) ( not ( = ?auto_178872 ?auto_178879 ) ) ( not ( = ?auto_178873 ?auto_178879 ) ) ( not ( = ?auto_178874 ?auto_178879 ) ) ( not ( = ?auto_178877 ?auto_178879 ) ) ( not ( = ?auto_178875 ?auto_178879 ) ) ( not ( = ?auto_178876 ?auto_178879 ) ) ( not ( = ?auto_178878 ?auto_178879 ) ) ( not ( = ?auto_178880 ?auto_178879 ) ) ( ON ?auto_178873 ?auto_178872 ) ( ON-TABLE ?auto_178879 ) ( ON ?auto_178874 ?auto_178873 ) ( ON ?auto_178877 ?auto_178874 ) ( ON ?auto_178880 ?auto_178877 ) ( ON ?auto_178878 ?auto_178880 ) ( ON ?auto_178876 ?auto_178878 ) ( ON ?auto_178875 ?auto_178876 ) ( CLEAR ?auto_178875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178879 ?auto_178872 ?auto_178873 ?auto_178874 ?auto_178877 ?auto_178880 ?auto_178878 ?auto_178876 )
      ( MAKE-3PILE ?auto_178872 ?auto_178873 ?auto_178874 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_178904 - BLOCK
      ?auto_178905 - BLOCK
      ?auto_178906 - BLOCK
      ?auto_178907 - BLOCK
    )
    :vars
    (
      ?auto_178909 - BLOCK
      ?auto_178910 - BLOCK
      ?auto_178908 - BLOCK
      ?auto_178911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178909 ?auto_178907 ) ( ON-TABLE ?auto_178904 ) ( ON ?auto_178905 ?auto_178904 ) ( ON ?auto_178906 ?auto_178905 ) ( ON ?auto_178907 ?auto_178906 ) ( not ( = ?auto_178904 ?auto_178905 ) ) ( not ( = ?auto_178904 ?auto_178906 ) ) ( not ( = ?auto_178904 ?auto_178907 ) ) ( not ( = ?auto_178904 ?auto_178909 ) ) ( not ( = ?auto_178905 ?auto_178906 ) ) ( not ( = ?auto_178905 ?auto_178907 ) ) ( not ( = ?auto_178905 ?auto_178909 ) ) ( not ( = ?auto_178906 ?auto_178907 ) ) ( not ( = ?auto_178906 ?auto_178909 ) ) ( not ( = ?auto_178907 ?auto_178909 ) ) ( not ( = ?auto_178904 ?auto_178910 ) ) ( not ( = ?auto_178904 ?auto_178908 ) ) ( not ( = ?auto_178905 ?auto_178910 ) ) ( not ( = ?auto_178905 ?auto_178908 ) ) ( not ( = ?auto_178906 ?auto_178910 ) ) ( not ( = ?auto_178906 ?auto_178908 ) ) ( not ( = ?auto_178907 ?auto_178910 ) ) ( not ( = ?auto_178907 ?auto_178908 ) ) ( not ( = ?auto_178909 ?auto_178910 ) ) ( not ( = ?auto_178909 ?auto_178908 ) ) ( not ( = ?auto_178910 ?auto_178908 ) ) ( ON ?auto_178910 ?auto_178909 ) ( CLEAR ?auto_178910 ) ( HOLDING ?auto_178908 ) ( CLEAR ?auto_178911 ) ( ON-TABLE ?auto_178911 ) ( not ( = ?auto_178911 ?auto_178908 ) ) ( not ( = ?auto_178904 ?auto_178911 ) ) ( not ( = ?auto_178905 ?auto_178911 ) ) ( not ( = ?auto_178906 ?auto_178911 ) ) ( not ( = ?auto_178907 ?auto_178911 ) ) ( not ( = ?auto_178909 ?auto_178911 ) ) ( not ( = ?auto_178910 ?auto_178911 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178911 ?auto_178908 )
      ( MAKE-4PILE ?auto_178904 ?auto_178905 ?auto_178906 ?auto_178907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_178912 - BLOCK
      ?auto_178913 - BLOCK
      ?auto_178914 - BLOCK
      ?auto_178915 - BLOCK
    )
    :vars
    (
      ?auto_178919 - BLOCK
      ?auto_178918 - BLOCK
      ?auto_178916 - BLOCK
      ?auto_178917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178919 ?auto_178915 ) ( ON-TABLE ?auto_178912 ) ( ON ?auto_178913 ?auto_178912 ) ( ON ?auto_178914 ?auto_178913 ) ( ON ?auto_178915 ?auto_178914 ) ( not ( = ?auto_178912 ?auto_178913 ) ) ( not ( = ?auto_178912 ?auto_178914 ) ) ( not ( = ?auto_178912 ?auto_178915 ) ) ( not ( = ?auto_178912 ?auto_178919 ) ) ( not ( = ?auto_178913 ?auto_178914 ) ) ( not ( = ?auto_178913 ?auto_178915 ) ) ( not ( = ?auto_178913 ?auto_178919 ) ) ( not ( = ?auto_178914 ?auto_178915 ) ) ( not ( = ?auto_178914 ?auto_178919 ) ) ( not ( = ?auto_178915 ?auto_178919 ) ) ( not ( = ?auto_178912 ?auto_178918 ) ) ( not ( = ?auto_178912 ?auto_178916 ) ) ( not ( = ?auto_178913 ?auto_178918 ) ) ( not ( = ?auto_178913 ?auto_178916 ) ) ( not ( = ?auto_178914 ?auto_178918 ) ) ( not ( = ?auto_178914 ?auto_178916 ) ) ( not ( = ?auto_178915 ?auto_178918 ) ) ( not ( = ?auto_178915 ?auto_178916 ) ) ( not ( = ?auto_178919 ?auto_178918 ) ) ( not ( = ?auto_178919 ?auto_178916 ) ) ( not ( = ?auto_178918 ?auto_178916 ) ) ( ON ?auto_178918 ?auto_178919 ) ( CLEAR ?auto_178917 ) ( ON-TABLE ?auto_178917 ) ( not ( = ?auto_178917 ?auto_178916 ) ) ( not ( = ?auto_178912 ?auto_178917 ) ) ( not ( = ?auto_178913 ?auto_178917 ) ) ( not ( = ?auto_178914 ?auto_178917 ) ) ( not ( = ?auto_178915 ?auto_178917 ) ) ( not ( = ?auto_178919 ?auto_178917 ) ) ( not ( = ?auto_178918 ?auto_178917 ) ) ( ON ?auto_178916 ?auto_178918 ) ( CLEAR ?auto_178916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178912 ?auto_178913 ?auto_178914 ?auto_178915 ?auto_178919 ?auto_178918 )
      ( MAKE-4PILE ?auto_178912 ?auto_178913 ?auto_178914 ?auto_178915 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_178920 - BLOCK
      ?auto_178921 - BLOCK
      ?auto_178922 - BLOCK
      ?auto_178923 - BLOCK
    )
    :vars
    (
      ?auto_178926 - BLOCK
      ?auto_178925 - BLOCK
      ?auto_178927 - BLOCK
      ?auto_178924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178926 ?auto_178923 ) ( ON-TABLE ?auto_178920 ) ( ON ?auto_178921 ?auto_178920 ) ( ON ?auto_178922 ?auto_178921 ) ( ON ?auto_178923 ?auto_178922 ) ( not ( = ?auto_178920 ?auto_178921 ) ) ( not ( = ?auto_178920 ?auto_178922 ) ) ( not ( = ?auto_178920 ?auto_178923 ) ) ( not ( = ?auto_178920 ?auto_178926 ) ) ( not ( = ?auto_178921 ?auto_178922 ) ) ( not ( = ?auto_178921 ?auto_178923 ) ) ( not ( = ?auto_178921 ?auto_178926 ) ) ( not ( = ?auto_178922 ?auto_178923 ) ) ( not ( = ?auto_178922 ?auto_178926 ) ) ( not ( = ?auto_178923 ?auto_178926 ) ) ( not ( = ?auto_178920 ?auto_178925 ) ) ( not ( = ?auto_178920 ?auto_178927 ) ) ( not ( = ?auto_178921 ?auto_178925 ) ) ( not ( = ?auto_178921 ?auto_178927 ) ) ( not ( = ?auto_178922 ?auto_178925 ) ) ( not ( = ?auto_178922 ?auto_178927 ) ) ( not ( = ?auto_178923 ?auto_178925 ) ) ( not ( = ?auto_178923 ?auto_178927 ) ) ( not ( = ?auto_178926 ?auto_178925 ) ) ( not ( = ?auto_178926 ?auto_178927 ) ) ( not ( = ?auto_178925 ?auto_178927 ) ) ( ON ?auto_178925 ?auto_178926 ) ( not ( = ?auto_178924 ?auto_178927 ) ) ( not ( = ?auto_178920 ?auto_178924 ) ) ( not ( = ?auto_178921 ?auto_178924 ) ) ( not ( = ?auto_178922 ?auto_178924 ) ) ( not ( = ?auto_178923 ?auto_178924 ) ) ( not ( = ?auto_178926 ?auto_178924 ) ) ( not ( = ?auto_178925 ?auto_178924 ) ) ( ON ?auto_178927 ?auto_178925 ) ( CLEAR ?auto_178927 ) ( HOLDING ?auto_178924 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178924 )
      ( MAKE-4PILE ?auto_178920 ?auto_178921 ?auto_178922 ?auto_178923 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_178940 - BLOCK
      ?auto_178941 - BLOCK
      ?auto_178942 - BLOCK
      ?auto_178943 - BLOCK
    )
    :vars
    (
      ?auto_178945 - BLOCK
      ?auto_178946 - BLOCK
      ?auto_178947 - BLOCK
      ?auto_178944 - BLOCK
      ?auto_178948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178945 ?auto_178943 ) ( ON-TABLE ?auto_178940 ) ( ON ?auto_178941 ?auto_178940 ) ( ON ?auto_178942 ?auto_178941 ) ( ON ?auto_178943 ?auto_178942 ) ( not ( = ?auto_178940 ?auto_178941 ) ) ( not ( = ?auto_178940 ?auto_178942 ) ) ( not ( = ?auto_178940 ?auto_178943 ) ) ( not ( = ?auto_178940 ?auto_178945 ) ) ( not ( = ?auto_178941 ?auto_178942 ) ) ( not ( = ?auto_178941 ?auto_178943 ) ) ( not ( = ?auto_178941 ?auto_178945 ) ) ( not ( = ?auto_178942 ?auto_178943 ) ) ( not ( = ?auto_178942 ?auto_178945 ) ) ( not ( = ?auto_178943 ?auto_178945 ) ) ( not ( = ?auto_178940 ?auto_178946 ) ) ( not ( = ?auto_178940 ?auto_178947 ) ) ( not ( = ?auto_178941 ?auto_178946 ) ) ( not ( = ?auto_178941 ?auto_178947 ) ) ( not ( = ?auto_178942 ?auto_178946 ) ) ( not ( = ?auto_178942 ?auto_178947 ) ) ( not ( = ?auto_178943 ?auto_178946 ) ) ( not ( = ?auto_178943 ?auto_178947 ) ) ( not ( = ?auto_178945 ?auto_178946 ) ) ( not ( = ?auto_178945 ?auto_178947 ) ) ( not ( = ?auto_178946 ?auto_178947 ) ) ( ON ?auto_178946 ?auto_178945 ) ( not ( = ?auto_178944 ?auto_178947 ) ) ( not ( = ?auto_178940 ?auto_178944 ) ) ( not ( = ?auto_178941 ?auto_178944 ) ) ( not ( = ?auto_178942 ?auto_178944 ) ) ( not ( = ?auto_178943 ?auto_178944 ) ) ( not ( = ?auto_178945 ?auto_178944 ) ) ( not ( = ?auto_178946 ?auto_178944 ) ) ( ON ?auto_178947 ?auto_178946 ) ( CLEAR ?auto_178947 ) ( ON ?auto_178944 ?auto_178948 ) ( CLEAR ?auto_178944 ) ( HAND-EMPTY ) ( not ( = ?auto_178940 ?auto_178948 ) ) ( not ( = ?auto_178941 ?auto_178948 ) ) ( not ( = ?auto_178942 ?auto_178948 ) ) ( not ( = ?auto_178943 ?auto_178948 ) ) ( not ( = ?auto_178945 ?auto_178948 ) ) ( not ( = ?auto_178946 ?auto_178948 ) ) ( not ( = ?auto_178947 ?auto_178948 ) ) ( not ( = ?auto_178944 ?auto_178948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178944 ?auto_178948 )
      ( MAKE-4PILE ?auto_178940 ?auto_178941 ?auto_178942 ?auto_178943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_178949 - BLOCK
      ?auto_178950 - BLOCK
      ?auto_178951 - BLOCK
      ?auto_178952 - BLOCK
    )
    :vars
    (
      ?auto_178955 - BLOCK
      ?auto_178957 - BLOCK
      ?auto_178953 - BLOCK
      ?auto_178954 - BLOCK
      ?auto_178956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178955 ?auto_178952 ) ( ON-TABLE ?auto_178949 ) ( ON ?auto_178950 ?auto_178949 ) ( ON ?auto_178951 ?auto_178950 ) ( ON ?auto_178952 ?auto_178951 ) ( not ( = ?auto_178949 ?auto_178950 ) ) ( not ( = ?auto_178949 ?auto_178951 ) ) ( not ( = ?auto_178949 ?auto_178952 ) ) ( not ( = ?auto_178949 ?auto_178955 ) ) ( not ( = ?auto_178950 ?auto_178951 ) ) ( not ( = ?auto_178950 ?auto_178952 ) ) ( not ( = ?auto_178950 ?auto_178955 ) ) ( not ( = ?auto_178951 ?auto_178952 ) ) ( not ( = ?auto_178951 ?auto_178955 ) ) ( not ( = ?auto_178952 ?auto_178955 ) ) ( not ( = ?auto_178949 ?auto_178957 ) ) ( not ( = ?auto_178949 ?auto_178953 ) ) ( not ( = ?auto_178950 ?auto_178957 ) ) ( not ( = ?auto_178950 ?auto_178953 ) ) ( not ( = ?auto_178951 ?auto_178957 ) ) ( not ( = ?auto_178951 ?auto_178953 ) ) ( not ( = ?auto_178952 ?auto_178957 ) ) ( not ( = ?auto_178952 ?auto_178953 ) ) ( not ( = ?auto_178955 ?auto_178957 ) ) ( not ( = ?auto_178955 ?auto_178953 ) ) ( not ( = ?auto_178957 ?auto_178953 ) ) ( ON ?auto_178957 ?auto_178955 ) ( not ( = ?auto_178954 ?auto_178953 ) ) ( not ( = ?auto_178949 ?auto_178954 ) ) ( not ( = ?auto_178950 ?auto_178954 ) ) ( not ( = ?auto_178951 ?auto_178954 ) ) ( not ( = ?auto_178952 ?auto_178954 ) ) ( not ( = ?auto_178955 ?auto_178954 ) ) ( not ( = ?auto_178957 ?auto_178954 ) ) ( ON ?auto_178954 ?auto_178956 ) ( CLEAR ?auto_178954 ) ( not ( = ?auto_178949 ?auto_178956 ) ) ( not ( = ?auto_178950 ?auto_178956 ) ) ( not ( = ?auto_178951 ?auto_178956 ) ) ( not ( = ?auto_178952 ?auto_178956 ) ) ( not ( = ?auto_178955 ?auto_178956 ) ) ( not ( = ?auto_178957 ?auto_178956 ) ) ( not ( = ?auto_178953 ?auto_178956 ) ) ( not ( = ?auto_178954 ?auto_178956 ) ) ( HOLDING ?auto_178953 ) ( CLEAR ?auto_178957 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178949 ?auto_178950 ?auto_178951 ?auto_178952 ?auto_178955 ?auto_178957 ?auto_178953 )
      ( MAKE-4PILE ?auto_178949 ?auto_178950 ?auto_178951 ?auto_178952 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179031 - BLOCK
      ?auto_179032 - BLOCK
      ?auto_179033 - BLOCK
      ?auto_179034 - BLOCK
    )
    :vars
    (
      ?auto_179035 - BLOCK
      ?auto_179038 - BLOCK
      ?auto_179037 - BLOCK
      ?auto_179036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179031 ) ( ON ?auto_179032 ?auto_179031 ) ( not ( = ?auto_179031 ?auto_179032 ) ) ( not ( = ?auto_179031 ?auto_179033 ) ) ( not ( = ?auto_179031 ?auto_179034 ) ) ( not ( = ?auto_179032 ?auto_179033 ) ) ( not ( = ?auto_179032 ?auto_179034 ) ) ( not ( = ?auto_179033 ?auto_179034 ) ) ( ON ?auto_179034 ?auto_179035 ) ( not ( = ?auto_179031 ?auto_179035 ) ) ( not ( = ?auto_179032 ?auto_179035 ) ) ( not ( = ?auto_179033 ?auto_179035 ) ) ( not ( = ?auto_179034 ?auto_179035 ) ) ( CLEAR ?auto_179032 ) ( ON ?auto_179033 ?auto_179034 ) ( CLEAR ?auto_179033 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179038 ) ( ON ?auto_179037 ?auto_179038 ) ( ON ?auto_179036 ?auto_179037 ) ( ON ?auto_179035 ?auto_179036 ) ( not ( = ?auto_179038 ?auto_179037 ) ) ( not ( = ?auto_179038 ?auto_179036 ) ) ( not ( = ?auto_179038 ?auto_179035 ) ) ( not ( = ?auto_179038 ?auto_179034 ) ) ( not ( = ?auto_179038 ?auto_179033 ) ) ( not ( = ?auto_179037 ?auto_179036 ) ) ( not ( = ?auto_179037 ?auto_179035 ) ) ( not ( = ?auto_179037 ?auto_179034 ) ) ( not ( = ?auto_179037 ?auto_179033 ) ) ( not ( = ?auto_179036 ?auto_179035 ) ) ( not ( = ?auto_179036 ?auto_179034 ) ) ( not ( = ?auto_179036 ?auto_179033 ) ) ( not ( = ?auto_179031 ?auto_179038 ) ) ( not ( = ?auto_179031 ?auto_179037 ) ) ( not ( = ?auto_179031 ?auto_179036 ) ) ( not ( = ?auto_179032 ?auto_179038 ) ) ( not ( = ?auto_179032 ?auto_179037 ) ) ( not ( = ?auto_179032 ?auto_179036 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179038 ?auto_179037 ?auto_179036 ?auto_179035 ?auto_179034 )
      ( MAKE-4PILE ?auto_179031 ?auto_179032 ?auto_179033 ?auto_179034 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179039 - BLOCK
      ?auto_179040 - BLOCK
      ?auto_179041 - BLOCK
      ?auto_179042 - BLOCK
    )
    :vars
    (
      ?auto_179043 - BLOCK
      ?auto_179046 - BLOCK
      ?auto_179045 - BLOCK
      ?auto_179044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179039 ) ( not ( = ?auto_179039 ?auto_179040 ) ) ( not ( = ?auto_179039 ?auto_179041 ) ) ( not ( = ?auto_179039 ?auto_179042 ) ) ( not ( = ?auto_179040 ?auto_179041 ) ) ( not ( = ?auto_179040 ?auto_179042 ) ) ( not ( = ?auto_179041 ?auto_179042 ) ) ( ON ?auto_179042 ?auto_179043 ) ( not ( = ?auto_179039 ?auto_179043 ) ) ( not ( = ?auto_179040 ?auto_179043 ) ) ( not ( = ?auto_179041 ?auto_179043 ) ) ( not ( = ?auto_179042 ?auto_179043 ) ) ( ON ?auto_179041 ?auto_179042 ) ( CLEAR ?auto_179041 ) ( ON-TABLE ?auto_179046 ) ( ON ?auto_179045 ?auto_179046 ) ( ON ?auto_179044 ?auto_179045 ) ( ON ?auto_179043 ?auto_179044 ) ( not ( = ?auto_179046 ?auto_179045 ) ) ( not ( = ?auto_179046 ?auto_179044 ) ) ( not ( = ?auto_179046 ?auto_179043 ) ) ( not ( = ?auto_179046 ?auto_179042 ) ) ( not ( = ?auto_179046 ?auto_179041 ) ) ( not ( = ?auto_179045 ?auto_179044 ) ) ( not ( = ?auto_179045 ?auto_179043 ) ) ( not ( = ?auto_179045 ?auto_179042 ) ) ( not ( = ?auto_179045 ?auto_179041 ) ) ( not ( = ?auto_179044 ?auto_179043 ) ) ( not ( = ?auto_179044 ?auto_179042 ) ) ( not ( = ?auto_179044 ?auto_179041 ) ) ( not ( = ?auto_179039 ?auto_179046 ) ) ( not ( = ?auto_179039 ?auto_179045 ) ) ( not ( = ?auto_179039 ?auto_179044 ) ) ( not ( = ?auto_179040 ?auto_179046 ) ) ( not ( = ?auto_179040 ?auto_179045 ) ) ( not ( = ?auto_179040 ?auto_179044 ) ) ( HOLDING ?auto_179040 ) ( CLEAR ?auto_179039 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179039 ?auto_179040 )
      ( MAKE-4PILE ?auto_179039 ?auto_179040 ?auto_179041 ?auto_179042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179047 - BLOCK
      ?auto_179048 - BLOCK
      ?auto_179049 - BLOCK
      ?auto_179050 - BLOCK
    )
    :vars
    (
      ?auto_179054 - BLOCK
      ?auto_179052 - BLOCK
      ?auto_179051 - BLOCK
      ?auto_179053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179047 ) ( not ( = ?auto_179047 ?auto_179048 ) ) ( not ( = ?auto_179047 ?auto_179049 ) ) ( not ( = ?auto_179047 ?auto_179050 ) ) ( not ( = ?auto_179048 ?auto_179049 ) ) ( not ( = ?auto_179048 ?auto_179050 ) ) ( not ( = ?auto_179049 ?auto_179050 ) ) ( ON ?auto_179050 ?auto_179054 ) ( not ( = ?auto_179047 ?auto_179054 ) ) ( not ( = ?auto_179048 ?auto_179054 ) ) ( not ( = ?auto_179049 ?auto_179054 ) ) ( not ( = ?auto_179050 ?auto_179054 ) ) ( ON ?auto_179049 ?auto_179050 ) ( ON-TABLE ?auto_179052 ) ( ON ?auto_179051 ?auto_179052 ) ( ON ?auto_179053 ?auto_179051 ) ( ON ?auto_179054 ?auto_179053 ) ( not ( = ?auto_179052 ?auto_179051 ) ) ( not ( = ?auto_179052 ?auto_179053 ) ) ( not ( = ?auto_179052 ?auto_179054 ) ) ( not ( = ?auto_179052 ?auto_179050 ) ) ( not ( = ?auto_179052 ?auto_179049 ) ) ( not ( = ?auto_179051 ?auto_179053 ) ) ( not ( = ?auto_179051 ?auto_179054 ) ) ( not ( = ?auto_179051 ?auto_179050 ) ) ( not ( = ?auto_179051 ?auto_179049 ) ) ( not ( = ?auto_179053 ?auto_179054 ) ) ( not ( = ?auto_179053 ?auto_179050 ) ) ( not ( = ?auto_179053 ?auto_179049 ) ) ( not ( = ?auto_179047 ?auto_179052 ) ) ( not ( = ?auto_179047 ?auto_179051 ) ) ( not ( = ?auto_179047 ?auto_179053 ) ) ( not ( = ?auto_179048 ?auto_179052 ) ) ( not ( = ?auto_179048 ?auto_179051 ) ) ( not ( = ?auto_179048 ?auto_179053 ) ) ( CLEAR ?auto_179047 ) ( ON ?auto_179048 ?auto_179049 ) ( CLEAR ?auto_179048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179052 ?auto_179051 ?auto_179053 ?auto_179054 ?auto_179050 ?auto_179049 )
      ( MAKE-4PILE ?auto_179047 ?auto_179048 ?auto_179049 ?auto_179050 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179055 - BLOCK
      ?auto_179056 - BLOCK
      ?auto_179057 - BLOCK
      ?auto_179058 - BLOCK
    )
    :vars
    (
      ?auto_179059 - BLOCK
      ?auto_179060 - BLOCK
      ?auto_179062 - BLOCK
      ?auto_179061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179055 ?auto_179056 ) ) ( not ( = ?auto_179055 ?auto_179057 ) ) ( not ( = ?auto_179055 ?auto_179058 ) ) ( not ( = ?auto_179056 ?auto_179057 ) ) ( not ( = ?auto_179056 ?auto_179058 ) ) ( not ( = ?auto_179057 ?auto_179058 ) ) ( ON ?auto_179058 ?auto_179059 ) ( not ( = ?auto_179055 ?auto_179059 ) ) ( not ( = ?auto_179056 ?auto_179059 ) ) ( not ( = ?auto_179057 ?auto_179059 ) ) ( not ( = ?auto_179058 ?auto_179059 ) ) ( ON ?auto_179057 ?auto_179058 ) ( ON-TABLE ?auto_179060 ) ( ON ?auto_179062 ?auto_179060 ) ( ON ?auto_179061 ?auto_179062 ) ( ON ?auto_179059 ?auto_179061 ) ( not ( = ?auto_179060 ?auto_179062 ) ) ( not ( = ?auto_179060 ?auto_179061 ) ) ( not ( = ?auto_179060 ?auto_179059 ) ) ( not ( = ?auto_179060 ?auto_179058 ) ) ( not ( = ?auto_179060 ?auto_179057 ) ) ( not ( = ?auto_179062 ?auto_179061 ) ) ( not ( = ?auto_179062 ?auto_179059 ) ) ( not ( = ?auto_179062 ?auto_179058 ) ) ( not ( = ?auto_179062 ?auto_179057 ) ) ( not ( = ?auto_179061 ?auto_179059 ) ) ( not ( = ?auto_179061 ?auto_179058 ) ) ( not ( = ?auto_179061 ?auto_179057 ) ) ( not ( = ?auto_179055 ?auto_179060 ) ) ( not ( = ?auto_179055 ?auto_179062 ) ) ( not ( = ?auto_179055 ?auto_179061 ) ) ( not ( = ?auto_179056 ?auto_179060 ) ) ( not ( = ?auto_179056 ?auto_179062 ) ) ( not ( = ?auto_179056 ?auto_179061 ) ) ( ON ?auto_179056 ?auto_179057 ) ( CLEAR ?auto_179056 ) ( HOLDING ?auto_179055 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179055 )
      ( MAKE-4PILE ?auto_179055 ?auto_179056 ?auto_179057 ?auto_179058 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179063 - BLOCK
      ?auto_179064 - BLOCK
      ?auto_179065 - BLOCK
      ?auto_179066 - BLOCK
    )
    :vars
    (
      ?auto_179068 - BLOCK
      ?auto_179069 - BLOCK
      ?auto_179067 - BLOCK
      ?auto_179070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179063 ?auto_179064 ) ) ( not ( = ?auto_179063 ?auto_179065 ) ) ( not ( = ?auto_179063 ?auto_179066 ) ) ( not ( = ?auto_179064 ?auto_179065 ) ) ( not ( = ?auto_179064 ?auto_179066 ) ) ( not ( = ?auto_179065 ?auto_179066 ) ) ( ON ?auto_179066 ?auto_179068 ) ( not ( = ?auto_179063 ?auto_179068 ) ) ( not ( = ?auto_179064 ?auto_179068 ) ) ( not ( = ?auto_179065 ?auto_179068 ) ) ( not ( = ?auto_179066 ?auto_179068 ) ) ( ON ?auto_179065 ?auto_179066 ) ( ON-TABLE ?auto_179069 ) ( ON ?auto_179067 ?auto_179069 ) ( ON ?auto_179070 ?auto_179067 ) ( ON ?auto_179068 ?auto_179070 ) ( not ( = ?auto_179069 ?auto_179067 ) ) ( not ( = ?auto_179069 ?auto_179070 ) ) ( not ( = ?auto_179069 ?auto_179068 ) ) ( not ( = ?auto_179069 ?auto_179066 ) ) ( not ( = ?auto_179069 ?auto_179065 ) ) ( not ( = ?auto_179067 ?auto_179070 ) ) ( not ( = ?auto_179067 ?auto_179068 ) ) ( not ( = ?auto_179067 ?auto_179066 ) ) ( not ( = ?auto_179067 ?auto_179065 ) ) ( not ( = ?auto_179070 ?auto_179068 ) ) ( not ( = ?auto_179070 ?auto_179066 ) ) ( not ( = ?auto_179070 ?auto_179065 ) ) ( not ( = ?auto_179063 ?auto_179069 ) ) ( not ( = ?auto_179063 ?auto_179067 ) ) ( not ( = ?auto_179063 ?auto_179070 ) ) ( not ( = ?auto_179064 ?auto_179069 ) ) ( not ( = ?auto_179064 ?auto_179067 ) ) ( not ( = ?auto_179064 ?auto_179070 ) ) ( ON ?auto_179064 ?auto_179065 ) ( ON ?auto_179063 ?auto_179064 ) ( CLEAR ?auto_179063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179069 ?auto_179067 ?auto_179070 ?auto_179068 ?auto_179066 ?auto_179065 ?auto_179064 )
      ( MAKE-4PILE ?auto_179063 ?auto_179064 ?auto_179065 ?auto_179066 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179075 - BLOCK
      ?auto_179076 - BLOCK
      ?auto_179077 - BLOCK
      ?auto_179078 - BLOCK
    )
    :vars
    (
      ?auto_179081 - BLOCK
      ?auto_179080 - BLOCK
      ?auto_179082 - BLOCK
      ?auto_179079 - BLOCK
      ?auto_179083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179075 ?auto_179076 ) ) ( not ( = ?auto_179075 ?auto_179077 ) ) ( not ( = ?auto_179075 ?auto_179078 ) ) ( not ( = ?auto_179076 ?auto_179077 ) ) ( not ( = ?auto_179076 ?auto_179078 ) ) ( not ( = ?auto_179077 ?auto_179078 ) ) ( ON ?auto_179078 ?auto_179081 ) ( not ( = ?auto_179075 ?auto_179081 ) ) ( not ( = ?auto_179076 ?auto_179081 ) ) ( not ( = ?auto_179077 ?auto_179081 ) ) ( not ( = ?auto_179078 ?auto_179081 ) ) ( ON ?auto_179077 ?auto_179078 ) ( ON-TABLE ?auto_179080 ) ( ON ?auto_179082 ?auto_179080 ) ( ON ?auto_179079 ?auto_179082 ) ( ON ?auto_179081 ?auto_179079 ) ( not ( = ?auto_179080 ?auto_179082 ) ) ( not ( = ?auto_179080 ?auto_179079 ) ) ( not ( = ?auto_179080 ?auto_179081 ) ) ( not ( = ?auto_179080 ?auto_179078 ) ) ( not ( = ?auto_179080 ?auto_179077 ) ) ( not ( = ?auto_179082 ?auto_179079 ) ) ( not ( = ?auto_179082 ?auto_179081 ) ) ( not ( = ?auto_179082 ?auto_179078 ) ) ( not ( = ?auto_179082 ?auto_179077 ) ) ( not ( = ?auto_179079 ?auto_179081 ) ) ( not ( = ?auto_179079 ?auto_179078 ) ) ( not ( = ?auto_179079 ?auto_179077 ) ) ( not ( = ?auto_179075 ?auto_179080 ) ) ( not ( = ?auto_179075 ?auto_179082 ) ) ( not ( = ?auto_179075 ?auto_179079 ) ) ( not ( = ?auto_179076 ?auto_179080 ) ) ( not ( = ?auto_179076 ?auto_179082 ) ) ( not ( = ?auto_179076 ?auto_179079 ) ) ( ON ?auto_179076 ?auto_179077 ) ( CLEAR ?auto_179076 ) ( ON ?auto_179075 ?auto_179083 ) ( CLEAR ?auto_179075 ) ( HAND-EMPTY ) ( not ( = ?auto_179075 ?auto_179083 ) ) ( not ( = ?auto_179076 ?auto_179083 ) ) ( not ( = ?auto_179077 ?auto_179083 ) ) ( not ( = ?auto_179078 ?auto_179083 ) ) ( not ( = ?auto_179081 ?auto_179083 ) ) ( not ( = ?auto_179080 ?auto_179083 ) ) ( not ( = ?auto_179082 ?auto_179083 ) ) ( not ( = ?auto_179079 ?auto_179083 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179075 ?auto_179083 )
      ( MAKE-4PILE ?auto_179075 ?auto_179076 ?auto_179077 ?auto_179078 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179084 - BLOCK
      ?auto_179085 - BLOCK
      ?auto_179086 - BLOCK
      ?auto_179087 - BLOCK
    )
    :vars
    (
      ?auto_179092 - BLOCK
      ?auto_179089 - BLOCK
      ?auto_179088 - BLOCK
      ?auto_179091 - BLOCK
      ?auto_179090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179084 ?auto_179085 ) ) ( not ( = ?auto_179084 ?auto_179086 ) ) ( not ( = ?auto_179084 ?auto_179087 ) ) ( not ( = ?auto_179085 ?auto_179086 ) ) ( not ( = ?auto_179085 ?auto_179087 ) ) ( not ( = ?auto_179086 ?auto_179087 ) ) ( ON ?auto_179087 ?auto_179092 ) ( not ( = ?auto_179084 ?auto_179092 ) ) ( not ( = ?auto_179085 ?auto_179092 ) ) ( not ( = ?auto_179086 ?auto_179092 ) ) ( not ( = ?auto_179087 ?auto_179092 ) ) ( ON ?auto_179086 ?auto_179087 ) ( ON-TABLE ?auto_179089 ) ( ON ?auto_179088 ?auto_179089 ) ( ON ?auto_179091 ?auto_179088 ) ( ON ?auto_179092 ?auto_179091 ) ( not ( = ?auto_179089 ?auto_179088 ) ) ( not ( = ?auto_179089 ?auto_179091 ) ) ( not ( = ?auto_179089 ?auto_179092 ) ) ( not ( = ?auto_179089 ?auto_179087 ) ) ( not ( = ?auto_179089 ?auto_179086 ) ) ( not ( = ?auto_179088 ?auto_179091 ) ) ( not ( = ?auto_179088 ?auto_179092 ) ) ( not ( = ?auto_179088 ?auto_179087 ) ) ( not ( = ?auto_179088 ?auto_179086 ) ) ( not ( = ?auto_179091 ?auto_179092 ) ) ( not ( = ?auto_179091 ?auto_179087 ) ) ( not ( = ?auto_179091 ?auto_179086 ) ) ( not ( = ?auto_179084 ?auto_179089 ) ) ( not ( = ?auto_179084 ?auto_179088 ) ) ( not ( = ?auto_179084 ?auto_179091 ) ) ( not ( = ?auto_179085 ?auto_179089 ) ) ( not ( = ?auto_179085 ?auto_179088 ) ) ( not ( = ?auto_179085 ?auto_179091 ) ) ( ON ?auto_179084 ?auto_179090 ) ( CLEAR ?auto_179084 ) ( not ( = ?auto_179084 ?auto_179090 ) ) ( not ( = ?auto_179085 ?auto_179090 ) ) ( not ( = ?auto_179086 ?auto_179090 ) ) ( not ( = ?auto_179087 ?auto_179090 ) ) ( not ( = ?auto_179092 ?auto_179090 ) ) ( not ( = ?auto_179089 ?auto_179090 ) ) ( not ( = ?auto_179088 ?auto_179090 ) ) ( not ( = ?auto_179091 ?auto_179090 ) ) ( HOLDING ?auto_179085 ) ( CLEAR ?auto_179086 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179089 ?auto_179088 ?auto_179091 ?auto_179092 ?auto_179087 ?auto_179086 ?auto_179085 )
      ( MAKE-4PILE ?auto_179084 ?auto_179085 ?auto_179086 ?auto_179087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179093 - BLOCK
      ?auto_179094 - BLOCK
      ?auto_179095 - BLOCK
      ?auto_179096 - BLOCK
    )
    :vars
    (
      ?auto_179097 - BLOCK
      ?auto_179098 - BLOCK
      ?auto_179101 - BLOCK
      ?auto_179099 - BLOCK
      ?auto_179100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179093 ?auto_179094 ) ) ( not ( = ?auto_179093 ?auto_179095 ) ) ( not ( = ?auto_179093 ?auto_179096 ) ) ( not ( = ?auto_179094 ?auto_179095 ) ) ( not ( = ?auto_179094 ?auto_179096 ) ) ( not ( = ?auto_179095 ?auto_179096 ) ) ( ON ?auto_179096 ?auto_179097 ) ( not ( = ?auto_179093 ?auto_179097 ) ) ( not ( = ?auto_179094 ?auto_179097 ) ) ( not ( = ?auto_179095 ?auto_179097 ) ) ( not ( = ?auto_179096 ?auto_179097 ) ) ( ON ?auto_179095 ?auto_179096 ) ( ON-TABLE ?auto_179098 ) ( ON ?auto_179101 ?auto_179098 ) ( ON ?auto_179099 ?auto_179101 ) ( ON ?auto_179097 ?auto_179099 ) ( not ( = ?auto_179098 ?auto_179101 ) ) ( not ( = ?auto_179098 ?auto_179099 ) ) ( not ( = ?auto_179098 ?auto_179097 ) ) ( not ( = ?auto_179098 ?auto_179096 ) ) ( not ( = ?auto_179098 ?auto_179095 ) ) ( not ( = ?auto_179101 ?auto_179099 ) ) ( not ( = ?auto_179101 ?auto_179097 ) ) ( not ( = ?auto_179101 ?auto_179096 ) ) ( not ( = ?auto_179101 ?auto_179095 ) ) ( not ( = ?auto_179099 ?auto_179097 ) ) ( not ( = ?auto_179099 ?auto_179096 ) ) ( not ( = ?auto_179099 ?auto_179095 ) ) ( not ( = ?auto_179093 ?auto_179098 ) ) ( not ( = ?auto_179093 ?auto_179101 ) ) ( not ( = ?auto_179093 ?auto_179099 ) ) ( not ( = ?auto_179094 ?auto_179098 ) ) ( not ( = ?auto_179094 ?auto_179101 ) ) ( not ( = ?auto_179094 ?auto_179099 ) ) ( ON ?auto_179093 ?auto_179100 ) ( not ( = ?auto_179093 ?auto_179100 ) ) ( not ( = ?auto_179094 ?auto_179100 ) ) ( not ( = ?auto_179095 ?auto_179100 ) ) ( not ( = ?auto_179096 ?auto_179100 ) ) ( not ( = ?auto_179097 ?auto_179100 ) ) ( not ( = ?auto_179098 ?auto_179100 ) ) ( not ( = ?auto_179101 ?auto_179100 ) ) ( not ( = ?auto_179099 ?auto_179100 ) ) ( CLEAR ?auto_179095 ) ( ON ?auto_179094 ?auto_179093 ) ( CLEAR ?auto_179094 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179100 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179100 ?auto_179093 )
      ( MAKE-4PILE ?auto_179093 ?auto_179094 ?auto_179095 ?auto_179096 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179102 - BLOCK
      ?auto_179103 - BLOCK
      ?auto_179104 - BLOCK
      ?auto_179105 - BLOCK
    )
    :vars
    (
      ?auto_179108 - BLOCK
      ?auto_179107 - BLOCK
      ?auto_179106 - BLOCK
      ?auto_179109 - BLOCK
      ?auto_179110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179102 ?auto_179103 ) ) ( not ( = ?auto_179102 ?auto_179104 ) ) ( not ( = ?auto_179102 ?auto_179105 ) ) ( not ( = ?auto_179103 ?auto_179104 ) ) ( not ( = ?auto_179103 ?auto_179105 ) ) ( not ( = ?auto_179104 ?auto_179105 ) ) ( ON ?auto_179105 ?auto_179108 ) ( not ( = ?auto_179102 ?auto_179108 ) ) ( not ( = ?auto_179103 ?auto_179108 ) ) ( not ( = ?auto_179104 ?auto_179108 ) ) ( not ( = ?auto_179105 ?auto_179108 ) ) ( ON-TABLE ?auto_179107 ) ( ON ?auto_179106 ?auto_179107 ) ( ON ?auto_179109 ?auto_179106 ) ( ON ?auto_179108 ?auto_179109 ) ( not ( = ?auto_179107 ?auto_179106 ) ) ( not ( = ?auto_179107 ?auto_179109 ) ) ( not ( = ?auto_179107 ?auto_179108 ) ) ( not ( = ?auto_179107 ?auto_179105 ) ) ( not ( = ?auto_179107 ?auto_179104 ) ) ( not ( = ?auto_179106 ?auto_179109 ) ) ( not ( = ?auto_179106 ?auto_179108 ) ) ( not ( = ?auto_179106 ?auto_179105 ) ) ( not ( = ?auto_179106 ?auto_179104 ) ) ( not ( = ?auto_179109 ?auto_179108 ) ) ( not ( = ?auto_179109 ?auto_179105 ) ) ( not ( = ?auto_179109 ?auto_179104 ) ) ( not ( = ?auto_179102 ?auto_179107 ) ) ( not ( = ?auto_179102 ?auto_179106 ) ) ( not ( = ?auto_179102 ?auto_179109 ) ) ( not ( = ?auto_179103 ?auto_179107 ) ) ( not ( = ?auto_179103 ?auto_179106 ) ) ( not ( = ?auto_179103 ?auto_179109 ) ) ( ON ?auto_179102 ?auto_179110 ) ( not ( = ?auto_179102 ?auto_179110 ) ) ( not ( = ?auto_179103 ?auto_179110 ) ) ( not ( = ?auto_179104 ?auto_179110 ) ) ( not ( = ?auto_179105 ?auto_179110 ) ) ( not ( = ?auto_179108 ?auto_179110 ) ) ( not ( = ?auto_179107 ?auto_179110 ) ) ( not ( = ?auto_179106 ?auto_179110 ) ) ( not ( = ?auto_179109 ?auto_179110 ) ) ( ON ?auto_179103 ?auto_179102 ) ( CLEAR ?auto_179103 ) ( ON-TABLE ?auto_179110 ) ( HOLDING ?auto_179104 ) ( CLEAR ?auto_179105 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179107 ?auto_179106 ?auto_179109 ?auto_179108 ?auto_179105 ?auto_179104 )
      ( MAKE-4PILE ?auto_179102 ?auto_179103 ?auto_179104 ?auto_179105 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179111 - BLOCK
      ?auto_179112 - BLOCK
      ?auto_179113 - BLOCK
      ?auto_179114 - BLOCK
    )
    :vars
    (
      ?auto_179116 - BLOCK
      ?auto_179118 - BLOCK
      ?auto_179117 - BLOCK
      ?auto_179115 - BLOCK
      ?auto_179119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179111 ?auto_179112 ) ) ( not ( = ?auto_179111 ?auto_179113 ) ) ( not ( = ?auto_179111 ?auto_179114 ) ) ( not ( = ?auto_179112 ?auto_179113 ) ) ( not ( = ?auto_179112 ?auto_179114 ) ) ( not ( = ?auto_179113 ?auto_179114 ) ) ( ON ?auto_179114 ?auto_179116 ) ( not ( = ?auto_179111 ?auto_179116 ) ) ( not ( = ?auto_179112 ?auto_179116 ) ) ( not ( = ?auto_179113 ?auto_179116 ) ) ( not ( = ?auto_179114 ?auto_179116 ) ) ( ON-TABLE ?auto_179118 ) ( ON ?auto_179117 ?auto_179118 ) ( ON ?auto_179115 ?auto_179117 ) ( ON ?auto_179116 ?auto_179115 ) ( not ( = ?auto_179118 ?auto_179117 ) ) ( not ( = ?auto_179118 ?auto_179115 ) ) ( not ( = ?auto_179118 ?auto_179116 ) ) ( not ( = ?auto_179118 ?auto_179114 ) ) ( not ( = ?auto_179118 ?auto_179113 ) ) ( not ( = ?auto_179117 ?auto_179115 ) ) ( not ( = ?auto_179117 ?auto_179116 ) ) ( not ( = ?auto_179117 ?auto_179114 ) ) ( not ( = ?auto_179117 ?auto_179113 ) ) ( not ( = ?auto_179115 ?auto_179116 ) ) ( not ( = ?auto_179115 ?auto_179114 ) ) ( not ( = ?auto_179115 ?auto_179113 ) ) ( not ( = ?auto_179111 ?auto_179118 ) ) ( not ( = ?auto_179111 ?auto_179117 ) ) ( not ( = ?auto_179111 ?auto_179115 ) ) ( not ( = ?auto_179112 ?auto_179118 ) ) ( not ( = ?auto_179112 ?auto_179117 ) ) ( not ( = ?auto_179112 ?auto_179115 ) ) ( ON ?auto_179111 ?auto_179119 ) ( not ( = ?auto_179111 ?auto_179119 ) ) ( not ( = ?auto_179112 ?auto_179119 ) ) ( not ( = ?auto_179113 ?auto_179119 ) ) ( not ( = ?auto_179114 ?auto_179119 ) ) ( not ( = ?auto_179116 ?auto_179119 ) ) ( not ( = ?auto_179118 ?auto_179119 ) ) ( not ( = ?auto_179117 ?auto_179119 ) ) ( not ( = ?auto_179115 ?auto_179119 ) ) ( ON ?auto_179112 ?auto_179111 ) ( ON-TABLE ?auto_179119 ) ( CLEAR ?auto_179114 ) ( ON ?auto_179113 ?auto_179112 ) ( CLEAR ?auto_179113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179119 ?auto_179111 ?auto_179112 )
      ( MAKE-4PILE ?auto_179111 ?auto_179112 ?auto_179113 ?auto_179114 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179120 - BLOCK
      ?auto_179121 - BLOCK
      ?auto_179122 - BLOCK
      ?auto_179123 - BLOCK
    )
    :vars
    (
      ?auto_179124 - BLOCK
      ?auto_179127 - BLOCK
      ?auto_179125 - BLOCK
      ?auto_179128 - BLOCK
      ?auto_179126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179120 ?auto_179121 ) ) ( not ( = ?auto_179120 ?auto_179122 ) ) ( not ( = ?auto_179120 ?auto_179123 ) ) ( not ( = ?auto_179121 ?auto_179122 ) ) ( not ( = ?auto_179121 ?auto_179123 ) ) ( not ( = ?auto_179122 ?auto_179123 ) ) ( not ( = ?auto_179120 ?auto_179124 ) ) ( not ( = ?auto_179121 ?auto_179124 ) ) ( not ( = ?auto_179122 ?auto_179124 ) ) ( not ( = ?auto_179123 ?auto_179124 ) ) ( ON-TABLE ?auto_179127 ) ( ON ?auto_179125 ?auto_179127 ) ( ON ?auto_179128 ?auto_179125 ) ( ON ?auto_179124 ?auto_179128 ) ( not ( = ?auto_179127 ?auto_179125 ) ) ( not ( = ?auto_179127 ?auto_179128 ) ) ( not ( = ?auto_179127 ?auto_179124 ) ) ( not ( = ?auto_179127 ?auto_179123 ) ) ( not ( = ?auto_179127 ?auto_179122 ) ) ( not ( = ?auto_179125 ?auto_179128 ) ) ( not ( = ?auto_179125 ?auto_179124 ) ) ( not ( = ?auto_179125 ?auto_179123 ) ) ( not ( = ?auto_179125 ?auto_179122 ) ) ( not ( = ?auto_179128 ?auto_179124 ) ) ( not ( = ?auto_179128 ?auto_179123 ) ) ( not ( = ?auto_179128 ?auto_179122 ) ) ( not ( = ?auto_179120 ?auto_179127 ) ) ( not ( = ?auto_179120 ?auto_179125 ) ) ( not ( = ?auto_179120 ?auto_179128 ) ) ( not ( = ?auto_179121 ?auto_179127 ) ) ( not ( = ?auto_179121 ?auto_179125 ) ) ( not ( = ?auto_179121 ?auto_179128 ) ) ( ON ?auto_179120 ?auto_179126 ) ( not ( = ?auto_179120 ?auto_179126 ) ) ( not ( = ?auto_179121 ?auto_179126 ) ) ( not ( = ?auto_179122 ?auto_179126 ) ) ( not ( = ?auto_179123 ?auto_179126 ) ) ( not ( = ?auto_179124 ?auto_179126 ) ) ( not ( = ?auto_179127 ?auto_179126 ) ) ( not ( = ?auto_179125 ?auto_179126 ) ) ( not ( = ?auto_179128 ?auto_179126 ) ) ( ON ?auto_179121 ?auto_179120 ) ( ON-TABLE ?auto_179126 ) ( ON ?auto_179122 ?auto_179121 ) ( CLEAR ?auto_179122 ) ( HOLDING ?auto_179123 ) ( CLEAR ?auto_179124 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179127 ?auto_179125 ?auto_179128 ?auto_179124 ?auto_179123 )
      ( MAKE-4PILE ?auto_179120 ?auto_179121 ?auto_179122 ?auto_179123 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179129 - BLOCK
      ?auto_179130 - BLOCK
      ?auto_179131 - BLOCK
      ?auto_179132 - BLOCK
    )
    :vars
    (
      ?auto_179135 - BLOCK
      ?auto_179134 - BLOCK
      ?auto_179136 - BLOCK
      ?auto_179137 - BLOCK
      ?auto_179133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179129 ?auto_179130 ) ) ( not ( = ?auto_179129 ?auto_179131 ) ) ( not ( = ?auto_179129 ?auto_179132 ) ) ( not ( = ?auto_179130 ?auto_179131 ) ) ( not ( = ?auto_179130 ?auto_179132 ) ) ( not ( = ?auto_179131 ?auto_179132 ) ) ( not ( = ?auto_179129 ?auto_179135 ) ) ( not ( = ?auto_179130 ?auto_179135 ) ) ( not ( = ?auto_179131 ?auto_179135 ) ) ( not ( = ?auto_179132 ?auto_179135 ) ) ( ON-TABLE ?auto_179134 ) ( ON ?auto_179136 ?auto_179134 ) ( ON ?auto_179137 ?auto_179136 ) ( ON ?auto_179135 ?auto_179137 ) ( not ( = ?auto_179134 ?auto_179136 ) ) ( not ( = ?auto_179134 ?auto_179137 ) ) ( not ( = ?auto_179134 ?auto_179135 ) ) ( not ( = ?auto_179134 ?auto_179132 ) ) ( not ( = ?auto_179134 ?auto_179131 ) ) ( not ( = ?auto_179136 ?auto_179137 ) ) ( not ( = ?auto_179136 ?auto_179135 ) ) ( not ( = ?auto_179136 ?auto_179132 ) ) ( not ( = ?auto_179136 ?auto_179131 ) ) ( not ( = ?auto_179137 ?auto_179135 ) ) ( not ( = ?auto_179137 ?auto_179132 ) ) ( not ( = ?auto_179137 ?auto_179131 ) ) ( not ( = ?auto_179129 ?auto_179134 ) ) ( not ( = ?auto_179129 ?auto_179136 ) ) ( not ( = ?auto_179129 ?auto_179137 ) ) ( not ( = ?auto_179130 ?auto_179134 ) ) ( not ( = ?auto_179130 ?auto_179136 ) ) ( not ( = ?auto_179130 ?auto_179137 ) ) ( ON ?auto_179129 ?auto_179133 ) ( not ( = ?auto_179129 ?auto_179133 ) ) ( not ( = ?auto_179130 ?auto_179133 ) ) ( not ( = ?auto_179131 ?auto_179133 ) ) ( not ( = ?auto_179132 ?auto_179133 ) ) ( not ( = ?auto_179135 ?auto_179133 ) ) ( not ( = ?auto_179134 ?auto_179133 ) ) ( not ( = ?auto_179136 ?auto_179133 ) ) ( not ( = ?auto_179137 ?auto_179133 ) ) ( ON ?auto_179130 ?auto_179129 ) ( ON-TABLE ?auto_179133 ) ( ON ?auto_179131 ?auto_179130 ) ( CLEAR ?auto_179135 ) ( ON ?auto_179132 ?auto_179131 ) ( CLEAR ?auto_179132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179133 ?auto_179129 ?auto_179130 ?auto_179131 )
      ( MAKE-4PILE ?auto_179129 ?auto_179130 ?auto_179131 ?auto_179132 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179138 - BLOCK
      ?auto_179139 - BLOCK
      ?auto_179140 - BLOCK
      ?auto_179141 - BLOCK
    )
    :vars
    (
      ?auto_179145 - BLOCK
      ?auto_179144 - BLOCK
      ?auto_179143 - BLOCK
      ?auto_179142 - BLOCK
      ?auto_179146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179138 ?auto_179139 ) ) ( not ( = ?auto_179138 ?auto_179140 ) ) ( not ( = ?auto_179138 ?auto_179141 ) ) ( not ( = ?auto_179139 ?auto_179140 ) ) ( not ( = ?auto_179139 ?auto_179141 ) ) ( not ( = ?auto_179140 ?auto_179141 ) ) ( not ( = ?auto_179138 ?auto_179145 ) ) ( not ( = ?auto_179139 ?auto_179145 ) ) ( not ( = ?auto_179140 ?auto_179145 ) ) ( not ( = ?auto_179141 ?auto_179145 ) ) ( ON-TABLE ?auto_179144 ) ( ON ?auto_179143 ?auto_179144 ) ( ON ?auto_179142 ?auto_179143 ) ( not ( = ?auto_179144 ?auto_179143 ) ) ( not ( = ?auto_179144 ?auto_179142 ) ) ( not ( = ?auto_179144 ?auto_179145 ) ) ( not ( = ?auto_179144 ?auto_179141 ) ) ( not ( = ?auto_179144 ?auto_179140 ) ) ( not ( = ?auto_179143 ?auto_179142 ) ) ( not ( = ?auto_179143 ?auto_179145 ) ) ( not ( = ?auto_179143 ?auto_179141 ) ) ( not ( = ?auto_179143 ?auto_179140 ) ) ( not ( = ?auto_179142 ?auto_179145 ) ) ( not ( = ?auto_179142 ?auto_179141 ) ) ( not ( = ?auto_179142 ?auto_179140 ) ) ( not ( = ?auto_179138 ?auto_179144 ) ) ( not ( = ?auto_179138 ?auto_179143 ) ) ( not ( = ?auto_179138 ?auto_179142 ) ) ( not ( = ?auto_179139 ?auto_179144 ) ) ( not ( = ?auto_179139 ?auto_179143 ) ) ( not ( = ?auto_179139 ?auto_179142 ) ) ( ON ?auto_179138 ?auto_179146 ) ( not ( = ?auto_179138 ?auto_179146 ) ) ( not ( = ?auto_179139 ?auto_179146 ) ) ( not ( = ?auto_179140 ?auto_179146 ) ) ( not ( = ?auto_179141 ?auto_179146 ) ) ( not ( = ?auto_179145 ?auto_179146 ) ) ( not ( = ?auto_179144 ?auto_179146 ) ) ( not ( = ?auto_179143 ?auto_179146 ) ) ( not ( = ?auto_179142 ?auto_179146 ) ) ( ON ?auto_179139 ?auto_179138 ) ( ON-TABLE ?auto_179146 ) ( ON ?auto_179140 ?auto_179139 ) ( ON ?auto_179141 ?auto_179140 ) ( CLEAR ?auto_179141 ) ( HOLDING ?auto_179145 ) ( CLEAR ?auto_179142 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179144 ?auto_179143 ?auto_179142 ?auto_179145 )
      ( MAKE-4PILE ?auto_179138 ?auto_179139 ?auto_179140 ?auto_179141 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179147 - BLOCK
      ?auto_179148 - BLOCK
      ?auto_179149 - BLOCK
      ?auto_179150 - BLOCK
    )
    :vars
    (
      ?auto_179153 - BLOCK
      ?auto_179154 - BLOCK
      ?auto_179155 - BLOCK
      ?auto_179151 - BLOCK
      ?auto_179152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179147 ?auto_179148 ) ) ( not ( = ?auto_179147 ?auto_179149 ) ) ( not ( = ?auto_179147 ?auto_179150 ) ) ( not ( = ?auto_179148 ?auto_179149 ) ) ( not ( = ?auto_179148 ?auto_179150 ) ) ( not ( = ?auto_179149 ?auto_179150 ) ) ( not ( = ?auto_179147 ?auto_179153 ) ) ( not ( = ?auto_179148 ?auto_179153 ) ) ( not ( = ?auto_179149 ?auto_179153 ) ) ( not ( = ?auto_179150 ?auto_179153 ) ) ( ON-TABLE ?auto_179154 ) ( ON ?auto_179155 ?auto_179154 ) ( ON ?auto_179151 ?auto_179155 ) ( not ( = ?auto_179154 ?auto_179155 ) ) ( not ( = ?auto_179154 ?auto_179151 ) ) ( not ( = ?auto_179154 ?auto_179153 ) ) ( not ( = ?auto_179154 ?auto_179150 ) ) ( not ( = ?auto_179154 ?auto_179149 ) ) ( not ( = ?auto_179155 ?auto_179151 ) ) ( not ( = ?auto_179155 ?auto_179153 ) ) ( not ( = ?auto_179155 ?auto_179150 ) ) ( not ( = ?auto_179155 ?auto_179149 ) ) ( not ( = ?auto_179151 ?auto_179153 ) ) ( not ( = ?auto_179151 ?auto_179150 ) ) ( not ( = ?auto_179151 ?auto_179149 ) ) ( not ( = ?auto_179147 ?auto_179154 ) ) ( not ( = ?auto_179147 ?auto_179155 ) ) ( not ( = ?auto_179147 ?auto_179151 ) ) ( not ( = ?auto_179148 ?auto_179154 ) ) ( not ( = ?auto_179148 ?auto_179155 ) ) ( not ( = ?auto_179148 ?auto_179151 ) ) ( ON ?auto_179147 ?auto_179152 ) ( not ( = ?auto_179147 ?auto_179152 ) ) ( not ( = ?auto_179148 ?auto_179152 ) ) ( not ( = ?auto_179149 ?auto_179152 ) ) ( not ( = ?auto_179150 ?auto_179152 ) ) ( not ( = ?auto_179153 ?auto_179152 ) ) ( not ( = ?auto_179154 ?auto_179152 ) ) ( not ( = ?auto_179155 ?auto_179152 ) ) ( not ( = ?auto_179151 ?auto_179152 ) ) ( ON ?auto_179148 ?auto_179147 ) ( ON-TABLE ?auto_179152 ) ( ON ?auto_179149 ?auto_179148 ) ( ON ?auto_179150 ?auto_179149 ) ( CLEAR ?auto_179151 ) ( ON ?auto_179153 ?auto_179150 ) ( CLEAR ?auto_179153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179152 ?auto_179147 ?auto_179148 ?auto_179149 ?auto_179150 )
      ( MAKE-4PILE ?auto_179147 ?auto_179148 ?auto_179149 ?auto_179150 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179156 - BLOCK
      ?auto_179157 - BLOCK
      ?auto_179158 - BLOCK
      ?auto_179159 - BLOCK
    )
    :vars
    (
      ?auto_179164 - BLOCK
      ?auto_179162 - BLOCK
      ?auto_179163 - BLOCK
      ?auto_179160 - BLOCK
      ?auto_179161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179156 ?auto_179157 ) ) ( not ( = ?auto_179156 ?auto_179158 ) ) ( not ( = ?auto_179156 ?auto_179159 ) ) ( not ( = ?auto_179157 ?auto_179158 ) ) ( not ( = ?auto_179157 ?auto_179159 ) ) ( not ( = ?auto_179158 ?auto_179159 ) ) ( not ( = ?auto_179156 ?auto_179164 ) ) ( not ( = ?auto_179157 ?auto_179164 ) ) ( not ( = ?auto_179158 ?auto_179164 ) ) ( not ( = ?auto_179159 ?auto_179164 ) ) ( ON-TABLE ?auto_179162 ) ( ON ?auto_179163 ?auto_179162 ) ( not ( = ?auto_179162 ?auto_179163 ) ) ( not ( = ?auto_179162 ?auto_179160 ) ) ( not ( = ?auto_179162 ?auto_179164 ) ) ( not ( = ?auto_179162 ?auto_179159 ) ) ( not ( = ?auto_179162 ?auto_179158 ) ) ( not ( = ?auto_179163 ?auto_179160 ) ) ( not ( = ?auto_179163 ?auto_179164 ) ) ( not ( = ?auto_179163 ?auto_179159 ) ) ( not ( = ?auto_179163 ?auto_179158 ) ) ( not ( = ?auto_179160 ?auto_179164 ) ) ( not ( = ?auto_179160 ?auto_179159 ) ) ( not ( = ?auto_179160 ?auto_179158 ) ) ( not ( = ?auto_179156 ?auto_179162 ) ) ( not ( = ?auto_179156 ?auto_179163 ) ) ( not ( = ?auto_179156 ?auto_179160 ) ) ( not ( = ?auto_179157 ?auto_179162 ) ) ( not ( = ?auto_179157 ?auto_179163 ) ) ( not ( = ?auto_179157 ?auto_179160 ) ) ( ON ?auto_179156 ?auto_179161 ) ( not ( = ?auto_179156 ?auto_179161 ) ) ( not ( = ?auto_179157 ?auto_179161 ) ) ( not ( = ?auto_179158 ?auto_179161 ) ) ( not ( = ?auto_179159 ?auto_179161 ) ) ( not ( = ?auto_179164 ?auto_179161 ) ) ( not ( = ?auto_179162 ?auto_179161 ) ) ( not ( = ?auto_179163 ?auto_179161 ) ) ( not ( = ?auto_179160 ?auto_179161 ) ) ( ON ?auto_179157 ?auto_179156 ) ( ON-TABLE ?auto_179161 ) ( ON ?auto_179158 ?auto_179157 ) ( ON ?auto_179159 ?auto_179158 ) ( ON ?auto_179164 ?auto_179159 ) ( CLEAR ?auto_179164 ) ( HOLDING ?auto_179160 ) ( CLEAR ?auto_179163 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179162 ?auto_179163 ?auto_179160 )
      ( MAKE-4PILE ?auto_179156 ?auto_179157 ?auto_179158 ?auto_179159 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179165 - BLOCK
      ?auto_179166 - BLOCK
      ?auto_179167 - BLOCK
      ?auto_179168 - BLOCK
    )
    :vars
    (
      ?auto_179170 - BLOCK
      ?auto_179172 - BLOCK
      ?auto_179171 - BLOCK
      ?auto_179169 - BLOCK
      ?auto_179173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179165 ?auto_179166 ) ) ( not ( = ?auto_179165 ?auto_179167 ) ) ( not ( = ?auto_179165 ?auto_179168 ) ) ( not ( = ?auto_179166 ?auto_179167 ) ) ( not ( = ?auto_179166 ?auto_179168 ) ) ( not ( = ?auto_179167 ?auto_179168 ) ) ( not ( = ?auto_179165 ?auto_179170 ) ) ( not ( = ?auto_179166 ?auto_179170 ) ) ( not ( = ?auto_179167 ?auto_179170 ) ) ( not ( = ?auto_179168 ?auto_179170 ) ) ( ON-TABLE ?auto_179172 ) ( ON ?auto_179171 ?auto_179172 ) ( not ( = ?auto_179172 ?auto_179171 ) ) ( not ( = ?auto_179172 ?auto_179169 ) ) ( not ( = ?auto_179172 ?auto_179170 ) ) ( not ( = ?auto_179172 ?auto_179168 ) ) ( not ( = ?auto_179172 ?auto_179167 ) ) ( not ( = ?auto_179171 ?auto_179169 ) ) ( not ( = ?auto_179171 ?auto_179170 ) ) ( not ( = ?auto_179171 ?auto_179168 ) ) ( not ( = ?auto_179171 ?auto_179167 ) ) ( not ( = ?auto_179169 ?auto_179170 ) ) ( not ( = ?auto_179169 ?auto_179168 ) ) ( not ( = ?auto_179169 ?auto_179167 ) ) ( not ( = ?auto_179165 ?auto_179172 ) ) ( not ( = ?auto_179165 ?auto_179171 ) ) ( not ( = ?auto_179165 ?auto_179169 ) ) ( not ( = ?auto_179166 ?auto_179172 ) ) ( not ( = ?auto_179166 ?auto_179171 ) ) ( not ( = ?auto_179166 ?auto_179169 ) ) ( ON ?auto_179165 ?auto_179173 ) ( not ( = ?auto_179165 ?auto_179173 ) ) ( not ( = ?auto_179166 ?auto_179173 ) ) ( not ( = ?auto_179167 ?auto_179173 ) ) ( not ( = ?auto_179168 ?auto_179173 ) ) ( not ( = ?auto_179170 ?auto_179173 ) ) ( not ( = ?auto_179172 ?auto_179173 ) ) ( not ( = ?auto_179171 ?auto_179173 ) ) ( not ( = ?auto_179169 ?auto_179173 ) ) ( ON ?auto_179166 ?auto_179165 ) ( ON-TABLE ?auto_179173 ) ( ON ?auto_179167 ?auto_179166 ) ( ON ?auto_179168 ?auto_179167 ) ( ON ?auto_179170 ?auto_179168 ) ( CLEAR ?auto_179171 ) ( ON ?auto_179169 ?auto_179170 ) ( CLEAR ?auto_179169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179173 ?auto_179165 ?auto_179166 ?auto_179167 ?auto_179168 ?auto_179170 )
      ( MAKE-4PILE ?auto_179165 ?auto_179166 ?auto_179167 ?auto_179168 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179174 - BLOCK
      ?auto_179175 - BLOCK
      ?auto_179176 - BLOCK
      ?auto_179177 - BLOCK
    )
    :vars
    (
      ?auto_179180 - BLOCK
      ?auto_179181 - BLOCK
      ?auto_179179 - BLOCK
      ?auto_179178 - BLOCK
      ?auto_179182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179174 ?auto_179175 ) ) ( not ( = ?auto_179174 ?auto_179176 ) ) ( not ( = ?auto_179174 ?auto_179177 ) ) ( not ( = ?auto_179175 ?auto_179176 ) ) ( not ( = ?auto_179175 ?auto_179177 ) ) ( not ( = ?auto_179176 ?auto_179177 ) ) ( not ( = ?auto_179174 ?auto_179180 ) ) ( not ( = ?auto_179175 ?auto_179180 ) ) ( not ( = ?auto_179176 ?auto_179180 ) ) ( not ( = ?auto_179177 ?auto_179180 ) ) ( ON-TABLE ?auto_179181 ) ( not ( = ?auto_179181 ?auto_179179 ) ) ( not ( = ?auto_179181 ?auto_179178 ) ) ( not ( = ?auto_179181 ?auto_179180 ) ) ( not ( = ?auto_179181 ?auto_179177 ) ) ( not ( = ?auto_179181 ?auto_179176 ) ) ( not ( = ?auto_179179 ?auto_179178 ) ) ( not ( = ?auto_179179 ?auto_179180 ) ) ( not ( = ?auto_179179 ?auto_179177 ) ) ( not ( = ?auto_179179 ?auto_179176 ) ) ( not ( = ?auto_179178 ?auto_179180 ) ) ( not ( = ?auto_179178 ?auto_179177 ) ) ( not ( = ?auto_179178 ?auto_179176 ) ) ( not ( = ?auto_179174 ?auto_179181 ) ) ( not ( = ?auto_179174 ?auto_179179 ) ) ( not ( = ?auto_179174 ?auto_179178 ) ) ( not ( = ?auto_179175 ?auto_179181 ) ) ( not ( = ?auto_179175 ?auto_179179 ) ) ( not ( = ?auto_179175 ?auto_179178 ) ) ( ON ?auto_179174 ?auto_179182 ) ( not ( = ?auto_179174 ?auto_179182 ) ) ( not ( = ?auto_179175 ?auto_179182 ) ) ( not ( = ?auto_179176 ?auto_179182 ) ) ( not ( = ?auto_179177 ?auto_179182 ) ) ( not ( = ?auto_179180 ?auto_179182 ) ) ( not ( = ?auto_179181 ?auto_179182 ) ) ( not ( = ?auto_179179 ?auto_179182 ) ) ( not ( = ?auto_179178 ?auto_179182 ) ) ( ON ?auto_179175 ?auto_179174 ) ( ON-TABLE ?auto_179182 ) ( ON ?auto_179176 ?auto_179175 ) ( ON ?auto_179177 ?auto_179176 ) ( ON ?auto_179180 ?auto_179177 ) ( ON ?auto_179178 ?auto_179180 ) ( CLEAR ?auto_179178 ) ( HOLDING ?auto_179179 ) ( CLEAR ?auto_179181 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179181 ?auto_179179 )
      ( MAKE-4PILE ?auto_179174 ?auto_179175 ?auto_179176 ?auto_179177 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179183 - BLOCK
      ?auto_179184 - BLOCK
      ?auto_179185 - BLOCK
      ?auto_179186 - BLOCK
    )
    :vars
    (
      ?auto_179190 - BLOCK
      ?auto_179187 - BLOCK
      ?auto_179188 - BLOCK
      ?auto_179189 - BLOCK
      ?auto_179191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179183 ?auto_179184 ) ) ( not ( = ?auto_179183 ?auto_179185 ) ) ( not ( = ?auto_179183 ?auto_179186 ) ) ( not ( = ?auto_179184 ?auto_179185 ) ) ( not ( = ?auto_179184 ?auto_179186 ) ) ( not ( = ?auto_179185 ?auto_179186 ) ) ( not ( = ?auto_179183 ?auto_179190 ) ) ( not ( = ?auto_179184 ?auto_179190 ) ) ( not ( = ?auto_179185 ?auto_179190 ) ) ( not ( = ?auto_179186 ?auto_179190 ) ) ( ON-TABLE ?auto_179187 ) ( not ( = ?auto_179187 ?auto_179188 ) ) ( not ( = ?auto_179187 ?auto_179189 ) ) ( not ( = ?auto_179187 ?auto_179190 ) ) ( not ( = ?auto_179187 ?auto_179186 ) ) ( not ( = ?auto_179187 ?auto_179185 ) ) ( not ( = ?auto_179188 ?auto_179189 ) ) ( not ( = ?auto_179188 ?auto_179190 ) ) ( not ( = ?auto_179188 ?auto_179186 ) ) ( not ( = ?auto_179188 ?auto_179185 ) ) ( not ( = ?auto_179189 ?auto_179190 ) ) ( not ( = ?auto_179189 ?auto_179186 ) ) ( not ( = ?auto_179189 ?auto_179185 ) ) ( not ( = ?auto_179183 ?auto_179187 ) ) ( not ( = ?auto_179183 ?auto_179188 ) ) ( not ( = ?auto_179183 ?auto_179189 ) ) ( not ( = ?auto_179184 ?auto_179187 ) ) ( not ( = ?auto_179184 ?auto_179188 ) ) ( not ( = ?auto_179184 ?auto_179189 ) ) ( ON ?auto_179183 ?auto_179191 ) ( not ( = ?auto_179183 ?auto_179191 ) ) ( not ( = ?auto_179184 ?auto_179191 ) ) ( not ( = ?auto_179185 ?auto_179191 ) ) ( not ( = ?auto_179186 ?auto_179191 ) ) ( not ( = ?auto_179190 ?auto_179191 ) ) ( not ( = ?auto_179187 ?auto_179191 ) ) ( not ( = ?auto_179188 ?auto_179191 ) ) ( not ( = ?auto_179189 ?auto_179191 ) ) ( ON ?auto_179184 ?auto_179183 ) ( ON-TABLE ?auto_179191 ) ( ON ?auto_179185 ?auto_179184 ) ( ON ?auto_179186 ?auto_179185 ) ( ON ?auto_179190 ?auto_179186 ) ( ON ?auto_179189 ?auto_179190 ) ( CLEAR ?auto_179187 ) ( ON ?auto_179188 ?auto_179189 ) ( CLEAR ?auto_179188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179191 ?auto_179183 ?auto_179184 ?auto_179185 ?auto_179186 ?auto_179190 ?auto_179189 )
      ( MAKE-4PILE ?auto_179183 ?auto_179184 ?auto_179185 ?auto_179186 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179192 - BLOCK
      ?auto_179193 - BLOCK
      ?auto_179194 - BLOCK
      ?auto_179195 - BLOCK
    )
    :vars
    (
      ?auto_179197 - BLOCK
      ?auto_179198 - BLOCK
      ?auto_179200 - BLOCK
      ?auto_179196 - BLOCK
      ?auto_179199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179192 ?auto_179193 ) ) ( not ( = ?auto_179192 ?auto_179194 ) ) ( not ( = ?auto_179192 ?auto_179195 ) ) ( not ( = ?auto_179193 ?auto_179194 ) ) ( not ( = ?auto_179193 ?auto_179195 ) ) ( not ( = ?auto_179194 ?auto_179195 ) ) ( not ( = ?auto_179192 ?auto_179197 ) ) ( not ( = ?auto_179193 ?auto_179197 ) ) ( not ( = ?auto_179194 ?auto_179197 ) ) ( not ( = ?auto_179195 ?auto_179197 ) ) ( not ( = ?auto_179198 ?auto_179200 ) ) ( not ( = ?auto_179198 ?auto_179196 ) ) ( not ( = ?auto_179198 ?auto_179197 ) ) ( not ( = ?auto_179198 ?auto_179195 ) ) ( not ( = ?auto_179198 ?auto_179194 ) ) ( not ( = ?auto_179200 ?auto_179196 ) ) ( not ( = ?auto_179200 ?auto_179197 ) ) ( not ( = ?auto_179200 ?auto_179195 ) ) ( not ( = ?auto_179200 ?auto_179194 ) ) ( not ( = ?auto_179196 ?auto_179197 ) ) ( not ( = ?auto_179196 ?auto_179195 ) ) ( not ( = ?auto_179196 ?auto_179194 ) ) ( not ( = ?auto_179192 ?auto_179198 ) ) ( not ( = ?auto_179192 ?auto_179200 ) ) ( not ( = ?auto_179192 ?auto_179196 ) ) ( not ( = ?auto_179193 ?auto_179198 ) ) ( not ( = ?auto_179193 ?auto_179200 ) ) ( not ( = ?auto_179193 ?auto_179196 ) ) ( ON ?auto_179192 ?auto_179199 ) ( not ( = ?auto_179192 ?auto_179199 ) ) ( not ( = ?auto_179193 ?auto_179199 ) ) ( not ( = ?auto_179194 ?auto_179199 ) ) ( not ( = ?auto_179195 ?auto_179199 ) ) ( not ( = ?auto_179197 ?auto_179199 ) ) ( not ( = ?auto_179198 ?auto_179199 ) ) ( not ( = ?auto_179200 ?auto_179199 ) ) ( not ( = ?auto_179196 ?auto_179199 ) ) ( ON ?auto_179193 ?auto_179192 ) ( ON-TABLE ?auto_179199 ) ( ON ?auto_179194 ?auto_179193 ) ( ON ?auto_179195 ?auto_179194 ) ( ON ?auto_179197 ?auto_179195 ) ( ON ?auto_179196 ?auto_179197 ) ( ON ?auto_179200 ?auto_179196 ) ( CLEAR ?auto_179200 ) ( HOLDING ?auto_179198 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179198 )
      ( MAKE-4PILE ?auto_179192 ?auto_179193 ?auto_179194 ?auto_179195 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_179201 - BLOCK
      ?auto_179202 - BLOCK
      ?auto_179203 - BLOCK
      ?auto_179204 - BLOCK
    )
    :vars
    (
      ?auto_179205 - BLOCK
      ?auto_179206 - BLOCK
      ?auto_179208 - BLOCK
      ?auto_179207 - BLOCK
      ?auto_179209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179201 ?auto_179202 ) ) ( not ( = ?auto_179201 ?auto_179203 ) ) ( not ( = ?auto_179201 ?auto_179204 ) ) ( not ( = ?auto_179202 ?auto_179203 ) ) ( not ( = ?auto_179202 ?auto_179204 ) ) ( not ( = ?auto_179203 ?auto_179204 ) ) ( not ( = ?auto_179201 ?auto_179205 ) ) ( not ( = ?auto_179202 ?auto_179205 ) ) ( not ( = ?auto_179203 ?auto_179205 ) ) ( not ( = ?auto_179204 ?auto_179205 ) ) ( not ( = ?auto_179206 ?auto_179208 ) ) ( not ( = ?auto_179206 ?auto_179207 ) ) ( not ( = ?auto_179206 ?auto_179205 ) ) ( not ( = ?auto_179206 ?auto_179204 ) ) ( not ( = ?auto_179206 ?auto_179203 ) ) ( not ( = ?auto_179208 ?auto_179207 ) ) ( not ( = ?auto_179208 ?auto_179205 ) ) ( not ( = ?auto_179208 ?auto_179204 ) ) ( not ( = ?auto_179208 ?auto_179203 ) ) ( not ( = ?auto_179207 ?auto_179205 ) ) ( not ( = ?auto_179207 ?auto_179204 ) ) ( not ( = ?auto_179207 ?auto_179203 ) ) ( not ( = ?auto_179201 ?auto_179206 ) ) ( not ( = ?auto_179201 ?auto_179208 ) ) ( not ( = ?auto_179201 ?auto_179207 ) ) ( not ( = ?auto_179202 ?auto_179206 ) ) ( not ( = ?auto_179202 ?auto_179208 ) ) ( not ( = ?auto_179202 ?auto_179207 ) ) ( ON ?auto_179201 ?auto_179209 ) ( not ( = ?auto_179201 ?auto_179209 ) ) ( not ( = ?auto_179202 ?auto_179209 ) ) ( not ( = ?auto_179203 ?auto_179209 ) ) ( not ( = ?auto_179204 ?auto_179209 ) ) ( not ( = ?auto_179205 ?auto_179209 ) ) ( not ( = ?auto_179206 ?auto_179209 ) ) ( not ( = ?auto_179208 ?auto_179209 ) ) ( not ( = ?auto_179207 ?auto_179209 ) ) ( ON ?auto_179202 ?auto_179201 ) ( ON-TABLE ?auto_179209 ) ( ON ?auto_179203 ?auto_179202 ) ( ON ?auto_179204 ?auto_179203 ) ( ON ?auto_179205 ?auto_179204 ) ( ON ?auto_179207 ?auto_179205 ) ( ON ?auto_179208 ?auto_179207 ) ( ON ?auto_179206 ?auto_179208 ) ( CLEAR ?auto_179206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179209 ?auto_179201 ?auto_179202 ?auto_179203 ?auto_179204 ?auto_179205 ?auto_179207 ?auto_179208 )
      ( MAKE-4PILE ?auto_179201 ?auto_179202 ?auto_179203 ?auto_179204 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179229 - BLOCK
      ?auto_179230 - BLOCK
      ?auto_179231 - BLOCK
    )
    :vars
    (
      ?auto_179234 - BLOCK
      ?auto_179232 - BLOCK
      ?auto_179233 - BLOCK
      ?auto_179236 - BLOCK
      ?auto_179235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179234 ?auto_179231 ) ( ON-TABLE ?auto_179229 ) ( ON ?auto_179230 ?auto_179229 ) ( ON ?auto_179231 ?auto_179230 ) ( not ( = ?auto_179229 ?auto_179230 ) ) ( not ( = ?auto_179229 ?auto_179231 ) ) ( not ( = ?auto_179229 ?auto_179234 ) ) ( not ( = ?auto_179230 ?auto_179231 ) ) ( not ( = ?auto_179230 ?auto_179234 ) ) ( not ( = ?auto_179231 ?auto_179234 ) ) ( not ( = ?auto_179229 ?auto_179232 ) ) ( not ( = ?auto_179229 ?auto_179233 ) ) ( not ( = ?auto_179230 ?auto_179232 ) ) ( not ( = ?auto_179230 ?auto_179233 ) ) ( not ( = ?auto_179231 ?auto_179232 ) ) ( not ( = ?auto_179231 ?auto_179233 ) ) ( not ( = ?auto_179234 ?auto_179232 ) ) ( not ( = ?auto_179234 ?auto_179233 ) ) ( not ( = ?auto_179232 ?auto_179233 ) ) ( ON ?auto_179232 ?auto_179234 ) ( CLEAR ?auto_179232 ) ( HOLDING ?auto_179233 ) ( CLEAR ?auto_179236 ) ( ON-TABLE ?auto_179235 ) ( ON ?auto_179236 ?auto_179235 ) ( not ( = ?auto_179235 ?auto_179236 ) ) ( not ( = ?auto_179235 ?auto_179233 ) ) ( not ( = ?auto_179236 ?auto_179233 ) ) ( not ( = ?auto_179229 ?auto_179236 ) ) ( not ( = ?auto_179229 ?auto_179235 ) ) ( not ( = ?auto_179230 ?auto_179236 ) ) ( not ( = ?auto_179230 ?auto_179235 ) ) ( not ( = ?auto_179231 ?auto_179236 ) ) ( not ( = ?auto_179231 ?auto_179235 ) ) ( not ( = ?auto_179234 ?auto_179236 ) ) ( not ( = ?auto_179234 ?auto_179235 ) ) ( not ( = ?auto_179232 ?auto_179236 ) ) ( not ( = ?auto_179232 ?auto_179235 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179235 ?auto_179236 ?auto_179233 )
      ( MAKE-3PILE ?auto_179229 ?auto_179230 ?auto_179231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179237 - BLOCK
      ?auto_179238 - BLOCK
      ?auto_179239 - BLOCK
    )
    :vars
    (
      ?auto_179240 - BLOCK
      ?auto_179241 - BLOCK
      ?auto_179242 - BLOCK
      ?auto_179243 - BLOCK
      ?auto_179244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179240 ?auto_179239 ) ( ON-TABLE ?auto_179237 ) ( ON ?auto_179238 ?auto_179237 ) ( ON ?auto_179239 ?auto_179238 ) ( not ( = ?auto_179237 ?auto_179238 ) ) ( not ( = ?auto_179237 ?auto_179239 ) ) ( not ( = ?auto_179237 ?auto_179240 ) ) ( not ( = ?auto_179238 ?auto_179239 ) ) ( not ( = ?auto_179238 ?auto_179240 ) ) ( not ( = ?auto_179239 ?auto_179240 ) ) ( not ( = ?auto_179237 ?auto_179241 ) ) ( not ( = ?auto_179237 ?auto_179242 ) ) ( not ( = ?auto_179238 ?auto_179241 ) ) ( not ( = ?auto_179238 ?auto_179242 ) ) ( not ( = ?auto_179239 ?auto_179241 ) ) ( not ( = ?auto_179239 ?auto_179242 ) ) ( not ( = ?auto_179240 ?auto_179241 ) ) ( not ( = ?auto_179240 ?auto_179242 ) ) ( not ( = ?auto_179241 ?auto_179242 ) ) ( ON ?auto_179241 ?auto_179240 ) ( CLEAR ?auto_179243 ) ( ON-TABLE ?auto_179244 ) ( ON ?auto_179243 ?auto_179244 ) ( not ( = ?auto_179244 ?auto_179243 ) ) ( not ( = ?auto_179244 ?auto_179242 ) ) ( not ( = ?auto_179243 ?auto_179242 ) ) ( not ( = ?auto_179237 ?auto_179243 ) ) ( not ( = ?auto_179237 ?auto_179244 ) ) ( not ( = ?auto_179238 ?auto_179243 ) ) ( not ( = ?auto_179238 ?auto_179244 ) ) ( not ( = ?auto_179239 ?auto_179243 ) ) ( not ( = ?auto_179239 ?auto_179244 ) ) ( not ( = ?auto_179240 ?auto_179243 ) ) ( not ( = ?auto_179240 ?auto_179244 ) ) ( not ( = ?auto_179241 ?auto_179243 ) ) ( not ( = ?auto_179241 ?auto_179244 ) ) ( ON ?auto_179242 ?auto_179241 ) ( CLEAR ?auto_179242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179237 ?auto_179238 ?auto_179239 ?auto_179240 ?auto_179241 )
      ( MAKE-3PILE ?auto_179237 ?auto_179238 ?auto_179239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179245 - BLOCK
      ?auto_179246 - BLOCK
      ?auto_179247 - BLOCK
    )
    :vars
    (
      ?auto_179248 - BLOCK
      ?auto_179249 - BLOCK
      ?auto_179250 - BLOCK
      ?auto_179251 - BLOCK
      ?auto_179252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179248 ?auto_179247 ) ( ON-TABLE ?auto_179245 ) ( ON ?auto_179246 ?auto_179245 ) ( ON ?auto_179247 ?auto_179246 ) ( not ( = ?auto_179245 ?auto_179246 ) ) ( not ( = ?auto_179245 ?auto_179247 ) ) ( not ( = ?auto_179245 ?auto_179248 ) ) ( not ( = ?auto_179246 ?auto_179247 ) ) ( not ( = ?auto_179246 ?auto_179248 ) ) ( not ( = ?auto_179247 ?auto_179248 ) ) ( not ( = ?auto_179245 ?auto_179249 ) ) ( not ( = ?auto_179245 ?auto_179250 ) ) ( not ( = ?auto_179246 ?auto_179249 ) ) ( not ( = ?auto_179246 ?auto_179250 ) ) ( not ( = ?auto_179247 ?auto_179249 ) ) ( not ( = ?auto_179247 ?auto_179250 ) ) ( not ( = ?auto_179248 ?auto_179249 ) ) ( not ( = ?auto_179248 ?auto_179250 ) ) ( not ( = ?auto_179249 ?auto_179250 ) ) ( ON ?auto_179249 ?auto_179248 ) ( ON-TABLE ?auto_179251 ) ( not ( = ?auto_179251 ?auto_179252 ) ) ( not ( = ?auto_179251 ?auto_179250 ) ) ( not ( = ?auto_179252 ?auto_179250 ) ) ( not ( = ?auto_179245 ?auto_179252 ) ) ( not ( = ?auto_179245 ?auto_179251 ) ) ( not ( = ?auto_179246 ?auto_179252 ) ) ( not ( = ?auto_179246 ?auto_179251 ) ) ( not ( = ?auto_179247 ?auto_179252 ) ) ( not ( = ?auto_179247 ?auto_179251 ) ) ( not ( = ?auto_179248 ?auto_179252 ) ) ( not ( = ?auto_179248 ?auto_179251 ) ) ( not ( = ?auto_179249 ?auto_179252 ) ) ( not ( = ?auto_179249 ?auto_179251 ) ) ( ON ?auto_179250 ?auto_179249 ) ( CLEAR ?auto_179250 ) ( HOLDING ?auto_179252 ) ( CLEAR ?auto_179251 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179251 ?auto_179252 )
      ( MAKE-3PILE ?auto_179245 ?auto_179246 ?auto_179247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179253 - BLOCK
      ?auto_179254 - BLOCK
      ?auto_179255 - BLOCK
    )
    :vars
    (
      ?auto_179256 - BLOCK
      ?auto_179257 - BLOCK
      ?auto_179259 - BLOCK
      ?auto_179258 - BLOCK
      ?auto_179260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179256 ?auto_179255 ) ( ON-TABLE ?auto_179253 ) ( ON ?auto_179254 ?auto_179253 ) ( ON ?auto_179255 ?auto_179254 ) ( not ( = ?auto_179253 ?auto_179254 ) ) ( not ( = ?auto_179253 ?auto_179255 ) ) ( not ( = ?auto_179253 ?auto_179256 ) ) ( not ( = ?auto_179254 ?auto_179255 ) ) ( not ( = ?auto_179254 ?auto_179256 ) ) ( not ( = ?auto_179255 ?auto_179256 ) ) ( not ( = ?auto_179253 ?auto_179257 ) ) ( not ( = ?auto_179253 ?auto_179259 ) ) ( not ( = ?auto_179254 ?auto_179257 ) ) ( not ( = ?auto_179254 ?auto_179259 ) ) ( not ( = ?auto_179255 ?auto_179257 ) ) ( not ( = ?auto_179255 ?auto_179259 ) ) ( not ( = ?auto_179256 ?auto_179257 ) ) ( not ( = ?auto_179256 ?auto_179259 ) ) ( not ( = ?auto_179257 ?auto_179259 ) ) ( ON ?auto_179257 ?auto_179256 ) ( ON-TABLE ?auto_179258 ) ( not ( = ?auto_179258 ?auto_179260 ) ) ( not ( = ?auto_179258 ?auto_179259 ) ) ( not ( = ?auto_179260 ?auto_179259 ) ) ( not ( = ?auto_179253 ?auto_179260 ) ) ( not ( = ?auto_179253 ?auto_179258 ) ) ( not ( = ?auto_179254 ?auto_179260 ) ) ( not ( = ?auto_179254 ?auto_179258 ) ) ( not ( = ?auto_179255 ?auto_179260 ) ) ( not ( = ?auto_179255 ?auto_179258 ) ) ( not ( = ?auto_179256 ?auto_179260 ) ) ( not ( = ?auto_179256 ?auto_179258 ) ) ( not ( = ?auto_179257 ?auto_179260 ) ) ( not ( = ?auto_179257 ?auto_179258 ) ) ( ON ?auto_179259 ?auto_179257 ) ( CLEAR ?auto_179258 ) ( ON ?auto_179260 ?auto_179259 ) ( CLEAR ?auto_179260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179253 ?auto_179254 ?auto_179255 ?auto_179256 ?auto_179257 ?auto_179259 )
      ( MAKE-3PILE ?auto_179253 ?auto_179254 ?auto_179255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179261 - BLOCK
      ?auto_179262 - BLOCK
      ?auto_179263 - BLOCK
    )
    :vars
    (
      ?auto_179266 - BLOCK
      ?auto_179265 - BLOCK
      ?auto_179268 - BLOCK
      ?auto_179267 - BLOCK
      ?auto_179264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179266 ?auto_179263 ) ( ON-TABLE ?auto_179261 ) ( ON ?auto_179262 ?auto_179261 ) ( ON ?auto_179263 ?auto_179262 ) ( not ( = ?auto_179261 ?auto_179262 ) ) ( not ( = ?auto_179261 ?auto_179263 ) ) ( not ( = ?auto_179261 ?auto_179266 ) ) ( not ( = ?auto_179262 ?auto_179263 ) ) ( not ( = ?auto_179262 ?auto_179266 ) ) ( not ( = ?auto_179263 ?auto_179266 ) ) ( not ( = ?auto_179261 ?auto_179265 ) ) ( not ( = ?auto_179261 ?auto_179268 ) ) ( not ( = ?auto_179262 ?auto_179265 ) ) ( not ( = ?auto_179262 ?auto_179268 ) ) ( not ( = ?auto_179263 ?auto_179265 ) ) ( not ( = ?auto_179263 ?auto_179268 ) ) ( not ( = ?auto_179266 ?auto_179265 ) ) ( not ( = ?auto_179266 ?auto_179268 ) ) ( not ( = ?auto_179265 ?auto_179268 ) ) ( ON ?auto_179265 ?auto_179266 ) ( not ( = ?auto_179267 ?auto_179264 ) ) ( not ( = ?auto_179267 ?auto_179268 ) ) ( not ( = ?auto_179264 ?auto_179268 ) ) ( not ( = ?auto_179261 ?auto_179264 ) ) ( not ( = ?auto_179261 ?auto_179267 ) ) ( not ( = ?auto_179262 ?auto_179264 ) ) ( not ( = ?auto_179262 ?auto_179267 ) ) ( not ( = ?auto_179263 ?auto_179264 ) ) ( not ( = ?auto_179263 ?auto_179267 ) ) ( not ( = ?auto_179266 ?auto_179264 ) ) ( not ( = ?auto_179266 ?auto_179267 ) ) ( not ( = ?auto_179265 ?auto_179264 ) ) ( not ( = ?auto_179265 ?auto_179267 ) ) ( ON ?auto_179268 ?auto_179265 ) ( ON ?auto_179264 ?auto_179268 ) ( CLEAR ?auto_179264 ) ( HOLDING ?auto_179267 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179267 )
      ( MAKE-3PILE ?auto_179261 ?auto_179262 ?auto_179263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179280 - BLOCK
      ?auto_179281 - BLOCK
      ?auto_179282 - BLOCK
    )
    :vars
    (
      ?auto_179286 - BLOCK
      ?auto_179285 - BLOCK
      ?auto_179283 - BLOCK
      ?auto_179284 - BLOCK
      ?auto_179287 - BLOCK
      ?auto_179288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179286 ?auto_179282 ) ( ON-TABLE ?auto_179280 ) ( ON ?auto_179281 ?auto_179280 ) ( ON ?auto_179282 ?auto_179281 ) ( not ( = ?auto_179280 ?auto_179281 ) ) ( not ( = ?auto_179280 ?auto_179282 ) ) ( not ( = ?auto_179280 ?auto_179286 ) ) ( not ( = ?auto_179281 ?auto_179282 ) ) ( not ( = ?auto_179281 ?auto_179286 ) ) ( not ( = ?auto_179282 ?auto_179286 ) ) ( not ( = ?auto_179280 ?auto_179285 ) ) ( not ( = ?auto_179280 ?auto_179283 ) ) ( not ( = ?auto_179281 ?auto_179285 ) ) ( not ( = ?auto_179281 ?auto_179283 ) ) ( not ( = ?auto_179282 ?auto_179285 ) ) ( not ( = ?auto_179282 ?auto_179283 ) ) ( not ( = ?auto_179286 ?auto_179285 ) ) ( not ( = ?auto_179286 ?auto_179283 ) ) ( not ( = ?auto_179285 ?auto_179283 ) ) ( ON ?auto_179285 ?auto_179286 ) ( not ( = ?auto_179284 ?auto_179287 ) ) ( not ( = ?auto_179284 ?auto_179283 ) ) ( not ( = ?auto_179287 ?auto_179283 ) ) ( not ( = ?auto_179280 ?auto_179287 ) ) ( not ( = ?auto_179280 ?auto_179284 ) ) ( not ( = ?auto_179281 ?auto_179287 ) ) ( not ( = ?auto_179281 ?auto_179284 ) ) ( not ( = ?auto_179282 ?auto_179287 ) ) ( not ( = ?auto_179282 ?auto_179284 ) ) ( not ( = ?auto_179286 ?auto_179287 ) ) ( not ( = ?auto_179286 ?auto_179284 ) ) ( not ( = ?auto_179285 ?auto_179287 ) ) ( not ( = ?auto_179285 ?auto_179284 ) ) ( ON ?auto_179283 ?auto_179285 ) ( ON ?auto_179287 ?auto_179283 ) ( CLEAR ?auto_179287 ) ( ON ?auto_179284 ?auto_179288 ) ( CLEAR ?auto_179284 ) ( HAND-EMPTY ) ( not ( = ?auto_179280 ?auto_179288 ) ) ( not ( = ?auto_179281 ?auto_179288 ) ) ( not ( = ?auto_179282 ?auto_179288 ) ) ( not ( = ?auto_179286 ?auto_179288 ) ) ( not ( = ?auto_179285 ?auto_179288 ) ) ( not ( = ?auto_179283 ?auto_179288 ) ) ( not ( = ?auto_179284 ?auto_179288 ) ) ( not ( = ?auto_179287 ?auto_179288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179284 ?auto_179288 )
      ( MAKE-3PILE ?auto_179280 ?auto_179281 ?auto_179282 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179289 - BLOCK
      ?auto_179290 - BLOCK
      ?auto_179291 - BLOCK
    )
    :vars
    (
      ?auto_179295 - BLOCK
      ?auto_179293 - BLOCK
      ?auto_179294 - BLOCK
      ?auto_179297 - BLOCK
      ?auto_179292 - BLOCK
      ?auto_179296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179295 ?auto_179291 ) ( ON-TABLE ?auto_179289 ) ( ON ?auto_179290 ?auto_179289 ) ( ON ?auto_179291 ?auto_179290 ) ( not ( = ?auto_179289 ?auto_179290 ) ) ( not ( = ?auto_179289 ?auto_179291 ) ) ( not ( = ?auto_179289 ?auto_179295 ) ) ( not ( = ?auto_179290 ?auto_179291 ) ) ( not ( = ?auto_179290 ?auto_179295 ) ) ( not ( = ?auto_179291 ?auto_179295 ) ) ( not ( = ?auto_179289 ?auto_179293 ) ) ( not ( = ?auto_179289 ?auto_179294 ) ) ( not ( = ?auto_179290 ?auto_179293 ) ) ( not ( = ?auto_179290 ?auto_179294 ) ) ( not ( = ?auto_179291 ?auto_179293 ) ) ( not ( = ?auto_179291 ?auto_179294 ) ) ( not ( = ?auto_179295 ?auto_179293 ) ) ( not ( = ?auto_179295 ?auto_179294 ) ) ( not ( = ?auto_179293 ?auto_179294 ) ) ( ON ?auto_179293 ?auto_179295 ) ( not ( = ?auto_179297 ?auto_179292 ) ) ( not ( = ?auto_179297 ?auto_179294 ) ) ( not ( = ?auto_179292 ?auto_179294 ) ) ( not ( = ?auto_179289 ?auto_179292 ) ) ( not ( = ?auto_179289 ?auto_179297 ) ) ( not ( = ?auto_179290 ?auto_179292 ) ) ( not ( = ?auto_179290 ?auto_179297 ) ) ( not ( = ?auto_179291 ?auto_179292 ) ) ( not ( = ?auto_179291 ?auto_179297 ) ) ( not ( = ?auto_179295 ?auto_179292 ) ) ( not ( = ?auto_179295 ?auto_179297 ) ) ( not ( = ?auto_179293 ?auto_179292 ) ) ( not ( = ?auto_179293 ?auto_179297 ) ) ( ON ?auto_179294 ?auto_179293 ) ( ON ?auto_179297 ?auto_179296 ) ( CLEAR ?auto_179297 ) ( not ( = ?auto_179289 ?auto_179296 ) ) ( not ( = ?auto_179290 ?auto_179296 ) ) ( not ( = ?auto_179291 ?auto_179296 ) ) ( not ( = ?auto_179295 ?auto_179296 ) ) ( not ( = ?auto_179293 ?auto_179296 ) ) ( not ( = ?auto_179294 ?auto_179296 ) ) ( not ( = ?auto_179297 ?auto_179296 ) ) ( not ( = ?auto_179292 ?auto_179296 ) ) ( HOLDING ?auto_179292 ) ( CLEAR ?auto_179294 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179289 ?auto_179290 ?auto_179291 ?auto_179295 ?auto_179293 ?auto_179294 ?auto_179292 )
      ( MAKE-3PILE ?auto_179289 ?auto_179290 ?auto_179291 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179298 - BLOCK
      ?auto_179299 - BLOCK
      ?auto_179300 - BLOCK
    )
    :vars
    (
      ?auto_179305 - BLOCK
      ?auto_179304 - BLOCK
      ?auto_179303 - BLOCK
      ?auto_179306 - BLOCK
      ?auto_179301 - BLOCK
      ?auto_179302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179305 ?auto_179300 ) ( ON-TABLE ?auto_179298 ) ( ON ?auto_179299 ?auto_179298 ) ( ON ?auto_179300 ?auto_179299 ) ( not ( = ?auto_179298 ?auto_179299 ) ) ( not ( = ?auto_179298 ?auto_179300 ) ) ( not ( = ?auto_179298 ?auto_179305 ) ) ( not ( = ?auto_179299 ?auto_179300 ) ) ( not ( = ?auto_179299 ?auto_179305 ) ) ( not ( = ?auto_179300 ?auto_179305 ) ) ( not ( = ?auto_179298 ?auto_179304 ) ) ( not ( = ?auto_179298 ?auto_179303 ) ) ( not ( = ?auto_179299 ?auto_179304 ) ) ( not ( = ?auto_179299 ?auto_179303 ) ) ( not ( = ?auto_179300 ?auto_179304 ) ) ( not ( = ?auto_179300 ?auto_179303 ) ) ( not ( = ?auto_179305 ?auto_179304 ) ) ( not ( = ?auto_179305 ?auto_179303 ) ) ( not ( = ?auto_179304 ?auto_179303 ) ) ( ON ?auto_179304 ?auto_179305 ) ( not ( = ?auto_179306 ?auto_179301 ) ) ( not ( = ?auto_179306 ?auto_179303 ) ) ( not ( = ?auto_179301 ?auto_179303 ) ) ( not ( = ?auto_179298 ?auto_179301 ) ) ( not ( = ?auto_179298 ?auto_179306 ) ) ( not ( = ?auto_179299 ?auto_179301 ) ) ( not ( = ?auto_179299 ?auto_179306 ) ) ( not ( = ?auto_179300 ?auto_179301 ) ) ( not ( = ?auto_179300 ?auto_179306 ) ) ( not ( = ?auto_179305 ?auto_179301 ) ) ( not ( = ?auto_179305 ?auto_179306 ) ) ( not ( = ?auto_179304 ?auto_179301 ) ) ( not ( = ?auto_179304 ?auto_179306 ) ) ( ON ?auto_179303 ?auto_179304 ) ( ON ?auto_179306 ?auto_179302 ) ( not ( = ?auto_179298 ?auto_179302 ) ) ( not ( = ?auto_179299 ?auto_179302 ) ) ( not ( = ?auto_179300 ?auto_179302 ) ) ( not ( = ?auto_179305 ?auto_179302 ) ) ( not ( = ?auto_179304 ?auto_179302 ) ) ( not ( = ?auto_179303 ?auto_179302 ) ) ( not ( = ?auto_179306 ?auto_179302 ) ) ( not ( = ?auto_179301 ?auto_179302 ) ) ( CLEAR ?auto_179303 ) ( ON ?auto_179301 ?auto_179306 ) ( CLEAR ?auto_179301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179302 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179302 ?auto_179306 )
      ( MAKE-3PILE ?auto_179298 ?auto_179299 ?auto_179300 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_179307 - BLOCK
      ?auto_179308 - BLOCK
      ?auto_179309 - BLOCK
    )
    :vars
    (
      ?auto_179313 - BLOCK
      ?auto_179312 - BLOCK
      ?auto_179314 - BLOCK
      ?auto_179310 - BLOCK
      ?auto_179315 - BLOCK
      ?auto_179311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179313 ?auto_179309 ) ( ON-TABLE ?auto_179307 ) ( ON ?auto_179308 ?auto_179307 ) ( ON ?auto_179309 ?auto_179308 ) ( not ( = ?auto_179307 ?auto_179308 ) ) ( not ( = ?auto_179307 ?auto_179309 ) ) ( not ( = ?auto_179307 ?auto_179313 ) ) ( not ( = ?auto_179308 ?auto_179309 ) ) ( not ( = ?auto_179308 ?auto_179313 ) ) ( not ( = ?auto_179309 ?auto_179313 ) ) ( not ( = ?auto_179307 ?auto_179312 ) ) ( not ( = ?auto_179307 ?auto_179314 ) ) ( not ( = ?auto_179308 ?auto_179312 ) ) ( not ( = ?auto_179308 ?auto_179314 ) ) ( not ( = ?auto_179309 ?auto_179312 ) ) ( not ( = ?auto_179309 ?auto_179314 ) ) ( not ( = ?auto_179313 ?auto_179312 ) ) ( not ( = ?auto_179313 ?auto_179314 ) ) ( not ( = ?auto_179312 ?auto_179314 ) ) ( ON ?auto_179312 ?auto_179313 ) ( not ( = ?auto_179310 ?auto_179315 ) ) ( not ( = ?auto_179310 ?auto_179314 ) ) ( not ( = ?auto_179315 ?auto_179314 ) ) ( not ( = ?auto_179307 ?auto_179315 ) ) ( not ( = ?auto_179307 ?auto_179310 ) ) ( not ( = ?auto_179308 ?auto_179315 ) ) ( not ( = ?auto_179308 ?auto_179310 ) ) ( not ( = ?auto_179309 ?auto_179315 ) ) ( not ( = ?auto_179309 ?auto_179310 ) ) ( not ( = ?auto_179313 ?auto_179315 ) ) ( not ( = ?auto_179313 ?auto_179310 ) ) ( not ( = ?auto_179312 ?auto_179315 ) ) ( not ( = ?auto_179312 ?auto_179310 ) ) ( ON ?auto_179310 ?auto_179311 ) ( not ( = ?auto_179307 ?auto_179311 ) ) ( not ( = ?auto_179308 ?auto_179311 ) ) ( not ( = ?auto_179309 ?auto_179311 ) ) ( not ( = ?auto_179313 ?auto_179311 ) ) ( not ( = ?auto_179312 ?auto_179311 ) ) ( not ( = ?auto_179314 ?auto_179311 ) ) ( not ( = ?auto_179310 ?auto_179311 ) ) ( not ( = ?auto_179315 ?auto_179311 ) ) ( ON ?auto_179315 ?auto_179310 ) ( CLEAR ?auto_179315 ) ( ON-TABLE ?auto_179311 ) ( HOLDING ?auto_179314 ) ( CLEAR ?auto_179312 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179307 ?auto_179308 ?auto_179309 ?auto_179313 ?auto_179312 ?auto_179314 )
      ( MAKE-3PILE ?auto_179307 ?auto_179308 ?auto_179309 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179374 - BLOCK
      ?auto_179375 - BLOCK
      ?auto_179376 - BLOCK
      ?auto_179377 - BLOCK
      ?auto_179378 - BLOCK
    )
    :vars
    (
      ?auto_179379 - BLOCK
      ?auto_179381 - BLOCK
      ?auto_179380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179374 ) ( ON ?auto_179375 ?auto_179374 ) ( ON ?auto_179376 ?auto_179375 ) ( not ( = ?auto_179374 ?auto_179375 ) ) ( not ( = ?auto_179374 ?auto_179376 ) ) ( not ( = ?auto_179374 ?auto_179377 ) ) ( not ( = ?auto_179374 ?auto_179378 ) ) ( not ( = ?auto_179375 ?auto_179376 ) ) ( not ( = ?auto_179375 ?auto_179377 ) ) ( not ( = ?auto_179375 ?auto_179378 ) ) ( not ( = ?auto_179376 ?auto_179377 ) ) ( not ( = ?auto_179376 ?auto_179378 ) ) ( not ( = ?auto_179377 ?auto_179378 ) ) ( ON ?auto_179378 ?auto_179379 ) ( not ( = ?auto_179374 ?auto_179379 ) ) ( not ( = ?auto_179375 ?auto_179379 ) ) ( not ( = ?auto_179376 ?auto_179379 ) ) ( not ( = ?auto_179377 ?auto_179379 ) ) ( not ( = ?auto_179378 ?auto_179379 ) ) ( CLEAR ?auto_179376 ) ( ON ?auto_179377 ?auto_179378 ) ( CLEAR ?auto_179377 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179381 ) ( ON ?auto_179380 ?auto_179381 ) ( ON ?auto_179379 ?auto_179380 ) ( not ( = ?auto_179381 ?auto_179380 ) ) ( not ( = ?auto_179381 ?auto_179379 ) ) ( not ( = ?auto_179381 ?auto_179378 ) ) ( not ( = ?auto_179381 ?auto_179377 ) ) ( not ( = ?auto_179380 ?auto_179379 ) ) ( not ( = ?auto_179380 ?auto_179378 ) ) ( not ( = ?auto_179380 ?auto_179377 ) ) ( not ( = ?auto_179374 ?auto_179381 ) ) ( not ( = ?auto_179374 ?auto_179380 ) ) ( not ( = ?auto_179375 ?auto_179381 ) ) ( not ( = ?auto_179375 ?auto_179380 ) ) ( not ( = ?auto_179376 ?auto_179381 ) ) ( not ( = ?auto_179376 ?auto_179380 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179381 ?auto_179380 ?auto_179379 ?auto_179378 )
      ( MAKE-5PILE ?auto_179374 ?auto_179375 ?auto_179376 ?auto_179377 ?auto_179378 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179382 - BLOCK
      ?auto_179383 - BLOCK
      ?auto_179384 - BLOCK
      ?auto_179385 - BLOCK
      ?auto_179386 - BLOCK
    )
    :vars
    (
      ?auto_179387 - BLOCK
      ?auto_179388 - BLOCK
      ?auto_179389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179382 ) ( ON ?auto_179383 ?auto_179382 ) ( not ( = ?auto_179382 ?auto_179383 ) ) ( not ( = ?auto_179382 ?auto_179384 ) ) ( not ( = ?auto_179382 ?auto_179385 ) ) ( not ( = ?auto_179382 ?auto_179386 ) ) ( not ( = ?auto_179383 ?auto_179384 ) ) ( not ( = ?auto_179383 ?auto_179385 ) ) ( not ( = ?auto_179383 ?auto_179386 ) ) ( not ( = ?auto_179384 ?auto_179385 ) ) ( not ( = ?auto_179384 ?auto_179386 ) ) ( not ( = ?auto_179385 ?auto_179386 ) ) ( ON ?auto_179386 ?auto_179387 ) ( not ( = ?auto_179382 ?auto_179387 ) ) ( not ( = ?auto_179383 ?auto_179387 ) ) ( not ( = ?auto_179384 ?auto_179387 ) ) ( not ( = ?auto_179385 ?auto_179387 ) ) ( not ( = ?auto_179386 ?auto_179387 ) ) ( ON ?auto_179385 ?auto_179386 ) ( CLEAR ?auto_179385 ) ( ON-TABLE ?auto_179388 ) ( ON ?auto_179389 ?auto_179388 ) ( ON ?auto_179387 ?auto_179389 ) ( not ( = ?auto_179388 ?auto_179389 ) ) ( not ( = ?auto_179388 ?auto_179387 ) ) ( not ( = ?auto_179388 ?auto_179386 ) ) ( not ( = ?auto_179388 ?auto_179385 ) ) ( not ( = ?auto_179389 ?auto_179387 ) ) ( not ( = ?auto_179389 ?auto_179386 ) ) ( not ( = ?auto_179389 ?auto_179385 ) ) ( not ( = ?auto_179382 ?auto_179388 ) ) ( not ( = ?auto_179382 ?auto_179389 ) ) ( not ( = ?auto_179383 ?auto_179388 ) ) ( not ( = ?auto_179383 ?auto_179389 ) ) ( not ( = ?auto_179384 ?auto_179388 ) ) ( not ( = ?auto_179384 ?auto_179389 ) ) ( HOLDING ?auto_179384 ) ( CLEAR ?auto_179383 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179382 ?auto_179383 ?auto_179384 )
      ( MAKE-5PILE ?auto_179382 ?auto_179383 ?auto_179384 ?auto_179385 ?auto_179386 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179390 - BLOCK
      ?auto_179391 - BLOCK
      ?auto_179392 - BLOCK
      ?auto_179393 - BLOCK
      ?auto_179394 - BLOCK
    )
    :vars
    (
      ?auto_179396 - BLOCK
      ?auto_179395 - BLOCK
      ?auto_179397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179390 ) ( ON ?auto_179391 ?auto_179390 ) ( not ( = ?auto_179390 ?auto_179391 ) ) ( not ( = ?auto_179390 ?auto_179392 ) ) ( not ( = ?auto_179390 ?auto_179393 ) ) ( not ( = ?auto_179390 ?auto_179394 ) ) ( not ( = ?auto_179391 ?auto_179392 ) ) ( not ( = ?auto_179391 ?auto_179393 ) ) ( not ( = ?auto_179391 ?auto_179394 ) ) ( not ( = ?auto_179392 ?auto_179393 ) ) ( not ( = ?auto_179392 ?auto_179394 ) ) ( not ( = ?auto_179393 ?auto_179394 ) ) ( ON ?auto_179394 ?auto_179396 ) ( not ( = ?auto_179390 ?auto_179396 ) ) ( not ( = ?auto_179391 ?auto_179396 ) ) ( not ( = ?auto_179392 ?auto_179396 ) ) ( not ( = ?auto_179393 ?auto_179396 ) ) ( not ( = ?auto_179394 ?auto_179396 ) ) ( ON ?auto_179393 ?auto_179394 ) ( ON-TABLE ?auto_179395 ) ( ON ?auto_179397 ?auto_179395 ) ( ON ?auto_179396 ?auto_179397 ) ( not ( = ?auto_179395 ?auto_179397 ) ) ( not ( = ?auto_179395 ?auto_179396 ) ) ( not ( = ?auto_179395 ?auto_179394 ) ) ( not ( = ?auto_179395 ?auto_179393 ) ) ( not ( = ?auto_179397 ?auto_179396 ) ) ( not ( = ?auto_179397 ?auto_179394 ) ) ( not ( = ?auto_179397 ?auto_179393 ) ) ( not ( = ?auto_179390 ?auto_179395 ) ) ( not ( = ?auto_179390 ?auto_179397 ) ) ( not ( = ?auto_179391 ?auto_179395 ) ) ( not ( = ?auto_179391 ?auto_179397 ) ) ( not ( = ?auto_179392 ?auto_179395 ) ) ( not ( = ?auto_179392 ?auto_179397 ) ) ( CLEAR ?auto_179391 ) ( ON ?auto_179392 ?auto_179393 ) ( CLEAR ?auto_179392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179395 ?auto_179397 ?auto_179396 ?auto_179394 ?auto_179393 )
      ( MAKE-5PILE ?auto_179390 ?auto_179391 ?auto_179392 ?auto_179393 ?auto_179394 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179398 - BLOCK
      ?auto_179399 - BLOCK
      ?auto_179400 - BLOCK
      ?auto_179401 - BLOCK
      ?auto_179402 - BLOCK
    )
    :vars
    (
      ?auto_179403 - BLOCK
      ?auto_179404 - BLOCK
      ?auto_179405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179398 ) ( not ( = ?auto_179398 ?auto_179399 ) ) ( not ( = ?auto_179398 ?auto_179400 ) ) ( not ( = ?auto_179398 ?auto_179401 ) ) ( not ( = ?auto_179398 ?auto_179402 ) ) ( not ( = ?auto_179399 ?auto_179400 ) ) ( not ( = ?auto_179399 ?auto_179401 ) ) ( not ( = ?auto_179399 ?auto_179402 ) ) ( not ( = ?auto_179400 ?auto_179401 ) ) ( not ( = ?auto_179400 ?auto_179402 ) ) ( not ( = ?auto_179401 ?auto_179402 ) ) ( ON ?auto_179402 ?auto_179403 ) ( not ( = ?auto_179398 ?auto_179403 ) ) ( not ( = ?auto_179399 ?auto_179403 ) ) ( not ( = ?auto_179400 ?auto_179403 ) ) ( not ( = ?auto_179401 ?auto_179403 ) ) ( not ( = ?auto_179402 ?auto_179403 ) ) ( ON ?auto_179401 ?auto_179402 ) ( ON-TABLE ?auto_179404 ) ( ON ?auto_179405 ?auto_179404 ) ( ON ?auto_179403 ?auto_179405 ) ( not ( = ?auto_179404 ?auto_179405 ) ) ( not ( = ?auto_179404 ?auto_179403 ) ) ( not ( = ?auto_179404 ?auto_179402 ) ) ( not ( = ?auto_179404 ?auto_179401 ) ) ( not ( = ?auto_179405 ?auto_179403 ) ) ( not ( = ?auto_179405 ?auto_179402 ) ) ( not ( = ?auto_179405 ?auto_179401 ) ) ( not ( = ?auto_179398 ?auto_179404 ) ) ( not ( = ?auto_179398 ?auto_179405 ) ) ( not ( = ?auto_179399 ?auto_179404 ) ) ( not ( = ?auto_179399 ?auto_179405 ) ) ( not ( = ?auto_179400 ?auto_179404 ) ) ( not ( = ?auto_179400 ?auto_179405 ) ) ( ON ?auto_179400 ?auto_179401 ) ( CLEAR ?auto_179400 ) ( HOLDING ?auto_179399 ) ( CLEAR ?auto_179398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179398 ?auto_179399 )
      ( MAKE-5PILE ?auto_179398 ?auto_179399 ?auto_179400 ?auto_179401 ?auto_179402 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179406 - BLOCK
      ?auto_179407 - BLOCK
      ?auto_179408 - BLOCK
      ?auto_179409 - BLOCK
      ?auto_179410 - BLOCK
    )
    :vars
    (
      ?auto_179413 - BLOCK
      ?auto_179412 - BLOCK
      ?auto_179411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179406 ) ( not ( = ?auto_179406 ?auto_179407 ) ) ( not ( = ?auto_179406 ?auto_179408 ) ) ( not ( = ?auto_179406 ?auto_179409 ) ) ( not ( = ?auto_179406 ?auto_179410 ) ) ( not ( = ?auto_179407 ?auto_179408 ) ) ( not ( = ?auto_179407 ?auto_179409 ) ) ( not ( = ?auto_179407 ?auto_179410 ) ) ( not ( = ?auto_179408 ?auto_179409 ) ) ( not ( = ?auto_179408 ?auto_179410 ) ) ( not ( = ?auto_179409 ?auto_179410 ) ) ( ON ?auto_179410 ?auto_179413 ) ( not ( = ?auto_179406 ?auto_179413 ) ) ( not ( = ?auto_179407 ?auto_179413 ) ) ( not ( = ?auto_179408 ?auto_179413 ) ) ( not ( = ?auto_179409 ?auto_179413 ) ) ( not ( = ?auto_179410 ?auto_179413 ) ) ( ON ?auto_179409 ?auto_179410 ) ( ON-TABLE ?auto_179412 ) ( ON ?auto_179411 ?auto_179412 ) ( ON ?auto_179413 ?auto_179411 ) ( not ( = ?auto_179412 ?auto_179411 ) ) ( not ( = ?auto_179412 ?auto_179413 ) ) ( not ( = ?auto_179412 ?auto_179410 ) ) ( not ( = ?auto_179412 ?auto_179409 ) ) ( not ( = ?auto_179411 ?auto_179413 ) ) ( not ( = ?auto_179411 ?auto_179410 ) ) ( not ( = ?auto_179411 ?auto_179409 ) ) ( not ( = ?auto_179406 ?auto_179412 ) ) ( not ( = ?auto_179406 ?auto_179411 ) ) ( not ( = ?auto_179407 ?auto_179412 ) ) ( not ( = ?auto_179407 ?auto_179411 ) ) ( not ( = ?auto_179408 ?auto_179412 ) ) ( not ( = ?auto_179408 ?auto_179411 ) ) ( ON ?auto_179408 ?auto_179409 ) ( CLEAR ?auto_179406 ) ( ON ?auto_179407 ?auto_179408 ) ( CLEAR ?auto_179407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179412 ?auto_179411 ?auto_179413 ?auto_179410 ?auto_179409 ?auto_179408 )
      ( MAKE-5PILE ?auto_179406 ?auto_179407 ?auto_179408 ?auto_179409 ?auto_179410 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179414 - BLOCK
      ?auto_179415 - BLOCK
      ?auto_179416 - BLOCK
      ?auto_179417 - BLOCK
      ?auto_179418 - BLOCK
    )
    :vars
    (
      ?auto_179419 - BLOCK
      ?auto_179420 - BLOCK
      ?auto_179421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179414 ?auto_179415 ) ) ( not ( = ?auto_179414 ?auto_179416 ) ) ( not ( = ?auto_179414 ?auto_179417 ) ) ( not ( = ?auto_179414 ?auto_179418 ) ) ( not ( = ?auto_179415 ?auto_179416 ) ) ( not ( = ?auto_179415 ?auto_179417 ) ) ( not ( = ?auto_179415 ?auto_179418 ) ) ( not ( = ?auto_179416 ?auto_179417 ) ) ( not ( = ?auto_179416 ?auto_179418 ) ) ( not ( = ?auto_179417 ?auto_179418 ) ) ( ON ?auto_179418 ?auto_179419 ) ( not ( = ?auto_179414 ?auto_179419 ) ) ( not ( = ?auto_179415 ?auto_179419 ) ) ( not ( = ?auto_179416 ?auto_179419 ) ) ( not ( = ?auto_179417 ?auto_179419 ) ) ( not ( = ?auto_179418 ?auto_179419 ) ) ( ON ?auto_179417 ?auto_179418 ) ( ON-TABLE ?auto_179420 ) ( ON ?auto_179421 ?auto_179420 ) ( ON ?auto_179419 ?auto_179421 ) ( not ( = ?auto_179420 ?auto_179421 ) ) ( not ( = ?auto_179420 ?auto_179419 ) ) ( not ( = ?auto_179420 ?auto_179418 ) ) ( not ( = ?auto_179420 ?auto_179417 ) ) ( not ( = ?auto_179421 ?auto_179419 ) ) ( not ( = ?auto_179421 ?auto_179418 ) ) ( not ( = ?auto_179421 ?auto_179417 ) ) ( not ( = ?auto_179414 ?auto_179420 ) ) ( not ( = ?auto_179414 ?auto_179421 ) ) ( not ( = ?auto_179415 ?auto_179420 ) ) ( not ( = ?auto_179415 ?auto_179421 ) ) ( not ( = ?auto_179416 ?auto_179420 ) ) ( not ( = ?auto_179416 ?auto_179421 ) ) ( ON ?auto_179416 ?auto_179417 ) ( ON ?auto_179415 ?auto_179416 ) ( CLEAR ?auto_179415 ) ( HOLDING ?auto_179414 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179414 )
      ( MAKE-5PILE ?auto_179414 ?auto_179415 ?auto_179416 ?auto_179417 ?auto_179418 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179422 - BLOCK
      ?auto_179423 - BLOCK
      ?auto_179424 - BLOCK
      ?auto_179425 - BLOCK
      ?auto_179426 - BLOCK
    )
    :vars
    (
      ?auto_179428 - BLOCK
      ?auto_179429 - BLOCK
      ?auto_179427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179422 ?auto_179423 ) ) ( not ( = ?auto_179422 ?auto_179424 ) ) ( not ( = ?auto_179422 ?auto_179425 ) ) ( not ( = ?auto_179422 ?auto_179426 ) ) ( not ( = ?auto_179423 ?auto_179424 ) ) ( not ( = ?auto_179423 ?auto_179425 ) ) ( not ( = ?auto_179423 ?auto_179426 ) ) ( not ( = ?auto_179424 ?auto_179425 ) ) ( not ( = ?auto_179424 ?auto_179426 ) ) ( not ( = ?auto_179425 ?auto_179426 ) ) ( ON ?auto_179426 ?auto_179428 ) ( not ( = ?auto_179422 ?auto_179428 ) ) ( not ( = ?auto_179423 ?auto_179428 ) ) ( not ( = ?auto_179424 ?auto_179428 ) ) ( not ( = ?auto_179425 ?auto_179428 ) ) ( not ( = ?auto_179426 ?auto_179428 ) ) ( ON ?auto_179425 ?auto_179426 ) ( ON-TABLE ?auto_179429 ) ( ON ?auto_179427 ?auto_179429 ) ( ON ?auto_179428 ?auto_179427 ) ( not ( = ?auto_179429 ?auto_179427 ) ) ( not ( = ?auto_179429 ?auto_179428 ) ) ( not ( = ?auto_179429 ?auto_179426 ) ) ( not ( = ?auto_179429 ?auto_179425 ) ) ( not ( = ?auto_179427 ?auto_179428 ) ) ( not ( = ?auto_179427 ?auto_179426 ) ) ( not ( = ?auto_179427 ?auto_179425 ) ) ( not ( = ?auto_179422 ?auto_179429 ) ) ( not ( = ?auto_179422 ?auto_179427 ) ) ( not ( = ?auto_179423 ?auto_179429 ) ) ( not ( = ?auto_179423 ?auto_179427 ) ) ( not ( = ?auto_179424 ?auto_179429 ) ) ( not ( = ?auto_179424 ?auto_179427 ) ) ( ON ?auto_179424 ?auto_179425 ) ( ON ?auto_179423 ?auto_179424 ) ( ON ?auto_179422 ?auto_179423 ) ( CLEAR ?auto_179422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179429 ?auto_179427 ?auto_179428 ?auto_179426 ?auto_179425 ?auto_179424 ?auto_179423 )
      ( MAKE-5PILE ?auto_179422 ?auto_179423 ?auto_179424 ?auto_179425 ?auto_179426 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179435 - BLOCK
      ?auto_179436 - BLOCK
      ?auto_179437 - BLOCK
      ?auto_179438 - BLOCK
      ?auto_179439 - BLOCK
    )
    :vars
    (
      ?auto_179442 - BLOCK
      ?auto_179441 - BLOCK
      ?auto_179440 - BLOCK
      ?auto_179443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179435 ?auto_179436 ) ) ( not ( = ?auto_179435 ?auto_179437 ) ) ( not ( = ?auto_179435 ?auto_179438 ) ) ( not ( = ?auto_179435 ?auto_179439 ) ) ( not ( = ?auto_179436 ?auto_179437 ) ) ( not ( = ?auto_179436 ?auto_179438 ) ) ( not ( = ?auto_179436 ?auto_179439 ) ) ( not ( = ?auto_179437 ?auto_179438 ) ) ( not ( = ?auto_179437 ?auto_179439 ) ) ( not ( = ?auto_179438 ?auto_179439 ) ) ( ON ?auto_179439 ?auto_179442 ) ( not ( = ?auto_179435 ?auto_179442 ) ) ( not ( = ?auto_179436 ?auto_179442 ) ) ( not ( = ?auto_179437 ?auto_179442 ) ) ( not ( = ?auto_179438 ?auto_179442 ) ) ( not ( = ?auto_179439 ?auto_179442 ) ) ( ON ?auto_179438 ?auto_179439 ) ( ON-TABLE ?auto_179441 ) ( ON ?auto_179440 ?auto_179441 ) ( ON ?auto_179442 ?auto_179440 ) ( not ( = ?auto_179441 ?auto_179440 ) ) ( not ( = ?auto_179441 ?auto_179442 ) ) ( not ( = ?auto_179441 ?auto_179439 ) ) ( not ( = ?auto_179441 ?auto_179438 ) ) ( not ( = ?auto_179440 ?auto_179442 ) ) ( not ( = ?auto_179440 ?auto_179439 ) ) ( not ( = ?auto_179440 ?auto_179438 ) ) ( not ( = ?auto_179435 ?auto_179441 ) ) ( not ( = ?auto_179435 ?auto_179440 ) ) ( not ( = ?auto_179436 ?auto_179441 ) ) ( not ( = ?auto_179436 ?auto_179440 ) ) ( not ( = ?auto_179437 ?auto_179441 ) ) ( not ( = ?auto_179437 ?auto_179440 ) ) ( ON ?auto_179437 ?auto_179438 ) ( ON ?auto_179436 ?auto_179437 ) ( CLEAR ?auto_179436 ) ( ON ?auto_179435 ?auto_179443 ) ( CLEAR ?auto_179435 ) ( HAND-EMPTY ) ( not ( = ?auto_179435 ?auto_179443 ) ) ( not ( = ?auto_179436 ?auto_179443 ) ) ( not ( = ?auto_179437 ?auto_179443 ) ) ( not ( = ?auto_179438 ?auto_179443 ) ) ( not ( = ?auto_179439 ?auto_179443 ) ) ( not ( = ?auto_179442 ?auto_179443 ) ) ( not ( = ?auto_179441 ?auto_179443 ) ) ( not ( = ?auto_179440 ?auto_179443 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179435 ?auto_179443 )
      ( MAKE-5PILE ?auto_179435 ?auto_179436 ?auto_179437 ?auto_179438 ?auto_179439 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179444 - BLOCK
      ?auto_179445 - BLOCK
      ?auto_179446 - BLOCK
      ?auto_179447 - BLOCK
      ?auto_179448 - BLOCK
    )
    :vars
    (
      ?auto_179450 - BLOCK
      ?auto_179449 - BLOCK
      ?auto_179451 - BLOCK
      ?auto_179452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179444 ?auto_179445 ) ) ( not ( = ?auto_179444 ?auto_179446 ) ) ( not ( = ?auto_179444 ?auto_179447 ) ) ( not ( = ?auto_179444 ?auto_179448 ) ) ( not ( = ?auto_179445 ?auto_179446 ) ) ( not ( = ?auto_179445 ?auto_179447 ) ) ( not ( = ?auto_179445 ?auto_179448 ) ) ( not ( = ?auto_179446 ?auto_179447 ) ) ( not ( = ?auto_179446 ?auto_179448 ) ) ( not ( = ?auto_179447 ?auto_179448 ) ) ( ON ?auto_179448 ?auto_179450 ) ( not ( = ?auto_179444 ?auto_179450 ) ) ( not ( = ?auto_179445 ?auto_179450 ) ) ( not ( = ?auto_179446 ?auto_179450 ) ) ( not ( = ?auto_179447 ?auto_179450 ) ) ( not ( = ?auto_179448 ?auto_179450 ) ) ( ON ?auto_179447 ?auto_179448 ) ( ON-TABLE ?auto_179449 ) ( ON ?auto_179451 ?auto_179449 ) ( ON ?auto_179450 ?auto_179451 ) ( not ( = ?auto_179449 ?auto_179451 ) ) ( not ( = ?auto_179449 ?auto_179450 ) ) ( not ( = ?auto_179449 ?auto_179448 ) ) ( not ( = ?auto_179449 ?auto_179447 ) ) ( not ( = ?auto_179451 ?auto_179450 ) ) ( not ( = ?auto_179451 ?auto_179448 ) ) ( not ( = ?auto_179451 ?auto_179447 ) ) ( not ( = ?auto_179444 ?auto_179449 ) ) ( not ( = ?auto_179444 ?auto_179451 ) ) ( not ( = ?auto_179445 ?auto_179449 ) ) ( not ( = ?auto_179445 ?auto_179451 ) ) ( not ( = ?auto_179446 ?auto_179449 ) ) ( not ( = ?auto_179446 ?auto_179451 ) ) ( ON ?auto_179446 ?auto_179447 ) ( ON ?auto_179444 ?auto_179452 ) ( CLEAR ?auto_179444 ) ( not ( = ?auto_179444 ?auto_179452 ) ) ( not ( = ?auto_179445 ?auto_179452 ) ) ( not ( = ?auto_179446 ?auto_179452 ) ) ( not ( = ?auto_179447 ?auto_179452 ) ) ( not ( = ?auto_179448 ?auto_179452 ) ) ( not ( = ?auto_179450 ?auto_179452 ) ) ( not ( = ?auto_179449 ?auto_179452 ) ) ( not ( = ?auto_179451 ?auto_179452 ) ) ( HOLDING ?auto_179445 ) ( CLEAR ?auto_179446 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179449 ?auto_179451 ?auto_179450 ?auto_179448 ?auto_179447 ?auto_179446 ?auto_179445 )
      ( MAKE-5PILE ?auto_179444 ?auto_179445 ?auto_179446 ?auto_179447 ?auto_179448 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179453 - BLOCK
      ?auto_179454 - BLOCK
      ?auto_179455 - BLOCK
      ?auto_179456 - BLOCK
      ?auto_179457 - BLOCK
    )
    :vars
    (
      ?auto_179460 - BLOCK
      ?auto_179459 - BLOCK
      ?auto_179458 - BLOCK
      ?auto_179461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179453 ?auto_179454 ) ) ( not ( = ?auto_179453 ?auto_179455 ) ) ( not ( = ?auto_179453 ?auto_179456 ) ) ( not ( = ?auto_179453 ?auto_179457 ) ) ( not ( = ?auto_179454 ?auto_179455 ) ) ( not ( = ?auto_179454 ?auto_179456 ) ) ( not ( = ?auto_179454 ?auto_179457 ) ) ( not ( = ?auto_179455 ?auto_179456 ) ) ( not ( = ?auto_179455 ?auto_179457 ) ) ( not ( = ?auto_179456 ?auto_179457 ) ) ( ON ?auto_179457 ?auto_179460 ) ( not ( = ?auto_179453 ?auto_179460 ) ) ( not ( = ?auto_179454 ?auto_179460 ) ) ( not ( = ?auto_179455 ?auto_179460 ) ) ( not ( = ?auto_179456 ?auto_179460 ) ) ( not ( = ?auto_179457 ?auto_179460 ) ) ( ON ?auto_179456 ?auto_179457 ) ( ON-TABLE ?auto_179459 ) ( ON ?auto_179458 ?auto_179459 ) ( ON ?auto_179460 ?auto_179458 ) ( not ( = ?auto_179459 ?auto_179458 ) ) ( not ( = ?auto_179459 ?auto_179460 ) ) ( not ( = ?auto_179459 ?auto_179457 ) ) ( not ( = ?auto_179459 ?auto_179456 ) ) ( not ( = ?auto_179458 ?auto_179460 ) ) ( not ( = ?auto_179458 ?auto_179457 ) ) ( not ( = ?auto_179458 ?auto_179456 ) ) ( not ( = ?auto_179453 ?auto_179459 ) ) ( not ( = ?auto_179453 ?auto_179458 ) ) ( not ( = ?auto_179454 ?auto_179459 ) ) ( not ( = ?auto_179454 ?auto_179458 ) ) ( not ( = ?auto_179455 ?auto_179459 ) ) ( not ( = ?auto_179455 ?auto_179458 ) ) ( ON ?auto_179455 ?auto_179456 ) ( ON ?auto_179453 ?auto_179461 ) ( not ( = ?auto_179453 ?auto_179461 ) ) ( not ( = ?auto_179454 ?auto_179461 ) ) ( not ( = ?auto_179455 ?auto_179461 ) ) ( not ( = ?auto_179456 ?auto_179461 ) ) ( not ( = ?auto_179457 ?auto_179461 ) ) ( not ( = ?auto_179460 ?auto_179461 ) ) ( not ( = ?auto_179459 ?auto_179461 ) ) ( not ( = ?auto_179458 ?auto_179461 ) ) ( CLEAR ?auto_179455 ) ( ON ?auto_179454 ?auto_179453 ) ( CLEAR ?auto_179454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179461 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179461 ?auto_179453 )
      ( MAKE-5PILE ?auto_179453 ?auto_179454 ?auto_179455 ?auto_179456 ?auto_179457 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179462 - BLOCK
      ?auto_179463 - BLOCK
      ?auto_179464 - BLOCK
      ?auto_179465 - BLOCK
      ?auto_179466 - BLOCK
    )
    :vars
    (
      ?auto_179468 - BLOCK
      ?auto_179470 - BLOCK
      ?auto_179467 - BLOCK
      ?auto_179469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179462 ?auto_179463 ) ) ( not ( = ?auto_179462 ?auto_179464 ) ) ( not ( = ?auto_179462 ?auto_179465 ) ) ( not ( = ?auto_179462 ?auto_179466 ) ) ( not ( = ?auto_179463 ?auto_179464 ) ) ( not ( = ?auto_179463 ?auto_179465 ) ) ( not ( = ?auto_179463 ?auto_179466 ) ) ( not ( = ?auto_179464 ?auto_179465 ) ) ( not ( = ?auto_179464 ?auto_179466 ) ) ( not ( = ?auto_179465 ?auto_179466 ) ) ( ON ?auto_179466 ?auto_179468 ) ( not ( = ?auto_179462 ?auto_179468 ) ) ( not ( = ?auto_179463 ?auto_179468 ) ) ( not ( = ?auto_179464 ?auto_179468 ) ) ( not ( = ?auto_179465 ?auto_179468 ) ) ( not ( = ?auto_179466 ?auto_179468 ) ) ( ON ?auto_179465 ?auto_179466 ) ( ON-TABLE ?auto_179470 ) ( ON ?auto_179467 ?auto_179470 ) ( ON ?auto_179468 ?auto_179467 ) ( not ( = ?auto_179470 ?auto_179467 ) ) ( not ( = ?auto_179470 ?auto_179468 ) ) ( not ( = ?auto_179470 ?auto_179466 ) ) ( not ( = ?auto_179470 ?auto_179465 ) ) ( not ( = ?auto_179467 ?auto_179468 ) ) ( not ( = ?auto_179467 ?auto_179466 ) ) ( not ( = ?auto_179467 ?auto_179465 ) ) ( not ( = ?auto_179462 ?auto_179470 ) ) ( not ( = ?auto_179462 ?auto_179467 ) ) ( not ( = ?auto_179463 ?auto_179470 ) ) ( not ( = ?auto_179463 ?auto_179467 ) ) ( not ( = ?auto_179464 ?auto_179470 ) ) ( not ( = ?auto_179464 ?auto_179467 ) ) ( ON ?auto_179462 ?auto_179469 ) ( not ( = ?auto_179462 ?auto_179469 ) ) ( not ( = ?auto_179463 ?auto_179469 ) ) ( not ( = ?auto_179464 ?auto_179469 ) ) ( not ( = ?auto_179465 ?auto_179469 ) ) ( not ( = ?auto_179466 ?auto_179469 ) ) ( not ( = ?auto_179468 ?auto_179469 ) ) ( not ( = ?auto_179470 ?auto_179469 ) ) ( not ( = ?auto_179467 ?auto_179469 ) ) ( ON ?auto_179463 ?auto_179462 ) ( CLEAR ?auto_179463 ) ( ON-TABLE ?auto_179469 ) ( HOLDING ?auto_179464 ) ( CLEAR ?auto_179465 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179470 ?auto_179467 ?auto_179468 ?auto_179466 ?auto_179465 ?auto_179464 )
      ( MAKE-5PILE ?auto_179462 ?auto_179463 ?auto_179464 ?auto_179465 ?auto_179466 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179471 - BLOCK
      ?auto_179472 - BLOCK
      ?auto_179473 - BLOCK
      ?auto_179474 - BLOCK
      ?auto_179475 - BLOCK
    )
    :vars
    (
      ?auto_179478 - BLOCK
      ?auto_179476 - BLOCK
      ?auto_179477 - BLOCK
      ?auto_179479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179471 ?auto_179472 ) ) ( not ( = ?auto_179471 ?auto_179473 ) ) ( not ( = ?auto_179471 ?auto_179474 ) ) ( not ( = ?auto_179471 ?auto_179475 ) ) ( not ( = ?auto_179472 ?auto_179473 ) ) ( not ( = ?auto_179472 ?auto_179474 ) ) ( not ( = ?auto_179472 ?auto_179475 ) ) ( not ( = ?auto_179473 ?auto_179474 ) ) ( not ( = ?auto_179473 ?auto_179475 ) ) ( not ( = ?auto_179474 ?auto_179475 ) ) ( ON ?auto_179475 ?auto_179478 ) ( not ( = ?auto_179471 ?auto_179478 ) ) ( not ( = ?auto_179472 ?auto_179478 ) ) ( not ( = ?auto_179473 ?auto_179478 ) ) ( not ( = ?auto_179474 ?auto_179478 ) ) ( not ( = ?auto_179475 ?auto_179478 ) ) ( ON ?auto_179474 ?auto_179475 ) ( ON-TABLE ?auto_179476 ) ( ON ?auto_179477 ?auto_179476 ) ( ON ?auto_179478 ?auto_179477 ) ( not ( = ?auto_179476 ?auto_179477 ) ) ( not ( = ?auto_179476 ?auto_179478 ) ) ( not ( = ?auto_179476 ?auto_179475 ) ) ( not ( = ?auto_179476 ?auto_179474 ) ) ( not ( = ?auto_179477 ?auto_179478 ) ) ( not ( = ?auto_179477 ?auto_179475 ) ) ( not ( = ?auto_179477 ?auto_179474 ) ) ( not ( = ?auto_179471 ?auto_179476 ) ) ( not ( = ?auto_179471 ?auto_179477 ) ) ( not ( = ?auto_179472 ?auto_179476 ) ) ( not ( = ?auto_179472 ?auto_179477 ) ) ( not ( = ?auto_179473 ?auto_179476 ) ) ( not ( = ?auto_179473 ?auto_179477 ) ) ( ON ?auto_179471 ?auto_179479 ) ( not ( = ?auto_179471 ?auto_179479 ) ) ( not ( = ?auto_179472 ?auto_179479 ) ) ( not ( = ?auto_179473 ?auto_179479 ) ) ( not ( = ?auto_179474 ?auto_179479 ) ) ( not ( = ?auto_179475 ?auto_179479 ) ) ( not ( = ?auto_179478 ?auto_179479 ) ) ( not ( = ?auto_179476 ?auto_179479 ) ) ( not ( = ?auto_179477 ?auto_179479 ) ) ( ON ?auto_179472 ?auto_179471 ) ( ON-TABLE ?auto_179479 ) ( CLEAR ?auto_179474 ) ( ON ?auto_179473 ?auto_179472 ) ( CLEAR ?auto_179473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179479 ?auto_179471 ?auto_179472 )
      ( MAKE-5PILE ?auto_179471 ?auto_179472 ?auto_179473 ?auto_179474 ?auto_179475 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179480 - BLOCK
      ?auto_179481 - BLOCK
      ?auto_179482 - BLOCK
      ?auto_179483 - BLOCK
      ?auto_179484 - BLOCK
    )
    :vars
    (
      ?auto_179486 - BLOCK
      ?auto_179487 - BLOCK
      ?auto_179488 - BLOCK
      ?auto_179485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179480 ?auto_179481 ) ) ( not ( = ?auto_179480 ?auto_179482 ) ) ( not ( = ?auto_179480 ?auto_179483 ) ) ( not ( = ?auto_179480 ?auto_179484 ) ) ( not ( = ?auto_179481 ?auto_179482 ) ) ( not ( = ?auto_179481 ?auto_179483 ) ) ( not ( = ?auto_179481 ?auto_179484 ) ) ( not ( = ?auto_179482 ?auto_179483 ) ) ( not ( = ?auto_179482 ?auto_179484 ) ) ( not ( = ?auto_179483 ?auto_179484 ) ) ( ON ?auto_179484 ?auto_179486 ) ( not ( = ?auto_179480 ?auto_179486 ) ) ( not ( = ?auto_179481 ?auto_179486 ) ) ( not ( = ?auto_179482 ?auto_179486 ) ) ( not ( = ?auto_179483 ?auto_179486 ) ) ( not ( = ?auto_179484 ?auto_179486 ) ) ( ON-TABLE ?auto_179487 ) ( ON ?auto_179488 ?auto_179487 ) ( ON ?auto_179486 ?auto_179488 ) ( not ( = ?auto_179487 ?auto_179488 ) ) ( not ( = ?auto_179487 ?auto_179486 ) ) ( not ( = ?auto_179487 ?auto_179484 ) ) ( not ( = ?auto_179487 ?auto_179483 ) ) ( not ( = ?auto_179488 ?auto_179486 ) ) ( not ( = ?auto_179488 ?auto_179484 ) ) ( not ( = ?auto_179488 ?auto_179483 ) ) ( not ( = ?auto_179480 ?auto_179487 ) ) ( not ( = ?auto_179480 ?auto_179488 ) ) ( not ( = ?auto_179481 ?auto_179487 ) ) ( not ( = ?auto_179481 ?auto_179488 ) ) ( not ( = ?auto_179482 ?auto_179487 ) ) ( not ( = ?auto_179482 ?auto_179488 ) ) ( ON ?auto_179480 ?auto_179485 ) ( not ( = ?auto_179480 ?auto_179485 ) ) ( not ( = ?auto_179481 ?auto_179485 ) ) ( not ( = ?auto_179482 ?auto_179485 ) ) ( not ( = ?auto_179483 ?auto_179485 ) ) ( not ( = ?auto_179484 ?auto_179485 ) ) ( not ( = ?auto_179486 ?auto_179485 ) ) ( not ( = ?auto_179487 ?auto_179485 ) ) ( not ( = ?auto_179488 ?auto_179485 ) ) ( ON ?auto_179481 ?auto_179480 ) ( ON-TABLE ?auto_179485 ) ( ON ?auto_179482 ?auto_179481 ) ( CLEAR ?auto_179482 ) ( HOLDING ?auto_179483 ) ( CLEAR ?auto_179484 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179487 ?auto_179488 ?auto_179486 ?auto_179484 ?auto_179483 )
      ( MAKE-5PILE ?auto_179480 ?auto_179481 ?auto_179482 ?auto_179483 ?auto_179484 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179489 - BLOCK
      ?auto_179490 - BLOCK
      ?auto_179491 - BLOCK
      ?auto_179492 - BLOCK
      ?auto_179493 - BLOCK
    )
    :vars
    (
      ?auto_179496 - BLOCK
      ?auto_179497 - BLOCK
      ?auto_179494 - BLOCK
      ?auto_179495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179489 ?auto_179490 ) ) ( not ( = ?auto_179489 ?auto_179491 ) ) ( not ( = ?auto_179489 ?auto_179492 ) ) ( not ( = ?auto_179489 ?auto_179493 ) ) ( not ( = ?auto_179490 ?auto_179491 ) ) ( not ( = ?auto_179490 ?auto_179492 ) ) ( not ( = ?auto_179490 ?auto_179493 ) ) ( not ( = ?auto_179491 ?auto_179492 ) ) ( not ( = ?auto_179491 ?auto_179493 ) ) ( not ( = ?auto_179492 ?auto_179493 ) ) ( ON ?auto_179493 ?auto_179496 ) ( not ( = ?auto_179489 ?auto_179496 ) ) ( not ( = ?auto_179490 ?auto_179496 ) ) ( not ( = ?auto_179491 ?auto_179496 ) ) ( not ( = ?auto_179492 ?auto_179496 ) ) ( not ( = ?auto_179493 ?auto_179496 ) ) ( ON-TABLE ?auto_179497 ) ( ON ?auto_179494 ?auto_179497 ) ( ON ?auto_179496 ?auto_179494 ) ( not ( = ?auto_179497 ?auto_179494 ) ) ( not ( = ?auto_179497 ?auto_179496 ) ) ( not ( = ?auto_179497 ?auto_179493 ) ) ( not ( = ?auto_179497 ?auto_179492 ) ) ( not ( = ?auto_179494 ?auto_179496 ) ) ( not ( = ?auto_179494 ?auto_179493 ) ) ( not ( = ?auto_179494 ?auto_179492 ) ) ( not ( = ?auto_179489 ?auto_179497 ) ) ( not ( = ?auto_179489 ?auto_179494 ) ) ( not ( = ?auto_179490 ?auto_179497 ) ) ( not ( = ?auto_179490 ?auto_179494 ) ) ( not ( = ?auto_179491 ?auto_179497 ) ) ( not ( = ?auto_179491 ?auto_179494 ) ) ( ON ?auto_179489 ?auto_179495 ) ( not ( = ?auto_179489 ?auto_179495 ) ) ( not ( = ?auto_179490 ?auto_179495 ) ) ( not ( = ?auto_179491 ?auto_179495 ) ) ( not ( = ?auto_179492 ?auto_179495 ) ) ( not ( = ?auto_179493 ?auto_179495 ) ) ( not ( = ?auto_179496 ?auto_179495 ) ) ( not ( = ?auto_179497 ?auto_179495 ) ) ( not ( = ?auto_179494 ?auto_179495 ) ) ( ON ?auto_179490 ?auto_179489 ) ( ON-TABLE ?auto_179495 ) ( ON ?auto_179491 ?auto_179490 ) ( CLEAR ?auto_179493 ) ( ON ?auto_179492 ?auto_179491 ) ( CLEAR ?auto_179492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179495 ?auto_179489 ?auto_179490 ?auto_179491 )
      ( MAKE-5PILE ?auto_179489 ?auto_179490 ?auto_179491 ?auto_179492 ?auto_179493 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179498 - BLOCK
      ?auto_179499 - BLOCK
      ?auto_179500 - BLOCK
      ?auto_179501 - BLOCK
      ?auto_179502 - BLOCK
    )
    :vars
    (
      ?auto_179504 - BLOCK
      ?auto_179506 - BLOCK
      ?auto_179505 - BLOCK
      ?auto_179503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179498 ?auto_179499 ) ) ( not ( = ?auto_179498 ?auto_179500 ) ) ( not ( = ?auto_179498 ?auto_179501 ) ) ( not ( = ?auto_179498 ?auto_179502 ) ) ( not ( = ?auto_179499 ?auto_179500 ) ) ( not ( = ?auto_179499 ?auto_179501 ) ) ( not ( = ?auto_179499 ?auto_179502 ) ) ( not ( = ?auto_179500 ?auto_179501 ) ) ( not ( = ?auto_179500 ?auto_179502 ) ) ( not ( = ?auto_179501 ?auto_179502 ) ) ( not ( = ?auto_179498 ?auto_179504 ) ) ( not ( = ?auto_179499 ?auto_179504 ) ) ( not ( = ?auto_179500 ?auto_179504 ) ) ( not ( = ?auto_179501 ?auto_179504 ) ) ( not ( = ?auto_179502 ?auto_179504 ) ) ( ON-TABLE ?auto_179506 ) ( ON ?auto_179505 ?auto_179506 ) ( ON ?auto_179504 ?auto_179505 ) ( not ( = ?auto_179506 ?auto_179505 ) ) ( not ( = ?auto_179506 ?auto_179504 ) ) ( not ( = ?auto_179506 ?auto_179502 ) ) ( not ( = ?auto_179506 ?auto_179501 ) ) ( not ( = ?auto_179505 ?auto_179504 ) ) ( not ( = ?auto_179505 ?auto_179502 ) ) ( not ( = ?auto_179505 ?auto_179501 ) ) ( not ( = ?auto_179498 ?auto_179506 ) ) ( not ( = ?auto_179498 ?auto_179505 ) ) ( not ( = ?auto_179499 ?auto_179506 ) ) ( not ( = ?auto_179499 ?auto_179505 ) ) ( not ( = ?auto_179500 ?auto_179506 ) ) ( not ( = ?auto_179500 ?auto_179505 ) ) ( ON ?auto_179498 ?auto_179503 ) ( not ( = ?auto_179498 ?auto_179503 ) ) ( not ( = ?auto_179499 ?auto_179503 ) ) ( not ( = ?auto_179500 ?auto_179503 ) ) ( not ( = ?auto_179501 ?auto_179503 ) ) ( not ( = ?auto_179502 ?auto_179503 ) ) ( not ( = ?auto_179504 ?auto_179503 ) ) ( not ( = ?auto_179506 ?auto_179503 ) ) ( not ( = ?auto_179505 ?auto_179503 ) ) ( ON ?auto_179499 ?auto_179498 ) ( ON-TABLE ?auto_179503 ) ( ON ?auto_179500 ?auto_179499 ) ( ON ?auto_179501 ?auto_179500 ) ( CLEAR ?auto_179501 ) ( HOLDING ?auto_179502 ) ( CLEAR ?auto_179504 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179506 ?auto_179505 ?auto_179504 ?auto_179502 )
      ( MAKE-5PILE ?auto_179498 ?auto_179499 ?auto_179500 ?auto_179501 ?auto_179502 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179507 - BLOCK
      ?auto_179508 - BLOCK
      ?auto_179509 - BLOCK
      ?auto_179510 - BLOCK
      ?auto_179511 - BLOCK
    )
    :vars
    (
      ?auto_179513 - BLOCK
      ?auto_179512 - BLOCK
      ?auto_179514 - BLOCK
      ?auto_179515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179507 ?auto_179508 ) ) ( not ( = ?auto_179507 ?auto_179509 ) ) ( not ( = ?auto_179507 ?auto_179510 ) ) ( not ( = ?auto_179507 ?auto_179511 ) ) ( not ( = ?auto_179508 ?auto_179509 ) ) ( not ( = ?auto_179508 ?auto_179510 ) ) ( not ( = ?auto_179508 ?auto_179511 ) ) ( not ( = ?auto_179509 ?auto_179510 ) ) ( not ( = ?auto_179509 ?auto_179511 ) ) ( not ( = ?auto_179510 ?auto_179511 ) ) ( not ( = ?auto_179507 ?auto_179513 ) ) ( not ( = ?auto_179508 ?auto_179513 ) ) ( not ( = ?auto_179509 ?auto_179513 ) ) ( not ( = ?auto_179510 ?auto_179513 ) ) ( not ( = ?auto_179511 ?auto_179513 ) ) ( ON-TABLE ?auto_179512 ) ( ON ?auto_179514 ?auto_179512 ) ( ON ?auto_179513 ?auto_179514 ) ( not ( = ?auto_179512 ?auto_179514 ) ) ( not ( = ?auto_179512 ?auto_179513 ) ) ( not ( = ?auto_179512 ?auto_179511 ) ) ( not ( = ?auto_179512 ?auto_179510 ) ) ( not ( = ?auto_179514 ?auto_179513 ) ) ( not ( = ?auto_179514 ?auto_179511 ) ) ( not ( = ?auto_179514 ?auto_179510 ) ) ( not ( = ?auto_179507 ?auto_179512 ) ) ( not ( = ?auto_179507 ?auto_179514 ) ) ( not ( = ?auto_179508 ?auto_179512 ) ) ( not ( = ?auto_179508 ?auto_179514 ) ) ( not ( = ?auto_179509 ?auto_179512 ) ) ( not ( = ?auto_179509 ?auto_179514 ) ) ( ON ?auto_179507 ?auto_179515 ) ( not ( = ?auto_179507 ?auto_179515 ) ) ( not ( = ?auto_179508 ?auto_179515 ) ) ( not ( = ?auto_179509 ?auto_179515 ) ) ( not ( = ?auto_179510 ?auto_179515 ) ) ( not ( = ?auto_179511 ?auto_179515 ) ) ( not ( = ?auto_179513 ?auto_179515 ) ) ( not ( = ?auto_179512 ?auto_179515 ) ) ( not ( = ?auto_179514 ?auto_179515 ) ) ( ON ?auto_179508 ?auto_179507 ) ( ON-TABLE ?auto_179515 ) ( ON ?auto_179509 ?auto_179508 ) ( ON ?auto_179510 ?auto_179509 ) ( CLEAR ?auto_179513 ) ( ON ?auto_179511 ?auto_179510 ) ( CLEAR ?auto_179511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179515 ?auto_179507 ?auto_179508 ?auto_179509 ?auto_179510 )
      ( MAKE-5PILE ?auto_179507 ?auto_179508 ?auto_179509 ?auto_179510 ?auto_179511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179516 - BLOCK
      ?auto_179517 - BLOCK
      ?auto_179518 - BLOCK
      ?auto_179519 - BLOCK
      ?auto_179520 - BLOCK
    )
    :vars
    (
      ?auto_179524 - BLOCK
      ?auto_179521 - BLOCK
      ?auto_179523 - BLOCK
      ?auto_179522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179516 ?auto_179517 ) ) ( not ( = ?auto_179516 ?auto_179518 ) ) ( not ( = ?auto_179516 ?auto_179519 ) ) ( not ( = ?auto_179516 ?auto_179520 ) ) ( not ( = ?auto_179517 ?auto_179518 ) ) ( not ( = ?auto_179517 ?auto_179519 ) ) ( not ( = ?auto_179517 ?auto_179520 ) ) ( not ( = ?auto_179518 ?auto_179519 ) ) ( not ( = ?auto_179518 ?auto_179520 ) ) ( not ( = ?auto_179519 ?auto_179520 ) ) ( not ( = ?auto_179516 ?auto_179524 ) ) ( not ( = ?auto_179517 ?auto_179524 ) ) ( not ( = ?auto_179518 ?auto_179524 ) ) ( not ( = ?auto_179519 ?auto_179524 ) ) ( not ( = ?auto_179520 ?auto_179524 ) ) ( ON-TABLE ?auto_179521 ) ( ON ?auto_179523 ?auto_179521 ) ( not ( = ?auto_179521 ?auto_179523 ) ) ( not ( = ?auto_179521 ?auto_179524 ) ) ( not ( = ?auto_179521 ?auto_179520 ) ) ( not ( = ?auto_179521 ?auto_179519 ) ) ( not ( = ?auto_179523 ?auto_179524 ) ) ( not ( = ?auto_179523 ?auto_179520 ) ) ( not ( = ?auto_179523 ?auto_179519 ) ) ( not ( = ?auto_179516 ?auto_179521 ) ) ( not ( = ?auto_179516 ?auto_179523 ) ) ( not ( = ?auto_179517 ?auto_179521 ) ) ( not ( = ?auto_179517 ?auto_179523 ) ) ( not ( = ?auto_179518 ?auto_179521 ) ) ( not ( = ?auto_179518 ?auto_179523 ) ) ( ON ?auto_179516 ?auto_179522 ) ( not ( = ?auto_179516 ?auto_179522 ) ) ( not ( = ?auto_179517 ?auto_179522 ) ) ( not ( = ?auto_179518 ?auto_179522 ) ) ( not ( = ?auto_179519 ?auto_179522 ) ) ( not ( = ?auto_179520 ?auto_179522 ) ) ( not ( = ?auto_179524 ?auto_179522 ) ) ( not ( = ?auto_179521 ?auto_179522 ) ) ( not ( = ?auto_179523 ?auto_179522 ) ) ( ON ?auto_179517 ?auto_179516 ) ( ON-TABLE ?auto_179522 ) ( ON ?auto_179518 ?auto_179517 ) ( ON ?auto_179519 ?auto_179518 ) ( ON ?auto_179520 ?auto_179519 ) ( CLEAR ?auto_179520 ) ( HOLDING ?auto_179524 ) ( CLEAR ?auto_179523 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179521 ?auto_179523 ?auto_179524 )
      ( MAKE-5PILE ?auto_179516 ?auto_179517 ?auto_179518 ?auto_179519 ?auto_179520 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179525 - BLOCK
      ?auto_179526 - BLOCK
      ?auto_179527 - BLOCK
      ?auto_179528 - BLOCK
      ?auto_179529 - BLOCK
    )
    :vars
    (
      ?auto_179532 - BLOCK
      ?auto_179531 - BLOCK
      ?auto_179530 - BLOCK
      ?auto_179533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179525 ?auto_179526 ) ) ( not ( = ?auto_179525 ?auto_179527 ) ) ( not ( = ?auto_179525 ?auto_179528 ) ) ( not ( = ?auto_179525 ?auto_179529 ) ) ( not ( = ?auto_179526 ?auto_179527 ) ) ( not ( = ?auto_179526 ?auto_179528 ) ) ( not ( = ?auto_179526 ?auto_179529 ) ) ( not ( = ?auto_179527 ?auto_179528 ) ) ( not ( = ?auto_179527 ?auto_179529 ) ) ( not ( = ?auto_179528 ?auto_179529 ) ) ( not ( = ?auto_179525 ?auto_179532 ) ) ( not ( = ?auto_179526 ?auto_179532 ) ) ( not ( = ?auto_179527 ?auto_179532 ) ) ( not ( = ?auto_179528 ?auto_179532 ) ) ( not ( = ?auto_179529 ?auto_179532 ) ) ( ON-TABLE ?auto_179531 ) ( ON ?auto_179530 ?auto_179531 ) ( not ( = ?auto_179531 ?auto_179530 ) ) ( not ( = ?auto_179531 ?auto_179532 ) ) ( not ( = ?auto_179531 ?auto_179529 ) ) ( not ( = ?auto_179531 ?auto_179528 ) ) ( not ( = ?auto_179530 ?auto_179532 ) ) ( not ( = ?auto_179530 ?auto_179529 ) ) ( not ( = ?auto_179530 ?auto_179528 ) ) ( not ( = ?auto_179525 ?auto_179531 ) ) ( not ( = ?auto_179525 ?auto_179530 ) ) ( not ( = ?auto_179526 ?auto_179531 ) ) ( not ( = ?auto_179526 ?auto_179530 ) ) ( not ( = ?auto_179527 ?auto_179531 ) ) ( not ( = ?auto_179527 ?auto_179530 ) ) ( ON ?auto_179525 ?auto_179533 ) ( not ( = ?auto_179525 ?auto_179533 ) ) ( not ( = ?auto_179526 ?auto_179533 ) ) ( not ( = ?auto_179527 ?auto_179533 ) ) ( not ( = ?auto_179528 ?auto_179533 ) ) ( not ( = ?auto_179529 ?auto_179533 ) ) ( not ( = ?auto_179532 ?auto_179533 ) ) ( not ( = ?auto_179531 ?auto_179533 ) ) ( not ( = ?auto_179530 ?auto_179533 ) ) ( ON ?auto_179526 ?auto_179525 ) ( ON-TABLE ?auto_179533 ) ( ON ?auto_179527 ?auto_179526 ) ( ON ?auto_179528 ?auto_179527 ) ( ON ?auto_179529 ?auto_179528 ) ( CLEAR ?auto_179530 ) ( ON ?auto_179532 ?auto_179529 ) ( CLEAR ?auto_179532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179533 ?auto_179525 ?auto_179526 ?auto_179527 ?auto_179528 ?auto_179529 )
      ( MAKE-5PILE ?auto_179525 ?auto_179526 ?auto_179527 ?auto_179528 ?auto_179529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179534 - BLOCK
      ?auto_179535 - BLOCK
      ?auto_179536 - BLOCK
      ?auto_179537 - BLOCK
      ?auto_179538 - BLOCK
    )
    :vars
    (
      ?auto_179539 - BLOCK
      ?auto_179542 - BLOCK
      ?auto_179540 - BLOCK
      ?auto_179541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179534 ?auto_179535 ) ) ( not ( = ?auto_179534 ?auto_179536 ) ) ( not ( = ?auto_179534 ?auto_179537 ) ) ( not ( = ?auto_179534 ?auto_179538 ) ) ( not ( = ?auto_179535 ?auto_179536 ) ) ( not ( = ?auto_179535 ?auto_179537 ) ) ( not ( = ?auto_179535 ?auto_179538 ) ) ( not ( = ?auto_179536 ?auto_179537 ) ) ( not ( = ?auto_179536 ?auto_179538 ) ) ( not ( = ?auto_179537 ?auto_179538 ) ) ( not ( = ?auto_179534 ?auto_179539 ) ) ( not ( = ?auto_179535 ?auto_179539 ) ) ( not ( = ?auto_179536 ?auto_179539 ) ) ( not ( = ?auto_179537 ?auto_179539 ) ) ( not ( = ?auto_179538 ?auto_179539 ) ) ( ON-TABLE ?auto_179542 ) ( not ( = ?auto_179542 ?auto_179540 ) ) ( not ( = ?auto_179542 ?auto_179539 ) ) ( not ( = ?auto_179542 ?auto_179538 ) ) ( not ( = ?auto_179542 ?auto_179537 ) ) ( not ( = ?auto_179540 ?auto_179539 ) ) ( not ( = ?auto_179540 ?auto_179538 ) ) ( not ( = ?auto_179540 ?auto_179537 ) ) ( not ( = ?auto_179534 ?auto_179542 ) ) ( not ( = ?auto_179534 ?auto_179540 ) ) ( not ( = ?auto_179535 ?auto_179542 ) ) ( not ( = ?auto_179535 ?auto_179540 ) ) ( not ( = ?auto_179536 ?auto_179542 ) ) ( not ( = ?auto_179536 ?auto_179540 ) ) ( ON ?auto_179534 ?auto_179541 ) ( not ( = ?auto_179534 ?auto_179541 ) ) ( not ( = ?auto_179535 ?auto_179541 ) ) ( not ( = ?auto_179536 ?auto_179541 ) ) ( not ( = ?auto_179537 ?auto_179541 ) ) ( not ( = ?auto_179538 ?auto_179541 ) ) ( not ( = ?auto_179539 ?auto_179541 ) ) ( not ( = ?auto_179542 ?auto_179541 ) ) ( not ( = ?auto_179540 ?auto_179541 ) ) ( ON ?auto_179535 ?auto_179534 ) ( ON-TABLE ?auto_179541 ) ( ON ?auto_179536 ?auto_179535 ) ( ON ?auto_179537 ?auto_179536 ) ( ON ?auto_179538 ?auto_179537 ) ( ON ?auto_179539 ?auto_179538 ) ( CLEAR ?auto_179539 ) ( HOLDING ?auto_179540 ) ( CLEAR ?auto_179542 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179542 ?auto_179540 )
      ( MAKE-5PILE ?auto_179534 ?auto_179535 ?auto_179536 ?auto_179537 ?auto_179538 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179543 - BLOCK
      ?auto_179544 - BLOCK
      ?auto_179545 - BLOCK
      ?auto_179546 - BLOCK
      ?auto_179547 - BLOCK
    )
    :vars
    (
      ?auto_179550 - BLOCK
      ?auto_179549 - BLOCK
      ?auto_179551 - BLOCK
      ?auto_179548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179543 ?auto_179544 ) ) ( not ( = ?auto_179543 ?auto_179545 ) ) ( not ( = ?auto_179543 ?auto_179546 ) ) ( not ( = ?auto_179543 ?auto_179547 ) ) ( not ( = ?auto_179544 ?auto_179545 ) ) ( not ( = ?auto_179544 ?auto_179546 ) ) ( not ( = ?auto_179544 ?auto_179547 ) ) ( not ( = ?auto_179545 ?auto_179546 ) ) ( not ( = ?auto_179545 ?auto_179547 ) ) ( not ( = ?auto_179546 ?auto_179547 ) ) ( not ( = ?auto_179543 ?auto_179550 ) ) ( not ( = ?auto_179544 ?auto_179550 ) ) ( not ( = ?auto_179545 ?auto_179550 ) ) ( not ( = ?auto_179546 ?auto_179550 ) ) ( not ( = ?auto_179547 ?auto_179550 ) ) ( ON-TABLE ?auto_179549 ) ( not ( = ?auto_179549 ?auto_179551 ) ) ( not ( = ?auto_179549 ?auto_179550 ) ) ( not ( = ?auto_179549 ?auto_179547 ) ) ( not ( = ?auto_179549 ?auto_179546 ) ) ( not ( = ?auto_179551 ?auto_179550 ) ) ( not ( = ?auto_179551 ?auto_179547 ) ) ( not ( = ?auto_179551 ?auto_179546 ) ) ( not ( = ?auto_179543 ?auto_179549 ) ) ( not ( = ?auto_179543 ?auto_179551 ) ) ( not ( = ?auto_179544 ?auto_179549 ) ) ( not ( = ?auto_179544 ?auto_179551 ) ) ( not ( = ?auto_179545 ?auto_179549 ) ) ( not ( = ?auto_179545 ?auto_179551 ) ) ( ON ?auto_179543 ?auto_179548 ) ( not ( = ?auto_179543 ?auto_179548 ) ) ( not ( = ?auto_179544 ?auto_179548 ) ) ( not ( = ?auto_179545 ?auto_179548 ) ) ( not ( = ?auto_179546 ?auto_179548 ) ) ( not ( = ?auto_179547 ?auto_179548 ) ) ( not ( = ?auto_179550 ?auto_179548 ) ) ( not ( = ?auto_179549 ?auto_179548 ) ) ( not ( = ?auto_179551 ?auto_179548 ) ) ( ON ?auto_179544 ?auto_179543 ) ( ON-TABLE ?auto_179548 ) ( ON ?auto_179545 ?auto_179544 ) ( ON ?auto_179546 ?auto_179545 ) ( ON ?auto_179547 ?auto_179546 ) ( ON ?auto_179550 ?auto_179547 ) ( CLEAR ?auto_179549 ) ( ON ?auto_179551 ?auto_179550 ) ( CLEAR ?auto_179551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179548 ?auto_179543 ?auto_179544 ?auto_179545 ?auto_179546 ?auto_179547 ?auto_179550 )
      ( MAKE-5PILE ?auto_179543 ?auto_179544 ?auto_179545 ?auto_179546 ?auto_179547 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179552 - BLOCK
      ?auto_179553 - BLOCK
      ?auto_179554 - BLOCK
      ?auto_179555 - BLOCK
      ?auto_179556 - BLOCK
    )
    :vars
    (
      ?auto_179557 - BLOCK
      ?auto_179558 - BLOCK
      ?auto_179559 - BLOCK
      ?auto_179560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179552 ?auto_179553 ) ) ( not ( = ?auto_179552 ?auto_179554 ) ) ( not ( = ?auto_179552 ?auto_179555 ) ) ( not ( = ?auto_179552 ?auto_179556 ) ) ( not ( = ?auto_179553 ?auto_179554 ) ) ( not ( = ?auto_179553 ?auto_179555 ) ) ( not ( = ?auto_179553 ?auto_179556 ) ) ( not ( = ?auto_179554 ?auto_179555 ) ) ( not ( = ?auto_179554 ?auto_179556 ) ) ( not ( = ?auto_179555 ?auto_179556 ) ) ( not ( = ?auto_179552 ?auto_179557 ) ) ( not ( = ?auto_179553 ?auto_179557 ) ) ( not ( = ?auto_179554 ?auto_179557 ) ) ( not ( = ?auto_179555 ?auto_179557 ) ) ( not ( = ?auto_179556 ?auto_179557 ) ) ( not ( = ?auto_179558 ?auto_179559 ) ) ( not ( = ?auto_179558 ?auto_179557 ) ) ( not ( = ?auto_179558 ?auto_179556 ) ) ( not ( = ?auto_179558 ?auto_179555 ) ) ( not ( = ?auto_179559 ?auto_179557 ) ) ( not ( = ?auto_179559 ?auto_179556 ) ) ( not ( = ?auto_179559 ?auto_179555 ) ) ( not ( = ?auto_179552 ?auto_179558 ) ) ( not ( = ?auto_179552 ?auto_179559 ) ) ( not ( = ?auto_179553 ?auto_179558 ) ) ( not ( = ?auto_179553 ?auto_179559 ) ) ( not ( = ?auto_179554 ?auto_179558 ) ) ( not ( = ?auto_179554 ?auto_179559 ) ) ( ON ?auto_179552 ?auto_179560 ) ( not ( = ?auto_179552 ?auto_179560 ) ) ( not ( = ?auto_179553 ?auto_179560 ) ) ( not ( = ?auto_179554 ?auto_179560 ) ) ( not ( = ?auto_179555 ?auto_179560 ) ) ( not ( = ?auto_179556 ?auto_179560 ) ) ( not ( = ?auto_179557 ?auto_179560 ) ) ( not ( = ?auto_179558 ?auto_179560 ) ) ( not ( = ?auto_179559 ?auto_179560 ) ) ( ON ?auto_179553 ?auto_179552 ) ( ON-TABLE ?auto_179560 ) ( ON ?auto_179554 ?auto_179553 ) ( ON ?auto_179555 ?auto_179554 ) ( ON ?auto_179556 ?auto_179555 ) ( ON ?auto_179557 ?auto_179556 ) ( ON ?auto_179559 ?auto_179557 ) ( CLEAR ?auto_179559 ) ( HOLDING ?auto_179558 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179558 )
      ( MAKE-5PILE ?auto_179552 ?auto_179553 ?auto_179554 ?auto_179555 ?auto_179556 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_179561 - BLOCK
      ?auto_179562 - BLOCK
      ?auto_179563 - BLOCK
      ?auto_179564 - BLOCK
      ?auto_179565 - BLOCK
    )
    :vars
    (
      ?auto_179566 - BLOCK
      ?auto_179567 - BLOCK
      ?auto_179568 - BLOCK
      ?auto_179569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179561 ?auto_179562 ) ) ( not ( = ?auto_179561 ?auto_179563 ) ) ( not ( = ?auto_179561 ?auto_179564 ) ) ( not ( = ?auto_179561 ?auto_179565 ) ) ( not ( = ?auto_179562 ?auto_179563 ) ) ( not ( = ?auto_179562 ?auto_179564 ) ) ( not ( = ?auto_179562 ?auto_179565 ) ) ( not ( = ?auto_179563 ?auto_179564 ) ) ( not ( = ?auto_179563 ?auto_179565 ) ) ( not ( = ?auto_179564 ?auto_179565 ) ) ( not ( = ?auto_179561 ?auto_179566 ) ) ( not ( = ?auto_179562 ?auto_179566 ) ) ( not ( = ?auto_179563 ?auto_179566 ) ) ( not ( = ?auto_179564 ?auto_179566 ) ) ( not ( = ?auto_179565 ?auto_179566 ) ) ( not ( = ?auto_179567 ?auto_179568 ) ) ( not ( = ?auto_179567 ?auto_179566 ) ) ( not ( = ?auto_179567 ?auto_179565 ) ) ( not ( = ?auto_179567 ?auto_179564 ) ) ( not ( = ?auto_179568 ?auto_179566 ) ) ( not ( = ?auto_179568 ?auto_179565 ) ) ( not ( = ?auto_179568 ?auto_179564 ) ) ( not ( = ?auto_179561 ?auto_179567 ) ) ( not ( = ?auto_179561 ?auto_179568 ) ) ( not ( = ?auto_179562 ?auto_179567 ) ) ( not ( = ?auto_179562 ?auto_179568 ) ) ( not ( = ?auto_179563 ?auto_179567 ) ) ( not ( = ?auto_179563 ?auto_179568 ) ) ( ON ?auto_179561 ?auto_179569 ) ( not ( = ?auto_179561 ?auto_179569 ) ) ( not ( = ?auto_179562 ?auto_179569 ) ) ( not ( = ?auto_179563 ?auto_179569 ) ) ( not ( = ?auto_179564 ?auto_179569 ) ) ( not ( = ?auto_179565 ?auto_179569 ) ) ( not ( = ?auto_179566 ?auto_179569 ) ) ( not ( = ?auto_179567 ?auto_179569 ) ) ( not ( = ?auto_179568 ?auto_179569 ) ) ( ON ?auto_179562 ?auto_179561 ) ( ON-TABLE ?auto_179569 ) ( ON ?auto_179563 ?auto_179562 ) ( ON ?auto_179564 ?auto_179563 ) ( ON ?auto_179565 ?auto_179564 ) ( ON ?auto_179566 ?auto_179565 ) ( ON ?auto_179568 ?auto_179566 ) ( ON ?auto_179567 ?auto_179568 ) ( CLEAR ?auto_179567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179569 ?auto_179561 ?auto_179562 ?auto_179563 ?auto_179564 ?auto_179565 ?auto_179566 ?auto_179568 )
      ( MAKE-5PILE ?auto_179561 ?auto_179562 ?auto_179563 ?auto_179564 ?auto_179565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179585 - BLOCK
      ?auto_179586 - BLOCK
    )
    :vars
    (
      ?auto_179589 - BLOCK
      ?auto_179587 - BLOCK
      ?auto_179588 - BLOCK
      ?auto_179590 - BLOCK
      ?auto_179592 - BLOCK
      ?auto_179591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179589 ?auto_179586 ) ( ON-TABLE ?auto_179585 ) ( ON ?auto_179586 ?auto_179585 ) ( not ( = ?auto_179585 ?auto_179586 ) ) ( not ( = ?auto_179585 ?auto_179589 ) ) ( not ( = ?auto_179586 ?auto_179589 ) ) ( not ( = ?auto_179585 ?auto_179587 ) ) ( not ( = ?auto_179585 ?auto_179588 ) ) ( not ( = ?auto_179586 ?auto_179587 ) ) ( not ( = ?auto_179586 ?auto_179588 ) ) ( not ( = ?auto_179589 ?auto_179587 ) ) ( not ( = ?auto_179589 ?auto_179588 ) ) ( not ( = ?auto_179587 ?auto_179588 ) ) ( ON ?auto_179587 ?auto_179589 ) ( CLEAR ?auto_179587 ) ( HOLDING ?auto_179588 ) ( CLEAR ?auto_179590 ) ( ON-TABLE ?auto_179592 ) ( ON ?auto_179591 ?auto_179592 ) ( ON ?auto_179590 ?auto_179591 ) ( not ( = ?auto_179592 ?auto_179591 ) ) ( not ( = ?auto_179592 ?auto_179590 ) ) ( not ( = ?auto_179592 ?auto_179588 ) ) ( not ( = ?auto_179591 ?auto_179590 ) ) ( not ( = ?auto_179591 ?auto_179588 ) ) ( not ( = ?auto_179590 ?auto_179588 ) ) ( not ( = ?auto_179585 ?auto_179590 ) ) ( not ( = ?auto_179585 ?auto_179592 ) ) ( not ( = ?auto_179585 ?auto_179591 ) ) ( not ( = ?auto_179586 ?auto_179590 ) ) ( not ( = ?auto_179586 ?auto_179592 ) ) ( not ( = ?auto_179586 ?auto_179591 ) ) ( not ( = ?auto_179589 ?auto_179590 ) ) ( not ( = ?auto_179589 ?auto_179592 ) ) ( not ( = ?auto_179589 ?auto_179591 ) ) ( not ( = ?auto_179587 ?auto_179590 ) ) ( not ( = ?auto_179587 ?auto_179592 ) ) ( not ( = ?auto_179587 ?auto_179591 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179592 ?auto_179591 ?auto_179590 ?auto_179588 )
      ( MAKE-2PILE ?auto_179585 ?auto_179586 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179593 - BLOCK
      ?auto_179594 - BLOCK
    )
    :vars
    (
      ?auto_179599 - BLOCK
      ?auto_179597 - BLOCK
      ?auto_179600 - BLOCK
      ?auto_179595 - BLOCK
      ?auto_179596 - BLOCK
      ?auto_179598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179599 ?auto_179594 ) ( ON-TABLE ?auto_179593 ) ( ON ?auto_179594 ?auto_179593 ) ( not ( = ?auto_179593 ?auto_179594 ) ) ( not ( = ?auto_179593 ?auto_179599 ) ) ( not ( = ?auto_179594 ?auto_179599 ) ) ( not ( = ?auto_179593 ?auto_179597 ) ) ( not ( = ?auto_179593 ?auto_179600 ) ) ( not ( = ?auto_179594 ?auto_179597 ) ) ( not ( = ?auto_179594 ?auto_179600 ) ) ( not ( = ?auto_179599 ?auto_179597 ) ) ( not ( = ?auto_179599 ?auto_179600 ) ) ( not ( = ?auto_179597 ?auto_179600 ) ) ( ON ?auto_179597 ?auto_179599 ) ( CLEAR ?auto_179595 ) ( ON-TABLE ?auto_179596 ) ( ON ?auto_179598 ?auto_179596 ) ( ON ?auto_179595 ?auto_179598 ) ( not ( = ?auto_179596 ?auto_179598 ) ) ( not ( = ?auto_179596 ?auto_179595 ) ) ( not ( = ?auto_179596 ?auto_179600 ) ) ( not ( = ?auto_179598 ?auto_179595 ) ) ( not ( = ?auto_179598 ?auto_179600 ) ) ( not ( = ?auto_179595 ?auto_179600 ) ) ( not ( = ?auto_179593 ?auto_179595 ) ) ( not ( = ?auto_179593 ?auto_179596 ) ) ( not ( = ?auto_179593 ?auto_179598 ) ) ( not ( = ?auto_179594 ?auto_179595 ) ) ( not ( = ?auto_179594 ?auto_179596 ) ) ( not ( = ?auto_179594 ?auto_179598 ) ) ( not ( = ?auto_179599 ?auto_179595 ) ) ( not ( = ?auto_179599 ?auto_179596 ) ) ( not ( = ?auto_179599 ?auto_179598 ) ) ( not ( = ?auto_179597 ?auto_179595 ) ) ( not ( = ?auto_179597 ?auto_179596 ) ) ( not ( = ?auto_179597 ?auto_179598 ) ) ( ON ?auto_179600 ?auto_179597 ) ( CLEAR ?auto_179600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179593 ?auto_179594 ?auto_179599 ?auto_179597 )
      ( MAKE-2PILE ?auto_179593 ?auto_179594 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179601 - BLOCK
      ?auto_179602 - BLOCK
    )
    :vars
    (
      ?auto_179607 - BLOCK
      ?auto_179608 - BLOCK
      ?auto_179603 - BLOCK
      ?auto_179605 - BLOCK
      ?auto_179604 - BLOCK
      ?auto_179606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179607 ?auto_179602 ) ( ON-TABLE ?auto_179601 ) ( ON ?auto_179602 ?auto_179601 ) ( not ( = ?auto_179601 ?auto_179602 ) ) ( not ( = ?auto_179601 ?auto_179607 ) ) ( not ( = ?auto_179602 ?auto_179607 ) ) ( not ( = ?auto_179601 ?auto_179608 ) ) ( not ( = ?auto_179601 ?auto_179603 ) ) ( not ( = ?auto_179602 ?auto_179608 ) ) ( not ( = ?auto_179602 ?auto_179603 ) ) ( not ( = ?auto_179607 ?auto_179608 ) ) ( not ( = ?auto_179607 ?auto_179603 ) ) ( not ( = ?auto_179608 ?auto_179603 ) ) ( ON ?auto_179608 ?auto_179607 ) ( ON-TABLE ?auto_179605 ) ( ON ?auto_179604 ?auto_179605 ) ( not ( = ?auto_179605 ?auto_179604 ) ) ( not ( = ?auto_179605 ?auto_179606 ) ) ( not ( = ?auto_179605 ?auto_179603 ) ) ( not ( = ?auto_179604 ?auto_179606 ) ) ( not ( = ?auto_179604 ?auto_179603 ) ) ( not ( = ?auto_179606 ?auto_179603 ) ) ( not ( = ?auto_179601 ?auto_179606 ) ) ( not ( = ?auto_179601 ?auto_179605 ) ) ( not ( = ?auto_179601 ?auto_179604 ) ) ( not ( = ?auto_179602 ?auto_179606 ) ) ( not ( = ?auto_179602 ?auto_179605 ) ) ( not ( = ?auto_179602 ?auto_179604 ) ) ( not ( = ?auto_179607 ?auto_179606 ) ) ( not ( = ?auto_179607 ?auto_179605 ) ) ( not ( = ?auto_179607 ?auto_179604 ) ) ( not ( = ?auto_179608 ?auto_179606 ) ) ( not ( = ?auto_179608 ?auto_179605 ) ) ( not ( = ?auto_179608 ?auto_179604 ) ) ( ON ?auto_179603 ?auto_179608 ) ( CLEAR ?auto_179603 ) ( HOLDING ?auto_179606 ) ( CLEAR ?auto_179604 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179605 ?auto_179604 ?auto_179606 )
      ( MAKE-2PILE ?auto_179601 ?auto_179602 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179609 - BLOCK
      ?auto_179610 - BLOCK
    )
    :vars
    (
      ?auto_179612 - BLOCK
      ?auto_179611 - BLOCK
      ?auto_179614 - BLOCK
      ?auto_179615 - BLOCK
      ?auto_179613 - BLOCK
      ?auto_179616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179612 ?auto_179610 ) ( ON-TABLE ?auto_179609 ) ( ON ?auto_179610 ?auto_179609 ) ( not ( = ?auto_179609 ?auto_179610 ) ) ( not ( = ?auto_179609 ?auto_179612 ) ) ( not ( = ?auto_179610 ?auto_179612 ) ) ( not ( = ?auto_179609 ?auto_179611 ) ) ( not ( = ?auto_179609 ?auto_179614 ) ) ( not ( = ?auto_179610 ?auto_179611 ) ) ( not ( = ?auto_179610 ?auto_179614 ) ) ( not ( = ?auto_179612 ?auto_179611 ) ) ( not ( = ?auto_179612 ?auto_179614 ) ) ( not ( = ?auto_179611 ?auto_179614 ) ) ( ON ?auto_179611 ?auto_179612 ) ( ON-TABLE ?auto_179615 ) ( ON ?auto_179613 ?auto_179615 ) ( not ( = ?auto_179615 ?auto_179613 ) ) ( not ( = ?auto_179615 ?auto_179616 ) ) ( not ( = ?auto_179615 ?auto_179614 ) ) ( not ( = ?auto_179613 ?auto_179616 ) ) ( not ( = ?auto_179613 ?auto_179614 ) ) ( not ( = ?auto_179616 ?auto_179614 ) ) ( not ( = ?auto_179609 ?auto_179616 ) ) ( not ( = ?auto_179609 ?auto_179615 ) ) ( not ( = ?auto_179609 ?auto_179613 ) ) ( not ( = ?auto_179610 ?auto_179616 ) ) ( not ( = ?auto_179610 ?auto_179615 ) ) ( not ( = ?auto_179610 ?auto_179613 ) ) ( not ( = ?auto_179612 ?auto_179616 ) ) ( not ( = ?auto_179612 ?auto_179615 ) ) ( not ( = ?auto_179612 ?auto_179613 ) ) ( not ( = ?auto_179611 ?auto_179616 ) ) ( not ( = ?auto_179611 ?auto_179615 ) ) ( not ( = ?auto_179611 ?auto_179613 ) ) ( ON ?auto_179614 ?auto_179611 ) ( CLEAR ?auto_179613 ) ( ON ?auto_179616 ?auto_179614 ) ( CLEAR ?auto_179616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179609 ?auto_179610 ?auto_179612 ?auto_179611 ?auto_179614 )
      ( MAKE-2PILE ?auto_179609 ?auto_179610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179617 - BLOCK
      ?auto_179618 - BLOCK
    )
    :vars
    (
      ?auto_179621 - BLOCK
      ?auto_179620 - BLOCK
      ?auto_179619 - BLOCK
      ?auto_179623 - BLOCK
      ?auto_179622 - BLOCK
      ?auto_179624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179621 ?auto_179618 ) ( ON-TABLE ?auto_179617 ) ( ON ?auto_179618 ?auto_179617 ) ( not ( = ?auto_179617 ?auto_179618 ) ) ( not ( = ?auto_179617 ?auto_179621 ) ) ( not ( = ?auto_179618 ?auto_179621 ) ) ( not ( = ?auto_179617 ?auto_179620 ) ) ( not ( = ?auto_179617 ?auto_179619 ) ) ( not ( = ?auto_179618 ?auto_179620 ) ) ( not ( = ?auto_179618 ?auto_179619 ) ) ( not ( = ?auto_179621 ?auto_179620 ) ) ( not ( = ?auto_179621 ?auto_179619 ) ) ( not ( = ?auto_179620 ?auto_179619 ) ) ( ON ?auto_179620 ?auto_179621 ) ( ON-TABLE ?auto_179623 ) ( not ( = ?auto_179623 ?auto_179622 ) ) ( not ( = ?auto_179623 ?auto_179624 ) ) ( not ( = ?auto_179623 ?auto_179619 ) ) ( not ( = ?auto_179622 ?auto_179624 ) ) ( not ( = ?auto_179622 ?auto_179619 ) ) ( not ( = ?auto_179624 ?auto_179619 ) ) ( not ( = ?auto_179617 ?auto_179624 ) ) ( not ( = ?auto_179617 ?auto_179623 ) ) ( not ( = ?auto_179617 ?auto_179622 ) ) ( not ( = ?auto_179618 ?auto_179624 ) ) ( not ( = ?auto_179618 ?auto_179623 ) ) ( not ( = ?auto_179618 ?auto_179622 ) ) ( not ( = ?auto_179621 ?auto_179624 ) ) ( not ( = ?auto_179621 ?auto_179623 ) ) ( not ( = ?auto_179621 ?auto_179622 ) ) ( not ( = ?auto_179620 ?auto_179624 ) ) ( not ( = ?auto_179620 ?auto_179623 ) ) ( not ( = ?auto_179620 ?auto_179622 ) ) ( ON ?auto_179619 ?auto_179620 ) ( ON ?auto_179624 ?auto_179619 ) ( CLEAR ?auto_179624 ) ( HOLDING ?auto_179622 ) ( CLEAR ?auto_179623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179623 ?auto_179622 )
      ( MAKE-2PILE ?auto_179617 ?auto_179618 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179625 - BLOCK
      ?auto_179626 - BLOCK
    )
    :vars
    (
      ?auto_179628 - BLOCK
      ?auto_179631 - BLOCK
      ?auto_179629 - BLOCK
      ?auto_179632 - BLOCK
      ?auto_179627 - BLOCK
      ?auto_179630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179628 ?auto_179626 ) ( ON-TABLE ?auto_179625 ) ( ON ?auto_179626 ?auto_179625 ) ( not ( = ?auto_179625 ?auto_179626 ) ) ( not ( = ?auto_179625 ?auto_179628 ) ) ( not ( = ?auto_179626 ?auto_179628 ) ) ( not ( = ?auto_179625 ?auto_179631 ) ) ( not ( = ?auto_179625 ?auto_179629 ) ) ( not ( = ?auto_179626 ?auto_179631 ) ) ( not ( = ?auto_179626 ?auto_179629 ) ) ( not ( = ?auto_179628 ?auto_179631 ) ) ( not ( = ?auto_179628 ?auto_179629 ) ) ( not ( = ?auto_179631 ?auto_179629 ) ) ( ON ?auto_179631 ?auto_179628 ) ( ON-TABLE ?auto_179632 ) ( not ( = ?auto_179632 ?auto_179627 ) ) ( not ( = ?auto_179632 ?auto_179630 ) ) ( not ( = ?auto_179632 ?auto_179629 ) ) ( not ( = ?auto_179627 ?auto_179630 ) ) ( not ( = ?auto_179627 ?auto_179629 ) ) ( not ( = ?auto_179630 ?auto_179629 ) ) ( not ( = ?auto_179625 ?auto_179630 ) ) ( not ( = ?auto_179625 ?auto_179632 ) ) ( not ( = ?auto_179625 ?auto_179627 ) ) ( not ( = ?auto_179626 ?auto_179630 ) ) ( not ( = ?auto_179626 ?auto_179632 ) ) ( not ( = ?auto_179626 ?auto_179627 ) ) ( not ( = ?auto_179628 ?auto_179630 ) ) ( not ( = ?auto_179628 ?auto_179632 ) ) ( not ( = ?auto_179628 ?auto_179627 ) ) ( not ( = ?auto_179631 ?auto_179630 ) ) ( not ( = ?auto_179631 ?auto_179632 ) ) ( not ( = ?auto_179631 ?auto_179627 ) ) ( ON ?auto_179629 ?auto_179631 ) ( ON ?auto_179630 ?auto_179629 ) ( CLEAR ?auto_179632 ) ( ON ?auto_179627 ?auto_179630 ) ( CLEAR ?auto_179627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179625 ?auto_179626 ?auto_179628 ?auto_179631 ?auto_179629 ?auto_179630 )
      ( MAKE-2PILE ?auto_179625 ?auto_179626 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179633 - BLOCK
      ?auto_179634 - BLOCK
    )
    :vars
    (
      ?auto_179637 - BLOCK
      ?auto_179640 - BLOCK
      ?auto_179638 - BLOCK
      ?auto_179639 - BLOCK
      ?auto_179636 - BLOCK
      ?auto_179635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179637 ?auto_179634 ) ( ON-TABLE ?auto_179633 ) ( ON ?auto_179634 ?auto_179633 ) ( not ( = ?auto_179633 ?auto_179634 ) ) ( not ( = ?auto_179633 ?auto_179637 ) ) ( not ( = ?auto_179634 ?auto_179637 ) ) ( not ( = ?auto_179633 ?auto_179640 ) ) ( not ( = ?auto_179633 ?auto_179638 ) ) ( not ( = ?auto_179634 ?auto_179640 ) ) ( not ( = ?auto_179634 ?auto_179638 ) ) ( not ( = ?auto_179637 ?auto_179640 ) ) ( not ( = ?auto_179637 ?auto_179638 ) ) ( not ( = ?auto_179640 ?auto_179638 ) ) ( ON ?auto_179640 ?auto_179637 ) ( not ( = ?auto_179639 ?auto_179636 ) ) ( not ( = ?auto_179639 ?auto_179635 ) ) ( not ( = ?auto_179639 ?auto_179638 ) ) ( not ( = ?auto_179636 ?auto_179635 ) ) ( not ( = ?auto_179636 ?auto_179638 ) ) ( not ( = ?auto_179635 ?auto_179638 ) ) ( not ( = ?auto_179633 ?auto_179635 ) ) ( not ( = ?auto_179633 ?auto_179639 ) ) ( not ( = ?auto_179633 ?auto_179636 ) ) ( not ( = ?auto_179634 ?auto_179635 ) ) ( not ( = ?auto_179634 ?auto_179639 ) ) ( not ( = ?auto_179634 ?auto_179636 ) ) ( not ( = ?auto_179637 ?auto_179635 ) ) ( not ( = ?auto_179637 ?auto_179639 ) ) ( not ( = ?auto_179637 ?auto_179636 ) ) ( not ( = ?auto_179640 ?auto_179635 ) ) ( not ( = ?auto_179640 ?auto_179639 ) ) ( not ( = ?auto_179640 ?auto_179636 ) ) ( ON ?auto_179638 ?auto_179640 ) ( ON ?auto_179635 ?auto_179638 ) ( ON ?auto_179636 ?auto_179635 ) ( CLEAR ?auto_179636 ) ( HOLDING ?auto_179639 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179639 )
      ( MAKE-2PILE ?auto_179633 ?auto_179634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179651 - BLOCK
      ?auto_179652 - BLOCK
    )
    :vars
    (
      ?auto_179658 - BLOCK
      ?auto_179654 - BLOCK
      ?auto_179653 - BLOCK
      ?auto_179657 - BLOCK
      ?auto_179656 - BLOCK
      ?auto_179655 - BLOCK
      ?auto_179659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179658 ?auto_179652 ) ( ON-TABLE ?auto_179651 ) ( ON ?auto_179652 ?auto_179651 ) ( not ( = ?auto_179651 ?auto_179652 ) ) ( not ( = ?auto_179651 ?auto_179658 ) ) ( not ( = ?auto_179652 ?auto_179658 ) ) ( not ( = ?auto_179651 ?auto_179654 ) ) ( not ( = ?auto_179651 ?auto_179653 ) ) ( not ( = ?auto_179652 ?auto_179654 ) ) ( not ( = ?auto_179652 ?auto_179653 ) ) ( not ( = ?auto_179658 ?auto_179654 ) ) ( not ( = ?auto_179658 ?auto_179653 ) ) ( not ( = ?auto_179654 ?auto_179653 ) ) ( ON ?auto_179654 ?auto_179658 ) ( not ( = ?auto_179657 ?auto_179656 ) ) ( not ( = ?auto_179657 ?auto_179655 ) ) ( not ( = ?auto_179657 ?auto_179653 ) ) ( not ( = ?auto_179656 ?auto_179655 ) ) ( not ( = ?auto_179656 ?auto_179653 ) ) ( not ( = ?auto_179655 ?auto_179653 ) ) ( not ( = ?auto_179651 ?auto_179655 ) ) ( not ( = ?auto_179651 ?auto_179657 ) ) ( not ( = ?auto_179651 ?auto_179656 ) ) ( not ( = ?auto_179652 ?auto_179655 ) ) ( not ( = ?auto_179652 ?auto_179657 ) ) ( not ( = ?auto_179652 ?auto_179656 ) ) ( not ( = ?auto_179658 ?auto_179655 ) ) ( not ( = ?auto_179658 ?auto_179657 ) ) ( not ( = ?auto_179658 ?auto_179656 ) ) ( not ( = ?auto_179654 ?auto_179655 ) ) ( not ( = ?auto_179654 ?auto_179657 ) ) ( not ( = ?auto_179654 ?auto_179656 ) ) ( ON ?auto_179653 ?auto_179654 ) ( ON ?auto_179655 ?auto_179653 ) ( ON ?auto_179656 ?auto_179655 ) ( CLEAR ?auto_179656 ) ( ON ?auto_179657 ?auto_179659 ) ( CLEAR ?auto_179657 ) ( HAND-EMPTY ) ( not ( = ?auto_179651 ?auto_179659 ) ) ( not ( = ?auto_179652 ?auto_179659 ) ) ( not ( = ?auto_179658 ?auto_179659 ) ) ( not ( = ?auto_179654 ?auto_179659 ) ) ( not ( = ?auto_179653 ?auto_179659 ) ) ( not ( = ?auto_179657 ?auto_179659 ) ) ( not ( = ?auto_179656 ?auto_179659 ) ) ( not ( = ?auto_179655 ?auto_179659 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179657 ?auto_179659 )
      ( MAKE-2PILE ?auto_179651 ?auto_179652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179660 - BLOCK
      ?auto_179661 - BLOCK
    )
    :vars
    (
      ?auto_179667 - BLOCK
      ?auto_179663 - BLOCK
      ?auto_179664 - BLOCK
      ?auto_179668 - BLOCK
      ?auto_179665 - BLOCK
      ?auto_179662 - BLOCK
      ?auto_179666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179667 ?auto_179661 ) ( ON-TABLE ?auto_179660 ) ( ON ?auto_179661 ?auto_179660 ) ( not ( = ?auto_179660 ?auto_179661 ) ) ( not ( = ?auto_179660 ?auto_179667 ) ) ( not ( = ?auto_179661 ?auto_179667 ) ) ( not ( = ?auto_179660 ?auto_179663 ) ) ( not ( = ?auto_179660 ?auto_179664 ) ) ( not ( = ?auto_179661 ?auto_179663 ) ) ( not ( = ?auto_179661 ?auto_179664 ) ) ( not ( = ?auto_179667 ?auto_179663 ) ) ( not ( = ?auto_179667 ?auto_179664 ) ) ( not ( = ?auto_179663 ?auto_179664 ) ) ( ON ?auto_179663 ?auto_179667 ) ( not ( = ?auto_179668 ?auto_179665 ) ) ( not ( = ?auto_179668 ?auto_179662 ) ) ( not ( = ?auto_179668 ?auto_179664 ) ) ( not ( = ?auto_179665 ?auto_179662 ) ) ( not ( = ?auto_179665 ?auto_179664 ) ) ( not ( = ?auto_179662 ?auto_179664 ) ) ( not ( = ?auto_179660 ?auto_179662 ) ) ( not ( = ?auto_179660 ?auto_179668 ) ) ( not ( = ?auto_179660 ?auto_179665 ) ) ( not ( = ?auto_179661 ?auto_179662 ) ) ( not ( = ?auto_179661 ?auto_179668 ) ) ( not ( = ?auto_179661 ?auto_179665 ) ) ( not ( = ?auto_179667 ?auto_179662 ) ) ( not ( = ?auto_179667 ?auto_179668 ) ) ( not ( = ?auto_179667 ?auto_179665 ) ) ( not ( = ?auto_179663 ?auto_179662 ) ) ( not ( = ?auto_179663 ?auto_179668 ) ) ( not ( = ?auto_179663 ?auto_179665 ) ) ( ON ?auto_179664 ?auto_179663 ) ( ON ?auto_179662 ?auto_179664 ) ( ON ?auto_179668 ?auto_179666 ) ( CLEAR ?auto_179668 ) ( not ( = ?auto_179660 ?auto_179666 ) ) ( not ( = ?auto_179661 ?auto_179666 ) ) ( not ( = ?auto_179667 ?auto_179666 ) ) ( not ( = ?auto_179663 ?auto_179666 ) ) ( not ( = ?auto_179664 ?auto_179666 ) ) ( not ( = ?auto_179668 ?auto_179666 ) ) ( not ( = ?auto_179665 ?auto_179666 ) ) ( not ( = ?auto_179662 ?auto_179666 ) ) ( HOLDING ?auto_179665 ) ( CLEAR ?auto_179662 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179660 ?auto_179661 ?auto_179667 ?auto_179663 ?auto_179664 ?auto_179662 ?auto_179665 )
      ( MAKE-2PILE ?auto_179660 ?auto_179661 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179669 - BLOCK
      ?auto_179670 - BLOCK
    )
    :vars
    (
      ?auto_179675 - BLOCK
      ?auto_179671 - BLOCK
      ?auto_179672 - BLOCK
      ?auto_179677 - BLOCK
      ?auto_179673 - BLOCK
      ?auto_179676 - BLOCK
      ?auto_179674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179675 ?auto_179670 ) ( ON-TABLE ?auto_179669 ) ( ON ?auto_179670 ?auto_179669 ) ( not ( = ?auto_179669 ?auto_179670 ) ) ( not ( = ?auto_179669 ?auto_179675 ) ) ( not ( = ?auto_179670 ?auto_179675 ) ) ( not ( = ?auto_179669 ?auto_179671 ) ) ( not ( = ?auto_179669 ?auto_179672 ) ) ( not ( = ?auto_179670 ?auto_179671 ) ) ( not ( = ?auto_179670 ?auto_179672 ) ) ( not ( = ?auto_179675 ?auto_179671 ) ) ( not ( = ?auto_179675 ?auto_179672 ) ) ( not ( = ?auto_179671 ?auto_179672 ) ) ( ON ?auto_179671 ?auto_179675 ) ( not ( = ?auto_179677 ?auto_179673 ) ) ( not ( = ?auto_179677 ?auto_179676 ) ) ( not ( = ?auto_179677 ?auto_179672 ) ) ( not ( = ?auto_179673 ?auto_179676 ) ) ( not ( = ?auto_179673 ?auto_179672 ) ) ( not ( = ?auto_179676 ?auto_179672 ) ) ( not ( = ?auto_179669 ?auto_179676 ) ) ( not ( = ?auto_179669 ?auto_179677 ) ) ( not ( = ?auto_179669 ?auto_179673 ) ) ( not ( = ?auto_179670 ?auto_179676 ) ) ( not ( = ?auto_179670 ?auto_179677 ) ) ( not ( = ?auto_179670 ?auto_179673 ) ) ( not ( = ?auto_179675 ?auto_179676 ) ) ( not ( = ?auto_179675 ?auto_179677 ) ) ( not ( = ?auto_179675 ?auto_179673 ) ) ( not ( = ?auto_179671 ?auto_179676 ) ) ( not ( = ?auto_179671 ?auto_179677 ) ) ( not ( = ?auto_179671 ?auto_179673 ) ) ( ON ?auto_179672 ?auto_179671 ) ( ON ?auto_179676 ?auto_179672 ) ( ON ?auto_179677 ?auto_179674 ) ( not ( = ?auto_179669 ?auto_179674 ) ) ( not ( = ?auto_179670 ?auto_179674 ) ) ( not ( = ?auto_179675 ?auto_179674 ) ) ( not ( = ?auto_179671 ?auto_179674 ) ) ( not ( = ?auto_179672 ?auto_179674 ) ) ( not ( = ?auto_179677 ?auto_179674 ) ) ( not ( = ?auto_179673 ?auto_179674 ) ) ( not ( = ?auto_179676 ?auto_179674 ) ) ( CLEAR ?auto_179676 ) ( ON ?auto_179673 ?auto_179677 ) ( CLEAR ?auto_179673 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179674 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179674 ?auto_179677 )
      ( MAKE-2PILE ?auto_179669 ?auto_179670 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179678 - BLOCK
      ?auto_179679 - BLOCK
    )
    :vars
    (
      ?auto_179684 - BLOCK
      ?auto_179683 - BLOCK
      ?auto_179680 - BLOCK
      ?auto_179681 - BLOCK
      ?auto_179686 - BLOCK
      ?auto_179682 - BLOCK
      ?auto_179685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179684 ?auto_179679 ) ( ON-TABLE ?auto_179678 ) ( ON ?auto_179679 ?auto_179678 ) ( not ( = ?auto_179678 ?auto_179679 ) ) ( not ( = ?auto_179678 ?auto_179684 ) ) ( not ( = ?auto_179679 ?auto_179684 ) ) ( not ( = ?auto_179678 ?auto_179683 ) ) ( not ( = ?auto_179678 ?auto_179680 ) ) ( not ( = ?auto_179679 ?auto_179683 ) ) ( not ( = ?auto_179679 ?auto_179680 ) ) ( not ( = ?auto_179684 ?auto_179683 ) ) ( not ( = ?auto_179684 ?auto_179680 ) ) ( not ( = ?auto_179683 ?auto_179680 ) ) ( ON ?auto_179683 ?auto_179684 ) ( not ( = ?auto_179681 ?auto_179686 ) ) ( not ( = ?auto_179681 ?auto_179682 ) ) ( not ( = ?auto_179681 ?auto_179680 ) ) ( not ( = ?auto_179686 ?auto_179682 ) ) ( not ( = ?auto_179686 ?auto_179680 ) ) ( not ( = ?auto_179682 ?auto_179680 ) ) ( not ( = ?auto_179678 ?auto_179682 ) ) ( not ( = ?auto_179678 ?auto_179681 ) ) ( not ( = ?auto_179678 ?auto_179686 ) ) ( not ( = ?auto_179679 ?auto_179682 ) ) ( not ( = ?auto_179679 ?auto_179681 ) ) ( not ( = ?auto_179679 ?auto_179686 ) ) ( not ( = ?auto_179684 ?auto_179682 ) ) ( not ( = ?auto_179684 ?auto_179681 ) ) ( not ( = ?auto_179684 ?auto_179686 ) ) ( not ( = ?auto_179683 ?auto_179682 ) ) ( not ( = ?auto_179683 ?auto_179681 ) ) ( not ( = ?auto_179683 ?auto_179686 ) ) ( ON ?auto_179680 ?auto_179683 ) ( ON ?auto_179681 ?auto_179685 ) ( not ( = ?auto_179678 ?auto_179685 ) ) ( not ( = ?auto_179679 ?auto_179685 ) ) ( not ( = ?auto_179684 ?auto_179685 ) ) ( not ( = ?auto_179683 ?auto_179685 ) ) ( not ( = ?auto_179680 ?auto_179685 ) ) ( not ( = ?auto_179681 ?auto_179685 ) ) ( not ( = ?auto_179686 ?auto_179685 ) ) ( not ( = ?auto_179682 ?auto_179685 ) ) ( ON ?auto_179686 ?auto_179681 ) ( CLEAR ?auto_179686 ) ( ON-TABLE ?auto_179685 ) ( HOLDING ?auto_179682 ) ( CLEAR ?auto_179680 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179678 ?auto_179679 ?auto_179684 ?auto_179683 ?auto_179680 ?auto_179682 )
      ( MAKE-2PILE ?auto_179678 ?auto_179679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_179687 - BLOCK
      ?auto_179688 - BLOCK
    )
    :vars
    (
      ?auto_179689 - BLOCK
      ?auto_179693 - BLOCK
      ?auto_179690 - BLOCK
      ?auto_179694 - BLOCK
      ?auto_179691 - BLOCK
      ?auto_179695 - BLOCK
      ?auto_179692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179689 ?auto_179688 ) ( ON-TABLE ?auto_179687 ) ( ON ?auto_179688 ?auto_179687 ) ( not ( = ?auto_179687 ?auto_179688 ) ) ( not ( = ?auto_179687 ?auto_179689 ) ) ( not ( = ?auto_179688 ?auto_179689 ) ) ( not ( = ?auto_179687 ?auto_179693 ) ) ( not ( = ?auto_179687 ?auto_179690 ) ) ( not ( = ?auto_179688 ?auto_179693 ) ) ( not ( = ?auto_179688 ?auto_179690 ) ) ( not ( = ?auto_179689 ?auto_179693 ) ) ( not ( = ?auto_179689 ?auto_179690 ) ) ( not ( = ?auto_179693 ?auto_179690 ) ) ( ON ?auto_179693 ?auto_179689 ) ( not ( = ?auto_179694 ?auto_179691 ) ) ( not ( = ?auto_179694 ?auto_179695 ) ) ( not ( = ?auto_179694 ?auto_179690 ) ) ( not ( = ?auto_179691 ?auto_179695 ) ) ( not ( = ?auto_179691 ?auto_179690 ) ) ( not ( = ?auto_179695 ?auto_179690 ) ) ( not ( = ?auto_179687 ?auto_179695 ) ) ( not ( = ?auto_179687 ?auto_179694 ) ) ( not ( = ?auto_179687 ?auto_179691 ) ) ( not ( = ?auto_179688 ?auto_179695 ) ) ( not ( = ?auto_179688 ?auto_179694 ) ) ( not ( = ?auto_179688 ?auto_179691 ) ) ( not ( = ?auto_179689 ?auto_179695 ) ) ( not ( = ?auto_179689 ?auto_179694 ) ) ( not ( = ?auto_179689 ?auto_179691 ) ) ( not ( = ?auto_179693 ?auto_179695 ) ) ( not ( = ?auto_179693 ?auto_179694 ) ) ( not ( = ?auto_179693 ?auto_179691 ) ) ( ON ?auto_179690 ?auto_179693 ) ( ON ?auto_179694 ?auto_179692 ) ( not ( = ?auto_179687 ?auto_179692 ) ) ( not ( = ?auto_179688 ?auto_179692 ) ) ( not ( = ?auto_179689 ?auto_179692 ) ) ( not ( = ?auto_179693 ?auto_179692 ) ) ( not ( = ?auto_179690 ?auto_179692 ) ) ( not ( = ?auto_179694 ?auto_179692 ) ) ( not ( = ?auto_179691 ?auto_179692 ) ) ( not ( = ?auto_179695 ?auto_179692 ) ) ( ON ?auto_179691 ?auto_179694 ) ( ON-TABLE ?auto_179692 ) ( CLEAR ?auto_179690 ) ( ON ?auto_179695 ?auto_179691 ) ( CLEAR ?auto_179695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179692 ?auto_179694 ?auto_179691 )
      ( MAKE-2PILE ?auto_179687 ?auto_179688 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179745 - BLOCK
      ?auto_179746 - BLOCK
      ?auto_179747 - BLOCK
      ?auto_179748 - BLOCK
      ?auto_179749 - BLOCK
      ?auto_179750 - BLOCK
    )
    :vars
    (
      ?auto_179751 - BLOCK
      ?auto_179752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179745 ) ( ON ?auto_179746 ?auto_179745 ) ( ON ?auto_179747 ?auto_179746 ) ( ON ?auto_179748 ?auto_179747 ) ( not ( = ?auto_179745 ?auto_179746 ) ) ( not ( = ?auto_179745 ?auto_179747 ) ) ( not ( = ?auto_179745 ?auto_179748 ) ) ( not ( = ?auto_179745 ?auto_179749 ) ) ( not ( = ?auto_179745 ?auto_179750 ) ) ( not ( = ?auto_179746 ?auto_179747 ) ) ( not ( = ?auto_179746 ?auto_179748 ) ) ( not ( = ?auto_179746 ?auto_179749 ) ) ( not ( = ?auto_179746 ?auto_179750 ) ) ( not ( = ?auto_179747 ?auto_179748 ) ) ( not ( = ?auto_179747 ?auto_179749 ) ) ( not ( = ?auto_179747 ?auto_179750 ) ) ( not ( = ?auto_179748 ?auto_179749 ) ) ( not ( = ?auto_179748 ?auto_179750 ) ) ( not ( = ?auto_179749 ?auto_179750 ) ) ( ON ?auto_179750 ?auto_179751 ) ( not ( = ?auto_179745 ?auto_179751 ) ) ( not ( = ?auto_179746 ?auto_179751 ) ) ( not ( = ?auto_179747 ?auto_179751 ) ) ( not ( = ?auto_179748 ?auto_179751 ) ) ( not ( = ?auto_179749 ?auto_179751 ) ) ( not ( = ?auto_179750 ?auto_179751 ) ) ( CLEAR ?auto_179748 ) ( ON ?auto_179749 ?auto_179750 ) ( CLEAR ?auto_179749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179752 ) ( ON ?auto_179751 ?auto_179752 ) ( not ( = ?auto_179752 ?auto_179751 ) ) ( not ( = ?auto_179752 ?auto_179750 ) ) ( not ( = ?auto_179752 ?auto_179749 ) ) ( not ( = ?auto_179745 ?auto_179752 ) ) ( not ( = ?auto_179746 ?auto_179752 ) ) ( not ( = ?auto_179747 ?auto_179752 ) ) ( not ( = ?auto_179748 ?auto_179752 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179752 ?auto_179751 ?auto_179750 )
      ( MAKE-6PILE ?auto_179745 ?auto_179746 ?auto_179747 ?auto_179748 ?auto_179749 ?auto_179750 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179753 - BLOCK
      ?auto_179754 - BLOCK
      ?auto_179755 - BLOCK
      ?auto_179756 - BLOCK
      ?auto_179757 - BLOCK
      ?auto_179758 - BLOCK
    )
    :vars
    (
      ?auto_179759 - BLOCK
      ?auto_179760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179753 ) ( ON ?auto_179754 ?auto_179753 ) ( ON ?auto_179755 ?auto_179754 ) ( not ( = ?auto_179753 ?auto_179754 ) ) ( not ( = ?auto_179753 ?auto_179755 ) ) ( not ( = ?auto_179753 ?auto_179756 ) ) ( not ( = ?auto_179753 ?auto_179757 ) ) ( not ( = ?auto_179753 ?auto_179758 ) ) ( not ( = ?auto_179754 ?auto_179755 ) ) ( not ( = ?auto_179754 ?auto_179756 ) ) ( not ( = ?auto_179754 ?auto_179757 ) ) ( not ( = ?auto_179754 ?auto_179758 ) ) ( not ( = ?auto_179755 ?auto_179756 ) ) ( not ( = ?auto_179755 ?auto_179757 ) ) ( not ( = ?auto_179755 ?auto_179758 ) ) ( not ( = ?auto_179756 ?auto_179757 ) ) ( not ( = ?auto_179756 ?auto_179758 ) ) ( not ( = ?auto_179757 ?auto_179758 ) ) ( ON ?auto_179758 ?auto_179759 ) ( not ( = ?auto_179753 ?auto_179759 ) ) ( not ( = ?auto_179754 ?auto_179759 ) ) ( not ( = ?auto_179755 ?auto_179759 ) ) ( not ( = ?auto_179756 ?auto_179759 ) ) ( not ( = ?auto_179757 ?auto_179759 ) ) ( not ( = ?auto_179758 ?auto_179759 ) ) ( ON ?auto_179757 ?auto_179758 ) ( CLEAR ?auto_179757 ) ( ON-TABLE ?auto_179760 ) ( ON ?auto_179759 ?auto_179760 ) ( not ( = ?auto_179760 ?auto_179759 ) ) ( not ( = ?auto_179760 ?auto_179758 ) ) ( not ( = ?auto_179760 ?auto_179757 ) ) ( not ( = ?auto_179753 ?auto_179760 ) ) ( not ( = ?auto_179754 ?auto_179760 ) ) ( not ( = ?auto_179755 ?auto_179760 ) ) ( not ( = ?auto_179756 ?auto_179760 ) ) ( HOLDING ?auto_179756 ) ( CLEAR ?auto_179755 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179753 ?auto_179754 ?auto_179755 ?auto_179756 )
      ( MAKE-6PILE ?auto_179753 ?auto_179754 ?auto_179755 ?auto_179756 ?auto_179757 ?auto_179758 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179761 - BLOCK
      ?auto_179762 - BLOCK
      ?auto_179763 - BLOCK
      ?auto_179764 - BLOCK
      ?auto_179765 - BLOCK
      ?auto_179766 - BLOCK
    )
    :vars
    (
      ?auto_179767 - BLOCK
      ?auto_179768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179761 ) ( ON ?auto_179762 ?auto_179761 ) ( ON ?auto_179763 ?auto_179762 ) ( not ( = ?auto_179761 ?auto_179762 ) ) ( not ( = ?auto_179761 ?auto_179763 ) ) ( not ( = ?auto_179761 ?auto_179764 ) ) ( not ( = ?auto_179761 ?auto_179765 ) ) ( not ( = ?auto_179761 ?auto_179766 ) ) ( not ( = ?auto_179762 ?auto_179763 ) ) ( not ( = ?auto_179762 ?auto_179764 ) ) ( not ( = ?auto_179762 ?auto_179765 ) ) ( not ( = ?auto_179762 ?auto_179766 ) ) ( not ( = ?auto_179763 ?auto_179764 ) ) ( not ( = ?auto_179763 ?auto_179765 ) ) ( not ( = ?auto_179763 ?auto_179766 ) ) ( not ( = ?auto_179764 ?auto_179765 ) ) ( not ( = ?auto_179764 ?auto_179766 ) ) ( not ( = ?auto_179765 ?auto_179766 ) ) ( ON ?auto_179766 ?auto_179767 ) ( not ( = ?auto_179761 ?auto_179767 ) ) ( not ( = ?auto_179762 ?auto_179767 ) ) ( not ( = ?auto_179763 ?auto_179767 ) ) ( not ( = ?auto_179764 ?auto_179767 ) ) ( not ( = ?auto_179765 ?auto_179767 ) ) ( not ( = ?auto_179766 ?auto_179767 ) ) ( ON ?auto_179765 ?auto_179766 ) ( ON-TABLE ?auto_179768 ) ( ON ?auto_179767 ?auto_179768 ) ( not ( = ?auto_179768 ?auto_179767 ) ) ( not ( = ?auto_179768 ?auto_179766 ) ) ( not ( = ?auto_179768 ?auto_179765 ) ) ( not ( = ?auto_179761 ?auto_179768 ) ) ( not ( = ?auto_179762 ?auto_179768 ) ) ( not ( = ?auto_179763 ?auto_179768 ) ) ( not ( = ?auto_179764 ?auto_179768 ) ) ( CLEAR ?auto_179763 ) ( ON ?auto_179764 ?auto_179765 ) ( CLEAR ?auto_179764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179768 ?auto_179767 ?auto_179766 ?auto_179765 )
      ( MAKE-6PILE ?auto_179761 ?auto_179762 ?auto_179763 ?auto_179764 ?auto_179765 ?auto_179766 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179769 - BLOCK
      ?auto_179770 - BLOCK
      ?auto_179771 - BLOCK
      ?auto_179772 - BLOCK
      ?auto_179773 - BLOCK
      ?auto_179774 - BLOCK
    )
    :vars
    (
      ?auto_179776 - BLOCK
      ?auto_179775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179769 ) ( ON ?auto_179770 ?auto_179769 ) ( not ( = ?auto_179769 ?auto_179770 ) ) ( not ( = ?auto_179769 ?auto_179771 ) ) ( not ( = ?auto_179769 ?auto_179772 ) ) ( not ( = ?auto_179769 ?auto_179773 ) ) ( not ( = ?auto_179769 ?auto_179774 ) ) ( not ( = ?auto_179770 ?auto_179771 ) ) ( not ( = ?auto_179770 ?auto_179772 ) ) ( not ( = ?auto_179770 ?auto_179773 ) ) ( not ( = ?auto_179770 ?auto_179774 ) ) ( not ( = ?auto_179771 ?auto_179772 ) ) ( not ( = ?auto_179771 ?auto_179773 ) ) ( not ( = ?auto_179771 ?auto_179774 ) ) ( not ( = ?auto_179772 ?auto_179773 ) ) ( not ( = ?auto_179772 ?auto_179774 ) ) ( not ( = ?auto_179773 ?auto_179774 ) ) ( ON ?auto_179774 ?auto_179776 ) ( not ( = ?auto_179769 ?auto_179776 ) ) ( not ( = ?auto_179770 ?auto_179776 ) ) ( not ( = ?auto_179771 ?auto_179776 ) ) ( not ( = ?auto_179772 ?auto_179776 ) ) ( not ( = ?auto_179773 ?auto_179776 ) ) ( not ( = ?auto_179774 ?auto_179776 ) ) ( ON ?auto_179773 ?auto_179774 ) ( ON-TABLE ?auto_179775 ) ( ON ?auto_179776 ?auto_179775 ) ( not ( = ?auto_179775 ?auto_179776 ) ) ( not ( = ?auto_179775 ?auto_179774 ) ) ( not ( = ?auto_179775 ?auto_179773 ) ) ( not ( = ?auto_179769 ?auto_179775 ) ) ( not ( = ?auto_179770 ?auto_179775 ) ) ( not ( = ?auto_179771 ?auto_179775 ) ) ( not ( = ?auto_179772 ?auto_179775 ) ) ( ON ?auto_179772 ?auto_179773 ) ( CLEAR ?auto_179772 ) ( HOLDING ?auto_179771 ) ( CLEAR ?auto_179770 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179769 ?auto_179770 ?auto_179771 )
      ( MAKE-6PILE ?auto_179769 ?auto_179770 ?auto_179771 ?auto_179772 ?auto_179773 ?auto_179774 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179777 - BLOCK
      ?auto_179778 - BLOCK
      ?auto_179779 - BLOCK
      ?auto_179780 - BLOCK
      ?auto_179781 - BLOCK
      ?auto_179782 - BLOCK
    )
    :vars
    (
      ?auto_179784 - BLOCK
      ?auto_179783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179777 ) ( ON ?auto_179778 ?auto_179777 ) ( not ( = ?auto_179777 ?auto_179778 ) ) ( not ( = ?auto_179777 ?auto_179779 ) ) ( not ( = ?auto_179777 ?auto_179780 ) ) ( not ( = ?auto_179777 ?auto_179781 ) ) ( not ( = ?auto_179777 ?auto_179782 ) ) ( not ( = ?auto_179778 ?auto_179779 ) ) ( not ( = ?auto_179778 ?auto_179780 ) ) ( not ( = ?auto_179778 ?auto_179781 ) ) ( not ( = ?auto_179778 ?auto_179782 ) ) ( not ( = ?auto_179779 ?auto_179780 ) ) ( not ( = ?auto_179779 ?auto_179781 ) ) ( not ( = ?auto_179779 ?auto_179782 ) ) ( not ( = ?auto_179780 ?auto_179781 ) ) ( not ( = ?auto_179780 ?auto_179782 ) ) ( not ( = ?auto_179781 ?auto_179782 ) ) ( ON ?auto_179782 ?auto_179784 ) ( not ( = ?auto_179777 ?auto_179784 ) ) ( not ( = ?auto_179778 ?auto_179784 ) ) ( not ( = ?auto_179779 ?auto_179784 ) ) ( not ( = ?auto_179780 ?auto_179784 ) ) ( not ( = ?auto_179781 ?auto_179784 ) ) ( not ( = ?auto_179782 ?auto_179784 ) ) ( ON ?auto_179781 ?auto_179782 ) ( ON-TABLE ?auto_179783 ) ( ON ?auto_179784 ?auto_179783 ) ( not ( = ?auto_179783 ?auto_179784 ) ) ( not ( = ?auto_179783 ?auto_179782 ) ) ( not ( = ?auto_179783 ?auto_179781 ) ) ( not ( = ?auto_179777 ?auto_179783 ) ) ( not ( = ?auto_179778 ?auto_179783 ) ) ( not ( = ?auto_179779 ?auto_179783 ) ) ( not ( = ?auto_179780 ?auto_179783 ) ) ( ON ?auto_179780 ?auto_179781 ) ( CLEAR ?auto_179778 ) ( ON ?auto_179779 ?auto_179780 ) ( CLEAR ?auto_179779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179783 ?auto_179784 ?auto_179782 ?auto_179781 ?auto_179780 )
      ( MAKE-6PILE ?auto_179777 ?auto_179778 ?auto_179779 ?auto_179780 ?auto_179781 ?auto_179782 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179785 - BLOCK
      ?auto_179786 - BLOCK
      ?auto_179787 - BLOCK
      ?auto_179788 - BLOCK
      ?auto_179789 - BLOCK
      ?auto_179790 - BLOCK
    )
    :vars
    (
      ?auto_179791 - BLOCK
      ?auto_179792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179785 ) ( not ( = ?auto_179785 ?auto_179786 ) ) ( not ( = ?auto_179785 ?auto_179787 ) ) ( not ( = ?auto_179785 ?auto_179788 ) ) ( not ( = ?auto_179785 ?auto_179789 ) ) ( not ( = ?auto_179785 ?auto_179790 ) ) ( not ( = ?auto_179786 ?auto_179787 ) ) ( not ( = ?auto_179786 ?auto_179788 ) ) ( not ( = ?auto_179786 ?auto_179789 ) ) ( not ( = ?auto_179786 ?auto_179790 ) ) ( not ( = ?auto_179787 ?auto_179788 ) ) ( not ( = ?auto_179787 ?auto_179789 ) ) ( not ( = ?auto_179787 ?auto_179790 ) ) ( not ( = ?auto_179788 ?auto_179789 ) ) ( not ( = ?auto_179788 ?auto_179790 ) ) ( not ( = ?auto_179789 ?auto_179790 ) ) ( ON ?auto_179790 ?auto_179791 ) ( not ( = ?auto_179785 ?auto_179791 ) ) ( not ( = ?auto_179786 ?auto_179791 ) ) ( not ( = ?auto_179787 ?auto_179791 ) ) ( not ( = ?auto_179788 ?auto_179791 ) ) ( not ( = ?auto_179789 ?auto_179791 ) ) ( not ( = ?auto_179790 ?auto_179791 ) ) ( ON ?auto_179789 ?auto_179790 ) ( ON-TABLE ?auto_179792 ) ( ON ?auto_179791 ?auto_179792 ) ( not ( = ?auto_179792 ?auto_179791 ) ) ( not ( = ?auto_179792 ?auto_179790 ) ) ( not ( = ?auto_179792 ?auto_179789 ) ) ( not ( = ?auto_179785 ?auto_179792 ) ) ( not ( = ?auto_179786 ?auto_179792 ) ) ( not ( = ?auto_179787 ?auto_179792 ) ) ( not ( = ?auto_179788 ?auto_179792 ) ) ( ON ?auto_179788 ?auto_179789 ) ( ON ?auto_179787 ?auto_179788 ) ( CLEAR ?auto_179787 ) ( HOLDING ?auto_179786 ) ( CLEAR ?auto_179785 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179785 ?auto_179786 )
      ( MAKE-6PILE ?auto_179785 ?auto_179786 ?auto_179787 ?auto_179788 ?auto_179789 ?auto_179790 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179793 - BLOCK
      ?auto_179794 - BLOCK
      ?auto_179795 - BLOCK
      ?auto_179796 - BLOCK
      ?auto_179797 - BLOCK
      ?auto_179798 - BLOCK
    )
    :vars
    (
      ?auto_179799 - BLOCK
      ?auto_179800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179793 ) ( not ( = ?auto_179793 ?auto_179794 ) ) ( not ( = ?auto_179793 ?auto_179795 ) ) ( not ( = ?auto_179793 ?auto_179796 ) ) ( not ( = ?auto_179793 ?auto_179797 ) ) ( not ( = ?auto_179793 ?auto_179798 ) ) ( not ( = ?auto_179794 ?auto_179795 ) ) ( not ( = ?auto_179794 ?auto_179796 ) ) ( not ( = ?auto_179794 ?auto_179797 ) ) ( not ( = ?auto_179794 ?auto_179798 ) ) ( not ( = ?auto_179795 ?auto_179796 ) ) ( not ( = ?auto_179795 ?auto_179797 ) ) ( not ( = ?auto_179795 ?auto_179798 ) ) ( not ( = ?auto_179796 ?auto_179797 ) ) ( not ( = ?auto_179796 ?auto_179798 ) ) ( not ( = ?auto_179797 ?auto_179798 ) ) ( ON ?auto_179798 ?auto_179799 ) ( not ( = ?auto_179793 ?auto_179799 ) ) ( not ( = ?auto_179794 ?auto_179799 ) ) ( not ( = ?auto_179795 ?auto_179799 ) ) ( not ( = ?auto_179796 ?auto_179799 ) ) ( not ( = ?auto_179797 ?auto_179799 ) ) ( not ( = ?auto_179798 ?auto_179799 ) ) ( ON ?auto_179797 ?auto_179798 ) ( ON-TABLE ?auto_179800 ) ( ON ?auto_179799 ?auto_179800 ) ( not ( = ?auto_179800 ?auto_179799 ) ) ( not ( = ?auto_179800 ?auto_179798 ) ) ( not ( = ?auto_179800 ?auto_179797 ) ) ( not ( = ?auto_179793 ?auto_179800 ) ) ( not ( = ?auto_179794 ?auto_179800 ) ) ( not ( = ?auto_179795 ?auto_179800 ) ) ( not ( = ?auto_179796 ?auto_179800 ) ) ( ON ?auto_179796 ?auto_179797 ) ( ON ?auto_179795 ?auto_179796 ) ( CLEAR ?auto_179793 ) ( ON ?auto_179794 ?auto_179795 ) ( CLEAR ?auto_179794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179800 ?auto_179799 ?auto_179798 ?auto_179797 ?auto_179796 ?auto_179795 )
      ( MAKE-6PILE ?auto_179793 ?auto_179794 ?auto_179795 ?auto_179796 ?auto_179797 ?auto_179798 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179801 - BLOCK
      ?auto_179802 - BLOCK
      ?auto_179803 - BLOCK
      ?auto_179804 - BLOCK
      ?auto_179805 - BLOCK
      ?auto_179806 - BLOCK
    )
    :vars
    (
      ?auto_179808 - BLOCK
      ?auto_179807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179801 ?auto_179802 ) ) ( not ( = ?auto_179801 ?auto_179803 ) ) ( not ( = ?auto_179801 ?auto_179804 ) ) ( not ( = ?auto_179801 ?auto_179805 ) ) ( not ( = ?auto_179801 ?auto_179806 ) ) ( not ( = ?auto_179802 ?auto_179803 ) ) ( not ( = ?auto_179802 ?auto_179804 ) ) ( not ( = ?auto_179802 ?auto_179805 ) ) ( not ( = ?auto_179802 ?auto_179806 ) ) ( not ( = ?auto_179803 ?auto_179804 ) ) ( not ( = ?auto_179803 ?auto_179805 ) ) ( not ( = ?auto_179803 ?auto_179806 ) ) ( not ( = ?auto_179804 ?auto_179805 ) ) ( not ( = ?auto_179804 ?auto_179806 ) ) ( not ( = ?auto_179805 ?auto_179806 ) ) ( ON ?auto_179806 ?auto_179808 ) ( not ( = ?auto_179801 ?auto_179808 ) ) ( not ( = ?auto_179802 ?auto_179808 ) ) ( not ( = ?auto_179803 ?auto_179808 ) ) ( not ( = ?auto_179804 ?auto_179808 ) ) ( not ( = ?auto_179805 ?auto_179808 ) ) ( not ( = ?auto_179806 ?auto_179808 ) ) ( ON ?auto_179805 ?auto_179806 ) ( ON-TABLE ?auto_179807 ) ( ON ?auto_179808 ?auto_179807 ) ( not ( = ?auto_179807 ?auto_179808 ) ) ( not ( = ?auto_179807 ?auto_179806 ) ) ( not ( = ?auto_179807 ?auto_179805 ) ) ( not ( = ?auto_179801 ?auto_179807 ) ) ( not ( = ?auto_179802 ?auto_179807 ) ) ( not ( = ?auto_179803 ?auto_179807 ) ) ( not ( = ?auto_179804 ?auto_179807 ) ) ( ON ?auto_179804 ?auto_179805 ) ( ON ?auto_179803 ?auto_179804 ) ( ON ?auto_179802 ?auto_179803 ) ( CLEAR ?auto_179802 ) ( HOLDING ?auto_179801 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179801 )
      ( MAKE-6PILE ?auto_179801 ?auto_179802 ?auto_179803 ?auto_179804 ?auto_179805 ?auto_179806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179809 - BLOCK
      ?auto_179810 - BLOCK
      ?auto_179811 - BLOCK
      ?auto_179812 - BLOCK
      ?auto_179813 - BLOCK
      ?auto_179814 - BLOCK
    )
    :vars
    (
      ?auto_179816 - BLOCK
      ?auto_179815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179809 ?auto_179810 ) ) ( not ( = ?auto_179809 ?auto_179811 ) ) ( not ( = ?auto_179809 ?auto_179812 ) ) ( not ( = ?auto_179809 ?auto_179813 ) ) ( not ( = ?auto_179809 ?auto_179814 ) ) ( not ( = ?auto_179810 ?auto_179811 ) ) ( not ( = ?auto_179810 ?auto_179812 ) ) ( not ( = ?auto_179810 ?auto_179813 ) ) ( not ( = ?auto_179810 ?auto_179814 ) ) ( not ( = ?auto_179811 ?auto_179812 ) ) ( not ( = ?auto_179811 ?auto_179813 ) ) ( not ( = ?auto_179811 ?auto_179814 ) ) ( not ( = ?auto_179812 ?auto_179813 ) ) ( not ( = ?auto_179812 ?auto_179814 ) ) ( not ( = ?auto_179813 ?auto_179814 ) ) ( ON ?auto_179814 ?auto_179816 ) ( not ( = ?auto_179809 ?auto_179816 ) ) ( not ( = ?auto_179810 ?auto_179816 ) ) ( not ( = ?auto_179811 ?auto_179816 ) ) ( not ( = ?auto_179812 ?auto_179816 ) ) ( not ( = ?auto_179813 ?auto_179816 ) ) ( not ( = ?auto_179814 ?auto_179816 ) ) ( ON ?auto_179813 ?auto_179814 ) ( ON-TABLE ?auto_179815 ) ( ON ?auto_179816 ?auto_179815 ) ( not ( = ?auto_179815 ?auto_179816 ) ) ( not ( = ?auto_179815 ?auto_179814 ) ) ( not ( = ?auto_179815 ?auto_179813 ) ) ( not ( = ?auto_179809 ?auto_179815 ) ) ( not ( = ?auto_179810 ?auto_179815 ) ) ( not ( = ?auto_179811 ?auto_179815 ) ) ( not ( = ?auto_179812 ?auto_179815 ) ) ( ON ?auto_179812 ?auto_179813 ) ( ON ?auto_179811 ?auto_179812 ) ( ON ?auto_179810 ?auto_179811 ) ( ON ?auto_179809 ?auto_179810 ) ( CLEAR ?auto_179809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179815 ?auto_179816 ?auto_179814 ?auto_179813 ?auto_179812 ?auto_179811 ?auto_179810 )
      ( MAKE-6PILE ?auto_179809 ?auto_179810 ?auto_179811 ?auto_179812 ?auto_179813 ?auto_179814 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179823 - BLOCK
      ?auto_179824 - BLOCK
      ?auto_179825 - BLOCK
      ?auto_179826 - BLOCK
      ?auto_179827 - BLOCK
      ?auto_179828 - BLOCK
    )
    :vars
    (
      ?auto_179830 - BLOCK
      ?auto_179829 - BLOCK
      ?auto_179831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179823 ?auto_179824 ) ) ( not ( = ?auto_179823 ?auto_179825 ) ) ( not ( = ?auto_179823 ?auto_179826 ) ) ( not ( = ?auto_179823 ?auto_179827 ) ) ( not ( = ?auto_179823 ?auto_179828 ) ) ( not ( = ?auto_179824 ?auto_179825 ) ) ( not ( = ?auto_179824 ?auto_179826 ) ) ( not ( = ?auto_179824 ?auto_179827 ) ) ( not ( = ?auto_179824 ?auto_179828 ) ) ( not ( = ?auto_179825 ?auto_179826 ) ) ( not ( = ?auto_179825 ?auto_179827 ) ) ( not ( = ?auto_179825 ?auto_179828 ) ) ( not ( = ?auto_179826 ?auto_179827 ) ) ( not ( = ?auto_179826 ?auto_179828 ) ) ( not ( = ?auto_179827 ?auto_179828 ) ) ( ON ?auto_179828 ?auto_179830 ) ( not ( = ?auto_179823 ?auto_179830 ) ) ( not ( = ?auto_179824 ?auto_179830 ) ) ( not ( = ?auto_179825 ?auto_179830 ) ) ( not ( = ?auto_179826 ?auto_179830 ) ) ( not ( = ?auto_179827 ?auto_179830 ) ) ( not ( = ?auto_179828 ?auto_179830 ) ) ( ON ?auto_179827 ?auto_179828 ) ( ON-TABLE ?auto_179829 ) ( ON ?auto_179830 ?auto_179829 ) ( not ( = ?auto_179829 ?auto_179830 ) ) ( not ( = ?auto_179829 ?auto_179828 ) ) ( not ( = ?auto_179829 ?auto_179827 ) ) ( not ( = ?auto_179823 ?auto_179829 ) ) ( not ( = ?auto_179824 ?auto_179829 ) ) ( not ( = ?auto_179825 ?auto_179829 ) ) ( not ( = ?auto_179826 ?auto_179829 ) ) ( ON ?auto_179826 ?auto_179827 ) ( ON ?auto_179825 ?auto_179826 ) ( ON ?auto_179824 ?auto_179825 ) ( CLEAR ?auto_179824 ) ( ON ?auto_179823 ?auto_179831 ) ( CLEAR ?auto_179823 ) ( HAND-EMPTY ) ( not ( = ?auto_179823 ?auto_179831 ) ) ( not ( = ?auto_179824 ?auto_179831 ) ) ( not ( = ?auto_179825 ?auto_179831 ) ) ( not ( = ?auto_179826 ?auto_179831 ) ) ( not ( = ?auto_179827 ?auto_179831 ) ) ( not ( = ?auto_179828 ?auto_179831 ) ) ( not ( = ?auto_179830 ?auto_179831 ) ) ( not ( = ?auto_179829 ?auto_179831 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179823 ?auto_179831 )
      ( MAKE-6PILE ?auto_179823 ?auto_179824 ?auto_179825 ?auto_179826 ?auto_179827 ?auto_179828 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179832 - BLOCK
      ?auto_179833 - BLOCK
      ?auto_179834 - BLOCK
      ?auto_179835 - BLOCK
      ?auto_179836 - BLOCK
      ?auto_179837 - BLOCK
    )
    :vars
    (
      ?auto_179839 - BLOCK
      ?auto_179838 - BLOCK
      ?auto_179840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179832 ?auto_179833 ) ) ( not ( = ?auto_179832 ?auto_179834 ) ) ( not ( = ?auto_179832 ?auto_179835 ) ) ( not ( = ?auto_179832 ?auto_179836 ) ) ( not ( = ?auto_179832 ?auto_179837 ) ) ( not ( = ?auto_179833 ?auto_179834 ) ) ( not ( = ?auto_179833 ?auto_179835 ) ) ( not ( = ?auto_179833 ?auto_179836 ) ) ( not ( = ?auto_179833 ?auto_179837 ) ) ( not ( = ?auto_179834 ?auto_179835 ) ) ( not ( = ?auto_179834 ?auto_179836 ) ) ( not ( = ?auto_179834 ?auto_179837 ) ) ( not ( = ?auto_179835 ?auto_179836 ) ) ( not ( = ?auto_179835 ?auto_179837 ) ) ( not ( = ?auto_179836 ?auto_179837 ) ) ( ON ?auto_179837 ?auto_179839 ) ( not ( = ?auto_179832 ?auto_179839 ) ) ( not ( = ?auto_179833 ?auto_179839 ) ) ( not ( = ?auto_179834 ?auto_179839 ) ) ( not ( = ?auto_179835 ?auto_179839 ) ) ( not ( = ?auto_179836 ?auto_179839 ) ) ( not ( = ?auto_179837 ?auto_179839 ) ) ( ON ?auto_179836 ?auto_179837 ) ( ON-TABLE ?auto_179838 ) ( ON ?auto_179839 ?auto_179838 ) ( not ( = ?auto_179838 ?auto_179839 ) ) ( not ( = ?auto_179838 ?auto_179837 ) ) ( not ( = ?auto_179838 ?auto_179836 ) ) ( not ( = ?auto_179832 ?auto_179838 ) ) ( not ( = ?auto_179833 ?auto_179838 ) ) ( not ( = ?auto_179834 ?auto_179838 ) ) ( not ( = ?auto_179835 ?auto_179838 ) ) ( ON ?auto_179835 ?auto_179836 ) ( ON ?auto_179834 ?auto_179835 ) ( ON ?auto_179832 ?auto_179840 ) ( CLEAR ?auto_179832 ) ( not ( = ?auto_179832 ?auto_179840 ) ) ( not ( = ?auto_179833 ?auto_179840 ) ) ( not ( = ?auto_179834 ?auto_179840 ) ) ( not ( = ?auto_179835 ?auto_179840 ) ) ( not ( = ?auto_179836 ?auto_179840 ) ) ( not ( = ?auto_179837 ?auto_179840 ) ) ( not ( = ?auto_179839 ?auto_179840 ) ) ( not ( = ?auto_179838 ?auto_179840 ) ) ( HOLDING ?auto_179833 ) ( CLEAR ?auto_179834 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179838 ?auto_179839 ?auto_179837 ?auto_179836 ?auto_179835 ?auto_179834 ?auto_179833 )
      ( MAKE-6PILE ?auto_179832 ?auto_179833 ?auto_179834 ?auto_179835 ?auto_179836 ?auto_179837 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179841 - BLOCK
      ?auto_179842 - BLOCK
      ?auto_179843 - BLOCK
      ?auto_179844 - BLOCK
      ?auto_179845 - BLOCK
      ?auto_179846 - BLOCK
    )
    :vars
    (
      ?auto_179848 - BLOCK
      ?auto_179849 - BLOCK
      ?auto_179847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179841 ?auto_179842 ) ) ( not ( = ?auto_179841 ?auto_179843 ) ) ( not ( = ?auto_179841 ?auto_179844 ) ) ( not ( = ?auto_179841 ?auto_179845 ) ) ( not ( = ?auto_179841 ?auto_179846 ) ) ( not ( = ?auto_179842 ?auto_179843 ) ) ( not ( = ?auto_179842 ?auto_179844 ) ) ( not ( = ?auto_179842 ?auto_179845 ) ) ( not ( = ?auto_179842 ?auto_179846 ) ) ( not ( = ?auto_179843 ?auto_179844 ) ) ( not ( = ?auto_179843 ?auto_179845 ) ) ( not ( = ?auto_179843 ?auto_179846 ) ) ( not ( = ?auto_179844 ?auto_179845 ) ) ( not ( = ?auto_179844 ?auto_179846 ) ) ( not ( = ?auto_179845 ?auto_179846 ) ) ( ON ?auto_179846 ?auto_179848 ) ( not ( = ?auto_179841 ?auto_179848 ) ) ( not ( = ?auto_179842 ?auto_179848 ) ) ( not ( = ?auto_179843 ?auto_179848 ) ) ( not ( = ?auto_179844 ?auto_179848 ) ) ( not ( = ?auto_179845 ?auto_179848 ) ) ( not ( = ?auto_179846 ?auto_179848 ) ) ( ON ?auto_179845 ?auto_179846 ) ( ON-TABLE ?auto_179849 ) ( ON ?auto_179848 ?auto_179849 ) ( not ( = ?auto_179849 ?auto_179848 ) ) ( not ( = ?auto_179849 ?auto_179846 ) ) ( not ( = ?auto_179849 ?auto_179845 ) ) ( not ( = ?auto_179841 ?auto_179849 ) ) ( not ( = ?auto_179842 ?auto_179849 ) ) ( not ( = ?auto_179843 ?auto_179849 ) ) ( not ( = ?auto_179844 ?auto_179849 ) ) ( ON ?auto_179844 ?auto_179845 ) ( ON ?auto_179843 ?auto_179844 ) ( ON ?auto_179841 ?auto_179847 ) ( not ( = ?auto_179841 ?auto_179847 ) ) ( not ( = ?auto_179842 ?auto_179847 ) ) ( not ( = ?auto_179843 ?auto_179847 ) ) ( not ( = ?auto_179844 ?auto_179847 ) ) ( not ( = ?auto_179845 ?auto_179847 ) ) ( not ( = ?auto_179846 ?auto_179847 ) ) ( not ( = ?auto_179848 ?auto_179847 ) ) ( not ( = ?auto_179849 ?auto_179847 ) ) ( CLEAR ?auto_179843 ) ( ON ?auto_179842 ?auto_179841 ) ( CLEAR ?auto_179842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179847 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179847 ?auto_179841 )
      ( MAKE-6PILE ?auto_179841 ?auto_179842 ?auto_179843 ?auto_179844 ?auto_179845 ?auto_179846 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179850 - BLOCK
      ?auto_179851 - BLOCK
      ?auto_179852 - BLOCK
      ?auto_179853 - BLOCK
      ?auto_179854 - BLOCK
      ?auto_179855 - BLOCK
    )
    :vars
    (
      ?auto_179858 - BLOCK
      ?auto_179856 - BLOCK
      ?auto_179857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179850 ?auto_179851 ) ) ( not ( = ?auto_179850 ?auto_179852 ) ) ( not ( = ?auto_179850 ?auto_179853 ) ) ( not ( = ?auto_179850 ?auto_179854 ) ) ( not ( = ?auto_179850 ?auto_179855 ) ) ( not ( = ?auto_179851 ?auto_179852 ) ) ( not ( = ?auto_179851 ?auto_179853 ) ) ( not ( = ?auto_179851 ?auto_179854 ) ) ( not ( = ?auto_179851 ?auto_179855 ) ) ( not ( = ?auto_179852 ?auto_179853 ) ) ( not ( = ?auto_179852 ?auto_179854 ) ) ( not ( = ?auto_179852 ?auto_179855 ) ) ( not ( = ?auto_179853 ?auto_179854 ) ) ( not ( = ?auto_179853 ?auto_179855 ) ) ( not ( = ?auto_179854 ?auto_179855 ) ) ( ON ?auto_179855 ?auto_179858 ) ( not ( = ?auto_179850 ?auto_179858 ) ) ( not ( = ?auto_179851 ?auto_179858 ) ) ( not ( = ?auto_179852 ?auto_179858 ) ) ( not ( = ?auto_179853 ?auto_179858 ) ) ( not ( = ?auto_179854 ?auto_179858 ) ) ( not ( = ?auto_179855 ?auto_179858 ) ) ( ON ?auto_179854 ?auto_179855 ) ( ON-TABLE ?auto_179856 ) ( ON ?auto_179858 ?auto_179856 ) ( not ( = ?auto_179856 ?auto_179858 ) ) ( not ( = ?auto_179856 ?auto_179855 ) ) ( not ( = ?auto_179856 ?auto_179854 ) ) ( not ( = ?auto_179850 ?auto_179856 ) ) ( not ( = ?auto_179851 ?auto_179856 ) ) ( not ( = ?auto_179852 ?auto_179856 ) ) ( not ( = ?auto_179853 ?auto_179856 ) ) ( ON ?auto_179853 ?auto_179854 ) ( ON ?auto_179850 ?auto_179857 ) ( not ( = ?auto_179850 ?auto_179857 ) ) ( not ( = ?auto_179851 ?auto_179857 ) ) ( not ( = ?auto_179852 ?auto_179857 ) ) ( not ( = ?auto_179853 ?auto_179857 ) ) ( not ( = ?auto_179854 ?auto_179857 ) ) ( not ( = ?auto_179855 ?auto_179857 ) ) ( not ( = ?auto_179858 ?auto_179857 ) ) ( not ( = ?auto_179856 ?auto_179857 ) ) ( ON ?auto_179851 ?auto_179850 ) ( CLEAR ?auto_179851 ) ( ON-TABLE ?auto_179857 ) ( HOLDING ?auto_179852 ) ( CLEAR ?auto_179853 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179856 ?auto_179858 ?auto_179855 ?auto_179854 ?auto_179853 ?auto_179852 )
      ( MAKE-6PILE ?auto_179850 ?auto_179851 ?auto_179852 ?auto_179853 ?auto_179854 ?auto_179855 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179859 - BLOCK
      ?auto_179860 - BLOCK
      ?auto_179861 - BLOCK
      ?auto_179862 - BLOCK
      ?auto_179863 - BLOCK
      ?auto_179864 - BLOCK
    )
    :vars
    (
      ?auto_179865 - BLOCK
      ?auto_179867 - BLOCK
      ?auto_179866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179859 ?auto_179860 ) ) ( not ( = ?auto_179859 ?auto_179861 ) ) ( not ( = ?auto_179859 ?auto_179862 ) ) ( not ( = ?auto_179859 ?auto_179863 ) ) ( not ( = ?auto_179859 ?auto_179864 ) ) ( not ( = ?auto_179860 ?auto_179861 ) ) ( not ( = ?auto_179860 ?auto_179862 ) ) ( not ( = ?auto_179860 ?auto_179863 ) ) ( not ( = ?auto_179860 ?auto_179864 ) ) ( not ( = ?auto_179861 ?auto_179862 ) ) ( not ( = ?auto_179861 ?auto_179863 ) ) ( not ( = ?auto_179861 ?auto_179864 ) ) ( not ( = ?auto_179862 ?auto_179863 ) ) ( not ( = ?auto_179862 ?auto_179864 ) ) ( not ( = ?auto_179863 ?auto_179864 ) ) ( ON ?auto_179864 ?auto_179865 ) ( not ( = ?auto_179859 ?auto_179865 ) ) ( not ( = ?auto_179860 ?auto_179865 ) ) ( not ( = ?auto_179861 ?auto_179865 ) ) ( not ( = ?auto_179862 ?auto_179865 ) ) ( not ( = ?auto_179863 ?auto_179865 ) ) ( not ( = ?auto_179864 ?auto_179865 ) ) ( ON ?auto_179863 ?auto_179864 ) ( ON-TABLE ?auto_179867 ) ( ON ?auto_179865 ?auto_179867 ) ( not ( = ?auto_179867 ?auto_179865 ) ) ( not ( = ?auto_179867 ?auto_179864 ) ) ( not ( = ?auto_179867 ?auto_179863 ) ) ( not ( = ?auto_179859 ?auto_179867 ) ) ( not ( = ?auto_179860 ?auto_179867 ) ) ( not ( = ?auto_179861 ?auto_179867 ) ) ( not ( = ?auto_179862 ?auto_179867 ) ) ( ON ?auto_179862 ?auto_179863 ) ( ON ?auto_179859 ?auto_179866 ) ( not ( = ?auto_179859 ?auto_179866 ) ) ( not ( = ?auto_179860 ?auto_179866 ) ) ( not ( = ?auto_179861 ?auto_179866 ) ) ( not ( = ?auto_179862 ?auto_179866 ) ) ( not ( = ?auto_179863 ?auto_179866 ) ) ( not ( = ?auto_179864 ?auto_179866 ) ) ( not ( = ?auto_179865 ?auto_179866 ) ) ( not ( = ?auto_179867 ?auto_179866 ) ) ( ON ?auto_179860 ?auto_179859 ) ( ON-TABLE ?auto_179866 ) ( CLEAR ?auto_179862 ) ( ON ?auto_179861 ?auto_179860 ) ( CLEAR ?auto_179861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179866 ?auto_179859 ?auto_179860 )
      ( MAKE-6PILE ?auto_179859 ?auto_179860 ?auto_179861 ?auto_179862 ?auto_179863 ?auto_179864 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179868 - BLOCK
      ?auto_179869 - BLOCK
      ?auto_179870 - BLOCK
      ?auto_179871 - BLOCK
      ?auto_179872 - BLOCK
      ?auto_179873 - BLOCK
    )
    :vars
    (
      ?auto_179876 - BLOCK
      ?auto_179875 - BLOCK
      ?auto_179874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179868 ?auto_179869 ) ) ( not ( = ?auto_179868 ?auto_179870 ) ) ( not ( = ?auto_179868 ?auto_179871 ) ) ( not ( = ?auto_179868 ?auto_179872 ) ) ( not ( = ?auto_179868 ?auto_179873 ) ) ( not ( = ?auto_179869 ?auto_179870 ) ) ( not ( = ?auto_179869 ?auto_179871 ) ) ( not ( = ?auto_179869 ?auto_179872 ) ) ( not ( = ?auto_179869 ?auto_179873 ) ) ( not ( = ?auto_179870 ?auto_179871 ) ) ( not ( = ?auto_179870 ?auto_179872 ) ) ( not ( = ?auto_179870 ?auto_179873 ) ) ( not ( = ?auto_179871 ?auto_179872 ) ) ( not ( = ?auto_179871 ?auto_179873 ) ) ( not ( = ?auto_179872 ?auto_179873 ) ) ( ON ?auto_179873 ?auto_179876 ) ( not ( = ?auto_179868 ?auto_179876 ) ) ( not ( = ?auto_179869 ?auto_179876 ) ) ( not ( = ?auto_179870 ?auto_179876 ) ) ( not ( = ?auto_179871 ?auto_179876 ) ) ( not ( = ?auto_179872 ?auto_179876 ) ) ( not ( = ?auto_179873 ?auto_179876 ) ) ( ON ?auto_179872 ?auto_179873 ) ( ON-TABLE ?auto_179875 ) ( ON ?auto_179876 ?auto_179875 ) ( not ( = ?auto_179875 ?auto_179876 ) ) ( not ( = ?auto_179875 ?auto_179873 ) ) ( not ( = ?auto_179875 ?auto_179872 ) ) ( not ( = ?auto_179868 ?auto_179875 ) ) ( not ( = ?auto_179869 ?auto_179875 ) ) ( not ( = ?auto_179870 ?auto_179875 ) ) ( not ( = ?auto_179871 ?auto_179875 ) ) ( ON ?auto_179868 ?auto_179874 ) ( not ( = ?auto_179868 ?auto_179874 ) ) ( not ( = ?auto_179869 ?auto_179874 ) ) ( not ( = ?auto_179870 ?auto_179874 ) ) ( not ( = ?auto_179871 ?auto_179874 ) ) ( not ( = ?auto_179872 ?auto_179874 ) ) ( not ( = ?auto_179873 ?auto_179874 ) ) ( not ( = ?auto_179876 ?auto_179874 ) ) ( not ( = ?auto_179875 ?auto_179874 ) ) ( ON ?auto_179869 ?auto_179868 ) ( ON-TABLE ?auto_179874 ) ( ON ?auto_179870 ?auto_179869 ) ( CLEAR ?auto_179870 ) ( HOLDING ?auto_179871 ) ( CLEAR ?auto_179872 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179875 ?auto_179876 ?auto_179873 ?auto_179872 ?auto_179871 )
      ( MAKE-6PILE ?auto_179868 ?auto_179869 ?auto_179870 ?auto_179871 ?auto_179872 ?auto_179873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179877 - BLOCK
      ?auto_179878 - BLOCK
      ?auto_179879 - BLOCK
      ?auto_179880 - BLOCK
      ?auto_179881 - BLOCK
      ?auto_179882 - BLOCK
    )
    :vars
    (
      ?auto_179884 - BLOCK
      ?auto_179885 - BLOCK
      ?auto_179883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179877 ?auto_179878 ) ) ( not ( = ?auto_179877 ?auto_179879 ) ) ( not ( = ?auto_179877 ?auto_179880 ) ) ( not ( = ?auto_179877 ?auto_179881 ) ) ( not ( = ?auto_179877 ?auto_179882 ) ) ( not ( = ?auto_179878 ?auto_179879 ) ) ( not ( = ?auto_179878 ?auto_179880 ) ) ( not ( = ?auto_179878 ?auto_179881 ) ) ( not ( = ?auto_179878 ?auto_179882 ) ) ( not ( = ?auto_179879 ?auto_179880 ) ) ( not ( = ?auto_179879 ?auto_179881 ) ) ( not ( = ?auto_179879 ?auto_179882 ) ) ( not ( = ?auto_179880 ?auto_179881 ) ) ( not ( = ?auto_179880 ?auto_179882 ) ) ( not ( = ?auto_179881 ?auto_179882 ) ) ( ON ?auto_179882 ?auto_179884 ) ( not ( = ?auto_179877 ?auto_179884 ) ) ( not ( = ?auto_179878 ?auto_179884 ) ) ( not ( = ?auto_179879 ?auto_179884 ) ) ( not ( = ?auto_179880 ?auto_179884 ) ) ( not ( = ?auto_179881 ?auto_179884 ) ) ( not ( = ?auto_179882 ?auto_179884 ) ) ( ON ?auto_179881 ?auto_179882 ) ( ON-TABLE ?auto_179885 ) ( ON ?auto_179884 ?auto_179885 ) ( not ( = ?auto_179885 ?auto_179884 ) ) ( not ( = ?auto_179885 ?auto_179882 ) ) ( not ( = ?auto_179885 ?auto_179881 ) ) ( not ( = ?auto_179877 ?auto_179885 ) ) ( not ( = ?auto_179878 ?auto_179885 ) ) ( not ( = ?auto_179879 ?auto_179885 ) ) ( not ( = ?auto_179880 ?auto_179885 ) ) ( ON ?auto_179877 ?auto_179883 ) ( not ( = ?auto_179877 ?auto_179883 ) ) ( not ( = ?auto_179878 ?auto_179883 ) ) ( not ( = ?auto_179879 ?auto_179883 ) ) ( not ( = ?auto_179880 ?auto_179883 ) ) ( not ( = ?auto_179881 ?auto_179883 ) ) ( not ( = ?auto_179882 ?auto_179883 ) ) ( not ( = ?auto_179884 ?auto_179883 ) ) ( not ( = ?auto_179885 ?auto_179883 ) ) ( ON ?auto_179878 ?auto_179877 ) ( ON-TABLE ?auto_179883 ) ( ON ?auto_179879 ?auto_179878 ) ( CLEAR ?auto_179881 ) ( ON ?auto_179880 ?auto_179879 ) ( CLEAR ?auto_179880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179883 ?auto_179877 ?auto_179878 ?auto_179879 )
      ( MAKE-6PILE ?auto_179877 ?auto_179878 ?auto_179879 ?auto_179880 ?auto_179881 ?auto_179882 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179886 - BLOCK
      ?auto_179887 - BLOCK
      ?auto_179888 - BLOCK
      ?auto_179889 - BLOCK
      ?auto_179890 - BLOCK
      ?auto_179891 - BLOCK
    )
    :vars
    (
      ?auto_179894 - BLOCK
      ?auto_179892 - BLOCK
      ?auto_179893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179886 ?auto_179887 ) ) ( not ( = ?auto_179886 ?auto_179888 ) ) ( not ( = ?auto_179886 ?auto_179889 ) ) ( not ( = ?auto_179886 ?auto_179890 ) ) ( not ( = ?auto_179886 ?auto_179891 ) ) ( not ( = ?auto_179887 ?auto_179888 ) ) ( not ( = ?auto_179887 ?auto_179889 ) ) ( not ( = ?auto_179887 ?auto_179890 ) ) ( not ( = ?auto_179887 ?auto_179891 ) ) ( not ( = ?auto_179888 ?auto_179889 ) ) ( not ( = ?auto_179888 ?auto_179890 ) ) ( not ( = ?auto_179888 ?auto_179891 ) ) ( not ( = ?auto_179889 ?auto_179890 ) ) ( not ( = ?auto_179889 ?auto_179891 ) ) ( not ( = ?auto_179890 ?auto_179891 ) ) ( ON ?auto_179891 ?auto_179894 ) ( not ( = ?auto_179886 ?auto_179894 ) ) ( not ( = ?auto_179887 ?auto_179894 ) ) ( not ( = ?auto_179888 ?auto_179894 ) ) ( not ( = ?auto_179889 ?auto_179894 ) ) ( not ( = ?auto_179890 ?auto_179894 ) ) ( not ( = ?auto_179891 ?auto_179894 ) ) ( ON-TABLE ?auto_179892 ) ( ON ?auto_179894 ?auto_179892 ) ( not ( = ?auto_179892 ?auto_179894 ) ) ( not ( = ?auto_179892 ?auto_179891 ) ) ( not ( = ?auto_179892 ?auto_179890 ) ) ( not ( = ?auto_179886 ?auto_179892 ) ) ( not ( = ?auto_179887 ?auto_179892 ) ) ( not ( = ?auto_179888 ?auto_179892 ) ) ( not ( = ?auto_179889 ?auto_179892 ) ) ( ON ?auto_179886 ?auto_179893 ) ( not ( = ?auto_179886 ?auto_179893 ) ) ( not ( = ?auto_179887 ?auto_179893 ) ) ( not ( = ?auto_179888 ?auto_179893 ) ) ( not ( = ?auto_179889 ?auto_179893 ) ) ( not ( = ?auto_179890 ?auto_179893 ) ) ( not ( = ?auto_179891 ?auto_179893 ) ) ( not ( = ?auto_179894 ?auto_179893 ) ) ( not ( = ?auto_179892 ?auto_179893 ) ) ( ON ?auto_179887 ?auto_179886 ) ( ON-TABLE ?auto_179893 ) ( ON ?auto_179888 ?auto_179887 ) ( ON ?auto_179889 ?auto_179888 ) ( CLEAR ?auto_179889 ) ( HOLDING ?auto_179890 ) ( CLEAR ?auto_179891 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179892 ?auto_179894 ?auto_179891 ?auto_179890 )
      ( MAKE-6PILE ?auto_179886 ?auto_179887 ?auto_179888 ?auto_179889 ?auto_179890 ?auto_179891 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179895 - BLOCK
      ?auto_179896 - BLOCK
      ?auto_179897 - BLOCK
      ?auto_179898 - BLOCK
      ?auto_179899 - BLOCK
      ?auto_179900 - BLOCK
    )
    :vars
    (
      ?auto_179903 - BLOCK
      ?auto_179901 - BLOCK
      ?auto_179902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179895 ?auto_179896 ) ) ( not ( = ?auto_179895 ?auto_179897 ) ) ( not ( = ?auto_179895 ?auto_179898 ) ) ( not ( = ?auto_179895 ?auto_179899 ) ) ( not ( = ?auto_179895 ?auto_179900 ) ) ( not ( = ?auto_179896 ?auto_179897 ) ) ( not ( = ?auto_179896 ?auto_179898 ) ) ( not ( = ?auto_179896 ?auto_179899 ) ) ( not ( = ?auto_179896 ?auto_179900 ) ) ( not ( = ?auto_179897 ?auto_179898 ) ) ( not ( = ?auto_179897 ?auto_179899 ) ) ( not ( = ?auto_179897 ?auto_179900 ) ) ( not ( = ?auto_179898 ?auto_179899 ) ) ( not ( = ?auto_179898 ?auto_179900 ) ) ( not ( = ?auto_179899 ?auto_179900 ) ) ( ON ?auto_179900 ?auto_179903 ) ( not ( = ?auto_179895 ?auto_179903 ) ) ( not ( = ?auto_179896 ?auto_179903 ) ) ( not ( = ?auto_179897 ?auto_179903 ) ) ( not ( = ?auto_179898 ?auto_179903 ) ) ( not ( = ?auto_179899 ?auto_179903 ) ) ( not ( = ?auto_179900 ?auto_179903 ) ) ( ON-TABLE ?auto_179901 ) ( ON ?auto_179903 ?auto_179901 ) ( not ( = ?auto_179901 ?auto_179903 ) ) ( not ( = ?auto_179901 ?auto_179900 ) ) ( not ( = ?auto_179901 ?auto_179899 ) ) ( not ( = ?auto_179895 ?auto_179901 ) ) ( not ( = ?auto_179896 ?auto_179901 ) ) ( not ( = ?auto_179897 ?auto_179901 ) ) ( not ( = ?auto_179898 ?auto_179901 ) ) ( ON ?auto_179895 ?auto_179902 ) ( not ( = ?auto_179895 ?auto_179902 ) ) ( not ( = ?auto_179896 ?auto_179902 ) ) ( not ( = ?auto_179897 ?auto_179902 ) ) ( not ( = ?auto_179898 ?auto_179902 ) ) ( not ( = ?auto_179899 ?auto_179902 ) ) ( not ( = ?auto_179900 ?auto_179902 ) ) ( not ( = ?auto_179903 ?auto_179902 ) ) ( not ( = ?auto_179901 ?auto_179902 ) ) ( ON ?auto_179896 ?auto_179895 ) ( ON-TABLE ?auto_179902 ) ( ON ?auto_179897 ?auto_179896 ) ( ON ?auto_179898 ?auto_179897 ) ( CLEAR ?auto_179900 ) ( ON ?auto_179899 ?auto_179898 ) ( CLEAR ?auto_179899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179902 ?auto_179895 ?auto_179896 ?auto_179897 ?auto_179898 )
      ( MAKE-6PILE ?auto_179895 ?auto_179896 ?auto_179897 ?auto_179898 ?auto_179899 ?auto_179900 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179904 - BLOCK
      ?auto_179905 - BLOCK
      ?auto_179906 - BLOCK
      ?auto_179907 - BLOCK
      ?auto_179908 - BLOCK
      ?auto_179909 - BLOCK
    )
    :vars
    (
      ?auto_179911 - BLOCK
      ?auto_179912 - BLOCK
      ?auto_179910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179904 ?auto_179905 ) ) ( not ( = ?auto_179904 ?auto_179906 ) ) ( not ( = ?auto_179904 ?auto_179907 ) ) ( not ( = ?auto_179904 ?auto_179908 ) ) ( not ( = ?auto_179904 ?auto_179909 ) ) ( not ( = ?auto_179905 ?auto_179906 ) ) ( not ( = ?auto_179905 ?auto_179907 ) ) ( not ( = ?auto_179905 ?auto_179908 ) ) ( not ( = ?auto_179905 ?auto_179909 ) ) ( not ( = ?auto_179906 ?auto_179907 ) ) ( not ( = ?auto_179906 ?auto_179908 ) ) ( not ( = ?auto_179906 ?auto_179909 ) ) ( not ( = ?auto_179907 ?auto_179908 ) ) ( not ( = ?auto_179907 ?auto_179909 ) ) ( not ( = ?auto_179908 ?auto_179909 ) ) ( not ( = ?auto_179904 ?auto_179911 ) ) ( not ( = ?auto_179905 ?auto_179911 ) ) ( not ( = ?auto_179906 ?auto_179911 ) ) ( not ( = ?auto_179907 ?auto_179911 ) ) ( not ( = ?auto_179908 ?auto_179911 ) ) ( not ( = ?auto_179909 ?auto_179911 ) ) ( ON-TABLE ?auto_179912 ) ( ON ?auto_179911 ?auto_179912 ) ( not ( = ?auto_179912 ?auto_179911 ) ) ( not ( = ?auto_179912 ?auto_179909 ) ) ( not ( = ?auto_179912 ?auto_179908 ) ) ( not ( = ?auto_179904 ?auto_179912 ) ) ( not ( = ?auto_179905 ?auto_179912 ) ) ( not ( = ?auto_179906 ?auto_179912 ) ) ( not ( = ?auto_179907 ?auto_179912 ) ) ( ON ?auto_179904 ?auto_179910 ) ( not ( = ?auto_179904 ?auto_179910 ) ) ( not ( = ?auto_179905 ?auto_179910 ) ) ( not ( = ?auto_179906 ?auto_179910 ) ) ( not ( = ?auto_179907 ?auto_179910 ) ) ( not ( = ?auto_179908 ?auto_179910 ) ) ( not ( = ?auto_179909 ?auto_179910 ) ) ( not ( = ?auto_179911 ?auto_179910 ) ) ( not ( = ?auto_179912 ?auto_179910 ) ) ( ON ?auto_179905 ?auto_179904 ) ( ON-TABLE ?auto_179910 ) ( ON ?auto_179906 ?auto_179905 ) ( ON ?auto_179907 ?auto_179906 ) ( ON ?auto_179908 ?auto_179907 ) ( CLEAR ?auto_179908 ) ( HOLDING ?auto_179909 ) ( CLEAR ?auto_179911 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179912 ?auto_179911 ?auto_179909 )
      ( MAKE-6PILE ?auto_179904 ?auto_179905 ?auto_179906 ?auto_179907 ?auto_179908 ?auto_179909 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179913 - BLOCK
      ?auto_179914 - BLOCK
      ?auto_179915 - BLOCK
      ?auto_179916 - BLOCK
      ?auto_179917 - BLOCK
      ?auto_179918 - BLOCK
    )
    :vars
    (
      ?auto_179921 - BLOCK
      ?auto_179919 - BLOCK
      ?auto_179920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179913 ?auto_179914 ) ) ( not ( = ?auto_179913 ?auto_179915 ) ) ( not ( = ?auto_179913 ?auto_179916 ) ) ( not ( = ?auto_179913 ?auto_179917 ) ) ( not ( = ?auto_179913 ?auto_179918 ) ) ( not ( = ?auto_179914 ?auto_179915 ) ) ( not ( = ?auto_179914 ?auto_179916 ) ) ( not ( = ?auto_179914 ?auto_179917 ) ) ( not ( = ?auto_179914 ?auto_179918 ) ) ( not ( = ?auto_179915 ?auto_179916 ) ) ( not ( = ?auto_179915 ?auto_179917 ) ) ( not ( = ?auto_179915 ?auto_179918 ) ) ( not ( = ?auto_179916 ?auto_179917 ) ) ( not ( = ?auto_179916 ?auto_179918 ) ) ( not ( = ?auto_179917 ?auto_179918 ) ) ( not ( = ?auto_179913 ?auto_179921 ) ) ( not ( = ?auto_179914 ?auto_179921 ) ) ( not ( = ?auto_179915 ?auto_179921 ) ) ( not ( = ?auto_179916 ?auto_179921 ) ) ( not ( = ?auto_179917 ?auto_179921 ) ) ( not ( = ?auto_179918 ?auto_179921 ) ) ( ON-TABLE ?auto_179919 ) ( ON ?auto_179921 ?auto_179919 ) ( not ( = ?auto_179919 ?auto_179921 ) ) ( not ( = ?auto_179919 ?auto_179918 ) ) ( not ( = ?auto_179919 ?auto_179917 ) ) ( not ( = ?auto_179913 ?auto_179919 ) ) ( not ( = ?auto_179914 ?auto_179919 ) ) ( not ( = ?auto_179915 ?auto_179919 ) ) ( not ( = ?auto_179916 ?auto_179919 ) ) ( ON ?auto_179913 ?auto_179920 ) ( not ( = ?auto_179913 ?auto_179920 ) ) ( not ( = ?auto_179914 ?auto_179920 ) ) ( not ( = ?auto_179915 ?auto_179920 ) ) ( not ( = ?auto_179916 ?auto_179920 ) ) ( not ( = ?auto_179917 ?auto_179920 ) ) ( not ( = ?auto_179918 ?auto_179920 ) ) ( not ( = ?auto_179921 ?auto_179920 ) ) ( not ( = ?auto_179919 ?auto_179920 ) ) ( ON ?auto_179914 ?auto_179913 ) ( ON-TABLE ?auto_179920 ) ( ON ?auto_179915 ?auto_179914 ) ( ON ?auto_179916 ?auto_179915 ) ( ON ?auto_179917 ?auto_179916 ) ( CLEAR ?auto_179921 ) ( ON ?auto_179918 ?auto_179917 ) ( CLEAR ?auto_179918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179920 ?auto_179913 ?auto_179914 ?auto_179915 ?auto_179916 ?auto_179917 )
      ( MAKE-6PILE ?auto_179913 ?auto_179914 ?auto_179915 ?auto_179916 ?auto_179917 ?auto_179918 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179922 - BLOCK
      ?auto_179923 - BLOCK
      ?auto_179924 - BLOCK
      ?auto_179925 - BLOCK
      ?auto_179926 - BLOCK
      ?auto_179927 - BLOCK
    )
    :vars
    (
      ?auto_179930 - BLOCK
      ?auto_179929 - BLOCK
      ?auto_179928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179922 ?auto_179923 ) ) ( not ( = ?auto_179922 ?auto_179924 ) ) ( not ( = ?auto_179922 ?auto_179925 ) ) ( not ( = ?auto_179922 ?auto_179926 ) ) ( not ( = ?auto_179922 ?auto_179927 ) ) ( not ( = ?auto_179923 ?auto_179924 ) ) ( not ( = ?auto_179923 ?auto_179925 ) ) ( not ( = ?auto_179923 ?auto_179926 ) ) ( not ( = ?auto_179923 ?auto_179927 ) ) ( not ( = ?auto_179924 ?auto_179925 ) ) ( not ( = ?auto_179924 ?auto_179926 ) ) ( not ( = ?auto_179924 ?auto_179927 ) ) ( not ( = ?auto_179925 ?auto_179926 ) ) ( not ( = ?auto_179925 ?auto_179927 ) ) ( not ( = ?auto_179926 ?auto_179927 ) ) ( not ( = ?auto_179922 ?auto_179930 ) ) ( not ( = ?auto_179923 ?auto_179930 ) ) ( not ( = ?auto_179924 ?auto_179930 ) ) ( not ( = ?auto_179925 ?auto_179930 ) ) ( not ( = ?auto_179926 ?auto_179930 ) ) ( not ( = ?auto_179927 ?auto_179930 ) ) ( ON-TABLE ?auto_179929 ) ( not ( = ?auto_179929 ?auto_179930 ) ) ( not ( = ?auto_179929 ?auto_179927 ) ) ( not ( = ?auto_179929 ?auto_179926 ) ) ( not ( = ?auto_179922 ?auto_179929 ) ) ( not ( = ?auto_179923 ?auto_179929 ) ) ( not ( = ?auto_179924 ?auto_179929 ) ) ( not ( = ?auto_179925 ?auto_179929 ) ) ( ON ?auto_179922 ?auto_179928 ) ( not ( = ?auto_179922 ?auto_179928 ) ) ( not ( = ?auto_179923 ?auto_179928 ) ) ( not ( = ?auto_179924 ?auto_179928 ) ) ( not ( = ?auto_179925 ?auto_179928 ) ) ( not ( = ?auto_179926 ?auto_179928 ) ) ( not ( = ?auto_179927 ?auto_179928 ) ) ( not ( = ?auto_179930 ?auto_179928 ) ) ( not ( = ?auto_179929 ?auto_179928 ) ) ( ON ?auto_179923 ?auto_179922 ) ( ON-TABLE ?auto_179928 ) ( ON ?auto_179924 ?auto_179923 ) ( ON ?auto_179925 ?auto_179924 ) ( ON ?auto_179926 ?auto_179925 ) ( ON ?auto_179927 ?auto_179926 ) ( CLEAR ?auto_179927 ) ( HOLDING ?auto_179930 ) ( CLEAR ?auto_179929 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179929 ?auto_179930 )
      ( MAKE-6PILE ?auto_179922 ?auto_179923 ?auto_179924 ?auto_179925 ?auto_179926 ?auto_179927 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179931 - BLOCK
      ?auto_179932 - BLOCK
      ?auto_179933 - BLOCK
      ?auto_179934 - BLOCK
      ?auto_179935 - BLOCK
      ?auto_179936 - BLOCK
    )
    :vars
    (
      ?auto_179938 - BLOCK
      ?auto_179939 - BLOCK
      ?auto_179937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179931 ?auto_179932 ) ) ( not ( = ?auto_179931 ?auto_179933 ) ) ( not ( = ?auto_179931 ?auto_179934 ) ) ( not ( = ?auto_179931 ?auto_179935 ) ) ( not ( = ?auto_179931 ?auto_179936 ) ) ( not ( = ?auto_179932 ?auto_179933 ) ) ( not ( = ?auto_179932 ?auto_179934 ) ) ( not ( = ?auto_179932 ?auto_179935 ) ) ( not ( = ?auto_179932 ?auto_179936 ) ) ( not ( = ?auto_179933 ?auto_179934 ) ) ( not ( = ?auto_179933 ?auto_179935 ) ) ( not ( = ?auto_179933 ?auto_179936 ) ) ( not ( = ?auto_179934 ?auto_179935 ) ) ( not ( = ?auto_179934 ?auto_179936 ) ) ( not ( = ?auto_179935 ?auto_179936 ) ) ( not ( = ?auto_179931 ?auto_179938 ) ) ( not ( = ?auto_179932 ?auto_179938 ) ) ( not ( = ?auto_179933 ?auto_179938 ) ) ( not ( = ?auto_179934 ?auto_179938 ) ) ( not ( = ?auto_179935 ?auto_179938 ) ) ( not ( = ?auto_179936 ?auto_179938 ) ) ( ON-TABLE ?auto_179939 ) ( not ( = ?auto_179939 ?auto_179938 ) ) ( not ( = ?auto_179939 ?auto_179936 ) ) ( not ( = ?auto_179939 ?auto_179935 ) ) ( not ( = ?auto_179931 ?auto_179939 ) ) ( not ( = ?auto_179932 ?auto_179939 ) ) ( not ( = ?auto_179933 ?auto_179939 ) ) ( not ( = ?auto_179934 ?auto_179939 ) ) ( ON ?auto_179931 ?auto_179937 ) ( not ( = ?auto_179931 ?auto_179937 ) ) ( not ( = ?auto_179932 ?auto_179937 ) ) ( not ( = ?auto_179933 ?auto_179937 ) ) ( not ( = ?auto_179934 ?auto_179937 ) ) ( not ( = ?auto_179935 ?auto_179937 ) ) ( not ( = ?auto_179936 ?auto_179937 ) ) ( not ( = ?auto_179938 ?auto_179937 ) ) ( not ( = ?auto_179939 ?auto_179937 ) ) ( ON ?auto_179932 ?auto_179931 ) ( ON-TABLE ?auto_179937 ) ( ON ?auto_179933 ?auto_179932 ) ( ON ?auto_179934 ?auto_179933 ) ( ON ?auto_179935 ?auto_179934 ) ( ON ?auto_179936 ?auto_179935 ) ( CLEAR ?auto_179939 ) ( ON ?auto_179938 ?auto_179936 ) ( CLEAR ?auto_179938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179937 ?auto_179931 ?auto_179932 ?auto_179933 ?auto_179934 ?auto_179935 ?auto_179936 )
      ( MAKE-6PILE ?auto_179931 ?auto_179932 ?auto_179933 ?auto_179934 ?auto_179935 ?auto_179936 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179940 - BLOCK
      ?auto_179941 - BLOCK
      ?auto_179942 - BLOCK
      ?auto_179943 - BLOCK
      ?auto_179944 - BLOCK
      ?auto_179945 - BLOCK
    )
    :vars
    (
      ?auto_179947 - BLOCK
      ?auto_179946 - BLOCK
      ?auto_179948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179940 ?auto_179941 ) ) ( not ( = ?auto_179940 ?auto_179942 ) ) ( not ( = ?auto_179940 ?auto_179943 ) ) ( not ( = ?auto_179940 ?auto_179944 ) ) ( not ( = ?auto_179940 ?auto_179945 ) ) ( not ( = ?auto_179941 ?auto_179942 ) ) ( not ( = ?auto_179941 ?auto_179943 ) ) ( not ( = ?auto_179941 ?auto_179944 ) ) ( not ( = ?auto_179941 ?auto_179945 ) ) ( not ( = ?auto_179942 ?auto_179943 ) ) ( not ( = ?auto_179942 ?auto_179944 ) ) ( not ( = ?auto_179942 ?auto_179945 ) ) ( not ( = ?auto_179943 ?auto_179944 ) ) ( not ( = ?auto_179943 ?auto_179945 ) ) ( not ( = ?auto_179944 ?auto_179945 ) ) ( not ( = ?auto_179940 ?auto_179947 ) ) ( not ( = ?auto_179941 ?auto_179947 ) ) ( not ( = ?auto_179942 ?auto_179947 ) ) ( not ( = ?auto_179943 ?auto_179947 ) ) ( not ( = ?auto_179944 ?auto_179947 ) ) ( not ( = ?auto_179945 ?auto_179947 ) ) ( not ( = ?auto_179946 ?auto_179947 ) ) ( not ( = ?auto_179946 ?auto_179945 ) ) ( not ( = ?auto_179946 ?auto_179944 ) ) ( not ( = ?auto_179940 ?auto_179946 ) ) ( not ( = ?auto_179941 ?auto_179946 ) ) ( not ( = ?auto_179942 ?auto_179946 ) ) ( not ( = ?auto_179943 ?auto_179946 ) ) ( ON ?auto_179940 ?auto_179948 ) ( not ( = ?auto_179940 ?auto_179948 ) ) ( not ( = ?auto_179941 ?auto_179948 ) ) ( not ( = ?auto_179942 ?auto_179948 ) ) ( not ( = ?auto_179943 ?auto_179948 ) ) ( not ( = ?auto_179944 ?auto_179948 ) ) ( not ( = ?auto_179945 ?auto_179948 ) ) ( not ( = ?auto_179947 ?auto_179948 ) ) ( not ( = ?auto_179946 ?auto_179948 ) ) ( ON ?auto_179941 ?auto_179940 ) ( ON-TABLE ?auto_179948 ) ( ON ?auto_179942 ?auto_179941 ) ( ON ?auto_179943 ?auto_179942 ) ( ON ?auto_179944 ?auto_179943 ) ( ON ?auto_179945 ?auto_179944 ) ( ON ?auto_179947 ?auto_179945 ) ( CLEAR ?auto_179947 ) ( HOLDING ?auto_179946 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179946 )
      ( MAKE-6PILE ?auto_179940 ?auto_179941 ?auto_179942 ?auto_179943 ?auto_179944 ?auto_179945 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_179949 - BLOCK
      ?auto_179950 - BLOCK
      ?auto_179951 - BLOCK
      ?auto_179952 - BLOCK
      ?auto_179953 - BLOCK
      ?auto_179954 - BLOCK
    )
    :vars
    (
      ?auto_179957 - BLOCK
      ?auto_179955 - BLOCK
      ?auto_179956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179949 ?auto_179950 ) ) ( not ( = ?auto_179949 ?auto_179951 ) ) ( not ( = ?auto_179949 ?auto_179952 ) ) ( not ( = ?auto_179949 ?auto_179953 ) ) ( not ( = ?auto_179949 ?auto_179954 ) ) ( not ( = ?auto_179950 ?auto_179951 ) ) ( not ( = ?auto_179950 ?auto_179952 ) ) ( not ( = ?auto_179950 ?auto_179953 ) ) ( not ( = ?auto_179950 ?auto_179954 ) ) ( not ( = ?auto_179951 ?auto_179952 ) ) ( not ( = ?auto_179951 ?auto_179953 ) ) ( not ( = ?auto_179951 ?auto_179954 ) ) ( not ( = ?auto_179952 ?auto_179953 ) ) ( not ( = ?auto_179952 ?auto_179954 ) ) ( not ( = ?auto_179953 ?auto_179954 ) ) ( not ( = ?auto_179949 ?auto_179957 ) ) ( not ( = ?auto_179950 ?auto_179957 ) ) ( not ( = ?auto_179951 ?auto_179957 ) ) ( not ( = ?auto_179952 ?auto_179957 ) ) ( not ( = ?auto_179953 ?auto_179957 ) ) ( not ( = ?auto_179954 ?auto_179957 ) ) ( not ( = ?auto_179955 ?auto_179957 ) ) ( not ( = ?auto_179955 ?auto_179954 ) ) ( not ( = ?auto_179955 ?auto_179953 ) ) ( not ( = ?auto_179949 ?auto_179955 ) ) ( not ( = ?auto_179950 ?auto_179955 ) ) ( not ( = ?auto_179951 ?auto_179955 ) ) ( not ( = ?auto_179952 ?auto_179955 ) ) ( ON ?auto_179949 ?auto_179956 ) ( not ( = ?auto_179949 ?auto_179956 ) ) ( not ( = ?auto_179950 ?auto_179956 ) ) ( not ( = ?auto_179951 ?auto_179956 ) ) ( not ( = ?auto_179952 ?auto_179956 ) ) ( not ( = ?auto_179953 ?auto_179956 ) ) ( not ( = ?auto_179954 ?auto_179956 ) ) ( not ( = ?auto_179957 ?auto_179956 ) ) ( not ( = ?auto_179955 ?auto_179956 ) ) ( ON ?auto_179950 ?auto_179949 ) ( ON-TABLE ?auto_179956 ) ( ON ?auto_179951 ?auto_179950 ) ( ON ?auto_179952 ?auto_179951 ) ( ON ?auto_179953 ?auto_179952 ) ( ON ?auto_179954 ?auto_179953 ) ( ON ?auto_179957 ?auto_179954 ) ( ON ?auto_179955 ?auto_179957 ) ( CLEAR ?auto_179955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179956 ?auto_179949 ?auto_179950 ?auto_179951 ?auto_179952 ?auto_179953 ?auto_179954 ?auto_179957 )
      ( MAKE-6PILE ?auto_179949 ?auto_179950 ?auto_179951 ?auto_179952 ?auto_179953 ?auto_179954 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_179969 - BLOCK
    )
    :vars
    (
      ?auto_179971 - BLOCK
      ?auto_179972 - BLOCK
      ?auto_179970 - BLOCK
      ?auto_179975 - BLOCK
      ?auto_179974 - BLOCK
      ?auto_179976 - BLOCK
      ?auto_179973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179971 ?auto_179969 ) ( ON-TABLE ?auto_179969 ) ( not ( = ?auto_179969 ?auto_179971 ) ) ( not ( = ?auto_179969 ?auto_179972 ) ) ( not ( = ?auto_179969 ?auto_179970 ) ) ( not ( = ?auto_179971 ?auto_179972 ) ) ( not ( = ?auto_179971 ?auto_179970 ) ) ( not ( = ?auto_179972 ?auto_179970 ) ) ( ON ?auto_179972 ?auto_179971 ) ( CLEAR ?auto_179972 ) ( HOLDING ?auto_179970 ) ( CLEAR ?auto_179975 ) ( ON-TABLE ?auto_179974 ) ( ON ?auto_179976 ?auto_179974 ) ( ON ?auto_179973 ?auto_179976 ) ( ON ?auto_179975 ?auto_179973 ) ( not ( = ?auto_179974 ?auto_179976 ) ) ( not ( = ?auto_179974 ?auto_179973 ) ) ( not ( = ?auto_179974 ?auto_179975 ) ) ( not ( = ?auto_179974 ?auto_179970 ) ) ( not ( = ?auto_179976 ?auto_179973 ) ) ( not ( = ?auto_179976 ?auto_179975 ) ) ( not ( = ?auto_179976 ?auto_179970 ) ) ( not ( = ?auto_179973 ?auto_179975 ) ) ( not ( = ?auto_179973 ?auto_179970 ) ) ( not ( = ?auto_179975 ?auto_179970 ) ) ( not ( = ?auto_179969 ?auto_179975 ) ) ( not ( = ?auto_179969 ?auto_179974 ) ) ( not ( = ?auto_179969 ?auto_179976 ) ) ( not ( = ?auto_179969 ?auto_179973 ) ) ( not ( = ?auto_179971 ?auto_179975 ) ) ( not ( = ?auto_179971 ?auto_179974 ) ) ( not ( = ?auto_179971 ?auto_179976 ) ) ( not ( = ?auto_179971 ?auto_179973 ) ) ( not ( = ?auto_179972 ?auto_179975 ) ) ( not ( = ?auto_179972 ?auto_179974 ) ) ( not ( = ?auto_179972 ?auto_179976 ) ) ( not ( = ?auto_179972 ?auto_179973 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179974 ?auto_179976 ?auto_179973 ?auto_179975 ?auto_179970 )
      ( MAKE-1PILE ?auto_179969 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_179977 - BLOCK
    )
    :vars
    (
      ?auto_179982 - BLOCK
      ?auto_179980 - BLOCK
      ?auto_179979 - BLOCK
      ?auto_179978 - BLOCK
      ?auto_179984 - BLOCK
      ?auto_179981 - BLOCK
      ?auto_179983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179982 ?auto_179977 ) ( ON-TABLE ?auto_179977 ) ( not ( = ?auto_179977 ?auto_179982 ) ) ( not ( = ?auto_179977 ?auto_179980 ) ) ( not ( = ?auto_179977 ?auto_179979 ) ) ( not ( = ?auto_179982 ?auto_179980 ) ) ( not ( = ?auto_179982 ?auto_179979 ) ) ( not ( = ?auto_179980 ?auto_179979 ) ) ( ON ?auto_179980 ?auto_179982 ) ( CLEAR ?auto_179978 ) ( ON-TABLE ?auto_179984 ) ( ON ?auto_179981 ?auto_179984 ) ( ON ?auto_179983 ?auto_179981 ) ( ON ?auto_179978 ?auto_179983 ) ( not ( = ?auto_179984 ?auto_179981 ) ) ( not ( = ?auto_179984 ?auto_179983 ) ) ( not ( = ?auto_179984 ?auto_179978 ) ) ( not ( = ?auto_179984 ?auto_179979 ) ) ( not ( = ?auto_179981 ?auto_179983 ) ) ( not ( = ?auto_179981 ?auto_179978 ) ) ( not ( = ?auto_179981 ?auto_179979 ) ) ( not ( = ?auto_179983 ?auto_179978 ) ) ( not ( = ?auto_179983 ?auto_179979 ) ) ( not ( = ?auto_179978 ?auto_179979 ) ) ( not ( = ?auto_179977 ?auto_179978 ) ) ( not ( = ?auto_179977 ?auto_179984 ) ) ( not ( = ?auto_179977 ?auto_179981 ) ) ( not ( = ?auto_179977 ?auto_179983 ) ) ( not ( = ?auto_179982 ?auto_179978 ) ) ( not ( = ?auto_179982 ?auto_179984 ) ) ( not ( = ?auto_179982 ?auto_179981 ) ) ( not ( = ?auto_179982 ?auto_179983 ) ) ( not ( = ?auto_179980 ?auto_179978 ) ) ( not ( = ?auto_179980 ?auto_179984 ) ) ( not ( = ?auto_179980 ?auto_179981 ) ) ( not ( = ?auto_179980 ?auto_179983 ) ) ( ON ?auto_179979 ?auto_179980 ) ( CLEAR ?auto_179979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179977 ?auto_179982 ?auto_179980 )
      ( MAKE-1PILE ?auto_179977 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_179985 - BLOCK
    )
    :vars
    (
      ?auto_179989 - BLOCK
      ?auto_179987 - BLOCK
      ?auto_179992 - BLOCK
      ?auto_179988 - BLOCK
      ?auto_179986 - BLOCK
      ?auto_179991 - BLOCK
      ?auto_179990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179989 ?auto_179985 ) ( ON-TABLE ?auto_179985 ) ( not ( = ?auto_179985 ?auto_179989 ) ) ( not ( = ?auto_179985 ?auto_179987 ) ) ( not ( = ?auto_179985 ?auto_179992 ) ) ( not ( = ?auto_179989 ?auto_179987 ) ) ( not ( = ?auto_179989 ?auto_179992 ) ) ( not ( = ?auto_179987 ?auto_179992 ) ) ( ON ?auto_179987 ?auto_179989 ) ( ON-TABLE ?auto_179988 ) ( ON ?auto_179986 ?auto_179988 ) ( ON ?auto_179991 ?auto_179986 ) ( not ( = ?auto_179988 ?auto_179986 ) ) ( not ( = ?auto_179988 ?auto_179991 ) ) ( not ( = ?auto_179988 ?auto_179990 ) ) ( not ( = ?auto_179988 ?auto_179992 ) ) ( not ( = ?auto_179986 ?auto_179991 ) ) ( not ( = ?auto_179986 ?auto_179990 ) ) ( not ( = ?auto_179986 ?auto_179992 ) ) ( not ( = ?auto_179991 ?auto_179990 ) ) ( not ( = ?auto_179991 ?auto_179992 ) ) ( not ( = ?auto_179990 ?auto_179992 ) ) ( not ( = ?auto_179985 ?auto_179990 ) ) ( not ( = ?auto_179985 ?auto_179988 ) ) ( not ( = ?auto_179985 ?auto_179986 ) ) ( not ( = ?auto_179985 ?auto_179991 ) ) ( not ( = ?auto_179989 ?auto_179990 ) ) ( not ( = ?auto_179989 ?auto_179988 ) ) ( not ( = ?auto_179989 ?auto_179986 ) ) ( not ( = ?auto_179989 ?auto_179991 ) ) ( not ( = ?auto_179987 ?auto_179990 ) ) ( not ( = ?auto_179987 ?auto_179988 ) ) ( not ( = ?auto_179987 ?auto_179986 ) ) ( not ( = ?auto_179987 ?auto_179991 ) ) ( ON ?auto_179992 ?auto_179987 ) ( CLEAR ?auto_179992 ) ( HOLDING ?auto_179990 ) ( CLEAR ?auto_179991 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179988 ?auto_179986 ?auto_179991 ?auto_179990 )
      ( MAKE-1PILE ?auto_179985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_179993 - BLOCK
    )
    :vars
    (
      ?auto_179998 - BLOCK
      ?auto_179995 - BLOCK
      ?auto_179997 - BLOCK
      ?auto_179994 - BLOCK
      ?auto_179996 - BLOCK
      ?auto_179999 - BLOCK
      ?auto_180000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179998 ?auto_179993 ) ( ON-TABLE ?auto_179993 ) ( not ( = ?auto_179993 ?auto_179998 ) ) ( not ( = ?auto_179993 ?auto_179995 ) ) ( not ( = ?auto_179993 ?auto_179997 ) ) ( not ( = ?auto_179998 ?auto_179995 ) ) ( not ( = ?auto_179998 ?auto_179997 ) ) ( not ( = ?auto_179995 ?auto_179997 ) ) ( ON ?auto_179995 ?auto_179998 ) ( ON-TABLE ?auto_179994 ) ( ON ?auto_179996 ?auto_179994 ) ( ON ?auto_179999 ?auto_179996 ) ( not ( = ?auto_179994 ?auto_179996 ) ) ( not ( = ?auto_179994 ?auto_179999 ) ) ( not ( = ?auto_179994 ?auto_180000 ) ) ( not ( = ?auto_179994 ?auto_179997 ) ) ( not ( = ?auto_179996 ?auto_179999 ) ) ( not ( = ?auto_179996 ?auto_180000 ) ) ( not ( = ?auto_179996 ?auto_179997 ) ) ( not ( = ?auto_179999 ?auto_180000 ) ) ( not ( = ?auto_179999 ?auto_179997 ) ) ( not ( = ?auto_180000 ?auto_179997 ) ) ( not ( = ?auto_179993 ?auto_180000 ) ) ( not ( = ?auto_179993 ?auto_179994 ) ) ( not ( = ?auto_179993 ?auto_179996 ) ) ( not ( = ?auto_179993 ?auto_179999 ) ) ( not ( = ?auto_179998 ?auto_180000 ) ) ( not ( = ?auto_179998 ?auto_179994 ) ) ( not ( = ?auto_179998 ?auto_179996 ) ) ( not ( = ?auto_179998 ?auto_179999 ) ) ( not ( = ?auto_179995 ?auto_180000 ) ) ( not ( = ?auto_179995 ?auto_179994 ) ) ( not ( = ?auto_179995 ?auto_179996 ) ) ( not ( = ?auto_179995 ?auto_179999 ) ) ( ON ?auto_179997 ?auto_179995 ) ( CLEAR ?auto_179999 ) ( ON ?auto_180000 ?auto_179997 ) ( CLEAR ?auto_180000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179993 ?auto_179998 ?auto_179995 ?auto_179997 )
      ( MAKE-1PILE ?auto_179993 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180001 - BLOCK
    )
    :vars
    (
      ?auto_180008 - BLOCK
      ?auto_180004 - BLOCK
      ?auto_180003 - BLOCK
      ?auto_180005 - BLOCK
      ?auto_180006 - BLOCK
      ?auto_180007 - BLOCK
      ?auto_180002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180008 ?auto_180001 ) ( ON-TABLE ?auto_180001 ) ( not ( = ?auto_180001 ?auto_180008 ) ) ( not ( = ?auto_180001 ?auto_180004 ) ) ( not ( = ?auto_180001 ?auto_180003 ) ) ( not ( = ?auto_180008 ?auto_180004 ) ) ( not ( = ?auto_180008 ?auto_180003 ) ) ( not ( = ?auto_180004 ?auto_180003 ) ) ( ON ?auto_180004 ?auto_180008 ) ( ON-TABLE ?auto_180005 ) ( ON ?auto_180006 ?auto_180005 ) ( not ( = ?auto_180005 ?auto_180006 ) ) ( not ( = ?auto_180005 ?auto_180007 ) ) ( not ( = ?auto_180005 ?auto_180002 ) ) ( not ( = ?auto_180005 ?auto_180003 ) ) ( not ( = ?auto_180006 ?auto_180007 ) ) ( not ( = ?auto_180006 ?auto_180002 ) ) ( not ( = ?auto_180006 ?auto_180003 ) ) ( not ( = ?auto_180007 ?auto_180002 ) ) ( not ( = ?auto_180007 ?auto_180003 ) ) ( not ( = ?auto_180002 ?auto_180003 ) ) ( not ( = ?auto_180001 ?auto_180002 ) ) ( not ( = ?auto_180001 ?auto_180005 ) ) ( not ( = ?auto_180001 ?auto_180006 ) ) ( not ( = ?auto_180001 ?auto_180007 ) ) ( not ( = ?auto_180008 ?auto_180002 ) ) ( not ( = ?auto_180008 ?auto_180005 ) ) ( not ( = ?auto_180008 ?auto_180006 ) ) ( not ( = ?auto_180008 ?auto_180007 ) ) ( not ( = ?auto_180004 ?auto_180002 ) ) ( not ( = ?auto_180004 ?auto_180005 ) ) ( not ( = ?auto_180004 ?auto_180006 ) ) ( not ( = ?auto_180004 ?auto_180007 ) ) ( ON ?auto_180003 ?auto_180004 ) ( ON ?auto_180002 ?auto_180003 ) ( CLEAR ?auto_180002 ) ( HOLDING ?auto_180007 ) ( CLEAR ?auto_180006 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180005 ?auto_180006 ?auto_180007 )
      ( MAKE-1PILE ?auto_180001 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180009 - BLOCK
    )
    :vars
    (
      ?auto_180011 - BLOCK
      ?auto_180012 - BLOCK
      ?auto_180010 - BLOCK
      ?auto_180015 - BLOCK
      ?auto_180013 - BLOCK
      ?auto_180016 - BLOCK
      ?auto_180014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180011 ?auto_180009 ) ( ON-TABLE ?auto_180009 ) ( not ( = ?auto_180009 ?auto_180011 ) ) ( not ( = ?auto_180009 ?auto_180012 ) ) ( not ( = ?auto_180009 ?auto_180010 ) ) ( not ( = ?auto_180011 ?auto_180012 ) ) ( not ( = ?auto_180011 ?auto_180010 ) ) ( not ( = ?auto_180012 ?auto_180010 ) ) ( ON ?auto_180012 ?auto_180011 ) ( ON-TABLE ?auto_180015 ) ( ON ?auto_180013 ?auto_180015 ) ( not ( = ?auto_180015 ?auto_180013 ) ) ( not ( = ?auto_180015 ?auto_180016 ) ) ( not ( = ?auto_180015 ?auto_180014 ) ) ( not ( = ?auto_180015 ?auto_180010 ) ) ( not ( = ?auto_180013 ?auto_180016 ) ) ( not ( = ?auto_180013 ?auto_180014 ) ) ( not ( = ?auto_180013 ?auto_180010 ) ) ( not ( = ?auto_180016 ?auto_180014 ) ) ( not ( = ?auto_180016 ?auto_180010 ) ) ( not ( = ?auto_180014 ?auto_180010 ) ) ( not ( = ?auto_180009 ?auto_180014 ) ) ( not ( = ?auto_180009 ?auto_180015 ) ) ( not ( = ?auto_180009 ?auto_180013 ) ) ( not ( = ?auto_180009 ?auto_180016 ) ) ( not ( = ?auto_180011 ?auto_180014 ) ) ( not ( = ?auto_180011 ?auto_180015 ) ) ( not ( = ?auto_180011 ?auto_180013 ) ) ( not ( = ?auto_180011 ?auto_180016 ) ) ( not ( = ?auto_180012 ?auto_180014 ) ) ( not ( = ?auto_180012 ?auto_180015 ) ) ( not ( = ?auto_180012 ?auto_180013 ) ) ( not ( = ?auto_180012 ?auto_180016 ) ) ( ON ?auto_180010 ?auto_180012 ) ( ON ?auto_180014 ?auto_180010 ) ( CLEAR ?auto_180013 ) ( ON ?auto_180016 ?auto_180014 ) ( CLEAR ?auto_180016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180009 ?auto_180011 ?auto_180012 ?auto_180010 ?auto_180014 )
      ( MAKE-1PILE ?auto_180009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180017 - BLOCK
    )
    :vars
    (
      ?auto_180024 - BLOCK
      ?auto_180018 - BLOCK
      ?auto_180023 - BLOCK
      ?auto_180022 - BLOCK
      ?auto_180019 - BLOCK
      ?auto_180021 - BLOCK
      ?auto_180020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180024 ?auto_180017 ) ( ON-TABLE ?auto_180017 ) ( not ( = ?auto_180017 ?auto_180024 ) ) ( not ( = ?auto_180017 ?auto_180018 ) ) ( not ( = ?auto_180017 ?auto_180023 ) ) ( not ( = ?auto_180024 ?auto_180018 ) ) ( not ( = ?auto_180024 ?auto_180023 ) ) ( not ( = ?auto_180018 ?auto_180023 ) ) ( ON ?auto_180018 ?auto_180024 ) ( ON-TABLE ?auto_180022 ) ( not ( = ?auto_180022 ?auto_180019 ) ) ( not ( = ?auto_180022 ?auto_180021 ) ) ( not ( = ?auto_180022 ?auto_180020 ) ) ( not ( = ?auto_180022 ?auto_180023 ) ) ( not ( = ?auto_180019 ?auto_180021 ) ) ( not ( = ?auto_180019 ?auto_180020 ) ) ( not ( = ?auto_180019 ?auto_180023 ) ) ( not ( = ?auto_180021 ?auto_180020 ) ) ( not ( = ?auto_180021 ?auto_180023 ) ) ( not ( = ?auto_180020 ?auto_180023 ) ) ( not ( = ?auto_180017 ?auto_180020 ) ) ( not ( = ?auto_180017 ?auto_180022 ) ) ( not ( = ?auto_180017 ?auto_180019 ) ) ( not ( = ?auto_180017 ?auto_180021 ) ) ( not ( = ?auto_180024 ?auto_180020 ) ) ( not ( = ?auto_180024 ?auto_180022 ) ) ( not ( = ?auto_180024 ?auto_180019 ) ) ( not ( = ?auto_180024 ?auto_180021 ) ) ( not ( = ?auto_180018 ?auto_180020 ) ) ( not ( = ?auto_180018 ?auto_180022 ) ) ( not ( = ?auto_180018 ?auto_180019 ) ) ( not ( = ?auto_180018 ?auto_180021 ) ) ( ON ?auto_180023 ?auto_180018 ) ( ON ?auto_180020 ?auto_180023 ) ( ON ?auto_180021 ?auto_180020 ) ( CLEAR ?auto_180021 ) ( HOLDING ?auto_180019 ) ( CLEAR ?auto_180022 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180022 ?auto_180019 )
      ( MAKE-1PILE ?auto_180017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180025 - BLOCK
    )
    :vars
    (
      ?auto_180028 - BLOCK
      ?auto_180031 - BLOCK
      ?auto_180029 - BLOCK
      ?auto_180032 - BLOCK
      ?auto_180030 - BLOCK
      ?auto_180027 - BLOCK
      ?auto_180026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180028 ?auto_180025 ) ( ON-TABLE ?auto_180025 ) ( not ( = ?auto_180025 ?auto_180028 ) ) ( not ( = ?auto_180025 ?auto_180031 ) ) ( not ( = ?auto_180025 ?auto_180029 ) ) ( not ( = ?auto_180028 ?auto_180031 ) ) ( not ( = ?auto_180028 ?auto_180029 ) ) ( not ( = ?auto_180031 ?auto_180029 ) ) ( ON ?auto_180031 ?auto_180028 ) ( ON-TABLE ?auto_180032 ) ( not ( = ?auto_180032 ?auto_180030 ) ) ( not ( = ?auto_180032 ?auto_180027 ) ) ( not ( = ?auto_180032 ?auto_180026 ) ) ( not ( = ?auto_180032 ?auto_180029 ) ) ( not ( = ?auto_180030 ?auto_180027 ) ) ( not ( = ?auto_180030 ?auto_180026 ) ) ( not ( = ?auto_180030 ?auto_180029 ) ) ( not ( = ?auto_180027 ?auto_180026 ) ) ( not ( = ?auto_180027 ?auto_180029 ) ) ( not ( = ?auto_180026 ?auto_180029 ) ) ( not ( = ?auto_180025 ?auto_180026 ) ) ( not ( = ?auto_180025 ?auto_180032 ) ) ( not ( = ?auto_180025 ?auto_180030 ) ) ( not ( = ?auto_180025 ?auto_180027 ) ) ( not ( = ?auto_180028 ?auto_180026 ) ) ( not ( = ?auto_180028 ?auto_180032 ) ) ( not ( = ?auto_180028 ?auto_180030 ) ) ( not ( = ?auto_180028 ?auto_180027 ) ) ( not ( = ?auto_180031 ?auto_180026 ) ) ( not ( = ?auto_180031 ?auto_180032 ) ) ( not ( = ?auto_180031 ?auto_180030 ) ) ( not ( = ?auto_180031 ?auto_180027 ) ) ( ON ?auto_180029 ?auto_180031 ) ( ON ?auto_180026 ?auto_180029 ) ( ON ?auto_180027 ?auto_180026 ) ( CLEAR ?auto_180032 ) ( ON ?auto_180030 ?auto_180027 ) ( CLEAR ?auto_180030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180025 ?auto_180028 ?auto_180031 ?auto_180029 ?auto_180026 ?auto_180027 )
      ( MAKE-1PILE ?auto_180025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180033 - BLOCK
    )
    :vars
    (
      ?auto_180039 - BLOCK
      ?auto_180036 - BLOCK
      ?auto_180040 - BLOCK
      ?auto_180038 - BLOCK
      ?auto_180037 - BLOCK
      ?auto_180034 - BLOCK
      ?auto_180035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180039 ?auto_180033 ) ( ON-TABLE ?auto_180033 ) ( not ( = ?auto_180033 ?auto_180039 ) ) ( not ( = ?auto_180033 ?auto_180036 ) ) ( not ( = ?auto_180033 ?auto_180040 ) ) ( not ( = ?auto_180039 ?auto_180036 ) ) ( not ( = ?auto_180039 ?auto_180040 ) ) ( not ( = ?auto_180036 ?auto_180040 ) ) ( ON ?auto_180036 ?auto_180039 ) ( not ( = ?auto_180038 ?auto_180037 ) ) ( not ( = ?auto_180038 ?auto_180034 ) ) ( not ( = ?auto_180038 ?auto_180035 ) ) ( not ( = ?auto_180038 ?auto_180040 ) ) ( not ( = ?auto_180037 ?auto_180034 ) ) ( not ( = ?auto_180037 ?auto_180035 ) ) ( not ( = ?auto_180037 ?auto_180040 ) ) ( not ( = ?auto_180034 ?auto_180035 ) ) ( not ( = ?auto_180034 ?auto_180040 ) ) ( not ( = ?auto_180035 ?auto_180040 ) ) ( not ( = ?auto_180033 ?auto_180035 ) ) ( not ( = ?auto_180033 ?auto_180038 ) ) ( not ( = ?auto_180033 ?auto_180037 ) ) ( not ( = ?auto_180033 ?auto_180034 ) ) ( not ( = ?auto_180039 ?auto_180035 ) ) ( not ( = ?auto_180039 ?auto_180038 ) ) ( not ( = ?auto_180039 ?auto_180037 ) ) ( not ( = ?auto_180039 ?auto_180034 ) ) ( not ( = ?auto_180036 ?auto_180035 ) ) ( not ( = ?auto_180036 ?auto_180038 ) ) ( not ( = ?auto_180036 ?auto_180037 ) ) ( not ( = ?auto_180036 ?auto_180034 ) ) ( ON ?auto_180040 ?auto_180036 ) ( ON ?auto_180035 ?auto_180040 ) ( ON ?auto_180034 ?auto_180035 ) ( ON ?auto_180037 ?auto_180034 ) ( CLEAR ?auto_180037 ) ( HOLDING ?auto_180038 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180038 )
      ( MAKE-1PILE ?auto_180033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180050 - BLOCK
    )
    :vars
    (
      ?auto_180052 - BLOCK
      ?auto_180053 - BLOCK
      ?auto_180056 - BLOCK
      ?auto_180055 - BLOCK
      ?auto_180051 - BLOCK
      ?auto_180054 - BLOCK
      ?auto_180057 - BLOCK
      ?auto_180058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180052 ?auto_180050 ) ( ON-TABLE ?auto_180050 ) ( not ( = ?auto_180050 ?auto_180052 ) ) ( not ( = ?auto_180050 ?auto_180053 ) ) ( not ( = ?auto_180050 ?auto_180056 ) ) ( not ( = ?auto_180052 ?auto_180053 ) ) ( not ( = ?auto_180052 ?auto_180056 ) ) ( not ( = ?auto_180053 ?auto_180056 ) ) ( ON ?auto_180053 ?auto_180052 ) ( not ( = ?auto_180055 ?auto_180051 ) ) ( not ( = ?auto_180055 ?auto_180054 ) ) ( not ( = ?auto_180055 ?auto_180057 ) ) ( not ( = ?auto_180055 ?auto_180056 ) ) ( not ( = ?auto_180051 ?auto_180054 ) ) ( not ( = ?auto_180051 ?auto_180057 ) ) ( not ( = ?auto_180051 ?auto_180056 ) ) ( not ( = ?auto_180054 ?auto_180057 ) ) ( not ( = ?auto_180054 ?auto_180056 ) ) ( not ( = ?auto_180057 ?auto_180056 ) ) ( not ( = ?auto_180050 ?auto_180057 ) ) ( not ( = ?auto_180050 ?auto_180055 ) ) ( not ( = ?auto_180050 ?auto_180051 ) ) ( not ( = ?auto_180050 ?auto_180054 ) ) ( not ( = ?auto_180052 ?auto_180057 ) ) ( not ( = ?auto_180052 ?auto_180055 ) ) ( not ( = ?auto_180052 ?auto_180051 ) ) ( not ( = ?auto_180052 ?auto_180054 ) ) ( not ( = ?auto_180053 ?auto_180057 ) ) ( not ( = ?auto_180053 ?auto_180055 ) ) ( not ( = ?auto_180053 ?auto_180051 ) ) ( not ( = ?auto_180053 ?auto_180054 ) ) ( ON ?auto_180056 ?auto_180053 ) ( ON ?auto_180057 ?auto_180056 ) ( ON ?auto_180054 ?auto_180057 ) ( ON ?auto_180051 ?auto_180054 ) ( CLEAR ?auto_180051 ) ( ON ?auto_180055 ?auto_180058 ) ( CLEAR ?auto_180055 ) ( HAND-EMPTY ) ( not ( = ?auto_180050 ?auto_180058 ) ) ( not ( = ?auto_180052 ?auto_180058 ) ) ( not ( = ?auto_180053 ?auto_180058 ) ) ( not ( = ?auto_180056 ?auto_180058 ) ) ( not ( = ?auto_180055 ?auto_180058 ) ) ( not ( = ?auto_180051 ?auto_180058 ) ) ( not ( = ?auto_180054 ?auto_180058 ) ) ( not ( = ?auto_180057 ?auto_180058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180055 ?auto_180058 )
      ( MAKE-1PILE ?auto_180050 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180059 - BLOCK
    )
    :vars
    (
      ?auto_180060 - BLOCK
      ?auto_180063 - BLOCK
      ?auto_180062 - BLOCK
      ?auto_180064 - BLOCK
      ?auto_180061 - BLOCK
      ?auto_180066 - BLOCK
      ?auto_180065 - BLOCK
      ?auto_180067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180060 ?auto_180059 ) ( ON-TABLE ?auto_180059 ) ( not ( = ?auto_180059 ?auto_180060 ) ) ( not ( = ?auto_180059 ?auto_180063 ) ) ( not ( = ?auto_180059 ?auto_180062 ) ) ( not ( = ?auto_180060 ?auto_180063 ) ) ( not ( = ?auto_180060 ?auto_180062 ) ) ( not ( = ?auto_180063 ?auto_180062 ) ) ( ON ?auto_180063 ?auto_180060 ) ( not ( = ?auto_180064 ?auto_180061 ) ) ( not ( = ?auto_180064 ?auto_180066 ) ) ( not ( = ?auto_180064 ?auto_180065 ) ) ( not ( = ?auto_180064 ?auto_180062 ) ) ( not ( = ?auto_180061 ?auto_180066 ) ) ( not ( = ?auto_180061 ?auto_180065 ) ) ( not ( = ?auto_180061 ?auto_180062 ) ) ( not ( = ?auto_180066 ?auto_180065 ) ) ( not ( = ?auto_180066 ?auto_180062 ) ) ( not ( = ?auto_180065 ?auto_180062 ) ) ( not ( = ?auto_180059 ?auto_180065 ) ) ( not ( = ?auto_180059 ?auto_180064 ) ) ( not ( = ?auto_180059 ?auto_180061 ) ) ( not ( = ?auto_180059 ?auto_180066 ) ) ( not ( = ?auto_180060 ?auto_180065 ) ) ( not ( = ?auto_180060 ?auto_180064 ) ) ( not ( = ?auto_180060 ?auto_180061 ) ) ( not ( = ?auto_180060 ?auto_180066 ) ) ( not ( = ?auto_180063 ?auto_180065 ) ) ( not ( = ?auto_180063 ?auto_180064 ) ) ( not ( = ?auto_180063 ?auto_180061 ) ) ( not ( = ?auto_180063 ?auto_180066 ) ) ( ON ?auto_180062 ?auto_180063 ) ( ON ?auto_180065 ?auto_180062 ) ( ON ?auto_180066 ?auto_180065 ) ( ON ?auto_180064 ?auto_180067 ) ( CLEAR ?auto_180064 ) ( not ( = ?auto_180059 ?auto_180067 ) ) ( not ( = ?auto_180060 ?auto_180067 ) ) ( not ( = ?auto_180063 ?auto_180067 ) ) ( not ( = ?auto_180062 ?auto_180067 ) ) ( not ( = ?auto_180064 ?auto_180067 ) ) ( not ( = ?auto_180061 ?auto_180067 ) ) ( not ( = ?auto_180066 ?auto_180067 ) ) ( not ( = ?auto_180065 ?auto_180067 ) ) ( HOLDING ?auto_180061 ) ( CLEAR ?auto_180066 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180059 ?auto_180060 ?auto_180063 ?auto_180062 ?auto_180065 ?auto_180066 ?auto_180061 )
      ( MAKE-1PILE ?auto_180059 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180068 - BLOCK
    )
    :vars
    (
      ?auto_180069 - BLOCK
      ?auto_180075 - BLOCK
      ?auto_180076 - BLOCK
      ?auto_180071 - BLOCK
      ?auto_180073 - BLOCK
      ?auto_180070 - BLOCK
      ?auto_180074 - BLOCK
      ?auto_180072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180069 ?auto_180068 ) ( ON-TABLE ?auto_180068 ) ( not ( = ?auto_180068 ?auto_180069 ) ) ( not ( = ?auto_180068 ?auto_180075 ) ) ( not ( = ?auto_180068 ?auto_180076 ) ) ( not ( = ?auto_180069 ?auto_180075 ) ) ( not ( = ?auto_180069 ?auto_180076 ) ) ( not ( = ?auto_180075 ?auto_180076 ) ) ( ON ?auto_180075 ?auto_180069 ) ( not ( = ?auto_180071 ?auto_180073 ) ) ( not ( = ?auto_180071 ?auto_180070 ) ) ( not ( = ?auto_180071 ?auto_180074 ) ) ( not ( = ?auto_180071 ?auto_180076 ) ) ( not ( = ?auto_180073 ?auto_180070 ) ) ( not ( = ?auto_180073 ?auto_180074 ) ) ( not ( = ?auto_180073 ?auto_180076 ) ) ( not ( = ?auto_180070 ?auto_180074 ) ) ( not ( = ?auto_180070 ?auto_180076 ) ) ( not ( = ?auto_180074 ?auto_180076 ) ) ( not ( = ?auto_180068 ?auto_180074 ) ) ( not ( = ?auto_180068 ?auto_180071 ) ) ( not ( = ?auto_180068 ?auto_180073 ) ) ( not ( = ?auto_180068 ?auto_180070 ) ) ( not ( = ?auto_180069 ?auto_180074 ) ) ( not ( = ?auto_180069 ?auto_180071 ) ) ( not ( = ?auto_180069 ?auto_180073 ) ) ( not ( = ?auto_180069 ?auto_180070 ) ) ( not ( = ?auto_180075 ?auto_180074 ) ) ( not ( = ?auto_180075 ?auto_180071 ) ) ( not ( = ?auto_180075 ?auto_180073 ) ) ( not ( = ?auto_180075 ?auto_180070 ) ) ( ON ?auto_180076 ?auto_180075 ) ( ON ?auto_180074 ?auto_180076 ) ( ON ?auto_180070 ?auto_180074 ) ( ON ?auto_180071 ?auto_180072 ) ( not ( = ?auto_180068 ?auto_180072 ) ) ( not ( = ?auto_180069 ?auto_180072 ) ) ( not ( = ?auto_180075 ?auto_180072 ) ) ( not ( = ?auto_180076 ?auto_180072 ) ) ( not ( = ?auto_180071 ?auto_180072 ) ) ( not ( = ?auto_180073 ?auto_180072 ) ) ( not ( = ?auto_180070 ?auto_180072 ) ) ( not ( = ?auto_180074 ?auto_180072 ) ) ( CLEAR ?auto_180070 ) ( ON ?auto_180073 ?auto_180071 ) ( CLEAR ?auto_180073 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180072 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180072 ?auto_180071 )
      ( MAKE-1PILE ?auto_180068 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180077 - BLOCK
    )
    :vars
    (
      ?auto_180085 - BLOCK
      ?auto_180082 - BLOCK
      ?auto_180078 - BLOCK
      ?auto_180080 - BLOCK
      ?auto_180083 - BLOCK
      ?auto_180081 - BLOCK
      ?auto_180079 - BLOCK
      ?auto_180084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180085 ?auto_180077 ) ( ON-TABLE ?auto_180077 ) ( not ( = ?auto_180077 ?auto_180085 ) ) ( not ( = ?auto_180077 ?auto_180082 ) ) ( not ( = ?auto_180077 ?auto_180078 ) ) ( not ( = ?auto_180085 ?auto_180082 ) ) ( not ( = ?auto_180085 ?auto_180078 ) ) ( not ( = ?auto_180082 ?auto_180078 ) ) ( ON ?auto_180082 ?auto_180085 ) ( not ( = ?auto_180080 ?auto_180083 ) ) ( not ( = ?auto_180080 ?auto_180081 ) ) ( not ( = ?auto_180080 ?auto_180079 ) ) ( not ( = ?auto_180080 ?auto_180078 ) ) ( not ( = ?auto_180083 ?auto_180081 ) ) ( not ( = ?auto_180083 ?auto_180079 ) ) ( not ( = ?auto_180083 ?auto_180078 ) ) ( not ( = ?auto_180081 ?auto_180079 ) ) ( not ( = ?auto_180081 ?auto_180078 ) ) ( not ( = ?auto_180079 ?auto_180078 ) ) ( not ( = ?auto_180077 ?auto_180079 ) ) ( not ( = ?auto_180077 ?auto_180080 ) ) ( not ( = ?auto_180077 ?auto_180083 ) ) ( not ( = ?auto_180077 ?auto_180081 ) ) ( not ( = ?auto_180085 ?auto_180079 ) ) ( not ( = ?auto_180085 ?auto_180080 ) ) ( not ( = ?auto_180085 ?auto_180083 ) ) ( not ( = ?auto_180085 ?auto_180081 ) ) ( not ( = ?auto_180082 ?auto_180079 ) ) ( not ( = ?auto_180082 ?auto_180080 ) ) ( not ( = ?auto_180082 ?auto_180083 ) ) ( not ( = ?auto_180082 ?auto_180081 ) ) ( ON ?auto_180078 ?auto_180082 ) ( ON ?auto_180079 ?auto_180078 ) ( ON ?auto_180080 ?auto_180084 ) ( not ( = ?auto_180077 ?auto_180084 ) ) ( not ( = ?auto_180085 ?auto_180084 ) ) ( not ( = ?auto_180082 ?auto_180084 ) ) ( not ( = ?auto_180078 ?auto_180084 ) ) ( not ( = ?auto_180080 ?auto_180084 ) ) ( not ( = ?auto_180083 ?auto_180084 ) ) ( not ( = ?auto_180081 ?auto_180084 ) ) ( not ( = ?auto_180079 ?auto_180084 ) ) ( ON ?auto_180083 ?auto_180080 ) ( CLEAR ?auto_180083 ) ( ON-TABLE ?auto_180084 ) ( HOLDING ?auto_180081 ) ( CLEAR ?auto_180079 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180077 ?auto_180085 ?auto_180082 ?auto_180078 ?auto_180079 ?auto_180081 )
      ( MAKE-1PILE ?auto_180077 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180086 - BLOCK
    )
    :vars
    (
      ?auto_180093 - BLOCK
      ?auto_180089 - BLOCK
      ?auto_180094 - BLOCK
      ?auto_180090 - BLOCK
      ?auto_180087 - BLOCK
      ?auto_180088 - BLOCK
      ?auto_180092 - BLOCK
      ?auto_180091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180093 ?auto_180086 ) ( ON-TABLE ?auto_180086 ) ( not ( = ?auto_180086 ?auto_180093 ) ) ( not ( = ?auto_180086 ?auto_180089 ) ) ( not ( = ?auto_180086 ?auto_180094 ) ) ( not ( = ?auto_180093 ?auto_180089 ) ) ( not ( = ?auto_180093 ?auto_180094 ) ) ( not ( = ?auto_180089 ?auto_180094 ) ) ( ON ?auto_180089 ?auto_180093 ) ( not ( = ?auto_180090 ?auto_180087 ) ) ( not ( = ?auto_180090 ?auto_180088 ) ) ( not ( = ?auto_180090 ?auto_180092 ) ) ( not ( = ?auto_180090 ?auto_180094 ) ) ( not ( = ?auto_180087 ?auto_180088 ) ) ( not ( = ?auto_180087 ?auto_180092 ) ) ( not ( = ?auto_180087 ?auto_180094 ) ) ( not ( = ?auto_180088 ?auto_180092 ) ) ( not ( = ?auto_180088 ?auto_180094 ) ) ( not ( = ?auto_180092 ?auto_180094 ) ) ( not ( = ?auto_180086 ?auto_180092 ) ) ( not ( = ?auto_180086 ?auto_180090 ) ) ( not ( = ?auto_180086 ?auto_180087 ) ) ( not ( = ?auto_180086 ?auto_180088 ) ) ( not ( = ?auto_180093 ?auto_180092 ) ) ( not ( = ?auto_180093 ?auto_180090 ) ) ( not ( = ?auto_180093 ?auto_180087 ) ) ( not ( = ?auto_180093 ?auto_180088 ) ) ( not ( = ?auto_180089 ?auto_180092 ) ) ( not ( = ?auto_180089 ?auto_180090 ) ) ( not ( = ?auto_180089 ?auto_180087 ) ) ( not ( = ?auto_180089 ?auto_180088 ) ) ( ON ?auto_180094 ?auto_180089 ) ( ON ?auto_180092 ?auto_180094 ) ( ON ?auto_180090 ?auto_180091 ) ( not ( = ?auto_180086 ?auto_180091 ) ) ( not ( = ?auto_180093 ?auto_180091 ) ) ( not ( = ?auto_180089 ?auto_180091 ) ) ( not ( = ?auto_180094 ?auto_180091 ) ) ( not ( = ?auto_180090 ?auto_180091 ) ) ( not ( = ?auto_180087 ?auto_180091 ) ) ( not ( = ?auto_180088 ?auto_180091 ) ) ( not ( = ?auto_180092 ?auto_180091 ) ) ( ON ?auto_180087 ?auto_180090 ) ( ON-TABLE ?auto_180091 ) ( CLEAR ?auto_180092 ) ( ON ?auto_180088 ?auto_180087 ) ( CLEAR ?auto_180088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180091 ?auto_180090 ?auto_180087 )
      ( MAKE-1PILE ?auto_180086 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180138 - BLOCK
      ?auto_180139 - BLOCK
      ?auto_180140 - BLOCK
      ?auto_180141 - BLOCK
      ?auto_180142 - BLOCK
      ?auto_180143 - BLOCK
      ?auto_180144 - BLOCK
    )
    :vars
    (
      ?auto_180145 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180138 ) ( ON ?auto_180139 ?auto_180138 ) ( ON ?auto_180140 ?auto_180139 ) ( ON ?auto_180141 ?auto_180140 ) ( ON ?auto_180142 ?auto_180141 ) ( not ( = ?auto_180138 ?auto_180139 ) ) ( not ( = ?auto_180138 ?auto_180140 ) ) ( not ( = ?auto_180138 ?auto_180141 ) ) ( not ( = ?auto_180138 ?auto_180142 ) ) ( not ( = ?auto_180138 ?auto_180143 ) ) ( not ( = ?auto_180138 ?auto_180144 ) ) ( not ( = ?auto_180139 ?auto_180140 ) ) ( not ( = ?auto_180139 ?auto_180141 ) ) ( not ( = ?auto_180139 ?auto_180142 ) ) ( not ( = ?auto_180139 ?auto_180143 ) ) ( not ( = ?auto_180139 ?auto_180144 ) ) ( not ( = ?auto_180140 ?auto_180141 ) ) ( not ( = ?auto_180140 ?auto_180142 ) ) ( not ( = ?auto_180140 ?auto_180143 ) ) ( not ( = ?auto_180140 ?auto_180144 ) ) ( not ( = ?auto_180141 ?auto_180142 ) ) ( not ( = ?auto_180141 ?auto_180143 ) ) ( not ( = ?auto_180141 ?auto_180144 ) ) ( not ( = ?auto_180142 ?auto_180143 ) ) ( not ( = ?auto_180142 ?auto_180144 ) ) ( not ( = ?auto_180143 ?auto_180144 ) ) ( ON ?auto_180144 ?auto_180145 ) ( not ( = ?auto_180138 ?auto_180145 ) ) ( not ( = ?auto_180139 ?auto_180145 ) ) ( not ( = ?auto_180140 ?auto_180145 ) ) ( not ( = ?auto_180141 ?auto_180145 ) ) ( not ( = ?auto_180142 ?auto_180145 ) ) ( not ( = ?auto_180143 ?auto_180145 ) ) ( not ( = ?auto_180144 ?auto_180145 ) ) ( CLEAR ?auto_180142 ) ( ON ?auto_180143 ?auto_180144 ) ( CLEAR ?auto_180143 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180145 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180145 ?auto_180144 )
      ( MAKE-7PILE ?auto_180138 ?auto_180139 ?auto_180140 ?auto_180141 ?auto_180142 ?auto_180143 ?auto_180144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180146 - BLOCK
      ?auto_180147 - BLOCK
      ?auto_180148 - BLOCK
      ?auto_180149 - BLOCK
      ?auto_180150 - BLOCK
      ?auto_180151 - BLOCK
      ?auto_180152 - BLOCK
    )
    :vars
    (
      ?auto_180153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180146 ) ( ON ?auto_180147 ?auto_180146 ) ( ON ?auto_180148 ?auto_180147 ) ( ON ?auto_180149 ?auto_180148 ) ( not ( = ?auto_180146 ?auto_180147 ) ) ( not ( = ?auto_180146 ?auto_180148 ) ) ( not ( = ?auto_180146 ?auto_180149 ) ) ( not ( = ?auto_180146 ?auto_180150 ) ) ( not ( = ?auto_180146 ?auto_180151 ) ) ( not ( = ?auto_180146 ?auto_180152 ) ) ( not ( = ?auto_180147 ?auto_180148 ) ) ( not ( = ?auto_180147 ?auto_180149 ) ) ( not ( = ?auto_180147 ?auto_180150 ) ) ( not ( = ?auto_180147 ?auto_180151 ) ) ( not ( = ?auto_180147 ?auto_180152 ) ) ( not ( = ?auto_180148 ?auto_180149 ) ) ( not ( = ?auto_180148 ?auto_180150 ) ) ( not ( = ?auto_180148 ?auto_180151 ) ) ( not ( = ?auto_180148 ?auto_180152 ) ) ( not ( = ?auto_180149 ?auto_180150 ) ) ( not ( = ?auto_180149 ?auto_180151 ) ) ( not ( = ?auto_180149 ?auto_180152 ) ) ( not ( = ?auto_180150 ?auto_180151 ) ) ( not ( = ?auto_180150 ?auto_180152 ) ) ( not ( = ?auto_180151 ?auto_180152 ) ) ( ON ?auto_180152 ?auto_180153 ) ( not ( = ?auto_180146 ?auto_180153 ) ) ( not ( = ?auto_180147 ?auto_180153 ) ) ( not ( = ?auto_180148 ?auto_180153 ) ) ( not ( = ?auto_180149 ?auto_180153 ) ) ( not ( = ?auto_180150 ?auto_180153 ) ) ( not ( = ?auto_180151 ?auto_180153 ) ) ( not ( = ?auto_180152 ?auto_180153 ) ) ( ON ?auto_180151 ?auto_180152 ) ( CLEAR ?auto_180151 ) ( ON-TABLE ?auto_180153 ) ( HOLDING ?auto_180150 ) ( CLEAR ?auto_180149 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180146 ?auto_180147 ?auto_180148 ?auto_180149 ?auto_180150 )
      ( MAKE-7PILE ?auto_180146 ?auto_180147 ?auto_180148 ?auto_180149 ?auto_180150 ?auto_180151 ?auto_180152 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180154 - BLOCK
      ?auto_180155 - BLOCK
      ?auto_180156 - BLOCK
      ?auto_180157 - BLOCK
      ?auto_180158 - BLOCK
      ?auto_180159 - BLOCK
      ?auto_180160 - BLOCK
    )
    :vars
    (
      ?auto_180161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180154 ) ( ON ?auto_180155 ?auto_180154 ) ( ON ?auto_180156 ?auto_180155 ) ( ON ?auto_180157 ?auto_180156 ) ( not ( = ?auto_180154 ?auto_180155 ) ) ( not ( = ?auto_180154 ?auto_180156 ) ) ( not ( = ?auto_180154 ?auto_180157 ) ) ( not ( = ?auto_180154 ?auto_180158 ) ) ( not ( = ?auto_180154 ?auto_180159 ) ) ( not ( = ?auto_180154 ?auto_180160 ) ) ( not ( = ?auto_180155 ?auto_180156 ) ) ( not ( = ?auto_180155 ?auto_180157 ) ) ( not ( = ?auto_180155 ?auto_180158 ) ) ( not ( = ?auto_180155 ?auto_180159 ) ) ( not ( = ?auto_180155 ?auto_180160 ) ) ( not ( = ?auto_180156 ?auto_180157 ) ) ( not ( = ?auto_180156 ?auto_180158 ) ) ( not ( = ?auto_180156 ?auto_180159 ) ) ( not ( = ?auto_180156 ?auto_180160 ) ) ( not ( = ?auto_180157 ?auto_180158 ) ) ( not ( = ?auto_180157 ?auto_180159 ) ) ( not ( = ?auto_180157 ?auto_180160 ) ) ( not ( = ?auto_180158 ?auto_180159 ) ) ( not ( = ?auto_180158 ?auto_180160 ) ) ( not ( = ?auto_180159 ?auto_180160 ) ) ( ON ?auto_180160 ?auto_180161 ) ( not ( = ?auto_180154 ?auto_180161 ) ) ( not ( = ?auto_180155 ?auto_180161 ) ) ( not ( = ?auto_180156 ?auto_180161 ) ) ( not ( = ?auto_180157 ?auto_180161 ) ) ( not ( = ?auto_180158 ?auto_180161 ) ) ( not ( = ?auto_180159 ?auto_180161 ) ) ( not ( = ?auto_180160 ?auto_180161 ) ) ( ON ?auto_180159 ?auto_180160 ) ( ON-TABLE ?auto_180161 ) ( CLEAR ?auto_180157 ) ( ON ?auto_180158 ?auto_180159 ) ( CLEAR ?auto_180158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180161 ?auto_180160 ?auto_180159 )
      ( MAKE-7PILE ?auto_180154 ?auto_180155 ?auto_180156 ?auto_180157 ?auto_180158 ?auto_180159 ?auto_180160 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180162 - BLOCK
      ?auto_180163 - BLOCK
      ?auto_180164 - BLOCK
      ?auto_180165 - BLOCK
      ?auto_180166 - BLOCK
      ?auto_180167 - BLOCK
      ?auto_180168 - BLOCK
    )
    :vars
    (
      ?auto_180169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180162 ) ( ON ?auto_180163 ?auto_180162 ) ( ON ?auto_180164 ?auto_180163 ) ( not ( = ?auto_180162 ?auto_180163 ) ) ( not ( = ?auto_180162 ?auto_180164 ) ) ( not ( = ?auto_180162 ?auto_180165 ) ) ( not ( = ?auto_180162 ?auto_180166 ) ) ( not ( = ?auto_180162 ?auto_180167 ) ) ( not ( = ?auto_180162 ?auto_180168 ) ) ( not ( = ?auto_180163 ?auto_180164 ) ) ( not ( = ?auto_180163 ?auto_180165 ) ) ( not ( = ?auto_180163 ?auto_180166 ) ) ( not ( = ?auto_180163 ?auto_180167 ) ) ( not ( = ?auto_180163 ?auto_180168 ) ) ( not ( = ?auto_180164 ?auto_180165 ) ) ( not ( = ?auto_180164 ?auto_180166 ) ) ( not ( = ?auto_180164 ?auto_180167 ) ) ( not ( = ?auto_180164 ?auto_180168 ) ) ( not ( = ?auto_180165 ?auto_180166 ) ) ( not ( = ?auto_180165 ?auto_180167 ) ) ( not ( = ?auto_180165 ?auto_180168 ) ) ( not ( = ?auto_180166 ?auto_180167 ) ) ( not ( = ?auto_180166 ?auto_180168 ) ) ( not ( = ?auto_180167 ?auto_180168 ) ) ( ON ?auto_180168 ?auto_180169 ) ( not ( = ?auto_180162 ?auto_180169 ) ) ( not ( = ?auto_180163 ?auto_180169 ) ) ( not ( = ?auto_180164 ?auto_180169 ) ) ( not ( = ?auto_180165 ?auto_180169 ) ) ( not ( = ?auto_180166 ?auto_180169 ) ) ( not ( = ?auto_180167 ?auto_180169 ) ) ( not ( = ?auto_180168 ?auto_180169 ) ) ( ON ?auto_180167 ?auto_180168 ) ( ON-TABLE ?auto_180169 ) ( ON ?auto_180166 ?auto_180167 ) ( CLEAR ?auto_180166 ) ( HOLDING ?auto_180165 ) ( CLEAR ?auto_180164 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180162 ?auto_180163 ?auto_180164 ?auto_180165 )
      ( MAKE-7PILE ?auto_180162 ?auto_180163 ?auto_180164 ?auto_180165 ?auto_180166 ?auto_180167 ?auto_180168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180170 - BLOCK
      ?auto_180171 - BLOCK
      ?auto_180172 - BLOCK
      ?auto_180173 - BLOCK
      ?auto_180174 - BLOCK
      ?auto_180175 - BLOCK
      ?auto_180176 - BLOCK
    )
    :vars
    (
      ?auto_180177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180170 ) ( ON ?auto_180171 ?auto_180170 ) ( ON ?auto_180172 ?auto_180171 ) ( not ( = ?auto_180170 ?auto_180171 ) ) ( not ( = ?auto_180170 ?auto_180172 ) ) ( not ( = ?auto_180170 ?auto_180173 ) ) ( not ( = ?auto_180170 ?auto_180174 ) ) ( not ( = ?auto_180170 ?auto_180175 ) ) ( not ( = ?auto_180170 ?auto_180176 ) ) ( not ( = ?auto_180171 ?auto_180172 ) ) ( not ( = ?auto_180171 ?auto_180173 ) ) ( not ( = ?auto_180171 ?auto_180174 ) ) ( not ( = ?auto_180171 ?auto_180175 ) ) ( not ( = ?auto_180171 ?auto_180176 ) ) ( not ( = ?auto_180172 ?auto_180173 ) ) ( not ( = ?auto_180172 ?auto_180174 ) ) ( not ( = ?auto_180172 ?auto_180175 ) ) ( not ( = ?auto_180172 ?auto_180176 ) ) ( not ( = ?auto_180173 ?auto_180174 ) ) ( not ( = ?auto_180173 ?auto_180175 ) ) ( not ( = ?auto_180173 ?auto_180176 ) ) ( not ( = ?auto_180174 ?auto_180175 ) ) ( not ( = ?auto_180174 ?auto_180176 ) ) ( not ( = ?auto_180175 ?auto_180176 ) ) ( ON ?auto_180176 ?auto_180177 ) ( not ( = ?auto_180170 ?auto_180177 ) ) ( not ( = ?auto_180171 ?auto_180177 ) ) ( not ( = ?auto_180172 ?auto_180177 ) ) ( not ( = ?auto_180173 ?auto_180177 ) ) ( not ( = ?auto_180174 ?auto_180177 ) ) ( not ( = ?auto_180175 ?auto_180177 ) ) ( not ( = ?auto_180176 ?auto_180177 ) ) ( ON ?auto_180175 ?auto_180176 ) ( ON-TABLE ?auto_180177 ) ( ON ?auto_180174 ?auto_180175 ) ( CLEAR ?auto_180172 ) ( ON ?auto_180173 ?auto_180174 ) ( CLEAR ?auto_180173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180177 ?auto_180176 ?auto_180175 ?auto_180174 )
      ( MAKE-7PILE ?auto_180170 ?auto_180171 ?auto_180172 ?auto_180173 ?auto_180174 ?auto_180175 ?auto_180176 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180178 - BLOCK
      ?auto_180179 - BLOCK
      ?auto_180180 - BLOCK
      ?auto_180181 - BLOCK
      ?auto_180182 - BLOCK
      ?auto_180183 - BLOCK
      ?auto_180184 - BLOCK
    )
    :vars
    (
      ?auto_180185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180178 ) ( ON ?auto_180179 ?auto_180178 ) ( not ( = ?auto_180178 ?auto_180179 ) ) ( not ( = ?auto_180178 ?auto_180180 ) ) ( not ( = ?auto_180178 ?auto_180181 ) ) ( not ( = ?auto_180178 ?auto_180182 ) ) ( not ( = ?auto_180178 ?auto_180183 ) ) ( not ( = ?auto_180178 ?auto_180184 ) ) ( not ( = ?auto_180179 ?auto_180180 ) ) ( not ( = ?auto_180179 ?auto_180181 ) ) ( not ( = ?auto_180179 ?auto_180182 ) ) ( not ( = ?auto_180179 ?auto_180183 ) ) ( not ( = ?auto_180179 ?auto_180184 ) ) ( not ( = ?auto_180180 ?auto_180181 ) ) ( not ( = ?auto_180180 ?auto_180182 ) ) ( not ( = ?auto_180180 ?auto_180183 ) ) ( not ( = ?auto_180180 ?auto_180184 ) ) ( not ( = ?auto_180181 ?auto_180182 ) ) ( not ( = ?auto_180181 ?auto_180183 ) ) ( not ( = ?auto_180181 ?auto_180184 ) ) ( not ( = ?auto_180182 ?auto_180183 ) ) ( not ( = ?auto_180182 ?auto_180184 ) ) ( not ( = ?auto_180183 ?auto_180184 ) ) ( ON ?auto_180184 ?auto_180185 ) ( not ( = ?auto_180178 ?auto_180185 ) ) ( not ( = ?auto_180179 ?auto_180185 ) ) ( not ( = ?auto_180180 ?auto_180185 ) ) ( not ( = ?auto_180181 ?auto_180185 ) ) ( not ( = ?auto_180182 ?auto_180185 ) ) ( not ( = ?auto_180183 ?auto_180185 ) ) ( not ( = ?auto_180184 ?auto_180185 ) ) ( ON ?auto_180183 ?auto_180184 ) ( ON-TABLE ?auto_180185 ) ( ON ?auto_180182 ?auto_180183 ) ( ON ?auto_180181 ?auto_180182 ) ( CLEAR ?auto_180181 ) ( HOLDING ?auto_180180 ) ( CLEAR ?auto_180179 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180178 ?auto_180179 ?auto_180180 )
      ( MAKE-7PILE ?auto_180178 ?auto_180179 ?auto_180180 ?auto_180181 ?auto_180182 ?auto_180183 ?auto_180184 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180186 - BLOCK
      ?auto_180187 - BLOCK
      ?auto_180188 - BLOCK
      ?auto_180189 - BLOCK
      ?auto_180190 - BLOCK
      ?auto_180191 - BLOCK
      ?auto_180192 - BLOCK
    )
    :vars
    (
      ?auto_180193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180186 ) ( ON ?auto_180187 ?auto_180186 ) ( not ( = ?auto_180186 ?auto_180187 ) ) ( not ( = ?auto_180186 ?auto_180188 ) ) ( not ( = ?auto_180186 ?auto_180189 ) ) ( not ( = ?auto_180186 ?auto_180190 ) ) ( not ( = ?auto_180186 ?auto_180191 ) ) ( not ( = ?auto_180186 ?auto_180192 ) ) ( not ( = ?auto_180187 ?auto_180188 ) ) ( not ( = ?auto_180187 ?auto_180189 ) ) ( not ( = ?auto_180187 ?auto_180190 ) ) ( not ( = ?auto_180187 ?auto_180191 ) ) ( not ( = ?auto_180187 ?auto_180192 ) ) ( not ( = ?auto_180188 ?auto_180189 ) ) ( not ( = ?auto_180188 ?auto_180190 ) ) ( not ( = ?auto_180188 ?auto_180191 ) ) ( not ( = ?auto_180188 ?auto_180192 ) ) ( not ( = ?auto_180189 ?auto_180190 ) ) ( not ( = ?auto_180189 ?auto_180191 ) ) ( not ( = ?auto_180189 ?auto_180192 ) ) ( not ( = ?auto_180190 ?auto_180191 ) ) ( not ( = ?auto_180190 ?auto_180192 ) ) ( not ( = ?auto_180191 ?auto_180192 ) ) ( ON ?auto_180192 ?auto_180193 ) ( not ( = ?auto_180186 ?auto_180193 ) ) ( not ( = ?auto_180187 ?auto_180193 ) ) ( not ( = ?auto_180188 ?auto_180193 ) ) ( not ( = ?auto_180189 ?auto_180193 ) ) ( not ( = ?auto_180190 ?auto_180193 ) ) ( not ( = ?auto_180191 ?auto_180193 ) ) ( not ( = ?auto_180192 ?auto_180193 ) ) ( ON ?auto_180191 ?auto_180192 ) ( ON-TABLE ?auto_180193 ) ( ON ?auto_180190 ?auto_180191 ) ( ON ?auto_180189 ?auto_180190 ) ( CLEAR ?auto_180187 ) ( ON ?auto_180188 ?auto_180189 ) ( CLEAR ?auto_180188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180193 ?auto_180192 ?auto_180191 ?auto_180190 ?auto_180189 )
      ( MAKE-7PILE ?auto_180186 ?auto_180187 ?auto_180188 ?auto_180189 ?auto_180190 ?auto_180191 ?auto_180192 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180194 - BLOCK
      ?auto_180195 - BLOCK
      ?auto_180196 - BLOCK
      ?auto_180197 - BLOCK
      ?auto_180198 - BLOCK
      ?auto_180199 - BLOCK
      ?auto_180200 - BLOCK
    )
    :vars
    (
      ?auto_180201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180194 ) ( not ( = ?auto_180194 ?auto_180195 ) ) ( not ( = ?auto_180194 ?auto_180196 ) ) ( not ( = ?auto_180194 ?auto_180197 ) ) ( not ( = ?auto_180194 ?auto_180198 ) ) ( not ( = ?auto_180194 ?auto_180199 ) ) ( not ( = ?auto_180194 ?auto_180200 ) ) ( not ( = ?auto_180195 ?auto_180196 ) ) ( not ( = ?auto_180195 ?auto_180197 ) ) ( not ( = ?auto_180195 ?auto_180198 ) ) ( not ( = ?auto_180195 ?auto_180199 ) ) ( not ( = ?auto_180195 ?auto_180200 ) ) ( not ( = ?auto_180196 ?auto_180197 ) ) ( not ( = ?auto_180196 ?auto_180198 ) ) ( not ( = ?auto_180196 ?auto_180199 ) ) ( not ( = ?auto_180196 ?auto_180200 ) ) ( not ( = ?auto_180197 ?auto_180198 ) ) ( not ( = ?auto_180197 ?auto_180199 ) ) ( not ( = ?auto_180197 ?auto_180200 ) ) ( not ( = ?auto_180198 ?auto_180199 ) ) ( not ( = ?auto_180198 ?auto_180200 ) ) ( not ( = ?auto_180199 ?auto_180200 ) ) ( ON ?auto_180200 ?auto_180201 ) ( not ( = ?auto_180194 ?auto_180201 ) ) ( not ( = ?auto_180195 ?auto_180201 ) ) ( not ( = ?auto_180196 ?auto_180201 ) ) ( not ( = ?auto_180197 ?auto_180201 ) ) ( not ( = ?auto_180198 ?auto_180201 ) ) ( not ( = ?auto_180199 ?auto_180201 ) ) ( not ( = ?auto_180200 ?auto_180201 ) ) ( ON ?auto_180199 ?auto_180200 ) ( ON-TABLE ?auto_180201 ) ( ON ?auto_180198 ?auto_180199 ) ( ON ?auto_180197 ?auto_180198 ) ( ON ?auto_180196 ?auto_180197 ) ( CLEAR ?auto_180196 ) ( HOLDING ?auto_180195 ) ( CLEAR ?auto_180194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180194 ?auto_180195 )
      ( MAKE-7PILE ?auto_180194 ?auto_180195 ?auto_180196 ?auto_180197 ?auto_180198 ?auto_180199 ?auto_180200 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180202 - BLOCK
      ?auto_180203 - BLOCK
      ?auto_180204 - BLOCK
      ?auto_180205 - BLOCK
      ?auto_180206 - BLOCK
      ?auto_180207 - BLOCK
      ?auto_180208 - BLOCK
    )
    :vars
    (
      ?auto_180209 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180202 ) ( not ( = ?auto_180202 ?auto_180203 ) ) ( not ( = ?auto_180202 ?auto_180204 ) ) ( not ( = ?auto_180202 ?auto_180205 ) ) ( not ( = ?auto_180202 ?auto_180206 ) ) ( not ( = ?auto_180202 ?auto_180207 ) ) ( not ( = ?auto_180202 ?auto_180208 ) ) ( not ( = ?auto_180203 ?auto_180204 ) ) ( not ( = ?auto_180203 ?auto_180205 ) ) ( not ( = ?auto_180203 ?auto_180206 ) ) ( not ( = ?auto_180203 ?auto_180207 ) ) ( not ( = ?auto_180203 ?auto_180208 ) ) ( not ( = ?auto_180204 ?auto_180205 ) ) ( not ( = ?auto_180204 ?auto_180206 ) ) ( not ( = ?auto_180204 ?auto_180207 ) ) ( not ( = ?auto_180204 ?auto_180208 ) ) ( not ( = ?auto_180205 ?auto_180206 ) ) ( not ( = ?auto_180205 ?auto_180207 ) ) ( not ( = ?auto_180205 ?auto_180208 ) ) ( not ( = ?auto_180206 ?auto_180207 ) ) ( not ( = ?auto_180206 ?auto_180208 ) ) ( not ( = ?auto_180207 ?auto_180208 ) ) ( ON ?auto_180208 ?auto_180209 ) ( not ( = ?auto_180202 ?auto_180209 ) ) ( not ( = ?auto_180203 ?auto_180209 ) ) ( not ( = ?auto_180204 ?auto_180209 ) ) ( not ( = ?auto_180205 ?auto_180209 ) ) ( not ( = ?auto_180206 ?auto_180209 ) ) ( not ( = ?auto_180207 ?auto_180209 ) ) ( not ( = ?auto_180208 ?auto_180209 ) ) ( ON ?auto_180207 ?auto_180208 ) ( ON-TABLE ?auto_180209 ) ( ON ?auto_180206 ?auto_180207 ) ( ON ?auto_180205 ?auto_180206 ) ( ON ?auto_180204 ?auto_180205 ) ( CLEAR ?auto_180202 ) ( ON ?auto_180203 ?auto_180204 ) ( CLEAR ?auto_180203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180209 ?auto_180208 ?auto_180207 ?auto_180206 ?auto_180205 ?auto_180204 )
      ( MAKE-7PILE ?auto_180202 ?auto_180203 ?auto_180204 ?auto_180205 ?auto_180206 ?auto_180207 ?auto_180208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180210 - BLOCK
      ?auto_180211 - BLOCK
      ?auto_180212 - BLOCK
      ?auto_180213 - BLOCK
      ?auto_180214 - BLOCK
      ?auto_180215 - BLOCK
      ?auto_180216 - BLOCK
    )
    :vars
    (
      ?auto_180217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180210 ?auto_180211 ) ) ( not ( = ?auto_180210 ?auto_180212 ) ) ( not ( = ?auto_180210 ?auto_180213 ) ) ( not ( = ?auto_180210 ?auto_180214 ) ) ( not ( = ?auto_180210 ?auto_180215 ) ) ( not ( = ?auto_180210 ?auto_180216 ) ) ( not ( = ?auto_180211 ?auto_180212 ) ) ( not ( = ?auto_180211 ?auto_180213 ) ) ( not ( = ?auto_180211 ?auto_180214 ) ) ( not ( = ?auto_180211 ?auto_180215 ) ) ( not ( = ?auto_180211 ?auto_180216 ) ) ( not ( = ?auto_180212 ?auto_180213 ) ) ( not ( = ?auto_180212 ?auto_180214 ) ) ( not ( = ?auto_180212 ?auto_180215 ) ) ( not ( = ?auto_180212 ?auto_180216 ) ) ( not ( = ?auto_180213 ?auto_180214 ) ) ( not ( = ?auto_180213 ?auto_180215 ) ) ( not ( = ?auto_180213 ?auto_180216 ) ) ( not ( = ?auto_180214 ?auto_180215 ) ) ( not ( = ?auto_180214 ?auto_180216 ) ) ( not ( = ?auto_180215 ?auto_180216 ) ) ( ON ?auto_180216 ?auto_180217 ) ( not ( = ?auto_180210 ?auto_180217 ) ) ( not ( = ?auto_180211 ?auto_180217 ) ) ( not ( = ?auto_180212 ?auto_180217 ) ) ( not ( = ?auto_180213 ?auto_180217 ) ) ( not ( = ?auto_180214 ?auto_180217 ) ) ( not ( = ?auto_180215 ?auto_180217 ) ) ( not ( = ?auto_180216 ?auto_180217 ) ) ( ON ?auto_180215 ?auto_180216 ) ( ON-TABLE ?auto_180217 ) ( ON ?auto_180214 ?auto_180215 ) ( ON ?auto_180213 ?auto_180214 ) ( ON ?auto_180212 ?auto_180213 ) ( ON ?auto_180211 ?auto_180212 ) ( CLEAR ?auto_180211 ) ( HOLDING ?auto_180210 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180210 )
      ( MAKE-7PILE ?auto_180210 ?auto_180211 ?auto_180212 ?auto_180213 ?auto_180214 ?auto_180215 ?auto_180216 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180218 - BLOCK
      ?auto_180219 - BLOCK
      ?auto_180220 - BLOCK
      ?auto_180221 - BLOCK
      ?auto_180222 - BLOCK
      ?auto_180223 - BLOCK
      ?auto_180224 - BLOCK
    )
    :vars
    (
      ?auto_180225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180218 ?auto_180219 ) ) ( not ( = ?auto_180218 ?auto_180220 ) ) ( not ( = ?auto_180218 ?auto_180221 ) ) ( not ( = ?auto_180218 ?auto_180222 ) ) ( not ( = ?auto_180218 ?auto_180223 ) ) ( not ( = ?auto_180218 ?auto_180224 ) ) ( not ( = ?auto_180219 ?auto_180220 ) ) ( not ( = ?auto_180219 ?auto_180221 ) ) ( not ( = ?auto_180219 ?auto_180222 ) ) ( not ( = ?auto_180219 ?auto_180223 ) ) ( not ( = ?auto_180219 ?auto_180224 ) ) ( not ( = ?auto_180220 ?auto_180221 ) ) ( not ( = ?auto_180220 ?auto_180222 ) ) ( not ( = ?auto_180220 ?auto_180223 ) ) ( not ( = ?auto_180220 ?auto_180224 ) ) ( not ( = ?auto_180221 ?auto_180222 ) ) ( not ( = ?auto_180221 ?auto_180223 ) ) ( not ( = ?auto_180221 ?auto_180224 ) ) ( not ( = ?auto_180222 ?auto_180223 ) ) ( not ( = ?auto_180222 ?auto_180224 ) ) ( not ( = ?auto_180223 ?auto_180224 ) ) ( ON ?auto_180224 ?auto_180225 ) ( not ( = ?auto_180218 ?auto_180225 ) ) ( not ( = ?auto_180219 ?auto_180225 ) ) ( not ( = ?auto_180220 ?auto_180225 ) ) ( not ( = ?auto_180221 ?auto_180225 ) ) ( not ( = ?auto_180222 ?auto_180225 ) ) ( not ( = ?auto_180223 ?auto_180225 ) ) ( not ( = ?auto_180224 ?auto_180225 ) ) ( ON ?auto_180223 ?auto_180224 ) ( ON-TABLE ?auto_180225 ) ( ON ?auto_180222 ?auto_180223 ) ( ON ?auto_180221 ?auto_180222 ) ( ON ?auto_180220 ?auto_180221 ) ( ON ?auto_180219 ?auto_180220 ) ( ON ?auto_180218 ?auto_180219 ) ( CLEAR ?auto_180218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180225 ?auto_180224 ?auto_180223 ?auto_180222 ?auto_180221 ?auto_180220 ?auto_180219 )
      ( MAKE-7PILE ?auto_180218 ?auto_180219 ?auto_180220 ?auto_180221 ?auto_180222 ?auto_180223 ?auto_180224 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180233 - BLOCK
      ?auto_180234 - BLOCK
      ?auto_180235 - BLOCK
      ?auto_180236 - BLOCK
      ?auto_180237 - BLOCK
      ?auto_180238 - BLOCK
      ?auto_180239 - BLOCK
    )
    :vars
    (
      ?auto_180240 - BLOCK
      ?auto_180241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180233 ?auto_180234 ) ) ( not ( = ?auto_180233 ?auto_180235 ) ) ( not ( = ?auto_180233 ?auto_180236 ) ) ( not ( = ?auto_180233 ?auto_180237 ) ) ( not ( = ?auto_180233 ?auto_180238 ) ) ( not ( = ?auto_180233 ?auto_180239 ) ) ( not ( = ?auto_180234 ?auto_180235 ) ) ( not ( = ?auto_180234 ?auto_180236 ) ) ( not ( = ?auto_180234 ?auto_180237 ) ) ( not ( = ?auto_180234 ?auto_180238 ) ) ( not ( = ?auto_180234 ?auto_180239 ) ) ( not ( = ?auto_180235 ?auto_180236 ) ) ( not ( = ?auto_180235 ?auto_180237 ) ) ( not ( = ?auto_180235 ?auto_180238 ) ) ( not ( = ?auto_180235 ?auto_180239 ) ) ( not ( = ?auto_180236 ?auto_180237 ) ) ( not ( = ?auto_180236 ?auto_180238 ) ) ( not ( = ?auto_180236 ?auto_180239 ) ) ( not ( = ?auto_180237 ?auto_180238 ) ) ( not ( = ?auto_180237 ?auto_180239 ) ) ( not ( = ?auto_180238 ?auto_180239 ) ) ( ON ?auto_180239 ?auto_180240 ) ( not ( = ?auto_180233 ?auto_180240 ) ) ( not ( = ?auto_180234 ?auto_180240 ) ) ( not ( = ?auto_180235 ?auto_180240 ) ) ( not ( = ?auto_180236 ?auto_180240 ) ) ( not ( = ?auto_180237 ?auto_180240 ) ) ( not ( = ?auto_180238 ?auto_180240 ) ) ( not ( = ?auto_180239 ?auto_180240 ) ) ( ON ?auto_180238 ?auto_180239 ) ( ON-TABLE ?auto_180240 ) ( ON ?auto_180237 ?auto_180238 ) ( ON ?auto_180236 ?auto_180237 ) ( ON ?auto_180235 ?auto_180236 ) ( ON ?auto_180234 ?auto_180235 ) ( CLEAR ?auto_180234 ) ( ON ?auto_180233 ?auto_180241 ) ( CLEAR ?auto_180233 ) ( HAND-EMPTY ) ( not ( = ?auto_180233 ?auto_180241 ) ) ( not ( = ?auto_180234 ?auto_180241 ) ) ( not ( = ?auto_180235 ?auto_180241 ) ) ( not ( = ?auto_180236 ?auto_180241 ) ) ( not ( = ?auto_180237 ?auto_180241 ) ) ( not ( = ?auto_180238 ?auto_180241 ) ) ( not ( = ?auto_180239 ?auto_180241 ) ) ( not ( = ?auto_180240 ?auto_180241 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180233 ?auto_180241 )
      ( MAKE-7PILE ?auto_180233 ?auto_180234 ?auto_180235 ?auto_180236 ?auto_180237 ?auto_180238 ?auto_180239 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180242 - BLOCK
      ?auto_180243 - BLOCK
      ?auto_180244 - BLOCK
      ?auto_180245 - BLOCK
      ?auto_180246 - BLOCK
      ?auto_180247 - BLOCK
      ?auto_180248 - BLOCK
    )
    :vars
    (
      ?auto_180249 - BLOCK
      ?auto_180250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180242 ?auto_180243 ) ) ( not ( = ?auto_180242 ?auto_180244 ) ) ( not ( = ?auto_180242 ?auto_180245 ) ) ( not ( = ?auto_180242 ?auto_180246 ) ) ( not ( = ?auto_180242 ?auto_180247 ) ) ( not ( = ?auto_180242 ?auto_180248 ) ) ( not ( = ?auto_180243 ?auto_180244 ) ) ( not ( = ?auto_180243 ?auto_180245 ) ) ( not ( = ?auto_180243 ?auto_180246 ) ) ( not ( = ?auto_180243 ?auto_180247 ) ) ( not ( = ?auto_180243 ?auto_180248 ) ) ( not ( = ?auto_180244 ?auto_180245 ) ) ( not ( = ?auto_180244 ?auto_180246 ) ) ( not ( = ?auto_180244 ?auto_180247 ) ) ( not ( = ?auto_180244 ?auto_180248 ) ) ( not ( = ?auto_180245 ?auto_180246 ) ) ( not ( = ?auto_180245 ?auto_180247 ) ) ( not ( = ?auto_180245 ?auto_180248 ) ) ( not ( = ?auto_180246 ?auto_180247 ) ) ( not ( = ?auto_180246 ?auto_180248 ) ) ( not ( = ?auto_180247 ?auto_180248 ) ) ( ON ?auto_180248 ?auto_180249 ) ( not ( = ?auto_180242 ?auto_180249 ) ) ( not ( = ?auto_180243 ?auto_180249 ) ) ( not ( = ?auto_180244 ?auto_180249 ) ) ( not ( = ?auto_180245 ?auto_180249 ) ) ( not ( = ?auto_180246 ?auto_180249 ) ) ( not ( = ?auto_180247 ?auto_180249 ) ) ( not ( = ?auto_180248 ?auto_180249 ) ) ( ON ?auto_180247 ?auto_180248 ) ( ON-TABLE ?auto_180249 ) ( ON ?auto_180246 ?auto_180247 ) ( ON ?auto_180245 ?auto_180246 ) ( ON ?auto_180244 ?auto_180245 ) ( ON ?auto_180242 ?auto_180250 ) ( CLEAR ?auto_180242 ) ( not ( = ?auto_180242 ?auto_180250 ) ) ( not ( = ?auto_180243 ?auto_180250 ) ) ( not ( = ?auto_180244 ?auto_180250 ) ) ( not ( = ?auto_180245 ?auto_180250 ) ) ( not ( = ?auto_180246 ?auto_180250 ) ) ( not ( = ?auto_180247 ?auto_180250 ) ) ( not ( = ?auto_180248 ?auto_180250 ) ) ( not ( = ?auto_180249 ?auto_180250 ) ) ( HOLDING ?auto_180243 ) ( CLEAR ?auto_180244 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180249 ?auto_180248 ?auto_180247 ?auto_180246 ?auto_180245 ?auto_180244 ?auto_180243 )
      ( MAKE-7PILE ?auto_180242 ?auto_180243 ?auto_180244 ?auto_180245 ?auto_180246 ?auto_180247 ?auto_180248 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180251 - BLOCK
      ?auto_180252 - BLOCK
      ?auto_180253 - BLOCK
      ?auto_180254 - BLOCK
      ?auto_180255 - BLOCK
      ?auto_180256 - BLOCK
      ?auto_180257 - BLOCK
    )
    :vars
    (
      ?auto_180258 - BLOCK
      ?auto_180259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180251 ?auto_180252 ) ) ( not ( = ?auto_180251 ?auto_180253 ) ) ( not ( = ?auto_180251 ?auto_180254 ) ) ( not ( = ?auto_180251 ?auto_180255 ) ) ( not ( = ?auto_180251 ?auto_180256 ) ) ( not ( = ?auto_180251 ?auto_180257 ) ) ( not ( = ?auto_180252 ?auto_180253 ) ) ( not ( = ?auto_180252 ?auto_180254 ) ) ( not ( = ?auto_180252 ?auto_180255 ) ) ( not ( = ?auto_180252 ?auto_180256 ) ) ( not ( = ?auto_180252 ?auto_180257 ) ) ( not ( = ?auto_180253 ?auto_180254 ) ) ( not ( = ?auto_180253 ?auto_180255 ) ) ( not ( = ?auto_180253 ?auto_180256 ) ) ( not ( = ?auto_180253 ?auto_180257 ) ) ( not ( = ?auto_180254 ?auto_180255 ) ) ( not ( = ?auto_180254 ?auto_180256 ) ) ( not ( = ?auto_180254 ?auto_180257 ) ) ( not ( = ?auto_180255 ?auto_180256 ) ) ( not ( = ?auto_180255 ?auto_180257 ) ) ( not ( = ?auto_180256 ?auto_180257 ) ) ( ON ?auto_180257 ?auto_180258 ) ( not ( = ?auto_180251 ?auto_180258 ) ) ( not ( = ?auto_180252 ?auto_180258 ) ) ( not ( = ?auto_180253 ?auto_180258 ) ) ( not ( = ?auto_180254 ?auto_180258 ) ) ( not ( = ?auto_180255 ?auto_180258 ) ) ( not ( = ?auto_180256 ?auto_180258 ) ) ( not ( = ?auto_180257 ?auto_180258 ) ) ( ON ?auto_180256 ?auto_180257 ) ( ON-TABLE ?auto_180258 ) ( ON ?auto_180255 ?auto_180256 ) ( ON ?auto_180254 ?auto_180255 ) ( ON ?auto_180253 ?auto_180254 ) ( ON ?auto_180251 ?auto_180259 ) ( not ( = ?auto_180251 ?auto_180259 ) ) ( not ( = ?auto_180252 ?auto_180259 ) ) ( not ( = ?auto_180253 ?auto_180259 ) ) ( not ( = ?auto_180254 ?auto_180259 ) ) ( not ( = ?auto_180255 ?auto_180259 ) ) ( not ( = ?auto_180256 ?auto_180259 ) ) ( not ( = ?auto_180257 ?auto_180259 ) ) ( not ( = ?auto_180258 ?auto_180259 ) ) ( CLEAR ?auto_180253 ) ( ON ?auto_180252 ?auto_180251 ) ( CLEAR ?auto_180252 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180259 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180259 ?auto_180251 )
      ( MAKE-7PILE ?auto_180251 ?auto_180252 ?auto_180253 ?auto_180254 ?auto_180255 ?auto_180256 ?auto_180257 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180260 - BLOCK
      ?auto_180261 - BLOCK
      ?auto_180262 - BLOCK
      ?auto_180263 - BLOCK
      ?auto_180264 - BLOCK
      ?auto_180265 - BLOCK
      ?auto_180266 - BLOCK
    )
    :vars
    (
      ?auto_180267 - BLOCK
      ?auto_180268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180260 ?auto_180261 ) ) ( not ( = ?auto_180260 ?auto_180262 ) ) ( not ( = ?auto_180260 ?auto_180263 ) ) ( not ( = ?auto_180260 ?auto_180264 ) ) ( not ( = ?auto_180260 ?auto_180265 ) ) ( not ( = ?auto_180260 ?auto_180266 ) ) ( not ( = ?auto_180261 ?auto_180262 ) ) ( not ( = ?auto_180261 ?auto_180263 ) ) ( not ( = ?auto_180261 ?auto_180264 ) ) ( not ( = ?auto_180261 ?auto_180265 ) ) ( not ( = ?auto_180261 ?auto_180266 ) ) ( not ( = ?auto_180262 ?auto_180263 ) ) ( not ( = ?auto_180262 ?auto_180264 ) ) ( not ( = ?auto_180262 ?auto_180265 ) ) ( not ( = ?auto_180262 ?auto_180266 ) ) ( not ( = ?auto_180263 ?auto_180264 ) ) ( not ( = ?auto_180263 ?auto_180265 ) ) ( not ( = ?auto_180263 ?auto_180266 ) ) ( not ( = ?auto_180264 ?auto_180265 ) ) ( not ( = ?auto_180264 ?auto_180266 ) ) ( not ( = ?auto_180265 ?auto_180266 ) ) ( ON ?auto_180266 ?auto_180267 ) ( not ( = ?auto_180260 ?auto_180267 ) ) ( not ( = ?auto_180261 ?auto_180267 ) ) ( not ( = ?auto_180262 ?auto_180267 ) ) ( not ( = ?auto_180263 ?auto_180267 ) ) ( not ( = ?auto_180264 ?auto_180267 ) ) ( not ( = ?auto_180265 ?auto_180267 ) ) ( not ( = ?auto_180266 ?auto_180267 ) ) ( ON ?auto_180265 ?auto_180266 ) ( ON-TABLE ?auto_180267 ) ( ON ?auto_180264 ?auto_180265 ) ( ON ?auto_180263 ?auto_180264 ) ( ON ?auto_180260 ?auto_180268 ) ( not ( = ?auto_180260 ?auto_180268 ) ) ( not ( = ?auto_180261 ?auto_180268 ) ) ( not ( = ?auto_180262 ?auto_180268 ) ) ( not ( = ?auto_180263 ?auto_180268 ) ) ( not ( = ?auto_180264 ?auto_180268 ) ) ( not ( = ?auto_180265 ?auto_180268 ) ) ( not ( = ?auto_180266 ?auto_180268 ) ) ( not ( = ?auto_180267 ?auto_180268 ) ) ( ON ?auto_180261 ?auto_180260 ) ( CLEAR ?auto_180261 ) ( ON-TABLE ?auto_180268 ) ( HOLDING ?auto_180262 ) ( CLEAR ?auto_180263 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180267 ?auto_180266 ?auto_180265 ?auto_180264 ?auto_180263 ?auto_180262 )
      ( MAKE-7PILE ?auto_180260 ?auto_180261 ?auto_180262 ?auto_180263 ?auto_180264 ?auto_180265 ?auto_180266 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180269 - BLOCK
      ?auto_180270 - BLOCK
      ?auto_180271 - BLOCK
      ?auto_180272 - BLOCK
      ?auto_180273 - BLOCK
      ?auto_180274 - BLOCK
      ?auto_180275 - BLOCK
    )
    :vars
    (
      ?auto_180276 - BLOCK
      ?auto_180277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180269 ?auto_180270 ) ) ( not ( = ?auto_180269 ?auto_180271 ) ) ( not ( = ?auto_180269 ?auto_180272 ) ) ( not ( = ?auto_180269 ?auto_180273 ) ) ( not ( = ?auto_180269 ?auto_180274 ) ) ( not ( = ?auto_180269 ?auto_180275 ) ) ( not ( = ?auto_180270 ?auto_180271 ) ) ( not ( = ?auto_180270 ?auto_180272 ) ) ( not ( = ?auto_180270 ?auto_180273 ) ) ( not ( = ?auto_180270 ?auto_180274 ) ) ( not ( = ?auto_180270 ?auto_180275 ) ) ( not ( = ?auto_180271 ?auto_180272 ) ) ( not ( = ?auto_180271 ?auto_180273 ) ) ( not ( = ?auto_180271 ?auto_180274 ) ) ( not ( = ?auto_180271 ?auto_180275 ) ) ( not ( = ?auto_180272 ?auto_180273 ) ) ( not ( = ?auto_180272 ?auto_180274 ) ) ( not ( = ?auto_180272 ?auto_180275 ) ) ( not ( = ?auto_180273 ?auto_180274 ) ) ( not ( = ?auto_180273 ?auto_180275 ) ) ( not ( = ?auto_180274 ?auto_180275 ) ) ( ON ?auto_180275 ?auto_180276 ) ( not ( = ?auto_180269 ?auto_180276 ) ) ( not ( = ?auto_180270 ?auto_180276 ) ) ( not ( = ?auto_180271 ?auto_180276 ) ) ( not ( = ?auto_180272 ?auto_180276 ) ) ( not ( = ?auto_180273 ?auto_180276 ) ) ( not ( = ?auto_180274 ?auto_180276 ) ) ( not ( = ?auto_180275 ?auto_180276 ) ) ( ON ?auto_180274 ?auto_180275 ) ( ON-TABLE ?auto_180276 ) ( ON ?auto_180273 ?auto_180274 ) ( ON ?auto_180272 ?auto_180273 ) ( ON ?auto_180269 ?auto_180277 ) ( not ( = ?auto_180269 ?auto_180277 ) ) ( not ( = ?auto_180270 ?auto_180277 ) ) ( not ( = ?auto_180271 ?auto_180277 ) ) ( not ( = ?auto_180272 ?auto_180277 ) ) ( not ( = ?auto_180273 ?auto_180277 ) ) ( not ( = ?auto_180274 ?auto_180277 ) ) ( not ( = ?auto_180275 ?auto_180277 ) ) ( not ( = ?auto_180276 ?auto_180277 ) ) ( ON ?auto_180270 ?auto_180269 ) ( ON-TABLE ?auto_180277 ) ( CLEAR ?auto_180272 ) ( ON ?auto_180271 ?auto_180270 ) ( CLEAR ?auto_180271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180277 ?auto_180269 ?auto_180270 )
      ( MAKE-7PILE ?auto_180269 ?auto_180270 ?auto_180271 ?auto_180272 ?auto_180273 ?auto_180274 ?auto_180275 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180278 - BLOCK
      ?auto_180279 - BLOCK
      ?auto_180280 - BLOCK
      ?auto_180281 - BLOCK
      ?auto_180282 - BLOCK
      ?auto_180283 - BLOCK
      ?auto_180284 - BLOCK
    )
    :vars
    (
      ?auto_180285 - BLOCK
      ?auto_180286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180278 ?auto_180279 ) ) ( not ( = ?auto_180278 ?auto_180280 ) ) ( not ( = ?auto_180278 ?auto_180281 ) ) ( not ( = ?auto_180278 ?auto_180282 ) ) ( not ( = ?auto_180278 ?auto_180283 ) ) ( not ( = ?auto_180278 ?auto_180284 ) ) ( not ( = ?auto_180279 ?auto_180280 ) ) ( not ( = ?auto_180279 ?auto_180281 ) ) ( not ( = ?auto_180279 ?auto_180282 ) ) ( not ( = ?auto_180279 ?auto_180283 ) ) ( not ( = ?auto_180279 ?auto_180284 ) ) ( not ( = ?auto_180280 ?auto_180281 ) ) ( not ( = ?auto_180280 ?auto_180282 ) ) ( not ( = ?auto_180280 ?auto_180283 ) ) ( not ( = ?auto_180280 ?auto_180284 ) ) ( not ( = ?auto_180281 ?auto_180282 ) ) ( not ( = ?auto_180281 ?auto_180283 ) ) ( not ( = ?auto_180281 ?auto_180284 ) ) ( not ( = ?auto_180282 ?auto_180283 ) ) ( not ( = ?auto_180282 ?auto_180284 ) ) ( not ( = ?auto_180283 ?auto_180284 ) ) ( ON ?auto_180284 ?auto_180285 ) ( not ( = ?auto_180278 ?auto_180285 ) ) ( not ( = ?auto_180279 ?auto_180285 ) ) ( not ( = ?auto_180280 ?auto_180285 ) ) ( not ( = ?auto_180281 ?auto_180285 ) ) ( not ( = ?auto_180282 ?auto_180285 ) ) ( not ( = ?auto_180283 ?auto_180285 ) ) ( not ( = ?auto_180284 ?auto_180285 ) ) ( ON ?auto_180283 ?auto_180284 ) ( ON-TABLE ?auto_180285 ) ( ON ?auto_180282 ?auto_180283 ) ( ON ?auto_180278 ?auto_180286 ) ( not ( = ?auto_180278 ?auto_180286 ) ) ( not ( = ?auto_180279 ?auto_180286 ) ) ( not ( = ?auto_180280 ?auto_180286 ) ) ( not ( = ?auto_180281 ?auto_180286 ) ) ( not ( = ?auto_180282 ?auto_180286 ) ) ( not ( = ?auto_180283 ?auto_180286 ) ) ( not ( = ?auto_180284 ?auto_180286 ) ) ( not ( = ?auto_180285 ?auto_180286 ) ) ( ON ?auto_180279 ?auto_180278 ) ( ON-TABLE ?auto_180286 ) ( ON ?auto_180280 ?auto_180279 ) ( CLEAR ?auto_180280 ) ( HOLDING ?auto_180281 ) ( CLEAR ?auto_180282 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180285 ?auto_180284 ?auto_180283 ?auto_180282 ?auto_180281 )
      ( MAKE-7PILE ?auto_180278 ?auto_180279 ?auto_180280 ?auto_180281 ?auto_180282 ?auto_180283 ?auto_180284 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180287 - BLOCK
      ?auto_180288 - BLOCK
      ?auto_180289 - BLOCK
      ?auto_180290 - BLOCK
      ?auto_180291 - BLOCK
      ?auto_180292 - BLOCK
      ?auto_180293 - BLOCK
    )
    :vars
    (
      ?auto_180294 - BLOCK
      ?auto_180295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180287 ?auto_180288 ) ) ( not ( = ?auto_180287 ?auto_180289 ) ) ( not ( = ?auto_180287 ?auto_180290 ) ) ( not ( = ?auto_180287 ?auto_180291 ) ) ( not ( = ?auto_180287 ?auto_180292 ) ) ( not ( = ?auto_180287 ?auto_180293 ) ) ( not ( = ?auto_180288 ?auto_180289 ) ) ( not ( = ?auto_180288 ?auto_180290 ) ) ( not ( = ?auto_180288 ?auto_180291 ) ) ( not ( = ?auto_180288 ?auto_180292 ) ) ( not ( = ?auto_180288 ?auto_180293 ) ) ( not ( = ?auto_180289 ?auto_180290 ) ) ( not ( = ?auto_180289 ?auto_180291 ) ) ( not ( = ?auto_180289 ?auto_180292 ) ) ( not ( = ?auto_180289 ?auto_180293 ) ) ( not ( = ?auto_180290 ?auto_180291 ) ) ( not ( = ?auto_180290 ?auto_180292 ) ) ( not ( = ?auto_180290 ?auto_180293 ) ) ( not ( = ?auto_180291 ?auto_180292 ) ) ( not ( = ?auto_180291 ?auto_180293 ) ) ( not ( = ?auto_180292 ?auto_180293 ) ) ( ON ?auto_180293 ?auto_180294 ) ( not ( = ?auto_180287 ?auto_180294 ) ) ( not ( = ?auto_180288 ?auto_180294 ) ) ( not ( = ?auto_180289 ?auto_180294 ) ) ( not ( = ?auto_180290 ?auto_180294 ) ) ( not ( = ?auto_180291 ?auto_180294 ) ) ( not ( = ?auto_180292 ?auto_180294 ) ) ( not ( = ?auto_180293 ?auto_180294 ) ) ( ON ?auto_180292 ?auto_180293 ) ( ON-TABLE ?auto_180294 ) ( ON ?auto_180291 ?auto_180292 ) ( ON ?auto_180287 ?auto_180295 ) ( not ( = ?auto_180287 ?auto_180295 ) ) ( not ( = ?auto_180288 ?auto_180295 ) ) ( not ( = ?auto_180289 ?auto_180295 ) ) ( not ( = ?auto_180290 ?auto_180295 ) ) ( not ( = ?auto_180291 ?auto_180295 ) ) ( not ( = ?auto_180292 ?auto_180295 ) ) ( not ( = ?auto_180293 ?auto_180295 ) ) ( not ( = ?auto_180294 ?auto_180295 ) ) ( ON ?auto_180288 ?auto_180287 ) ( ON-TABLE ?auto_180295 ) ( ON ?auto_180289 ?auto_180288 ) ( CLEAR ?auto_180291 ) ( ON ?auto_180290 ?auto_180289 ) ( CLEAR ?auto_180290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180295 ?auto_180287 ?auto_180288 ?auto_180289 )
      ( MAKE-7PILE ?auto_180287 ?auto_180288 ?auto_180289 ?auto_180290 ?auto_180291 ?auto_180292 ?auto_180293 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180296 - BLOCK
      ?auto_180297 - BLOCK
      ?auto_180298 - BLOCK
      ?auto_180299 - BLOCK
      ?auto_180300 - BLOCK
      ?auto_180301 - BLOCK
      ?auto_180302 - BLOCK
    )
    :vars
    (
      ?auto_180304 - BLOCK
      ?auto_180303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180296 ?auto_180297 ) ) ( not ( = ?auto_180296 ?auto_180298 ) ) ( not ( = ?auto_180296 ?auto_180299 ) ) ( not ( = ?auto_180296 ?auto_180300 ) ) ( not ( = ?auto_180296 ?auto_180301 ) ) ( not ( = ?auto_180296 ?auto_180302 ) ) ( not ( = ?auto_180297 ?auto_180298 ) ) ( not ( = ?auto_180297 ?auto_180299 ) ) ( not ( = ?auto_180297 ?auto_180300 ) ) ( not ( = ?auto_180297 ?auto_180301 ) ) ( not ( = ?auto_180297 ?auto_180302 ) ) ( not ( = ?auto_180298 ?auto_180299 ) ) ( not ( = ?auto_180298 ?auto_180300 ) ) ( not ( = ?auto_180298 ?auto_180301 ) ) ( not ( = ?auto_180298 ?auto_180302 ) ) ( not ( = ?auto_180299 ?auto_180300 ) ) ( not ( = ?auto_180299 ?auto_180301 ) ) ( not ( = ?auto_180299 ?auto_180302 ) ) ( not ( = ?auto_180300 ?auto_180301 ) ) ( not ( = ?auto_180300 ?auto_180302 ) ) ( not ( = ?auto_180301 ?auto_180302 ) ) ( ON ?auto_180302 ?auto_180304 ) ( not ( = ?auto_180296 ?auto_180304 ) ) ( not ( = ?auto_180297 ?auto_180304 ) ) ( not ( = ?auto_180298 ?auto_180304 ) ) ( not ( = ?auto_180299 ?auto_180304 ) ) ( not ( = ?auto_180300 ?auto_180304 ) ) ( not ( = ?auto_180301 ?auto_180304 ) ) ( not ( = ?auto_180302 ?auto_180304 ) ) ( ON ?auto_180301 ?auto_180302 ) ( ON-TABLE ?auto_180304 ) ( ON ?auto_180296 ?auto_180303 ) ( not ( = ?auto_180296 ?auto_180303 ) ) ( not ( = ?auto_180297 ?auto_180303 ) ) ( not ( = ?auto_180298 ?auto_180303 ) ) ( not ( = ?auto_180299 ?auto_180303 ) ) ( not ( = ?auto_180300 ?auto_180303 ) ) ( not ( = ?auto_180301 ?auto_180303 ) ) ( not ( = ?auto_180302 ?auto_180303 ) ) ( not ( = ?auto_180304 ?auto_180303 ) ) ( ON ?auto_180297 ?auto_180296 ) ( ON-TABLE ?auto_180303 ) ( ON ?auto_180298 ?auto_180297 ) ( ON ?auto_180299 ?auto_180298 ) ( CLEAR ?auto_180299 ) ( HOLDING ?auto_180300 ) ( CLEAR ?auto_180301 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180304 ?auto_180302 ?auto_180301 ?auto_180300 )
      ( MAKE-7PILE ?auto_180296 ?auto_180297 ?auto_180298 ?auto_180299 ?auto_180300 ?auto_180301 ?auto_180302 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180305 - BLOCK
      ?auto_180306 - BLOCK
      ?auto_180307 - BLOCK
      ?auto_180308 - BLOCK
      ?auto_180309 - BLOCK
      ?auto_180310 - BLOCK
      ?auto_180311 - BLOCK
    )
    :vars
    (
      ?auto_180312 - BLOCK
      ?auto_180313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180305 ?auto_180306 ) ) ( not ( = ?auto_180305 ?auto_180307 ) ) ( not ( = ?auto_180305 ?auto_180308 ) ) ( not ( = ?auto_180305 ?auto_180309 ) ) ( not ( = ?auto_180305 ?auto_180310 ) ) ( not ( = ?auto_180305 ?auto_180311 ) ) ( not ( = ?auto_180306 ?auto_180307 ) ) ( not ( = ?auto_180306 ?auto_180308 ) ) ( not ( = ?auto_180306 ?auto_180309 ) ) ( not ( = ?auto_180306 ?auto_180310 ) ) ( not ( = ?auto_180306 ?auto_180311 ) ) ( not ( = ?auto_180307 ?auto_180308 ) ) ( not ( = ?auto_180307 ?auto_180309 ) ) ( not ( = ?auto_180307 ?auto_180310 ) ) ( not ( = ?auto_180307 ?auto_180311 ) ) ( not ( = ?auto_180308 ?auto_180309 ) ) ( not ( = ?auto_180308 ?auto_180310 ) ) ( not ( = ?auto_180308 ?auto_180311 ) ) ( not ( = ?auto_180309 ?auto_180310 ) ) ( not ( = ?auto_180309 ?auto_180311 ) ) ( not ( = ?auto_180310 ?auto_180311 ) ) ( ON ?auto_180311 ?auto_180312 ) ( not ( = ?auto_180305 ?auto_180312 ) ) ( not ( = ?auto_180306 ?auto_180312 ) ) ( not ( = ?auto_180307 ?auto_180312 ) ) ( not ( = ?auto_180308 ?auto_180312 ) ) ( not ( = ?auto_180309 ?auto_180312 ) ) ( not ( = ?auto_180310 ?auto_180312 ) ) ( not ( = ?auto_180311 ?auto_180312 ) ) ( ON ?auto_180310 ?auto_180311 ) ( ON-TABLE ?auto_180312 ) ( ON ?auto_180305 ?auto_180313 ) ( not ( = ?auto_180305 ?auto_180313 ) ) ( not ( = ?auto_180306 ?auto_180313 ) ) ( not ( = ?auto_180307 ?auto_180313 ) ) ( not ( = ?auto_180308 ?auto_180313 ) ) ( not ( = ?auto_180309 ?auto_180313 ) ) ( not ( = ?auto_180310 ?auto_180313 ) ) ( not ( = ?auto_180311 ?auto_180313 ) ) ( not ( = ?auto_180312 ?auto_180313 ) ) ( ON ?auto_180306 ?auto_180305 ) ( ON-TABLE ?auto_180313 ) ( ON ?auto_180307 ?auto_180306 ) ( ON ?auto_180308 ?auto_180307 ) ( CLEAR ?auto_180310 ) ( ON ?auto_180309 ?auto_180308 ) ( CLEAR ?auto_180309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180313 ?auto_180305 ?auto_180306 ?auto_180307 ?auto_180308 )
      ( MAKE-7PILE ?auto_180305 ?auto_180306 ?auto_180307 ?auto_180308 ?auto_180309 ?auto_180310 ?auto_180311 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180314 - BLOCK
      ?auto_180315 - BLOCK
      ?auto_180316 - BLOCK
      ?auto_180317 - BLOCK
      ?auto_180318 - BLOCK
      ?auto_180319 - BLOCK
      ?auto_180320 - BLOCK
    )
    :vars
    (
      ?auto_180322 - BLOCK
      ?auto_180321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180314 ?auto_180315 ) ) ( not ( = ?auto_180314 ?auto_180316 ) ) ( not ( = ?auto_180314 ?auto_180317 ) ) ( not ( = ?auto_180314 ?auto_180318 ) ) ( not ( = ?auto_180314 ?auto_180319 ) ) ( not ( = ?auto_180314 ?auto_180320 ) ) ( not ( = ?auto_180315 ?auto_180316 ) ) ( not ( = ?auto_180315 ?auto_180317 ) ) ( not ( = ?auto_180315 ?auto_180318 ) ) ( not ( = ?auto_180315 ?auto_180319 ) ) ( not ( = ?auto_180315 ?auto_180320 ) ) ( not ( = ?auto_180316 ?auto_180317 ) ) ( not ( = ?auto_180316 ?auto_180318 ) ) ( not ( = ?auto_180316 ?auto_180319 ) ) ( not ( = ?auto_180316 ?auto_180320 ) ) ( not ( = ?auto_180317 ?auto_180318 ) ) ( not ( = ?auto_180317 ?auto_180319 ) ) ( not ( = ?auto_180317 ?auto_180320 ) ) ( not ( = ?auto_180318 ?auto_180319 ) ) ( not ( = ?auto_180318 ?auto_180320 ) ) ( not ( = ?auto_180319 ?auto_180320 ) ) ( ON ?auto_180320 ?auto_180322 ) ( not ( = ?auto_180314 ?auto_180322 ) ) ( not ( = ?auto_180315 ?auto_180322 ) ) ( not ( = ?auto_180316 ?auto_180322 ) ) ( not ( = ?auto_180317 ?auto_180322 ) ) ( not ( = ?auto_180318 ?auto_180322 ) ) ( not ( = ?auto_180319 ?auto_180322 ) ) ( not ( = ?auto_180320 ?auto_180322 ) ) ( ON-TABLE ?auto_180322 ) ( ON ?auto_180314 ?auto_180321 ) ( not ( = ?auto_180314 ?auto_180321 ) ) ( not ( = ?auto_180315 ?auto_180321 ) ) ( not ( = ?auto_180316 ?auto_180321 ) ) ( not ( = ?auto_180317 ?auto_180321 ) ) ( not ( = ?auto_180318 ?auto_180321 ) ) ( not ( = ?auto_180319 ?auto_180321 ) ) ( not ( = ?auto_180320 ?auto_180321 ) ) ( not ( = ?auto_180322 ?auto_180321 ) ) ( ON ?auto_180315 ?auto_180314 ) ( ON-TABLE ?auto_180321 ) ( ON ?auto_180316 ?auto_180315 ) ( ON ?auto_180317 ?auto_180316 ) ( ON ?auto_180318 ?auto_180317 ) ( CLEAR ?auto_180318 ) ( HOLDING ?auto_180319 ) ( CLEAR ?auto_180320 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180322 ?auto_180320 ?auto_180319 )
      ( MAKE-7PILE ?auto_180314 ?auto_180315 ?auto_180316 ?auto_180317 ?auto_180318 ?auto_180319 ?auto_180320 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180323 - BLOCK
      ?auto_180324 - BLOCK
      ?auto_180325 - BLOCK
      ?auto_180326 - BLOCK
      ?auto_180327 - BLOCK
      ?auto_180328 - BLOCK
      ?auto_180329 - BLOCK
    )
    :vars
    (
      ?auto_180330 - BLOCK
      ?auto_180331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180323 ?auto_180324 ) ) ( not ( = ?auto_180323 ?auto_180325 ) ) ( not ( = ?auto_180323 ?auto_180326 ) ) ( not ( = ?auto_180323 ?auto_180327 ) ) ( not ( = ?auto_180323 ?auto_180328 ) ) ( not ( = ?auto_180323 ?auto_180329 ) ) ( not ( = ?auto_180324 ?auto_180325 ) ) ( not ( = ?auto_180324 ?auto_180326 ) ) ( not ( = ?auto_180324 ?auto_180327 ) ) ( not ( = ?auto_180324 ?auto_180328 ) ) ( not ( = ?auto_180324 ?auto_180329 ) ) ( not ( = ?auto_180325 ?auto_180326 ) ) ( not ( = ?auto_180325 ?auto_180327 ) ) ( not ( = ?auto_180325 ?auto_180328 ) ) ( not ( = ?auto_180325 ?auto_180329 ) ) ( not ( = ?auto_180326 ?auto_180327 ) ) ( not ( = ?auto_180326 ?auto_180328 ) ) ( not ( = ?auto_180326 ?auto_180329 ) ) ( not ( = ?auto_180327 ?auto_180328 ) ) ( not ( = ?auto_180327 ?auto_180329 ) ) ( not ( = ?auto_180328 ?auto_180329 ) ) ( ON ?auto_180329 ?auto_180330 ) ( not ( = ?auto_180323 ?auto_180330 ) ) ( not ( = ?auto_180324 ?auto_180330 ) ) ( not ( = ?auto_180325 ?auto_180330 ) ) ( not ( = ?auto_180326 ?auto_180330 ) ) ( not ( = ?auto_180327 ?auto_180330 ) ) ( not ( = ?auto_180328 ?auto_180330 ) ) ( not ( = ?auto_180329 ?auto_180330 ) ) ( ON-TABLE ?auto_180330 ) ( ON ?auto_180323 ?auto_180331 ) ( not ( = ?auto_180323 ?auto_180331 ) ) ( not ( = ?auto_180324 ?auto_180331 ) ) ( not ( = ?auto_180325 ?auto_180331 ) ) ( not ( = ?auto_180326 ?auto_180331 ) ) ( not ( = ?auto_180327 ?auto_180331 ) ) ( not ( = ?auto_180328 ?auto_180331 ) ) ( not ( = ?auto_180329 ?auto_180331 ) ) ( not ( = ?auto_180330 ?auto_180331 ) ) ( ON ?auto_180324 ?auto_180323 ) ( ON-TABLE ?auto_180331 ) ( ON ?auto_180325 ?auto_180324 ) ( ON ?auto_180326 ?auto_180325 ) ( ON ?auto_180327 ?auto_180326 ) ( CLEAR ?auto_180329 ) ( ON ?auto_180328 ?auto_180327 ) ( CLEAR ?auto_180328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180331 ?auto_180323 ?auto_180324 ?auto_180325 ?auto_180326 ?auto_180327 )
      ( MAKE-7PILE ?auto_180323 ?auto_180324 ?auto_180325 ?auto_180326 ?auto_180327 ?auto_180328 ?auto_180329 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180332 - BLOCK
      ?auto_180333 - BLOCK
      ?auto_180334 - BLOCK
      ?auto_180335 - BLOCK
      ?auto_180336 - BLOCK
      ?auto_180337 - BLOCK
      ?auto_180338 - BLOCK
    )
    :vars
    (
      ?auto_180339 - BLOCK
      ?auto_180340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180332 ?auto_180333 ) ) ( not ( = ?auto_180332 ?auto_180334 ) ) ( not ( = ?auto_180332 ?auto_180335 ) ) ( not ( = ?auto_180332 ?auto_180336 ) ) ( not ( = ?auto_180332 ?auto_180337 ) ) ( not ( = ?auto_180332 ?auto_180338 ) ) ( not ( = ?auto_180333 ?auto_180334 ) ) ( not ( = ?auto_180333 ?auto_180335 ) ) ( not ( = ?auto_180333 ?auto_180336 ) ) ( not ( = ?auto_180333 ?auto_180337 ) ) ( not ( = ?auto_180333 ?auto_180338 ) ) ( not ( = ?auto_180334 ?auto_180335 ) ) ( not ( = ?auto_180334 ?auto_180336 ) ) ( not ( = ?auto_180334 ?auto_180337 ) ) ( not ( = ?auto_180334 ?auto_180338 ) ) ( not ( = ?auto_180335 ?auto_180336 ) ) ( not ( = ?auto_180335 ?auto_180337 ) ) ( not ( = ?auto_180335 ?auto_180338 ) ) ( not ( = ?auto_180336 ?auto_180337 ) ) ( not ( = ?auto_180336 ?auto_180338 ) ) ( not ( = ?auto_180337 ?auto_180338 ) ) ( not ( = ?auto_180332 ?auto_180339 ) ) ( not ( = ?auto_180333 ?auto_180339 ) ) ( not ( = ?auto_180334 ?auto_180339 ) ) ( not ( = ?auto_180335 ?auto_180339 ) ) ( not ( = ?auto_180336 ?auto_180339 ) ) ( not ( = ?auto_180337 ?auto_180339 ) ) ( not ( = ?auto_180338 ?auto_180339 ) ) ( ON-TABLE ?auto_180339 ) ( ON ?auto_180332 ?auto_180340 ) ( not ( = ?auto_180332 ?auto_180340 ) ) ( not ( = ?auto_180333 ?auto_180340 ) ) ( not ( = ?auto_180334 ?auto_180340 ) ) ( not ( = ?auto_180335 ?auto_180340 ) ) ( not ( = ?auto_180336 ?auto_180340 ) ) ( not ( = ?auto_180337 ?auto_180340 ) ) ( not ( = ?auto_180338 ?auto_180340 ) ) ( not ( = ?auto_180339 ?auto_180340 ) ) ( ON ?auto_180333 ?auto_180332 ) ( ON-TABLE ?auto_180340 ) ( ON ?auto_180334 ?auto_180333 ) ( ON ?auto_180335 ?auto_180334 ) ( ON ?auto_180336 ?auto_180335 ) ( ON ?auto_180337 ?auto_180336 ) ( CLEAR ?auto_180337 ) ( HOLDING ?auto_180338 ) ( CLEAR ?auto_180339 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180339 ?auto_180338 )
      ( MAKE-7PILE ?auto_180332 ?auto_180333 ?auto_180334 ?auto_180335 ?auto_180336 ?auto_180337 ?auto_180338 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180341 - BLOCK
      ?auto_180342 - BLOCK
      ?auto_180343 - BLOCK
      ?auto_180344 - BLOCK
      ?auto_180345 - BLOCK
      ?auto_180346 - BLOCK
      ?auto_180347 - BLOCK
    )
    :vars
    (
      ?auto_180348 - BLOCK
      ?auto_180349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180341 ?auto_180342 ) ) ( not ( = ?auto_180341 ?auto_180343 ) ) ( not ( = ?auto_180341 ?auto_180344 ) ) ( not ( = ?auto_180341 ?auto_180345 ) ) ( not ( = ?auto_180341 ?auto_180346 ) ) ( not ( = ?auto_180341 ?auto_180347 ) ) ( not ( = ?auto_180342 ?auto_180343 ) ) ( not ( = ?auto_180342 ?auto_180344 ) ) ( not ( = ?auto_180342 ?auto_180345 ) ) ( not ( = ?auto_180342 ?auto_180346 ) ) ( not ( = ?auto_180342 ?auto_180347 ) ) ( not ( = ?auto_180343 ?auto_180344 ) ) ( not ( = ?auto_180343 ?auto_180345 ) ) ( not ( = ?auto_180343 ?auto_180346 ) ) ( not ( = ?auto_180343 ?auto_180347 ) ) ( not ( = ?auto_180344 ?auto_180345 ) ) ( not ( = ?auto_180344 ?auto_180346 ) ) ( not ( = ?auto_180344 ?auto_180347 ) ) ( not ( = ?auto_180345 ?auto_180346 ) ) ( not ( = ?auto_180345 ?auto_180347 ) ) ( not ( = ?auto_180346 ?auto_180347 ) ) ( not ( = ?auto_180341 ?auto_180348 ) ) ( not ( = ?auto_180342 ?auto_180348 ) ) ( not ( = ?auto_180343 ?auto_180348 ) ) ( not ( = ?auto_180344 ?auto_180348 ) ) ( not ( = ?auto_180345 ?auto_180348 ) ) ( not ( = ?auto_180346 ?auto_180348 ) ) ( not ( = ?auto_180347 ?auto_180348 ) ) ( ON-TABLE ?auto_180348 ) ( ON ?auto_180341 ?auto_180349 ) ( not ( = ?auto_180341 ?auto_180349 ) ) ( not ( = ?auto_180342 ?auto_180349 ) ) ( not ( = ?auto_180343 ?auto_180349 ) ) ( not ( = ?auto_180344 ?auto_180349 ) ) ( not ( = ?auto_180345 ?auto_180349 ) ) ( not ( = ?auto_180346 ?auto_180349 ) ) ( not ( = ?auto_180347 ?auto_180349 ) ) ( not ( = ?auto_180348 ?auto_180349 ) ) ( ON ?auto_180342 ?auto_180341 ) ( ON-TABLE ?auto_180349 ) ( ON ?auto_180343 ?auto_180342 ) ( ON ?auto_180344 ?auto_180343 ) ( ON ?auto_180345 ?auto_180344 ) ( ON ?auto_180346 ?auto_180345 ) ( CLEAR ?auto_180348 ) ( ON ?auto_180347 ?auto_180346 ) ( CLEAR ?auto_180347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180349 ?auto_180341 ?auto_180342 ?auto_180343 ?auto_180344 ?auto_180345 ?auto_180346 )
      ( MAKE-7PILE ?auto_180341 ?auto_180342 ?auto_180343 ?auto_180344 ?auto_180345 ?auto_180346 ?auto_180347 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180350 - BLOCK
      ?auto_180351 - BLOCK
      ?auto_180352 - BLOCK
      ?auto_180353 - BLOCK
      ?auto_180354 - BLOCK
      ?auto_180355 - BLOCK
      ?auto_180356 - BLOCK
    )
    :vars
    (
      ?auto_180358 - BLOCK
      ?auto_180357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180350 ?auto_180351 ) ) ( not ( = ?auto_180350 ?auto_180352 ) ) ( not ( = ?auto_180350 ?auto_180353 ) ) ( not ( = ?auto_180350 ?auto_180354 ) ) ( not ( = ?auto_180350 ?auto_180355 ) ) ( not ( = ?auto_180350 ?auto_180356 ) ) ( not ( = ?auto_180351 ?auto_180352 ) ) ( not ( = ?auto_180351 ?auto_180353 ) ) ( not ( = ?auto_180351 ?auto_180354 ) ) ( not ( = ?auto_180351 ?auto_180355 ) ) ( not ( = ?auto_180351 ?auto_180356 ) ) ( not ( = ?auto_180352 ?auto_180353 ) ) ( not ( = ?auto_180352 ?auto_180354 ) ) ( not ( = ?auto_180352 ?auto_180355 ) ) ( not ( = ?auto_180352 ?auto_180356 ) ) ( not ( = ?auto_180353 ?auto_180354 ) ) ( not ( = ?auto_180353 ?auto_180355 ) ) ( not ( = ?auto_180353 ?auto_180356 ) ) ( not ( = ?auto_180354 ?auto_180355 ) ) ( not ( = ?auto_180354 ?auto_180356 ) ) ( not ( = ?auto_180355 ?auto_180356 ) ) ( not ( = ?auto_180350 ?auto_180358 ) ) ( not ( = ?auto_180351 ?auto_180358 ) ) ( not ( = ?auto_180352 ?auto_180358 ) ) ( not ( = ?auto_180353 ?auto_180358 ) ) ( not ( = ?auto_180354 ?auto_180358 ) ) ( not ( = ?auto_180355 ?auto_180358 ) ) ( not ( = ?auto_180356 ?auto_180358 ) ) ( ON ?auto_180350 ?auto_180357 ) ( not ( = ?auto_180350 ?auto_180357 ) ) ( not ( = ?auto_180351 ?auto_180357 ) ) ( not ( = ?auto_180352 ?auto_180357 ) ) ( not ( = ?auto_180353 ?auto_180357 ) ) ( not ( = ?auto_180354 ?auto_180357 ) ) ( not ( = ?auto_180355 ?auto_180357 ) ) ( not ( = ?auto_180356 ?auto_180357 ) ) ( not ( = ?auto_180358 ?auto_180357 ) ) ( ON ?auto_180351 ?auto_180350 ) ( ON-TABLE ?auto_180357 ) ( ON ?auto_180352 ?auto_180351 ) ( ON ?auto_180353 ?auto_180352 ) ( ON ?auto_180354 ?auto_180353 ) ( ON ?auto_180355 ?auto_180354 ) ( ON ?auto_180356 ?auto_180355 ) ( CLEAR ?auto_180356 ) ( HOLDING ?auto_180358 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180358 )
      ( MAKE-7PILE ?auto_180350 ?auto_180351 ?auto_180352 ?auto_180353 ?auto_180354 ?auto_180355 ?auto_180356 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180359 - BLOCK
      ?auto_180360 - BLOCK
      ?auto_180361 - BLOCK
      ?auto_180362 - BLOCK
      ?auto_180363 - BLOCK
      ?auto_180364 - BLOCK
      ?auto_180365 - BLOCK
    )
    :vars
    (
      ?auto_180367 - BLOCK
      ?auto_180366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180359 ?auto_180360 ) ) ( not ( = ?auto_180359 ?auto_180361 ) ) ( not ( = ?auto_180359 ?auto_180362 ) ) ( not ( = ?auto_180359 ?auto_180363 ) ) ( not ( = ?auto_180359 ?auto_180364 ) ) ( not ( = ?auto_180359 ?auto_180365 ) ) ( not ( = ?auto_180360 ?auto_180361 ) ) ( not ( = ?auto_180360 ?auto_180362 ) ) ( not ( = ?auto_180360 ?auto_180363 ) ) ( not ( = ?auto_180360 ?auto_180364 ) ) ( not ( = ?auto_180360 ?auto_180365 ) ) ( not ( = ?auto_180361 ?auto_180362 ) ) ( not ( = ?auto_180361 ?auto_180363 ) ) ( not ( = ?auto_180361 ?auto_180364 ) ) ( not ( = ?auto_180361 ?auto_180365 ) ) ( not ( = ?auto_180362 ?auto_180363 ) ) ( not ( = ?auto_180362 ?auto_180364 ) ) ( not ( = ?auto_180362 ?auto_180365 ) ) ( not ( = ?auto_180363 ?auto_180364 ) ) ( not ( = ?auto_180363 ?auto_180365 ) ) ( not ( = ?auto_180364 ?auto_180365 ) ) ( not ( = ?auto_180359 ?auto_180367 ) ) ( not ( = ?auto_180360 ?auto_180367 ) ) ( not ( = ?auto_180361 ?auto_180367 ) ) ( not ( = ?auto_180362 ?auto_180367 ) ) ( not ( = ?auto_180363 ?auto_180367 ) ) ( not ( = ?auto_180364 ?auto_180367 ) ) ( not ( = ?auto_180365 ?auto_180367 ) ) ( ON ?auto_180359 ?auto_180366 ) ( not ( = ?auto_180359 ?auto_180366 ) ) ( not ( = ?auto_180360 ?auto_180366 ) ) ( not ( = ?auto_180361 ?auto_180366 ) ) ( not ( = ?auto_180362 ?auto_180366 ) ) ( not ( = ?auto_180363 ?auto_180366 ) ) ( not ( = ?auto_180364 ?auto_180366 ) ) ( not ( = ?auto_180365 ?auto_180366 ) ) ( not ( = ?auto_180367 ?auto_180366 ) ) ( ON ?auto_180360 ?auto_180359 ) ( ON-TABLE ?auto_180366 ) ( ON ?auto_180361 ?auto_180360 ) ( ON ?auto_180362 ?auto_180361 ) ( ON ?auto_180363 ?auto_180362 ) ( ON ?auto_180364 ?auto_180363 ) ( ON ?auto_180365 ?auto_180364 ) ( ON ?auto_180367 ?auto_180365 ) ( CLEAR ?auto_180367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180366 ?auto_180359 ?auto_180360 ?auto_180361 ?auto_180362 ?auto_180363 ?auto_180364 ?auto_180365 )
      ( MAKE-7PILE ?auto_180359 ?auto_180360 ?auto_180361 ?auto_180362 ?auto_180363 ?auto_180364 ?auto_180365 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180384 - BLOCK
      ?auto_180385 - BLOCK
      ?auto_180386 - BLOCK
      ?auto_180387 - BLOCK
      ?auto_180388 - BLOCK
      ?auto_180389 - BLOCK
      ?auto_180390 - BLOCK
      ?auto_180391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180390 ) ( ON-TABLE ?auto_180384 ) ( ON ?auto_180385 ?auto_180384 ) ( ON ?auto_180386 ?auto_180385 ) ( ON ?auto_180387 ?auto_180386 ) ( ON ?auto_180388 ?auto_180387 ) ( ON ?auto_180389 ?auto_180388 ) ( ON ?auto_180390 ?auto_180389 ) ( not ( = ?auto_180384 ?auto_180385 ) ) ( not ( = ?auto_180384 ?auto_180386 ) ) ( not ( = ?auto_180384 ?auto_180387 ) ) ( not ( = ?auto_180384 ?auto_180388 ) ) ( not ( = ?auto_180384 ?auto_180389 ) ) ( not ( = ?auto_180384 ?auto_180390 ) ) ( not ( = ?auto_180384 ?auto_180391 ) ) ( not ( = ?auto_180385 ?auto_180386 ) ) ( not ( = ?auto_180385 ?auto_180387 ) ) ( not ( = ?auto_180385 ?auto_180388 ) ) ( not ( = ?auto_180385 ?auto_180389 ) ) ( not ( = ?auto_180385 ?auto_180390 ) ) ( not ( = ?auto_180385 ?auto_180391 ) ) ( not ( = ?auto_180386 ?auto_180387 ) ) ( not ( = ?auto_180386 ?auto_180388 ) ) ( not ( = ?auto_180386 ?auto_180389 ) ) ( not ( = ?auto_180386 ?auto_180390 ) ) ( not ( = ?auto_180386 ?auto_180391 ) ) ( not ( = ?auto_180387 ?auto_180388 ) ) ( not ( = ?auto_180387 ?auto_180389 ) ) ( not ( = ?auto_180387 ?auto_180390 ) ) ( not ( = ?auto_180387 ?auto_180391 ) ) ( not ( = ?auto_180388 ?auto_180389 ) ) ( not ( = ?auto_180388 ?auto_180390 ) ) ( not ( = ?auto_180388 ?auto_180391 ) ) ( not ( = ?auto_180389 ?auto_180390 ) ) ( not ( = ?auto_180389 ?auto_180391 ) ) ( not ( = ?auto_180390 ?auto_180391 ) ) ( ON-TABLE ?auto_180391 ) ( CLEAR ?auto_180391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_180391 )
      ( MAKE-8PILE ?auto_180384 ?auto_180385 ?auto_180386 ?auto_180387 ?auto_180388 ?auto_180389 ?auto_180390 ?auto_180391 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180392 - BLOCK
      ?auto_180393 - BLOCK
      ?auto_180394 - BLOCK
      ?auto_180395 - BLOCK
      ?auto_180396 - BLOCK
      ?auto_180397 - BLOCK
      ?auto_180398 - BLOCK
      ?auto_180399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180392 ) ( ON ?auto_180393 ?auto_180392 ) ( ON ?auto_180394 ?auto_180393 ) ( ON ?auto_180395 ?auto_180394 ) ( ON ?auto_180396 ?auto_180395 ) ( ON ?auto_180397 ?auto_180396 ) ( not ( = ?auto_180392 ?auto_180393 ) ) ( not ( = ?auto_180392 ?auto_180394 ) ) ( not ( = ?auto_180392 ?auto_180395 ) ) ( not ( = ?auto_180392 ?auto_180396 ) ) ( not ( = ?auto_180392 ?auto_180397 ) ) ( not ( = ?auto_180392 ?auto_180398 ) ) ( not ( = ?auto_180392 ?auto_180399 ) ) ( not ( = ?auto_180393 ?auto_180394 ) ) ( not ( = ?auto_180393 ?auto_180395 ) ) ( not ( = ?auto_180393 ?auto_180396 ) ) ( not ( = ?auto_180393 ?auto_180397 ) ) ( not ( = ?auto_180393 ?auto_180398 ) ) ( not ( = ?auto_180393 ?auto_180399 ) ) ( not ( = ?auto_180394 ?auto_180395 ) ) ( not ( = ?auto_180394 ?auto_180396 ) ) ( not ( = ?auto_180394 ?auto_180397 ) ) ( not ( = ?auto_180394 ?auto_180398 ) ) ( not ( = ?auto_180394 ?auto_180399 ) ) ( not ( = ?auto_180395 ?auto_180396 ) ) ( not ( = ?auto_180395 ?auto_180397 ) ) ( not ( = ?auto_180395 ?auto_180398 ) ) ( not ( = ?auto_180395 ?auto_180399 ) ) ( not ( = ?auto_180396 ?auto_180397 ) ) ( not ( = ?auto_180396 ?auto_180398 ) ) ( not ( = ?auto_180396 ?auto_180399 ) ) ( not ( = ?auto_180397 ?auto_180398 ) ) ( not ( = ?auto_180397 ?auto_180399 ) ) ( not ( = ?auto_180398 ?auto_180399 ) ) ( ON-TABLE ?auto_180399 ) ( CLEAR ?auto_180399 ) ( HOLDING ?auto_180398 ) ( CLEAR ?auto_180397 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180392 ?auto_180393 ?auto_180394 ?auto_180395 ?auto_180396 ?auto_180397 ?auto_180398 )
      ( MAKE-8PILE ?auto_180392 ?auto_180393 ?auto_180394 ?auto_180395 ?auto_180396 ?auto_180397 ?auto_180398 ?auto_180399 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180400 - BLOCK
      ?auto_180401 - BLOCK
      ?auto_180402 - BLOCK
      ?auto_180403 - BLOCK
      ?auto_180404 - BLOCK
      ?auto_180405 - BLOCK
      ?auto_180406 - BLOCK
      ?auto_180407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180400 ) ( ON ?auto_180401 ?auto_180400 ) ( ON ?auto_180402 ?auto_180401 ) ( ON ?auto_180403 ?auto_180402 ) ( ON ?auto_180404 ?auto_180403 ) ( ON ?auto_180405 ?auto_180404 ) ( not ( = ?auto_180400 ?auto_180401 ) ) ( not ( = ?auto_180400 ?auto_180402 ) ) ( not ( = ?auto_180400 ?auto_180403 ) ) ( not ( = ?auto_180400 ?auto_180404 ) ) ( not ( = ?auto_180400 ?auto_180405 ) ) ( not ( = ?auto_180400 ?auto_180406 ) ) ( not ( = ?auto_180400 ?auto_180407 ) ) ( not ( = ?auto_180401 ?auto_180402 ) ) ( not ( = ?auto_180401 ?auto_180403 ) ) ( not ( = ?auto_180401 ?auto_180404 ) ) ( not ( = ?auto_180401 ?auto_180405 ) ) ( not ( = ?auto_180401 ?auto_180406 ) ) ( not ( = ?auto_180401 ?auto_180407 ) ) ( not ( = ?auto_180402 ?auto_180403 ) ) ( not ( = ?auto_180402 ?auto_180404 ) ) ( not ( = ?auto_180402 ?auto_180405 ) ) ( not ( = ?auto_180402 ?auto_180406 ) ) ( not ( = ?auto_180402 ?auto_180407 ) ) ( not ( = ?auto_180403 ?auto_180404 ) ) ( not ( = ?auto_180403 ?auto_180405 ) ) ( not ( = ?auto_180403 ?auto_180406 ) ) ( not ( = ?auto_180403 ?auto_180407 ) ) ( not ( = ?auto_180404 ?auto_180405 ) ) ( not ( = ?auto_180404 ?auto_180406 ) ) ( not ( = ?auto_180404 ?auto_180407 ) ) ( not ( = ?auto_180405 ?auto_180406 ) ) ( not ( = ?auto_180405 ?auto_180407 ) ) ( not ( = ?auto_180406 ?auto_180407 ) ) ( ON-TABLE ?auto_180407 ) ( CLEAR ?auto_180405 ) ( ON ?auto_180406 ?auto_180407 ) ( CLEAR ?auto_180406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180407 )
      ( MAKE-8PILE ?auto_180400 ?auto_180401 ?auto_180402 ?auto_180403 ?auto_180404 ?auto_180405 ?auto_180406 ?auto_180407 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180408 - BLOCK
      ?auto_180409 - BLOCK
      ?auto_180410 - BLOCK
      ?auto_180411 - BLOCK
      ?auto_180412 - BLOCK
      ?auto_180413 - BLOCK
      ?auto_180414 - BLOCK
      ?auto_180415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180408 ) ( ON ?auto_180409 ?auto_180408 ) ( ON ?auto_180410 ?auto_180409 ) ( ON ?auto_180411 ?auto_180410 ) ( ON ?auto_180412 ?auto_180411 ) ( not ( = ?auto_180408 ?auto_180409 ) ) ( not ( = ?auto_180408 ?auto_180410 ) ) ( not ( = ?auto_180408 ?auto_180411 ) ) ( not ( = ?auto_180408 ?auto_180412 ) ) ( not ( = ?auto_180408 ?auto_180413 ) ) ( not ( = ?auto_180408 ?auto_180414 ) ) ( not ( = ?auto_180408 ?auto_180415 ) ) ( not ( = ?auto_180409 ?auto_180410 ) ) ( not ( = ?auto_180409 ?auto_180411 ) ) ( not ( = ?auto_180409 ?auto_180412 ) ) ( not ( = ?auto_180409 ?auto_180413 ) ) ( not ( = ?auto_180409 ?auto_180414 ) ) ( not ( = ?auto_180409 ?auto_180415 ) ) ( not ( = ?auto_180410 ?auto_180411 ) ) ( not ( = ?auto_180410 ?auto_180412 ) ) ( not ( = ?auto_180410 ?auto_180413 ) ) ( not ( = ?auto_180410 ?auto_180414 ) ) ( not ( = ?auto_180410 ?auto_180415 ) ) ( not ( = ?auto_180411 ?auto_180412 ) ) ( not ( = ?auto_180411 ?auto_180413 ) ) ( not ( = ?auto_180411 ?auto_180414 ) ) ( not ( = ?auto_180411 ?auto_180415 ) ) ( not ( = ?auto_180412 ?auto_180413 ) ) ( not ( = ?auto_180412 ?auto_180414 ) ) ( not ( = ?auto_180412 ?auto_180415 ) ) ( not ( = ?auto_180413 ?auto_180414 ) ) ( not ( = ?auto_180413 ?auto_180415 ) ) ( not ( = ?auto_180414 ?auto_180415 ) ) ( ON-TABLE ?auto_180415 ) ( ON ?auto_180414 ?auto_180415 ) ( CLEAR ?auto_180414 ) ( HOLDING ?auto_180413 ) ( CLEAR ?auto_180412 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180408 ?auto_180409 ?auto_180410 ?auto_180411 ?auto_180412 ?auto_180413 )
      ( MAKE-8PILE ?auto_180408 ?auto_180409 ?auto_180410 ?auto_180411 ?auto_180412 ?auto_180413 ?auto_180414 ?auto_180415 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180416 - BLOCK
      ?auto_180417 - BLOCK
      ?auto_180418 - BLOCK
      ?auto_180419 - BLOCK
      ?auto_180420 - BLOCK
      ?auto_180421 - BLOCK
      ?auto_180422 - BLOCK
      ?auto_180423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180416 ) ( ON ?auto_180417 ?auto_180416 ) ( ON ?auto_180418 ?auto_180417 ) ( ON ?auto_180419 ?auto_180418 ) ( ON ?auto_180420 ?auto_180419 ) ( not ( = ?auto_180416 ?auto_180417 ) ) ( not ( = ?auto_180416 ?auto_180418 ) ) ( not ( = ?auto_180416 ?auto_180419 ) ) ( not ( = ?auto_180416 ?auto_180420 ) ) ( not ( = ?auto_180416 ?auto_180421 ) ) ( not ( = ?auto_180416 ?auto_180422 ) ) ( not ( = ?auto_180416 ?auto_180423 ) ) ( not ( = ?auto_180417 ?auto_180418 ) ) ( not ( = ?auto_180417 ?auto_180419 ) ) ( not ( = ?auto_180417 ?auto_180420 ) ) ( not ( = ?auto_180417 ?auto_180421 ) ) ( not ( = ?auto_180417 ?auto_180422 ) ) ( not ( = ?auto_180417 ?auto_180423 ) ) ( not ( = ?auto_180418 ?auto_180419 ) ) ( not ( = ?auto_180418 ?auto_180420 ) ) ( not ( = ?auto_180418 ?auto_180421 ) ) ( not ( = ?auto_180418 ?auto_180422 ) ) ( not ( = ?auto_180418 ?auto_180423 ) ) ( not ( = ?auto_180419 ?auto_180420 ) ) ( not ( = ?auto_180419 ?auto_180421 ) ) ( not ( = ?auto_180419 ?auto_180422 ) ) ( not ( = ?auto_180419 ?auto_180423 ) ) ( not ( = ?auto_180420 ?auto_180421 ) ) ( not ( = ?auto_180420 ?auto_180422 ) ) ( not ( = ?auto_180420 ?auto_180423 ) ) ( not ( = ?auto_180421 ?auto_180422 ) ) ( not ( = ?auto_180421 ?auto_180423 ) ) ( not ( = ?auto_180422 ?auto_180423 ) ) ( ON-TABLE ?auto_180423 ) ( ON ?auto_180422 ?auto_180423 ) ( CLEAR ?auto_180420 ) ( ON ?auto_180421 ?auto_180422 ) ( CLEAR ?auto_180421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180423 ?auto_180422 )
      ( MAKE-8PILE ?auto_180416 ?auto_180417 ?auto_180418 ?auto_180419 ?auto_180420 ?auto_180421 ?auto_180422 ?auto_180423 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180424 - BLOCK
      ?auto_180425 - BLOCK
      ?auto_180426 - BLOCK
      ?auto_180427 - BLOCK
      ?auto_180428 - BLOCK
      ?auto_180429 - BLOCK
      ?auto_180430 - BLOCK
      ?auto_180431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180424 ) ( ON ?auto_180425 ?auto_180424 ) ( ON ?auto_180426 ?auto_180425 ) ( ON ?auto_180427 ?auto_180426 ) ( not ( = ?auto_180424 ?auto_180425 ) ) ( not ( = ?auto_180424 ?auto_180426 ) ) ( not ( = ?auto_180424 ?auto_180427 ) ) ( not ( = ?auto_180424 ?auto_180428 ) ) ( not ( = ?auto_180424 ?auto_180429 ) ) ( not ( = ?auto_180424 ?auto_180430 ) ) ( not ( = ?auto_180424 ?auto_180431 ) ) ( not ( = ?auto_180425 ?auto_180426 ) ) ( not ( = ?auto_180425 ?auto_180427 ) ) ( not ( = ?auto_180425 ?auto_180428 ) ) ( not ( = ?auto_180425 ?auto_180429 ) ) ( not ( = ?auto_180425 ?auto_180430 ) ) ( not ( = ?auto_180425 ?auto_180431 ) ) ( not ( = ?auto_180426 ?auto_180427 ) ) ( not ( = ?auto_180426 ?auto_180428 ) ) ( not ( = ?auto_180426 ?auto_180429 ) ) ( not ( = ?auto_180426 ?auto_180430 ) ) ( not ( = ?auto_180426 ?auto_180431 ) ) ( not ( = ?auto_180427 ?auto_180428 ) ) ( not ( = ?auto_180427 ?auto_180429 ) ) ( not ( = ?auto_180427 ?auto_180430 ) ) ( not ( = ?auto_180427 ?auto_180431 ) ) ( not ( = ?auto_180428 ?auto_180429 ) ) ( not ( = ?auto_180428 ?auto_180430 ) ) ( not ( = ?auto_180428 ?auto_180431 ) ) ( not ( = ?auto_180429 ?auto_180430 ) ) ( not ( = ?auto_180429 ?auto_180431 ) ) ( not ( = ?auto_180430 ?auto_180431 ) ) ( ON-TABLE ?auto_180431 ) ( ON ?auto_180430 ?auto_180431 ) ( ON ?auto_180429 ?auto_180430 ) ( CLEAR ?auto_180429 ) ( HOLDING ?auto_180428 ) ( CLEAR ?auto_180427 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180424 ?auto_180425 ?auto_180426 ?auto_180427 ?auto_180428 )
      ( MAKE-8PILE ?auto_180424 ?auto_180425 ?auto_180426 ?auto_180427 ?auto_180428 ?auto_180429 ?auto_180430 ?auto_180431 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180432 - BLOCK
      ?auto_180433 - BLOCK
      ?auto_180434 - BLOCK
      ?auto_180435 - BLOCK
      ?auto_180436 - BLOCK
      ?auto_180437 - BLOCK
      ?auto_180438 - BLOCK
      ?auto_180439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180432 ) ( ON ?auto_180433 ?auto_180432 ) ( ON ?auto_180434 ?auto_180433 ) ( ON ?auto_180435 ?auto_180434 ) ( not ( = ?auto_180432 ?auto_180433 ) ) ( not ( = ?auto_180432 ?auto_180434 ) ) ( not ( = ?auto_180432 ?auto_180435 ) ) ( not ( = ?auto_180432 ?auto_180436 ) ) ( not ( = ?auto_180432 ?auto_180437 ) ) ( not ( = ?auto_180432 ?auto_180438 ) ) ( not ( = ?auto_180432 ?auto_180439 ) ) ( not ( = ?auto_180433 ?auto_180434 ) ) ( not ( = ?auto_180433 ?auto_180435 ) ) ( not ( = ?auto_180433 ?auto_180436 ) ) ( not ( = ?auto_180433 ?auto_180437 ) ) ( not ( = ?auto_180433 ?auto_180438 ) ) ( not ( = ?auto_180433 ?auto_180439 ) ) ( not ( = ?auto_180434 ?auto_180435 ) ) ( not ( = ?auto_180434 ?auto_180436 ) ) ( not ( = ?auto_180434 ?auto_180437 ) ) ( not ( = ?auto_180434 ?auto_180438 ) ) ( not ( = ?auto_180434 ?auto_180439 ) ) ( not ( = ?auto_180435 ?auto_180436 ) ) ( not ( = ?auto_180435 ?auto_180437 ) ) ( not ( = ?auto_180435 ?auto_180438 ) ) ( not ( = ?auto_180435 ?auto_180439 ) ) ( not ( = ?auto_180436 ?auto_180437 ) ) ( not ( = ?auto_180436 ?auto_180438 ) ) ( not ( = ?auto_180436 ?auto_180439 ) ) ( not ( = ?auto_180437 ?auto_180438 ) ) ( not ( = ?auto_180437 ?auto_180439 ) ) ( not ( = ?auto_180438 ?auto_180439 ) ) ( ON-TABLE ?auto_180439 ) ( ON ?auto_180438 ?auto_180439 ) ( ON ?auto_180437 ?auto_180438 ) ( CLEAR ?auto_180435 ) ( ON ?auto_180436 ?auto_180437 ) ( CLEAR ?auto_180436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180439 ?auto_180438 ?auto_180437 )
      ( MAKE-8PILE ?auto_180432 ?auto_180433 ?auto_180434 ?auto_180435 ?auto_180436 ?auto_180437 ?auto_180438 ?auto_180439 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180440 - BLOCK
      ?auto_180441 - BLOCK
      ?auto_180442 - BLOCK
      ?auto_180443 - BLOCK
      ?auto_180444 - BLOCK
      ?auto_180445 - BLOCK
      ?auto_180446 - BLOCK
      ?auto_180447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180440 ) ( ON ?auto_180441 ?auto_180440 ) ( ON ?auto_180442 ?auto_180441 ) ( not ( = ?auto_180440 ?auto_180441 ) ) ( not ( = ?auto_180440 ?auto_180442 ) ) ( not ( = ?auto_180440 ?auto_180443 ) ) ( not ( = ?auto_180440 ?auto_180444 ) ) ( not ( = ?auto_180440 ?auto_180445 ) ) ( not ( = ?auto_180440 ?auto_180446 ) ) ( not ( = ?auto_180440 ?auto_180447 ) ) ( not ( = ?auto_180441 ?auto_180442 ) ) ( not ( = ?auto_180441 ?auto_180443 ) ) ( not ( = ?auto_180441 ?auto_180444 ) ) ( not ( = ?auto_180441 ?auto_180445 ) ) ( not ( = ?auto_180441 ?auto_180446 ) ) ( not ( = ?auto_180441 ?auto_180447 ) ) ( not ( = ?auto_180442 ?auto_180443 ) ) ( not ( = ?auto_180442 ?auto_180444 ) ) ( not ( = ?auto_180442 ?auto_180445 ) ) ( not ( = ?auto_180442 ?auto_180446 ) ) ( not ( = ?auto_180442 ?auto_180447 ) ) ( not ( = ?auto_180443 ?auto_180444 ) ) ( not ( = ?auto_180443 ?auto_180445 ) ) ( not ( = ?auto_180443 ?auto_180446 ) ) ( not ( = ?auto_180443 ?auto_180447 ) ) ( not ( = ?auto_180444 ?auto_180445 ) ) ( not ( = ?auto_180444 ?auto_180446 ) ) ( not ( = ?auto_180444 ?auto_180447 ) ) ( not ( = ?auto_180445 ?auto_180446 ) ) ( not ( = ?auto_180445 ?auto_180447 ) ) ( not ( = ?auto_180446 ?auto_180447 ) ) ( ON-TABLE ?auto_180447 ) ( ON ?auto_180446 ?auto_180447 ) ( ON ?auto_180445 ?auto_180446 ) ( ON ?auto_180444 ?auto_180445 ) ( CLEAR ?auto_180444 ) ( HOLDING ?auto_180443 ) ( CLEAR ?auto_180442 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180440 ?auto_180441 ?auto_180442 ?auto_180443 )
      ( MAKE-8PILE ?auto_180440 ?auto_180441 ?auto_180442 ?auto_180443 ?auto_180444 ?auto_180445 ?auto_180446 ?auto_180447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180448 - BLOCK
      ?auto_180449 - BLOCK
      ?auto_180450 - BLOCK
      ?auto_180451 - BLOCK
      ?auto_180452 - BLOCK
      ?auto_180453 - BLOCK
      ?auto_180454 - BLOCK
      ?auto_180455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180448 ) ( ON ?auto_180449 ?auto_180448 ) ( ON ?auto_180450 ?auto_180449 ) ( not ( = ?auto_180448 ?auto_180449 ) ) ( not ( = ?auto_180448 ?auto_180450 ) ) ( not ( = ?auto_180448 ?auto_180451 ) ) ( not ( = ?auto_180448 ?auto_180452 ) ) ( not ( = ?auto_180448 ?auto_180453 ) ) ( not ( = ?auto_180448 ?auto_180454 ) ) ( not ( = ?auto_180448 ?auto_180455 ) ) ( not ( = ?auto_180449 ?auto_180450 ) ) ( not ( = ?auto_180449 ?auto_180451 ) ) ( not ( = ?auto_180449 ?auto_180452 ) ) ( not ( = ?auto_180449 ?auto_180453 ) ) ( not ( = ?auto_180449 ?auto_180454 ) ) ( not ( = ?auto_180449 ?auto_180455 ) ) ( not ( = ?auto_180450 ?auto_180451 ) ) ( not ( = ?auto_180450 ?auto_180452 ) ) ( not ( = ?auto_180450 ?auto_180453 ) ) ( not ( = ?auto_180450 ?auto_180454 ) ) ( not ( = ?auto_180450 ?auto_180455 ) ) ( not ( = ?auto_180451 ?auto_180452 ) ) ( not ( = ?auto_180451 ?auto_180453 ) ) ( not ( = ?auto_180451 ?auto_180454 ) ) ( not ( = ?auto_180451 ?auto_180455 ) ) ( not ( = ?auto_180452 ?auto_180453 ) ) ( not ( = ?auto_180452 ?auto_180454 ) ) ( not ( = ?auto_180452 ?auto_180455 ) ) ( not ( = ?auto_180453 ?auto_180454 ) ) ( not ( = ?auto_180453 ?auto_180455 ) ) ( not ( = ?auto_180454 ?auto_180455 ) ) ( ON-TABLE ?auto_180455 ) ( ON ?auto_180454 ?auto_180455 ) ( ON ?auto_180453 ?auto_180454 ) ( ON ?auto_180452 ?auto_180453 ) ( CLEAR ?auto_180450 ) ( ON ?auto_180451 ?auto_180452 ) ( CLEAR ?auto_180451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180455 ?auto_180454 ?auto_180453 ?auto_180452 )
      ( MAKE-8PILE ?auto_180448 ?auto_180449 ?auto_180450 ?auto_180451 ?auto_180452 ?auto_180453 ?auto_180454 ?auto_180455 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180456 - BLOCK
      ?auto_180457 - BLOCK
      ?auto_180458 - BLOCK
      ?auto_180459 - BLOCK
      ?auto_180460 - BLOCK
      ?auto_180461 - BLOCK
      ?auto_180462 - BLOCK
      ?auto_180463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180456 ) ( ON ?auto_180457 ?auto_180456 ) ( not ( = ?auto_180456 ?auto_180457 ) ) ( not ( = ?auto_180456 ?auto_180458 ) ) ( not ( = ?auto_180456 ?auto_180459 ) ) ( not ( = ?auto_180456 ?auto_180460 ) ) ( not ( = ?auto_180456 ?auto_180461 ) ) ( not ( = ?auto_180456 ?auto_180462 ) ) ( not ( = ?auto_180456 ?auto_180463 ) ) ( not ( = ?auto_180457 ?auto_180458 ) ) ( not ( = ?auto_180457 ?auto_180459 ) ) ( not ( = ?auto_180457 ?auto_180460 ) ) ( not ( = ?auto_180457 ?auto_180461 ) ) ( not ( = ?auto_180457 ?auto_180462 ) ) ( not ( = ?auto_180457 ?auto_180463 ) ) ( not ( = ?auto_180458 ?auto_180459 ) ) ( not ( = ?auto_180458 ?auto_180460 ) ) ( not ( = ?auto_180458 ?auto_180461 ) ) ( not ( = ?auto_180458 ?auto_180462 ) ) ( not ( = ?auto_180458 ?auto_180463 ) ) ( not ( = ?auto_180459 ?auto_180460 ) ) ( not ( = ?auto_180459 ?auto_180461 ) ) ( not ( = ?auto_180459 ?auto_180462 ) ) ( not ( = ?auto_180459 ?auto_180463 ) ) ( not ( = ?auto_180460 ?auto_180461 ) ) ( not ( = ?auto_180460 ?auto_180462 ) ) ( not ( = ?auto_180460 ?auto_180463 ) ) ( not ( = ?auto_180461 ?auto_180462 ) ) ( not ( = ?auto_180461 ?auto_180463 ) ) ( not ( = ?auto_180462 ?auto_180463 ) ) ( ON-TABLE ?auto_180463 ) ( ON ?auto_180462 ?auto_180463 ) ( ON ?auto_180461 ?auto_180462 ) ( ON ?auto_180460 ?auto_180461 ) ( ON ?auto_180459 ?auto_180460 ) ( CLEAR ?auto_180459 ) ( HOLDING ?auto_180458 ) ( CLEAR ?auto_180457 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180456 ?auto_180457 ?auto_180458 )
      ( MAKE-8PILE ?auto_180456 ?auto_180457 ?auto_180458 ?auto_180459 ?auto_180460 ?auto_180461 ?auto_180462 ?auto_180463 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180464 - BLOCK
      ?auto_180465 - BLOCK
      ?auto_180466 - BLOCK
      ?auto_180467 - BLOCK
      ?auto_180468 - BLOCK
      ?auto_180469 - BLOCK
      ?auto_180470 - BLOCK
      ?auto_180471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180464 ) ( ON ?auto_180465 ?auto_180464 ) ( not ( = ?auto_180464 ?auto_180465 ) ) ( not ( = ?auto_180464 ?auto_180466 ) ) ( not ( = ?auto_180464 ?auto_180467 ) ) ( not ( = ?auto_180464 ?auto_180468 ) ) ( not ( = ?auto_180464 ?auto_180469 ) ) ( not ( = ?auto_180464 ?auto_180470 ) ) ( not ( = ?auto_180464 ?auto_180471 ) ) ( not ( = ?auto_180465 ?auto_180466 ) ) ( not ( = ?auto_180465 ?auto_180467 ) ) ( not ( = ?auto_180465 ?auto_180468 ) ) ( not ( = ?auto_180465 ?auto_180469 ) ) ( not ( = ?auto_180465 ?auto_180470 ) ) ( not ( = ?auto_180465 ?auto_180471 ) ) ( not ( = ?auto_180466 ?auto_180467 ) ) ( not ( = ?auto_180466 ?auto_180468 ) ) ( not ( = ?auto_180466 ?auto_180469 ) ) ( not ( = ?auto_180466 ?auto_180470 ) ) ( not ( = ?auto_180466 ?auto_180471 ) ) ( not ( = ?auto_180467 ?auto_180468 ) ) ( not ( = ?auto_180467 ?auto_180469 ) ) ( not ( = ?auto_180467 ?auto_180470 ) ) ( not ( = ?auto_180467 ?auto_180471 ) ) ( not ( = ?auto_180468 ?auto_180469 ) ) ( not ( = ?auto_180468 ?auto_180470 ) ) ( not ( = ?auto_180468 ?auto_180471 ) ) ( not ( = ?auto_180469 ?auto_180470 ) ) ( not ( = ?auto_180469 ?auto_180471 ) ) ( not ( = ?auto_180470 ?auto_180471 ) ) ( ON-TABLE ?auto_180471 ) ( ON ?auto_180470 ?auto_180471 ) ( ON ?auto_180469 ?auto_180470 ) ( ON ?auto_180468 ?auto_180469 ) ( ON ?auto_180467 ?auto_180468 ) ( CLEAR ?auto_180465 ) ( ON ?auto_180466 ?auto_180467 ) ( CLEAR ?auto_180466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180471 ?auto_180470 ?auto_180469 ?auto_180468 ?auto_180467 )
      ( MAKE-8PILE ?auto_180464 ?auto_180465 ?auto_180466 ?auto_180467 ?auto_180468 ?auto_180469 ?auto_180470 ?auto_180471 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180472 - BLOCK
      ?auto_180473 - BLOCK
      ?auto_180474 - BLOCK
      ?auto_180475 - BLOCK
      ?auto_180476 - BLOCK
      ?auto_180477 - BLOCK
      ?auto_180478 - BLOCK
      ?auto_180479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180472 ) ( not ( = ?auto_180472 ?auto_180473 ) ) ( not ( = ?auto_180472 ?auto_180474 ) ) ( not ( = ?auto_180472 ?auto_180475 ) ) ( not ( = ?auto_180472 ?auto_180476 ) ) ( not ( = ?auto_180472 ?auto_180477 ) ) ( not ( = ?auto_180472 ?auto_180478 ) ) ( not ( = ?auto_180472 ?auto_180479 ) ) ( not ( = ?auto_180473 ?auto_180474 ) ) ( not ( = ?auto_180473 ?auto_180475 ) ) ( not ( = ?auto_180473 ?auto_180476 ) ) ( not ( = ?auto_180473 ?auto_180477 ) ) ( not ( = ?auto_180473 ?auto_180478 ) ) ( not ( = ?auto_180473 ?auto_180479 ) ) ( not ( = ?auto_180474 ?auto_180475 ) ) ( not ( = ?auto_180474 ?auto_180476 ) ) ( not ( = ?auto_180474 ?auto_180477 ) ) ( not ( = ?auto_180474 ?auto_180478 ) ) ( not ( = ?auto_180474 ?auto_180479 ) ) ( not ( = ?auto_180475 ?auto_180476 ) ) ( not ( = ?auto_180475 ?auto_180477 ) ) ( not ( = ?auto_180475 ?auto_180478 ) ) ( not ( = ?auto_180475 ?auto_180479 ) ) ( not ( = ?auto_180476 ?auto_180477 ) ) ( not ( = ?auto_180476 ?auto_180478 ) ) ( not ( = ?auto_180476 ?auto_180479 ) ) ( not ( = ?auto_180477 ?auto_180478 ) ) ( not ( = ?auto_180477 ?auto_180479 ) ) ( not ( = ?auto_180478 ?auto_180479 ) ) ( ON-TABLE ?auto_180479 ) ( ON ?auto_180478 ?auto_180479 ) ( ON ?auto_180477 ?auto_180478 ) ( ON ?auto_180476 ?auto_180477 ) ( ON ?auto_180475 ?auto_180476 ) ( ON ?auto_180474 ?auto_180475 ) ( CLEAR ?auto_180474 ) ( HOLDING ?auto_180473 ) ( CLEAR ?auto_180472 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180472 ?auto_180473 )
      ( MAKE-8PILE ?auto_180472 ?auto_180473 ?auto_180474 ?auto_180475 ?auto_180476 ?auto_180477 ?auto_180478 ?auto_180479 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180480 - BLOCK
      ?auto_180481 - BLOCK
      ?auto_180482 - BLOCK
      ?auto_180483 - BLOCK
      ?auto_180484 - BLOCK
      ?auto_180485 - BLOCK
      ?auto_180486 - BLOCK
      ?auto_180487 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180480 ) ( not ( = ?auto_180480 ?auto_180481 ) ) ( not ( = ?auto_180480 ?auto_180482 ) ) ( not ( = ?auto_180480 ?auto_180483 ) ) ( not ( = ?auto_180480 ?auto_180484 ) ) ( not ( = ?auto_180480 ?auto_180485 ) ) ( not ( = ?auto_180480 ?auto_180486 ) ) ( not ( = ?auto_180480 ?auto_180487 ) ) ( not ( = ?auto_180481 ?auto_180482 ) ) ( not ( = ?auto_180481 ?auto_180483 ) ) ( not ( = ?auto_180481 ?auto_180484 ) ) ( not ( = ?auto_180481 ?auto_180485 ) ) ( not ( = ?auto_180481 ?auto_180486 ) ) ( not ( = ?auto_180481 ?auto_180487 ) ) ( not ( = ?auto_180482 ?auto_180483 ) ) ( not ( = ?auto_180482 ?auto_180484 ) ) ( not ( = ?auto_180482 ?auto_180485 ) ) ( not ( = ?auto_180482 ?auto_180486 ) ) ( not ( = ?auto_180482 ?auto_180487 ) ) ( not ( = ?auto_180483 ?auto_180484 ) ) ( not ( = ?auto_180483 ?auto_180485 ) ) ( not ( = ?auto_180483 ?auto_180486 ) ) ( not ( = ?auto_180483 ?auto_180487 ) ) ( not ( = ?auto_180484 ?auto_180485 ) ) ( not ( = ?auto_180484 ?auto_180486 ) ) ( not ( = ?auto_180484 ?auto_180487 ) ) ( not ( = ?auto_180485 ?auto_180486 ) ) ( not ( = ?auto_180485 ?auto_180487 ) ) ( not ( = ?auto_180486 ?auto_180487 ) ) ( ON-TABLE ?auto_180487 ) ( ON ?auto_180486 ?auto_180487 ) ( ON ?auto_180485 ?auto_180486 ) ( ON ?auto_180484 ?auto_180485 ) ( ON ?auto_180483 ?auto_180484 ) ( ON ?auto_180482 ?auto_180483 ) ( CLEAR ?auto_180480 ) ( ON ?auto_180481 ?auto_180482 ) ( CLEAR ?auto_180481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180487 ?auto_180486 ?auto_180485 ?auto_180484 ?auto_180483 ?auto_180482 )
      ( MAKE-8PILE ?auto_180480 ?auto_180481 ?auto_180482 ?auto_180483 ?auto_180484 ?auto_180485 ?auto_180486 ?auto_180487 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180488 - BLOCK
      ?auto_180489 - BLOCK
      ?auto_180490 - BLOCK
      ?auto_180491 - BLOCK
      ?auto_180492 - BLOCK
      ?auto_180493 - BLOCK
      ?auto_180494 - BLOCK
      ?auto_180495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180488 ?auto_180489 ) ) ( not ( = ?auto_180488 ?auto_180490 ) ) ( not ( = ?auto_180488 ?auto_180491 ) ) ( not ( = ?auto_180488 ?auto_180492 ) ) ( not ( = ?auto_180488 ?auto_180493 ) ) ( not ( = ?auto_180488 ?auto_180494 ) ) ( not ( = ?auto_180488 ?auto_180495 ) ) ( not ( = ?auto_180489 ?auto_180490 ) ) ( not ( = ?auto_180489 ?auto_180491 ) ) ( not ( = ?auto_180489 ?auto_180492 ) ) ( not ( = ?auto_180489 ?auto_180493 ) ) ( not ( = ?auto_180489 ?auto_180494 ) ) ( not ( = ?auto_180489 ?auto_180495 ) ) ( not ( = ?auto_180490 ?auto_180491 ) ) ( not ( = ?auto_180490 ?auto_180492 ) ) ( not ( = ?auto_180490 ?auto_180493 ) ) ( not ( = ?auto_180490 ?auto_180494 ) ) ( not ( = ?auto_180490 ?auto_180495 ) ) ( not ( = ?auto_180491 ?auto_180492 ) ) ( not ( = ?auto_180491 ?auto_180493 ) ) ( not ( = ?auto_180491 ?auto_180494 ) ) ( not ( = ?auto_180491 ?auto_180495 ) ) ( not ( = ?auto_180492 ?auto_180493 ) ) ( not ( = ?auto_180492 ?auto_180494 ) ) ( not ( = ?auto_180492 ?auto_180495 ) ) ( not ( = ?auto_180493 ?auto_180494 ) ) ( not ( = ?auto_180493 ?auto_180495 ) ) ( not ( = ?auto_180494 ?auto_180495 ) ) ( ON-TABLE ?auto_180495 ) ( ON ?auto_180494 ?auto_180495 ) ( ON ?auto_180493 ?auto_180494 ) ( ON ?auto_180492 ?auto_180493 ) ( ON ?auto_180491 ?auto_180492 ) ( ON ?auto_180490 ?auto_180491 ) ( ON ?auto_180489 ?auto_180490 ) ( CLEAR ?auto_180489 ) ( HOLDING ?auto_180488 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180488 )
      ( MAKE-8PILE ?auto_180488 ?auto_180489 ?auto_180490 ?auto_180491 ?auto_180492 ?auto_180493 ?auto_180494 ?auto_180495 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180496 - BLOCK
      ?auto_180497 - BLOCK
      ?auto_180498 - BLOCK
      ?auto_180499 - BLOCK
      ?auto_180500 - BLOCK
      ?auto_180501 - BLOCK
      ?auto_180502 - BLOCK
      ?auto_180503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180496 ?auto_180497 ) ) ( not ( = ?auto_180496 ?auto_180498 ) ) ( not ( = ?auto_180496 ?auto_180499 ) ) ( not ( = ?auto_180496 ?auto_180500 ) ) ( not ( = ?auto_180496 ?auto_180501 ) ) ( not ( = ?auto_180496 ?auto_180502 ) ) ( not ( = ?auto_180496 ?auto_180503 ) ) ( not ( = ?auto_180497 ?auto_180498 ) ) ( not ( = ?auto_180497 ?auto_180499 ) ) ( not ( = ?auto_180497 ?auto_180500 ) ) ( not ( = ?auto_180497 ?auto_180501 ) ) ( not ( = ?auto_180497 ?auto_180502 ) ) ( not ( = ?auto_180497 ?auto_180503 ) ) ( not ( = ?auto_180498 ?auto_180499 ) ) ( not ( = ?auto_180498 ?auto_180500 ) ) ( not ( = ?auto_180498 ?auto_180501 ) ) ( not ( = ?auto_180498 ?auto_180502 ) ) ( not ( = ?auto_180498 ?auto_180503 ) ) ( not ( = ?auto_180499 ?auto_180500 ) ) ( not ( = ?auto_180499 ?auto_180501 ) ) ( not ( = ?auto_180499 ?auto_180502 ) ) ( not ( = ?auto_180499 ?auto_180503 ) ) ( not ( = ?auto_180500 ?auto_180501 ) ) ( not ( = ?auto_180500 ?auto_180502 ) ) ( not ( = ?auto_180500 ?auto_180503 ) ) ( not ( = ?auto_180501 ?auto_180502 ) ) ( not ( = ?auto_180501 ?auto_180503 ) ) ( not ( = ?auto_180502 ?auto_180503 ) ) ( ON-TABLE ?auto_180503 ) ( ON ?auto_180502 ?auto_180503 ) ( ON ?auto_180501 ?auto_180502 ) ( ON ?auto_180500 ?auto_180501 ) ( ON ?auto_180499 ?auto_180500 ) ( ON ?auto_180498 ?auto_180499 ) ( ON ?auto_180497 ?auto_180498 ) ( ON ?auto_180496 ?auto_180497 ) ( CLEAR ?auto_180496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180503 ?auto_180502 ?auto_180501 ?auto_180500 ?auto_180499 ?auto_180498 ?auto_180497 )
      ( MAKE-8PILE ?auto_180496 ?auto_180497 ?auto_180498 ?auto_180499 ?auto_180500 ?auto_180501 ?auto_180502 ?auto_180503 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180512 - BLOCK
      ?auto_180513 - BLOCK
      ?auto_180514 - BLOCK
      ?auto_180515 - BLOCK
      ?auto_180516 - BLOCK
      ?auto_180517 - BLOCK
      ?auto_180518 - BLOCK
      ?auto_180519 - BLOCK
    )
    :vars
    (
      ?auto_180520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180512 ?auto_180513 ) ) ( not ( = ?auto_180512 ?auto_180514 ) ) ( not ( = ?auto_180512 ?auto_180515 ) ) ( not ( = ?auto_180512 ?auto_180516 ) ) ( not ( = ?auto_180512 ?auto_180517 ) ) ( not ( = ?auto_180512 ?auto_180518 ) ) ( not ( = ?auto_180512 ?auto_180519 ) ) ( not ( = ?auto_180513 ?auto_180514 ) ) ( not ( = ?auto_180513 ?auto_180515 ) ) ( not ( = ?auto_180513 ?auto_180516 ) ) ( not ( = ?auto_180513 ?auto_180517 ) ) ( not ( = ?auto_180513 ?auto_180518 ) ) ( not ( = ?auto_180513 ?auto_180519 ) ) ( not ( = ?auto_180514 ?auto_180515 ) ) ( not ( = ?auto_180514 ?auto_180516 ) ) ( not ( = ?auto_180514 ?auto_180517 ) ) ( not ( = ?auto_180514 ?auto_180518 ) ) ( not ( = ?auto_180514 ?auto_180519 ) ) ( not ( = ?auto_180515 ?auto_180516 ) ) ( not ( = ?auto_180515 ?auto_180517 ) ) ( not ( = ?auto_180515 ?auto_180518 ) ) ( not ( = ?auto_180515 ?auto_180519 ) ) ( not ( = ?auto_180516 ?auto_180517 ) ) ( not ( = ?auto_180516 ?auto_180518 ) ) ( not ( = ?auto_180516 ?auto_180519 ) ) ( not ( = ?auto_180517 ?auto_180518 ) ) ( not ( = ?auto_180517 ?auto_180519 ) ) ( not ( = ?auto_180518 ?auto_180519 ) ) ( ON-TABLE ?auto_180519 ) ( ON ?auto_180518 ?auto_180519 ) ( ON ?auto_180517 ?auto_180518 ) ( ON ?auto_180516 ?auto_180517 ) ( ON ?auto_180515 ?auto_180516 ) ( ON ?auto_180514 ?auto_180515 ) ( ON ?auto_180513 ?auto_180514 ) ( CLEAR ?auto_180513 ) ( ON ?auto_180512 ?auto_180520 ) ( CLEAR ?auto_180512 ) ( HAND-EMPTY ) ( not ( = ?auto_180512 ?auto_180520 ) ) ( not ( = ?auto_180513 ?auto_180520 ) ) ( not ( = ?auto_180514 ?auto_180520 ) ) ( not ( = ?auto_180515 ?auto_180520 ) ) ( not ( = ?auto_180516 ?auto_180520 ) ) ( not ( = ?auto_180517 ?auto_180520 ) ) ( not ( = ?auto_180518 ?auto_180520 ) ) ( not ( = ?auto_180519 ?auto_180520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180512 ?auto_180520 )
      ( MAKE-8PILE ?auto_180512 ?auto_180513 ?auto_180514 ?auto_180515 ?auto_180516 ?auto_180517 ?auto_180518 ?auto_180519 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180521 - BLOCK
      ?auto_180522 - BLOCK
      ?auto_180523 - BLOCK
      ?auto_180524 - BLOCK
      ?auto_180525 - BLOCK
      ?auto_180526 - BLOCK
      ?auto_180527 - BLOCK
      ?auto_180528 - BLOCK
    )
    :vars
    (
      ?auto_180529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180521 ?auto_180522 ) ) ( not ( = ?auto_180521 ?auto_180523 ) ) ( not ( = ?auto_180521 ?auto_180524 ) ) ( not ( = ?auto_180521 ?auto_180525 ) ) ( not ( = ?auto_180521 ?auto_180526 ) ) ( not ( = ?auto_180521 ?auto_180527 ) ) ( not ( = ?auto_180521 ?auto_180528 ) ) ( not ( = ?auto_180522 ?auto_180523 ) ) ( not ( = ?auto_180522 ?auto_180524 ) ) ( not ( = ?auto_180522 ?auto_180525 ) ) ( not ( = ?auto_180522 ?auto_180526 ) ) ( not ( = ?auto_180522 ?auto_180527 ) ) ( not ( = ?auto_180522 ?auto_180528 ) ) ( not ( = ?auto_180523 ?auto_180524 ) ) ( not ( = ?auto_180523 ?auto_180525 ) ) ( not ( = ?auto_180523 ?auto_180526 ) ) ( not ( = ?auto_180523 ?auto_180527 ) ) ( not ( = ?auto_180523 ?auto_180528 ) ) ( not ( = ?auto_180524 ?auto_180525 ) ) ( not ( = ?auto_180524 ?auto_180526 ) ) ( not ( = ?auto_180524 ?auto_180527 ) ) ( not ( = ?auto_180524 ?auto_180528 ) ) ( not ( = ?auto_180525 ?auto_180526 ) ) ( not ( = ?auto_180525 ?auto_180527 ) ) ( not ( = ?auto_180525 ?auto_180528 ) ) ( not ( = ?auto_180526 ?auto_180527 ) ) ( not ( = ?auto_180526 ?auto_180528 ) ) ( not ( = ?auto_180527 ?auto_180528 ) ) ( ON-TABLE ?auto_180528 ) ( ON ?auto_180527 ?auto_180528 ) ( ON ?auto_180526 ?auto_180527 ) ( ON ?auto_180525 ?auto_180526 ) ( ON ?auto_180524 ?auto_180525 ) ( ON ?auto_180523 ?auto_180524 ) ( ON ?auto_180521 ?auto_180529 ) ( CLEAR ?auto_180521 ) ( not ( = ?auto_180521 ?auto_180529 ) ) ( not ( = ?auto_180522 ?auto_180529 ) ) ( not ( = ?auto_180523 ?auto_180529 ) ) ( not ( = ?auto_180524 ?auto_180529 ) ) ( not ( = ?auto_180525 ?auto_180529 ) ) ( not ( = ?auto_180526 ?auto_180529 ) ) ( not ( = ?auto_180527 ?auto_180529 ) ) ( not ( = ?auto_180528 ?auto_180529 ) ) ( HOLDING ?auto_180522 ) ( CLEAR ?auto_180523 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180528 ?auto_180527 ?auto_180526 ?auto_180525 ?auto_180524 ?auto_180523 ?auto_180522 )
      ( MAKE-8PILE ?auto_180521 ?auto_180522 ?auto_180523 ?auto_180524 ?auto_180525 ?auto_180526 ?auto_180527 ?auto_180528 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180530 - BLOCK
      ?auto_180531 - BLOCK
      ?auto_180532 - BLOCK
      ?auto_180533 - BLOCK
      ?auto_180534 - BLOCK
      ?auto_180535 - BLOCK
      ?auto_180536 - BLOCK
      ?auto_180537 - BLOCK
    )
    :vars
    (
      ?auto_180538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180530 ?auto_180531 ) ) ( not ( = ?auto_180530 ?auto_180532 ) ) ( not ( = ?auto_180530 ?auto_180533 ) ) ( not ( = ?auto_180530 ?auto_180534 ) ) ( not ( = ?auto_180530 ?auto_180535 ) ) ( not ( = ?auto_180530 ?auto_180536 ) ) ( not ( = ?auto_180530 ?auto_180537 ) ) ( not ( = ?auto_180531 ?auto_180532 ) ) ( not ( = ?auto_180531 ?auto_180533 ) ) ( not ( = ?auto_180531 ?auto_180534 ) ) ( not ( = ?auto_180531 ?auto_180535 ) ) ( not ( = ?auto_180531 ?auto_180536 ) ) ( not ( = ?auto_180531 ?auto_180537 ) ) ( not ( = ?auto_180532 ?auto_180533 ) ) ( not ( = ?auto_180532 ?auto_180534 ) ) ( not ( = ?auto_180532 ?auto_180535 ) ) ( not ( = ?auto_180532 ?auto_180536 ) ) ( not ( = ?auto_180532 ?auto_180537 ) ) ( not ( = ?auto_180533 ?auto_180534 ) ) ( not ( = ?auto_180533 ?auto_180535 ) ) ( not ( = ?auto_180533 ?auto_180536 ) ) ( not ( = ?auto_180533 ?auto_180537 ) ) ( not ( = ?auto_180534 ?auto_180535 ) ) ( not ( = ?auto_180534 ?auto_180536 ) ) ( not ( = ?auto_180534 ?auto_180537 ) ) ( not ( = ?auto_180535 ?auto_180536 ) ) ( not ( = ?auto_180535 ?auto_180537 ) ) ( not ( = ?auto_180536 ?auto_180537 ) ) ( ON-TABLE ?auto_180537 ) ( ON ?auto_180536 ?auto_180537 ) ( ON ?auto_180535 ?auto_180536 ) ( ON ?auto_180534 ?auto_180535 ) ( ON ?auto_180533 ?auto_180534 ) ( ON ?auto_180532 ?auto_180533 ) ( ON ?auto_180530 ?auto_180538 ) ( not ( = ?auto_180530 ?auto_180538 ) ) ( not ( = ?auto_180531 ?auto_180538 ) ) ( not ( = ?auto_180532 ?auto_180538 ) ) ( not ( = ?auto_180533 ?auto_180538 ) ) ( not ( = ?auto_180534 ?auto_180538 ) ) ( not ( = ?auto_180535 ?auto_180538 ) ) ( not ( = ?auto_180536 ?auto_180538 ) ) ( not ( = ?auto_180537 ?auto_180538 ) ) ( CLEAR ?auto_180532 ) ( ON ?auto_180531 ?auto_180530 ) ( CLEAR ?auto_180531 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180538 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180538 ?auto_180530 )
      ( MAKE-8PILE ?auto_180530 ?auto_180531 ?auto_180532 ?auto_180533 ?auto_180534 ?auto_180535 ?auto_180536 ?auto_180537 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180539 - BLOCK
      ?auto_180540 - BLOCK
      ?auto_180541 - BLOCK
      ?auto_180542 - BLOCK
      ?auto_180543 - BLOCK
      ?auto_180544 - BLOCK
      ?auto_180545 - BLOCK
      ?auto_180546 - BLOCK
    )
    :vars
    (
      ?auto_180547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180539 ?auto_180540 ) ) ( not ( = ?auto_180539 ?auto_180541 ) ) ( not ( = ?auto_180539 ?auto_180542 ) ) ( not ( = ?auto_180539 ?auto_180543 ) ) ( not ( = ?auto_180539 ?auto_180544 ) ) ( not ( = ?auto_180539 ?auto_180545 ) ) ( not ( = ?auto_180539 ?auto_180546 ) ) ( not ( = ?auto_180540 ?auto_180541 ) ) ( not ( = ?auto_180540 ?auto_180542 ) ) ( not ( = ?auto_180540 ?auto_180543 ) ) ( not ( = ?auto_180540 ?auto_180544 ) ) ( not ( = ?auto_180540 ?auto_180545 ) ) ( not ( = ?auto_180540 ?auto_180546 ) ) ( not ( = ?auto_180541 ?auto_180542 ) ) ( not ( = ?auto_180541 ?auto_180543 ) ) ( not ( = ?auto_180541 ?auto_180544 ) ) ( not ( = ?auto_180541 ?auto_180545 ) ) ( not ( = ?auto_180541 ?auto_180546 ) ) ( not ( = ?auto_180542 ?auto_180543 ) ) ( not ( = ?auto_180542 ?auto_180544 ) ) ( not ( = ?auto_180542 ?auto_180545 ) ) ( not ( = ?auto_180542 ?auto_180546 ) ) ( not ( = ?auto_180543 ?auto_180544 ) ) ( not ( = ?auto_180543 ?auto_180545 ) ) ( not ( = ?auto_180543 ?auto_180546 ) ) ( not ( = ?auto_180544 ?auto_180545 ) ) ( not ( = ?auto_180544 ?auto_180546 ) ) ( not ( = ?auto_180545 ?auto_180546 ) ) ( ON-TABLE ?auto_180546 ) ( ON ?auto_180545 ?auto_180546 ) ( ON ?auto_180544 ?auto_180545 ) ( ON ?auto_180543 ?auto_180544 ) ( ON ?auto_180542 ?auto_180543 ) ( ON ?auto_180539 ?auto_180547 ) ( not ( = ?auto_180539 ?auto_180547 ) ) ( not ( = ?auto_180540 ?auto_180547 ) ) ( not ( = ?auto_180541 ?auto_180547 ) ) ( not ( = ?auto_180542 ?auto_180547 ) ) ( not ( = ?auto_180543 ?auto_180547 ) ) ( not ( = ?auto_180544 ?auto_180547 ) ) ( not ( = ?auto_180545 ?auto_180547 ) ) ( not ( = ?auto_180546 ?auto_180547 ) ) ( ON ?auto_180540 ?auto_180539 ) ( CLEAR ?auto_180540 ) ( ON-TABLE ?auto_180547 ) ( HOLDING ?auto_180541 ) ( CLEAR ?auto_180542 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180546 ?auto_180545 ?auto_180544 ?auto_180543 ?auto_180542 ?auto_180541 )
      ( MAKE-8PILE ?auto_180539 ?auto_180540 ?auto_180541 ?auto_180542 ?auto_180543 ?auto_180544 ?auto_180545 ?auto_180546 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180548 - BLOCK
      ?auto_180549 - BLOCK
      ?auto_180550 - BLOCK
      ?auto_180551 - BLOCK
      ?auto_180552 - BLOCK
      ?auto_180553 - BLOCK
      ?auto_180554 - BLOCK
      ?auto_180555 - BLOCK
    )
    :vars
    (
      ?auto_180556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180548 ?auto_180549 ) ) ( not ( = ?auto_180548 ?auto_180550 ) ) ( not ( = ?auto_180548 ?auto_180551 ) ) ( not ( = ?auto_180548 ?auto_180552 ) ) ( not ( = ?auto_180548 ?auto_180553 ) ) ( not ( = ?auto_180548 ?auto_180554 ) ) ( not ( = ?auto_180548 ?auto_180555 ) ) ( not ( = ?auto_180549 ?auto_180550 ) ) ( not ( = ?auto_180549 ?auto_180551 ) ) ( not ( = ?auto_180549 ?auto_180552 ) ) ( not ( = ?auto_180549 ?auto_180553 ) ) ( not ( = ?auto_180549 ?auto_180554 ) ) ( not ( = ?auto_180549 ?auto_180555 ) ) ( not ( = ?auto_180550 ?auto_180551 ) ) ( not ( = ?auto_180550 ?auto_180552 ) ) ( not ( = ?auto_180550 ?auto_180553 ) ) ( not ( = ?auto_180550 ?auto_180554 ) ) ( not ( = ?auto_180550 ?auto_180555 ) ) ( not ( = ?auto_180551 ?auto_180552 ) ) ( not ( = ?auto_180551 ?auto_180553 ) ) ( not ( = ?auto_180551 ?auto_180554 ) ) ( not ( = ?auto_180551 ?auto_180555 ) ) ( not ( = ?auto_180552 ?auto_180553 ) ) ( not ( = ?auto_180552 ?auto_180554 ) ) ( not ( = ?auto_180552 ?auto_180555 ) ) ( not ( = ?auto_180553 ?auto_180554 ) ) ( not ( = ?auto_180553 ?auto_180555 ) ) ( not ( = ?auto_180554 ?auto_180555 ) ) ( ON-TABLE ?auto_180555 ) ( ON ?auto_180554 ?auto_180555 ) ( ON ?auto_180553 ?auto_180554 ) ( ON ?auto_180552 ?auto_180553 ) ( ON ?auto_180551 ?auto_180552 ) ( ON ?auto_180548 ?auto_180556 ) ( not ( = ?auto_180548 ?auto_180556 ) ) ( not ( = ?auto_180549 ?auto_180556 ) ) ( not ( = ?auto_180550 ?auto_180556 ) ) ( not ( = ?auto_180551 ?auto_180556 ) ) ( not ( = ?auto_180552 ?auto_180556 ) ) ( not ( = ?auto_180553 ?auto_180556 ) ) ( not ( = ?auto_180554 ?auto_180556 ) ) ( not ( = ?auto_180555 ?auto_180556 ) ) ( ON ?auto_180549 ?auto_180548 ) ( ON-TABLE ?auto_180556 ) ( CLEAR ?auto_180551 ) ( ON ?auto_180550 ?auto_180549 ) ( CLEAR ?auto_180550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180556 ?auto_180548 ?auto_180549 )
      ( MAKE-8PILE ?auto_180548 ?auto_180549 ?auto_180550 ?auto_180551 ?auto_180552 ?auto_180553 ?auto_180554 ?auto_180555 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180557 - BLOCK
      ?auto_180558 - BLOCK
      ?auto_180559 - BLOCK
      ?auto_180560 - BLOCK
      ?auto_180561 - BLOCK
      ?auto_180562 - BLOCK
      ?auto_180563 - BLOCK
      ?auto_180564 - BLOCK
    )
    :vars
    (
      ?auto_180565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180557 ?auto_180558 ) ) ( not ( = ?auto_180557 ?auto_180559 ) ) ( not ( = ?auto_180557 ?auto_180560 ) ) ( not ( = ?auto_180557 ?auto_180561 ) ) ( not ( = ?auto_180557 ?auto_180562 ) ) ( not ( = ?auto_180557 ?auto_180563 ) ) ( not ( = ?auto_180557 ?auto_180564 ) ) ( not ( = ?auto_180558 ?auto_180559 ) ) ( not ( = ?auto_180558 ?auto_180560 ) ) ( not ( = ?auto_180558 ?auto_180561 ) ) ( not ( = ?auto_180558 ?auto_180562 ) ) ( not ( = ?auto_180558 ?auto_180563 ) ) ( not ( = ?auto_180558 ?auto_180564 ) ) ( not ( = ?auto_180559 ?auto_180560 ) ) ( not ( = ?auto_180559 ?auto_180561 ) ) ( not ( = ?auto_180559 ?auto_180562 ) ) ( not ( = ?auto_180559 ?auto_180563 ) ) ( not ( = ?auto_180559 ?auto_180564 ) ) ( not ( = ?auto_180560 ?auto_180561 ) ) ( not ( = ?auto_180560 ?auto_180562 ) ) ( not ( = ?auto_180560 ?auto_180563 ) ) ( not ( = ?auto_180560 ?auto_180564 ) ) ( not ( = ?auto_180561 ?auto_180562 ) ) ( not ( = ?auto_180561 ?auto_180563 ) ) ( not ( = ?auto_180561 ?auto_180564 ) ) ( not ( = ?auto_180562 ?auto_180563 ) ) ( not ( = ?auto_180562 ?auto_180564 ) ) ( not ( = ?auto_180563 ?auto_180564 ) ) ( ON-TABLE ?auto_180564 ) ( ON ?auto_180563 ?auto_180564 ) ( ON ?auto_180562 ?auto_180563 ) ( ON ?auto_180561 ?auto_180562 ) ( ON ?auto_180557 ?auto_180565 ) ( not ( = ?auto_180557 ?auto_180565 ) ) ( not ( = ?auto_180558 ?auto_180565 ) ) ( not ( = ?auto_180559 ?auto_180565 ) ) ( not ( = ?auto_180560 ?auto_180565 ) ) ( not ( = ?auto_180561 ?auto_180565 ) ) ( not ( = ?auto_180562 ?auto_180565 ) ) ( not ( = ?auto_180563 ?auto_180565 ) ) ( not ( = ?auto_180564 ?auto_180565 ) ) ( ON ?auto_180558 ?auto_180557 ) ( ON-TABLE ?auto_180565 ) ( ON ?auto_180559 ?auto_180558 ) ( CLEAR ?auto_180559 ) ( HOLDING ?auto_180560 ) ( CLEAR ?auto_180561 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180564 ?auto_180563 ?auto_180562 ?auto_180561 ?auto_180560 )
      ( MAKE-8PILE ?auto_180557 ?auto_180558 ?auto_180559 ?auto_180560 ?auto_180561 ?auto_180562 ?auto_180563 ?auto_180564 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180566 - BLOCK
      ?auto_180567 - BLOCK
      ?auto_180568 - BLOCK
      ?auto_180569 - BLOCK
      ?auto_180570 - BLOCK
      ?auto_180571 - BLOCK
      ?auto_180572 - BLOCK
      ?auto_180573 - BLOCK
    )
    :vars
    (
      ?auto_180574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180566 ?auto_180567 ) ) ( not ( = ?auto_180566 ?auto_180568 ) ) ( not ( = ?auto_180566 ?auto_180569 ) ) ( not ( = ?auto_180566 ?auto_180570 ) ) ( not ( = ?auto_180566 ?auto_180571 ) ) ( not ( = ?auto_180566 ?auto_180572 ) ) ( not ( = ?auto_180566 ?auto_180573 ) ) ( not ( = ?auto_180567 ?auto_180568 ) ) ( not ( = ?auto_180567 ?auto_180569 ) ) ( not ( = ?auto_180567 ?auto_180570 ) ) ( not ( = ?auto_180567 ?auto_180571 ) ) ( not ( = ?auto_180567 ?auto_180572 ) ) ( not ( = ?auto_180567 ?auto_180573 ) ) ( not ( = ?auto_180568 ?auto_180569 ) ) ( not ( = ?auto_180568 ?auto_180570 ) ) ( not ( = ?auto_180568 ?auto_180571 ) ) ( not ( = ?auto_180568 ?auto_180572 ) ) ( not ( = ?auto_180568 ?auto_180573 ) ) ( not ( = ?auto_180569 ?auto_180570 ) ) ( not ( = ?auto_180569 ?auto_180571 ) ) ( not ( = ?auto_180569 ?auto_180572 ) ) ( not ( = ?auto_180569 ?auto_180573 ) ) ( not ( = ?auto_180570 ?auto_180571 ) ) ( not ( = ?auto_180570 ?auto_180572 ) ) ( not ( = ?auto_180570 ?auto_180573 ) ) ( not ( = ?auto_180571 ?auto_180572 ) ) ( not ( = ?auto_180571 ?auto_180573 ) ) ( not ( = ?auto_180572 ?auto_180573 ) ) ( ON-TABLE ?auto_180573 ) ( ON ?auto_180572 ?auto_180573 ) ( ON ?auto_180571 ?auto_180572 ) ( ON ?auto_180570 ?auto_180571 ) ( ON ?auto_180566 ?auto_180574 ) ( not ( = ?auto_180566 ?auto_180574 ) ) ( not ( = ?auto_180567 ?auto_180574 ) ) ( not ( = ?auto_180568 ?auto_180574 ) ) ( not ( = ?auto_180569 ?auto_180574 ) ) ( not ( = ?auto_180570 ?auto_180574 ) ) ( not ( = ?auto_180571 ?auto_180574 ) ) ( not ( = ?auto_180572 ?auto_180574 ) ) ( not ( = ?auto_180573 ?auto_180574 ) ) ( ON ?auto_180567 ?auto_180566 ) ( ON-TABLE ?auto_180574 ) ( ON ?auto_180568 ?auto_180567 ) ( CLEAR ?auto_180570 ) ( ON ?auto_180569 ?auto_180568 ) ( CLEAR ?auto_180569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180574 ?auto_180566 ?auto_180567 ?auto_180568 )
      ( MAKE-8PILE ?auto_180566 ?auto_180567 ?auto_180568 ?auto_180569 ?auto_180570 ?auto_180571 ?auto_180572 ?auto_180573 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180575 - BLOCK
      ?auto_180576 - BLOCK
      ?auto_180577 - BLOCK
      ?auto_180578 - BLOCK
      ?auto_180579 - BLOCK
      ?auto_180580 - BLOCK
      ?auto_180581 - BLOCK
      ?auto_180582 - BLOCK
    )
    :vars
    (
      ?auto_180583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180575 ?auto_180576 ) ) ( not ( = ?auto_180575 ?auto_180577 ) ) ( not ( = ?auto_180575 ?auto_180578 ) ) ( not ( = ?auto_180575 ?auto_180579 ) ) ( not ( = ?auto_180575 ?auto_180580 ) ) ( not ( = ?auto_180575 ?auto_180581 ) ) ( not ( = ?auto_180575 ?auto_180582 ) ) ( not ( = ?auto_180576 ?auto_180577 ) ) ( not ( = ?auto_180576 ?auto_180578 ) ) ( not ( = ?auto_180576 ?auto_180579 ) ) ( not ( = ?auto_180576 ?auto_180580 ) ) ( not ( = ?auto_180576 ?auto_180581 ) ) ( not ( = ?auto_180576 ?auto_180582 ) ) ( not ( = ?auto_180577 ?auto_180578 ) ) ( not ( = ?auto_180577 ?auto_180579 ) ) ( not ( = ?auto_180577 ?auto_180580 ) ) ( not ( = ?auto_180577 ?auto_180581 ) ) ( not ( = ?auto_180577 ?auto_180582 ) ) ( not ( = ?auto_180578 ?auto_180579 ) ) ( not ( = ?auto_180578 ?auto_180580 ) ) ( not ( = ?auto_180578 ?auto_180581 ) ) ( not ( = ?auto_180578 ?auto_180582 ) ) ( not ( = ?auto_180579 ?auto_180580 ) ) ( not ( = ?auto_180579 ?auto_180581 ) ) ( not ( = ?auto_180579 ?auto_180582 ) ) ( not ( = ?auto_180580 ?auto_180581 ) ) ( not ( = ?auto_180580 ?auto_180582 ) ) ( not ( = ?auto_180581 ?auto_180582 ) ) ( ON-TABLE ?auto_180582 ) ( ON ?auto_180581 ?auto_180582 ) ( ON ?auto_180580 ?auto_180581 ) ( ON ?auto_180575 ?auto_180583 ) ( not ( = ?auto_180575 ?auto_180583 ) ) ( not ( = ?auto_180576 ?auto_180583 ) ) ( not ( = ?auto_180577 ?auto_180583 ) ) ( not ( = ?auto_180578 ?auto_180583 ) ) ( not ( = ?auto_180579 ?auto_180583 ) ) ( not ( = ?auto_180580 ?auto_180583 ) ) ( not ( = ?auto_180581 ?auto_180583 ) ) ( not ( = ?auto_180582 ?auto_180583 ) ) ( ON ?auto_180576 ?auto_180575 ) ( ON-TABLE ?auto_180583 ) ( ON ?auto_180577 ?auto_180576 ) ( ON ?auto_180578 ?auto_180577 ) ( CLEAR ?auto_180578 ) ( HOLDING ?auto_180579 ) ( CLEAR ?auto_180580 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180582 ?auto_180581 ?auto_180580 ?auto_180579 )
      ( MAKE-8PILE ?auto_180575 ?auto_180576 ?auto_180577 ?auto_180578 ?auto_180579 ?auto_180580 ?auto_180581 ?auto_180582 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180584 - BLOCK
      ?auto_180585 - BLOCK
      ?auto_180586 - BLOCK
      ?auto_180587 - BLOCK
      ?auto_180588 - BLOCK
      ?auto_180589 - BLOCK
      ?auto_180590 - BLOCK
      ?auto_180591 - BLOCK
    )
    :vars
    (
      ?auto_180592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180584 ?auto_180585 ) ) ( not ( = ?auto_180584 ?auto_180586 ) ) ( not ( = ?auto_180584 ?auto_180587 ) ) ( not ( = ?auto_180584 ?auto_180588 ) ) ( not ( = ?auto_180584 ?auto_180589 ) ) ( not ( = ?auto_180584 ?auto_180590 ) ) ( not ( = ?auto_180584 ?auto_180591 ) ) ( not ( = ?auto_180585 ?auto_180586 ) ) ( not ( = ?auto_180585 ?auto_180587 ) ) ( not ( = ?auto_180585 ?auto_180588 ) ) ( not ( = ?auto_180585 ?auto_180589 ) ) ( not ( = ?auto_180585 ?auto_180590 ) ) ( not ( = ?auto_180585 ?auto_180591 ) ) ( not ( = ?auto_180586 ?auto_180587 ) ) ( not ( = ?auto_180586 ?auto_180588 ) ) ( not ( = ?auto_180586 ?auto_180589 ) ) ( not ( = ?auto_180586 ?auto_180590 ) ) ( not ( = ?auto_180586 ?auto_180591 ) ) ( not ( = ?auto_180587 ?auto_180588 ) ) ( not ( = ?auto_180587 ?auto_180589 ) ) ( not ( = ?auto_180587 ?auto_180590 ) ) ( not ( = ?auto_180587 ?auto_180591 ) ) ( not ( = ?auto_180588 ?auto_180589 ) ) ( not ( = ?auto_180588 ?auto_180590 ) ) ( not ( = ?auto_180588 ?auto_180591 ) ) ( not ( = ?auto_180589 ?auto_180590 ) ) ( not ( = ?auto_180589 ?auto_180591 ) ) ( not ( = ?auto_180590 ?auto_180591 ) ) ( ON-TABLE ?auto_180591 ) ( ON ?auto_180590 ?auto_180591 ) ( ON ?auto_180589 ?auto_180590 ) ( ON ?auto_180584 ?auto_180592 ) ( not ( = ?auto_180584 ?auto_180592 ) ) ( not ( = ?auto_180585 ?auto_180592 ) ) ( not ( = ?auto_180586 ?auto_180592 ) ) ( not ( = ?auto_180587 ?auto_180592 ) ) ( not ( = ?auto_180588 ?auto_180592 ) ) ( not ( = ?auto_180589 ?auto_180592 ) ) ( not ( = ?auto_180590 ?auto_180592 ) ) ( not ( = ?auto_180591 ?auto_180592 ) ) ( ON ?auto_180585 ?auto_180584 ) ( ON-TABLE ?auto_180592 ) ( ON ?auto_180586 ?auto_180585 ) ( ON ?auto_180587 ?auto_180586 ) ( CLEAR ?auto_180589 ) ( ON ?auto_180588 ?auto_180587 ) ( CLEAR ?auto_180588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180592 ?auto_180584 ?auto_180585 ?auto_180586 ?auto_180587 )
      ( MAKE-8PILE ?auto_180584 ?auto_180585 ?auto_180586 ?auto_180587 ?auto_180588 ?auto_180589 ?auto_180590 ?auto_180591 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180593 - BLOCK
      ?auto_180594 - BLOCK
      ?auto_180595 - BLOCK
      ?auto_180596 - BLOCK
      ?auto_180597 - BLOCK
      ?auto_180598 - BLOCK
      ?auto_180599 - BLOCK
      ?auto_180600 - BLOCK
    )
    :vars
    (
      ?auto_180601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180593 ?auto_180594 ) ) ( not ( = ?auto_180593 ?auto_180595 ) ) ( not ( = ?auto_180593 ?auto_180596 ) ) ( not ( = ?auto_180593 ?auto_180597 ) ) ( not ( = ?auto_180593 ?auto_180598 ) ) ( not ( = ?auto_180593 ?auto_180599 ) ) ( not ( = ?auto_180593 ?auto_180600 ) ) ( not ( = ?auto_180594 ?auto_180595 ) ) ( not ( = ?auto_180594 ?auto_180596 ) ) ( not ( = ?auto_180594 ?auto_180597 ) ) ( not ( = ?auto_180594 ?auto_180598 ) ) ( not ( = ?auto_180594 ?auto_180599 ) ) ( not ( = ?auto_180594 ?auto_180600 ) ) ( not ( = ?auto_180595 ?auto_180596 ) ) ( not ( = ?auto_180595 ?auto_180597 ) ) ( not ( = ?auto_180595 ?auto_180598 ) ) ( not ( = ?auto_180595 ?auto_180599 ) ) ( not ( = ?auto_180595 ?auto_180600 ) ) ( not ( = ?auto_180596 ?auto_180597 ) ) ( not ( = ?auto_180596 ?auto_180598 ) ) ( not ( = ?auto_180596 ?auto_180599 ) ) ( not ( = ?auto_180596 ?auto_180600 ) ) ( not ( = ?auto_180597 ?auto_180598 ) ) ( not ( = ?auto_180597 ?auto_180599 ) ) ( not ( = ?auto_180597 ?auto_180600 ) ) ( not ( = ?auto_180598 ?auto_180599 ) ) ( not ( = ?auto_180598 ?auto_180600 ) ) ( not ( = ?auto_180599 ?auto_180600 ) ) ( ON-TABLE ?auto_180600 ) ( ON ?auto_180599 ?auto_180600 ) ( ON ?auto_180593 ?auto_180601 ) ( not ( = ?auto_180593 ?auto_180601 ) ) ( not ( = ?auto_180594 ?auto_180601 ) ) ( not ( = ?auto_180595 ?auto_180601 ) ) ( not ( = ?auto_180596 ?auto_180601 ) ) ( not ( = ?auto_180597 ?auto_180601 ) ) ( not ( = ?auto_180598 ?auto_180601 ) ) ( not ( = ?auto_180599 ?auto_180601 ) ) ( not ( = ?auto_180600 ?auto_180601 ) ) ( ON ?auto_180594 ?auto_180593 ) ( ON-TABLE ?auto_180601 ) ( ON ?auto_180595 ?auto_180594 ) ( ON ?auto_180596 ?auto_180595 ) ( ON ?auto_180597 ?auto_180596 ) ( CLEAR ?auto_180597 ) ( HOLDING ?auto_180598 ) ( CLEAR ?auto_180599 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180600 ?auto_180599 ?auto_180598 )
      ( MAKE-8PILE ?auto_180593 ?auto_180594 ?auto_180595 ?auto_180596 ?auto_180597 ?auto_180598 ?auto_180599 ?auto_180600 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180602 - BLOCK
      ?auto_180603 - BLOCK
      ?auto_180604 - BLOCK
      ?auto_180605 - BLOCK
      ?auto_180606 - BLOCK
      ?auto_180607 - BLOCK
      ?auto_180608 - BLOCK
      ?auto_180609 - BLOCK
    )
    :vars
    (
      ?auto_180610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180602 ?auto_180603 ) ) ( not ( = ?auto_180602 ?auto_180604 ) ) ( not ( = ?auto_180602 ?auto_180605 ) ) ( not ( = ?auto_180602 ?auto_180606 ) ) ( not ( = ?auto_180602 ?auto_180607 ) ) ( not ( = ?auto_180602 ?auto_180608 ) ) ( not ( = ?auto_180602 ?auto_180609 ) ) ( not ( = ?auto_180603 ?auto_180604 ) ) ( not ( = ?auto_180603 ?auto_180605 ) ) ( not ( = ?auto_180603 ?auto_180606 ) ) ( not ( = ?auto_180603 ?auto_180607 ) ) ( not ( = ?auto_180603 ?auto_180608 ) ) ( not ( = ?auto_180603 ?auto_180609 ) ) ( not ( = ?auto_180604 ?auto_180605 ) ) ( not ( = ?auto_180604 ?auto_180606 ) ) ( not ( = ?auto_180604 ?auto_180607 ) ) ( not ( = ?auto_180604 ?auto_180608 ) ) ( not ( = ?auto_180604 ?auto_180609 ) ) ( not ( = ?auto_180605 ?auto_180606 ) ) ( not ( = ?auto_180605 ?auto_180607 ) ) ( not ( = ?auto_180605 ?auto_180608 ) ) ( not ( = ?auto_180605 ?auto_180609 ) ) ( not ( = ?auto_180606 ?auto_180607 ) ) ( not ( = ?auto_180606 ?auto_180608 ) ) ( not ( = ?auto_180606 ?auto_180609 ) ) ( not ( = ?auto_180607 ?auto_180608 ) ) ( not ( = ?auto_180607 ?auto_180609 ) ) ( not ( = ?auto_180608 ?auto_180609 ) ) ( ON-TABLE ?auto_180609 ) ( ON ?auto_180608 ?auto_180609 ) ( ON ?auto_180602 ?auto_180610 ) ( not ( = ?auto_180602 ?auto_180610 ) ) ( not ( = ?auto_180603 ?auto_180610 ) ) ( not ( = ?auto_180604 ?auto_180610 ) ) ( not ( = ?auto_180605 ?auto_180610 ) ) ( not ( = ?auto_180606 ?auto_180610 ) ) ( not ( = ?auto_180607 ?auto_180610 ) ) ( not ( = ?auto_180608 ?auto_180610 ) ) ( not ( = ?auto_180609 ?auto_180610 ) ) ( ON ?auto_180603 ?auto_180602 ) ( ON-TABLE ?auto_180610 ) ( ON ?auto_180604 ?auto_180603 ) ( ON ?auto_180605 ?auto_180604 ) ( ON ?auto_180606 ?auto_180605 ) ( CLEAR ?auto_180608 ) ( ON ?auto_180607 ?auto_180606 ) ( CLEAR ?auto_180607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180610 ?auto_180602 ?auto_180603 ?auto_180604 ?auto_180605 ?auto_180606 )
      ( MAKE-8PILE ?auto_180602 ?auto_180603 ?auto_180604 ?auto_180605 ?auto_180606 ?auto_180607 ?auto_180608 ?auto_180609 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180611 - BLOCK
      ?auto_180612 - BLOCK
      ?auto_180613 - BLOCK
      ?auto_180614 - BLOCK
      ?auto_180615 - BLOCK
      ?auto_180616 - BLOCK
      ?auto_180617 - BLOCK
      ?auto_180618 - BLOCK
    )
    :vars
    (
      ?auto_180619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180611 ?auto_180612 ) ) ( not ( = ?auto_180611 ?auto_180613 ) ) ( not ( = ?auto_180611 ?auto_180614 ) ) ( not ( = ?auto_180611 ?auto_180615 ) ) ( not ( = ?auto_180611 ?auto_180616 ) ) ( not ( = ?auto_180611 ?auto_180617 ) ) ( not ( = ?auto_180611 ?auto_180618 ) ) ( not ( = ?auto_180612 ?auto_180613 ) ) ( not ( = ?auto_180612 ?auto_180614 ) ) ( not ( = ?auto_180612 ?auto_180615 ) ) ( not ( = ?auto_180612 ?auto_180616 ) ) ( not ( = ?auto_180612 ?auto_180617 ) ) ( not ( = ?auto_180612 ?auto_180618 ) ) ( not ( = ?auto_180613 ?auto_180614 ) ) ( not ( = ?auto_180613 ?auto_180615 ) ) ( not ( = ?auto_180613 ?auto_180616 ) ) ( not ( = ?auto_180613 ?auto_180617 ) ) ( not ( = ?auto_180613 ?auto_180618 ) ) ( not ( = ?auto_180614 ?auto_180615 ) ) ( not ( = ?auto_180614 ?auto_180616 ) ) ( not ( = ?auto_180614 ?auto_180617 ) ) ( not ( = ?auto_180614 ?auto_180618 ) ) ( not ( = ?auto_180615 ?auto_180616 ) ) ( not ( = ?auto_180615 ?auto_180617 ) ) ( not ( = ?auto_180615 ?auto_180618 ) ) ( not ( = ?auto_180616 ?auto_180617 ) ) ( not ( = ?auto_180616 ?auto_180618 ) ) ( not ( = ?auto_180617 ?auto_180618 ) ) ( ON-TABLE ?auto_180618 ) ( ON ?auto_180611 ?auto_180619 ) ( not ( = ?auto_180611 ?auto_180619 ) ) ( not ( = ?auto_180612 ?auto_180619 ) ) ( not ( = ?auto_180613 ?auto_180619 ) ) ( not ( = ?auto_180614 ?auto_180619 ) ) ( not ( = ?auto_180615 ?auto_180619 ) ) ( not ( = ?auto_180616 ?auto_180619 ) ) ( not ( = ?auto_180617 ?auto_180619 ) ) ( not ( = ?auto_180618 ?auto_180619 ) ) ( ON ?auto_180612 ?auto_180611 ) ( ON-TABLE ?auto_180619 ) ( ON ?auto_180613 ?auto_180612 ) ( ON ?auto_180614 ?auto_180613 ) ( ON ?auto_180615 ?auto_180614 ) ( ON ?auto_180616 ?auto_180615 ) ( CLEAR ?auto_180616 ) ( HOLDING ?auto_180617 ) ( CLEAR ?auto_180618 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180618 ?auto_180617 )
      ( MAKE-8PILE ?auto_180611 ?auto_180612 ?auto_180613 ?auto_180614 ?auto_180615 ?auto_180616 ?auto_180617 ?auto_180618 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180620 - BLOCK
      ?auto_180621 - BLOCK
      ?auto_180622 - BLOCK
      ?auto_180623 - BLOCK
      ?auto_180624 - BLOCK
      ?auto_180625 - BLOCK
      ?auto_180626 - BLOCK
      ?auto_180627 - BLOCK
    )
    :vars
    (
      ?auto_180628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180620 ?auto_180621 ) ) ( not ( = ?auto_180620 ?auto_180622 ) ) ( not ( = ?auto_180620 ?auto_180623 ) ) ( not ( = ?auto_180620 ?auto_180624 ) ) ( not ( = ?auto_180620 ?auto_180625 ) ) ( not ( = ?auto_180620 ?auto_180626 ) ) ( not ( = ?auto_180620 ?auto_180627 ) ) ( not ( = ?auto_180621 ?auto_180622 ) ) ( not ( = ?auto_180621 ?auto_180623 ) ) ( not ( = ?auto_180621 ?auto_180624 ) ) ( not ( = ?auto_180621 ?auto_180625 ) ) ( not ( = ?auto_180621 ?auto_180626 ) ) ( not ( = ?auto_180621 ?auto_180627 ) ) ( not ( = ?auto_180622 ?auto_180623 ) ) ( not ( = ?auto_180622 ?auto_180624 ) ) ( not ( = ?auto_180622 ?auto_180625 ) ) ( not ( = ?auto_180622 ?auto_180626 ) ) ( not ( = ?auto_180622 ?auto_180627 ) ) ( not ( = ?auto_180623 ?auto_180624 ) ) ( not ( = ?auto_180623 ?auto_180625 ) ) ( not ( = ?auto_180623 ?auto_180626 ) ) ( not ( = ?auto_180623 ?auto_180627 ) ) ( not ( = ?auto_180624 ?auto_180625 ) ) ( not ( = ?auto_180624 ?auto_180626 ) ) ( not ( = ?auto_180624 ?auto_180627 ) ) ( not ( = ?auto_180625 ?auto_180626 ) ) ( not ( = ?auto_180625 ?auto_180627 ) ) ( not ( = ?auto_180626 ?auto_180627 ) ) ( ON-TABLE ?auto_180627 ) ( ON ?auto_180620 ?auto_180628 ) ( not ( = ?auto_180620 ?auto_180628 ) ) ( not ( = ?auto_180621 ?auto_180628 ) ) ( not ( = ?auto_180622 ?auto_180628 ) ) ( not ( = ?auto_180623 ?auto_180628 ) ) ( not ( = ?auto_180624 ?auto_180628 ) ) ( not ( = ?auto_180625 ?auto_180628 ) ) ( not ( = ?auto_180626 ?auto_180628 ) ) ( not ( = ?auto_180627 ?auto_180628 ) ) ( ON ?auto_180621 ?auto_180620 ) ( ON-TABLE ?auto_180628 ) ( ON ?auto_180622 ?auto_180621 ) ( ON ?auto_180623 ?auto_180622 ) ( ON ?auto_180624 ?auto_180623 ) ( ON ?auto_180625 ?auto_180624 ) ( CLEAR ?auto_180627 ) ( ON ?auto_180626 ?auto_180625 ) ( CLEAR ?auto_180626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180628 ?auto_180620 ?auto_180621 ?auto_180622 ?auto_180623 ?auto_180624 ?auto_180625 )
      ( MAKE-8PILE ?auto_180620 ?auto_180621 ?auto_180622 ?auto_180623 ?auto_180624 ?auto_180625 ?auto_180626 ?auto_180627 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180629 - BLOCK
      ?auto_180630 - BLOCK
      ?auto_180631 - BLOCK
      ?auto_180632 - BLOCK
      ?auto_180633 - BLOCK
      ?auto_180634 - BLOCK
      ?auto_180635 - BLOCK
      ?auto_180636 - BLOCK
    )
    :vars
    (
      ?auto_180637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180629 ?auto_180630 ) ) ( not ( = ?auto_180629 ?auto_180631 ) ) ( not ( = ?auto_180629 ?auto_180632 ) ) ( not ( = ?auto_180629 ?auto_180633 ) ) ( not ( = ?auto_180629 ?auto_180634 ) ) ( not ( = ?auto_180629 ?auto_180635 ) ) ( not ( = ?auto_180629 ?auto_180636 ) ) ( not ( = ?auto_180630 ?auto_180631 ) ) ( not ( = ?auto_180630 ?auto_180632 ) ) ( not ( = ?auto_180630 ?auto_180633 ) ) ( not ( = ?auto_180630 ?auto_180634 ) ) ( not ( = ?auto_180630 ?auto_180635 ) ) ( not ( = ?auto_180630 ?auto_180636 ) ) ( not ( = ?auto_180631 ?auto_180632 ) ) ( not ( = ?auto_180631 ?auto_180633 ) ) ( not ( = ?auto_180631 ?auto_180634 ) ) ( not ( = ?auto_180631 ?auto_180635 ) ) ( not ( = ?auto_180631 ?auto_180636 ) ) ( not ( = ?auto_180632 ?auto_180633 ) ) ( not ( = ?auto_180632 ?auto_180634 ) ) ( not ( = ?auto_180632 ?auto_180635 ) ) ( not ( = ?auto_180632 ?auto_180636 ) ) ( not ( = ?auto_180633 ?auto_180634 ) ) ( not ( = ?auto_180633 ?auto_180635 ) ) ( not ( = ?auto_180633 ?auto_180636 ) ) ( not ( = ?auto_180634 ?auto_180635 ) ) ( not ( = ?auto_180634 ?auto_180636 ) ) ( not ( = ?auto_180635 ?auto_180636 ) ) ( ON ?auto_180629 ?auto_180637 ) ( not ( = ?auto_180629 ?auto_180637 ) ) ( not ( = ?auto_180630 ?auto_180637 ) ) ( not ( = ?auto_180631 ?auto_180637 ) ) ( not ( = ?auto_180632 ?auto_180637 ) ) ( not ( = ?auto_180633 ?auto_180637 ) ) ( not ( = ?auto_180634 ?auto_180637 ) ) ( not ( = ?auto_180635 ?auto_180637 ) ) ( not ( = ?auto_180636 ?auto_180637 ) ) ( ON ?auto_180630 ?auto_180629 ) ( ON-TABLE ?auto_180637 ) ( ON ?auto_180631 ?auto_180630 ) ( ON ?auto_180632 ?auto_180631 ) ( ON ?auto_180633 ?auto_180632 ) ( ON ?auto_180634 ?auto_180633 ) ( ON ?auto_180635 ?auto_180634 ) ( CLEAR ?auto_180635 ) ( HOLDING ?auto_180636 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180636 )
      ( MAKE-8PILE ?auto_180629 ?auto_180630 ?auto_180631 ?auto_180632 ?auto_180633 ?auto_180634 ?auto_180635 ?auto_180636 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_180638 - BLOCK
      ?auto_180639 - BLOCK
      ?auto_180640 - BLOCK
      ?auto_180641 - BLOCK
      ?auto_180642 - BLOCK
      ?auto_180643 - BLOCK
      ?auto_180644 - BLOCK
      ?auto_180645 - BLOCK
    )
    :vars
    (
      ?auto_180646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180638 ?auto_180639 ) ) ( not ( = ?auto_180638 ?auto_180640 ) ) ( not ( = ?auto_180638 ?auto_180641 ) ) ( not ( = ?auto_180638 ?auto_180642 ) ) ( not ( = ?auto_180638 ?auto_180643 ) ) ( not ( = ?auto_180638 ?auto_180644 ) ) ( not ( = ?auto_180638 ?auto_180645 ) ) ( not ( = ?auto_180639 ?auto_180640 ) ) ( not ( = ?auto_180639 ?auto_180641 ) ) ( not ( = ?auto_180639 ?auto_180642 ) ) ( not ( = ?auto_180639 ?auto_180643 ) ) ( not ( = ?auto_180639 ?auto_180644 ) ) ( not ( = ?auto_180639 ?auto_180645 ) ) ( not ( = ?auto_180640 ?auto_180641 ) ) ( not ( = ?auto_180640 ?auto_180642 ) ) ( not ( = ?auto_180640 ?auto_180643 ) ) ( not ( = ?auto_180640 ?auto_180644 ) ) ( not ( = ?auto_180640 ?auto_180645 ) ) ( not ( = ?auto_180641 ?auto_180642 ) ) ( not ( = ?auto_180641 ?auto_180643 ) ) ( not ( = ?auto_180641 ?auto_180644 ) ) ( not ( = ?auto_180641 ?auto_180645 ) ) ( not ( = ?auto_180642 ?auto_180643 ) ) ( not ( = ?auto_180642 ?auto_180644 ) ) ( not ( = ?auto_180642 ?auto_180645 ) ) ( not ( = ?auto_180643 ?auto_180644 ) ) ( not ( = ?auto_180643 ?auto_180645 ) ) ( not ( = ?auto_180644 ?auto_180645 ) ) ( ON ?auto_180638 ?auto_180646 ) ( not ( = ?auto_180638 ?auto_180646 ) ) ( not ( = ?auto_180639 ?auto_180646 ) ) ( not ( = ?auto_180640 ?auto_180646 ) ) ( not ( = ?auto_180641 ?auto_180646 ) ) ( not ( = ?auto_180642 ?auto_180646 ) ) ( not ( = ?auto_180643 ?auto_180646 ) ) ( not ( = ?auto_180644 ?auto_180646 ) ) ( not ( = ?auto_180645 ?auto_180646 ) ) ( ON ?auto_180639 ?auto_180638 ) ( ON-TABLE ?auto_180646 ) ( ON ?auto_180640 ?auto_180639 ) ( ON ?auto_180641 ?auto_180640 ) ( ON ?auto_180642 ?auto_180641 ) ( ON ?auto_180643 ?auto_180642 ) ( ON ?auto_180644 ?auto_180643 ) ( ON ?auto_180645 ?auto_180644 ) ( CLEAR ?auto_180645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180646 ?auto_180638 ?auto_180639 ?auto_180640 ?auto_180641 ?auto_180642 ?auto_180643 ?auto_180644 )
      ( MAKE-8PILE ?auto_180638 ?auto_180639 ?auto_180640 ?auto_180641 ?auto_180642 ?auto_180643 ?auto_180644 ?auto_180645 ) )
  )

)

