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
      ?auto_40894 - BLOCK
      ?auto_40895 - BLOCK
      ?auto_40896 - BLOCK
      ?auto_40897 - BLOCK
      ?auto_40898 - BLOCK
      ?auto_40899 - BLOCK
    )
    :vars
    (
      ?auto_40900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40900 ?auto_40899 ) ( CLEAR ?auto_40900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40894 ) ( ON ?auto_40895 ?auto_40894 ) ( ON ?auto_40896 ?auto_40895 ) ( ON ?auto_40897 ?auto_40896 ) ( ON ?auto_40898 ?auto_40897 ) ( ON ?auto_40899 ?auto_40898 ) ( not ( = ?auto_40894 ?auto_40895 ) ) ( not ( = ?auto_40894 ?auto_40896 ) ) ( not ( = ?auto_40894 ?auto_40897 ) ) ( not ( = ?auto_40894 ?auto_40898 ) ) ( not ( = ?auto_40894 ?auto_40899 ) ) ( not ( = ?auto_40894 ?auto_40900 ) ) ( not ( = ?auto_40895 ?auto_40896 ) ) ( not ( = ?auto_40895 ?auto_40897 ) ) ( not ( = ?auto_40895 ?auto_40898 ) ) ( not ( = ?auto_40895 ?auto_40899 ) ) ( not ( = ?auto_40895 ?auto_40900 ) ) ( not ( = ?auto_40896 ?auto_40897 ) ) ( not ( = ?auto_40896 ?auto_40898 ) ) ( not ( = ?auto_40896 ?auto_40899 ) ) ( not ( = ?auto_40896 ?auto_40900 ) ) ( not ( = ?auto_40897 ?auto_40898 ) ) ( not ( = ?auto_40897 ?auto_40899 ) ) ( not ( = ?auto_40897 ?auto_40900 ) ) ( not ( = ?auto_40898 ?auto_40899 ) ) ( not ( = ?auto_40898 ?auto_40900 ) ) ( not ( = ?auto_40899 ?auto_40900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40900 ?auto_40899 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40902 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_40902 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_40902 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40903 - BLOCK
    )
    :vars
    (
      ?auto_40904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40903 ?auto_40904 ) ( CLEAR ?auto_40903 ) ( HAND-EMPTY ) ( not ( = ?auto_40903 ?auto_40904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40903 ?auto_40904 )
      ( MAKE-1PILE ?auto_40903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40910 - BLOCK
      ?auto_40911 - BLOCK
      ?auto_40912 - BLOCK
      ?auto_40913 - BLOCK
      ?auto_40914 - BLOCK
    )
    :vars
    (
      ?auto_40915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40915 ?auto_40914 ) ( CLEAR ?auto_40915 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40910 ) ( ON ?auto_40911 ?auto_40910 ) ( ON ?auto_40912 ?auto_40911 ) ( ON ?auto_40913 ?auto_40912 ) ( ON ?auto_40914 ?auto_40913 ) ( not ( = ?auto_40910 ?auto_40911 ) ) ( not ( = ?auto_40910 ?auto_40912 ) ) ( not ( = ?auto_40910 ?auto_40913 ) ) ( not ( = ?auto_40910 ?auto_40914 ) ) ( not ( = ?auto_40910 ?auto_40915 ) ) ( not ( = ?auto_40911 ?auto_40912 ) ) ( not ( = ?auto_40911 ?auto_40913 ) ) ( not ( = ?auto_40911 ?auto_40914 ) ) ( not ( = ?auto_40911 ?auto_40915 ) ) ( not ( = ?auto_40912 ?auto_40913 ) ) ( not ( = ?auto_40912 ?auto_40914 ) ) ( not ( = ?auto_40912 ?auto_40915 ) ) ( not ( = ?auto_40913 ?auto_40914 ) ) ( not ( = ?auto_40913 ?auto_40915 ) ) ( not ( = ?auto_40914 ?auto_40915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40915 ?auto_40914 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40916 - BLOCK
      ?auto_40917 - BLOCK
      ?auto_40918 - BLOCK
      ?auto_40919 - BLOCK
      ?auto_40920 - BLOCK
    )
    :vars
    (
      ?auto_40921 - BLOCK
      ?auto_40922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40921 ?auto_40920 ) ( CLEAR ?auto_40921 ) ( ON-TABLE ?auto_40916 ) ( ON ?auto_40917 ?auto_40916 ) ( ON ?auto_40918 ?auto_40917 ) ( ON ?auto_40919 ?auto_40918 ) ( ON ?auto_40920 ?auto_40919 ) ( not ( = ?auto_40916 ?auto_40917 ) ) ( not ( = ?auto_40916 ?auto_40918 ) ) ( not ( = ?auto_40916 ?auto_40919 ) ) ( not ( = ?auto_40916 ?auto_40920 ) ) ( not ( = ?auto_40916 ?auto_40921 ) ) ( not ( = ?auto_40917 ?auto_40918 ) ) ( not ( = ?auto_40917 ?auto_40919 ) ) ( not ( = ?auto_40917 ?auto_40920 ) ) ( not ( = ?auto_40917 ?auto_40921 ) ) ( not ( = ?auto_40918 ?auto_40919 ) ) ( not ( = ?auto_40918 ?auto_40920 ) ) ( not ( = ?auto_40918 ?auto_40921 ) ) ( not ( = ?auto_40919 ?auto_40920 ) ) ( not ( = ?auto_40919 ?auto_40921 ) ) ( not ( = ?auto_40920 ?auto_40921 ) ) ( HOLDING ?auto_40922 ) ( not ( = ?auto_40916 ?auto_40922 ) ) ( not ( = ?auto_40917 ?auto_40922 ) ) ( not ( = ?auto_40918 ?auto_40922 ) ) ( not ( = ?auto_40919 ?auto_40922 ) ) ( not ( = ?auto_40920 ?auto_40922 ) ) ( not ( = ?auto_40921 ?auto_40922 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_40922 )
      ( MAKE-5PILE ?auto_40916 ?auto_40917 ?auto_40918 ?auto_40919 ?auto_40920 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40923 - BLOCK
      ?auto_40924 - BLOCK
      ?auto_40925 - BLOCK
      ?auto_40926 - BLOCK
      ?auto_40927 - BLOCK
    )
    :vars
    (
      ?auto_40928 - BLOCK
      ?auto_40929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40928 ?auto_40927 ) ( ON-TABLE ?auto_40923 ) ( ON ?auto_40924 ?auto_40923 ) ( ON ?auto_40925 ?auto_40924 ) ( ON ?auto_40926 ?auto_40925 ) ( ON ?auto_40927 ?auto_40926 ) ( not ( = ?auto_40923 ?auto_40924 ) ) ( not ( = ?auto_40923 ?auto_40925 ) ) ( not ( = ?auto_40923 ?auto_40926 ) ) ( not ( = ?auto_40923 ?auto_40927 ) ) ( not ( = ?auto_40923 ?auto_40928 ) ) ( not ( = ?auto_40924 ?auto_40925 ) ) ( not ( = ?auto_40924 ?auto_40926 ) ) ( not ( = ?auto_40924 ?auto_40927 ) ) ( not ( = ?auto_40924 ?auto_40928 ) ) ( not ( = ?auto_40925 ?auto_40926 ) ) ( not ( = ?auto_40925 ?auto_40927 ) ) ( not ( = ?auto_40925 ?auto_40928 ) ) ( not ( = ?auto_40926 ?auto_40927 ) ) ( not ( = ?auto_40926 ?auto_40928 ) ) ( not ( = ?auto_40927 ?auto_40928 ) ) ( not ( = ?auto_40923 ?auto_40929 ) ) ( not ( = ?auto_40924 ?auto_40929 ) ) ( not ( = ?auto_40925 ?auto_40929 ) ) ( not ( = ?auto_40926 ?auto_40929 ) ) ( not ( = ?auto_40927 ?auto_40929 ) ) ( not ( = ?auto_40928 ?auto_40929 ) ) ( ON ?auto_40929 ?auto_40928 ) ( CLEAR ?auto_40929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40923 ?auto_40924 ?auto_40925 ?auto_40926 ?auto_40927 ?auto_40928 )
      ( MAKE-5PILE ?auto_40923 ?auto_40924 ?auto_40925 ?auto_40926 ?auto_40927 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40932 - BLOCK
      ?auto_40933 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_40933 ) ( CLEAR ?auto_40932 ) ( ON-TABLE ?auto_40932 ) ( not ( = ?auto_40932 ?auto_40933 ) ) )
    :subtasks
    ( ( !STACK ?auto_40933 ?auto_40932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40934 - BLOCK
      ?auto_40935 - BLOCK
    )
    :vars
    (
      ?auto_40936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40934 ) ( ON-TABLE ?auto_40934 ) ( not ( = ?auto_40934 ?auto_40935 ) ) ( ON ?auto_40935 ?auto_40936 ) ( CLEAR ?auto_40935 ) ( HAND-EMPTY ) ( not ( = ?auto_40934 ?auto_40936 ) ) ( not ( = ?auto_40935 ?auto_40936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40935 ?auto_40936 )
      ( MAKE-2PILE ?auto_40934 ?auto_40935 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40937 - BLOCK
      ?auto_40938 - BLOCK
    )
    :vars
    (
      ?auto_40939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40937 ?auto_40938 ) ) ( ON ?auto_40938 ?auto_40939 ) ( CLEAR ?auto_40938 ) ( not ( = ?auto_40937 ?auto_40939 ) ) ( not ( = ?auto_40938 ?auto_40939 ) ) ( HOLDING ?auto_40937 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40937 )
      ( MAKE-2PILE ?auto_40937 ?auto_40938 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40940 - BLOCK
      ?auto_40941 - BLOCK
    )
    :vars
    (
      ?auto_40942 - BLOCK
      ?auto_40943 - BLOCK
      ?auto_40945 - BLOCK
      ?auto_40944 - BLOCK
      ?auto_40946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40940 ?auto_40941 ) ) ( ON ?auto_40941 ?auto_40942 ) ( not ( = ?auto_40940 ?auto_40942 ) ) ( not ( = ?auto_40941 ?auto_40942 ) ) ( ON ?auto_40940 ?auto_40941 ) ( CLEAR ?auto_40940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40943 ) ( ON ?auto_40945 ?auto_40943 ) ( ON ?auto_40944 ?auto_40945 ) ( ON ?auto_40946 ?auto_40944 ) ( ON ?auto_40942 ?auto_40946 ) ( not ( = ?auto_40943 ?auto_40945 ) ) ( not ( = ?auto_40943 ?auto_40944 ) ) ( not ( = ?auto_40943 ?auto_40946 ) ) ( not ( = ?auto_40943 ?auto_40942 ) ) ( not ( = ?auto_40943 ?auto_40941 ) ) ( not ( = ?auto_40943 ?auto_40940 ) ) ( not ( = ?auto_40945 ?auto_40944 ) ) ( not ( = ?auto_40945 ?auto_40946 ) ) ( not ( = ?auto_40945 ?auto_40942 ) ) ( not ( = ?auto_40945 ?auto_40941 ) ) ( not ( = ?auto_40945 ?auto_40940 ) ) ( not ( = ?auto_40944 ?auto_40946 ) ) ( not ( = ?auto_40944 ?auto_40942 ) ) ( not ( = ?auto_40944 ?auto_40941 ) ) ( not ( = ?auto_40944 ?auto_40940 ) ) ( not ( = ?auto_40946 ?auto_40942 ) ) ( not ( = ?auto_40946 ?auto_40941 ) ) ( not ( = ?auto_40946 ?auto_40940 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40943 ?auto_40945 ?auto_40944 ?auto_40946 ?auto_40942 ?auto_40941 )
      ( MAKE-2PILE ?auto_40940 ?auto_40941 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40951 - BLOCK
      ?auto_40952 - BLOCK
      ?auto_40953 - BLOCK
      ?auto_40954 - BLOCK
    )
    :vars
    (
      ?auto_40955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40955 ?auto_40954 ) ( CLEAR ?auto_40955 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40951 ) ( ON ?auto_40952 ?auto_40951 ) ( ON ?auto_40953 ?auto_40952 ) ( ON ?auto_40954 ?auto_40953 ) ( not ( = ?auto_40951 ?auto_40952 ) ) ( not ( = ?auto_40951 ?auto_40953 ) ) ( not ( = ?auto_40951 ?auto_40954 ) ) ( not ( = ?auto_40951 ?auto_40955 ) ) ( not ( = ?auto_40952 ?auto_40953 ) ) ( not ( = ?auto_40952 ?auto_40954 ) ) ( not ( = ?auto_40952 ?auto_40955 ) ) ( not ( = ?auto_40953 ?auto_40954 ) ) ( not ( = ?auto_40953 ?auto_40955 ) ) ( not ( = ?auto_40954 ?auto_40955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40955 ?auto_40954 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40956 - BLOCK
      ?auto_40957 - BLOCK
      ?auto_40958 - BLOCK
      ?auto_40959 - BLOCK
    )
    :vars
    (
      ?auto_40960 - BLOCK
      ?auto_40961 - BLOCK
      ?auto_40962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40960 ?auto_40959 ) ( CLEAR ?auto_40960 ) ( ON-TABLE ?auto_40956 ) ( ON ?auto_40957 ?auto_40956 ) ( ON ?auto_40958 ?auto_40957 ) ( ON ?auto_40959 ?auto_40958 ) ( not ( = ?auto_40956 ?auto_40957 ) ) ( not ( = ?auto_40956 ?auto_40958 ) ) ( not ( = ?auto_40956 ?auto_40959 ) ) ( not ( = ?auto_40956 ?auto_40960 ) ) ( not ( = ?auto_40957 ?auto_40958 ) ) ( not ( = ?auto_40957 ?auto_40959 ) ) ( not ( = ?auto_40957 ?auto_40960 ) ) ( not ( = ?auto_40958 ?auto_40959 ) ) ( not ( = ?auto_40958 ?auto_40960 ) ) ( not ( = ?auto_40959 ?auto_40960 ) ) ( HOLDING ?auto_40961 ) ( CLEAR ?auto_40962 ) ( not ( = ?auto_40956 ?auto_40961 ) ) ( not ( = ?auto_40956 ?auto_40962 ) ) ( not ( = ?auto_40957 ?auto_40961 ) ) ( not ( = ?auto_40957 ?auto_40962 ) ) ( not ( = ?auto_40958 ?auto_40961 ) ) ( not ( = ?auto_40958 ?auto_40962 ) ) ( not ( = ?auto_40959 ?auto_40961 ) ) ( not ( = ?auto_40959 ?auto_40962 ) ) ( not ( = ?auto_40960 ?auto_40961 ) ) ( not ( = ?auto_40960 ?auto_40962 ) ) ( not ( = ?auto_40961 ?auto_40962 ) ) )
    :subtasks
    ( ( !STACK ?auto_40961 ?auto_40962 )
      ( MAKE-4PILE ?auto_40956 ?auto_40957 ?auto_40958 ?auto_40959 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41562 - BLOCK
      ?auto_41563 - BLOCK
      ?auto_41564 - BLOCK
      ?auto_41565 - BLOCK
    )
    :vars
    (
      ?auto_41567 - BLOCK
      ?auto_41566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41567 ?auto_41565 ) ( ON-TABLE ?auto_41562 ) ( ON ?auto_41563 ?auto_41562 ) ( ON ?auto_41564 ?auto_41563 ) ( ON ?auto_41565 ?auto_41564 ) ( not ( = ?auto_41562 ?auto_41563 ) ) ( not ( = ?auto_41562 ?auto_41564 ) ) ( not ( = ?auto_41562 ?auto_41565 ) ) ( not ( = ?auto_41562 ?auto_41567 ) ) ( not ( = ?auto_41563 ?auto_41564 ) ) ( not ( = ?auto_41563 ?auto_41565 ) ) ( not ( = ?auto_41563 ?auto_41567 ) ) ( not ( = ?auto_41564 ?auto_41565 ) ) ( not ( = ?auto_41564 ?auto_41567 ) ) ( not ( = ?auto_41565 ?auto_41567 ) ) ( not ( = ?auto_41562 ?auto_41566 ) ) ( not ( = ?auto_41563 ?auto_41566 ) ) ( not ( = ?auto_41564 ?auto_41566 ) ) ( not ( = ?auto_41565 ?auto_41566 ) ) ( not ( = ?auto_41567 ?auto_41566 ) ) ( ON ?auto_41566 ?auto_41567 ) ( CLEAR ?auto_41566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41562 ?auto_41563 ?auto_41564 ?auto_41565 ?auto_41567 )
      ( MAKE-4PILE ?auto_41562 ?auto_41563 ?auto_41564 ?auto_41565 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40970 - BLOCK
      ?auto_40971 - BLOCK
      ?auto_40972 - BLOCK
      ?auto_40973 - BLOCK
    )
    :vars
    (
      ?auto_40976 - BLOCK
      ?auto_40975 - BLOCK
      ?auto_40974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40976 ?auto_40973 ) ( ON-TABLE ?auto_40970 ) ( ON ?auto_40971 ?auto_40970 ) ( ON ?auto_40972 ?auto_40971 ) ( ON ?auto_40973 ?auto_40972 ) ( not ( = ?auto_40970 ?auto_40971 ) ) ( not ( = ?auto_40970 ?auto_40972 ) ) ( not ( = ?auto_40970 ?auto_40973 ) ) ( not ( = ?auto_40970 ?auto_40976 ) ) ( not ( = ?auto_40971 ?auto_40972 ) ) ( not ( = ?auto_40971 ?auto_40973 ) ) ( not ( = ?auto_40971 ?auto_40976 ) ) ( not ( = ?auto_40972 ?auto_40973 ) ) ( not ( = ?auto_40972 ?auto_40976 ) ) ( not ( = ?auto_40973 ?auto_40976 ) ) ( not ( = ?auto_40970 ?auto_40975 ) ) ( not ( = ?auto_40970 ?auto_40974 ) ) ( not ( = ?auto_40971 ?auto_40975 ) ) ( not ( = ?auto_40971 ?auto_40974 ) ) ( not ( = ?auto_40972 ?auto_40975 ) ) ( not ( = ?auto_40972 ?auto_40974 ) ) ( not ( = ?auto_40973 ?auto_40975 ) ) ( not ( = ?auto_40973 ?auto_40974 ) ) ( not ( = ?auto_40976 ?auto_40975 ) ) ( not ( = ?auto_40976 ?auto_40974 ) ) ( not ( = ?auto_40975 ?auto_40974 ) ) ( ON ?auto_40975 ?auto_40976 ) ( CLEAR ?auto_40975 ) ( HOLDING ?auto_40974 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40974 )
      ( MAKE-4PILE ?auto_40970 ?auto_40971 ?auto_40972 ?auto_40973 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40977 - BLOCK
      ?auto_40978 - BLOCK
      ?auto_40979 - BLOCK
      ?auto_40980 - BLOCK
    )
    :vars
    (
      ?auto_40981 - BLOCK
      ?auto_40983 - BLOCK
      ?auto_40982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40981 ?auto_40980 ) ( ON-TABLE ?auto_40977 ) ( ON ?auto_40978 ?auto_40977 ) ( ON ?auto_40979 ?auto_40978 ) ( ON ?auto_40980 ?auto_40979 ) ( not ( = ?auto_40977 ?auto_40978 ) ) ( not ( = ?auto_40977 ?auto_40979 ) ) ( not ( = ?auto_40977 ?auto_40980 ) ) ( not ( = ?auto_40977 ?auto_40981 ) ) ( not ( = ?auto_40978 ?auto_40979 ) ) ( not ( = ?auto_40978 ?auto_40980 ) ) ( not ( = ?auto_40978 ?auto_40981 ) ) ( not ( = ?auto_40979 ?auto_40980 ) ) ( not ( = ?auto_40979 ?auto_40981 ) ) ( not ( = ?auto_40980 ?auto_40981 ) ) ( not ( = ?auto_40977 ?auto_40983 ) ) ( not ( = ?auto_40977 ?auto_40982 ) ) ( not ( = ?auto_40978 ?auto_40983 ) ) ( not ( = ?auto_40978 ?auto_40982 ) ) ( not ( = ?auto_40979 ?auto_40983 ) ) ( not ( = ?auto_40979 ?auto_40982 ) ) ( not ( = ?auto_40980 ?auto_40983 ) ) ( not ( = ?auto_40980 ?auto_40982 ) ) ( not ( = ?auto_40981 ?auto_40983 ) ) ( not ( = ?auto_40981 ?auto_40982 ) ) ( not ( = ?auto_40983 ?auto_40982 ) ) ( ON ?auto_40983 ?auto_40981 ) ( ON ?auto_40982 ?auto_40983 ) ( CLEAR ?auto_40982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40977 ?auto_40978 ?auto_40979 ?auto_40980 ?auto_40981 ?auto_40983 )
      ( MAKE-4PILE ?auto_40977 ?auto_40978 ?auto_40979 ?auto_40980 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40987 - BLOCK
      ?auto_40988 - BLOCK
      ?auto_40989 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_40989 ) ( CLEAR ?auto_40988 ) ( ON-TABLE ?auto_40987 ) ( ON ?auto_40988 ?auto_40987 ) ( not ( = ?auto_40987 ?auto_40988 ) ) ( not ( = ?auto_40987 ?auto_40989 ) ) ( not ( = ?auto_40988 ?auto_40989 ) ) )
    :subtasks
    ( ( !STACK ?auto_40989 ?auto_40988 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40990 - BLOCK
      ?auto_40991 - BLOCK
      ?auto_40992 - BLOCK
    )
    :vars
    (
      ?auto_40993 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40991 ) ( ON-TABLE ?auto_40990 ) ( ON ?auto_40991 ?auto_40990 ) ( not ( = ?auto_40990 ?auto_40991 ) ) ( not ( = ?auto_40990 ?auto_40992 ) ) ( not ( = ?auto_40991 ?auto_40992 ) ) ( ON ?auto_40992 ?auto_40993 ) ( CLEAR ?auto_40992 ) ( HAND-EMPTY ) ( not ( = ?auto_40990 ?auto_40993 ) ) ( not ( = ?auto_40991 ?auto_40993 ) ) ( not ( = ?auto_40992 ?auto_40993 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40992 ?auto_40993 )
      ( MAKE-3PILE ?auto_40990 ?auto_40991 ?auto_40992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40994 - BLOCK
      ?auto_40995 - BLOCK
      ?auto_40996 - BLOCK
    )
    :vars
    (
      ?auto_40997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40994 ) ( not ( = ?auto_40994 ?auto_40995 ) ) ( not ( = ?auto_40994 ?auto_40996 ) ) ( not ( = ?auto_40995 ?auto_40996 ) ) ( ON ?auto_40996 ?auto_40997 ) ( CLEAR ?auto_40996 ) ( not ( = ?auto_40994 ?auto_40997 ) ) ( not ( = ?auto_40995 ?auto_40997 ) ) ( not ( = ?auto_40996 ?auto_40997 ) ) ( HOLDING ?auto_40995 ) ( CLEAR ?auto_40994 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40994 ?auto_40995 )
      ( MAKE-3PILE ?auto_40994 ?auto_40995 ?auto_40996 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40998 - BLOCK
      ?auto_40999 - BLOCK
      ?auto_41000 - BLOCK
    )
    :vars
    (
      ?auto_41001 - BLOCK
      ?auto_41003 - BLOCK
      ?auto_41004 - BLOCK
      ?auto_41002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40998 ) ( not ( = ?auto_40998 ?auto_40999 ) ) ( not ( = ?auto_40998 ?auto_41000 ) ) ( not ( = ?auto_40999 ?auto_41000 ) ) ( ON ?auto_41000 ?auto_41001 ) ( not ( = ?auto_40998 ?auto_41001 ) ) ( not ( = ?auto_40999 ?auto_41001 ) ) ( not ( = ?auto_41000 ?auto_41001 ) ) ( CLEAR ?auto_40998 ) ( ON ?auto_40999 ?auto_41000 ) ( CLEAR ?auto_40999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41003 ) ( ON ?auto_41004 ?auto_41003 ) ( ON ?auto_41002 ?auto_41004 ) ( ON ?auto_41001 ?auto_41002 ) ( not ( = ?auto_41003 ?auto_41004 ) ) ( not ( = ?auto_41003 ?auto_41002 ) ) ( not ( = ?auto_41003 ?auto_41001 ) ) ( not ( = ?auto_41003 ?auto_41000 ) ) ( not ( = ?auto_41003 ?auto_40999 ) ) ( not ( = ?auto_41004 ?auto_41002 ) ) ( not ( = ?auto_41004 ?auto_41001 ) ) ( not ( = ?auto_41004 ?auto_41000 ) ) ( not ( = ?auto_41004 ?auto_40999 ) ) ( not ( = ?auto_41002 ?auto_41001 ) ) ( not ( = ?auto_41002 ?auto_41000 ) ) ( not ( = ?auto_41002 ?auto_40999 ) ) ( not ( = ?auto_40998 ?auto_41003 ) ) ( not ( = ?auto_40998 ?auto_41004 ) ) ( not ( = ?auto_40998 ?auto_41002 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41003 ?auto_41004 ?auto_41002 ?auto_41001 ?auto_41000 )
      ( MAKE-3PILE ?auto_40998 ?auto_40999 ?auto_41000 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41005 - BLOCK
      ?auto_41006 - BLOCK
      ?auto_41007 - BLOCK
    )
    :vars
    (
      ?auto_41010 - BLOCK
      ?auto_41009 - BLOCK
      ?auto_41008 - BLOCK
      ?auto_41011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41005 ?auto_41006 ) ) ( not ( = ?auto_41005 ?auto_41007 ) ) ( not ( = ?auto_41006 ?auto_41007 ) ) ( ON ?auto_41007 ?auto_41010 ) ( not ( = ?auto_41005 ?auto_41010 ) ) ( not ( = ?auto_41006 ?auto_41010 ) ) ( not ( = ?auto_41007 ?auto_41010 ) ) ( ON ?auto_41006 ?auto_41007 ) ( CLEAR ?auto_41006 ) ( ON-TABLE ?auto_41009 ) ( ON ?auto_41008 ?auto_41009 ) ( ON ?auto_41011 ?auto_41008 ) ( ON ?auto_41010 ?auto_41011 ) ( not ( = ?auto_41009 ?auto_41008 ) ) ( not ( = ?auto_41009 ?auto_41011 ) ) ( not ( = ?auto_41009 ?auto_41010 ) ) ( not ( = ?auto_41009 ?auto_41007 ) ) ( not ( = ?auto_41009 ?auto_41006 ) ) ( not ( = ?auto_41008 ?auto_41011 ) ) ( not ( = ?auto_41008 ?auto_41010 ) ) ( not ( = ?auto_41008 ?auto_41007 ) ) ( not ( = ?auto_41008 ?auto_41006 ) ) ( not ( = ?auto_41011 ?auto_41010 ) ) ( not ( = ?auto_41011 ?auto_41007 ) ) ( not ( = ?auto_41011 ?auto_41006 ) ) ( not ( = ?auto_41005 ?auto_41009 ) ) ( not ( = ?auto_41005 ?auto_41008 ) ) ( not ( = ?auto_41005 ?auto_41011 ) ) ( HOLDING ?auto_41005 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41005 )
      ( MAKE-3PILE ?auto_41005 ?auto_41006 ?auto_41007 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41012 - BLOCK
      ?auto_41013 - BLOCK
      ?auto_41014 - BLOCK
    )
    :vars
    (
      ?auto_41018 - BLOCK
      ?auto_41016 - BLOCK
      ?auto_41017 - BLOCK
      ?auto_41015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41012 ?auto_41013 ) ) ( not ( = ?auto_41012 ?auto_41014 ) ) ( not ( = ?auto_41013 ?auto_41014 ) ) ( ON ?auto_41014 ?auto_41018 ) ( not ( = ?auto_41012 ?auto_41018 ) ) ( not ( = ?auto_41013 ?auto_41018 ) ) ( not ( = ?auto_41014 ?auto_41018 ) ) ( ON ?auto_41013 ?auto_41014 ) ( ON-TABLE ?auto_41016 ) ( ON ?auto_41017 ?auto_41016 ) ( ON ?auto_41015 ?auto_41017 ) ( ON ?auto_41018 ?auto_41015 ) ( not ( = ?auto_41016 ?auto_41017 ) ) ( not ( = ?auto_41016 ?auto_41015 ) ) ( not ( = ?auto_41016 ?auto_41018 ) ) ( not ( = ?auto_41016 ?auto_41014 ) ) ( not ( = ?auto_41016 ?auto_41013 ) ) ( not ( = ?auto_41017 ?auto_41015 ) ) ( not ( = ?auto_41017 ?auto_41018 ) ) ( not ( = ?auto_41017 ?auto_41014 ) ) ( not ( = ?auto_41017 ?auto_41013 ) ) ( not ( = ?auto_41015 ?auto_41018 ) ) ( not ( = ?auto_41015 ?auto_41014 ) ) ( not ( = ?auto_41015 ?auto_41013 ) ) ( not ( = ?auto_41012 ?auto_41016 ) ) ( not ( = ?auto_41012 ?auto_41017 ) ) ( not ( = ?auto_41012 ?auto_41015 ) ) ( ON ?auto_41012 ?auto_41013 ) ( CLEAR ?auto_41012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41016 ?auto_41017 ?auto_41015 ?auto_41018 ?auto_41014 ?auto_41013 )
      ( MAKE-3PILE ?auto_41012 ?auto_41013 ?auto_41014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41022 - BLOCK
      ?auto_41023 - BLOCK
      ?auto_41024 - BLOCK
    )
    :vars
    (
      ?auto_41025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41025 ?auto_41024 ) ( CLEAR ?auto_41025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41022 ) ( ON ?auto_41023 ?auto_41022 ) ( ON ?auto_41024 ?auto_41023 ) ( not ( = ?auto_41022 ?auto_41023 ) ) ( not ( = ?auto_41022 ?auto_41024 ) ) ( not ( = ?auto_41022 ?auto_41025 ) ) ( not ( = ?auto_41023 ?auto_41024 ) ) ( not ( = ?auto_41023 ?auto_41025 ) ) ( not ( = ?auto_41024 ?auto_41025 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41025 ?auto_41024 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41026 - BLOCK
      ?auto_41027 - BLOCK
      ?auto_41028 - BLOCK
    )
    :vars
    (
      ?auto_41029 - BLOCK
      ?auto_41030 - BLOCK
      ?auto_41031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41029 ?auto_41028 ) ( CLEAR ?auto_41029 ) ( ON-TABLE ?auto_41026 ) ( ON ?auto_41027 ?auto_41026 ) ( ON ?auto_41028 ?auto_41027 ) ( not ( = ?auto_41026 ?auto_41027 ) ) ( not ( = ?auto_41026 ?auto_41028 ) ) ( not ( = ?auto_41026 ?auto_41029 ) ) ( not ( = ?auto_41027 ?auto_41028 ) ) ( not ( = ?auto_41027 ?auto_41029 ) ) ( not ( = ?auto_41028 ?auto_41029 ) ) ( HOLDING ?auto_41030 ) ( CLEAR ?auto_41031 ) ( not ( = ?auto_41026 ?auto_41030 ) ) ( not ( = ?auto_41026 ?auto_41031 ) ) ( not ( = ?auto_41027 ?auto_41030 ) ) ( not ( = ?auto_41027 ?auto_41031 ) ) ( not ( = ?auto_41028 ?auto_41030 ) ) ( not ( = ?auto_41028 ?auto_41031 ) ) ( not ( = ?auto_41029 ?auto_41030 ) ) ( not ( = ?auto_41029 ?auto_41031 ) ) ( not ( = ?auto_41030 ?auto_41031 ) ) )
    :subtasks
    ( ( !STACK ?auto_41030 ?auto_41031 )
      ( MAKE-3PILE ?auto_41026 ?auto_41027 ?auto_41028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41032 - BLOCK
      ?auto_41033 - BLOCK
      ?auto_41034 - BLOCK
    )
    :vars
    (
      ?auto_41036 - BLOCK
      ?auto_41035 - BLOCK
      ?auto_41037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41036 ?auto_41034 ) ( ON-TABLE ?auto_41032 ) ( ON ?auto_41033 ?auto_41032 ) ( ON ?auto_41034 ?auto_41033 ) ( not ( = ?auto_41032 ?auto_41033 ) ) ( not ( = ?auto_41032 ?auto_41034 ) ) ( not ( = ?auto_41032 ?auto_41036 ) ) ( not ( = ?auto_41033 ?auto_41034 ) ) ( not ( = ?auto_41033 ?auto_41036 ) ) ( not ( = ?auto_41034 ?auto_41036 ) ) ( CLEAR ?auto_41035 ) ( not ( = ?auto_41032 ?auto_41037 ) ) ( not ( = ?auto_41032 ?auto_41035 ) ) ( not ( = ?auto_41033 ?auto_41037 ) ) ( not ( = ?auto_41033 ?auto_41035 ) ) ( not ( = ?auto_41034 ?auto_41037 ) ) ( not ( = ?auto_41034 ?auto_41035 ) ) ( not ( = ?auto_41036 ?auto_41037 ) ) ( not ( = ?auto_41036 ?auto_41035 ) ) ( not ( = ?auto_41037 ?auto_41035 ) ) ( ON ?auto_41037 ?auto_41036 ) ( CLEAR ?auto_41037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41032 ?auto_41033 ?auto_41034 ?auto_41036 )
      ( MAKE-3PILE ?auto_41032 ?auto_41033 ?auto_41034 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41038 - BLOCK
      ?auto_41039 - BLOCK
      ?auto_41040 - BLOCK
    )
    :vars
    (
      ?auto_41042 - BLOCK
      ?auto_41041 - BLOCK
      ?auto_41043 - BLOCK
      ?auto_41044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41042 ?auto_41040 ) ( ON-TABLE ?auto_41038 ) ( ON ?auto_41039 ?auto_41038 ) ( ON ?auto_41040 ?auto_41039 ) ( not ( = ?auto_41038 ?auto_41039 ) ) ( not ( = ?auto_41038 ?auto_41040 ) ) ( not ( = ?auto_41038 ?auto_41042 ) ) ( not ( = ?auto_41039 ?auto_41040 ) ) ( not ( = ?auto_41039 ?auto_41042 ) ) ( not ( = ?auto_41040 ?auto_41042 ) ) ( not ( = ?auto_41038 ?auto_41041 ) ) ( not ( = ?auto_41038 ?auto_41043 ) ) ( not ( = ?auto_41039 ?auto_41041 ) ) ( not ( = ?auto_41039 ?auto_41043 ) ) ( not ( = ?auto_41040 ?auto_41041 ) ) ( not ( = ?auto_41040 ?auto_41043 ) ) ( not ( = ?auto_41042 ?auto_41041 ) ) ( not ( = ?auto_41042 ?auto_41043 ) ) ( not ( = ?auto_41041 ?auto_41043 ) ) ( ON ?auto_41041 ?auto_41042 ) ( CLEAR ?auto_41041 ) ( HOLDING ?auto_41043 ) ( CLEAR ?auto_41044 ) ( ON-TABLE ?auto_41044 ) ( not ( = ?auto_41044 ?auto_41043 ) ) ( not ( = ?auto_41038 ?auto_41044 ) ) ( not ( = ?auto_41039 ?auto_41044 ) ) ( not ( = ?auto_41040 ?auto_41044 ) ) ( not ( = ?auto_41042 ?auto_41044 ) ) ( not ( = ?auto_41041 ?auto_41044 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41044 ?auto_41043 )
      ( MAKE-3PILE ?auto_41038 ?auto_41039 ?auto_41040 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41736 - BLOCK
      ?auto_41737 - BLOCK
      ?auto_41738 - BLOCK
    )
    :vars
    (
      ?auto_41741 - BLOCK
      ?auto_41740 - BLOCK
      ?auto_41739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41741 ?auto_41738 ) ( ON-TABLE ?auto_41736 ) ( ON ?auto_41737 ?auto_41736 ) ( ON ?auto_41738 ?auto_41737 ) ( not ( = ?auto_41736 ?auto_41737 ) ) ( not ( = ?auto_41736 ?auto_41738 ) ) ( not ( = ?auto_41736 ?auto_41741 ) ) ( not ( = ?auto_41737 ?auto_41738 ) ) ( not ( = ?auto_41737 ?auto_41741 ) ) ( not ( = ?auto_41738 ?auto_41741 ) ) ( not ( = ?auto_41736 ?auto_41740 ) ) ( not ( = ?auto_41736 ?auto_41739 ) ) ( not ( = ?auto_41737 ?auto_41740 ) ) ( not ( = ?auto_41737 ?auto_41739 ) ) ( not ( = ?auto_41738 ?auto_41740 ) ) ( not ( = ?auto_41738 ?auto_41739 ) ) ( not ( = ?auto_41741 ?auto_41740 ) ) ( not ( = ?auto_41741 ?auto_41739 ) ) ( not ( = ?auto_41740 ?auto_41739 ) ) ( ON ?auto_41740 ?auto_41741 ) ( ON ?auto_41739 ?auto_41740 ) ( CLEAR ?auto_41739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41736 ?auto_41737 ?auto_41738 ?auto_41741 ?auto_41740 )
      ( MAKE-3PILE ?auto_41736 ?auto_41737 ?auto_41738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41052 - BLOCK
      ?auto_41053 - BLOCK
      ?auto_41054 - BLOCK
    )
    :vars
    (
      ?auto_41055 - BLOCK
      ?auto_41056 - BLOCK
      ?auto_41058 - BLOCK
      ?auto_41057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41055 ?auto_41054 ) ( ON-TABLE ?auto_41052 ) ( ON ?auto_41053 ?auto_41052 ) ( ON ?auto_41054 ?auto_41053 ) ( not ( = ?auto_41052 ?auto_41053 ) ) ( not ( = ?auto_41052 ?auto_41054 ) ) ( not ( = ?auto_41052 ?auto_41055 ) ) ( not ( = ?auto_41053 ?auto_41054 ) ) ( not ( = ?auto_41053 ?auto_41055 ) ) ( not ( = ?auto_41054 ?auto_41055 ) ) ( not ( = ?auto_41052 ?auto_41056 ) ) ( not ( = ?auto_41052 ?auto_41058 ) ) ( not ( = ?auto_41053 ?auto_41056 ) ) ( not ( = ?auto_41053 ?auto_41058 ) ) ( not ( = ?auto_41054 ?auto_41056 ) ) ( not ( = ?auto_41054 ?auto_41058 ) ) ( not ( = ?auto_41055 ?auto_41056 ) ) ( not ( = ?auto_41055 ?auto_41058 ) ) ( not ( = ?auto_41056 ?auto_41058 ) ) ( ON ?auto_41056 ?auto_41055 ) ( not ( = ?auto_41057 ?auto_41058 ) ) ( not ( = ?auto_41052 ?auto_41057 ) ) ( not ( = ?auto_41053 ?auto_41057 ) ) ( not ( = ?auto_41054 ?auto_41057 ) ) ( not ( = ?auto_41055 ?auto_41057 ) ) ( not ( = ?auto_41056 ?auto_41057 ) ) ( ON ?auto_41058 ?auto_41056 ) ( CLEAR ?auto_41058 ) ( HOLDING ?auto_41057 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41057 )
      ( MAKE-3PILE ?auto_41052 ?auto_41053 ?auto_41054 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41059 - BLOCK
      ?auto_41060 - BLOCK
      ?auto_41061 - BLOCK
    )
    :vars
    (
      ?auto_41062 - BLOCK
      ?auto_41064 - BLOCK
      ?auto_41063 - BLOCK
      ?auto_41065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41062 ?auto_41061 ) ( ON-TABLE ?auto_41059 ) ( ON ?auto_41060 ?auto_41059 ) ( ON ?auto_41061 ?auto_41060 ) ( not ( = ?auto_41059 ?auto_41060 ) ) ( not ( = ?auto_41059 ?auto_41061 ) ) ( not ( = ?auto_41059 ?auto_41062 ) ) ( not ( = ?auto_41060 ?auto_41061 ) ) ( not ( = ?auto_41060 ?auto_41062 ) ) ( not ( = ?auto_41061 ?auto_41062 ) ) ( not ( = ?auto_41059 ?auto_41064 ) ) ( not ( = ?auto_41059 ?auto_41063 ) ) ( not ( = ?auto_41060 ?auto_41064 ) ) ( not ( = ?auto_41060 ?auto_41063 ) ) ( not ( = ?auto_41061 ?auto_41064 ) ) ( not ( = ?auto_41061 ?auto_41063 ) ) ( not ( = ?auto_41062 ?auto_41064 ) ) ( not ( = ?auto_41062 ?auto_41063 ) ) ( not ( = ?auto_41064 ?auto_41063 ) ) ( ON ?auto_41064 ?auto_41062 ) ( not ( = ?auto_41065 ?auto_41063 ) ) ( not ( = ?auto_41059 ?auto_41065 ) ) ( not ( = ?auto_41060 ?auto_41065 ) ) ( not ( = ?auto_41061 ?auto_41065 ) ) ( not ( = ?auto_41062 ?auto_41065 ) ) ( not ( = ?auto_41064 ?auto_41065 ) ) ( ON ?auto_41063 ?auto_41064 ) ( ON ?auto_41065 ?auto_41063 ) ( CLEAR ?auto_41065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41059 ?auto_41060 ?auto_41061 ?auto_41062 ?auto_41064 ?auto_41063 )
      ( MAKE-3PILE ?auto_41059 ?auto_41060 ?auto_41061 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41070 - BLOCK
      ?auto_41071 - BLOCK
      ?auto_41072 - BLOCK
      ?auto_41073 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_41073 ) ( CLEAR ?auto_41072 ) ( ON-TABLE ?auto_41070 ) ( ON ?auto_41071 ?auto_41070 ) ( ON ?auto_41072 ?auto_41071 ) ( not ( = ?auto_41070 ?auto_41071 ) ) ( not ( = ?auto_41070 ?auto_41072 ) ) ( not ( = ?auto_41070 ?auto_41073 ) ) ( not ( = ?auto_41071 ?auto_41072 ) ) ( not ( = ?auto_41071 ?auto_41073 ) ) ( not ( = ?auto_41072 ?auto_41073 ) ) )
    :subtasks
    ( ( !STACK ?auto_41073 ?auto_41072 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41074 - BLOCK
      ?auto_41075 - BLOCK
      ?auto_41076 - BLOCK
      ?auto_41077 - BLOCK
    )
    :vars
    (
      ?auto_41078 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41076 ) ( ON-TABLE ?auto_41074 ) ( ON ?auto_41075 ?auto_41074 ) ( ON ?auto_41076 ?auto_41075 ) ( not ( = ?auto_41074 ?auto_41075 ) ) ( not ( = ?auto_41074 ?auto_41076 ) ) ( not ( = ?auto_41074 ?auto_41077 ) ) ( not ( = ?auto_41075 ?auto_41076 ) ) ( not ( = ?auto_41075 ?auto_41077 ) ) ( not ( = ?auto_41076 ?auto_41077 ) ) ( ON ?auto_41077 ?auto_41078 ) ( CLEAR ?auto_41077 ) ( HAND-EMPTY ) ( not ( = ?auto_41074 ?auto_41078 ) ) ( not ( = ?auto_41075 ?auto_41078 ) ) ( not ( = ?auto_41076 ?auto_41078 ) ) ( not ( = ?auto_41077 ?auto_41078 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41077 ?auto_41078 )
      ( MAKE-4PILE ?auto_41074 ?auto_41075 ?auto_41076 ?auto_41077 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41079 - BLOCK
      ?auto_41080 - BLOCK
      ?auto_41081 - BLOCK
      ?auto_41082 - BLOCK
    )
    :vars
    (
      ?auto_41083 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41079 ) ( ON ?auto_41080 ?auto_41079 ) ( not ( = ?auto_41079 ?auto_41080 ) ) ( not ( = ?auto_41079 ?auto_41081 ) ) ( not ( = ?auto_41079 ?auto_41082 ) ) ( not ( = ?auto_41080 ?auto_41081 ) ) ( not ( = ?auto_41080 ?auto_41082 ) ) ( not ( = ?auto_41081 ?auto_41082 ) ) ( ON ?auto_41082 ?auto_41083 ) ( CLEAR ?auto_41082 ) ( not ( = ?auto_41079 ?auto_41083 ) ) ( not ( = ?auto_41080 ?auto_41083 ) ) ( not ( = ?auto_41081 ?auto_41083 ) ) ( not ( = ?auto_41082 ?auto_41083 ) ) ( HOLDING ?auto_41081 ) ( CLEAR ?auto_41080 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41079 ?auto_41080 ?auto_41081 )
      ( MAKE-4PILE ?auto_41079 ?auto_41080 ?auto_41081 ?auto_41082 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41084 - BLOCK
      ?auto_41085 - BLOCK
      ?auto_41086 - BLOCK
      ?auto_41087 - BLOCK
    )
    :vars
    (
      ?auto_41088 - BLOCK
      ?auto_41090 - BLOCK
      ?auto_41089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41084 ) ( ON ?auto_41085 ?auto_41084 ) ( not ( = ?auto_41084 ?auto_41085 ) ) ( not ( = ?auto_41084 ?auto_41086 ) ) ( not ( = ?auto_41084 ?auto_41087 ) ) ( not ( = ?auto_41085 ?auto_41086 ) ) ( not ( = ?auto_41085 ?auto_41087 ) ) ( not ( = ?auto_41086 ?auto_41087 ) ) ( ON ?auto_41087 ?auto_41088 ) ( not ( = ?auto_41084 ?auto_41088 ) ) ( not ( = ?auto_41085 ?auto_41088 ) ) ( not ( = ?auto_41086 ?auto_41088 ) ) ( not ( = ?auto_41087 ?auto_41088 ) ) ( CLEAR ?auto_41085 ) ( ON ?auto_41086 ?auto_41087 ) ( CLEAR ?auto_41086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41090 ) ( ON ?auto_41089 ?auto_41090 ) ( ON ?auto_41088 ?auto_41089 ) ( not ( = ?auto_41090 ?auto_41089 ) ) ( not ( = ?auto_41090 ?auto_41088 ) ) ( not ( = ?auto_41090 ?auto_41087 ) ) ( not ( = ?auto_41090 ?auto_41086 ) ) ( not ( = ?auto_41089 ?auto_41088 ) ) ( not ( = ?auto_41089 ?auto_41087 ) ) ( not ( = ?auto_41089 ?auto_41086 ) ) ( not ( = ?auto_41084 ?auto_41090 ) ) ( not ( = ?auto_41084 ?auto_41089 ) ) ( not ( = ?auto_41085 ?auto_41090 ) ) ( not ( = ?auto_41085 ?auto_41089 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41090 ?auto_41089 ?auto_41088 ?auto_41087 )
      ( MAKE-4PILE ?auto_41084 ?auto_41085 ?auto_41086 ?auto_41087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41091 - BLOCK
      ?auto_41092 - BLOCK
      ?auto_41093 - BLOCK
      ?auto_41094 - BLOCK
    )
    :vars
    (
      ?auto_41095 - BLOCK
      ?auto_41097 - BLOCK
      ?auto_41096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41091 ) ( not ( = ?auto_41091 ?auto_41092 ) ) ( not ( = ?auto_41091 ?auto_41093 ) ) ( not ( = ?auto_41091 ?auto_41094 ) ) ( not ( = ?auto_41092 ?auto_41093 ) ) ( not ( = ?auto_41092 ?auto_41094 ) ) ( not ( = ?auto_41093 ?auto_41094 ) ) ( ON ?auto_41094 ?auto_41095 ) ( not ( = ?auto_41091 ?auto_41095 ) ) ( not ( = ?auto_41092 ?auto_41095 ) ) ( not ( = ?auto_41093 ?auto_41095 ) ) ( not ( = ?auto_41094 ?auto_41095 ) ) ( ON ?auto_41093 ?auto_41094 ) ( CLEAR ?auto_41093 ) ( ON-TABLE ?auto_41097 ) ( ON ?auto_41096 ?auto_41097 ) ( ON ?auto_41095 ?auto_41096 ) ( not ( = ?auto_41097 ?auto_41096 ) ) ( not ( = ?auto_41097 ?auto_41095 ) ) ( not ( = ?auto_41097 ?auto_41094 ) ) ( not ( = ?auto_41097 ?auto_41093 ) ) ( not ( = ?auto_41096 ?auto_41095 ) ) ( not ( = ?auto_41096 ?auto_41094 ) ) ( not ( = ?auto_41096 ?auto_41093 ) ) ( not ( = ?auto_41091 ?auto_41097 ) ) ( not ( = ?auto_41091 ?auto_41096 ) ) ( not ( = ?auto_41092 ?auto_41097 ) ) ( not ( = ?auto_41092 ?auto_41096 ) ) ( HOLDING ?auto_41092 ) ( CLEAR ?auto_41091 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41091 ?auto_41092 )
      ( MAKE-4PILE ?auto_41091 ?auto_41092 ?auto_41093 ?auto_41094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41098 - BLOCK
      ?auto_41099 - BLOCK
      ?auto_41100 - BLOCK
      ?auto_41101 - BLOCK
    )
    :vars
    (
      ?auto_41102 - BLOCK
      ?auto_41104 - BLOCK
      ?auto_41103 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41098 ) ( not ( = ?auto_41098 ?auto_41099 ) ) ( not ( = ?auto_41098 ?auto_41100 ) ) ( not ( = ?auto_41098 ?auto_41101 ) ) ( not ( = ?auto_41099 ?auto_41100 ) ) ( not ( = ?auto_41099 ?auto_41101 ) ) ( not ( = ?auto_41100 ?auto_41101 ) ) ( ON ?auto_41101 ?auto_41102 ) ( not ( = ?auto_41098 ?auto_41102 ) ) ( not ( = ?auto_41099 ?auto_41102 ) ) ( not ( = ?auto_41100 ?auto_41102 ) ) ( not ( = ?auto_41101 ?auto_41102 ) ) ( ON ?auto_41100 ?auto_41101 ) ( ON-TABLE ?auto_41104 ) ( ON ?auto_41103 ?auto_41104 ) ( ON ?auto_41102 ?auto_41103 ) ( not ( = ?auto_41104 ?auto_41103 ) ) ( not ( = ?auto_41104 ?auto_41102 ) ) ( not ( = ?auto_41104 ?auto_41101 ) ) ( not ( = ?auto_41104 ?auto_41100 ) ) ( not ( = ?auto_41103 ?auto_41102 ) ) ( not ( = ?auto_41103 ?auto_41101 ) ) ( not ( = ?auto_41103 ?auto_41100 ) ) ( not ( = ?auto_41098 ?auto_41104 ) ) ( not ( = ?auto_41098 ?auto_41103 ) ) ( not ( = ?auto_41099 ?auto_41104 ) ) ( not ( = ?auto_41099 ?auto_41103 ) ) ( CLEAR ?auto_41098 ) ( ON ?auto_41099 ?auto_41100 ) ( CLEAR ?auto_41099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41104 ?auto_41103 ?auto_41102 ?auto_41101 ?auto_41100 )
      ( MAKE-4PILE ?auto_41098 ?auto_41099 ?auto_41100 ?auto_41101 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41105 - BLOCK
      ?auto_41106 - BLOCK
      ?auto_41107 - BLOCK
      ?auto_41108 - BLOCK
    )
    :vars
    (
      ?auto_41109 - BLOCK
      ?auto_41111 - BLOCK
      ?auto_41110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41105 ?auto_41106 ) ) ( not ( = ?auto_41105 ?auto_41107 ) ) ( not ( = ?auto_41105 ?auto_41108 ) ) ( not ( = ?auto_41106 ?auto_41107 ) ) ( not ( = ?auto_41106 ?auto_41108 ) ) ( not ( = ?auto_41107 ?auto_41108 ) ) ( ON ?auto_41108 ?auto_41109 ) ( not ( = ?auto_41105 ?auto_41109 ) ) ( not ( = ?auto_41106 ?auto_41109 ) ) ( not ( = ?auto_41107 ?auto_41109 ) ) ( not ( = ?auto_41108 ?auto_41109 ) ) ( ON ?auto_41107 ?auto_41108 ) ( ON-TABLE ?auto_41111 ) ( ON ?auto_41110 ?auto_41111 ) ( ON ?auto_41109 ?auto_41110 ) ( not ( = ?auto_41111 ?auto_41110 ) ) ( not ( = ?auto_41111 ?auto_41109 ) ) ( not ( = ?auto_41111 ?auto_41108 ) ) ( not ( = ?auto_41111 ?auto_41107 ) ) ( not ( = ?auto_41110 ?auto_41109 ) ) ( not ( = ?auto_41110 ?auto_41108 ) ) ( not ( = ?auto_41110 ?auto_41107 ) ) ( not ( = ?auto_41105 ?auto_41111 ) ) ( not ( = ?auto_41105 ?auto_41110 ) ) ( not ( = ?auto_41106 ?auto_41111 ) ) ( not ( = ?auto_41106 ?auto_41110 ) ) ( ON ?auto_41106 ?auto_41107 ) ( CLEAR ?auto_41106 ) ( HOLDING ?auto_41105 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41105 )
      ( MAKE-4PILE ?auto_41105 ?auto_41106 ?auto_41107 ?auto_41108 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41112 - BLOCK
      ?auto_41113 - BLOCK
      ?auto_41114 - BLOCK
      ?auto_41115 - BLOCK
    )
    :vars
    (
      ?auto_41118 - BLOCK
      ?auto_41117 - BLOCK
      ?auto_41116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41112 ?auto_41113 ) ) ( not ( = ?auto_41112 ?auto_41114 ) ) ( not ( = ?auto_41112 ?auto_41115 ) ) ( not ( = ?auto_41113 ?auto_41114 ) ) ( not ( = ?auto_41113 ?auto_41115 ) ) ( not ( = ?auto_41114 ?auto_41115 ) ) ( ON ?auto_41115 ?auto_41118 ) ( not ( = ?auto_41112 ?auto_41118 ) ) ( not ( = ?auto_41113 ?auto_41118 ) ) ( not ( = ?auto_41114 ?auto_41118 ) ) ( not ( = ?auto_41115 ?auto_41118 ) ) ( ON ?auto_41114 ?auto_41115 ) ( ON-TABLE ?auto_41117 ) ( ON ?auto_41116 ?auto_41117 ) ( ON ?auto_41118 ?auto_41116 ) ( not ( = ?auto_41117 ?auto_41116 ) ) ( not ( = ?auto_41117 ?auto_41118 ) ) ( not ( = ?auto_41117 ?auto_41115 ) ) ( not ( = ?auto_41117 ?auto_41114 ) ) ( not ( = ?auto_41116 ?auto_41118 ) ) ( not ( = ?auto_41116 ?auto_41115 ) ) ( not ( = ?auto_41116 ?auto_41114 ) ) ( not ( = ?auto_41112 ?auto_41117 ) ) ( not ( = ?auto_41112 ?auto_41116 ) ) ( not ( = ?auto_41113 ?auto_41117 ) ) ( not ( = ?auto_41113 ?auto_41116 ) ) ( ON ?auto_41113 ?auto_41114 ) ( ON ?auto_41112 ?auto_41113 ) ( CLEAR ?auto_41112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41117 ?auto_41116 ?auto_41118 ?auto_41115 ?auto_41114 ?auto_41113 )
      ( MAKE-4PILE ?auto_41112 ?auto_41113 ?auto_41114 ?auto_41115 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41121 - BLOCK
      ?auto_41122 - BLOCK
    )
    :vars
    (
      ?auto_41123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41123 ?auto_41122 ) ( CLEAR ?auto_41123 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41121 ) ( ON ?auto_41122 ?auto_41121 ) ( not ( = ?auto_41121 ?auto_41122 ) ) ( not ( = ?auto_41121 ?auto_41123 ) ) ( not ( = ?auto_41122 ?auto_41123 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41123 ?auto_41122 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41124 - BLOCK
      ?auto_41125 - BLOCK
    )
    :vars
    (
      ?auto_41126 - BLOCK
      ?auto_41127 - BLOCK
      ?auto_41128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41126 ?auto_41125 ) ( CLEAR ?auto_41126 ) ( ON-TABLE ?auto_41124 ) ( ON ?auto_41125 ?auto_41124 ) ( not ( = ?auto_41124 ?auto_41125 ) ) ( not ( = ?auto_41124 ?auto_41126 ) ) ( not ( = ?auto_41125 ?auto_41126 ) ) ( HOLDING ?auto_41127 ) ( CLEAR ?auto_41128 ) ( not ( = ?auto_41124 ?auto_41127 ) ) ( not ( = ?auto_41124 ?auto_41128 ) ) ( not ( = ?auto_41125 ?auto_41127 ) ) ( not ( = ?auto_41125 ?auto_41128 ) ) ( not ( = ?auto_41126 ?auto_41127 ) ) ( not ( = ?auto_41126 ?auto_41128 ) ) ( not ( = ?auto_41127 ?auto_41128 ) ) )
    :subtasks
    ( ( !STACK ?auto_41127 ?auto_41128 )
      ( MAKE-2PILE ?auto_41124 ?auto_41125 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41129 - BLOCK
      ?auto_41130 - BLOCK
    )
    :vars
    (
      ?auto_41133 - BLOCK
      ?auto_41132 - BLOCK
      ?auto_41131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41133 ?auto_41130 ) ( ON-TABLE ?auto_41129 ) ( ON ?auto_41130 ?auto_41129 ) ( not ( = ?auto_41129 ?auto_41130 ) ) ( not ( = ?auto_41129 ?auto_41133 ) ) ( not ( = ?auto_41130 ?auto_41133 ) ) ( CLEAR ?auto_41132 ) ( not ( = ?auto_41129 ?auto_41131 ) ) ( not ( = ?auto_41129 ?auto_41132 ) ) ( not ( = ?auto_41130 ?auto_41131 ) ) ( not ( = ?auto_41130 ?auto_41132 ) ) ( not ( = ?auto_41133 ?auto_41131 ) ) ( not ( = ?auto_41133 ?auto_41132 ) ) ( not ( = ?auto_41131 ?auto_41132 ) ) ( ON ?auto_41131 ?auto_41133 ) ( CLEAR ?auto_41131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41129 ?auto_41130 ?auto_41133 )
      ( MAKE-2PILE ?auto_41129 ?auto_41130 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41134 - BLOCK
      ?auto_41135 - BLOCK
    )
    :vars
    (
      ?auto_41137 - BLOCK
      ?auto_41138 - BLOCK
      ?auto_41136 - BLOCK
      ?auto_41139 - BLOCK
      ?auto_41140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41137 ?auto_41135 ) ( ON-TABLE ?auto_41134 ) ( ON ?auto_41135 ?auto_41134 ) ( not ( = ?auto_41134 ?auto_41135 ) ) ( not ( = ?auto_41134 ?auto_41137 ) ) ( not ( = ?auto_41135 ?auto_41137 ) ) ( not ( = ?auto_41134 ?auto_41138 ) ) ( not ( = ?auto_41134 ?auto_41136 ) ) ( not ( = ?auto_41135 ?auto_41138 ) ) ( not ( = ?auto_41135 ?auto_41136 ) ) ( not ( = ?auto_41137 ?auto_41138 ) ) ( not ( = ?auto_41137 ?auto_41136 ) ) ( not ( = ?auto_41138 ?auto_41136 ) ) ( ON ?auto_41138 ?auto_41137 ) ( CLEAR ?auto_41138 ) ( HOLDING ?auto_41136 ) ( CLEAR ?auto_41139 ) ( ON-TABLE ?auto_41140 ) ( ON ?auto_41139 ?auto_41140 ) ( not ( = ?auto_41140 ?auto_41139 ) ) ( not ( = ?auto_41140 ?auto_41136 ) ) ( not ( = ?auto_41139 ?auto_41136 ) ) ( not ( = ?auto_41134 ?auto_41139 ) ) ( not ( = ?auto_41134 ?auto_41140 ) ) ( not ( = ?auto_41135 ?auto_41139 ) ) ( not ( = ?auto_41135 ?auto_41140 ) ) ( not ( = ?auto_41137 ?auto_41139 ) ) ( not ( = ?auto_41137 ?auto_41140 ) ) ( not ( = ?auto_41138 ?auto_41139 ) ) ( not ( = ?auto_41138 ?auto_41140 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41140 ?auto_41139 ?auto_41136 )
      ( MAKE-2PILE ?auto_41134 ?auto_41135 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41141 - BLOCK
      ?auto_41142 - BLOCK
    )
    :vars
    (
      ?auto_41147 - BLOCK
      ?auto_41143 - BLOCK
      ?auto_41146 - BLOCK
      ?auto_41144 - BLOCK
      ?auto_41145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41147 ?auto_41142 ) ( ON-TABLE ?auto_41141 ) ( ON ?auto_41142 ?auto_41141 ) ( not ( = ?auto_41141 ?auto_41142 ) ) ( not ( = ?auto_41141 ?auto_41147 ) ) ( not ( = ?auto_41142 ?auto_41147 ) ) ( not ( = ?auto_41141 ?auto_41143 ) ) ( not ( = ?auto_41141 ?auto_41146 ) ) ( not ( = ?auto_41142 ?auto_41143 ) ) ( not ( = ?auto_41142 ?auto_41146 ) ) ( not ( = ?auto_41147 ?auto_41143 ) ) ( not ( = ?auto_41147 ?auto_41146 ) ) ( not ( = ?auto_41143 ?auto_41146 ) ) ( ON ?auto_41143 ?auto_41147 ) ( CLEAR ?auto_41144 ) ( ON-TABLE ?auto_41145 ) ( ON ?auto_41144 ?auto_41145 ) ( not ( = ?auto_41145 ?auto_41144 ) ) ( not ( = ?auto_41145 ?auto_41146 ) ) ( not ( = ?auto_41144 ?auto_41146 ) ) ( not ( = ?auto_41141 ?auto_41144 ) ) ( not ( = ?auto_41141 ?auto_41145 ) ) ( not ( = ?auto_41142 ?auto_41144 ) ) ( not ( = ?auto_41142 ?auto_41145 ) ) ( not ( = ?auto_41147 ?auto_41144 ) ) ( not ( = ?auto_41147 ?auto_41145 ) ) ( not ( = ?auto_41143 ?auto_41144 ) ) ( not ( = ?auto_41143 ?auto_41145 ) ) ( ON ?auto_41146 ?auto_41143 ) ( CLEAR ?auto_41146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41141 ?auto_41142 ?auto_41147 ?auto_41143 )
      ( MAKE-2PILE ?auto_41141 ?auto_41142 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41148 - BLOCK
      ?auto_41149 - BLOCK
    )
    :vars
    (
      ?auto_41150 - BLOCK
      ?auto_41152 - BLOCK
      ?auto_41154 - BLOCK
      ?auto_41153 - BLOCK
      ?auto_41151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41150 ?auto_41149 ) ( ON-TABLE ?auto_41148 ) ( ON ?auto_41149 ?auto_41148 ) ( not ( = ?auto_41148 ?auto_41149 ) ) ( not ( = ?auto_41148 ?auto_41150 ) ) ( not ( = ?auto_41149 ?auto_41150 ) ) ( not ( = ?auto_41148 ?auto_41152 ) ) ( not ( = ?auto_41148 ?auto_41154 ) ) ( not ( = ?auto_41149 ?auto_41152 ) ) ( not ( = ?auto_41149 ?auto_41154 ) ) ( not ( = ?auto_41150 ?auto_41152 ) ) ( not ( = ?auto_41150 ?auto_41154 ) ) ( not ( = ?auto_41152 ?auto_41154 ) ) ( ON ?auto_41152 ?auto_41150 ) ( ON-TABLE ?auto_41153 ) ( not ( = ?auto_41153 ?auto_41151 ) ) ( not ( = ?auto_41153 ?auto_41154 ) ) ( not ( = ?auto_41151 ?auto_41154 ) ) ( not ( = ?auto_41148 ?auto_41151 ) ) ( not ( = ?auto_41148 ?auto_41153 ) ) ( not ( = ?auto_41149 ?auto_41151 ) ) ( not ( = ?auto_41149 ?auto_41153 ) ) ( not ( = ?auto_41150 ?auto_41151 ) ) ( not ( = ?auto_41150 ?auto_41153 ) ) ( not ( = ?auto_41152 ?auto_41151 ) ) ( not ( = ?auto_41152 ?auto_41153 ) ) ( ON ?auto_41154 ?auto_41152 ) ( CLEAR ?auto_41154 ) ( HOLDING ?auto_41151 ) ( CLEAR ?auto_41153 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41153 ?auto_41151 )
      ( MAKE-2PILE ?auto_41148 ?auto_41149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41926 - BLOCK
      ?auto_41927 - BLOCK
    )
    :vars
    (
      ?auto_41930 - BLOCK
      ?auto_41929 - BLOCK
      ?auto_41931 - BLOCK
      ?auto_41928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41930 ?auto_41927 ) ( ON-TABLE ?auto_41926 ) ( ON ?auto_41927 ?auto_41926 ) ( not ( = ?auto_41926 ?auto_41927 ) ) ( not ( = ?auto_41926 ?auto_41930 ) ) ( not ( = ?auto_41927 ?auto_41930 ) ) ( not ( = ?auto_41926 ?auto_41929 ) ) ( not ( = ?auto_41926 ?auto_41931 ) ) ( not ( = ?auto_41927 ?auto_41929 ) ) ( not ( = ?auto_41927 ?auto_41931 ) ) ( not ( = ?auto_41930 ?auto_41929 ) ) ( not ( = ?auto_41930 ?auto_41931 ) ) ( not ( = ?auto_41929 ?auto_41931 ) ) ( ON ?auto_41929 ?auto_41930 ) ( not ( = ?auto_41928 ?auto_41931 ) ) ( not ( = ?auto_41926 ?auto_41928 ) ) ( not ( = ?auto_41927 ?auto_41928 ) ) ( not ( = ?auto_41930 ?auto_41928 ) ) ( not ( = ?auto_41929 ?auto_41928 ) ) ( ON ?auto_41931 ?auto_41929 ) ( ON ?auto_41928 ?auto_41931 ) ( CLEAR ?auto_41928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41926 ?auto_41927 ?auto_41930 ?auto_41929 ?auto_41931 )
      ( MAKE-2PILE ?auto_41926 ?auto_41927 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41162 - BLOCK
      ?auto_41163 - BLOCK
    )
    :vars
    (
      ?auto_41167 - BLOCK
      ?auto_41164 - BLOCK
      ?auto_41166 - BLOCK
      ?auto_41168 - BLOCK
      ?auto_41165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41167 ?auto_41163 ) ( ON-TABLE ?auto_41162 ) ( ON ?auto_41163 ?auto_41162 ) ( not ( = ?auto_41162 ?auto_41163 ) ) ( not ( = ?auto_41162 ?auto_41167 ) ) ( not ( = ?auto_41163 ?auto_41167 ) ) ( not ( = ?auto_41162 ?auto_41164 ) ) ( not ( = ?auto_41162 ?auto_41166 ) ) ( not ( = ?auto_41163 ?auto_41164 ) ) ( not ( = ?auto_41163 ?auto_41166 ) ) ( not ( = ?auto_41167 ?auto_41164 ) ) ( not ( = ?auto_41167 ?auto_41166 ) ) ( not ( = ?auto_41164 ?auto_41166 ) ) ( ON ?auto_41164 ?auto_41167 ) ( not ( = ?auto_41168 ?auto_41165 ) ) ( not ( = ?auto_41168 ?auto_41166 ) ) ( not ( = ?auto_41165 ?auto_41166 ) ) ( not ( = ?auto_41162 ?auto_41165 ) ) ( not ( = ?auto_41162 ?auto_41168 ) ) ( not ( = ?auto_41163 ?auto_41165 ) ) ( not ( = ?auto_41163 ?auto_41168 ) ) ( not ( = ?auto_41167 ?auto_41165 ) ) ( not ( = ?auto_41167 ?auto_41168 ) ) ( not ( = ?auto_41164 ?auto_41165 ) ) ( not ( = ?auto_41164 ?auto_41168 ) ) ( ON ?auto_41166 ?auto_41164 ) ( ON ?auto_41165 ?auto_41166 ) ( CLEAR ?auto_41165 ) ( HOLDING ?auto_41168 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41168 )
      ( MAKE-2PILE ?auto_41162 ?auto_41163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41169 - BLOCK
      ?auto_41170 - BLOCK
    )
    :vars
    (
      ?auto_41173 - BLOCK
      ?auto_41175 - BLOCK
      ?auto_41174 - BLOCK
      ?auto_41171 - BLOCK
      ?auto_41172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41173 ?auto_41170 ) ( ON-TABLE ?auto_41169 ) ( ON ?auto_41170 ?auto_41169 ) ( not ( = ?auto_41169 ?auto_41170 ) ) ( not ( = ?auto_41169 ?auto_41173 ) ) ( not ( = ?auto_41170 ?auto_41173 ) ) ( not ( = ?auto_41169 ?auto_41175 ) ) ( not ( = ?auto_41169 ?auto_41174 ) ) ( not ( = ?auto_41170 ?auto_41175 ) ) ( not ( = ?auto_41170 ?auto_41174 ) ) ( not ( = ?auto_41173 ?auto_41175 ) ) ( not ( = ?auto_41173 ?auto_41174 ) ) ( not ( = ?auto_41175 ?auto_41174 ) ) ( ON ?auto_41175 ?auto_41173 ) ( not ( = ?auto_41171 ?auto_41172 ) ) ( not ( = ?auto_41171 ?auto_41174 ) ) ( not ( = ?auto_41172 ?auto_41174 ) ) ( not ( = ?auto_41169 ?auto_41172 ) ) ( not ( = ?auto_41169 ?auto_41171 ) ) ( not ( = ?auto_41170 ?auto_41172 ) ) ( not ( = ?auto_41170 ?auto_41171 ) ) ( not ( = ?auto_41173 ?auto_41172 ) ) ( not ( = ?auto_41173 ?auto_41171 ) ) ( not ( = ?auto_41175 ?auto_41172 ) ) ( not ( = ?auto_41175 ?auto_41171 ) ) ( ON ?auto_41174 ?auto_41175 ) ( ON ?auto_41172 ?auto_41174 ) ( ON ?auto_41171 ?auto_41172 ) ( CLEAR ?auto_41171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41169 ?auto_41170 ?auto_41173 ?auto_41175 ?auto_41174 ?auto_41172 )
      ( MAKE-2PILE ?auto_41169 ?auto_41170 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41181 - BLOCK
      ?auto_41182 - BLOCK
      ?auto_41183 - BLOCK
      ?auto_41184 - BLOCK
      ?auto_41185 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_41185 ) ( CLEAR ?auto_41184 ) ( ON-TABLE ?auto_41181 ) ( ON ?auto_41182 ?auto_41181 ) ( ON ?auto_41183 ?auto_41182 ) ( ON ?auto_41184 ?auto_41183 ) ( not ( = ?auto_41181 ?auto_41182 ) ) ( not ( = ?auto_41181 ?auto_41183 ) ) ( not ( = ?auto_41181 ?auto_41184 ) ) ( not ( = ?auto_41181 ?auto_41185 ) ) ( not ( = ?auto_41182 ?auto_41183 ) ) ( not ( = ?auto_41182 ?auto_41184 ) ) ( not ( = ?auto_41182 ?auto_41185 ) ) ( not ( = ?auto_41183 ?auto_41184 ) ) ( not ( = ?auto_41183 ?auto_41185 ) ) ( not ( = ?auto_41184 ?auto_41185 ) ) )
    :subtasks
    ( ( !STACK ?auto_41185 ?auto_41184 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41186 - BLOCK
      ?auto_41187 - BLOCK
      ?auto_41188 - BLOCK
      ?auto_41189 - BLOCK
      ?auto_41190 - BLOCK
    )
    :vars
    (
      ?auto_41191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41189 ) ( ON-TABLE ?auto_41186 ) ( ON ?auto_41187 ?auto_41186 ) ( ON ?auto_41188 ?auto_41187 ) ( ON ?auto_41189 ?auto_41188 ) ( not ( = ?auto_41186 ?auto_41187 ) ) ( not ( = ?auto_41186 ?auto_41188 ) ) ( not ( = ?auto_41186 ?auto_41189 ) ) ( not ( = ?auto_41186 ?auto_41190 ) ) ( not ( = ?auto_41187 ?auto_41188 ) ) ( not ( = ?auto_41187 ?auto_41189 ) ) ( not ( = ?auto_41187 ?auto_41190 ) ) ( not ( = ?auto_41188 ?auto_41189 ) ) ( not ( = ?auto_41188 ?auto_41190 ) ) ( not ( = ?auto_41189 ?auto_41190 ) ) ( ON ?auto_41190 ?auto_41191 ) ( CLEAR ?auto_41190 ) ( HAND-EMPTY ) ( not ( = ?auto_41186 ?auto_41191 ) ) ( not ( = ?auto_41187 ?auto_41191 ) ) ( not ( = ?auto_41188 ?auto_41191 ) ) ( not ( = ?auto_41189 ?auto_41191 ) ) ( not ( = ?auto_41190 ?auto_41191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41190 ?auto_41191 )
      ( MAKE-5PILE ?auto_41186 ?auto_41187 ?auto_41188 ?auto_41189 ?auto_41190 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41192 - BLOCK
      ?auto_41193 - BLOCK
      ?auto_41194 - BLOCK
      ?auto_41195 - BLOCK
      ?auto_41196 - BLOCK
    )
    :vars
    (
      ?auto_41197 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41192 ) ( ON ?auto_41193 ?auto_41192 ) ( ON ?auto_41194 ?auto_41193 ) ( not ( = ?auto_41192 ?auto_41193 ) ) ( not ( = ?auto_41192 ?auto_41194 ) ) ( not ( = ?auto_41192 ?auto_41195 ) ) ( not ( = ?auto_41192 ?auto_41196 ) ) ( not ( = ?auto_41193 ?auto_41194 ) ) ( not ( = ?auto_41193 ?auto_41195 ) ) ( not ( = ?auto_41193 ?auto_41196 ) ) ( not ( = ?auto_41194 ?auto_41195 ) ) ( not ( = ?auto_41194 ?auto_41196 ) ) ( not ( = ?auto_41195 ?auto_41196 ) ) ( ON ?auto_41196 ?auto_41197 ) ( CLEAR ?auto_41196 ) ( not ( = ?auto_41192 ?auto_41197 ) ) ( not ( = ?auto_41193 ?auto_41197 ) ) ( not ( = ?auto_41194 ?auto_41197 ) ) ( not ( = ?auto_41195 ?auto_41197 ) ) ( not ( = ?auto_41196 ?auto_41197 ) ) ( HOLDING ?auto_41195 ) ( CLEAR ?auto_41194 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41192 ?auto_41193 ?auto_41194 ?auto_41195 )
      ( MAKE-5PILE ?auto_41192 ?auto_41193 ?auto_41194 ?auto_41195 ?auto_41196 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41198 - BLOCK
      ?auto_41199 - BLOCK
      ?auto_41200 - BLOCK
      ?auto_41201 - BLOCK
      ?auto_41202 - BLOCK
    )
    :vars
    (
      ?auto_41203 - BLOCK
      ?auto_41204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41198 ) ( ON ?auto_41199 ?auto_41198 ) ( ON ?auto_41200 ?auto_41199 ) ( not ( = ?auto_41198 ?auto_41199 ) ) ( not ( = ?auto_41198 ?auto_41200 ) ) ( not ( = ?auto_41198 ?auto_41201 ) ) ( not ( = ?auto_41198 ?auto_41202 ) ) ( not ( = ?auto_41199 ?auto_41200 ) ) ( not ( = ?auto_41199 ?auto_41201 ) ) ( not ( = ?auto_41199 ?auto_41202 ) ) ( not ( = ?auto_41200 ?auto_41201 ) ) ( not ( = ?auto_41200 ?auto_41202 ) ) ( not ( = ?auto_41201 ?auto_41202 ) ) ( ON ?auto_41202 ?auto_41203 ) ( not ( = ?auto_41198 ?auto_41203 ) ) ( not ( = ?auto_41199 ?auto_41203 ) ) ( not ( = ?auto_41200 ?auto_41203 ) ) ( not ( = ?auto_41201 ?auto_41203 ) ) ( not ( = ?auto_41202 ?auto_41203 ) ) ( CLEAR ?auto_41200 ) ( ON ?auto_41201 ?auto_41202 ) ( CLEAR ?auto_41201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41204 ) ( ON ?auto_41203 ?auto_41204 ) ( not ( = ?auto_41204 ?auto_41203 ) ) ( not ( = ?auto_41204 ?auto_41202 ) ) ( not ( = ?auto_41204 ?auto_41201 ) ) ( not ( = ?auto_41198 ?auto_41204 ) ) ( not ( = ?auto_41199 ?auto_41204 ) ) ( not ( = ?auto_41200 ?auto_41204 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41204 ?auto_41203 ?auto_41202 )
      ( MAKE-5PILE ?auto_41198 ?auto_41199 ?auto_41200 ?auto_41201 ?auto_41202 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41205 - BLOCK
      ?auto_41206 - BLOCK
      ?auto_41207 - BLOCK
      ?auto_41208 - BLOCK
      ?auto_41209 - BLOCK
    )
    :vars
    (
      ?auto_41210 - BLOCK
      ?auto_41211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41205 ) ( ON ?auto_41206 ?auto_41205 ) ( not ( = ?auto_41205 ?auto_41206 ) ) ( not ( = ?auto_41205 ?auto_41207 ) ) ( not ( = ?auto_41205 ?auto_41208 ) ) ( not ( = ?auto_41205 ?auto_41209 ) ) ( not ( = ?auto_41206 ?auto_41207 ) ) ( not ( = ?auto_41206 ?auto_41208 ) ) ( not ( = ?auto_41206 ?auto_41209 ) ) ( not ( = ?auto_41207 ?auto_41208 ) ) ( not ( = ?auto_41207 ?auto_41209 ) ) ( not ( = ?auto_41208 ?auto_41209 ) ) ( ON ?auto_41209 ?auto_41210 ) ( not ( = ?auto_41205 ?auto_41210 ) ) ( not ( = ?auto_41206 ?auto_41210 ) ) ( not ( = ?auto_41207 ?auto_41210 ) ) ( not ( = ?auto_41208 ?auto_41210 ) ) ( not ( = ?auto_41209 ?auto_41210 ) ) ( ON ?auto_41208 ?auto_41209 ) ( CLEAR ?auto_41208 ) ( ON-TABLE ?auto_41211 ) ( ON ?auto_41210 ?auto_41211 ) ( not ( = ?auto_41211 ?auto_41210 ) ) ( not ( = ?auto_41211 ?auto_41209 ) ) ( not ( = ?auto_41211 ?auto_41208 ) ) ( not ( = ?auto_41205 ?auto_41211 ) ) ( not ( = ?auto_41206 ?auto_41211 ) ) ( not ( = ?auto_41207 ?auto_41211 ) ) ( HOLDING ?auto_41207 ) ( CLEAR ?auto_41206 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41205 ?auto_41206 ?auto_41207 )
      ( MAKE-5PILE ?auto_41205 ?auto_41206 ?auto_41207 ?auto_41208 ?auto_41209 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41212 - BLOCK
      ?auto_41213 - BLOCK
      ?auto_41214 - BLOCK
      ?auto_41215 - BLOCK
      ?auto_41216 - BLOCK
    )
    :vars
    (
      ?auto_41218 - BLOCK
      ?auto_41217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41212 ) ( ON ?auto_41213 ?auto_41212 ) ( not ( = ?auto_41212 ?auto_41213 ) ) ( not ( = ?auto_41212 ?auto_41214 ) ) ( not ( = ?auto_41212 ?auto_41215 ) ) ( not ( = ?auto_41212 ?auto_41216 ) ) ( not ( = ?auto_41213 ?auto_41214 ) ) ( not ( = ?auto_41213 ?auto_41215 ) ) ( not ( = ?auto_41213 ?auto_41216 ) ) ( not ( = ?auto_41214 ?auto_41215 ) ) ( not ( = ?auto_41214 ?auto_41216 ) ) ( not ( = ?auto_41215 ?auto_41216 ) ) ( ON ?auto_41216 ?auto_41218 ) ( not ( = ?auto_41212 ?auto_41218 ) ) ( not ( = ?auto_41213 ?auto_41218 ) ) ( not ( = ?auto_41214 ?auto_41218 ) ) ( not ( = ?auto_41215 ?auto_41218 ) ) ( not ( = ?auto_41216 ?auto_41218 ) ) ( ON ?auto_41215 ?auto_41216 ) ( ON-TABLE ?auto_41217 ) ( ON ?auto_41218 ?auto_41217 ) ( not ( = ?auto_41217 ?auto_41218 ) ) ( not ( = ?auto_41217 ?auto_41216 ) ) ( not ( = ?auto_41217 ?auto_41215 ) ) ( not ( = ?auto_41212 ?auto_41217 ) ) ( not ( = ?auto_41213 ?auto_41217 ) ) ( not ( = ?auto_41214 ?auto_41217 ) ) ( CLEAR ?auto_41213 ) ( ON ?auto_41214 ?auto_41215 ) ( CLEAR ?auto_41214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41217 ?auto_41218 ?auto_41216 ?auto_41215 )
      ( MAKE-5PILE ?auto_41212 ?auto_41213 ?auto_41214 ?auto_41215 ?auto_41216 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41219 - BLOCK
      ?auto_41220 - BLOCK
      ?auto_41221 - BLOCK
      ?auto_41222 - BLOCK
      ?auto_41223 - BLOCK
    )
    :vars
    (
      ?auto_41225 - BLOCK
      ?auto_41224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41219 ) ( not ( = ?auto_41219 ?auto_41220 ) ) ( not ( = ?auto_41219 ?auto_41221 ) ) ( not ( = ?auto_41219 ?auto_41222 ) ) ( not ( = ?auto_41219 ?auto_41223 ) ) ( not ( = ?auto_41220 ?auto_41221 ) ) ( not ( = ?auto_41220 ?auto_41222 ) ) ( not ( = ?auto_41220 ?auto_41223 ) ) ( not ( = ?auto_41221 ?auto_41222 ) ) ( not ( = ?auto_41221 ?auto_41223 ) ) ( not ( = ?auto_41222 ?auto_41223 ) ) ( ON ?auto_41223 ?auto_41225 ) ( not ( = ?auto_41219 ?auto_41225 ) ) ( not ( = ?auto_41220 ?auto_41225 ) ) ( not ( = ?auto_41221 ?auto_41225 ) ) ( not ( = ?auto_41222 ?auto_41225 ) ) ( not ( = ?auto_41223 ?auto_41225 ) ) ( ON ?auto_41222 ?auto_41223 ) ( ON-TABLE ?auto_41224 ) ( ON ?auto_41225 ?auto_41224 ) ( not ( = ?auto_41224 ?auto_41225 ) ) ( not ( = ?auto_41224 ?auto_41223 ) ) ( not ( = ?auto_41224 ?auto_41222 ) ) ( not ( = ?auto_41219 ?auto_41224 ) ) ( not ( = ?auto_41220 ?auto_41224 ) ) ( not ( = ?auto_41221 ?auto_41224 ) ) ( ON ?auto_41221 ?auto_41222 ) ( CLEAR ?auto_41221 ) ( HOLDING ?auto_41220 ) ( CLEAR ?auto_41219 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41219 ?auto_41220 )
      ( MAKE-5PILE ?auto_41219 ?auto_41220 ?auto_41221 ?auto_41222 ?auto_41223 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41226 - BLOCK
      ?auto_41227 - BLOCK
      ?auto_41228 - BLOCK
      ?auto_41229 - BLOCK
      ?auto_41230 - BLOCK
    )
    :vars
    (
      ?auto_41231 - BLOCK
      ?auto_41232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41226 ) ( not ( = ?auto_41226 ?auto_41227 ) ) ( not ( = ?auto_41226 ?auto_41228 ) ) ( not ( = ?auto_41226 ?auto_41229 ) ) ( not ( = ?auto_41226 ?auto_41230 ) ) ( not ( = ?auto_41227 ?auto_41228 ) ) ( not ( = ?auto_41227 ?auto_41229 ) ) ( not ( = ?auto_41227 ?auto_41230 ) ) ( not ( = ?auto_41228 ?auto_41229 ) ) ( not ( = ?auto_41228 ?auto_41230 ) ) ( not ( = ?auto_41229 ?auto_41230 ) ) ( ON ?auto_41230 ?auto_41231 ) ( not ( = ?auto_41226 ?auto_41231 ) ) ( not ( = ?auto_41227 ?auto_41231 ) ) ( not ( = ?auto_41228 ?auto_41231 ) ) ( not ( = ?auto_41229 ?auto_41231 ) ) ( not ( = ?auto_41230 ?auto_41231 ) ) ( ON ?auto_41229 ?auto_41230 ) ( ON-TABLE ?auto_41232 ) ( ON ?auto_41231 ?auto_41232 ) ( not ( = ?auto_41232 ?auto_41231 ) ) ( not ( = ?auto_41232 ?auto_41230 ) ) ( not ( = ?auto_41232 ?auto_41229 ) ) ( not ( = ?auto_41226 ?auto_41232 ) ) ( not ( = ?auto_41227 ?auto_41232 ) ) ( not ( = ?auto_41228 ?auto_41232 ) ) ( ON ?auto_41228 ?auto_41229 ) ( CLEAR ?auto_41226 ) ( ON ?auto_41227 ?auto_41228 ) ( CLEAR ?auto_41227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41232 ?auto_41231 ?auto_41230 ?auto_41229 ?auto_41228 )
      ( MAKE-5PILE ?auto_41226 ?auto_41227 ?auto_41228 ?auto_41229 ?auto_41230 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41233 - BLOCK
      ?auto_41234 - BLOCK
      ?auto_41235 - BLOCK
      ?auto_41236 - BLOCK
      ?auto_41237 - BLOCK
    )
    :vars
    (
      ?auto_41239 - BLOCK
      ?auto_41238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41233 ?auto_41234 ) ) ( not ( = ?auto_41233 ?auto_41235 ) ) ( not ( = ?auto_41233 ?auto_41236 ) ) ( not ( = ?auto_41233 ?auto_41237 ) ) ( not ( = ?auto_41234 ?auto_41235 ) ) ( not ( = ?auto_41234 ?auto_41236 ) ) ( not ( = ?auto_41234 ?auto_41237 ) ) ( not ( = ?auto_41235 ?auto_41236 ) ) ( not ( = ?auto_41235 ?auto_41237 ) ) ( not ( = ?auto_41236 ?auto_41237 ) ) ( ON ?auto_41237 ?auto_41239 ) ( not ( = ?auto_41233 ?auto_41239 ) ) ( not ( = ?auto_41234 ?auto_41239 ) ) ( not ( = ?auto_41235 ?auto_41239 ) ) ( not ( = ?auto_41236 ?auto_41239 ) ) ( not ( = ?auto_41237 ?auto_41239 ) ) ( ON ?auto_41236 ?auto_41237 ) ( ON-TABLE ?auto_41238 ) ( ON ?auto_41239 ?auto_41238 ) ( not ( = ?auto_41238 ?auto_41239 ) ) ( not ( = ?auto_41238 ?auto_41237 ) ) ( not ( = ?auto_41238 ?auto_41236 ) ) ( not ( = ?auto_41233 ?auto_41238 ) ) ( not ( = ?auto_41234 ?auto_41238 ) ) ( not ( = ?auto_41235 ?auto_41238 ) ) ( ON ?auto_41235 ?auto_41236 ) ( ON ?auto_41234 ?auto_41235 ) ( CLEAR ?auto_41234 ) ( HOLDING ?auto_41233 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41233 )
      ( MAKE-5PILE ?auto_41233 ?auto_41234 ?auto_41235 ?auto_41236 ?auto_41237 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41240 - BLOCK
      ?auto_41241 - BLOCK
      ?auto_41242 - BLOCK
      ?auto_41243 - BLOCK
      ?auto_41244 - BLOCK
    )
    :vars
    (
      ?auto_41246 - BLOCK
      ?auto_41245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41240 ?auto_41241 ) ) ( not ( = ?auto_41240 ?auto_41242 ) ) ( not ( = ?auto_41240 ?auto_41243 ) ) ( not ( = ?auto_41240 ?auto_41244 ) ) ( not ( = ?auto_41241 ?auto_41242 ) ) ( not ( = ?auto_41241 ?auto_41243 ) ) ( not ( = ?auto_41241 ?auto_41244 ) ) ( not ( = ?auto_41242 ?auto_41243 ) ) ( not ( = ?auto_41242 ?auto_41244 ) ) ( not ( = ?auto_41243 ?auto_41244 ) ) ( ON ?auto_41244 ?auto_41246 ) ( not ( = ?auto_41240 ?auto_41246 ) ) ( not ( = ?auto_41241 ?auto_41246 ) ) ( not ( = ?auto_41242 ?auto_41246 ) ) ( not ( = ?auto_41243 ?auto_41246 ) ) ( not ( = ?auto_41244 ?auto_41246 ) ) ( ON ?auto_41243 ?auto_41244 ) ( ON-TABLE ?auto_41245 ) ( ON ?auto_41246 ?auto_41245 ) ( not ( = ?auto_41245 ?auto_41246 ) ) ( not ( = ?auto_41245 ?auto_41244 ) ) ( not ( = ?auto_41245 ?auto_41243 ) ) ( not ( = ?auto_41240 ?auto_41245 ) ) ( not ( = ?auto_41241 ?auto_41245 ) ) ( not ( = ?auto_41242 ?auto_41245 ) ) ( ON ?auto_41242 ?auto_41243 ) ( ON ?auto_41241 ?auto_41242 ) ( ON ?auto_41240 ?auto_41241 ) ( CLEAR ?auto_41240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41245 ?auto_41246 ?auto_41244 ?auto_41243 ?auto_41242 ?auto_41241 )
      ( MAKE-5PILE ?auto_41240 ?auto_41241 ?auto_41242 ?auto_41243 ?auto_41244 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41248 - BLOCK
    )
    :vars
    (
      ?auto_41249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41249 ?auto_41248 ) ( CLEAR ?auto_41249 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41248 ) ( not ( = ?auto_41248 ?auto_41249 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41249 ?auto_41248 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41250 - BLOCK
    )
    :vars
    (
      ?auto_41251 - BLOCK
      ?auto_41252 - BLOCK
      ?auto_41253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41251 ?auto_41250 ) ( CLEAR ?auto_41251 ) ( ON-TABLE ?auto_41250 ) ( not ( = ?auto_41250 ?auto_41251 ) ) ( HOLDING ?auto_41252 ) ( CLEAR ?auto_41253 ) ( not ( = ?auto_41250 ?auto_41252 ) ) ( not ( = ?auto_41250 ?auto_41253 ) ) ( not ( = ?auto_41251 ?auto_41252 ) ) ( not ( = ?auto_41251 ?auto_41253 ) ) ( not ( = ?auto_41252 ?auto_41253 ) ) )
    :subtasks
    ( ( !STACK ?auto_41252 ?auto_41253 )
      ( MAKE-1PILE ?auto_41250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41254 - BLOCK
    )
    :vars
    (
      ?auto_41255 - BLOCK
      ?auto_41256 - BLOCK
      ?auto_41257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41255 ?auto_41254 ) ( ON-TABLE ?auto_41254 ) ( not ( = ?auto_41254 ?auto_41255 ) ) ( CLEAR ?auto_41256 ) ( not ( = ?auto_41254 ?auto_41257 ) ) ( not ( = ?auto_41254 ?auto_41256 ) ) ( not ( = ?auto_41255 ?auto_41257 ) ) ( not ( = ?auto_41255 ?auto_41256 ) ) ( not ( = ?auto_41257 ?auto_41256 ) ) ( ON ?auto_41257 ?auto_41255 ) ( CLEAR ?auto_41257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41254 ?auto_41255 )
      ( MAKE-1PILE ?auto_41254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41258 - BLOCK
    )
    :vars
    (
      ?auto_41261 - BLOCK
      ?auto_41260 - BLOCK
      ?auto_41259 - BLOCK
      ?auto_41262 - BLOCK
      ?auto_41263 - BLOCK
      ?auto_41264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41261 ?auto_41258 ) ( ON-TABLE ?auto_41258 ) ( not ( = ?auto_41258 ?auto_41261 ) ) ( not ( = ?auto_41258 ?auto_41260 ) ) ( not ( = ?auto_41258 ?auto_41259 ) ) ( not ( = ?auto_41261 ?auto_41260 ) ) ( not ( = ?auto_41261 ?auto_41259 ) ) ( not ( = ?auto_41260 ?auto_41259 ) ) ( ON ?auto_41260 ?auto_41261 ) ( CLEAR ?auto_41260 ) ( HOLDING ?auto_41259 ) ( CLEAR ?auto_41262 ) ( ON-TABLE ?auto_41263 ) ( ON ?auto_41264 ?auto_41263 ) ( ON ?auto_41262 ?auto_41264 ) ( not ( = ?auto_41263 ?auto_41264 ) ) ( not ( = ?auto_41263 ?auto_41262 ) ) ( not ( = ?auto_41263 ?auto_41259 ) ) ( not ( = ?auto_41264 ?auto_41262 ) ) ( not ( = ?auto_41264 ?auto_41259 ) ) ( not ( = ?auto_41262 ?auto_41259 ) ) ( not ( = ?auto_41258 ?auto_41262 ) ) ( not ( = ?auto_41258 ?auto_41263 ) ) ( not ( = ?auto_41258 ?auto_41264 ) ) ( not ( = ?auto_41261 ?auto_41262 ) ) ( not ( = ?auto_41261 ?auto_41263 ) ) ( not ( = ?auto_41261 ?auto_41264 ) ) ( not ( = ?auto_41260 ?auto_41262 ) ) ( not ( = ?auto_41260 ?auto_41263 ) ) ( not ( = ?auto_41260 ?auto_41264 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41263 ?auto_41264 ?auto_41262 ?auto_41259 )
      ( MAKE-1PILE ?auto_41258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41265 - BLOCK
    )
    :vars
    (
      ?auto_41268 - BLOCK
      ?auto_41267 - BLOCK
      ?auto_41266 - BLOCK
      ?auto_41271 - BLOCK
      ?auto_41270 - BLOCK
      ?auto_41269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41268 ?auto_41265 ) ( ON-TABLE ?auto_41265 ) ( not ( = ?auto_41265 ?auto_41268 ) ) ( not ( = ?auto_41265 ?auto_41267 ) ) ( not ( = ?auto_41265 ?auto_41266 ) ) ( not ( = ?auto_41268 ?auto_41267 ) ) ( not ( = ?auto_41268 ?auto_41266 ) ) ( not ( = ?auto_41267 ?auto_41266 ) ) ( ON ?auto_41267 ?auto_41268 ) ( CLEAR ?auto_41271 ) ( ON-TABLE ?auto_41270 ) ( ON ?auto_41269 ?auto_41270 ) ( ON ?auto_41271 ?auto_41269 ) ( not ( = ?auto_41270 ?auto_41269 ) ) ( not ( = ?auto_41270 ?auto_41271 ) ) ( not ( = ?auto_41270 ?auto_41266 ) ) ( not ( = ?auto_41269 ?auto_41271 ) ) ( not ( = ?auto_41269 ?auto_41266 ) ) ( not ( = ?auto_41271 ?auto_41266 ) ) ( not ( = ?auto_41265 ?auto_41271 ) ) ( not ( = ?auto_41265 ?auto_41270 ) ) ( not ( = ?auto_41265 ?auto_41269 ) ) ( not ( = ?auto_41268 ?auto_41271 ) ) ( not ( = ?auto_41268 ?auto_41270 ) ) ( not ( = ?auto_41268 ?auto_41269 ) ) ( not ( = ?auto_41267 ?auto_41271 ) ) ( not ( = ?auto_41267 ?auto_41270 ) ) ( not ( = ?auto_41267 ?auto_41269 ) ) ( ON ?auto_41266 ?auto_41267 ) ( CLEAR ?auto_41266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41265 ?auto_41268 ?auto_41267 )
      ( MAKE-1PILE ?auto_41265 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41272 - BLOCK
    )
    :vars
    (
      ?auto_41275 - BLOCK
      ?auto_41278 - BLOCK
      ?auto_41277 - BLOCK
      ?auto_41273 - BLOCK
      ?auto_41276 - BLOCK
      ?auto_41274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41275 ?auto_41272 ) ( ON-TABLE ?auto_41272 ) ( not ( = ?auto_41272 ?auto_41275 ) ) ( not ( = ?auto_41272 ?auto_41278 ) ) ( not ( = ?auto_41272 ?auto_41277 ) ) ( not ( = ?auto_41275 ?auto_41278 ) ) ( not ( = ?auto_41275 ?auto_41277 ) ) ( not ( = ?auto_41278 ?auto_41277 ) ) ( ON ?auto_41278 ?auto_41275 ) ( ON-TABLE ?auto_41273 ) ( ON ?auto_41276 ?auto_41273 ) ( not ( = ?auto_41273 ?auto_41276 ) ) ( not ( = ?auto_41273 ?auto_41274 ) ) ( not ( = ?auto_41273 ?auto_41277 ) ) ( not ( = ?auto_41276 ?auto_41274 ) ) ( not ( = ?auto_41276 ?auto_41277 ) ) ( not ( = ?auto_41274 ?auto_41277 ) ) ( not ( = ?auto_41272 ?auto_41274 ) ) ( not ( = ?auto_41272 ?auto_41273 ) ) ( not ( = ?auto_41272 ?auto_41276 ) ) ( not ( = ?auto_41275 ?auto_41274 ) ) ( not ( = ?auto_41275 ?auto_41273 ) ) ( not ( = ?auto_41275 ?auto_41276 ) ) ( not ( = ?auto_41278 ?auto_41274 ) ) ( not ( = ?auto_41278 ?auto_41273 ) ) ( not ( = ?auto_41278 ?auto_41276 ) ) ( ON ?auto_41277 ?auto_41278 ) ( CLEAR ?auto_41277 ) ( HOLDING ?auto_41274 ) ( CLEAR ?auto_41276 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41273 ?auto_41276 ?auto_41274 )
      ( MAKE-1PILE ?auto_41272 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41279 - BLOCK
    )
    :vars
    (
      ?auto_41280 - BLOCK
      ?auto_41282 - BLOCK
      ?auto_41283 - BLOCK
      ?auto_41284 - BLOCK
      ?auto_41285 - BLOCK
      ?auto_41281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41280 ?auto_41279 ) ( ON-TABLE ?auto_41279 ) ( not ( = ?auto_41279 ?auto_41280 ) ) ( not ( = ?auto_41279 ?auto_41282 ) ) ( not ( = ?auto_41279 ?auto_41283 ) ) ( not ( = ?auto_41280 ?auto_41282 ) ) ( not ( = ?auto_41280 ?auto_41283 ) ) ( not ( = ?auto_41282 ?auto_41283 ) ) ( ON ?auto_41282 ?auto_41280 ) ( ON-TABLE ?auto_41284 ) ( ON ?auto_41285 ?auto_41284 ) ( not ( = ?auto_41284 ?auto_41285 ) ) ( not ( = ?auto_41284 ?auto_41281 ) ) ( not ( = ?auto_41284 ?auto_41283 ) ) ( not ( = ?auto_41285 ?auto_41281 ) ) ( not ( = ?auto_41285 ?auto_41283 ) ) ( not ( = ?auto_41281 ?auto_41283 ) ) ( not ( = ?auto_41279 ?auto_41281 ) ) ( not ( = ?auto_41279 ?auto_41284 ) ) ( not ( = ?auto_41279 ?auto_41285 ) ) ( not ( = ?auto_41280 ?auto_41281 ) ) ( not ( = ?auto_41280 ?auto_41284 ) ) ( not ( = ?auto_41280 ?auto_41285 ) ) ( not ( = ?auto_41282 ?auto_41281 ) ) ( not ( = ?auto_41282 ?auto_41284 ) ) ( not ( = ?auto_41282 ?auto_41285 ) ) ( ON ?auto_41283 ?auto_41282 ) ( CLEAR ?auto_41285 ) ( ON ?auto_41281 ?auto_41283 ) ( CLEAR ?auto_41281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41279 ?auto_41280 ?auto_41282 ?auto_41283 )
      ( MAKE-1PILE ?auto_41279 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41286 - BLOCK
    )
    :vars
    (
      ?auto_41288 - BLOCK
      ?auto_41287 - BLOCK
      ?auto_41292 - BLOCK
      ?auto_41291 - BLOCK
      ?auto_41289 - BLOCK
      ?auto_41290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41288 ?auto_41286 ) ( ON-TABLE ?auto_41286 ) ( not ( = ?auto_41286 ?auto_41288 ) ) ( not ( = ?auto_41286 ?auto_41287 ) ) ( not ( = ?auto_41286 ?auto_41292 ) ) ( not ( = ?auto_41288 ?auto_41287 ) ) ( not ( = ?auto_41288 ?auto_41292 ) ) ( not ( = ?auto_41287 ?auto_41292 ) ) ( ON ?auto_41287 ?auto_41288 ) ( ON-TABLE ?auto_41291 ) ( not ( = ?auto_41291 ?auto_41289 ) ) ( not ( = ?auto_41291 ?auto_41290 ) ) ( not ( = ?auto_41291 ?auto_41292 ) ) ( not ( = ?auto_41289 ?auto_41290 ) ) ( not ( = ?auto_41289 ?auto_41292 ) ) ( not ( = ?auto_41290 ?auto_41292 ) ) ( not ( = ?auto_41286 ?auto_41290 ) ) ( not ( = ?auto_41286 ?auto_41291 ) ) ( not ( = ?auto_41286 ?auto_41289 ) ) ( not ( = ?auto_41288 ?auto_41290 ) ) ( not ( = ?auto_41288 ?auto_41291 ) ) ( not ( = ?auto_41288 ?auto_41289 ) ) ( not ( = ?auto_41287 ?auto_41290 ) ) ( not ( = ?auto_41287 ?auto_41291 ) ) ( not ( = ?auto_41287 ?auto_41289 ) ) ( ON ?auto_41292 ?auto_41287 ) ( ON ?auto_41290 ?auto_41292 ) ( CLEAR ?auto_41290 ) ( HOLDING ?auto_41289 ) ( CLEAR ?auto_41291 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41291 ?auto_41289 )
      ( MAKE-1PILE ?auto_41286 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42139 - BLOCK
    )
    :vars
    (
      ?auto_42142 - BLOCK
      ?auto_42140 - BLOCK
      ?auto_42144 - BLOCK
      ?auto_42141 - BLOCK
      ?auto_42143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42142 ?auto_42139 ) ( ON-TABLE ?auto_42139 ) ( not ( = ?auto_42139 ?auto_42142 ) ) ( not ( = ?auto_42139 ?auto_42140 ) ) ( not ( = ?auto_42139 ?auto_42144 ) ) ( not ( = ?auto_42142 ?auto_42140 ) ) ( not ( = ?auto_42142 ?auto_42144 ) ) ( not ( = ?auto_42140 ?auto_42144 ) ) ( ON ?auto_42140 ?auto_42142 ) ( not ( = ?auto_42141 ?auto_42143 ) ) ( not ( = ?auto_42141 ?auto_42144 ) ) ( not ( = ?auto_42143 ?auto_42144 ) ) ( not ( = ?auto_42139 ?auto_42143 ) ) ( not ( = ?auto_42139 ?auto_42141 ) ) ( not ( = ?auto_42142 ?auto_42143 ) ) ( not ( = ?auto_42142 ?auto_42141 ) ) ( not ( = ?auto_42140 ?auto_42143 ) ) ( not ( = ?auto_42140 ?auto_42141 ) ) ( ON ?auto_42144 ?auto_42140 ) ( ON ?auto_42143 ?auto_42144 ) ( ON ?auto_42141 ?auto_42143 ) ( CLEAR ?auto_42141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42139 ?auto_42142 ?auto_42140 ?auto_42144 ?auto_42143 )
      ( MAKE-1PILE ?auto_42139 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41300 - BLOCK
    )
    :vars
    (
      ?auto_41304 - BLOCK
      ?auto_41302 - BLOCK
      ?auto_41306 - BLOCK
      ?auto_41305 - BLOCK
      ?auto_41301 - BLOCK
      ?auto_41303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41304 ?auto_41300 ) ( ON-TABLE ?auto_41300 ) ( not ( = ?auto_41300 ?auto_41304 ) ) ( not ( = ?auto_41300 ?auto_41302 ) ) ( not ( = ?auto_41300 ?auto_41306 ) ) ( not ( = ?auto_41304 ?auto_41302 ) ) ( not ( = ?auto_41304 ?auto_41306 ) ) ( not ( = ?auto_41302 ?auto_41306 ) ) ( ON ?auto_41302 ?auto_41304 ) ( not ( = ?auto_41305 ?auto_41301 ) ) ( not ( = ?auto_41305 ?auto_41303 ) ) ( not ( = ?auto_41305 ?auto_41306 ) ) ( not ( = ?auto_41301 ?auto_41303 ) ) ( not ( = ?auto_41301 ?auto_41306 ) ) ( not ( = ?auto_41303 ?auto_41306 ) ) ( not ( = ?auto_41300 ?auto_41303 ) ) ( not ( = ?auto_41300 ?auto_41305 ) ) ( not ( = ?auto_41300 ?auto_41301 ) ) ( not ( = ?auto_41304 ?auto_41303 ) ) ( not ( = ?auto_41304 ?auto_41305 ) ) ( not ( = ?auto_41304 ?auto_41301 ) ) ( not ( = ?auto_41302 ?auto_41303 ) ) ( not ( = ?auto_41302 ?auto_41305 ) ) ( not ( = ?auto_41302 ?auto_41301 ) ) ( ON ?auto_41306 ?auto_41302 ) ( ON ?auto_41303 ?auto_41306 ) ( ON ?auto_41301 ?auto_41303 ) ( CLEAR ?auto_41301 ) ( HOLDING ?auto_41305 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41305 )
      ( MAKE-1PILE ?auto_41300 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41307 - BLOCK
    )
    :vars
    (
      ?auto_41309 - BLOCK
      ?auto_41310 - BLOCK
      ?auto_41308 - BLOCK
      ?auto_41313 - BLOCK
      ?auto_41311 - BLOCK
      ?auto_41312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41309 ?auto_41307 ) ( ON-TABLE ?auto_41307 ) ( not ( = ?auto_41307 ?auto_41309 ) ) ( not ( = ?auto_41307 ?auto_41310 ) ) ( not ( = ?auto_41307 ?auto_41308 ) ) ( not ( = ?auto_41309 ?auto_41310 ) ) ( not ( = ?auto_41309 ?auto_41308 ) ) ( not ( = ?auto_41310 ?auto_41308 ) ) ( ON ?auto_41310 ?auto_41309 ) ( not ( = ?auto_41313 ?auto_41311 ) ) ( not ( = ?auto_41313 ?auto_41312 ) ) ( not ( = ?auto_41313 ?auto_41308 ) ) ( not ( = ?auto_41311 ?auto_41312 ) ) ( not ( = ?auto_41311 ?auto_41308 ) ) ( not ( = ?auto_41312 ?auto_41308 ) ) ( not ( = ?auto_41307 ?auto_41312 ) ) ( not ( = ?auto_41307 ?auto_41313 ) ) ( not ( = ?auto_41307 ?auto_41311 ) ) ( not ( = ?auto_41309 ?auto_41312 ) ) ( not ( = ?auto_41309 ?auto_41313 ) ) ( not ( = ?auto_41309 ?auto_41311 ) ) ( not ( = ?auto_41310 ?auto_41312 ) ) ( not ( = ?auto_41310 ?auto_41313 ) ) ( not ( = ?auto_41310 ?auto_41311 ) ) ( ON ?auto_41308 ?auto_41310 ) ( ON ?auto_41312 ?auto_41308 ) ( ON ?auto_41311 ?auto_41312 ) ( ON ?auto_41313 ?auto_41311 ) ( CLEAR ?auto_41313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41307 ?auto_41309 ?auto_41310 ?auto_41308 ?auto_41312 ?auto_41311 )
      ( MAKE-1PILE ?auto_41307 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41320 - BLOCK
      ?auto_41321 - BLOCK
      ?auto_41322 - BLOCK
      ?auto_41323 - BLOCK
      ?auto_41324 - BLOCK
      ?auto_41325 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_41325 ) ( CLEAR ?auto_41324 ) ( ON-TABLE ?auto_41320 ) ( ON ?auto_41321 ?auto_41320 ) ( ON ?auto_41322 ?auto_41321 ) ( ON ?auto_41323 ?auto_41322 ) ( ON ?auto_41324 ?auto_41323 ) ( not ( = ?auto_41320 ?auto_41321 ) ) ( not ( = ?auto_41320 ?auto_41322 ) ) ( not ( = ?auto_41320 ?auto_41323 ) ) ( not ( = ?auto_41320 ?auto_41324 ) ) ( not ( = ?auto_41320 ?auto_41325 ) ) ( not ( = ?auto_41321 ?auto_41322 ) ) ( not ( = ?auto_41321 ?auto_41323 ) ) ( not ( = ?auto_41321 ?auto_41324 ) ) ( not ( = ?auto_41321 ?auto_41325 ) ) ( not ( = ?auto_41322 ?auto_41323 ) ) ( not ( = ?auto_41322 ?auto_41324 ) ) ( not ( = ?auto_41322 ?auto_41325 ) ) ( not ( = ?auto_41323 ?auto_41324 ) ) ( not ( = ?auto_41323 ?auto_41325 ) ) ( not ( = ?auto_41324 ?auto_41325 ) ) )
    :subtasks
    ( ( !STACK ?auto_41325 ?auto_41324 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41326 - BLOCK
      ?auto_41327 - BLOCK
      ?auto_41328 - BLOCK
      ?auto_41329 - BLOCK
      ?auto_41330 - BLOCK
      ?auto_41331 - BLOCK
    )
    :vars
    (
      ?auto_41332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41330 ) ( ON-TABLE ?auto_41326 ) ( ON ?auto_41327 ?auto_41326 ) ( ON ?auto_41328 ?auto_41327 ) ( ON ?auto_41329 ?auto_41328 ) ( ON ?auto_41330 ?auto_41329 ) ( not ( = ?auto_41326 ?auto_41327 ) ) ( not ( = ?auto_41326 ?auto_41328 ) ) ( not ( = ?auto_41326 ?auto_41329 ) ) ( not ( = ?auto_41326 ?auto_41330 ) ) ( not ( = ?auto_41326 ?auto_41331 ) ) ( not ( = ?auto_41327 ?auto_41328 ) ) ( not ( = ?auto_41327 ?auto_41329 ) ) ( not ( = ?auto_41327 ?auto_41330 ) ) ( not ( = ?auto_41327 ?auto_41331 ) ) ( not ( = ?auto_41328 ?auto_41329 ) ) ( not ( = ?auto_41328 ?auto_41330 ) ) ( not ( = ?auto_41328 ?auto_41331 ) ) ( not ( = ?auto_41329 ?auto_41330 ) ) ( not ( = ?auto_41329 ?auto_41331 ) ) ( not ( = ?auto_41330 ?auto_41331 ) ) ( ON ?auto_41331 ?auto_41332 ) ( CLEAR ?auto_41331 ) ( HAND-EMPTY ) ( not ( = ?auto_41326 ?auto_41332 ) ) ( not ( = ?auto_41327 ?auto_41332 ) ) ( not ( = ?auto_41328 ?auto_41332 ) ) ( not ( = ?auto_41329 ?auto_41332 ) ) ( not ( = ?auto_41330 ?auto_41332 ) ) ( not ( = ?auto_41331 ?auto_41332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41331 ?auto_41332 )
      ( MAKE-6PILE ?auto_41326 ?auto_41327 ?auto_41328 ?auto_41329 ?auto_41330 ?auto_41331 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41333 - BLOCK
      ?auto_41334 - BLOCK
      ?auto_41335 - BLOCK
      ?auto_41336 - BLOCK
      ?auto_41337 - BLOCK
      ?auto_41338 - BLOCK
    )
    :vars
    (
      ?auto_41339 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41333 ) ( ON ?auto_41334 ?auto_41333 ) ( ON ?auto_41335 ?auto_41334 ) ( ON ?auto_41336 ?auto_41335 ) ( not ( = ?auto_41333 ?auto_41334 ) ) ( not ( = ?auto_41333 ?auto_41335 ) ) ( not ( = ?auto_41333 ?auto_41336 ) ) ( not ( = ?auto_41333 ?auto_41337 ) ) ( not ( = ?auto_41333 ?auto_41338 ) ) ( not ( = ?auto_41334 ?auto_41335 ) ) ( not ( = ?auto_41334 ?auto_41336 ) ) ( not ( = ?auto_41334 ?auto_41337 ) ) ( not ( = ?auto_41334 ?auto_41338 ) ) ( not ( = ?auto_41335 ?auto_41336 ) ) ( not ( = ?auto_41335 ?auto_41337 ) ) ( not ( = ?auto_41335 ?auto_41338 ) ) ( not ( = ?auto_41336 ?auto_41337 ) ) ( not ( = ?auto_41336 ?auto_41338 ) ) ( not ( = ?auto_41337 ?auto_41338 ) ) ( ON ?auto_41338 ?auto_41339 ) ( CLEAR ?auto_41338 ) ( not ( = ?auto_41333 ?auto_41339 ) ) ( not ( = ?auto_41334 ?auto_41339 ) ) ( not ( = ?auto_41335 ?auto_41339 ) ) ( not ( = ?auto_41336 ?auto_41339 ) ) ( not ( = ?auto_41337 ?auto_41339 ) ) ( not ( = ?auto_41338 ?auto_41339 ) ) ( HOLDING ?auto_41337 ) ( CLEAR ?auto_41336 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41333 ?auto_41334 ?auto_41335 ?auto_41336 ?auto_41337 )
      ( MAKE-6PILE ?auto_41333 ?auto_41334 ?auto_41335 ?auto_41336 ?auto_41337 ?auto_41338 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41340 - BLOCK
      ?auto_41341 - BLOCK
      ?auto_41342 - BLOCK
      ?auto_41343 - BLOCK
      ?auto_41344 - BLOCK
      ?auto_41345 - BLOCK
    )
    :vars
    (
      ?auto_41346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41340 ) ( ON ?auto_41341 ?auto_41340 ) ( ON ?auto_41342 ?auto_41341 ) ( ON ?auto_41343 ?auto_41342 ) ( not ( = ?auto_41340 ?auto_41341 ) ) ( not ( = ?auto_41340 ?auto_41342 ) ) ( not ( = ?auto_41340 ?auto_41343 ) ) ( not ( = ?auto_41340 ?auto_41344 ) ) ( not ( = ?auto_41340 ?auto_41345 ) ) ( not ( = ?auto_41341 ?auto_41342 ) ) ( not ( = ?auto_41341 ?auto_41343 ) ) ( not ( = ?auto_41341 ?auto_41344 ) ) ( not ( = ?auto_41341 ?auto_41345 ) ) ( not ( = ?auto_41342 ?auto_41343 ) ) ( not ( = ?auto_41342 ?auto_41344 ) ) ( not ( = ?auto_41342 ?auto_41345 ) ) ( not ( = ?auto_41343 ?auto_41344 ) ) ( not ( = ?auto_41343 ?auto_41345 ) ) ( not ( = ?auto_41344 ?auto_41345 ) ) ( ON ?auto_41345 ?auto_41346 ) ( not ( = ?auto_41340 ?auto_41346 ) ) ( not ( = ?auto_41341 ?auto_41346 ) ) ( not ( = ?auto_41342 ?auto_41346 ) ) ( not ( = ?auto_41343 ?auto_41346 ) ) ( not ( = ?auto_41344 ?auto_41346 ) ) ( not ( = ?auto_41345 ?auto_41346 ) ) ( CLEAR ?auto_41343 ) ( ON ?auto_41344 ?auto_41345 ) ( CLEAR ?auto_41344 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41346 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41346 ?auto_41345 )
      ( MAKE-6PILE ?auto_41340 ?auto_41341 ?auto_41342 ?auto_41343 ?auto_41344 ?auto_41345 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41347 - BLOCK
      ?auto_41348 - BLOCK
      ?auto_41349 - BLOCK
      ?auto_41350 - BLOCK
      ?auto_41351 - BLOCK
      ?auto_41352 - BLOCK
    )
    :vars
    (
      ?auto_41353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41347 ) ( ON ?auto_41348 ?auto_41347 ) ( ON ?auto_41349 ?auto_41348 ) ( not ( = ?auto_41347 ?auto_41348 ) ) ( not ( = ?auto_41347 ?auto_41349 ) ) ( not ( = ?auto_41347 ?auto_41350 ) ) ( not ( = ?auto_41347 ?auto_41351 ) ) ( not ( = ?auto_41347 ?auto_41352 ) ) ( not ( = ?auto_41348 ?auto_41349 ) ) ( not ( = ?auto_41348 ?auto_41350 ) ) ( not ( = ?auto_41348 ?auto_41351 ) ) ( not ( = ?auto_41348 ?auto_41352 ) ) ( not ( = ?auto_41349 ?auto_41350 ) ) ( not ( = ?auto_41349 ?auto_41351 ) ) ( not ( = ?auto_41349 ?auto_41352 ) ) ( not ( = ?auto_41350 ?auto_41351 ) ) ( not ( = ?auto_41350 ?auto_41352 ) ) ( not ( = ?auto_41351 ?auto_41352 ) ) ( ON ?auto_41352 ?auto_41353 ) ( not ( = ?auto_41347 ?auto_41353 ) ) ( not ( = ?auto_41348 ?auto_41353 ) ) ( not ( = ?auto_41349 ?auto_41353 ) ) ( not ( = ?auto_41350 ?auto_41353 ) ) ( not ( = ?auto_41351 ?auto_41353 ) ) ( not ( = ?auto_41352 ?auto_41353 ) ) ( ON ?auto_41351 ?auto_41352 ) ( CLEAR ?auto_41351 ) ( ON-TABLE ?auto_41353 ) ( HOLDING ?auto_41350 ) ( CLEAR ?auto_41349 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41347 ?auto_41348 ?auto_41349 ?auto_41350 )
      ( MAKE-6PILE ?auto_41347 ?auto_41348 ?auto_41349 ?auto_41350 ?auto_41351 ?auto_41352 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41354 - BLOCK
      ?auto_41355 - BLOCK
      ?auto_41356 - BLOCK
      ?auto_41357 - BLOCK
      ?auto_41358 - BLOCK
      ?auto_41359 - BLOCK
    )
    :vars
    (
      ?auto_41360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41354 ) ( ON ?auto_41355 ?auto_41354 ) ( ON ?auto_41356 ?auto_41355 ) ( not ( = ?auto_41354 ?auto_41355 ) ) ( not ( = ?auto_41354 ?auto_41356 ) ) ( not ( = ?auto_41354 ?auto_41357 ) ) ( not ( = ?auto_41354 ?auto_41358 ) ) ( not ( = ?auto_41354 ?auto_41359 ) ) ( not ( = ?auto_41355 ?auto_41356 ) ) ( not ( = ?auto_41355 ?auto_41357 ) ) ( not ( = ?auto_41355 ?auto_41358 ) ) ( not ( = ?auto_41355 ?auto_41359 ) ) ( not ( = ?auto_41356 ?auto_41357 ) ) ( not ( = ?auto_41356 ?auto_41358 ) ) ( not ( = ?auto_41356 ?auto_41359 ) ) ( not ( = ?auto_41357 ?auto_41358 ) ) ( not ( = ?auto_41357 ?auto_41359 ) ) ( not ( = ?auto_41358 ?auto_41359 ) ) ( ON ?auto_41359 ?auto_41360 ) ( not ( = ?auto_41354 ?auto_41360 ) ) ( not ( = ?auto_41355 ?auto_41360 ) ) ( not ( = ?auto_41356 ?auto_41360 ) ) ( not ( = ?auto_41357 ?auto_41360 ) ) ( not ( = ?auto_41358 ?auto_41360 ) ) ( not ( = ?auto_41359 ?auto_41360 ) ) ( ON ?auto_41358 ?auto_41359 ) ( ON-TABLE ?auto_41360 ) ( CLEAR ?auto_41356 ) ( ON ?auto_41357 ?auto_41358 ) ( CLEAR ?auto_41357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41360 ?auto_41359 ?auto_41358 )
      ( MAKE-6PILE ?auto_41354 ?auto_41355 ?auto_41356 ?auto_41357 ?auto_41358 ?auto_41359 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41361 - BLOCK
      ?auto_41362 - BLOCK
      ?auto_41363 - BLOCK
      ?auto_41364 - BLOCK
      ?auto_41365 - BLOCK
      ?auto_41366 - BLOCK
    )
    :vars
    (
      ?auto_41367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41361 ) ( ON ?auto_41362 ?auto_41361 ) ( not ( = ?auto_41361 ?auto_41362 ) ) ( not ( = ?auto_41361 ?auto_41363 ) ) ( not ( = ?auto_41361 ?auto_41364 ) ) ( not ( = ?auto_41361 ?auto_41365 ) ) ( not ( = ?auto_41361 ?auto_41366 ) ) ( not ( = ?auto_41362 ?auto_41363 ) ) ( not ( = ?auto_41362 ?auto_41364 ) ) ( not ( = ?auto_41362 ?auto_41365 ) ) ( not ( = ?auto_41362 ?auto_41366 ) ) ( not ( = ?auto_41363 ?auto_41364 ) ) ( not ( = ?auto_41363 ?auto_41365 ) ) ( not ( = ?auto_41363 ?auto_41366 ) ) ( not ( = ?auto_41364 ?auto_41365 ) ) ( not ( = ?auto_41364 ?auto_41366 ) ) ( not ( = ?auto_41365 ?auto_41366 ) ) ( ON ?auto_41366 ?auto_41367 ) ( not ( = ?auto_41361 ?auto_41367 ) ) ( not ( = ?auto_41362 ?auto_41367 ) ) ( not ( = ?auto_41363 ?auto_41367 ) ) ( not ( = ?auto_41364 ?auto_41367 ) ) ( not ( = ?auto_41365 ?auto_41367 ) ) ( not ( = ?auto_41366 ?auto_41367 ) ) ( ON ?auto_41365 ?auto_41366 ) ( ON-TABLE ?auto_41367 ) ( ON ?auto_41364 ?auto_41365 ) ( CLEAR ?auto_41364 ) ( HOLDING ?auto_41363 ) ( CLEAR ?auto_41362 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41361 ?auto_41362 ?auto_41363 )
      ( MAKE-6PILE ?auto_41361 ?auto_41362 ?auto_41363 ?auto_41364 ?auto_41365 ?auto_41366 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41368 - BLOCK
      ?auto_41369 - BLOCK
      ?auto_41370 - BLOCK
      ?auto_41371 - BLOCK
      ?auto_41372 - BLOCK
      ?auto_41373 - BLOCK
    )
    :vars
    (
      ?auto_41374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41368 ) ( ON ?auto_41369 ?auto_41368 ) ( not ( = ?auto_41368 ?auto_41369 ) ) ( not ( = ?auto_41368 ?auto_41370 ) ) ( not ( = ?auto_41368 ?auto_41371 ) ) ( not ( = ?auto_41368 ?auto_41372 ) ) ( not ( = ?auto_41368 ?auto_41373 ) ) ( not ( = ?auto_41369 ?auto_41370 ) ) ( not ( = ?auto_41369 ?auto_41371 ) ) ( not ( = ?auto_41369 ?auto_41372 ) ) ( not ( = ?auto_41369 ?auto_41373 ) ) ( not ( = ?auto_41370 ?auto_41371 ) ) ( not ( = ?auto_41370 ?auto_41372 ) ) ( not ( = ?auto_41370 ?auto_41373 ) ) ( not ( = ?auto_41371 ?auto_41372 ) ) ( not ( = ?auto_41371 ?auto_41373 ) ) ( not ( = ?auto_41372 ?auto_41373 ) ) ( ON ?auto_41373 ?auto_41374 ) ( not ( = ?auto_41368 ?auto_41374 ) ) ( not ( = ?auto_41369 ?auto_41374 ) ) ( not ( = ?auto_41370 ?auto_41374 ) ) ( not ( = ?auto_41371 ?auto_41374 ) ) ( not ( = ?auto_41372 ?auto_41374 ) ) ( not ( = ?auto_41373 ?auto_41374 ) ) ( ON ?auto_41372 ?auto_41373 ) ( ON-TABLE ?auto_41374 ) ( ON ?auto_41371 ?auto_41372 ) ( CLEAR ?auto_41369 ) ( ON ?auto_41370 ?auto_41371 ) ( CLEAR ?auto_41370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41374 ?auto_41373 ?auto_41372 ?auto_41371 )
      ( MAKE-6PILE ?auto_41368 ?auto_41369 ?auto_41370 ?auto_41371 ?auto_41372 ?auto_41373 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41375 - BLOCK
      ?auto_41376 - BLOCK
      ?auto_41377 - BLOCK
      ?auto_41378 - BLOCK
      ?auto_41379 - BLOCK
      ?auto_41380 - BLOCK
    )
    :vars
    (
      ?auto_41381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41375 ) ( not ( = ?auto_41375 ?auto_41376 ) ) ( not ( = ?auto_41375 ?auto_41377 ) ) ( not ( = ?auto_41375 ?auto_41378 ) ) ( not ( = ?auto_41375 ?auto_41379 ) ) ( not ( = ?auto_41375 ?auto_41380 ) ) ( not ( = ?auto_41376 ?auto_41377 ) ) ( not ( = ?auto_41376 ?auto_41378 ) ) ( not ( = ?auto_41376 ?auto_41379 ) ) ( not ( = ?auto_41376 ?auto_41380 ) ) ( not ( = ?auto_41377 ?auto_41378 ) ) ( not ( = ?auto_41377 ?auto_41379 ) ) ( not ( = ?auto_41377 ?auto_41380 ) ) ( not ( = ?auto_41378 ?auto_41379 ) ) ( not ( = ?auto_41378 ?auto_41380 ) ) ( not ( = ?auto_41379 ?auto_41380 ) ) ( ON ?auto_41380 ?auto_41381 ) ( not ( = ?auto_41375 ?auto_41381 ) ) ( not ( = ?auto_41376 ?auto_41381 ) ) ( not ( = ?auto_41377 ?auto_41381 ) ) ( not ( = ?auto_41378 ?auto_41381 ) ) ( not ( = ?auto_41379 ?auto_41381 ) ) ( not ( = ?auto_41380 ?auto_41381 ) ) ( ON ?auto_41379 ?auto_41380 ) ( ON-TABLE ?auto_41381 ) ( ON ?auto_41378 ?auto_41379 ) ( ON ?auto_41377 ?auto_41378 ) ( CLEAR ?auto_41377 ) ( HOLDING ?auto_41376 ) ( CLEAR ?auto_41375 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41375 ?auto_41376 )
      ( MAKE-6PILE ?auto_41375 ?auto_41376 ?auto_41377 ?auto_41378 ?auto_41379 ?auto_41380 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41382 - BLOCK
      ?auto_41383 - BLOCK
      ?auto_41384 - BLOCK
      ?auto_41385 - BLOCK
      ?auto_41386 - BLOCK
      ?auto_41387 - BLOCK
    )
    :vars
    (
      ?auto_41388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41382 ) ( not ( = ?auto_41382 ?auto_41383 ) ) ( not ( = ?auto_41382 ?auto_41384 ) ) ( not ( = ?auto_41382 ?auto_41385 ) ) ( not ( = ?auto_41382 ?auto_41386 ) ) ( not ( = ?auto_41382 ?auto_41387 ) ) ( not ( = ?auto_41383 ?auto_41384 ) ) ( not ( = ?auto_41383 ?auto_41385 ) ) ( not ( = ?auto_41383 ?auto_41386 ) ) ( not ( = ?auto_41383 ?auto_41387 ) ) ( not ( = ?auto_41384 ?auto_41385 ) ) ( not ( = ?auto_41384 ?auto_41386 ) ) ( not ( = ?auto_41384 ?auto_41387 ) ) ( not ( = ?auto_41385 ?auto_41386 ) ) ( not ( = ?auto_41385 ?auto_41387 ) ) ( not ( = ?auto_41386 ?auto_41387 ) ) ( ON ?auto_41387 ?auto_41388 ) ( not ( = ?auto_41382 ?auto_41388 ) ) ( not ( = ?auto_41383 ?auto_41388 ) ) ( not ( = ?auto_41384 ?auto_41388 ) ) ( not ( = ?auto_41385 ?auto_41388 ) ) ( not ( = ?auto_41386 ?auto_41388 ) ) ( not ( = ?auto_41387 ?auto_41388 ) ) ( ON ?auto_41386 ?auto_41387 ) ( ON-TABLE ?auto_41388 ) ( ON ?auto_41385 ?auto_41386 ) ( ON ?auto_41384 ?auto_41385 ) ( CLEAR ?auto_41382 ) ( ON ?auto_41383 ?auto_41384 ) ( CLEAR ?auto_41383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41388 ?auto_41387 ?auto_41386 ?auto_41385 ?auto_41384 )
      ( MAKE-6PILE ?auto_41382 ?auto_41383 ?auto_41384 ?auto_41385 ?auto_41386 ?auto_41387 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41389 - BLOCK
      ?auto_41390 - BLOCK
      ?auto_41391 - BLOCK
      ?auto_41392 - BLOCK
      ?auto_41393 - BLOCK
      ?auto_41394 - BLOCK
    )
    :vars
    (
      ?auto_41395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41389 ?auto_41390 ) ) ( not ( = ?auto_41389 ?auto_41391 ) ) ( not ( = ?auto_41389 ?auto_41392 ) ) ( not ( = ?auto_41389 ?auto_41393 ) ) ( not ( = ?auto_41389 ?auto_41394 ) ) ( not ( = ?auto_41390 ?auto_41391 ) ) ( not ( = ?auto_41390 ?auto_41392 ) ) ( not ( = ?auto_41390 ?auto_41393 ) ) ( not ( = ?auto_41390 ?auto_41394 ) ) ( not ( = ?auto_41391 ?auto_41392 ) ) ( not ( = ?auto_41391 ?auto_41393 ) ) ( not ( = ?auto_41391 ?auto_41394 ) ) ( not ( = ?auto_41392 ?auto_41393 ) ) ( not ( = ?auto_41392 ?auto_41394 ) ) ( not ( = ?auto_41393 ?auto_41394 ) ) ( ON ?auto_41394 ?auto_41395 ) ( not ( = ?auto_41389 ?auto_41395 ) ) ( not ( = ?auto_41390 ?auto_41395 ) ) ( not ( = ?auto_41391 ?auto_41395 ) ) ( not ( = ?auto_41392 ?auto_41395 ) ) ( not ( = ?auto_41393 ?auto_41395 ) ) ( not ( = ?auto_41394 ?auto_41395 ) ) ( ON ?auto_41393 ?auto_41394 ) ( ON-TABLE ?auto_41395 ) ( ON ?auto_41392 ?auto_41393 ) ( ON ?auto_41391 ?auto_41392 ) ( ON ?auto_41390 ?auto_41391 ) ( CLEAR ?auto_41390 ) ( HOLDING ?auto_41389 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41389 )
      ( MAKE-6PILE ?auto_41389 ?auto_41390 ?auto_41391 ?auto_41392 ?auto_41393 ?auto_41394 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41396 - BLOCK
      ?auto_41397 - BLOCK
      ?auto_41398 - BLOCK
      ?auto_41399 - BLOCK
      ?auto_41400 - BLOCK
      ?auto_41401 - BLOCK
    )
    :vars
    (
      ?auto_41402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41396 ?auto_41397 ) ) ( not ( = ?auto_41396 ?auto_41398 ) ) ( not ( = ?auto_41396 ?auto_41399 ) ) ( not ( = ?auto_41396 ?auto_41400 ) ) ( not ( = ?auto_41396 ?auto_41401 ) ) ( not ( = ?auto_41397 ?auto_41398 ) ) ( not ( = ?auto_41397 ?auto_41399 ) ) ( not ( = ?auto_41397 ?auto_41400 ) ) ( not ( = ?auto_41397 ?auto_41401 ) ) ( not ( = ?auto_41398 ?auto_41399 ) ) ( not ( = ?auto_41398 ?auto_41400 ) ) ( not ( = ?auto_41398 ?auto_41401 ) ) ( not ( = ?auto_41399 ?auto_41400 ) ) ( not ( = ?auto_41399 ?auto_41401 ) ) ( not ( = ?auto_41400 ?auto_41401 ) ) ( ON ?auto_41401 ?auto_41402 ) ( not ( = ?auto_41396 ?auto_41402 ) ) ( not ( = ?auto_41397 ?auto_41402 ) ) ( not ( = ?auto_41398 ?auto_41402 ) ) ( not ( = ?auto_41399 ?auto_41402 ) ) ( not ( = ?auto_41400 ?auto_41402 ) ) ( not ( = ?auto_41401 ?auto_41402 ) ) ( ON ?auto_41400 ?auto_41401 ) ( ON-TABLE ?auto_41402 ) ( ON ?auto_41399 ?auto_41400 ) ( ON ?auto_41398 ?auto_41399 ) ( ON ?auto_41397 ?auto_41398 ) ( ON ?auto_41396 ?auto_41397 ) ( CLEAR ?auto_41396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41402 ?auto_41401 ?auto_41400 ?auto_41399 ?auto_41398 ?auto_41397 )
      ( MAKE-6PILE ?auto_41396 ?auto_41397 ?auto_41398 ?auto_41399 ?auto_41400 ?auto_41401 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41483 - BLOCK
    )
    :vars
    (
      ?auto_41484 - BLOCK
      ?auto_41485 - BLOCK
      ?auto_41486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41483 ?auto_41484 ) ( CLEAR ?auto_41483 ) ( not ( = ?auto_41483 ?auto_41484 ) ) ( HOLDING ?auto_41485 ) ( CLEAR ?auto_41486 ) ( not ( = ?auto_41483 ?auto_41485 ) ) ( not ( = ?auto_41483 ?auto_41486 ) ) ( not ( = ?auto_41484 ?auto_41485 ) ) ( not ( = ?auto_41484 ?auto_41486 ) ) ( not ( = ?auto_41485 ?auto_41486 ) ) )
    :subtasks
    ( ( !STACK ?auto_41485 ?auto_41486 )
      ( MAKE-1PILE ?auto_41483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41487 - BLOCK
    )
    :vars
    (
      ?auto_41490 - BLOCK
      ?auto_41488 - BLOCK
      ?auto_41489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41487 ?auto_41490 ) ( not ( = ?auto_41487 ?auto_41490 ) ) ( CLEAR ?auto_41488 ) ( not ( = ?auto_41487 ?auto_41489 ) ) ( not ( = ?auto_41487 ?auto_41488 ) ) ( not ( = ?auto_41490 ?auto_41489 ) ) ( not ( = ?auto_41490 ?auto_41488 ) ) ( not ( = ?auto_41489 ?auto_41488 ) ) ( ON ?auto_41489 ?auto_41487 ) ( CLEAR ?auto_41489 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41490 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41490 ?auto_41487 )
      ( MAKE-1PILE ?auto_41487 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41491 - BLOCK
    )
    :vars
    (
      ?auto_41493 - BLOCK
      ?auto_41494 - BLOCK
      ?auto_41492 - BLOCK
      ?auto_41495 - BLOCK
      ?auto_41496 - BLOCK
      ?auto_41497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41491 ?auto_41493 ) ( not ( = ?auto_41491 ?auto_41493 ) ) ( not ( = ?auto_41491 ?auto_41494 ) ) ( not ( = ?auto_41491 ?auto_41492 ) ) ( not ( = ?auto_41493 ?auto_41494 ) ) ( not ( = ?auto_41493 ?auto_41492 ) ) ( not ( = ?auto_41494 ?auto_41492 ) ) ( ON ?auto_41494 ?auto_41491 ) ( CLEAR ?auto_41494 ) ( ON-TABLE ?auto_41493 ) ( HOLDING ?auto_41492 ) ( CLEAR ?auto_41495 ) ( ON-TABLE ?auto_41496 ) ( ON ?auto_41497 ?auto_41496 ) ( ON ?auto_41495 ?auto_41497 ) ( not ( = ?auto_41496 ?auto_41497 ) ) ( not ( = ?auto_41496 ?auto_41495 ) ) ( not ( = ?auto_41496 ?auto_41492 ) ) ( not ( = ?auto_41497 ?auto_41495 ) ) ( not ( = ?auto_41497 ?auto_41492 ) ) ( not ( = ?auto_41495 ?auto_41492 ) ) ( not ( = ?auto_41491 ?auto_41495 ) ) ( not ( = ?auto_41491 ?auto_41496 ) ) ( not ( = ?auto_41491 ?auto_41497 ) ) ( not ( = ?auto_41493 ?auto_41495 ) ) ( not ( = ?auto_41493 ?auto_41496 ) ) ( not ( = ?auto_41493 ?auto_41497 ) ) ( not ( = ?auto_41494 ?auto_41495 ) ) ( not ( = ?auto_41494 ?auto_41496 ) ) ( not ( = ?auto_41494 ?auto_41497 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41496 ?auto_41497 ?auto_41495 ?auto_41492 )
      ( MAKE-1PILE ?auto_41491 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41498 - BLOCK
    )
    :vars
    (
      ?auto_41502 - BLOCK
      ?auto_41504 - BLOCK
      ?auto_41503 - BLOCK
      ?auto_41500 - BLOCK
      ?auto_41501 - BLOCK
      ?auto_41499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41498 ?auto_41502 ) ( not ( = ?auto_41498 ?auto_41502 ) ) ( not ( = ?auto_41498 ?auto_41504 ) ) ( not ( = ?auto_41498 ?auto_41503 ) ) ( not ( = ?auto_41502 ?auto_41504 ) ) ( not ( = ?auto_41502 ?auto_41503 ) ) ( not ( = ?auto_41504 ?auto_41503 ) ) ( ON ?auto_41504 ?auto_41498 ) ( ON-TABLE ?auto_41502 ) ( CLEAR ?auto_41500 ) ( ON-TABLE ?auto_41501 ) ( ON ?auto_41499 ?auto_41501 ) ( ON ?auto_41500 ?auto_41499 ) ( not ( = ?auto_41501 ?auto_41499 ) ) ( not ( = ?auto_41501 ?auto_41500 ) ) ( not ( = ?auto_41501 ?auto_41503 ) ) ( not ( = ?auto_41499 ?auto_41500 ) ) ( not ( = ?auto_41499 ?auto_41503 ) ) ( not ( = ?auto_41500 ?auto_41503 ) ) ( not ( = ?auto_41498 ?auto_41500 ) ) ( not ( = ?auto_41498 ?auto_41501 ) ) ( not ( = ?auto_41498 ?auto_41499 ) ) ( not ( = ?auto_41502 ?auto_41500 ) ) ( not ( = ?auto_41502 ?auto_41501 ) ) ( not ( = ?auto_41502 ?auto_41499 ) ) ( not ( = ?auto_41504 ?auto_41500 ) ) ( not ( = ?auto_41504 ?auto_41501 ) ) ( not ( = ?auto_41504 ?auto_41499 ) ) ( ON ?auto_41503 ?auto_41504 ) ( CLEAR ?auto_41503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41502 ?auto_41498 ?auto_41504 )
      ( MAKE-1PILE ?auto_41498 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41505 - BLOCK
    )
    :vars
    (
      ?auto_41508 - BLOCK
      ?auto_41511 - BLOCK
      ?auto_41509 - BLOCK
      ?auto_41507 - BLOCK
      ?auto_41510 - BLOCK
      ?auto_41506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41505 ?auto_41508 ) ( not ( = ?auto_41505 ?auto_41508 ) ) ( not ( = ?auto_41505 ?auto_41511 ) ) ( not ( = ?auto_41505 ?auto_41509 ) ) ( not ( = ?auto_41508 ?auto_41511 ) ) ( not ( = ?auto_41508 ?auto_41509 ) ) ( not ( = ?auto_41511 ?auto_41509 ) ) ( ON ?auto_41511 ?auto_41505 ) ( ON-TABLE ?auto_41508 ) ( ON-TABLE ?auto_41507 ) ( ON ?auto_41510 ?auto_41507 ) ( not ( = ?auto_41507 ?auto_41510 ) ) ( not ( = ?auto_41507 ?auto_41506 ) ) ( not ( = ?auto_41507 ?auto_41509 ) ) ( not ( = ?auto_41510 ?auto_41506 ) ) ( not ( = ?auto_41510 ?auto_41509 ) ) ( not ( = ?auto_41506 ?auto_41509 ) ) ( not ( = ?auto_41505 ?auto_41506 ) ) ( not ( = ?auto_41505 ?auto_41507 ) ) ( not ( = ?auto_41505 ?auto_41510 ) ) ( not ( = ?auto_41508 ?auto_41506 ) ) ( not ( = ?auto_41508 ?auto_41507 ) ) ( not ( = ?auto_41508 ?auto_41510 ) ) ( not ( = ?auto_41511 ?auto_41506 ) ) ( not ( = ?auto_41511 ?auto_41507 ) ) ( not ( = ?auto_41511 ?auto_41510 ) ) ( ON ?auto_41509 ?auto_41511 ) ( CLEAR ?auto_41509 ) ( HOLDING ?auto_41506 ) ( CLEAR ?auto_41510 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41507 ?auto_41510 ?auto_41506 )
      ( MAKE-1PILE ?auto_41505 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41512 - BLOCK
    )
    :vars
    (
      ?auto_41516 - BLOCK
      ?auto_41517 - BLOCK
      ?auto_41514 - BLOCK
      ?auto_41518 - BLOCK
      ?auto_41513 - BLOCK
      ?auto_41515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41512 ?auto_41516 ) ( not ( = ?auto_41512 ?auto_41516 ) ) ( not ( = ?auto_41512 ?auto_41517 ) ) ( not ( = ?auto_41512 ?auto_41514 ) ) ( not ( = ?auto_41516 ?auto_41517 ) ) ( not ( = ?auto_41516 ?auto_41514 ) ) ( not ( = ?auto_41517 ?auto_41514 ) ) ( ON ?auto_41517 ?auto_41512 ) ( ON-TABLE ?auto_41516 ) ( ON-TABLE ?auto_41518 ) ( ON ?auto_41513 ?auto_41518 ) ( not ( = ?auto_41518 ?auto_41513 ) ) ( not ( = ?auto_41518 ?auto_41515 ) ) ( not ( = ?auto_41518 ?auto_41514 ) ) ( not ( = ?auto_41513 ?auto_41515 ) ) ( not ( = ?auto_41513 ?auto_41514 ) ) ( not ( = ?auto_41515 ?auto_41514 ) ) ( not ( = ?auto_41512 ?auto_41515 ) ) ( not ( = ?auto_41512 ?auto_41518 ) ) ( not ( = ?auto_41512 ?auto_41513 ) ) ( not ( = ?auto_41516 ?auto_41515 ) ) ( not ( = ?auto_41516 ?auto_41518 ) ) ( not ( = ?auto_41516 ?auto_41513 ) ) ( not ( = ?auto_41517 ?auto_41515 ) ) ( not ( = ?auto_41517 ?auto_41518 ) ) ( not ( = ?auto_41517 ?auto_41513 ) ) ( ON ?auto_41514 ?auto_41517 ) ( CLEAR ?auto_41513 ) ( ON ?auto_41515 ?auto_41514 ) ( CLEAR ?auto_41515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41516 ?auto_41512 ?auto_41517 ?auto_41514 )
      ( MAKE-1PILE ?auto_41512 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41519 - BLOCK
    )
    :vars
    (
      ?auto_41525 - BLOCK
      ?auto_41522 - BLOCK
      ?auto_41521 - BLOCK
      ?auto_41524 - BLOCK
      ?auto_41520 - BLOCK
      ?auto_41523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41519 ?auto_41525 ) ( not ( = ?auto_41519 ?auto_41525 ) ) ( not ( = ?auto_41519 ?auto_41522 ) ) ( not ( = ?auto_41519 ?auto_41521 ) ) ( not ( = ?auto_41525 ?auto_41522 ) ) ( not ( = ?auto_41525 ?auto_41521 ) ) ( not ( = ?auto_41522 ?auto_41521 ) ) ( ON ?auto_41522 ?auto_41519 ) ( ON-TABLE ?auto_41525 ) ( ON-TABLE ?auto_41524 ) ( not ( = ?auto_41524 ?auto_41520 ) ) ( not ( = ?auto_41524 ?auto_41523 ) ) ( not ( = ?auto_41524 ?auto_41521 ) ) ( not ( = ?auto_41520 ?auto_41523 ) ) ( not ( = ?auto_41520 ?auto_41521 ) ) ( not ( = ?auto_41523 ?auto_41521 ) ) ( not ( = ?auto_41519 ?auto_41523 ) ) ( not ( = ?auto_41519 ?auto_41524 ) ) ( not ( = ?auto_41519 ?auto_41520 ) ) ( not ( = ?auto_41525 ?auto_41523 ) ) ( not ( = ?auto_41525 ?auto_41524 ) ) ( not ( = ?auto_41525 ?auto_41520 ) ) ( not ( = ?auto_41522 ?auto_41523 ) ) ( not ( = ?auto_41522 ?auto_41524 ) ) ( not ( = ?auto_41522 ?auto_41520 ) ) ( ON ?auto_41521 ?auto_41522 ) ( ON ?auto_41523 ?auto_41521 ) ( CLEAR ?auto_41523 ) ( HOLDING ?auto_41520 ) ( CLEAR ?auto_41524 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41524 ?auto_41520 )
      ( MAKE-1PILE ?auto_41519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41526 - BLOCK
    )
    :vars
    (
      ?auto_41527 - BLOCK
      ?auto_41530 - BLOCK
      ?auto_41532 - BLOCK
      ?auto_41528 - BLOCK
      ?auto_41529 - BLOCK
      ?auto_41531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41526 ?auto_41527 ) ( not ( = ?auto_41526 ?auto_41527 ) ) ( not ( = ?auto_41526 ?auto_41530 ) ) ( not ( = ?auto_41526 ?auto_41532 ) ) ( not ( = ?auto_41527 ?auto_41530 ) ) ( not ( = ?auto_41527 ?auto_41532 ) ) ( not ( = ?auto_41530 ?auto_41532 ) ) ( ON ?auto_41530 ?auto_41526 ) ( ON-TABLE ?auto_41527 ) ( ON-TABLE ?auto_41528 ) ( not ( = ?auto_41528 ?auto_41529 ) ) ( not ( = ?auto_41528 ?auto_41531 ) ) ( not ( = ?auto_41528 ?auto_41532 ) ) ( not ( = ?auto_41529 ?auto_41531 ) ) ( not ( = ?auto_41529 ?auto_41532 ) ) ( not ( = ?auto_41531 ?auto_41532 ) ) ( not ( = ?auto_41526 ?auto_41531 ) ) ( not ( = ?auto_41526 ?auto_41528 ) ) ( not ( = ?auto_41526 ?auto_41529 ) ) ( not ( = ?auto_41527 ?auto_41531 ) ) ( not ( = ?auto_41527 ?auto_41528 ) ) ( not ( = ?auto_41527 ?auto_41529 ) ) ( not ( = ?auto_41530 ?auto_41531 ) ) ( not ( = ?auto_41530 ?auto_41528 ) ) ( not ( = ?auto_41530 ?auto_41529 ) ) ( ON ?auto_41532 ?auto_41530 ) ( ON ?auto_41531 ?auto_41532 ) ( CLEAR ?auto_41528 ) ( ON ?auto_41529 ?auto_41531 ) ( CLEAR ?auto_41529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41527 ?auto_41526 ?auto_41530 ?auto_41532 ?auto_41531 )
      ( MAKE-1PILE ?auto_41526 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41533 - BLOCK
    )
    :vars
    (
      ?auto_41535 - BLOCK
      ?auto_41536 - BLOCK
      ?auto_41537 - BLOCK
      ?auto_41539 - BLOCK
      ?auto_41534 - BLOCK
      ?auto_41538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41533 ?auto_41535 ) ( not ( = ?auto_41533 ?auto_41535 ) ) ( not ( = ?auto_41533 ?auto_41536 ) ) ( not ( = ?auto_41533 ?auto_41537 ) ) ( not ( = ?auto_41535 ?auto_41536 ) ) ( not ( = ?auto_41535 ?auto_41537 ) ) ( not ( = ?auto_41536 ?auto_41537 ) ) ( ON ?auto_41536 ?auto_41533 ) ( ON-TABLE ?auto_41535 ) ( not ( = ?auto_41539 ?auto_41534 ) ) ( not ( = ?auto_41539 ?auto_41538 ) ) ( not ( = ?auto_41539 ?auto_41537 ) ) ( not ( = ?auto_41534 ?auto_41538 ) ) ( not ( = ?auto_41534 ?auto_41537 ) ) ( not ( = ?auto_41538 ?auto_41537 ) ) ( not ( = ?auto_41533 ?auto_41538 ) ) ( not ( = ?auto_41533 ?auto_41539 ) ) ( not ( = ?auto_41533 ?auto_41534 ) ) ( not ( = ?auto_41535 ?auto_41538 ) ) ( not ( = ?auto_41535 ?auto_41539 ) ) ( not ( = ?auto_41535 ?auto_41534 ) ) ( not ( = ?auto_41536 ?auto_41538 ) ) ( not ( = ?auto_41536 ?auto_41539 ) ) ( not ( = ?auto_41536 ?auto_41534 ) ) ( ON ?auto_41537 ?auto_41536 ) ( ON ?auto_41538 ?auto_41537 ) ( ON ?auto_41534 ?auto_41538 ) ( CLEAR ?auto_41534 ) ( HOLDING ?auto_41539 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41539 )
      ( MAKE-1PILE ?auto_41533 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41540 - BLOCK
    )
    :vars
    (
      ?auto_41543 - BLOCK
      ?auto_41541 - BLOCK
      ?auto_41542 - BLOCK
      ?auto_41546 - BLOCK
      ?auto_41545 - BLOCK
      ?auto_41544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41540 ?auto_41543 ) ( not ( = ?auto_41540 ?auto_41543 ) ) ( not ( = ?auto_41540 ?auto_41541 ) ) ( not ( = ?auto_41540 ?auto_41542 ) ) ( not ( = ?auto_41543 ?auto_41541 ) ) ( not ( = ?auto_41543 ?auto_41542 ) ) ( not ( = ?auto_41541 ?auto_41542 ) ) ( ON ?auto_41541 ?auto_41540 ) ( ON-TABLE ?auto_41543 ) ( not ( = ?auto_41546 ?auto_41545 ) ) ( not ( = ?auto_41546 ?auto_41544 ) ) ( not ( = ?auto_41546 ?auto_41542 ) ) ( not ( = ?auto_41545 ?auto_41544 ) ) ( not ( = ?auto_41545 ?auto_41542 ) ) ( not ( = ?auto_41544 ?auto_41542 ) ) ( not ( = ?auto_41540 ?auto_41544 ) ) ( not ( = ?auto_41540 ?auto_41546 ) ) ( not ( = ?auto_41540 ?auto_41545 ) ) ( not ( = ?auto_41543 ?auto_41544 ) ) ( not ( = ?auto_41543 ?auto_41546 ) ) ( not ( = ?auto_41543 ?auto_41545 ) ) ( not ( = ?auto_41541 ?auto_41544 ) ) ( not ( = ?auto_41541 ?auto_41546 ) ) ( not ( = ?auto_41541 ?auto_41545 ) ) ( ON ?auto_41542 ?auto_41541 ) ( ON ?auto_41544 ?auto_41542 ) ( ON ?auto_41545 ?auto_41544 ) ( ON ?auto_41546 ?auto_41545 ) ( CLEAR ?auto_41546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41543 ?auto_41540 ?auto_41541 ?auto_41542 ?auto_41544 ?auto_41545 )
      ( MAKE-1PILE ?auto_41540 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41556 - BLOCK
      ?auto_41557 - BLOCK
      ?auto_41558 - BLOCK
      ?auto_41559 - BLOCK
    )
    :vars
    (
      ?auto_41560 - BLOCK
      ?auto_41561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41560 ?auto_41559 ) ( CLEAR ?auto_41560 ) ( ON-TABLE ?auto_41556 ) ( ON ?auto_41557 ?auto_41556 ) ( ON ?auto_41558 ?auto_41557 ) ( ON ?auto_41559 ?auto_41558 ) ( not ( = ?auto_41556 ?auto_41557 ) ) ( not ( = ?auto_41556 ?auto_41558 ) ) ( not ( = ?auto_41556 ?auto_41559 ) ) ( not ( = ?auto_41556 ?auto_41560 ) ) ( not ( = ?auto_41557 ?auto_41558 ) ) ( not ( = ?auto_41557 ?auto_41559 ) ) ( not ( = ?auto_41557 ?auto_41560 ) ) ( not ( = ?auto_41558 ?auto_41559 ) ) ( not ( = ?auto_41558 ?auto_41560 ) ) ( not ( = ?auto_41559 ?auto_41560 ) ) ( HOLDING ?auto_41561 ) ( not ( = ?auto_41556 ?auto_41561 ) ) ( not ( = ?auto_41557 ?auto_41561 ) ) ( not ( = ?auto_41558 ?auto_41561 ) ) ( not ( = ?auto_41559 ?auto_41561 ) ) ( not ( = ?auto_41560 ?auto_41561 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_41561 )
      ( MAKE-4PILE ?auto_41556 ?auto_41557 ?auto_41558 ?auto_41559 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41629 - BLOCK
      ?auto_41630 - BLOCK
    )
    :vars
    (
      ?auto_41631 - BLOCK
      ?auto_41632 - BLOCK
      ?auto_41634 - BLOCK
      ?auto_41633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41629 ?auto_41630 ) ) ( ON ?auto_41630 ?auto_41631 ) ( not ( = ?auto_41629 ?auto_41631 ) ) ( not ( = ?auto_41630 ?auto_41631 ) ) ( ON ?auto_41629 ?auto_41630 ) ( CLEAR ?auto_41629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41632 ) ( ON ?auto_41634 ?auto_41632 ) ( ON ?auto_41633 ?auto_41634 ) ( ON ?auto_41631 ?auto_41633 ) ( not ( = ?auto_41632 ?auto_41634 ) ) ( not ( = ?auto_41632 ?auto_41633 ) ) ( not ( = ?auto_41632 ?auto_41631 ) ) ( not ( = ?auto_41632 ?auto_41630 ) ) ( not ( = ?auto_41632 ?auto_41629 ) ) ( not ( = ?auto_41634 ?auto_41633 ) ) ( not ( = ?auto_41634 ?auto_41631 ) ) ( not ( = ?auto_41634 ?auto_41630 ) ) ( not ( = ?auto_41634 ?auto_41629 ) ) ( not ( = ?auto_41633 ?auto_41631 ) ) ( not ( = ?auto_41633 ?auto_41630 ) ) ( not ( = ?auto_41633 ?auto_41629 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41632 ?auto_41634 ?auto_41633 ?auto_41631 ?auto_41630 )
      ( MAKE-2PILE ?auto_41629 ?auto_41630 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41637 - BLOCK
      ?auto_41638 - BLOCK
    )
    :vars
    (
      ?auto_41639 - BLOCK
      ?auto_41640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41637 ?auto_41638 ) ) ( ON ?auto_41638 ?auto_41639 ) ( CLEAR ?auto_41638 ) ( not ( = ?auto_41637 ?auto_41639 ) ) ( not ( = ?auto_41638 ?auto_41639 ) ) ( ON ?auto_41637 ?auto_41640 ) ( CLEAR ?auto_41637 ) ( HAND-EMPTY ) ( not ( = ?auto_41637 ?auto_41640 ) ) ( not ( = ?auto_41638 ?auto_41640 ) ) ( not ( = ?auto_41639 ?auto_41640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41637 ?auto_41640 )
      ( MAKE-2PILE ?auto_41637 ?auto_41638 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41641 - BLOCK
      ?auto_41642 - BLOCK
    )
    :vars
    (
      ?auto_41643 - BLOCK
      ?auto_41644 - BLOCK
      ?auto_41646 - BLOCK
      ?auto_41645 - BLOCK
      ?auto_41647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41641 ?auto_41642 ) ) ( not ( = ?auto_41641 ?auto_41643 ) ) ( not ( = ?auto_41642 ?auto_41643 ) ) ( ON ?auto_41641 ?auto_41644 ) ( CLEAR ?auto_41641 ) ( not ( = ?auto_41641 ?auto_41644 ) ) ( not ( = ?auto_41642 ?auto_41644 ) ) ( not ( = ?auto_41643 ?auto_41644 ) ) ( HOLDING ?auto_41642 ) ( CLEAR ?auto_41643 ) ( ON-TABLE ?auto_41646 ) ( ON ?auto_41645 ?auto_41646 ) ( ON ?auto_41647 ?auto_41645 ) ( ON ?auto_41643 ?auto_41647 ) ( not ( = ?auto_41646 ?auto_41645 ) ) ( not ( = ?auto_41646 ?auto_41647 ) ) ( not ( = ?auto_41646 ?auto_41643 ) ) ( not ( = ?auto_41646 ?auto_41642 ) ) ( not ( = ?auto_41645 ?auto_41647 ) ) ( not ( = ?auto_41645 ?auto_41643 ) ) ( not ( = ?auto_41645 ?auto_41642 ) ) ( not ( = ?auto_41647 ?auto_41643 ) ) ( not ( = ?auto_41647 ?auto_41642 ) ) ( not ( = ?auto_41641 ?auto_41646 ) ) ( not ( = ?auto_41641 ?auto_41645 ) ) ( not ( = ?auto_41641 ?auto_41647 ) ) ( not ( = ?auto_41644 ?auto_41646 ) ) ( not ( = ?auto_41644 ?auto_41645 ) ) ( not ( = ?auto_41644 ?auto_41647 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41646 ?auto_41645 ?auto_41647 ?auto_41643 ?auto_41642 )
      ( MAKE-2PILE ?auto_41641 ?auto_41642 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41648 - BLOCK
      ?auto_41649 - BLOCK
    )
    :vars
    (
      ?auto_41650 - BLOCK
      ?auto_41652 - BLOCK
      ?auto_41653 - BLOCK
      ?auto_41654 - BLOCK
      ?auto_41651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41648 ?auto_41649 ) ) ( not ( = ?auto_41648 ?auto_41650 ) ) ( not ( = ?auto_41649 ?auto_41650 ) ) ( ON ?auto_41648 ?auto_41652 ) ( not ( = ?auto_41648 ?auto_41652 ) ) ( not ( = ?auto_41649 ?auto_41652 ) ) ( not ( = ?auto_41650 ?auto_41652 ) ) ( CLEAR ?auto_41650 ) ( ON-TABLE ?auto_41653 ) ( ON ?auto_41654 ?auto_41653 ) ( ON ?auto_41651 ?auto_41654 ) ( ON ?auto_41650 ?auto_41651 ) ( not ( = ?auto_41653 ?auto_41654 ) ) ( not ( = ?auto_41653 ?auto_41651 ) ) ( not ( = ?auto_41653 ?auto_41650 ) ) ( not ( = ?auto_41653 ?auto_41649 ) ) ( not ( = ?auto_41654 ?auto_41651 ) ) ( not ( = ?auto_41654 ?auto_41650 ) ) ( not ( = ?auto_41654 ?auto_41649 ) ) ( not ( = ?auto_41651 ?auto_41650 ) ) ( not ( = ?auto_41651 ?auto_41649 ) ) ( not ( = ?auto_41648 ?auto_41653 ) ) ( not ( = ?auto_41648 ?auto_41654 ) ) ( not ( = ?auto_41648 ?auto_41651 ) ) ( not ( = ?auto_41652 ?auto_41653 ) ) ( not ( = ?auto_41652 ?auto_41654 ) ) ( not ( = ?auto_41652 ?auto_41651 ) ) ( ON ?auto_41649 ?auto_41648 ) ( CLEAR ?auto_41649 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41652 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41652 ?auto_41648 )
      ( MAKE-2PILE ?auto_41648 ?auto_41649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41655 - BLOCK
      ?auto_41656 - BLOCK
    )
    :vars
    (
      ?auto_41661 - BLOCK
      ?auto_41659 - BLOCK
      ?auto_41660 - BLOCK
      ?auto_41657 - BLOCK
      ?auto_41658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41655 ?auto_41656 ) ) ( not ( = ?auto_41655 ?auto_41661 ) ) ( not ( = ?auto_41656 ?auto_41661 ) ) ( ON ?auto_41655 ?auto_41659 ) ( not ( = ?auto_41655 ?auto_41659 ) ) ( not ( = ?auto_41656 ?auto_41659 ) ) ( not ( = ?auto_41661 ?auto_41659 ) ) ( ON-TABLE ?auto_41660 ) ( ON ?auto_41657 ?auto_41660 ) ( ON ?auto_41658 ?auto_41657 ) ( not ( = ?auto_41660 ?auto_41657 ) ) ( not ( = ?auto_41660 ?auto_41658 ) ) ( not ( = ?auto_41660 ?auto_41661 ) ) ( not ( = ?auto_41660 ?auto_41656 ) ) ( not ( = ?auto_41657 ?auto_41658 ) ) ( not ( = ?auto_41657 ?auto_41661 ) ) ( not ( = ?auto_41657 ?auto_41656 ) ) ( not ( = ?auto_41658 ?auto_41661 ) ) ( not ( = ?auto_41658 ?auto_41656 ) ) ( not ( = ?auto_41655 ?auto_41660 ) ) ( not ( = ?auto_41655 ?auto_41657 ) ) ( not ( = ?auto_41655 ?auto_41658 ) ) ( not ( = ?auto_41659 ?auto_41660 ) ) ( not ( = ?auto_41659 ?auto_41657 ) ) ( not ( = ?auto_41659 ?auto_41658 ) ) ( ON ?auto_41656 ?auto_41655 ) ( CLEAR ?auto_41656 ) ( ON-TABLE ?auto_41659 ) ( HOLDING ?auto_41661 ) ( CLEAR ?auto_41658 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41660 ?auto_41657 ?auto_41658 ?auto_41661 )
      ( MAKE-2PILE ?auto_41655 ?auto_41656 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41662 - BLOCK
      ?auto_41663 - BLOCK
    )
    :vars
    (
      ?auto_41667 - BLOCK
      ?auto_41668 - BLOCK
      ?auto_41665 - BLOCK
      ?auto_41664 - BLOCK
      ?auto_41666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41662 ?auto_41663 ) ) ( not ( = ?auto_41662 ?auto_41667 ) ) ( not ( = ?auto_41663 ?auto_41667 ) ) ( ON ?auto_41662 ?auto_41668 ) ( not ( = ?auto_41662 ?auto_41668 ) ) ( not ( = ?auto_41663 ?auto_41668 ) ) ( not ( = ?auto_41667 ?auto_41668 ) ) ( ON-TABLE ?auto_41665 ) ( ON ?auto_41664 ?auto_41665 ) ( ON ?auto_41666 ?auto_41664 ) ( not ( = ?auto_41665 ?auto_41664 ) ) ( not ( = ?auto_41665 ?auto_41666 ) ) ( not ( = ?auto_41665 ?auto_41667 ) ) ( not ( = ?auto_41665 ?auto_41663 ) ) ( not ( = ?auto_41664 ?auto_41666 ) ) ( not ( = ?auto_41664 ?auto_41667 ) ) ( not ( = ?auto_41664 ?auto_41663 ) ) ( not ( = ?auto_41666 ?auto_41667 ) ) ( not ( = ?auto_41666 ?auto_41663 ) ) ( not ( = ?auto_41662 ?auto_41665 ) ) ( not ( = ?auto_41662 ?auto_41664 ) ) ( not ( = ?auto_41662 ?auto_41666 ) ) ( not ( = ?auto_41668 ?auto_41665 ) ) ( not ( = ?auto_41668 ?auto_41664 ) ) ( not ( = ?auto_41668 ?auto_41666 ) ) ( ON ?auto_41663 ?auto_41662 ) ( ON-TABLE ?auto_41668 ) ( CLEAR ?auto_41666 ) ( ON ?auto_41667 ?auto_41663 ) ( CLEAR ?auto_41667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41668 ?auto_41662 ?auto_41663 )
      ( MAKE-2PILE ?auto_41662 ?auto_41663 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41669 - BLOCK
      ?auto_41670 - BLOCK
    )
    :vars
    (
      ?auto_41674 - BLOCK
      ?auto_41673 - BLOCK
      ?auto_41675 - BLOCK
      ?auto_41671 - BLOCK
      ?auto_41672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41669 ?auto_41670 ) ) ( not ( = ?auto_41669 ?auto_41674 ) ) ( not ( = ?auto_41670 ?auto_41674 ) ) ( ON ?auto_41669 ?auto_41673 ) ( not ( = ?auto_41669 ?auto_41673 ) ) ( not ( = ?auto_41670 ?auto_41673 ) ) ( not ( = ?auto_41674 ?auto_41673 ) ) ( ON-TABLE ?auto_41675 ) ( ON ?auto_41671 ?auto_41675 ) ( not ( = ?auto_41675 ?auto_41671 ) ) ( not ( = ?auto_41675 ?auto_41672 ) ) ( not ( = ?auto_41675 ?auto_41674 ) ) ( not ( = ?auto_41675 ?auto_41670 ) ) ( not ( = ?auto_41671 ?auto_41672 ) ) ( not ( = ?auto_41671 ?auto_41674 ) ) ( not ( = ?auto_41671 ?auto_41670 ) ) ( not ( = ?auto_41672 ?auto_41674 ) ) ( not ( = ?auto_41672 ?auto_41670 ) ) ( not ( = ?auto_41669 ?auto_41675 ) ) ( not ( = ?auto_41669 ?auto_41671 ) ) ( not ( = ?auto_41669 ?auto_41672 ) ) ( not ( = ?auto_41673 ?auto_41675 ) ) ( not ( = ?auto_41673 ?auto_41671 ) ) ( not ( = ?auto_41673 ?auto_41672 ) ) ( ON ?auto_41670 ?auto_41669 ) ( ON-TABLE ?auto_41673 ) ( ON ?auto_41674 ?auto_41670 ) ( CLEAR ?auto_41674 ) ( HOLDING ?auto_41672 ) ( CLEAR ?auto_41671 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41675 ?auto_41671 ?auto_41672 )
      ( MAKE-2PILE ?auto_41669 ?auto_41670 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41676 - BLOCK
      ?auto_41677 - BLOCK
    )
    :vars
    (
      ?auto_41680 - BLOCK
      ?auto_41681 - BLOCK
      ?auto_41682 - BLOCK
      ?auto_41679 - BLOCK
      ?auto_41678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41676 ?auto_41677 ) ) ( not ( = ?auto_41676 ?auto_41680 ) ) ( not ( = ?auto_41677 ?auto_41680 ) ) ( ON ?auto_41676 ?auto_41681 ) ( not ( = ?auto_41676 ?auto_41681 ) ) ( not ( = ?auto_41677 ?auto_41681 ) ) ( not ( = ?auto_41680 ?auto_41681 ) ) ( ON-TABLE ?auto_41682 ) ( ON ?auto_41679 ?auto_41682 ) ( not ( = ?auto_41682 ?auto_41679 ) ) ( not ( = ?auto_41682 ?auto_41678 ) ) ( not ( = ?auto_41682 ?auto_41680 ) ) ( not ( = ?auto_41682 ?auto_41677 ) ) ( not ( = ?auto_41679 ?auto_41678 ) ) ( not ( = ?auto_41679 ?auto_41680 ) ) ( not ( = ?auto_41679 ?auto_41677 ) ) ( not ( = ?auto_41678 ?auto_41680 ) ) ( not ( = ?auto_41678 ?auto_41677 ) ) ( not ( = ?auto_41676 ?auto_41682 ) ) ( not ( = ?auto_41676 ?auto_41679 ) ) ( not ( = ?auto_41676 ?auto_41678 ) ) ( not ( = ?auto_41681 ?auto_41682 ) ) ( not ( = ?auto_41681 ?auto_41679 ) ) ( not ( = ?auto_41681 ?auto_41678 ) ) ( ON ?auto_41677 ?auto_41676 ) ( ON-TABLE ?auto_41681 ) ( ON ?auto_41680 ?auto_41677 ) ( CLEAR ?auto_41679 ) ( ON ?auto_41678 ?auto_41680 ) ( CLEAR ?auto_41678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41681 ?auto_41676 ?auto_41677 ?auto_41680 )
      ( MAKE-2PILE ?auto_41676 ?auto_41677 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41683 - BLOCK
      ?auto_41684 - BLOCK
    )
    :vars
    (
      ?auto_41686 - BLOCK
      ?auto_41685 - BLOCK
      ?auto_41689 - BLOCK
      ?auto_41687 - BLOCK
      ?auto_41688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41683 ?auto_41684 ) ) ( not ( = ?auto_41683 ?auto_41686 ) ) ( not ( = ?auto_41684 ?auto_41686 ) ) ( ON ?auto_41683 ?auto_41685 ) ( not ( = ?auto_41683 ?auto_41685 ) ) ( not ( = ?auto_41684 ?auto_41685 ) ) ( not ( = ?auto_41686 ?auto_41685 ) ) ( ON-TABLE ?auto_41689 ) ( not ( = ?auto_41689 ?auto_41687 ) ) ( not ( = ?auto_41689 ?auto_41688 ) ) ( not ( = ?auto_41689 ?auto_41686 ) ) ( not ( = ?auto_41689 ?auto_41684 ) ) ( not ( = ?auto_41687 ?auto_41688 ) ) ( not ( = ?auto_41687 ?auto_41686 ) ) ( not ( = ?auto_41687 ?auto_41684 ) ) ( not ( = ?auto_41688 ?auto_41686 ) ) ( not ( = ?auto_41688 ?auto_41684 ) ) ( not ( = ?auto_41683 ?auto_41689 ) ) ( not ( = ?auto_41683 ?auto_41687 ) ) ( not ( = ?auto_41683 ?auto_41688 ) ) ( not ( = ?auto_41685 ?auto_41689 ) ) ( not ( = ?auto_41685 ?auto_41687 ) ) ( not ( = ?auto_41685 ?auto_41688 ) ) ( ON ?auto_41684 ?auto_41683 ) ( ON-TABLE ?auto_41685 ) ( ON ?auto_41686 ?auto_41684 ) ( ON ?auto_41688 ?auto_41686 ) ( CLEAR ?auto_41688 ) ( HOLDING ?auto_41687 ) ( CLEAR ?auto_41689 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41689 ?auto_41687 )
      ( MAKE-2PILE ?auto_41683 ?auto_41684 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41690 - BLOCK
      ?auto_41691 - BLOCK
    )
    :vars
    (
      ?auto_41692 - BLOCK
      ?auto_41693 - BLOCK
      ?auto_41695 - BLOCK
      ?auto_41696 - BLOCK
      ?auto_41694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41690 ?auto_41691 ) ) ( not ( = ?auto_41690 ?auto_41692 ) ) ( not ( = ?auto_41691 ?auto_41692 ) ) ( ON ?auto_41690 ?auto_41693 ) ( not ( = ?auto_41690 ?auto_41693 ) ) ( not ( = ?auto_41691 ?auto_41693 ) ) ( not ( = ?auto_41692 ?auto_41693 ) ) ( ON-TABLE ?auto_41695 ) ( not ( = ?auto_41695 ?auto_41696 ) ) ( not ( = ?auto_41695 ?auto_41694 ) ) ( not ( = ?auto_41695 ?auto_41692 ) ) ( not ( = ?auto_41695 ?auto_41691 ) ) ( not ( = ?auto_41696 ?auto_41694 ) ) ( not ( = ?auto_41696 ?auto_41692 ) ) ( not ( = ?auto_41696 ?auto_41691 ) ) ( not ( = ?auto_41694 ?auto_41692 ) ) ( not ( = ?auto_41694 ?auto_41691 ) ) ( not ( = ?auto_41690 ?auto_41695 ) ) ( not ( = ?auto_41690 ?auto_41696 ) ) ( not ( = ?auto_41690 ?auto_41694 ) ) ( not ( = ?auto_41693 ?auto_41695 ) ) ( not ( = ?auto_41693 ?auto_41696 ) ) ( not ( = ?auto_41693 ?auto_41694 ) ) ( ON ?auto_41691 ?auto_41690 ) ( ON-TABLE ?auto_41693 ) ( ON ?auto_41692 ?auto_41691 ) ( ON ?auto_41694 ?auto_41692 ) ( CLEAR ?auto_41695 ) ( ON ?auto_41696 ?auto_41694 ) ( CLEAR ?auto_41696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41693 ?auto_41690 ?auto_41691 ?auto_41692 ?auto_41694 )
      ( MAKE-2PILE ?auto_41690 ?auto_41691 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41697 - BLOCK
      ?auto_41698 - BLOCK
    )
    :vars
    (
      ?auto_41703 - BLOCK
      ?auto_41701 - BLOCK
      ?auto_41702 - BLOCK
      ?auto_41699 - BLOCK
      ?auto_41700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41697 ?auto_41698 ) ) ( not ( = ?auto_41697 ?auto_41703 ) ) ( not ( = ?auto_41698 ?auto_41703 ) ) ( ON ?auto_41697 ?auto_41701 ) ( not ( = ?auto_41697 ?auto_41701 ) ) ( not ( = ?auto_41698 ?auto_41701 ) ) ( not ( = ?auto_41703 ?auto_41701 ) ) ( not ( = ?auto_41702 ?auto_41699 ) ) ( not ( = ?auto_41702 ?auto_41700 ) ) ( not ( = ?auto_41702 ?auto_41703 ) ) ( not ( = ?auto_41702 ?auto_41698 ) ) ( not ( = ?auto_41699 ?auto_41700 ) ) ( not ( = ?auto_41699 ?auto_41703 ) ) ( not ( = ?auto_41699 ?auto_41698 ) ) ( not ( = ?auto_41700 ?auto_41703 ) ) ( not ( = ?auto_41700 ?auto_41698 ) ) ( not ( = ?auto_41697 ?auto_41702 ) ) ( not ( = ?auto_41697 ?auto_41699 ) ) ( not ( = ?auto_41697 ?auto_41700 ) ) ( not ( = ?auto_41701 ?auto_41702 ) ) ( not ( = ?auto_41701 ?auto_41699 ) ) ( not ( = ?auto_41701 ?auto_41700 ) ) ( ON ?auto_41698 ?auto_41697 ) ( ON-TABLE ?auto_41701 ) ( ON ?auto_41703 ?auto_41698 ) ( ON ?auto_41700 ?auto_41703 ) ( ON ?auto_41699 ?auto_41700 ) ( CLEAR ?auto_41699 ) ( HOLDING ?auto_41702 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41702 )
      ( MAKE-2PILE ?auto_41697 ?auto_41698 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41704 - BLOCK
      ?auto_41705 - BLOCK
    )
    :vars
    (
      ?auto_41709 - BLOCK
      ?auto_41707 - BLOCK
      ?auto_41706 - BLOCK
      ?auto_41710 - BLOCK
      ?auto_41708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41704 ?auto_41705 ) ) ( not ( = ?auto_41704 ?auto_41709 ) ) ( not ( = ?auto_41705 ?auto_41709 ) ) ( ON ?auto_41704 ?auto_41707 ) ( not ( = ?auto_41704 ?auto_41707 ) ) ( not ( = ?auto_41705 ?auto_41707 ) ) ( not ( = ?auto_41709 ?auto_41707 ) ) ( not ( = ?auto_41706 ?auto_41710 ) ) ( not ( = ?auto_41706 ?auto_41708 ) ) ( not ( = ?auto_41706 ?auto_41709 ) ) ( not ( = ?auto_41706 ?auto_41705 ) ) ( not ( = ?auto_41710 ?auto_41708 ) ) ( not ( = ?auto_41710 ?auto_41709 ) ) ( not ( = ?auto_41710 ?auto_41705 ) ) ( not ( = ?auto_41708 ?auto_41709 ) ) ( not ( = ?auto_41708 ?auto_41705 ) ) ( not ( = ?auto_41704 ?auto_41706 ) ) ( not ( = ?auto_41704 ?auto_41710 ) ) ( not ( = ?auto_41704 ?auto_41708 ) ) ( not ( = ?auto_41707 ?auto_41706 ) ) ( not ( = ?auto_41707 ?auto_41710 ) ) ( not ( = ?auto_41707 ?auto_41708 ) ) ( ON ?auto_41705 ?auto_41704 ) ( ON-TABLE ?auto_41707 ) ( ON ?auto_41709 ?auto_41705 ) ( ON ?auto_41708 ?auto_41709 ) ( ON ?auto_41710 ?auto_41708 ) ( ON ?auto_41706 ?auto_41710 ) ( CLEAR ?auto_41706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41707 ?auto_41704 ?auto_41705 ?auto_41709 ?auto_41708 ?auto_41710 )
      ( MAKE-2PILE ?auto_41704 ?auto_41705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41730 - BLOCK
      ?auto_41731 - BLOCK
      ?auto_41732 - BLOCK
    )
    :vars
    (
      ?auto_41734 - BLOCK
      ?auto_41735 - BLOCK
      ?auto_41733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41734 ?auto_41732 ) ( ON-TABLE ?auto_41730 ) ( ON ?auto_41731 ?auto_41730 ) ( ON ?auto_41732 ?auto_41731 ) ( not ( = ?auto_41730 ?auto_41731 ) ) ( not ( = ?auto_41730 ?auto_41732 ) ) ( not ( = ?auto_41730 ?auto_41734 ) ) ( not ( = ?auto_41731 ?auto_41732 ) ) ( not ( = ?auto_41731 ?auto_41734 ) ) ( not ( = ?auto_41732 ?auto_41734 ) ) ( not ( = ?auto_41730 ?auto_41735 ) ) ( not ( = ?auto_41730 ?auto_41733 ) ) ( not ( = ?auto_41731 ?auto_41735 ) ) ( not ( = ?auto_41731 ?auto_41733 ) ) ( not ( = ?auto_41732 ?auto_41735 ) ) ( not ( = ?auto_41732 ?auto_41733 ) ) ( not ( = ?auto_41734 ?auto_41735 ) ) ( not ( = ?auto_41734 ?auto_41733 ) ) ( not ( = ?auto_41735 ?auto_41733 ) ) ( ON ?auto_41735 ?auto_41734 ) ( CLEAR ?auto_41735 ) ( HOLDING ?auto_41733 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41733 )
      ( MAKE-3PILE ?auto_41730 ?auto_41731 ?auto_41732 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41795 - BLOCK
      ?auto_41796 - BLOCK
      ?auto_41797 - BLOCK
    )
    :vars
    (
      ?auto_41798 - BLOCK
      ?auto_41799 - BLOCK
      ?auto_41800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41795 ) ( not ( = ?auto_41795 ?auto_41796 ) ) ( not ( = ?auto_41795 ?auto_41797 ) ) ( not ( = ?auto_41796 ?auto_41797 ) ) ( ON ?auto_41797 ?auto_41798 ) ( not ( = ?auto_41795 ?auto_41798 ) ) ( not ( = ?auto_41796 ?auto_41798 ) ) ( not ( = ?auto_41797 ?auto_41798 ) ) ( CLEAR ?auto_41795 ) ( ON ?auto_41796 ?auto_41797 ) ( CLEAR ?auto_41796 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41799 ) ( ON ?auto_41800 ?auto_41799 ) ( ON ?auto_41798 ?auto_41800 ) ( not ( = ?auto_41799 ?auto_41800 ) ) ( not ( = ?auto_41799 ?auto_41798 ) ) ( not ( = ?auto_41799 ?auto_41797 ) ) ( not ( = ?auto_41799 ?auto_41796 ) ) ( not ( = ?auto_41800 ?auto_41798 ) ) ( not ( = ?auto_41800 ?auto_41797 ) ) ( not ( = ?auto_41800 ?auto_41796 ) ) ( not ( = ?auto_41795 ?auto_41799 ) ) ( not ( = ?auto_41795 ?auto_41800 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41799 ?auto_41800 ?auto_41798 ?auto_41797 )
      ( MAKE-3PILE ?auto_41795 ?auto_41796 ?auto_41797 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41801 - BLOCK
      ?auto_41802 - BLOCK
      ?auto_41803 - BLOCK
    )
    :vars
    (
      ?auto_41804 - BLOCK
      ?auto_41806 - BLOCK
      ?auto_41805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41801 ?auto_41802 ) ) ( not ( = ?auto_41801 ?auto_41803 ) ) ( not ( = ?auto_41802 ?auto_41803 ) ) ( ON ?auto_41803 ?auto_41804 ) ( not ( = ?auto_41801 ?auto_41804 ) ) ( not ( = ?auto_41802 ?auto_41804 ) ) ( not ( = ?auto_41803 ?auto_41804 ) ) ( ON ?auto_41802 ?auto_41803 ) ( CLEAR ?auto_41802 ) ( ON-TABLE ?auto_41806 ) ( ON ?auto_41805 ?auto_41806 ) ( ON ?auto_41804 ?auto_41805 ) ( not ( = ?auto_41806 ?auto_41805 ) ) ( not ( = ?auto_41806 ?auto_41804 ) ) ( not ( = ?auto_41806 ?auto_41803 ) ) ( not ( = ?auto_41806 ?auto_41802 ) ) ( not ( = ?auto_41805 ?auto_41804 ) ) ( not ( = ?auto_41805 ?auto_41803 ) ) ( not ( = ?auto_41805 ?auto_41802 ) ) ( not ( = ?auto_41801 ?auto_41806 ) ) ( not ( = ?auto_41801 ?auto_41805 ) ) ( HOLDING ?auto_41801 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41801 )
      ( MAKE-3PILE ?auto_41801 ?auto_41802 ?auto_41803 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41807 - BLOCK
      ?auto_41808 - BLOCK
      ?auto_41809 - BLOCK
    )
    :vars
    (
      ?auto_41811 - BLOCK
      ?auto_41810 - BLOCK
      ?auto_41812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41807 ?auto_41808 ) ) ( not ( = ?auto_41807 ?auto_41809 ) ) ( not ( = ?auto_41808 ?auto_41809 ) ) ( ON ?auto_41809 ?auto_41811 ) ( not ( = ?auto_41807 ?auto_41811 ) ) ( not ( = ?auto_41808 ?auto_41811 ) ) ( not ( = ?auto_41809 ?auto_41811 ) ) ( ON ?auto_41808 ?auto_41809 ) ( ON-TABLE ?auto_41810 ) ( ON ?auto_41812 ?auto_41810 ) ( ON ?auto_41811 ?auto_41812 ) ( not ( = ?auto_41810 ?auto_41812 ) ) ( not ( = ?auto_41810 ?auto_41811 ) ) ( not ( = ?auto_41810 ?auto_41809 ) ) ( not ( = ?auto_41810 ?auto_41808 ) ) ( not ( = ?auto_41812 ?auto_41811 ) ) ( not ( = ?auto_41812 ?auto_41809 ) ) ( not ( = ?auto_41812 ?auto_41808 ) ) ( not ( = ?auto_41807 ?auto_41810 ) ) ( not ( = ?auto_41807 ?auto_41812 ) ) ( ON ?auto_41807 ?auto_41808 ) ( CLEAR ?auto_41807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41810 ?auto_41812 ?auto_41811 ?auto_41809 ?auto_41808 )
      ( MAKE-3PILE ?auto_41807 ?auto_41808 ?auto_41809 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41816 - BLOCK
      ?auto_41817 - BLOCK
      ?auto_41818 - BLOCK
    )
    :vars
    (
      ?auto_41821 - BLOCK
      ?auto_41819 - BLOCK
      ?auto_41820 - BLOCK
      ?auto_41822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41816 ?auto_41817 ) ) ( not ( = ?auto_41816 ?auto_41818 ) ) ( not ( = ?auto_41817 ?auto_41818 ) ) ( ON ?auto_41818 ?auto_41821 ) ( not ( = ?auto_41816 ?auto_41821 ) ) ( not ( = ?auto_41817 ?auto_41821 ) ) ( not ( = ?auto_41818 ?auto_41821 ) ) ( ON ?auto_41817 ?auto_41818 ) ( CLEAR ?auto_41817 ) ( ON-TABLE ?auto_41819 ) ( ON ?auto_41820 ?auto_41819 ) ( ON ?auto_41821 ?auto_41820 ) ( not ( = ?auto_41819 ?auto_41820 ) ) ( not ( = ?auto_41819 ?auto_41821 ) ) ( not ( = ?auto_41819 ?auto_41818 ) ) ( not ( = ?auto_41819 ?auto_41817 ) ) ( not ( = ?auto_41820 ?auto_41821 ) ) ( not ( = ?auto_41820 ?auto_41818 ) ) ( not ( = ?auto_41820 ?auto_41817 ) ) ( not ( = ?auto_41816 ?auto_41819 ) ) ( not ( = ?auto_41816 ?auto_41820 ) ) ( ON ?auto_41816 ?auto_41822 ) ( CLEAR ?auto_41816 ) ( HAND-EMPTY ) ( not ( = ?auto_41816 ?auto_41822 ) ) ( not ( = ?auto_41817 ?auto_41822 ) ) ( not ( = ?auto_41818 ?auto_41822 ) ) ( not ( = ?auto_41821 ?auto_41822 ) ) ( not ( = ?auto_41819 ?auto_41822 ) ) ( not ( = ?auto_41820 ?auto_41822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41816 ?auto_41822 )
      ( MAKE-3PILE ?auto_41816 ?auto_41817 ?auto_41818 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41823 - BLOCK
      ?auto_41824 - BLOCK
      ?auto_41825 - BLOCK
    )
    :vars
    (
      ?auto_41828 - BLOCK
      ?auto_41827 - BLOCK
      ?auto_41826 - BLOCK
      ?auto_41829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41823 ?auto_41824 ) ) ( not ( = ?auto_41823 ?auto_41825 ) ) ( not ( = ?auto_41824 ?auto_41825 ) ) ( ON ?auto_41825 ?auto_41828 ) ( not ( = ?auto_41823 ?auto_41828 ) ) ( not ( = ?auto_41824 ?auto_41828 ) ) ( not ( = ?auto_41825 ?auto_41828 ) ) ( ON-TABLE ?auto_41827 ) ( ON ?auto_41826 ?auto_41827 ) ( ON ?auto_41828 ?auto_41826 ) ( not ( = ?auto_41827 ?auto_41826 ) ) ( not ( = ?auto_41827 ?auto_41828 ) ) ( not ( = ?auto_41827 ?auto_41825 ) ) ( not ( = ?auto_41827 ?auto_41824 ) ) ( not ( = ?auto_41826 ?auto_41828 ) ) ( not ( = ?auto_41826 ?auto_41825 ) ) ( not ( = ?auto_41826 ?auto_41824 ) ) ( not ( = ?auto_41823 ?auto_41827 ) ) ( not ( = ?auto_41823 ?auto_41826 ) ) ( ON ?auto_41823 ?auto_41829 ) ( CLEAR ?auto_41823 ) ( not ( = ?auto_41823 ?auto_41829 ) ) ( not ( = ?auto_41824 ?auto_41829 ) ) ( not ( = ?auto_41825 ?auto_41829 ) ) ( not ( = ?auto_41828 ?auto_41829 ) ) ( not ( = ?auto_41827 ?auto_41829 ) ) ( not ( = ?auto_41826 ?auto_41829 ) ) ( HOLDING ?auto_41824 ) ( CLEAR ?auto_41825 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41827 ?auto_41826 ?auto_41828 ?auto_41825 ?auto_41824 )
      ( MAKE-3PILE ?auto_41823 ?auto_41824 ?auto_41825 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41830 - BLOCK
      ?auto_41831 - BLOCK
      ?auto_41832 - BLOCK
    )
    :vars
    (
      ?auto_41834 - BLOCK
      ?auto_41835 - BLOCK
      ?auto_41836 - BLOCK
      ?auto_41833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41830 ?auto_41831 ) ) ( not ( = ?auto_41830 ?auto_41832 ) ) ( not ( = ?auto_41831 ?auto_41832 ) ) ( ON ?auto_41832 ?auto_41834 ) ( not ( = ?auto_41830 ?auto_41834 ) ) ( not ( = ?auto_41831 ?auto_41834 ) ) ( not ( = ?auto_41832 ?auto_41834 ) ) ( ON-TABLE ?auto_41835 ) ( ON ?auto_41836 ?auto_41835 ) ( ON ?auto_41834 ?auto_41836 ) ( not ( = ?auto_41835 ?auto_41836 ) ) ( not ( = ?auto_41835 ?auto_41834 ) ) ( not ( = ?auto_41835 ?auto_41832 ) ) ( not ( = ?auto_41835 ?auto_41831 ) ) ( not ( = ?auto_41836 ?auto_41834 ) ) ( not ( = ?auto_41836 ?auto_41832 ) ) ( not ( = ?auto_41836 ?auto_41831 ) ) ( not ( = ?auto_41830 ?auto_41835 ) ) ( not ( = ?auto_41830 ?auto_41836 ) ) ( ON ?auto_41830 ?auto_41833 ) ( not ( = ?auto_41830 ?auto_41833 ) ) ( not ( = ?auto_41831 ?auto_41833 ) ) ( not ( = ?auto_41832 ?auto_41833 ) ) ( not ( = ?auto_41834 ?auto_41833 ) ) ( not ( = ?auto_41835 ?auto_41833 ) ) ( not ( = ?auto_41836 ?auto_41833 ) ) ( CLEAR ?auto_41832 ) ( ON ?auto_41831 ?auto_41830 ) ( CLEAR ?auto_41831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41833 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41833 ?auto_41830 )
      ( MAKE-3PILE ?auto_41830 ?auto_41831 ?auto_41832 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41837 - BLOCK
      ?auto_41838 - BLOCK
      ?auto_41839 - BLOCK
    )
    :vars
    (
      ?auto_41841 - BLOCK
      ?auto_41843 - BLOCK
      ?auto_41842 - BLOCK
      ?auto_41840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41837 ?auto_41838 ) ) ( not ( = ?auto_41837 ?auto_41839 ) ) ( not ( = ?auto_41838 ?auto_41839 ) ) ( not ( = ?auto_41837 ?auto_41841 ) ) ( not ( = ?auto_41838 ?auto_41841 ) ) ( not ( = ?auto_41839 ?auto_41841 ) ) ( ON-TABLE ?auto_41843 ) ( ON ?auto_41842 ?auto_41843 ) ( ON ?auto_41841 ?auto_41842 ) ( not ( = ?auto_41843 ?auto_41842 ) ) ( not ( = ?auto_41843 ?auto_41841 ) ) ( not ( = ?auto_41843 ?auto_41839 ) ) ( not ( = ?auto_41843 ?auto_41838 ) ) ( not ( = ?auto_41842 ?auto_41841 ) ) ( not ( = ?auto_41842 ?auto_41839 ) ) ( not ( = ?auto_41842 ?auto_41838 ) ) ( not ( = ?auto_41837 ?auto_41843 ) ) ( not ( = ?auto_41837 ?auto_41842 ) ) ( ON ?auto_41837 ?auto_41840 ) ( not ( = ?auto_41837 ?auto_41840 ) ) ( not ( = ?auto_41838 ?auto_41840 ) ) ( not ( = ?auto_41839 ?auto_41840 ) ) ( not ( = ?auto_41841 ?auto_41840 ) ) ( not ( = ?auto_41843 ?auto_41840 ) ) ( not ( = ?auto_41842 ?auto_41840 ) ) ( ON ?auto_41838 ?auto_41837 ) ( CLEAR ?auto_41838 ) ( ON-TABLE ?auto_41840 ) ( HOLDING ?auto_41839 ) ( CLEAR ?auto_41841 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41843 ?auto_41842 ?auto_41841 ?auto_41839 )
      ( MAKE-3PILE ?auto_41837 ?auto_41838 ?auto_41839 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41844 - BLOCK
      ?auto_41845 - BLOCK
      ?auto_41846 - BLOCK
    )
    :vars
    (
      ?auto_41849 - BLOCK
      ?auto_41848 - BLOCK
      ?auto_41847 - BLOCK
      ?auto_41850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41844 ?auto_41845 ) ) ( not ( = ?auto_41844 ?auto_41846 ) ) ( not ( = ?auto_41845 ?auto_41846 ) ) ( not ( = ?auto_41844 ?auto_41849 ) ) ( not ( = ?auto_41845 ?auto_41849 ) ) ( not ( = ?auto_41846 ?auto_41849 ) ) ( ON-TABLE ?auto_41848 ) ( ON ?auto_41847 ?auto_41848 ) ( ON ?auto_41849 ?auto_41847 ) ( not ( = ?auto_41848 ?auto_41847 ) ) ( not ( = ?auto_41848 ?auto_41849 ) ) ( not ( = ?auto_41848 ?auto_41846 ) ) ( not ( = ?auto_41848 ?auto_41845 ) ) ( not ( = ?auto_41847 ?auto_41849 ) ) ( not ( = ?auto_41847 ?auto_41846 ) ) ( not ( = ?auto_41847 ?auto_41845 ) ) ( not ( = ?auto_41844 ?auto_41848 ) ) ( not ( = ?auto_41844 ?auto_41847 ) ) ( ON ?auto_41844 ?auto_41850 ) ( not ( = ?auto_41844 ?auto_41850 ) ) ( not ( = ?auto_41845 ?auto_41850 ) ) ( not ( = ?auto_41846 ?auto_41850 ) ) ( not ( = ?auto_41849 ?auto_41850 ) ) ( not ( = ?auto_41848 ?auto_41850 ) ) ( not ( = ?auto_41847 ?auto_41850 ) ) ( ON ?auto_41845 ?auto_41844 ) ( ON-TABLE ?auto_41850 ) ( CLEAR ?auto_41849 ) ( ON ?auto_41846 ?auto_41845 ) ( CLEAR ?auto_41846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41850 ?auto_41844 ?auto_41845 )
      ( MAKE-3PILE ?auto_41844 ?auto_41845 ?auto_41846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41851 - BLOCK
      ?auto_41852 - BLOCK
      ?auto_41853 - BLOCK
    )
    :vars
    (
      ?auto_41857 - BLOCK
      ?auto_41856 - BLOCK
      ?auto_41854 - BLOCK
      ?auto_41855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41851 ?auto_41852 ) ) ( not ( = ?auto_41851 ?auto_41853 ) ) ( not ( = ?auto_41852 ?auto_41853 ) ) ( not ( = ?auto_41851 ?auto_41857 ) ) ( not ( = ?auto_41852 ?auto_41857 ) ) ( not ( = ?auto_41853 ?auto_41857 ) ) ( ON-TABLE ?auto_41856 ) ( ON ?auto_41854 ?auto_41856 ) ( not ( = ?auto_41856 ?auto_41854 ) ) ( not ( = ?auto_41856 ?auto_41857 ) ) ( not ( = ?auto_41856 ?auto_41853 ) ) ( not ( = ?auto_41856 ?auto_41852 ) ) ( not ( = ?auto_41854 ?auto_41857 ) ) ( not ( = ?auto_41854 ?auto_41853 ) ) ( not ( = ?auto_41854 ?auto_41852 ) ) ( not ( = ?auto_41851 ?auto_41856 ) ) ( not ( = ?auto_41851 ?auto_41854 ) ) ( ON ?auto_41851 ?auto_41855 ) ( not ( = ?auto_41851 ?auto_41855 ) ) ( not ( = ?auto_41852 ?auto_41855 ) ) ( not ( = ?auto_41853 ?auto_41855 ) ) ( not ( = ?auto_41857 ?auto_41855 ) ) ( not ( = ?auto_41856 ?auto_41855 ) ) ( not ( = ?auto_41854 ?auto_41855 ) ) ( ON ?auto_41852 ?auto_41851 ) ( ON-TABLE ?auto_41855 ) ( ON ?auto_41853 ?auto_41852 ) ( CLEAR ?auto_41853 ) ( HOLDING ?auto_41857 ) ( CLEAR ?auto_41854 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41856 ?auto_41854 ?auto_41857 )
      ( MAKE-3PILE ?auto_41851 ?auto_41852 ?auto_41853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41858 - BLOCK
      ?auto_41859 - BLOCK
      ?auto_41860 - BLOCK
    )
    :vars
    (
      ?auto_41863 - BLOCK
      ?auto_41864 - BLOCK
      ?auto_41862 - BLOCK
      ?auto_41861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41858 ?auto_41859 ) ) ( not ( = ?auto_41858 ?auto_41860 ) ) ( not ( = ?auto_41859 ?auto_41860 ) ) ( not ( = ?auto_41858 ?auto_41863 ) ) ( not ( = ?auto_41859 ?auto_41863 ) ) ( not ( = ?auto_41860 ?auto_41863 ) ) ( ON-TABLE ?auto_41864 ) ( ON ?auto_41862 ?auto_41864 ) ( not ( = ?auto_41864 ?auto_41862 ) ) ( not ( = ?auto_41864 ?auto_41863 ) ) ( not ( = ?auto_41864 ?auto_41860 ) ) ( not ( = ?auto_41864 ?auto_41859 ) ) ( not ( = ?auto_41862 ?auto_41863 ) ) ( not ( = ?auto_41862 ?auto_41860 ) ) ( not ( = ?auto_41862 ?auto_41859 ) ) ( not ( = ?auto_41858 ?auto_41864 ) ) ( not ( = ?auto_41858 ?auto_41862 ) ) ( ON ?auto_41858 ?auto_41861 ) ( not ( = ?auto_41858 ?auto_41861 ) ) ( not ( = ?auto_41859 ?auto_41861 ) ) ( not ( = ?auto_41860 ?auto_41861 ) ) ( not ( = ?auto_41863 ?auto_41861 ) ) ( not ( = ?auto_41864 ?auto_41861 ) ) ( not ( = ?auto_41862 ?auto_41861 ) ) ( ON ?auto_41859 ?auto_41858 ) ( ON-TABLE ?auto_41861 ) ( ON ?auto_41860 ?auto_41859 ) ( CLEAR ?auto_41862 ) ( ON ?auto_41863 ?auto_41860 ) ( CLEAR ?auto_41863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41861 ?auto_41858 ?auto_41859 ?auto_41860 )
      ( MAKE-3PILE ?auto_41858 ?auto_41859 ?auto_41860 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41865 - BLOCK
      ?auto_41866 - BLOCK
      ?auto_41867 - BLOCK
    )
    :vars
    (
      ?auto_41868 - BLOCK
      ?auto_41869 - BLOCK
      ?auto_41870 - BLOCK
      ?auto_41871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41865 ?auto_41866 ) ) ( not ( = ?auto_41865 ?auto_41867 ) ) ( not ( = ?auto_41866 ?auto_41867 ) ) ( not ( = ?auto_41865 ?auto_41868 ) ) ( not ( = ?auto_41866 ?auto_41868 ) ) ( not ( = ?auto_41867 ?auto_41868 ) ) ( ON-TABLE ?auto_41869 ) ( not ( = ?auto_41869 ?auto_41870 ) ) ( not ( = ?auto_41869 ?auto_41868 ) ) ( not ( = ?auto_41869 ?auto_41867 ) ) ( not ( = ?auto_41869 ?auto_41866 ) ) ( not ( = ?auto_41870 ?auto_41868 ) ) ( not ( = ?auto_41870 ?auto_41867 ) ) ( not ( = ?auto_41870 ?auto_41866 ) ) ( not ( = ?auto_41865 ?auto_41869 ) ) ( not ( = ?auto_41865 ?auto_41870 ) ) ( ON ?auto_41865 ?auto_41871 ) ( not ( = ?auto_41865 ?auto_41871 ) ) ( not ( = ?auto_41866 ?auto_41871 ) ) ( not ( = ?auto_41867 ?auto_41871 ) ) ( not ( = ?auto_41868 ?auto_41871 ) ) ( not ( = ?auto_41869 ?auto_41871 ) ) ( not ( = ?auto_41870 ?auto_41871 ) ) ( ON ?auto_41866 ?auto_41865 ) ( ON-TABLE ?auto_41871 ) ( ON ?auto_41867 ?auto_41866 ) ( ON ?auto_41868 ?auto_41867 ) ( CLEAR ?auto_41868 ) ( HOLDING ?auto_41870 ) ( CLEAR ?auto_41869 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41869 ?auto_41870 )
      ( MAKE-3PILE ?auto_41865 ?auto_41866 ?auto_41867 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41872 - BLOCK
      ?auto_41873 - BLOCK
      ?auto_41874 - BLOCK
    )
    :vars
    (
      ?auto_41876 - BLOCK
      ?auto_41878 - BLOCK
      ?auto_41877 - BLOCK
      ?auto_41875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41872 ?auto_41873 ) ) ( not ( = ?auto_41872 ?auto_41874 ) ) ( not ( = ?auto_41873 ?auto_41874 ) ) ( not ( = ?auto_41872 ?auto_41876 ) ) ( not ( = ?auto_41873 ?auto_41876 ) ) ( not ( = ?auto_41874 ?auto_41876 ) ) ( ON-TABLE ?auto_41878 ) ( not ( = ?auto_41878 ?auto_41877 ) ) ( not ( = ?auto_41878 ?auto_41876 ) ) ( not ( = ?auto_41878 ?auto_41874 ) ) ( not ( = ?auto_41878 ?auto_41873 ) ) ( not ( = ?auto_41877 ?auto_41876 ) ) ( not ( = ?auto_41877 ?auto_41874 ) ) ( not ( = ?auto_41877 ?auto_41873 ) ) ( not ( = ?auto_41872 ?auto_41878 ) ) ( not ( = ?auto_41872 ?auto_41877 ) ) ( ON ?auto_41872 ?auto_41875 ) ( not ( = ?auto_41872 ?auto_41875 ) ) ( not ( = ?auto_41873 ?auto_41875 ) ) ( not ( = ?auto_41874 ?auto_41875 ) ) ( not ( = ?auto_41876 ?auto_41875 ) ) ( not ( = ?auto_41878 ?auto_41875 ) ) ( not ( = ?auto_41877 ?auto_41875 ) ) ( ON ?auto_41873 ?auto_41872 ) ( ON-TABLE ?auto_41875 ) ( ON ?auto_41874 ?auto_41873 ) ( ON ?auto_41876 ?auto_41874 ) ( CLEAR ?auto_41878 ) ( ON ?auto_41877 ?auto_41876 ) ( CLEAR ?auto_41877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41875 ?auto_41872 ?auto_41873 ?auto_41874 ?auto_41876 )
      ( MAKE-3PILE ?auto_41872 ?auto_41873 ?auto_41874 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41879 - BLOCK
      ?auto_41880 - BLOCK
      ?auto_41881 - BLOCK
    )
    :vars
    (
      ?auto_41882 - BLOCK
      ?auto_41884 - BLOCK
      ?auto_41883 - BLOCK
      ?auto_41885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41879 ?auto_41880 ) ) ( not ( = ?auto_41879 ?auto_41881 ) ) ( not ( = ?auto_41880 ?auto_41881 ) ) ( not ( = ?auto_41879 ?auto_41882 ) ) ( not ( = ?auto_41880 ?auto_41882 ) ) ( not ( = ?auto_41881 ?auto_41882 ) ) ( not ( = ?auto_41884 ?auto_41883 ) ) ( not ( = ?auto_41884 ?auto_41882 ) ) ( not ( = ?auto_41884 ?auto_41881 ) ) ( not ( = ?auto_41884 ?auto_41880 ) ) ( not ( = ?auto_41883 ?auto_41882 ) ) ( not ( = ?auto_41883 ?auto_41881 ) ) ( not ( = ?auto_41883 ?auto_41880 ) ) ( not ( = ?auto_41879 ?auto_41884 ) ) ( not ( = ?auto_41879 ?auto_41883 ) ) ( ON ?auto_41879 ?auto_41885 ) ( not ( = ?auto_41879 ?auto_41885 ) ) ( not ( = ?auto_41880 ?auto_41885 ) ) ( not ( = ?auto_41881 ?auto_41885 ) ) ( not ( = ?auto_41882 ?auto_41885 ) ) ( not ( = ?auto_41884 ?auto_41885 ) ) ( not ( = ?auto_41883 ?auto_41885 ) ) ( ON ?auto_41880 ?auto_41879 ) ( ON-TABLE ?auto_41885 ) ( ON ?auto_41881 ?auto_41880 ) ( ON ?auto_41882 ?auto_41881 ) ( ON ?auto_41883 ?auto_41882 ) ( CLEAR ?auto_41883 ) ( HOLDING ?auto_41884 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41884 )
      ( MAKE-3PILE ?auto_41879 ?auto_41880 ?auto_41881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41886 - BLOCK
      ?auto_41887 - BLOCK
      ?auto_41888 - BLOCK
    )
    :vars
    (
      ?auto_41889 - BLOCK
      ?auto_41890 - BLOCK
      ?auto_41892 - BLOCK
      ?auto_41891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41886 ?auto_41887 ) ) ( not ( = ?auto_41886 ?auto_41888 ) ) ( not ( = ?auto_41887 ?auto_41888 ) ) ( not ( = ?auto_41886 ?auto_41889 ) ) ( not ( = ?auto_41887 ?auto_41889 ) ) ( not ( = ?auto_41888 ?auto_41889 ) ) ( not ( = ?auto_41890 ?auto_41892 ) ) ( not ( = ?auto_41890 ?auto_41889 ) ) ( not ( = ?auto_41890 ?auto_41888 ) ) ( not ( = ?auto_41890 ?auto_41887 ) ) ( not ( = ?auto_41892 ?auto_41889 ) ) ( not ( = ?auto_41892 ?auto_41888 ) ) ( not ( = ?auto_41892 ?auto_41887 ) ) ( not ( = ?auto_41886 ?auto_41890 ) ) ( not ( = ?auto_41886 ?auto_41892 ) ) ( ON ?auto_41886 ?auto_41891 ) ( not ( = ?auto_41886 ?auto_41891 ) ) ( not ( = ?auto_41887 ?auto_41891 ) ) ( not ( = ?auto_41888 ?auto_41891 ) ) ( not ( = ?auto_41889 ?auto_41891 ) ) ( not ( = ?auto_41890 ?auto_41891 ) ) ( not ( = ?auto_41892 ?auto_41891 ) ) ( ON ?auto_41887 ?auto_41886 ) ( ON-TABLE ?auto_41891 ) ( ON ?auto_41888 ?auto_41887 ) ( ON ?auto_41889 ?auto_41888 ) ( ON ?auto_41892 ?auto_41889 ) ( ON ?auto_41890 ?auto_41892 ) ( CLEAR ?auto_41890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41891 ?auto_41886 ?auto_41887 ?auto_41888 ?auto_41889 ?auto_41892 )
      ( MAKE-3PILE ?auto_41886 ?auto_41887 ?auto_41888 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41908 - BLOCK
      ?auto_41909 - BLOCK
    )
    :vars
    (
      ?auto_41912 - BLOCK
      ?auto_41911 - BLOCK
      ?auto_41910 - BLOCK
      ?auto_41913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41912 ?auto_41909 ) ( ON-TABLE ?auto_41908 ) ( ON ?auto_41909 ?auto_41908 ) ( not ( = ?auto_41908 ?auto_41909 ) ) ( not ( = ?auto_41908 ?auto_41912 ) ) ( not ( = ?auto_41909 ?auto_41912 ) ) ( not ( = ?auto_41908 ?auto_41911 ) ) ( not ( = ?auto_41908 ?auto_41910 ) ) ( not ( = ?auto_41909 ?auto_41911 ) ) ( not ( = ?auto_41909 ?auto_41910 ) ) ( not ( = ?auto_41912 ?auto_41911 ) ) ( not ( = ?auto_41912 ?auto_41910 ) ) ( not ( = ?auto_41911 ?auto_41910 ) ) ( ON ?auto_41911 ?auto_41912 ) ( CLEAR ?auto_41911 ) ( HOLDING ?auto_41910 ) ( CLEAR ?auto_41913 ) ( ON-TABLE ?auto_41913 ) ( not ( = ?auto_41913 ?auto_41910 ) ) ( not ( = ?auto_41908 ?auto_41913 ) ) ( not ( = ?auto_41909 ?auto_41913 ) ) ( not ( = ?auto_41912 ?auto_41913 ) ) ( not ( = ?auto_41911 ?auto_41913 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41913 ?auto_41910 )
      ( MAKE-2PILE ?auto_41908 ?auto_41909 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41914 - BLOCK
      ?auto_41915 - BLOCK
    )
    :vars
    (
      ?auto_41916 - BLOCK
      ?auto_41918 - BLOCK
      ?auto_41919 - BLOCK
      ?auto_41917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41916 ?auto_41915 ) ( ON-TABLE ?auto_41914 ) ( ON ?auto_41915 ?auto_41914 ) ( not ( = ?auto_41914 ?auto_41915 ) ) ( not ( = ?auto_41914 ?auto_41916 ) ) ( not ( = ?auto_41915 ?auto_41916 ) ) ( not ( = ?auto_41914 ?auto_41918 ) ) ( not ( = ?auto_41914 ?auto_41919 ) ) ( not ( = ?auto_41915 ?auto_41918 ) ) ( not ( = ?auto_41915 ?auto_41919 ) ) ( not ( = ?auto_41916 ?auto_41918 ) ) ( not ( = ?auto_41916 ?auto_41919 ) ) ( not ( = ?auto_41918 ?auto_41919 ) ) ( ON ?auto_41918 ?auto_41916 ) ( CLEAR ?auto_41917 ) ( ON-TABLE ?auto_41917 ) ( not ( = ?auto_41917 ?auto_41919 ) ) ( not ( = ?auto_41914 ?auto_41917 ) ) ( not ( = ?auto_41915 ?auto_41917 ) ) ( not ( = ?auto_41916 ?auto_41917 ) ) ( not ( = ?auto_41918 ?auto_41917 ) ) ( ON ?auto_41919 ?auto_41918 ) ( CLEAR ?auto_41919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41914 ?auto_41915 ?auto_41916 ?auto_41918 )
      ( MAKE-2PILE ?auto_41914 ?auto_41915 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41920 - BLOCK
      ?auto_41921 - BLOCK
    )
    :vars
    (
      ?auto_41924 - BLOCK
      ?auto_41923 - BLOCK
      ?auto_41925 - BLOCK
      ?auto_41922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41924 ?auto_41921 ) ( ON-TABLE ?auto_41920 ) ( ON ?auto_41921 ?auto_41920 ) ( not ( = ?auto_41920 ?auto_41921 ) ) ( not ( = ?auto_41920 ?auto_41924 ) ) ( not ( = ?auto_41921 ?auto_41924 ) ) ( not ( = ?auto_41920 ?auto_41923 ) ) ( not ( = ?auto_41920 ?auto_41925 ) ) ( not ( = ?auto_41921 ?auto_41923 ) ) ( not ( = ?auto_41921 ?auto_41925 ) ) ( not ( = ?auto_41924 ?auto_41923 ) ) ( not ( = ?auto_41924 ?auto_41925 ) ) ( not ( = ?auto_41923 ?auto_41925 ) ) ( ON ?auto_41923 ?auto_41924 ) ( not ( = ?auto_41922 ?auto_41925 ) ) ( not ( = ?auto_41920 ?auto_41922 ) ) ( not ( = ?auto_41921 ?auto_41922 ) ) ( not ( = ?auto_41924 ?auto_41922 ) ) ( not ( = ?auto_41923 ?auto_41922 ) ) ( ON ?auto_41925 ?auto_41923 ) ( CLEAR ?auto_41925 ) ( HOLDING ?auto_41922 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41922 )
      ( MAKE-2PILE ?auto_41920 ?auto_41921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41934 - BLOCK
      ?auto_41935 - BLOCK
    )
    :vars
    (
      ?auto_41939 - BLOCK
      ?auto_41937 - BLOCK
      ?auto_41936 - BLOCK
      ?auto_41938 - BLOCK
      ?auto_41940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41939 ?auto_41935 ) ( ON-TABLE ?auto_41934 ) ( ON ?auto_41935 ?auto_41934 ) ( not ( = ?auto_41934 ?auto_41935 ) ) ( not ( = ?auto_41934 ?auto_41939 ) ) ( not ( = ?auto_41935 ?auto_41939 ) ) ( not ( = ?auto_41934 ?auto_41937 ) ) ( not ( = ?auto_41934 ?auto_41936 ) ) ( not ( = ?auto_41935 ?auto_41937 ) ) ( not ( = ?auto_41935 ?auto_41936 ) ) ( not ( = ?auto_41939 ?auto_41937 ) ) ( not ( = ?auto_41939 ?auto_41936 ) ) ( not ( = ?auto_41937 ?auto_41936 ) ) ( ON ?auto_41937 ?auto_41939 ) ( not ( = ?auto_41938 ?auto_41936 ) ) ( not ( = ?auto_41934 ?auto_41938 ) ) ( not ( = ?auto_41935 ?auto_41938 ) ) ( not ( = ?auto_41939 ?auto_41938 ) ) ( not ( = ?auto_41937 ?auto_41938 ) ) ( ON ?auto_41936 ?auto_41937 ) ( CLEAR ?auto_41936 ) ( ON ?auto_41938 ?auto_41940 ) ( CLEAR ?auto_41938 ) ( HAND-EMPTY ) ( not ( = ?auto_41934 ?auto_41940 ) ) ( not ( = ?auto_41935 ?auto_41940 ) ) ( not ( = ?auto_41939 ?auto_41940 ) ) ( not ( = ?auto_41937 ?auto_41940 ) ) ( not ( = ?auto_41936 ?auto_41940 ) ) ( not ( = ?auto_41938 ?auto_41940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41938 ?auto_41940 )
      ( MAKE-2PILE ?auto_41934 ?auto_41935 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41941 - BLOCK
      ?auto_41942 - BLOCK
    )
    :vars
    (
      ?auto_41944 - BLOCK
      ?auto_41947 - BLOCK
      ?auto_41945 - BLOCK
      ?auto_41943 - BLOCK
      ?auto_41946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41944 ?auto_41942 ) ( ON-TABLE ?auto_41941 ) ( ON ?auto_41942 ?auto_41941 ) ( not ( = ?auto_41941 ?auto_41942 ) ) ( not ( = ?auto_41941 ?auto_41944 ) ) ( not ( = ?auto_41942 ?auto_41944 ) ) ( not ( = ?auto_41941 ?auto_41947 ) ) ( not ( = ?auto_41941 ?auto_41945 ) ) ( not ( = ?auto_41942 ?auto_41947 ) ) ( not ( = ?auto_41942 ?auto_41945 ) ) ( not ( = ?auto_41944 ?auto_41947 ) ) ( not ( = ?auto_41944 ?auto_41945 ) ) ( not ( = ?auto_41947 ?auto_41945 ) ) ( ON ?auto_41947 ?auto_41944 ) ( not ( = ?auto_41943 ?auto_41945 ) ) ( not ( = ?auto_41941 ?auto_41943 ) ) ( not ( = ?auto_41942 ?auto_41943 ) ) ( not ( = ?auto_41944 ?auto_41943 ) ) ( not ( = ?auto_41947 ?auto_41943 ) ) ( ON ?auto_41943 ?auto_41946 ) ( CLEAR ?auto_41943 ) ( not ( = ?auto_41941 ?auto_41946 ) ) ( not ( = ?auto_41942 ?auto_41946 ) ) ( not ( = ?auto_41944 ?auto_41946 ) ) ( not ( = ?auto_41947 ?auto_41946 ) ) ( not ( = ?auto_41945 ?auto_41946 ) ) ( not ( = ?auto_41943 ?auto_41946 ) ) ( HOLDING ?auto_41945 ) ( CLEAR ?auto_41947 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41941 ?auto_41942 ?auto_41944 ?auto_41947 ?auto_41945 )
      ( MAKE-2PILE ?auto_41941 ?auto_41942 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41987 - BLOCK
      ?auto_41988 - BLOCK
      ?auto_41989 - BLOCK
      ?auto_41990 - BLOCK
    )
    :vars
    (
      ?auto_41991 - BLOCK
      ?auto_41992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41987 ) ( ON ?auto_41988 ?auto_41987 ) ( not ( = ?auto_41987 ?auto_41988 ) ) ( not ( = ?auto_41987 ?auto_41989 ) ) ( not ( = ?auto_41987 ?auto_41990 ) ) ( not ( = ?auto_41988 ?auto_41989 ) ) ( not ( = ?auto_41988 ?auto_41990 ) ) ( not ( = ?auto_41989 ?auto_41990 ) ) ( ON ?auto_41990 ?auto_41991 ) ( not ( = ?auto_41987 ?auto_41991 ) ) ( not ( = ?auto_41988 ?auto_41991 ) ) ( not ( = ?auto_41989 ?auto_41991 ) ) ( not ( = ?auto_41990 ?auto_41991 ) ) ( CLEAR ?auto_41988 ) ( ON ?auto_41989 ?auto_41990 ) ( CLEAR ?auto_41989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41992 ) ( ON ?auto_41991 ?auto_41992 ) ( not ( = ?auto_41992 ?auto_41991 ) ) ( not ( = ?auto_41992 ?auto_41990 ) ) ( not ( = ?auto_41992 ?auto_41989 ) ) ( not ( = ?auto_41987 ?auto_41992 ) ) ( not ( = ?auto_41988 ?auto_41992 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41992 ?auto_41991 ?auto_41990 )
      ( MAKE-4PILE ?auto_41987 ?auto_41988 ?auto_41989 ?auto_41990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41993 - BLOCK
      ?auto_41994 - BLOCK
      ?auto_41995 - BLOCK
      ?auto_41996 - BLOCK
    )
    :vars
    (
      ?auto_41997 - BLOCK
      ?auto_41998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41993 ) ( not ( = ?auto_41993 ?auto_41994 ) ) ( not ( = ?auto_41993 ?auto_41995 ) ) ( not ( = ?auto_41993 ?auto_41996 ) ) ( not ( = ?auto_41994 ?auto_41995 ) ) ( not ( = ?auto_41994 ?auto_41996 ) ) ( not ( = ?auto_41995 ?auto_41996 ) ) ( ON ?auto_41996 ?auto_41997 ) ( not ( = ?auto_41993 ?auto_41997 ) ) ( not ( = ?auto_41994 ?auto_41997 ) ) ( not ( = ?auto_41995 ?auto_41997 ) ) ( not ( = ?auto_41996 ?auto_41997 ) ) ( ON ?auto_41995 ?auto_41996 ) ( CLEAR ?auto_41995 ) ( ON-TABLE ?auto_41998 ) ( ON ?auto_41997 ?auto_41998 ) ( not ( = ?auto_41998 ?auto_41997 ) ) ( not ( = ?auto_41998 ?auto_41996 ) ) ( not ( = ?auto_41998 ?auto_41995 ) ) ( not ( = ?auto_41993 ?auto_41998 ) ) ( not ( = ?auto_41994 ?auto_41998 ) ) ( HOLDING ?auto_41994 ) ( CLEAR ?auto_41993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41993 ?auto_41994 )
      ( MAKE-4PILE ?auto_41993 ?auto_41994 ?auto_41995 ?auto_41996 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41999 - BLOCK
      ?auto_42000 - BLOCK
      ?auto_42001 - BLOCK
      ?auto_42002 - BLOCK
    )
    :vars
    (
      ?auto_42003 - BLOCK
      ?auto_42004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41999 ) ( not ( = ?auto_41999 ?auto_42000 ) ) ( not ( = ?auto_41999 ?auto_42001 ) ) ( not ( = ?auto_41999 ?auto_42002 ) ) ( not ( = ?auto_42000 ?auto_42001 ) ) ( not ( = ?auto_42000 ?auto_42002 ) ) ( not ( = ?auto_42001 ?auto_42002 ) ) ( ON ?auto_42002 ?auto_42003 ) ( not ( = ?auto_41999 ?auto_42003 ) ) ( not ( = ?auto_42000 ?auto_42003 ) ) ( not ( = ?auto_42001 ?auto_42003 ) ) ( not ( = ?auto_42002 ?auto_42003 ) ) ( ON ?auto_42001 ?auto_42002 ) ( ON-TABLE ?auto_42004 ) ( ON ?auto_42003 ?auto_42004 ) ( not ( = ?auto_42004 ?auto_42003 ) ) ( not ( = ?auto_42004 ?auto_42002 ) ) ( not ( = ?auto_42004 ?auto_42001 ) ) ( not ( = ?auto_41999 ?auto_42004 ) ) ( not ( = ?auto_42000 ?auto_42004 ) ) ( CLEAR ?auto_41999 ) ( ON ?auto_42000 ?auto_42001 ) ( CLEAR ?auto_42000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42004 ?auto_42003 ?auto_42002 ?auto_42001 )
      ( MAKE-4PILE ?auto_41999 ?auto_42000 ?auto_42001 ?auto_42002 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42005 - BLOCK
      ?auto_42006 - BLOCK
      ?auto_42007 - BLOCK
      ?auto_42008 - BLOCK
    )
    :vars
    (
      ?auto_42009 - BLOCK
      ?auto_42010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42005 ?auto_42006 ) ) ( not ( = ?auto_42005 ?auto_42007 ) ) ( not ( = ?auto_42005 ?auto_42008 ) ) ( not ( = ?auto_42006 ?auto_42007 ) ) ( not ( = ?auto_42006 ?auto_42008 ) ) ( not ( = ?auto_42007 ?auto_42008 ) ) ( ON ?auto_42008 ?auto_42009 ) ( not ( = ?auto_42005 ?auto_42009 ) ) ( not ( = ?auto_42006 ?auto_42009 ) ) ( not ( = ?auto_42007 ?auto_42009 ) ) ( not ( = ?auto_42008 ?auto_42009 ) ) ( ON ?auto_42007 ?auto_42008 ) ( ON-TABLE ?auto_42010 ) ( ON ?auto_42009 ?auto_42010 ) ( not ( = ?auto_42010 ?auto_42009 ) ) ( not ( = ?auto_42010 ?auto_42008 ) ) ( not ( = ?auto_42010 ?auto_42007 ) ) ( not ( = ?auto_42005 ?auto_42010 ) ) ( not ( = ?auto_42006 ?auto_42010 ) ) ( ON ?auto_42006 ?auto_42007 ) ( CLEAR ?auto_42006 ) ( HOLDING ?auto_42005 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42005 )
      ( MAKE-4PILE ?auto_42005 ?auto_42006 ?auto_42007 ?auto_42008 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42011 - BLOCK
      ?auto_42012 - BLOCK
      ?auto_42013 - BLOCK
      ?auto_42014 - BLOCK
    )
    :vars
    (
      ?auto_42016 - BLOCK
      ?auto_42015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42011 ?auto_42012 ) ) ( not ( = ?auto_42011 ?auto_42013 ) ) ( not ( = ?auto_42011 ?auto_42014 ) ) ( not ( = ?auto_42012 ?auto_42013 ) ) ( not ( = ?auto_42012 ?auto_42014 ) ) ( not ( = ?auto_42013 ?auto_42014 ) ) ( ON ?auto_42014 ?auto_42016 ) ( not ( = ?auto_42011 ?auto_42016 ) ) ( not ( = ?auto_42012 ?auto_42016 ) ) ( not ( = ?auto_42013 ?auto_42016 ) ) ( not ( = ?auto_42014 ?auto_42016 ) ) ( ON ?auto_42013 ?auto_42014 ) ( ON-TABLE ?auto_42015 ) ( ON ?auto_42016 ?auto_42015 ) ( not ( = ?auto_42015 ?auto_42016 ) ) ( not ( = ?auto_42015 ?auto_42014 ) ) ( not ( = ?auto_42015 ?auto_42013 ) ) ( not ( = ?auto_42011 ?auto_42015 ) ) ( not ( = ?auto_42012 ?auto_42015 ) ) ( ON ?auto_42012 ?auto_42013 ) ( ON ?auto_42011 ?auto_42012 ) ( CLEAR ?auto_42011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42015 ?auto_42016 ?auto_42014 ?auto_42013 ?auto_42012 )
      ( MAKE-4PILE ?auto_42011 ?auto_42012 ?auto_42013 ?auto_42014 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42021 - BLOCK
      ?auto_42022 - BLOCK
      ?auto_42023 - BLOCK
      ?auto_42024 - BLOCK
    )
    :vars
    (
      ?auto_42026 - BLOCK
      ?auto_42025 - BLOCK
      ?auto_42027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42021 ?auto_42022 ) ) ( not ( = ?auto_42021 ?auto_42023 ) ) ( not ( = ?auto_42021 ?auto_42024 ) ) ( not ( = ?auto_42022 ?auto_42023 ) ) ( not ( = ?auto_42022 ?auto_42024 ) ) ( not ( = ?auto_42023 ?auto_42024 ) ) ( ON ?auto_42024 ?auto_42026 ) ( not ( = ?auto_42021 ?auto_42026 ) ) ( not ( = ?auto_42022 ?auto_42026 ) ) ( not ( = ?auto_42023 ?auto_42026 ) ) ( not ( = ?auto_42024 ?auto_42026 ) ) ( ON ?auto_42023 ?auto_42024 ) ( ON-TABLE ?auto_42025 ) ( ON ?auto_42026 ?auto_42025 ) ( not ( = ?auto_42025 ?auto_42026 ) ) ( not ( = ?auto_42025 ?auto_42024 ) ) ( not ( = ?auto_42025 ?auto_42023 ) ) ( not ( = ?auto_42021 ?auto_42025 ) ) ( not ( = ?auto_42022 ?auto_42025 ) ) ( ON ?auto_42022 ?auto_42023 ) ( CLEAR ?auto_42022 ) ( ON ?auto_42021 ?auto_42027 ) ( CLEAR ?auto_42021 ) ( HAND-EMPTY ) ( not ( = ?auto_42021 ?auto_42027 ) ) ( not ( = ?auto_42022 ?auto_42027 ) ) ( not ( = ?auto_42023 ?auto_42027 ) ) ( not ( = ?auto_42024 ?auto_42027 ) ) ( not ( = ?auto_42026 ?auto_42027 ) ) ( not ( = ?auto_42025 ?auto_42027 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42021 ?auto_42027 )
      ( MAKE-4PILE ?auto_42021 ?auto_42022 ?auto_42023 ?auto_42024 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42028 - BLOCK
      ?auto_42029 - BLOCK
      ?auto_42030 - BLOCK
      ?auto_42031 - BLOCK
    )
    :vars
    (
      ?auto_42033 - BLOCK
      ?auto_42032 - BLOCK
      ?auto_42034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42028 ?auto_42029 ) ) ( not ( = ?auto_42028 ?auto_42030 ) ) ( not ( = ?auto_42028 ?auto_42031 ) ) ( not ( = ?auto_42029 ?auto_42030 ) ) ( not ( = ?auto_42029 ?auto_42031 ) ) ( not ( = ?auto_42030 ?auto_42031 ) ) ( ON ?auto_42031 ?auto_42033 ) ( not ( = ?auto_42028 ?auto_42033 ) ) ( not ( = ?auto_42029 ?auto_42033 ) ) ( not ( = ?auto_42030 ?auto_42033 ) ) ( not ( = ?auto_42031 ?auto_42033 ) ) ( ON ?auto_42030 ?auto_42031 ) ( ON-TABLE ?auto_42032 ) ( ON ?auto_42033 ?auto_42032 ) ( not ( = ?auto_42032 ?auto_42033 ) ) ( not ( = ?auto_42032 ?auto_42031 ) ) ( not ( = ?auto_42032 ?auto_42030 ) ) ( not ( = ?auto_42028 ?auto_42032 ) ) ( not ( = ?auto_42029 ?auto_42032 ) ) ( ON ?auto_42028 ?auto_42034 ) ( CLEAR ?auto_42028 ) ( not ( = ?auto_42028 ?auto_42034 ) ) ( not ( = ?auto_42029 ?auto_42034 ) ) ( not ( = ?auto_42030 ?auto_42034 ) ) ( not ( = ?auto_42031 ?auto_42034 ) ) ( not ( = ?auto_42033 ?auto_42034 ) ) ( not ( = ?auto_42032 ?auto_42034 ) ) ( HOLDING ?auto_42029 ) ( CLEAR ?auto_42030 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42032 ?auto_42033 ?auto_42031 ?auto_42030 ?auto_42029 )
      ( MAKE-4PILE ?auto_42028 ?auto_42029 ?auto_42030 ?auto_42031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42035 - BLOCK
      ?auto_42036 - BLOCK
      ?auto_42037 - BLOCK
      ?auto_42038 - BLOCK
    )
    :vars
    (
      ?auto_42041 - BLOCK
      ?auto_42039 - BLOCK
      ?auto_42040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42035 ?auto_42036 ) ) ( not ( = ?auto_42035 ?auto_42037 ) ) ( not ( = ?auto_42035 ?auto_42038 ) ) ( not ( = ?auto_42036 ?auto_42037 ) ) ( not ( = ?auto_42036 ?auto_42038 ) ) ( not ( = ?auto_42037 ?auto_42038 ) ) ( ON ?auto_42038 ?auto_42041 ) ( not ( = ?auto_42035 ?auto_42041 ) ) ( not ( = ?auto_42036 ?auto_42041 ) ) ( not ( = ?auto_42037 ?auto_42041 ) ) ( not ( = ?auto_42038 ?auto_42041 ) ) ( ON ?auto_42037 ?auto_42038 ) ( ON-TABLE ?auto_42039 ) ( ON ?auto_42041 ?auto_42039 ) ( not ( = ?auto_42039 ?auto_42041 ) ) ( not ( = ?auto_42039 ?auto_42038 ) ) ( not ( = ?auto_42039 ?auto_42037 ) ) ( not ( = ?auto_42035 ?auto_42039 ) ) ( not ( = ?auto_42036 ?auto_42039 ) ) ( ON ?auto_42035 ?auto_42040 ) ( not ( = ?auto_42035 ?auto_42040 ) ) ( not ( = ?auto_42036 ?auto_42040 ) ) ( not ( = ?auto_42037 ?auto_42040 ) ) ( not ( = ?auto_42038 ?auto_42040 ) ) ( not ( = ?auto_42041 ?auto_42040 ) ) ( not ( = ?auto_42039 ?auto_42040 ) ) ( CLEAR ?auto_42037 ) ( ON ?auto_42036 ?auto_42035 ) ( CLEAR ?auto_42036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42040 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42040 ?auto_42035 )
      ( MAKE-4PILE ?auto_42035 ?auto_42036 ?auto_42037 ?auto_42038 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42042 - BLOCK
      ?auto_42043 - BLOCK
      ?auto_42044 - BLOCK
      ?auto_42045 - BLOCK
    )
    :vars
    (
      ?auto_42047 - BLOCK
      ?auto_42048 - BLOCK
      ?auto_42046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42042 ?auto_42043 ) ) ( not ( = ?auto_42042 ?auto_42044 ) ) ( not ( = ?auto_42042 ?auto_42045 ) ) ( not ( = ?auto_42043 ?auto_42044 ) ) ( not ( = ?auto_42043 ?auto_42045 ) ) ( not ( = ?auto_42044 ?auto_42045 ) ) ( ON ?auto_42045 ?auto_42047 ) ( not ( = ?auto_42042 ?auto_42047 ) ) ( not ( = ?auto_42043 ?auto_42047 ) ) ( not ( = ?auto_42044 ?auto_42047 ) ) ( not ( = ?auto_42045 ?auto_42047 ) ) ( ON-TABLE ?auto_42048 ) ( ON ?auto_42047 ?auto_42048 ) ( not ( = ?auto_42048 ?auto_42047 ) ) ( not ( = ?auto_42048 ?auto_42045 ) ) ( not ( = ?auto_42048 ?auto_42044 ) ) ( not ( = ?auto_42042 ?auto_42048 ) ) ( not ( = ?auto_42043 ?auto_42048 ) ) ( ON ?auto_42042 ?auto_42046 ) ( not ( = ?auto_42042 ?auto_42046 ) ) ( not ( = ?auto_42043 ?auto_42046 ) ) ( not ( = ?auto_42044 ?auto_42046 ) ) ( not ( = ?auto_42045 ?auto_42046 ) ) ( not ( = ?auto_42047 ?auto_42046 ) ) ( not ( = ?auto_42048 ?auto_42046 ) ) ( ON ?auto_42043 ?auto_42042 ) ( CLEAR ?auto_42043 ) ( ON-TABLE ?auto_42046 ) ( HOLDING ?auto_42044 ) ( CLEAR ?auto_42045 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42048 ?auto_42047 ?auto_42045 ?auto_42044 )
      ( MAKE-4PILE ?auto_42042 ?auto_42043 ?auto_42044 ?auto_42045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42049 - BLOCK
      ?auto_42050 - BLOCK
      ?auto_42051 - BLOCK
      ?auto_42052 - BLOCK
    )
    :vars
    (
      ?auto_42053 - BLOCK
      ?auto_42055 - BLOCK
      ?auto_42054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42049 ?auto_42050 ) ) ( not ( = ?auto_42049 ?auto_42051 ) ) ( not ( = ?auto_42049 ?auto_42052 ) ) ( not ( = ?auto_42050 ?auto_42051 ) ) ( not ( = ?auto_42050 ?auto_42052 ) ) ( not ( = ?auto_42051 ?auto_42052 ) ) ( ON ?auto_42052 ?auto_42053 ) ( not ( = ?auto_42049 ?auto_42053 ) ) ( not ( = ?auto_42050 ?auto_42053 ) ) ( not ( = ?auto_42051 ?auto_42053 ) ) ( not ( = ?auto_42052 ?auto_42053 ) ) ( ON-TABLE ?auto_42055 ) ( ON ?auto_42053 ?auto_42055 ) ( not ( = ?auto_42055 ?auto_42053 ) ) ( not ( = ?auto_42055 ?auto_42052 ) ) ( not ( = ?auto_42055 ?auto_42051 ) ) ( not ( = ?auto_42049 ?auto_42055 ) ) ( not ( = ?auto_42050 ?auto_42055 ) ) ( ON ?auto_42049 ?auto_42054 ) ( not ( = ?auto_42049 ?auto_42054 ) ) ( not ( = ?auto_42050 ?auto_42054 ) ) ( not ( = ?auto_42051 ?auto_42054 ) ) ( not ( = ?auto_42052 ?auto_42054 ) ) ( not ( = ?auto_42053 ?auto_42054 ) ) ( not ( = ?auto_42055 ?auto_42054 ) ) ( ON ?auto_42050 ?auto_42049 ) ( ON-TABLE ?auto_42054 ) ( CLEAR ?auto_42052 ) ( ON ?auto_42051 ?auto_42050 ) ( CLEAR ?auto_42051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42054 ?auto_42049 ?auto_42050 )
      ( MAKE-4PILE ?auto_42049 ?auto_42050 ?auto_42051 ?auto_42052 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42056 - BLOCK
      ?auto_42057 - BLOCK
      ?auto_42058 - BLOCK
      ?auto_42059 - BLOCK
    )
    :vars
    (
      ?auto_42060 - BLOCK
      ?auto_42062 - BLOCK
      ?auto_42061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42056 ?auto_42057 ) ) ( not ( = ?auto_42056 ?auto_42058 ) ) ( not ( = ?auto_42056 ?auto_42059 ) ) ( not ( = ?auto_42057 ?auto_42058 ) ) ( not ( = ?auto_42057 ?auto_42059 ) ) ( not ( = ?auto_42058 ?auto_42059 ) ) ( not ( = ?auto_42056 ?auto_42060 ) ) ( not ( = ?auto_42057 ?auto_42060 ) ) ( not ( = ?auto_42058 ?auto_42060 ) ) ( not ( = ?auto_42059 ?auto_42060 ) ) ( ON-TABLE ?auto_42062 ) ( ON ?auto_42060 ?auto_42062 ) ( not ( = ?auto_42062 ?auto_42060 ) ) ( not ( = ?auto_42062 ?auto_42059 ) ) ( not ( = ?auto_42062 ?auto_42058 ) ) ( not ( = ?auto_42056 ?auto_42062 ) ) ( not ( = ?auto_42057 ?auto_42062 ) ) ( ON ?auto_42056 ?auto_42061 ) ( not ( = ?auto_42056 ?auto_42061 ) ) ( not ( = ?auto_42057 ?auto_42061 ) ) ( not ( = ?auto_42058 ?auto_42061 ) ) ( not ( = ?auto_42059 ?auto_42061 ) ) ( not ( = ?auto_42060 ?auto_42061 ) ) ( not ( = ?auto_42062 ?auto_42061 ) ) ( ON ?auto_42057 ?auto_42056 ) ( ON-TABLE ?auto_42061 ) ( ON ?auto_42058 ?auto_42057 ) ( CLEAR ?auto_42058 ) ( HOLDING ?auto_42059 ) ( CLEAR ?auto_42060 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42062 ?auto_42060 ?auto_42059 )
      ( MAKE-4PILE ?auto_42056 ?auto_42057 ?auto_42058 ?auto_42059 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42063 - BLOCK
      ?auto_42064 - BLOCK
      ?auto_42065 - BLOCK
      ?auto_42066 - BLOCK
    )
    :vars
    (
      ?auto_42069 - BLOCK
      ?auto_42068 - BLOCK
      ?auto_42067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42063 ?auto_42064 ) ) ( not ( = ?auto_42063 ?auto_42065 ) ) ( not ( = ?auto_42063 ?auto_42066 ) ) ( not ( = ?auto_42064 ?auto_42065 ) ) ( not ( = ?auto_42064 ?auto_42066 ) ) ( not ( = ?auto_42065 ?auto_42066 ) ) ( not ( = ?auto_42063 ?auto_42069 ) ) ( not ( = ?auto_42064 ?auto_42069 ) ) ( not ( = ?auto_42065 ?auto_42069 ) ) ( not ( = ?auto_42066 ?auto_42069 ) ) ( ON-TABLE ?auto_42068 ) ( ON ?auto_42069 ?auto_42068 ) ( not ( = ?auto_42068 ?auto_42069 ) ) ( not ( = ?auto_42068 ?auto_42066 ) ) ( not ( = ?auto_42068 ?auto_42065 ) ) ( not ( = ?auto_42063 ?auto_42068 ) ) ( not ( = ?auto_42064 ?auto_42068 ) ) ( ON ?auto_42063 ?auto_42067 ) ( not ( = ?auto_42063 ?auto_42067 ) ) ( not ( = ?auto_42064 ?auto_42067 ) ) ( not ( = ?auto_42065 ?auto_42067 ) ) ( not ( = ?auto_42066 ?auto_42067 ) ) ( not ( = ?auto_42069 ?auto_42067 ) ) ( not ( = ?auto_42068 ?auto_42067 ) ) ( ON ?auto_42064 ?auto_42063 ) ( ON-TABLE ?auto_42067 ) ( ON ?auto_42065 ?auto_42064 ) ( CLEAR ?auto_42069 ) ( ON ?auto_42066 ?auto_42065 ) ( CLEAR ?auto_42066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42067 ?auto_42063 ?auto_42064 ?auto_42065 )
      ( MAKE-4PILE ?auto_42063 ?auto_42064 ?auto_42065 ?auto_42066 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42070 - BLOCK
      ?auto_42071 - BLOCK
      ?auto_42072 - BLOCK
      ?auto_42073 - BLOCK
    )
    :vars
    (
      ?auto_42074 - BLOCK
      ?auto_42075 - BLOCK
      ?auto_42076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42070 ?auto_42071 ) ) ( not ( = ?auto_42070 ?auto_42072 ) ) ( not ( = ?auto_42070 ?auto_42073 ) ) ( not ( = ?auto_42071 ?auto_42072 ) ) ( not ( = ?auto_42071 ?auto_42073 ) ) ( not ( = ?auto_42072 ?auto_42073 ) ) ( not ( = ?auto_42070 ?auto_42074 ) ) ( not ( = ?auto_42071 ?auto_42074 ) ) ( not ( = ?auto_42072 ?auto_42074 ) ) ( not ( = ?auto_42073 ?auto_42074 ) ) ( ON-TABLE ?auto_42075 ) ( not ( = ?auto_42075 ?auto_42074 ) ) ( not ( = ?auto_42075 ?auto_42073 ) ) ( not ( = ?auto_42075 ?auto_42072 ) ) ( not ( = ?auto_42070 ?auto_42075 ) ) ( not ( = ?auto_42071 ?auto_42075 ) ) ( ON ?auto_42070 ?auto_42076 ) ( not ( = ?auto_42070 ?auto_42076 ) ) ( not ( = ?auto_42071 ?auto_42076 ) ) ( not ( = ?auto_42072 ?auto_42076 ) ) ( not ( = ?auto_42073 ?auto_42076 ) ) ( not ( = ?auto_42074 ?auto_42076 ) ) ( not ( = ?auto_42075 ?auto_42076 ) ) ( ON ?auto_42071 ?auto_42070 ) ( ON-TABLE ?auto_42076 ) ( ON ?auto_42072 ?auto_42071 ) ( ON ?auto_42073 ?auto_42072 ) ( CLEAR ?auto_42073 ) ( HOLDING ?auto_42074 ) ( CLEAR ?auto_42075 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42075 ?auto_42074 )
      ( MAKE-4PILE ?auto_42070 ?auto_42071 ?auto_42072 ?auto_42073 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42077 - BLOCK
      ?auto_42078 - BLOCK
      ?auto_42079 - BLOCK
      ?auto_42080 - BLOCK
    )
    :vars
    (
      ?auto_42081 - BLOCK
      ?auto_42083 - BLOCK
      ?auto_42082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42077 ?auto_42078 ) ) ( not ( = ?auto_42077 ?auto_42079 ) ) ( not ( = ?auto_42077 ?auto_42080 ) ) ( not ( = ?auto_42078 ?auto_42079 ) ) ( not ( = ?auto_42078 ?auto_42080 ) ) ( not ( = ?auto_42079 ?auto_42080 ) ) ( not ( = ?auto_42077 ?auto_42081 ) ) ( not ( = ?auto_42078 ?auto_42081 ) ) ( not ( = ?auto_42079 ?auto_42081 ) ) ( not ( = ?auto_42080 ?auto_42081 ) ) ( ON-TABLE ?auto_42083 ) ( not ( = ?auto_42083 ?auto_42081 ) ) ( not ( = ?auto_42083 ?auto_42080 ) ) ( not ( = ?auto_42083 ?auto_42079 ) ) ( not ( = ?auto_42077 ?auto_42083 ) ) ( not ( = ?auto_42078 ?auto_42083 ) ) ( ON ?auto_42077 ?auto_42082 ) ( not ( = ?auto_42077 ?auto_42082 ) ) ( not ( = ?auto_42078 ?auto_42082 ) ) ( not ( = ?auto_42079 ?auto_42082 ) ) ( not ( = ?auto_42080 ?auto_42082 ) ) ( not ( = ?auto_42081 ?auto_42082 ) ) ( not ( = ?auto_42083 ?auto_42082 ) ) ( ON ?auto_42078 ?auto_42077 ) ( ON-TABLE ?auto_42082 ) ( ON ?auto_42079 ?auto_42078 ) ( ON ?auto_42080 ?auto_42079 ) ( CLEAR ?auto_42083 ) ( ON ?auto_42081 ?auto_42080 ) ( CLEAR ?auto_42081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42082 ?auto_42077 ?auto_42078 ?auto_42079 ?auto_42080 )
      ( MAKE-4PILE ?auto_42077 ?auto_42078 ?auto_42079 ?auto_42080 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42084 - BLOCK
      ?auto_42085 - BLOCK
      ?auto_42086 - BLOCK
      ?auto_42087 - BLOCK
    )
    :vars
    (
      ?auto_42089 - BLOCK
      ?auto_42090 - BLOCK
      ?auto_42088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42084 ?auto_42085 ) ) ( not ( = ?auto_42084 ?auto_42086 ) ) ( not ( = ?auto_42084 ?auto_42087 ) ) ( not ( = ?auto_42085 ?auto_42086 ) ) ( not ( = ?auto_42085 ?auto_42087 ) ) ( not ( = ?auto_42086 ?auto_42087 ) ) ( not ( = ?auto_42084 ?auto_42089 ) ) ( not ( = ?auto_42085 ?auto_42089 ) ) ( not ( = ?auto_42086 ?auto_42089 ) ) ( not ( = ?auto_42087 ?auto_42089 ) ) ( not ( = ?auto_42090 ?auto_42089 ) ) ( not ( = ?auto_42090 ?auto_42087 ) ) ( not ( = ?auto_42090 ?auto_42086 ) ) ( not ( = ?auto_42084 ?auto_42090 ) ) ( not ( = ?auto_42085 ?auto_42090 ) ) ( ON ?auto_42084 ?auto_42088 ) ( not ( = ?auto_42084 ?auto_42088 ) ) ( not ( = ?auto_42085 ?auto_42088 ) ) ( not ( = ?auto_42086 ?auto_42088 ) ) ( not ( = ?auto_42087 ?auto_42088 ) ) ( not ( = ?auto_42089 ?auto_42088 ) ) ( not ( = ?auto_42090 ?auto_42088 ) ) ( ON ?auto_42085 ?auto_42084 ) ( ON-TABLE ?auto_42088 ) ( ON ?auto_42086 ?auto_42085 ) ( ON ?auto_42087 ?auto_42086 ) ( ON ?auto_42089 ?auto_42087 ) ( CLEAR ?auto_42089 ) ( HOLDING ?auto_42090 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42090 )
      ( MAKE-4PILE ?auto_42084 ?auto_42085 ?auto_42086 ?auto_42087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42091 - BLOCK
      ?auto_42092 - BLOCK
      ?auto_42093 - BLOCK
      ?auto_42094 - BLOCK
    )
    :vars
    (
      ?auto_42095 - BLOCK
      ?auto_42097 - BLOCK
      ?auto_42096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42091 ?auto_42092 ) ) ( not ( = ?auto_42091 ?auto_42093 ) ) ( not ( = ?auto_42091 ?auto_42094 ) ) ( not ( = ?auto_42092 ?auto_42093 ) ) ( not ( = ?auto_42092 ?auto_42094 ) ) ( not ( = ?auto_42093 ?auto_42094 ) ) ( not ( = ?auto_42091 ?auto_42095 ) ) ( not ( = ?auto_42092 ?auto_42095 ) ) ( not ( = ?auto_42093 ?auto_42095 ) ) ( not ( = ?auto_42094 ?auto_42095 ) ) ( not ( = ?auto_42097 ?auto_42095 ) ) ( not ( = ?auto_42097 ?auto_42094 ) ) ( not ( = ?auto_42097 ?auto_42093 ) ) ( not ( = ?auto_42091 ?auto_42097 ) ) ( not ( = ?auto_42092 ?auto_42097 ) ) ( ON ?auto_42091 ?auto_42096 ) ( not ( = ?auto_42091 ?auto_42096 ) ) ( not ( = ?auto_42092 ?auto_42096 ) ) ( not ( = ?auto_42093 ?auto_42096 ) ) ( not ( = ?auto_42094 ?auto_42096 ) ) ( not ( = ?auto_42095 ?auto_42096 ) ) ( not ( = ?auto_42097 ?auto_42096 ) ) ( ON ?auto_42092 ?auto_42091 ) ( ON-TABLE ?auto_42096 ) ( ON ?auto_42093 ?auto_42092 ) ( ON ?auto_42094 ?auto_42093 ) ( ON ?auto_42095 ?auto_42094 ) ( ON ?auto_42097 ?auto_42095 ) ( CLEAR ?auto_42097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42096 ?auto_42091 ?auto_42092 ?auto_42093 ?auto_42094 ?auto_42095 )
      ( MAKE-4PILE ?auto_42091 ?auto_42092 ?auto_42093 ?auto_42094 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42109 - BLOCK
    )
    :vars
    (
      ?auto_42111 - BLOCK
      ?auto_42110 - BLOCK
      ?auto_42112 - BLOCK
      ?auto_42113 - BLOCK
      ?auto_42114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42111 ?auto_42109 ) ( ON-TABLE ?auto_42109 ) ( not ( = ?auto_42109 ?auto_42111 ) ) ( not ( = ?auto_42109 ?auto_42110 ) ) ( not ( = ?auto_42109 ?auto_42112 ) ) ( not ( = ?auto_42111 ?auto_42110 ) ) ( not ( = ?auto_42111 ?auto_42112 ) ) ( not ( = ?auto_42110 ?auto_42112 ) ) ( ON ?auto_42110 ?auto_42111 ) ( CLEAR ?auto_42110 ) ( HOLDING ?auto_42112 ) ( CLEAR ?auto_42113 ) ( ON-TABLE ?auto_42114 ) ( ON ?auto_42113 ?auto_42114 ) ( not ( = ?auto_42114 ?auto_42113 ) ) ( not ( = ?auto_42114 ?auto_42112 ) ) ( not ( = ?auto_42113 ?auto_42112 ) ) ( not ( = ?auto_42109 ?auto_42113 ) ) ( not ( = ?auto_42109 ?auto_42114 ) ) ( not ( = ?auto_42111 ?auto_42113 ) ) ( not ( = ?auto_42111 ?auto_42114 ) ) ( not ( = ?auto_42110 ?auto_42113 ) ) ( not ( = ?auto_42110 ?auto_42114 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42114 ?auto_42113 ?auto_42112 )
      ( MAKE-1PILE ?auto_42109 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42115 - BLOCK
    )
    :vars
    (
      ?auto_42117 - BLOCK
      ?auto_42116 - BLOCK
      ?auto_42118 - BLOCK
      ?auto_42119 - BLOCK
      ?auto_42120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42117 ?auto_42115 ) ( ON-TABLE ?auto_42115 ) ( not ( = ?auto_42115 ?auto_42117 ) ) ( not ( = ?auto_42115 ?auto_42116 ) ) ( not ( = ?auto_42115 ?auto_42118 ) ) ( not ( = ?auto_42117 ?auto_42116 ) ) ( not ( = ?auto_42117 ?auto_42118 ) ) ( not ( = ?auto_42116 ?auto_42118 ) ) ( ON ?auto_42116 ?auto_42117 ) ( CLEAR ?auto_42119 ) ( ON-TABLE ?auto_42120 ) ( ON ?auto_42119 ?auto_42120 ) ( not ( = ?auto_42120 ?auto_42119 ) ) ( not ( = ?auto_42120 ?auto_42118 ) ) ( not ( = ?auto_42119 ?auto_42118 ) ) ( not ( = ?auto_42115 ?auto_42119 ) ) ( not ( = ?auto_42115 ?auto_42120 ) ) ( not ( = ?auto_42117 ?auto_42119 ) ) ( not ( = ?auto_42117 ?auto_42120 ) ) ( not ( = ?auto_42116 ?auto_42119 ) ) ( not ( = ?auto_42116 ?auto_42120 ) ) ( ON ?auto_42118 ?auto_42116 ) ( CLEAR ?auto_42118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42115 ?auto_42117 ?auto_42116 )
      ( MAKE-1PILE ?auto_42115 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42121 - BLOCK
    )
    :vars
    (
      ?auto_42122 - BLOCK
      ?auto_42123 - BLOCK
      ?auto_42125 - BLOCK
      ?auto_42126 - BLOCK
      ?auto_42124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42122 ?auto_42121 ) ( ON-TABLE ?auto_42121 ) ( not ( = ?auto_42121 ?auto_42122 ) ) ( not ( = ?auto_42121 ?auto_42123 ) ) ( not ( = ?auto_42121 ?auto_42125 ) ) ( not ( = ?auto_42122 ?auto_42123 ) ) ( not ( = ?auto_42122 ?auto_42125 ) ) ( not ( = ?auto_42123 ?auto_42125 ) ) ( ON ?auto_42123 ?auto_42122 ) ( ON-TABLE ?auto_42126 ) ( not ( = ?auto_42126 ?auto_42124 ) ) ( not ( = ?auto_42126 ?auto_42125 ) ) ( not ( = ?auto_42124 ?auto_42125 ) ) ( not ( = ?auto_42121 ?auto_42124 ) ) ( not ( = ?auto_42121 ?auto_42126 ) ) ( not ( = ?auto_42122 ?auto_42124 ) ) ( not ( = ?auto_42122 ?auto_42126 ) ) ( not ( = ?auto_42123 ?auto_42124 ) ) ( not ( = ?auto_42123 ?auto_42126 ) ) ( ON ?auto_42125 ?auto_42123 ) ( CLEAR ?auto_42125 ) ( HOLDING ?auto_42124 ) ( CLEAR ?auto_42126 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42126 ?auto_42124 )
      ( MAKE-1PILE ?auto_42121 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42127 - BLOCK
    )
    :vars
    (
      ?auto_42130 - BLOCK
      ?auto_42132 - BLOCK
      ?auto_42128 - BLOCK
      ?auto_42131 - BLOCK
      ?auto_42129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42130 ?auto_42127 ) ( ON-TABLE ?auto_42127 ) ( not ( = ?auto_42127 ?auto_42130 ) ) ( not ( = ?auto_42127 ?auto_42132 ) ) ( not ( = ?auto_42127 ?auto_42128 ) ) ( not ( = ?auto_42130 ?auto_42132 ) ) ( not ( = ?auto_42130 ?auto_42128 ) ) ( not ( = ?auto_42132 ?auto_42128 ) ) ( ON ?auto_42132 ?auto_42130 ) ( ON-TABLE ?auto_42131 ) ( not ( = ?auto_42131 ?auto_42129 ) ) ( not ( = ?auto_42131 ?auto_42128 ) ) ( not ( = ?auto_42129 ?auto_42128 ) ) ( not ( = ?auto_42127 ?auto_42129 ) ) ( not ( = ?auto_42127 ?auto_42131 ) ) ( not ( = ?auto_42130 ?auto_42129 ) ) ( not ( = ?auto_42130 ?auto_42131 ) ) ( not ( = ?auto_42132 ?auto_42129 ) ) ( not ( = ?auto_42132 ?auto_42131 ) ) ( ON ?auto_42128 ?auto_42132 ) ( CLEAR ?auto_42131 ) ( ON ?auto_42129 ?auto_42128 ) ( CLEAR ?auto_42129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42127 ?auto_42130 ?auto_42132 ?auto_42128 )
      ( MAKE-1PILE ?auto_42127 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42133 - BLOCK
    )
    :vars
    (
      ?auto_42136 - BLOCK
      ?auto_42135 - BLOCK
      ?auto_42137 - BLOCK
      ?auto_42138 - BLOCK
      ?auto_42134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42136 ?auto_42133 ) ( ON-TABLE ?auto_42133 ) ( not ( = ?auto_42133 ?auto_42136 ) ) ( not ( = ?auto_42133 ?auto_42135 ) ) ( not ( = ?auto_42133 ?auto_42137 ) ) ( not ( = ?auto_42136 ?auto_42135 ) ) ( not ( = ?auto_42136 ?auto_42137 ) ) ( not ( = ?auto_42135 ?auto_42137 ) ) ( ON ?auto_42135 ?auto_42136 ) ( not ( = ?auto_42138 ?auto_42134 ) ) ( not ( = ?auto_42138 ?auto_42137 ) ) ( not ( = ?auto_42134 ?auto_42137 ) ) ( not ( = ?auto_42133 ?auto_42134 ) ) ( not ( = ?auto_42133 ?auto_42138 ) ) ( not ( = ?auto_42136 ?auto_42134 ) ) ( not ( = ?auto_42136 ?auto_42138 ) ) ( not ( = ?auto_42135 ?auto_42134 ) ) ( not ( = ?auto_42135 ?auto_42138 ) ) ( ON ?auto_42137 ?auto_42135 ) ( ON ?auto_42134 ?auto_42137 ) ( CLEAR ?auto_42134 ) ( HOLDING ?auto_42138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42138 )
      ( MAKE-1PILE ?auto_42133 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42146 - BLOCK
    )
    :vars
    (
      ?auto_42151 - BLOCK
      ?auto_42150 - BLOCK
      ?auto_42147 - BLOCK
      ?auto_42148 - BLOCK
      ?auto_42149 - BLOCK
      ?auto_42152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42151 ?auto_42146 ) ( ON-TABLE ?auto_42146 ) ( not ( = ?auto_42146 ?auto_42151 ) ) ( not ( = ?auto_42146 ?auto_42150 ) ) ( not ( = ?auto_42146 ?auto_42147 ) ) ( not ( = ?auto_42151 ?auto_42150 ) ) ( not ( = ?auto_42151 ?auto_42147 ) ) ( not ( = ?auto_42150 ?auto_42147 ) ) ( ON ?auto_42150 ?auto_42151 ) ( not ( = ?auto_42148 ?auto_42149 ) ) ( not ( = ?auto_42148 ?auto_42147 ) ) ( not ( = ?auto_42149 ?auto_42147 ) ) ( not ( = ?auto_42146 ?auto_42149 ) ) ( not ( = ?auto_42146 ?auto_42148 ) ) ( not ( = ?auto_42151 ?auto_42149 ) ) ( not ( = ?auto_42151 ?auto_42148 ) ) ( not ( = ?auto_42150 ?auto_42149 ) ) ( not ( = ?auto_42150 ?auto_42148 ) ) ( ON ?auto_42147 ?auto_42150 ) ( ON ?auto_42149 ?auto_42147 ) ( CLEAR ?auto_42149 ) ( ON ?auto_42148 ?auto_42152 ) ( CLEAR ?auto_42148 ) ( HAND-EMPTY ) ( not ( = ?auto_42146 ?auto_42152 ) ) ( not ( = ?auto_42151 ?auto_42152 ) ) ( not ( = ?auto_42150 ?auto_42152 ) ) ( not ( = ?auto_42147 ?auto_42152 ) ) ( not ( = ?auto_42148 ?auto_42152 ) ) ( not ( = ?auto_42149 ?auto_42152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42148 ?auto_42152 )
      ( MAKE-1PILE ?auto_42146 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42153 - BLOCK
    )
    :vars
    (
      ?auto_42157 - BLOCK
      ?auto_42159 - BLOCK
      ?auto_42155 - BLOCK
      ?auto_42158 - BLOCK
      ?auto_42156 - BLOCK
      ?auto_42154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42157 ?auto_42153 ) ( ON-TABLE ?auto_42153 ) ( not ( = ?auto_42153 ?auto_42157 ) ) ( not ( = ?auto_42153 ?auto_42159 ) ) ( not ( = ?auto_42153 ?auto_42155 ) ) ( not ( = ?auto_42157 ?auto_42159 ) ) ( not ( = ?auto_42157 ?auto_42155 ) ) ( not ( = ?auto_42159 ?auto_42155 ) ) ( ON ?auto_42159 ?auto_42157 ) ( not ( = ?auto_42158 ?auto_42156 ) ) ( not ( = ?auto_42158 ?auto_42155 ) ) ( not ( = ?auto_42156 ?auto_42155 ) ) ( not ( = ?auto_42153 ?auto_42156 ) ) ( not ( = ?auto_42153 ?auto_42158 ) ) ( not ( = ?auto_42157 ?auto_42156 ) ) ( not ( = ?auto_42157 ?auto_42158 ) ) ( not ( = ?auto_42159 ?auto_42156 ) ) ( not ( = ?auto_42159 ?auto_42158 ) ) ( ON ?auto_42155 ?auto_42159 ) ( ON ?auto_42158 ?auto_42154 ) ( CLEAR ?auto_42158 ) ( not ( = ?auto_42153 ?auto_42154 ) ) ( not ( = ?auto_42157 ?auto_42154 ) ) ( not ( = ?auto_42159 ?auto_42154 ) ) ( not ( = ?auto_42155 ?auto_42154 ) ) ( not ( = ?auto_42158 ?auto_42154 ) ) ( not ( = ?auto_42156 ?auto_42154 ) ) ( HOLDING ?auto_42156 ) ( CLEAR ?auto_42155 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42153 ?auto_42157 ?auto_42159 ?auto_42155 ?auto_42156 )
      ( MAKE-1PILE ?auto_42153 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42160 - BLOCK
    )
    :vars
    (
      ?auto_42163 - BLOCK
      ?auto_42162 - BLOCK
      ?auto_42165 - BLOCK
      ?auto_42166 - BLOCK
      ?auto_42161 - BLOCK
      ?auto_42164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42163 ?auto_42160 ) ( ON-TABLE ?auto_42160 ) ( not ( = ?auto_42160 ?auto_42163 ) ) ( not ( = ?auto_42160 ?auto_42162 ) ) ( not ( = ?auto_42160 ?auto_42165 ) ) ( not ( = ?auto_42163 ?auto_42162 ) ) ( not ( = ?auto_42163 ?auto_42165 ) ) ( not ( = ?auto_42162 ?auto_42165 ) ) ( ON ?auto_42162 ?auto_42163 ) ( not ( = ?auto_42166 ?auto_42161 ) ) ( not ( = ?auto_42166 ?auto_42165 ) ) ( not ( = ?auto_42161 ?auto_42165 ) ) ( not ( = ?auto_42160 ?auto_42161 ) ) ( not ( = ?auto_42160 ?auto_42166 ) ) ( not ( = ?auto_42163 ?auto_42161 ) ) ( not ( = ?auto_42163 ?auto_42166 ) ) ( not ( = ?auto_42162 ?auto_42161 ) ) ( not ( = ?auto_42162 ?auto_42166 ) ) ( ON ?auto_42165 ?auto_42162 ) ( ON ?auto_42166 ?auto_42164 ) ( not ( = ?auto_42160 ?auto_42164 ) ) ( not ( = ?auto_42163 ?auto_42164 ) ) ( not ( = ?auto_42162 ?auto_42164 ) ) ( not ( = ?auto_42165 ?auto_42164 ) ) ( not ( = ?auto_42166 ?auto_42164 ) ) ( not ( = ?auto_42161 ?auto_42164 ) ) ( CLEAR ?auto_42165 ) ( ON ?auto_42161 ?auto_42166 ) ( CLEAR ?auto_42161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42164 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42164 ?auto_42166 )
      ( MAKE-1PILE ?auto_42160 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42200 - BLOCK
      ?auto_42201 - BLOCK
      ?auto_42202 - BLOCK
      ?auto_42203 - BLOCK
      ?auto_42204 - BLOCK
    )
    :vars
    (
      ?auto_42205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42200 ) ( ON ?auto_42201 ?auto_42200 ) ( ON ?auto_42202 ?auto_42201 ) ( not ( = ?auto_42200 ?auto_42201 ) ) ( not ( = ?auto_42200 ?auto_42202 ) ) ( not ( = ?auto_42200 ?auto_42203 ) ) ( not ( = ?auto_42200 ?auto_42204 ) ) ( not ( = ?auto_42201 ?auto_42202 ) ) ( not ( = ?auto_42201 ?auto_42203 ) ) ( not ( = ?auto_42201 ?auto_42204 ) ) ( not ( = ?auto_42202 ?auto_42203 ) ) ( not ( = ?auto_42202 ?auto_42204 ) ) ( not ( = ?auto_42203 ?auto_42204 ) ) ( ON ?auto_42204 ?auto_42205 ) ( not ( = ?auto_42200 ?auto_42205 ) ) ( not ( = ?auto_42201 ?auto_42205 ) ) ( not ( = ?auto_42202 ?auto_42205 ) ) ( not ( = ?auto_42203 ?auto_42205 ) ) ( not ( = ?auto_42204 ?auto_42205 ) ) ( CLEAR ?auto_42202 ) ( ON ?auto_42203 ?auto_42204 ) ( CLEAR ?auto_42203 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42205 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42205 ?auto_42204 )
      ( MAKE-5PILE ?auto_42200 ?auto_42201 ?auto_42202 ?auto_42203 ?auto_42204 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42206 - BLOCK
      ?auto_42207 - BLOCK
      ?auto_42208 - BLOCK
      ?auto_42209 - BLOCK
      ?auto_42210 - BLOCK
    )
    :vars
    (
      ?auto_42211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42206 ) ( ON ?auto_42207 ?auto_42206 ) ( not ( = ?auto_42206 ?auto_42207 ) ) ( not ( = ?auto_42206 ?auto_42208 ) ) ( not ( = ?auto_42206 ?auto_42209 ) ) ( not ( = ?auto_42206 ?auto_42210 ) ) ( not ( = ?auto_42207 ?auto_42208 ) ) ( not ( = ?auto_42207 ?auto_42209 ) ) ( not ( = ?auto_42207 ?auto_42210 ) ) ( not ( = ?auto_42208 ?auto_42209 ) ) ( not ( = ?auto_42208 ?auto_42210 ) ) ( not ( = ?auto_42209 ?auto_42210 ) ) ( ON ?auto_42210 ?auto_42211 ) ( not ( = ?auto_42206 ?auto_42211 ) ) ( not ( = ?auto_42207 ?auto_42211 ) ) ( not ( = ?auto_42208 ?auto_42211 ) ) ( not ( = ?auto_42209 ?auto_42211 ) ) ( not ( = ?auto_42210 ?auto_42211 ) ) ( ON ?auto_42209 ?auto_42210 ) ( CLEAR ?auto_42209 ) ( ON-TABLE ?auto_42211 ) ( HOLDING ?auto_42208 ) ( CLEAR ?auto_42207 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42206 ?auto_42207 ?auto_42208 )
      ( MAKE-5PILE ?auto_42206 ?auto_42207 ?auto_42208 ?auto_42209 ?auto_42210 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42212 - BLOCK
      ?auto_42213 - BLOCK
      ?auto_42214 - BLOCK
      ?auto_42215 - BLOCK
      ?auto_42216 - BLOCK
    )
    :vars
    (
      ?auto_42217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42212 ) ( ON ?auto_42213 ?auto_42212 ) ( not ( = ?auto_42212 ?auto_42213 ) ) ( not ( = ?auto_42212 ?auto_42214 ) ) ( not ( = ?auto_42212 ?auto_42215 ) ) ( not ( = ?auto_42212 ?auto_42216 ) ) ( not ( = ?auto_42213 ?auto_42214 ) ) ( not ( = ?auto_42213 ?auto_42215 ) ) ( not ( = ?auto_42213 ?auto_42216 ) ) ( not ( = ?auto_42214 ?auto_42215 ) ) ( not ( = ?auto_42214 ?auto_42216 ) ) ( not ( = ?auto_42215 ?auto_42216 ) ) ( ON ?auto_42216 ?auto_42217 ) ( not ( = ?auto_42212 ?auto_42217 ) ) ( not ( = ?auto_42213 ?auto_42217 ) ) ( not ( = ?auto_42214 ?auto_42217 ) ) ( not ( = ?auto_42215 ?auto_42217 ) ) ( not ( = ?auto_42216 ?auto_42217 ) ) ( ON ?auto_42215 ?auto_42216 ) ( ON-TABLE ?auto_42217 ) ( CLEAR ?auto_42213 ) ( ON ?auto_42214 ?auto_42215 ) ( CLEAR ?auto_42214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42217 ?auto_42216 ?auto_42215 )
      ( MAKE-5PILE ?auto_42212 ?auto_42213 ?auto_42214 ?auto_42215 ?auto_42216 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42218 - BLOCK
      ?auto_42219 - BLOCK
      ?auto_42220 - BLOCK
      ?auto_42221 - BLOCK
      ?auto_42222 - BLOCK
    )
    :vars
    (
      ?auto_42223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42218 ) ( not ( = ?auto_42218 ?auto_42219 ) ) ( not ( = ?auto_42218 ?auto_42220 ) ) ( not ( = ?auto_42218 ?auto_42221 ) ) ( not ( = ?auto_42218 ?auto_42222 ) ) ( not ( = ?auto_42219 ?auto_42220 ) ) ( not ( = ?auto_42219 ?auto_42221 ) ) ( not ( = ?auto_42219 ?auto_42222 ) ) ( not ( = ?auto_42220 ?auto_42221 ) ) ( not ( = ?auto_42220 ?auto_42222 ) ) ( not ( = ?auto_42221 ?auto_42222 ) ) ( ON ?auto_42222 ?auto_42223 ) ( not ( = ?auto_42218 ?auto_42223 ) ) ( not ( = ?auto_42219 ?auto_42223 ) ) ( not ( = ?auto_42220 ?auto_42223 ) ) ( not ( = ?auto_42221 ?auto_42223 ) ) ( not ( = ?auto_42222 ?auto_42223 ) ) ( ON ?auto_42221 ?auto_42222 ) ( ON-TABLE ?auto_42223 ) ( ON ?auto_42220 ?auto_42221 ) ( CLEAR ?auto_42220 ) ( HOLDING ?auto_42219 ) ( CLEAR ?auto_42218 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42218 ?auto_42219 )
      ( MAKE-5PILE ?auto_42218 ?auto_42219 ?auto_42220 ?auto_42221 ?auto_42222 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42224 - BLOCK
      ?auto_42225 - BLOCK
      ?auto_42226 - BLOCK
      ?auto_42227 - BLOCK
      ?auto_42228 - BLOCK
    )
    :vars
    (
      ?auto_42229 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42224 ) ( not ( = ?auto_42224 ?auto_42225 ) ) ( not ( = ?auto_42224 ?auto_42226 ) ) ( not ( = ?auto_42224 ?auto_42227 ) ) ( not ( = ?auto_42224 ?auto_42228 ) ) ( not ( = ?auto_42225 ?auto_42226 ) ) ( not ( = ?auto_42225 ?auto_42227 ) ) ( not ( = ?auto_42225 ?auto_42228 ) ) ( not ( = ?auto_42226 ?auto_42227 ) ) ( not ( = ?auto_42226 ?auto_42228 ) ) ( not ( = ?auto_42227 ?auto_42228 ) ) ( ON ?auto_42228 ?auto_42229 ) ( not ( = ?auto_42224 ?auto_42229 ) ) ( not ( = ?auto_42225 ?auto_42229 ) ) ( not ( = ?auto_42226 ?auto_42229 ) ) ( not ( = ?auto_42227 ?auto_42229 ) ) ( not ( = ?auto_42228 ?auto_42229 ) ) ( ON ?auto_42227 ?auto_42228 ) ( ON-TABLE ?auto_42229 ) ( ON ?auto_42226 ?auto_42227 ) ( CLEAR ?auto_42224 ) ( ON ?auto_42225 ?auto_42226 ) ( CLEAR ?auto_42225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42229 ?auto_42228 ?auto_42227 ?auto_42226 )
      ( MAKE-5PILE ?auto_42224 ?auto_42225 ?auto_42226 ?auto_42227 ?auto_42228 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42230 - BLOCK
      ?auto_42231 - BLOCK
      ?auto_42232 - BLOCK
      ?auto_42233 - BLOCK
      ?auto_42234 - BLOCK
    )
    :vars
    (
      ?auto_42235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42230 ?auto_42231 ) ) ( not ( = ?auto_42230 ?auto_42232 ) ) ( not ( = ?auto_42230 ?auto_42233 ) ) ( not ( = ?auto_42230 ?auto_42234 ) ) ( not ( = ?auto_42231 ?auto_42232 ) ) ( not ( = ?auto_42231 ?auto_42233 ) ) ( not ( = ?auto_42231 ?auto_42234 ) ) ( not ( = ?auto_42232 ?auto_42233 ) ) ( not ( = ?auto_42232 ?auto_42234 ) ) ( not ( = ?auto_42233 ?auto_42234 ) ) ( ON ?auto_42234 ?auto_42235 ) ( not ( = ?auto_42230 ?auto_42235 ) ) ( not ( = ?auto_42231 ?auto_42235 ) ) ( not ( = ?auto_42232 ?auto_42235 ) ) ( not ( = ?auto_42233 ?auto_42235 ) ) ( not ( = ?auto_42234 ?auto_42235 ) ) ( ON ?auto_42233 ?auto_42234 ) ( ON-TABLE ?auto_42235 ) ( ON ?auto_42232 ?auto_42233 ) ( ON ?auto_42231 ?auto_42232 ) ( CLEAR ?auto_42231 ) ( HOLDING ?auto_42230 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42230 )
      ( MAKE-5PILE ?auto_42230 ?auto_42231 ?auto_42232 ?auto_42233 ?auto_42234 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42236 - BLOCK
      ?auto_42237 - BLOCK
      ?auto_42238 - BLOCK
      ?auto_42239 - BLOCK
      ?auto_42240 - BLOCK
    )
    :vars
    (
      ?auto_42241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42236 ?auto_42237 ) ) ( not ( = ?auto_42236 ?auto_42238 ) ) ( not ( = ?auto_42236 ?auto_42239 ) ) ( not ( = ?auto_42236 ?auto_42240 ) ) ( not ( = ?auto_42237 ?auto_42238 ) ) ( not ( = ?auto_42237 ?auto_42239 ) ) ( not ( = ?auto_42237 ?auto_42240 ) ) ( not ( = ?auto_42238 ?auto_42239 ) ) ( not ( = ?auto_42238 ?auto_42240 ) ) ( not ( = ?auto_42239 ?auto_42240 ) ) ( ON ?auto_42240 ?auto_42241 ) ( not ( = ?auto_42236 ?auto_42241 ) ) ( not ( = ?auto_42237 ?auto_42241 ) ) ( not ( = ?auto_42238 ?auto_42241 ) ) ( not ( = ?auto_42239 ?auto_42241 ) ) ( not ( = ?auto_42240 ?auto_42241 ) ) ( ON ?auto_42239 ?auto_42240 ) ( ON-TABLE ?auto_42241 ) ( ON ?auto_42238 ?auto_42239 ) ( ON ?auto_42237 ?auto_42238 ) ( ON ?auto_42236 ?auto_42237 ) ( CLEAR ?auto_42236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42241 ?auto_42240 ?auto_42239 ?auto_42238 ?auto_42237 )
      ( MAKE-5PILE ?auto_42236 ?auto_42237 ?auto_42238 ?auto_42239 ?auto_42240 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42247 - BLOCK
      ?auto_42248 - BLOCK
      ?auto_42249 - BLOCK
      ?auto_42250 - BLOCK
      ?auto_42251 - BLOCK
    )
    :vars
    (
      ?auto_42252 - BLOCK
      ?auto_42253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42247 ?auto_42248 ) ) ( not ( = ?auto_42247 ?auto_42249 ) ) ( not ( = ?auto_42247 ?auto_42250 ) ) ( not ( = ?auto_42247 ?auto_42251 ) ) ( not ( = ?auto_42248 ?auto_42249 ) ) ( not ( = ?auto_42248 ?auto_42250 ) ) ( not ( = ?auto_42248 ?auto_42251 ) ) ( not ( = ?auto_42249 ?auto_42250 ) ) ( not ( = ?auto_42249 ?auto_42251 ) ) ( not ( = ?auto_42250 ?auto_42251 ) ) ( ON ?auto_42251 ?auto_42252 ) ( not ( = ?auto_42247 ?auto_42252 ) ) ( not ( = ?auto_42248 ?auto_42252 ) ) ( not ( = ?auto_42249 ?auto_42252 ) ) ( not ( = ?auto_42250 ?auto_42252 ) ) ( not ( = ?auto_42251 ?auto_42252 ) ) ( ON ?auto_42250 ?auto_42251 ) ( ON-TABLE ?auto_42252 ) ( ON ?auto_42249 ?auto_42250 ) ( ON ?auto_42248 ?auto_42249 ) ( CLEAR ?auto_42248 ) ( ON ?auto_42247 ?auto_42253 ) ( CLEAR ?auto_42247 ) ( HAND-EMPTY ) ( not ( = ?auto_42247 ?auto_42253 ) ) ( not ( = ?auto_42248 ?auto_42253 ) ) ( not ( = ?auto_42249 ?auto_42253 ) ) ( not ( = ?auto_42250 ?auto_42253 ) ) ( not ( = ?auto_42251 ?auto_42253 ) ) ( not ( = ?auto_42252 ?auto_42253 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42247 ?auto_42253 )
      ( MAKE-5PILE ?auto_42247 ?auto_42248 ?auto_42249 ?auto_42250 ?auto_42251 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42254 - BLOCK
      ?auto_42255 - BLOCK
      ?auto_42256 - BLOCK
      ?auto_42257 - BLOCK
      ?auto_42258 - BLOCK
    )
    :vars
    (
      ?auto_42260 - BLOCK
      ?auto_42259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42254 ?auto_42255 ) ) ( not ( = ?auto_42254 ?auto_42256 ) ) ( not ( = ?auto_42254 ?auto_42257 ) ) ( not ( = ?auto_42254 ?auto_42258 ) ) ( not ( = ?auto_42255 ?auto_42256 ) ) ( not ( = ?auto_42255 ?auto_42257 ) ) ( not ( = ?auto_42255 ?auto_42258 ) ) ( not ( = ?auto_42256 ?auto_42257 ) ) ( not ( = ?auto_42256 ?auto_42258 ) ) ( not ( = ?auto_42257 ?auto_42258 ) ) ( ON ?auto_42258 ?auto_42260 ) ( not ( = ?auto_42254 ?auto_42260 ) ) ( not ( = ?auto_42255 ?auto_42260 ) ) ( not ( = ?auto_42256 ?auto_42260 ) ) ( not ( = ?auto_42257 ?auto_42260 ) ) ( not ( = ?auto_42258 ?auto_42260 ) ) ( ON ?auto_42257 ?auto_42258 ) ( ON-TABLE ?auto_42260 ) ( ON ?auto_42256 ?auto_42257 ) ( ON ?auto_42254 ?auto_42259 ) ( CLEAR ?auto_42254 ) ( not ( = ?auto_42254 ?auto_42259 ) ) ( not ( = ?auto_42255 ?auto_42259 ) ) ( not ( = ?auto_42256 ?auto_42259 ) ) ( not ( = ?auto_42257 ?auto_42259 ) ) ( not ( = ?auto_42258 ?auto_42259 ) ) ( not ( = ?auto_42260 ?auto_42259 ) ) ( HOLDING ?auto_42255 ) ( CLEAR ?auto_42256 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42260 ?auto_42258 ?auto_42257 ?auto_42256 ?auto_42255 )
      ( MAKE-5PILE ?auto_42254 ?auto_42255 ?auto_42256 ?auto_42257 ?auto_42258 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42261 - BLOCK
      ?auto_42262 - BLOCK
      ?auto_42263 - BLOCK
      ?auto_42264 - BLOCK
      ?auto_42265 - BLOCK
    )
    :vars
    (
      ?auto_42266 - BLOCK
      ?auto_42267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42261 ?auto_42262 ) ) ( not ( = ?auto_42261 ?auto_42263 ) ) ( not ( = ?auto_42261 ?auto_42264 ) ) ( not ( = ?auto_42261 ?auto_42265 ) ) ( not ( = ?auto_42262 ?auto_42263 ) ) ( not ( = ?auto_42262 ?auto_42264 ) ) ( not ( = ?auto_42262 ?auto_42265 ) ) ( not ( = ?auto_42263 ?auto_42264 ) ) ( not ( = ?auto_42263 ?auto_42265 ) ) ( not ( = ?auto_42264 ?auto_42265 ) ) ( ON ?auto_42265 ?auto_42266 ) ( not ( = ?auto_42261 ?auto_42266 ) ) ( not ( = ?auto_42262 ?auto_42266 ) ) ( not ( = ?auto_42263 ?auto_42266 ) ) ( not ( = ?auto_42264 ?auto_42266 ) ) ( not ( = ?auto_42265 ?auto_42266 ) ) ( ON ?auto_42264 ?auto_42265 ) ( ON-TABLE ?auto_42266 ) ( ON ?auto_42263 ?auto_42264 ) ( ON ?auto_42261 ?auto_42267 ) ( not ( = ?auto_42261 ?auto_42267 ) ) ( not ( = ?auto_42262 ?auto_42267 ) ) ( not ( = ?auto_42263 ?auto_42267 ) ) ( not ( = ?auto_42264 ?auto_42267 ) ) ( not ( = ?auto_42265 ?auto_42267 ) ) ( not ( = ?auto_42266 ?auto_42267 ) ) ( CLEAR ?auto_42263 ) ( ON ?auto_42262 ?auto_42261 ) ( CLEAR ?auto_42262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42267 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42267 ?auto_42261 )
      ( MAKE-5PILE ?auto_42261 ?auto_42262 ?auto_42263 ?auto_42264 ?auto_42265 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42268 - BLOCK
      ?auto_42269 - BLOCK
      ?auto_42270 - BLOCK
      ?auto_42271 - BLOCK
      ?auto_42272 - BLOCK
    )
    :vars
    (
      ?auto_42274 - BLOCK
      ?auto_42273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42268 ?auto_42269 ) ) ( not ( = ?auto_42268 ?auto_42270 ) ) ( not ( = ?auto_42268 ?auto_42271 ) ) ( not ( = ?auto_42268 ?auto_42272 ) ) ( not ( = ?auto_42269 ?auto_42270 ) ) ( not ( = ?auto_42269 ?auto_42271 ) ) ( not ( = ?auto_42269 ?auto_42272 ) ) ( not ( = ?auto_42270 ?auto_42271 ) ) ( not ( = ?auto_42270 ?auto_42272 ) ) ( not ( = ?auto_42271 ?auto_42272 ) ) ( ON ?auto_42272 ?auto_42274 ) ( not ( = ?auto_42268 ?auto_42274 ) ) ( not ( = ?auto_42269 ?auto_42274 ) ) ( not ( = ?auto_42270 ?auto_42274 ) ) ( not ( = ?auto_42271 ?auto_42274 ) ) ( not ( = ?auto_42272 ?auto_42274 ) ) ( ON ?auto_42271 ?auto_42272 ) ( ON-TABLE ?auto_42274 ) ( ON ?auto_42268 ?auto_42273 ) ( not ( = ?auto_42268 ?auto_42273 ) ) ( not ( = ?auto_42269 ?auto_42273 ) ) ( not ( = ?auto_42270 ?auto_42273 ) ) ( not ( = ?auto_42271 ?auto_42273 ) ) ( not ( = ?auto_42272 ?auto_42273 ) ) ( not ( = ?auto_42274 ?auto_42273 ) ) ( ON ?auto_42269 ?auto_42268 ) ( CLEAR ?auto_42269 ) ( ON-TABLE ?auto_42273 ) ( HOLDING ?auto_42270 ) ( CLEAR ?auto_42271 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42274 ?auto_42272 ?auto_42271 ?auto_42270 )
      ( MAKE-5PILE ?auto_42268 ?auto_42269 ?auto_42270 ?auto_42271 ?auto_42272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42275 - BLOCK
      ?auto_42276 - BLOCK
      ?auto_42277 - BLOCK
      ?auto_42278 - BLOCK
      ?auto_42279 - BLOCK
    )
    :vars
    (
      ?auto_42280 - BLOCK
      ?auto_42281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42275 ?auto_42276 ) ) ( not ( = ?auto_42275 ?auto_42277 ) ) ( not ( = ?auto_42275 ?auto_42278 ) ) ( not ( = ?auto_42275 ?auto_42279 ) ) ( not ( = ?auto_42276 ?auto_42277 ) ) ( not ( = ?auto_42276 ?auto_42278 ) ) ( not ( = ?auto_42276 ?auto_42279 ) ) ( not ( = ?auto_42277 ?auto_42278 ) ) ( not ( = ?auto_42277 ?auto_42279 ) ) ( not ( = ?auto_42278 ?auto_42279 ) ) ( ON ?auto_42279 ?auto_42280 ) ( not ( = ?auto_42275 ?auto_42280 ) ) ( not ( = ?auto_42276 ?auto_42280 ) ) ( not ( = ?auto_42277 ?auto_42280 ) ) ( not ( = ?auto_42278 ?auto_42280 ) ) ( not ( = ?auto_42279 ?auto_42280 ) ) ( ON ?auto_42278 ?auto_42279 ) ( ON-TABLE ?auto_42280 ) ( ON ?auto_42275 ?auto_42281 ) ( not ( = ?auto_42275 ?auto_42281 ) ) ( not ( = ?auto_42276 ?auto_42281 ) ) ( not ( = ?auto_42277 ?auto_42281 ) ) ( not ( = ?auto_42278 ?auto_42281 ) ) ( not ( = ?auto_42279 ?auto_42281 ) ) ( not ( = ?auto_42280 ?auto_42281 ) ) ( ON ?auto_42276 ?auto_42275 ) ( ON-TABLE ?auto_42281 ) ( CLEAR ?auto_42278 ) ( ON ?auto_42277 ?auto_42276 ) ( CLEAR ?auto_42277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42281 ?auto_42275 ?auto_42276 )
      ( MAKE-5PILE ?auto_42275 ?auto_42276 ?auto_42277 ?auto_42278 ?auto_42279 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42282 - BLOCK
      ?auto_42283 - BLOCK
      ?auto_42284 - BLOCK
      ?auto_42285 - BLOCK
      ?auto_42286 - BLOCK
    )
    :vars
    (
      ?auto_42288 - BLOCK
      ?auto_42287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42282 ?auto_42283 ) ) ( not ( = ?auto_42282 ?auto_42284 ) ) ( not ( = ?auto_42282 ?auto_42285 ) ) ( not ( = ?auto_42282 ?auto_42286 ) ) ( not ( = ?auto_42283 ?auto_42284 ) ) ( not ( = ?auto_42283 ?auto_42285 ) ) ( not ( = ?auto_42283 ?auto_42286 ) ) ( not ( = ?auto_42284 ?auto_42285 ) ) ( not ( = ?auto_42284 ?auto_42286 ) ) ( not ( = ?auto_42285 ?auto_42286 ) ) ( ON ?auto_42286 ?auto_42288 ) ( not ( = ?auto_42282 ?auto_42288 ) ) ( not ( = ?auto_42283 ?auto_42288 ) ) ( not ( = ?auto_42284 ?auto_42288 ) ) ( not ( = ?auto_42285 ?auto_42288 ) ) ( not ( = ?auto_42286 ?auto_42288 ) ) ( ON-TABLE ?auto_42288 ) ( ON ?auto_42282 ?auto_42287 ) ( not ( = ?auto_42282 ?auto_42287 ) ) ( not ( = ?auto_42283 ?auto_42287 ) ) ( not ( = ?auto_42284 ?auto_42287 ) ) ( not ( = ?auto_42285 ?auto_42287 ) ) ( not ( = ?auto_42286 ?auto_42287 ) ) ( not ( = ?auto_42288 ?auto_42287 ) ) ( ON ?auto_42283 ?auto_42282 ) ( ON-TABLE ?auto_42287 ) ( ON ?auto_42284 ?auto_42283 ) ( CLEAR ?auto_42284 ) ( HOLDING ?auto_42285 ) ( CLEAR ?auto_42286 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42288 ?auto_42286 ?auto_42285 )
      ( MAKE-5PILE ?auto_42282 ?auto_42283 ?auto_42284 ?auto_42285 ?auto_42286 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42289 - BLOCK
      ?auto_42290 - BLOCK
      ?auto_42291 - BLOCK
      ?auto_42292 - BLOCK
      ?auto_42293 - BLOCK
    )
    :vars
    (
      ?auto_42295 - BLOCK
      ?auto_42294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42289 ?auto_42290 ) ) ( not ( = ?auto_42289 ?auto_42291 ) ) ( not ( = ?auto_42289 ?auto_42292 ) ) ( not ( = ?auto_42289 ?auto_42293 ) ) ( not ( = ?auto_42290 ?auto_42291 ) ) ( not ( = ?auto_42290 ?auto_42292 ) ) ( not ( = ?auto_42290 ?auto_42293 ) ) ( not ( = ?auto_42291 ?auto_42292 ) ) ( not ( = ?auto_42291 ?auto_42293 ) ) ( not ( = ?auto_42292 ?auto_42293 ) ) ( ON ?auto_42293 ?auto_42295 ) ( not ( = ?auto_42289 ?auto_42295 ) ) ( not ( = ?auto_42290 ?auto_42295 ) ) ( not ( = ?auto_42291 ?auto_42295 ) ) ( not ( = ?auto_42292 ?auto_42295 ) ) ( not ( = ?auto_42293 ?auto_42295 ) ) ( ON-TABLE ?auto_42295 ) ( ON ?auto_42289 ?auto_42294 ) ( not ( = ?auto_42289 ?auto_42294 ) ) ( not ( = ?auto_42290 ?auto_42294 ) ) ( not ( = ?auto_42291 ?auto_42294 ) ) ( not ( = ?auto_42292 ?auto_42294 ) ) ( not ( = ?auto_42293 ?auto_42294 ) ) ( not ( = ?auto_42295 ?auto_42294 ) ) ( ON ?auto_42290 ?auto_42289 ) ( ON-TABLE ?auto_42294 ) ( ON ?auto_42291 ?auto_42290 ) ( CLEAR ?auto_42293 ) ( ON ?auto_42292 ?auto_42291 ) ( CLEAR ?auto_42292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42294 ?auto_42289 ?auto_42290 ?auto_42291 )
      ( MAKE-5PILE ?auto_42289 ?auto_42290 ?auto_42291 ?auto_42292 ?auto_42293 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42296 - BLOCK
      ?auto_42297 - BLOCK
      ?auto_42298 - BLOCK
      ?auto_42299 - BLOCK
      ?auto_42300 - BLOCK
    )
    :vars
    (
      ?auto_42301 - BLOCK
      ?auto_42302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42296 ?auto_42297 ) ) ( not ( = ?auto_42296 ?auto_42298 ) ) ( not ( = ?auto_42296 ?auto_42299 ) ) ( not ( = ?auto_42296 ?auto_42300 ) ) ( not ( = ?auto_42297 ?auto_42298 ) ) ( not ( = ?auto_42297 ?auto_42299 ) ) ( not ( = ?auto_42297 ?auto_42300 ) ) ( not ( = ?auto_42298 ?auto_42299 ) ) ( not ( = ?auto_42298 ?auto_42300 ) ) ( not ( = ?auto_42299 ?auto_42300 ) ) ( not ( = ?auto_42296 ?auto_42301 ) ) ( not ( = ?auto_42297 ?auto_42301 ) ) ( not ( = ?auto_42298 ?auto_42301 ) ) ( not ( = ?auto_42299 ?auto_42301 ) ) ( not ( = ?auto_42300 ?auto_42301 ) ) ( ON-TABLE ?auto_42301 ) ( ON ?auto_42296 ?auto_42302 ) ( not ( = ?auto_42296 ?auto_42302 ) ) ( not ( = ?auto_42297 ?auto_42302 ) ) ( not ( = ?auto_42298 ?auto_42302 ) ) ( not ( = ?auto_42299 ?auto_42302 ) ) ( not ( = ?auto_42300 ?auto_42302 ) ) ( not ( = ?auto_42301 ?auto_42302 ) ) ( ON ?auto_42297 ?auto_42296 ) ( ON-TABLE ?auto_42302 ) ( ON ?auto_42298 ?auto_42297 ) ( ON ?auto_42299 ?auto_42298 ) ( CLEAR ?auto_42299 ) ( HOLDING ?auto_42300 ) ( CLEAR ?auto_42301 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42301 ?auto_42300 )
      ( MAKE-5PILE ?auto_42296 ?auto_42297 ?auto_42298 ?auto_42299 ?auto_42300 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42303 - BLOCK
      ?auto_42304 - BLOCK
      ?auto_42305 - BLOCK
      ?auto_42306 - BLOCK
      ?auto_42307 - BLOCK
    )
    :vars
    (
      ?auto_42309 - BLOCK
      ?auto_42308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42303 ?auto_42304 ) ) ( not ( = ?auto_42303 ?auto_42305 ) ) ( not ( = ?auto_42303 ?auto_42306 ) ) ( not ( = ?auto_42303 ?auto_42307 ) ) ( not ( = ?auto_42304 ?auto_42305 ) ) ( not ( = ?auto_42304 ?auto_42306 ) ) ( not ( = ?auto_42304 ?auto_42307 ) ) ( not ( = ?auto_42305 ?auto_42306 ) ) ( not ( = ?auto_42305 ?auto_42307 ) ) ( not ( = ?auto_42306 ?auto_42307 ) ) ( not ( = ?auto_42303 ?auto_42309 ) ) ( not ( = ?auto_42304 ?auto_42309 ) ) ( not ( = ?auto_42305 ?auto_42309 ) ) ( not ( = ?auto_42306 ?auto_42309 ) ) ( not ( = ?auto_42307 ?auto_42309 ) ) ( ON-TABLE ?auto_42309 ) ( ON ?auto_42303 ?auto_42308 ) ( not ( = ?auto_42303 ?auto_42308 ) ) ( not ( = ?auto_42304 ?auto_42308 ) ) ( not ( = ?auto_42305 ?auto_42308 ) ) ( not ( = ?auto_42306 ?auto_42308 ) ) ( not ( = ?auto_42307 ?auto_42308 ) ) ( not ( = ?auto_42309 ?auto_42308 ) ) ( ON ?auto_42304 ?auto_42303 ) ( ON-TABLE ?auto_42308 ) ( ON ?auto_42305 ?auto_42304 ) ( ON ?auto_42306 ?auto_42305 ) ( CLEAR ?auto_42309 ) ( ON ?auto_42307 ?auto_42306 ) ( CLEAR ?auto_42307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42308 ?auto_42303 ?auto_42304 ?auto_42305 ?auto_42306 )
      ( MAKE-5PILE ?auto_42303 ?auto_42304 ?auto_42305 ?auto_42306 ?auto_42307 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42310 - BLOCK
      ?auto_42311 - BLOCK
      ?auto_42312 - BLOCK
      ?auto_42313 - BLOCK
      ?auto_42314 - BLOCK
    )
    :vars
    (
      ?auto_42316 - BLOCK
      ?auto_42315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42310 ?auto_42311 ) ) ( not ( = ?auto_42310 ?auto_42312 ) ) ( not ( = ?auto_42310 ?auto_42313 ) ) ( not ( = ?auto_42310 ?auto_42314 ) ) ( not ( = ?auto_42311 ?auto_42312 ) ) ( not ( = ?auto_42311 ?auto_42313 ) ) ( not ( = ?auto_42311 ?auto_42314 ) ) ( not ( = ?auto_42312 ?auto_42313 ) ) ( not ( = ?auto_42312 ?auto_42314 ) ) ( not ( = ?auto_42313 ?auto_42314 ) ) ( not ( = ?auto_42310 ?auto_42316 ) ) ( not ( = ?auto_42311 ?auto_42316 ) ) ( not ( = ?auto_42312 ?auto_42316 ) ) ( not ( = ?auto_42313 ?auto_42316 ) ) ( not ( = ?auto_42314 ?auto_42316 ) ) ( ON ?auto_42310 ?auto_42315 ) ( not ( = ?auto_42310 ?auto_42315 ) ) ( not ( = ?auto_42311 ?auto_42315 ) ) ( not ( = ?auto_42312 ?auto_42315 ) ) ( not ( = ?auto_42313 ?auto_42315 ) ) ( not ( = ?auto_42314 ?auto_42315 ) ) ( not ( = ?auto_42316 ?auto_42315 ) ) ( ON ?auto_42311 ?auto_42310 ) ( ON-TABLE ?auto_42315 ) ( ON ?auto_42312 ?auto_42311 ) ( ON ?auto_42313 ?auto_42312 ) ( ON ?auto_42314 ?auto_42313 ) ( CLEAR ?auto_42314 ) ( HOLDING ?auto_42316 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42316 )
      ( MAKE-5PILE ?auto_42310 ?auto_42311 ?auto_42312 ?auto_42313 ?auto_42314 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42317 - BLOCK
      ?auto_42318 - BLOCK
      ?auto_42319 - BLOCK
      ?auto_42320 - BLOCK
      ?auto_42321 - BLOCK
    )
    :vars
    (
      ?auto_42323 - BLOCK
      ?auto_42322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42317 ?auto_42318 ) ) ( not ( = ?auto_42317 ?auto_42319 ) ) ( not ( = ?auto_42317 ?auto_42320 ) ) ( not ( = ?auto_42317 ?auto_42321 ) ) ( not ( = ?auto_42318 ?auto_42319 ) ) ( not ( = ?auto_42318 ?auto_42320 ) ) ( not ( = ?auto_42318 ?auto_42321 ) ) ( not ( = ?auto_42319 ?auto_42320 ) ) ( not ( = ?auto_42319 ?auto_42321 ) ) ( not ( = ?auto_42320 ?auto_42321 ) ) ( not ( = ?auto_42317 ?auto_42323 ) ) ( not ( = ?auto_42318 ?auto_42323 ) ) ( not ( = ?auto_42319 ?auto_42323 ) ) ( not ( = ?auto_42320 ?auto_42323 ) ) ( not ( = ?auto_42321 ?auto_42323 ) ) ( ON ?auto_42317 ?auto_42322 ) ( not ( = ?auto_42317 ?auto_42322 ) ) ( not ( = ?auto_42318 ?auto_42322 ) ) ( not ( = ?auto_42319 ?auto_42322 ) ) ( not ( = ?auto_42320 ?auto_42322 ) ) ( not ( = ?auto_42321 ?auto_42322 ) ) ( not ( = ?auto_42323 ?auto_42322 ) ) ( ON ?auto_42318 ?auto_42317 ) ( ON-TABLE ?auto_42322 ) ( ON ?auto_42319 ?auto_42318 ) ( ON ?auto_42320 ?auto_42319 ) ( ON ?auto_42321 ?auto_42320 ) ( ON ?auto_42323 ?auto_42321 ) ( CLEAR ?auto_42323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42322 ?auto_42317 ?auto_42318 ?auto_42319 ?auto_42320 ?auto_42321 )
      ( MAKE-5PILE ?auto_42317 ?auto_42318 ?auto_42319 ?auto_42320 ?auto_42321 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42336 - BLOCK
      ?auto_42337 - BLOCK
      ?auto_42338 - BLOCK
      ?auto_42339 - BLOCK
      ?auto_42340 - BLOCK
      ?auto_42341 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42340 ) ( ON-TABLE ?auto_42336 ) ( ON ?auto_42337 ?auto_42336 ) ( ON ?auto_42338 ?auto_42337 ) ( ON ?auto_42339 ?auto_42338 ) ( ON ?auto_42340 ?auto_42339 ) ( not ( = ?auto_42336 ?auto_42337 ) ) ( not ( = ?auto_42336 ?auto_42338 ) ) ( not ( = ?auto_42336 ?auto_42339 ) ) ( not ( = ?auto_42336 ?auto_42340 ) ) ( not ( = ?auto_42336 ?auto_42341 ) ) ( not ( = ?auto_42337 ?auto_42338 ) ) ( not ( = ?auto_42337 ?auto_42339 ) ) ( not ( = ?auto_42337 ?auto_42340 ) ) ( not ( = ?auto_42337 ?auto_42341 ) ) ( not ( = ?auto_42338 ?auto_42339 ) ) ( not ( = ?auto_42338 ?auto_42340 ) ) ( not ( = ?auto_42338 ?auto_42341 ) ) ( not ( = ?auto_42339 ?auto_42340 ) ) ( not ( = ?auto_42339 ?auto_42341 ) ) ( not ( = ?auto_42340 ?auto_42341 ) ) ( ON-TABLE ?auto_42341 ) ( CLEAR ?auto_42341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_42341 )
      ( MAKE-6PILE ?auto_42336 ?auto_42337 ?auto_42338 ?auto_42339 ?auto_42340 ?auto_42341 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42342 - BLOCK
      ?auto_42343 - BLOCK
      ?auto_42344 - BLOCK
      ?auto_42345 - BLOCK
      ?auto_42346 - BLOCK
      ?auto_42347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42342 ) ( ON ?auto_42343 ?auto_42342 ) ( ON ?auto_42344 ?auto_42343 ) ( ON ?auto_42345 ?auto_42344 ) ( not ( = ?auto_42342 ?auto_42343 ) ) ( not ( = ?auto_42342 ?auto_42344 ) ) ( not ( = ?auto_42342 ?auto_42345 ) ) ( not ( = ?auto_42342 ?auto_42346 ) ) ( not ( = ?auto_42342 ?auto_42347 ) ) ( not ( = ?auto_42343 ?auto_42344 ) ) ( not ( = ?auto_42343 ?auto_42345 ) ) ( not ( = ?auto_42343 ?auto_42346 ) ) ( not ( = ?auto_42343 ?auto_42347 ) ) ( not ( = ?auto_42344 ?auto_42345 ) ) ( not ( = ?auto_42344 ?auto_42346 ) ) ( not ( = ?auto_42344 ?auto_42347 ) ) ( not ( = ?auto_42345 ?auto_42346 ) ) ( not ( = ?auto_42345 ?auto_42347 ) ) ( not ( = ?auto_42346 ?auto_42347 ) ) ( ON-TABLE ?auto_42347 ) ( CLEAR ?auto_42347 ) ( HOLDING ?auto_42346 ) ( CLEAR ?auto_42345 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42342 ?auto_42343 ?auto_42344 ?auto_42345 ?auto_42346 )
      ( MAKE-6PILE ?auto_42342 ?auto_42343 ?auto_42344 ?auto_42345 ?auto_42346 ?auto_42347 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42348 - BLOCK
      ?auto_42349 - BLOCK
      ?auto_42350 - BLOCK
      ?auto_42351 - BLOCK
      ?auto_42352 - BLOCK
      ?auto_42353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42348 ) ( ON ?auto_42349 ?auto_42348 ) ( ON ?auto_42350 ?auto_42349 ) ( ON ?auto_42351 ?auto_42350 ) ( not ( = ?auto_42348 ?auto_42349 ) ) ( not ( = ?auto_42348 ?auto_42350 ) ) ( not ( = ?auto_42348 ?auto_42351 ) ) ( not ( = ?auto_42348 ?auto_42352 ) ) ( not ( = ?auto_42348 ?auto_42353 ) ) ( not ( = ?auto_42349 ?auto_42350 ) ) ( not ( = ?auto_42349 ?auto_42351 ) ) ( not ( = ?auto_42349 ?auto_42352 ) ) ( not ( = ?auto_42349 ?auto_42353 ) ) ( not ( = ?auto_42350 ?auto_42351 ) ) ( not ( = ?auto_42350 ?auto_42352 ) ) ( not ( = ?auto_42350 ?auto_42353 ) ) ( not ( = ?auto_42351 ?auto_42352 ) ) ( not ( = ?auto_42351 ?auto_42353 ) ) ( not ( = ?auto_42352 ?auto_42353 ) ) ( ON-TABLE ?auto_42353 ) ( CLEAR ?auto_42351 ) ( ON ?auto_42352 ?auto_42353 ) ( CLEAR ?auto_42352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42353 )
      ( MAKE-6PILE ?auto_42348 ?auto_42349 ?auto_42350 ?auto_42351 ?auto_42352 ?auto_42353 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42354 - BLOCK
      ?auto_42355 - BLOCK
      ?auto_42356 - BLOCK
      ?auto_42357 - BLOCK
      ?auto_42358 - BLOCK
      ?auto_42359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42354 ) ( ON ?auto_42355 ?auto_42354 ) ( ON ?auto_42356 ?auto_42355 ) ( not ( = ?auto_42354 ?auto_42355 ) ) ( not ( = ?auto_42354 ?auto_42356 ) ) ( not ( = ?auto_42354 ?auto_42357 ) ) ( not ( = ?auto_42354 ?auto_42358 ) ) ( not ( = ?auto_42354 ?auto_42359 ) ) ( not ( = ?auto_42355 ?auto_42356 ) ) ( not ( = ?auto_42355 ?auto_42357 ) ) ( not ( = ?auto_42355 ?auto_42358 ) ) ( not ( = ?auto_42355 ?auto_42359 ) ) ( not ( = ?auto_42356 ?auto_42357 ) ) ( not ( = ?auto_42356 ?auto_42358 ) ) ( not ( = ?auto_42356 ?auto_42359 ) ) ( not ( = ?auto_42357 ?auto_42358 ) ) ( not ( = ?auto_42357 ?auto_42359 ) ) ( not ( = ?auto_42358 ?auto_42359 ) ) ( ON-TABLE ?auto_42359 ) ( ON ?auto_42358 ?auto_42359 ) ( CLEAR ?auto_42358 ) ( HOLDING ?auto_42357 ) ( CLEAR ?auto_42356 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42354 ?auto_42355 ?auto_42356 ?auto_42357 )
      ( MAKE-6PILE ?auto_42354 ?auto_42355 ?auto_42356 ?auto_42357 ?auto_42358 ?auto_42359 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42360 - BLOCK
      ?auto_42361 - BLOCK
      ?auto_42362 - BLOCK
      ?auto_42363 - BLOCK
      ?auto_42364 - BLOCK
      ?auto_42365 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42360 ) ( ON ?auto_42361 ?auto_42360 ) ( ON ?auto_42362 ?auto_42361 ) ( not ( = ?auto_42360 ?auto_42361 ) ) ( not ( = ?auto_42360 ?auto_42362 ) ) ( not ( = ?auto_42360 ?auto_42363 ) ) ( not ( = ?auto_42360 ?auto_42364 ) ) ( not ( = ?auto_42360 ?auto_42365 ) ) ( not ( = ?auto_42361 ?auto_42362 ) ) ( not ( = ?auto_42361 ?auto_42363 ) ) ( not ( = ?auto_42361 ?auto_42364 ) ) ( not ( = ?auto_42361 ?auto_42365 ) ) ( not ( = ?auto_42362 ?auto_42363 ) ) ( not ( = ?auto_42362 ?auto_42364 ) ) ( not ( = ?auto_42362 ?auto_42365 ) ) ( not ( = ?auto_42363 ?auto_42364 ) ) ( not ( = ?auto_42363 ?auto_42365 ) ) ( not ( = ?auto_42364 ?auto_42365 ) ) ( ON-TABLE ?auto_42365 ) ( ON ?auto_42364 ?auto_42365 ) ( CLEAR ?auto_42362 ) ( ON ?auto_42363 ?auto_42364 ) ( CLEAR ?auto_42363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42365 ?auto_42364 )
      ( MAKE-6PILE ?auto_42360 ?auto_42361 ?auto_42362 ?auto_42363 ?auto_42364 ?auto_42365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42366 - BLOCK
      ?auto_42367 - BLOCK
      ?auto_42368 - BLOCK
      ?auto_42369 - BLOCK
      ?auto_42370 - BLOCK
      ?auto_42371 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42366 ) ( ON ?auto_42367 ?auto_42366 ) ( not ( = ?auto_42366 ?auto_42367 ) ) ( not ( = ?auto_42366 ?auto_42368 ) ) ( not ( = ?auto_42366 ?auto_42369 ) ) ( not ( = ?auto_42366 ?auto_42370 ) ) ( not ( = ?auto_42366 ?auto_42371 ) ) ( not ( = ?auto_42367 ?auto_42368 ) ) ( not ( = ?auto_42367 ?auto_42369 ) ) ( not ( = ?auto_42367 ?auto_42370 ) ) ( not ( = ?auto_42367 ?auto_42371 ) ) ( not ( = ?auto_42368 ?auto_42369 ) ) ( not ( = ?auto_42368 ?auto_42370 ) ) ( not ( = ?auto_42368 ?auto_42371 ) ) ( not ( = ?auto_42369 ?auto_42370 ) ) ( not ( = ?auto_42369 ?auto_42371 ) ) ( not ( = ?auto_42370 ?auto_42371 ) ) ( ON-TABLE ?auto_42371 ) ( ON ?auto_42370 ?auto_42371 ) ( ON ?auto_42369 ?auto_42370 ) ( CLEAR ?auto_42369 ) ( HOLDING ?auto_42368 ) ( CLEAR ?auto_42367 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42366 ?auto_42367 ?auto_42368 )
      ( MAKE-6PILE ?auto_42366 ?auto_42367 ?auto_42368 ?auto_42369 ?auto_42370 ?auto_42371 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42372 - BLOCK
      ?auto_42373 - BLOCK
      ?auto_42374 - BLOCK
      ?auto_42375 - BLOCK
      ?auto_42376 - BLOCK
      ?auto_42377 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42372 ) ( ON ?auto_42373 ?auto_42372 ) ( not ( = ?auto_42372 ?auto_42373 ) ) ( not ( = ?auto_42372 ?auto_42374 ) ) ( not ( = ?auto_42372 ?auto_42375 ) ) ( not ( = ?auto_42372 ?auto_42376 ) ) ( not ( = ?auto_42372 ?auto_42377 ) ) ( not ( = ?auto_42373 ?auto_42374 ) ) ( not ( = ?auto_42373 ?auto_42375 ) ) ( not ( = ?auto_42373 ?auto_42376 ) ) ( not ( = ?auto_42373 ?auto_42377 ) ) ( not ( = ?auto_42374 ?auto_42375 ) ) ( not ( = ?auto_42374 ?auto_42376 ) ) ( not ( = ?auto_42374 ?auto_42377 ) ) ( not ( = ?auto_42375 ?auto_42376 ) ) ( not ( = ?auto_42375 ?auto_42377 ) ) ( not ( = ?auto_42376 ?auto_42377 ) ) ( ON-TABLE ?auto_42377 ) ( ON ?auto_42376 ?auto_42377 ) ( ON ?auto_42375 ?auto_42376 ) ( CLEAR ?auto_42373 ) ( ON ?auto_42374 ?auto_42375 ) ( CLEAR ?auto_42374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42377 ?auto_42376 ?auto_42375 )
      ( MAKE-6PILE ?auto_42372 ?auto_42373 ?auto_42374 ?auto_42375 ?auto_42376 ?auto_42377 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42378 - BLOCK
      ?auto_42379 - BLOCK
      ?auto_42380 - BLOCK
      ?auto_42381 - BLOCK
      ?auto_42382 - BLOCK
      ?auto_42383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42378 ) ( not ( = ?auto_42378 ?auto_42379 ) ) ( not ( = ?auto_42378 ?auto_42380 ) ) ( not ( = ?auto_42378 ?auto_42381 ) ) ( not ( = ?auto_42378 ?auto_42382 ) ) ( not ( = ?auto_42378 ?auto_42383 ) ) ( not ( = ?auto_42379 ?auto_42380 ) ) ( not ( = ?auto_42379 ?auto_42381 ) ) ( not ( = ?auto_42379 ?auto_42382 ) ) ( not ( = ?auto_42379 ?auto_42383 ) ) ( not ( = ?auto_42380 ?auto_42381 ) ) ( not ( = ?auto_42380 ?auto_42382 ) ) ( not ( = ?auto_42380 ?auto_42383 ) ) ( not ( = ?auto_42381 ?auto_42382 ) ) ( not ( = ?auto_42381 ?auto_42383 ) ) ( not ( = ?auto_42382 ?auto_42383 ) ) ( ON-TABLE ?auto_42383 ) ( ON ?auto_42382 ?auto_42383 ) ( ON ?auto_42381 ?auto_42382 ) ( ON ?auto_42380 ?auto_42381 ) ( CLEAR ?auto_42380 ) ( HOLDING ?auto_42379 ) ( CLEAR ?auto_42378 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42378 ?auto_42379 )
      ( MAKE-6PILE ?auto_42378 ?auto_42379 ?auto_42380 ?auto_42381 ?auto_42382 ?auto_42383 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42384 - BLOCK
      ?auto_42385 - BLOCK
      ?auto_42386 - BLOCK
      ?auto_42387 - BLOCK
      ?auto_42388 - BLOCK
      ?auto_42389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42384 ) ( not ( = ?auto_42384 ?auto_42385 ) ) ( not ( = ?auto_42384 ?auto_42386 ) ) ( not ( = ?auto_42384 ?auto_42387 ) ) ( not ( = ?auto_42384 ?auto_42388 ) ) ( not ( = ?auto_42384 ?auto_42389 ) ) ( not ( = ?auto_42385 ?auto_42386 ) ) ( not ( = ?auto_42385 ?auto_42387 ) ) ( not ( = ?auto_42385 ?auto_42388 ) ) ( not ( = ?auto_42385 ?auto_42389 ) ) ( not ( = ?auto_42386 ?auto_42387 ) ) ( not ( = ?auto_42386 ?auto_42388 ) ) ( not ( = ?auto_42386 ?auto_42389 ) ) ( not ( = ?auto_42387 ?auto_42388 ) ) ( not ( = ?auto_42387 ?auto_42389 ) ) ( not ( = ?auto_42388 ?auto_42389 ) ) ( ON-TABLE ?auto_42389 ) ( ON ?auto_42388 ?auto_42389 ) ( ON ?auto_42387 ?auto_42388 ) ( ON ?auto_42386 ?auto_42387 ) ( CLEAR ?auto_42384 ) ( ON ?auto_42385 ?auto_42386 ) ( CLEAR ?auto_42385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42389 ?auto_42388 ?auto_42387 ?auto_42386 )
      ( MAKE-6PILE ?auto_42384 ?auto_42385 ?auto_42386 ?auto_42387 ?auto_42388 ?auto_42389 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42390 - BLOCK
      ?auto_42391 - BLOCK
      ?auto_42392 - BLOCK
      ?auto_42393 - BLOCK
      ?auto_42394 - BLOCK
      ?auto_42395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42390 ?auto_42391 ) ) ( not ( = ?auto_42390 ?auto_42392 ) ) ( not ( = ?auto_42390 ?auto_42393 ) ) ( not ( = ?auto_42390 ?auto_42394 ) ) ( not ( = ?auto_42390 ?auto_42395 ) ) ( not ( = ?auto_42391 ?auto_42392 ) ) ( not ( = ?auto_42391 ?auto_42393 ) ) ( not ( = ?auto_42391 ?auto_42394 ) ) ( not ( = ?auto_42391 ?auto_42395 ) ) ( not ( = ?auto_42392 ?auto_42393 ) ) ( not ( = ?auto_42392 ?auto_42394 ) ) ( not ( = ?auto_42392 ?auto_42395 ) ) ( not ( = ?auto_42393 ?auto_42394 ) ) ( not ( = ?auto_42393 ?auto_42395 ) ) ( not ( = ?auto_42394 ?auto_42395 ) ) ( ON-TABLE ?auto_42395 ) ( ON ?auto_42394 ?auto_42395 ) ( ON ?auto_42393 ?auto_42394 ) ( ON ?auto_42392 ?auto_42393 ) ( ON ?auto_42391 ?auto_42392 ) ( CLEAR ?auto_42391 ) ( HOLDING ?auto_42390 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42390 )
      ( MAKE-6PILE ?auto_42390 ?auto_42391 ?auto_42392 ?auto_42393 ?auto_42394 ?auto_42395 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42396 - BLOCK
      ?auto_42397 - BLOCK
      ?auto_42398 - BLOCK
      ?auto_42399 - BLOCK
      ?auto_42400 - BLOCK
      ?auto_42401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42396 ?auto_42397 ) ) ( not ( = ?auto_42396 ?auto_42398 ) ) ( not ( = ?auto_42396 ?auto_42399 ) ) ( not ( = ?auto_42396 ?auto_42400 ) ) ( not ( = ?auto_42396 ?auto_42401 ) ) ( not ( = ?auto_42397 ?auto_42398 ) ) ( not ( = ?auto_42397 ?auto_42399 ) ) ( not ( = ?auto_42397 ?auto_42400 ) ) ( not ( = ?auto_42397 ?auto_42401 ) ) ( not ( = ?auto_42398 ?auto_42399 ) ) ( not ( = ?auto_42398 ?auto_42400 ) ) ( not ( = ?auto_42398 ?auto_42401 ) ) ( not ( = ?auto_42399 ?auto_42400 ) ) ( not ( = ?auto_42399 ?auto_42401 ) ) ( not ( = ?auto_42400 ?auto_42401 ) ) ( ON-TABLE ?auto_42401 ) ( ON ?auto_42400 ?auto_42401 ) ( ON ?auto_42399 ?auto_42400 ) ( ON ?auto_42398 ?auto_42399 ) ( ON ?auto_42397 ?auto_42398 ) ( ON ?auto_42396 ?auto_42397 ) ( CLEAR ?auto_42396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42401 ?auto_42400 ?auto_42399 ?auto_42398 ?auto_42397 )
      ( MAKE-6PILE ?auto_42396 ?auto_42397 ?auto_42398 ?auto_42399 ?auto_42400 ?auto_42401 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42408 - BLOCK
      ?auto_42409 - BLOCK
      ?auto_42410 - BLOCK
      ?auto_42411 - BLOCK
      ?auto_42412 - BLOCK
      ?auto_42413 - BLOCK
    )
    :vars
    (
      ?auto_42414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42408 ?auto_42409 ) ) ( not ( = ?auto_42408 ?auto_42410 ) ) ( not ( = ?auto_42408 ?auto_42411 ) ) ( not ( = ?auto_42408 ?auto_42412 ) ) ( not ( = ?auto_42408 ?auto_42413 ) ) ( not ( = ?auto_42409 ?auto_42410 ) ) ( not ( = ?auto_42409 ?auto_42411 ) ) ( not ( = ?auto_42409 ?auto_42412 ) ) ( not ( = ?auto_42409 ?auto_42413 ) ) ( not ( = ?auto_42410 ?auto_42411 ) ) ( not ( = ?auto_42410 ?auto_42412 ) ) ( not ( = ?auto_42410 ?auto_42413 ) ) ( not ( = ?auto_42411 ?auto_42412 ) ) ( not ( = ?auto_42411 ?auto_42413 ) ) ( not ( = ?auto_42412 ?auto_42413 ) ) ( ON-TABLE ?auto_42413 ) ( ON ?auto_42412 ?auto_42413 ) ( ON ?auto_42411 ?auto_42412 ) ( ON ?auto_42410 ?auto_42411 ) ( ON ?auto_42409 ?auto_42410 ) ( CLEAR ?auto_42409 ) ( ON ?auto_42408 ?auto_42414 ) ( CLEAR ?auto_42408 ) ( HAND-EMPTY ) ( not ( = ?auto_42408 ?auto_42414 ) ) ( not ( = ?auto_42409 ?auto_42414 ) ) ( not ( = ?auto_42410 ?auto_42414 ) ) ( not ( = ?auto_42411 ?auto_42414 ) ) ( not ( = ?auto_42412 ?auto_42414 ) ) ( not ( = ?auto_42413 ?auto_42414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42408 ?auto_42414 )
      ( MAKE-6PILE ?auto_42408 ?auto_42409 ?auto_42410 ?auto_42411 ?auto_42412 ?auto_42413 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42415 - BLOCK
      ?auto_42416 - BLOCK
      ?auto_42417 - BLOCK
      ?auto_42418 - BLOCK
      ?auto_42419 - BLOCK
      ?auto_42420 - BLOCK
    )
    :vars
    (
      ?auto_42421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42415 ?auto_42416 ) ) ( not ( = ?auto_42415 ?auto_42417 ) ) ( not ( = ?auto_42415 ?auto_42418 ) ) ( not ( = ?auto_42415 ?auto_42419 ) ) ( not ( = ?auto_42415 ?auto_42420 ) ) ( not ( = ?auto_42416 ?auto_42417 ) ) ( not ( = ?auto_42416 ?auto_42418 ) ) ( not ( = ?auto_42416 ?auto_42419 ) ) ( not ( = ?auto_42416 ?auto_42420 ) ) ( not ( = ?auto_42417 ?auto_42418 ) ) ( not ( = ?auto_42417 ?auto_42419 ) ) ( not ( = ?auto_42417 ?auto_42420 ) ) ( not ( = ?auto_42418 ?auto_42419 ) ) ( not ( = ?auto_42418 ?auto_42420 ) ) ( not ( = ?auto_42419 ?auto_42420 ) ) ( ON-TABLE ?auto_42420 ) ( ON ?auto_42419 ?auto_42420 ) ( ON ?auto_42418 ?auto_42419 ) ( ON ?auto_42417 ?auto_42418 ) ( ON ?auto_42415 ?auto_42421 ) ( CLEAR ?auto_42415 ) ( not ( = ?auto_42415 ?auto_42421 ) ) ( not ( = ?auto_42416 ?auto_42421 ) ) ( not ( = ?auto_42417 ?auto_42421 ) ) ( not ( = ?auto_42418 ?auto_42421 ) ) ( not ( = ?auto_42419 ?auto_42421 ) ) ( not ( = ?auto_42420 ?auto_42421 ) ) ( HOLDING ?auto_42416 ) ( CLEAR ?auto_42417 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42420 ?auto_42419 ?auto_42418 ?auto_42417 ?auto_42416 )
      ( MAKE-6PILE ?auto_42415 ?auto_42416 ?auto_42417 ?auto_42418 ?auto_42419 ?auto_42420 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42422 - BLOCK
      ?auto_42423 - BLOCK
      ?auto_42424 - BLOCK
      ?auto_42425 - BLOCK
      ?auto_42426 - BLOCK
      ?auto_42427 - BLOCK
    )
    :vars
    (
      ?auto_42428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42422 ?auto_42423 ) ) ( not ( = ?auto_42422 ?auto_42424 ) ) ( not ( = ?auto_42422 ?auto_42425 ) ) ( not ( = ?auto_42422 ?auto_42426 ) ) ( not ( = ?auto_42422 ?auto_42427 ) ) ( not ( = ?auto_42423 ?auto_42424 ) ) ( not ( = ?auto_42423 ?auto_42425 ) ) ( not ( = ?auto_42423 ?auto_42426 ) ) ( not ( = ?auto_42423 ?auto_42427 ) ) ( not ( = ?auto_42424 ?auto_42425 ) ) ( not ( = ?auto_42424 ?auto_42426 ) ) ( not ( = ?auto_42424 ?auto_42427 ) ) ( not ( = ?auto_42425 ?auto_42426 ) ) ( not ( = ?auto_42425 ?auto_42427 ) ) ( not ( = ?auto_42426 ?auto_42427 ) ) ( ON-TABLE ?auto_42427 ) ( ON ?auto_42426 ?auto_42427 ) ( ON ?auto_42425 ?auto_42426 ) ( ON ?auto_42424 ?auto_42425 ) ( ON ?auto_42422 ?auto_42428 ) ( not ( = ?auto_42422 ?auto_42428 ) ) ( not ( = ?auto_42423 ?auto_42428 ) ) ( not ( = ?auto_42424 ?auto_42428 ) ) ( not ( = ?auto_42425 ?auto_42428 ) ) ( not ( = ?auto_42426 ?auto_42428 ) ) ( not ( = ?auto_42427 ?auto_42428 ) ) ( CLEAR ?auto_42424 ) ( ON ?auto_42423 ?auto_42422 ) ( CLEAR ?auto_42423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42428 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42428 ?auto_42422 )
      ( MAKE-6PILE ?auto_42422 ?auto_42423 ?auto_42424 ?auto_42425 ?auto_42426 ?auto_42427 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42429 - BLOCK
      ?auto_42430 - BLOCK
      ?auto_42431 - BLOCK
      ?auto_42432 - BLOCK
      ?auto_42433 - BLOCK
      ?auto_42434 - BLOCK
    )
    :vars
    (
      ?auto_42435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42429 ?auto_42430 ) ) ( not ( = ?auto_42429 ?auto_42431 ) ) ( not ( = ?auto_42429 ?auto_42432 ) ) ( not ( = ?auto_42429 ?auto_42433 ) ) ( not ( = ?auto_42429 ?auto_42434 ) ) ( not ( = ?auto_42430 ?auto_42431 ) ) ( not ( = ?auto_42430 ?auto_42432 ) ) ( not ( = ?auto_42430 ?auto_42433 ) ) ( not ( = ?auto_42430 ?auto_42434 ) ) ( not ( = ?auto_42431 ?auto_42432 ) ) ( not ( = ?auto_42431 ?auto_42433 ) ) ( not ( = ?auto_42431 ?auto_42434 ) ) ( not ( = ?auto_42432 ?auto_42433 ) ) ( not ( = ?auto_42432 ?auto_42434 ) ) ( not ( = ?auto_42433 ?auto_42434 ) ) ( ON-TABLE ?auto_42434 ) ( ON ?auto_42433 ?auto_42434 ) ( ON ?auto_42432 ?auto_42433 ) ( ON ?auto_42429 ?auto_42435 ) ( not ( = ?auto_42429 ?auto_42435 ) ) ( not ( = ?auto_42430 ?auto_42435 ) ) ( not ( = ?auto_42431 ?auto_42435 ) ) ( not ( = ?auto_42432 ?auto_42435 ) ) ( not ( = ?auto_42433 ?auto_42435 ) ) ( not ( = ?auto_42434 ?auto_42435 ) ) ( ON ?auto_42430 ?auto_42429 ) ( CLEAR ?auto_42430 ) ( ON-TABLE ?auto_42435 ) ( HOLDING ?auto_42431 ) ( CLEAR ?auto_42432 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42434 ?auto_42433 ?auto_42432 ?auto_42431 )
      ( MAKE-6PILE ?auto_42429 ?auto_42430 ?auto_42431 ?auto_42432 ?auto_42433 ?auto_42434 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42436 - BLOCK
      ?auto_42437 - BLOCK
      ?auto_42438 - BLOCK
      ?auto_42439 - BLOCK
      ?auto_42440 - BLOCK
      ?auto_42441 - BLOCK
    )
    :vars
    (
      ?auto_42442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42436 ?auto_42437 ) ) ( not ( = ?auto_42436 ?auto_42438 ) ) ( not ( = ?auto_42436 ?auto_42439 ) ) ( not ( = ?auto_42436 ?auto_42440 ) ) ( not ( = ?auto_42436 ?auto_42441 ) ) ( not ( = ?auto_42437 ?auto_42438 ) ) ( not ( = ?auto_42437 ?auto_42439 ) ) ( not ( = ?auto_42437 ?auto_42440 ) ) ( not ( = ?auto_42437 ?auto_42441 ) ) ( not ( = ?auto_42438 ?auto_42439 ) ) ( not ( = ?auto_42438 ?auto_42440 ) ) ( not ( = ?auto_42438 ?auto_42441 ) ) ( not ( = ?auto_42439 ?auto_42440 ) ) ( not ( = ?auto_42439 ?auto_42441 ) ) ( not ( = ?auto_42440 ?auto_42441 ) ) ( ON-TABLE ?auto_42441 ) ( ON ?auto_42440 ?auto_42441 ) ( ON ?auto_42439 ?auto_42440 ) ( ON ?auto_42436 ?auto_42442 ) ( not ( = ?auto_42436 ?auto_42442 ) ) ( not ( = ?auto_42437 ?auto_42442 ) ) ( not ( = ?auto_42438 ?auto_42442 ) ) ( not ( = ?auto_42439 ?auto_42442 ) ) ( not ( = ?auto_42440 ?auto_42442 ) ) ( not ( = ?auto_42441 ?auto_42442 ) ) ( ON ?auto_42437 ?auto_42436 ) ( ON-TABLE ?auto_42442 ) ( CLEAR ?auto_42439 ) ( ON ?auto_42438 ?auto_42437 ) ( CLEAR ?auto_42438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42442 ?auto_42436 ?auto_42437 )
      ( MAKE-6PILE ?auto_42436 ?auto_42437 ?auto_42438 ?auto_42439 ?auto_42440 ?auto_42441 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42443 - BLOCK
      ?auto_42444 - BLOCK
      ?auto_42445 - BLOCK
      ?auto_42446 - BLOCK
      ?auto_42447 - BLOCK
      ?auto_42448 - BLOCK
    )
    :vars
    (
      ?auto_42449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42443 ?auto_42444 ) ) ( not ( = ?auto_42443 ?auto_42445 ) ) ( not ( = ?auto_42443 ?auto_42446 ) ) ( not ( = ?auto_42443 ?auto_42447 ) ) ( not ( = ?auto_42443 ?auto_42448 ) ) ( not ( = ?auto_42444 ?auto_42445 ) ) ( not ( = ?auto_42444 ?auto_42446 ) ) ( not ( = ?auto_42444 ?auto_42447 ) ) ( not ( = ?auto_42444 ?auto_42448 ) ) ( not ( = ?auto_42445 ?auto_42446 ) ) ( not ( = ?auto_42445 ?auto_42447 ) ) ( not ( = ?auto_42445 ?auto_42448 ) ) ( not ( = ?auto_42446 ?auto_42447 ) ) ( not ( = ?auto_42446 ?auto_42448 ) ) ( not ( = ?auto_42447 ?auto_42448 ) ) ( ON-TABLE ?auto_42448 ) ( ON ?auto_42447 ?auto_42448 ) ( ON ?auto_42443 ?auto_42449 ) ( not ( = ?auto_42443 ?auto_42449 ) ) ( not ( = ?auto_42444 ?auto_42449 ) ) ( not ( = ?auto_42445 ?auto_42449 ) ) ( not ( = ?auto_42446 ?auto_42449 ) ) ( not ( = ?auto_42447 ?auto_42449 ) ) ( not ( = ?auto_42448 ?auto_42449 ) ) ( ON ?auto_42444 ?auto_42443 ) ( ON-TABLE ?auto_42449 ) ( ON ?auto_42445 ?auto_42444 ) ( CLEAR ?auto_42445 ) ( HOLDING ?auto_42446 ) ( CLEAR ?auto_42447 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42448 ?auto_42447 ?auto_42446 )
      ( MAKE-6PILE ?auto_42443 ?auto_42444 ?auto_42445 ?auto_42446 ?auto_42447 ?auto_42448 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42450 - BLOCK
      ?auto_42451 - BLOCK
      ?auto_42452 - BLOCK
      ?auto_42453 - BLOCK
      ?auto_42454 - BLOCK
      ?auto_42455 - BLOCK
    )
    :vars
    (
      ?auto_42456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42450 ?auto_42451 ) ) ( not ( = ?auto_42450 ?auto_42452 ) ) ( not ( = ?auto_42450 ?auto_42453 ) ) ( not ( = ?auto_42450 ?auto_42454 ) ) ( not ( = ?auto_42450 ?auto_42455 ) ) ( not ( = ?auto_42451 ?auto_42452 ) ) ( not ( = ?auto_42451 ?auto_42453 ) ) ( not ( = ?auto_42451 ?auto_42454 ) ) ( not ( = ?auto_42451 ?auto_42455 ) ) ( not ( = ?auto_42452 ?auto_42453 ) ) ( not ( = ?auto_42452 ?auto_42454 ) ) ( not ( = ?auto_42452 ?auto_42455 ) ) ( not ( = ?auto_42453 ?auto_42454 ) ) ( not ( = ?auto_42453 ?auto_42455 ) ) ( not ( = ?auto_42454 ?auto_42455 ) ) ( ON-TABLE ?auto_42455 ) ( ON ?auto_42454 ?auto_42455 ) ( ON ?auto_42450 ?auto_42456 ) ( not ( = ?auto_42450 ?auto_42456 ) ) ( not ( = ?auto_42451 ?auto_42456 ) ) ( not ( = ?auto_42452 ?auto_42456 ) ) ( not ( = ?auto_42453 ?auto_42456 ) ) ( not ( = ?auto_42454 ?auto_42456 ) ) ( not ( = ?auto_42455 ?auto_42456 ) ) ( ON ?auto_42451 ?auto_42450 ) ( ON-TABLE ?auto_42456 ) ( ON ?auto_42452 ?auto_42451 ) ( CLEAR ?auto_42454 ) ( ON ?auto_42453 ?auto_42452 ) ( CLEAR ?auto_42453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42456 ?auto_42450 ?auto_42451 ?auto_42452 )
      ( MAKE-6PILE ?auto_42450 ?auto_42451 ?auto_42452 ?auto_42453 ?auto_42454 ?auto_42455 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42457 - BLOCK
      ?auto_42458 - BLOCK
      ?auto_42459 - BLOCK
      ?auto_42460 - BLOCK
      ?auto_42461 - BLOCK
      ?auto_42462 - BLOCK
    )
    :vars
    (
      ?auto_42463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42457 ?auto_42458 ) ) ( not ( = ?auto_42457 ?auto_42459 ) ) ( not ( = ?auto_42457 ?auto_42460 ) ) ( not ( = ?auto_42457 ?auto_42461 ) ) ( not ( = ?auto_42457 ?auto_42462 ) ) ( not ( = ?auto_42458 ?auto_42459 ) ) ( not ( = ?auto_42458 ?auto_42460 ) ) ( not ( = ?auto_42458 ?auto_42461 ) ) ( not ( = ?auto_42458 ?auto_42462 ) ) ( not ( = ?auto_42459 ?auto_42460 ) ) ( not ( = ?auto_42459 ?auto_42461 ) ) ( not ( = ?auto_42459 ?auto_42462 ) ) ( not ( = ?auto_42460 ?auto_42461 ) ) ( not ( = ?auto_42460 ?auto_42462 ) ) ( not ( = ?auto_42461 ?auto_42462 ) ) ( ON-TABLE ?auto_42462 ) ( ON ?auto_42457 ?auto_42463 ) ( not ( = ?auto_42457 ?auto_42463 ) ) ( not ( = ?auto_42458 ?auto_42463 ) ) ( not ( = ?auto_42459 ?auto_42463 ) ) ( not ( = ?auto_42460 ?auto_42463 ) ) ( not ( = ?auto_42461 ?auto_42463 ) ) ( not ( = ?auto_42462 ?auto_42463 ) ) ( ON ?auto_42458 ?auto_42457 ) ( ON-TABLE ?auto_42463 ) ( ON ?auto_42459 ?auto_42458 ) ( ON ?auto_42460 ?auto_42459 ) ( CLEAR ?auto_42460 ) ( HOLDING ?auto_42461 ) ( CLEAR ?auto_42462 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42462 ?auto_42461 )
      ( MAKE-6PILE ?auto_42457 ?auto_42458 ?auto_42459 ?auto_42460 ?auto_42461 ?auto_42462 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42464 - BLOCK
      ?auto_42465 - BLOCK
      ?auto_42466 - BLOCK
      ?auto_42467 - BLOCK
      ?auto_42468 - BLOCK
      ?auto_42469 - BLOCK
    )
    :vars
    (
      ?auto_42470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42464 ?auto_42465 ) ) ( not ( = ?auto_42464 ?auto_42466 ) ) ( not ( = ?auto_42464 ?auto_42467 ) ) ( not ( = ?auto_42464 ?auto_42468 ) ) ( not ( = ?auto_42464 ?auto_42469 ) ) ( not ( = ?auto_42465 ?auto_42466 ) ) ( not ( = ?auto_42465 ?auto_42467 ) ) ( not ( = ?auto_42465 ?auto_42468 ) ) ( not ( = ?auto_42465 ?auto_42469 ) ) ( not ( = ?auto_42466 ?auto_42467 ) ) ( not ( = ?auto_42466 ?auto_42468 ) ) ( not ( = ?auto_42466 ?auto_42469 ) ) ( not ( = ?auto_42467 ?auto_42468 ) ) ( not ( = ?auto_42467 ?auto_42469 ) ) ( not ( = ?auto_42468 ?auto_42469 ) ) ( ON-TABLE ?auto_42469 ) ( ON ?auto_42464 ?auto_42470 ) ( not ( = ?auto_42464 ?auto_42470 ) ) ( not ( = ?auto_42465 ?auto_42470 ) ) ( not ( = ?auto_42466 ?auto_42470 ) ) ( not ( = ?auto_42467 ?auto_42470 ) ) ( not ( = ?auto_42468 ?auto_42470 ) ) ( not ( = ?auto_42469 ?auto_42470 ) ) ( ON ?auto_42465 ?auto_42464 ) ( ON-TABLE ?auto_42470 ) ( ON ?auto_42466 ?auto_42465 ) ( ON ?auto_42467 ?auto_42466 ) ( CLEAR ?auto_42469 ) ( ON ?auto_42468 ?auto_42467 ) ( CLEAR ?auto_42468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42470 ?auto_42464 ?auto_42465 ?auto_42466 ?auto_42467 )
      ( MAKE-6PILE ?auto_42464 ?auto_42465 ?auto_42466 ?auto_42467 ?auto_42468 ?auto_42469 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42471 - BLOCK
      ?auto_42472 - BLOCK
      ?auto_42473 - BLOCK
      ?auto_42474 - BLOCK
      ?auto_42475 - BLOCK
      ?auto_42476 - BLOCK
    )
    :vars
    (
      ?auto_42477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42471 ?auto_42472 ) ) ( not ( = ?auto_42471 ?auto_42473 ) ) ( not ( = ?auto_42471 ?auto_42474 ) ) ( not ( = ?auto_42471 ?auto_42475 ) ) ( not ( = ?auto_42471 ?auto_42476 ) ) ( not ( = ?auto_42472 ?auto_42473 ) ) ( not ( = ?auto_42472 ?auto_42474 ) ) ( not ( = ?auto_42472 ?auto_42475 ) ) ( not ( = ?auto_42472 ?auto_42476 ) ) ( not ( = ?auto_42473 ?auto_42474 ) ) ( not ( = ?auto_42473 ?auto_42475 ) ) ( not ( = ?auto_42473 ?auto_42476 ) ) ( not ( = ?auto_42474 ?auto_42475 ) ) ( not ( = ?auto_42474 ?auto_42476 ) ) ( not ( = ?auto_42475 ?auto_42476 ) ) ( ON ?auto_42471 ?auto_42477 ) ( not ( = ?auto_42471 ?auto_42477 ) ) ( not ( = ?auto_42472 ?auto_42477 ) ) ( not ( = ?auto_42473 ?auto_42477 ) ) ( not ( = ?auto_42474 ?auto_42477 ) ) ( not ( = ?auto_42475 ?auto_42477 ) ) ( not ( = ?auto_42476 ?auto_42477 ) ) ( ON ?auto_42472 ?auto_42471 ) ( ON-TABLE ?auto_42477 ) ( ON ?auto_42473 ?auto_42472 ) ( ON ?auto_42474 ?auto_42473 ) ( ON ?auto_42475 ?auto_42474 ) ( CLEAR ?auto_42475 ) ( HOLDING ?auto_42476 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42476 )
      ( MAKE-6PILE ?auto_42471 ?auto_42472 ?auto_42473 ?auto_42474 ?auto_42475 ?auto_42476 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42478 - BLOCK
      ?auto_42479 - BLOCK
      ?auto_42480 - BLOCK
      ?auto_42481 - BLOCK
      ?auto_42482 - BLOCK
      ?auto_42483 - BLOCK
    )
    :vars
    (
      ?auto_42484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42478 ?auto_42479 ) ) ( not ( = ?auto_42478 ?auto_42480 ) ) ( not ( = ?auto_42478 ?auto_42481 ) ) ( not ( = ?auto_42478 ?auto_42482 ) ) ( not ( = ?auto_42478 ?auto_42483 ) ) ( not ( = ?auto_42479 ?auto_42480 ) ) ( not ( = ?auto_42479 ?auto_42481 ) ) ( not ( = ?auto_42479 ?auto_42482 ) ) ( not ( = ?auto_42479 ?auto_42483 ) ) ( not ( = ?auto_42480 ?auto_42481 ) ) ( not ( = ?auto_42480 ?auto_42482 ) ) ( not ( = ?auto_42480 ?auto_42483 ) ) ( not ( = ?auto_42481 ?auto_42482 ) ) ( not ( = ?auto_42481 ?auto_42483 ) ) ( not ( = ?auto_42482 ?auto_42483 ) ) ( ON ?auto_42478 ?auto_42484 ) ( not ( = ?auto_42478 ?auto_42484 ) ) ( not ( = ?auto_42479 ?auto_42484 ) ) ( not ( = ?auto_42480 ?auto_42484 ) ) ( not ( = ?auto_42481 ?auto_42484 ) ) ( not ( = ?auto_42482 ?auto_42484 ) ) ( not ( = ?auto_42483 ?auto_42484 ) ) ( ON ?auto_42479 ?auto_42478 ) ( ON-TABLE ?auto_42484 ) ( ON ?auto_42480 ?auto_42479 ) ( ON ?auto_42481 ?auto_42480 ) ( ON ?auto_42482 ?auto_42481 ) ( ON ?auto_42483 ?auto_42482 ) ( CLEAR ?auto_42483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42484 ?auto_42478 ?auto_42479 ?auto_42480 ?auto_42481 ?auto_42482 )
      ( MAKE-6PILE ?auto_42478 ?auto_42479 ?auto_42480 ?auto_42481 ?auto_42482 ?auto_42483 ) )
  )

)

