( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9910 - SURFACE
      ?auto_9911 - SURFACE
    )
    :vars
    (
      ?auto_9912 - HOIST
      ?auto_9913 - PLACE
      ?auto_9915 - PLACE
      ?auto_9916 - HOIST
      ?auto_9917 - SURFACE
      ?auto_9914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9912 ?auto_9913 ) ( SURFACE-AT ?auto_9910 ?auto_9913 ) ( CLEAR ?auto_9910 ) ( IS-CRATE ?auto_9911 ) ( AVAILABLE ?auto_9912 ) ( not ( = ?auto_9915 ?auto_9913 ) ) ( HOIST-AT ?auto_9916 ?auto_9915 ) ( AVAILABLE ?auto_9916 ) ( SURFACE-AT ?auto_9911 ?auto_9915 ) ( ON ?auto_9911 ?auto_9917 ) ( CLEAR ?auto_9911 ) ( TRUCK-AT ?auto_9914 ?auto_9913 ) ( not ( = ?auto_9910 ?auto_9911 ) ) ( not ( = ?auto_9910 ?auto_9917 ) ) ( not ( = ?auto_9911 ?auto_9917 ) ) ( not ( = ?auto_9912 ?auto_9916 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9914 ?auto_9913 ?auto_9915 )
      ( !LIFT ?auto_9916 ?auto_9911 ?auto_9917 ?auto_9915 )
      ( !LOAD ?auto_9916 ?auto_9911 ?auto_9914 ?auto_9915 )
      ( !DRIVE ?auto_9914 ?auto_9915 ?auto_9913 )
      ( !UNLOAD ?auto_9912 ?auto_9911 ?auto_9914 ?auto_9913 )
      ( !DROP ?auto_9912 ?auto_9911 ?auto_9910 ?auto_9913 )
      ( MAKE-1CRATE-VERIFY ?auto_9910 ?auto_9911 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9920 - SURFACE
      ?auto_9921 - SURFACE
    )
    :vars
    (
      ?auto_9922 - HOIST
      ?auto_9923 - PLACE
      ?auto_9925 - PLACE
      ?auto_9926 - HOIST
      ?auto_9927 - SURFACE
      ?auto_9924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9922 ?auto_9923 ) ( SURFACE-AT ?auto_9920 ?auto_9923 ) ( CLEAR ?auto_9920 ) ( IS-CRATE ?auto_9921 ) ( AVAILABLE ?auto_9922 ) ( not ( = ?auto_9925 ?auto_9923 ) ) ( HOIST-AT ?auto_9926 ?auto_9925 ) ( AVAILABLE ?auto_9926 ) ( SURFACE-AT ?auto_9921 ?auto_9925 ) ( ON ?auto_9921 ?auto_9927 ) ( CLEAR ?auto_9921 ) ( TRUCK-AT ?auto_9924 ?auto_9923 ) ( not ( = ?auto_9920 ?auto_9921 ) ) ( not ( = ?auto_9920 ?auto_9927 ) ) ( not ( = ?auto_9921 ?auto_9927 ) ) ( not ( = ?auto_9922 ?auto_9926 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9924 ?auto_9923 ?auto_9925 )
      ( !LIFT ?auto_9926 ?auto_9921 ?auto_9927 ?auto_9925 )
      ( !LOAD ?auto_9926 ?auto_9921 ?auto_9924 ?auto_9925 )
      ( !DRIVE ?auto_9924 ?auto_9925 ?auto_9923 )
      ( !UNLOAD ?auto_9922 ?auto_9921 ?auto_9924 ?auto_9923 )
      ( !DROP ?auto_9922 ?auto_9921 ?auto_9920 ?auto_9923 )
      ( MAKE-1CRATE-VERIFY ?auto_9920 ?auto_9921 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9931 - SURFACE
      ?auto_9932 - SURFACE
      ?auto_9933 - SURFACE
    )
    :vars
    (
      ?auto_9937 - HOIST
      ?auto_9935 - PLACE
      ?auto_9939 - PLACE
      ?auto_9938 - HOIST
      ?auto_9934 - SURFACE
      ?auto_9941 - PLACE
      ?auto_9942 - HOIST
      ?auto_9940 - SURFACE
      ?auto_9936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9937 ?auto_9935 ) ( IS-CRATE ?auto_9933 ) ( not ( = ?auto_9939 ?auto_9935 ) ) ( HOIST-AT ?auto_9938 ?auto_9939 ) ( AVAILABLE ?auto_9938 ) ( SURFACE-AT ?auto_9933 ?auto_9939 ) ( ON ?auto_9933 ?auto_9934 ) ( CLEAR ?auto_9933 ) ( not ( = ?auto_9932 ?auto_9933 ) ) ( not ( = ?auto_9932 ?auto_9934 ) ) ( not ( = ?auto_9933 ?auto_9934 ) ) ( not ( = ?auto_9937 ?auto_9938 ) ) ( SURFACE-AT ?auto_9931 ?auto_9935 ) ( CLEAR ?auto_9931 ) ( IS-CRATE ?auto_9932 ) ( AVAILABLE ?auto_9937 ) ( not ( = ?auto_9941 ?auto_9935 ) ) ( HOIST-AT ?auto_9942 ?auto_9941 ) ( AVAILABLE ?auto_9942 ) ( SURFACE-AT ?auto_9932 ?auto_9941 ) ( ON ?auto_9932 ?auto_9940 ) ( CLEAR ?auto_9932 ) ( TRUCK-AT ?auto_9936 ?auto_9935 ) ( not ( = ?auto_9931 ?auto_9932 ) ) ( not ( = ?auto_9931 ?auto_9940 ) ) ( not ( = ?auto_9932 ?auto_9940 ) ) ( not ( = ?auto_9937 ?auto_9942 ) ) ( not ( = ?auto_9931 ?auto_9933 ) ) ( not ( = ?auto_9931 ?auto_9934 ) ) ( not ( = ?auto_9933 ?auto_9940 ) ) ( not ( = ?auto_9939 ?auto_9941 ) ) ( not ( = ?auto_9938 ?auto_9942 ) ) ( not ( = ?auto_9934 ?auto_9940 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9931 ?auto_9932 )
      ( MAKE-1CRATE ?auto_9932 ?auto_9933 )
      ( MAKE-2CRATE-VERIFY ?auto_9931 ?auto_9932 ?auto_9933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9945 - SURFACE
      ?auto_9946 - SURFACE
    )
    :vars
    (
      ?auto_9947 - HOIST
      ?auto_9948 - PLACE
      ?auto_9950 - PLACE
      ?auto_9951 - HOIST
      ?auto_9952 - SURFACE
      ?auto_9949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9947 ?auto_9948 ) ( SURFACE-AT ?auto_9945 ?auto_9948 ) ( CLEAR ?auto_9945 ) ( IS-CRATE ?auto_9946 ) ( AVAILABLE ?auto_9947 ) ( not ( = ?auto_9950 ?auto_9948 ) ) ( HOIST-AT ?auto_9951 ?auto_9950 ) ( AVAILABLE ?auto_9951 ) ( SURFACE-AT ?auto_9946 ?auto_9950 ) ( ON ?auto_9946 ?auto_9952 ) ( CLEAR ?auto_9946 ) ( TRUCK-AT ?auto_9949 ?auto_9948 ) ( not ( = ?auto_9945 ?auto_9946 ) ) ( not ( = ?auto_9945 ?auto_9952 ) ) ( not ( = ?auto_9946 ?auto_9952 ) ) ( not ( = ?auto_9947 ?auto_9951 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9949 ?auto_9948 ?auto_9950 )
      ( !LIFT ?auto_9951 ?auto_9946 ?auto_9952 ?auto_9950 )
      ( !LOAD ?auto_9951 ?auto_9946 ?auto_9949 ?auto_9950 )
      ( !DRIVE ?auto_9949 ?auto_9950 ?auto_9948 )
      ( !UNLOAD ?auto_9947 ?auto_9946 ?auto_9949 ?auto_9948 )
      ( !DROP ?auto_9947 ?auto_9946 ?auto_9945 ?auto_9948 )
      ( MAKE-1CRATE-VERIFY ?auto_9945 ?auto_9946 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9957 - SURFACE
      ?auto_9958 - SURFACE
      ?auto_9959 - SURFACE
      ?auto_9960 - SURFACE
    )
    :vars
    (
      ?auto_9966 - HOIST
      ?auto_9963 - PLACE
      ?auto_9962 - PLACE
      ?auto_9961 - HOIST
      ?auto_9964 - SURFACE
      ?auto_9970 - PLACE
      ?auto_9971 - HOIST
      ?auto_9968 - SURFACE
      ?auto_9967 - PLACE
      ?auto_9969 - HOIST
      ?auto_9972 - SURFACE
      ?auto_9965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9966 ?auto_9963 ) ( IS-CRATE ?auto_9960 ) ( not ( = ?auto_9962 ?auto_9963 ) ) ( HOIST-AT ?auto_9961 ?auto_9962 ) ( AVAILABLE ?auto_9961 ) ( SURFACE-AT ?auto_9960 ?auto_9962 ) ( ON ?auto_9960 ?auto_9964 ) ( CLEAR ?auto_9960 ) ( not ( = ?auto_9959 ?auto_9960 ) ) ( not ( = ?auto_9959 ?auto_9964 ) ) ( not ( = ?auto_9960 ?auto_9964 ) ) ( not ( = ?auto_9966 ?auto_9961 ) ) ( IS-CRATE ?auto_9959 ) ( not ( = ?auto_9970 ?auto_9963 ) ) ( HOIST-AT ?auto_9971 ?auto_9970 ) ( AVAILABLE ?auto_9971 ) ( SURFACE-AT ?auto_9959 ?auto_9970 ) ( ON ?auto_9959 ?auto_9968 ) ( CLEAR ?auto_9959 ) ( not ( = ?auto_9958 ?auto_9959 ) ) ( not ( = ?auto_9958 ?auto_9968 ) ) ( not ( = ?auto_9959 ?auto_9968 ) ) ( not ( = ?auto_9966 ?auto_9971 ) ) ( SURFACE-AT ?auto_9957 ?auto_9963 ) ( CLEAR ?auto_9957 ) ( IS-CRATE ?auto_9958 ) ( AVAILABLE ?auto_9966 ) ( not ( = ?auto_9967 ?auto_9963 ) ) ( HOIST-AT ?auto_9969 ?auto_9967 ) ( AVAILABLE ?auto_9969 ) ( SURFACE-AT ?auto_9958 ?auto_9967 ) ( ON ?auto_9958 ?auto_9972 ) ( CLEAR ?auto_9958 ) ( TRUCK-AT ?auto_9965 ?auto_9963 ) ( not ( = ?auto_9957 ?auto_9958 ) ) ( not ( = ?auto_9957 ?auto_9972 ) ) ( not ( = ?auto_9958 ?auto_9972 ) ) ( not ( = ?auto_9966 ?auto_9969 ) ) ( not ( = ?auto_9957 ?auto_9959 ) ) ( not ( = ?auto_9957 ?auto_9968 ) ) ( not ( = ?auto_9959 ?auto_9972 ) ) ( not ( = ?auto_9970 ?auto_9967 ) ) ( not ( = ?auto_9971 ?auto_9969 ) ) ( not ( = ?auto_9968 ?auto_9972 ) ) ( not ( = ?auto_9957 ?auto_9960 ) ) ( not ( = ?auto_9957 ?auto_9964 ) ) ( not ( = ?auto_9958 ?auto_9960 ) ) ( not ( = ?auto_9958 ?auto_9964 ) ) ( not ( = ?auto_9960 ?auto_9968 ) ) ( not ( = ?auto_9960 ?auto_9972 ) ) ( not ( = ?auto_9962 ?auto_9970 ) ) ( not ( = ?auto_9962 ?auto_9967 ) ) ( not ( = ?auto_9961 ?auto_9971 ) ) ( not ( = ?auto_9961 ?auto_9969 ) ) ( not ( = ?auto_9964 ?auto_9968 ) ) ( not ( = ?auto_9964 ?auto_9972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9957 ?auto_9958 ?auto_9959 )
      ( MAKE-1CRATE ?auto_9959 ?auto_9960 )
      ( MAKE-3CRATE-VERIFY ?auto_9957 ?auto_9958 ?auto_9959 ?auto_9960 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9975 - SURFACE
      ?auto_9976 - SURFACE
    )
    :vars
    (
      ?auto_9977 - HOIST
      ?auto_9978 - PLACE
      ?auto_9980 - PLACE
      ?auto_9981 - HOIST
      ?auto_9982 - SURFACE
      ?auto_9979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9977 ?auto_9978 ) ( SURFACE-AT ?auto_9975 ?auto_9978 ) ( CLEAR ?auto_9975 ) ( IS-CRATE ?auto_9976 ) ( AVAILABLE ?auto_9977 ) ( not ( = ?auto_9980 ?auto_9978 ) ) ( HOIST-AT ?auto_9981 ?auto_9980 ) ( AVAILABLE ?auto_9981 ) ( SURFACE-AT ?auto_9976 ?auto_9980 ) ( ON ?auto_9976 ?auto_9982 ) ( CLEAR ?auto_9976 ) ( TRUCK-AT ?auto_9979 ?auto_9978 ) ( not ( = ?auto_9975 ?auto_9976 ) ) ( not ( = ?auto_9975 ?auto_9982 ) ) ( not ( = ?auto_9976 ?auto_9982 ) ) ( not ( = ?auto_9977 ?auto_9981 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9979 ?auto_9978 ?auto_9980 )
      ( !LIFT ?auto_9981 ?auto_9976 ?auto_9982 ?auto_9980 )
      ( !LOAD ?auto_9981 ?auto_9976 ?auto_9979 ?auto_9980 )
      ( !DRIVE ?auto_9979 ?auto_9980 ?auto_9978 )
      ( !UNLOAD ?auto_9977 ?auto_9976 ?auto_9979 ?auto_9978 )
      ( !DROP ?auto_9977 ?auto_9976 ?auto_9975 ?auto_9978 )
      ( MAKE-1CRATE-VERIFY ?auto_9975 ?auto_9976 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9988 - SURFACE
      ?auto_9989 - SURFACE
      ?auto_9990 - SURFACE
      ?auto_9991 - SURFACE
      ?auto_9992 - SURFACE
    )
    :vars
    (
      ?auto_9996 - HOIST
      ?auto_9997 - PLACE
      ?auto_9995 - PLACE
      ?auto_9994 - HOIST
      ?auto_9998 - SURFACE
      ?auto_10007 - PLACE
      ?auto_10003 - HOIST
      ?auto_10002 - SURFACE
      ?auto_10001 - PLACE
      ?auto_9999 - HOIST
      ?auto_10005 - SURFACE
      ?auto_10000 - PLACE
      ?auto_10006 - HOIST
      ?auto_10004 - SURFACE
      ?auto_9993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9996 ?auto_9997 ) ( IS-CRATE ?auto_9992 ) ( not ( = ?auto_9995 ?auto_9997 ) ) ( HOIST-AT ?auto_9994 ?auto_9995 ) ( AVAILABLE ?auto_9994 ) ( SURFACE-AT ?auto_9992 ?auto_9995 ) ( ON ?auto_9992 ?auto_9998 ) ( CLEAR ?auto_9992 ) ( not ( = ?auto_9991 ?auto_9992 ) ) ( not ( = ?auto_9991 ?auto_9998 ) ) ( not ( = ?auto_9992 ?auto_9998 ) ) ( not ( = ?auto_9996 ?auto_9994 ) ) ( IS-CRATE ?auto_9991 ) ( not ( = ?auto_10007 ?auto_9997 ) ) ( HOIST-AT ?auto_10003 ?auto_10007 ) ( AVAILABLE ?auto_10003 ) ( SURFACE-AT ?auto_9991 ?auto_10007 ) ( ON ?auto_9991 ?auto_10002 ) ( CLEAR ?auto_9991 ) ( not ( = ?auto_9990 ?auto_9991 ) ) ( not ( = ?auto_9990 ?auto_10002 ) ) ( not ( = ?auto_9991 ?auto_10002 ) ) ( not ( = ?auto_9996 ?auto_10003 ) ) ( IS-CRATE ?auto_9990 ) ( not ( = ?auto_10001 ?auto_9997 ) ) ( HOIST-AT ?auto_9999 ?auto_10001 ) ( AVAILABLE ?auto_9999 ) ( SURFACE-AT ?auto_9990 ?auto_10001 ) ( ON ?auto_9990 ?auto_10005 ) ( CLEAR ?auto_9990 ) ( not ( = ?auto_9989 ?auto_9990 ) ) ( not ( = ?auto_9989 ?auto_10005 ) ) ( not ( = ?auto_9990 ?auto_10005 ) ) ( not ( = ?auto_9996 ?auto_9999 ) ) ( SURFACE-AT ?auto_9988 ?auto_9997 ) ( CLEAR ?auto_9988 ) ( IS-CRATE ?auto_9989 ) ( AVAILABLE ?auto_9996 ) ( not ( = ?auto_10000 ?auto_9997 ) ) ( HOIST-AT ?auto_10006 ?auto_10000 ) ( AVAILABLE ?auto_10006 ) ( SURFACE-AT ?auto_9989 ?auto_10000 ) ( ON ?auto_9989 ?auto_10004 ) ( CLEAR ?auto_9989 ) ( TRUCK-AT ?auto_9993 ?auto_9997 ) ( not ( = ?auto_9988 ?auto_9989 ) ) ( not ( = ?auto_9988 ?auto_10004 ) ) ( not ( = ?auto_9989 ?auto_10004 ) ) ( not ( = ?auto_9996 ?auto_10006 ) ) ( not ( = ?auto_9988 ?auto_9990 ) ) ( not ( = ?auto_9988 ?auto_10005 ) ) ( not ( = ?auto_9990 ?auto_10004 ) ) ( not ( = ?auto_10001 ?auto_10000 ) ) ( not ( = ?auto_9999 ?auto_10006 ) ) ( not ( = ?auto_10005 ?auto_10004 ) ) ( not ( = ?auto_9988 ?auto_9991 ) ) ( not ( = ?auto_9988 ?auto_10002 ) ) ( not ( = ?auto_9989 ?auto_9991 ) ) ( not ( = ?auto_9989 ?auto_10002 ) ) ( not ( = ?auto_9991 ?auto_10005 ) ) ( not ( = ?auto_9991 ?auto_10004 ) ) ( not ( = ?auto_10007 ?auto_10001 ) ) ( not ( = ?auto_10007 ?auto_10000 ) ) ( not ( = ?auto_10003 ?auto_9999 ) ) ( not ( = ?auto_10003 ?auto_10006 ) ) ( not ( = ?auto_10002 ?auto_10005 ) ) ( not ( = ?auto_10002 ?auto_10004 ) ) ( not ( = ?auto_9988 ?auto_9992 ) ) ( not ( = ?auto_9988 ?auto_9998 ) ) ( not ( = ?auto_9989 ?auto_9992 ) ) ( not ( = ?auto_9989 ?auto_9998 ) ) ( not ( = ?auto_9990 ?auto_9992 ) ) ( not ( = ?auto_9990 ?auto_9998 ) ) ( not ( = ?auto_9992 ?auto_10002 ) ) ( not ( = ?auto_9992 ?auto_10005 ) ) ( not ( = ?auto_9992 ?auto_10004 ) ) ( not ( = ?auto_9995 ?auto_10007 ) ) ( not ( = ?auto_9995 ?auto_10001 ) ) ( not ( = ?auto_9995 ?auto_10000 ) ) ( not ( = ?auto_9994 ?auto_10003 ) ) ( not ( = ?auto_9994 ?auto_9999 ) ) ( not ( = ?auto_9994 ?auto_10006 ) ) ( not ( = ?auto_9998 ?auto_10002 ) ) ( not ( = ?auto_9998 ?auto_10005 ) ) ( not ( = ?auto_9998 ?auto_10004 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9988 ?auto_9989 ?auto_9990 ?auto_9991 )
      ( MAKE-1CRATE ?auto_9991 ?auto_9992 )
      ( MAKE-4CRATE-VERIFY ?auto_9988 ?auto_9989 ?auto_9990 ?auto_9991 ?auto_9992 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10010 - SURFACE
      ?auto_10011 - SURFACE
    )
    :vars
    (
      ?auto_10012 - HOIST
      ?auto_10013 - PLACE
      ?auto_10015 - PLACE
      ?auto_10016 - HOIST
      ?auto_10017 - SURFACE
      ?auto_10014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10012 ?auto_10013 ) ( SURFACE-AT ?auto_10010 ?auto_10013 ) ( CLEAR ?auto_10010 ) ( IS-CRATE ?auto_10011 ) ( AVAILABLE ?auto_10012 ) ( not ( = ?auto_10015 ?auto_10013 ) ) ( HOIST-AT ?auto_10016 ?auto_10015 ) ( AVAILABLE ?auto_10016 ) ( SURFACE-AT ?auto_10011 ?auto_10015 ) ( ON ?auto_10011 ?auto_10017 ) ( CLEAR ?auto_10011 ) ( TRUCK-AT ?auto_10014 ?auto_10013 ) ( not ( = ?auto_10010 ?auto_10011 ) ) ( not ( = ?auto_10010 ?auto_10017 ) ) ( not ( = ?auto_10011 ?auto_10017 ) ) ( not ( = ?auto_10012 ?auto_10016 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10014 ?auto_10013 ?auto_10015 )
      ( !LIFT ?auto_10016 ?auto_10011 ?auto_10017 ?auto_10015 )
      ( !LOAD ?auto_10016 ?auto_10011 ?auto_10014 ?auto_10015 )
      ( !DRIVE ?auto_10014 ?auto_10015 ?auto_10013 )
      ( !UNLOAD ?auto_10012 ?auto_10011 ?auto_10014 ?auto_10013 )
      ( !DROP ?auto_10012 ?auto_10011 ?auto_10010 ?auto_10013 )
      ( MAKE-1CRATE-VERIFY ?auto_10010 ?auto_10011 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_10024 - SURFACE
      ?auto_10025 - SURFACE
      ?auto_10026 - SURFACE
      ?auto_10027 - SURFACE
      ?auto_10028 - SURFACE
      ?auto_10029 - SURFACE
    )
    :vars
    (
      ?auto_10031 - HOIST
      ?auto_10034 - PLACE
      ?auto_10033 - PLACE
      ?auto_10030 - HOIST
      ?auto_10035 - SURFACE
      ?auto_10044 - PLACE
      ?auto_10036 - HOIST
      ?auto_10037 - SURFACE
      ?auto_10038 - PLACE
      ?auto_10043 - HOIST
      ?auto_10040 - SURFACE
      ?auto_10042 - PLACE
      ?auto_10041 - HOIST
      ?auto_10047 - SURFACE
      ?auto_10039 - PLACE
      ?auto_10046 - HOIST
      ?auto_10045 - SURFACE
      ?auto_10032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10031 ?auto_10034 ) ( IS-CRATE ?auto_10029 ) ( not ( = ?auto_10033 ?auto_10034 ) ) ( HOIST-AT ?auto_10030 ?auto_10033 ) ( AVAILABLE ?auto_10030 ) ( SURFACE-AT ?auto_10029 ?auto_10033 ) ( ON ?auto_10029 ?auto_10035 ) ( CLEAR ?auto_10029 ) ( not ( = ?auto_10028 ?auto_10029 ) ) ( not ( = ?auto_10028 ?auto_10035 ) ) ( not ( = ?auto_10029 ?auto_10035 ) ) ( not ( = ?auto_10031 ?auto_10030 ) ) ( IS-CRATE ?auto_10028 ) ( not ( = ?auto_10044 ?auto_10034 ) ) ( HOIST-AT ?auto_10036 ?auto_10044 ) ( AVAILABLE ?auto_10036 ) ( SURFACE-AT ?auto_10028 ?auto_10044 ) ( ON ?auto_10028 ?auto_10037 ) ( CLEAR ?auto_10028 ) ( not ( = ?auto_10027 ?auto_10028 ) ) ( not ( = ?auto_10027 ?auto_10037 ) ) ( not ( = ?auto_10028 ?auto_10037 ) ) ( not ( = ?auto_10031 ?auto_10036 ) ) ( IS-CRATE ?auto_10027 ) ( not ( = ?auto_10038 ?auto_10034 ) ) ( HOIST-AT ?auto_10043 ?auto_10038 ) ( AVAILABLE ?auto_10043 ) ( SURFACE-AT ?auto_10027 ?auto_10038 ) ( ON ?auto_10027 ?auto_10040 ) ( CLEAR ?auto_10027 ) ( not ( = ?auto_10026 ?auto_10027 ) ) ( not ( = ?auto_10026 ?auto_10040 ) ) ( not ( = ?auto_10027 ?auto_10040 ) ) ( not ( = ?auto_10031 ?auto_10043 ) ) ( IS-CRATE ?auto_10026 ) ( not ( = ?auto_10042 ?auto_10034 ) ) ( HOIST-AT ?auto_10041 ?auto_10042 ) ( AVAILABLE ?auto_10041 ) ( SURFACE-AT ?auto_10026 ?auto_10042 ) ( ON ?auto_10026 ?auto_10047 ) ( CLEAR ?auto_10026 ) ( not ( = ?auto_10025 ?auto_10026 ) ) ( not ( = ?auto_10025 ?auto_10047 ) ) ( not ( = ?auto_10026 ?auto_10047 ) ) ( not ( = ?auto_10031 ?auto_10041 ) ) ( SURFACE-AT ?auto_10024 ?auto_10034 ) ( CLEAR ?auto_10024 ) ( IS-CRATE ?auto_10025 ) ( AVAILABLE ?auto_10031 ) ( not ( = ?auto_10039 ?auto_10034 ) ) ( HOIST-AT ?auto_10046 ?auto_10039 ) ( AVAILABLE ?auto_10046 ) ( SURFACE-AT ?auto_10025 ?auto_10039 ) ( ON ?auto_10025 ?auto_10045 ) ( CLEAR ?auto_10025 ) ( TRUCK-AT ?auto_10032 ?auto_10034 ) ( not ( = ?auto_10024 ?auto_10025 ) ) ( not ( = ?auto_10024 ?auto_10045 ) ) ( not ( = ?auto_10025 ?auto_10045 ) ) ( not ( = ?auto_10031 ?auto_10046 ) ) ( not ( = ?auto_10024 ?auto_10026 ) ) ( not ( = ?auto_10024 ?auto_10047 ) ) ( not ( = ?auto_10026 ?auto_10045 ) ) ( not ( = ?auto_10042 ?auto_10039 ) ) ( not ( = ?auto_10041 ?auto_10046 ) ) ( not ( = ?auto_10047 ?auto_10045 ) ) ( not ( = ?auto_10024 ?auto_10027 ) ) ( not ( = ?auto_10024 ?auto_10040 ) ) ( not ( = ?auto_10025 ?auto_10027 ) ) ( not ( = ?auto_10025 ?auto_10040 ) ) ( not ( = ?auto_10027 ?auto_10047 ) ) ( not ( = ?auto_10027 ?auto_10045 ) ) ( not ( = ?auto_10038 ?auto_10042 ) ) ( not ( = ?auto_10038 ?auto_10039 ) ) ( not ( = ?auto_10043 ?auto_10041 ) ) ( not ( = ?auto_10043 ?auto_10046 ) ) ( not ( = ?auto_10040 ?auto_10047 ) ) ( not ( = ?auto_10040 ?auto_10045 ) ) ( not ( = ?auto_10024 ?auto_10028 ) ) ( not ( = ?auto_10024 ?auto_10037 ) ) ( not ( = ?auto_10025 ?auto_10028 ) ) ( not ( = ?auto_10025 ?auto_10037 ) ) ( not ( = ?auto_10026 ?auto_10028 ) ) ( not ( = ?auto_10026 ?auto_10037 ) ) ( not ( = ?auto_10028 ?auto_10040 ) ) ( not ( = ?auto_10028 ?auto_10047 ) ) ( not ( = ?auto_10028 ?auto_10045 ) ) ( not ( = ?auto_10044 ?auto_10038 ) ) ( not ( = ?auto_10044 ?auto_10042 ) ) ( not ( = ?auto_10044 ?auto_10039 ) ) ( not ( = ?auto_10036 ?auto_10043 ) ) ( not ( = ?auto_10036 ?auto_10041 ) ) ( not ( = ?auto_10036 ?auto_10046 ) ) ( not ( = ?auto_10037 ?auto_10040 ) ) ( not ( = ?auto_10037 ?auto_10047 ) ) ( not ( = ?auto_10037 ?auto_10045 ) ) ( not ( = ?auto_10024 ?auto_10029 ) ) ( not ( = ?auto_10024 ?auto_10035 ) ) ( not ( = ?auto_10025 ?auto_10029 ) ) ( not ( = ?auto_10025 ?auto_10035 ) ) ( not ( = ?auto_10026 ?auto_10029 ) ) ( not ( = ?auto_10026 ?auto_10035 ) ) ( not ( = ?auto_10027 ?auto_10029 ) ) ( not ( = ?auto_10027 ?auto_10035 ) ) ( not ( = ?auto_10029 ?auto_10037 ) ) ( not ( = ?auto_10029 ?auto_10040 ) ) ( not ( = ?auto_10029 ?auto_10047 ) ) ( not ( = ?auto_10029 ?auto_10045 ) ) ( not ( = ?auto_10033 ?auto_10044 ) ) ( not ( = ?auto_10033 ?auto_10038 ) ) ( not ( = ?auto_10033 ?auto_10042 ) ) ( not ( = ?auto_10033 ?auto_10039 ) ) ( not ( = ?auto_10030 ?auto_10036 ) ) ( not ( = ?auto_10030 ?auto_10043 ) ) ( not ( = ?auto_10030 ?auto_10041 ) ) ( not ( = ?auto_10030 ?auto_10046 ) ) ( not ( = ?auto_10035 ?auto_10037 ) ) ( not ( = ?auto_10035 ?auto_10040 ) ) ( not ( = ?auto_10035 ?auto_10047 ) ) ( not ( = ?auto_10035 ?auto_10045 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10024 ?auto_10025 ?auto_10026 ?auto_10027 ?auto_10028 )
      ( MAKE-1CRATE ?auto_10028 ?auto_10029 )
      ( MAKE-5CRATE-VERIFY ?auto_10024 ?auto_10025 ?auto_10026 ?auto_10027 ?auto_10028 ?auto_10029 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10050 - SURFACE
      ?auto_10051 - SURFACE
    )
    :vars
    (
      ?auto_10052 - HOIST
      ?auto_10053 - PLACE
      ?auto_10055 - PLACE
      ?auto_10056 - HOIST
      ?auto_10057 - SURFACE
      ?auto_10054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10052 ?auto_10053 ) ( SURFACE-AT ?auto_10050 ?auto_10053 ) ( CLEAR ?auto_10050 ) ( IS-CRATE ?auto_10051 ) ( AVAILABLE ?auto_10052 ) ( not ( = ?auto_10055 ?auto_10053 ) ) ( HOIST-AT ?auto_10056 ?auto_10055 ) ( AVAILABLE ?auto_10056 ) ( SURFACE-AT ?auto_10051 ?auto_10055 ) ( ON ?auto_10051 ?auto_10057 ) ( CLEAR ?auto_10051 ) ( TRUCK-AT ?auto_10054 ?auto_10053 ) ( not ( = ?auto_10050 ?auto_10051 ) ) ( not ( = ?auto_10050 ?auto_10057 ) ) ( not ( = ?auto_10051 ?auto_10057 ) ) ( not ( = ?auto_10052 ?auto_10056 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10054 ?auto_10053 ?auto_10055 )
      ( !LIFT ?auto_10056 ?auto_10051 ?auto_10057 ?auto_10055 )
      ( !LOAD ?auto_10056 ?auto_10051 ?auto_10054 ?auto_10055 )
      ( !DRIVE ?auto_10054 ?auto_10055 ?auto_10053 )
      ( !UNLOAD ?auto_10052 ?auto_10051 ?auto_10054 ?auto_10053 )
      ( !DROP ?auto_10052 ?auto_10051 ?auto_10050 ?auto_10053 )
      ( MAKE-1CRATE-VERIFY ?auto_10050 ?auto_10051 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_10065 - SURFACE
      ?auto_10066 - SURFACE
      ?auto_10067 - SURFACE
      ?auto_10068 - SURFACE
      ?auto_10069 - SURFACE
      ?auto_10070 - SURFACE
      ?auto_10071 - SURFACE
    )
    :vars
    (
      ?auto_10077 - HOIST
      ?auto_10073 - PLACE
      ?auto_10074 - PLACE
      ?auto_10072 - HOIST
      ?auto_10075 - SURFACE
      ?auto_10081 - PLACE
      ?auto_10087 - HOIST
      ?auto_10088 - SURFACE
      ?auto_10092 - PLACE
      ?auto_10089 - HOIST
      ?auto_10090 - SURFACE
      ?auto_10086 - PLACE
      ?auto_10085 - HOIST
      ?auto_10079 - SURFACE
      ?auto_10082 - PLACE
      ?auto_10083 - HOIST
      ?auto_10084 - SURFACE
      ?auto_10080 - PLACE
      ?auto_10078 - HOIST
      ?auto_10091 - SURFACE
      ?auto_10076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10077 ?auto_10073 ) ( IS-CRATE ?auto_10071 ) ( not ( = ?auto_10074 ?auto_10073 ) ) ( HOIST-AT ?auto_10072 ?auto_10074 ) ( AVAILABLE ?auto_10072 ) ( SURFACE-AT ?auto_10071 ?auto_10074 ) ( ON ?auto_10071 ?auto_10075 ) ( CLEAR ?auto_10071 ) ( not ( = ?auto_10070 ?auto_10071 ) ) ( not ( = ?auto_10070 ?auto_10075 ) ) ( not ( = ?auto_10071 ?auto_10075 ) ) ( not ( = ?auto_10077 ?auto_10072 ) ) ( IS-CRATE ?auto_10070 ) ( not ( = ?auto_10081 ?auto_10073 ) ) ( HOIST-AT ?auto_10087 ?auto_10081 ) ( AVAILABLE ?auto_10087 ) ( SURFACE-AT ?auto_10070 ?auto_10081 ) ( ON ?auto_10070 ?auto_10088 ) ( CLEAR ?auto_10070 ) ( not ( = ?auto_10069 ?auto_10070 ) ) ( not ( = ?auto_10069 ?auto_10088 ) ) ( not ( = ?auto_10070 ?auto_10088 ) ) ( not ( = ?auto_10077 ?auto_10087 ) ) ( IS-CRATE ?auto_10069 ) ( not ( = ?auto_10092 ?auto_10073 ) ) ( HOIST-AT ?auto_10089 ?auto_10092 ) ( AVAILABLE ?auto_10089 ) ( SURFACE-AT ?auto_10069 ?auto_10092 ) ( ON ?auto_10069 ?auto_10090 ) ( CLEAR ?auto_10069 ) ( not ( = ?auto_10068 ?auto_10069 ) ) ( not ( = ?auto_10068 ?auto_10090 ) ) ( not ( = ?auto_10069 ?auto_10090 ) ) ( not ( = ?auto_10077 ?auto_10089 ) ) ( IS-CRATE ?auto_10068 ) ( not ( = ?auto_10086 ?auto_10073 ) ) ( HOIST-AT ?auto_10085 ?auto_10086 ) ( AVAILABLE ?auto_10085 ) ( SURFACE-AT ?auto_10068 ?auto_10086 ) ( ON ?auto_10068 ?auto_10079 ) ( CLEAR ?auto_10068 ) ( not ( = ?auto_10067 ?auto_10068 ) ) ( not ( = ?auto_10067 ?auto_10079 ) ) ( not ( = ?auto_10068 ?auto_10079 ) ) ( not ( = ?auto_10077 ?auto_10085 ) ) ( IS-CRATE ?auto_10067 ) ( not ( = ?auto_10082 ?auto_10073 ) ) ( HOIST-AT ?auto_10083 ?auto_10082 ) ( AVAILABLE ?auto_10083 ) ( SURFACE-AT ?auto_10067 ?auto_10082 ) ( ON ?auto_10067 ?auto_10084 ) ( CLEAR ?auto_10067 ) ( not ( = ?auto_10066 ?auto_10067 ) ) ( not ( = ?auto_10066 ?auto_10084 ) ) ( not ( = ?auto_10067 ?auto_10084 ) ) ( not ( = ?auto_10077 ?auto_10083 ) ) ( SURFACE-AT ?auto_10065 ?auto_10073 ) ( CLEAR ?auto_10065 ) ( IS-CRATE ?auto_10066 ) ( AVAILABLE ?auto_10077 ) ( not ( = ?auto_10080 ?auto_10073 ) ) ( HOIST-AT ?auto_10078 ?auto_10080 ) ( AVAILABLE ?auto_10078 ) ( SURFACE-AT ?auto_10066 ?auto_10080 ) ( ON ?auto_10066 ?auto_10091 ) ( CLEAR ?auto_10066 ) ( TRUCK-AT ?auto_10076 ?auto_10073 ) ( not ( = ?auto_10065 ?auto_10066 ) ) ( not ( = ?auto_10065 ?auto_10091 ) ) ( not ( = ?auto_10066 ?auto_10091 ) ) ( not ( = ?auto_10077 ?auto_10078 ) ) ( not ( = ?auto_10065 ?auto_10067 ) ) ( not ( = ?auto_10065 ?auto_10084 ) ) ( not ( = ?auto_10067 ?auto_10091 ) ) ( not ( = ?auto_10082 ?auto_10080 ) ) ( not ( = ?auto_10083 ?auto_10078 ) ) ( not ( = ?auto_10084 ?auto_10091 ) ) ( not ( = ?auto_10065 ?auto_10068 ) ) ( not ( = ?auto_10065 ?auto_10079 ) ) ( not ( = ?auto_10066 ?auto_10068 ) ) ( not ( = ?auto_10066 ?auto_10079 ) ) ( not ( = ?auto_10068 ?auto_10084 ) ) ( not ( = ?auto_10068 ?auto_10091 ) ) ( not ( = ?auto_10086 ?auto_10082 ) ) ( not ( = ?auto_10086 ?auto_10080 ) ) ( not ( = ?auto_10085 ?auto_10083 ) ) ( not ( = ?auto_10085 ?auto_10078 ) ) ( not ( = ?auto_10079 ?auto_10084 ) ) ( not ( = ?auto_10079 ?auto_10091 ) ) ( not ( = ?auto_10065 ?auto_10069 ) ) ( not ( = ?auto_10065 ?auto_10090 ) ) ( not ( = ?auto_10066 ?auto_10069 ) ) ( not ( = ?auto_10066 ?auto_10090 ) ) ( not ( = ?auto_10067 ?auto_10069 ) ) ( not ( = ?auto_10067 ?auto_10090 ) ) ( not ( = ?auto_10069 ?auto_10079 ) ) ( not ( = ?auto_10069 ?auto_10084 ) ) ( not ( = ?auto_10069 ?auto_10091 ) ) ( not ( = ?auto_10092 ?auto_10086 ) ) ( not ( = ?auto_10092 ?auto_10082 ) ) ( not ( = ?auto_10092 ?auto_10080 ) ) ( not ( = ?auto_10089 ?auto_10085 ) ) ( not ( = ?auto_10089 ?auto_10083 ) ) ( not ( = ?auto_10089 ?auto_10078 ) ) ( not ( = ?auto_10090 ?auto_10079 ) ) ( not ( = ?auto_10090 ?auto_10084 ) ) ( not ( = ?auto_10090 ?auto_10091 ) ) ( not ( = ?auto_10065 ?auto_10070 ) ) ( not ( = ?auto_10065 ?auto_10088 ) ) ( not ( = ?auto_10066 ?auto_10070 ) ) ( not ( = ?auto_10066 ?auto_10088 ) ) ( not ( = ?auto_10067 ?auto_10070 ) ) ( not ( = ?auto_10067 ?auto_10088 ) ) ( not ( = ?auto_10068 ?auto_10070 ) ) ( not ( = ?auto_10068 ?auto_10088 ) ) ( not ( = ?auto_10070 ?auto_10090 ) ) ( not ( = ?auto_10070 ?auto_10079 ) ) ( not ( = ?auto_10070 ?auto_10084 ) ) ( not ( = ?auto_10070 ?auto_10091 ) ) ( not ( = ?auto_10081 ?auto_10092 ) ) ( not ( = ?auto_10081 ?auto_10086 ) ) ( not ( = ?auto_10081 ?auto_10082 ) ) ( not ( = ?auto_10081 ?auto_10080 ) ) ( not ( = ?auto_10087 ?auto_10089 ) ) ( not ( = ?auto_10087 ?auto_10085 ) ) ( not ( = ?auto_10087 ?auto_10083 ) ) ( not ( = ?auto_10087 ?auto_10078 ) ) ( not ( = ?auto_10088 ?auto_10090 ) ) ( not ( = ?auto_10088 ?auto_10079 ) ) ( not ( = ?auto_10088 ?auto_10084 ) ) ( not ( = ?auto_10088 ?auto_10091 ) ) ( not ( = ?auto_10065 ?auto_10071 ) ) ( not ( = ?auto_10065 ?auto_10075 ) ) ( not ( = ?auto_10066 ?auto_10071 ) ) ( not ( = ?auto_10066 ?auto_10075 ) ) ( not ( = ?auto_10067 ?auto_10071 ) ) ( not ( = ?auto_10067 ?auto_10075 ) ) ( not ( = ?auto_10068 ?auto_10071 ) ) ( not ( = ?auto_10068 ?auto_10075 ) ) ( not ( = ?auto_10069 ?auto_10071 ) ) ( not ( = ?auto_10069 ?auto_10075 ) ) ( not ( = ?auto_10071 ?auto_10088 ) ) ( not ( = ?auto_10071 ?auto_10090 ) ) ( not ( = ?auto_10071 ?auto_10079 ) ) ( not ( = ?auto_10071 ?auto_10084 ) ) ( not ( = ?auto_10071 ?auto_10091 ) ) ( not ( = ?auto_10074 ?auto_10081 ) ) ( not ( = ?auto_10074 ?auto_10092 ) ) ( not ( = ?auto_10074 ?auto_10086 ) ) ( not ( = ?auto_10074 ?auto_10082 ) ) ( not ( = ?auto_10074 ?auto_10080 ) ) ( not ( = ?auto_10072 ?auto_10087 ) ) ( not ( = ?auto_10072 ?auto_10089 ) ) ( not ( = ?auto_10072 ?auto_10085 ) ) ( not ( = ?auto_10072 ?auto_10083 ) ) ( not ( = ?auto_10072 ?auto_10078 ) ) ( not ( = ?auto_10075 ?auto_10088 ) ) ( not ( = ?auto_10075 ?auto_10090 ) ) ( not ( = ?auto_10075 ?auto_10079 ) ) ( not ( = ?auto_10075 ?auto_10084 ) ) ( not ( = ?auto_10075 ?auto_10091 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_10065 ?auto_10066 ?auto_10067 ?auto_10068 ?auto_10069 ?auto_10070 )
      ( MAKE-1CRATE ?auto_10070 ?auto_10071 )
      ( MAKE-6CRATE-VERIFY ?auto_10065 ?auto_10066 ?auto_10067 ?auto_10068 ?auto_10069 ?auto_10070 ?auto_10071 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10095 - SURFACE
      ?auto_10096 - SURFACE
    )
    :vars
    (
      ?auto_10097 - HOIST
      ?auto_10098 - PLACE
      ?auto_10100 - PLACE
      ?auto_10101 - HOIST
      ?auto_10102 - SURFACE
      ?auto_10099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10097 ?auto_10098 ) ( SURFACE-AT ?auto_10095 ?auto_10098 ) ( CLEAR ?auto_10095 ) ( IS-CRATE ?auto_10096 ) ( AVAILABLE ?auto_10097 ) ( not ( = ?auto_10100 ?auto_10098 ) ) ( HOIST-AT ?auto_10101 ?auto_10100 ) ( AVAILABLE ?auto_10101 ) ( SURFACE-AT ?auto_10096 ?auto_10100 ) ( ON ?auto_10096 ?auto_10102 ) ( CLEAR ?auto_10096 ) ( TRUCK-AT ?auto_10099 ?auto_10098 ) ( not ( = ?auto_10095 ?auto_10096 ) ) ( not ( = ?auto_10095 ?auto_10102 ) ) ( not ( = ?auto_10096 ?auto_10102 ) ) ( not ( = ?auto_10097 ?auto_10101 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10099 ?auto_10098 ?auto_10100 )
      ( !LIFT ?auto_10101 ?auto_10096 ?auto_10102 ?auto_10100 )
      ( !LOAD ?auto_10101 ?auto_10096 ?auto_10099 ?auto_10100 )
      ( !DRIVE ?auto_10099 ?auto_10100 ?auto_10098 )
      ( !UNLOAD ?auto_10097 ?auto_10096 ?auto_10099 ?auto_10098 )
      ( !DROP ?auto_10097 ?auto_10096 ?auto_10095 ?auto_10098 )
      ( MAKE-1CRATE-VERIFY ?auto_10095 ?auto_10096 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_10111 - SURFACE
      ?auto_10112 - SURFACE
      ?auto_10113 - SURFACE
      ?auto_10114 - SURFACE
      ?auto_10115 - SURFACE
      ?auto_10116 - SURFACE
      ?auto_10118 - SURFACE
      ?auto_10117 - SURFACE
    )
    :vars
    (
      ?auto_10120 - HOIST
      ?auto_10121 - PLACE
      ?auto_10119 - PLACE
      ?auto_10122 - HOIST
      ?auto_10124 - SURFACE
      ?auto_10128 - PLACE
      ?auto_10133 - HOIST
      ?auto_10131 - SURFACE
      ?auto_10126 - PLACE
      ?auto_10136 - HOIST
      ?auto_10135 - SURFACE
      ?auto_10132 - PLACE
      ?auto_10137 - HOIST
      ?auto_10138 - SURFACE
      ?auto_10134 - PLACE
      ?auto_10140 - HOIST
      ?auto_10129 - SURFACE
      ?auto_10125 - PLACE
      ?auto_10142 - HOIST
      ?auto_10141 - SURFACE
      ?auto_10130 - PLACE
      ?auto_10127 - HOIST
      ?auto_10139 - SURFACE
      ?auto_10123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10120 ?auto_10121 ) ( IS-CRATE ?auto_10117 ) ( not ( = ?auto_10119 ?auto_10121 ) ) ( HOIST-AT ?auto_10122 ?auto_10119 ) ( AVAILABLE ?auto_10122 ) ( SURFACE-AT ?auto_10117 ?auto_10119 ) ( ON ?auto_10117 ?auto_10124 ) ( CLEAR ?auto_10117 ) ( not ( = ?auto_10118 ?auto_10117 ) ) ( not ( = ?auto_10118 ?auto_10124 ) ) ( not ( = ?auto_10117 ?auto_10124 ) ) ( not ( = ?auto_10120 ?auto_10122 ) ) ( IS-CRATE ?auto_10118 ) ( not ( = ?auto_10128 ?auto_10121 ) ) ( HOIST-AT ?auto_10133 ?auto_10128 ) ( AVAILABLE ?auto_10133 ) ( SURFACE-AT ?auto_10118 ?auto_10128 ) ( ON ?auto_10118 ?auto_10131 ) ( CLEAR ?auto_10118 ) ( not ( = ?auto_10116 ?auto_10118 ) ) ( not ( = ?auto_10116 ?auto_10131 ) ) ( not ( = ?auto_10118 ?auto_10131 ) ) ( not ( = ?auto_10120 ?auto_10133 ) ) ( IS-CRATE ?auto_10116 ) ( not ( = ?auto_10126 ?auto_10121 ) ) ( HOIST-AT ?auto_10136 ?auto_10126 ) ( AVAILABLE ?auto_10136 ) ( SURFACE-AT ?auto_10116 ?auto_10126 ) ( ON ?auto_10116 ?auto_10135 ) ( CLEAR ?auto_10116 ) ( not ( = ?auto_10115 ?auto_10116 ) ) ( not ( = ?auto_10115 ?auto_10135 ) ) ( not ( = ?auto_10116 ?auto_10135 ) ) ( not ( = ?auto_10120 ?auto_10136 ) ) ( IS-CRATE ?auto_10115 ) ( not ( = ?auto_10132 ?auto_10121 ) ) ( HOIST-AT ?auto_10137 ?auto_10132 ) ( AVAILABLE ?auto_10137 ) ( SURFACE-AT ?auto_10115 ?auto_10132 ) ( ON ?auto_10115 ?auto_10138 ) ( CLEAR ?auto_10115 ) ( not ( = ?auto_10114 ?auto_10115 ) ) ( not ( = ?auto_10114 ?auto_10138 ) ) ( not ( = ?auto_10115 ?auto_10138 ) ) ( not ( = ?auto_10120 ?auto_10137 ) ) ( IS-CRATE ?auto_10114 ) ( not ( = ?auto_10134 ?auto_10121 ) ) ( HOIST-AT ?auto_10140 ?auto_10134 ) ( AVAILABLE ?auto_10140 ) ( SURFACE-AT ?auto_10114 ?auto_10134 ) ( ON ?auto_10114 ?auto_10129 ) ( CLEAR ?auto_10114 ) ( not ( = ?auto_10113 ?auto_10114 ) ) ( not ( = ?auto_10113 ?auto_10129 ) ) ( not ( = ?auto_10114 ?auto_10129 ) ) ( not ( = ?auto_10120 ?auto_10140 ) ) ( IS-CRATE ?auto_10113 ) ( not ( = ?auto_10125 ?auto_10121 ) ) ( HOIST-AT ?auto_10142 ?auto_10125 ) ( AVAILABLE ?auto_10142 ) ( SURFACE-AT ?auto_10113 ?auto_10125 ) ( ON ?auto_10113 ?auto_10141 ) ( CLEAR ?auto_10113 ) ( not ( = ?auto_10112 ?auto_10113 ) ) ( not ( = ?auto_10112 ?auto_10141 ) ) ( not ( = ?auto_10113 ?auto_10141 ) ) ( not ( = ?auto_10120 ?auto_10142 ) ) ( SURFACE-AT ?auto_10111 ?auto_10121 ) ( CLEAR ?auto_10111 ) ( IS-CRATE ?auto_10112 ) ( AVAILABLE ?auto_10120 ) ( not ( = ?auto_10130 ?auto_10121 ) ) ( HOIST-AT ?auto_10127 ?auto_10130 ) ( AVAILABLE ?auto_10127 ) ( SURFACE-AT ?auto_10112 ?auto_10130 ) ( ON ?auto_10112 ?auto_10139 ) ( CLEAR ?auto_10112 ) ( TRUCK-AT ?auto_10123 ?auto_10121 ) ( not ( = ?auto_10111 ?auto_10112 ) ) ( not ( = ?auto_10111 ?auto_10139 ) ) ( not ( = ?auto_10112 ?auto_10139 ) ) ( not ( = ?auto_10120 ?auto_10127 ) ) ( not ( = ?auto_10111 ?auto_10113 ) ) ( not ( = ?auto_10111 ?auto_10141 ) ) ( not ( = ?auto_10113 ?auto_10139 ) ) ( not ( = ?auto_10125 ?auto_10130 ) ) ( not ( = ?auto_10142 ?auto_10127 ) ) ( not ( = ?auto_10141 ?auto_10139 ) ) ( not ( = ?auto_10111 ?auto_10114 ) ) ( not ( = ?auto_10111 ?auto_10129 ) ) ( not ( = ?auto_10112 ?auto_10114 ) ) ( not ( = ?auto_10112 ?auto_10129 ) ) ( not ( = ?auto_10114 ?auto_10141 ) ) ( not ( = ?auto_10114 ?auto_10139 ) ) ( not ( = ?auto_10134 ?auto_10125 ) ) ( not ( = ?auto_10134 ?auto_10130 ) ) ( not ( = ?auto_10140 ?auto_10142 ) ) ( not ( = ?auto_10140 ?auto_10127 ) ) ( not ( = ?auto_10129 ?auto_10141 ) ) ( not ( = ?auto_10129 ?auto_10139 ) ) ( not ( = ?auto_10111 ?auto_10115 ) ) ( not ( = ?auto_10111 ?auto_10138 ) ) ( not ( = ?auto_10112 ?auto_10115 ) ) ( not ( = ?auto_10112 ?auto_10138 ) ) ( not ( = ?auto_10113 ?auto_10115 ) ) ( not ( = ?auto_10113 ?auto_10138 ) ) ( not ( = ?auto_10115 ?auto_10129 ) ) ( not ( = ?auto_10115 ?auto_10141 ) ) ( not ( = ?auto_10115 ?auto_10139 ) ) ( not ( = ?auto_10132 ?auto_10134 ) ) ( not ( = ?auto_10132 ?auto_10125 ) ) ( not ( = ?auto_10132 ?auto_10130 ) ) ( not ( = ?auto_10137 ?auto_10140 ) ) ( not ( = ?auto_10137 ?auto_10142 ) ) ( not ( = ?auto_10137 ?auto_10127 ) ) ( not ( = ?auto_10138 ?auto_10129 ) ) ( not ( = ?auto_10138 ?auto_10141 ) ) ( not ( = ?auto_10138 ?auto_10139 ) ) ( not ( = ?auto_10111 ?auto_10116 ) ) ( not ( = ?auto_10111 ?auto_10135 ) ) ( not ( = ?auto_10112 ?auto_10116 ) ) ( not ( = ?auto_10112 ?auto_10135 ) ) ( not ( = ?auto_10113 ?auto_10116 ) ) ( not ( = ?auto_10113 ?auto_10135 ) ) ( not ( = ?auto_10114 ?auto_10116 ) ) ( not ( = ?auto_10114 ?auto_10135 ) ) ( not ( = ?auto_10116 ?auto_10138 ) ) ( not ( = ?auto_10116 ?auto_10129 ) ) ( not ( = ?auto_10116 ?auto_10141 ) ) ( not ( = ?auto_10116 ?auto_10139 ) ) ( not ( = ?auto_10126 ?auto_10132 ) ) ( not ( = ?auto_10126 ?auto_10134 ) ) ( not ( = ?auto_10126 ?auto_10125 ) ) ( not ( = ?auto_10126 ?auto_10130 ) ) ( not ( = ?auto_10136 ?auto_10137 ) ) ( not ( = ?auto_10136 ?auto_10140 ) ) ( not ( = ?auto_10136 ?auto_10142 ) ) ( not ( = ?auto_10136 ?auto_10127 ) ) ( not ( = ?auto_10135 ?auto_10138 ) ) ( not ( = ?auto_10135 ?auto_10129 ) ) ( not ( = ?auto_10135 ?auto_10141 ) ) ( not ( = ?auto_10135 ?auto_10139 ) ) ( not ( = ?auto_10111 ?auto_10118 ) ) ( not ( = ?auto_10111 ?auto_10131 ) ) ( not ( = ?auto_10112 ?auto_10118 ) ) ( not ( = ?auto_10112 ?auto_10131 ) ) ( not ( = ?auto_10113 ?auto_10118 ) ) ( not ( = ?auto_10113 ?auto_10131 ) ) ( not ( = ?auto_10114 ?auto_10118 ) ) ( not ( = ?auto_10114 ?auto_10131 ) ) ( not ( = ?auto_10115 ?auto_10118 ) ) ( not ( = ?auto_10115 ?auto_10131 ) ) ( not ( = ?auto_10118 ?auto_10135 ) ) ( not ( = ?auto_10118 ?auto_10138 ) ) ( not ( = ?auto_10118 ?auto_10129 ) ) ( not ( = ?auto_10118 ?auto_10141 ) ) ( not ( = ?auto_10118 ?auto_10139 ) ) ( not ( = ?auto_10128 ?auto_10126 ) ) ( not ( = ?auto_10128 ?auto_10132 ) ) ( not ( = ?auto_10128 ?auto_10134 ) ) ( not ( = ?auto_10128 ?auto_10125 ) ) ( not ( = ?auto_10128 ?auto_10130 ) ) ( not ( = ?auto_10133 ?auto_10136 ) ) ( not ( = ?auto_10133 ?auto_10137 ) ) ( not ( = ?auto_10133 ?auto_10140 ) ) ( not ( = ?auto_10133 ?auto_10142 ) ) ( not ( = ?auto_10133 ?auto_10127 ) ) ( not ( = ?auto_10131 ?auto_10135 ) ) ( not ( = ?auto_10131 ?auto_10138 ) ) ( not ( = ?auto_10131 ?auto_10129 ) ) ( not ( = ?auto_10131 ?auto_10141 ) ) ( not ( = ?auto_10131 ?auto_10139 ) ) ( not ( = ?auto_10111 ?auto_10117 ) ) ( not ( = ?auto_10111 ?auto_10124 ) ) ( not ( = ?auto_10112 ?auto_10117 ) ) ( not ( = ?auto_10112 ?auto_10124 ) ) ( not ( = ?auto_10113 ?auto_10117 ) ) ( not ( = ?auto_10113 ?auto_10124 ) ) ( not ( = ?auto_10114 ?auto_10117 ) ) ( not ( = ?auto_10114 ?auto_10124 ) ) ( not ( = ?auto_10115 ?auto_10117 ) ) ( not ( = ?auto_10115 ?auto_10124 ) ) ( not ( = ?auto_10116 ?auto_10117 ) ) ( not ( = ?auto_10116 ?auto_10124 ) ) ( not ( = ?auto_10117 ?auto_10131 ) ) ( not ( = ?auto_10117 ?auto_10135 ) ) ( not ( = ?auto_10117 ?auto_10138 ) ) ( not ( = ?auto_10117 ?auto_10129 ) ) ( not ( = ?auto_10117 ?auto_10141 ) ) ( not ( = ?auto_10117 ?auto_10139 ) ) ( not ( = ?auto_10119 ?auto_10128 ) ) ( not ( = ?auto_10119 ?auto_10126 ) ) ( not ( = ?auto_10119 ?auto_10132 ) ) ( not ( = ?auto_10119 ?auto_10134 ) ) ( not ( = ?auto_10119 ?auto_10125 ) ) ( not ( = ?auto_10119 ?auto_10130 ) ) ( not ( = ?auto_10122 ?auto_10133 ) ) ( not ( = ?auto_10122 ?auto_10136 ) ) ( not ( = ?auto_10122 ?auto_10137 ) ) ( not ( = ?auto_10122 ?auto_10140 ) ) ( not ( = ?auto_10122 ?auto_10142 ) ) ( not ( = ?auto_10122 ?auto_10127 ) ) ( not ( = ?auto_10124 ?auto_10131 ) ) ( not ( = ?auto_10124 ?auto_10135 ) ) ( not ( = ?auto_10124 ?auto_10138 ) ) ( not ( = ?auto_10124 ?auto_10129 ) ) ( not ( = ?auto_10124 ?auto_10141 ) ) ( not ( = ?auto_10124 ?auto_10139 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_10111 ?auto_10112 ?auto_10113 ?auto_10114 ?auto_10115 ?auto_10116 ?auto_10118 )
      ( MAKE-1CRATE ?auto_10118 ?auto_10117 )
      ( MAKE-7CRATE-VERIFY ?auto_10111 ?auto_10112 ?auto_10113 ?auto_10114 ?auto_10115 ?auto_10116 ?auto_10118 ?auto_10117 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10145 - SURFACE
      ?auto_10146 - SURFACE
    )
    :vars
    (
      ?auto_10147 - HOIST
      ?auto_10148 - PLACE
      ?auto_10150 - PLACE
      ?auto_10151 - HOIST
      ?auto_10152 - SURFACE
      ?auto_10149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10147 ?auto_10148 ) ( SURFACE-AT ?auto_10145 ?auto_10148 ) ( CLEAR ?auto_10145 ) ( IS-CRATE ?auto_10146 ) ( AVAILABLE ?auto_10147 ) ( not ( = ?auto_10150 ?auto_10148 ) ) ( HOIST-AT ?auto_10151 ?auto_10150 ) ( AVAILABLE ?auto_10151 ) ( SURFACE-AT ?auto_10146 ?auto_10150 ) ( ON ?auto_10146 ?auto_10152 ) ( CLEAR ?auto_10146 ) ( TRUCK-AT ?auto_10149 ?auto_10148 ) ( not ( = ?auto_10145 ?auto_10146 ) ) ( not ( = ?auto_10145 ?auto_10152 ) ) ( not ( = ?auto_10146 ?auto_10152 ) ) ( not ( = ?auto_10147 ?auto_10151 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10149 ?auto_10148 ?auto_10150 )
      ( !LIFT ?auto_10151 ?auto_10146 ?auto_10152 ?auto_10150 )
      ( !LOAD ?auto_10151 ?auto_10146 ?auto_10149 ?auto_10150 )
      ( !DRIVE ?auto_10149 ?auto_10150 ?auto_10148 )
      ( !UNLOAD ?auto_10147 ?auto_10146 ?auto_10149 ?auto_10148 )
      ( !DROP ?auto_10147 ?auto_10146 ?auto_10145 ?auto_10148 )
      ( MAKE-1CRATE-VERIFY ?auto_10145 ?auto_10146 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_10162 - SURFACE
      ?auto_10163 - SURFACE
      ?auto_10164 - SURFACE
      ?auto_10165 - SURFACE
      ?auto_10166 - SURFACE
      ?auto_10167 - SURFACE
      ?auto_10170 - SURFACE
      ?auto_10169 - SURFACE
      ?auto_10168 - SURFACE
    )
    :vars
    (
      ?auto_10174 - HOIST
      ?auto_10176 - PLACE
      ?auto_10173 - PLACE
      ?auto_10171 - HOIST
      ?auto_10172 - SURFACE
      ?auto_10187 - PLACE
      ?auto_10188 - HOIST
      ?auto_10186 - SURFACE
      ?auto_10183 - SURFACE
      ?auto_10195 - PLACE
      ?auto_10179 - HOIST
      ?auto_10177 - SURFACE
      ?auto_10182 - PLACE
      ?auto_10180 - HOIST
      ?auto_10181 - SURFACE
      ?auto_10178 - PLACE
      ?auto_10194 - HOIST
      ?auto_10185 - SURFACE
      ?auto_10193 - PLACE
      ?auto_10191 - HOIST
      ?auto_10192 - SURFACE
      ?auto_10184 - PLACE
      ?auto_10189 - HOIST
      ?auto_10190 - SURFACE
      ?auto_10175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10174 ?auto_10176 ) ( IS-CRATE ?auto_10168 ) ( not ( = ?auto_10173 ?auto_10176 ) ) ( HOIST-AT ?auto_10171 ?auto_10173 ) ( SURFACE-AT ?auto_10168 ?auto_10173 ) ( ON ?auto_10168 ?auto_10172 ) ( CLEAR ?auto_10168 ) ( not ( = ?auto_10169 ?auto_10168 ) ) ( not ( = ?auto_10169 ?auto_10172 ) ) ( not ( = ?auto_10168 ?auto_10172 ) ) ( not ( = ?auto_10174 ?auto_10171 ) ) ( IS-CRATE ?auto_10169 ) ( not ( = ?auto_10187 ?auto_10176 ) ) ( HOIST-AT ?auto_10188 ?auto_10187 ) ( AVAILABLE ?auto_10188 ) ( SURFACE-AT ?auto_10169 ?auto_10187 ) ( ON ?auto_10169 ?auto_10186 ) ( CLEAR ?auto_10169 ) ( not ( = ?auto_10170 ?auto_10169 ) ) ( not ( = ?auto_10170 ?auto_10186 ) ) ( not ( = ?auto_10169 ?auto_10186 ) ) ( not ( = ?auto_10174 ?auto_10188 ) ) ( IS-CRATE ?auto_10170 ) ( AVAILABLE ?auto_10171 ) ( SURFACE-AT ?auto_10170 ?auto_10173 ) ( ON ?auto_10170 ?auto_10183 ) ( CLEAR ?auto_10170 ) ( not ( = ?auto_10167 ?auto_10170 ) ) ( not ( = ?auto_10167 ?auto_10183 ) ) ( not ( = ?auto_10170 ?auto_10183 ) ) ( IS-CRATE ?auto_10167 ) ( not ( = ?auto_10195 ?auto_10176 ) ) ( HOIST-AT ?auto_10179 ?auto_10195 ) ( AVAILABLE ?auto_10179 ) ( SURFACE-AT ?auto_10167 ?auto_10195 ) ( ON ?auto_10167 ?auto_10177 ) ( CLEAR ?auto_10167 ) ( not ( = ?auto_10166 ?auto_10167 ) ) ( not ( = ?auto_10166 ?auto_10177 ) ) ( not ( = ?auto_10167 ?auto_10177 ) ) ( not ( = ?auto_10174 ?auto_10179 ) ) ( IS-CRATE ?auto_10166 ) ( not ( = ?auto_10182 ?auto_10176 ) ) ( HOIST-AT ?auto_10180 ?auto_10182 ) ( AVAILABLE ?auto_10180 ) ( SURFACE-AT ?auto_10166 ?auto_10182 ) ( ON ?auto_10166 ?auto_10181 ) ( CLEAR ?auto_10166 ) ( not ( = ?auto_10165 ?auto_10166 ) ) ( not ( = ?auto_10165 ?auto_10181 ) ) ( not ( = ?auto_10166 ?auto_10181 ) ) ( not ( = ?auto_10174 ?auto_10180 ) ) ( IS-CRATE ?auto_10165 ) ( not ( = ?auto_10178 ?auto_10176 ) ) ( HOIST-AT ?auto_10194 ?auto_10178 ) ( AVAILABLE ?auto_10194 ) ( SURFACE-AT ?auto_10165 ?auto_10178 ) ( ON ?auto_10165 ?auto_10185 ) ( CLEAR ?auto_10165 ) ( not ( = ?auto_10164 ?auto_10165 ) ) ( not ( = ?auto_10164 ?auto_10185 ) ) ( not ( = ?auto_10165 ?auto_10185 ) ) ( not ( = ?auto_10174 ?auto_10194 ) ) ( IS-CRATE ?auto_10164 ) ( not ( = ?auto_10193 ?auto_10176 ) ) ( HOIST-AT ?auto_10191 ?auto_10193 ) ( AVAILABLE ?auto_10191 ) ( SURFACE-AT ?auto_10164 ?auto_10193 ) ( ON ?auto_10164 ?auto_10192 ) ( CLEAR ?auto_10164 ) ( not ( = ?auto_10163 ?auto_10164 ) ) ( not ( = ?auto_10163 ?auto_10192 ) ) ( not ( = ?auto_10164 ?auto_10192 ) ) ( not ( = ?auto_10174 ?auto_10191 ) ) ( SURFACE-AT ?auto_10162 ?auto_10176 ) ( CLEAR ?auto_10162 ) ( IS-CRATE ?auto_10163 ) ( AVAILABLE ?auto_10174 ) ( not ( = ?auto_10184 ?auto_10176 ) ) ( HOIST-AT ?auto_10189 ?auto_10184 ) ( AVAILABLE ?auto_10189 ) ( SURFACE-AT ?auto_10163 ?auto_10184 ) ( ON ?auto_10163 ?auto_10190 ) ( CLEAR ?auto_10163 ) ( TRUCK-AT ?auto_10175 ?auto_10176 ) ( not ( = ?auto_10162 ?auto_10163 ) ) ( not ( = ?auto_10162 ?auto_10190 ) ) ( not ( = ?auto_10163 ?auto_10190 ) ) ( not ( = ?auto_10174 ?auto_10189 ) ) ( not ( = ?auto_10162 ?auto_10164 ) ) ( not ( = ?auto_10162 ?auto_10192 ) ) ( not ( = ?auto_10164 ?auto_10190 ) ) ( not ( = ?auto_10193 ?auto_10184 ) ) ( not ( = ?auto_10191 ?auto_10189 ) ) ( not ( = ?auto_10192 ?auto_10190 ) ) ( not ( = ?auto_10162 ?auto_10165 ) ) ( not ( = ?auto_10162 ?auto_10185 ) ) ( not ( = ?auto_10163 ?auto_10165 ) ) ( not ( = ?auto_10163 ?auto_10185 ) ) ( not ( = ?auto_10165 ?auto_10192 ) ) ( not ( = ?auto_10165 ?auto_10190 ) ) ( not ( = ?auto_10178 ?auto_10193 ) ) ( not ( = ?auto_10178 ?auto_10184 ) ) ( not ( = ?auto_10194 ?auto_10191 ) ) ( not ( = ?auto_10194 ?auto_10189 ) ) ( not ( = ?auto_10185 ?auto_10192 ) ) ( not ( = ?auto_10185 ?auto_10190 ) ) ( not ( = ?auto_10162 ?auto_10166 ) ) ( not ( = ?auto_10162 ?auto_10181 ) ) ( not ( = ?auto_10163 ?auto_10166 ) ) ( not ( = ?auto_10163 ?auto_10181 ) ) ( not ( = ?auto_10164 ?auto_10166 ) ) ( not ( = ?auto_10164 ?auto_10181 ) ) ( not ( = ?auto_10166 ?auto_10185 ) ) ( not ( = ?auto_10166 ?auto_10192 ) ) ( not ( = ?auto_10166 ?auto_10190 ) ) ( not ( = ?auto_10182 ?auto_10178 ) ) ( not ( = ?auto_10182 ?auto_10193 ) ) ( not ( = ?auto_10182 ?auto_10184 ) ) ( not ( = ?auto_10180 ?auto_10194 ) ) ( not ( = ?auto_10180 ?auto_10191 ) ) ( not ( = ?auto_10180 ?auto_10189 ) ) ( not ( = ?auto_10181 ?auto_10185 ) ) ( not ( = ?auto_10181 ?auto_10192 ) ) ( not ( = ?auto_10181 ?auto_10190 ) ) ( not ( = ?auto_10162 ?auto_10167 ) ) ( not ( = ?auto_10162 ?auto_10177 ) ) ( not ( = ?auto_10163 ?auto_10167 ) ) ( not ( = ?auto_10163 ?auto_10177 ) ) ( not ( = ?auto_10164 ?auto_10167 ) ) ( not ( = ?auto_10164 ?auto_10177 ) ) ( not ( = ?auto_10165 ?auto_10167 ) ) ( not ( = ?auto_10165 ?auto_10177 ) ) ( not ( = ?auto_10167 ?auto_10181 ) ) ( not ( = ?auto_10167 ?auto_10185 ) ) ( not ( = ?auto_10167 ?auto_10192 ) ) ( not ( = ?auto_10167 ?auto_10190 ) ) ( not ( = ?auto_10195 ?auto_10182 ) ) ( not ( = ?auto_10195 ?auto_10178 ) ) ( not ( = ?auto_10195 ?auto_10193 ) ) ( not ( = ?auto_10195 ?auto_10184 ) ) ( not ( = ?auto_10179 ?auto_10180 ) ) ( not ( = ?auto_10179 ?auto_10194 ) ) ( not ( = ?auto_10179 ?auto_10191 ) ) ( not ( = ?auto_10179 ?auto_10189 ) ) ( not ( = ?auto_10177 ?auto_10181 ) ) ( not ( = ?auto_10177 ?auto_10185 ) ) ( not ( = ?auto_10177 ?auto_10192 ) ) ( not ( = ?auto_10177 ?auto_10190 ) ) ( not ( = ?auto_10162 ?auto_10170 ) ) ( not ( = ?auto_10162 ?auto_10183 ) ) ( not ( = ?auto_10163 ?auto_10170 ) ) ( not ( = ?auto_10163 ?auto_10183 ) ) ( not ( = ?auto_10164 ?auto_10170 ) ) ( not ( = ?auto_10164 ?auto_10183 ) ) ( not ( = ?auto_10165 ?auto_10170 ) ) ( not ( = ?auto_10165 ?auto_10183 ) ) ( not ( = ?auto_10166 ?auto_10170 ) ) ( not ( = ?auto_10166 ?auto_10183 ) ) ( not ( = ?auto_10170 ?auto_10177 ) ) ( not ( = ?auto_10170 ?auto_10181 ) ) ( not ( = ?auto_10170 ?auto_10185 ) ) ( not ( = ?auto_10170 ?auto_10192 ) ) ( not ( = ?auto_10170 ?auto_10190 ) ) ( not ( = ?auto_10173 ?auto_10195 ) ) ( not ( = ?auto_10173 ?auto_10182 ) ) ( not ( = ?auto_10173 ?auto_10178 ) ) ( not ( = ?auto_10173 ?auto_10193 ) ) ( not ( = ?auto_10173 ?auto_10184 ) ) ( not ( = ?auto_10171 ?auto_10179 ) ) ( not ( = ?auto_10171 ?auto_10180 ) ) ( not ( = ?auto_10171 ?auto_10194 ) ) ( not ( = ?auto_10171 ?auto_10191 ) ) ( not ( = ?auto_10171 ?auto_10189 ) ) ( not ( = ?auto_10183 ?auto_10177 ) ) ( not ( = ?auto_10183 ?auto_10181 ) ) ( not ( = ?auto_10183 ?auto_10185 ) ) ( not ( = ?auto_10183 ?auto_10192 ) ) ( not ( = ?auto_10183 ?auto_10190 ) ) ( not ( = ?auto_10162 ?auto_10169 ) ) ( not ( = ?auto_10162 ?auto_10186 ) ) ( not ( = ?auto_10163 ?auto_10169 ) ) ( not ( = ?auto_10163 ?auto_10186 ) ) ( not ( = ?auto_10164 ?auto_10169 ) ) ( not ( = ?auto_10164 ?auto_10186 ) ) ( not ( = ?auto_10165 ?auto_10169 ) ) ( not ( = ?auto_10165 ?auto_10186 ) ) ( not ( = ?auto_10166 ?auto_10169 ) ) ( not ( = ?auto_10166 ?auto_10186 ) ) ( not ( = ?auto_10167 ?auto_10169 ) ) ( not ( = ?auto_10167 ?auto_10186 ) ) ( not ( = ?auto_10169 ?auto_10183 ) ) ( not ( = ?auto_10169 ?auto_10177 ) ) ( not ( = ?auto_10169 ?auto_10181 ) ) ( not ( = ?auto_10169 ?auto_10185 ) ) ( not ( = ?auto_10169 ?auto_10192 ) ) ( not ( = ?auto_10169 ?auto_10190 ) ) ( not ( = ?auto_10187 ?auto_10173 ) ) ( not ( = ?auto_10187 ?auto_10195 ) ) ( not ( = ?auto_10187 ?auto_10182 ) ) ( not ( = ?auto_10187 ?auto_10178 ) ) ( not ( = ?auto_10187 ?auto_10193 ) ) ( not ( = ?auto_10187 ?auto_10184 ) ) ( not ( = ?auto_10188 ?auto_10171 ) ) ( not ( = ?auto_10188 ?auto_10179 ) ) ( not ( = ?auto_10188 ?auto_10180 ) ) ( not ( = ?auto_10188 ?auto_10194 ) ) ( not ( = ?auto_10188 ?auto_10191 ) ) ( not ( = ?auto_10188 ?auto_10189 ) ) ( not ( = ?auto_10186 ?auto_10183 ) ) ( not ( = ?auto_10186 ?auto_10177 ) ) ( not ( = ?auto_10186 ?auto_10181 ) ) ( not ( = ?auto_10186 ?auto_10185 ) ) ( not ( = ?auto_10186 ?auto_10192 ) ) ( not ( = ?auto_10186 ?auto_10190 ) ) ( not ( = ?auto_10162 ?auto_10168 ) ) ( not ( = ?auto_10162 ?auto_10172 ) ) ( not ( = ?auto_10163 ?auto_10168 ) ) ( not ( = ?auto_10163 ?auto_10172 ) ) ( not ( = ?auto_10164 ?auto_10168 ) ) ( not ( = ?auto_10164 ?auto_10172 ) ) ( not ( = ?auto_10165 ?auto_10168 ) ) ( not ( = ?auto_10165 ?auto_10172 ) ) ( not ( = ?auto_10166 ?auto_10168 ) ) ( not ( = ?auto_10166 ?auto_10172 ) ) ( not ( = ?auto_10167 ?auto_10168 ) ) ( not ( = ?auto_10167 ?auto_10172 ) ) ( not ( = ?auto_10170 ?auto_10168 ) ) ( not ( = ?auto_10170 ?auto_10172 ) ) ( not ( = ?auto_10168 ?auto_10186 ) ) ( not ( = ?auto_10168 ?auto_10183 ) ) ( not ( = ?auto_10168 ?auto_10177 ) ) ( not ( = ?auto_10168 ?auto_10181 ) ) ( not ( = ?auto_10168 ?auto_10185 ) ) ( not ( = ?auto_10168 ?auto_10192 ) ) ( not ( = ?auto_10168 ?auto_10190 ) ) ( not ( = ?auto_10172 ?auto_10186 ) ) ( not ( = ?auto_10172 ?auto_10183 ) ) ( not ( = ?auto_10172 ?auto_10177 ) ) ( not ( = ?auto_10172 ?auto_10181 ) ) ( not ( = ?auto_10172 ?auto_10185 ) ) ( not ( = ?auto_10172 ?auto_10192 ) ) ( not ( = ?auto_10172 ?auto_10190 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_10162 ?auto_10163 ?auto_10164 ?auto_10165 ?auto_10166 ?auto_10167 ?auto_10170 ?auto_10169 )
      ( MAKE-1CRATE ?auto_10169 ?auto_10168 )
      ( MAKE-8CRATE-VERIFY ?auto_10162 ?auto_10163 ?auto_10164 ?auto_10165 ?auto_10166 ?auto_10167 ?auto_10170 ?auto_10169 ?auto_10168 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10198 - SURFACE
      ?auto_10199 - SURFACE
    )
    :vars
    (
      ?auto_10200 - HOIST
      ?auto_10201 - PLACE
      ?auto_10203 - PLACE
      ?auto_10204 - HOIST
      ?auto_10205 - SURFACE
      ?auto_10202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10200 ?auto_10201 ) ( SURFACE-AT ?auto_10198 ?auto_10201 ) ( CLEAR ?auto_10198 ) ( IS-CRATE ?auto_10199 ) ( AVAILABLE ?auto_10200 ) ( not ( = ?auto_10203 ?auto_10201 ) ) ( HOIST-AT ?auto_10204 ?auto_10203 ) ( AVAILABLE ?auto_10204 ) ( SURFACE-AT ?auto_10199 ?auto_10203 ) ( ON ?auto_10199 ?auto_10205 ) ( CLEAR ?auto_10199 ) ( TRUCK-AT ?auto_10202 ?auto_10201 ) ( not ( = ?auto_10198 ?auto_10199 ) ) ( not ( = ?auto_10198 ?auto_10205 ) ) ( not ( = ?auto_10199 ?auto_10205 ) ) ( not ( = ?auto_10200 ?auto_10204 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10202 ?auto_10201 ?auto_10203 )
      ( !LIFT ?auto_10204 ?auto_10199 ?auto_10205 ?auto_10203 )
      ( !LOAD ?auto_10204 ?auto_10199 ?auto_10202 ?auto_10203 )
      ( !DRIVE ?auto_10202 ?auto_10203 ?auto_10201 )
      ( !UNLOAD ?auto_10200 ?auto_10199 ?auto_10202 ?auto_10201 )
      ( !DROP ?auto_10200 ?auto_10199 ?auto_10198 ?auto_10201 )
      ( MAKE-1CRATE-VERIFY ?auto_10198 ?auto_10199 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_10216 - SURFACE
      ?auto_10217 - SURFACE
      ?auto_10218 - SURFACE
      ?auto_10219 - SURFACE
      ?auto_10220 - SURFACE
      ?auto_10221 - SURFACE
      ?auto_10224 - SURFACE
      ?auto_10223 - SURFACE
      ?auto_10222 - SURFACE
      ?auto_10225 - SURFACE
    )
    :vars
    (
      ?auto_10227 - HOIST
      ?auto_10231 - PLACE
      ?auto_10228 - PLACE
      ?auto_10230 - HOIST
      ?auto_10226 - SURFACE
      ?auto_10242 - PLACE
      ?auto_10240 - HOIST
      ?auto_10245 - SURFACE
      ?auto_10252 - PLACE
      ?auto_10233 - HOIST
      ?auto_10253 - SURFACE
      ?auto_10237 - SURFACE
      ?auto_10249 - PLACE
      ?auto_10243 - HOIST
      ?auto_10247 - SURFACE
      ?auto_10238 - PLACE
      ?auto_10244 - HOIST
      ?auto_10239 - SURFACE
      ?auto_10232 - PLACE
      ?auto_10246 - HOIST
      ?auto_10251 - SURFACE
      ?auto_10248 - PLACE
      ?auto_10241 - HOIST
      ?auto_10250 - SURFACE
      ?auto_10236 - PLACE
      ?auto_10234 - HOIST
      ?auto_10235 - SURFACE
      ?auto_10229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10227 ?auto_10231 ) ( IS-CRATE ?auto_10225 ) ( not ( = ?auto_10228 ?auto_10231 ) ) ( HOIST-AT ?auto_10230 ?auto_10228 ) ( AVAILABLE ?auto_10230 ) ( SURFACE-AT ?auto_10225 ?auto_10228 ) ( ON ?auto_10225 ?auto_10226 ) ( CLEAR ?auto_10225 ) ( not ( = ?auto_10222 ?auto_10225 ) ) ( not ( = ?auto_10222 ?auto_10226 ) ) ( not ( = ?auto_10225 ?auto_10226 ) ) ( not ( = ?auto_10227 ?auto_10230 ) ) ( IS-CRATE ?auto_10222 ) ( not ( = ?auto_10242 ?auto_10231 ) ) ( HOIST-AT ?auto_10240 ?auto_10242 ) ( SURFACE-AT ?auto_10222 ?auto_10242 ) ( ON ?auto_10222 ?auto_10245 ) ( CLEAR ?auto_10222 ) ( not ( = ?auto_10223 ?auto_10222 ) ) ( not ( = ?auto_10223 ?auto_10245 ) ) ( not ( = ?auto_10222 ?auto_10245 ) ) ( not ( = ?auto_10227 ?auto_10240 ) ) ( IS-CRATE ?auto_10223 ) ( not ( = ?auto_10252 ?auto_10231 ) ) ( HOIST-AT ?auto_10233 ?auto_10252 ) ( AVAILABLE ?auto_10233 ) ( SURFACE-AT ?auto_10223 ?auto_10252 ) ( ON ?auto_10223 ?auto_10253 ) ( CLEAR ?auto_10223 ) ( not ( = ?auto_10224 ?auto_10223 ) ) ( not ( = ?auto_10224 ?auto_10253 ) ) ( not ( = ?auto_10223 ?auto_10253 ) ) ( not ( = ?auto_10227 ?auto_10233 ) ) ( IS-CRATE ?auto_10224 ) ( AVAILABLE ?auto_10240 ) ( SURFACE-AT ?auto_10224 ?auto_10242 ) ( ON ?auto_10224 ?auto_10237 ) ( CLEAR ?auto_10224 ) ( not ( = ?auto_10221 ?auto_10224 ) ) ( not ( = ?auto_10221 ?auto_10237 ) ) ( not ( = ?auto_10224 ?auto_10237 ) ) ( IS-CRATE ?auto_10221 ) ( not ( = ?auto_10249 ?auto_10231 ) ) ( HOIST-AT ?auto_10243 ?auto_10249 ) ( AVAILABLE ?auto_10243 ) ( SURFACE-AT ?auto_10221 ?auto_10249 ) ( ON ?auto_10221 ?auto_10247 ) ( CLEAR ?auto_10221 ) ( not ( = ?auto_10220 ?auto_10221 ) ) ( not ( = ?auto_10220 ?auto_10247 ) ) ( not ( = ?auto_10221 ?auto_10247 ) ) ( not ( = ?auto_10227 ?auto_10243 ) ) ( IS-CRATE ?auto_10220 ) ( not ( = ?auto_10238 ?auto_10231 ) ) ( HOIST-AT ?auto_10244 ?auto_10238 ) ( AVAILABLE ?auto_10244 ) ( SURFACE-AT ?auto_10220 ?auto_10238 ) ( ON ?auto_10220 ?auto_10239 ) ( CLEAR ?auto_10220 ) ( not ( = ?auto_10219 ?auto_10220 ) ) ( not ( = ?auto_10219 ?auto_10239 ) ) ( not ( = ?auto_10220 ?auto_10239 ) ) ( not ( = ?auto_10227 ?auto_10244 ) ) ( IS-CRATE ?auto_10219 ) ( not ( = ?auto_10232 ?auto_10231 ) ) ( HOIST-AT ?auto_10246 ?auto_10232 ) ( AVAILABLE ?auto_10246 ) ( SURFACE-AT ?auto_10219 ?auto_10232 ) ( ON ?auto_10219 ?auto_10251 ) ( CLEAR ?auto_10219 ) ( not ( = ?auto_10218 ?auto_10219 ) ) ( not ( = ?auto_10218 ?auto_10251 ) ) ( not ( = ?auto_10219 ?auto_10251 ) ) ( not ( = ?auto_10227 ?auto_10246 ) ) ( IS-CRATE ?auto_10218 ) ( not ( = ?auto_10248 ?auto_10231 ) ) ( HOIST-AT ?auto_10241 ?auto_10248 ) ( AVAILABLE ?auto_10241 ) ( SURFACE-AT ?auto_10218 ?auto_10248 ) ( ON ?auto_10218 ?auto_10250 ) ( CLEAR ?auto_10218 ) ( not ( = ?auto_10217 ?auto_10218 ) ) ( not ( = ?auto_10217 ?auto_10250 ) ) ( not ( = ?auto_10218 ?auto_10250 ) ) ( not ( = ?auto_10227 ?auto_10241 ) ) ( SURFACE-AT ?auto_10216 ?auto_10231 ) ( CLEAR ?auto_10216 ) ( IS-CRATE ?auto_10217 ) ( AVAILABLE ?auto_10227 ) ( not ( = ?auto_10236 ?auto_10231 ) ) ( HOIST-AT ?auto_10234 ?auto_10236 ) ( AVAILABLE ?auto_10234 ) ( SURFACE-AT ?auto_10217 ?auto_10236 ) ( ON ?auto_10217 ?auto_10235 ) ( CLEAR ?auto_10217 ) ( TRUCK-AT ?auto_10229 ?auto_10231 ) ( not ( = ?auto_10216 ?auto_10217 ) ) ( not ( = ?auto_10216 ?auto_10235 ) ) ( not ( = ?auto_10217 ?auto_10235 ) ) ( not ( = ?auto_10227 ?auto_10234 ) ) ( not ( = ?auto_10216 ?auto_10218 ) ) ( not ( = ?auto_10216 ?auto_10250 ) ) ( not ( = ?auto_10218 ?auto_10235 ) ) ( not ( = ?auto_10248 ?auto_10236 ) ) ( not ( = ?auto_10241 ?auto_10234 ) ) ( not ( = ?auto_10250 ?auto_10235 ) ) ( not ( = ?auto_10216 ?auto_10219 ) ) ( not ( = ?auto_10216 ?auto_10251 ) ) ( not ( = ?auto_10217 ?auto_10219 ) ) ( not ( = ?auto_10217 ?auto_10251 ) ) ( not ( = ?auto_10219 ?auto_10250 ) ) ( not ( = ?auto_10219 ?auto_10235 ) ) ( not ( = ?auto_10232 ?auto_10248 ) ) ( not ( = ?auto_10232 ?auto_10236 ) ) ( not ( = ?auto_10246 ?auto_10241 ) ) ( not ( = ?auto_10246 ?auto_10234 ) ) ( not ( = ?auto_10251 ?auto_10250 ) ) ( not ( = ?auto_10251 ?auto_10235 ) ) ( not ( = ?auto_10216 ?auto_10220 ) ) ( not ( = ?auto_10216 ?auto_10239 ) ) ( not ( = ?auto_10217 ?auto_10220 ) ) ( not ( = ?auto_10217 ?auto_10239 ) ) ( not ( = ?auto_10218 ?auto_10220 ) ) ( not ( = ?auto_10218 ?auto_10239 ) ) ( not ( = ?auto_10220 ?auto_10251 ) ) ( not ( = ?auto_10220 ?auto_10250 ) ) ( not ( = ?auto_10220 ?auto_10235 ) ) ( not ( = ?auto_10238 ?auto_10232 ) ) ( not ( = ?auto_10238 ?auto_10248 ) ) ( not ( = ?auto_10238 ?auto_10236 ) ) ( not ( = ?auto_10244 ?auto_10246 ) ) ( not ( = ?auto_10244 ?auto_10241 ) ) ( not ( = ?auto_10244 ?auto_10234 ) ) ( not ( = ?auto_10239 ?auto_10251 ) ) ( not ( = ?auto_10239 ?auto_10250 ) ) ( not ( = ?auto_10239 ?auto_10235 ) ) ( not ( = ?auto_10216 ?auto_10221 ) ) ( not ( = ?auto_10216 ?auto_10247 ) ) ( not ( = ?auto_10217 ?auto_10221 ) ) ( not ( = ?auto_10217 ?auto_10247 ) ) ( not ( = ?auto_10218 ?auto_10221 ) ) ( not ( = ?auto_10218 ?auto_10247 ) ) ( not ( = ?auto_10219 ?auto_10221 ) ) ( not ( = ?auto_10219 ?auto_10247 ) ) ( not ( = ?auto_10221 ?auto_10239 ) ) ( not ( = ?auto_10221 ?auto_10251 ) ) ( not ( = ?auto_10221 ?auto_10250 ) ) ( not ( = ?auto_10221 ?auto_10235 ) ) ( not ( = ?auto_10249 ?auto_10238 ) ) ( not ( = ?auto_10249 ?auto_10232 ) ) ( not ( = ?auto_10249 ?auto_10248 ) ) ( not ( = ?auto_10249 ?auto_10236 ) ) ( not ( = ?auto_10243 ?auto_10244 ) ) ( not ( = ?auto_10243 ?auto_10246 ) ) ( not ( = ?auto_10243 ?auto_10241 ) ) ( not ( = ?auto_10243 ?auto_10234 ) ) ( not ( = ?auto_10247 ?auto_10239 ) ) ( not ( = ?auto_10247 ?auto_10251 ) ) ( not ( = ?auto_10247 ?auto_10250 ) ) ( not ( = ?auto_10247 ?auto_10235 ) ) ( not ( = ?auto_10216 ?auto_10224 ) ) ( not ( = ?auto_10216 ?auto_10237 ) ) ( not ( = ?auto_10217 ?auto_10224 ) ) ( not ( = ?auto_10217 ?auto_10237 ) ) ( not ( = ?auto_10218 ?auto_10224 ) ) ( not ( = ?auto_10218 ?auto_10237 ) ) ( not ( = ?auto_10219 ?auto_10224 ) ) ( not ( = ?auto_10219 ?auto_10237 ) ) ( not ( = ?auto_10220 ?auto_10224 ) ) ( not ( = ?auto_10220 ?auto_10237 ) ) ( not ( = ?auto_10224 ?auto_10247 ) ) ( not ( = ?auto_10224 ?auto_10239 ) ) ( not ( = ?auto_10224 ?auto_10251 ) ) ( not ( = ?auto_10224 ?auto_10250 ) ) ( not ( = ?auto_10224 ?auto_10235 ) ) ( not ( = ?auto_10242 ?auto_10249 ) ) ( not ( = ?auto_10242 ?auto_10238 ) ) ( not ( = ?auto_10242 ?auto_10232 ) ) ( not ( = ?auto_10242 ?auto_10248 ) ) ( not ( = ?auto_10242 ?auto_10236 ) ) ( not ( = ?auto_10240 ?auto_10243 ) ) ( not ( = ?auto_10240 ?auto_10244 ) ) ( not ( = ?auto_10240 ?auto_10246 ) ) ( not ( = ?auto_10240 ?auto_10241 ) ) ( not ( = ?auto_10240 ?auto_10234 ) ) ( not ( = ?auto_10237 ?auto_10247 ) ) ( not ( = ?auto_10237 ?auto_10239 ) ) ( not ( = ?auto_10237 ?auto_10251 ) ) ( not ( = ?auto_10237 ?auto_10250 ) ) ( not ( = ?auto_10237 ?auto_10235 ) ) ( not ( = ?auto_10216 ?auto_10223 ) ) ( not ( = ?auto_10216 ?auto_10253 ) ) ( not ( = ?auto_10217 ?auto_10223 ) ) ( not ( = ?auto_10217 ?auto_10253 ) ) ( not ( = ?auto_10218 ?auto_10223 ) ) ( not ( = ?auto_10218 ?auto_10253 ) ) ( not ( = ?auto_10219 ?auto_10223 ) ) ( not ( = ?auto_10219 ?auto_10253 ) ) ( not ( = ?auto_10220 ?auto_10223 ) ) ( not ( = ?auto_10220 ?auto_10253 ) ) ( not ( = ?auto_10221 ?auto_10223 ) ) ( not ( = ?auto_10221 ?auto_10253 ) ) ( not ( = ?auto_10223 ?auto_10237 ) ) ( not ( = ?auto_10223 ?auto_10247 ) ) ( not ( = ?auto_10223 ?auto_10239 ) ) ( not ( = ?auto_10223 ?auto_10251 ) ) ( not ( = ?auto_10223 ?auto_10250 ) ) ( not ( = ?auto_10223 ?auto_10235 ) ) ( not ( = ?auto_10252 ?auto_10242 ) ) ( not ( = ?auto_10252 ?auto_10249 ) ) ( not ( = ?auto_10252 ?auto_10238 ) ) ( not ( = ?auto_10252 ?auto_10232 ) ) ( not ( = ?auto_10252 ?auto_10248 ) ) ( not ( = ?auto_10252 ?auto_10236 ) ) ( not ( = ?auto_10233 ?auto_10240 ) ) ( not ( = ?auto_10233 ?auto_10243 ) ) ( not ( = ?auto_10233 ?auto_10244 ) ) ( not ( = ?auto_10233 ?auto_10246 ) ) ( not ( = ?auto_10233 ?auto_10241 ) ) ( not ( = ?auto_10233 ?auto_10234 ) ) ( not ( = ?auto_10253 ?auto_10237 ) ) ( not ( = ?auto_10253 ?auto_10247 ) ) ( not ( = ?auto_10253 ?auto_10239 ) ) ( not ( = ?auto_10253 ?auto_10251 ) ) ( not ( = ?auto_10253 ?auto_10250 ) ) ( not ( = ?auto_10253 ?auto_10235 ) ) ( not ( = ?auto_10216 ?auto_10222 ) ) ( not ( = ?auto_10216 ?auto_10245 ) ) ( not ( = ?auto_10217 ?auto_10222 ) ) ( not ( = ?auto_10217 ?auto_10245 ) ) ( not ( = ?auto_10218 ?auto_10222 ) ) ( not ( = ?auto_10218 ?auto_10245 ) ) ( not ( = ?auto_10219 ?auto_10222 ) ) ( not ( = ?auto_10219 ?auto_10245 ) ) ( not ( = ?auto_10220 ?auto_10222 ) ) ( not ( = ?auto_10220 ?auto_10245 ) ) ( not ( = ?auto_10221 ?auto_10222 ) ) ( not ( = ?auto_10221 ?auto_10245 ) ) ( not ( = ?auto_10224 ?auto_10222 ) ) ( not ( = ?auto_10224 ?auto_10245 ) ) ( not ( = ?auto_10222 ?auto_10253 ) ) ( not ( = ?auto_10222 ?auto_10237 ) ) ( not ( = ?auto_10222 ?auto_10247 ) ) ( not ( = ?auto_10222 ?auto_10239 ) ) ( not ( = ?auto_10222 ?auto_10251 ) ) ( not ( = ?auto_10222 ?auto_10250 ) ) ( not ( = ?auto_10222 ?auto_10235 ) ) ( not ( = ?auto_10245 ?auto_10253 ) ) ( not ( = ?auto_10245 ?auto_10237 ) ) ( not ( = ?auto_10245 ?auto_10247 ) ) ( not ( = ?auto_10245 ?auto_10239 ) ) ( not ( = ?auto_10245 ?auto_10251 ) ) ( not ( = ?auto_10245 ?auto_10250 ) ) ( not ( = ?auto_10245 ?auto_10235 ) ) ( not ( = ?auto_10216 ?auto_10225 ) ) ( not ( = ?auto_10216 ?auto_10226 ) ) ( not ( = ?auto_10217 ?auto_10225 ) ) ( not ( = ?auto_10217 ?auto_10226 ) ) ( not ( = ?auto_10218 ?auto_10225 ) ) ( not ( = ?auto_10218 ?auto_10226 ) ) ( not ( = ?auto_10219 ?auto_10225 ) ) ( not ( = ?auto_10219 ?auto_10226 ) ) ( not ( = ?auto_10220 ?auto_10225 ) ) ( not ( = ?auto_10220 ?auto_10226 ) ) ( not ( = ?auto_10221 ?auto_10225 ) ) ( not ( = ?auto_10221 ?auto_10226 ) ) ( not ( = ?auto_10224 ?auto_10225 ) ) ( not ( = ?auto_10224 ?auto_10226 ) ) ( not ( = ?auto_10223 ?auto_10225 ) ) ( not ( = ?auto_10223 ?auto_10226 ) ) ( not ( = ?auto_10225 ?auto_10245 ) ) ( not ( = ?auto_10225 ?auto_10253 ) ) ( not ( = ?auto_10225 ?auto_10237 ) ) ( not ( = ?auto_10225 ?auto_10247 ) ) ( not ( = ?auto_10225 ?auto_10239 ) ) ( not ( = ?auto_10225 ?auto_10251 ) ) ( not ( = ?auto_10225 ?auto_10250 ) ) ( not ( = ?auto_10225 ?auto_10235 ) ) ( not ( = ?auto_10228 ?auto_10242 ) ) ( not ( = ?auto_10228 ?auto_10252 ) ) ( not ( = ?auto_10228 ?auto_10249 ) ) ( not ( = ?auto_10228 ?auto_10238 ) ) ( not ( = ?auto_10228 ?auto_10232 ) ) ( not ( = ?auto_10228 ?auto_10248 ) ) ( not ( = ?auto_10228 ?auto_10236 ) ) ( not ( = ?auto_10230 ?auto_10240 ) ) ( not ( = ?auto_10230 ?auto_10233 ) ) ( not ( = ?auto_10230 ?auto_10243 ) ) ( not ( = ?auto_10230 ?auto_10244 ) ) ( not ( = ?auto_10230 ?auto_10246 ) ) ( not ( = ?auto_10230 ?auto_10241 ) ) ( not ( = ?auto_10230 ?auto_10234 ) ) ( not ( = ?auto_10226 ?auto_10245 ) ) ( not ( = ?auto_10226 ?auto_10253 ) ) ( not ( = ?auto_10226 ?auto_10237 ) ) ( not ( = ?auto_10226 ?auto_10247 ) ) ( not ( = ?auto_10226 ?auto_10239 ) ) ( not ( = ?auto_10226 ?auto_10251 ) ) ( not ( = ?auto_10226 ?auto_10250 ) ) ( not ( = ?auto_10226 ?auto_10235 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_10216 ?auto_10217 ?auto_10218 ?auto_10219 ?auto_10220 ?auto_10221 ?auto_10224 ?auto_10223 ?auto_10222 )
      ( MAKE-1CRATE ?auto_10222 ?auto_10225 )
      ( MAKE-9CRATE-VERIFY ?auto_10216 ?auto_10217 ?auto_10218 ?auto_10219 ?auto_10220 ?auto_10221 ?auto_10224 ?auto_10223 ?auto_10222 ?auto_10225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10256 - SURFACE
      ?auto_10257 - SURFACE
    )
    :vars
    (
      ?auto_10258 - HOIST
      ?auto_10259 - PLACE
      ?auto_10261 - PLACE
      ?auto_10262 - HOIST
      ?auto_10263 - SURFACE
      ?auto_10260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10258 ?auto_10259 ) ( SURFACE-AT ?auto_10256 ?auto_10259 ) ( CLEAR ?auto_10256 ) ( IS-CRATE ?auto_10257 ) ( AVAILABLE ?auto_10258 ) ( not ( = ?auto_10261 ?auto_10259 ) ) ( HOIST-AT ?auto_10262 ?auto_10261 ) ( AVAILABLE ?auto_10262 ) ( SURFACE-AT ?auto_10257 ?auto_10261 ) ( ON ?auto_10257 ?auto_10263 ) ( CLEAR ?auto_10257 ) ( TRUCK-AT ?auto_10260 ?auto_10259 ) ( not ( = ?auto_10256 ?auto_10257 ) ) ( not ( = ?auto_10256 ?auto_10263 ) ) ( not ( = ?auto_10257 ?auto_10263 ) ) ( not ( = ?auto_10258 ?auto_10262 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10260 ?auto_10259 ?auto_10261 )
      ( !LIFT ?auto_10262 ?auto_10257 ?auto_10263 ?auto_10261 )
      ( !LOAD ?auto_10262 ?auto_10257 ?auto_10260 ?auto_10261 )
      ( !DRIVE ?auto_10260 ?auto_10261 ?auto_10259 )
      ( !UNLOAD ?auto_10258 ?auto_10257 ?auto_10260 ?auto_10259 )
      ( !DROP ?auto_10258 ?auto_10257 ?auto_10256 ?auto_10259 )
      ( MAKE-1CRATE-VERIFY ?auto_10256 ?auto_10257 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_10275 - SURFACE
      ?auto_10276 - SURFACE
      ?auto_10277 - SURFACE
      ?auto_10278 - SURFACE
      ?auto_10279 - SURFACE
      ?auto_10280 - SURFACE
      ?auto_10283 - SURFACE
      ?auto_10282 - SURFACE
      ?auto_10281 - SURFACE
      ?auto_10284 - SURFACE
      ?auto_10285 - SURFACE
    )
    :vars
    (
      ?auto_10291 - HOIST
      ?auto_10290 - PLACE
      ?auto_10289 - PLACE
      ?auto_10288 - HOIST
      ?auto_10287 - SURFACE
      ?auto_10311 - PLACE
      ?auto_10302 - HOIST
      ?auto_10304 - SURFACE
      ?auto_10301 - PLACE
      ?auto_10305 - HOIST
      ?auto_10307 - SURFACE
      ?auto_10298 - PLACE
      ?auto_10313 - HOIST
      ?auto_10303 - SURFACE
      ?auto_10296 - SURFACE
      ?auto_10309 - PLACE
      ?auto_10293 - HOIST
      ?auto_10308 - SURFACE
      ?auto_10295 - PLACE
      ?auto_10306 - HOIST
      ?auto_10294 - SURFACE
      ?auto_10292 - PLACE
      ?auto_10312 - HOIST
      ?auto_10299 - SURFACE
      ?auto_10314 - SURFACE
      ?auto_10297 - PLACE
      ?auto_10300 - HOIST
      ?auto_10310 - SURFACE
      ?auto_10286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10291 ?auto_10290 ) ( IS-CRATE ?auto_10285 ) ( not ( = ?auto_10289 ?auto_10290 ) ) ( HOIST-AT ?auto_10288 ?auto_10289 ) ( SURFACE-AT ?auto_10285 ?auto_10289 ) ( ON ?auto_10285 ?auto_10287 ) ( CLEAR ?auto_10285 ) ( not ( = ?auto_10284 ?auto_10285 ) ) ( not ( = ?auto_10284 ?auto_10287 ) ) ( not ( = ?auto_10285 ?auto_10287 ) ) ( not ( = ?auto_10291 ?auto_10288 ) ) ( IS-CRATE ?auto_10284 ) ( not ( = ?auto_10311 ?auto_10290 ) ) ( HOIST-AT ?auto_10302 ?auto_10311 ) ( AVAILABLE ?auto_10302 ) ( SURFACE-AT ?auto_10284 ?auto_10311 ) ( ON ?auto_10284 ?auto_10304 ) ( CLEAR ?auto_10284 ) ( not ( = ?auto_10281 ?auto_10284 ) ) ( not ( = ?auto_10281 ?auto_10304 ) ) ( not ( = ?auto_10284 ?auto_10304 ) ) ( not ( = ?auto_10291 ?auto_10302 ) ) ( IS-CRATE ?auto_10281 ) ( not ( = ?auto_10301 ?auto_10290 ) ) ( HOIST-AT ?auto_10305 ?auto_10301 ) ( SURFACE-AT ?auto_10281 ?auto_10301 ) ( ON ?auto_10281 ?auto_10307 ) ( CLEAR ?auto_10281 ) ( not ( = ?auto_10282 ?auto_10281 ) ) ( not ( = ?auto_10282 ?auto_10307 ) ) ( not ( = ?auto_10281 ?auto_10307 ) ) ( not ( = ?auto_10291 ?auto_10305 ) ) ( IS-CRATE ?auto_10282 ) ( not ( = ?auto_10298 ?auto_10290 ) ) ( HOIST-AT ?auto_10313 ?auto_10298 ) ( AVAILABLE ?auto_10313 ) ( SURFACE-AT ?auto_10282 ?auto_10298 ) ( ON ?auto_10282 ?auto_10303 ) ( CLEAR ?auto_10282 ) ( not ( = ?auto_10283 ?auto_10282 ) ) ( not ( = ?auto_10283 ?auto_10303 ) ) ( not ( = ?auto_10282 ?auto_10303 ) ) ( not ( = ?auto_10291 ?auto_10313 ) ) ( IS-CRATE ?auto_10283 ) ( AVAILABLE ?auto_10305 ) ( SURFACE-AT ?auto_10283 ?auto_10301 ) ( ON ?auto_10283 ?auto_10296 ) ( CLEAR ?auto_10283 ) ( not ( = ?auto_10280 ?auto_10283 ) ) ( not ( = ?auto_10280 ?auto_10296 ) ) ( not ( = ?auto_10283 ?auto_10296 ) ) ( IS-CRATE ?auto_10280 ) ( not ( = ?auto_10309 ?auto_10290 ) ) ( HOIST-AT ?auto_10293 ?auto_10309 ) ( AVAILABLE ?auto_10293 ) ( SURFACE-AT ?auto_10280 ?auto_10309 ) ( ON ?auto_10280 ?auto_10308 ) ( CLEAR ?auto_10280 ) ( not ( = ?auto_10279 ?auto_10280 ) ) ( not ( = ?auto_10279 ?auto_10308 ) ) ( not ( = ?auto_10280 ?auto_10308 ) ) ( not ( = ?auto_10291 ?auto_10293 ) ) ( IS-CRATE ?auto_10279 ) ( not ( = ?auto_10295 ?auto_10290 ) ) ( HOIST-AT ?auto_10306 ?auto_10295 ) ( AVAILABLE ?auto_10306 ) ( SURFACE-AT ?auto_10279 ?auto_10295 ) ( ON ?auto_10279 ?auto_10294 ) ( CLEAR ?auto_10279 ) ( not ( = ?auto_10278 ?auto_10279 ) ) ( not ( = ?auto_10278 ?auto_10294 ) ) ( not ( = ?auto_10279 ?auto_10294 ) ) ( not ( = ?auto_10291 ?auto_10306 ) ) ( IS-CRATE ?auto_10278 ) ( not ( = ?auto_10292 ?auto_10290 ) ) ( HOIST-AT ?auto_10312 ?auto_10292 ) ( AVAILABLE ?auto_10312 ) ( SURFACE-AT ?auto_10278 ?auto_10292 ) ( ON ?auto_10278 ?auto_10299 ) ( CLEAR ?auto_10278 ) ( not ( = ?auto_10277 ?auto_10278 ) ) ( not ( = ?auto_10277 ?auto_10299 ) ) ( not ( = ?auto_10278 ?auto_10299 ) ) ( not ( = ?auto_10291 ?auto_10312 ) ) ( IS-CRATE ?auto_10277 ) ( AVAILABLE ?auto_10288 ) ( SURFACE-AT ?auto_10277 ?auto_10289 ) ( ON ?auto_10277 ?auto_10314 ) ( CLEAR ?auto_10277 ) ( not ( = ?auto_10276 ?auto_10277 ) ) ( not ( = ?auto_10276 ?auto_10314 ) ) ( not ( = ?auto_10277 ?auto_10314 ) ) ( SURFACE-AT ?auto_10275 ?auto_10290 ) ( CLEAR ?auto_10275 ) ( IS-CRATE ?auto_10276 ) ( AVAILABLE ?auto_10291 ) ( not ( = ?auto_10297 ?auto_10290 ) ) ( HOIST-AT ?auto_10300 ?auto_10297 ) ( AVAILABLE ?auto_10300 ) ( SURFACE-AT ?auto_10276 ?auto_10297 ) ( ON ?auto_10276 ?auto_10310 ) ( CLEAR ?auto_10276 ) ( TRUCK-AT ?auto_10286 ?auto_10290 ) ( not ( = ?auto_10275 ?auto_10276 ) ) ( not ( = ?auto_10275 ?auto_10310 ) ) ( not ( = ?auto_10276 ?auto_10310 ) ) ( not ( = ?auto_10291 ?auto_10300 ) ) ( not ( = ?auto_10275 ?auto_10277 ) ) ( not ( = ?auto_10275 ?auto_10314 ) ) ( not ( = ?auto_10277 ?auto_10310 ) ) ( not ( = ?auto_10289 ?auto_10297 ) ) ( not ( = ?auto_10288 ?auto_10300 ) ) ( not ( = ?auto_10314 ?auto_10310 ) ) ( not ( = ?auto_10275 ?auto_10278 ) ) ( not ( = ?auto_10275 ?auto_10299 ) ) ( not ( = ?auto_10276 ?auto_10278 ) ) ( not ( = ?auto_10276 ?auto_10299 ) ) ( not ( = ?auto_10278 ?auto_10314 ) ) ( not ( = ?auto_10278 ?auto_10310 ) ) ( not ( = ?auto_10292 ?auto_10289 ) ) ( not ( = ?auto_10292 ?auto_10297 ) ) ( not ( = ?auto_10312 ?auto_10288 ) ) ( not ( = ?auto_10312 ?auto_10300 ) ) ( not ( = ?auto_10299 ?auto_10314 ) ) ( not ( = ?auto_10299 ?auto_10310 ) ) ( not ( = ?auto_10275 ?auto_10279 ) ) ( not ( = ?auto_10275 ?auto_10294 ) ) ( not ( = ?auto_10276 ?auto_10279 ) ) ( not ( = ?auto_10276 ?auto_10294 ) ) ( not ( = ?auto_10277 ?auto_10279 ) ) ( not ( = ?auto_10277 ?auto_10294 ) ) ( not ( = ?auto_10279 ?auto_10299 ) ) ( not ( = ?auto_10279 ?auto_10314 ) ) ( not ( = ?auto_10279 ?auto_10310 ) ) ( not ( = ?auto_10295 ?auto_10292 ) ) ( not ( = ?auto_10295 ?auto_10289 ) ) ( not ( = ?auto_10295 ?auto_10297 ) ) ( not ( = ?auto_10306 ?auto_10312 ) ) ( not ( = ?auto_10306 ?auto_10288 ) ) ( not ( = ?auto_10306 ?auto_10300 ) ) ( not ( = ?auto_10294 ?auto_10299 ) ) ( not ( = ?auto_10294 ?auto_10314 ) ) ( not ( = ?auto_10294 ?auto_10310 ) ) ( not ( = ?auto_10275 ?auto_10280 ) ) ( not ( = ?auto_10275 ?auto_10308 ) ) ( not ( = ?auto_10276 ?auto_10280 ) ) ( not ( = ?auto_10276 ?auto_10308 ) ) ( not ( = ?auto_10277 ?auto_10280 ) ) ( not ( = ?auto_10277 ?auto_10308 ) ) ( not ( = ?auto_10278 ?auto_10280 ) ) ( not ( = ?auto_10278 ?auto_10308 ) ) ( not ( = ?auto_10280 ?auto_10294 ) ) ( not ( = ?auto_10280 ?auto_10299 ) ) ( not ( = ?auto_10280 ?auto_10314 ) ) ( not ( = ?auto_10280 ?auto_10310 ) ) ( not ( = ?auto_10309 ?auto_10295 ) ) ( not ( = ?auto_10309 ?auto_10292 ) ) ( not ( = ?auto_10309 ?auto_10289 ) ) ( not ( = ?auto_10309 ?auto_10297 ) ) ( not ( = ?auto_10293 ?auto_10306 ) ) ( not ( = ?auto_10293 ?auto_10312 ) ) ( not ( = ?auto_10293 ?auto_10288 ) ) ( not ( = ?auto_10293 ?auto_10300 ) ) ( not ( = ?auto_10308 ?auto_10294 ) ) ( not ( = ?auto_10308 ?auto_10299 ) ) ( not ( = ?auto_10308 ?auto_10314 ) ) ( not ( = ?auto_10308 ?auto_10310 ) ) ( not ( = ?auto_10275 ?auto_10283 ) ) ( not ( = ?auto_10275 ?auto_10296 ) ) ( not ( = ?auto_10276 ?auto_10283 ) ) ( not ( = ?auto_10276 ?auto_10296 ) ) ( not ( = ?auto_10277 ?auto_10283 ) ) ( not ( = ?auto_10277 ?auto_10296 ) ) ( not ( = ?auto_10278 ?auto_10283 ) ) ( not ( = ?auto_10278 ?auto_10296 ) ) ( not ( = ?auto_10279 ?auto_10283 ) ) ( not ( = ?auto_10279 ?auto_10296 ) ) ( not ( = ?auto_10283 ?auto_10308 ) ) ( not ( = ?auto_10283 ?auto_10294 ) ) ( not ( = ?auto_10283 ?auto_10299 ) ) ( not ( = ?auto_10283 ?auto_10314 ) ) ( not ( = ?auto_10283 ?auto_10310 ) ) ( not ( = ?auto_10301 ?auto_10309 ) ) ( not ( = ?auto_10301 ?auto_10295 ) ) ( not ( = ?auto_10301 ?auto_10292 ) ) ( not ( = ?auto_10301 ?auto_10289 ) ) ( not ( = ?auto_10301 ?auto_10297 ) ) ( not ( = ?auto_10305 ?auto_10293 ) ) ( not ( = ?auto_10305 ?auto_10306 ) ) ( not ( = ?auto_10305 ?auto_10312 ) ) ( not ( = ?auto_10305 ?auto_10288 ) ) ( not ( = ?auto_10305 ?auto_10300 ) ) ( not ( = ?auto_10296 ?auto_10308 ) ) ( not ( = ?auto_10296 ?auto_10294 ) ) ( not ( = ?auto_10296 ?auto_10299 ) ) ( not ( = ?auto_10296 ?auto_10314 ) ) ( not ( = ?auto_10296 ?auto_10310 ) ) ( not ( = ?auto_10275 ?auto_10282 ) ) ( not ( = ?auto_10275 ?auto_10303 ) ) ( not ( = ?auto_10276 ?auto_10282 ) ) ( not ( = ?auto_10276 ?auto_10303 ) ) ( not ( = ?auto_10277 ?auto_10282 ) ) ( not ( = ?auto_10277 ?auto_10303 ) ) ( not ( = ?auto_10278 ?auto_10282 ) ) ( not ( = ?auto_10278 ?auto_10303 ) ) ( not ( = ?auto_10279 ?auto_10282 ) ) ( not ( = ?auto_10279 ?auto_10303 ) ) ( not ( = ?auto_10280 ?auto_10282 ) ) ( not ( = ?auto_10280 ?auto_10303 ) ) ( not ( = ?auto_10282 ?auto_10296 ) ) ( not ( = ?auto_10282 ?auto_10308 ) ) ( not ( = ?auto_10282 ?auto_10294 ) ) ( not ( = ?auto_10282 ?auto_10299 ) ) ( not ( = ?auto_10282 ?auto_10314 ) ) ( not ( = ?auto_10282 ?auto_10310 ) ) ( not ( = ?auto_10298 ?auto_10301 ) ) ( not ( = ?auto_10298 ?auto_10309 ) ) ( not ( = ?auto_10298 ?auto_10295 ) ) ( not ( = ?auto_10298 ?auto_10292 ) ) ( not ( = ?auto_10298 ?auto_10289 ) ) ( not ( = ?auto_10298 ?auto_10297 ) ) ( not ( = ?auto_10313 ?auto_10305 ) ) ( not ( = ?auto_10313 ?auto_10293 ) ) ( not ( = ?auto_10313 ?auto_10306 ) ) ( not ( = ?auto_10313 ?auto_10312 ) ) ( not ( = ?auto_10313 ?auto_10288 ) ) ( not ( = ?auto_10313 ?auto_10300 ) ) ( not ( = ?auto_10303 ?auto_10296 ) ) ( not ( = ?auto_10303 ?auto_10308 ) ) ( not ( = ?auto_10303 ?auto_10294 ) ) ( not ( = ?auto_10303 ?auto_10299 ) ) ( not ( = ?auto_10303 ?auto_10314 ) ) ( not ( = ?auto_10303 ?auto_10310 ) ) ( not ( = ?auto_10275 ?auto_10281 ) ) ( not ( = ?auto_10275 ?auto_10307 ) ) ( not ( = ?auto_10276 ?auto_10281 ) ) ( not ( = ?auto_10276 ?auto_10307 ) ) ( not ( = ?auto_10277 ?auto_10281 ) ) ( not ( = ?auto_10277 ?auto_10307 ) ) ( not ( = ?auto_10278 ?auto_10281 ) ) ( not ( = ?auto_10278 ?auto_10307 ) ) ( not ( = ?auto_10279 ?auto_10281 ) ) ( not ( = ?auto_10279 ?auto_10307 ) ) ( not ( = ?auto_10280 ?auto_10281 ) ) ( not ( = ?auto_10280 ?auto_10307 ) ) ( not ( = ?auto_10283 ?auto_10281 ) ) ( not ( = ?auto_10283 ?auto_10307 ) ) ( not ( = ?auto_10281 ?auto_10303 ) ) ( not ( = ?auto_10281 ?auto_10296 ) ) ( not ( = ?auto_10281 ?auto_10308 ) ) ( not ( = ?auto_10281 ?auto_10294 ) ) ( not ( = ?auto_10281 ?auto_10299 ) ) ( not ( = ?auto_10281 ?auto_10314 ) ) ( not ( = ?auto_10281 ?auto_10310 ) ) ( not ( = ?auto_10307 ?auto_10303 ) ) ( not ( = ?auto_10307 ?auto_10296 ) ) ( not ( = ?auto_10307 ?auto_10308 ) ) ( not ( = ?auto_10307 ?auto_10294 ) ) ( not ( = ?auto_10307 ?auto_10299 ) ) ( not ( = ?auto_10307 ?auto_10314 ) ) ( not ( = ?auto_10307 ?auto_10310 ) ) ( not ( = ?auto_10275 ?auto_10284 ) ) ( not ( = ?auto_10275 ?auto_10304 ) ) ( not ( = ?auto_10276 ?auto_10284 ) ) ( not ( = ?auto_10276 ?auto_10304 ) ) ( not ( = ?auto_10277 ?auto_10284 ) ) ( not ( = ?auto_10277 ?auto_10304 ) ) ( not ( = ?auto_10278 ?auto_10284 ) ) ( not ( = ?auto_10278 ?auto_10304 ) ) ( not ( = ?auto_10279 ?auto_10284 ) ) ( not ( = ?auto_10279 ?auto_10304 ) ) ( not ( = ?auto_10280 ?auto_10284 ) ) ( not ( = ?auto_10280 ?auto_10304 ) ) ( not ( = ?auto_10283 ?auto_10284 ) ) ( not ( = ?auto_10283 ?auto_10304 ) ) ( not ( = ?auto_10282 ?auto_10284 ) ) ( not ( = ?auto_10282 ?auto_10304 ) ) ( not ( = ?auto_10284 ?auto_10307 ) ) ( not ( = ?auto_10284 ?auto_10303 ) ) ( not ( = ?auto_10284 ?auto_10296 ) ) ( not ( = ?auto_10284 ?auto_10308 ) ) ( not ( = ?auto_10284 ?auto_10294 ) ) ( not ( = ?auto_10284 ?auto_10299 ) ) ( not ( = ?auto_10284 ?auto_10314 ) ) ( not ( = ?auto_10284 ?auto_10310 ) ) ( not ( = ?auto_10311 ?auto_10301 ) ) ( not ( = ?auto_10311 ?auto_10298 ) ) ( not ( = ?auto_10311 ?auto_10309 ) ) ( not ( = ?auto_10311 ?auto_10295 ) ) ( not ( = ?auto_10311 ?auto_10292 ) ) ( not ( = ?auto_10311 ?auto_10289 ) ) ( not ( = ?auto_10311 ?auto_10297 ) ) ( not ( = ?auto_10302 ?auto_10305 ) ) ( not ( = ?auto_10302 ?auto_10313 ) ) ( not ( = ?auto_10302 ?auto_10293 ) ) ( not ( = ?auto_10302 ?auto_10306 ) ) ( not ( = ?auto_10302 ?auto_10312 ) ) ( not ( = ?auto_10302 ?auto_10288 ) ) ( not ( = ?auto_10302 ?auto_10300 ) ) ( not ( = ?auto_10304 ?auto_10307 ) ) ( not ( = ?auto_10304 ?auto_10303 ) ) ( not ( = ?auto_10304 ?auto_10296 ) ) ( not ( = ?auto_10304 ?auto_10308 ) ) ( not ( = ?auto_10304 ?auto_10294 ) ) ( not ( = ?auto_10304 ?auto_10299 ) ) ( not ( = ?auto_10304 ?auto_10314 ) ) ( not ( = ?auto_10304 ?auto_10310 ) ) ( not ( = ?auto_10275 ?auto_10285 ) ) ( not ( = ?auto_10275 ?auto_10287 ) ) ( not ( = ?auto_10276 ?auto_10285 ) ) ( not ( = ?auto_10276 ?auto_10287 ) ) ( not ( = ?auto_10277 ?auto_10285 ) ) ( not ( = ?auto_10277 ?auto_10287 ) ) ( not ( = ?auto_10278 ?auto_10285 ) ) ( not ( = ?auto_10278 ?auto_10287 ) ) ( not ( = ?auto_10279 ?auto_10285 ) ) ( not ( = ?auto_10279 ?auto_10287 ) ) ( not ( = ?auto_10280 ?auto_10285 ) ) ( not ( = ?auto_10280 ?auto_10287 ) ) ( not ( = ?auto_10283 ?auto_10285 ) ) ( not ( = ?auto_10283 ?auto_10287 ) ) ( not ( = ?auto_10282 ?auto_10285 ) ) ( not ( = ?auto_10282 ?auto_10287 ) ) ( not ( = ?auto_10281 ?auto_10285 ) ) ( not ( = ?auto_10281 ?auto_10287 ) ) ( not ( = ?auto_10285 ?auto_10304 ) ) ( not ( = ?auto_10285 ?auto_10307 ) ) ( not ( = ?auto_10285 ?auto_10303 ) ) ( not ( = ?auto_10285 ?auto_10296 ) ) ( not ( = ?auto_10285 ?auto_10308 ) ) ( not ( = ?auto_10285 ?auto_10294 ) ) ( not ( = ?auto_10285 ?auto_10299 ) ) ( not ( = ?auto_10285 ?auto_10314 ) ) ( not ( = ?auto_10285 ?auto_10310 ) ) ( not ( = ?auto_10287 ?auto_10304 ) ) ( not ( = ?auto_10287 ?auto_10307 ) ) ( not ( = ?auto_10287 ?auto_10303 ) ) ( not ( = ?auto_10287 ?auto_10296 ) ) ( not ( = ?auto_10287 ?auto_10308 ) ) ( not ( = ?auto_10287 ?auto_10294 ) ) ( not ( = ?auto_10287 ?auto_10299 ) ) ( not ( = ?auto_10287 ?auto_10314 ) ) ( not ( = ?auto_10287 ?auto_10310 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_10275 ?auto_10276 ?auto_10277 ?auto_10278 ?auto_10279 ?auto_10280 ?auto_10283 ?auto_10282 ?auto_10281 ?auto_10284 )
      ( MAKE-1CRATE ?auto_10284 ?auto_10285 )
      ( MAKE-10CRATE-VERIFY ?auto_10275 ?auto_10276 ?auto_10277 ?auto_10278 ?auto_10279 ?auto_10280 ?auto_10283 ?auto_10282 ?auto_10281 ?auto_10284 ?auto_10285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10317 - SURFACE
      ?auto_10318 - SURFACE
    )
    :vars
    (
      ?auto_10319 - HOIST
      ?auto_10320 - PLACE
      ?auto_10322 - PLACE
      ?auto_10323 - HOIST
      ?auto_10324 - SURFACE
      ?auto_10321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10319 ?auto_10320 ) ( SURFACE-AT ?auto_10317 ?auto_10320 ) ( CLEAR ?auto_10317 ) ( IS-CRATE ?auto_10318 ) ( AVAILABLE ?auto_10319 ) ( not ( = ?auto_10322 ?auto_10320 ) ) ( HOIST-AT ?auto_10323 ?auto_10322 ) ( AVAILABLE ?auto_10323 ) ( SURFACE-AT ?auto_10318 ?auto_10322 ) ( ON ?auto_10318 ?auto_10324 ) ( CLEAR ?auto_10318 ) ( TRUCK-AT ?auto_10321 ?auto_10320 ) ( not ( = ?auto_10317 ?auto_10318 ) ) ( not ( = ?auto_10317 ?auto_10324 ) ) ( not ( = ?auto_10318 ?auto_10324 ) ) ( not ( = ?auto_10319 ?auto_10323 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10321 ?auto_10320 ?auto_10322 )
      ( !LIFT ?auto_10323 ?auto_10318 ?auto_10324 ?auto_10322 )
      ( !LOAD ?auto_10323 ?auto_10318 ?auto_10321 ?auto_10322 )
      ( !DRIVE ?auto_10321 ?auto_10322 ?auto_10320 )
      ( !UNLOAD ?auto_10319 ?auto_10318 ?auto_10321 ?auto_10320 )
      ( !DROP ?auto_10319 ?auto_10318 ?auto_10317 ?auto_10320 )
      ( MAKE-1CRATE-VERIFY ?auto_10317 ?auto_10318 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_10337 - SURFACE
      ?auto_10338 - SURFACE
      ?auto_10339 - SURFACE
      ?auto_10340 - SURFACE
      ?auto_10341 - SURFACE
      ?auto_10342 - SURFACE
      ?auto_10345 - SURFACE
      ?auto_10344 - SURFACE
      ?auto_10343 - SURFACE
      ?auto_10346 - SURFACE
      ?auto_10348 - SURFACE
      ?auto_10347 - SURFACE
    )
    :vars
    (
      ?auto_10352 - HOIST
      ?auto_10353 - PLACE
      ?auto_10350 - PLACE
      ?auto_10349 - HOIST
      ?auto_10351 - SURFACE
      ?auto_10356 - PLACE
      ?auto_10355 - HOIST
      ?auto_10362 - SURFACE
      ?auto_10361 - PLACE
      ?auto_10377 - HOIST
      ?auto_10376 - SURFACE
      ?auto_10378 - PLACE
      ?auto_10375 - HOIST
      ?auto_10363 - SURFACE
      ?auto_10369 - SURFACE
      ?auto_10374 - SURFACE
      ?auto_10373 - PLACE
      ?auto_10364 - HOIST
      ?auto_10370 - SURFACE
      ?auto_10368 - PLACE
      ?auto_10357 - HOIST
      ?auto_10371 - SURFACE
      ?auto_10367 - PLACE
      ?auto_10358 - HOIST
      ?auto_10360 - SURFACE
      ?auto_10359 - SURFACE
      ?auto_10366 - PLACE
      ?auto_10365 - HOIST
      ?auto_10372 - SURFACE
      ?auto_10354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10352 ?auto_10353 ) ( IS-CRATE ?auto_10347 ) ( not ( = ?auto_10350 ?auto_10353 ) ) ( HOIST-AT ?auto_10349 ?auto_10350 ) ( SURFACE-AT ?auto_10347 ?auto_10350 ) ( ON ?auto_10347 ?auto_10351 ) ( CLEAR ?auto_10347 ) ( not ( = ?auto_10348 ?auto_10347 ) ) ( not ( = ?auto_10348 ?auto_10351 ) ) ( not ( = ?auto_10347 ?auto_10351 ) ) ( not ( = ?auto_10352 ?auto_10349 ) ) ( IS-CRATE ?auto_10348 ) ( not ( = ?auto_10356 ?auto_10353 ) ) ( HOIST-AT ?auto_10355 ?auto_10356 ) ( SURFACE-AT ?auto_10348 ?auto_10356 ) ( ON ?auto_10348 ?auto_10362 ) ( CLEAR ?auto_10348 ) ( not ( = ?auto_10346 ?auto_10348 ) ) ( not ( = ?auto_10346 ?auto_10362 ) ) ( not ( = ?auto_10348 ?auto_10362 ) ) ( not ( = ?auto_10352 ?auto_10355 ) ) ( IS-CRATE ?auto_10346 ) ( not ( = ?auto_10361 ?auto_10353 ) ) ( HOIST-AT ?auto_10377 ?auto_10361 ) ( AVAILABLE ?auto_10377 ) ( SURFACE-AT ?auto_10346 ?auto_10361 ) ( ON ?auto_10346 ?auto_10376 ) ( CLEAR ?auto_10346 ) ( not ( = ?auto_10343 ?auto_10346 ) ) ( not ( = ?auto_10343 ?auto_10376 ) ) ( not ( = ?auto_10346 ?auto_10376 ) ) ( not ( = ?auto_10352 ?auto_10377 ) ) ( IS-CRATE ?auto_10343 ) ( not ( = ?auto_10378 ?auto_10353 ) ) ( HOIST-AT ?auto_10375 ?auto_10378 ) ( SURFACE-AT ?auto_10343 ?auto_10378 ) ( ON ?auto_10343 ?auto_10363 ) ( CLEAR ?auto_10343 ) ( not ( = ?auto_10344 ?auto_10343 ) ) ( not ( = ?auto_10344 ?auto_10363 ) ) ( not ( = ?auto_10343 ?auto_10363 ) ) ( not ( = ?auto_10352 ?auto_10375 ) ) ( IS-CRATE ?auto_10344 ) ( AVAILABLE ?auto_10349 ) ( SURFACE-AT ?auto_10344 ?auto_10350 ) ( ON ?auto_10344 ?auto_10369 ) ( CLEAR ?auto_10344 ) ( not ( = ?auto_10345 ?auto_10344 ) ) ( not ( = ?auto_10345 ?auto_10369 ) ) ( not ( = ?auto_10344 ?auto_10369 ) ) ( IS-CRATE ?auto_10345 ) ( AVAILABLE ?auto_10375 ) ( SURFACE-AT ?auto_10345 ?auto_10378 ) ( ON ?auto_10345 ?auto_10374 ) ( CLEAR ?auto_10345 ) ( not ( = ?auto_10342 ?auto_10345 ) ) ( not ( = ?auto_10342 ?auto_10374 ) ) ( not ( = ?auto_10345 ?auto_10374 ) ) ( IS-CRATE ?auto_10342 ) ( not ( = ?auto_10373 ?auto_10353 ) ) ( HOIST-AT ?auto_10364 ?auto_10373 ) ( AVAILABLE ?auto_10364 ) ( SURFACE-AT ?auto_10342 ?auto_10373 ) ( ON ?auto_10342 ?auto_10370 ) ( CLEAR ?auto_10342 ) ( not ( = ?auto_10341 ?auto_10342 ) ) ( not ( = ?auto_10341 ?auto_10370 ) ) ( not ( = ?auto_10342 ?auto_10370 ) ) ( not ( = ?auto_10352 ?auto_10364 ) ) ( IS-CRATE ?auto_10341 ) ( not ( = ?auto_10368 ?auto_10353 ) ) ( HOIST-AT ?auto_10357 ?auto_10368 ) ( AVAILABLE ?auto_10357 ) ( SURFACE-AT ?auto_10341 ?auto_10368 ) ( ON ?auto_10341 ?auto_10371 ) ( CLEAR ?auto_10341 ) ( not ( = ?auto_10340 ?auto_10341 ) ) ( not ( = ?auto_10340 ?auto_10371 ) ) ( not ( = ?auto_10341 ?auto_10371 ) ) ( not ( = ?auto_10352 ?auto_10357 ) ) ( IS-CRATE ?auto_10340 ) ( not ( = ?auto_10367 ?auto_10353 ) ) ( HOIST-AT ?auto_10358 ?auto_10367 ) ( AVAILABLE ?auto_10358 ) ( SURFACE-AT ?auto_10340 ?auto_10367 ) ( ON ?auto_10340 ?auto_10360 ) ( CLEAR ?auto_10340 ) ( not ( = ?auto_10339 ?auto_10340 ) ) ( not ( = ?auto_10339 ?auto_10360 ) ) ( not ( = ?auto_10340 ?auto_10360 ) ) ( not ( = ?auto_10352 ?auto_10358 ) ) ( IS-CRATE ?auto_10339 ) ( AVAILABLE ?auto_10355 ) ( SURFACE-AT ?auto_10339 ?auto_10356 ) ( ON ?auto_10339 ?auto_10359 ) ( CLEAR ?auto_10339 ) ( not ( = ?auto_10338 ?auto_10339 ) ) ( not ( = ?auto_10338 ?auto_10359 ) ) ( not ( = ?auto_10339 ?auto_10359 ) ) ( SURFACE-AT ?auto_10337 ?auto_10353 ) ( CLEAR ?auto_10337 ) ( IS-CRATE ?auto_10338 ) ( AVAILABLE ?auto_10352 ) ( not ( = ?auto_10366 ?auto_10353 ) ) ( HOIST-AT ?auto_10365 ?auto_10366 ) ( AVAILABLE ?auto_10365 ) ( SURFACE-AT ?auto_10338 ?auto_10366 ) ( ON ?auto_10338 ?auto_10372 ) ( CLEAR ?auto_10338 ) ( TRUCK-AT ?auto_10354 ?auto_10353 ) ( not ( = ?auto_10337 ?auto_10338 ) ) ( not ( = ?auto_10337 ?auto_10372 ) ) ( not ( = ?auto_10338 ?auto_10372 ) ) ( not ( = ?auto_10352 ?auto_10365 ) ) ( not ( = ?auto_10337 ?auto_10339 ) ) ( not ( = ?auto_10337 ?auto_10359 ) ) ( not ( = ?auto_10339 ?auto_10372 ) ) ( not ( = ?auto_10356 ?auto_10366 ) ) ( not ( = ?auto_10355 ?auto_10365 ) ) ( not ( = ?auto_10359 ?auto_10372 ) ) ( not ( = ?auto_10337 ?auto_10340 ) ) ( not ( = ?auto_10337 ?auto_10360 ) ) ( not ( = ?auto_10338 ?auto_10340 ) ) ( not ( = ?auto_10338 ?auto_10360 ) ) ( not ( = ?auto_10340 ?auto_10359 ) ) ( not ( = ?auto_10340 ?auto_10372 ) ) ( not ( = ?auto_10367 ?auto_10356 ) ) ( not ( = ?auto_10367 ?auto_10366 ) ) ( not ( = ?auto_10358 ?auto_10355 ) ) ( not ( = ?auto_10358 ?auto_10365 ) ) ( not ( = ?auto_10360 ?auto_10359 ) ) ( not ( = ?auto_10360 ?auto_10372 ) ) ( not ( = ?auto_10337 ?auto_10341 ) ) ( not ( = ?auto_10337 ?auto_10371 ) ) ( not ( = ?auto_10338 ?auto_10341 ) ) ( not ( = ?auto_10338 ?auto_10371 ) ) ( not ( = ?auto_10339 ?auto_10341 ) ) ( not ( = ?auto_10339 ?auto_10371 ) ) ( not ( = ?auto_10341 ?auto_10360 ) ) ( not ( = ?auto_10341 ?auto_10359 ) ) ( not ( = ?auto_10341 ?auto_10372 ) ) ( not ( = ?auto_10368 ?auto_10367 ) ) ( not ( = ?auto_10368 ?auto_10356 ) ) ( not ( = ?auto_10368 ?auto_10366 ) ) ( not ( = ?auto_10357 ?auto_10358 ) ) ( not ( = ?auto_10357 ?auto_10355 ) ) ( not ( = ?auto_10357 ?auto_10365 ) ) ( not ( = ?auto_10371 ?auto_10360 ) ) ( not ( = ?auto_10371 ?auto_10359 ) ) ( not ( = ?auto_10371 ?auto_10372 ) ) ( not ( = ?auto_10337 ?auto_10342 ) ) ( not ( = ?auto_10337 ?auto_10370 ) ) ( not ( = ?auto_10338 ?auto_10342 ) ) ( not ( = ?auto_10338 ?auto_10370 ) ) ( not ( = ?auto_10339 ?auto_10342 ) ) ( not ( = ?auto_10339 ?auto_10370 ) ) ( not ( = ?auto_10340 ?auto_10342 ) ) ( not ( = ?auto_10340 ?auto_10370 ) ) ( not ( = ?auto_10342 ?auto_10371 ) ) ( not ( = ?auto_10342 ?auto_10360 ) ) ( not ( = ?auto_10342 ?auto_10359 ) ) ( not ( = ?auto_10342 ?auto_10372 ) ) ( not ( = ?auto_10373 ?auto_10368 ) ) ( not ( = ?auto_10373 ?auto_10367 ) ) ( not ( = ?auto_10373 ?auto_10356 ) ) ( not ( = ?auto_10373 ?auto_10366 ) ) ( not ( = ?auto_10364 ?auto_10357 ) ) ( not ( = ?auto_10364 ?auto_10358 ) ) ( not ( = ?auto_10364 ?auto_10355 ) ) ( not ( = ?auto_10364 ?auto_10365 ) ) ( not ( = ?auto_10370 ?auto_10371 ) ) ( not ( = ?auto_10370 ?auto_10360 ) ) ( not ( = ?auto_10370 ?auto_10359 ) ) ( not ( = ?auto_10370 ?auto_10372 ) ) ( not ( = ?auto_10337 ?auto_10345 ) ) ( not ( = ?auto_10337 ?auto_10374 ) ) ( not ( = ?auto_10338 ?auto_10345 ) ) ( not ( = ?auto_10338 ?auto_10374 ) ) ( not ( = ?auto_10339 ?auto_10345 ) ) ( not ( = ?auto_10339 ?auto_10374 ) ) ( not ( = ?auto_10340 ?auto_10345 ) ) ( not ( = ?auto_10340 ?auto_10374 ) ) ( not ( = ?auto_10341 ?auto_10345 ) ) ( not ( = ?auto_10341 ?auto_10374 ) ) ( not ( = ?auto_10345 ?auto_10370 ) ) ( not ( = ?auto_10345 ?auto_10371 ) ) ( not ( = ?auto_10345 ?auto_10360 ) ) ( not ( = ?auto_10345 ?auto_10359 ) ) ( not ( = ?auto_10345 ?auto_10372 ) ) ( not ( = ?auto_10378 ?auto_10373 ) ) ( not ( = ?auto_10378 ?auto_10368 ) ) ( not ( = ?auto_10378 ?auto_10367 ) ) ( not ( = ?auto_10378 ?auto_10356 ) ) ( not ( = ?auto_10378 ?auto_10366 ) ) ( not ( = ?auto_10375 ?auto_10364 ) ) ( not ( = ?auto_10375 ?auto_10357 ) ) ( not ( = ?auto_10375 ?auto_10358 ) ) ( not ( = ?auto_10375 ?auto_10355 ) ) ( not ( = ?auto_10375 ?auto_10365 ) ) ( not ( = ?auto_10374 ?auto_10370 ) ) ( not ( = ?auto_10374 ?auto_10371 ) ) ( not ( = ?auto_10374 ?auto_10360 ) ) ( not ( = ?auto_10374 ?auto_10359 ) ) ( not ( = ?auto_10374 ?auto_10372 ) ) ( not ( = ?auto_10337 ?auto_10344 ) ) ( not ( = ?auto_10337 ?auto_10369 ) ) ( not ( = ?auto_10338 ?auto_10344 ) ) ( not ( = ?auto_10338 ?auto_10369 ) ) ( not ( = ?auto_10339 ?auto_10344 ) ) ( not ( = ?auto_10339 ?auto_10369 ) ) ( not ( = ?auto_10340 ?auto_10344 ) ) ( not ( = ?auto_10340 ?auto_10369 ) ) ( not ( = ?auto_10341 ?auto_10344 ) ) ( not ( = ?auto_10341 ?auto_10369 ) ) ( not ( = ?auto_10342 ?auto_10344 ) ) ( not ( = ?auto_10342 ?auto_10369 ) ) ( not ( = ?auto_10344 ?auto_10374 ) ) ( not ( = ?auto_10344 ?auto_10370 ) ) ( not ( = ?auto_10344 ?auto_10371 ) ) ( not ( = ?auto_10344 ?auto_10360 ) ) ( not ( = ?auto_10344 ?auto_10359 ) ) ( not ( = ?auto_10344 ?auto_10372 ) ) ( not ( = ?auto_10350 ?auto_10378 ) ) ( not ( = ?auto_10350 ?auto_10373 ) ) ( not ( = ?auto_10350 ?auto_10368 ) ) ( not ( = ?auto_10350 ?auto_10367 ) ) ( not ( = ?auto_10350 ?auto_10356 ) ) ( not ( = ?auto_10350 ?auto_10366 ) ) ( not ( = ?auto_10349 ?auto_10375 ) ) ( not ( = ?auto_10349 ?auto_10364 ) ) ( not ( = ?auto_10349 ?auto_10357 ) ) ( not ( = ?auto_10349 ?auto_10358 ) ) ( not ( = ?auto_10349 ?auto_10355 ) ) ( not ( = ?auto_10349 ?auto_10365 ) ) ( not ( = ?auto_10369 ?auto_10374 ) ) ( not ( = ?auto_10369 ?auto_10370 ) ) ( not ( = ?auto_10369 ?auto_10371 ) ) ( not ( = ?auto_10369 ?auto_10360 ) ) ( not ( = ?auto_10369 ?auto_10359 ) ) ( not ( = ?auto_10369 ?auto_10372 ) ) ( not ( = ?auto_10337 ?auto_10343 ) ) ( not ( = ?auto_10337 ?auto_10363 ) ) ( not ( = ?auto_10338 ?auto_10343 ) ) ( not ( = ?auto_10338 ?auto_10363 ) ) ( not ( = ?auto_10339 ?auto_10343 ) ) ( not ( = ?auto_10339 ?auto_10363 ) ) ( not ( = ?auto_10340 ?auto_10343 ) ) ( not ( = ?auto_10340 ?auto_10363 ) ) ( not ( = ?auto_10341 ?auto_10343 ) ) ( not ( = ?auto_10341 ?auto_10363 ) ) ( not ( = ?auto_10342 ?auto_10343 ) ) ( not ( = ?auto_10342 ?auto_10363 ) ) ( not ( = ?auto_10345 ?auto_10343 ) ) ( not ( = ?auto_10345 ?auto_10363 ) ) ( not ( = ?auto_10343 ?auto_10369 ) ) ( not ( = ?auto_10343 ?auto_10374 ) ) ( not ( = ?auto_10343 ?auto_10370 ) ) ( not ( = ?auto_10343 ?auto_10371 ) ) ( not ( = ?auto_10343 ?auto_10360 ) ) ( not ( = ?auto_10343 ?auto_10359 ) ) ( not ( = ?auto_10343 ?auto_10372 ) ) ( not ( = ?auto_10363 ?auto_10369 ) ) ( not ( = ?auto_10363 ?auto_10374 ) ) ( not ( = ?auto_10363 ?auto_10370 ) ) ( not ( = ?auto_10363 ?auto_10371 ) ) ( not ( = ?auto_10363 ?auto_10360 ) ) ( not ( = ?auto_10363 ?auto_10359 ) ) ( not ( = ?auto_10363 ?auto_10372 ) ) ( not ( = ?auto_10337 ?auto_10346 ) ) ( not ( = ?auto_10337 ?auto_10376 ) ) ( not ( = ?auto_10338 ?auto_10346 ) ) ( not ( = ?auto_10338 ?auto_10376 ) ) ( not ( = ?auto_10339 ?auto_10346 ) ) ( not ( = ?auto_10339 ?auto_10376 ) ) ( not ( = ?auto_10340 ?auto_10346 ) ) ( not ( = ?auto_10340 ?auto_10376 ) ) ( not ( = ?auto_10341 ?auto_10346 ) ) ( not ( = ?auto_10341 ?auto_10376 ) ) ( not ( = ?auto_10342 ?auto_10346 ) ) ( not ( = ?auto_10342 ?auto_10376 ) ) ( not ( = ?auto_10345 ?auto_10346 ) ) ( not ( = ?auto_10345 ?auto_10376 ) ) ( not ( = ?auto_10344 ?auto_10346 ) ) ( not ( = ?auto_10344 ?auto_10376 ) ) ( not ( = ?auto_10346 ?auto_10363 ) ) ( not ( = ?auto_10346 ?auto_10369 ) ) ( not ( = ?auto_10346 ?auto_10374 ) ) ( not ( = ?auto_10346 ?auto_10370 ) ) ( not ( = ?auto_10346 ?auto_10371 ) ) ( not ( = ?auto_10346 ?auto_10360 ) ) ( not ( = ?auto_10346 ?auto_10359 ) ) ( not ( = ?auto_10346 ?auto_10372 ) ) ( not ( = ?auto_10361 ?auto_10378 ) ) ( not ( = ?auto_10361 ?auto_10350 ) ) ( not ( = ?auto_10361 ?auto_10373 ) ) ( not ( = ?auto_10361 ?auto_10368 ) ) ( not ( = ?auto_10361 ?auto_10367 ) ) ( not ( = ?auto_10361 ?auto_10356 ) ) ( not ( = ?auto_10361 ?auto_10366 ) ) ( not ( = ?auto_10377 ?auto_10375 ) ) ( not ( = ?auto_10377 ?auto_10349 ) ) ( not ( = ?auto_10377 ?auto_10364 ) ) ( not ( = ?auto_10377 ?auto_10357 ) ) ( not ( = ?auto_10377 ?auto_10358 ) ) ( not ( = ?auto_10377 ?auto_10355 ) ) ( not ( = ?auto_10377 ?auto_10365 ) ) ( not ( = ?auto_10376 ?auto_10363 ) ) ( not ( = ?auto_10376 ?auto_10369 ) ) ( not ( = ?auto_10376 ?auto_10374 ) ) ( not ( = ?auto_10376 ?auto_10370 ) ) ( not ( = ?auto_10376 ?auto_10371 ) ) ( not ( = ?auto_10376 ?auto_10360 ) ) ( not ( = ?auto_10376 ?auto_10359 ) ) ( not ( = ?auto_10376 ?auto_10372 ) ) ( not ( = ?auto_10337 ?auto_10348 ) ) ( not ( = ?auto_10337 ?auto_10362 ) ) ( not ( = ?auto_10338 ?auto_10348 ) ) ( not ( = ?auto_10338 ?auto_10362 ) ) ( not ( = ?auto_10339 ?auto_10348 ) ) ( not ( = ?auto_10339 ?auto_10362 ) ) ( not ( = ?auto_10340 ?auto_10348 ) ) ( not ( = ?auto_10340 ?auto_10362 ) ) ( not ( = ?auto_10341 ?auto_10348 ) ) ( not ( = ?auto_10341 ?auto_10362 ) ) ( not ( = ?auto_10342 ?auto_10348 ) ) ( not ( = ?auto_10342 ?auto_10362 ) ) ( not ( = ?auto_10345 ?auto_10348 ) ) ( not ( = ?auto_10345 ?auto_10362 ) ) ( not ( = ?auto_10344 ?auto_10348 ) ) ( not ( = ?auto_10344 ?auto_10362 ) ) ( not ( = ?auto_10343 ?auto_10348 ) ) ( not ( = ?auto_10343 ?auto_10362 ) ) ( not ( = ?auto_10348 ?auto_10376 ) ) ( not ( = ?auto_10348 ?auto_10363 ) ) ( not ( = ?auto_10348 ?auto_10369 ) ) ( not ( = ?auto_10348 ?auto_10374 ) ) ( not ( = ?auto_10348 ?auto_10370 ) ) ( not ( = ?auto_10348 ?auto_10371 ) ) ( not ( = ?auto_10348 ?auto_10360 ) ) ( not ( = ?auto_10348 ?auto_10359 ) ) ( not ( = ?auto_10348 ?auto_10372 ) ) ( not ( = ?auto_10362 ?auto_10376 ) ) ( not ( = ?auto_10362 ?auto_10363 ) ) ( not ( = ?auto_10362 ?auto_10369 ) ) ( not ( = ?auto_10362 ?auto_10374 ) ) ( not ( = ?auto_10362 ?auto_10370 ) ) ( not ( = ?auto_10362 ?auto_10371 ) ) ( not ( = ?auto_10362 ?auto_10360 ) ) ( not ( = ?auto_10362 ?auto_10359 ) ) ( not ( = ?auto_10362 ?auto_10372 ) ) ( not ( = ?auto_10337 ?auto_10347 ) ) ( not ( = ?auto_10337 ?auto_10351 ) ) ( not ( = ?auto_10338 ?auto_10347 ) ) ( not ( = ?auto_10338 ?auto_10351 ) ) ( not ( = ?auto_10339 ?auto_10347 ) ) ( not ( = ?auto_10339 ?auto_10351 ) ) ( not ( = ?auto_10340 ?auto_10347 ) ) ( not ( = ?auto_10340 ?auto_10351 ) ) ( not ( = ?auto_10341 ?auto_10347 ) ) ( not ( = ?auto_10341 ?auto_10351 ) ) ( not ( = ?auto_10342 ?auto_10347 ) ) ( not ( = ?auto_10342 ?auto_10351 ) ) ( not ( = ?auto_10345 ?auto_10347 ) ) ( not ( = ?auto_10345 ?auto_10351 ) ) ( not ( = ?auto_10344 ?auto_10347 ) ) ( not ( = ?auto_10344 ?auto_10351 ) ) ( not ( = ?auto_10343 ?auto_10347 ) ) ( not ( = ?auto_10343 ?auto_10351 ) ) ( not ( = ?auto_10346 ?auto_10347 ) ) ( not ( = ?auto_10346 ?auto_10351 ) ) ( not ( = ?auto_10347 ?auto_10362 ) ) ( not ( = ?auto_10347 ?auto_10376 ) ) ( not ( = ?auto_10347 ?auto_10363 ) ) ( not ( = ?auto_10347 ?auto_10369 ) ) ( not ( = ?auto_10347 ?auto_10374 ) ) ( not ( = ?auto_10347 ?auto_10370 ) ) ( not ( = ?auto_10347 ?auto_10371 ) ) ( not ( = ?auto_10347 ?auto_10360 ) ) ( not ( = ?auto_10347 ?auto_10359 ) ) ( not ( = ?auto_10347 ?auto_10372 ) ) ( not ( = ?auto_10351 ?auto_10362 ) ) ( not ( = ?auto_10351 ?auto_10376 ) ) ( not ( = ?auto_10351 ?auto_10363 ) ) ( not ( = ?auto_10351 ?auto_10369 ) ) ( not ( = ?auto_10351 ?auto_10374 ) ) ( not ( = ?auto_10351 ?auto_10370 ) ) ( not ( = ?auto_10351 ?auto_10371 ) ) ( not ( = ?auto_10351 ?auto_10360 ) ) ( not ( = ?auto_10351 ?auto_10359 ) ) ( not ( = ?auto_10351 ?auto_10372 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_10337 ?auto_10338 ?auto_10339 ?auto_10340 ?auto_10341 ?auto_10342 ?auto_10345 ?auto_10344 ?auto_10343 ?auto_10346 ?auto_10348 )
      ( MAKE-1CRATE ?auto_10348 ?auto_10347 )
      ( MAKE-11CRATE-VERIFY ?auto_10337 ?auto_10338 ?auto_10339 ?auto_10340 ?auto_10341 ?auto_10342 ?auto_10345 ?auto_10344 ?auto_10343 ?auto_10346 ?auto_10348 ?auto_10347 ) )
  )

)

