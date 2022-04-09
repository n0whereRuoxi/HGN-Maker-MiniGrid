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

  ( :method MAKE-12CRATE-VERIFY
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
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22901 - SURFACE
      ?auto_22902 - SURFACE
    )
    :vars
    (
      ?auto_22903 - HOIST
      ?auto_22904 - PLACE
      ?auto_22906 - PLACE
      ?auto_22907 - HOIST
      ?auto_22908 - SURFACE
      ?auto_22905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22903 ?auto_22904 ) ( SURFACE-AT ?auto_22901 ?auto_22904 ) ( CLEAR ?auto_22901 ) ( IS-CRATE ?auto_22902 ) ( AVAILABLE ?auto_22903 ) ( not ( = ?auto_22906 ?auto_22904 ) ) ( HOIST-AT ?auto_22907 ?auto_22906 ) ( AVAILABLE ?auto_22907 ) ( SURFACE-AT ?auto_22902 ?auto_22906 ) ( ON ?auto_22902 ?auto_22908 ) ( CLEAR ?auto_22902 ) ( TRUCK-AT ?auto_22905 ?auto_22904 ) ( not ( = ?auto_22901 ?auto_22902 ) ) ( not ( = ?auto_22901 ?auto_22908 ) ) ( not ( = ?auto_22902 ?auto_22908 ) ) ( not ( = ?auto_22903 ?auto_22907 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22905 ?auto_22904 ?auto_22906 )
      ( !LIFT ?auto_22907 ?auto_22902 ?auto_22908 ?auto_22906 )
      ( !LOAD ?auto_22907 ?auto_22902 ?auto_22905 ?auto_22906 )
      ( !DRIVE ?auto_22905 ?auto_22906 ?auto_22904 )
      ( !UNLOAD ?auto_22903 ?auto_22902 ?auto_22905 ?auto_22904 )
      ( !DROP ?auto_22903 ?auto_22902 ?auto_22901 ?auto_22904 )
      ( MAKE-1CRATE-VERIFY ?auto_22901 ?auto_22902 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22922 - SURFACE
      ?auto_22923 - SURFACE
      ?auto_22924 - SURFACE
    )
    :vars
    (
      ?auto_22927 - HOIST
      ?auto_22930 - PLACE
      ?auto_22929 - PLACE
      ?auto_22925 - HOIST
      ?auto_22928 - SURFACE
      ?auto_22933 - PLACE
      ?auto_22931 - HOIST
      ?auto_22932 - SURFACE
      ?auto_22926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22927 ?auto_22930 ) ( IS-CRATE ?auto_22924 ) ( not ( = ?auto_22929 ?auto_22930 ) ) ( HOIST-AT ?auto_22925 ?auto_22929 ) ( AVAILABLE ?auto_22925 ) ( SURFACE-AT ?auto_22924 ?auto_22929 ) ( ON ?auto_22924 ?auto_22928 ) ( CLEAR ?auto_22924 ) ( not ( = ?auto_22923 ?auto_22924 ) ) ( not ( = ?auto_22923 ?auto_22928 ) ) ( not ( = ?auto_22924 ?auto_22928 ) ) ( not ( = ?auto_22927 ?auto_22925 ) ) ( SURFACE-AT ?auto_22922 ?auto_22930 ) ( CLEAR ?auto_22922 ) ( IS-CRATE ?auto_22923 ) ( AVAILABLE ?auto_22927 ) ( not ( = ?auto_22933 ?auto_22930 ) ) ( HOIST-AT ?auto_22931 ?auto_22933 ) ( AVAILABLE ?auto_22931 ) ( SURFACE-AT ?auto_22923 ?auto_22933 ) ( ON ?auto_22923 ?auto_22932 ) ( CLEAR ?auto_22923 ) ( TRUCK-AT ?auto_22926 ?auto_22930 ) ( not ( = ?auto_22922 ?auto_22923 ) ) ( not ( = ?auto_22922 ?auto_22932 ) ) ( not ( = ?auto_22923 ?auto_22932 ) ) ( not ( = ?auto_22927 ?auto_22931 ) ) ( not ( = ?auto_22922 ?auto_22924 ) ) ( not ( = ?auto_22922 ?auto_22928 ) ) ( not ( = ?auto_22924 ?auto_22932 ) ) ( not ( = ?auto_22929 ?auto_22933 ) ) ( not ( = ?auto_22925 ?auto_22931 ) ) ( not ( = ?auto_22928 ?auto_22932 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22922 ?auto_22923 )
      ( MAKE-1CRATE ?auto_22923 ?auto_22924 )
      ( MAKE-2CRATE-VERIFY ?auto_22922 ?auto_22923 ?auto_22924 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22948 - SURFACE
      ?auto_22949 - SURFACE
      ?auto_22950 - SURFACE
      ?auto_22951 - SURFACE
    )
    :vars
    (
      ?auto_22956 - HOIST
      ?auto_22954 - PLACE
      ?auto_22953 - PLACE
      ?auto_22952 - HOIST
      ?auto_22957 - SURFACE
      ?auto_22958 - PLACE
      ?auto_22959 - HOIST
      ?auto_22960 - SURFACE
      ?auto_22961 - PLACE
      ?auto_22963 - HOIST
      ?auto_22962 - SURFACE
      ?auto_22955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22956 ?auto_22954 ) ( IS-CRATE ?auto_22951 ) ( not ( = ?auto_22953 ?auto_22954 ) ) ( HOIST-AT ?auto_22952 ?auto_22953 ) ( AVAILABLE ?auto_22952 ) ( SURFACE-AT ?auto_22951 ?auto_22953 ) ( ON ?auto_22951 ?auto_22957 ) ( CLEAR ?auto_22951 ) ( not ( = ?auto_22950 ?auto_22951 ) ) ( not ( = ?auto_22950 ?auto_22957 ) ) ( not ( = ?auto_22951 ?auto_22957 ) ) ( not ( = ?auto_22956 ?auto_22952 ) ) ( IS-CRATE ?auto_22950 ) ( not ( = ?auto_22958 ?auto_22954 ) ) ( HOIST-AT ?auto_22959 ?auto_22958 ) ( AVAILABLE ?auto_22959 ) ( SURFACE-AT ?auto_22950 ?auto_22958 ) ( ON ?auto_22950 ?auto_22960 ) ( CLEAR ?auto_22950 ) ( not ( = ?auto_22949 ?auto_22950 ) ) ( not ( = ?auto_22949 ?auto_22960 ) ) ( not ( = ?auto_22950 ?auto_22960 ) ) ( not ( = ?auto_22956 ?auto_22959 ) ) ( SURFACE-AT ?auto_22948 ?auto_22954 ) ( CLEAR ?auto_22948 ) ( IS-CRATE ?auto_22949 ) ( AVAILABLE ?auto_22956 ) ( not ( = ?auto_22961 ?auto_22954 ) ) ( HOIST-AT ?auto_22963 ?auto_22961 ) ( AVAILABLE ?auto_22963 ) ( SURFACE-AT ?auto_22949 ?auto_22961 ) ( ON ?auto_22949 ?auto_22962 ) ( CLEAR ?auto_22949 ) ( TRUCK-AT ?auto_22955 ?auto_22954 ) ( not ( = ?auto_22948 ?auto_22949 ) ) ( not ( = ?auto_22948 ?auto_22962 ) ) ( not ( = ?auto_22949 ?auto_22962 ) ) ( not ( = ?auto_22956 ?auto_22963 ) ) ( not ( = ?auto_22948 ?auto_22950 ) ) ( not ( = ?auto_22948 ?auto_22960 ) ) ( not ( = ?auto_22950 ?auto_22962 ) ) ( not ( = ?auto_22958 ?auto_22961 ) ) ( not ( = ?auto_22959 ?auto_22963 ) ) ( not ( = ?auto_22960 ?auto_22962 ) ) ( not ( = ?auto_22948 ?auto_22951 ) ) ( not ( = ?auto_22948 ?auto_22957 ) ) ( not ( = ?auto_22949 ?auto_22951 ) ) ( not ( = ?auto_22949 ?auto_22957 ) ) ( not ( = ?auto_22951 ?auto_22960 ) ) ( not ( = ?auto_22951 ?auto_22962 ) ) ( not ( = ?auto_22953 ?auto_22958 ) ) ( not ( = ?auto_22953 ?auto_22961 ) ) ( not ( = ?auto_22952 ?auto_22959 ) ) ( not ( = ?auto_22952 ?auto_22963 ) ) ( not ( = ?auto_22957 ?auto_22960 ) ) ( not ( = ?auto_22957 ?auto_22962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22948 ?auto_22949 ?auto_22950 )
      ( MAKE-1CRATE ?auto_22950 ?auto_22951 )
      ( MAKE-3CRATE-VERIFY ?auto_22948 ?auto_22949 ?auto_22950 ?auto_22951 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22979 - SURFACE
      ?auto_22980 - SURFACE
      ?auto_22981 - SURFACE
      ?auto_22982 - SURFACE
      ?auto_22983 - SURFACE
    )
    :vars
    (
      ?auto_22988 - HOIST
      ?auto_22984 - PLACE
      ?auto_22987 - PLACE
      ?auto_22989 - HOIST
      ?auto_22985 - SURFACE
      ?auto_22997 - PLACE
      ?auto_22995 - HOIST
      ?auto_22996 - SURFACE
      ?auto_22994 - PLACE
      ?auto_22990 - HOIST
      ?auto_22993 - SURFACE
      ?auto_22991 - PLACE
      ?auto_22998 - HOIST
      ?auto_22992 - SURFACE
      ?auto_22986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22988 ?auto_22984 ) ( IS-CRATE ?auto_22983 ) ( not ( = ?auto_22987 ?auto_22984 ) ) ( HOIST-AT ?auto_22989 ?auto_22987 ) ( AVAILABLE ?auto_22989 ) ( SURFACE-AT ?auto_22983 ?auto_22987 ) ( ON ?auto_22983 ?auto_22985 ) ( CLEAR ?auto_22983 ) ( not ( = ?auto_22982 ?auto_22983 ) ) ( not ( = ?auto_22982 ?auto_22985 ) ) ( not ( = ?auto_22983 ?auto_22985 ) ) ( not ( = ?auto_22988 ?auto_22989 ) ) ( IS-CRATE ?auto_22982 ) ( not ( = ?auto_22997 ?auto_22984 ) ) ( HOIST-AT ?auto_22995 ?auto_22997 ) ( AVAILABLE ?auto_22995 ) ( SURFACE-AT ?auto_22982 ?auto_22997 ) ( ON ?auto_22982 ?auto_22996 ) ( CLEAR ?auto_22982 ) ( not ( = ?auto_22981 ?auto_22982 ) ) ( not ( = ?auto_22981 ?auto_22996 ) ) ( not ( = ?auto_22982 ?auto_22996 ) ) ( not ( = ?auto_22988 ?auto_22995 ) ) ( IS-CRATE ?auto_22981 ) ( not ( = ?auto_22994 ?auto_22984 ) ) ( HOIST-AT ?auto_22990 ?auto_22994 ) ( AVAILABLE ?auto_22990 ) ( SURFACE-AT ?auto_22981 ?auto_22994 ) ( ON ?auto_22981 ?auto_22993 ) ( CLEAR ?auto_22981 ) ( not ( = ?auto_22980 ?auto_22981 ) ) ( not ( = ?auto_22980 ?auto_22993 ) ) ( not ( = ?auto_22981 ?auto_22993 ) ) ( not ( = ?auto_22988 ?auto_22990 ) ) ( SURFACE-AT ?auto_22979 ?auto_22984 ) ( CLEAR ?auto_22979 ) ( IS-CRATE ?auto_22980 ) ( AVAILABLE ?auto_22988 ) ( not ( = ?auto_22991 ?auto_22984 ) ) ( HOIST-AT ?auto_22998 ?auto_22991 ) ( AVAILABLE ?auto_22998 ) ( SURFACE-AT ?auto_22980 ?auto_22991 ) ( ON ?auto_22980 ?auto_22992 ) ( CLEAR ?auto_22980 ) ( TRUCK-AT ?auto_22986 ?auto_22984 ) ( not ( = ?auto_22979 ?auto_22980 ) ) ( not ( = ?auto_22979 ?auto_22992 ) ) ( not ( = ?auto_22980 ?auto_22992 ) ) ( not ( = ?auto_22988 ?auto_22998 ) ) ( not ( = ?auto_22979 ?auto_22981 ) ) ( not ( = ?auto_22979 ?auto_22993 ) ) ( not ( = ?auto_22981 ?auto_22992 ) ) ( not ( = ?auto_22994 ?auto_22991 ) ) ( not ( = ?auto_22990 ?auto_22998 ) ) ( not ( = ?auto_22993 ?auto_22992 ) ) ( not ( = ?auto_22979 ?auto_22982 ) ) ( not ( = ?auto_22979 ?auto_22996 ) ) ( not ( = ?auto_22980 ?auto_22982 ) ) ( not ( = ?auto_22980 ?auto_22996 ) ) ( not ( = ?auto_22982 ?auto_22993 ) ) ( not ( = ?auto_22982 ?auto_22992 ) ) ( not ( = ?auto_22997 ?auto_22994 ) ) ( not ( = ?auto_22997 ?auto_22991 ) ) ( not ( = ?auto_22995 ?auto_22990 ) ) ( not ( = ?auto_22995 ?auto_22998 ) ) ( not ( = ?auto_22996 ?auto_22993 ) ) ( not ( = ?auto_22996 ?auto_22992 ) ) ( not ( = ?auto_22979 ?auto_22983 ) ) ( not ( = ?auto_22979 ?auto_22985 ) ) ( not ( = ?auto_22980 ?auto_22983 ) ) ( not ( = ?auto_22980 ?auto_22985 ) ) ( not ( = ?auto_22981 ?auto_22983 ) ) ( not ( = ?auto_22981 ?auto_22985 ) ) ( not ( = ?auto_22983 ?auto_22996 ) ) ( not ( = ?auto_22983 ?auto_22993 ) ) ( not ( = ?auto_22983 ?auto_22992 ) ) ( not ( = ?auto_22987 ?auto_22997 ) ) ( not ( = ?auto_22987 ?auto_22994 ) ) ( not ( = ?auto_22987 ?auto_22991 ) ) ( not ( = ?auto_22989 ?auto_22995 ) ) ( not ( = ?auto_22989 ?auto_22990 ) ) ( not ( = ?auto_22989 ?auto_22998 ) ) ( not ( = ?auto_22985 ?auto_22996 ) ) ( not ( = ?auto_22985 ?auto_22993 ) ) ( not ( = ?auto_22985 ?auto_22992 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_22979 ?auto_22980 ?auto_22981 ?auto_22982 )
      ( MAKE-1CRATE ?auto_22982 ?auto_22983 )
      ( MAKE-4CRATE-VERIFY ?auto_22979 ?auto_22980 ?auto_22981 ?auto_22982 ?auto_22983 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23015 - SURFACE
      ?auto_23016 - SURFACE
      ?auto_23017 - SURFACE
      ?auto_23018 - SURFACE
      ?auto_23019 - SURFACE
      ?auto_23020 - SURFACE
    )
    :vars
    (
      ?auto_23026 - HOIST
      ?auto_23024 - PLACE
      ?auto_23023 - PLACE
      ?auto_23022 - HOIST
      ?auto_23021 - SURFACE
      ?auto_23038 - PLACE
      ?auto_23037 - HOIST
      ?auto_23028 - SURFACE
      ?auto_23036 - PLACE
      ?auto_23035 - HOIST
      ?auto_23034 - SURFACE
      ?auto_23029 - PLACE
      ?auto_23032 - HOIST
      ?auto_23030 - SURFACE
      ?auto_23031 - PLACE
      ?auto_23027 - HOIST
      ?auto_23033 - SURFACE
      ?auto_23025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23026 ?auto_23024 ) ( IS-CRATE ?auto_23020 ) ( not ( = ?auto_23023 ?auto_23024 ) ) ( HOIST-AT ?auto_23022 ?auto_23023 ) ( AVAILABLE ?auto_23022 ) ( SURFACE-AT ?auto_23020 ?auto_23023 ) ( ON ?auto_23020 ?auto_23021 ) ( CLEAR ?auto_23020 ) ( not ( = ?auto_23019 ?auto_23020 ) ) ( not ( = ?auto_23019 ?auto_23021 ) ) ( not ( = ?auto_23020 ?auto_23021 ) ) ( not ( = ?auto_23026 ?auto_23022 ) ) ( IS-CRATE ?auto_23019 ) ( not ( = ?auto_23038 ?auto_23024 ) ) ( HOIST-AT ?auto_23037 ?auto_23038 ) ( AVAILABLE ?auto_23037 ) ( SURFACE-AT ?auto_23019 ?auto_23038 ) ( ON ?auto_23019 ?auto_23028 ) ( CLEAR ?auto_23019 ) ( not ( = ?auto_23018 ?auto_23019 ) ) ( not ( = ?auto_23018 ?auto_23028 ) ) ( not ( = ?auto_23019 ?auto_23028 ) ) ( not ( = ?auto_23026 ?auto_23037 ) ) ( IS-CRATE ?auto_23018 ) ( not ( = ?auto_23036 ?auto_23024 ) ) ( HOIST-AT ?auto_23035 ?auto_23036 ) ( AVAILABLE ?auto_23035 ) ( SURFACE-AT ?auto_23018 ?auto_23036 ) ( ON ?auto_23018 ?auto_23034 ) ( CLEAR ?auto_23018 ) ( not ( = ?auto_23017 ?auto_23018 ) ) ( not ( = ?auto_23017 ?auto_23034 ) ) ( not ( = ?auto_23018 ?auto_23034 ) ) ( not ( = ?auto_23026 ?auto_23035 ) ) ( IS-CRATE ?auto_23017 ) ( not ( = ?auto_23029 ?auto_23024 ) ) ( HOIST-AT ?auto_23032 ?auto_23029 ) ( AVAILABLE ?auto_23032 ) ( SURFACE-AT ?auto_23017 ?auto_23029 ) ( ON ?auto_23017 ?auto_23030 ) ( CLEAR ?auto_23017 ) ( not ( = ?auto_23016 ?auto_23017 ) ) ( not ( = ?auto_23016 ?auto_23030 ) ) ( not ( = ?auto_23017 ?auto_23030 ) ) ( not ( = ?auto_23026 ?auto_23032 ) ) ( SURFACE-AT ?auto_23015 ?auto_23024 ) ( CLEAR ?auto_23015 ) ( IS-CRATE ?auto_23016 ) ( AVAILABLE ?auto_23026 ) ( not ( = ?auto_23031 ?auto_23024 ) ) ( HOIST-AT ?auto_23027 ?auto_23031 ) ( AVAILABLE ?auto_23027 ) ( SURFACE-AT ?auto_23016 ?auto_23031 ) ( ON ?auto_23016 ?auto_23033 ) ( CLEAR ?auto_23016 ) ( TRUCK-AT ?auto_23025 ?auto_23024 ) ( not ( = ?auto_23015 ?auto_23016 ) ) ( not ( = ?auto_23015 ?auto_23033 ) ) ( not ( = ?auto_23016 ?auto_23033 ) ) ( not ( = ?auto_23026 ?auto_23027 ) ) ( not ( = ?auto_23015 ?auto_23017 ) ) ( not ( = ?auto_23015 ?auto_23030 ) ) ( not ( = ?auto_23017 ?auto_23033 ) ) ( not ( = ?auto_23029 ?auto_23031 ) ) ( not ( = ?auto_23032 ?auto_23027 ) ) ( not ( = ?auto_23030 ?auto_23033 ) ) ( not ( = ?auto_23015 ?auto_23018 ) ) ( not ( = ?auto_23015 ?auto_23034 ) ) ( not ( = ?auto_23016 ?auto_23018 ) ) ( not ( = ?auto_23016 ?auto_23034 ) ) ( not ( = ?auto_23018 ?auto_23030 ) ) ( not ( = ?auto_23018 ?auto_23033 ) ) ( not ( = ?auto_23036 ?auto_23029 ) ) ( not ( = ?auto_23036 ?auto_23031 ) ) ( not ( = ?auto_23035 ?auto_23032 ) ) ( not ( = ?auto_23035 ?auto_23027 ) ) ( not ( = ?auto_23034 ?auto_23030 ) ) ( not ( = ?auto_23034 ?auto_23033 ) ) ( not ( = ?auto_23015 ?auto_23019 ) ) ( not ( = ?auto_23015 ?auto_23028 ) ) ( not ( = ?auto_23016 ?auto_23019 ) ) ( not ( = ?auto_23016 ?auto_23028 ) ) ( not ( = ?auto_23017 ?auto_23019 ) ) ( not ( = ?auto_23017 ?auto_23028 ) ) ( not ( = ?auto_23019 ?auto_23034 ) ) ( not ( = ?auto_23019 ?auto_23030 ) ) ( not ( = ?auto_23019 ?auto_23033 ) ) ( not ( = ?auto_23038 ?auto_23036 ) ) ( not ( = ?auto_23038 ?auto_23029 ) ) ( not ( = ?auto_23038 ?auto_23031 ) ) ( not ( = ?auto_23037 ?auto_23035 ) ) ( not ( = ?auto_23037 ?auto_23032 ) ) ( not ( = ?auto_23037 ?auto_23027 ) ) ( not ( = ?auto_23028 ?auto_23034 ) ) ( not ( = ?auto_23028 ?auto_23030 ) ) ( not ( = ?auto_23028 ?auto_23033 ) ) ( not ( = ?auto_23015 ?auto_23020 ) ) ( not ( = ?auto_23015 ?auto_23021 ) ) ( not ( = ?auto_23016 ?auto_23020 ) ) ( not ( = ?auto_23016 ?auto_23021 ) ) ( not ( = ?auto_23017 ?auto_23020 ) ) ( not ( = ?auto_23017 ?auto_23021 ) ) ( not ( = ?auto_23018 ?auto_23020 ) ) ( not ( = ?auto_23018 ?auto_23021 ) ) ( not ( = ?auto_23020 ?auto_23028 ) ) ( not ( = ?auto_23020 ?auto_23034 ) ) ( not ( = ?auto_23020 ?auto_23030 ) ) ( not ( = ?auto_23020 ?auto_23033 ) ) ( not ( = ?auto_23023 ?auto_23038 ) ) ( not ( = ?auto_23023 ?auto_23036 ) ) ( not ( = ?auto_23023 ?auto_23029 ) ) ( not ( = ?auto_23023 ?auto_23031 ) ) ( not ( = ?auto_23022 ?auto_23037 ) ) ( not ( = ?auto_23022 ?auto_23035 ) ) ( not ( = ?auto_23022 ?auto_23032 ) ) ( not ( = ?auto_23022 ?auto_23027 ) ) ( not ( = ?auto_23021 ?auto_23028 ) ) ( not ( = ?auto_23021 ?auto_23034 ) ) ( not ( = ?auto_23021 ?auto_23030 ) ) ( not ( = ?auto_23021 ?auto_23033 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_23015 ?auto_23016 ?auto_23017 ?auto_23018 ?auto_23019 )
      ( MAKE-1CRATE ?auto_23019 ?auto_23020 )
      ( MAKE-5CRATE-VERIFY ?auto_23015 ?auto_23016 ?auto_23017 ?auto_23018 ?auto_23019 ?auto_23020 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_23056 - SURFACE
      ?auto_23057 - SURFACE
      ?auto_23058 - SURFACE
      ?auto_23059 - SURFACE
      ?auto_23060 - SURFACE
      ?auto_23061 - SURFACE
      ?auto_23062 - SURFACE
    )
    :vars
    (
      ?auto_23068 - HOIST
      ?auto_23064 - PLACE
      ?auto_23067 - PLACE
      ?auto_23065 - HOIST
      ?auto_23063 - SURFACE
      ?auto_23078 - PLACE
      ?auto_23074 - HOIST
      ?auto_23075 - SURFACE
      ?auto_23083 - PLACE
      ?auto_23077 - HOIST
      ?auto_23076 - SURFACE
      ?auto_23073 - PLACE
      ?auto_23082 - HOIST
      ?auto_23081 - SURFACE
      ?auto_23080 - PLACE
      ?auto_23070 - HOIST
      ?auto_23069 - SURFACE
      ?auto_23071 - PLACE
      ?auto_23079 - HOIST
      ?auto_23072 - SURFACE
      ?auto_23066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23068 ?auto_23064 ) ( IS-CRATE ?auto_23062 ) ( not ( = ?auto_23067 ?auto_23064 ) ) ( HOIST-AT ?auto_23065 ?auto_23067 ) ( AVAILABLE ?auto_23065 ) ( SURFACE-AT ?auto_23062 ?auto_23067 ) ( ON ?auto_23062 ?auto_23063 ) ( CLEAR ?auto_23062 ) ( not ( = ?auto_23061 ?auto_23062 ) ) ( not ( = ?auto_23061 ?auto_23063 ) ) ( not ( = ?auto_23062 ?auto_23063 ) ) ( not ( = ?auto_23068 ?auto_23065 ) ) ( IS-CRATE ?auto_23061 ) ( not ( = ?auto_23078 ?auto_23064 ) ) ( HOIST-AT ?auto_23074 ?auto_23078 ) ( AVAILABLE ?auto_23074 ) ( SURFACE-AT ?auto_23061 ?auto_23078 ) ( ON ?auto_23061 ?auto_23075 ) ( CLEAR ?auto_23061 ) ( not ( = ?auto_23060 ?auto_23061 ) ) ( not ( = ?auto_23060 ?auto_23075 ) ) ( not ( = ?auto_23061 ?auto_23075 ) ) ( not ( = ?auto_23068 ?auto_23074 ) ) ( IS-CRATE ?auto_23060 ) ( not ( = ?auto_23083 ?auto_23064 ) ) ( HOIST-AT ?auto_23077 ?auto_23083 ) ( AVAILABLE ?auto_23077 ) ( SURFACE-AT ?auto_23060 ?auto_23083 ) ( ON ?auto_23060 ?auto_23076 ) ( CLEAR ?auto_23060 ) ( not ( = ?auto_23059 ?auto_23060 ) ) ( not ( = ?auto_23059 ?auto_23076 ) ) ( not ( = ?auto_23060 ?auto_23076 ) ) ( not ( = ?auto_23068 ?auto_23077 ) ) ( IS-CRATE ?auto_23059 ) ( not ( = ?auto_23073 ?auto_23064 ) ) ( HOIST-AT ?auto_23082 ?auto_23073 ) ( AVAILABLE ?auto_23082 ) ( SURFACE-AT ?auto_23059 ?auto_23073 ) ( ON ?auto_23059 ?auto_23081 ) ( CLEAR ?auto_23059 ) ( not ( = ?auto_23058 ?auto_23059 ) ) ( not ( = ?auto_23058 ?auto_23081 ) ) ( not ( = ?auto_23059 ?auto_23081 ) ) ( not ( = ?auto_23068 ?auto_23082 ) ) ( IS-CRATE ?auto_23058 ) ( not ( = ?auto_23080 ?auto_23064 ) ) ( HOIST-AT ?auto_23070 ?auto_23080 ) ( AVAILABLE ?auto_23070 ) ( SURFACE-AT ?auto_23058 ?auto_23080 ) ( ON ?auto_23058 ?auto_23069 ) ( CLEAR ?auto_23058 ) ( not ( = ?auto_23057 ?auto_23058 ) ) ( not ( = ?auto_23057 ?auto_23069 ) ) ( not ( = ?auto_23058 ?auto_23069 ) ) ( not ( = ?auto_23068 ?auto_23070 ) ) ( SURFACE-AT ?auto_23056 ?auto_23064 ) ( CLEAR ?auto_23056 ) ( IS-CRATE ?auto_23057 ) ( AVAILABLE ?auto_23068 ) ( not ( = ?auto_23071 ?auto_23064 ) ) ( HOIST-AT ?auto_23079 ?auto_23071 ) ( AVAILABLE ?auto_23079 ) ( SURFACE-AT ?auto_23057 ?auto_23071 ) ( ON ?auto_23057 ?auto_23072 ) ( CLEAR ?auto_23057 ) ( TRUCK-AT ?auto_23066 ?auto_23064 ) ( not ( = ?auto_23056 ?auto_23057 ) ) ( not ( = ?auto_23056 ?auto_23072 ) ) ( not ( = ?auto_23057 ?auto_23072 ) ) ( not ( = ?auto_23068 ?auto_23079 ) ) ( not ( = ?auto_23056 ?auto_23058 ) ) ( not ( = ?auto_23056 ?auto_23069 ) ) ( not ( = ?auto_23058 ?auto_23072 ) ) ( not ( = ?auto_23080 ?auto_23071 ) ) ( not ( = ?auto_23070 ?auto_23079 ) ) ( not ( = ?auto_23069 ?auto_23072 ) ) ( not ( = ?auto_23056 ?auto_23059 ) ) ( not ( = ?auto_23056 ?auto_23081 ) ) ( not ( = ?auto_23057 ?auto_23059 ) ) ( not ( = ?auto_23057 ?auto_23081 ) ) ( not ( = ?auto_23059 ?auto_23069 ) ) ( not ( = ?auto_23059 ?auto_23072 ) ) ( not ( = ?auto_23073 ?auto_23080 ) ) ( not ( = ?auto_23073 ?auto_23071 ) ) ( not ( = ?auto_23082 ?auto_23070 ) ) ( not ( = ?auto_23082 ?auto_23079 ) ) ( not ( = ?auto_23081 ?auto_23069 ) ) ( not ( = ?auto_23081 ?auto_23072 ) ) ( not ( = ?auto_23056 ?auto_23060 ) ) ( not ( = ?auto_23056 ?auto_23076 ) ) ( not ( = ?auto_23057 ?auto_23060 ) ) ( not ( = ?auto_23057 ?auto_23076 ) ) ( not ( = ?auto_23058 ?auto_23060 ) ) ( not ( = ?auto_23058 ?auto_23076 ) ) ( not ( = ?auto_23060 ?auto_23081 ) ) ( not ( = ?auto_23060 ?auto_23069 ) ) ( not ( = ?auto_23060 ?auto_23072 ) ) ( not ( = ?auto_23083 ?auto_23073 ) ) ( not ( = ?auto_23083 ?auto_23080 ) ) ( not ( = ?auto_23083 ?auto_23071 ) ) ( not ( = ?auto_23077 ?auto_23082 ) ) ( not ( = ?auto_23077 ?auto_23070 ) ) ( not ( = ?auto_23077 ?auto_23079 ) ) ( not ( = ?auto_23076 ?auto_23081 ) ) ( not ( = ?auto_23076 ?auto_23069 ) ) ( not ( = ?auto_23076 ?auto_23072 ) ) ( not ( = ?auto_23056 ?auto_23061 ) ) ( not ( = ?auto_23056 ?auto_23075 ) ) ( not ( = ?auto_23057 ?auto_23061 ) ) ( not ( = ?auto_23057 ?auto_23075 ) ) ( not ( = ?auto_23058 ?auto_23061 ) ) ( not ( = ?auto_23058 ?auto_23075 ) ) ( not ( = ?auto_23059 ?auto_23061 ) ) ( not ( = ?auto_23059 ?auto_23075 ) ) ( not ( = ?auto_23061 ?auto_23076 ) ) ( not ( = ?auto_23061 ?auto_23081 ) ) ( not ( = ?auto_23061 ?auto_23069 ) ) ( not ( = ?auto_23061 ?auto_23072 ) ) ( not ( = ?auto_23078 ?auto_23083 ) ) ( not ( = ?auto_23078 ?auto_23073 ) ) ( not ( = ?auto_23078 ?auto_23080 ) ) ( not ( = ?auto_23078 ?auto_23071 ) ) ( not ( = ?auto_23074 ?auto_23077 ) ) ( not ( = ?auto_23074 ?auto_23082 ) ) ( not ( = ?auto_23074 ?auto_23070 ) ) ( not ( = ?auto_23074 ?auto_23079 ) ) ( not ( = ?auto_23075 ?auto_23076 ) ) ( not ( = ?auto_23075 ?auto_23081 ) ) ( not ( = ?auto_23075 ?auto_23069 ) ) ( not ( = ?auto_23075 ?auto_23072 ) ) ( not ( = ?auto_23056 ?auto_23062 ) ) ( not ( = ?auto_23056 ?auto_23063 ) ) ( not ( = ?auto_23057 ?auto_23062 ) ) ( not ( = ?auto_23057 ?auto_23063 ) ) ( not ( = ?auto_23058 ?auto_23062 ) ) ( not ( = ?auto_23058 ?auto_23063 ) ) ( not ( = ?auto_23059 ?auto_23062 ) ) ( not ( = ?auto_23059 ?auto_23063 ) ) ( not ( = ?auto_23060 ?auto_23062 ) ) ( not ( = ?auto_23060 ?auto_23063 ) ) ( not ( = ?auto_23062 ?auto_23075 ) ) ( not ( = ?auto_23062 ?auto_23076 ) ) ( not ( = ?auto_23062 ?auto_23081 ) ) ( not ( = ?auto_23062 ?auto_23069 ) ) ( not ( = ?auto_23062 ?auto_23072 ) ) ( not ( = ?auto_23067 ?auto_23078 ) ) ( not ( = ?auto_23067 ?auto_23083 ) ) ( not ( = ?auto_23067 ?auto_23073 ) ) ( not ( = ?auto_23067 ?auto_23080 ) ) ( not ( = ?auto_23067 ?auto_23071 ) ) ( not ( = ?auto_23065 ?auto_23074 ) ) ( not ( = ?auto_23065 ?auto_23077 ) ) ( not ( = ?auto_23065 ?auto_23082 ) ) ( not ( = ?auto_23065 ?auto_23070 ) ) ( not ( = ?auto_23065 ?auto_23079 ) ) ( not ( = ?auto_23063 ?auto_23075 ) ) ( not ( = ?auto_23063 ?auto_23076 ) ) ( not ( = ?auto_23063 ?auto_23081 ) ) ( not ( = ?auto_23063 ?auto_23069 ) ) ( not ( = ?auto_23063 ?auto_23072 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_23056 ?auto_23057 ?auto_23058 ?auto_23059 ?auto_23060 ?auto_23061 )
      ( MAKE-1CRATE ?auto_23061 ?auto_23062 )
      ( MAKE-6CRATE-VERIFY ?auto_23056 ?auto_23057 ?auto_23058 ?auto_23059 ?auto_23060 ?auto_23061 ?auto_23062 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_23102 - SURFACE
      ?auto_23103 - SURFACE
      ?auto_23104 - SURFACE
      ?auto_23105 - SURFACE
      ?auto_23106 - SURFACE
      ?auto_23107 - SURFACE
      ?auto_23108 - SURFACE
      ?auto_23109 - SURFACE
    )
    :vars
    (
      ?auto_23110 - HOIST
      ?auto_23115 - PLACE
      ?auto_23112 - PLACE
      ?auto_23114 - HOIST
      ?auto_23113 - SURFACE
      ?auto_23116 - PLACE
      ?auto_23124 - HOIST
      ?auto_23127 - SURFACE
      ?auto_23121 - PLACE
      ?auto_23118 - HOIST
      ?auto_23130 - SURFACE
      ?auto_23128 - PLACE
      ?auto_23123 - HOIST
      ?auto_23119 - SURFACE
      ?auto_23125 - SURFACE
      ?auto_23131 - PLACE
      ?auto_23120 - HOIST
      ?auto_23126 - SURFACE
      ?auto_23122 - PLACE
      ?auto_23117 - HOIST
      ?auto_23129 - SURFACE
      ?auto_23111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23110 ?auto_23115 ) ( IS-CRATE ?auto_23109 ) ( not ( = ?auto_23112 ?auto_23115 ) ) ( HOIST-AT ?auto_23114 ?auto_23112 ) ( SURFACE-AT ?auto_23109 ?auto_23112 ) ( ON ?auto_23109 ?auto_23113 ) ( CLEAR ?auto_23109 ) ( not ( = ?auto_23108 ?auto_23109 ) ) ( not ( = ?auto_23108 ?auto_23113 ) ) ( not ( = ?auto_23109 ?auto_23113 ) ) ( not ( = ?auto_23110 ?auto_23114 ) ) ( IS-CRATE ?auto_23108 ) ( not ( = ?auto_23116 ?auto_23115 ) ) ( HOIST-AT ?auto_23124 ?auto_23116 ) ( AVAILABLE ?auto_23124 ) ( SURFACE-AT ?auto_23108 ?auto_23116 ) ( ON ?auto_23108 ?auto_23127 ) ( CLEAR ?auto_23108 ) ( not ( = ?auto_23107 ?auto_23108 ) ) ( not ( = ?auto_23107 ?auto_23127 ) ) ( not ( = ?auto_23108 ?auto_23127 ) ) ( not ( = ?auto_23110 ?auto_23124 ) ) ( IS-CRATE ?auto_23107 ) ( not ( = ?auto_23121 ?auto_23115 ) ) ( HOIST-AT ?auto_23118 ?auto_23121 ) ( AVAILABLE ?auto_23118 ) ( SURFACE-AT ?auto_23107 ?auto_23121 ) ( ON ?auto_23107 ?auto_23130 ) ( CLEAR ?auto_23107 ) ( not ( = ?auto_23106 ?auto_23107 ) ) ( not ( = ?auto_23106 ?auto_23130 ) ) ( not ( = ?auto_23107 ?auto_23130 ) ) ( not ( = ?auto_23110 ?auto_23118 ) ) ( IS-CRATE ?auto_23106 ) ( not ( = ?auto_23128 ?auto_23115 ) ) ( HOIST-AT ?auto_23123 ?auto_23128 ) ( AVAILABLE ?auto_23123 ) ( SURFACE-AT ?auto_23106 ?auto_23128 ) ( ON ?auto_23106 ?auto_23119 ) ( CLEAR ?auto_23106 ) ( not ( = ?auto_23105 ?auto_23106 ) ) ( not ( = ?auto_23105 ?auto_23119 ) ) ( not ( = ?auto_23106 ?auto_23119 ) ) ( not ( = ?auto_23110 ?auto_23123 ) ) ( IS-CRATE ?auto_23105 ) ( AVAILABLE ?auto_23114 ) ( SURFACE-AT ?auto_23105 ?auto_23112 ) ( ON ?auto_23105 ?auto_23125 ) ( CLEAR ?auto_23105 ) ( not ( = ?auto_23104 ?auto_23105 ) ) ( not ( = ?auto_23104 ?auto_23125 ) ) ( not ( = ?auto_23105 ?auto_23125 ) ) ( IS-CRATE ?auto_23104 ) ( not ( = ?auto_23131 ?auto_23115 ) ) ( HOIST-AT ?auto_23120 ?auto_23131 ) ( AVAILABLE ?auto_23120 ) ( SURFACE-AT ?auto_23104 ?auto_23131 ) ( ON ?auto_23104 ?auto_23126 ) ( CLEAR ?auto_23104 ) ( not ( = ?auto_23103 ?auto_23104 ) ) ( not ( = ?auto_23103 ?auto_23126 ) ) ( not ( = ?auto_23104 ?auto_23126 ) ) ( not ( = ?auto_23110 ?auto_23120 ) ) ( SURFACE-AT ?auto_23102 ?auto_23115 ) ( CLEAR ?auto_23102 ) ( IS-CRATE ?auto_23103 ) ( AVAILABLE ?auto_23110 ) ( not ( = ?auto_23122 ?auto_23115 ) ) ( HOIST-AT ?auto_23117 ?auto_23122 ) ( AVAILABLE ?auto_23117 ) ( SURFACE-AT ?auto_23103 ?auto_23122 ) ( ON ?auto_23103 ?auto_23129 ) ( CLEAR ?auto_23103 ) ( TRUCK-AT ?auto_23111 ?auto_23115 ) ( not ( = ?auto_23102 ?auto_23103 ) ) ( not ( = ?auto_23102 ?auto_23129 ) ) ( not ( = ?auto_23103 ?auto_23129 ) ) ( not ( = ?auto_23110 ?auto_23117 ) ) ( not ( = ?auto_23102 ?auto_23104 ) ) ( not ( = ?auto_23102 ?auto_23126 ) ) ( not ( = ?auto_23104 ?auto_23129 ) ) ( not ( = ?auto_23131 ?auto_23122 ) ) ( not ( = ?auto_23120 ?auto_23117 ) ) ( not ( = ?auto_23126 ?auto_23129 ) ) ( not ( = ?auto_23102 ?auto_23105 ) ) ( not ( = ?auto_23102 ?auto_23125 ) ) ( not ( = ?auto_23103 ?auto_23105 ) ) ( not ( = ?auto_23103 ?auto_23125 ) ) ( not ( = ?auto_23105 ?auto_23126 ) ) ( not ( = ?auto_23105 ?auto_23129 ) ) ( not ( = ?auto_23112 ?auto_23131 ) ) ( not ( = ?auto_23112 ?auto_23122 ) ) ( not ( = ?auto_23114 ?auto_23120 ) ) ( not ( = ?auto_23114 ?auto_23117 ) ) ( not ( = ?auto_23125 ?auto_23126 ) ) ( not ( = ?auto_23125 ?auto_23129 ) ) ( not ( = ?auto_23102 ?auto_23106 ) ) ( not ( = ?auto_23102 ?auto_23119 ) ) ( not ( = ?auto_23103 ?auto_23106 ) ) ( not ( = ?auto_23103 ?auto_23119 ) ) ( not ( = ?auto_23104 ?auto_23106 ) ) ( not ( = ?auto_23104 ?auto_23119 ) ) ( not ( = ?auto_23106 ?auto_23125 ) ) ( not ( = ?auto_23106 ?auto_23126 ) ) ( not ( = ?auto_23106 ?auto_23129 ) ) ( not ( = ?auto_23128 ?auto_23112 ) ) ( not ( = ?auto_23128 ?auto_23131 ) ) ( not ( = ?auto_23128 ?auto_23122 ) ) ( not ( = ?auto_23123 ?auto_23114 ) ) ( not ( = ?auto_23123 ?auto_23120 ) ) ( not ( = ?auto_23123 ?auto_23117 ) ) ( not ( = ?auto_23119 ?auto_23125 ) ) ( not ( = ?auto_23119 ?auto_23126 ) ) ( not ( = ?auto_23119 ?auto_23129 ) ) ( not ( = ?auto_23102 ?auto_23107 ) ) ( not ( = ?auto_23102 ?auto_23130 ) ) ( not ( = ?auto_23103 ?auto_23107 ) ) ( not ( = ?auto_23103 ?auto_23130 ) ) ( not ( = ?auto_23104 ?auto_23107 ) ) ( not ( = ?auto_23104 ?auto_23130 ) ) ( not ( = ?auto_23105 ?auto_23107 ) ) ( not ( = ?auto_23105 ?auto_23130 ) ) ( not ( = ?auto_23107 ?auto_23119 ) ) ( not ( = ?auto_23107 ?auto_23125 ) ) ( not ( = ?auto_23107 ?auto_23126 ) ) ( not ( = ?auto_23107 ?auto_23129 ) ) ( not ( = ?auto_23121 ?auto_23128 ) ) ( not ( = ?auto_23121 ?auto_23112 ) ) ( not ( = ?auto_23121 ?auto_23131 ) ) ( not ( = ?auto_23121 ?auto_23122 ) ) ( not ( = ?auto_23118 ?auto_23123 ) ) ( not ( = ?auto_23118 ?auto_23114 ) ) ( not ( = ?auto_23118 ?auto_23120 ) ) ( not ( = ?auto_23118 ?auto_23117 ) ) ( not ( = ?auto_23130 ?auto_23119 ) ) ( not ( = ?auto_23130 ?auto_23125 ) ) ( not ( = ?auto_23130 ?auto_23126 ) ) ( not ( = ?auto_23130 ?auto_23129 ) ) ( not ( = ?auto_23102 ?auto_23108 ) ) ( not ( = ?auto_23102 ?auto_23127 ) ) ( not ( = ?auto_23103 ?auto_23108 ) ) ( not ( = ?auto_23103 ?auto_23127 ) ) ( not ( = ?auto_23104 ?auto_23108 ) ) ( not ( = ?auto_23104 ?auto_23127 ) ) ( not ( = ?auto_23105 ?auto_23108 ) ) ( not ( = ?auto_23105 ?auto_23127 ) ) ( not ( = ?auto_23106 ?auto_23108 ) ) ( not ( = ?auto_23106 ?auto_23127 ) ) ( not ( = ?auto_23108 ?auto_23130 ) ) ( not ( = ?auto_23108 ?auto_23119 ) ) ( not ( = ?auto_23108 ?auto_23125 ) ) ( not ( = ?auto_23108 ?auto_23126 ) ) ( not ( = ?auto_23108 ?auto_23129 ) ) ( not ( = ?auto_23116 ?auto_23121 ) ) ( not ( = ?auto_23116 ?auto_23128 ) ) ( not ( = ?auto_23116 ?auto_23112 ) ) ( not ( = ?auto_23116 ?auto_23131 ) ) ( not ( = ?auto_23116 ?auto_23122 ) ) ( not ( = ?auto_23124 ?auto_23118 ) ) ( not ( = ?auto_23124 ?auto_23123 ) ) ( not ( = ?auto_23124 ?auto_23114 ) ) ( not ( = ?auto_23124 ?auto_23120 ) ) ( not ( = ?auto_23124 ?auto_23117 ) ) ( not ( = ?auto_23127 ?auto_23130 ) ) ( not ( = ?auto_23127 ?auto_23119 ) ) ( not ( = ?auto_23127 ?auto_23125 ) ) ( not ( = ?auto_23127 ?auto_23126 ) ) ( not ( = ?auto_23127 ?auto_23129 ) ) ( not ( = ?auto_23102 ?auto_23109 ) ) ( not ( = ?auto_23102 ?auto_23113 ) ) ( not ( = ?auto_23103 ?auto_23109 ) ) ( not ( = ?auto_23103 ?auto_23113 ) ) ( not ( = ?auto_23104 ?auto_23109 ) ) ( not ( = ?auto_23104 ?auto_23113 ) ) ( not ( = ?auto_23105 ?auto_23109 ) ) ( not ( = ?auto_23105 ?auto_23113 ) ) ( not ( = ?auto_23106 ?auto_23109 ) ) ( not ( = ?auto_23106 ?auto_23113 ) ) ( not ( = ?auto_23107 ?auto_23109 ) ) ( not ( = ?auto_23107 ?auto_23113 ) ) ( not ( = ?auto_23109 ?auto_23127 ) ) ( not ( = ?auto_23109 ?auto_23130 ) ) ( not ( = ?auto_23109 ?auto_23119 ) ) ( not ( = ?auto_23109 ?auto_23125 ) ) ( not ( = ?auto_23109 ?auto_23126 ) ) ( not ( = ?auto_23109 ?auto_23129 ) ) ( not ( = ?auto_23113 ?auto_23127 ) ) ( not ( = ?auto_23113 ?auto_23130 ) ) ( not ( = ?auto_23113 ?auto_23119 ) ) ( not ( = ?auto_23113 ?auto_23125 ) ) ( not ( = ?auto_23113 ?auto_23126 ) ) ( not ( = ?auto_23113 ?auto_23129 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_23102 ?auto_23103 ?auto_23104 ?auto_23105 ?auto_23106 ?auto_23107 ?auto_23108 )
      ( MAKE-1CRATE ?auto_23108 ?auto_23109 )
      ( MAKE-7CRATE-VERIFY ?auto_23102 ?auto_23103 ?auto_23104 ?auto_23105 ?auto_23106 ?auto_23107 ?auto_23108 ?auto_23109 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_23151 - SURFACE
      ?auto_23152 - SURFACE
      ?auto_23153 - SURFACE
      ?auto_23154 - SURFACE
      ?auto_23155 - SURFACE
      ?auto_23156 - SURFACE
      ?auto_23157 - SURFACE
      ?auto_23158 - SURFACE
      ?auto_23159 - SURFACE
    )
    :vars
    (
      ?auto_23163 - HOIST
      ?auto_23164 - PLACE
      ?auto_23160 - PLACE
      ?auto_23161 - HOIST
      ?auto_23165 - SURFACE
      ?auto_23181 - PLACE
      ?auto_23176 - HOIST
      ?auto_23177 - SURFACE
      ?auto_23178 - PLACE
      ?auto_23172 - HOIST
      ?auto_23175 - SURFACE
      ?auto_23180 - PLACE
      ?auto_23166 - HOIST
      ?auto_23179 - SURFACE
      ?auto_23169 - PLACE
      ?auto_23182 - HOIST
      ?auto_23174 - SURFACE
      ?auto_23173 - SURFACE
      ?auto_23168 - PLACE
      ?auto_23170 - HOIST
      ?auto_23167 - SURFACE
      ?auto_23171 - SURFACE
      ?auto_23162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23163 ?auto_23164 ) ( IS-CRATE ?auto_23159 ) ( not ( = ?auto_23160 ?auto_23164 ) ) ( HOIST-AT ?auto_23161 ?auto_23160 ) ( SURFACE-AT ?auto_23159 ?auto_23160 ) ( ON ?auto_23159 ?auto_23165 ) ( CLEAR ?auto_23159 ) ( not ( = ?auto_23158 ?auto_23159 ) ) ( not ( = ?auto_23158 ?auto_23165 ) ) ( not ( = ?auto_23159 ?auto_23165 ) ) ( not ( = ?auto_23163 ?auto_23161 ) ) ( IS-CRATE ?auto_23158 ) ( not ( = ?auto_23181 ?auto_23164 ) ) ( HOIST-AT ?auto_23176 ?auto_23181 ) ( SURFACE-AT ?auto_23158 ?auto_23181 ) ( ON ?auto_23158 ?auto_23177 ) ( CLEAR ?auto_23158 ) ( not ( = ?auto_23157 ?auto_23158 ) ) ( not ( = ?auto_23157 ?auto_23177 ) ) ( not ( = ?auto_23158 ?auto_23177 ) ) ( not ( = ?auto_23163 ?auto_23176 ) ) ( IS-CRATE ?auto_23157 ) ( not ( = ?auto_23178 ?auto_23164 ) ) ( HOIST-AT ?auto_23172 ?auto_23178 ) ( AVAILABLE ?auto_23172 ) ( SURFACE-AT ?auto_23157 ?auto_23178 ) ( ON ?auto_23157 ?auto_23175 ) ( CLEAR ?auto_23157 ) ( not ( = ?auto_23156 ?auto_23157 ) ) ( not ( = ?auto_23156 ?auto_23175 ) ) ( not ( = ?auto_23157 ?auto_23175 ) ) ( not ( = ?auto_23163 ?auto_23172 ) ) ( IS-CRATE ?auto_23156 ) ( not ( = ?auto_23180 ?auto_23164 ) ) ( HOIST-AT ?auto_23166 ?auto_23180 ) ( AVAILABLE ?auto_23166 ) ( SURFACE-AT ?auto_23156 ?auto_23180 ) ( ON ?auto_23156 ?auto_23179 ) ( CLEAR ?auto_23156 ) ( not ( = ?auto_23155 ?auto_23156 ) ) ( not ( = ?auto_23155 ?auto_23179 ) ) ( not ( = ?auto_23156 ?auto_23179 ) ) ( not ( = ?auto_23163 ?auto_23166 ) ) ( IS-CRATE ?auto_23155 ) ( not ( = ?auto_23169 ?auto_23164 ) ) ( HOIST-AT ?auto_23182 ?auto_23169 ) ( AVAILABLE ?auto_23182 ) ( SURFACE-AT ?auto_23155 ?auto_23169 ) ( ON ?auto_23155 ?auto_23174 ) ( CLEAR ?auto_23155 ) ( not ( = ?auto_23154 ?auto_23155 ) ) ( not ( = ?auto_23154 ?auto_23174 ) ) ( not ( = ?auto_23155 ?auto_23174 ) ) ( not ( = ?auto_23163 ?auto_23182 ) ) ( IS-CRATE ?auto_23154 ) ( AVAILABLE ?auto_23176 ) ( SURFACE-AT ?auto_23154 ?auto_23181 ) ( ON ?auto_23154 ?auto_23173 ) ( CLEAR ?auto_23154 ) ( not ( = ?auto_23153 ?auto_23154 ) ) ( not ( = ?auto_23153 ?auto_23173 ) ) ( not ( = ?auto_23154 ?auto_23173 ) ) ( IS-CRATE ?auto_23153 ) ( not ( = ?auto_23168 ?auto_23164 ) ) ( HOIST-AT ?auto_23170 ?auto_23168 ) ( AVAILABLE ?auto_23170 ) ( SURFACE-AT ?auto_23153 ?auto_23168 ) ( ON ?auto_23153 ?auto_23167 ) ( CLEAR ?auto_23153 ) ( not ( = ?auto_23152 ?auto_23153 ) ) ( not ( = ?auto_23152 ?auto_23167 ) ) ( not ( = ?auto_23153 ?auto_23167 ) ) ( not ( = ?auto_23163 ?auto_23170 ) ) ( SURFACE-AT ?auto_23151 ?auto_23164 ) ( CLEAR ?auto_23151 ) ( IS-CRATE ?auto_23152 ) ( AVAILABLE ?auto_23163 ) ( AVAILABLE ?auto_23161 ) ( SURFACE-AT ?auto_23152 ?auto_23160 ) ( ON ?auto_23152 ?auto_23171 ) ( CLEAR ?auto_23152 ) ( TRUCK-AT ?auto_23162 ?auto_23164 ) ( not ( = ?auto_23151 ?auto_23152 ) ) ( not ( = ?auto_23151 ?auto_23171 ) ) ( not ( = ?auto_23152 ?auto_23171 ) ) ( not ( = ?auto_23151 ?auto_23153 ) ) ( not ( = ?auto_23151 ?auto_23167 ) ) ( not ( = ?auto_23153 ?auto_23171 ) ) ( not ( = ?auto_23168 ?auto_23160 ) ) ( not ( = ?auto_23170 ?auto_23161 ) ) ( not ( = ?auto_23167 ?auto_23171 ) ) ( not ( = ?auto_23151 ?auto_23154 ) ) ( not ( = ?auto_23151 ?auto_23173 ) ) ( not ( = ?auto_23152 ?auto_23154 ) ) ( not ( = ?auto_23152 ?auto_23173 ) ) ( not ( = ?auto_23154 ?auto_23167 ) ) ( not ( = ?auto_23154 ?auto_23171 ) ) ( not ( = ?auto_23181 ?auto_23168 ) ) ( not ( = ?auto_23181 ?auto_23160 ) ) ( not ( = ?auto_23176 ?auto_23170 ) ) ( not ( = ?auto_23176 ?auto_23161 ) ) ( not ( = ?auto_23173 ?auto_23167 ) ) ( not ( = ?auto_23173 ?auto_23171 ) ) ( not ( = ?auto_23151 ?auto_23155 ) ) ( not ( = ?auto_23151 ?auto_23174 ) ) ( not ( = ?auto_23152 ?auto_23155 ) ) ( not ( = ?auto_23152 ?auto_23174 ) ) ( not ( = ?auto_23153 ?auto_23155 ) ) ( not ( = ?auto_23153 ?auto_23174 ) ) ( not ( = ?auto_23155 ?auto_23173 ) ) ( not ( = ?auto_23155 ?auto_23167 ) ) ( not ( = ?auto_23155 ?auto_23171 ) ) ( not ( = ?auto_23169 ?auto_23181 ) ) ( not ( = ?auto_23169 ?auto_23168 ) ) ( not ( = ?auto_23169 ?auto_23160 ) ) ( not ( = ?auto_23182 ?auto_23176 ) ) ( not ( = ?auto_23182 ?auto_23170 ) ) ( not ( = ?auto_23182 ?auto_23161 ) ) ( not ( = ?auto_23174 ?auto_23173 ) ) ( not ( = ?auto_23174 ?auto_23167 ) ) ( not ( = ?auto_23174 ?auto_23171 ) ) ( not ( = ?auto_23151 ?auto_23156 ) ) ( not ( = ?auto_23151 ?auto_23179 ) ) ( not ( = ?auto_23152 ?auto_23156 ) ) ( not ( = ?auto_23152 ?auto_23179 ) ) ( not ( = ?auto_23153 ?auto_23156 ) ) ( not ( = ?auto_23153 ?auto_23179 ) ) ( not ( = ?auto_23154 ?auto_23156 ) ) ( not ( = ?auto_23154 ?auto_23179 ) ) ( not ( = ?auto_23156 ?auto_23174 ) ) ( not ( = ?auto_23156 ?auto_23173 ) ) ( not ( = ?auto_23156 ?auto_23167 ) ) ( not ( = ?auto_23156 ?auto_23171 ) ) ( not ( = ?auto_23180 ?auto_23169 ) ) ( not ( = ?auto_23180 ?auto_23181 ) ) ( not ( = ?auto_23180 ?auto_23168 ) ) ( not ( = ?auto_23180 ?auto_23160 ) ) ( not ( = ?auto_23166 ?auto_23182 ) ) ( not ( = ?auto_23166 ?auto_23176 ) ) ( not ( = ?auto_23166 ?auto_23170 ) ) ( not ( = ?auto_23166 ?auto_23161 ) ) ( not ( = ?auto_23179 ?auto_23174 ) ) ( not ( = ?auto_23179 ?auto_23173 ) ) ( not ( = ?auto_23179 ?auto_23167 ) ) ( not ( = ?auto_23179 ?auto_23171 ) ) ( not ( = ?auto_23151 ?auto_23157 ) ) ( not ( = ?auto_23151 ?auto_23175 ) ) ( not ( = ?auto_23152 ?auto_23157 ) ) ( not ( = ?auto_23152 ?auto_23175 ) ) ( not ( = ?auto_23153 ?auto_23157 ) ) ( not ( = ?auto_23153 ?auto_23175 ) ) ( not ( = ?auto_23154 ?auto_23157 ) ) ( not ( = ?auto_23154 ?auto_23175 ) ) ( not ( = ?auto_23155 ?auto_23157 ) ) ( not ( = ?auto_23155 ?auto_23175 ) ) ( not ( = ?auto_23157 ?auto_23179 ) ) ( not ( = ?auto_23157 ?auto_23174 ) ) ( not ( = ?auto_23157 ?auto_23173 ) ) ( not ( = ?auto_23157 ?auto_23167 ) ) ( not ( = ?auto_23157 ?auto_23171 ) ) ( not ( = ?auto_23178 ?auto_23180 ) ) ( not ( = ?auto_23178 ?auto_23169 ) ) ( not ( = ?auto_23178 ?auto_23181 ) ) ( not ( = ?auto_23178 ?auto_23168 ) ) ( not ( = ?auto_23178 ?auto_23160 ) ) ( not ( = ?auto_23172 ?auto_23166 ) ) ( not ( = ?auto_23172 ?auto_23182 ) ) ( not ( = ?auto_23172 ?auto_23176 ) ) ( not ( = ?auto_23172 ?auto_23170 ) ) ( not ( = ?auto_23172 ?auto_23161 ) ) ( not ( = ?auto_23175 ?auto_23179 ) ) ( not ( = ?auto_23175 ?auto_23174 ) ) ( not ( = ?auto_23175 ?auto_23173 ) ) ( not ( = ?auto_23175 ?auto_23167 ) ) ( not ( = ?auto_23175 ?auto_23171 ) ) ( not ( = ?auto_23151 ?auto_23158 ) ) ( not ( = ?auto_23151 ?auto_23177 ) ) ( not ( = ?auto_23152 ?auto_23158 ) ) ( not ( = ?auto_23152 ?auto_23177 ) ) ( not ( = ?auto_23153 ?auto_23158 ) ) ( not ( = ?auto_23153 ?auto_23177 ) ) ( not ( = ?auto_23154 ?auto_23158 ) ) ( not ( = ?auto_23154 ?auto_23177 ) ) ( not ( = ?auto_23155 ?auto_23158 ) ) ( not ( = ?auto_23155 ?auto_23177 ) ) ( not ( = ?auto_23156 ?auto_23158 ) ) ( not ( = ?auto_23156 ?auto_23177 ) ) ( not ( = ?auto_23158 ?auto_23175 ) ) ( not ( = ?auto_23158 ?auto_23179 ) ) ( not ( = ?auto_23158 ?auto_23174 ) ) ( not ( = ?auto_23158 ?auto_23173 ) ) ( not ( = ?auto_23158 ?auto_23167 ) ) ( not ( = ?auto_23158 ?auto_23171 ) ) ( not ( = ?auto_23177 ?auto_23175 ) ) ( not ( = ?auto_23177 ?auto_23179 ) ) ( not ( = ?auto_23177 ?auto_23174 ) ) ( not ( = ?auto_23177 ?auto_23173 ) ) ( not ( = ?auto_23177 ?auto_23167 ) ) ( not ( = ?auto_23177 ?auto_23171 ) ) ( not ( = ?auto_23151 ?auto_23159 ) ) ( not ( = ?auto_23151 ?auto_23165 ) ) ( not ( = ?auto_23152 ?auto_23159 ) ) ( not ( = ?auto_23152 ?auto_23165 ) ) ( not ( = ?auto_23153 ?auto_23159 ) ) ( not ( = ?auto_23153 ?auto_23165 ) ) ( not ( = ?auto_23154 ?auto_23159 ) ) ( not ( = ?auto_23154 ?auto_23165 ) ) ( not ( = ?auto_23155 ?auto_23159 ) ) ( not ( = ?auto_23155 ?auto_23165 ) ) ( not ( = ?auto_23156 ?auto_23159 ) ) ( not ( = ?auto_23156 ?auto_23165 ) ) ( not ( = ?auto_23157 ?auto_23159 ) ) ( not ( = ?auto_23157 ?auto_23165 ) ) ( not ( = ?auto_23159 ?auto_23177 ) ) ( not ( = ?auto_23159 ?auto_23175 ) ) ( not ( = ?auto_23159 ?auto_23179 ) ) ( not ( = ?auto_23159 ?auto_23174 ) ) ( not ( = ?auto_23159 ?auto_23173 ) ) ( not ( = ?auto_23159 ?auto_23167 ) ) ( not ( = ?auto_23159 ?auto_23171 ) ) ( not ( = ?auto_23165 ?auto_23177 ) ) ( not ( = ?auto_23165 ?auto_23175 ) ) ( not ( = ?auto_23165 ?auto_23179 ) ) ( not ( = ?auto_23165 ?auto_23174 ) ) ( not ( = ?auto_23165 ?auto_23173 ) ) ( not ( = ?auto_23165 ?auto_23167 ) ) ( not ( = ?auto_23165 ?auto_23171 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_23151 ?auto_23152 ?auto_23153 ?auto_23154 ?auto_23155 ?auto_23156 ?auto_23157 ?auto_23158 )
      ( MAKE-1CRATE ?auto_23158 ?auto_23159 )
      ( MAKE-8CRATE-VERIFY ?auto_23151 ?auto_23152 ?auto_23153 ?auto_23154 ?auto_23155 ?auto_23156 ?auto_23157 ?auto_23158 ?auto_23159 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_23203 - SURFACE
      ?auto_23204 - SURFACE
      ?auto_23205 - SURFACE
      ?auto_23206 - SURFACE
      ?auto_23207 - SURFACE
      ?auto_23208 - SURFACE
      ?auto_23209 - SURFACE
      ?auto_23210 - SURFACE
      ?auto_23211 - SURFACE
      ?auto_23212 - SURFACE
    )
    :vars
    (
      ?auto_23218 - HOIST
      ?auto_23217 - PLACE
      ?auto_23214 - PLACE
      ?auto_23213 - HOIST
      ?auto_23215 - SURFACE
      ?auto_23235 - PLACE
      ?auto_23230 - HOIST
      ?auto_23236 - SURFACE
      ?auto_23226 - SURFACE
      ?auto_23225 - PLACE
      ?auto_23219 - HOIST
      ?auto_23223 - SURFACE
      ?auto_23228 - PLACE
      ?auto_23229 - HOIST
      ?auto_23220 - SURFACE
      ?auto_23227 - PLACE
      ?auto_23231 - HOIST
      ?auto_23221 - SURFACE
      ?auto_23232 - SURFACE
      ?auto_23233 - PLACE
      ?auto_23224 - HOIST
      ?auto_23234 - SURFACE
      ?auto_23222 - SURFACE
      ?auto_23216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23218 ?auto_23217 ) ( IS-CRATE ?auto_23212 ) ( not ( = ?auto_23214 ?auto_23217 ) ) ( HOIST-AT ?auto_23213 ?auto_23214 ) ( SURFACE-AT ?auto_23212 ?auto_23214 ) ( ON ?auto_23212 ?auto_23215 ) ( CLEAR ?auto_23212 ) ( not ( = ?auto_23211 ?auto_23212 ) ) ( not ( = ?auto_23211 ?auto_23215 ) ) ( not ( = ?auto_23212 ?auto_23215 ) ) ( not ( = ?auto_23218 ?auto_23213 ) ) ( IS-CRATE ?auto_23211 ) ( not ( = ?auto_23235 ?auto_23217 ) ) ( HOIST-AT ?auto_23230 ?auto_23235 ) ( SURFACE-AT ?auto_23211 ?auto_23235 ) ( ON ?auto_23211 ?auto_23236 ) ( CLEAR ?auto_23211 ) ( not ( = ?auto_23210 ?auto_23211 ) ) ( not ( = ?auto_23210 ?auto_23236 ) ) ( not ( = ?auto_23211 ?auto_23236 ) ) ( not ( = ?auto_23218 ?auto_23230 ) ) ( IS-CRATE ?auto_23210 ) ( SURFACE-AT ?auto_23210 ?auto_23214 ) ( ON ?auto_23210 ?auto_23226 ) ( CLEAR ?auto_23210 ) ( not ( = ?auto_23209 ?auto_23210 ) ) ( not ( = ?auto_23209 ?auto_23226 ) ) ( not ( = ?auto_23210 ?auto_23226 ) ) ( IS-CRATE ?auto_23209 ) ( not ( = ?auto_23225 ?auto_23217 ) ) ( HOIST-AT ?auto_23219 ?auto_23225 ) ( AVAILABLE ?auto_23219 ) ( SURFACE-AT ?auto_23209 ?auto_23225 ) ( ON ?auto_23209 ?auto_23223 ) ( CLEAR ?auto_23209 ) ( not ( = ?auto_23208 ?auto_23209 ) ) ( not ( = ?auto_23208 ?auto_23223 ) ) ( not ( = ?auto_23209 ?auto_23223 ) ) ( not ( = ?auto_23218 ?auto_23219 ) ) ( IS-CRATE ?auto_23208 ) ( not ( = ?auto_23228 ?auto_23217 ) ) ( HOIST-AT ?auto_23229 ?auto_23228 ) ( AVAILABLE ?auto_23229 ) ( SURFACE-AT ?auto_23208 ?auto_23228 ) ( ON ?auto_23208 ?auto_23220 ) ( CLEAR ?auto_23208 ) ( not ( = ?auto_23207 ?auto_23208 ) ) ( not ( = ?auto_23207 ?auto_23220 ) ) ( not ( = ?auto_23208 ?auto_23220 ) ) ( not ( = ?auto_23218 ?auto_23229 ) ) ( IS-CRATE ?auto_23207 ) ( not ( = ?auto_23227 ?auto_23217 ) ) ( HOIST-AT ?auto_23231 ?auto_23227 ) ( AVAILABLE ?auto_23231 ) ( SURFACE-AT ?auto_23207 ?auto_23227 ) ( ON ?auto_23207 ?auto_23221 ) ( CLEAR ?auto_23207 ) ( not ( = ?auto_23206 ?auto_23207 ) ) ( not ( = ?auto_23206 ?auto_23221 ) ) ( not ( = ?auto_23207 ?auto_23221 ) ) ( not ( = ?auto_23218 ?auto_23231 ) ) ( IS-CRATE ?auto_23206 ) ( AVAILABLE ?auto_23213 ) ( SURFACE-AT ?auto_23206 ?auto_23214 ) ( ON ?auto_23206 ?auto_23232 ) ( CLEAR ?auto_23206 ) ( not ( = ?auto_23205 ?auto_23206 ) ) ( not ( = ?auto_23205 ?auto_23232 ) ) ( not ( = ?auto_23206 ?auto_23232 ) ) ( IS-CRATE ?auto_23205 ) ( not ( = ?auto_23233 ?auto_23217 ) ) ( HOIST-AT ?auto_23224 ?auto_23233 ) ( AVAILABLE ?auto_23224 ) ( SURFACE-AT ?auto_23205 ?auto_23233 ) ( ON ?auto_23205 ?auto_23234 ) ( CLEAR ?auto_23205 ) ( not ( = ?auto_23204 ?auto_23205 ) ) ( not ( = ?auto_23204 ?auto_23234 ) ) ( not ( = ?auto_23205 ?auto_23234 ) ) ( not ( = ?auto_23218 ?auto_23224 ) ) ( SURFACE-AT ?auto_23203 ?auto_23217 ) ( CLEAR ?auto_23203 ) ( IS-CRATE ?auto_23204 ) ( AVAILABLE ?auto_23218 ) ( AVAILABLE ?auto_23230 ) ( SURFACE-AT ?auto_23204 ?auto_23235 ) ( ON ?auto_23204 ?auto_23222 ) ( CLEAR ?auto_23204 ) ( TRUCK-AT ?auto_23216 ?auto_23217 ) ( not ( = ?auto_23203 ?auto_23204 ) ) ( not ( = ?auto_23203 ?auto_23222 ) ) ( not ( = ?auto_23204 ?auto_23222 ) ) ( not ( = ?auto_23203 ?auto_23205 ) ) ( not ( = ?auto_23203 ?auto_23234 ) ) ( not ( = ?auto_23205 ?auto_23222 ) ) ( not ( = ?auto_23233 ?auto_23235 ) ) ( not ( = ?auto_23224 ?auto_23230 ) ) ( not ( = ?auto_23234 ?auto_23222 ) ) ( not ( = ?auto_23203 ?auto_23206 ) ) ( not ( = ?auto_23203 ?auto_23232 ) ) ( not ( = ?auto_23204 ?auto_23206 ) ) ( not ( = ?auto_23204 ?auto_23232 ) ) ( not ( = ?auto_23206 ?auto_23234 ) ) ( not ( = ?auto_23206 ?auto_23222 ) ) ( not ( = ?auto_23214 ?auto_23233 ) ) ( not ( = ?auto_23214 ?auto_23235 ) ) ( not ( = ?auto_23213 ?auto_23224 ) ) ( not ( = ?auto_23213 ?auto_23230 ) ) ( not ( = ?auto_23232 ?auto_23234 ) ) ( not ( = ?auto_23232 ?auto_23222 ) ) ( not ( = ?auto_23203 ?auto_23207 ) ) ( not ( = ?auto_23203 ?auto_23221 ) ) ( not ( = ?auto_23204 ?auto_23207 ) ) ( not ( = ?auto_23204 ?auto_23221 ) ) ( not ( = ?auto_23205 ?auto_23207 ) ) ( not ( = ?auto_23205 ?auto_23221 ) ) ( not ( = ?auto_23207 ?auto_23232 ) ) ( not ( = ?auto_23207 ?auto_23234 ) ) ( not ( = ?auto_23207 ?auto_23222 ) ) ( not ( = ?auto_23227 ?auto_23214 ) ) ( not ( = ?auto_23227 ?auto_23233 ) ) ( not ( = ?auto_23227 ?auto_23235 ) ) ( not ( = ?auto_23231 ?auto_23213 ) ) ( not ( = ?auto_23231 ?auto_23224 ) ) ( not ( = ?auto_23231 ?auto_23230 ) ) ( not ( = ?auto_23221 ?auto_23232 ) ) ( not ( = ?auto_23221 ?auto_23234 ) ) ( not ( = ?auto_23221 ?auto_23222 ) ) ( not ( = ?auto_23203 ?auto_23208 ) ) ( not ( = ?auto_23203 ?auto_23220 ) ) ( not ( = ?auto_23204 ?auto_23208 ) ) ( not ( = ?auto_23204 ?auto_23220 ) ) ( not ( = ?auto_23205 ?auto_23208 ) ) ( not ( = ?auto_23205 ?auto_23220 ) ) ( not ( = ?auto_23206 ?auto_23208 ) ) ( not ( = ?auto_23206 ?auto_23220 ) ) ( not ( = ?auto_23208 ?auto_23221 ) ) ( not ( = ?auto_23208 ?auto_23232 ) ) ( not ( = ?auto_23208 ?auto_23234 ) ) ( not ( = ?auto_23208 ?auto_23222 ) ) ( not ( = ?auto_23228 ?auto_23227 ) ) ( not ( = ?auto_23228 ?auto_23214 ) ) ( not ( = ?auto_23228 ?auto_23233 ) ) ( not ( = ?auto_23228 ?auto_23235 ) ) ( not ( = ?auto_23229 ?auto_23231 ) ) ( not ( = ?auto_23229 ?auto_23213 ) ) ( not ( = ?auto_23229 ?auto_23224 ) ) ( not ( = ?auto_23229 ?auto_23230 ) ) ( not ( = ?auto_23220 ?auto_23221 ) ) ( not ( = ?auto_23220 ?auto_23232 ) ) ( not ( = ?auto_23220 ?auto_23234 ) ) ( not ( = ?auto_23220 ?auto_23222 ) ) ( not ( = ?auto_23203 ?auto_23209 ) ) ( not ( = ?auto_23203 ?auto_23223 ) ) ( not ( = ?auto_23204 ?auto_23209 ) ) ( not ( = ?auto_23204 ?auto_23223 ) ) ( not ( = ?auto_23205 ?auto_23209 ) ) ( not ( = ?auto_23205 ?auto_23223 ) ) ( not ( = ?auto_23206 ?auto_23209 ) ) ( not ( = ?auto_23206 ?auto_23223 ) ) ( not ( = ?auto_23207 ?auto_23209 ) ) ( not ( = ?auto_23207 ?auto_23223 ) ) ( not ( = ?auto_23209 ?auto_23220 ) ) ( not ( = ?auto_23209 ?auto_23221 ) ) ( not ( = ?auto_23209 ?auto_23232 ) ) ( not ( = ?auto_23209 ?auto_23234 ) ) ( not ( = ?auto_23209 ?auto_23222 ) ) ( not ( = ?auto_23225 ?auto_23228 ) ) ( not ( = ?auto_23225 ?auto_23227 ) ) ( not ( = ?auto_23225 ?auto_23214 ) ) ( not ( = ?auto_23225 ?auto_23233 ) ) ( not ( = ?auto_23225 ?auto_23235 ) ) ( not ( = ?auto_23219 ?auto_23229 ) ) ( not ( = ?auto_23219 ?auto_23231 ) ) ( not ( = ?auto_23219 ?auto_23213 ) ) ( not ( = ?auto_23219 ?auto_23224 ) ) ( not ( = ?auto_23219 ?auto_23230 ) ) ( not ( = ?auto_23223 ?auto_23220 ) ) ( not ( = ?auto_23223 ?auto_23221 ) ) ( not ( = ?auto_23223 ?auto_23232 ) ) ( not ( = ?auto_23223 ?auto_23234 ) ) ( not ( = ?auto_23223 ?auto_23222 ) ) ( not ( = ?auto_23203 ?auto_23210 ) ) ( not ( = ?auto_23203 ?auto_23226 ) ) ( not ( = ?auto_23204 ?auto_23210 ) ) ( not ( = ?auto_23204 ?auto_23226 ) ) ( not ( = ?auto_23205 ?auto_23210 ) ) ( not ( = ?auto_23205 ?auto_23226 ) ) ( not ( = ?auto_23206 ?auto_23210 ) ) ( not ( = ?auto_23206 ?auto_23226 ) ) ( not ( = ?auto_23207 ?auto_23210 ) ) ( not ( = ?auto_23207 ?auto_23226 ) ) ( not ( = ?auto_23208 ?auto_23210 ) ) ( not ( = ?auto_23208 ?auto_23226 ) ) ( not ( = ?auto_23210 ?auto_23223 ) ) ( not ( = ?auto_23210 ?auto_23220 ) ) ( not ( = ?auto_23210 ?auto_23221 ) ) ( not ( = ?auto_23210 ?auto_23232 ) ) ( not ( = ?auto_23210 ?auto_23234 ) ) ( not ( = ?auto_23210 ?auto_23222 ) ) ( not ( = ?auto_23226 ?auto_23223 ) ) ( not ( = ?auto_23226 ?auto_23220 ) ) ( not ( = ?auto_23226 ?auto_23221 ) ) ( not ( = ?auto_23226 ?auto_23232 ) ) ( not ( = ?auto_23226 ?auto_23234 ) ) ( not ( = ?auto_23226 ?auto_23222 ) ) ( not ( = ?auto_23203 ?auto_23211 ) ) ( not ( = ?auto_23203 ?auto_23236 ) ) ( not ( = ?auto_23204 ?auto_23211 ) ) ( not ( = ?auto_23204 ?auto_23236 ) ) ( not ( = ?auto_23205 ?auto_23211 ) ) ( not ( = ?auto_23205 ?auto_23236 ) ) ( not ( = ?auto_23206 ?auto_23211 ) ) ( not ( = ?auto_23206 ?auto_23236 ) ) ( not ( = ?auto_23207 ?auto_23211 ) ) ( not ( = ?auto_23207 ?auto_23236 ) ) ( not ( = ?auto_23208 ?auto_23211 ) ) ( not ( = ?auto_23208 ?auto_23236 ) ) ( not ( = ?auto_23209 ?auto_23211 ) ) ( not ( = ?auto_23209 ?auto_23236 ) ) ( not ( = ?auto_23211 ?auto_23226 ) ) ( not ( = ?auto_23211 ?auto_23223 ) ) ( not ( = ?auto_23211 ?auto_23220 ) ) ( not ( = ?auto_23211 ?auto_23221 ) ) ( not ( = ?auto_23211 ?auto_23232 ) ) ( not ( = ?auto_23211 ?auto_23234 ) ) ( not ( = ?auto_23211 ?auto_23222 ) ) ( not ( = ?auto_23236 ?auto_23226 ) ) ( not ( = ?auto_23236 ?auto_23223 ) ) ( not ( = ?auto_23236 ?auto_23220 ) ) ( not ( = ?auto_23236 ?auto_23221 ) ) ( not ( = ?auto_23236 ?auto_23232 ) ) ( not ( = ?auto_23236 ?auto_23234 ) ) ( not ( = ?auto_23236 ?auto_23222 ) ) ( not ( = ?auto_23203 ?auto_23212 ) ) ( not ( = ?auto_23203 ?auto_23215 ) ) ( not ( = ?auto_23204 ?auto_23212 ) ) ( not ( = ?auto_23204 ?auto_23215 ) ) ( not ( = ?auto_23205 ?auto_23212 ) ) ( not ( = ?auto_23205 ?auto_23215 ) ) ( not ( = ?auto_23206 ?auto_23212 ) ) ( not ( = ?auto_23206 ?auto_23215 ) ) ( not ( = ?auto_23207 ?auto_23212 ) ) ( not ( = ?auto_23207 ?auto_23215 ) ) ( not ( = ?auto_23208 ?auto_23212 ) ) ( not ( = ?auto_23208 ?auto_23215 ) ) ( not ( = ?auto_23209 ?auto_23212 ) ) ( not ( = ?auto_23209 ?auto_23215 ) ) ( not ( = ?auto_23210 ?auto_23212 ) ) ( not ( = ?auto_23210 ?auto_23215 ) ) ( not ( = ?auto_23212 ?auto_23236 ) ) ( not ( = ?auto_23212 ?auto_23226 ) ) ( not ( = ?auto_23212 ?auto_23223 ) ) ( not ( = ?auto_23212 ?auto_23220 ) ) ( not ( = ?auto_23212 ?auto_23221 ) ) ( not ( = ?auto_23212 ?auto_23232 ) ) ( not ( = ?auto_23212 ?auto_23234 ) ) ( not ( = ?auto_23212 ?auto_23222 ) ) ( not ( = ?auto_23215 ?auto_23236 ) ) ( not ( = ?auto_23215 ?auto_23226 ) ) ( not ( = ?auto_23215 ?auto_23223 ) ) ( not ( = ?auto_23215 ?auto_23220 ) ) ( not ( = ?auto_23215 ?auto_23221 ) ) ( not ( = ?auto_23215 ?auto_23232 ) ) ( not ( = ?auto_23215 ?auto_23234 ) ) ( not ( = ?auto_23215 ?auto_23222 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_23203 ?auto_23204 ?auto_23205 ?auto_23206 ?auto_23207 ?auto_23208 ?auto_23209 ?auto_23210 ?auto_23211 )
      ( MAKE-1CRATE ?auto_23211 ?auto_23212 )
      ( MAKE-9CRATE-VERIFY ?auto_23203 ?auto_23204 ?auto_23205 ?auto_23206 ?auto_23207 ?auto_23208 ?auto_23209 ?auto_23210 ?auto_23211 ?auto_23212 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_23258 - SURFACE
      ?auto_23259 - SURFACE
      ?auto_23260 - SURFACE
      ?auto_23261 - SURFACE
      ?auto_23262 - SURFACE
      ?auto_23263 - SURFACE
      ?auto_23264 - SURFACE
      ?auto_23265 - SURFACE
      ?auto_23266 - SURFACE
      ?auto_23267 - SURFACE
      ?auto_23268 - SURFACE
    )
    :vars
    (
      ?auto_23274 - HOIST
      ?auto_23271 - PLACE
      ?auto_23270 - PLACE
      ?auto_23269 - HOIST
      ?auto_23273 - SURFACE
      ?auto_23294 - PLACE
      ?auto_23283 - HOIST
      ?auto_23286 - SURFACE
      ?auto_23282 - PLACE
      ?auto_23276 - HOIST
      ?auto_23287 - SURFACE
      ?auto_23292 - SURFACE
      ?auto_23291 - PLACE
      ?auto_23280 - HOIST
      ?auto_23285 - SURFACE
      ?auto_23293 - PLACE
      ?auto_23275 - HOIST
      ?auto_23281 - SURFACE
      ?auto_23295 - PLACE
      ?auto_23279 - HOIST
      ?auto_23289 - SURFACE
      ?auto_23278 - SURFACE
      ?auto_23284 - PLACE
      ?auto_23288 - HOIST
      ?auto_23290 - SURFACE
      ?auto_23277 - SURFACE
      ?auto_23272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23274 ?auto_23271 ) ( IS-CRATE ?auto_23268 ) ( not ( = ?auto_23270 ?auto_23271 ) ) ( HOIST-AT ?auto_23269 ?auto_23270 ) ( AVAILABLE ?auto_23269 ) ( SURFACE-AT ?auto_23268 ?auto_23270 ) ( ON ?auto_23268 ?auto_23273 ) ( CLEAR ?auto_23268 ) ( not ( = ?auto_23267 ?auto_23268 ) ) ( not ( = ?auto_23267 ?auto_23273 ) ) ( not ( = ?auto_23268 ?auto_23273 ) ) ( not ( = ?auto_23274 ?auto_23269 ) ) ( IS-CRATE ?auto_23267 ) ( not ( = ?auto_23294 ?auto_23271 ) ) ( HOIST-AT ?auto_23283 ?auto_23294 ) ( SURFACE-AT ?auto_23267 ?auto_23294 ) ( ON ?auto_23267 ?auto_23286 ) ( CLEAR ?auto_23267 ) ( not ( = ?auto_23266 ?auto_23267 ) ) ( not ( = ?auto_23266 ?auto_23286 ) ) ( not ( = ?auto_23267 ?auto_23286 ) ) ( not ( = ?auto_23274 ?auto_23283 ) ) ( IS-CRATE ?auto_23266 ) ( not ( = ?auto_23282 ?auto_23271 ) ) ( HOIST-AT ?auto_23276 ?auto_23282 ) ( SURFACE-AT ?auto_23266 ?auto_23282 ) ( ON ?auto_23266 ?auto_23287 ) ( CLEAR ?auto_23266 ) ( not ( = ?auto_23265 ?auto_23266 ) ) ( not ( = ?auto_23265 ?auto_23287 ) ) ( not ( = ?auto_23266 ?auto_23287 ) ) ( not ( = ?auto_23274 ?auto_23276 ) ) ( IS-CRATE ?auto_23265 ) ( SURFACE-AT ?auto_23265 ?auto_23294 ) ( ON ?auto_23265 ?auto_23292 ) ( CLEAR ?auto_23265 ) ( not ( = ?auto_23264 ?auto_23265 ) ) ( not ( = ?auto_23264 ?auto_23292 ) ) ( not ( = ?auto_23265 ?auto_23292 ) ) ( IS-CRATE ?auto_23264 ) ( not ( = ?auto_23291 ?auto_23271 ) ) ( HOIST-AT ?auto_23280 ?auto_23291 ) ( AVAILABLE ?auto_23280 ) ( SURFACE-AT ?auto_23264 ?auto_23291 ) ( ON ?auto_23264 ?auto_23285 ) ( CLEAR ?auto_23264 ) ( not ( = ?auto_23263 ?auto_23264 ) ) ( not ( = ?auto_23263 ?auto_23285 ) ) ( not ( = ?auto_23264 ?auto_23285 ) ) ( not ( = ?auto_23274 ?auto_23280 ) ) ( IS-CRATE ?auto_23263 ) ( not ( = ?auto_23293 ?auto_23271 ) ) ( HOIST-AT ?auto_23275 ?auto_23293 ) ( AVAILABLE ?auto_23275 ) ( SURFACE-AT ?auto_23263 ?auto_23293 ) ( ON ?auto_23263 ?auto_23281 ) ( CLEAR ?auto_23263 ) ( not ( = ?auto_23262 ?auto_23263 ) ) ( not ( = ?auto_23262 ?auto_23281 ) ) ( not ( = ?auto_23263 ?auto_23281 ) ) ( not ( = ?auto_23274 ?auto_23275 ) ) ( IS-CRATE ?auto_23262 ) ( not ( = ?auto_23295 ?auto_23271 ) ) ( HOIST-AT ?auto_23279 ?auto_23295 ) ( AVAILABLE ?auto_23279 ) ( SURFACE-AT ?auto_23262 ?auto_23295 ) ( ON ?auto_23262 ?auto_23289 ) ( CLEAR ?auto_23262 ) ( not ( = ?auto_23261 ?auto_23262 ) ) ( not ( = ?auto_23261 ?auto_23289 ) ) ( not ( = ?auto_23262 ?auto_23289 ) ) ( not ( = ?auto_23274 ?auto_23279 ) ) ( IS-CRATE ?auto_23261 ) ( AVAILABLE ?auto_23283 ) ( SURFACE-AT ?auto_23261 ?auto_23294 ) ( ON ?auto_23261 ?auto_23278 ) ( CLEAR ?auto_23261 ) ( not ( = ?auto_23260 ?auto_23261 ) ) ( not ( = ?auto_23260 ?auto_23278 ) ) ( not ( = ?auto_23261 ?auto_23278 ) ) ( IS-CRATE ?auto_23260 ) ( not ( = ?auto_23284 ?auto_23271 ) ) ( HOIST-AT ?auto_23288 ?auto_23284 ) ( AVAILABLE ?auto_23288 ) ( SURFACE-AT ?auto_23260 ?auto_23284 ) ( ON ?auto_23260 ?auto_23290 ) ( CLEAR ?auto_23260 ) ( not ( = ?auto_23259 ?auto_23260 ) ) ( not ( = ?auto_23259 ?auto_23290 ) ) ( not ( = ?auto_23260 ?auto_23290 ) ) ( not ( = ?auto_23274 ?auto_23288 ) ) ( SURFACE-AT ?auto_23258 ?auto_23271 ) ( CLEAR ?auto_23258 ) ( IS-CRATE ?auto_23259 ) ( AVAILABLE ?auto_23274 ) ( AVAILABLE ?auto_23276 ) ( SURFACE-AT ?auto_23259 ?auto_23282 ) ( ON ?auto_23259 ?auto_23277 ) ( CLEAR ?auto_23259 ) ( TRUCK-AT ?auto_23272 ?auto_23271 ) ( not ( = ?auto_23258 ?auto_23259 ) ) ( not ( = ?auto_23258 ?auto_23277 ) ) ( not ( = ?auto_23259 ?auto_23277 ) ) ( not ( = ?auto_23258 ?auto_23260 ) ) ( not ( = ?auto_23258 ?auto_23290 ) ) ( not ( = ?auto_23260 ?auto_23277 ) ) ( not ( = ?auto_23284 ?auto_23282 ) ) ( not ( = ?auto_23288 ?auto_23276 ) ) ( not ( = ?auto_23290 ?auto_23277 ) ) ( not ( = ?auto_23258 ?auto_23261 ) ) ( not ( = ?auto_23258 ?auto_23278 ) ) ( not ( = ?auto_23259 ?auto_23261 ) ) ( not ( = ?auto_23259 ?auto_23278 ) ) ( not ( = ?auto_23261 ?auto_23290 ) ) ( not ( = ?auto_23261 ?auto_23277 ) ) ( not ( = ?auto_23294 ?auto_23284 ) ) ( not ( = ?auto_23294 ?auto_23282 ) ) ( not ( = ?auto_23283 ?auto_23288 ) ) ( not ( = ?auto_23283 ?auto_23276 ) ) ( not ( = ?auto_23278 ?auto_23290 ) ) ( not ( = ?auto_23278 ?auto_23277 ) ) ( not ( = ?auto_23258 ?auto_23262 ) ) ( not ( = ?auto_23258 ?auto_23289 ) ) ( not ( = ?auto_23259 ?auto_23262 ) ) ( not ( = ?auto_23259 ?auto_23289 ) ) ( not ( = ?auto_23260 ?auto_23262 ) ) ( not ( = ?auto_23260 ?auto_23289 ) ) ( not ( = ?auto_23262 ?auto_23278 ) ) ( not ( = ?auto_23262 ?auto_23290 ) ) ( not ( = ?auto_23262 ?auto_23277 ) ) ( not ( = ?auto_23295 ?auto_23294 ) ) ( not ( = ?auto_23295 ?auto_23284 ) ) ( not ( = ?auto_23295 ?auto_23282 ) ) ( not ( = ?auto_23279 ?auto_23283 ) ) ( not ( = ?auto_23279 ?auto_23288 ) ) ( not ( = ?auto_23279 ?auto_23276 ) ) ( not ( = ?auto_23289 ?auto_23278 ) ) ( not ( = ?auto_23289 ?auto_23290 ) ) ( not ( = ?auto_23289 ?auto_23277 ) ) ( not ( = ?auto_23258 ?auto_23263 ) ) ( not ( = ?auto_23258 ?auto_23281 ) ) ( not ( = ?auto_23259 ?auto_23263 ) ) ( not ( = ?auto_23259 ?auto_23281 ) ) ( not ( = ?auto_23260 ?auto_23263 ) ) ( not ( = ?auto_23260 ?auto_23281 ) ) ( not ( = ?auto_23261 ?auto_23263 ) ) ( not ( = ?auto_23261 ?auto_23281 ) ) ( not ( = ?auto_23263 ?auto_23289 ) ) ( not ( = ?auto_23263 ?auto_23278 ) ) ( not ( = ?auto_23263 ?auto_23290 ) ) ( not ( = ?auto_23263 ?auto_23277 ) ) ( not ( = ?auto_23293 ?auto_23295 ) ) ( not ( = ?auto_23293 ?auto_23294 ) ) ( not ( = ?auto_23293 ?auto_23284 ) ) ( not ( = ?auto_23293 ?auto_23282 ) ) ( not ( = ?auto_23275 ?auto_23279 ) ) ( not ( = ?auto_23275 ?auto_23283 ) ) ( not ( = ?auto_23275 ?auto_23288 ) ) ( not ( = ?auto_23275 ?auto_23276 ) ) ( not ( = ?auto_23281 ?auto_23289 ) ) ( not ( = ?auto_23281 ?auto_23278 ) ) ( not ( = ?auto_23281 ?auto_23290 ) ) ( not ( = ?auto_23281 ?auto_23277 ) ) ( not ( = ?auto_23258 ?auto_23264 ) ) ( not ( = ?auto_23258 ?auto_23285 ) ) ( not ( = ?auto_23259 ?auto_23264 ) ) ( not ( = ?auto_23259 ?auto_23285 ) ) ( not ( = ?auto_23260 ?auto_23264 ) ) ( not ( = ?auto_23260 ?auto_23285 ) ) ( not ( = ?auto_23261 ?auto_23264 ) ) ( not ( = ?auto_23261 ?auto_23285 ) ) ( not ( = ?auto_23262 ?auto_23264 ) ) ( not ( = ?auto_23262 ?auto_23285 ) ) ( not ( = ?auto_23264 ?auto_23281 ) ) ( not ( = ?auto_23264 ?auto_23289 ) ) ( not ( = ?auto_23264 ?auto_23278 ) ) ( not ( = ?auto_23264 ?auto_23290 ) ) ( not ( = ?auto_23264 ?auto_23277 ) ) ( not ( = ?auto_23291 ?auto_23293 ) ) ( not ( = ?auto_23291 ?auto_23295 ) ) ( not ( = ?auto_23291 ?auto_23294 ) ) ( not ( = ?auto_23291 ?auto_23284 ) ) ( not ( = ?auto_23291 ?auto_23282 ) ) ( not ( = ?auto_23280 ?auto_23275 ) ) ( not ( = ?auto_23280 ?auto_23279 ) ) ( not ( = ?auto_23280 ?auto_23283 ) ) ( not ( = ?auto_23280 ?auto_23288 ) ) ( not ( = ?auto_23280 ?auto_23276 ) ) ( not ( = ?auto_23285 ?auto_23281 ) ) ( not ( = ?auto_23285 ?auto_23289 ) ) ( not ( = ?auto_23285 ?auto_23278 ) ) ( not ( = ?auto_23285 ?auto_23290 ) ) ( not ( = ?auto_23285 ?auto_23277 ) ) ( not ( = ?auto_23258 ?auto_23265 ) ) ( not ( = ?auto_23258 ?auto_23292 ) ) ( not ( = ?auto_23259 ?auto_23265 ) ) ( not ( = ?auto_23259 ?auto_23292 ) ) ( not ( = ?auto_23260 ?auto_23265 ) ) ( not ( = ?auto_23260 ?auto_23292 ) ) ( not ( = ?auto_23261 ?auto_23265 ) ) ( not ( = ?auto_23261 ?auto_23292 ) ) ( not ( = ?auto_23262 ?auto_23265 ) ) ( not ( = ?auto_23262 ?auto_23292 ) ) ( not ( = ?auto_23263 ?auto_23265 ) ) ( not ( = ?auto_23263 ?auto_23292 ) ) ( not ( = ?auto_23265 ?auto_23285 ) ) ( not ( = ?auto_23265 ?auto_23281 ) ) ( not ( = ?auto_23265 ?auto_23289 ) ) ( not ( = ?auto_23265 ?auto_23278 ) ) ( not ( = ?auto_23265 ?auto_23290 ) ) ( not ( = ?auto_23265 ?auto_23277 ) ) ( not ( = ?auto_23292 ?auto_23285 ) ) ( not ( = ?auto_23292 ?auto_23281 ) ) ( not ( = ?auto_23292 ?auto_23289 ) ) ( not ( = ?auto_23292 ?auto_23278 ) ) ( not ( = ?auto_23292 ?auto_23290 ) ) ( not ( = ?auto_23292 ?auto_23277 ) ) ( not ( = ?auto_23258 ?auto_23266 ) ) ( not ( = ?auto_23258 ?auto_23287 ) ) ( not ( = ?auto_23259 ?auto_23266 ) ) ( not ( = ?auto_23259 ?auto_23287 ) ) ( not ( = ?auto_23260 ?auto_23266 ) ) ( not ( = ?auto_23260 ?auto_23287 ) ) ( not ( = ?auto_23261 ?auto_23266 ) ) ( not ( = ?auto_23261 ?auto_23287 ) ) ( not ( = ?auto_23262 ?auto_23266 ) ) ( not ( = ?auto_23262 ?auto_23287 ) ) ( not ( = ?auto_23263 ?auto_23266 ) ) ( not ( = ?auto_23263 ?auto_23287 ) ) ( not ( = ?auto_23264 ?auto_23266 ) ) ( not ( = ?auto_23264 ?auto_23287 ) ) ( not ( = ?auto_23266 ?auto_23292 ) ) ( not ( = ?auto_23266 ?auto_23285 ) ) ( not ( = ?auto_23266 ?auto_23281 ) ) ( not ( = ?auto_23266 ?auto_23289 ) ) ( not ( = ?auto_23266 ?auto_23278 ) ) ( not ( = ?auto_23266 ?auto_23290 ) ) ( not ( = ?auto_23266 ?auto_23277 ) ) ( not ( = ?auto_23287 ?auto_23292 ) ) ( not ( = ?auto_23287 ?auto_23285 ) ) ( not ( = ?auto_23287 ?auto_23281 ) ) ( not ( = ?auto_23287 ?auto_23289 ) ) ( not ( = ?auto_23287 ?auto_23278 ) ) ( not ( = ?auto_23287 ?auto_23290 ) ) ( not ( = ?auto_23287 ?auto_23277 ) ) ( not ( = ?auto_23258 ?auto_23267 ) ) ( not ( = ?auto_23258 ?auto_23286 ) ) ( not ( = ?auto_23259 ?auto_23267 ) ) ( not ( = ?auto_23259 ?auto_23286 ) ) ( not ( = ?auto_23260 ?auto_23267 ) ) ( not ( = ?auto_23260 ?auto_23286 ) ) ( not ( = ?auto_23261 ?auto_23267 ) ) ( not ( = ?auto_23261 ?auto_23286 ) ) ( not ( = ?auto_23262 ?auto_23267 ) ) ( not ( = ?auto_23262 ?auto_23286 ) ) ( not ( = ?auto_23263 ?auto_23267 ) ) ( not ( = ?auto_23263 ?auto_23286 ) ) ( not ( = ?auto_23264 ?auto_23267 ) ) ( not ( = ?auto_23264 ?auto_23286 ) ) ( not ( = ?auto_23265 ?auto_23267 ) ) ( not ( = ?auto_23265 ?auto_23286 ) ) ( not ( = ?auto_23267 ?auto_23287 ) ) ( not ( = ?auto_23267 ?auto_23292 ) ) ( not ( = ?auto_23267 ?auto_23285 ) ) ( not ( = ?auto_23267 ?auto_23281 ) ) ( not ( = ?auto_23267 ?auto_23289 ) ) ( not ( = ?auto_23267 ?auto_23278 ) ) ( not ( = ?auto_23267 ?auto_23290 ) ) ( not ( = ?auto_23267 ?auto_23277 ) ) ( not ( = ?auto_23286 ?auto_23287 ) ) ( not ( = ?auto_23286 ?auto_23292 ) ) ( not ( = ?auto_23286 ?auto_23285 ) ) ( not ( = ?auto_23286 ?auto_23281 ) ) ( not ( = ?auto_23286 ?auto_23289 ) ) ( not ( = ?auto_23286 ?auto_23278 ) ) ( not ( = ?auto_23286 ?auto_23290 ) ) ( not ( = ?auto_23286 ?auto_23277 ) ) ( not ( = ?auto_23258 ?auto_23268 ) ) ( not ( = ?auto_23258 ?auto_23273 ) ) ( not ( = ?auto_23259 ?auto_23268 ) ) ( not ( = ?auto_23259 ?auto_23273 ) ) ( not ( = ?auto_23260 ?auto_23268 ) ) ( not ( = ?auto_23260 ?auto_23273 ) ) ( not ( = ?auto_23261 ?auto_23268 ) ) ( not ( = ?auto_23261 ?auto_23273 ) ) ( not ( = ?auto_23262 ?auto_23268 ) ) ( not ( = ?auto_23262 ?auto_23273 ) ) ( not ( = ?auto_23263 ?auto_23268 ) ) ( not ( = ?auto_23263 ?auto_23273 ) ) ( not ( = ?auto_23264 ?auto_23268 ) ) ( not ( = ?auto_23264 ?auto_23273 ) ) ( not ( = ?auto_23265 ?auto_23268 ) ) ( not ( = ?auto_23265 ?auto_23273 ) ) ( not ( = ?auto_23266 ?auto_23268 ) ) ( not ( = ?auto_23266 ?auto_23273 ) ) ( not ( = ?auto_23268 ?auto_23286 ) ) ( not ( = ?auto_23268 ?auto_23287 ) ) ( not ( = ?auto_23268 ?auto_23292 ) ) ( not ( = ?auto_23268 ?auto_23285 ) ) ( not ( = ?auto_23268 ?auto_23281 ) ) ( not ( = ?auto_23268 ?auto_23289 ) ) ( not ( = ?auto_23268 ?auto_23278 ) ) ( not ( = ?auto_23268 ?auto_23290 ) ) ( not ( = ?auto_23268 ?auto_23277 ) ) ( not ( = ?auto_23270 ?auto_23294 ) ) ( not ( = ?auto_23270 ?auto_23282 ) ) ( not ( = ?auto_23270 ?auto_23291 ) ) ( not ( = ?auto_23270 ?auto_23293 ) ) ( not ( = ?auto_23270 ?auto_23295 ) ) ( not ( = ?auto_23270 ?auto_23284 ) ) ( not ( = ?auto_23269 ?auto_23283 ) ) ( not ( = ?auto_23269 ?auto_23276 ) ) ( not ( = ?auto_23269 ?auto_23280 ) ) ( not ( = ?auto_23269 ?auto_23275 ) ) ( not ( = ?auto_23269 ?auto_23279 ) ) ( not ( = ?auto_23269 ?auto_23288 ) ) ( not ( = ?auto_23273 ?auto_23286 ) ) ( not ( = ?auto_23273 ?auto_23287 ) ) ( not ( = ?auto_23273 ?auto_23292 ) ) ( not ( = ?auto_23273 ?auto_23285 ) ) ( not ( = ?auto_23273 ?auto_23281 ) ) ( not ( = ?auto_23273 ?auto_23289 ) ) ( not ( = ?auto_23273 ?auto_23278 ) ) ( not ( = ?auto_23273 ?auto_23290 ) ) ( not ( = ?auto_23273 ?auto_23277 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_23258 ?auto_23259 ?auto_23260 ?auto_23261 ?auto_23262 ?auto_23263 ?auto_23264 ?auto_23265 ?auto_23266 ?auto_23267 )
      ( MAKE-1CRATE ?auto_23267 ?auto_23268 )
      ( MAKE-10CRATE-VERIFY ?auto_23258 ?auto_23259 ?auto_23260 ?auto_23261 ?auto_23262 ?auto_23263 ?auto_23264 ?auto_23265 ?auto_23266 ?auto_23267 ?auto_23268 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_23318 - SURFACE
      ?auto_23319 - SURFACE
      ?auto_23320 - SURFACE
      ?auto_23321 - SURFACE
      ?auto_23322 - SURFACE
      ?auto_23323 - SURFACE
      ?auto_23324 - SURFACE
      ?auto_23325 - SURFACE
      ?auto_23326 - SURFACE
      ?auto_23327 - SURFACE
      ?auto_23328 - SURFACE
      ?auto_23329 - SURFACE
    )
    :vars
    (
      ?auto_23334 - HOIST
      ?auto_23335 - PLACE
      ?auto_23331 - PLACE
      ?auto_23332 - HOIST
      ?auto_23330 - SURFACE
      ?auto_23351 - PLACE
      ?auto_23352 - HOIST
      ?auto_23354 - SURFACE
      ?auto_23346 - SURFACE
      ?auto_23336 - PLACE
      ?auto_23349 - HOIST
      ?auto_23356 - SURFACE
      ?auto_23338 - SURFACE
      ?auto_23345 - PLACE
      ?auto_23340 - HOIST
      ?auto_23355 - SURFACE
      ?auto_23343 - PLACE
      ?auto_23339 - HOIST
      ?auto_23347 - SURFACE
      ?auto_23353 - PLACE
      ?auto_23357 - HOIST
      ?auto_23350 - SURFACE
      ?auto_23337 - SURFACE
      ?auto_23342 - PLACE
      ?auto_23348 - HOIST
      ?auto_23341 - SURFACE
      ?auto_23344 - SURFACE
      ?auto_23333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23334 ?auto_23335 ) ( IS-CRATE ?auto_23329 ) ( not ( = ?auto_23331 ?auto_23335 ) ) ( HOIST-AT ?auto_23332 ?auto_23331 ) ( SURFACE-AT ?auto_23329 ?auto_23331 ) ( ON ?auto_23329 ?auto_23330 ) ( CLEAR ?auto_23329 ) ( not ( = ?auto_23328 ?auto_23329 ) ) ( not ( = ?auto_23328 ?auto_23330 ) ) ( not ( = ?auto_23329 ?auto_23330 ) ) ( not ( = ?auto_23334 ?auto_23332 ) ) ( IS-CRATE ?auto_23328 ) ( not ( = ?auto_23351 ?auto_23335 ) ) ( HOIST-AT ?auto_23352 ?auto_23351 ) ( AVAILABLE ?auto_23352 ) ( SURFACE-AT ?auto_23328 ?auto_23351 ) ( ON ?auto_23328 ?auto_23354 ) ( CLEAR ?auto_23328 ) ( not ( = ?auto_23327 ?auto_23328 ) ) ( not ( = ?auto_23327 ?auto_23354 ) ) ( not ( = ?auto_23328 ?auto_23354 ) ) ( not ( = ?auto_23334 ?auto_23352 ) ) ( IS-CRATE ?auto_23327 ) ( SURFACE-AT ?auto_23327 ?auto_23331 ) ( ON ?auto_23327 ?auto_23346 ) ( CLEAR ?auto_23327 ) ( not ( = ?auto_23326 ?auto_23327 ) ) ( not ( = ?auto_23326 ?auto_23346 ) ) ( not ( = ?auto_23327 ?auto_23346 ) ) ( IS-CRATE ?auto_23326 ) ( not ( = ?auto_23336 ?auto_23335 ) ) ( HOIST-AT ?auto_23349 ?auto_23336 ) ( SURFACE-AT ?auto_23326 ?auto_23336 ) ( ON ?auto_23326 ?auto_23356 ) ( CLEAR ?auto_23326 ) ( not ( = ?auto_23325 ?auto_23326 ) ) ( not ( = ?auto_23325 ?auto_23356 ) ) ( not ( = ?auto_23326 ?auto_23356 ) ) ( not ( = ?auto_23334 ?auto_23349 ) ) ( IS-CRATE ?auto_23325 ) ( SURFACE-AT ?auto_23325 ?auto_23331 ) ( ON ?auto_23325 ?auto_23338 ) ( CLEAR ?auto_23325 ) ( not ( = ?auto_23324 ?auto_23325 ) ) ( not ( = ?auto_23324 ?auto_23338 ) ) ( not ( = ?auto_23325 ?auto_23338 ) ) ( IS-CRATE ?auto_23324 ) ( not ( = ?auto_23345 ?auto_23335 ) ) ( HOIST-AT ?auto_23340 ?auto_23345 ) ( AVAILABLE ?auto_23340 ) ( SURFACE-AT ?auto_23324 ?auto_23345 ) ( ON ?auto_23324 ?auto_23355 ) ( CLEAR ?auto_23324 ) ( not ( = ?auto_23323 ?auto_23324 ) ) ( not ( = ?auto_23323 ?auto_23355 ) ) ( not ( = ?auto_23324 ?auto_23355 ) ) ( not ( = ?auto_23334 ?auto_23340 ) ) ( IS-CRATE ?auto_23323 ) ( not ( = ?auto_23343 ?auto_23335 ) ) ( HOIST-AT ?auto_23339 ?auto_23343 ) ( AVAILABLE ?auto_23339 ) ( SURFACE-AT ?auto_23323 ?auto_23343 ) ( ON ?auto_23323 ?auto_23347 ) ( CLEAR ?auto_23323 ) ( not ( = ?auto_23322 ?auto_23323 ) ) ( not ( = ?auto_23322 ?auto_23347 ) ) ( not ( = ?auto_23323 ?auto_23347 ) ) ( not ( = ?auto_23334 ?auto_23339 ) ) ( IS-CRATE ?auto_23322 ) ( not ( = ?auto_23353 ?auto_23335 ) ) ( HOIST-AT ?auto_23357 ?auto_23353 ) ( AVAILABLE ?auto_23357 ) ( SURFACE-AT ?auto_23322 ?auto_23353 ) ( ON ?auto_23322 ?auto_23350 ) ( CLEAR ?auto_23322 ) ( not ( = ?auto_23321 ?auto_23322 ) ) ( not ( = ?auto_23321 ?auto_23350 ) ) ( not ( = ?auto_23322 ?auto_23350 ) ) ( not ( = ?auto_23334 ?auto_23357 ) ) ( IS-CRATE ?auto_23321 ) ( AVAILABLE ?auto_23332 ) ( SURFACE-AT ?auto_23321 ?auto_23331 ) ( ON ?auto_23321 ?auto_23337 ) ( CLEAR ?auto_23321 ) ( not ( = ?auto_23320 ?auto_23321 ) ) ( not ( = ?auto_23320 ?auto_23337 ) ) ( not ( = ?auto_23321 ?auto_23337 ) ) ( IS-CRATE ?auto_23320 ) ( not ( = ?auto_23342 ?auto_23335 ) ) ( HOIST-AT ?auto_23348 ?auto_23342 ) ( AVAILABLE ?auto_23348 ) ( SURFACE-AT ?auto_23320 ?auto_23342 ) ( ON ?auto_23320 ?auto_23341 ) ( CLEAR ?auto_23320 ) ( not ( = ?auto_23319 ?auto_23320 ) ) ( not ( = ?auto_23319 ?auto_23341 ) ) ( not ( = ?auto_23320 ?auto_23341 ) ) ( not ( = ?auto_23334 ?auto_23348 ) ) ( SURFACE-AT ?auto_23318 ?auto_23335 ) ( CLEAR ?auto_23318 ) ( IS-CRATE ?auto_23319 ) ( AVAILABLE ?auto_23334 ) ( AVAILABLE ?auto_23349 ) ( SURFACE-AT ?auto_23319 ?auto_23336 ) ( ON ?auto_23319 ?auto_23344 ) ( CLEAR ?auto_23319 ) ( TRUCK-AT ?auto_23333 ?auto_23335 ) ( not ( = ?auto_23318 ?auto_23319 ) ) ( not ( = ?auto_23318 ?auto_23344 ) ) ( not ( = ?auto_23319 ?auto_23344 ) ) ( not ( = ?auto_23318 ?auto_23320 ) ) ( not ( = ?auto_23318 ?auto_23341 ) ) ( not ( = ?auto_23320 ?auto_23344 ) ) ( not ( = ?auto_23342 ?auto_23336 ) ) ( not ( = ?auto_23348 ?auto_23349 ) ) ( not ( = ?auto_23341 ?auto_23344 ) ) ( not ( = ?auto_23318 ?auto_23321 ) ) ( not ( = ?auto_23318 ?auto_23337 ) ) ( not ( = ?auto_23319 ?auto_23321 ) ) ( not ( = ?auto_23319 ?auto_23337 ) ) ( not ( = ?auto_23321 ?auto_23341 ) ) ( not ( = ?auto_23321 ?auto_23344 ) ) ( not ( = ?auto_23331 ?auto_23342 ) ) ( not ( = ?auto_23331 ?auto_23336 ) ) ( not ( = ?auto_23332 ?auto_23348 ) ) ( not ( = ?auto_23332 ?auto_23349 ) ) ( not ( = ?auto_23337 ?auto_23341 ) ) ( not ( = ?auto_23337 ?auto_23344 ) ) ( not ( = ?auto_23318 ?auto_23322 ) ) ( not ( = ?auto_23318 ?auto_23350 ) ) ( not ( = ?auto_23319 ?auto_23322 ) ) ( not ( = ?auto_23319 ?auto_23350 ) ) ( not ( = ?auto_23320 ?auto_23322 ) ) ( not ( = ?auto_23320 ?auto_23350 ) ) ( not ( = ?auto_23322 ?auto_23337 ) ) ( not ( = ?auto_23322 ?auto_23341 ) ) ( not ( = ?auto_23322 ?auto_23344 ) ) ( not ( = ?auto_23353 ?auto_23331 ) ) ( not ( = ?auto_23353 ?auto_23342 ) ) ( not ( = ?auto_23353 ?auto_23336 ) ) ( not ( = ?auto_23357 ?auto_23332 ) ) ( not ( = ?auto_23357 ?auto_23348 ) ) ( not ( = ?auto_23357 ?auto_23349 ) ) ( not ( = ?auto_23350 ?auto_23337 ) ) ( not ( = ?auto_23350 ?auto_23341 ) ) ( not ( = ?auto_23350 ?auto_23344 ) ) ( not ( = ?auto_23318 ?auto_23323 ) ) ( not ( = ?auto_23318 ?auto_23347 ) ) ( not ( = ?auto_23319 ?auto_23323 ) ) ( not ( = ?auto_23319 ?auto_23347 ) ) ( not ( = ?auto_23320 ?auto_23323 ) ) ( not ( = ?auto_23320 ?auto_23347 ) ) ( not ( = ?auto_23321 ?auto_23323 ) ) ( not ( = ?auto_23321 ?auto_23347 ) ) ( not ( = ?auto_23323 ?auto_23350 ) ) ( not ( = ?auto_23323 ?auto_23337 ) ) ( not ( = ?auto_23323 ?auto_23341 ) ) ( not ( = ?auto_23323 ?auto_23344 ) ) ( not ( = ?auto_23343 ?auto_23353 ) ) ( not ( = ?auto_23343 ?auto_23331 ) ) ( not ( = ?auto_23343 ?auto_23342 ) ) ( not ( = ?auto_23343 ?auto_23336 ) ) ( not ( = ?auto_23339 ?auto_23357 ) ) ( not ( = ?auto_23339 ?auto_23332 ) ) ( not ( = ?auto_23339 ?auto_23348 ) ) ( not ( = ?auto_23339 ?auto_23349 ) ) ( not ( = ?auto_23347 ?auto_23350 ) ) ( not ( = ?auto_23347 ?auto_23337 ) ) ( not ( = ?auto_23347 ?auto_23341 ) ) ( not ( = ?auto_23347 ?auto_23344 ) ) ( not ( = ?auto_23318 ?auto_23324 ) ) ( not ( = ?auto_23318 ?auto_23355 ) ) ( not ( = ?auto_23319 ?auto_23324 ) ) ( not ( = ?auto_23319 ?auto_23355 ) ) ( not ( = ?auto_23320 ?auto_23324 ) ) ( not ( = ?auto_23320 ?auto_23355 ) ) ( not ( = ?auto_23321 ?auto_23324 ) ) ( not ( = ?auto_23321 ?auto_23355 ) ) ( not ( = ?auto_23322 ?auto_23324 ) ) ( not ( = ?auto_23322 ?auto_23355 ) ) ( not ( = ?auto_23324 ?auto_23347 ) ) ( not ( = ?auto_23324 ?auto_23350 ) ) ( not ( = ?auto_23324 ?auto_23337 ) ) ( not ( = ?auto_23324 ?auto_23341 ) ) ( not ( = ?auto_23324 ?auto_23344 ) ) ( not ( = ?auto_23345 ?auto_23343 ) ) ( not ( = ?auto_23345 ?auto_23353 ) ) ( not ( = ?auto_23345 ?auto_23331 ) ) ( not ( = ?auto_23345 ?auto_23342 ) ) ( not ( = ?auto_23345 ?auto_23336 ) ) ( not ( = ?auto_23340 ?auto_23339 ) ) ( not ( = ?auto_23340 ?auto_23357 ) ) ( not ( = ?auto_23340 ?auto_23332 ) ) ( not ( = ?auto_23340 ?auto_23348 ) ) ( not ( = ?auto_23340 ?auto_23349 ) ) ( not ( = ?auto_23355 ?auto_23347 ) ) ( not ( = ?auto_23355 ?auto_23350 ) ) ( not ( = ?auto_23355 ?auto_23337 ) ) ( not ( = ?auto_23355 ?auto_23341 ) ) ( not ( = ?auto_23355 ?auto_23344 ) ) ( not ( = ?auto_23318 ?auto_23325 ) ) ( not ( = ?auto_23318 ?auto_23338 ) ) ( not ( = ?auto_23319 ?auto_23325 ) ) ( not ( = ?auto_23319 ?auto_23338 ) ) ( not ( = ?auto_23320 ?auto_23325 ) ) ( not ( = ?auto_23320 ?auto_23338 ) ) ( not ( = ?auto_23321 ?auto_23325 ) ) ( not ( = ?auto_23321 ?auto_23338 ) ) ( not ( = ?auto_23322 ?auto_23325 ) ) ( not ( = ?auto_23322 ?auto_23338 ) ) ( not ( = ?auto_23323 ?auto_23325 ) ) ( not ( = ?auto_23323 ?auto_23338 ) ) ( not ( = ?auto_23325 ?auto_23355 ) ) ( not ( = ?auto_23325 ?auto_23347 ) ) ( not ( = ?auto_23325 ?auto_23350 ) ) ( not ( = ?auto_23325 ?auto_23337 ) ) ( not ( = ?auto_23325 ?auto_23341 ) ) ( not ( = ?auto_23325 ?auto_23344 ) ) ( not ( = ?auto_23338 ?auto_23355 ) ) ( not ( = ?auto_23338 ?auto_23347 ) ) ( not ( = ?auto_23338 ?auto_23350 ) ) ( not ( = ?auto_23338 ?auto_23337 ) ) ( not ( = ?auto_23338 ?auto_23341 ) ) ( not ( = ?auto_23338 ?auto_23344 ) ) ( not ( = ?auto_23318 ?auto_23326 ) ) ( not ( = ?auto_23318 ?auto_23356 ) ) ( not ( = ?auto_23319 ?auto_23326 ) ) ( not ( = ?auto_23319 ?auto_23356 ) ) ( not ( = ?auto_23320 ?auto_23326 ) ) ( not ( = ?auto_23320 ?auto_23356 ) ) ( not ( = ?auto_23321 ?auto_23326 ) ) ( not ( = ?auto_23321 ?auto_23356 ) ) ( not ( = ?auto_23322 ?auto_23326 ) ) ( not ( = ?auto_23322 ?auto_23356 ) ) ( not ( = ?auto_23323 ?auto_23326 ) ) ( not ( = ?auto_23323 ?auto_23356 ) ) ( not ( = ?auto_23324 ?auto_23326 ) ) ( not ( = ?auto_23324 ?auto_23356 ) ) ( not ( = ?auto_23326 ?auto_23338 ) ) ( not ( = ?auto_23326 ?auto_23355 ) ) ( not ( = ?auto_23326 ?auto_23347 ) ) ( not ( = ?auto_23326 ?auto_23350 ) ) ( not ( = ?auto_23326 ?auto_23337 ) ) ( not ( = ?auto_23326 ?auto_23341 ) ) ( not ( = ?auto_23326 ?auto_23344 ) ) ( not ( = ?auto_23356 ?auto_23338 ) ) ( not ( = ?auto_23356 ?auto_23355 ) ) ( not ( = ?auto_23356 ?auto_23347 ) ) ( not ( = ?auto_23356 ?auto_23350 ) ) ( not ( = ?auto_23356 ?auto_23337 ) ) ( not ( = ?auto_23356 ?auto_23341 ) ) ( not ( = ?auto_23356 ?auto_23344 ) ) ( not ( = ?auto_23318 ?auto_23327 ) ) ( not ( = ?auto_23318 ?auto_23346 ) ) ( not ( = ?auto_23319 ?auto_23327 ) ) ( not ( = ?auto_23319 ?auto_23346 ) ) ( not ( = ?auto_23320 ?auto_23327 ) ) ( not ( = ?auto_23320 ?auto_23346 ) ) ( not ( = ?auto_23321 ?auto_23327 ) ) ( not ( = ?auto_23321 ?auto_23346 ) ) ( not ( = ?auto_23322 ?auto_23327 ) ) ( not ( = ?auto_23322 ?auto_23346 ) ) ( not ( = ?auto_23323 ?auto_23327 ) ) ( not ( = ?auto_23323 ?auto_23346 ) ) ( not ( = ?auto_23324 ?auto_23327 ) ) ( not ( = ?auto_23324 ?auto_23346 ) ) ( not ( = ?auto_23325 ?auto_23327 ) ) ( not ( = ?auto_23325 ?auto_23346 ) ) ( not ( = ?auto_23327 ?auto_23356 ) ) ( not ( = ?auto_23327 ?auto_23338 ) ) ( not ( = ?auto_23327 ?auto_23355 ) ) ( not ( = ?auto_23327 ?auto_23347 ) ) ( not ( = ?auto_23327 ?auto_23350 ) ) ( not ( = ?auto_23327 ?auto_23337 ) ) ( not ( = ?auto_23327 ?auto_23341 ) ) ( not ( = ?auto_23327 ?auto_23344 ) ) ( not ( = ?auto_23346 ?auto_23356 ) ) ( not ( = ?auto_23346 ?auto_23338 ) ) ( not ( = ?auto_23346 ?auto_23355 ) ) ( not ( = ?auto_23346 ?auto_23347 ) ) ( not ( = ?auto_23346 ?auto_23350 ) ) ( not ( = ?auto_23346 ?auto_23337 ) ) ( not ( = ?auto_23346 ?auto_23341 ) ) ( not ( = ?auto_23346 ?auto_23344 ) ) ( not ( = ?auto_23318 ?auto_23328 ) ) ( not ( = ?auto_23318 ?auto_23354 ) ) ( not ( = ?auto_23319 ?auto_23328 ) ) ( not ( = ?auto_23319 ?auto_23354 ) ) ( not ( = ?auto_23320 ?auto_23328 ) ) ( not ( = ?auto_23320 ?auto_23354 ) ) ( not ( = ?auto_23321 ?auto_23328 ) ) ( not ( = ?auto_23321 ?auto_23354 ) ) ( not ( = ?auto_23322 ?auto_23328 ) ) ( not ( = ?auto_23322 ?auto_23354 ) ) ( not ( = ?auto_23323 ?auto_23328 ) ) ( not ( = ?auto_23323 ?auto_23354 ) ) ( not ( = ?auto_23324 ?auto_23328 ) ) ( not ( = ?auto_23324 ?auto_23354 ) ) ( not ( = ?auto_23325 ?auto_23328 ) ) ( not ( = ?auto_23325 ?auto_23354 ) ) ( not ( = ?auto_23326 ?auto_23328 ) ) ( not ( = ?auto_23326 ?auto_23354 ) ) ( not ( = ?auto_23328 ?auto_23346 ) ) ( not ( = ?auto_23328 ?auto_23356 ) ) ( not ( = ?auto_23328 ?auto_23338 ) ) ( not ( = ?auto_23328 ?auto_23355 ) ) ( not ( = ?auto_23328 ?auto_23347 ) ) ( not ( = ?auto_23328 ?auto_23350 ) ) ( not ( = ?auto_23328 ?auto_23337 ) ) ( not ( = ?auto_23328 ?auto_23341 ) ) ( not ( = ?auto_23328 ?auto_23344 ) ) ( not ( = ?auto_23351 ?auto_23331 ) ) ( not ( = ?auto_23351 ?auto_23336 ) ) ( not ( = ?auto_23351 ?auto_23345 ) ) ( not ( = ?auto_23351 ?auto_23343 ) ) ( not ( = ?auto_23351 ?auto_23353 ) ) ( not ( = ?auto_23351 ?auto_23342 ) ) ( not ( = ?auto_23352 ?auto_23332 ) ) ( not ( = ?auto_23352 ?auto_23349 ) ) ( not ( = ?auto_23352 ?auto_23340 ) ) ( not ( = ?auto_23352 ?auto_23339 ) ) ( not ( = ?auto_23352 ?auto_23357 ) ) ( not ( = ?auto_23352 ?auto_23348 ) ) ( not ( = ?auto_23354 ?auto_23346 ) ) ( not ( = ?auto_23354 ?auto_23356 ) ) ( not ( = ?auto_23354 ?auto_23338 ) ) ( not ( = ?auto_23354 ?auto_23355 ) ) ( not ( = ?auto_23354 ?auto_23347 ) ) ( not ( = ?auto_23354 ?auto_23350 ) ) ( not ( = ?auto_23354 ?auto_23337 ) ) ( not ( = ?auto_23354 ?auto_23341 ) ) ( not ( = ?auto_23354 ?auto_23344 ) ) ( not ( = ?auto_23318 ?auto_23329 ) ) ( not ( = ?auto_23318 ?auto_23330 ) ) ( not ( = ?auto_23319 ?auto_23329 ) ) ( not ( = ?auto_23319 ?auto_23330 ) ) ( not ( = ?auto_23320 ?auto_23329 ) ) ( not ( = ?auto_23320 ?auto_23330 ) ) ( not ( = ?auto_23321 ?auto_23329 ) ) ( not ( = ?auto_23321 ?auto_23330 ) ) ( not ( = ?auto_23322 ?auto_23329 ) ) ( not ( = ?auto_23322 ?auto_23330 ) ) ( not ( = ?auto_23323 ?auto_23329 ) ) ( not ( = ?auto_23323 ?auto_23330 ) ) ( not ( = ?auto_23324 ?auto_23329 ) ) ( not ( = ?auto_23324 ?auto_23330 ) ) ( not ( = ?auto_23325 ?auto_23329 ) ) ( not ( = ?auto_23325 ?auto_23330 ) ) ( not ( = ?auto_23326 ?auto_23329 ) ) ( not ( = ?auto_23326 ?auto_23330 ) ) ( not ( = ?auto_23327 ?auto_23329 ) ) ( not ( = ?auto_23327 ?auto_23330 ) ) ( not ( = ?auto_23329 ?auto_23354 ) ) ( not ( = ?auto_23329 ?auto_23346 ) ) ( not ( = ?auto_23329 ?auto_23356 ) ) ( not ( = ?auto_23329 ?auto_23338 ) ) ( not ( = ?auto_23329 ?auto_23355 ) ) ( not ( = ?auto_23329 ?auto_23347 ) ) ( not ( = ?auto_23329 ?auto_23350 ) ) ( not ( = ?auto_23329 ?auto_23337 ) ) ( not ( = ?auto_23329 ?auto_23341 ) ) ( not ( = ?auto_23329 ?auto_23344 ) ) ( not ( = ?auto_23330 ?auto_23354 ) ) ( not ( = ?auto_23330 ?auto_23346 ) ) ( not ( = ?auto_23330 ?auto_23356 ) ) ( not ( = ?auto_23330 ?auto_23338 ) ) ( not ( = ?auto_23330 ?auto_23355 ) ) ( not ( = ?auto_23330 ?auto_23347 ) ) ( not ( = ?auto_23330 ?auto_23350 ) ) ( not ( = ?auto_23330 ?auto_23337 ) ) ( not ( = ?auto_23330 ?auto_23341 ) ) ( not ( = ?auto_23330 ?auto_23344 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_23318 ?auto_23319 ?auto_23320 ?auto_23321 ?auto_23322 ?auto_23323 ?auto_23324 ?auto_23325 ?auto_23326 ?auto_23327 ?auto_23328 )
      ( MAKE-1CRATE ?auto_23328 ?auto_23329 )
      ( MAKE-11CRATE-VERIFY ?auto_23318 ?auto_23319 ?auto_23320 ?auto_23321 ?auto_23322 ?auto_23323 ?auto_23324 ?auto_23325 ?auto_23326 ?auto_23327 ?auto_23328 ?auto_23329 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_23381 - SURFACE
      ?auto_23382 - SURFACE
      ?auto_23383 - SURFACE
      ?auto_23384 - SURFACE
      ?auto_23385 - SURFACE
      ?auto_23386 - SURFACE
      ?auto_23387 - SURFACE
      ?auto_23388 - SURFACE
      ?auto_23389 - SURFACE
      ?auto_23390 - SURFACE
      ?auto_23391 - SURFACE
      ?auto_23392 - SURFACE
      ?auto_23393 - SURFACE
    )
    :vars
    (
      ?auto_23394 - HOIST
      ?auto_23396 - PLACE
      ?auto_23395 - PLACE
      ?auto_23398 - HOIST
      ?auto_23397 - SURFACE
      ?auto_23414 - PLACE
      ?auto_23415 - HOIST
      ?auto_23420 - SURFACE
      ?auto_23401 - PLACE
      ?auto_23412 - HOIST
      ?auto_23404 - SURFACE
      ?auto_23419 - SURFACE
      ?auto_23407 - PLACE
      ?auto_23408 - HOIST
      ?auto_23411 - SURFACE
      ?auto_23402 - SURFACE
      ?auto_23418 - PLACE
      ?auto_23417 - HOIST
      ?auto_23409 - SURFACE
      ?auto_23403 - PLACE
      ?auto_23422 - HOIST
      ?auto_23410 - SURFACE
      ?auto_23416 - SURFACE
      ?auto_23400 - SURFACE
      ?auto_23406 - PLACE
      ?auto_23421 - HOIST
      ?auto_23413 - SURFACE
      ?auto_23405 - SURFACE
      ?auto_23399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23394 ?auto_23396 ) ( IS-CRATE ?auto_23393 ) ( not ( = ?auto_23395 ?auto_23396 ) ) ( HOIST-AT ?auto_23398 ?auto_23395 ) ( SURFACE-AT ?auto_23393 ?auto_23395 ) ( ON ?auto_23393 ?auto_23397 ) ( CLEAR ?auto_23393 ) ( not ( = ?auto_23392 ?auto_23393 ) ) ( not ( = ?auto_23392 ?auto_23397 ) ) ( not ( = ?auto_23393 ?auto_23397 ) ) ( not ( = ?auto_23394 ?auto_23398 ) ) ( IS-CRATE ?auto_23392 ) ( not ( = ?auto_23414 ?auto_23396 ) ) ( HOIST-AT ?auto_23415 ?auto_23414 ) ( SURFACE-AT ?auto_23392 ?auto_23414 ) ( ON ?auto_23392 ?auto_23420 ) ( CLEAR ?auto_23392 ) ( not ( = ?auto_23391 ?auto_23392 ) ) ( not ( = ?auto_23391 ?auto_23420 ) ) ( not ( = ?auto_23392 ?auto_23420 ) ) ( not ( = ?auto_23394 ?auto_23415 ) ) ( IS-CRATE ?auto_23391 ) ( not ( = ?auto_23401 ?auto_23396 ) ) ( HOIST-AT ?auto_23412 ?auto_23401 ) ( AVAILABLE ?auto_23412 ) ( SURFACE-AT ?auto_23391 ?auto_23401 ) ( ON ?auto_23391 ?auto_23404 ) ( CLEAR ?auto_23391 ) ( not ( = ?auto_23390 ?auto_23391 ) ) ( not ( = ?auto_23390 ?auto_23404 ) ) ( not ( = ?auto_23391 ?auto_23404 ) ) ( not ( = ?auto_23394 ?auto_23412 ) ) ( IS-CRATE ?auto_23390 ) ( SURFACE-AT ?auto_23390 ?auto_23414 ) ( ON ?auto_23390 ?auto_23419 ) ( CLEAR ?auto_23390 ) ( not ( = ?auto_23389 ?auto_23390 ) ) ( not ( = ?auto_23389 ?auto_23419 ) ) ( not ( = ?auto_23390 ?auto_23419 ) ) ( IS-CRATE ?auto_23389 ) ( not ( = ?auto_23407 ?auto_23396 ) ) ( HOIST-AT ?auto_23408 ?auto_23407 ) ( SURFACE-AT ?auto_23389 ?auto_23407 ) ( ON ?auto_23389 ?auto_23411 ) ( CLEAR ?auto_23389 ) ( not ( = ?auto_23388 ?auto_23389 ) ) ( not ( = ?auto_23388 ?auto_23411 ) ) ( not ( = ?auto_23389 ?auto_23411 ) ) ( not ( = ?auto_23394 ?auto_23408 ) ) ( IS-CRATE ?auto_23388 ) ( SURFACE-AT ?auto_23388 ?auto_23414 ) ( ON ?auto_23388 ?auto_23402 ) ( CLEAR ?auto_23388 ) ( not ( = ?auto_23387 ?auto_23388 ) ) ( not ( = ?auto_23387 ?auto_23402 ) ) ( not ( = ?auto_23388 ?auto_23402 ) ) ( IS-CRATE ?auto_23387 ) ( not ( = ?auto_23418 ?auto_23396 ) ) ( HOIST-AT ?auto_23417 ?auto_23418 ) ( AVAILABLE ?auto_23417 ) ( SURFACE-AT ?auto_23387 ?auto_23418 ) ( ON ?auto_23387 ?auto_23409 ) ( CLEAR ?auto_23387 ) ( not ( = ?auto_23386 ?auto_23387 ) ) ( not ( = ?auto_23386 ?auto_23409 ) ) ( not ( = ?auto_23387 ?auto_23409 ) ) ( not ( = ?auto_23394 ?auto_23417 ) ) ( IS-CRATE ?auto_23386 ) ( not ( = ?auto_23403 ?auto_23396 ) ) ( HOIST-AT ?auto_23422 ?auto_23403 ) ( AVAILABLE ?auto_23422 ) ( SURFACE-AT ?auto_23386 ?auto_23403 ) ( ON ?auto_23386 ?auto_23410 ) ( CLEAR ?auto_23386 ) ( not ( = ?auto_23385 ?auto_23386 ) ) ( not ( = ?auto_23385 ?auto_23410 ) ) ( not ( = ?auto_23386 ?auto_23410 ) ) ( not ( = ?auto_23394 ?auto_23422 ) ) ( IS-CRATE ?auto_23385 ) ( AVAILABLE ?auto_23398 ) ( SURFACE-AT ?auto_23385 ?auto_23395 ) ( ON ?auto_23385 ?auto_23416 ) ( CLEAR ?auto_23385 ) ( not ( = ?auto_23384 ?auto_23385 ) ) ( not ( = ?auto_23384 ?auto_23416 ) ) ( not ( = ?auto_23385 ?auto_23416 ) ) ( IS-CRATE ?auto_23384 ) ( AVAILABLE ?auto_23415 ) ( SURFACE-AT ?auto_23384 ?auto_23414 ) ( ON ?auto_23384 ?auto_23400 ) ( CLEAR ?auto_23384 ) ( not ( = ?auto_23383 ?auto_23384 ) ) ( not ( = ?auto_23383 ?auto_23400 ) ) ( not ( = ?auto_23384 ?auto_23400 ) ) ( IS-CRATE ?auto_23383 ) ( not ( = ?auto_23406 ?auto_23396 ) ) ( HOIST-AT ?auto_23421 ?auto_23406 ) ( AVAILABLE ?auto_23421 ) ( SURFACE-AT ?auto_23383 ?auto_23406 ) ( ON ?auto_23383 ?auto_23413 ) ( CLEAR ?auto_23383 ) ( not ( = ?auto_23382 ?auto_23383 ) ) ( not ( = ?auto_23382 ?auto_23413 ) ) ( not ( = ?auto_23383 ?auto_23413 ) ) ( not ( = ?auto_23394 ?auto_23421 ) ) ( SURFACE-AT ?auto_23381 ?auto_23396 ) ( CLEAR ?auto_23381 ) ( IS-CRATE ?auto_23382 ) ( AVAILABLE ?auto_23394 ) ( AVAILABLE ?auto_23408 ) ( SURFACE-AT ?auto_23382 ?auto_23407 ) ( ON ?auto_23382 ?auto_23405 ) ( CLEAR ?auto_23382 ) ( TRUCK-AT ?auto_23399 ?auto_23396 ) ( not ( = ?auto_23381 ?auto_23382 ) ) ( not ( = ?auto_23381 ?auto_23405 ) ) ( not ( = ?auto_23382 ?auto_23405 ) ) ( not ( = ?auto_23381 ?auto_23383 ) ) ( not ( = ?auto_23381 ?auto_23413 ) ) ( not ( = ?auto_23383 ?auto_23405 ) ) ( not ( = ?auto_23406 ?auto_23407 ) ) ( not ( = ?auto_23421 ?auto_23408 ) ) ( not ( = ?auto_23413 ?auto_23405 ) ) ( not ( = ?auto_23381 ?auto_23384 ) ) ( not ( = ?auto_23381 ?auto_23400 ) ) ( not ( = ?auto_23382 ?auto_23384 ) ) ( not ( = ?auto_23382 ?auto_23400 ) ) ( not ( = ?auto_23384 ?auto_23413 ) ) ( not ( = ?auto_23384 ?auto_23405 ) ) ( not ( = ?auto_23414 ?auto_23406 ) ) ( not ( = ?auto_23414 ?auto_23407 ) ) ( not ( = ?auto_23415 ?auto_23421 ) ) ( not ( = ?auto_23415 ?auto_23408 ) ) ( not ( = ?auto_23400 ?auto_23413 ) ) ( not ( = ?auto_23400 ?auto_23405 ) ) ( not ( = ?auto_23381 ?auto_23385 ) ) ( not ( = ?auto_23381 ?auto_23416 ) ) ( not ( = ?auto_23382 ?auto_23385 ) ) ( not ( = ?auto_23382 ?auto_23416 ) ) ( not ( = ?auto_23383 ?auto_23385 ) ) ( not ( = ?auto_23383 ?auto_23416 ) ) ( not ( = ?auto_23385 ?auto_23400 ) ) ( not ( = ?auto_23385 ?auto_23413 ) ) ( not ( = ?auto_23385 ?auto_23405 ) ) ( not ( = ?auto_23395 ?auto_23414 ) ) ( not ( = ?auto_23395 ?auto_23406 ) ) ( not ( = ?auto_23395 ?auto_23407 ) ) ( not ( = ?auto_23398 ?auto_23415 ) ) ( not ( = ?auto_23398 ?auto_23421 ) ) ( not ( = ?auto_23398 ?auto_23408 ) ) ( not ( = ?auto_23416 ?auto_23400 ) ) ( not ( = ?auto_23416 ?auto_23413 ) ) ( not ( = ?auto_23416 ?auto_23405 ) ) ( not ( = ?auto_23381 ?auto_23386 ) ) ( not ( = ?auto_23381 ?auto_23410 ) ) ( not ( = ?auto_23382 ?auto_23386 ) ) ( not ( = ?auto_23382 ?auto_23410 ) ) ( not ( = ?auto_23383 ?auto_23386 ) ) ( not ( = ?auto_23383 ?auto_23410 ) ) ( not ( = ?auto_23384 ?auto_23386 ) ) ( not ( = ?auto_23384 ?auto_23410 ) ) ( not ( = ?auto_23386 ?auto_23416 ) ) ( not ( = ?auto_23386 ?auto_23400 ) ) ( not ( = ?auto_23386 ?auto_23413 ) ) ( not ( = ?auto_23386 ?auto_23405 ) ) ( not ( = ?auto_23403 ?auto_23395 ) ) ( not ( = ?auto_23403 ?auto_23414 ) ) ( not ( = ?auto_23403 ?auto_23406 ) ) ( not ( = ?auto_23403 ?auto_23407 ) ) ( not ( = ?auto_23422 ?auto_23398 ) ) ( not ( = ?auto_23422 ?auto_23415 ) ) ( not ( = ?auto_23422 ?auto_23421 ) ) ( not ( = ?auto_23422 ?auto_23408 ) ) ( not ( = ?auto_23410 ?auto_23416 ) ) ( not ( = ?auto_23410 ?auto_23400 ) ) ( not ( = ?auto_23410 ?auto_23413 ) ) ( not ( = ?auto_23410 ?auto_23405 ) ) ( not ( = ?auto_23381 ?auto_23387 ) ) ( not ( = ?auto_23381 ?auto_23409 ) ) ( not ( = ?auto_23382 ?auto_23387 ) ) ( not ( = ?auto_23382 ?auto_23409 ) ) ( not ( = ?auto_23383 ?auto_23387 ) ) ( not ( = ?auto_23383 ?auto_23409 ) ) ( not ( = ?auto_23384 ?auto_23387 ) ) ( not ( = ?auto_23384 ?auto_23409 ) ) ( not ( = ?auto_23385 ?auto_23387 ) ) ( not ( = ?auto_23385 ?auto_23409 ) ) ( not ( = ?auto_23387 ?auto_23410 ) ) ( not ( = ?auto_23387 ?auto_23416 ) ) ( not ( = ?auto_23387 ?auto_23400 ) ) ( not ( = ?auto_23387 ?auto_23413 ) ) ( not ( = ?auto_23387 ?auto_23405 ) ) ( not ( = ?auto_23418 ?auto_23403 ) ) ( not ( = ?auto_23418 ?auto_23395 ) ) ( not ( = ?auto_23418 ?auto_23414 ) ) ( not ( = ?auto_23418 ?auto_23406 ) ) ( not ( = ?auto_23418 ?auto_23407 ) ) ( not ( = ?auto_23417 ?auto_23422 ) ) ( not ( = ?auto_23417 ?auto_23398 ) ) ( not ( = ?auto_23417 ?auto_23415 ) ) ( not ( = ?auto_23417 ?auto_23421 ) ) ( not ( = ?auto_23417 ?auto_23408 ) ) ( not ( = ?auto_23409 ?auto_23410 ) ) ( not ( = ?auto_23409 ?auto_23416 ) ) ( not ( = ?auto_23409 ?auto_23400 ) ) ( not ( = ?auto_23409 ?auto_23413 ) ) ( not ( = ?auto_23409 ?auto_23405 ) ) ( not ( = ?auto_23381 ?auto_23388 ) ) ( not ( = ?auto_23381 ?auto_23402 ) ) ( not ( = ?auto_23382 ?auto_23388 ) ) ( not ( = ?auto_23382 ?auto_23402 ) ) ( not ( = ?auto_23383 ?auto_23388 ) ) ( not ( = ?auto_23383 ?auto_23402 ) ) ( not ( = ?auto_23384 ?auto_23388 ) ) ( not ( = ?auto_23384 ?auto_23402 ) ) ( not ( = ?auto_23385 ?auto_23388 ) ) ( not ( = ?auto_23385 ?auto_23402 ) ) ( not ( = ?auto_23386 ?auto_23388 ) ) ( not ( = ?auto_23386 ?auto_23402 ) ) ( not ( = ?auto_23388 ?auto_23409 ) ) ( not ( = ?auto_23388 ?auto_23410 ) ) ( not ( = ?auto_23388 ?auto_23416 ) ) ( not ( = ?auto_23388 ?auto_23400 ) ) ( not ( = ?auto_23388 ?auto_23413 ) ) ( not ( = ?auto_23388 ?auto_23405 ) ) ( not ( = ?auto_23402 ?auto_23409 ) ) ( not ( = ?auto_23402 ?auto_23410 ) ) ( not ( = ?auto_23402 ?auto_23416 ) ) ( not ( = ?auto_23402 ?auto_23400 ) ) ( not ( = ?auto_23402 ?auto_23413 ) ) ( not ( = ?auto_23402 ?auto_23405 ) ) ( not ( = ?auto_23381 ?auto_23389 ) ) ( not ( = ?auto_23381 ?auto_23411 ) ) ( not ( = ?auto_23382 ?auto_23389 ) ) ( not ( = ?auto_23382 ?auto_23411 ) ) ( not ( = ?auto_23383 ?auto_23389 ) ) ( not ( = ?auto_23383 ?auto_23411 ) ) ( not ( = ?auto_23384 ?auto_23389 ) ) ( not ( = ?auto_23384 ?auto_23411 ) ) ( not ( = ?auto_23385 ?auto_23389 ) ) ( not ( = ?auto_23385 ?auto_23411 ) ) ( not ( = ?auto_23386 ?auto_23389 ) ) ( not ( = ?auto_23386 ?auto_23411 ) ) ( not ( = ?auto_23387 ?auto_23389 ) ) ( not ( = ?auto_23387 ?auto_23411 ) ) ( not ( = ?auto_23389 ?auto_23402 ) ) ( not ( = ?auto_23389 ?auto_23409 ) ) ( not ( = ?auto_23389 ?auto_23410 ) ) ( not ( = ?auto_23389 ?auto_23416 ) ) ( not ( = ?auto_23389 ?auto_23400 ) ) ( not ( = ?auto_23389 ?auto_23413 ) ) ( not ( = ?auto_23389 ?auto_23405 ) ) ( not ( = ?auto_23411 ?auto_23402 ) ) ( not ( = ?auto_23411 ?auto_23409 ) ) ( not ( = ?auto_23411 ?auto_23410 ) ) ( not ( = ?auto_23411 ?auto_23416 ) ) ( not ( = ?auto_23411 ?auto_23400 ) ) ( not ( = ?auto_23411 ?auto_23413 ) ) ( not ( = ?auto_23411 ?auto_23405 ) ) ( not ( = ?auto_23381 ?auto_23390 ) ) ( not ( = ?auto_23381 ?auto_23419 ) ) ( not ( = ?auto_23382 ?auto_23390 ) ) ( not ( = ?auto_23382 ?auto_23419 ) ) ( not ( = ?auto_23383 ?auto_23390 ) ) ( not ( = ?auto_23383 ?auto_23419 ) ) ( not ( = ?auto_23384 ?auto_23390 ) ) ( not ( = ?auto_23384 ?auto_23419 ) ) ( not ( = ?auto_23385 ?auto_23390 ) ) ( not ( = ?auto_23385 ?auto_23419 ) ) ( not ( = ?auto_23386 ?auto_23390 ) ) ( not ( = ?auto_23386 ?auto_23419 ) ) ( not ( = ?auto_23387 ?auto_23390 ) ) ( not ( = ?auto_23387 ?auto_23419 ) ) ( not ( = ?auto_23388 ?auto_23390 ) ) ( not ( = ?auto_23388 ?auto_23419 ) ) ( not ( = ?auto_23390 ?auto_23411 ) ) ( not ( = ?auto_23390 ?auto_23402 ) ) ( not ( = ?auto_23390 ?auto_23409 ) ) ( not ( = ?auto_23390 ?auto_23410 ) ) ( not ( = ?auto_23390 ?auto_23416 ) ) ( not ( = ?auto_23390 ?auto_23400 ) ) ( not ( = ?auto_23390 ?auto_23413 ) ) ( not ( = ?auto_23390 ?auto_23405 ) ) ( not ( = ?auto_23419 ?auto_23411 ) ) ( not ( = ?auto_23419 ?auto_23402 ) ) ( not ( = ?auto_23419 ?auto_23409 ) ) ( not ( = ?auto_23419 ?auto_23410 ) ) ( not ( = ?auto_23419 ?auto_23416 ) ) ( not ( = ?auto_23419 ?auto_23400 ) ) ( not ( = ?auto_23419 ?auto_23413 ) ) ( not ( = ?auto_23419 ?auto_23405 ) ) ( not ( = ?auto_23381 ?auto_23391 ) ) ( not ( = ?auto_23381 ?auto_23404 ) ) ( not ( = ?auto_23382 ?auto_23391 ) ) ( not ( = ?auto_23382 ?auto_23404 ) ) ( not ( = ?auto_23383 ?auto_23391 ) ) ( not ( = ?auto_23383 ?auto_23404 ) ) ( not ( = ?auto_23384 ?auto_23391 ) ) ( not ( = ?auto_23384 ?auto_23404 ) ) ( not ( = ?auto_23385 ?auto_23391 ) ) ( not ( = ?auto_23385 ?auto_23404 ) ) ( not ( = ?auto_23386 ?auto_23391 ) ) ( not ( = ?auto_23386 ?auto_23404 ) ) ( not ( = ?auto_23387 ?auto_23391 ) ) ( not ( = ?auto_23387 ?auto_23404 ) ) ( not ( = ?auto_23388 ?auto_23391 ) ) ( not ( = ?auto_23388 ?auto_23404 ) ) ( not ( = ?auto_23389 ?auto_23391 ) ) ( not ( = ?auto_23389 ?auto_23404 ) ) ( not ( = ?auto_23391 ?auto_23419 ) ) ( not ( = ?auto_23391 ?auto_23411 ) ) ( not ( = ?auto_23391 ?auto_23402 ) ) ( not ( = ?auto_23391 ?auto_23409 ) ) ( not ( = ?auto_23391 ?auto_23410 ) ) ( not ( = ?auto_23391 ?auto_23416 ) ) ( not ( = ?auto_23391 ?auto_23400 ) ) ( not ( = ?auto_23391 ?auto_23413 ) ) ( not ( = ?auto_23391 ?auto_23405 ) ) ( not ( = ?auto_23401 ?auto_23414 ) ) ( not ( = ?auto_23401 ?auto_23407 ) ) ( not ( = ?auto_23401 ?auto_23418 ) ) ( not ( = ?auto_23401 ?auto_23403 ) ) ( not ( = ?auto_23401 ?auto_23395 ) ) ( not ( = ?auto_23401 ?auto_23406 ) ) ( not ( = ?auto_23412 ?auto_23415 ) ) ( not ( = ?auto_23412 ?auto_23408 ) ) ( not ( = ?auto_23412 ?auto_23417 ) ) ( not ( = ?auto_23412 ?auto_23422 ) ) ( not ( = ?auto_23412 ?auto_23398 ) ) ( not ( = ?auto_23412 ?auto_23421 ) ) ( not ( = ?auto_23404 ?auto_23419 ) ) ( not ( = ?auto_23404 ?auto_23411 ) ) ( not ( = ?auto_23404 ?auto_23402 ) ) ( not ( = ?auto_23404 ?auto_23409 ) ) ( not ( = ?auto_23404 ?auto_23410 ) ) ( not ( = ?auto_23404 ?auto_23416 ) ) ( not ( = ?auto_23404 ?auto_23400 ) ) ( not ( = ?auto_23404 ?auto_23413 ) ) ( not ( = ?auto_23404 ?auto_23405 ) ) ( not ( = ?auto_23381 ?auto_23392 ) ) ( not ( = ?auto_23381 ?auto_23420 ) ) ( not ( = ?auto_23382 ?auto_23392 ) ) ( not ( = ?auto_23382 ?auto_23420 ) ) ( not ( = ?auto_23383 ?auto_23392 ) ) ( not ( = ?auto_23383 ?auto_23420 ) ) ( not ( = ?auto_23384 ?auto_23392 ) ) ( not ( = ?auto_23384 ?auto_23420 ) ) ( not ( = ?auto_23385 ?auto_23392 ) ) ( not ( = ?auto_23385 ?auto_23420 ) ) ( not ( = ?auto_23386 ?auto_23392 ) ) ( not ( = ?auto_23386 ?auto_23420 ) ) ( not ( = ?auto_23387 ?auto_23392 ) ) ( not ( = ?auto_23387 ?auto_23420 ) ) ( not ( = ?auto_23388 ?auto_23392 ) ) ( not ( = ?auto_23388 ?auto_23420 ) ) ( not ( = ?auto_23389 ?auto_23392 ) ) ( not ( = ?auto_23389 ?auto_23420 ) ) ( not ( = ?auto_23390 ?auto_23392 ) ) ( not ( = ?auto_23390 ?auto_23420 ) ) ( not ( = ?auto_23392 ?auto_23404 ) ) ( not ( = ?auto_23392 ?auto_23419 ) ) ( not ( = ?auto_23392 ?auto_23411 ) ) ( not ( = ?auto_23392 ?auto_23402 ) ) ( not ( = ?auto_23392 ?auto_23409 ) ) ( not ( = ?auto_23392 ?auto_23410 ) ) ( not ( = ?auto_23392 ?auto_23416 ) ) ( not ( = ?auto_23392 ?auto_23400 ) ) ( not ( = ?auto_23392 ?auto_23413 ) ) ( not ( = ?auto_23392 ?auto_23405 ) ) ( not ( = ?auto_23420 ?auto_23404 ) ) ( not ( = ?auto_23420 ?auto_23419 ) ) ( not ( = ?auto_23420 ?auto_23411 ) ) ( not ( = ?auto_23420 ?auto_23402 ) ) ( not ( = ?auto_23420 ?auto_23409 ) ) ( not ( = ?auto_23420 ?auto_23410 ) ) ( not ( = ?auto_23420 ?auto_23416 ) ) ( not ( = ?auto_23420 ?auto_23400 ) ) ( not ( = ?auto_23420 ?auto_23413 ) ) ( not ( = ?auto_23420 ?auto_23405 ) ) ( not ( = ?auto_23381 ?auto_23393 ) ) ( not ( = ?auto_23381 ?auto_23397 ) ) ( not ( = ?auto_23382 ?auto_23393 ) ) ( not ( = ?auto_23382 ?auto_23397 ) ) ( not ( = ?auto_23383 ?auto_23393 ) ) ( not ( = ?auto_23383 ?auto_23397 ) ) ( not ( = ?auto_23384 ?auto_23393 ) ) ( not ( = ?auto_23384 ?auto_23397 ) ) ( not ( = ?auto_23385 ?auto_23393 ) ) ( not ( = ?auto_23385 ?auto_23397 ) ) ( not ( = ?auto_23386 ?auto_23393 ) ) ( not ( = ?auto_23386 ?auto_23397 ) ) ( not ( = ?auto_23387 ?auto_23393 ) ) ( not ( = ?auto_23387 ?auto_23397 ) ) ( not ( = ?auto_23388 ?auto_23393 ) ) ( not ( = ?auto_23388 ?auto_23397 ) ) ( not ( = ?auto_23389 ?auto_23393 ) ) ( not ( = ?auto_23389 ?auto_23397 ) ) ( not ( = ?auto_23390 ?auto_23393 ) ) ( not ( = ?auto_23390 ?auto_23397 ) ) ( not ( = ?auto_23391 ?auto_23393 ) ) ( not ( = ?auto_23391 ?auto_23397 ) ) ( not ( = ?auto_23393 ?auto_23420 ) ) ( not ( = ?auto_23393 ?auto_23404 ) ) ( not ( = ?auto_23393 ?auto_23419 ) ) ( not ( = ?auto_23393 ?auto_23411 ) ) ( not ( = ?auto_23393 ?auto_23402 ) ) ( not ( = ?auto_23393 ?auto_23409 ) ) ( not ( = ?auto_23393 ?auto_23410 ) ) ( not ( = ?auto_23393 ?auto_23416 ) ) ( not ( = ?auto_23393 ?auto_23400 ) ) ( not ( = ?auto_23393 ?auto_23413 ) ) ( not ( = ?auto_23393 ?auto_23405 ) ) ( not ( = ?auto_23397 ?auto_23420 ) ) ( not ( = ?auto_23397 ?auto_23404 ) ) ( not ( = ?auto_23397 ?auto_23419 ) ) ( not ( = ?auto_23397 ?auto_23411 ) ) ( not ( = ?auto_23397 ?auto_23402 ) ) ( not ( = ?auto_23397 ?auto_23409 ) ) ( not ( = ?auto_23397 ?auto_23410 ) ) ( not ( = ?auto_23397 ?auto_23416 ) ) ( not ( = ?auto_23397 ?auto_23400 ) ) ( not ( = ?auto_23397 ?auto_23413 ) ) ( not ( = ?auto_23397 ?auto_23405 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_23381 ?auto_23382 ?auto_23383 ?auto_23384 ?auto_23385 ?auto_23386 ?auto_23387 ?auto_23388 ?auto_23389 ?auto_23390 ?auto_23391 ?auto_23392 )
      ( MAKE-1CRATE ?auto_23392 ?auto_23393 )
      ( MAKE-12CRATE-VERIFY ?auto_23381 ?auto_23382 ?auto_23383 ?auto_23384 ?auto_23385 ?auto_23386 ?auto_23387 ?auto_23388 ?auto_23389 ?auto_23390 ?auto_23391 ?auto_23392 ?auto_23393 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_23447 - SURFACE
      ?auto_23448 - SURFACE
      ?auto_23449 - SURFACE
      ?auto_23450 - SURFACE
      ?auto_23451 - SURFACE
      ?auto_23452 - SURFACE
      ?auto_23453 - SURFACE
      ?auto_23454 - SURFACE
      ?auto_23455 - SURFACE
      ?auto_23456 - SURFACE
      ?auto_23457 - SURFACE
      ?auto_23458 - SURFACE
      ?auto_23459 - SURFACE
      ?auto_23460 - SURFACE
    )
    :vars
    (
      ?auto_23466 - HOIST
      ?auto_23463 - PLACE
      ?auto_23462 - PLACE
      ?auto_23464 - HOIST
      ?auto_23465 - SURFACE
      ?auto_23477 - SURFACE
      ?auto_23469 - PLACE
      ?auto_23483 - HOIST
      ?auto_23482 - SURFACE
      ?auto_23474 - PLACE
      ?auto_23484 - HOIST
      ?auto_23470 - SURFACE
      ?auto_23467 - SURFACE
      ?auto_23480 - PLACE
      ?auto_23481 - HOIST
      ?auto_23468 - SURFACE
      ?auto_23476 - SURFACE
      ?auto_23490 - PLACE
      ?auto_23473 - HOIST
      ?auto_23471 - SURFACE
      ?auto_23487 - PLACE
      ?auto_23472 - HOIST
      ?auto_23488 - SURFACE
      ?auto_23485 - SURFACE
      ?auto_23478 - SURFACE
      ?auto_23479 - PLACE
      ?auto_23489 - HOIST
      ?auto_23486 - SURFACE
      ?auto_23475 - SURFACE
      ?auto_23461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23466 ?auto_23463 ) ( IS-CRATE ?auto_23460 ) ( not ( = ?auto_23462 ?auto_23463 ) ) ( HOIST-AT ?auto_23464 ?auto_23462 ) ( SURFACE-AT ?auto_23460 ?auto_23462 ) ( ON ?auto_23460 ?auto_23465 ) ( CLEAR ?auto_23460 ) ( not ( = ?auto_23459 ?auto_23460 ) ) ( not ( = ?auto_23459 ?auto_23465 ) ) ( not ( = ?auto_23460 ?auto_23465 ) ) ( not ( = ?auto_23466 ?auto_23464 ) ) ( IS-CRATE ?auto_23459 ) ( SURFACE-AT ?auto_23459 ?auto_23462 ) ( ON ?auto_23459 ?auto_23477 ) ( CLEAR ?auto_23459 ) ( not ( = ?auto_23458 ?auto_23459 ) ) ( not ( = ?auto_23458 ?auto_23477 ) ) ( not ( = ?auto_23459 ?auto_23477 ) ) ( IS-CRATE ?auto_23458 ) ( not ( = ?auto_23469 ?auto_23463 ) ) ( HOIST-AT ?auto_23483 ?auto_23469 ) ( SURFACE-AT ?auto_23458 ?auto_23469 ) ( ON ?auto_23458 ?auto_23482 ) ( CLEAR ?auto_23458 ) ( not ( = ?auto_23457 ?auto_23458 ) ) ( not ( = ?auto_23457 ?auto_23482 ) ) ( not ( = ?auto_23458 ?auto_23482 ) ) ( not ( = ?auto_23466 ?auto_23483 ) ) ( IS-CRATE ?auto_23457 ) ( not ( = ?auto_23474 ?auto_23463 ) ) ( HOIST-AT ?auto_23484 ?auto_23474 ) ( AVAILABLE ?auto_23484 ) ( SURFACE-AT ?auto_23457 ?auto_23474 ) ( ON ?auto_23457 ?auto_23470 ) ( CLEAR ?auto_23457 ) ( not ( = ?auto_23456 ?auto_23457 ) ) ( not ( = ?auto_23456 ?auto_23470 ) ) ( not ( = ?auto_23457 ?auto_23470 ) ) ( not ( = ?auto_23466 ?auto_23484 ) ) ( IS-CRATE ?auto_23456 ) ( SURFACE-AT ?auto_23456 ?auto_23469 ) ( ON ?auto_23456 ?auto_23467 ) ( CLEAR ?auto_23456 ) ( not ( = ?auto_23455 ?auto_23456 ) ) ( not ( = ?auto_23455 ?auto_23467 ) ) ( not ( = ?auto_23456 ?auto_23467 ) ) ( IS-CRATE ?auto_23455 ) ( not ( = ?auto_23480 ?auto_23463 ) ) ( HOIST-AT ?auto_23481 ?auto_23480 ) ( SURFACE-AT ?auto_23455 ?auto_23480 ) ( ON ?auto_23455 ?auto_23468 ) ( CLEAR ?auto_23455 ) ( not ( = ?auto_23454 ?auto_23455 ) ) ( not ( = ?auto_23454 ?auto_23468 ) ) ( not ( = ?auto_23455 ?auto_23468 ) ) ( not ( = ?auto_23466 ?auto_23481 ) ) ( IS-CRATE ?auto_23454 ) ( SURFACE-AT ?auto_23454 ?auto_23469 ) ( ON ?auto_23454 ?auto_23476 ) ( CLEAR ?auto_23454 ) ( not ( = ?auto_23453 ?auto_23454 ) ) ( not ( = ?auto_23453 ?auto_23476 ) ) ( not ( = ?auto_23454 ?auto_23476 ) ) ( IS-CRATE ?auto_23453 ) ( not ( = ?auto_23490 ?auto_23463 ) ) ( HOIST-AT ?auto_23473 ?auto_23490 ) ( AVAILABLE ?auto_23473 ) ( SURFACE-AT ?auto_23453 ?auto_23490 ) ( ON ?auto_23453 ?auto_23471 ) ( CLEAR ?auto_23453 ) ( not ( = ?auto_23452 ?auto_23453 ) ) ( not ( = ?auto_23452 ?auto_23471 ) ) ( not ( = ?auto_23453 ?auto_23471 ) ) ( not ( = ?auto_23466 ?auto_23473 ) ) ( IS-CRATE ?auto_23452 ) ( not ( = ?auto_23487 ?auto_23463 ) ) ( HOIST-AT ?auto_23472 ?auto_23487 ) ( AVAILABLE ?auto_23472 ) ( SURFACE-AT ?auto_23452 ?auto_23487 ) ( ON ?auto_23452 ?auto_23488 ) ( CLEAR ?auto_23452 ) ( not ( = ?auto_23451 ?auto_23452 ) ) ( not ( = ?auto_23451 ?auto_23488 ) ) ( not ( = ?auto_23452 ?auto_23488 ) ) ( not ( = ?auto_23466 ?auto_23472 ) ) ( IS-CRATE ?auto_23451 ) ( AVAILABLE ?auto_23464 ) ( SURFACE-AT ?auto_23451 ?auto_23462 ) ( ON ?auto_23451 ?auto_23485 ) ( CLEAR ?auto_23451 ) ( not ( = ?auto_23450 ?auto_23451 ) ) ( not ( = ?auto_23450 ?auto_23485 ) ) ( not ( = ?auto_23451 ?auto_23485 ) ) ( IS-CRATE ?auto_23450 ) ( AVAILABLE ?auto_23483 ) ( SURFACE-AT ?auto_23450 ?auto_23469 ) ( ON ?auto_23450 ?auto_23478 ) ( CLEAR ?auto_23450 ) ( not ( = ?auto_23449 ?auto_23450 ) ) ( not ( = ?auto_23449 ?auto_23478 ) ) ( not ( = ?auto_23450 ?auto_23478 ) ) ( IS-CRATE ?auto_23449 ) ( not ( = ?auto_23479 ?auto_23463 ) ) ( HOIST-AT ?auto_23489 ?auto_23479 ) ( AVAILABLE ?auto_23489 ) ( SURFACE-AT ?auto_23449 ?auto_23479 ) ( ON ?auto_23449 ?auto_23486 ) ( CLEAR ?auto_23449 ) ( not ( = ?auto_23448 ?auto_23449 ) ) ( not ( = ?auto_23448 ?auto_23486 ) ) ( not ( = ?auto_23449 ?auto_23486 ) ) ( not ( = ?auto_23466 ?auto_23489 ) ) ( SURFACE-AT ?auto_23447 ?auto_23463 ) ( CLEAR ?auto_23447 ) ( IS-CRATE ?auto_23448 ) ( AVAILABLE ?auto_23466 ) ( AVAILABLE ?auto_23481 ) ( SURFACE-AT ?auto_23448 ?auto_23480 ) ( ON ?auto_23448 ?auto_23475 ) ( CLEAR ?auto_23448 ) ( TRUCK-AT ?auto_23461 ?auto_23463 ) ( not ( = ?auto_23447 ?auto_23448 ) ) ( not ( = ?auto_23447 ?auto_23475 ) ) ( not ( = ?auto_23448 ?auto_23475 ) ) ( not ( = ?auto_23447 ?auto_23449 ) ) ( not ( = ?auto_23447 ?auto_23486 ) ) ( not ( = ?auto_23449 ?auto_23475 ) ) ( not ( = ?auto_23479 ?auto_23480 ) ) ( not ( = ?auto_23489 ?auto_23481 ) ) ( not ( = ?auto_23486 ?auto_23475 ) ) ( not ( = ?auto_23447 ?auto_23450 ) ) ( not ( = ?auto_23447 ?auto_23478 ) ) ( not ( = ?auto_23448 ?auto_23450 ) ) ( not ( = ?auto_23448 ?auto_23478 ) ) ( not ( = ?auto_23450 ?auto_23486 ) ) ( not ( = ?auto_23450 ?auto_23475 ) ) ( not ( = ?auto_23469 ?auto_23479 ) ) ( not ( = ?auto_23469 ?auto_23480 ) ) ( not ( = ?auto_23483 ?auto_23489 ) ) ( not ( = ?auto_23483 ?auto_23481 ) ) ( not ( = ?auto_23478 ?auto_23486 ) ) ( not ( = ?auto_23478 ?auto_23475 ) ) ( not ( = ?auto_23447 ?auto_23451 ) ) ( not ( = ?auto_23447 ?auto_23485 ) ) ( not ( = ?auto_23448 ?auto_23451 ) ) ( not ( = ?auto_23448 ?auto_23485 ) ) ( not ( = ?auto_23449 ?auto_23451 ) ) ( not ( = ?auto_23449 ?auto_23485 ) ) ( not ( = ?auto_23451 ?auto_23478 ) ) ( not ( = ?auto_23451 ?auto_23486 ) ) ( not ( = ?auto_23451 ?auto_23475 ) ) ( not ( = ?auto_23462 ?auto_23469 ) ) ( not ( = ?auto_23462 ?auto_23479 ) ) ( not ( = ?auto_23462 ?auto_23480 ) ) ( not ( = ?auto_23464 ?auto_23483 ) ) ( not ( = ?auto_23464 ?auto_23489 ) ) ( not ( = ?auto_23464 ?auto_23481 ) ) ( not ( = ?auto_23485 ?auto_23478 ) ) ( not ( = ?auto_23485 ?auto_23486 ) ) ( not ( = ?auto_23485 ?auto_23475 ) ) ( not ( = ?auto_23447 ?auto_23452 ) ) ( not ( = ?auto_23447 ?auto_23488 ) ) ( not ( = ?auto_23448 ?auto_23452 ) ) ( not ( = ?auto_23448 ?auto_23488 ) ) ( not ( = ?auto_23449 ?auto_23452 ) ) ( not ( = ?auto_23449 ?auto_23488 ) ) ( not ( = ?auto_23450 ?auto_23452 ) ) ( not ( = ?auto_23450 ?auto_23488 ) ) ( not ( = ?auto_23452 ?auto_23485 ) ) ( not ( = ?auto_23452 ?auto_23478 ) ) ( not ( = ?auto_23452 ?auto_23486 ) ) ( not ( = ?auto_23452 ?auto_23475 ) ) ( not ( = ?auto_23487 ?auto_23462 ) ) ( not ( = ?auto_23487 ?auto_23469 ) ) ( not ( = ?auto_23487 ?auto_23479 ) ) ( not ( = ?auto_23487 ?auto_23480 ) ) ( not ( = ?auto_23472 ?auto_23464 ) ) ( not ( = ?auto_23472 ?auto_23483 ) ) ( not ( = ?auto_23472 ?auto_23489 ) ) ( not ( = ?auto_23472 ?auto_23481 ) ) ( not ( = ?auto_23488 ?auto_23485 ) ) ( not ( = ?auto_23488 ?auto_23478 ) ) ( not ( = ?auto_23488 ?auto_23486 ) ) ( not ( = ?auto_23488 ?auto_23475 ) ) ( not ( = ?auto_23447 ?auto_23453 ) ) ( not ( = ?auto_23447 ?auto_23471 ) ) ( not ( = ?auto_23448 ?auto_23453 ) ) ( not ( = ?auto_23448 ?auto_23471 ) ) ( not ( = ?auto_23449 ?auto_23453 ) ) ( not ( = ?auto_23449 ?auto_23471 ) ) ( not ( = ?auto_23450 ?auto_23453 ) ) ( not ( = ?auto_23450 ?auto_23471 ) ) ( not ( = ?auto_23451 ?auto_23453 ) ) ( not ( = ?auto_23451 ?auto_23471 ) ) ( not ( = ?auto_23453 ?auto_23488 ) ) ( not ( = ?auto_23453 ?auto_23485 ) ) ( not ( = ?auto_23453 ?auto_23478 ) ) ( not ( = ?auto_23453 ?auto_23486 ) ) ( not ( = ?auto_23453 ?auto_23475 ) ) ( not ( = ?auto_23490 ?auto_23487 ) ) ( not ( = ?auto_23490 ?auto_23462 ) ) ( not ( = ?auto_23490 ?auto_23469 ) ) ( not ( = ?auto_23490 ?auto_23479 ) ) ( not ( = ?auto_23490 ?auto_23480 ) ) ( not ( = ?auto_23473 ?auto_23472 ) ) ( not ( = ?auto_23473 ?auto_23464 ) ) ( not ( = ?auto_23473 ?auto_23483 ) ) ( not ( = ?auto_23473 ?auto_23489 ) ) ( not ( = ?auto_23473 ?auto_23481 ) ) ( not ( = ?auto_23471 ?auto_23488 ) ) ( not ( = ?auto_23471 ?auto_23485 ) ) ( not ( = ?auto_23471 ?auto_23478 ) ) ( not ( = ?auto_23471 ?auto_23486 ) ) ( not ( = ?auto_23471 ?auto_23475 ) ) ( not ( = ?auto_23447 ?auto_23454 ) ) ( not ( = ?auto_23447 ?auto_23476 ) ) ( not ( = ?auto_23448 ?auto_23454 ) ) ( not ( = ?auto_23448 ?auto_23476 ) ) ( not ( = ?auto_23449 ?auto_23454 ) ) ( not ( = ?auto_23449 ?auto_23476 ) ) ( not ( = ?auto_23450 ?auto_23454 ) ) ( not ( = ?auto_23450 ?auto_23476 ) ) ( not ( = ?auto_23451 ?auto_23454 ) ) ( not ( = ?auto_23451 ?auto_23476 ) ) ( not ( = ?auto_23452 ?auto_23454 ) ) ( not ( = ?auto_23452 ?auto_23476 ) ) ( not ( = ?auto_23454 ?auto_23471 ) ) ( not ( = ?auto_23454 ?auto_23488 ) ) ( not ( = ?auto_23454 ?auto_23485 ) ) ( not ( = ?auto_23454 ?auto_23478 ) ) ( not ( = ?auto_23454 ?auto_23486 ) ) ( not ( = ?auto_23454 ?auto_23475 ) ) ( not ( = ?auto_23476 ?auto_23471 ) ) ( not ( = ?auto_23476 ?auto_23488 ) ) ( not ( = ?auto_23476 ?auto_23485 ) ) ( not ( = ?auto_23476 ?auto_23478 ) ) ( not ( = ?auto_23476 ?auto_23486 ) ) ( not ( = ?auto_23476 ?auto_23475 ) ) ( not ( = ?auto_23447 ?auto_23455 ) ) ( not ( = ?auto_23447 ?auto_23468 ) ) ( not ( = ?auto_23448 ?auto_23455 ) ) ( not ( = ?auto_23448 ?auto_23468 ) ) ( not ( = ?auto_23449 ?auto_23455 ) ) ( not ( = ?auto_23449 ?auto_23468 ) ) ( not ( = ?auto_23450 ?auto_23455 ) ) ( not ( = ?auto_23450 ?auto_23468 ) ) ( not ( = ?auto_23451 ?auto_23455 ) ) ( not ( = ?auto_23451 ?auto_23468 ) ) ( not ( = ?auto_23452 ?auto_23455 ) ) ( not ( = ?auto_23452 ?auto_23468 ) ) ( not ( = ?auto_23453 ?auto_23455 ) ) ( not ( = ?auto_23453 ?auto_23468 ) ) ( not ( = ?auto_23455 ?auto_23476 ) ) ( not ( = ?auto_23455 ?auto_23471 ) ) ( not ( = ?auto_23455 ?auto_23488 ) ) ( not ( = ?auto_23455 ?auto_23485 ) ) ( not ( = ?auto_23455 ?auto_23478 ) ) ( not ( = ?auto_23455 ?auto_23486 ) ) ( not ( = ?auto_23455 ?auto_23475 ) ) ( not ( = ?auto_23468 ?auto_23476 ) ) ( not ( = ?auto_23468 ?auto_23471 ) ) ( not ( = ?auto_23468 ?auto_23488 ) ) ( not ( = ?auto_23468 ?auto_23485 ) ) ( not ( = ?auto_23468 ?auto_23478 ) ) ( not ( = ?auto_23468 ?auto_23486 ) ) ( not ( = ?auto_23468 ?auto_23475 ) ) ( not ( = ?auto_23447 ?auto_23456 ) ) ( not ( = ?auto_23447 ?auto_23467 ) ) ( not ( = ?auto_23448 ?auto_23456 ) ) ( not ( = ?auto_23448 ?auto_23467 ) ) ( not ( = ?auto_23449 ?auto_23456 ) ) ( not ( = ?auto_23449 ?auto_23467 ) ) ( not ( = ?auto_23450 ?auto_23456 ) ) ( not ( = ?auto_23450 ?auto_23467 ) ) ( not ( = ?auto_23451 ?auto_23456 ) ) ( not ( = ?auto_23451 ?auto_23467 ) ) ( not ( = ?auto_23452 ?auto_23456 ) ) ( not ( = ?auto_23452 ?auto_23467 ) ) ( not ( = ?auto_23453 ?auto_23456 ) ) ( not ( = ?auto_23453 ?auto_23467 ) ) ( not ( = ?auto_23454 ?auto_23456 ) ) ( not ( = ?auto_23454 ?auto_23467 ) ) ( not ( = ?auto_23456 ?auto_23468 ) ) ( not ( = ?auto_23456 ?auto_23476 ) ) ( not ( = ?auto_23456 ?auto_23471 ) ) ( not ( = ?auto_23456 ?auto_23488 ) ) ( not ( = ?auto_23456 ?auto_23485 ) ) ( not ( = ?auto_23456 ?auto_23478 ) ) ( not ( = ?auto_23456 ?auto_23486 ) ) ( not ( = ?auto_23456 ?auto_23475 ) ) ( not ( = ?auto_23467 ?auto_23468 ) ) ( not ( = ?auto_23467 ?auto_23476 ) ) ( not ( = ?auto_23467 ?auto_23471 ) ) ( not ( = ?auto_23467 ?auto_23488 ) ) ( not ( = ?auto_23467 ?auto_23485 ) ) ( not ( = ?auto_23467 ?auto_23478 ) ) ( not ( = ?auto_23467 ?auto_23486 ) ) ( not ( = ?auto_23467 ?auto_23475 ) ) ( not ( = ?auto_23447 ?auto_23457 ) ) ( not ( = ?auto_23447 ?auto_23470 ) ) ( not ( = ?auto_23448 ?auto_23457 ) ) ( not ( = ?auto_23448 ?auto_23470 ) ) ( not ( = ?auto_23449 ?auto_23457 ) ) ( not ( = ?auto_23449 ?auto_23470 ) ) ( not ( = ?auto_23450 ?auto_23457 ) ) ( not ( = ?auto_23450 ?auto_23470 ) ) ( not ( = ?auto_23451 ?auto_23457 ) ) ( not ( = ?auto_23451 ?auto_23470 ) ) ( not ( = ?auto_23452 ?auto_23457 ) ) ( not ( = ?auto_23452 ?auto_23470 ) ) ( not ( = ?auto_23453 ?auto_23457 ) ) ( not ( = ?auto_23453 ?auto_23470 ) ) ( not ( = ?auto_23454 ?auto_23457 ) ) ( not ( = ?auto_23454 ?auto_23470 ) ) ( not ( = ?auto_23455 ?auto_23457 ) ) ( not ( = ?auto_23455 ?auto_23470 ) ) ( not ( = ?auto_23457 ?auto_23467 ) ) ( not ( = ?auto_23457 ?auto_23468 ) ) ( not ( = ?auto_23457 ?auto_23476 ) ) ( not ( = ?auto_23457 ?auto_23471 ) ) ( not ( = ?auto_23457 ?auto_23488 ) ) ( not ( = ?auto_23457 ?auto_23485 ) ) ( not ( = ?auto_23457 ?auto_23478 ) ) ( not ( = ?auto_23457 ?auto_23486 ) ) ( not ( = ?auto_23457 ?auto_23475 ) ) ( not ( = ?auto_23474 ?auto_23469 ) ) ( not ( = ?auto_23474 ?auto_23480 ) ) ( not ( = ?auto_23474 ?auto_23490 ) ) ( not ( = ?auto_23474 ?auto_23487 ) ) ( not ( = ?auto_23474 ?auto_23462 ) ) ( not ( = ?auto_23474 ?auto_23479 ) ) ( not ( = ?auto_23484 ?auto_23483 ) ) ( not ( = ?auto_23484 ?auto_23481 ) ) ( not ( = ?auto_23484 ?auto_23473 ) ) ( not ( = ?auto_23484 ?auto_23472 ) ) ( not ( = ?auto_23484 ?auto_23464 ) ) ( not ( = ?auto_23484 ?auto_23489 ) ) ( not ( = ?auto_23470 ?auto_23467 ) ) ( not ( = ?auto_23470 ?auto_23468 ) ) ( not ( = ?auto_23470 ?auto_23476 ) ) ( not ( = ?auto_23470 ?auto_23471 ) ) ( not ( = ?auto_23470 ?auto_23488 ) ) ( not ( = ?auto_23470 ?auto_23485 ) ) ( not ( = ?auto_23470 ?auto_23478 ) ) ( not ( = ?auto_23470 ?auto_23486 ) ) ( not ( = ?auto_23470 ?auto_23475 ) ) ( not ( = ?auto_23447 ?auto_23458 ) ) ( not ( = ?auto_23447 ?auto_23482 ) ) ( not ( = ?auto_23448 ?auto_23458 ) ) ( not ( = ?auto_23448 ?auto_23482 ) ) ( not ( = ?auto_23449 ?auto_23458 ) ) ( not ( = ?auto_23449 ?auto_23482 ) ) ( not ( = ?auto_23450 ?auto_23458 ) ) ( not ( = ?auto_23450 ?auto_23482 ) ) ( not ( = ?auto_23451 ?auto_23458 ) ) ( not ( = ?auto_23451 ?auto_23482 ) ) ( not ( = ?auto_23452 ?auto_23458 ) ) ( not ( = ?auto_23452 ?auto_23482 ) ) ( not ( = ?auto_23453 ?auto_23458 ) ) ( not ( = ?auto_23453 ?auto_23482 ) ) ( not ( = ?auto_23454 ?auto_23458 ) ) ( not ( = ?auto_23454 ?auto_23482 ) ) ( not ( = ?auto_23455 ?auto_23458 ) ) ( not ( = ?auto_23455 ?auto_23482 ) ) ( not ( = ?auto_23456 ?auto_23458 ) ) ( not ( = ?auto_23456 ?auto_23482 ) ) ( not ( = ?auto_23458 ?auto_23470 ) ) ( not ( = ?auto_23458 ?auto_23467 ) ) ( not ( = ?auto_23458 ?auto_23468 ) ) ( not ( = ?auto_23458 ?auto_23476 ) ) ( not ( = ?auto_23458 ?auto_23471 ) ) ( not ( = ?auto_23458 ?auto_23488 ) ) ( not ( = ?auto_23458 ?auto_23485 ) ) ( not ( = ?auto_23458 ?auto_23478 ) ) ( not ( = ?auto_23458 ?auto_23486 ) ) ( not ( = ?auto_23458 ?auto_23475 ) ) ( not ( = ?auto_23482 ?auto_23470 ) ) ( not ( = ?auto_23482 ?auto_23467 ) ) ( not ( = ?auto_23482 ?auto_23468 ) ) ( not ( = ?auto_23482 ?auto_23476 ) ) ( not ( = ?auto_23482 ?auto_23471 ) ) ( not ( = ?auto_23482 ?auto_23488 ) ) ( not ( = ?auto_23482 ?auto_23485 ) ) ( not ( = ?auto_23482 ?auto_23478 ) ) ( not ( = ?auto_23482 ?auto_23486 ) ) ( not ( = ?auto_23482 ?auto_23475 ) ) ( not ( = ?auto_23447 ?auto_23459 ) ) ( not ( = ?auto_23447 ?auto_23477 ) ) ( not ( = ?auto_23448 ?auto_23459 ) ) ( not ( = ?auto_23448 ?auto_23477 ) ) ( not ( = ?auto_23449 ?auto_23459 ) ) ( not ( = ?auto_23449 ?auto_23477 ) ) ( not ( = ?auto_23450 ?auto_23459 ) ) ( not ( = ?auto_23450 ?auto_23477 ) ) ( not ( = ?auto_23451 ?auto_23459 ) ) ( not ( = ?auto_23451 ?auto_23477 ) ) ( not ( = ?auto_23452 ?auto_23459 ) ) ( not ( = ?auto_23452 ?auto_23477 ) ) ( not ( = ?auto_23453 ?auto_23459 ) ) ( not ( = ?auto_23453 ?auto_23477 ) ) ( not ( = ?auto_23454 ?auto_23459 ) ) ( not ( = ?auto_23454 ?auto_23477 ) ) ( not ( = ?auto_23455 ?auto_23459 ) ) ( not ( = ?auto_23455 ?auto_23477 ) ) ( not ( = ?auto_23456 ?auto_23459 ) ) ( not ( = ?auto_23456 ?auto_23477 ) ) ( not ( = ?auto_23457 ?auto_23459 ) ) ( not ( = ?auto_23457 ?auto_23477 ) ) ( not ( = ?auto_23459 ?auto_23482 ) ) ( not ( = ?auto_23459 ?auto_23470 ) ) ( not ( = ?auto_23459 ?auto_23467 ) ) ( not ( = ?auto_23459 ?auto_23468 ) ) ( not ( = ?auto_23459 ?auto_23476 ) ) ( not ( = ?auto_23459 ?auto_23471 ) ) ( not ( = ?auto_23459 ?auto_23488 ) ) ( not ( = ?auto_23459 ?auto_23485 ) ) ( not ( = ?auto_23459 ?auto_23478 ) ) ( not ( = ?auto_23459 ?auto_23486 ) ) ( not ( = ?auto_23459 ?auto_23475 ) ) ( not ( = ?auto_23477 ?auto_23482 ) ) ( not ( = ?auto_23477 ?auto_23470 ) ) ( not ( = ?auto_23477 ?auto_23467 ) ) ( not ( = ?auto_23477 ?auto_23468 ) ) ( not ( = ?auto_23477 ?auto_23476 ) ) ( not ( = ?auto_23477 ?auto_23471 ) ) ( not ( = ?auto_23477 ?auto_23488 ) ) ( not ( = ?auto_23477 ?auto_23485 ) ) ( not ( = ?auto_23477 ?auto_23478 ) ) ( not ( = ?auto_23477 ?auto_23486 ) ) ( not ( = ?auto_23477 ?auto_23475 ) ) ( not ( = ?auto_23447 ?auto_23460 ) ) ( not ( = ?auto_23447 ?auto_23465 ) ) ( not ( = ?auto_23448 ?auto_23460 ) ) ( not ( = ?auto_23448 ?auto_23465 ) ) ( not ( = ?auto_23449 ?auto_23460 ) ) ( not ( = ?auto_23449 ?auto_23465 ) ) ( not ( = ?auto_23450 ?auto_23460 ) ) ( not ( = ?auto_23450 ?auto_23465 ) ) ( not ( = ?auto_23451 ?auto_23460 ) ) ( not ( = ?auto_23451 ?auto_23465 ) ) ( not ( = ?auto_23452 ?auto_23460 ) ) ( not ( = ?auto_23452 ?auto_23465 ) ) ( not ( = ?auto_23453 ?auto_23460 ) ) ( not ( = ?auto_23453 ?auto_23465 ) ) ( not ( = ?auto_23454 ?auto_23460 ) ) ( not ( = ?auto_23454 ?auto_23465 ) ) ( not ( = ?auto_23455 ?auto_23460 ) ) ( not ( = ?auto_23455 ?auto_23465 ) ) ( not ( = ?auto_23456 ?auto_23460 ) ) ( not ( = ?auto_23456 ?auto_23465 ) ) ( not ( = ?auto_23457 ?auto_23460 ) ) ( not ( = ?auto_23457 ?auto_23465 ) ) ( not ( = ?auto_23458 ?auto_23460 ) ) ( not ( = ?auto_23458 ?auto_23465 ) ) ( not ( = ?auto_23460 ?auto_23477 ) ) ( not ( = ?auto_23460 ?auto_23482 ) ) ( not ( = ?auto_23460 ?auto_23470 ) ) ( not ( = ?auto_23460 ?auto_23467 ) ) ( not ( = ?auto_23460 ?auto_23468 ) ) ( not ( = ?auto_23460 ?auto_23476 ) ) ( not ( = ?auto_23460 ?auto_23471 ) ) ( not ( = ?auto_23460 ?auto_23488 ) ) ( not ( = ?auto_23460 ?auto_23485 ) ) ( not ( = ?auto_23460 ?auto_23478 ) ) ( not ( = ?auto_23460 ?auto_23486 ) ) ( not ( = ?auto_23460 ?auto_23475 ) ) ( not ( = ?auto_23465 ?auto_23477 ) ) ( not ( = ?auto_23465 ?auto_23482 ) ) ( not ( = ?auto_23465 ?auto_23470 ) ) ( not ( = ?auto_23465 ?auto_23467 ) ) ( not ( = ?auto_23465 ?auto_23468 ) ) ( not ( = ?auto_23465 ?auto_23476 ) ) ( not ( = ?auto_23465 ?auto_23471 ) ) ( not ( = ?auto_23465 ?auto_23488 ) ) ( not ( = ?auto_23465 ?auto_23485 ) ) ( not ( = ?auto_23465 ?auto_23478 ) ) ( not ( = ?auto_23465 ?auto_23486 ) ) ( not ( = ?auto_23465 ?auto_23475 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_23447 ?auto_23448 ?auto_23449 ?auto_23450 ?auto_23451 ?auto_23452 ?auto_23453 ?auto_23454 ?auto_23455 ?auto_23456 ?auto_23457 ?auto_23458 ?auto_23459 )
      ( MAKE-1CRATE ?auto_23459 ?auto_23460 )
      ( MAKE-13CRATE-VERIFY ?auto_23447 ?auto_23448 ?auto_23449 ?auto_23450 ?auto_23451 ?auto_23452 ?auto_23453 ?auto_23454 ?auto_23455 ?auto_23456 ?auto_23457 ?auto_23458 ?auto_23459 ?auto_23460 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_23516 - SURFACE
      ?auto_23517 - SURFACE
      ?auto_23518 - SURFACE
      ?auto_23519 - SURFACE
      ?auto_23520 - SURFACE
      ?auto_23521 - SURFACE
      ?auto_23522 - SURFACE
      ?auto_23523 - SURFACE
      ?auto_23524 - SURFACE
      ?auto_23525 - SURFACE
      ?auto_23526 - SURFACE
      ?auto_23527 - SURFACE
      ?auto_23528 - SURFACE
      ?auto_23529 - SURFACE
      ?auto_23530 - SURFACE
    )
    :vars
    (
      ?auto_23531 - HOIST
      ?auto_23533 - PLACE
      ?auto_23534 - PLACE
      ?auto_23535 - HOIST
      ?auto_23532 - SURFACE
      ?auto_23538 - SURFACE
      ?auto_23540 - SURFACE
      ?auto_23556 - PLACE
      ?auto_23537 - HOIST
      ?auto_23542 - SURFACE
      ?auto_23546 - PLACE
      ?auto_23547 - HOIST
      ?auto_23544 - SURFACE
      ?auto_23541 - SURFACE
      ?auto_23551 - PLACE
      ?auto_23554 - HOIST
      ?auto_23558 - SURFACE
      ?auto_23550 - SURFACE
      ?auto_23549 - PLACE
      ?auto_23545 - HOIST
      ?auto_23559 - SURFACE
      ?auto_23543 - PLACE
      ?auto_23539 - HOIST
      ?auto_23560 - SURFACE
      ?auto_23557 - SURFACE
      ?auto_23555 - SURFACE
      ?auto_23561 - PLACE
      ?auto_23553 - HOIST
      ?auto_23548 - SURFACE
      ?auto_23552 - SURFACE
      ?auto_23536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23531 ?auto_23533 ) ( IS-CRATE ?auto_23530 ) ( not ( = ?auto_23534 ?auto_23533 ) ) ( HOIST-AT ?auto_23535 ?auto_23534 ) ( SURFACE-AT ?auto_23530 ?auto_23534 ) ( ON ?auto_23530 ?auto_23532 ) ( CLEAR ?auto_23530 ) ( not ( = ?auto_23529 ?auto_23530 ) ) ( not ( = ?auto_23529 ?auto_23532 ) ) ( not ( = ?auto_23530 ?auto_23532 ) ) ( not ( = ?auto_23531 ?auto_23535 ) ) ( IS-CRATE ?auto_23529 ) ( SURFACE-AT ?auto_23529 ?auto_23534 ) ( ON ?auto_23529 ?auto_23538 ) ( CLEAR ?auto_23529 ) ( not ( = ?auto_23528 ?auto_23529 ) ) ( not ( = ?auto_23528 ?auto_23538 ) ) ( not ( = ?auto_23529 ?auto_23538 ) ) ( IS-CRATE ?auto_23528 ) ( SURFACE-AT ?auto_23528 ?auto_23534 ) ( ON ?auto_23528 ?auto_23540 ) ( CLEAR ?auto_23528 ) ( not ( = ?auto_23527 ?auto_23528 ) ) ( not ( = ?auto_23527 ?auto_23540 ) ) ( not ( = ?auto_23528 ?auto_23540 ) ) ( IS-CRATE ?auto_23527 ) ( not ( = ?auto_23556 ?auto_23533 ) ) ( HOIST-AT ?auto_23537 ?auto_23556 ) ( SURFACE-AT ?auto_23527 ?auto_23556 ) ( ON ?auto_23527 ?auto_23542 ) ( CLEAR ?auto_23527 ) ( not ( = ?auto_23526 ?auto_23527 ) ) ( not ( = ?auto_23526 ?auto_23542 ) ) ( not ( = ?auto_23527 ?auto_23542 ) ) ( not ( = ?auto_23531 ?auto_23537 ) ) ( IS-CRATE ?auto_23526 ) ( not ( = ?auto_23546 ?auto_23533 ) ) ( HOIST-AT ?auto_23547 ?auto_23546 ) ( AVAILABLE ?auto_23547 ) ( SURFACE-AT ?auto_23526 ?auto_23546 ) ( ON ?auto_23526 ?auto_23544 ) ( CLEAR ?auto_23526 ) ( not ( = ?auto_23525 ?auto_23526 ) ) ( not ( = ?auto_23525 ?auto_23544 ) ) ( not ( = ?auto_23526 ?auto_23544 ) ) ( not ( = ?auto_23531 ?auto_23547 ) ) ( IS-CRATE ?auto_23525 ) ( SURFACE-AT ?auto_23525 ?auto_23556 ) ( ON ?auto_23525 ?auto_23541 ) ( CLEAR ?auto_23525 ) ( not ( = ?auto_23524 ?auto_23525 ) ) ( not ( = ?auto_23524 ?auto_23541 ) ) ( not ( = ?auto_23525 ?auto_23541 ) ) ( IS-CRATE ?auto_23524 ) ( not ( = ?auto_23551 ?auto_23533 ) ) ( HOIST-AT ?auto_23554 ?auto_23551 ) ( SURFACE-AT ?auto_23524 ?auto_23551 ) ( ON ?auto_23524 ?auto_23558 ) ( CLEAR ?auto_23524 ) ( not ( = ?auto_23523 ?auto_23524 ) ) ( not ( = ?auto_23523 ?auto_23558 ) ) ( not ( = ?auto_23524 ?auto_23558 ) ) ( not ( = ?auto_23531 ?auto_23554 ) ) ( IS-CRATE ?auto_23523 ) ( SURFACE-AT ?auto_23523 ?auto_23556 ) ( ON ?auto_23523 ?auto_23550 ) ( CLEAR ?auto_23523 ) ( not ( = ?auto_23522 ?auto_23523 ) ) ( not ( = ?auto_23522 ?auto_23550 ) ) ( not ( = ?auto_23523 ?auto_23550 ) ) ( IS-CRATE ?auto_23522 ) ( not ( = ?auto_23549 ?auto_23533 ) ) ( HOIST-AT ?auto_23545 ?auto_23549 ) ( AVAILABLE ?auto_23545 ) ( SURFACE-AT ?auto_23522 ?auto_23549 ) ( ON ?auto_23522 ?auto_23559 ) ( CLEAR ?auto_23522 ) ( not ( = ?auto_23521 ?auto_23522 ) ) ( not ( = ?auto_23521 ?auto_23559 ) ) ( not ( = ?auto_23522 ?auto_23559 ) ) ( not ( = ?auto_23531 ?auto_23545 ) ) ( IS-CRATE ?auto_23521 ) ( not ( = ?auto_23543 ?auto_23533 ) ) ( HOIST-AT ?auto_23539 ?auto_23543 ) ( AVAILABLE ?auto_23539 ) ( SURFACE-AT ?auto_23521 ?auto_23543 ) ( ON ?auto_23521 ?auto_23560 ) ( CLEAR ?auto_23521 ) ( not ( = ?auto_23520 ?auto_23521 ) ) ( not ( = ?auto_23520 ?auto_23560 ) ) ( not ( = ?auto_23521 ?auto_23560 ) ) ( not ( = ?auto_23531 ?auto_23539 ) ) ( IS-CRATE ?auto_23520 ) ( AVAILABLE ?auto_23535 ) ( SURFACE-AT ?auto_23520 ?auto_23534 ) ( ON ?auto_23520 ?auto_23557 ) ( CLEAR ?auto_23520 ) ( not ( = ?auto_23519 ?auto_23520 ) ) ( not ( = ?auto_23519 ?auto_23557 ) ) ( not ( = ?auto_23520 ?auto_23557 ) ) ( IS-CRATE ?auto_23519 ) ( AVAILABLE ?auto_23537 ) ( SURFACE-AT ?auto_23519 ?auto_23556 ) ( ON ?auto_23519 ?auto_23555 ) ( CLEAR ?auto_23519 ) ( not ( = ?auto_23518 ?auto_23519 ) ) ( not ( = ?auto_23518 ?auto_23555 ) ) ( not ( = ?auto_23519 ?auto_23555 ) ) ( IS-CRATE ?auto_23518 ) ( not ( = ?auto_23561 ?auto_23533 ) ) ( HOIST-AT ?auto_23553 ?auto_23561 ) ( AVAILABLE ?auto_23553 ) ( SURFACE-AT ?auto_23518 ?auto_23561 ) ( ON ?auto_23518 ?auto_23548 ) ( CLEAR ?auto_23518 ) ( not ( = ?auto_23517 ?auto_23518 ) ) ( not ( = ?auto_23517 ?auto_23548 ) ) ( not ( = ?auto_23518 ?auto_23548 ) ) ( not ( = ?auto_23531 ?auto_23553 ) ) ( SURFACE-AT ?auto_23516 ?auto_23533 ) ( CLEAR ?auto_23516 ) ( IS-CRATE ?auto_23517 ) ( AVAILABLE ?auto_23531 ) ( AVAILABLE ?auto_23554 ) ( SURFACE-AT ?auto_23517 ?auto_23551 ) ( ON ?auto_23517 ?auto_23552 ) ( CLEAR ?auto_23517 ) ( TRUCK-AT ?auto_23536 ?auto_23533 ) ( not ( = ?auto_23516 ?auto_23517 ) ) ( not ( = ?auto_23516 ?auto_23552 ) ) ( not ( = ?auto_23517 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23518 ) ) ( not ( = ?auto_23516 ?auto_23548 ) ) ( not ( = ?auto_23518 ?auto_23552 ) ) ( not ( = ?auto_23561 ?auto_23551 ) ) ( not ( = ?auto_23553 ?auto_23554 ) ) ( not ( = ?auto_23548 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23519 ) ) ( not ( = ?auto_23516 ?auto_23555 ) ) ( not ( = ?auto_23517 ?auto_23519 ) ) ( not ( = ?auto_23517 ?auto_23555 ) ) ( not ( = ?auto_23519 ?auto_23548 ) ) ( not ( = ?auto_23519 ?auto_23552 ) ) ( not ( = ?auto_23556 ?auto_23561 ) ) ( not ( = ?auto_23556 ?auto_23551 ) ) ( not ( = ?auto_23537 ?auto_23553 ) ) ( not ( = ?auto_23537 ?auto_23554 ) ) ( not ( = ?auto_23555 ?auto_23548 ) ) ( not ( = ?auto_23555 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23520 ) ) ( not ( = ?auto_23516 ?auto_23557 ) ) ( not ( = ?auto_23517 ?auto_23520 ) ) ( not ( = ?auto_23517 ?auto_23557 ) ) ( not ( = ?auto_23518 ?auto_23520 ) ) ( not ( = ?auto_23518 ?auto_23557 ) ) ( not ( = ?auto_23520 ?auto_23555 ) ) ( not ( = ?auto_23520 ?auto_23548 ) ) ( not ( = ?auto_23520 ?auto_23552 ) ) ( not ( = ?auto_23534 ?auto_23556 ) ) ( not ( = ?auto_23534 ?auto_23561 ) ) ( not ( = ?auto_23534 ?auto_23551 ) ) ( not ( = ?auto_23535 ?auto_23537 ) ) ( not ( = ?auto_23535 ?auto_23553 ) ) ( not ( = ?auto_23535 ?auto_23554 ) ) ( not ( = ?auto_23557 ?auto_23555 ) ) ( not ( = ?auto_23557 ?auto_23548 ) ) ( not ( = ?auto_23557 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23521 ) ) ( not ( = ?auto_23516 ?auto_23560 ) ) ( not ( = ?auto_23517 ?auto_23521 ) ) ( not ( = ?auto_23517 ?auto_23560 ) ) ( not ( = ?auto_23518 ?auto_23521 ) ) ( not ( = ?auto_23518 ?auto_23560 ) ) ( not ( = ?auto_23519 ?auto_23521 ) ) ( not ( = ?auto_23519 ?auto_23560 ) ) ( not ( = ?auto_23521 ?auto_23557 ) ) ( not ( = ?auto_23521 ?auto_23555 ) ) ( not ( = ?auto_23521 ?auto_23548 ) ) ( not ( = ?auto_23521 ?auto_23552 ) ) ( not ( = ?auto_23543 ?auto_23534 ) ) ( not ( = ?auto_23543 ?auto_23556 ) ) ( not ( = ?auto_23543 ?auto_23561 ) ) ( not ( = ?auto_23543 ?auto_23551 ) ) ( not ( = ?auto_23539 ?auto_23535 ) ) ( not ( = ?auto_23539 ?auto_23537 ) ) ( not ( = ?auto_23539 ?auto_23553 ) ) ( not ( = ?auto_23539 ?auto_23554 ) ) ( not ( = ?auto_23560 ?auto_23557 ) ) ( not ( = ?auto_23560 ?auto_23555 ) ) ( not ( = ?auto_23560 ?auto_23548 ) ) ( not ( = ?auto_23560 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23522 ) ) ( not ( = ?auto_23516 ?auto_23559 ) ) ( not ( = ?auto_23517 ?auto_23522 ) ) ( not ( = ?auto_23517 ?auto_23559 ) ) ( not ( = ?auto_23518 ?auto_23522 ) ) ( not ( = ?auto_23518 ?auto_23559 ) ) ( not ( = ?auto_23519 ?auto_23522 ) ) ( not ( = ?auto_23519 ?auto_23559 ) ) ( not ( = ?auto_23520 ?auto_23522 ) ) ( not ( = ?auto_23520 ?auto_23559 ) ) ( not ( = ?auto_23522 ?auto_23560 ) ) ( not ( = ?auto_23522 ?auto_23557 ) ) ( not ( = ?auto_23522 ?auto_23555 ) ) ( not ( = ?auto_23522 ?auto_23548 ) ) ( not ( = ?auto_23522 ?auto_23552 ) ) ( not ( = ?auto_23549 ?auto_23543 ) ) ( not ( = ?auto_23549 ?auto_23534 ) ) ( not ( = ?auto_23549 ?auto_23556 ) ) ( not ( = ?auto_23549 ?auto_23561 ) ) ( not ( = ?auto_23549 ?auto_23551 ) ) ( not ( = ?auto_23545 ?auto_23539 ) ) ( not ( = ?auto_23545 ?auto_23535 ) ) ( not ( = ?auto_23545 ?auto_23537 ) ) ( not ( = ?auto_23545 ?auto_23553 ) ) ( not ( = ?auto_23545 ?auto_23554 ) ) ( not ( = ?auto_23559 ?auto_23560 ) ) ( not ( = ?auto_23559 ?auto_23557 ) ) ( not ( = ?auto_23559 ?auto_23555 ) ) ( not ( = ?auto_23559 ?auto_23548 ) ) ( not ( = ?auto_23559 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23523 ) ) ( not ( = ?auto_23516 ?auto_23550 ) ) ( not ( = ?auto_23517 ?auto_23523 ) ) ( not ( = ?auto_23517 ?auto_23550 ) ) ( not ( = ?auto_23518 ?auto_23523 ) ) ( not ( = ?auto_23518 ?auto_23550 ) ) ( not ( = ?auto_23519 ?auto_23523 ) ) ( not ( = ?auto_23519 ?auto_23550 ) ) ( not ( = ?auto_23520 ?auto_23523 ) ) ( not ( = ?auto_23520 ?auto_23550 ) ) ( not ( = ?auto_23521 ?auto_23523 ) ) ( not ( = ?auto_23521 ?auto_23550 ) ) ( not ( = ?auto_23523 ?auto_23559 ) ) ( not ( = ?auto_23523 ?auto_23560 ) ) ( not ( = ?auto_23523 ?auto_23557 ) ) ( not ( = ?auto_23523 ?auto_23555 ) ) ( not ( = ?auto_23523 ?auto_23548 ) ) ( not ( = ?auto_23523 ?auto_23552 ) ) ( not ( = ?auto_23550 ?auto_23559 ) ) ( not ( = ?auto_23550 ?auto_23560 ) ) ( not ( = ?auto_23550 ?auto_23557 ) ) ( not ( = ?auto_23550 ?auto_23555 ) ) ( not ( = ?auto_23550 ?auto_23548 ) ) ( not ( = ?auto_23550 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23524 ) ) ( not ( = ?auto_23516 ?auto_23558 ) ) ( not ( = ?auto_23517 ?auto_23524 ) ) ( not ( = ?auto_23517 ?auto_23558 ) ) ( not ( = ?auto_23518 ?auto_23524 ) ) ( not ( = ?auto_23518 ?auto_23558 ) ) ( not ( = ?auto_23519 ?auto_23524 ) ) ( not ( = ?auto_23519 ?auto_23558 ) ) ( not ( = ?auto_23520 ?auto_23524 ) ) ( not ( = ?auto_23520 ?auto_23558 ) ) ( not ( = ?auto_23521 ?auto_23524 ) ) ( not ( = ?auto_23521 ?auto_23558 ) ) ( not ( = ?auto_23522 ?auto_23524 ) ) ( not ( = ?auto_23522 ?auto_23558 ) ) ( not ( = ?auto_23524 ?auto_23550 ) ) ( not ( = ?auto_23524 ?auto_23559 ) ) ( not ( = ?auto_23524 ?auto_23560 ) ) ( not ( = ?auto_23524 ?auto_23557 ) ) ( not ( = ?auto_23524 ?auto_23555 ) ) ( not ( = ?auto_23524 ?auto_23548 ) ) ( not ( = ?auto_23524 ?auto_23552 ) ) ( not ( = ?auto_23558 ?auto_23550 ) ) ( not ( = ?auto_23558 ?auto_23559 ) ) ( not ( = ?auto_23558 ?auto_23560 ) ) ( not ( = ?auto_23558 ?auto_23557 ) ) ( not ( = ?auto_23558 ?auto_23555 ) ) ( not ( = ?auto_23558 ?auto_23548 ) ) ( not ( = ?auto_23558 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23525 ) ) ( not ( = ?auto_23516 ?auto_23541 ) ) ( not ( = ?auto_23517 ?auto_23525 ) ) ( not ( = ?auto_23517 ?auto_23541 ) ) ( not ( = ?auto_23518 ?auto_23525 ) ) ( not ( = ?auto_23518 ?auto_23541 ) ) ( not ( = ?auto_23519 ?auto_23525 ) ) ( not ( = ?auto_23519 ?auto_23541 ) ) ( not ( = ?auto_23520 ?auto_23525 ) ) ( not ( = ?auto_23520 ?auto_23541 ) ) ( not ( = ?auto_23521 ?auto_23525 ) ) ( not ( = ?auto_23521 ?auto_23541 ) ) ( not ( = ?auto_23522 ?auto_23525 ) ) ( not ( = ?auto_23522 ?auto_23541 ) ) ( not ( = ?auto_23523 ?auto_23525 ) ) ( not ( = ?auto_23523 ?auto_23541 ) ) ( not ( = ?auto_23525 ?auto_23558 ) ) ( not ( = ?auto_23525 ?auto_23550 ) ) ( not ( = ?auto_23525 ?auto_23559 ) ) ( not ( = ?auto_23525 ?auto_23560 ) ) ( not ( = ?auto_23525 ?auto_23557 ) ) ( not ( = ?auto_23525 ?auto_23555 ) ) ( not ( = ?auto_23525 ?auto_23548 ) ) ( not ( = ?auto_23525 ?auto_23552 ) ) ( not ( = ?auto_23541 ?auto_23558 ) ) ( not ( = ?auto_23541 ?auto_23550 ) ) ( not ( = ?auto_23541 ?auto_23559 ) ) ( not ( = ?auto_23541 ?auto_23560 ) ) ( not ( = ?auto_23541 ?auto_23557 ) ) ( not ( = ?auto_23541 ?auto_23555 ) ) ( not ( = ?auto_23541 ?auto_23548 ) ) ( not ( = ?auto_23541 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23526 ) ) ( not ( = ?auto_23516 ?auto_23544 ) ) ( not ( = ?auto_23517 ?auto_23526 ) ) ( not ( = ?auto_23517 ?auto_23544 ) ) ( not ( = ?auto_23518 ?auto_23526 ) ) ( not ( = ?auto_23518 ?auto_23544 ) ) ( not ( = ?auto_23519 ?auto_23526 ) ) ( not ( = ?auto_23519 ?auto_23544 ) ) ( not ( = ?auto_23520 ?auto_23526 ) ) ( not ( = ?auto_23520 ?auto_23544 ) ) ( not ( = ?auto_23521 ?auto_23526 ) ) ( not ( = ?auto_23521 ?auto_23544 ) ) ( not ( = ?auto_23522 ?auto_23526 ) ) ( not ( = ?auto_23522 ?auto_23544 ) ) ( not ( = ?auto_23523 ?auto_23526 ) ) ( not ( = ?auto_23523 ?auto_23544 ) ) ( not ( = ?auto_23524 ?auto_23526 ) ) ( not ( = ?auto_23524 ?auto_23544 ) ) ( not ( = ?auto_23526 ?auto_23541 ) ) ( not ( = ?auto_23526 ?auto_23558 ) ) ( not ( = ?auto_23526 ?auto_23550 ) ) ( not ( = ?auto_23526 ?auto_23559 ) ) ( not ( = ?auto_23526 ?auto_23560 ) ) ( not ( = ?auto_23526 ?auto_23557 ) ) ( not ( = ?auto_23526 ?auto_23555 ) ) ( not ( = ?auto_23526 ?auto_23548 ) ) ( not ( = ?auto_23526 ?auto_23552 ) ) ( not ( = ?auto_23546 ?auto_23556 ) ) ( not ( = ?auto_23546 ?auto_23551 ) ) ( not ( = ?auto_23546 ?auto_23549 ) ) ( not ( = ?auto_23546 ?auto_23543 ) ) ( not ( = ?auto_23546 ?auto_23534 ) ) ( not ( = ?auto_23546 ?auto_23561 ) ) ( not ( = ?auto_23547 ?auto_23537 ) ) ( not ( = ?auto_23547 ?auto_23554 ) ) ( not ( = ?auto_23547 ?auto_23545 ) ) ( not ( = ?auto_23547 ?auto_23539 ) ) ( not ( = ?auto_23547 ?auto_23535 ) ) ( not ( = ?auto_23547 ?auto_23553 ) ) ( not ( = ?auto_23544 ?auto_23541 ) ) ( not ( = ?auto_23544 ?auto_23558 ) ) ( not ( = ?auto_23544 ?auto_23550 ) ) ( not ( = ?auto_23544 ?auto_23559 ) ) ( not ( = ?auto_23544 ?auto_23560 ) ) ( not ( = ?auto_23544 ?auto_23557 ) ) ( not ( = ?auto_23544 ?auto_23555 ) ) ( not ( = ?auto_23544 ?auto_23548 ) ) ( not ( = ?auto_23544 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23527 ) ) ( not ( = ?auto_23516 ?auto_23542 ) ) ( not ( = ?auto_23517 ?auto_23527 ) ) ( not ( = ?auto_23517 ?auto_23542 ) ) ( not ( = ?auto_23518 ?auto_23527 ) ) ( not ( = ?auto_23518 ?auto_23542 ) ) ( not ( = ?auto_23519 ?auto_23527 ) ) ( not ( = ?auto_23519 ?auto_23542 ) ) ( not ( = ?auto_23520 ?auto_23527 ) ) ( not ( = ?auto_23520 ?auto_23542 ) ) ( not ( = ?auto_23521 ?auto_23527 ) ) ( not ( = ?auto_23521 ?auto_23542 ) ) ( not ( = ?auto_23522 ?auto_23527 ) ) ( not ( = ?auto_23522 ?auto_23542 ) ) ( not ( = ?auto_23523 ?auto_23527 ) ) ( not ( = ?auto_23523 ?auto_23542 ) ) ( not ( = ?auto_23524 ?auto_23527 ) ) ( not ( = ?auto_23524 ?auto_23542 ) ) ( not ( = ?auto_23525 ?auto_23527 ) ) ( not ( = ?auto_23525 ?auto_23542 ) ) ( not ( = ?auto_23527 ?auto_23544 ) ) ( not ( = ?auto_23527 ?auto_23541 ) ) ( not ( = ?auto_23527 ?auto_23558 ) ) ( not ( = ?auto_23527 ?auto_23550 ) ) ( not ( = ?auto_23527 ?auto_23559 ) ) ( not ( = ?auto_23527 ?auto_23560 ) ) ( not ( = ?auto_23527 ?auto_23557 ) ) ( not ( = ?auto_23527 ?auto_23555 ) ) ( not ( = ?auto_23527 ?auto_23548 ) ) ( not ( = ?auto_23527 ?auto_23552 ) ) ( not ( = ?auto_23542 ?auto_23544 ) ) ( not ( = ?auto_23542 ?auto_23541 ) ) ( not ( = ?auto_23542 ?auto_23558 ) ) ( not ( = ?auto_23542 ?auto_23550 ) ) ( not ( = ?auto_23542 ?auto_23559 ) ) ( not ( = ?auto_23542 ?auto_23560 ) ) ( not ( = ?auto_23542 ?auto_23557 ) ) ( not ( = ?auto_23542 ?auto_23555 ) ) ( not ( = ?auto_23542 ?auto_23548 ) ) ( not ( = ?auto_23542 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23528 ) ) ( not ( = ?auto_23516 ?auto_23540 ) ) ( not ( = ?auto_23517 ?auto_23528 ) ) ( not ( = ?auto_23517 ?auto_23540 ) ) ( not ( = ?auto_23518 ?auto_23528 ) ) ( not ( = ?auto_23518 ?auto_23540 ) ) ( not ( = ?auto_23519 ?auto_23528 ) ) ( not ( = ?auto_23519 ?auto_23540 ) ) ( not ( = ?auto_23520 ?auto_23528 ) ) ( not ( = ?auto_23520 ?auto_23540 ) ) ( not ( = ?auto_23521 ?auto_23528 ) ) ( not ( = ?auto_23521 ?auto_23540 ) ) ( not ( = ?auto_23522 ?auto_23528 ) ) ( not ( = ?auto_23522 ?auto_23540 ) ) ( not ( = ?auto_23523 ?auto_23528 ) ) ( not ( = ?auto_23523 ?auto_23540 ) ) ( not ( = ?auto_23524 ?auto_23528 ) ) ( not ( = ?auto_23524 ?auto_23540 ) ) ( not ( = ?auto_23525 ?auto_23528 ) ) ( not ( = ?auto_23525 ?auto_23540 ) ) ( not ( = ?auto_23526 ?auto_23528 ) ) ( not ( = ?auto_23526 ?auto_23540 ) ) ( not ( = ?auto_23528 ?auto_23542 ) ) ( not ( = ?auto_23528 ?auto_23544 ) ) ( not ( = ?auto_23528 ?auto_23541 ) ) ( not ( = ?auto_23528 ?auto_23558 ) ) ( not ( = ?auto_23528 ?auto_23550 ) ) ( not ( = ?auto_23528 ?auto_23559 ) ) ( not ( = ?auto_23528 ?auto_23560 ) ) ( not ( = ?auto_23528 ?auto_23557 ) ) ( not ( = ?auto_23528 ?auto_23555 ) ) ( not ( = ?auto_23528 ?auto_23548 ) ) ( not ( = ?auto_23528 ?auto_23552 ) ) ( not ( = ?auto_23540 ?auto_23542 ) ) ( not ( = ?auto_23540 ?auto_23544 ) ) ( not ( = ?auto_23540 ?auto_23541 ) ) ( not ( = ?auto_23540 ?auto_23558 ) ) ( not ( = ?auto_23540 ?auto_23550 ) ) ( not ( = ?auto_23540 ?auto_23559 ) ) ( not ( = ?auto_23540 ?auto_23560 ) ) ( not ( = ?auto_23540 ?auto_23557 ) ) ( not ( = ?auto_23540 ?auto_23555 ) ) ( not ( = ?auto_23540 ?auto_23548 ) ) ( not ( = ?auto_23540 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23529 ) ) ( not ( = ?auto_23516 ?auto_23538 ) ) ( not ( = ?auto_23517 ?auto_23529 ) ) ( not ( = ?auto_23517 ?auto_23538 ) ) ( not ( = ?auto_23518 ?auto_23529 ) ) ( not ( = ?auto_23518 ?auto_23538 ) ) ( not ( = ?auto_23519 ?auto_23529 ) ) ( not ( = ?auto_23519 ?auto_23538 ) ) ( not ( = ?auto_23520 ?auto_23529 ) ) ( not ( = ?auto_23520 ?auto_23538 ) ) ( not ( = ?auto_23521 ?auto_23529 ) ) ( not ( = ?auto_23521 ?auto_23538 ) ) ( not ( = ?auto_23522 ?auto_23529 ) ) ( not ( = ?auto_23522 ?auto_23538 ) ) ( not ( = ?auto_23523 ?auto_23529 ) ) ( not ( = ?auto_23523 ?auto_23538 ) ) ( not ( = ?auto_23524 ?auto_23529 ) ) ( not ( = ?auto_23524 ?auto_23538 ) ) ( not ( = ?auto_23525 ?auto_23529 ) ) ( not ( = ?auto_23525 ?auto_23538 ) ) ( not ( = ?auto_23526 ?auto_23529 ) ) ( not ( = ?auto_23526 ?auto_23538 ) ) ( not ( = ?auto_23527 ?auto_23529 ) ) ( not ( = ?auto_23527 ?auto_23538 ) ) ( not ( = ?auto_23529 ?auto_23540 ) ) ( not ( = ?auto_23529 ?auto_23542 ) ) ( not ( = ?auto_23529 ?auto_23544 ) ) ( not ( = ?auto_23529 ?auto_23541 ) ) ( not ( = ?auto_23529 ?auto_23558 ) ) ( not ( = ?auto_23529 ?auto_23550 ) ) ( not ( = ?auto_23529 ?auto_23559 ) ) ( not ( = ?auto_23529 ?auto_23560 ) ) ( not ( = ?auto_23529 ?auto_23557 ) ) ( not ( = ?auto_23529 ?auto_23555 ) ) ( not ( = ?auto_23529 ?auto_23548 ) ) ( not ( = ?auto_23529 ?auto_23552 ) ) ( not ( = ?auto_23538 ?auto_23540 ) ) ( not ( = ?auto_23538 ?auto_23542 ) ) ( not ( = ?auto_23538 ?auto_23544 ) ) ( not ( = ?auto_23538 ?auto_23541 ) ) ( not ( = ?auto_23538 ?auto_23558 ) ) ( not ( = ?auto_23538 ?auto_23550 ) ) ( not ( = ?auto_23538 ?auto_23559 ) ) ( not ( = ?auto_23538 ?auto_23560 ) ) ( not ( = ?auto_23538 ?auto_23557 ) ) ( not ( = ?auto_23538 ?auto_23555 ) ) ( not ( = ?auto_23538 ?auto_23548 ) ) ( not ( = ?auto_23538 ?auto_23552 ) ) ( not ( = ?auto_23516 ?auto_23530 ) ) ( not ( = ?auto_23516 ?auto_23532 ) ) ( not ( = ?auto_23517 ?auto_23530 ) ) ( not ( = ?auto_23517 ?auto_23532 ) ) ( not ( = ?auto_23518 ?auto_23530 ) ) ( not ( = ?auto_23518 ?auto_23532 ) ) ( not ( = ?auto_23519 ?auto_23530 ) ) ( not ( = ?auto_23519 ?auto_23532 ) ) ( not ( = ?auto_23520 ?auto_23530 ) ) ( not ( = ?auto_23520 ?auto_23532 ) ) ( not ( = ?auto_23521 ?auto_23530 ) ) ( not ( = ?auto_23521 ?auto_23532 ) ) ( not ( = ?auto_23522 ?auto_23530 ) ) ( not ( = ?auto_23522 ?auto_23532 ) ) ( not ( = ?auto_23523 ?auto_23530 ) ) ( not ( = ?auto_23523 ?auto_23532 ) ) ( not ( = ?auto_23524 ?auto_23530 ) ) ( not ( = ?auto_23524 ?auto_23532 ) ) ( not ( = ?auto_23525 ?auto_23530 ) ) ( not ( = ?auto_23525 ?auto_23532 ) ) ( not ( = ?auto_23526 ?auto_23530 ) ) ( not ( = ?auto_23526 ?auto_23532 ) ) ( not ( = ?auto_23527 ?auto_23530 ) ) ( not ( = ?auto_23527 ?auto_23532 ) ) ( not ( = ?auto_23528 ?auto_23530 ) ) ( not ( = ?auto_23528 ?auto_23532 ) ) ( not ( = ?auto_23530 ?auto_23538 ) ) ( not ( = ?auto_23530 ?auto_23540 ) ) ( not ( = ?auto_23530 ?auto_23542 ) ) ( not ( = ?auto_23530 ?auto_23544 ) ) ( not ( = ?auto_23530 ?auto_23541 ) ) ( not ( = ?auto_23530 ?auto_23558 ) ) ( not ( = ?auto_23530 ?auto_23550 ) ) ( not ( = ?auto_23530 ?auto_23559 ) ) ( not ( = ?auto_23530 ?auto_23560 ) ) ( not ( = ?auto_23530 ?auto_23557 ) ) ( not ( = ?auto_23530 ?auto_23555 ) ) ( not ( = ?auto_23530 ?auto_23548 ) ) ( not ( = ?auto_23530 ?auto_23552 ) ) ( not ( = ?auto_23532 ?auto_23538 ) ) ( not ( = ?auto_23532 ?auto_23540 ) ) ( not ( = ?auto_23532 ?auto_23542 ) ) ( not ( = ?auto_23532 ?auto_23544 ) ) ( not ( = ?auto_23532 ?auto_23541 ) ) ( not ( = ?auto_23532 ?auto_23558 ) ) ( not ( = ?auto_23532 ?auto_23550 ) ) ( not ( = ?auto_23532 ?auto_23559 ) ) ( not ( = ?auto_23532 ?auto_23560 ) ) ( not ( = ?auto_23532 ?auto_23557 ) ) ( not ( = ?auto_23532 ?auto_23555 ) ) ( not ( = ?auto_23532 ?auto_23548 ) ) ( not ( = ?auto_23532 ?auto_23552 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_23516 ?auto_23517 ?auto_23518 ?auto_23519 ?auto_23520 ?auto_23521 ?auto_23522 ?auto_23523 ?auto_23524 ?auto_23525 ?auto_23526 ?auto_23527 ?auto_23528 ?auto_23529 )
      ( MAKE-1CRATE ?auto_23529 ?auto_23530 )
      ( MAKE-14CRATE-VERIFY ?auto_23516 ?auto_23517 ?auto_23518 ?auto_23519 ?auto_23520 ?auto_23521 ?auto_23522 ?auto_23523 ?auto_23524 ?auto_23525 ?auto_23526 ?auto_23527 ?auto_23528 ?auto_23529 ?auto_23530 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_23588 - SURFACE
      ?auto_23589 - SURFACE
      ?auto_23590 - SURFACE
      ?auto_23591 - SURFACE
      ?auto_23592 - SURFACE
      ?auto_23593 - SURFACE
      ?auto_23594 - SURFACE
      ?auto_23595 - SURFACE
      ?auto_23596 - SURFACE
      ?auto_23597 - SURFACE
      ?auto_23598 - SURFACE
      ?auto_23599 - SURFACE
      ?auto_23600 - SURFACE
      ?auto_23601 - SURFACE
      ?auto_23603 - SURFACE
      ?auto_23602 - SURFACE
    )
    :vars
    (
      ?auto_23605 - HOIST
      ?auto_23604 - PLACE
      ?auto_23608 - PLACE
      ?auto_23606 - HOIST
      ?auto_23609 - SURFACE
      ?auto_23620 - PLACE
      ?auto_23631 - HOIST
      ?auto_23619 - SURFACE
      ?auto_23627 - SURFACE
      ?auto_23612 - SURFACE
      ?auto_23623 - PLACE
      ?auto_23615 - HOIST
      ?auto_23622 - SURFACE
      ?auto_23626 - PLACE
      ?auto_23617 - HOIST
      ?auto_23624 - SURFACE
      ?auto_23610 - SURFACE
      ?auto_23613 - SURFACE
      ?auto_23621 - SURFACE
      ?auto_23628 - PLACE
      ?auto_23630 - HOIST
      ?auto_23634 - SURFACE
      ?auto_23629 - PLACE
      ?auto_23625 - HOIST
      ?auto_23633 - SURFACE
      ?auto_23616 - SURFACE
      ?auto_23618 - SURFACE
      ?auto_23611 - PLACE
      ?auto_23632 - HOIST
      ?auto_23614 - SURFACE
      ?auto_23635 - SURFACE
      ?auto_23607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23605 ?auto_23604 ) ( IS-CRATE ?auto_23602 ) ( not ( = ?auto_23608 ?auto_23604 ) ) ( HOIST-AT ?auto_23606 ?auto_23608 ) ( SURFACE-AT ?auto_23602 ?auto_23608 ) ( ON ?auto_23602 ?auto_23609 ) ( CLEAR ?auto_23602 ) ( not ( = ?auto_23603 ?auto_23602 ) ) ( not ( = ?auto_23603 ?auto_23609 ) ) ( not ( = ?auto_23602 ?auto_23609 ) ) ( not ( = ?auto_23605 ?auto_23606 ) ) ( IS-CRATE ?auto_23603 ) ( not ( = ?auto_23620 ?auto_23604 ) ) ( HOIST-AT ?auto_23631 ?auto_23620 ) ( SURFACE-AT ?auto_23603 ?auto_23620 ) ( ON ?auto_23603 ?auto_23619 ) ( CLEAR ?auto_23603 ) ( not ( = ?auto_23601 ?auto_23603 ) ) ( not ( = ?auto_23601 ?auto_23619 ) ) ( not ( = ?auto_23603 ?auto_23619 ) ) ( not ( = ?auto_23605 ?auto_23631 ) ) ( IS-CRATE ?auto_23601 ) ( SURFACE-AT ?auto_23601 ?auto_23620 ) ( ON ?auto_23601 ?auto_23627 ) ( CLEAR ?auto_23601 ) ( not ( = ?auto_23600 ?auto_23601 ) ) ( not ( = ?auto_23600 ?auto_23627 ) ) ( not ( = ?auto_23601 ?auto_23627 ) ) ( IS-CRATE ?auto_23600 ) ( SURFACE-AT ?auto_23600 ?auto_23620 ) ( ON ?auto_23600 ?auto_23612 ) ( CLEAR ?auto_23600 ) ( not ( = ?auto_23599 ?auto_23600 ) ) ( not ( = ?auto_23599 ?auto_23612 ) ) ( not ( = ?auto_23600 ?auto_23612 ) ) ( IS-CRATE ?auto_23599 ) ( not ( = ?auto_23623 ?auto_23604 ) ) ( HOIST-AT ?auto_23615 ?auto_23623 ) ( SURFACE-AT ?auto_23599 ?auto_23623 ) ( ON ?auto_23599 ?auto_23622 ) ( CLEAR ?auto_23599 ) ( not ( = ?auto_23598 ?auto_23599 ) ) ( not ( = ?auto_23598 ?auto_23622 ) ) ( not ( = ?auto_23599 ?auto_23622 ) ) ( not ( = ?auto_23605 ?auto_23615 ) ) ( IS-CRATE ?auto_23598 ) ( not ( = ?auto_23626 ?auto_23604 ) ) ( HOIST-AT ?auto_23617 ?auto_23626 ) ( AVAILABLE ?auto_23617 ) ( SURFACE-AT ?auto_23598 ?auto_23626 ) ( ON ?auto_23598 ?auto_23624 ) ( CLEAR ?auto_23598 ) ( not ( = ?auto_23597 ?auto_23598 ) ) ( not ( = ?auto_23597 ?auto_23624 ) ) ( not ( = ?auto_23598 ?auto_23624 ) ) ( not ( = ?auto_23605 ?auto_23617 ) ) ( IS-CRATE ?auto_23597 ) ( SURFACE-AT ?auto_23597 ?auto_23623 ) ( ON ?auto_23597 ?auto_23610 ) ( CLEAR ?auto_23597 ) ( not ( = ?auto_23596 ?auto_23597 ) ) ( not ( = ?auto_23596 ?auto_23610 ) ) ( not ( = ?auto_23597 ?auto_23610 ) ) ( IS-CRATE ?auto_23596 ) ( SURFACE-AT ?auto_23596 ?auto_23608 ) ( ON ?auto_23596 ?auto_23613 ) ( CLEAR ?auto_23596 ) ( not ( = ?auto_23595 ?auto_23596 ) ) ( not ( = ?auto_23595 ?auto_23613 ) ) ( not ( = ?auto_23596 ?auto_23613 ) ) ( IS-CRATE ?auto_23595 ) ( SURFACE-AT ?auto_23595 ?auto_23623 ) ( ON ?auto_23595 ?auto_23621 ) ( CLEAR ?auto_23595 ) ( not ( = ?auto_23594 ?auto_23595 ) ) ( not ( = ?auto_23594 ?auto_23621 ) ) ( not ( = ?auto_23595 ?auto_23621 ) ) ( IS-CRATE ?auto_23594 ) ( not ( = ?auto_23628 ?auto_23604 ) ) ( HOIST-AT ?auto_23630 ?auto_23628 ) ( AVAILABLE ?auto_23630 ) ( SURFACE-AT ?auto_23594 ?auto_23628 ) ( ON ?auto_23594 ?auto_23634 ) ( CLEAR ?auto_23594 ) ( not ( = ?auto_23593 ?auto_23594 ) ) ( not ( = ?auto_23593 ?auto_23634 ) ) ( not ( = ?auto_23594 ?auto_23634 ) ) ( not ( = ?auto_23605 ?auto_23630 ) ) ( IS-CRATE ?auto_23593 ) ( not ( = ?auto_23629 ?auto_23604 ) ) ( HOIST-AT ?auto_23625 ?auto_23629 ) ( AVAILABLE ?auto_23625 ) ( SURFACE-AT ?auto_23593 ?auto_23629 ) ( ON ?auto_23593 ?auto_23633 ) ( CLEAR ?auto_23593 ) ( not ( = ?auto_23592 ?auto_23593 ) ) ( not ( = ?auto_23592 ?auto_23633 ) ) ( not ( = ?auto_23593 ?auto_23633 ) ) ( not ( = ?auto_23605 ?auto_23625 ) ) ( IS-CRATE ?auto_23592 ) ( AVAILABLE ?auto_23631 ) ( SURFACE-AT ?auto_23592 ?auto_23620 ) ( ON ?auto_23592 ?auto_23616 ) ( CLEAR ?auto_23592 ) ( not ( = ?auto_23591 ?auto_23592 ) ) ( not ( = ?auto_23591 ?auto_23616 ) ) ( not ( = ?auto_23592 ?auto_23616 ) ) ( IS-CRATE ?auto_23591 ) ( AVAILABLE ?auto_23615 ) ( SURFACE-AT ?auto_23591 ?auto_23623 ) ( ON ?auto_23591 ?auto_23618 ) ( CLEAR ?auto_23591 ) ( not ( = ?auto_23590 ?auto_23591 ) ) ( not ( = ?auto_23590 ?auto_23618 ) ) ( not ( = ?auto_23591 ?auto_23618 ) ) ( IS-CRATE ?auto_23590 ) ( not ( = ?auto_23611 ?auto_23604 ) ) ( HOIST-AT ?auto_23632 ?auto_23611 ) ( AVAILABLE ?auto_23632 ) ( SURFACE-AT ?auto_23590 ?auto_23611 ) ( ON ?auto_23590 ?auto_23614 ) ( CLEAR ?auto_23590 ) ( not ( = ?auto_23589 ?auto_23590 ) ) ( not ( = ?auto_23589 ?auto_23614 ) ) ( not ( = ?auto_23590 ?auto_23614 ) ) ( not ( = ?auto_23605 ?auto_23632 ) ) ( SURFACE-AT ?auto_23588 ?auto_23604 ) ( CLEAR ?auto_23588 ) ( IS-CRATE ?auto_23589 ) ( AVAILABLE ?auto_23605 ) ( AVAILABLE ?auto_23606 ) ( SURFACE-AT ?auto_23589 ?auto_23608 ) ( ON ?auto_23589 ?auto_23635 ) ( CLEAR ?auto_23589 ) ( TRUCK-AT ?auto_23607 ?auto_23604 ) ( not ( = ?auto_23588 ?auto_23589 ) ) ( not ( = ?auto_23588 ?auto_23635 ) ) ( not ( = ?auto_23589 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23590 ) ) ( not ( = ?auto_23588 ?auto_23614 ) ) ( not ( = ?auto_23590 ?auto_23635 ) ) ( not ( = ?auto_23611 ?auto_23608 ) ) ( not ( = ?auto_23632 ?auto_23606 ) ) ( not ( = ?auto_23614 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23591 ) ) ( not ( = ?auto_23588 ?auto_23618 ) ) ( not ( = ?auto_23589 ?auto_23591 ) ) ( not ( = ?auto_23589 ?auto_23618 ) ) ( not ( = ?auto_23591 ?auto_23614 ) ) ( not ( = ?auto_23591 ?auto_23635 ) ) ( not ( = ?auto_23623 ?auto_23611 ) ) ( not ( = ?auto_23623 ?auto_23608 ) ) ( not ( = ?auto_23615 ?auto_23632 ) ) ( not ( = ?auto_23615 ?auto_23606 ) ) ( not ( = ?auto_23618 ?auto_23614 ) ) ( not ( = ?auto_23618 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23592 ) ) ( not ( = ?auto_23588 ?auto_23616 ) ) ( not ( = ?auto_23589 ?auto_23592 ) ) ( not ( = ?auto_23589 ?auto_23616 ) ) ( not ( = ?auto_23590 ?auto_23592 ) ) ( not ( = ?auto_23590 ?auto_23616 ) ) ( not ( = ?auto_23592 ?auto_23618 ) ) ( not ( = ?auto_23592 ?auto_23614 ) ) ( not ( = ?auto_23592 ?auto_23635 ) ) ( not ( = ?auto_23620 ?auto_23623 ) ) ( not ( = ?auto_23620 ?auto_23611 ) ) ( not ( = ?auto_23620 ?auto_23608 ) ) ( not ( = ?auto_23631 ?auto_23615 ) ) ( not ( = ?auto_23631 ?auto_23632 ) ) ( not ( = ?auto_23631 ?auto_23606 ) ) ( not ( = ?auto_23616 ?auto_23618 ) ) ( not ( = ?auto_23616 ?auto_23614 ) ) ( not ( = ?auto_23616 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23593 ) ) ( not ( = ?auto_23588 ?auto_23633 ) ) ( not ( = ?auto_23589 ?auto_23593 ) ) ( not ( = ?auto_23589 ?auto_23633 ) ) ( not ( = ?auto_23590 ?auto_23593 ) ) ( not ( = ?auto_23590 ?auto_23633 ) ) ( not ( = ?auto_23591 ?auto_23593 ) ) ( not ( = ?auto_23591 ?auto_23633 ) ) ( not ( = ?auto_23593 ?auto_23616 ) ) ( not ( = ?auto_23593 ?auto_23618 ) ) ( not ( = ?auto_23593 ?auto_23614 ) ) ( not ( = ?auto_23593 ?auto_23635 ) ) ( not ( = ?auto_23629 ?auto_23620 ) ) ( not ( = ?auto_23629 ?auto_23623 ) ) ( not ( = ?auto_23629 ?auto_23611 ) ) ( not ( = ?auto_23629 ?auto_23608 ) ) ( not ( = ?auto_23625 ?auto_23631 ) ) ( not ( = ?auto_23625 ?auto_23615 ) ) ( not ( = ?auto_23625 ?auto_23632 ) ) ( not ( = ?auto_23625 ?auto_23606 ) ) ( not ( = ?auto_23633 ?auto_23616 ) ) ( not ( = ?auto_23633 ?auto_23618 ) ) ( not ( = ?auto_23633 ?auto_23614 ) ) ( not ( = ?auto_23633 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23594 ) ) ( not ( = ?auto_23588 ?auto_23634 ) ) ( not ( = ?auto_23589 ?auto_23594 ) ) ( not ( = ?auto_23589 ?auto_23634 ) ) ( not ( = ?auto_23590 ?auto_23594 ) ) ( not ( = ?auto_23590 ?auto_23634 ) ) ( not ( = ?auto_23591 ?auto_23594 ) ) ( not ( = ?auto_23591 ?auto_23634 ) ) ( not ( = ?auto_23592 ?auto_23594 ) ) ( not ( = ?auto_23592 ?auto_23634 ) ) ( not ( = ?auto_23594 ?auto_23633 ) ) ( not ( = ?auto_23594 ?auto_23616 ) ) ( not ( = ?auto_23594 ?auto_23618 ) ) ( not ( = ?auto_23594 ?auto_23614 ) ) ( not ( = ?auto_23594 ?auto_23635 ) ) ( not ( = ?auto_23628 ?auto_23629 ) ) ( not ( = ?auto_23628 ?auto_23620 ) ) ( not ( = ?auto_23628 ?auto_23623 ) ) ( not ( = ?auto_23628 ?auto_23611 ) ) ( not ( = ?auto_23628 ?auto_23608 ) ) ( not ( = ?auto_23630 ?auto_23625 ) ) ( not ( = ?auto_23630 ?auto_23631 ) ) ( not ( = ?auto_23630 ?auto_23615 ) ) ( not ( = ?auto_23630 ?auto_23632 ) ) ( not ( = ?auto_23630 ?auto_23606 ) ) ( not ( = ?auto_23634 ?auto_23633 ) ) ( not ( = ?auto_23634 ?auto_23616 ) ) ( not ( = ?auto_23634 ?auto_23618 ) ) ( not ( = ?auto_23634 ?auto_23614 ) ) ( not ( = ?auto_23634 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23595 ) ) ( not ( = ?auto_23588 ?auto_23621 ) ) ( not ( = ?auto_23589 ?auto_23595 ) ) ( not ( = ?auto_23589 ?auto_23621 ) ) ( not ( = ?auto_23590 ?auto_23595 ) ) ( not ( = ?auto_23590 ?auto_23621 ) ) ( not ( = ?auto_23591 ?auto_23595 ) ) ( not ( = ?auto_23591 ?auto_23621 ) ) ( not ( = ?auto_23592 ?auto_23595 ) ) ( not ( = ?auto_23592 ?auto_23621 ) ) ( not ( = ?auto_23593 ?auto_23595 ) ) ( not ( = ?auto_23593 ?auto_23621 ) ) ( not ( = ?auto_23595 ?auto_23634 ) ) ( not ( = ?auto_23595 ?auto_23633 ) ) ( not ( = ?auto_23595 ?auto_23616 ) ) ( not ( = ?auto_23595 ?auto_23618 ) ) ( not ( = ?auto_23595 ?auto_23614 ) ) ( not ( = ?auto_23595 ?auto_23635 ) ) ( not ( = ?auto_23621 ?auto_23634 ) ) ( not ( = ?auto_23621 ?auto_23633 ) ) ( not ( = ?auto_23621 ?auto_23616 ) ) ( not ( = ?auto_23621 ?auto_23618 ) ) ( not ( = ?auto_23621 ?auto_23614 ) ) ( not ( = ?auto_23621 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23596 ) ) ( not ( = ?auto_23588 ?auto_23613 ) ) ( not ( = ?auto_23589 ?auto_23596 ) ) ( not ( = ?auto_23589 ?auto_23613 ) ) ( not ( = ?auto_23590 ?auto_23596 ) ) ( not ( = ?auto_23590 ?auto_23613 ) ) ( not ( = ?auto_23591 ?auto_23596 ) ) ( not ( = ?auto_23591 ?auto_23613 ) ) ( not ( = ?auto_23592 ?auto_23596 ) ) ( not ( = ?auto_23592 ?auto_23613 ) ) ( not ( = ?auto_23593 ?auto_23596 ) ) ( not ( = ?auto_23593 ?auto_23613 ) ) ( not ( = ?auto_23594 ?auto_23596 ) ) ( not ( = ?auto_23594 ?auto_23613 ) ) ( not ( = ?auto_23596 ?auto_23621 ) ) ( not ( = ?auto_23596 ?auto_23634 ) ) ( not ( = ?auto_23596 ?auto_23633 ) ) ( not ( = ?auto_23596 ?auto_23616 ) ) ( not ( = ?auto_23596 ?auto_23618 ) ) ( not ( = ?auto_23596 ?auto_23614 ) ) ( not ( = ?auto_23596 ?auto_23635 ) ) ( not ( = ?auto_23613 ?auto_23621 ) ) ( not ( = ?auto_23613 ?auto_23634 ) ) ( not ( = ?auto_23613 ?auto_23633 ) ) ( not ( = ?auto_23613 ?auto_23616 ) ) ( not ( = ?auto_23613 ?auto_23618 ) ) ( not ( = ?auto_23613 ?auto_23614 ) ) ( not ( = ?auto_23613 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23597 ) ) ( not ( = ?auto_23588 ?auto_23610 ) ) ( not ( = ?auto_23589 ?auto_23597 ) ) ( not ( = ?auto_23589 ?auto_23610 ) ) ( not ( = ?auto_23590 ?auto_23597 ) ) ( not ( = ?auto_23590 ?auto_23610 ) ) ( not ( = ?auto_23591 ?auto_23597 ) ) ( not ( = ?auto_23591 ?auto_23610 ) ) ( not ( = ?auto_23592 ?auto_23597 ) ) ( not ( = ?auto_23592 ?auto_23610 ) ) ( not ( = ?auto_23593 ?auto_23597 ) ) ( not ( = ?auto_23593 ?auto_23610 ) ) ( not ( = ?auto_23594 ?auto_23597 ) ) ( not ( = ?auto_23594 ?auto_23610 ) ) ( not ( = ?auto_23595 ?auto_23597 ) ) ( not ( = ?auto_23595 ?auto_23610 ) ) ( not ( = ?auto_23597 ?auto_23613 ) ) ( not ( = ?auto_23597 ?auto_23621 ) ) ( not ( = ?auto_23597 ?auto_23634 ) ) ( not ( = ?auto_23597 ?auto_23633 ) ) ( not ( = ?auto_23597 ?auto_23616 ) ) ( not ( = ?auto_23597 ?auto_23618 ) ) ( not ( = ?auto_23597 ?auto_23614 ) ) ( not ( = ?auto_23597 ?auto_23635 ) ) ( not ( = ?auto_23610 ?auto_23613 ) ) ( not ( = ?auto_23610 ?auto_23621 ) ) ( not ( = ?auto_23610 ?auto_23634 ) ) ( not ( = ?auto_23610 ?auto_23633 ) ) ( not ( = ?auto_23610 ?auto_23616 ) ) ( not ( = ?auto_23610 ?auto_23618 ) ) ( not ( = ?auto_23610 ?auto_23614 ) ) ( not ( = ?auto_23610 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23598 ) ) ( not ( = ?auto_23588 ?auto_23624 ) ) ( not ( = ?auto_23589 ?auto_23598 ) ) ( not ( = ?auto_23589 ?auto_23624 ) ) ( not ( = ?auto_23590 ?auto_23598 ) ) ( not ( = ?auto_23590 ?auto_23624 ) ) ( not ( = ?auto_23591 ?auto_23598 ) ) ( not ( = ?auto_23591 ?auto_23624 ) ) ( not ( = ?auto_23592 ?auto_23598 ) ) ( not ( = ?auto_23592 ?auto_23624 ) ) ( not ( = ?auto_23593 ?auto_23598 ) ) ( not ( = ?auto_23593 ?auto_23624 ) ) ( not ( = ?auto_23594 ?auto_23598 ) ) ( not ( = ?auto_23594 ?auto_23624 ) ) ( not ( = ?auto_23595 ?auto_23598 ) ) ( not ( = ?auto_23595 ?auto_23624 ) ) ( not ( = ?auto_23596 ?auto_23598 ) ) ( not ( = ?auto_23596 ?auto_23624 ) ) ( not ( = ?auto_23598 ?auto_23610 ) ) ( not ( = ?auto_23598 ?auto_23613 ) ) ( not ( = ?auto_23598 ?auto_23621 ) ) ( not ( = ?auto_23598 ?auto_23634 ) ) ( not ( = ?auto_23598 ?auto_23633 ) ) ( not ( = ?auto_23598 ?auto_23616 ) ) ( not ( = ?auto_23598 ?auto_23618 ) ) ( not ( = ?auto_23598 ?auto_23614 ) ) ( not ( = ?auto_23598 ?auto_23635 ) ) ( not ( = ?auto_23626 ?auto_23623 ) ) ( not ( = ?auto_23626 ?auto_23608 ) ) ( not ( = ?auto_23626 ?auto_23628 ) ) ( not ( = ?auto_23626 ?auto_23629 ) ) ( not ( = ?auto_23626 ?auto_23620 ) ) ( not ( = ?auto_23626 ?auto_23611 ) ) ( not ( = ?auto_23617 ?auto_23615 ) ) ( not ( = ?auto_23617 ?auto_23606 ) ) ( not ( = ?auto_23617 ?auto_23630 ) ) ( not ( = ?auto_23617 ?auto_23625 ) ) ( not ( = ?auto_23617 ?auto_23631 ) ) ( not ( = ?auto_23617 ?auto_23632 ) ) ( not ( = ?auto_23624 ?auto_23610 ) ) ( not ( = ?auto_23624 ?auto_23613 ) ) ( not ( = ?auto_23624 ?auto_23621 ) ) ( not ( = ?auto_23624 ?auto_23634 ) ) ( not ( = ?auto_23624 ?auto_23633 ) ) ( not ( = ?auto_23624 ?auto_23616 ) ) ( not ( = ?auto_23624 ?auto_23618 ) ) ( not ( = ?auto_23624 ?auto_23614 ) ) ( not ( = ?auto_23624 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23599 ) ) ( not ( = ?auto_23588 ?auto_23622 ) ) ( not ( = ?auto_23589 ?auto_23599 ) ) ( not ( = ?auto_23589 ?auto_23622 ) ) ( not ( = ?auto_23590 ?auto_23599 ) ) ( not ( = ?auto_23590 ?auto_23622 ) ) ( not ( = ?auto_23591 ?auto_23599 ) ) ( not ( = ?auto_23591 ?auto_23622 ) ) ( not ( = ?auto_23592 ?auto_23599 ) ) ( not ( = ?auto_23592 ?auto_23622 ) ) ( not ( = ?auto_23593 ?auto_23599 ) ) ( not ( = ?auto_23593 ?auto_23622 ) ) ( not ( = ?auto_23594 ?auto_23599 ) ) ( not ( = ?auto_23594 ?auto_23622 ) ) ( not ( = ?auto_23595 ?auto_23599 ) ) ( not ( = ?auto_23595 ?auto_23622 ) ) ( not ( = ?auto_23596 ?auto_23599 ) ) ( not ( = ?auto_23596 ?auto_23622 ) ) ( not ( = ?auto_23597 ?auto_23599 ) ) ( not ( = ?auto_23597 ?auto_23622 ) ) ( not ( = ?auto_23599 ?auto_23624 ) ) ( not ( = ?auto_23599 ?auto_23610 ) ) ( not ( = ?auto_23599 ?auto_23613 ) ) ( not ( = ?auto_23599 ?auto_23621 ) ) ( not ( = ?auto_23599 ?auto_23634 ) ) ( not ( = ?auto_23599 ?auto_23633 ) ) ( not ( = ?auto_23599 ?auto_23616 ) ) ( not ( = ?auto_23599 ?auto_23618 ) ) ( not ( = ?auto_23599 ?auto_23614 ) ) ( not ( = ?auto_23599 ?auto_23635 ) ) ( not ( = ?auto_23622 ?auto_23624 ) ) ( not ( = ?auto_23622 ?auto_23610 ) ) ( not ( = ?auto_23622 ?auto_23613 ) ) ( not ( = ?auto_23622 ?auto_23621 ) ) ( not ( = ?auto_23622 ?auto_23634 ) ) ( not ( = ?auto_23622 ?auto_23633 ) ) ( not ( = ?auto_23622 ?auto_23616 ) ) ( not ( = ?auto_23622 ?auto_23618 ) ) ( not ( = ?auto_23622 ?auto_23614 ) ) ( not ( = ?auto_23622 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23600 ) ) ( not ( = ?auto_23588 ?auto_23612 ) ) ( not ( = ?auto_23589 ?auto_23600 ) ) ( not ( = ?auto_23589 ?auto_23612 ) ) ( not ( = ?auto_23590 ?auto_23600 ) ) ( not ( = ?auto_23590 ?auto_23612 ) ) ( not ( = ?auto_23591 ?auto_23600 ) ) ( not ( = ?auto_23591 ?auto_23612 ) ) ( not ( = ?auto_23592 ?auto_23600 ) ) ( not ( = ?auto_23592 ?auto_23612 ) ) ( not ( = ?auto_23593 ?auto_23600 ) ) ( not ( = ?auto_23593 ?auto_23612 ) ) ( not ( = ?auto_23594 ?auto_23600 ) ) ( not ( = ?auto_23594 ?auto_23612 ) ) ( not ( = ?auto_23595 ?auto_23600 ) ) ( not ( = ?auto_23595 ?auto_23612 ) ) ( not ( = ?auto_23596 ?auto_23600 ) ) ( not ( = ?auto_23596 ?auto_23612 ) ) ( not ( = ?auto_23597 ?auto_23600 ) ) ( not ( = ?auto_23597 ?auto_23612 ) ) ( not ( = ?auto_23598 ?auto_23600 ) ) ( not ( = ?auto_23598 ?auto_23612 ) ) ( not ( = ?auto_23600 ?auto_23622 ) ) ( not ( = ?auto_23600 ?auto_23624 ) ) ( not ( = ?auto_23600 ?auto_23610 ) ) ( not ( = ?auto_23600 ?auto_23613 ) ) ( not ( = ?auto_23600 ?auto_23621 ) ) ( not ( = ?auto_23600 ?auto_23634 ) ) ( not ( = ?auto_23600 ?auto_23633 ) ) ( not ( = ?auto_23600 ?auto_23616 ) ) ( not ( = ?auto_23600 ?auto_23618 ) ) ( not ( = ?auto_23600 ?auto_23614 ) ) ( not ( = ?auto_23600 ?auto_23635 ) ) ( not ( = ?auto_23612 ?auto_23622 ) ) ( not ( = ?auto_23612 ?auto_23624 ) ) ( not ( = ?auto_23612 ?auto_23610 ) ) ( not ( = ?auto_23612 ?auto_23613 ) ) ( not ( = ?auto_23612 ?auto_23621 ) ) ( not ( = ?auto_23612 ?auto_23634 ) ) ( not ( = ?auto_23612 ?auto_23633 ) ) ( not ( = ?auto_23612 ?auto_23616 ) ) ( not ( = ?auto_23612 ?auto_23618 ) ) ( not ( = ?auto_23612 ?auto_23614 ) ) ( not ( = ?auto_23612 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23601 ) ) ( not ( = ?auto_23588 ?auto_23627 ) ) ( not ( = ?auto_23589 ?auto_23601 ) ) ( not ( = ?auto_23589 ?auto_23627 ) ) ( not ( = ?auto_23590 ?auto_23601 ) ) ( not ( = ?auto_23590 ?auto_23627 ) ) ( not ( = ?auto_23591 ?auto_23601 ) ) ( not ( = ?auto_23591 ?auto_23627 ) ) ( not ( = ?auto_23592 ?auto_23601 ) ) ( not ( = ?auto_23592 ?auto_23627 ) ) ( not ( = ?auto_23593 ?auto_23601 ) ) ( not ( = ?auto_23593 ?auto_23627 ) ) ( not ( = ?auto_23594 ?auto_23601 ) ) ( not ( = ?auto_23594 ?auto_23627 ) ) ( not ( = ?auto_23595 ?auto_23601 ) ) ( not ( = ?auto_23595 ?auto_23627 ) ) ( not ( = ?auto_23596 ?auto_23601 ) ) ( not ( = ?auto_23596 ?auto_23627 ) ) ( not ( = ?auto_23597 ?auto_23601 ) ) ( not ( = ?auto_23597 ?auto_23627 ) ) ( not ( = ?auto_23598 ?auto_23601 ) ) ( not ( = ?auto_23598 ?auto_23627 ) ) ( not ( = ?auto_23599 ?auto_23601 ) ) ( not ( = ?auto_23599 ?auto_23627 ) ) ( not ( = ?auto_23601 ?auto_23612 ) ) ( not ( = ?auto_23601 ?auto_23622 ) ) ( not ( = ?auto_23601 ?auto_23624 ) ) ( not ( = ?auto_23601 ?auto_23610 ) ) ( not ( = ?auto_23601 ?auto_23613 ) ) ( not ( = ?auto_23601 ?auto_23621 ) ) ( not ( = ?auto_23601 ?auto_23634 ) ) ( not ( = ?auto_23601 ?auto_23633 ) ) ( not ( = ?auto_23601 ?auto_23616 ) ) ( not ( = ?auto_23601 ?auto_23618 ) ) ( not ( = ?auto_23601 ?auto_23614 ) ) ( not ( = ?auto_23601 ?auto_23635 ) ) ( not ( = ?auto_23627 ?auto_23612 ) ) ( not ( = ?auto_23627 ?auto_23622 ) ) ( not ( = ?auto_23627 ?auto_23624 ) ) ( not ( = ?auto_23627 ?auto_23610 ) ) ( not ( = ?auto_23627 ?auto_23613 ) ) ( not ( = ?auto_23627 ?auto_23621 ) ) ( not ( = ?auto_23627 ?auto_23634 ) ) ( not ( = ?auto_23627 ?auto_23633 ) ) ( not ( = ?auto_23627 ?auto_23616 ) ) ( not ( = ?auto_23627 ?auto_23618 ) ) ( not ( = ?auto_23627 ?auto_23614 ) ) ( not ( = ?auto_23627 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23603 ) ) ( not ( = ?auto_23588 ?auto_23619 ) ) ( not ( = ?auto_23589 ?auto_23603 ) ) ( not ( = ?auto_23589 ?auto_23619 ) ) ( not ( = ?auto_23590 ?auto_23603 ) ) ( not ( = ?auto_23590 ?auto_23619 ) ) ( not ( = ?auto_23591 ?auto_23603 ) ) ( not ( = ?auto_23591 ?auto_23619 ) ) ( not ( = ?auto_23592 ?auto_23603 ) ) ( not ( = ?auto_23592 ?auto_23619 ) ) ( not ( = ?auto_23593 ?auto_23603 ) ) ( not ( = ?auto_23593 ?auto_23619 ) ) ( not ( = ?auto_23594 ?auto_23603 ) ) ( not ( = ?auto_23594 ?auto_23619 ) ) ( not ( = ?auto_23595 ?auto_23603 ) ) ( not ( = ?auto_23595 ?auto_23619 ) ) ( not ( = ?auto_23596 ?auto_23603 ) ) ( not ( = ?auto_23596 ?auto_23619 ) ) ( not ( = ?auto_23597 ?auto_23603 ) ) ( not ( = ?auto_23597 ?auto_23619 ) ) ( not ( = ?auto_23598 ?auto_23603 ) ) ( not ( = ?auto_23598 ?auto_23619 ) ) ( not ( = ?auto_23599 ?auto_23603 ) ) ( not ( = ?auto_23599 ?auto_23619 ) ) ( not ( = ?auto_23600 ?auto_23603 ) ) ( not ( = ?auto_23600 ?auto_23619 ) ) ( not ( = ?auto_23603 ?auto_23627 ) ) ( not ( = ?auto_23603 ?auto_23612 ) ) ( not ( = ?auto_23603 ?auto_23622 ) ) ( not ( = ?auto_23603 ?auto_23624 ) ) ( not ( = ?auto_23603 ?auto_23610 ) ) ( not ( = ?auto_23603 ?auto_23613 ) ) ( not ( = ?auto_23603 ?auto_23621 ) ) ( not ( = ?auto_23603 ?auto_23634 ) ) ( not ( = ?auto_23603 ?auto_23633 ) ) ( not ( = ?auto_23603 ?auto_23616 ) ) ( not ( = ?auto_23603 ?auto_23618 ) ) ( not ( = ?auto_23603 ?auto_23614 ) ) ( not ( = ?auto_23603 ?auto_23635 ) ) ( not ( = ?auto_23619 ?auto_23627 ) ) ( not ( = ?auto_23619 ?auto_23612 ) ) ( not ( = ?auto_23619 ?auto_23622 ) ) ( not ( = ?auto_23619 ?auto_23624 ) ) ( not ( = ?auto_23619 ?auto_23610 ) ) ( not ( = ?auto_23619 ?auto_23613 ) ) ( not ( = ?auto_23619 ?auto_23621 ) ) ( not ( = ?auto_23619 ?auto_23634 ) ) ( not ( = ?auto_23619 ?auto_23633 ) ) ( not ( = ?auto_23619 ?auto_23616 ) ) ( not ( = ?auto_23619 ?auto_23618 ) ) ( not ( = ?auto_23619 ?auto_23614 ) ) ( not ( = ?auto_23619 ?auto_23635 ) ) ( not ( = ?auto_23588 ?auto_23602 ) ) ( not ( = ?auto_23588 ?auto_23609 ) ) ( not ( = ?auto_23589 ?auto_23602 ) ) ( not ( = ?auto_23589 ?auto_23609 ) ) ( not ( = ?auto_23590 ?auto_23602 ) ) ( not ( = ?auto_23590 ?auto_23609 ) ) ( not ( = ?auto_23591 ?auto_23602 ) ) ( not ( = ?auto_23591 ?auto_23609 ) ) ( not ( = ?auto_23592 ?auto_23602 ) ) ( not ( = ?auto_23592 ?auto_23609 ) ) ( not ( = ?auto_23593 ?auto_23602 ) ) ( not ( = ?auto_23593 ?auto_23609 ) ) ( not ( = ?auto_23594 ?auto_23602 ) ) ( not ( = ?auto_23594 ?auto_23609 ) ) ( not ( = ?auto_23595 ?auto_23602 ) ) ( not ( = ?auto_23595 ?auto_23609 ) ) ( not ( = ?auto_23596 ?auto_23602 ) ) ( not ( = ?auto_23596 ?auto_23609 ) ) ( not ( = ?auto_23597 ?auto_23602 ) ) ( not ( = ?auto_23597 ?auto_23609 ) ) ( not ( = ?auto_23598 ?auto_23602 ) ) ( not ( = ?auto_23598 ?auto_23609 ) ) ( not ( = ?auto_23599 ?auto_23602 ) ) ( not ( = ?auto_23599 ?auto_23609 ) ) ( not ( = ?auto_23600 ?auto_23602 ) ) ( not ( = ?auto_23600 ?auto_23609 ) ) ( not ( = ?auto_23601 ?auto_23602 ) ) ( not ( = ?auto_23601 ?auto_23609 ) ) ( not ( = ?auto_23602 ?auto_23619 ) ) ( not ( = ?auto_23602 ?auto_23627 ) ) ( not ( = ?auto_23602 ?auto_23612 ) ) ( not ( = ?auto_23602 ?auto_23622 ) ) ( not ( = ?auto_23602 ?auto_23624 ) ) ( not ( = ?auto_23602 ?auto_23610 ) ) ( not ( = ?auto_23602 ?auto_23613 ) ) ( not ( = ?auto_23602 ?auto_23621 ) ) ( not ( = ?auto_23602 ?auto_23634 ) ) ( not ( = ?auto_23602 ?auto_23633 ) ) ( not ( = ?auto_23602 ?auto_23616 ) ) ( not ( = ?auto_23602 ?auto_23618 ) ) ( not ( = ?auto_23602 ?auto_23614 ) ) ( not ( = ?auto_23602 ?auto_23635 ) ) ( not ( = ?auto_23609 ?auto_23619 ) ) ( not ( = ?auto_23609 ?auto_23627 ) ) ( not ( = ?auto_23609 ?auto_23612 ) ) ( not ( = ?auto_23609 ?auto_23622 ) ) ( not ( = ?auto_23609 ?auto_23624 ) ) ( not ( = ?auto_23609 ?auto_23610 ) ) ( not ( = ?auto_23609 ?auto_23613 ) ) ( not ( = ?auto_23609 ?auto_23621 ) ) ( not ( = ?auto_23609 ?auto_23634 ) ) ( not ( = ?auto_23609 ?auto_23633 ) ) ( not ( = ?auto_23609 ?auto_23616 ) ) ( not ( = ?auto_23609 ?auto_23618 ) ) ( not ( = ?auto_23609 ?auto_23614 ) ) ( not ( = ?auto_23609 ?auto_23635 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_23588 ?auto_23589 ?auto_23590 ?auto_23591 ?auto_23592 ?auto_23593 ?auto_23594 ?auto_23595 ?auto_23596 ?auto_23597 ?auto_23598 ?auto_23599 ?auto_23600 ?auto_23601 ?auto_23603 )
      ( MAKE-1CRATE ?auto_23603 ?auto_23602 )
      ( MAKE-15CRATE-VERIFY ?auto_23588 ?auto_23589 ?auto_23590 ?auto_23591 ?auto_23592 ?auto_23593 ?auto_23594 ?auto_23595 ?auto_23596 ?auto_23597 ?auto_23598 ?auto_23599 ?auto_23600 ?auto_23601 ?auto_23603 ?auto_23602 ) )
  )

)

