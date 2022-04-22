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
      ?auto_208878 - BLOCK
      ?auto_208879 - BLOCK
      ?auto_208880 - BLOCK
      ?auto_208881 - BLOCK
      ?auto_208882 - BLOCK
      ?auto_208883 - BLOCK
      ?auto_208884 - BLOCK
      ?auto_208885 - BLOCK
    )
    :vars
    (
      ?auto_208886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208886 ?auto_208885 ) ( CLEAR ?auto_208886 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208878 ) ( ON ?auto_208879 ?auto_208878 ) ( ON ?auto_208880 ?auto_208879 ) ( ON ?auto_208881 ?auto_208880 ) ( ON ?auto_208882 ?auto_208881 ) ( ON ?auto_208883 ?auto_208882 ) ( ON ?auto_208884 ?auto_208883 ) ( ON ?auto_208885 ?auto_208884 ) ( not ( = ?auto_208878 ?auto_208879 ) ) ( not ( = ?auto_208878 ?auto_208880 ) ) ( not ( = ?auto_208878 ?auto_208881 ) ) ( not ( = ?auto_208878 ?auto_208882 ) ) ( not ( = ?auto_208878 ?auto_208883 ) ) ( not ( = ?auto_208878 ?auto_208884 ) ) ( not ( = ?auto_208878 ?auto_208885 ) ) ( not ( = ?auto_208878 ?auto_208886 ) ) ( not ( = ?auto_208879 ?auto_208880 ) ) ( not ( = ?auto_208879 ?auto_208881 ) ) ( not ( = ?auto_208879 ?auto_208882 ) ) ( not ( = ?auto_208879 ?auto_208883 ) ) ( not ( = ?auto_208879 ?auto_208884 ) ) ( not ( = ?auto_208879 ?auto_208885 ) ) ( not ( = ?auto_208879 ?auto_208886 ) ) ( not ( = ?auto_208880 ?auto_208881 ) ) ( not ( = ?auto_208880 ?auto_208882 ) ) ( not ( = ?auto_208880 ?auto_208883 ) ) ( not ( = ?auto_208880 ?auto_208884 ) ) ( not ( = ?auto_208880 ?auto_208885 ) ) ( not ( = ?auto_208880 ?auto_208886 ) ) ( not ( = ?auto_208881 ?auto_208882 ) ) ( not ( = ?auto_208881 ?auto_208883 ) ) ( not ( = ?auto_208881 ?auto_208884 ) ) ( not ( = ?auto_208881 ?auto_208885 ) ) ( not ( = ?auto_208881 ?auto_208886 ) ) ( not ( = ?auto_208882 ?auto_208883 ) ) ( not ( = ?auto_208882 ?auto_208884 ) ) ( not ( = ?auto_208882 ?auto_208885 ) ) ( not ( = ?auto_208882 ?auto_208886 ) ) ( not ( = ?auto_208883 ?auto_208884 ) ) ( not ( = ?auto_208883 ?auto_208885 ) ) ( not ( = ?auto_208883 ?auto_208886 ) ) ( not ( = ?auto_208884 ?auto_208885 ) ) ( not ( = ?auto_208884 ?auto_208886 ) ) ( not ( = ?auto_208885 ?auto_208886 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208886 ?auto_208885 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208888 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_208888 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_208888 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208889 - BLOCK
    )
    :vars
    (
      ?auto_208890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208889 ?auto_208890 ) ( CLEAR ?auto_208889 ) ( HAND-EMPTY ) ( not ( = ?auto_208889 ?auto_208890 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208889 ?auto_208890 )
      ( MAKE-1PILE ?auto_208889 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208898 - BLOCK
      ?auto_208899 - BLOCK
      ?auto_208900 - BLOCK
      ?auto_208901 - BLOCK
      ?auto_208902 - BLOCK
      ?auto_208903 - BLOCK
      ?auto_208904 - BLOCK
    )
    :vars
    (
      ?auto_208905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208905 ?auto_208904 ) ( CLEAR ?auto_208905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208898 ) ( ON ?auto_208899 ?auto_208898 ) ( ON ?auto_208900 ?auto_208899 ) ( ON ?auto_208901 ?auto_208900 ) ( ON ?auto_208902 ?auto_208901 ) ( ON ?auto_208903 ?auto_208902 ) ( ON ?auto_208904 ?auto_208903 ) ( not ( = ?auto_208898 ?auto_208899 ) ) ( not ( = ?auto_208898 ?auto_208900 ) ) ( not ( = ?auto_208898 ?auto_208901 ) ) ( not ( = ?auto_208898 ?auto_208902 ) ) ( not ( = ?auto_208898 ?auto_208903 ) ) ( not ( = ?auto_208898 ?auto_208904 ) ) ( not ( = ?auto_208898 ?auto_208905 ) ) ( not ( = ?auto_208899 ?auto_208900 ) ) ( not ( = ?auto_208899 ?auto_208901 ) ) ( not ( = ?auto_208899 ?auto_208902 ) ) ( not ( = ?auto_208899 ?auto_208903 ) ) ( not ( = ?auto_208899 ?auto_208904 ) ) ( not ( = ?auto_208899 ?auto_208905 ) ) ( not ( = ?auto_208900 ?auto_208901 ) ) ( not ( = ?auto_208900 ?auto_208902 ) ) ( not ( = ?auto_208900 ?auto_208903 ) ) ( not ( = ?auto_208900 ?auto_208904 ) ) ( not ( = ?auto_208900 ?auto_208905 ) ) ( not ( = ?auto_208901 ?auto_208902 ) ) ( not ( = ?auto_208901 ?auto_208903 ) ) ( not ( = ?auto_208901 ?auto_208904 ) ) ( not ( = ?auto_208901 ?auto_208905 ) ) ( not ( = ?auto_208902 ?auto_208903 ) ) ( not ( = ?auto_208902 ?auto_208904 ) ) ( not ( = ?auto_208902 ?auto_208905 ) ) ( not ( = ?auto_208903 ?auto_208904 ) ) ( not ( = ?auto_208903 ?auto_208905 ) ) ( not ( = ?auto_208904 ?auto_208905 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208905 ?auto_208904 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208906 - BLOCK
      ?auto_208907 - BLOCK
      ?auto_208908 - BLOCK
      ?auto_208909 - BLOCK
      ?auto_208910 - BLOCK
      ?auto_208911 - BLOCK
      ?auto_208912 - BLOCK
    )
    :vars
    (
      ?auto_208913 - BLOCK
      ?auto_208914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208913 ?auto_208912 ) ( CLEAR ?auto_208913 ) ( ON-TABLE ?auto_208906 ) ( ON ?auto_208907 ?auto_208906 ) ( ON ?auto_208908 ?auto_208907 ) ( ON ?auto_208909 ?auto_208908 ) ( ON ?auto_208910 ?auto_208909 ) ( ON ?auto_208911 ?auto_208910 ) ( ON ?auto_208912 ?auto_208911 ) ( not ( = ?auto_208906 ?auto_208907 ) ) ( not ( = ?auto_208906 ?auto_208908 ) ) ( not ( = ?auto_208906 ?auto_208909 ) ) ( not ( = ?auto_208906 ?auto_208910 ) ) ( not ( = ?auto_208906 ?auto_208911 ) ) ( not ( = ?auto_208906 ?auto_208912 ) ) ( not ( = ?auto_208906 ?auto_208913 ) ) ( not ( = ?auto_208907 ?auto_208908 ) ) ( not ( = ?auto_208907 ?auto_208909 ) ) ( not ( = ?auto_208907 ?auto_208910 ) ) ( not ( = ?auto_208907 ?auto_208911 ) ) ( not ( = ?auto_208907 ?auto_208912 ) ) ( not ( = ?auto_208907 ?auto_208913 ) ) ( not ( = ?auto_208908 ?auto_208909 ) ) ( not ( = ?auto_208908 ?auto_208910 ) ) ( not ( = ?auto_208908 ?auto_208911 ) ) ( not ( = ?auto_208908 ?auto_208912 ) ) ( not ( = ?auto_208908 ?auto_208913 ) ) ( not ( = ?auto_208909 ?auto_208910 ) ) ( not ( = ?auto_208909 ?auto_208911 ) ) ( not ( = ?auto_208909 ?auto_208912 ) ) ( not ( = ?auto_208909 ?auto_208913 ) ) ( not ( = ?auto_208910 ?auto_208911 ) ) ( not ( = ?auto_208910 ?auto_208912 ) ) ( not ( = ?auto_208910 ?auto_208913 ) ) ( not ( = ?auto_208911 ?auto_208912 ) ) ( not ( = ?auto_208911 ?auto_208913 ) ) ( not ( = ?auto_208912 ?auto_208913 ) ) ( HOLDING ?auto_208914 ) ( not ( = ?auto_208906 ?auto_208914 ) ) ( not ( = ?auto_208907 ?auto_208914 ) ) ( not ( = ?auto_208908 ?auto_208914 ) ) ( not ( = ?auto_208909 ?auto_208914 ) ) ( not ( = ?auto_208910 ?auto_208914 ) ) ( not ( = ?auto_208911 ?auto_208914 ) ) ( not ( = ?auto_208912 ?auto_208914 ) ) ( not ( = ?auto_208913 ?auto_208914 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_208914 )
      ( MAKE-7PILE ?auto_208906 ?auto_208907 ?auto_208908 ?auto_208909 ?auto_208910 ?auto_208911 ?auto_208912 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208915 - BLOCK
      ?auto_208916 - BLOCK
      ?auto_208917 - BLOCK
      ?auto_208918 - BLOCK
      ?auto_208919 - BLOCK
      ?auto_208920 - BLOCK
      ?auto_208921 - BLOCK
    )
    :vars
    (
      ?auto_208922 - BLOCK
      ?auto_208923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208922 ?auto_208921 ) ( ON-TABLE ?auto_208915 ) ( ON ?auto_208916 ?auto_208915 ) ( ON ?auto_208917 ?auto_208916 ) ( ON ?auto_208918 ?auto_208917 ) ( ON ?auto_208919 ?auto_208918 ) ( ON ?auto_208920 ?auto_208919 ) ( ON ?auto_208921 ?auto_208920 ) ( not ( = ?auto_208915 ?auto_208916 ) ) ( not ( = ?auto_208915 ?auto_208917 ) ) ( not ( = ?auto_208915 ?auto_208918 ) ) ( not ( = ?auto_208915 ?auto_208919 ) ) ( not ( = ?auto_208915 ?auto_208920 ) ) ( not ( = ?auto_208915 ?auto_208921 ) ) ( not ( = ?auto_208915 ?auto_208922 ) ) ( not ( = ?auto_208916 ?auto_208917 ) ) ( not ( = ?auto_208916 ?auto_208918 ) ) ( not ( = ?auto_208916 ?auto_208919 ) ) ( not ( = ?auto_208916 ?auto_208920 ) ) ( not ( = ?auto_208916 ?auto_208921 ) ) ( not ( = ?auto_208916 ?auto_208922 ) ) ( not ( = ?auto_208917 ?auto_208918 ) ) ( not ( = ?auto_208917 ?auto_208919 ) ) ( not ( = ?auto_208917 ?auto_208920 ) ) ( not ( = ?auto_208917 ?auto_208921 ) ) ( not ( = ?auto_208917 ?auto_208922 ) ) ( not ( = ?auto_208918 ?auto_208919 ) ) ( not ( = ?auto_208918 ?auto_208920 ) ) ( not ( = ?auto_208918 ?auto_208921 ) ) ( not ( = ?auto_208918 ?auto_208922 ) ) ( not ( = ?auto_208919 ?auto_208920 ) ) ( not ( = ?auto_208919 ?auto_208921 ) ) ( not ( = ?auto_208919 ?auto_208922 ) ) ( not ( = ?auto_208920 ?auto_208921 ) ) ( not ( = ?auto_208920 ?auto_208922 ) ) ( not ( = ?auto_208921 ?auto_208922 ) ) ( not ( = ?auto_208915 ?auto_208923 ) ) ( not ( = ?auto_208916 ?auto_208923 ) ) ( not ( = ?auto_208917 ?auto_208923 ) ) ( not ( = ?auto_208918 ?auto_208923 ) ) ( not ( = ?auto_208919 ?auto_208923 ) ) ( not ( = ?auto_208920 ?auto_208923 ) ) ( not ( = ?auto_208921 ?auto_208923 ) ) ( not ( = ?auto_208922 ?auto_208923 ) ) ( ON ?auto_208923 ?auto_208922 ) ( CLEAR ?auto_208923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208915 ?auto_208916 ?auto_208917 ?auto_208918 ?auto_208919 ?auto_208920 ?auto_208921 ?auto_208922 )
      ( MAKE-7PILE ?auto_208915 ?auto_208916 ?auto_208917 ?auto_208918 ?auto_208919 ?auto_208920 ?auto_208921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_208926 - BLOCK
      ?auto_208927 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_208927 ) ( CLEAR ?auto_208926 ) ( ON-TABLE ?auto_208926 ) ( not ( = ?auto_208926 ?auto_208927 ) ) )
    :subtasks
    ( ( !STACK ?auto_208927 ?auto_208926 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_208928 - BLOCK
      ?auto_208929 - BLOCK
    )
    :vars
    (
      ?auto_208930 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_208928 ) ( ON-TABLE ?auto_208928 ) ( not ( = ?auto_208928 ?auto_208929 ) ) ( ON ?auto_208929 ?auto_208930 ) ( CLEAR ?auto_208929 ) ( HAND-EMPTY ) ( not ( = ?auto_208928 ?auto_208930 ) ) ( not ( = ?auto_208929 ?auto_208930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208929 ?auto_208930 )
      ( MAKE-2PILE ?auto_208928 ?auto_208929 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_208931 - BLOCK
      ?auto_208932 - BLOCK
    )
    :vars
    (
      ?auto_208933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208931 ?auto_208932 ) ) ( ON ?auto_208932 ?auto_208933 ) ( CLEAR ?auto_208932 ) ( not ( = ?auto_208931 ?auto_208933 ) ) ( not ( = ?auto_208932 ?auto_208933 ) ) ( HOLDING ?auto_208931 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208931 )
      ( MAKE-2PILE ?auto_208931 ?auto_208932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_208934 - BLOCK
      ?auto_208935 - BLOCK
    )
    :vars
    (
      ?auto_208936 - BLOCK
      ?auto_208941 - BLOCK
      ?auto_208938 - BLOCK
      ?auto_208942 - BLOCK
      ?auto_208939 - BLOCK
      ?auto_208937 - BLOCK
      ?auto_208940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208934 ?auto_208935 ) ) ( ON ?auto_208935 ?auto_208936 ) ( not ( = ?auto_208934 ?auto_208936 ) ) ( not ( = ?auto_208935 ?auto_208936 ) ) ( ON ?auto_208934 ?auto_208935 ) ( CLEAR ?auto_208934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208941 ) ( ON ?auto_208938 ?auto_208941 ) ( ON ?auto_208942 ?auto_208938 ) ( ON ?auto_208939 ?auto_208942 ) ( ON ?auto_208937 ?auto_208939 ) ( ON ?auto_208940 ?auto_208937 ) ( ON ?auto_208936 ?auto_208940 ) ( not ( = ?auto_208941 ?auto_208938 ) ) ( not ( = ?auto_208941 ?auto_208942 ) ) ( not ( = ?auto_208941 ?auto_208939 ) ) ( not ( = ?auto_208941 ?auto_208937 ) ) ( not ( = ?auto_208941 ?auto_208940 ) ) ( not ( = ?auto_208941 ?auto_208936 ) ) ( not ( = ?auto_208941 ?auto_208935 ) ) ( not ( = ?auto_208941 ?auto_208934 ) ) ( not ( = ?auto_208938 ?auto_208942 ) ) ( not ( = ?auto_208938 ?auto_208939 ) ) ( not ( = ?auto_208938 ?auto_208937 ) ) ( not ( = ?auto_208938 ?auto_208940 ) ) ( not ( = ?auto_208938 ?auto_208936 ) ) ( not ( = ?auto_208938 ?auto_208935 ) ) ( not ( = ?auto_208938 ?auto_208934 ) ) ( not ( = ?auto_208942 ?auto_208939 ) ) ( not ( = ?auto_208942 ?auto_208937 ) ) ( not ( = ?auto_208942 ?auto_208940 ) ) ( not ( = ?auto_208942 ?auto_208936 ) ) ( not ( = ?auto_208942 ?auto_208935 ) ) ( not ( = ?auto_208942 ?auto_208934 ) ) ( not ( = ?auto_208939 ?auto_208937 ) ) ( not ( = ?auto_208939 ?auto_208940 ) ) ( not ( = ?auto_208939 ?auto_208936 ) ) ( not ( = ?auto_208939 ?auto_208935 ) ) ( not ( = ?auto_208939 ?auto_208934 ) ) ( not ( = ?auto_208937 ?auto_208940 ) ) ( not ( = ?auto_208937 ?auto_208936 ) ) ( not ( = ?auto_208937 ?auto_208935 ) ) ( not ( = ?auto_208937 ?auto_208934 ) ) ( not ( = ?auto_208940 ?auto_208936 ) ) ( not ( = ?auto_208940 ?auto_208935 ) ) ( not ( = ?auto_208940 ?auto_208934 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208941 ?auto_208938 ?auto_208942 ?auto_208939 ?auto_208937 ?auto_208940 ?auto_208936 ?auto_208935 )
      ( MAKE-2PILE ?auto_208934 ?auto_208935 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208949 - BLOCK
      ?auto_208950 - BLOCK
      ?auto_208951 - BLOCK
      ?auto_208952 - BLOCK
      ?auto_208953 - BLOCK
      ?auto_208954 - BLOCK
    )
    :vars
    (
      ?auto_208955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208955 ?auto_208954 ) ( CLEAR ?auto_208955 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208949 ) ( ON ?auto_208950 ?auto_208949 ) ( ON ?auto_208951 ?auto_208950 ) ( ON ?auto_208952 ?auto_208951 ) ( ON ?auto_208953 ?auto_208952 ) ( ON ?auto_208954 ?auto_208953 ) ( not ( = ?auto_208949 ?auto_208950 ) ) ( not ( = ?auto_208949 ?auto_208951 ) ) ( not ( = ?auto_208949 ?auto_208952 ) ) ( not ( = ?auto_208949 ?auto_208953 ) ) ( not ( = ?auto_208949 ?auto_208954 ) ) ( not ( = ?auto_208949 ?auto_208955 ) ) ( not ( = ?auto_208950 ?auto_208951 ) ) ( not ( = ?auto_208950 ?auto_208952 ) ) ( not ( = ?auto_208950 ?auto_208953 ) ) ( not ( = ?auto_208950 ?auto_208954 ) ) ( not ( = ?auto_208950 ?auto_208955 ) ) ( not ( = ?auto_208951 ?auto_208952 ) ) ( not ( = ?auto_208951 ?auto_208953 ) ) ( not ( = ?auto_208951 ?auto_208954 ) ) ( not ( = ?auto_208951 ?auto_208955 ) ) ( not ( = ?auto_208952 ?auto_208953 ) ) ( not ( = ?auto_208952 ?auto_208954 ) ) ( not ( = ?auto_208952 ?auto_208955 ) ) ( not ( = ?auto_208953 ?auto_208954 ) ) ( not ( = ?auto_208953 ?auto_208955 ) ) ( not ( = ?auto_208954 ?auto_208955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208955 ?auto_208954 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208956 - BLOCK
      ?auto_208957 - BLOCK
      ?auto_208958 - BLOCK
      ?auto_208959 - BLOCK
      ?auto_208960 - BLOCK
      ?auto_208961 - BLOCK
    )
    :vars
    (
      ?auto_208962 - BLOCK
      ?auto_208963 - BLOCK
      ?auto_208964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208962 ?auto_208961 ) ( CLEAR ?auto_208962 ) ( ON-TABLE ?auto_208956 ) ( ON ?auto_208957 ?auto_208956 ) ( ON ?auto_208958 ?auto_208957 ) ( ON ?auto_208959 ?auto_208958 ) ( ON ?auto_208960 ?auto_208959 ) ( ON ?auto_208961 ?auto_208960 ) ( not ( = ?auto_208956 ?auto_208957 ) ) ( not ( = ?auto_208956 ?auto_208958 ) ) ( not ( = ?auto_208956 ?auto_208959 ) ) ( not ( = ?auto_208956 ?auto_208960 ) ) ( not ( = ?auto_208956 ?auto_208961 ) ) ( not ( = ?auto_208956 ?auto_208962 ) ) ( not ( = ?auto_208957 ?auto_208958 ) ) ( not ( = ?auto_208957 ?auto_208959 ) ) ( not ( = ?auto_208957 ?auto_208960 ) ) ( not ( = ?auto_208957 ?auto_208961 ) ) ( not ( = ?auto_208957 ?auto_208962 ) ) ( not ( = ?auto_208958 ?auto_208959 ) ) ( not ( = ?auto_208958 ?auto_208960 ) ) ( not ( = ?auto_208958 ?auto_208961 ) ) ( not ( = ?auto_208958 ?auto_208962 ) ) ( not ( = ?auto_208959 ?auto_208960 ) ) ( not ( = ?auto_208959 ?auto_208961 ) ) ( not ( = ?auto_208959 ?auto_208962 ) ) ( not ( = ?auto_208960 ?auto_208961 ) ) ( not ( = ?auto_208960 ?auto_208962 ) ) ( not ( = ?auto_208961 ?auto_208962 ) ) ( HOLDING ?auto_208963 ) ( CLEAR ?auto_208964 ) ( not ( = ?auto_208956 ?auto_208963 ) ) ( not ( = ?auto_208956 ?auto_208964 ) ) ( not ( = ?auto_208957 ?auto_208963 ) ) ( not ( = ?auto_208957 ?auto_208964 ) ) ( not ( = ?auto_208958 ?auto_208963 ) ) ( not ( = ?auto_208958 ?auto_208964 ) ) ( not ( = ?auto_208959 ?auto_208963 ) ) ( not ( = ?auto_208959 ?auto_208964 ) ) ( not ( = ?auto_208960 ?auto_208963 ) ) ( not ( = ?auto_208960 ?auto_208964 ) ) ( not ( = ?auto_208961 ?auto_208963 ) ) ( not ( = ?auto_208961 ?auto_208964 ) ) ( not ( = ?auto_208962 ?auto_208963 ) ) ( not ( = ?auto_208962 ?auto_208964 ) ) ( not ( = ?auto_208963 ?auto_208964 ) ) )
    :subtasks
    ( ( !STACK ?auto_208963 ?auto_208964 )
      ( MAKE-6PILE ?auto_208956 ?auto_208957 ?auto_208958 ?auto_208959 ?auto_208960 ?auto_208961 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208965 - BLOCK
      ?auto_208966 - BLOCK
      ?auto_208967 - BLOCK
      ?auto_208968 - BLOCK
      ?auto_208969 - BLOCK
      ?auto_208970 - BLOCK
    )
    :vars
    (
      ?auto_208972 - BLOCK
      ?auto_208971 - BLOCK
      ?auto_208973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208972 ?auto_208970 ) ( ON-TABLE ?auto_208965 ) ( ON ?auto_208966 ?auto_208965 ) ( ON ?auto_208967 ?auto_208966 ) ( ON ?auto_208968 ?auto_208967 ) ( ON ?auto_208969 ?auto_208968 ) ( ON ?auto_208970 ?auto_208969 ) ( not ( = ?auto_208965 ?auto_208966 ) ) ( not ( = ?auto_208965 ?auto_208967 ) ) ( not ( = ?auto_208965 ?auto_208968 ) ) ( not ( = ?auto_208965 ?auto_208969 ) ) ( not ( = ?auto_208965 ?auto_208970 ) ) ( not ( = ?auto_208965 ?auto_208972 ) ) ( not ( = ?auto_208966 ?auto_208967 ) ) ( not ( = ?auto_208966 ?auto_208968 ) ) ( not ( = ?auto_208966 ?auto_208969 ) ) ( not ( = ?auto_208966 ?auto_208970 ) ) ( not ( = ?auto_208966 ?auto_208972 ) ) ( not ( = ?auto_208967 ?auto_208968 ) ) ( not ( = ?auto_208967 ?auto_208969 ) ) ( not ( = ?auto_208967 ?auto_208970 ) ) ( not ( = ?auto_208967 ?auto_208972 ) ) ( not ( = ?auto_208968 ?auto_208969 ) ) ( not ( = ?auto_208968 ?auto_208970 ) ) ( not ( = ?auto_208968 ?auto_208972 ) ) ( not ( = ?auto_208969 ?auto_208970 ) ) ( not ( = ?auto_208969 ?auto_208972 ) ) ( not ( = ?auto_208970 ?auto_208972 ) ) ( CLEAR ?auto_208971 ) ( not ( = ?auto_208965 ?auto_208973 ) ) ( not ( = ?auto_208965 ?auto_208971 ) ) ( not ( = ?auto_208966 ?auto_208973 ) ) ( not ( = ?auto_208966 ?auto_208971 ) ) ( not ( = ?auto_208967 ?auto_208973 ) ) ( not ( = ?auto_208967 ?auto_208971 ) ) ( not ( = ?auto_208968 ?auto_208973 ) ) ( not ( = ?auto_208968 ?auto_208971 ) ) ( not ( = ?auto_208969 ?auto_208973 ) ) ( not ( = ?auto_208969 ?auto_208971 ) ) ( not ( = ?auto_208970 ?auto_208973 ) ) ( not ( = ?auto_208970 ?auto_208971 ) ) ( not ( = ?auto_208972 ?auto_208973 ) ) ( not ( = ?auto_208972 ?auto_208971 ) ) ( not ( = ?auto_208973 ?auto_208971 ) ) ( ON ?auto_208973 ?auto_208972 ) ( CLEAR ?auto_208973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208965 ?auto_208966 ?auto_208967 ?auto_208968 ?auto_208969 ?auto_208970 ?auto_208972 )
      ( MAKE-6PILE ?auto_208965 ?auto_208966 ?auto_208967 ?auto_208968 ?auto_208969 ?auto_208970 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208974 - BLOCK
      ?auto_208975 - BLOCK
      ?auto_208976 - BLOCK
      ?auto_208977 - BLOCK
      ?auto_208978 - BLOCK
      ?auto_208979 - BLOCK
    )
    :vars
    (
      ?auto_208981 - BLOCK
      ?auto_208980 - BLOCK
      ?auto_208982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208981 ?auto_208979 ) ( ON-TABLE ?auto_208974 ) ( ON ?auto_208975 ?auto_208974 ) ( ON ?auto_208976 ?auto_208975 ) ( ON ?auto_208977 ?auto_208976 ) ( ON ?auto_208978 ?auto_208977 ) ( ON ?auto_208979 ?auto_208978 ) ( not ( = ?auto_208974 ?auto_208975 ) ) ( not ( = ?auto_208974 ?auto_208976 ) ) ( not ( = ?auto_208974 ?auto_208977 ) ) ( not ( = ?auto_208974 ?auto_208978 ) ) ( not ( = ?auto_208974 ?auto_208979 ) ) ( not ( = ?auto_208974 ?auto_208981 ) ) ( not ( = ?auto_208975 ?auto_208976 ) ) ( not ( = ?auto_208975 ?auto_208977 ) ) ( not ( = ?auto_208975 ?auto_208978 ) ) ( not ( = ?auto_208975 ?auto_208979 ) ) ( not ( = ?auto_208975 ?auto_208981 ) ) ( not ( = ?auto_208976 ?auto_208977 ) ) ( not ( = ?auto_208976 ?auto_208978 ) ) ( not ( = ?auto_208976 ?auto_208979 ) ) ( not ( = ?auto_208976 ?auto_208981 ) ) ( not ( = ?auto_208977 ?auto_208978 ) ) ( not ( = ?auto_208977 ?auto_208979 ) ) ( not ( = ?auto_208977 ?auto_208981 ) ) ( not ( = ?auto_208978 ?auto_208979 ) ) ( not ( = ?auto_208978 ?auto_208981 ) ) ( not ( = ?auto_208979 ?auto_208981 ) ) ( not ( = ?auto_208974 ?auto_208980 ) ) ( not ( = ?auto_208974 ?auto_208982 ) ) ( not ( = ?auto_208975 ?auto_208980 ) ) ( not ( = ?auto_208975 ?auto_208982 ) ) ( not ( = ?auto_208976 ?auto_208980 ) ) ( not ( = ?auto_208976 ?auto_208982 ) ) ( not ( = ?auto_208977 ?auto_208980 ) ) ( not ( = ?auto_208977 ?auto_208982 ) ) ( not ( = ?auto_208978 ?auto_208980 ) ) ( not ( = ?auto_208978 ?auto_208982 ) ) ( not ( = ?auto_208979 ?auto_208980 ) ) ( not ( = ?auto_208979 ?auto_208982 ) ) ( not ( = ?auto_208981 ?auto_208980 ) ) ( not ( = ?auto_208981 ?auto_208982 ) ) ( not ( = ?auto_208980 ?auto_208982 ) ) ( ON ?auto_208980 ?auto_208981 ) ( CLEAR ?auto_208980 ) ( HOLDING ?auto_208982 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208982 )
      ( MAKE-6PILE ?auto_208974 ?auto_208975 ?auto_208976 ?auto_208977 ?auto_208978 ?auto_208979 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208983 - BLOCK
      ?auto_208984 - BLOCK
      ?auto_208985 - BLOCK
      ?auto_208986 - BLOCK
      ?auto_208987 - BLOCK
      ?auto_208988 - BLOCK
    )
    :vars
    (
      ?auto_208991 - BLOCK
      ?auto_208989 - BLOCK
      ?auto_208990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208991 ?auto_208988 ) ( ON-TABLE ?auto_208983 ) ( ON ?auto_208984 ?auto_208983 ) ( ON ?auto_208985 ?auto_208984 ) ( ON ?auto_208986 ?auto_208985 ) ( ON ?auto_208987 ?auto_208986 ) ( ON ?auto_208988 ?auto_208987 ) ( not ( = ?auto_208983 ?auto_208984 ) ) ( not ( = ?auto_208983 ?auto_208985 ) ) ( not ( = ?auto_208983 ?auto_208986 ) ) ( not ( = ?auto_208983 ?auto_208987 ) ) ( not ( = ?auto_208983 ?auto_208988 ) ) ( not ( = ?auto_208983 ?auto_208991 ) ) ( not ( = ?auto_208984 ?auto_208985 ) ) ( not ( = ?auto_208984 ?auto_208986 ) ) ( not ( = ?auto_208984 ?auto_208987 ) ) ( not ( = ?auto_208984 ?auto_208988 ) ) ( not ( = ?auto_208984 ?auto_208991 ) ) ( not ( = ?auto_208985 ?auto_208986 ) ) ( not ( = ?auto_208985 ?auto_208987 ) ) ( not ( = ?auto_208985 ?auto_208988 ) ) ( not ( = ?auto_208985 ?auto_208991 ) ) ( not ( = ?auto_208986 ?auto_208987 ) ) ( not ( = ?auto_208986 ?auto_208988 ) ) ( not ( = ?auto_208986 ?auto_208991 ) ) ( not ( = ?auto_208987 ?auto_208988 ) ) ( not ( = ?auto_208987 ?auto_208991 ) ) ( not ( = ?auto_208988 ?auto_208991 ) ) ( not ( = ?auto_208983 ?auto_208989 ) ) ( not ( = ?auto_208983 ?auto_208990 ) ) ( not ( = ?auto_208984 ?auto_208989 ) ) ( not ( = ?auto_208984 ?auto_208990 ) ) ( not ( = ?auto_208985 ?auto_208989 ) ) ( not ( = ?auto_208985 ?auto_208990 ) ) ( not ( = ?auto_208986 ?auto_208989 ) ) ( not ( = ?auto_208986 ?auto_208990 ) ) ( not ( = ?auto_208987 ?auto_208989 ) ) ( not ( = ?auto_208987 ?auto_208990 ) ) ( not ( = ?auto_208988 ?auto_208989 ) ) ( not ( = ?auto_208988 ?auto_208990 ) ) ( not ( = ?auto_208991 ?auto_208989 ) ) ( not ( = ?auto_208991 ?auto_208990 ) ) ( not ( = ?auto_208989 ?auto_208990 ) ) ( ON ?auto_208989 ?auto_208991 ) ( ON ?auto_208990 ?auto_208989 ) ( CLEAR ?auto_208990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208983 ?auto_208984 ?auto_208985 ?auto_208986 ?auto_208987 ?auto_208988 ?auto_208991 ?auto_208989 )
      ( MAKE-6PILE ?auto_208983 ?auto_208984 ?auto_208985 ?auto_208986 ?auto_208987 ?auto_208988 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_208995 - BLOCK
      ?auto_208996 - BLOCK
      ?auto_208997 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_208997 ) ( CLEAR ?auto_208996 ) ( ON-TABLE ?auto_208995 ) ( ON ?auto_208996 ?auto_208995 ) ( not ( = ?auto_208995 ?auto_208996 ) ) ( not ( = ?auto_208995 ?auto_208997 ) ) ( not ( = ?auto_208996 ?auto_208997 ) ) )
    :subtasks
    ( ( !STACK ?auto_208997 ?auto_208996 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_208998 - BLOCK
      ?auto_208999 - BLOCK
      ?auto_209000 - BLOCK
    )
    :vars
    (
      ?auto_209001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_208999 ) ( ON-TABLE ?auto_208998 ) ( ON ?auto_208999 ?auto_208998 ) ( not ( = ?auto_208998 ?auto_208999 ) ) ( not ( = ?auto_208998 ?auto_209000 ) ) ( not ( = ?auto_208999 ?auto_209000 ) ) ( ON ?auto_209000 ?auto_209001 ) ( CLEAR ?auto_209000 ) ( HAND-EMPTY ) ( not ( = ?auto_208998 ?auto_209001 ) ) ( not ( = ?auto_208999 ?auto_209001 ) ) ( not ( = ?auto_209000 ?auto_209001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209000 ?auto_209001 )
      ( MAKE-3PILE ?auto_208998 ?auto_208999 ?auto_209000 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209002 - BLOCK
      ?auto_209003 - BLOCK
      ?auto_209004 - BLOCK
    )
    :vars
    (
      ?auto_209005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209002 ) ( not ( = ?auto_209002 ?auto_209003 ) ) ( not ( = ?auto_209002 ?auto_209004 ) ) ( not ( = ?auto_209003 ?auto_209004 ) ) ( ON ?auto_209004 ?auto_209005 ) ( CLEAR ?auto_209004 ) ( not ( = ?auto_209002 ?auto_209005 ) ) ( not ( = ?auto_209003 ?auto_209005 ) ) ( not ( = ?auto_209004 ?auto_209005 ) ) ( HOLDING ?auto_209003 ) ( CLEAR ?auto_209002 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209002 ?auto_209003 )
      ( MAKE-3PILE ?auto_209002 ?auto_209003 ?auto_209004 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209006 - BLOCK
      ?auto_209007 - BLOCK
      ?auto_209008 - BLOCK
    )
    :vars
    (
      ?auto_209009 - BLOCK
      ?auto_209011 - BLOCK
      ?auto_209012 - BLOCK
      ?auto_209010 - BLOCK
      ?auto_209014 - BLOCK
      ?auto_209013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209006 ) ( not ( = ?auto_209006 ?auto_209007 ) ) ( not ( = ?auto_209006 ?auto_209008 ) ) ( not ( = ?auto_209007 ?auto_209008 ) ) ( ON ?auto_209008 ?auto_209009 ) ( not ( = ?auto_209006 ?auto_209009 ) ) ( not ( = ?auto_209007 ?auto_209009 ) ) ( not ( = ?auto_209008 ?auto_209009 ) ) ( CLEAR ?auto_209006 ) ( ON ?auto_209007 ?auto_209008 ) ( CLEAR ?auto_209007 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209011 ) ( ON ?auto_209012 ?auto_209011 ) ( ON ?auto_209010 ?auto_209012 ) ( ON ?auto_209014 ?auto_209010 ) ( ON ?auto_209013 ?auto_209014 ) ( ON ?auto_209009 ?auto_209013 ) ( not ( = ?auto_209011 ?auto_209012 ) ) ( not ( = ?auto_209011 ?auto_209010 ) ) ( not ( = ?auto_209011 ?auto_209014 ) ) ( not ( = ?auto_209011 ?auto_209013 ) ) ( not ( = ?auto_209011 ?auto_209009 ) ) ( not ( = ?auto_209011 ?auto_209008 ) ) ( not ( = ?auto_209011 ?auto_209007 ) ) ( not ( = ?auto_209012 ?auto_209010 ) ) ( not ( = ?auto_209012 ?auto_209014 ) ) ( not ( = ?auto_209012 ?auto_209013 ) ) ( not ( = ?auto_209012 ?auto_209009 ) ) ( not ( = ?auto_209012 ?auto_209008 ) ) ( not ( = ?auto_209012 ?auto_209007 ) ) ( not ( = ?auto_209010 ?auto_209014 ) ) ( not ( = ?auto_209010 ?auto_209013 ) ) ( not ( = ?auto_209010 ?auto_209009 ) ) ( not ( = ?auto_209010 ?auto_209008 ) ) ( not ( = ?auto_209010 ?auto_209007 ) ) ( not ( = ?auto_209014 ?auto_209013 ) ) ( not ( = ?auto_209014 ?auto_209009 ) ) ( not ( = ?auto_209014 ?auto_209008 ) ) ( not ( = ?auto_209014 ?auto_209007 ) ) ( not ( = ?auto_209013 ?auto_209009 ) ) ( not ( = ?auto_209013 ?auto_209008 ) ) ( not ( = ?auto_209013 ?auto_209007 ) ) ( not ( = ?auto_209006 ?auto_209011 ) ) ( not ( = ?auto_209006 ?auto_209012 ) ) ( not ( = ?auto_209006 ?auto_209010 ) ) ( not ( = ?auto_209006 ?auto_209014 ) ) ( not ( = ?auto_209006 ?auto_209013 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209011 ?auto_209012 ?auto_209010 ?auto_209014 ?auto_209013 ?auto_209009 ?auto_209008 )
      ( MAKE-3PILE ?auto_209006 ?auto_209007 ?auto_209008 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209015 - BLOCK
      ?auto_209016 - BLOCK
      ?auto_209017 - BLOCK
    )
    :vars
    (
      ?auto_209021 - BLOCK
      ?auto_209018 - BLOCK
      ?auto_209020 - BLOCK
      ?auto_209022 - BLOCK
      ?auto_209023 - BLOCK
      ?auto_209019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_209015 ?auto_209016 ) ) ( not ( = ?auto_209015 ?auto_209017 ) ) ( not ( = ?auto_209016 ?auto_209017 ) ) ( ON ?auto_209017 ?auto_209021 ) ( not ( = ?auto_209015 ?auto_209021 ) ) ( not ( = ?auto_209016 ?auto_209021 ) ) ( not ( = ?auto_209017 ?auto_209021 ) ) ( ON ?auto_209016 ?auto_209017 ) ( CLEAR ?auto_209016 ) ( ON-TABLE ?auto_209018 ) ( ON ?auto_209020 ?auto_209018 ) ( ON ?auto_209022 ?auto_209020 ) ( ON ?auto_209023 ?auto_209022 ) ( ON ?auto_209019 ?auto_209023 ) ( ON ?auto_209021 ?auto_209019 ) ( not ( = ?auto_209018 ?auto_209020 ) ) ( not ( = ?auto_209018 ?auto_209022 ) ) ( not ( = ?auto_209018 ?auto_209023 ) ) ( not ( = ?auto_209018 ?auto_209019 ) ) ( not ( = ?auto_209018 ?auto_209021 ) ) ( not ( = ?auto_209018 ?auto_209017 ) ) ( not ( = ?auto_209018 ?auto_209016 ) ) ( not ( = ?auto_209020 ?auto_209022 ) ) ( not ( = ?auto_209020 ?auto_209023 ) ) ( not ( = ?auto_209020 ?auto_209019 ) ) ( not ( = ?auto_209020 ?auto_209021 ) ) ( not ( = ?auto_209020 ?auto_209017 ) ) ( not ( = ?auto_209020 ?auto_209016 ) ) ( not ( = ?auto_209022 ?auto_209023 ) ) ( not ( = ?auto_209022 ?auto_209019 ) ) ( not ( = ?auto_209022 ?auto_209021 ) ) ( not ( = ?auto_209022 ?auto_209017 ) ) ( not ( = ?auto_209022 ?auto_209016 ) ) ( not ( = ?auto_209023 ?auto_209019 ) ) ( not ( = ?auto_209023 ?auto_209021 ) ) ( not ( = ?auto_209023 ?auto_209017 ) ) ( not ( = ?auto_209023 ?auto_209016 ) ) ( not ( = ?auto_209019 ?auto_209021 ) ) ( not ( = ?auto_209019 ?auto_209017 ) ) ( not ( = ?auto_209019 ?auto_209016 ) ) ( not ( = ?auto_209015 ?auto_209018 ) ) ( not ( = ?auto_209015 ?auto_209020 ) ) ( not ( = ?auto_209015 ?auto_209022 ) ) ( not ( = ?auto_209015 ?auto_209023 ) ) ( not ( = ?auto_209015 ?auto_209019 ) ) ( HOLDING ?auto_209015 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209015 )
      ( MAKE-3PILE ?auto_209015 ?auto_209016 ?auto_209017 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209024 - BLOCK
      ?auto_209025 - BLOCK
      ?auto_209026 - BLOCK
    )
    :vars
    (
      ?auto_209029 - BLOCK
      ?auto_209032 - BLOCK
      ?auto_209028 - BLOCK
      ?auto_209027 - BLOCK
      ?auto_209031 - BLOCK
      ?auto_209030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_209024 ?auto_209025 ) ) ( not ( = ?auto_209024 ?auto_209026 ) ) ( not ( = ?auto_209025 ?auto_209026 ) ) ( ON ?auto_209026 ?auto_209029 ) ( not ( = ?auto_209024 ?auto_209029 ) ) ( not ( = ?auto_209025 ?auto_209029 ) ) ( not ( = ?auto_209026 ?auto_209029 ) ) ( ON ?auto_209025 ?auto_209026 ) ( ON-TABLE ?auto_209032 ) ( ON ?auto_209028 ?auto_209032 ) ( ON ?auto_209027 ?auto_209028 ) ( ON ?auto_209031 ?auto_209027 ) ( ON ?auto_209030 ?auto_209031 ) ( ON ?auto_209029 ?auto_209030 ) ( not ( = ?auto_209032 ?auto_209028 ) ) ( not ( = ?auto_209032 ?auto_209027 ) ) ( not ( = ?auto_209032 ?auto_209031 ) ) ( not ( = ?auto_209032 ?auto_209030 ) ) ( not ( = ?auto_209032 ?auto_209029 ) ) ( not ( = ?auto_209032 ?auto_209026 ) ) ( not ( = ?auto_209032 ?auto_209025 ) ) ( not ( = ?auto_209028 ?auto_209027 ) ) ( not ( = ?auto_209028 ?auto_209031 ) ) ( not ( = ?auto_209028 ?auto_209030 ) ) ( not ( = ?auto_209028 ?auto_209029 ) ) ( not ( = ?auto_209028 ?auto_209026 ) ) ( not ( = ?auto_209028 ?auto_209025 ) ) ( not ( = ?auto_209027 ?auto_209031 ) ) ( not ( = ?auto_209027 ?auto_209030 ) ) ( not ( = ?auto_209027 ?auto_209029 ) ) ( not ( = ?auto_209027 ?auto_209026 ) ) ( not ( = ?auto_209027 ?auto_209025 ) ) ( not ( = ?auto_209031 ?auto_209030 ) ) ( not ( = ?auto_209031 ?auto_209029 ) ) ( not ( = ?auto_209031 ?auto_209026 ) ) ( not ( = ?auto_209031 ?auto_209025 ) ) ( not ( = ?auto_209030 ?auto_209029 ) ) ( not ( = ?auto_209030 ?auto_209026 ) ) ( not ( = ?auto_209030 ?auto_209025 ) ) ( not ( = ?auto_209024 ?auto_209032 ) ) ( not ( = ?auto_209024 ?auto_209028 ) ) ( not ( = ?auto_209024 ?auto_209027 ) ) ( not ( = ?auto_209024 ?auto_209031 ) ) ( not ( = ?auto_209024 ?auto_209030 ) ) ( ON ?auto_209024 ?auto_209025 ) ( CLEAR ?auto_209024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_209032 ?auto_209028 ?auto_209027 ?auto_209031 ?auto_209030 ?auto_209029 ?auto_209026 ?auto_209025 )
      ( MAKE-3PILE ?auto_209024 ?auto_209025 ?auto_209026 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209038 - BLOCK
      ?auto_209039 - BLOCK
      ?auto_209040 - BLOCK
      ?auto_209041 - BLOCK
      ?auto_209042 - BLOCK
    )
    :vars
    (
      ?auto_209043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209043 ?auto_209042 ) ( CLEAR ?auto_209043 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209038 ) ( ON ?auto_209039 ?auto_209038 ) ( ON ?auto_209040 ?auto_209039 ) ( ON ?auto_209041 ?auto_209040 ) ( ON ?auto_209042 ?auto_209041 ) ( not ( = ?auto_209038 ?auto_209039 ) ) ( not ( = ?auto_209038 ?auto_209040 ) ) ( not ( = ?auto_209038 ?auto_209041 ) ) ( not ( = ?auto_209038 ?auto_209042 ) ) ( not ( = ?auto_209038 ?auto_209043 ) ) ( not ( = ?auto_209039 ?auto_209040 ) ) ( not ( = ?auto_209039 ?auto_209041 ) ) ( not ( = ?auto_209039 ?auto_209042 ) ) ( not ( = ?auto_209039 ?auto_209043 ) ) ( not ( = ?auto_209040 ?auto_209041 ) ) ( not ( = ?auto_209040 ?auto_209042 ) ) ( not ( = ?auto_209040 ?auto_209043 ) ) ( not ( = ?auto_209041 ?auto_209042 ) ) ( not ( = ?auto_209041 ?auto_209043 ) ) ( not ( = ?auto_209042 ?auto_209043 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209043 ?auto_209042 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209044 - BLOCK
      ?auto_209045 - BLOCK
      ?auto_209046 - BLOCK
      ?auto_209047 - BLOCK
      ?auto_209048 - BLOCK
    )
    :vars
    (
      ?auto_209049 - BLOCK
      ?auto_209050 - BLOCK
      ?auto_209051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209049 ?auto_209048 ) ( CLEAR ?auto_209049 ) ( ON-TABLE ?auto_209044 ) ( ON ?auto_209045 ?auto_209044 ) ( ON ?auto_209046 ?auto_209045 ) ( ON ?auto_209047 ?auto_209046 ) ( ON ?auto_209048 ?auto_209047 ) ( not ( = ?auto_209044 ?auto_209045 ) ) ( not ( = ?auto_209044 ?auto_209046 ) ) ( not ( = ?auto_209044 ?auto_209047 ) ) ( not ( = ?auto_209044 ?auto_209048 ) ) ( not ( = ?auto_209044 ?auto_209049 ) ) ( not ( = ?auto_209045 ?auto_209046 ) ) ( not ( = ?auto_209045 ?auto_209047 ) ) ( not ( = ?auto_209045 ?auto_209048 ) ) ( not ( = ?auto_209045 ?auto_209049 ) ) ( not ( = ?auto_209046 ?auto_209047 ) ) ( not ( = ?auto_209046 ?auto_209048 ) ) ( not ( = ?auto_209046 ?auto_209049 ) ) ( not ( = ?auto_209047 ?auto_209048 ) ) ( not ( = ?auto_209047 ?auto_209049 ) ) ( not ( = ?auto_209048 ?auto_209049 ) ) ( HOLDING ?auto_209050 ) ( CLEAR ?auto_209051 ) ( not ( = ?auto_209044 ?auto_209050 ) ) ( not ( = ?auto_209044 ?auto_209051 ) ) ( not ( = ?auto_209045 ?auto_209050 ) ) ( not ( = ?auto_209045 ?auto_209051 ) ) ( not ( = ?auto_209046 ?auto_209050 ) ) ( not ( = ?auto_209046 ?auto_209051 ) ) ( not ( = ?auto_209047 ?auto_209050 ) ) ( not ( = ?auto_209047 ?auto_209051 ) ) ( not ( = ?auto_209048 ?auto_209050 ) ) ( not ( = ?auto_209048 ?auto_209051 ) ) ( not ( = ?auto_209049 ?auto_209050 ) ) ( not ( = ?auto_209049 ?auto_209051 ) ) ( not ( = ?auto_209050 ?auto_209051 ) ) )
    :subtasks
    ( ( !STACK ?auto_209050 ?auto_209051 )
      ( MAKE-5PILE ?auto_209044 ?auto_209045 ?auto_209046 ?auto_209047 ?auto_209048 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209052 - BLOCK
      ?auto_209053 - BLOCK
      ?auto_209054 - BLOCK
      ?auto_209055 - BLOCK
      ?auto_209056 - BLOCK
    )
    :vars
    (
      ?auto_209058 - BLOCK
      ?auto_209059 - BLOCK
      ?auto_209057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209058 ?auto_209056 ) ( ON-TABLE ?auto_209052 ) ( ON ?auto_209053 ?auto_209052 ) ( ON ?auto_209054 ?auto_209053 ) ( ON ?auto_209055 ?auto_209054 ) ( ON ?auto_209056 ?auto_209055 ) ( not ( = ?auto_209052 ?auto_209053 ) ) ( not ( = ?auto_209052 ?auto_209054 ) ) ( not ( = ?auto_209052 ?auto_209055 ) ) ( not ( = ?auto_209052 ?auto_209056 ) ) ( not ( = ?auto_209052 ?auto_209058 ) ) ( not ( = ?auto_209053 ?auto_209054 ) ) ( not ( = ?auto_209053 ?auto_209055 ) ) ( not ( = ?auto_209053 ?auto_209056 ) ) ( not ( = ?auto_209053 ?auto_209058 ) ) ( not ( = ?auto_209054 ?auto_209055 ) ) ( not ( = ?auto_209054 ?auto_209056 ) ) ( not ( = ?auto_209054 ?auto_209058 ) ) ( not ( = ?auto_209055 ?auto_209056 ) ) ( not ( = ?auto_209055 ?auto_209058 ) ) ( not ( = ?auto_209056 ?auto_209058 ) ) ( CLEAR ?auto_209059 ) ( not ( = ?auto_209052 ?auto_209057 ) ) ( not ( = ?auto_209052 ?auto_209059 ) ) ( not ( = ?auto_209053 ?auto_209057 ) ) ( not ( = ?auto_209053 ?auto_209059 ) ) ( not ( = ?auto_209054 ?auto_209057 ) ) ( not ( = ?auto_209054 ?auto_209059 ) ) ( not ( = ?auto_209055 ?auto_209057 ) ) ( not ( = ?auto_209055 ?auto_209059 ) ) ( not ( = ?auto_209056 ?auto_209057 ) ) ( not ( = ?auto_209056 ?auto_209059 ) ) ( not ( = ?auto_209058 ?auto_209057 ) ) ( not ( = ?auto_209058 ?auto_209059 ) ) ( not ( = ?auto_209057 ?auto_209059 ) ) ( ON ?auto_209057 ?auto_209058 ) ( CLEAR ?auto_209057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209052 ?auto_209053 ?auto_209054 ?auto_209055 ?auto_209056 ?auto_209058 )
      ( MAKE-5PILE ?auto_209052 ?auto_209053 ?auto_209054 ?auto_209055 ?auto_209056 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209060 - BLOCK
      ?auto_209061 - BLOCK
      ?auto_209062 - BLOCK
      ?auto_209063 - BLOCK
      ?auto_209064 - BLOCK
    )
    :vars
    (
      ?auto_209065 - BLOCK
      ?auto_209066 - BLOCK
      ?auto_209067 - BLOCK
      ?auto_209068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209065 ?auto_209064 ) ( ON-TABLE ?auto_209060 ) ( ON ?auto_209061 ?auto_209060 ) ( ON ?auto_209062 ?auto_209061 ) ( ON ?auto_209063 ?auto_209062 ) ( ON ?auto_209064 ?auto_209063 ) ( not ( = ?auto_209060 ?auto_209061 ) ) ( not ( = ?auto_209060 ?auto_209062 ) ) ( not ( = ?auto_209060 ?auto_209063 ) ) ( not ( = ?auto_209060 ?auto_209064 ) ) ( not ( = ?auto_209060 ?auto_209065 ) ) ( not ( = ?auto_209061 ?auto_209062 ) ) ( not ( = ?auto_209061 ?auto_209063 ) ) ( not ( = ?auto_209061 ?auto_209064 ) ) ( not ( = ?auto_209061 ?auto_209065 ) ) ( not ( = ?auto_209062 ?auto_209063 ) ) ( not ( = ?auto_209062 ?auto_209064 ) ) ( not ( = ?auto_209062 ?auto_209065 ) ) ( not ( = ?auto_209063 ?auto_209064 ) ) ( not ( = ?auto_209063 ?auto_209065 ) ) ( not ( = ?auto_209064 ?auto_209065 ) ) ( not ( = ?auto_209060 ?auto_209066 ) ) ( not ( = ?auto_209060 ?auto_209067 ) ) ( not ( = ?auto_209061 ?auto_209066 ) ) ( not ( = ?auto_209061 ?auto_209067 ) ) ( not ( = ?auto_209062 ?auto_209066 ) ) ( not ( = ?auto_209062 ?auto_209067 ) ) ( not ( = ?auto_209063 ?auto_209066 ) ) ( not ( = ?auto_209063 ?auto_209067 ) ) ( not ( = ?auto_209064 ?auto_209066 ) ) ( not ( = ?auto_209064 ?auto_209067 ) ) ( not ( = ?auto_209065 ?auto_209066 ) ) ( not ( = ?auto_209065 ?auto_209067 ) ) ( not ( = ?auto_209066 ?auto_209067 ) ) ( ON ?auto_209066 ?auto_209065 ) ( CLEAR ?auto_209066 ) ( HOLDING ?auto_209067 ) ( CLEAR ?auto_209068 ) ( ON-TABLE ?auto_209068 ) ( not ( = ?auto_209068 ?auto_209067 ) ) ( not ( = ?auto_209060 ?auto_209068 ) ) ( not ( = ?auto_209061 ?auto_209068 ) ) ( not ( = ?auto_209062 ?auto_209068 ) ) ( not ( = ?auto_209063 ?auto_209068 ) ) ( not ( = ?auto_209064 ?auto_209068 ) ) ( not ( = ?auto_209065 ?auto_209068 ) ) ( not ( = ?auto_209066 ?auto_209068 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209068 ?auto_209067 )
      ( MAKE-5PILE ?auto_209060 ?auto_209061 ?auto_209062 ?auto_209063 ?auto_209064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209069 - BLOCK
      ?auto_209070 - BLOCK
      ?auto_209071 - BLOCK
      ?auto_209072 - BLOCK
      ?auto_209073 - BLOCK
    )
    :vars
    (
      ?auto_209075 - BLOCK
      ?auto_209076 - BLOCK
      ?auto_209074 - BLOCK
      ?auto_209077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209075 ?auto_209073 ) ( ON-TABLE ?auto_209069 ) ( ON ?auto_209070 ?auto_209069 ) ( ON ?auto_209071 ?auto_209070 ) ( ON ?auto_209072 ?auto_209071 ) ( ON ?auto_209073 ?auto_209072 ) ( not ( = ?auto_209069 ?auto_209070 ) ) ( not ( = ?auto_209069 ?auto_209071 ) ) ( not ( = ?auto_209069 ?auto_209072 ) ) ( not ( = ?auto_209069 ?auto_209073 ) ) ( not ( = ?auto_209069 ?auto_209075 ) ) ( not ( = ?auto_209070 ?auto_209071 ) ) ( not ( = ?auto_209070 ?auto_209072 ) ) ( not ( = ?auto_209070 ?auto_209073 ) ) ( not ( = ?auto_209070 ?auto_209075 ) ) ( not ( = ?auto_209071 ?auto_209072 ) ) ( not ( = ?auto_209071 ?auto_209073 ) ) ( not ( = ?auto_209071 ?auto_209075 ) ) ( not ( = ?auto_209072 ?auto_209073 ) ) ( not ( = ?auto_209072 ?auto_209075 ) ) ( not ( = ?auto_209073 ?auto_209075 ) ) ( not ( = ?auto_209069 ?auto_209076 ) ) ( not ( = ?auto_209069 ?auto_209074 ) ) ( not ( = ?auto_209070 ?auto_209076 ) ) ( not ( = ?auto_209070 ?auto_209074 ) ) ( not ( = ?auto_209071 ?auto_209076 ) ) ( not ( = ?auto_209071 ?auto_209074 ) ) ( not ( = ?auto_209072 ?auto_209076 ) ) ( not ( = ?auto_209072 ?auto_209074 ) ) ( not ( = ?auto_209073 ?auto_209076 ) ) ( not ( = ?auto_209073 ?auto_209074 ) ) ( not ( = ?auto_209075 ?auto_209076 ) ) ( not ( = ?auto_209075 ?auto_209074 ) ) ( not ( = ?auto_209076 ?auto_209074 ) ) ( ON ?auto_209076 ?auto_209075 ) ( CLEAR ?auto_209077 ) ( ON-TABLE ?auto_209077 ) ( not ( = ?auto_209077 ?auto_209074 ) ) ( not ( = ?auto_209069 ?auto_209077 ) ) ( not ( = ?auto_209070 ?auto_209077 ) ) ( not ( = ?auto_209071 ?auto_209077 ) ) ( not ( = ?auto_209072 ?auto_209077 ) ) ( not ( = ?auto_209073 ?auto_209077 ) ) ( not ( = ?auto_209075 ?auto_209077 ) ) ( not ( = ?auto_209076 ?auto_209077 ) ) ( ON ?auto_209074 ?auto_209076 ) ( CLEAR ?auto_209074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209069 ?auto_209070 ?auto_209071 ?auto_209072 ?auto_209073 ?auto_209075 ?auto_209076 )
      ( MAKE-5PILE ?auto_209069 ?auto_209070 ?auto_209071 ?auto_209072 ?auto_209073 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209078 - BLOCK
      ?auto_209079 - BLOCK
      ?auto_209080 - BLOCK
      ?auto_209081 - BLOCK
      ?auto_209082 - BLOCK
    )
    :vars
    (
      ?auto_209086 - BLOCK
      ?auto_209083 - BLOCK
      ?auto_209085 - BLOCK
      ?auto_209084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209086 ?auto_209082 ) ( ON-TABLE ?auto_209078 ) ( ON ?auto_209079 ?auto_209078 ) ( ON ?auto_209080 ?auto_209079 ) ( ON ?auto_209081 ?auto_209080 ) ( ON ?auto_209082 ?auto_209081 ) ( not ( = ?auto_209078 ?auto_209079 ) ) ( not ( = ?auto_209078 ?auto_209080 ) ) ( not ( = ?auto_209078 ?auto_209081 ) ) ( not ( = ?auto_209078 ?auto_209082 ) ) ( not ( = ?auto_209078 ?auto_209086 ) ) ( not ( = ?auto_209079 ?auto_209080 ) ) ( not ( = ?auto_209079 ?auto_209081 ) ) ( not ( = ?auto_209079 ?auto_209082 ) ) ( not ( = ?auto_209079 ?auto_209086 ) ) ( not ( = ?auto_209080 ?auto_209081 ) ) ( not ( = ?auto_209080 ?auto_209082 ) ) ( not ( = ?auto_209080 ?auto_209086 ) ) ( not ( = ?auto_209081 ?auto_209082 ) ) ( not ( = ?auto_209081 ?auto_209086 ) ) ( not ( = ?auto_209082 ?auto_209086 ) ) ( not ( = ?auto_209078 ?auto_209083 ) ) ( not ( = ?auto_209078 ?auto_209085 ) ) ( not ( = ?auto_209079 ?auto_209083 ) ) ( not ( = ?auto_209079 ?auto_209085 ) ) ( not ( = ?auto_209080 ?auto_209083 ) ) ( not ( = ?auto_209080 ?auto_209085 ) ) ( not ( = ?auto_209081 ?auto_209083 ) ) ( not ( = ?auto_209081 ?auto_209085 ) ) ( not ( = ?auto_209082 ?auto_209083 ) ) ( not ( = ?auto_209082 ?auto_209085 ) ) ( not ( = ?auto_209086 ?auto_209083 ) ) ( not ( = ?auto_209086 ?auto_209085 ) ) ( not ( = ?auto_209083 ?auto_209085 ) ) ( ON ?auto_209083 ?auto_209086 ) ( not ( = ?auto_209084 ?auto_209085 ) ) ( not ( = ?auto_209078 ?auto_209084 ) ) ( not ( = ?auto_209079 ?auto_209084 ) ) ( not ( = ?auto_209080 ?auto_209084 ) ) ( not ( = ?auto_209081 ?auto_209084 ) ) ( not ( = ?auto_209082 ?auto_209084 ) ) ( not ( = ?auto_209086 ?auto_209084 ) ) ( not ( = ?auto_209083 ?auto_209084 ) ) ( ON ?auto_209085 ?auto_209083 ) ( CLEAR ?auto_209085 ) ( HOLDING ?auto_209084 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209084 )
      ( MAKE-5PILE ?auto_209078 ?auto_209079 ?auto_209080 ?auto_209081 ?auto_209082 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209087 - BLOCK
      ?auto_209088 - BLOCK
      ?auto_209089 - BLOCK
      ?auto_209090 - BLOCK
      ?auto_209091 - BLOCK
    )
    :vars
    (
      ?auto_209094 - BLOCK
      ?auto_209092 - BLOCK
      ?auto_209095 - BLOCK
      ?auto_209093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209094 ?auto_209091 ) ( ON-TABLE ?auto_209087 ) ( ON ?auto_209088 ?auto_209087 ) ( ON ?auto_209089 ?auto_209088 ) ( ON ?auto_209090 ?auto_209089 ) ( ON ?auto_209091 ?auto_209090 ) ( not ( = ?auto_209087 ?auto_209088 ) ) ( not ( = ?auto_209087 ?auto_209089 ) ) ( not ( = ?auto_209087 ?auto_209090 ) ) ( not ( = ?auto_209087 ?auto_209091 ) ) ( not ( = ?auto_209087 ?auto_209094 ) ) ( not ( = ?auto_209088 ?auto_209089 ) ) ( not ( = ?auto_209088 ?auto_209090 ) ) ( not ( = ?auto_209088 ?auto_209091 ) ) ( not ( = ?auto_209088 ?auto_209094 ) ) ( not ( = ?auto_209089 ?auto_209090 ) ) ( not ( = ?auto_209089 ?auto_209091 ) ) ( not ( = ?auto_209089 ?auto_209094 ) ) ( not ( = ?auto_209090 ?auto_209091 ) ) ( not ( = ?auto_209090 ?auto_209094 ) ) ( not ( = ?auto_209091 ?auto_209094 ) ) ( not ( = ?auto_209087 ?auto_209092 ) ) ( not ( = ?auto_209087 ?auto_209095 ) ) ( not ( = ?auto_209088 ?auto_209092 ) ) ( not ( = ?auto_209088 ?auto_209095 ) ) ( not ( = ?auto_209089 ?auto_209092 ) ) ( not ( = ?auto_209089 ?auto_209095 ) ) ( not ( = ?auto_209090 ?auto_209092 ) ) ( not ( = ?auto_209090 ?auto_209095 ) ) ( not ( = ?auto_209091 ?auto_209092 ) ) ( not ( = ?auto_209091 ?auto_209095 ) ) ( not ( = ?auto_209094 ?auto_209092 ) ) ( not ( = ?auto_209094 ?auto_209095 ) ) ( not ( = ?auto_209092 ?auto_209095 ) ) ( ON ?auto_209092 ?auto_209094 ) ( not ( = ?auto_209093 ?auto_209095 ) ) ( not ( = ?auto_209087 ?auto_209093 ) ) ( not ( = ?auto_209088 ?auto_209093 ) ) ( not ( = ?auto_209089 ?auto_209093 ) ) ( not ( = ?auto_209090 ?auto_209093 ) ) ( not ( = ?auto_209091 ?auto_209093 ) ) ( not ( = ?auto_209094 ?auto_209093 ) ) ( not ( = ?auto_209092 ?auto_209093 ) ) ( ON ?auto_209095 ?auto_209092 ) ( ON ?auto_209093 ?auto_209095 ) ( CLEAR ?auto_209093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_209087 ?auto_209088 ?auto_209089 ?auto_209090 ?auto_209091 ?auto_209094 ?auto_209092 ?auto_209095 )
      ( MAKE-5PILE ?auto_209087 ?auto_209088 ?auto_209089 ?auto_209090 ?auto_209091 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209100 - BLOCK
      ?auto_209101 - BLOCK
      ?auto_209102 - BLOCK
      ?auto_209103 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_209103 ) ( CLEAR ?auto_209102 ) ( ON-TABLE ?auto_209100 ) ( ON ?auto_209101 ?auto_209100 ) ( ON ?auto_209102 ?auto_209101 ) ( not ( = ?auto_209100 ?auto_209101 ) ) ( not ( = ?auto_209100 ?auto_209102 ) ) ( not ( = ?auto_209100 ?auto_209103 ) ) ( not ( = ?auto_209101 ?auto_209102 ) ) ( not ( = ?auto_209101 ?auto_209103 ) ) ( not ( = ?auto_209102 ?auto_209103 ) ) )
    :subtasks
    ( ( !STACK ?auto_209103 ?auto_209102 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209104 - BLOCK
      ?auto_209105 - BLOCK
      ?auto_209106 - BLOCK
      ?auto_209107 - BLOCK
    )
    :vars
    (
      ?auto_209108 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_209106 ) ( ON-TABLE ?auto_209104 ) ( ON ?auto_209105 ?auto_209104 ) ( ON ?auto_209106 ?auto_209105 ) ( not ( = ?auto_209104 ?auto_209105 ) ) ( not ( = ?auto_209104 ?auto_209106 ) ) ( not ( = ?auto_209104 ?auto_209107 ) ) ( not ( = ?auto_209105 ?auto_209106 ) ) ( not ( = ?auto_209105 ?auto_209107 ) ) ( not ( = ?auto_209106 ?auto_209107 ) ) ( ON ?auto_209107 ?auto_209108 ) ( CLEAR ?auto_209107 ) ( HAND-EMPTY ) ( not ( = ?auto_209104 ?auto_209108 ) ) ( not ( = ?auto_209105 ?auto_209108 ) ) ( not ( = ?auto_209106 ?auto_209108 ) ) ( not ( = ?auto_209107 ?auto_209108 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209107 ?auto_209108 )
      ( MAKE-4PILE ?auto_209104 ?auto_209105 ?auto_209106 ?auto_209107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209109 - BLOCK
      ?auto_209110 - BLOCK
      ?auto_209111 - BLOCK
      ?auto_209112 - BLOCK
    )
    :vars
    (
      ?auto_209113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209109 ) ( ON ?auto_209110 ?auto_209109 ) ( not ( = ?auto_209109 ?auto_209110 ) ) ( not ( = ?auto_209109 ?auto_209111 ) ) ( not ( = ?auto_209109 ?auto_209112 ) ) ( not ( = ?auto_209110 ?auto_209111 ) ) ( not ( = ?auto_209110 ?auto_209112 ) ) ( not ( = ?auto_209111 ?auto_209112 ) ) ( ON ?auto_209112 ?auto_209113 ) ( CLEAR ?auto_209112 ) ( not ( = ?auto_209109 ?auto_209113 ) ) ( not ( = ?auto_209110 ?auto_209113 ) ) ( not ( = ?auto_209111 ?auto_209113 ) ) ( not ( = ?auto_209112 ?auto_209113 ) ) ( HOLDING ?auto_209111 ) ( CLEAR ?auto_209110 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209109 ?auto_209110 ?auto_209111 )
      ( MAKE-4PILE ?auto_209109 ?auto_209110 ?auto_209111 ?auto_209112 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209114 - BLOCK
      ?auto_209115 - BLOCK
      ?auto_209116 - BLOCK
      ?auto_209117 - BLOCK
    )
    :vars
    (
      ?auto_209118 - BLOCK
      ?auto_209119 - BLOCK
      ?auto_209121 - BLOCK
      ?auto_209122 - BLOCK
      ?auto_209120 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209114 ) ( ON ?auto_209115 ?auto_209114 ) ( not ( = ?auto_209114 ?auto_209115 ) ) ( not ( = ?auto_209114 ?auto_209116 ) ) ( not ( = ?auto_209114 ?auto_209117 ) ) ( not ( = ?auto_209115 ?auto_209116 ) ) ( not ( = ?auto_209115 ?auto_209117 ) ) ( not ( = ?auto_209116 ?auto_209117 ) ) ( ON ?auto_209117 ?auto_209118 ) ( not ( = ?auto_209114 ?auto_209118 ) ) ( not ( = ?auto_209115 ?auto_209118 ) ) ( not ( = ?auto_209116 ?auto_209118 ) ) ( not ( = ?auto_209117 ?auto_209118 ) ) ( CLEAR ?auto_209115 ) ( ON ?auto_209116 ?auto_209117 ) ( CLEAR ?auto_209116 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209119 ) ( ON ?auto_209121 ?auto_209119 ) ( ON ?auto_209122 ?auto_209121 ) ( ON ?auto_209120 ?auto_209122 ) ( ON ?auto_209118 ?auto_209120 ) ( not ( = ?auto_209119 ?auto_209121 ) ) ( not ( = ?auto_209119 ?auto_209122 ) ) ( not ( = ?auto_209119 ?auto_209120 ) ) ( not ( = ?auto_209119 ?auto_209118 ) ) ( not ( = ?auto_209119 ?auto_209117 ) ) ( not ( = ?auto_209119 ?auto_209116 ) ) ( not ( = ?auto_209121 ?auto_209122 ) ) ( not ( = ?auto_209121 ?auto_209120 ) ) ( not ( = ?auto_209121 ?auto_209118 ) ) ( not ( = ?auto_209121 ?auto_209117 ) ) ( not ( = ?auto_209121 ?auto_209116 ) ) ( not ( = ?auto_209122 ?auto_209120 ) ) ( not ( = ?auto_209122 ?auto_209118 ) ) ( not ( = ?auto_209122 ?auto_209117 ) ) ( not ( = ?auto_209122 ?auto_209116 ) ) ( not ( = ?auto_209120 ?auto_209118 ) ) ( not ( = ?auto_209120 ?auto_209117 ) ) ( not ( = ?auto_209120 ?auto_209116 ) ) ( not ( = ?auto_209114 ?auto_209119 ) ) ( not ( = ?auto_209114 ?auto_209121 ) ) ( not ( = ?auto_209114 ?auto_209122 ) ) ( not ( = ?auto_209114 ?auto_209120 ) ) ( not ( = ?auto_209115 ?auto_209119 ) ) ( not ( = ?auto_209115 ?auto_209121 ) ) ( not ( = ?auto_209115 ?auto_209122 ) ) ( not ( = ?auto_209115 ?auto_209120 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209119 ?auto_209121 ?auto_209122 ?auto_209120 ?auto_209118 ?auto_209117 )
      ( MAKE-4PILE ?auto_209114 ?auto_209115 ?auto_209116 ?auto_209117 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209123 - BLOCK
      ?auto_209124 - BLOCK
      ?auto_209125 - BLOCK
      ?auto_209126 - BLOCK
    )
    :vars
    (
      ?auto_209129 - BLOCK
      ?auto_209130 - BLOCK
      ?auto_209131 - BLOCK
      ?auto_209127 - BLOCK
      ?auto_209128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209123 ) ( not ( = ?auto_209123 ?auto_209124 ) ) ( not ( = ?auto_209123 ?auto_209125 ) ) ( not ( = ?auto_209123 ?auto_209126 ) ) ( not ( = ?auto_209124 ?auto_209125 ) ) ( not ( = ?auto_209124 ?auto_209126 ) ) ( not ( = ?auto_209125 ?auto_209126 ) ) ( ON ?auto_209126 ?auto_209129 ) ( not ( = ?auto_209123 ?auto_209129 ) ) ( not ( = ?auto_209124 ?auto_209129 ) ) ( not ( = ?auto_209125 ?auto_209129 ) ) ( not ( = ?auto_209126 ?auto_209129 ) ) ( ON ?auto_209125 ?auto_209126 ) ( CLEAR ?auto_209125 ) ( ON-TABLE ?auto_209130 ) ( ON ?auto_209131 ?auto_209130 ) ( ON ?auto_209127 ?auto_209131 ) ( ON ?auto_209128 ?auto_209127 ) ( ON ?auto_209129 ?auto_209128 ) ( not ( = ?auto_209130 ?auto_209131 ) ) ( not ( = ?auto_209130 ?auto_209127 ) ) ( not ( = ?auto_209130 ?auto_209128 ) ) ( not ( = ?auto_209130 ?auto_209129 ) ) ( not ( = ?auto_209130 ?auto_209126 ) ) ( not ( = ?auto_209130 ?auto_209125 ) ) ( not ( = ?auto_209131 ?auto_209127 ) ) ( not ( = ?auto_209131 ?auto_209128 ) ) ( not ( = ?auto_209131 ?auto_209129 ) ) ( not ( = ?auto_209131 ?auto_209126 ) ) ( not ( = ?auto_209131 ?auto_209125 ) ) ( not ( = ?auto_209127 ?auto_209128 ) ) ( not ( = ?auto_209127 ?auto_209129 ) ) ( not ( = ?auto_209127 ?auto_209126 ) ) ( not ( = ?auto_209127 ?auto_209125 ) ) ( not ( = ?auto_209128 ?auto_209129 ) ) ( not ( = ?auto_209128 ?auto_209126 ) ) ( not ( = ?auto_209128 ?auto_209125 ) ) ( not ( = ?auto_209123 ?auto_209130 ) ) ( not ( = ?auto_209123 ?auto_209131 ) ) ( not ( = ?auto_209123 ?auto_209127 ) ) ( not ( = ?auto_209123 ?auto_209128 ) ) ( not ( = ?auto_209124 ?auto_209130 ) ) ( not ( = ?auto_209124 ?auto_209131 ) ) ( not ( = ?auto_209124 ?auto_209127 ) ) ( not ( = ?auto_209124 ?auto_209128 ) ) ( HOLDING ?auto_209124 ) ( CLEAR ?auto_209123 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209123 ?auto_209124 )
      ( MAKE-4PILE ?auto_209123 ?auto_209124 ?auto_209125 ?auto_209126 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209132 - BLOCK
      ?auto_209133 - BLOCK
      ?auto_209134 - BLOCK
      ?auto_209135 - BLOCK
    )
    :vars
    (
      ?auto_209140 - BLOCK
      ?auto_209137 - BLOCK
      ?auto_209138 - BLOCK
      ?auto_209136 - BLOCK
      ?auto_209139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209132 ) ( not ( = ?auto_209132 ?auto_209133 ) ) ( not ( = ?auto_209132 ?auto_209134 ) ) ( not ( = ?auto_209132 ?auto_209135 ) ) ( not ( = ?auto_209133 ?auto_209134 ) ) ( not ( = ?auto_209133 ?auto_209135 ) ) ( not ( = ?auto_209134 ?auto_209135 ) ) ( ON ?auto_209135 ?auto_209140 ) ( not ( = ?auto_209132 ?auto_209140 ) ) ( not ( = ?auto_209133 ?auto_209140 ) ) ( not ( = ?auto_209134 ?auto_209140 ) ) ( not ( = ?auto_209135 ?auto_209140 ) ) ( ON ?auto_209134 ?auto_209135 ) ( ON-TABLE ?auto_209137 ) ( ON ?auto_209138 ?auto_209137 ) ( ON ?auto_209136 ?auto_209138 ) ( ON ?auto_209139 ?auto_209136 ) ( ON ?auto_209140 ?auto_209139 ) ( not ( = ?auto_209137 ?auto_209138 ) ) ( not ( = ?auto_209137 ?auto_209136 ) ) ( not ( = ?auto_209137 ?auto_209139 ) ) ( not ( = ?auto_209137 ?auto_209140 ) ) ( not ( = ?auto_209137 ?auto_209135 ) ) ( not ( = ?auto_209137 ?auto_209134 ) ) ( not ( = ?auto_209138 ?auto_209136 ) ) ( not ( = ?auto_209138 ?auto_209139 ) ) ( not ( = ?auto_209138 ?auto_209140 ) ) ( not ( = ?auto_209138 ?auto_209135 ) ) ( not ( = ?auto_209138 ?auto_209134 ) ) ( not ( = ?auto_209136 ?auto_209139 ) ) ( not ( = ?auto_209136 ?auto_209140 ) ) ( not ( = ?auto_209136 ?auto_209135 ) ) ( not ( = ?auto_209136 ?auto_209134 ) ) ( not ( = ?auto_209139 ?auto_209140 ) ) ( not ( = ?auto_209139 ?auto_209135 ) ) ( not ( = ?auto_209139 ?auto_209134 ) ) ( not ( = ?auto_209132 ?auto_209137 ) ) ( not ( = ?auto_209132 ?auto_209138 ) ) ( not ( = ?auto_209132 ?auto_209136 ) ) ( not ( = ?auto_209132 ?auto_209139 ) ) ( not ( = ?auto_209133 ?auto_209137 ) ) ( not ( = ?auto_209133 ?auto_209138 ) ) ( not ( = ?auto_209133 ?auto_209136 ) ) ( not ( = ?auto_209133 ?auto_209139 ) ) ( CLEAR ?auto_209132 ) ( ON ?auto_209133 ?auto_209134 ) ( CLEAR ?auto_209133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209137 ?auto_209138 ?auto_209136 ?auto_209139 ?auto_209140 ?auto_209135 ?auto_209134 )
      ( MAKE-4PILE ?auto_209132 ?auto_209133 ?auto_209134 ?auto_209135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209141 - BLOCK
      ?auto_209142 - BLOCK
      ?auto_209143 - BLOCK
      ?auto_209144 - BLOCK
    )
    :vars
    (
      ?auto_209145 - BLOCK
      ?auto_209146 - BLOCK
      ?auto_209147 - BLOCK
      ?auto_209149 - BLOCK
      ?auto_209148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_209141 ?auto_209142 ) ) ( not ( = ?auto_209141 ?auto_209143 ) ) ( not ( = ?auto_209141 ?auto_209144 ) ) ( not ( = ?auto_209142 ?auto_209143 ) ) ( not ( = ?auto_209142 ?auto_209144 ) ) ( not ( = ?auto_209143 ?auto_209144 ) ) ( ON ?auto_209144 ?auto_209145 ) ( not ( = ?auto_209141 ?auto_209145 ) ) ( not ( = ?auto_209142 ?auto_209145 ) ) ( not ( = ?auto_209143 ?auto_209145 ) ) ( not ( = ?auto_209144 ?auto_209145 ) ) ( ON ?auto_209143 ?auto_209144 ) ( ON-TABLE ?auto_209146 ) ( ON ?auto_209147 ?auto_209146 ) ( ON ?auto_209149 ?auto_209147 ) ( ON ?auto_209148 ?auto_209149 ) ( ON ?auto_209145 ?auto_209148 ) ( not ( = ?auto_209146 ?auto_209147 ) ) ( not ( = ?auto_209146 ?auto_209149 ) ) ( not ( = ?auto_209146 ?auto_209148 ) ) ( not ( = ?auto_209146 ?auto_209145 ) ) ( not ( = ?auto_209146 ?auto_209144 ) ) ( not ( = ?auto_209146 ?auto_209143 ) ) ( not ( = ?auto_209147 ?auto_209149 ) ) ( not ( = ?auto_209147 ?auto_209148 ) ) ( not ( = ?auto_209147 ?auto_209145 ) ) ( not ( = ?auto_209147 ?auto_209144 ) ) ( not ( = ?auto_209147 ?auto_209143 ) ) ( not ( = ?auto_209149 ?auto_209148 ) ) ( not ( = ?auto_209149 ?auto_209145 ) ) ( not ( = ?auto_209149 ?auto_209144 ) ) ( not ( = ?auto_209149 ?auto_209143 ) ) ( not ( = ?auto_209148 ?auto_209145 ) ) ( not ( = ?auto_209148 ?auto_209144 ) ) ( not ( = ?auto_209148 ?auto_209143 ) ) ( not ( = ?auto_209141 ?auto_209146 ) ) ( not ( = ?auto_209141 ?auto_209147 ) ) ( not ( = ?auto_209141 ?auto_209149 ) ) ( not ( = ?auto_209141 ?auto_209148 ) ) ( not ( = ?auto_209142 ?auto_209146 ) ) ( not ( = ?auto_209142 ?auto_209147 ) ) ( not ( = ?auto_209142 ?auto_209149 ) ) ( not ( = ?auto_209142 ?auto_209148 ) ) ( ON ?auto_209142 ?auto_209143 ) ( CLEAR ?auto_209142 ) ( HOLDING ?auto_209141 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209141 )
      ( MAKE-4PILE ?auto_209141 ?auto_209142 ?auto_209143 ?auto_209144 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209150 - BLOCK
      ?auto_209151 - BLOCK
      ?auto_209152 - BLOCK
      ?auto_209153 - BLOCK
    )
    :vars
    (
      ?auto_209154 - BLOCK
      ?auto_209155 - BLOCK
      ?auto_209157 - BLOCK
      ?auto_209158 - BLOCK
      ?auto_209156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_209150 ?auto_209151 ) ) ( not ( = ?auto_209150 ?auto_209152 ) ) ( not ( = ?auto_209150 ?auto_209153 ) ) ( not ( = ?auto_209151 ?auto_209152 ) ) ( not ( = ?auto_209151 ?auto_209153 ) ) ( not ( = ?auto_209152 ?auto_209153 ) ) ( ON ?auto_209153 ?auto_209154 ) ( not ( = ?auto_209150 ?auto_209154 ) ) ( not ( = ?auto_209151 ?auto_209154 ) ) ( not ( = ?auto_209152 ?auto_209154 ) ) ( not ( = ?auto_209153 ?auto_209154 ) ) ( ON ?auto_209152 ?auto_209153 ) ( ON-TABLE ?auto_209155 ) ( ON ?auto_209157 ?auto_209155 ) ( ON ?auto_209158 ?auto_209157 ) ( ON ?auto_209156 ?auto_209158 ) ( ON ?auto_209154 ?auto_209156 ) ( not ( = ?auto_209155 ?auto_209157 ) ) ( not ( = ?auto_209155 ?auto_209158 ) ) ( not ( = ?auto_209155 ?auto_209156 ) ) ( not ( = ?auto_209155 ?auto_209154 ) ) ( not ( = ?auto_209155 ?auto_209153 ) ) ( not ( = ?auto_209155 ?auto_209152 ) ) ( not ( = ?auto_209157 ?auto_209158 ) ) ( not ( = ?auto_209157 ?auto_209156 ) ) ( not ( = ?auto_209157 ?auto_209154 ) ) ( not ( = ?auto_209157 ?auto_209153 ) ) ( not ( = ?auto_209157 ?auto_209152 ) ) ( not ( = ?auto_209158 ?auto_209156 ) ) ( not ( = ?auto_209158 ?auto_209154 ) ) ( not ( = ?auto_209158 ?auto_209153 ) ) ( not ( = ?auto_209158 ?auto_209152 ) ) ( not ( = ?auto_209156 ?auto_209154 ) ) ( not ( = ?auto_209156 ?auto_209153 ) ) ( not ( = ?auto_209156 ?auto_209152 ) ) ( not ( = ?auto_209150 ?auto_209155 ) ) ( not ( = ?auto_209150 ?auto_209157 ) ) ( not ( = ?auto_209150 ?auto_209158 ) ) ( not ( = ?auto_209150 ?auto_209156 ) ) ( not ( = ?auto_209151 ?auto_209155 ) ) ( not ( = ?auto_209151 ?auto_209157 ) ) ( not ( = ?auto_209151 ?auto_209158 ) ) ( not ( = ?auto_209151 ?auto_209156 ) ) ( ON ?auto_209151 ?auto_209152 ) ( ON ?auto_209150 ?auto_209151 ) ( CLEAR ?auto_209150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_209155 ?auto_209157 ?auto_209158 ?auto_209156 ?auto_209154 ?auto_209153 ?auto_209152 ?auto_209151 )
      ( MAKE-4PILE ?auto_209150 ?auto_209151 ?auto_209152 ?auto_209153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209163 - BLOCK
      ?auto_209164 - BLOCK
      ?auto_209165 - BLOCK
      ?auto_209166 - BLOCK
    )
    :vars
    (
      ?auto_209167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209167 ?auto_209166 ) ( CLEAR ?auto_209167 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209163 ) ( ON ?auto_209164 ?auto_209163 ) ( ON ?auto_209165 ?auto_209164 ) ( ON ?auto_209166 ?auto_209165 ) ( not ( = ?auto_209163 ?auto_209164 ) ) ( not ( = ?auto_209163 ?auto_209165 ) ) ( not ( = ?auto_209163 ?auto_209166 ) ) ( not ( = ?auto_209163 ?auto_209167 ) ) ( not ( = ?auto_209164 ?auto_209165 ) ) ( not ( = ?auto_209164 ?auto_209166 ) ) ( not ( = ?auto_209164 ?auto_209167 ) ) ( not ( = ?auto_209165 ?auto_209166 ) ) ( not ( = ?auto_209165 ?auto_209167 ) ) ( not ( = ?auto_209166 ?auto_209167 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209167 ?auto_209166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209168 - BLOCK
      ?auto_209169 - BLOCK
      ?auto_209170 - BLOCK
      ?auto_209171 - BLOCK
    )
    :vars
    (
      ?auto_209172 - BLOCK
      ?auto_209173 - BLOCK
      ?auto_209174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209172 ?auto_209171 ) ( CLEAR ?auto_209172 ) ( ON-TABLE ?auto_209168 ) ( ON ?auto_209169 ?auto_209168 ) ( ON ?auto_209170 ?auto_209169 ) ( ON ?auto_209171 ?auto_209170 ) ( not ( = ?auto_209168 ?auto_209169 ) ) ( not ( = ?auto_209168 ?auto_209170 ) ) ( not ( = ?auto_209168 ?auto_209171 ) ) ( not ( = ?auto_209168 ?auto_209172 ) ) ( not ( = ?auto_209169 ?auto_209170 ) ) ( not ( = ?auto_209169 ?auto_209171 ) ) ( not ( = ?auto_209169 ?auto_209172 ) ) ( not ( = ?auto_209170 ?auto_209171 ) ) ( not ( = ?auto_209170 ?auto_209172 ) ) ( not ( = ?auto_209171 ?auto_209172 ) ) ( HOLDING ?auto_209173 ) ( CLEAR ?auto_209174 ) ( not ( = ?auto_209168 ?auto_209173 ) ) ( not ( = ?auto_209168 ?auto_209174 ) ) ( not ( = ?auto_209169 ?auto_209173 ) ) ( not ( = ?auto_209169 ?auto_209174 ) ) ( not ( = ?auto_209170 ?auto_209173 ) ) ( not ( = ?auto_209170 ?auto_209174 ) ) ( not ( = ?auto_209171 ?auto_209173 ) ) ( not ( = ?auto_209171 ?auto_209174 ) ) ( not ( = ?auto_209172 ?auto_209173 ) ) ( not ( = ?auto_209172 ?auto_209174 ) ) ( not ( = ?auto_209173 ?auto_209174 ) ) )
    :subtasks
    ( ( !STACK ?auto_209173 ?auto_209174 )
      ( MAKE-4PILE ?auto_209168 ?auto_209169 ?auto_209170 ?auto_209171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209175 - BLOCK
      ?auto_209176 - BLOCK
      ?auto_209177 - BLOCK
      ?auto_209178 - BLOCK
    )
    :vars
    (
      ?auto_209180 - BLOCK
      ?auto_209181 - BLOCK
      ?auto_209179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209180 ?auto_209178 ) ( ON-TABLE ?auto_209175 ) ( ON ?auto_209176 ?auto_209175 ) ( ON ?auto_209177 ?auto_209176 ) ( ON ?auto_209178 ?auto_209177 ) ( not ( = ?auto_209175 ?auto_209176 ) ) ( not ( = ?auto_209175 ?auto_209177 ) ) ( not ( = ?auto_209175 ?auto_209178 ) ) ( not ( = ?auto_209175 ?auto_209180 ) ) ( not ( = ?auto_209176 ?auto_209177 ) ) ( not ( = ?auto_209176 ?auto_209178 ) ) ( not ( = ?auto_209176 ?auto_209180 ) ) ( not ( = ?auto_209177 ?auto_209178 ) ) ( not ( = ?auto_209177 ?auto_209180 ) ) ( not ( = ?auto_209178 ?auto_209180 ) ) ( CLEAR ?auto_209181 ) ( not ( = ?auto_209175 ?auto_209179 ) ) ( not ( = ?auto_209175 ?auto_209181 ) ) ( not ( = ?auto_209176 ?auto_209179 ) ) ( not ( = ?auto_209176 ?auto_209181 ) ) ( not ( = ?auto_209177 ?auto_209179 ) ) ( not ( = ?auto_209177 ?auto_209181 ) ) ( not ( = ?auto_209178 ?auto_209179 ) ) ( not ( = ?auto_209178 ?auto_209181 ) ) ( not ( = ?auto_209180 ?auto_209179 ) ) ( not ( = ?auto_209180 ?auto_209181 ) ) ( not ( = ?auto_209179 ?auto_209181 ) ) ( ON ?auto_209179 ?auto_209180 ) ( CLEAR ?auto_209179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209175 ?auto_209176 ?auto_209177 ?auto_209178 ?auto_209180 )
      ( MAKE-4PILE ?auto_209175 ?auto_209176 ?auto_209177 ?auto_209178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209182 - BLOCK
      ?auto_209183 - BLOCK
      ?auto_209184 - BLOCK
      ?auto_209185 - BLOCK
    )
    :vars
    (
      ?auto_209187 - BLOCK
      ?auto_209188 - BLOCK
      ?auto_209186 - BLOCK
      ?auto_209189 - BLOCK
      ?auto_209190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209187 ?auto_209185 ) ( ON-TABLE ?auto_209182 ) ( ON ?auto_209183 ?auto_209182 ) ( ON ?auto_209184 ?auto_209183 ) ( ON ?auto_209185 ?auto_209184 ) ( not ( = ?auto_209182 ?auto_209183 ) ) ( not ( = ?auto_209182 ?auto_209184 ) ) ( not ( = ?auto_209182 ?auto_209185 ) ) ( not ( = ?auto_209182 ?auto_209187 ) ) ( not ( = ?auto_209183 ?auto_209184 ) ) ( not ( = ?auto_209183 ?auto_209185 ) ) ( not ( = ?auto_209183 ?auto_209187 ) ) ( not ( = ?auto_209184 ?auto_209185 ) ) ( not ( = ?auto_209184 ?auto_209187 ) ) ( not ( = ?auto_209185 ?auto_209187 ) ) ( not ( = ?auto_209182 ?auto_209188 ) ) ( not ( = ?auto_209182 ?auto_209186 ) ) ( not ( = ?auto_209183 ?auto_209188 ) ) ( not ( = ?auto_209183 ?auto_209186 ) ) ( not ( = ?auto_209184 ?auto_209188 ) ) ( not ( = ?auto_209184 ?auto_209186 ) ) ( not ( = ?auto_209185 ?auto_209188 ) ) ( not ( = ?auto_209185 ?auto_209186 ) ) ( not ( = ?auto_209187 ?auto_209188 ) ) ( not ( = ?auto_209187 ?auto_209186 ) ) ( not ( = ?auto_209188 ?auto_209186 ) ) ( ON ?auto_209188 ?auto_209187 ) ( CLEAR ?auto_209188 ) ( HOLDING ?auto_209186 ) ( CLEAR ?auto_209189 ) ( ON-TABLE ?auto_209190 ) ( ON ?auto_209189 ?auto_209190 ) ( not ( = ?auto_209190 ?auto_209189 ) ) ( not ( = ?auto_209190 ?auto_209186 ) ) ( not ( = ?auto_209189 ?auto_209186 ) ) ( not ( = ?auto_209182 ?auto_209189 ) ) ( not ( = ?auto_209182 ?auto_209190 ) ) ( not ( = ?auto_209183 ?auto_209189 ) ) ( not ( = ?auto_209183 ?auto_209190 ) ) ( not ( = ?auto_209184 ?auto_209189 ) ) ( not ( = ?auto_209184 ?auto_209190 ) ) ( not ( = ?auto_209185 ?auto_209189 ) ) ( not ( = ?auto_209185 ?auto_209190 ) ) ( not ( = ?auto_209187 ?auto_209189 ) ) ( not ( = ?auto_209187 ?auto_209190 ) ) ( not ( = ?auto_209188 ?auto_209189 ) ) ( not ( = ?auto_209188 ?auto_209190 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209190 ?auto_209189 ?auto_209186 )
      ( MAKE-4PILE ?auto_209182 ?auto_209183 ?auto_209184 ?auto_209185 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209191 - BLOCK
      ?auto_209192 - BLOCK
      ?auto_209193 - BLOCK
      ?auto_209194 - BLOCK
    )
    :vars
    (
      ?auto_209197 - BLOCK
      ?auto_209198 - BLOCK
      ?auto_209196 - BLOCK
      ?auto_209199 - BLOCK
      ?auto_209195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209197 ?auto_209194 ) ( ON-TABLE ?auto_209191 ) ( ON ?auto_209192 ?auto_209191 ) ( ON ?auto_209193 ?auto_209192 ) ( ON ?auto_209194 ?auto_209193 ) ( not ( = ?auto_209191 ?auto_209192 ) ) ( not ( = ?auto_209191 ?auto_209193 ) ) ( not ( = ?auto_209191 ?auto_209194 ) ) ( not ( = ?auto_209191 ?auto_209197 ) ) ( not ( = ?auto_209192 ?auto_209193 ) ) ( not ( = ?auto_209192 ?auto_209194 ) ) ( not ( = ?auto_209192 ?auto_209197 ) ) ( not ( = ?auto_209193 ?auto_209194 ) ) ( not ( = ?auto_209193 ?auto_209197 ) ) ( not ( = ?auto_209194 ?auto_209197 ) ) ( not ( = ?auto_209191 ?auto_209198 ) ) ( not ( = ?auto_209191 ?auto_209196 ) ) ( not ( = ?auto_209192 ?auto_209198 ) ) ( not ( = ?auto_209192 ?auto_209196 ) ) ( not ( = ?auto_209193 ?auto_209198 ) ) ( not ( = ?auto_209193 ?auto_209196 ) ) ( not ( = ?auto_209194 ?auto_209198 ) ) ( not ( = ?auto_209194 ?auto_209196 ) ) ( not ( = ?auto_209197 ?auto_209198 ) ) ( not ( = ?auto_209197 ?auto_209196 ) ) ( not ( = ?auto_209198 ?auto_209196 ) ) ( ON ?auto_209198 ?auto_209197 ) ( CLEAR ?auto_209199 ) ( ON-TABLE ?auto_209195 ) ( ON ?auto_209199 ?auto_209195 ) ( not ( = ?auto_209195 ?auto_209199 ) ) ( not ( = ?auto_209195 ?auto_209196 ) ) ( not ( = ?auto_209199 ?auto_209196 ) ) ( not ( = ?auto_209191 ?auto_209199 ) ) ( not ( = ?auto_209191 ?auto_209195 ) ) ( not ( = ?auto_209192 ?auto_209199 ) ) ( not ( = ?auto_209192 ?auto_209195 ) ) ( not ( = ?auto_209193 ?auto_209199 ) ) ( not ( = ?auto_209193 ?auto_209195 ) ) ( not ( = ?auto_209194 ?auto_209199 ) ) ( not ( = ?auto_209194 ?auto_209195 ) ) ( not ( = ?auto_209197 ?auto_209199 ) ) ( not ( = ?auto_209197 ?auto_209195 ) ) ( not ( = ?auto_209198 ?auto_209199 ) ) ( not ( = ?auto_209198 ?auto_209195 ) ) ( ON ?auto_209196 ?auto_209198 ) ( CLEAR ?auto_209196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209191 ?auto_209192 ?auto_209193 ?auto_209194 ?auto_209197 ?auto_209198 )
      ( MAKE-4PILE ?auto_209191 ?auto_209192 ?auto_209193 ?auto_209194 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209200 - BLOCK
      ?auto_209201 - BLOCK
      ?auto_209202 - BLOCK
      ?auto_209203 - BLOCK
    )
    :vars
    (
      ?auto_209208 - BLOCK
      ?auto_209204 - BLOCK
      ?auto_209206 - BLOCK
      ?auto_209207 - BLOCK
      ?auto_209205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209208 ?auto_209203 ) ( ON-TABLE ?auto_209200 ) ( ON ?auto_209201 ?auto_209200 ) ( ON ?auto_209202 ?auto_209201 ) ( ON ?auto_209203 ?auto_209202 ) ( not ( = ?auto_209200 ?auto_209201 ) ) ( not ( = ?auto_209200 ?auto_209202 ) ) ( not ( = ?auto_209200 ?auto_209203 ) ) ( not ( = ?auto_209200 ?auto_209208 ) ) ( not ( = ?auto_209201 ?auto_209202 ) ) ( not ( = ?auto_209201 ?auto_209203 ) ) ( not ( = ?auto_209201 ?auto_209208 ) ) ( not ( = ?auto_209202 ?auto_209203 ) ) ( not ( = ?auto_209202 ?auto_209208 ) ) ( not ( = ?auto_209203 ?auto_209208 ) ) ( not ( = ?auto_209200 ?auto_209204 ) ) ( not ( = ?auto_209200 ?auto_209206 ) ) ( not ( = ?auto_209201 ?auto_209204 ) ) ( not ( = ?auto_209201 ?auto_209206 ) ) ( not ( = ?auto_209202 ?auto_209204 ) ) ( not ( = ?auto_209202 ?auto_209206 ) ) ( not ( = ?auto_209203 ?auto_209204 ) ) ( not ( = ?auto_209203 ?auto_209206 ) ) ( not ( = ?auto_209208 ?auto_209204 ) ) ( not ( = ?auto_209208 ?auto_209206 ) ) ( not ( = ?auto_209204 ?auto_209206 ) ) ( ON ?auto_209204 ?auto_209208 ) ( ON-TABLE ?auto_209207 ) ( not ( = ?auto_209207 ?auto_209205 ) ) ( not ( = ?auto_209207 ?auto_209206 ) ) ( not ( = ?auto_209205 ?auto_209206 ) ) ( not ( = ?auto_209200 ?auto_209205 ) ) ( not ( = ?auto_209200 ?auto_209207 ) ) ( not ( = ?auto_209201 ?auto_209205 ) ) ( not ( = ?auto_209201 ?auto_209207 ) ) ( not ( = ?auto_209202 ?auto_209205 ) ) ( not ( = ?auto_209202 ?auto_209207 ) ) ( not ( = ?auto_209203 ?auto_209205 ) ) ( not ( = ?auto_209203 ?auto_209207 ) ) ( not ( = ?auto_209208 ?auto_209205 ) ) ( not ( = ?auto_209208 ?auto_209207 ) ) ( not ( = ?auto_209204 ?auto_209205 ) ) ( not ( = ?auto_209204 ?auto_209207 ) ) ( ON ?auto_209206 ?auto_209204 ) ( CLEAR ?auto_209206 ) ( HOLDING ?auto_209205 ) ( CLEAR ?auto_209207 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209207 ?auto_209205 )
      ( MAKE-4PILE ?auto_209200 ?auto_209201 ?auto_209202 ?auto_209203 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209209 - BLOCK
      ?auto_209210 - BLOCK
      ?auto_209211 - BLOCK
      ?auto_209212 - BLOCK
    )
    :vars
    (
      ?auto_209214 - BLOCK
      ?auto_209215 - BLOCK
      ?auto_209217 - BLOCK
      ?auto_209216 - BLOCK
      ?auto_209213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209214 ?auto_209212 ) ( ON-TABLE ?auto_209209 ) ( ON ?auto_209210 ?auto_209209 ) ( ON ?auto_209211 ?auto_209210 ) ( ON ?auto_209212 ?auto_209211 ) ( not ( = ?auto_209209 ?auto_209210 ) ) ( not ( = ?auto_209209 ?auto_209211 ) ) ( not ( = ?auto_209209 ?auto_209212 ) ) ( not ( = ?auto_209209 ?auto_209214 ) ) ( not ( = ?auto_209210 ?auto_209211 ) ) ( not ( = ?auto_209210 ?auto_209212 ) ) ( not ( = ?auto_209210 ?auto_209214 ) ) ( not ( = ?auto_209211 ?auto_209212 ) ) ( not ( = ?auto_209211 ?auto_209214 ) ) ( not ( = ?auto_209212 ?auto_209214 ) ) ( not ( = ?auto_209209 ?auto_209215 ) ) ( not ( = ?auto_209209 ?auto_209217 ) ) ( not ( = ?auto_209210 ?auto_209215 ) ) ( not ( = ?auto_209210 ?auto_209217 ) ) ( not ( = ?auto_209211 ?auto_209215 ) ) ( not ( = ?auto_209211 ?auto_209217 ) ) ( not ( = ?auto_209212 ?auto_209215 ) ) ( not ( = ?auto_209212 ?auto_209217 ) ) ( not ( = ?auto_209214 ?auto_209215 ) ) ( not ( = ?auto_209214 ?auto_209217 ) ) ( not ( = ?auto_209215 ?auto_209217 ) ) ( ON ?auto_209215 ?auto_209214 ) ( ON-TABLE ?auto_209216 ) ( not ( = ?auto_209216 ?auto_209213 ) ) ( not ( = ?auto_209216 ?auto_209217 ) ) ( not ( = ?auto_209213 ?auto_209217 ) ) ( not ( = ?auto_209209 ?auto_209213 ) ) ( not ( = ?auto_209209 ?auto_209216 ) ) ( not ( = ?auto_209210 ?auto_209213 ) ) ( not ( = ?auto_209210 ?auto_209216 ) ) ( not ( = ?auto_209211 ?auto_209213 ) ) ( not ( = ?auto_209211 ?auto_209216 ) ) ( not ( = ?auto_209212 ?auto_209213 ) ) ( not ( = ?auto_209212 ?auto_209216 ) ) ( not ( = ?auto_209214 ?auto_209213 ) ) ( not ( = ?auto_209214 ?auto_209216 ) ) ( not ( = ?auto_209215 ?auto_209213 ) ) ( not ( = ?auto_209215 ?auto_209216 ) ) ( ON ?auto_209217 ?auto_209215 ) ( CLEAR ?auto_209216 ) ( ON ?auto_209213 ?auto_209217 ) ( CLEAR ?auto_209213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209209 ?auto_209210 ?auto_209211 ?auto_209212 ?auto_209214 ?auto_209215 ?auto_209217 )
      ( MAKE-4PILE ?auto_209209 ?auto_209210 ?auto_209211 ?auto_209212 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209218 - BLOCK
      ?auto_209219 - BLOCK
      ?auto_209220 - BLOCK
      ?auto_209221 - BLOCK
    )
    :vars
    (
      ?auto_209225 - BLOCK
      ?auto_209223 - BLOCK
      ?auto_209226 - BLOCK
      ?auto_209224 - BLOCK
      ?auto_209222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209225 ?auto_209221 ) ( ON-TABLE ?auto_209218 ) ( ON ?auto_209219 ?auto_209218 ) ( ON ?auto_209220 ?auto_209219 ) ( ON ?auto_209221 ?auto_209220 ) ( not ( = ?auto_209218 ?auto_209219 ) ) ( not ( = ?auto_209218 ?auto_209220 ) ) ( not ( = ?auto_209218 ?auto_209221 ) ) ( not ( = ?auto_209218 ?auto_209225 ) ) ( not ( = ?auto_209219 ?auto_209220 ) ) ( not ( = ?auto_209219 ?auto_209221 ) ) ( not ( = ?auto_209219 ?auto_209225 ) ) ( not ( = ?auto_209220 ?auto_209221 ) ) ( not ( = ?auto_209220 ?auto_209225 ) ) ( not ( = ?auto_209221 ?auto_209225 ) ) ( not ( = ?auto_209218 ?auto_209223 ) ) ( not ( = ?auto_209218 ?auto_209226 ) ) ( not ( = ?auto_209219 ?auto_209223 ) ) ( not ( = ?auto_209219 ?auto_209226 ) ) ( not ( = ?auto_209220 ?auto_209223 ) ) ( not ( = ?auto_209220 ?auto_209226 ) ) ( not ( = ?auto_209221 ?auto_209223 ) ) ( not ( = ?auto_209221 ?auto_209226 ) ) ( not ( = ?auto_209225 ?auto_209223 ) ) ( not ( = ?auto_209225 ?auto_209226 ) ) ( not ( = ?auto_209223 ?auto_209226 ) ) ( ON ?auto_209223 ?auto_209225 ) ( not ( = ?auto_209224 ?auto_209222 ) ) ( not ( = ?auto_209224 ?auto_209226 ) ) ( not ( = ?auto_209222 ?auto_209226 ) ) ( not ( = ?auto_209218 ?auto_209222 ) ) ( not ( = ?auto_209218 ?auto_209224 ) ) ( not ( = ?auto_209219 ?auto_209222 ) ) ( not ( = ?auto_209219 ?auto_209224 ) ) ( not ( = ?auto_209220 ?auto_209222 ) ) ( not ( = ?auto_209220 ?auto_209224 ) ) ( not ( = ?auto_209221 ?auto_209222 ) ) ( not ( = ?auto_209221 ?auto_209224 ) ) ( not ( = ?auto_209225 ?auto_209222 ) ) ( not ( = ?auto_209225 ?auto_209224 ) ) ( not ( = ?auto_209223 ?auto_209222 ) ) ( not ( = ?auto_209223 ?auto_209224 ) ) ( ON ?auto_209226 ?auto_209223 ) ( ON ?auto_209222 ?auto_209226 ) ( CLEAR ?auto_209222 ) ( HOLDING ?auto_209224 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209224 )
      ( MAKE-4PILE ?auto_209218 ?auto_209219 ?auto_209220 ?auto_209221 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209227 - BLOCK
      ?auto_209228 - BLOCK
      ?auto_209229 - BLOCK
      ?auto_209230 - BLOCK
    )
    :vars
    (
      ?auto_209234 - BLOCK
      ?auto_209235 - BLOCK
      ?auto_209233 - BLOCK
      ?auto_209231 - BLOCK
      ?auto_209232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209234 ?auto_209230 ) ( ON-TABLE ?auto_209227 ) ( ON ?auto_209228 ?auto_209227 ) ( ON ?auto_209229 ?auto_209228 ) ( ON ?auto_209230 ?auto_209229 ) ( not ( = ?auto_209227 ?auto_209228 ) ) ( not ( = ?auto_209227 ?auto_209229 ) ) ( not ( = ?auto_209227 ?auto_209230 ) ) ( not ( = ?auto_209227 ?auto_209234 ) ) ( not ( = ?auto_209228 ?auto_209229 ) ) ( not ( = ?auto_209228 ?auto_209230 ) ) ( not ( = ?auto_209228 ?auto_209234 ) ) ( not ( = ?auto_209229 ?auto_209230 ) ) ( not ( = ?auto_209229 ?auto_209234 ) ) ( not ( = ?auto_209230 ?auto_209234 ) ) ( not ( = ?auto_209227 ?auto_209235 ) ) ( not ( = ?auto_209227 ?auto_209233 ) ) ( not ( = ?auto_209228 ?auto_209235 ) ) ( not ( = ?auto_209228 ?auto_209233 ) ) ( not ( = ?auto_209229 ?auto_209235 ) ) ( not ( = ?auto_209229 ?auto_209233 ) ) ( not ( = ?auto_209230 ?auto_209235 ) ) ( not ( = ?auto_209230 ?auto_209233 ) ) ( not ( = ?auto_209234 ?auto_209235 ) ) ( not ( = ?auto_209234 ?auto_209233 ) ) ( not ( = ?auto_209235 ?auto_209233 ) ) ( ON ?auto_209235 ?auto_209234 ) ( not ( = ?auto_209231 ?auto_209232 ) ) ( not ( = ?auto_209231 ?auto_209233 ) ) ( not ( = ?auto_209232 ?auto_209233 ) ) ( not ( = ?auto_209227 ?auto_209232 ) ) ( not ( = ?auto_209227 ?auto_209231 ) ) ( not ( = ?auto_209228 ?auto_209232 ) ) ( not ( = ?auto_209228 ?auto_209231 ) ) ( not ( = ?auto_209229 ?auto_209232 ) ) ( not ( = ?auto_209229 ?auto_209231 ) ) ( not ( = ?auto_209230 ?auto_209232 ) ) ( not ( = ?auto_209230 ?auto_209231 ) ) ( not ( = ?auto_209234 ?auto_209232 ) ) ( not ( = ?auto_209234 ?auto_209231 ) ) ( not ( = ?auto_209235 ?auto_209232 ) ) ( not ( = ?auto_209235 ?auto_209231 ) ) ( ON ?auto_209233 ?auto_209235 ) ( ON ?auto_209232 ?auto_209233 ) ( ON ?auto_209231 ?auto_209232 ) ( CLEAR ?auto_209231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_209227 ?auto_209228 ?auto_209229 ?auto_209230 ?auto_209234 ?auto_209235 ?auto_209233 ?auto_209232 )
      ( MAKE-4PILE ?auto_209227 ?auto_209228 ?auto_209229 ?auto_209230 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209241 - BLOCK
      ?auto_209242 - BLOCK
      ?auto_209243 - BLOCK
      ?auto_209244 - BLOCK
      ?auto_209245 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_209245 ) ( CLEAR ?auto_209244 ) ( ON-TABLE ?auto_209241 ) ( ON ?auto_209242 ?auto_209241 ) ( ON ?auto_209243 ?auto_209242 ) ( ON ?auto_209244 ?auto_209243 ) ( not ( = ?auto_209241 ?auto_209242 ) ) ( not ( = ?auto_209241 ?auto_209243 ) ) ( not ( = ?auto_209241 ?auto_209244 ) ) ( not ( = ?auto_209241 ?auto_209245 ) ) ( not ( = ?auto_209242 ?auto_209243 ) ) ( not ( = ?auto_209242 ?auto_209244 ) ) ( not ( = ?auto_209242 ?auto_209245 ) ) ( not ( = ?auto_209243 ?auto_209244 ) ) ( not ( = ?auto_209243 ?auto_209245 ) ) ( not ( = ?auto_209244 ?auto_209245 ) ) )
    :subtasks
    ( ( !STACK ?auto_209245 ?auto_209244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209246 - BLOCK
      ?auto_209247 - BLOCK
      ?auto_209248 - BLOCK
      ?auto_209249 - BLOCK
      ?auto_209250 - BLOCK
    )
    :vars
    (
      ?auto_209251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_209249 ) ( ON-TABLE ?auto_209246 ) ( ON ?auto_209247 ?auto_209246 ) ( ON ?auto_209248 ?auto_209247 ) ( ON ?auto_209249 ?auto_209248 ) ( not ( = ?auto_209246 ?auto_209247 ) ) ( not ( = ?auto_209246 ?auto_209248 ) ) ( not ( = ?auto_209246 ?auto_209249 ) ) ( not ( = ?auto_209246 ?auto_209250 ) ) ( not ( = ?auto_209247 ?auto_209248 ) ) ( not ( = ?auto_209247 ?auto_209249 ) ) ( not ( = ?auto_209247 ?auto_209250 ) ) ( not ( = ?auto_209248 ?auto_209249 ) ) ( not ( = ?auto_209248 ?auto_209250 ) ) ( not ( = ?auto_209249 ?auto_209250 ) ) ( ON ?auto_209250 ?auto_209251 ) ( CLEAR ?auto_209250 ) ( HAND-EMPTY ) ( not ( = ?auto_209246 ?auto_209251 ) ) ( not ( = ?auto_209247 ?auto_209251 ) ) ( not ( = ?auto_209248 ?auto_209251 ) ) ( not ( = ?auto_209249 ?auto_209251 ) ) ( not ( = ?auto_209250 ?auto_209251 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209250 ?auto_209251 )
      ( MAKE-5PILE ?auto_209246 ?auto_209247 ?auto_209248 ?auto_209249 ?auto_209250 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209252 - BLOCK
      ?auto_209253 - BLOCK
      ?auto_209254 - BLOCK
      ?auto_209255 - BLOCK
      ?auto_209256 - BLOCK
    )
    :vars
    (
      ?auto_209257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209252 ) ( ON ?auto_209253 ?auto_209252 ) ( ON ?auto_209254 ?auto_209253 ) ( not ( = ?auto_209252 ?auto_209253 ) ) ( not ( = ?auto_209252 ?auto_209254 ) ) ( not ( = ?auto_209252 ?auto_209255 ) ) ( not ( = ?auto_209252 ?auto_209256 ) ) ( not ( = ?auto_209253 ?auto_209254 ) ) ( not ( = ?auto_209253 ?auto_209255 ) ) ( not ( = ?auto_209253 ?auto_209256 ) ) ( not ( = ?auto_209254 ?auto_209255 ) ) ( not ( = ?auto_209254 ?auto_209256 ) ) ( not ( = ?auto_209255 ?auto_209256 ) ) ( ON ?auto_209256 ?auto_209257 ) ( CLEAR ?auto_209256 ) ( not ( = ?auto_209252 ?auto_209257 ) ) ( not ( = ?auto_209253 ?auto_209257 ) ) ( not ( = ?auto_209254 ?auto_209257 ) ) ( not ( = ?auto_209255 ?auto_209257 ) ) ( not ( = ?auto_209256 ?auto_209257 ) ) ( HOLDING ?auto_209255 ) ( CLEAR ?auto_209254 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209252 ?auto_209253 ?auto_209254 ?auto_209255 )
      ( MAKE-5PILE ?auto_209252 ?auto_209253 ?auto_209254 ?auto_209255 ?auto_209256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209258 - BLOCK
      ?auto_209259 - BLOCK
      ?auto_209260 - BLOCK
      ?auto_209261 - BLOCK
      ?auto_209262 - BLOCK
    )
    :vars
    (
      ?auto_209263 - BLOCK
      ?auto_209264 - BLOCK
      ?auto_209265 - BLOCK
      ?auto_209266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209258 ) ( ON ?auto_209259 ?auto_209258 ) ( ON ?auto_209260 ?auto_209259 ) ( not ( = ?auto_209258 ?auto_209259 ) ) ( not ( = ?auto_209258 ?auto_209260 ) ) ( not ( = ?auto_209258 ?auto_209261 ) ) ( not ( = ?auto_209258 ?auto_209262 ) ) ( not ( = ?auto_209259 ?auto_209260 ) ) ( not ( = ?auto_209259 ?auto_209261 ) ) ( not ( = ?auto_209259 ?auto_209262 ) ) ( not ( = ?auto_209260 ?auto_209261 ) ) ( not ( = ?auto_209260 ?auto_209262 ) ) ( not ( = ?auto_209261 ?auto_209262 ) ) ( ON ?auto_209262 ?auto_209263 ) ( not ( = ?auto_209258 ?auto_209263 ) ) ( not ( = ?auto_209259 ?auto_209263 ) ) ( not ( = ?auto_209260 ?auto_209263 ) ) ( not ( = ?auto_209261 ?auto_209263 ) ) ( not ( = ?auto_209262 ?auto_209263 ) ) ( CLEAR ?auto_209260 ) ( ON ?auto_209261 ?auto_209262 ) ( CLEAR ?auto_209261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209264 ) ( ON ?auto_209265 ?auto_209264 ) ( ON ?auto_209266 ?auto_209265 ) ( ON ?auto_209263 ?auto_209266 ) ( not ( = ?auto_209264 ?auto_209265 ) ) ( not ( = ?auto_209264 ?auto_209266 ) ) ( not ( = ?auto_209264 ?auto_209263 ) ) ( not ( = ?auto_209264 ?auto_209262 ) ) ( not ( = ?auto_209264 ?auto_209261 ) ) ( not ( = ?auto_209265 ?auto_209266 ) ) ( not ( = ?auto_209265 ?auto_209263 ) ) ( not ( = ?auto_209265 ?auto_209262 ) ) ( not ( = ?auto_209265 ?auto_209261 ) ) ( not ( = ?auto_209266 ?auto_209263 ) ) ( not ( = ?auto_209266 ?auto_209262 ) ) ( not ( = ?auto_209266 ?auto_209261 ) ) ( not ( = ?auto_209258 ?auto_209264 ) ) ( not ( = ?auto_209258 ?auto_209265 ) ) ( not ( = ?auto_209258 ?auto_209266 ) ) ( not ( = ?auto_209259 ?auto_209264 ) ) ( not ( = ?auto_209259 ?auto_209265 ) ) ( not ( = ?auto_209259 ?auto_209266 ) ) ( not ( = ?auto_209260 ?auto_209264 ) ) ( not ( = ?auto_209260 ?auto_209265 ) ) ( not ( = ?auto_209260 ?auto_209266 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209264 ?auto_209265 ?auto_209266 ?auto_209263 ?auto_209262 )
      ( MAKE-5PILE ?auto_209258 ?auto_209259 ?auto_209260 ?auto_209261 ?auto_209262 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209267 - BLOCK
      ?auto_209268 - BLOCK
      ?auto_209269 - BLOCK
      ?auto_209270 - BLOCK
      ?auto_209271 - BLOCK
    )
    :vars
    (
      ?auto_209272 - BLOCK
      ?auto_209274 - BLOCK
      ?auto_209275 - BLOCK
      ?auto_209273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209267 ) ( ON ?auto_209268 ?auto_209267 ) ( not ( = ?auto_209267 ?auto_209268 ) ) ( not ( = ?auto_209267 ?auto_209269 ) ) ( not ( = ?auto_209267 ?auto_209270 ) ) ( not ( = ?auto_209267 ?auto_209271 ) ) ( not ( = ?auto_209268 ?auto_209269 ) ) ( not ( = ?auto_209268 ?auto_209270 ) ) ( not ( = ?auto_209268 ?auto_209271 ) ) ( not ( = ?auto_209269 ?auto_209270 ) ) ( not ( = ?auto_209269 ?auto_209271 ) ) ( not ( = ?auto_209270 ?auto_209271 ) ) ( ON ?auto_209271 ?auto_209272 ) ( not ( = ?auto_209267 ?auto_209272 ) ) ( not ( = ?auto_209268 ?auto_209272 ) ) ( not ( = ?auto_209269 ?auto_209272 ) ) ( not ( = ?auto_209270 ?auto_209272 ) ) ( not ( = ?auto_209271 ?auto_209272 ) ) ( ON ?auto_209270 ?auto_209271 ) ( CLEAR ?auto_209270 ) ( ON-TABLE ?auto_209274 ) ( ON ?auto_209275 ?auto_209274 ) ( ON ?auto_209273 ?auto_209275 ) ( ON ?auto_209272 ?auto_209273 ) ( not ( = ?auto_209274 ?auto_209275 ) ) ( not ( = ?auto_209274 ?auto_209273 ) ) ( not ( = ?auto_209274 ?auto_209272 ) ) ( not ( = ?auto_209274 ?auto_209271 ) ) ( not ( = ?auto_209274 ?auto_209270 ) ) ( not ( = ?auto_209275 ?auto_209273 ) ) ( not ( = ?auto_209275 ?auto_209272 ) ) ( not ( = ?auto_209275 ?auto_209271 ) ) ( not ( = ?auto_209275 ?auto_209270 ) ) ( not ( = ?auto_209273 ?auto_209272 ) ) ( not ( = ?auto_209273 ?auto_209271 ) ) ( not ( = ?auto_209273 ?auto_209270 ) ) ( not ( = ?auto_209267 ?auto_209274 ) ) ( not ( = ?auto_209267 ?auto_209275 ) ) ( not ( = ?auto_209267 ?auto_209273 ) ) ( not ( = ?auto_209268 ?auto_209274 ) ) ( not ( = ?auto_209268 ?auto_209275 ) ) ( not ( = ?auto_209268 ?auto_209273 ) ) ( not ( = ?auto_209269 ?auto_209274 ) ) ( not ( = ?auto_209269 ?auto_209275 ) ) ( not ( = ?auto_209269 ?auto_209273 ) ) ( HOLDING ?auto_209269 ) ( CLEAR ?auto_209268 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209267 ?auto_209268 ?auto_209269 )
      ( MAKE-5PILE ?auto_209267 ?auto_209268 ?auto_209269 ?auto_209270 ?auto_209271 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209276 - BLOCK
      ?auto_209277 - BLOCK
      ?auto_209278 - BLOCK
      ?auto_209279 - BLOCK
      ?auto_209280 - BLOCK
    )
    :vars
    (
      ?auto_209282 - BLOCK
      ?auto_209283 - BLOCK
      ?auto_209281 - BLOCK
      ?auto_209284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209276 ) ( ON ?auto_209277 ?auto_209276 ) ( not ( = ?auto_209276 ?auto_209277 ) ) ( not ( = ?auto_209276 ?auto_209278 ) ) ( not ( = ?auto_209276 ?auto_209279 ) ) ( not ( = ?auto_209276 ?auto_209280 ) ) ( not ( = ?auto_209277 ?auto_209278 ) ) ( not ( = ?auto_209277 ?auto_209279 ) ) ( not ( = ?auto_209277 ?auto_209280 ) ) ( not ( = ?auto_209278 ?auto_209279 ) ) ( not ( = ?auto_209278 ?auto_209280 ) ) ( not ( = ?auto_209279 ?auto_209280 ) ) ( ON ?auto_209280 ?auto_209282 ) ( not ( = ?auto_209276 ?auto_209282 ) ) ( not ( = ?auto_209277 ?auto_209282 ) ) ( not ( = ?auto_209278 ?auto_209282 ) ) ( not ( = ?auto_209279 ?auto_209282 ) ) ( not ( = ?auto_209280 ?auto_209282 ) ) ( ON ?auto_209279 ?auto_209280 ) ( ON-TABLE ?auto_209283 ) ( ON ?auto_209281 ?auto_209283 ) ( ON ?auto_209284 ?auto_209281 ) ( ON ?auto_209282 ?auto_209284 ) ( not ( = ?auto_209283 ?auto_209281 ) ) ( not ( = ?auto_209283 ?auto_209284 ) ) ( not ( = ?auto_209283 ?auto_209282 ) ) ( not ( = ?auto_209283 ?auto_209280 ) ) ( not ( = ?auto_209283 ?auto_209279 ) ) ( not ( = ?auto_209281 ?auto_209284 ) ) ( not ( = ?auto_209281 ?auto_209282 ) ) ( not ( = ?auto_209281 ?auto_209280 ) ) ( not ( = ?auto_209281 ?auto_209279 ) ) ( not ( = ?auto_209284 ?auto_209282 ) ) ( not ( = ?auto_209284 ?auto_209280 ) ) ( not ( = ?auto_209284 ?auto_209279 ) ) ( not ( = ?auto_209276 ?auto_209283 ) ) ( not ( = ?auto_209276 ?auto_209281 ) ) ( not ( = ?auto_209276 ?auto_209284 ) ) ( not ( = ?auto_209277 ?auto_209283 ) ) ( not ( = ?auto_209277 ?auto_209281 ) ) ( not ( = ?auto_209277 ?auto_209284 ) ) ( not ( = ?auto_209278 ?auto_209283 ) ) ( not ( = ?auto_209278 ?auto_209281 ) ) ( not ( = ?auto_209278 ?auto_209284 ) ) ( CLEAR ?auto_209277 ) ( ON ?auto_209278 ?auto_209279 ) ( CLEAR ?auto_209278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209283 ?auto_209281 ?auto_209284 ?auto_209282 ?auto_209280 ?auto_209279 )
      ( MAKE-5PILE ?auto_209276 ?auto_209277 ?auto_209278 ?auto_209279 ?auto_209280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209285 - BLOCK
      ?auto_209286 - BLOCK
      ?auto_209287 - BLOCK
      ?auto_209288 - BLOCK
      ?auto_209289 - BLOCK
    )
    :vars
    (
      ?auto_209293 - BLOCK
      ?auto_209291 - BLOCK
      ?auto_209290 - BLOCK
      ?auto_209292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209285 ) ( not ( = ?auto_209285 ?auto_209286 ) ) ( not ( = ?auto_209285 ?auto_209287 ) ) ( not ( = ?auto_209285 ?auto_209288 ) ) ( not ( = ?auto_209285 ?auto_209289 ) ) ( not ( = ?auto_209286 ?auto_209287 ) ) ( not ( = ?auto_209286 ?auto_209288 ) ) ( not ( = ?auto_209286 ?auto_209289 ) ) ( not ( = ?auto_209287 ?auto_209288 ) ) ( not ( = ?auto_209287 ?auto_209289 ) ) ( not ( = ?auto_209288 ?auto_209289 ) ) ( ON ?auto_209289 ?auto_209293 ) ( not ( = ?auto_209285 ?auto_209293 ) ) ( not ( = ?auto_209286 ?auto_209293 ) ) ( not ( = ?auto_209287 ?auto_209293 ) ) ( not ( = ?auto_209288 ?auto_209293 ) ) ( not ( = ?auto_209289 ?auto_209293 ) ) ( ON ?auto_209288 ?auto_209289 ) ( ON-TABLE ?auto_209291 ) ( ON ?auto_209290 ?auto_209291 ) ( ON ?auto_209292 ?auto_209290 ) ( ON ?auto_209293 ?auto_209292 ) ( not ( = ?auto_209291 ?auto_209290 ) ) ( not ( = ?auto_209291 ?auto_209292 ) ) ( not ( = ?auto_209291 ?auto_209293 ) ) ( not ( = ?auto_209291 ?auto_209289 ) ) ( not ( = ?auto_209291 ?auto_209288 ) ) ( not ( = ?auto_209290 ?auto_209292 ) ) ( not ( = ?auto_209290 ?auto_209293 ) ) ( not ( = ?auto_209290 ?auto_209289 ) ) ( not ( = ?auto_209290 ?auto_209288 ) ) ( not ( = ?auto_209292 ?auto_209293 ) ) ( not ( = ?auto_209292 ?auto_209289 ) ) ( not ( = ?auto_209292 ?auto_209288 ) ) ( not ( = ?auto_209285 ?auto_209291 ) ) ( not ( = ?auto_209285 ?auto_209290 ) ) ( not ( = ?auto_209285 ?auto_209292 ) ) ( not ( = ?auto_209286 ?auto_209291 ) ) ( not ( = ?auto_209286 ?auto_209290 ) ) ( not ( = ?auto_209286 ?auto_209292 ) ) ( not ( = ?auto_209287 ?auto_209291 ) ) ( not ( = ?auto_209287 ?auto_209290 ) ) ( not ( = ?auto_209287 ?auto_209292 ) ) ( ON ?auto_209287 ?auto_209288 ) ( CLEAR ?auto_209287 ) ( HOLDING ?auto_209286 ) ( CLEAR ?auto_209285 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209285 ?auto_209286 )
      ( MAKE-5PILE ?auto_209285 ?auto_209286 ?auto_209287 ?auto_209288 ?auto_209289 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209294 - BLOCK
      ?auto_209295 - BLOCK
      ?auto_209296 - BLOCK
      ?auto_209297 - BLOCK
      ?auto_209298 - BLOCK
    )
    :vars
    (
      ?auto_209300 - BLOCK
      ?auto_209302 - BLOCK
      ?auto_209299 - BLOCK
      ?auto_209301 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209294 ) ( not ( = ?auto_209294 ?auto_209295 ) ) ( not ( = ?auto_209294 ?auto_209296 ) ) ( not ( = ?auto_209294 ?auto_209297 ) ) ( not ( = ?auto_209294 ?auto_209298 ) ) ( not ( = ?auto_209295 ?auto_209296 ) ) ( not ( = ?auto_209295 ?auto_209297 ) ) ( not ( = ?auto_209295 ?auto_209298 ) ) ( not ( = ?auto_209296 ?auto_209297 ) ) ( not ( = ?auto_209296 ?auto_209298 ) ) ( not ( = ?auto_209297 ?auto_209298 ) ) ( ON ?auto_209298 ?auto_209300 ) ( not ( = ?auto_209294 ?auto_209300 ) ) ( not ( = ?auto_209295 ?auto_209300 ) ) ( not ( = ?auto_209296 ?auto_209300 ) ) ( not ( = ?auto_209297 ?auto_209300 ) ) ( not ( = ?auto_209298 ?auto_209300 ) ) ( ON ?auto_209297 ?auto_209298 ) ( ON-TABLE ?auto_209302 ) ( ON ?auto_209299 ?auto_209302 ) ( ON ?auto_209301 ?auto_209299 ) ( ON ?auto_209300 ?auto_209301 ) ( not ( = ?auto_209302 ?auto_209299 ) ) ( not ( = ?auto_209302 ?auto_209301 ) ) ( not ( = ?auto_209302 ?auto_209300 ) ) ( not ( = ?auto_209302 ?auto_209298 ) ) ( not ( = ?auto_209302 ?auto_209297 ) ) ( not ( = ?auto_209299 ?auto_209301 ) ) ( not ( = ?auto_209299 ?auto_209300 ) ) ( not ( = ?auto_209299 ?auto_209298 ) ) ( not ( = ?auto_209299 ?auto_209297 ) ) ( not ( = ?auto_209301 ?auto_209300 ) ) ( not ( = ?auto_209301 ?auto_209298 ) ) ( not ( = ?auto_209301 ?auto_209297 ) ) ( not ( = ?auto_209294 ?auto_209302 ) ) ( not ( = ?auto_209294 ?auto_209299 ) ) ( not ( = ?auto_209294 ?auto_209301 ) ) ( not ( = ?auto_209295 ?auto_209302 ) ) ( not ( = ?auto_209295 ?auto_209299 ) ) ( not ( = ?auto_209295 ?auto_209301 ) ) ( not ( = ?auto_209296 ?auto_209302 ) ) ( not ( = ?auto_209296 ?auto_209299 ) ) ( not ( = ?auto_209296 ?auto_209301 ) ) ( ON ?auto_209296 ?auto_209297 ) ( CLEAR ?auto_209294 ) ( ON ?auto_209295 ?auto_209296 ) ( CLEAR ?auto_209295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209302 ?auto_209299 ?auto_209301 ?auto_209300 ?auto_209298 ?auto_209297 ?auto_209296 )
      ( MAKE-5PILE ?auto_209294 ?auto_209295 ?auto_209296 ?auto_209297 ?auto_209298 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209303 - BLOCK
      ?auto_209304 - BLOCK
      ?auto_209305 - BLOCK
      ?auto_209306 - BLOCK
      ?auto_209307 - BLOCK
    )
    :vars
    (
      ?auto_209311 - BLOCK
      ?auto_209308 - BLOCK
      ?auto_209310 - BLOCK
      ?auto_209309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_209303 ?auto_209304 ) ) ( not ( = ?auto_209303 ?auto_209305 ) ) ( not ( = ?auto_209303 ?auto_209306 ) ) ( not ( = ?auto_209303 ?auto_209307 ) ) ( not ( = ?auto_209304 ?auto_209305 ) ) ( not ( = ?auto_209304 ?auto_209306 ) ) ( not ( = ?auto_209304 ?auto_209307 ) ) ( not ( = ?auto_209305 ?auto_209306 ) ) ( not ( = ?auto_209305 ?auto_209307 ) ) ( not ( = ?auto_209306 ?auto_209307 ) ) ( ON ?auto_209307 ?auto_209311 ) ( not ( = ?auto_209303 ?auto_209311 ) ) ( not ( = ?auto_209304 ?auto_209311 ) ) ( not ( = ?auto_209305 ?auto_209311 ) ) ( not ( = ?auto_209306 ?auto_209311 ) ) ( not ( = ?auto_209307 ?auto_209311 ) ) ( ON ?auto_209306 ?auto_209307 ) ( ON-TABLE ?auto_209308 ) ( ON ?auto_209310 ?auto_209308 ) ( ON ?auto_209309 ?auto_209310 ) ( ON ?auto_209311 ?auto_209309 ) ( not ( = ?auto_209308 ?auto_209310 ) ) ( not ( = ?auto_209308 ?auto_209309 ) ) ( not ( = ?auto_209308 ?auto_209311 ) ) ( not ( = ?auto_209308 ?auto_209307 ) ) ( not ( = ?auto_209308 ?auto_209306 ) ) ( not ( = ?auto_209310 ?auto_209309 ) ) ( not ( = ?auto_209310 ?auto_209311 ) ) ( not ( = ?auto_209310 ?auto_209307 ) ) ( not ( = ?auto_209310 ?auto_209306 ) ) ( not ( = ?auto_209309 ?auto_209311 ) ) ( not ( = ?auto_209309 ?auto_209307 ) ) ( not ( = ?auto_209309 ?auto_209306 ) ) ( not ( = ?auto_209303 ?auto_209308 ) ) ( not ( = ?auto_209303 ?auto_209310 ) ) ( not ( = ?auto_209303 ?auto_209309 ) ) ( not ( = ?auto_209304 ?auto_209308 ) ) ( not ( = ?auto_209304 ?auto_209310 ) ) ( not ( = ?auto_209304 ?auto_209309 ) ) ( not ( = ?auto_209305 ?auto_209308 ) ) ( not ( = ?auto_209305 ?auto_209310 ) ) ( not ( = ?auto_209305 ?auto_209309 ) ) ( ON ?auto_209305 ?auto_209306 ) ( ON ?auto_209304 ?auto_209305 ) ( CLEAR ?auto_209304 ) ( HOLDING ?auto_209303 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209303 )
      ( MAKE-5PILE ?auto_209303 ?auto_209304 ?auto_209305 ?auto_209306 ?auto_209307 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209312 - BLOCK
      ?auto_209313 - BLOCK
      ?auto_209314 - BLOCK
      ?auto_209315 - BLOCK
      ?auto_209316 - BLOCK
    )
    :vars
    (
      ?auto_209318 - BLOCK
      ?auto_209319 - BLOCK
      ?auto_209320 - BLOCK
      ?auto_209317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_209312 ?auto_209313 ) ) ( not ( = ?auto_209312 ?auto_209314 ) ) ( not ( = ?auto_209312 ?auto_209315 ) ) ( not ( = ?auto_209312 ?auto_209316 ) ) ( not ( = ?auto_209313 ?auto_209314 ) ) ( not ( = ?auto_209313 ?auto_209315 ) ) ( not ( = ?auto_209313 ?auto_209316 ) ) ( not ( = ?auto_209314 ?auto_209315 ) ) ( not ( = ?auto_209314 ?auto_209316 ) ) ( not ( = ?auto_209315 ?auto_209316 ) ) ( ON ?auto_209316 ?auto_209318 ) ( not ( = ?auto_209312 ?auto_209318 ) ) ( not ( = ?auto_209313 ?auto_209318 ) ) ( not ( = ?auto_209314 ?auto_209318 ) ) ( not ( = ?auto_209315 ?auto_209318 ) ) ( not ( = ?auto_209316 ?auto_209318 ) ) ( ON ?auto_209315 ?auto_209316 ) ( ON-TABLE ?auto_209319 ) ( ON ?auto_209320 ?auto_209319 ) ( ON ?auto_209317 ?auto_209320 ) ( ON ?auto_209318 ?auto_209317 ) ( not ( = ?auto_209319 ?auto_209320 ) ) ( not ( = ?auto_209319 ?auto_209317 ) ) ( not ( = ?auto_209319 ?auto_209318 ) ) ( not ( = ?auto_209319 ?auto_209316 ) ) ( not ( = ?auto_209319 ?auto_209315 ) ) ( not ( = ?auto_209320 ?auto_209317 ) ) ( not ( = ?auto_209320 ?auto_209318 ) ) ( not ( = ?auto_209320 ?auto_209316 ) ) ( not ( = ?auto_209320 ?auto_209315 ) ) ( not ( = ?auto_209317 ?auto_209318 ) ) ( not ( = ?auto_209317 ?auto_209316 ) ) ( not ( = ?auto_209317 ?auto_209315 ) ) ( not ( = ?auto_209312 ?auto_209319 ) ) ( not ( = ?auto_209312 ?auto_209320 ) ) ( not ( = ?auto_209312 ?auto_209317 ) ) ( not ( = ?auto_209313 ?auto_209319 ) ) ( not ( = ?auto_209313 ?auto_209320 ) ) ( not ( = ?auto_209313 ?auto_209317 ) ) ( not ( = ?auto_209314 ?auto_209319 ) ) ( not ( = ?auto_209314 ?auto_209320 ) ) ( not ( = ?auto_209314 ?auto_209317 ) ) ( ON ?auto_209314 ?auto_209315 ) ( ON ?auto_209313 ?auto_209314 ) ( ON ?auto_209312 ?auto_209313 ) ( CLEAR ?auto_209312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_209319 ?auto_209320 ?auto_209317 ?auto_209318 ?auto_209316 ?auto_209315 ?auto_209314 ?auto_209313 )
      ( MAKE-5PILE ?auto_209312 ?auto_209313 ?auto_209314 ?auto_209315 ?auto_209316 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209324 - BLOCK
      ?auto_209325 - BLOCK
      ?auto_209326 - BLOCK
    )
    :vars
    (
      ?auto_209327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209327 ?auto_209326 ) ( CLEAR ?auto_209327 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209324 ) ( ON ?auto_209325 ?auto_209324 ) ( ON ?auto_209326 ?auto_209325 ) ( not ( = ?auto_209324 ?auto_209325 ) ) ( not ( = ?auto_209324 ?auto_209326 ) ) ( not ( = ?auto_209324 ?auto_209327 ) ) ( not ( = ?auto_209325 ?auto_209326 ) ) ( not ( = ?auto_209325 ?auto_209327 ) ) ( not ( = ?auto_209326 ?auto_209327 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209327 ?auto_209326 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209328 - BLOCK
      ?auto_209329 - BLOCK
      ?auto_209330 - BLOCK
    )
    :vars
    (
      ?auto_209331 - BLOCK
      ?auto_209332 - BLOCK
      ?auto_209333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209331 ?auto_209330 ) ( CLEAR ?auto_209331 ) ( ON-TABLE ?auto_209328 ) ( ON ?auto_209329 ?auto_209328 ) ( ON ?auto_209330 ?auto_209329 ) ( not ( = ?auto_209328 ?auto_209329 ) ) ( not ( = ?auto_209328 ?auto_209330 ) ) ( not ( = ?auto_209328 ?auto_209331 ) ) ( not ( = ?auto_209329 ?auto_209330 ) ) ( not ( = ?auto_209329 ?auto_209331 ) ) ( not ( = ?auto_209330 ?auto_209331 ) ) ( HOLDING ?auto_209332 ) ( CLEAR ?auto_209333 ) ( not ( = ?auto_209328 ?auto_209332 ) ) ( not ( = ?auto_209328 ?auto_209333 ) ) ( not ( = ?auto_209329 ?auto_209332 ) ) ( not ( = ?auto_209329 ?auto_209333 ) ) ( not ( = ?auto_209330 ?auto_209332 ) ) ( not ( = ?auto_209330 ?auto_209333 ) ) ( not ( = ?auto_209331 ?auto_209332 ) ) ( not ( = ?auto_209331 ?auto_209333 ) ) ( not ( = ?auto_209332 ?auto_209333 ) ) )
    :subtasks
    ( ( !STACK ?auto_209332 ?auto_209333 )
      ( MAKE-3PILE ?auto_209328 ?auto_209329 ?auto_209330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209334 - BLOCK
      ?auto_209335 - BLOCK
      ?auto_209336 - BLOCK
    )
    :vars
    (
      ?auto_209337 - BLOCK
      ?auto_209338 - BLOCK
      ?auto_209339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209337 ?auto_209336 ) ( ON-TABLE ?auto_209334 ) ( ON ?auto_209335 ?auto_209334 ) ( ON ?auto_209336 ?auto_209335 ) ( not ( = ?auto_209334 ?auto_209335 ) ) ( not ( = ?auto_209334 ?auto_209336 ) ) ( not ( = ?auto_209334 ?auto_209337 ) ) ( not ( = ?auto_209335 ?auto_209336 ) ) ( not ( = ?auto_209335 ?auto_209337 ) ) ( not ( = ?auto_209336 ?auto_209337 ) ) ( CLEAR ?auto_209338 ) ( not ( = ?auto_209334 ?auto_209339 ) ) ( not ( = ?auto_209334 ?auto_209338 ) ) ( not ( = ?auto_209335 ?auto_209339 ) ) ( not ( = ?auto_209335 ?auto_209338 ) ) ( not ( = ?auto_209336 ?auto_209339 ) ) ( not ( = ?auto_209336 ?auto_209338 ) ) ( not ( = ?auto_209337 ?auto_209339 ) ) ( not ( = ?auto_209337 ?auto_209338 ) ) ( not ( = ?auto_209339 ?auto_209338 ) ) ( ON ?auto_209339 ?auto_209337 ) ( CLEAR ?auto_209339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209334 ?auto_209335 ?auto_209336 ?auto_209337 )
      ( MAKE-3PILE ?auto_209334 ?auto_209335 ?auto_209336 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209340 - BLOCK
      ?auto_209341 - BLOCK
      ?auto_209342 - BLOCK
    )
    :vars
    (
      ?auto_209343 - BLOCK
      ?auto_209344 - BLOCK
      ?auto_209345 - BLOCK
      ?auto_209347 - BLOCK
      ?auto_209348 - BLOCK
      ?auto_209346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209343 ?auto_209342 ) ( ON-TABLE ?auto_209340 ) ( ON ?auto_209341 ?auto_209340 ) ( ON ?auto_209342 ?auto_209341 ) ( not ( = ?auto_209340 ?auto_209341 ) ) ( not ( = ?auto_209340 ?auto_209342 ) ) ( not ( = ?auto_209340 ?auto_209343 ) ) ( not ( = ?auto_209341 ?auto_209342 ) ) ( not ( = ?auto_209341 ?auto_209343 ) ) ( not ( = ?auto_209342 ?auto_209343 ) ) ( not ( = ?auto_209340 ?auto_209344 ) ) ( not ( = ?auto_209340 ?auto_209345 ) ) ( not ( = ?auto_209341 ?auto_209344 ) ) ( not ( = ?auto_209341 ?auto_209345 ) ) ( not ( = ?auto_209342 ?auto_209344 ) ) ( not ( = ?auto_209342 ?auto_209345 ) ) ( not ( = ?auto_209343 ?auto_209344 ) ) ( not ( = ?auto_209343 ?auto_209345 ) ) ( not ( = ?auto_209344 ?auto_209345 ) ) ( ON ?auto_209344 ?auto_209343 ) ( CLEAR ?auto_209344 ) ( HOLDING ?auto_209345 ) ( CLEAR ?auto_209347 ) ( ON-TABLE ?auto_209348 ) ( ON ?auto_209346 ?auto_209348 ) ( ON ?auto_209347 ?auto_209346 ) ( not ( = ?auto_209348 ?auto_209346 ) ) ( not ( = ?auto_209348 ?auto_209347 ) ) ( not ( = ?auto_209348 ?auto_209345 ) ) ( not ( = ?auto_209346 ?auto_209347 ) ) ( not ( = ?auto_209346 ?auto_209345 ) ) ( not ( = ?auto_209347 ?auto_209345 ) ) ( not ( = ?auto_209340 ?auto_209347 ) ) ( not ( = ?auto_209340 ?auto_209348 ) ) ( not ( = ?auto_209340 ?auto_209346 ) ) ( not ( = ?auto_209341 ?auto_209347 ) ) ( not ( = ?auto_209341 ?auto_209348 ) ) ( not ( = ?auto_209341 ?auto_209346 ) ) ( not ( = ?auto_209342 ?auto_209347 ) ) ( not ( = ?auto_209342 ?auto_209348 ) ) ( not ( = ?auto_209342 ?auto_209346 ) ) ( not ( = ?auto_209343 ?auto_209347 ) ) ( not ( = ?auto_209343 ?auto_209348 ) ) ( not ( = ?auto_209343 ?auto_209346 ) ) ( not ( = ?auto_209344 ?auto_209347 ) ) ( not ( = ?auto_209344 ?auto_209348 ) ) ( not ( = ?auto_209344 ?auto_209346 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209348 ?auto_209346 ?auto_209347 ?auto_209345 )
      ( MAKE-3PILE ?auto_209340 ?auto_209341 ?auto_209342 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209349 - BLOCK
      ?auto_209350 - BLOCK
      ?auto_209351 - BLOCK
    )
    :vars
    (
      ?auto_209357 - BLOCK
      ?auto_209353 - BLOCK
      ?auto_209355 - BLOCK
      ?auto_209356 - BLOCK
      ?auto_209354 - BLOCK
      ?auto_209352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209357 ?auto_209351 ) ( ON-TABLE ?auto_209349 ) ( ON ?auto_209350 ?auto_209349 ) ( ON ?auto_209351 ?auto_209350 ) ( not ( = ?auto_209349 ?auto_209350 ) ) ( not ( = ?auto_209349 ?auto_209351 ) ) ( not ( = ?auto_209349 ?auto_209357 ) ) ( not ( = ?auto_209350 ?auto_209351 ) ) ( not ( = ?auto_209350 ?auto_209357 ) ) ( not ( = ?auto_209351 ?auto_209357 ) ) ( not ( = ?auto_209349 ?auto_209353 ) ) ( not ( = ?auto_209349 ?auto_209355 ) ) ( not ( = ?auto_209350 ?auto_209353 ) ) ( not ( = ?auto_209350 ?auto_209355 ) ) ( not ( = ?auto_209351 ?auto_209353 ) ) ( not ( = ?auto_209351 ?auto_209355 ) ) ( not ( = ?auto_209357 ?auto_209353 ) ) ( not ( = ?auto_209357 ?auto_209355 ) ) ( not ( = ?auto_209353 ?auto_209355 ) ) ( ON ?auto_209353 ?auto_209357 ) ( CLEAR ?auto_209356 ) ( ON-TABLE ?auto_209354 ) ( ON ?auto_209352 ?auto_209354 ) ( ON ?auto_209356 ?auto_209352 ) ( not ( = ?auto_209354 ?auto_209352 ) ) ( not ( = ?auto_209354 ?auto_209356 ) ) ( not ( = ?auto_209354 ?auto_209355 ) ) ( not ( = ?auto_209352 ?auto_209356 ) ) ( not ( = ?auto_209352 ?auto_209355 ) ) ( not ( = ?auto_209356 ?auto_209355 ) ) ( not ( = ?auto_209349 ?auto_209356 ) ) ( not ( = ?auto_209349 ?auto_209354 ) ) ( not ( = ?auto_209349 ?auto_209352 ) ) ( not ( = ?auto_209350 ?auto_209356 ) ) ( not ( = ?auto_209350 ?auto_209354 ) ) ( not ( = ?auto_209350 ?auto_209352 ) ) ( not ( = ?auto_209351 ?auto_209356 ) ) ( not ( = ?auto_209351 ?auto_209354 ) ) ( not ( = ?auto_209351 ?auto_209352 ) ) ( not ( = ?auto_209357 ?auto_209356 ) ) ( not ( = ?auto_209357 ?auto_209354 ) ) ( not ( = ?auto_209357 ?auto_209352 ) ) ( not ( = ?auto_209353 ?auto_209356 ) ) ( not ( = ?auto_209353 ?auto_209354 ) ) ( not ( = ?auto_209353 ?auto_209352 ) ) ( ON ?auto_209355 ?auto_209353 ) ( CLEAR ?auto_209355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209349 ?auto_209350 ?auto_209351 ?auto_209357 ?auto_209353 )
      ( MAKE-3PILE ?auto_209349 ?auto_209350 ?auto_209351 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209358 - BLOCK
      ?auto_209359 - BLOCK
      ?auto_209360 - BLOCK
    )
    :vars
    (
      ?auto_209365 - BLOCK
      ?auto_209364 - BLOCK
      ?auto_209366 - BLOCK
      ?auto_209362 - BLOCK
      ?auto_209361 - BLOCK
      ?auto_209363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209365 ?auto_209360 ) ( ON-TABLE ?auto_209358 ) ( ON ?auto_209359 ?auto_209358 ) ( ON ?auto_209360 ?auto_209359 ) ( not ( = ?auto_209358 ?auto_209359 ) ) ( not ( = ?auto_209358 ?auto_209360 ) ) ( not ( = ?auto_209358 ?auto_209365 ) ) ( not ( = ?auto_209359 ?auto_209360 ) ) ( not ( = ?auto_209359 ?auto_209365 ) ) ( not ( = ?auto_209360 ?auto_209365 ) ) ( not ( = ?auto_209358 ?auto_209364 ) ) ( not ( = ?auto_209358 ?auto_209366 ) ) ( not ( = ?auto_209359 ?auto_209364 ) ) ( not ( = ?auto_209359 ?auto_209366 ) ) ( not ( = ?auto_209360 ?auto_209364 ) ) ( not ( = ?auto_209360 ?auto_209366 ) ) ( not ( = ?auto_209365 ?auto_209364 ) ) ( not ( = ?auto_209365 ?auto_209366 ) ) ( not ( = ?auto_209364 ?auto_209366 ) ) ( ON ?auto_209364 ?auto_209365 ) ( ON-TABLE ?auto_209362 ) ( ON ?auto_209361 ?auto_209362 ) ( not ( = ?auto_209362 ?auto_209361 ) ) ( not ( = ?auto_209362 ?auto_209363 ) ) ( not ( = ?auto_209362 ?auto_209366 ) ) ( not ( = ?auto_209361 ?auto_209363 ) ) ( not ( = ?auto_209361 ?auto_209366 ) ) ( not ( = ?auto_209363 ?auto_209366 ) ) ( not ( = ?auto_209358 ?auto_209363 ) ) ( not ( = ?auto_209358 ?auto_209362 ) ) ( not ( = ?auto_209358 ?auto_209361 ) ) ( not ( = ?auto_209359 ?auto_209363 ) ) ( not ( = ?auto_209359 ?auto_209362 ) ) ( not ( = ?auto_209359 ?auto_209361 ) ) ( not ( = ?auto_209360 ?auto_209363 ) ) ( not ( = ?auto_209360 ?auto_209362 ) ) ( not ( = ?auto_209360 ?auto_209361 ) ) ( not ( = ?auto_209365 ?auto_209363 ) ) ( not ( = ?auto_209365 ?auto_209362 ) ) ( not ( = ?auto_209365 ?auto_209361 ) ) ( not ( = ?auto_209364 ?auto_209363 ) ) ( not ( = ?auto_209364 ?auto_209362 ) ) ( not ( = ?auto_209364 ?auto_209361 ) ) ( ON ?auto_209366 ?auto_209364 ) ( CLEAR ?auto_209366 ) ( HOLDING ?auto_209363 ) ( CLEAR ?auto_209361 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209362 ?auto_209361 ?auto_209363 )
      ( MAKE-3PILE ?auto_209358 ?auto_209359 ?auto_209360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209367 - BLOCK
      ?auto_209368 - BLOCK
      ?auto_209369 - BLOCK
    )
    :vars
    (
      ?auto_209370 - BLOCK
      ?auto_209374 - BLOCK
      ?auto_209371 - BLOCK
      ?auto_209372 - BLOCK
      ?auto_209373 - BLOCK
      ?auto_209375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209370 ?auto_209369 ) ( ON-TABLE ?auto_209367 ) ( ON ?auto_209368 ?auto_209367 ) ( ON ?auto_209369 ?auto_209368 ) ( not ( = ?auto_209367 ?auto_209368 ) ) ( not ( = ?auto_209367 ?auto_209369 ) ) ( not ( = ?auto_209367 ?auto_209370 ) ) ( not ( = ?auto_209368 ?auto_209369 ) ) ( not ( = ?auto_209368 ?auto_209370 ) ) ( not ( = ?auto_209369 ?auto_209370 ) ) ( not ( = ?auto_209367 ?auto_209374 ) ) ( not ( = ?auto_209367 ?auto_209371 ) ) ( not ( = ?auto_209368 ?auto_209374 ) ) ( not ( = ?auto_209368 ?auto_209371 ) ) ( not ( = ?auto_209369 ?auto_209374 ) ) ( not ( = ?auto_209369 ?auto_209371 ) ) ( not ( = ?auto_209370 ?auto_209374 ) ) ( not ( = ?auto_209370 ?auto_209371 ) ) ( not ( = ?auto_209374 ?auto_209371 ) ) ( ON ?auto_209374 ?auto_209370 ) ( ON-TABLE ?auto_209372 ) ( ON ?auto_209373 ?auto_209372 ) ( not ( = ?auto_209372 ?auto_209373 ) ) ( not ( = ?auto_209372 ?auto_209375 ) ) ( not ( = ?auto_209372 ?auto_209371 ) ) ( not ( = ?auto_209373 ?auto_209375 ) ) ( not ( = ?auto_209373 ?auto_209371 ) ) ( not ( = ?auto_209375 ?auto_209371 ) ) ( not ( = ?auto_209367 ?auto_209375 ) ) ( not ( = ?auto_209367 ?auto_209372 ) ) ( not ( = ?auto_209367 ?auto_209373 ) ) ( not ( = ?auto_209368 ?auto_209375 ) ) ( not ( = ?auto_209368 ?auto_209372 ) ) ( not ( = ?auto_209368 ?auto_209373 ) ) ( not ( = ?auto_209369 ?auto_209375 ) ) ( not ( = ?auto_209369 ?auto_209372 ) ) ( not ( = ?auto_209369 ?auto_209373 ) ) ( not ( = ?auto_209370 ?auto_209375 ) ) ( not ( = ?auto_209370 ?auto_209372 ) ) ( not ( = ?auto_209370 ?auto_209373 ) ) ( not ( = ?auto_209374 ?auto_209375 ) ) ( not ( = ?auto_209374 ?auto_209372 ) ) ( not ( = ?auto_209374 ?auto_209373 ) ) ( ON ?auto_209371 ?auto_209374 ) ( CLEAR ?auto_209373 ) ( ON ?auto_209375 ?auto_209371 ) ( CLEAR ?auto_209375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209367 ?auto_209368 ?auto_209369 ?auto_209370 ?auto_209374 ?auto_209371 )
      ( MAKE-3PILE ?auto_209367 ?auto_209368 ?auto_209369 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209376 - BLOCK
      ?auto_209377 - BLOCK
      ?auto_209378 - BLOCK
    )
    :vars
    (
      ?auto_209383 - BLOCK
      ?auto_209384 - BLOCK
      ?auto_209379 - BLOCK
      ?auto_209380 - BLOCK
      ?auto_209381 - BLOCK
      ?auto_209382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209383 ?auto_209378 ) ( ON-TABLE ?auto_209376 ) ( ON ?auto_209377 ?auto_209376 ) ( ON ?auto_209378 ?auto_209377 ) ( not ( = ?auto_209376 ?auto_209377 ) ) ( not ( = ?auto_209376 ?auto_209378 ) ) ( not ( = ?auto_209376 ?auto_209383 ) ) ( not ( = ?auto_209377 ?auto_209378 ) ) ( not ( = ?auto_209377 ?auto_209383 ) ) ( not ( = ?auto_209378 ?auto_209383 ) ) ( not ( = ?auto_209376 ?auto_209384 ) ) ( not ( = ?auto_209376 ?auto_209379 ) ) ( not ( = ?auto_209377 ?auto_209384 ) ) ( not ( = ?auto_209377 ?auto_209379 ) ) ( not ( = ?auto_209378 ?auto_209384 ) ) ( not ( = ?auto_209378 ?auto_209379 ) ) ( not ( = ?auto_209383 ?auto_209384 ) ) ( not ( = ?auto_209383 ?auto_209379 ) ) ( not ( = ?auto_209384 ?auto_209379 ) ) ( ON ?auto_209384 ?auto_209383 ) ( ON-TABLE ?auto_209380 ) ( not ( = ?auto_209380 ?auto_209381 ) ) ( not ( = ?auto_209380 ?auto_209382 ) ) ( not ( = ?auto_209380 ?auto_209379 ) ) ( not ( = ?auto_209381 ?auto_209382 ) ) ( not ( = ?auto_209381 ?auto_209379 ) ) ( not ( = ?auto_209382 ?auto_209379 ) ) ( not ( = ?auto_209376 ?auto_209382 ) ) ( not ( = ?auto_209376 ?auto_209380 ) ) ( not ( = ?auto_209376 ?auto_209381 ) ) ( not ( = ?auto_209377 ?auto_209382 ) ) ( not ( = ?auto_209377 ?auto_209380 ) ) ( not ( = ?auto_209377 ?auto_209381 ) ) ( not ( = ?auto_209378 ?auto_209382 ) ) ( not ( = ?auto_209378 ?auto_209380 ) ) ( not ( = ?auto_209378 ?auto_209381 ) ) ( not ( = ?auto_209383 ?auto_209382 ) ) ( not ( = ?auto_209383 ?auto_209380 ) ) ( not ( = ?auto_209383 ?auto_209381 ) ) ( not ( = ?auto_209384 ?auto_209382 ) ) ( not ( = ?auto_209384 ?auto_209380 ) ) ( not ( = ?auto_209384 ?auto_209381 ) ) ( ON ?auto_209379 ?auto_209384 ) ( ON ?auto_209382 ?auto_209379 ) ( CLEAR ?auto_209382 ) ( HOLDING ?auto_209381 ) ( CLEAR ?auto_209380 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209380 ?auto_209381 )
      ( MAKE-3PILE ?auto_209376 ?auto_209377 ?auto_209378 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209385 - BLOCK
      ?auto_209386 - BLOCK
      ?auto_209387 - BLOCK
    )
    :vars
    (
      ?auto_209392 - BLOCK
      ?auto_209391 - BLOCK
      ?auto_209389 - BLOCK
      ?auto_209393 - BLOCK
      ?auto_209390 - BLOCK
      ?auto_209388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209392 ?auto_209387 ) ( ON-TABLE ?auto_209385 ) ( ON ?auto_209386 ?auto_209385 ) ( ON ?auto_209387 ?auto_209386 ) ( not ( = ?auto_209385 ?auto_209386 ) ) ( not ( = ?auto_209385 ?auto_209387 ) ) ( not ( = ?auto_209385 ?auto_209392 ) ) ( not ( = ?auto_209386 ?auto_209387 ) ) ( not ( = ?auto_209386 ?auto_209392 ) ) ( not ( = ?auto_209387 ?auto_209392 ) ) ( not ( = ?auto_209385 ?auto_209391 ) ) ( not ( = ?auto_209385 ?auto_209389 ) ) ( not ( = ?auto_209386 ?auto_209391 ) ) ( not ( = ?auto_209386 ?auto_209389 ) ) ( not ( = ?auto_209387 ?auto_209391 ) ) ( not ( = ?auto_209387 ?auto_209389 ) ) ( not ( = ?auto_209392 ?auto_209391 ) ) ( not ( = ?auto_209392 ?auto_209389 ) ) ( not ( = ?auto_209391 ?auto_209389 ) ) ( ON ?auto_209391 ?auto_209392 ) ( ON-TABLE ?auto_209393 ) ( not ( = ?auto_209393 ?auto_209390 ) ) ( not ( = ?auto_209393 ?auto_209388 ) ) ( not ( = ?auto_209393 ?auto_209389 ) ) ( not ( = ?auto_209390 ?auto_209388 ) ) ( not ( = ?auto_209390 ?auto_209389 ) ) ( not ( = ?auto_209388 ?auto_209389 ) ) ( not ( = ?auto_209385 ?auto_209388 ) ) ( not ( = ?auto_209385 ?auto_209393 ) ) ( not ( = ?auto_209385 ?auto_209390 ) ) ( not ( = ?auto_209386 ?auto_209388 ) ) ( not ( = ?auto_209386 ?auto_209393 ) ) ( not ( = ?auto_209386 ?auto_209390 ) ) ( not ( = ?auto_209387 ?auto_209388 ) ) ( not ( = ?auto_209387 ?auto_209393 ) ) ( not ( = ?auto_209387 ?auto_209390 ) ) ( not ( = ?auto_209392 ?auto_209388 ) ) ( not ( = ?auto_209392 ?auto_209393 ) ) ( not ( = ?auto_209392 ?auto_209390 ) ) ( not ( = ?auto_209391 ?auto_209388 ) ) ( not ( = ?auto_209391 ?auto_209393 ) ) ( not ( = ?auto_209391 ?auto_209390 ) ) ( ON ?auto_209389 ?auto_209391 ) ( ON ?auto_209388 ?auto_209389 ) ( CLEAR ?auto_209393 ) ( ON ?auto_209390 ?auto_209388 ) ( CLEAR ?auto_209390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209385 ?auto_209386 ?auto_209387 ?auto_209392 ?auto_209391 ?auto_209389 ?auto_209388 )
      ( MAKE-3PILE ?auto_209385 ?auto_209386 ?auto_209387 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209394 - BLOCK
      ?auto_209395 - BLOCK
      ?auto_209396 - BLOCK
    )
    :vars
    (
      ?auto_209402 - BLOCK
      ?auto_209401 - BLOCK
      ?auto_209399 - BLOCK
      ?auto_209400 - BLOCK
      ?auto_209398 - BLOCK
      ?auto_209397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209402 ?auto_209396 ) ( ON-TABLE ?auto_209394 ) ( ON ?auto_209395 ?auto_209394 ) ( ON ?auto_209396 ?auto_209395 ) ( not ( = ?auto_209394 ?auto_209395 ) ) ( not ( = ?auto_209394 ?auto_209396 ) ) ( not ( = ?auto_209394 ?auto_209402 ) ) ( not ( = ?auto_209395 ?auto_209396 ) ) ( not ( = ?auto_209395 ?auto_209402 ) ) ( not ( = ?auto_209396 ?auto_209402 ) ) ( not ( = ?auto_209394 ?auto_209401 ) ) ( not ( = ?auto_209394 ?auto_209399 ) ) ( not ( = ?auto_209395 ?auto_209401 ) ) ( not ( = ?auto_209395 ?auto_209399 ) ) ( not ( = ?auto_209396 ?auto_209401 ) ) ( not ( = ?auto_209396 ?auto_209399 ) ) ( not ( = ?auto_209402 ?auto_209401 ) ) ( not ( = ?auto_209402 ?auto_209399 ) ) ( not ( = ?auto_209401 ?auto_209399 ) ) ( ON ?auto_209401 ?auto_209402 ) ( not ( = ?auto_209400 ?auto_209398 ) ) ( not ( = ?auto_209400 ?auto_209397 ) ) ( not ( = ?auto_209400 ?auto_209399 ) ) ( not ( = ?auto_209398 ?auto_209397 ) ) ( not ( = ?auto_209398 ?auto_209399 ) ) ( not ( = ?auto_209397 ?auto_209399 ) ) ( not ( = ?auto_209394 ?auto_209397 ) ) ( not ( = ?auto_209394 ?auto_209400 ) ) ( not ( = ?auto_209394 ?auto_209398 ) ) ( not ( = ?auto_209395 ?auto_209397 ) ) ( not ( = ?auto_209395 ?auto_209400 ) ) ( not ( = ?auto_209395 ?auto_209398 ) ) ( not ( = ?auto_209396 ?auto_209397 ) ) ( not ( = ?auto_209396 ?auto_209400 ) ) ( not ( = ?auto_209396 ?auto_209398 ) ) ( not ( = ?auto_209402 ?auto_209397 ) ) ( not ( = ?auto_209402 ?auto_209400 ) ) ( not ( = ?auto_209402 ?auto_209398 ) ) ( not ( = ?auto_209401 ?auto_209397 ) ) ( not ( = ?auto_209401 ?auto_209400 ) ) ( not ( = ?auto_209401 ?auto_209398 ) ) ( ON ?auto_209399 ?auto_209401 ) ( ON ?auto_209397 ?auto_209399 ) ( ON ?auto_209398 ?auto_209397 ) ( CLEAR ?auto_209398 ) ( HOLDING ?auto_209400 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209400 )
      ( MAKE-3PILE ?auto_209394 ?auto_209395 ?auto_209396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209403 - BLOCK
      ?auto_209404 - BLOCK
      ?auto_209405 - BLOCK
    )
    :vars
    (
      ?auto_209408 - BLOCK
      ?auto_209406 - BLOCK
      ?auto_209410 - BLOCK
      ?auto_209409 - BLOCK
      ?auto_209411 - BLOCK
      ?auto_209407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209408 ?auto_209405 ) ( ON-TABLE ?auto_209403 ) ( ON ?auto_209404 ?auto_209403 ) ( ON ?auto_209405 ?auto_209404 ) ( not ( = ?auto_209403 ?auto_209404 ) ) ( not ( = ?auto_209403 ?auto_209405 ) ) ( not ( = ?auto_209403 ?auto_209408 ) ) ( not ( = ?auto_209404 ?auto_209405 ) ) ( not ( = ?auto_209404 ?auto_209408 ) ) ( not ( = ?auto_209405 ?auto_209408 ) ) ( not ( = ?auto_209403 ?auto_209406 ) ) ( not ( = ?auto_209403 ?auto_209410 ) ) ( not ( = ?auto_209404 ?auto_209406 ) ) ( not ( = ?auto_209404 ?auto_209410 ) ) ( not ( = ?auto_209405 ?auto_209406 ) ) ( not ( = ?auto_209405 ?auto_209410 ) ) ( not ( = ?auto_209408 ?auto_209406 ) ) ( not ( = ?auto_209408 ?auto_209410 ) ) ( not ( = ?auto_209406 ?auto_209410 ) ) ( ON ?auto_209406 ?auto_209408 ) ( not ( = ?auto_209409 ?auto_209411 ) ) ( not ( = ?auto_209409 ?auto_209407 ) ) ( not ( = ?auto_209409 ?auto_209410 ) ) ( not ( = ?auto_209411 ?auto_209407 ) ) ( not ( = ?auto_209411 ?auto_209410 ) ) ( not ( = ?auto_209407 ?auto_209410 ) ) ( not ( = ?auto_209403 ?auto_209407 ) ) ( not ( = ?auto_209403 ?auto_209409 ) ) ( not ( = ?auto_209403 ?auto_209411 ) ) ( not ( = ?auto_209404 ?auto_209407 ) ) ( not ( = ?auto_209404 ?auto_209409 ) ) ( not ( = ?auto_209404 ?auto_209411 ) ) ( not ( = ?auto_209405 ?auto_209407 ) ) ( not ( = ?auto_209405 ?auto_209409 ) ) ( not ( = ?auto_209405 ?auto_209411 ) ) ( not ( = ?auto_209408 ?auto_209407 ) ) ( not ( = ?auto_209408 ?auto_209409 ) ) ( not ( = ?auto_209408 ?auto_209411 ) ) ( not ( = ?auto_209406 ?auto_209407 ) ) ( not ( = ?auto_209406 ?auto_209409 ) ) ( not ( = ?auto_209406 ?auto_209411 ) ) ( ON ?auto_209410 ?auto_209406 ) ( ON ?auto_209407 ?auto_209410 ) ( ON ?auto_209411 ?auto_209407 ) ( ON ?auto_209409 ?auto_209411 ) ( CLEAR ?auto_209409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_209403 ?auto_209404 ?auto_209405 ?auto_209408 ?auto_209406 ?auto_209410 ?auto_209407 ?auto_209411 )
      ( MAKE-3PILE ?auto_209403 ?auto_209404 ?auto_209405 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209418 - BLOCK
      ?auto_209419 - BLOCK
      ?auto_209420 - BLOCK
      ?auto_209421 - BLOCK
      ?auto_209422 - BLOCK
      ?auto_209423 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_209423 ) ( CLEAR ?auto_209422 ) ( ON-TABLE ?auto_209418 ) ( ON ?auto_209419 ?auto_209418 ) ( ON ?auto_209420 ?auto_209419 ) ( ON ?auto_209421 ?auto_209420 ) ( ON ?auto_209422 ?auto_209421 ) ( not ( = ?auto_209418 ?auto_209419 ) ) ( not ( = ?auto_209418 ?auto_209420 ) ) ( not ( = ?auto_209418 ?auto_209421 ) ) ( not ( = ?auto_209418 ?auto_209422 ) ) ( not ( = ?auto_209418 ?auto_209423 ) ) ( not ( = ?auto_209419 ?auto_209420 ) ) ( not ( = ?auto_209419 ?auto_209421 ) ) ( not ( = ?auto_209419 ?auto_209422 ) ) ( not ( = ?auto_209419 ?auto_209423 ) ) ( not ( = ?auto_209420 ?auto_209421 ) ) ( not ( = ?auto_209420 ?auto_209422 ) ) ( not ( = ?auto_209420 ?auto_209423 ) ) ( not ( = ?auto_209421 ?auto_209422 ) ) ( not ( = ?auto_209421 ?auto_209423 ) ) ( not ( = ?auto_209422 ?auto_209423 ) ) )
    :subtasks
    ( ( !STACK ?auto_209423 ?auto_209422 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209424 - BLOCK
      ?auto_209425 - BLOCK
      ?auto_209426 - BLOCK
      ?auto_209427 - BLOCK
      ?auto_209428 - BLOCK
      ?auto_209429 - BLOCK
    )
    :vars
    (
      ?auto_209430 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_209428 ) ( ON-TABLE ?auto_209424 ) ( ON ?auto_209425 ?auto_209424 ) ( ON ?auto_209426 ?auto_209425 ) ( ON ?auto_209427 ?auto_209426 ) ( ON ?auto_209428 ?auto_209427 ) ( not ( = ?auto_209424 ?auto_209425 ) ) ( not ( = ?auto_209424 ?auto_209426 ) ) ( not ( = ?auto_209424 ?auto_209427 ) ) ( not ( = ?auto_209424 ?auto_209428 ) ) ( not ( = ?auto_209424 ?auto_209429 ) ) ( not ( = ?auto_209425 ?auto_209426 ) ) ( not ( = ?auto_209425 ?auto_209427 ) ) ( not ( = ?auto_209425 ?auto_209428 ) ) ( not ( = ?auto_209425 ?auto_209429 ) ) ( not ( = ?auto_209426 ?auto_209427 ) ) ( not ( = ?auto_209426 ?auto_209428 ) ) ( not ( = ?auto_209426 ?auto_209429 ) ) ( not ( = ?auto_209427 ?auto_209428 ) ) ( not ( = ?auto_209427 ?auto_209429 ) ) ( not ( = ?auto_209428 ?auto_209429 ) ) ( ON ?auto_209429 ?auto_209430 ) ( CLEAR ?auto_209429 ) ( HAND-EMPTY ) ( not ( = ?auto_209424 ?auto_209430 ) ) ( not ( = ?auto_209425 ?auto_209430 ) ) ( not ( = ?auto_209426 ?auto_209430 ) ) ( not ( = ?auto_209427 ?auto_209430 ) ) ( not ( = ?auto_209428 ?auto_209430 ) ) ( not ( = ?auto_209429 ?auto_209430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209429 ?auto_209430 )
      ( MAKE-6PILE ?auto_209424 ?auto_209425 ?auto_209426 ?auto_209427 ?auto_209428 ?auto_209429 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209431 - BLOCK
      ?auto_209432 - BLOCK
      ?auto_209433 - BLOCK
      ?auto_209434 - BLOCK
      ?auto_209435 - BLOCK
      ?auto_209436 - BLOCK
    )
    :vars
    (
      ?auto_209437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209431 ) ( ON ?auto_209432 ?auto_209431 ) ( ON ?auto_209433 ?auto_209432 ) ( ON ?auto_209434 ?auto_209433 ) ( not ( = ?auto_209431 ?auto_209432 ) ) ( not ( = ?auto_209431 ?auto_209433 ) ) ( not ( = ?auto_209431 ?auto_209434 ) ) ( not ( = ?auto_209431 ?auto_209435 ) ) ( not ( = ?auto_209431 ?auto_209436 ) ) ( not ( = ?auto_209432 ?auto_209433 ) ) ( not ( = ?auto_209432 ?auto_209434 ) ) ( not ( = ?auto_209432 ?auto_209435 ) ) ( not ( = ?auto_209432 ?auto_209436 ) ) ( not ( = ?auto_209433 ?auto_209434 ) ) ( not ( = ?auto_209433 ?auto_209435 ) ) ( not ( = ?auto_209433 ?auto_209436 ) ) ( not ( = ?auto_209434 ?auto_209435 ) ) ( not ( = ?auto_209434 ?auto_209436 ) ) ( not ( = ?auto_209435 ?auto_209436 ) ) ( ON ?auto_209436 ?auto_209437 ) ( CLEAR ?auto_209436 ) ( not ( = ?auto_209431 ?auto_209437 ) ) ( not ( = ?auto_209432 ?auto_209437 ) ) ( not ( = ?auto_209433 ?auto_209437 ) ) ( not ( = ?auto_209434 ?auto_209437 ) ) ( not ( = ?auto_209435 ?auto_209437 ) ) ( not ( = ?auto_209436 ?auto_209437 ) ) ( HOLDING ?auto_209435 ) ( CLEAR ?auto_209434 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209431 ?auto_209432 ?auto_209433 ?auto_209434 ?auto_209435 )
      ( MAKE-6PILE ?auto_209431 ?auto_209432 ?auto_209433 ?auto_209434 ?auto_209435 ?auto_209436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209438 - BLOCK
      ?auto_209439 - BLOCK
      ?auto_209440 - BLOCK
      ?auto_209441 - BLOCK
      ?auto_209442 - BLOCK
      ?auto_209443 - BLOCK
    )
    :vars
    (
      ?auto_209444 - BLOCK
      ?auto_209445 - BLOCK
      ?auto_209446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209438 ) ( ON ?auto_209439 ?auto_209438 ) ( ON ?auto_209440 ?auto_209439 ) ( ON ?auto_209441 ?auto_209440 ) ( not ( = ?auto_209438 ?auto_209439 ) ) ( not ( = ?auto_209438 ?auto_209440 ) ) ( not ( = ?auto_209438 ?auto_209441 ) ) ( not ( = ?auto_209438 ?auto_209442 ) ) ( not ( = ?auto_209438 ?auto_209443 ) ) ( not ( = ?auto_209439 ?auto_209440 ) ) ( not ( = ?auto_209439 ?auto_209441 ) ) ( not ( = ?auto_209439 ?auto_209442 ) ) ( not ( = ?auto_209439 ?auto_209443 ) ) ( not ( = ?auto_209440 ?auto_209441 ) ) ( not ( = ?auto_209440 ?auto_209442 ) ) ( not ( = ?auto_209440 ?auto_209443 ) ) ( not ( = ?auto_209441 ?auto_209442 ) ) ( not ( = ?auto_209441 ?auto_209443 ) ) ( not ( = ?auto_209442 ?auto_209443 ) ) ( ON ?auto_209443 ?auto_209444 ) ( not ( = ?auto_209438 ?auto_209444 ) ) ( not ( = ?auto_209439 ?auto_209444 ) ) ( not ( = ?auto_209440 ?auto_209444 ) ) ( not ( = ?auto_209441 ?auto_209444 ) ) ( not ( = ?auto_209442 ?auto_209444 ) ) ( not ( = ?auto_209443 ?auto_209444 ) ) ( CLEAR ?auto_209441 ) ( ON ?auto_209442 ?auto_209443 ) ( CLEAR ?auto_209442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209445 ) ( ON ?auto_209446 ?auto_209445 ) ( ON ?auto_209444 ?auto_209446 ) ( not ( = ?auto_209445 ?auto_209446 ) ) ( not ( = ?auto_209445 ?auto_209444 ) ) ( not ( = ?auto_209445 ?auto_209443 ) ) ( not ( = ?auto_209445 ?auto_209442 ) ) ( not ( = ?auto_209446 ?auto_209444 ) ) ( not ( = ?auto_209446 ?auto_209443 ) ) ( not ( = ?auto_209446 ?auto_209442 ) ) ( not ( = ?auto_209438 ?auto_209445 ) ) ( not ( = ?auto_209438 ?auto_209446 ) ) ( not ( = ?auto_209439 ?auto_209445 ) ) ( not ( = ?auto_209439 ?auto_209446 ) ) ( not ( = ?auto_209440 ?auto_209445 ) ) ( not ( = ?auto_209440 ?auto_209446 ) ) ( not ( = ?auto_209441 ?auto_209445 ) ) ( not ( = ?auto_209441 ?auto_209446 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209445 ?auto_209446 ?auto_209444 ?auto_209443 )
      ( MAKE-6PILE ?auto_209438 ?auto_209439 ?auto_209440 ?auto_209441 ?auto_209442 ?auto_209443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209447 - BLOCK
      ?auto_209448 - BLOCK
      ?auto_209449 - BLOCK
      ?auto_209450 - BLOCK
      ?auto_209451 - BLOCK
      ?auto_209452 - BLOCK
    )
    :vars
    (
      ?auto_209455 - BLOCK
      ?auto_209453 - BLOCK
      ?auto_209454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209447 ) ( ON ?auto_209448 ?auto_209447 ) ( ON ?auto_209449 ?auto_209448 ) ( not ( = ?auto_209447 ?auto_209448 ) ) ( not ( = ?auto_209447 ?auto_209449 ) ) ( not ( = ?auto_209447 ?auto_209450 ) ) ( not ( = ?auto_209447 ?auto_209451 ) ) ( not ( = ?auto_209447 ?auto_209452 ) ) ( not ( = ?auto_209448 ?auto_209449 ) ) ( not ( = ?auto_209448 ?auto_209450 ) ) ( not ( = ?auto_209448 ?auto_209451 ) ) ( not ( = ?auto_209448 ?auto_209452 ) ) ( not ( = ?auto_209449 ?auto_209450 ) ) ( not ( = ?auto_209449 ?auto_209451 ) ) ( not ( = ?auto_209449 ?auto_209452 ) ) ( not ( = ?auto_209450 ?auto_209451 ) ) ( not ( = ?auto_209450 ?auto_209452 ) ) ( not ( = ?auto_209451 ?auto_209452 ) ) ( ON ?auto_209452 ?auto_209455 ) ( not ( = ?auto_209447 ?auto_209455 ) ) ( not ( = ?auto_209448 ?auto_209455 ) ) ( not ( = ?auto_209449 ?auto_209455 ) ) ( not ( = ?auto_209450 ?auto_209455 ) ) ( not ( = ?auto_209451 ?auto_209455 ) ) ( not ( = ?auto_209452 ?auto_209455 ) ) ( ON ?auto_209451 ?auto_209452 ) ( CLEAR ?auto_209451 ) ( ON-TABLE ?auto_209453 ) ( ON ?auto_209454 ?auto_209453 ) ( ON ?auto_209455 ?auto_209454 ) ( not ( = ?auto_209453 ?auto_209454 ) ) ( not ( = ?auto_209453 ?auto_209455 ) ) ( not ( = ?auto_209453 ?auto_209452 ) ) ( not ( = ?auto_209453 ?auto_209451 ) ) ( not ( = ?auto_209454 ?auto_209455 ) ) ( not ( = ?auto_209454 ?auto_209452 ) ) ( not ( = ?auto_209454 ?auto_209451 ) ) ( not ( = ?auto_209447 ?auto_209453 ) ) ( not ( = ?auto_209447 ?auto_209454 ) ) ( not ( = ?auto_209448 ?auto_209453 ) ) ( not ( = ?auto_209448 ?auto_209454 ) ) ( not ( = ?auto_209449 ?auto_209453 ) ) ( not ( = ?auto_209449 ?auto_209454 ) ) ( not ( = ?auto_209450 ?auto_209453 ) ) ( not ( = ?auto_209450 ?auto_209454 ) ) ( HOLDING ?auto_209450 ) ( CLEAR ?auto_209449 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209447 ?auto_209448 ?auto_209449 ?auto_209450 )
      ( MAKE-6PILE ?auto_209447 ?auto_209448 ?auto_209449 ?auto_209450 ?auto_209451 ?auto_209452 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209456 - BLOCK
      ?auto_209457 - BLOCK
      ?auto_209458 - BLOCK
      ?auto_209459 - BLOCK
      ?auto_209460 - BLOCK
      ?auto_209461 - BLOCK
    )
    :vars
    (
      ?auto_209463 - BLOCK
      ?auto_209464 - BLOCK
      ?auto_209462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209456 ) ( ON ?auto_209457 ?auto_209456 ) ( ON ?auto_209458 ?auto_209457 ) ( not ( = ?auto_209456 ?auto_209457 ) ) ( not ( = ?auto_209456 ?auto_209458 ) ) ( not ( = ?auto_209456 ?auto_209459 ) ) ( not ( = ?auto_209456 ?auto_209460 ) ) ( not ( = ?auto_209456 ?auto_209461 ) ) ( not ( = ?auto_209457 ?auto_209458 ) ) ( not ( = ?auto_209457 ?auto_209459 ) ) ( not ( = ?auto_209457 ?auto_209460 ) ) ( not ( = ?auto_209457 ?auto_209461 ) ) ( not ( = ?auto_209458 ?auto_209459 ) ) ( not ( = ?auto_209458 ?auto_209460 ) ) ( not ( = ?auto_209458 ?auto_209461 ) ) ( not ( = ?auto_209459 ?auto_209460 ) ) ( not ( = ?auto_209459 ?auto_209461 ) ) ( not ( = ?auto_209460 ?auto_209461 ) ) ( ON ?auto_209461 ?auto_209463 ) ( not ( = ?auto_209456 ?auto_209463 ) ) ( not ( = ?auto_209457 ?auto_209463 ) ) ( not ( = ?auto_209458 ?auto_209463 ) ) ( not ( = ?auto_209459 ?auto_209463 ) ) ( not ( = ?auto_209460 ?auto_209463 ) ) ( not ( = ?auto_209461 ?auto_209463 ) ) ( ON ?auto_209460 ?auto_209461 ) ( ON-TABLE ?auto_209464 ) ( ON ?auto_209462 ?auto_209464 ) ( ON ?auto_209463 ?auto_209462 ) ( not ( = ?auto_209464 ?auto_209462 ) ) ( not ( = ?auto_209464 ?auto_209463 ) ) ( not ( = ?auto_209464 ?auto_209461 ) ) ( not ( = ?auto_209464 ?auto_209460 ) ) ( not ( = ?auto_209462 ?auto_209463 ) ) ( not ( = ?auto_209462 ?auto_209461 ) ) ( not ( = ?auto_209462 ?auto_209460 ) ) ( not ( = ?auto_209456 ?auto_209464 ) ) ( not ( = ?auto_209456 ?auto_209462 ) ) ( not ( = ?auto_209457 ?auto_209464 ) ) ( not ( = ?auto_209457 ?auto_209462 ) ) ( not ( = ?auto_209458 ?auto_209464 ) ) ( not ( = ?auto_209458 ?auto_209462 ) ) ( not ( = ?auto_209459 ?auto_209464 ) ) ( not ( = ?auto_209459 ?auto_209462 ) ) ( CLEAR ?auto_209458 ) ( ON ?auto_209459 ?auto_209460 ) ( CLEAR ?auto_209459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209464 ?auto_209462 ?auto_209463 ?auto_209461 ?auto_209460 )
      ( MAKE-6PILE ?auto_209456 ?auto_209457 ?auto_209458 ?auto_209459 ?auto_209460 ?auto_209461 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209465 - BLOCK
      ?auto_209466 - BLOCK
      ?auto_209467 - BLOCK
      ?auto_209468 - BLOCK
      ?auto_209469 - BLOCK
      ?auto_209470 - BLOCK
    )
    :vars
    (
      ?auto_209472 - BLOCK
      ?auto_209471 - BLOCK
      ?auto_209473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209465 ) ( ON ?auto_209466 ?auto_209465 ) ( not ( = ?auto_209465 ?auto_209466 ) ) ( not ( = ?auto_209465 ?auto_209467 ) ) ( not ( = ?auto_209465 ?auto_209468 ) ) ( not ( = ?auto_209465 ?auto_209469 ) ) ( not ( = ?auto_209465 ?auto_209470 ) ) ( not ( = ?auto_209466 ?auto_209467 ) ) ( not ( = ?auto_209466 ?auto_209468 ) ) ( not ( = ?auto_209466 ?auto_209469 ) ) ( not ( = ?auto_209466 ?auto_209470 ) ) ( not ( = ?auto_209467 ?auto_209468 ) ) ( not ( = ?auto_209467 ?auto_209469 ) ) ( not ( = ?auto_209467 ?auto_209470 ) ) ( not ( = ?auto_209468 ?auto_209469 ) ) ( not ( = ?auto_209468 ?auto_209470 ) ) ( not ( = ?auto_209469 ?auto_209470 ) ) ( ON ?auto_209470 ?auto_209472 ) ( not ( = ?auto_209465 ?auto_209472 ) ) ( not ( = ?auto_209466 ?auto_209472 ) ) ( not ( = ?auto_209467 ?auto_209472 ) ) ( not ( = ?auto_209468 ?auto_209472 ) ) ( not ( = ?auto_209469 ?auto_209472 ) ) ( not ( = ?auto_209470 ?auto_209472 ) ) ( ON ?auto_209469 ?auto_209470 ) ( ON-TABLE ?auto_209471 ) ( ON ?auto_209473 ?auto_209471 ) ( ON ?auto_209472 ?auto_209473 ) ( not ( = ?auto_209471 ?auto_209473 ) ) ( not ( = ?auto_209471 ?auto_209472 ) ) ( not ( = ?auto_209471 ?auto_209470 ) ) ( not ( = ?auto_209471 ?auto_209469 ) ) ( not ( = ?auto_209473 ?auto_209472 ) ) ( not ( = ?auto_209473 ?auto_209470 ) ) ( not ( = ?auto_209473 ?auto_209469 ) ) ( not ( = ?auto_209465 ?auto_209471 ) ) ( not ( = ?auto_209465 ?auto_209473 ) ) ( not ( = ?auto_209466 ?auto_209471 ) ) ( not ( = ?auto_209466 ?auto_209473 ) ) ( not ( = ?auto_209467 ?auto_209471 ) ) ( not ( = ?auto_209467 ?auto_209473 ) ) ( not ( = ?auto_209468 ?auto_209471 ) ) ( not ( = ?auto_209468 ?auto_209473 ) ) ( ON ?auto_209468 ?auto_209469 ) ( CLEAR ?auto_209468 ) ( HOLDING ?auto_209467 ) ( CLEAR ?auto_209466 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209465 ?auto_209466 ?auto_209467 )
      ( MAKE-6PILE ?auto_209465 ?auto_209466 ?auto_209467 ?auto_209468 ?auto_209469 ?auto_209470 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209474 - BLOCK
      ?auto_209475 - BLOCK
      ?auto_209476 - BLOCK
      ?auto_209477 - BLOCK
      ?auto_209478 - BLOCK
      ?auto_209479 - BLOCK
    )
    :vars
    (
      ?auto_209482 - BLOCK
      ?auto_209481 - BLOCK
      ?auto_209480 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209474 ) ( ON ?auto_209475 ?auto_209474 ) ( not ( = ?auto_209474 ?auto_209475 ) ) ( not ( = ?auto_209474 ?auto_209476 ) ) ( not ( = ?auto_209474 ?auto_209477 ) ) ( not ( = ?auto_209474 ?auto_209478 ) ) ( not ( = ?auto_209474 ?auto_209479 ) ) ( not ( = ?auto_209475 ?auto_209476 ) ) ( not ( = ?auto_209475 ?auto_209477 ) ) ( not ( = ?auto_209475 ?auto_209478 ) ) ( not ( = ?auto_209475 ?auto_209479 ) ) ( not ( = ?auto_209476 ?auto_209477 ) ) ( not ( = ?auto_209476 ?auto_209478 ) ) ( not ( = ?auto_209476 ?auto_209479 ) ) ( not ( = ?auto_209477 ?auto_209478 ) ) ( not ( = ?auto_209477 ?auto_209479 ) ) ( not ( = ?auto_209478 ?auto_209479 ) ) ( ON ?auto_209479 ?auto_209482 ) ( not ( = ?auto_209474 ?auto_209482 ) ) ( not ( = ?auto_209475 ?auto_209482 ) ) ( not ( = ?auto_209476 ?auto_209482 ) ) ( not ( = ?auto_209477 ?auto_209482 ) ) ( not ( = ?auto_209478 ?auto_209482 ) ) ( not ( = ?auto_209479 ?auto_209482 ) ) ( ON ?auto_209478 ?auto_209479 ) ( ON-TABLE ?auto_209481 ) ( ON ?auto_209480 ?auto_209481 ) ( ON ?auto_209482 ?auto_209480 ) ( not ( = ?auto_209481 ?auto_209480 ) ) ( not ( = ?auto_209481 ?auto_209482 ) ) ( not ( = ?auto_209481 ?auto_209479 ) ) ( not ( = ?auto_209481 ?auto_209478 ) ) ( not ( = ?auto_209480 ?auto_209482 ) ) ( not ( = ?auto_209480 ?auto_209479 ) ) ( not ( = ?auto_209480 ?auto_209478 ) ) ( not ( = ?auto_209474 ?auto_209481 ) ) ( not ( = ?auto_209474 ?auto_209480 ) ) ( not ( = ?auto_209475 ?auto_209481 ) ) ( not ( = ?auto_209475 ?auto_209480 ) ) ( not ( = ?auto_209476 ?auto_209481 ) ) ( not ( = ?auto_209476 ?auto_209480 ) ) ( not ( = ?auto_209477 ?auto_209481 ) ) ( not ( = ?auto_209477 ?auto_209480 ) ) ( ON ?auto_209477 ?auto_209478 ) ( CLEAR ?auto_209475 ) ( ON ?auto_209476 ?auto_209477 ) ( CLEAR ?auto_209476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209481 ?auto_209480 ?auto_209482 ?auto_209479 ?auto_209478 ?auto_209477 )
      ( MAKE-6PILE ?auto_209474 ?auto_209475 ?auto_209476 ?auto_209477 ?auto_209478 ?auto_209479 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209483 - BLOCK
      ?auto_209484 - BLOCK
      ?auto_209485 - BLOCK
      ?auto_209486 - BLOCK
      ?auto_209487 - BLOCK
      ?auto_209488 - BLOCK
    )
    :vars
    (
      ?auto_209489 - BLOCK
      ?auto_209491 - BLOCK
      ?auto_209490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209483 ) ( not ( = ?auto_209483 ?auto_209484 ) ) ( not ( = ?auto_209483 ?auto_209485 ) ) ( not ( = ?auto_209483 ?auto_209486 ) ) ( not ( = ?auto_209483 ?auto_209487 ) ) ( not ( = ?auto_209483 ?auto_209488 ) ) ( not ( = ?auto_209484 ?auto_209485 ) ) ( not ( = ?auto_209484 ?auto_209486 ) ) ( not ( = ?auto_209484 ?auto_209487 ) ) ( not ( = ?auto_209484 ?auto_209488 ) ) ( not ( = ?auto_209485 ?auto_209486 ) ) ( not ( = ?auto_209485 ?auto_209487 ) ) ( not ( = ?auto_209485 ?auto_209488 ) ) ( not ( = ?auto_209486 ?auto_209487 ) ) ( not ( = ?auto_209486 ?auto_209488 ) ) ( not ( = ?auto_209487 ?auto_209488 ) ) ( ON ?auto_209488 ?auto_209489 ) ( not ( = ?auto_209483 ?auto_209489 ) ) ( not ( = ?auto_209484 ?auto_209489 ) ) ( not ( = ?auto_209485 ?auto_209489 ) ) ( not ( = ?auto_209486 ?auto_209489 ) ) ( not ( = ?auto_209487 ?auto_209489 ) ) ( not ( = ?auto_209488 ?auto_209489 ) ) ( ON ?auto_209487 ?auto_209488 ) ( ON-TABLE ?auto_209491 ) ( ON ?auto_209490 ?auto_209491 ) ( ON ?auto_209489 ?auto_209490 ) ( not ( = ?auto_209491 ?auto_209490 ) ) ( not ( = ?auto_209491 ?auto_209489 ) ) ( not ( = ?auto_209491 ?auto_209488 ) ) ( not ( = ?auto_209491 ?auto_209487 ) ) ( not ( = ?auto_209490 ?auto_209489 ) ) ( not ( = ?auto_209490 ?auto_209488 ) ) ( not ( = ?auto_209490 ?auto_209487 ) ) ( not ( = ?auto_209483 ?auto_209491 ) ) ( not ( = ?auto_209483 ?auto_209490 ) ) ( not ( = ?auto_209484 ?auto_209491 ) ) ( not ( = ?auto_209484 ?auto_209490 ) ) ( not ( = ?auto_209485 ?auto_209491 ) ) ( not ( = ?auto_209485 ?auto_209490 ) ) ( not ( = ?auto_209486 ?auto_209491 ) ) ( not ( = ?auto_209486 ?auto_209490 ) ) ( ON ?auto_209486 ?auto_209487 ) ( ON ?auto_209485 ?auto_209486 ) ( CLEAR ?auto_209485 ) ( HOLDING ?auto_209484 ) ( CLEAR ?auto_209483 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209483 ?auto_209484 )
      ( MAKE-6PILE ?auto_209483 ?auto_209484 ?auto_209485 ?auto_209486 ?auto_209487 ?auto_209488 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209492 - BLOCK
      ?auto_209493 - BLOCK
      ?auto_209494 - BLOCK
      ?auto_209495 - BLOCK
      ?auto_209496 - BLOCK
      ?auto_209497 - BLOCK
    )
    :vars
    (
      ?auto_209499 - BLOCK
      ?auto_209500 - BLOCK
      ?auto_209498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209492 ) ( not ( = ?auto_209492 ?auto_209493 ) ) ( not ( = ?auto_209492 ?auto_209494 ) ) ( not ( = ?auto_209492 ?auto_209495 ) ) ( not ( = ?auto_209492 ?auto_209496 ) ) ( not ( = ?auto_209492 ?auto_209497 ) ) ( not ( = ?auto_209493 ?auto_209494 ) ) ( not ( = ?auto_209493 ?auto_209495 ) ) ( not ( = ?auto_209493 ?auto_209496 ) ) ( not ( = ?auto_209493 ?auto_209497 ) ) ( not ( = ?auto_209494 ?auto_209495 ) ) ( not ( = ?auto_209494 ?auto_209496 ) ) ( not ( = ?auto_209494 ?auto_209497 ) ) ( not ( = ?auto_209495 ?auto_209496 ) ) ( not ( = ?auto_209495 ?auto_209497 ) ) ( not ( = ?auto_209496 ?auto_209497 ) ) ( ON ?auto_209497 ?auto_209499 ) ( not ( = ?auto_209492 ?auto_209499 ) ) ( not ( = ?auto_209493 ?auto_209499 ) ) ( not ( = ?auto_209494 ?auto_209499 ) ) ( not ( = ?auto_209495 ?auto_209499 ) ) ( not ( = ?auto_209496 ?auto_209499 ) ) ( not ( = ?auto_209497 ?auto_209499 ) ) ( ON ?auto_209496 ?auto_209497 ) ( ON-TABLE ?auto_209500 ) ( ON ?auto_209498 ?auto_209500 ) ( ON ?auto_209499 ?auto_209498 ) ( not ( = ?auto_209500 ?auto_209498 ) ) ( not ( = ?auto_209500 ?auto_209499 ) ) ( not ( = ?auto_209500 ?auto_209497 ) ) ( not ( = ?auto_209500 ?auto_209496 ) ) ( not ( = ?auto_209498 ?auto_209499 ) ) ( not ( = ?auto_209498 ?auto_209497 ) ) ( not ( = ?auto_209498 ?auto_209496 ) ) ( not ( = ?auto_209492 ?auto_209500 ) ) ( not ( = ?auto_209492 ?auto_209498 ) ) ( not ( = ?auto_209493 ?auto_209500 ) ) ( not ( = ?auto_209493 ?auto_209498 ) ) ( not ( = ?auto_209494 ?auto_209500 ) ) ( not ( = ?auto_209494 ?auto_209498 ) ) ( not ( = ?auto_209495 ?auto_209500 ) ) ( not ( = ?auto_209495 ?auto_209498 ) ) ( ON ?auto_209495 ?auto_209496 ) ( ON ?auto_209494 ?auto_209495 ) ( CLEAR ?auto_209492 ) ( ON ?auto_209493 ?auto_209494 ) ( CLEAR ?auto_209493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209500 ?auto_209498 ?auto_209499 ?auto_209497 ?auto_209496 ?auto_209495 ?auto_209494 )
      ( MAKE-6PILE ?auto_209492 ?auto_209493 ?auto_209494 ?auto_209495 ?auto_209496 ?auto_209497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209501 - BLOCK
      ?auto_209502 - BLOCK
      ?auto_209503 - BLOCK
      ?auto_209504 - BLOCK
      ?auto_209505 - BLOCK
      ?auto_209506 - BLOCK
    )
    :vars
    (
      ?auto_209507 - BLOCK
      ?auto_209508 - BLOCK
      ?auto_209509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_209501 ?auto_209502 ) ) ( not ( = ?auto_209501 ?auto_209503 ) ) ( not ( = ?auto_209501 ?auto_209504 ) ) ( not ( = ?auto_209501 ?auto_209505 ) ) ( not ( = ?auto_209501 ?auto_209506 ) ) ( not ( = ?auto_209502 ?auto_209503 ) ) ( not ( = ?auto_209502 ?auto_209504 ) ) ( not ( = ?auto_209502 ?auto_209505 ) ) ( not ( = ?auto_209502 ?auto_209506 ) ) ( not ( = ?auto_209503 ?auto_209504 ) ) ( not ( = ?auto_209503 ?auto_209505 ) ) ( not ( = ?auto_209503 ?auto_209506 ) ) ( not ( = ?auto_209504 ?auto_209505 ) ) ( not ( = ?auto_209504 ?auto_209506 ) ) ( not ( = ?auto_209505 ?auto_209506 ) ) ( ON ?auto_209506 ?auto_209507 ) ( not ( = ?auto_209501 ?auto_209507 ) ) ( not ( = ?auto_209502 ?auto_209507 ) ) ( not ( = ?auto_209503 ?auto_209507 ) ) ( not ( = ?auto_209504 ?auto_209507 ) ) ( not ( = ?auto_209505 ?auto_209507 ) ) ( not ( = ?auto_209506 ?auto_209507 ) ) ( ON ?auto_209505 ?auto_209506 ) ( ON-TABLE ?auto_209508 ) ( ON ?auto_209509 ?auto_209508 ) ( ON ?auto_209507 ?auto_209509 ) ( not ( = ?auto_209508 ?auto_209509 ) ) ( not ( = ?auto_209508 ?auto_209507 ) ) ( not ( = ?auto_209508 ?auto_209506 ) ) ( not ( = ?auto_209508 ?auto_209505 ) ) ( not ( = ?auto_209509 ?auto_209507 ) ) ( not ( = ?auto_209509 ?auto_209506 ) ) ( not ( = ?auto_209509 ?auto_209505 ) ) ( not ( = ?auto_209501 ?auto_209508 ) ) ( not ( = ?auto_209501 ?auto_209509 ) ) ( not ( = ?auto_209502 ?auto_209508 ) ) ( not ( = ?auto_209502 ?auto_209509 ) ) ( not ( = ?auto_209503 ?auto_209508 ) ) ( not ( = ?auto_209503 ?auto_209509 ) ) ( not ( = ?auto_209504 ?auto_209508 ) ) ( not ( = ?auto_209504 ?auto_209509 ) ) ( ON ?auto_209504 ?auto_209505 ) ( ON ?auto_209503 ?auto_209504 ) ( ON ?auto_209502 ?auto_209503 ) ( CLEAR ?auto_209502 ) ( HOLDING ?auto_209501 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209501 )
      ( MAKE-6PILE ?auto_209501 ?auto_209502 ?auto_209503 ?auto_209504 ?auto_209505 ?auto_209506 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209510 - BLOCK
      ?auto_209511 - BLOCK
      ?auto_209512 - BLOCK
      ?auto_209513 - BLOCK
      ?auto_209514 - BLOCK
      ?auto_209515 - BLOCK
    )
    :vars
    (
      ?auto_209517 - BLOCK
      ?auto_209516 - BLOCK
      ?auto_209518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_209510 ?auto_209511 ) ) ( not ( = ?auto_209510 ?auto_209512 ) ) ( not ( = ?auto_209510 ?auto_209513 ) ) ( not ( = ?auto_209510 ?auto_209514 ) ) ( not ( = ?auto_209510 ?auto_209515 ) ) ( not ( = ?auto_209511 ?auto_209512 ) ) ( not ( = ?auto_209511 ?auto_209513 ) ) ( not ( = ?auto_209511 ?auto_209514 ) ) ( not ( = ?auto_209511 ?auto_209515 ) ) ( not ( = ?auto_209512 ?auto_209513 ) ) ( not ( = ?auto_209512 ?auto_209514 ) ) ( not ( = ?auto_209512 ?auto_209515 ) ) ( not ( = ?auto_209513 ?auto_209514 ) ) ( not ( = ?auto_209513 ?auto_209515 ) ) ( not ( = ?auto_209514 ?auto_209515 ) ) ( ON ?auto_209515 ?auto_209517 ) ( not ( = ?auto_209510 ?auto_209517 ) ) ( not ( = ?auto_209511 ?auto_209517 ) ) ( not ( = ?auto_209512 ?auto_209517 ) ) ( not ( = ?auto_209513 ?auto_209517 ) ) ( not ( = ?auto_209514 ?auto_209517 ) ) ( not ( = ?auto_209515 ?auto_209517 ) ) ( ON ?auto_209514 ?auto_209515 ) ( ON-TABLE ?auto_209516 ) ( ON ?auto_209518 ?auto_209516 ) ( ON ?auto_209517 ?auto_209518 ) ( not ( = ?auto_209516 ?auto_209518 ) ) ( not ( = ?auto_209516 ?auto_209517 ) ) ( not ( = ?auto_209516 ?auto_209515 ) ) ( not ( = ?auto_209516 ?auto_209514 ) ) ( not ( = ?auto_209518 ?auto_209517 ) ) ( not ( = ?auto_209518 ?auto_209515 ) ) ( not ( = ?auto_209518 ?auto_209514 ) ) ( not ( = ?auto_209510 ?auto_209516 ) ) ( not ( = ?auto_209510 ?auto_209518 ) ) ( not ( = ?auto_209511 ?auto_209516 ) ) ( not ( = ?auto_209511 ?auto_209518 ) ) ( not ( = ?auto_209512 ?auto_209516 ) ) ( not ( = ?auto_209512 ?auto_209518 ) ) ( not ( = ?auto_209513 ?auto_209516 ) ) ( not ( = ?auto_209513 ?auto_209518 ) ) ( ON ?auto_209513 ?auto_209514 ) ( ON ?auto_209512 ?auto_209513 ) ( ON ?auto_209511 ?auto_209512 ) ( ON ?auto_209510 ?auto_209511 ) ( CLEAR ?auto_209510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_209516 ?auto_209518 ?auto_209517 ?auto_209515 ?auto_209514 ?auto_209513 ?auto_209512 ?auto_209511 )
      ( MAKE-6PILE ?auto_209510 ?auto_209511 ?auto_209512 ?auto_209513 ?auto_209514 ?auto_209515 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209521 - BLOCK
      ?auto_209522 - BLOCK
    )
    :vars
    (
      ?auto_209523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209523 ?auto_209522 ) ( CLEAR ?auto_209523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209521 ) ( ON ?auto_209522 ?auto_209521 ) ( not ( = ?auto_209521 ?auto_209522 ) ) ( not ( = ?auto_209521 ?auto_209523 ) ) ( not ( = ?auto_209522 ?auto_209523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209523 ?auto_209522 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209524 - BLOCK
      ?auto_209525 - BLOCK
    )
    :vars
    (
      ?auto_209526 - BLOCK
      ?auto_209527 - BLOCK
      ?auto_209528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209526 ?auto_209525 ) ( CLEAR ?auto_209526 ) ( ON-TABLE ?auto_209524 ) ( ON ?auto_209525 ?auto_209524 ) ( not ( = ?auto_209524 ?auto_209525 ) ) ( not ( = ?auto_209524 ?auto_209526 ) ) ( not ( = ?auto_209525 ?auto_209526 ) ) ( HOLDING ?auto_209527 ) ( CLEAR ?auto_209528 ) ( not ( = ?auto_209524 ?auto_209527 ) ) ( not ( = ?auto_209524 ?auto_209528 ) ) ( not ( = ?auto_209525 ?auto_209527 ) ) ( not ( = ?auto_209525 ?auto_209528 ) ) ( not ( = ?auto_209526 ?auto_209527 ) ) ( not ( = ?auto_209526 ?auto_209528 ) ) ( not ( = ?auto_209527 ?auto_209528 ) ) )
    :subtasks
    ( ( !STACK ?auto_209527 ?auto_209528 )
      ( MAKE-2PILE ?auto_209524 ?auto_209525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209529 - BLOCK
      ?auto_209530 - BLOCK
    )
    :vars
    (
      ?auto_209532 - BLOCK
      ?auto_209531 - BLOCK
      ?auto_209533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209532 ?auto_209530 ) ( ON-TABLE ?auto_209529 ) ( ON ?auto_209530 ?auto_209529 ) ( not ( = ?auto_209529 ?auto_209530 ) ) ( not ( = ?auto_209529 ?auto_209532 ) ) ( not ( = ?auto_209530 ?auto_209532 ) ) ( CLEAR ?auto_209531 ) ( not ( = ?auto_209529 ?auto_209533 ) ) ( not ( = ?auto_209529 ?auto_209531 ) ) ( not ( = ?auto_209530 ?auto_209533 ) ) ( not ( = ?auto_209530 ?auto_209531 ) ) ( not ( = ?auto_209532 ?auto_209533 ) ) ( not ( = ?auto_209532 ?auto_209531 ) ) ( not ( = ?auto_209533 ?auto_209531 ) ) ( ON ?auto_209533 ?auto_209532 ) ( CLEAR ?auto_209533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209529 ?auto_209530 ?auto_209532 )
      ( MAKE-2PILE ?auto_209529 ?auto_209530 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209534 - BLOCK
      ?auto_209535 - BLOCK
    )
    :vars
    (
      ?auto_209538 - BLOCK
      ?auto_209537 - BLOCK
      ?auto_209536 - BLOCK
      ?auto_209542 - BLOCK
      ?auto_209541 - BLOCK
      ?auto_209539 - BLOCK
      ?auto_209540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209538 ?auto_209535 ) ( ON-TABLE ?auto_209534 ) ( ON ?auto_209535 ?auto_209534 ) ( not ( = ?auto_209534 ?auto_209535 ) ) ( not ( = ?auto_209534 ?auto_209538 ) ) ( not ( = ?auto_209535 ?auto_209538 ) ) ( not ( = ?auto_209534 ?auto_209537 ) ) ( not ( = ?auto_209534 ?auto_209536 ) ) ( not ( = ?auto_209535 ?auto_209537 ) ) ( not ( = ?auto_209535 ?auto_209536 ) ) ( not ( = ?auto_209538 ?auto_209537 ) ) ( not ( = ?auto_209538 ?auto_209536 ) ) ( not ( = ?auto_209537 ?auto_209536 ) ) ( ON ?auto_209537 ?auto_209538 ) ( CLEAR ?auto_209537 ) ( HOLDING ?auto_209536 ) ( CLEAR ?auto_209542 ) ( ON-TABLE ?auto_209541 ) ( ON ?auto_209539 ?auto_209541 ) ( ON ?auto_209540 ?auto_209539 ) ( ON ?auto_209542 ?auto_209540 ) ( not ( = ?auto_209541 ?auto_209539 ) ) ( not ( = ?auto_209541 ?auto_209540 ) ) ( not ( = ?auto_209541 ?auto_209542 ) ) ( not ( = ?auto_209541 ?auto_209536 ) ) ( not ( = ?auto_209539 ?auto_209540 ) ) ( not ( = ?auto_209539 ?auto_209542 ) ) ( not ( = ?auto_209539 ?auto_209536 ) ) ( not ( = ?auto_209540 ?auto_209542 ) ) ( not ( = ?auto_209540 ?auto_209536 ) ) ( not ( = ?auto_209542 ?auto_209536 ) ) ( not ( = ?auto_209534 ?auto_209542 ) ) ( not ( = ?auto_209534 ?auto_209541 ) ) ( not ( = ?auto_209534 ?auto_209539 ) ) ( not ( = ?auto_209534 ?auto_209540 ) ) ( not ( = ?auto_209535 ?auto_209542 ) ) ( not ( = ?auto_209535 ?auto_209541 ) ) ( not ( = ?auto_209535 ?auto_209539 ) ) ( not ( = ?auto_209535 ?auto_209540 ) ) ( not ( = ?auto_209538 ?auto_209542 ) ) ( not ( = ?auto_209538 ?auto_209541 ) ) ( not ( = ?auto_209538 ?auto_209539 ) ) ( not ( = ?auto_209538 ?auto_209540 ) ) ( not ( = ?auto_209537 ?auto_209542 ) ) ( not ( = ?auto_209537 ?auto_209541 ) ) ( not ( = ?auto_209537 ?auto_209539 ) ) ( not ( = ?auto_209537 ?auto_209540 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209541 ?auto_209539 ?auto_209540 ?auto_209542 ?auto_209536 )
      ( MAKE-2PILE ?auto_209534 ?auto_209535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209543 - BLOCK
      ?auto_209544 - BLOCK
    )
    :vars
    (
      ?auto_209551 - BLOCK
      ?auto_209548 - BLOCK
      ?auto_209545 - BLOCK
      ?auto_209546 - BLOCK
      ?auto_209547 - BLOCK
      ?auto_209550 - BLOCK
      ?auto_209549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209551 ?auto_209544 ) ( ON-TABLE ?auto_209543 ) ( ON ?auto_209544 ?auto_209543 ) ( not ( = ?auto_209543 ?auto_209544 ) ) ( not ( = ?auto_209543 ?auto_209551 ) ) ( not ( = ?auto_209544 ?auto_209551 ) ) ( not ( = ?auto_209543 ?auto_209548 ) ) ( not ( = ?auto_209543 ?auto_209545 ) ) ( not ( = ?auto_209544 ?auto_209548 ) ) ( not ( = ?auto_209544 ?auto_209545 ) ) ( not ( = ?auto_209551 ?auto_209548 ) ) ( not ( = ?auto_209551 ?auto_209545 ) ) ( not ( = ?auto_209548 ?auto_209545 ) ) ( ON ?auto_209548 ?auto_209551 ) ( CLEAR ?auto_209546 ) ( ON-TABLE ?auto_209547 ) ( ON ?auto_209550 ?auto_209547 ) ( ON ?auto_209549 ?auto_209550 ) ( ON ?auto_209546 ?auto_209549 ) ( not ( = ?auto_209547 ?auto_209550 ) ) ( not ( = ?auto_209547 ?auto_209549 ) ) ( not ( = ?auto_209547 ?auto_209546 ) ) ( not ( = ?auto_209547 ?auto_209545 ) ) ( not ( = ?auto_209550 ?auto_209549 ) ) ( not ( = ?auto_209550 ?auto_209546 ) ) ( not ( = ?auto_209550 ?auto_209545 ) ) ( not ( = ?auto_209549 ?auto_209546 ) ) ( not ( = ?auto_209549 ?auto_209545 ) ) ( not ( = ?auto_209546 ?auto_209545 ) ) ( not ( = ?auto_209543 ?auto_209546 ) ) ( not ( = ?auto_209543 ?auto_209547 ) ) ( not ( = ?auto_209543 ?auto_209550 ) ) ( not ( = ?auto_209543 ?auto_209549 ) ) ( not ( = ?auto_209544 ?auto_209546 ) ) ( not ( = ?auto_209544 ?auto_209547 ) ) ( not ( = ?auto_209544 ?auto_209550 ) ) ( not ( = ?auto_209544 ?auto_209549 ) ) ( not ( = ?auto_209551 ?auto_209546 ) ) ( not ( = ?auto_209551 ?auto_209547 ) ) ( not ( = ?auto_209551 ?auto_209550 ) ) ( not ( = ?auto_209551 ?auto_209549 ) ) ( not ( = ?auto_209548 ?auto_209546 ) ) ( not ( = ?auto_209548 ?auto_209547 ) ) ( not ( = ?auto_209548 ?auto_209550 ) ) ( not ( = ?auto_209548 ?auto_209549 ) ) ( ON ?auto_209545 ?auto_209548 ) ( CLEAR ?auto_209545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209543 ?auto_209544 ?auto_209551 ?auto_209548 )
      ( MAKE-2PILE ?auto_209543 ?auto_209544 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209552 - BLOCK
      ?auto_209553 - BLOCK
    )
    :vars
    (
      ?auto_209557 - BLOCK
      ?auto_209559 - BLOCK
      ?auto_209554 - BLOCK
      ?auto_209555 - BLOCK
      ?auto_209560 - BLOCK
      ?auto_209558 - BLOCK
      ?auto_209556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209557 ?auto_209553 ) ( ON-TABLE ?auto_209552 ) ( ON ?auto_209553 ?auto_209552 ) ( not ( = ?auto_209552 ?auto_209553 ) ) ( not ( = ?auto_209552 ?auto_209557 ) ) ( not ( = ?auto_209553 ?auto_209557 ) ) ( not ( = ?auto_209552 ?auto_209559 ) ) ( not ( = ?auto_209552 ?auto_209554 ) ) ( not ( = ?auto_209553 ?auto_209559 ) ) ( not ( = ?auto_209553 ?auto_209554 ) ) ( not ( = ?auto_209557 ?auto_209559 ) ) ( not ( = ?auto_209557 ?auto_209554 ) ) ( not ( = ?auto_209559 ?auto_209554 ) ) ( ON ?auto_209559 ?auto_209557 ) ( ON-TABLE ?auto_209555 ) ( ON ?auto_209560 ?auto_209555 ) ( ON ?auto_209558 ?auto_209560 ) ( not ( = ?auto_209555 ?auto_209560 ) ) ( not ( = ?auto_209555 ?auto_209558 ) ) ( not ( = ?auto_209555 ?auto_209556 ) ) ( not ( = ?auto_209555 ?auto_209554 ) ) ( not ( = ?auto_209560 ?auto_209558 ) ) ( not ( = ?auto_209560 ?auto_209556 ) ) ( not ( = ?auto_209560 ?auto_209554 ) ) ( not ( = ?auto_209558 ?auto_209556 ) ) ( not ( = ?auto_209558 ?auto_209554 ) ) ( not ( = ?auto_209556 ?auto_209554 ) ) ( not ( = ?auto_209552 ?auto_209556 ) ) ( not ( = ?auto_209552 ?auto_209555 ) ) ( not ( = ?auto_209552 ?auto_209560 ) ) ( not ( = ?auto_209552 ?auto_209558 ) ) ( not ( = ?auto_209553 ?auto_209556 ) ) ( not ( = ?auto_209553 ?auto_209555 ) ) ( not ( = ?auto_209553 ?auto_209560 ) ) ( not ( = ?auto_209553 ?auto_209558 ) ) ( not ( = ?auto_209557 ?auto_209556 ) ) ( not ( = ?auto_209557 ?auto_209555 ) ) ( not ( = ?auto_209557 ?auto_209560 ) ) ( not ( = ?auto_209557 ?auto_209558 ) ) ( not ( = ?auto_209559 ?auto_209556 ) ) ( not ( = ?auto_209559 ?auto_209555 ) ) ( not ( = ?auto_209559 ?auto_209560 ) ) ( not ( = ?auto_209559 ?auto_209558 ) ) ( ON ?auto_209554 ?auto_209559 ) ( CLEAR ?auto_209554 ) ( HOLDING ?auto_209556 ) ( CLEAR ?auto_209558 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209555 ?auto_209560 ?auto_209558 ?auto_209556 )
      ( MAKE-2PILE ?auto_209552 ?auto_209553 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209561 - BLOCK
      ?auto_209562 - BLOCK
    )
    :vars
    (
      ?auto_209565 - BLOCK
      ?auto_209566 - BLOCK
      ?auto_209564 - BLOCK
      ?auto_209568 - BLOCK
      ?auto_209567 - BLOCK
      ?auto_209563 - BLOCK
      ?auto_209569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209565 ?auto_209562 ) ( ON-TABLE ?auto_209561 ) ( ON ?auto_209562 ?auto_209561 ) ( not ( = ?auto_209561 ?auto_209562 ) ) ( not ( = ?auto_209561 ?auto_209565 ) ) ( not ( = ?auto_209562 ?auto_209565 ) ) ( not ( = ?auto_209561 ?auto_209566 ) ) ( not ( = ?auto_209561 ?auto_209564 ) ) ( not ( = ?auto_209562 ?auto_209566 ) ) ( not ( = ?auto_209562 ?auto_209564 ) ) ( not ( = ?auto_209565 ?auto_209566 ) ) ( not ( = ?auto_209565 ?auto_209564 ) ) ( not ( = ?auto_209566 ?auto_209564 ) ) ( ON ?auto_209566 ?auto_209565 ) ( ON-TABLE ?auto_209568 ) ( ON ?auto_209567 ?auto_209568 ) ( ON ?auto_209563 ?auto_209567 ) ( not ( = ?auto_209568 ?auto_209567 ) ) ( not ( = ?auto_209568 ?auto_209563 ) ) ( not ( = ?auto_209568 ?auto_209569 ) ) ( not ( = ?auto_209568 ?auto_209564 ) ) ( not ( = ?auto_209567 ?auto_209563 ) ) ( not ( = ?auto_209567 ?auto_209569 ) ) ( not ( = ?auto_209567 ?auto_209564 ) ) ( not ( = ?auto_209563 ?auto_209569 ) ) ( not ( = ?auto_209563 ?auto_209564 ) ) ( not ( = ?auto_209569 ?auto_209564 ) ) ( not ( = ?auto_209561 ?auto_209569 ) ) ( not ( = ?auto_209561 ?auto_209568 ) ) ( not ( = ?auto_209561 ?auto_209567 ) ) ( not ( = ?auto_209561 ?auto_209563 ) ) ( not ( = ?auto_209562 ?auto_209569 ) ) ( not ( = ?auto_209562 ?auto_209568 ) ) ( not ( = ?auto_209562 ?auto_209567 ) ) ( not ( = ?auto_209562 ?auto_209563 ) ) ( not ( = ?auto_209565 ?auto_209569 ) ) ( not ( = ?auto_209565 ?auto_209568 ) ) ( not ( = ?auto_209565 ?auto_209567 ) ) ( not ( = ?auto_209565 ?auto_209563 ) ) ( not ( = ?auto_209566 ?auto_209569 ) ) ( not ( = ?auto_209566 ?auto_209568 ) ) ( not ( = ?auto_209566 ?auto_209567 ) ) ( not ( = ?auto_209566 ?auto_209563 ) ) ( ON ?auto_209564 ?auto_209566 ) ( CLEAR ?auto_209563 ) ( ON ?auto_209569 ?auto_209564 ) ( CLEAR ?auto_209569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209561 ?auto_209562 ?auto_209565 ?auto_209566 ?auto_209564 )
      ( MAKE-2PILE ?auto_209561 ?auto_209562 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209570 - BLOCK
      ?auto_209571 - BLOCK
    )
    :vars
    (
      ?auto_209574 - BLOCK
      ?auto_209577 - BLOCK
      ?auto_209572 - BLOCK
      ?auto_209578 - BLOCK
      ?auto_209573 - BLOCK
      ?auto_209575 - BLOCK
      ?auto_209576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209574 ?auto_209571 ) ( ON-TABLE ?auto_209570 ) ( ON ?auto_209571 ?auto_209570 ) ( not ( = ?auto_209570 ?auto_209571 ) ) ( not ( = ?auto_209570 ?auto_209574 ) ) ( not ( = ?auto_209571 ?auto_209574 ) ) ( not ( = ?auto_209570 ?auto_209577 ) ) ( not ( = ?auto_209570 ?auto_209572 ) ) ( not ( = ?auto_209571 ?auto_209577 ) ) ( not ( = ?auto_209571 ?auto_209572 ) ) ( not ( = ?auto_209574 ?auto_209577 ) ) ( not ( = ?auto_209574 ?auto_209572 ) ) ( not ( = ?auto_209577 ?auto_209572 ) ) ( ON ?auto_209577 ?auto_209574 ) ( ON-TABLE ?auto_209578 ) ( ON ?auto_209573 ?auto_209578 ) ( not ( = ?auto_209578 ?auto_209573 ) ) ( not ( = ?auto_209578 ?auto_209575 ) ) ( not ( = ?auto_209578 ?auto_209576 ) ) ( not ( = ?auto_209578 ?auto_209572 ) ) ( not ( = ?auto_209573 ?auto_209575 ) ) ( not ( = ?auto_209573 ?auto_209576 ) ) ( not ( = ?auto_209573 ?auto_209572 ) ) ( not ( = ?auto_209575 ?auto_209576 ) ) ( not ( = ?auto_209575 ?auto_209572 ) ) ( not ( = ?auto_209576 ?auto_209572 ) ) ( not ( = ?auto_209570 ?auto_209576 ) ) ( not ( = ?auto_209570 ?auto_209578 ) ) ( not ( = ?auto_209570 ?auto_209573 ) ) ( not ( = ?auto_209570 ?auto_209575 ) ) ( not ( = ?auto_209571 ?auto_209576 ) ) ( not ( = ?auto_209571 ?auto_209578 ) ) ( not ( = ?auto_209571 ?auto_209573 ) ) ( not ( = ?auto_209571 ?auto_209575 ) ) ( not ( = ?auto_209574 ?auto_209576 ) ) ( not ( = ?auto_209574 ?auto_209578 ) ) ( not ( = ?auto_209574 ?auto_209573 ) ) ( not ( = ?auto_209574 ?auto_209575 ) ) ( not ( = ?auto_209577 ?auto_209576 ) ) ( not ( = ?auto_209577 ?auto_209578 ) ) ( not ( = ?auto_209577 ?auto_209573 ) ) ( not ( = ?auto_209577 ?auto_209575 ) ) ( ON ?auto_209572 ?auto_209577 ) ( ON ?auto_209576 ?auto_209572 ) ( CLEAR ?auto_209576 ) ( HOLDING ?auto_209575 ) ( CLEAR ?auto_209573 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209578 ?auto_209573 ?auto_209575 )
      ( MAKE-2PILE ?auto_209570 ?auto_209571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209579 - BLOCK
      ?auto_209580 - BLOCK
    )
    :vars
    (
      ?auto_209587 - BLOCK
      ?auto_209585 - BLOCK
      ?auto_209581 - BLOCK
      ?auto_209586 - BLOCK
      ?auto_209584 - BLOCK
      ?auto_209583 - BLOCK
      ?auto_209582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209587 ?auto_209580 ) ( ON-TABLE ?auto_209579 ) ( ON ?auto_209580 ?auto_209579 ) ( not ( = ?auto_209579 ?auto_209580 ) ) ( not ( = ?auto_209579 ?auto_209587 ) ) ( not ( = ?auto_209580 ?auto_209587 ) ) ( not ( = ?auto_209579 ?auto_209585 ) ) ( not ( = ?auto_209579 ?auto_209581 ) ) ( not ( = ?auto_209580 ?auto_209585 ) ) ( not ( = ?auto_209580 ?auto_209581 ) ) ( not ( = ?auto_209587 ?auto_209585 ) ) ( not ( = ?auto_209587 ?auto_209581 ) ) ( not ( = ?auto_209585 ?auto_209581 ) ) ( ON ?auto_209585 ?auto_209587 ) ( ON-TABLE ?auto_209586 ) ( ON ?auto_209584 ?auto_209586 ) ( not ( = ?auto_209586 ?auto_209584 ) ) ( not ( = ?auto_209586 ?auto_209583 ) ) ( not ( = ?auto_209586 ?auto_209582 ) ) ( not ( = ?auto_209586 ?auto_209581 ) ) ( not ( = ?auto_209584 ?auto_209583 ) ) ( not ( = ?auto_209584 ?auto_209582 ) ) ( not ( = ?auto_209584 ?auto_209581 ) ) ( not ( = ?auto_209583 ?auto_209582 ) ) ( not ( = ?auto_209583 ?auto_209581 ) ) ( not ( = ?auto_209582 ?auto_209581 ) ) ( not ( = ?auto_209579 ?auto_209582 ) ) ( not ( = ?auto_209579 ?auto_209586 ) ) ( not ( = ?auto_209579 ?auto_209584 ) ) ( not ( = ?auto_209579 ?auto_209583 ) ) ( not ( = ?auto_209580 ?auto_209582 ) ) ( not ( = ?auto_209580 ?auto_209586 ) ) ( not ( = ?auto_209580 ?auto_209584 ) ) ( not ( = ?auto_209580 ?auto_209583 ) ) ( not ( = ?auto_209587 ?auto_209582 ) ) ( not ( = ?auto_209587 ?auto_209586 ) ) ( not ( = ?auto_209587 ?auto_209584 ) ) ( not ( = ?auto_209587 ?auto_209583 ) ) ( not ( = ?auto_209585 ?auto_209582 ) ) ( not ( = ?auto_209585 ?auto_209586 ) ) ( not ( = ?auto_209585 ?auto_209584 ) ) ( not ( = ?auto_209585 ?auto_209583 ) ) ( ON ?auto_209581 ?auto_209585 ) ( ON ?auto_209582 ?auto_209581 ) ( CLEAR ?auto_209584 ) ( ON ?auto_209583 ?auto_209582 ) ( CLEAR ?auto_209583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209579 ?auto_209580 ?auto_209587 ?auto_209585 ?auto_209581 ?auto_209582 )
      ( MAKE-2PILE ?auto_209579 ?auto_209580 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209588 - BLOCK
      ?auto_209589 - BLOCK
    )
    :vars
    (
      ?auto_209593 - BLOCK
      ?auto_209592 - BLOCK
      ?auto_209594 - BLOCK
      ?auto_209591 - BLOCK
      ?auto_209595 - BLOCK
      ?auto_209596 - BLOCK
      ?auto_209590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209593 ?auto_209589 ) ( ON-TABLE ?auto_209588 ) ( ON ?auto_209589 ?auto_209588 ) ( not ( = ?auto_209588 ?auto_209589 ) ) ( not ( = ?auto_209588 ?auto_209593 ) ) ( not ( = ?auto_209589 ?auto_209593 ) ) ( not ( = ?auto_209588 ?auto_209592 ) ) ( not ( = ?auto_209588 ?auto_209594 ) ) ( not ( = ?auto_209589 ?auto_209592 ) ) ( not ( = ?auto_209589 ?auto_209594 ) ) ( not ( = ?auto_209593 ?auto_209592 ) ) ( not ( = ?auto_209593 ?auto_209594 ) ) ( not ( = ?auto_209592 ?auto_209594 ) ) ( ON ?auto_209592 ?auto_209593 ) ( ON-TABLE ?auto_209591 ) ( not ( = ?auto_209591 ?auto_209595 ) ) ( not ( = ?auto_209591 ?auto_209596 ) ) ( not ( = ?auto_209591 ?auto_209590 ) ) ( not ( = ?auto_209591 ?auto_209594 ) ) ( not ( = ?auto_209595 ?auto_209596 ) ) ( not ( = ?auto_209595 ?auto_209590 ) ) ( not ( = ?auto_209595 ?auto_209594 ) ) ( not ( = ?auto_209596 ?auto_209590 ) ) ( not ( = ?auto_209596 ?auto_209594 ) ) ( not ( = ?auto_209590 ?auto_209594 ) ) ( not ( = ?auto_209588 ?auto_209590 ) ) ( not ( = ?auto_209588 ?auto_209591 ) ) ( not ( = ?auto_209588 ?auto_209595 ) ) ( not ( = ?auto_209588 ?auto_209596 ) ) ( not ( = ?auto_209589 ?auto_209590 ) ) ( not ( = ?auto_209589 ?auto_209591 ) ) ( not ( = ?auto_209589 ?auto_209595 ) ) ( not ( = ?auto_209589 ?auto_209596 ) ) ( not ( = ?auto_209593 ?auto_209590 ) ) ( not ( = ?auto_209593 ?auto_209591 ) ) ( not ( = ?auto_209593 ?auto_209595 ) ) ( not ( = ?auto_209593 ?auto_209596 ) ) ( not ( = ?auto_209592 ?auto_209590 ) ) ( not ( = ?auto_209592 ?auto_209591 ) ) ( not ( = ?auto_209592 ?auto_209595 ) ) ( not ( = ?auto_209592 ?auto_209596 ) ) ( ON ?auto_209594 ?auto_209592 ) ( ON ?auto_209590 ?auto_209594 ) ( ON ?auto_209596 ?auto_209590 ) ( CLEAR ?auto_209596 ) ( HOLDING ?auto_209595 ) ( CLEAR ?auto_209591 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209591 ?auto_209595 )
      ( MAKE-2PILE ?auto_209588 ?auto_209589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209597 - BLOCK
      ?auto_209598 - BLOCK
    )
    :vars
    (
      ?auto_209600 - BLOCK
      ?auto_209604 - BLOCK
      ?auto_209602 - BLOCK
      ?auto_209603 - BLOCK
      ?auto_209605 - BLOCK
      ?auto_209599 - BLOCK
      ?auto_209601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209600 ?auto_209598 ) ( ON-TABLE ?auto_209597 ) ( ON ?auto_209598 ?auto_209597 ) ( not ( = ?auto_209597 ?auto_209598 ) ) ( not ( = ?auto_209597 ?auto_209600 ) ) ( not ( = ?auto_209598 ?auto_209600 ) ) ( not ( = ?auto_209597 ?auto_209604 ) ) ( not ( = ?auto_209597 ?auto_209602 ) ) ( not ( = ?auto_209598 ?auto_209604 ) ) ( not ( = ?auto_209598 ?auto_209602 ) ) ( not ( = ?auto_209600 ?auto_209604 ) ) ( not ( = ?auto_209600 ?auto_209602 ) ) ( not ( = ?auto_209604 ?auto_209602 ) ) ( ON ?auto_209604 ?auto_209600 ) ( ON-TABLE ?auto_209603 ) ( not ( = ?auto_209603 ?auto_209605 ) ) ( not ( = ?auto_209603 ?auto_209599 ) ) ( not ( = ?auto_209603 ?auto_209601 ) ) ( not ( = ?auto_209603 ?auto_209602 ) ) ( not ( = ?auto_209605 ?auto_209599 ) ) ( not ( = ?auto_209605 ?auto_209601 ) ) ( not ( = ?auto_209605 ?auto_209602 ) ) ( not ( = ?auto_209599 ?auto_209601 ) ) ( not ( = ?auto_209599 ?auto_209602 ) ) ( not ( = ?auto_209601 ?auto_209602 ) ) ( not ( = ?auto_209597 ?auto_209601 ) ) ( not ( = ?auto_209597 ?auto_209603 ) ) ( not ( = ?auto_209597 ?auto_209605 ) ) ( not ( = ?auto_209597 ?auto_209599 ) ) ( not ( = ?auto_209598 ?auto_209601 ) ) ( not ( = ?auto_209598 ?auto_209603 ) ) ( not ( = ?auto_209598 ?auto_209605 ) ) ( not ( = ?auto_209598 ?auto_209599 ) ) ( not ( = ?auto_209600 ?auto_209601 ) ) ( not ( = ?auto_209600 ?auto_209603 ) ) ( not ( = ?auto_209600 ?auto_209605 ) ) ( not ( = ?auto_209600 ?auto_209599 ) ) ( not ( = ?auto_209604 ?auto_209601 ) ) ( not ( = ?auto_209604 ?auto_209603 ) ) ( not ( = ?auto_209604 ?auto_209605 ) ) ( not ( = ?auto_209604 ?auto_209599 ) ) ( ON ?auto_209602 ?auto_209604 ) ( ON ?auto_209601 ?auto_209602 ) ( ON ?auto_209599 ?auto_209601 ) ( CLEAR ?auto_209603 ) ( ON ?auto_209605 ?auto_209599 ) ( CLEAR ?auto_209605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209597 ?auto_209598 ?auto_209600 ?auto_209604 ?auto_209602 ?auto_209601 ?auto_209599 )
      ( MAKE-2PILE ?auto_209597 ?auto_209598 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209606 - BLOCK
      ?auto_209607 - BLOCK
    )
    :vars
    (
      ?auto_209612 - BLOCK
      ?auto_209613 - BLOCK
      ?auto_209614 - BLOCK
      ?auto_209610 - BLOCK
      ?auto_209611 - BLOCK
      ?auto_209608 - BLOCK
      ?auto_209609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209612 ?auto_209607 ) ( ON-TABLE ?auto_209606 ) ( ON ?auto_209607 ?auto_209606 ) ( not ( = ?auto_209606 ?auto_209607 ) ) ( not ( = ?auto_209606 ?auto_209612 ) ) ( not ( = ?auto_209607 ?auto_209612 ) ) ( not ( = ?auto_209606 ?auto_209613 ) ) ( not ( = ?auto_209606 ?auto_209614 ) ) ( not ( = ?auto_209607 ?auto_209613 ) ) ( not ( = ?auto_209607 ?auto_209614 ) ) ( not ( = ?auto_209612 ?auto_209613 ) ) ( not ( = ?auto_209612 ?auto_209614 ) ) ( not ( = ?auto_209613 ?auto_209614 ) ) ( ON ?auto_209613 ?auto_209612 ) ( not ( = ?auto_209610 ?auto_209611 ) ) ( not ( = ?auto_209610 ?auto_209608 ) ) ( not ( = ?auto_209610 ?auto_209609 ) ) ( not ( = ?auto_209610 ?auto_209614 ) ) ( not ( = ?auto_209611 ?auto_209608 ) ) ( not ( = ?auto_209611 ?auto_209609 ) ) ( not ( = ?auto_209611 ?auto_209614 ) ) ( not ( = ?auto_209608 ?auto_209609 ) ) ( not ( = ?auto_209608 ?auto_209614 ) ) ( not ( = ?auto_209609 ?auto_209614 ) ) ( not ( = ?auto_209606 ?auto_209609 ) ) ( not ( = ?auto_209606 ?auto_209610 ) ) ( not ( = ?auto_209606 ?auto_209611 ) ) ( not ( = ?auto_209606 ?auto_209608 ) ) ( not ( = ?auto_209607 ?auto_209609 ) ) ( not ( = ?auto_209607 ?auto_209610 ) ) ( not ( = ?auto_209607 ?auto_209611 ) ) ( not ( = ?auto_209607 ?auto_209608 ) ) ( not ( = ?auto_209612 ?auto_209609 ) ) ( not ( = ?auto_209612 ?auto_209610 ) ) ( not ( = ?auto_209612 ?auto_209611 ) ) ( not ( = ?auto_209612 ?auto_209608 ) ) ( not ( = ?auto_209613 ?auto_209609 ) ) ( not ( = ?auto_209613 ?auto_209610 ) ) ( not ( = ?auto_209613 ?auto_209611 ) ) ( not ( = ?auto_209613 ?auto_209608 ) ) ( ON ?auto_209614 ?auto_209613 ) ( ON ?auto_209609 ?auto_209614 ) ( ON ?auto_209608 ?auto_209609 ) ( ON ?auto_209611 ?auto_209608 ) ( CLEAR ?auto_209611 ) ( HOLDING ?auto_209610 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209610 )
      ( MAKE-2PILE ?auto_209606 ?auto_209607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_209615 - BLOCK
      ?auto_209616 - BLOCK
    )
    :vars
    (
      ?auto_209618 - BLOCK
      ?auto_209619 - BLOCK
      ?auto_209621 - BLOCK
      ?auto_209620 - BLOCK
      ?auto_209622 - BLOCK
      ?auto_209623 - BLOCK
      ?auto_209617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209618 ?auto_209616 ) ( ON-TABLE ?auto_209615 ) ( ON ?auto_209616 ?auto_209615 ) ( not ( = ?auto_209615 ?auto_209616 ) ) ( not ( = ?auto_209615 ?auto_209618 ) ) ( not ( = ?auto_209616 ?auto_209618 ) ) ( not ( = ?auto_209615 ?auto_209619 ) ) ( not ( = ?auto_209615 ?auto_209621 ) ) ( not ( = ?auto_209616 ?auto_209619 ) ) ( not ( = ?auto_209616 ?auto_209621 ) ) ( not ( = ?auto_209618 ?auto_209619 ) ) ( not ( = ?auto_209618 ?auto_209621 ) ) ( not ( = ?auto_209619 ?auto_209621 ) ) ( ON ?auto_209619 ?auto_209618 ) ( not ( = ?auto_209620 ?auto_209622 ) ) ( not ( = ?auto_209620 ?auto_209623 ) ) ( not ( = ?auto_209620 ?auto_209617 ) ) ( not ( = ?auto_209620 ?auto_209621 ) ) ( not ( = ?auto_209622 ?auto_209623 ) ) ( not ( = ?auto_209622 ?auto_209617 ) ) ( not ( = ?auto_209622 ?auto_209621 ) ) ( not ( = ?auto_209623 ?auto_209617 ) ) ( not ( = ?auto_209623 ?auto_209621 ) ) ( not ( = ?auto_209617 ?auto_209621 ) ) ( not ( = ?auto_209615 ?auto_209617 ) ) ( not ( = ?auto_209615 ?auto_209620 ) ) ( not ( = ?auto_209615 ?auto_209622 ) ) ( not ( = ?auto_209615 ?auto_209623 ) ) ( not ( = ?auto_209616 ?auto_209617 ) ) ( not ( = ?auto_209616 ?auto_209620 ) ) ( not ( = ?auto_209616 ?auto_209622 ) ) ( not ( = ?auto_209616 ?auto_209623 ) ) ( not ( = ?auto_209618 ?auto_209617 ) ) ( not ( = ?auto_209618 ?auto_209620 ) ) ( not ( = ?auto_209618 ?auto_209622 ) ) ( not ( = ?auto_209618 ?auto_209623 ) ) ( not ( = ?auto_209619 ?auto_209617 ) ) ( not ( = ?auto_209619 ?auto_209620 ) ) ( not ( = ?auto_209619 ?auto_209622 ) ) ( not ( = ?auto_209619 ?auto_209623 ) ) ( ON ?auto_209621 ?auto_209619 ) ( ON ?auto_209617 ?auto_209621 ) ( ON ?auto_209623 ?auto_209617 ) ( ON ?auto_209622 ?auto_209623 ) ( ON ?auto_209620 ?auto_209622 ) ( CLEAR ?auto_209620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_209615 ?auto_209616 ?auto_209618 ?auto_209619 ?auto_209621 ?auto_209617 ?auto_209623 ?auto_209622 )
      ( MAKE-2PILE ?auto_209615 ?auto_209616 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209631 - BLOCK
      ?auto_209632 - BLOCK
      ?auto_209633 - BLOCK
      ?auto_209634 - BLOCK
      ?auto_209635 - BLOCK
      ?auto_209636 - BLOCK
      ?auto_209637 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_209637 ) ( CLEAR ?auto_209636 ) ( ON-TABLE ?auto_209631 ) ( ON ?auto_209632 ?auto_209631 ) ( ON ?auto_209633 ?auto_209632 ) ( ON ?auto_209634 ?auto_209633 ) ( ON ?auto_209635 ?auto_209634 ) ( ON ?auto_209636 ?auto_209635 ) ( not ( = ?auto_209631 ?auto_209632 ) ) ( not ( = ?auto_209631 ?auto_209633 ) ) ( not ( = ?auto_209631 ?auto_209634 ) ) ( not ( = ?auto_209631 ?auto_209635 ) ) ( not ( = ?auto_209631 ?auto_209636 ) ) ( not ( = ?auto_209631 ?auto_209637 ) ) ( not ( = ?auto_209632 ?auto_209633 ) ) ( not ( = ?auto_209632 ?auto_209634 ) ) ( not ( = ?auto_209632 ?auto_209635 ) ) ( not ( = ?auto_209632 ?auto_209636 ) ) ( not ( = ?auto_209632 ?auto_209637 ) ) ( not ( = ?auto_209633 ?auto_209634 ) ) ( not ( = ?auto_209633 ?auto_209635 ) ) ( not ( = ?auto_209633 ?auto_209636 ) ) ( not ( = ?auto_209633 ?auto_209637 ) ) ( not ( = ?auto_209634 ?auto_209635 ) ) ( not ( = ?auto_209634 ?auto_209636 ) ) ( not ( = ?auto_209634 ?auto_209637 ) ) ( not ( = ?auto_209635 ?auto_209636 ) ) ( not ( = ?auto_209635 ?auto_209637 ) ) ( not ( = ?auto_209636 ?auto_209637 ) ) )
    :subtasks
    ( ( !STACK ?auto_209637 ?auto_209636 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209638 - BLOCK
      ?auto_209639 - BLOCK
      ?auto_209640 - BLOCK
      ?auto_209641 - BLOCK
      ?auto_209642 - BLOCK
      ?auto_209643 - BLOCK
      ?auto_209644 - BLOCK
    )
    :vars
    (
      ?auto_209645 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_209643 ) ( ON-TABLE ?auto_209638 ) ( ON ?auto_209639 ?auto_209638 ) ( ON ?auto_209640 ?auto_209639 ) ( ON ?auto_209641 ?auto_209640 ) ( ON ?auto_209642 ?auto_209641 ) ( ON ?auto_209643 ?auto_209642 ) ( not ( = ?auto_209638 ?auto_209639 ) ) ( not ( = ?auto_209638 ?auto_209640 ) ) ( not ( = ?auto_209638 ?auto_209641 ) ) ( not ( = ?auto_209638 ?auto_209642 ) ) ( not ( = ?auto_209638 ?auto_209643 ) ) ( not ( = ?auto_209638 ?auto_209644 ) ) ( not ( = ?auto_209639 ?auto_209640 ) ) ( not ( = ?auto_209639 ?auto_209641 ) ) ( not ( = ?auto_209639 ?auto_209642 ) ) ( not ( = ?auto_209639 ?auto_209643 ) ) ( not ( = ?auto_209639 ?auto_209644 ) ) ( not ( = ?auto_209640 ?auto_209641 ) ) ( not ( = ?auto_209640 ?auto_209642 ) ) ( not ( = ?auto_209640 ?auto_209643 ) ) ( not ( = ?auto_209640 ?auto_209644 ) ) ( not ( = ?auto_209641 ?auto_209642 ) ) ( not ( = ?auto_209641 ?auto_209643 ) ) ( not ( = ?auto_209641 ?auto_209644 ) ) ( not ( = ?auto_209642 ?auto_209643 ) ) ( not ( = ?auto_209642 ?auto_209644 ) ) ( not ( = ?auto_209643 ?auto_209644 ) ) ( ON ?auto_209644 ?auto_209645 ) ( CLEAR ?auto_209644 ) ( HAND-EMPTY ) ( not ( = ?auto_209638 ?auto_209645 ) ) ( not ( = ?auto_209639 ?auto_209645 ) ) ( not ( = ?auto_209640 ?auto_209645 ) ) ( not ( = ?auto_209641 ?auto_209645 ) ) ( not ( = ?auto_209642 ?auto_209645 ) ) ( not ( = ?auto_209643 ?auto_209645 ) ) ( not ( = ?auto_209644 ?auto_209645 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209644 ?auto_209645 )
      ( MAKE-7PILE ?auto_209638 ?auto_209639 ?auto_209640 ?auto_209641 ?auto_209642 ?auto_209643 ?auto_209644 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209646 - BLOCK
      ?auto_209647 - BLOCK
      ?auto_209648 - BLOCK
      ?auto_209649 - BLOCK
      ?auto_209650 - BLOCK
      ?auto_209651 - BLOCK
      ?auto_209652 - BLOCK
    )
    :vars
    (
      ?auto_209653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209646 ) ( ON ?auto_209647 ?auto_209646 ) ( ON ?auto_209648 ?auto_209647 ) ( ON ?auto_209649 ?auto_209648 ) ( ON ?auto_209650 ?auto_209649 ) ( not ( = ?auto_209646 ?auto_209647 ) ) ( not ( = ?auto_209646 ?auto_209648 ) ) ( not ( = ?auto_209646 ?auto_209649 ) ) ( not ( = ?auto_209646 ?auto_209650 ) ) ( not ( = ?auto_209646 ?auto_209651 ) ) ( not ( = ?auto_209646 ?auto_209652 ) ) ( not ( = ?auto_209647 ?auto_209648 ) ) ( not ( = ?auto_209647 ?auto_209649 ) ) ( not ( = ?auto_209647 ?auto_209650 ) ) ( not ( = ?auto_209647 ?auto_209651 ) ) ( not ( = ?auto_209647 ?auto_209652 ) ) ( not ( = ?auto_209648 ?auto_209649 ) ) ( not ( = ?auto_209648 ?auto_209650 ) ) ( not ( = ?auto_209648 ?auto_209651 ) ) ( not ( = ?auto_209648 ?auto_209652 ) ) ( not ( = ?auto_209649 ?auto_209650 ) ) ( not ( = ?auto_209649 ?auto_209651 ) ) ( not ( = ?auto_209649 ?auto_209652 ) ) ( not ( = ?auto_209650 ?auto_209651 ) ) ( not ( = ?auto_209650 ?auto_209652 ) ) ( not ( = ?auto_209651 ?auto_209652 ) ) ( ON ?auto_209652 ?auto_209653 ) ( CLEAR ?auto_209652 ) ( not ( = ?auto_209646 ?auto_209653 ) ) ( not ( = ?auto_209647 ?auto_209653 ) ) ( not ( = ?auto_209648 ?auto_209653 ) ) ( not ( = ?auto_209649 ?auto_209653 ) ) ( not ( = ?auto_209650 ?auto_209653 ) ) ( not ( = ?auto_209651 ?auto_209653 ) ) ( not ( = ?auto_209652 ?auto_209653 ) ) ( HOLDING ?auto_209651 ) ( CLEAR ?auto_209650 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209646 ?auto_209647 ?auto_209648 ?auto_209649 ?auto_209650 ?auto_209651 )
      ( MAKE-7PILE ?auto_209646 ?auto_209647 ?auto_209648 ?auto_209649 ?auto_209650 ?auto_209651 ?auto_209652 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209654 - BLOCK
      ?auto_209655 - BLOCK
      ?auto_209656 - BLOCK
      ?auto_209657 - BLOCK
      ?auto_209658 - BLOCK
      ?auto_209659 - BLOCK
      ?auto_209660 - BLOCK
    )
    :vars
    (
      ?auto_209661 - BLOCK
      ?auto_209662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209654 ) ( ON ?auto_209655 ?auto_209654 ) ( ON ?auto_209656 ?auto_209655 ) ( ON ?auto_209657 ?auto_209656 ) ( ON ?auto_209658 ?auto_209657 ) ( not ( = ?auto_209654 ?auto_209655 ) ) ( not ( = ?auto_209654 ?auto_209656 ) ) ( not ( = ?auto_209654 ?auto_209657 ) ) ( not ( = ?auto_209654 ?auto_209658 ) ) ( not ( = ?auto_209654 ?auto_209659 ) ) ( not ( = ?auto_209654 ?auto_209660 ) ) ( not ( = ?auto_209655 ?auto_209656 ) ) ( not ( = ?auto_209655 ?auto_209657 ) ) ( not ( = ?auto_209655 ?auto_209658 ) ) ( not ( = ?auto_209655 ?auto_209659 ) ) ( not ( = ?auto_209655 ?auto_209660 ) ) ( not ( = ?auto_209656 ?auto_209657 ) ) ( not ( = ?auto_209656 ?auto_209658 ) ) ( not ( = ?auto_209656 ?auto_209659 ) ) ( not ( = ?auto_209656 ?auto_209660 ) ) ( not ( = ?auto_209657 ?auto_209658 ) ) ( not ( = ?auto_209657 ?auto_209659 ) ) ( not ( = ?auto_209657 ?auto_209660 ) ) ( not ( = ?auto_209658 ?auto_209659 ) ) ( not ( = ?auto_209658 ?auto_209660 ) ) ( not ( = ?auto_209659 ?auto_209660 ) ) ( ON ?auto_209660 ?auto_209661 ) ( not ( = ?auto_209654 ?auto_209661 ) ) ( not ( = ?auto_209655 ?auto_209661 ) ) ( not ( = ?auto_209656 ?auto_209661 ) ) ( not ( = ?auto_209657 ?auto_209661 ) ) ( not ( = ?auto_209658 ?auto_209661 ) ) ( not ( = ?auto_209659 ?auto_209661 ) ) ( not ( = ?auto_209660 ?auto_209661 ) ) ( CLEAR ?auto_209658 ) ( ON ?auto_209659 ?auto_209660 ) ( CLEAR ?auto_209659 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209662 ) ( ON ?auto_209661 ?auto_209662 ) ( not ( = ?auto_209662 ?auto_209661 ) ) ( not ( = ?auto_209662 ?auto_209660 ) ) ( not ( = ?auto_209662 ?auto_209659 ) ) ( not ( = ?auto_209654 ?auto_209662 ) ) ( not ( = ?auto_209655 ?auto_209662 ) ) ( not ( = ?auto_209656 ?auto_209662 ) ) ( not ( = ?auto_209657 ?auto_209662 ) ) ( not ( = ?auto_209658 ?auto_209662 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209662 ?auto_209661 ?auto_209660 )
      ( MAKE-7PILE ?auto_209654 ?auto_209655 ?auto_209656 ?auto_209657 ?auto_209658 ?auto_209659 ?auto_209660 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209663 - BLOCK
      ?auto_209664 - BLOCK
      ?auto_209665 - BLOCK
      ?auto_209666 - BLOCK
      ?auto_209667 - BLOCK
      ?auto_209668 - BLOCK
      ?auto_209669 - BLOCK
    )
    :vars
    (
      ?auto_209670 - BLOCK
      ?auto_209671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209663 ) ( ON ?auto_209664 ?auto_209663 ) ( ON ?auto_209665 ?auto_209664 ) ( ON ?auto_209666 ?auto_209665 ) ( not ( = ?auto_209663 ?auto_209664 ) ) ( not ( = ?auto_209663 ?auto_209665 ) ) ( not ( = ?auto_209663 ?auto_209666 ) ) ( not ( = ?auto_209663 ?auto_209667 ) ) ( not ( = ?auto_209663 ?auto_209668 ) ) ( not ( = ?auto_209663 ?auto_209669 ) ) ( not ( = ?auto_209664 ?auto_209665 ) ) ( not ( = ?auto_209664 ?auto_209666 ) ) ( not ( = ?auto_209664 ?auto_209667 ) ) ( not ( = ?auto_209664 ?auto_209668 ) ) ( not ( = ?auto_209664 ?auto_209669 ) ) ( not ( = ?auto_209665 ?auto_209666 ) ) ( not ( = ?auto_209665 ?auto_209667 ) ) ( not ( = ?auto_209665 ?auto_209668 ) ) ( not ( = ?auto_209665 ?auto_209669 ) ) ( not ( = ?auto_209666 ?auto_209667 ) ) ( not ( = ?auto_209666 ?auto_209668 ) ) ( not ( = ?auto_209666 ?auto_209669 ) ) ( not ( = ?auto_209667 ?auto_209668 ) ) ( not ( = ?auto_209667 ?auto_209669 ) ) ( not ( = ?auto_209668 ?auto_209669 ) ) ( ON ?auto_209669 ?auto_209670 ) ( not ( = ?auto_209663 ?auto_209670 ) ) ( not ( = ?auto_209664 ?auto_209670 ) ) ( not ( = ?auto_209665 ?auto_209670 ) ) ( not ( = ?auto_209666 ?auto_209670 ) ) ( not ( = ?auto_209667 ?auto_209670 ) ) ( not ( = ?auto_209668 ?auto_209670 ) ) ( not ( = ?auto_209669 ?auto_209670 ) ) ( ON ?auto_209668 ?auto_209669 ) ( CLEAR ?auto_209668 ) ( ON-TABLE ?auto_209671 ) ( ON ?auto_209670 ?auto_209671 ) ( not ( = ?auto_209671 ?auto_209670 ) ) ( not ( = ?auto_209671 ?auto_209669 ) ) ( not ( = ?auto_209671 ?auto_209668 ) ) ( not ( = ?auto_209663 ?auto_209671 ) ) ( not ( = ?auto_209664 ?auto_209671 ) ) ( not ( = ?auto_209665 ?auto_209671 ) ) ( not ( = ?auto_209666 ?auto_209671 ) ) ( not ( = ?auto_209667 ?auto_209671 ) ) ( HOLDING ?auto_209667 ) ( CLEAR ?auto_209666 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209663 ?auto_209664 ?auto_209665 ?auto_209666 ?auto_209667 )
      ( MAKE-7PILE ?auto_209663 ?auto_209664 ?auto_209665 ?auto_209666 ?auto_209667 ?auto_209668 ?auto_209669 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209672 - BLOCK
      ?auto_209673 - BLOCK
      ?auto_209674 - BLOCK
      ?auto_209675 - BLOCK
      ?auto_209676 - BLOCK
      ?auto_209677 - BLOCK
      ?auto_209678 - BLOCK
    )
    :vars
    (
      ?auto_209680 - BLOCK
      ?auto_209679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209672 ) ( ON ?auto_209673 ?auto_209672 ) ( ON ?auto_209674 ?auto_209673 ) ( ON ?auto_209675 ?auto_209674 ) ( not ( = ?auto_209672 ?auto_209673 ) ) ( not ( = ?auto_209672 ?auto_209674 ) ) ( not ( = ?auto_209672 ?auto_209675 ) ) ( not ( = ?auto_209672 ?auto_209676 ) ) ( not ( = ?auto_209672 ?auto_209677 ) ) ( not ( = ?auto_209672 ?auto_209678 ) ) ( not ( = ?auto_209673 ?auto_209674 ) ) ( not ( = ?auto_209673 ?auto_209675 ) ) ( not ( = ?auto_209673 ?auto_209676 ) ) ( not ( = ?auto_209673 ?auto_209677 ) ) ( not ( = ?auto_209673 ?auto_209678 ) ) ( not ( = ?auto_209674 ?auto_209675 ) ) ( not ( = ?auto_209674 ?auto_209676 ) ) ( not ( = ?auto_209674 ?auto_209677 ) ) ( not ( = ?auto_209674 ?auto_209678 ) ) ( not ( = ?auto_209675 ?auto_209676 ) ) ( not ( = ?auto_209675 ?auto_209677 ) ) ( not ( = ?auto_209675 ?auto_209678 ) ) ( not ( = ?auto_209676 ?auto_209677 ) ) ( not ( = ?auto_209676 ?auto_209678 ) ) ( not ( = ?auto_209677 ?auto_209678 ) ) ( ON ?auto_209678 ?auto_209680 ) ( not ( = ?auto_209672 ?auto_209680 ) ) ( not ( = ?auto_209673 ?auto_209680 ) ) ( not ( = ?auto_209674 ?auto_209680 ) ) ( not ( = ?auto_209675 ?auto_209680 ) ) ( not ( = ?auto_209676 ?auto_209680 ) ) ( not ( = ?auto_209677 ?auto_209680 ) ) ( not ( = ?auto_209678 ?auto_209680 ) ) ( ON ?auto_209677 ?auto_209678 ) ( ON-TABLE ?auto_209679 ) ( ON ?auto_209680 ?auto_209679 ) ( not ( = ?auto_209679 ?auto_209680 ) ) ( not ( = ?auto_209679 ?auto_209678 ) ) ( not ( = ?auto_209679 ?auto_209677 ) ) ( not ( = ?auto_209672 ?auto_209679 ) ) ( not ( = ?auto_209673 ?auto_209679 ) ) ( not ( = ?auto_209674 ?auto_209679 ) ) ( not ( = ?auto_209675 ?auto_209679 ) ) ( not ( = ?auto_209676 ?auto_209679 ) ) ( CLEAR ?auto_209675 ) ( ON ?auto_209676 ?auto_209677 ) ( CLEAR ?auto_209676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209679 ?auto_209680 ?auto_209678 ?auto_209677 )
      ( MAKE-7PILE ?auto_209672 ?auto_209673 ?auto_209674 ?auto_209675 ?auto_209676 ?auto_209677 ?auto_209678 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209681 - BLOCK
      ?auto_209682 - BLOCK
      ?auto_209683 - BLOCK
      ?auto_209684 - BLOCK
      ?auto_209685 - BLOCK
      ?auto_209686 - BLOCK
      ?auto_209687 - BLOCK
    )
    :vars
    (
      ?auto_209689 - BLOCK
      ?auto_209688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209681 ) ( ON ?auto_209682 ?auto_209681 ) ( ON ?auto_209683 ?auto_209682 ) ( not ( = ?auto_209681 ?auto_209682 ) ) ( not ( = ?auto_209681 ?auto_209683 ) ) ( not ( = ?auto_209681 ?auto_209684 ) ) ( not ( = ?auto_209681 ?auto_209685 ) ) ( not ( = ?auto_209681 ?auto_209686 ) ) ( not ( = ?auto_209681 ?auto_209687 ) ) ( not ( = ?auto_209682 ?auto_209683 ) ) ( not ( = ?auto_209682 ?auto_209684 ) ) ( not ( = ?auto_209682 ?auto_209685 ) ) ( not ( = ?auto_209682 ?auto_209686 ) ) ( not ( = ?auto_209682 ?auto_209687 ) ) ( not ( = ?auto_209683 ?auto_209684 ) ) ( not ( = ?auto_209683 ?auto_209685 ) ) ( not ( = ?auto_209683 ?auto_209686 ) ) ( not ( = ?auto_209683 ?auto_209687 ) ) ( not ( = ?auto_209684 ?auto_209685 ) ) ( not ( = ?auto_209684 ?auto_209686 ) ) ( not ( = ?auto_209684 ?auto_209687 ) ) ( not ( = ?auto_209685 ?auto_209686 ) ) ( not ( = ?auto_209685 ?auto_209687 ) ) ( not ( = ?auto_209686 ?auto_209687 ) ) ( ON ?auto_209687 ?auto_209689 ) ( not ( = ?auto_209681 ?auto_209689 ) ) ( not ( = ?auto_209682 ?auto_209689 ) ) ( not ( = ?auto_209683 ?auto_209689 ) ) ( not ( = ?auto_209684 ?auto_209689 ) ) ( not ( = ?auto_209685 ?auto_209689 ) ) ( not ( = ?auto_209686 ?auto_209689 ) ) ( not ( = ?auto_209687 ?auto_209689 ) ) ( ON ?auto_209686 ?auto_209687 ) ( ON-TABLE ?auto_209688 ) ( ON ?auto_209689 ?auto_209688 ) ( not ( = ?auto_209688 ?auto_209689 ) ) ( not ( = ?auto_209688 ?auto_209687 ) ) ( not ( = ?auto_209688 ?auto_209686 ) ) ( not ( = ?auto_209681 ?auto_209688 ) ) ( not ( = ?auto_209682 ?auto_209688 ) ) ( not ( = ?auto_209683 ?auto_209688 ) ) ( not ( = ?auto_209684 ?auto_209688 ) ) ( not ( = ?auto_209685 ?auto_209688 ) ) ( ON ?auto_209685 ?auto_209686 ) ( CLEAR ?auto_209685 ) ( HOLDING ?auto_209684 ) ( CLEAR ?auto_209683 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209681 ?auto_209682 ?auto_209683 ?auto_209684 )
      ( MAKE-7PILE ?auto_209681 ?auto_209682 ?auto_209683 ?auto_209684 ?auto_209685 ?auto_209686 ?auto_209687 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209690 - BLOCK
      ?auto_209691 - BLOCK
      ?auto_209692 - BLOCK
      ?auto_209693 - BLOCK
      ?auto_209694 - BLOCK
      ?auto_209695 - BLOCK
      ?auto_209696 - BLOCK
    )
    :vars
    (
      ?auto_209697 - BLOCK
      ?auto_209698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209690 ) ( ON ?auto_209691 ?auto_209690 ) ( ON ?auto_209692 ?auto_209691 ) ( not ( = ?auto_209690 ?auto_209691 ) ) ( not ( = ?auto_209690 ?auto_209692 ) ) ( not ( = ?auto_209690 ?auto_209693 ) ) ( not ( = ?auto_209690 ?auto_209694 ) ) ( not ( = ?auto_209690 ?auto_209695 ) ) ( not ( = ?auto_209690 ?auto_209696 ) ) ( not ( = ?auto_209691 ?auto_209692 ) ) ( not ( = ?auto_209691 ?auto_209693 ) ) ( not ( = ?auto_209691 ?auto_209694 ) ) ( not ( = ?auto_209691 ?auto_209695 ) ) ( not ( = ?auto_209691 ?auto_209696 ) ) ( not ( = ?auto_209692 ?auto_209693 ) ) ( not ( = ?auto_209692 ?auto_209694 ) ) ( not ( = ?auto_209692 ?auto_209695 ) ) ( not ( = ?auto_209692 ?auto_209696 ) ) ( not ( = ?auto_209693 ?auto_209694 ) ) ( not ( = ?auto_209693 ?auto_209695 ) ) ( not ( = ?auto_209693 ?auto_209696 ) ) ( not ( = ?auto_209694 ?auto_209695 ) ) ( not ( = ?auto_209694 ?auto_209696 ) ) ( not ( = ?auto_209695 ?auto_209696 ) ) ( ON ?auto_209696 ?auto_209697 ) ( not ( = ?auto_209690 ?auto_209697 ) ) ( not ( = ?auto_209691 ?auto_209697 ) ) ( not ( = ?auto_209692 ?auto_209697 ) ) ( not ( = ?auto_209693 ?auto_209697 ) ) ( not ( = ?auto_209694 ?auto_209697 ) ) ( not ( = ?auto_209695 ?auto_209697 ) ) ( not ( = ?auto_209696 ?auto_209697 ) ) ( ON ?auto_209695 ?auto_209696 ) ( ON-TABLE ?auto_209698 ) ( ON ?auto_209697 ?auto_209698 ) ( not ( = ?auto_209698 ?auto_209697 ) ) ( not ( = ?auto_209698 ?auto_209696 ) ) ( not ( = ?auto_209698 ?auto_209695 ) ) ( not ( = ?auto_209690 ?auto_209698 ) ) ( not ( = ?auto_209691 ?auto_209698 ) ) ( not ( = ?auto_209692 ?auto_209698 ) ) ( not ( = ?auto_209693 ?auto_209698 ) ) ( not ( = ?auto_209694 ?auto_209698 ) ) ( ON ?auto_209694 ?auto_209695 ) ( CLEAR ?auto_209692 ) ( ON ?auto_209693 ?auto_209694 ) ( CLEAR ?auto_209693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209698 ?auto_209697 ?auto_209696 ?auto_209695 ?auto_209694 )
      ( MAKE-7PILE ?auto_209690 ?auto_209691 ?auto_209692 ?auto_209693 ?auto_209694 ?auto_209695 ?auto_209696 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209699 - BLOCK
      ?auto_209700 - BLOCK
      ?auto_209701 - BLOCK
      ?auto_209702 - BLOCK
      ?auto_209703 - BLOCK
      ?auto_209704 - BLOCK
      ?auto_209705 - BLOCK
    )
    :vars
    (
      ?auto_209707 - BLOCK
      ?auto_209706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209699 ) ( ON ?auto_209700 ?auto_209699 ) ( not ( = ?auto_209699 ?auto_209700 ) ) ( not ( = ?auto_209699 ?auto_209701 ) ) ( not ( = ?auto_209699 ?auto_209702 ) ) ( not ( = ?auto_209699 ?auto_209703 ) ) ( not ( = ?auto_209699 ?auto_209704 ) ) ( not ( = ?auto_209699 ?auto_209705 ) ) ( not ( = ?auto_209700 ?auto_209701 ) ) ( not ( = ?auto_209700 ?auto_209702 ) ) ( not ( = ?auto_209700 ?auto_209703 ) ) ( not ( = ?auto_209700 ?auto_209704 ) ) ( not ( = ?auto_209700 ?auto_209705 ) ) ( not ( = ?auto_209701 ?auto_209702 ) ) ( not ( = ?auto_209701 ?auto_209703 ) ) ( not ( = ?auto_209701 ?auto_209704 ) ) ( not ( = ?auto_209701 ?auto_209705 ) ) ( not ( = ?auto_209702 ?auto_209703 ) ) ( not ( = ?auto_209702 ?auto_209704 ) ) ( not ( = ?auto_209702 ?auto_209705 ) ) ( not ( = ?auto_209703 ?auto_209704 ) ) ( not ( = ?auto_209703 ?auto_209705 ) ) ( not ( = ?auto_209704 ?auto_209705 ) ) ( ON ?auto_209705 ?auto_209707 ) ( not ( = ?auto_209699 ?auto_209707 ) ) ( not ( = ?auto_209700 ?auto_209707 ) ) ( not ( = ?auto_209701 ?auto_209707 ) ) ( not ( = ?auto_209702 ?auto_209707 ) ) ( not ( = ?auto_209703 ?auto_209707 ) ) ( not ( = ?auto_209704 ?auto_209707 ) ) ( not ( = ?auto_209705 ?auto_209707 ) ) ( ON ?auto_209704 ?auto_209705 ) ( ON-TABLE ?auto_209706 ) ( ON ?auto_209707 ?auto_209706 ) ( not ( = ?auto_209706 ?auto_209707 ) ) ( not ( = ?auto_209706 ?auto_209705 ) ) ( not ( = ?auto_209706 ?auto_209704 ) ) ( not ( = ?auto_209699 ?auto_209706 ) ) ( not ( = ?auto_209700 ?auto_209706 ) ) ( not ( = ?auto_209701 ?auto_209706 ) ) ( not ( = ?auto_209702 ?auto_209706 ) ) ( not ( = ?auto_209703 ?auto_209706 ) ) ( ON ?auto_209703 ?auto_209704 ) ( ON ?auto_209702 ?auto_209703 ) ( CLEAR ?auto_209702 ) ( HOLDING ?auto_209701 ) ( CLEAR ?auto_209700 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209699 ?auto_209700 ?auto_209701 )
      ( MAKE-7PILE ?auto_209699 ?auto_209700 ?auto_209701 ?auto_209702 ?auto_209703 ?auto_209704 ?auto_209705 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209708 - BLOCK
      ?auto_209709 - BLOCK
      ?auto_209710 - BLOCK
      ?auto_209711 - BLOCK
      ?auto_209712 - BLOCK
      ?auto_209713 - BLOCK
      ?auto_209714 - BLOCK
    )
    :vars
    (
      ?auto_209716 - BLOCK
      ?auto_209715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209708 ) ( ON ?auto_209709 ?auto_209708 ) ( not ( = ?auto_209708 ?auto_209709 ) ) ( not ( = ?auto_209708 ?auto_209710 ) ) ( not ( = ?auto_209708 ?auto_209711 ) ) ( not ( = ?auto_209708 ?auto_209712 ) ) ( not ( = ?auto_209708 ?auto_209713 ) ) ( not ( = ?auto_209708 ?auto_209714 ) ) ( not ( = ?auto_209709 ?auto_209710 ) ) ( not ( = ?auto_209709 ?auto_209711 ) ) ( not ( = ?auto_209709 ?auto_209712 ) ) ( not ( = ?auto_209709 ?auto_209713 ) ) ( not ( = ?auto_209709 ?auto_209714 ) ) ( not ( = ?auto_209710 ?auto_209711 ) ) ( not ( = ?auto_209710 ?auto_209712 ) ) ( not ( = ?auto_209710 ?auto_209713 ) ) ( not ( = ?auto_209710 ?auto_209714 ) ) ( not ( = ?auto_209711 ?auto_209712 ) ) ( not ( = ?auto_209711 ?auto_209713 ) ) ( not ( = ?auto_209711 ?auto_209714 ) ) ( not ( = ?auto_209712 ?auto_209713 ) ) ( not ( = ?auto_209712 ?auto_209714 ) ) ( not ( = ?auto_209713 ?auto_209714 ) ) ( ON ?auto_209714 ?auto_209716 ) ( not ( = ?auto_209708 ?auto_209716 ) ) ( not ( = ?auto_209709 ?auto_209716 ) ) ( not ( = ?auto_209710 ?auto_209716 ) ) ( not ( = ?auto_209711 ?auto_209716 ) ) ( not ( = ?auto_209712 ?auto_209716 ) ) ( not ( = ?auto_209713 ?auto_209716 ) ) ( not ( = ?auto_209714 ?auto_209716 ) ) ( ON ?auto_209713 ?auto_209714 ) ( ON-TABLE ?auto_209715 ) ( ON ?auto_209716 ?auto_209715 ) ( not ( = ?auto_209715 ?auto_209716 ) ) ( not ( = ?auto_209715 ?auto_209714 ) ) ( not ( = ?auto_209715 ?auto_209713 ) ) ( not ( = ?auto_209708 ?auto_209715 ) ) ( not ( = ?auto_209709 ?auto_209715 ) ) ( not ( = ?auto_209710 ?auto_209715 ) ) ( not ( = ?auto_209711 ?auto_209715 ) ) ( not ( = ?auto_209712 ?auto_209715 ) ) ( ON ?auto_209712 ?auto_209713 ) ( ON ?auto_209711 ?auto_209712 ) ( CLEAR ?auto_209709 ) ( ON ?auto_209710 ?auto_209711 ) ( CLEAR ?auto_209710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209715 ?auto_209716 ?auto_209714 ?auto_209713 ?auto_209712 ?auto_209711 )
      ( MAKE-7PILE ?auto_209708 ?auto_209709 ?auto_209710 ?auto_209711 ?auto_209712 ?auto_209713 ?auto_209714 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209717 - BLOCK
      ?auto_209718 - BLOCK
      ?auto_209719 - BLOCK
      ?auto_209720 - BLOCK
      ?auto_209721 - BLOCK
      ?auto_209722 - BLOCK
      ?auto_209723 - BLOCK
    )
    :vars
    (
      ?auto_209725 - BLOCK
      ?auto_209724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209717 ) ( not ( = ?auto_209717 ?auto_209718 ) ) ( not ( = ?auto_209717 ?auto_209719 ) ) ( not ( = ?auto_209717 ?auto_209720 ) ) ( not ( = ?auto_209717 ?auto_209721 ) ) ( not ( = ?auto_209717 ?auto_209722 ) ) ( not ( = ?auto_209717 ?auto_209723 ) ) ( not ( = ?auto_209718 ?auto_209719 ) ) ( not ( = ?auto_209718 ?auto_209720 ) ) ( not ( = ?auto_209718 ?auto_209721 ) ) ( not ( = ?auto_209718 ?auto_209722 ) ) ( not ( = ?auto_209718 ?auto_209723 ) ) ( not ( = ?auto_209719 ?auto_209720 ) ) ( not ( = ?auto_209719 ?auto_209721 ) ) ( not ( = ?auto_209719 ?auto_209722 ) ) ( not ( = ?auto_209719 ?auto_209723 ) ) ( not ( = ?auto_209720 ?auto_209721 ) ) ( not ( = ?auto_209720 ?auto_209722 ) ) ( not ( = ?auto_209720 ?auto_209723 ) ) ( not ( = ?auto_209721 ?auto_209722 ) ) ( not ( = ?auto_209721 ?auto_209723 ) ) ( not ( = ?auto_209722 ?auto_209723 ) ) ( ON ?auto_209723 ?auto_209725 ) ( not ( = ?auto_209717 ?auto_209725 ) ) ( not ( = ?auto_209718 ?auto_209725 ) ) ( not ( = ?auto_209719 ?auto_209725 ) ) ( not ( = ?auto_209720 ?auto_209725 ) ) ( not ( = ?auto_209721 ?auto_209725 ) ) ( not ( = ?auto_209722 ?auto_209725 ) ) ( not ( = ?auto_209723 ?auto_209725 ) ) ( ON ?auto_209722 ?auto_209723 ) ( ON-TABLE ?auto_209724 ) ( ON ?auto_209725 ?auto_209724 ) ( not ( = ?auto_209724 ?auto_209725 ) ) ( not ( = ?auto_209724 ?auto_209723 ) ) ( not ( = ?auto_209724 ?auto_209722 ) ) ( not ( = ?auto_209717 ?auto_209724 ) ) ( not ( = ?auto_209718 ?auto_209724 ) ) ( not ( = ?auto_209719 ?auto_209724 ) ) ( not ( = ?auto_209720 ?auto_209724 ) ) ( not ( = ?auto_209721 ?auto_209724 ) ) ( ON ?auto_209721 ?auto_209722 ) ( ON ?auto_209720 ?auto_209721 ) ( ON ?auto_209719 ?auto_209720 ) ( CLEAR ?auto_209719 ) ( HOLDING ?auto_209718 ) ( CLEAR ?auto_209717 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209717 ?auto_209718 )
      ( MAKE-7PILE ?auto_209717 ?auto_209718 ?auto_209719 ?auto_209720 ?auto_209721 ?auto_209722 ?auto_209723 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209726 - BLOCK
      ?auto_209727 - BLOCK
      ?auto_209728 - BLOCK
      ?auto_209729 - BLOCK
      ?auto_209730 - BLOCK
      ?auto_209731 - BLOCK
      ?auto_209732 - BLOCK
    )
    :vars
    (
      ?auto_209734 - BLOCK
      ?auto_209733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209726 ) ( not ( = ?auto_209726 ?auto_209727 ) ) ( not ( = ?auto_209726 ?auto_209728 ) ) ( not ( = ?auto_209726 ?auto_209729 ) ) ( not ( = ?auto_209726 ?auto_209730 ) ) ( not ( = ?auto_209726 ?auto_209731 ) ) ( not ( = ?auto_209726 ?auto_209732 ) ) ( not ( = ?auto_209727 ?auto_209728 ) ) ( not ( = ?auto_209727 ?auto_209729 ) ) ( not ( = ?auto_209727 ?auto_209730 ) ) ( not ( = ?auto_209727 ?auto_209731 ) ) ( not ( = ?auto_209727 ?auto_209732 ) ) ( not ( = ?auto_209728 ?auto_209729 ) ) ( not ( = ?auto_209728 ?auto_209730 ) ) ( not ( = ?auto_209728 ?auto_209731 ) ) ( not ( = ?auto_209728 ?auto_209732 ) ) ( not ( = ?auto_209729 ?auto_209730 ) ) ( not ( = ?auto_209729 ?auto_209731 ) ) ( not ( = ?auto_209729 ?auto_209732 ) ) ( not ( = ?auto_209730 ?auto_209731 ) ) ( not ( = ?auto_209730 ?auto_209732 ) ) ( not ( = ?auto_209731 ?auto_209732 ) ) ( ON ?auto_209732 ?auto_209734 ) ( not ( = ?auto_209726 ?auto_209734 ) ) ( not ( = ?auto_209727 ?auto_209734 ) ) ( not ( = ?auto_209728 ?auto_209734 ) ) ( not ( = ?auto_209729 ?auto_209734 ) ) ( not ( = ?auto_209730 ?auto_209734 ) ) ( not ( = ?auto_209731 ?auto_209734 ) ) ( not ( = ?auto_209732 ?auto_209734 ) ) ( ON ?auto_209731 ?auto_209732 ) ( ON-TABLE ?auto_209733 ) ( ON ?auto_209734 ?auto_209733 ) ( not ( = ?auto_209733 ?auto_209734 ) ) ( not ( = ?auto_209733 ?auto_209732 ) ) ( not ( = ?auto_209733 ?auto_209731 ) ) ( not ( = ?auto_209726 ?auto_209733 ) ) ( not ( = ?auto_209727 ?auto_209733 ) ) ( not ( = ?auto_209728 ?auto_209733 ) ) ( not ( = ?auto_209729 ?auto_209733 ) ) ( not ( = ?auto_209730 ?auto_209733 ) ) ( ON ?auto_209730 ?auto_209731 ) ( ON ?auto_209729 ?auto_209730 ) ( ON ?auto_209728 ?auto_209729 ) ( CLEAR ?auto_209726 ) ( ON ?auto_209727 ?auto_209728 ) ( CLEAR ?auto_209727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209733 ?auto_209734 ?auto_209732 ?auto_209731 ?auto_209730 ?auto_209729 ?auto_209728 )
      ( MAKE-7PILE ?auto_209726 ?auto_209727 ?auto_209728 ?auto_209729 ?auto_209730 ?auto_209731 ?auto_209732 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209735 - BLOCK
      ?auto_209736 - BLOCK
      ?auto_209737 - BLOCK
      ?auto_209738 - BLOCK
      ?auto_209739 - BLOCK
      ?auto_209740 - BLOCK
      ?auto_209741 - BLOCK
    )
    :vars
    (
      ?auto_209742 - BLOCK
      ?auto_209743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_209735 ?auto_209736 ) ) ( not ( = ?auto_209735 ?auto_209737 ) ) ( not ( = ?auto_209735 ?auto_209738 ) ) ( not ( = ?auto_209735 ?auto_209739 ) ) ( not ( = ?auto_209735 ?auto_209740 ) ) ( not ( = ?auto_209735 ?auto_209741 ) ) ( not ( = ?auto_209736 ?auto_209737 ) ) ( not ( = ?auto_209736 ?auto_209738 ) ) ( not ( = ?auto_209736 ?auto_209739 ) ) ( not ( = ?auto_209736 ?auto_209740 ) ) ( not ( = ?auto_209736 ?auto_209741 ) ) ( not ( = ?auto_209737 ?auto_209738 ) ) ( not ( = ?auto_209737 ?auto_209739 ) ) ( not ( = ?auto_209737 ?auto_209740 ) ) ( not ( = ?auto_209737 ?auto_209741 ) ) ( not ( = ?auto_209738 ?auto_209739 ) ) ( not ( = ?auto_209738 ?auto_209740 ) ) ( not ( = ?auto_209738 ?auto_209741 ) ) ( not ( = ?auto_209739 ?auto_209740 ) ) ( not ( = ?auto_209739 ?auto_209741 ) ) ( not ( = ?auto_209740 ?auto_209741 ) ) ( ON ?auto_209741 ?auto_209742 ) ( not ( = ?auto_209735 ?auto_209742 ) ) ( not ( = ?auto_209736 ?auto_209742 ) ) ( not ( = ?auto_209737 ?auto_209742 ) ) ( not ( = ?auto_209738 ?auto_209742 ) ) ( not ( = ?auto_209739 ?auto_209742 ) ) ( not ( = ?auto_209740 ?auto_209742 ) ) ( not ( = ?auto_209741 ?auto_209742 ) ) ( ON ?auto_209740 ?auto_209741 ) ( ON-TABLE ?auto_209743 ) ( ON ?auto_209742 ?auto_209743 ) ( not ( = ?auto_209743 ?auto_209742 ) ) ( not ( = ?auto_209743 ?auto_209741 ) ) ( not ( = ?auto_209743 ?auto_209740 ) ) ( not ( = ?auto_209735 ?auto_209743 ) ) ( not ( = ?auto_209736 ?auto_209743 ) ) ( not ( = ?auto_209737 ?auto_209743 ) ) ( not ( = ?auto_209738 ?auto_209743 ) ) ( not ( = ?auto_209739 ?auto_209743 ) ) ( ON ?auto_209739 ?auto_209740 ) ( ON ?auto_209738 ?auto_209739 ) ( ON ?auto_209737 ?auto_209738 ) ( ON ?auto_209736 ?auto_209737 ) ( CLEAR ?auto_209736 ) ( HOLDING ?auto_209735 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209735 )
      ( MAKE-7PILE ?auto_209735 ?auto_209736 ?auto_209737 ?auto_209738 ?auto_209739 ?auto_209740 ?auto_209741 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209744 - BLOCK
      ?auto_209745 - BLOCK
      ?auto_209746 - BLOCK
      ?auto_209747 - BLOCK
      ?auto_209748 - BLOCK
      ?auto_209749 - BLOCK
      ?auto_209750 - BLOCK
    )
    :vars
    (
      ?auto_209751 - BLOCK
      ?auto_209752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_209744 ?auto_209745 ) ) ( not ( = ?auto_209744 ?auto_209746 ) ) ( not ( = ?auto_209744 ?auto_209747 ) ) ( not ( = ?auto_209744 ?auto_209748 ) ) ( not ( = ?auto_209744 ?auto_209749 ) ) ( not ( = ?auto_209744 ?auto_209750 ) ) ( not ( = ?auto_209745 ?auto_209746 ) ) ( not ( = ?auto_209745 ?auto_209747 ) ) ( not ( = ?auto_209745 ?auto_209748 ) ) ( not ( = ?auto_209745 ?auto_209749 ) ) ( not ( = ?auto_209745 ?auto_209750 ) ) ( not ( = ?auto_209746 ?auto_209747 ) ) ( not ( = ?auto_209746 ?auto_209748 ) ) ( not ( = ?auto_209746 ?auto_209749 ) ) ( not ( = ?auto_209746 ?auto_209750 ) ) ( not ( = ?auto_209747 ?auto_209748 ) ) ( not ( = ?auto_209747 ?auto_209749 ) ) ( not ( = ?auto_209747 ?auto_209750 ) ) ( not ( = ?auto_209748 ?auto_209749 ) ) ( not ( = ?auto_209748 ?auto_209750 ) ) ( not ( = ?auto_209749 ?auto_209750 ) ) ( ON ?auto_209750 ?auto_209751 ) ( not ( = ?auto_209744 ?auto_209751 ) ) ( not ( = ?auto_209745 ?auto_209751 ) ) ( not ( = ?auto_209746 ?auto_209751 ) ) ( not ( = ?auto_209747 ?auto_209751 ) ) ( not ( = ?auto_209748 ?auto_209751 ) ) ( not ( = ?auto_209749 ?auto_209751 ) ) ( not ( = ?auto_209750 ?auto_209751 ) ) ( ON ?auto_209749 ?auto_209750 ) ( ON-TABLE ?auto_209752 ) ( ON ?auto_209751 ?auto_209752 ) ( not ( = ?auto_209752 ?auto_209751 ) ) ( not ( = ?auto_209752 ?auto_209750 ) ) ( not ( = ?auto_209752 ?auto_209749 ) ) ( not ( = ?auto_209744 ?auto_209752 ) ) ( not ( = ?auto_209745 ?auto_209752 ) ) ( not ( = ?auto_209746 ?auto_209752 ) ) ( not ( = ?auto_209747 ?auto_209752 ) ) ( not ( = ?auto_209748 ?auto_209752 ) ) ( ON ?auto_209748 ?auto_209749 ) ( ON ?auto_209747 ?auto_209748 ) ( ON ?auto_209746 ?auto_209747 ) ( ON ?auto_209745 ?auto_209746 ) ( ON ?auto_209744 ?auto_209745 ) ( CLEAR ?auto_209744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_209752 ?auto_209751 ?auto_209750 ?auto_209749 ?auto_209748 ?auto_209747 ?auto_209746 ?auto_209745 )
      ( MAKE-7PILE ?auto_209744 ?auto_209745 ?auto_209746 ?auto_209747 ?auto_209748 ?auto_209749 ?auto_209750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209754 - BLOCK
    )
    :vars
    (
      ?auto_209755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209755 ?auto_209754 ) ( CLEAR ?auto_209755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209754 ) ( not ( = ?auto_209754 ?auto_209755 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209755 ?auto_209754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209756 - BLOCK
    )
    :vars
    (
      ?auto_209757 - BLOCK
      ?auto_209758 - BLOCK
      ?auto_209759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209757 ?auto_209756 ) ( CLEAR ?auto_209757 ) ( ON-TABLE ?auto_209756 ) ( not ( = ?auto_209756 ?auto_209757 ) ) ( HOLDING ?auto_209758 ) ( CLEAR ?auto_209759 ) ( not ( = ?auto_209756 ?auto_209758 ) ) ( not ( = ?auto_209756 ?auto_209759 ) ) ( not ( = ?auto_209757 ?auto_209758 ) ) ( not ( = ?auto_209757 ?auto_209759 ) ) ( not ( = ?auto_209758 ?auto_209759 ) ) )
    :subtasks
    ( ( !STACK ?auto_209758 ?auto_209759 )
      ( MAKE-1PILE ?auto_209756 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209760 - BLOCK
    )
    :vars
    (
      ?auto_209762 - BLOCK
      ?auto_209763 - BLOCK
      ?auto_209761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209762 ?auto_209760 ) ( ON-TABLE ?auto_209760 ) ( not ( = ?auto_209760 ?auto_209762 ) ) ( CLEAR ?auto_209763 ) ( not ( = ?auto_209760 ?auto_209761 ) ) ( not ( = ?auto_209760 ?auto_209763 ) ) ( not ( = ?auto_209762 ?auto_209761 ) ) ( not ( = ?auto_209762 ?auto_209763 ) ) ( not ( = ?auto_209761 ?auto_209763 ) ) ( ON ?auto_209761 ?auto_209762 ) ( CLEAR ?auto_209761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209760 ?auto_209762 )
      ( MAKE-1PILE ?auto_209760 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209764 - BLOCK
    )
    :vars
    (
      ?auto_209767 - BLOCK
      ?auto_209765 - BLOCK
      ?auto_209766 - BLOCK
      ?auto_209771 - BLOCK
      ?auto_209772 - BLOCK
      ?auto_209768 - BLOCK
      ?auto_209769 - BLOCK
      ?auto_209770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209767 ?auto_209764 ) ( ON-TABLE ?auto_209764 ) ( not ( = ?auto_209764 ?auto_209767 ) ) ( not ( = ?auto_209764 ?auto_209765 ) ) ( not ( = ?auto_209764 ?auto_209766 ) ) ( not ( = ?auto_209767 ?auto_209765 ) ) ( not ( = ?auto_209767 ?auto_209766 ) ) ( not ( = ?auto_209765 ?auto_209766 ) ) ( ON ?auto_209765 ?auto_209767 ) ( CLEAR ?auto_209765 ) ( HOLDING ?auto_209766 ) ( CLEAR ?auto_209771 ) ( ON-TABLE ?auto_209772 ) ( ON ?auto_209768 ?auto_209772 ) ( ON ?auto_209769 ?auto_209768 ) ( ON ?auto_209770 ?auto_209769 ) ( ON ?auto_209771 ?auto_209770 ) ( not ( = ?auto_209772 ?auto_209768 ) ) ( not ( = ?auto_209772 ?auto_209769 ) ) ( not ( = ?auto_209772 ?auto_209770 ) ) ( not ( = ?auto_209772 ?auto_209771 ) ) ( not ( = ?auto_209772 ?auto_209766 ) ) ( not ( = ?auto_209768 ?auto_209769 ) ) ( not ( = ?auto_209768 ?auto_209770 ) ) ( not ( = ?auto_209768 ?auto_209771 ) ) ( not ( = ?auto_209768 ?auto_209766 ) ) ( not ( = ?auto_209769 ?auto_209770 ) ) ( not ( = ?auto_209769 ?auto_209771 ) ) ( not ( = ?auto_209769 ?auto_209766 ) ) ( not ( = ?auto_209770 ?auto_209771 ) ) ( not ( = ?auto_209770 ?auto_209766 ) ) ( not ( = ?auto_209771 ?auto_209766 ) ) ( not ( = ?auto_209764 ?auto_209771 ) ) ( not ( = ?auto_209764 ?auto_209772 ) ) ( not ( = ?auto_209764 ?auto_209768 ) ) ( not ( = ?auto_209764 ?auto_209769 ) ) ( not ( = ?auto_209764 ?auto_209770 ) ) ( not ( = ?auto_209767 ?auto_209771 ) ) ( not ( = ?auto_209767 ?auto_209772 ) ) ( not ( = ?auto_209767 ?auto_209768 ) ) ( not ( = ?auto_209767 ?auto_209769 ) ) ( not ( = ?auto_209767 ?auto_209770 ) ) ( not ( = ?auto_209765 ?auto_209771 ) ) ( not ( = ?auto_209765 ?auto_209772 ) ) ( not ( = ?auto_209765 ?auto_209768 ) ) ( not ( = ?auto_209765 ?auto_209769 ) ) ( not ( = ?auto_209765 ?auto_209770 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209772 ?auto_209768 ?auto_209769 ?auto_209770 ?auto_209771 ?auto_209766 )
      ( MAKE-1PILE ?auto_209764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209773 - BLOCK
    )
    :vars
    (
      ?auto_209778 - BLOCK
      ?auto_209775 - BLOCK
      ?auto_209780 - BLOCK
      ?auto_209776 - BLOCK
      ?auto_209781 - BLOCK
      ?auto_209774 - BLOCK
      ?auto_209779 - BLOCK
      ?auto_209777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209778 ?auto_209773 ) ( ON-TABLE ?auto_209773 ) ( not ( = ?auto_209773 ?auto_209778 ) ) ( not ( = ?auto_209773 ?auto_209775 ) ) ( not ( = ?auto_209773 ?auto_209780 ) ) ( not ( = ?auto_209778 ?auto_209775 ) ) ( not ( = ?auto_209778 ?auto_209780 ) ) ( not ( = ?auto_209775 ?auto_209780 ) ) ( ON ?auto_209775 ?auto_209778 ) ( CLEAR ?auto_209776 ) ( ON-TABLE ?auto_209781 ) ( ON ?auto_209774 ?auto_209781 ) ( ON ?auto_209779 ?auto_209774 ) ( ON ?auto_209777 ?auto_209779 ) ( ON ?auto_209776 ?auto_209777 ) ( not ( = ?auto_209781 ?auto_209774 ) ) ( not ( = ?auto_209781 ?auto_209779 ) ) ( not ( = ?auto_209781 ?auto_209777 ) ) ( not ( = ?auto_209781 ?auto_209776 ) ) ( not ( = ?auto_209781 ?auto_209780 ) ) ( not ( = ?auto_209774 ?auto_209779 ) ) ( not ( = ?auto_209774 ?auto_209777 ) ) ( not ( = ?auto_209774 ?auto_209776 ) ) ( not ( = ?auto_209774 ?auto_209780 ) ) ( not ( = ?auto_209779 ?auto_209777 ) ) ( not ( = ?auto_209779 ?auto_209776 ) ) ( not ( = ?auto_209779 ?auto_209780 ) ) ( not ( = ?auto_209777 ?auto_209776 ) ) ( not ( = ?auto_209777 ?auto_209780 ) ) ( not ( = ?auto_209776 ?auto_209780 ) ) ( not ( = ?auto_209773 ?auto_209776 ) ) ( not ( = ?auto_209773 ?auto_209781 ) ) ( not ( = ?auto_209773 ?auto_209774 ) ) ( not ( = ?auto_209773 ?auto_209779 ) ) ( not ( = ?auto_209773 ?auto_209777 ) ) ( not ( = ?auto_209778 ?auto_209776 ) ) ( not ( = ?auto_209778 ?auto_209781 ) ) ( not ( = ?auto_209778 ?auto_209774 ) ) ( not ( = ?auto_209778 ?auto_209779 ) ) ( not ( = ?auto_209778 ?auto_209777 ) ) ( not ( = ?auto_209775 ?auto_209776 ) ) ( not ( = ?auto_209775 ?auto_209781 ) ) ( not ( = ?auto_209775 ?auto_209774 ) ) ( not ( = ?auto_209775 ?auto_209779 ) ) ( not ( = ?auto_209775 ?auto_209777 ) ) ( ON ?auto_209780 ?auto_209775 ) ( CLEAR ?auto_209780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209773 ?auto_209778 ?auto_209775 )
      ( MAKE-1PILE ?auto_209773 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209782 - BLOCK
    )
    :vars
    (
      ?auto_209787 - BLOCK
      ?auto_209790 - BLOCK
      ?auto_209786 - BLOCK
      ?auto_209785 - BLOCK
      ?auto_209789 - BLOCK
      ?auto_209784 - BLOCK
      ?auto_209788 - BLOCK
      ?auto_209783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209787 ?auto_209782 ) ( ON-TABLE ?auto_209782 ) ( not ( = ?auto_209782 ?auto_209787 ) ) ( not ( = ?auto_209782 ?auto_209790 ) ) ( not ( = ?auto_209782 ?auto_209786 ) ) ( not ( = ?auto_209787 ?auto_209790 ) ) ( not ( = ?auto_209787 ?auto_209786 ) ) ( not ( = ?auto_209790 ?auto_209786 ) ) ( ON ?auto_209790 ?auto_209787 ) ( ON-TABLE ?auto_209785 ) ( ON ?auto_209789 ?auto_209785 ) ( ON ?auto_209784 ?auto_209789 ) ( ON ?auto_209788 ?auto_209784 ) ( not ( = ?auto_209785 ?auto_209789 ) ) ( not ( = ?auto_209785 ?auto_209784 ) ) ( not ( = ?auto_209785 ?auto_209788 ) ) ( not ( = ?auto_209785 ?auto_209783 ) ) ( not ( = ?auto_209785 ?auto_209786 ) ) ( not ( = ?auto_209789 ?auto_209784 ) ) ( not ( = ?auto_209789 ?auto_209788 ) ) ( not ( = ?auto_209789 ?auto_209783 ) ) ( not ( = ?auto_209789 ?auto_209786 ) ) ( not ( = ?auto_209784 ?auto_209788 ) ) ( not ( = ?auto_209784 ?auto_209783 ) ) ( not ( = ?auto_209784 ?auto_209786 ) ) ( not ( = ?auto_209788 ?auto_209783 ) ) ( not ( = ?auto_209788 ?auto_209786 ) ) ( not ( = ?auto_209783 ?auto_209786 ) ) ( not ( = ?auto_209782 ?auto_209783 ) ) ( not ( = ?auto_209782 ?auto_209785 ) ) ( not ( = ?auto_209782 ?auto_209789 ) ) ( not ( = ?auto_209782 ?auto_209784 ) ) ( not ( = ?auto_209782 ?auto_209788 ) ) ( not ( = ?auto_209787 ?auto_209783 ) ) ( not ( = ?auto_209787 ?auto_209785 ) ) ( not ( = ?auto_209787 ?auto_209789 ) ) ( not ( = ?auto_209787 ?auto_209784 ) ) ( not ( = ?auto_209787 ?auto_209788 ) ) ( not ( = ?auto_209790 ?auto_209783 ) ) ( not ( = ?auto_209790 ?auto_209785 ) ) ( not ( = ?auto_209790 ?auto_209789 ) ) ( not ( = ?auto_209790 ?auto_209784 ) ) ( not ( = ?auto_209790 ?auto_209788 ) ) ( ON ?auto_209786 ?auto_209790 ) ( CLEAR ?auto_209786 ) ( HOLDING ?auto_209783 ) ( CLEAR ?auto_209788 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209785 ?auto_209789 ?auto_209784 ?auto_209788 ?auto_209783 )
      ( MAKE-1PILE ?auto_209782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209791 - BLOCK
    )
    :vars
    (
      ?auto_209793 - BLOCK
      ?auto_209797 - BLOCK
      ?auto_209792 - BLOCK
      ?auto_209799 - BLOCK
      ?auto_209794 - BLOCK
      ?auto_209798 - BLOCK
      ?auto_209795 - BLOCK
      ?auto_209796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209793 ?auto_209791 ) ( ON-TABLE ?auto_209791 ) ( not ( = ?auto_209791 ?auto_209793 ) ) ( not ( = ?auto_209791 ?auto_209797 ) ) ( not ( = ?auto_209791 ?auto_209792 ) ) ( not ( = ?auto_209793 ?auto_209797 ) ) ( not ( = ?auto_209793 ?auto_209792 ) ) ( not ( = ?auto_209797 ?auto_209792 ) ) ( ON ?auto_209797 ?auto_209793 ) ( ON-TABLE ?auto_209799 ) ( ON ?auto_209794 ?auto_209799 ) ( ON ?auto_209798 ?auto_209794 ) ( ON ?auto_209795 ?auto_209798 ) ( not ( = ?auto_209799 ?auto_209794 ) ) ( not ( = ?auto_209799 ?auto_209798 ) ) ( not ( = ?auto_209799 ?auto_209795 ) ) ( not ( = ?auto_209799 ?auto_209796 ) ) ( not ( = ?auto_209799 ?auto_209792 ) ) ( not ( = ?auto_209794 ?auto_209798 ) ) ( not ( = ?auto_209794 ?auto_209795 ) ) ( not ( = ?auto_209794 ?auto_209796 ) ) ( not ( = ?auto_209794 ?auto_209792 ) ) ( not ( = ?auto_209798 ?auto_209795 ) ) ( not ( = ?auto_209798 ?auto_209796 ) ) ( not ( = ?auto_209798 ?auto_209792 ) ) ( not ( = ?auto_209795 ?auto_209796 ) ) ( not ( = ?auto_209795 ?auto_209792 ) ) ( not ( = ?auto_209796 ?auto_209792 ) ) ( not ( = ?auto_209791 ?auto_209796 ) ) ( not ( = ?auto_209791 ?auto_209799 ) ) ( not ( = ?auto_209791 ?auto_209794 ) ) ( not ( = ?auto_209791 ?auto_209798 ) ) ( not ( = ?auto_209791 ?auto_209795 ) ) ( not ( = ?auto_209793 ?auto_209796 ) ) ( not ( = ?auto_209793 ?auto_209799 ) ) ( not ( = ?auto_209793 ?auto_209794 ) ) ( not ( = ?auto_209793 ?auto_209798 ) ) ( not ( = ?auto_209793 ?auto_209795 ) ) ( not ( = ?auto_209797 ?auto_209796 ) ) ( not ( = ?auto_209797 ?auto_209799 ) ) ( not ( = ?auto_209797 ?auto_209794 ) ) ( not ( = ?auto_209797 ?auto_209798 ) ) ( not ( = ?auto_209797 ?auto_209795 ) ) ( ON ?auto_209792 ?auto_209797 ) ( CLEAR ?auto_209795 ) ( ON ?auto_209796 ?auto_209792 ) ( CLEAR ?auto_209796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209791 ?auto_209793 ?auto_209797 ?auto_209792 )
      ( MAKE-1PILE ?auto_209791 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209800 - BLOCK
    )
    :vars
    (
      ?auto_209808 - BLOCK
      ?auto_209805 - BLOCK
      ?auto_209807 - BLOCK
      ?auto_209802 - BLOCK
      ?auto_209801 - BLOCK
      ?auto_209804 - BLOCK
      ?auto_209803 - BLOCK
      ?auto_209806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209808 ?auto_209800 ) ( ON-TABLE ?auto_209800 ) ( not ( = ?auto_209800 ?auto_209808 ) ) ( not ( = ?auto_209800 ?auto_209805 ) ) ( not ( = ?auto_209800 ?auto_209807 ) ) ( not ( = ?auto_209808 ?auto_209805 ) ) ( not ( = ?auto_209808 ?auto_209807 ) ) ( not ( = ?auto_209805 ?auto_209807 ) ) ( ON ?auto_209805 ?auto_209808 ) ( ON-TABLE ?auto_209802 ) ( ON ?auto_209801 ?auto_209802 ) ( ON ?auto_209804 ?auto_209801 ) ( not ( = ?auto_209802 ?auto_209801 ) ) ( not ( = ?auto_209802 ?auto_209804 ) ) ( not ( = ?auto_209802 ?auto_209803 ) ) ( not ( = ?auto_209802 ?auto_209806 ) ) ( not ( = ?auto_209802 ?auto_209807 ) ) ( not ( = ?auto_209801 ?auto_209804 ) ) ( not ( = ?auto_209801 ?auto_209803 ) ) ( not ( = ?auto_209801 ?auto_209806 ) ) ( not ( = ?auto_209801 ?auto_209807 ) ) ( not ( = ?auto_209804 ?auto_209803 ) ) ( not ( = ?auto_209804 ?auto_209806 ) ) ( not ( = ?auto_209804 ?auto_209807 ) ) ( not ( = ?auto_209803 ?auto_209806 ) ) ( not ( = ?auto_209803 ?auto_209807 ) ) ( not ( = ?auto_209806 ?auto_209807 ) ) ( not ( = ?auto_209800 ?auto_209806 ) ) ( not ( = ?auto_209800 ?auto_209802 ) ) ( not ( = ?auto_209800 ?auto_209801 ) ) ( not ( = ?auto_209800 ?auto_209804 ) ) ( not ( = ?auto_209800 ?auto_209803 ) ) ( not ( = ?auto_209808 ?auto_209806 ) ) ( not ( = ?auto_209808 ?auto_209802 ) ) ( not ( = ?auto_209808 ?auto_209801 ) ) ( not ( = ?auto_209808 ?auto_209804 ) ) ( not ( = ?auto_209808 ?auto_209803 ) ) ( not ( = ?auto_209805 ?auto_209806 ) ) ( not ( = ?auto_209805 ?auto_209802 ) ) ( not ( = ?auto_209805 ?auto_209801 ) ) ( not ( = ?auto_209805 ?auto_209804 ) ) ( not ( = ?auto_209805 ?auto_209803 ) ) ( ON ?auto_209807 ?auto_209805 ) ( ON ?auto_209806 ?auto_209807 ) ( CLEAR ?auto_209806 ) ( HOLDING ?auto_209803 ) ( CLEAR ?auto_209804 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209802 ?auto_209801 ?auto_209804 ?auto_209803 )
      ( MAKE-1PILE ?auto_209800 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209809 - BLOCK
    )
    :vars
    (
      ?auto_209810 - BLOCK
      ?auto_209813 - BLOCK
      ?auto_209811 - BLOCK
      ?auto_209817 - BLOCK
      ?auto_209815 - BLOCK
      ?auto_209812 - BLOCK
      ?auto_209814 - BLOCK
      ?auto_209816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209810 ?auto_209809 ) ( ON-TABLE ?auto_209809 ) ( not ( = ?auto_209809 ?auto_209810 ) ) ( not ( = ?auto_209809 ?auto_209813 ) ) ( not ( = ?auto_209809 ?auto_209811 ) ) ( not ( = ?auto_209810 ?auto_209813 ) ) ( not ( = ?auto_209810 ?auto_209811 ) ) ( not ( = ?auto_209813 ?auto_209811 ) ) ( ON ?auto_209813 ?auto_209810 ) ( ON-TABLE ?auto_209817 ) ( ON ?auto_209815 ?auto_209817 ) ( ON ?auto_209812 ?auto_209815 ) ( not ( = ?auto_209817 ?auto_209815 ) ) ( not ( = ?auto_209817 ?auto_209812 ) ) ( not ( = ?auto_209817 ?auto_209814 ) ) ( not ( = ?auto_209817 ?auto_209816 ) ) ( not ( = ?auto_209817 ?auto_209811 ) ) ( not ( = ?auto_209815 ?auto_209812 ) ) ( not ( = ?auto_209815 ?auto_209814 ) ) ( not ( = ?auto_209815 ?auto_209816 ) ) ( not ( = ?auto_209815 ?auto_209811 ) ) ( not ( = ?auto_209812 ?auto_209814 ) ) ( not ( = ?auto_209812 ?auto_209816 ) ) ( not ( = ?auto_209812 ?auto_209811 ) ) ( not ( = ?auto_209814 ?auto_209816 ) ) ( not ( = ?auto_209814 ?auto_209811 ) ) ( not ( = ?auto_209816 ?auto_209811 ) ) ( not ( = ?auto_209809 ?auto_209816 ) ) ( not ( = ?auto_209809 ?auto_209817 ) ) ( not ( = ?auto_209809 ?auto_209815 ) ) ( not ( = ?auto_209809 ?auto_209812 ) ) ( not ( = ?auto_209809 ?auto_209814 ) ) ( not ( = ?auto_209810 ?auto_209816 ) ) ( not ( = ?auto_209810 ?auto_209817 ) ) ( not ( = ?auto_209810 ?auto_209815 ) ) ( not ( = ?auto_209810 ?auto_209812 ) ) ( not ( = ?auto_209810 ?auto_209814 ) ) ( not ( = ?auto_209813 ?auto_209816 ) ) ( not ( = ?auto_209813 ?auto_209817 ) ) ( not ( = ?auto_209813 ?auto_209815 ) ) ( not ( = ?auto_209813 ?auto_209812 ) ) ( not ( = ?auto_209813 ?auto_209814 ) ) ( ON ?auto_209811 ?auto_209813 ) ( ON ?auto_209816 ?auto_209811 ) ( CLEAR ?auto_209812 ) ( ON ?auto_209814 ?auto_209816 ) ( CLEAR ?auto_209814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209809 ?auto_209810 ?auto_209813 ?auto_209811 ?auto_209816 )
      ( MAKE-1PILE ?auto_209809 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209818 - BLOCK
    )
    :vars
    (
      ?auto_209826 - BLOCK
      ?auto_209821 - BLOCK
      ?auto_209825 - BLOCK
      ?auto_209822 - BLOCK
      ?auto_209820 - BLOCK
      ?auto_209824 - BLOCK
      ?auto_209819 - BLOCK
      ?auto_209823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209826 ?auto_209818 ) ( ON-TABLE ?auto_209818 ) ( not ( = ?auto_209818 ?auto_209826 ) ) ( not ( = ?auto_209818 ?auto_209821 ) ) ( not ( = ?auto_209818 ?auto_209825 ) ) ( not ( = ?auto_209826 ?auto_209821 ) ) ( not ( = ?auto_209826 ?auto_209825 ) ) ( not ( = ?auto_209821 ?auto_209825 ) ) ( ON ?auto_209821 ?auto_209826 ) ( ON-TABLE ?auto_209822 ) ( ON ?auto_209820 ?auto_209822 ) ( not ( = ?auto_209822 ?auto_209820 ) ) ( not ( = ?auto_209822 ?auto_209824 ) ) ( not ( = ?auto_209822 ?auto_209819 ) ) ( not ( = ?auto_209822 ?auto_209823 ) ) ( not ( = ?auto_209822 ?auto_209825 ) ) ( not ( = ?auto_209820 ?auto_209824 ) ) ( not ( = ?auto_209820 ?auto_209819 ) ) ( not ( = ?auto_209820 ?auto_209823 ) ) ( not ( = ?auto_209820 ?auto_209825 ) ) ( not ( = ?auto_209824 ?auto_209819 ) ) ( not ( = ?auto_209824 ?auto_209823 ) ) ( not ( = ?auto_209824 ?auto_209825 ) ) ( not ( = ?auto_209819 ?auto_209823 ) ) ( not ( = ?auto_209819 ?auto_209825 ) ) ( not ( = ?auto_209823 ?auto_209825 ) ) ( not ( = ?auto_209818 ?auto_209823 ) ) ( not ( = ?auto_209818 ?auto_209822 ) ) ( not ( = ?auto_209818 ?auto_209820 ) ) ( not ( = ?auto_209818 ?auto_209824 ) ) ( not ( = ?auto_209818 ?auto_209819 ) ) ( not ( = ?auto_209826 ?auto_209823 ) ) ( not ( = ?auto_209826 ?auto_209822 ) ) ( not ( = ?auto_209826 ?auto_209820 ) ) ( not ( = ?auto_209826 ?auto_209824 ) ) ( not ( = ?auto_209826 ?auto_209819 ) ) ( not ( = ?auto_209821 ?auto_209823 ) ) ( not ( = ?auto_209821 ?auto_209822 ) ) ( not ( = ?auto_209821 ?auto_209820 ) ) ( not ( = ?auto_209821 ?auto_209824 ) ) ( not ( = ?auto_209821 ?auto_209819 ) ) ( ON ?auto_209825 ?auto_209821 ) ( ON ?auto_209823 ?auto_209825 ) ( ON ?auto_209819 ?auto_209823 ) ( CLEAR ?auto_209819 ) ( HOLDING ?auto_209824 ) ( CLEAR ?auto_209820 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209822 ?auto_209820 ?auto_209824 )
      ( MAKE-1PILE ?auto_209818 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209827 - BLOCK
    )
    :vars
    (
      ?auto_209830 - BLOCK
      ?auto_209828 - BLOCK
      ?auto_209832 - BLOCK
      ?auto_209831 - BLOCK
      ?auto_209833 - BLOCK
      ?auto_209829 - BLOCK
      ?auto_209835 - BLOCK
      ?auto_209834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209830 ?auto_209827 ) ( ON-TABLE ?auto_209827 ) ( not ( = ?auto_209827 ?auto_209830 ) ) ( not ( = ?auto_209827 ?auto_209828 ) ) ( not ( = ?auto_209827 ?auto_209832 ) ) ( not ( = ?auto_209830 ?auto_209828 ) ) ( not ( = ?auto_209830 ?auto_209832 ) ) ( not ( = ?auto_209828 ?auto_209832 ) ) ( ON ?auto_209828 ?auto_209830 ) ( ON-TABLE ?auto_209831 ) ( ON ?auto_209833 ?auto_209831 ) ( not ( = ?auto_209831 ?auto_209833 ) ) ( not ( = ?auto_209831 ?auto_209829 ) ) ( not ( = ?auto_209831 ?auto_209835 ) ) ( not ( = ?auto_209831 ?auto_209834 ) ) ( not ( = ?auto_209831 ?auto_209832 ) ) ( not ( = ?auto_209833 ?auto_209829 ) ) ( not ( = ?auto_209833 ?auto_209835 ) ) ( not ( = ?auto_209833 ?auto_209834 ) ) ( not ( = ?auto_209833 ?auto_209832 ) ) ( not ( = ?auto_209829 ?auto_209835 ) ) ( not ( = ?auto_209829 ?auto_209834 ) ) ( not ( = ?auto_209829 ?auto_209832 ) ) ( not ( = ?auto_209835 ?auto_209834 ) ) ( not ( = ?auto_209835 ?auto_209832 ) ) ( not ( = ?auto_209834 ?auto_209832 ) ) ( not ( = ?auto_209827 ?auto_209834 ) ) ( not ( = ?auto_209827 ?auto_209831 ) ) ( not ( = ?auto_209827 ?auto_209833 ) ) ( not ( = ?auto_209827 ?auto_209829 ) ) ( not ( = ?auto_209827 ?auto_209835 ) ) ( not ( = ?auto_209830 ?auto_209834 ) ) ( not ( = ?auto_209830 ?auto_209831 ) ) ( not ( = ?auto_209830 ?auto_209833 ) ) ( not ( = ?auto_209830 ?auto_209829 ) ) ( not ( = ?auto_209830 ?auto_209835 ) ) ( not ( = ?auto_209828 ?auto_209834 ) ) ( not ( = ?auto_209828 ?auto_209831 ) ) ( not ( = ?auto_209828 ?auto_209833 ) ) ( not ( = ?auto_209828 ?auto_209829 ) ) ( not ( = ?auto_209828 ?auto_209835 ) ) ( ON ?auto_209832 ?auto_209828 ) ( ON ?auto_209834 ?auto_209832 ) ( ON ?auto_209835 ?auto_209834 ) ( CLEAR ?auto_209833 ) ( ON ?auto_209829 ?auto_209835 ) ( CLEAR ?auto_209829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209827 ?auto_209830 ?auto_209828 ?auto_209832 ?auto_209834 ?auto_209835 )
      ( MAKE-1PILE ?auto_209827 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209836 - BLOCK
    )
    :vars
    (
      ?auto_209838 - BLOCK
      ?auto_209840 - BLOCK
      ?auto_209837 - BLOCK
      ?auto_209844 - BLOCK
      ?auto_209839 - BLOCK
      ?auto_209842 - BLOCK
      ?auto_209841 - BLOCK
      ?auto_209843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209838 ?auto_209836 ) ( ON-TABLE ?auto_209836 ) ( not ( = ?auto_209836 ?auto_209838 ) ) ( not ( = ?auto_209836 ?auto_209840 ) ) ( not ( = ?auto_209836 ?auto_209837 ) ) ( not ( = ?auto_209838 ?auto_209840 ) ) ( not ( = ?auto_209838 ?auto_209837 ) ) ( not ( = ?auto_209840 ?auto_209837 ) ) ( ON ?auto_209840 ?auto_209838 ) ( ON-TABLE ?auto_209844 ) ( not ( = ?auto_209844 ?auto_209839 ) ) ( not ( = ?auto_209844 ?auto_209842 ) ) ( not ( = ?auto_209844 ?auto_209841 ) ) ( not ( = ?auto_209844 ?auto_209843 ) ) ( not ( = ?auto_209844 ?auto_209837 ) ) ( not ( = ?auto_209839 ?auto_209842 ) ) ( not ( = ?auto_209839 ?auto_209841 ) ) ( not ( = ?auto_209839 ?auto_209843 ) ) ( not ( = ?auto_209839 ?auto_209837 ) ) ( not ( = ?auto_209842 ?auto_209841 ) ) ( not ( = ?auto_209842 ?auto_209843 ) ) ( not ( = ?auto_209842 ?auto_209837 ) ) ( not ( = ?auto_209841 ?auto_209843 ) ) ( not ( = ?auto_209841 ?auto_209837 ) ) ( not ( = ?auto_209843 ?auto_209837 ) ) ( not ( = ?auto_209836 ?auto_209843 ) ) ( not ( = ?auto_209836 ?auto_209844 ) ) ( not ( = ?auto_209836 ?auto_209839 ) ) ( not ( = ?auto_209836 ?auto_209842 ) ) ( not ( = ?auto_209836 ?auto_209841 ) ) ( not ( = ?auto_209838 ?auto_209843 ) ) ( not ( = ?auto_209838 ?auto_209844 ) ) ( not ( = ?auto_209838 ?auto_209839 ) ) ( not ( = ?auto_209838 ?auto_209842 ) ) ( not ( = ?auto_209838 ?auto_209841 ) ) ( not ( = ?auto_209840 ?auto_209843 ) ) ( not ( = ?auto_209840 ?auto_209844 ) ) ( not ( = ?auto_209840 ?auto_209839 ) ) ( not ( = ?auto_209840 ?auto_209842 ) ) ( not ( = ?auto_209840 ?auto_209841 ) ) ( ON ?auto_209837 ?auto_209840 ) ( ON ?auto_209843 ?auto_209837 ) ( ON ?auto_209841 ?auto_209843 ) ( ON ?auto_209842 ?auto_209841 ) ( CLEAR ?auto_209842 ) ( HOLDING ?auto_209839 ) ( CLEAR ?auto_209844 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209844 ?auto_209839 )
      ( MAKE-1PILE ?auto_209836 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209845 - BLOCK
    )
    :vars
    (
      ?auto_209851 - BLOCK
      ?auto_209846 - BLOCK
      ?auto_209853 - BLOCK
      ?auto_209848 - BLOCK
      ?auto_209850 - BLOCK
      ?auto_209847 - BLOCK
      ?auto_209849 - BLOCK
      ?auto_209852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209851 ?auto_209845 ) ( ON-TABLE ?auto_209845 ) ( not ( = ?auto_209845 ?auto_209851 ) ) ( not ( = ?auto_209845 ?auto_209846 ) ) ( not ( = ?auto_209845 ?auto_209853 ) ) ( not ( = ?auto_209851 ?auto_209846 ) ) ( not ( = ?auto_209851 ?auto_209853 ) ) ( not ( = ?auto_209846 ?auto_209853 ) ) ( ON ?auto_209846 ?auto_209851 ) ( ON-TABLE ?auto_209848 ) ( not ( = ?auto_209848 ?auto_209850 ) ) ( not ( = ?auto_209848 ?auto_209847 ) ) ( not ( = ?auto_209848 ?auto_209849 ) ) ( not ( = ?auto_209848 ?auto_209852 ) ) ( not ( = ?auto_209848 ?auto_209853 ) ) ( not ( = ?auto_209850 ?auto_209847 ) ) ( not ( = ?auto_209850 ?auto_209849 ) ) ( not ( = ?auto_209850 ?auto_209852 ) ) ( not ( = ?auto_209850 ?auto_209853 ) ) ( not ( = ?auto_209847 ?auto_209849 ) ) ( not ( = ?auto_209847 ?auto_209852 ) ) ( not ( = ?auto_209847 ?auto_209853 ) ) ( not ( = ?auto_209849 ?auto_209852 ) ) ( not ( = ?auto_209849 ?auto_209853 ) ) ( not ( = ?auto_209852 ?auto_209853 ) ) ( not ( = ?auto_209845 ?auto_209852 ) ) ( not ( = ?auto_209845 ?auto_209848 ) ) ( not ( = ?auto_209845 ?auto_209850 ) ) ( not ( = ?auto_209845 ?auto_209847 ) ) ( not ( = ?auto_209845 ?auto_209849 ) ) ( not ( = ?auto_209851 ?auto_209852 ) ) ( not ( = ?auto_209851 ?auto_209848 ) ) ( not ( = ?auto_209851 ?auto_209850 ) ) ( not ( = ?auto_209851 ?auto_209847 ) ) ( not ( = ?auto_209851 ?auto_209849 ) ) ( not ( = ?auto_209846 ?auto_209852 ) ) ( not ( = ?auto_209846 ?auto_209848 ) ) ( not ( = ?auto_209846 ?auto_209850 ) ) ( not ( = ?auto_209846 ?auto_209847 ) ) ( not ( = ?auto_209846 ?auto_209849 ) ) ( ON ?auto_209853 ?auto_209846 ) ( ON ?auto_209852 ?auto_209853 ) ( ON ?auto_209849 ?auto_209852 ) ( ON ?auto_209847 ?auto_209849 ) ( CLEAR ?auto_209848 ) ( ON ?auto_209850 ?auto_209847 ) ( CLEAR ?auto_209850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209845 ?auto_209851 ?auto_209846 ?auto_209853 ?auto_209852 ?auto_209849 ?auto_209847 )
      ( MAKE-1PILE ?auto_209845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209854 - BLOCK
    )
    :vars
    (
      ?auto_209858 - BLOCK
      ?auto_209856 - BLOCK
      ?auto_209857 - BLOCK
      ?auto_209862 - BLOCK
      ?auto_209860 - BLOCK
      ?auto_209861 - BLOCK
      ?auto_209859 - BLOCK
      ?auto_209855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209858 ?auto_209854 ) ( ON-TABLE ?auto_209854 ) ( not ( = ?auto_209854 ?auto_209858 ) ) ( not ( = ?auto_209854 ?auto_209856 ) ) ( not ( = ?auto_209854 ?auto_209857 ) ) ( not ( = ?auto_209858 ?auto_209856 ) ) ( not ( = ?auto_209858 ?auto_209857 ) ) ( not ( = ?auto_209856 ?auto_209857 ) ) ( ON ?auto_209856 ?auto_209858 ) ( not ( = ?auto_209862 ?auto_209860 ) ) ( not ( = ?auto_209862 ?auto_209861 ) ) ( not ( = ?auto_209862 ?auto_209859 ) ) ( not ( = ?auto_209862 ?auto_209855 ) ) ( not ( = ?auto_209862 ?auto_209857 ) ) ( not ( = ?auto_209860 ?auto_209861 ) ) ( not ( = ?auto_209860 ?auto_209859 ) ) ( not ( = ?auto_209860 ?auto_209855 ) ) ( not ( = ?auto_209860 ?auto_209857 ) ) ( not ( = ?auto_209861 ?auto_209859 ) ) ( not ( = ?auto_209861 ?auto_209855 ) ) ( not ( = ?auto_209861 ?auto_209857 ) ) ( not ( = ?auto_209859 ?auto_209855 ) ) ( not ( = ?auto_209859 ?auto_209857 ) ) ( not ( = ?auto_209855 ?auto_209857 ) ) ( not ( = ?auto_209854 ?auto_209855 ) ) ( not ( = ?auto_209854 ?auto_209862 ) ) ( not ( = ?auto_209854 ?auto_209860 ) ) ( not ( = ?auto_209854 ?auto_209861 ) ) ( not ( = ?auto_209854 ?auto_209859 ) ) ( not ( = ?auto_209858 ?auto_209855 ) ) ( not ( = ?auto_209858 ?auto_209862 ) ) ( not ( = ?auto_209858 ?auto_209860 ) ) ( not ( = ?auto_209858 ?auto_209861 ) ) ( not ( = ?auto_209858 ?auto_209859 ) ) ( not ( = ?auto_209856 ?auto_209855 ) ) ( not ( = ?auto_209856 ?auto_209862 ) ) ( not ( = ?auto_209856 ?auto_209860 ) ) ( not ( = ?auto_209856 ?auto_209861 ) ) ( not ( = ?auto_209856 ?auto_209859 ) ) ( ON ?auto_209857 ?auto_209856 ) ( ON ?auto_209855 ?auto_209857 ) ( ON ?auto_209859 ?auto_209855 ) ( ON ?auto_209861 ?auto_209859 ) ( ON ?auto_209860 ?auto_209861 ) ( CLEAR ?auto_209860 ) ( HOLDING ?auto_209862 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209862 )
      ( MAKE-1PILE ?auto_209854 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209863 - BLOCK
    )
    :vars
    (
      ?auto_209865 - BLOCK
      ?auto_209871 - BLOCK
      ?auto_209870 - BLOCK
      ?auto_209868 - BLOCK
      ?auto_209866 - BLOCK
      ?auto_209864 - BLOCK
      ?auto_209867 - BLOCK
      ?auto_209869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209865 ?auto_209863 ) ( ON-TABLE ?auto_209863 ) ( not ( = ?auto_209863 ?auto_209865 ) ) ( not ( = ?auto_209863 ?auto_209871 ) ) ( not ( = ?auto_209863 ?auto_209870 ) ) ( not ( = ?auto_209865 ?auto_209871 ) ) ( not ( = ?auto_209865 ?auto_209870 ) ) ( not ( = ?auto_209871 ?auto_209870 ) ) ( ON ?auto_209871 ?auto_209865 ) ( not ( = ?auto_209868 ?auto_209866 ) ) ( not ( = ?auto_209868 ?auto_209864 ) ) ( not ( = ?auto_209868 ?auto_209867 ) ) ( not ( = ?auto_209868 ?auto_209869 ) ) ( not ( = ?auto_209868 ?auto_209870 ) ) ( not ( = ?auto_209866 ?auto_209864 ) ) ( not ( = ?auto_209866 ?auto_209867 ) ) ( not ( = ?auto_209866 ?auto_209869 ) ) ( not ( = ?auto_209866 ?auto_209870 ) ) ( not ( = ?auto_209864 ?auto_209867 ) ) ( not ( = ?auto_209864 ?auto_209869 ) ) ( not ( = ?auto_209864 ?auto_209870 ) ) ( not ( = ?auto_209867 ?auto_209869 ) ) ( not ( = ?auto_209867 ?auto_209870 ) ) ( not ( = ?auto_209869 ?auto_209870 ) ) ( not ( = ?auto_209863 ?auto_209869 ) ) ( not ( = ?auto_209863 ?auto_209868 ) ) ( not ( = ?auto_209863 ?auto_209866 ) ) ( not ( = ?auto_209863 ?auto_209864 ) ) ( not ( = ?auto_209863 ?auto_209867 ) ) ( not ( = ?auto_209865 ?auto_209869 ) ) ( not ( = ?auto_209865 ?auto_209868 ) ) ( not ( = ?auto_209865 ?auto_209866 ) ) ( not ( = ?auto_209865 ?auto_209864 ) ) ( not ( = ?auto_209865 ?auto_209867 ) ) ( not ( = ?auto_209871 ?auto_209869 ) ) ( not ( = ?auto_209871 ?auto_209868 ) ) ( not ( = ?auto_209871 ?auto_209866 ) ) ( not ( = ?auto_209871 ?auto_209864 ) ) ( not ( = ?auto_209871 ?auto_209867 ) ) ( ON ?auto_209870 ?auto_209871 ) ( ON ?auto_209869 ?auto_209870 ) ( ON ?auto_209867 ?auto_209869 ) ( ON ?auto_209864 ?auto_209867 ) ( ON ?auto_209866 ?auto_209864 ) ( ON ?auto_209868 ?auto_209866 ) ( CLEAR ?auto_209868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_209863 ?auto_209865 ?auto_209871 ?auto_209870 ?auto_209869 ?auto_209867 ?auto_209864 ?auto_209866 )
      ( MAKE-1PILE ?auto_209863 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209880 - BLOCK
      ?auto_209881 - BLOCK
      ?auto_209882 - BLOCK
      ?auto_209883 - BLOCK
      ?auto_209884 - BLOCK
      ?auto_209885 - BLOCK
      ?auto_209886 - BLOCK
      ?auto_209887 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_209887 ) ( CLEAR ?auto_209886 ) ( ON-TABLE ?auto_209880 ) ( ON ?auto_209881 ?auto_209880 ) ( ON ?auto_209882 ?auto_209881 ) ( ON ?auto_209883 ?auto_209882 ) ( ON ?auto_209884 ?auto_209883 ) ( ON ?auto_209885 ?auto_209884 ) ( ON ?auto_209886 ?auto_209885 ) ( not ( = ?auto_209880 ?auto_209881 ) ) ( not ( = ?auto_209880 ?auto_209882 ) ) ( not ( = ?auto_209880 ?auto_209883 ) ) ( not ( = ?auto_209880 ?auto_209884 ) ) ( not ( = ?auto_209880 ?auto_209885 ) ) ( not ( = ?auto_209880 ?auto_209886 ) ) ( not ( = ?auto_209880 ?auto_209887 ) ) ( not ( = ?auto_209881 ?auto_209882 ) ) ( not ( = ?auto_209881 ?auto_209883 ) ) ( not ( = ?auto_209881 ?auto_209884 ) ) ( not ( = ?auto_209881 ?auto_209885 ) ) ( not ( = ?auto_209881 ?auto_209886 ) ) ( not ( = ?auto_209881 ?auto_209887 ) ) ( not ( = ?auto_209882 ?auto_209883 ) ) ( not ( = ?auto_209882 ?auto_209884 ) ) ( not ( = ?auto_209882 ?auto_209885 ) ) ( not ( = ?auto_209882 ?auto_209886 ) ) ( not ( = ?auto_209882 ?auto_209887 ) ) ( not ( = ?auto_209883 ?auto_209884 ) ) ( not ( = ?auto_209883 ?auto_209885 ) ) ( not ( = ?auto_209883 ?auto_209886 ) ) ( not ( = ?auto_209883 ?auto_209887 ) ) ( not ( = ?auto_209884 ?auto_209885 ) ) ( not ( = ?auto_209884 ?auto_209886 ) ) ( not ( = ?auto_209884 ?auto_209887 ) ) ( not ( = ?auto_209885 ?auto_209886 ) ) ( not ( = ?auto_209885 ?auto_209887 ) ) ( not ( = ?auto_209886 ?auto_209887 ) ) )
    :subtasks
    ( ( !STACK ?auto_209887 ?auto_209886 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209888 - BLOCK
      ?auto_209889 - BLOCK
      ?auto_209890 - BLOCK
      ?auto_209891 - BLOCK
      ?auto_209892 - BLOCK
      ?auto_209893 - BLOCK
      ?auto_209894 - BLOCK
      ?auto_209895 - BLOCK
    )
    :vars
    (
      ?auto_209896 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_209894 ) ( ON-TABLE ?auto_209888 ) ( ON ?auto_209889 ?auto_209888 ) ( ON ?auto_209890 ?auto_209889 ) ( ON ?auto_209891 ?auto_209890 ) ( ON ?auto_209892 ?auto_209891 ) ( ON ?auto_209893 ?auto_209892 ) ( ON ?auto_209894 ?auto_209893 ) ( not ( = ?auto_209888 ?auto_209889 ) ) ( not ( = ?auto_209888 ?auto_209890 ) ) ( not ( = ?auto_209888 ?auto_209891 ) ) ( not ( = ?auto_209888 ?auto_209892 ) ) ( not ( = ?auto_209888 ?auto_209893 ) ) ( not ( = ?auto_209888 ?auto_209894 ) ) ( not ( = ?auto_209888 ?auto_209895 ) ) ( not ( = ?auto_209889 ?auto_209890 ) ) ( not ( = ?auto_209889 ?auto_209891 ) ) ( not ( = ?auto_209889 ?auto_209892 ) ) ( not ( = ?auto_209889 ?auto_209893 ) ) ( not ( = ?auto_209889 ?auto_209894 ) ) ( not ( = ?auto_209889 ?auto_209895 ) ) ( not ( = ?auto_209890 ?auto_209891 ) ) ( not ( = ?auto_209890 ?auto_209892 ) ) ( not ( = ?auto_209890 ?auto_209893 ) ) ( not ( = ?auto_209890 ?auto_209894 ) ) ( not ( = ?auto_209890 ?auto_209895 ) ) ( not ( = ?auto_209891 ?auto_209892 ) ) ( not ( = ?auto_209891 ?auto_209893 ) ) ( not ( = ?auto_209891 ?auto_209894 ) ) ( not ( = ?auto_209891 ?auto_209895 ) ) ( not ( = ?auto_209892 ?auto_209893 ) ) ( not ( = ?auto_209892 ?auto_209894 ) ) ( not ( = ?auto_209892 ?auto_209895 ) ) ( not ( = ?auto_209893 ?auto_209894 ) ) ( not ( = ?auto_209893 ?auto_209895 ) ) ( not ( = ?auto_209894 ?auto_209895 ) ) ( ON ?auto_209895 ?auto_209896 ) ( CLEAR ?auto_209895 ) ( HAND-EMPTY ) ( not ( = ?auto_209888 ?auto_209896 ) ) ( not ( = ?auto_209889 ?auto_209896 ) ) ( not ( = ?auto_209890 ?auto_209896 ) ) ( not ( = ?auto_209891 ?auto_209896 ) ) ( not ( = ?auto_209892 ?auto_209896 ) ) ( not ( = ?auto_209893 ?auto_209896 ) ) ( not ( = ?auto_209894 ?auto_209896 ) ) ( not ( = ?auto_209895 ?auto_209896 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209895 ?auto_209896 )
      ( MAKE-8PILE ?auto_209888 ?auto_209889 ?auto_209890 ?auto_209891 ?auto_209892 ?auto_209893 ?auto_209894 ?auto_209895 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209897 - BLOCK
      ?auto_209898 - BLOCK
      ?auto_209899 - BLOCK
      ?auto_209900 - BLOCK
      ?auto_209901 - BLOCK
      ?auto_209902 - BLOCK
      ?auto_209903 - BLOCK
      ?auto_209904 - BLOCK
    )
    :vars
    (
      ?auto_209905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209897 ) ( ON ?auto_209898 ?auto_209897 ) ( ON ?auto_209899 ?auto_209898 ) ( ON ?auto_209900 ?auto_209899 ) ( ON ?auto_209901 ?auto_209900 ) ( ON ?auto_209902 ?auto_209901 ) ( not ( = ?auto_209897 ?auto_209898 ) ) ( not ( = ?auto_209897 ?auto_209899 ) ) ( not ( = ?auto_209897 ?auto_209900 ) ) ( not ( = ?auto_209897 ?auto_209901 ) ) ( not ( = ?auto_209897 ?auto_209902 ) ) ( not ( = ?auto_209897 ?auto_209903 ) ) ( not ( = ?auto_209897 ?auto_209904 ) ) ( not ( = ?auto_209898 ?auto_209899 ) ) ( not ( = ?auto_209898 ?auto_209900 ) ) ( not ( = ?auto_209898 ?auto_209901 ) ) ( not ( = ?auto_209898 ?auto_209902 ) ) ( not ( = ?auto_209898 ?auto_209903 ) ) ( not ( = ?auto_209898 ?auto_209904 ) ) ( not ( = ?auto_209899 ?auto_209900 ) ) ( not ( = ?auto_209899 ?auto_209901 ) ) ( not ( = ?auto_209899 ?auto_209902 ) ) ( not ( = ?auto_209899 ?auto_209903 ) ) ( not ( = ?auto_209899 ?auto_209904 ) ) ( not ( = ?auto_209900 ?auto_209901 ) ) ( not ( = ?auto_209900 ?auto_209902 ) ) ( not ( = ?auto_209900 ?auto_209903 ) ) ( not ( = ?auto_209900 ?auto_209904 ) ) ( not ( = ?auto_209901 ?auto_209902 ) ) ( not ( = ?auto_209901 ?auto_209903 ) ) ( not ( = ?auto_209901 ?auto_209904 ) ) ( not ( = ?auto_209902 ?auto_209903 ) ) ( not ( = ?auto_209902 ?auto_209904 ) ) ( not ( = ?auto_209903 ?auto_209904 ) ) ( ON ?auto_209904 ?auto_209905 ) ( CLEAR ?auto_209904 ) ( not ( = ?auto_209897 ?auto_209905 ) ) ( not ( = ?auto_209898 ?auto_209905 ) ) ( not ( = ?auto_209899 ?auto_209905 ) ) ( not ( = ?auto_209900 ?auto_209905 ) ) ( not ( = ?auto_209901 ?auto_209905 ) ) ( not ( = ?auto_209902 ?auto_209905 ) ) ( not ( = ?auto_209903 ?auto_209905 ) ) ( not ( = ?auto_209904 ?auto_209905 ) ) ( HOLDING ?auto_209903 ) ( CLEAR ?auto_209902 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209897 ?auto_209898 ?auto_209899 ?auto_209900 ?auto_209901 ?auto_209902 ?auto_209903 )
      ( MAKE-8PILE ?auto_209897 ?auto_209898 ?auto_209899 ?auto_209900 ?auto_209901 ?auto_209902 ?auto_209903 ?auto_209904 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209906 - BLOCK
      ?auto_209907 - BLOCK
      ?auto_209908 - BLOCK
      ?auto_209909 - BLOCK
      ?auto_209910 - BLOCK
      ?auto_209911 - BLOCK
      ?auto_209912 - BLOCK
      ?auto_209913 - BLOCK
    )
    :vars
    (
      ?auto_209914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209906 ) ( ON ?auto_209907 ?auto_209906 ) ( ON ?auto_209908 ?auto_209907 ) ( ON ?auto_209909 ?auto_209908 ) ( ON ?auto_209910 ?auto_209909 ) ( ON ?auto_209911 ?auto_209910 ) ( not ( = ?auto_209906 ?auto_209907 ) ) ( not ( = ?auto_209906 ?auto_209908 ) ) ( not ( = ?auto_209906 ?auto_209909 ) ) ( not ( = ?auto_209906 ?auto_209910 ) ) ( not ( = ?auto_209906 ?auto_209911 ) ) ( not ( = ?auto_209906 ?auto_209912 ) ) ( not ( = ?auto_209906 ?auto_209913 ) ) ( not ( = ?auto_209907 ?auto_209908 ) ) ( not ( = ?auto_209907 ?auto_209909 ) ) ( not ( = ?auto_209907 ?auto_209910 ) ) ( not ( = ?auto_209907 ?auto_209911 ) ) ( not ( = ?auto_209907 ?auto_209912 ) ) ( not ( = ?auto_209907 ?auto_209913 ) ) ( not ( = ?auto_209908 ?auto_209909 ) ) ( not ( = ?auto_209908 ?auto_209910 ) ) ( not ( = ?auto_209908 ?auto_209911 ) ) ( not ( = ?auto_209908 ?auto_209912 ) ) ( not ( = ?auto_209908 ?auto_209913 ) ) ( not ( = ?auto_209909 ?auto_209910 ) ) ( not ( = ?auto_209909 ?auto_209911 ) ) ( not ( = ?auto_209909 ?auto_209912 ) ) ( not ( = ?auto_209909 ?auto_209913 ) ) ( not ( = ?auto_209910 ?auto_209911 ) ) ( not ( = ?auto_209910 ?auto_209912 ) ) ( not ( = ?auto_209910 ?auto_209913 ) ) ( not ( = ?auto_209911 ?auto_209912 ) ) ( not ( = ?auto_209911 ?auto_209913 ) ) ( not ( = ?auto_209912 ?auto_209913 ) ) ( ON ?auto_209913 ?auto_209914 ) ( not ( = ?auto_209906 ?auto_209914 ) ) ( not ( = ?auto_209907 ?auto_209914 ) ) ( not ( = ?auto_209908 ?auto_209914 ) ) ( not ( = ?auto_209909 ?auto_209914 ) ) ( not ( = ?auto_209910 ?auto_209914 ) ) ( not ( = ?auto_209911 ?auto_209914 ) ) ( not ( = ?auto_209912 ?auto_209914 ) ) ( not ( = ?auto_209913 ?auto_209914 ) ) ( CLEAR ?auto_209911 ) ( ON ?auto_209912 ?auto_209913 ) ( CLEAR ?auto_209912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209914 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209914 ?auto_209913 )
      ( MAKE-8PILE ?auto_209906 ?auto_209907 ?auto_209908 ?auto_209909 ?auto_209910 ?auto_209911 ?auto_209912 ?auto_209913 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209915 - BLOCK
      ?auto_209916 - BLOCK
      ?auto_209917 - BLOCK
      ?auto_209918 - BLOCK
      ?auto_209919 - BLOCK
      ?auto_209920 - BLOCK
      ?auto_209921 - BLOCK
      ?auto_209922 - BLOCK
    )
    :vars
    (
      ?auto_209923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209915 ) ( ON ?auto_209916 ?auto_209915 ) ( ON ?auto_209917 ?auto_209916 ) ( ON ?auto_209918 ?auto_209917 ) ( ON ?auto_209919 ?auto_209918 ) ( not ( = ?auto_209915 ?auto_209916 ) ) ( not ( = ?auto_209915 ?auto_209917 ) ) ( not ( = ?auto_209915 ?auto_209918 ) ) ( not ( = ?auto_209915 ?auto_209919 ) ) ( not ( = ?auto_209915 ?auto_209920 ) ) ( not ( = ?auto_209915 ?auto_209921 ) ) ( not ( = ?auto_209915 ?auto_209922 ) ) ( not ( = ?auto_209916 ?auto_209917 ) ) ( not ( = ?auto_209916 ?auto_209918 ) ) ( not ( = ?auto_209916 ?auto_209919 ) ) ( not ( = ?auto_209916 ?auto_209920 ) ) ( not ( = ?auto_209916 ?auto_209921 ) ) ( not ( = ?auto_209916 ?auto_209922 ) ) ( not ( = ?auto_209917 ?auto_209918 ) ) ( not ( = ?auto_209917 ?auto_209919 ) ) ( not ( = ?auto_209917 ?auto_209920 ) ) ( not ( = ?auto_209917 ?auto_209921 ) ) ( not ( = ?auto_209917 ?auto_209922 ) ) ( not ( = ?auto_209918 ?auto_209919 ) ) ( not ( = ?auto_209918 ?auto_209920 ) ) ( not ( = ?auto_209918 ?auto_209921 ) ) ( not ( = ?auto_209918 ?auto_209922 ) ) ( not ( = ?auto_209919 ?auto_209920 ) ) ( not ( = ?auto_209919 ?auto_209921 ) ) ( not ( = ?auto_209919 ?auto_209922 ) ) ( not ( = ?auto_209920 ?auto_209921 ) ) ( not ( = ?auto_209920 ?auto_209922 ) ) ( not ( = ?auto_209921 ?auto_209922 ) ) ( ON ?auto_209922 ?auto_209923 ) ( not ( = ?auto_209915 ?auto_209923 ) ) ( not ( = ?auto_209916 ?auto_209923 ) ) ( not ( = ?auto_209917 ?auto_209923 ) ) ( not ( = ?auto_209918 ?auto_209923 ) ) ( not ( = ?auto_209919 ?auto_209923 ) ) ( not ( = ?auto_209920 ?auto_209923 ) ) ( not ( = ?auto_209921 ?auto_209923 ) ) ( not ( = ?auto_209922 ?auto_209923 ) ) ( ON ?auto_209921 ?auto_209922 ) ( CLEAR ?auto_209921 ) ( ON-TABLE ?auto_209923 ) ( HOLDING ?auto_209920 ) ( CLEAR ?auto_209919 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209915 ?auto_209916 ?auto_209917 ?auto_209918 ?auto_209919 ?auto_209920 )
      ( MAKE-8PILE ?auto_209915 ?auto_209916 ?auto_209917 ?auto_209918 ?auto_209919 ?auto_209920 ?auto_209921 ?auto_209922 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209924 - BLOCK
      ?auto_209925 - BLOCK
      ?auto_209926 - BLOCK
      ?auto_209927 - BLOCK
      ?auto_209928 - BLOCK
      ?auto_209929 - BLOCK
      ?auto_209930 - BLOCK
      ?auto_209931 - BLOCK
    )
    :vars
    (
      ?auto_209932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209924 ) ( ON ?auto_209925 ?auto_209924 ) ( ON ?auto_209926 ?auto_209925 ) ( ON ?auto_209927 ?auto_209926 ) ( ON ?auto_209928 ?auto_209927 ) ( not ( = ?auto_209924 ?auto_209925 ) ) ( not ( = ?auto_209924 ?auto_209926 ) ) ( not ( = ?auto_209924 ?auto_209927 ) ) ( not ( = ?auto_209924 ?auto_209928 ) ) ( not ( = ?auto_209924 ?auto_209929 ) ) ( not ( = ?auto_209924 ?auto_209930 ) ) ( not ( = ?auto_209924 ?auto_209931 ) ) ( not ( = ?auto_209925 ?auto_209926 ) ) ( not ( = ?auto_209925 ?auto_209927 ) ) ( not ( = ?auto_209925 ?auto_209928 ) ) ( not ( = ?auto_209925 ?auto_209929 ) ) ( not ( = ?auto_209925 ?auto_209930 ) ) ( not ( = ?auto_209925 ?auto_209931 ) ) ( not ( = ?auto_209926 ?auto_209927 ) ) ( not ( = ?auto_209926 ?auto_209928 ) ) ( not ( = ?auto_209926 ?auto_209929 ) ) ( not ( = ?auto_209926 ?auto_209930 ) ) ( not ( = ?auto_209926 ?auto_209931 ) ) ( not ( = ?auto_209927 ?auto_209928 ) ) ( not ( = ?auto_209927 ?auto_209929 ) ) ( not ( = ?auto_209927 ?auto_209930 ) ) ( not ( = ?auto_209927 ?auto_209931 ) ) ( not ( = ?auto_209928 ?auto_209929 ) ) ( not ( = ?auto_209928 ?auto_209930 ) ) ( not ( = ?auto_209928 ?auto_209931 ) ) ( not ( = ?auto_209929 ?auto_209930 ) ) ( not ( = ?auto_209929 ?auto_209931 ) ) ( not ( = ?auto_209930 ?auto_209931 ) ) ( ON ?auto_209931 ?auto_209932 ) ( not ( = ?auto_209924 ?auto_209932 ) ) ( not ( = ?auto_209925 ?auto_209932 ) ) ( not ( = ?auto_209926 ?auto_209932 ) ) ( not ( = ?auto_209927 ?auto_209932 ) ) ( not ( = ?auto_209928 ?auto_209932 ) ) ( not ( = ?auto_209929 ?auto_209932 ) ) ( not ( = ?auto_209930 ?auto_209932 ) ) ( not ( = ?auto_209931 ?auto_209932 ) ) ( ON ?auto_209930 ?auto_209931 ) ( ON-TABLE ?auto_209932 ) ( CLEAR ?auto_209928 ) ( ON ?auto_209929 ?auto_209930 ) ( CLEAR ?auto_209929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209932 ?auto_209931 ?auto_209930 )
      ( MAKE-8PILE ?auto_209924 ?auto_209925 ?auto_209926 ?auto_209927 ?auto_209928 ?auto_209929 ?auto_209930 ?auto_209931 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209933 - BLOCK
      ?auto_209934 - BLOCK
      ?auto_209935 - BLOCK
      ?auto_209936 - BLOCK
      ?auto_209937 - BLOCK
      ?auto_209938 - BLOCK
      ?auto_209939 - BLOCK
      ?auto_209940 - BLOCK
    )
    :vars
    (
      ?auto_209941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209933 ) ( ON ?auto_209934 ?auto_209933 ) ( ON ?auto_209935 ?auto_209934 ) ( ON ?auto_209936 ?auto_209935 ) ( not ( = ?auto_209933 ?auto_209934 ) ) ( not ( = ?auto_209933 ?auto_209935 ) ) ( not ( = ?auto_209933 ?auto_209936 ) ) ( not ( = ?auto_209933 ?auto_209937 ) ) ( not ( = ?auto_209933 ?auto_209938 ) ) ( not ( = ?auto_209933 ?auto_209939 ) ) ( not ( = ?auto_209933 ?auto_209940 ) ) ( not ( = ?auto_209934 ?auto_209935 ) ) ( not ( = ?auto_209934 ?auto_209936 ) ) ( not ( = ?auto_209934 ?auto_209937 ) ) ( not ( = ?auto_209934 ?auto_209938 ) ) ( not ( = ?auto_209934 ?auto_209939 ) ) ( not ( = ?auto_209934 ?auto_209940 ) ) ( not ( = ?auto_209935 ?auto_209936 ) ) ( not ( = ?auto_209935 ?auto_209937 ) ) ( not ( = ?auto_209935 ?auto_209938 ) ) ( not ( = ?auto_209935 ?auto_209939 ) ) ( not ( = ?auto_209935 ?auto_209940 ) ) ( not ( = ?auto_209936 ?auto_209937 ) ) ( not ( = ?auto_209936 ?auto_209938 ) ) ( not ( = ?auto_209936 ?auto_209939 ) ) ( not ( = ?auto_209936 ?auto_209940 ) ) ( not ( = ?auto_209937 ?auto_209938 ) ) ( not ( = ?auto_209937 ?auto_209939 ) ) ( not ( = ?auto_209937 ?auto_209940 ) ) ( not ( = ?auto_209938 ?auto_209939 ) ) ( not ( = ?auto_209938 ?auto_209940 ) ) ( not ( = ?auto_209939 ?auto_209940 ) ) ( ON ?auto_209940 ?auto_209941 ) ( not ( = ?auto_209933 ?auto_209941 ) ) ( not ( = ?auto_209934 ?auto_209941 ) ) ( not ( = ?auto_209935 ?auto_209941 ) ) ( not ( = ?auto_209936 ?auto_209941 ) ) ( not ( = ?auto_209937 ?auto_209941 ) ) ( not ( = ?auto_209938 ?auto_209941 ) ) ( not ( = ?auto_209939 ?auto_209941 ) ) ( not ( = ?auto_209940 ?auto_209941 ) ) ( ON ?auto_209939 ?auto_209940 ) ( ON-TABLE ?auto_209941 ) ( ON ?auto_209938 ?auto_209939 ) ( CLEAR ?auto_209938 ) ( HOLDING ?auto_209937 ) ( CLEAR ?auto_209936 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209933 ?auto_209934 ?auto_209935 ?auto_209936 ?auto_209937 )
      ( MAKE-8PILE ?auto_209933 ?auto_209934 ?auto_209935 ?auto_209936 ?auto_209937 ?auto_209938 ?auto_209939 ?auto_209940 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209942 - BLOCK
      ?auto_209943 - BLOCK
      ?auto_209944 - BLOCK
      ?auto_209945 - BLOCK
      ?auto_209946 - BLOCK
      ?auto_209947 - BLOCK
      ?auto_209948 - BLOCK
      ?auto_209949 - BLOCK
    )
    :vars
    (
      ?auto_209950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209942 ) ( ON ?auto_209943 ?auto_209942 ) ( ON ?auto_209944 ?auto_209943 ) ( ON ?auto_209945 ?auto_209944 ) ( not ( = ?auto_209942 ?auto_209943 ) ) ( not ( = ?auto_209942 ?auto_209944 ) ) ( not ( = ?auto_209942 ?auto_209945 ) ) ( not ( = ?auto_209942 ?auto_209946 ) ) ( not ( = ?auto_209942 ?auto_209947 ) ) ( not ( = ?auto_209942 ?auto_209948 ) ) ( not ( = ?auto_209942 ?auto_209949 ) ) ( not ( = ?auto_209943 ?auto_209944 ) ) ( not ( = ?auto_209943 ?auto_209945 ) ) ( not ( = ?auto_209943 ?auto_209946 ) ) ( not ( = ?auto_209943 ?auto_209947 ) ) ( not ( = ?auto_209943 ?auto_209948 ) ) ( not ( = ?auto_209943 ?auto_209949 ) ) ( not ( = ?auto_209944 ?auto_209945 ) ) ( not ( = ?auto_209944 ?auto_209946 ) ) ( not ( = ?auto_209944 ?auto_209947 ) ) ( not ( = ?auto_209944 ?auto_209948 ) ) ( not ( = ?auto_209944 ?auto_209949 ) ) ( not ( = ?auto_209945 ?auto_209946 ) ) ( not ( = ?auto_209945 ?auto_209947 ) ) ( not ( = ?auto_209945 ?auto_209948 ) ) ( not ( = ?auto_209945 ?auto_209949 ) ) ( not ( = ?auto_209946 ?auto_209947 ) ) ( not ( = ?auto_209946 ?auto_209948 ) ) ( not ( = ?auto_209946 ?auto_209949 ) ) ( not ( = ?auto_209947 ?auto_209948 ) ) ( not ( = ?auto_209947 ?auto_209949 ) ) ( not ( = ?auto_209948 ?auto_209949 ) ) ( ON ?auto_209949 ?auto_209950 ) ( not ( = ?auto_209942 ?auto_209950 ) ) ( not ( = ?auto_209943 ?auto_209950 ) ) ( not ( = ?auto_209944 ?auto_209950 ) ) ( not ( = ?auto_209945 ?auto_209950 ) ) ( not ( = ?auto_209946 ?auto_209950 ) ) ( not ( = ?auto_209947 ?auto_209950 ) ) ( not ( = ?auto_209948 ?auto_209950 ) ) ( not ( = ?auto_209949 ?auto_209950 ) ) ( ON ?auto_209948 ?auto_209949 ) ( ON-TABLE ?auto_209950 ) ( ON ?auto_209947 ?auto_209948 ) ( CLEAR ?auto_209945 ) ( ON ?auto_209946 ?auto_209947 ) ( CLEAR ?auto_209946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209950 ?auto_209949 ?auto_209948 ?auto_209947 )
      ( MAKE-8PILE ?auto_209942 ?auto_209943 ?auto_209944 ?auto_209945 ?auto_209946 ?auto_209947 ?auto_209948 ?auto_209949 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209951 - BLOCK
      ?auto_209952 - BLOCK
      ?auto_209953 - BLOCK
      ?auto_209954 - BLOCK
      ?auto_209955 - BLOCK
      ?auto_209956 - BLOCK
      ?auto_209957 - BLOCK
      ?auto_209958 - BLOCK
    )
    :vars
    (
      ?auto_209959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209951 ) ( ON ?auto_209952 ?auto_209951 ) ( ON ?auto_209953 ?auto_209952 ) ( not ( = ?auto_209951 ?auto_209952 ) ) ( not ( = ?auto_209951 ?auto_209953 ) ) ( not ( = ?auto_209951 ?auto_209954 ) ) ( not ( = ?auto_209951 ?auto_209955 ) ) ( not ( = ?auto_209951 ?auto_209956 ) ) ( not ( = ?auto_209951 ?auto_209957 ) ) ( not ( = ?auto_209951 ?auto_209958 ) ) ( not ( = ?auto_209952 ?auto_209953 ) ) ( not ( = ?auto_209952 ?auto_209954 ) ) ( not ( = ?auto_209952 ?auto_209955 ) ) ( not ( = ?auto_209952 ?auto_209956 ) ) ( not ( = ?auto_209952 ?auto_209957 ) ) ( not ( = ?auto_209952 ?auto_209958 ) ) ( not ( = ?auto_209953 ?auto_209954 ) ) ( not ( = ?auto_209953 ?auto_209955 ) ) ( not ( = ?auto_209953 ?auto_209956 ) ) ( not ( = ?auto_209953 ?auto_209957 ) ) ( not ( = ?auto_209953 ?auto_209958 ) ) ( not ( = ?auto_209954 ?auto_209955 ) ) ( not ( = ?auto_209954 ?auto_209956 ) ) ( not ( = ?auto_209954 ?auto_209957 ) ) ( not ( = ?auto_209954 ?auto_209958 ) ) ( not ( = ?auto_209955 ?auto_209956 ) ) ( not ( = ?auto_209955 ?auto_209957 ) ) ( not ( = ?auto_209955 ?auto_209958 ) ) ( not ( = ?auto_209956 ?auto_209957 ) ) ( not ( = ?auto_209956 ?auto_209958 ) ) ( not ( = ?auto_209957 ?auto_209958 ) ) ( ON ?auto_209958 ?auto_209959 ) ( not ( = ?auto_209951 ?auto_209959 ) ) ( not ( = ?auto_209952 ?auto_209959 ) ) ( not ( = ?auto_209953 ?auto_209959 ) ) ( not ( = ?auto_209954 ?auto_209959 ) ) ( not ( = ?auto_209955 ?auto_209959 ) ) ( not ( = ?auto_209956 ?auto_209959 ) ) ( not ( = ?auto_209957 ?auto_209959 ) ) ( not ( = ?auto_209958 ?auto_209959 ) ) ( ON ?auto_209957 ?auto_209958 ) ( ON-TABLE ?auto_209959 ) ( ON ?auto_209956 ?auto_209957 ) ( ON ?auto_209955 ?auto_209956 ) ( CLEAR ?auto_209955 ) ( HOLDING ?auto_209954 ) ( CLEAR ?auto_209953 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209951 ?auto_209952 ?auto_209953 ?auto_209954 )
      ( MAKE-8PILE ?auto_209951 ?auto_209952 ?auto_209953 ?auto_209954 ?auto_209955 ?auto_209956 ?auto_209957 ?auto_209958 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209960 - BLOCK
      ?auto_209961 - BLOCK
      ?auto_209962 - BLOCK
      ?auto_209963 - BLOCK
      ?auto_209964 - BLOCK
      ?auto_209965 - BLOCK
      ?auto_209966 - BLOCK
      ?auto_209967 - BLOCK
    )
    :vars
    (
      ?auto_209968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209960 ) ( ON ?auto_209961 ?auto_209960 ) ( ON ?auto_209962 ?auto_209961 ) ( not ( = ?auto_209960 ?auto_209961 ) ) ( not ( = ?auto_209960 ?auto_209962 ) ) ( not ( = ?auto_209960 ?auto_209963 ) ) ( not ( = ?auto_209960 ?auto_209964 ) ) ( not ( = ?auto_209960 ?auto_209965 ) ) ( not ( = ?auto_209960 ?auto_209966 ) ) ( not ( = ?auto_209960 ?auto_209967 ) ) ( not ( = ?auto_209961 ?auto_209962 ) ) ( not ( = ?auto_209961 ?auto_209963 ) ) ( not ( = ?auto_209961 ?auto_209964 ) ) ( not ( = ?auto_209961 ?auto_209965 ) ) ( not ( = ?auto_209961 ?auto_209966 ) ) ( not ( = ?auto_209961 ?auto_209967 ) ) ( not ( = ?auto_209962 ?auto_209963 ) ) ( not ( = ?auto_209962 ?auto_209964 ) ) ( not ( = ?auto_209962 ?auto_209965 ) ) ( not ( = ?auto_209962 ?auto_209966 ) ) ( not ( = ?auto_209962 ?auto_209967 ) ) ( not ( = ?auto_209963 ?auto_209964 ) ) ( not ( = ?auto_209963 ?auto_209965 ) ) ( not ( = ?auto_209963 ?auto_209966 ) ) ( not ( = ?auto_209963 ?auto_209967 ) ) ( not ( = ?auto_209964 ?auto_209965 ) ) ( not ( = ?auto_209964 ?auto_209966 ) ) ( not ( = ?auto_209964 ?auto_209967 ) ) ( not ( = ?auto_209965 ?auto_209966 ) ) ( not ( = ?auto_209965 ?auto_209967 ) ) ( not ( = ?auto_209966 ?auto_209967 ) ) ( ON ?auto_209967 ?auto_209968 ) ( not ( = ?auto_209960 ?auto_209968 ) ) ( not ( = ?auto_209961 ?auto_209968 ) ) ( not ( = ?auto_209962 ?auto_209968 ) ) ( not ( = ?auto_209963 ?auto_209968 ) ) ( not ( = ?auto_209964 ?auto_209968 ) ) ( not ( = ?auto_209965 ?auto_209968 ) ) ( not ( = ?auto_209966 ?auto_209968 ) ) ( not ( = ?auto_209967 ?auto_209968 ) ) ( ON ?auto_209966 ?auto_209967 ) ( ON-TABLE ?auto_209968 ) ( ON ?auto_209965 ?auto_209966 ) ( ON ?auto_209964 ?auto_209965 ) ( CLEAR ?auto_209962 ) ( ON ?auto_209963 ?auto_209964 ) ( CLEAR ?auto_209963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209968 ?auto_209967 ?auto_209966 ?auto_209965 ?auto_209964 )
      ( MAKE-8PILE ?auto_209960 ?auto_209961 ?auto_209962 ?auto_209963 ?auto_209964 ?auto_209965 ?auto_209966 ?auto_209967 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209969 - BLOCK
      ?auto_209970 - BLOCK
      ?auto_209971 - BLOCK
      ?auto_209972 - BLOCK
      ?auto_209973 - BLOCK
      ?auto_209974 - BLOCK
      ?auto_209975 - BLOCK
      ?auto_209976 - BLOCK
    )
    :vars
    (
      ?auto_209977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209969 ) ( ON ?auto_209970 ?auto_209969 ) ( not ( = ?auto_209969 ?auto_209970 ) ) ( not ( = ?auto_209969 ?auto_209971 ) ) ( not ( = ?auto_209969 ?auto_209972 ) ) ( not ( = ?auto_209969 ?auto_209973 ) ) ( not ( = ?auto_209969 ?auto_209974 ) ) ( not ( = ?auto_209969 ?auto_209975 ) ) ( not ( = ?auto_209969 ?auto_209976 ) ) ( not ( = ?auto_209970 ?auto_209971 ) ) ( not ( = ?auto_209970 ?auto_209972 ) ) ( not ( = ?auto_209970 ?auto_209973 ) ) ( not ( = ?auto_209970 ?auto_209974 ) ) ( not ( = ?auto_209970 ?auto_209975 ) ) ( not ( = ?auto_209970 ?auto_209976 ) ) ( not ( = ?auto_209971 ?auto_209972 ) ) ( not ( = ?auto_209971 ?auto_209973 ) ) ( not ( = ?auto_209971 ?auto_209974 ) ) ( not ( = ?auto_209971 ?auto_209975 ) ) ( not ( = ?auto_209971 ?auto_209976 ) ) ( not ( = ?auto_209972 ?auto_209973 ) ) ( not ( = ?auto_209972 ?auto_209974 ) ) ( not ( = ?auto_209972 ?auto_209975 ) ) ( not ( = ?auto_209972 ?auto_209976 ) ) ( not ( = ?auto_209973 ?auto_209974 ) ) ( not ( = ?auto_209973 ?auto_209975 ) ) ( not ( = ?auto_209973 ?auto_209976 ) ) ( not ( = ?auto_209974 ?auto_209975 ) ) ( not ( = ?auto_209974 ?auto_209976 ) ) ( not ( = ?auto_209975 ?auto_209976 ) ) ( ON ?auto_209976 ?auto_209977 ) ( not ( = ?auto_209969 ?auto_209977 ) ) ( not ( = ?auto_209970 ?auto_209977 ) ) ( not ( = ?auto_209971 ?auto_209977 ) ) ( not ( = ?auto_209972 ?auto_209977 ) ) ( not ( = ?auto_209973 ?auto_209977 ) ) ( not ( = ?auto_209974 ?auto_209977 ) ) ( not ( = ?auto_209975 ?auto_209977 ) ) ( not ( = ?auto_209976 ?auto_209977 ) ) ( ON ?auto_209975 ?auto_209976 ) ( ON-TABLE ?auto_209977 ) ( ON ?auto_209974 ?auto_209975 ) ( ON ?auto_209973 ?auto_209974 ) ( ON ?auto_209972 ?auto_209973 ) ( CLEAR ?auto_209972 ) ( HOLDING ?auto_209971 ) ( CLEAR ?auto_209970 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209969 ?auto_209970 ?auto_209971 )
      ( MAKE-8PILE ?auto_209969 ?auto_209970 ?auto_209971 ?auto_209972 ?auto_209973 ?auto_209974 ?auto_209975 ?auto_209976 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209978 - BLOCK
      ?auto_209979 - BLOCK
      ?auto_209980 - BLOCK
      ?auto_209981 - BLOCK
      ?auto_209982 - BLOCK
      ?auto_209983 - BLOCK
      ?auto_209984 - BLOCK
      ?auto_209985 - BLOCK
    )
    :vars
    (
      ?auto_209986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209978 ) ( ON ?auto_209979 ?auto_209978 ) ( not ( = ?auto_209978 ?auto_209979 ) ) ( not ( = ?auto_209978 ?auto_209980 ) ) ( not ( = ?auto_209978 ?auto_209981 ) ) ( not ( = ?auto_209978 ?auto_209982 ) ) ( not ( = ?auto_209978 ?auto_209983 ) ) ( not ( = ?auto_209978 ?auto_209984 ) ) ( not ( = ?auto_209978 ?auto_209985 ) ) ( not ( = ?auto_209979 ?auto_209980 ) ) ( not ( = ?auto_209979 ?auto_209981 ) ) ( not ( = ?auto_209979 ?auto_209982 ) ) ( not ( = ?auto_209979 ?auto_209983 ) ) ( not ( = ?auto_209979 ?auto_209984 ) ) ( not ( = ?auto_209979 ?auto_209985 ) ) ( not ( = ?auto_209980 ?auto_209981 ) ) ( not ( = ?auto_209980 ?auto_209982 ) ) ( not ( = ?auto_209980 ?auto_209983 ) ) ( not ( = ?auto_209980 ?auto_209984 ) ) ( not ( = ?auto_209980 ?auto_209985 ) ) ( not ( = ?auto_209981 ?auto_209982 ) ) ( not ( = ?auto_209981 ?auto_209983 ) ) ( not ( = ?auto_209981 ?auto_209984 ) ) ( not ( = ?auto_209981 ?auto_209985 ) ) ( not ( = ?auto_209982 ?auto_209983 ) ) ( not ( = ?auto_209982 ?auto_209984 ) ) ( not ( = ?auto_209982 ?auto_209985 ) ) ( not ( = ?auto_209983 ?auto_209984 ) ) ( not ( = ?auto_209983 ?auto_209985 ) ) ( not ( = ?auto_209984 ?auto_209985 ) ) ( ON ?auto_209985 ?auto_209986 ) ( not ( = ?auto_209978 ?auto_209986 ) ) ( not ( = ?auto_209979 ?auto_209986 ) ) ( not ( = ?auto_209980 ?auto_209986 ) ) ( not ( = ?auto_209981 ?auto_209986 ) ) ( not ( = ?auto_209982 ?auto_209986 ) ) ( not ( = ?auto_209983 ?auto_209986 ) ) ( not ( = ?auto_209984 ?auto_209986 ) ) ( not ( = ?auto_209985 ?auto_209986 ) ) ( ON ?auto_209984 ?auto_209985 ) ( ON-TABLE ?auto_209986 ) ( ON ?auto_209983 ?auto_209984 ) ( ON ?auto_209982 ?auto_209983 ) ( ON ?auto_209981 ?auto_209982 ) ( CLEAR ?auto_209979 ) ( ON ?auto_209980 ?auto_209981 ) ( CLEAR ?auto_209980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209986 ?auto_209985 ?auto_209984 ?auto_209983 ?auto_209982 ?auto_209981 )
      ( MAKE-8PILE ?auto_209978 ?auto_209979 ?auto_209980 ?auto_209981 ?auto_209982 ?auto_209983 ?auto_209984 ?auto_209985 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209987 - BLOCK
      ?auto_209988 - BLOCK
      ?auto_209989 - BLOCK
      ?auto_209990 - BLOCK
      ?auto_209991 - BLOCK
      ?auto_209992 - BLOCK
      ?auto_209993 - BLOCK
      ?auto_209994 - BLOCK
    )
    :vars
    (
      ?auto_209995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209987 ) ( not ( = ?auto_209987 ?auto_209988 ) ) ( not ( = ?auto_209987 ?auto_209989 ) ) ( not ( = ?auto_209987 ?auto_209990 ) ) ( not ( = ?auto_209987 ?auto_209991 ) ) ( not ( = ?auto_209987 ?auto_209992 ) ) ( not ( = ?auto_209987 ?auto_209993 ) ) ( not ( = ?auto_209987 ?auto_209994 ) ) ( not ( = ?auto_209988 ?auto_209989 ) ) ( not ( = ?auto_209988 ?auto_209990 ) ) ( not ( = ?auto_209988 ?auto_209991 ) ) ( not ( = ?auto_209988 ?auto_209992 ) ) ( not ( = ?auto_209988 ?auto_209993 ) ) ( not ( = ?auto_209988 ?auto_209994 ) ) ( not ( = ?auto_209989 ?auto_209990 ) ) ( not ( = ?auto_209989 ?auto_209991 ) ) ( not ( = ?auto_209989 ?auto_209992 ) ) ( not ( = ?auto_209989 ?auto_209993 ) ) ( not ( = ?auto_209989 ?auto_209994 ) ) ( not ( = ?auto_209990 ?auto_209991 ) ) ( not ( = ?auto_209990 ?auto_209992 ) ) ( not ( = ?auto_209990 ?auto_209993 ) ) ( not ( = ?auto_209990 ?auto_209994 ) ) ( not ( = ?auto_209991 ?auto_209992 ) ) ( not ( = ?auto_209991 ?auto_209993 ) ) ( not ( = ?auto_209991 ?auto_209994 ) ) ( not ( = ?auto_209992 ?auto_209993 ) ) ( not ( = ?auto_209992 ?auto_209994 ) ) ( not ( = ?auto_209993 ?auto_209994 ) ) ( ON ?auto_209994 ?auto_209995 ) ( not ( = ?auto_209987 ?auto_209995 ) ) ( not ( = ?auto_209988 ?auto_209995 ) ) ( not ( = ?auto_209989 ?auto_209995 ) ) ( not ( = ?auto_209990 ?auto_209995 ) ) ( not ( = ?auto_209991 ?auto_209995 ) ) ( not ( = ?auto_209992 ?auto_209995 ) ) ( not ( = ?auto_209993 ?auto_209995 ) ) ( not ( = ?auto_209994 ?auto_209995 ) ) ( ON ?auto_209993 ?auto_209994 ) ( ON-TABLE ?auto_209995 ) ( ON ?auto_209992 ?auto_209993 ) ( ON ?auto_209991 ?auto_209992 ) ( ON ?auto_209990 ?auto_209991 ) ( ON ?auto_209989 ?auto_209990 ) ( CLEAR ?auto_209989 ) ( HOLDING ?auto_209988 ) ( CLEAR ?auto_209987 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209987 ?auto_209988 )
      ( MAKE-8PILE ?auto_209987 ?auto_209988 ?auto_209989 ?auto_209990 ?auto_209991 ?auto_209992 ?auto_209993 ?auto_209994 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209996 - BLOCK
      ?auto_209997 - BLOCK
      ?auto_209998 - BLOCK
      ?auto_209999 - BLOCK
      ?auto_210000 - BLOCK
      ?auto_210001 - BLOCK
      ?auto_210002 - BLOCK
      ?auto_210003 - BLOCK
    )
    :vars
    (
      ?auto_210004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_209996 ) ( not ( = ?auto_209996 ?auto_209997 ) ) ( not ( = ?auto_209996 ?auto_209998 ) ) ( not ( = ?auto_209996 ?auto_209999 ) ) ( not ( = ?auto_209996 ?auto_210000 ) ) ( not ( = ?auto_209996 ?auto_210001 ) ) ( not ( = ?auto_209996 ?auto_210002 ) ) ( not ( = ?auto_209996 ?auto_210003 ) ) ( not ( = ?auto_209997 ?auto_209998 ) ) ( not ( = ?auto_209997 ?auto_209999 ) ) ( not ( = ?auto_209997 ?auto_210000 ) ) ( not ( = ?auto_209997 ?auto_210001 ) ) ( not ( = ?auto_209997 ?auto_210002 ) ) ( not ( = ?auto_209997 ?auto_210003 ) ) ( not ( = ?auto_209998 ?auto_209999 ) ) ( not ( = ?auto_209998 ?auto_210000 ) ) ( not ( = ?auto_209998 ?auto_210001 ) ) ( not ( = ?auto_209998 ?auto_210002 ) ) ( not ( = ?auto_209998 ?auto_210003 ) ) ( not ( = ?auto_209999 ?auto_210000 ) ) ( not ( = ?auto_209999 ?auto_210001 ) ) ( not ( = ?auto_209999 ?auto_210002 ) ) ( not ( = ?auto_209999 ?auto_210003 ) ) ( not ( = ?auto_210000 ?auto_210001 ) ) ( not ( = ?auto_210000 ?auto_210002 ) ) ( not ( = ?auto_210000 ?auto_210003 ) ) ( not ( = ?auto_210001 ?auto_210002 ) ) ( not ( = ?auto_210001 ?auto_210003 ) ) ( not ( = ?auto_210002 ?auto_210003 ) ) ( ON ?auto_210003 ?auto_210004 ) ( not ( = ?auto_209996 ?auto_210004 ) ) ( not ( = ?auto_209997 ?auto_210004 ) ) ( not ( = ?auto_209998 ?auto_210004 ) ) ( not ( = ?auto_209999 ?auto_210004 ) ) ( not ( = ?auto_210000 ?auto_210004 ) ) ( not ( = ?auto_210001 ?auto_210004 ) ) ( not ( = ?auto_210002 ?auto_210004 ) ) ( not ( = ?auto_210003 ?auto_210004 ) ) ( ON ?auto_210002 ?auto_210003 ) ( ON-TABLE ?auto_210004 ) ( ON ?auto_210001 ?auto_210002 ) ( ON ?auto_210000 ?auto_210001 ) ( ON ?auto_209999 ?auto_210000 ) ( ON ?auto_209998 ?auto_209999 ) ( CLEAR ?auto_209996 ) ( ON ?auto_209997 ?auto_209998 ) ( CLEAR ?auto_209997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210004 ?auto_210003 ?auto_210002 ?auto_210001 ?auto_210000 ?auto_209999 ?auto_209998 )
      ( MAKE-8PILE ?auto_209996 ?auto_209997 ?auto_209998 ?auto_209999 ?auto_210000 ?auto_210001 ?auto_210002 ?auto_210003 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_210005 - BLOCK
      ?auto_210006 - BLOCK
      ?auto_210007 - BLOCK
      ?auto_210008 - BLOCK
      ?auto_210009 - BLOCK
      ?auto_210010 - BLOCK
      ?auto_210011 - BLOCK
      ?auto_210012 - BLOCK
    )
    :vars
    (
      ?auto_210013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210005 ?auto_210006 ) ) ( not ( = ?auto_210005 ?auto_210007 ) ) ( not ( = ?auto_210005 ?auto_210008 ) ) ( not ( = ?auto_210005 ?auto_210009 ) ) ( not ( = ?auto_210005 ?auto_210010 ) ) ( not ( = ?auto_210005 ?auto_210011 ) ) ( not ( = ?auto_210005 ?auto_210012 ) ) ( not ( = ?auto_210006 ?auto_210007 ) ) ( not ( = ?auto_210006 ?auto_210008 ) ) ( not ( = ?auto_210006 ?auto_210009 ) ) ( not ( = ?auto_210006 ?auto_210010 ) ) ( not ( = ?auto_210006 ?auto_210011 ) ) ( not ( = ?auto_210006 ?auto_210012 ) ) ( not ( = ?auto_210007 ?auto_210008 ) ) ( not ( = ?auto_210007 ?auto_210009 ) ) ( not ( = ?auto_210007 ?auto_210010 ) ) ( not ( = ?auto_210007 ?auto_210011 ) ) ( not ( = ?auto_210007 ?auto_210012 ) ) ( not ( = ?auto_210008 ?auto_210009 ) ) ( not ( = ?auto_210008 ?auto_210010 ) ) ( not ( = ?auto_210008 ?auto_210011 ) ) ( not ( = ?auto_210008 ?auto_210012 ) ) ( not ( = ?auto_210009 ?auto_210010 ) ) ( not ( = ?auto_210009 ?auto_210011 ) ) ( not ( = ?auto_210009 ?auto_210012 ) ) ( not ( = ?auto_210010 ?auto_210011 ) ) ( not ( = ?auto_210010 ?auto_210012 ) ) ( not ( = ?auto_210011 ?auto_210012 ) ) ( ON ?auto_210012 ?auto_210013 ) ( not ( = ?auto_210005 ?auto_210013 ) ) ( not ( = ?auto_210006 ?auto_210013 ) ) ( not ( = ?auto_210007 ?auto_210013 ) ) ( not ( = ?auto_210008 ?auto_210013 ) ) ( not ( = ?auto_210009 ?auto_210013 ) ) ( not ( = ?auto_210010 ?auto_210013 ) ) ( not ( = ?auto_210011 ?auto_210013 ) ) ( not ( = ?auto_210012 ?auto_210013 ) ) ( ON ?auto_210011 ?auto_210012 ) ( ON-TABLE ?auto_210013 ) ( ON ?auto_210010 ?auto_210011 ) ( ON ?auto_210009 ?auto_210010 ) ( ON ?auto_210008 ?auto_210009 ) ( ON ?auto_210007 ?auto_210008 ) ( ON ?auto_210006 ?auto_210007 ) ( CLEAR ?auto_210006 ) ( HOLDING ?auto_210005 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_210005 )
      ( MAKE-8PILE ?auto_210005 ?auto_210006 ?auto_210007 ?auto_210008 ?auto_210009 ?auto_210010 ?auto_210011 ?auto_210012 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_210014 - BLOCK
      ?auto_210015 - BLOCK
      ?auto_210016 - BLOCK
      ?auto_210017 - BLOCK
      ?auto_210018 - BLOCK
      ?auto_210019 - BLOCK
      ?auto_210020 - BLOCK
      ?auto_210021 - BLOCK
    )
    :vars
    (
      ?auto_210022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210014 ?auto_210015 ) ) ( not ( = ?auto_210014 ?auto_210016 ) ) ( not ( = ?auto_210014 ?auto_210017 ) ) ( not ( = ?auto_210014 ?auto_210018 ) ) ( not ( = ?auto_210014 ?auto_210019 ) ) ( not ( = ?auto_210014 ?auto_210020 ) ) ( not ( = ?auto_210014 ?auto_210021 ) ) ( not ( = ?auto_210015 ?auto_210016 ) ) ( not ( = ?auto_210015 ?auto_210017 ) ) ( not ( = ?auto_210015 ?auto_210018 ) ) ( not ( = ?auto_210015 ?auto_210019 ) ) ( not ( = ?auto_210015 ?auto_210020 ) ) ( not ( = ?auto_210015 ?auto_210021 ) ) ( not ( = ?auto_210016 ?auto_210017 ) ) ( not ( = ?auto_210016 ?auto_210018 ) ) ( not ( = ?auto_210016 ?auto_210019 ) ) ( not ( = ?auto_210016 ?auto_210020 ) ) ( not ( = ?auto_210016 ?auto_210021 ) ) ( not ( = ?auto_210017 ?auto_210018 ) ) ( not ( = ?auto_210017 ?auto_210019 ) ) ( not ( = ?auto_210017 ?auto_210020 ) ) ( not ( = ?auto_210017 ?auto_210021 ) ) ( not ( = ?auto_210018 ?auto_210019 ) ) ( not ( = ?auto_210018 ?auto_210020 ) ) ( not ( = ?auto_210018 ?auto_210021 ) ) ( not ( = ?auto_210019 ?auto_210020 ) ) ( not ( = ?auto_210019 ?auto_210021 ) ) ( not ( = ?auto_210020 ?auto_210021 ) ) ( ON ?auto_210021 ?auto_210022 ) ( not ( = ?auto_210014 ?auto_210022 ) ) ( not ( = ?auto_210015 ?auto_210022 ) ) ( not ( = ?auto_210016 ?auto_210022 ) ) ( not ( = ?auto_210017 ?auto_210022 ) ) ( not ( = ?auto_210018 ?auto_210022 ) ) ( not ( = ?auto_210019 ?auto_210022 ) ) ( not ( = ?auto_210020 ?auto_210022 ) ) ( not ( = ?auto_210021 ?auto_210022 ) ) ( ON ?auto_210020 ?auto_210021 ) ( ON-TABLE ?auto_210022 ) ( ON ?auto_210019 ?auto_210020 ) ( ON ?auto_210018 ?auto_210019 ) ( ON ?auto_210017 ?auto_210018 ) ( ON ?auto_210016 ?auto_210017 ) ( ON ?auto_210015 ?auto_210016 ) ( ON ?auto_210014 ?auto_210015 ) ( CLEAR ?auto_210014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210022 ?auto_210021 ?auto_210020 ?auto_210019 ?auto_210018 ?auto_210017 ?auto_210016 ?auto_210015 )
      ( MAKE-8PILE ?auto_210014 ?auto_210015 ?auto_210016 ?auto_210017 ?auto_210018 ?auto_210019 ?auto_210020 ?auto_210021 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210030 - BLOCK
      ?auto_210031 - BLOCK
      ?auto_210032 - BLOCK
      ?auto_210033 - BLOCK
      ?auto_210034 - BLOCK
      ?auto_210035 - BLOCK
      ?auto_210036 - BLOCK
    )
    :vars
    (
      ?auto_210037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210037 ?auto_210036 ) ( CLEAR ?auto_210037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210030 ) ( ON ?auto_210031 ?auto_210030 ) ( ON ?auto_210032 ?auto_210031 ) ( ON ?auto_210033 ?auto_210032 ) ( ON ?auto_210034 ?auto_210033 ) ( ON ?auto_210035 ?auto_210034 ) ( ON ?auto_210036 ?auto_210035 ) ( not ( = ?auto_210030 ?auto_210031 ) ) ( not ( = ?auto_210030 ?auto_210032 ) ) ( not ( = ?auto_210030 ?auto_210033 ) ) ( not ( = ?auto_210030 ?auto_210034 ) ) ( not ( = ?auto_210030 ?auto_210035 ) ) ( not ( = ?auto_210030 ?auto_210036 ) ) ( not ( = ?auto_210030 ?auto_210037 ) ) ( not ( = ?auto_210031 ?auto_210032 ) ) ( not ( = ?auto_210031 ?auto_210033 ) ) ( not ( = ?auto_210031 ?auto_210034 ) ) ( not ( = ?auto_210031 ?auto_210035 ) ) ( not ( = ?auto_210031 ?auto_210036 ) ) ( not ( = ?auto_210031 ?auto_210037 ) ) ( not ( = ?auto_210032 ?auto_210033 ) ) ( not ( = ?auto_210032 ?auto_210034 ) ) ( not ( = ?auto_210032 ?auto_210035 ) ) ( not ( = ?auto_210032 ?auto_210036 ) ) ( not ( = ?auto_210032 ?auto_210037 ) ) ( not ( = ?auto_210033 ?auto_210034 ) ) ( not ( = ?auto_210033 ?auto_210035 ) ) ( not ( = ?auto_210033 ?auto_210036 ) ) ( not ( = ?auto_210033 ?auto_210037 ) ) ( not ( = ?auto_210034 ?auto_210035 ) ) ( not ( = ?auto_210034 ?auto_210036 ) ) ( not ( = ?auto_210034 ?auto_210037 ) ) ( not ( = ?auto_210035 ?auto_210036 ) ) ( not ( = ?auto_210035 ?auto_210037 ) ) ( not ( = ?auto_210036 ?auto_210037 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210037 ?auto_210036 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210055 - BLOCK
      ?auto_210056 - BLOCK
      ?auto_210057 - BLOCK
      ?auto_210058 - BLOCK
      ?auto_210059 - BLOCK
      ?auto_210060 - BLOCK
      ?auto_210061 - BLOCK
    )
    :vars
    (
      ?auto_210062 - BLOCK
      ?auto_210063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210055 ) ( ON ?auto_210056 ?auto_210055 ) ( ON ?auto_210057 ?auto_210056 ) ( ON ?auto_210058 ?auto_210057 ) ( ON ?auto_210059 ?auto_210058 ) ( ON ?auto_210060 ?auto_210059 ) ( not ( = ?auto_210055 ?auto_210056 ) ) ( not ( = ?auto_210055 ?auto_210057 ) ) ( not ( = ?auto_210055 ?auto_210058 ) ) ( not ( = ?auto_210055 ?auto_210059 ) ) ( not ( = ?auto_210055 ?auto_210060 ) ) ( not ( = ?auto_210055 ?auto_210061 ) ) ( not ( = ?auto_210055 ?auto_210062 ) ) ( not ( = ?auto_210056 ?auto_210057 ) ) ( not ( = ?auto_210056 ?auto_210058 ) ) ( not ( = ?auto_210056 ?auto_210059 ) ) ( not ( = ?auto_210056 ?auto_210060 ) ) ( not ( = ?auto_210056 ?auto_210061 ) ) ( not ( = ?auto_210056 ?auto_210062 ) ) ( not ( = ?auto_210057 ?auto_210058 ) ) ( not ( = ?auto_210057 ?auto_210059 ) ) ( not ( = ?auto_210057 ?auto_210060 ) ) ( not ( = ?auto_210057 ?auto_210061 ) ) ( not ( = ?auto_210057 ?auto_210062 ) ) ( not ( = ?auto_210058 ?auto_210059 ) ) ( not ( = ?auto_210058 ?auto_210060 ) ) ( not ( = ?auto_210058 ?auto_210061 ) ) ( not ( = ?auto_210058 ?auto_210062 ) ) ( not ( = ?auto_210059 ?auto_210060 ) ) ( not ( = ?auto_210059 ?auto_210061 ) ) ( not ( = ?auto_210059 ?auto_210062 ) ) ( not ( = ?auto_210060 ?auto_210061 ) ) ( not ( = ?auto_210060 ?auto_210062 ) ) ( not ( = ?auto_210061 ?auto_210062 ) ) ( ON ?auto_210062 ?auto_210063 ) ( CLEAR ?auto_210062 ) ( not ( = ?auto_210055 ?auto_210063 ) ) ( not ( = ?auto_210056 ?auto_210063 ) ) ( not ( = ?auto_210057 ?auto_210063 ) ) ( not ( = ?auto_210058 ?auto_210063 ) ) ( not ( = ?auto_210059 ?auto_210063 ) ) ( not ( = ?auto_210060 ?auto_210063 ) ) ( not ( = ?auto_210061 ?auto_210063 ) ) ( not ( = ?auto_210062 ?auto_210063 ) ) ( HOLDING ?auto_210061 ) ( CLEAR ?auto_210060 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210055 ?auto_210056 ?auto_210057 ?auto_210058 ?auto_210059 ?auto_210060 ?auto_210061 ?auto_210062 )
      ( MAKE-7PILE ?auto_210055 ?auto_210056 ?auto_210057 ?auto_210058 ?auto_210059 ?auto_210060 ?auto_210061 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210064 - BLOCK
      ?auto_210065 - BLOCK
      ?auto_210066 - BLOCK
      ?auto_210067 - BLOCK
      ?auto_210068 - BLOCK
      ?auto_210069 - BLOCK
      ?auto_210070 - BLOCK
    )
    :vars
    (
      ?auto_210071 - BLOCK
      ?auto_210072 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210064 ) ( ON ?auto_210065 ?auto_210064 ) ( ON ?auto_210066 ?auto_210065 ) ( ON ?auto_210067 ?auto_210066 ) ( ON ?auto_210068 ?auto_210067 ) ( ON ?auto_210069 ?auto_210068 ) ( not ( = ?auto_210064 ?auto_210065 ) ) ( not ( = ?auto_210064 ?auto_210066 ) ) ( not ( = ?auto_210064 ?auto_210067 ) ) ( not ( = ?auto_210064 ?auto_210068 ) ) ( not ( = ?auto_210064 ?auto_210069 ) ) ( not ( = ?auto_210064 ?auto_210070 ) ) ( not ( = ?auto_210064 ?auto_210071 ) ) ( not ( = ?auto_210065 ?auto_210066 ) ) ( not ( = ?auto_210065 ?auto_210067 ) ) ( not ( = ?auto_210065 ?auto_210068 ) ) ( not ( = ?auto_210065 ?auto_210069 ) ) ( not ( = ?auto_210065 ?auto_210070 ) ) ( not ( = ?auto_210065 ?auto_210071 ) ) ( not ( = ?auto_210066 ?auto_210067 ) ) ( not ( = ?auto_210066 ?auto_210068 ) ) ( not ( = ?auto_210066 ?auto_210069 ) ) ( not ( = ?auto_210066 ?auto_210070 ) ) ( not ( = ?auto_210066 ?auto_210071 ) ) ( not ( = ?auto_210067 ?auto_210068 ) ) ( not ( = ?auto_210067 ?auto_210069 ) ) ( not ( = ?auto_210067 ?auto_210070 ) ) ( not ( = ?auto_210067 ?auto_210071 ) ) ( not ( = ?auto_210068 ?auto_210069 ) ) ( not ( = ?auto_210068 ?auto_210070 ) ) ( not ( = ?auto_210068 ?auto_210071 ) ) ( not ( = ?auto_210069 ?auto_210070 ) ) ( not ( = ?auto_210069 ?auto_210071 ) ) ( not ( = ?auto_210070 ?auto_210071 ) ) ( ON ?auto_210071 ?auto_210072 ) ( not ( = ?auto_210064 ?auto_210072 ) ) ( not ( = ?auto_210065 ?auto_210072 ) ) ( not ( = ?auto_210066 ?auto_210072 ) ) ( not ( = ?auto_210067 ?auto_210072 ) ) ( not ( = ?auto_210068 ?auto_210072 ) ) ( not ( = ?auto_210069 ?auto_210072 ) ) ( not ( = ?auto_210070 ?auto_210072 ) ) ( not ( = ?auto_210071 ?auto_210072 ) ) ( CLEAR ?auto_210069 ) ( ON ?auto_210070 ?auto_210071 ) ( CLEAR ?auto_210070 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210072 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210072 ?auto_210071 )
      ( MAKE-7PILE ?auto_210064 ?auto_210065 ?auto_210066 ?auto_210067 ?auto_210068 ?auto_210069 ?auto_210070 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210073 - BLOCK
      ?auto_210074 - BLOCK
      ?auto_210075 - BLOCK
      ?auto_210076 - BLOCK
      ?auto_210077 - BLOCK
      ?auto_210078 - BLOCK
      ?auto_210079 - BLOCK
    )
    :vars
    (
      ?auto_210081 - BLOCK
      ?auto_210080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210073 ) ( ON ?auto_210074 ?auto_210073 ) ( ON ?auto_210075 ?auto_210074 ) ( ON ?auto_210076 ?auto_210075 ) ( ON ?auto_210077 ?auto_210076 ) ( not ( = ?auto_210073 ?auto_210074 ) ) ( not ( = ?auto_210073 ?auto_210075 ) ) ( not ( = ?auto_210073 ?auto_210076 ) ) ( not ( = ?auto_210073 ?auto_210077 ) ) ( not ( = ?auto_210073 ?auto_210078 ) ) ( not ( = ?auto_210073 ?auto_210079 ) ) ( not ( = ?auto_210073 ?auto_210081 ) ) ( not ( = ?auto_210074 ?auto_210075 ) ) ( not ( = ?auto_210074 ?auto_210076 ) ) ( not ( = ?auto_210074 ?auto_210077 ) ) ( not ( = ?auto_210074 ?auto_210078 ) ) ( not ( = ?auto_210074 ?auto_210079 ) ) ( not ( = ?auto_210074 ?auto_210081 ) ) ( not ( = ?auto_210075 ?auto_210076 ) ) ( not ( = ?auto_210075 ?auto_210077 ) ) ( not ( = ?auto_210075 ?auto_210078 ) ) ( not ( = ?auto_210075 ?auto_210079 ) ) ( not ( = ?auto_210075 ?auto_210081 ) ) ( not ( = ?auto_210076 ?auto_210077 ) ) ( not ( = ?auto_210076 ?auto_210078 ) ) ( not ( = ?auto_210076 ?auto_210079 ) ) ( not ( = ?auto_210076 ?auto_210081 ) ) ( not ( = ?auto_210077 ?auto_210078 ) ) ( not ( = ?auto_210077 ?auto_210079 ) ) ( not ( = ?auto_210077 ?auto_210081 ) ) ( not ( = ?auto_210078 ?auto_210079 ) ) ( not ( = ?auto_210078 ?auto_210081 ) ) ( not ( = ?auto_210079 ?auto_210081 ) ) ( ON ?auto_210081 ?auto_210080 ) ( not ( = ?auto_210073 ?auto_210080 ) ) ( not ( = ?auto_210074 ?auto_210080 ) ) ( not ( = ?auto_210075 ?auto_210080 ) ) ( not ( = ?auto_210076 ?auto_210080 ) ) ( not ( = ?auto_210077 ?auto_210080 ) ) ( not ( = ?auto_210078 ?auto_210080 ) ) ( not ( = ?auto_210079 ?auto_210080 ) ) ( not ( = ?auto_210081 ?auto_210080 ) ) ( ON ?auto_210079 ?auto_210081 ) ( CLEAR ?auto_210079 ) ( ON-TABLE ?auto_210080 ) ( HOLDING ?auto_210078 ) ( CLEAR ?auto_210077 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210073 ?auto_210074 ?auto_210075 ?auto_210076 ?auto_210077 ?auto_210078 )
      ( MAKE-7PILE ?auto_210073 ?auto_210074 ?auto_210075 ?auto_210076 ?auto_210077 ?auto_210078 ?auto_210079 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210082 - BLOCK
      ?auto_210083 - BLOCK
      ?auto_210084 - BLOCK
      ?auto_210085 - BLOCK
      ?auto_210086 - BLOCK
      ?auto_210087 - BLOCK
      ?auto_210088 - BLOCK
    )
    :vars
    (
      ?auto_210089 - BLOCK
      ?auto_210090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210082 ) ( ON ?auto_210083 ?auto_210082 ) ( ON ?auto_210084 ?auto_210083 ) ( ON ?auto_210085 ?auto_210084 ) ( ON ?auto_210086 ?auto_210085 ) ( not ( = ?auto_210082 ?auto_210083 ) ) ( not ( = ?auto_210082 ?auto_210084 ) ) ( not ( = ?auto_210082 ?auto_210085 ) ) ( not ( = ?auto_210082 ?auto_210086 ) ) ( not ( = ?auto_210082 ?auto_210087 ) ) ( not ( = ?auto_210082 ?auto_210088 ) ) ( not ( = ?auto_210082 ?auto_210089 ) ) ( not ( = ?auto_210083 ?auto_210084 ) ) ( not ( = ?auto_210083 ?auto_210085 ) ) ( not ( = ?auto_210083 ?auto_210086 ) ) ( not ( = ?auto_210083 ?auto_210087 ) ) ( not ( = ?auto_210083 ?auto_210088 ) ) ( not ( = ?auto_210083 ?auto_210089 ) ) ( not ( = ?auto_210084 ?auto_210085 ) ) ( not ( = ?auto_210084 ?auto_210086 ) ) ( not ( = ?auto_210084 ?auto_210087 ) ) ( not ( = ?auto_210084 ?auto_210088 ) ) ( not ( = ?auto_210084 ?auto_210089 ) ) ( not ( = ?auto_210085 ?auto_210086 ) ) ( not ( = ?auto_210085 ?auto_210087 ) ) ( not ( = ?auto_210085 ?auto_210088 ) ) ( not ( = ?auto_210085 ?auto_210089 ) ) ( not ( = ?auto_210086 ?auto_210087 ) ) ( not ( = ?auto_210086 ?auto_210088 ) ) ( not ( = ?auto_210086 ?auto_210089 ) ) ( not ( = ?auto_210087 ?auto_210088 ) ) ( not ( = ?auto_210087 ?auto_210089 ) ) ( not ( = ?auto_210088 ?auto_210089 ) ) ( ON ?auto_210089 ?auto_210090 ) ( not ( = ?auto_210082 ?auto_210090 ) ) ( not ( = ?auto_210083 ?auto_210090 ) ) ( not ( = ?auto_210084 ?auto_210090 ) ) ( not ( = ?auto_210085 ?auto_210090 ) ) ( not ( = ?auto_210086 ?auto_210090 ) ) ( not ( = ?auto_210087 ?auto_210090 ) ) ( not ( = ?auto_210088 ?auto_210090 ) ) ( not ( = ?auto_210089 ?auto_210090 ) ) ( ON ?auto_210088 ?auto_210089 ) ( ON-TABLE ?auto_210090 ) ( CLEAR ?auto_210086 ) ( ON ?auto_210087 ?auto_210088 ) ( CLEAR ?auto_210087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210090 ?auto_210089 ?auto_210088 )
      ( MAKE-7PILE ?auto_210082 ?auto_210083 ?auto_210084 ?auto_210085 ?auto_210086 ?auto_210087 ?auto_210088 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210091 - BLOCK
      ?auto_210092 - BLOCK
      ?auto_210093 - BLOCK
      ?auto_210094 - BLOCK
      ?auto_210095 - BLOCK
      ?auto_210096 - BLOCK
      ?auto_210097 - BLOCK
    )
    :vars
    (
      ?auto_210099 - BLOCK
      ?auto_210098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210091 ) ( ON ?auto_210092 ?auto_210091 ) ( ON ?auto_210093 ?auto_210092 ) ( ON ?auto_210094 ?auto_210093 ) ( not ( = ?auto_210091 ?auto_210092 ) ) ( not ( = ?auto_210091 ?auto_210093 ) ) ( not ( = ?auto_210091 ?auto_210094 ) ) ( not ( = ?auto_210091 ?auto_210095 ) ) ( not ( = ?auto_210091 ?auto_210096 ) ) ( not ( = ?auto_210091 ?auto_210097 ) ) ( not ( = ?auto_210091 ?auto_210099 ) ) ( not ( = ?auto_210092 ?auto_210093 ) ) ( not ( = ?auto_210092 ?auto_210094 ) ) ( not ( = ?auto_210092 ?auto_210095 ) ) ( not ( = ?auto_210092 ?auto_210096 ) ) ( not ( = ?auto_210092 ?auto_210097 ) ) ( not ( = ?auto_210092 ?auto_210099 ) ) ( not ( = ?auto_210093 ?auto_210094 ) ) ( not ( = ?auto_210093 ?auto_210095 ) ) ( not ( = ?auto_210093 ?auto_210096 ) ) ( not ( = ?auto_210093 ?auto_210097 ) ) ( not ( = ?auto_210093 ?auto_210099 ) ) ( not ( = ?auto_210094 ?auto_210095 ) ) ( not ( = ?auto_210094 ?auto_210096 ) ) ( not ( = ?auto_210094 ?auto_210097 ) ) ( not ( = ?auto_210094 ?auto_210099 ) ) ( not ( = ?auto_210095 ?auto_210096 ) ) ( not ( = ?auto_210095 ?auto_210097 ) ) ( not ( = ?auto_210095 ?auto_210099 ) ) ( not ( = ?auto_210096 ?auto_210097 ) ) ( not ( = ?auto_210096 ?auto_210099 ) ) ( not ( = ?auto_210097 ?auto_210099 ) ) ( ON ?auto_210099 ?auto_210098 ) ( not ( = ?auto_210091 ?auto_210098 ) ) ( not ( = ?auto_210092 ?auto_210098 ) ) ( not ( = ?auto_210093 ?auto_210098 ) ) ( not ( = ?auto_210094 ?auto_210098 ) ) ( not ( = ?auto_210095 ?auto_210098 ) ) ( not ( = ?auto_210096 ?auto_210098 ) ) ( not ( = ?auto_210097 ?auto_210098 ) ) ( not ( = ?auto_210099 ?auto_210098 ) ) ( ON ?auto_210097 ?auto_210099 ) ( ON-TABLE ?auto_210098 ) ( ON ?auto_210096 ?auto_210097 ) ( CLEAR ?auto_210096 ) ( HOLDING ?auto_210095 ) ( CLEAR ?auto_210094 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210091 ?auto_210092 ?auto_210093 ?auto_210094 ?auto_210095 )
      ( MAKE-7PILE ?auto_210091 ?auto_210092 ?auto_210093 ?auto_210094 ?auto_210095 ?auto_210096 ?auto_210097 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210100 - BLOCK
      ?auto_210101 - BLOCK
      ?auto_210102 - BLOCK
      ?auto_210103 - BLOCK
      ?auto_210104 - BLOCK
      ?auto_210105 - BLOCK
      ?auto_210106 - BLOCK
    )
    :vars
    (
      ?auto_210108 - BLOCK
      ?auto_210107 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210100 ) ( ON ?auto_210101 ?auto_210100 ) ( ON ?auto_210102 ?auto_210101 ) ( ON ?auto_210103 ?auto_210102 ) ( not ( = ?auto_210100 ?auto_210101 ) ) ( not ( = ?auto_210100 ?auto_210102 ) ) ( not ( = ?auto_210100 ?auto_210103 ) ) ( not ( = ?auto_210100 ?auto_210104 ) ) ( not ( = ?auto_210100 ?auto_210105 ) ) ( not ( = ?auto_210100 ?auto_210106 ) ) ( not ( = ?auto_210100 ?auto_210108 ) ) ( not ( = ?auto_210101 ?auto_210102 ) ) ( not ( = ?auto_210101 ?auto_210103 ) ) ( not ( = ?auto_210101 ?auto_210104 ) ) ( not ( = ?auto_210101 ?auto_210105 ) ) ( not ( = ?auto_210101 ?auto_210106 ) ) ( not ( = ?auto_210101 ?auto_210108 ) ) ( not ( = ?auto_210102 ?auto_210103 ) ) ( not ( = ?auto_210102 ?auto_210104 ) ) ( not ( = ?auto_210102 ?auto_210105 ) ) ( not ( = ?auto_210102 ?auto_210106 ) ) ( not ( = ?auto_210102 ?auto_210108 ) ) ( not ( = ?auto_210103 ?auto_210104 ) ) ( not ( = ?auto_210103 ?auto_210105 ) ) ( not ( = ?auto_210103 ?auto_210106 ) ) ( not ( = ?auto_210103 ?auto_210108 ) ) ( not ( = ?auto_210104 ?auto_210105 ) ) ( not ( = ?auto_210104 ?auto_210106 ) ) ( not ( = ?auto_210104 ?auto_210108 ) ) ( not ( = ?auto_210105 ?auto_210106 ) ) ( not ( = ?auto_210105 ?auto_210108 ) ) ( not ( = ?auto_210106 ?auto_210108 ) ) ( ON ?auto_210108 ?auto_210107 ) ( not ( = ?auto_210100 ?auto_210107 ) ) ( not ( = ?auto_210101 ?auto_210107 ) ) ( not ( = ?auto_210102 ?auto_210107 ) ) ( not ( = ?auto_210103 ?auto_210107 ) ) ( not ( = ?auto_210104 ?auto_210107 ) ) ( not ( = ?auto_210105 ?auto_210107 ) ) ( not ( = ?auto_210106 ?auto_210107 ) ) ( not ( = ?auto_210108 ?auto_210107 ) ) ( ON ?auto_210106 ?auto_210108 ) ( ON-TABLE ?auto_210107 ) ( ON ?auto_210105 ?auto_210106 ) ( CLEAR ?auto_210103 ) ( ON ?auto_210104 ?auto_210105 ) ( CLEAR ?auto_210104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210107 ?auto_210108 ?auto_210106 ?auto_210105 )
      ( MAKE-7PILE ?auto_210100 ?auto_210101 ?auto_210102 ?auto_210103 ?auto_210104 ?auto_210105 ?auto_210106 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210109 - BLOCK
      ?auto_210110 - BLOCK
      ?auto_210111 - BLOCK
      ?auto_210112 - BLOCK
      ?auto_210113 - BLOCK
      ?auto_210114 - BLOCK
      ?auto_210115 - BLOCK
    )
    :vars
    (
      ?auto_210117 - BLOCK
      ?auto_210116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210109 ) ( ON ?auto_210110 ?auto_210109 ) ( ON ?auto_210111 ?auto_210110 ) ( not ( = ?auto_210109 ?auto_210110 ) ) ( not ( = ?auto_210109 ?auto_210111 ) ) ( not ( = ?auto_210109 ?auto_210112 ) ) ( not ( = ?auto_210109 ?auto_210113 ) ) ( not ( = ?auto_210109 ?auto_210114 ) ) ( not ( = ?auto_210109 ?auto_210115 ) ) ( not ( = ?auto_210109 ?auto_210117 ) ) ( not ( = ?auto_210110 ?auto_210111 ) ) ( not ( = ?auto_210110 ?auto_210112 ) ) ( not ( = ?auto_210110 ?auto_210113 ) ) ( not ( = ?auto_210110 ?auto_210114 ) ) ( not ( = ?auto_210110 ?auto_210115 ) ) ( not ( = ?auto_210110 ?auto_210117 ) ) ( not ( = ?auto_210111 ?auto_210112 ) ) ( not ( = ?auto_210111 ?auto_210113 ) ) ( not ( = ?auto_210111 ?auto_210114 ) ) ( not ( = ?auto_210111 ?auto_210115 ) ) ( not ( = ?auto_210111 ?auto_210117 ) ) ( not ( = ?auto_210112 ?auto_210113 ) ) ( not ( = ?auto_210112 ?auto_210114 ) ) ( not ( = ?auto_210112 ?auto_210115 ) ) ( not ( = ?auto_210112 ?auto_210117 ) ) ( not ( = ?auto_210113 ?auto_210114 ) ) ( not ( = ?auto_210113 ?auto_210115 ) ) ( not ( = ?auto_210113 ?auto_210117 ) ) ( not ( = ?auto_210114 ?auto_210115 ) ) ( not ( = ?auto_210114 ?auto_210117 ) ) ( not ( = ?auto_210115 ?auto_210117 ) ) ( ON ?auto_210117 ?auto_210116 ) ( not ( = ?auto_210109 ?auto_210116 ) ) ( not ( = ?auto_210110 ?auto_210116 ) ) ( not ( = ?auto_210111 ?auto_210116 ) ) ( not ( = ?auto_210112 ?auto_210116 ) ) ( not ( = ?auto_210113 ?auto_210116 ) ) ( not ( = ?auto_210114 ?auto_210116 ) ) ( not ( = ?auto_210115 ?auto_210116 ) ) ( not ( = ?auto_210117 ?auto_210116 ) ) ( ON ?auto_210115 ?auto_210117 ) ( ON-TABLE ?auto_210116 ) ( ON ?auto_210114 ?auto_210115 ) ( ON ?auto_210113 ?auto_210114 ) ( CLEAR ?auto_210113 ) ( HOLDING ?auto_210112 ) ( CLEAR ?auto_210111 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210109 ?auto_210110 ?auto_210111 ?auto_210112 )
      ( MAKE-7PILE ?auto_210109 ?auto_210110 ?auto_210111 ?auto_210112 ?auto_210113 ?auto_210114 ?auto_210115 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210118 - BLOCK
      ?auto_210119 - BLOCK
      ?auto_210120 - BLOCK
      ?auto_210121 - BLOCK
      ?auto_210122 - BLOCK
      ?auto_210123 - BLOCK
      ?auto_210124 - BLOCK
    )
    :vars
    (
      ?auto_210125 - BLOCK
      ?auto_210126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210118 ) ( ON ?auto_210119 ?auto_210118 ) ( ON ?auto_210120 ?auto_210119 ) ( not ( = ?auto_210118 ?auto_210119 ) ) ( not ( = ?auto_210118 ?auto_210120 ) ) ( not ( = ?auto_210118 ?auto_210121 ) ) ( not ( = ?auto_210118 ?auto_210122 ) ) ( not ( = ?auto_210118 ?auto_210123 ) ) ( not ( = ?auto_210118 ?auto_210124 ) ) ( not ( = ?auto_210118 ?auto_210125 ) ) ( not ( = ?auto_210119 ?auto_210120 ) ) ( not ( = ?auto_210119 ?auto_210121 ) ) ( not ( = ?auto_210119 ?auto_210122 ) ) ( not ( = ?auto_210119 ?auto_210123 ) ) ( not ( = ?auto_210119 ?auto_210124 ) ) ( not ( = ?auto_210119 ?auto_210125 ) ) ( not ( = ?auto_210120 ?auto_210121 ) ) ( not ( = ?auto_210120 ?auto_210122 ) ) ( not ( = ?auto_210120 ?auto_210123 ) ) ( not ( = ?auto_210120 ?auto_210124 ) ) ( not ( = ?auto_210120 ?auto_210125 ) ) ( not ( = ?auto_210121 ?auto_210122 ) ) ( not ( = ?auto_210121 ?auto_210123 ) ) ( not ( = ?auto_210121 ?auto_210124 ) ) ( not ( = ?auto_210121 ?auto_210125 ) ) ( not ( = ?auto_210122 ?auto_210123 ) ) ( not ( = ?auto_210122 ?auto_210124 ) ) ( not ( = ?auto_210122 ?auto_210125 ) ) ( not ( = ?auto_210123 ?auto_210124 ) ) ( not ( = ?auto_210123 ?auto_210125 ) ) ( not ( = ?auto_210124 ?auto_210125 ) ) ( ON ?auto_210125 ?auto_210126 ) ( not ( = ?auto_210118 ?auto_210126 ) ) ( not ( = ?auto_210119 ?auto_210126 ) ) ( not ( = ?auto_210120 ?auto_210126 ) ) ( not ( = ?auto_210121 ?auto_210126 ) ) ( not ( = ?auto_210122 ?auto_210126 ) ) ( not ( = ?auto_210123 ?auto_210126 ) ) ( not ( = ?auto_210124 ?auto_210126 ) ) ( not ( = ?auto_210125 ?auto_210126 ) ) ( ON ?auto_210124 ?auto_210125 ) ( ON-TABLE ?auto_210126 ) ( ON ?auto_210123 ?auto_210124 ) ( ON ?auto_210122 ?auto_210123 ) ( CLEAR ?auto_210120 ) ( ON ?auto_210121 ?auto_210122 ) ( CLEAR ?auto_210121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210126 ?auto_210125 ?auto_210124 ?auto_210123 ?auto_210122 )
      ( MAKE-7PILE ?auto_210118 ?auto_210119 ?auto_210120 ?auto_210121 ?auto_210122 ?auto_210123 ?auto_210124 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210127 - BLOCK
      ?auto_210128 - BLOCK
      ?auto_210129 - BLOCK
      ?auto_210130 - BLOCK
      ?auto_210131 - BLOCK
      ?auto_210132 - BLOCK
      ?auto_210133 - BLOCK
    )
    :vars
    (
      ?auto_210134 - BLOCK
      ?auto_210135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210127 ) ( ON ?auto_210128 ?auto_210127 ) ( not ( = ?auto_210127 ?auto_210128 ) ) ( not ( = ?auto_210127 ?auto_210129 ) ) ( not ( = ?auto_210127 ?auto_210130 ) ) ( not ( = ?auto_210127 ?auto_210131 ) ) ( not ( = ?auto_210127 ?auto_210132 ) ) ( not ( = ?auto_210127 ?auto_210133 ) ) ( not ( = ?auto_210127 ?auto_210134 ) ) ( not ( = ?auto_210128 ?auto_210129 ) ) ( not ( = ?auto_210128 ?auto_210130 ) ) ( not ( = ?auto_210128 ?auto_210131 ) ) ( not ( = ?auto_210128 ?auto_210132 ) ) ( not ( = ?auto_210128 ?auto_210133 ) ) ( not ( = ?auto_210128 ?auto_210134 ) ) ( not ( = ?auto_210129 ?auto_210130 ) ) ( not ( = ?auto_210129 ?auto_210131 ) ) ( not ( = ?auto_210129 ?auto_210132 ) ) ( not ( = ?auto_210129 ?auto_210133 ) ) ( not ( = ?auto_210129 ?auto_210134 ) ) ( not ( = ?auto_210130 ?auto_210131 ) ) ( not ( = ?auto_210130 ?auto_210132 ) ) ( not ( = ?auto_210130 ?auto_210133 ) ) ( not ( = ?auto_210130 ?auto_210134 ) ) ( not ( = ?auto_210131 ?auto_210132 ) ) ( not ( = ?auto_210131 ?auto_210133 ) ) ( not ( = ?auto_210131 ?auto_210134 ) ) ( not ( = ?auto_210132 ?auto_210133 ) ) ( not ( = ?auto_210132 ?auto_210134 ) ) ( not ( = ?auto_210133 ?auto_210134 ) ) ( ON ?auto_210134 ?auto_210135 ) ( not ( = ?auto_210127 ?auto_210135 ) ) ( not ( = ?auto_210128 ?auto_210135 ) ) ( not ( = ?auto_210129 ?auto_210135 ) ) ( not ( = ?auto_210130 ?auto_210135 ) ) ( not ( = ?auto_210131 ?auto_210135 ) ) ( not ( = ?auto_210132 ?auto_210135 ) ) ( not ( = ?auto_210133 ?auto_210135 ) ) ( not ( = ?auto_210134 ?auto_210135 ) ) ( ON ?auto_210133 ?auto_210134 ) ( ON-TABLE ?auto_210135 ) ( ON ?auto_210132 ?auto_210133 ) ( ON ?auto_210131 ?auto_210132 ) ( ON ?auto_210130 ?auto_210131 ) ( CLEAR ?auto_210130 ) ( HOLDING ?auto_210129 ) ( CLEAR ?auto_210128 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210127 ?auto_210128 ?auto_210129 )
      ( MAKE-7PILE ?auto_210127 ?auto_210128 ?auto_210129 ?auto_210130 ?auto_210131 ?auto_210132 ?auto_210133 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210136 - BLOCK
      ?auto_210137 - BLOCK
      ?auto_210138 - BLOCK
      ?auto_210139 - BLOCK
      ?auto_210140 - BLOCK
      ?auto_210141 - BLOCK
      ?auto_210142 - BLOCK
    )
    :vars
    (
      ?auto_210143 - BLOCK
      ?auto_210144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210136 ) ( ON ?auto_210137 ?auto_210136 ) ( not ( = ?auto_210136 ?auto_210137 ) ) ( not ( = ?auto_210136 ?auto_210138 ) ) ( not ( = ?auto_210136 ?auto_210139 ) ) ( not ( = ?auto_210136 ?auto_210140 ) ) ( not ( = ?auto_210136 ?auto_210141 ) ) ( not ( = ?auto_210136 ?auto_210142 ) ) ( not ( = ?auto_210136 ?auto_210143 ) ) ( not ( = ?auto_210137 ?auto_210138 ) ) ( not ( = ?auto_210137 ?auto_210139 ) ) ( not ( = ?auto_210137 ?auto_210140 ) ) ( not ( = ?auto_210137 ?auto_210141 ) ) ( not ( = ?auto_210137 ?auto_210142 ) ) ( not ( = ?auto_210137 ?auto_210143 ) ) ( not ( = ?auto_210138 ?auto_210139 ) ) ( not ( = ?auto_210138 ?auto_210140 ) ) ( not ( = ?auto_210138 ?auto_210141 ) ) ( not ( = ?auto_210138 ?auto_210142 ) ) ( not ( = ?auto_210138 ?auto_210143 ) ) ( not ( = ?auto_210139 ?auto_210140 ) ) ( not ( = ?auto_210139 ?auto_210141 ) ) ( not ( = ?auto_210139 ?auto_210142 ) ) ( not ( = ?auto_210139 ?auto_210143 ) ) ( not ( = ?auto_210140 ?auto_210141 ) ) ( not ( = ?auto_210140 ?auto_210142 ) ) ( not ( = ?auto_210140 ?auto_210143 ) ) ( not ( = ?auto_210141 ?auto_210142 ) ) ( not ( = ?auto_210141 ?auto_210143 ) ) ( not ( = ?auto_210142 ?auto_210143 ) ) ( ON ?auto_210143 ?auto_210144 ) ( not ( = ?auto_210136 ?auto_210144 ) ) ( not ( = ?auto_210137 ?auto_210144 ) ) ( not ( = ?auto_210138 ?auto_210144 ) ) ( not ( = ?auto_210139 ?auto_210144 ) ) ( not ( = ?auto_210140 ?auto_210144 ) ) ( not ( = ?auto_210141 ?auto_210144 ) ) ( not ( = ?auto_210142 ?auto_210144 ) ) ( not ( = ?auto_210143 ?auto_210144 ) ) ( ON ?auto_210142 ?auto_210143 ) ( ON-TABLE ?auto_210144 ) ( ON ?auto_210141 ?auto_210142 ) ( ON ?auto_210140 ?auto_210141 ) ( ON ?auto_210139 ?auto_210140 ) ( CLEAR ?auto_210137 ) ( ON ?auto_210138 ?auto_210139 ) ( CLEAR ?auto_210138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210144 ?auto_210143 ?auto_210142 ?auto_210141 ?auto_210140 ?auto_210139 )
      ( MAKE-7PILE ?auto_210136 ?auto_210137 ?auto_210138 ?auto_210139 ?auto_210140 ?auto_210141 ?auto_210142 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210145 - BLOCK
      ?auto_210146 - BLOCK
      ?auto_210147 - BLOCK
      ?auto_210148 - BLOCK
      ?auto_210149 - BLOCK
      ?auto_210150 - BLOCK
      ?auto_210151 - BLOCK
    )
    :vars
    (
      ?auto_210152 - BLOCK
      ?auto_210153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210145 ) ( not ( = ?auto_210145 ?auto_210146 ) ) ( not ( = ?auto_210145 ?auto_210147 ) ) ( not ( = ?auto_210145 ?auto_210148 ) ) ( not ( = ?auto_210145 ?auto_210149 ) ) ( not ( = ?auto_210145 ?auto_210150 ) ) ( not ( = ?auto_210145 ?auto_210151 ) ) ( not ( = ?auto_210145 ?auto_210152 ) ) ( not ( = ?auto_210146 ?auto_210147 ) ) ( not ( = ?auto_210146 ?auto_210148 ) ) ( not ( = ?auto_210146 ?auto_210149 ) ) ( not ( = ?auto_210146 ?auto_210150 ) ) ( not ( = ?auto_210146 ?auto_210151 ) ) ( not ( = ?auto_210146 ?auto_210152 ) ) ( not ( = ?auto_210147 ?auto_210148 ) ) ( not ( = ?auto_210147 ?auto_210149 ) ) ( not ( = ?auto_210147 ?auto_210150 ) ) ( not ( = ?auto_210147 ?auto_210151 ) ) ( not ( = ?auto_210147 ?auto_210152 ) ) ( not ( = ?auto_210148 ?auto_210149 ) ) ( not ( = ?auto_210148 ?auto_210150 ) ) ( not ( = ?auto_210148 ?auto_210151 ) ) ( not ( = ?auto_210148 ?auto_210152 ) ) ( not ( = ?auto_210149 ?auto_210150 ) ) ( not ( = ?auto_210149 ?auto_210151 ) ) ( not ( = ?auto_210149 ?auto_210152 ) ) ( not ( = ?auto_210150 ?auto_210151 ) ) ( not ( = ?auto_210150 ?auto_210152 ) ) ( not ( = ?auto_210151 ?auto_210152 ) ) ( ON ?auto_210152 ?auto_210153 ) ( not ( = ?auto_210145 ?auto_210153 ) ) ( not ( = ?auto_210146 ?auto_210153 ) ) ( not ( = ?auto_210147 ?auto_210153 ) ) ( not ( = ?auto_210148 ?auto_210153 ) ) ( not ( = ?auto_210149 ?auto_210153 ) ) ( not ( = ?auto_210150 ?auto_210153 ) ) ( not ( = ?auto_210151 ?auto_210153 ) ) ( not ( = ?auto_210152 ?auto_210153 ) ) ( ON ?auto_210151 ?auto_210152 ) ( ON-TABLE ?auto_210153 ) ( ON ?auto_210150 ?auto_210151 ) ( ON ?auto_210149 ?auto_210150 ) ( ON ?auto_210148 ?auto_210149 ) ( ON ?auto_210147 ?auto_210148 ) ( CLEAR ?auto_210147 ) ( HOLDING ?auto_210146 ) ( CLEAR ?auto_210145 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210145 ?auto_210146 )
      ( MAKE-7PILE ?auto_210145 ?auto_210146 ?auto_210147 ?auto_210148 ?auto_210149 ?auto_210150 ?auto_210151 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210154 - BLOCK
      ?auto_210155 - BLOCK
      ?auto_210156 - BLOCK
      ?auto_210157 - BLOCK
      ?auto_210158 - BLOCK
      ?auto_210159 - BLOCK
      ?auto_210160 - BLOCK
    )
    :vars
    (
      ?auto_210162 - BLOCK
      ?auto_210161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210154 ) ( not ( = ?auto_210154 ?auto_210155 ) ) ( not ( = ?auto_210154 ?auto_210156 ) ) ( not ( = ?auto_210154 ?auto_210157 ) ) ( not ( = ?auto_210154 ?auto_210158 ) ) ( not ( = ?auto_210154 ?auto_210159 ) ) ( not ( = ?auto_210154 ?auto_210160 ) ) ( not ( = ?auto_210154 ?auto_210162 ) ) ( not ( = ?auto_210155 ?auto_210156 ) ) ( not ( = ?auto_210155 ?auto_210157 ) ) ( not ( = ?auto_210155 ?auto_210158 ) ) ( not ( = ?auto_210155 ?auto_210159 ) ) ( not ( = ?auto_210155 ?auto_210160 ) ) ( not ( = ?auto_210155 ?auto_210162 ) ) ( not ( = ?auto_210156 ?auto_210157 ) ) ( not ( = ?auto_210156 ?auto_210158 ) ) ( not ( = ?auto_210156 ?auto_210159 ) ) ( not ( = ?auto_210156 ?auto_210160 ) ) ( not ( = ?auto_210156 ?auto_210162 ) ) ( not ( = ?auto_210157 ?auto_210158 ) ) ( not ( = ?auto_210157 ?auto_210159 ) ) ( not ( = ?auto_210157 ?auto_210160 ) ) ( not ( = ?auto_210157 ?auto_210162 ) ) ( not ( = ?auto_210158 ?auto_210159 ) ) ( not ( = ?auto_210158 ?auto_210160 ) ) ( not ( = ?auto_210158 ?auto_210162 ) ) ( not ( = ?auto_210159 ?auto_210160 ) ) ( not ( = ?auto_210159 ?auto_210162 ) ) ( not ( = ?auto_210160 ?auto_210162 ) ) ( ON ?auto_210162 ?auto_210161 ) ( not ( = ?auto_210154 ?auto_210161 ) ) ( not ( = ?auto_210155 ?auto_210161 ) ) ( not ( = ?auto_210156 ?auto_210161 ) ) ( not ( = ?auto_210157 ?auto_210161 ) ) ( not ( = ?auto_210158 ?auto_210161 ) ) ( not ( = ?auto_210159 ?auto_210161 ) ) ( not ( = ?auto_210160 ?auto_210161 ) ) ( not ( = ?auto_210162 ?auto_210161 ) ) ( ON ?auto_210160 ?auto_210162 ) ( ON-TABLE ?auto_210161 ) ( ON ?auto_210159 ?auto_210160 ) ( ON ?auto_210158 ?auto_210159 ) ( ON ?auto_210157 ?auto_210158 ) ( ON ?auto_210156 ?auto_210157 ) ( CLEAR ?auto_210154 ) ( ON ?auto_210155 ?auto_210156 ) ( CLEAR ?auto_210155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210161 ?auto_210162 ?auto_210160 ?auto_210159 ?auto_210158 ?auto_210157 ?auto_210156 )
      ( MAKE-7PILE ?auto_210154 ?auto_210155 ?auto_210156 ?auto_210157 ?auto_210158 ?auto_210159 ?auto_210160 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210163 - BLOCK
      ?auto_210164 - BLOCK
      ?auto_210165 - BLOCK
      ?auto_210166 - BLOCK
      ?auto_210167 - BLOCK
      ?auto_210168 - BLOCK
      ?auto_210169 - BLOCK
    )
    :vars
    (
      ?auto_210170 - BLOCK
      ?auto_210171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210163 ?auto_210164 ) ) ( not ( = ?auto_210163 ?auto_210165 ) ) ( not ( = ?auto_210163 ?auto_210166 ) ) ( not ( = ?auto_210163 ?auto_210167 ) ) ( not ( = ?auto_210163 ?auto_210168 ) ) ( not ( = ?auto_210163 ?auto_210169 ) ) ( not ( = ?auto_210163 ?auto_210170 ) ) ( not ( = ?auto_210164 ?auto_210165 ) ) ( not ( = ?auto_210164 ?auto_210166 ) ) ( not ( = ?auto_210164 ?auto_210167 ) ) ( not ( = ?auto_210164 ?auto_210168 ) ) ( not ( = ?auto_210164 ?auto_210169 ) ) ( not ( = ?auto_210164 ?auto_210170 ) ) ( not ( = ?auto_210165 ?auto_210166 ) ) ( not ( = ?auto_210165 ?auto_210167 ) ) ( not ( = ?auto_210165 ?auto_210168 ) ) ( not ( = ?auto_210165 ?auto_210169 ) ) ( not ( = ?auto_210165 ?auto_210170 ) ) ( not ( = ?auto_210166 ?auto_210167 ) ) ( not ( = ?auto_210166 ?auto_210168 ) ) ( not ( = ?auto_210166 ?auto_210169 ) ) ( not ( = ?auto_210166 ?auto_210170 ) ) ( not ( = ?auto_210167 ?auto_210168 ) ) ( not ( = ?auto_210167 ?auto_210169 ) ) ( not ( = ?auto_210167 ?auto_210170 ) ) ( not ( = ?auto_210168 ?auto_210169 ) ) ( not ( = ?auto_210168 ?auto_210170 ) ) ( not ( = ?auto_210169 ?auto_210170 ) ) ( ON ?auto_210170 ?auto_210171 ) ( not ( = ?auto_210163 ?auto_210171 ) ) ( not ( = ?auto_210164 ?auto_210171 ) ) ( not ( = ?auto_210165 ?auto_210171 ) ) ( not ( = ?auto_210166 ?auto_210171 ) ) ( not ( = ?auto_210167 ?auto_210171 ) ) ( not ( = ?auto_210168 ?auto_210171 ) ) ( not ( = ?auto_210169 ?auto_210171 ) ) ( not ( = ?auto_210170 ?auto_210171 ) ) ( ON ?auto_210169 ?auto_210170 ) ( ON-TABLE ?auto_210171 ) ( ON ?auto_210168 ?auto_210169 ) ( ON ?auto_210167 ?auto_210168 ) ( ON ?auto_210166 ?auto_210167 ) ( ON ?auto_210165 ?auto_210166 ) ( ON ?auto_210164 ?auto_210165 ) ( CLEAR ?auto_210164 ) ( HOLDING ?auto_210163 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_210163 )
      ( MAKE-7PILE ?auto_210163 ?auto_210164 ?auto_210165 ?auto_210166 ?auto_210167 ?auto_210168 ?auto_210169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_210172 - BLOCK
      ?auto_210173 - BLOCK
      ?auto_210174 - BLOCK
      ?auto_210175 - BLOCK
      ?auto_210176 - BLOCK
      ?auto_210177 - BLOCK
      ?auto_210178 - BLOCK
    )
    :vars
    (
      ?auto_210180 - BLOCK
      ?auto_210179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210172 ?auto_210173 ) ) ( not ( = ?auto_210172 ?auto_210174 ) ) ( not ( = ?auto_210172 ?auto_210175 ) ) ( not ( = ?auto_210172 ?auto_210176 ) ) ( not ( = ?auto_210172 ?auto_210177 ) ) ( not ( = ?auto_210172 ?auto_210178 ) ) ( not ( = ?auto_210172 ?auto_210180 ) ) ( not ( = ?auto_210173 ?auto_210174 ) ) ( not ( = ?auto_210173 ?auto_210175 ) ) ( not ( = ?auto_210173 ?auto_210176 ) ) ( not ( = ?auto_210173 ?auto_210177 ) ) ( not ( = ?auto_210173 ?auto_210178 ) ) ( not ( = ?auto_210173 ?auto_210180 ) ) ( not ( = ?auto_210174 ?auto_210175 ) ) ( not ( = ?auto_210174 ?auto_210176 ) ) ( not ( = ?auto_210174 ?auto_210177 ) ) ( not ( = ?auto_210174 ?auto_210178 ) ) ( not ( = ?auto_210174 ?auto_210180 ) ) ( not ( = ?auto_210175 ?auto_210176 ) ) ( not ( = ?auto_210175 ?auto_210177 ) ) ( not ( = ?auto_210175 ?auto_210178 ) ) ( not ( = ?auto_210175 ?auto_210180 ) ) ( not ( = ?auto_210176 ?auto_210177 ) ) ( not ( = ?auto_210176 ?auto_210178 ) ) ( not ( = ?auto_210176 ?auto_210180 ) ) ( not ( = ?auto_210177 ?auto_210178 ) ) ( not ( = ?auto_210177 ?auto_210180 ) ) ( not ( = ?auto_210178 ?auto_210180 ) ) ( ON ?auto_210180 ?auto_210179 ) ( not ( = ?auto_210172 ?auto_210179 ) ) ( not ( = ?auto_210173 ?auto_210179 ) ) ( not ( = ?auto_210174 ?auto_210179 ) ) ( not ( = ?auto_210175 ?auto_210179 ) ) ( not ( = ?auto_210176 ?auto_210179 ) ) ( not ( = ?auto_210177 ?auto_210179 ) ) ( not ( = ?auto_210178 ?auto_210179 ) ) ( not ( = ?auto_210180 ?auto_210179 ) ) ( ON ?auto_210178 ?auto_210180 ) ( ON-TABLE ?auto_210179 ) ( ON ?auto_210177 ?auto_210178 ) ( ON ?auto_210176 ?auto_210177 ) ( ON ?auto_210175 ?auto_210176 ) ( ON ?auto_210174 ?auto_210175 ) ( ON ?auto_210173 ?auto_210174 ) ( ON ?auto_210172 ?auto_210173 ) ( CLEAR ?auto_210172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210179 ?auto_210180 ?auto_210178 ?auto_210177 ?auto_210176 ?auto_210175 ?auto_210174 ?auto_210173 )
      ( MAKE-7PILE ?auto_210172 ?auto_210173 ?auto_210174 ?auto_210175 ?auto_210176 ?auto_210177 ?auto_210178 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210182 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_210182 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_210182 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210183 - BLOCK
    )
    :vars
    (
      ?auto_210184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210183 ?auto_210184 ) ( CLEAR ?auto_210183 ) ( HAND-EMPTY ) ( not ( = ?auto_210183 ?auto_210184 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210183 ?auto_210184 )
      ( MAKE-1PILE ?auto_210183 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210185 - BLOCK
    )
    :vars
    (
      ?auto_210186 - BLOCK
      ?auto_210188 - BLOCK
      ?auto_210187 - BLOCK
      ?auto_210189 - BLOCK
      ?auto_210190 - BLOCK
      ?auto_210192 - BLOCK
      ?auto_210191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210185 ?auto_210186 ) ) ( HOLDING ?auto_210185 ) ( CLEAR ?auto_210186 ) ( ON-TABLE ?auto_210188 ) ( ON ?auto_210187 ?auto_210188 ) ( ON ?auto_210189 ?auto_210187 ) ( ON ?auto_210190 ?auto_210189 ) ( ON ?auto_210192 ?auto_210190 ) ( ON ?auto_210191 ?auto_210192 ) ( ON ?auto_210186 ?auto_210191 ) ( not ( = ?auto_210188 ?auto_210187 ) ) ( not ( = ?auto_210188 ?auto_210189 ) ) ( not ( = ?auto_210188 ?auto_210190 ) ) ( not ( = ?auto_210188 ?auto_210192 ) ) ( not ( = ?auto_210188 ?auto_210191 ) ) ( not ( = ?auto_210188 ?auto_210186 ) ) ( not ( = ?auto_210188 ?auto_210185 ) ) ( not ( = ?auto_210187 ?auto_210189 ) ) ( not ( = ?auto_210187 ?auto_210190 ) ) ( not ( = ?auto_210187 ?auto_210192 ) ) ( not ( = ?auto_210187 ?auto_210191 ) ) ( not ( = ?auto_210187 ?auto_210186 ) ) ( not ( = ?auto_210187 ?auto_210185 ) ) ( not ( = ?auto_210189 ?auto_210190 ) ) ( not ( = ?auto_210189 ?auto_210192 ) ) ( not ( = ?auto_210189 ?auto_210191 ) ) ( not ( = ?auto_210189 ?auto_210186 ) ) ( not ( = ?auto_210189 ?auto_210185 ) ) ( not ( = ?auto_210190 ?auto_210192 ) ) ( not ( = ?auto_210190 ?auto_210191 ) ) ( not ( = ?auto_210190 ?auto_210186 ) ) ( not ( = ?auto_210190 ?auto_210185 ) ) ( not ( = ?auto_210192 ?auto_210191 ) ) ( not ( = ?auto_210192 ?auto_210186 ) ) ( not ( = ?auto_210192 ?auto_210185 ) ) ( not ( = ?auto_210191 ?auto_210186 ) ) ( not ( = ?auto_210191 ?auto_210185 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210188 ?auto_210187 ?auto_210189 ?auto_210190 ?auto_210192 ?auto_210191 ?auto_210186 ?auto_210185 )
      ( MAKE-1PILE ?auto_210185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210193 - BLOCK
    )
    :vars
    (
      ?auto_210199 - BLOCK
      ?auto_210197 - BLOCK
      ?auto_210195 - BLOCK
      ?auto_210194 - BLOCK
      ?auto_210200 - BLOCK
      ?auto_210196 - BLOCK
      ?auto_210198 - BLOCK
      ?auto_210201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210193 ?auto_210199 ) ) ( CLEAR ?auto_210199 ) ( ON-TABLE ?auto_210197 ) ( ON ?auto_210195 ?auto_210197 ) ( ON ?auto_210194 ?auto_210195 ) ( ON ?auto_210200 ?auto_210194 ) ( ON ?auto_210196 ?auto_210200 ) ( ON ?auto_210198 ?auto_210196 ) ( ON ?auto_210199 ?auto_210198 ) ( not ( = ?auto_210197 ?auto_210195 ) ) ( not ( = ?auto_210197 ?auto_210194 ) ) ( not ( = ?auto_210197 ?auto_210200 ) ) ( not ( = ?auto_210197 ?auto_210196 ) ) ( not ( = ?auto_210197 ?auto_210198 ) ) ( not ( = ?auto_210197 ?auto_210199 ) ) ( not ( = ?auto_210197 ?auto_210193 ) ) ( not ( = ?auto_210195 ?auto_210194 ) ) ( not ( = ?auto_210195 ?auto_210200 ) ) ( not ( = ?auto_210195 ?auto_210196 ) ) ( not ( = ?auto_210195 ?auto_210198 ) ) ( not ( = ?auto_210195 ?auto_210199 ) ) ( not ( = ?auto_210195 ?auto_210193 ) ) ( not ( = ?auto_210194 ?auto_210200 ) ) ( not ( = ?auto_210194 ?auto_210196 ) ) ( not ( = ?auto_210194 ?auto_210198 ) ) ( not ( = ?auto_210194 ?auto_210199 ) ) ( not ( = ?auto_210194 ?auto_210193 ) ) ( not ( = ?auto_210200 ?auto_210196 ) ) ( not ( = ?auto_210200 ?auto_210198 ) ) ( not ( = ?auto_210200 ?auto_210199 ) ) ( not ( = ?auto_210200 ?auto_210193 ) ) ( not ( = ?auto_210196 ?auto_210198 ) ) ( not ( = ?auto_210196 ?auto_210199 ) ) ( not ( = ?auto_210196 ?auto_210193 ) ) ( not ( = ?auto_210198 ?auto_210199 ) ) ( not ( = ?auto_210198 ?auto_210193 ) ) ( ON ?auto_210193 ?auto_210201 ) ( CLEAR ?auto_210193 ) ( HAND-EMPTY ) ( not ( = ?auto_210193 ?auto_210201 ) ) ( not ( = ?auto_210199 ?auto_210201 ) ) ( not ( = ?auto_210197 ?auto_210201 ) ) ( not ( = ?auto_210195 ?auto_210201 ) ) ( not ( = ?auto_210194 ?auto_210201 ) ) ( not ( = ?auto_210200 ?auto_210201 ) ) ( not ( = ?auto_210196 ?auto_210201 ) ) ( not ( = ?auto_210198 ?auto_210201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210193 ?auto_210201 )
      ( MAKE-1PILE ?auto_210193 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210202 - BLOCK
    )
    :vars
    (
      ?auto_210210 - BLOCK
      ?auto_210205 - BLOCK
      ?auto_210204 - BLOCK
      ?auto_210206 - BLOCK
      ?auto_210207 - BLOCK
      ?auto_210203 - BLOCK
      ?auto_210208 - BLOCK
      ?auto_210209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210202 ?auto_210210 ) ) ( ON-TABLE ?auto_210205 ) ( ON ?auto_210204 ?auto_210205 ) ( ON ?auto_210206 ?auto_210204 ) ( ON ?auto_210207 ?auto_210206 ) ( ON ?auto_210203 ?auto_210207 ) ( ON ?auto_210208 ?auto_210203 ) ( not ( = ?auto_210205 ?auto_210204 ) ) ( not ( = ?auto_210205 ?auto_210206 ) ) ( not ( = ?auto_210205 ?auto_210207 ) ) ( not ( = ?auto_210205 ?auto_210203 ) ) ( not ( = ?auto_210205 ?auto_210208 ) ) ( not ( = ?auto_210205 ?auto_210210 ) ) ( not ( = ?auto_210205 ?auto_210202 ) ) ( not ( = ?auto_210204 ?auto_210206 ) ) ( not ( = ?auto_210204 ?auto_210207 ) ) ( not ( = ?auto_210204 ?auto_210203 ) ) ( not ( = ?auto_210204 ?auto_210208 ) ) ( not ( = ?auto_210204 ?auto_210210 ) ) ( not ( = ?auto_210204 ?auto_210202 ) ) ( not ( = ?auto_210206 ?auto_210207 ) ) ( not ( = ?auto_210206 ?auto_210203 ) ) ( not ( = ?auto_210206 ?auto_210208 ) ) ( not ( = ?auto_210206 ?auto_210210 ) ) ( not ( = ?auto_210206 ?auto_210202 ) ) ( not ( = ?auto_210207 ?auto_210203 ) ) ( not ( = ?auto_210207 ?auto_210208 ) ) ( not ( = ?auto_210207 ?auto_210210 ) ) ( not ( = ?auto_210207 ?auto_210202 ) ) ( not ( = ?auto_210203 ?auto_210208 ) ) ( not ( = ?auto_210203 ?auto_210210 ) ) ( not ( = ?auto_210203 ?auto_210202 ) ) ( not ( = ?auto_210208 ?auto_210210 ) ) ( not ( = ?auto_210208 ?auto_210202 ) ) ( ON ?auto_210202 ?auto_210209 ) ( CLEAR ?auto_210202 ) ( not ( = ?auto_210202 ?auto_210209 ) ) ( not ( = ?auto_210210 ?auto_210209 ) ) ( not ( = ?auto_210205 ?auto_210209 ) ) ( not ( = ?auto_210204 ?auto_210209 ) ) ( not ( = ?auto_210206 ?auto_210209 ) ) ( not ( = ?auto_210207 ?auto_210209 ) ) ( not ( = ?auto_210203 ?auto_210209 ) ) ( not ( = ?auto_210208 ?auto_210209 ) ) ( HOLDING ?auto_210210 ) ( CLEAR ?auto_210208 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210205 ?auto_210204 ?auto_210206 ?auto_210207 ?auto_210203 ?auto_210208 ?auto_210210 )
      ( MAKE-1PILE ?auto_210202 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210211 - BLOCK
    )
    :vars
    (
      ?auto_210213 - BLOCK
      ?auto_210212 - BLOCK
      ?auto_210218 - BLOCK
      ?auto_210217 - BLOCK
      ?auto_210214 - BLOCK
      ?auto_210215 - BLOCK
      ?auto_210219 - BLOCK
      ?auto_210216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210211 ?auto_210213 ) ) ( ON-TABLE ?auto_210212 ) ( ON ?auto_210218 ?auto_210212 ) ( ON ?auto_210217 ?auto_210218 ) ( ON ?auto_210214 ?auto_210217 ) ( ON ?auto_210215 ?auto_210214 ) ( ON ?auto_210219 ?auto_210215 ) ( not ( = ?auto_210212 ?auto_210218 ) ) ( not ( = ?auto_210212 ?auto_210217 ) ) ( not ( = ?auto_210212 ?auto_210214 ) ) ( not ( = ?auto_210212 ?auto_210215 ) ) ( not ( = ?auto_210212 ?auto_210219 ) ) ( not ( = ?auto_210212 ?auto_210213 ) ) ( not ( = ?auto_210212 ?auto_210211 ) ) ( not ( = ?auto_210218 ?auto_210217 ) ) ( not ( = ?auto_210218 ?auto_210214 ) ) ( not ( = ?auto_210218 ?auto_210215 ) ) ( not ( = ?auto_210218 ?auto_210219 ) ) ( not ( = ?auto_210218 ?auto_210213 ) ) ( not ( = ?auto_210218 ?auto_210211 ) ) ( not ( = ?auto_210217 ?auto_210214 ) ) ( not ( = ?auto_210217 ?auto_210215 ) ) ( not ( = ?auto_210217 ?auto_210219 ) ) ( not ( = ?auto_210217 ?auto_210213 ) ) ( not ( = ?auto_210217 ?auto_210211 ) ) ( not ( = ?auto_210214 ?auto_210215 ) ) ( not ( = ?auto_210214 ?auto_210219 ) ) ( not ( = ?auto_210214 ?auto_210213 ) ) ( not ( = ?auto_210214 ?auto_210211 ) ) ( not ( = ?auto_210215 ?auto_210219 ) ) ( not ( = ?auto_210215 ?auto_210213 ) ) ( not ( = ?auto_210215 ?auto_210211 ) ) ( not ( = ?auto_210219 ?auto_210213 ) ) ( not ( = ?auto_210219 ?auto_210211 ) ) ( ON ?auto_210211 ?auto_210216 ) ( not ( = ?auto_210211 ?auto_210216 ) ) ( not ( = ?auto_210213 ?auto_210216 ) ) ( not ( = ?auto_210212 ?auto_210216 ) ) ( not ( = ?auto_210218 ?auto_210216 ) ) ( not ( = ?auto_210217 ?auto_210216 ) ) ( not ( = ?auto_210214 ?auto_210216 ) ) ( not ( = ?auto_210215 ?auto_210216 ) ) ( not ( = ?auto_210219 ?auto_210216 ) ) ( CLEAR ?auto_210219 ) ( ON ?auto_210213 ?auto_210211 ) ( CLEAR ?auto_210213 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210216 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210216 ?auto_210211 )
      ( MAKE-1PILE ?auto_210211 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210220 - BLOCK
    )
    :vars
    (
      ?auto_210222 - BLOCK
      ?auto_210228 - BLOCK
      ?auto_210226 - BLOCK
      ?auto_210227 - BLOCK
      ?auto_210223 - BLOCK
      ?auto_210225 - BLOCK
      ?auto_210224 - BLOCK
      ?auto_210221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210220 ?auto_210222 ) ) ( ON-TABLE ?auto_210228 ) ( ON ?auto_210226 ?auto_210228 ) ( ON ?auto_210227 ?auto_210226 ) ( ON ?auto_210223 ?auto_210227 ) ( ON ?auto_210225 ?auto_210223 ) ( not ( = ?auto_210228 ?auto_210226 ) ) ( not ( = ?auto_210228 ?auto_210227 ) ) ( not ( = ?auto_210228 ?auto_210223 ) ) ( not ( = ?auto_210228 ?auto_210225 ) ) ( not ( = ?auto_210228 ?auto_210224 ) ) ( not ( = ?auto_210228 ?auto_210222 ) ) ( not ( = ?auto_210228 ?auto_210220 ) ) ( not ( = ?auto_210226 ?auto_210227 ) ) ( not ( = ?auto_210226 ?auto_210223 ) ) ( not ( = ?auto_210226 ?auto_210225 ) ) ( not ( = ?auto_210226 ?auto_210224 ) ) ( not ( = ?auto_210226 ?auto_210222 ) ) ( not ( = ?auto_210226 ?auto_210220 ) ) ( not ( = ?auto_210227 ?auto_210223 ) ) ( not ( = ?auto_210227 ?auto_210225 ) ) ( not ( = ?auto_210227 ?auto_210224 ) ) ( not ( = ?auto_210227 ?auto_210222 ) ) ( not ( = ?auto_210227 ?auto_210220 ) ) ( not ( = ?auto_210223 ?auto_210225 ) ) ( not ( = ?auto_210223 ?auto_210224 ) ) ( not ( = ?auto_210223 ?auto_210222 ) ) ( not ( = ?auto_210223 ?auto_210220 ) ) ( not ( = ?auto_210225 ?auto_210224 ) ) ( not ( = ?auto_210225 ?auto_210222 ) ) ( not ( = ?auto_210225 ?auto_210220 ) ) ( not ( = ?auto_210224 ?auto_210222 ) ) ( not ( = ?auto_210224 ?auto_210220 ) ) ( ON ?auto_210220 ?auto_210221 ) ( not ( = ?auto_210220 ?auto_210221 ) ) ( not ( = ?auto_210222 ?auto_210221 ) ) ( not ( = ?auto_210228 ?auto_210221 ) ) ( not ( = ?auto_210226 ?auto_210221 ) ) ( not ( = ?auto_210227 ?auto_210221 ) ) ( not ( = ?auto_210223 ?auto_210221 ) ) ( not ( = ?auto_210225 ?auto_210221 ) ) ( not ( = ?auto_210224 ?auto_210221 ) ) ( ON ?auto_210222 ?auto_210220 ) ( CLEAR ?auto_210222 ) ( ON-TABLE ?auto_210221 ) ( HOLDING ?auto_210224 ) ( CLEAR ?auto_210225 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210228 ?auto_210226 ?auto_210227 ?auto_210223 ?auto_210225 ?auto_210224 )
      ( MAKE-1PILE ?auto_210220 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210229 - BLOCK
    )
    :vars
    (
      ?auto_210237 - BLOCK
      ?auto_210232 - BLOCK
      ?auto_210236 - BLOCK
      ?auto_210234 - BLOCK
      ?auto_210235 - BLOCK
      ?auto_210233 - BLOCK
      ?auto_210230 - BLOCK
      ?auto_210231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210229 ?auto_210237 ) ) ( ON-TABLE ?auto_210232 ) ( ON ?auto_210236 ?auto_210232 ) ( ON ?auto_210234 ?auto_210236 ) ( ON ?auto_210235 ?auto_210234 ) ( ON ?auto_210233 ?auto_210235 ) ( not ( = ?auto_210232 ?auto_210236 ) ) ( not ( = ?auto_210232 ?auto_210234 ) ) ( not ( = ?auto_210232 ?auto_210235 ) ) ( not ( = ?auto_210232 ?auto_210233 ) ) ( not ( = ?auto_210232 ?auto_210230 ) ) ( not ( = ?auto_210232 ?auto_210237 ) ) ( not ( = ?auto_210232 ?auto_210229 ) ) ( not ( = ?auto_210236 ?auto_210234 ) ) ( not ( = ?auto_210236 ?auto_210235 ) ) ( not ( = ?auto_210236 ?auto_210233 ) ) ( not ( = ?auto_210236 ?auto_210230 ) ) ( not ( = ?auto_210236 ?auto_210237 ) ) ( not ( = ?auto_210236 ?auto_210229 ) ) ( not ( = ?auto_210234 ?auto_210235 ) ) ( not ( = ?auto_210234 ?auto_210233 ) ) ( not ( = ?auto_210234 ?auto_210230 ) ) ( not ( = ?auto_210234 ?auto_210237 ) ) ( not ( = ?auto_210234 ?auto_210229 ) ) ( not ( = ?auto_210235 ?auto_210233 ) ) ( not ( = ?auto_210235 ?auto_210230 ) ) ( not ( = ?auto_210235 ?auto_210237 ) ) ( not ( = ?auto_210235 ?auto_210229 ) ) ( not ( = ?auto_210233 ?auto_210230 ) ) ( not ( = ?auto_210233 ?auto_210237 ) ) ( not ( = ?auto_210233 ?auto_210229 ) ) ( not ( = ?auto_210230 ?auto_210237 ) ) ( not ( = ?auto_210230 ?auto_210229 ) ) ( ON ?auto_210229 ?auto_210231 ) ( not ( = ?auto_210229 ?auto_210231 ) ) ( not ( = ?auto_210237 ?auto_210231 ) ) ( not ( = ?auto_210232 ?auto_210231 ) ) ( not ( = ?auto_210236 ?auto_210231 ) ) ( not ( = ?auto_210234 ?auto_210231 ) ) ( not ( = ?auto_210235 ?auto_210231 ) ) ( not ( = ?auto_210233 ?auto_210231 ) ) ( not ( = ?auto_210230 ?auto_210231 ) ) ( ON ?auto_210237 ?auto_210229 ) ( ON-TABLE ?auto_210231 ) ( CLEAR ?auto_210233 ) ( ON ?auto_210230 ?auto_210237 ) ( CLEAR ?auto_210230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210231 ?auto_210229 ?auto_210237 )
      ( MAKE-1PILE ?auto_210229 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210238 - BLOCK
    )
    :vars
    (
      ?auto_210241 - BLOCK
      ?auto_210245 - BLOCK
      ?auto_210240 - BLOCK
      ?auto_210239 - BLOCK
      ?auto_210244 - BLOCK
      ?auto_210246 - BLOCK
      ?auto_210242 - BLOCK
      ?auto_210243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210238 ?auto_210241 ) ) ( ON-TABLE ?auto_210245 ) ( ON ?auto_210240 ?auto_210245 ) ( ON ?auto_210239 ?auto_210240 ) ( ON ?auto_210244 ?auto_210239 ) ( not ( = ?auto_210245 ?auto_210240 ) ) ( not ( = ?auto_210245 ?auto_210239 ) ) ( not ( = ?auto_210245 ?auto_210244 ) ) ( not ( = ?auto_210245 ?auto_210246 ) ) ( not ( = ?auto_210245 ?auto_210242 ) ) ( not ( = ?auto_210245 ?auto_210241 ) ) ( not ( = ?auto_210245 ?auto_210238 ) ) ( not ( = ?auto_210240 ?auto_210239 ) ) ( not ( = ?auto_210240 ?auto_210244 ) ) ( not ( = ?auto_210240 ?auto_210246 ) ) ( not ( = ?auto_210240 ?auto_210242 ) ) ( not ( = ?auto_210240 ?auto_210241 ) ) ( not ( = ?auto_210240 ?auto_210238 ) ) ( not ( = ?auto_210239 ?auto_210244 ) ) ( not ( = ?auto_210239 ?auto_210246 ) ) ( not ( = ?auto_210239 ?auto_210242 ) ) ( not ( = ?auto_210239 ?auto_210241 ) ) ( not ( = ?auto_210239 ?auto_210238 ) ) ( not ( = ?auto_210244 ?auto_210246 ) ) ( not ( = ?auto_210244 ?auto_210242 ) ) ( not ( = ?auto_210244 ?auto_210241 ) ) ( not ( = ?auto_210244 ?auto_210238 ) ) ( not ( = ?auto_210246 ?auto_210242 ) ) ( not ( = ?auto_210246 ?auto_210241 ) ) ( not ( = ?auto_210246 ?auto_210238 ) ) ( not ( = ?auto_210242 ?auto_210241 ) ) ( not ( = ?auto_210242 ?auto_210238 ) ) ( ON ?auto_210238 ?auto_210243 ) ( not ( = ?auto_210238 ?auto_210243 ) ) ( not ( = ?auto_210241 ?auto_210243 ) ) ( not ( = ?auto_210245 ?auto_210243 ) ) ( not ( = ?auto_210240 ?auto_210243 ) ) ( not ( = ?auto_210239 ?auto_210243 ) ) ( not ( = ?auto_210244 ?auto_210243 ) ) ( not ( = ?auto_210246 ?auto_210243 ) ) ( not ( = ?auto_210242 ?auto_210243 ) ) ( ON ?auto_210241 ?auto_210238 ) ( ON-TABLE ?auto_210243 ) ( ON ?auto_210242 ?auto_210241 ) ( CLEAR ?auto_210242 ) ( HOLDING ?auto_210246 ) ( CLEAR ?auto_210244 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210245 ?auto_210240 ?auto_210239 ?auto_210244 ?auto_210246 )
      ( MAKE-1PILE ?auto_210238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210247 - BLOCK
    )
    :vars
    (
      ?auto_210252 - BLOCK
      ?auto_210255 - BLOCK
      ?auto_210250 - BLOCK
      ?auto_210249 - BLOCK
      ?auto_210254 - BLOCK
      ?auto_210248 - BLOCK
      ?auto_210251 - BLOCK
      ?auto_210253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210247 ?auto_210252 ) ) ( ON-TABLE ?auto_210255 ) ( ON ?auto_210250 ?auto_210255 ) ( ON ?auto_210249 ?auto_210250 ) ( ON ?auto_210254 ?auto_210249 ) ( not ( = ?auto_210255 ?auto_210250 ) ) ( not ( = ?auto_210255 ?auto_210249 ) ) ( not ( = ?auto_210255 ?auto_210254 ) ) ( not ( = ?auto_210255 ?auto_210248 ) ) ( not ( = ?auto_210255 ?auto_210251 ) ) ( not ( = ?auto_210255 ?auto_210252 ) ) ( not ( = ?auto_210255 ?auto_210247 ) ) ( not ( = ?auto_210250 ?auto_210249 ) ) ( not ( = ?auto_210250 ?auto_210254 ) ) ( not ( = ?auto_210250 ?auto_210248 ) ) ( not ( = ?auto_210250 ?auto_210251 ) ) ( not ( = ?auto_210250 ?auto_210252 ) ) ( not ( = ?auto_210250 ?auto_210247 ) ) ( not ( = ?auto_210249 ?auto_210254 ) ) ( not ( = ?auto_210249 ?auto_210248 ) ) ( not ( = ?auto_210249 ?auto_210251 ) ) ( not ( = ?auto_210249 ?auto_210252 ) ) ( not ( = ?auto_210249 ?auto_210247 ) ) ( not ( = ?auto_210254 ?auto_210248 ) ) ( not ( = ?auto_210254 ?auto_210251 ) ) ( not ( = ?auto_210254 ?auto_210252 ) ) ( not ( = ?auto_210254 ?auto_210247 ) ) ( not ( = ?auto_210248 ?auto_210251 ) ) ( not ( = ?auto_210248 ?auto_210252 ) ) ( not ( = ?auto_210248 ?auto_210247 ) ) ( not ( = ?auto_210251 ?auto_210252 ) ) ( not ( = ?auto_210251 ?auto_210247 ) ) ( ON ?auto_210247 ?auto_210253 ) ( not ( = ?auto_210247 ?auto_210253 ) ) ( not ( = ?auto_210252 ?auto_210253 ) ) ( not ( = ?auto_210255 ?auto_210253 ) ) ( not ( = ?auto_210250 ?auto_210253 ) ) ( not ( = ?auto_210249 ?auto_210253 ) ) ( not ( = ?auto_210254 ?auto_210253 ) ) ( not ( = ?auto_210248 ?auto_210253 ) ) ( not ( = ?auto_210251 ?auto_210253 ) ) ( ON ?auto_210252 ?auto_210247 ) ( ON-TABLE ?auto_210253 ) ( ON ?auto_210251 ?auto_210252 ) ( CLEAR ?auto_210254 ) ( ON ?auto_210248 ?auto_210251 ) ( CLEAR ?auto_210248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210253 ?auto_210247 ?auto_210252 ?auto_210251 )
      ( MAKE-1PILE ?auto_210247 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210256 - BLOCK
    )
    :vars
    (
      ?auto_210262 - BLOCK
      ?auto_210260 - BLOCK
      ?auto_210259 - BLOCK
      ?auto_210258 - BLOCK
      ?auto_210261 - BLOCK
      ?auto_210263 - BLOCK
      ?auto_210264 - BLOCK
      ?auto_210257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210256 ?auto_210262 ) ) ( ON-TABLE ?auto_210260 ) ( ON ?auto_210259 ?auto_210260 ) ( ON ?auto_210258 ?auto_210259 ) ( not ( = ?auto_210260 ?auto_210259 ) ) ( not ( = ?auto_210260 ?auto_210258 ) ) ( not ( = ?auto_210260 ?auto_210261 ) ) ( not ( = ?auto_210260 ?auto_210263 ) ) ( not ( = ?auto_210260 ?auto_210264 ) ) ( not ( = ?auto_210260 ?auto_210262 ) ) ( not ( = ?auto_210260 ?auto_210256 ) ) ( not ( = ?auto_210259 ?auto_210258 ) ) ( not ( = ?auto_210259 ?auto_210261 ) ) ( not ( = ?auto_210259 ?auto_210263 ) ) ( not ( = ?auto_210259 ?auto_210264 ) ) ( not ( = ?auto_210259 ?auto_210262 ) ) ( not ( = ?auto_210259 ?auto_210256 ) ) ( not ( = ?auto_210258 ?auto_210261 ) ) ( not ( = ?auto_210258 ?auto_210263 ) ) ( not ( = ?auto_210258 ?auto_210264 ) ) ( not ( = ?auto_210258 ?auto_210262 ) ) ( not ( = ?auto_210258 ?auto_210256 ) ) ( not ( = ?auto_210261 ?auto_210263 ) ) ( not ( = ?auto_210261 ?auto_210264 ) ) ( not ( = ?auto_210261 ?auto_210262 ) ) ( not ( = ?auto_210261 ?auto_210256 ) ) ( not ( = ?auto_210263 ?auto_210264 ) ) ( not ( = ?auto_210263 ?auto_210262 ) ) ( not ( = ?auto_210263 ?auto_210256 ) ) ( not ( = ?auto_210264 ?auto_210262 ) ) ( not ( = ?auto_210264 ?auto_210256 ) ) ( ON ?auto_210256 ?auto_210257 ) ( not ( = ?auto_210256 ?auto_210257 ) ) ( not ( = ?auto_210262 ?auto_210257 ) ) ( not ( = ?auto_210260 ?auto_210257 ) ) ( not ( = ?auto_210259 ?auto_210257 ) ) ( not ( = ?auto_210258 ?auto_210257 ) ) ( not ( = ?auto_210261 ?auto_210257 ) ) ( not ( = ?auto_210263 ?auto_210257 ) ) ( not ( = ?auto_210264 ?auto_210257 ) ) ( ON ?auto_210262 ?auto_210256 ) ( ON-TABLE ?auto_210257 ) ( ON ?auto_210264 ?auto_210262 ) ( ON ?auto_210263 ?auto_210264 ) ( CLEAR ?auto_210263 ) ( HOLDING ?auto_210261 ) ( CLEAR ?auto_210258 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210260 ?auto_210259 ?auto_210258 ?auto_210261 )
      ( MAKE-1PILE ?auto_210256 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210265 - BLOCK
    )
    :vars
    (
      ?auto_210272 - BLOCK
      ?auto_210271 - BLOCK
      ?auto_210266 - BLOCK
      ?auto_210267 - BLOCK
      ?auto_210273 - BLOCK
      ?auto_210268 - BLOCK
      ?auto_210270 - BLOCK
      ?auto_210269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210265 ?auto_210272 ) ) ( ON-TABLE ?auto_210271 ) ( ON ?auto_210266 ?auto_210271 ) ( ON ?auto_210267 ?auto_210266 ) ( not ( = ?auto_210271 ?auto_210266 ) ) ( not ( = ?auto_210271 ?auto_210267 ) ) ( not ( = ?auto_210271 ?auto_210273 ) ) ( not ( = ?auto_210271 ?auto_210268 ) ) ( not ( = ?auto_210271 ?auto_210270 ) ) ( not ( = ?auto_210271 ?auto_210272 ) ) ( not ( = ?auto_210271 ?auto_210265 ) ) ( not ( = ?auto_210266 ?auto_210267 ) ) ( not ( = ?auto_210266 ?auto_210273 ) ) ( not ( = ?auto_210266 ?auto_210268 ) ) ( not ( = ?auto_210266 ?auto_210270 ) ) ( not ( = ?auto_210266 ?auto_210272 ) ) ( not ( = ?auto_210266 ?auto_210265 ) ) ( not ( = ?auto_210267 ?auto_210273 ) ) ( not ( = ?auto_210267 ?auto_210268 ) ) ( not ( = ?auto_210267 ?auto_210270 ) ) ( not ( = ?auto_210267 ?auto_210272 ) ) ( not ( = ?auto_210267 ?auto_210265 ) ) ( not ( = ?auto_210273 ?auto_210268 ) ) ( not ( = ?auto_210273 ?auto_210270 ) ) ( not ( = ?auto_210273 ?auto_210272 ) ) ( not ( = ?auto_210273 ?auto_210265 ) ) ( not ( = ?auto_210268 ?auto_210270 ) ) ( not ( = ?auto_210268 ?auto_210272 ) ) ( not ( = ?auto_210268 ?auto_210265 ) ) ( not ( = ?auto_210270 ?auto_210272 ) ) ( not ( = ?auto_210270 ?auto_210265 ) ) ( ON ?auto_210265 ?auto_210269 ) ( not ( = ?auto_210265 ?auto_210269 ) ) ( not ( = ?auto_210272 ?auto_210269 ) ) ( not ( = ?auto_210271 ?auto_210269 ) ) ( not ( = ?auto_210266 ?auto_210269 ) ) ( not ( = ?auto_210267 ?auto_210269 ) ) ( not ( = ?auto_210273 ?auto_210269 ) ) ( not ( = ?auto_210268 ?auto_210269 ) ) ( not ( = ?auto_210270 ?auto_210269 ) ) ( ON ?auto_210272 ?auto_210265 ) ( ON-TABLE ?auto_210269 ) ( ON ?auto_210270 ?auto_210272 ) ( ON ?auto_210268 ?auto_210270 ) ( CLEAR ?auto_210267 ) ( ON ?auto_210273 ?auto_210268 ) ( CLEAR ?auto_210273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210269 ?auto_210265 ?auto_210272 ?auto_210270 ?auto_210268 )
      ( MAKE-1PILE ?auto_210265 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210274 - BLOCK
    )
    :vars
    (
      ?auto_210279 - BLOCK
      ?auto_210276 - BLOCK
      ?auto_210275 - BLOCK
      ?auto_210280 - BLOCK
      ?auto_210278 - BLOCK
      ?auto_210282 - BLOCK
      ?auto_210277 - BLOCK
      ?auto_210281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210274 ?auto_210279 ) ) ( ON-TABLE ?auto_210276 ) ( ON ?auto_210275 ?auto_210276 ) ( not ( = ?auto_210276 ?auto_210275 ) ) ( not ( = ?auto_210276 ?auto_210280 ) ) ( not ( = ?auto_210276 ?auto_210278 ) ) ( not ( = ?auto_210276 ?auto_210282 ) ) ( not ( = ?auto_210276 ?auto_210277 ) ) ( not ( = ?auto_210276 ?auto_210279 ) ) ( not ( = ?auto_210276 ?auto_210274 ) ) ( not ( = ?auto_210275 ?auto_210280 ) ) ( not ( = ?auto_210275 ?auto_210278 ) ) ( not ( = ?auto_210275 ?auto_210282 ) ) ( not ( = ?auto_210275 ?auto_210277 ) ) ( not ( = ?auto_210275 ?auto_210279 ) ) ( not ( = ?auto_210275 ?auto_210274 ) ) ( not ( = ?auto_210280 ?auto_210278 ) ) ( not ( = ?auto_210280 ?auto_210282 ) ) ( not ( = ?auto_210280 ?auto_210277 ) ) ( not ( = ?auto_210280 ?auto_210279 ) ) ( not ( = ?auto_210280 ?auto_210274 ) ) ( not ( = ?auto_210278 ?auto_210282 ) ) ( not ( = ?auto_210278 ?auto_210277 ) ) ( not ( = ?auto_210278 ?auto_210279 ) ) ( not ( = ?auto_210278 ?auto_210274 ) ) ( not ( = ?auto_210282 ?auto_210277 ) ) ( not ( = ?auto_210282 ?auto_210279 ) ) ( not ( = ?auto_210282 ?auto_210274 ) ) ( not ( = ?auto_210277 ?auto_210279 ) ) ( not ( = ?auto_210277 ?auto_210274 ) ) ( ON ?auto_210274 ?auto_210281 ) ( not ( = ?auto_210274 ?auto_210281 ) ) ( not ( = ?auto_210279 ?auto_210281 ) ) ( not ( = ?auto_210276 ?auto_210281 ) ) ( not ( = ?auto_210275 ?auto_210281 ) ) ( not ( = ?auto_210280 ?auto_210281 ) ) ( not ( = ?auto_210278 ?auto_210281 ) ) ( not ( = ?auto_210282 ?auto_210281 ) ) ( not ( = ?auto_210277 ?auto_210281 ) ) ( ON ?auto_210279 ?auto_210274 ) ( ON-TABLE ?auto_210281 ) ( ON ?auto_210277 ?auto_210279 ) ( ON ?auto_210282 ?auto_210277 ) ( ON ?auto_210278 ?auto_210282 ) ( CLEAR ?auto_210278 ) ( HOLDING ?auto_210280 ) ( CLEAR ?auto_210275 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210276 ?auto_210275 ?auto_210280 )
      ( MAKE-1PILE ?auto_210274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210283 - BLOCK
    )
    :vars
    (
      ?auto_210284 - BLOCK
      ?auto_210290 - BLOCK
      ?auto_210287 - BLOCK
      ?auto_210291 - BLOCK
      ?auto_210288 - BLOCK
      ?auto_210285 - BLOCK
      ?auto_210289 - BLOCK
      ?auto_210286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210283 ?auto_210284 ) ) ( ON-TABLE ?auto_210290 ) ( ON ?auto_210287 ?auto_210290 ) ( not ( = ?auto_210290 ?auto_210287 ) ) ( not ( = ?auto_210290 ?auto_210291 ) ) ( not ( = ?auto_210290 ?auto_210288 ) ) ( not ( = ?auto_210290 ?auto_210285 ) ) ( not ( = ?auto_210290 ?auto_210289 ) ) ( not ( = ?auto_210290 ?auto_210284 ) ) ( not ( = ?auto_210290 ?auto_210283 ) ) ( not ( = ?auto_210287 ?auto_210291 ) ) ( not ( = ?auto_210287 ?auto_210288 ) ) ( not ( = ?auto_210287 ?auto_210285 ) ) ( not ( = ?auto_210287 ?auto_210289 ) ) ( not ( = ?auto_210287 ?auto_210284 ) ) ( not ( = ?auto_210287 ?auto_210283 ) ) ( not ( = ?auto_210291 ?auto_210288 ) ) ( not ( = ?auto_210291 ?auto_210285 ) ) ( not ( = ?auto_210291 ?auto_210289 ) ) ( not ( = ?auto_210291 ?auto_210284 ) ) ( not ( = ?auto_210291 ?auto_210283 ) ) ( not ( = ?auto_210288 ?auto_210285 ) ) ( not ( = ?auto_210288 ?auto_210289 ) ) ( not ( = ?auto_210288 ?auto_210284 ) ) ( not ( = ?auto_210288 ?auto_210283 ) ) ( not ( = ?auto_210285 ?auto_210289 ) ) ( not ( = ?auto_210285 ?auto_210284 ) ) ( not ( = ?auto_210285 ?auto_210283 ) ) ( not ( = ?auto_210289 ?auto_210284 ) ) ( not ( = ?auto_210289 ?auto_210283 ) ) ( ON ?auto_210283 ?auto_210286 ) ( not ( = ?auto_210283 ?auto_210286 ) ) ( not ( = ?auto_210284 ?auto_210286 ) ) ( not ( = ?auto_210290 ?auto_210286 ) ) ( not ( = ?auto_210287 ?auto_210286 ) ) ( not ( = ?auto_210291 ?auto_210286 ) ) ( not ( = ?auto_210288 ?auto_210286 ) ) ( not ( = ?auto_210285 ?auto_210286 ) ) ( not ( = ?auto_210289 ?auto_210286 ) ) ( ON ?auto_210284 ?auto_210283 ) ( ON-TABLE ?auto_210286 ) ( ON ?auto_210289 ?auto_210284 ) ( ON ?auto_210285 ?auto_210289 ) ( ON ?auto_210288 ?auto_210285 ) ( CLEAR ?auto_210287 ) ( ON ?auto_210291 ?auto_210288 ) ( CLEAR ?auto_210291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210286 ?auto_210283 ?auto_210284 ?auto_210289 ?auto_210285 ?auto_210288 )
      ( MAKE-1PILE ?auto_210283 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210292 - BLOCK
    )
    :vars
    (
      ?auto_210298 - BLOCK
      ?auto_210296 - BLOCK
      ?auto_210294 - BLOCK
      ?auto_210295 - BLOCK
      ?auto_210297 - BLOCK
      ?auto_210300 - BLOCK
      ?auto_210293 - BLOCK
      ?auto_210299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210292 ?auto_210298 ) ) ( ON-TABLE ?auto_210296 ) ( not ( = ?auto_210296 ?auto_210294 ) ) ( not ( = ?auto_210296 ?auto_210295 ) ) ( not ( = ?auto_210296 ?auto_210297 ) ) ( not ( = ?auto_210296 ?auto_210300 ) ) ( not ( = ?auto_210296 ?auto_210293 ) ) ( not ( = ?auto_210296 ?auto_210298 ) ) ( not ( = ?auto_210296 ?auto_210292 ) ) ( not ( = ?auto_210294 ?auto_210295 ) ) ( not ( = ?auto_210294 ?auto_210297 ) ) ( not ( = ?auto_210294 ?auto_210300 ) ) ( not ( = ?auto_210294 ?auto_210293 ) ) ( not ( = ?auto_210294 ?auto_210298 ) ) ( not ( = ?auto_210294 ?auto_210292 ) ) ( not ( = ?auto_210295 ?auto_210297 ) ) ( not ( = ?auto_210295 ?auto_210300 ) ) ( not ( = ?auto_210295 ?auto_210293 ) ) ( not ( = ?auto_210295 ?auto_210298 ) ) ( not ( = ?auto_210295 ?auto_210292 ) ) ( not ( = ?auto_210297 ?auto_210300 ) ) ( not ( = ?auto_210297 ?auto_210293 ) ) ( not ( = ?auto_210297 ?auto_210298 ) ) ( not ( = ?auto_210297 ?auto_210292 ) ) ( not ( = ?auto_210300 ?auto_210293 ) ) ( not ( = ?auto_210300 ?auto_210298 ) ) ( not ( = ?auto_210300 ?auto_210292 ) ) ( not ( = ?auto_210293 ?auto_210298 ) ) ( not ( = ?auto_210293 ?auto_210292 ) ) ( ON ?auto_210292 ?auto_210299 ) ( not ( = ?auto_210292 ?auto_210299 ) ) ( not ( = ?auto_210298 ?auto_210299 ) ) ( not ( = ?auto_210296 ?auto_210299 ) ) ( not ( = ?auto_210294 ?auto_210299 ) ) ( not ( = ?auto_210295 ?auto_210299 ) ) ( not ( = ?auto_210297 ?auto_210299 ) ) ( not ( = ?auto_210300 ?auto_210299 ) ) ( not ( = ?auto_210293 ?auto_210299 ) ) ( ON ?auto_210298 ?auto_210292 ) ( ON-TABLE ?auto_210299 ) ( ON ?auto_210293 ?auto_210298 ) ( ON ?auto_210300 ?auto_210293 ) ( ON ?auto_210297 ?auto_210300 ) ( ON ?auto_210295 ?auto_210297 ) ( CLEAR ?auto_210295 ) ( HOLDING ?auto_210294 ) ( CLEAR ?auto_210296 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210296 ?auto_210294 )
      ( MAKE-1PILE ?auto_210292 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210301 - BLOCK
    )
    :vars
    (
      ?auto_210306 - BLOCK
      ?auto_210308 - BLOCK
      ?auto_210303 - BLOCK
      ?auto_210309 - BLOCK
      ?auto_210305 - BLOCK
      ?auto_210307 - BLOCK
      ?auto_210302 - BLOCK
      ?auto_210304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210301 ?auto_210306 ) ) ( ON-TABLE ?auto_210308 ) ( not ( = ?auto_210308 ?auto_210303 ) ) ( not ( = ?auto_210308 ?auto_210309 ) ) ( not ( = ?auto_210308 ?auto_210305 ) ) ( not ( = ?auto_210308 ?auto_210307 ) ) ( not ( = ?auto_210308 ?auto_210302 ) ) ( not ( = ?auto_210308 ?auto_210306 ) ) ( not ( = ?auto_210308 ?auto_210301 ) ) ( not ( = ?auto_210303 ?auto_210309 ) ) ( not ( = ?auto_210303 ?auto_210305 ) ) ( not ( = ?auto_210303 ?auto_210307 ) ) ( not ( = ?auto_210303 ?auto_210302 ) ) ( not ( = ?auto_210303 ?auto_210306 ) ) ( not ( = ?auto_210303 ?auto_210301 ) ) ( not ( = ?auto_210309 ?auto_210305 ) ) ( not ( = ?auto_210309 ?auto_210307 ) ) ( not ( = ?auto_210309 ?auto_210302 ) ) ( not ( = ?auto_210309 ?auto_210306 ) ) ( not ( = ?auto_210309 ?auto_210301 ) ) ( not ( = ?auto_210305 ?auto_210307 ) ) ( not ( = ?auto_210305 ?auto_210302 ) ) ( not ( = ?auto_210305 ?auto_210306 ) ) ( not ( = ?auto_210305 ?auto_210301 ) ) ( not ( = ?auto_210307 ?auto_210302 ) ) ( not ( = ?auto_210307 ?auto_210306 ) ) ( not ( = ?auto_210307 ?auto_210301 ) ) ( not ( = ?auto_210302 ?auto_210306 ) ) ( not ( = ?auto_210302 ?auto_210301 ) ) ( ON ?auto_210301 ?auto_210304 ) ( not ( = ?auto_210301 ?auto_210304 ) ) ( not ( = ?auto_210306 ?auto_210304 ) ) ( not ( = ?auto_210308 ?auto_210304 ) ) ( not ( = ?auto_210303 ?auto_210304 ) ) ( not ( = ?auto_210309 ?auto_210304 ) ) ( not ( = ?auto_210305 ?auto_210304 ) ) ( not ( = ?auto_210307 ?auto_210304 ) ) ( not ( = ?auto_210302 ?auto_210304 ) ) ( ON ?auto_210306 ?auto_210301 ) ( ON-TABLE ?auto_210304 ) ( ON ?auto_210302 ?auto_210306 ) ( ON ?auto_210307 ?auto_210302 ) ( ON ?auto_210305 ?auto_210307 ) ( ON ?auto_210309 ?auto_210305 ) ( CLEAR ?auto_210308 ) ( ON ?auto_210303 ?auto_210309 ) ( CLEAR ?auto_210303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210304 ?auto_210301 ?auto_210306 ?auto_210302 ?auto_210307 ?auto_210305 ?auto_210309 )
      ( MAKE-1PILE ?auto_210301 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210310 - BLOCK
    )
    :vars
    (
      ?auto_210316 - BLOCK
      ?auto_210312 - BLOCK
      ?auto_210314 - BLOCK
      ?auto_210311 - BLOCK
      ?auto_210317 - BLOCK
      ?auto_210315 - BLOCK
      ?auto_210318 - BLOCK
      ?auto_210313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210310 ?auto_210316 ) ) ( not ( = ?auto_210312 ?auto_210314 ) ) ( not ( = ?auto_210312 ?auto_210311 ) ) ( not ( = ?auto_210312 ?auto_210317 ) ) ( not ( = ?auto_210312 ?auto_210315 ) ) ( not ( = ?auto_210312 ?auto_210318 ) ) ( not ( = ?auto_210312 ?auto_210316 ) ) ( not ( = ?auto_210312 ?auto_210310 ) ) ( not ( = ?auto_210314 ?auto_210311 ) ) ( not ( = ?auto_210314 ?auto_210317 ) ) ( not ( = ?auto_210314 ?auto_210315 ) ) ( not ( = ?auto_210314 ?auto_210318 ) ) ( not ( = ?auto_210314 ?auto_210316 ) ) ( not ( = ?auto_210314 ?auto_210310 ) ) ( not ( = ?auto_210311 ?auto_210317 ) ) ( not ( = ?auto_210311 ?auto_210315 ) ) ( not ( = ?auto_210311 ?auto_210318 ) ) ( not ( = ?auto_210311 ?auto_210316 ) ) ( not ( = ?auto_210311 ?auto_210310 ) ) ( not ( = ?auto_210317 ?auto_210315 ) ) ( not ( = ?auto_210317 ?auto_210318 ) ) ( not ( = ?auto_210317 ?auto_210316 ) ) ( not ( = ?auto_210317 ?auto_210310 ) ) ( not ( = ?auto_210315 ?auto_210318 ) ) ( not ( = ?auto_210315 ?auto_210316 ) ) ( not ( = ?auto_210315 ?auto_210310 ) ) ( not ( = ?auto_210318 ?auto_210316 ) ) ( not ( = ?auto_210318 ?auto_210310 ) ) ( ON ?auto_210310 ?auto_210313 ) ( not ( = ?auto_210310 ?auto_210313 ) ) ( not ( = ?auto_210316 ?auto_210313 ) ) ( not ( = ?auto_210312 ?auto_210313 ) ) ( not ( = ?auto_210314 ?auto_210313 ) ) ( not ( = ?auto_210311 ?auto_210313 ) ) ( not ( = ?auto_210317 ?auto_210313 ) ) ( not ( = ?auto_210315 ?auto_210313 ) ) ( not ( = ?auto_210318 ?auto_210313 ) ) ( ON ?auto_210316 ?auto_210310 ) ( ON-TABLE ?auto_210313 ) ( ON ?auto_210318 ?auto_210316 ) ( ON ?auto_210315 ?auto_210318 ) ( ON ?auto_210317 ?auto_210315 ) ( ON ?auto_210311 ?auto_210317 ) ( ON ?auto_210314 ?auto_210311 ) ( CLEAR ?auto_210314 ) ( HOLDING ?auto_210312 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_210312 )
      ( MAKE-1PILE ?auto_210310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_210319 - BLOCK
    )
    :vars
    (
      ?auto_210326 - BLOCK
      ?auto_210325 - BLOCK
      ?auto_210324 - BLOCK
      ?auto_210321 - BLOCK
      ?auto_210323 - BLOCK
      ?auto_210327 - BLOCK
      ?auto_210322 - BLOCK
      ?auto_210320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210319 ?auto_210326 ) ) ( not ( = ?auto_210325 ?auto_210324 ) ) ( not ( = ?auto_210325 ?auto_210321 ) ) ( not ( = ?auto_210325 ?auto_210323 ) ) ( not ( = ?auto_210325 ?auto_210327 ) ) ( not ( = ?auto_210325 ?auto_210322 ) ) ( not ( = ?auto_210325 ?auto_210326 ) ) ( not ( = ?auto_210325 ?auto_210319 ) ) ( not ( = ?auto_210324 ?auto_210321 ) ) ( not ( = ?auto_210324 ?auto_210323 ) ) ( not ( = ?auto_210324 ?auto_210327 ) ) ( not ( = ?auto_210324 ?auto_210322 ) ) ( not ( = ?auto_210324 ?auto_210326 ) ) ( not ( = ?auto_210324 ?auto_210319 ) ) ( not ( = ?auto_210321 ?auto_210323 ) ) ( not ( = ?auto_210321 ?auto_210327 ) ) ( not ( = ?auto_210321 ?auto_210322 ) ) ( not ( = ?auto_210321 ?auto_210326 ) ) ( not ( = ?auto_210321 ?auto_210319 ) ) ( not ( = ?auto_210323 ?auto_210327 ) ) ( not ( = ?auto_210323 ?auto_210322 ) ) ( not ( = ?auto_210323 ?auto_210326 ) ) ( not ( = ?auto_210323 ?auto_210319 ) ) ( not ( = ?auto_210327 ?auto_210322 ) ) ( not ( = ?auto_210327 ?auto_210326 ) ) ( not ( = ?auto_210327 ?auto_210319 ) ) ( not ( = ?auto_210322 ?auto_210326 ) ) ( not ( = ?auto_210322 ?auto_210319 ) ) ( ON ?auto_210319 ?auto_210320 ) ( not ( = ?auto_210319 ?auto_210320 ) ) ( not ( = ?auto_210326 ?auto_210320 ) ) ( not ( = ?auto_210325 ?auto_210320 ) ) ( not ( = ?auto_210324 ?auto_210320 ) ) ( not ( = ?auto_210321 ?auto_210320 ) ) ( not ( = ?auto_210323 ?auto_210320 ) ) ( not ( = ?auto_210327 ?auto_210320 ) ) ( not ( = ?auto_210322 ?auto_210320 ) ) ( ON ?auto_210326 ?auto_210319 ) ( ON-TABLE ?auto_210320 ) ( ON ?auto_210322 ?auto_210326 ) ( ON ?auto_210327 ?auto_210322 ) ( ON ?auto_210323 ?auto_210327 ) ( ON ?auto_210321 ?auto_210323 ) ( ON ?auto_210324 ?auto_210321 ) ( ON ?auto_210325 ?auto_210324 ) ( CLEAR ?auto_210325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210320 ?auto_210319 ?auto_210326 ?auto_210322 ?auto_210327 ?auto_210323 ?auto_210321 ?auto_210324 )
      ( MAKE-1PILE ?auto_210319 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210334 - BLOCK
      ?auto_210335 - BLOCK
      ?auto_210336 - BLOCK
      ?auto_210337 - BLOCK
      ?auto_210338 - BLOCK
      ?auto_210339 - BLOCK
    )
    :vars
    (
      ?auto_210340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210340 ?auto_210339 ) ( CLEAR ?auto_210340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210334 ) ( ON ?auto_210335 ?auto_210334 ) ( ON ?auto_210336 ?auto_210335 ) ( ON ?auto_210337 ?auto_210336 ) ( ON ?auto_210338 ?auto_210337 ) ( ON ?auto_210339 ?auto_210338 ) ( not ( = ?auto_210334 ?auto_210335 ) ) ( not ( = ?auto_210334 ?auto_210336 ) ) ( not ( = ?auto_210334 ?auto_210337 ) ) ( not ( = ?auto_210334 ?auto_210338 ) ) ( not ( = ?auto_210334 ?auto_210339 ) ) ( not ( = ?auto_210334 ?auto_210340 ) ) ( not ( = ?auto_210335 ?auto_210336 ) ) ( not ( = ?auto_210335 ?auto_210337 ) ) ( not ( = ?auto_210335 ?auto_210338 ) ) ( not ( = ?auto_210335 ?auto_210339 ) ) ( not ( = ?auto_210335 ?auto_210340 ) ) ( not ( = ?auto_210336 ?auto_210337 ) ) ( not ( = ?auto_210336 ?auto_210338 ) ) ( not ( = ?auto_210336 ?auto_210339 ) ) ( not ( = ?auto_210336 ?auto_210340 ) ) ( not ( = ?auto_210337 ?auto_210338 ) ) ( not ( = ?auto_210337 ?auto_210339 ) ) ( not ( = ?auto_210337 ?auto_210340 ) ) ( not ( = ?auto_210338 ?auto_210339 ) ) ( not ( = ?auto_210338 ?auto_210340 ) ) ( not ( = ?auto_210339 ?auto_210340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210340 ?auto_210339 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210341 - BLOCK
      ?auto_210342 - BLOCK
      ?auto_210343 - BLOCK
      ?auto_210344 - BLOCK
      ?auto_210345 - BLOCK
      ?auto_210346 - BLOCK
    )
    :vars
    (
      ?auto_210347 - BLOCK
      ?auto_210348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210347 ?auto_210346 ) ( CLEAR ?auto_210347 ) ( ON-TABLE ?auto_210341 ) ( ON ?auto_210342 ?auto_210341 ) ( ON ?auto_210343 ?auto_210342 ) ( ON ?auto_210344 ?auto_210343 ) ( ON ?auto_210345 ?auto_210344 ) ( ON ?auto_210346 ?auto_210345 ) ( not ( = ?auto_210341 ?auto_210342 ) ) ( not ( = ?auto_210341 ?auto_210343 ) ) ( not ( = ?auto_210341 ?auto_210344 ) ) ( not ( = ?auto_210341 ?auto_210345 ) ) ( not ( = ?auto_210341 ?auto_210346 ) ) ( not ( = ?auto_210341 ?auto_210347 ) ) ( not ( = ?auto_210342 ?auto_210343 ) ) ( not ( = ?auto_210342 ?auto_210344 ) ) ( not ( = ?auto_210342 ?auto_210345 ) ) ( not ( = ?auto_210342 ?auto_210346 ) ) ( not ( = ?auto_210342 ?auto_210347 ) ) ( not ( = ?auto_210343 ?auto_210344 ) ) ( not ( = ?auto_210343 ?auto_210345 ) ) ( not ( = ?auto_210343 ?auto_210346 ) ) ( not ( = ?auto_210343 ?auto_210347 ) ) ( not ( = ?auto_210344 ?auto_210345 ) ) ( not ( = ?auto_210344 ?auto_210346 ) ) ( not ( = ?auto_210344 ?auto_210347 ) ) ( not ( = ?auto_210345 ?auto_210346 ) ) ( not ( = ?auto_210345 ?auto_210347 ) ) ( not ( = ?auto_210346 ?auto_210347 ) ) ( HOLDING ?auto_210348 ) ( not ( = ?auto_210341 ?auto_210348 ) ) ( not ( = ?auto_210342 ?auto_210348 ) ) ( not ( = ?auto_210343 ?auto_210348 ) ) ( not ( = ?auto_210344 ?auto_210348 ) ) ( not ( = ?auto_210345 ?auto_210348 ) ) ( not ( = ?auto_210346 ?auto_210348 ) ) ( not ( = ?auto_210347 ?auto_210348 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_210348 )
      ( MAKE-6PILE ?auto_210341 ?auto_210342 ?auto_210343 ?auto_210344 ?auto_210345 ?auto_210346 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210349 - BLOCK
      ?auto_210350 - BLOCK
      ?auto_210351 - BLOCK
      ?auto_210352 - BLOCK
      ?auto_210353 - BLOCK
      ?auto_210354 - BLOCK
    )
    :vars
    (
      ?auto_210356 - BLOCK
      ?auto_210355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210356 ?auto_210354 ) ( ON-TABLE ?auto_210349 ) ( ON ?auto_210350 ?auto_210349 ) ( ON ?auto_210351 ?auto_210350 ) ( ON ?auto_210352 ?auto_210351 ) ( ON ?auto_210353 ?auto_210352 ) ( ON ?auto_210354 ?auto_210353 ) ( not ( = ?auto_210349 ?auto_210350 ) ) ( not ( = ?auto_210349 ?auto_210351 ) ) ( not ( = ?auto_210349 ?auto_210352 ) ) ( not ( = ?auto_210349 ?auto_210353 ) ) ( not ( = ?auto_210349 ?auto_210354 ) ) ( not ( = ?auto_210349 ?auto_210356 ) ) ( not ( = ?auto_210350 ?auto_210351 ) ) ( not ( = ?auto_210350 ?auto_210352 ) ) ( not ( = ?auto_210350 ?auto_210353 ) ) ( not ( = ?auto_210350 ?auto_210354 ) ) ( not ( = ?auto_210350 ?auto_210356 ) ) ( not ( = ?auto_210351 ?auto_210352 ) ) ( not ( = ?auto_210351 ?auto_210353 ) ) ( not ( = ?auto_210351 ?auto_210354 ) ) ( not ( = ?auto_210351 ?auto_210356 ) ) ( not ( = ?auto_210352 ?auto_210353 ) ) ( not ( = ?auto_210352 ?auto_210354 ) ) ( not ( = ?auto_210352 ?auto_210356 ) ) ( not ( = ?auto_210353 ?auto_210354 ) ) ( not ( = ?auto_210353 ?auto_210356 ) ) ( not ( = ?auto_210354 ?auto_210356 ) ) ( not ( = ?auto_210349 ?auto_210355 ) ) ( not ( = ?auto_210350 ?auto_210355 ) ) ( not ( = ?auto_210351 ?auto_210355 ) ) ( not ( = ?auto_210352 ?auto_210355 ) ) ( not ( = ?auto_210353 ?auto_210355 ) ) ( not ( = ?auto_210354 ?auto_210355 ) ) ( not ( = ?auto_210356 ?auto_210355 ) ) ( ON ?auto_210355 ?auto_210356 ) ( CLEAR ?auto_210355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210349 ?auto_210350 ?auto_210351 ?auto_210352 ?auto_210353 ?auto_210354 ?auto_210356 )
      ( MAKE-6PILE ?auto_210349 ?auto_210350 ?auto_210351 ?auto_210352 ?auto_210353 ?auto_210354 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210357 - BLOCK
      ?auto_210358 - BLOCK
      ?auto_210359 - BLOCK
      ?auto_210360 - BLOCK
      ?auto_210361 - BLOCK
      ?auto_210362 - BLOCK
    )
    :vars
    (
      ?auto_210364 - BLOCK
      ?auto_210363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210364 ?auto_210362 ) ( ON-TABLE ?auto_210357 ) ( ON ?auto_210358 ?auto_210357 ) ( ON ?auto_210359 ?auto_210358 ) ( ON ?auto_210360 ?auto_210359 ) ( ON ?auto_210361 ?auto_210360 ) ( ON ?auto_210362 ?auto_210361 ) ( not ( = ?auto_210357 ?auto_210358 ) ) ( not ( = ?auto_210357 ?auto_210359 ) ) ( not ( = ?auto_210357 ?auto_210360 ) ) ( not ( = ?auto_210357 ?auto_210361 ) ) ( not ( = ?auto_210357 ?auto_210362 ) ) ( not ( = ?auto_210357 ?auto_210364 ) ) ( not ( = ?auto_210358 ?auto_210359 ) ) ( not ( = ?auto_210358 ?auto_210360 ) ) ( not ( = ?auto_210358 ?auto_210361 ) ) ( not ( = ?auto_210358 ?auto_210362 ) ) ( not ( = ?auto_210358 ?auto_210364 ) ) ( not ( = ?auto_210359 ?auto_210360 ) ) ( not ( = ?auto_210359 ?auto_210361 ) ) ( not ( = ?auto_210359 ?auto_210362 ) ) ( not ( = ?auto_210359 ?auto_210364 ) ) ( not ( = ?auto_210360 ?auto_210361 ) ) ( not ( = ?auto_210360 ?auto_210362 ) ) ( not ( = ?auto_210360 ?auto_210364 ) ) ( not ( = ?auto_210361 ?auto_210362 ) ) ( not ( = ?auto_210361 ?auto_210364 ) ) ( not ( = ?auto_210362 ?auto_210364 ) ) ( not ( = ?auto_210357 ?auto_210363 ) ) ( not ( = ?auto_210358 ?auto_210363 ) ) ( not ( = ?auto_210359 ?auto_210363 ) ) ( not ( = ?auto_210360 ?auto_210363 ) ) ( not ( = ?auto_210361 ?auto_210363 ) ) ( not ( = ?auto_210362 ?auto_210363 ) ) ( not ( = ?auto_210364 ?auto_210363 ) ) ( HOLDING ?auto_210363 ) ( CLEAR ?auto_210364 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210357 ?auto_210358 ?auto_210359 ?auto_210360 ?auto_210361 ?auto_210362 ?auto_210364 ?auto_210363 )
      ( MAKE-6PILE ?auto_210357 ?auto_210358 ?auto_210359 ?auto_210360 ?auto_210361 ?auto_210362 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210365 - BLOCK
      ?auto_210366 - BLOCK
      ?auto_210367 - BLOCK
      ?auto_210368 - BLOCK
      ?auto_210369 - BLOCK
      ?auto_210370 - BLOCK
    )
    :vars
    (
      ?auto_210371 - BLOCK
      ?auto_210372 - BLOCK
      ?auto_210373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210371 ?auto_210370 ) ( ON-TABLE ?auto_210365 ) ( ON ?auto_210366 ?auto_210365 ) ( ON ?auto_210367 ?auto_210366 ) ( ON ?auto_210368 ?auto_210367 ) ( ON ?auto_210369 ?auto_210368 ) ( ON ?auto_210370 ?auto_210369 ) ( not ( = ?auto_210365 ?auto_210366 ) ) ( not ( = ?auto_210365 ?auto_210367 ) ) ( not ( = ?auto_210365 ?auto_210368 ) ) ( not ( = ?auto_210365 ?auto_210369 ) ) ( not ( = ?auto_210365 ?auto_210370 ) ) ( not ( = ?auto_210365 ?auto_210371 ) ) ( not ( = ?auto_210366 ?auto_210367 ) ) ( not ( = ?auto_210366 ?auto_210368 ) ) ( not ( = ?auto_210366 ?auto_210369 ) ) ( not ( = ?auto_210366 ?auto_210370 ) ) ( not ( = ?auto_210366 ?auto_210371 ) ) ( not ( = ?auto_210367 ?auto_210368 ) ) ( not ( = ?auto_210367 ?auto_210369 ) ) ( not ( = ?auto_210367 ?auto_210370 ) ) ( not ( = ?auto_210367 ?auto_210371 ) ) ( not ( = ?auto_210368 ?auto_210369 ) ) ( not ( = ?auto_210368 ?auto_210370 ) ) ( not ( = ?auto_210368 ?auto_210371 ) ) ( not ( = ?auto_210369 ?auto_210370 ) ) ( not ( = ?auto_210369 ?auto_210371 ) ) ( not ( = ?auto_210370 ?auto_210371 ) ) ( not ( = ?auto_210365 ?auto_210372 ) ) ( not ( = ?auto_210366 ?auto_210372 ) ) ( not ( = ?auto_210367 ?auto_210372 ) ) ( not ( = ?auto_210368 ?auto_210372 ) ) ( not ( = ?auto_210369 ?auto_210372 ) ) ( not ( = ?auto_210370 ?auto_210372 ) ) ( not ( = ?auto_210371 ?auto_210372 ) ) ( CLEAR ?auto_210371 ) ( ON ?auto_210372 ?auto_210373 ) ( CLEAR ?auto_210372 ) ( HAND-EMPTY ) ( not ( = ?auto_210365 ?auto_210373 ) ) ( not ( = ?auto_210366 ?auto_210373 ) ) ( not ( = ?auto_210367 ?auto_210373 ) ) ( not ( = ?auto_210368 ?auto_210373 ) ) ( not ( = ?auto_210369 ?auto_210373 ) ) ( not ( = ?auto_210370 ?auto_210373 ) ) ( not ( = ?auto_210371 ?auto_210373 ) ) ( not ( = ?auto_210372 ?auto_210373 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210372 ?auto_210373 )
      ( MAKE-6PILE ?auto_210365 ?auto_210366 ?auto_210367 ?auto_210368 ?auto_210369 ?auto_210370 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210392 - BLOCK
      ?auto_210393 - BLOCK
      ?auto_210394 - BLOCK
      ?auto_210395 - BLOCK
      ?auto_210396 - BLOCK
      ?auto_210397 - BLOCK
    )
    :vars
    (
      ?auto_210400 - BLOCK
      ?auto_210398 - BLOCK
      ?auto_210399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210392 ) ( ON ?auto_210393 ?auto_210392 ) ( ON ?auto_210394 ?auto_210393 ) ( ON ?auto_210395 ?auto_210394 ) ( ON ?auto_210396 ?auto_210395 ) ( not ( = ?auto_210392 ?auto_210393 ) ) ( not ( = ?auto_210392 ?auto_210394 ) ) ( not ( = ?auto_210392 ?auto_210395 ) ) ( not ( = ?auto_210392 ?auto_210396 ) ) ( not ( = ?auto_210392 ?auto_210397 ) ) ( not ( = ?auto_210392 ?auto_210400 ) ) ( not ( = ?auto_210393 ?auto_210394 ) ) ( not ( = ?auto_210393 ?auto_210395 ) ) ( not ( = ?auto_210393 ?auto_210396 ) ) ( not ( = ?auto_210393 ?auto_210397 ) ) ( not ( = ?auto_210393 ?auto_210400 ) ) ( not ( = ?auto_210394 ?auto_210395 ) ) ( not ( = ?auto_210394 ?auto_210396 ) ) ( not ( = ?auto_210394 ?auto_210397 ) ) ( not ( = ?auto_210394 ?auto_210400 ) ) ( not ( = ?auto_210395 ?auto_210396 ) ) ( not ( = ?auto_210395 ?auto_210397 ) ) ( not ( = ?auto_210395 ?auto_210400 ) ) ( not ( = ?auto_210396 ?auto_210397 ) ) ( not ( = ?auto_210396 ?auto_210400 ) ) ( not ( = ?auto_210397 ?auto_210400 ) ) ( not ( = ?auto_210392 ?auto_210398 ) ) ( not ( = ?auto_210393 ?auto_210398 ) ) ( not ( = ?auto_210394 ?auto_210398 ) ) ( not ( = ?auto_210395 ?auto_210398 ) ) ( not ( = ?auto_210396 ?auto_210398 ) ) ( not ( = ?auto_210397 ?auto_210398 ) ) ( not ( = ?auto_210400 ?auto_210398 ) ) ( ON ?auto_210398 ?auto_210399 ) ( not ( = ?auto_210392 ?auto_210399 ) ) ( not ( = ?auto_210393 ?auto_210399 ) ) ( not ( = ?auto_210394 ?auto_210399 ) ) ( not ( = ?auto_210395 ?auto_210399 ) ) ( not ( = ?auto_210396 ?auto_210399 ) ) ( not ( = ?auto_210397 ?auto_210399 ) ) ( not ( = ?auto_210400 ?auto_210399 ) ) ( not ( = ?auto_210398 ?auto_210399 ) ) ( ON ?auto_210400 ?auto_210398 ) ( CLEAR ?auto_210400 ) ( HOLDING ?auto_210397 ) ( CLEAR ?auto_210396 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210392 ?auto_210393 ?auto_210394 ?auto_210395 ?auto_210396 ?auto_210397 ?auto_210400 )
      ( MAKE-6PILE ?auto_210392 ?auto_210393 ?auto_210394 ?auto_210395 ?auto_210396 ?auto_210397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210401 - BLOCK
      ?auto_210402 - BLOCK
      ?auto_210403 - BLOCK
      ?auto_210404 - BLOCK
      ?auto_210405 - BLOCK
      ?auto_210406 - BLOCK
    )
    :vars
    (
      ?auto_210409 - BLOCK
      ?auto_210407 - BLOCK
      ?auto_210408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210401 ) ( ON ?auto_210402 ?auto_210401 ) ( ON ?auto_210403 ?auto_210402 ) ( ON ?auto_210404 ?auto_210403 ) ( ON ?auto_210405 ?auto_210404 ) ( not ( = ?auto_210401 ?auto_210402 ) ) ( not ( = ?auto_210401 ?auto_210403 ) ) ( not ( = ?auto_210401 ?auto_210404 ) ) ( not ( = ?auto_210401 ?auto_210405 ) ) ( not ( = ?auto_210401 ?auto_210406 ) ) ( not ( = ?auto_210401 ?auto_210409 ) ) ( not ( = ?auto_210402 ?auto_210403 ) ) ( not ( = ?auto_210402 ?auto_210404 ) ) ( not ( = ?auto_210402 ?auto_210405 ) ) ( not ( = ?auto_210402 ?auto_210406 ) ) ( not ( = ?auto_210402 ?auto_210409 ) ) ( not ( = ?auto_210403 ?auto_210404 ) ) ( not ( = ?auto_210403 ?auto_210405 ) ) ( not ( = ?auto_210403 ?auto_210406 ) ) ( not ( = ?auto_210403 ?auto_210409 ) ) ( not ( = ?auto_210404 ?auto_210405 ) ) ( not ( = ?auto_210404 ?auto_210406 ) ) ( not ( = ?auto_210404 ?auto_210409 ) ) ( not ( = ?auto_210405 ?auto_210406 ) ) ( not ( = ?auto_210405 ?auto_210409 ) ) ( not ( = ?auto_210406 ?auto_210409 ) ) ( not ( = ?auto_210401 ?auto_210407 ) ) ( not ( = ?auto_210402 ?auto_210407 ) ) ( not ( = ?auto_210403 ?auto_210407 ) ) ( not ( = ?auto_210404 ?auto_210407 ) ) ( not ( = ?auto_210405 ?auto_210407 ) ) ( not ( = ?auto_210406 ?auto_210407 ) ) ( not ( = ?auto_210409 ?auto_210407 ) ) ( ON ?auto_210407 ?auto_210408 ) ( not ( = ?auto_210401 ?auto_210408 ) ) ( not ( = ?auto_210402 ?auto_210408 ) ) ( not ( = ?auto_210403 ?auto_210408 ) ) ( not ( = ?auto_210404 ?auto_210408 ) ) ( not ( = ?auto_210405 ?auto_210408 ) ) ( not ( = ?auto_210406 ?auto_210408 ) ) ( not ( = ?auto_210409 ?auto_210408 ) ) ( not ( = ?auto_210407 ?auto_210408 ) ) ( ON ?auto_210409 ?auto_210407 ) ( CLEAR ?auto_210405 ) ( ON ?auto_210406 ?auto_210409 ) ( CLEAR ?auto_210406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210408 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210408 ?auto_210407 ?auto_210409 )
      ( MAKE-6PILE ?auto_210401 ?auto_210402 ?auto_210403 ?auto_210404 ?auto_210405 ?auto_210406 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210410 - BLOCK
      ?auto_210411 - BLOCK
      ?auto_210412 - BLOCK
      ?auto_210413 - BLOCK
      ?auto_210414 - BLOCK
      ?auto_210415 - BLOCK
    )
    :vars
    (
      ?auto_210416 - BLOCK
      ?auto_210418 - BLOCK
      ?auto_210417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210410 ) ( ON ?auto_210411 ?auto_210410 ) ( ON ?auto_210412 ?auto_210411 ) ( ON ?auto_210413 ?auto_210412 ) ( not ( = ?auto_210410 ?auto_210411 ) ) ( not ( = ?auto_210410 ?auto_210412 ) ) ( not ( = ?auto_210410 ?auto_210413 ) ) ( not ( = ?auto_210410 ?auto_210414 ) ) ( not ( = ?auto_210410 ?auto_210415 ) ) ( not ( = ?auto_210410 ?auto_210416 ) ) ( not ( = ?auto_210411 ?auto_210412 ) ) ( not ( = ?auto_210411 ?auto_210413 ) ) ( not ( = ?auto_210411 ?auto_210414 ) ) ( not ( = ?auto_210411 ?auto_210415 ) ) ( not ( = ?auto_210411 ?auto_210416 ) ) ( not ( = ?auto_210412 ?auto_210413 ) ) ( not ( = ?auto_210412 ?auto_210414 ) ) ( not ( = ?auto_210412 ?auto_210415 ) ) ( not ( = ?auto_210412 ?auto_210416 ) ) ( not ( = ?auto_210413 ?auto_210414 ) ) ( not ( = ?auto_210413 ?auto_210415 ) ) ( not ( = ?auto_210413 ?auto_210416 ) ) ( not ( = ?auto_210414 ?auto_210415 ) ) ( not ( = ?auto_210414 ?auto_210416 ) ) ( not ( = ?auto_210415 ?auto_210416 ) ) ( not ( = ?auto_210410 ?auto_210418 ) ) ( not ( = ?auto_210411 ?auto_210418 ) ) ( not ( = ?auto_210412 ?auto_210418 ) ) ( not ( = ?auto_210413 ?auto_210418 ) ) ( not ( = ?auto_210414 ?auto_210418 ) ) ( not ( = ?auto_210415 ?auto_210418 ) ) ( not ( = ?auto_210416 ?auto_210418 ) ) ( ON ?auto_210418 ?auto_210417 ) ( not ( = ?auto_210410 ?auto_210417 ) ) ( not ( = ?auto_210411 ?auto_210417 ) ) ( not ( = ?auto_210412 ?auto_210417 ) ) ( not ( = ?auto_210413 ?auto_210417 ) ) ( not ( = ?auto_210414 ?auto_210417 ) ) ( not ( = ?auto_210415 ?auto_210417 ) ) ( not ( = ?auto_210416 ?auto_210417 ) ) ( not ( = ?auto_210418 ?auto_210417 ) ) ( ON ?auto_210416 ?auto_210418 ) ( ON ?auto_210415 ?auto_210416 ) ( CLEAR ?auto_210415 ) ( ON-TABLE ?auto_210417 ) ( HOLDING ?auto_210414 ) ( CLEAR ?auto_210413 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210410 ?auto_210411 ?auto_210412 ?auto_210413 ?auto_210414 )
      ( MAKE-6PILE ?auto_210410 ?auto_210411 ?auto_210412 ?auto_210413 ?auto_210414 ?auto_210415 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210419 - BLOCK
      ?auto_210420 - BLOCK
      ?auto_210421 - BLOCK
      ?auto_210422 - BLOCK
      ?auto_210423 - BLOCK
      ?auto_210424 - BLOCK
    )
    :vars
    (
      ?auto_210426 - BLOCK
      ?auto_210425 - BLOCK
      ?auto_210427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210419 ) ( ON ?auto_210420 ?auto_210419 ) ( ON ?auto_210421 ?auto_210420 ) ( ON ?auto_210422 ?auto_210421 ) ( not ( = ?auto_210419 ?auto_210420 ) ) ( not ( = ?auto_210419 ?auto_210421 ) ) ( not ( = ?auto_210419 ?auto_210422 ) ) ( not ( = ?auto_210419 ?auto_210423 ) ) ( not ( = ?auto_210419 ?auto_210424 ) ) ( not ( = ?auto_210419 ?auto_210426 ) ) ( not ( = ?auto_210420 ?auto_210421 ) ) ( not ( = ?auto_210420 ?auto_210422 ) ) ( not ( = ?auto_210420 ?auto_210423 ) ) ( not ( = ?auto_210420 ?auto_210424 ) ) ( not ( = ?auto_210420 ?auto_210426 ) ) ( not ( = ?auto_210421 ?auto_210422 ) ) ( not ( = ?auto_210421 ?auto_210423 ) ) ( not ( = ?auto_210421 ?auto_210424 ) ) ( not ( = ?auto_210421 ?auto_210426 ) ) ( not ( = ?auto_210422 ?auto_210423 ) ) ( not ( = ?auto_210422 ?auto_210424 ) ) ( not ( = ?auto_210422 ?auto_210426 ) ) ( not ( = ?auto_210423 ?auto_210424 ) ) ( not ( = ?auto_210423 ?auto_210426 ) ) ( not ( = ?auto_210424 ?auto_210426 ) ) ( not ( = ?auto_210419 ?auto_210425 ) ) ( not ( = ?auto_210420 ?auto_210425 ) ) ( not ( = ?auto_210421 ?auto_210425 ) ) ( not ( = ?auto_210422 ?auto_210425 ) ) ( not ( = ?auto_210423 ?auto_210425 ) ) ( not ( = ?auto_210424 ?auto_210425 ) ) ( not ( = ?auto_210426 ?auto_210425 ) ) ( ON ?auto_210425 ?auto_210427 ) ( not ( = ?auto_210419 ?auto_210427 ) ) ( not ( = ?auto_210420 ?auto_210427 ) ) ( not ( = ?auto_210421 ?auto_210427 ) ) ( not ( = ?auto_210422 ?auto_210427 ) ) ( not ( = ?auto_210423 ?auto_210427 ) ) ( not ( = ?auto_210424 ?auto_210427 ) ) ( not ( = ?auto_210426 ?auto_210427 ) ) ( not ( = ?auto_210425 ?auto_210427 ) ) ( ON ?auto_210426 ?auto_210425 ) ( ON ?auto_210424 ?auto_210426 ) ( ON-TABLE ?auto_210427 ) ( CLEAR ?auto_210422 ) ( ON ?auto_210423 ?auto_210424 ) ( CLEAR ?auto_210423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210427 ?auto_210425 ?auto_210426 ?auto_210424 )
      ( MAKE-6PILE ?auto_210419 ?auto_210420 ?auto_210421 ?auto_210422 ?auto_210423 ?auto_210424 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210428 - BLOCK
      ?auto_210429 - BLOCK
      ?auto_210430 - BLOCK
      ?auto_210431 - BLOCK
      ?auto_210432 - BLOCK
      ?auto_210433 - BLOCK
    )
    :vars
    (
      ?auto_210434 - BLOCK
      ?auto_210436 - BLOCK
      ?auto_210435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210428 ) ( ON ?auto_210429 ?auto_210428 ) ( ON ?auto_210430 ?auto_210429 ) ( not ( = ?auto_210428 ?auto_210429 ) ) ( not ( = ?auto_210428 ?auto_210430 ) ) ( not ( = ?auto_210428 ?auto_210431 ) ) ( not ( = ?auto_210428 ?auto_210432 ) ) ( not ( = ?auto_210428 ?auto_210433 ) ) ( not ( = ?auto_210428 ?auto_210434 ) ) ( not ( = ?auto_210429 ?auto_210430 ) ) ( not ( = ?auto_210429 ?auto_210431 ) ) ( not ( = ?auto_210429 ?auto_210432 ) ) ( not ( = ?auto_210429 ?auto_210433 ) ) ( not ( = ?auto_210429 ?auto_210434 ) ) ( not ( = ?auto_210430 ?auto_210431 ) ) ( not ( = ?auto_210430 ?auto_210432 ) ) ( not ( = ?auto_210430 ?auto_210433 ) ) ( not ( = ?auto_210430 ?auto_210434 ) ) ( not ( = ?auto_210431 ?auto_210432 ) ) ( not ( = ?auto_210431 ?auto_210433 ) ) ( not ( = ?auto_210431 ?auto_210434 ) ) ( not ( = ?auto_210432 ?auto_210433 ) ) ( not ( = ?auto_210432 ?auto_210434 ) ) ( not ( = ?auto_210433 ?auto_210434 ) ) ( not ( = ?auto_210428 ?auto_210436 ) ) ( not ( = ?auto_210429 ?auto_210436 ) ) ( not ( = ?auto_210430 ?auto_210436 ) ) ( not ( = ?auto_210431 ?auto_210436 ) ) ( not ( = ?auto_210432 ?auto_210436 ) ) ( not ( = ?auto_210433 ?auto_210436 ) ) ( not ( = ?auto_210434 ?auto_210436 ) ) ( ON ?auto_210436 ?auto_210435 ) ( not ( = ?auto_210428 ?auto_210435 ) ) ( not ( = ?auto_210429 ?auto_210435 ) ) ( not ( = ?auto_210430 ?auto_210435 ) ) ( not ( = ?auto_210431 ?auto_210435 ) ) ( not ( = ?auto_210432 ?auto_210435 ) ) ( not ( = ?auto_210433 ?auto_210435 ) ) ( not ( = ?auto_210434 ?auto_210435 ) ) ( not ( = ?auto_210436 ?auto_210435 ) ) ( ON ?auto_210434 ?auto_210436 ) ( ON ?auto_210433 ?auto_210434 ) ( ON-TABLE ?auto_210435 ) ( ON ?auto_210432 ?auto_210433 ) ( CLEAR ?auto_210432 ) ( HOLDING ?auto_210431 ) ( CLEAR ?auto_210430 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210428 ?auto_210429 ?auto_210430 ?auto_210431 )
      ( MAKE-6PILE ?auto_210428 ?auto_210429 ?auto_210430 ?auto_210431 ?auto_210432 ?auto_210433 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210437 - BLOCK
      ?auto_210438 - BLOCK
      ?auto_210439 - BLOCK
      ?auto_210440 - BLOCK
      ?auto_210441 - BLOCK
      ?auto_210442 - BLOCK
    )
    :vars
    (
      ?auto_210443 - BLOCK
      ?auto_210445 - BLOCK
      ?auto_210444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210437 ) ( ON ?auto_210438 ?auto_210437 ) ( ON ?auto_210439 ?auto_210438 ) ( not ( = ?auto_210437 ?auto_210438 ) ) ( not ( = ?auto_210437 ?auto_210439 ) ) ( not ( = ?auto_210437 ?auto_210440 ) ) ( not ( = ?auto_210437 ?auto_210441 ) ) ( not ( = ?auto_210437 ?auto_210442 ) ) ( not ( = ?auto_210437 ?auto_210443 ) ) ( not ( = ?auto_210438 ?auto_210439 ) ) ( not ( = ?auto_210438 ?auto_210440 ) ) ( not ( = ?auto_210438 ?auto_210441 ) ) ( not ( = ?auto_210438 ?auto_210442 ) ) ( not ( = ?auto_210438 ?auto_210443 ) ) ( not ( = ?auto_210439 ?auto_210440 ) ) ( not ( = ?auto_210439 ?auto_210441 ) ) ( not ( = ?auto_210439 ?auto_210442 ) ) ( not ( = ?auto_210439 ?auto_210443 ) ) ( not ( = ?auto_210440 ?auto_210441 ) ) ( not ( = ?auto_210440 ?auto_210442 ) ) ( not ( = ?auto_210440 ?auto_210443 ) ) ( not ( = ?auto_210441 ?auto_210442 ) ) ( not ( = ?auto_210441 ?auto_210443 ) ) ( not ( = ?auto_210442 ?auto_210443 ) ) ( not ( = ?auto_210437 ?auto_210445 ) ) ( not ( = ?auto_210438 ?auto_210445 ) ) ( not ( = ?auto_210439 ?auto_210445 ) ) ( not ( = ?auto_210440 ?auto_210445 ) ) ( not ( = ?auto_210441 ?auto_210445 ) ) ( not ( = ?auto_210442 ?auto_210445 ) ) ( not ( = ?auto_210443 ?auto_210445 ) ) ( ON ?auto_210445 ?auto_210444 ) ( not ( = ?auto_210437 ?auto_210444 ) ) ( not ( = ?auto_210438 ?auto_210444 ) ) ( not ( = ?auto_210439 ?auto_210444 ) ) ( not ( = ?auto_210440 ?auto_210444 ) ) ( not ( = ?auto_210441 ?auto_210444 ) ) ( not ( = ?auto_210442 ?auto_210444 ) ) ( not ( = ?auto_210443 ?auto_210444 ) ) ( not ( = ?auto_210445 ?auto_210444 ) ) ( ON ?auto_210443 ?auto_210445 ) ( ON ?auto_210442 ?auto_210443 ) ( ON-TABLE ?auto_210444 ) ( ON ?auto_210441 ?auto_210442 ) ( CLEAR ?auto_210439 ) ( ON ?auto_210440 ?auto_210441 ) ( CLEAR ?auto_210440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210444 ?auto_210445 ?auto_210443 ?auto_210442 ?auto_210441 )
      ( MAKE-6PILE ?auto_210437 ?auto_210438 ?auto_210439 ?auto_210440 ?auto_210441 ?auto_210442 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210446 - BLOCK
      ?auto_210447 - BLOCK
      ?auto_210448 - BLOCK
      ?auto_210449 - BLOCK
      ?auto_210450 - BLOCK
      ?auto_210451 - BLOCK
    )
    :vars
    (
      ?auto_210453 - BLOCK
      ?auto_210454 - BLOCK
      ?auto_210452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210446 ) ( ON ?auto_210447 ?auto_210446 ) ( not ( = ?auto_210446 ?auto_210447 ) ) ( not ( = ?auto_210446 ?auto_210448 ) ) ( not ( = ?auto_210446 ?auto_210449 ) ) ( not ( = ?auto_210446 ?auto_210450 ) ) ( not ( = ?auto_210446 ?auto_210451 ) ) ( not ( = ?auto_210446 ?auto_210453 ) ) ( not ( = ?auto_210447 ?auto_210448 ) ) ( not ( = ?auto_210447 ?auto_210449 ) ) ( not ( = ?auto_210447 ?auto_210450 ) ) ( not ( = ?auto_210447 ?auto_210451 ) ) ( not ( = ?auto_210447 ?auto_210453 ) ) ( not ( = ?auto_210448 ?auto_210449 ) ) ( not ( = ?auto_210448 ?auto_210450 ) ) ( not ( = ?auto_210448 ?auto_210451 ) ) ( not ( = ?auto_210448 ?auto_210453 ) ) ( not ( = ?auto_210449 ?auto_210450 ) ) ( not ( = ?auto_210449 ?auto_210451 ) ) ( not ( = ?auto_210449 ?auto_210453 ) ) ( not ( = ?auto_210450 ?auto_210451 ) ) ( not ( = ?auto_210450 ?auto_210453 ) ) ( not ( = ?auto_210451 ?auto_210453 ) ) ( not ( = ?auto_210446 ?auto_210454 ) ) ( not ( = ?auto_210447 ?auto_210454 ) ) ( not ( = ?auto_210448 ?auto_210454 ) ) ( not ( = ?auto_210449 ?auto_210454 ) ) ( not ( = ?auto_210450 ?auto_210454 ) ) ( not ( = ?auto_210451 ?auto_210454 ) ) ( not ( = ?auto_210453 ?auto_210454 ) ) ( ON ?auto_210454 ?auto_210452 ) ( not ( = ?auto_210446 ?auto_210452 ) ) ( not ( = ?auto_210447 ?auto_210452 ) ) ( not ( = ?auto_210448 ?auto_210452 ) ) ( not ( = ?auto_210449 ?auto_210452 ) ) ( not ( = ?auto_210450 ?auto_210452 ) ) ( not ( = ?auto_210451 ?auto_210452 ) ) ( not ( = ?auto_210453 ?auto_210452 ) ) ( not ( = ?auto_210454 ?auto_210452 ) ) ( ON ?auto_210453 ?auto_210454 ) ( ON ?auto_210451 ?auto_210453 ) ( ON-TABLE ?auto_210452 ) ( ON ?auto_210450 ?auto_210451 ) ( ON ?auto_210449 ?auto_210450 ) ( CLEAR ?auto_210449 ) ( HOLDING ?auto_210448 ) ( CLEAR ?auto_210447 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210446 ?auto_210447 ?auto_210448 )
      ( MAKE-6PILE ?auto_210446 ?auto_210447 ?auto_210448 ?auto_210449 ?auto_210450 ?auto_210451 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210455 - BLOCK
      ?auto_210456 - BLOCK
      ?auto_210457 - BLOCK
      ?auto_210458 - BLOCK
      ?auto_210459 - BLOCK
      ?auto_210460 - BLOCK
    )
    :vars
    (
      ?auto_210461 - BLOCK
      ?auto_210463 - BLOCK
      ?auto_210462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210455 ) ( ON ?auto_210456 ?auto_210455 ) ( not ( = ?auto_210455 ?auto_210456 ) ) ( not ( = ?auto_210455 ?auto_210457 ) ) ( not ( = ?auto_210455 ?auto_210458 ) ) ( not ( = ?auto_210455 ?auto_210459 ) ) ( not ( = ?auto_210455 ?auto_210460 ) ) ( not ( = ?auto_210455 ?auto_210461 ) ) ( not ( = ?auto_210456 ?auto_210457 ) ) ( not ( = ?auto_210456 ?auto_210458 ) ) ( not ( = ?auto_210456 ?auto_210459 ) ) ( not ( = ?auto_210456 ?auto_210460 ) ) ( not ( = ?auto_210456 ?auto_210461 ) ) ( not ( = ?auto_210457 ?auto_210458 ) ) ( not ( = ?auto_210457 ?auto_210459 ) ) ( not ( = ?auto_210457 ?auto_210460 ) ) ( not ( = ?auto_210457 ?auto_210461 ) ) ( not ( = ?auto_210458 ?auto_210459 ) ) ( not ( = ?auto_210458 ?auto_210460 ) ) ( not ( = ?auto_210458 ?auto_210461 ) ) ( not ( = ?auto_210459 ?auto_210460 ) ) ( not ( = ?auto_210459 ?auto_210461 ) ) ( not ( = ?auto_210460 ?auto_210461 ) ) ( not ( = ?auto_210455 ?auto_210463 ) ) ( not ( = ?auto_210456 ?auto_210463 ) ) ( not ( = ?auto_210457 ?auto_210463 ) ) ( not ( = ?auto_210458 ?auto_210463 ) ) ( not ( = ?auto_210459 ?auto_210463 ) ) ( not ( = ?auto_210460 ?auto_210463 ) ) ( not ( = ?auto_210461 ?auto_210463 ) ) ( ON ?auto_210463 ?auto_210462 ) ( not ( = ?auto_210455 ?auto_210462 ) ) ( not ( = ?auto_210456 ?auto_210462 ) ) ( not ( = ?auto_210457 ?auto_210462 ) ) ( not ( = ?auto_210458 ?auto_210462 ) ) ( not ( = ?auto_210459 ?auto_210462 ) ) ( not ( = ?auto_210460 ?auto_210462 ) ) ( not ( = ?auto_210461 ?auto_210462 ) ) ( not ( = ?auto_210463 ?auto_210462 ) ) ( ON ?auto_210461 ?auto_210463 ) ( ON ?auto_210460 ?auto_210461 ) ( ON-TABLE ?auto_210462 ) ( ON ?auto_210459 ?auto_210460 ) ( ON ?auto_210458 ?auto_210459 ) ( CLEAR ?auto_210456 ) ( ON ?auto_210457 ?auto_210458 ) ( CLEAR ?auto_210457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210462 ?auto_210463 ?auto_210461 ?auto_210460 ?auto_210459 ?auto_210458 )
      ( MAKE-6PILE ?auto_210455 ?auto_210456 ?auto_210457 ?auto_210458 ?auto_210459 ?auto_210460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210464 - BLOCK
      ?auto_210465 - BLOCK
      ?auto_210466 - BLOCK
      ?auto_210467 - BLOCK
      ?auto_210468 - BLOCK
      ?auto_210469 - BLOCK
    )
    :vars
    (
      ?auto_210470 - BLOCK
      ?auto_210471 - BLOCK
      ?auto_210472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210464 ) ( not ( = ?auto_210464 ?auto_210465 ) ) ( not ( = ?auto_210464 ?auto_210466 ) ) ( not ( = ?auto_210464 ?auto_210467 ) ) ( not ( = ?auto_210464 ?auto_210468 ) ) ( not ( = ?auto_210464 ?auto_210469 ) ) ( not ( = ?auto_210464 ?auto_210470 ) ) ( not ( = ?auto_210465 ?auto_210466 ) ) ( not ( = ?auto_210465 ?auto_210467 ) ) ( not ( = ?auto_210465 ?auto_210468 ) ) ( not ( = ?auto_210465 ?auto_210469 ) ) ( not ( = ?auto_210465 ?auto_210470 ) ) ( not ( = ?auto_210466 ?auto_210467 ) ) ( not ( = ?auto_210466 ?auto_210468 ) ) ( not ( = ?auto_210466 ?auto_210469 ) ) ( not ( = ?auto_210466 ?auto_210470 ) ) ( not ( = ?auto_210467 ?auto_210468 ) ) ( not ( = ?auto_210467 ?auto_210469 ) ) ( not ( = ?auto_210467 ?auto_210470 ) ) ( not ( = ?auto_210468 ?auto_210469 ) ) ( not ( = ?auto_210468 ?auto_210470 ) ) ( not ( = ?auto_210469 ?auto_210470 ) ) ( not ( = ?auto_210464 ?auto_210471 ) ) ( not ( = ?auto_210465 ?auto_210471 ) ) ( not ( = ?auto_210466 ?auto_210471 ) ) ( not ( = ?auto_210467 ?auto_210471 ) ) ( not ( = ?auto_210468 ?auto_210471 ) ) ( not ( = ?auto_210469 ?auto_210471 ) ) ( not ( = ?auto_210470 ?auto_210471 ) ) ( ON ?auto_210471 ?auto_210472 ) ( not ( = ?auto_210464 ?auto_210472 ) ) ( not ( = ?auto_210465 ?auto_210472 ) ) ( not ( = ?auto_210466 ?auto_210472 ) ) ( not ( = ?auto_210467 ?auto_210472 ) ) ( not ( = ?auto_210468 ?auto_210472 ) ) ( not ( = ?auto_210469 ?auto_210472 ) ) ( not ( = ?auto_210470 ?auto_210472 ) ) ( not ( = ?auto_210471 ?auto_210472 ) ) ( ON ?auto_210470 ?auto_210471 ) ( ON ?auto_210469 ?auto_210470 ) ( ON-TABLE ?auto_210472 ) ( ON ?auto_210468 ?auto_210469 ) ( ON ?auto_210467 ?auto_210468 ) ( ON ?auto_210466 ?auto_210467 ) ( CLEAR ?auto_210466 ) ( HOLDING ?auto_210465 ) ( CLEAR ?auto_210464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210464 ?auto_210465 )
      ( MAKE-6PILE ?auto_210464 ?auto_210465 ?auto_210466 ?auto_210467 ?auto_210468 ?auto_210469 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210473 - BLOCK
      ?auto_210474 - BLOCK
      ?auto_210475 - BLOCK
      ?auto_210476 - BLOCK
      ?auto_210477 - BLOCK
      ?auto_210478 - BLOCK
    )
    :vars
    (
      ?auto_210481 - BLOCK
      ?auto_210479 - BLOCK
      ?auto_210480 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210473 ) ( not ( = ?auto_210473 ?auto_210474 ) ) ( not ( = ?auto_210473 ?auto_210475 ) ) ( not ( = ?auto_210473 ?auto_210476 ) ) ( not ( = ?auto_210473 ?auto_210477 ) ) ( not ( = ?auto_210473 ?auto_210478 ) ) ( not ( = ?auto_210473 ?auto_210481 ) ) ( not ( = ?auto_210474 ?auto_210475 ) ) ( not ( = ?auto_210474 ?auto_210476 ) ) ( not ( = ?auto_210474 ?auto_210477 ) ) ( not ( = ?auto_210474 ?auto_210478 ) ) ( not ( = ?auto_210474 ?auto_210481 ) ) ( not ( = ?auto_210475 ?auto_210476 ) ) ( not ( = ?auto_210475 ?auto_210477 ) ) ( not ( = ?auto_210475 ?auto_210478 ) ) ( not ( = ?auto_210475 ?auto_210481 ) ) ( not ( = ?auto_210476 ?auto_210477 ) ) ( not ( = ?auto_210476 ?auto_210478 ) ) ( not ( = ?auto_210476 ?auto_210481 ) ) ( not ( = ?auto_210477 ?auto_210478 ) ) ( not ( = ?auto_210477 ?auto_210481 ) ) ( not ( = ?auto_210478 ?auto_210481 ) ) ( not ( = ?auto_210473 ?auto_210479 ) ) ( not ( = ?auto_210474 ?auto_210479 ) ) ( not ( = ?auto_210475 ?auto_210479 ) ) ( not ( = ?auto_210476 ?auto_210479 ) ) ( not ( = ?auto_210477 ?auto_210479 ) ) ( not ( = ?auto_210478 ?auto_210479 ) ) ( not ( = ?auto_210481 ?auto_210479 ) ) ( ON ?auto_210479 ?auto_210480 ) ( not ( = ?auto_210473 ?auto_210480 ) ) ( not ( = ?auto_210474 ?auto_210480 ) ) ( not ( = ?auto_210475 ?auto_210480 ) ) ( not ( = ?auto_210476 ?auto_210480 ) ) ( not ( = ?auto_210477 ?auto_210480 ) ) ( not ( = ?auto_210478 ?auto_210480 ) ) ( not ( = ?auto_210481 ?auto_210480 ) ) ( not ( = ?auto_210479 ?auto_210480 ) ) ( ON ?auto_210481 ?auto_210479 ) ( ON ?auto_210478 ?auto_210481 ) ( ON-TABLE ?auto_210480 ) ( ON ?auto_210477 ?auto_210478 ) ( ON ?auto_210476 ?auto_210477 ) ( ON ?auto_210475 ?auto_210476 ) ( CLEAR ?auto_210473 ) ( ON ?auto_210474 ?auto_210475 ) ( CLEAR ?auto_210474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210480 ?auto_210479 ?auto_210481 ?auto_210478 ?auto_210477 ?auto_210476 ?auto_210475 )
      ( MAKE-6PILE ?auto_210473 ?auto_210474 ?auto_210475 ?auto_210476 ?auto_210477 ?auto_210478 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210482 - BLOCK
      ?auto_210483 - BLOCK
      ?auto_210484 - BLOCK
      ?auto_210485 - BLOCK
      ?auto_210486 - BLOCK
      ?auto_210487 - BLOCK
    )
    :vars
    (
      ?auto_210489 - BLOCK
      ?auto_210488 - BLOCK
      ?auto_210490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210482 ?auto_210483 ) ) ( not ( = ?auto_210482 ?auto_210484 ) ) ( not ( = ?auto_210482 ?auto_210485 ) ) ( not ( = ?auto_210482 ?auto_210486 ) ) ( not ( = ?auto_210482 ?auto_210487 ) ) ( not ( = ?auto_210482 ?auto_210489 ) ) ( not ( = ?auto_210483 ?auto_210484 ) ) ( not ( = ?auto_210483 ?auto_210485 ) ) ( not ( = ?auto_210483 ?auto_210486 ) ) ( not ( = ?auto_210483 ?auto_210487 ) ) ( not ( = ?auto_210483 ?auto_210489 ) ) ( not ( = ?auto_210484 ?auto_210485 ) ) ( not ( = ?auto_210484 ?auto_210486 ) ) ( not ( = ?auto_210484 ?auto_210487 ) ) ( not ( = ?auto_210484 ?auto_210489 ) ) ( not ( = ?auto_210485 ?auto_210486 ) ) ( not ( = ?auto_210485 ?auto_210487 ) ) ( not ( = ?auto_210485 ?auto_210489 ) ) ( not ( = ?auto_210486 ?auto_210487 ) ) ( not ( = ?auto_210486 ?auto_210489 ) ) ( not ( = ?auto_210487 ?auto_210489 ) ) ( not ( = ?auto_210482 ?auto_210488 ) ) ( not ( = ?auto_210483 ?auto_210488 ) ) ( not ( = ?auto_210484 ?auto_210488 ) ) ( not ( = ?auto_210485 ?auto_210488 ) ) ( not ( = ?auto_210486 ?auto_210488 ) ) ( not ( = ?auto_210487 ?auto_210488 ) ) ( not ( = ?auto_210489 ?auto_210488 ) ) ( ON ?auto_210488 ?auto_210490 ) ( not ( = ?auto_210482 ?auto_210490 ) ) ( not ( = ?auto_210483 ?auto_210490 ) ) ( not ( = ?auto_210484 ?auto_210490 ) ) ( not ( = ?auto_210485 ?auto_210490 ) ) ( not ( = ?auto_210486 ?auto_210490 ) ) ( not ( = ?auto_210487 ?auto_210490 ) ) ( not ( = ?auto_210489 ?auto_210490 ) ) ( not ( = ?auto_210488 ?auto_210490 ) ) ( ON ?auto_210489 ?auto_210488 ) ( ON ?auto_210487 ?auto_210489 ) ( ON-TABLE ?auto_210490 ) ( ON ?auto_210486 ?auto_210487 ) ( ON ?auto_210485 ?auto_210486 ) ( ON ?auto_210484 ?auto_210485 ) ( ON ?auto_210483 ?auto_210484 ) ( CLEAR ?auto_210483 ) ( HOLDING ?auto_210482 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_210482 )
      ( MAKE-6PILE ?auto_210482 ?auto_210483 ?auto_210484 ?auto_210485 ?auto_210486 ?auto_210487 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_210491 - BLOCK
      ?auto_210492 - BLOCK
      ?auto_210493 - BLOCK
      ?auto_210494 - BLOCK
      ?auto_210495 - BLOCK
      ?auto_210496 - BLOCK
    )
    :vars
    (
      ?auto_210497 - BLOCK
      ?auto_210498 - BLOCK
      ?auto_210499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210491 ?auto_210492 ) ) ( not ( = ?auto_210491 ?auto_210493 ) ) ( not ( = ?auto_210491 ?auto_210494 ) ) ( not ( = ?auto_210491 ?auto_210495 ) ) ( not ( = ?auto_210491 ?auto_210496 ) ) ( not ( = ?auto_210491 ?auto_210497 ) ) ( not ( = ?auto_210492 ?auto_210493 ) ) ( not ( = ?auto_210492 ?auto_210494 ) ) ( not ( = ?auto_210492 ?auto_210495 ) ) ( not ( = ?auto_210492 ?auto_210496 ) ) ( not ( = ?auto_210492 ?auto_210497 ) ) ( not ( = ?auto_210493 ?auto_210494 ) ) ( not ( = ?auto_210493 ?auto_210495 ) ) ( not ( = ?auto_210493 ?auto_210496 ) ) ( not ( = ?auto_210493 ?auto_210497 ) ) ( not ( = ?auto_210494 ?auto_210495 ) ) ( not ( = ?auto_210494 ?auto_210496 ) ) ( not ( = ?auto_210494 ?auto_210497 ) ) ( not ( = ?auto_210495 ?auto_210496 ) ) ( not ( = ?auto_210495 ?auto_210497 ) ) ( not ( = ?auto_210496 ?auto_210497 ) ) ( not ( = ?auto_210491 ?auto_210498 ) ) ( not ( = ?auto_210492 ?auto_210498 ) ) ( not ( = ?auto_210493 ?auto_210498 ) ) ( not ( = ?auto_210494 ?auto_210498 ) ) ( not ( = ?auto_210495 ?auto_210498 ) ) ( not ( = ?auto_210496 ?auto_210498 ) ) ( not ( = ?auto_210497 ?auto_210498 ) ) ( ON ?auto_210498 ?auto_210499 ) ( not ( = ?auto_210491 ?auto_210499 ) ) ( not ( = ?auto_210492 ?auto_210499 ) ) ( not ( = ?auto_210493 ?auto_210499 ) ) ( not ( = ?auto_210494 ?auto_210499 ) ) ( not ( = ?auto_210495 ?auto_210499 ) ) ( not ( = ?auto_210496 ?auto_210499 ) ) ( not ( = ?auto_210497 ?auto_210499 ) ) ( not ( = ?auto_210498 ?auto_210499 ) ) ( ON ?auto_210497 ?auto_210498 ) ( ON ?auto_210496 ?auto_210497 ) ( ON-TABLE ?auto_210499 ) ( ON ?auto_210495 ?auto_210496 ) ( ON ?auto_210494 ?auto_210495 ) ( ON ?auto_210493 ?auto_210494 ) ( ON ?auto_210492 ?auto_210493 ) ( ON ?auto_210491 ?auto_210492 ) ( CLEAR ?auto_210491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210499 ?auto_210498 ?auto_210497 ?auto_210496 ?auto_210495 ?auto_210494 ?auto_210493 ?auto_210492 )
      ( MAKE-6PILE ?auto_210491 ?auto_210492 ?auto_210493 ?auto_210494 ?auto_210495 ?auto_210496 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210502 - BLOCK
      ?auto_210503 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_210503 ) ( CLEAR ?auto_210502 ) ( ON-TABLE ?auto_210502 ) ( not ( = ?auto_210502 ?auto_210503 ) ) )
    :subtasks
    ( ( !STACK ?auto_210503 ?auto_210502 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210504 - BLOCK
      ?auto_210505 - BLOCK
    )
    :vars
    (
      ?auto_210506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_210504 ) ( ON-TABLE ?auto_210504 ) ( not ( = ?auto_210504 ?auto_210505 ) ) ( ON ?auto_210505 ?auto_210506 ) ( CLEAR ?auto_210505 ) ( HAND-EMPTY ) ( not ( = ?auto_210504 ?auto_210506 ) ) ( not ( = ?auto_210505 ?auto_210506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210505 ?auto_210506 )
      ( MAKE-2PILE ?auto_210504 ?auto_210505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210507 - BLOCK
      ?auto_210508 - BLOCK
    )
    :vars
    (
      ?auto_210509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210507 ?auto_210508 ) ) ( ON ?auto_210508 ?auto_210509 ) ( CLEAR ?auto_210508 ) ( not ( = ?auto_210507 ?auto_210509 ) ) ( not ( = ?auto_210508 ?auto_210509 ) ) ( HOLDING ?auto_210507 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_210507 )
      ( MAKE-2PILE ?auto_210507 ?auto_210508 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210510 - BLOCK
      ?auto_210511 - BLOCK
    )
    :vars
    (
      ?auto_210512 - BLOCK
      ?auto_210515 - BLOCK
      ?auto_210517 - BLOCK
      ?auto_210516 - BLOCK
      ?auto_210513 - BLOCK
      ?auto_210514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210510 ?auto_210511 ) ) ( ON ?auto_210511 ?auto_210512 ) ( not ( = ?auto_210510 ?auto_210512 ) ) ( not ( = ?auto_210511 ?auto_210512 ) ) ( ON ?auto_210510 ?auto_210511 ) ( CLEAR ?auto_210510 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210515 ) ( ON ?auto_210517 ?auto_210515 ) ( ON ?auto_210516 ?auto_210517 ) ( ON ?auto_210513 ?auto_210516 ) ( ON ?auto_210514 ?auto_210513 ) ( ON ?auto_210512 ?auto_210514 ) ( not ( = ?auto_210515 ?auto_210517 ) ) ( not ( = ?auto_210515 ?auto_210516 ) ) ( not ( = ?auto_210515 ?auto_210513 ) ) ( not ( = ?auto_210515 ?auto_210514 ) ) ( not ( = ?auto_210515 ?auto_210512 ) ) ( not ( = ?auto_210515 ?auto_210511 ) ) ( not ( = ?auto_210515 ?auto_210510 ) ) ( not ( = ?auto_210517 ?auto_210516 ) ) ( not ( = ?auto_210517 ?auto_210513 ) ) ( not ( = ?auto_210517 ?auto_210514 ) ) ( not ( = ?auto_210517 ?auto_210512 ) ) ( not ( = ?auto_210517 ?auto_210511 ) ) ( not ( = ?auto_210517 ?auto_210510 ) ) ( not ( = ?auto_210516 ?auto_210513 ) ) ( not ( = ?auto_210516 ?auto_210514 ) ) ( not ( = ?auto_210516 ?auto_210512 ) ) ( not ( = ?auto_210516 ?auto_210511 ) ) ( not ( = ?auto_210516 ?auto_210510 ) ) ( not ( = ?auto_210513 ?auto_210514 ) ) ( not ( = ?auto_210513 ?auto_210512 ) ) ( not ( = ?auto_210513 ?auto_210511 ) ) ( not ( = ?auto_210513 ?auto_210510 ) ) ( not ( = ?auto_210514 ?auto_210512 ) ) ( not ( = ?auto_210514 ?auto_210511 ) ) ( not ( = ?auto_210514 ?auto_210510 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210515 ?auto_210517 ?auto_210516 ?auto_210513 ?auto_210514 ?auto_210512 ?auto_210511 )
      ( MAKE-2PILE ?auto_210510 ?auto_210511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210518 - BLOCK
      ?auto_210519 - BLOCK
    )
    :vars
    (
      ?auto_210524 - BLOCK
      ?auto_210525 - BLOCK
      ?auto_210522 - BLOCK
      ?auto_210521 - BLOCK
      ?auto_210520 - BLOCK
      ?auto_210523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210518 ?auto_210519 ) ) ( ON ?auto_210519 ?auto_210524 ) ( not ( = ?auto_210518 ?auto_210524 ) ) ( not ( = ?auto_210519 ?auto_210524 ) ) ( ON-TABLE ?auto_210525 ) ( ON ?auto_210522 ?auto_210525 ) ( ON ?auto_210521 ?auto_210522 ) ( ON ?auto_210520 ?auto_210521 ) ( ON ?auto_210523 ?auto_210520 ) ( ON ?auto_210524 ?auto_210523 ) ( not ( = ?auto_210525 ?auto_210522 ) ) ( not ( = ?auto_210525 ?auto_210521 ) ) ( not ( = ?auto_210525 ?auto_210520 ) ) ( not ( = ?auto_210525 ?auto_210523 ) ) ( not ( = ?auto_210525 ?auto_210524 ) ) ( not ( = ?auto_210525 ?auto_210519 ) ) ( not ( = ?auto_210525 ?auto_210518 ) ) ( not ( = ?auto_210522 ?auto_210521 ) ) ( not ( = ?auto_210522 ?auto_210520 ) ) ( not ( = ?auto_210522 ?auto_210523 ) ) ( not ( = ?auto_210522 ?auto_210524 ) ) ( not ( = ?auto_210522 ?auto_210519 ) ) ( not ( = ?auto_210522 ?auto_210518 ) ) ( not ( = ?auto_210521 ?auto_210520 ) ) ( not ( = ?auto_210521 ?auto_210523 ) ) ( not ( = ?auto_210521 ?auto_210524 ) ) ( not ( = ?auto_210521 ?auto_210519 ) ) ( not ( = ?auto_210521 ?auto_210518 ) ) ( not ( = ?auto_210520 ?auto_210523 ) ) ( not ( = ?auto_210520 ?auto_210524 ) ) ( not ( = ?auto_210520 ?auto_210519 ) ) ( not ( = ?auto_210520 ?auto_210518 ) ) ( not ( = ?auto_210523 ?auto_210524 ) ) ( not ( = ?auto_210523 ?auto_210519 ) ) ( not ( = ?auto_210523 ?auto_210518 ) ) ( HOLDING ?auto_210518 ) ( CLEAR ?auto_210519 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210525 ?auto_210522 ?auto_210521 ?auto_210520 ?auto_210523 ?auto_210524 ?auto_210519 ?auto_210518 )
      ( MAKE-2PILE ?auto_210518 ?auto_210519 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210526 - BLOCK
      ?auto_210527 - BLOCK
    )
    :vars
    (
      ?auto_210532 - BLOCK
      ?auto_210528 - BLOCK
      ?auto_210530 - BLOCK
      ?auto_210529 - BLOCK
      ?auto_210533 - BLOCK
      ?auto_210531 - BLOCK
      ?auto_210534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210526 ?auto_210527 ) ) ( ON ?auto_210527 ?auto_210532 ) ( not ( = ?auto_210526 ?auto_210532 ) ) ( not ( = ?auto_210527 ?auto_210532 ) ) ( ON-TABLE ?auto_210528 ) ( ON ?auto_210530 ?auto_210528 ) ( ON ?auto_210529 ?auto_210530 ) ( ON ?auto_210533 ?auto_210529 ) ( ON ?auto_210531 ?auto_210533 ) ( ON ?auto_210532 ?auto_210531 ) ( not ( = ?auto_210528 ?auto_210530 ) ) ( not ( = ?auto_210528 ?auto_210529 ) ) ( not ( = ?auto_210528 ?auto_210533 ) ) ( not ( = ?auto_210528 ?auto_210531 ) ) ( not ( = ?auto_210528 ?auto_210532 ) ) ( not ( = ?auto_210528 ?auto_210527 ) ) ( not ( = ?auto_210528 ?auto_210526 ) ) ( not ( = ?auto_210530 ?auto_210529 ) ) ( not ( = ?auto_210530 ?auto_210533 ) ) ( not ( = ?auto_210530 ?auto_210531 ) ) ( not ( = ?auto_210530 ?auto_210532 ) ) ( not ( = ?auto_210530 ?auto_210527 ) ) ( not ( = ?auto_210530 ?auto_210526 ) ) ( not ( = ?auto_210529 ?auto_210533 ) ) ( not ( = ?auto_210529 ?auto_210531 ) ) ( not ( = ?auto_210529 ?auto_210532 ) ) ( not ( = ?auto_210529 ?auto_210527 ) ) ( not ( = ?auto_210529 ?auto_210526 ) ) ( not ( = ?auto_210533 ?auto_210531 ) ) ( not ( = ?auto_210533 ?auto_210532 ) ) ( not ( = ?auto_210533 ?auto_210527 ) ) ( not ( = ?auto_210533 ?auto_210526 ) ) ( not ( = ?auto_210531 ?auto_210532 ) ) ( not ( = ?auto_210531 ?auto_210527 ) ) ( not ( = ?auto_210531 ?auto_210526 ) ) ( CLEAR ?auto_210527 ) ( ON ?auto_210526 ?auto_210534 ) ( CLEAR ?auto_210526 ) ( HAND-EMPTY ) ( not ( = ?auto_210526 ?auto_210534 ) ) ( not ( = ?auto_210527 ?auto_210534 ) ) ( not ( = ?auto_210532 ?auto_210534 ) ) ( not ( = ?auto_210528 ?auto_210534 ) ) ( not ( = ?auto_210530 ?auto_210534 ) ) ( not ( = ?auto_210529 ?auto_210534 ) ) ( not ( = ?auto_210533 ?auto_210534 ) ) ( not ( = ?auto_210531 ?auto_210534 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210526 ?auto_210534 )
      ( MAKE-2PILE ?auto_210526 ?auto_210527 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210535 - BLOCK
      ?auto_210536 - BLOCK
    )
    :vars
    (
      ?auto_210540 - BLOCK
      ?auto_210539 - BLOCK
      ?auto_210541 - BLOCK
      ?auto_210543 - BLOCK
      ?auto_210537 - BLOCK
      ?auto_210538 - BLOCK
      ?auto_210542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210535 ?auto_210536 ) ) ( not ( = ?auto_210535 ?auto_210540 ) ) ( not ( = ?auto_210536 ?auto_210540 ) ) ( ON-TABLE ?auto_210539 ) ( ON ?auto_210541 ?auto_210539 ) ( ON ?auto_210543 ?auto_210541 ) ( ON ?auto_210537 ?auto_210543 ) ( ON ?auto_210538 ?auto_210537 ) ( ON ?auto_210540 ?auto_210538 ) ( not ( = ?auto_210539 ?auto_210541 ) ) ( not ( = ?auto_210539 ?auto_210543 ) ) ( not ( = ?auto_210539 ?auto_210537 ) ) ( not ( = ?auto_210539 ?auto_210538 ) ) ( not ( = ?auto_210539 ?auto_210540 ) ) ( not ( = ?auto_210539 ?auto_210536 ) ) ( not ( = ?auto_210539 ?auto_210535 ) ) ( not ( = ?auto_210541 ?auto_210543 ) ) ( not ( = ?auto_210541 ?auto_210537 ) ) ( not ( = ?auto_210541 ?auto_210538 ) ) ( not ( = ?auto_210541 ?auto_210540 ) ) ( not ( = ?auto_210541 ?auto_210536 ) ) ( not ( = ?auto_210541 ?auto_210535 ) ) ( not ( = ?auto_210543 ?auto_210537 ) ) ( not ( = ?auto_210543 ?auto_210538 ) ) ( not ( = ?auto_210543 ?auto_210540 ) ) ( not ( = ?auto_210543 ?auto_210536 ) ) ( not ( = ?auto_210543 ?auto_210535 ) ) ( not ( = ?auto_210537 ?auto_210538 ) ) ( not ( = ?auto_210537 ?auto_210540 ) ) ( not ( = ?auto_210537 ?auto_210536 ) ) ( not ( = ?auto_210537 ?auto_210535 ) ) ( not ( = ?auto_210538 ?auto_210540 ) ) ( not ( = ?auto_210538 ?auto_210536 ) ) ( not ( = ?auto_210538 ?auto_210535 ) ) ( ON ?auto_210535 ?auto_210542 ) ( CLEAR ?auto_210535 ) ( not ( = ?auto_210535 ?auto_210542 ) ) ( not ( = ?auto_210536 ?auto_210542 ) ) ( not ( = ?auto_210540 ?auto_210542 ) ) ( not ( = ?auto_210539 ?auto_210542 ) ) ( not ( = ?auto_210541 ?auto_210542 ) ) ( not ( = ?auto_210543 ?auto_210542 ) ) ( not ( = ?auto_210537 ?auto_210542 ) ) ( not ( = ?auto_210538 ?auto_210542 ) ) ( HOLDING ?auto_210536 ) ( CLEAR ?auto_210540 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210539 ?auto_210541 ?auto_210543 ?auto_210537 ?auto_210538 ?auto_210540 ?auto_210536 )
      ( MAKE-2PILE ?auto_210535 ?auto_210536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210544 - BLOCK
      ?auto_210545 - BLOCK
    )
    :vars
    (
      ?auto_210547 - BLOCK
      ?auto_210549 - BLOCK
      ?auto_210548 - BLOCK
      ?auto_210551 - BLOCK
      ?auto_210552 - BLOCK
      ?auto_210550 - BLOCK
      ?auto_210546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210544 ?auto_210545 ) ) ( not ( = ?auto_210544 ?auto_210547 ) ) ( not ( = ?auto_210545 ?auto_210547 ) ) ( ON-TABLE ?auto_210549 ) ( ON ?auto_210548 ?auto_210549 ) ( ON ?auto_210551 ?auto_210548 ) ( ON ?auto_210552 ?auto_210551 ) ( ON ?auto_210550 ?auto_210552 ) ( ON ?auto_210547 ?auto_210550 ) ( not ( = ?auto_210549 ?auto_210548 ) ) ( not ( = ?auto_210549 ?auto_210551 ) ) ( not ( = ?auto_210549 ?auto_210552 ) ) ( not ( = ?auto_210549 ?auto_210550 ) ) ( not ( = ?auto_210549 ?auto_210547 ) ) ( not ( = ?auto_210549 ?auto_210545 ) ) ( not ( = ?auto_210549 ?auto_210544 ) ) ( not ( = ?auto_210548 ?auto_210551 ) ) ( not ( = ?auto_210548 ?auto_210552 ) ) ( not ( = ?auto_210548 ?auto_210550 ) ) ( not ( = ?auto_210548 ?auto_210547 ) ) ( not ( = ?auto_210548 ?auto_210545 ) ) ( not ( = ?auto_210548 ?auto_210544 ) ) ( not ( = ?auto_210551 ?auto_210552 ) ) ( not ( = ?auto_210551 ?auto_210550 ) ) ( not ( = ?auto_210551 ?auto_210547 ) ) ( not ( = ?auto_210551 ?auto_210545 ) ) ( not ( = ?auto_210551 ?auto_210544 ) ) ( not ( = ?auto_210552 ?auto_210550 ) ) ( not ( = ?auto_210552 ?auto_210547 ) ) ( not ( = ?auto_210552 ?auto_210545 ) ) ( not ( = ?auto_210552 ?auto_210544 ) ) ( not ( = ?auto_210550 ?auto_210547 ) ) ( not ( = ?auto_210550 ?auto_210545 ) ) ( not ( = ?auto_210550 ?auto_210544 ) ) ( ON ?auto_210544 ?auto_210546 ) ( not ( = ?auto_210544 ?auto_210546 ) ) ( not ( = ?auto_210545 ?auto_210546 ) ) ( not ( = ?auto_210547 ?auto_210546 ) ) ( not ( = ?auto_210549 ?auto_210546 ) ) ( not ( = ?auto_210548 ?auto_210546 ) ) ( not ( = ?auto_210551 ?auto_210546 ) ) ( not ( = ?auto_210552 ?auto_210546 ) ) ( not ( = ?auto_210550 ?auto_210546 ) ) ( CLEAR ?auto_210547 ) ( ON ?auto_210545 ?auto_210544 ) ( CLEAR ?auto_210545 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210546 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210546 ?auto_210544 )
      ( MAKE-2PILE ?auto_210544 ?auto_210545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210553 - BLOCK
      ?auto_210554 - BLOCK
    )
    :vars
    (
      ?auto_210558 - BLOCK
      ?auto_210561 - BLOCK
      ?auto_210560 - BLOCK
      ?auto_210555 - BLOCK
      ?auto_210556 - BLOCK
      ?auto_210559 - BLOCK
      ?auto_210557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210553 ?auto_210554 ) ) ( not ( = ?auto_210553 ?auto_210558 ) ) ( not ( = ?auto_210554 ?auto_210558 ) ) ( ON-TABLE ?auto_210561 ) ( ON ?auto_210560 ?auto_210561 ) ( ON ?auto_210555 ?auto_210560 ) ( ON ?auto_210556 ?auto_210555 ) ( ON ?auto_210559 ?auto_210556 ) ( not ( = ?auto_210561 ?auto_210560 ) ) ( not ( = ?auto_210561 ?auto_210555 ) ) ( not ( = ?auto_210561 ?auto_210556 ) ) ( not ( = ?auto_210561 ?auto_210559 ) ) ( not ( = ?auto_210561 ?auto_210558 ) ) ( not ( = ?auto_210561 ?auto_210554 ) ) ( not ( = ?auto_210561 ?auto_210553 ) ) ( not ( = ?auto_210560 ?auto_210555 ) ) ( not ( = ?auto_210560 ?auto_210556 ) ) ( not ( = ?auto_210560 ?auto_210559 ) ) ( not ( = ?auto_210560 ?auto_210558 ) ) ( not ( = ?auto_210560 ?auto_210554 ) ) ( not ( = ?auto_210560 ?auto_210553 ) ) ( not ( = ?auto_210555 ?auto_210556 ) ) ( not ( = ?auto_210555 ?auto_210559 ) ) ( not ( = ?auto_210555 ?auto_210558 ) ) ( not ( = ?auto_210555 ?auto_210554 ) ) ( not ( = ?auto_210555 ?auto_210553 ) ) ( not ( = ?auto_210556 ?auto_210559 ) ) ( not ( = ?auto_210556 ?auto_210558 ) ) ( not ( = ?auto_210556 ?auto_210554 ) ) ( not ( = ?auto_210556 ?auto_210553 ) ) ( not ( = ?auto_210559 ?auto_210558 ) ) ( not ( = ?auto_210559 ?auto_210554 ) ) ( not ( = ?auto_210559 ?auto_210553 ) ) ( ON ?auto_210553 ?auto_210557 ) ( not ( = ?auto_210553 ?auto_210557 ) ) ( not ( = ?auto_210554 ?auto_210557 ) ) ( not ( = ?auto_210558 ?auto_210557 ) ) ( not ( = ?auto_210561 ?auto_210557 ) ) ( not ( = ?auto_210560 ?auto_210557 ) ) ( not ( = ?auto_210555 ?auto_210557 ) ) ( not ( = ?auto_210556 ?auto_210557 ) ) ( not ( = ?auto_210559 ?auto_210557 ) ) ( ON ?auto_210554 ?auto_210553 ) ( CLEAR ?auto_210554 ) ( ON-TABLE ?auto_210557 ) ( HOLDING ?auto_210558 ) ( CLEAR ?auto_210559 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210561 ?auto_210560 ?auto_210555 ?auto_210556 ?auto_210559 ?auto_210558 )
      ( MAKE-2PILE ?auto_210553 ?auto_210554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210562 - BLOCK
      ?auto_210563 - BLOCK
    )
    :vars
    (
      ?auto_210566 - BLOCK
      ?auto_210569 - BLOCK
      ?auto_210568 - BLOCK
      ?auto_210570 - BLOCK
      ?auto_210565 - BLOCK
      ?auto_210567 - BLOCK
      ?auto_210564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210562 ?auto_210563 ) ) ( not ( = ?auto_210562 ?auto_210566 ) ) ( not ( = ?auto_210563 ?auto_210566 ) ) ( ON-TABLE ?auto_210569 ) ( ON ?auto_210568 ?auto_210569 ) ( ON ?auto_210570 ?auto_210568 ) ( ON ?auto_210565 ?auto_210570 ) ( ON ?auto_210567 ?auto_210565 ) ( not ( = ?auto_210569 ?auto_210568 ) ) ( not ( = ?auto_210569 ?auto_210570 ) ) ( not ( = ?auto_210569 ?auto_210565 ) ) ( not ( = ?auto_210569 ?auto_210567 ) ) ( not ( = ?auto_210569 ?auto_210566 ) ) ( not ( = ?auto_210569 ?auto_210563 ) ) ( not ( = ?auto_210569 ?auto_210562 ) ) ( not ( = ?auto_210568 ?auto_210570 ) ) ( not ( = ?auto_210568 ?auto_210565 ) ) ( not ( = ?auto_210568 ?auto_210567 ) ) ( not ( = ?auto_210568 ?auto_210566 ) ) ( not ( = ?auto_210568 ?auto_210563 ) ) ( not ( = ?auto_210568 ?auto_210562 ) ) ( not ( = ?auto_210570 ?auto_210565 ) ) ( not ( = ?auto_210570 ?auto_210567 ) ) ( not ( = ?auto_210570 ?auto_210566 ) ) ( not ( = ?auto_210570 ?auto_210563 ) ) ( not ( = ?auto_210570 ?auto_210562 ) ) ( not ( = ?auto_210565 ?auto_210567 ) ) ( not ( = ?auto_210565 ?auto_210566 ) ) ( not ( = ?auto_210565 ?auto_210563 ) ) ( not ( = ?auto_210565 ?auto_210562 ) ) ( not ( = ?auto_210567 ?auto_210566 ) ) ( not ( = ?auto_210567 ?auto_210563 ) ) ( not ( = ?auto_210567 ?auto_210562 ) ) ( ON ?auto_210562 ?auto_210564 ) ( not ( = ?auto_210562 ?auto_210564 ) ) ( not ( = ?auto_210563 ?auto_210564 ) ) ( not ( = ?auto_210566 ?auto_210564 ) ) ( not ( = ?auto_210569 ?auto_210564 ) ) ( not ( = ?auto_210568 ?auto_210564 ) ) ( not ( = ?auto_210570 ?auto_210564 ) ) ( not ( = ?auto_210565 ?auto_210564 ) ) ( not ( = ?auto_210567 ?auto_210564 ) ) ( ON ?auto_210563 ?auto_210562 ) ( ON-TABLE ?auto_210564 ) ( CLEAR ?auto_210567 ) ( ON ?auto_210566 ?auto_210563 ) ( CLEAR ?auto_210566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210564 ?auto_210562 ?auto_210563 )
      ( MAKE-2PILE ?auto_210562 ?auto_210563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210571 - BLOCK
      ?auto_210572 - BLOCK
    )
    :vars
    (
      ?auto_210573 - BLOCK
      ?auto_210579 - BLOCK
      ?auto_210578 - BLOCK
      ?auto_210577 - BLOCK
      ?auto_210574 - BLOCK
      ?auto_210575 - BLOCK
      ?auto_210576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210571 ?auto_210572 ) ) ( not ( = ?auto_210571 ?auto_210573 ) ) ( not ( = ?auto_210572 ?auto_210573 ) ) ( ON-TABLE ?auto_210579 ) ( ON ?auto_210578 ?auto_210579 ) ( ON ?auto_210577 ?auto_210578 ) ( ON ?auto_210574 ?auto_210577 ) ( not ( = ?auto_210579 ?auto_210578 ) ) ( not ( = ?auto_210579 ?auto_210577 ) ) ( not ( = ?auto_210579 ?auto_210574 ) ) ( not ( = ?auto_210579 ?auto_210575 ) ) ( not ( = ?auto_210579 ?auto_210573 ) ) ( not ( = ?auto_210579 ?auto_210572 ) ) ( not ( = ?auto_210579 ?auto_210571 ) ) ( not ( = ?auto_210578 ?auto_210577 ) ) ( not ( = ?auto_210578 ?auto_210574 ) ) ( not ( = ?auto_210578 ?auto_210575 ) ) ( not ( = ?auto_210578 ?auto_210573 ) ) ( not ( = ?auto_210578 ?auto_210572 ) ) ( not ( = ?auto_210578 ?auto_210571 ) ) ( not ( = ?auto_210577 ?auto_210574 ) ) ( not ( = ?auto_210577 ?auto_210575 ) ) ( not ( = ?auto_210577 ?auto_210573 ) ) ( not ( = ?auto_210577 ?auto_210572 ) ) ( not ( = ?auto_210577 ?auto_210571 ) ) ( not ( = ?auto_210574 ?auto_210575 ) ) ( not ( = ?auto_210574 ?auto_210573 ) ) ( not ( = ?auto_210574 ?auto_210572 ) ) ( not ( = ?auto_210574 ?auto_210571 ) ) ( not ( = ?auto_210575 ?auto_210573 ) ) ( not ( = ?auto_210575 ?auto_210572 ) ) ( not ( = ?auto_210575 ?auto_210571 ) ) ( ON ?auto_210571 ?auto_210576 ) ( not ( = ?auto_210571 ?auto_210576 ) ) ( not ( = ?auto_210572 ?auto_210576 ) ) ( not ( = ?auto_210573 ?auto_210576 ) ) ( not ( = ?auto_210579 ?auto_210576 ) ) ( not ( = ?auto_210578 ?auto_210576 ) ) ( not ( = ?auto_210577 ?auto_210576 ) ) ( not ( = ?auto_210574 ?auto_210576 ) ) ( not ( = ?auto_210575 ?auto_210576 ) ) ( ON ?auto_210572 ?auto_210571 ) ( ON-TABLE ?auto_210576 ) ( ON ?auto_210573 ?auto_210572 ) ( CLEAR ?auto_210573 ) ( HOLDING ?auto_210575 ) ( CLEAR ?auto_210574 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210579 ?auto_210578 ?auto_210577 ?auto_210574 ?auto_210575 )
      ( MAKE-2PILE ?auto_210571 ?auto_210572 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210580 - BLOCK
      ?auto_210581 - BLOCK
    )
    :vars
    (
      ?auto_210587 - BLOCK
      ?auto_210588 - BLOCK
      ?auto_210586 - BLOCK
      ?auto_210583 - BLOCK
      ?auto_210585 - BLOCK
      ?auto_210582 - BLOCK
      ?auto_210584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210580 ?auto_210581 ) ) ( not ( = ?auto_210580 ?auto_210587 ) ) ( not ( = ?auto_210581 ?auto_210587 ) ) ( ON-TABLE ?auto_210588 ) ( ON ?auto_210586 ?auto_210588 ) ( ON ?auto_210583 ?auto_210586 ) ( ON ?auto_210585 ?auto_210583 ) ( not ( = ?auto_210588 ?auto_210586 ) ) ( not ( = ?auto_210588 ?auto_210583 ) ) ( not ( = ?auto_210588 ?auto_210585 ) ) ( not ( = ?auto_210588 ?auto_210582 ) ) ( not ( = ?auto_210588 ?auto_210587 ) ) ( not ( = ?auto_210588 ?auto_210581 ) ) ( not ( = ?auto_210588 ?auto_210580 ) ) ( not ( = ?auto_210586 ?auto_210583 ) ) ( not ( = ?auto_210586 ?auto_210585 ) ) ( not ( = ?auto_210586 ?auto_210582 ) ) ( not ( = ?auto_210586 ?auto_210587 ) ) ( not ( = ?auto_210586 ?auto_210581 ) ) ( not ( = ?auto_210586 ?auto_210580 ) ) ( not ( = ?auto_210583 ?auto_210585 ) ) ( not ( = ?auto_210583 ?auto_210582 ) ) ( not ( = ?auto_210583 ?auto_210587 ) ) ( not ( = ?auto_210583 ?auto_210581 ) ) ( not ( = ?auto_210583 ?auto_210580 ) ) ( not ( = ?auto_210585 ?auto_210582 ) ) ( not ( = ?auto_210585 ?auto_210587 ) ) ( not ( = ?auto_210585 ?auto_210581 ) ) ( not ( = ?auto_210585 ?auto_210580 ) ) ( not ( = ?auto_210582 ?auto_210587 ) ) ( not ( = ?auto_210582 ?auto_210581 ) ) ( not ( = ?auto_210582 ?auto_210580 ) ) ( ON ?auto_210580 ?auto_210584 ) ( not ( = ?auto_210580 ?auto_210584 ) ) ( not ( = ?auto_210581 ?auto_210584 ) ) ( not ( = ?auto_210587 ?auto_210584 ) ) ( not ( = ?auto_210588 ?auto_210584 ) ) ( not ( = ?auto_210586 ?auto_210584 ) ) ( not ( = ?auto_210583 ?auto_210584 ) ) ( not ( = ?auto_210585 ?auto_210584 ) ) ( not ( = ?auto_210582 ?auto_210584 ) ) ( ON ?auto_210581 ?auto_210580 ) ( ON-TABLE ?auto_210584 ) ( ON ?auto_210587 ?auto_210581 ) ( CLEAR ?auto_210585 ) ( ON ?auto_210582 ?auto_210587 ) ( CLEAR ?auto_210582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210584 ?auto_210580 ?auto_210581 ?auto_210587 )
      ( MAKE-2PILE ?auto_210580 ?auto_210581 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210589 - BLOCK
      ?auto_210590 - BLOCK
    )
    :vars
    (
      ?auto_210594 - BLOCK
      ?auto_210596 - BLOCK
      ?auto_210593 - BLOCK
      ?auto_210592 - BLOCK
      ?auto_210591 - BLOCK
      ?auto_210597 - BLOCK
      ?auto_210595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210589 ?auto_210590 ) ) ( not ( = ?auto_210589 ?auto_210594 ) ) ( not ( = ?auto_210590 ?auto_210594 ) ) ( ON-TABLE ?auto_210596 ) ( ON ?auto_210593 ?auto_210596 ) ( ON ?auto_210592 ?auto_210593 ) ( not ( = ?auto_210596 ?auto_210593 ) ) ( not ( = ?auto_210596 ?auto_210592 ) ) ( not ( = ?auto_210596 ?auto_210591 ) ) ( not ( = ?auto_210596 ?auto_210597 ) ) ( not ( = ?auto_210596 ?auto_210594 ) ) ( not ( = ?auto_210596 ?auto_210590 ) ) ( not ( = ?auto_210596 ?auto_210589 ) ) ( not ( = ?auto_210593 ?auto_210592 ) ) ( not ( = ?auto_210593 ?auto_210591 ) ) ( not ( = ?auto_210593 ?auto_210597 ) ) ( not ( = ?auto_210593 ?auto_210594 ) ) ( not ( = ?auto_210593 ?auto_210590 ) ) ( not ( = ?auto_210593 ?auto_210589 ) ) ( not ( = ?auto_210592 ?auto_210591 ) ) ( not ( = ?auto_210592 ?auto_210597 ) ) ( not ( = ?auto_210592 ?auto_210594 ) ) ( not ( = ?auto_210592 ?auto_210590 ) ) ( not ( = ?auto_210592 ?auto_210589 ) ) ( not ( = ?auto_210591 ?auto_210597 ) ) ( not ( = ?auto_210591 ?auto_210594 ) ) ( not ( = ?auto_210591 ?auto_210590 ) ) ( not ( = ?auto_210591 ?auto_210589 ) ) ( not ( = ?auto_210597 ?auto_210594 ) ) ( not ( = ?auto_210597 ?auto_210590 ) ) ( not ( = ?auto_210597 ?auto_210589 ) ) ( ON ?auto_210589 ?auto_210595 ) ( not ( = ?auto_210589 ?auto_210595 ) ) ( not ( = ?auto_210590 ?auto_210595 ) ) ( not ( = ?auto_210594 ?auto_210595 ) ) ( not ( = ?auto_210596 ?auto_210595 ) ) ( not ( = ?auto_210593 ?auto_210595 ) ) ( not ( = ?auto_210592 ?auto_210595 ) ) ( not ( = ?auto_210591 ?auto_210595 ) ) ( not ( = ?auto_210597 ?auto_210595 ) ) ( ON ?auto_210590 ?auto_210589 ) ( ON-TABLE ?auto_210595 ) ( ON ?auto_210594 ?auto_210590 ) ( ON ?auto_210597 ?auto_210594 ) ( CLEAR ?auto_210597 ) ( HOLDING ?auto_210591 ) ( CLEAR ?auto_210592 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210596 ?auto_210593 ?auto_210592 ?auto_210591 )
      ( MAKE-2PILE ?auto_210589 ?auto_210590 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210598 - BLOCK
      ?auto_210599 - BLOCK
    )
    :vars
    (
      ?auto_210601 - BLOCK
      ?auto_210606 - BLOCK
      ?auto_210602 - BLOCK
      ?auto_210603 - BLOCK
      ?auto_210600 - BLOCK
      ?auto_210605 - BLOCK
      ?auto_210604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210598 ?auto_210599 ) ) ( not ( = ?auto_210598 ?auto_210601 ) ) ( not ( = ?auto_210599 ?auto_210601 ) ) ( ON-TABLE ?auto_210606 ) ( ON ?auto_210602 ?auto_210606 ) ( ON ?auto_210603 ?auto_210602 ) ( not ( = ?auto_210606 ?auto_210602 ) ) ( not ( = ?auto_210606 ?auto_210603 ) ) ( not ( = ?auto_210606 ?auto_210600 ) ) ( not ( = ?auto_210606 ?auto_210605 ) ) ( not ( = ?auto_210606 ?auto_210601 ) ) ( not ( = ?auto_210606 ?auto_210599 ) ) ( not ( = ?auto_210606 ?auto_210598 ) ) ( not ( = ?auto_210602 ?auto_210603 ) ) ( not ( = ?auto_210602 ?auto_210600 ) ) ( not ( = ?auto_210602 ?auto_210605 ) ) ( not ( = ?auto_210602 ?auto_210601 ) ) ( not ( = ?auto_210602 ?auto_210599 ) ) ( not ( = ?auto_210602 ?auto_210598 ) ) ( not ( = ?auto_210603 ?auto_210600 ) ) ( not ( = ?auto_210603 ?auto_210605 ) ) ( not ( = ?auto_210603 ?auto_210601 ) ) ( not ( = ?auto_210603 ?auto_210599 ) ) ( not ( = ?auto_210603 ?auto_210598 ) ) ( not ( = ?auto_210600 ?auto_210605 ) ) ( not ( = ?auto_210600 ?auto_210601 ) ) ( not ( = ?auto_210600 ?auto_210599 ) ) ( not ( = ?auto_210600 ?auto_210598 ) ) ( not ( = ?auto_210605 ?auto_210601 ) ) ( not ( = ?auto_210605 ?auto_210599 ) ) ( not ( = ?auto_210605 ?auto_210598 ) ) ( ON ?auto_210598 ?auto_210604 ) ( not ( = ?auto_210598 ?auto_210604 ) ) ( not ( = ?auto_210599 ?auto_210604 ) ) ( not ( = ?auto_210601 ?auto_210604 ) ) ( not ( = ?auto_210606 ?auto_210604 ) ) ( not ( = ?auto_210602 ?auto_210604 ) ) ( not ( = ?auto_210603 ?auto_210604 ) ) ( not ( = ?auto_210600 ?auto_210604 ) ) ( not ( = ?auto_210605 ?auto_210604 ) ) ( ON ?auto_210599 ?auto_210598 ) ( ON-TABLE ?auto_210604 ) ( ON ?auto_210601 ?auto_210599 ) ( ON ?auto_210605 ?auto_210601 ) ( CLEAR ?auto_210603 ) ( ON ?auto_210600 ?auto_210605 ) ( CLEAR ?auto_210600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210604 ?auto_210598 ?auto_210599 ?auto_210601 ?auto_210605 )
      ( MAKE-2PILE ?auto_210598 ?auto_210599 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210607 - BLOCK
      ?auto_210608 - BLOCK
    )
    :vars
    (
      ?auto_210609 - BLOCK
      ?auto_210611 - BLOCK
      ?auto_210613 - BLOCK
      ?auto_210614 - BLOCK
      ?auto_210610 - BLOCK
      ?auto_210615 - BLOCK
      ?auto_210612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210607 ?auto_210608 ) ) ( not ( = ?auto_210607 ?auto_210609 ) ) ( not ( = ?auto_210608 ?auto_210609 ) ) ( ON-TABLE ?auto_210611 ) ( ON ?auto_210613 ?auto_210611 ) ( not ( = ?auto_210611 ?auto_210613 ) ) ( not ( = ?auto_210611 ?auto_210614 ) ) ( not ( = ?auto_210611 ?auto_210610 ) ) ( not ( = ?auto_210611 ?auto_210615 ) ) ( not ( = ?auto_210611 ?auto_210609 ) ) ( not ( = ?auto_210611 ?auto_210608 ) ) ( not ( = ?auto_210611 ?auto_210607 ) ) ( not ( = ?auto_210613 ?auto_210614 ) ) ( not ( = ?auto_210613 ?auto_210610 ) ) ( not ( = ?auto_210613 ?auto_210615 ) ) ( not ( = ?auto_210613 ?auto_210609 ) ) ( not ( = ?auto_210613 ?auto_210608 ) ) ( not ( = ?auto_210613 ?auto_210607 ) ) ( not ( = ?auto_210614 ?auto_210610 ) ) ( not ( = ?auto_210614 ?auto_210615 ) ) ( not ( = ?auto_210614 ?auto_210609 ) ) ( not ( = ?auto_210614 ?auto_210608 ) ) ( not ( = ?auto_210614 ?auto_210607 ) ) ( not ( = ?auto_210610 ?auto_210615 ) ) ( not ( = ?auto_210610 ?auto_210609 ) ) ( not ( = ?auto_210610 ?auto_210608 ) ) ( not ( = ?auto_210610 ?auto_210607 ) ) ( not ( = ?auto_210615 ?auto_210609 ) ) ( not ( = ?auto_210615 ?auto_210608 ) ) ( not ( = ?auto_210615 ?auto_210607 ) ) ( ON ?auto_210607 ?auto_210612 ) ( not ( = ?auto_210607 ?auto_210612 ) ) ( not ( = ?auto_210608 ?auto_210612 ) ) ( not ( = ?auto_210609 ?auto_210612 ) ) ( not ( = ?auto_210611 ?auto_210612 ) ) ( not ( = ?auto_210613 ?auto_210612 ) ) ( not ( = ?auto_210614 ?auto_210612 ) ) ( not ( = ?auto_210610 ?auto_210612 ) ) ( not ( = ?auto_210615 ?auto_210612 ) ) ( ON ?auto_210608 ?auto_210607 ) ( ON-TABLE ?auto_210612 ) ( ON ?auto_210609 ?auto_210608 ) ( ON ?auto_210615 ?auto_210609 ) ( ON ?auto_210610 ?auto_210615 ) ( CLEAR ?auto_210610 ) ( HOLDING ?auto_210614 ) ( CLEAR ?auto_210613 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210611 ?auto_210613 ?auto_210614 )
      ( MAKE-2PILE ?auto_210607 ?auto_210608 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210616 - BLOCK
      ?auto_210617 - BLOCK
    )
    :vars
    (
      ?auto_210623 - BLOCK
      ?auto_210621 - BLOCK
      ?auto_210622 - BLOCK
      ?auto_210624 - BLOCK
      ?auto_210618 - BLOCK
      ?auto_210620 - BLOCK
      ?auto_210619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210616 ?auto_210617 ) ) ( not ( = ?auto_210616 ?auto_210623 ) ) ( not ( = ?auto_210617 ?auto_210623 ) ) ( ON-TABLE ?auto_210621 ) ( ON ?auto_210622 ?auto_210621 ) ( not ( = ?auto_210621 ?auto_210622 ) ) ( not ( = ?auto_210621 ?auto_210624 ) ) ( not ( = ?auto_210621 ?auto_210618 ) ) ( not ( = ?auto_210621 ?auto_210620 ) ) ( not ( = ?auto_210621 ?auto_210623 ) ) ( not ( = ?auto_210621 ?auto_210617 ) ) ( not ( = ?auto_210621 ?auto_210616 ) ) ( not ( = ?auto_210622 ?auto_210624 ) ) ( not ( = ?auto_210622 ?auto_210618 ) ) ( not ( = ?auto_210622 ?auto_210620 ) ) ( not ( = ?auto_210622 ?auto_210623 ) ) ( not ( = ?auto_210622 ?auto_210617 ) ) ( not ( = ?auto_210622 ?auto_210616 ) ) ( not ( = ?auto_210624 ?auto_210618 ) ) ( not ( = ?auto_210624 ?auto_210620 ) ) ( not ( = ?auto_210624 ?auto_210623 ) ) ( not ( = ?auto_210624 ?auto_210617 ) ) ( not ( = ?auto_210624 ?auto_210616 ) ) ( not ( = ?auto_210618 ?auto_210620 ) ) ( not ( = ?auto_210618 ?auto_210623 ) ) ( not ( = ?auto_210618 ?auto_210617 ) ) ( not ( = ?auto_210618 ?auto_210616 ) ) ( not ( = ?auto_210620 ?auto_210623 ) ) ( not ( = ?auto_210620 ?auto_210617 ) ) ( not ( = ?auto_210620 ?auto_210616 ) ) ( ON ?auto_210616 ?auto_210619 ) ( not ( = ?auto_210616 ?auto_210619 ) ) ( not ( = ?auto_210617 ?auto_210619 ) ) ( not ( = ?auto_210623 ?auto_210619 ) ) ( not ( = ?auto_210621 ?auto_210619 ) ) ( not ( = ?auto_210622 ?auto_210619 ) ) ( not ( = ?auto_210624 ?auto_210619 ) ) ( not ( = ?auto_210618 ?auto_210619 ) ) ( not ( = ?auto_210620 ?auto_210619 ) ) ( ON ?auto_210617 ?auto_210616 ) ( ON-TABLE ?auto_210619 ) ( ON ?auto_210623 ?auto_210617 ) ( ON ?auto_210620 ?auto_210623 ) ( ON ?auto_210618 ?auto_210620 ) ( CLEAR ?auto_210622 ) ( ON ?auto_210624 ?auto_210618 ) ( CLEAR ?auto_210624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210619 ?auto_210616 ?auto_210617 ?auto_210623 ?auto_210620 ?auto_210618 )
      ( MAKE-2PILE ?auto_210616 ?auto_210617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210625 - BLOCK
      ?auto_210626 - BLOCK
    )
    :vars
    (
      ?auto_210630 - BLOCK
      ?auto_210633 - BLOCK
      ?auto_210628 - BLOCK
      ?auto_210631 - BLOCK
      ?auto_210627 - BLOCK
      ?auto_210632 - BLOCK
      ?auto_210629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210625 ?auto_210626 ) ) ( not ( = ?auto_210625 ?auto_210630 ) ) ( not ( = ?auto_210626 ?auto_210630 ) ) ( ON-TABLE ?auto_210633 ) ( not ( = ?auto_210633 ?auto_210628 ) ) ( not ( = ?auto_210633 ?auto_210631 ) ) ( not ( = ?auto_210633 ?auto_210627 ) ) ( not ( = ?auto_210633 ?auto_210632 ) ) ( not ( = ?auto_210633 ?auto_210630 ) ) ( not ( = ?auto_210633 ?auto_210626 ) ) ( not ( = ?auto_210633 ?auto_210625 ) ) ( not ( = ?auto_210628 ?auto_210631 ) ) ( not ( = ?auto_210628 ?auto_210627 ) ) ( not ( = ?auto_210628 ?auto_210632 ) ) ( not ( = ?auto_210628 ?auto_210630 ) ) ( not ( = ?auto_210628 ?auto_210626 ) ) ( not ( = ?auto_210628 ?auto_210625 ) ) ( not ( = ?auto_210631 ?auto_210627 ) ) ( not ( = ?auto_210631 ?auto_210632 ) ) ( not ( = ?auto_210631 ?auto_210630 ) ) ( not ( = ?auto_210631 ?auto_210626 ) ) ( not ( = ?auto_210631 ?auto_210625 ) ) ( not ( = ?auto_210627 ?auto_210632 ) ) ( not ( = ?auto_210627 ?auto_210630 ) ) ( not ( = ?auto_210627 ?auto_210626 ) ) ( not ( = ?auto_210627 ?auto_210625 ) ) ( not ( = ?auto_210632 ?auto_210630 ) ) ( not ( = ?auto_210632 ?auto_210626 ) ) ( not ( = ?auto_210632 ?auto_210625 ) ) ( ON ?auto_210625 ?auto_210629 ) ( not ( = ?auto_210625 ?auto_210629 ) ) ( not ( = ?auto_210626 ?auto_210629 ) ) ( not ( = ?auto_210630 ?auto_210629 ) ) ( not ( = ?auto_210633 ?auto_210629 ) ) ( not ( = ?auto_210628 ?auto_210629 ) ) ( not ( = ?auto_210631 ?auto_210629 ) ) ( not ( = ?auto_210627 ?auto_210629 ) ) ( not ( = ?auto_210632 ?auto_210629 ) ) ( ON ?auto_210626 ?auto_210625 ) ( ON-TABLE ?auto_210629 ) ( ON ?auto_210630 ?auto_210626 ) ( ON ?auto_210632 ?auto_210630 ) ( ON ?auto_210627 ?auto_210632 ) ( ON ?auto_210631 ?auto_210627 ) ( CLEAR ?auto_210631 ) ( HOLDING ?auto_210628 ) ( CLEAR ?auto_210633 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210633 ?auto_210628 )
      ( MAKE-2PILE ?auto_210625 ?auto_210626 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210634 - BLOCK
      ?auto_210635 - BLOCK
    )
    :vars
    (
      ?auto_210641 - BLOCK
      ?auto_210638 - BLOCK
      ?auto_210640 - BLOCK
      ?auto_210636 - BLOCK
      ?auto_210642 - BLOCK
      ?auto_210637 - BLOCK
      ?auto_210639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210634 ?auto_210635 ) ) ( not ( = ?auto_210634 ?auto_210641 ) ) ( not ( = ?auto_210635 ?auto_210641 ) ) ( ON-TABLE ?auto_210638 ) ( not ( = ?auto_210638 ?auto_210640 ) ) ( not ( = ?auto_210638 ?auto_210636 ) ) ( not ( = ?auto_210638 ?auto_210642 ) ) ( not ( = ?auto_210638 ?auto_210637 ) ) ( not ( = ?auto_210638 ?auto_210641 ) ) ( not ( = ?auto_210638 ?auto_210635 ) ) ( not ( = ?auto_210638 ?auto_210634 ) ) ( not ( = ?auto_210640 ?auto_210636 ) ) ( not ( = ?auto_210640 ?auto_210642 ) ) ( not ( = ?auto_210640 ?auto_210637 ) ) ( not ( = ?auto_210640 ?auto_210641 ) ) ( not ( = ?auto_210640 ?auto_210635 ) ) ( not ( = ?auto_210640 ?auto_210634 ) ) ( not ( = ?auto_210636 ?auto_210642 ) ) ( not ( = ?auto_210636 ?auto_210637 ) ) ( not ( = ?auto_210636 ?auto_210641 ) ) ( not ( = ?auto_210636 ?auto_210635 ) ) ( not ( = ?auto_210636 ?auto_210634 ) ) ( not ( = ?auto_210642 ?auto_210637 ) ) ( not ( = ?auto_210642 ?auto_210641 ) ) ( not ( = ?auto_210642 ?auto_210635 ) ) ( not ( = ?auto_210642 ?auto_210634 ) ) ( not ( = ?auto_210637 ?auto_210641 ) ) ( not ( = ?auto_210637 ?auto_210635 ) ) ( not ( = ?auto_210637 ?auto_210634 ) ) ( ON ?auto_210634 ?auto_210639 ) ( not ( = ?auto_210634 ?auto_210639 ) ) ( not ( = ?auto_210635 ?auto_210639 ) ) ( not ( = ?auto_210641 ?auto_210639 ) ) ( not ( = ?auto_210638 ?auto_210639 ) ) ( not ( = ?auto_210640 ?auto_210639 ) ) ( not ( = ?auto_210636 ?auto_210639 ) ) ( not ( = ?auto_210642 ?auto_210639 ) ) ( not ( = ?auto_210637 ?auto_210639 ) ) ( ON ?auto_210635 ?auto_210634 ) ( ON-TABLE ?auto_210639 ) ( ON ?auto_210641 ?auto_210635 ) ( ON ?auto_210637 ?auto_210641 ) ( ON ?auto_210642 ?auto_210637 ) ( ON ?auto_210636 ?auto_210642 ) ( CLEAR ?auto_210638 ) ( ON ?auto_210640 ?auto_210636 ) ( CLEAR ?auto_210640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210639 ?auto_210634 ?auto_210635 ?auto_210641 ?auto_210637 ?auto_210642 ?auto_210636 )
      ( MAKE-2PILE ?auto_210634 ?auto_210635 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210643 - BLOCK
      ?auto_210644 - BLOCK
    )
    :vars
    (
      ?auto_210649 - BLOCK
      ?auto_210647 - BLOCK
      ?auto_210646 - BLOCK
      ?auto_210645 - BLOCK
      ?auto_210650 - BLOCK
      ?auto_210648 - BLOCK
      ?auto_210651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210643 ?auto_210644 ) ) ( not ( = ?auto_210643 ?auto_210649 ) ) ( not ( = ?auto_210644 ?auto_210649 ) ) ( not ( = ?auto_210647 ?auto_210646 ) ) ( not ( = ?auto_210647 ?auto_210645 ) ) ( not ( = ?auto_210647 ?auto_210650 ) ) ( not ( = ?auto_210647 ?auto_210648 ) ) ( not ( = ?auto_210647 ?auto_210649 ) ) ( not ( = ?auto_210647 ?auto_210644 ) ) ( not ( = ?auto_210647 ?auto_210643 ) ) ( not ( = ?auto_210646 ?auto_210645 ) ) ( not ( = ?auto_210646 ?auto_210650 ) ) ( not ( = ?auto_210646 ?auto_210648 ) ) ( not ( = ?auto_210646 ?auto_210649 ) ) ( not ( = ?auto_210646 ?auto_210644 ) ) ( not ( = ?auto_210646 ?auto_210643 ) ) ( not ( = ?auto_210645 ?auto_210650 ) ) ( not ( = ?auto_210645 ?auto_210648 ) ) ( not ( = ?auto_210645 ?auto_210649 ) ) ( not ( = ?auto_210645 ?auto_210644 ) ) ( not ( = ?auto_210645 ?auto_210643 ) ) ( not ( = ?auto_210650 ?auto_210648 ) ) ( not ( = ?auto_210650 ?auto_210649 ) ) ( not ( = ?auto_210650 ?auto_210644 ) ) ( not ( = ?auto_210650 ?auto_210643 ) ) ( not ( = ?auto_210648 ?auto_210649 ) ) ( not ( = ?auto_210648 ?auto_210644 ) ) ( not ( = ?auto_210648 ?auto_210643 ) ) ( ON ?auto_210643 ?auto_210651 ) ( not ( = ?auto_210643 ?auto_210651 ) ) ( not ( = ?auto_210644 ?auto_210651 ) ) ( not ( = ?auto_210649 ?auto_210651 ) ) ( not ( = ?auto_210647 ?auto_210651 ) ) ( not ( = ?auto_210646 ?auto_210651 ) ) ( not ( = ?auto_210645 ?auto_210651 ) ) ( not ( = ?auto_210650 ?auto_210651 ) ) ( not ( = ?auto_210648 ?auto_210651 ) ) ( ON ?auto_210644 ?auto_210643 ) ( ON-TABLE ?auto_210651 ) ( ON ?auto_210649 ?auto_210644 ) ( ON ?auto_210648 ?auto_210649 ) ( ON ?auto_210650 ?auto_210648 ) ( ON ?auto_210645 ?auto_210650 ) ( ON ?auto_210646 ?auto_210645 ) ( CLEAR ?auto_210646 ) ( HOLDING ?auto_210647 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_210647 )
      ( MAKE-2PILE ?auto_210643 ?auto_210644 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_210652 - BLOCK
      ?auto_210653 - BLOCK
    )
    :vars
    (
      ?auto_210655 - BLOCK
      ?auto_210659 - BLOCK
      ?auto_210656 - BLOCK
      ?auto_210658 - BLOCK
      ?auto_210657 - BLOCK
      ?auto_210660 - BLOCK
      ?auto_210654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210652 ?auto_210653 ) ) ( not ( = ?auto_210652 ?auto_210655 ) ) ( not ( = ?auto_210653 ?auto_210655 ) ) ( not ( = ?auto_210659 ?auto_210656 ) ) ( not ( = ?auto_210659 ?auto_210658 ) ) ( not ( = ?auto_210659 ?auto_210657 ) ) ( not ( = ?auto_210659 ?auto_210660 ) ) ( not ( = ?auto_210659 ?auto_210655 ) ) ( not ( = ?auto_210659 ?auto_210653 ) ) ( not ( = ?auto_210659 ?auto_210652 ) ) ( not ( = ?auto_210656 ?auto_210658 ) ) ( not ( = ?auto_210656 ?auto_210657 ) ) ( not ( = ?auto_210656 ?auto_210660 ) ) ( not ( = ?auto_210656 ?auto_210655 ) ) ( not ( = ?auto_210656 ?auto_210653 ) ) ( not ( = ?auto_210656 ?auto_210652 ) ) ( not ( = ?auto_210658 ?auto_210657 ) ) ( not ( = ?auto_210658 ?auto_210660 ) ) ( not ( = ?auto_210658 ?auto_210655 ) ) ( not ( = ?auto_210658 ?auto_210653 ) ) ( not ( = ?auto_210658 ?auto_210652 ) ) ( not ( = ?auto_210657 ?auto_210660 ) ) ( not ( = ?auto_210657 ?auto_210655 ) ) ( not ( = ?auto_210657 ?auto_210653 ) ) ( not ( = ?auto_210657 ?auto_210652 ) ) ( not ( = ?auto_210660 ?auto_210655 ) ) ( not ( = ?auto_210660 ?auto_210653 ) ) ( not ( = ?auto_210660 ?auto_210652 ) ) ( ON ?auto_210652 ?auto_210654 ) ( not ( = ?auto_210652 ?auto_210654 ) ) ( not ( = ?auto_210653 ?auto_210654 ) ) ( not ( = ?auto_210655 ?auto_210654 ) ) ( not ( = ?auto_210659 ?auto_210654 ) ) ( not ( = ?auto_210656 ?auto_210654 ) ) ( not ( = ?auto_210658 ?auto_210654 ) ) ( not ( = ?auto_210657 ?auto_210654 ) ) ( not ( = ?auto_210660 ?auto_210654 ) ) ( ON ?auto_210653 ?auto_210652 ) ( ON-TABLE ?auto_210654 ) ( ON ?auto_210655 ?auto_210653 ) ( ON ?auto_210660 ?auto_210655 ) ( ON ?auto_210657 ?auto_210660 ) ( ON ?auto_210658 ?auto_210657 ) ( ON ?auto_210656 ?auto_210658 ) ( ON ?auto_210659 ?auto_210656 ) ( CLEAR ?auto_210659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210654 ?auto_210652 ?auto_210653 ?auto_210655 ?auto_210660 ?auto_210657 ?auto_210658 ?auto_210656 )
      ( MAKE-2PILE ?auto_210652 ?auto_210653 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210666 - BLOCK
      ?auto_210667 - BLOCK
      ?auto_210668 - BLOCK
      ?auto_210669 - BLOCK
      ?auto_210670 - BLOCK
    )
    :vars
    (
      ?auto_210671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210671 ?auto_210670 ) ( CLEAR ?auto_210671 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210666 ) ( ON ?auto_210667 ?auto_210666 ) ( ON ?auto_210668 ?auto_210667 ) ( ON ?auto_210669 ?auto_210668 ) ( ON ?auto_210670 ?auto_210669 ) ( not ( = ?auto_210666 ?auto_210667 ) ) ( not ( = ?auto_210666 ?auto_210668 ) ) ( not ( = ?auto_210666 ?auto_210669 ) ) ( not ( = ?auto_210666 ?auto_210670 ) ) ( not ( = ?auto_210666 ?auto_210671 ) ) ( not ( = ?auto_210667 ?auto_210668 ) ) ( not ( = ?auto_210667 ?auto_210669 ) ) ( not ( = ?auto_210667 ?auto_210670 ) ) ( not ( = ?auto_210667 ?auto_210671 ) ) ( not ( = ?auto_210668 ?auto_210669 ) ) ( not ( = ?auto_210668 ?auto_210670 ) ) ( not ( = ?auto_210668 ?auto_210671 ) ) ( not ( = ?auto_210669 ?auto_210670 ) ) ( not ( = ?auto_210669 ?auto_210671 ) ) ( not ( = ?auto_210670 ?auto_210671 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210671 ?auto_210670 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210672 - BLOCK
      ?auto_210673 - BLOCK
      ?auto_210674 - BLOCK
      ?auto_210675 - BLOCK
      ?auto_210676 - BLOCK
    )
    :vars
    (
      ?auto_210677 - BLOCK
      ?auto_210678 - BLOCK
      ?auto_210679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210677 ?auto_210676 ) ( CLEAR ?auto_210677 ) ( ON-TABLE ?auto_210672 ) ( ON ?auto_210673 ?auto_210672 ) ( ON ?auto_210674 ?auto_210673 ) ( ON ?auto_210675 ?auto_210674 ) ( ON ?auto_210676 ?auto_210675 ) ( not ( = ?auto_210672 ?auto_210673 ) ) ( not ( = ?auto_210672 ?auto_210674 ) ) ( not ( = ?auto_210672 ?auto_210675 ) ) ( not ( = ?auto_210672 ?auto_210676 ) ) ( not ( = ?auto_210672 ?auto_210677 ) ) ( not ( = ?auto_210673 ?auto_210674 ) ) ( not ( = ?auto_210673 ?auto_210675 ) ) ( not ( = ?auto_210673 ?auto_210676 ) ) ( not ( = ?auto_210673 ?auto_210677 ) ) ( not ( = ?auto_210674 ?auto_210675 ) ) ( not ( = ?auto_210674 ?auto_210676 ) ) ( not ( = ?auto_210674 ?auto_210677 ) ) ( not ( = ?auto_210675 ?auto_210676 ) ) ( not ( = ?auto_210675 ?auto_210677 ) ) ( not ( = ?auto_210676 ?auto_210677 ) ) ( HOLDING ?auto_210678 ) ( CLEAR ?auto_210679 ) ( not ( = ?auto_210672 ?auto_210678 ) ) ( not ( = ?auto_210672 ?auto_210679 ) ) ( not ( = ?auto_210673 ?auto_210678 ) ) ( not ( = ?auto_210673 ?auto_210679 ) ) ( not ( = ?auto_210674 ?auto_210678 ) ) ( not ( = ?auto_210674 ?auto_210679 ) ) ( not ( = ?auto_210675 ?auto_210678 ) ) ( not ( = ?auto_210675 ?auto_210679 ) ) ( not ( = ?auto_210676 ?auto_210678 ) ) ( not ( = ?auto_210676 ?auto_210679 ) ) ( not ( = ?auto_210677 ?auto_210678 ) ) ( not ( = ?auto_210677 ?auto_210679 ) ) ( not ( = ?auto_210678 ?auto_210679 ) ) )
    :subtasks
    ( ( !STACK ?auto_210678 ?auto_210679 )
      ( MAKE-5PILE ?auto_210672 ?auto_210673 ?auto_210674 ?auto_210675 ?auto_210676 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210680 - BLOCK
      ?auto_210681 - BLOCK
      ?auto_210682 - BLOCK
      ?auto_210683 - BLOCK
      ?auto_210684 - BLOCK
    )
    :vars
    (
      ?auto_210685 - BLOCK
      ?auto_210687 - BLOCK
      ?auto_210686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210685 ?auto_210684 ) ( ON-TABLE ?auto_210680 ) ( ON ?auto_210681 ?auto_210680 ) ( ON ?auto_210682 ?auto_210681 ) ( ON ?auto_210683 ?auto_210682 ) ( ON ?auto_210684 ?auto_210683 ) ( not ( = ?auto_210680 ?auto_210681 ) ) ( not ( = ?auto_210680 ?auto_210682 ) ) ( not ( = ?auto_210680 ?auto_210683 ) ) ( not ( = ?auto_210680 ?auto_210684 ) ) ( not ( = ?auto_210680 ?auto_210685 ) ) ( not ( = ?auto_210681 ?auto_210682 ) ) ( not ( = ?auto_210681 ?auto_210683 ) ) ( not ( = ?auto_210681 ?auto_210684 ) ) ( not ( = ?auto_210681 ?auto_210685 ) ) ( not ( = ?auto_210682 ?auto_210683 ) ) ( not ( = ?auto_210682 ?auto_210684 ) ) ( not ( = ?auto_210682 ?auto_210685 ) ) ( not ( = ?auto_210683 ?auto_210684 ) ) ( not ( = ?auto_210683 ?auto_210685 ) ) ( not ( = ?auto_210684 ?auto_210685 ) ) ( CLEAR ?auto_210687 ) ( not ( = ?auto_210680 ?auto_210686 ) ) ( not ( = ?auto_210680 ?auto_210687 ) ) ( not ( = ?auto_210681 ?auto_210686 ) ) ( not ( = ?auto_210681 ?auto_210687 ) ) ( not ( = ?auto_210682 ?auto_210686 ) ) ( not ( = ?auto_210682 ?auto_210687 ) ) ( not ( = ?auto_210683 ?auto_210686 ) ) ( not ( = ?auto_210683 ?auto_210687 ) ) ( not ( = ?auto_210684 ?auto_210686 ) ) ( not ( = ?auto_210684 ?auto_210687 ) ) ( not ( = ?auto_210685 ?auto_210686 ) ) ( not ( = ?auto_210685 ?auto_210687 ) ) ( not ( = ?auto_210686 ?auto_210687 ) ) ( ON ?auto_210686 ?auto_210685 ) ( CLEAR ?auto_210686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210680 ?auto_210681 ?auto_210682 ?auto_210683 ?auto_210684 ?auto_210685 )
      ( MAKE-5PILE ?auto_210680 ?auto_210681 ?auto_210682 ?auto_210683 ?auto_210684 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210688 - BLOCK
      ?auto_210689 - BLOCK
      ?auto_210690 - BLOCK
      ?auto_210691 - BLOCK
      ?auto_210692 - BLOCK
    )
    :vars
    (
      ?auto_210694 - BLOCK
      ?auto_210695 - BLOCK
      ?auto_210693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210694 ?auto_210692 ) ( ON-TABLE ?auto_210688 ) ( ON ?auto_210689 ?auto_210688 ) ( ON ?auto_210690 ?auto_210689 ) ( ON ?auto_210691 ?auto_210690 ) ( ON ?auto_210692 ?auto_210691 ) ( not ( = ?auto_210688 ?auto_210689 ) ) ( not ( = ?auto_210688 ?auto_210690 ) ) ( not ( = ?auto_210688 ?auto_210691 ) ) ( not ( = ?auto_210688 ?auto_210692 ) ) ( not ( = ?auto_210688 ?auto_210694 ) ) ( not ( = ?auto_210689 ?auto_210690 ) ) ( not ( = ?auto_210689 ?auto_210691 ) ) ( not ( = ?auto_210689 ?auto_210692 ) ) ( not ( = ?auto_210689 ?auto_210694 ) ) ( not ( = ?auto_210690 ?auto_210691 ) ) ( not ( = ?auto_210690 ?auto_210692 ) ) ( not ( = ?auto_210690 ?auto_210694 ) ) ( not ( = ?auto_210691 ?auto_210692 ) ) ( not ( = ?auto_210691 ?auto_210694 ) ) ( not ( = ?auto_210692 ?auto_210694 ) ) ( not ( = ?auto_210688 ?auto_210695 ) ) ( not ( = ?auto_210688 ?auto_210693 ) ) ( not ( = ?auto_210689 ?auto_210695 ) ) ( not ( = ?auto_210689 ?auto_210693 ) ) ( not ( = ?auto_210690 ?auto_210695 ) ) ( not ( = ?auto_210690 ?auto_210693 ) ) ( not ( = ?auto_210691 ?auto_210695 ) ) ( not ( = ?auto_210691 ?auto_210693 ) ) ( not ( = ?auto_210692 ?auto_210695 ) ) ( not ( = ?auto_210692 ?auto_210693 ) ) ( not ( = ?auto_210694 ?auto_210695 ) ) ( not ( = ?auto_210694 ?auto_210693 ) ) ( not ( = ?auto_210695 ?auto_210693 ) ) ( ON ?auto_210695 ?auto_210694 ) ( CLEAR ?auto_210695 ) ( HOLDING ?auto_210693 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_210693 )
      ( MAKE-5PILE ?auto_210688 ?auto_210689 ?auto_210690 ?auto_210691 ?auto_210692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210696 - BLOCK
      ?auto_210697 - BLOCK
      ?auto_210698 - BLOCK
      ?auto_210699 - BLOCK
      ?auto_210700 - BLOCK
    )
    :vars
    (
      ?auto_210703 - BLOCK
      ?auto_210701 - BLOCK
      ?auto_210702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210703 ?auto_210700 ) ( ON-TABLE ?auto_210696 ) ( ON ?auto_210697 ?auto_210696 ) ( ON ?auto_210698 ?auto_210697 ) ( ON ?auto_210699 ?auto_210698 ) ( ON ?auto_210700 ?auto_210699 ) ( not ( = ?auto_210696 ?auto_210697 ) ) ( not ( = ?auto_210696 ?auto_210698 ) ) ( not ( = ?auto_210696 ?auto_210699 ) ) ( not ( = ?auto_210696 ?auto_210700 ) ) ( not ( = ?auto_210696 ?auto_210703 ) ) ( not ( = ?auto_210697 ?auto_210698 ) ) ( not ( = ?auto_210697 ?auto_210699 ) ) ( not ( = ?auto_210697 ?auto_210700 ) ) ( not ( = ?auto_210697 ?auto_210703 ) ) ( not ( = ?auto_210698 ?auto_210699 ) ) ( not ( = ?auto_210698 ?auto_210700 ) ) ( not ( = ?auto_210698 ?auto_210703 ) ) ( not ( = ?auto_210699 ?auto_210700 ) ) ( not ( = ?auto_210699 ?auto_210703 ) ) ( not ( = ?auto_210700 ?auto_210703 ) ) ( not ( = ?auto_210696 ?auto_210701 ) ) ( not ( = ?auto_210696 ?auto_210702 ) ) ( not ( = ?auto_210697 ?auto_210701 ) ) ( not ( = ?auto_210697 ?auto_210702 ) ) ( not ( = ?auto_210698 ?auto_210701 ) ) ( not ( = ?auto_210698 ?auto_210702 ) ) ( not ( = ?auto_210699 ?auto_210701 ) ) ( not ( = ?auto_210699 ?auto_210702 ) ) ( not ( = ?auto_210700 ?auto_210701 ) ) ( not ( = ?auto_210700 ?auto_210702 ) ) ( not ( = ?auto_210703 ?auto_210701 ) ) ( not ( = ?auto_210703 ?auto_210702 ) ) ( not ( = ?auto_210701 ?auto_210702 ) ) ( ON ?auto_210701 ?auto_210703 ) ( ON ?auto_210702 ?auto_210701 ) ( CLEAR ?auto_210702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210696 ?auto_210697 ?auto_210698 ?auto_210699 ?auto_210700 ?auto_210703 ?auto_210701 )
      ( MAKE-5PILE ?auto_210696 ?auto_210697 ?auto_210698 ?auto_210699 ?auto_210700 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210704 - BLOCK
      ?auto_210705 - BLOCK
      ?auto_210706 - BLOCK
      ?auto_210707 - BLOCK
      ?auto_210708 - BLOCK
    )
    :vars
    (
      ?auto_210711 - BLOCK
      ?auto_210710 - BLOCK
      ?auto_210709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210711 ?auto_210708 ) ( ON-TABLE ?auto_210704 ) ( ON ?auto_210705 ?auto_210704 ) ( ON ?auto_210706 ?auto_210705 ) ( ON ?auto_210707 ?auto_210706 ) ( ON ?auto_210708 ?auto_210707 ) ( not ( = ?auto_210704 ?auto_210705 ) ) ( not ( = ?auto_210704 ?auto_210706 ) ) ( not ( = ?auto_210704 ?auto_210707 ) ) ( not ( = ?auto_210704 ?auto_210708 ) ) ( not ( = ?auto_210704 ?auto_210711 ) ) ( not ( = ?auto_210705 ?auto_210706 ) ) ( not ( = ?auto_210705 ?auto_210707 ) ) ( not ( = ?auto_210705 ?auto_210708 ) ) ( not ( = ?auto_210705 ?auto_210711 ) ) ( not ( = ?auto_210706 ?auto_210707 ) ) ( not ( = ?auto_210706 ?auto_210708 ) ) ( not ( = ?auto_210706 ?auto_210711 ) ) ( not ( = ?auto_210707 ?auto_210708 ) ) ( not ( = ?auto_210707 ?auto_210711 ) ) ( not ( = ?auto_210708 ?auto_210711 ) ) ( not ( = ?auto_210704 ?auto_210710 ) ) ( not ( = ?auto_210704 ?auto_210709 ) ) ( not ( = ?auto_210705 ?auto_210710 ) ) ( not ( = ?auto_210705 ?auto_210709 ) ) ( not ( = ?auto_210706 ?auto_210710 ) ) ( not ( = ?auto_210706 ?auto_210709 ) ) ( not ( = ?auto_210707 ?auto_210710 ) ) ( not ( = ?auto_210707 ?auto_210709 ) ) ( not ( = ?auto_210708 ?auto_210710 ) ) ( not ( = ?auto_210708 ?auto_210709 ) ) ( not ( = ?auto_210711 ?auto_210710 ) ) ( not ( = ?auto_210711 ?auto_210709 ) ) ( not ( = ?auto_210710 ?auto_210709 ) ) ( ON ?auto_210710 ?auto_210711 ) ( HOLDING ?auto_210709 ) ( CLEAR ?auto_210710 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210704 ?auto_210705 ?auto_210706 ?auto_210707 ?auto_210708 ?auto_210711 ?auto_210710 ?auto_210709 )
      ( MAKE-5PILE ?auto_210704 ?auto_210705 ?auto_210706 ?auto_210707 ?auto_210708 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210712 - BLOCK
      ?auto_210713 - BLOCK
      ?auto_210714 - BLOCK
      ?auto_210715 - BLOCK
      ?auto_210716 - BLOCK
    )
    :vars
    (
      ?auto_210719 - BLOCK
      ?auto_210718 - BLOCK
      ?auto_210717 - BLOCK
      ?auto_210720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210719 ?auto_210716 ) ( ON-TABLE ?auto_210712 ) ( ON ?auto_210713 ?auto_210712 ) ( ON ?auto_210714 ?auto_210713 ) ( ON ?auto_210715 ?auto_210714 ) ( ON ?auto_210716 ?auto_210715 ) ( not ( = ?auto_210712 ?auto_210713 ) ) ( not ( = ?auto_210712 ?auto_210714 ) ) ( not ( = ?auto_210712 ?auto_210715 ) ) ( not ( = ?auto_210712 ?auto_210716 ) ) ( not ( = ?auto_210712 ?auto_210719 ) ) ( not ( = ?auto_210713 ?auto_210714 ) ) ( not ( = ?auto_210713 ?auto_210715 ) ) ( not ( = ?auto_210713 ?auto_210716 ) ) ( not ( = ?auto_210713 ?auto_210719 ) ) ( not ( = ?auto_210714 ?auto_210715 ) ) ( not ( = ?auto_210714 ?auto_210716 ) ) ( not ( = ?auto_210714 ?auto_210719 ) ) ( not ( = ?auto_210715 ?auto_210716 ) ) ( not ( = ?auto_210715 ?auto_210719 ) ) ( not ( = ?auto_210716 ?auto_210719 ) ) ( not ( = ?auto_210712 ?auto_210718 ) ) ( not ( = ?auto_210712 ?auto_210717 ) ) ( not ( = ?auto_210713 ?auto_210718 ) ) ( not ( = ?auto_210713 ?auto_210717 ) ) ( not ( = ?auto_210714 ?auto_210718 ) ) ( not ( = ?auto_210714 ?auto_210717 ) ) ( not ( = ?auto_210715 ?auto_210718 ) ) ( not ( = ?auto_210715 ?auto_210717 ) ) ( not ( = ?auto_210716 ?auto_210718 ) ) ( not ( = ?auto_210716 ?auto_210717 ) ) ( not ( = ?auto_210719 ?auto_210718 ) ) ( not ( = ?auto_210719 ?auto_210717 ) ) ( not ( = ?auto_210718 ?auto_210717 ) ) ( ON ?auto_210718 ?auto_210719 ) ( CLEAR ?auto_210718 ) ( ON ?auto_210717 ?auto_210720 ) ( CLEAR ?auto_210717 ) ( HAND-EMPTY ) ( not ( = ?auto_210712 ?auto_210720 ) ) ( not ( = ?auto_210713 ?auto_210720 ) ) ( not ( = ?auto_210714 ?auto_210720 ) ) ( not ( = ?auto_210715 ?auto_210720 ) ) ( not ( = ?auto_210716 ?auto_210720 ) ) ( not ( = ?auto_210719 ?auto_210720 ) ) ( not ( = ?auto_210718 ?auto_210720 ) ) ( not ( = ?auto_210717 ?auto_210720 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210717 ?auto_210720 )
      ( MAKE-5PILE ?auto_210712 ?auto_210713 ?auto_210714 ?auto_210715 ?auto_210716 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210721 - BLOCK
      ?auto_210722 - BLOCK
      ?auto_210723 - BLOCK
      ?auto_210724 - BLOCK
      ?auto_210725 - BLOCK
    )
    :vars
    (
      ?auto_210727 - BLOCK
      ?auto_210729 - BLOCK
      ?auto_210728 - BLOCK
      ?auto_210726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210727 ?auto_210725 ) ( ON-TABLE ?auto_210721 ) ( ON ?auto_210722 ?auto_210721 ) ( ON ?auto_210723 ?auto_210722 ) ( ON ?auto_210724 ?auto_210723 ) ( ON ?auto_210725 ?auto_210724 ) ( not ( = ?auto_210721 ?auto_210722 ) ) ( not ( = ?auto_210721 ?auto_210723 ) ) ( not ( = ?auto_210721 ?auto_210724 ) ) ( not ( = ?auto_210721 ?auto_210725 ) ) ( not ( = ?auto_210721 ?auto_210727 ) ) ( not ( = ?auto_210722 ?auto_210723 ) ) ( not ( = ?auto_210722 ?auto_210724 ) ) ( not ( = ?auto_210722 ?auto_210725 ) ) ( not ( = ?auto_210722 ?auto_210727 ) ) ( not ( = ?auto_210723 ?auto_210724 ) ) ( not ( = ?auto_210723 ?auto_210725 ) ) ( not ( = ?auto_210723 ?auto_210727 ) ) ( not ( = ?auto_210724 ?auto_210725 ) ) ( not ( = ?auto_210724 ?auto_210727 ) ) ( not ( = ?auto_210725 ?auto_210727 ) ) ( not ( = ?auto_210721 ?auto_210729 ) ) ( not ( = ?auto_210721 ?auto_210728 ) ) ( not ( = ?auto_210722 ?auto_210729 ) ) ( not ( = ?auto_210722 ?auto_210728 ) ) ( not ( = ?auto_210723 ?auto_210729 ) ) ( not ( = ?auto_210723 ?auto_210728 ) ) ( not ( = ?auto_210724 ?auto_210729 ) ) ( not ( = ?auto_210724 ?auto_210728 ) ) ( not ( = ?auto_210725 ?auto_210729 ) ) ( not ( = ?auto_210725 ?auto_210728 ) ) ( not ( = ?auto_210727 ?auto_210729 ) ) ( not ( = ?auto_210727 ?auto_210728 ) ) ( not ( = ?auto_210729 ?auto_210728 ) ) ( ON ?auto_210728 ?auto_210726 ) ( CLEAR ?auto_210728 ) ( not ( = ?auto_210721 ?auto_210726 ) ) ( not ( = ?auto_210722 ?auto_210726 ) ) ( not ( = ?auto_210723 ?auto_210726 ) ) ( not ( = ?auto_210724 ?auto_210726 ) ) ( not ( = ?auto_210725 ?auto_210726 ) ) ( not ( = ?auto_210727 ?auto_210726 ) ) ( not ( = ?auto_210729 ?auto_210726 ) ) ( not ( = ?auto_210728 ?auto_210726 ) ) ( HOLDING ?auto_210729 ) ( CLEAR ?auto_210727 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210721 ?auto_210722 ?auto_210723 ?auto_210724 ?auto_210725 ?auto_210727 ?auto_210729 )
      ( MAKE-5PILE ?auto_210721 ?auto_210722 ?auto_210723 ?auto_210724 ?auto_210725 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210730 - BLOCK
      ?auto_210731 - BLOCK
      ?auto_210732 - BLOCK
      ?auto_210733 - BLOCK
      ?auto_210734 - BLOCK
    )
    :vars
    (
      ?auto_210738 - BLOCK
      ?auto_210735 - BLOCK
      ?auto_210737 - BLOCK
      ?auto_210736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210738 ?auto_210734 ) ( ON-TABLE ?auto_210730 ) ( ON ?auto_210731 ?auto_210730 ) ( ON ?auto_210732 ?auto_210731 ) ( ON ?auto_210733 ?auto_210732 ) ( ON ?auto_210734 ?auto_210733 ) ( not ( = ?auto_210730 ?auto_210731 ) ) ( not ( = ?auto_210730 ?auto_210732 ) ) ( not ( = ?auto_210730 ?auto_210733 ) ) ( not ( = ?auto_210730 ?auto_210734 ) ) ( not ( = ?auto_210730 ?auto_210738 ) ) ( not ( = ?auto_210731 ?auto_210732 ) ) ( not ( = ?auto_210731 ?auto_210733 ) ) ( not ( = ?auto_210731 ?auto_210734 ) ) ( not ( = ?auto_210731 ?auto_210738 ) ) ( not ( = ?auto_210732 ?auto_210733 ) ) ( not ( = ?auto_210732 ?auto_210734 ) ) ( not ( = ?auto_210732 ?auto_210738 ) ) ( not ( = ?auto_210733 ?auto_210734 ) ) ( not ( = ?auto_210733 ?auto_210738 ) ) ( not ( = ?auto_210734 ?auto_210738 ) ) ( not ( = ?auto_210730 ?auto_210735 ) ) ( not ( = ?auto_210730 ?auto_210737 ) ) ( not ( = ?auto_210731 ?auto_210735 ) ) ( not ( = ?auto_210731 ?auto_210737 ) ) ( not ( = ?auto_210732 ?auto_210735 ) ) ( not ( = ?auto_210732 ?auto_210737 ) ) ( not ( = ?auto_210733 ?auto_210735 ) ) ( not ( = ?auto_210733 ?auto_210737 ) ) ( not ( = ?auto_210734 ?auto_210735 ) ) ( not ( = ?auto_210734 ?auto_210737 ) ) ( not ( = ?auto_210738 ?auto_210735 ) ) ( not ( = ?auto_210738 ?auto_210737 ) ) ( not ( = ?auto_210735 ?auto_210737 ) ) ( ON ?auto_210737 ?auto_210736 ) ( not ( = ?auto_210730 ?auto_210736 ) ) ( not ( = ?auto_210731 ?auto_210736 ) ) ( not ( = ?auto_210732 ?auto_210736 ) ) ( not ( = ?auto_210733 ?auto_210736 ) ) ( not ( = ?auto_210734 ?auto_210736 ) ) ( not ( = ?auto_210738 ?auto_210736 ) ) ( not ( = ?auto_210735 ?auto_210736 ) ) ( not ( = ?auto_210737 ?auto_210736 ) ) ( CLEAR ?auto_210738 ) ( ON ?auto_210735 ?auto_210737 ) ( CLEAR ?auto_210735 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210736 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210736 ?auto_210737 )
      ( MAKE-5PILE ?auto_210730 ?auto_210731 ?auto_210732 ?auto_210733 ?auto_210734 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210757 - BLOCK
      ?auto_210758 - BLOCK
      ?auto_210759 - BLOCK
      ?auto_210760 - BLOCK
      ?auto_210761 - BLOCK
    )
    :vars
    (
      ?auto_210764 - BLOCK
      ?auto_210765 - BLOCK
      ?auto_210762 - BLOCK
      ?auto_210763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210757 ) ( ON ?auto_210758 ?auto_210757 ) ( ON ?auto_210759 ?auto_210758 ) ( ON ?auto_210760 ?auto_210759 ) ( not ( = ?auto_210757 ?auto_210758 ) ) ( not ( = ?auto_210757 ?auto_210759 ) ) ( not ( = ?auto_210757 ?auto_210760 ) ) ( not ( = ?auto_210757 ?auto_210761 ) ) ( not ( = ?auto_210757 ?auto_210764 ) ) ( not ( = ?auto_210758 ?auto_210759 ) ) ( not ( = ?auto_210758 ?auto_210760 ) ) ( not ( = ?auto_210758 ?auto_210761 ) ) ( not ( = ?auto_210758 ?auto_210764 ) ) ( not ( = ?auto_210759 ?auto_210760 ) ) ( not ( = ?auto_210759 ?auto_210761 ) ) ( not ( = ?auto_210759 ?auto_210764 ) ) ( not ( = ?auto_210760 ?auto_210761 ) ) ( not ( = ?auto_210760 ?auto_210764 ) ) ( not ( = ?auto_210761 ?auto_210764 ) ) ( not ( = ?auto_210757 ?auto_210765 ) ) ( not ( = ?auto_210757 ?auto_210762 ) ) ( not ( = ?auto_210758 ?auto_210765 ) ) ( not ( = ?auto_210758 ?auto_210762 ) ) ( not ( = ?auto_210759 ?auto_210765 ) ) ( not ( = ?auto_210759 ?auto_210762 ) ) ( not ( = ?auto_210760 ?auto_210765 ) ) ( not ( = ?auto_210760 ?auto_210762 ) ) ( not ( = ?auto_210761 ?auto_210765 ) ) ( not ( = ?auto_210761 ?auto_210762 ) ) ( not ( = ?auto_210764 ?auto_210765 ) ) ( not ( = ?auto_210764 ?auto_210762 ) ) ( not ( = ?auto_210765 ?auto_210762 ) ) ( ON ?auto_210762 ?auto_210763 ) ( not ( = ?auto_210757 ?auto_210763 ) ) ( not ( = ?auto_210758 ?auto_210763 ) ) ( not ( = ?auto_210759 ?auto_210763 ) ) ( not ( = ?auto_210760 ?auto_210763 ) ) ( not ( = ?auto_210761 ?auto_210763 ) ) ( not ( = ?auto_210764 ?auto_210763 ) ) ( not ( = ?auto_210765 ?auto_210763 ) ) ( not ( = ?auto_210762 ?auto_210763 ) ) ( ON ?auto_210765 ?auto_210762 ) ( ON-TABLE ?auto_210763 ) ( ON ?auto_210764 ?auto_210765 ) ( CLEAR ?auto_210764 ) ( HOLDING ?auto_210761 ) ( CLEAR ?auto_210760 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210757 ?auto_210758 ?auto_210759 ?auto_210760 ?auto_210761 ?auto_210764 )
      ( MAKE-5PILE ?auto_210757 ?auto_210758 ?auto_210759 ?auto_210760 ?auto_210761 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210766 - BLOCK
      ?auto_210767 - BLOCK
      ?auto_210768 - BLOCK
      ?auto_210769 - BLOCK
      ?auto_210770 - BLOCK
    )
    :vars
    (
      ?auto_210773 - BLOCK
      ?auto_210771 - BLOCK
      ?auto_210774 - BLOCK
      ?auto_210772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210766 ) ( ON ?auto_210767 ?auto_210766 ) ( ON ?auto_210768 ?auto_210767 ) ( ON ?auto_210769 ?auto_210768 ) ( not ( = ?auto_210766 ?auto_210767 ) ) ( not ( = ?auto_210766 ?auto_210768 ) ) ( not ( = ?auto_210766 ?auto_210769 ) ) ( not ( = ?auto_210766 ?auto_210770 ) ) ( not ( = ?auto_210766 ?auto_210773 ) ) ( not ( = ?auto_210767 ?auto_210768 ) ) ( not ( = ?auto_210767 ?auto_210769 ) ) ( not ( = ?auto_210767 ?auto_210770 ) ) ( not ( = ?auto_210767 ?auto_210773 ) ) ( not ( = ?auto_210768 ?auto_210769 ) ) ( not ( = ?auto_210768 ?auto_210770 ) ) ( not ( = ?auto_210768 ?auto_210773 ) ) ( not ( = ?auto_210769 ?auto_210770 ) ) ( not ( = ?auto_210769 ?auto_210773 ) ) ( not ( = ?auto_210770 ?auto_210773 ) ) ( not ( = ?auto_210766 ?auto_210771 ) ) ( not ( = ?auto_210766 ?auto_210774 ) ) ( not ( = ?auto_210767 ?auto_210771 ) ) ( not ( = ?auto_210767 ?auto_210774 ) ) ( not ( = ?auto_210768 ?auto_210771 ) ) ( not ( = ?auto_210768 ?auto_210774 ) ) ( not ( = ?auto_210769 ?auto_210771 ) ) ( not ( = ?auto_210769 ?auto_210774 ) ) ( not ( = ?auto_210770 ?auto_210771 ) ) ( not ( = ?auto_210770 ?auto_210774 ) ) ( not ( = ?auto_210773 ?auto_210771 ) ) ( not ( = ?auto_210773 ?auto_210774 ) ) ( not ( = ?auto_210771 ?auto_210774 ) ) ( ON ?auto_210774 ?auto_210772 ) ( not ( = ?auto_210766 ?auto_210772 ) ) ( not ( = ?auto_210767 ?auto_210772 ) ) ( not ( = ?auto_210768 ?auto_210772 ) ) ( not ( = ?auto_210769 ?auto_210772 ) ) ( not ( = ?auto_210770 ?auto_210772 ) ) ( not ( = ?auto_210773 ?auto_210772 ) ) ( not ( = ?auto_210771 ?auto_210772 ) ) ( not ( = ?auto_210774 ?auto_210772 ) ) ( ON ?auto_210771 ?auto_210774 ) ( ON-TABLE ?auto_210772 ) ( ON ?auto_210773 ?auto_210771 ) ( CLEAR ?auto_210769 ) ( ON ?auto_210770 ?auto_210773 ) ( CLEAR ?auto_210770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210772 ?auto_210774 ?auto_210771 ?auto_210773 )
      ( MAKE-5PILE ?auto_210766 ?auto_210767 ?auto_210768 ?auto_210769 ?auto_210770 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210775 - BLOCK
      ?auto_210776 - BLOCK
      ?auto_210777 - BLOCK
      ?auto_210778 - BLOCK
      ?auto_210779 - BLOCK
    )
    :vars
    (
      ?auto_210780 - BLOCK
      ?auto_210783 - BLOCK
      ?auto_210782 - BLOCK
      ?auto_210781 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210775 ) ( ON ?auto_210776 ?auto_210775 ) ( ON ?auto_210777 ?auto_210776 ) ( not ( = ?auto_210775 ?auto_210776 ) ) ( not ( = ?auto_210775 ?auto_210777 ) ) ( not ( = ?auto_210775 ?auto_210778 ) ) ( not ( = ?auto_210775 ?auto_210779 ) ) ( not ( = ?auto_210775 ?auto_210780 ) ) ( not ( = ?auto_210776 ?auto_210777 ) ) ( not ( = ?auto_210776 ?auto_210778 ) ) ( not ( = ?auto_210776 ?auto_210779 ) ) ( not ( = ?auto_210776 ?auto_210780 ) ) ( not ( = ?auto_210777 ?auto_210778 ) ) ( not ( = ?auto_210777 ?auto_210779 ) ) ( not ( = ?auto_210777 ?auto_210780 ) ) ( not ( = ?auto_210778 ?auto_210779 ) ) ( not ( = ?auto_210778 ?auto_210780 ) ) ( not ( = ?auto_210779 ?auto_210780 ) ) ( not ( = ?auto_210775 ?auto_210783 ) ) ( not ( = ?auto_210775 ?auto_210782 ) ) ( not ( = ?auto_210776 ?auto_210783 ) ) ( not ( = ?auto_210776 ?auto_210782 ) ) ( not ( = ?auto_210777 ?auto_210783 ) ) ( not ( = ?auto_210777 ?auto_210782 ) ) ( not ( = ?auto_210778 ?auto_210783 ) ) ( not ( = ?auto_210778 ?auto_210782 ) ) ( not ( = ?auto_210779 ?auto_210783 ) ) ( not ( = ?auto_210779 ?auto_210782 ) ) ( not ( = ?auto_210780 ?auto_210783 ) ) ( not ( = ?auto_210780 ?auto_210782 ) ) ( not ( = ?auto_210783 ?auto_210782 ) ) ( ON ?auto_210782 ?auto_210781 ) ( not ( = ?auto_210775 ?auto_210781 ) ) ( not ( = ?auto_210776 ?auto_210781 ) ) ( not ( = ?auto_210777 ?auto_210781 ) ) ( not ( = ?auto_210778 ?auto_210781 ) ) ( not ( = ?auto_210779 ?auto_210781 ) ) ( not ( = ?auto_210780 ?auto_210781 ) ) ( not ( = ?auto_210783 ?auto_210781 ) ) ( not ( = ?auto_210782 ?auto_210781 ) ) ( ON ?auto_210783 ?auto_210782 ) ( ON-TABLE ?auto_210781 ) ( ON ?auto_210780 ?auto_210783 ) ( ON ?auto_210779 ?auto_210780 ) ( CLEAR ?auto_210779 ) ( HOLDING ?auto_210778 ) ( CLEAR ?auto_210777 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210775 ?auto_210776 ?auto_210777 ?auto_210778 )
      ( MAKE-5PILE ?auto_210775 ?auto_210776 ?auto_210777 ?auto_210778 ?auto_210779 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210784 - BLOCK
      ?auto_210785 - BLOCK
      ?auto_210786 - BLOCK
      ?auto_210787 - BLOCK
      ?auto_210788 - BLOCK
    )
    :vars
    (
      ?auto_210789 - BLOCK
      ?auto_210792 - BLOCK
      ?auto_210790 - BLOCK
      ?auto_210791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210784 ) ( ON ?auto_210785 ?auto_210784 ) ( ON ?auto_210786 ?auto_210785 ) ( not ( = ?auto_210784 ?auto_210785 ) ) ( not ( = ?auto_210784 ?auto_210786 ) ) ( not ( = ?auto_210784 ?auto_210787 ) ) ( not ( = ?auto_210784 ?auto_210788 ) ) ( not ( = ?auto_210784 ?auto_210789 ) ) ( not ( = ?auto_210785 ?auto_210786 ) ) ( not ( = ?auto_210785 ?auto_210787 ) ) ( not ( = ?auto_210785 ?auto_210788 ) ) ( not ( = ?auto_210785 ?auto_210789 ) ) ( not ( = ?auto_210786 ?auto_210787 ) ) ( not ( = ?auto_210786 ?auto_210788 ) ) ( not ( = ?auto_210786 ?auto_210789 ) ) ( not ( = ?auto_210787 ?auto_210788 ) ) ( not ( = ?auto_210787 ?auto_210789 ) ) ( not ( = ?auto_210788 ?auto_210789 ) ) ( not ( = ?auto_210784 ?auto_210792 ) ) ( not ( = ?auto_210784 ?auto_210790 ) ) ( not ( = ?auto_210785 ?auto_210792 ) ) ( not ( = ?auto_210785 ?auto_210790 ) ) ( not ( = ?auto_210786 ?auto_210792 ) ) ( not ( = ?auto_210786 ?auto_210790 ) ) ( not ( = ?auto_210787 ?auto_210792 ) ) ( not ( = ?auto_210787 ?auto_210790 ) ) ( not ( = ?auto_210788 ?auto_210792 ) ) ( not ( = ?auto_210788 ?auto_210790 ) ) ( not ( = ?auto_210789 ?auto_210792 ) ) ( not ( = ?auto_210789 ?auto_210790 ) ) ( not ( = ?auto_210792 ?auto_210790 ) ) ( ON ?auto_210790 ?auto_210791 ) ( not ( = ?auto_210784 ?auto_210791 ) ) ( not ( = ?auto_210785 ?auto_210791 ) ) ( not ( = ?auto_210786 ?auto_210791 ) ) ( not ( = ?auto_210787 ?auto_210791 ) ) ( not ( = ?auto_210788 ?auto_210791 ) ) ( not ( = ?auto_210789 ?auto_210791 ) ) ( not ( = ?auto_210792 ?auto_210791 ) ) ( not ( = ?auto_210790 ?auto_210791 ) ) ( ON ?auto_210792 ?auto_210790 ) ( ON-TABLE ?auto_210791 ) ( ON ?auto_210789 ?auto_210792 ) ( ON ?auto_210788 ?auto_210789 ) ( CLEAR ?auto_210786 ) ( ON ?auto_210787 ?auto_210788 ) ( CLEAR ?auto_210787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210791 ?auto_210790 ?auto_210792 ?auto_210789 ?auto_210788 )
      ( MAKE-5PILE ?auto_210784 ?auto_210785 ?auto_210786 ?auto_210787 ?auto_210788 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210793 - BLOCK
      ?auto_210794 - BLOCK
      ?auto_210795 - BLOCK
      ?auto_210796 - BLOCK
      ?auto_210797 - BLOCK
    )
    :vars
    (
      ?auto_210799 - BLOCK
      ?auto_210801 - BLOCK
      ?auto_210798 - BLOCK
      ?auto_210800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210793 ) ( ON ?auto_210794 ?auto_210793 ) ( not ( = ?auto_210793 ?auto_210794 ) ) ( not ( = ?auto_210793 ?auto_210795 ) ) ( not ( = ?auto_210793 ?auto_210796 ) ) ( not ( = ?auto_210793 ?auto_210797 ) ) ( not ( = ?auto_210793 ?auto_210799 ) ) ( not ( = ?auto_210794 ?auto_210795 ) ) ( not ( = ?auto_210794 ?auto_210796 ) ) ( not ( = ?auto_210794 ?auto_210797 ) ) ( not ( = ?auto_210794 ?auto_210799 ) ) ( not ( = ?auto_210795 ?auto_210796 ) ) ( not ( = ?auto_210795 ?auto_210797 ) ) ( not ( = ?auto_210795 ?auto_210799 ) ) ( not ( = ?auto_210796 ?auto_210797 ) ) ( not ( = ?auto_210796 ?auto_210799 ) ) ( not ( = ?auto_210797 ?auto_210799 ) ) ( not ( = ?auto_210793 ?auto_210801 ) ) ( not ( = ?auto_210793 ?auto_210798 ) ) ( not ( = ?auto_210794 ?auto_210801 ) ) ( not ( = ?auto_210794 ?auto_210798 ) ) ( not ( = ?auto_210795 ?auto_210801 ) ) ( not ( = ?auto_210795 ?auto_210798 ) ) ( not ( = ?auto_210796 ?auto_210801 ) ) ( not ( = ?auto_210796 ?auto_210798 ) ) ( not ( = ?auto_210797 ?auto_210801 ) ) ( not ( = ?auto_210797 ?auto_210798 ) ) ( not ( = ?auto_210799 ?auto_210801 ) ) ( not ( = ?auto_210799 ?auto_210798 ) ) ( not ( = ?auto_210801 ?auto_210798 ) ) ( ON ?auto_210798 ?auto_210800 ) ( not ( = ?auto_210793 ?auto_210800 ) ) ( not ( = ?auto_210794 ?auto_210800 ) ) ( not ( = ?auto_210795 ?auto_210800 ) ) ( not ( = ?auto_210796 ?auto_210800 ) ) ( not ( = ?auto_210797 ?auto_210800 ) ) ( not ( = ?auto_210799 ?auto_210800 ) ) ( not ( = ?auto_210801 ?auto_210800 ) ) ( not ( = ?auto_210798 ?auto_210800 ) ) ( ON ?auto_210801 ?auto_210798 ) ( ON-TABLE ?auto_210800 ) ( ON ?auto_210799 ?auto_210801 ) ( ON ?auto_210797 ?auto_210799 ) ( ON ?auto_210796 ?auto_210797 ) ( CLEAR ?auto_210796 ) ( HOLDING ?auto_210795 ) ( CLEAR ?auto_210794 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210793 ?auto_210794 ?auto_210795 )
      ( MAKE-5PILE ?auto_210793 ?auto_210794 ?auto_210795 ?auto_210796 ?auto_210797 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210802 - BLOCK
      ?auto_210803 - BLOCK
      ?auto_210804 - BLOCK
      ?auto_210805 - BLOCK
      ?auto_210806 - BLOCK
    )
    :vars
    (
      ?auto_210809 - BLOCK
      ?auto_210808 - BLOCK
      ?auto_210807 - BLOCK
      ?auto_210810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210802 ) ( ON ?auto_210803 ?auto_210802 ) ( not ( = ?auto_210802 ?auto_210803 ) ) ( not ( = ?auto_210802 ?auto_210804 ) ) ( not ( = ?auto_210802 ?auto_210805 ) ) ( not ( = ?auto_210802 ?auto_210806 ) ) ( not ( = ?auto_210802 ?auto_210809 ) ) ( not ( = ?auto_210803 ?auto_210804 ) ) ( not ( = ?auto_210803 ?auto_210805 ) ) ( not ( = ?auto_210803 ?auto_210806 ) ) ( not ( = ?auto_210803 ?auto_210809 ) ) ( not ( = ?auto_210804 ?auto_210805 ) ) ( not ( = ?auto_210804 ?auto_210806 ) ) ( not ( = ?auto_210804 ?auto_210809 ) ) ( not ( = ?auto_210805 ?auto_210806 ) ) ( not ( = ?auto_210805 ?auto_210809 ) ) ( not ( = ?auto_210806 ?auto_210809 ) ) ( not ( = ?auto_210802 ?auto_210808 ) ) ( not ( = ?auto_210802 ?auto_210807 ) ) ( not ( = ?auto_210803 ?auto_210808 ) ) ( not ( = ?auto_210803 ?auto_210807 ) ) ( not ( = ?auto_210804 ?auto_210808 ) ) ( not ( = ?auto_210804 ?auto_210807 ) ) ( not ( = ?auto_210805 ?auto_210808 ) ) ( not ( = ?auto_210805 ?auto_210807 ) ) ( not ( = ?auto_210806 ?auto_210808 ) ) ( not ( = ?auto_210806 ?auto_210807 ) ) ( not ( = ?auto_210809 ?auto_210808 ) ) ( not ( = ?auto_210809 ?auto_210807 ) ) ( not ( = ?auto_210808 ?auto_210807 ) ) ( ON ?auto_210807 ?auto_210810 ) ( not ( = ?auto_210802 ?auto_210810 ) ) ( not ( = ?auto_210803 ?auto_210810 ) ) ( not ( = ?auto_210804 ?auto_210810 ) ) ( not ( = ?auto_210805 ?auto_210810 ) ) ( not ( = ?auto_210806 ?auto_210810 ) ) ( not ( = ?auto_210809 ?auto_210810 ) ) ( not ( = ?auto_210808 ?auto_210810 ) ) ( not ( = ?auto_210807 ?auto_210810 ) ) ( ON ?auto_210808 ?auto_210807 ) ( ON-TABLE ?auto_210810 ) ( ON ?auto_210809 ?auto_210808 ) ( ON ?auto_210806 ?auto_210809 ) ( ON ?auto_210805 ?auto_210806 ) ( CLEAR ?auto_210803 ) ( ON ?auto_210804 ?auto_210805 ) ( CLEAR ?auto_210804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210810 ?auto_210807 ?auto_210808 ?auto_210809 ?auto_210806 ?auto_210805 )
      ( MAKE-5PILE ?auto_210802 ?auto_210803 ?auto_210804 ?auto_210805 ?auto_210806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210811 - BLOCK
      ?auto_210812 - BLOCK
      ?auto_210813 - BLOCK
      ?auto_210814 - BLOCK
      ?auto_210815 - BLOCK
    )
    :vars
    (
      ?auto_210817 - BLOCK
      ?auto_210819 - BLOCK
      ?auto_210816 - BLOCK
      ?auto_210818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210811 ) ( not ( = ?auto_210811 ?auto_210812 ) ) ( not ( = ?auto_210811 ?auto_210813 ) ) ( not ( = ?auto_210811 ?auto_210814 ) ) ( not ( = ?auto_210811 ?auto_210815 ) ) ( not ( = ?auto_210811 ?auto_210817 ) ) ( not ( = ?auto_210812 ?auto_210813 ) ) ( not ( = ?auto_210812 ?auto_210814 ) ) ( not ( = ?auto_210812 ?auto_210815 ) ) ( not ( = ?auto_210812 ?auto_210817 ) ) ( not ( = ?auto_210813 ?auto_210814 ) ) ( not ( = ?auto_210813 ?auto_210815 ) ) ( not ( = ?auto_210813 ?auto_210817 ) ) ( not ( = ?auto_210814 ?auto_210815 ) ) ( not ( = ?auto_210814 ?auto_210817 ) ) ( not ( = ?auto_210815 ?auto_210817 ) ) ( not ( = ?auto_210811 ?auto_210819 ) ) ( not ( = ?auto_210811 ?auto_210816 ) ) ( not ( = ?auto_210812 ?auto_210819 ) ) ( not ( = ?auto_210812 ?auto_210816 ) ) ( not ( = ?auto_210813 ?auto_210819 ) ) ( not ( = ?auto_210813 ?auto_210816 ) ) ( not ( = ?auto_210814 ?auto_210819 ) ) ( not ( = ?auto_210814 ?auto_210816 ) ) ( not ( = ?auto_210815 ?auto_210819 ) ) ( not ( = ?auto_210815 ?auto_210816 ) ) ( not ( = ?auto_210817 ?auto_210819 ) ) ( not ( = ?auto_210817 ?auto_210816 ) ) ( not ( = ?auto_210819 ?auto_210816 ) ) ( ON ?auto_210816 ?auto_210818 ) ( not ( = ?auto_210811 ?auto_210818 ) ) ( not ( = ?auto_210812 ?auto_210818 ) ) ( not ( = ?auto_210813 ?auto_210818 ) ) ( not ( = ?auto_210814 ?auto_210818 ) ) ( not ( = ?auto_210815 ?auto_210818 ) ) ( not ( = ?auto_210817 ?auto_210818 ) ) ( not ( = ?auto_210819 ?auto_210818 ) ) ( not ( = ?auto_210816 ?auto_210818 ) ) ( ON ?auto_210819 ?auto_210816 ) ( ON-TABLE ?auto_210818 ) ( ON ?auto_210817 ?auto_210819 ) ( ON ?auto_210815 ?auto_210817 ) ( ON ?auto_210814 ?auto_210815 ) ( ON ?auto_210813 ?auto_210814 ) ( CLEAR ?auto_210813 ) ( HOLDING ?auto_210812 ) ( CLEAR ?auto_210811 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210811 ?auto_210812 )
      ( MAKE-5PILE ?auto_210811 ?auto_210812 ?auto_210813 ?auto_210814 ?auto_210815 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210820 - BLOCK
      ?auto_210821 - BLOCK
      ?auto_210822 - BLOCK
      ?auto_210823 - BLOCK
      ?auto_210824 - BLOCK
    )
    :vars
    (
      ?auto_210828 - BLOCK
      ?auto_210827 - BLOCK
      ?auto_210825 - BLOCK
      ?auto_210826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210820 ) ( not ( = ?auto_210820 ?auto_210821 ) ) ( not ( = ?auto_210820 ?auto_210822 ) ) ( not ( = ?auto_210820 ?auto_210823 ) ) ( not ( = ?auto_210820 ?auto_210824 ) ) ( not ( = ?auto_210820 ?auto_210828 ) ) ( not ( = ?auto_210821 ?auto_210822 ) ) ( not ( = ?auto_210821 ?auto_210823 ) ) ( not ( = ?auto_210821 ?auto_210824 ) ) ( not ( = ?auto_210821 ?auto_210828 ) ) ( not ( = ?auto_210822 ?auto_210823 ) ) ( not ( = ?auto_210822 ?auto_210824 ) ) ( not ( = ?auto_210822 ?auto_210828 ) ) ( not ( = ?auto_210823 ?auto_210824 ) ) ( not ( = ?auto_210823 ?auto_210828 ) ) ( not ( = ?auto_210824 ?auto_210828 ) ) ( not ( = ?auto_210820 ?auto_210827 ) ) ( not ( = ?auto_210820 ?auto_210825 ) ) ( not ( = ?auto_210821 ?auto_210827 ) ) ( not ( = ?auto_210821 ?auto_210825 ) ) ( not ( = ?auto_210822 ?auto_210827 ) ) ( not ( = ?auto_210822 ?auto_210825 ) ) ( not ( = ?auto_210823 ?auto_210827 ) ) ( not ( = ?auto_210823 ?auto_210825 ) ) ( not ( = ?auto_210824 ?auto_210827 ) ) ( not ( = ?auto_210824 ?auto_210825 ) ) ( not ( = ?auto_210828 ?auto_210827 ) ) ( not ( = ?auto_210828 ?auto_210825 ) ) ( not ( = ?auto_210827 ?auto_210825 ) ) ( ON ?auto_210825 ?auto_210826 ) ( not ( = ?auto_210820 ?auto_210826 ) ) ( not ( = ?auto_210821 ?auto_210826 ) ) ( not ( = ?auto_210822 ?auto_210826 ) ) ( not ( = ?auto_210823 ?auto_210826 ) ) ( not ( = ?auto_210824 ?auto_210826 ) ) ( not ( = ?auto_210828 ?auto_210826 ) ) ( not ( = ?auto_210827 ?auto_210826 ) ) ( not ( = ?auto_210825 ?auto_210826 ) ) ( ON ?auto_210827 ?auto_210825 ) ( ON-TABLE ?auto_210826 ) ( ON ?auto_210828 ?auto_210827 ) ( ON ?auto_210824 ?auto_210828 ) ( ON ?auto_210823 ?auto_210824 ) ( ON ?auto_210822 ?auto_210823 ) ( CLEAR ?auto_210820 ) ( ON ?auto_210821 ?auto_210822 ) ( CLEAR ?auto_210821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210826 ?auto_210825 ?auto_210827 ?auto_210828 ?auto_210824 ?auto_210823 ?auto_210822 )
      ( MAKE-5PILE ?auto_210820 ?auto_210821 ?auto_210822 ?auto_210823 ?auto_210824 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210829 - BLOCK
      ?auto_210830 - BLOCK
      ?auto_210831 - BLOCK
      ?auto_210832 - BLOCK
      ?auto_210833 - BLOCK
    )
    :vars
    (
      ?auto_210836 - BLOCK
      ?auto_210834 - BLOCK
      ?auto_210835 - BLOCK
      ?auto_210837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210829 ?auto_210830 ) ) ( not ( = ?auto_210829 ?auto_210831 ) ) ( not ( = ?auto_210829 ?auto_210832 ) ) ( not ( = ?auto_210829 ?auto_210833 ) ) ( not ( = ?auto_210829 ?auto_210836 ) ) ( not ( = ?auto_210830 ?auto_210831 ) ) ( not ( = ?auto_210830 ?auto_210832 ) ) ( not ( = ?auto_210830 ?auto_210833 ) ) ( not ( = ?auto_210830 ?auto_210836 ) ) ( not ( = ?auto_210831 ?auto_210832 ) ) ( not ( = ?auto_210831 ?auto_210833 ) ) ( not ( = ?auto_210831 ?auto_210836 ) ) ( not ( = ?auto_210832 ?auto_210833 ) ) ( not ( = ?auto_210832 ?auto_210836 ) ) ( not ( = ?auto_210833 ?auto_210836 ) ) ( not ( = ?auto_210829 ?auto_210834 ) ) ( not ( = ?auto_210829 ?auto_210835 ) ) ( not ( = ?auto_210830 ?auto_210834 ) ) ( not ( = ?auto_210830 ?auto_210835 ) ) ( not ( = ?auto_210831 ?auto_210834 ) ) ( not ( = ?auto_210831 ?auto_210835 ) ) ( not ( = ?auto_210832 ?auto_210834 ) ) ( not ( = ?auto_210832 ?auto_210835 ) ) ( not ( = ?auto_210833 ?auto_210834 ) ) ( not ( = ?auto_210833 ?auto_210835 ) ) ( not ( = ?auto_210836 ?auto_210834 ) ) ( not ( = ?auto_210836 ?auto_210835 ) ) ( not ( = ?auto_210834 ?auto_210835 ) ) ( ON ?auto_210835 ?auto_210837 ) ( not ( = ?auto_210829 ?auto_210837 ) ) ( not ( = ?auto_210830 ?auto_210837 ) ) ( not ( = ?auto_210831 ?auto_210837 ) ) ( not ( = ?auto_210832 ?auto_210837 ) ) ( not ( = ?auto_210833 ?auto_210837 ) ) ( not ( = ?auto_210836 ?auto_210837 ) ) ( not ( = ?auto_210834 ?auto_210837 ) ) ( not ( = ?auto_210835 ?auto_210837 ) ) ( ON ?auto_210834 ?auto_210835 ) ( ON-TABLE ?auto_210837 ) ( ON ?auto_210836 ?auto_210834 ) ( ON ?auto_210833 ?auto_210836 ) ( ON ?auto_210832 ?auto_210833 ) ( ON ?auto_210831 ?auto_210832 ) ( ON ?auto_210830 ?auto_210831 ) ( CLEAR ?auto_210830 ) ( HOLDING ?auto_210829 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_210829 )
      ( MAKE-5PILE ?auto_210829 ?auto_210830 ?auto_210831 ?auto_210832 ?auto_210833 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_210838 - BLOCK
      ?auto_210839 - BLOCK
      ?auto_210840 - BLOCK
      ?auto_210841 - BLOCK
      ?auto_210842 - BLOCK
    )
    :vars
    (
      ?auto_210846 - BLOCK
      ?auto_210845 - BLOCK
      ?auto_210844 - BLOCK
      ?auto_210843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210838 ?auto_210839 ) ) ( not ( = ?auto_210838 ?auto_210840 ) ) ( not ( = ?auto_210838 ?auto_210841 ) ) ( not ( = ?auto_210838 ?auto_210842 ) ) ( not ( = ?auto_210838 ?auto_210846 ) ) ( not ( = ?auto_210839 ?auto_210840 ) ) ( not ( = ?auto_210839 ?auto_210841 ) ) ( not ( = ?auto_210839 ?auto_210842 ) ) ( not ( = ?auto_210839 ?auto_210846 ) ) ( not ( = ?auto_210840 ?auto_210841 ) ) ( not ( = ?auto_210840 ?auto_210842 ) ) ( not ( = ?auto_210840 ?auto_210846 ) ) ( not ( = ?auto_210841 ?auto_210842 ) ) ( not ( = ?auto_210841 ?auto_210846 ) ) ( not ( = ?auto_210842 ?auto_210846 ) ) ( not ( = ?auto_210838 ?auto_210845 ) ) ( not ( = ?auto_210838 ?auto_210844 ) ) ( not ( = ?auto_210839 ?auto_210845 ) ) ( not ( = ?auto_210839 ?auto_210844 ) ) ( not ( = ?auto_210840 ?auto_210845 ) ) ( not ( = ?auto_210840 ?auto_210844 ) ) ( not ( = ?auto_210841 ?auto_210845 ) ) ( not ( = ?auto_210841 ?auto_210844 ) ) ( not ( = ?auto_210842 ?auto_210845 ) ) ( not ( = ?auto_210842 ?auto_210844 ) ) ( not ( = ?auto_210846 ?auto_210845 ) ) ( not ( = ?auto_210846 ?auto_210844 ) ) ( not ( = ?auto_210845 ?auto_210844 ) ) ( ON ?auto_210844 ?auto_210843 ) ( not ( = ?auto_210838 ?auto_210843 ) ) ( not ( = ?auto_210839 ?auto_210843 ) ) ( not ( = ?auto_210840 ?auto_210843 ) ) ( not ( = ?auto_210841 ?auto_210843 ) ) ( not ( = ?auto_210842 ?auto_210843 ) ) ( not ( = ?auto_210846 ?auto_210843 ) ) ( not ( = ?auto_210845 ?auto_210843 ) ) ( not ( = ?auto_210844 ?auto_210843 ) ) ( ON ?auto_210845 ?auto_210844 ) ( ON-TABLE ?auto_210843 ) ( ON ?auto_210846 ?auto_210845 ) ( ON ?auto_210842 ?auto_210846 ) ( ON ?auto_210841 ?auto_210842 ) ( ON ?auto_210840 ?auto_210841 ) ( ON ?auto_210839 ?auto_210840 ) ( ON ?auto_210838 ?auto_210839 ) ( CLEAR ?auto_210838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210843 ?auto_210844 ?auto_210845 ?auto_210846 ?auto_210842 ?auto_210841 ?auto_210840 ?auto_210839 )
      ( MAKE-5PILE ?auto_210838 ?auto_210839 ?auto_210840 ?auto_210841 ?auto_210842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210850 - BLOCK
      ?auto_210851 - BLOCK
      ?auto_210852 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_210852 ) ( CLEAR ?auto_210851 ) ( ON-TABLE ?auto_210850 ) ( ON ?auto_210851 ?auto_210850 ) ( not ( = ?auto_210850 ?auto_210851 ) ) ( not ( = ?auto_210850 ?auto_210852 ) ) ( not ( = ?auto_210851 ?auto_210852 ) ) )
    :subtasks
    ( ( !STACK ?auto_210852 ?auto_210851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210853 - BLOCK
      ?auto_210854 - BLOCK
      ?auto_210855 - BLOCK
    )
    :vars
    (
      ?auto_210856 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_210854 ) ( ON-TABLE ?auto_210853 ) ( ON ?auto_210854 ?auto_210853 ) ( not ( = ?auto_210853 ?auto_210854 ) ) ( not ( = ?auto_210853 ?auto_210855 ) ) ( not ( = ?auto_210854 ?auto_210855 ) ) ( ON ?auto_210855 ?auto_210856 ) ( CLEAR ?auto_210855 ) ( HAND-EMPTY ) ( not ( = ?auto_210853 ?auto_210856 ) ) ( not ( = ?auto_210854 ?auto_210856 ) ) ( not ( = ?auto_210855 ?auto_210856 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210855 ?auto_210856 )
      ( MAKE-3PILE ?auto_210853 ?auto_210854 ?auto_210855 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210857 - BLOCK
      ?auto_210858 - BLOCK
      ?auto_210859 - BLOCK
    )
    :vars
    (
      ?auto_210860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210857 ) ( not ( = ?auto_210857 ?auto_210858 ) ) ( not ( = ?auto_210857 ?auto_210859 ) ) ( not ( = ?auto_210858 ?auto_210859 ) ) ( ON ?auto_210859 ?auto_210860 ) ( CLEAR ?auto_210859 ) ( not ( = ?auto_210857 ?auto_210860 ) ) ( not ( = ?auto_210858 ?auto_210860 ) ) ( not ( = ?auto_210859 ?auto_210860 ) ) ( HOLDING ?auto_210858 ) ( CLEAR ?auto_210857 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210857 ?auto_210858 )
      ( MAKE-3PILE ?auto_210857 ?auto_210858 ?auto_210859 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210861 - BLOCK
      ?auto_210862 - BLOCK
      ?auto_210863 - BLOCK
    )
    :vars
    (
      ?auto_210864 - BLOCK
      ?auto_210868 - BLOCK
      ?auto_210865 - BLOCK
      ?auto_210866 - BLOCK
      ?auto_210867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_210861 ) ( not ( = ?auto_210861 ?auto_210862 ) ) ( not ( = ?auto_210861 ?auto_210863 ) ) ( not ( = ?auto_210862 ?auto_210863 ) ) ( ON ?auto_210863 ?auto_210864 ) ( not ( = ?auto_210861 ?auto_210864 ) ) ( not ( = ?auto_210862 ?auto_210864 ) ) ( not ( = ?auto_210863 ?auto_210864 ) ) ( CLEAR ?auto_210861 ) ( ON ?auto_210862 ?auto_210863 ) ( CLEAR ?auto_210862 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210868 ) ( ON ?auto_210865 ?auto_210868 ) ( ON ?auto_210866 ?auto_210865 ) ( ON ?auto_210867 ?auto_210866 ) ( ON ?auto_210864 ?auto_210867 ) ( not ( = ?auto_210868 ?auto_210865 ) ) ( not ( = ?auto_210868 ?auto_210866 ) ) ( not ( = ?auto_210868 ?auto_210867 ) ) ( not ( = ?auto_210868 ?auto_210864 ) ) ( not ( = ?auto_210868 ?auto_210863 ) ) ( not ( = ?auto_210868 ?auto_210862 ) ) ( not ( = ?auto_210865 ?auto_210866 ) ) ( not ( = ?auto_210865 ?auto_210867 ) ) ( not ( = ?auto_210865 ?auto_210864 ) ) ( not ( = ?auto_210865 ?auto_210863 ) ) ( not ( = ?auto_210865 ?auto_210862 ) ) ( not ( = ?auto_210866 ?auto_210867 ) ) ( not ( = ?auto_210866 ?auto_210864 ) ) ( not ( = ?auto_210866 ?auto_210863 ) ) ( not ( = ?auto_210866 ?auto_210862 ) ) ( not ( = ?auto_210867 ?auto_210864 ) ) ( not ( = ?auto_210867 ?auto_210863 ) ) ( not ( = ?auto_210867 ?auto_210862 ) ) ( not ( = ?auto_210861 ?auto_210868 ) ) ( not ( = ?auto_210861 ?auto_210865 ) ) ( not ( = ?auto_210861 ?auto_210866 ) ) ( not ( = ?auto_210861 ?auto_210867 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210868 ?auto_210865 ?auto_210866 ?auto_210867 ?auto_210864 ?auto_210863 )
      ( MAKE-3PILE ?auto_210861 ?auto_210862 ?auto_210863 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210869 - BLOCK
      ?auto_210870 - BLOCK
      ?auto_210871 - BLOCK
    )
    :vars
    (
      ?auto_210872 - BLOCK
      ?auto_210873 - BLOCK
      ?auto_210874 - BLOCK
      ?auto_210875 - BLOCK
      ?auto_210876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210869 ?auto_210870 ) ) ( not ( = ?auto_210869 ?auto_210871 ) ) ( not ( = ?auto_210870 ?auto_210871 ) ) ( ON ?auto_210871 ?auto_210872 ) ( not ( = ?auto_210869 ?auto_210872 ) ) ( not ( = ?auto_210870 ?auto_210872 ) ) ( not ( = ?auto_210871 ?auto_210872 ) ) ( ON ?auto_210870 ?auto_210871 ) ( CLEAR ?auto_210870 ) ( ON-TABLE ?auto_210873 ) ( ON ?auto_210874 ?auto_210873 ) ( ON ?auto_210875 ?auto_210874 ) ( ON ?auto_210876 ?auto_210875 ) ( ON ?auto_210872 ?auto_210876 ) ( not ( = ?auto_210873 ?auto_210874 ) ) ( not ( = ?auto_210873 ?auto_210875 ) ) ( not ( = ?auto_210873 ?auto_210876 ) ) ( not ( = ?auto_210873 ?auto_210872 ) ) ( not ( = ?auto_210873 ?auto_210871 ) ) ( not ( = ?auto_210873 ?auto_210870 ) ) ( not ( = ?auto_210874 ?auto_210875 ) ) ( not ( = ?auto_210874 ?auto_210876 ) ) ( not ( = ?auto_210874 ?auto_210872 ) ) ( not ( = ?auto_210874 ?auto_210871 ) ) ( not ( = ?auto_210874 ?auto_210870 ) ) ( not ( = ?auto_210875 ?auto_210876 ) ) ( not ( = ?auto_210875 ?auto_210872 ) ) ( not ( = ?auto_210875 ?auto_210871 ) ) ( not ( = ?auto_210875 ?auto_210870 ) ) ( not ( = ?auto_210876 ?auto_210872 ) ) ( not ( = ?auto_210876 ?auto_210871 ) ) ( not ( = ?auto_210876 ?auto_210870 ) ) ( not ( = ?auto_210869 ?auto_210873 ) ) ( not ( = ?auto_210869 ?auto_210874 ) ) ( not ( = ?auto_210869 ?auto_210875 ) ) ( not ( = ?auto_210869 ?auto_210876 ) ) ( HOLDING ?auto_210869 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_210869 )
      ( MAKE-3PILE ?auto_210869 ?auto_210870 ?auto_210871 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210877 - BLOCK
      ?auto_210878 - BLOCK
      ?auto_210879 - BLOCK
    )
    :vars
    (
      ?auto_210882 - BLOCK
      ?auto_210881 - BLOCK
      ?auto_210883 - BLOCK
      ?auto_210880 - BLOCK
      ?auto_210884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210877 ?auto_210878 ) ) ( not ( = ?auto_210877 ?auto_210879 ) ) ( not ( = ?auto_210878 ?auto_210879 ) ) ( ON ?auto_210879 ?auto_210882 ) ( not ( = ?auto_210877 ?auto_210882 ) ) ( not ( = ?auto_210878 ?auto_210882 ) ) ( not ( = ?auto_210879 ?auto_210882 ) ) ( ON ?auto_210878 ?auto_210879 ) ( ON-TABLE ?auto_210881 ) ( ON ?auto_210883 ?auto_210881 ) ( ON ?auto_210880 ?auto_210883 ) ( ON ?auto_210884 ?auto_210880 ) ( ON ?auto_210882 ?auto_210884 ) ( not ( = ?auto_210881 ?auto_210883 ) ) ( not ( = ?auto_210881 ?auto_210880 ) ) ( not ( = ?auto_210881 ?auto_210884 ) ) ( not ( = ?auto_210881 ?auto_210882 ) ) ( not ( = ?auto_210881 ?auto_210879 ) ) ( not ( = ?auto_210881 ?auto_210878 ) ) ( not ( = ?auto_210883 ?auto_210880 ) ) ( not ( = ?auto_210883 ?auto_210884 ) ) ( not ( = ?auto_210883 ?auto_210882 ) ) ( not ( = ?auto_210883 ?auto_210879 ) ) ( not ( = ?auto_210883 ?auto_210878 ) ) ( not ( = ?auto_210880 ?auto_210884 ) ) ( not ( = ?auto_210880 ?auto_210882 ) ) ( not ( = ?auto_210880 ?auto_210879 ) ) ( not ( = ?auto_210880 ?auto_210878 ) ) ( not ( = ?auto_210884 ?auto_210882 ) ) ( not ( = ?auto_210884 ?auto_210879 ) ) ( not ( = ?auto_210884 ?auto_210878 ) ) ( not ( = ?auto_210877 ?auto_210881 ) ) ( not ( = ?auto_210877 ?auto_210883 ) ) ( not ( = ?auto_210877 ?auto_210880 ) ) ( not ( = ?auto_210877 ?auto_210884 ) ) ( ON ?auto_210877 ?auto_210878 ) ( CLEAR ?auto_210877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210881 ?auto_210883 ?auto_210880 ?auto_210884 ?auto_210882 ?auto_210879 ?auto_210878 )
      ( MAKE-3PILE ?auto_210877 ?auto_210878 ?auto_210879 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210885 - BLOCK
      ?auto_210886 - BLOCK
      ?auto_210887 - BLOCK
    )
    :vars
    (
      ?auto_210889 - BLOCK
      ?auto_210888 - BLOCK
      ?auto_210891 - BLOCK
      ?auto_210892 - BLOCK
      ?auto_210890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210885 ?auto_210886 ) ) ( not ( = ?auto_210885 ?auto_210887 ) ) ( not ( = ?auto_210886 ?auto_210887 ) ) ( ON ?auto_210887 ?auto_210889 ) ( not ( = ?auto_210885 ?auto_210889 ) ) ( not ( = ?auto_210886 ?auto_210889 ) ) ( not ( = ?auto_210887 ?auto_210889 ) ) ( ON ?auto_210886 ?auto_210887 ) ( ON-TABLE ?auto_210888 ) ( ON ?auto_210891 ?auto_210888 ) ( ON ?auto_210892 ?auto_210891 ) ( ON ?auto_210890 ?auto_210892 ) ( ON ?auto_210889 ?auto_210890 ) ( not ( = ?auto_210888 ?auto_210891 ) ) ( not ( = ?auto_210888 ?auto_210892 ) ) ( not ( = ?auto_210888 ?auto_210890 ) ) ( not ( = ?auto_210888 ?auto_210889 ) ) ( not ( = ?auto_210888 ?auto_210887 ) ) ( not ( = ?auto_210888 ?auto_210886 ) ) ( not ( = ?auto_210891 ?auto_210892 ) ) ( not ( = ?auto_210891 ?auto_210890 ) ) ( not ( = ?auto_210891 ?auto_210889 ) ) ( not ( = ?auto_210891 ?auto_210887 ) ) ( not ( = ?auto_210891 ?auto_210886 ) ) ( not ( = ?auto_210892 ?auto_210890 ) ) ( not ( = ?auto_210892 ?auto_210889 ) ) ( not ( = ?auto_210892 ?auto_210887 ) ) ( not ( = ?auto_210892 ?auto_210886 ) ) ( not ( = ?auto_210890 ?auto_210889 ) ) ( not ( = ?auto_210890 ?auto_210887 ) ) ( not ( = ?auto_210890 ?auto_210886 ) ) ( not ( = ?auto_210885 ?auto_210888 ) ) ( not ( = ?auto_210885 ?auto_210891 ) ) ( not ( = ?auto_210885 ?auto_210892 ) ) ( not ( = ?auto_210885 ?auto_210890 ) ) ( HOLDING ?auto_210885 ) ( CLEAR ?auto_210886 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210888 ?auto_210891 ?auto_210892 ?auto_210890 ?auto_210889 ?auto_210887 ?auto_210886 ?auto_210885 )
      ( MAKE-3PILE ?auto_210885 ?auto_210886 ?auto_210887 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210893 - BLOCK
      ?auto_210894 - BLOCK
      ?auto_210895 - BLOCK
    )
    :vars
    (
      ?auto_210899 - BLOCK
      ?auto_210896 - BLOCK
      ?auto_210897 - BLOCK
      ?auto_210898 - BLOCK
      ?auto_210900 - BLOCK
      ?auto_210901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210893 ?auto_210894 ) ) ( not ( = ?auto_210893 ?auto_210895 ) ) ( not ( = ?auto_210894 ?auto_210895 ) ) ( ON ?auto_210895 ?auto_210899 ) ( not ( = ?auto_210893 ?auto_210899 ) ) ( not ( = ?auto_210894 ?auto_210899 ) ) ( not ( = ?auto_210895 ?auto_210899 ) ) ( ON ?auto_210894 ?auto_210895 ) ( ON-TABLE ?auto_210896 ) ( ON ?auto_210897 ?auto_210896 ) ( ON ?auto_210898 ?auto_210897 ) ( ON ?auto_210900 ?auto_210898 ) ( ON ?auto_210899 ?auto_210900 ) ( not ( = ?auto_210896 ?auto_210897 ) ) ( not ( = ?auto_210896 ?auto_210898 ) ) ( not ( = ?auto_210896 ?auto_210900 ) ) ( not ( = ?auto_210896 ?auto_210899 ) ) ( not ( = ?auto_210896 ?auto_210895 ) ) ( not ( = ?auto_210896 ?auto_210894 ) ) ( not ( = ?auto_210897 ?auto_210898 ) ) ( not ( = ?auto_210897 ?auto_210900 ) ) ( not ( = ?auto_210897 ?auto_210899 ) ) ( not ( = ?auto_210897 ?auto_210895 ) ) ( not ( = ?auto_210897 ?auto_210894 ) ) ( not ( = ?auto_210898 ?auto_210900 ) ) ( not ( = ?auto_210898 ?auto_210899 ) ) ( not ( = ?auto_210898 ?auto_210895 ) ) ( not ( = ?auto_210898 ?auto_210894 ) ) ( not ( = ?auto_210900 ?auto_210899 ) ) ( not ( = ?auto_210900 ?auto_210895 ) ) ( not ( = ?auto_210900 ?auto_210894 ) ) ( not ( = ?auto_210893 ?auto_210896 ) ) ( not ( = ?auto_210893 ?auto_210897 ) ) ( not ( = ?auto_210893 ?auto_210898 ) ) ( not ( = ?auto_210893 ?auto_210900 ) ) ( CLEAR ?auto_210894 ) ( ON ?auto_210893 ?auto_210901 ) ( CLEAR ?auto_210893 ) ( HAND-EMPTY ) ( not ( = ?auto_210893 ?auto_210901 ) ) ( not ( = ?auto_210894 ?auto_210901 ) ) ( not ( = ?auto_210895 ?auto_210901 ) ) ( not ( = ?auto_210899 ?auto_210901 ) ) ( not ( = ?auto_210896 ?auto_210901 ) ) ( not ( = ?auto_210897 ?auto_210901 ) ) ( not ( = ?auto_210898 ?auto_210901 ) ) ( not ( = ?auto_210900 ?auto_210901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210893 ?auto_210901 )
      ( MAKE-3PILE ?auto_210893 ?auto_210894 ?auto_210895 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210902 - BLOCK
      ?auto_210903 - BLOCK
      ?auto_210904 - BLOCK
    )
    :vars
    (
      ?auto_210909 - BLOCK
      ?auto_210908 - BLOCK
      ?auto_210906 - BLOCK
      ?auto_210907 - BLOCK
      ?auto_210910 - BLOCK
      ?auto_210905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210902 ?auto_210903 ) ) ( not ( = ?auto_210902 ?auto_210904 ) ) ( not ( = ?auto_210903 ?auto_210904 ) ) ( ON ?auto_210904 ?auto_210909 ) ( not ( = ?auto_210902 ?auto_210909 ) ) ( not ( = ?auto_210903 ?auto_210909 ) ) ( not ( = ?auto_210904 ?auto_210909 ) ) ( ON-TABLE ?auto_210908 ) ( ON ?auto_210906 ?auto_210908 ) ( ON ?auto_210907 ?auto_210906 ) ( ON ?auto_210910 ?auto_210907 ) ( ON ?auto_210909 ?auto_210910 ) ( not ( = ?auto_210908 ?auto_210906 ) ) ( not ( = ?auto_210908 ?auto_210907 ) ) ( not ( = ?auto_210908 ?auto_210910 ) ) ( not ( = ?auto_210908 ?auto_210909 ) ) ( not ( = ?auto_210908 ?auto_210904 ) ) ( not ( = ?auto_210908 ?auto_210903 ) ) ( not ( = ?auto_210906 ?auto_210907 ) ) ( not ( = ?auto_210906 ?auto_210910 ) ) ( not ( = ?auto_210906 ?auto_210909 ) ) ( not ( = ?auto_210906 ?auto_210904 ) ) ( not ( = ?auto_210906 ?auto_210903 ) ) ( not ( = ?auto_210907 ?auto_210910 ) ) ( not ( = ?auto_210907 ?auto_210909 ) ) ( not ( = ?auto_210907 ?auto_210904 ) ) ( not ( = ?auto_210907 ?auto_210903 ) ) ( not ( = ?auto_210910 ?auto_210909 ) ) ( not ( = ?auto_210910 ?auto_210904 ) ) ( not ( = ?auto_210910 ?auto_210903 ) ) ( not ( = ?auto_210902 ?auto_210908 ) ) ( not ( = ?auto_210902 ?auto_210906 ) ) ( not ( = ?auto_210902 ?auto_210907 ) ) ( not ( = ?auto_210902 ?auto_210910 ) ) ( ON ?auto_210902 ?auto_210905 ) ( CLEAR ?auto_210902 ) ( not ( = ?auto_210902 ?auto_210905 ) ) ( not ( = ?auto_210903 ?auto_210905 ) ) ( not ( = ?auto_210904 ?auto_210905 ) ) ( not ( = ?auto_210909 ?auto_210905 ) ) ( not ( = ?auto_210908 ?auto_210905 ) ) ( not ( = ?auto_210906 ?auto_210905 ) ) ( not ( = ?auto_210907 ?auto_210905 ) ) ( not ( = ?auto_210910 ?auto_210905 ) ) ( HOLDING ?auto_210903 ) ( CLEAR ?auto_210904 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210908 ?auto_210906 ?auto_210907 ?auto_210910 ?auto_210909 ?auto_210904 ?auto_210903 )
      ( MAKE-3PILE ?auto_210902 ?auto_210903 ?auto_210904 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210911 - BLOCK
      ?auto_210912 - BLOCK
      ?auto_210913 - BLOCK
    )
    :vars
    (
      ?auto_210917 - BLOCK
      ?auto_210918 - BLOCK
      ?auto_210919 - BLOCK
      ?auto_210914 - BLOCK
      ?auto_210915 - BLOCK
      ?auto_210916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210911 ?auto_210912 ) ) ( not ( = ?auto_210911 ?auto_210913 ) ) ( not ( = ?auto_210912 ?auto_210913 ) ) ( ON ?auto_210913 ?auto_210917 ) ( not ( = ?auto_210911 ?auto_210917 ) ) ( not ( = ?auto_210912 ?auto_210917 ) ) ( not ( = ?auto_210913 ?auto_210917 ) ) ( ON-TABLE ?auto_210918 ) ( ON ?auto_210919 ?auto_210918 ) ( ON ?auto_210914 ?auto_210919 ) ( ON ?auto_210915 ?auto_210914 ) ( ON ?auto_210917 ?auto_210915 ) ( not ( = ?auto_210918 ?auto_210919 ) ) ( not ( = ?auto_210918 ?auto_210914 ) ) ( not ( = ?auto_210918 ?auto_210915 ) ) ( not ( = ?auto_210918 ?auto_210917 ) ) ( not ( = ?auto_210918 ?auto_210913 ) ) ( not ( = ?auto_210918 ?auto_210912 ) ) ( not ( = ?auto_210919 ?auto_210914 ) ) ( not ( = ?auto_210919 ?auto_210915 ) ) ( not ( = ?auto_210919 ?auto_210917 ) ) ( not ( = ?auto_210919 ?auto_210913 ) ) ( not ( = ?auto_210919 ?auto_210912 ) ) ( not ( = ?auto_210914 ?auto_210915 ) ) ( not ( = ?auto_210914 ?auto_210917 ) ) ( not ( = ?auto_210914 ?auto_210913 ) ) ( not ( = ?auto_210914 ?auto_210912 ) ) ( not ( = ?auto_210915 ?auto_210917 ) ) ( not ( = ?auto_210915 ?auto_210913 ) ) ( not ( = ?auto_210915 ?auto_210912 ) ) ( not ( = ?auto_210911 ?auto_210918 ) ) ( not ( = ?auto_210911 ?auto_210919 ) ) ( not ( = ?auto_210911 ?auto_210914 ) ) ( not ( = ?auto_210911 ?auto_210915 ) ) ( ON ?auto_210911 ?auto_210916 ) ( not ( = ?auto_210911 ?auto_210916 ) ) ( not ( = ?auto_210912 ?auto_210916 ) ) ( not ( = ?auto_210913 ?auto_210916 ) ) ( not ( = ?auto_210917 ?auto_210916 ) ) ( not ( = ?auto_210918 ?auto_210916 ) ) ( not ( = ?auto_210919 ?auto_210916 ) ) ( not ( = ?auto_210914 ?auto_210916 ) ) ( not ( = ?auto_210915 ?auto_210916 ) ) ( CLEAR ?auto_210913 ) ( ON ?auto_210912 ?auto_210911 ) ( CLEAR ?auto_210912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210916 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210916 ?auto_210911 )
      ( MAKE-3PILE ?auto_210911 ?auto_210912 ?auto_210913 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210920 - BLOCK
      ?auto_210921 - BLOCK
      ?auto_210922 - BLOCK
    )
    :vars
    (
      ?auto_210924 - BLOCK
      ?auto_210928 - BLOCK
      ?auto_210925 - BLOCK
      ?auto_210923 - BLOCK
      ?auto_210927 - BLOCK
      ?auto_210926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210920 ?auto_210921 ) ) ( not ( = ?auto_210920 ?auto_210922 ) ) ( not ( = ?auto_210921 ?auto_210922 ) ) ( not ( = ?auto_210920 ?auto_210924 ) ) ( not ( = ?auto_210921 ?auto_210924 ) ) ( not ( = ?auto_210922 ?auto_210924 ) ) ( ON-TABLE ?auto_210928 ) ( ON ?auto_210925 ?auto_210928 ) ( ON ?auto_210923 ?auto_210925 ) ( ON ?auto_210927 ?auto_210923 ) ( ON ?auto_210924 ?auto_210927 ) ( not ( = ?auto_210928 ?auto_210925 ) ) ( not ( = ?auto_210928 ?auto_210923 ) ) ( not ( = ?auto_210928 ?auto_210927 ) ) ( not ( = ?auto_210928 ?auto_210924 ) ) ( not ( = ?auto_210928 ?auto_210922 ) ) ( not ( = ?auto_210928 ?auto_210921 ) ) ( not ( = ?auto_210925 ?auto_210923 ) ) ( not ( = ?auto_210925 ?auto_210927 ) ) ( not ( = ?auto_210925 ?auto_210924 ) ) ( not ( = ?auto_210925 ?auto_210922 ) ) ( not ( = ?auto_210925 ?auto_210921 ) ) ( not ( = ?auto_210923 ?auto_210927 ) ) ( not ( = ?auto_210923 ?auto_210924 ) ) ( not ( = ?auto_210923 ?auto_210922 ) ) ( not ( = ?auto_210923 ?auto_210921 ) ) ( not ( = ?auto_210927 ?auto_210924 ) ) ( not ( = ?auto_210927 ?auto_210922 ) ) ( not ( = ?auto_210927 ?auto_210921 ) ) ( not ( = ?auto_210920 ?auto_210928 ) ) ( not ( = ?auto_210920 ?auto_210925 ) ) ( not ( = ?auto_210920 ?auto_210923 ) ) ( not ( = ?auto_210920 ?auto_210927 ) ) ( ON ?auto_210920 ?auto_210926 ) ( not ( = ?auto_210920 ?auto_210926 ) ) ( not ( = ?auto_210921 ?auto_210926 ) ) ( not ( = ?auto_210922 ?auto_210926 ) ) ( not ( = ?auto_210924 ?auto_210926 ) ) ( not ( = ?auto_210928 ?auto_210926 ) ) ( not ( = ?auto_210925 ?auto_210926 ) ) ( not ( = ?auto_210923 ?auto_210926 ) ) ( not ( = ?auto_210927 ?auto_210926 ) ) ( ON ?auto_210921 ?auto_210920 ) ( CLEAR ?auto_210921 ) ( ON-TABLE ?auto_210926 ) ( HOLDING ?auto_210922 ) ( CLEAR ?auto_210924 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210928 ?auto_210925 ?auto_210923 ?auto_210927 ?auto_210924 ?auto_210922 )
      ( MAKE-3PILE ?auto_210920 ?auto_210921 ?auto_210922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210929 - BLOCK
      ?auto_210930 - BLOCK
      ?auto_210931 - BLOCK
    )
    :vars
    (
      ?auto_210933 - BLOCK
      ?auto_210932 - BLOCK
      ?auto_210935 - BLOCK
      ?auto_210936 - BLOCK
      ?auto_210937 - BLOCK
      ?auto_210934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210929 ?auto_210930 ) ) ( not ( = ?auto_210929 ?auto_210931 ) ) ( not ( = ?auto_210930 ?auto_210931 ) ) ( not ( = ?auto_210929 ?auto_210933 ) ) ( not ( = ?auto_210930 ?auto_210933 ) ) ( not ( = ?auto_210931 ?auto_210933 ) ) ( ON-TABLE ?auto_210932 ) ( ON ?auto_210935 ?auto_210932 ) ( ON ?auto_210936 ?auto_210935 ) ( ON ?auto_210937 ?auto_210936 ) ( ON ?auto_210933 ?auto_210937 ) ( not ( = ?auto_210932 ?auto_210935 ) ) ( not ( = ?auto_210932 ?auto_210936 ) ) ( not ( = ?auto_210932 ?auto_210937 ) ) ( not ( = ?auto_210932 ?auto_210933 ) ) ( not ( = ?auto_210932 ?auto_210931 ) ) ( not ( = ?auto_210932 ?auto_210930 ) ) ( not ( = ?auto_210935 ?auto_210936 ) ) ( not ( = ?auto_210935 ?auto_210937 ) ) ( not ( = ?auto_210935 ?auto_210933 ) ) ( not ( = ?auto_210935 ?auto_210931 ) ) ( not ( = ?auto_210935 ?auto_210930 ) ) ( not ( = ?auto_210936 ?auto_210937 ) ) ( not ( = ?auto_210936 ?auto_210933 ) ) ( not ( = ?auto_210936 ?auto_210931 ) ) ( not ( = ?auto_210936 ?auto_210930 ) ) ( not ( = ?auto_210937 ?auto_210933 ) ) ( not ( = ?auto_210937 ?auto_210931 ) ) ( not ( = ?auto_210937 ?auto_210930 ) ) ( not ( = ?auto_210929 ?auto_210932 ) ) ( not ( = ?auto_210929 ?auto_210935 ) ) ( not ( = ?auto_210929 ?auto_210936 ) ) ( not ( = ?auto_210929 ?auto_210937 ) ) ( ON ?auto_210929 ?auto_210934 ) ( not ( = ?auto_210929 ?auto_210934 ) ) ( not ( = ?auto_210930 ?auto_210934 ) ) ( not ( = ?auto_210931 ?auto_210934 ) ) ( not ( = ?auto_210933 ?auto_210934 ) ) ( not ( = ?auto_210932 ?auto_210934 ) ) ( not ( = ?auto_210935 ?auto_210934 ) ) ( not ( = ?auto_210936 ?auto_210934 ) ) ( not ( = ?auto_210937 ?auto_210934 ) ) ( ON ?auto_210930 ?auto_210929 ) ( ON-TABLE ?auto_210934 ) ( CLEAR ?auto_210933 ) ( ON ?auto_210931 ?auto_210930 ) ( CLEAR ?auto_210931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210934 ?auto_210929 ?auto_210930 )
      ( MAKE-3PILE ?auto_210929 ?auto_210930 ?auto_210931 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210938 - BLOCK
      ?auto_210939 - BLOCK
      ?auto_210940 - BLOCK
    )
    :vars
    (
      ?auto_210945 - BLOCK
      ?auto_210941 - BLOCK
      ?auto_210942 - BLOCK
      ?auto_210944 - BLOCK
      ?auto_210946 - BLOCK
      ?auto_210943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210938 ?auto_210939 ) ) ( not ( = ?auto_210938 ?auto_210940 ) ) ( not ( = ?auto_210939 ?auto_210940 ) ) ( not ( = ?auto_210938 ?auto_210945 ) ) ( not ( = ?auto_210939 ?auto_210945 ) ) ( not ( = ?auto_210940 ?auto_210945 ) ) ( ON-TABLE ?auto_210941 ) ( ON ?auto_210942 ?auto_210941 ) ( ON ?auto_210944 ?auto_210942 ) ( ON ?auto_210946 ?auto_210944 ) ( not ( = ?auto_210941 ?auto_210942 ) ) ( not ( = ?auto_210941 ?auto_210944 ) ) ( not ( = ?auto_210941 ?auto_210946 ) ) ( not ( = ?auto_210941 ?auto_210945 ) ) ( not ( = ?auto_210941 ?auto_210940 ) ) ( not ( = ?auto_210941 ?auto_210939 ) ) ( not ( = ?auto_210942 ?auto_210944 ) ) ( not ( = ?auto_210942 ?auto_210946 ) ) ( not ( = ?auto_210942 ?auto_210945 ) ) ( not ( = ?auto_210942 ?auto_210940 ) ) ( not ( = ?auto_210942 ?auto_210939 ) ) ( not ( = ?auto_210944 ?auto_210946 ) ) ( not ( = ?auto_210944 ?auto_210945 ) ) ( not ( = ?auto_210944 ?auto_210940 ) ) ( not ( = ?auto_210944 ?auto_210939 ) ) ( not ( = ?auto_210946 ?auto_210945 ) ) ( not ( = ?auto_210946 ?auto_210940 ) ) ( not ( = ?auto_210946 ?auto_210939 ) ) ( not ( = ?auto_210938 ?auto_210941 ) ) ( not ( = ?auto_210938 ?auto_210942 ) ) ( not ( = ?auto_210938 ?auto_210944 ) ) ( not ( = ?auto_210938 ?auto_210946 ) ) ( ON ?auto_210938 ?auto_210943 ) ( not ( = ?auto_210938 ?auto_210943 ) ) ( not ( = ?auto_210939 ?auto_210943 ) ) ( not ( = ?auto_210940 ?auto_210943 ) ) ( not ( = ?auto_210945 ?auto_210943 ) ) ( not ( = ?auto_210941 ?auto_210943 ) ) ( not ( = ?auto_210942 ?auto_210943 ) ) ( not ( = ?auto_210944 ?auto_210943 ) ) ( not ( = ?auto_210946 ?auto_210943 ) ) ( ON ?auto_210939 ?auto_210938 ) ( ON-TABLE ?auto_210943 ) ( ON ?auto_210940 ?auto_210939 ) ( CLEAR ?auto_210940 ) ( HOLDING ?auto_210945 ) ( CLEAR ?auto_210946 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210941 ?auto_210942 ?auto_210944 ?auto_210946 ?auto_210945 )
      ( MAKE-3PILE ?auto_210938 ?auto_210939 ?auto_210940 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210947 - BLOCK
      ?auto_210948 - BLOCK
      ?auto_210949 - BLOCK
    )
    :vars
    (
      ?auto_210951 - BLOCK
      ?auto_210954 - BLOCK
      ?auto_210952 - BLOCK
      ?auto_210953 - BLOCK
      ?auto_210950 - BLOCK
      ?auto_210955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210947 ?auto_210948 ) ) ( not ( = ?auto_210947 ?auto_210949 ) ) ( not ( = ?auto_210948 ?auto_210949 ) ) ( not ( = ?auto_210947 ?auto_210951 ) ) ( not ( = ?auto_210948 ?auto_210951 ) ) ( not ( = ?auto_210949 ?auto_210951 ) ) ( ON-TABLE ?auto_210954 ) ( ON ?auto_210952 ?auto_210954 ) ( ON ?auto_210953 ?auto_210952 ) ( ON ?auto_210950 ?auto_210953 ) ( not ( = ?auto_210954 ?auto_210952 ) ) ( not ( = ?auto_210954 ?auto_210953 ) ) ( not ( = ?auto_210954 ?auto_210950 ) ) ( not ( = ?auto_210954 ?auto_210951 ) ) ( not ( = ?auto_210954 ?auto_210949 ) ) ( not ( = ?auto_210954 ?auto_210948 ) ) ( not ( = ?auto_210952 ?auto_210953 ) ) ( not ( = ?auto_210952 ?auto_210950 ) ) ( not ( = ?auto_210952 ?auto_210951 ) ) ( not ( = ?auto_210952 ?auto_210949 ) ) ( not ( = ?auto_210952 ?auto_210948 ) ) ( not ( = ?auto_210953 ?auto_210950 ) ) ( not ( = ?auto_210953 ?auto_210951 ) ) ( not ( = ?auto_210953 ?auto_210949 ) ) ( not ( = ?auto_210953 ?auto_210948 ) ) ( not ( = ?auto_210950 ?auto_210951 ) ) ( not ( = ?auto_210950 ?auto_210949 ) ) ( not ( = ?auto_210950 ?auto_210948 ) ) ( not ( = ?auto_210947 ?auto_210954 ) ) ( not ( = ?auto_210947 ?auto_210952 ) ) ( not ( = ?auto_210947 ?auto_210953 ) ) ( not ( = ?auto_210947 ?auto_210950 ) ) ( ON ?auto_210947 ?auto_210955 ) ( not ( = ?auto_210947 ?auto_210955 ) ) ( not ( = ?auto_210948 ?auto_210955 ) ) ( not ( = ?auto_210949 ?auto_210955 ) ) ( not ( = ?auto_210951 ?auto_210955 ) ) ( not ( = ?auto_210954 ?auto_210955 ) ) ( not ( = ?auto_210952 ?auto_210955 ) ) ( not ( = ?auto_210953 ?auto_210955 ) ) ( not ( = ?auto_210950 ?auto_210955 ) ) ( ON ?auto_210948 ?auto_210947 ) ( ON-TABLE ?auto_210955 ) ( ON ?auto_210949 ?auto_210948 ) ( CLEAR ?auto_210950 ) ( ON ?auto_210951 ?auto_210949 ) ( CLEAR ?auto_210951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210955 ?auto_210947 ?auto_210948 ?auto_210949 )
      ( MAKE-3PILE ?auto_210947 ?auto_210948 ?auto_210949 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210956 - BLOCK
      ?auto_210957 - BLOCK
      ?auto_210958 - BLOCK
    )
    :vars
    (
      ?auto_210963 - BLOCK
      ?auto_210964 - BLOCK
      ?auto_210962 - BLOCK
      ?auto_210959 - BLOCK
      ?auto_210960 - BLOCK
      ?auto_210961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210956 ?auto_210957 ) ) ( not ( = ?auto_210956 ?auto_210958 ) ) ( not ( = ?auto_210957 ?auto_210958 ) ) ( not ( = ?auto_210956 ?auto_210963 ) ) ( not ( = ?auto_210957 ?auto_210963 ) ) ( not ( = ?auto_210958 ?auto_210963 ) ) ( ON-TABLE ?auto_210964 ) ( ON ?auto_210962 ?auto_210964 ) ( ON ?auto_210959 ?auto_210962 ) ( not ( = ?auto_210964 ?auto_210962 ) ) ( not ( = ?auto_210964 ?auto_210959 ) ) ( not ( = ?auto_210964 ?auto_210960 ) ) ( not ( = ?auto_210964 ?auto_210963 ) ) ( not ( = ?auto_210964 ?auto_210958 ) ) ( not ( = ?auto_210964 ?auto_210957 ) ) ( not ( = ?auto_210962 ?auto_210959 ) ) ( not ( = ?auto_210962 ?auto_210960 ) ) ( not ( = ?auto_210962 ?auto_210963 ) ) ( not ( = ?auto_210962 ?auto_210958 ) ) ( not ( = ?auto_210962 ?auto_210957 ) ) ( not ( = ?auto_210959 ?auto_210960 ) ) ( not ( = ?auto_210959 ?auto_210963 ) ) ( not ( = ?auto_210959 ?auto_210958 ) ) ( not ( = ?auto_210959 ?auto_210957 ) ) ( not ( = ?auto_210960 ?auto_210963 ) ) ( not ( = ?auto_210960 ?auto_210958 ) ) ( not ( = ?auto_210960 ?auto_210957 ) ) ( not ( = ?auto_210956 ?auto_210964 ) ) ( not ( = ?auto_210956 ?auto_210962 ) ) ( not ( = ?auto_210956 ?auto_210959 ) ) ( not ( = ?auto_210956 ?auto_210960 ) ) ( ON ?auto_210956 ?auto_210961 ) ( not ( = ?auto_210956 ?auto_210961 ) ) ( not ( = ?auto_210957 ?auto_210961 ) ) ( not ( = ?auto_210958 ?auto_210961 ) ) ( not ( = ?auto_210963 ?auto_210961 ) ) ( not ( = ?auto_210964 ?auto_210961 ) ) ( not ( = ?auto_210962 ?auto_210961 ) ) ( not ( = ?auto_210959 ?auto_210961 ) ) ( not ( = ?auto_210960 ?auto_210961 ) ) ( ON ?auto_210957 ?auto_210956 ) ( ON-TABLE ?auto_210961 ) ( ON ?auto_210958 ?auto_210957 ) ( ON ?auto_210963 ?auto_210958 ) ( CLEAR ?auto_210963 ) ( HOLDING ?auto_210960 ) ( CLEAR ?auto_210959 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210964 ?auto_210962 ?auto_210959 ?auto_210960 )
      ( MAKE-3PILE ?auto_210956 ?auto_210957 ?auto_210958 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210965 - BLOCK
      ?auto_210966 - BLOCK
      ?auto_210967 - BLOCK
    )
    :vars
    (
      ?auto_210972 - BLOCK
      ?auto_210968 - BLOCK
      ?auto_210971 - BLOCK
      ?auto_210970 - BLOCK
      ?auto_210969 - BLOCK
      ?auto_210973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210965 ?auto_210966 ) ) ( not ( = ?auto_210965 ?auto_210967 ) ) ( not ( = ?auto_210966 ?auto_210967 ) ) ( not ( = ?auto_210965 ?auto_210972 ) ) ( not ( = ?auto_210966 ?auto_210972 ) ) ( not ( = ?auto_210967 ?auto_210972 ) ) ( ON-TABLE ?auto_210968 ) ( ON ?auto_210971 ?auto_210968 ) ( ON ?auto_210970 ?auto_210971 ) ( not ( = ?auto_210968 ?auto_210971 ) ) ( not ( = ?auto_210968 ?auto_210970 ) ) ( not ( = ?auto_210968 ?auto_210969 ) ) ( not ( = ?auto_210968 ?auto_210972 ) ) ( not ( = ?auto_210968 ?auto_210967 ) ) ( not ( = ?auto_210968 ?auto_210966 ) ) ( not ( = ?auto_210971 ?auto_210970 ) ) ( not ( = ?auto_210971 ?auto_210969 ) ) ( not ( = ?auto_210971 ?auto_210972 ) ) ( not ( = ?auto_210971 ?auto_210967 ) ) ( not ( = ?auto_210971 ?auto_210966 ) ) ( not ( = ?auto_210970 ?auto_210969 ) ) ( not ( = ?auto_210970 ?auto_210972 ) ) ( not ( = ?auto_210970 ?auto_210967 ) ) ( not ( = ?auto_210970 ?auto_210966 ) ) ( not ( = ?auto_210969 ?auto_210972 ) ) ( not ( = ?auto_210969 ?auto_210967 ) ) ( not ( = ?auto_210969 ?auto_210966 ) ) ( not ( = ?auto_210965 ?auto_210968 ) ) ( not ( = ?auto_210965 ?auto_210971 ) ) ( not ( = ?auto_210965 ?auto_210970 ) ) ( not ( = ?auto_210965 ?auto_210969 ) ) ( ON ?auto_210965 ?auto_210973 ) ( not ( = ?auto_210965 ?auto_210973 ) ) ( not ( = ?auto_210966 ?auto_210973 ) ) ( not ( = ?auto_210967 ?auto_210973 ) ) ( not ( = ?auto_210972 ?auto_210973 ) ) ( not ( = ?auto_210968 ?auto_210973 ) ) ( not ( = ?auto_210971 ?auto_210973 ) ) ( not ( = ?auto_210970 ?auto_210973 ) ) ( not ( = ?auto_210969 ?auto_210973 ) ) ( ON ?auto_210966 ?auto_210965 ) ( ON-TABLE ?auto_210973 ) ( ON ?auto_210967 ?auto_210966 ) ( ON ?auto_210972 ?auto_210967 ) ( CLEAR ?auto_210970 ) ( ON ?auto_210969 ?auto_210972 ) ( CLEAR ?auto_210969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210973 ?auto_210965 ?auto_210966 ?auto_210967 ?auto_210972 )
      ( MAKE-3PILE ?auto_210965 ?auto_210966 ?auto_210967 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210974 - BLOCK
      ?auto_210975 - BLOCK
      ?auto_210976 - BLOCK
    )
    :vars
    (
      ?auto_210982 - BLOCK
      ?auto_210980 - BLOCK
      ?auto_210978 - BLOCK
      ?auto_210979 - BLOCK
      ?auto_210981 - BLOCK
      ?auto_210977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210974 ?auto_210975 ) ) ( not ( = ?auto_210974 ?auto_210976 ) ) ( not ( = ?auto_210975 ?auto_210976 ) ) ( not ( = ?auto_210974 ?auto_210982 ) ) ( not ( = ?auto_210975 ?auto_210982 ) ) ( not ( = ?auto_210976 ?auto_210982 ) ) ( ON-TABLE ?auto_210980 ) ( ON ?auto_210978 ?auto_210980 ) ( not ( = ?auto_210980 ?auto_210978 ) ) ( not ( = ?auto_210980 ?auto_210979 ) ) ( not ( = ?auto_210980 ?auto_210981 ) ) ( not ( = ?auto_210980 ?auto_210982 ) ) ( not ( = ?auto_210980 ?auto_210976 ) ) ( not ( = ?auto_210980 ?auto_210975 ) ) ( not ( = ?auto_210978 ?auto_210979 ) ) ( not ( = ?auto_210978 ?auto_210981 ) ) ( not ( = ?auto_210978 ?auto_210982 ) ) ( not ( = ?auto_210978 ?auto_210976 ) ) ( not ( = ?auto_210978 ?auto_210975 ) ) ( not ( = ?auto_210979 ?auto_210981 ) ) ( not ( = ?auto_210979 ?auto_210982 ) ) ( not ( = ?auto_210979 ?auto_210976 ) ) ( not ( = ?auto_210979 ?auto_210975 ) ) ( not ( = ?auto_210981 ?auto_210982 ) ) ( not ( = ?auto_210981 ?auto_210976 ) ) ( not ( = ?auto_210981 ?auto_210975 ) ) ( not ( = ?auto_210974 ?auto_210980 ) ) ( not ( = ?auto_210974 ?auto_210978 ) ) ( not ( = ?auto_210974 ?auto_210979 ) ) ( not ( = ?auto_210974 ?auto_210981 ) ) ( ON ?auto_210974 ?auto_210977 ) ( not ( = ?auto_210974 ?auto_210977 ) ) ( not ( = ?auto_210975 ?auto_210977 ) ) ( not ( = ?auto_210976 ?auto_210977 ) ) ( not ( = ?auto_210982 ?auto_210977 ) ) ( not ( = ?auto_210980 ?auto_210977 ) ) ( not ( = ?auto_210978 ?auto_210977 ) ) ( not ( = ?auto_210979 ?auto_210977 ) ) ( not ( = ?auto_210981 ?auto_210977 ) ) ( ON ?auto_210975 ?auto_210974 ) ( ON-TABLE ?auto_210977 ) ( ON ?auto_210976 ?auto_210975 ) ( ON ?auto_210982 ?auto_210976 ) ( ON ?auto_210981 ?auto_210982 ) ( CLEAR ?auto_210981 ) ( HOLDING ?auto_210979 ) ( CLEAR ?auto_210978 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210980 ?auto_210978 ?auto_210979 )
      ( MAKE-3PILE ?auto_210974 ?auto_210975 ?auto_210976 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210983 - BLOCK
      ?auto_210984 - BLOCK
      ?auto_210985 - BLOCK
    )
    :vars
    (
      ?auto_210990 - BLOCK
      ?auto_210989 - BLOCK
      ?auto_210988 - BLOCK
      ?auto_210987 - BLOCK
      ?auto_210986 - BLOCK
      ?auto_210991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210983 ?auto_210984 ) ) ( not ( = ?auto_210983 ?auto_210985 ) ) ( not ( = ?auto_210984 ?auto_210985 ) ) ( not ( = ?auto_210983 ?auto_210990 ) ) ( not ( = ?auto_210984 ?auto_210990 ) ) ( not ( = ?auto_210985 ?auto_210990 ) ) ( ON-TABLE ?auto_210989 ) ( ON ?auto_210988 ?auto_210989 ) ( not ( = ?auto_210989 ?auto_210988 ) ) ( not ( = ?auto_210989 ?auto_210987 ) ) ( not ( = ?auto_210989 ?auto_210986 ) ) ( not ( = ?auto_210989 ?auto_210990 ) ) ( not ( = ?auto_210989 ?auto_210985 ) ) ( not ( = ?auto_210989 ?auto_210984 ) ) ( not ( = ?auto_210988 ?auto_210987 ) ) ( not ( = ?auto_210988 ?auto_210986 ) ) ( not ( = ?auto_210988 ?auto_210990 ) ) ( not ( = ?auto_210988 ?auto_210985 ) ) ( not ( = ?auto_210988 ?auto_210984 ) ) ( not ( = ?auto_210987 ?auto_210986 ) ) ( not ( = ?auto_210987 ?auto_210990 ) ) ( not ( = ?auto_210987 ?auto_210985 ) ) ( not ( = ?auto_210987 ?auto_210984 ) ) ( not ( = ?auto_210986 ?auto_210990 ) ) ( not ( = ?auto_210986 ?auto_210985 ) ) ( not ( = ?auto_210986 ?auto_210984 ) ) ( not ( = ?auto_210983 ?auto_210989 ) ) ( not ( = ?auto_210983 ?auto_210988 ) ) ( not ( = ?auto_210983 ?auto_210987 ) ) ( not ( = ?auto_210983 ?auto_210986 ) ) ( ON ?auto_210983 ?auto_210991 ) ( not ( = ?auto_210983 ?auto_210991 ) ) ( not ( = ?auto_210984 ?auto_210991 ) ) ( not ( = ?auto_210985 ?auto_210991 ) ) ( not ( = ?auto_210990 ?auto_210991 ) ) ( not ( = ?auto_210989 ?auto_210991 ) ) ( not ( = ?auto_210988 ?auto_210991 ) ) ( not ( = ?auto_210987 ?auto_210991 ) ) ( not ( = ?auto_210986 ?auto_210991 ) ) ( ON ?auto_210984 ?auto_210983 ) ( ON-TABLE ?auto_210991 ) ( ON ?auto_210985 ?auto_210984 ) ( ON ?auto_210990 ?auto_210985 ) ( ON ?auto_210986 ?auto_210990 ) ( CLEAR ?auto_210988 ) ( ON ?auto_210987 ?auto_210986 ) ( CLEAR ?auto_210987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210991 ?auto_210983 ?auto_210984 ?auto_210985 ?auto_210990 ?auto_210986 )
      ( MAKE-3PILE ?auto_210983 ?auto_210984 ?auto_210985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_210992 - BLOCK
      ?auto_210993 - BLOCK
      ?auto_210994 - BLOCK
    )
    :vars
    (
      ?auto_210995 - BLOCK
      ?auto_210996 - BLOCK
      ?auto_210997 - BLOCK
      ?auto_210998 - BLOCK
      ?auto_211000 - BLOCK
      ?auto_210999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_210992 ?auto_210993 ) ) ( not ( = ?auto_210992 ?auto_210994 ) ) ( not ( = ?auto_210993 ?auto_210994 ) ) ( not ( = ?auto_210992 ?auto_210995 ) ) ( not ( = ?auto_210993 ?auto_210995 ) ) ( not ( = ?auto_210994 ?auto_210995 ) ) ( ON-TABLE ?auto_210996 ) ( not ( = ?auto_210996 ?auto_210997 ) ) ( not ( = ?auto_210996 ?auto_210998 ) ) ( not ( = ?auto_210996 ?auto_211000 ) ) ( not ( = ?auto_210996 ?auto_210995 ) ) ( not ( = ?auto_210996 ?auto_210994 ) ) ( not ( = ?auto_210996 ?auto_210993 ) ) ( not ( = ?auto_210997 ?auto_210998 ) ) ( not ( = ?auto_210997 ?auto_211000 ) ) ( not ( = ?auto_210997 ?auto_210995 ) ) ( not ( = ?auto_210997 ?auto_210994 ) ) ( not ( = ?auto_210997 ?auto_210993 ) ) ( not ( = ?auto_210998 ?auto_211000 ) ) ( not ( = ?auto_210998 ?auto_210995 ) ) ( not ( = ?auto_210998 ?auto_210994 ) ) ( not ( = ?auto_210998 ?auto_210993 ) ) ( not ( = ?auto_211000 ?auto_210995 ) ) ( not ( = ?auto_211000 ?auto_210994 ) ) ( not ( = ?auto_211000 ?auto_210993 ) ) ( not ( = ?auto_210992 ?auto_210996 ) ) ( not ( = ?auto_210992 ?auto_210997 ) ) ( not ( = ?auto_210992 ?auto_210998 ) ) ( not ( = ?auto_210992 ?auto_211000 ) ) ( ON ?auto_210992 ?auto_210999 ) ( not ( = ?auto_210992 ?auto_210999 ) ) ( not ( = ?auto_210993 ?auto_210999 ) ) ( not ( = ?auto_210994 ?auto_210999 ) ) ( not ( = ?auto_210995 ?auto_210999 ) ) ( not ( = ?auto_210996 ?auto_210999 ) ) ( not ( = ?auto_210997 ?auto_210999 ) ) ( not ( = ?auto_210998 ?auto_210999 ) ) ( not ( = ?auto_211000 ?auto_210999 ) ) ( ON ?auto_210993 ?auto_210992 ) ( ON-TABLE ?auto_210999 ) ( ON ?auto_210994 ?auto_210993 ) ( ON ?auto_210995 ?auto_210994 ) ( ON ?auto_211000 ?auto_210995 ) ( ON ?auto_210998 ?auto_211000 ) ( CLEAR ?auto_210998 ) ( HOLDING ?auto_210997 ) ( CLEAR ?auto_210996 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210996 ?auto_210997 )
      ( MAKE-3PILE ?auto_210992 ?auto_210993 ?auto_210994 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211001 - BLOCK
      ?auto_211002 - BLOCK
      ?auto_211003 - BLOCK
    )
    :vars
    (
      ?auto_211004 - BLOCK
      ?auto_211009 - BLOCK
      ?auto_211007 - BLOCK
      ?auto_211005 - BLOCK
      ?auto_211006 - BLOCK
      ?auto_211008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211001 ?auto_211002 ) ) ( not ( = ?auto_211001 ?auto_211003 ) ) ( not ( = ?auto_211002 ?auto_211003 ) ) ( not ( = ?auto_211001 ?auto_211004 ) ) ( not ( = ?auto_211002 ?auto_211004 ) ) ( not ( = ?auto_211003 ?auto_211004 ) ) ( ON-TABLE ?auto_211009 ) ( not ( = ?auto_211009 ?auto_211007 ) ) ( not ( = ?auto_211009 ?auto_211005 ) ) ( not ( = ?auto_211009 ?auto_211006 ) ) ( not ( = ?auto_211009 ?auto_211004 ) ) ( not ( = ?auto_211009 ?auto_211003 ) ) ( not ( = ?auto_211009 ?auto_211002 ) ) ( not ( = ?auto_211007 ?auto_211005 ) ) ( not ( = ?auto_211007 ?auto_211006 ) ) ( not ( = ?auto_211007 ?auto_211004 ) ) ( not ( = ?auto_211007 ?auto_211003 ) ) ( not ( = ?auto_211007 ?auto_211002 ) ) ( not ( = ?auto_211005 ?auto_211006 ) ) ( not ( = ?auto_211005 ?auto_211004 ) ) ( not ( = ?auto_211005 ?auto_211003 ) ) ( not ( = ?auto_211005 ?auto_211002 ) ) ( not ( = ?auto_211006 ?auto_211004 ) ) ( not ( = ?auto_211006 ?auto_211003 ) ) ( not ( = ?auto_211006 ?auto_211002 ) ) ( not ( = ?auto_211001 ?auto_211009 ) ) ( not ( = ?auto_211001 ?auto_211007 ) ) ( not ( = ?auto_211001 ?auto_211005 ) ) ( not ( = ?auto_211001 ?auto_211006 ) ) ( ON ?auto_211001 ?auto_211008 ) ( not ( = ?auto_211001 ?auto_211008 ) ) ( not ( = ?auto_211002 ?auto_211008 ) ) ( not ( = ?auto_211003 ?auto_211008 ) ) ( not ( = ?auto_211004 ?auto_211008 ) ) ( not ( = ?auto_211009 ?auto_211008 ) ) ( not ( = ?auto_211007 ?auto_211008 ) ) ( not ( = ?auto_211005 ?auto_211008 ) ) ( not ( = ?auto_211006 ?auto_211008 ) ) ( ON ?auto_211002 ?auto_211001 ) ( ON-TABLE ?auto_211008 ) ( ON ?auto_211003 ?auto_211002 ) ( ON ?auto_211004 ?auto_211003 ) ( ON ?auto_211006 ?auto_211004 ) ( ON ?auto_211005 ?auto_211006 ) ( CLEAR ?auto_211009 ) ( ON ?auto_211007 ?auto_211005 ) ( CLEAR ?auto_211007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211008 ?auto_211001 ?auto_211002 ?auto_211003 ?auto_211004 ?auto_211006 ?auto_211005 )
      ( MAKE-3PILE ?auto_211001 ?auto_211002 ?auto_211003 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211010 - BLOCK
      ?auto_211011 - BLOCK
      ?auto_211012 - BLOCK
    )
    :vars
    (
      ?auto_211018 - BLOCK
      ?auto_211016 - BLOCK
      ?auto_211014 - BLOCK
      ?auto_211013 - BLOCK
      ?auto_211017 - BLOCK
      ?auto_211015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211010 ?auto_211011 ) ) ( not ( = ?auto_211010 ?auto_211012 ) ) ( not ( = ?auto_211011 ?auto_211012 ) ) ( not ( = ?auto_211010 ?auto_211018 ) ) ( not ( = ?auto_211011 ?auto_211018 ) ) ( not ( = ?auto_211012 ?auto_211018 ) ) ( not ( = ?auto_211016 ?auto_211014 ) ) ( not ( = ?auto_211016 ?auto_211013 ) ) ( not ( = ?auto_211016 ?auto_211017 ) ) ( not ( = ?auto_211016 ?auto_211018 ) ) ( not ( = ?auto_211016 ?auto_211012 ) ) ( not ( = ?auto_211016 ?auto_211011 ) ) ( not ( = ?auto_211014 ?auto_211013 ) ) ( not ( = ?auto_211014 ?auto_211017 ) ) ( not ( = ?auto_211014 ?auto_211018 ) ) ( not ( = ?auto_211014 ?auto_211012 ) ) ( not ( = ?auto_211014 ?auto_211011 ) ) ( not ( = ?auto_211013 ?auto_211017 ) ) ( not ( = ?auto_211013 ?auto_211018 ) ) ( not ( = ?auto_211013 ?auto_211012 ) ) ( not ( = ?auto_211013 ?auto_211011 ) ) ( not ( = ?auto_211017 ?auto_211018 ) ) ( not ( = ?auto_211017 ?auto_211012 ) ) ( not ( = ?auto_211017 ?auto_211011 ) ) ( not ( = ?auto_211010 ?auto_211016 ) ) ( not ( = ?auto_211010 ?auto_211014 ) ) ( not ( = ?auto_211010 ?auto_211013 ) ) ( not ( = ?auto_211010 ?auto_211017 ) ) ( ON ?auto_211010 ?auto_211015 ) ( not ( = ?auto_211010 ?auto_211015 ) ) ( not ( = ?auto_211011 ?auto_211015 ) ) ( not ( = ?auto_211012 ?auto_211015 ) ) ( not ( = ?auto_211018 ?auto_211015 ) ) ( not ( = ?auto_211016 ?auto_211015 ) ) ( not ( = ?auto_211014 ?auto_211015 ) ) ( not ( = ?auto_211013 ?auto_211015 ) ) ( not ( = ?auto_211017 ?auto_211015 ) ) ( ON ?auto_211011 ?auto_211010 ) ( ON-TABLE ?auto_211015 ) ( ON ?auto_211012 ?auto_211011 ) ( ON ?auto_211018 ?auto_211012 ) ( ON ?auto_211017 ?auto_211018 ) ( ON ?auto_211013 ?auto_211017 ) ( ON ?auto_211014 ?auto_211013 ) ( CLEAR ?auto_211014 ) ( HOLDING ?auto_211016 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_211016 )
      ( MAKE-3PILE ?auto_211010 ?auto_211011 ?auto_211012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211019 - BLOCK
      ?auto_211020 - BLOCK
      ?auto_211021 - BLOCK
    )
    :vars
    (
      ?auto_211024 - BLOCK
      ?auto_211026 - BLOCK
      ?auto_211023 - BLOCK
      ?auto_211025 - BLOCK
      ?auto_211022 - BLOCK
      ?auto_211027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211019 ?auto_211020 ) ) ( not ( = ?auto_211019 ?auto_211021 ) ) ( not ( = ?auto_211020 ?auto_211021 ) ) ( not ( = ?auto_211019 ?auto_211024 ) ) ( not ( = ?auto_211020 ?auto_211024 ) ) ( not ( = ?auto_211021 ?auto_211024 ) ) ( not ( = ?auto_211026 ?auto_211023 ) ) ( not ( = ?auto_211026 ?auto_211025 ) ) ( not ( = ?auto_211026 ?auto_211022 ) ) ( not ( = ?auto_211026 ?auto_211024 ) ) ( not ( = ?auto_211026 ?auto_211021 ) ) ( not ( = ?auto_211026 ?auto_211020 ) ) ( not ( = ?auto_211023 ?auto_211025 ) ) ( not ( = ?auto_211023 ?auto_211022 ) ) ( not ( = ?auto_211023 ?auto_211024 ) ) ( not ( = ?auto_211023 ?auto_211021 ) ) ( not ( = ?auto_211023 ?auto_211020 ) ) ( not ( = ?auto_211025 ?auto_211022 ) ) ( not ( = ?auto_211025 ?auto_211024 ) ) ( not ( = ?auto_211025 ?auto_211021 ) ) ( not ( = ?auto_211025 ?auto_211020 ) ) ( not ( = ?auto_211022 ?auto_211024 ) ) ( not ( = ?auto_211022 ?auto_211021 ) ) ( not ( = ?auto_211022 ?auto_211020 ) ) ( not ( = ?auto_211019 ?auto_211026 ) ) ( not ( = ?auto_211019 ?auto_211023 ) ) ( not ( = ?auto_211019 ?auto_211025 ) ) ( not ( = ?auto_211019 ?auto_211022 ) ) ( ON ?auto_211019 ?auto_211027 ) ( not ( = ?auto_211019 ?auto_211027 ) ) ( not ( = ?auto_211020 ?auto_211027 ) ) ( not ( = ?auto_211021 ?auto_211027 ) ) ( not ( = ?auto_211024 ?auto_211027 ) ) ( not ( = ?auto_211026 ?auto_211027 ) ) ( not ( = ?auto_211023 ?auto_211027 ) ) ( not ( = ?auto_211025 ?auto_211027 ) ) ( not ( = ?auto_211022 ?auto_211027 ) ) ( ON ?auto_211020 ?auto_211019 ) ( ON-TABLE ?auto_211027 ) ( ON ?auto_211021 ?auto_211020 ) ( ON ?auto_211024 ?auto_211021 ) ( ON ?auto_211022 ?auto_211024 ) ( ON ?auto_211025 ?auto_211022 ) ( ON ?auto_211023 ?auto_211025 ) ( ON ?auto_211026 ?auto_211023 ) ( CLEAR ?auto_211026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_211027 ?auto_211019 ?auto_211020 ?auto_211021 ?auto_211024 ?auto_211022 ?auto_211025 ?auto_211023 )
      ( MAKE-3PILE ?auto_211019 ?auto_211020 ?auto_211021 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211032 - BLOCK
      ?auto_211033 - BLOCK
      ?auto_211034 - BLOCK
      ?auto_211035 - BLOCK
    )
    :vars
    (
      ?auto_211036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211036 ?auto_211035 ) ( CLEAR ?auto_211036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211032 ) ( ON ?auto_211033 ?auto_211032 ) ( ON ?auto_211034 ?auto_211033 ) ( ON ?auto_211035 ?auto_211034 ) ( not ( = ?auto_211032 ?auto_211033 ) ) ( not ( = ?auto_211032 ?auto_211034 ) ) ( not ( = ?auto_211032 ?auto_211035 ) ) ( not ( = ?auto_211032 ?auto_211036 ) ) ( not ( = ?auto_211033 ?auto_211034 ) ) ( not ( = ?auto_211033 ?auto_211035 ) ) ( not ( = ?auto_211033 ?auto_211036 ) ) ( not ( = ?auto_211034 ?auto_211035 ) ) ( not ( = ?auto_211034 ?auto_211036 ) ) ( not ( = ?auto_211035 ?auto_211036 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_211036 ?auto_211035 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211037 - BLOCK
      ?auto_211038 - BLOCK
      ?auto_211039 - BLOCK
      ?auto_211040 - BLOCK
    )
    :vars
    (
      ?auto_211041 - BLOCK
      ?auto_211042 - BLOCK
      ?auto_211043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211041 ?auto_211040 ) ( CLEAR ?auto_211041 ) ( ON-TABLE ?auto_211037 ) ( ON ?auto_211038 ?auto_211037 ) ( ON ?auto_211039 ?auto_211038 ) ( ON ?auto_211040 ?auto_211039 ) ( not ( = ?auto_211037 ?auto_211038 ) ) ( not ( = ?auto_211037 ?auto_211039 ) ) ( not ( = ?auto_211037 ?auto_211040 ) ) ( not ( = ?auto_211037 ?auto_211041 ) ) ( not ( = ?auto_211038 ?auto_211039 ) ) ( not ( = ?auto_211038 ?auto_211040 ) ) ( not ( = ?auto_211038 ?auto_211041 ) ) ( not ( = ?auto_211039 ?auto_211040 ) ) ( not ( = ?auto_211039 ?auto_211041 ) ) ( not ( = ?auto_211040 ?auto_211041 ) ) ( HOLDING ?auto_211042 ) ( CLEAR ?auto_211043 ) ( not ( = ?auto_211037 ?auto_211042 ) ) ( not ( = ?auto_211037 ?auto_211043 ) ) ( not ( = ?auto_211038 ?auto_211042 ) ) ( not ( = ?auto_211038 ?auto_211043 ) ) ( not ( = ?auto_211039 ?auto_211042 ) ) ( not ( = ?auto_211039 ?auto_211043 ) ) ( not ( = ?auto_211040 ?auto_211042 ) ) ( not ( = ?auto_211040 ?auto_211043 ) ) ( not ( = ?auto_211041 ?auto_211042 ) ) ( not ( = ?auto_211041 ?auto_211043 ) ) ( not ( = ?auto_211042 ?auto_211043 ) ) )
    :subtasks
    ( ( !STACK ?auto_211042 ?auto_211043 )
      ( MAKE-4PILE ?auto_211037 ?auto_211038 ?auto_211039 ?auto_211040 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211044 - BLOCK
      ?auto_211045 - BLOCK
      ?auto_211046 - BLOCK
      ?auto_211047 - BLOCK
    )
    :vars
    (
      ?auto_211048 - BLOCK
      ?auto_211049 - BLOCK
      ?auto_211050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211048 ?auto_211047 ) ( ON-TABLE ?auto_211044 ) ( ON ?auto_211045 ?auto_211044 ) ( ON ?auto_211046 ?auto_211045 ) ( ON ?auto_211047 ?auto_211046 ) ( not ( = ?auto_211044 ?auto_211045 ) ) ( not ( = ?auto_211044 ?auto_211046 ) ) ( not ( = ?auto_211044 ?auto_211047 ) ) ( not ( = ?auto_211044 ?auto_211048 ) ) ( not ( = ?auto_211045 ?auto_211046 ) ) ( not ( = ?auto_211045 ?auto_211047 ) ) ( not ( = ?auto_211045 ?auto_211048 ) ) ( not ( = ?auto_211046 ?auto_211047 ) ) ( not ( = ?auto_211046 ?auto_211048 ) ) ( not ( = ?auto_211047 ?auto_211048 ) ) ( CLEAR ?auto_211049 ) ( not ( = ?auto_211044 ?auto_211050 ) ) ( not ( = ?auto_211044 ?auto_211049 ) ) ( not ( = ?auto_211045 ?auto_211050 ) ) ( not ( = ?auto_211045 ?auto_211049 ) ) ( not ( = ?auto_211046 ?auto_211050 ) ) ( not ( = ?auto_211046 ?auto_211049 ) ) ( not ( = ?auto_211047 ?auto_211050 ) ) ( not ( = ?auto_211047 ?auto_211049 ) ) ( not ( = ?auto_211048 ?auto_211050 ) ) ( not ( = ?auto_211048 ?auto_211049 ) ) ( not ( = ?auto_211050 ?auto_211049 ) ) ( ON ?auto_211050 ?auto_211048 ) ( CLEAR ?auto_211050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211044 ?auto_211045 ?auto_211046 ?auto_211047 ?auto_211048 )
      ( MAKE-4PILE ?auto_211044 ?auto_211045 ?auto_211046 ?auto_211047 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211051 - BLOCK
      ?auto_211052 - BLOCK
      ?auto_211053 - BLOCK
      ?auto_211054 - BLOCK
    )
    :vars
    (
      ?auto_211057 - BLOCK
      ?auto_211056 - BLOCK
      ?auto_211055 - BLOCK
      ?auto_211058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211057 ?auto_211054 ) ( ON-TABLE ?auto_211051 ) ( ON ?auto_211052 ?auto_211051 ) ( ON ?auto_211053 ?auto_211052 ) ( ON ?auto_211054 ?auto_211053 ) ( not ( = ?auto_211051 ?auto_211052 ) ) ( not ( = ?auto_211051 ?auto_211053 ) ) ( not ( = ?auto_211051 ?auto_211054 ) ) ( not ( = ?auto_211051 ?auto_211057 ) ) ( not ( = ?auto_211052 ?auto_211053 ) ) ( not ( = ?auto_211052 ?auto_211054 ) ) ( not ( = ?auto_211052 ?auto_211057 ) ) ( not ( = ?auto_211053 ?auto_211054 ) ) ( not ( = ?auto_211053 ?auto_211057 ) ) ( not ( = ?auto_211054 ?auto_211057 ) ) ( not ( = ?auto_211051 ?auto_211056 ) ) ( not ( = ?auto_211051 ?auto_211055 ) ) ( not ( = ?auto_211052 ?auto_211056 ) ) ( not ( = ?auto_211052 ?auto_211055 ) ) ( not ( = ?auto_211053 ?auto_211056 ) ) ( not ( = ?auto_211053 ?auto_211055 ) ) ( not ( = ?auto_211054 ?auto_211056 ) ) ( not ( = ?auto_211054 ?auto_211055 ) ) ( not ( = ?auto_211057 ?auto_211056 ) ) ( not ( = ?auto_211057 ?auto_211055 ) ) ( not ( = ?auto_211056 ?auto_211055 ) ) ( ON ?auto_211056 ?auto_211057 ) ( CLEAR ?auto_211056 ) ( HOLDING ?auto_211055 ) ( CLEAR ?auto_211058 ) ( ON-TABLE ?auto_211058 ) ( not ( = ?auto_211058 ?auto_211055 ) ) ( not ( = ?auto_211051 ?auto_211058 ) ) ( not ( = ?auto_211052 ?auto_211058 ) ) ( not ( = ?auto_211053 ?auto_211058 ) ) ( not ( = ?auto_211054 ?auto_211058 ) ) ( not ( = ?auto_211057 ?auto_211058 ) ) ( not ( = ?auto_211056 ?auto_211058 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211058 ?auto_211055 )
      ( MAKE-4PILE ?auto_211051 ?auto_211052 ?auto_211053 ?auto_211054 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211059 - BLOCK
      ?auto_211060 - BLOCK
      ?auto_211061 - BLOCK
      ?auto_211062 - BLOCK
    )
    :vars
    (
      ?auto_211064 - BLOCK
      ?auto_211065 - BLOCK
      ?auto_211063 - BLOCK
      ?auto_211066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211064 ?auto_211062 ) ( ON-TABLE ?auto_211059 ) ( ON ?auto_211060 ?auto_211059 ) ( ON ?auto_211061 ?auto_211060 ) ( ON ?auto_211062 ?auto_211061 ) ( not ( = ?auto_211059 ?auto_211060 ) ) ( not ( = ?auto_211059 ?auto_211061 ) ) ( not ( = ?auto_211059 ?auto_211062 ) ) ( not ( = ?auto_211059 ?auto_211064 ) ) ( not ( = ?auto_211060 ?auto_211061 ) ) ( not ( = ?auto_211060 ?auto_211062 ) ) ( not ( = ?auto_211060 ?auto_211064 ) ) ( not ( = ?auto_211061 ?auto_211062 ) ) ( not ( = ?auto_211061 ?auto_211064 ) ) ( not ( = ?auto_211062 ?auto_211064 ) ) ( not ( = ?auto_211059 ?auto_211065 ) ) ( not ( = ?auto_211059 ?auto_211063 ) ) ( not ( = ?auto_211060 ?auto_211065 ) ) ( not ( = ?auto_211060 ?auto_211063 ) ) ( not ( = ?auto_211061 ?auto_211065 ) ) ( not ( = ?auto_211061 ?auto_211063 ) ) ( not ( = ?auto_211062 ?auto_211065 ) ) ( not ( = ?auto_211062 ?auto_211063 ) ) ( not ( = ?auto_211064 ?auto_211065 ) ) ( not ( = ?auto_211064 ?auto_211063 ) ) ( not ( = ?auto_211065 ?auto_211063 ) ) ( ON ?auto_211065 ?auto_211064 ) ( CLEAR ?auto_211066 ) ( ON-TABLE ?auto_211066 ) ( not ( = ?auto_211066 ?auto_211063 ) ) ( not ( = ?auto_211059 ?auto_211066 ) ) ( not ( = ?auto_211060 ?auto_211066 ) ) ( not ( = ?auto_211061 ?auto_211066 ) ) ( not ( = ?auto_211062 ?auto_211066 ) ) ( not ( = ?auto_211064 ?auto_211066 ) ) ( not ( = ?auto_211065 ?auto_211066 ) ) ( ON ?auto_211063 ?auto_211065 ) ( CLEAR ?auto_211063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211059 ?auto_211060 ?auto_211061 ?auto_211062 ?auto_211064 ?auto_211065 )
      ( MAKE-4PILE ?auto_211059 ?auto_211060 ?auto_211061 ?auto_211062 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211067 - BLOCK
      ?auto_211068 - BLOCK
      ?auto_211069 - BLOCK
      ?auto_211070 - BLOCK
    )
    :vars
    (
      ?auto_211073 - BLOCK
      ?auto_211071 - BLOCK
      ?auto_211072 - BLOCK
      ?auto_211074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211073 ?auto_211070 ) ( ON-TABLE ?auto_211067 ) ( ON ?auto_211068 ?auto_211067 ) ( ON ?auto_211069 ?auto_211068 ) ( ON ?auto_211070 ?auto_211069 ) ( not ( = ?auto_211067 ?auto_211068 ) ) ( not ( = ?auto_211067 ?auto_211069 ) ) ( not ( = ?auto_211067 ?auto_211070 ) ) ( not ( = ?auto_211067 ?auto_211073 ) ) ( not ( = ?auto_211068 ?auto_211069 ) ) ( not ( = ?auto_211068 ?auto_211070 ) ) ( not ( = ?auto_211068 ?auto_211073 ) ) ( not ( = ?auto_211069 ?auto_211070 ) ) ( not ( = ?auto_211069 ?auto_211073 ) ) ( not ( = ?auto_211070 ?auto_211073 ) ) ( not ( = ?auto_211067 ?auto_211071 ) ) ( not ( = ?auto_211067 ?auto_211072 ) ) ( not ( = ?auto_211068 ?auto_211071 ) ) ( not ( = ?auto_211068 ?auto_211072 ) ) ( not ( = ?auto_211069 ?auto_211071 ) ) ( not ( = ?auto_211069 ?auto_211072 ) ) ( not ( = ?auto_211070 ?auto_211071 ) ) ( not ( = ?auto_211070 ?auto_211072 ) ) ( not ( = ?auto_211073 ?auto_211071 ) ) ( not ( = ?auto_211073 ?auto_211072 ) ) ( not ( = ?auto_211071 ?auto_211072 ) ) ( ON ?auto_211071 ?auto_211073 ) ( not ( = ?auto_211074 ?auto_211072 ) ) ( not ( = ?auto_211067 ?auto_211074 ) ) ( not ( = ?auto_211068 ?auto_211074 ) ) ( not ( = ?auto_211069 ?auto_211074 ) ) ( not ( = ?auto_211070 ?auto_211074 ) ) ( not ( = ?auto_211073 ?auto_211074 ) ) ( not ( = ?auto_211071 ?auto_211074 ) ) ( ON ?auto_211072 ?auto_211071 ) ( CLEAR ?auto_211072 ) ( HOLDING ?auto_211074 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_211074 )
      ( MAKE-4PILE ?auto_211067 ?auto_211068 ?auto_211069 ?auto_211070 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211075 - BLOCK
      ?auto_211076 - BLOCK
      ?auto_211077 - BLOCK
      ?auto_211078 - BLOCK
    )
    :vars
    (
      ?auto_211081 - BLOCK
      ?auto_211080 - BLOCK
      ?auto_211079 - BLOCK
      ?auto_211082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211081 ?auto_211078 ) ( ON-TABLE ?auto_211075 ) ( ON ?auto_211076 ?auto_211075 ) ( ON ?auto_211077 ?auto_211076 ) ( ON ?auto_211078 ?auto_211077 ) ( not ( = ?auto_211075 ?auto_211076 ) ) ( not ( = ?auto_211075 ?auto_211077 ) ) ( not ( = ?auto_211075 ?auto_211078 ) ) ( not ( = ?auto_211075 ?auto_211081 ) ) ( not ( = ?auto_211076 ?auto_211077 ) ) ( not ( = ?auto_211076 ?auto_211078 ) ) ( not ( = ?auto_211076 ?auto_211081 ) ) ( not ( = ?auto_211077 ?auto_211078 ) ) ( not ( = ?auto_211077 ?auto_211081 ) ) ( not ( = ?auto_211078 ?auto_211081 ) ) ( not ( = ?auto_211075 ?auto_211080 ) ) ( not ( = ?auto_211075 ?auto_211079 ) ) ( not ( = ?auto_211076 ?auto_211080 ) ) ( not ( = ?auto_211076 ?auto_211079 ) ) ( not ( = ?auto_211077 ?auto_211080 ) ) ( not ( = ?auto_211077 ?auto_211079 ) ) ( not ( = ?auto_211078 ?auto_211080 ) ) ( not ( = ?auto_211078 ?auto_211079 ) ) ( not ( = ?auto_211081 ?auto_211080 ) ) ( not ( = ?auto_211081 ?auto_211079 ) ) ( not ( = ?auto_211080 ?auto_211079 ) ) ( ON ?auto_211080 ?auto_211081 ) ( not ( = ?auto_211082 ?auto_211079 ) ) ( not ( = ?auto_211075 ?auto_211082 ) ) ( not ( = ?auto_211076 ?auto_211082 ) ) ( not ( = ?auto_211077 ?auto_211082 ) ) ( not ( = ?auto_211078 ?auto_211082 ) ) ( not ( = ?auto_211081 ?auto_211082 ) ) ( not ( = ?auto_211080 ?auto_211082 ) ) ( ON ?auto_211079 ?auto_211080 ) ( ON ?auto_211082 ?auto_211079 ) ( CLEAR ?auto_211082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211075 ?auto_211076 ?auto_211077 ?auto_211078 ?auto_211081 ?auto_211080 ?auto_211079 )
      ( MAKE-4PILE ?auto_211075 ?auto_211076 ?auto_211077 ?auto_211078 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211083 - BLOCK
      ?auto_211084 - BLOCK
      ?auto_211085 - BLOCK
      ?auto_211086 - BLOCK
    )
    :vars
    (
      ?auto_211090 - BLOCK
      ?auto_211087 - BLOCK
      ?auto_211088 - BLOCK
      ?auto_211089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211090 ?auto_211086 ) ( ON-TABLE ?auto_211083 ) ( ON ?auto_211084 ?auto_211083 ) ( ON ?auto_211085 ?auto_211084 ) ( ON ?auto_211086 ?auto_211085 ) ( not ( = ?auto_211083 ?auto_211084 ) ) ( not ( = ?auto_211083 ?auto_211085 ) ) ( not ( = ?auto_211083 ?auto_211086 ) ) ( not ( = ?auto_211083 ?auto_211090 ) ) ( not ( = ?auto_211084 ?auto_211085 ) ) ( not ( = ?auto_211084 ?auto_211086 ) ) ( not ( = ?auto_211084 ?auto_211090 ) ) ( not ( = ?auto_211085 ?auto_211086 ) ) ( not ( = ?auto_211085 ?auto_211090 ) ) ( not ( = ?auto_211086 ?auto_211090 ) ) ( not ( = ?auto_211083 ?auto_211087 ) ) ( not ( = ?auto_211083 ?auto_211088 ) ) ( not ( = ?auto_211084 ?auto_211087 ) ) ( not ( = ?auto_211084 ?auto_211088 ) ) ( not ( = ?auto_211085 ?auto_211087 ) ) ( not ( = ?auto_211085 ?auto_211088 ) ) ( not ( = ?auto_211086 ?auto_211087 ) ) ( not ( = ?auto_211086 ?auto_211088 ) ) ( not ( = ?auto_211090 ?auto_211087 ) ) ( not ( = ?auto_211090 ?auto_211088 ) ) ( not ( = ?auto_211087 ?auto_211088 ) ) ( ON ?auto_211087 ?auto_211090 ) ( not ( = ?auto_211089 ?auto_211088 ) ) ( not ( = ?auto_211083 ?auto_211089 ) ) ( not ( = ?auto_211084 ?auto_211089 ) ) ( not ( = ?auto_211085 ?auto_211089 ) ) ( not ( = ?auto_211086 ?auto_211089 ) ) ( not ( = ?auto_211090 ?auto_211089 ) ) ( not ( = ?auto_211087 ?auto_211089 ) ) ( ON ?auto_211088 ?auto_211087 ) ( HOLDING ?auto_211089 ) ( CLEAR ?auto_211088 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_211083 ?auto_211084 ?auto_211085 ?auto_211086 ?auto_211090 ?auto_211087 ?auto_211088 ?auto_211089 )
      ( MAKE-4PILE ?auto_211083 ?auto_211084 ?auto_211085 ?auto_211086 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211091 - BLOCK
      ?auto_211092 - BLOCK
      ?auto_211093 - BLOCK
      ?auto_211094 - BLOCK
    )
    :vars
    (
      ?auto_211097 - BLOCK
      ?auto_211098 - BLOCK
      ?auto_211095 - BLOCK
      ?auto_211096 - BLOCK
      ?auto_211099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211097 ?auto_211094 ) ( ON-TABLE ?auto_211091 ) ( ON ?auto_211092 ?auto_211091 ) ( ON ?auto_211093 ?auto_211092 ) ( ON ?auto_211094 ?auto_211093 ) ( not ( = ?auto_211091 ?auto_211092 ) ) ( not ( = ?auto_211091 ?auto_211093 ) ) ( not ( = ?auto_211091 ?auto_211094 ) ) ( not ( = ?auto_211091 ?auto_211097 ) ) ( not ( = ?auto_211092 ?auto_211093 ) ) ( not ( = ?auto_211092 ?auto_211094 ) ) ( not ( = ?auto_211092 ?auto_211097 ) ) ( not ( = ?auto_211093 ?auto_211094 ) ) ( not ( = ?auto_211093 ?auto_211097 ) ) ( not ( = ?auto_211094 ?auto_211097 ) ) ( not ( = ?auto_211091 ?auto_211098 ) ) ( not ( = ?auto_211091 ?auto_211095 ) ) ( not ( = ?auto_211092 ?auto_211098 ) ) ( not ( = ?auto_211092 ?auto_211095 ) ) ( not ( = ?auto_211093 ?auto_211098 ) ) ( not ( = ?auto_211093 ?auto_211095 ) ) ( not ( = ?auto_211094 ?auto_211098 ) ) ( not ( = ?auto_211094 ?auto_211095 ) ) ( not ( = ?auto_211097 ?auto_211098 ) ) ( not ( = ?auto_211097 ?auto_211095 ) ) ( not ( = ?auto_211098 ?auto_211095 ) ) ( ON ?auto_211098 ?auto_211097 ) ( not ( = ?auto_211096 ?auto_211095 ) ) ( not ( = ?auto_211091 ?auto_211096 ) ) ( not ( = ?auto_211092 ?auto_211096 ) ) ( not ( = ?auto_211093 ?auto_211096 ) ) ( not ( = ?auto_211094 ?auto_211096 ) ) ( not ( = ?auto_211097 ?auto_211096 ) ) ( not ( = ?auto_211098 ?auto_211096 ) ) ( ON ?auto_211095 ?auto_211098 ) ( CLEAR ?auto_211095 ) ( ON ?auto_211096 ?auto_211099 ) ( CLEAR ?auto_211096 ) ( HAND-EMPTY ) ( not ( = ?auto_211091 ?auto_211099 ) ) ( not ( = ?auto_211092 ?auto_211099 ) ) ( not ( = ?auto_211093 ?auto_211099 ) ) ( not ( = ?auto_211094 ?auto_211099 ) ) ( not ( = ?auto_211097 ?auto_211099 ) ) ( not ( = ?auto_211098 ?auto_211099 ) ) ( not ( = ?auto_211095 ?auto_211099 ) ) ( not ( = ?auto_211096 ?auto_211099 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_211096 ?auto_211099 )
      ( MAKE-4PILE ?auto_211091 ?auto_211092 ?auto_211093 ?auto_211094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211100 - BLOCK
      ?auto_211101 - BLOCK
      ?auto_211102 - BLOCK
      ?auto_211103 - BLOCK
    )
    :vars
    (
      ?auto_211106 - BLOCK
      ?auto_211105 - BLOCK
      ?auto_211107 - BLOCK
      ?auto_211104 - BLOCK
      ?auto_211108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211106 ?auto_211103 ) ( ON-TABLE ?auto_211100 ) ( ON ?auto_211101 ?auto_211100 ) ( ON ?auto_211102 ?auto_211101 ) ( ON ?auto_211103 ?auto_211102 ) ( not ( = ?auto_211100 ?auto_211101 ) ) ( not ( = ?auto_211100 ?auto_211102 ) ) ( not ( = ?auto_211100 ?auto_211103 ) ) ( not ( = ?auto_211100 ?auto_211106 ) ) ( not ( = ?auto_211101 ?auto_211102 ) ) ( not ( = ?auto_211101 ?auto_211103 ) ) ( not ( = ?auto_211101 ?auto_211106 ) ) ( not ( = ?auto_211102 ?auto_211103 ) ) ( not ( = ?auto_211102 ?auto_211106 ) ) ( not ( = ?auto_211103 ?auto_211106 ) ) ( not ( = ?auto_211100 ?auto_211105 ) ) ( not ( = ?auto_211100 ?auto_211107 ) ) ( not ( = ?auto_211101 ?auto_211105 ) ) ( not ( = ?auto_211101 ?auto_211107 ) ) ( not ( = ?auto_211102 ?auto_211105 ) ) ( not ( = ?auto_211102 ?auto_211107 ) ) ( not ( = ?auto_211103 ?auto_211105 ) ) ( not ( = ?auto_211103 ?auto_211107 ) ) ( not ( = ?auto_211106 ?auto_211105 ) ) ( not ( = ?auto_211106 ?auto_211107 ) ) ( not ( = ?auto_211105 ?auto_211107 ) ) ( ON ?auto_211105 ?auto_211106 ) ( not ( = ?auto_211104 ?auto_211107 ) ) ( not ( = ?auto_211100 ?auto_211104 ) ) ( not ( = ?auto_211101 ?auto_211104 ) ) ( not ( = ?auto_211102 ?auto_211104 ) ) ( not ( = ?auto_211103 ?auto_211104 ) ) ( not ( = ?auto_211106 ?auto_211104 ) ) ( not ( = ?auto_211105 ?auto_211104 ) ) ( ON ?auto_211104 ?auto_211108 ) ( CLEAR ?auto_211104 ) ( not ( = ?auto_211100 ?auto_211108 ) ) ( not ( = ?auto_211101 ?auto_211108 ) ) ( not ( = ?auto_211102 ?auto_211108 ) ) ( not ( = ?auto_211103 ?auto_211108 ) ) ( not ( = ?auto_211106 ?auto_211108 ) ) ( not ( = ?auto_211105 ?auto_211108 ) ) ( not ( = ?auto_211107 ?auto_211108 ) ) ( not ( = ?auto_211104 ?auto_211108 ) ) ( HOLDING ?auto_211107 ) ( CLEAR ?auto_211105 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211100 ?auto_211101 ?auto_211102 ?auto_211103 ?auto_211106 ?auto_211105 ?auto_211107 )
      ( MAKE-4PILE ?auto_211100 ?auto_211101 ?auto_211102 ?auto_211103 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211109 - BLOCK
      ?auto_211110 - BLOCK
      ?auto_211111 - BLOCK
      ?auto_211112 - BLOCK
    )
    :vars
    (
      ?auto_211114 - BLOCK
      ?auto_211115 - BLOCK
      ?auto_211117 - BLOCK
      ?auto_211113 - BLOCK
      ?auto_211116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211114 ?auto_211112 ) ( ON-TABLE ?auto_211109 ) ( ON ?auto_211110 ?auto_211109 ) ( ON ?auto_211111 ?auto_211110 ) ( ON ?auto_211112 ?auto_211111 ) ( not ( = ?auto_211109 ?auto_211110 ) ) ( not ( = ?auto_211109 ?auto_211111 ) ) ( not ( = ?auto_211109 ?auto_211112 ) ) ( not ( = ?auto_211109 ?auto_211114 ) ) ( not ( = ?auto_211110 ?auto_211111 ) ) ( not ( = ?auto_211110 ?auto_211112 ) ) ( not ( = ?auto_211110 ?auto_211114 ) ) ( not ( = ?auto_211111 ?auto_211112 ) ) ( not ( = ?auto_211111 ?auto_211114 ) ) ( not ( = ?auto_211112 ?auto_211114 ) ) ( not ( = ?auto_211109 ?auto_211115 ) ) ( not ( = ?auto_211109 ?auto_211117 ) ) ( not ( = ?auto_211110 ?auto_211115 ) ) ( not ( = ?auto_211110 ?auto_211117 ) ) ( not ( = ?auto_211111 ?auto_211115 ) ) ( not ( = ?auto_211111 ?auto_211117 ) ) ( not ( = ?auto_211112 ?auto_211115 ) ) ( not ( = ?auto_211112 ?auto_211117 ) ) ( not ( = ?auto_211114 ?auto_211115 ) ) ( not ( = ?auto_211114 ?auto_211117 ) ) ( not ( = ?auto_211115 ?auto_211117 ) ) ( ON ?auto_211115 ?auto_211114 ) ( not ( = ?auto_211113 ?auto_211117 ) ) ( not ( = ?auto_211109 ?auto_211113 ) ) ( not ( = ?auto_211110 ?auto_211113 ) ) ( not ( = ?auto_211111 ?auto_211113 ) ) ( not ( = ?auto_211112 ?auto_211113 ) ) ( not ( = ?auto_211114 ?auto_211113 ) ) ( not ( = ?auto_211115 ?auto_211113 ) ) ( ON ?auto_211113 ?auto_211116 ) ( not ( = ?auto_211109 ?auto_211116 ) ) ( not ( = ?auto_211110 ?auto_211116 ) ) ( not ( = ?auto_211111 ?auto_211116 ) ) ( not ( = ?auto_211112 ?auto_211116 ) ) ( not ( = ?auto_211114 ?auto_211116 ) ) ( not ( = ?auto_211115 ?auto_211116 ) ) ( not ( = ?auto_211117 ?auto_211116 ) ) ( not ( = ?auto_211113 ?auto_211116 ) ) ( CLEAR ?auto_211115 ) ( ON ?auto_211117 ?auto_211113 ) ( CLEAR ?auto_211117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211116 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211116 ?auto_211113 )
      ( MAKE-4PILE ?auto_211109 ?auto_211110 ?auto_211111 ?auto_211112 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211118 - BLOCK
      ?auto_211119 - BLOCK
      ?auto_211120 - BLOCK
      ?auto_211121 - BLOCK
    )
    :vars
    (
      ?auto_211122 - BLOCK
      ?auto_211123 - BLOCK
      ?auto_211126 - BLOCK
      ?auto_211125 - BLOCK
      ?auto_211124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211122 ?auto_211121 ) ( ON-TABLE ?auto_211118 ) ( ON ?auto_211119 ?auto_211118 ) ( ON ?auto_211120 ?auto_211119 ) ( ON ?auto_211121 ?auto_211120 ) ( not ( = ?auto_211118 ?auto_211119 ) ) ( not ( = ?auto_211118 ?auto_211120 ) ) ( not ( = ?auto_211118 ?auto_211121 ) ) ( not ( = ?auto_211118 ?auto_211122 ) ) ( not ( = ?auto_211119 ?auto_211120 ) ) ( not ( = ?auto_211119 ?auto_211121 ) ) ( not ( = ?auto_211119 ?auto_211122 ) ) ( not ( = ?auto_211120 ?auto_211121 ) ) ( not ( = ?auto_211120 ?auto_211122 ) ) ( not ( = ?auto_211121 ?auto_211122 ) ) ( not ( = ?auto_211118 ?auto_211123 ) ) ( not ( = ?auto_211118 ?auto_211126 ) ) ( not ( = ?auto_211119 ?auto_211123 ) ) ( not ( = ?auto_211119 ?auto_211126 ) ) ( not ( = ?auto_211120 ?auto_211123 ) ) ( not ( = ?auto_211120 ?auto_211126 ) ) ( not ( = ?auto_211121 ?auto_211123 ) ) ( not ( = ?auto_211121 ?auto_211126 ) ) ( not ( = ?auto_211122 ?auto_211123 ) ) ( not ( = ?auto_211122 ?auto_211126 ) ) ( not ( = ?auto_211123 ?auto_211126 ) ) ( not ( = ?auto_211125 ?auto_211126 ) ) ( not ( = ?auto_211118 ?auto_211125 ) ) ( not ( = ?auto_211119 ?auto_211125 ) ) ( not ( = ?auto_211120 ?auto_211125 ) ) ( not ( = ?auto_211121 ?auto_211125 ) ) ( not ( = ?auto_211122 ?auto_211125 ) ) ( not ( = ?auto_211123 ?auto_211125 ) ) ( ON ?auto_211125 ?auto_211124 ) ( not ( = ?auto_211118 ?auto_211124 ) ) ( not ( = ?auto_211119 ?auto_211124 ) ) ( not ( = ?auto_211120 ?auto_211124 ) ) ( not ( = ?auto_211121 ?auto_211124 ) ) ( not ( = ?auto_211122 ?auto_211124 ) ) ( not ( = ?auto_211123 ?auto_211124 ) ) ( not ( = ?auto_211126 ?auto_211124 ) ) ( not ( = ?auto_211125 ?auto_211124 ) ) ( ON ?auto_211126 ?auto_211125 ) ( CLEAR ?auto_211126 ) ( ON-TABLE ?auto_211124 ) ( HOLDING ?auto_211123 ) ( CLEAR ?auto_211122 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211118 ?auto_211119 ?auto_211120 ?auto_211121 ?auto_211122 ?auto_211123 )
      ( MAKE-4PILE ?auto_211118 ?auto_211119 ?auto_211120 ?auto_211121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211127 - BLOCK
      ?auto_211128 - BLOCK
      ?auto_211129 - BLOCK
      ?auto_211130 - BLOCK
    )
    :vars
    (
      ?auto_211134 - BLOCK
      ?auto_211132 - BLOCK
      ?auto_211135 - BLOCK
      ?auto_211133 - BLOCK
      ?auto_211131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211134 ?auto_211130 ) ( ON-TABLE ?auto_211127 ) ( ON ?auto_211128 ?auto_211127 ) ( ON ?auto_211129 ?auto_211128 ) ( ON ?auto_211130 ?auto_211129 ) ( not ( = ?auto_211127 ?auto_211128 ) ) ( not ( = ?auto_211127 ?auto_211129 ) ) ( not ( = ?auto_211127 ?auto_211130 ) ) ( not ( = ?auto_211127 ?auto_211134 ) ) ( not ( = ?auto_211128 ?auto_211129 ) ) ( not ( = ?auto_211128 ?auto_211130 ) ) ( not ( = ?auto_211128 ?auto_211134 ) ) ( not ( = ?auto_211129 ?auto_211130 ) ) ( not ( = ?auto_211129 ?auto_211134 ) ) ( not ( = ?auto_211130 ?auto_211134 ) ) ( not ( = ?auto_211127 ?auto_211132 ) ) ( not ( = ?auto_211127 ?auto_211135 ) ) ( not ( = ?auto_211128 ?auto_211132 ) ) ( not ( = ?auto_211128 ?auto_211135 ) ) ( not ( = ?auto_211129 ?auto_211132 ) ) ( not ( = ?auto_211129 ?auto_211135 ) ) ( not ( = ?auto_211130 ?auto_211132 ) ) ( not ( = ?auto_211130 ?auto_211135 ) ) ( not ( = ?auto_211134 ?auto_211132 ) ) ( not ( = ?auto_211134 ?auto_211135 ) ) ( not ( = ?auto_211132 ?auto_211135 ) ) ( not ( = ?auto_211133 ?auto_211135 ) ) ( not ( = ?auto_211127 ?auto_211133 ) ) ( not ( = ?auto_211128 ?auto_211133 ) ) ( not ( = ?auto_211129 ?auto_211133 ) ) ( not ( = ?auto_211130 ?auto_211133 ) ) ( not ( = ?auto_211134 ?auto_211133 ) ) ( not ( = ?auto_211132 ?auto_211133 ) ) ( ON ?auto_211133 ?auto_211131 ) ( not ( = ?auto_211127 ?auto_211131 ) ) ( not ( = ?auto_211128 ?auto_211131 ) ) ( not ( = ?auto_211129 ?auto_211131 ) ) ( not ( = ?auto_211130 ?auto_211131 ) ) ( not ( = ?auto_211134 ?auto_211131 ) ) ( not ( = ?auto_211132 ?auto_211131 ) ) ( not ( = ?auto_211135 ?auto_211131 ) ) ( not ( = ?auto_211133 ?auto_211131 ) ) ( ON ?auto_211135 ?auto_211133 ) ( ON-TABLE ?auto_211131 ) ( CLEAR ?auto_211134 ) ( ON ?auto_211132 ?auto_211135 ) ( CLEAR ?auto_211132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211131 ?auto_211133 ?auto_211135 )
      ( MAKE-4PILE ?auto_211127 ?auto_211128 ?auto_211129 ?auto_211130 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211154 - BLOCK
      ?auto_211155 - BLOCK
      ?auto_211156 - BLOCK
      ?auto_211157 - BLOCK
    )
    :vars
    (
      ?auto_211161 - BLOCK
      ?auto_211158 - BLOCK
      ?auto_211160 - BLOCK
      ?auto_211162 - BLOCK
      ?auto_211159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211154 ) ( ON ?auto_211155 ?auto_211154 ) ( ON ?auto_211156 ?auto_211155 ) ( not ( = ?auto_211154 ?auto_211155 ) ) ( not ( = ?auto_211154 ?auto_211156 ) ) ( not ( = ?auto_211154 ?auto_211157 ) ) ( not ( = ?auto_211154 ?auto_211161 ) ) ( not ( = ?auto_211155 ?auto_211156 ) ) ( not ( = ?auto_211155 ?auto_211157 ) ) ( not ( = ?auto_211155 ?auto_211161 ) ) ( not ( = ?auto_211156 ?auto_211157 ) ) ( not ( = ?auto_211156 ?auto_211161 ) ) ( not ( = ?auto_211157 ?auto_211161 ) ) ( not ( = ?auto_211154 ?auto_211158 ) ) ( not ( = ?auto_211154 ?auto_211160 ) ) ( not ( = ?auto_211155 ?auto_211158 ) ) ( not ( = ?auto_211155 ?auto_211160 ) ) ( not ( = ?auto_211156 ?auto_211158 ) ) ( not ( = ?auto_211156 ?auto_211160 ) ) ( not ( = ?auto_211157 ?auto_211158 ) ) ( not ( = ?auto_211157 ?auto_211160 ) ) ( not ( = ?auto_211161 ?auto_211158 ) ) ( not ( = ?auto_211161 ?auto_211160 ) ) ( not ( = ?auto_211158 ?auto_211160 ) ) ( not ( = ?auto_211162 ?auto_211160 ) ) ( not ( = ?auto_211154 ?auto_211162 ) ) ( not ( = ?auto_211155 ?auto_211162 ) ) ( not ( = ?auto_211156 ?auto_211162 ) ) ( not ( = ?auto_211157 ?auto_211162 ) ) ( not ( = ?auto_211161 ?auto_211162 ) ) ( not ( = ?auto_211158 ?auto_211162 ) ) ( ON ?auto_211162 ?auto_211159 ) ( not ( = ?auto_211154 ?auto_211159 ) ) ( not ( = ?auto_211155 ?auto_211159 ) ) ( not ( = ?auto_211156 ?auto_211159 ) ) ( not ( = ?auto_211157 ?auto_211159 ) ) ( not ( = ?auto_211161 ?auto_211159 ) ) ( not ( = ?auto_211158 ?auto_211159 ) ) ( not ( = ?auto_211160 ?auto_211159 ) ) ( not ( = ?auto_211162 ?auto_211159 ) ) ( ON ?auto_211160 ?auto_211162 ) ( ON-TABLE ?auto_211159 ) ( ON ?auto_211158 ?auto_211160 ) ( ON ?auto_211161 ?auto_211158 ) ( CLEAR ?auto_211161 ) ( HOLDING ?auto_211157 ) ( CLEAR ?auto_211156 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211154 ?auto_211155 ?auto_211156 ?auto_211157 ?auto_211161 )
      ( MAKE-4PILE ?auto_211154 ?auto_211155 ?auto_211156 ?auto_211157 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211163 - BLOCK
      ?auto_211164 - BLOCK
      ?auto_211165 - BLOCK
      ?auto_211166 - BLOCK
    )
    :vars
    (
      ?auto_211170 - BLOCK
      ?auto_211168 - BLOCK
      ?auto_211167 - BLOCK
      ?auto_211171 - BLOCK
      ?auto_211169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211163 ) ( ON ?auto_211164 ?auto_211163 ) ( ON ?auto_211165 ?auto_211164 ) ( not ( = ?auto_211163 ?auto_211164 ) ) ( not ( = ?auto_211163 ?auto_211165 ) ) ( not ( = ?auto_211163 ?auto_211166 ) ) ( not ( = ?auto_211163 ?auto_211170 ) ) ( not ( = ?auto_211164 ?auto_211165 ) ) ( not ( = ?auto_211164 ?auto_211166 ) ) ( not ( = ?auto_211164 ?auto_211170 ) ) ( not ( = ?auto_211165 ?auto_211166 ) ) ( not ( = ?auto_211165 ?auto_211170 ) ) ( not ( = ?auto_211166 ?auto_211170 ) ) ( not ( = ?auto_211163 ?auto_211168 ) ) ( not ( = ?auto_211163 ?auto_211167 ) ) ( not ( = ?auto_211164 ?auto_211168 ) ) ( not ( = ?auto_211164 ?auto_211167 ) ) ( not ( = ?auto_211165 ?auto_211168 ) ) ( not ( = ?auto_211165 ?auto_211167 ) ) ( not ( = ?auto_211166 ?auto_211168 ) ) ( not ( = ?auto_211166 ?auto_211167 ) ) ( not ( = ?auto_211170 ?auto_211168 ) ) ( not ( = ?auto_211170 ?auto_211167 ) ) ( not ( = ?auto_211168 ?auto_211167 ) ) ( not ( = ?auto_211171 ?auto_211167 ) ) ( not ( = ?auto_211163 ?auto_211171 ) ) ( not ( = ?auto_211164 ?auto_211171 ) ) ( not ( = ?auto_211165 ?auto_211171 ) ) ( not ( = ?auto_211166 ?auto_211171 ) ) ( not ( = ?auto_211170 ?auto_211171 ) ) ( not ( = ?auto_211168 ?auto_211171 ) ) ( ON ?auto_211171 ?auto_211169 ) ( not ( = ?auto_211163 ?auto_211169 ) ) ( not ( = ?auto_211164 ?auto_211169 ) ) ( not ( = ?auto_211165 ?auto_211169 ) ) ( not ( = ?auto_211166 ?auto_211169 ) ) ( not ( = ?auto_211170 ?auto_211169 ) ) ( not ( = ?auto_211168 ?auto_211169 ) ) ( not ( = ?auto_211167 ?auto_211169 ) ) ( not ( = ?auto_211171 ?auto_211169 ) ) ( ON ?auto_211167 ?auto_211171 ) ( ON-TABLE ?auto_211169 ) ( ON ?auto_211168 ?auto_211167 ) ( ON ?auto_211170 ?auto_211168 ) ( CLEAR ?auto_211165 ) ( ON ?auto_211166 ?auto_211170 ) ( CLEAR ?auto_211166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211169 ?auto_211171 ?auto_211167 ?auto_211168 ?auto_211170 )
      ( MAKE-4PILE ?auto_211163 ?auto_211164 ?auto_211165 ?auto_211166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211172 - BLOCK
      ?auto_211173 - BLOCK
      ?auto_211174 - BLOCK
      ?auto_211175 - BLOCK
    )
    :vars
    (
      ?auto_211180 - BLOCK
      ?auto_211178 - BLOCK
      ?auto_211176 - BLOCK
      ?auto_211177 - BLOCK
      ?auto_211179 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211172 ) ( ON ?auto_211173 ?auto_211172 ) ( not ( = ?auto_211172 ?auto_211173 ) ) ( not ( = ?auto_211172 ?auto_211174 ) ) ( not ( = ?auto_211172 ?auto_211175 ) ) ( not ( = ?auto_211172 ?auto_211180 ) ) ( not ( = ?auto_211173 ?auto_211174 ) ) ( not ( = ?auto_211173 ?auto_211175 ) ) ( not ( = ?auto_211173 ?auto_211180 ) ) ( not ( = ?auto_211174 ?auto_211175 ) ) ( not ( = ?auto_211174 ?auto_211180 ) ) ( not ( = ?auto_211175 ?auto_211180 ) ) ( not ( = ?auto_211172 ?auto_211178 ) ) ( not ( = ?auto_211172 ?auto_211176 ) ) ( not ( = ?auto_211173 ?auto_211178 ) ) ( not ( = ?auto_211173 ?auto_211176 ) ) ( not ( = ?auto_211174 ?auto_211178 ) ) ( not ( = ?auto_211174 ?auto_211176 ) ) ( not ( = ?auto_211175 ?auto_211178 ) ) ( not ( = ?auto_211175 ?auto_211176 ) ) ( not ( = ?auto_211180 ?auto_211178 ) ) ( not ( = ?auto_211180 ?auto_211176 ) ) ( not ( = ?auto_211178 ?auto_211176 ) ) ( not ( = ?auto_211177 ?auto_211176 ) ) ( not ( = ?auto_211172 ?auto_211177 ) ) ( not ( = ?auto_211173 ?auto_211177 ) ) ( not ( = ?auto_211174 ?auto_211177 ) ) ( not ( = ?auto_211175 ?auto_211177 ) ) ( not ( = ?auto_211180 ?auto_211177 ) ) ( not ( = ?auto_211178 ?auto_211177 ) ) ( ON ?auto_211177 ?auto_211179 ) ( not ( = ?auto_211172 ?auto_211179 ) ) ( not ( = ?auto_211173 ?auto_211179 ) ) ( not ( = ?auto_211174 ?auto_211179 ) ) ( not ( = ?auto_211175 ?auto_211179 ) ) ( not ( = ?auto_211180 ?auto_211179 ) ) ( not ( = ?auto_211178 ?auto_211179 ) ) ( not ( = ?auto_211176 ?auto_211179 ) ) ( not ( = ?auto_211177 ?auto_211179 ) ) ( ON ?auto_211176 ?auto_211177 ) ( ON-TABLE ?auto_211179 ) ( ON ?auto_211178 ?auto_211176 ) ( ON ?auto_211180 ?auto_211178 ) ( ON ?auto_211175 ?auto_211180 ) ( CLEAR ?auto_211175 ) ( HOLDING ?auto_211174 ) ( CLEAR ?auto_211173 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211172 ?auto_211173 ?auto_211174 )
      ( MAKE-4PILE ?auto_211172 ?auto_211173 ?auto_211174 ?auto_211175 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211181 - BLOCK
      ?auto_211182 - BLOCK
      ?auto_211183 - BLOCK
      ?auto_211184 - BLOCK
    )
    :vars
    (
      ?auto_211189 - BLOCK
      ?auto_211185 - BLOCK
      ?auto_211188 - BLOCK
      ?auto_211186 - BLOCK
      ?auto_211187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211181 ) ( ON ?auto_211182 ?auto_211181 ) ( not ( = ?auto_211181 ?auto_211182 ) ) ( not ( = ?auto_211181 ?auto_211183 ) ) ( not ( = ?auto_211181 ?auto_211184 ) ) ( not ( = ?auto_211181 ?auto_211189 ) ) ( not ( = ?auto_211182 ?auto_211183 ) ) ( not ( = ?auto_211182 ?auto_211184 ) ) ( not ( = ?auto_211182 ?auto_211189 ) ) ( not ( = ?auto_211183 ?auto_211184 ) ) ( not ( = ?auto_211183 ?auto_211189 ) ) ( not ( = ?auto_211184 ?auto_211189 ) ) ( not ( = ?auto_211181 ?auto_211185 ) ) ( not ( = ?auto_211181 ?auto_211188 ) ) ( not ( = ?auto_211182 ?auto_211185 ) ) ( not ( = ?auto_211182 ?auto_211188 ) ) ( not ( = ?auto_211183 ?auto_211185 ) ) ( not ( = ?auto_211183 ?auto_211188 ) ) ( not ( = ?auto_211184 ?auto_211185 ) ) ( not ( = ?auto_211184 ?auto_211188 ) ) ( not ( = ?auto_211189 ?auto_211185 ) ) ( not ( = ?auto_211189 ?auto_211188 ) ) ( not ( = ?auto_211185 ?auto_211188 ) ) ( not ( = ?auto_211186 ?auto_211188 ) ) ( not ( = ?auto_211181 ?auto_211186 ) ) ( not ( = ?auto_211182 ?auto_211186 ) ) ( not ( = ?auto_211183 ?auto_211186 ) ) ( not ( = ?auto_211184 ?auto_211186 ) ) ( not ( = ?auto_211189 ?auto_211186 ) ) ( not ( = ?auto_211185 ?auto_211186 ) ) ( ON ?auto_211186 ?auto_211187 ) ( not ( = ?auto_211181 ?auto_211187 ) ) ( not ( = ?auto_211182 ?auto_211187 ) ) ( not ( = ?auto_211183 ?auto_211187 ) ) ( not ( = ?auto_211184 ?auto_211187 ) ) ( not ( = ?auto_211189 ?auto_211187 ) ) ( not ( = ?auto_211185 ?auto_211187 ) ) ( not ( = ?auto_211188 ?auto_211187 ) ) ( not ( = ?auto_211186 ?auto_211187 ) ) ( ON ?auto_211188 ?auto_211186 ) ( ON-TABLE ?auto_211187 ) ( ON ?auto_211185 ?auto_211188 ) ( ON ?auto_211189 ?auto_211185 ) ( ON ?auto_211184 ?auto_211189 ) ( CLEAR ?auto_211182 ) ( ON ?auto_211183 ?auto_211184 ) ( CLEAR ?auto_211183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211187 ?auto_211186 ?auto_211188 ?auto_211185 ?auto_211189 ?auto_211184 )
      ( MAKE-4PILE ?auto_211181 ?auto_211182 ?auto_211183 ?auto_211184 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211190 - BLOCK
      ?auto_211191 - BLOCK
      ?auto_211192 - BLOCK
      ?auto_211193 - BLOCK
    )
    :vars
    (
      ?auto_211197 - BLOCK
      ?auto_211194 - BLOCK
      ?auto_211195 - BLOCK
      ?auto_211196 - BLOCK
      ?auto_211198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211190 ) ( not ( = ?auto_211190 ?auto_211191 ) ) ( not ( = ?auto_211190 ?auto_211192 ) ) ( not ( = ?auto_211190 ?auto_211193 ) ) ( not ( = ?auto_211190 ?auto_211197 ) ) ( not ( = ?auto_211191 ?auto_211192 ) ) ( not ( = ?auto_211191 ?auto_211193 ) ) ( not ( = ?auto_211191 ?auto_211197 ) ) ( not ( = ?auto_211192 ?auto_211193 ) ) ( not ( = ?auto_211192 ?auto_211197 ) ) ( not ( = ?auto_211193 ?auto_211197 ) ) ( not ( = ?auto_211190 ?auto_211194 ) ) ( not ( = ?auto_211190 ?auto_211195 ) ) ( not ( = ?auto_211191 ?auto_211194 ) ) ( not ( = ?auto_211191 ?auto_211195 ) ) ( not ( = ?auto_211192 ?auto_211194 ) ) ( not ( = ?auto_211192 ?auto_211195 ) ) ( not ( = ?auto_211193 ?auto_211194 ) ) ( not ( = ?auto_211193 ?auto_211195 ) ) ( not ( = ?auto_211197 ?auto_211194 ) ) ( not ( = ?auto_211197 ?auto_211195 ) ) ( not ( = ?auto_211194 ?auto_211195 ) ) ( not ( = ?auto_211196 ?auto_211195 ) ) ( not ( = ?auto_211190 ?auto_211196 ) ) ( not ( = ?auto_211191 ?auto_211196 ) ) ( not ( = ?auto_211192 ?auto_211196 ) ) ( not ( = ?auto_211193 ?auto_211196 ) ) ( not ( = ?auto_211197 ?auto_211196 ) ) ( not ( = ?auto_211194 ?auto_211196 ) ) ( ON ?auto_211196 ?auto_211198 ) ( not ( = ?auto_211190 ?auto_211198 ) ) ( not ( = ?auto_211191 ?auto_211198 ) ) ( not ( = ?auto_211192 ?auto_211198 ) ) ( not ( = ?auto_211193 ?auto_211198 ) ) ( not ( = ?auto_211197 ?auto_211198 ) ) ( not ( = ?auto_211194 ?auto_211198 ) ) ( not ( = ?auto_211195 ?auto_211198 ) ) ( not ( = ?auto_211196 ?auto_211198 ) ) ( ON ?auto_211195 ?auto_211196 ) ( ON-TABLE ?auto_211198 ) ( ON ?auto_211194 ?auto_211195 ) ( ON ?auto_211197 ?auto_211194 ) ( ON ?auto_211193 ?auto_211197 ) ( ON ?auto_211192 ?auto_211193 ) ( CLEAR ?auto_211192 ) ( HOLDING ?auto_211191 ) ( CLEAR ?auto_211190 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211190 ?auto_211191 )
      ( MAKE-4PILE ?auto_211190 ?auto_211191 ?auto_211192 ?auto_211193 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211199 - BLOCK
      ?auto_211200 - BLOCK
      ?auto_211201 - BLOCK
      ?auto_211202 - BLOCK
    )
    :vars
    (
      ?auto_211205 - BLOCK
      ?auto_211204 - BLOCK
      ?auto_211203 - BLOCK
      ?auto_211207 - BLOCK
      ?auto_211206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211199 ) ( not ( = ?auto_211199 ?auto_211200 ) ) ( not ( = ?auto_211199 ?auto_211201 ) ) ( not ( = ?auto_211199 ?auto_211202 ) ) ( not ( = ?auto_211199 ?auto_211205 ) ) ( not ( = ?auto_211200 ?auto_211201 ) ) ( not ( = ?auto_211200 ?auto_211202 ) ) ( not ( = ?auto_211200 ?auto_211205 ) ) ( not ( = ?auto_211201 ?auto_211202 ) ) ( not ( = ?auto_211201 ?auto_211205 ) ) ( not ( = ?auto_211202 ?auto_211205 ) ) ( not ( = ?auto_211199 ?auto_211204 ) ) ( not ( = ?auto_211199 ?auto_211203 ) ) ( not ( = ?auto_211200 ?auto_211204 ) ) ( not ( = ?auto_211200 ?auto_211203 ) ) ( not ( = ?auto_211201 ?auto_211204 ) ) ( not ( = ?auto_211201 ?auto_211203 ) ) ( not ( = ?auto_211202 ?auto_211204 ) ) ( not ( = ?auto_211202 ?auto_211203 ) ) ( not ( = ?auto_211205 ?auto_211204 ) ) ( not ( = ?auto_211205 ?auto_211203 ) ) ( not ( = ?auto_211204 ?auto_211203 ) ) ( not ( = ?auto_211207 ?auto_211203 ) ) ( not ( = ?auto_211199 ?auto_211207 ) ) ( not ( = ?auto_211200 ?auto_211207 ) ) ( not ( = ?auto_211201 ?auto_211207 ) ) ( not ( = ?auto_211202 ?auto_211207 ) ) ( not ( = ?auto_211205 ?auto_211207 ) ) ( not ( = ?auto_211204 ?auto_211207 ) ) ( ON ?auto_211207 ?auto_211206 ) ( not ( = ?auto_211199 ?auto_211206 ) ) ( not ( = ?auto_211200 ?auto_211206 ) ) ( not ( = ?auto_211201 ?auto_211206 ) ) ( not ( = ?auto_211202 ?auto_211206 ) ) ( not ( = ?auto_211205 ?auto_211206 ) ) ( not ( = ?auto_211204 ?auto_211206 ) ) ( not ( = ?auto_211203 ?auto_211206 ) ) ( not ( = ?auto_211207 ?auto_211206 ) ) ( ON ?auto_211203 ?auto_211207 ) ( ON-TABLE ?auto_211206 ) ( ON ?auto_211204 ?auto_211203 ) ( ON ?auto_211205 ?auto_211204 ) ( ON ?auto_211202 ?auto_211205 ) ( ON ?auto_211201 ?auto_211202 ) ( CLEAR ?auto_211199 ) ( ON ?auto_211200 ?auto_211201 ) ( CLEAR ?auto_211200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211206 ?auto_211207 ?auto_211203 ?auto_211204 ?auto_211205 ?auto_211202 ?auto_211201 )
      ( MAKE-4PILE ?auto_211199 ?auto_211200 ?auto_211201 ?auto_211202 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211208 - BLOCK
      ?auto_211209 - BLOCK
      ?auto_211210 - BLOCK
      ?auto_211211 - BLOCK
    )
    :vars
    (
      ?auto_211215 - BLOCK
      ?auto_211216 - BLOCK
      ?auto_211213 - BLOCK
      ?auto_211212 - BLOCK
      ?auto_211214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211208 ?auto_211209 ) ) ( not ( = ?auto_211208 ?auto_211210 ) ) ( not ( = ?auto_211208 ?auto_211211 ) ) ( not ( = ?auto_211208 ?auto_211215 ) ) ( not ( = ?auto_211209 ?auto_211210 ) ) ( not ( = ?auto_211209 ?auto_211211 ) ) ( not ( = ?auto_211209 ?auto_211215 ) ) ( not ( = ?auto_211210 ?auto_211211 ) ) ( not ( = ?auto_211210 ?auto_211215 ) ) ( not ( = ?auto_211211 ?auto_211215 ) ) ( not ( = ?auto_211208 ?auto_211216 ) ) ( not ( = ?auto_211208 ?auto_211213 ) ) ( not ( = ?auto_211209 ?auto_211216 ) ) ( not ( = ?auto_211209 ?auto_211213 ) ) ( not ( = ?auto_211210 ?auto_211216 ) ) ( not ( = ?auto_211210 ?auto_211213 ) ) ( not ( = ?auto_211211 ?auto_211216 ) ) ( not ( = ?auto_211211 ?auto_211213 ) ) ( not ( = ?auto_211215 ?auto_211216 ) ) ( not ( = ?auto_211215 ?auto_211213 ) ) ( not ( = ?auto_211216 ?auto_211213 ) ) ( not ( = ?auto_211212 ?auto_211213 ) ) ( not ( = ?auto_211208 ?auto_211212 ) ) ( not ( = ?auto_211209 ?auto_211212 ) ) ( not ( = ?auto_211210 ?auto_211212 ) ) ( not ( = ?auto_211211 ?auto_211212 ) ) ( not ( = ?auto_211215 ?auto_211212 ) ) ( not ( = ?auto_211216 ?auto_211212 ) ) ( ON ?auto_211212 ?auto_211214 ) ( not ( = ?auto_211208 ?auto_211214 ) ) ( not ( = ?auto_211209 ?auto_211214 ) ) ( not ( = ?auto_211210 ?auto_211214 ) ) ( not ( = ?auto_211211 ?auto_211214 ) ) ( not ( = ?auto_211215 ?auto_211214 ) ) ( not ( = ?auto_211216 ?auto_211214 ) ) ( not ( = ?auto_211213 ?auto_211214 ) ) ( not ( = ?auto_211212 ?auto_211214 ) ) ( ON ?auto_211213 ?auto_211212 ) ( ON-TABLE ?auto_211214 ) ( ON ?auto_211216 ?auto_211213 ) ( ON ?auto_211215 ?auto_211216 ) ( ON ?auto_211211 ?auto_211215 ) ( ON ?auto_211210 ?auto_211211 ) ( ON ?auto_211209 ?auto_211210 ) ( CLEAR ?auto_211209 ) ( HOLDING ?auto_211208 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_211208 )
      ( MAKE-4PILE ?auto_211208 ?auto_211209 ?auto_211210 ?auto_211211 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211217 - BLOCK
      ?auto_211218 - BLOCK
      ?auto_211219 - BLOCK
      ?auto_211220 - BLOCK
    )
    :vars
    (
      ?auto_211222 - BLOCK
      ?auto_211223 - BLOCK
      ?auto_211224 - BLOCK
      ?auto_211225 - BLOCK
      ?auto_211221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211217 ?auto_211218 ) ) ( not ( = ?auto_211217 ?auto_211219 ) ) ( not ( = ?auto_211217 ?auto_211220 ) ) ( not ( = ?auto_211217 ?auto_211222 ) ) ( not ( = ?auto_211218 ?auto_211219 ) ) ( not ( = ?auto_211218 ?auto_211220 ) ) ( not ( = ?auto_211218 ?auto_211222 ) ) ( not ( = ?auto_211219 ?auto_211220 ) ) ( not ( = ?auto_211219 ?auto_211222 ) ) ( not ( = ?auto_211220 ?auto_211222 ) ) ( not ( = ?auto_211217 ?auto_211223 ) ) ( not ( = ?auto_211217 ?auto_211224 ) ) ( not ( = ?auto_211218 ?auto_211223 ) ) ( not ( = ?auto_211218 ?auto_211224 ) ) ( not ( = ?auto_211219 ?auto_211223 ) ) ( not ( = ?auto_211219 ?auto_211224 ) ) ( not ( = ?auto_211220 ?auto_211223 ) ) ( not ( = ?auto_211220 ?auto_211224 ) ) ( not ( = ?auto_211222 ?auto_211223 ) ) ( not ( = ?auto_211222 ?auto_211224 ) ) ( not ( = ?auto_211223 ?auto_211224 ) ) ( not ( = ?auto_211225 ?auto_211224 ) ) ( not ( = ?auto_211217 ?auto_211225 ) ) ( not ( = ?auto_211218 ?auto_211225 ) ) ( not ( = ?auto_211219 ?auto_211225 ) ) ( not ( = ?auto_211220 ?auto_211225 ) ) ( not ( = ?auto_211222 ?auto_211225 ) ) ( not ( = ?auto_211223 ?auto_211225 ) ) ( ON ?auto_211225 ?auto_211221 ) ( not ( = ?auto_211217 ?auto_211221 ) ) ( not ( = ?auto_211218 ?auto_211221 ) ) ( not ( = ?auto_211219 ?auto_211221 ) ) ( not ( = ?auto_211220 ?auto_211221 ) ) ( not ( = ?auto_211222 ?auto_211221 ) ) ( not ( = ?auto_211223 ?auto_211221 ) ) ( not ( = ?auto_211224 ?auto_211221 ) ) ( not ( = ?auto_211225 ?auto_211221 ) ) ( ON ?auto_211224 ?auto_211225 ) ( ON-TABLE ?auto_211221 ) ( ON ?auto_211223 ?auto_211224 ) ( ON ?auto_211222 ?auto_211223 ) ( ON ?auto_211220 ?auto_211222 ) ( ON ?auto_211219 ?auto_211220 ) ( ON ?auto_211218 ?auto_211219 ) ( ON ?auto_211217 ?auto_211218 ) ( CLEAR ?auto_211217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_211221 ?auto_211225 ?auto_211224 ?auto_211223 ?auto_211222 ?auto_211220 ?auto_211219 ?auto_211218 )
      ( MAKE-4PILE ?auto_211217 ?auto_211218 ?auto_211219 ?auto_211220 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211230 - BLOCK
      ?auto_211231 - BLOCK
      ?auto_211232 - BLOCK
      ?auto_211233 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_211233 ) ( CLEAR ?auto_211232 ) ( ON-TABLE ?auto_211230 ) ( ON ?auto_211231 ?auto_211230 ) ( ON ?auto_211232 ?auto_211231 ) ( not ( = ?auto_211230 ?auto_211231 ) ) ( not ( = ?auto_211230 ?auto_211232 ) ) ( not ( = ?auto_211230 ?auto_211233 ) ) ( not ( = ?auto_211231 ?auto_211232 ) ) ( not ( = ?auto_211231 ?auto_211233 ) ) ( not ( = ?auto_211232 ?auto_211233 ) ) )
    :subtasks
    ( ( !STACK ?auto_211233 ?auto_211232 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211234 - BLOCK
      ?auto_211235 - BLOCK
      ?auto_211236 - BLOCK
      ?auto_211237 - BLOCK
    )
    :vars
    (
      ?auto_211238 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_211236 ) ( ON-TABLE ?auto_211234 ) ( ON ?auto_211235 ?auto_211234 ) ( ON ?auto_211236 ?auto_211235 ) ( not ( = ?auto_211234 ?auto_211235 ) ) ( not ( = ?auto_211234 ?auto_211236 ) ) ( not ( = ?auto_211234 ?auto_211237 ) ) ( not ( = ?auto_211235 ?auto_211236 ) ) ( not ( = ?auto_211235 ?auto_211237 ) ) ( not ( = ?auto_211236 ?auto_211237 ) ) ( ON ?auto_211237 ?auto_211238 ) ( CLEAR ?auto_211237 ) ( HAND-EMPTY ) ( not ( = ?auto_211234 ?auto_211238 ) ) ( not ( = ?auto_211235 ?auto_211238 ) ) ( not ( = ?auto_211236 ?auto_211238 ) ) ( not ( = ?auto_211237 ?auto_211238 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_211237 ?auto_211238 )
      ( MAKE-4PILE ?auto_211234 ?auto_211235 ?auto_211236 ?auto_211237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211239 - BLOCK
      ?auto_211240 - BLOCK
      ?auto_211241 - BLOCK
      ?auto_211242 - BLOCK
    )
    :vars
    (
      ?auto_211243 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211239 ) ( ON ?auto_211240 ?auto_211239 ) ( not ( = ?auto_211239 ?auto_211240 ) ) ( not ( = ?auto_211239 ?auto_211241 ) ) ( not ( = ?auto_211239 ?auto_211242 ) ) ( not ( = ?auto_211240 ?auto_211241 ) ) ( not ( = ?auto_211240 ?auto_211242 ) ) ( not ( = ?auto_211241 ?auto_211242 ) ) ( ON ?auto_211242 ?auto_211243 ) ( CLEAR ?auto_211242 ) ( not ( = ?auto_211239 ?auto_211243 ) ) ( not ( = ?auto_211240 ?auto_211243 ) ) ( not ( = ?auto_211241 ?auto_211243 ) ) ( not ( = ?auto_211242 ?auto_211243 ) ) ( HOLDING ?auto_211241 ) ( CLEAR ?auto_211240 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211239 ?auto_211240 ?auto_211241 )
      ( MAKE-4PILE ?auto_211239 ?auto_211240 ?auto_211241 ?auto_211242 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211244 - BLOCK
      ?auto_211245 - BLOCK
      ?auto_211246 - BLOCK
      ?auto_211247 - BLOCK
    )
    :vars
    (
      ?auto_211248 - BLOCK
      ?auto_211250 - BLOCK
      ?auto_211249 - BLOCK
      ?auto_211251 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211244 ) ( ON ?auto_211245 ?auto_211244 ) ( not ( = ?auto_211244 ?auto_211245 ) ) ( not ( = ?auto_211244 ?auto_211246 ) ) ( not ( = ?auto_211244 ?auto_211247 ) ) ( not ( = ?auto_211245 ?auto_211246 ) ) ( not ( = ?auto_211245 ?auto_211247 ) ) ( not ( = ?auto_211246 ?auto_211247 ) ) ( ON ?auto_211247 ?auto_211248 ) ( not ( = ?auto_211244 ?auto_211248 ) ) ( not ( = ?auto_211245 ?auto_211248 ) ) ( not ( = ?auto_211246 ?auto_211248 ) ) ( not ( = ?auto_211247 ?auto_211248 ) ) ( CLEAR ?auto_211245 ) ( ON ?auto_211246 ?auto_211247 ) ( CLEAR ?auto_211246 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211250 ) ( ON ?auto_211249 ?auto_211250 ) ( ON ?auto_211251 ?auto_211249 ) ( ON ?auto_211248 ?auto_211251 ) ( not ( = ?auto_211250 ?auto_211249 ) ) ( not ( = ?auto_211250 ?auto_211251 ) ) ( not ( = ?auto_211250 ?auto_211248 ) ) ( not ( = ?auto_211250 ?auto_211247 ) ) ( not ( = ?auto_211250 ?auto_211246 ) ) ( not ( = ?auto_211249 ?auto_211251 ) ) ( not ( = ?auto_211249 ?auto_211248 ) ) ( not ( = ?auto_211249 ?auto_211247 ) ) ( not ( = ?auto_211249 ?auto_211246 ) ) ( not ( = ?auto_211251 ?auto_211248 ) ) ( not ( = ?auto_211251 ?auto_211247 ) ) ( not ( = ?auto_211251 ?auto_211246 ) ) ( not ( = ?auto_211244 ?auto_211250 ) ) ( not ( = ?auto_211244 ?auto_211249 ) ) ( not ( = ?auto_211244 ?auto_211251 ) ) ( not ( = ?auto_211245 ?auto_211250 ) ) ( not ( = ?auto_211245 ?auto_211249 ) ) ( not ( = ?auto_211245 ?auto_211251 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211250 ?auto_211249 ?auto_211251 ?auto_211248 ?auto_211247 )
      ( MAKE-4PILE ?auto_211244 ?auto_211245 ?auto_211246 ?auto_211247 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211252 - BLOCK
      ?auto_211253 - BLOCK
      ?auto_211254 - BLOCK
      ?auto_211255 - BLOCK
    )
    :vars
    (
      ?auto_211256 - BLOCK
      ?auto_211257 - BLOCK
      ?auto_211258 - BLOCK
      ?auto_211259 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211252 ) ( not ( = ?auto_211252 ?auto_211253 ) ) ( not ( = ?auto_211252 ?auto_211254 ) ) ( not ( = ?auto_211252 ?auto_211255 ) ) ( not ( = ?auto_211253 ?auto_211254 ) ) ( not ( = ?auto_211253 ?auto_211255 ) ) ( not ( = ?auto_211254 ?auto_211255 ) ) ( ON ?auto_211255 ?auto_211256 ) ( not ( = ?auto_211252 ?auto_211256 ) ) ( not ( = ?auto_211253 ?auto_211256 ) ) ( not ( = ?auto_211254 ?auto_211256 ) ) ( not ( = ?auto_211255 ?auto_211256 ) ) ( ON ?auto_211254 ?auto_211255 ) ( CLEAR ?auto_211254 ) ( ON-TABLE ?auto_211257 ) ( ON ?auto_211258 ?auto_211257 ) ( ON ?auto_211259 ?auto_211258 ) ( ON ?auto_211256 ?auto_211259 ) ( not ( = ?auto_211257 ?auto_211258 ) ) ( not ( = ?auto_211257 ?auto_211259 ) ) ( not ( = ?auto_211257 ?auto_211256 ) ) ( not ( = ?auto_211257 ?auto_211255 ) ) ( not ( = ?auto_211257 ?auto_211254 ) ) ( not ( = ?auto_211258 ?auto_211259 ) ) ( not ( = ?auto_211258 ?auto_211256 ) ) ( not ( = ?auto_211258 ?auto_211255 ) ) ( not ( = ?auto_211258 ?auto_211254 ) ) ( not ( = ?auto_211259 ?auto_211256 ) ) ( not ( = ?auto_211259 ?auto_211255 ) ) ( not ( = ?auto_211259 ?auto_211254 ) ) ( not ( = ?auto_211252 ?auto_211257 ) ) ( not ( = ?auto_211252 ?auto_211258 ) ) ( not ( = ?auto_211252 ?auto_211259 ) ) ( not ( = ?auto_211253 ?auto_211257 ) ) ( not ( = ?auto_211253 ?auto_211258 ) ) ( not ( = ?auto_211253 ?auto_211259 ) ) ( HOLDING ?auto_211253 ) ( CLEAR ?auto_211252 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211252 ?auto_211253 )
      ( MAKE-4PILE ?auto_211252 ?auto_211253 ?auto_211254 ?auto_211255 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211260 - BLOCK
      ?auto_211261 - BLOCK
      ?auto_211262 - BLOCK
      ?auto_211263 - BLOCK
    )
    :vars
    (
      ?auto_211265 - BLOCK
      ?auto_211266 - BLOCK
      ?auto_211267 - BLOCK
      ?auto_211264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211260 ) ( not ( = ?auto_211260 ?auto_211261 ) ) ( not ( = ?auto_211260 ?auto_211262 ) ) ( not ( = ?auto_211260 ?auto_211263 ) ) ( not ( = ?auto_211261 ?auto_211262 ) ) ( not ( = ?auto_211261 ?auto_211263 ) ) ( not ( = ?auto_211262 ?auto_211263 ) ) ( ON ?auto_211263 ?auto_211265 ) ( not ( = ?auto_211260 ?auto_211265 ) ) ( not ( = ?auto_211261 ?auto_211265 ) ) ( not ( = ?auto_211262 ?auto_211265 ) ) ( not ( = ?auto_211263 ?auto_211265 ) ) ( ON ?auto_211262 ?auto_211263 ) ( ON-TABLE ?auto_211266 ) ( ON ?auto_211267 ?auto_211266 ) ( ON ?auto_211264 ?auto_211267 ) ( ON ?auto_211265 ?auto_211264 ) ( not ( = ?auto_211266 ?auto_211267 ) ) ( not ( = ?auto_211266 ?auto_211264 ) ) ( not ( = ?auto_211266 ?auto_211265 ) ) ( not ( = ?auto_211266 ?auto_211263 ) ) ( not ( = ?auto_211266 ?auto_211262 ) ) ( not ( = ?auto_211267 ?auto_211264 ) ) ( not ( = ?auto_211267 ?auto_211265 ) ) ( not ( = ?auto_211267 ?auto_211263 ) ) ( not ( = ?auto_211267 ?auto_211262 ) ) ( not ( = ?auto_211264 ?auto_211265 ) ) ( not ( = ?auto_211264 ?auto_211263 ) ) ( not ( = ?auto_211264 ?auto_211262 ) ) ( not ( = ?auto_211260 ?auto_211266 ) ) ( not ( = ?auto_211260 ?auto_211267 ) ) ( not ( = ?auto_211260 ?auto_211264 ) ) ( not ( = ?auto_211261 ?auto_211266 ) ) ( not ( = ?auto_211261 ?auto_211267 ) ) ( not ( = ?auto_211261 ?auto_211264 ) ) ( CLEAR ?auto_211260 ) ( ON ?auto_211261 ?auto_211262 ) ( CLEAR ?auto_211261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211266 ?auto_211267 ?auto_211264 ?auto_211265 ?auto_211263 ?auto_211262 )
      ( MAKE-4PILE ?auto_211260 ?auto_211261 ?auto_211262 ?auto_211263 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211268 - BLOCK
      ?auto_211269 - BLOCK
      ?auto_211270 - BLOCK
      ?auto_211271 - BLOCK
    )
    :vars
    (
      ?auto_211274 - BLOCK
      ?auto_211275 - BLOCK
      ?auto_211273 - BLOCK
      ?auto_211272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211268 ?auto_211269 ) ) ( not ( = ?auto_211268 ?auto_211270 ) ) ( not ( = ?auto_211268 ?auto_211271 ) ) ( not ( = ?auto_211269 ?auto_211270 ) ) ( not ( = ?auto_211269 ?auto_211271 ) ) ( not ( = ?auto_211270 ?auto_211271 ) ) ( ON ?auto_211271 ?auto_211274 ) ( not ( = ?auto_211268 ?auto_211274 ) ) ( not ( = ?auto_211269 ?auto_211274 ) ) ( not ( = ?auto_211270 ?auto_211274 ) ) ( not ( = ?auto_211271 ?auto_211274 ) ) ( ON ?auto_211270 ?auto_211271 ) ( ON-TABLE ?auto_211275 ) ( ON ?auto_211273 ?auto_211275 ) ( ON ?auto_211272 ?auto_211273 ) ( ON ?auto_211274 ?auto_211272 ) ( not ( = ?auto_211275 ?auto_211273 ) ) ( not ( = ?auto_211275 ?auto_211272 ) ) ( not ( = ?auto_211275 ?auto_211274 ) ) ( not ( = ?auto_211275 ?auto_211271 ) ) ( not ( = ?auto_211275 ?auto_211270 ) ) ( not ( = ?auto_211273 ?auto_211272 ) ) ( not ( = ?auto_211273 ?auto_211274 ) ) ( not ( = ?auto_211273 ?auto_211271 ) ) ( not ( = ?auto_211273 ?auto_211270 ) ) ( not ( = ?auto_211272 ?auto_211274 ) ) ( not ( = ?auto_211272 ?auto_211271 ) ) ( not ( = ?auto_211272 ?auto_211270 ) ) ( not ( = ?auto_211268 ?auto_211275 ) ) ( not ( = ?auto_211268 ?auto_211273 ) ) ( not ( = ?auto_211268 ?auto_211272 ) ) ( not ( = ?auto_211269 ?auto_211275 ) ) ( not ( = ?auto_211269 ?auto_211273 ) ) ( not ( = ?auto_211269 ?auto_211272 ) ) ( ON ?auto_211269 ?auto_211270 ) ( CLEAR ?auto_211269 ) ( HOLDING ?auto_211268 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_211268 )
      ( MAKE-4PILE ?auto_211268 ?auto_211269 ?auto_211270 ?auto_211271 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211276 - BLOCK
      ?auto_211277 - BLOCK
      ?auto_211278 - BLOCK
      ?auto_211279 - BLOCK
    )
    :vars
    (
      ?auto_211281 - BLOCK
      ?auto_211280 - BLOCK
      ?auto_211282 - BLOCK
      ?auto_211283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211276 ?auto_211277 ) ) ( not ( = ?auto_211276 ?auto_211278 ) ) ( not ( = ?auto_211276 ?auto_211279 ) ) ( not ( = ?auto_211277 ?auto_211278 ) ) ( not ( = ?auto_211277 ?auto_211279 ) ) ( not ( = ?auto_211278 ?auto_211279 ) ) ( ON ?auto_211279 ?auto_211281 ) ( not ( = ?auto_211276 ?auto_211281 ) ) ( not ( = ?auto_211277 ?auto_211281 ) ) ( not ( = ?auto_211278 ?auto_211281 ) ) ( not ( = ?auto_211279 ?auto_211281 ) ) ( ON ?auto_211278 ?auto_211279 ) ( ON-TABLE ?auto_211280 ) ( ON ?auto_211282 ?auto_211280 ) ( ON ?auto_211283 ?auto_211282 ) ( ON ?auto_211281 ?auto_211283 ) ( not ( = ?auto_211280 ?auto_211282 ) ) ( not ( = ?auto_211280 ?auto_211283 ) ) ( not ( = ?auto_211280 ?auto_211281 ) ) ( not ( = ?auto_211280 ?auto_211279 ) ) ( not ( = ?auto_211280 ?auto_211278 ) ) ( not ( = ?auto_211282 ?auto_211283 ) ) ( not ( = ?auto_211282 ?auto_211281 ) ) ( not ( = ?auto_211282 ?auto_211279 ) ) ( not ( = ?auto_211282 ?auto_211278 ) ) ( not ( = ?auto_211283 ?auto_211281 ) ) ( not ( = ?auto_211283 ?auto_211279 ) ) ( not ( = ?auto_211283 ?auto_211278 ) ) ( not ( = ?auto_211276 ?auto_211280 ) ) ( not ( = ?auto_211276 ?auto_211282 ) ) ( not ( = ?auto_211276 ?auto_211283 ) ) ( not ( = ?auto_211277 ?auto_211280 ) ) ( not ( = ?auto_211277 ?auto_211282 ) ) ( not ( = ?auto_211277 ?auto_211283 ) ) ( ON ?auto_211277 ?auto_211278 ) ( ON ?auto_211276 ?auto_211277 ) ( CLEAR ?auto_211276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211280 ?auto_211282 ?auto_211283 ?auto_211281 ?auto_211279 ?auto_211278 ?auto_211277 )
      ( MAKE-4PILE ?auto_211276 ?auto_211277 ?auto_211278 ?auto_211279 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211284 - BLOCK
      ?auto_211285 - BLOCK
      ?auto_211286 - BLOCK
      ?auto_211287 - BLOCK
    )
    :vars
    (
      ?auto_211289 - BLOCK
      ?auto_211290 - BLOCK
      ?auto_211288 - BLOCK
      ?auto_211291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211284 ?auto_211285 ) ) ( not ( = ?auto_211284 ?auto_211286 ) ) ( not ( = ?auto_211284 ?auto_211287 ) ) ( not ( = ?auto_211285 ?auto_211286 ) ) ( not ( = ?auto_211285 ?auto_211287 ) ) ( not ( = ?auto_211286 ?auto_211287 ) ) ( ON ?auto_211287 ?auto_211289 ) ( not ( = ?auto_211284 ?auto_211289 ) ) ( not ( = ?auto_211285 ?auto_211289 ) ) ( not ( = ?auto_211286 ?auto_211289 ) ) ( not ( = ?auto_211287 ?auto_211289 ) ) ( ON ?auto_211286 ?auto_211287 ) ( ON-TABLE ?auto_211290 ) ( ON ?auto_211288 ?auto_211290 ) ( ON ?auto_211291 ?auto_211288 ) ( ON ?auto_211289 ?auto_211291 ) ( not ( = ?auto_211290 ?auto_211288 ) ) ( not ( = ?auto_211290 ?auto_211291 ) ) ( not ( = ?auto_211290 ?auto_211289 ) ) ( not ( = ?auto_211290 ?auto_211287 ) ) ( not ( = ?auto_211290 ?auto_211286 ) ) ( not ( = ?auto_211288 ?auto_211291 ) ) ( not ( = ?auto_211288 ?auto_211289 ) ) ( not ( = ?auto_211288 ?auto_211287 ) ) ( not ( = ?auto_211288 ?auto_211286 ) ) ( not ( = ?auto_211291 ?auto_211289 ) ) ( not ( = ?auto_211291 ?auto_211287 ) ) ( not ( = ?auto_211291 ?auto_211286 ) ) ( not ( = ?auto_211284 ?auto_211290 ) ) ( not ( = ?auto_211284 ?auto_211288 ) ) ( not ( = ?auto_211284 ?auto_211291 ) ) ( not ( = ?auto_211285 ?auto_211290 ) ) ( not ( = ?auto_211285 ?auto_211288 ) ) ( not ( = ?auto_211285 ?auto_211291 ) ) ( ON ?auto_211285 ?auto_211286 ) ( HOLDING ?auto_211284 ) ( CLEAR ?auto_211285 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_211290 ?auto_211288 ?auto_211291 ?auto_211289 ?auto_211287 ?auto_211286 ?auto_211285 ?auto_211284 )
      ( MAKE-4PILE ?auto_211284 ?auto_211285 ?auto_211286 ?auto_211287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211292 - BLOCK
      ?auto_211293 - BLOCK
      ?auto_211294 - BLOCK
      ?auto_211295 - BLOCK
    )
    :vars
    (
      ?auto_211296 - BLOCK
      ?auto_211298 - BLOCK
      ?auto_211299 - BLOCK
      ?auto_211297 - BLOCK
      ?auto_211300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211292 ?auto_211293 ) ) ( not ( = ?auto_211292 ?auto_211294 ) ) ( not ( = ?auto_211292 ?auto_211295 ) ) ( not ( = ?auto_211293 ?auto_211294 ) ) ( not ( = ?auto_211293 ?auto_211295 ) ) ( not ( = ?auto_211294 ?auto_211295 ) ) ( ON ?auto_211295 ?auto_211296 ) ( not ( = ?auto_211292 ?auto_211296 ) ) ( not ( = ?auto_211293 ?auto_211296 ) ) ( not ( = ?auto_211294 ?auto_211296 ) ) ( not ( = ?auto_211295 ?auto_211296 ) ) ( ON ?auto_211294 ?auto_211295 ) ( ON-TABLE ?auto_211298 ) ( ON ?auto_211299 ?auto_211298 ) ( ON ?auto_211297 ?auto_211299 ) ( ON ?auto_211296 ?auto_211297 ) ( not ( = ?auto_211298 ?auto_211299 ) ) ( not ( = ?auto_211298 ?auto_211297 ) ) ( not ( = ?auto_211298 ?auto_211296 ) ) ( not ( = ?auto_211298 ?auto_211295 ) ) ( not ( = ?auto_211298 ?auto_211294 ) ) ( not ( = ?auto_211299 ?auto_211297 ) ) ( not ( = ?auto_211299 ?auto_211296 ) ) ( not ( = ?auto_211299 ?auto_211295 ) ) ( not ( = ?auto_211299 ?auto_211294 ) ) ( not ( = ?auto_211297 ?auto_211296 ) ) ( not ( = ?auto_211297 ?auto_211295 ) ) ( not ( = ?auto_211297 ?auto_211294 ) ) ( not ( = ?auto_211292 ?auto_211298 ) ) ( not ( = ?auto_211292 ?auto_211299 ) ) ( not ( = ?auto_211292 ?auto_211297 ) ) ( not ( = ?auto_211293 ?auto_211298 ) ) ( not ( = ?auto_211293 ?auto_211299 ) ) ( not ( = ?auto_211293 ?auto_211297 ) ) ( ON ?auto_211293 ?auto_211294 ) ( CLEAR ?auto_211293 ) ( ON ?auto_211292 ?auto_211300 ) ( CLEAR ?auto_211292 ) ( HAND-EMPTY ) ( not ( = ?auto_211292 ?auto_211300 ) ) ( not ( = ?auto_211293 ?auto_211300 ) ) ( not ( = ?auto_211294 ?auto_211300 ) ) ( not ( = ?auto_211295 ?auto_211300 ) ) ( not ( = ?auto_211296 ?auto_211300 ) ) ( not ( = ?auto_211298 ?auto_211300 ) ) ( not ( = ?auto_211299 ?auto_211300 ) ) ( not ( = ?auto_211297 ?auto_211300 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_211292 ?auto_211300 )
      ( MAKE-4PILE ?auto_211292 ?auto_211293 ?auto_211294 ?auto_211295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211301 - BLOCK
      ?auto_211302 - BLOCK
      ?auto_211303 - BLOCK
      ?auto_211304 - BLOCK
    )
    :vars
    (
      ?auto_211305 - BLOCK
      ?auto_211307 - BLOCK
      ?auto_211308 - BLOCK
      ?auto_211306 - BLOCK
      ?auto_211309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211301 ?auto_211302 ) ) ( not ( = ?auto_211301 ?auto_211303 ) ) ( not ( = ?auto_211301 ?auto_211304 ) ) ( not ( = ?auto_211302 ?auto_211303 ) ) ( not ( = ?auto_211302 ?auto_211304 ) ) ( not ( = ?auto_211303 ?auto_211304 ) ) ( ON ?auto_211304 ?auto_211305 ) ( not ( = ?auto_211301 ?auto_211305 ) ) ( not ( = ?auto_211302 ?auto_211305 ) ) ( not ( = ?auto_211303 ?auto_211305 ) ) ( not ( = ?auto_211304 ?auto_211305 ) ) ( ON ?auto_211303 ?auto_211304 ) ( ON-TABLE ?auto_211307 ) ( ON ?auto_211308 ?auto_211307 ) ( ON ?auto_211306 ?auto_211308 ) ( ON ?auto_211305 ?auto_211306 ) ( not ( = ?auto_211307 ?auto_211308 ) ) ( not ( = ?auto_211307 ?auto_211306 ) ) ( not ( = ?auto_211307 ?auto_211305 ) ) ( not ( = ?auto_211307 ?auto_211304 ) ) ( not ( = ?auto_211307 ?auto_211303 ) ) ( not ( = ?auto_211308 ?auto_211306 ) ) ( not ( = ?auto_211308 ?auto_211305 ) ) ( not ( = ?auto_211308 ?auto_211304 ) ) ( not ( = ?auto_211308 ?auto_211303 ) ) ( not ( = ?auto_211306 ?auto_211305 ) ) ( not ( = ?auto_211306 ?auto_211304 ) ) ( not ( = ?auto_211306 ?auto_211303 ) ) ( not ( = ?auto_211301 ?auto_211307 ) ) ( not ( = ?auto_211301 ?auto_211308 ) ) ( not ( = ?auto_211301 ?auto_211306 ) ) ( not ( = ?auto_211302 ?auto_211307 ) ) ( not ( = ?auto_211302 ?auto_211308 ) ) ( not ( = ?auto_211302 ?auto_211306 ) ) ( ON ?auto_211301 ?auto_211309 ) ( CLEAR ?auto_211301 ) ( not ( = ?auto_211301 ?auto_211309 ) ) ( not ( = ?auto_211302 ?auto_211309 ) ) ( not ( = ?auto_211303 ?auto_211309 ) ) ( not ( = ?auto_211304 ?auto_211309 ) ) ( not ( = ?auto_211305 ?auto_211309 ) ) ( not ( = ?auto_211307 ?auto_211309 ) ) ( not ( = ?auto_211308 ?auto_211309 ) ) ( not ( = ?auto_211306 ?auto_211309 ) ) ( HOLDING ?auto_211302 ) ( CLEAR ?auto_211303 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211307 ?auto_211308 ?auto_211306 ?auto_211305 ?auto_211304 ?auto_211303 ?auto_211302 )
      ( MAKE-4PILE ?auto_211301 ?auto_211302 ?auto_211303 ?auto_211304 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211310 - BLOCK
      ?auto_211311 - BLOCK
      ?auto_211312 - BLOCK
      ?auto_211313 - BLOCK
    )
    :vars
    (
      ?auto_211318 - BLOCK
      ?auto_211314 - BLOCK
      ?auto_211317 - BLOCK
      ?auto_211315 - BLOCK
      ?auto_211316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211310 ?auto_211311 ) ) ( not ( = ?auto_211310 ?auto_211312 ) ) ( not ( = ?auto_211310 ?auto_211313 ) ) ( not ( = ?auto_211311 ?auto_211312 ) ) ( not ( = ?auto_211311 ?auto_211313 ) ) ( not ( = ?auto_211312 ?auto_211313 ) ) ( ON ?auto_211313 ?auto_211318 ) ( not ( = ?auto_211310 ?auto_211318 ) ) ( not ( = ?auto_211311 ?auto_211318 ) ) ( not ( = ?auto_211312 ?auto_211318 ) ) ( not ( = ?auto_211313 ?auto_211318 ) ) ( ON ?auto_211312 ?auto_211313 ) ( ON-TABLE ?auto_211314 ) ( ON ?auto_211317 ?auto_211314 ) ( ON ?auto_211315 ?auto_211317 ) ( ON ?auto_211318 ?auto_211315 ) ( not ( = ?auto_211314 ?auto_211317 ) ) ( not ( = ?auto_211314 ?auto_211315 ) ) ( not ( = ?auto_211314 ?auto_211318 ) ) ( not ( = ?auto_211314 ?auto_211313 ) ) ( not ( = ?auto_211314 ?auto_211312 ) ) ( not ( = ?auto_211317 ?auto_211315 ) ) ( not ( = ?auto_211317 ?auto_211318 ) ) ( not ( = ?auto_211317 ?auto_211313 ) ) ( not ( = ?auto_211317 ?auto_211312 ) ) ( not ( = ?auto_211315 ?auto_211318 ) ) ( not ( = ?auto_211315 ?auto_211313 ) ) ( not ( = ?auto_211315 ?auto_211312 ) ) ( not ( = ?auto_211310 ?auto_211314 ) ) ( not ( = ?auto_211310 ?auto_211317 ) ) ( not ( = ?auto_211310 ?auto_211315 ) ) ( not ( = ?auto_211311 ?auto_211314 ) ) ( not ( = ?auto_211311 ?auto_211317 ) ) ( not ( = ?auto_211311 ?auto_211315 ) ) ( ON ?auto_211310 ?auto_211316 ) ( not ( = ?auto_211310 ?auto_211316 ) ) ( not ( = ?auto_211311 ?auto_211316 ) ) ( not ( = ?auto_211312 ?auto_211316 ) ) ( not ( = ?auto_211313 ?auto_211316 ) ) ( not ( = ?auto_211318 ?auto_211316 ) ) ( not ( = ?auto_211314 ?auto_211316 ) ) ( not ( = ?auto_211317 ?auto_211316 ) ) ( not ( = ?auto_211315 ?auto_211316 ) ) ( CLEAR ?auto_211312 ) ( ON ?auto_211311 ?auto_211310 ) ( CLEAR ?auto_211311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211316 ?auto_211310 )
      ( MAKE-4PILE ?auto_211310 ?auto_211311 ?auto_211312 ?auto_211313 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211319 - BLOCK
      ?auto_211320 - BLOCK
      ?auto_211321 - BLOCK
      ?auto_211322 - BLOCK
    )
    :vars
    (
      ?auto_211327 - BLOCK
      ?auto_211324 - BLOCK
      ?auto_211325 - BLOCK
      ?auto_211323 - BLOCK
      ?auto_211326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211319 ?auto_211320 ) ) ( not ( = ?auto_211319 ?auto_211321 ) ) ( not ( = ?auto_211319 ?auto_211322 ) ) ( not ( = ?auto_211320 ?auto_211321 ) ) ( not ( = ?auto_211320 ?auto_211322 ) ) ( not ( = ?auto_211321 ?auto_211322 ) ) ( ON ?auto_211322 ?auto_211327 ) ( not ( = ?auto_211319 ?auto_211327 ) ) ( not ( = ?auto_211320 ?auto_211327 ) ) ( not ( = ?auto_211321 ?auto_211327 ) ) ( not ( = ?auto_211322 ?auto_211327 ) ) ( ON-TABLE ?auto_211324 ) ( ON ?auto_211325 ?auto_211324 ) ( ON ?auto_211323 ?auto_211325 ) ( ON ?auto_211327 ?auto_211323 ) ( not ( = ?auto_211324 ?auto_211325 ) ) ( not ( = ?auto_211324 ?auto_211323 ) ) ( not ( = ?auto_211324 ?auto_211327 ) ) ( not ( = ?auto_211324 ?auto_211322 ) ) ( not ( = ?auto_211324 ?auto_211321 ) ) ( not ( = ?auto_211325 ?auto_211323 ) ) ( not ( = ?auto_211325 ?auto_211327 ) ) ( not ( = ?auto_211325 ?auto_211322 ) ) ( not ( = ?auto_211325 ?auto_211321 ) ) ( not ( = ?auto_211323 ?auto_211327 ) ) ( not ( = ?auto_211323 ?auto_211322 ) ) ( not ( = ?auto_211323 ?auto_211321 ) ) ( not ( = ?auto_211319 ?auto_211324 ) ) ( not ( = ?auto_211319 ?auto_211325 ) ) ( not ( = ?auto_211319 ?auto_211323 ) ) ( not ( = ?auto_211320 ?auto_211324 ) ) ( not ( = ?auto_211320 ?auto_211325 ) ) ( not ( = ?auto_211320 ?auto_211323 ) ) ( ON ?auto_211319 ?auto_211326 ) ( not ( = ?auto_211319 ?auto_211326 ) ) ( not ( = ?auto_211320 ?auto_211326 ) ) ( not ( = ?auto_211321 ?auto_211326 ) ) ( not ( = ?auto_211322 ?auto_211326 ) ) ( not ( = ?auto_211327 ?auto_211326 ) ) ( not ( = ?auto_211324 ?auto_211326 ) ) ( not ( = ?auto_211325 ?auto_211326 ) ) ( not ( = ?auto_211323 ?auto_211326 ) ) ( ON ?auto_211320 ?auto_211319 ) ( CLEAR ?auto_211320 ) ( ON-TABLE ?auto_211326 ) ( HOLDING ?auto_211321 ) ( CLEAR ?auto_211322 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211324 ?auto_211325 ?auto_211323 ?auto_211327 ?auto_211322 ?auto_211321 )
      ( MAKE-4PILE ?auto_211319 ?auto_211320 ?auto_211321 ?auto_211322 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211328 - BLOCK
      ?auto_211329 - BLOCK
      ?auto_211330 - BLOCK
      ?auto_211331 - BLOCK
    )
    :vars
    (
      ?auto_211333 - BLOCK
      ?auto_211336 - BLOCK
      ?auto_211334 - BLOCK
      ?auto_211332 - BLOCK
      ?auto_211335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211328 ?auto_211329 ) ) ( not ( = ?auto_211328 ?auto_211330 ) ) ( not ( = ?auto_211328 ?auto_211331 ) ) ( not ( = ?auto_211329 ?auto_211330 ) ) ( not ( = ?auto_211329 ?auto_211331 ) ) ( not ( = ?auto_211330 ?auto_211331 ) ) ( ON ?auto_211331 ?auto_211333 ) ( not ( = ?auto_211328 ?auto_211333 ) ) ( not ( = ?auto_211329 ?auto_211333 ) ) ( not ( = ?auto_211330 ?auto_211333 ) ) ( not ( = ?auto_211331 ?auto_211333 ) ) ( ON-TABLE ?auto_211336 ) ( ON ?auto_211334 ?auto_211336 ) ( ON ?auto_211332 ?auto_211334 ) ( ON ?auto_211333 ?auto_211332 ) ( not ( = ?auto_211336 ?auto_211334 ) ) ( not ( = ?auto_211336 ?auto_211332 ) ) ( not ( = ?auto_211336 ?auto_211333 ) ) ( not ( = ?auto_211336 ?auto_211331 ) ) ( not ( = ?auto_211336 ?auto_211330 ) ) ( not ( = ?auto_211334 ?auto_211332 ) ) ( not ( = ?auto_211334 ?auto_211333 ) ) ( not ( = ?auto_211334 ?auto_211331 ) ) ( not ( = ?auto_211334 ?auto_211330 ) ) ( not ( = ?auto_211332 ?auto_211333 ) ) ( not ( = ?auto_211332 ?auto_211331 ) ) ( not ( = ?auto_211332 ?auto_211330 ) ) ( not ( = ?auto_211328 ?auto_211336 ) ) ( not ( = ?auto_211328 ?auto_211334 ) ) ( not ( = ?auto_211328 ?auto_211332 ) ) ( not ( = ?auto_211329 ?auto_211336 ) ) ( not ( = ?auto_211329 ?auto_211334 ) ) ( not ( = ?auto_211329 ?auto_211332 ) ) ( ON ?auto_211328 ?auto_211335 ) ( not ( = ?auto_211328 ?auto_211335 ) ) ( not ( = ?auto_211329 ?auto_211335 ) ) ( not ( = ?auto_211330 ?auto_211335 ) ) ( not ( = ?auto_211331 ?auto_211335 ) ) ( not ( = ?auto_211333 ?auto_211335 ) ) ( not ( = ?auto_211336 ?auto_211335 ) ) ( not ( = ?auto_211334 ?auto_211335 ) ) ( not ( = ?auto_211332 ?auto_211335 ) ) ( ON ?auto_211329 ?auto_211328 ) ( ON-TABLE ?auto_211335 ) ( CLEAR ?auto_211331 ) ( ON ?auto_211330 ?auto_211329 ) ( CLEAR ?auto_211330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211335 ?auto_211328 ?auto_211329 )
      ( MAKE-4PILE ?auto_211328 ?auto_211329 ?auto_211330 ?auto_211331 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211337 - BLOCK
      ?auto_211338 - BLOCK
      ?auto_211339 - BLOCK
      ?auto_211340 - BLOCK
    )
    :vars
    (
      ?auto_211341 - BLOCK
      ?auto_211343 - BLOCK
      ?auto_211342 - BLOCK
      ?auto_211345 - BLOCK
      ?auto_211344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211337 ?auto_211338 ) ) ( not ( = ?auto_211337 ?auto_211339 ) ) ( not ( = ?auto_211337 ?auto_211340 ) ) ( not ( = ?auto_211338 ?auto_211339 ) ) ( not ( = ?auto_211338 ?auto_211340 ) ) ( not ( = ?auto_211339 ?auto_211340 ) ) ( not ( = ?auto_211337 ?auto_211341 ) ) ( not ( = ?auto_211338 ?auto_211341 ) ) ( not ( = ?auto_211339 ?auto_211341 ) ) ( not ( = ?auto_211340 ?auto_211341 ) ) ( ON-TABLE ?auto_211343 ) ( ON ?auto_211342 ?auto_211343 ) ( ON ?auto_211345 ?auto_211342 ) ( ON ?auto_211341 ?auto_211345 ) ( not ( = ?auto_211343 ?auto_211342 ) ) ( not ( = ?auto_211343 ?auto_211345 ) ) ( not ( = ?auto_211343 ?auto_211341 ) ) ( not ( = ?auto_211343 ?auto_211340 ) ) ( not ( = ?auto_211343 ?auto_211339 ) ) ( not ( = ?auto_211342 ?auto_211345 ) ) ( not ( = ?auto_211342 ?auto_211341 ) ) ( not ( = ?auto_211342 ?auto_211340 ) ) ( not ( = ?auto_211342 ?auto_211339 ) ) ( not ( = ?auto_211345 ?auto_211341 ) ) ( not ( = ?auto_211345 ?auto_211340 ) ) ( not ( = ?auto_211345 ?auto_211339 ) ) ( not ( = ?auto_211337 ?auto_211343 ) ) ( not ( = ?auto_211337 ?auto_211342 ) ) ( not ( = ?auto_211337 ?auto_211345 ) ) ( not ( = ?auto_211338 ?auto_211343 ) ) ( not ( = ?auto_211338 ?auto_211342 ) ) ( not ( = ?auto_211338 ?auto_211345 ) ) ( ON ?auto_211337 ?auto_211344 ) ( not ( = ?auto_211337 ?auto_211344 ) ) ( not ( = ?auto_211338 ?auto_211344 ) ) ( not ( = ?auto_211339 ?auto_211344 ) ) ( not ( = ?auto_211340 ?auto_211344 ) ) ( not ( = ?auto_211341 ?auto_211344 ) ) ( not ( = ?auto_211343 ?auto_211344 ) ) ( not ( = ?auto_211342 ?auto_211344 ) ) ( not ( = ?auto_211345 ?auto_211344 ) ) ( ON ?auto_211338 ?auto_211337 ) ( ON-TABLE ?auto_211344 ) ( ON ?auto_211339 ?auto_211338 ) ( CLEAR ?auto_211339 ) ( HOLDING ?auto_211340 ) ( CLEAR ?auto_211341 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211343 ?auto_211342 ?auto_211345 ?auto_211341 ?auto_211340 )
      ( MAKE-4PILE ?auto_211337 ?auto_211338 ?auto_211339 ?auto_211340 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211346 - BLOCK
      ?auto_211347 - BLOCK
      ?auto_211348 - BLOCK
      ?auto_211349 - BLOCK
    )
    :vars
    (
      ?auto_211350 - BLOCK
      ?auto_211353 - BLOCK
      ?auto_211354 - BLOCK
      ?auto_211351 - BLOCK
      ?auto_211352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211346 ?auto_211347 ) ) ( not ( = ?auto_211346 ?auto_211348 ) ) ( not ( = ?auto_211346 ?auto_211349 ) ) ( not ( = ?auto_211347 ?auto_211348 ) ) ( not ( = ?auto_211347 ?auto_211349 ) ) ( not ( = ?auto_211348 ?auto_211349 ) ) ( not ( = ?auto_211346 ?auto_211350 ) ) ( not ( = ?auto_211347 ?auto_211350 ) ) ( not ( = ?auto_211348 ?auto_211350 ) ) ( not ( = ?auto_211349 ?auto_211350 ) ) ( ON-TABLE ?auto_211353 ) ( ON ?auto_211354 ?auto_211353 ) ( ON ?auto_211351 ?auto_211354 ) ( ON ?auto_211350 ?auto_211351 ) ( not ( = ?auto_211353 ?auto_211354 ) ) ( not ( = ?auto_211353 ?auto_211351 ) ) ( not ( = ?auto_211353 ?auto_211350 ) ) ( not ( = ?auto_211353 ?auto_211349 ) ) ( not ( = ?auto_211353 ?auto_211348 ) ) ( not ( = ?auto_211354 ?auto_211351 ) ) ( not ( = ?auto_211354 ?auto_211350 ) ) ( not ( = ?auto_211354 ?auto_211349 ) ) ( not ( = ?auto_211354 ?auto_211348 ) ) ( not ( = ?auto_211351 ?auto_211350 ) ) ( not ( = ?auto_211351 ?auto_211349 ) ) ( not ( = ?auto_211351 ?auto_211348 ) ) ( not ( = ?auto_211346 ?auto_211353 ) ) ( not ( = ?auto_211346 ?auto_211354 ) ) ( not ( = ?auto_211346 ?auto_211351 ) ) ( not ( = ?auto_211347 ?auto_211353 ) ) ( not ( = ?auto_211347 ?auto_211354 ) ) ( not ( = ?auto_211347 ?auto_211351 ) ) ( ON ?auto_211346 ?auto_211352 ) ( not ( = ?auto_211346 ?auto_211352 ) ) ( not ( = ?auto_211347 ?auto_211352 ) ) ( not ( = ?auto_211348 ?auto_211352 ) ) ( not ( = ?auto_211349 ?auto_211352 ) ) ( not ( = ?auto_211350 ?auto_211352 ) ) ( not ( = ?auto_211353 ?auto_211352 ) ) ( not ( = ?auto_211354 ?auto_211352 ) ) ( not ( = ?auto_211351 ?auto_211352 ) ) ( ON ?auto_211347 ?auto_211346 ) ( ON-TABLE ?auto_211352 ) ( ON ?auto_211348 ?auto_211347 ) ( CLEAR ?auto_211350 ) ( ON ?auto_211349 ?auto_211348 ) ( CLEAR ?auto_211349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_211352 ?auto_211346 ?auto_211347 ?auto_211348 )
      ( MAKE-4PILE ?auto_211346 ?auto_211347 ?auto_211348 ?auto_211349 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211355 - BLOCK
      ?auto_211356 - BLOCK
      ?auto_211357 - BLOCK
      ?auto_211358 - BLOCK
    )
    :vars
    (
      ?auto_211359 - BLOCK
      ?auto_211363 - BLOCK
      ?auto_211361 - BLOCK
      ?auto_211362 - BLOCK
      ?auto_211360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211355 ?auto_211356 ) ) ( not ( = ?auto_211355 ?auto_211357 ) ) ( not ( = ?auto_211355 ?auto_211358 ) ) ( not ( = ?auto_211356 ?auto_211357 ) ) ( not ( = ?auto_211356 ?auto_211358 ) ) ( not ( = ?auto_211357 ?auto_211358 ) ) ( not ( = ?auto_211355 ?auto_211359 ) ) ( not ( = ?auto_211356 ?auto_211359 ) ) ( not ( = ?auto_211357 ?auto_211359 ) ) ( not ( = ?auto_211358 ?auto_211359 ) ) ( ON-TABLE ?auto_211363 ) ( ON ?auto_211361 ?auto_211363 ) ( ON ?auto_211362 ?auto_211361 ) ( not ( = ?auto_211363 ?auto_211361 ) ) ( not ( = ?auto_211363 ?auto_211362 ) ) ( not ( = ?auto_211363 ?auto_211359 ) ) ( not ( = ?auto_211363 ?auto_211358 ) ) ( not ( = ?auto_211363 ?auto_211357 ) ) ( not ( = ?auto_211361 ?auto_211362 ) ) ( not ( = ?auto_211361 ?auto_211359 ) ) ( not ( = ?auto_211361 ?auto_211358 ) ) ( not ( = ?auto_211361 ?auto_211357 ) ) ( not ( = ?auto_211362 ?auto_211359 ) ) ( not ( = ?auto_211362 ?auto_211358 ) ) ( not ( = ?auto_211362 ?auto_211357 ) ) ( not ( = ?auto_211355 ?auto_211363 ) ) ( not ( = ?auto_211355 ?auto_211361 ) ) ( not ( = ?auto_211355 ?auto_211362 ) ) ( not ( = ?auto_211356 ?auto_211363 ) ) ( not ( = ?auto_211356 ?auto_211361 ) ) ( not ( = ?auto_211356 ?auto_211362 ) ) ( ON ?auto_211355 ?auto_211360 ) ( not ( = ?auto_211355 ?auto_211360 ) ) ( not ( = ?auto_211356 ?auto_211360 ) ) ( not ( = ?auto_211357 ?auto_211360 ) ) ( not ( = ?auto_211358 ?auto_211360 ) ) ( not ( = ?auto_211359 ?auto_211360 ) ) ( not ( = ?auto_211363 ?auto_211360 ) ) ( not ( = ?auto_211361 ?auto_211360 ) ) ( not ( = ?auto_211362 ?auto_211360 ) ) ( ON ?auto_211356 ?auto_211355 ) ( ON-TABLE ?auto_211360 ) ( ON ?auto_211357 ?auto_211356 ) ( ON ?auto_211358 ?auto_211357 ) ( CLEAR ?auto_211358 ) ( HOLDING ?auto_211359 ) ( CLEAR ?auto_211362 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_211363 ?auto_211361 ?auto_211362 ?auto_211359 )
      ( MAKE-4PILE ?auto_211355 ?auto_211356 ?auto_211357 ?auto_211358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211364 - BLOCK
      ?auto_211365 - BLOCK
      ?auto_211366 - BLOCK
      ?auto_211367 - BLOCK
    )
    :vars
    (
      ?auto_211370 - BLOCK
      ?auto_211368 - BLOCK
      ?auto_211371 - BLOCK
      ?auto_211369 - BLOCK
      ?auto_211372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211364 ?auto_211365 ) ) ( not ( = ?auto_211364 ?auto_211366 ) ) ( not ( = ?auto_211364 ?auto_211367 ) ) ( not ( = ?auto_211365 ?auto_211366 ) ) ( not ( = ?auto_211365 ?auto_211367 ) ) ( not ( = ?auto_211366 ?auto_211367 ) ) ( not ( = ?auto_211364 ?auto_211370 ) ) ( not ( = ?auto_211365 ?auto_211370 ) ) ( not ( = ?auto_211366 ?auto_211370 ) ) ( not ( = ?auto_211367 ?auto_211370 ) ) ( ON-TABLE ?auto_211368 ) ( ON ?auto_211371 ?auto_211368 ) ( ON ?auto_211369 ?auto_211371 ) ( not ( = ?auto_211368 ?auto_211371 ) ) ( not ( = ?auto_211368 ?auto_211369 ) ) ( not ( = ?auto_211368 ?auto_211370 ) ) ( not ( = ?auto_211368 ?auto_211367 ) ) ( not ( = ?auto_211368 ?auto_211366 ) ) ( not ( = ?auto_211371 ?auto_211369 ) ) ( not ( = ?auto_211371 ?auto_211370 ) ) ( not ( = ?auto_211371 ?auto_211367 ) ) ( not ( = ?auto_211371 ?auto_211366 ) ) ( not ( = ?auto_211369 ?auto_211370 ) ) ( not ( = ?auto_211369 ?auto_211367 ) ) ( not ( = ?auto_211369 ?auto_211366 ) ) ( not ( = ?auto_211364 ?auto_211368 ) ) ( not ( = ?auto_211364 ?auto_211371 ) ) ( not ( = ?auto_211364 ?auto_211369 ) ) ( not ( = ?auto_211365 ?auto_211368 ) ) ( not ( = ?auto_211365 ?auto_211371 ) ) ( not ( = ?auto_211365 ?auto_211369 ) ) ( ON ?auto_211364 ?auto_211372 ) ( not ( = ?auto_211364 ?auto_211372 ) ) ( not ( = ?auto_211365 ?auto_211372 ) ) ( not ( = ?auto_211366 ?auto_211372 ) ) ( not ( = ?auto_211367 ?auto_211372 ) ) ( not ( = ?auto_211370 ?auto_211372 ) ) ( not ( = ?auto_211368 ?auto_211372 ) ) ( not ( = ?auto_211371 ?auto_211372 ) ) ( not ( = ?auto_211369 ?auto_211372 ) ) ( ON ?auto_211365 ?auto_211364 ) ( ON-TABLE ?auto_211372 ) ( ON ?auto_211366 ?auto_211365 ) ( ON ?auto_211367 ?auto_211366 ) ( CLEAR ?auto_211369 ) ( ON ?auto_211370 ?auto_211367 ) ( CLEAR ?auto_211370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211372 ?auto_211364 ?auto_211365 ?auto_211366 ?auto_211367 )
      ( MAKE-4PILE ?auto_211364 ?auto_211365 ?auto_211366 ?auto_211367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211373 - BLOCK
      ?auto_211374 - BLOCK
      ?auto_211375 - BLOCK
      ?auto_211376 - BLOCK
    )
    :vars
    (
      ?auto_211378 - BLOCK
      ?auto_211379 - BLOCK
      ?auto_211377 - BLOCK
      ?auto_211380 - BLOCK
      ?auto_211381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211373 ?auto_211374 ) ) ( not ( = ?auto_211373 ?auto_211375 ) ) ( not ( = ?auto_211373 ?auto_211376 ) ) ( not ( = ?auto_211374 ?auto_211375 ) ) ( not ( = ?auto_211374 ?auto_211376 ) ) ( not ( = ?auto_211375 ?auto_211376 ) ) ( not ( = ?auto_211373 ?auto_211378 ) ) ( not ( = ?auto_211374 ?auto_211378 ) ) ( not ( = ?auto_211375 ?auto_211378 ) ) ( not ( = ?auto_211376 ?auto_211378 ) ) ( ON-TABLE ?auto_211379 ) ( ON ?auto_211377 ?auto_211379 ) ( not ( = ?auto_211379 ?auto_211377 ) ) ( not ( = ?auto_211379 ?auto_211380 ) ) ( not ( = ?auto_211379 ?auto_211378 ) ) ( not ( = ?auto_211379 ?auto_211376 ) ) ( not ( = ?auto_211379 ?auto_211375 ) ) ( not ( = ?auto_211377 ?auto_211380 ) ) ( not ( = ?auto_211377 ?auto_211378 ) ) ( not ( = ?auto_211377 ?auto_211376 ) ) ( not ( = ?auto_211377 ?auto_211375 ) ) ( not ( = ?auto_211380 ?auto_211378 ) ) ( not ( = ?auto_211380 ?auto_211376 ) ) ( not ( = ?auto_211380 ?auto_211375 ) ) ( not ( = ?auto_211373 ?auto_211379 ) ) ( not ( = ?auto_211373 ?auto_211377 ) ) ( not ( = ?auto_211373 ?auto_211380 ) ) ( not ( = ?auto_211374 ?auto_211379 ) ) ( not ( = ?auto_211374 ?auto_211377 ) ) ( not ( = ?auto_211374 ?auto_211380 ) ) ( ON ?auto_211373 ?auto_211381 ) ( not ( = ?auto_211373 ?auto_211381 ) ) ( not ( = ?auto_211374 ?auto_211381 ) ) ( not ( = ?auto_211375 ?auto_211381 ) ) ( not ( = ?auto_211376 ?auto_211381 ) ) ( not ( = ?auto_211378 ?auto_211381 ) ) ( not ( = ?auto_211379 ?auto_211381 ) ) ( not ( = ?auto_211377 ?auto_211381 ) ) ( not ( = ?auto_211380 ?auto_211381 ) ) ( ON ?auto_211374 ?auto_211373 ) ( ON-TABLE ?auto_211381 ) ( ON ?auto_211375 ?auto_211374 ) ( ON ?auto_211376 ?auto_211375 ) ( ON ?auto_211378 ?auto_211376 ) ( CLEAR ?auto_211378 ) ( HOLDING ?auto_211380 ) ( CLEAR ?auto_211377 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211379 ?auto_211377 ?auto_211380 )
      ( MAKE-4PILE ?auto_211373 ?auto_211374 ?auto_211375 ?auto_211376 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211382 - BLOCK
      ?auto_211383 - BLOCK
      ?auto_211384 - BLOCK
      ?auto_211385 - BLOCK
    )
    :vars
    (
      ?auto_211390 - BLOCK
      ?auto_211388 - BLOCK
      ?auto_211386 - BLOCK
      ?auto_211387 - BLOCK
      ?auto_211389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211382 ?auto_211383 ) ) ( not ( = ?auto_211382 ?auto_211384 ) ) ( not ( = ?auto_211382 ?auto_211385 ) ) ( not ( = ?auto_211383 ?auto_211384 ) ) ( not ( = ?auto_211383 ?auto_211385 ) ) ( not ( = ?auto_211384 ?auto_211385 ) ) ( not ( = ?auto_211382 ?auto_211390 ) ) ( not ( = ?auto_211383 ?auto_211390 ) ) ( not ( = ?auto_211384 ?auto_211390 ) ) ( not ( = ?auto_211385 ?auto_211390 ) ) ( ON-TABLE ?auto_211388 ) ( ON ?auto_211386 ?auto_211388 ) ( not ( = ?auto_211388 ?auto_211386 ) ) ( not ( = ?auto_211388 ?auto_211387 ) ) ( not ( = ?auto_211388 ?auto_211390 ) ) ( not ( = ?auto_211388 ?auto_211385 ) ) ( not ( = ?auto_211388 ?auto_211384 ) ) ( not ( = ?auto_211386 ?auto_211387 ) ) ( not ( = ?auto_211386 ?auto_211390 ) ) ( not ( = ?auto_211386 ?auto_211385 ) ) ( not ( = ?auto_211386 ?auto_211384 ) ) ( not ( = ?auto_211387 ?auto_211390 ) ) ( not ( = ?auto_211387 ?auto_211385 ) ) ( not ( = ?auto_211387 ?auto_211384 ) ) ( not ( = ?auto_211382 ?auto_211388 ) ) ( not ( = ?auto_211382 ?auto_211386 ) ) ( not ( = ?auto_211382 ?auto_211387 ) ) ( not ( = ?auto_211383 ?auto_211388 ) ) ( not ( = ?auto_211383 ?auto_211386 ) ) ( not ( = ?auto_211383 ?auto_211387 ) ) ( ON ?auto_211382 ?auto_211389 ) ( not ( = ?auto_211382 ?auto_211389 ) ) ( not ( = ?auto_211383 ?auto_211389 ) ) ( not ( = ?auto_211384 ?auto_211389 ) ) ( not ( = ?auto_211385 ?auto_211389 ) ) ( not ( = ?auto_211390 ?auto_211389 ) ) ( not ( = ?auto_211388 ?auto_211389 ) ) ( not ( = ?auto_211386 ?auto_211389 ) ) ( not ( = ?auto_211387 ?auto_211389 ) ) ( ON ?auto_211383 ?auto_211382 ) ( ON-TABLE ?auto_211389 ) ( ON ?auto_211384 ?auto_211383 ) ( ON ?auto_211385 ?auto_211384 ) ( ON ?auto_211390 ?auto_211385 ) ( CLEAR ?auto_211386 ) ( ON ?auto_211387 ?auto_211390 ) ( CLEAR ?auto_211387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211389 ?auto_211382 ?auto_211383 ?auto_211384 ?auto_211385 ?auto_211390 )
      ( MAKE-4PILE ?auto_211382 ?auto_211383 ?auto_211384 ?auto_211385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211391 - BLOCK
      ?auto_211392 - BLOCK
      ?auto_211393 - BLOCK
      ?auto_211394 - BLOCK
    )
    :vars
    (
      ?auto_211399 - BLOCK
      ?auto_211397 - BLOCK
      ?auto_211398 - BLOCK
      ?auto_211395 - BLOCK
      ?auto_211396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211391 ?auto_211392 ) ) ( not ( = ?auto_211391 ?auto_211393 ) ) ( not ( = ?auto_211391 ?auto_211394 ) ) ( not ( = ?auto_211392 ?auto_211393 ) ) ( not ( = ?auto_211392 ?auto_211394 ) ) ( not ( = ?auto_211393 ?auto_211394 ) ) ( not ( = ?auto_211391 ?auto_211399 ) ) ( not ( = ?auto_211392 ?auto_211399 ) ) ( not ( = ?auto_211393 ?auto_211399 ) ) ( not ( = ?auto_211394 ?auto_211399 ) ) ( ON-TABLE ?auto_211397 ) ( not ( = ?auto_211397 ?auto_211398 ) ) ( not ( = ?auto_211397 ?auto_211395 ) ) ( not ( = ?auto_211397 ?auto_211399 ) ) ( not ( = ?auto_211397 ?auto_211394 ) ) ( not ( = ?auto_211397 ?auto_211393 ) ) ( not ( = ?auto_211398 ?auto_211395 ) ) ( not ( = ?auto_211398 ?auto_211399 ) ) ( not ( = ?auto_211398 ?auto_211394 ) ) ( not ( = ?auto_211398 ?auto_211393 ) ) ( not ( = ?auto_211395 ?auto_211399 ) ) ( not ( = ?auto_211395 ?auto_211394 ) ) ( not ( = ?auto_211395 ?auto_211393 ) ) ( not ( = ?auto_211391 ?auto_211397 ) ) ( not ( = ?auto_211391 ?auto_211398 ) ) ( not ( = ?auto_211391 ?auto_211395 ) ) ( not ( = ?auto_211392 ?auto_211397 ) ) ( not ( = ?auto_211392 ?auto_211398 ) ) ( not ( = ?auto_211392 ?auto_211395 ) ) ( ON ?auto_211391 ?auto_211396 ) ( not ( = ?auto_211391 ?auto_211396 ) ) ( not ( = ?auto_211392 ?auto_211396 ) ) ( not ( = ?auto_211393 ?auto_211396 ) ) ( not ( = ?auto_211394 ?auto_211396 ) ) ( not ( = ?auto_211399 ?auto_211396 ) ) ( not ( = ?auto_211397 ?auto_211396 ) ) ( not ( = ?auto_211398 ?auto_211396 ) ) ( not ( = ?auto_211395 ?auto_211396 ) ) ( ON ?auto_211392 ?auto_211391 ) ( ON-TABLE ?auto_211396 ) ( ON ?auto_211393 ?auto_211392 ) ( ON ?auto_211394 ?auto_211393 ) ( ON ?auto_211399 ?auto_211394 ) ( ON ?auto_211395 ?auto_211399 ) ( CLEAR ?auto_211395 ) ( HOLDING ?auto_211398 ) ( CLEAR ?auto_211397 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211397 ?auto_211398 )
      ( MAKE-4PILE ?auto_211391 ?auto_211392 ?auto_211393 ?auto_211394 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211400 - BLOCK
      ?auto_211401 - BLOCK
      ?auto_211402 - BLOCK
      ?auto_211403 - BLOCK
    )
    :vars
    (
      ?auto_211408 - BLOCK
      ?auto_211405 - BLOCK
      ?auto_211406 - BLOCK
      ?auto_211404 - BLOCK
      ?auto_211407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211400 ?auto_211401 ) ) ( not ( = ?auto_211400 ?auto_211402 ) ) ( not ( = ?auto_211400 ?auto_211403 ) ) ( not ( = ?auto_211401 ?auto_211402 ) ) ( not ( = ?auto_211401 ?auto_211403 ) ) ( not ( = ?auto_211402 ?auto_211403 ) ) ( not ( = ?auto_211400 ?auto_211408 ) ) ( not ( = ?auto_211401 ?auto_211408 ) ) ( not ( = ?auto_211402 ?auto_211408 ) ) ( not ( = ?auto_211403 ?auto_211408 ) ) ( ON-TABLE ?auto_211405 ) ( not ( = ?auto_211405 ?auto_211406 ) ) ( not ( = ?auto_211405 ?auto_211404 ) ) ( not ( = ?auto_211405 ?auto_211408 ) ) ( not ( = ?auto_211405 ?auto_211403 ) ) ( not ( = ?auto_211405 ?auto_211402 ) ) ( not ( = ?auto_211406 ?auto_211404 ) ) ( not ( = ?auto_211406 ?auto_211408 ) ) ( not ( = ?auto_211406 ?auto_211403 ) ) ( not ( = ?auto_211406 ?auto_211402 ) ) ( not ( = ?auto_211404 ?auto_211408 ) ) ( not ( = ?auto_211404 ?auto_211403 ) ) ( not ( = ?auto_211404 ?auto_211402 ) ) ( not ( = ?auto_211400 ?auto_211405 ) ) ( not ( = ?auto_211400 ?auto_211406 ) ) ( not ( = ?auto_211400 ?auto_211404 ) ) ( not ( = ?auto_211401 ?auto_211405 ) ) ( not ( = ?auto_211401 ?auto_211406 ) ) ( not ( = ?auto_211401 ?auto_211404 ) ) ( ON ?auto_211400 ?auto_211407 ) ( not ( = ?auto_211400 ?auto_211407 ) ) ( not ( = ?auto_211401 ?auto_211407 ) ) ( not ( = ?auto_211402 ?auto_211407 ) ) ( not ( = ?auto_211403 ?auto_211407 ) ) ( not ( = ?auto_211408 ?auto_211407 ) ) ( not ( = ?auto_211405 ?auto_211407 ) ) ( not ( = ?auto_211406 ?auto_211407 ) ) ( not ( = ?auto_211404 ?auto_211407 ) ) ( ON ?auto_211401 ?auto_211400 ) ( ON-TABLE ?auto_211407 ) ( ON ?auto_211402 ?auto_211401 ) ( ON ?auto_211403 ?auto_211402 ) ( ON ?auto_211408 ?auto_211403 ) ( ON ?auto_211404 ?auto_211408 ) ( CLEAR ?auto_211405 ) ( ON ?auto_211406 ?auto_211404 ) ( CLEAR ?auto_211406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211407 ?auto_211400 ?auto_211401 ?auto_211402 ?auto_211403 ?auto_211408 ?auto_211404 )
      ( MAKE-4PILE ?auto_211400 ?auto_211401 ?auto_211402 ?auto_211403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211409 - BLOCK
      ?auto_211410 - BLOCK
      ?auto_211411 - BLOCK
      ?auto_211412 - BLOCK
    )
    :vars
    (
      ?auto_211415 - BLOCK
      ?auto_211416 - BLOCK
      ?auto_211413 - BLOCK
      ?auto_211414 - BLOCK
      ?auto_211417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211409 ?auto_211410 ) ) ( not ( = ?auto_211409 ?auto_211411 ) ) ( not ( = ?auto_211409 ?auto_211412 ) ) ( not ( = ?auto_211410 ?auto_211411 ) ) ( not ( = ?auto_211410 ?auto_211412 ) ) ( not ( = ?auto_211411 ?auto_211412 ) ) ( not ( = ?auto_211409 ?auto_211415 ) ) ( not ( = ?auto_211410 ?auto_211415 ) ) ( not ( = ?auto_211411 ?auto_211415 ) ) ( not ( = ?auto_211412 ?auto_211415 ) ) ( not ( = ?auto_211416 ?auto_211413 ) ) ( not ( = ?auto_211416 ?auto_211414 ) ) ( not ( = ?auto_211416 ?auto_211415 ) ) ( not ( = ?auto_211416 ?auto_211412 ) ) ( not ( = ?auto_211416 ?auto_211411 ) ) ( not ( = ?auto_211413 ?auto_211414 ) ) ( not ( = ?auto_211413 ?auto_211415 ) ) ( not ( = ?auto_211413 ?auto_211412 ) ) ( not ( = ?auto_211413 ?auto_211411 ) ) ( not ( = ?auto_211414 ?auto_211415 ) ) ( not ( = ?auto_211414 ?auto_211412 ) ) ( not ( = ?auto_211414 ?auto_211411 ) ) ( not ( = ?auto_211409 ?auto_211416 ) ) ( not ( = ?auto_211409 ?auto_211413 ) ) ( not ( = ?auto_211409 ?auto_211414 ) ) ( not ( = ?auto_211410 ?auto_211416 ) ) ( not ( = ?auto_211410 ?auto_211413 ) ) ( not ( = ?auto_211410 ?auto_211414 ) ) ( ON ?auto_211409 ?auto_211417 ) ( not ( = ?auto_211409 ?auto_211417 ) ) ( not ( = ?auto_211410 ?auto_211417 ) ) ( not ( = ?auto_211411 ?auto_211417 ) ) ( not ( = ?auto_211412 ?auto_211417 ) ) ( not ( = ?auto_211415 ?auto_211417 ) ) ( not ( = ?auto_211416 ?auto_211417 ) ) ( not ( = ?auto_211413 ?auto_211417 ) ) ( not ( = ?auto_211414 ?auto_211417 ) ) ( ON ?auto_211410 ?auto_211409 ) ( ON-TABLE ?auto_211417 ) ( ON ?auto_211411 ?auto_211410 ) ( ON ?auto_211412 ?auto_211411 ) ( ON ?auto_211415 ?auto_211412 ) ( ON ?auto_211414 ?auto_211415 ) ( ON ?auto_211413 ?auto_211414 ) ( CLEAR ?auto_211413 ) ( HOLDING ?auto_211416 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_211416 )
      ( MAKE-4PILE ?auto_211409 ?auto_211410 ?auto_211411 ?auto_211412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_211418 - BLOCK
      ?auto_211419 - BLOCK
      ?auto_211420 - BLOCK
      ?auto_211421 - BLOCK
    )
    :vars
    (
      ?auto_211425 - BLOCK
      ?auto_211426 - BLOCK
      ?auto_211424 - BLOCK
      ?auto_211422 - BLOCK
      ?auto_211423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211418 ?auto_211419 ) ) ( not ( = ?auto_211418 ?auto_211420 ) ) ( not ( = ?auto_211418 ?auto_211421 ) ) ( not ( = ?auto_211419 ?auto_211420 ) ) ( not ( = ?auto_211419 ?auto_211421 ) ) ( not ( = ?auto_211420 ?auto_211421 ) ) ( not ( = ?auto_211418 ?auto_211425 ) ) ( not ( = ?auto_211419 ?auto_211425 ) ) ( not ( = ?auto_211420 ?auto_211425 ) ) ( not ( = ?auto_211421 ?auto_211425 ) ) ( not ( = ?auto_211426 ?auto_211424 ) ) ( not ( = ?auto_211426 ?auto_211422 ) ) ( not ( = ?auto_211426 ?auto_211425 ) ) ( not ( = ?auto_211426 ?auto_211421 ) ) ( not ( = ?auto_211426 ?auto_211420 ) ) ( not ( = ?auto_211424 ?auto_211422 ) ) ( not ( = ?auto_211424 ?auto_211425 ) ) ( not ( = ?auto_211424 ?auto_211421 ) ) ( not ( = ?auto_211424 ?auto_211420 ) ) ( not ( = ?auto_211422 ?auto_211425 ) ) ( not ( = ?auto_211422 ?auto_211421 ) ) ( not ( = ?auto_211422 ?auto_211420 ) ) ( not ( = ?auto_211418 ?auto_211426 ) ) ( not ( = ?auto_211418 ?auto_211424 ) ) ( not ( = ?auto_211418 ?auto_211422 ) ) ( not ( = ?auto_211419 ?auto_211426 ) ) ( not ( = ?auto_211419 ?auto_211424 ) ) ( not ( = ?auto_211419 ?auto_211422 ) ) ( ON ?auto_211418 ?auto_211423 ) ( not ( = ?auto_211418 ?auto_211423 ) ) ( not ( = ?auto_211419 ?auto_211423 ) ) ( not ( = ?auto_211420 ?auto_211423 ) ) ( not ( = ?auto_211421 ?auto_211423 ) ) ( not ( = ?auto_211425 ?auto_211423 ) ) ( not ( = ?auto_211426 ?auto_211423 ) ) ( not ( = ?auto_211424 ?auto_211423 ) ) ( not ( = ?auto_211422 ?auto_211423 ) ) ( ON ?auto_211419 ?auto_211418 ) ( ON-TABLE ?auto_211423 ) ( ON ?auto_211420 ?auto_211419 ) ( ON ?auto_211421 ?auto_211420 ) ( ON ?auto_211425 ?auto_211421 ) ( ON ?auto_211422 ?auto_211425 ) ( ON ?auto_211424 ?auto_211422 ) ( ON ?auto_211426 ?auto_211424 ) ( CLEAR ?auto_211426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_211423 ?auto_211418 ?auto_211419 ?auto_211420 ?auto_211421 ?auto_211425 ?auto_211422 ?auto_211424 )
      ( MAKE-4PILE ?auto_211418 ?auto_211419 ?auto_211420 ?auto_211421 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211430 - BLOCK
      ?auto_211431 - BLOCK
      ?auto_211432 - BLOCK
    )
    :vars
    (
      ?auto_211433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211433 ?auto_211432 ) ( CLEAR ?auto_211433 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211430 ) ( ON ?auto_211431 ?auto_211430 ) ( ON ?auto_211432 ?auto_211431 ) ( not ( = ?auto_211430 ?auto_211431 ) ) ( not ( = ?auto_211430 ?auto_211432 ) ) ( not ( = ?auto_211430 ?auto_211433 ) ) ( not ( = ?auto_211431 ?auto_211432 ) ) ( not ( = ?auto_211431 ?auto_211433 ) ) ( not ( = ?auto_211432 ?auto_211433 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_211433 ?auto_211432 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211434 - BLOCK
      ?auto_211435 - BLOCK
      ?auto_211436 - BLOCK
    )
    :vars
    (
      ?auto_211437 - BLOCK
      ?auto_211438 - BLOCK
      ?auto_211439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211437 ?auto_211436 ) ( CLEAR ?auto_211437 ) ( ON-TABLE ?auto_211434 ) ( ON ?auto_211435 ?auto_211434 ) ( ON ?auto_211436 ?auto_211435 ) ( not ( = ?auto_211434 ?auto_211435 ) ) ( not ( = ?auto_211434 ?auto_211436 ) ) ( not ( = ?auto_211434 ?auto_211437 ) ) ( not ( = ?auto_211435 ?auto_211436 ) ) ( not ( = ?auto_211435 ?auto_211437 ) ) ( not ( = ?auto_211436 ?auto_211437 ) ) ( HOLDING ?auto_211438 ) ( CLEAR ?auto_211439 ) ( not ( = ?auto_211434 ?auto_211438 ) ) ( not ( = ?auto_211434 ?auto_211439 ) ) ( not ( = ?auto_211435 ?auto_211438 ) ) ( not ( = ?auto_211435 ?auto_211439 ) ) ( not ( = ?auto_211436 ?auto_211438 ) ) ( not ( = ?auto_211436 ?auto_211439 ) ) ( not ( = ?auto_211437 ?auto_211438 ) ) ( not ( = ?auto_211437 ?auto_211439 ) ) ( not ( = ?auto_211438 ?auto_211439 ) ) )
    :subtasks
    ( ( !STACK ?auto_211438 ?auto_211439 )
      ( MAKE-3PILE ?auto_211434 ?auto_211435 ?auto_211436 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211440 - BLOCK
      ?auto_211441 - BLOCK
      ?auto_211442 - BLOCK
    )
    :vars
    (
      ?auto_211443 - BLOCK
      ?auto_211445 - BLOCK
      ?auto_211444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211443 ?auto_211442 ) ( ON-TABLE ?auto_211440 ) ( ON ?auto_211441 ?auto_211440 ) ( ON ?auto_211442 ?auto_211441 ) ( not ( = ?auto_211440 ?auto_211441 ) ) ( not ( = ?auto_211440 ?auto_211442 ) ) ( not ( = ?auto_211440 ?auto_211443 ) ) ( not ( = ?auto_211441 ?auto_211442 ) ) ( not ( = ?auto_211441 ?auto_211443 ) ) ( not ( = ?auto_211442 ?auto_211443 ) ) ( CLEAR ?auto_211445 ) ( not ( = ?auto_211440 ?auto_211444 ) ) ( not ( = ?auto_211440 ?auto_211445 ) ) ( not ( = ?auto_211441 ?auto_211444 ) ) ( not ( = ?auto_211441 ?auto_211445 ) ) ( not ( = ?auto_211442 ?auto_211444 ) ) ( not ( = ?auto_211442 ?auto_211445 ) ) ( not ( = ?auto_211443 ?auto_211444 ) ) ( not ( = ?auto_211443 ?auto_211445 ) ) ( not ( = ?auto_211444 ?auto_211445 ) ) ( ON ?auto_211444 ?auto_211443 ) ( CLEAR ?auto_211444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_211440 ?auto_211441 ?auto_211442 ?auto_211443 )
      ( MAKE-3PILE ?auto_211440 ?auto_211441 ?auto_211442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211446 - BLOCK
      ?auto_211447 - BLOCK
      ?auto_211448 - BLOCK
    )
    :vars
    (
      ?auto_211451 - BLOCK
      ?auto_211449 - BLOCK
      ?auto_211450 - BLOCK
      ?auto_211452 - BLOCK
      ?auto_211453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211451 ?auto_211448 ) ( ON-TABLE ?auto_211446 ) ( ON ?auto_211447 ?auto_211446 ) ( ON ?auto_211448 ?auto_211447 ) ( not ( = ?auto_211446 ?auto_211447 ) ) ( not ( = ?auto_211446 ?auto_211448 ) ) ( not ( = ?auto_211446 ?auto_211451 ) ) ( not ( = ?auto_211447 ?auto_211448 ) ) ( not ( = ?auto_211447 ?auto_211451 ) ) ( not ( = ?auto_211448 ?auto_211451 ) ) ( not ( = ?auto_211446 ?auto_211449 ) ) ( not ( = ?auto_211446 ?auto_211450 ) ) ( not ( = ?auto_211447 ?auto_211449 ) ) ( not ( = ?auto_211447 ?auto_211450 ) ) ( not ( = ?auto_211448 ?auto_211449 ) ) ( not ( = ?auto_211448 ?auto_211450 ) ) ( not ( = ?auto_211451 ?auto_211449 ) ) ( not ( = ?auto_211451 ?auto_211450 ) ) ( not ( = ?auto_211449 ?auto_211450 ) ) ( ON ?auto_211449 ?auto_211451 ) ( CLEAR ?auto_211449 ) ( HOLDING ?auto_211450 ) ( CLEAR ?auto_211452 ) ( ON-TABLE ?auto_211453 ) ( ON ?auto_211452 ?auto_211453 ) ( not ( = ?auto_211453 ?auto_211452 ) ) ( not ( = ?auto_211453 ?auto_211450 ) ) ( not ( = ?auto_211452 ?auto_211450 ) ) ( not ( = ?auto_211446 ?auto_211452 ) ) ( not ( = ?auto_211446 ?auto_211453 ) ) ( not ( = ?auto_211447 ?auto_211452 ) ) ( not ( = ?auto_211447 ?auto_211453 ) ) ( not ( = ?auto_211448 ?auto_211452 ) ) ( not ( = ?auto_211448 ?auto_211453 ) ) ( not ( = ?auto_211451 ?auto_211452 ) ) ( not ( = ?auto_211451 ?auto_211453 ) ) ( not ( = ?auto_211449 ?auto_211452 ) ) ( not ( = ?auto_211449 ?auto_211453 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211453 ?auto_211452 ?auto_211450 )
      ( MAKE-3PILE ?auto_211446 ?auto_211447 ?auto_211448 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211454 - BLOCK
      ?auto_211455 - BLOCK
      ?auto_211456 - BLOCK
    )
    :vars
    (
      ?auto_211457 - BLOCK
      ?auto_211461 - BLOCK
      ?auto_211458 - BLOCK
      ?auto_211459 - BLOCK
      ?auto_211460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211457 ?auto_211456 ) ( ON-TABLE ?auto_211454 ) ( ON ?auto_211455 ?auto_211454 ) ( ON ?auto_211456 ?auto_211455 ) ( not ( = ?auto_211454 ?auto_211455 ) ) ( not ( = ?auto_211454 ?auto_211456 ) ) ( not ( = ?auto_211454 ?auto_211457 ) ) ( not ( = ?auto_211455 ?auto_211456 ) ) ( not ( = ?auto_211455 ?auto_211457 ) ) ( not ( = ?auto_211456 ?auto_211457 ) ) ( not ( = ?auto_211454 ?auto_211461 ) ) ( not ( = ?auto_211454 ?auto_211458 ) ) ( not ( = ?auto_211455 ?auto_211461 ) ) ( not ( = ?auto_211455 ?auto_211458 ) ) ( not ( = ?auto_211456 ?auto_211461 ) ) ( not ( = ?auto_211456 ?auto_211458 ) ) ( not ( = ?auto_211457 ?auto_211461 ) ) ( not ( = ?auto_211457 ?auto_211458 ) ) ( not ( = ?auto_211461 ?auto_211458 ) ) ( ON ?auto_211461 ?auto_211457 ) ( CLEAR ?auto_211459 ) ( ON-TABLE ?auto_211460 ) ( ON ?auto_211459 ?auto_211460 ) ( not ( = ?auto_211460 ?auto_211459 ) ) ( not ( = ?auto_211460 ?auto_211458 ) ) ( not ( = ?auto_211459 ?auto_211458 ) ) ( not ( = ?auto_211454 ?auto_211459 ) ) ( not ( = ?auto_211454 ?auto_211460 ) ) ( not ( = ?auto_211455 ?auto_211459 ) ) ( not ( = ?auto_211455 ?auto_211460 ) ) ( not ( = ?auto_211456 ?auto_211459 ) ) ( not ( = ?auto_211456 ?auto_211460 ) ) ( not ( = ?auto_211457 ?auto_211459 ) ) ( not ( = ?auto_211457 ?auto_211460 ) ) ( not ( = ?auto_211461 ?auto_211459 ) ) ( not ( = ?auto_211461 ?auto_211460 ) ) ( ON ?auto_211458 ?auto_211461 ) ( CLEAR ?auto_211458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211454 ?auto_211455 ?auto_211456 ?auto_211457 ?auto_211461 )
      ( MAKE-3PILE ?auto_211454 ?auto_211455 ?auto_211456 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211462 - BLOCK
      ?auto_211463 - BLOCK
      ?auto_211464 - BLOCK
    )
    :vars
    (
      ?auto_211468 - BLOCK
      ?auto_211469 - BLOCK
      ?auto_211467 - BLOCK
      ?auto_211465 - BLOCK
      ?auto_211466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211468 ?auto_211464 ) ( ON-TABLE ?auto_211462 ) ( ON ?auto_211463 ?auto_211462 ) ( ON ?auto_211464 ?auto_211463 ) ( not ( = ?auto_211462 ?auto_211463 ) ) ( not ( = ?auto_211462 ?auto_211464 ) ) ( not ( = ?auto_211462 ?auto_211468 ) ) ( not ( = ?auto_211463 ?auto_211464 ) ) ( not ( = ?auto_211463 ?auto_211468 ) ) ( not ( = ?auto_211464 ?auto_211468 ) ) ( not ( = ?auto_211462 ?auto_211469 ) ) ( not ( = ?auto_211462 ?auto_211467 ) ) ( not ( = ?auto_211463 ?auto_211469 ) ) ( not ( = ?auto_211463 ?auto_211467 ) ) ( not ( = ?auto_211464 ?auto_211469 ) ) ( not ( = ?auto_211464 ?auto_211467 ) ) ( not ( = ?auto_211468 ?auto_211469 ) ) ( not ( = ?auto_211468 ?auto_211467 ) ) ( not ( = ?auto_211469 ?auto_211467 ) ) ( ON ?auto_211469 ?auto_211468 ) ( ON-TABLE ?auto_211465 ) ( not ( = ?auto_211465 ?auto_211466 ) ) ( not ( = ?auto_211465 ?auto_211467 ) ) ( not ( = ?auto_211466 ?auto_211467 ) ) ( not ( = ?auto_211462 ?auto_211466 ) ) ( not ( = ?auto_211462 ?auto_211465 ) ) ( not ( = ?auto_211463 ?auto_211466 ) ) ( not ( = ?auto_211463 ?auto_211465 ) ) ( not ( = ?auto_211464 ?auto_211466 ) ) ( not ( = ?auto_211464 ?auto_211465 ) ) ( not ( = ?auto_211468 ?auto_211466 ) ) ( not ( = ?auto_211468 ?auto_211465 ) ) ( not ( = ?auto_211469 ?auto_211466 ) ) ( not ( = ?auto_211469 ?auto_211465 ) ) ( ON ?auto_211467 ?auto_211469 ) ( CLEAR ?auto_211467 ) ( HOLDING ?auto_211466 ) ( CLEAR ?auto_211465 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211465 ?auto_211466 )
      ( MAKE-3PILE ?auto_211462 ?auto_211463 ?auto_211464 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211470 - BLOCK
      ?auto_211471 - BLOCK
      ?auto_211472 - BLOCK
    )
    :vars
    (
      ?auto_211477 - BLOCK
      ?auto_211476 - BLOCK
      ?auto_211473 - BLOCK
      ?auto_211474 - BLOCK
      ?auto_211475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211477 ?auto_211472 ) ( ON-TABLE ?auto_211470 ) ( ON ?auto_211471 ?auto_211470 ) ( ON ?auto_211472 ?auto_211471 ) ( not ( = ?auto_211470 ?auto_211471 ) ) ( not ( = ?auto_211470 ?auto_211472 ) ) ( not ( = ?auto_211470 ?auto_211477 ) ) ( not ( = ?auto_211471 ?auto_211472 ) ) ( not ( = ?auto_211471 ?auto_211477 ) ) ( not ( = ?auto_211472 ?auto_211477 ) ) ( not ( = ?auto_211470 ?auto_211476 ) ) ( not ( = ?auto_211470 ?auto_211473 ) ) ( not ( = ?auto_211471 ?auto_211476 ) ) ( not ( = ?auto_211471 ?auto_211473 ) ) ( not ( = ?auto_211472 ?auto_211476 ) ) ( not ( = ?auto_211472 ?auto_211473 ) ) ( not ( = ?auto_211477 ?auto_211476 ) ) ( not ( = ?auto_211477 ?auto_211473 ) ) ( not ( = ?auto_211476 ?auto_211473 ) ) ( ON ?auto_211476 ?auto_211477 ) ( ON-TABLE ?auto_211474 ) ( not ( = ?auto_211474 ?auto_211475 ) ) ( not ( = ?auto_211474 ?auto_211473 ) ) ( not ( = ?auto_211475 ?auto_211473 ) ) ( not ( = ?auto_211470 ?auto_211475 ) ) ( not ( = ?auto_211470 ?auto_211474 ) ) ( not ( = ?auto_211471 ?auto_211475 ) ) ( not ( = ?auto_211471 ?auto_211474 ) ) ( not ( = ?auto_211472 ?auto_211475 ) ) ( not ( = ?auto_211472 ?auto_211474 ) ) ( not ( = ?auto_211477 ?auto_211475 ) ) ( not ( = ?auto_211477 ?auto_211474 ) ) ( not ( = ?auto_211476 ?auto_211475 ) ) ( not ( = ?auto_211476 ?auto_211474 ) ) ( ON ?auto_211473 ?auto_211476 ) ( CLEAR ?auto_211474 ) ( ON ?auto_211475 ?auto_211473 ) ( CLEAR ?auto_211475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211470 ?auto_211471 ?auto_211472 ?auto_211477 ?auto_211476 ?auto_211473 )
      ( MAKE-3PILE ?auto_211470 ?auto_211471 ?auto_211472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211478 - BLOCK
      ?auto_211479 - BLOCK
      ?auto_211480 - BLOCK
    )
    :vars
    (
      ?auto_211481 - BLOCK
      ?auto_211482 - BLOCK
      ?auto_211485 - BLOCK
      ?auto_211483 - BLOCK
      ?auto_211484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211481 ?auto_211480 ) ( ON-TABLE ?auto_211478 ) ( ON ?auto_211479 ?auto_211478 ) ( ON ?auto_211480 ?auto_211479 ) ( not ( = ?auto_211478 ?auto_211479 ) ) ( not ( = ?auto_211478 ?auto_211480 ) ) ( not ( = ?auto_211478 ?auto_211481 ) ) ( not ( = ?auto_211479 ?auto_211480 ) ) ( not ( = ?auto_211479 ?auto_211481 ) ) ( not ( = ?auto_211480 ?auto_211481 ) ) ( not ( = ?auto_211478 ?auto_211482 ) ) ( not ( = ?auto_211478 ?auto_211485 ) ) ( not ( = ?auto_211479 ?auto_211482 ) ) ( not ( = ?auto_211479 ?auto_211485 ) ) ( not ( = ?auto_211480 ?auto_211482 ) ) ( not ( = ?auto_211480 ?auto_211485 ) ) ( not ( = ?auto_211481 ?auto_211482 ) ) ( not ( = ?auto_211481 ?auto_211485 ) ) ( not ( = ?auto_211482 ?auto_211485 ) ) ( ON ?auto_211482 ?auto_211481 ) ( not ( = ?auto_211483 ?auto_211484 ) ) ( not ( = ?auto_211483 ?auto_211485 ) ) ( not ( = ?auto_211484 ?auto_211485 ) ) ( not ( = ?auto_211478 ?auto_211484 ) ) ( not ( = ?auto_211478 ?auto_211483 ) ) ( not ( = ?auto_211479 ?auto_211484 ) ) ( not ( = ?auto_211479 ?auto_211483 ) ) ( not ( = ?auto_211480 ?auto_211484 ) ) ( not ( = ?auto_211480 ?auto_211483 ) ) ( not ( = ?auto_211481 ?auto_211484 ) ) ( not ( = ?auto_211481 ?auto_211483 ) ) ( not ( = ?auto_211482 ?auto_211484 ) ) ( not ( = ?auto_211482 ?auto_211483 ) ) ( ON ?auto_211485 ?auto_211482 ) ( ON ?auto_211484 ?auto_211485 ) ( CLEAR ?auto_211484 ) ( HOLDING ?auto_211483 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_211483 )
      ( MAKE-3PILE ?auto_211478 ?auto_211479 ?auto_211480 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211486 - BLOCK
      ?auto_211487 - BLOCK
      ?auto_211488 - BLOCK
    )
    :vars
    (
      ?auto_211489 - BLOCK
      ?auto_211492 - BLOCK
      ?auto_211493 - BLOCK
      ?auto_211490 - BLOCK
      ?auto_211491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211489 ?auto_211488 ) ( ON-TABLE ?auto_211486 ) ( ON ?auto_211487 ?auto_211486 ) ( ON ?auto_211488 ?auto_211487 ) ( not ( = ?auto_211486 ?auto_211487 ) ) ( not ( = ?auto_211486 ?auto_211488 ) ) ( not ( = ?auto_211486 ?auto_211489 ) ) ( not ( = ?auto_211487 ?auto_211488 ) ) ( not ( = ?auto_211487 ?auto_211489 ) ) ( not ( = ?auto_211488 ?auto_211489 ) ) ( not ( = ?auto_211486 ?auto_211492 ) ) ( not ( = ?auto_211486 ?auto_211493 ) ) ( not ( = ?auto_211487 ?auto_211492 ) ) ( not ( = ?auto_211487 ?auto_211493 ) ) ( not ( = ?auto_211488 ?auto_211492 ) ) ( not ( = ?auto_211488 ?auto_211493 ) ) ( not ( = ?auto_211489 ?auto_211492 ) ) ( not ( = ?auto_211489 ?auto_211493 ) ) ( not ( = ?auto_211492 ?auto_211493 ) ) ( ON ?auto_211492 ?auto_211489 ) ( not ( = ?auto_211490 ?auto_211491 ) ) ( not ( = ?auto_211490 ?auto_211493 ) ) ( not ( = ?auto_211491 ?auto_211493 ) ) ( not ( = ?auto_211486 ?auto_211491 ) ) ( not ( = ?auto_211486 ?auto_211490 ) ) ( not ( = ?auto_211487 ?auto_211491 ) ) ( not ( = ?auto_211487 ?auto_211490 ) ) ( not ( = ?auto_211488 ?auto_211491 ) ) ( not ( = ?auto_211488 ?auto_211490 ) ) ( not ( = ?auto_211489 ?auto_211491 ) ) ( not ( = ?auto_211489 ?auto_211490 ) ) ( not ( = ?auto_211492 ?auto_211491 ) ) ( not ( = ?auto_211492 ?auto_211490 ) ) ( ON ?auto_211493 ?auto_211492 ) ( ON ?auto_211491 ?auto_211493 ) ( ON ?auto_211490 ?auto_211491 ) ( CLEAR ?auto_211490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211486 ?auto_211487 ?auto_211488 ?auto_211489 ?auto_211492 ?auto_211493 ?auto_211491 )
      ( MAKE-3PILE ?auto_211486 ?auto_211487 ?auto_211488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211494 - BLOCK
      ?auto_211495 - BLOCK
      ?auto_211496 - BLOCK
    )
    :vars
    (
      ?auto_211501 - BLOCK
      ?auto_211500 - BLOCK
      ?auto_211499 - BLOCK
      ?auto_211497 - BLOCK
      ?auto_211498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211501 ?auto_211496 ) ( ON-TABLE ?auto_211494 ) ( ON ?auto_211495 ?auto_211494 ) ( ON ?auto_211496 ?auto_211495 ) ( not ( = ?auto_211494 ?auto_211495 ) ) ( not ( = ?auto_211494 ?auto_211496 ) ) ( not ( = ?auto_211494 ?auto_211501 ) ) ( not ( = ?auto_211495 ?auto_211496 ) ) ( not ( = ?auto_211495 ?auto_211501 ) ) ( not ( = ?auto_211496 ?auto_211501 ) ) ( not ( = ?auto_211494 ?auto_211500 ) ) ( not ( = ?auto_211494 ?auto_211499 ) ) ( not ( = ?auto_211495 ?auto_211500 ) ) ( not ( = ?auto_211495 ?auto_211499 ) ) ( not ( = ?auto_211496 ?auto_211500 ) ) ( not ( = ?auto_211496 ?auto_211499 ) ) ( not ( = ?auto_211501 ?auto_211500 ) ) ( not ( = ?auto_211501 ?auto_211499 ) ) ( not ( = ?auto_211500 ?auto_211499 ) ) ( ON ?auto_211500 ?auto_211501 ) ( not ( = ?auto_211497 ?auto_211498 ) ) ( not ( = ?auto_211497 ?auto_211499 ) ) ( not ( = ?auto_211498 ?auto_211499 ) ) ( not ( = ?auto_211494 ?auto_211498 ) ) ( not ( = ?auto_211494 ?auto_211497 ) ) ( not ( = ?auto_211495 ?auto_211498 ) ) ( not ( = ?auto_211495 ?auto_211497 ) ) ( not ( = ?auto_211496 ?auto_211498 ) ) ( not ( = ?auto_211496 ?auto_211497 ) ) ( not ( = ?auto_211501 ?auto_211498 ) ) ( not ( = ?auto_211501 ?auto_211497 ) ) ( not ( = ?auto_211500 ?auto_211498 ) ) ( not ( = ?auto_211500 ?auto_211497 ) ) ( ON ?auto_211499 ?auto_211500 ) ( ON ?auto_211498 ?auto_211499 ) ( HOLDING ?auto_211497 ) ( CLEAR ?auto_211498 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_211494 ?auto_211495 ?auto_211496 ?auto_211501 ?auto_211500 ?auto_211499 ?auto_211498 ?auto_211497 )
      ( MAKE-3PILE ?auto_211494 ?auto_211495 ?auto_211496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211502 - BLOCK
      ?auto_211503 - BLOCK
      ?auto_211504 - BLOCK
    )
    :vars
    (
      ?auto_211507 - BLOCK
      ?auto_211508 - BLOCK
      ?auto_211506 - BLOCK
      ?auto_211505 - BLOCK
      ?auto_211509 - BLOCK
      ?auto_211510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211507 ?auto_211504 ) ( ON-TABLE ?auto_211502 ) ( ON ?auto_211503 ?auto_211502 ) ( ON ?auto_211504 ?auto_211503 ) ( not ( = ?auto_211502 ?auto_211503 ) ) ( not ( = ?auto_211502 ?auto_211504 ) ) ( not ( = ?auto_211502 ?auto_211507 ) ) ( not ( = ?auto_211503 ?auto_211504 ) ) ( not ( = ?auto_211503 ?auto_211507 ) ) ( not ( = ?auto_211504 ?auto_211507 ) ) ( not ( = ?auto_211502 ?auto_211508 ) ) ( not ( = ?auto_211502 ?auto_211506 ) ) ( not ( = ?auto_211503 ?auto_211508 ) ) ( not ( = ?auto_211503 ?auto_211506 ) ) ( not ( = ?auto_211504 ?auto_211508 ) ) ( not ( = ?auto_211504 ?auto_211506 ) ) ( not ( = ?auto_211507 ?auto_211508 ) ) ( not ( = ?auto_211507 ?auto_211506 ) ) ( not ( = ?auto_211508 ?auto_211506 ) ) ( ON ?auto_211508 ?auto_211507 ) ( not ( = ?auto_211505 ?auto_211509 ) ) ( not ( = ?auto_211505 ?auto_211506 ) ) ( not ( = ?auto_211509 ?auto_211506 ) ) ( not ( = ?auto_211502 ?auto_211509 ) ) ( not ( = ?auto_211502 ?auto_211505 ) ) ( not ( = ?auto_211503 ?auto_211509 ) ) ( not ( = ?auto_211503 ?auto_211505 ) ) ( not ( = ?auto_211504 ?auto_211509 ) ) ( not ( = ?auto_211504 ?auto_211505 ) ) ( not ( = ?auto_211507 ?auto_211509 ) ) ( not ( = ?auto_211507 ?auto_211505 ) ) ( not ( = ?auto_211508 ?auto_211509 ) ) ( not ( = ?auto_211508 ?auto_211505 ) ) ( ON ?auto_211506 ?auto_211508 ) ( ON ?auto_211509 ?auto_211506 ) ( CLEAR ?auto_211509 ) ( ON ?auto_211505 ?auto_211510 ) ( CLEAR ?auto_211505 ) ( HAND-EMPTY ) ( not ( = ?auto_211502 ?auto_211510 ) ) ( not ( = ?auto_211503 ?auto_211510 ) ) ( not ( = ?auto_211504 ?auto_211510 ) ) ( not ( = ?auto_211507 ?auto_211510 ) ) ( not ( = ?auto_211508 ?auto_211510 ) ) ( not ( = ?auto_211506 ?auto_211510 ) ) ( not ( = ?auto_211505 ?auto_211510 ) ) ( not ( = ?auto_211509 ?auto_211510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_211505 ?auto_211510 )
      ( MAKE-3PILE ?auto_211502 ?auto_211503 ?auto_211504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211511 - BLOCK
      ?auto_211512 - BLOCK
      ?auto_211513 - BLOCK
    )
    :vars
    (
      ?auto_211517 - BLOCK
      ?auto_211515 - BLOCK
      ?auto_211518 - BLOCK
      ?auto_211514 - BLOCK
      ?auto_211519 - BLOCK
      ?auto_211516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211517 ?auto_211513 ) ( ON-TABLE ?auto_211511 ) ( ON ?auto_211512 ?auto_211511 ) ( ON ?auto_211513 ?auto_211512 ) ( not ( = ?auto_211511 ?auto_211512 ) ) ( not ( = ?auto_211511 ?auto_211513 ) ) ( not ( = ?auto_211511 ?auto_211517 ) ) ( not ( = ?auto_211512 ?auto_211513 ) ) ( not ( = ?auto_211512 ?auto_211517 ) ) ( not ( = ?auto_211513 ?auto_211517 ) ) ( not ( = ?auto_211511 ?auto_211515 ) ) ( not ( = ?auto_211511 ?auto_211518 ) ) ( not ( = ?auto_211512 ?auto_211515 ) ) ( not ( = ?auto_211512 ?auto_211518 ) ) ( not ( = ?auto_211513 ?auto_211515 ) ) ( not ( = ?auto_211513 ?auto_211518 ) ) ( not ( = ?auto_211517 ?auto_211515 ) ) ( not ( = ?auto_211517 ?auto_211518 ) ) ( not ( = ?auto_211515 ?auto_211518 ) ) ( ON ?auto_211515 ?auto_211517 ) ( not ( = ?auto_211514 ?auto_211519 ) ) ( not ( = ?auto_211514 ?auto_211518 ) ) ( not ( = ?auto_211519 ?auto_211518 ) ) ( not ( = ?auto_211511 ?auto_211519 ) ) ( not ( = ?auto_211511 ?auto_211514 ) ) ( not ( = ?auto_211512 ?auto_211519 ) ) ( not ( = ?auto_211512 ?auto_211514 ) ) ( not ( = ?auto_211513 ?auto_211519 ) ) ( not ( = ?auto_211513 ?auto_211514 ) ) ( not ( = ?auto_211517 ?auto_211519 ) ) ( not ( = ?auto_211517 ?auto_211514 ) ) ( not ( = ?auto_211515 ?auto_211519 ) ) ( not ( = ?auto_211515 ?auto_211514 ) ) ( ON ?auto_211518 ?auto_211515 ) ( ON ?auto_211514 ?auto_211516 ) ( CLEAR ?auto_211514 ) ( not ( = ?auto_211511 ?auto_211516 ) ) ( not ( = ?auto_211512 ?auto_211516 ) ) ( not ( = ?auto_211513 ?auto_211516 ) ) ( not ( = ?auto_211517 ?auto_211516 ) ) ( not ( = ?auto_211515 ?auto_211516 ) ) ( not ( = ?auto_211518 ?auto_211516 ) ) ( not ( = ?auto_211514 ?auto_211516 ) ) ( not ( = ?auto_211519 ?auto_211516 ) ) ( HOLDING ?auto_211519 ) ( CLEAR ?auto_211518 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211511 ?auto_211512 ?auto_211513 ?auto_211517 ?auto_211515 ?auto_211518 ?auto_211519 )
      ( MAKE-3PILE ?auto_211511 ?auto_211512 ?auto_211513 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211520 - BLOCK
      ?auto_211521 - BLOCK
      ?auto_211522 - BLOCK
    )
    :vars
    (
      ?auto_211526 - BLOCK
      ?auto_211525 - BLOCK
      ?auto_211528 - BLOCK
      ?auto_211527 - BLOCK
      ?auto_211523 - BLOCK
      ?auto_211524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211526 ?auto_211522 ) ( ON-TABLE ?auto_211520 ) ( ON ?auto_211521 ?auto_211520 ) ( ON ?auto_211522 ?auto_211521 ) ( not ( = ?auto_211520 ?auto_211521 ) ) ( not ( = ?auto_211520 ?auto_211522 ) ) ( not ( = ?auto_211520 ?auto_211526 ) ) ( not ( = ?auto_211521 ?auto_211522 ) ) ( not ( = ?auto_211521 ?auto_211526 ) ) ( not ( = ?auto_211522 ?auto_211526 ) ) ( not ( = ?auto_211520 ?auto_211525 ) ) ( not ( = ?auto_211520 ?auto_211528 ) ) ( not ( = ?auto_211521 ?auto_211525 ) ) ( not ( = ?auto_211521 ?auto_211528 ) ) ( not ( = ?auto_211522 ?auto_211525 ) ) ( not ( = ?auto_211522 ?auto_211528 ) ) ( not ( = ?auto_211526 ?auto_211525 ) ) ( not ( = ?auto_211526 ?auto_211528 ) ) ( not ( = ?auto_211525 ?auto_211528 ) ) ( ON ?auto_211525 ?auto_211526 ) ( not ( = ?auto_211527 ?auto_211523 ) ) ( not ( = ?auto_211527 ?auto_211528 ) ) ( not ( = ?auto_211523 ?auto_211528 ) ) ( not ( = ?auto_211520 ?auto_211523 ) ) ( not ( = ?auto_211520 ?auto_211527 ) ) ( not ( = ?auto_211521 ?auto_211523 ) ) ( not ( = ?auto_211521 ?auto_211527 ) ) ( not ( = ?auto_211522 ?auto_211523 ) ) ( not ( = ?auto_211522 ?auto_211527 ) ) ( not ( = ?auto_211526 ?auto_211523 ) ) ( not ( = ?auto_211526 ?auto_211527 ) ) ( not ( = ?auto_211525 ?auto_211523 ) ) ( not ( = ?auto_211525 ?auto_211527 ) ) ( ON ?auto_211528 ?auto_211525 ) ( ON ?auto_211527 ?auto_211524 ) ( not ( = ?auto_211520 ?auto_211524 ) ) ( not ( = ?auto_211521 ?auto_211524 ) ) ( not ( = ?auto_211522 ?auto_211524 ) ) ( not ( = ?auto_211526 ?auto_211524 ) ) ( not ( = ?auto_211525 ?auto_211524 ) ) ( not ( = ?auto_211528 ?auto_211524 ) ) ( not ( = ?auto_211527 ?auto_211524 ) ) ( not ( = ?auto_211523 ?auto_211524 ) ) ( CLEAR ?auto_211528 ) ( ON ?auto_211523 ?auto_211527 ) ( CLEAR ?auto_211523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211524 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211524 ?auto_211527 )
      ( MAKE-3PILE ?auto_211520 ?auto_211521 ?auto_211522 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211529 - BLOCK
      ?auto_211530 - BLOCK
      ?auto_211531 - BLOCK
    )
    :vars
    (
      ?auto_211533 - BLOCK
      ?auto_211536 - BLOCK
      ?auto_211532 - BLOCK
      ?auto_211537 - BLOCK
      ?auto_211534 - BLOCK
      ?auto_211535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211533 ?auto_211531 ) ( ON-TABLE ?auto_211529 ) ( ON ?auto_211530 ?auto_211529 ) ( ON ?auto_211531 ?auto_211530 ) ( not ( = ?auto_211529 ?auto_211530 ) ) ( not ( = ?auto_211529 ?auto_211531 ) ) ( not ( = ?auto_211529 ?auto_211533 ) ) ( not ( = ?auto_211530 ?auto_211531 ) ) ( not ( = ?auto_211530 ?auto_211533 ) ) ( not ( = ?auto_211531 ?auto_211533 ) ) ( not ( = ?auto_211529 ?auto_211536 ) ) ( not ( = ?auto_211529 ?auto_211532 ) ) ( not ( = ?auto_211530 ?auto_211536 ) ) ( not ( = ?auto_211530 ?auto_211532 ) ) ( not ( = ?auto_211531 ?auto_211536 ) ) ( not ( = ?auto_211531 ?auto_211532 ) ) ( not ( = ?auto_211533 ?auto_211536 ) ) ( not ( = ?auto_211533 ?auto_211532 ) ) ( not ( = ?auto_211536 ?auto_211532 ) ) ( ON ?auto_211536 ?auto_211533 ) ( not ( = ?auto_211537 ?auto_211534 ) ) ( not ( = ?auto_211537 ?auto_211532 ) ) ( not ( = ?auto_211534 ?auto_211532 ) ) ( not ( = ?auto_211529 ?auto_211534 ) ) ( not ( = ?auto_211529 ?auto_211537 ) ) ( not ( = ?auto_211530 ?auto_211534 ) ) ( not ( = ?auto_211530 ?auto_211537 ) ) ( not ( = ?auto_211531 ?auto_211534 ) ) ( not ( = ?auto_211531 ?auto_211537 ) ) ( not ( = ?auto_211533 ?auto_211534 ) ) ( not ( = ?auto_211533 ?auto_211537 ) ) ( not ( = ?auto_211536 ?auto_211534 ) ) ( not ( = ?auto_211536 ?auto_211537 ) ) ( ON ?auto_211537 ?auto_211535 ) ( not ( = ?auto_211529 ?auto_211535 ) ) ( not ( = ?auto_211530 ?auto_211535 ) ) ( not ( = ?auto_211531 ?auto_211535 ) ) ( not ( = ?auto_211533 ?auto_211535 ) ) ( not ( = ?auto_211536 ?auto_211535 ) ) ( not ( = ?auto_211532 ?auto_211535 ) ) ( not ( = ?auto_211537 ?auto_211535 ) ) ( not ( = ?auto_211534 ?auto_211535 ) ) ( ON ?auto_211534 ?auto_211537 ) ( CLEAR ?auto_211534 ) ( ON-TABLE ?auto_211535 ) ( HOLDING ?auto_211532 ) ( CLEAR ?auto_211536 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211529 ?auto_211530 ?auto_211531 ?auto_211533 ?auto_211536 ?auto_211532 )
      ( MAKE-3PILE ?auto_211529 ?auto_211530 ?auto_211531 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211538 - BLOCK
      ?auto_211539 - BLOCK
      ?auto_211540 - BLOCK
    )
    :vars
    (
      ?auto_211541 - BLOCK
      ?auto_211545 - BLOCK
      ?auto_211544 - BLOCK
      ?auto_211546 - BLOCK
      ?auto_211543 - BLOCK
      ?auto_211542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211541 ?auto_211540 ) ( ON-TABLE ?auto_211538 ) ( ON ?auto_211539 ?auto_211538 ) ( ON ?auto_211540 ?auto_211539 ) ( not ( = ?auto_211538 ?auto_211539 ) ) ( not ( = ?auto_211538 ?auto_211540 ) ) ( not ( = ?auto_211538 ?auto_211541 ) ) ( not ( = ?auto_211539 ?auto_211540 ) ) ( not ( = ?auto_211539 ?auto_211541 ) ) ( not ( = ?auto_211540 ?auto_211541 ) ) ( not ( = ?auto_211538 ?auto_211545 ) ) ( not ( = ?auto_211538 ?auto_211544 ) ) ( not ( = ?auto_211539 ?auto_211545 ) ) ( not ( = ?auto_211539 ?auto_211544 ) ) ( not ( = ?auto_211540 ?auto_211545 ) ) ( not ( = ?auto_211540 ?auto_211544 ) ) ( not ( = ?auto_211541 ?auto_211545 ) ) ( not ( = ?auto_211541 ?auto_211544 ) ) ( not ( = ?auto_211545 ?auto_211544 ) ) ( ON ?auto_211545 ?auto_211541 ) ( not ( = ?auto_211546 ?auto_211543 ) ) ( not ( = ?auto_211546 ?auto_211544 ) ) ( not ( = ?auto_211543 ?auto_211544 ) ) ( not ( = ?auto_211538 ?auto_211543 ) ) ( not ( = ?auto_211538 ?auto_211546 ) ) ( not ( = ?auto_211539 ?auto_211543 ) ) ( not ( = ?auto_211539 ?auto_211546 ) ) ( not ( = ?auto_211540 ?auto_211543 ) ) ( not ( = ?auto_211540 ?auto_211546 ) ) ( not ( = ?auto_211541 ?auto_211543 ) ) ( not ( = ?auto_211541 ?auto_211546 ) ) ( not ( = ?auto_211545 ?auto_211543 ) ) ( not ( = ?auto_211545 ?auto_211546 ) ) ( ON ?auto_211546 ?auto_211542 ) ( not ( = ?auto_211538 ?auto_211542 ) ) ( not ( = ?auto_211539 ?auto_211542 ) ) ( not ( = ?auto_211540 ?auto_211542 ) ) ( not ( = ?auto_211541 ?auto_211542 ) ) ( not ( = ?auto_211545 ?auto_211542 ) ) ( not ( = ?auto_211544 ?auto_211542 ) ) ( not ( = ?auto_211546 ?auto_211542 ) ) ( not ( = ?auto_211543 ?auto_211542 ) ) ( ON ?auto_211543 ?auto_211546 ) ( ON-TABLE ?auto_211542 ) ( CLEAR ?auto_211545 ) ( ON ?auto_211544 ?auto_211543 ) ( CLEAR ?auto_211544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211542 ?auto_211546 ?auto_211543 )
      ( MAKE-3PILE ?auto_211538 ?auto_211539 ?auto_211540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211547 - BLOCK
      ?auto_211548 - BLOCK
      ?auto_211549 - BLOCK
    )
    :vars
    (
      ?auto_211551 - BLOCK
      ?auto_211554 - BLOCK
      ?auto_211550 - BLOCK
      ?auto_211555 - BLOCK
      ?auto_211552 - BLOCK
      ?auto_211553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211551 ?auto_211549 ) ( ON-TABLE ?auto_211547 ) ( ON ?auto_211548 ?auto_211547 ) ( ON ?auto_211549 ?auto_211548 ) ( not ( = ?auto_211547 ?auto_211548 ) ) ( not ( = ?auto_211547 ?auto_211549 ) ) ( not ( = ?auto_211547 ?auto_211551 ) ) ( not ( = ?auto_211548 ?auto_211549 ) ) ( not ( = ?auto_211548 ?auto_211551 ) ) ( not ( = ?auto_211549 ?auto_211551 ) ) ( not ( = ?auto_211547 ?auto_211554 ) ) ( not ( = ?auto_211547 ?auto_211550 ) ) ( not ( = ?auto_211548 ?auto_211554 ) ) ( not ( = ?auto_211548 ?auto_211550 ) ) ( not ( = ?auto_211549 ?auto_211554 ) ) ( not ( = ?auto_211549 ?auto_211550 ) ) ( not ( = ?auto_211551 ?auto_211554 ) ) ( not ( = ?auto_211551 ?auto_211550 ) ) ( not ( = ?auto_211554 ?auto_211550 ) ) ( not ( = ?auto_211555 ?auto_211552 ) ) ( not ( = ?auto_211555 ?auto_211550 ) ) ( not ( = ?auto_211552 ?auto_211550 ) ) ( not ( = ?auto_211547 ?auto_211552 ) ) ( not ( = ?auto_211547 ?auto_211555 ) ) ( not ( = ?auto_211548 ?auto_211552 ) ) ( not ( = ?auto_211548 ?auto_211555 ) ) ( not ( = ?auto_211549 ?auto_211552 ) ) ( not ( = ?auto_211549 ?auto_211555 ) ) ( not ( = ?auto_211551 ?auto_211552 ) ) ( not ( = ?auto_211551 ?auto_211555 ) ) ( not ( = ?auto_211554 ?auto_211552 ) ) ( not ( = ?auto_211554 ?auto_211555 ) ) ( ON ?auto_211555 ?auto_211553 ) ( not ( = ?auto_211547 ?auto_211553 ) ) ( not ( = ?auto_211548 ?auto_211553 ) ) ( not ( = ?auto_211549 ?auto_211553 ) ) ( not ( = ?auto_211551 ?auto_211553 ) ) ( not ( = ?auto_211554 ?auto_211553 ) ) ( not ( = ?auto_211550 ?auto_211553 ) ) ( not ( = ?auto_211555 ?auto_211553 ) ) ( not ( = ?auto_211552 ?auto_211553 ) ) ( ON ?auto_211552 ?auto_211555 ) ( ON-TABLE ?auto_211553 ) ( ON ?auto_211550 ?auto_211552 ) ( CLEAR ?auto_211550 ) ( HOLDING ?auto_211554 ) ( CLEAR ?auto_211551 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211547 ?auto_211548 ?auto_211549 ?auto_211551 ?auto_211554 )
      ( MAKE-3PILE ?auto_211547 ?auto_211548 ?auto_211549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211556 - BLOCK
      ?auto_211557 - BLOCK
      ?auto_211558 - BLOCK
    )
    :vars
    (
      ?auto_211563 - BLOCK
      ?auto_211561 - BLOCK
      ?auto_211562 - BLOCK
      ?auto_211559 - BLOCK
      ?auto_211564 - BLOCK
      ?auto_211560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211563 ?auto_211558 ) ( ON-TABLE ?auto_211556 ) ( ON ?auto_211557 ?auto_211556 ) ( ON ?auto_211558 ?auto_211557 ) ( not ( = ?auto_211556 ?auto_211557 ) ) ( not ( = ?auto_211556 ?auto_211558 ) ) ( not ( = ?auto_211556 ?auto_211563 ) ) ( not ( = ?auto_211557 ?auto_211558 ) ) ( not ( = ?auto_211557 ?auto_211563 ) ) ( not ( = ?auto_211558 ?auto_211563 ) ) ( not ( = ?auto_211556 ?auto_211561 ) ) ( not ( = ?auto_211556 ?auto_211562 ) ) ( not ( = ?auto_211557 ?auto_211561 ) ) ( not ( = ?auto_211557 ?auto_211562 ) ) ( not ( = ?auto_211558 ?auto_211561 ) ) ( not ( = ?auto_211558 ?auto_211562 ) ) ( not ( = ?auto_211563 ?auto_211561 ) ) ( not ( = ?auto_211563 ?auto_211562 ) ) ( not ( = ?auto_211561 ?auto_211562 ) ) ( not ( = ?auto_211559 ?auto_211564 ) ) ( not ( = ?auto_211559 ?auto_211562 ) ) ( not ( = ?auto_211564 ?auto_211562 ) ) ( not ( = ?auto_211556 ?auto_211564 ) ) ( not ( = ?auto_211556 ?auto_211559 ) ) ( not ( = ?auto_211557 ?auto_211564 ) ) ( not ( = ?auto_211557 ?auto_211559 ) ) ( not ( = ?auto_211558 ?auto_211564 ) ) ( not ( = ?auto_211558 ?auto_211559 ) ) ( not ( = ?auto_211563 ?auto_211564 ) ) ( not ( = ?auto_211563 ?auto_211559 ) ) ( not ( = ?auto_211561 ?auto_211564 ) ) ( not ( = ?auto_211561 ?auto_211559 ) ) ( ON ?auto_211559 ?auto_211560 ) ( not ( = ?auto_211556 ?auto_211560 ) ) ( not ( = ?auto_211557 ?auto_211560 ) ) ( not ( = ?auto_211558 ?auto_211560 ) ) ( not ( = ?auto_211563 ?auto_211560 ) ) ( not ( = ?auto_211561 ?auto_211560 ) ) ( not ( = ?auto_211562 ?auto_211560 ) ) ( not ( = ?auto_211559 ?auto_211560 ) ) ( not ( = ?auto_211564 ?auto_211560 ) ) ( ON ?auto_211564 ?auto_211559 ) ( ON-TABLE ?auto_211560 ) ( ON ?auto_211562 ?auto_211564 ) ( CLEAR ?auto_211563 ) ( ON ?auto_211561 ?auto_211562 ) ( CLEAR ?auto_211561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_211560 ?auto_211559 ?auto_211564 ?auto_211562 )
      ( MAKE-3PILE ?auto_211556 ?auto_211557 ?auto_211558 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211583 - BLOCK
      ?auto_211584 - BLOCK
      ?auto_211585 - BLOCK
    )
    :vars
    (
      ?auto_211587 - BLOCK
      ?auto_211591 - BLOCK
      ?auto_211588 - BLOCK
      ?auto_211590 - BLOCK
      ?auto_211586 - BLOCK
      ?auto_211589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211583 ) ( ON ?auto_211584 ?auto_211583 ) ( not ( = ?auto_211583 ?auto_211584 ) ) ( not ( = ?auto_211583 ?auto_211585 ) ) ( not ( = ?auto_211583 ?auto_211587 ) ) ( not ( = ?auto_211584 ?auto_211585 ) ) ( not ( = ?auto_211584 ?auto_211587 ) ) ( not ( = ?auto_211585 ?auto_211587 ) ) ( not ( = ?auto_211583 ?auto_211591 ) ) ( not ( = ?auto_211583 ?auto_211588 ) ) ( not ( = ?auto_211584 ?auto_211591 ) ) ( not ( = ?auto_211584 ?auto_211588 ) ) ( not ( = ?auto_211585 ?auto_211591 ) ) ( not ( = ?auto_211585 ?auto_211588 ) ) ( not ( = ?auto_211587 ?auto_211591 ) ) ( not ( = ?auto_211587 ?auto_211588 ) ) ( not ( = ?auto_211591 ?auto_211588 ) ) ( not ( = ?auto_211590 ?auto_211586 ) ) ( not ( = ?auto_211590 ?auto_211588 ) ) ( not ( = ?auto_211586 ?auto_211588 ) ) ( not ( = ?auto_211583 ?auto_211586 ) ) ( not ( = ?auto_211583 ?auto_211590 ) ) ( not ( = ?auto_211584 ?auto_211586 ) ) ( not ( = ?auto_211584 ?auto_211590 ) ) ( not ( = ?auto_211585 ?auto_211586 ) ) ( not ( = ?auto_211585 ?auto_211590 ) ) ( not ( = ?auto_211587 ?auto_211586 ) ) ( not ( = ?auto_211587 ?auto_211590 ) ) ( not ( = ?auto_211591 ?auto_211586 ) ) ( not ( = ?auto_211591 ?auto_211590 ) ) ( ON ?auto_211590 ?auto_211589 ) ( not ( = ?auto_211583 ?auto_211589 ) ) ( not ( = ?auto_211584 ?auto_211589 ) ) ( not ( = ?auto_211585 ?auto_211589 ) ) ( not ( = ?auto_211587 ?auto_211589 ) ) ( not ( = ?auto_211591 ?auto_211589 ) ) ( not ( = ?auto_211588 ?auto_211589 ) ) ( not ( = ?auto_211590 ?auto_211589 ) ) ( not ( = ?auto_211586 ?auto_211589 ) ) ( ON ?auto_211586 ?auto_211590 ) ( ON-TABLE ?auto_211589 ) ( ON ?auto_211588 ?auto_211586 ) ( ON ?auto_211591 ?auto_211588 ) ( ON ?auto_211587 ?auto_211591 ) ( CLEAR ?auto_211587 ) ( HOLDING ?auto_211585 ) ( CLEAR ?auto_211584 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_211583 ?auto_211584 ?auto_211585 ?auto_211587 )
      ( MAKE-3PILE ?auto_211583 ?auto_211584 ?auto_211585 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211592 - BLOCK
      ?auto_211593 - BLOCK
      ?auto_211594 - BLOCK
    )
    :vars
    (
      ?auto_211598 - BLOCK
      ?auto_211599 - BLOCK
      ?auto_211595 - BLOCK
      ?auto_211597 - BLOCK
      ?auto_211596 - BLOCK
      ?auto_211600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211592 ) ( ON ?auto_211593 ?auto_211592 ) ( not ( = ?auto_211592 ?auto_211593 ) ) ( not ( = ?auto_211592 ?auto_211594 ) ) ( not ( = ?auto_211592 ?auto_211598 ) ) ( not ( = ?auto_211593 ?auto_211594 ) ) ( not ( = ?auto_211593 ?auto_211598 ) ) ( not ( = ?auto_211594 ?auto_211598 ) ) ( not ( = ?auto_211592 ?auto_211599 ) ) ( not ( = ?auto_211592 ?auto_211595 ) ) ( not ( = ?auto_211593 ?auto_211599 ) ) ( not ( = ?auto_211593 ?auto_211595 ) ) ( not ( = ?auto_211594 ?auto_211599 ) ) ( not ( = ?auto_211594 ?auto_211595 ) ) ( not ( = ?auto_211598 ?auto_211599 ) ) ( not ( = ?auto_211598 ?auto_211595 ) ) ( not ( = ?auto_211599 ?auto_211595 ) ) ( not ( = ?auto_211597 ?auto_211596 ) ) ( not ( = ?auto_211597 ?auto_211595 ) ) ( not ( = ?auto_211596 ?auto_211595 ) ) ( not ( = ?auto_211592 ?auto_211596 ) ) ( not ( = ?auto_211592 ?auto_211597 ) ) ( not ( = ?auto_211593 ?auto_211596 ) ) ( not ( = ?auto_211593 ?auto_211597 ) ) ( not ( = ?auto_211594 ?auto_211596 ) ) ( not ( = ?auto_211594 ?auto_211597 ) ) ( not ( = ?auto_211598 ?auto_211596 ) ) ( not ( = ?auto_211598 ?auto_211597 ) ) ( not ( = ?auto_211599 ?auto_211596 ) ) ( not ( = ?auto_211599 ?auto_211597 ) ) ( ON ?auto_211597 ?auto_211600 ) ( not ( = ?auto_211592 ?auto_211600 ) ) ( not ( = ?auto_211593 ?auto_211600 ) ) ( not ( = ?auto_211594 ?auto_211600 ) ) ( not ( = ?auto_211598 ?auto_211600 ) ) ( not ( = ?auto_211599 ?auto_211600 ) ) ( not ( = ?auto_211595 ?auto_211600 ) ) ( not ( = ?auto_211597 ?auto_211600 ) ) ( not ( = ?auto_211596 ?auto_211600 ) ) ( ON ?auto_211596 ?auto_211597 ) ( ON-TABLE ?auto_211600 ) ( ON ?auto_211595 ?auto_211596 ) ( ON ?auto_211599 ?auto_211595 ) ( ON ?auto_211598 ?auto_211599 ) ( CLEAR ?auto_211593 ) ( ON ?auto_211594 ?auto_211598 ) ( CLEAR ?auto_211594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211600 ?auto_211597 ?auto_211596 ?auto_211595 ?auto_211599 ?auto_211598 )
      ( MAKE-3PILE ?auto_211592 ?auto_211593 ?auto_211594 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211601 - BLOCK
      ?auto_211602 - BLOCK
      ?auto_211603 - BLOCK
    )
    :vars
    (
      ?auto_211607 - BLOCK
      ?auto_211605 - BLOCK
      ?auto_211604 - BLOCK
      ?auto_211608 - BLOCK
      ?auto_211609 - BLOCK
      ?auto_211606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211601 ) ( not ( = ?auto_211601 ?auto_211602 ) ) ( not ( = ?auto_211601 ?auto_211603 ) ) ( not ( = ?auto_211601 ?auto_211607 ) ) ( not ( = ?auto_211602 ?auto_211603 ) ) ( not ( = ?auto_211602 ?auto_211607 ) ) ( not ( = ?auto_211603 ?auto_211607 ) ) ( not ( = ?auto_211601 ?auto_211605 ) ) ( not ( = ?auto_211601 ?auto_211604 ) ) ( not ( = ?auto_211602 ?auto_211605 ) ) ( not ( = ?auto_211602 ?auto_211604 ) ) ( not ( = ?auto_211603 ?auto_211605 ) ) ( not ( = ?auto_211603 ?auto_211604 ) ) ( not ( = ?auto_211607 ?auto_211605 ) ) ( not ( = ?auto_211607 ?auto_211604 ) ) ( not ( = ?auto_211605 ?auto_211604 ) ) ( not ( = ?auto_211608 ?auto_211609 ) ) ( not ( = ?auto_211608 ?auto_211604 ) ) ( not ( = ?auto_211609 ?auto_211604 ) ) ( not ( = ?auto_211601 ?auto_211609 ) ) ( not ( = ?auto_211601 ?auto_211608 ) ) ( not ( = ?auto_211602 ?auto_211609 ) ) ( not ( = ?auto_211602 ?auto_211608 ) ) ( not ( = ?auto_211603 ?auto_211609 ) ) ( not ( = ?auto_211603 ?auto_211608 ) ) ( not ( = ?auto_211607 ?auto_211609 ) ) ( not ( = ?auto_211607 ?auto_211608 ) ) ( not ( = ?auto_211605 ?auto_211609 ) ) ( not ( = ?auto_211605 ?auto_211608 ) ) ( ON ?auto_211608 ?auto_211606 ) ( not ( = ?auto_211601 ?auto_211606 ) ) ( not ( = ?auto_211602 ?auto_211606 ) ) ( not ( = ?auto_211603 ?auto_211606 ) ) ( not ( = ?auto_211607 ?auto_211606 ) ) ( not ( = ?auto_211605 ?auto_211606 ) ) ( not ( = ?auto_211604 ?auto_211606 ) ) ( not ( = ?auto_211608 ?auto_211606 ) ) ( not ( = ?auto_211609 ?auto_211606 ) ) ( ON ?auto_211609 ?auto_211608 ) ( ON-TABLE ?auto_211606 ) ( ON ?auto_211604 ?auto_211609 ) ( ON ?auto_211605 ?auto_211604 ) ( ON ?auto_211607 ?auto_211605 ) ( ON ?auto_211603 ?auto_211607 ) ( CLEAR ?auto_211603 ) ( HOLDING ?auto_211602 ) ( CLEAR ?auto_211601 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211601 ?auto_211602 )
      ( MAKE-3PILE ?auto_211601 ?auto_211602 ?auto_211603 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211610 - BLOCK
      ?auto_211611 - BLOCK
      ?auto_211612 - BLOCK
    )
    :vars
    (
      ?auto_211613 - BLOCK
      ?auto_211614 - BLOCK
      ?auto_211615 - BLOCK
      ?auto_211616 - BLOCK
      ?auto_211617 - BLOCK
      ?auto_211618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211610 ) ( not ( = ?auto_211610 ?auto_211611 ) ) ( not ( = ?auto_211610 ?auto_211612 ) ) ( not ( = ?auto_211610 ?auto_211613 ) ) ( not ( = ?auto_211611 ?auto_211612 ) ) ( not ( = ?auto_211611 ?auto_211613 ) ) ( not ( = ?auto_211612 ?auto_211613 ) ) ( not ( = ?auto_211610 ?auto_211614 ) ) ( not ( = ?auto_211610 ?auto_211615 ) ) ( not ( = ?auto_211611 ?auto_211614 ) ) ( not ( = ?auto_211611 ?auto_211615 ) ) ( not ( = ?auto_211612 ?auto_211614 ) ) ( not ( = ?auto_211612 ?auto_211615 ) ) ( not ( = ?auto_211613 ?auto_211614 ) ) ( not ( = ?auto_211613 ?auto_211615 ) ) ( not ( = ?auto_211614 ?auto_211615 ) ) ( not ( = ?auto_211616 ?auto_211617 ) ) ( not ( = ?auto_211616 ?auto_211615 ) ) ( not ( = ?auto_211617 ?auto_211615 ) ) ( not ( = ?auto_211610 ?auto_211617 ) ) ( not ( = ?auto_211610 ?auto_211616 ) ) ( not ( = ?auto_211611 ?auto_211617 ) ) ( not ( = ?auto_211611 ?auto_211616 ) ) ( not ( = ?auto_211612 ?auto_211617 ) ) ( not ( = ?auto_211612 ?auto_211616 ) ) ( not ( = ?auto_211613 ?auto_211617 ) ) ( not ( = ?auto_211613 ?auto_211616 ) ) ( not ( = ?auto_211614 ?auto_211617 ) ) ( not ( = ?auto_211614 ?auto_211616 ) ) ( ON ?auto_211616 ?auto_211618 ) ( not ( = ?auto_211610 ?auto_211618 ) ) ( not ( = ?auto_211611 ?auto_211618 ) ) ( not ( = ?auto_211612 ?auto_211618 ) ) ( not ( = ?auto_211613 ?auto_211618 ) ) ( not ( = ?auto_211614 ?auto_211618 ) ) ( not ( = ?auto_211615 ?auto_211618 ) ) ( not ( = ?auto_211616 ?auto_211618 ) ) ( not ( = ?auto_211617 ?auto_211618 ) ) ( ON ?auto_211617 ?auto_211616 ) ( ON-TABLE ?auto_211618 ) ( ON ?auto_211615 ?auto_211617 ) ( ON ?auto_211614 ?auto_211615 ) ( ON ?auto_211613 ?auto_211614 ) ( ON ?auto_211612 ?auto_211613 ) ( CLEAR ?auto_211610 ) ( ON ?auto_211611 ?auto_211612 ) ( CLEAR ?auto_211611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211618 ?auto_211616 ?auto_211617 ?auto_211615 ?auto_211614 ?auto_211613 ?auto_211612 )
      ( MAKE-3PILE ?auto_211610 ?auto_211611 ?auto_211612 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211619 - BLOCK
      ?auto_211620 - BLOCK
      ?auto_211621 - BLOCK
    )
    :vars
    (
      ?auto_211623 - BLOCK
      ?auto_211625 - BLOCK
      ?auto_211622 - BLOCK
      ?auto_211627 - BLOCK
      ?auto_211626 - BLOCK
      ?auto_211624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211619 ?auto_211620 ) ) ( not ( = ?auto_211619 ?auto_211621 ) ) ( not ( = ?auto_211619 ?auto_211623 ) ) ( not ( = ?auto_211620 ?auto_211621 ) ) ( not ( = ?auto_211620 ?auto_211623 ) ) ( not ( = ?auto_211621 ?auto_211623 ) ) ( not ( = ?auto_211619 ?auto_211625 ) ) ( not ( = ?auto_211619 ?auto_211622 ) ) ( not ( = ?auto_211620 ?auto_211625 ) ) ( not ( = ?auto_211620 ?auto_211622 ) ) ( not ( = ?auto_211621 ?auto_211625 ) ) ( not ( = ?auto_211621 ?auto_211622 ) ) ( not ( = ?auto_211623 ?auto_211625 ) ) ( not ( = ?auto_211623 ?auto_211622 ) ) ( not ( = ?auto_211625 ?auto_211622 ) ) ( not ( = ?auto_211627 ?auto_211626 ) ) ( not ( = ?auto_211627 ?auto_211622 ) ) ( not ( = ?auto_211626 ?auto_211622 ) ) ( not ( = ?auto_211619 ?auto_211626 ) ) ( not ( = ?auto_211619 ?auto_211627 ) ) ( not ( = ?auto_211620 ?auto_211626 ) ) ( not ( = ?auto_211620 ?auto_211627 ) ) ( not ( = ?auto_211621 ?auto_211626 ) ) ( not ( = ?auto_211621 ?auto_211627 ) ) ( not ( = ?auto_211623 ?auto_211626 ) ) ( not ( = ?auto_211623 ?auto_211627 ) ) ( not ( = ?auto_211625 ?auto_211626 ) ) ( not ( = ?auto_211625 ?auto_211627 ) ) ( ON ?auto_211627 ?auto_211624 ) ( not ( = ?auto_211619 ?auto_211624 ) ) ( not ( = ?auto_211620 ?auto_211624 ) ) ( not ( = ?auto_211621 ?auto_211624 ) ) ( not ( = ?auto_211623 ?auto_211624 ) ) ( not ( = ?auto_211625 ?auto_211624 ) ) ( not ( = ?auto_211622 ?auto_211624 ) ) ( not ( = ?auto_211627 ?auto_211624 ) ) ( not ( = ?auto_211626 ?auto_211624 ) ) ( ON ?auto_211626 ?auto_211627 ) ( ON-TABLE ?auto_211624 ) ( ON ?auto_211622 ?auto_211626 ) ( ON ?auto_211625 ?auto_211622 ) ( ON ?auto_211623 ?auto_211625 ) ( ON ?auto_211621 ?auto_211623 ) ( ON ?auto_211620 ?auto_211621 ) ( CLEAR ?auto_211620 ) ( HOLDING ?auto_211619 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_211619 )
      ( MAKE-3PILE ?auto_211619 ?auto_211620 ?auto_211621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_211628 - BLOCK
      ?auto_211629 - BLOCK
      ?auto_211630 - BLOCK
    )
    :vars
    (
      ?auto_211633 - BLOCK
      ?auto_211632 - BLOCK
      ?auto_211631 - BLOCK
      ?auto_211636 - BLOCK
      ?auto_211635 - BLOCK
      ?auto_211634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211628 ?auto_211629 ) ) ( not ( = ?auto_211628 ?auto_211630 ) ) ( not ( = ?auto_211628 ?auto_211633 ) ) ( not ( = ?auto_211629 ?auto_211630 ) ) ( not ( = ?auto_211629 ?auto_211633 ) ) ( not ( = ?auto_211630 ?auto_211633 ) ) ( not ( = ?auto_211628 ?auto_211632 ) ) ( not ( = ?auto_211628 ?auto_211631 ) ) ( not ( = ?auto_211629 ?auto_211632 ) ) ( not ( = ?auto_211629 ?auto_211631 ) ) ( not ( = ?auto_211630 ?auto_211632 ) ) ( not ( = ?auto_211630 ?auto_211631 ) ) ( not ( = ?auto_211633 ?auto_211632 ) ) ( not ( = ?auto_211633 ?auto_211631 ) ) ( not ( = ?auto_211632 ?auto_211631 ) ) ( not ( = ?auto_211636 ?auto_211635 ) ) ( not ( = ?auto_211636 ?auto_211631 ) ) ( not ( = ?auto_211635 ?auto_211631 ) ) ( not ( = ?auto_211628 ?auto_211635 ) ) ( not ( = ?auto_211628 ?auto_211636 ) ) ( not ( = ?auto_211629 ?auto_211635 ) ) ( not ( = ?auto_211629 ?auto_211636 ) ) ( not ( = ?auto_211630 ?auto_211635 ) ) ( not ( = ?auto_211630 ?auto_211636 ) ) ( not ( = ?auto_211633 ?auto_211635 ) ) ( not ( = ?auto_211633 ?auto_211636 ) ) ( not ( = ?auto_211632 ?auto_211635 ) ) ( not ( = ?auto_211632 ?auto_211636 ) ) ( ON ?auto_211636 ?auto_211634 ) ( not ( = ?auto_211628 ?auto_211634 ) ) ( not ( = ?auto_211629 ?auto_211634 ) ) ( not ( = ?auto_211630 ?auto_211634 ) ) ( not ( = ?auto_211633 ?auto_211634 ) ) ( not ( = ?auto_211632 ?auto_211634 ) ) ( not ( = ?auto_211631 ?auto_211634 ) ) ( not ( = ?auto_211636 ?auto_211634 ) ) ( not ( = ?auto_211635 ?auto_211634 ) ) ( ON ?auto_211635 ?auto_211636 ) ( ON-TABLE ?auto_211634 ) ( ON ?auto_211631 ?auto_211635 ) ( ON ?auto_211632 ?auto_211631 ) ( ON ?auto_211633 ?auto_211632 ) ( ON ?auto_211630 ?auto_211633 ) ( ON ?auto_211629 ?auto_211630 ) ( ON ?auto_211628 ?auto_211629 ) ( CLEAR ?auto_211628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_211634 ?auto_211636 ?auto_211635 ?auto_211631 ?auto_211632 ?auto_211633 ?auto_211630 ?auto_211629 )
      ( MAKE-3PILE ?auto_211628 ?auto_211629 ?auto_211630 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211642 - BLOCK
      ?auto_211643 - BLOCK
      ?auto_211644 - BLOCK
      ?auto_211645 - BLOCK
      ?auto_211646 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_211646 ) ( CLEAR ?auto_211645 ) ( ON-TABLE ?auto_211642 ) ( ON ?auto_211643 ?auto_211642 ) ( ON ?auto_211644 ?auto_211643 ) ( ON ?auto_211645 ?auto_211644 ) ( not ( = ?auto_211642 ?auto_211643 ) ) ( not ( = ?auto_211642 ?auto_211644 ) ) ( not ( = ?auto_211642 ?auto_211645 ) ) ( not ( = ?auto_211642 ?auto_211646 ) ) ( not ( = ?auto_211643 ?auto_211644 ) ) ( not ( = ?auto_211643 ?auto_211645 ) ) ( not ( = ?auto_211643 ?auto_211646 ) ) ( not ( = ?auto_211644 ?auto_211645 ) ) ( not ( = ?auto_211644 ?auto_211646 ) ) ( not ( = ?auto_211645 ?auto_211646 ) ) )
    :subtasks
    ( ( !STACK ?auto_211646 ?auto_211645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211647 - BLOCK
      ?auto_211648 - BLOCK
      ?auto_211649 - BLOCK
      ?auto_211650 - BLOCK
      ?auto_211651 - BLOCK
    )
    :vars
    (
      ?auto_211652 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_211650 ) ( ON-TABLE ?auto_211647 ) ( ON ?auto_211648 ?auto_211647 ) ( ON ?auto_211649 ?auto_211648 ) ( ON ?auto_211650 ?auto_211649 ) ( not ( = ?auto_211647 ?auto_211648 ) ) ( not ( = ?auto_211647 ?auto_211649 ) ) ( not ( = ?auto_211647 ?auto_211650 ) ) ( not ( = ?auto_211647 ?auto_211651 ) ) ( not ( = ?auto_211648 ?auto_211649 ) ) ( not ( = ?auto_211648 ?auto_211650 ) ) ( not ( = ?auto_211648 ?auto_211651 ) ) ( not ( = ?auto_211649 ?auto_211650 ) ) ( not ( = ?auto_211649 ?auto_211651 ) ) ( not ( = ?auto_211650 ?auto_211651 ) ) ( ON ?auto_211651 ?auto_211652 ) ( CLEAR ?auto_211651 ) ( HAND-EMPTY ) ( not ( = ?auto_211647 ?auto_211652 ) ) ( not ( = ?auto_211648 ?auto_211652 ) ) ( not ( = ?auto_211649 ?auto_211652 ) ) ( not ( = ?auto_211650 ?auto_211652 ) ) ( not ( = ?auto_211651 ?auto_211652 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_211651 ?auto_211652 )
      ( MAKE-5PILE ?auto_211647 ?auto_211648 ?auto_211649 ?auto_211650 ?auto_211651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211653 - BLOCK
      ?auto_211654 - BLOCK
      ?auto_211655 - BLOCK
      ?auto_211656 - BLOCK
      ?auto_211657 - BLOCK
    )
    :vars
    (
      ?auto_211658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211653 ) ( ON ?auto_211654 ?auto_211653 ) ( ON ?auto_211655 ?auto_211654 ) ( not ( = ?auto_211653 ?auto_211654 ) ) ( not ( = ?auto_211653 ?auto_211655 ) ) ( not ( = ?auto_211653 ?auto_211656 ) ) ( not ( = ?auto_211653 ?auto_211657 ) ) ( not ( = ?auto_211654 ?auto_211655 ) ) ( not ( = ?auto_211654 ?auto_211656 ) ) ( not ( = ?auto_211654 ?auto_211657 ) ) ( not ( = ?auto_211655 ?auto_211656 ) ) ( not ( = ?auto_211655 ?auto_211657 ) ) ( not ( = ?auto_211656 ?auto_211657 ) ) ( ON ?auto_211657 ?auto_211658 ) ( CLEAR ?auto_211657 ) ( not ( = ?auto_211653 ?auto_211658 ) ) ( not ( = ?auto_211654 ?auto_211658 ) ) ( not ( = ?auto_211655 ?auto_211658 ) ) ( not ( = ?auto_211656 ?auto_211658 ) ) ( not ( = ?auto_211657 ?auto_211658 ) ) ( HOLDING ?auto_211656 ) ( CLEAR ?auto_211655 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_211653 ?auto_211654 ?auto_211655 ?auto_211656 )
      ( MAKE-5PILE ?auto_211653 ?auto_211654 ?auto_211655 ?auto_211656 ?auto_211657 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211659 - BLOCK
      ?auto_211660 - BLOCK
      ?auto_211661 - BLOCK
      ?auto_211662 - BLOCK
      ?auto_211663 - BLOCK
    )
    :vars
    (
      ?auto_211664 - BLOCK
      ?auto_211666 - BLOCK
      ?auto_211665 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211659 ) ( ON ?auto_211660 ?auto_211659 ) ( ON ?auto_211661 ?auto_211660 ) ( not ( = ?auto_211659 ?auto_211660 ) ) ( not ( = ?auto_211659 ?auto_211661 ) ) ( not ( = ?auto_211659 ?auto_211662 ) ) ( not ( = ?auto_211659 ?auto_211663 ) ) ( not ( = ?auto_211660 ?auto_211661 ) ) ( not ( = ?auto_211660 ?auto_211662 ) ) ( not ( = ?auto_211660 ?auto_211663 ) ) ( not ( = ?auto_211661 ?auto_211662 ) ) ( not ( = ?auto_211661 ?auto_211663 ) ) ( not ( = ?auto_211662 ?auto_211663 ) ) ( ON ?auto_211663 ?auto_211664 ) ( not ( = ?auto_211659 ?auto_211664 ) ) ( not ( = ?auto_211660 ?auto_211664 ) ) ( not ( = ?auto_211661 ?auto_211664 ) ) ( not ( = ?auto_211662 ?auto_211664 ) ) ( not ( = ?auto_211663 ?auto_211664 ) ) ( CLEAR ?auto_211661 ) ( ON ?auto_211662 ?auto_211663 ) ( CLEAR ?auto_211662 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211666 ) ( ON ?auto_211665 ?auto_211666 ) ( ON ?auto_211664 ?auto_211665 ) ( not ( = ?auto_211666 ?auto_211665 ) ) ( not ( = ?auto_211666 ?auto_211664 ) ) ( not ( = ?auto_211666 ?auto_211663 ) ) ( not ( = ?auto_211666 ?auto_211662 ) ) ( not ( = ?auto_211665 ?auto_211664 ) ) ( not ( = ?auto_211665 ?auto_211663 ) ) ( not ( = ?auto_211665 ?auto_211662 ) ) ( not ( = ?auto_211659 ?auto_211666 ) ) ( not ( = ?auto_211659 ?auto_211665 ) ) ( not ( = ?auto_211660 ?auto_211666 ) ) ( not ( = ?auto_211660 ?auto_211665 ) ) ( not ( = ?auto_211661 ?auto_211666 ) ) ( not ( = ?auto_211661 ?auto_211665 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_211666 ?auto_211665 ?auto_211664 ?auto_211663 )
      ( MAKE-5PILE ?auto_211659 ?auto_211660 ?auto_211661 ?auto_211662 ?auto_211663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211667 - BLOCK
      ?auto_211668 - BLOCK
      ?auto_211669 - BLOCK
      ?auto_211670 - BLOCK
      ?auto_211671 - BLOCK
    )
    :vars
    (
      ?auto_211674 - BLOCK
      ?auto_211672 - BLOCK
      ?auto_211673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211667 ) ( ON ?auto_211668 ?auto_211667 ) ( not ( = ?auto_211667 ?auto_211668 ) ) ( not ( = ?auto_211667 ?auto_211669 ) ) ( not ( = ?auto_211667 ?auto_211670 ) ) ( not ( = ?auto_211667 ?auto_211671 ) ) ( not ( = ?auto_211668 ?auto_211669 ) ) ( not ( = ?auto_211668 ?auto_211670 ) ) ( not ( = ?auto_211668 ?auto_211671 ) ) ( not ( = ?auto_211669 ?auto_211670 ) ) ( not ( = ?auto_211669 ?auto_211671 ) ) ( not ( = ?auto_211670 ?auto_211671 ) ) ( ON ?auto_211671 ?auto_211674 ) ( not ( = ?auto_211667 ?auto_211674 ) ) ( not ( = ?auto_211668 ?auto_211674 ) ) ( not ( = ?auto_211669 ?auto_211674 ) ) ( not ( = ?auto_211670 ?auto_211674 ) ) ( not ( = ?auto_211671 ?auto_211674 ) ) ( ON ?auto_211670 ?auto_211671 ) ( CLEAR ?auto_211670 ) ( ON-TABLE ?auto_211672 ) ( ON ?auto_211673 ?auto_211672 ) ( ON ?auto_211674 ?auto_211673 ) ( not ( = ?auto_211672 ?auto_211673 ) ) ( not ( = ?auto_211672 ?auto_211674 ) ) ( not ( = ?auto_211672 ?auto_211671 ) ) ( not ( = ?auto_211672 ?auto_211670 ) ) ( not ( = ?auto_211673 ?auto_211674 ) ) ( not ( = ?auto_211673 ?auto_211671 ) ) ( not ( = ?auto_211673 ?auto_211670 ) ) ( not ( = ?auto_211667 ?auto_211672 ) ) ( not ( = ?auto_211667 ?auto_211673 ) ) ( not ( = ?auto_211668 ?auto_211672 ) ) ( not ( = ?auto_211668 ?auto_211673 ) ) ( not ( = ?auto_211669 ?auto_211672 ) ) ( not ( = ?auto_211669 ?auto_211673 ) ) ( HOLDING ?auto_211669 ) ( CLEAR ?auto_211668 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211667 ?auto_211668 ?auto_211669 )
      ( MAKE-5PILE ?auto_211667 ?auto_211668 ?auto_211669 ?auto_211670 ?auto_211671 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211675 - BLOCK
      ?auto_211676 - BLOCK
      ?auto_211677 - BLOCK
      ?auto_211678 - BLOCK
      ?auto_211679 - BLOCK
    )
    :vars
    (
      ?auto_211681 - BLOCK
      ?auto_211680 - BLOCK
      ?auto_211682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211675 ) ( ON ?auto_211676 ?auto_211675 ) ( not ( = ?auto_211675 ?auto_211676 ) ) ( not ( = ?auto_211675 ?auto_211677 ) ) ( not ( = ?auto_211675 ?auto_211678 ) ) ( not ( = ?auto_211675 ?auto_211679 ) ) ( not ( = ?auto_211676 ?auto_211677 ) ) ( not ( = ?auto_211676 ?auto_211678 ) ) ( not ( = ?auto_211676 ?auto_211679 ) ) ( not ( = ?auto_211677 ?auto_211678 ) ) ( not ( = ?auto_211677 ?auto_211679 ) ) ( not ( = ?auto_211678 ?auto_211679 ) ) ( ON ?auto_211679 ?auto_211681 ) ( not ( = ?auto_211675 ?auto_211681 ) ) ( not ( = ?auto_211676 ?auto_211681 ) ) ( not ( = ?auto_211677 ?auto_211681 ) ) ( not ( = ?auto_211678 ?auto_211681 ) ) ( not ( = ?auto_211679 ?auto_211681 ) ) ( ON ?auto_211678 ?auto_211679 ) ( ON-TABLE ?auto_211680 ) ( ON ?auto_211682 ?auto_211680 ) ( ON ?auto_211681 ?auto_211682 ) ( not ( = ?auto_211680 ?auto_211682 ) ) ( not ( = ?auto_211680 ?auto_211681 ) ) ( not ( = ?auto_211680 ?auto_211679 ) ) ( not ( = ?auto_211680 ?auto_211678 ) ) ( not ( = ?auto_211682 ?auto_211681 ) ) ( not ( = ?auto_211682 ?auto_211679 ) ) ( not ( = ?auto_211682 ?auto_211678 ) ) ( not ( = ?auto_211675 ?auto_211680 ) ) ( not ( = ?auto_211675 ?auto_211682 ) ) ( not ( = ?auto_211676 ?auto_211680 ) ) ( not ( = ?auto_211676 ?auto_211682 ) ) ( not ( = ?auto_211677 ?auto_211680 ) ) ( not ( = ?auto_211677 ?auto_211682 ) ) ( CLEAR ?auto_211676 ) ( ON ?auto_211677 ?auto_211678 ) ( CLEAR ?auto_211677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211680 ?auto_211682 ?auto_211681 ?auto_211679 ?auto_211678 )
      ( MAKE-5PILE ?auto_211675 ?auto_211676 ?auto_211677 ?auto_211678 ?auto_211679 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211683 - BLOCK
      ?auto_211684 - BLOCK
      ?auto_211685 - BLOCK
      ?auto_211686 - BLOCK
      ?auto_211687 - BLOCK
    )
    :vars
    (
      ?auto_211689 - BLOCK
      ?auto_211688 - BLOCK
      ?auto_211690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211683 ) ( not ( = ?auto_211683 ?auto_211684 ) ) ( not ( = ?auto_211683 ?auto_211685 ) ) ( not ( = ?auto_211683 ?auto_211686 ) ) ( not ( = ?auto_211683 ?auto_211687 ) ) ( not ( = ?auto_211684 ?auto_211685 ) ) ( not ( = ?auto_211684 ?auto_211686 ) ) ( not ( = ?auto_211684 ?auto_211687 ) ) ( not ( = ?auto_211685 ?auto_211686 ) ) ( not ( = ?auto_211685 ?auto_211687 ) ) ( not ( = ?auto_211686 ?auto_211687 ) ) ( ON ?auto_211687 ?auto_211689 ) ( not ( = ?auto_211683 ?auto_211689 ) ) ( not ( = ?auto_211684 ?auto_211689 ) ) ( not ( = ?auto_211685 ?auto_211689 ) ) ( not ( = ?auto_211686 ?auto_211689 ) ) ( not ( = ?auto_211687 ?auto_211689 ) ) ( ON ?auto_211686 ?auto_211687 ) ( ON-TABLE ?auto_211688 ) ( ON ?auto_211690 ?auto_211688 ) ( ON ?auto_211689 ?auto_211690 ) ( not ( = ?auto_211688 ?auto_211690 ) ) ( not ( = ?auto_211688 ?auto_211689 ) ) ( not ( = ?auto_211688 ?auto_211687 ) ) ( not ( = ?auto_211688 ?auto_211686 ) ) ( not ( = ?auto_211690 ?auto_211689 ) ) ( not ( = ?auto_211690 ?auto_211687 ) ) ( not ( = ?auto_211690 ?auto_211686 ) ) ( not ( = ?auto_211683 ?auto_211688 ) ) ( not ( = ?auto_211683 ?auto_211690 ) ) ( not ( = ?auto_211684 ?auto_211688 ) ) ( not ( = ?auto_211684 ?auto_211690 ) ) ( not ( = ?auto_211685 ?auto_211688 ) ) ( not ( = ?auto_211685 ?auto_211690 ) ) ( ON ?auto_211685 ?auto_211686 ) ( CLEAR ?auto_211685 ) ( HOLDING ?auto_211684 ) ( CLEAR ?auto_211683 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211683 ?auto_211684 )
      ( MAKE-5PILE ?auto_211683 ?auto_211684 ?auto_211685 ?auto_211686 ?auto_211687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211691 - BLOCK
      ?auto_211692 - BLOCK
      ?auto_211693 - BLOCK
      ?auto_211694 - BLOCK
      ?auto_211695 - BLOCK
    )
    :vars
    (
      ?auto_211698 - BLOCK
      ?auto_211696 - BLOCK
      ?auto_211697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211691 ) ( not ( = ?auto_211691 ?auto_211692 ) ) ( not ( = ?auto_211691 ?auto_211693 ) ) ( not ( = ?auto_211691 ?auto_211694 ) ) ( not ( = ?auto_211691 ?auto_211695 ) ) ( not ( = ?auto_211692 ?auto_211693 ) ) ( not ( = ?auto_211692 ?auto_211694 ) ) ( not ( = ?auto_211692 ?auto_211695 ) ) ( not ( = ?auto_211693 ?auto_211694 ) ) ( not ( = ?auto_211693 ?auto_211695 ) ) ( not ( = ?auto_211694 ?auto_211695 ) ) ( ON ?auto_211695 ?auto_211698 ) ( not ( = ?auto_211691 ?auto_211698 ) ) ( not ( = ?auto_211692 ?auto_211698 ) ) ( not ( = ?auto_211693 ?auto_211698 ) ) ( not ( = ?auto_211694 ?auto_211698 ) ) ( not ( = ?auto_211695 ?auto_211698 ) ) ( ON ?auto_211694 ?auto_211695 ) ( ON-TABLE ?auto_211696 ) ( ON ?auto_211697 ?auto_211696 ) ( ON ?auto_211698 ?auto_211697 ) ( not ( = ?auto_211696 ?auto_211697 ) ) ( not ( = ?auto_211696 ?auto_211698 ) ) ( not ( = ?auto_211696 ?auto_211695 ) ) ( not ( = ?auto_211696 ?auto_211694 ) ) ( not ( = ?auto_211697 ?auto_211698 ) ) ( not ( = ?auto_211697 ?auto_211695 ) ) ( not ( = ?auto_211697 ?auto_211694 ) ) ( not ( = ?auto_211691 ?auto_211696 ) ) ( not ( = ?auto_211691 ?auto_211697 ) ) ( not ( = ?auto_211692 ?auto_211696 ) ) ( not ( = ?auto_211692 ?auto_211697 ) ) ( not ( = ?auto_211693 ?auto_211696 ) ) ( not ( = ?auto_211693 ?auto_211697 ) ) ( ON ?auto_211693 ?auto_211694 ) ( CLEAR ?auto_211691 ) ( ON ?auto_211692 ?auto_211693 ) ( CLEAR ?auto_211692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211696 ?auto_211697 ?auto_211698 ?auto_211695 ?auto_211694 ?auto_211693 )
      ( MAKE-5PILE ?auto_211691 ?auto_211692 ?auto_211693 ?auto_211694 ?auto_211695 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211699 - BLOCK
      ?auto_211700 - BLOCK
      ?auto_211701 - BLOCK
      ?auto_211702 - BLOCK
      ?auto_211703 - BLOCK
    )
    :vars
    (
      ?auto_211706 - BLOCK
      ?auto_211705 - BLOCK
      ?auto_211704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211699 ?auto_211700 ) ) ( not ( = ?auto_211699 ?auto_211701 ) ) ( not ( = ?auto_211699 ?auto_211702 ) ) ( not ( = ?auto_211699 ?auto_211703 ) ) ( not ( = ?auto_211700 ?auto_211701 ) ) ( not ( = ?auto_211700 ?auto_211702 ) ) ( not ( = ?auto_211700 ?auto_211703 ) ) ( not ( = ?auto_211701 ?auto_211702 ) ) ( not ( = ?auto_211701 ?auto_211703 ) ) ( not ( = ?auto_211702 ?auto_211703 ) ) ( ON ?auto_211703 ?auto_211706 ) ( not ( = ?auto_211699 ?auto_211706 ) ) ( not ( = ?auto_211700 ?auto_211706 ) ) ( not ( = ?auto_211701 ?auto_211706 ) ) ( not ( = ?auto_211702 ?auto_211706 ) ) ( not ( = ?auto_211703 ?auto_211706 ) ) ( ON ?auto_211702 ?auto_211703 ) ( ON-TABLE ?auto_211705 ) ( ON ?auto_211704 ?auto_211705 ) ( ON ?auto_211706 ?auto_211704 ) ( not ( = ?auto_211705 ?auto_211704 ) ) ( not ( = ?auto_211705 ?auto_211706 ) ) ( not ( = ?auto_211705 ?auto_211703 ) ) ( not ( = ?auto_211705 ?auto_211702 ) ) ( not ( = ?auto_211704 ?auto_211706 ) ) ( not ( = ?auto_211704 ?auto_211703 ) ) ( not ( = ?auto_211704 ?auto_211702 ) ) ( not ( = ?auto_211699 ?auto_211705 ) ) ( not ( = ?auto_211699 ?auto_211704 ) ) ( not ( = ?auto_211700 ?auto_211705 ) ) ( not ( = ?auto_211700 ?auto_211704 ) ) ( not ( = ?auto_211701 ?auto_211705 ) ) ( not ( = ?auto_211701 ?auto_211704 ) ) ( ON ?auto_211701 ?auto_211702 ) ( ON ?auto_211700 ?auto_211701 ) ( CLEAR ?auto_211700 ) ( HOLDING ?auto_211699 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_211699 )
      ( MAKE-5PILE ?auto_211699 ?auto_211700 ?auto_211701 ?auto_211702 ?auto_211703 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211707 - BLOCK
      ?auto_211708 - BLOCK
      ?auto_211709 - BLOCK
      ?auto_211710 - BLOCK
      ?auto_211711 - BLOCK
    )
    :vars
    (
      ?auto_211713 - BLOCK
      ?auto_211714 - BLOCK
      ?auto_211712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211707 ?auto_211708 ) ) ( not ( = ?auto_211707 ?auto_211709 ) ) ( not ( = ?auto_211707 ?auto_211710 ) ) ( not ( = ?auto_211707 ?auto_211711 ) ) ( not ( = ?auto_211708 ?auto_211709 ) ) ( not ( = ?auto_211708 ?auto_211710 ) ) ( not ( = ?auto_211708 ?auto_211711 ) ) ( not ( = ?auto_211709 ?auto_211710 ) ) ( not ( = ?auto_211709 ?auto_211711 ) ) ( not ( = ?auto_211710 ?auto_211711 ) ) ( ON ?auto_211711 ?auto_211713 ) ( not ( = ?auto_211707 ?auto_211713 ) ) ( not ( = ?auto_211708 ?auto_211713 ) ) ( not ( = ?auto_211709 ?auto_211713 ) ) ( not ( = ?auto_211710 ?auto_211713 ) ) ( not ( = ?auto_211711 ?auto_211713 ) ) ( ON ?auto_211710 ?auto_211711 ) ( ON-TABLE ?auto_211714 ) ( ON ?auto_211712 ?auto_211714 ) ( ON ?auto_211713 ?auto_211712 ) ( not ( = ?auto_211714 ?auto_211712 ) ) ( not ( = ?auto_211714 ?auto_211713 ) ) ( not ( = ?auto_211714 ?auto_211711 ) ) ( not ( = ?auto_211714 ?auto_211710 ) ) ( not ( = ?auto_211712 ?auto_211713 ) ) ( not ( = ?auto_211712 ?auto_211711 ) ) ( not ( = ?auto_211712 ?auto_211710 ) ) ( not ( = ?auto_211707 ?auto_211714 ) ) ( not ( = ?auto_211707 ?auto_211712 ) ) ( not ( = ?auto_211708 ?auto_211714 ) ) ( not ( = ?auto_211708 ?auto_211712 ) ) ( not ( = ?auto_211709 ?auto_211714 ) ) ( not ( = ?auto_211709 ?auto_211712 ) ) ( ON ?auto_211709 ?auto_211710 ) ( ON ?auto_211708 ?auto_211709 ) ( ON ?auto_211707 ?auto_211708 ) ( CLEAR ?auto_211707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211714 ?auto_211712 ?auto_211713 ?auto_211711 ?auto_211710 ?auto_211709 ?auto_211708 )
      ( MAKE-5PILE ?auto_211707 ?auto_211708 ?auto_211709 ?auto_211710 ?auto_211711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211715 - BLOCK
      ?auto_211716 - BLOCK
      ?auto_211717 - BLOCK
      ?auto_211718 - BLOCK
      ?auto_211719 - BLOCK
    )
    :vars
    (
      ?auto_211721 - BLOCK
      ?auto_211722 - BLOCK
      ?auto_211720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211715 ?auto_211716 ) ) ( not ( = ?auto_211715 ?auto_211717 ) ) ( not ( = ?auto_211715 ?auto_211718 ) ) ( not ( = ?auto_211715 ?auto_211719 ) ) ( not ( = ?auto_211716 ?auto_211717 ) ) ( not ( = ?auto_211716 ?auto_211718 ) ) ( not ( = ?auto_211716 ?auto_211719 ) ) ( not ( = ?auto_211717 ?auto_211718 ) ) ( not ( = ?auto_211717 ?auto_211719 ) ) ( not ( = ?auto_211718 ?auto_211719 ) ) ( ON ?auto_211719 ?auto_211721 ) ( not ( = ?auto_211715 ?auto_211721 ) ) ( not ( = ?auto_211716 ?auto_211721 ) ) ( not ( = ?auto_211717 ?auto_211721 ) ) ( not ( = ?auto_211718 ?auto_211721 ) ) ( not ( = ?auto_211719 ?auto_211721 ) ) ( ON ?auto_211718 ?auto_211719 ) ( ON-TABLE ?auto_211722 ) ( ON ?auto_211720 ?auto_211722 ) ( ON ?auto_211721 ?auto_211720 ) ( not ( = ?auto_211722 ?auto_211720 ) ) ( not ( = ?auto_211722 ?auto_211721 ) ) ( not ( = ?auto_211722 ?auto_211719 ) ) ( not ( = ?auto_211722 ?auto_211718 ) ) ( not ( = ?auto_211720 ?auto_211721 ) ) ( not ( = ?auto_211720 ?auto_211719 ) ) ( not ( = ?auto_211720 ?auto_211718 ) ) ( not ( = ?auto_211715 ?auto_211722 ) ) ( not ( = ?auto_211715 ?auto_211720 ) ) ( not ( = ?auto_211716 ?auto_211722 ) ) ( not ( = ?auto_211716 ?auto_211720 ) ) ( not ( = ?auto_211717 ?auto_211722 ) ) ( not ( = ?auto_211717 ?auto_211720 ) ) ( ON ?auto_211717 ?auto_211718 ) ( ON ?auto_211716 ?auto_211717 ) ( HOLDING ?auto_211715 ) ( CLEAR ?auto_211716 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_211722 ?auto_211720 ?auto_211721 ?auto_211719 ?auto_211718 ?auto_211717 ?auto_211716 ?auto_211715 )
      ( MAKE-5PILE ?auto_211715 ?auto_211716 ?auto_211717 ?auto_211718 ?auto_211719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211723 - BLOCK
      ?auto_211724 - BLOCK
      ?auto_211725 - BLOCK
      ?auto_211726 - BLOCK
      ?auto_211727 - BLOCK
    )
    :vars
    (
      ?auto_211730 - BLOCK
      ?auto_211728 - BLOCK
      ?auto_211729 - BLOCK
      ?auto_211731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211723 ?auto_211724 ) ) ( not ( = ?auto_211723 ?auto_211725 ) ) ( not ( = ?auto_211723 ?auto_211726 ) ) ( not ( = ?auto_211723 ?auto_211727 ) ) ( not ( = ?auto_211724 ?auto_211725 ) ) ( not ( = ?auto_211724 ?auto_211726 ) ) ( not ( = ?auto_211724 ?auto_211727 ) ) ( not ( = ?auto_211725 ?auto_211726 ) ) ( not ( = ?auto_211725 ?auto_211727 ) ) ( not ( = ?auto_211726 ?auto_211727 ) ) ( ON ?auto_211727 ?auto_211730 ) ( not ( = ?auto_211723 ?auto_211730 ) ) ( not ( = ?auto_211724 ?auto_211730 ) ) ( not ( = ?auto_211725 ?auto_211730 ) ) ( not ( = ?auto_211726 ?auto_211730 ) ) ( not ( = ?auto_211727 ?auto_211730 ) ) ( ON ?auto_211726 ?auto_211727 ) ( ON-TABLE ?auto_211728 ) ( ON ?auto_211729 ?auto_211728 ) ( ON ?auto_211730 ?auto_211729 ) ( not ( = ?auto_211728 ?auto_211729 ) ) ( not ( = ?auto_211728 ?auto_211730 ) ) ( not ( = ?auto_211728 ?auto_211727 ) ) ( not ( = ?auto_211728 ?auto_211726 ) ) ( not ( = ?auto_211729 ?auto_211730 ) ) ( not ( = ?auto_211729 ?auto_211727 ) ) ( not ( = ?auto_211729 ?auto_211726 ) ) ( not ( = ?auto_211723 ?auto_211728 ) ) ( not ( = ?auto_211723 ?auto_211729 ) ) ( not ( = ?auto_211724 ?auto_211728 ) ) ( not ( = ?auto_211724 ?auto_211729 ) ) ( not ( = ?auto_211725 ?auto_211728 ) ) ( not ( = ?auto_211725 ?auto_211729 ) ) ( ON ?auto_211725 ?auto_211726 ) ( ON ?auto_211724 ?auto_211725 ) ( CLEAR ?auto_211724 ) ( ON ?auto_211723 ?auto_211731 ) ( CLEAR ?auto_211723 ) ( HAND-EMPTY ) ( not ( = ?auto_211723 ?auto_211731 ) ) ( not ( = ?auto_211724 ?auto_211731 ) ) ( not ( = ?auto_211725 ?auto_211731 ) ) ( not ( = ?auto_211726 ?auto_211731 ) ) ( not ( = ?auto_211727 ?auto_211731 ) ) ( not ( = ?auto_211730 ?auto_211731 ) ) ( not ( = ?auto_211728 ?auto_211731 ) ) ( not ( = ?auto_211729 ?auto_211731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_211723 ?auto_211731 )
      ( MAKE-5PILE ?auto_211723 ?auto_211724 ?auto_211725 ?auto_211726 ?auto_211727 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211732 - BLOCK
      ?auto_211733 - BLOCK
      ?auto_211734 - BLOCK
      ?auto_211735 - BLOCK
      ?auto_211736 - BLOCK
    )
    :vars
    (
      ?auto_211740 - BLOCK
      ?auto_211738 - BLOCK
      ?auto_211739 - BLOCK
      ?auto_211737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211732 ?auto_211733 ) ) ( not ( = ?auto_211732 ?auto_211734 ) ) ( not ( = ?auto_211732 ?auto_211735 ) ) ( not ( = ?auto_211732 ?auto_211736 ) ) ( not ( = ?auto_211733 ?auto_211734 ) ) ( not ( = ?auto_211733 ?auto_211735 ) ) ( not ( = ?auto_211733 ?auto_211736 ) ) ( not ( = ?auto_211734 ?auto_211735 ) ) ( not ( = ?auto_211734 ?auto_211736 ) ) ( not ( = ?auto_211735 ?auto_211736 ) ) ( ON ?auto_211736 ?auto_211740 ) ( not ( = ?auto_211732 ?auto_211740 ) ) ( not ( = ?auto_211733 ?auto_211740 ) ) ( not ( = ?auto_211734 ?auto_211740 ) ) ( not ( = ?auto_211735 ?auto_211740 ) ) ( not ( = ?auto_211736 ?auto_211740 ) ) ( ON ?auto_211735 ?auto_211736 ) ( ON-TABLE ?auto_211738 ) ( ON ?auto_211739 ?auto_211738 ) ( ON ?auto_211740 ?auto_211739 ) ( not ( = ?auto_211738 ?auto_211739 ) ) ( not ( = ?auto_211738 ?auto_211740 ) ) ( not ( = ?auto_211738 ?auto_211736 ) ) ( not ( = ?auto_211738 ?auto_211735 ) ) ( not ( = ?auto_211739 ?auto_211740 ) ) ( not ( = ?auto_211739 ?auto_211736 ) ) ( not ( = ?auto_211739 ?auto_211735 ) ) ( not ( = ?auto_211732 ?auto_211738 ) ) ( not ( = ?auto_211732 ?auto_211739 ) ) ( not ( = ?auto_211733 ?auto_211738 ) ) ( not ( = ?auto_211733 ?auto_211739 ) ) ( not ( = ?auto_211734 ?auto_211738 ) ) ( not ( = ?auto_211734 ?auto_211739 ) ) ( ON ?auto_211734 ?auto_211735 ) ( ON ?auto_211732 ?auto_211737 ) ( CLEAR ?auto_211732 ) ( not ( = ?auto_211732 ?auto_211737 ) ) ( not ( = ?auto_211733 ?auto_211737 ) ) ( not ( = ?auto_211734 ?auto_211737 ) ) ( not ( = ?auto_211735 ?auto_211737 ) ) ( not ( = ?auto_211736 ?auto_211737 ) ) ( not ( = ?auto_211740 ?auto_211737 ) ) ( not ( = ?auto_211738 ?auto_211737 ) ) ( not ( = ?auto_211739 ?auto_211737 ) ) ( HOLDING ?auto_211733 ) ( CLEAR ?auto_211734 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211738 ?auto_211739 ?auto_211740 ?auto_211736 ?auto_211735 ?auto_211734 ?auto_211733 )
      ( MAKE-5PILE ?auto_211732 ?auto_211733 ?auto_211734 ?auto_211735 ?auto_211736 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211741 - BLOCK
      ?auto_211742 - BLOCK
      ?auto_211743 - BLOCK
      ?auto_211744 - BLOCK
      ?auto_211745 - BLOCK
    )
    :vars
    (
      ?auto_211749 - BLOCK
      ?auto_211746 - BLOCK
      ?auto_211747 - BLOCK
      ?auto_211748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211741 ?auto_211742 ) ) ( not ( = ?auto_211741 ?auto_211743 ) ) ( not ( = ?auto_211741 ?auto_211744 ) ) ( not ( = ?auto_211741 ?auto_211745 ) ) ( not ( = ?auto_211742 ?auto_211743 ) ) ( not ( = ?auto_211742 ?auto_211744 ) ) ( not ( = ?auto_211742 ?auto_211745 ) ) ( not ( = ?auto_211743 ?auto_211744 ) ) ( not ( = ?auto_211743 ?auto_211745 ) ) ( not ( = ?auto_211744 ?auto_211745 ) ) ( ON ?auto_211745 ?auto_211749 ) ( not ( = ?auto_211741 ?auto_211749 ) ) ( not ( = ?auto_211742 ?auto_211749 ) ) ( not ( = ?auto_211743 ?auto_211749 ) ) ( not ( = ?auto_211744 ?auto_211749 ) ) ( not ( = ?auto_211745 ?auto_211749 ) ) ( ON ?auto_211744 ?auto_211745 ) ( ON-TABLE ?auto_211746 ) ( ON ?auto_211747 ?auto_211746 ) ( ON ?auto_211749 ?auto_211747 ) ( not ( = ?auto_211746 ?auto_211747 ) ) ( not ( = ?auto_211746 ?auto_211749 ) ) ( not ( = ?auto_211746 ?auto_211745 ) ) ( not ( = ?auto_211746 ?auto_211744 ) ) ( not ( = ?auto_211747 ?auto_211749 ) ) ( not ( = ?auto_211747 ?auto_211745 ) ) ( not ( = ?auto_211747 ?auto_211744 ) ) ( not ( = ?auto_211741 ?auto_211746 ) ) ( not ( = ?auto_211741 ?auto_211747 ) ) ( not ( = ?auto_211742 ?auto_211746 ) ) ( not ( = ?auto_211742 ?auto_211747 ) ) ( not ( = ?auto_211743 ?auto_211746 ) ) ( not ( = ?auto_211743 ?auto_211747 ) ) ( ON ?auto_211743 ?auto_211744 ) ( ON ?auto_211741 ?auto_211748 ) ( not ( = ?auto_211741 ?auto_211748 ) ) ( not ( = ?auto_211742 ?auto_211748 ) ) ( not ( = ?auto_211743 ?auto_211748 ) ) ( not ( = ?auto_211744 ?auto_211748 ) ) ( not ( = ?auto_211745 ?auto_211748 ) ) ( not ( = ?auto_211749 ?auto_211748 ) ) ( not ( = ?auto_211746 ?auto_211748 ) ) ( not ( = ?auto_211747 ?auto_211748 ) ) ( CLEAR ?auto_211743 ) ( ON ?auto_211742 ?auto_211741 ) ( CLEAR ?auto_211742 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211748 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211748 ?auto_211741 )
      ( MAKE-5PILE ?auto_211741 ?auto_211742 ?auto_211743 ?auto_211744 ?auto_211745 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211750 - BLOCK
      ?auto_211751 - BLOCK
      ?auto_211752 - BLOCK
      ?auto_211753 - BLOCK
      ?auto_211754 - BLOCK
    )
    :vars
    (
      ?auto_211756 - BLOCK
      ?auto_211757 - BLOCK
      ?auto_211758 - BLOCK
      ?auto_211755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211750 ?auto_211751 ) ) ( not ( = ?auto_211750 ?auto_211752 ) ) ( not ( = ?auto_211750 ?auto_211753 ) ) ( not ( = ?auto_211750 ?auto_211754 ) ) ( not ( = ?auto_211751 ?auto_211752 ) ) ( not ( = ?auto_211751 ?auto_211753 ) ) ( not ( = ?auto_211751 ?auto_211754 ) ) ( not ( = ?auto_211752 ?auto_211753 ) ) ( not ( = ?auto_211752 ?auto_211754 ) ) ( not ( = ?auto_211753 ?auto_211754 ) ) ( ON ?auto_211754 ?auto_211756 ) ( not ( = ?auto_211750 ?auto_211756 ) ) ( not ( = ?auto_211751 ?auto_211756 ) ) ( not ( = ?auto_211752 ?auto_211756 ) ) ( not ( = ?auto_211753 ?auto_211756 ) ) ( not ( = ?auto_211754 ?auto_211756 ) ) ( ON ?auto_211753 ?auto_211754 ) ( ON-TABLE ?auto_211757 ) ( ON ?auto_211758 ?auto_211757 ) ( ON ?auto_211756 ?auto_211758 ) ( not ( = ?auto_211757 ?auto_211758 ) ) ( not ( = ?auto_211757 ?auto_211756 ) ) ( not ( = ?auto_211757 ?auto_211754 ) ) ( not ( = ?auto_211757 ?auto_211753 ) ) ( not ( = ?auto_211758 ?auto_211756 ) ) ( not ( = ?auto_211758 ?auto_211754 ) ) ( not ( = ?auto_211758 ?auto_211753 ) ) ( not ( = ?auto_211750 ?auto_211757 ) ) ( not ( = ?auto_211750 ?auto_211758 ) ) ( not ( = ?auto_211751 ?auto_211757 ) ) ( not ( = ?auto_211751 ?auto_211758 ) ) ( not ( = ?auto_211752 ?auto_211757 ) ) ( not ( = ?auto_211752 ?auto_211758 ) ) ( ON ?auto_211750 ?auto_211755 ) ( not ( = ?auto_211750 ?auto_211755 ) ) ( not ( = ?auto_211751 ?auto_211755 ) ) ( not ( = ?auto_211752 ?auto_211755 ) ) ( not ( = ?auto_211753 ?auto_211755 ) ) ( not ( = ?auto_211754 ?auto_211755 ) ) ( not ( = ?auto_211756 ?auto_211755 ) ) ( not ( = ?auto_211757 ?auto_211755 ) ) ( not ( = ?auto_211758 ?auto_211755 ) ) ( ON ?auto_211751 ?auto_211750 ) ( CLEAR ?auto_211751 ) ( ON-TABLE ?auto_211755 ) ( HOLDING ?auto_211752 ) ( CLEAR ?auto_211753 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211757 ?auto_211758 ?auto_211756 ?auto_211754 ?auto_211753 ?auto_211752 )
      ( MAKE-5PILE ?auto_211750 ?auto_211751 ?auto_211752 ?auto_211753 ?auto_211754 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211759 - BLOCK
      ?auto_211760 - BLOCK
      ?auto_211761 - BLOCK
      ?auto_211762 - BLOCK
      ?auto_211763 - BLOCK
    )
    :vars
    (
      ?auto_211765 - BLOCK
      ?auto_211764 - BLOCK
      ?auto_211767 - BLOCK
      ?auto_211766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211759 ?auto_211760 ) ) ( not ( = ?auto_211759 ?auto_211761 ) ) ( not ( = ?auto_211759 ?auto_211762 ) ) ( not ( = ?auto_211759 ?auto_211763 ) ) ( not ( = ?auto_211760 ?auto_211761 ) ) ( not ( = ?auto_211760 ?auto_211762 ) ) ( not ( = ?auto_211760 ?auto_211763 ) ) ( not ( = ?auto_211761 ?auto_211762 ) ) ( not ( = ?auto_211761 ?auto_211763 ) ) ( not ( = ?auto_211762 ?auto_211763 ) ) ( ON ?auto_211763 ?auto_211765 ) ( not ( = ?auto_211759 ?auto_211765 ) ) ( not ( = ?auto_211760 ?auto_211765 ) ) ( not ( = ?auto_211761 ?auto_211765 ) ) ( not ( = ?auto_211762 ?auto_211765 ) ) ( not ( = ?auto_211763 ?auto_211765 ) ) ( ON ?auto_211762 ?auto_211763 ) ( ON-TABLE ?auto_211764 ) ( ON ?auto_211767 ?auto_211764 ) ( ON ?auto_211765 ?auto_211767 ) ( not ( = ?auto_211764 ?auto_211767 ) ) ( not ( = ?auto_211764 ?auto_211765 ) ) ( not ( = ?auto_211764 ?auto_211763 ) ) ( not ( = ?auto_211764 ?auto_211762 ) ) ( not ( = ?auto_211767 ?auto_211765 ) ) ( not ( = ?auto_211767 ?auto_211763 ) ) ( not ( = ?auto_211767 ?auto_211762 ) ) ( not ( = ?auto_211759 ?auto_211764 ) ) ( not ( = ?auto_211759 ?auto_211767 ) ) ( not ( = ?auto_211760 ?auto_211764 ) ) ( not ( = ?auto_211760 ?auto_211767 ) ) ( not ( = ?auto_211761 ?auto_211764 ) ) ( not ( = ?auto_211761 ?auto_211767 ) ) ( ON ?auto_211759 ?auto_211766 ) ( not ( = ?auto_211759 ?auto_211766 ) ) ( not ( = ?auto_211760 ?auto_211766 ) ) ( not ( = ?auto_211761 ?auto_211766 ) ) ( not ( = ?auto_211762 ?auto_211766 ) ) ( not ( = ?auto_211763 ?auto_211766 ) ) ( not ( = ?auto_211765 ?auto_211766 ) ) ( not ( = ?auto_211764 ?auto_211766 ) ) ( not ( = ?auto_211767 ?auto_211766 ) ) ( ON ?auto_211760 ?auto_211759 ) ( ON-TABLE ?auto_211766 ) ( CLEAR ?auto_211762 ) ( ON ?auto_211761 ?auto_211760 ) ( CLEAR ?auto_211761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211766 ?auto_211759 ?auto_211760 )
      ( MAKE-5PILE ?auto_211759 ?auto_211760 ?auto_211761 ?auto_211762 ?auto_211763 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211768 - BLOCK
      ?auto_211769 - BLOCK
      ?auto_211770 - BLOCK
      ?auto_211771 - BLOCK
      ?auto_211772 - BLOCK
    )
    :vars
    (
      ?auto_211776 - BLOCK
      ?auto_211773 - BLOCK
      ?auto_211774 - BLOCK
      ?auto_211775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211768 ?auto_211769 ) ) ( not ( = ?auto_211768 ?auto_211770 ) ) ( not ( = ?auto_211768 ?auto_211771 ) ) ( not ( = ?auto_211768 ?auto_211772 ) ) ( not ( = ?auto_211769 ?auto_211770 ) ) ( not ( = ?auto_211769 ?auto_211771 ) ) ( not ( = ?auto_211769 ?auto_211772 ) ) ( not ( = ?auto_211770 ?auto_211771 ) ) ( not ( = ?auto_211770 ?auto_211772 ) ) ( not ( = ?auto_211771 ?auto_211772 ) ) ( ON ?auto_211772 ?auto_211776 ) ( not ( = ?auto_211768 ?auto_211776 ) ) ( not ( = ?auto_211769 ?auto_211776 ) ) ( not ( = ?auto_211770 ?auto_211776 ) ) ( not ( = ?auto_211771 ?auto_211776 ) ) ( not ( = ?auto_211772 ?auto_211776 ) ) ( ON-TABLE ?auto_211773 ) ( ON ?auto_211774 ?auto_211773 ) ( ON ?auto_211776 ?auto_211774 ) ( not ( = ?auto_211773 ?auto_211774 ) ) ( not ( = ?auto_211773 ?auto_211776 ) ) ( not ( = ?auto_211773 ?auto_211772 ) ) ( not ( = ?auto_211773 ?auto_211771 ) ) ( not ( = ?auto_211774 ?auto_211776 ) ) ( not ( = ?auto_211774 ?auto_211772 ) ) ( not ( = ?auto_211774 ?auto_211771 ) ) ( not ( = ?auto_211768 ?auto_211773 ) ) ( not ( = ?auto_211768 ?auto_211774 ) ) ( not ( = ?auto_211769 ?auto_211773 ) ) ( not ( = ?auto_211769 ?auto_211774 ) ) ( not ( = ?auto_211770 ?auto_211773 ) ) ( not ( = ?auto_211770 ?auto_211774 ) ) ( ON ?auto_211768 ?auto_211775 ) ( not ( = ?auto_211768 ?auto_211775 ) ) ( not ( = ?auto_211769 ?auto_211775 ) ) ( not ( = ?auto_211770 ?auto_211775 ) ) ( not ( = ?auto_211771 ?auto_211775 ) ) ( not ( = ?auto_211772 ?auto_211775 ) ) ( not ( = ?auto_211776 ?auto_211775 ) ) ( not ( = ?auto_211773 ?auto_211775 ) ) ( not ( = ?auto_211774 ?auto_211775 ) ) ( ON ?auto_211769 ?auto_211768 ) ( ON-TABLE ?auto_211775 ) ( ON ?auto_211770 ?auto_211769 ) ( CLEAR ?auto_211770 ) ( HOLDING ?auto_211771 ) ( CLEAR ?auto_211772 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211773 ?auto_211774 ?auto_211776 ?auto_211772 ?auto_211771 )
      ( MAKE-5PILE ?auto_211768 ?auto_211769 ?auto_211770 ?auto_211771 ?auto_211772 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211777 - BLOCK
      ?auto_211778 - BLOCK
      ?auto_211779 - BLOCK
      ?auto_211780 - BLOCK
      ?auto_211781 - BLOCK
    )
    :vars
    (
      ?auto_211782 - BLOCK
      ?auto_211784 - BLOCK
      ?auto_211783 - BLOCK
      ?auto_211785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211777 ?auto_211778 ) ) ( not ( = ?auto_211777 ?auto_211779 ) ) ( not ( = ?auto_211777 ?auto_211780 ) ) ( not ( = ?auto_211777 ?auto_211781 ) ) ( not ( = ?auto_211778 ?auto_211779 ) ) ( not ( = ?auto_211778 ?auto_211780 ) ) ( not ( = ?auto_211778 ?auto_211781 ) ) ( not ( = ?auto_211779 ?auto_211780 ) ) ( not ( = ?auto_211779 ?auto_211781 ) ) ( not ( = ?auto_211780 ?auto_211781 ) ) ( ON ?auto_211781 ?auto_211782 ) ( not ( = ?auto_211777 ?auto_211782 ) ) ( not ( = ?auto_211778 ?auto_211782 ) ) ( not ( = ?auto_211779 ?auto_211782 ) ) ( not ( = ?auto_211780 ?auto_211782 ) ) ( not ( = ?auto_211781 ?auto_211782 ) ) ( ON-TABLE ?auto_211784 ) ( ON ?auto_211783 ?auto_211784 ) ( ON ?auto_211782 ?auto_211783 ) ( not ( = ?auto_211784 ?auto_211783 ) ) ( not ( = ?auto_211784 ?auto_211782 ) ) ( not ( = ?auto_211784 ?auto_211781 ) ) ( not ( = ?auto_211784 ?auto_211780 ) ) ( not ( = ?auto_211783 ?auto_211782 ) ) ( not ( = ?auto_211783 ?auto_211781 ) ) ( not ( = ?auto_211783 ?auto_211780 ) ) ( not ( = ?auto_211777 ?auto_211784 ) ) ( not ( = ?auto_211777 ?auto_211783 ) ) ( not ( = ?auto_211778 ?auto_211784 ) ) ( not ( = ?auto_211778 ?auto_211783 ) ) ( not ( = ?auto_211779 ?auto_211784 ) ) ( not ( = ?auto_211779 ?auto_211783 ) ) ( ON ?auto_211777 ?auto_211785 ) ( not ( = ?auto_211777 ?auto_211785 ) ) ( not ( = ?auto_211778 ?auto_211785 ) ) ( not ( = ?auto_211779 ?auto_211785 ) ) ( not ( = ?auto_211780 ?auto_211785 ) ) ( not ( = ?auto_211781 ?auto_211785 ) ) ( not ( = ?auto_211782 ?auto_211785 ) ) ( not ( = ?auto_211784 ?auto_211785 ) ) ( not ( = ?auto_211783 ?auto_211785 ) ) ( ON ?auto_211778 ?auto_211777 ) ( ON-TABLE ?auto_211785 ) ( ON ?auto_211779 ?auto_211778 ) ( CLEAR ?auto_211781 ) ( ON ?auto_211780 ?auto_211779 ) ( CLEAR ?auto_211780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_211785 ?auto_211777 ?auto_211778 ?auto_211779 )
      ( MAKE-5PILE ?auto_211777 ?auto_211778 ?auto_211779 ?auto_211780 ?auto_211781 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211786 - BLOCK
      ?auto_211787 - BLOCK
      ?auto_211788 - BLOCK
      ?auto_211789 - BLOCK
      ?auto_211790 - BLOCK
    )
    :vars
    (
      ?auto_211793 - BLOCK
      ?auto_211794 - BLOCK
      ?auto_211792 - BLOCK
      ?auto_211791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211786 ?auto_211787 ) ) ( not ( = ?auto_211786 ?auto_211788 ) ) ( not ( = ?auto_211786 ?auto_211789 ) ) ( not ( = ?auto_211786 ?auto_211790 ) ) ( not ( = ?auto_211787 ?auto_211788 ) ) ( not ( = ?auto_211787 ?auto_211789 ) ) ( not ( = ?auto_211787 ?auto_211790 ) ) ( not ( = ?auto_211788 ?auto_211789 ) ) ( not ( = ?auto_211788 ?auto_211790 ) ) ( not ( = ?auto_211789 ?auto_211790 ) ) ( not ( = ?auto_211786 ?auto_211793 ) ) ( not ( = ?auto_211787 ?auto_211793 ) ) ( not ( = ?auto_211788 ?auto_211793 ) ) ( not ( = ?auto_211789 ?auto_211793 ) ) ( not ( = ?auto_211790 ?auto_211793 ) ) ( ON-TABLE ?auto_211794 ) ( ON ?auto_211792 ?auto_211794 ) ( ON ?auto_211793 ?auto_211792 ) ( not ( = ?auto_211794 ?auto_211792 ) ) ( not ( = ?auto_211794 ?auto_211793 ) ) ( not ( = ?auto_211794 ?auto_211790 ) ) ( not ( = ?auto_211794 ?auto_211789 ) ) ( not ( = ?auto_211792 ?auto_211793 ) ) ( not ( = ?auto_211792 ?auto_211790 ) ) ( not ( = ?auto_211792 ?auto_211789 ) ) ( not ( = ?auto_211786 ?auto_211794 ) ) ( not ( = ?auto_211786 ?auto_211792 ) ) ( not ( = ?auto_211787 ?auto_211794 ) ) ( not ( = ?auto_211787 ?auto_211792 ) ) ( not ( = ?auto_211788 ?auto_211794 ) ) ( not ( = ?auto_211788 ?auto_211792 ) ) ( ON ?auto_211786 ?auto_211791 ) ( not ( = ?auto_211786 ?auto_211791 ) ) ( not ( = ?auto_211787 ?auto_211791 ) ) ( not ( = ?auto_211788 ?auto_211791 ) ) ( not ( = ?auto_211789 ?auto_211791 ) ) ( not ( = ?auto_211790 ?auto_211791 ) ) ( not ( = ?auto_211793 ?auto_211791 ) ) ( not ( = ?auto_211794 ?auto_211791 ) ) ( not ( = ?auto_211792 ?auto_211791 ) ) ( ON ?auto_211787 ?auto_211786 ) ( ON-TABLE ?auto_211791 ) ( ON ?auto_211788 ?auto_211787 ) ( ON ?auto_211789 ?auto_211788 ) ( CLEAR ?auto_211789 ) ( HOLDING ?auto_211790 ) ( CLEAR ?auto_211793 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_211794 ?auto_211792 ?auto_211793 ?auto_211790 )
      ( MAKE-5PILE ?auto_211786 ?auto_211787 ?auto_211788 ?auto_211789 ?auto_211790 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211795 - BLOCK
      ?auto_211796 - BLOCK
      ?auto_211797 - BLOCK
      ?auto_211798 - BLOCK
      ?auto_211799 - BLOCK
    )
    :vars
    (
      ?auto_211802 - BLOCK
      ?auto_211801 - BLOCK
      ?auto_211803 - BLOCK
      ?auto_211800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211795 ?auto_211796 ) ) ( not ( = ?auto_211795 ?auto_211797 ) ) ( not ( = ?auto_211795 ?auto_211798 ) ) ( not ( = ?auto_211795 ?auto_211799 ) ) ( not ( = ?auto_211796 ?auto_211797 ) ) ( not ( = ?auto_211796 ?auto_211798 ) ) ( not ( = ?auto_211796 ?auto_211799 ) ) ( not ( = ?auto_211797 ?auto_211798 ) ) ( not ( = ?auto_211797 ?auto_211799 ) ) ( not ( = ?auto_211798 ?auto_211799 ) ) ( not ( = ?auto_211795 ?auto_211802 ) ) ( not ( = ?auto_211796 ?auto_211802 ) ) ( not ( = ?auto_211797 ?auto_211802 ) ) ( not ( = ?auto_211798 ?auto_211802 ) ) ( not ( = ?auto_211799 ?auto_211802 ) ) ( ON-TABLE ?auto_211801 ) ( ON ?auto_211803 ?auto_211801 ) ( ON ?auto_211802 ?auto_211803 ) ( not ( = ?auto_211801 ?auto_211803 ) ) ( not ( = ?auto_211801 ?auto_211802 ) ) ( not ( = ?auto_211801 ?auto_211799 ) ) ( not ( = ?auto_211801 ?auto_211798 ) ) ( not ( = ?auto_211803 ?auto_211802 ) ) ( not ( = ?auto_211803 ?auto_211799 ) ) ( not ( = ?auto_211803 ?auto_211798 ) ) ( not ( = ?auto_211795 ?auto_211801 ) ) ( not ( = ?auto_211795 ?auto_211803 ) ) ( not ( = ?auto_211796 ?auto_211801 ) ) ( not ( = ?auto_211796 ?auto_211803 ) ) ( not ( = ?auto_211797 ?auto_211801 ) ) ( not ( = ?auto_211797 ?auto_211803 ) ) ( ON ?auto_211795 ?auto_211800 ) ( not ( = ?auto_211795 ?auto_211800 ) ) ( not ( = ?auto_211796 ?auto_211800 ) ) ( not ( = ?auto_211797 ?auto_211800 ) ) ( not ( = ?auto_211798 ?auto_211800 ) ) ( not ( = ?auto_211799 ?auto_211800 ) ) ( not ( = ?auto_211802 ?auto_211800 ) ) ( not ( = ?auto_211801 ?auto_211800 ) ) ( not ( = ?auto_211803 ?auto_211800 ) ) ( ON ?auto_211796 ?auto_211795 ) ( ON-TABLE ?auto_211800 ) ( ON ?auto_211797 ?auto_211796 ) ( ON ?auto_211798 ?auto_211797 ) ( CLEAR ?auto_211802 ) ( ON ?auto_211799 ?auto_211798 ) ( CLEAR ?auto_211799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211800 ?auto_211795 ?auto_211796 ?auto_211797 ?auto_211798 )
      ( MAKE-5PILE ?auto_211795 ?auto_211796 ?auto_211797 ?auto_211798 ?auto_211799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211804 - BLOCK
      ?auto_211805 - BLOCK
      ?auto_211806 - BLOCK
      ?auto_211807 - BLOCK
      ?auto_211808 - BLOCK
    )
    :vars
    (
      ?auto_211812 - BLOCK
      ?auto_211810 - BLOCK
      ?auto_211811 - BLOCK
      ?auto_211809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211804 ?auto_211805 ) ) ( not ( = ?auto_211804 ?auto_211806 ) ) ( not ( = ?auto_211804 ?auto_211807 ) ) ( not ( = ?auto_211804 ?auto_211808 ) ) ( not ( = ?auto_211805 ?auto_211806 ) ) ( not ( = ?auto_211805 ?auto_211807 ) ) ( not ( = ?auto_211805 ?auto_211808 ) ) ( not ( = ?auto_211806 ?auto_211807 ) ) ( not ( = ?auto_211806 ?auto_211808 ) ) ( not ( = ?auto_211807 ?auto_211808 ) ) ( not ( = ?auto_211804 ?auto_211812 ) ) ( not ( = ?auto_211805 ?auto_211812 ) ) ( not ( = ?auto_211806 ?auto_211812 ) ) ( not ( = ?auto_211807 ?auto_211812 ) ) ( not ( = ?auto_211808 ?auto_211812 ) ) ( ON-TABLE ?auto_211810 ) ( ON ?auto_211811 ?auto_211810 ) ( not ( = ?auto_211810 ?auto_211811 ) ) ( not ( = ?auto_211810 ?auto_211812 ) ) ( not ( = ?auto_211810 ?auto_211808 ) ) ( not ( = ?auto_211810 ?auto_211807 ) ) ( not ( = ?auto_211811 ?auto_211812 ) ) ( not ( = ?auto_211811 ?auto_211808 ) ) ( not ( = ?auto_211811 ?auto_211807 ) ) ( not ( = ?auto_211804 ?auto_211810 ) ) ( not ( = ?auto_211804 ?auto_211811 ) ) ( not ( = ?auto_211805 ?auto_211810 ) ) ( not ( = ?auto_211805 ?auto_211811 ) ) ( not ( = ?auto_211806 ?auto_211810 ) ) ( not ( = ?auto_211806 ?auto_211811 ) ) ( ON ?auto_211804 ?auto_211809 ) ( not ( = ?auto_211804 ?auto_211809 ) ) ( not ( = ?auto_211805 ?auto_211809 ) ) ( not ( = ?auto_211806 ?auto_211809 ) ) ( not ( = ?auto_211807 ?auto_211809 ) ) ( not ( = ?auto_211808 ?auto_211809 ) ) ( not ( = ?auto_211812 ?auto_211809 ) ) ( not ( = ?auto_211810 ?auto_211809 ) ) ( not ( = ?auto_211811 ?auto_211809 ) ) ( ON ?auto_211805 ?auto_211804 ) ( ON-TABLE ?auto_211809 ) ( ON ?auto_211806 ?auto_211805 ) ( ON ?auto_211807 ?auto_211806 ) ( ON ?auto_211808 ?auto_211807 ) ( CLEAR ?auto_211808 ) ( HOLDING ?auto_211812 ) ( CLEAR ?auto_211811 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211810 ?auto_211811 ?auto_211812 )
      ( MAKE-5PILE ?auto_211804 ?auto_211805 ?auto_211806 ?auto_211807 ?auto_211808 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211813 - BLOCK
      ?auto_211814 - BLOCK
      ?auto_211815 - BLOCK
      ?auto_211816 - BLOCK
      ?auto_211817 - BLOCK
    )
    :vars
    (
      ?auto_211819 - BLOCK
      ?auto_211818 - BLOCK
      ?auto_211820 - BLOCK
      ?auto_211821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211813 ?auto_211814 ) ) ( not ( = ?auto_211813 ?auto_211815 ) ) ( not ( = ?auto_211813 ?auto_211816 ) ) ( not ( = ?auto_211813 ?auto_211817 ) ) ( not ( = ?auto_211814 ?auto_211815 ) ) ( not ( = ?auto_211814 ?auto_211816 ) ) ( not ( = ?auto_211814 ?auto_211817 ) ) ( not ( = ?auto_211815 ?auto_211816 ) ) ( not ( = ?auto_211815 ?auto_211817 ) ) ( not ( = ?auto_211816 ?auto_211817 ) ) ( not ( = ?auto_211813 ?auto_211819 ) ) ( not ( = ?auto_211814 ?auto_211819 ) ) ( not ( = ?auto_211815 ?auto_211819 ) ) ( not ( = ?auto_211816 ?auto_211819 ) ) ( not ( = ?auto_211817 ?auto_211819 ) ) ( ON-TABLE ?auto_211818 ) ( ON ?auto_211820 ?auto_211818 ) ( not ( = ?auto_211818 ?auto_211820 ) ) ( not ( = ?auto_211818 ?auto_211819 ) ) ( not ( = ?auto_211818 ?auto_211817 ) ) ( not ( = ?auto_211818 ?auto_211816 ) ) ( not ( = ?auto_211820 ?auto_211819 ) ) ( not ( = ?auto_211820 ?auto_211817 ) ) ( not ( = ?auto_211820 ?auto_211816 ) ) ( not ( = ?auto_211813 ?auto_211818 ) ) ( not ( = ?auto_211813 ?auto_211820 ) ) ( not ( = ?auto_211814 ?auto_211818 ) ) ( not ( = ?auto_211814 ?auto_211820 ) ) ( not ( = ?auto_211815 ?auto_211818 ) ) ( not ( = ?auto_211815 ?auto_211820 ) ) ( ON ?auto_211813 ?auto_211821 ) ( not ( = ?auto_211813 ?auto_211821 ) ) ( not ( = ?auto_211814 ?auto_211821 ) ) ( not ( = ?auto_211815 ?auto_211821 ) ) ( not ( = ?auto_211816 ?auto_211821 ) ) ( not ( = ?auto_211817 ?auto_211821 ) ) ( not ( = ?auto_211819 ?auto_211821 ) ) ( not ( = ?auto_211818 ?auto_211821 ) ) ( not ( = ?auto_211820 ?auto_211821 ) ) ( ON ?auto_211814 ?auto_211813 ) ( ON-TABLE ?auto_211821 ) ( ON ?auto_211815 ?auto_211814 ) ( ON ?auto_211816 ?auto_211815 ) ( ON ?auto_211817 ?auto_211816 ) ( CLEAR ?auto_211820 ) ( ON ?auto_211819 ?auto_211817 ) ( CLEAR ?auto_211819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211821 ?auto_211813 ?auto_211814 ?auto_211815 ?auto_211816 ?auto_211817 )
      ( MAKE-5PILE ?auto_211813 ?auto_211814 ?auto_211815 ?auto_211816 ?auto_211817 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211822 - BLOCK
      ?auto_211823 - BLOCK
      ?auto_211824 - BLOCK
      ?auto_211825 - BLOCK
      ?auto_211826 - BLOCK
    )
    :vars
    (
      ?auto_211829 - BLOCK
      ?auto_211830 - BLOCK
      ?auto_211828 - BLOCK
      ?auto_211827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211822 ?auto_211823 ) ) ( not ( = ?auto_211822 ?auto_211824 ) ) ( not ( = ?auto_211822 ?auto_211825 ) ) ( not ( = ?auto_211822 ?auto_211826 ) ) ( not ( = ?auto_211823 ?auto_211824 ) ) ( not ( = ?auto_211823 ?auto_211825 ) ) ( not ( = ?auto_211823 ?auto_211826 ) ) ( not ( = ?auto_211824 ?auto_211825 ) ) ( not ( = ?auto_211824 ?auto_211826 ) ) ( not ( = ?auto_211825 ?auto_211826 ) ) ( not ( = ?auto_211822 ?auto_211829 ) ) ( not ( = ?auto_211823 ?auto_211829 ) ) ( not ( = ?auto_211824 ?auto_211829 ) ) ( not ( = ?auto_211825 ?auto_211829 ) ) ( not ( = ?auto_211826 ?auto_211829 ) ) ( ON-TABLE ?auto_211830 ) ( not ( = ?auto_211830 ?auto_211828 ) ) ( not ( = ?auto_211830 ?auto_211829 ) ) ( not ( = ?auto_211830 ?auto_211826 ) ) ( not ( = ?auto_211830 ?auto_211825 ) ) ( not ( = ?auto_211828 ?auto_211829 ) ) ( not ( = ?auto_211828 ?auto_211826 ) ) ( not ( = ?auto_211828 ?auto_211825 ) ) ( not ( = ?auto_211822 ?auto_211830 ) ) ( not ( = ?auto_211822 ?auto_211828 ) ) ( not ( = ?auto_211823 ?auto_211830 ) ) ( not ( = ?auto_211823 ?auto_211828 ) ) ( not ( = ?auto_211824 ?auto_211830 ) ) ( not ( = ?auto_211824 ?auto_211828 ) ) ( ON ?auto_211822 ?auto_211827 ) ( not ( = ?auto_211822 ?auto_211827 ) ) ( not ( = ?auto_211823 ?auto_211827 ) ) ( not ( = ?auto_211824 ?auto_211827 ) ) ( not ( = ?auto_211825 ?auto_211827 ) ) ( not ( = ?auto_211826 ?auto_211827 ) ) ( not ( = ?auto_211829 ?auto_211827 ) ) ( not ( = ?auto_211830 ?auto_211827 ) ) ( not ( = ?auto_211828 ?auto_211827 ) ) ( ON ?auto_211823 ?auto_211822 ) ( ON-TABLE ?auto_211827 ) ( ON ?auto_211824 ?auto_211823 ) ( ON ?auto_211825 ?auto_211824 ) ( ON ?auto_211826 ?auto_211825 ) ( ON ?auto_211829 ?auto_211826 ) ( CLEAR ?auto_211829 ) ( HOLDING ?auto_211828 ) ( CLEAR ?auto_211830 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211830 ?auto_211828 )
      ( MAKE-5PILE ?auto_211822 ?auto_211823 ?auto_211824 ?auto_211825 ?auto_211826 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211831 - BLOCK
      ?auto_211832 - BLOCK
      ?auto_211833 - BLOCK
      ?auto_211834 - BLOCK
      ?auto_211835 - BLOCK
    )
    :vars
    (
      ?auto_211836 - BLOCK
      ?auto_211838 - BLOCK
      ?auto_211837 - BLOCK
      ?auto_211839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211831 ?auto_211832 ) ) ( not ( = ?auto_211831 ?auto_211833 ) ) ( not ( = ?auto_211831 ?auto_211834 ) ) ( not ( = ?auto_211831 ?auto_211835 ) ) ( not ( = ?auto_211832 ?auto_211833 ) ) ( not ( = ?auto_211832 ?auto_211834 ) ) ( not ( = ?auto_211832 ?auto_211835 ) ) ( not ( = ?auto_211833 ?auto_211834 ) ) ( not ( = ?auto_211833 ?auto_211835 ) ) ( not ( = ?auto_211834 ?auto_211835 ) ) ( not ( = ?auto_211831 ?auto_211836 ) ) ( not ( = ?auto_211832 ?auto_211836 ) ) ( not ( = ?auto_211833 ?auto_211836 ) ) ( not ( = ?auto_211834 ?auto_211836 ) ) ( not ( = ?auto_211835 ?auto_211836 ) ) ( ON-TABLE ?auto_211838 ) ( not ( = ?auto_211838 ?auto_211837 ) ) ( not ( = ?auto_211838 ?auto_211836 ) ) ( not ( = ?auto_211838 ?auto_211835 ) ) ( not ( = ?auto_211838 ?auto_211834 ) ) ( not ( = ?auto_211837 ?auto_211836 ) ) ( not ( = ?auto_211837 ?auto_211835 ) ) ( not ( = ?auto_211837 ?auto_211834 ) ) ( not ( = ?auto_211831 ?auto_211838 ) ) ( not ( = ?auto_211831 ?auto_211837 ) ) ( not ( = ?auto_211832 ?auto_211838 ) ) ( not ( = ?auto_211832 ?auto_211837 ) ) ( not ( = ?auto_211833 ?auto_211838 ) ) ( not ( = ?auto_211833 ?auto_211837 ) ) ( ON ?auto_211831 ?auto_211839 ) ( not ( = ?auto_211831 ?auto_211839 ) ) ( not ( = ?auto_211832 ?auto_211839 ) ) ( not ( = ?auto_211833 ?auto_211839 ) ) ( not ( = ?auto_211834 ?auto_211839 ) ) ( not ( = ?auto_211835 ?auto_211839 ) ) ( not ( = ?auto_211836 ?auto_211839 ) ) ( not ( = ?auto_211838 ?auto_211839 ) ) ( not ( = ?auto_211837 ?auto_211839 ) ) ( ON ?auto_211832 ?auto_211831 ) ( ON-TABLE ?auto_211839 ) ( ON ?auto_211833 ?auto_211832 ) ( ON ?auto_211834 ?auto_211833 ) ( ON ?auto_211835 ?auto_211834 ) ( ON ?auto_211836 ?auto_211835 ) ( CLEAR ?auto_211838 ) ( ON ?auto_211837 ?auto_211836 ) ( CLEAR ?auto_211837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211839 ?auto_211831 ?auto_211832 ?auto_211833 ?auto_211834 ?auto_211835 ?auto_211836 )
      ( MAKE-5PILE ?auto_211831 ?auto_211832 ?auto_211833 ?auto_211834 ?auto_211835 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211840 - BLOCK
      ?auto_211841 - BLOCK
      ?auto_211842 - BLOCK
      ?auto_211843 - BLOCK
      ?auto_211844 - BLOCK
    )
    :vars
    (
      ?auto_211848 - BLOCK
      ?auto_211845 - BLOCK
      ?auto_211846 - BLOCK
      ?auto_211847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211840 ?auto_211841 ) ) ( not ( = ?auto_211840 ?auto_211842 ) ) ( not ( = ?auto_211840 ?auto_211843 ) ) ( not ( = ?auto_211840 ?auto_211844 ) ) ( not ( = ?auto_211841 ?auto_211842 ) ) ( not ( = ?auto_211841 ?auto_211843 ) ) ( not ( = ?auto_211841 ?auto_211844 ) ) ( not ( = ?auto_211842 ?auto_211843 ) ) ( not ( = ?auto_211842 ?auto_211844 ) ) ( not ( = ?auto_211843 ?auto_211844 ) ) ( not ( = ?auto_211840 ?auto_211848 ) ) ( not ( = ?auto_211841 ?auto_211848 ) ) ( not ( = ?auto_211842 ?auto_211848 ) ) ( not ( = ?auto_211843 ?auto_211848 ) ) ( not ( = ?auto_211844 ?auto_211848 ) ) ( not ( = ?auto_211845 ?auto_211846 ) ) ( not ( = ?auto_211845 ?auto_211848 ) ) ( not ( = ?auto_211845 ?auto_211844 ) ) ( not ( = ?auto_211845 ?auto_211843 ) ) ( not ( = ?auto_211846 ?auto_211848 ) ) ( not ( = ?auto_211846 ?auto_211844 ) ) ( not ( = ?auto_211846 ?auto_211843 ) ) ( not ( = ?auto_211840 ?auto_211845 ) ) ( not ( = ?auto_211840 ?auto_211846 ) ) ( not ( = ?auto_211841 ?auto_211845 ) ) ( not ( = ?auto_211841 ?auto_211846 ) ) ( not ( = ?auto_211842 ?auto_211845 ) ) ( not ( = ?auto_211842 ?auto_211846 ) ) ( ON ?auto_211840 ?auto_211847 ) ( not ( = ?auto_211840 ?auto_211847 ) ) ( not ( = ?auto_211841 ?auto_211847 ) ) ( not ( = ?auto_211842 ?auto_211847 ) ) ( not ( = ?auto_211843 ?auto_211847 ) ) ( not ( = ?auto_211844 ?auto_211847 ) ) ( not ( = ?auto_211848 ?auto_211847 ) ) ( not ( = ?auto_211845 ?auto_211847 ) ) ( not ( = ?auto_211846 ?auto_211847 ) ) ( ON ?auto_211841 ?auto_211840 ) ( ON-TABLE ?auto_211847 ) ( ON ?auto_211842 ?auto_211841 ) ( ON ?auto_211843 ?auto_211842 ) ( ON ?auto_211844 ?auto_211843 ) ( ON ?auto_211848 ?auto_211844 ) ( ON ?auto_211846 ?auto_211848 ) ( CLEAR ?auto_211846 ) ( HOLDING ?auto_211845 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_211845 )
      ( MAKE-5PILE ?auto_211840 ?auto_211841 ?auto_211842 ?auto_211843 ?auto_211844 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_211849 - BLOCK
      ?auto_211850 - BLOCK
      ?auto_211851 - BLOCK
      ?auto_211852 - BLOCK
      ?auto_211853 - BLOCK
    )
    :vars
    (
      ?auto_211854 - BLOCK
      ?auto_211855 - BLOCK
      ?auto_211857 - BLOCK
      ?auto_211856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211849 ?auto_211850 ) ) ( not ( = ?auto_211849 ?auto_211851 ) ) ( not ( = ?auto_211849 ?auto_211852 ) ) ( not ( = ?auto_211849 ?auto_211853 ) ) ( not ( = ?auto_211850 ?auto_211851 ) ) ( not ( = ?auto_211850 ?auto_211852 ) ) ( not ( = ?auto_211850 ?auto_211853 ) ) ( not ( = ?auto_211851 ?auto_211852 ) ) ( not ( = ?auto_211851 ?auto_211853 ) ) ( not ( = ?auto_211852 ?auto_211853 ) ) ( not ( = ?auto_211849 ?auto_211854 ) ) ( not ( = ?auto_211850 ?auto_211854 ) ) ( not ( = ?auto_211851 ?auto_211854 ) ) ( not ( = ?auto_211852 ?auto_211854 ) ) ( not ( = ?auto_211853 ?auto_211854 ) ) ( not ( = ?auto_211855 ?auto_211857 ) ) ( not ( = ?auto_211855 ?auto_211854 ) ) ( not ( = ?auto_211855 ?auto_211853 ) ) ( not ( = ?auto_211855 ?auto_211852 ) ) ( not ( = ?auto_211857 ?auto_211854 ) ) ( not ( = ?auto_211857 ?auto_211853 ) ) ( not ( = ?auto_211857 ?auto_211852 ) ) ( not ( = ?auto_211849 ?auto_211855 ) ) ( not ( = ?auto_211849 ?auto_211857 ) ) ( not ( = ?auto_211850 ?auto_211855 ) ) ( not ( = ?auto_211850 ?auto_211857 ) ) ( not ( = ?auto_211851 ?auto_211855 ) ) ( not ( = ?auto_211851 ?auto_211857 ) ) ( ON ?auto_211849 ?auto_211856 ) ( not ( = ?auto_211849 ?auto_211856 ) ) ( not ( = ?auto_211850 ?auto_211856 ) ) ( not ( = ?auto_211851 ?auto_211856 ) ) ( not ( = ?auto_211852 ?auto_211856 ) ) ( not ( = ?auto_211853 ?auto_211856 ) ) ( not ( = ?auto_211854 ?auto_211856 ) ) ( not ( = ?auto_211855 ?auto_211856 ) ) ( not ( = ?auto_211857 ?auto_211856 ) ) ( ON ?auto_211850 ?auto_211849 ) ( ON-TABLE ?auto_211856 ) ( ON ?auto_211851 ?auto_211850 ) ( ON ?auto_211852 ?auto_211851 ) ( ON ?auto_211853 ?auto_211852 ) ( ON ?auto_211854 ?auto_211853 ) ( ON ?auto_211857 ?auto_211854 ) ( ON ?auto_211855 ?auto_211857 ) ( CLEAR ?auto_211855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_211856 ?auto_211849 ?auto_211850 ?auto_211851 ?auto_211852 ?auto_211853 ?auto_211854 ?auto_211857 )
      ( MAKE-5PILE ?auto_211849 ?auto_211850 ?auto_211851 ?auto_211852 ?auto_211853 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211860 - BLOCK
      ?auto_211861 - BLOCK
    )
    :vars
    (
      ?auto_211862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211862 ?auto_211861 ) ( CLEAR ?auto_211862 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211860 ) ( ON ?auto_211861 ?auto_211860 ) ( not ( = ?auto_211860 ?auto_211861 ) ) ( not ( = ?auto_211860 ?auto_211862 ) ) ( not ( = ?auto_211861 ?auto_211862 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_211862 ?auto_211861 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211863 - BLOCK
      ?auto_211864 - BLOCK
    )
    :vars
    (
      ?auto_211865 - BLOCK
      ?auto_211866 - BLOCK
      ?auto_211867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211865 ?auto_211864 ) ( CLEAR ?auto_211865 ) ( ON-TABLE ?auto_211863 ) ( ON ?auto_211864 ?auto_211863 ) ( not ( = ?auto_211863 ?auto_211864 ) ) ( not ( = ?auto_211863 ?auto_211865 ) ) ( not ( = ?auto_211864 ?auto_211865 ) ) ( HOLDING ?auto_211866 ) ( CLEAR ?auto_211867 ) ( not ( = ?auto_211863 ?auto_211866 ) ) ( not ( = ?auto_211863 ?auto_211867 ) ) ( not ( = ?auto_211864 ?auto_211866 ) ) ( not ( = ?auto_211864 ?auto_211867 ) ) ( not ( = ?auto_211865 ?auto_211866 ) ) ( not ( = ?auto_211865 ?auto_211867 ) ) ( not ( = ?auto_211866 ?auto_211867 ) ) )
    :subtasks
    ( ( !STACK ?auto_211866 ?auto_211867 )
      ( MAKE-2PILE ?auto_211863 ?auto_211864 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211868 - BLOCK
      ?auto_211869 - BLOCK
    )
    :vars
    (
      ?auto_211872 - BLOCK
      ?auto_211870 - BLOCK
      ?auto_211871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211872 ?auto_211869 ) ( ON-TABLE ?auto_211868 ) ( ON ?auto_211869 ?auto_211868 ) ( not ( = ?auto_211868 ?auto_211869 ) ) ( not ( = ?auto_211868 ?auto_211872 ) ) ( not ( = ?auto_211869 ?auto_211872 ) ) ( CLEAR ?auto_211870 ) ( not ( = ?auto_211868 ?auto_211871 ) ) ( not ( = ?auto_211868 ?auto_211870 ) ) ( not ( = ?auto_211869 ?auto_211871 ) ) ( not ( = ?auto_211869 ?auto_211870 ) ) ( not ( = ?auto_211872 ?auto_211871 ) ) ( not ( = ?auto_211872 ?auto_211870 ) ) ( not ( = ?auto_211871 ?auto_211870 ) ) ( ON ?auto_211871 ?auto_211872 ) ( CLEAR ?auto_211871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211868 ?auto_211869 ?auto_211872 )
      ( MAKE-2PILE ?auto_211868 ?auto_211869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211873 - BLOCK
      ?auto_211874 - BLOCK
    )
    :vars
    (
      ?auto_211876 - BLOCK
      ?auto_211875 - BLOCK
      ?auto_211877 - BLOCK
      ?auto_211878 - BLOCK
      ?auto_211879 - BLOCK
      ?auto_211880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211876 ?auto_211874 ) ( ON-TABLE ?auto_211873 ) ( ON ?auto_211874 ?auto_211873 ) ( not ( = ?auto_211873 ?auto_211874 ) ) ( not ( = ?auto_211873 ?auto_211876 ) ) ( not ( = ?auto_211874 ?auto_211876 ) ) ( not ( = ?auto_211873 ?auto_211875 ) ) ( not ( = ?auto_211873 ?auto_211877 ) ) ( not ( = ?auto_211874 ?auto_211875 ) ) ( not ( = ?auto_211874 ?auto_211877 ) ) ( not ( = ?auto_211876 ?auto_211875 ) ) ( not ( = ?auto_211876 ?auto_211877 ) ) ( not ( = ?auto_211875 ?auto_211877 ) ) ( ON ?auto_211875 ?auto_211876 ) ( CLEAR ?auto_211875 ) ( HOLDING ?auto_211877 ) ( CLEAR ?auto_211878 ) ( ON-TABLE ?auto_211879 ) ( ON ?auto_211880 ?auto_211879 ) ( ON ?auto_211878 ?auto_211880 ) ( not ( = ?auto_211879 ?auto_211880 ) ) ( not ( = ?auto_211879 ?auto_211878 ) ) ( not ( = ?auto_211879 ?auto_211877 ) ) ( not ( = ?auto_211880 ?auto_211878 ) ) ( not ( = ?auto_211880 ?auto_211877 ) ) ( not ( = ?auto_211878 ?auto_211877 ) ) ( not ( = ?auto_211873 ?auto_211878 ) ) ( not ( = ?auto_211873 ?auto_211879 ) ) ( not ( = ?auto_211873 ?auto_211880 ) ) ( not ( = ?auto_211874 ?auto_211878 ) ) ( not ( = ?auto_211874 ?auto_211879 ) ) ( not ( = ?auto_211874 ?auto_211880 ) ) ( not ( = ?auto_211876 ?auto_211878 ) ) ( not ( = ?auto_211876 ?auto_211879 ) ) ( not ( = ?auto_211876 ?auto_211880 ) ) ( not ( = ?auto_211875 ?auto_211878 ) ) ( not ( = ?auto_211875 ?auto_211879 ) ) ( not ( = ?auto_211875 ?auto_211880 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_211879 ?auto_211880 ?auto_211878 ?auto_211877 )
      ( MAKE-2PILE ?auto_211873 ?auto_211874 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211881 - BLOCK
      ?auto_211882 - BLOCK
    )
    :vars
    (
      ?auto_211886 - BLOCK
      ?auto_211887 - BLOCK
      ?auto_211888 - BLOCK
      ?auto_211884 - BLOCK
      ?auto_211885 - BLOCK
      ?auto_211883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211886 ?auto_211882 ) ( ON-TABLE ?auto_211881 ) ( ON ?auto_211882 ?auto_211881 ) ( not ( = ?auto_211881 ?auto_211882 ) ) ( not ( = ?auto_211881 ?auto_211886 ) ) ( not ( = ?auto_211882 ?auto_211886 ) ) ( not ( = ?auto_211881 ?auto_211887 ) ) ( not ( = ?auto_211881 ?auto_211888 ) ) ( not ( = ?auto_211882 ?auto_211887 ) ) ( not ( = ?auto_211882 ?auto_211888 ) ) ( not ( = ?auto_211886 ?auto_211887 ) ) ( not ( = ?auto_211886 ?auto_211888 ) ) ( not ( = ?auto_211887 ?auto_211888 ) ) ( ON ?auto_211887 ?auto_211886 ) ( CLEAR ?auto_211884 ) ( ON-TABLE ?auto_211885 ) ( ON ?auto_211883 ?auto_211885 ) ( ON ?auto_211884 ?auto_211883 ) ( not ( = ?auto_211885 ?auto_211883 ) ) ( not ( = ?auto_211885 ?auto_211884 ) ) ( not ( = ?auto_211885 ?auto_211888 ) ) ( not ( = ?auto_211883 ?auto_211884 ) ) ( not ( = ?auto_211883 ?auto_211888 ) ) ( not ( = ?auto_211884 ?auto_211888 ) ) ( not ( = ?auto_211881 ?auto_211884 ) ) ( not ( = ?auto_211881 ?auto_211885 ) ) ( not ( = ?auto_211881 ?auto_211883 ) ) ( not ( = ?auto_211882 ?auto_211884 ) ) ( not ( = ?auto_211882 ?auto_211885 ) ) ( not ( = ?auto_211882 ?auto_211883 ) ) ( not ( = ?auto_211886 ?auto_211884 ) ) ( not ( = ?auto_211886 ?auto_211885 ) ) ( not ( = ?auto_211886 ?auto_211883 ) ) ( not ( = ?auto_211887 ?auto_211884 ) ) ( not ( = ?auto_211887 ?auto_211885 ) ) ( not ( = ?auto_211887 ?auto_211883 ) ) ( ON ?auto_211888 ?auto_211887 ) ( CLEAR ?auto_211888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_211881 ?auto_211882 ?auto_211886 ?auto_211887 )
      ( MAKE-2PILE ?auto_211881 ?auto_211882 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211889 - BLOCK
      ?auto_211890 - BLOCK
    )
    :vars
    (
      ?auto_211894 - BLOCK
      ?auto_211892 - BLOCK
      ?auto_211896 - BLOCK
      ?auto_211891 - BLOCK
      ?auto_211895 - BLOCK
      ?auto_211893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211894 ?auto_211890 ) ( ON-TABLE ?auto_211889 ) ( ON ?auto_211890 ?auto_211889 ) ( not ( = ?auto_211889 ?auto_211890 ) ) ( not ( = ?auto_211889 ?auto_211894 ) ) ( not ( = ?auto_211890 ?auto_211894 ) ) ( not ( = ?auto_211889 ?auto_211892 ) ) ( not ( = ?auto_211889 ?auto_211896 ) ) ( not ( = ?auto_211890 ?auto_211892 ) ) ( not ( = ?auto_211890 ?auto_211896 ) ) ( not ( = ?auto_211894 ?auto_211892 ) ) ( not ( = ?auto_211894 ?auto_211896 ) ) ( not ( = ?auto_211892 ?auto_211896 ) ) ( ON ?auto_211892 ?auto_211894 ) ( ON-TABLE ?auto_211891 ) ( ON ?auto_211895 ?auto_211891 ) ( not ( = ?auto_211891 ?auto_211895 ) ) ( not ( = ?auto_211891 ?auto_211893 ) ) ( not ( = ?auto_211891 ?auto_211896 ) ) ( not ( = ?auto_211895 ?auto_211893 ) ) ( not ( = ?auto_211895 ?auto_211896 ) ) ( not ( = ?auto_211893 ?auto_211896 ) ) ( not ( = ?auto_211889 ?auto_211893 ) ) ( not ( = ?auto_211889 ?auto_211891 ) ) ( not ( = ?auto_211889 ?auto_211895 ) ) ( not ( = ?auto_211890 ?auto_211893 ) ) ( not ( = ?auto_211890 ?auto_211891 ) ) ( not ( = ?auto_211890 ?auto_211895 ) ) ( not ( = ?auto_211894 ?auto_211893 ) ) ( not ( = ?auto_211894 ?auto_211891 ) ) ( not ( = ?auto_211894 ?auto_211895 ) ) ( not ( = ?auto_211892 ?auto_211893 ) ) ( not ( = ?auto_211892 ?auto_211891 ) ) ( not ( = ?auto_211892 ?auto_211895 ) ) ( ON ?auto_211896 ?auto_211892 ) ( CLEAR ?auto_211896 ) ( HOLDING ?auto_211893 ) ( CLEAR ?auto_211895 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211891 ?auto_211895 ?auto_211893 )
      ( MAKE-2PILE ?auto_211889 ?auto_211890 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211897 - BLOCK
      ?auto_211898 - BLOCK
    )
    :vars
    (
      ?auto_211901 - BLOCK
      ?auto_211902 - BLOCK
      ?auto_211903 - BLOCK
      ?auto_211904 - BLOCK
      ?auto_211899 - BLOCK
      ?auto_211900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211901 ?auto_211898 ) ( ON-TABLE ?auto_211897 ) ( ON ?auto_211898 ?auto_211897 ) ( not ( = ?auto_211897 ?auto_211898 ) ) ( not ( = ?auto_211897 ?auto_211901 ) ) ( not ( = ?auto_211898 ?auto_211901 ) ) ( not ( = ?auto_211897 ?auto_211902 ) ) ( not ( = ?auto_211897 ?auto_211903 ) ) ( not ( = ?auto_211898 ?auto_211902 ) ) ( not ( = ?auto_211898 ?auto_211903 ) ) ( not ( = ?auto_211901 ?auto_211902 ) ) ( not ( = ?auto_211901 ?auto_211903 ) ) ( not ( = ?auto_211902 ?auto_211903 ) ) ( ON ?auto_211902 ?auto_211901 ) ( ON-TABLE ?auto_211904 ) ( ON ?auto_211899 ?auto_211904 ) ( not ( = ?auto_211904 ?auto_211899 ) ) ( not ( = ?auto_211904 ?auto_211900 ) ) ( not ( = ?auto_211904 ?auto_211903 ) ) ( not ( = ?auto_211899 ?auto_211900 ) ) ( not ( = ?auto_211899 ?auto_211903 ) ) ( not ( = ?auto_211900 ?auto_211903 ) ) ( not ( = ?auto_211897 ?auto_211900 ) ) ( not ( = ?auto_211897 ?auto_211904 ) ) ( not ( = ?auto_211897 ?auto_211899 ) ) ( not ( = ?auto_211898 ?auto_211900 ) ) ( not ( = ?auto_211898 ?auto_211904 ) ) ( not ( = ?auto_211898 ?auto_211899 ) ) ( not ( = ?auto_211901 ?auto_211900 ) ) ( not ( = ?auto_211901 ?auto_211904 ) ) ( not ( = ?auto_211901 ?auto_211899 ) ) ( not ( = ?auto_211902 ?auto_211900 ) ) ( not ( = ?auto_211902 ?auto_211904 ) ) ( not ( = ?auto_211902 ?auto_211899 ) ) ( ON ?auto_211903 ?auto_211902 ) ( CLEAR ?auto_211899 ) ( ON ?auto_211900 ?auto_211903 ) ( CLEAR ?auto_211900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211897 ?auto_211898 ?auto_211901 ?auto_211902 ?auto_211903 )
      ( MAKE-2PILE ?auto_211897 ?auto_211898 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211905 - BLOCK
      ?auto_211906 - BLOCK
    )
    :vars
    (
      ?auto_211907 - BLOCK
      ?auto_211911 - BLOCK
      ?auto_211910 - BLOCK
      ?auto_211912 - BLOCK
      ?auto_211908 - BLOCK
      ?auto_211909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211907 ?auto_211906 ) ( ON-TABLE ?auto_211905 ) ( ON ?auto_211906 ?auto_211905 ) ( not ( = ?auto_211905 ?auto_211906 ) ) ( not ( = ?auto_211905 ?auto_211907 ) ) ( not ( = ?auto_211906 ?auto_211907 ) ) ( not ( = ?auto_211905 ?auto_211911 ) ) ( not ( = ?auto_211905 ?auto_211910 ) ) ( not ( = ?auto_211906 ?auto_211911 ) ) ( not ( = ?auto_211906 ?auto_211910 ) ) ( not ( = ?auto_211907 ?auto_211911 ) ) ( not ( = ?auto_211907 ?auto_211910 ) ) ( not ( = ?auto_211911 ?auto_211910 ) ) ( ON ?auto_211911 ?auto_211907 ) ( ON-TABLE ?auto_211912 ) ( not ( = ?auto_211912 ?auto_211908 ) ) ( not ( = ?auto_211912 ?auto_211909 ) ) ( not ( = ?auto_211912 ?auto_211910 ) ) ( not ( = ?auto_211908 ?auto_211909 ) ) ( not ( = ?auto_211908 ?auto_211910 ) ) ( not ( = ?auto_211909 ?auto_211910 ) ) ( not ( = ?auto_211905 ?auto_211909 ) ) ( not ( = ?auto_211905 ?auto_211912 ) ) ( not ( = ?auto_211905 ?auto_211908 ) ) ( not ( = ?auto_211906 ?auto_211909 ) ) ( not ( = ?auto_211906 ?auto_211912 ) ) ( not ( = ?auto_211906 ?auto_211908 ) ) ( not ( = ?auto_211907 ?auto_211909 ) ) ( not ( = ?auto_211907 ?auto_211912 ) ) ( not ( = ?auto_211907 ?auto_211908 ) ) ( not ( = ?auto_211911 ?auto_211909 ) ) ( not ( = ?auto_211911 ?auto_211912 ) ) ( not ( = ?auto_211911 ?auto_211908 ) ) ( ON ?auto_211910 ?auto_211911 ) ( ON ?auto_211909 ?auto_211910 ) ( CLEAR ?auto_211909 ) ( HOLDING ?auto_211908 ) ( CLEAR ?auto_211912 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211912 ?auto_211908 )
      ( MAKE-2PILE ?auto_211905 ?auto_211906 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211913 - BLOCK
      ?auto_211914 - BLOCK
    )
    :vars
    (
      ?auto_211915 - BLOCK
      ?auto_211917 - BLOCK
      ?auto_211916 - BLOCK
      ?auto_211919 - BLOCK
      ?auto_211920 - BLOCK
      ?auto_211918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211915 ?auto_211914 ) ( ON-TABLE ?auto_211913 ) ( ON ?auto_211914 ?auto_211913 ) ( not ( = ?auto_211913 ?auto_211914 ) ) ( not ( = ?auto_211913 ?auto_211915 ) ) ( not ( = ?auto_211914 ?auto_211915 ) ) ( not ( = ?auto_211913 ?auto_211917 ) ) ( not ( = ?auto_211913 ?auto_211916 ) ) ( not ( = ?auto_211914 ?auto_211917 ) ) ( not ( = ?auto_211914 ?auto_211916 ) ) ( not ( = ?auto_211915 ?auto_211917 ) ) ( not ( = ?auto_211915 ?auto_211916 ) ) ( not ( = ?auto_211917 ?auto_211916 ) ) ( ON ?auto_211917 ?auto_211915 ) ( ON-TABLE ?auto_211919 ) ( not ( = ?auto_211919 ?auto_211920 ) ) ( not ( = ?auto_211919 ?auto_211918 ) ) ( not ( = ?auto_211919 ?auto_211916 ) ) ( not ( = ?auto_211920 ?auto_211918 ) ) ( not ( = ?auto_211920 ?auto_211916 ) ) ( not ( = ?auto_211918 ?auto_211916 ) ) ( not ( = ?auto_211913 ?auto_211918 ) ) ( not ( = ?auto_211913 ?auto_211919 ) ) ( not ( = ?auto_211913 ?auto_211920 ) ) ( not ( = ?auto_211914 ?auto_211918 ) ) ( not ( = ?auto_211914 ?auto_211919 ) ) ( not ( = ?auto_211914 ?auto_211920 ) ) ( not ( = ?auto_211915 ?auto_211918 ) ) ( not ( = ?auto_211915 ?auto_211919 ) ) ( not ( = ?auto_211915 ?auto_211920 ) ) ( not ( = ?auto_211917 ?auto_211918 ) ) ( not ( = ?auto_211917 ?auto_211919 ) ) ( not ( = ?auto_211917 ?auto_211920 ) ) ( ON ?auto_211916 ?auto_211917 ) ( ON ?auto_211918 ?auto_211916 ) ( CLEAR ?auto_211919 ) ( ON ?auto_211920 ?auto_211918 ) ( CLEAR ?auto_211920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211913 ?auto_211914 ?auto_211915 ?auto_211917 ?auto_211916 ?auto_211918 )
      ( MAKE-2PILE ?auto_211913 ?auto_211914 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211921 - BLOCK
      ?auto_211922 - BLOCK
    )
    :vars
    (
      ?auto_211928 - BLOCK
      ?auto_211923 - BLOCK
      ?auto_211927 - BLOCK
      ?auto_211924 - BLOCK
      ?auto_211926 - BLOCK
      ?auto_211925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211928 ?auto_211922 ) ( ON-TABLE ?auto_211921 ) ( ON ?auto_211922 ?auto_211921 ) ( not ( = ?auto_211921 ?auto_211922 ) ) ( not ( = ?auto_211921 ?auto_211928 ) ) ( not ( = ?auto_211922 ?auto_211928 ) ) ( not ( = ?auto_211921 ?auto_211923 ) ) ( not ( = ?auto_211921 ?auto_211927 ) ) ( not ( = ?auto_211922 ?auto_211923 ) ) ( not ( = ?auto_211922 ?auto_211927 ) ) ( not ( = ?auto_211928 ?auto_211923 ) ) ( not ( = ?auto_211928 ?auto_211927 ) ) ( not ( = ?auto_211923 ?auto_211927 ) ) ( ON ?auto_211923 ?auto_211928 ) ( not ( = ?auto_211924 ?auto_211926 ) ) ( not ( = ?auto_211924 ?auto_211925 ) ) ( not ( = ?auto_211924 ?auto_211927 ) ) ( not ( = ?auto_211926 ?auto_211925 ) ) ( not ( = ?auto_211926 ?auto_211927 ) ) ( not ( = ?auto_211925 ?auto_211927 ) ) ( not ( = ?auto_211921 ?auto_211925 ) ) ( not ( = ?auto_211921 ?auto_211924 ) ) ( not ( = ?auto_211921 ?auto_211926 ) ) ( not ( = ?auto_211922 ?auto_211925 ) ) ( not ( = ?auto_211922 ?auto_211924 ) ) ( not ( = ?auto_211922 ?auto_211926 ) ) ( not ( = ?auto_211928 ?auto_211925 ) ) ( not ( = ?auto_211928 ?auto_211924 ) ) ( not ( = ?auto_211928 ?auto_211926 ) ) ( not ( = ?auto_211923 ?auto_211925 ) ) ( not ( = ?auto_211923 ?auto_211924 ) ) ( not ( = ?auto_211923 ?auto_211926 ) ) ( ON ?auto_211927 ?auto_211923 ) ( ON ?auto_211925 ?auto_211927 ) ( ON ?auto_211926 ?auto_211925 ) ( CLEAR ?auto_211926 ) ( HOLDING ?auto_211924 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_211924 )
      ( MAKE-2PILE ?auto_211921 ?auto_211922 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211929 - BLOCK
      ?auto_211930 - BLOCK
    )
    :vars
    (
      ?auto_211931 - BLOCK
      ?auto_211934 - BLOCK
      ?auto_211932 - BLOCK
      ?auto_211936 - BLOCK
      ?auto_211933 - BLOCK
      ?auto_211935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211931 ?auto_211930 ) ( ON-TABLE ?auto_211929 ) ( ON ?auto_211930 ?auto_211929 ) ( not ( = ?auto_211929 ?auto_211930 ) ) ( not ( = ?auto_211929 ?auto_211931 ) ) ( not ( = ?auto_211930 ?auto_211931 ) ) ( not ( = ?auto_211929 ?auto_211934 ) ) ( not ( = ?auto_211929 ?auto_211932 ) ) ( not ( = ?auto_211930 ?auto_211934 ) ) ( not ( = ?auto_211930 ?auto_211932 ) ) ( not ( = ?auto_211931 ?auto_211934 ) ) ( not ( = ?auto_211931 ?auto_211932 ) ) ( not ( = ?auto_211934 ?auto_211932 ) ) ( ON ?auto_211934 ?auto_211931 ) ( not ( = ?auto_211936 ?auto_211933 ) ) ( not ( = ?auto_211936 ?auto_211935 ) ) ( not ( = ?auto_211936 ?auto_211932 ) ) ( not ( = ?auto_211933 ?auto_211935 ) ) ( not ( = ?auto_211933 ?auto_211932 ) ) ( not ( = ?auto_211935 ?auto_211932 ) ) ( not ( = ?auto_211929 ?auto_211935 ) ) ( not ( = ?auto_211929 ?auto_211936 ) ) ( not ( = ?auto_211929 ?auto_211933 ) ) ( not ( = ?auto_211930 ?auto_211935 ) ) ( not ( = ?auto_211930 ?auto_211936 ) ) ( not ( = ?auto_211930 ?auto_211933 ) ) ( not ( = ?auto_211931 ?auto_211935 ) ) ( not ( = ?auto_211931 ?auto_211936 ) ) ( not ( = ?auto_211931 ?auto_211933 ) ) ( not ( = ?auto_211934 ?auto_211935 ) ) ( not ( = ?auto_211934 ?auto_211936 ) ) ( not ( = ?auto_211934 ?auto_211933 ) ) ( ON ?auto_211932 ?auto_211934 ) ( ON ?auto_211935 ?auto_211932 ) ( ON ?auto_211933 ?auto_211935 ) ( ON ?auto_211936 ?auto_211933 ) ( CLEAR ?auto_211936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211929 ?auto_211930 ?auto_211931 ?auto_211934 ?auto_211932 ?auto_211935 ?auto_211933 )
      ( MAKE-2PILE ?auto_211929 ?auto_211930 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211937 - BLOCK
      ?auto_211938 - BLOCK
    )
    :vars
    (
      ?auto_211941 - BLOCK
      ?auto_211942 - BLOCK
      ?auto_211943 - BLOCK
      ?auto_211944 - BLOCK
      ?auto_211939 - BLOCK
      ?auto_211940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211941 ?auto_211938 ) ( ON-TABLE ?auto_211937 ) ( ON ?auto_211938 ?auto_211937 ) ( not ( = ?auto_211937 ?auto_211938 ) ) ( not ( = ?auto_211937 ?auto_211941 ) ) ( not ( = ?auto_211938 ?auto_211941 ) ) ( not ( = ?auto_211937 ?auto_211942 ) ) ( not ( = ?auto_211937 ?auto_211943 ) ) ( not ( = ?auto_211938 ?auto_211942 ) ) ( not ( = ?auto_211938 ?auto_211943 ) ) ( not ( = ?auto_211941 ?auto_211942 ) ) ( not ( = ?auto_211941 ?auto_211943 ) ) ( not ( = ?auto_211942 ?auto_211943 ) ) ( ON ?auto_211942 ?auto_211941 ) ( not ( = ?auto_211944 ?auto_211939 ) ) ( not ( = ?auto_211944 ?auto_211940 ) ) ( not ( = ?auto_211944 ?auto_211943 ) ) ( not ( = ?auto_211939 ?auto_211940 ) ) ( not ( = ?auto_211939 ?auto_211943 ) ) ( not ( = ?auto_211940 ?auto_211943 ) ) ( not ( = ?auto_211937 ?auto_211940 ) ) ( not ( = ?auto_211937 ?auto_211944 ) ) ( not ( = ?auto_211937 ?auto_211939 ) ) ( not ( = ?auto_211938 ?auto_211940 ) ) ( not ( = ?auto_211938 ?auto_211944 ) ) ( not ( = ?auto_211938 ?auto_211939 ) ) ( not ( = ?auto_211941 ?auto_211940 ) ) ( not ( = ?auto_211941 ?auto_211944 ) ) ( not ( = ?auto_211941 ?auto_211939 ) ) ( not ( = ?auto_211942 ?auto_211940 ) ) ( not ( = ?auto_211942 ?auto_211944 ) ) ( not ( = ?auto_211942 ?auto_211939 ) ) ( ON ?auto_211943 ?auto_211942 ) ( ON ?auto_211940 ?auto_211943 ) ( ON ?auto_211939 ?auto_211940 ) ( HOLDING ?auto_211944 ) ( CLEAR ?auto_211939 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_211937 ?auto_211938 ?auto_211941 ?auto_211942 ?auto_211943 ?auto_211940 ?auto_211939 ?auto_211944 )
      ( MAKE-2PILE ?auto_211937 ?auto_211938 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211945 - BLOCK
      ?auto_211946 - BLOCK
    )
    :vars
    (
      ?auto_211951 - BLOCK
      ?auto_211952 - BLOCK
      ?auto_211948 - BLOCK
      ?auto_211947 - BLOCK
      ?auto_211950 - BLOCK
      ?auto_211949 - BLOCK
      ?auto_211953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211951 ?auto_211946 ) ( ON-TABLE ?auto_211945 ) ( ON ?auto_211946 ?auto_211945 ) ( not ( = ?auto_211945 ?auto_211946 ) ) ( not ( = ?auto_211945 ?auto_211951 ) ) ( not ( = ?auto_211946 ?auto_211951 ) ) ( not ( = ?auto_211945 ?auto_211952 ) ) ( not ( = ?auto_211945 ?auto_211948 ) ) ( not ( = ?auto_211946 ?auto_211952 ) ) ( not ( = ?auto_211946 ?auto_211948 ) ) ( not ( = ?auto_211951 ?auto_211952 ) ) ( not ( = ?auto_211951 ?auto_211948 ) ) ( not ( = ?auto_211952 ?auto_211948 ) ) ( ON ?auto_211952 ?auto_211951 ) ( not ( = ?auto_211947 ?auto_211950 ) ) ( not ( = ?auto_211947 ?auto_211949 ) ) ( not ( = ?auto_211947 ?auto_211948 ) ) ( not ( = ?auto_211950 ?auto_211949 ) ) ( not ( = ?auto_211950 ?auto_211948 ) ) ( not ( = ?auto_211949 ?auto_211948 ) ) ( not ( = ?auto_211945 ?auto_211949 ) ) ( not ( = ?auto_211945 ?auto_211947 ) ) ( not ( = ?auto_211945 ?auto_211950 ) ) ( not ( = ?auto_211946 ?auto_211949 ) ) ( not ( = ?auto_211946 ?auto_211947 ) ) ( not ( = ?auto_211946 ?auto_211950 ) ) ( not ( = ?auto_211951 ?auto_211949 ) ) ( not ( = ?auto_211951 ?auto_211947 ) ) ( not ( = ?auto_211951 ?auto_211950 ) ) ( not ( = ?auto_211952 ?auto_211949 ) ) ( not ( = ?auto_211952 ?auto_211947 ) ) ( not ( = ?auto_211952 ?auto_211950 ) ) ( ON ?auto_211948 ?auto_211952 ) ( ON ?auto_211949 ?auto_211948 ) ( ON ?auto_211950 ?auto_211949 ) ( CLEAR ?auto_211950 ) ( ON ?auto_211947 ?auto_211953 ) ( CLEAR ?auto_211947 ) ( HAND-EMPTY ) ( not ( = ?auto_211945 ?auto_211953 ) ) ( not ( = ?auto_211946 ?auto_211953 ) ) ( not ( = ?auto_211951 ?auto_211953 ) ) ( not ( = ?auto_211952 ?auto_211953 ) ) ( not ( = ?auto_211948 ?auto_211953 ) ) ( not ( = ?auto_211947 ?auto_211953 ) ) ( not ( = ?auto_211950 ?auto_211953 ) ) ( not ( = ?auto_211949 ?auto_211953 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_211947 ?auto_211953 )
      ( MAKE-2PILE ?auto_211945 ?auto_211946 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211954 - BLOCK
      ?auto_211955 - BLOCK
    )
    :vars
    (
      ?auto_211957 - BLOCK
      ?auto_211960 - BLOCK
      ?auto_211956 - BLOCK
      ?auto_211961 - BLOCK
      ?auto_211962 - BLOCK
      ?auto_211959 - BLOCK
      ?auto_211958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211957 ?auto_211955 ) ( ON-TABLE ?auto_211954 ) ( ON ?auto_211955 ?auto_211954 ) ( not ( = ?auto_211954 ?auto_211955 ) ) ( not ( = ?auto_211954 ?auto_211957 ) ) ( not ( = ?auto_211955 ?auto_211957 ) ) ( not ( = ?auto_211954 ?auto_211960 ) ) ( not ( = ?auto_211954 ?auto_211956 ) ) ( not ( = ?auto_211955 ?auto_211960 ) ) ( not ( = ?auto_211955 ?auto_211956 ) ) ( not ( = ?auto_211957 ?auto_211960 ) ) ( not ( = ?auto_211957 ?auto_211956 ) ) ( not ( = ?auto_211960 ?auto_211956 ) ) ( ON ?auto_211960 ?auto_211957 ) ( not ( = ?auto_211961 ?auto_211962 ) ) ( not ( = ?auto_211961 ?auto_211959 ) ) ( not ( = ?auto_211961 ?auto_211956 ) ) ( not ( = ?auto_211962 ?auto_211959 ) ) ( not ( = ?auto_211962 ?auto_211956 ) ) ( not ( = ?auto_211959 ?auto_211956 ) ) ( not ( = ?auto_211954 ?auto_211959 ) ) ( not ( = ?auto_211954 ?auto_211961 ) ) ( not ( = ?auto_211954 ?auto_211962 ) ) ( not ( = ?auto_211955 ?auto_211959 ) ) ( not ( = ?auto_211955 ?auto_211961 ) ) ( not ( = ?auto_211955 ?auto_211962 ) ) ( not ( = ?auto_211957 ?auto_211959 ) ) ( not ( = ?auto_211957 ?auto_211961 ) ) ( not ( = ?auto_211957 ?auto_211962 ) ) ( not ( = ?auto_211960 ?auto_211959 ) ) ( not ( = ?auto_211960 ?auto_211961 ) ) ( not ( = ?auto_211960 ?auto_211962 ) ) ( ON ?auto_211956 ?auto_211960 ) ( ON ?auto_211959 ?auto_211956 ) ( ON ?auto_211961 ?auto_211958 ) ( CLEAR ?auto_211961 ) ( not ( = ?auto_211954 ?auto_211958 ) ) ( not ( = ?auto_211955 ?auto_211958 ) ) ( not ( = ?auto_211957 ?auto_211958 ) ) ( not ( = ?auto_211960 ?auto_211958 ) ) ( not ( = ?auto_211956 ?auto_211958 ) ) ( not ( = ?auto_211961 ?auto_211958 ) ) ( not ( = ?auto_211962 ?auto_211958 ) ) ( not ( = ?auto_211959 ?auto_211958 ) ) ( HOLDING ?auto_211962 ) ( CLEAR ?auto_211959 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211954 ?auto_211955 ?auto_211957 ?auto_211960 ?auto_211956 ?auto_211959 ?auto_211962 )
      ( MAKE-2PILE ?auto_211954 ?auto_211955 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211963 - BLOCK
      ?auto_211964 - BLOCK
    )
    :vars
    (
      ?auto_211971 - BLOCK
      ?auto_211970 - BLOCK
      ?auto_211968 - BLOCK
      ?auto_211966 - BLOCK
      ?auto_211969 - BLOCK
      ?auto_211965 - BLOCK
      ?auto_211967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211971 ?auto_211964 ) ( ON-TABLE ?auto_211963 ) ( ON ?auto_211964 ?auto_211963 ) ( not ( = ?auto_211963 ?auto_211964 ) ) ( not ( = ?auto_211963 ?auto_211971 ) ) ( not ( = ?auto_211964 ?auto_211971 ) ) ( not ( = ?auto_211963 ?auto_211970 ) ) ( not ( = ?auto_211963 ?auto_211968 ) ) ( not ( = ?auto_211964 ?auto_211970 ) ) ( not ( = ?auto_211964 ?auto_211968 ) ) ( not ( = ?auto_211971 ?auto_211970 ) ) ( not ( = ?auto_211971 ?auto_211968 ) ) ( not ( = ?auto_211970 ?auto_211968 ) ) ( ON ?auto_211970 ?auto_211971 ) ( not ( = ?auto_211966 ?auto_211969 ) ) ( not ( = ?auto_211966 ?auto_211965 ) ) ( not ( = ?auto_211966 ?auto_211968 ) ) ( not ( = ?auto_211969 ?auto_211965 ) ) ( not ( = ?auto_211969 ?auto_211968 ) ) ( not ( = ?auto_211965 ?auto_211968 ) ) ( not ( = ?auto_211963 ?auto_211965 ) ) ( not ( = ?auto_211963 ?auto_211966 ) ) ( not ( = ?auto_211963 ?auto_211969 ) ) ( not ( = ?auto_211964 ?auto_211965 ) ) ( not ( = ?auto_211964 ?auto_211966 ) ) ( not ( = ?auto_211964 ?auto_211969 ) ) ( not ( = ?auto_211971 ?auto_211965 ) ) ( not ( = ?auto_211971 ?auto_211966 ) ) ( not ( = ?auto_211971 ?auto_211969 ) ) ( not ( = ?auto_211970 ?auto_211965 ) ) ( not ( = ?auto_211970 ?auto_211966 ) ) ( not ( = ?auto_211970 ?auto_211969 ) ) ( ON ?auto_211968 ?auto_211970 ) ( ON ?auto_211965 ?auto_211968 ) ( ON ?auto_211966 ?auto_211967 ) ( not ( = ?auto_211963 ?auto_211967 ) ) ( not ( = ?auto_211964 ?auto_211967 ) ) ( not ( = ?auto_211971 ?auto_211967 ) ) ( not ( = ?auto_211970 ?auto_211967 ) ) ( not ( = ?auto_211968 ?auto_211967 ) ) ( not ( = ?auto_211966 ?auto_211967 ) ) ( not ( = ?auto_211969 ?auto_211967 ) ) ( not ( = ?auto_211965 ?auto_211967 ) ) ( CLEAR ?auto_211965 ) ( ON ?auto_211969 ?auto_211966 ) ( CLEAR ?auto_211969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211967 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211967 ?auto_211966 )
      ( MAKE-2PILE ?auto_211963 ?auto_211964 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211972 - BLOCK
      ?auto_211973 - BLOCK
    )
    :vars
    (
      ?auto_211975 - BLOCK
      ?auto_211977 - BLOCK
      ?auto_211978 - BLOCK
      ?auto_211980 - BLOCK
      ?auto_211974 - BLOCK
      ?auto_211979 - BLOCK
      ?auto_211976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211975 ?auto_211973 ) ( ON-TABLE ?auto_211972 ) ( ON ?auto_211973 ?auto_211972 ) ( not ( = ?auto_211972 ?auto_211973 ) ) ( not ( = ?auto_211972 ?auto_211975 ) ) ( not ( = ?auto_211973 ?auto_211975 ) ) ( not ( = ?auto_211972 ?auto_211977 ) ) ( not ( = ?auto_211972 ?auto_211978 ) ) ( not ( = ?auto_211973 ?auto_211977 ) ) ( not ( = ?auto_211973 ?auto_211978 ) ) ( not ( = ?auto_211975 ?auto_211977 ) ) ( not ( = ?auto_211975 ?auto_211978 ) ) ( not ( = ?auto_211977 ?auto_211978 ) ) ( ON ?auto_211977 ?auto_211975 ) ( not ( = ?auto_211980 ?auto_211974 ) ) ( not ( = ?auto_211980 ?auto_211979 ) ) ( not ( = ?auto_211980 ?auto_211978 ) ) ( not ( = ?auto_211974 ?auto_211979 ) ) ( not ( = ?auto_211974 ?auto_211978 ) ) ( not ( = ?auto_211979 ?auto_211978 ) ) ( not ( = ?auto_211972 ?auto_211979 ) ) ( not ( = ?auto_211972 ?auto_211980 ) ) ( not ( = ?auto_211972 ?auto_211974 ) ) ( not ( = ?auto_211973 ?auto_211979 ) ) ( not ( = ?auto_211973 ?auto_211980 ) ) ( not ( = ?auto_211973 ?auto_211974 ) ) ( not ( = ?auto_211975 ?auto_211979 ) ) ( not ( = ?auto_211975 ?auto_211980 ) ) ( not ( = ?auto_211975 ?auto_211974 ) ) ( not ( = ?auto_211977 ?auto_211979 ) ) ( not ( = ?auto_211977 ?auto_211980 ) ) ( not ( = ?auto_211977 ?auto_211974 ) ) ( ON ?auto_211978 ?auto_211977 ) ( ON ?auto_211980 ?auto_211976 ) ( not ( = ?auto_211972 ?auto_211976 ) ) ( not ( = ?auto_211973 ?auto_211976 ) ) ( not ( = ?auto_211975 ?auto_211976 ) ) ( not ( = ?auto_211977 ?auto_211976 ) ) ( not ( = ?auto_211978 ?auto_211976 ) ) ( not ( = ?auto_211980 ?auto_211976 ) ) ( not ( = ?auto_211974 ?auto_211976 ) ) ( not ( = ?auto_211979 ?auto_211976 ) ) ( ON ?auto_211974 ?auto_211980 ) ( CLEAR ?auto_211974 ) ( ON-TABLE ?auto_211976 ) ( HOLDING ?auto_211979 ) ( CLEAR ?auto_211978 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211972 ?auto_211973 ?auto_211975 ?auto_211977 ?auto_211978 ?auto_211979 )
      ( MAKE-2PILE ?auto_211972 ?auto_211973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211981 - BLOCK
      ?auto_211982 - BLOCK
    )
    :vars
    (
      ?auto_211983 - BLOCK
      ?auto_211984 - BLOCK
      ?auto_211985 - BLOCK
      ?auto_211987 - BLOCK
      ?auto_211988 - BLOCK
      ?auto_211986 - BLOCK
      ?auto_211989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211983 ?auto_211982 ) ( ON-TABLE ?auto_211981 ) ( ON ?auto_211982 ?auto_211981 ) ( not ( = ?auto_211981 ?auto_211982 ) ) ( not ( = ?auto_211981 ?auto_211983 ) ) ( not ( = ?auto_211982 ?auto_211983 ) ) ( not ( = ?auto_211981 ?auto_211984 ) ) ( not ( = ?auto_211981 ?auto_211985 ) ) ( not ( = ?auto_211982 ?auto_211984 ) ) ( not ( = ?auto_211982 ?auto_211985 ) ) ( not ( = ?auto_211983 ?auto_211984 ) ) ( not ( = ?auto_211983 ?auto_211985 ) ) ( not ( = ?auto_211984 ?auto_211985 ) ) ( ON ?auto_211984 ?auto_211983 ) ( not ( = ?auto_211987 ?auto_211988 ) ) ( not ( = ?auto_211987 ?auto_211986 ) ) ( not ( = ?auto_211987 ?auto_211985 ) ) ( not ( = ?auto_211988 ?auto_211986 ) ) ( not ( = ?auto_211988 ?auto_211985 ) ) ( not ( = ?auto_211986 ?auto_211985 ) ) ( not ( = ?auto_211981 ?auto_211986 ) ) ( not ( = ?auto_211981 ?auto_211987 ) ) ( not ( = ?auto_211981 ?auto_211988 ) ) ( not ( = ?auto_211982 ?auto_211986 ) ) ( not ( = ?auto_211982 ?auto_211987 ) ) ( not ( = ?auto_211982 ?auto_211988 ) ) ( not ( = ?auto_211983 ?auto_211986 ) ) ( not ( = ?auto_211983 ?auto_211987 ) ) ( not ( = ?auto_211983 ?auto_211988 ) ) ( not ( = ?auto_211984 ?auto_211986 ) ) ( not ( = ?auto_211984 ?auto_211987 ) ) ( not ( = ?auto_211984 ?auto_211988 ) ) ( ON ?auto_211985 ?auto_211984 ) ( ON ?auto_211987 ?auto_211989 ) ( not ( = ?auto_211981 ?auto_211989 ) ) ( not ( = ?auto_211982 ?auto_211989 ) ) ( not ( = ?auto_211983 ?auto_211989 ) ) ( not ( = ?auto_211984 ?auto_211989 ) ) ( not ( = ?auto_211985 ?auto_211989 ) ) ( not ( = ?auto_211987 ?auto_211989 ) ) ( not ( = ?auto_211988 ?auto_211989 ) ) ( not ( = ?auto_211986 ?auto_211989 ) ) ( ON ?auto_211988 ?auto_211987 ) ( ON-TABLE ?auto_211989 ) ( CLEAR ?auto_211985 ) ( ON ?auto_211986 ?auto_211988 ) ( CLEAR ?auto_211986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211989 ?auto_211987 ?auto_211988 )
      ( MAKE-2PILE ?auto_211981 ?auto_211982 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211990 - BLOCK
      ?auto_211991 - BLOCK
    )
    :vars
    (
      ?auto_211998 - BLOCK
      ?auto_211992 - BLOCK
      ?auto_211996 - BLOCK
      ?auto_211997 - BLOCK
      ?auto_211993 - BLOCK
      ?auto_211995 - BLOCK
      ?auto_211994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211998 ?auto_211991 ) ( ON-TABLE ?auto_211990 ) ( ON ?auto_211991 ?auto_211990 ) ( not ( = ?auto_211990 ?auto_211991 ) ) ( not ( = ?auto_211990 ?auto_211998 ) ) ( not ( = ?auto_211991 ?auto_211998 ) ) ( not ( = ?auto_211990 ?auto_211992 ) ) ( not ( = ?auto_211990 ?auto_211996 ) ) ( not ( = ?auto_211991 ?auto_211992 ) ) ( not ( = ?auto_211991 ?auto_211996 ) ) ( not ( = ?auto_211998 ?auto_211992 ) ) ( not ( = ?auto_211998 ?auto_211996 ) ) ( not ( = ?auto_211992 ?auto_211996 ) ) ( ON ?auto_211992 ?auto_211998 ) ( not ( = ?auto_211997 ?auto_211993 ) ) ( not ( = ?auto_211997 ?auto_211995 ) ) ( not ( = ?auto_211997 ?auto_211996 ) ) ( not ( = ?auto_211993 ?auto_211995 ) ) ( not ( = ?auto_211993 ?auto_211996 ) ) ( not ( = ?auto_211995 ?auto_211996 ) ) ( not ( = ?auto_211990 ?auto_211995 ) ) ( not ( = ?auto_211990 ?auto_211997 ) ) ( not ( = ?auto_211990 ?auto_211993 ) ) ( not ( = ?auto_211991 ?auto_211995 ) ) ( not ( = ?auto_211991 ?auto_211997 ) ) ( not ( = ?auto_211991 ?auto_211993 ) ) ( not ( = ?auto_211998 ?auto_211995 ) ) ( not ( = ?auto_211998 ?auto_211997 ) ) ( not ( = ?auto_211998 ?auto_211993 ) ) ( not ( = ?auto_211992 ?auto_211995 ) ) ( not ( = ?auto_211992 ?auto_211997 ) ) ( not ( = ?auto_211992 ?auto_211993 ) ) ( ON ?auto_211997 ?auto_211994 ) ( not ( = ?auto_211990 ?auto_211994 ) ) ( not ( = ?auto_211991 ?auto_211994 ) ) ( not ( = ?auto_211998 ?auto_211994 ) ) ( not ( = ?auto_211992 ?auto_211994 ) ) ( not ( = ?auto_211996 ?auto_211994 ) ) ( not ( = ?auto_211997 ?auto_211994 ) ) ( not ( = ?auto_211993 ?auto_211994 ) ) ( not ( = ?auto_211995 ?auto_211994 ) ) ( ON ?auto_211993 ?auto_211997 ) ( ON-TABLE ?auto_211994 ) ( ON ?auto_211995 ?auto_211993 ) ( CLEAR ?auto_211995 ) ( HOLDING ?auto_211996 ) ( CLEAR ?auto_211992 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211990 ?auto_211991 ?auto_211998 ?auto_211992 ?auto_211996 )
      ( MAKE-2PILE ?auto_211990 ?auto_211991 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_211999 - BLOCK
      ?auto_212000 - BLOCK
    )
    :vars
    (
      ?auto_212005 - BLOCK
      ?auto_212004 - BLOCK
      ?auto_212006 - BLOCK
      ?auto_212007 - BLOCK
      ?auto_212001 - BLOCK
      ?auto_212003 - BLOCK
      ?auto_212002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212005 ?auto_212000 ) ( ON-TABLE ?auto_211999 ) ( ON ?auto_212000 ?auto_211999 ) ( not ( = ?auto_211999 ?auto_212000 ) ) ( not ( = ?auto_211999 ?auto_212005 ) ) ( not ( = ?auto_212000 ?auto_212005 ) ) ( not ( = ?auto_211999 ?auto_212004 ) ) ( not ( = ?auto_211999 ?auto_212006 ) ) ( not ( = ?auto_212000 ?auto_212004 ) ) ( not ( = ?auto_212000 ?auto_212006 ) ) ( not ( = ?auto_212005 ?auto_212004 ) ) ( not ( = ?auto_212005 ?auto_212006 ) ) ( not ( = ?auto_212004 ?auto_212006 ) ) ( ON ?auto_212004 ?auto_212005 ) ( not ( = ?auto_212007 ?auto_212001 ) ) ( not ( = ?auto_212007 ?auto_212003 ) ) ( not ( = ?auto_212007 ?auto_212006 ) ) ( not ( = ?auto_212001 ?auto_212003 ) ) ( not ( = ?auto_212001 ?auto_212006 ) ) ( not ( = ?auto_212003 ?auto_212006 ) ) ( not ( = ?auto_211999 ?auto_212003 ) ) ( not ( = ?auto_211999 ?auto_212007 ) ) ( not ( = ?auto_211999 ?auto_212001 ) ) ( not ( = ?auto_212000 ?auto_212003 ) ) ( not ( = ?auto_212000 ?auto_212007 ) ) ( not ( = ?auto_212000 ?auto_212001 ) ) ( not ( = ?auto_212005 ?auto_212003 ) ) ( not ( = ?auto_212005 ?auto_212007 ) ) ( not ( = ?auto_212005 ?auto_212001 ) ) ( not ( = ?auto_212004 ?auto_212003 ) ) ( not ( = ?auto_212004 ?auto_212007 ) ) ( not ( = ?auto_212004 ?auto_212001 ) ) ( ON ?auto_212007 ?auto_212002 ) ( not ( = ?auto_211999 ?auto_212002 ) ) ( not ( = ?auto_212000 ?auto_212002 ) ) ( not ( = ?auto_212005 ?auto_212002 ) ) ( not ( = ?auto_212004 ?auto_212002 ) ) ( not ( = ?auto_212006 ?auto_212002 ) ) ( not ( = ?auto_212007 ?auto_212002 ) ) ( not ( = ?auto_212001 ?auto_212002 ) ) ( not ( = ?auto_212003 ?auto_212002 ) ) ( ON ?auto_212001 ?auto_212007 ) ( ON-TABLE ?auto_212002 ) ( ON ?auto_212003 ?auto_212001 ) ( CLEAR ?auto_212004 ) ( ON ?auto_212006 ?auto_212003 ) ( CLEAR ?auto_212006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212002 ?auto_212007 ?auto_212001 ?auto_212003 )
      ( MAKE-2PILE ?auto_211999 ?auto_212000 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_212008 - BLOCK
      ?auto_212009 - BLOCK
    )
    :vars
    (
      ?auto_212014 - BLOCK
      ?auto_212010 - BLOCK
      ?auto_212011 - BLOCK
      ?auto_212012 - BLOCK
      ?auto_212016 - BLOCK
      ?auto_212015 - BLOCK
      ?auto_212013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212014 ?auto_212009 ) ( ON-TABLE ?auto_212008 ) ( ON ?auto_212009 ?auto_212008 ) ( not ( = ?auto_212008 ?auto_212009 ) ) ( not ( = ?auto_212008 ?auto_212014 ) ) ( not ( = ?auto_212009 ?auto_212014 ) ) ( not ( = ?auto_212008 ?auto_212010 ) ) ( not ( = ?auto_212008 ?auto_212011 ) ) ( not ( = ?auto_212009 ?auto_212010 ) ) ( not ( = ?auto_212009 ?auto_212011 ) ) ( not ( = ?auto_212014 ?auto_212010 ) ) ( not ( = ?auto_212014 ?auto_212011 ) ) ( not ( = ?auto_212010 ?auto_212011 ) ) ( not ( = ?auto_212012 ?auto_212016 ) ) ( not ( = ?auto_212012 ?auto_212015 ) ) ( not ( = ?auto_212012 ?auto_212011 ) ) ( not ( = ?auto_212016 ?auto_212015 ) ) ( not ( = ?auto_212016 ?auto_212011 ) ) ( not ( = ?auto_212015 ?auto_212011 ) ) ( not ( = ?auto_212008 ?auto_212015 ) ) ( not ( = ?auto_212008 ?auto_212012 ) ) ( not ( = ?auto_212008 ?auto_212016 ) ) ( not ( = ?auto_212009 ?auto_212015 ) ) ( not ( = ?auto_212009 ?auto_212012 ) ) ( not ( = ?auto_212009 ?auto_212016 ) ) ( not ( = ?auto_212014 ?auto_212015 ) ) ( not ( = ?auto_212014 ?auto_212012 ) ) ( not ( = ?auto_212014 ?auto_212016 ) ) ( not ( = ?auto_212010 ?auto_212015 ) ) ( not ( = ?auto_212010 ?auto_212012 ) ) ( not ( = ?auto_212010 ?auto_212016 ) ) ( ON ?auto_212012 ?auto_212013 ) ( not ( = ?auto_212008 ?auto_212013 ) ) ( not ( = ?auto_212009 ?auto_212013 ) ) ( not ( = ?auto_212014 ?auto_212013 ) ) ( not ( = ?auto_212010 ?auto_212013 ) ) ( not ( = ?auto_212011 ?auto_212013 ) ) ( not ( = ?auto_212012 ?auto_212013 ) ) ( not ( = ?auto_212016 ?auto_212013 ) ) ( not ( = ?auto_212015 ?auto_212013 ) ) ( ON ?auto_212016 ?auto_212012 ) ( ON-TABLE ?auto_212013 ) ( ON ?auto_212015 ?auto_212016 ) ( ON ?auto_212011 ?auto_212015 ) ( CLEAR ?auto_212011 ) ( HOLDING ?auto_212010 ) ( CLEAR ?auto_212014 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212008 ?auto_212009 ?auto_212014 ?auto_212010 )
      ( MAKE-2PILE ?auto_212008 ?auto_212009 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_212017 - BLOCK
      ?auto_212018 - BLOCK
    )
    :vars
    (
      ?auto_212019 - BLOCK
      ?auto_212023 - BLOCK
      ?auto_212025 - BLOCK
      ?auto_212021 - BLOCK
      ?auto_212020 - BLOCK
      ?auto_212022 - BLOCK
      ?auto_212024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212019 ?auto_212018 ) ( ON-TABLE ?auto_212017 ) ( ON ?auto_212018 ?auto_212017 ) ( not ( = ?auto_212017 ?auto_212018 ) ) ( not ( = ?auto_212017 ?auto_212019 ) ) ( not ( = ?auto_212018 ?auto_212019 ) ) ( not ( = ?auto_212017 ?auto_212023 ) ) ( not ( = ?auto_212017 ?auto_212025 ) ) ( not ( = ?auto_212018 ?auto_212023 ) ) ( not ( = ?auto_212018 ?auto_212025 ) ) ( not ( = ?auto_212019 ?auto_212023 ) ) ( not ( = ?auto_212019 ?auto_212025 ) ) ( not ( = ?auto_212023 ?auto_212025 ) ) ( not ( = ?auto_212021 ?auto_212020 ) ) ( not ( = ?auto_212021 ?auto_212022 ) ) ( not ( = ?auto_212021 ?auto_212025 ) ) ( not ( = ?auto_212020 ?auto_212022 ) ) ( not ( = ?auto_212020 ?auto_212025 ) ) ( not ( = ?auto_212022 ?auto_212025 ) ) ( not ( = ?auto_212017 ?auto_212022 ) ) ( not ( = ?auto_212017 ?auto_212021 ) ) ( not ( = ?auto_212017 ?auto_212020 ) ) ( not ( = ?auto_212018 ?auto_212022 ) ) ( not ( = ?auto_212018 ?auto_212021 ) ) ( not ( = ?auto_212018 ?auto_212020 ) ) ( not ( = ?auto_212019 ?auto_212022 ) ) ( not ( = ?auto_212019 ?auto_212021 ) ) ( not ( = ?auto_212019 ?auto_212020 ) ) ( not ( = ?auto_212023 ?auto_212022 ) ) ( not ( = ?auto_212023 ?auto_212021 ) ) ( not ( = ?auto_212023 ?auto_212020 ) ) ( ON ?auto_212021 ?auto_212024 ) ( not ( = ?auto_212017 ?auto_212024 ) ) ( not ( = ?auto_212018 ?auto_212024 ) ) ( not ( = ?auto_212019 ?auto_212024 ) ) ( not ( = ?auto_212023 ?auto_212024 ) ) ( not ( = ?auto_212025 ?auto_212024 ) ) ( not ( = ?auto_212021 ?auto_212024 ) ) ( not ( = ?auto_212020 ?auto_212024 ) ) ( not ( = ?auto_212022 ?auto_212024 ) ) ( ON ?auto_212020 ?auto_212021 ) ( ON-TABLE ?auto_212024 ) ( ON ?auto_212022 ?auto_212020 ) ( ON ?auto_212025 ?auto_212022 ) ( CLEAR ?auto_212019 ) ( ON ?auto_212023 ?auto_212025 ) ( CLEAR ?auto_212023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212024 ?auto_212021 ?auto_212020 ?auto_212022 ?auto_212025 )
      ( MAKE-2PILE ?auto_212017 ?auto_212018 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_212044 - BLOCK
      ?auto_212045 - BLOCK
    )
    :vars
    (
      ?auto_212048 - BLOCK
      ?auto_212049 - BLOCK
      ?auto_212047 - BLOCK
      ?auto_212051 - BLOCK
      ?auto_212052 - BLOCK
      ?auto_212046 - BLOCK
      ?auto_212050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212044 ) ( not ( = ?auto_212044 ?auto_212045 ) ) ( not ( = ?auto_212044 ?auto_212048 ) ) ( not ( = ?auto_212045 ?auto_212048 ) ) ( not ( = ?auto_212044 ?auto_212049 ) ) ( not ( = ?auto_212044 ?auto_212047 ) ) ( not ( = ?auto_212045 ?auto_212049 ) ) ( not ( = ?auto_212045 ?auto_212047 ) ) ( not ( = ?auto_212048 ?auto_212049 ) ) ( not ( = ?auto_212048 ?auto_212047 ) ) ( not ( = ?auto_212049 ?auto_212047 ) ) ( not ( = ?auto_212051 ?auto_212052 ) ) ( not ( = ?auto_212051 ?auto_212046 ) ) ( not ( = ?auto_212051 ?auto_212047 ) ) ( not ( = ?auto_212052 ?auto_212046 ) ) ( not ( = ?auto_212052 ?auto_212047 ) ) ( not ( = ?auto_212046 ?auto_212047 ) ) ( not ( = ?auto_212044 ?auto_212046 ) ) ( not ( = ?auto_212044 ?auto_212051 ) ) ( not ( = ?auto_212044 ?auto_212052 ) ) ( not ( = ?auto_212045 ?auto_212046 ) ) ( not ( = ?auto_212045 ?auto_212051 ) ) ( not ( = ?auto_212045 ?auto_212052 ) ) ( not ( = ?auto_212048 ?auto_212046 ) ) ( not ( = ?auto_212048 ?auto_212051 ) ) ( not ( = ?auto_212048 ?auto_212052 ) ) ( not ( = ?auto_212049 ?auto_212046 ) ) ( not ( = ?auto_212049 ?auto_212051 ) ) ( not ( = ?auto_212049 ?auto_212052 ) ) ( ON ?auto_212051 ?auto_212050 ) ( not ( = ?auto_212044 ?auto_212050 ) ) ( not ( = ?auto_212045 ?auto_212050 ) ) ( not ( = ?auto_212048 ?auto_212050 ) ) ( not ( = ?auto_212049 ?auto_212050 ) ) ( not ( = ?auto_212047 ?auto_212050 ) ) ( not ( = ?auto_212051 ?auto_212050 ) ) ( not ( = ?auto_212052 ?auto_212050 ) ) ( not ( = ?auto_212046 ?auto_212050 ) ) ( ON ?auto_212052 ?auto_212051 ) ( ON-TABLE ?auto_212050 ) ( ON ?auto_212046 ?auto_212052 ) ( ON ?auto_212047 ?auto_212046 ) ( ON ?auto_212049 ?auto_212047 ) ( ON ?auto_212048 ?auto_212049 ) ( CLEAR ?auto_212048 ) ( HOLDING ?auto_212045 ) ( CLEAR ?auto_212044 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212044 ?auto_212045 ?auto_212048 )
      ( MAKE-2PILE ?auto_212044 ?auto_212045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_212053 - BLOCK
      ?auto_212054 - BLOCK
    )
    :vars
    (
      ?auto_212061 - BLOCK
      ?auto_212059 - BLOCK
      ?auto_212058 - BLOCK
      ?auto_212057 - BLOCK
      ?auto_212056 - BLOCK
      ?auto_212060 - BLOCK
      ?auto_212055 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212053 ) ( not ( = ?auto_212053 ?auto_212054 ) ) ( not ( = ?auto_212053 ?auto_212061 ) ) ( not ( = ?auto_212054 ?auto_212061 ) ) ( not ( = ?auto_212053 ?auto_212059 ) ) ( not ( = ?auto_212053 ?auto_212058 ) ) ( not ( = ?auto_212054 ?auto_212059 ) ) ( not ( = ?auto_212054 ?auto_212058 ) ) ( not ( = ?auto_212061 ?auto_212059 ) ) ( not ( = ?auto_212061 ?auto_212058 ) ) ( not ( = ?auto_212059 ?auto_212058 ) ) ( not ( = ?auto_212057 ?auto_212056 ) ) ( not ( = ?auto_212057 ?auto_212060 ) ) ( not ( = ?auto_212057 ?auto_212058 ) ) ( not ( = ?auto_212056 ?auto_212060 ) ) ( not ( = ?auto_212056 ?auto_212058 ) ) ( not ( = ?auto_212060 ?auto_212058 ) ) ( not ( = ?auto_212053 ?auto_212060 ) ) ( not ( = ?auto_212053 ?auto_212057 ) ) ( not ( = ?auto_212053 ?auto_212056 ) ) ( not ( = ?auto_212054 ?auto_212060 ) ) ( not ( = ?auto_212054 ?auto_212057 ) ) ( not ( = ?auto_212054 ?auto_212056 ) ) ( not ( = ?auto_212061 ?auto_212060 ) ) ( not ( = ?auto_212061 ?auto_212057 ) ) ( not ( = ?auto_212061 ?auto_212056 ) ) ( not ( = ?auto_212059 ?auto_212060 ) ) ( not ( = ?auto_212059 ?auto_212057 ) ) ( not ( = ?auto_212059 ?auto_212056 ) ) ( ON ?auto_212057 ?auto_212055 ) ( not ( = ?auto_212053 ?auto_212055 ) ) ( not ( = ?auto_212054 ?auto_212055 ) ) ( not ( = ?auto_212061 ?auto_212055 ) ) ( not ( = ?auto_212059 ?auto_212055 ) ) ( not ( = ?auto_212058 ?auto_212055 ) ) ( not ( = ?auto_212057 ?auto_212055 ) ) ( not ( = ?auto_212056 ?auto_212055 ) ) ( not ( = ?auto_212060 ?auto_212055 ) ) ( ON ?auto_212056 ?auto_212057 ) ( ON-TABLE ?auto_212055 ) ( ON ?auto_212060 ?auto_212056 ) ( ON ?auto_212058 ?auto_212060 ) ( ON ?auto_212059 ?auto_212058 ) ( ON ?auto_212061 ?auto_212059 ) ( CLEAR ?auto_212053 ) ( ON ?auto_212054 ?auto_212061 ) ( CLEAR ?auto_212054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212055 ?auto_212057 ?auto_212056 ?auto_212060 ?auto_212058 ?auto_212059 ?auto_212061 )
      ( MAKE-2PILE ?auto_212053 ?auto_212054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_212062 - BLOCK
      ?auto_212063 - BLOCK
    )
    :vars
    (
      ?auto_212066 - BLOCK
      ?auto_212064 - BLOCK
      ?auto_212068 - BLOCK
      ?auto_212065 - BLOCK
      ?auto_212069 - BLOCK
      ?auto_212070 - BLOCK
      ?auto_212067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212062 ?auto_212063 ) ) ( not ( = ?auto_212062 ?auto_212066 ) ) ( not ( = ?auto_212063 ?auto_212066 ) ) ( not ( = ?auto_212062 ?auto_212064 ) ) ( not ( = ?auto_212062 ?auto_212068 ) ) ( not ( = ?auto_212063 ?auto_212064 ) ) ( not ( = ?auto_212063 ?auto_212068 ) ) ( not ( = ?auto_212066 ?auto_212064 ) ) ( not ( = ?auto_212066 ?auto_212068 ) ) ( not ( = ?auto_212064 ?auto_212068 ) ) ( not ( = ?auto_212065 ?auto_212069 ) ) ( not ( = ?auto_212065 ?auto_212070 ) ) ( not ( = ?auto_212065 ?auto_212068 ) ) ( not ( = ?auto_212069 ?auto_212070 ) ) ( not ( = ?auto_212069 ?auto_212068 ) ) ( not ( = ?auto_212070 ?auto_212068 ) ) ( not ( = ?auto_212062 ?auto_212070 ) ) ( not ( = ?auto_212062 ?auto_212065 ) ) ( not ( = ?auto_212062 ?auto_212069 ) ) ( not ( = ?auto_212063 ?auto_212070 ) ) ( not ( = ?auto_212063 ?auto_212065 ) ) ( not ( = ?auto_212063 ?auto_212069 ) ) ( not ( = ?auto_212066 ?auto_212070 ) ) ( not ( = ?auto_212066 ?auto_212065 ) ) ( not ( = ?auto_212066 ?auto_212069 ) ) ( not ( = ?auto_212064 ?auto_212070 ) ) ( not ( = ?auto_212064 ?auto_212065 ) ) ( not ( = ?auto_212064 ?auto_212069 ) ) ( ON ?auto_212065 ?auto_212067 ) ( not ( = ?auto_212062 ?auto_212067 ) ) ( not ( = ?auto_212063 ?auto_212067 ) ) ( not ( = ?auto_212066 ?auto_212067 ) ) ( not ( = ?auto_212064 ?auto_212067 ) ) ( not ( = ?auto_212068 ?auto_212067 ) ) ( not ( = ?auto_212065 ?auto_212067 ) ) ( not ( = ?auto_212069 ?auto_212067 ) ) ( not ( = ?auto_212070 ?auto_212067 ) ) ( ON ?auto_212069 ?auto_212065 ) ( ON-TABLE ?auto_212067 ) ( ON ?auto_212070 ?auto_212069 ) ( ON ?auto_212068 ?auto_212070 ) ( ON ?auto_212064 ?auto_212068 ) ( ON ?auto_212066 ?auto_212064 ) ( ON ?auto_212063 ?auto_212066 ) ( CLEAR ?auto_212063 ) ( HOLDING ?auto_212062 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212062 )
      ( MAKE-2PILE ?auto_212062 ?auto_212063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_212071 - BLOCK
      ?auto_212072 - BLOCK
    )
    :vars
    (
      ?auto_212078 - BLOCK
      ?auto_212073 - BLOCK
      ?auto_212079 - BLOCK
      ?auto_212077 - BLOCK
      ?auto_212075 - BLOCK
      ?auto_212074 - BLOCK
      ?auto_212076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212071 ?auto_212072 ) ) ( not ( = ?auto_212071 ?auto_212078 ) ) ( not ( = ?auto_212072 ?auto_212078 ) ) ( not ( = ?auto_212071 ?auto_212073 ) ) ( not ( = ?auto_212071 ?auto_212079 ) ) ( not ( = ?auto_212072 ?auto_212073 ) ) ( not ( = ?auto_212072 ?auto_212079 ) ) ( not ( = ?auto_212078 ?auto_212073 ) ) ( not ( = ?auto_212078 ?auto_212079 ) ) ( not ( = ?auto_212073 ?auto_212079 ) ) ( not ( = ?auto_212077 ?auto_212075 ) ) ( not ( = ?auto_212077 ?auto_212074 ) ) ( not ( = ?auto_212077 ?auto_212079 ) ) ( not ( = ?auto_212075 ?auto_212074 ) ) ( not ( = ?auto_212075 ?auto_212079 ) ) ( not ( = ?auto_212074 ?auto_212079 ) ) ( not ( = ?auto_212071 ?auto_212074 ) ) ( not ( = ?auto_212071 ?auto_212077 ) ) ( not ( = ?auto_212071 ?auto_212075 ) ) ( not ( = ?auto_212072 ?auto_212074 ) ) ( not ( = ?auto_212072 ?auto_212077 ) ) ( not ( = ?auto_212072 ?auto_212075 ) ) ( not ( = ?auto_212078 ?auto_212074 ) ) ( not ( = ?auto_212078 ?auto_212077 ) ) ( not ( = ?auto_212078 ?auto_212075 ) ) ( not ( = ?auto_212073 ?auto_212074 ) ) ( not ( = ?auto_212073 ?auto_212077 ) ) ( not ( = ?auto_212073 ?auto_212075 ) ) ( ON ?auto_212077 ?auto_212076 ) ( not ( = ?auto_212071 ?auto_212076 ) ) ( not ( = ?auto_212072 ?auto_212076 ) ) ( not ( = ?auto_212078 ?auto_212076 ) ) ( not ( = ?auto_212073 ?auto_212076 ) ) ( not ( = ?auto_212079 ?auto_212076 ) ) ( not ( = ?auto_212077 ?auto_212076 ) ) ( not ( = ?auto_212075 ?auto_212076 ) ) ( not ( = ?auto_212074 ?auto_212076 ) ) ( ON ?auto_212075 ?auto_212077 ) ( ON-TABLE ?auto_212076 ) ( ON ?auto_212074 ?auto_212075 ) ( ON ?auto_212079 ?auto_212074 ) ( ON ?auto_212073 ?auto_212079 ) ( ON ?auto_212078 ?auto_212073 ) ( ON ?auto_212072 ?auto_212078 ) ( ON ?auto_212071 ?auto_212072 ) ( CLEAR ?auto_212071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_212076 ?auto_212077 ?auto_212075 ?auto_212074 ?auto_212079 ?auto_212073 ?auto_212078 ?auto_212072 )
      ( MAKE-2PILE ?auto_212071 ?auto_212072 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212086 - BLOCK
      ?auto_212087 - BLOCK
      ?auto_212088 - BLOCK
      ?auto_212089 - BLOCK
      ?auto_212090 - BLOCK
      ?auto_212091 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_212091 ) ( CLEAR ?auto_212090 ) ( ON-TABLE ?auto_212086 ) ( ON ?auto_212087 ?auto_212086 ) ( ON ?auto_212088 ?auto_212087 ) ( ON ?auto_212089 ?auto_212088 ) ( ON ?auto_212090 ?auto_212089 ) ( not ( = ?auto_212086 ?auto_212087 ) ) ( not ( = ?auto_212086 ?auto_212088 ) ) ( not ( = ?auto_212086 ?auto_212089 ) ) ( not ( = ?auto_212086 ?auto_212090 ) ) ( not ( = ?auto_212086 ?auto_212091 ) ) ( not ( = ?auto_212087 ?auto_212088 ) ) ( not ( = ?auto_212087 ?auto_212089 ) ) ( not ( = ?auto_212087 ?auto_212090 ) ) ( not ( = ?auto_212087 ?auto_212091 ) ) ( not ( = ?auto_212088 ?auto_212089 ) ) ( not ( = ?auto_212088 ?auto_212090 ) ) ( not ( = ?auto_212088 ?auto_212091 ) ) ( not ( = ?auto_212089 ?auto_212090 ) ) ( not ( = ?auto_212089 ?auto_212091 ) ) ( not ( = ?auto_212090 ?auto_212091 ) ) )
    :subtasks
    ( ( !STACK ?auto_212091 ?auto_212090 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212092 - BLOCK
      ?auto_212093 - BLOCK
      ?auto_212094 - BLOCK
      ?auto_212095 - BLOCK
      ?auto_212096 - BLOCK
      ?auto_212097 - BLOCK
    )
    :vars
    (
      ?auto_212098 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212096 ) ( ON-TABLE ?auto_212092 ) ( ON ?auto_212093 ?auto_212092 ) ( ON ?auto_212094 ?auto_212093 ) ( ON ?auto_212095 ?auto_212094 ) ( ON ?auto_212096 ?auto_212095 ) ( not ( = ?auto_212092 ?auto_212093 ) ) ( not ( = ?auto_212092 ?auto_212094 ) ) ( not ( = ?auto_212092 ?auto_212095 ) ) ( not ( = ?auto_212092 ?auto_212096 ) ) ( not ( = ?auto_212092 ?auto_212097 ) ) ( not ( = ?auto_212093 ?auto_212094 ) ) ( not ( = ?auto_212093 ?auto_212095 ) ) ( not ( = ?auto_212093 ?auto_212096 ) ) ( not ( = ?auto_212093 ?auto_212097 ) ) ( not ( = ?auto_212094 ?auto_212095 ) ) ( not ( = ?auto_212094 ?auto_212096 ) ) ( not ( = ?auto_212094 ?auto_212097 ) ) ( not ( = ?auto_212095 ?auto_212096 ) ) ( not ( = ?auto_212095 ?auto_212097 ) ) ( not ( = ?auto_212096 ?auto_212097 ) ) ( ON ?auto_212097 ?auto_212098 ) ( CLEAR ?auto_212097 ) ( HAND-EMPTY ) ( not ( = ?auto_212092 ?auto_212098 ) ) ( not ( = ?auto_212093 ?auto_212098 ) ) ( not ( = ?auto_212094 ?auto_212098 ) ) ( not ( = ?auto_212095 ?auto_212098 ) ) ( not ( = ?auto_212096 ?auto_212098 ) ) ( not ( = ?auto_212097 ?auto_212098 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212097 ?auto_212098 )
      ( MAKE-6PILE ?auto_212092 ?auto_212093 ?auto_212094 ?auto_212095 ?auto_212096 ?auto_212097 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212099 - BLOCK
      ?auto_212100 - BLOCK
      ?auto_212101 - BLOCK
      ?auto_212102 - BLOCK
      ?auto_212103 - BLOCK
      ?auto_212104 - BLOCK
    )
    :vars
    (
      ?auto_212105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212099 ) ( ON ?auto_212100 ?auto_212099 ) ( ON ?auto_212101 ?auto_212100 ) ( ON ?auto_212102 ?auto_212101 ) ( not ( = ?auto_212099 ?auto_212100 ) ) ( not ( = ?auto_212099 ?auto_212101 ) ) ( not ( = ?auto_212099 ?auto_212102 ) ) ( not ( = ?auto_212099 ?auto_212103 ) ) ( not ( = ?auto_212099 ?auto_212104 ) ) ( not ( = ?auto_212100 ?auto_212101 ) ) ( not ( = ?auto_212100 ?auto_212102 ) ) ( not ( = ?auto_212100 ?auto_212103 ) ) ( not ( = ?auto_212100 ?auto_212104 ) ) ( not ( = ?auto_212101 ?auto_212102 ) ) ( not ( = ?auto_212101 ?auto_212103 ) ) ( not ( = ?auto_212101 ?auto_212104 ) ) ( not ( = ?auto_212102 ?auto_212103 ) ) ( not ( = ?auto_212102 ?auto_212104 ) ) ( not ( = ?auto_212103 ?auto_212104 ) ) ( ON ?auto_212104 ?auto_212105 ) ( CLEAR ?auto_212104 ) ( not ( = ?auto_212099 ?auto_212105 ) ) ( not ( = ?auto_212100 ?auto_212105 ) ) ( not ( = ?auto_212101 ?auto_212105 ) ) ( not ( = ?auto_212102 ?auto_212105 ) ) ( not ( = ?auto_212103 ?auto_212105 ) ) ( not ( = ?auto_212104 ?auto_212105 ) ) ( HOLDING ?auto_212103 ) ( CLEAR ?auto_212102 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212099 ?auto_212100 ?auto_212101 ?auto_212102 ?auto_212103 )
      ( MAKE-6PILE ?auto_212099 ?auto_212100 ?auto_212101 ?auto_212102 ?auto_212103 ?auto_212104 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212106 - BLOCK
      ?auto_212107 - BLOCK
      ?auto_212108 - BLOCK
      ?auto_212109 - BLOCK
      ?auto_212110 - BLOCK
      ?auto_212111 - BLOCK
    )
    :vars
    (
      ?auto_212112 - BLOCK
      ?auto_212113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212106 ) ( ON ?auto_212107 ?auto_212106 ) ( ON ?auto_212108 ?auto_212107 ) ( ON ?auto_212109 ?auto_212108 ) ( not ( = ?auto_212106 ?auto_212107 ) ) ( not ( = ?auto_212106 ?auto_212108 ) ) ( not ( = ?auto_212106 ?auto_212109 ) ) ( not ( = ?auto_212106 ?auto_212110 ) ) ( not ( = ?auto_212106 ?auto_212111 ) ) ( not ( = ?auto_212107 ?auto_212108 ) ) ( not ( = ?auto_212107 ?auto_212109 ) ) ( not ( = ?auto_212107 ?auto_212110 ) ) ( not ( = ?auto_212107 ?auto_212111 ) ) ( not ( = ?auto_212108 ?auto_212109 ) ) ( not ( = ?auto_212108 ?auto_212110 ) ) ( not ( = ?auto_212108 ?auto_212111 ) ) ( not ( = ?auto_212109 ?auto_212110 ) ) ( not ( = ?auto_212109 ?auto_212111 ) ) ( not ( = ?auto_212110 ?auto_212111 ) ) ( ON ?auto_212111 ?auto_212112 ) ( not ( = ?auto_212106 ?auto_212112 ) ) ( not ( = ?auto_212107 ?auto_212112 ) ) ( not ( = ?auto_212108 ?auto_212112 ) ) ( not ( = ?auto_212109 ?auto_212112 ) ) ( not ( = ?auto_212110 ?auto_212112 ) ) ( not ( = ?auto_212111 ?auto_212112 ) ) ( CLEAR ?auto_212109 ) ( ON ?auto_212110 ?auto_212111 ) ( CLEAR ?auto_212110 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212113 ) ( ON ?auto_212112 ?auto_212113 ) ( not ( = ?auto_212113 ?auto_212112 ) ) ( not ( = ?auto_212113 ?auto_212111 ) ) ( not ( = ?auto_212113 ?auto_212110 ) ) ( not ( = ?auto_212106 ?auto_212113 ) ) ( not ( = ?auto_212107 ?auto_212113 ) ) ( not ( = ?auto_212108 ?auto_212113 ) ) ( not ( = ?auto_212109 ?auto_212113 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212113 ?auto_212112 ?auto_212111 )
      ( MAKE-6PILE ?auto_212106 ?auto_212107 ?auto_212108 ?auto_212109 ?auto_212110 ?auto_212111 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212114 - BLOCK
      ?auto_212115 - BLOCK
      ?auto_212116 - BLOCK
      ?auto_212117 - BLOCK
      ?auto_212118 - BLOCK
      ?auto_212119 - BLOCK
    )
    :vars
    (
      ?auto_212121 - BLOCK
      ?auto_212120 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212114 ) ( ON ?auto_212115 ?auto_212114 ) ( ON ?auto_212116 ?auto_212115 ) ( not ( = ?auto_212114 ?auto_212115 ) ) ( not ( = ?auto_212114 ?auto_212116 ) ) ( not ( = ?auto_212114 ?auto_212117 ) ) ( not ( = ?auto_212114 ?auto_212118 ) ) ( not ( = ?auto_212114 ?auto_212119 ) ) ( not ( = ?auto_212115 ?auto_212116 ) ) ( not ( = ?auto_212115 ?auto_212117 ) ) ( not ( = ?auto_212115 ?auto_212118 ) ) ( not ( = ?auto_212115 ?auto_212119 ) ) ( not ( = ?auto_212116 ?auto_212117 ) ) ( not ( = ?auto_212116 ?auto_212118 ) ) ( not ( = ?auto_212116 ?auto_212119 ) ) ( not ( = ?auto_212117 ?auto_212118 ) ) ( not ( = ?auto_212117 ?auto_212119 ) ) ( not ( = ?auto_212118 ?auto_212119 ) ) ( ON ?auto_212119 ?auto_212121 ) ( not ( = ?auto_212114 ?auto_212121 ) ) ( not ( = ?auto_212115 ?auto_212121 ) ) ( not ( = ?auto_212116 ?auto_212121 ) ) ( not ( = ?auto_212117 ?auto_212121 ) ) ( not ( = ?auto_212118 ?auto_212121 ) ) ( not ( = ?auto_212119 ?auto_212121 ) ) ( ON ?auto_212118 ?auto_212119 ) ( CLEAR ?auto_212118 ) ( ON-TABLE ?auto_212120 ) ( ON ?auto_212121 ?auto_212120 ) ( not ( = ?auto_212120 ?auto_212121 ) ) ( not ( = ?auto_212120 ?auto_212119 ) ) ( not ( = ?auto_212120 ?auto_212118 ) ) ( not ( = ?auto_212114 ?auto_212120 ) ) ( not ( = ?auto_212115 ?auto_212120 ) ) ( not ( = ?auto_212116 ?auto_212120 ) ) ( not ( = ?auto_212117 ?auto_212120 ) ) ( HOLDING ?auto_212117 ) ( CLEAR ?auto_212116 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212114 ?auto_212115 ?auto_212116 ?auto_212117 )
      ( MAKE-6PILE ?auto_212114 ?auto_212115 ?auto_212116 ?auto_212117 ?auto_212118 ?auto_212119 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212122 - BLOCK
      ?auto_212123 - BLOCK
      ?auto_212124 - BLOCK
      ?auto_212125 - BLOCK
      ?auto_212126 - BLOCK
      ?auto_212127 - BLOCK
    )
    :vars
    (
      ?auto_212129 - BLOCK
      ?auto_212128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212122 ) ( ON ?auto_212123 ?auto_212122 ) ( ON ?auto_212124 ?auto_212123 ) ( not ( = ?auto_212122 ?auto_212123 ) ) ( not ( = ?auto_212122 ?auto_212124 ) ) ( not ( = ?auto_212122 ?auto_212125 ) ) ( not ( = ?auto_212122 ?auto_212126 ) ) ( not ( = ?auto_212122 ?auto_212127 ) ) ( not ( = ?auto_212123 ?auto_212124 ) ) ( not ( = ?auto_212123 ?auto_212125 ) ) ( not ( = ?auto_212123 ?auto_212126 ) ) ( not ( = ?auto_212123 ?auto_212127 ) ) ( not ( = ?auto_212124 ?auto_212125 ) ) ( not ( = ?auto_212124 ?auto_212126 ) ) ( not ( = ?auto_212124 ?auto_212127 ) ) ( not ( = ?auto_212125 ?auto_212126 ) ) ( not ( = ?auto_212125 ?auto_212127 ) ) ( not ( = ?auto_212126 ?auto_212127 ) ) ( ON ?auto_212127 ?auto_212129 ) ( not ( = ?auto_212122 ?auto_212129 ) ) ( not ( = ?auto_212123 ?auto_212129 ) ) ( not ( = ?auto_212124 ?auto_212129 ) ) ( not ( = ?auto_212125 ?auto_212129 ) ) ( not ( = ?auto_212126 ?auto_212129 ) ) ( not ( = ?auto_212127 ?auto_212129 ) ) ( ON ?auto_212126 ?auto_212127 ) ( ON-TABLE ?auto_212128 ) ( ON ?auto_212129 ?auto_212128 ) ( not ( = ?auto_212128 ?auto_212129 ) ) ( not ( = ?auto_212128 ?auto_212127 ) ) ( not ( = ?auto_212128 ?auto_212126 ) ) ( not ( = ?auto_212122 ?auto_212128 ) ) ( not ( = ?auto_212123 ?auto_212128 ) ) ( not ( = ?auto_212124 ?auto_212128 ) ) ( not ( = ?auto_212125 ?auto_212128 ) ) ( CLEAR ?auto_212124 ) ( ON ?auto_212125 ?auto_212126 ) ( CLEAR ?auto_212125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212128 ?auto_212129 ?auto_212127 ?auto_212126 )
      ( MAKE-6PILE ?auto_212122 ?auto_212123 ?auto_212124 ?auto_212125 ?auto_212126 ?auto_212127 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212130 - BLOCK
      ?auto_212131 - BLOCK
      ?auto_212132 - BLOCK
      ?auto_212133 - BLOCK
      ?auto_212134 - BLOCK
      ?auto_212135 - BLOCK
    )
    :vars
    (
      ?auto_212136 - BLOCK
      ?auto_212137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212130 ) ( ON ?auto_212131 ?auto_212130 ) ( not ( = ?auto_212130 ?auto_212131 ) ) ( not ( = ?auto_212130 ?auto_212132 ) ) ( not ( = ?auto_212130 ?auto_212133 ) ) ( not ( = ?auto_212130 ?auto_212134 ) ) ( not ( = ?auto_212130 ?auto_212135 ) ) ( not ( = ?auto_212131 ?auto_212132 ) ) ( not ( = ?auto_212131 ?auto_212133 ) ) ( not ( = ?auto_212131 ?auto_212134 ) ) ( not ( = ?auto_212131 ?auto_212135 ) ) ( not ( = ?auto_212132 ?auto_212133 ) ) ( not ( = ?auto_212132 ?auto_212134 ) ) ( not ( = ?auto_212132 ?auto_212135 ) ) ( not ( = ?auto_212133 ?auto_212134 ) ) ( not ( = ?auto_212133 ?auto_212135 ) ) ( not ( = ?auto_212134 ?auto_212135 ) ) ( ON ?auto_212135 ?auto_212136 ) ( not ( = ?auto_212130 ?auto_212136 ) ) ( not ( = ?auto_212131 ?auto_212136 ) ) ( not ( = ?auto_212132 ?auto_212136 ) ) ( not ( = ?auto_212133 ?auto_212136 ) ) ( not ( = ?auto_212134 ?auto_212136 ) ) ( not ( = ?auto_212135 ?auto_212136 ) ) ( ON ?auto_212134 ?auto_212135 ) ( ON-TABLE ?auto_212137 ) ( ON ?auto_212136 ?auto_212137 ) ( not ( = ?auto_212137 ?auto_212136 ) ) ( not ( = ?auto_212137 ?auto_212135 ) ) ( not ( = ?auto_212137 ?auto_212134 ) ) ( not ( = ?auto_212130 ?auto_212137 ) ) ( not ( = ?auto_212131 ?auto_212137 ) ) ( not ( = ?auto_212132 ?auto_212137 ) ) ( not ( = ?auto_212133 ?auto_212137 ) ) ( ON ?auto_212133 ?auto_212134 ) ( CLEAR ?auto_212133 ) ( HOLDING ?auto_212132 ) ( CLEAR ?auto_212131 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212130 ?auto_212131 ?auto_212132 )
      ( MAKE-6PILE ?auto_212130 ?auto_212131 ?auto_212132 ?auto_212133 ?auto_212134 ?auto_212135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212138 - BLOCK
      ?auto_212139 - BLOCK
      ?auto_212140 - BLOCK
      ?auto_212141 - BLOCK
      ?auto_212142 - BLOCK
      ?auto_212143 - BLOCK
    )
    :vars
    (
      ?auto_212145 - BLOCK
      ?auto_212144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212138 ) ( ON ?auto_212139 ?auto_212138 ) ( not ( = ?auto_212138 ?auto_212139 ) ) ( not ( = ?auto_212138 ?auto_212140 ) ) ( not ( = ?auto_212138 ?auto_212141 ) ) ( not ( = ?auto_212138 ?auto_212142 ) ) ( not ( = ?auto_212138 ?auto_212143 ) ) ( not ( = ?auto_212139 ?auto_212140 ) ) ( not ( = ?auto_212139 ?auto_212141 ) ) ( not ( = ?auto_212139 ?auto_212142 ) ) ( not ( = ?auto_212139 ?auto_212143 ) ) ( not ( = ?auto_212140 ?auto_212141 ) ) ( not ( = ?auto_212140 ?auto_212142 ) ) ( not ( = ?auto_212140 ?auto_212143 ) ) ( not ( = ?auto_212141 ?auto_212142 ) ) ( not ( = ?auto_212141 ?auto_212143 ) ) ( not ( = ?auto_212142 ?auto_212143 ) ) ( ON ?auto_212143 ?auto_212145 ) ( not ( = ?auto_212138 ?auto_212145 ) ) ( not ( = ?auto_212139 ?auto_212145 ) ) ( not ( = ?auto_212140 ?auto_212145 ) ) ( not ( = ?auto_212141 ?auto_212145 ) ) ( not ( = ?auto_212142 ?auto_212145 ) ) ( not ( = ?auto_212143 ?auto_212145 ) ) ( ON ?auto_212142 ?auto_212143 ) ( ON-TABLE ?auto_212144 ) ( ON ?auto_212145 ?auto_212144 ) ( not ( = ?auto_212144 ?auto_212145 ) ) ( not ( = ?auto_212144 ?auto_212143 ) ) ( not ( = ?auto_212144 ?auto_212142 ) ) ( not ( = ?auto_212138 ?auto_212144 ) ) ( not ( = ?auto_212139 ?auto_212144 ) ) ( not ( = ?auto_212140 ?auto_212144 ) ) ( not ( = ?auto_212141 ?auto_212144 ) ) ( ON ?auto_212141 ?auto_212142 ) ( CLEAR ?auto_212139 ) ( ON ?auto_212140 ?auto_212141 ) ( CLEAR ?auto_212140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212144 ?auto_212145 ?auto_212143 ?auto_212142 ?auto_212141 )
      ( MAKE-6PILE ?auto_212138 ?auto_212139 ?auto_212140 ?auto_212141 ?auto_212142 ?auto_212143 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212146 - BLOCK
      ?auto_212147 - BLOCK
      ?auto_212148 - BLOCK
      ?auto_212149 - BLOCK
      ?auto_212150 - BLOCK
      ?auto_212151 - BLOCK
    )
    :vars
    (
      ?auto_212152 - BLOCK
      ?auto_212153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212146 ) ( not ( = ?auto_212146 ?auto_212147 ) ) ( not ( = ?auto_212146 ?auto_212148 ) ) ( not ( = ?auto_212146 ?auto_212149 ) ) ( not ( = ?auto_212146 ?auto_212150 ) ) ( not ( = ?auto_212146 ?auto_212151 ) ) ( not ( = ?auto_212147 ?auto_212148 ) ) ( not ( = ?auto_212147 ?auto_212149 ) ) ( not ( = ?auto_212147 ?auto_212150 ) ) ( not ( = ?auto_212147 ?auto_212151 ) ) ( not ( = ?auto_212148 ?auto_212149 ) ) ( not ( = ?auto_212148 ?auto_212150 ) ) ( not ( = ?auto_212148 ?auto_212151 ) ) ( not ( = ?auto_212149 ?auto_212150 ) ) ( not ( = ?auto_212149 ?auto_212151 ) ) ( not ( = ?auto_212150 ?auto_212151 ) ) ( ON ?auto_212151 ?auto_212152 ) ( not ( = ?auto_212146 ?auto_212152 ) ) ( not ( = ?auto_212147 ?auto_212152 ) ) ( not ( = ?auto_212148 ?auto_212152 ) ) ( not ( = ?auto_212149 ?auto_212152 ) ) ( not ( = ?auto_212150 ?auto_212152 ) ) ( not ( = ?auto_212151 ?auto_212152 ) ) ( ON ?auto_212150 ?auto_212151 ) ( ON-TABLE ?auto_212153 ) ( ON ?auto_212152 ?auto_212153 ) ( not ( = ?auto_212153 ?auto_212152 ) ) ( not ( = ?auto_212153 ?auto_212151 ) ) ( not ( = ?auto_212153 ?auto_212150 ) ) ( not ( = ?auto_212146 ?auto_212153 ) ) ( not ( = ?auto_212147 ?auto_212153 ) ) ( not ( = ?auto_212148 ?auto_212153 ) ) ( not ( = ?auto_212149 ?auto_212153 ) ) ( ON ?auto_212149 ?auto_212150 ) ( ON ?auto_212148 ?auto_212149 ) ( CLEAR ?auto_212148 ) ( HOLDING ?auto_212147 ) ( CLEAR ?auto_212146 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212146 ?auto_212147 )
      ( MAKE-6PILE ?auto_212146 ?auto_212147 ?auto_212148 ?auto_212149 ?auto_212150 ?auto_212151 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212154 - BLOCK
      ?auto_212155 - BLOCK
      ?auto_212156 - BLOCK
      ?auto_212157 - BLOCK
      ?auto_212158 - BLOCK
      ?auto_212159 - BLOCK
    )
    :vars
    (
      ?auto_212161 - BLOCK
      ?auto_212160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212154 ) ( not ( = ?auto_212154 ?auto_212155 ) ) ( not ( = ?auto_212154 ?auto_212156 ) ) ( not ( = ?auto_212154 ?auto_212157 ) ) ( not ( = ?auto_212154 ?auto_212158 ) ) ( not ( = ?auto_212154 ?auto_212159 ) ) ( not ( = ?auto_212155 ?auto_212156 ) ) ( not ( = ?auto_212155 ?auto_212157 ) ) ( not ( = ?auto_212155 ?auto_212158 ) ) ( not ( = ?auto_212155 ?auto_212159 ) ) ( not ( = ?auto_212156 ?auto_212157 ) ) ( not ( = ?auto_212156 ?auto_212158 ) ) ( not ( = ?auto_212156 ?auto_212159 ) ) ( not ( = ?auto_212157 ?auto_212158 ) ) ( not ( = ?auto_212157 ?auto_212159 ) ) ( not ( = ?auto_212158 ?auto_212159 ) ) ( ON ?auto_212159 ?auto_212161 ) ( not ( = ?auto_212154 ?auto_212161 ) ) ( not ( = ?auto_212155 ?auto_212161 ) ) ( not ( = ?auto_212156 ?auto_212161 ) ) ( not ( = ?auto_212157 ?auto_212161 ) ) ( not ( = ?auto_212158 ?auto_212161 ) ) ( not ( = ?auto_212159 ?auto_212161 ) ) ( ON ?auto_212158 ?auto_212159 ) ( ON-TABLE ?auto_212160 ) ( ON ?auto_212161 ?auto_212160 ) ( not ( = ?auto_212160 ?auto_212161 ) ) ( not ( = ?auto_212160 ?auto_212159 ) ) ( not ( = ?auto_212160 ?auto_212158 ) ) ( not ( = ?auto_212154 ?auto_212160 ) ) ( not ( = ?auto_212155 ?auto_212160 ) ) ( not ( = ?auto_212156 ?auto_212160 ) ) ( not ( = ?auto_212157 ?auto_212160 ) ) ( ON ?auto_212157 ?auto_212158 ) ( ON ?auto_212156 ?auto_212157 ) ( CLEAR ?auto_212154 ) ( ON ?auto_212155 ?auto_212156 ) ( CLEAR ?auto_212155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212160 ?auto_212161 ?auto_212159 ?auto_212158 ?auto_212157 ?auto_212156 )
      ( MAKE-6PILE ?auto_212154 ?auto_212155 ?auto_212156 ?auto_212157 ?auto_212158 ?auto_212159 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212162 - BLOCK
      ?auto_212163 - BLOCK
      ?auto_212164 - BLOCK
      ?auto_212165 - BLOCK
      ?auto_212166 - BLOCK
      ?auto_212167 - BLOCK
    )
    :vars
    (
      ?auto_212169 - BLOCK
      ?auto_212168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212162 ?auto_212163 ) ) ( not ( = ?auto_212162 ?auto_212164 ) ) ( not ( = ?auto_212162 ?auto_212165 ) ) ( not ( = ?auto_212162 ?auto_212166 ) ) ( not ( = ?auto_212162 ?auto_212167 ) ) ( not ( = ?auto_212163 ?auto_212164 ) ) ( not ( = ?auto_212163 ?auto_212165 ) ) ( not ( = ?auto_212163 ?auto_212166 ) ) ( not ( = ?auto_212163 ?auto_212167 ) ) ( not ( = ?auto_212164 ?auto_212165 ) ) ( not ( = ?auto_212164 ?auto_212166 ) ) ( not ( = ?auto_212164 ?auto_212167 ) ) ( not ( = ?auto_212165 ?auto_212166 ) ) ( not ( = ?auto_212165 ?auto_212167 ) ) ( not ( = ?auto_212166 ?auto_212167 ) ) ( ON ?auto_212167 ?auto_212169 ) ( not ( = ?auto_212162 ?auto_212169 ) ) ( not ( = ?auto_212163 ?auto_212169 ) ) ( not ( = ?auto_212164 ?auto_212169 ) ) ( not ( = ?auto_212165 ?auto_212169 ) ) ( not ( = ?auto_212166 ?auto_212169 ) ) ( not ( = ?auto_212167 ?auto_212169 ) ) ( ON ?auto_212166 ?auto_212167 ) ( ON-TABLE ?auto_212168 ) ( ON ?auto_212169 ?auto_212168 ) ( not ( = ?auto_212168 ?auto_212169 ) ) ( not ( = ?auto_212168 ?auto_212167 ) ) ( not ( = ?auto_212168 ?auto_212166 ) ) ( not ( = ?auto_212162 ?auto_212168 ) ) ( not ( = ?auto_212163 ?auto_212168 ) ) ( not ( = ?auto_212164 ?auto_212168 ) ) ( not ( = ?auto_212165 ?auto_212168 ) ) ( ON ?auto_212165 ?auto_212166 ) ( ON ?auto_212164 ?auto_212165 ) ( ON ?auto_212163 ?auto_212164 ) ( CLEAR ?auto_212163 ) ( HOLDING ?auto_212162 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212162 )
      ( MAKE-6PILE ?auto_212162 ?auto_212163 ?auto_212164 ?auto_212165 ?auto_212166 ?auto_212167 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212170 - BLOCK
      ?auto_212171 - BLOCK
      ?auto_212172 - BLOCK
      ?auto_212173 - BLOCK
      ?auto_212174 - BLOCK
      ?auto_212175 - BLOCK
    )
    :vars
    (
      ?auto_212177 - BLOCK
      ?auto_212176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212170 ?auto_212171 ) ) ( not ( = ?auto_212170 ?auto_212172 ) ) ( not ( = ?auto_212170 ?auto_212173 ) ) ( not ( = ?auto_212170 ?auto_212174 ) ) ( not ( = ?auto_212170 ?auto_212175 ) ) ( not ( = ?auto_212171 ?auto_212172 ) ) ( not ( = ?auto_212171 ?auto_212173 ) ) ( not ( = ?auto_212171 ?auto_212174 ) ) ( not ( = ?auto_212171 ?auto_212175 ) ) ( not ( = ?auto_212172 ?auto_212173 ) ) ( not ( = ?auto_212172 ?auto_212174 ) ) ( not ( = ?auto_212172 ?auto_212175 ) ) ( not ( = ?auto_212173 ?auto_212174 ) ) ( not ( = ?auto_212173 ?auto_212175 ) ) ( not ( = ?auto_212174 ?auto_212175 ) ) ( ON ?auto_212175 ?auto_212177 ) ( not ( = ?auto_212170 ?auto_212177 ) ) ( not ( = ?auto_212171 ?auto_212177 ) ) ( not ( = ?auto_212172 ?auto_212177 ) ) ( not ( = ?auto_212173 ?auto_212177 ) ) ( not ( = ?auto_212174 ?auto_212177 ) ) ( not ( = ?auto_212175 ?auto_212177 ) ) ( ON ?auto_212174 ?auto_212175 ) ( ON-TABLE ?auto_212176 ) ( ON ?auto_212177 ?auto_212176 ) ( not ( = ?auto_212176 ?auto_212177 ) ) ( not ( = ?auto_212176 ?auto_212175 ) ) ( not ( = ?auto_212176 ?auto_212174 ) ) ( not ( = ?auto_212170 ?auto_212176 ) ) ( not ( = ?auto_212171 ?auto_212176 ) ) ( not ( = ?auto_212172 ?auto_212176 ) ) ( not ( = ?auto_212173 ?auto_212176 ) ) ( ON ?auto_212173 ?auto_212174 ) ( ON ?auto_212172 ?auto_212173 ) ( ON ?auto_212171 ?auto_212172 ) ( ON ?auto_212170 ?auto_212171 ) ( CLEAR ?auto_212170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212176 ?auto_212177 ?auto_212175 ?auto_212174 ?auto_212173 ?auto_212172 ?auto_212171 )
      ( MAKE-6PILE ?auto_212170 ?auto_212171 ?auto_212172 ?auto_212173 ?auto_212174 ?auto_212175 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212178 - BLOCK
      ?auto_212179 - BLOCK
      ?auto_212180 - BLOCK
      ?auto_212181 - BLOCK
      ?auto_212182 - BLOCK
      ?auto_212183 - BLOCK
    )
    :vars
    (
      ?auto_212184 - BLOCK
      ?auto_212185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212178 ?auto_212179 ) ) ( not ( = ?auto_212178 ?auto_212180 ) ) ( not ( = ?auto_212178 ?auto_212181 ) ) ( not ( = ?auto_212178 ?auto_212182 ) ) ( not ( = ?auto_212178 ?auto_212183 ) ) ( not ( = ?auto_212179 ?auto_212180 ) ) ( not ( = ?auto_212179 ?auto_212181 ) ) ( not ( = ?auto_212179 ?auto_212182 ) ) ( not ( = ?auto_212179 ?auto_212183 ) ) ( not ( = ?auto_212180 ?auto_212181 ) ) ( not ( = ?auto_212180 ?auto_212182 ) ) ( not ( = ?auto_212180 ?auto_212183 ) ) ( not ( = ?auto_212181 ?auto_212182 ) ) ( not ( = ?auto_212181 ?auto_212183 ) ) ( not ( = ?auto_212182 ?auto_212183 ) ) ( ON ?auto_212183 ?auto_212184 ) ( not ( = ?auto_212178 ?auto_212184 ) ) ( not ( = ?auto_212179 ?auto_212184 ) ) ( not ( = ?auto_212180 ?auto_212184 ) ) ( not ( = ?auto_212181 ?auto_212184 ) ) ( not ( = ?auto_212182 ?auto_212184 ) ) ( not ( = ?auto_212183 ?auto_212184 ) ) ( ON ?auto_212182 ?auto_212183 ) ( ON-TABLE ?auto_212185 ) ( ON ?auto_212184 ?auto_212185 ) ( not ( = ?auto_212185 ?auto_212184 ) ) ( not ( = ?auto_212185 ?auto_212183 ) ) ( not ( = ?auto_212185 ?auto_212182 ) ) ( not ( = ?auto_212178 ?auto_212185 ) ) ( not ( = ?auto_212179 ?auto_212185 ) ) ( not ( = ?auto_212180 ?auto_212185 ) ) ( not ( = ?auto_212181 ?auto_212185 ) ) ( ON ?auto_212181 ?auto_212182 ) ( ON ?auto_212180 ?auto_212181 ) ( ON ?auto_212179 ?auto_212180 ) ( HOLDING ?auto_212178 ) ( CLEAR ?auto_212179 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_212185 ?auto_212184 ?auto_212183 ?auto_212182 ?auto_212181 ?auto_212180 ?auto_212179 ?auto_212178 )
      ( MAKE-6PILE ?auto_212178 ?auto_212179 ?auto_212180 ?auto_212181 ?auto_212182 ?auto_212183 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212186 - BLOCK
      ?auto_212187 - BLOCK
      ?auto_212188 - BLOCK
      ?auto_212189 - BLOCK
      ?auto_212190 - BLOCK
      ?auto_212191 - BLOCK
    )
    :vars
    (
      ?auto_212192 - BLOCK
      ?auto_212193 - BLOCK
      ?auto_212194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212186 ?auto_212187 ) ) ( not ( = ?auto_212186 ?auto_212188 ) ) ( not ( = ?auto_212186 ?auto_212189 ) ) ( not ( = ?auto_212186 ?auto_212190 ) ) ( not ( = ?auto_212186 ?auto_212191 ) ) ( not ( = ?auto_212187 ?auto_212188 ) ) ( not ( = ?auto_212187 ?auto_212189 ) ) ( not ( = ?auto_212187 ?auto_212190 ) ) ( not ( = ?auto_212187 ?auto_212191 ) ) ( not ( = ?auto_212188 ?auto_212189 ) ) ( not ( = ?auto_212188 ?auto_212190 ) ) ( not ( = ?auto_212188 ?auto_212191 ) ) ( not ( = ?auto_212189 ?auto_212190 ) ) ( not ( = ?auto_212189 ?auto_212191 ) ) ( not ( = ?auto_212190 ?auto_212191 ) ) ( ON ?auto_212191 ?auto_212192 ) ( not ( = ?auto_212186 ?auto_212192 ) ) ( not ( = ?auto_212187 ?auto_212192 ) ) ( not ( = ?auto_212188 ?auto_212192 ) ) ( not ( = ?auto_212189 ?auto_212192 ) ) ( not ( = ?auto_212190 ?auto_212192 ) ) ( not ( = ?auto_212191 ?auto_212192 ) ) ( ON ?auto_212190 ?auto_212191 ) ( ON-TABLE ?auto_212193 ) ( ON ?auto_212192 ?auto_212193 ) ( not ( = ?auto_212193 ?auto_212192 ) ) ( not ( = ?auto_212193 ?auto_212191 ) ) ( not ( = ?auto_212193 ?auto_212190 ) ) ( not ( = ?auto_212186 ?auto_212193 ) ) ( not ( = ?auto_212187 ?auto_212193 ) ) ( not ( = ?auto_212188 ?auto_212193 ) ) ( not ( = ?auto_212189 ?auto_212193 ) ) ( ON ?auto_212189 ?auto_212190 ) ( ON ?auto_212188 ?auto_212189 ) ( ON ?auto_212187 ?auto_212188 ) ( CLEAR ?auto_212187 ) ( ON ?auto_212186 ?auto_212194 ) ( CLEAR ?auto_212186 ) ( HAND-EMPTY ) ( not ( = ?auto_212186 ?auto_212194 ) ) ( not ( = ?auto_212187 ?auto_212194 ) ) ( not ( = ?auto_212188 ?auto_212194 ) ) ( not ( = ?auto_212189 ?auto_212194 ) ) ( not ( = ?auto_212190 ?auto_212194 ) ) ( not ( = ?auto_212191 ?auto_212194 ) ) ( not ( = ?auto_212192 ?auto_212194 ) ) ( not ( = ?auto_212193 ?auto_212194 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212186 ?auto_212194 )
      ( MAKE-6PILE ?auto_212186 ?auto_212187 ?auto_212188 ?auto_212189 ?auto_212190 ?auto_212191 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212195 - BLOCK
      ?auto_212196 - BLOCK
      ?auto_212197 - BLOCK
      ?auto_212198 - BLOCK
      ?auto_212199 - BLOCK
      ?auto_212200 - BLOCK
    )
    :vars
    (
      ?auto_212203 - BLOCK
      ?auto_212202 - BLOCK
      ?auto_212201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212195 ?auto_212196 ) ) ( not ( = ?auto_212195 ?auto_212197 ) ) ( not ( = ?auto_212195 ?auto_212198 ) ) ( not ( = ?auto_212195 ?auto_212199 ) ) ( not ( = ?auto_212195 ?auto_212200 ) ) ( not ( = ?auto_212196 ?auto_212197 ) ) ( not ( = ?auto_212196 ?auto_212198 ) ) ( not ( = ?auto_212196 ?auto_212199 ) ) ( not ( = ?auto_212196 ?auto_212200 ) ) ( not ( = ?auto_212197 ?auto_212198 ) ) ( not ( = ?auto_212197 ?auto_212199 ) ) ( not ( = ?auto_212197 ?auto_212200 ) ) ( not ( = ?auto_212198 ?auto_212199 ) ) ( not ( = ?auto_212198 ?auto_212200 ) ) ( not ( = ?auto_212199 ?auto_212200 ) ) ( ON ?auto_212200 ?auto_212203 ) ( not ( = ?auto_212195 ?auto_212203 ) ) ( not ( = ?auto_212196 ?auto_212203 ) ) ( not ( = ?auto_212197 ?auto_212203 ) ) ( not ( = ?auto_212198 ?auto_212203 ) ) ( not ( = ?auto_212199 ?auto_212203 ) ) ( not ( = ?auto_212200 ?auto_212203 ) ) ( ON ?auto_212199 ?auto_212200 ) ( ON-TABLE ?auto_212202 ) ( ON ?auto_212203 ?auto_212202 ) ( not ( = ?auto_212202 ?auto_212203 ) ) ( not ( = ?auto_212202 ?auto_212200 ) ) ( not ( = ?auto_212202 ?auto_212199 ) ) ( not ( = ?auto_212195 ?auto_212202 ) ) ( not ( = ?auto_212196 ?auto_212202 ) ) ( not ( = ?auto_212197 ?auto_212202 ) ) ( not ( = ?auto_212198 ?auto_212202 ) ) ( ON ?auto_212198 ?auto_212199 ) ( ON ?auto_212197 ?auto_212198 ) ( ON ?auto_212195 ?auto_212201 ) ( CLEAR ?auto_212195 ) ( not ( = ?auto_212195 ?auto_212201 ) ) ( not ( = ?auto_212196 ?auto_212201 ) ) ( not ( = ?auto_212197 ?auto_212201 ) ) ( not ( = ?auto_212198 ?auto_212201 ) ) ( not ( = ?auto_212199 ?auto_212201 ) ) ( not ( = ?auto_212200 ?auto_212201 ) ) ( not ( = ?auto_212203 ?auto_212201 ) ) ( not ( = ?auto_212202 ?auto_212201 ) ) ( HOLDING ?auto_212196 ) ( CLEAR ?auto_212197 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212202 ?auto_212203 ?auto_212200 ?auto_212199 ?auto_212198 ?auto_212197 ?auto_212196 )
      ( MAKE-6PILE ?auto_212195 ?auto_212196 ?auto_212197 ?auto_212198 ?auto_212199 ?auto_212200 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212204 - BLOCK
      ?auto_212205 - BLOCK
      ?auto_212206 - BLOCK
      ?auto_212207 - BLOCK
      ?auto_212208 - BLOCK
      ?auto_212209 - BLOCK
    )
    :vars
    (
      ?auto_212211 - BLOCK
      ?auto_212210 - BLOCK
      ?auto_212212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212204 ?auto_212205 ) ) ( not ( = ?auto_212204 ?auto_212206 ) ) ( not ( = ?auto_212204 ?auto_212207 ) ) ( not ( = ?auto_212204 ?auto_212208 ) ) ( not ( = ?auto_212204 ?auto_212209 ) ) ( not ( = ?auto_212205 ?auto_212206 ) ) ( not ( = ?auto_212205 ?auto_212207 ) ) ( not ( = ?auto_212205 ?auto_212208 ) ) ( not ( = ?auto_212205 ?auto_212209 ) ) ( not ( = ?auto_212206 ?auto_212207 ) ) ( not ( = ?auto_212206 ?auto_212208 ) ) ( not ( = ?auto_212206 ?auto_212209 ) ) ( not ( = ?auto_212207 ?auto_212208 ) ) ( not ( = ?auto_212207 ?auto_212209 ) ) ( not ( = ?auto_212208 ?auto_212209 ) ) ( ON ?auto_212209 ?auto_212211 ) ( not ( = ?auto_212204 ?auto_212211 ) ) ( not ( = ?auto_212205 ?auto_212211 ) ) ( not ( = ?auto_212206 ?auto_212211 ) ) ( not ( = ?auto_212207 ?auto_212211 ) ) ( not ( = ?auto_212208 ?auto_212211 ) ) ( not ( = ?auto_212209 ?auto_212211 ) ) ( ON ?auto_212208 ?auto_212209 ) ( ON-TABLE ?auto_212210 ) ( ON ?auto_212211 ?auto_212210 ) ( not ( = ?auto_212210 ?auto_212211 ) ) ( not ( = ?auto_212210 ?auto_212209 ) ) ( not ( = ?auto_212210 ?auto_212208 ) ) ( not ( = ?auto_212204 ?auto_212210 ) ) ( not ( = ?auto_212205 ?auto_212210 ) ) ( not ( = ?auto_212206 ?auto_212210 ) ) ( not ( = ?auto_212207 ?auto_212210 ) ) ( ON ?auto_212207 ?auto_212208 ) ( ON ?auto_212206 ?auto_212207 ) ( ON ?auto_212204 ?auto_212212 ) ( not ( = ?auto_212204 ?auto_212212 ) ) ( not ( = ?auto_212205 ?auto_212212 ) ) ( not ( = ?auto_212206 ?auto_212212 ) ) ( not ( = ?auto_212207 ?auto_212212 ) ) ( not ( = ?auto_212208 ?auto_212212 ) ) ( not ( = ?auto_212209 ?auto_212212 ) ) ( not ( = ?auto_212211 ?auto_212212 ) ) ( not ( = ?auto_212210 ?auto_212212 ) ) ( CLEAR ?auto_212206 ) ( ON ?auto_212205 ?auto_212204 ) ( CLEAR ?auto_212205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212212 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212212 ?auto_212204 )
      ( MAKE-6PILE ?auto_212204 ?auto_212205 ?auto_212206 ?auto_212207 ?auto_212208 ?auto_212209 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212213 - BLOCK
      ?auto_212214 - BLOCK
      ?auto_212215 - BLOCK
      ?auto_212216 - BLOCK
      ?auto_212217 - BLOCK
      ?auto_212218 - BLOCK
    )
    :vars
    (
      ?auto_212220 - BLOCK
      ?auto_212219 - BLOCK
      ?auto_212221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212213 ?auto_212214 ) ) ( not ( = ?auto_212213 ?auto_212215 ) ) ( not ( = ?auto_212213 ?auto_212216 ) ) ( not ( = ?auto_212213 ?auto_212217 ) ) ( not ( = ?auto_212213 ?auto_212218 ) ) ( not ( = ?auto_212214 ?auto_212215 ) ) ( not ( = ?auto_212214 ?auto_212216 ) ) ( not ( = ?auto_212214 ?auto_212217 ) ) ( not ( = ?auto_212214 ?auto_212218 ) ) ( not ( = ?auto_212215 ?auto_212216 ) ) ( not ( = ?auto_212215 ?auto_212217 ) ) ( not ( = ?auto_212215 ?auto_212218 ) ) ( not ( = ?auto_212216 ?auto_212217 ) ) ( not ( = ?auto_212216 ?auto_212218 ) ) ( not ( = ?auto_212217 ?auto_212218 ) ) ( ON ?auto_212218 ?auto_212220 ) ( not ( = ?auto_212213 ?auto_212220 ) ) ( not ( = ?auto_212214 ?auto_212220 ) ) ( not ( = ?auto_212215 ?auto_212220 ) ) ( not ( = ?auto_212216 ?auto_212220 ) ) ( not ( = ?auto_212217 ?auto_212220 ) ) ( not ( = ?auto_212218 ?auto_212220 ) ) ( ON ?auto_212217 ?auto_212218 ) ( ON-TABLE ?auto_212219 ) ( ON ?auto_212220 ?auto_212219 ) ( not ( = ?auto_212219 ?auto_212220 ) ) ( not ( = ?auto_212219 ?auto_212218 ) ) ( not ( = ?auto_212219 ?auto_212217 ) ) ( not ( = ?auto_212213 ?auto_212219 ) ) ( not ( = ?auto_212214 ?auto_212219 ) ) ( not ( = ?auto_212215 ?auto_212219 ) ) ( not ( = ?auto_212216 ?auto_212219 ) ) ( ON ?auto_212216 ?auto_212217 ) ( ON ?auto_212213 ?auto_212221 ) ( not ( = ?auto_212213 ?auto_212221 ) ) ( not ( = ?auto_212214 ?auto_212221 ) ) ( not ( = ?auto_212215 ?auto_212221 ) ) ( not ( = ?auto_212216 ?auto_212221 ) ) ( not ( = ?auto_212217 ?auto_212221 ) ) ( not ( = ?auto_212218 ?auto_212221 ) ) ( not ( = ?auto_212220 ?auto_212221 ) ) ( not ( = ?auto_212219 ?auto_212221 ) ) ( ON ?auto_212214 ?auto_212213 ) ( CLEAR ?auto_212214 ) ( ON-TABLE ?auto_212221 ) ( HOLDING ?auto_212215 ) ( CLEAR ?auto_212216 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212219 ?auto_212220 ?auto_212218 ?auto_212217 ?auto_212216 ?auto_212215 )
      ( MAKE-6PILE ?auto_212213 ?auto_212214 ?auto_212215 ?auto_212216 ?auto_212217 ?auto_212218 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212222 - BLOCK
      ?auto_212223 - BLOCK
      ?auto_212224 - BLOCK
      ?auto_212225 - BLOCK
      ?auto_212226 - BLOCK
      ?auto_212227 - BLOCK
    )
    :vars
    (
      ?auto_212230 - BLOCK
      ?auto_212229 - BLOCK
      ?auto_212228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212222 ?auto_212223 ) ) ( not ( = ?auto_212222 ?auto_212224 ) ) ( not ( = ?auto_212222 ?auto_212225 ) ) ( not ( = ?auto_212222 ?auto_212226 ) ) ( not ( = ?auto_212222 ?auto_212227 ) ) ( not ( = ?auto_212223 ?auto_212224 ) ) ( not ( = ?auto_212223 ?auto_212225 ) ) ( not ( = ?auto_212223 ?auto_212226 ) ) ( not ( = ?auto_212223 ?auto_212227 ) ) ( not ( = ?auto_212224 ?auto_212225 ) ) ( not ( = ?auto_212224 ?auto_212226 ) ) ( not ( = ?auto_212224 ?auto_212227 ) ) ( not ( = ?auto_212225 ?auto_212226 ) ) ( not ( = ?auto_212225 ?auto_212227 ) ) ( not ( = ?auto_212226 ?auto_212227 ) ) ( ON ?auto_212227 ?auto_212230 ) ( not ( = ?auto_212222 ?auto_212230 ) ) ( not ( = ?auto_212223 ?auto_212230 ) ) ( not ( = ?auto_212224 ?auto_212230 ) ) ( not ( = ?auto_212225 ?auto_212230 ) ) ( not ( = ?auto_212226 ?auto_212230 ) ) ( not ( = ?auto_212227 ?auto_212230 ) ) ( ON ?auto_212226 ?auto_212227 ) ( ON-TABLE ?auto_212229 ) ( ON ?auto_212230 ?auto_212229 ) ( not ( = ?auto_212229 ?auto_212230 ) ) ( not ( = ?auto_212229 ?auto_212227 ) ) ( not ( = ?auto_212229 ?auto_212226 ) ) ( not ( = ?auto_212222 ?auto_212229 ) ) ( not ( = ?auto_212223 ?auto_212229 ) ) ( not ( = ?auto_212224 ?auto_212229 ) ) ( not ( = ?auto_212225 ?auto_212229 ) ) ( ON ?auto_212225 ?auto_212226 ) ( ON ?auto_212222 ?auto_212228 ) ( not ( = ?auto_212222 ?auto_212228 ) ) ( not ( = ?auto_212223 ?auto_212228 ) ) ( not ( = ?auto_212224 ?auto_212228 ) ) ( not ( = ?auto_212225 ?auto_212228 ) ) ( not ( = ?auto_212226 ?auto_212228 ) ) ( not ( = ?auto_212227 ?auto_212228 ) ) ( not ( = ?auto_212230 ?auto_212228 ) ) ( not ( = ?auto_212229 ?auto_212228 ) ) ( ON ?auto_212223 ?auto_212222 ) ( ON-TABLE ?auto_212228 ) ( CLEAR ?auto_212225 ) ( ON ?auto_212224 ?auto_212223 ) ( CLEAR ?auto_212224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212228 ?auto_212222 ?auto_212223 )
      ( MAKE-6PILE ?auto_212222 ?auto_212223 ?auto_212224 ?auto_212225 ?auto_212226 ?auto_212227 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212231 - BLOCK
      ?auto_212232 - BLOCK
      ?auto_212233 - BLOCK
      ?auto_212234 - BLOCK
      ?auto_212235 - BLOCK
      ?auto_212236 - BLOCK
    )
    :vars
    (
      ?auto_212239 - BLOCK
      ?auto_212238 - BLOCK
      ?auto_212237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212231 ?auto_212232 ) ) ( not ( = ?auto_212231 ?auto_212233 ) ) ( not ( = ?auto_212231 ?auto_212234 ) ) ( not ( = ?auto_212231 ?auto_212235 ) ) ( not ( = ?auto_212231 ?auto_212236 ) ) ( not ( = ?auto_212232 ?auto_212233 ) ) ( not ( = ?auto_212232 ?auto_212234 ) ) ( not ( = ?auto_212232 ?auto_212235 ) ) ( not ( = ?auto_212232 ?auto_212236 ) ) ( not ( = ?auto_212233 ?auto_212234 ) ) ( not ( = ?auto_212233 ?auto_212235 ) ) ( not ( = ?auto_212233 ?auto_212236 ) ) ( not ( = ?auto_212234 ?auto_212235 ) ) ( not ( = ?auto_212234 ?auto_212236 ) ) ( not ( = ?auto_212235 ?auto_212236 ) ) ( ON ?auto_212236 ?auto_212239 ) ( not ( = ?auto_212231 ?auto_212239 ) ) ( not ( = ?auto_212232 ?auto_212239 ) ) ( not ( = ?auto_212233 ?auto_212239 ) ) ( not ( = ?auto_212234 ?auto_212239 ) ) ( not ( = ?auto_212235 ?auto_212239 ) ) ( not ( = ?auto_212236 ?auto_212239 ) ) ( ON ?auto_212235 ?auto_212236 ) ( ON-TABLE ?auto_212238 ) ( ON ?auto_212239 ?auto_212238 ) ( not ( = ?auto_212238 ?auto_212239 ) ) ( not ( = ?auto_212238 ?auto_212236 ) ) ( not ( = ?auto_212238 ?auto_212235 ) ) ( not ( = ?auto_212231 ?auto_212238 ) ) ( not ( = ?auto_212232 ?auto_212238 ) ) ( not ( = ?auto_212233 ?auto_212238 ) ) ( not ( = ?auto_212234 ?auto_212238 ) ) ( ON ?auto_212231 ?auto_212237 ) ( not ( = ?auto_212231 ?auto_212237 ) ) ( not ( = ?auto_212232 ?auto_212237 ) ) ( not ( = ?auto_212233 ?auto_212237 ) ) ( not ( = ?auto_212234 ?auto_212237 ) ) ( not ( = ?auto_212235 ?auto_212237 ) ) ( not ( = ?auto_212236 ?auto_212237 ) ) ( not ( = ?auto_212239 ?auto_212237 ) ) ( not ( = ?auto_212238 ?auto_212237 ) ) ( ON ?auto_212232 ?auto_212231 ) ( ON-TABLE ?auto_212237 ) ( ON ?auto_212233 ?auto_212232 ) ( CLEAR ?auto_212233 ) ( HOLDING ?auto_212234 ) ( CLEAR ?auto_212235 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212238 ?auto_212239 ?auto_212236 ?auto_212235 ?auto_212234 )
      ( MAKE-6PILE ?auto_212231 ?auto_212232 ?auto_212233 ?auto_212234 ?auto_212235 ?auto_212236 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212240 - BLOCK
      ?auto_212241 - BLOCK
      ?auto_212242 - BLOCK
      ?auto_212243 - BLOCK
      ?auto_212244 - BLOCK
      ?auto_212245 - BLOCK
    )
    :vars
    (
      ?auto_212246 - BLOCK
      ?auto_212247 - BLOCK
      ?auto_212248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212240 ?auto_212241 ) ) ( not ( = ?auto_212240 ?auto_212242 ) ) ( not ( = ?auto_212240 ?auto_212243 ) ) ( not ( = ?auto_212240 ?auto_212244 ) ) ( not ( = ?auto_212240 ?auto_212245 ) ) ( not ( = ?auto_212241 ?auto_212242 ) ) ( not ( = ?auto_212241 ?auto_212243 ) ) ( not ( = ?auto_212241 ?auto_212244 ) ) ( not ( = ?auto_212241 ?auto_212245 ) ) ( not ( = ?auto_212242 ?auto_212243 ) ) ( not ( = ?auto_212242 ?auto_212244 ) ) ( not ( = ?auto_212242 ?auto_212245 ) ) ( not ( = ?auto_212243 ?auto_212244 ) ) ( not ( = ?auto_212243 ?auto_212245 ) ) ( not ( = ?auto_212244 ?auto_212245 ) ) ( ON ?auto_212245 ?auto_212246 ) ( not ( = ?auto_212240 ?auto_212246 ) ) ( not ( = ?auto_212241 ?auto_212246 ) ) ( not ( = ?auto_212242 ?auto_212246 ) ) ( not ( = ?auto_212243 ?auto_212246 ) ) ( not ( = ?auto_212244 ?auto_212246 ) ) ( not ( = ?auto_212245 ?auto_212246 ) ) ( ON ?auto_212244 ?auto_212245 ) ( ON-TABLE ?auto_212247 ) ( ON ?auto_212246 ?auto_212247 ) ( not ( = ?auto_212247 ?auto_212246 ) ) ( not ( = ?auto_212247 ?auto_212245 ) ) ( not ( = ?auto_212247 ?auto_212244 ) ) ( not ( = ?auto_212240 ?auto_212247 ) ) ( not ( = ?auto_212241 ?auto_212247 ) ) ( not ( = ?auto_212242 ?auto_212247 ) ) ( not ( = ?auto_212243 ?auto_212247 ) ) ( ON ?auto_212240 ?auto_212248 ) ( not ( = ?auto_212240 ?auto_212248 ) ) ( not ( = ?auto_212241 ?auto_212248 ) ) ( not ( = ?auto_212242 ?auto_212248 ) ) ( not ( = ?auto_212243 ?auto_212248 ) ) ( not ( = ?auto_212244 ?auto_212248 ) ) ( not ( = ?auto_212245 ?auto_212248 ) ) ( not ( = ?auto_212246 ?auto_212248 ) ) ( not ( = ?auto_212247 ?auto_212248 ) ) ( ON ?auto_212241 ?auto_212240 ) ( ON-TABLE ?auto_212248 ) ( ON ?auto_212242 ?auto_212241 ) ( CLEAR ?auto_212244 ) ( ON ?auto_212243 ?auto_212242 ) ( CLEAR ?auto_212243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212248 ?auto_212240 ?auto_212241 ?auto_212242 )
      ( MAKE-6PILE ?auto_212240 ?auto_212241 ?auto_212242 ?auto_212243 ?auto_212244 ?auto_212245 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212249 - BLOCK
      ?auto_212250 - BLOCK
      ?auto_212251 - BLOCK
      ?auto_212252 - BLOCK
      ?auto_212253 - BLOCK
      ?auto_212254 - BLOCK
    )
    :vars
    (
      ?auto_212256 - BLOCK
      ?auto_212257 - BLOCK
      ?auto_212255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212249 ?auto_212250 ) ) ( not ( = ?auto_212249 ?auto_212251 ) ) ( not ( = ?auto_212249 ?auto_212252 ) ) ( not ( = ?auto_212249 ?auto_212253 ) ) ( not ( = ?auto_212249 ?auto_212254 ) ) ( not ( = ?auto_212250 ?auto_212251 ) ) ( not ( = ?auto_212250 ?auto_212252 ) ) ( not ( = ?auto_212250 ?auto_212253 ) ) ( not ( = ?auto_212250 ?auto_212254 ) ) ( not ( = ?auto_212251 ?auto_212252 ) ) ( not ( = ?auto_212251 ?auto_212253 ) ) ( not ( = ?auto_212251 ?auto_212254 ) ) ( not ( = ?auto_212252 ?auto_212253 ) ) ( not ( = ?auto_212252 ?auto_212254 ) ) ( not ( = ?auto_212253 ?auto_212254 ) ) ( ON ?auto_212254 ?auto_212256 ) ( not ( = ?auto_212249 ?auto_212256 ) ) ( not ( = ?auto_212250 ?auto_212256 ) ) ( not ( = ?auto_212251 ?auto_212256 ) ) ( not ( = ?auto_212252 ?auto_212256 ) ) ( not ( = ?auto_212253 ?auto_212256 ) ) ( not ( = ?auto_212254 ?auto_212256 ) ) ( ON-TABLE ?auto_212257 ) ( ON ?auto_212256 ?auto_212257 ) ( not ( = ?auto_212257 ?auto_212256 ) ) ( not ( = ?auto_212257 ?auto_212254 ) ) ( not ( = ?auto_212257 ?auto_212253 ) ) ( not ( = ?auto_212249 ?auto_212257 ) ) ( not ( = ?auto_212250 ?auto_212257 ) ) ( not ( = ?auto_212251 ?auto_212257 ) ) ( not ( = ?auto_212252 ?auto_212257 ) ) ( ON ?auto_212249 ?auto_212255 ) ( not ( = ?auto_212249 ?auto_212255 ) ) ( not ( = ?auto_212250 ?auto_212255 ) ) ( not ( = ?auto_212251 ?auto_212255 ) ) ( not ( = ?auto_212252 ?auto_212255 ) ) ( not ( = ?auto_212253 ?auto_212255 ) ) ( not ( = ?auto_212254 ?auto_212255 ) ) ( not ( = ?auto_212256 ?auto_212255 ) ) ( not ( = ?auto_212257 ?auto_212255 ) ) ( ON ?auto_212250 ?auto_212249 ) ( ON-TABLE ?auto_212255 ) ( ON ?auto_212251 ?auto_212250 ) ( ON ?auto_212252 ?auto_212251 ) ( CLEAR ?auto_212252 ) ( HOLDING ?auto_212253 ) ( CLEAR ?auto_212254 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212257 ?auto_212256 ?auto_212254 ?auto_212253 )
      ( MAKE-6PILE ?auto_212249 ?auto_212250 ?auto_212251 ?auto_212252 ?auto_212253 ?auto_212254 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212258 - BLOCK
      ?auto_212259 - BLOCK
      ?auto_212260 - BLOCK
      ?auto_212261 - BLOCK
      ?auto_212262 - BLOCK
      ?auto_212263 - BLOCK
    )
    :vars
    (
      ?auto_212266 - BLOCK
      ?auto_212264 - BLOCK
      ?auto_212265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212258 ?auto_212259 ) ) ( not ( = ?auto_212258 ?auto_212260 ) ) ( not ( = ?auto_212258 ?auto_212261 ) ) ( not ( = ?auto_212258 ?auto_212262 ) ) ( not ( = ?auto_212258 ?auto_212263 ) ) ( not ( = ?auto_212259 ?auto_212260 ) ) ( not ( = ?auto_212259 ?auto_212261 ) ) ( not ( = ?auto_212259 ?auto_212262 ) ) ( not ( = ?auto_212259 ?auto_212263 ) ) ( not ( = ?auto_212260 ?auto_212261 ) ) ( not ( = ?auto_212260 ?auto_212262 ) ) ( not ( = ?auto_212260 ?auto_212263 ) ) ( not ( = ?auto_212261 ?auto_212262 ) ) ( not ( = ?auto_212261 ?auto_212263 ) ) ( not ( = ?auto_212262 ?auto_212263 ) ) ( ON ?auto_212263 ?auto_212266 ) ( not ( = ?auto_212258 ?auto_212266 ) ) ( not ( = ?auto_212259 ?auto_212266 ) ) ( not ( = ?auto_212260 ?auto_212266 ) ) ( not ( = ?auto_212261 ?auto_212266 ) ) ( not ( = ?auto_212262 ?auto_212266 ) ) ( not ( = ?auto_212263 ?auto_212266 ) ) ( ON-TABLE ?auto_212264 ) ( ON ?auto_212266 ?auto_212264 ) ( not ( = ?auto_212264 ?auto_212266 ) ) ( not ( = ?auto_212264 ?auto_212263 ) ) ( not ( = ?auto_212264 ?auto_212262 ) ) ( not ( = ?auto_212258 ?auto_212264 ) ) ( not ( = ?auto_212259 ?auto_212264 ) ) ( not ( = ?auto_212260 ?auto_212264 ) ) ( not ( = ?auto_212261 ?auto_212264 ) ) ( ON ?auto_212258 ?auto_212265 ) ( not ( = ?auto_212258 ?auto_212265 ) ) ( not ( = ?auto_212259 ?auto_212265 ) ) ( not ( = ?auto_212260 ?auto_212265 ) ) ( not ( = ?auto_212261 ?auto_212265 ) ) ( not ( = ?auto_212262 ?auto_212265 ) ) ( not ( = ?auto_212263 ?auto_212265 ) ) ( not ( = ?auto_212266 ?auto_212265 ) ) ( not ( = ?auto_212264 ?auto_212265 ) ) ( ON ?auto_212259 ?auto_212258 ) ( ON-TABLE ?auto_212265 ) ( ON ?auto_212260 ?auto_212259 ) ( ON ?auto_212261 ?auto_212260 ) ( CLEAR ?auto_212263 ) ( ON ?auto_212262 ?auto_212261 ) ( CLEAR ?auto_212262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212265 ?auto_212258 ?auto_212259 ?auto_212260 ?auto_212261 )
      ( MAKE-6PILE ?auto_212258 ?auto_212259 ?auto_212260 ?auto_212261 ?auto_212262 ?auto_212263 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212267 - BLOCK
      ?auto_212268 - BLOCK
      ?auto_212269 - BLOCK
      ?auto_212270 - BLOCK
      ?auto_212271 - BLOCK
      ?auto_212272 - BLOCK
    )
    :vars
    (
      ?auto_212275 - BLOCK
      ?auto_212273 - BLOCK
      ?auto_212274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212267 ?auto_212268 ) ) ( not ( = ?auto_212267 ?auto_212269 ) ) ( not ( = ?auto_212267 ?auto_212270 ) ) ( not ( = ?auto_212267 ?auto_212271 ) ) ( not ( = ?auto_212267 ?auto_212272 ) ) ( not ( = ?auto_212268 ?auto_212269 ) ) ( not ( = ?auto_212268 ?auto_212270 ) ) ( not ( = ?auto_212268 ?auto_212271 ) ) ( not ( = ?auto_212268 ?auto_212272 ) ) ( not ( = ?auto_212269 ?auto_212270 ) ) ( not ( = ?auto_212269 ?auto_212271 ) ) ( not ( = ?auto_212269 ?auto_212272 ) ) ( not ( = ?auto_212270 ?auto_212271 ) ) ( not ( = ?auto_212270 ?auto_212272 ) ) ( not ( = ?auto_212271 ?auto_212272 ) ) ( not ( = ?auto_212267 ?auto_212275 ) ) ( not ( = ?auto_212268 ?auto_212275 ) ) ( not ( = ?auto_212269 ?auto_212275 ) ) ( not ( = ?auto_212270 ?auto_212275 ) ) ( not ( = ?auto_212271 ?auto_212275 ) ) ( not ( = ?auto_212272 ?auto_212275 ) ) ( ON-TABLE ?auto_212273 ) ( ON ?auto_212275 ?auto_212273 ) ( not ( = ?auto_212273 ?auto_212275 ) ) ( not ( = ?auto_212273 ?auto_212272 ) ) ( not ( = ?auto_212273 ?auto_212271 ) ) ( not ( = ?auto_212267 ?auto_212273 ) ) ( not ( = ?auto_212268 ?auto_212273 ) ) ( not ( = ?auto_212269 ?auto_212273 ) ) ( not ( = ?auto_212270 ?auto_212273 ) ) ( ON ?auto_212267 ?auto_212274 ) ( not ( = ?auto_212267 ?auto_212274 ) ) ( not ( = ?auto_212268 ?auto_212274 ) ) ( not ( = ?auto_212269 ?auto_212274 ) ) ( not ( = ?auto_212270 ?auto_212274 ) ) ( not ( = ?auto_212271 ?auto_212274 ) ) ( not ( = ?auto_212272 ?auto_212274 ) ) ( not ( = ?auto_212275 ?auto_212274 ) ) ( not ( = ?auto_212273 ?auto_212274 ) ) ( ON ?auto_212268 ?auto_212267 ) ( ON-TABLE ?auto_212274 ) ( ON ?auto_212269 ?auto_212268 ) ( ON ?auto_212270 ?auto_212269 ) ( ON ?auto_212271 ?auto_212270 ) ( CLEAR ?auto_212271 ) ( HOLDING ?auto_212272 ) ( CLEAR ?auto_212275 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212273 ?auto_212275 ?auto_212272 )
      ( MAKE-6PILE ?auto_212267 ?auto_212268 ?auto_212269 ?auto_212270 ?auto_212271 ?auto_212272 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212276 - BLOCK
      ?auto_212277 - BLOCK
      ?auto_212278 - BLOCK
      ?auto_212279 - BLOCK
      ?auto_212280 - BLOCK
      ?auto_212281 - BLOCK
    )
    :vars
    (
      ?auto_212282 - BLOCK
      ?auto_212284 - BLOCK
      ?auto_212283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212276 ?auto_212277 ) ) ( not ( = ?auto_212276 ?auto_212278 ) ) ( not ( = ?auto_212276 ?auto_212279 ) ) ( not ( = ?auto_212276 ?auto_212280 ) ) ( not ( = ?auto_212276 ?auto_212281 ) ) ( not ( = ?auto_212277 ?auto_212278 ) ) ( not ( = ?auto_212277 ?auto_212279 ) ) ( not ( = ?auto_212277 ?auto_212280 ) ) ( not ( = ?auto_212277 ?auto_212281 ) ) ( not ( = ?auto_212278 ?auto_212279 ) ) ( not ( = ?auto_212278 ?auto_212280 ) ) ( not ( = ?auto_212278 ?auto_212281 ) ) ( not ( = ?auto_212279 ?auto_212280 ) ) ( not ( = ?auto_212279 ?auto_212281 ) ) ( not ( = ?auto_212280 ?auto_212281 ) ) ( not ( = ?auto_212276 ?auto_212282 ) ) ( not ( = ?auto_212277 ?auto_212282 ) ) ( not ( = ?auto_212278 ?auto_212282 ) ) ( not ( = ?auto_212279 ?auto_212282 ) ) ( not ( = ?auto_212280 ?auto_212282 ) ) ( not ( = ?auto_212281 ?auto_212282 ) ) ( ON-TABLE ?auto_212284 ) ( ON ?auto_212282 ?auto_212284 ) ( not ( = ?auto_212284 ?auto_212282 ) ) ( not ( = ?auto_212284 ?auto_212281 ) ) ( not ( = ?auto_212284 ?auto_212280 ) ) ( not ( = ?auto_212276 ?auto_212284 ) ) ( not ( = ?auto_212277 ?auto_212284 ) ) ( not ( = ?auto_212278 ?auto_212284 ) ) ( not ( = ?auto_212279 ?auto_212284 ) ) ( ON ?auto_212276 ?auto_212283 ) ( not ( = ?auto_212276 ?auto_212283 ) ) ( not ( = ?auto_212277 ?auto_212283 ) ) ( not ( = ?auto_212278 ?auto_212283 ) ) ( not ( = ?auto_212279 ?auto_212283 ) ) ( not ( = ?auto_212280 ?auto_212283 ) ) ( not ( = ?auto_212281 ?auto_212283 ) ) ( not ( = ?auto_212282 ?auto_212283 ) ) ( not ( = ?auto_212284 ?auto_212283 ) ) ( ON ?auto_212277 ?auto_212276 ) ( ON-TABLE ?auto_212283 ) ( ON ?auto_212278 ?auto_212277 ) ( ON ?auto_212279 ?auto_212278 ) ( ON ?auto_212280 ?auto_212279 ) ( CLEAR ?auto_212282 ) ( ON ?auto_212281 ?auto_212280 ) ( CLEAR ?auto_212281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212283 ?auto_212276 ?auto_212277 ?auto_212278 ?auto_212279 ?auto_212280 )
      ( MAKE-6PILE ?auto_212276 ?auto_212277 ?auto_212278 ?auto_212279 ?auto_212280 ?auto_212281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212285 - BLOCK
      ?auto_212286 - BLOCK
      ?auto_212287 - BLOCK
      ?auto_212288 - BLOCK
      ?auto_212289 - BLOCK
      ?auto_212290 - BLOCK
    )
    :vars
    (
      ?auto_212292 - BLOCK
      ?auto_212291 - BLOCK
      ?auto_212293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212285 ?auto_212286 ) ) ( not ( = ?auto_212285 ?auto_212287 ) ) ( not ( = ?auto_212285 ?auto_212288 ) ) ( not ( = ?auto_212285 ?auto_212289 ) ) ( not ( = ?auto_212285 ?auto_212290 ) ) ( not ( = ?auto_212286 ?auto_212287 ) ) ( not ( = ?auto_212286 ?auto_212288 ) ) ( not ( = ?auto_212286 ?auto_212289 ) ) ( not ( = ?auto_212286 ?auto_212290 ) ) ( not ( = ?auto_212287 ?auto_212288 ) ) ( not ( = ?auto_212287 ?auto_212289 ) ) ( not ( = ?auto_212287 ?auto_212290 ) ) ( not ( = ?auto_212288 ?auto_212289 ) ) ( not ( = ?auto_212288 ?auto_212290 ) ) ( not ( = ?auto_212289 ?auto_212290 ) ) ( not ( = ?auto_212285 ?auto_212292 ) ) ( not ( = ?auto_212286 ?auto_212292 ) ) ( not ( = ?auto_212287 ?auto_212292 ) ) ( not ( = ?auto_212288 ?auto_212292 ) ) ( not ( = ?auto_212289 ?auto_212292 ) ) ( not ( = ?auto_212290 ?auto_212292 ) ) ( ON-TABLE ?auto_212291 ) ( not ( = ?auto_212291 ?auto_212292 ) ) ( not ( = ?auto_212291 ?auto_212290 ) ) ( not ( = ?auto_212291 ?auto_212289 ) ) ( not ( = ?auto_212285 ?auto_212291 ) ) ( not ( = ?auto_212286 ?auto_212291 ) ) ( not ( = ?auto_212287 ?auto_212291 ) ) ( not ( = ?auto_212288 ?auto_212291 ) ) ( ON ?auto_212285 ?auto_212293 ) ( not ( = ?auto_212285 ?auto_212293 ) ) ( not ( = ?auto_212286 ?auto_212293 ) ) ( not ( = ?auto_212287 ?auto_212293 ) ) ( not ( = ?auto_212288 ?auto_212293 ) ) ( not ( = ?auto_212289 ?auto_212293 ) ) ( not ( = ?auto_212290 ?auto_212293 ) ) ( not ( = ?auto_212292 ?auto_212293 ) ) ( not ( = ?auto_212291 ?auto_212293 ) ) ( ON ?auto_212286 ?auto_212285 ) ( ON-TABLE ?auto_212293 ) ( ON ?auto_212287 ?auto_212286 ) ( ON ?auto_212288 ?auto_212287 ) ( ON ?auto_212289 ?auto_212288 ) ( ON ?auto_212290 ?auto_212289 ) ( CLEAR ?auto_212290 ) ( HOLDING ?auto_212292 ) ( CLEAR ?auto_212291 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212291 ?auto_212292 )
      ( MAKE-6PILE ?auto_212285 ?auto_212286 ?auto_212287 ?auto_212288 ?auto_212289 ?auto_212290 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212294 - BLOCK
      ?auto_212295 - BLOCK
      ?auto_212296 - BLOCK
      ?auto_212297 - BLOCK
      ?auto_212298 - BLOCK
      ?auto_212299 - BLOCK
    )
    :vars
    (
      ?auto_212302 - BLOCK
      ?auto_212300 - BLOCK
      ?auto_212301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212294 ?auto_212295 ) ) ( not ( = ?auto_212294 ?auto_212296 ) ) ( not ( = ?auto_212294 ?auto_212297 ) ) ( not ( = ?auto_212294 ?auto_212298 ) ) ( not ( = ?auto_212294 ?auto_212299 ) ) ( not ( = ?auto_212295 ?auto_212296 ) ) ( not ( = ?auto_212295 ?auto_212297 ) ) ( not ( = ?auto_212295 ?auto_212298 ) ) ( not ( = ?auto_212295 ?auto_212299 ) ) ( not ( = ?auto_212296 ?auto_212297 ) ) ( not ( = ?auto_212296 ?auto_212298 ) ) ( not ( = ?auto_212296 ?auto_212299 ) ) ( not ( = ?auto_212297 ?auto_212298 ) ) ( not ( = ?auto_212297 ?auto_212299 ) ) ( not ( = ?auto_212298 ?auto_212299 ) ) ( not ( = ?auto_212294 ?auto_212302 ) ) ( not ( = ?auto_212295 ?auto_212302 ) ) ( not ( = ?auto_212296 ?auto_212302 ) ) ( not ( = ?auto_212297 ?auto_212302 ) ) ( not ( = ?auto_212298 ?auto_212302 ) ) ( not ( = ?auto_212299 ?auto_212302 ) ) ( ON-TABLE ?auto_212300 ) ( not ( = ?auto_212300 ?auto_212302 ) ) ( not ( = ?auto_212300 ?auto_212299 ) ) ( not ( = ?auto_212300 ?auto_212298 ) ) ( not ( = ?auto_212294 ?auto_212300 ) ) ( not ( = ?auto_212295 ?auto_212300 ) ) ( not ( = ?auto_212296 ?auto_212300 ) ) ( not ( = ?auto_212297 ?auto_212300 ) ) ( ON ?auto_212294 ?auto_212301 ) ( not ( = ?auto_212294 ?auto_212301 ) ) ( not ( = ?auto_212295 ?auto_212301 ) ) ( not ( = ?auto_212296 ?auto_212301 ) ) ( not ( = ?auto_212297 ?auto_212301 ) ) ( not ( = ?auto_212298 ?auto_212301 ) ) ( not ( = ?auto_212299 ?auto_212301 ) ) ( not ( = ?auto_212302 ?auto_212301 ) ) ( not ( = ?auto_212300 ?auto_212301 ) ) ( ON ?auto_212295 ?auto_212294 ) ( ON-TABLE ?auto_212301 ) ( ON ?auto_212296 ?auto_212295 ) ( ON ?auto_212297 ?auto_212296 ) ( ON ?auto_212298 ?auto_212297 ) ( ON ?auto_212299 ?auto_212298 ) ( CLEAR ?auto_212300 ) ( ON ?auto_212302 ?auto_212299 ) ( CLEAR ?auto_212302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212301 ?auto_212294 ?auto_212295 ?auto_212296 ?auto_212297 ?auto_212298 ?auto_212299 )
      ( MAKE-6PILE ?auto_212294 ?auto_212295 ?auto_212296 ?auto_212297 ?auto_212298 ?auto_212299 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212303 - BLOCK
      ?auto_212304 - BLOCK
      ?auto_212305 - BLOCK
      ?auto_212306 - BLOCK
      ?auto_212307 - BLOCK
      ?auto_212308 - BLOCK
    )
    :vars
    (
      ?auto_212310 - BLOCK
      ?auto_212311 - BLOCK
      ?auto_212309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212303 ?auto_212304 ) ) ( not ( = ?auto_212303 ?auto_212305 ) ) ( not ( = ?auto_212303 ?auto_212306 ) ) ( not ( = ?auto_212303 ?auto_212307 ) ) ( not ( = ?auto_212303 ?auto_212308 ) ) ( not ( = ?auto_212304 ?auto_212305 ) ) ( not ( = ?auto_212304 ?auto_212306 ) ) ( not ( = ?auto_212304 ?auto_212307 ) ) ( not ( = ?auto_212304 ?auto_212308 ) ) ( not ( = ?auto_212305 ?auto_212306 ) ) ( not ( = ?auto_212305 ?auto_212307 ) ) ( not ( = ?auto_212305 ?auto_212308 ) ) ( not ( = ?auto_212306 ?auto_212307 ) ) ( not ( = ?auto_212306 ?auto_212308 ) ) ( not ( = ?auto_212307 ?auto_212308 ) ) ( not ( = ?auto_212303 ?auto_212310 ) ) ( not ( = ?auto_212304 ?auto_212310 ) ) ( not ( = ?auto_212305 ?auto_212310 ) ) ( not ( = ?auto_212306 ?auto_212310 ) ) ( not ( = ?auto_212307 ?auto_212310 ) ) ( not ( = ?auto_212308 ?auto_212310 ) ) ( not ( = ?auto_212311 ?auto_212310 ) ) ( not ( = ?auto_212311 ?auto_212308 ) ) ( not ( = ?auto_212311 ?auto_212307 ) ) ( not ( = ?auto_212303 ?auto_212311 ) ) ( not ( = ?auto_212304 ?auto_212311 ) ) ( not ( = ?auto_212305 ?auto_212311 ) ) ( not ( = ?auto_212306 ?auto_212311 ) ) ( ON ?auto_212303 ?auto_212309 ) ( not ( = ?auto_212303 ?auto_212309 ) ) ( not ( = ?auto_212304 ?auto_212309 ) ) ( not ( = ?auto_212305 ?auto_212309 ) ) ( not ( = ?auto_212306 ?auto_212309 ) ) ( not ( = ?auto_212307 ?auto_212309 ) ) ( not ( = ?auto_212308 ?auto_212309 ) ) ( not ( = ?auto_212310 ?auto_212309 ) ) ( not ( = ?auto_212311 ?auto_212309 ) ) ( ON ?auto_212304 ?auto_212303 ) ( ON-TABLE ?auto_212309 ) ( ON ?auto_212305 ?auto_212304 ) ( ON ?auto_212306 ?auto_212305 ) ( ON ?auto_212307 ?auto_212306 ) ( ON ?auto_212308 ?auto_212307 ) ( ON ?auto_212310 ?auto_212308 ) ( CLEAR ?auto_212310 ) ( HOLDING ?auto_212311 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212311 )
      ( MAKE-6PILE ?auto_212303 ?auto_212304 ?auto_212305 ?auto_212306 ?auto_212307 ?auto_212308 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212312 - BLOCK
      ?auto_212313 - BLOCK
      ?auto_212314 - BLOCK
      ?auto_212315 - BLOCK
      ?auto_212316 - BLOCK
      ?auto_212317 - BLOCK
    )
    :vars
    (
      ?auto_212319 - BLOCK
      ?auto_212318 - BLOCK
      ?auto_212320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212312 ?auto_212313 ) ) ( not ( = ?auto_212312 ?auto_212314 ) ) ( not ( = ?auto_212312 ?auto_212315 ) ) ( not ( = ?auto_212312 ?auto_212316 ) ) ( not ( = ?auto_212312 ?auto_212317 ) ) ( not ( = ?auto_212313 ?auto_212314 ) ) ( not ( = ?auto_212313 ?auto_212315 ) ) ( not ( = ?auto_212313 ?auto_212316 ) ) ( not ( = ?auto_212313 ?auto_212317 ) ) ( not ( = ?auto_212314 ?auto_212315 ) ) ( not ( = ?auto_212314 ?auto_212316 ) ) ( not ( = ?auto_212314 ?auto_212317 ) ) ( not ( = ?auto_212315 ?auto_212316 ) ) ( not ( = ?auto_212315 ?auto_212317 ) ) ( not ( = ?auto_212316 ?auto_212317 ) ) ( not ( = ?auto_212312 ?auto_212319 ) ) ( not ( = ?auto_212313 ?auto_212319 ) ) ( not ( = ?auto_212314 ?auto_212319 ) ) ( not ( = ?auto_212315 ?auto_212319 ) ) ( not ( = ?auto_212316 ?auto_212319 ) ) ( not ( = ?auto_212317 ?auto_212319 ) ) ( not ( = ?auto_212318 ?auto_212319 ) ) ( not ( = ?auto_212318 ?auto_212317 ) ) ( not ( = ?auto_212318 ?auto_212316 ) ) ( not ( = ?auto_212312 ?auto_212318 ) ) ( not ( = ?auto_212313 ?auto_212318 ) ) ( not ( = ?auto_212314 ?auto_212318 ) ) ( not ( = ?auto_212315 ?auto_212318 ) ) ( ON ?auto_212312 ?auto_212320 ) ( not ( = ?auto_212312 ?auto_212320 ) ) ( not ( = ?auto_212313 ?auto_212320 ) ) ( not ( = ?auto_212314 ?auto_212320 ) ) ( not ( = ?auto_212315 ?auto_212320 ) ) ( not ( = ?auto_212316 ?auto_212320 ) ) ( not ( = ?auto_212317 ?auto_212320 ) ) ( not ( = ?auto_212319 ?auto_212320 ) ) ( not ( = ?auto_212318 ?auto_212320 ) ) ( ON ?auto_212313 ?auto_212312 ) ( ON-TABLE ?auto_212320 ) ( ON ?auto_212314 ?auto_212313 ) ( ON ?auto_212315 ?auto_212314 ) ( ON ?auto_212316 ?auto_212315 ) ( ON ?auto_212317 ?auto_212316 ) ( ON ?auto_212319 ?auto_212317 ) ( ON ?auto_212318 ?auto_212319 ) ( CLEAR ?auto_212318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_212320 ?auto_212312 ?auto_212313 ?auto_212314 ?auto_212315 ?auto_212316 ?auto_212317 ?auto_212319 )
      ( MAKE-6PILE ?auto_212312 ?auto_212313 ?auto_212314 ?auto_212315 ?auto_212316 ?auto_212317 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212322 - BLOCK
    )
    :vars
    (
      ?auto_212323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212323 ?auto_212322 ) ( CLEAR ?auto_212323 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212322 ) ( not ( = ?auto_212322 ?auto_212323 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212323 ?auto_212322 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212324 - BLOCK
    )
    :vars
    (
      ?auto_212325 - BLOCK
      ?auto_212326 - BLOCK
      ?auto_212327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212325 ?auto_212324 ) ( CLEAR ?auto_212325 ) ( ON-TABLE ?auto_212324 ) ( not ( = ?auto_212324 ?auto_212325 ) ) ( HOLDING ?auto_212326 ) ( CLEAR ?auto_212327 ) ( not ( = ?auto_212324 ?auto_212326 ) ) ( not ( = ?auto_212324 ?auto_212327 ) ) ( not ( = ?auto_212325 ?auto_212326 ) ) ( not ( = ?auto_212325 ?auto_212327 ) ) ( not ( = ?auto_212326 ?auto_212327 ) ) )
    :subtasks
    ( ( !STACK ?auto_212326 ?auto_212327 )
      ( MAKE-1PILE ?auto_212324 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212328 - BLOCK
    )
    :vars
    (
      ?auto_212330 - BLOCK
      ?auto_212331 - BLOCK
      ?auto_212329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212330 ?auto_212328 ) ( ON-TABLE ?auto_212328 ) ( not ( = ?auto_212328 ?auto_212330 ) ) ( CLEAR ?auto_212331 ) ( not ( = ?auto_212328 ?auto_212329 ) ) ( not ( = ?auto_212328 ?auto_212331 ) ) ( not ( = ?auto_212330 ?auto_212329 ) ) ( not ( = ?auto_212330 ?auto_212331 ) ) ( not ( = ?auto_212329 ?auto_212331 ) ) ( ON ?auto_212329 ?auto_212330 ) ( CLEAR ?auto_212329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212328 ?auto_212330 )
      ( MAKE-1PILE ?auto_212328 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212332 - BLOCK
    )
    :vars
    (
      ?auto_212334 - BLOCK
      ?auto_212335 - BLOCK
      ?auto_212333 - BLOCK
      ?auto_212337 - BLOCK
      ?auto_212339 - BLOCK
      ?auto_212338 - BLOCK
      ?auto_212336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212334 ?auto_212332 ) ( ON-TABLE ?auto_212332 ) ( not ( = ?auto_212332 ?auto_212334 ) ) ( not ( = ?auto_212332 ?auto_212335 ) ) ( not ( = ?auto_212332 ?auto_212333 ) ) ( not ( = ?auto_212334 ?auto_212335 ) ) ( not ( = ?auto_212334 ?auto_212333 ) ) ( not ( = ?auto_212335 ?auto_212333 ) ) ( ON ?auto_212335 ?auto_212334 ) ( CLEAR ?auto_212335 ) ( HOLDING ?auto_212333 ) ( CLEAR ?auto_212337 ) ( ON-TABLE ?auto_212339 ) ( ON ?auto_212338 ?auto_212339 ) ( ON ?auto_212336 ?auto_212338 ) ( ON ?auto_212337 ?auto_212336 ) ( not ( = ?auto_212339 ?auto_212338 ) ) ( not ( = ?auto_212339 ?auto_212336 ) ) ( not ( = ?auto_212339 ?auto_212337 ) ) ( not ( = ?auto_212339 ?auto_212333 ) ) ( not ( = ?auto_212338 ?auto_212336 ) ) ( not ( = ?auto_212338 ?auto_212337 ) ) ( not ( = ?auto_212338 ?auto_212333 ) ) ( not ( = ?auto_212336 ?auto_212337 ) ) ( not ( = ?auto_212336 ?auto_212333 ) ) ( not ( = ?auto_212337 ?auto_212333 ) ) ( not ( = ?auto_212332 ?auto_212337 ) ) ( not ( = ?auto_212332 ?auto_212339 ) ) ( not ( = ?auto_212332 ?auto_212338 ) ) ( not ( = ?auto_212332 ?auto_212336 ) ) ( not ( = ?auto_212334 ?auto_212337 ) ) ( not ( = ?auto_212334 ?auto_212339 ) ) ( not ( = ?auto_212334 ?auto_212338 ) ) ( not ( = ?auto_212334 ?auto_212336 ) ) ( not ( = ?auto_212335 ?auto_212337 ) ) ( not ( = ?auto_212335 ?auto_212339 ) ) ( not ( = ?auto_212335 ?auto_212338 ) ) ( not ( = ?auto_212335 ?auto_212336 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212339 ?auto_212338 ?auto_212336 ?auto_212337 ?auto_212333 )
      ( MAKE-1PILE ?auto_212332 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212340 - BLOCK
    )
    :vars
    (
      ?auto_212347 - BLOCK
      ?auto_212346 - BLOCK
      ?auto_212345 - BLOCK
      ?auto_212342 - BLOCK
      ?auto_212341 - BLOCK
      ?auto_212344 - BLOCK
      ?auto_212343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212347 ?auto_212340 ) ( ON-TABLE ?auto_212340 ) ( not ( = ?auto_212340 ?auto_212347 ) ) ( not ( = ?auto_212340 ?auto_212346 ) ) ( not ( = ?auto_212340 ?auto_212345 ) ) ( not ( = ?auto_212347 ?auto_212346 ) ) ( not ( = ?auto_212347 ?auto_212345 ) ) ( not ( = ?auto_212346 ?auto_212345 ) ) ( ON ?auto_212346 ?auto_212347 ) ( CLEAR ?auto_212342 ) ( ON-TABLE ?auto_212341 ) ( ON ?auto_212344 ?auto_212341 ) ( ON ?auto_212343 ?auto_212344 ) ( ON ?auto_212342 ?auto_212343 ) ( not ( = ?auto_212341 ?auto_212344 ) ) ( not ( = ?auto_212341 ?auto_212343 ) ) ( not ( = ?auto_212341 ?auto_212342 ) ) ( not ( = ?auto_212341 ?auto_212345 ) ) ( not ( = ?auto_212344 ?auto_212343 ) ) ( not ( = ?auto_212344 ?auto_212342 ) ) ( not ( = ?auto_212344 ?auto_212345 ) ) ( not ( = ?auto_212343 ?auto_212342 ) ) ( not ( = ?auto_212343 ?auto_212345 ) ) ( not ( = ?auto_212342 ?auto_212345 ) ) ( not ( = ?auto_212340 ?auto_212342 ) ) ( not ( = ?auto_212340 ?auto_212341 ) ) ( not ( = ?auto_212340 ?auto_212344 ) ) ( not ( = ?auto_212340 ?auto_212343 ) ) ( not ( = ?auto_212347 ?auto_212342 ) ) ( not ( = ?auto_212347 ?auto_212341 ) ) ( not ( = ?auto_212347 ?auto_212344 ) ) ( not ( = ?auto_212347 ?auto_212343 ) ) ( not ( = ?auto_212346 ?auto_212342 ) ) ( not ( = ?auto_212346 ?auto_212341 ) ) ( not ( = ?auto_212346 ?auto_212344 ) ) ( not ( = ?auto_212346 ?auto_212343 ) ) ( ON ?auto_212345 ?auto_212346 ) ( CLEAR ?auto_212345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212340 ?auto_212347 ?auto_212346 )
      ( MAKE-1PILE ?auto_212340 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212348 - BLOCK
    )
    :vars
    (
      ?auto_212351 - BLOCK
      ?auto_212350 - BLOCK
      ?auto_212354 - BLOCK
      ?auto_212352 - BLOCK
      ?auto_212353 - BLOCK
      ?auto_212355 - BLOCK
      ?auto_212349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212351 ?auto_212348 ) ( ON-TABLE ?auto_212348 ) ( not ( = ?auto_212348 ?auto_212351 ) ) ( not ( = ?auto_212348 ?auto_212350 ) ) ( not ( = ?auto_212348 ?auto_212354 ) ) ( not ( = ?auto_212351 ?auto_212350 ) ) ( not ( = ?auto_212351 ?auto_212354 ) ) ( not ( = ?auto_212350 ?auto_212354 ) ) ( ON ?auto_212350 ?auto_212351 ) ( ON-TABLE ?auto_212352 ) ( ON ?auto_212353 ?auto_212352 ) ( ON ?auto_212355 ?auto_212353 ) ( not ( = ?auto_212352 ?auto_212353 ) ) ( not ( = ?auto_212352 ?auto_212355 ) ) ( not ( = ?auto_212352 ?auto_212349 ) ) ( not ( = ?auto_212352 ?auto_212354 ) ) ( not ( = ?auto_212353 ?auto_212355 ) ) ( not ( = ?auto_212353 ?auto_212349 ) ) ( not ( = ?auto_212353 ?auto_212354 ) ) ( not ( = ?auto_212355 ?auto_212349 ) ) ( not ( = ?auto_212355 ?auto_212354 ) ) ( not ( = ?auto_212349 ?auto_212354 ) ) ( not ( = ?auto_212348 ?auto_212349 ) ) ( not ( = ?auto_212348 ?auto_212352 ) ) ( not ( = ?auto_212348 ?auto_212353 ) ) ( not ( = ?auto_212348 ?auto_212355 ) ) ( not ( = ?auto_212351 ?auto_212349 ) ) ( not ( = ?auto_212351 ?auto_212352 ) ) ( not ( = ?auto_212351 ?auto_212353 ) ) ( not ( = ?auto_212351 ?auto_212355 ) ) ( not ( = ?auto_212350 ?auto_212349 ) ) ( not ( = ?auto_212350 ?auto_212352 ) ) ( not ( = ?auto_212350 ?auto_212353 ) ) ( not ( = ?auto_212350 ?auto_212355 ) ) ( ON ?auto_212354 ?auto_212350 ) ( CLEAR ?auto_212354 ) ( HOLDING ?auto_212349 ) ( CLEAR ?auto_212355 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212352 ?auto_212353 ?auto_212355 ?auto_212349 )
      ( MAKE-1PILE ?auto_212348 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212356 - BLOCK
    )
    :vars
    (
      ?auto_212363 - BLOCK
      ?auto_212362 - BLOCK
      ?auto_212359 - BLOCK
      ?auto_212360 - BLOCK
      ?auto_212357 - BLOCK
      ?auto_212358 - BLOCK
      ?auto_212361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212363 ?auto_212356 ) ( ON-TABLE ?auto_212356 ) ( not ( = ?auto_212356 ?auto_212363 ) ) ( not ( = ?auto_212356 ?auto_212362 ) ) ( not ( = ?auto_212356 ?auto_212359 ) ) ( not ( = ?auto_212363 ?auto_212362 ) ) ( not ( = ?auto_212363 ?auto_212359 ) ) ( not ( = ?auto_212362 ?auto_212359 ) ) ( ON ?auto_212362 ?auto_212363 ) ( ON-TABLE ?auto_212360 ) ( ON ?auto_212357 ?auto_212360 ) ( ON ?auto_212358 ?auto_212357 ) ( not ( = ?auto_212360 ?auto_212357 ) ) ( not ( = ?auto_212360 ?auto_212358 ) ) ( not ( = ?auto_212360 ?auto_212361 ) ) ( not ( = ?auto_212360 ?auto_212359 ) ) ( not ( = ?auto_212357 ?auto_212358 ) ) ( not ( = ?auto_212357 ?auto_212361 ) ) ( not ( = ?auto_212357 ?auto_212359 ) ) ( not ( = ?auto_212358 ?auto_212361 ) ) ( not ( = ?auto_212358 ?auto_212359 ) ) ( not ( = ?auto_212361 ?auto_212359 ) ) ( not ( = ?auto_212356 ?auto_212361 ) ) ( not ( = ?auto_212356 ?auto_212360 ) ) ( not ( = ?auto_212356 ?auto_212357 ) ) ( not ( = ?auto_212356 ?auto_212358 ) ) ( not ( = ?auto_212363 ?auto_212361 ) ) ( not ( = ?auto_212363 ?auto_212360 ) ) ( not ( = ?auto_212363 ?auto_212357 ) ) ( not ( = ?auto_212363 ?auto_212358 ) ) ( not ( = ?auto_212362 ?auto_212361 ) ) ( not ( = ?auto_212362 ?auto_212360 ) ) ( not ( = ?auto_212362 ?auto_212357 ) ) ( not ( = ?auto_212362 ?auto_212358 ) ) ( ON ?auto_212359 ?auto_212362 ) ( CLEAR ?auto_212358 ) ( ON ?auto_212361 ?auto_212359 ) ( CLEAR ?auto_212361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212356 ?auto_212363 ?auto_212362 ?auto_212359 )
      ( MAKE-1PILE ?auto_212356 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212364 - BLOCK
    )
    :vars
    (
      ?auto_212367 - BLOCK
      ?auto_212370 - BLOCK
      ?auto_212368 - BLOCK
      ?auto_212369 - BLOCK
      ?auto_212371 - BLOCK
      ?auto_212365 - BLOCK
      ?auto_212366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212367 ?auto_212364 ) ( ON-TABLE ?auto_212364 ) ( not ( = ?auto_212364 ?auto_212367 ) ) ( not ( = ?auto_212364 ?auto_212370 ) ) ( not ( = ?auto_212364 ?auto_212368 ) ) ( not ( = ?auto_212367 ?auto_212370 ) ) ( not ( = ?auto_212367 ?auto_212368 ) ) ( not ( = ?auto_212370 ?auto_212368 ) ) ( ON ?auto_212370 ?auto_212367 ) ( ON-TABLE ?auto_212369 ) ( ON ?auto_212371 ?auto_212369 ) ( not ( = ?auto_212369 ?auto_212371 ) ) ( not ( = ?auto_212369 ?auto_212365 ) ) ( not ( = ?auto_212369 ?auto_212366 ) ) ( not ( = ?auto_212369 ?auto_212368 ) ) ( not ( = ?auto_212371 ?auto_212365 ) ) ( not ( = ?auto_212371 ?auto_212366 ) ) ( not ( = ?auto_212371 ?auto_212368 ) ) ( not ( = ?auto_212365 ?auto_212366 ) ) ( not ( = ?auto_212365 ?auto_212368 ) ) ( not ( = ?auto_212366 ?auto_212368 ) ) ( not ( = ?auto_212364 ?auto_212366 ) ) ( not ( = ?auto_212364 ?auto_212369 ) ) ( not ( = ?auto_212364 ?auto_212371 ) ) ( not ( = ?auto_212364 ?auto_212365 ) ) ( not ( = ?auto_212367 ?auto_212366 ) ) ( not ( = ?auto_212367 ?auto_212369 ) ) ( not ( = ?auto_212367 ?auto_212371 ) ) ( not ( = ?auto_212367 ?auto_212365 ) ) ( not ( = ?auto_212370 ?auto_212366 ) ) ( not ( = ?auto_212370 ?auto_212369 ) ) ( not ( = ?auto_212370 ?auto_212371 ) ) ( not ( = ?auto_212370 ?auto_212365 ) ) ( ON ?auto_212368 ?auto_212370 ) ( ON ?auto_212366 ?auto_212368 ) ( CLEAR ?auto_212366 ) ( HOLDING ?auto_212365 ) ( CLEAR ?auto_212371 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212369 ?auto_212371 ?auto_212365 )
      ( MAKE-1PILE ?auto_212364 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212372 - BLOCK
    )
    :vars
    (
      ?auto_212374 - BLOCK
      ?auto_212376 - BLOCK
      ?auto_212375 - BLOCK
      ?auto_212379 - BLOCK
      ?auto_212378 - BLOCK
      ?auto_212377 - BLOCK
      ?auto_212373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212374 ?auto_212372 ) ( ON-TABLE ?auto_212372 ) ( not ( = ?auto_212372 ?auto_212374 ) ) ( not ( = ?auto_212372 ?auto_212376 ) ) ( not ( = ?auto_212372 ?auto_212375 ) ) ( not ( = ?auto_212374 ?auto_212376 ) ) ( not ( = ?auto_212374 ?auto_212375 ) ) ( not ( = ?auto_212376 ?auto_212375 ) ) ( ON ?auto_212376 ?auto_212374 ) ( ON-TABLE ?auto_212379 ) ( ON ?auto_212378 ?auto_212379 ) ( not ( = ?auto_212379 ?auto_212378 ) ) ( not ( = ?auto_212379 ?auto_212377 ) ) ( not ( = ?auto_212379 ?auto_212373 ) ) ( not ( = ?auto_212379 ?auto_212375 ) ) ( not ( = ?auto_212378 ?auto_212377 ) ) ( not ( = ?auto_212378 ?auto_212373 ) ) ( not ( = ?auto_212378 ?auto_212375 ) ) ( not ( = ?auto_212377 ?auto_212373 ) ) ( not ( = ?auto_212377 ?auto_212375 ) ) ( not ( = ?auto_212373 ?auto_212375 ) ) ( not ( = ?auto_212372 ?auto_212373 ) ) ( not ( = ?auto_212372 ?auto_212379 ) ) ( not ( = ?auto_212372 ?auto_212378 ) ) ( not ( = ?auto_212372 ?auto_212377 ) ) ( not ( = ?auto_212374 ?auto_212373 ) ) ( not ( = ?auto_212374 ?auto_212379 ) ) ( not ( = ?auto_212374 ?auto_212378 ) ) ( not ( = ?auto_212374 ?auto_212377 ) ) ( not ( = ?auto_212376 ?auto_212373 ) ) ( not ( = ?auto_212376 ?auto_212379 ) ) ( not ( = ?auto_212376 ?auto_212378 ) ) ( not ( = ?auto_212376 ?auto_212377 ) ) ( ON ?auto_212375 ?auto_212376 ) ( ON ?auto_212373 ?auto_212375 ) ( CLEAR ?auto_212378 ) ( ON ?auto_212377 ?auto_212373 ) ( CLEAR ?auto_212377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212372 ?auto_212374 ?auto_212376 ?auto_212375 ?auto_212373 )
      ( MAKE-1PILE ?auto_212372 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212380 - BLOCK
    )
    :vars
    (
      ?auto_212382 - BLOCK
      ?auto_212385 - BLOCK
      ?auto_212383 - BLOCK
      ?auto_212387 - BLOCK
      ?auto_212381 - BLOCK
      ?auto_212384 - BLOCK
      ?auto_212386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212382 ?auto_212380 ) ( ON-TABLE ?auto_212380 ) ( not ( = ?auto_212380 ?auto_212382 ) ) ( not ( = ?auto_212380 ?auto_212385 ) ) ( not ( = ?auto_212380 ?auto_212383 ) ) ( not ( = ?auto_212382 ?auto_212385 ) ) ( not ( = ?auto_212382 ?auto_212383 ) ) ( not ( = ?auto_212385 ?auto_212383 ) ) ( ON ?auto_212385 ?auto_212382 ) ( ON-TABLE ?auto_212387 ) ( not ( = ?auto_212387 ?auto_212381 ) ) ( not ( = ?auto_212387 ?auto_212384 ) ) ( not ( = ?auto_212387 ?auto_212386 ) ) ( not ( = ?auto_212387 ?auto_212383 ) ) ( not ( = ?auto_212381 ?auto_212384 ) ) ( not ( = ?auto_212381 ?auto_212386 ) ) ( not ( = ?auto_212381 ?auto_212383 ) ) ( not ( = ?auto_212384 ?auto_212386 ) ) ( not ( = ?auto_212384 ?auto_212383 ) ) ( not ( = ?auto_212386 ?auto_212383 ) ) ( not ( = ?auto_212380 ?auto_212386 ) ) ( not ( = ?auto_212380 ?auto_212387 ) ) ( not ( = ?auto_212380 ?auto_212381 ) ) ( not ( = ?auto_212380 ?auto_212384 ) ) ( not ( = ?auto_212382 ?auto_212386 ) ) ( not ( = ?auto_212382 ?auto_212387 ) ) ( not ( = ?auto_212382 ?auto_212381 ) ) ( not ( = ?auto_212382 ?auto_212384 ) ) ( not ( = ?auto_212385 ?auto_212386 ) ) ( not ( = ?auto_212385 ?auto_212387 ) ) ( not ( = ?auto_212385 ?auto_212381 ) ) ( not ( = ?auto_212385 ?auto_212384 ) ) ( ON ?auto_212383 ?auto_212385 ) ( ON ?auto_212386 ?auto_212383 ) ( ON ?auto_212384 ?auto_212386 ) ( CLEAR ?auto_212384 ) ( HOLDING ?auto_212381 ) ( CLEAR ?auto_212387 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212387 ?auto_212381 )
      ( MAKE-1PILE ?auto_212380 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212388 - BLOCK
    )
    :vars
    (
      ?auto_212391 - BLOCK
      ?auto_212395 - BLOCK
      ?auto_212390 - BLOCK
      ?auto_212394 - BLOCK
      ?auto_212392 - BLOCK
      ?auto_212389 - BLOCK
      ?auto_212393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212391 ?auto_212388 ) ( ON-TABLE ?auto_212388 ) ( not ( = ?auto_212388 ?auto_212391 ) ) ( not ( = ?auto_212388 ?auto_212395 ) ) ( not ( = ?auto_212388 ?auto_212390 ) ) ( not ( = ?auto_212391 ?auto_212395 ) ) ( not ( = ?auto_212391 ?auto_212390 ) ) ( not ( = ?auto_212395 ?auto_212390 ) ) ( ON ?auto_212395 ?auto_212391 ) ( ON-TABLE ?auto_212394 ) ( not ( = ?auto_212394 ?auto_212392 ) ) ( not ( = ?auto_212394 ?auto_212389 ) ) ( not ( = ?auto_212394 ?auto_212393 ) ) ( not ( = ?auto_212394 ?auto_212390 ) ) ( not ( = ?auto_212392 ?auto_212389 ) ) ( not ( = ?auto_212392 ?auto_212393 ) ) ( not ( = ?auto_212392 ?auto_212390 ) ) ( not ( = ?auto_212389 ?auto_212393 ) ) ( not ( = ?auto_212389 ?auto_212390 ) ) ( not ( = ?auto_212393 ?auto_212390 ) ) ( not ( = ?auto_212388 ?auto_212393 ) ) ( not ( = ?auto_212388 ?auto_212394 ) ) ( not ( = ?auto_212388 ?auto_212392 ) ) ( not ( = ?auto_212388 ?auto_212389 ) ) ( not ( = ?auto_212391 ?auto_212393 ) ) ( not ( = ?auto_212391 ?auto_212394 ) ) ( not ( = ?auto_212391 ?auto_212392 ) ) ( not ( = ?auto_212391 ?auto_212389 ) ) ( not ( = ?auto_212395 ?auto_212393 ) ) ( not ( = ?auto_212395 ?auto_212394 ) ) ( not ( = ?auto_212395 ?auto_212392 ) ) ( not ( = ?auto_212395 ?auto_212389 ) ) ( ON ?auto_212390 ?auto_212395 ) ( ON ?auto_212393 ?auto_212390 ) ( ON ?auto_212389 ?auto_212393 ) ( CLEAR ?auto_212394 ) ( ON ?auto_212392 ?auto_212389 ) ( CLEAR ?auto_212392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212388 ?auto_212391 ?auto_212395 ?auto_212390 ?auto_212393 ?auto_212389 )
      ( MAKE-1PILE ?auto_212388 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212396 - BLOCK
    )
    :vars
    (
      ?auto_212403 - BLOCK
      ?auto_212402 - BLOCK
      ?auto_212399 - BLOCK
      ?auto_212397 - BLOCK
      ?auto_212398 - BLOCK
      ?auto_212401 - BLOCK
      ?auto_212400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212403 ?auto_212396 ) ( ON-TABLE ?auto_212396 ) ( not ( = ?auto_212396 ?auto_212403 ) ) ( not ( = ?auto_212396 ?auto_212402 ) ) ( not ( = ?auto_212396 ?auto_212399 ) ) ( not ( = ?auto_212403 ?auto_212402 ) ) ( not ( = ?auto_212403 ?auto_212399 ) ) ( not ( = ?auto_212402 ?auto_212399 ) ) ( ON ?auto_212402 ?auto_212403 ) ( not ( = ?auto_212397 ?auto_212398 ) ) ( not ( = ?auto_212397 ?auto_212401 ) ) ( not ( = ?auto_212397 ?auto_212400 ) ) ( not ( = ?auto_212397 ?auto_212399 ) ) ( not ( = ?auto_212398 ?auto_212401 ) ) ( not ( = ?auto_212398 ?auto_212400 ) ) ( not ( = ?auto_212398 ?auto_212399 ) ) ( not ( = ?auto_212401 ?auto_212400 ) ) ( not ( = ?auto_212401 ?auto_212399 ) ) ( not ( = ?auto_212400 ?auto_212399 ) ) ( not ( = ?auto_212396 ?auto_212400 ) ) ( not ( = ?auto_212396 ?auto_212397 ) ) ( not ( = ?auto_212396 ?auto_212398 ) ) ( not ( = ?auto_212396 ?auto_212401 ) ) ( not ( = ?auto_212403 ?auto_212400 ) ) ( not ( = ?auto_212403 ?auto_212397 ) ) ( not ( = ?auto_212403 ?auto_212398 ) ) ( not ( = ?auto_212403 ?auto_212401 ) ) ( not ( = ?auto_212402 ?auto_212400 ) ) ( not ( = ?auto_212402 ?auto_212397 ) ) ( not ( = ?auto_212402 ?auto_212398 ) ) ( not ( = ?auto_212402 ?auto_212401 ) ) ( ON ?auto_212399 ?auto_212402 ) ( ON ?auto_212400 ?auto_212399 ) ( ON ?auto_212401 ?auto_212400 ) ( ON ?auto_212398 ?auto_212401 ) ( CLEAR ?auto_212398 ) ( HOLDING ?auto_212397 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212397 )
      ( MAKE-1PILE ?auto_212396 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212404 - BLOCK
    )
    :vars
    (
      ?auto_212408 - BLOCK
      ?auto_212409 - BLOCK
      ?auto_212406 - BLOCK
      ?auto_212410 - BLOCK
      ?auto_212407 - BLOCK
      ?auto_212411 - BLOCK
      ?auto_212405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212408 ?auto_212404 ) ( ON-TABLE ?auto_212404 ) ( not ( = ?auto_212404 ?auto_212408 ) ) ( not ( = ?auto_212404 ?auto_212409 ) ) ( not ( = ?auto_212404 ?auto_212406 ) ) ( not ( = ?auto_212408 ?auto_212409 ) ) ( not ( = ?auto_212408 ?auto_212406 ) ) ( not ( = ?auto_212409 ?auto_212406 ) ) ( ON ?auto_212409 ?auto_212408 ) ( not ( = ?auto_212410 ?auto_212407 ) ) ( not ( = ?auto_212410 ?auto_212411 ) ) ( not ( = ?auto_212410 ?auto_212405 ) ) ( not ( = ?auto_212410 ?auto_212406 ) ) ( not ( = ?auto_212407 ?auto_212411 ) ) ( not ( = ?auto_212407 ?auto_212405 ) ) ( not ( = ?auto_212407 ?auto_212406 ) ) ( not ( = ?auto_212411 ?auto_212405 ) ) ( not ( = ?auto_212411 ?auto_212406 ) ) ( not ( = ?auto_212405 ?auto_212406 ) ) ( not ( = ?auto_212404 ?auto_212405 ) ) ( not ( = ?auto_212404 ?auto_212410 ) ) ( not ( = ?auto_212404 ?auto_212407 ) ) ( not ( = ?auto_212404 ?auto_212411 ) ) ( not ( = ?auto_212408 ?auto_212405 ) ) ( not ( = ?auto_212408 ?auto_212410 ) ) ( not ( = ?auto_212408 ?auto_212407 ) ) ( not ( = ?auto_212408 ?auto_212411 ) ) ( not ( = ?auto_212409 ?auto_212405 ) ) ( not ( = ?auto_212409 ?auto_212410 ) ) ( not ( = ?auto_212409 ?auto_212407 ) ) ( not ( = ?auto_212409 ?auto_212411 ) ) ( ON ?auto_212406 ?auto_212409 ) ( ON ?auto_212405 ?auto_212406 ) ( ON ?auto_212411 ?auto_212405 ) ( ON ?auto_212407 ?auto_212411 ) ( ON ?auto_212410 ?auto_212407 ) ( CLEAR ?auto_212410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212404 ?auto_212408 ?auto_212409 ?auto_212406 ?auto_212405 ?auto_212411 ?auto_212407 )
      ( MAKE-1PILE ?auto_212404 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212412 - BLOCK
    )
    :vars
    (
      ?auto_212419 - BLOCK
      ?auto_212418 - BLOCK
      ?auto_212413 - BLOCK
      ?auto_212415 - BLOCK
      ?auto_212416 - BLOCK
      ?auto_212417 - BLOCK
      ?auto_212414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212419 ?auto_212412 ) ( ON-TABLE ?auto_212412 ) ( not ( = ?auto_212412 ?auto_212419 ) ) ( not ( = ?auto_212412 ?auto_212418 ) ) ( not ( = ?auto_212412 ?auto_212413 ) ) ( not ( = ?auto_212419 ?auto_212418 ) ) ( not ( = ?auto_212419 ?auto_212413 ) ) ( not ( = ?auto_212418 ?auto_212413 ) ) ( ON ?auto_212418 ?auto_212419 ) ( not ( = ?auto_212415 ?auto_212416 ) ) ( not ( = ?auto_212415 ?auto_212417 ) ) ( not ( = ?auto_212415 ?auto_212414 ) ) ( not ( = ?auto_212415 ?auto_212413 ) ) ( not ( = ?auto_212416 ?auto_212417 ) ) ( not ( = ?auto_212416 ?auto_212414 ) ) ( not ( = ?auto_212416 ?auto_212413 ) ) ( not ( = ?auto_212417 ?auto_212414 ) ) ( not ( = ?auto_212417 ?auto_212413 ) ) ( not ( = ?auto_212414 ?auto_212413 ) ) ( not ( = ?auto_212412 ?auto_212414 ) ) ( not ( = ?auto_212412 ?auto_212415 ) ) ( not ( = ?auto_212412 ?auto_212416 ) ) ( not ( = ?auto_212412 ?auto_212417 ) ) ( not ( = ?auto_212419 ?auto_212414 ) ) ( not ( = ?auto_212419 ?auto_212415 ) ) ( not ( = ?auto_212419 ?auto_212416 ) ) ( not ( = ?auto_212419 ?auto_212417 ) ) ( not ( = ?auto_212418 ?auto_212414 ) ) ( not ( = ?auto_212418 ?auto_212415 ) ) ( not ( = ?auto_212418 ?auto_212416 ) ) ( not ( = ?auto_212418 ?auto_212417 ) ) ( ON ?auto_212413 ?auto_212418 ) ( ON ?auto_212414 ?auto_212413 ) ( ON ?auto_212417 ?auto_212414 ) ( ON ?auto_212416 ?auto_212417 ) ( HOLDING ?auto_212415 ) ( CLEAR ?auto_212416 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_212412 ?auto_212419 ?auto_212418 ?auto_212413 ?auto_212414 ?auto_212417 ?auto_212416 ?auto_212415 )
      ( MAKE-1PILE ?auto_212412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212420 - BLOCK
    )
    :vars
    (
      ?auto_212424 - BLOCK
      ?auto_212427 - BLOCK
      ?auto_212421 - BLOCK
      ?auto_212423 - BLOCK
      ?auto_212422 - BLOCK
      ?auto_212426 - BLOCK
      ?auto_212425 - BLOCK
      ?auto_212428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212424 ?auto_212420 ) ( ON-TABLE ?auto_212420 ) ( not ( = ?auto_212420 ?auto_212424 ) ) ( not ( = ?auto_212420 ?auto_212427 ) ) ( not ( = ?auto_212420 ?auto_212421 ) ) ( not ( = ?auto_212424 ?auto_212427 ) ) ( not ( = ?auto_212424 ?auto_212421 ) ) ( not ( = ?auto_212427 ?auto_212421 ) ) ( ON ?auto_212427 ?auto_212424 ) ( not ( = ?auto_212423 ?auto_212422 ) ) ( not ( = ?auto_212423 ?auto_212426 ) ) ( not ( = ?auto_212423 ?auto_212425 ) ) ( not ( = ?auto_212423 ?auto_212421 ) ) ( not ( = ?auto_212422 ?auto_212426 ) ) ( not ( = ?auto_212422 ?auto_212425 ) ) ( not ( = ?auto_212422 ?auto_212421 ) ) ( not ( = ?auto_212426 ?auto_212425 ) ) ( not ( = ?auto_212426 ?auto_212421 ) ) ( not ( = ?auto_212425 ?auto_212421 ) ) ( not ( = ?auto_212420 ?auto_212425 ) ) ( not ( = ?auto_212420 ?auto_212423 ) ) ( not ( = ?auto_212420 ?auto_212422 ) ) ( not ( = ?auto_212420 ?auto_212426 ) ) ( not ( = ?auto_212424 ?auto_212425 ) ) ( not ( = ?auto_212424 ?auto_212423 ) ) ( not ( = ?auto_212424 ?auto_212422 ) ) ( not ( = ?auto_212424 ?auto_212426 ) ) ( not ( = ?auto_212427 ?auto_212425 ) ) ( not ( = ?auto_212427 ?auto_212423 ) ) ( not ( = ?auto_212427 ?auto_212422 ) ) ( not ( = ?auto_212427 ?auto_212426 ) ) ( ON ?auto_212421 ?auto_212427 ) ( ON ?auto_212425 ?auto_212421 ) ( ON ?auto_212426 ?auto_212425 ) ( ON ?auto_212422 ?auto_212426 ) ( CLEAR ?auto_212422 ) ( ON ?auto_212423 ?auto_212428 ) ( CLEAR ?auto_212423 ) ( HAND-EMPTY ) ( not ( = ?auto_212420 ?auto_212428 ) ) ( not ( = ?auto_212424 ?auto_212428 ) ) ( not ( = ?auto_212427 ?auto_212428 ) ) ( not ( = ?auto_212421 ?auto_212428 ) ) ( not ( = ?auto_212423 ?auto_212428 ) ) ( not ( = ?auto_212422 ?auto_212428 ) ) ( not ( = ?auto_212426 ?auto_212428 ) ) ( not ( = ?auto_212425 ?auto_212428 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212423 ?auto_212428 )
      ( MAKE-1PILE ?auto_212420 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212429 - BLOCK
    )
    :vars
    (
      ?auto_212431 - BLOCK
      ?auto_212437 - BLOCK
      ?auto_212436 - BLOCK
      ?auto_212433 - BLOCK
      ?auto_212434 - BLOCK
      ?auto_212430 - BLOCK
      ?auto_212435 - BLOCK
      ?auto_212432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212431 ?auto_212429 ) ( ON-TABLE ?auto_212429 ) ( not ( = ?auto_212429 ?auto_212431 ) ) ( not ( = ?auto_212429 ?auto_212437 ) ) ( not ( = ?auto_212429 ?auto_212436 ) ) ( not ( = ?auto_212431 ?auto_212437 ) ) ( not ( = ?auto_212431 ?auto_212436 ) ) ( not ( = ?auto_212437 ?auto_212436 ) ) ( ON ?auto_212437 ?auto_212431 ) ( not ( = ?auto_212433 ?auto_212434 ) ) ( not ( = ?auto_212433 ?auto_212430 ) ) ( not ( = ?auto_212433 ?auto_212435 ) ) ( not ( = ?auto_212433 ?auto_212436 ) ) ( not ( = ?auto_212434 ?auto_212430 ) ) ( not ( = ?auto_212434 ?auto_212435 ) ) ( not ( = ?auto_212434 ?auto_212436 ) ) ( not ( = ?auto_212430 ?auto_212435 ) ) ( not ( = ?auto_212430 ?auto_212436 ) ) ( not ( = ?auto_212435 ?auto_212436 ) ) ( not ( = ?auto_212429 ?auto_212435 ) ) ( not ( = ?auto_212429 ?auto_212433 ) ) ( not ( = ?auto_212429 ?auto_212434 ) ) ( not ( = ?auto_212429 ?auto_212430 ) ) ( not ( = ?auto_212431 ?auto_212435 ) ) ( not ( = ?auto_212431 ?auto_212433 ) ) ( not ( = ?auto_212431 ?auto_212434 ) ) ( not ( = ?auto_212431 ?auto_212430 ) ) ( not ( = ?auto_212437 ?auto_212435 ) ) ( not ( = ?auto_212437 ?auto_212433 ) ) ( not ( = ?auto_212437 ?auto_212434 ) ) ( not ( = ?auto_212437 ?auto_212430 ) ) ( ON ?auto_212436 ?auto_212437 ) ( ON ?auto_212435 ?auto_212436 ) ( ON ?auto_212430 ?auto_212435 ) ( ON ?auto_212433 ?auto_212432 ) ( CLEAR ?auto_212433 ) ( not ( = ?auto_212429 ?auto_212432 ) ) ( not ( = ?auto_212431 ?auto_212432 ) ) ( not ( = ?auto_212437 ?auto_212432 ) ) ( not ( = ?auto_212436 ?auto_212432 ) ) ( not ( = ?auto_212433 ?auto_212432 ) ) ( not ( = ?auto_212434 ?auto_212432 ) ) ( not ( = ?auto_212430 ?auto_212432 ) ) ( not ( = ?auto_212435 ?auto_212432 ) ) ( HOLDING ?auto_212434 ) ( CLEAR ?auto_212430 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212429 ?auto_212431 ?auto_212437 ?auto_212436 ?auto_212435 ?auto_212430 ?auto_212434 )
      ( MAKE-1PILE ?auto_212429 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212438 - BLOCK
    )
    :vars
    (
      ?auto_212439 - BLOCK
      ?auto_212441 - BLOCK
      ?auto_212446 - BLOCK
      ?auto_212442 - BLOCK
      ?auto_212445 - BLOCK
      ?auto_212444 - BLOCK
      ?auto_212443 - BLOCK
      ?auto_212440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212439 ?auto_212438 ) ( ON-TABLE ?auto_212438 ) ( not ( = ?auto_212438 ?auto_212439 ) ) ( not ( = ?auto_212438 ?auto_212441 ) ) ( not ( = ?auto_212438 ?auto_212446 ) ) ( not ( = ?auto_212439 ?auto_212441 ) ) ( not ( = ?auto_212439 ?auto_212446 ) ) ( not ( = ?auto_212441 ?auto_212446 ) ) ( ON ?auto_212441 ?auto_212439 ) ( not ( = ?auto_212442 ?auto_212445 ) ) ( not ( = ?auto_212442 ?auto_212444 ) ) ( not ( = ?auto_212442 ?auto_212443 ) ) ( not ( = ?auto_212442 ?auto_212446 ) ) ( not ( = ?auto_212445 ?auto_212444 ) ) ( not ( = ?auto_212445 ?auto_212443 ) ) ( not ( = ?auto_212445 ?auto_212446 ) ) ( not ( = ?auto_212444 ?auto_212443 ) ) ( not ( = ?auto_212444 ?auto_212446 ) ) ( not ( = ?auto_212443 ?auto_212446 ) ) ( not ( = ?auto_212438 ?auto_212443 ) ) ( not ( = ?auto_212438 ?auto_212442 ) ) ( not ( = ?auto_212438 ?auto_212445 ) ) ( not ( = ?auto_212438 ?auto_212444 ) ) ( not ( = ?auto_212439 ?auto_212443 ) ) ( not ( = ?auto_212439 ?auto_212442 ) ) ( not ( = ?auto_212439 ?auto_212445 ) ) ( not ( = ?auto_212439 ?auto_212444 ) ) ( not ( = ?auto_212441 ?auto_212443 ) ) ( not ( = ?auto_212441 ?auto_212442 ) ) ( not ( = ?auto_212441 ?auto_212445 ) ) ( not ( = ?auto_212441 ?auto_212444 ) ) ( ON ?auto_212446 ?auto_212441 ) ( ON ?auto_212443 ?auto_212446 ) ( ON ?auto_212444 ?auto_212443 ) ( ON ?auto_212442 ?auto_212440 ) ( not ( = ?auto_212438 ?auto_212440 ) ) ( not ( = ?auto_212439 ?auto_212440 ) ) ( not ( = ?auto_212441 ?auto_212440 ) ) ( not ( = ?auto_212446 ?auto_212440 ) ) ( not ( = ?auto_212442 ?auto_212440 ) ) ( not ( = ?auto_212445 ?auto_212440 ) ) ( not ( = ?auto_212444 ?auto_212440 ) ) ( not ( = ?auto_212443 ?auto_212440 ) ) ( CLEAR ?auto_212444 ) ( ON ?auto_212445 ?auto_212442 ) ( CLEAR ?auto_212445 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212440 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212440 ?auto_212442 )
      ( MAKE-1PILE ?auto_212438 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212447 - BLOCK
    )
    :vars
    (
      ?auto_212454 - BLOCK
      ?auto_212449 - BLOCK
      ?auto_212452 - BLOCK
      ?auto_212448 - BLOCK
      ?auto_212455 - BLOCK
      ?auto_212451 - BLOCK
      ?auto_212453 - BLOCK
      ?auto_212450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212454 ?auto_212447 ) ( ON-TABLE ?auto_212447 ) ( not ( = ?auto_212447 ?auto_212454 ) ) ( not ( = ?auto_212447 ?auto_212449 ) ) ( not ( = ?auto_212447 ?auto_212452 ) ) ( not ( = ?auto_212454 ?auto_212449 ) ) ( not ( = ?auto_212454 ?auto_212452 ) ) ( not ( = ?auto_212449 ?auto_212452 ) ) ( ON ?auto_212449 ?auto_212454 ) ( not ( = ?auto_212448 ?auto_212455 ) ) ( not ( = ?auto_212448 ?auto_212451 ) ) ( not ( = ?auto_212448 ?auto_212453 ) ) ( not ( = ?auto_212448 ?auto_212452 ) ) ( not ( = ?auto_212455 ?auto_212451 ) ) ( not ( = ?auto_212455 ?auto_212453 ) ) ( not ( = ?auto_212455 ?auto_212452 ) ) ( not ( = ?auto_212451 ?auto_212453 ) ) ( not ( = ?auto_212451 ?auto_212452 ) ) ( not ( = ?auto_212453 ?auto_212452 ) ) ( not ( = ?auto_212447 ?auto_212453 ) ) ( not ( = ?auto_212447 ?auto_212448 ) ) ( not ( = ?auto_212447 ?auto_212455 ) ) ( not ( = ?auto_212447 ?auto_212451 ) ) ( not ( = ?auto_212454 ?auto_212453 ) ) ( not ( = ?auto_212454 ?auto_212448 ) ) ( not ( = ?auto_212454 ?auto_212455 ) ) ( not ( = ?auto_212454 ?auto_212451 ) ) ( not ( = ?auto_212449 ?auto_212453 ) ) ( not ( = ?auto_212449 ?auto_212448 ) ) ( not ( = ?auto_212449 ?auto_212455 ) ) ( not ( = ?auto_212449 ?auto_212451 ) ) ( ON ?auto_212452 ?auto_212449 ) ( ON ?auto_212453 ?auto_212452 ) ( ON ?auto_212448 ?auto_212450 ) ( not ( = ?auto_212447 ?auto_212450 ) ) ( not ( = ?auto_212454 ?auto_212450 ) ) ( not ( = ?auto_212449 ?auto_212450 ) ) ( not ( = ?auto_212452 ?auto_212450 ) ) ( not ( = ?auto_212448 ?auto_212450 ) ) ( not ( = ?auto_212455 ?auto_212450 ) ) ( not ( = ?auto_212451 ?auto_212450 ) ) ( not ( = ?auto_212453 ?auto_212450 ) ) ( ON ?auto_212455 ?auto_212448 ) ( CLEAR ?auto_212455 ) ( ON-TABLE ?auto_212450 ) ( HOLDING ?auto_212451 ) ( CLEAR ?auto_212453 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212447 ?auto_212454 ?auto_212449 ?auto_212452 ?auto_212453 ?auto_212451 )
      ( MAKE-1PILE ?auto_212447 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212456 - BLOCK
    )
    :vars
    (
      ?auto_212459 - BLOCK
      ?auto_212460 - BLOCK
      ?auto_212464 - BLOCK
      ?auto_212458 - BLOCK
      ?auto_212463 - BLOCK
      ?auto_212461 - BLOCK
      ?auto_212457 - BLOCK
      ?auto_212462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212459 ?auto_212456 ) ( ON-TABLE ?auto_212456 ) ( not ( = ?auto_212456 ?auto_212459 ) ) ( not ( = ?auto_212456 ?auto_212460 ) ) ( not ( = ?auto_212456 ?auto_212464 ) ) ( not ( = ?auto_212459 ?auto_212460 ) ) ( not ( = ?auto_212459 ?auto_212464 ) ) ( not ( = ?auto_212460 ?auto_212464 ) ) ( ON ?auto_212460 ?auto_212459 ) ( not ( = ?auto_212458 ?auto_212463 ) ) ( not ( = ?auto_212458 ?auto_212461 ) ) ( not ( = ?auto_212458 ?auto_212457 ) ) ( not ( = ?auto_212458 ?auto_212464 ) ) ( not ( = ?auto_212463 ?auto_212461 ) ) ( not ( = ?auto_212463 ?auto_212457 ) ) ( not ( = ?auto_212463 ?auto_212464 ) ) ( not ( = ?auto_212461 ?auto_212457 ) ) ( not ( = ?auto_212461 ?auto_212464 ) ) ( not ( = ?auto_212457 ?auto_212464 ) ) ( not ( = ?auto_212456 ?auto_212457 ) ) ( not ( = ?auto_212456 ?auto_212458 ) ) ( not ( = ?auto_212456 ?auto_212463 ) ) ( not ( = ?auto_212456 ?auto_212461 ) ) ( not ( = ?auto_212459 ?auto_212457 ) ) ( not ( = ?auto_212459 ?auto_212458 ) ) ( not ( = ?auto_212459 ?auto_212463 ) ) ( not ( = ?auto_212459 ?auto_212461 ) ) ( not ( = ?auto_212460 ?auto_212457 ) ) ( not ( = ?auto_212460 ?auto_212458 ) ) ( not ( = ?auto_212460 ?auto_212463 ) ) ( not ( = ?auto_212460 ?auto_212461 ) ) ( ON ?auto_212464 ?auto_212460 ) ( ON ?auto_212457 ?auto_212464 ) ( ON ?auto_212458 ?auto_212462 ) ( not ( = ?auto_212456 ?auto_212462 ) ) ( not ( = ?auto_212459 ?auto_212462 ) ) ( not ( = ?auto_212460 ?auto_212462 ) ) ( not ( = ?auto_212464 ?auto_212462 ) ) ( not ( = ?auto_212458 ?auto_212462 ) ) ( not ( = ?auto_212463 ?auto_212462 ) ) ( not ( = ?auto_212461 ?auto_212462 ) ) ( not ( = ?auto_212457 ?auto_212462 ) ) ( ON ?auto_212463 ?auto_212458 ) ( ON-TABLE ?auto_212462 ) ( CLEAR ?auto_212457 ) ( ON ?auto_212461 ?auto_212463 ) ( CLEAR ?auto_212461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212462 ?auto_212458 ?auto_212463 )
      ( MAKE-1PILE ?auto_212456 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212465 - BLOCK
    )
    :vars
    (
      ?auto_212471 - BLOCK
      ?auto_212466 - BLOCK
      ?auto_212469 - BLOCK
      ?auto_212472 - BLOCK
      ?auto_212468 - BLOCK
      ?auto_212473 - BLOCK
      ?auto_212467 - BLOCK
      ?auto_212470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212471 ?auto_212465 ) ( ON-TABLE ?auto_212465 ) ( not ( = ?auto_212465 ?auto_212471 ) ) ( not ( = ?auto_212465 ?auto_212466 ) ) ( not ( = ?auto_212465 ?auto_212469 ) ) ( not ( = ?auto_212471 ?auto_212466 ) ) ( not ( = ?auto_212471 ?auto_212469 ) ) ( not ( = ?auto_212466 ?auto_212469 ) ) ( ON ?auto_212466 ?auto_212471 ) ( not ( = ?auto_212472 ?auto_212468 ) ) ( not ( = ?auto_212472 ?auto_212473 ) ) ( not ( = ?auto_212472 ?auto_212467 ) ) ( not ( = ?auto_212472 ?auto_212469 ) ) ( not ( = ?auto_212468 ?auto_212473 ) ) ( not ( = ?auto_212468 ?auto_212467 ) ) ( not ( = ?auto_212468 ?auto_212469 ) ) ( not ( = ?auto_212473 ?auto_212467 ) ) ( not ( = ?auto_212473 ?auto_212469 ) ) ( not ( = ?auto_212467 ?auto_212469 ) ) ( not ( = ?auto_212465 ?auto_212467 ) ) ( not ( = ?auto_212465 ?auto_212472 ) ) ( not ( = ?auto_212465 ?auto_212468 ) ) ( not ( = ?auto_212465 ?auto_212473 ) ) ( not ( = ?auto_212471 ?auto_212467 ) ) ( not ( = ?auto_212471 ?auto_212472 ) ) ( not ( = ?auto_212471 ?auto_212468 ) ) ( not ( = ?auto_212471 ?auto_212473 ) ) ( not ( = ?auto_212466 ?auto_212467 ) ) ( not ( = ?auto_212466 ?auto_212472 ) ) ( not ( = ?auto_212466 ?auto_212468 ) ) ( not ( = ?auto_212466 ?auto_212473 ) ) ( ON ?auto_212469 ?auto_212466 ) ( ON ?auto_212472 ?auto_212470 ) ( not ( = ?auto_212465 ?auto_212470 ) ) ( not ( = ?auto_212471 ?auto_212470 ) ) ( not ( = ?auto_212466 ?auto_212470 ) ) ( not ( = ?auto_212469 ?auto_212470 ) ) ( not ( = ?auto_212472 ?auto_212470 ) ) ( not ( = ?auto_212468 ?auto_212470 ) ) ( not ( = ?auto_212473 ?auto_212470 ) ) ( not ( = ?auto_212467 ?auto_212470 ) ) ( ON ?auto_212468 ?auto_212472 ) ( ON-TABLE ?auto_212470 ) ( ON ?auto_212473 ?auto_212468 ) ( CLEAR ?auto_212473 ) ( HOLDING ?auto_212467 ) ( CLEAR ?auto_212469 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212465 ?auto_212471 ?auto_212466 ?auto_212469 ?auto_212467 )
      ( MAKE-1PILE ?auto_212465 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212474 - BLOCK
    )
    :vars
    (
      ?auto_212475 - BLOCK
      ?auto_212480 - BLOCK
      ?auto_212481 - BLOCK
      ?auto_212477 - BLOCK
      ?auto_212478 - BLOCK
      ?auto_212479 - BLOCK
      ?auto_212476 - BLOCK
      ?auto_212482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212475 ?auto_212474 ) ( ON-TABLE ?auto_212474 ) ( not ( = ?auto_212474 ?auto_212475 ) ) ( not ( = ?auto_212474 ?auto_212480 ) ) ( not ( = ?auto_212474 ?auto_212481 ) ) ( not ( = ?auto_212475 ?auto_212480 ) ) ( not ( = ?auto_212475 ?auto_212481 ) ) ( not ( = ?auto_212480 ?auto_212481 ) ) ( ON ?auto_212480 ?auto_212475 ) ( not ( = ?auto_212477 ?auto_212478 ) ) ( not ( = ?auto_212477 ?auto_212479 ) ) ( not ( = ?auto_212477 ?auto_212476 ) ) ( not ( = ?auto_212477 ?auto_212481 ) ) ( not ( = ?auto_212478 ?auto_212479 ) ) ( not ( = ?auto_212478 ?auto_212476 ) ) ( not ( = ?auto_212478 ?auto_212481 ) ) ( not ( = ?auto_212479 ?auto_212476 ) ) ( not ( = ?auto_212479 ?auto_212481 ) ) ( not ( = ?auto_212476 ?auto_212481 ) ) ( not ( = ?auto_212474 ?auto_212476 ) ) ( not ( = ?auto_212474 ?auto_212477 ) ) ( not ( = ?auto_212474 ?auto_212478 ) ) ( not ( = ?auto_212474 ?auto_212479 ) ) ( not ( = ?auto_212475 ?auto_212476 ) ) ( not ( = ?auto_212475 ?auto_212477 ) ) ( not ( = ?auto_212475 ?auto_212478 ) ) ( not ( = ?auto_212475 ?auto_212479 ) ) ( not ( = ?auto_212480 ?auto_212476 ) ) ( not ( = ?auto_212480 ?auto_212477 ) ) ( not ( = ?auto_212480 ?auto_212478 ) ) ( not ( = ?auto_212480 ?auto_212479 ) ) ( ON ?auto_212481 ?auto_212480 ) ( ON ?auto_212477 ?auto_212482 ) ( not ( = ?auto_212474 ?auto_212482 ) ) ( not ( = ?auto_212475 ?auto_212482 ) ) ( not ( = ?auto_212480 ?auto_212482 ) ) ( not ( = ?auto_212481 ?auto_212482 ) ) ( not ( = ?auto_212477 ?auto_212482 ) ) ( not ( = ?auto_212478 ?auto_212482 ) ) ( not ( = ?auto_212479 ?auto_212482 ) ) ( not ( = ?auto_212476 ?auto_212482 ) ) ( ON ?auto_212478 ?auto_212477 ) ( ON-TABLE ?auto_212482 ) ( ON ?auto_212479 ?auto_212478 ) ( CLEAR ?auto_212481 ) ( ON ?auto_212476 ?auto_212479 ) ( CLEAR ?auto_212476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212482 ?auto_212477 ?auto_212478 ?auto_212479 )
      ( MAKE-1PILE ?auto_212474 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212483 - BLOCK
    )
    :vars
    (
      ?auto_212490 - BLOCK
      ?auto_212488 - BLOCK
      ?auto_212485 - BLOCK
      ?auto_212487 - BLOCK
      ?auto_212491 - BLOCK
      ?auto_212486 - BLOCK
      ?auto_212484 - BLOCK
      ?auto_212489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212490 ?auto_212483 ) ( ON-TABLE ?auto_212483 ) ( not ( = ?auto_212483 ?auto_212490 ) ) ( not ( = ?auto_212483 ?auto_212488 ) ) ( not ( = ?auto_212483 ?auto_212485 ) ) ( not ( = ?auto_212490 ?auto_212488 ) ) ( not ( = ?auto_212490 ?auto_212485 ) ) ( not ( = ?auto_212488 ?auto_212485 ) ) ( ON ?auto_212488 ?auto_212490 ) ( not ( = ?auto_212487 ?auto_212491 ) ) ( not ( = ?auto_212487 ?auto_212486 ) ) ( not ( = ?auto_212487 ?auto_212484 ) ) ( not ( = ?auto_212487 ?auto_212485 ) ) ( not ( = ?auto_212491 ?auto_212486 ) ) ( not ( = ?auto_212491 ?auto_212484 ) ) ( not ( = ?auto_212491 ?auto_212485 ) ) ( not ( = ?auto_212486 ?auto_212484 ) ) ( not ( = ?auto_212486 ?auto_212485 ) ) ( not ( = ?auto_212484 ?auto_212485 ) ) ( not ( = ?auto_212483 ?auto_212484 ) ) ( not ( = ?auto_212483 ?auto_212487 ) ) ( not ( = ?auto_212483 ?auto_212491 ) ) ( not ( = ?auto_212483 ?auto_212486 ) ) ( not ( = ?auto_212490 ?auto_212484 ) ) ( not ( = ?auto_212490 ?auto_212487 ) ) ( not ( = ?auto_212490 ?auto_212491 ) ) ( not ( = ?auto_212490 ?auto_212486 ) ) ( not ( = ?auto_212488 ?auto_212484 ) ) ( not ( = ?auto_212488 ?auto_212487 ) ) ( not ( = ?auto_212488 ?auto_212491 ) ) ( not ( = ?auto_212488 ?auto_212486 ) ) ( ON ?auto_212487 ?auto_212489 ) ( not ( = ?auto_212483 ?auto_212489 ) ) ( not ( = ?auto_212490 ?auto_212489 ) ) ( not ( = ?auto_212488 ?auto_212489 ) ) ( not ( = ?auto_212485 ?auto_212489 ) ) ( not ( = ?auto_212487 ?auto_212489 ) ) ( not ( = ?auto_212491 ?auto_212489 ) ) ( not ( = ?auto_212486 ?auto_212489 ) ) ( not ( = ?auto_212484 ?auto_212489 ) ) ( ON ?auto_212491 ?auto_212487 ) ( ON-TABLE ?auto_212489 ) ( ON ?auto_212486 ?auto_212491 ) ( ON ?auto_212484 ?auto_212486 ) ( CLEAR ?auto_212484 ) ( HOLDING ?auto_212485 ) ( CLEAR ?auto_212488 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212483 ?auto_212490 ?auto_212488 ?auto_212485 )
      ( MAKE-1PILE ?auto_212483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212492 - BLOCK
    )
    :vars
    (
      ?auto_212497 - BLOCK
      ?auto_212498 - BLOCK
      ?auto_212493 - BLOCK
      ?auto_212494 - BLOCK
      ?auto_212499 - BLOCK
      ?auto_212495 - BLOCK
      ?auto_212500 - BLOCK
      ?auto_212496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212497 ?auto_212492 ) ( ON-TABLE ?auto_212492 ) ( not ( = ?auto_212492 ?auto_212497 ) ) ( not ( = ?auto_212492 ?auto_212498 ) ) ( not ( = ?auto_212492 ?auto_212493 ) ) ( not ( = ?auto_212497 ?auto_212498 ) ) ( not ( = ?auto_212497 ?auto_212493 ) ) ( not ( = ?auto_212498 ?auto_212493 ) ) ( ON ?auto_212498 ?auto_212497 ) ( not ( = ?auto_212494 ?auto_212499 ) ) ( not ( = ?auto_212494 ?auto_212495 ) ) ( not ( = ?auto_212494 ?auto_212500 ) ) ( not ( = ?auto_212494 ?auto_212493 ) ) ( not ( = ?auto_212499 ?auto_212495 ) ) ( not ( = ?auto_212499 ?auto_212500 ) ) ( not ( = ?auto_212499 ?auto_212493 ) ) ( not ( = ?auto_212495 ?auto_212500 ) ) ( not ( = ?auto_212495 ?auto_212493 ) ) ( not ( = ?auto_212500 ?auto_212493 ) ) ( not ( = ?auto_212492 ?auto_212500 ) ) ( not ( = ?auto_212492 ?auto_212494 ) ) ( not ( = ?auto_212492 ?auto_212499 ) ) ( not ( = ?auto_212492 ?auto_212495 ) ) ( not ( = ?auto_212497 ?auto_212500 ) ) ( not ( = ?auto_212497 ?auto_212494 ) ) ( not ( = ?auto_212497 ?auto_212499 ) ) ( not ( = ?auto_212497 ?auto_212495 ) ) ( not ( = ?auto_212498 ?auto_212500 ) ) ( not ( = ?auto_212498 ?auto_212494 ) ) ( not ( = ?auto_212498 ?auto_212499 ) ) ( not ( = ?auto_212498 ?auto_212495 ) ) ( ON ?auto_212494 ?auto_212496 ) ( not ( = ?auto_212492 ?auto_212496 ) ) ( not ( = ?auto_212497 ?auto_212496 ) ) ( not ( = ?auto_212498 ?auto_212496 ) ) ( not ( = ?auto_212493 ?auto_212496 ) ) ( not ( = ?auto_212494 ?auto_212496 ) ) ( not ( = ?auto_212499 ?auto_212496 ) ) ( not ( = ?auto_212495 ?auto_212496 ) ) ( not ( = ?auto_212500 ?auto_212496 ) ) ( ON ?auto_212499 ?auto_212494 ) ( ON-TABLE ?auto_212496 ) ( ON ?auto_212495 ?auto_212499 ) ( ON ?auto_212500 ?auto_212495 ) ( CLEAR ?auto_212498 ) ( ON ?auto_212493 ?auto_212500 ) ( CLEAR ?auto_212493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212496 ?auto_212494 ?auto_212499 ?auto_212495 ?auto_212500 )
      ( MAKE-1PILE ?auto_212492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212501 - BLOCK
    )
    :vars
    (
      ?auto_212507 - BLOCK
      ?auto_212506 - BLOCK
      ?auto_212508 - BLOCK
      ?auto_212503 - BLOCK
      ?auto_212504 - BLOCK
      ?auto_212502 - BLOCK
      ?auto_212505 - BLOCK
      ?auto_212509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212507 ?auto_212501 ) ( ON-TABLE ?auto_212501 ) ( not ( = ?auto_212501 ?auto_212507 ) ) ( not ( = ?auto_212501 ?auto_212506 ) ) ( not ( = ?auto_212501 ?auto_212508 ) ) ( not ( = ?auto_212507 ?auto_212506 ) ) ( not ( = ?auto_212507 ?auto_212508 ) ) ( not ( = ?auto_212506 ?auto_212508 ) ) ( not ( = ?auto_212503 ?auto_212504 ) ) ( not ( = ?auto_212503 ?auto_212502 ) ) ( not ( = ?auto_212503 ?auto_212505 ) ) ( not ( = ?auto_212503 ?auto_212508 ) ) ( not ( = ?auto_212504 ?auto_212502 ) ) ( not ( = ?auto_212504 ?auto_212505 ) ) ( not ( = ?auto_212504 ?auto_212508 ) ) ( not ( = ?auto_212502 ?auto_212505 ) ) ( not ( = ?auto_212502 ?auto_212508 ) ) ( not ( = ?auto_212505 ?auto_212508 ) ) ( not ( = ?auto_212501 ?auto_212505 ) ) ( not ( = ?auto_212501 ?auto_212503 ) ) ( not ( = ?auto_212501 ?auto_212504 ) ) ( not ( = ?auto_212501 ?auto_212502 ) ) ( not ( = ?auto_212507 ?auto_212505 ) ) ( not ( = ?auto_212507 ?auto_212503 ) ) ( not ( = ?auto_212507 ?auto_212504 ) ) ( not ( = ?auto_212507 ?auto_212502 ) ) ( not ( = ?auto_212506 ?auto_212505 ) ) ( not ( = ?auto_212506 ?auto_212503 ) ) ( not ( = ?auto_212506 ?auto_212504 ) ) ( not ( = ?auto_212506 ?auto_212502 ) ) ( ON ?auto_212503 ?auto_212509 ) ( not ( = ?auto_212501 ?auto_212509 ) ) ( not ( = ?auto_212507 ?auto_212509 ) ) ( not ( = ?auto_212506 ?auto_212509 ) ) ( not ( = ?auto_212508 ?auto_212509 ) ) ( not ( = ?auto_212503 ?auto_212509 ) ) ( not ( = ?auto_212504 ?auto_212509 ) ) ( not ( = ?auto_212502 ?auto_212509 ) ) ( not ( = ?auto_212505 ?auto_212509 ) ) ( ON ?auto_212504 ?auto_212503 ) ( ON-TABLE ?auto_212509 ) ( ON ?auto_212502 ?auto_212504 ) ( ON ?auto_212505 ?auto_212502 ) ( ON ?auto_212508 ?auto_212505 ) ( CLEAR ?auto_212508 ) ( HOLDING ?auto_212506 ) ( CLEAR ?auto_212507 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212501 ?auto_212507 ?auto_212506 )
      ( MAKE-1PILE ?auto_212501 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212510 - BLOCK
    )
    :vars
    (
      ?auto_212511 - BLOCK
      ?auto_212516 - BLOCK
      ?auto_212513 - BLOCK
      ?auto_212514 - BLOCK
      ?auto_212512 - BLOCK
      ?auto_212518 - BLOCK
      ?auto_212515 - BLOCK
      ?auto_212517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212511 ?auto_212510 ) ( ON-TABLE ?auto_212510 ) ( not ( = ?auto_212510 ?auto_212511 ) ) ( not ( = ?auto_212510 ?auto_212516 ) ) ( not ( = ?auto_212510 ?auto_212513 ) ) ( not ( = ?auto_212511 ?auto_212516 ) ) ( not ( = ?auto_212511 ?auto_212513 ) ) ( not ( = ?auto_212516 ?auto_212513 ) ) ( not ( = ?auto_212514 ?auto_212512 ) ) ( not ( = ?auto_212514 ?auto_212518 ) ) ( not ( = ?auto_212514 ?auto_212515 ) ) ( not ( = ?auto_212514 ?auto_212513 ) ) ( not ( = ?auto_212512 ?auto_212518 ) ) ( not ( = ?auto_212512 ?auto_212515 ) ) ( not ( = ?auto_212512 ?auto_212513 ) ) ( not ( = ?auto_212518 ?auto_212515 ) ) ( not ( = ?auto_212518 ?auto_212513 ) ) ( not ( = ?auto_212515 ?auto_212513 ) ) ( not ( = ?auto_212510 ?auto_212515 ) ) ( not ( = ?auto_212510 ?auto_212514 ) ) ( not ( = ?auto_212510 ?auto_212512 ) ) ( not ( = ?auto_212510 ?auto_212518 ) ) ( not ( = ?auto_212511 ?auto_212515 ) ) ( not ( = ?auto_212511 ?auto_212514 ) ) ( not ( = ?auto_212511 ?auto_212512 ) ) ( not ( = ?auto_212511 ?auto_212518 ) ) ( not ( = ?auto_212516 ?auto_212515 ) ) ( not ( = ?auto_212516 ?auto_212514 ) ) ( not ( = ?auto_212516 ?auto_212512 ) ) ( not ( = ?auto_212516 ?auto_212518 ) ) ( ON ?auto_212514 ?auto_212517 ) ( not ( = ?auto_212510 ?auto_212517 ) ) ( not ( = ?auto_212511 ?auto_212517 ) ) ( not ( = ?auto_212516 ?auto_212517 ) ) ( not ( = ?auto_212513 ?auto_212517 ) ) ( not ( = ?auto_212514 ?auto_212517 ) ) ( not ( = ?auto_212512 ?auto_212517 ) ) ( not ( = ?auto_212518 ?auto_212517 ) ) ( not ( = ?auto_212515 ?auto_212517 ) ) ( ON ?auto_212512 ?auto_212514 ) ( ON-TABLE ?auto_212517 ) ( ON ?auto_212518 ?auto_212512 ) ( ON ?auto_212515 ?auto_212518 ) ( ON ?auto_212513 ?auto_212515 ) ( CLEAR ?auto_212511 ) ( ON ?auto_212516 ?auto_212513 ) ( CLEAR ?auto_212516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212517 ?auto_212514 ?auto_212512 ?auto_212518 ?auto_212515 ?auto_212513 )
      ( MAKE-1PILE ?auto_212510 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212537 - BLOCK
    )
    :vars
    (
      ?auto_212543 - BLOCK
      ?auto_212541 - BLOCK
      ?auto_212539 - BLOCK
      ?auto_212545 - BLOCK
      ?auto_212544 - BLOCK
      ?auto_212540 - BLOCK
      ?auto_212538 - BLOCK
      ?auto_212542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212537 ?auto_212543 ) ) ( not ( = ?auto_212537 ?auto_212541 ) ) ( not ( = ?auto_212537 ?auto_212539 ) ) ( not ( = ?auto_212543 ?auto_212541 ) ) ( not ( = ?auto_212543 ?auto_212539 ) ) ( not ( = ?auto_212541 ?auto_212539 ) ) ( not ( = ?auto_212545 ?auto_212544 ) ) ( not ( = ?auto_212545 ?auto_212540 ) ) ( not ( = ?auto_212545 ?auto_212538 ) ) ( not ( = ?auto_212545 ?auto_212539 ) ) ( not ( = ?auto_212544 ?auto_212540 ) ) ( not ( = ?auto_212544 ?auto_212538 ) ) ( not ( = ?auto_212544 ?auto_212539 ) ) ( not ( = ?auto_212540 ?auto_212538 ) ) ( not ( = ?auto_212540 ?auto_212539 ) ) ( not ( = ?auto_212538 ?auto_212539 ) ) ( not ( = ?auto_212537 ?auto_212538 ) ) ( not ( = ?auto_212537 ?auto_212545 ) ) ( not ( = ?auto_212537 ?auto_212544 ) ) ( not ( = ?auto_212537 ?auto_212540 ) ) ( not ( = ?auto_212543 ?auto_212538 ) ) ( not ( = ?auto_212543 ?auto_212545 ) ) ( not ( = ?auto_212543 ?auto_212544 ) ) ( not ( = ?auto_212543 ?auto_212540 ) ) ( not ( = ?auto_212541 ?auto_212538 ) ) ( not ( = ?auto_212541 ?auto_212545 ) ) ( not ( = ?auto_212541 ?auto_212544 ) ) ( not ( = ?auto_212541 ?auto_212540 ) ) ( ON ?auto_212545 ?auto_212542 ) ( not ( = ?auto_212537 ?auto_212542 ) ) ( not ( = ?auto_212543 ?auto_212542 ) ) ( not ( = ?auto_212541 ?auto_212542 ) ) ( not ( = ?auto_212539 ?auto_212542 ) ) ( not ( = ?auto_212545 ?auto_212542 ) ) ( not ( = ?auto_212544 ?auto_212542 ) ) ( not ( = ?auto_212540 ?auto_212542 ) ) ( not ( = ?auto_212538 ?auto_212542 ) ) ( ON ?auto_212544 ?auto_212545 ) ( ON-TABLE ?auto_212542 ) ( ON ?auto_212540 ?auto_212544 ) ( ON ?auto_212538 ?auto_212540 ) ( ON ?auto_212539 ?auto_212538 ) ( ON ?auto_212541 ?auto_212539 ) ( ON ?auto_212543 ?auto_212541 ) ( CLEAR ?auto_212543 ) ( HOLDING ?auto_212537 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212537 ?auto_212543 )
      ( MAKE-1PILE ?auto_212537 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212546 - BLOCK
    )
    :vars
    (
      ?auto_212553 - BLOCK
      ?auto_212548 - BLOCK
      ?auto_212547 - BLOCK
      ?auto_212552 - BLOCK
      ?auto_212551 - BLOCK
      ?auto_212550 - BLOCK
      ?auto_212554 - BLOCK
      ?auto_212549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212546 ?auto_212553 ) ) ( not ( = ?auto_212546 ?auto_212548 ) ) ( not ( = ?auto_212546 ?auto_212547 ) ) ( not ( = ?auto_212553 ?auto_212548 ) ) ( not ( = ?auto_212553 ?auto_212547 ) ) ( not ( = ?auto_212548 ?auto_212547 ) ) ( not ( = ?auto_212552 ?auto_212551 ) ) ( not ( = ?auto_212552 ?auto_212550 ) ) ( not ( = ?auto_212552 ?auto_212554 ) ) ( not ( = ?auto_212552 ?auto_212547 ) ) ( not ( = ?auto_212551 ?auto_212550 ) ) ( not ( = ?auto_212551 ?auto_212554 ) ) ( not ( = ?auto_212551 ?auto_212547 ) ) ( not ( = ?auto_212550 ?auto_212554 ) ) ( not ( = ?auto_212550 ?auto_212547 ) ) ( not ( = ?auto_212554 ?auto_212547 ) ) ( not ( = ?auto_212546 ?auto_212554 ) ) ( not ( = ?auto_212546 ?auto_212552 ) ) ( not ( = ?auto_212546 ?auto_212551 ) ) ( not ( = ?auto_212546 ?auto_212550 ) ) ( not ( = ?auto_212553 ?auto_212554 ) ) ( not ( = ?auto_212553 ?auto_212552 ) ) ( not ( = ?auto_212553 ?auto_212551 ) ) ( not ( = ?auto_212553 ?auto_212550 ) ) ( not ( = ?auto_212548 ?auto_212554 ) ) ( not ( = ?auto_212548 ?auto_212552 ) ) ( not ( = ?auto_212548 ?auto_212551 ) ) ( not ( = ?auto_212548 ?auto_212550 ) ) ( ON ?auto_212552 ?auto_212549 ) ( not ( = ?auto_212546 ?auto_212549 ) ) ( not ( = ?auto_212553 ?auto_212549 ) ) ( not ( = ?auto_212548 ?auto_212549 ) ) ( not ( = ?auto_212547 ?auto_212549 ) ) ( not ( = ?auto_212552 ?auto_212549 ) ) ( not ( = ?auto_212551 ?auto_212549 ) ) ( not ( = ?auto_212550 ?auto_212549 ) ) ( not ( = ?auto_212554 ?auto_212549 ) ) ( ON ?auto_212551 ?auto_212552 ) ( ON-TABLE ?auto_212549 ) ( ON ?auto_212550 ?auto_212551 ) ( ON ?auto_212554 ?auto_212550 ) ( ON ?auto_212547 ?auto_212554 ) ( ON ?auto_212548 ?auto_212547 ) ( ON ?auto_212553 ?auto_212548 ) ( ON ?auto_212546 ?auto_212553 ) ( CLEAR ?auto_212546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_212549 ?auto_212552 ?auto_212551 ?auto_212550 ?auto_212554 ?auto_212547 ?auto_212548 ?auto_212553 )
      ( MAKE-1PILE ?auto_212546 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212562 - BLOCK
      ?auto_212563 - BLOCK
      ?auto_212564 - BLOCK
      ?auto_212565 - BLOCK
      ?auto_212566 - BLOCK
      ?auto_212567 - BLOCK
      ?auto_212568 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_212568 ) ( CLEAR ?auto_212567 ) ( ON-TABLE ?auto_212562 ) ( ON ?auto_212563 ?auto_212562 ) ( ON ?auto_212564 ?auto_212563 ) ( ON ?auto_212565 ?auto_212564 ) ( ON ?auto_212566 ?auto_212565 ) ( ON ?auto_212567 ?auto_212566 ) ( not ( = ?auto_212562 ?auto_212563 ) ) ( not ( = ?auto_212562 ?auto_212564 ) ) ( not ( = ?auto_212562 ?auto_212565 ) ) ( not ( = ?auto_212562 ?auto_212566 ) ) ( not ( = ?auto_212562 ?auto_212567 ) ) ( not ( = ?auto_212562 ?auto_212568 ) ) ( not ( = ?auto_212563 ?auto_212564 ) ) ( not ( = ?auto_212563 ?auto_212565 ) ) ( not ( = ?auto_212563 ?auto_212566 ) ) ( not ( = ?auto_212563 ?auto_212567 ) ) ( not ( = ?auto_212563 ?auto_212568 ) ) ( not ( = ?auto_212564 ?auto_212565 ) ) ( not ( = ?auto_212564 ?auto_212566 ) ) ( not ( = ?auto_212564 ?auto_212567 ) ) ( not ( = ?auto_212564 ?auto_212568 ) ) ( not ( = ?auto_212565 ?auto_212566 ) ) ( not ( = ?auto_212565 ?auto_212567 ) ) ( not ( = ?auto_212565 ?auto_212568 ) ) ( not ( = ?auto_212566 ?auto_212567 ) ) ( not ( = ?auto_212566 ?auto_212568 ) ) ( not ( = ?auto_212567 ?auto_212568 ) ) )
    :subtasks
    ( ( !STACK ?auto_212568 ?auto_212567 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212569 - BLOCK
      ?auto_212570 - BLOCK
      ?auto_212571 - BLOCK
      ?auto_212572 - BLOCK
      ?auto_212573 - BLOCK
      ?auto_212574 - BLOCK
      ?auto_212575 - BLOCK
    )
    :vars
    (
      ?auto_212576 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212574 ) ( ON-TABLE ?auto_212569 ) ( ON ?auto_212570 ?auto_212569 ) ( ON ?auto_212571 ?auto_212570 ) ( ON ?auto_212572 ?auto_212571 ) ( ON ?auto_212573 ?auto_212572 ) ( ON ?auto_212574 ?auto_212573 ) ( not ( = ?auto_212569 ?auto_212570 ) ) ( not ( = ?auto_212569 ?auto_212571 ) ) ( not ( = ?auto_212569 ?auto_212572 ) ) ( not ( = ?auto_212569 ?auto_212573 ) ) ( not ( = ?auto_212569 ?auto_212574 ) ) ( not ( = ?auto_212569 ?auto_212575 ) ) ( not ( = ?auto_212570 ?auto_212571 ) ) ( not ( = ?auto_212570 ?auto_212572 ) ) ( not ( = ?auto_212570 ?auto_212573 ) ) ( not ( = ?auto_212570 ?auto_212574 ) ) ( not ( = ?auto_212570 ?auto_212575 ) ) ( not ( = ?auto_212571 ?auto_212572 ) ) ( not ( = ?auto_212571 ?auto_212573 ) ) ( not ( = ?auto_212571 ?auto_212574 ) ) ( not ( = ?auto_212571 ?auto_212575 ) ) ( not ( = ?auto_212572 ?auto_212573 ) ) ( not ( = ?auto_212572 ?auto_212574 ) ) ( not ( = ?auto_212572 ?auto_212575 ) ) ( not ( = ?auto_212573 ?auto_212574 ) ) ( not ( = ?auto_212573 ?auto_212575 ) ) ( not ( = ?auto_212574 ?auto_212575 ) ) ( ON ?auto_212575 ?auto_212576 ) ( CLEAR ?auto_212575 ) ( HAND-EMPTY ) ( not ( = ?auto_212569 ?auto_212576 ) ) ( not ( = ?auto_212570 ?auto_212576 ) ) ( not ( = ?auto_212571 ?auto_212576 ) ) ( not ( = ?auto_212572 ?auto_212576 ) ) ( not ( = ?auto_212573 ?auto_212576 ) ) ( not ( = ?auto_212574 ?auto_212576 ) ) ( not ( = ?auto_212575 ?auto_212576 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212575 ?auto_212576 )
      ( MAKE-7PILE ?auto_212569 ?auto_212570 ?auto_212571 ?auto_212572 ?auto_212573 ?auto_212574 ?auto_212575 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212577 - BLOCK
      ?auto_212578 - BLOCK
      ?auto_212579 - BLOCK
      ?auto_212580 - BLOCK
      ?auto_212581 - BLOCK
      ?auto_212582 - BLOCK
      ?auto_212583 - BLOCK
    )
    :vars
    (
      ?auto_212584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212577 ) ( ON ?auto_212578 ?auto_212577 ) ( ON ?auto_212579 ?auto_212578 ) ( ON ?auto_212580 ?auto_212579 ) ( ON ?auto_212581 ?auto_212580 ) ( not ( = ?auto_212577 ?auto_212578 ) ) ( not ( = ?auto_212577 ?auto_212579 ) ) ( not ( = ?auto_212577 ?auto_212580 ) ) ( not ( = ?auto_212577 ?auto_212581 ) ) ( not ( = ?auto_212577 ?auto_212582 ) ) ( not ( = ?auto_212577 ?auto_212583 ) ) ( not ( = ?auto_212578 ?auto_212579 ) ) ( not ( = ?auto_212578 ?auto_212580 ) ) ( not ( = ?auto_212578 ?auto_212581 ) ) ( not ( = ?auto_212578 ?auto_212582 ) ) ( not ( = ?auto_212578 ?auto_212583 ) ) ( not ( = ?auto_212579 ?auto_212580 ) ) ( not ( = ?auto_212579 ?auto_212581 ) ) ( not ( = ?auto_212579 ?auto_212582 ) ) ( not ( = ?auto_212579 ?auto_212583 ) ) ( not ( = ?auto_212580 ?auto_212581 ) ) ( not ( = ?auto_212580 ?auto_212582 ) ) ( not ( = ?auto_212580 ?auto_212583 ) ) ( not ( = ?auto_212581 ?auto_212582 ) ) ( not ( = ?auto_212581 ?auto_212583 ) ) ( not ( = ?auto_212582 ?auto_212583 ) ) ( ON ?auto_212583 ?auto_212584 ) ( CLEAR ?auto_212583 ) ( not ( = ?auto_212577 ?auto_212584 ) ) ( not ( = ?auto_212578 ?auto_212584 ) ) ( not ( = ?auto_212579 ?auto_212584 ) ) ( not ( = ?auto_212580 ?auto_212584 ) ) ( not ( = ?auto_212581 ?auto_212584 ) ) ( not ( = ?auto_212582 ?auto_212584 ) ) ( not ( = ?auto_212583 ?auto_212584 ) ) ( HOLDING ?auto_212582 ) ( CLEAR ?auto_212581 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212577 ?auto_212578 ?auto_212579 ?auto_212580 ?auto_212581 ?auto_212582 )
      ( MAKE-7PILE ?auto_212577 ?auto_212578 ?auto_212579 ?auto_212580 ?auto_212581 ?auto_212582 ?auto_212583 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212585 - BLOCK
      ?auto_212586 - BLOCK
      ?auto_212587 - BLOCK
      ?auto_212588 - BLOCK
      ?auto_212589 - BLOCK
      ?auto_212590 - BLOCK
      ?auto_212591 - BLOCK
    )
    :vars
    (
      ?auto_212592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212585 ) ( ON ?auto_212586 ?auto_212585 ) ( ON ?auto_212587 ?auto_212586 ) ( ON ?auto_212588 ?auto_212587 ) ( ON ?auto_212589 ?auto_212588 ) ( not ( = ?auto_212585 ?auto_212586 ) ) ( not ( = ?auto_212585 ?auto_212587 ) ) ( not ( = ?auto_212585 ?auto_212588 ) ) ( not ( = ?auto_212585 ?auto_212589 ) ) ( not ( = ?auto_212585 ?auto_212590 ) ) ( not ( = ?auto_212585 ?auto_212591 ) ) ( not ( = ?auto_212586 ?auto_212587 ) ) ( not ( = ?auto_212586 ?auto_212588 ) ) ( not ( = ?auto_212586 ?auto_212589 ) ) ( not ( = ?auto_212586 ?auto_212590 ) ) ( not ( = ?auto_212586 ?auto_212591 ) ) ( not ( = ?auto_212587 ?auto_212588 ) ) ( not ( = ?auto_212587 ?auto_212589 ) ) ( not ( = ?auto_212587 ?auto_212590 ) ) ( not ( = ?auto_212587 ?auto_212591 ) ) ( not ( = ?auto_212588 ?auto_212589 ) ) ( not ( = ?auto_212588 ?auto_212590 ) ) ( not ( = ?auto_212588 ?auto_212591 ) ) ( not ( = ?auto_212589 ?auto_212590 ) ) ( not ( = ?auto_212589 ?auto_212591 ) ) ( not ( = ?auto_212590 ?auto_212591 ) ) ( ON ?auto_212591 ?auto_212592 ) ( not ( = ?auto_212585 ?auto_212592 ) ) ( not ( = ?auto_212586 ?auto_212592 ) ) ( not ( = ?auto_212587 ?auto_212592 ) ) ( not ( = ?auto_212588 ?auto_212592 ) ) ( not ( = ?auto_212589 ?auto_212592 ) ) ( not ( = ?auto_212590 ?auto_212592 ) ) ( not ( = ?auto_212591 ?auto_212592 ) ) ( CLEAR ?auto_212589 ) ( ON ?auto_212590 ?auto_212591 ) ( CLEAR ?auto_212590 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212592 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212592 ?auto_212591 )
      ( MAKE-7PILE ?auto_212585 ?auto_212586 ?auto_212587 ?auto_212588 ?auto_212589 ?auto_212590 ?auto_212591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212593 - BLOCK
      ?auto_212594 - BLOCK
      ?auto_212595 - BLOCK
      ?auto_212596 - BLOCK
      ?auto_212597 - BLOCK
      ?auto_212598 - BLOCK
      ?auto_212599 - BLOCK
    )
    :vars
    (
      ?auto_212600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212593 ) ( ON ?auto_212594 ?auto_212593 ) ( ON ?auto_212595 ?auto_212594 ) ( ON ?auto_212596 ?auto_212595 ) ( not ( = ?auto_212593 ?auto_212594 ) ) ( not ( = ?auto_212593 ?auto_212595 ) ) ( not ( = ?auto_212593 ?auto_212596 ) ) ( not ( = ?auto_212593 ?auto_212597 ) ) ( not ( = ?auto_212593 ?auto_212598 ) ) ( not ( = ?auto_212593 ?auto_212599 ) ) ( not ( = ?auto_212594 ?auto_212595 ) ) ( not ( = ?auto_212594 ?auto_212596 ) ) ( not ( = ?auto_212594 ?auto_212597 ) ) ( not ( = ?auto_212594 ?auto_212598 ) ) ( not ( = ?auto_212594 ?auto_212599 ) ) ( not ( = ?auto_212595 ?auto_212596 ) ) ( not ( = ?auto_212595 ?auto_212597 ) ) ( not ( = ?auto_212595 ?auto_212598 ) ) ( not ( = ?auto_212595 ?auto_212599 ) ) ( not ( = ?auto_212596 ?auto_212597 ) ) ( not ( = ?auto_212596 ?auto_212598 ) ) ( not ( = ?auto_212596 ?auto_212599 ) ) ( not ( = ?auto_212597 ?auto_212598 ) ) ( not ( = ?auto_212597 ?auto_212599 ) ) ( not ( = ?auto_212598 ?auto_212599 ) ) ( ON ?auto_212599 ?auto_212600 ) ( not ( = ?auto_212593 ?auto_212600 ) ) ( not ( = ?auto_212594 ?auto_212600 ) ) ( not ( = ?auto_212595 ?auto_212600 ) ) ( not ( = ?auto_212596 ?auto_212600 ) ) ( not ( = ?auto_212597 ?auto_212600 ) ) ( not ( = ?auto_212598 ?auto_212600 ) ) ( not ( = ?auto_212599 ?auto_212600 ) ) ( ON ?auto_212598 ?auto_212599 ) ( CLEAR ?auto_212598 ) ( ON-TABLE ?auto_212600 ) ( HOLDING ?auto_212597 ) ( CLEAR ?auto_212596 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212593 ?auto_212594 ?auto_212595 ?auto_212596 ?auto_212597 )
      ( MAKE-7PILE ?auto_212593 ?auto_212594 ?auto_212595 ?auto_212596 ?auto_212597 ?auto_212598 ?auto_212599 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212601 - BLOCK
      ?auto_212602 - BLOCK
      ?auto_212603 - BLOCK
      ?auto_212604 - BLOCK
      ?auto_212605 - BLOCK
      ?auto_212606 - BLOCK
      ?auto_212607 - BLOCK
    )
    :vars
    (
      ?auto_212608 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212601 ) ( ON ?auto_212602 ?auto_212601 ) ( ON ?auto_212603 ?auto_212602 ) ( ON ?auto_212604 ?auto_212603 ) ( not ( = ?auto_212601 ?auto_212602 ) ) ( not ( = ?auto_212601 ?auto_212603 ) ) ( not ( = ?auto_212601 ?auto_212604 ) ) ( not ( = ?auto_212601 ?auto_212605 ) ) ( not ( = ?auto_212601 ?auto_212606 ) ) ( not ( = ?auto_212601 ?auto_212607 ) ) ( not ( = ?auto_212602 ?auto_212603 ) ) ( not ( = ?auto_212602 ?auto_212604 ) ) ( not ( = ?auto_212602 ?auto_212605 ) ) ( not ( = ?auto_212602 ?auto_212606 ) ) ( not ( = ?auto_212602 ?auto_212607 ) ) ( not ( = ?auto_212603 ?auto_212604 ) ) ( not ( = ?auto_212603 ?auto_212605 ) ) ( not ( = ?auto_212603 ?auto_212606 ) ) ( not ( = ?auto_212603 ?auto_212607 ) ) ( not ( = ?auto_212604 ?auto_212605 ) ) ( not ( = ?auto_212604 ?auto_212606 ) ) ( not ( = ?auto_212604 ?auto_212607 ) ) ( not ( = ?auto_212605 ?auto_212606 ) ) ( not ( = ?auto_212605 ?auto_212607 ) ) ( not ( = ?auto_212606 ?auto_212607 ) ) ( ON ?auto_212607 ?auto_212608 ) ( not ( = ?auto_212601 ?auto_212608 ) ) ( not ( = ?auto_212602 ?auto_212608 ) ) ( not ( = ?auto_212603 ?auto_212608 ) ) ( not ( = ?auto_212604 ?auto_212608 ) ) ( not ( = ?auto_212605 ?auto_212608 ) ) ( not ( = ?auto_212606 ?auto_212608 ) ) ( not ( = ?auto_212607 ?auto_212608 ) ) ( ON ?auto_212606 ?auto_212607 ) ( ON-TABLE ?auto_212608 ) ( CLEAR ?auto_212604 ) ( ON ?auto_212605 ?auto_212606 ) ( CLEAR ?auto_212605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212608 ?auto_212607 ?auto_212606 )
      ( MAKE-7PILE ?auto_212601 ?auto_212602 ?auto_212603 ?auto_212604 ?auto_212605 ?auto_212606 ?auto_212607 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212609 - BLOCK
      ?auto_212610 - BLOCK
      ?auto_212611 - BLOCK
      ?auto_212612 - BLOCK
      ?auto_212613 - BLOCK
      ?auto_212614 - BLOCK
      ?auto_212615 - BLOCK
    )
    :vars
    (
      ?auto_212616 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212609 ) ( ON ?auto_212610 ?auto_212609 ) ( ON ?auto_212611 ?auto_212610 ) ( not ( = ?auto_212609 ?auto_212610 ) ) ( not ( = ?auto_212609 ?auto_212611 ) ) ( not ( = ?auto_212609 ?auto_212612 ) ) ( not ( = ?auto_212609 ?auto_212613 ) ) ( not ( = ?auto_212609 ?auto_212614 ) ) ( not ( = ?auto_212609 ?auto_212615 ) ) ( not ( = ?auto_212610 ?auto_212611 ) ) ( not ( = ?auto_212610 ?auto_212612 ) ) ( not ( = ?auto_212610 ?auto_212613 ) ) ( not ( = ?auto_212610 ?auto_212614 ) ) ( not ( = ?auto_212610 ?auto_212615 ) ) ( not ( = ?auto_212611 ?auto_212612 ) ) ( not ( = ?auto_212611 ?auto_212613 ) ) ( not ( = ?auto_212611 ?auto_212614 ) ) ( not ( = ?auto_212611 ?auto_212615 ) ) ( not ( = ?auto_212612 ?auto_212613 ) ) ( not ( = ?auto_212612 ?auto_212614 ) ) ( not ( = ?auto_212612 ?auto_212615 ) ) ( not ( = ?auto_212613 ?auto_212614 ) ) ( not ( = ?auto_212613 ?auto_212615 ) ) ( not ( = ?auto_212614 ?auto_212615 ) ) ( ON ?auto_212615 ?auto_212616 ) ( not ( = ?auto_212609 ?auto_212616 ) ) ( not ( = ?auto_212610 ?auto_212616 ) ) ( not ( = ?auto_212611 ?auto_212616 ) ) ( not ( = ?auto_212612 ?auto_212616 ) ) ( not ( = ?auto_212613 ?auto_212616 ) ) ( not ( = ?auto_212614 ?auto_212616 ) ) ( not ( = ?auto_212615 ?auto_212616 ) ) ( ON ?auto_212614 ?auto_212615 ) ( ON-TABLE ?auto_212616 ) ( ON ?auto_212613 ?auto_212614 ) ( CLEAR ?auto_212613 ) ( HOLDING ?auto_212612 ) ( CLEAR ?auto_212611 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212609 ?auto_212610 ?auto_212611 ?auto_212612 )
      ( MAKE-7PILE ?auto_212609 ?auto_212610 ?auto_212611 ?auto_212612 ?auto_212613 ?auto_212614 ?auto_212615 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212617 - BLOCK
      ?auto_212618 - BLOCK
      ?auto_212619 - BLOCK
      ?auto_212620 - BLOCK
      ?auto_212621 - BLOCK
      ?auto_212622 - BLOCK
      ?auto_212623 - BLOCK
    )
    :vars
    (
      ?auto_212624 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212617 ) ( ON ?auto_212618 ?auto_212617 ) ( ON ?auto_212619 ?auto_212618 ) ( not ( = ?auto_212617 ?auto_212618 ) ) ( not ( = ?auto_212617 ?auto_212619 ) ) ( not ( = ?auto_212617 ?auto_212620 ) ) ( not ( = ?auto_212617 ?auto_212621 ) ) ( not ( = ?auto_212617 ?auto_212622 ) ) ( not ( = ?auto_212617 ?auto_212623 ) ) ( not ( = ?auto_212618 ?auto_212619 ) ) ( not ( = ?auto_212618 ?auto_212620 ) ) ( not ( = ?auto_212618 ?auto_212621 ) ) ( not ( = ?auto_212618 ?auto_212622 ) ) ( not ( = ?auto_212618 ?auto_212623 ) ) ( not ( = ?auto_212619 ?auto_212620 ) ) ( not ( = ?auto_212619 ?auto_212621 ) ) ( not ( = ?auto_212619 ?auto_212622 ) ) ( not ( = ?auto_212619 ?auto_212623 ) ) ( not ( = ?auto_212620 ?auto_212621 ) ) ( not ( = ?auto_212620 ?auto_212622 ) ) ( not ( = ?auto_212620 ?auto_212623 ) ) ( not ( = ?auto_212621 ?auto_212622 ) ) ( not ( = ?auto_212621 ?auto_212623 ) ) ( not ( = ?auto_212622 ?auto_212623 ) ) ( ON ?auto_212623 ?auto_212624 ) ( not ( = ?auto_212617 ?auto_212624 ) ) ( not ( = ?auto_212618 ?auto_212624 ) ) ( not ( = ?auto_212619 ?auto_212624 ) ) ( not ( = ?auto_212620 ?auto_212624 ) ) ( not ( = ?auto_212621 ?auto_212624 ) ) ( not ( = ?auto_212622 ?auto_212624 ) ) ( not ( = ?auto_212623 ?auto_212624 ) ) ( ON ?auto_212622 ?auto_212623 ) ( ON-TABLE ?auto_212624 ) ( ON ?auto_212621 ?auto_212622 ) ( CLEAR ?auto_212619 ) ( ON ?auto_212620 ?auto_212621 ) ( CLEAR ?auto_212620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212624 ?auto_212623 ?auto_212622 ?auto_212621 )
      ( MAKE-7PILE ?auto_212617 ?auto_212618 ?auto_212619 ?auto_212620 ?auto_212621 ?auto_212622 ?auto_212623 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212625 - BLOCK
      ?auto_212626 - BLOCK
      ?auto_212627 - BLOCK
      ?auto_212628 - BLOCK
      ?auto_212629 - BLOCK
      ?auto_212630 - BLOCK
      ?auto_212631 - BLOCK
    )
    :vars
    (
      ?auto_212632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212625 ) ( ON ?auto_212626 ?auto_212625 ) ( not ( = ?auto_212625 ?auto_212626 ) ) ( not ( = ?auto_212625 ?auto_212627 ) ) ( not ( = ?auto_212625 ?auto_212628 ) ) ( not ( = ?auto_212625 ?auto_212629 ) ) ( not ( = ?auto_212625 ?auto_212630 ) ) ( not ( = ?auto_212625 ?auto_212631 ) ) ( not ( = ?auto_212626 ?auto_212627 ) ) ( not ( = ?auto_212626 ?auto_212628 ) ) ( not ( = ?auto_212626 ?auto_212629 ) ) ( not ( = ?auto_212626 ?auto_212630 ) ) ( not ( = ?auto_212626 ?auto_212631 ) ) ( not ( = ?auto_212627 ?auto_212628 ) ) ( not ( = ?auto_212627 ?auto_212629 ) ) ( not ( = ?auto_212627 ?auto_212630 ) ) ( not ( = ?auto_212627 ?auto_212631 ) ) ( not ( = ?auto_212628 ?auto_212629 ) ) ( not ( = ?auto_212628 ?auto_212630 ) ) ( not ( = ?auto_212628 ?auto_212631 ) ) ( not ( = ?auto_212629 ?auto_212630 ) ) ( not ( = ?auto_212629 ?auto_212631 ) ) ( not ( = ?auto_212630 ?auto_212631 ) ) ( ON ?auto_212631 ?auto_212632 ) ( not ( = ?auto_212625 ?auto_212632 ) ) ( not ( = ?auto_212626 ?auto_212632 ) ) ( not ( = ?auto_212627 ?auto_212632 ) ) ( not ( = ?auto_212628 ?auto_212632 ) ) ( not ( = ?auto_212629 ?auto_212632 ) ) ( not ( = ?auto_212630 ?auto_212632 ) ) ( not ( = ?auto_212631 ?auto_212632 ) ) ( ON ?auto_212630 ?auto_212631 ) ( ON-TABLE ?auto_212632 ) ( ON ?auto_212629 ?auto_212630 ) ( ON ?auto_212628 ?auto_212629 ) ( CLEAR ?auto_212628 ) ( HOLDING ?auto_212627 ) ( CLEAR ?auto_212626 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212625 ?auto_212626 ?auto_212627 )
      ( MAKE-7PILE ?auto_212625 ?auto_212626 ?auto_212627 ?auto_212628 ?auto_212629 ?auto_212630 ?auto_212631 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212633 - BLOCK
      ?auto_212634 - BLOCK
      ?auto_212635 - BLOCK
      ?auto_212636 - BLOCK
      ?auto_212637 - BLOCK
      ?auto_212638 - BLOCK
      ?auto_212639 - BLOCK
    )
    :vars
    (
      ?auto_212640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212633 ) ( ON ?auto_212634 ?auto_212633 ) ( not ( = ?auto_212633 ?auto_212634 ) ) ( not ( = ?auto_212633 ?auto_212635 ) ) ( not ( = ?auto_212633 ?auto_212636 ) ) ( not ( = ?auto_212633 ?auto_212637 ) ) ( not ( = ?auto_212633 ?auto_212638 ) ) ( not ( = ?auto_212633 ?auto_212639 ) ) ( not ( = ?auto_212634 ?auto_212635 ) ) ( not ( = ?auto_212634 ?auto_212636 ) ) ( not ( = ?auto_212634 ?auto_212637 ) ) ( not ( = ?auto_212634 ?auto_212638 ) ) ( not ( = ?auto_212634 ?auto_212639 ) ) ( not ( = ?auto_212635 ?auto_212636 ) ) ( not ( = ?auto_212635 ?auto_212637 ) ) ( not ( = ?auto_212635 ?auto_212638 ) ) ( not ( = ?auto_212635 ?auto_212639 ) ) ( not ( = ?auto_212636 ?auto_212637 ) ) ( not ( = ?auto_212636 ?auto_212638 ) ) ( not ( = ?auto_212636 ?auto_212639 ) ) ( not ( = ?auto_212637 ?auto_212638 ) ) ( not ( = ?auto_212637 ?auto_212639 ) ) ( not ( = ?auto_212638 ?auto_212639 ) ) ( ON ?auto_212639 ?auto_212640 ) ( not ( = ?auto_212633 ?auto_212640 ) ) ( not ( = ?auto_212634 ?auto_212640 ) ) ( not ( = ?auto_212635 ?auto_212640 ) ) ( not ( = ?auto_212636 ?auto_212640 ) ) ( not ( = ?auto_212637 ?auto_212640 ) ) ( not ( = ?auto_212638 ?auto_212640 ) ) ( not ( = ?auto_212639 ?auto_212640 ) ) ( ON ?auto_212638 ?auto_212639 ) ( ON-TABLE ?auto_212640 ) ( ON ?auto_212637 ?auto_212638 ) ( ON ?auto_212636 ?auto_212637 ) ( CLEAR ?auto_212634 ) ( ON ?auto_212635 ?auto_212636 ) ( CLEAR ?auto_212635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212640 ?auto_212639 ?auto_212638 ?auto_212637 ?auto_212636 )
      ( MAKE-7PILE ?auto_212633 ?auto_212634 ?auto_212635 ?auto_212636 ?auto_212637 ?auto_212638 ?auto_212639 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212641 - BLOCK
      ?auto_212642 - BLOCK
      ?auto_212643 - BLOCK
      ?auto_212644 - BLOCK
      ?auto_212645 - BLOCK
      ?auto_212646 - BLOCK
      ?auto_212647 - BLOCK
    )
    :vars
    (
      ?auto_212648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212641 ) ( not ( = ?auto_212641 ?auto_212642 ) ) ( not ( = ?auto_212641 ?auto_212643 ) ) ( not ( = ?auto_212641 ?auto_212644 ) ) ( not ( = ?auto_212641 ?auto_212645 ) ) ( not ( = ?auto_212641 ?auto_212646 ) ) ( not ( = ?auto_212641 ?auto_212647 ) ) ( not ( = ?auto_212642 ?auto_212643 ) ) ( not ( = ?auto_212642 ?auto_212644 ) ) ( not ( = ?auto_212642 ?auto_212645 ) ) ( not ( = ?auto_212642 ?auto_212646 ) ) ( not ( = ?auto_212642 ?auto_212647 ) ) ( not ( = ?auto_212643 ?auto_212644 ) ) ( not ( = ?auto_212643 ?auto_212645 ) ) ( not ( = ?auto_212643 ?auto_212646 ) ) ( not ( = ?auto_212643 ?auto_212647 ) ) ( not ( = ?auto_212644 ?auto_212645 ) ) ( not ( = ?auto_212644 ?auto_212646 ) ) ( not ( = ?auto_212644 ?auto_212647 ) ) ( not ( = ?auto_212645 ?auto_212646 ) ) ( not ( = ?auto_212645 ?auto_212647 ) ) ( not ( = ?auto_212646 ?auto_212647 ) ) ( ON ?auto_212647 ?auto_212648 ) ( not ( = ?auto_212641 ?auto_212648 ) ) ( not ( = ?auto_212642 ?auto_212648 ) ) ( not ( = ?auto_212643 ?auto_212648 ) ) ( not ( = ?auto_212644 ?auto_212648 ) ) ( not ( = ?auto_212645 ?auto_212648 ) ) ( not ( = ?auto_212646 ?auto_212648 ) ) ( not ( = ?auto_212647 ?auto_212648 ) ) ( ON ?auto_212646 ?auto_212647 ) ( ON-TABLE ?auto_212648 ) ( ON ?auto_212645 ?auto_212646 ) ( ON ?auto_212644 ?auto_212645 ) ( ON ?auto_212643 ?auto_212644 ) ( CLEAR ?auto_212643 ) ( HOLDING ?auto_212642 ) ( CLEAR ?auto_212641 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212641 ?auto_212642 )
      ( MAKE-7PILE ?auto_212641 ?auto_212642 ?auto_212643 ?auto_212644 ?auto_212645 ?auto_212646 ?auto_212647 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212649 - BLOCK
      ?auto_212650 - BLOCK
      ?auto_212651 - BLOCK
      ?auto_212652 - BLOCK
      ?auto_212653 - BLOCK
      ?auto_212654 - BLOCK
      ?auto_212655 - BLOCK
    )
    :vars
    (
      ?auto_212656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212649 ) ( not ( = ?auto_212649 ?auto_212650 ) ) ( not ( = ?auto_212649 ?auto_212651 ) ) ( not ( = ?auto_212649 ?auto_212652 ) ) ( not ( = ?auto_212649 ?auto_212653 ) ) ( not ( = ?auto_212649 ?auto_212654 ) ) ( not ( = ?auto_212649 ?auto_212655 ) ) ( not ( = ?auto_212650 ?auto_212651 ) ) ( not ( = ?auto_212650 ?auto_212652 ) ) ( not ( = ?auto_212650 ?auto_212653 ) ) ( not ( = ?auto_212650 ?auto_212654 ) ) ( not ( = ?auto_212650 ?auto_212655 ) ) ( not ( = ?auto_212651 ?auto_212652 ) ) ( not ( = ?auto_212651 ?auto_212653 ) ) ( not ( = ?auto_212651 ?auto_212654 ) ) ( not ( = ?auto_212651 ?auto_212655 ) ) ( not ( = ?auto_212652 ?auto_212653 ) ) ( not ( = ?auto_212652 ?auto_212654 ) ) ( not ( = ?auto_212652 ?auto_212655 ) ) ( not ( = ?auto_212653 ?auto_212654 ) ) ( not ( = ?auto_212653 ?auto_212655 ) ) ( not ( = ?auto_212654 ?auto_212655 ) ) ( ON ?auto_212655 ?auto_212656 ) ( not ( = ?auto_212649 ?auto_212656 ) ) ( not ( = ?auto_212650 ?auto_212656 ) ) ( not ( = ?auto_212651 ?auto_212656 ) ) ( not ( = ?auto_212652 ?auto_212656 ) ) ( not ( = ?auto_212653 ?auto_212656 ) ) ( not ( = ?auto_212654 ?auto_212656 ) ) ( not ( = ?auto_212655 ?auto_212656 ) ) ( ON ?auto_212654 ?auto_212655 ) ( ON-TABLE ?auto_212656 ) ( ON ?auto_212653 ?auto_212654 ) ( ON ?auto_212652 ?auto_212653 ) ( ON ?auto_212651 ?auto_212652 ) ( CLEAR ?auto_212649 ) ( ON ?auto_212650 ?auto_212651 ) ( CLEAR ?auto_212650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212656 ?auto_212655 ?auto_212654 ?auto_212653 ?auto_212652 ?auto_212651 )
      ( MAKE-7PILE ?auto_212649 ?auto_212650 ?auto_212651 ?auto_212652 ?auto_212653 ?auto_212654 ?auto_212655 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212657 - BLOCK
      ?auto_212658 - BLOCK
      ?auto_212659 - BLOCK
      ?auto_212660 - BLOCK
      ?auto_212661 - BLOCK
      ?auto_212662 - BLOCK
      ?auto_212663 - BLOCK
    )
    :vars
    (
      ?auto_212664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212657 ?auto_212658 ) ) ( not ( = ?auto_212657 ?auto_212659 ) ) ( not ( = ?auto_212657 ?auto_212660 ) ) ( not ( = ?auto_212657 ?auto_212661 ) ) ( not ( = ?auto_212657 ?auto_212662 ) ) ( not ( = ?auto_212657 ?auto_212663 ) ) ( not ( = ?auto_212658 ?auto_212659 ) ) ( not ( = ?auto_212658 ?auto_212660 ) ) ( not ( = ?auto_212658 ?auto_212661 ) ) ( not ( = ?auto_212658 ?auto_212662 ) ) ( not ( = ?auto_212658 ?auto_212663 ) ) ( not ( = ?auto_212659 ?auto_212660 ) ) ( not ( = ?auto_212659 ?auto_212661 ) ) ( not ( = ?auto_212659 ?auto_212662 ) ) ( not ( = ?auto_212659 ?auto_212663 ) ) ( not ( = ?auto_212660 ?auto_212661 ) ) ( not ( = ?auto_212660 ?auto_212662 ) ) ( not ( = ?auto_212660 ?auto_212663 ) ) ( not ( = ?auto_212661 ?auto_212662 ) ) ( not ( = ?auto_212661 ?auto_212663 ) ) ( not ( = ?auto_212662 ?auto_212663 ) ) ( ON ?auto_212663 ?auto_212664 ) ( not ( = ?auto_212657 ?auto_212664 ) ) ( not ( = ?auto_212658 ?auto_212664 ) ) ( not ( = ?auto_212659 ?auto_212664 ) ) ( not ( = ?auto_212660 ?auto_212664 ) ) ( not ( = ?auto_212661 ?auto_212664 ) ) ( not ( = ?auto_212662 ?auto_212664 ) ) ( not ( = ?auto_212663 ?auto_212664 ) ) ( ON ?auto_212662 ?auto_212663 ) ( ON-TABLE ?auto_212664 ) ( ON ?auto_212661 ?auto_212662 ) ( ON ?auto_212660 ?auto_212661 ) ( ON ?auto_212659 ?auto_212660 ) ( ON ?auto_212658 ?auto_212659 ) ( CLEAR ?auto_212658 ) ( HOLDING ?auto_212657 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212657 )
      ( MAKE-7PILE ?auto_212657 ?auto_212658 ?auto_212659 ?auto_212660 ?auto_212661 ?auto_212662 ?auto_212663 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212665 - BLOCK
      ?auto_212666 - BLOCK
      ?auto_212667 - BLOCK
      ?auto_212668 - BLOCK
      ?auto_212669 - BLOCK
      ?auto_212670 - BLOCK
      ?auto_212671 - BLOCK
    )
    :vars
    (
      ?auto_212672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212665 ?auto_212666 ) ) ( not ( = ?auto_212665 ?auto_212667 ) ) ( not ( = ?auto_212665 ?auto_212668 ) ) ( not ( = ?auto_212665 ?auto_212669 ) ) ( not ( = ?auto_212665 ?auto_212670 ) ) ( not ( = ?auto_212665 ?auto_212671 ) ) ( not ( = ?auto_212666 ?auto_212667 ) ) ( not ( = ?auto_212666 ?auto_212668 ) ) ( not ( = ?auto_212666 ?auto_212669 ) ) ( not ( = ?auto_212666 ?auto_212670 ) ) ( not ( = ?auto_212666 ?auto_212671 ) ) ( not ( = ?auto_212667 ?auto_212668 ) ) ( not ( = ?auto_212667 ?auto_212669 ) ) ( not ( = ?auto_212667 ?auto_212670 ) ) ( not ( = ?auto_212667 ?auto_212671 ) ) ( not ( = ?auto_212668 ?auto_212669 ) ) ( not ( = ?auto_212668 ?auto_212670 ) ) ( not ( = ?auto_212668 ?auto_212671 ) ) ( not ( = ?auto_212669 ?auto_212670 ) ) ( not ( = ?auto_212669 ?auto_212671 ) ) ( not ( = ?auto_212670 ?auto_212671 ) ) ( ON ?auto_212671 ?auto_212672 ) ( not ( = ?auto_212665 ?auto_212672 ) ) ( not ( = ?auto_212666 ?auto_212672 ) ) ( not ( = ?auto_212667 ?auto_212672 ) ) ( not ( = ?auto_212668 ?auto_212672 ) ) ( not ( = ?auto_212669 ?auto_212672 ) ) ( not ( = ?auto_212670 ?auto_212672 ) ) ( not ( = ?auto_212671 ?auto_212672 ) ) ( ON ?auto_212670 ?auto_212671 ) ( ON-TABLE ?auto_212672 ) ( ON ?auto_212669 ?auto_212670 ) ( ON ?auto_212668 ?auto_212669 ) ( ON ?auto_212667 ?auto_212668 ) ( ON ?auto_212666 ?auto_212667 ) ( ON ?auto_212665 ?auto_212666 ) ( CLEAR ?auto_212665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212672 ?auto_212671 ?auto_212670 ?auto_212669 ?auto_212668 ?auto_212667 ?auto_212666 )
      ( MAKE-7PILE ?auto_212665 ?auto_212666 ?auto_212667 ?auto_212668 ?auto_212669 ?auto_212670 ?auto_212671 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212673 - BLOCK
      ?auto_212674 - BLOCK
      ?auto_212675 - BLOCK
      ?auto_212676 - BLOCK
      ?auto_212677 - BLOCK
      ?auto_212678 - BLOCK
      ?auto_212679 - BLOCK
    )
    :vars
    (
      ?auto_212680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212673 ?auto_212674 ) ) ( not ( = ?auto_212673 ?auto_212675 ) ) ( not ( = ?auto_212673 ?auto_212676 ) ) ( not ( = ?auto_212673 ?auto_212677 ) ) ( not ( = ?auto_212673 ?auto_212678 ) ) ( not ( = ?auto_212673 ?auto_212679 ) ) ( not ( = ?auto_212674 ?auto_212675 ) ) ( not ( = ?auto_212674 ?auto_212676 ) ) ( not ( = ?auto_212674 ?auto_212677 ) ) ( not ( = ?auto_212674 ?auto_212678 ) ) ( not ( = ?auto_212674 ?auto_212679 ) ) ( not ( = ?auto_212675 ?auto_212676 ) ) ( not ( = ?auto_212675 ?auto_212677 ) ) ( not ( = ?auto_212675 ?auto_212678 ) ) ( not ( = ?auto_212675 ?auto_212679 ) ) ( not ( = ?auto_212676 ?auto_212677 ) ) ( not ( = ?auto_212676 ?auto_212678 ) ) ( not ( = ?auto_212676 ?auto_212679 ) ) ( not ( = ?auto_212677 ?auto_212678 ) ) ( not ( = ?auto_212677 ?auto_212679 ) ) ( not ( = ?auto_212678 ?auto_212679 ) ) ( ON ?auto_212679 ?auto_212680 ) ( not ( = ?auto_212673 ?auto_212680 ) ) ( not ( = ?auto_212674 ?auto_212680 ) ) ( not ( = ?auto_212675 ?auto_212680 ) ) ( not ( = ?auto_212676 ?auto_212680 ) ) ( not ( = ?auto_212677 ?auto_212680 ) ) ( not ( = ?auto_212678 ?auto_212680 ) ) ( not ( = ?auto_212679 ?auto_212680 ) ) ( ON ?auto_212678 ?auto_212679 ) ( ON-TABLE ?auto_212680 ) ( ON ?auto_212677 ?auto_212678 ) ( ON ?auto_212676 ?auto_212677 ) ( ON ?auto_212675 ?auto_212676 ) ( ON ?auto_212674 ?auto_212675 ) ( HOLDING ?auto_212673 ) ( CLEAR ?auto_212674 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_212680 ?auto_212679 ?auto_212678 ?auto_212677 ?auto_212676 ?auto_212675 ?auto_212674 ?auto_212673 )
      ( MAKE-7PILE ?auto_212673 ?auto_212674 ?auto_212675 ?auto_212676 ?auto_212677 ?auto_212678 ?auto_212679 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212681 - BLOCK
      ?auto_212682 - BLOCK
      ?auto_212683 - BLOCK
      ?auto_212684 - BLOCK
      ?auto_212685 - BLOCK
      ?auto_212686 - BLOCK
      ?auto_212687 - BLOCK
    )
    :vars
    (
      ?auto_212688 - BLOCK
      ?auto_212689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212681 ?auto_212682 ) ) ( not ( = ?auto_212681 ?auto_212683 ) ) ( not ( = ?auto_212681 ?auto_212684 ) ) ( not ( = ?auto_212681 ?auto_212685 ) ) ( not ( = ?auto_212681 ?auto_212686 ) ) ( not ( = ?auto_212681 ?auto_212687 ) ) ( not ( = ?auto_212682 ?auto_212683 ) ) ( not ( = ?auto_212682 ?auto_212684 ) ) ( not ( = ?auto_212682 ?auto_212685 ) ) ( not ( = ?auto_212682 ?auto_212686 ) ) ( not ( = ?auto_212682 ?auto_212687 ) ) ( not ( = ?auto_212683 ?auto_212684 ) ) ( not ( = ?auto_212683 ?auto_212685 ) ) ( not ( = ?auto_212683 ?auto_212686 ) ) ( not ( = ?auto_212683 ?auto_212687 ) ) ( not ( = ?auto_212684 ?auto_212685 ) ) ( not ( = ?auto_212684 ?auto_212686 ) ) ( not ( = ?auto_212684 ?auto_212687 ) ) ( not ( = ?auto_212685 ?auto_212686 ) ) ( not ( = ?auto_212685 ?auto_212687 ) ) ( not ( = ?auto_212686 ?auto_212687 ) ) ( ON ?auto_212687 ?auto_212688 ) ( not ( = ?auto_212681 ?auto_212688 ) ) ( not ( = ?auto_212682 ?auto_212688 ) ) ( not ( = ?auto_212683 ?auto_212688 ) ) ( not ( = ?auto_212684 ?auto_212688 ) ) ( not ( = ?auto_212685 ?auto_212688 ) ) ( not ( = ?auto_212686 ?auto_212688 ) ) ( not ( = ?auto_212687 ?auto_212688 ) ) ( ON ?auto_212686 ?auto_212687 ) ( ON-TABLE ?auto_212688 ) ( ON ?auto_212685 ?auto_212686 ) ( ON ?auto_212684 ?auto_212685 ) ( ON ?auto_212683 ?auto_212684 ) ( ON ?auto_212682 ?auto_212683 ) ( CLEAR ?auto_212682 ) ( ON ?auto_212681 ?auto_212689 ) ( CLEAR ?auto_212681 ) ( HAND-EMPTY ) ( not ( = ?auto_212681 ?auto_212689 ) ) ( not ( = ?auto_212682 ?auto_212689 ) ) ( not ( = ?auto_212683 ?auto_212689 ) ) ( not ( = ?auto_212684 ?auto_212689 ) ) ( not ( = ?auto_212685 ?auto_212689 ) ) ( not ( = ?auto_212686 ?auto_212689 ) ) ( not ( = ?auto_212687 ?auto_212689 ) ) ( not ( = ?auto_212688 ?auto_212689 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212681 ?auto_212689 )
      ( MAKE-7PILE ?auto_212681 ?auto_212682 ?auto_212683 ?auto_212684 ?auto_212685 ?auto_212686 ?auto_212687 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212690 - BLOCK
      ?auto_212691 - BLOCK
      ?auto_212692 - BLOCK
      ?auto_212693 - BLOCK
      ?auto_212694 - BLOCK
      ?auto_212695 - BLOCK
      ?auto_212696 - BLOCK
    )
    :vars
    (
      ?auto_212698 - BLOCK
      ?auto_212697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212690 ?auto_212691 ) ) ( not ( = ?auto_212690 ?auto_212692 ) ) ( not ( = ?auto_212690 ?auto_212693 ) ) ( not ( = ?auto_212690 ?auto_212694 ) ) ( not ( = ?auto_212690 ?auto_212695 ) ) ( not ( = ?auto_212690 ?auto_212696 ) ) ( not ( = ?auto_212691 ?auto_212692 ) ) ( not ( = ?auto_212691 ?auto_212693 ) ) ( not ( = ?auto_212691 ?auto_212694 ) ) ( not ( = ?auto_212691 ?auto_212695 ) ) ( not ( = ?auto_212691 ?auto_212696 ) ) ( not ( = ?auto_212692 ?auto_212693 ) ) ( not ( = ?auto_212692 ?auto_212694 ) ) ( not ( = ?auto_212692 ?auto_212695 ) ) ( not ( = ?auto_212692 ?auto_212696 ) ) ( not ( = ?auto_212693 ?auto_212694 ) ) ( not ( = ?auto_212693 ?auto_212695 ) ) ( not ( = ?auto_212693 ?auto_212696 ) ) ( not ( = ?auto_212694 ?auto_212695 ) ) ( not ( = ?auto_212694 ?auto_212696 ) ) ( not ( = ?auto_212695 ?auto_212696 ) ) ( ON ?auto_212696 ?auto_212698 ) ( not ( = ?auto_212690 ?auto_212698 ) ) ( not ( = ?auto_212691 ?auto_212698 ) ) ( not ( = ?auto_212692 ?auto_212698 ) ) ( not ( = ?auto_212693 ?auto_212698 ) ) ( not ( = ?auto_212694 ?auto_212698 ) ) ( not ( = ?auto_212695 ?auto_212698 ) ) ( not ( = ?auto_212696 ?auto_212698 ) ) ( ON ?auto_212695 ?auto_212696 ) ( ON-TABLE ?auto_212698 ) ( ON ?auto_212694 ?auto_212695 ) ( ON ?auto_212693 ?auto_212694 ) ( ON ?auto_212692 ?auto_212693 ) ( ON ?auto_212690 ?auto_212697 ) ( CLEAR ?auto_212690 ) ( not ( = ?auto_212690 ?auto_212697 ) ) ( not ( = ?auto_212691 ?auto_212697 ) ) ( not ( = ?auto_212692 ?auto_212697 ) ) ( not ( = ?auto_212693 ?auto_212697 ) ) ( not ( = ?auto_212694 ?auto_212697 ) ) ( not ( = ?auto_212695 ?auto_212697 ) ) ( not ( = ?auto_212696 ?auto_212697 ) ) ( not ( = ?auto_212698 ?auto_212697 ) ) ( HOLDING ?auto_212691 ) ( CLEAR ?auto_212692 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212698 ?auto_212696 ?auto_212695 ?auto_212694 ?auto_212693 ?auto_212692 ?auto_212691 )
      ( MAKE-7PILE ?auto_212690 ?auto_212691 ?auto_212692 ?auto_212693 ?auto_212694 ?auto_212695 ?auto_212696 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212699 - BLOCK
      ?auto_212700 - BLOCK
      ?auto_212701 - BLOCK
      ?auto_212702 - BLOCK
      ?auto_212703 - BLOCK
      ?auto_212704 - BLOCK
      ?auto_212705 - BLOCK
    )
    :vars
    (
      ?auto_212706 - BLOCK
      ?auto_212707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212699 ?auto_212700 ) ) ( not ( = ?auto_212699 ?auto_212701 ) ) ( not ( = ?auto_212699 ?auto_212702 ) ) ( not ( = ?auto_212699 ?auto_212703 ) ) ( not ( = ?auto_212699 ?auto_212704 ) ) ( not ( = ?auto_212699 ?auto_212705 ) ) ( not ( = ?auto_212700 ?auto_212701 ) ) ( not ( = ?auto_212700 ?auto_212702 ) ) ( not ( = ?auto_212700 ?auto_212703 ) ) ( not ( = ?auto_212700 ?auto_212704 ) ) ( not ( = ?auto_212700 ?auto_212705 ) ) ( not ( = ?auto_212701 ?auto_212702 ) ) ( not ( = ?auto_212701 ?auto_212703 ) ) ( not ( = ?auto_212701 ?auto_212704 ) ) ( not ( = ?auto_212701 ?auto_212705 ) ) ( not ( = ?auto_212702 ?auto_212703 ) ) ( not ( = ?auto_212702 ?auto_212704 ) ) ( not ( = ?auto_212702 ?auto_212705 ) ) ( not ( = ?auto_212703 ?auto_212704 ) ) ( not ( = ?auto_212703 ?auto_212705 ) ) ( not ( = ?auto_212704 ?auto_212705 ) ) ( ON ?auto_212705 ?auto_212706 ) ( not ( = ?auto_212699 ?auto_212706 ) ) ( not ( = ?auto_212700 ?auto_212706 ) ) ( not ( = ?auto_212701 ?auto_212706 ) ) ( not ( = ?auto_212702 ?auto_212706 ) ) ( not ( = ?auto_212703 ?auto_212706 ) ) ( not ( = ?auto_212704 ?auto_212706 ) ) ( not ( = ?auto_212705 ?auto_212706 ) ) ( ON ?auto_212704 ?auto_212705 ) ( ON-TABLE ?auto_212706 ) ( ON ?auto_212703 ?auto_212704 ) ( ON ?auto_212702 ?auto_212703 ) ( ON ?auto_212701 ?auto_212702 ) ( ON ?auto_212699 ?auto_212707 ) ( not ( = ?auto_212699 ?auto_212707 ) ) ( not ( = ?auto_212700 ?auto_212707 ) ) ( not ( = ?auto_212701 ?auto_212707 ) ) ( not ( = ?auto_212702 ?auto_212707 ) ) ( not ( = ?auto_212703 ?auto_212707 ) ) ( not ( = ?auto_212704 ?auto_212707 ) ) ( not ( = ?auto_212705 ?auto_212707 ) ) ( not ( = ?auto_212706 ?auto_212707 ) ) ( CLEAR ?auto_212701 ) ( ON ?auto_212700 ?auto_212699 ) ( CLEAR ?auto_212700 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212707 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212707 ?auto_212699 )
      ( MAKE-7PILE ?auto_212699 ?auto_212700 ?auto_212701 ?auto_212702 ?auto_212703 ?auto_212704 ?auto_212705 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212708 - BLOCK
      ?auto_212709 - BLOCK
      ?auto_212710 - BLOCK
      ?auto_212711 - BLOCK
      ?auto_212712 - BLOCK
      ?auto_212713 - BLOCK
      ?auto_212714 - BLOCK
    )
    :vars
    (
      ?auto_212716 - BLOCK
      ?auto_212715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212708 ?auto_212709 ) ) ( not ( = ?auto_212708 ?auto_212710 ) ) ( not ( = ?auto_212708 ?auto_212711 ) ) ( not ( = ?auto_212708 ?auto_212712 ) ) ( not ( = ?auto_212708 ?auto_212713 ) ) ( not ( = ?auto_212708 ?auto_212714 ) ) ( not ( = ?auto_212709 ?auto_212710 ) ) ( not ( = ?auto_212709 ?auto_212711 ) ) ( not ( = ?auto_212709 ?auto_212712 ) ) ( not ( = ?auto_212709 ?auto_212713 ) ) ( not ( = ?auto_212709 ?auto_212714 ) ) ( not ( = ?auto_212710 ?auto_212711 ) ) ( not ( = ?auto_212710 ?auto_212712 ) ) ( not ( = ?auto_212710 ?auto_212713 ) ) ( not ( = ?auto_212710 ?auto_212714 ) ) ( not ( = ?auto_212711 ?auto_212712 ) ) ( not ( = ?auto_212711 ?auto_212713 ) ) ( not ( = ?auto_212711 ?auto_212714 ) ) ( not ( = ?auto_212712 ?auto_212713 ) ) ( not ( = ?auto_212712 ?auto_212714 ) ) ( not ( = ?auto_212713 ?auto_212714 ) ) ( ON ?auto_212714 ?auto_212716 ) ( not ( = ?auto_212708 ?auto_212716 ) ) ( not ( = ?auto_212709 ?auto_212716 ) ) ( not ( = ?auto_212710 ?auto_212716 ) ) ( not ( = ?auto_212711 ?auto_212716 ) ) ( not ( = ?auto_212712 ?auto_212716 ) ) ( not ( = ?auto_212713 ?auto_212716 ) ) ( not ( = ?auto_212714 ?auto_212716 ) ) ( ON ?auto_212713 ?auto_212714 ) ( ON-TABLE ?auto_212716 ) ( ON ?auto_212712 ?auto_212713 ) ( ON ?auto_212711 ?auto_212712 ) ( ON ?auto_212708 ?auto_212715 ) ( not ( = ?auto_212708 ?auto_212715 ) ) ( not ( = ?auto_212709 ?auto_212715 ) ) ( not ( = ?auto_212710 ?auto_212715 ) ) ( not ( = ?auto_212711 ?auto_212715 ) ) ( not ( = ?auto_212712 ?auto_212715 ) ) ( not ( = ?auto_212713 ?auto_212715 ) ) ( not ( = ?auto_212714 ?auto_212715 ) ) ( not ( = ?auto_212716 ?auto_212715 ) ) ( ON ?auto_212709 ?auto_212708 ) ( CLEAR ?auto_212709 ) ( ON-TABLE ?auto_212715 ) ( HOLDING ?auto_212710 ) ( CLEAR ?auto_212711 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212716 ?auto_212714 ?auto_212713 ?auto_212712 ?auto_212711 ?auto_212710 )
      ( MAKE-7PILE ?auto_212708 ?auto_212709 ?auto_212710 ?auto_212711 ?auto_212712 ?auto_212713 ?auto_212714 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212717 - BLOCK
      ?auto_212718 - BLOCK
      ?auto_212719 - BLOCK
      ?auto_212720 - BLOCK
      ?auto_212721 - BLOCK
      ?auto_212722 - BLOCK
      ?auto_212723 - BLOCK
    )
    :vars
    (
      ?auto_212724 - BLOCK
      ?auto_212725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212717 ?auto_212718 ) ) ( not ( = ?auto_212717 ?auto_212719 ) ) ( not ( = ?auto_212717 ?auto_212720 ) ) ( not ( = ?auto_212717 ?auto_212721 ) ) ( not ( = ?auto_212717 ?auto_212722 ) ) ( not ( = ?auto_212717 ?auto_212723 ) ) ( not ( = ?auto_212718 ?auto_212719 ) ) ( not ( = ?auto_212718 ?auto_212720 ) ) ( not ( = ?auto_212718 ?auto_212721 ) ) ( not ( = ?auto_212718 ?auto_212722 ) ) ( not ( = ?auto_212718 ?auto_212723 ) ) ( not ( = ?auto_212719 ?auto_212720 ) ) ( not ( = ?auto_212719 ?auto_212721 ) ) ( not ( = ?auto_212719 ?auto_212722 ) ) ( not ( = ?auto_212719 ?auto_212723 ) ) ( not ( = ?auto_212720 ?auto_212721 ) ) ( not ( = ?auto_212720 ?auto_212722 ) ) ( not ( = ?auto_212720 ?auto_212723 ) ) ( not ( = ?auto_212721 ?auto_212722 ) ) ( not ( = ?auto_212721 ?auto_212723 ) ) ( not ( = ?auto_212722 ?auto_212723 ) ) ( ON ?auto_212723 ?auto_212724 ) ( not ( = ?auto_212717 ?auto_212724 ) ) ( not ( = ?auto_212718 ?auto_212724 ) ) ( not ( = ?auto_212719 ?auto_212724 ) ) ( not ( = ?auto_212720 ?auto_212724 ) ) ( not ( = ?auto_212721 ?auto_212724 ) ) ( not ( = ?auto_212722 ?auto_212724 ) ) ( not ( = ?auto_212723 ?auto_212724 ) ) ( ON ?auto_212722 ?auto_212723 ) ( ON-TABLE ?auto_212724 ) ( ON ?auto_212721 ?auto_212722 ) ( ON ?auto_212720 ?auto_212721 ) ( ON ?auto_212717 ?auto_212725 ) ( not ( = ?auto_212717 ?auto_212725 ) ) ( not ( = ?auto_212718 ?auto_212725 ) ) ( not ( = ?auto_212719 ?auto_212725 ) ) ( not ( = ?auto_212720 ?auto_212725 ) ) ( not ( = ?auto_212721 ?auto_212725 ) ) ( not ( = ?auto_212722 ?auto_212725 ) ) ( not ( = ?auto_212723 ?auto_212725 ) ) ( not ( = ?auto_212724 ?auto_212725 ) ) ( ON ?auto_212718 ?auto_212717 ) ( ON-TABLE ?auto_212725 ) ( CLEAR ?auto_212720 ) ( ON ?auto_212719 ?auto_212718 ) ( CLEAR ?auto_212719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212725 ?auto_212717 ?auto_212718 )
      ( MAKE-7PILE ?auto_212717 ?auto_212718 ?auto_212719 ?auto_212720 ?auto_212721 ?auto_212722 ?auto_212723 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212726 - BLOCK
      ?auto_212727 - BLOCK
      ?auto_212728 - BLOCK
      ?auto_212729 - BLOCK
      ?auto_212730 - BLOCK
      ?auto_212731 - BLOCK
      ?auto_212732 - BLOCK
    )
    :vars
    (
      ?auto_212734 - BLOCK
      ?auto_212733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212726 ?auto_212727 ) ) ( not ( = ?auto_212726 ?auto_212728 ) ) ( not ( = ?auto_212726 ?auto_212729 ) ) ( not ( = ?auto_212726 ?auto_212730 ) ) ( not ( = ?auto_212726 ?auto_212731 ) ) ( not ( = ?auto_212726 ?auto_212732 ) ) ( not ( = ?auto_212727 ?auto_212728 ) ) ( not ( = ?auto_212727 ?auto_212729 ) ) ( not ( = ?auto_212727 ?auto_212730 ) ) ( not ( = ?auto_212727 ?auto_212731 ) ) ( not ( = ?auto_212727 ?auto_212732 ) ) ( not ( = ?auto_212728 ?auto_212729 ) ) ( not ( = ?auto_212728 ?auto_212730 ) ) ( not ( = ?auto_212728 ?auto_212731 ) ) ( not ( = ?auto_212728 ?auto_212732 ) ) ( not ( = ?auto_212729 ?auto_212730 ) ) ( not ( = ?auto_212729 ?auto_212731 ) ) ( not ( = ?auto_212729 ?auto_212732 ) ) ( not ( = ?auto_212730 ?auto_212731 ) ) ( not ( = ?auto_212730 ?auto_212732 ) ) ( not ( = ?auto_212731 ?auto_212732 ) ) ( ON ?auto_212732 ?auto_212734 ) ( not ( = ?auto_212726 ?auto_212734 ) ) ( not ( = ?auto_212727 ?auto_212734 ) ) ( not ( = ?auto_212728 ?auto_212734 ) ) ( not ( = ?auto_212729 ?auto_212734 ) ) ( not ( = ?auto_212730 ?auto_212734 ) ) ( not ( = ?auto_212731 ?auto_212734 ) ) ( not ( = ?auto_212732 ?auto_212734 ) ) ( ON ?auto_212731 ?auto_212732 ) ( ON-TABLE ?auto_212734 ) ( ON ?auto_212730 ?auto_212731 ) ( ON ?auto_212726 ?auto_212733 ) ( not ( = ?auto_212726 ?auto_212733 ) ) ( not ( = ?auto_212727 ?auto_212733 ) ) ( not ( = ?auto_212728 ?auto_212733 ) ) ( not ( = ?auto_212729 ?auto_212733 ) ) ( not ( = ?auto_212730 ?auto_212733 ) ) ( not ( = ?auto_212731 ?auto_212733 ) ) ( not ( = ?auto_212732 ?auto_212733 ) ) ( not ( = ?auto_212734 ?auto_212733 ) ) ( ON ?auto_212727 ?auto_212726 ) ( ON-TABLE ?auto_212733 ) ( ON ?auto_212728 ?auto_212727 ) ( CLEAR ?auto_212728 ) ( HOLDING ?auto_212729 ) ( CLEAR ?auto_212730 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212734 ?auto_212732 ?auto_212731 ?auto_212730 ?auto_212729 )
      ( MAKE-7PILE ?auto_212726 ?auto_212727 ?auto_212728 ?auto_212729 ?auto_212730 ?auto_212731 ?auto_212732 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212735 - BLOCK
      ?auto_212736 - BLOCK
      ?auto_212737 - BLOCK
      ?auto_212738 - BLOCK
      ?auto_212739 - BLOCK
      ?auto_212740 - BLOCK
      ?auto_212741 - BLOCK
    )
    :vars
    (
      ?auto_212742 - BLOCK
      ?auto_212743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212735 ?auto_212736 ) ) ( not ( = ?auto_212735 ?auto_212737 ) ) ( not ( = ?auto_212735 ?auto_212738 ) ) ( not ( = ?auto_212735 ?auto_212739 ) ) ( not ( = ?auto_212735 ?auto_212740 ) ) ( not ( = ?auto_212735 ?auto_212741 ) ) ( not ( = ?auto_212736 ?auto_212737 ) ) ( not ( = ?auto_212736 ?auto_212738 ) ) ( not ( = ?auto_212736 ?auto_212739 ) ) ( not ( = ?auto_212736 ?auto_212740 ) ) ( not ( = ?auto_212736 ?auto_212741 ) ) ( not ( = ?auto_212737 ?auto_212738 ) ) ( not ( = ?auto_212737 ?auto_212739 ) ) ( not ( = ?auto_212737 ?auto_212740 ) ) ( not ( = ?auto_212737 ?auto_212741 ) ) ( not ( = ?auto_212738 ?auto_212739 ) ) ( not ( = ?auto_212738 ?auto_212740 ) ) ( not ( = ?auto_212738 ?auto_212741 ) ) ( not ( = ?auto_212739 ?auto_212740 ) ) ( not ( = ?auto_212739 ?auto_212741 ) ) ( not ( = ?auto_212740 ?auto_212741 ) ) ( ON ?auto_212741 ?auto_212742 ) ( not ( = ?auto_212735 ?auto_212742 ) ) ( not ( = ?auto_212736 ?auto_212742 ) ) ( not ( = ?auto_212737 ?auto_212742 ) ) ( not ( = ?auto_212738 ?auto_212742 ) ) ( not ( = ?auto_212739 ?auto_212742 ) ) ( not ( = ?auto_212740 ?auto_212742 ) ) ( not ( = ?auto_212741 ?auto_212742 ) ) ( ON ?auto_212740 ?auto_212741 ) ( ON-TABLE ?auto_212742 ) ( ON ?auto_212739 ?auto_212740 ) ( ON ?auto_212735 ?auto_212743 ) ( not ( = ?auto_212735 ?auto_212743 ) ) ( not ( = ?auto_212736 ?auto_212743 ) ) ( not ( = ?auto_212737 ?auto_212743 ) ) ( not ( = ?auto_212738 ?auto_212743 ) ) ( not ( = ?auto_212739 ?auto_212743 ) ) ( not ( = ?auto_212740 ?auto_212743 ) ) ( not ( = ?auto_212741 ?auto_212743 ) ) ( not ( = ?auto_212742 ?auto_212743 ) ) ( ON ?auto_212736 ?auto_212735 ) ( ON-TABLE ?auto_212743 ) ( ON ?auto_212737 ?auto_212736 ) ( CLEAR ?auto_212739 ) ( ON ?auto_212738 ?auto_212737 ) ( CLEAR ?auto_212738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212743 ?auto_212735 ?auto_212736 ?auto_212737 )
      ( MAKE-7PILE ?auto_212735 ?auto_212736 ?auto_212737 ?auto_212738 ?auto_212739 ?auto_212740 ?auto_212741 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212744 - BLOCK
      ?auto_212745 - BLOCK
      ?auto_212746 - BLOCK
      ?auto_212747 - BLOCK
      ?auto_212748 - BLOCK
      ?auto_212749 - BLOCK
      ?auto_212750 - BLOCK
    )
    :vars
    (
      ?auto_212752 - BLOCK
      ?auto_212751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212744 ?auto_212745 ) ) ( not ( = ?auto_212744 ?auto_212746 ) ) ( not ( = ?auto_212744 ?auto_212747 ) ) ( not ( = ?auto_212744 ?auto_212748 ) ) ( not ( = ?auto_212744 ?auto_212749 ) ) ( not ( = ?auto_212744 ?auto_212750 ) ) ( not ( = ?auto_212745 ?auto_212746 ) ) ( not ( = ?auto_212745 ?auto_212747 ) ) ( not ( = ?auto_212745 ?auto_212748 ) ) ( not ( = ?auto_212745 ?auto_212749 ) ) ( not ( = ?auto_212745 ?auto_212750 ) ) ( not ( = ?auto_212746 ?auto_212747 ) ) ( not ( = ?auto_212746 ?auto_212748 ) ) ( not ( = ?auto_212746 ?auto_212749 ) ) ( not ( = ?auto_212746 ?auto_212750 ) ) ( not ( = ?auto_212747 ?auto_212748 ) ) ( not ( = ?auto_212747 ?auto_212749 ) ) ( not ( = ?auto_212747 ?auto_212750 ) ) ( not ( = ?auto_212748 ?auto_212749 ) ) ( not ( = ?auto_212748 ?auto_212750 ) ) ( not ( = ?auto_212749 ?auto_212750 ) ) ( ON ?auto_212750 ?auto_212752 ) ( not ( = ?auto_212744 ?auto_212752 ) ) ( not ( = ?auto_212745 ?auto_212752 ) ) ( not ( = ?auto_212746 ?auto_212752 ) ) ( not ( = ?auto_212747 ?auto_212752 ) ) ( not ( = ?auto_212748 ?auto_212752 ) ) ( not ( = ?auto_212749 ?auto_212752 ) ) ( not ( = ?auto_212750 ?auto_212752 ) ) ( ON ?auto_212749 ?auto_212750 ) ( ON-TABLE ?auto_212752 ) ( ON ?auto_212744 ?auto_212751 ) ( not ( = ?auto_212744 ?auto_212751 ) ) ( not ( = ?auto_212745 ?auto_212751 ) ) ( not ( = ?auto_212746 ?auto_212751 ) ) ( not ( = ?auto_212747 ?auto_212751 ) ) ( not ( = ?auto_212748 ?auto_212751 ) ) ( not ( = ?auto_212749 ?auto_212751 ) ) ( not ( = ?auto_212750 ?auto_212751 ) ) ( not ( = ?auto_212752 ?auto_212751 ) ) ( ON ?auto_212745 ?auto_212744 ) ( ON-TABLE ?auto_212751 ) ( ON ?auto_212746 ?auto_212745 ) ( ON ?auto_212747 ?auto_212746 ) ( CLEAR ?auto_212747 ) ( HOLDING ?auto_212748 ) ( CLEAR ?auto_212749 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212752 ?auto_212750 ?auto_212749 ?auto_212748 )
      ( MAKE-7PILE ?auto_212744 ?auto_212745 ?auto_212746 ?auto_212747 ?auto_212748 ?auto_212749 ?auto_212750 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212753 - BLOCK
      ?auto_212754 - BLOCK
      ?auto_212755 - BLOCK
      ?auto_212756 - BLOCK
      ?auto_212757 - BLOCK
      ?auto_212758 - BLOCK
      ?auto_212759 - BLOCK
    )
    :vars
    (
      ?auto_212760 - BLOCK
      ?auto_212761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212753 ?auto_212754 ) ) ( not ( = ?auto_212753 ?auto_212755 ) ) ( not ( = ?auto_212753 ?auto_212756 ) ) ( not ( = ?auto_212753 ?auto_212757 ) ) ( not ( = ?auto_212753 ?auto_212758 ) ) ( not ( = ?auto_212753 ?auto_212759 ) ) ( not ( = ?auto_212754 ?auto_212755 ) ) ( not ( = ?auto_212754 ?auto_212756 ) ) ( not ( = ?auto_212754 ?auto_212757 ) ) ( not ( = ?auto_212754 ?auto_212758 ) ) ( not ( = ?auto_212754 ?auto_212759 ) ) ( not ( = ?auto_212755 ?auto_212756 ) ) ( not ( = ?auto_212755 ?auto_212757 ) ) ( not ( = ?auto_212755 ?auto_212758 ) ) ( not ( = ?auto_212755 ?auto_212759 ) ) ( not ( = ?auto_212756 ?auto_212757 ) ) ( not ( = ?auto_212756 ?auto_212758 ) ) ( not ( = ?auto_212756 ?auto_212759 ) ) ( not ( = ?auto_212757 ?auto_212758 ) ) ( not ( = ?auto_212757 ?auto_212759 ) ) ( not ( = ?auto_212758 ?auto_212759 ) ) ( ON ?auto_212759 ?auto_212760 ) ( not ( = ?auto_212753 ?auto_212760 ) ) ( not ( = ?auto_212754 ?auto_212760 ) ) ( not ( = ?auto_212755 ?auto_212760 ) ) ( not ( = ?auto_212756 ?auto_212760 ) ) ( not ( = ?auto_212757 ?auto_212760 ) ) ( not ( = ?auto_212758 ?auto_212760 ) ) ( not ( = ?auto_212759 ?auto_212760 ) ) ( ON ?auto_212758 ?auto_212759 ) ( ON-TABLE ?auto_212760 ) ( ON ?auto_212753 ?auto_212761 ) ( not ( = ?auto_212753 ?auto_212761 ) ) ( not ( = ?auto_212754 ?auto_212761 ) ) ( not ( = ?auto_212755 ?auto_212761 ) ) ( not ( = ?auto_212756 ?auto_212761 ) ) ( not ( = ?auto_212757 ?auto_212761 ) ) ( not ( = ?auto_212758 ?auto_212761 ) ) ( not ( = ?auto_212759 ?auto_212761 ) ) ( not ( = ?auto_212760 ?auto_212761 ) ) ( ON ?auto_212754 ?auto_212753 ) ( ON-TABLE ?auto_212761 ) ( ON ?auto_212755 ?auto_212754 ) ( ON ?auto_212756 ?auto_212755 ) ( CLEAR ?auto_212758 ) ( ON ?auto_212757 ?auto_212756 ) ( CLEAR ?auto_212757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212761 ?auto_212753 ?auto_212754 ?auto_212755 ?auto_212756 )
      ( MAKE-7PILE ?auto_212753 ?auto_212754 ?auto_212755 ?auto_212756 ?auto_212757 ?auto_212758 ?auto_212759 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212762 - BLOCK
      ?auto_212763 - BLOCK
      ?auto_212764 - BLOCK
      ?auto_212765 - BLOCK
      ?auto_212766 - BLOCK
      ?auto_212767 - BLOCK
      ?auto_212768 - BLOCK
    )
    :vars
    (
      ?auto_212769 - BLOCK
      ?auto_212770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212762 ?auto_212763 ) ) ( not ( = ?auto_212762 ?auto_212764 ) ) ( not ( = ?auto_212762 ?auto_212765 ) ) ( not ( = ?auto_212762 ?auto_212766 ) ) ( not ( = ?auto_212762 ?auto_212767 ) ) ( not ( = ?auto_212762 ?auto_212768 ) ) ( not ( = ?auto_212763 ?auto_212764 ) ) ( not ( = ?auto_212763 ?auto_212765 ) ) ( not ( = ?auto_212763 ?auto_212766 ) ) ( not ( = ?auto_212763 ?auto_212767 ) ) ( not ( = ?auto_212763 ?auto_212768 ) ) ( not ( = ?auto_212764 ?auto_212765 ) ) ( not ( = ?auto_212764 ?auto_212766 ) ) ( not ( = ?auto_212764 ?auto_212767 ) ) ( not ( = ?auto_212764 ?auto_212768 ) ) ( not ( = ?auto_212765 ?auto_212766 ) ) ( not ( = ?auto_212765 ?auto_212767 ) ) ( not ( = ?auto_212765 ?auto_212768 ) ) ( not ( = ?auto_212766 ?auto_212767 ) ) ( not ( = ?auto_212766 ?auto_212768 ) ) ( not ( = ?auto_212767 ?auto_212768 ) ) ( ON ?auto_212768 ?auto_212769 ) ( not ( = ?auto_212762 ?auto_212769 ) ) ( not ( = ?auto_212763 ?auto_212769 ) ) ( not ( = ?auto_212764 ?auto_212769 ) ) ( not ( = ?auto_212765 ?auto_212769 ) ) ( not ( = ?auto_212766 ?auto_212769 ) ) ( not ( = ?auto_212767 ?auto_212769 ) ) ( not ( = ?auto_212768 ?auto_212769 ) ) ( ON-TABLE ?auto_212769 ) ( ON ?auto_212762 ?auto_212770 ) ( not ( = ?auto_212762 ?auto_212770 ) ) ( not ( = ?auto_212763 ?auto_212770 ) ) ( not ( = ?auto_212764 ?auto_212770 ) ) ( not ( = ?auto_212765 ?auto_212770 ) ) ( not ( = ?auto_212766 ?auto_212770 ) ) ( not ( = ?auto_212767 ?auto_212770 ) ) ( not ( = ?auto_212768 ?auto_212770 ) ) ( not ( = ?auto_212769 ?auto_212770 ) ) ( ON ?auto_212763 ?auto_212762 ) ( ON-TABLE ?auto_212770 ) ( ON ?auto_212764 ?auto_212763 ) ( ON ?auto_212765 ?auto_212764 ) ( ON ?auto_212766 ?auto_212765 ) ( CLEAR ?auto_212766 ) ( HOLDING ?auto_212767 ) ( CLEAR ?auto_212768 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212769 ?auto_212768 ?auto_212767 )
      ( MAKE-7PILE ?auto_212762 ?auto_212763 ?auto_212764 ?auto_212765 ?auto_212766 ?auto_212767 ?auto_212768 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212771 - BLOCK
      ?auto_212772 - BLOCK
      ?auto_212773 - BLOCK
      ?auto_212774 - BLOCK
      ?auto_212775 - BLOCK
      ?auto_212776 - BLOCK
      ?auto_212777 - BLOCK
    )
    :vars
    (
      ?auto_212778 - BLOCK
      ?auto_212779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212771 ?auto_212772 ) ) ( not ( = ?auto_212771 ?auto_212773 ) ) ( not ( = ?auto_212771 ?auto_212774 ) ) ( not ( = ?auto_212771 ?auto_212775 ) ) ( not ( = ?auto_212771 ?auto_212776 ) ) ( not ( = ?auto_212771 ?auto_212777 ) ) ( not ( = ?auto_212772 ?auto_212773 ) ) ( not ( = ?auto_212772 ?auto_212774 ) ) ( not ( = ?auto_212772 ?auto_212775 ) ) ( not ( = ?auto_212772 ?auto_212776 ) ) ( not ( = ?auto_212772 ?auto_212777 ) ) ( not ( = ?auto_212773 ?auto_212774 ) ) ( not ( = ?auto_212773 ?auto_212775 ) ) ( not ( = ?auto_212773 ?auto_212776 ) ) ( not ( = ?auto_212773 ?auto_212777 ) ) ( not ( = ?auto_212774 ?auto_212775 ) ) ( not ( = ?auto_212774 ?auto_212776 ) ) ( not ( = ?auto_212774 ?auto_212777 ) ) ( not ( = ?auto_212775 ?auto_212776 ) ) ( not ( = ?auto_212775 ?auto_212777 ) ) ( not ( = ?auto_212776 ?auto_212777 ) ) ( ON ?auto_212777 ?auto_212778 ) ( not ( = ?auto_212771 ?auto_212778 ) ) ( not ( = ?auto_212772 ?auto_212778 ) ) ( not ( = ?auto_212773 ?auto_212778 ) ) ( not ( = ?auto_212774 ?auto_212778 ) ) ( not ( = ?auto_212775 ?auto_212778 ) ) ( not ( = ?auto_212776 ?auto_212778 ) ) ( not ( = ?auto_212777 ?auto_212778 ) ) ( ON-TABLE ?auto_212778 ) ( ON ?auto_212771 ?auto_212779 ) ( not ( = ?auto_212771 ?auto_212779 ) ) ( not ( = ?auto_212772 ?auto_212779 ) ) ( not ( = ?auto_212773 ?auto_212779 ) ) ( not ( = ?auto_212774 ?auto_212779 ) ) ( not ( = ?auto_212775 ?auto_212779 ) ) ( not ( = ?auto_212776 ?auto_212779 ) ) ( not ( = ?auto_212777 ?auto_212779 ) ) ( not ( = ?auto_212778 ?auto_212779 ) ) ( ON ?auto_212772 ?auto_212771 ) ( ON-TABLE ?auto_212779 ) ( ON ?auto_212773 ?auto_212772 ) ( ON ?auto_212774 ?auto_212773 ) ( ON ?auto_212775 ?auto_212774 ) ( CLEAR ?auto_212777 ) ( ON ?auto_212776 ?auto_212775 ) ( CLEAR ?auto_212776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212779 ?auto_212771 ?auto_212772 ?auto_212773 ?auto_212774 ?auto_212775 )
      ( MAKE-7PILE ?auto_212771 ?auto_212772 ?auto_212773 ?auto_212774 ?auto_212775 ?auto_212776 ?auto_212777 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212780 - BLOCK
      ?auto_212781 - BLOCK
      ?auto_212782 - BLOCK
      ?auto_212783 - BLOCK
      ?auto_212784 - BLOCK
      ?auto_212785 - BLOCK
      ?auto_212786 - BLOCK
    )
    :vars
    (
      ?auto_212788 - BLOCK
      ?auto_212787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212780 ?auto_212781 ) ) ( not ( = ?auto_212780 ?auto_212782 ) ) ( not ( = ?auto_212780 ?auto_212783 ) ) ( not ( = ?auto_212780 ?auto_212784 ) ) ( not ( = ?auto_212780 ?auto_212785 ) ) ( not ( = ?auto_212780 ?auto_212786 ) ) ( not ( = ?auto_212781 ?auto_212782 ) ) ( not ( = ?auto_212781 ?auto_212783 ) ) ( not ( = ?auto_212781 ?auto_212784 ) ) ( not ( = ?auto_212781 ?auto_212785 ) ) ( not ( = ?auto_212781 ?auto_212786 ) ) ( not ( = ?auto_212782 ?auto_212783 ) ) ( not ( = ?auto_212782 ?auto_212784 ) ) ( not ( = ?auto_212782 ?auto_212785 ) ) ( not ( = ?auto_212782 ?auto_212786 ) ) ( not ( = ?auto_212783 ?auto_212784 ) ) ( not ( = ?auto_212783 ?auto_212785 ) ) ( not ( = ?auto_212783 ?auto_212786 ) ) ( not ( = ?auto_212784 ?auto_212785 ) ) ( not ( = ?auto_212784 ?auto_212786 ) ) ( not ( = ?auto_212785 ?auto_212786 ) ) ( not ( = ?auto_212780 ?auto_212788 ) ) ( not ( = ?auto_212781 ?auto_212788 ) ) ( not ( = ?auto_212782 ?auto_212788 ) ) ( not ( = ?auto_212783 ?auto_212788 ) ) ( not ( = ?auto_212784 ?auto_212788 ) ) ( not ( = ?auto_212785 ?auto_212788 ) ) ( not ( = ?auto_212786 ?auto_212788 ) ) ( ON-TABLE ?auto_212788 ) ( ON ?auto_212780 ?auto_212787 ) ( not ( = ?auto_212780 ?auto_212787 ) ) ( not ( = ?auto_212781 ?auto_212787 ) ) ( not ( = ?auto_212782 ?auto_212787 ) ) ( not ( = ?auto_212783 ?auto_212787 ) ) ( not ( = ?auto_212784 ?auto_212787 ) ) ( not ( = ?auto_212785 ?auto_212787 ) ) ( not ( = ?auto_212786 ?auto_212787 ) ) ( not ( = ?auto_212788 ?auto_212787 ) ) ( ON ?auto_212781 ?auto_212780 ) ( ON-TABLE ?auto_212787 ) ( ON ?auto_212782 ?auto_212781 ) ( ON ?auto_212783 ?auto_212782 ) ( ON ?auto_212784 ?auto_212783 ) ( ON ?auto_212785 ?auto_212784 ) ( CLEAR ?auto_212785 ) ( HOLDING ?auto_212786 ) ( CLEAR ?auto_212788 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212788 ?auto_212786 )
      ( MAKE-7PILE ?auto_212780 ?auto_212781 ?auto_212782 ?auto_212783 ?auto_212784 ?auto_212785 ?auto_212786 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212789 - BLOCK
      ?auto_212790 - BLOCK
      ?auto_212791 - BLOCK
      ?auto_212792 - BLOCK
      ?auto_212793 - BLOCK
      ?auto_212794 - BLOCK
      ?auto_212795 - BLOCK
    )
    :vars
    (
      ?auto_212797 - BLOCK
      ?auto_212796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212789 ?auto_212790 ) ) ( not ( = ?auto_212789 ?auto_212791 ) ) ( not ( = ?auto_212789 ?auto_212792 ) ) ( not ( = ?auto_212789 ?auto_212793 ) ) ( not ( = ?auto_212789 ?auto_212794 ) ) ( not ( = ?auto_212789 ?auto_212795 ) ) ( not ( = ?auto_212790 ?auto_212791 ) ) ( not ( = ?auto_212790 ?auto_212792 ) ) ( not ( = ?auto_212790 ?auto_212793 ) ) ( not ( = ?auto_212790 ?auto_212794 ) ) ( not ( = ?auto_212790 ?auto_212795 ) ) ( not ( = ?auto_212791 ?auto_212792 ) ) ( not ( = ?auto_212791 ?auto_212793 ) ) ( not ( = ?auto_212791 ?auto_212794 ) ) ( not ( = ?auto_212791 ?auto_212795 ) ) ( not ( = ?auto_212792 ?auto_212793 ) ) ( not ( = ?auto_212792 ?auto_212794 ) ) ( not ( = ?auto_212792 ?auto_212795 ) ) ( not ( = ?auto_212793 ?auto_212794 ) ) ( not ( = ?auto_212793 ?auto_212795 ) ) ( not ( = ?auto_212794 ?auto_212795 ) ) ( not ( = ?auto_212789 ?auto_212797 ) ) ( not ( = ?auto_212790 ?auto_212797 ) ) ( not ( = ?auto_212791 ?auto_212797 ) ) ( not ( = ?auto_212792 ?auto_212797 ) ) ( not ( = ?auto_212793 ?auto_212797 ) ) ( not ( = ?auto_212794 ?auto_212797 ) ) ( not ( = ?auto_212795 ?auto_212797 ) ) ( ON-TABLE ?auto_212797 ) ( ON ?auto_212789 ?auto_212796 ) ( not ( = ?auto_212789 ?auto_212796 ) ) ( not ( = ?auto_212790 ?auto_212796 ) ) ( not ( = ?auto_212791 ?auto_212796 ) ) ( not ( = ?auto_212792 ?auto_212796 ) ) ( not ( = ?auto_212793 ?auto_212796 ) ) ( not ( = ?auto_212794 ?auto_212796 ) ) ( not ( = ?auto_212795 ?auto_212796 ) ) ( not ( = ?auto_212797 ?auto_212796 ) ) ( ON ?auto_212790 ?auto_212789 ) ( ON-TABLE ?auto_212796 ) ( ON ?auto_212791 ?auto_212790 ) ( ON ?auto_212792 ?auto_212791 ) ( ON ?auto_212793 ?auto_212792 ) ( ON ?auto_212794 ?auto_212793 ) ( CLEAR ?auto_212797 ) ( ON ?auto_212795 ?auto_212794 ) ( CLEAR ?auto_212795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212796 ?auto_212789 ?auto_212790 ?auto_212791 ?auto_212792 ?auto_212793 ?auto_212794 )
      ( MAKE-7PILE ?auto_212789 ?auto_212790 ?auto_212791 ?auto_212792 ?auto_212793 ?auto_212794 ?auto_212795 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212798 - BLOCK
      ?auto_212799 - BLOCK
      ?auto_212800 - BLOCK
      ?auto_212801 - BLOCK
      ?auto_212802 - BLOCK
      ?auto_212803 - BLOCK
      ?auto_212804 - BLOCK
    )
    :vars
    (
      ?auto_212806 - BLOCK
      ?auto_212805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212798 ?auto_212799 ) ) ( not ( = ?auto_212798 ?auto_212800 ) ) ( not ( = ?auto_212798 ?auto_212801 ) ) ( not ( = ?auto_212798 ?auto_212802 ) ) ( not ( = ?auto_212798 ?auto_212803 ) ) ( not ( = ?auto_212798 ?auto_212804 ) ) ( not ( = ?auto_212799 ?auto_212800 ) ) ( not ( = ?auto_212799 ?auto_212801 ) ) ( not ( = ?auto_212799 ?auto_212802 ) ) ( not ( = ?auto_212799 ?auto_212803 ) ) ( not ( = ?auto_212799 ?auto_212804 ) ) ( not ( = ?auto_212800 ?auto_212801 ) ) ( not ( = ?auto_212800 ?auto_212802 ) ) ( not ( = ?auto_212800 ?auto_212803 ) ) ( not ( = ?auto_212800 ?auto_212804 ) ) ( not ( = ?auto_212801 ?auto_212802 ) ) ( not ( = ?auto_212801 ?auto_212803 ) ) ( not ( = ?auto_212801 ?auto_212804 ) ) ( not ( = ?auto_212802 ?auto_212803 ) ) ( not ( = ?auto_212802 ?auto_212804 ) ) ( not ( = ?auto_212803 ?auto_212804 ) ) ( not ( = ?auto_212798 ?auto_212806 ) ) ( not ( = ?auto_212799 ?auto_212806 ) ) ( not ( = ?auto_212800 ?auto_212806 ) ) ( not ( = ?auto_212801 ?auto_212806 ) ) ( not ( = ?auto_212802 ?auto_212806 ) ) ( not ( = ?auto_212803 ?auto_212806 ) ) ( not ( = ?auto_212804 ?auto_212806 ) ) ( ON ?auto_212798 ?auto_212805 ) ( not ( = ?auto_212798 ?auto_212805 ) ) ( not ( = ?auto_212799 ?auto_212805 ) ) ( not ( = ?auto_212800 ?auto_212805 ) ) ( not ( = ?auto_212801 ?auto_212805 ) ) ( not ( = ?auto_212802 ?auto_212805 ) ) ( not ( = ?auto_212803 ?auto_212805 ) ) ( not ( = ?auto_212804 ?auto_212805 ) ) ( not ( = ?auto_212806 ?auto_212805 ) ) ( ON ?auto_212799 ?auto_212798 ) ( ON-TABLE ?auto_212805 ) ( ON ?auto_212800 ?auto_212799 ) ( ON ?auto_212801 ?auto_212800 ) ( ON ?auto_212802 ?auto_212801 ) ( ON ?auto_212803 ?auto_212802 ) ( ON ?auto_212804 ?auto_212803 ) ( CLEAR ?auto_212804 ) ( HOLDING ?auto_212806 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212806 )
      ( MAKE-7PILE ?auto_212798 ?auto_212799 ?auto_212800 ?auto_212801 ?auto_212802 ?auto_212803 ?auto_212804 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212807 - BLOCK
      ?auto_212808 - BLOCK
      ?auto_212809 - BLOCK
      ?auto_212810 - BLOCK
      ?auto_212811 - BLOCK
      ?auto_212812 - BLOCK
      ?auto_212813 - BLOCK
    )
    :vars
    (
      ?auto_212815 - BLOCK
      ?auto_212814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212807 ?auto_212808 ) ) ( not ( = ?auto_212807 ?auto_212809 ) ) ( not ( = ?auto_212807 ?auto_212810 ) ) ( not ( = ?auto_212807 ?auto_212811 ) ) ( not ( = ?auto_212807 ?auto_212812 ) ) ( not ( = ?auto_212807 ?auto_212813 ) ) ( not ( = ?auto_212808 ?auto_212809 ) ) ( not ( = ?auto_212808 ?auto_212810 ) ) ( not ( = ?auto_212808 ?auto_212811 ) ) ( not ( = ?auto_212808 ?auto_212812 ) ) ( not ( = ?auto_212808 ?auto_212813 ) ) ( not ( = ?auto_212809 ?auto_212810 ) ) ( not ( = ?auto_212809 ?auto_212811 ) ) ( not ( = ?auto_212809 ?auto_212812 ) ) ( not ( = ?auto_212809 ?auto_212813 ) ) ( not ( = ?auto_212810 ?auto_212811 ) ) ( not ( = ?auto_212810 ?auto_212812 ) ) ( not ( = ?auto_212810 ?auto_212813 ) ) ( not ( = ?auto_212811 ?auto_212812 ) ) ( not ( = ?auto_212811 ?auto_212813 ) ) ( not ( = ?auto_212812 ?auto_212813 ) ) ( not ( = ?auto_212807 ?auto_212815 ) ) ( not ( = ?auto_212808 ?auto_212815 ) ) ( not ( = ?auto_212809 ?auto_212815 ) ) ( not ( = ?auto_212810 ?auto_212815 ) ) ( not ( = ?auto_212811 ?auto_212815 ) ) ( not ( = ?auto_212812 ?auto_212815 ) ) ( not ( = ?auto_212813 ?auto_212815 ) ) ( ON ?auto_212807 ?auto_212814 ) ( not ( = ?auto_212807 ?auto_212814 ) ) ( not ( = ?auto_212808 ?auto_212814 ) ) ( not ( = ?auto_212809 ?auto_212814 ) ) ( not ( = ?auto_212810 ?auto_212814 ) ) ( not ( = ?auto_212811 ?auto_212814 ) ) ( not ( = ?auto_212812 ?auto_212814 ) ) ( not ( = ?auto_212813 ?auto_212814 ) ) ( not ( = ?auto_212815 ?auto_212814 ) ) ( ON ?auto_212808 ?auto_212807 ) ( ON-TABLE ?auto_212814 ) ( ON ?auto_212809 ?auto_212808 ) ( ON ?auto_212810 ?auto_212809 ) ( ON ?auto_212811 ?auto_212810 ) ( ON ?auto_212812 ?auto_212811 ) ( ON ?auto_212813 ?auto_212812 ) ( ON ?auto_212815 ?auto_212813 ) ( CLEAR ?auto_212815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_212814 ?auto_212807 ?auto_212808 ?auto_212809 ?auto_212810 ?auto_212811 ?auto_212812 ?auto_212813 )
      ( MAKE-7PILE ?auto_212807 ?auto_212808 ?auto_212809 ?auto_212810 ?auto_212811 ?auto_212812 ?auto_212813 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212824 - BLOCK
      ?auto_212825 - BLOCK
      ?auto_212826 - BLOCK
      ?auto_212827 - BLOCK
      ?auto_212828 - BLOCK
      ?auto_212829 - BLOCK
      ?auto_212830 - BLOCK
      ?auto_212831 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_212831 ) ( CLEAR ?auto_212830 ) ( ON-TABLE ?auto_212824 ) ( ON ?auto_212825 ?auto_212824 ) ( ON ?auto_212826 ?auto_212825 ) ( ON ?auto_212827 ?auto_212826 ) ( ON ?auto_212828 ?auto_212827 ) ( ON ?auto_212829 ?auto_212828 ) ( ON ?auto_212830 ?auto_212829 ) ( not ( = ?auto_212824 ?auto_212825 ) ) ( not ( = ?auto_212824 ?auto_212826 ) ) ( not ( = ?auto_212824 ?auto_212827 ) ) ( not ( = ?auto_212824 ?auto_212828 ) ) ( not ( = ?auto_212824 ?auto_212829 ) ) ( not ( = ?auto_212824 ?auto_212830 ) ) ( not ( = ?auto_212824 ?auto_212831 ) ) ( not ( = ?auto_212825 ?auto_212826 ) ) ( not ( = ?auto_212825 ?auto_212827 ) ) ( not ( = ?auto_212825 ?auto_212828 ) ) ( not ( = ?auto_212825 ?auto_212829 ) ) ( not ( = ?auto_212825 ?auto_212830 ) ) ( not ( = ?auto_212825 ?auto_212831 ) ) ( not ( = ?auto_212826 ?auto_212827 ) ) ( not ( = ?auto_212826 ?auto_212828 ) ) ( not ( = ?auto_212826 ?auto_212829 ) ) ( not ( = ?auto_212826 ?auto_212830 ) ) ( not ( = ?auto_212826 ?auto_212831 ) ) ( not ( = ?auto_212827 ?auto_212828 ) ) ( not ( = ?auto_212827 ?auto_212829 ) ) ( not ( = ?auto_212827 ?auto_212830 ) ) ( not ( = ?auto_212827 ?auto_212831 ) ) ( not ( = ?auto_212828 ?auto_212829 ) ) ( not ( = ?auto_212828 ?auto_212830 ) ) ( not ( = ?auto_212828 ?auto_212831 ) ) ( not ( = ?auto_212829 ?auto_212830 ) ) ( not ( = ?auto_212829 ?auto_212831 ) ) ( not ( = ?auto_212830 ?auto_212831 ) ) )
    :subtasks
    ( ( !STACK ?auto_212831 ?auto_212830 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212832 - BLOCK
      ?auto_212833 - BLOCK
      ?auto_212834 - BLOCK
      ?auto_212835 - BLOCK
      ?auto_212836 - BLOCK
      ?auto_212837 - BLOCK
      ?auto_212838 - BLOCK
      ?auto_212839 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212838 ) ( ON-TABLE ?auto_212832 ) ( ON ?auto_212833 ?auto_212832 ) ( ON ?auto_212834 ?auto_212833 ) ( ON ?auto_212835 ?auto_212834 ) ( ON ?auto_212836 ?auto_212835 ) ( ON ?auto_212837 ?auto_212836 ) ( ON ?auto_212838 ?auto_212837 ) ( not ( = ?auto_212832 ?auto_212833 ) ) ( not ( = ?auto_212832 ?auto_212834 ) ) ( not ( = ?auto_212832 ?auto_212835 ) ) ( not ( = ?auto_212832 ?auto_212836 ) ) ( not ( = ?auto_212832 ?auto_212837 ) ) ( not ( = ?auto_212832 ?auto_212838 ) ) ( not ( = ?auto_212832 ?auto_212839 ) ) ( not ( = ?auto_212833 ?auto_212834 ) ) ( not ( = ?auto_212833 ?auto_212835 ) ) ( not ( = ?auto_212833 ?auto_212836 ) ) ( not ( = ?auto_212833 ?auto_212837 ) ) ( not ( = ?auto_212833 ?auto_212838 ) ) ( not ( = ?auto_212833 ?auto_212839 ) ) ( not ( = ?auto_212834 ?auto_212835 ) ) ( not ( = ?auto_212834 ?auto_212836 ) ) ( not ( = ?auto_212834 ?auto_212837 ) ) ( not ( = ?auto_212834 ?auto_212838 ) ) ( not ( = ?auto_212834 ?auto_212839 ) ) ( not ( = ?auto_212835 ?auto_212836 ) ) ( not ( = ?auto_212835 ?auto_212837 ) ) ( not ( = ?auto_212835 ?auto_212838 ) ) ( not ( = ?auto_212835 ?auto_212839 ) ) ( not ( = ?auto_212836 ?auto_212837 ) ) ( not ( = ?auto_212836 ?auto_212838 ) ) ( not ( = ?auto_212836 ?auto_212839 ) ) ( not ( = ?auto_212837 ?auto_212838 ) ) ( not ( = ?auto_212837 ?auto_212839 ) ) ( not ( = ?auto_212838 ?auto_212839 ) ) ( ON-TABLE ?auto_212839 ) ( CLEAR ?auto_212839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_212839 )
      ( MAKE-8PILE ?auto_212832 ?auto_212833 ?auto_212834 ?auto_212835 ?auto_212836 ?auto_212837 ?auto_212838 ?auto_212839 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212840 - BLOCK
      ?auto_212841 - BLOCK
      ?auto_212842 - BLOCK
      ?auto_212843 - BLOCK
      ?auto_212844 - BLOCK
      ?auto_212845 - BLOCK
      ?auto_212846 - BLOCK
      ?auto_212847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212840 ) ( ON ?auto_212841 ?auto_212840 ) ( ON ?auto_212842 ?auto_212841 ) ( ON ?auto_212843 ?auto_212842 ) ( ON ?auto_212844 ?auto_212843 ) ( ON ?auto_212845 ?auto_212844 ) ( not ( = ?auto_212840 ?auto_212841 ) ) ( not ( = ?auto_212840 ?auto_212842 ) ) ( not ( = ?auto_212840 ?auto_212843 ) ) ( not ( = ?auto_212840 ?auto_212844 ) ) ( not ( = ?auto_212840 ?auto_212845 ) ) ( not ( = ?auto_212840 ?auto_212846 ) ) ( not ( = ?auto_212840 ?auto_212847 ) ) ( not ( = ?auto_212841 ?auto_212842 ) ) ( not ( = ?auto_212841 ?auto_212843 ) ) ( not ( = ?auto_212841 ?auto_212844 ) ) ( not ( = ?auto_212841 ?auto_212845 ) ) ( not ( = ?auto_212841 ?auto_212846 ) ) ( not ( = ?auto_212841 ?auto_212847 ) ) ( not ( = ?auto_212842 ?auto_212843 ) ) ( not ( = ?auto_212842 ?auto_212844 ) ) ( not ( = ?auto_212842 ?auto_212845 ) ) ( not ( = ?auto_212842 ?auto_212846 ) ) ( not ( = ?auto_212842 ?auto_212847 ) ) ( not ( = ?auto_212843 ?auto_212844 ) ) ( not ( = ?auto_212843 ?auto_212845 ) ) ( not ( = ?auto_212843 ?auto_212846 ) ) ( not ( = ?auto_212843 ?auto_212847 ) ) ( not ( = ?auto_212844 ?auto_212845 ) ) ( not ( = ?auto_212844 ?auto_212846 ) ) ( not ( = ?auto_212844 ?auto_212847 ) ) ( not ( = ?auto_212845 ?auto_212846 ) ) ( not ( = ?auto_212845 ?auto_212847 ) ) ( not ( = ?auto_212846 ?auto_212847 ) ) ( ON-TABLE ?auto_212847 ) ( CLEAR ?auto_212847 ) ( HOLDING ?auto_212846 ) ( CLEAR ?auto_212845 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212840 ?auto_212841 ?auto_212842 ?auto_212843 ?auto_212844 ?auto_212845 ?auto_212846 )
      ( MAKE-8PILE ?auto_212840 ?auto_212841 ?auto_212842 ?auto_212843 ?auto_212844 ?auto_212845 ?auto_212846 ?auto_212847 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212848 - BLOCK
      ?auto_212849 - BLOCK
      ?auto_212850 - BLOCK
      ?auto_212851 - BLOCK
      ?auto_212852 - BLOCK
      ?auto_212853 - BLOCK
      ?auto_212854 - BLOCK
      ?auto_212855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212848 ) ( ON ?auto_212849 ?auto_212848 ) ( ON ?auto_212850 ?auto_212849 ) ( ON ?auto_212851 ?auto_212850 ) ( ON ?auto_212852 ?auto_212851 ) ( ON ?auto_212853 ?auto_212852 ) ( not ( = ?auto_212848 ?auto_212849 ) ) ( not ( = ?auto_212848 ?auto_212850 ) ) ( not ( = ?auto_212848 ?auto_212851 ) ) ( not ( = ?auto_212848 ?auto_212852 ) ) ( not ( = ?auto_212848 ?auto_212853 ) ) ( not ( = ?auto_212848 ?auto_212854 ) ) ( not ( = ?auto_212848 ?auto_212855 ) ) ( not ( = ?auto_212849 ?auto_212850 ) ) ( not ( = ?auto_212849 ?auto_212851 ) ) ( not ( = ?auto_212849 ?auto_212852 ) ) ( not ( = ?auto_212849 ?auto_212853 ) ) ( not ( = ?auto_212849 ?auto_212854 ) ) ( not ( = ?auto_212849 ?auto_212855 ) ) ( not ( = ?auto_212850 ?auto_212851 ) ) ( not ( = ?auto_212850 ?auto_212852 ) ) ( not ( = ?auto_212850 ?auto_212853 ) ) ( not ( = ?auto_212850 ?auto_212854 ) ) ( not ( = ?auto_212850 ?auto_212855 ) ) ( not ( = ?auto_212851 ?auto_212852 ) ) ( not ( = ?auto_212851 ?auto_212853 ) ) ( not ( = ?auto_212851 ?auto_212854 ) ) ( not ( = ?auto_212851 ?auto_212855 ) ) ( not ( = ?auto_212852 ?auto_212853 ) ) ( not ( = ?auto_212852 ?auto_212854 ) ) ( not ( = ?auto_212852 ?auto_212855 ) ) ( not ( = ?auto_212853 ?auto_212854 ) ) ( not ( = ?auto_212853 ?auto_212855 ) ) ( not ( = ?auto_212854 ?auto_212855 ) ) ( ON-TABLE ?auto_212855 ) ( CLEAR ?auto_212853 ) ( ON ?auto_212854 ?auto_212855 ) ( CLEAR ?auto_212854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212855 )
      ( MAKE-8PILE ?auto_212848 ?auto_212849 ?auto_212850 ?auto_212851 ?auto_212852 ?auto_212853 ?auto_212854 ?auto_212855 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212856 - BLOCK
      ?auto_212857 - BLOCK
      ?auto_212858 - BLOCK
      ?auto_212859 - BLOCK
      ?auto_212860 - BLOCK
      ?auto_212861 - BLOCK
      ?auto_212862 - BLOCK
      ?auto_212863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212856 ) ( ON ?auto_212857 ?auto_212856 ) ( ON ?auto_212858 ?auto_212857 ) ( ON ?auto_212859 ?auto_212858 ) ( ON ?auto_212860 ?auto_212859 ) ( not ( = ?auto_212856 ?auto_212857 ) ) ( not ( = ?auto_212856 ?auto_212858 ) ) ( not ( = ?auto_212856 ?auto_212859 ) ) ( not ( = ?auto_212856 ?auto_212860 ) ) ( not ( = ?auto_212856 ?auto_212861 ) ) ( not ( = ?auto_212856 ?auto_212862 ) ) ( not ( = ?auto_212856 ?auto_212863 ) ) ( not ( = ?auto_212857 ?auto_212858 ) ) ( not ( = ?auto_212857 ?auto_212859 ) ) ( not ( = ?auto_212857 ?auto_212860 ) ) ( not ( = ?auto_212857 ?auto_212861 ) ) ( not ( = ?auto_212857 ?auto_212862 ) ) ( not ( = ?auto_212857 ?auto_212863 ) ) ( not ( = ?auto_212858 ?auto_212859 ) ) ( not ( = ?auto_212858 ?auto_212860 ) ) ( not ( = ?auto_212858 ?auto_212861 ) ) ( not ( = ?auto_212858 ?auto_212862 ) ) ( not ( = ?auto_212858 ?auto_212863 ) ) ( not ( = ?auto_212859 ?auto_212860 ) ) ( not ( = ?auto_212859 ?auto_212861 ) ) ( not ( = ?auto_212859 ?auto_212862 ) ) ( not ( = ?auto_212859 ?auto_212863 ) ) ( not ( = ?auto_212860 ?auto_212861 ) ) ( not ( = ?auto_212860 ?auto_212862 ) ) ( not ( = ?auto_212860 ?auto_212863 ) ) ( not ( = ?auto_212861 ?auto_212862 ) ) ( not ( = ?auto_212861 ?auto_212863 ) ) ( not ( = ?auto_212862 ?auto_212863 ) ) ( ON-TABLE ?auto_212863 ) ( ON ?auto_212862 ?auto_212863 ) ( CLEAR ?auto_212862 ) ( HOLDING ?auto_212861 ) ( CLEAR ?auto_212860 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212856 ?auto_212857 ?auto_212858 ?auto_212859 ?auto_212860 ?auto_212861 )
      ( MAKE-8PILE ?auto_212856 ?auto_212857 ?auto_212858 ?auto_212859 ?auto_212860 ?auto_212861 ?auto_212862 ?auto_212863 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212864 - BLOCK
      ?auto_212865 - BLOCK
      ?auto_212866 - BLOCK
      ?auto_212867 - BLOCK
      ?auto_212868 - BLOCK
      ?auto_212869 - BLOCK
      ?auto_212870 - BLOCK
      ?auto_212871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212864 ) ( ON ?auto_212865 ?auto_212864 ) ( ON ?auto_212866 ?auto_212865 ) ( ON ?auto_212867 ?auto_212866 ) ( ON ?auto_212868 ?auto_212867 ) ( not ( = ?auto_212864 ?auto_212865 ) ) ( not ( = ?auto_212864 ?auto_212866 ) ) ( not ( = ?auto_212864 ?auto_212867 ) ) ( not ( = ?auto_212864 ?auto_212868 ) ) ( not ( = ?auto_212864 ?auto_212869 ) ) ( not ( = ?auto_212864 ?auto_212870 ) ) ( not ( = ?auto_212864 ?auto_212871 ) ) ( not ( = ?auto_212865 ?auto_212866 ) ) ( not ( = ?auto_212865 ?auto_212867 ) ) ( not ( = ?auto_212865 ?auto_212868 ) ) ( not ( = ?auto_212865 ?auto_212869 ) ) ( not ( = ?auto_212865 ?auto_212870 ) ) ( not ( = ?auto_212865 ?auto_212871 ) ) ( not ( = ?auto_212866 ?auto_212867 ) ) ( not ( = ?auto_212866 ?auto_212868 ) ) ( not ( = ?auto_212866 ?auto_212869 ) ) ( not ( = ?auto_212866 ?auto_212870 ) ) ( not ( = ?auto_212866 ?auto_212871 ) ) ( not ( = ?auto_212867 ?auto_212868 ) ) ( not ( = ?auto_212867 ?auto_212869 ) ) ( not ( = ?auto_212867 ?auto_212870 ) ) ( not ( = ?auto_212867 ?auto_212871 ) ) ( not ( = ?auto_212868 ?auto_212869 ) ) ( not ( = ?auto_212868 ?auto_212870 ) ) ( not ( = ?auto_212868 ?auto_212871 ) ) ( not ( = ?auto_212869 ?auto_212870 ) ) ( not ( = ?auto_212869 ?auto_212871 ) ) ( not ( = ?auto_212870 ?auto_212871 ) ) ( ON-TABLE ?auto_212871 ) ( ON ?auto_212870 ?auto_212871 ) ( CLEAR ?auto_212868 ) ( ON ?auto_212869 ?auto_212870 ) ( CLEAR ?auto_212869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212871 ?auto_212870 )
      ( MAKE-8PILE ?auto_212864 ?auto_212865 ?auto_212866 ?auto_212867 ?auto_212868 ?auto_212869 ?auto_212870 ?auto_212871 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212872 - BLOCK
      ?auto_212873 - BLOCK
      ?auto_212874 - BLOCK
      ?auto_212875 - BLOCK
      ?auto_212876 - BLOCK
      ?auto_212877 - BLOCK
      ?auto_212878 - BLOCK
      ?auto_212879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212872 ) ( ON ?auto_212873 ?auto_212872 ) ( ON ?auto_212874 ?auto_212873 ) ( ON ?auto_212875 ?auto_212874 ) ( not ( = ?auto_212872 ?auto_212873 ) ) ( not ( = ?auto_212872 ?auto_212874 ) ) ( not ( = ?auto_212872 ?auto_212875 ) ) ( not ( = ?auto_212872 ?auto_212876 ) ) ( not ( = ?auto_212872 ?auto_212877 ) ) ( not ( = ?auto_212872 ?auto_212878 ) ) ( not ( = ?auto_212872 ?auto_212879 ) ) ( not ( = ?auto_212873 ?auto_212874 ) ) ( not ( = ?auto_212873 ?auto_212875 ) ) ( not ( = ?auto_212873 ?auto_212876 ) ) ( not ( = ?auto_212873 ?auto_212877 ) ) ( not ( = ?auto_212873 ?auto_212878 ) ) ( not ( = ?auto_212873 ?auto_212879 ) ) ( not ( = ?auto_212874 ?auto_212875 ) ) ( not ( = ?auto_212874 ?auto_212876 ) ) ( not ( = ?auto_212874 ?auto_212877 ) ) ( not ( = ?auto_212874 ?auto_212878 ) ) ( not ( = ?auto_212874 ?auto_212879 ) ) ( not ( = ?auto_212875 ?auto_212876 ) ) ( not ( = ?auto_212875 ?auto_212877 ) ) ( not ( = ?auto_212875 ?auto_212878 ) ) ( not ( = ?auto_212875 ?auto_212879 ) ) ( not ( = ?auto_212876 ?auto_212877 ) ) ( not ( = ?auto_212876 ?auto_212878 ) ) ( not ( = ?auto_212876 ?auto_212879 ) ) ( not ( = ?auto_212877 ?auto_212878 ) ) ( not ( = ?auto_212877 ?auto_212879 ) ) ( not ( = ?auto_212878 ?auto_212879 ) ) ( ON-TABLE ?auto_212879 ) ( ON ?auto_212878 ?auto_212879 ) ( ON ?auto_212877 ?auto_212878 ) ( CLEAR ?auto_212877 ) ( HOLDING ?auto_212876 ) ( CLEAR ?auto_212875 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212872 ?auto_212873 ?auto_212874 ?auto_212875 ?auto_212876 )
      ( MAKE-8PILE ?auto_212872 ?auto_212873 ?auto_212874 ?auto_212875 ?auto_212876 ?auto_212877 ?auto_212878 ?auto_212879 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212880 - BLOCK
      ?auto_212881 - BLOCK
      ?auto_212882 - BLOCK
      ?auto_212883 - BLOCK
      ?auto_212884 - BLOCK
      ?auto_212885 - BLOCK
      ?auto_212886 - BLOCK
      ?auto_212887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212880 ) ( ON ?auto_212881 ?auto_212880 ) ( ON ?auto_212882 ?auto_212881 ) ( ON ?auto_212883 ?auto_212882 ) ( not ( = ?auto_212880 ?auto_212881 ) ) ( not ( = ?auto_212880 ?auto_212882 ) ) ( not ( = ?auto_212880 ?auto_212883 ) ) ( not ( = ?auto_212880 ?auto_212884 ) ) ( not ( = ?auto_212880 ?auto_212885 ) ) ( not ( = ?auto_212880 ?auto_212886 ) ) ( not ( = ?auto_212880 ?auto_212887 ) ) ( not ( = ?auto_212881 ?auto_212882 ) ) ( not ( = ?auto_212881 ?auto_212883 ) ) ( not ( = ?auto_212881 ?auto_212884 ) ) ( not ( = ?auto_212881 ?auto_212885 ) ) ( not ( = ?auto_212881 ?auto_212886 ) ) ( not ( = ?auto_212881 ?auto_212887 ) ) ( not ( = ?auto_212882 ?auto_212883 ) ) ( not ( = ?auto_212882 ?auto_212884 ) ) ( not ( = ?auto_212882 ?auto_212885 ) ) ( not ( = ?auto_212882 ?auto_212886 ) ) ( not ( = ?auto_212882 ?auto_212887 ) ) ( not ( = ?auto_212883 ?auto_212884 ) ) ( not ( = ?auto_212883 ?auto_212885 ) ) ( not ( = ?auto_212883 ?auto_212886 ) ) ( not ( = ?auto_212883 ?auto_212887 ) ) ( not ( = ?auto_212884 ?auto_212885 ) ) ( not ( = ?auto_212884 ?auto_212886 ) ) ( not ( = ?auto_212884 ?auto_212887 ) ) ( not ( = ?auto_212885 ?auto_212886 ) ) ( not ( = ?auto_212885 ?auto_212887 ) ) ( not ( = ?auto_212886 ?auto_212887 ) ) ( ON-TABLE ?auto_212887 ) ( ON ?auto_212886 ?auto_212887 ) ( ON ?auto_212885 ?auto_212886 ) ( CLEAR ?auto_212883 ) ( ON ?auto_212884 ?auto_212885 ) ( CLEAR ?auto_212884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212887 ?auto_212886 ?auto_212885 )
      ( MAKE-8PILE ?auto_212880 ?auto_212881 ?auto_212882 ?auto_212883 ?auto_212884 ?auto_212885 ?auto_212886 ?auto_212887 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212888 - BLOCK
      ?auto_212889 - BLOCK
      ?auto_212890 - BLOCK
      ?auto_212891 - BLOCK
      ?auto_212892 - BLOCK
      ?auto_212893 - BLOCK
      ?auto_212894 - BLOCK
      ?auto_212895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212888 ) ( ON ?auto_212889 ?auto_212888 ) ( ON ?auto_212890 ?auto_212889 ) ( not ( = ?auto_212888 ?auto_212889 ) ) ( not ( = ?auto_212888 ?auto_212890 ) ) ( not ( = ?auto_212888 ?auto_212891 ) ) ( not ( = ?auto_212888 ?auto_212892 ) ) ( not ( = ?auto_212888 ?auto_212893 ) ) ( not ( = ?auto_212888 ?auto_212894 ) ) ( not ( = ?auto_212888 ?auto_212895 ) ) ( not ( = ?auto_212889 ?auto_212890 ) ) ( not ( = ?auto_212889 ?auto_212891 ) ) ( not ( = ?auto_212889 ?auto_212892 ) ) ( not ( = ?auto_212889 ?auto_212893 ) ) ( not ( = ?auto_212889 ?auto_212894 ) ) ( not ( = ?auto_212889 ?auto_212895 ) ) ( not ( = ?auto_212890 ?auto_212891 ) ) ( not ( = ?auto_212890 ?auto_212892 ) ) ( not ( = ?auto_212890 ?auto_212893 ) ) ( not ( = ?auto_212890 ?auto_212894 ) ) ( not ( = ?auto_212890 ?auto_212895 ) ) ( not ( = ?auto_212891 ?auto_212892 ) ) ( not ( = ?auto_212891 ?auto_212893 ) ) ( not ( = ?auto_212891 ?auto_212894 ) ) ( not ( = ?auto_212891 ?auto_212895 ) ) ( not ( = ?auto_212892 ?auto_212893 ) ) ( not ( = ?auto_212892 ?auto_212894 ) ) ( not ( = ?auto_212892 ?auto_212895 ) ) ( not ( = ?auto_212893 ?auto_212894 ) ) ( not ( = ?auto_212893 ?auto_212895 ) ) ( not ( = ?auto_212894 ?auto_212895 ) ) ( ON-TABLE ?auto_212895 ) ( ON ?auto_212894 ?auto_212895 ) ( ON ?auto_212893 ?auto_212894 ) ( ON ?auto_212892 ?auto_212893 ) ( CLEAR ?auto_212892 ) ( HOLDING ?auto_212891 ) ( CLEAR ?auto_212890 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212888 ?auto_212889 ?auto_212890 ?auto_212891 )
      ( MAKE-8PILE ?auto_212888 ?auto_212889 ?auto_212890 ?auto_212891 ?auto_212892 ?auto_212893 ?auto_212894 ?auto_212895 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212896 - BLOCK
      ?auto_212897 - BLOCK
      ?auto_212898 - BLOCK
      ?auto_212899 - BLOCK
      ?auto_212900 - BLOCK
      ?auto_212901 - BLOCK
      ?auto_212902 - BLOCK
      ?auto_212903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212896 ) ( ON ?auto_212897 ?auto_212896 ) ( ON ?auto_212898 ?auto_212897 ) ( not ( = ?auto_212896 ?auto_212897 ) ) ( not ( = ?auto_212896 ?auto_212898 ) ) ( not ( = ?auto_212896 ?auto_212899 ) ) ( not ( = ?auto_212896 ?auto_212900 ) ) ( not ( = ?auto_212896 ?auto_212901 ) ) ( not ( = ?auto_212896 ?auto_212902 ) ) ( not ( = ?auto_212896 ?auto_212903 ) ) ( not ( = ?auto_212897 ?auto_212898 ) ) ( not ( = ?auto_212897 ?auto_212899 ) ) ( not ( = ?auto_212897 ?auto_212900 ) ) ( not ( = ?auto_212897 ?auto_212901 ) ) ( not ( = ?auto_212897 ?auto_212902 ) ) ( not ( = ?auto_212897 ?auto_212903 ) ) ( not ( = ?auto_212898 ?auto_212899 ) ) ( not ( = ?auto_212898 ?auto_212900 ) ) ( not ( = ?auto_212898 ?auto_212901 ) ) ( not ( = ?auto_212898 ?auto_212902 ) ) ( not ( = ?auto_212898 ?auto_212903 ) ) ( not ( = ?auto_212899 ?auto_212900 ) ) ( not ( = ?auto_212899 ?auto_212901 ) ) ( not ( = ?auto_212899 ?auto_212902 ) ) ( not ( = ?auto_212899 ?auto_212903 ) ) ( not ( = ?auto_212900 ?auto_212901 ) ) ( not ( = ?auto_212900 ?auto_212902 ) ) ( not ( = ?auto_212900 ?auto_212903 ) ) ( not ( = ?auto_212901 ?auto_212902 ) ) ( not ( = ?auto_212901 ?auto_212903 ) ) ( not ( = ?auto_212902 ?auto_212903 ) ) ( ON-TABLE ?auto_212903 ) ( ON ?auto_212902 ?auto_212903 ) ( ON ?auto_212901 ?auto_212902 ) ( ON ?auto_212900 ?auto_212901 ) ( CLEAR ?auto_212898 ) ( ON ?auto_212899 ?auto_212900 ) ( CLEAR ?auto_212899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212903 ?auto_212902 ?auto_212901 ?auto_212900 )
      ( MAKE-8PILE ?auto_212896 ?auto_212897 ?auto_212898 ?auto_212899 ?auto_212900 ?auto_212901 ?auto_212902 ?auto_212903 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212904 - BLOCK
      ?auto_212905 - BLOCK
      ?auto_212906 - BLOCK
      ?auto_212907 - BLOCK
      ?auto_212908 - BLOCK
      ?auto_212909 - BLOCK
      ?auto_212910 - BLOCK
      ?auto_212911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212904 ) ( ON ?auto_212905 ?auto_212904 ) ( not ( = ?auto_212904 ?auto_212905 ) ) ( not ( = ?auto_212904 ?auto_212906 ) ) ( not ( = ?auto_212904 ?auto_212907 ) ) ( not ( = ?auto_212904 ?auto_212908 ) ) ( not ( = ?auto_212904 ?auto_212909 ) ) ( not ( = ?auto_212904 ?auto_212910 ) ) ( not ( = ?auto_212904 ?auto_212911 ) ) ( not ( = ?auto_212905 ?auto_212906 ) ) ( not ( = ?auto_212905 ?auto_212907 ) ) ( not ( = ?auto_212905 ?auto_212908 ) ) ( not ( = ?auto_212905 ?auto_212909 ) ) ( not ( = ?auto_212905 ?auto_212910 ) ) ( not ( = ?auto_212905 ?auto_212911 ) ) ( not ( = ?auto_212906 ?auto_212907 ) ) ( not ( = ?auto_212906 ?auto_212908 ) ) ( not ( = ?auto_212906 ?auto_212909 ) ) ( not ( = ?auto_212906 ?auto_212910 ) ) ( not ( = ?auto_212906 ?auto_212911 ) ) ( not ( = ?auto_212907 ?auto_212908 ) ) ( not ( = ?auto_212907 ?auto_212909 ) ) ( not ( = ?auto_212907 ?auto_212910 ) ) ( not ( = ?auto_212907 ?auto_212911 ) ) ( not ( = ?auto_212908 ?auto_212909 ) ) ( not ( = ?auto_212908 ?auto_212910 ) ) ( not ( = ?auto_212908 ?auto_212911 ) ) ( not ( = ?auto_212909 ?auto_212910 ) ) ( not ( = ?auto_212909 ?auto_212911 ) ) ( not ( = ?auto_212910 ?auto_212911 ) ) ( ON-TABLE ?auto_212911 ) ( ON ?auto_212910 ?auto_212911 ) ( ON ?auto_212909 ?auto_212910 ) ( ON ?auto_212908 ?auto_212909 ) ( ON ?auto_212907 ?auto_212908 ) ( CLEAR ?auto_212907 ) ( HOLDING ?auto_212906 ) ( CLEAR ?auto_212905 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212904 ?auto_212905 ?auto_212906 )
      ( MAKE-8PILE ?auto_212904 ?auto_212905 ?auto_212906 ?auto_212907 ?auto_212908 ?auto_212909 ?auto_212910 ?auto_212911 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212912 - BLOCK
      ?auto_212913 - BLOCK
      ?auto_212914 - BLOCK
      ?auto_212915 - BLOCK
      ?auto_212916 - BLOCK
      ?auto_212917 - BLOCK
      ?auto_212918 - BLOCK
      ?auto_212919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212912 ) ( ON ?auto_212913 ?auto_212912 ) ( not ( = ?auto_212912 ?auto_212913 ) ) ( not ( = ?auto_212912 ?auto_212914 ) ) ( not ( = ?auto_212912 ?auto_212915 ) ) ( not ( = ?auto_212912 ?auto_212916 ) ) ( not ( = ?auto_212912 ?auto_212917 ) ) ( not ( = ?auto_212912 ?auto_212918 ) ) ( not ( = ?auto_212912 ?auto_212919 ) ) ( not ( = ?auto_212913 ?auto_212914 ) ) ( not ( = ?auto_212913 ?auto_212915 ) ) ( not ( = ?auto_212913 ?auto_212916 ) ) ( not ( = ?auto_212913 ?auto_212917 ) ) ( not ( = ?auto_212913 ?auto_212918 ) ) ( not ( = ?auto_212913 ?auto_212919 ) ) ( not ( = ?auto_212914 ?auto_212915 ) ) ( not ( = ?auto_212914 ?auto_212916 ) ) ( not ( = ?auto_212914 ?auto_212917 ) ) ( not ( = ?auto_212914 ?auto_212918 ) ) ( not ( = ?auto_212914 ?auto_212919 ) ) ( not ( = ?auto_212915 ?auto_212916 ) ) ( not ( = ?auto_212915 ?auto_212917 ) ) ( not ( = ?auto_212915 ?auto_212918 ) ) ( not ( = ?auto_212915 ?auto_212919 ) ) ( not ( = ?auto_212916 ?auto_212917 ) ) ( not ( = ?auto_212916 ?auto_212918 ) ) ( not ( = ?auto_212916 ?auto_212919 ) ) ( not ( = ?auto_212917 ?auto_212918 ) ) ( not ( = ?auto_212917 ?auto_212919 ) ) ( not ( = ?auto_212918 ?auto_212919 ) ) ( ON-TABLE ?auto_212919 ) ( ON ?auto_212918 ?auto_212919 ) ( ON ?auto_212917 ?auto_212918 ) ( ON ?auto_212916 ?auto_212917 ) ( ON ?auto_212915 ?auto_212916 ) ( CLEAR ?auto_212913 ) ( ON ?auto_212914 ?auto_212915 ) ( CLEAR ?auto_212914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212919 ?auto_212918 ?auto_212917 ?auto_212916 ?auto_212915 )
      ( MAKE-8PILE ?auto_212912 ?auto_212913 ?auto_212914 ?auto_212915 ?auto_212916 ?auto_212917 ?auto_212918 ?auto_212919 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212920 - BLOCK
      ?auto_212921 - BLOCK
      ?auto_212922 - BLOCK
      ?auto_212923 - BLOCK
      ?auto_212924 - BLOCK
      ?auto_212925 - BLOCK
      ?auto_212926 - BLOCK
      ?auto_212927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212920 ) ( not ( = ?auto_212920 ?auto_212921 ) ) ( not ( = ?auto_212920 ?auto_212922 ) ) ( not ( = ?auto_212920 ?auto_212923 ) ) ( not ( = ?auto_212920 ?auto_212924 ) ) ( not ( = ?auto_212920 ?auto_212925 ) ) ( not ( = ?auto_212920 ?auto_212926 ) ) ( not ( = ?auto_212920 ?auto_212927 ) ) ( not ( = ?auto_212921 ?auto_212922 ) ) ( not ( = ?auto_212921 ?auto_212923 ) ) ( not ( = ?auto_212921 ?auto_212924 ) ) ( not ( = ?auto_212921 ?auto_212925 ) ) ( not ( = ?auto_212921 ?auto_212926 ) ) ( not ( = ?auto_212921 ?auto_212927 ) ) ( not ( = ?auto_212922 ?auto_212923 ) ) ( not ( = ?auto_212922 ?auto_212924 ) ) ( not ( = ?auto_212922 ?auto_212925 ) ) ( not ( = ?auto_212922 ?auto_212926 ) ) ( not ( = ?auto_212922 ?auto_212927 ) ) ( not ( = ?auto_212923 ?auto_212924 ) ) ( not ( = ?auto_212923 ?auto_212925 ) ) ( not ( = ?auto_212923 ?auto_212926 ) ) ( not ( = ?auto_212923 ?auto_212927 ) ) ( not ( = ?auto_212924 ?auto_212925 ) ) ( not ( = ?auto_212924 ?auto_212926 ) ) ( not ( = ?auto_212924 ?auto_212927 ) ) ( not ( = ?auto_212925 ?auto_212926 ) ) ( not ( = ?auto_212925 ?auto_212927 ) ) ( not ( = ?auto_212926 ?auto_212927 ) ) ( ON-TABLE ?auto_212927 ) ( ON ?auto_212926 ?auto_212927 ) ( ON ?auto_212925 ?auto_212926 ) ( ON ?auto_212924 ?auto_212925 ) ( ON ?auto_212923 ?auto_212924 ) ( ON ?auto_212922 ?auto_212923 ) ( CLEAR ?auto_212922 ) ( HOLDING ?auto_212921 ) ( CLEAR ?auto_212920 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212920 ?auto_212921 )
      ( MAKE-8PILE ?auto_212920 ?auto_212921 ?auto_212922 ?auto_212923 ?auto_212924 ?auto_212925 ?auto_212926 ?auto_212927 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212928 - BLOCK
      ?auto_212929 - BLOCK
      ?auto_212930 - BLOCK
      ?auto_212931 - BLOCK
      ?auto_212932 - BLOCK
      ?auto_212933 - BLOCK
      ?auto_212934 - BLOCK
      ?auto_212935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212928 ) ( not ( = ?auto_212928 ?auto_212929 ) ) ( not ( = ?auto_212928 ?auto_212930 ) ) ( not ( = ?auto_212928 ?auto_212931 ) ) ( not ( = ?auto_212928 ?auto_212932 ) ) ( not ( = ?auto_212928 ?auto_212933 ) ) ( not ( = ?auto_212928 ?auto_212934 ) ) ( not ( = ?auto_212928 ?auto_212935 ) ) ( not ( = ?auto_212929 ?auto_212930 ) ) ( not ( = ?auto_212929 ?auto_212931 ) ) ( not ( = ?auto_212929 ?auto_212932 ) ) ( not ( = ?auto_212929 ?auto_212933 ) ) ( not ( = ?auto_212929 ?auto_212934 ) ) ( not ( = ?auto_212929 ?auto_212935 ) ) ( not ( = ?auto_212930 ?auto_212931 ) ) ( not ( = ?auto_212930 ?auto_212932 ) ) ( not ( = ?auto_212930 ?auto_212933 ) ) ( not ( = ?auto_212930 ?auto_212934 ) ) ( not ( = ?auto_212930 ?auto_212935 ) ) ( not ( = ?auto_212931 ?auto_212932 ) ) ( not ( = ?auto_212931 ?auto_212933 ) ) ( not ( = ?auto_212931 ?auto_212934 ) ) ( not ( = ?auto_212931 ?auto_212935 ) ) ( not ( = ?auto_212932 ?auto_212933 ) ) ( not ( = ?auto_212932 ?auto_212934 ) ) ( not ( = ?auto_212932 ?auto_212935 ) ) ( not ( = ?auto_212933 ?auto_212934 ) ) ( not ( = ?auto_212933 ?auto_212935 ) ) ( not ( = ?auto_212934 ?auto_212935 ) ) ( ON-TABLE ?auto_212935 ) ( ON ?auto_212934 ?auto_212935 ) ( ON ?auto_212933 ?auto_212934 ) ( ON ?auto_212932 ?auto_212933 ) ( ON ?auto_212931 ?auto_212932 ) ( ON ?auto_212930 ?auto_212931 ) ( CLEAR ?auto_212928 ) ( ON ?auto_212929 ?auto_212930 ) ( CLEAR ?auto_212929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212935 ?auto_212934 ?auto_212933 ?auto_212932 ?auto_212931 ?auto_212930 )
      ( MAKE-8PILE ?auto_212928 ?auto_212929 ?auto_212930 ?auto_212931 ?auto_212932 ?auto_212933 ?auto_212934 ?auto_212935 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212936 - BLOCK
      ?auto_212937 - BLOCK
      ?auto_212938 - BLOCK
      ?auto_212939 - BLOCK
      ?auto_212940 - BLOCK
      ?auto_212941 - BLOCK
      ?auto_212942 - BLOCK
      ?auto_212943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212936 ?auto_212937 ) ) ( not ( = ?auto_212936 ?auto_212938 ) ) ( not ( = ?auto_212936 ?auto_212939 ) ) ( not ( = ?auto_212936 ?auto_212940 ) ) ( not ( = ?auto_212936 ?auto_212941 ) ) ( not ( = ?auto_212936 ?auto_212942 ) ) ( not ( = ?auto_212936 ?auto_212943 ) ) ( not ( = ?auto_212937 ?auto_212938 ) ) ( not ( = ?auto_212937 ?auto_212939 ) ) ( not ( = ?auto_212937 ?auto_212940 ) ) ( not ( = ?auto_212937 ?auto_212941 ) ) ( not ( = ?auto_212937 ?auto_212942 ) ) ( not ( = ?auto_212937 ?auto_212943 ) ) ( not ( = ?auto_212938 ?auto_212939 ) ) ( not ( = ?auto_212938 ?auto_212940 ) ) ( not ( = ?auto_212938 ?auto_212941 ) ) ( not ( = ?auto_212938 ?auto_212942 ) ) ( not ( = ?auto_212938 ?auto_212943 ) ) ( not ( = ?auto_212939 ?auto_212940 ) ) ( not ( = ?auto_212939 ?auto_212941 ) ) ( not ( = ?auto_212939 ?auto_212942 ) ) ( not ( = ?auto_212939 ?auto_212943 ) ) ( not ( = ?auto_212940 ?auto_212941 ) ) ( not ( = ?auto_212940 ?auto_212942 ) ) ( not ( = ?auto_212940 ?auto_212943 ) ) ( not ( = ?auto_212941 ?auto_212942 ) ) ( not ( = ?auto_212941 ?auto_212943 ) ) ( not ( = ?auto_212942 ?auto_212943 ) ) ( ON-TABLE ?auto_212943 ) ( ON ?auto_212942 ?auto_212943 ) ( ON ?auto_212941 ?auto_212942 ) ( ON ?auto_212940 ?auto_212941 ) ( ON ?auto_212939 ?auto_212940 ) ( ON ?auto_212938 ?auto_212939 ) ( ON ?auto_212937 ?auto_212938 ) ( CLEAR ?auto_212937 ) ( HOLDING ?auto_212936 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212936 )
      ( MAKE-8PILE ?auto_212936 ?auto_212937 ?auto_212938 ?auto_212939 ?auto_212940 ?auto_212941 ?auto_212942 ?auto_212943 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212944 - BLOCK
      ?auto_212945 - BLOCK
      ?auto_212946 - BLOCK
      ?auto_212947 - BLOCK
      ?auto_212948 - BLOCK
      ?auto_212949 - BLOCK
      ?auto_212950 - BLOCK
      ?auto_212951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212944 ?auto_212945 ) ) ( not ( = ?auto_212944 ?auto_212946 ) ) ( not ( = ?auto_212944 ?auto_212947 ) ) ( not ( = ?auto_212944 ?auto_212948 ) ) ( not ( = ?auto_212944 ?auto_212949 ) ) ( not ( = ?auto_212944 ?auto_212950 ) ) ( not ( = ?auto_212944 ?auto_212951 ) ) ( not ( = ?auto_212945 ?auto_212946 ) ) ( not ( = ?auto_212945 ?auto_212947 ) ) ( not ( = ?auto_212945 ?auto_212948 ) ) ( not ( = ?auto_212945 ?auto_212949 ) ) ( not ( = ?auto_212945 ?auto_212950 ) ) ( not ( = ?auto_212945 ?auto_212951 ) ) ( not ( = ?auto_212946 ?auto_212947 ) ) ( not ( = ?auto_212946 ?auto_212948 ) ) ( not ( = ?auto_212946 ?auto_212949 ) ) ( not ( = ?auto_212946 ?auto_212950 ) ) ( not ( = ?auto_212946 ?auto_212951 ) ) ( not ( = ?auto_212947 ?auto_212948 ) ) ( not ( = ?auto_212947 ?auto_212949 ) ) ( not ( = ?auto_212947 ?auto_212950 ) ) ( not ( = ?auto_212947 ?auto_212951 ) ) ( not ( = ?auto_212948 ?auto_212949 ) ) ( not ( = ?auto_212948 ?auto_212950 ) ) ( not ( = ?auto_212948 ?auto_212951 ) ) ( not ( = ?auto_212949 ?auto_212950 ) ) ( not ( = ?auto_212949 ?auto_212951 ) ) ( not ( = ?auto_212950 ?auto_212951 ) ) ( ON-TABLE ?auto_212951 ) ( ON ?auto_212950 ?auto_212951 ) ( ON ?auto_212949 ?auto_212950 ) ( ON ?auto_212948 ?auto_212949 ) ( ON ?auto_212947 ?auto_212948 ) ( ON ?auto_212946 ?auto_212947 ) ( ON ?auto_212945 ?auto_212946 ) ( ON ?auto_212944 ?auto_212945 ) ( CLEAR ?auto_212944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212951 ?auto_212950 ?auto_212949 ?auto_212948 ?auto_212947 ?auto_212946 ?auto_212945 )
      ( MAKE-8PILE ?auto_212944 ?auto_212945 ?auto_212946 ?auto_212947 ?auto_212948 ?auto_212949 ?auto_212950 ?auto_212951 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212952 - BLOCK
      ?auto_212953 - BLOCK
      ?auto_212954 - BLOCK
      ?auto_212955 - BLOCK
      ?auto_212956 - BLOCK
      ?auto_212957 - BLOCK
      ?auto_212958 - BLOCK
      ?auto_212959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212952 ?auto_212953 ) ) ( not ( = ?auto_212952 ?auto_212954 ) ) ( not ( = ?auto_212952 ?auto_212955 ) ) ( not ( = ?auto_212952 ?auto_212956 ) ) ( not ( = ?auto_212952 ?auto_212957 ) ) ( not ( = ?auto_212952 ?auto_212958 ) ) ( not ( = ?auto_212952 ?auto_212959 ) ) ( not ( = ?auto_212953 ?auto_212954 ) ) ( not ( = ?auto_212953 ?auto_212955 ) ) ( not ( = ?auto_212953 ?auto_212956 ) ) ( not ( = ?auto_212953 ?auto_212957 ) ) ( not ( = ?auto_212953 ?auto_212958 ) ) ( not ( = ?auto_212953 ?auto_212959 ) ) ( not ( = ?auto_212954 ?auto_212955 ) ) ( not ( = ?auto_212954 ?auto_212956 ) ) ( not ( = ?auto_212954 ?auto_212957 ) ) ( not ( = ?auto_212954 ?auto_212958 ) ) ( not ( = ?auto_212954 ?auto_212959 ) ) ( not ( = ?auto_212955 ?auto_212956 ) ) ( not ( = ?auto_212955 ?auto_212957 ) ) ( not ( = ?auto_212955 ?auto_212958 ) ) ( not ( = ?auto_212955 ?auto_212959 ) ) ( not ( = ?auto_212956 ?auto_212957 ) ) ( not ( = ?auto_212956 ?auto_212958 ) ) ( not ( = ?auto_212956 ?auto_212959 ) ) ( not ( = ?auto_212957 ?auto_212958 ) ) ( not ( = ?auto_212957 ?auto_212959 ) ) ( not ( = ?auto_212958 ?auto_212959 ) ) ( ON-TABLE ?auto_212959 ) ( ON ?auto_212958 ?auto_212959 ) ( ON ?auto_212957 ?auto_212958 ) ( ON ?auto_212956 ?auto_212957 ) ( ON ?auto_212955 ?auto_212956 ) ( ON ?auto_212954 ?auto_212955 ) ( ON ?auto_212953 ?auto_212954 ) ( HOLDING ?auto_212952 ) ( CLEAR ?auto_212953 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_212959 ?auto_212958 ?auto_212957 ?auto_212956 ?auto_212955 ?auto_212954 ?auto_212953 ?auto_212952 )
      ( MAKE-8PILE ?auto_212952 ?auto_212953 ?auto_212954 ?auto_212955 ?auto_212956 ?auto_212957 ?auto_212958 ?auto_212959 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212960 - BLOCK
      ?auto_212961 - BLOCK
      ?auto_212962 - BLOCK
      ?auto_212963 - BLOCK
      ?auto_212964 - BLOCK
      ?auto_212965 - BLOCK
      ?auto_212966 - BLOCK
      ?auto_212967 - BLOCK
    )
    :vars
    (
      ?auto_212968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212960 ?auto_212961 ) ) ( not ( = ?auto_212960 ?auto_212962 ) ) ( not ( = ?auto_212960 ?auto_212963 ) ) ( not ( = ?auto_212960 ?auto_212964 ) ) ( not ( = ?auto_212960 ?auto_212965 ) ) ( not ( = ?auto_212960 ?auto_212966 ) ) ( not ( = ?auto_212960 ?auto_212967 ) ) ( not ( = ?auto_212961 ?auto_212962 ) ) ( not ( = ?auto_212961 ?auto_212963 ) ) ( not ( = ?auto_212961 ?auto_212964 ) ) ( not ( = ?auto_212961 ?auto_212965 ) ) ( not ( = ?auto_212961 ?auto_212966 ) ) ( not ( = ?auto_212961 ?auto_212967 ) ) ( not ( = ?auto_212962 ?auto_212963 ) ) ( not ( = ?auto_212962 ?auto_212964 ) ) ( not ( = ?auto_212962 ?auto_212965 ) ) ( not ( = ?auto_212962 ?auto_212966 ) ) ( not ( = ?auto_212962 ?auto_212967 ) ) ( not ( = ?auto_212963 ?auto_212964 ) ) ( not ( = ?auto_212963 ?auto_212965 ) ) ( not ( = ?auto_212963 ?auto_212966 ) ) ( not ( = ?auto_212963 ?auto_212967 ) ) ( not ( = ?auto_212964 ?auto_212965 ) ) ( not ( = ?auto_212964 ?auto_212966 ) ) ( not ( = ?auto_212964 ?auto_212967 ) ) ( not ( = ?auto_212965 ?auto_212966 ) ) ( not ( = ?auto_212965 ?auto_212967 ) ) ( not ( = ?auto_212966 ?auto_212967 ) ) ( ON-TABLE ?auto_212967 ) ( ON ?auto_212966 ?auto_212967 ) ( ON ?auto_212965 ?auto_212966 ) ( ON ?auto_212964 ?auto_212965 ) ( ON ?auto_212963 ?auto_212964 ) ( ON ?auto_212962 ?auto_212963 ) ( ON ?auto_212961 ?auto_212962 ) ( CLEAR ?auto_212961 ) ( ON ?auto_212960 ?auto_212968 ) ( CLEAR ?auto_212960 ) ( HAND-EMPTY ) ( not ( = ?auto_212960 ?auto_212968 ) ) ( not ( = ?auto_212961 ?auto_212968 ) ) ( not ( = ?auto_212962 ?auto_212968 ) ) ( not ( = ?auto_212963 ?auto_212968 ) ) ( not ( = ?auto_212964 ?auto_212968 ) ) ( not ( = ?auto_212965 ?auto_212968 ) ) ( not ( = ?auto_212966 ?auto_212968 ) ) ( not ( = ?auto_212967 ?auto_212968 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212960 ?auto_212968 )
      ( MAKE-8PILE ?auto_212960 ?auto_212961 ?auto_212962 ?auto_212963 ?auto_212964 ?auto_212965 ?auto_212966 ?auto_212967 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212969 - BLOCK
      ?auto_212970 - BLOCK
      ?auto_212971 - BLOCK
      ?auto_212972 - BLOCK
      ?auto_212973 - BLOCK
      ?auto_212974 - BLOCK
      ?auto_212975 - BLOCK
      ?auto_212976 - BLOCK
    )
    :vars
    (
      ?auto_212977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212969 ?auto_212970 ) ) ( not ( = ?auto_212969 ?auto_212971 ) ) ( not ( = ?auto_212969 ?auto_212972 ) ) ( not ( = ?auto_212969 ?auto_212973 ) ) ( not ( = ?auto_212969 ?auto_212974 ) ) ( not ( = ?auto_212969 ?auto_212975 ) ) ( not ( = ?auto_212969 ?auto_212976 ) ) ( not ( = ?auto_212970 ?auto_212971 ) ) ( not ( = ?auto_212970 ?auto_212972 ) ) ( not ( = ?auto_212970 ?auto_212973 ) ) ( not ( = ?auto_212970 ?auto_212974 ) ) ( not ( = ?auto_212970 ?auto_212975 ) ) ( not ( = ?auto_212970 ?auto_212976 ) ) ( not ( = ?auto_212971 ?auto_212972 ) ) ( not ( = ?auto_212971 ?auto_212973 ) ) ( not ( = ?auto_212971 ?auto_212974 ) ) ( not ( = ?auto_212971 ?auto_212975 ) ) ( not ( = ?auto_212971 ?auto_212976 ) ) ( not ( = ?auto_212972 ?auto_212973 ) ) ( not ( = ?auto_212972 ?auto_212974 ) ) ( not ( = ?auto_212972 ?auto_212975 ) ) ( not ( = ?auto_212972 ?auto_212976 ) ) ( not ( = ?auto_212973 ?auto_212974 ) ) ( not ( = ?auto_212973 ?auto_212975 ) ) ( not ( = ?auto_212973 ?auto_212976 ) ) ( not ( = ?auto_212974 ?auto_212975 ) ) ( not ( = ?auto_212974 ?auto_212976 ) ) ( not ( = ?auto_212975 ?auto_212976 ) ) ( ON-TABLE ?auto_212976 ) ( ON ?auto_212975 ?auto_212976 ) ( ON ?auto_212974 ?auto_212975 ) ( ON ?auto_212973 ?auto_212974 ) ( ON ?auto_212972 ?auto_212973 ) ( ON ?auto_212971 ?auto_212972 ) ( ON ?auto_212969 ?auto_212977 ) ( CLEAR ?auto_212969 ) ( not ( = ?auto_212969 ?auto_212977 ) ) ( not ( = ?auto_212970 ?auto_212977 ) ) ( not ( = ?auto_212971 ?auto_212977 ) ) ( not ( = ?auto_212972 ?auto_212977 ) ) ( not ( = ?auto_212973 ?auto_212977 ) ) ( not ( = ?auto_212974 ?auto_212977 ) ) ( not ( = ?auto_212975 ?auto_212977 ) ) ( not ( = ?auto_212976 ?auto_212977 ) ) ( HOLDING ?auto_212970 ) ( CLEAR ?auto_212971 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212976 ?auto_212975 ?auto_212974 ?auto_212973 ?auto_212972 ?auto_212971 ?auto_212970 )
      ( MAKE-8PILE ?auto_212969 ?auto_212970 ?auto_212971 ?auto_212972 ?auto_212973 ?auto_212974 ?auto_212975 ?auto_212976 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212978 - BLOCK
      ?auto_212979 - BLOCK
      ?auto_212980 - BLOCK
      ?auto_212981 - BLOCK
      ?auto_212982 - BLOCK
      ?auto_212983 - BLOCK
      ?auto_212984 - BLOCK
      ?auto_212985 - BLOCK
    )
    :vars
    (
      ?auto_212986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212978 ?auto_212979 ) ) ( not ( = ?auto_212978 ?auto_212980 ) ) ( not ( = ?auto_212978 ?auto_212981 ) ) ( not ( = ?auto_212978 ?auto_212982 ) ) ( not ( = ?auto_212978 ?auto_212983 ) ) ( not ( = ?auto_212978 ?auto_212984 ) ) ( not ( = ?auto_212978 ?auto_212985 ) ) ( not ( = ?auto_212979 ?auto_212980 ) ) ( not ( = ?auto_212979 ?auto_212981 ) ) ( not ( = ?auto_212979 ?auto_212982 ) ) ( not ( = ?auto_212979 ?auto_212983 ) ) ( not ( = ?auto_212979 ?auto_212984 ) ) ( not ( = ?auto_212979 ?auto_212985 ) ) ( not ( = ?auto_212980 ?auto_212981 ) ) ( not ( = ?auto_212980 ?auto_212982 ) ) ( not ( = ?auto_212980 ?auto_212983 ) ) ( not ( = ?auto_212980 ?auto_212984 ) ) ( not ( = ?auto_212980 ?auto_212985 ) ) ( not ( = ?auto_212981 ?auto_212982 ) ) ( not ( = ?auto_212981 ?auto_212983 ) ) ( not ( = ?auto_212981 ?auto_212984 ) ) ( not ( = ?auto_212981 ?auto_212985 ) ) ( not ( = ?auto_212982 ?auto_212983 ) ) ( not ( = ?auto_212982 ?auto_212984 ) ) ( not ( = ?auto_212982 ?auto_212985 ) ) ( not ( = ?auto_212983 ?auto_212984 ) ) ( not ( = ?auto_212983 ?auto_212985 ) ) ( not ( = ?auto_212984 ?auto_212985 ) ) ( ON-TABLE ?auto_212985 ) ( ON ?auto_212984 ?auto_212985 ) ( ON ?auto_212983 ?auto_212984 ) ( ON ?auto_212982 ?auto_212983 ) ( ON ?auto_212981 ?auto_212982 ) ( ON ?auto_212980 ?auto_212981 ) ( ON ?auto_212978 ?auto_212986 ) ( not ( = ?auto_212978 ?auto_212986 ) ) ( not ( = ?auto_212979 ?auto_212986 ) ) ( not ( = ?auto_212980 ?auto_212986 ) ) ( not ( = ?auto_212981 ?auto_212986 ) ) ( not ( = ?auto_212982 ?auto_212986 ) ) ( not ( = ?auto_212983 ?auto_212986 ) ) ( not ( = ?auto_212984 ?auto_212986 ) ) ( not ( = ?auto_212985 ?auto_212986 ) ) ( CLEAR ?auto_212980 ) ( ON ?auto_212979 ?auto_212978 ) ( CLEAR ?auto_212979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212986 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212986 ?auto_212978 )
      ( MAKE-8PILE ?auto_212978 ?auto_212979 ?auto_212980 ?auto_212981 ?auto_212982 ?auto_212983 ?auto_212984 ?auto_212985 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212987 - BLOCK
      ?auto_212988 - BLOCK
      ?auto_212989 - BLOCK
      ?auto_212990 - BLOCK
      ?auto_212991 - BLOCK
      ?auto_212992 - BLOCK
      ?auto_212993 - BLOCK
      ?auto_212994 - BLOCK
    )
    :vars
    (
      ?auto_212995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212987 ?auto_212988 ) ) ( not ( = ?auto_212987 ?auto_212989 ) ) ( not ( = ?auto_212987 ?auto_212990 ) ) ( not ( = ?auto_212987 ?auto_212991 ) ) ( not ( = ?auto_212987 ?auto_212992 ) ) ( not ( = ?auto_212987 ?auto_212993 ) ) ( not ( = ?auto_212987 ?auto_212994 ) ) ( not ( = ?auto_212988 ?auto_212989 ) ) ( not ( = ?auto_212988 ?auto_212990 ) ) ( not ( = ?auto_212988 ?auto_212991 ) ) ( not ( = ?auto_212988 ?auto_212992 ) ) ( not ( = ?auto_212988 ?auto_212993 ) ) ( not ( = ?auto_212988 ?auto_212994 ) ) ( not ( = ?auto_212989 ?auto_212990 ) ) ( not ( = ?auto_212989 ?auto_212991 ) ) ( not ( = ?auto_212989 ?auto_212992 ) ) ( not ( = ?auto_212989 ?auto_212993 ) ) ( not ( = ?auto_212989 ?auto_212994 ) ) ( not ( = ?auto_212990 ?auto_212991 ) ) ( not ( = ?auto_212990 ?auto_212992 ) ) ( not ( = ?auto_212990 ?auto_212993 ) ) ( not ( = ?auto_212990 ?auto_212994 ) ) ( not ( = ?auto_212991 ?auto_212992 ) ) ( not ( = ?auto_212991 ?auto_212993 ) ) ( not ( = ?auto_212991 ?auto_212994 ) ) ( not ( = ?auto_212992 ?auto_212993 ) ) ( not ( = ?auto_212992 ?auto_212994 ) ) ( not ( = ?auto_212993 ?auto_212994 ) ) ( ON-TABLE ?auto_212994 ) ( ON ?auto_212993 ?auto_212994 ) ( ON ?auto_212992 ?auto_212993 ) ( ON ?auto_212991 ?auto_212992 ) ( ON ?auto_212990 ?auto_212991 ) ( ON ?auto_212987 ?auto_212995 ) ( not ( = ?auto_212987 ?auto_212995 ) ) ( not ( = ?auto_212988 ?auto_212995 ) ) ( not ( = ?auto_212989 ?auto_212995 ) ) ( not ( = ?auto_212990 ?auto_212995 ) ) ( not ( = ?auto_212991 ?auto_212995 ) ) ( not ( = ?auto_212992 ?auto_212995 ) ) ( not ( = ?auto_212993 ?auto_212995 ) ) ( not ( = ?auto_212994 ?auto_212995 ) ) ( ON ?auto_212988 ?auto_212987 ) ( CLEAR ?auto_212988 ) ( ON-TABLE ?auto_212995 ) ( HOLDING ?auto_212989 ) ( CLEAR ?auto_212990 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212994 ?auto_212993 ?auto_212992 ?auto_212991 ?auto_212990 ?auto_212989 )
      ( MAKE-8PILE ?auto_212987 ?auto_212988 ?auto_212989 ?auto_212990 ?auto_212991 ?auto_212992 ?auto_212993 ?auto_212994 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_212996 - BLOCK
      ?auto_212997 - BLOCK
      ?auto_212998 - BLOCK
      ?auto_212999 - BLOCK
      ?auto_213000 - BLOCK
      ?auto_213001 - BLOCK
      ?auto_213002 - BLOCK
      ?auto_213003 - BLOCK
    )
    :vars
    (
      ?auto_213004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212996 ?auto_212997 ) ) ( not ( = ?auto_212996 ?auto_212998 ) ) ( not ( = ?auto_212996 ?auto_212999 ) ) ( not ( = ?auto_212996 ?auto_213000 ) ) ( not ( = ?auto_212996 ?auto_213001 ) ) ( not ( = ?auto_212996 ?auto_213002 ) ) ( not ( = ?auto_212996 ?auto_213003 ) ) ( not ( = ?auto_212997 ?auto_212998 ) ) ( not ( = ?auto_212997 ?auto_212999 ) ) ( not ( = ?auto_212997 ?auto_213000 ) ) ( not ( = ?auto_212997 ?auto_213001 ) ) ( not ( = ?auto_212997 ?auto_213002 ) ) ( not ( = ?auto_212997 ?auto_213003 ) ) ( not ( = ?auto_212998 ?auto_212999 ) ) ( not ( = ?auto_212998 ?auto_213000 ) ) ( not ( = ?auto_212998 ?auto_213001 ) ) ( not ( = ?auto_212998 ?auto_213002 ) ) ( not ( = ?auto_212998 ?auto_213003 ) ) ( not ( = ?auto_212999 ?auto_213000 ) ) ( not ( = ?auto_212999 ?auto_213001 ) ) ( not ( = ?auto_212999 ?auto_213002 ) ) ( not ( = ?auto_212999 ?auto_213003 ) ) ( not ( = ?auto_213000 ?auto_213001 ) ) ( not ( = ?auto_213000 ?auto_213002 ) ) ( not ( = ?auto_213000 ?auto_213003 ) ) ( not ( = ?auto_213001 ?auto_213002 ) ) ( not ( = ?auto_213001 ?auto_213003 ) ) ( not ( = ?auto_213002 ?auto_213003 ) ) ( ON-TABLE ?auto_213003 ) ( ON ?auto_213002 ?auto_213003 ) ( ON ?auto_213001 ?auto_213002 ) ( ON ?auto_213000 ?auto_213001 ) ( ON ?auto_212999 ?auto_213000 ) ( ON ?auto_212996 ?auto_213004 ) ( not ( = ?auto_212996 ?auto_213004 ) ) ( not ( = ?auto_212997 ?auto_213004 ) ) ( not ( = ?auto_212998 ?auto_213004 ) ) ( not ( = ?auto_212999 ?auto_213004 ) ) ( not ( = ?auto_213000 ?auto_213004 ) ) ( not ( = ?auto_213001 ?auto_213004 ) ) ( not ( = ?auto_213002 ?auto_213004 ) ) ( not ( = ?auto_213003 ?auto_213004 ) ) ( ON ?auto_212997 ?auto_212996 ) ( ON-TABLE ?auto_213004 ) ( CLEAR ?auto_212999 ) ( ON ?auto_212998 ?auto_212997 ) ( CLEAR ?auto_212998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213004 ?auto_212996 ?auto_212997 )
      ( MAKE-8PILE ?auto_212996 ?auto_212997 ?auto_212998 ?auto_212999 ?auto_213000 ?auto_213001 ?auto_213002 ?auto_213003 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213005 - BLOCK
      ?auto_213006 - BLOCK
      ?auto_213007 - BLOCK
      ?auto_213008 - BLOCK
      ?auto_213009 - BLOCK
      ?auto_213010 - BLOCK
      ?auto_213011 - BLOCK
      ?auto_213012 - BLOCK
    )
    :vars
    (
      ?auto_213013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213005 ?auto_213006 ) ) ( not ( = ?auto_213005 ?auto_213007 ) ) ( not ( = ?auto_213005 ?auto_213008 ) ) ( not ( = ?auto_213005 ?auto_213009 ) ) ( not ( = ?auto_213005 ?auto_213010 ) ) ( not ( = ?auto_213005 ?auto_213011 ) ) ( not ( = ?auto_213005 ?auto_213012 ) ) ( not ( = ?auto_213006 ?auto_213007 ) ) ( not ( = ?auto_213006 ?auto_213008 ) ) ( not ( = ?auto_213006 ?auto_213009 ) ) ( not ( = ?auto_213006 ?auto_213010 ) ) ( not ( = ?auto_213006 ?auto_213011 ) ) ( not ( = ?auto_213006 ?auto_213012 ) ) ( not ( = ?auto_213007 ?auto_213008 ) ) ( not ( = ?auto_213007 ?auto_213009 ) ) ( not ( = ?auto_213007 ?auto_213010 ) ) ( not ( = ?auto_213007 ?auto_213011 ) ) ( not ( = ?auto_213007 ?auto_213012 ) ) ( not ( = ?auto_213008 ?auto_213009 ) ) ( not ( = ?auto_213008 ?auto_213010 ) ) ( not ( = ?auto_213008 ?auto_213011 ) ) ( not ( = ?auto_213008 ?auto_213012 ) ) ( not ( = ?auto_213009 ?auto_213010 ) ) ( not ( = ?auto_213009 ?auto_213011 ) ) ( not ( = ?auto_213009 ?auto_213012 ) ) ( not ( = ?auto_213010 ?auto_213011 ) ) ( not ( = ?auto_213010 ?auto_213012 ) ) ( not ( = ?auto_213011 ?auto_213012 ) ) ( ON-TABLE ?auto_213012 ) ( ON ?auto_213011 ?auto_213012 ) ( ON ?auto_213010 ?auto_213011 ) ( ON ?auto_213009 ?auto_213010 ) ( ON ?auto_213005 ?auto_213013 ) ( not ( = ?auto_213005 ?auto_213013 ) ) ( not ( = ?auto_213006 ?auto_213013 ) ) ( not ( = ?auto_213007 ?auto_213013 ) ) ( not ( = ?auto_213008 ?auto_213013 ) ) ( not ( = ?auto_213009 ?auto_213013 ) ) ( not ( = ?auto_213010 ?auto_213013 ) ) ( not ( = ?auto_213011 ?auto_213013 ) ) ( not ( = ?auto_213012 ?auto_213013 ) ) ( ON ?auto_213006 ?auto_213005 ) ( ON-TABLE ?auto_213013 ) ( ON ?auto_213007 ?auto_213006 ) ( CLEAR ?auto_213007 ) ( HOLDING ?auto_213008 ) ( CLEAR ?auto_213009 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213012 ?auto_213011 ?auto_213010 ?auto_213009 ?auto_213008 )
      ( MAKE-8PILE ?auto_213005 ?auto_213006 ?auto_213007 ?auto_213008 ?auto_213009 ?auto_213010 ?auto_213011 ?auto_213012 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213014 - BLOCK
      ?auto_213015 - BLOCK
      ?auto_213016 - BLOCK
      ?auto_213017 - BLOCK
      ?auto_213018 - BLOCK
      ?auto_213019 - BLOCK
      ?auto_213020 - BLOCK
      ?auto_213021 - BLOCK
    )
    :vars
    (
      ?auto_213022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213014 ?auto_213015 ) ) ( not ( = ?auto_213014 ?auto_213016 ) ) ( not ( = ?auto_213014 ?auto_213017 ) ) ( not ( = ?auto_213014 ?auto_213018 ) ) ( not ( = ?auto_213014 ?auto_213019 ) ) ( not ( = ?auto_213014 ?auto_213020 ) ) ( not ( = ?auto_213014 ?auto_213021 ) ) ( not ( = ?auto_213015 ?auto_213016 ) ) ( not ( = ?auto_213015 ?auto_213017 ) ) ( not ( = ?auto_213015 ?auto_213018 ) ) ( not ( = ?auto_213015 ?auto_213019 ) ) ( not ( = ?auto_213015 ?auto_213020 ) ) ( not ( = ?auto_213015 ?auto_213021 ) ) ( not ( = ?auto_213016 ?auto_213017 ) ) ( not ( = ?auto_213016 ?auto_213018 ) ) ( not ( = ?auto_213016 ?auto_213019 ) ) ( not ( = ?auto_213016 ?auto_213020 ) ) ( not ( = ?auto_213016 ?auto_213021 ) ) ( not ( = ?auto_213017 ?auto_213018 ) ) ( not ( = ?auto_213017 ?auto_213019 ) ) ( not ( = ?auto_213017 ?auto_213020 ) ) ( not ( = ?auto_213017 ?auto_213021 ) ) ( not ( = ?auto_213018 ?auto_213019 ) ) ( not ( = ?auto_213018 ?auto_213020 ) ) ( not ( = ?auto_213018 ?auto_213021 ) ) ( not ( = ?auto_213019 ?auto_213020 ) ) ( not ( = ?auto_213019 ?auto_213021 ) ) ( not ( = ?auto_213020 ?auto_213021 ) ) ( ON-TABLE ?auto_213021 ) ( ON ?auto_213020 ?auto_213021 ) ( ON ?auto_213019 ?auto_213020 ) ( ON ?auto_213018 ?auto_213019 ) ( ON ?auto_213014 ?auto_213022 ) ( not ( = ?auto_213014 ?auto_213022 ) ) ( not ( = ?auto_213015 ?auto_213022 ) ) ( not ( = ?auto_213016 ?auto_213022 ) ) ( not ( = ?auto_213017 ?auto_213022 ) ) ( not ( = ?auto_213018 ?auto_213022 ) ) ( not ( = ?auto_213019 ?auto_213022 ) ) ( not ( = ?auto_213020 ?auto_213022 ) ) ( not ( = ?auto_213021 ?auto_213022 ) ) ( ON ?auto_213015 ?auto_213014 ) ( ON-TABLE ?auto_213022 ) ( ON ?auto_213016 ?auto_213015 ) ( CLEAR ?auto_213018 ) ( ON ?auto_213017 ?auto_213016 ) ( CLEAR ?auto_213017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213022 ?auto_213014 ?auto_213015 ?auto_213016 )
      ( MAKE-8PILE ?auto_213014 ?auto_213015 ?auto_213016 ?auto_213017 ?auto_213018 ?auto_213019 ?auto_213020 ?auto_213021 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213023 - BLOCK
      ?auto_213024 - BLOCK
      ?auto_213025 - BLOCK
      ?auto_213026 - BLOCK
      ?auto_213027 - BLOCK
      ?auto_213028 - BLOCK
      ?auto_213029 - BLOCK
      ?auto_213030 - BLOCK
    )
    :vars
    (
      ?auto_213031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213023 ?auto_213024 ) ) ( not ( = ?auto_213023 ?auto_213025 ) ) ( not ( = ?auto_213023 ?auto_213026 ) ) ( not ( = ?auto_213023 ?auto_213027 ) ) ( not ( = ?auto_213023 ?auto_213028 ) ) ( not ( = ?auto_213023 ?auto_213029 ) ) ( not ( = ?auto_213023 ?auto_213030 ) ) ( not ( = ?auto_213024 ?auto_213025 ) ) ( not ( = ?auto_213024 ?auto_213026 ) ) ( not ( = ?auto_213024 ?auto_213027 ) ) ( not ( = ?auto_213024 ?auto_213028 ) ) ( not ( = ?auto_213024 ?auto_213029 ) ) ( not ( = ?auto_213024 ?auto_213030 ) ) ( not ( = ?auto_213025 ?auto_213026 ) ) ( not ( = ?auto_213025 ?auto_213027 ) ) ( not ( = ?auto_213025 ?auto_213028 ) ) ( not ( = ?auto_213025 ?auto_213029 ) ) ( not ( = ?auto_213025 ?auto_213030 ) ) ( not ( = ?auto_213026 ?auto_213027 ) ) ( not ( = ?auto_213026 ?auto_213028 ) ) ( not ( = ?auto_213026 ?auto_213029 ) ) ( not ( = ?auto_213026 ?auto_213030 ) ) ( not ( = ?auto_213027 ?auto_213028 ) ) ( not ( = ?auto_213027 ?auto_213029 ) ) ( not ( = ?auto_213027 ?auto_213030 ) ) ( not ( = ?auto_213028 ?auto_213029 ) ) ( not ( = ?auto_213028 ?auto_213030 ) ) ( not ( = ?auto_213029 ?auto_213030 ) ) ( ON-TABLE ?auto_213030 ) ( ON ?auto_213029 ?auto_213030 ) ( ON ?auto_213028 ?auto_213029 ) ( ON ?auto_213023 ?auto_213031 ) ( not ( = ?auto_213023 ?auto_213031 ) ) ( not ( = ?auto_213024 ?auto_213031 ) ) ( not ( = ?auto_213025 ?auto_213031 ) ) ( not ( = ?auto_213026 ?auto_213031 ) ) ( not ( = ?auto_213027 ?auto_213031 ) ) ( not ( = ?auto_213028 ?auto_213031 ) ) ( not ( = ?auto_213029 ?auto_213031 ) ) ( not ( = ?auto_213030 ?auto_213031 ) ) ( ON ?auto_213024 ?auto_213023 ) ( ON-TABLE ?auto_213031 ) ( ON ?auto_213025 ?auto_213024 ) ( ON ?auto_213026 ?auto_213025 ) ( CLEAR ?auto_213026 ) ( HOLDING ?auto_213027 ) ( CLEAR ?auto_213028 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213030 ?auto_213029 ?auto_213028 ?auto_213027 )
      ( MAKE-8PILE ?auto_213023 ?auto_213024 ?auto_213025 ?auto_213026 ?auto_213027 ?auto_213028 ?auto_213029 ?auto_213030 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213032 - BLOCK
      ?auto_213033 - BLOCK
      ?auto_213034 - BLOCK
      ?auto_213035 - BLOCK
      ?auto_213036 - BLOCK
      ?auto_213037 - BLOCK
      ?auto_213038 - BLOCK
      ?auto_213039 - BLOCK
    )
    :vars
    (
      ?auto_213040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213032 ?auto_213033 ) ) ( not ( = ?auto_213032 ?auto_213034 ) ) ( not ( = ?auto_213032 ?auto_213035 ) ) ( not ( = ?auto_213032 ?auto_213036 ) ) ( not ( = ?auto_213032 ?auto_213037 ) ) ( not ( = ?auto_213032 ?auto_213038 ) ) ( not ( = ?auto_213032 ?auto_213039 ) ) ( not ( = ?auto_213033 ?auto_213034 ) ) ( not ( = ?auto_213033 ?auto_213035 ) ) ( not ( = ?auto_213033 ?auto_213036 ) ) ( not ( = ?auto_213033 ?auto_213037 ) ) ( not ( = ?auto_213033 ?auto_213038 ) ) ( not ( = ?auto_213033 ?auto_213039 ) ) ( not ( = ?auto_213034 ?auto_213035 ) ) ( not ( = ?auto_213034 ?auto_213036 ) ) ( not ( = ?auto_213034 ?auto_213037 ) ) ( not ( = ?auto_213034 ?auto_213038 ) ) ( not ( = ?auto_213034 ?auto_213039 ) ) ( not ( = ?auto_213035 ?auto_213036 ) ) ( not ( = ?auto_213035 ?auto_213037 ) ) ( not ( = ?auto_213035 ?auto_213038 ) ) ( not ( = ?auto_213035 ?auto_213039 ) ) ( not ( = ?auto_213036 ?auto_213037 ) ) ( not ( = ?auto_213036 ?auto_213038 ) ) ( not ( = ?auto_213036 ?auto_213039 ) ) ( not ( = ?auto_213037 ?auto_213038 ) ) ( not ( = ?auto_213037 ?auto_213039 ) ) ( not ( = ?auto_213038 ?auto_213039 ) ) ( ON-TABLE ?auto_213039 ) ( ON ?auto_213038 ?auto_213039 ) ( ON ?auto_213037 ?auto_213038 ) ( ON ?auto_213032 ?auto_213040 ) ( not ( = ?auto_213032 ?auto_213040 ) ) ( not ( = ?auto_213033 ?auto_213040 ) ) ( not ( = ?auto_213034 ?auto_213040 ) ) ( not ( = ?auto_213035 ?auto_213040 ) ) ( not ( = ?auto_213036 ?auto_213040 ) ) ( not ( = ?auto_213037 ?auto_213040 ) ) ( not ( = ?auto_213038 ?auto_213040 ) ) ( not ( = ?auto_213039 ?auto_213040 ) ) ( ON ?auto_213033 ?auto_213032 ) ( ON-TABLE ?auto_213040 ) ( ON ?auto_213034 ?auto_213033 ) ( ON ?auto_213035 ?auto_213034 ) ( CLEAR ?auto_213037 ) ( ON ?auto_213036 ?auto_213035 ) ( CLEAR ?auto_213036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213040 ?auto_213032 ?auto_213033 ?auto_213034 ?auto_213035 )
      ( MAKE-8PILE ?auto_213032 ?auto_213033 ?auto_213034 ?auto_213035 ?auto_213036 ?auto_213037 ?auto_213038 ?auto_213039 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213041 - BLOCK
      ?auto_213042 - BLOCK
      ?auto_213043 - BLOCK
      ?auto_213044 - BLOCK
      ?auto_213045 - BLOCK
      ?auto_213046 - BLOCK
      ?auto_213047 - BLOCK
      ?auto_213048 - BLOCK
    )
    :vars
    (
      ?auto_213049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213041 ?auto_213042 ) ) ( not ( = ?auto_213041 ?auto_213043 ) ) ( not ( = ?auto_213041 ?auto_213044 ) ) ( not ( = ?auto_213041 ?auto_213045 ) ) ( not ( = ?auto_213041 ?auto_213046 ) ) ( not ( = ?auto_213041 ?auto_213047 ) ) ( not ( = ?auto_213041 ?auto_213048 ) ) ( not ( = ?auto_213042 ?auto_213043 ) ) ( not ( = ?auto_213042 ?auto_213044 ) ) ( not ( = ?auto_213042 ?auto_213045 ) ) ( not ( = ?auto_213042 ?auto_213046 ) ) ( not ( = ?auto_213042 ?auto_213047 ) ) ( not ( = ?auto_213042 ?auto_213048 ) ) ( not ( = ?auto_213043 ?auto_213044 ) ) ( not ( = ?auto_213043 ?auto_213045 ) ) ( not ( = ?auto_213043 ?auto_213046 ) ) ( not ( = ?auto_213043 ?auto_213047 ) ) ( not ( = ?auto_213043 ?auto_213048 ) ) ( not ( = ?auto_213044 ?auto_213045 ) ) ( not ( = ?auto_213044 ?auto_213046 ) ) ( not ( = ?auto_213044 ?auto_213047 ) ) ( not ( = ?auto_213044 ?auto_213048 ) ) ( not ( = ?auto_213045 ?auto_213046 ) ) ( not ( = ?auto_213045 ?auto_213047 ) ) ( not ( = ?auto_213045 ?auto_213048 ) ) ( not ( = ?auto_213046 ?auto_213047 ) ) ( not ( = ?auto_213046 ?auto_213048 ) ) ( not ( = ?auto_213047 ?auto_213048 ) ) ( ON-TABLE ?auto_213048 ) ( ON ?auto_213047 ?auto_213048 ) ( ON ?auto_213041 ?auto_213049 ) ( not ( = ?auto_213041 ?auto_213049 ) ) ( not ( = ?auto_213042 ?auto_213049 ) ) ( not ( = ?auto_213043 ?auto_213049 ) ) ( not ( = ?auto_213044 ?auto_213049 ) ) ( not ( = ?auto_213045 ?auto_213049 ) ) ( not ( = ?auto_213046 ?auto_213049 ) ) ( not ( = ?auto_213047 ?auto_213049 ) ) ( not ( = ?auto_213048 ?auto_213049 ) ) ( ON ?auto_213042 ?auto_213041 ) ( ON-TABLE ?auto_213049 ) ( ON ?auto_213043 ?auto_213042 ) ( ON ?auto_213044 ?auto_213043 ) ( ON ?auto_213045 ?auto_213044 ) ( CLEAR ?auto_213045 ) ( HOLDING ?auto_213046 ) ( CLEAR ?auto_213047 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213048 ?auto_213047 ?auto_213046 )
      ( MAKE-8PILE ?auto_213041 ?auto_213042 ?auto_213043 ?auto_213044 ?auto_213045 ?auto_213046 ?auto_213047 ?auto_213048 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213050 - BLOCK
      ?auto_213051 - BLOCK
      ?auto_213052 - BLOCK
      ?auto_213053 - BLOCK
      ?auto_213054 - BLOCK
      ?auto_213055 - BLOCK
      ?auto_213056 - BLOCK
      ?auto_213057 - BLOCK
    )
    :vars
    (
      ?auto_213058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213050 ?auto_213051 ) ) ( not ( = ?auto_213050 ?auto_213052 ) ) ( not ( = ?auto_213050 ?auto_213053 ) ) ( not ( = ?auto_213050 ?auto_213054 ) ) ( not ( = ?auto_213050 ?auto_213055 ) ) ( not ( = ?auto_213050 ?auto_213056 ) ) ( not ( = ?auto_213050 ?auto_213057 ) ) ( not ( = ?auto_213051 ?auto_213052 ) ) ( not ( = ?auto_213051 ?auto_213053 ) ) ( not ( = ?auto_213051 ?auto_213054 ) ) ( not ( = ?auto_213051 ?auto_213055 ) ) ( not ( = ?auto_213051 ?auto_213056 ) ) ( not ( = ?auto_213051 ?auto_213057 ) ) ( not ( = ?auto_213052 ?auto_213053 ) ) ( not ( = ?auto_213052 ?auto_213054 ) ) ( not ( = ?auto_213052 ?auto_213055 ) ) ( not ( = ?auto_213052 ?auto_213056 ) ) ( not ( = ?auto_213052 ?auto_213057 ) ) ( not ( = ?auto_213053 ?auto_213054 ) ) ( not ( = ?auto_213053 ?auto_213055 ) ) ( not ( = ?auto_213053 ?auto_213056 ) ) ( not ( = ?auto_213053 ?auto_213057 ) ) ( not ( = ?auto_213054 ?auto_213055 ) ) ( not ( = ?auto_213054 ?auto_213056 ) ) ( not ( = ?auto_213054 ?auto_213057 ) ) ( not ( = ?auto_213055 ?auto_213056 ) ) ( not ( = ?auto_213055 ?auto_213057 ) ) ( not ( = ?auto_213056 ?auto_213057 ) ) ( ON-TABLE ?auto_213057 ) ( ON ?auto_213056 ?auto_213057 ) ( ON ?auto_213050 ?auto_213058 ) ( not ( = ?auto_213050 ?auto_213058 ) ) ( not ( = ?auto_213051 ?auto_213058 ) ) ( not ( = ?auto_213052 ?auto_213058 ) ) ( not ( = ?auto_213053 ?auto_213058 ) ) ( not ( = ?auto_213054 ?auto_213058 ) ) ( not ( = ?auto_213055 ?auto_213058 ) ) ( not ( = ?auto_213056 ?auto_213058 ) ) ( not ( = ?auto_213057 ?auto_213058 ) ) ( ON ?auto_213051 ?auto_213050 ) ( ON-TABLE ?auto_213058 ) ( ON ?auto_213052 ?auto_213051 ) ( ON ?auto_213053 ?auto_213052 ) ( ON ?auto_213054 ?auto_213053 ) ( CLEAR ?auto_213056 ) ( ON ?auto_213055 ?auto_213054 ) ( CLEAR ?auto_213055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213058 ?auto_213050 ?auto_213051 ?auto_213052 ?auto_213053 ?auto_213054 )
      ( MAKE-8PILE ?auto_213050 ?auto_213051 ?auto_213052 ?auto_213053 ?auto_213054 ?auto_213055 ?auto_213056 ?auto_213057 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213059 - BLOCK
      ?auto_213060 - BLOCK
      ?auto_213061 - BLOCK
      ?auto_213062 - BLOCK
      ?auto_213063 - BLOCK
      ?auto_213064 - BLOCK
      ?auto_213065 - BLOCK
      ?auto_213066 - BLOCK
    )
    :vars
    (
      ?auto_213067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213059 ?auto_213060 ) ) ( not ( = ?auto_213059 ?auto_213061 ) ) ( not ( = ?auto_213059 ?auto_213062 ) ) ( not ( = ?auto_213059 ?auto_213063 ) ) ( not ( = ?auto_213059 ?auto_213064 ) ) ( not ( = ?auto_213059 ?auto_213065 ) ) ( not ( = ?auto_213059 ?auto_213066 ) ) ( not ( = ?auto_213060 ?auto_213061 ) ) ( not ( = ?auto_213060 ?auto_213062 ) ) ( not ( = ?auto_213060 ?auto_213063 ) ) ( not ( = ?auto_213060 ?auto_213064 ) ) ( not ( = ?auto_213060 ?auto_213065 ) ) ( not ( = ?auto_213060 ?auto_213066 ) ) ( not ( = ?auto_213061 ?auto_213062 ) ) ( not ( = ?auto_213061 ?auto_213063 ) ) ( not ( = ?auto_213061 ?auto_213064 ) ) ( not ( = ?auto_213061 ?auto_213065 ) ) ( not ( = ?auto_213061 ?auto_213066 ) ) ( not ( = ?auto_213062 ?auto_213063 ) ) ( not ( = ?auto_213062 ?auto_213064 ) ) ( not ( = ?auto_213062 ?auto_213065 ) ) ( not ( = ?auto_213062 ?auto_213066 ) ) ( not ( = ?auto_213063 ?auto_213064 ) ) ( not ( = ?auto_213063 ?auto_213065 ) ) ( not ( = ?auto_213063 ?auto_213066 ) ) ( not ( = ?auto_213064 ?auto_213065 ) ) ( not ( = ?auto_213064 ?auto_213066 ) ) ( not ( = ?auto_213065 ?auto_213066 ) ) ( ON-TABLE ?auto_213066 ) ( ON ?auto_213059 ?auto_213067 ) ( not ( = ?auto_213059 ?auto_213067 ) ) ( not ( = ?auto_213060 ?auto_213067 ) ) ( not ( = ?auto_213061 ?auto_213067 ) ) ( not ( = ?auto_213062 ?auto_213067 ) ) ( not ( = ?auto_213063 ?auto_213067 ) ) ( not ( = ?auto_213064 ?auto_213067 ) ) ( not ( = ?auto_213065 ?auto_213067 ) ) ( not ( = ?auto_213066 ?auto_213067 ) ) ( ON ?auto_213060 ?auto_213059 ) ( ON-TABLE ?auto_213067 ) ( ON ?auto_213061 ?auto_213060 ) ( ON ?auto_213062 ?auto_213061 ) ( ON ?auto_213063 ?auto_213062 ) ( ON ?auto_213064 ?auto_213063 ) ( CLEAR ?auto_213064 ) ( HOLDING ?auto_213065 ) ( CLEAR ?auto_213066 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213066 ?auto_213065 )
      ( MAKE-8PILE ?auto_213059 ?auto_213060 ?auto_213061 ?auto_213062 ?auto_213063 ?auto_213064 ?auto_213065 ?auto_213066 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213068 - BLOCK
      ?auto_213069 - BLOCK
      ?auto_213070 - BLOCK
      ?auto_213071 - BLOCK
      ?auto_213072 - BLOCK
      ?auto_213073 - BLOCK
      ?auto_213074 - BLOCK
      ?auto_213075 - BLOCK
    )
    :vars
    (
      ?auto_213076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213068 ?auto_213069 ) ) ( not ( = ?auto_213068 ?auto_213070 ) ) ( not ( = ?auto_213068 ?auto_213071 ) ) ( not ( = ?auto_213068 ?auto_213072 ) ) ( not ( = ?auto_213068 ?auto_213073 ) ) ( not ( = ?auto_213068 ?auto_213074 ) ) ( not ( = ?auto_213068 ?auto_213075 ) ) ( not ( = ?auto_213069 ?auto_213070 ) ) ( not ( = ?auto_213069 ?auto_213071 ) ) ( not ( = ?auto_213069 ?auto_213072 ) ) ( not ( = ?auto_213069 ?auto_213073 ) ) ( not ( = ?auto_213069 ?auto_213074 ) ) ( not ( = ?auto_213069 ?auto_213075 ) ) ( not ( = ?auto_213070 ?auto_213071 ) ) ( not ( = ?auto_213070 ?auto_213072 ) ) ( not ( = ?auto_213070 ?auto_213073 ) ) ( not ( = ?auto_213070 ?auto_213074 ) ) ( not ( = ?auto_213070 ?auto_213075 ) ) ( not ( = ?auto_213071 ?auto_213072 ) ) ( not ( = ?auto_213071 ?auto_213073 ) ) ( not ( = ?auto_213071 ?auto_213074 ) ) ( not ( = ?auto_213071 ?auto_213075 ) ) ( not ( = ?auto_213072 ?auto_213073 ) ) ( not ( = ?auto_213072 ?auto_213074 ) ) ( not ( = ?auto_213072 ?auto_213075 ) ) ( not ( = ?auto_213073 ?auto_213074 ) ) ( not ( = ?auto_213073 ?auto_213075 ) ) ( not ( = ?auto_213074 ?auto_213075 ) ) ( ON-TABLE ?auto_213075 ) ( ON ?auto_213068 ?auto_213076 ) ( not ( = ?auto_213068 ?auto_213076 ) ) ( not ( = ?auto_213069 ?auto_213076 ) ) ( not ( = ?auto_213070 ?auto_213076 ) ) ( not ( = ?auto_213071 ?auto_213076 ) ) ( not ( = ?auto_213072 ?auto_213076 ) ) ( not ( = ?auto_213073 ?auto_213076 ) ) ( not ( = ?auto_213074 ?auto_213076 ) ) ( not ( = ?auto_213075 ?auto_213076 ) ) ( ON ?auto_213069 ?auto_213068 ) ( ON-TABLE ?auto_213076 ) ( ON ?auto_213070 ?auto_213069 ) ( ON ?auto_213071 ?auto_213070 ) ( ON ?auto_213072 ?auto_213071 ) ( ON ?auto_213073 ?auto_213072 ) ( CLEAR ?auto_213075 ) ( ON ?auto_213074 ?auto_213073 ) ( CLEAR ?auto_213074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213076 ?auto_213068 ?auto_213069 ?auto_213070 ?auto_213071 ?auto_213072 ?auto_213073 )
      ( MAKE-8PILE ?auto_213068 ?auto_213069 ?auto_213070 ?auto_213071 ?auto_213072 ?auto_213073 ?auto_213074 ?auto_213075 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213077 - BLOCK
      ?auto_213078 - BLOCK
      ?auto_213079 - BLOCK
      ?auto_213080 - BLOCK
      ?auto_213081 - BLOCK
      ?auto_213082 - BLOCK
      ?auto_213083 - BLOCK
      ?auto_213084 - BLOCK
    )
    :vars
    (
      ?auto_213085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213077 ?auto_213078 ) ) ( not ( = ?auto_213077 ?auto_213079 ) ) ( not ( = ?auto_213077 ?auto_213080 ) ) ( not ( = ?auto_213077 ?auto_213081 ) ) ( not ( = ?auto_213077 ?auto_213082 ) ) ( not ( = ?auto_213077 ?auto_213083 ) ) ( not ( = ?auto_213077 ?auto_213084 ) ) ( not ( = ?auto_213078 ?auto_213079 ) ) ( not ( = ?auto_213078 ?auto_213080 ) ) ( not ( = ?auto_213078 ?auto_213081 ) ) ( not ( = ?auto_213078 ?auto_213082 ) ) ( not ( = ?auto_213078 ?auto_213083 ) ) ( not ( = ?auto_213078 ?auto_213084 ) ) ( not ( = ?auto_213079 ?auto_213080 ) ) ( not ( = ?auto_213079 ?auto_213081 ) ) ( not ( = ?auto_213079 ?auto_213082 ) ) ( not ( = ?auto_213079 ?auto_213083 ) ) ( not ( = ?auto_213079 ?auto_213084 ) ) ( not ( = ?auto_213080 ?auto_213081 ) ) ( not ( = ?auto_213080 ?auto_213082 ) ) ( not ( = ?auto_213080 ?auto_213083 ) ) ( not ( = ?auto_213080 ?auto_213084 ) ) ( not ( = ?auto_213081 ?auto_213082 ) ) ( not ( = ?auto_213081 ?auto_213083 ) ) ( not ( = ?auto_213081 ?auto_213084 ) ) ( not ( = ?auto_213082 ?auto_213083 ) ) ( not ( = ?auto_213082 ?auto_213084 ) ) ( not ( = ?auto_213083 ?auto_213084 ) ) ( ON ?auto_213077 ?auto_213085 ) ( not ( = ?auto_213077 ?auto_213085 ) ) ( not ( = ?auto_213078 ?auto_213085 ) ) ( not ( = ?auto_213079 ?auto_213085 ) ) ( not ( = ?auto_213080 ?auto_213085 ) ) ( not ( = ?auto_213081 ?auto_213085 ) ) ( not ( = ?auto_213082 ?auto_213085 ) ) ( not ( = ?auto_213083 ?auto_213085 ) ) ( not ( = ?auto_213084 ?auto_213085 ) ) ( ON ?auto_213078 ?auto_213077 ) ( ON-TABLE ?auto_213085 ) ( ON ?auto_213079 ?auto_213078 ) ( ON ?auto_213080 ?auto_213079 ) ( ON ?auto_213081 ?auto_213080 ) ( ON ?auto_213082 ?auto_213081 ) ( ON ?auto_213083 ?auto_213082 ) ( CLEAR ?auto_213083 ) ( HOLDING ?auto_213084 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213084 )
      ( MAKE-8PILE ?auto_213077 ?auto_213078 ?auto_213079 ?auto_213080 ?auto_213081 ?auto_213082 ?auto_213083 ?auto_213084 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213086 - BLOCK
      ?auto_213087 - BLOCK
      ?auto_213088 - BLOCK
      ?auto_213089 - BLOCK
      ?auto_213090 - BLOCK
      ?auto_213091 - BLOCK
      ?auto_213092 - BLOCK
      ?auto_213093 - BLOCK
    )
    :vars
    (
      ?auto_213094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213086 ?auto_213087 ) ) ( not ( = ?auto_213086 ?auto_213088 ) ) ( not ( = ?auto_213086 ?auto_213089 ) ) ( not ( = ?auto_213086 ?auto_213090 ) ) ( not ( = ?auto_213086 ?auto_213091 ) ) ( not ( = ?auto_213086 ?auto_213092 ) ) ( not ( = ?auto_213086 ?auto_213093 ) ) ( not ( = ?auto_213087 ?auto_213088 ) ) ( not ( = ?auto_213087 ?auto_213089 ) ) ( not ( = ?auto_213087 ?auto_213090 ) ) ( not ( = ?auto_213087 ?auto_213091 ) ) ( not ( = ?auto_213087 ?auto_213092 ) ) ( not ( = ?auto_213087 ?auto_213093 ) ) ( not ( = ?auto_213088 ?auto_213089 ) ) ( not ( = ?auto_213088 ?auto_213090 ) ) ( not ( = ?auto_213088 ?auto_213091 ) ) ( not ( = ?auto_213088 ?auto_213092 ) ) ( not ( = ?auto_213088 ?auto_213093 ) ) ( not ( = ?auto_213089 ?auto_213090 ) ) ( not ( = ?auto_213089 ?auto_213091 ) ) ( not ( = ?auto_213089 ?auto_213092 ) ) ( not ( = ?auto_213089 ?auto_213093 ) ) ( not ( = ?auto_213090 ?auto_213091 ) ) ( not ( = ?auto_213090 ?auto_213092 ) ) ( not ( = ?auto_213090 ?auto_213093 ) ) ( not ( = ?auto_213091 ?auto_213092 ) ) ( not ( = ?auto_213091 ?auto_213093 ) ) ( not ( = ?auto_213092 ?auto_213093 ) ) ( ON ?auto_213086 ?auto_213094 ) ( not ( = ?auto_213086 ?auto_213094 ) ) ( not ( = ?auto_213087 ?auto_213094 ) ) ( not ( = ?auto_213088 ?auto_213094 ) ) ( not ( = ?auto_213089 ?auto_213094 ) ) ( not ( = ?auto_213090 ?auto_213094 ) ) ( not ( = ?auto_213091 ?auto_213094 ) ) ( not ( = ?auto_213092 ?auto_213094 ) ) ( not ( = ?auto_213093 ?auto_213094 ) ) ( ON ?auto_213087 ?auto_213086 ) ( ON-TABLE ?auto_213094 ) ( ON ?auto_213088 ?auto_213087 ) ( ON ?auto_213089 ?auto_213088 ) ( ON ?auto_213090 ?auto_213089 ) ( ON ?auto_213091 ?auto_213090 ) ( ON ?auto_213092 ?auto_213091 ) ( ON ?auto_213093 ?auto_213092 ) ( CLEAR ?auto_213093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213094 ?auto_213086 ?auto_213087 ?auto_213088 ?auto_213089 ?auto_213090 ?auto_213091 ?auto_213092 )
      ( MAKE-8PILE ?auto_213086 ?auto_213087 ?auto_213088 ?auto_213089 ?auto_213090 ?auto_213091 ?auto_213092 ?auto_213093 ) )
  )

)

