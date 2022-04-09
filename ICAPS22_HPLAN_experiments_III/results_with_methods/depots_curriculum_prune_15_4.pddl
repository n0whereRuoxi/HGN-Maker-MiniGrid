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
      ?auto_22893 - SURFACE
      ?auto_22894 - SURFACE
    )
    :vars
    (
      ?auto_22895 - HOIST
      ?auto_22896 - PLACE
      ?auto_22898 - PLACE
      ?auto_22899 - HOIST
      ?auto_22900 - SURFACE
      ?auto_22897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22895 ?auto_22896 ) ( SURFACE-AT ?auto_22893 ?auto_22896 ) ( CLEAR ?auto_22893 ) ( IS-CRATE ?auto_22894 ) ( AVAILABLE ?auto_22895 ) ( not ( = ?auto_22898 ?auto_22896 ) ) ( HOIST-AT ?auto_22899 ?auto_22898 ) ( AVAILABLE ?auto_22899 ) ( SURFACE-AT ?auto_22894 ?auto_22898 ) ( ON ?auto_22894 ?auto_22900 ) ( CLEAR ?auto_22894 ) ( TRUCK-AT ?auto_22897 ?auto_22896 ) ( not ( = ?auto_22893 ?auto_22894 ) ) ( not ( = ?auto_22893 ?auto_22900 ) ) ( not ( = ?auto_22894 ?auto_22900 ) ) ( not ( = ?auto_22895 ?auto_22899 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22897 ?auto_22896 ?auto_22898 )
      ( !LIFT ?auto_22899 ?auto_22894 ?auto_22900 ?auto_22898 )
      ( !LOAD ?auto_22899 ?auto_22894 ?auto_22897 ?auto_22898 )
      ( !DRIVE ?auto_22897 ?auto_22898 ?auto_22896 )
      ( !UNLOAD ?auto_22895 ?auto_22894 ?auto_22897 ?auto_22896 )
      ( !DROP ?auto_22895 ?auto_22894 ?auto_22893 ?auto_22896 )
      ( MAKE-1CRATE-VERIFY ?auto_22893 ?auto_22894 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22914 - SURFACE
      ?auto_22915 - SURFACE
      ?auto_22916 - SURFACE
    )
    :vars
    (
      ?auto_22922 - HOIST
      ?auto_22921 - PLACE
      ?auto_22918 - PLACE
      ?auto_22919 - HOIST
      ?auto_22920 - SURFACE
      ?auto_22925 - PLACE
      ?auto_22923 - HOIST
      ?auto_22924 - SURFACE
      ?auto_22917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22922 ?auto_22921 ) ( IS-CRATE ?auto_22916 ) ( not ( = ?auto_22918 ?auto_22921 ) ) ( HOIST-AT ?auto_22919 ?auto_22918 ) ( AVAILABLE ?auto_22919 ) ( SURFACE-AT ?auto_22916 ?auto_22918 ) ( ON ?auto_22916 ?auto_22920 ) ( CLEAR ?auto_22916 ) ( not ( = ?auto_22915 ?auto_22916 ) ) ( not ( = ?auto_22915 ?auto_22920 ) ) ( not ( = ?auto_22916 ?auto_22920 ) ) ( not ( = ?auto_22922 ?auto_22919 ) ) ( SURFACE-AT ?auto_22914 ?auto_22921 ) ( CLEAR ?auto_22914 ) ( IS-CRATE ?auto_22915 ) ( AVAILABLE ?auto_22922 ) ( not ( = ?auto_22925 ?auto_22921 ) ) ( HOIST-AT ?auto_22923 ?auto_22925 ) ( AVAILABLE ?auto_22923 ) ( SURFACE-AT ?auto_22915 ?auto_22925 ) ( ON ?auto_22915 ?auto_22924 ) ( CLEAR ?auto_22915 ) ( TRUCK-AT ?auto_22917 ?auto_22921 ) ( not ( = ?auto_22914 ?auto_22915 ) ) ( not ( = ?auto_22914 ?auto_22924 ) ) ( not ( = ?auto_22915 ?auto_22924 ) ) ( not ( = ?auto_22922 ?auto_22923 ) ) ( not ( = ?auto_22914 ?auto_22916 ) ) ( not ( = ?auto_22914 ?auto_22920 ) ) ( not ( = ?auto_22916 ?auto_22924 ) ) ( not ( = ?auto_22918 ?auto_22925 ) ) ( not ( = ?auto_22919 ?auto_22923 ) ) ( not ( = ?auto_22920 ?auto_22924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22914 ?auto_22915 )
      ( MAKE-1CRATE ?auto_22915 ?auto_22916 )
      ( MAKE-2CRATE-VERIFY ?auto_22914 ?auto_22915 ?auto_22916 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22940 - SURFACE
      ?auto_22941 - SURFACE
      ?auto_22942 - SURFACE
      ?auto_22943 - SURFACE
    )
    :vars
    (
      ?auto_22949 - HOIST
      ?auto_22947 - PLACE
      ?auto_22946 - PLACE
      ?auto_22944 - HOIST
      ?auto_22945 - SURFACE
      ?auto_22950 - PLACE
      ?auto_22951 - HOIST
      ?auto_22952 - SURFACE
      ?auto_22954 - PLACE
      ?auto_22953 - HOIST
      ?auto_22955 - SURFACE
      ?auto_22948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22949 ?auto_22947 ) ( IS-CRATE ?auto_22943 ) ( not ( = ?auto_22946 ?auto_22947 ) ) ( HOIST-AT ?auto_22944 ?auto_22946 ) ( AVAILABLE ?auto_22944 ) ( SURFACE-AT ?auto_22943 ?auto_22946 ) ( ON ?auto_22943 ?auto_22945 ) ( CLEAR ?auto_22943 ) ( not ( = ?auto_22942 ?auto_22943 ) ) ( not ( = ?auto_22942 ?auto_22945 ) ) ( not ( = ?auto_22943 ?auto_22945 ) ) ( not ( = ?auto_22949 ?auto_22944 ) ) ( IS-CRATE ?auto_22942 ) ( not ( = ?auto_22950 ?auto_22947 ) ) ( HOIST-AT ?auto_22951 ?auto_22950 ) ( AVAILABLE ?auto_22951 ) ( SURFACE-AT ?auto_22942 ?auto_22950 ) ( ON ?auto_22942 ?auto_22952 ) ( CLEAR ?auto_22942 ) ( not ( = ?auto_22941 ?auto_22942 ) ) ( not ( = ?auto_22941 ?auto_22952 ) ) ( not ( = ?auto_22942 ?auto_22952 ) ) ( not ( = ?auto_22949 ?auto_22951 ) ) ( SURFACE-AT ?auto_22940 ?auto_22947 ) ( CLEAR ?auto_22940 ) ( IS-CRATE ?auto_22941 ) ( AVAILABLE ?auto_22949 ) ( not ( = ?auto_22954 ?auto_22947 ) ) ( HOIST-AT ?auto_22953 ?auto_22954 ) ( AVAILABLE ?auto_22953 ) ( SURFACE-AT ?auto_22941 ?auto_22954 ) ( ON ?auto_22941 ?auto_22955 ) ( CLEAR ?auto_22941 ) ( TRUCK-AT ?auto_22948 ?auto_22947 ) ( not ( = ?auto_22940 ?auto_22941 ) ) ( not ( = ?auto_22940 ?auto_22955 ) ) ( not ( = ?auto_22941 ?auto_22955 ) ) ( not ( = ?auto_22949 ?auto_22953 ) ) ( not ( = ?auto_22940 ?auto_22942 ) ) ( not ( = ?auto_22940 ?auto_22952 ) ) ( not ( = ?auto_22942 ?auto_22955 ) ) ( not ( = ?auto_22950 ?auto_22954 ) ) ( not ( = ?auto_22951 ?auto_22953 ) ) ( not ( = ?auto_22952 ?auto_22955 ) ) ( not ( = ?auto_22940 ?auto_22943 ) ) ( not ( = ?auto_22940 ?auto_22945 ) ) ( not ( = ?auto_22941 ?auto_22943 ) ) ( not ( = ?auto_22941 ?auto_22945 ) ) ( not ( = ?auto_22943 ?auto_22952 ) ) ( not ( = ?auto_22943 ?auto_22955 ) ) ( not ( = ?auto_22946 ?auto_22950 ) ) ( not ( = ?auto_22946 ?auto_22954 ) ) ( not ( = ?auto_22944 ?auto_22951 ) ) ( not ( = ?auto_22944 ?auto_22953 ) ) ( not ( = ?auto_22945 ?auto_22952 ) ) ( not ( = ?auto_22945 ?auto_22955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22940 ?auto_22941 ?auto_22942 )
      ( MAKE-1CRATE ?auto_22942 ?auto_22943 )
      ( MAKE-3CRATE-VERIFY ?auto_22940 ?auto_22941 ?auto_22942 ?auto_22943 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22971 - SURFACE
      ?auto_22972 - SURFACE
      ?auto_22973 - SURFACE
      ?auto_22974 - SURFACE
      ?auto_22975 - SURFACE
    )
    :vars
    (
      ?auto_22976 - HOIST
      ?auto_22978 - PLACE
      ?auto_22981 - PLACE
      ?auto_22980 - HOIST
      ?auto_22977 - SURFACE
      ?auto_22986 - PLACE
      ?auto_22989 - HOIST
      ?auto_22984 - SURFACE
      ?auto_22985 - PLACE
      ?auto_22988 - HOIST
      ?auto_22982 - SURFACE
      ?auto_22990 - PLACE
      ?auto_22987 - HOIST
      ?auto_22983 - SURFACE
      ?auto_22979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22976 ?auto_22978 ) ( IS-CRATE ?auto_22975 ) ( not ( = ?auto_22981 ?auto_22978 ) ) ( HOIST-AT ?auto_22980 ?auto_22981 ) ( AVAILABLE ?auto_22980 ) ( SURFACE-AT ?auto_22975 ?auto_22981 ) ( ON ?auto_22975 ?auto_22977 ) ( CLEAR ?auto_22975 ) ( not ( = ?auto_22974 ?auto_22975 ) ) ( not ( = ?auto_22974 ?auto_22977 ) ) ( not ( = ?auto_22975 ?auto_22977 ) ) ( not ( = ?auto_22976 ?auto_22980 ) ) ( IS-CRATE ?auto_22974 ) ( not ( = ?auto_22986 ?auto_22978 ) ) ( HOIST-AT ?auto_22989 ?auto_22986 ) ( AVAILABLE ?auto_22989 ) ( SURFACE-AT ?auto_22974 ?auto_22986 ) ( ON ?auto_22974 ?auto_22984 ) ( CLEAR ?auto_22974 ) ( not ( = ?auto_22973 ?auto_22974 ) ) ( not ( = ?auto_22973 ?auto_22984 ) ) ( not ( = ?auto_22974 ?auto_22984 ) ) ( not ( = ?auto_22976 ?auto_22989 ) ) ( IS-CRATE ?auto_22973 ) ( not ( = ?auto_22985 ?auto_22978 ) ) ( HOIST-AT ?auto_22988 ?auto_22985 ) ( AVAILABLE ?auto_22988 ) ( SURFACE-AT ?auto_22973 ?auto_22985 ) ( ON ?auto_22973 ?auto_22982 ) ( CLEAR ?auto_22973 ) ( not ( = ?auto_22972 ?auto_22973 ) ) ( not ( = ?auto_22972 ?auto_22982 ) ) ( not ( = ?auto_22973 ?auto_22982 ) ) ( not ( = ?auto_22976 ?auto_22988 ) ) ( SURFACE-AT ?auto_22971 ?auto_22978 ) ( CLEAR ?auto_22971 ) ( IS-CRATE ?auto_22972 ) ( AVAILABLE ?auto_22976 ) ( not ( = ?auto_22990 ?auto_22978 ) ) ( HOIST-AT ?auto_22987 ?auto_22990 ) ( AVAILABLE ?auto_22987 ) ( SURFACE-AT ?auto_22972 ?auto_22990 ) ( ON ?auto_22972 ?auto_22983 ) ( CLEAR ?auto_22972 ) ( TRUCK-AT ?auto_22979 ?auto_22978 ) ( not ( = ?auto_22971 ?auto_22972 ) ) ( not ( = ?auto_22971 ?auto_22983 ) ) ( not ( = ?auto_22972 ?auto_22983 ) ) ( not ( = ?auto_22976 ?auto_22987 ) ) ( not ( = ?auto_22971 ?auto_22973 ) ) ( not ( = ?auto_22971 ?auto_22982 ) ) ( not ( = ?auto_22973 ?auto_22983 ) ) ( not ( = ?auto_22985 ?auto_22990 ) ) ( not ( = ?auto_22988 ?auto_22987 ) ) ( not ( = ?auto_22982 ?auto_22983 ) ) ( not ( = ?auto_22971 ?auto_22974 ) ) ( not ( = ?auto_22971 ?auto_22984 ) ) ( not ( = ?auto_22972 ?auto_22974 ) ) ( not ( = ?auto_22972 ?auto_22984 ) ) ( not ( = ?auto_22974 ?auto_22982 ) ) ( not ( = ?auto_22974 ?auto_22983 ) ) ( not ( = ?auto_22986 ?auto_22985 ) ) ( not ( = ?auto_22986 ?auto_22990 ) ) ( not ( = ?auto_22989 ?auto_22988 ) ) ( not ( = ?auto_22989 ?auto_22987 ) ) ( not ( = ?auto_22984 ?auto_22982 ) ) ( not ( = ?auto_22984 ?auto_22983 ) ) ( not ( = ?auto_22971 ?auto_22975 ) ) ( not ( = ?auto_22971 ?auto_22977 ) ) ( not ( = ?auto_22972 ?auto_22975 ) ) ( not ( = ?auto_22972 ?auto_22977 ) ) ( not ( = ?auto_22973 ?auto_22975 ) ) ( not ( = ?auto_22973 ?auto_22977 ) ) ( not ( = ?auto_22975 ?auto_22984 ) ) ( not ( = ?auto_22975 ?auto_22982 ) ) ( not ( = ?auto_22975 ?auto_22983 ) ) ( not ( = ?auto_22981 ?auto_22986 ) ) ( not ( = ?auto_22981 ?auto_22985 ) ) ( not ( = ?auto_22981 ?auto_22990 ) ) ( not ( = ?auto_22980 ?auto_22989 ) ) ( not ( = ?auto_22980 ?auto_22988 ) ) ( not ( = ?auto_22980 ?auto_22987 ) ) ( not ( = ?auto_22977 ?auto_22984 ) ) ( not ( = ?auto_22977 ?auto_22982 ) ) ( not ( = ?auto_22977 ?auto_22983 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_22971 ?auto_22972 ?auto_22973 ?auto_22974 )
      ( MAKE-1CRATE ?auto_22974 ?auto_22975 )
      ( MAKE-4CRATE-VERIFY ?auto_22971 ?auto_22972 ?auto_22973 ?auto_22974 ?auto_22975 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23007 - SURFACE
      ?auto_23008 - SURFACE
      ?auto_23009 - SURFACE
      ?auto_23010 - SURFACE
      ?auto_23011 - SURFACE
      ?auto_23012 - SURFACE
    )
    :vars
    (
      ?auto_23016 - HOIST
      ?auto_23014 - PLACE
      ?auto_23018 - PLACE
      ?auto_23015 - HOIST
      ?auto_23017 - SURFACE
      ?auto_23021 - PLACE
      ?auto_23019 - HOIST
      ?auto_23022 - SURFACE
      ?auto_23024 - PLACE
      ?auto_23028 - HOIST
      ?auto_23025 - SURFACE
      ?auto_23020 - SURFACE
      ?auto_23026 - PLACE
      ?auto_23023 - HOIST
      ?auto_23027 - SURFACE
      ?auto_23013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23016 ?auto_23014 ) ( IS-CRATE ?auto_23012 ) ( not ( = ?auto_23018 ?auto_23014 ) ) ( HOIST-AT ?auto_23015 ?auto_23018 ) ( SURFACE-AT ?auto_23012 ?auto_23018 ) ( ON ?auto_23012 ?auto_23017 ) ( CLEAR ?auto_23012 ) ( not ( = ?auto_23011 ?auto_23012 ) ) ( not ( = ?auto_23011 ?auto_23017 ) ) ( not ( = ?auto_23012 ?auto_23017 ) ) ( not ( = ?auto_23016 ?auto_23015 ) ) ( IS-CRATE ?auto_23011 ) ( not ( = ?auto_23021 ?auto_23014 ) ) ( HOIST-AT ?auto_23019 ?auto_23021 ) ( AVAILABLE ?auto_23019 ) ( SURFACE-AT ?auto_23011 ?auto_23021 ) ( ON ?auto_23011 ?auto_23022 ) ( CLEAR ?auto_23011 ) ( not ( = ?auto_23010 ?auto_23011 ) ) ( not ( = ?auto_23010 ?auto_23022 ) ) ( not ( = ?auto_23011 ?auto_23022 ) ) ( not ( = ?auto_23016 ?auto_23019 ) ) ( IS-CRATE ?auto_23010 ) ( not ( = ?auto_23024 ?auto_23014 ) ) ( HOIST-AT ?auto_23028 ?auto_23024 ) ( AVAILABLE ?auto_23028 ) ( SURFACE-AT ?auto_23010 ?auto_23024 ) ( ON ?auto_23010 ?auto_23025 ) ( CLEAR ?auto_23010 ) ( not ( = ?auto_23009 ?auto_23010 ) ) ( not ( = ?auto_23009 ?auto_23025 ) ) ( not ( = ?auto_23010 ?auto_23025 ) ) ( not ( = ?auto_23016 ?auto_23028 ) ) ( IS-CRATE ?auto_23009 ) ( AVAILABLE ?auto_23015 ) ( SURFACE-AT ?auto_23009 ?auto_23018 ) ( ON ?auto_23009 ?auto_23020 ) ( CLEAR ?auto_23009 ) ( not ( = ?auto_23008 ?auto_23009 ) ) ( not ( = ?auto_23008 ?auto_23020 ) ) ( not ( = ?auto_23009 ?auto_23020 ) ) ( SURFACE-AT ?auto_23007 ?auto_23014 ) ( CLEAR ?auto_23007 ) ( IS-CRATE ?auto_23008 ) ( AVAILABLE ?auto_23016 ) ( not ( = ?auto_23026 ?auto_23014 ) ) ( HOIST-AT ?auto_23023 ?auto_23026 ) ( AVAILABLE ?auto_23023 ) ( SURFACE-AT ?auto_23008 ?auto_23026 ) ( ON ?auto_23008 ?auto_23027 ) ( CLEAR ?auto_23008 ) ( TRUCK-AT ?auto_23013 ?auto_23014 ) ( not ( = ?auto_23007 ?auto_23008 ) ) ( not ( = ?auto_23007 ?auto_23027 ) ) ( not ( = ?auto_23008 ?auto_23027 ) ) ( not ( = ?auto_23016 ?auto_23023 ) ) ( not ( = ?auto_23007 ?auto_23009 ) ) ( not ( = ?auto_23007 ?auto_23020 ) ) ( not ( = ?auto_23009 ?auto_23027 ) ) ( not ( = ?auto_23018 ?auto_23026 ) ) ( not ( = ?auto_23015 ?auto_23023 ) ) ( not ( = ?auto_23020 ?auto_23027 ) ) ( not ( = ?auto_23007 ?auto_23010 ) ) ( not ( = ?auto_23007 ?auto_23025 ) ) ( not ( = ?auto_23008 ?auto_23010 ) ) ( not ( = ?auto_23008 ?auto_23025 ) ) ( not ( = ?auto_23010 ?auto_23020 ) ) ( not ( = ?auto_23010 ?auto_23027 ) ) ( not ( = ?auto_23024 ?auto_23018 ) ) ( not ( = ?auto_23024 ?auto_23026 ) ) ( not ( = ?auto_23028 ?auto_23015 ) ) ( not ( = ?auto_23028 ?auto_23023 ) ) ( not ( = ?auto_23025 ?auto_23020 ) ) ( not ( = ?auto_23025 ?auto_23027 ) ) ( not ( = ?auto_23007 ?auto_23011 ) ) ( not ( = ?auto_23007 ?auto_23022 ) ) ( not ( = ?auto_23008 ?auto_23011 ) ) ( not ( = ?auto_23008 ?auto_23022 ) ) ( not ( = ?auto_23009 ?auto_23011 ) ) ( not ( = ?auto_23009 ?auto_23022 ) ) ( not ( = ?auto_23011 ?auto_23025 ) ) ( not ( = ?auto_23011 ?auto_23020 ) ) ( not ( = ?auto_23011 ?auto_23027 ) ) ( not ( = ?auto_23021 ?auto_23024 ) ) ( not ( = ?auto_23021 ?auto_23018 ) ) ( not ( = ?auto_23021 ?auto_23026 ) ) ( not ( = ?auto_23019 ?auto_23028 ) ) ( not ( = ?auto_23019 ?auto_23015 ) ) ( not ( = ?auto_23019 ?auto_23023 ) ) ( not ( = ?auto_23022 ?auto_23025 ) ) ( not ( = ?auto_23022 ?auto_23020 ) ) ( not ( = ?auto_23022 ?auto_23027 ) ) ( not ( = ?auto_23007 ?auto_23012 ) ) ( not ( = ?auto_23007 ?auto_23017 ) ) ( not ( = ?auto_23008 ?auto_23012 ) ) ( not ( = ?auto_23008 ?auto_23017 ) ) ( not ( = ?auto_23009 ?auto_23012 ) ) ( not ( = ?auto_23009 ?auto_23017 ) ) ( not ( = ?auto_23010 ?auto_23012 ) ) ( not ( = ?auto_23010 ?auto_23017 ) ) ( not ( = ?auto_23012 ?auto_23022 ) ) ( not ( = ?auto_23012 ?auto_23025 ) ) ( not ( = ?auto_23012 ?auto_23020 ) ) ( not ( = ?auto_23012 ?auto_23027 ) ) ( not ( = ?auto_23017 ?auto_23022 ) ) ( not ( = ?auto_23017 ?auto_23025 ) ) ( not ( = ?auto_23017 ?auto_23020 ) ) ( not ( = ?auto_23017 ?auto_23027 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_23007 ?auto_23008 ?auto_23009 ?auto_23010 ?auto_23011 )
      ( MAKE-1CRATE ?auto_23011 ?auto_23012 )
      ( MAKE-5CRATE-VERIFY ?auto_23007 ?auto_23008 ?auto_23009 ?auto_23010 ?auto_23011 ?auto_23012 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_23046 - SURFACE
      ?auto_23047 - SURFACE
      ?auto_23048 - SURFACE
      ?auto_23049 - SURFACE
      ?auto_23050 - SURFACE
      ?auto_23051 - SURFACE
      ?auto_23052 - SURFACE
    )
    :vars
    (
      ?auto_23055 - HOIST
      ?auto_23058 - PLACE
      ?auto_23054 - PLACE
      ?auto_23056 - HOIST
      ?auto_23053 - SURFACE
      ?auto_23068 - PLACE
      ?auto_23071 - HOIST
      ?auto_23059 - SURFACE
      ?auto_23069 - PLACE
      ?auto_23062 - HOIST
      ?auto_23060 - SURFACE
      ?auto_23066 - PLACE
      ?auto_23067 - HOIST
      ?auto_23064 - SURFACE
      ?auto_23070 - SURFACE
      ?auto_23065 - PLACE
      ?auto_23061 - HOIST
      ?auto_23063 - SURFACE
      ?auto_23057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23055 ?auto_23058 ) ( IS-CRATE ?auto_23052 ) ( not ( = ?auto_23054 ?auto_23058 ) ) ( HOIST-AT ?auto_23056 ?auto_23054 ) ( AVAILABLE ?auto_23056 ) ( SURFACE-AT ?auto_23052 ?auto_23054 ) ( ON ?auto_23052 ?auto_23053 ) ( CLEAR ?auto_23052 ) ( not ( = ?auto_23051 ?auto_23052 ) ) ( not ( = ?auto_23051 ?auto_23053 ) ) ( not ( = ?auto_23052 ?auto_23053 ) ) ( not ( = ?auto_23055 ?auto_23056 ) ) ( IS-CRATE ?auto_23051 ) ( not ( = ?auto_23068 ?auto_23058 ) ) ( HOIST-AT ?auto_23071 ?auto_23068 ) ( SURFACE-AT ?auto_23051 ?auto_23068 ) ( ON ?auto_23051 ?auto_23059 ) ( CLEAR ?auto_23051 ) ( not ( = ?auto_23050 ?auto_23051 ) ) ( not ( = ?auto_23050 ?auto_23059 ) ) ( not ( = ?auto_23051 ?auto_23059 ) ) ( not ( = ?auto_23055 ?auto_23071 ) ) ( IS-CRATE ?auto_23050 ) ( not ( = ?auto_23069 ?auto_23058 ) ) ( HOIST-AT ?auto_23062 ?auto_23069 ) ( AVAILABLE ?auto_23062 ) ( SURFACE-AT ?auto_23050 ?auto_23069 ) ( ON ?auto_23050 ?auto_23060 ) ( CLEAR ?auto_23050 ) ( not ( = ?auto_23049 ?auto_23050 ) ) ( not ( = ?auto_23049 ?auto_23060 ) ) ( not ( = ?auto_23050 ?auto_23060 ) ) ( not ( = ?auto_23055 ?auto_23062 ) ) ( IS-CRATE ?auto_23049 ) ( not ( = ?auto_23066 ?auto_23058 ) ) ( HOIST-AT ?auto_23067 ?auto_23066 ) ( AVAILABLE ?auto_23067 ) ( SURFACE-AT ?auto_23049 ?auto_23066 ) ( ON ?auto_23049 ?auto_23064 ) ( CLEAR ?auto_23049 ) ( not ( = ?auto_23048 ?auto_23049 ) ) ( not ( = ?auto_23048 ?auto_23064 ) ) ( not ( = ?auto_23049 ?auto_23064 ) ) ( not ( = ?auto_23055 ?auto_23067 ) ) ( IS-CRATE ?auto_23048 ) ( AVAILABLE ?auto_23071 ) ( SURFACE-AT ?auto_23048 ?auto_23068 ) ( ON ?auto_23048 ?auto_23070 ) ( CLEAR ?auto_23048 ) ( not ( = ?auto_23047 ?auto_23048 ) ) ( not ( = ?auto_23047 ?auto_23070 ) ) ( not ( = ?auto_23048 ?auto_23070 ) ) ( SURFACE-AT ?auto_23046 ?auto_23058 ) ( CLEAR ?auto_23046 ) ( IS-CRATE ?auto_23047 ) ( AVAILABLE ?auto_23055 ) ( not ( = ?auto_23065 ?auto_23058 ) ) ( HOIST-AT ?auto_23061 ?auto_23065 ) ( AVAILABLE ?auto_23061 ) ( SURFACE-AT ?auto_23047 ?auto_23065 ) ( ON ?auto_23047 ?auto_23063 ) ( CLEAR ?auto_23047 ) ( TRUCK-AT ?auto_23057 ?auto_23058 ) ( not ( = ?auto_23046 ?auto_23047 ) ) ( not ( = ?auto_23046 ?auto_23063 ) ) ( not ( = ?auto_23047 ?auto_23063 ) ) ( not ( = ?auto_23055 ?auto_23061 ) ) ( not ( = ?auto_23046 ?auto_23048 ) ) ( not ( = ?auto_23046 ?auto_23070 ) ) ( not ( = ?auto_23048 ?auto_23063 ) ) ( not ( = ?auto_23068 ?auto_23065 ) ) ( not ( = ?auto_23071 ?auto_23061 ) ) ( not ( = ?auto_23070 ?auto_23063 ) ) ( not ( = ?auto_23046 ?auto_23049 ) ) ( not ( = ?auto_23046 ?auto_23064 ) ) ( not ( = ?auto_23047 ?auto_23049 ) ) ( not ( = ?auto_23047 ?auto_23064 ) ) ( not ( = ?auto_23049 ?auto_23070 ) ) ( not ( = ?auto_23049 ?auto_23063 ) ) ( not ( = ?auto_23066 ?auto_23068 ) ) ( not ( = ?auto_23066 ?auto_23065 ) ) ( not ( = ?auto_23067 ?auto_23071 ) ) ( not ( = ?auto_23067 ?auto_23061 ) ) ( not ( = ?auto_23064 ?auto_23070 ) ) ( not ( = ?auto_23064 ?auto_23063 ) ) ( not ( = ?auto_23046 ?auto_23050 ) ) ( not ( = ?auto_23046 ?auto_23060 ) ) ( not ( = ?auto_23047 ?auto_23050 ) ) ( not ( = ?auto_23047 ?auto_23060 ) ) ( not ( = ?auto_23048 ?auto_23050 ) ) ( not ( = ?auto_23048 ?auto_23060 ) ) ( not ( = ?auto_23050 ?auto_23064 ) ) ( not ( = ?auto_23050 ?auto_23070 ) ) ( not ( = ?auto_23050 ?auto_23063 ) ) ( not ( = ?auto_23069 ?auto_23066 ) ) ( not ( = ?auto_23069 ?auto_23068 ) ) ( not ( = ?auto_23069 ?auto_23065 ) ) ( not ( = ?auto_23062 ?auto_23067 ) ) ( not ( = ?auto_23062 ?auto_23071 ) ) ( not ( = ?auto_23062 ?auto_23061 ) ) ( not ( = ?auto_23060 ?auto_23064 ) ) ( not ( = ?auto_23060 ?auto_23070 ) ) ( not ( = ?auto_23060 ?auto_23063 ) ) ( not ( = ?auto_23046 ?auto_23051 ) ) ( not ( = ?auto_23046 ?auto_23059 ) ) ( not ( = ?auto_23047 ?auto_23051 ) ) ( not ( = ?auto_23047 ?auto_23059 ) ) ( not ( = ?auto_23048 ?auto_23051 ) ) ( not ( = ?auto_23048 ?auto_23059 ) ) ( not ( = ?auto_23049 ?auto_23051 ) ) ( not ( = ?auto_23049 ?auto_23059 ) ) ( not ( = ?auto_23051 ?auto_23060 ) ) ( not ( = ?auto_23051 ?auto_23064 ) ) ( not ( = ?auto_23051 ?auto_23070 ) ) ( not ( = ?auto_23051 ?auto_23063 ) ) ( not ( = ?auto_23059 ?auto_23060 ) ) ( not ( = ?auto_23059 ?auto_23064 ) ) ( not ( = ?auto_23059 ?auto_23070 ) ) ( not ( = ?auto_23059 ?auto_23063 ) ) ( not ( = ?auto_23046 ?auto_23052 ) ) ( not ( = ?auto_23046 ?auto_23053 ) ) ( not ( = ?auto_23047 ?auto_23052 ) ) ( not ( = ?auto_23047 ?auto_23053 ) ) ( not ( = ?auto_23048 ?auto_23052 ) ) ( not ( = ?auto_23048 ?auto_23053 ) ) ( not ( = ?auto_23049 ?auto_23052 ) ) ( not ( = ?auto_23049 ?auto_23053 ) ) ( not ( = ?auto_23050 ?auto_23052 ) ) ( not ( = ?auto_23050 ?auto_23053 ) ) ( not ( = ?auto_23052 ?auto_23059 ) ) ( not ( = ?auto_23052 ?auto_23060 ) ) ( not ( = ?auto_23052 ?auto_23064 ) ) ( not ( = ?auto_23052 ?auto_23070 ) ) ( not ( = ?auto_23052 ?auto_23063 ) ) ( not ( = ?auto_23054 ?auto_23068 ) ) ( not ( = ?auto_23054 ?auto_23069 ) ) ( not ( = ?auto_23054 ?auto_23066 ) ) ( not ( = ?auto_23054 ?auto_23065 ) ) ( not ( = ?auto_23056 ?auto_23071 ) ) ( not ( = ?auto_23056 ?auto_23062 ) ) ( not ( = ?auto_23056 ?auto_23067 ) ) ( not ( = ?auto_23056 ?auto_23061 ) ) ( not ( = ?auto_23053 ?auto_23059 ) ) ( not ( = ?auto_23053 ?auto_23060 ) ) ( not ( = ?auto_23053 ?auto_23064 ) ) ( not ( = ?auto_23053 ?auto_23070 ) ) ( not ( = ?auto_23053 ?auto_23063 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_23046 ?auto_23047 ?auto_23048 ?auto_23049 ?auto_23050 ?auto_23051 )
      ( MAKE-1CRATE ?auto_23051 ?auto_23052 )
      ( MAKE-6CRATE-VERIFY ?auto_23046 ?auto_23047 ?auto_23048 ?auto_23049 ?auto_23050 ?auto_23051 ?auto_23052 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_23090 - SURFACE
      ?auto_23091 - SURFACE
      ?auto_23092 - SURFACE
      ?auto_23093 - SURFACE
      ?auto_23094 - SURFACE
      ?auto_23095 - SURFACE
      ?auto_23096 - SURFACE
      ?auto_23097 - SURFACE
    )
    :vars
    (
      ?auto_23099 - HOIST
      ?auto_23101 - PLACE
      ?auto_23098 - PLACE
      ?auto_23103 - HOIST
      ?auto_23100 - SURFACE
      ?auto_23113 - PLACE
      ?auto_23110 - HOIST
      ?auto_23108 - SURFACE
      ?auto_23116 - PLACE
      ?auto_23118 - HOIST
      ?auto_23114 - SURFACE
      ?auto_23119 - PLACE
      ?auto_23111 - HOIST
      ?auto_23109 - SURFACE
      ?auto_23104 - PLACE
      ?auto_23112 - HOIST
      ?auto_23106 - SURFACE
      ?auto_23117 - SURFACE
      ?auto_23105 - PLACE
      ?auto_23115 - HOIST
      ?auto_23107 - SURFACE
      ?auto_23102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23099 ?auto_23101 ) ( IS-CRATE ?auto_23097 ) ( not ( = ?auto_23098 ?auto_23101 ) ) ( HOIST-AT ?auto_23103 ?auto_23098 ) ( AVAILABLE ?auto_23103 ) ( SURFACE-AT ?auto_23097 ?auto_23098 ) ( ON ?auto_23097 ?auto_23100 ) ( CLEAR ?auto_23097 ) ( not ( = ?auto_23096 ?auto_23097 ) ) ( not ( = ?auto_23096 ?auto_23100 ) ) ( not ( = ?auto_23097 ?auto_23100 ) ) ( not ( = ?auto_23099 ?auto_23103 ) ) ( IS-CRATE ?auto_23096 ) ( not ( = ?auto_23113 ?auto_23101 ) ) ( HOIST-AT ?auto_23110 ?auto_23113 ) ( AVAILABLE ?auto_23110 ) ( SURFACE-AT ?auto_23096 ?auto_23113 ) ( ON ?auto_23096 ?auto_23108 ) ( CLEAR ?auto_23096 ) ( not ( = ?auto_23095 ?auto_23096 ) ) ( not ( = ?auto_23095 ?auto_23108 ) ) ( not ( = ?auto_23096 ?auto_23108 ) ) ( not ( = ?auto_23099 ?auto_23110 ) ) ( IS-CRATE ?auto_23095 ) ( not ( = ?auto_23116 ?auto_23101 ) ) ( HOIST-AT ?auto_23118 ?auto_23116 ) ( SURFACE-AT ?auto_23095 ?auto_23116 ) ( ON ?auto_23095 ?auto_23114 ) ( CLEAR ?auto_23095 ) ( not ( = ?auto_23094 ?auto_23095 ) ) ( not ( = ?auto_23094 ?auto_23114 ) ) ( not ( = ?auto_23095 ?auto_23114 ) ) ( not ( = ?auto_23099 ?auto_23118 ) ) ( IS-CRATE ?auto_23094 ) ( not ( = ?auto_23119 ?auto_23101 ) ) ( HOIST-AT ?auto_23111 ?auto_23119 ) ( AVAILABLE ?auto_23111 ) ( SURFACE-AT ?auto_23094 ?auto_23119 ) ( ON ?auto_23094 ?auto_23109 ) ( CLEAR ?auto_23094 ) ( not ( = ?auto_23093 ?auto_23094 ) ) ( not ( = ?auto_23093 ?auto_23109 ) ) ( not ( = ?auto_23094 ?auto_23109 ) ) ( not ( = ?auto_23099 ?auto_23111 ) ) ( IS-CRATE ?auto_23093 ) ( not ( = ?auto_23104 ?auto_23101 ) ) ( HOIST-AT ?auto_23112 ?auto_23104 ) ( AVAILABLE ?auto_23112 ) ( SURFACE-AT ?auto_23093 ?auto_23104 ) ( ON ?auto_23093 ?auto_23106 ) ( CLEAR ?auto_23093 ) ( not ( = ?auto_23092 ?auto_23093 ) ) ( not ( = ?auto_23092 ?auto_23106 ) ) ( not ( = ?auto_23093 ?auto_23106 ) ) ( not ( = ?auto_23099 ?auto_23112 ) ) ( IS-CRATE ?auto_23092 ) ( AVAILABLE ?auto_23118 ) ( SURFACE-AT ?auto_23092 ?auto_23116 ) ( ON ?auto_23092 ?auto_23117 ) ( CLEAR ?auto_23092 ) ( not ( = ?auto_23091 ?auto_23092 ) ) ( not ( = ?auto_23091 ?auto_23117 ) ) ( not ( = ?auto_23092 ?auto_23117 ) ) ( SURFACE-AT ?auto_23090 ?auto_23101 ) ( CLEAR ?auto_23090 ) ( IS-CRATE ?auto_23091 ) ( AVAILABLE ?auto_23099 ) ( not ( = ?auto_23105 ?auto_23101 ) ) ( HOIST-AT ?auto_23115 ?auto_23105 ) ( AVAILABLE ?auto_23115 ) ( SURFACE-AT ?auto_23091 ?auto_23105 ) ( ON ?auto_23091 ?auto_23107 ) ( CLEAR ?auto_23091 ) ( TRUCK-AT ?auto_23102 ?auto_23101 ) ( not ( = ?auto_23090 ?auto_23091 ) ) ( not ( = ?auto_23090 ?auto_23107 ) ) ( not ( = ?auto_23091 ?auto_23107 ) ) ( not ( = ?auto_23099 ?auto_23115 ) ) ( not ( = ?auto_23090 ?auto_23092 ) ) ( not ( = ?auto_23090 ?auto_23117 ) ) ( not ( = ?auto_23092 ?auto_23107 ) ) ( not ( = ?auto_23116 ?auto_23105 ) ) ( not ( = ?auto_23118 ?auto_23115 ) ) ( not ( = ?auto_23117 ?auto_23107 ) ) ( not ( = ?auto_23090 ?auto_23093 ) ) ( not ( = ?auto_23090 ?auto_23106 ) ) ( not ( = ?auto_23091 ?auto_23093 ) ) ( not ( = ?auto_23091 ?auto_23106 ) ) ( not ( = ?auto_23093 ?auto_23117 ) ) ( not ( = ?auto_23093 ?auto_23107 ) ) ( not ( = ?auto_23104 ?auto_23116 ) ) ( not ( = ?auto_23104 ?auto_23105 ) ) ( not ( = ?auto_23112 ?auto_23118 ) ) ( not ( = ?auto_23112 ?auto_23115 ) ) ( not ( = ?auto_23106 ?auto_23117 ) ) ( not ( = ?auto_23106 ?auto_23107 ) ) ( not ( = ?auto_23090 ?auto_23094 ) ) ( not ( = ?auto_23090 ?auto_23109 ) ) ( not ( = ?auto_23091 ?auto_23094 ) ) ( not ( = ?auto_23091 ?auto_23109 ) ) ( not ( = ?auto_23092 ?auto_23094 ) ) ( not ( = ?auto_23092 ?auto_23109 ) ) ( not ( = ?auto_23094 ?auto_23106 ) ) ( not ( = ?auto_23094 ?auto_23117 ) ) ( not ( = ?auto_23094 ?auto_23107 ) ) ( not ( = ?auto_23119 ?auto_23104 ) ) ( not ( = ?auto_23119 ?auto_23116 ) ) ( not ( = ?auto_23119 ?auto_23105 ) ) ( not ( = ?auto_23111 ?auto_23112 ) ) ( not ( = ?auto_23111 ?auto_23118 ) ) ( not ( = ?auto_23111 ?auto_23115 ) ) ( not ( = ?auto_23109 ?auto_23106 ) ) ( not ( = ?auto_23109 ?auto_23117 ) ) ( not ( = ?auto_23109 ?auto_23107 ) ) ( not ( = ?auto_23090 ?auto_23095 ) ) ( not ( = ?auto_23090 ?auto_23114 ) ) ( not ( = ?auto_23091 ?auto_23095 ) ) ( not ( = ?auto_23091 ?auto_23114 ) ) ( not ( = ?auto_23092 ?auto_23095 ) ) ( not ( = ?auto_23092 ?auto_23114 ) ) ( not ( = ?auto_23093 ?auto_23095 ) ) ( not ( = ?auto_23093 ?auto_23114 ) ) ( not ( = ?auto_23095 ?auto_23109 ) ) ( not ( = ?auto_23095 ?auto_23106 ) ) ( not ( = ?auto_23095 ?auto_23117 ) ) ( not ( = ?auto_23095 ?auto_23107 ) ) ( not ( = ?auto_23114 ?auto_23109 ) ) ( not ( = ?auto_23114 ?auto_23106 ) ) ( not ( = ?auto_23114 ?auto_23117 ) ) ( not ( = ?auto_23114 ?auto_23107 ) ) ( not ( = ?auto_23090 ?auto_23096 ) ) ( not ( = ?auto_23090 ?auto_23108 ) ) ( not ( = ?auto_23091 ?auto_23096 ) ) ( not ( = ?auto_23091 ?auto_23108 ) ) ( not ( = ?auto_23092 ?auto_23096 ) ) ( not ( = ?auto_23092 ?auto_23108 ) ) ( not ( = ?auto_23093 ?auto_23096 ) ) ( not ( = ?auto_23093 ?auto_23108 ) ) ( not ( = ?auto_23094 ?auto_23096 ) ) ( not ( = ?auto_23094 ?auto_23108 ) ) ( not ( = ?auto_23096 ?auto_23114 ) ) ( not ( = ?auto_23096 ?auto_23109 ) ) ( not ( = ?auto_23096 ?auto_23106 ) ) ( not ( = ?auto_23096 ?auto_23117 ) ) ( not ( = ?auto_23096 ?auto_23107 ) ) ( not ( = ?auto_23113 ?auto_23116 ) ) ( not ( = ?auto_23113 ?auto_23119 ) ) ( not ( = ?auto_23113 ?auto_23104 ) ) ( not ( = ?auto_23113 ?auto_23105 ) ) ( not ( = ?auto_23110 ?auto_23118 ) ) ( not ( = ?auto_23110 ?auto_23111 ) ) ( not ( = ?auto_23110 ?auto_23112 ) ) ( not ( = ?auto_23110 ?auto_23115 ) ) ( not ( = ?auto_23108 ?auto_23114 ) ) ( not ( = ?auto_23108 ?auto_23109 ) ) ( not ( = ?auto_23108 ?auto_23106 ) ) ( not ( = ?auto_23108 ?auto_23117 ) ) ( not ( = ?auto_23108 ?auto_23107 ) ) ( not ( = ?auto_23090 ?auto_23097 ) ) ( not ( = ?auto_23090 ?auto_23100 ) ) ( not ( = ?auto_23091 ?auto_23097 ) ) ( not ( = ?auto_23091 ?auto_23100 ) ) ( not ( = ?auto_23092 ?auto_23097 ) ) ( not ( = ?auto_23092 ?auto_23100 ) ) ( not ( = ?auto_23093 ?auto_23097 ) ) ( not ( = ?auto_23093 ?auto_23100 ) ) ( not ( = ?auto_23094 ?auto_23097 ) ) ( not ( = ?auto_23094 ?auto_23100 ) ) ( not ( = ?auto_23095 ?auto_23097 ) ) ( not ( = ?auto_23095 ?auto_23100 ) ) ( not ( = ?auto_23097 ?auto_23108 ) ) ( not ( = ?auto_23097 ?auto_23114 ) ) ( not ( = ?auto_23097 ?auto_23109 ) ) ( not ( = ?auto_23097 ?auto_23106 ) ) ( not ( = ?auto_23097 ?auto_23117 ) ) ( not ( = ?auto_23097 ?auto_23107 ) ) ( not ( = ?auto_23098 ?auto_23113 ) ) ( not ( = ?auto_23098 ?auto_23116 ) ) ( not ( = ?auto_23098 ?auto_23119 ) ) ( not ( = ?auto_23098 ?auto_23104 ) ) ( not ( = ?auto_23098 ?auto_23105 ) ) ( not ( = ?auto_23103 ?auto_23110 ) ) ( not ( = ?auto_23103 ?auto_23118 ) ) ( not ( = ?auto_23103 ?auto_23111 ) ) ( not ( = ?auto_23103 ?auto_23112 ) ) ( not ( = ?auto_23103 ?auto_23115 ) ) ( not ( = ?auto_23100 ?auto_23108 ) ) ( not ( = ?auto_23100 ?auto_23114 ) ) ( not ( = ?auto_23100 ?auto_23109 ) ) ( not ( = ?auto_23100 ?auto_23106 ) ) ( not ( = ?auto_23100 ?auto_23117 ) ) ( not ( = ?auto_23100 ?auto_23107 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_23090 ?auto_23091 ?auto_23092 ?auto_23093 ?auto_23094 ?auto_23095 ?auto_23096 )
      ( MAKE-1CRATE ?auto_23096 ?auto_23097 )
      ( MAKE-7CRATE-VERIFY ?auto_23090 ?auto_23091 ?auto_23092 ?auto_23093 ?auto_23094 ?auto_23095 ?auto_23096 ?auto_23097 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_23139 - SURFACE
      ?auto_23140 - SURFACE
      ?auto_23141 - SURFACE
      ?auto_23142 - SURFACE
      ?auto_23143 - SURFACE
      ?auto_23144 - SURFACE
      ?auto_23145 - SURFACE
      ?auto_23146 - SURFACE
      ?auto_23147 - SURFACE
    )
    :vars
    (
      ?auto_23150 - HOIST
      ?auto_23153 - PLACE
      ?auto_23148 - PLACE
      ?auto_23152 - HOIST
      ?auto_23149 - SURFACE
      ?auto_23172 - PLACE
      ?auto_23167 - HOIST
      ?auto_23154 - SURFACE
      ?auto_23157 - PLACE
      ?auto_23162 - HOIST
      ?auto_23164 - SURFACE
      ?auto_23159 - PLACE
      ?auto_23166 - HOIST
      ?auto_23156 - SURFACE
      ?auto_23171 - PLACE
      ?auto_23161 - HOIST
      ?auto_23163 - SURFACE
      ?auto_23170 - PLACE
      ?auto_23155 - HOIST
      ?auto_23168 - SURFACE
      ?auto_23160 - SURFACE
      ?auto_23169 - PLACE
      ?auto_23158 - HOIST
      ?auto_23165 - SURFACE
      ?auto_23151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23150 ?auto_23153 ) ( IS-CRATE ?auto_23147 ) ( not ( = ?auto_23148 ?auto_23153 ) ) ( HOIST-AT ?auto_23152 ?auto_23148 ) ( AVAILABLE ?auto_23152 ) ( SURFACE-AT ?auto_23147 ?auto_23148 ) ( ON ?auto_23147 ?auto_23149 ) ( CLEAR ?auto_23147 ) ( not ( = ?auto_23146 ?auto_23147 ) ) ( not ( = ?auto_23146 ?auto_23149 ) ) ( not ( = ?auto_23147 ?auto_23149 ) ) ( not ( = ?auto_23150 ?auto_23152 ) ) ( IS-CRATE ?auto_23146 ) ( not ( = ?auto_23172 ?auto_23153 ) ) ( HOIST-AT ?auto_23167 ?auto_23172 ) ( AVAILABLE ?auto_23167 ) ( SURFACE-AT ?auto_23146 ?auto_23172 ) ( ON ?auto_23146 ?auto_23154 ) ( CLEAR ?auto_23146 ) ( not ( = ?auto_23145 ?auto_23146 ) ) ( not ( = ?auto_23145 ?auto_23154 ) ) ( not ( = ?auto_23146 ?auto_23154 ) ) ( not ( = ?auto_23150 ?auto_23167 ) ) ( IS-CRATE ?auto_23145 ) ( not ( = ?auto_23157 ?auto_23153 ) ) ( HOIST-AT ?auto_23162 ?auto_23157 ) ( AVAILABLE ?auto_23162 ) ( SURFACE-AT ?auto_23145 ?auto_23157 ) ( ON ?auto_23145 ?auto_23164 ) ( CLEAR ?auto_23145 ) ( not ( = ?auto_23144 ?auto_23145 ) ) ( not ( = ?auto_23144 ?auto_23164 ) ) ( not ( = ?auto_23145 ?auto_23164 ) ) ( not ( = ?auto_23150 ?auto_23162 ) ) ( IS-CRATE ?auto_23144 ) ( not ( = ?auto_23159 ?auto_23153 ) ) ( HOIST-AT ?auto_23166 ?auto_23159 ) ( SURFACE-AT ?auto_23144 ?auto_23159 ) ( ON ?auto_23144 ?auto_23156 ) ( CLEAR ?auto_23144 ) ( not ( = ?auto_23143 ?auto_23144 ) ) ( not ( = ?auto_23143 ?auto_23156 ) ) ( not ( = ?auto_23144 ?auto_23156 ) ) ( not ( = ?auto_23150 ?auto_23166 ) ) ( IS-CRATE ?auto_23143 ) ( not ( = ?auto_23171 ?auto_23153 ) ) ( HOIST-AT ?auto_23161 ?auto_23171 ) ( AVAILABLE ?auto_23161 ) ( SURFACE-AT ?auto_23143 ?auto_23171 ) ( ON ?auto_23143 ?auto_23163 ) ( CLEAR ?auto_23143 ) ( not ( = ?auto_23142 ?auto_23143 ) ) ( not ( = ?auto_23142 ?auto_23163 ) ) ( not ( = ?auto_23143 ?auto_23163 ) ) ( not ( = ?auto_23150 ?auto_23161 ) ) ( IS-CRATE ?auto_23142 ) ( not ( = ?auto_23170 ?auto_23153 ) ) ( HOIST-AT ?auto_23155 ?auto_23170 ) ( AVAILABLE ?auto_23155 ) ( SURFACE-AT ?auto_23142 ?auto_23170 ) ( ON ?auto_23142 ?auto_23168 ) ( CLEAR ?auto_23142 ) ( not ( = ?auto_23141 ?auto_23142 ) ) ( not ( = ?auto_23141 ?auto_23168 ) ) ( not ( = ?auto_23142 ?auto_23168 ) ) ( not ( = ?auto_23150 ?auto_23155 ) ) ( IS-CRATE ?auto_23141 ) ( AVAILABLE ?auto_23166 ) ( SURFACE-AT ?auto_23141 ?auto_23159 ) ( ON ?auto_23141 ?auto_23160 ) ( CLEAR ?auto_23141 ) ( not ( = ?auto_23140 ?auto_23141 ) ) ( not ( = ?auto_23140 ?auto_23160 ) ) ( not ( = ?auto_23141 ?auto_23160 ) ) ( SURFACE-AT ?auto_23139 ?auto_23153 ) ( CLEAR ?auto_23139 ) ( IS-CRATE ?auto_23140 ) ( AVAILABLE ?auto_23150 ) ( not ( = ?auto_23169 ?auto_23153 ) ) ( HOIST-AT ?auto_23158 ?auto_23169 ) ( AVAILABLE ?auto_23158 ) ( SURFACE-AT ?auto_23140 ?auto_23169 ) ( ON ?auto_23140 ?auto_23165 ) ( CLEAR ?auto_23140 ) ( TRUCK-AT ?auto_23151 ?auto_23153 ) ( not ( = ?auto_23139 ?auto_23140 ) ) ( not ( = ?auto_23139 ?auto_23165 ) ) ( not ( = ?auto_23140 ?auto_23165 ) ) ( not ( = ?auto_23150 ?auto_23158 ) ) ( not ( = ?auto_23139 ?auto_23141 ) ) ( not ( = ?auto_23139 ?auto_23160 ) ) ( not ( = ?auto_23141 ?auto_23165 ) ) ( not ( = ?auto_23159 ?auto_23169 ) ) ( not ( = ?auto_23166 ?auto_23158 ) ) ( not ( = ?auto_23160 ?auto_23165 ) ) ( not ( = ?auto_23139 ?auto_23142 ) ) ( not ( = ?auto_23139 ?auto_23168 ) ) ( not ( = ?auto_23140 ?auto_23142 ) ) ( not ( = ?auto_23140 ?auto_23168 ) ) ( not ( = ?auto_23142 ?auto_23160 ) ) ( not ( = ?auto_23142 ?auto_23165 ) ) ( not ( = ?auto_23170 ?auto_23159 ) ) ( not ( = ?auto_23170 ?auto_23169 ) ) ( not ( = ?auto_23155 ?auto_23166 ) ) ( not ( = ?auto_23155 ?auto_23158 ) ) ( not ( = ?auto_23168 ?auto_23160 ) ) ( not ( = ?auto_23168 ?auto_23165 ) ) ( not ( = ?auto_23139 ?auto_23143 ) ) ( not ( = ?auto_23139 ?auto_23163 ) ) ( not ( = ?auto_23140 ?auto_23143 ) ) ( not ( = ?auto_23140 ?auto_23163 ) ) ( not ( = ?auto_23141 ?auto_23143 ) ) ( not ( = ?auto_23141 ?auto_23163 ) ) ( not ( = ?auto_23143 ?auto_23168 ) ) ( not ( = ?auto_23143 ?auto_23160 ) ) ( not ( = ?auto_23143 ?auto_23165 ) ) ( not ( = ?auto_23171 ?auto_23170 ) ) ( not ( = ?auto_23171 ?auto_23159 ) ) ( not ( = ?auto_23171 ?auto_23169 ) ) ( not ( = ?auto_23161 ?auto_23155 ) ) ( not ( = ?auto_23161 ?auto_23166 ) ) ( not ( = ?auto_23161 ?auto_23158 ) ) ( not ( = ?auto_23163 ?auto_23168 ) ) ( not ( = ?auto_23163 ?auto_23160 ) ) ( not ( = ?auto_23163 ?auto_23165 ) ) ( not ( = ?auto_23139 ?auto_23144 ) ) ( not ( = ?auto_23139 ?auto_23156 ) ) ( not ( = ?auto_23140 ?auto_23144 ) ) ( not ( = ?auto_23140 ?auto_23156 ) ) ( not ( = ?auto_23141 ?auto_23144 ) ) ( not ( = ?auto_23141 ?auto_23156 ) ) ( not ( = ?auto_23142 ?auto_23144 ) ) ( not ( = ?auto_23142 ?auto_23156 ) ) ( not ( = ?auto_23144 ?auto_23163 ) ) ( not ( = ?auto_23144 ?auto_23168 ) ) ( not ( = ?auto_23144 ?auto_23160 ) ) ( not ( = ?auto_23144 ?auto_23165 ) ) ( not ( = ?auto_23156 ?auto_23163 ) ) ( not ( = ?auto_23156 ?auto_23168 ) ) ( not ( = ?auto_23156 ?auto_23160 ) ) ( not ( = ?auto_23156 ?auto_23165 ) ) ( not ( = ?auto_23139 ?auto_23145 ) ) ( not ( = ?auto_23139 ?auto_23164 ) ) ( not ( = ?auto_23140 ?auto_23145 ) ) ( not ( = ?auto_23140 ?auto_23164 ) ) ( not ( = ?auto_23141 ?auto_23145 ) ) ( not ( = ?auto_23141 ?auto_23164 ) ) ( not ( = ?auto_23142 ?auto_23145 ) ) ( not ( = ?auto_23142 ?auto_23164 ) ) ( not ( = ?auto_23143 ?auto_23145 ) ) ( not ( = ?auto_23143 ?auto_23164 ) ) ( not ( = ?auto_23145 ?auto_23156 ) ) ( not ( = ?auto_23145 ?auto_23163 ) ) ( not ( = ?auto_23145 ?auto_23168 ) ) ( not ( = ?auto_23145 ?auto_23160 ) ) ( not ( = ?auto_23145 ?auto_23165 ) ) ( not ( = ?auto_23157 ?auto_23159 ) ) ( not ( = ?auto_23157 ?auto_23171 ) ) ( not ( = ?auto_23157 ?auto_23170 ) ) ( not ( = ?auto_23157 ?auto_23169 ) ) ( not ( = ?auto_23162 ?auto_23166 ) ) ( not ( = ?auto_23162 ?auto_23161 ) ) ( not ( = ?auto_23162 ?auto_23155 ) ) ( not ( = ?auto_23162 ?auto_23158 ) ) ( not ( = ?auto_23164 ?auto_23156 ) ) ( not ( = ?auto_23164 ?auto_23163 ) ) ( not ( = ?auto_23164 ?auto_23168 ) ) ( not ( = ?auto_23164 ?auto_23160 ) ) ( not ( = ?auto_23164 ?auto_23165 ) ) ( not ( = ?auto_23139 ?auto_23146 ) ) ( not ( = ?auto_23139 ?auto_23154 ) ) ( not ( = ?auto_23140 ?auto_23146 ) ) ( not ( = ?auto_23140 ?auto_23154 ) ) ( not ( = ?auto_23141 ?auto_23146 ) ) ( not ( = ?auto_23141 ?auto_23154 ) ) ( not ( = ?auto_23142 ?auto_23146 ) ) ( not ( = ?auto_23142 ?auto_23154 ) ) ( not ( = ?auto_23143 ?auto_23146 ) ) ( not ( = ?auto_23143 ?auto_23154 ) ) ( not ( = ?auto_23144 ?auto_23146 ) ) ( not ( = ?auto_23144 ?auto_23154 ) ) ( not ( = ?auto_23146 ?auto_23164 ) ) ( not ( = ?auto_23146 ?auto_23156 ) ) ( not ( = ?auto_23146 ?auto_23163 ) ) ( not ( = ?auto_23146 ?auto_23168 ) ) ( not ( = ?auto_23146 ?auto_23160 ) ) ( not ( = ?auto_23146 ?auto_23165 ) ) ( not ( = ?auto_23172 ?auto_23157 ) ) ( not ( = ?auto_23172 ?auto_23159 ) ) ( not ( = ?auto_23172 ?auto_23171 ) ) ( not ( = ?auto_23172 ?auto_23170 ) ) ( not ( = ?auto_23172 ?auto_23169 ) ) ( not ( = ?auto_23167 ?auto_23162 ) ) ( not ( = ?auto_23167 ?auto_23166 ) ) ( not ( = ?auto_23167 ?auto_23161 ) ) ( not ( = ?auto_23167 ?auto_23155 ) ) ( not ( = ?auto_23167 ?auto_23158 ) ) ( not ( = ?auto_23154 ?auto_23164 ) ) ( not ( = ?auto_23154 ?auto_23156 ) ) ( not ( = ?auto_23154 ?auto_23163 ) ) ( not ( = ?auto_23154 ?auto_23168 ) ) ( not ( = ?auto_23154 ?auto_23160 ) ) ( not ( = ?auto_23154 ?auto_23165 ) ) ( not ( = ?auto_23139 ?auto_23147 ) ) ( not ( = ?auto_23139 ?auto_23149 ) ) ( not ( = ?auto_23140 ?auto_23147 ) ) ( not ( = ?auto_23140 ?auto_23149 ) ) ( not ( = ?auto_23141 ?auto_23147 ) ) ( not ( = ?auto_23141 ?auto_23149 ) ) ( not ( = ?auto_23142 ?auto_23147 ) ) ( not ( = ?auto_23142 ?auto_23149 ) ) ( not ( = ?auto_23143 ?auto_23147 ) ) ( not ( = ?auto_23143 ?auto_23149 ) ) ( not ( = ?auto_23144 ?auto_23147 ) ) ( not ( = ?auto_23144 ?auto_23149 ) ) ( not ( = ?auto_23145 ?auto_23147 ) ) ( not ( = ?auto_23145 ?auto_23149 ) ) ( not ( = ?auto_23147 ?auto_23154 ) ) ( not ( = ?auto_23147 ?auto_23164 ) ) ( not ( = ?auto_23147 ?auto_23156 ) ) ( not ( = ?auto_23147 ?auto_23163 ) ) ( not ( = ?auto_23147 ?auto_23168 ) ) ( not ( = ?auto_23147 ?auto_23160 ) ) ( not ( = ?auto_23147 ?auto_23165 ) ) ( not ( = ?auto_23148 ?auto_23172 ) ) ( not ( = ?auto_23148 ?auto_23157 ) ) ( not ( = ?auto_23148 ?auto_23159 ) ) ( not ( = ?auto_23148 ?auto_23171 ) ) ( not ( = ?auto_23148 ?auto_23170 ) ) ( not ( = ?auto_23148 ?auto_23169 ) ) ( not ( = ?auto_23152 ?auto_23167 ) ) ( not ( = ?auto_23152 ?auto_23162 ) ) ( not ( = ?auto_23152 ?auto_23166 ) ) ( not ( = ?auto_23152 ?auto_23161 ) ) ( not ( = ?auto_23152 ?auto_23155 ) ) ( not ( = ?auto_23152 ?auto_23158 ) ) ( not ( = ?auto_23149 ?auto_23154 ) ) ( not ( = ?auto_23149 ?auto_23164 ) ) ( not ( = ?auto_23149 ?auto_23156 ) ) ( not ( = ?auto_23149 ?auto_23163 ) ) ( not ( = ?auto_23149 ?auto_23168 ) ) ( not ( = ?auto_23149 ?auto_23160 ) ) ( not ( = ?auto_23149 ?auto_23165 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_23139 ?auto_23140 ?auto_23141 ?auto_23142 ?auto_23143 ?auto_23144 ?auto_23145 ?auto_23146 )
      ( MAKE-1CRATE ?auto_23146 ?auto_23147 )
      ( MAKE-8CRATE-VERIFY ?auto_23139 ?auto_23140 ?auto_23141 ?auto_23142 ?auto_23143 ?auto_23144 ?auto_23145 ?auto_23146 ?auto_23147 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_23193 - SURFACE
      ?auto_23194 - SURFACE
      ?auto_23195 - SURFACE
      ?auto_23196 - SURFACE
      ?auto_23197 - SURFACE
      ?auto_23198 - SURFACE
      ?auto_23199 - SURFACE
      ?auto_23200 - SURFACE
      ?auto_23201 - SURFACE
      ?auto_23202 - SURFACE
    )
    :vars
    (
      ?auto_23204 - HOIST
      ?auto_23203 - PLACE
      ?auto_23208 - PLACE
      ?auto_23205 - HOIST
      ?auto_23207 - SURFACE
      ?auto_23210 - PLACE
      ?auto_23223 - HOIST
      ?auto_23230 - SURFACE
      ?auto_23209 - PLACE
      ?auto_23217 - HOIST
      ?auto_23225 - SURFACE
      ?auto_23224 - PLACE
      ?auto_23227 - HOIST
      ?auto_23218 - SURFACE
      ?auto_23214 - PLACE
      ?auto_23220 - HOIST
      ?auto_23221 - SURFACE
      ?auto_23211 - PLACE
      ?auto_23229 - HOIST
      ?auto_23228 - SURFACE
      ?auto_23212 - PLACE
      ?auto_23222 - HOIST
      ?auto_23216 - SURFACE
      ?auto_23213 - SURFACE
      ?auto_23226 - PLACE
      ?auto_23219 - HOIST
      ?auto_23215 - SURFACE
      ?auto_23206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23204 ?auto_23203 ) ( IS-CRATE ?auto_23202 ) ( not ( = ?auto_23208 ?auto_23203 ) ) ( HOIST-AT ?auto_23205 ?auto_23208 ) ( AVAILABLE ?auto_23205 ) ( SURFACE-AT ?auto_23202 ?auto_23208 ) ( ON ?auto_23202 ?auto_23207 ) ( CLEAR ?auto_23202 ) ( not ( = ?auto_23201 ?auto_23202 ) ) ( not ( = ?auto_23201 ?auto_23207 ) ) ( not ( = ?auto_23202 ?auto_23207 ) ) ( not ( = ?auto_23204 ?auto_23205 ) ) ( IS-CRATE ?auto_23201 ) ( not ( = ?auto_23210 ?auto_23203 ) ) ( HOIST-AT ?auto_23223 ?auto_23210 ) ( AVAILABLE ?auto_23223 ) ( SURFACE-AT ?auto_23201 ?auto_23210 ) ( ON ?auto_23201 ?auto_23230 ) ( CLEAR ?auto_23201 ) ( not ( = ?auto_23200 ?auto_23201 ) ) ( not ( = ?auto_23200 ?auto_23230 ) ) ( not ( = ?auto_23201 ?auto_23230 ) ) ( not ( = ?auto_23204 ?auto_23223 ) ) ( IS-CRATE ?auto_23200 ) ( not ( = ?auto_23209 ?auto_23203 ) ) ( HOIST-AT ?auto_23217 ?auto_23209 ) ( AVAILABLE ?auto_23217 ) ( SURFACE-AT ?auto_23200 ?auto_23209 ) ( ON ?auto_23200 ?auto_23225 ) ( CLEAR ?auto_23200 ) ( not ( = ?auto_23199 ?auto_23200 ) ) ( not ( = ?auto_23199 ?auto_23225 ) ) ( not ( = ?auto_23200 ?auto_23225 ) ) ( not ( = ?auto_23204 ?auto_23217 ) ) ( IS-CRATE ?auto_23199 ) ( not ( = ?auto_23224 ?auto_23203 ) ) ( HOIST-AT ?auto_23227 ?auto_23224 ) ( AVAILABLE ?auto_23227 ) ( SURFACE-AT ?auto_23199 ?auto_23224 ) ( ON ?auto_23199 ?auto_23218 ) ( CLEAR ?auto_23199 ) ( not ( = ?auto_23198 ?auto_23199 ) ) ( not ( = ?auto_23198 ?auto_23218 ) ) ( not ( = ?auto_23199 ?auto_23218 ) ) ( not ( = ?auto_23204 ?auto_23227 ) ) ( IS-CRATE ?auto_23198 ) ( not ( = ?auto_23214 ?auto_23203 ) ) ( HOIST-AT ?auto_23220 ?auto_23214 ) ( SURFACE-AT ?auto_23198 ?auto_23214 ) ( ON ?auto_23198 ?auto_23221 ) ( CLEAR ?auto_23198 ) ( not ( = ?auto_23197 ?auto_23198 ) ) ( not ( = ?auto_23197 ?auto_23221 ) ) ( not ( = ?auto_23198 ?auto_23221 ) ) ( not ( = ?auto_23204 ?auto_23220 ) ) ( IS-CRATE ?auto_23197 ) ( not ( = ?auto_23211 ?auto_23203 ) ) ( HOIST-AT ?auto_23229 ?auto_23211 ) ( AVAILABLE ?auto_23229 ) ( SURFACE-AT ?auto_23197 ?auto_23211 ) ( ON ?auto_23197 ?auto_23228 ) ( CLEAR ?auto_23197 ) ( not ( = ?auto_23196 ?auto_23197 ) ) ( not ( = ?auto_23196 ?auto_23228 ) ) ( not ( = ?auto_23197 ?auto_23228 ) ) ( not ( = ?auto_23204 ?auto_23229 ) ) ( IS-CRATE ?auto_23196 ) ( not ( = ?auto_23212 ?auto_23203 ) ) ( HOIST-AT ?auto_23222 ?auto_23212 ) ( AVAILABLE ?auto_23222 ) ( SURFACE-AT ?auto_23196 ?auto_23212 ) ( ON ?auto_23196 ?auto_23216 ) ( CLEAR ?auto_23196 ) ( not ( = ?auto_23195 ?auto_23196 ) ) ( not ( = ?auto_23195 ?auto_23216 ) ) ( not ( = ?auto_23196 ?auto_23216 ) ) ( not ( = ?auto_23204 ?auto_23222 ) ) ( IS-CRATE ?auto_23195 ) ( AVAILABLE ?auto_23220 ) ( SURFACE-AT ?auto_23195 ?auto_23214 ) ( ON ?auto_23195 ?auto_23213 ) ( CLEAR ?auto_23195 ) ( not ( = ?auto_23194 ?auto_23195 ) ) ( not ( = ?auto_23194 ?auto_23213 ) ) ( not ( = ?auto_23195 ?auto_23213 ) ) ( SURFACE-AT ?auto_23193 ?auto_23203 ) ( CLEAR ?auto_23193 ) ( IS-CRATE ?auto_23194 ) ( AVAILABLE ?auto_23204 ) ( not ( = ?auto_23226 ?auto_23203 ) ) ( HOIST-AT ?auto_23219 ?auto_23226 ) ( AVAILABLE ?auto_23219 ) ( SURFACE-AT ?auto_23194 ?auto_23226 ) ( ON ?auto_23194 ?auto_23215 ) ( CLEAR ?auto_23194 ) ( TRUCK-AT ?auto_23206 ?auto_23203 ) ( not ( = ?auto_23193 ?auto_23194 ) ) ( not ( = ?auto_23193 ?auto_23215 ) ) ( not ( = ?auto_23194 ?auto_23215 ) ) ( not ( = ?auto_23204 ?auto_23219 ) ) ( not ( = ?auto_23193 ?auto_23195 ) ) ( not ( = ?auto_23193 ?auto_23213 ) ) ( not ( = ?auto_23195 ?auto_23215 ) ) ( not ( = ?auto_23214 ?auto_23226 ) ) ( not ( = ?auto_23220 ?auto_23219 ) ) ( not ( = ?auto_23213 ?auto_23215 ) ) ( not ( = ?auto_23193 ?auto_23196 ) ) ( not ( = ?auto_23193 ?auto_23216 ) ) ( not ( = ?auto_23194 ?auto_23196 ) ) ( not ( = ?auto_23194 ?auto_23216 ) ) ( not ( = ?auto_23196 ?auto_23213 ) ) ( not ( = ?auto_23196 ?auto_23215 ) ) ( not ( = ?auto_23212 ?auto_23214 ) ) ( not ( = ?auto_23212 ?auto_23226 ) ) ( not ( = ?auto_23222 ?auto_23220 ) ) ( not ( = ?auto_23222 ?auto_23219 ) ) ( not ( = ?auto_23216 ?auto_23213 ) ) ( not ( = ?auto_23216 ?auto_23215 ) ) ( not ( = ?auto_23193 ?auto_23197 ) ) ( not ( = ?auto_23193 ?auto_23228 ) ) ( not ( = ?auto_23194 ?auto_23197 ) ) ( not ( = ?auto_23194 ?auto_23228 ) ) ( not ( = ?auto_23195 ?auto_23197 ) ) ( not ( = ?auto_23195 ?auto_23228 ) ) ( not ( = ?auto_23197 ?auto_23216 ) ) ( not ( = ?auto_23197 ?auto_23213 ) ) ( not ( = ?auto_23197 ?auto_23215 ) ) ( not ( = ?auto_23211 ?auto_23212 ) ) ( not ( = ?auto_23211 ?auto_23214 ) ) ( not ( = ?auto_23211 ?auto_23226 ) ) ( not ( = ?auto_23229 ?auto_23222 ) ) ( not ( = ?auto_23229 ?auto_23220 ) ) ( not ( = ?auto_23229 ?auto_23219 ) ) ( not ( = ?auto_23228 ?auto_23216 ) ) ( not ( = ?auto_23228 ?auto_23213 ) ) ( not ( = ?auto_23228 ?auto_23215 ) ) ( not ( = ?auto_23193 ?auto_23198 ) ) ( not ( = ?auto_23193 ?auto_23221 ) ) ( not ( = ?auto_23194 ?auto_23198 ) ) ( not ( = ?auto_23194 ?auto_23221 ) ) ( not ( = ?auto_23195 ?auto_23198 ) ) ( not ( = ?auto_23195 ?auto_23221 ) ) ( not ( = ?auto_23196 ?auto_23198 ) ) ( not ( = ?auto_23196 ?auto_23221 ) ) ( not ( = ?auto_23198 ?auto_23228 ) ) ( not ( = ?auto_23198 ?auto_23216 ) ) ( not ( = ?auto_23198 ?auto_23213 ) ) ( not ( = ?auto_23198 ?auto_23215 ) ) ( not ( = ?auto_23221 ?auto_23228 ) ) ( not ( = ?auto_23221 ?auto_23216 ) ) ( not ( = ?auto_23221 ?auto_23213 ) ) ( not ( = ?auto_23221 ?auto_23215 ) ) ( not ( = ?auto_23193 ?auto_23199 ) ) ( not ( = ?auto_23193 ?auto_23218 ) ) ( not ( = ?auto_23194 ?auto_23199 ) ) ( not ( = ?auto_23194 ?auto_23218 ) ) ( not ( = ?auto_23195 ?auto_23199 ) ) ( not ( = ?auto_23195 ?auto_23218 ) ) ( not ( = ?auto_23196 ?auto_23199 ) ) ( not ( = ?auto_23196 ?auto_23218 ) ) ( not ( = ?auto_23197 ?auto_23199 ) ) ( not ( = ?auto_23197 ?auto_23218 ) ) ( not ( = ?auto_23199 ?auto_23221 ) ) ( not ( = ?auto_23199 ?auto_23228 ) ) ( not ( = ?auto_23199 ?auto_23216 ) ) ( not ( = ?auto_23199 ?auto_23213 ) ) ( not ( = ?auto_23199 ?auto_23215 ) ) ( not ( = ?auto_23224 ?auto_23214 ) ) ( not ( = ?auto_23224 ?auto_23211 ) ) ( not ( = ?auto_23224 ?auto_23212 ) ) ( not ( = ?auto_23224 ?auto_23226 ) ) ( not ( = ?auto_23227 ?auto_23220 ) ) ( not ( = ?auto_23227 ?auto_23229 ) ) ( not ( = ?auto_23227 ?auto_23222 ) ) ( not ( = ?auto_23227 ?auto_23219 ) ) ( not ( = ?auto_23218 ?auto_23221 ) ) ( not ( = ?auto_23218 ?auto_23228 ) ) ( not ( = ?auto_23218 ?auto_23216 ) ) ( not ( = ?auto_23218 ?auto_23213 ) ) ( not ( = ?auto_23218 ?auto_23215 ) ) ( not ( = ?auto_23193 ?auto_23200 ) ) ( not ( = ?auto_23193 ?auto_23225 ) ) ( not ( = ?auto_23194 ?auto_23200 ) ) ( not ( = ?auto_23194 ?auto_23225 ) ) ( not ( = ?auto_23195 ?auto_23200 ) ) ( not ( = ?auto_23195 ?auto_23225 ) ) ( not ( = ?auto_23196 ?auto_23200 ) ) ( not ( = ?auto_23196 ?auto_23225 ) ) ( not ( = ?auto_23197 ?auto_23200 ) ) ( not ( = ?auto_23197 ?auto_23225 ) ) ( not ( = ?auto_23198 ?auto_23200 ) ) ( not ( = ?auto_23198 ?auto_23225 ) ) ( not ( = ?auto_23200 ?auto_23218 ) ) ( not ( = ?auto_23200 ?auto_23221 ) ) ( not ( = ?auto_23200 ?auto_23228 ) ) ( not ( = ?auto_23200 ?auto_23216 ) ) ( not ( = ?auto_23200 ?auto_23213 ) ) ( not ( = ?auto_23200 ?auto_23215 ) ) ( not ( = ?auto_23209 ?auto_23224 ) ) ( not ( = ?auto_23209 ?auto_23214 ) ) ( not ( = ?auto_23209 ?auto_23211 ) ) ( not ( = ?auto_23209 ?auto_23212 ) ) ( not ( = ?auto_23209 ?auto_23226 ) ) ( not ( = ?auto_23217 ?auto_23227 ) ) ( not ( = ?auto_23217 ?auto_23220 ) ) ( not ( = ?auto_23217 ?auto_23229 ) ) ( not ( = ?auto_23217 ?auto_23222 ) ) ( not ( = ?auto_23217 ?auto_23219 ) ) ( not ( = ?auto_23225 ?auto_23218 ) ) ( not ( = ?auto_23225 ?auto_23221 ) ) ( not ( = ?auto_23225 ?auto_23228 ) ) ( not ( = ?auto_23225 ?auto_23216 ) ) ( not ( = ?auto_23225 ?auto_23213 ) ) ( not ( = ?auto_23225 ?auto_23215 ) ) ( not ( = ?auto_23193 ?auto_23201 ) ) ( not ( = ?auto_23193 ?auto_23230 ) ) ( not ( = ?auto_23194 ?auto_23201 ) ) ( not ( = ?auto_23194 ?auto_23230 ) ) ( not ( = ?auto_23195 ?auto_23201 ) ) ( not ( = ?auto_23195 ?auto_23230 ) ) ( not ( = ?auto_23196 ?auto_23201 ) ) ( not ( = ?auto_23196 ?auto_23230 ) ) ( not ( = ?auto_23197 ?auto_23201 ) ) ( not ( = ?auto_23197 ?auto_23230 ) ) ( not ( = ?auto_23198 ?auto_23201 ) ) ( not ( = ?auto_23198 ?auto_23230 ) ) ( not ( = ?auto_23199 ?auto_23201 ) ) ( not ( = ?auto_23199 ?auto_23230 ) ) ( not ( = ?auto_23201 ?auto_23225 ) ) ( not ( = ?auto_23201 ?auto_23218 ) ) ( not ( = ?auto_23201 ?auto_23221 ) ) ( not ( = ?auto_23201 ?auto_23228 ) ) ( not ( = ?auto_23201 ?auto_23216 ) ) ( not ( = ?auto_23201 ?auto_23213 ) ) ( not ( = ?auto_23201 ?auto_23215 ) ) ( not ( = ?auto_23210 ?auto_23209 ) ) ( not ( = ?auto_23210 ?auto_23224 ) ) ( not ( = ?auto_23210 ?auto_23214 ) ) ( not ( = ?auto_23210 ?auto_23211 ) ) ( not ( = ?auto_23210 ?auto_23212 ) ) ( not ( = ?auto_23210 ?auto_23226 ) ) ( not ( = ?auto_23223 ?auto_23217 ) ) ( not ( = ?auto_23223 ?auto_23227 ) ) ( not ( = ?auto_23223 ?auto_23220 ) ) ( not ( = ?auto_23223 ?auto_23229 ) ) ( not ( = ?auto_23223 ?auto_23222 ) ) ( not ( = ?auto_23223 ?auto_23219 ) ) ( not ( = ?auto_23230 ?auto_23225 ) ) ( not ( = ?auto_23230 ?auto_23218 ) ) ( not ( = ?auto_23230 ?auto_23221 ) ) ( not ( = ?auto_23230 ?auto_23228 ) ) ( not ( = ?auto_23230 ?auto_23216 ) ) ( not ( = ?auto_23230 ?auto_23213 ) ) ( not ( = ?auto_23230 ?auto_23215 ) ) ( not ( = ?auto_23193 ?auto_23202 ) ) ( not ( = ?auto_23193 ?auto_23207 ) ) ( not ( = ?auto_23194 ?auto_23202 ) ) ( not ( = ?auto_23194 ?auto_23207 ) ) ( not ( = ?auto_23195 ?auto_23202 ) ) ( not ( = ?auto_23195 ?auto_23207 ) ) ( not ( = ?auto_23196 ?auto_23202 ) ) ( not ( = ?auto_23196 ?auto_23207 ) ) ( not ( = ?auto_23197 ?auto_23202 ) ) ( not ( = ?auto_23197 ?auto_23207 ) ) ( not ( = ?auto_23198 ?auto_23202 ) ) ( not ( = ?auto_23198 ?auto_23207 ) ) ( not ( = ?auto_23199 ?auto_23202 ) ) ( not ( = ?auto_23199 ?auto_23207 ) ) ( not ( = ?auto_23200 ?auto_23202 ) ) ( not ( = ?auto_23200 ?auto_23207 ) ) ( not ( = ?auto_23202 ?auto_23230 ) ) ( not ( = ?auto_23202 ?auto_23225 ) ) ( not ( = ?auto_23202 ?auto_23218 ) ) ( not ( = ?auto_23202 ?auto_23221 ) ) ( not ( = ?auto_23202 ?auto_23228 ) ) ( not ( = ?auto_23202 ?auto_23216 ) ) ( not ( = ?auto_23202 ?auto_23213 ) ) ( not ( = ?auto_23202 ?auto_23215 ) ) ( not ( = ?auto_23208 ?auto_23210 ) ) ( not ( = ?auto_23208 ?auto_23209 ) ) ( not ( = ?auto_23208 ?auto_23224 ) ) ( not ( = ?auto_23208 ?auto_23214 ) ) ( not ( = ?auto_23208 ?auto_23211 ) ) ( not ( = ?auto_23208 ?auto_23212 ) ) ( not ( = ?auto_23208 ?auto_23226 ) ) ( not ( = ?auto_23205 ?auto_23223 ) ) ( not ( = ?auto_23205 ?auto_23217 ) ) ( not ( = ?auto_23205 ?auto_23227 ) ) ( not ( = ?auto_23205 ?auto_23220 ) ) ( not ( = ?auto_23205 ?auto_23229 ) ) ( not ( = ?auto_23205 ?auto_23222 ) ) ( not ( = ?auto_23205 ?auto_23219 ) ) ( not ( = ?auto_23207 ?auto_23230 ) ) ( not ( = ?auto_23207 ?auto_23225 ) ) ( not ( = ?auto_23207 ?auto_23218 ) ) ( not ( = ?auto_23207 ?auto_23221 ) ) ( not ( = ?auto_23207 ?auto_23228 ) ) ( not ( = ?auto_23207 ?auto_23216 ) ) ( not ( = ?auto_23207 ?auto_23213 ) ) ( not ( = ?auto_23207 ?auto_23215 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_23193 ?auto_23194 ?auto_23195 ?auto_23196 ?auto_23197 ?auto_23198 ?auto_23199 ?auto_23200 ?auto_23201 )
      ( MAKE-1CRATE ?auto_23201 ?auto_23202 )
      ( MAKE-9CRATE-VERIFY ?auto_23193 ?auto_23194 ?auto_23195 ?auto_23196 ?auto_23197 ?auto_23198 ?auto_23199 ?auto_23200 ?auto_23201 ?auto_23202 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_23252 - SURFACE
      ?auto_23253 - SURFACE
      ?auto_23254 - SURFACE
      ?auto_23255 - SURFACE
      ?auto_23256 - SURFACE
      ?auto_23257 - SURFACE
      ?auto_23258 - SURFACE
      ?auto_23259 - SURFACE
      ?auto_23260 - SURFACE
      ?auto_23261 - SURFACE
      ?auto_23262 - SURFACE
    )
    :vars
    (
      ?auto_23266 - HOIST
      ?auto_23263 - PLACE
      ?auto_23268 - PLACE
      ?auto_23267 - HOIST
      ?auto_23265 - SURFACE
      ?auto_23270 - PLACE
      ?auto_23278 - HOIST
      ?auto_23289 - SURFACE
      ?auto_23283 - PLACE
      ?auto_23286 - HOIST
      ?auto_23281 - SURFACE
      ?auto_23290 - PLACE
      ?auto_23271 - HOIST
      ?auto_23276 - SURFACE
      ?auto_23277 - SURFACE
      ?auto_23282 - PLACE
      ?auto_23275 - HOIST
      ?auto_23280 - SURFACE
      ?auto_23288 - PLACE
      ?auto_23285 - HOIST
      ?auto_23269 - SURFACE
      ?auto_23273 - PLACE
      ?auto_23274 - HOIST
      ?auto_23284 - SURFACE
      ?auto_23272 - SURFACE
      ?auto_23291 - PLACE
      ?auto_23287 - HOIST
      ?auto_23279 - SURFACE
      ?auto_23264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23266 ?auto_23263 ) ( IS-CRATE ?auto_23262 ) ( not ( = ?auto_23268 ?auto_23263 ) ) ( HOIST-AT ?auto_23267 ?auto_23268 ) ( SURFACE-AT ?auto_23262 ?auto_23268 ) ( ON ?auto_23262 ?auto_23265 ) ( CLEAR ?auto_23262 ) ( not ( = ?auto_23261 ?auto_23262 ) ) ( not ( = ?auto_23261 ?auto_23265 ) ) ( not ( = ?auto_23262 ?auto_23265 ) ) ( not ( = ?auto_23266 ?auto_23267 ) ) ( IS-CRATE ?auto_23261 ) ( not ( = ?auto_23270 ?auto_23263 ) ) ( HOIST-AT ?auto_23278 ?auto_23270 ) ( AVAILABLE ?auto_23278 ) ( SURFACE-AT ?auto_23261 ?auto_23270 ) ( ON ?auto_23261 ?auto_23289 ) ( CLEAR ?auto_23261 ) ( not ( = ?auto_23260 ?auto_23261 ) ) ( not ( = ?auto_23260 ?auto_23289 ) ) ( not ( = ?auto_23261 ?auto_23289 ) ) ( not ( = ?auto_23266 ?auto_23278 ) ) ( IS-CRATE ?auto_23260 ) ( not ( = ?auto_23283 ?auto_23263 ) ) ( HOIST-AT ?auto_23286 ?auto_23283 ) ( AVAILABLE ?auto_23286 ) ( SURFACE-AT ?auto_23260 ?auto_23283 ) ( ON ?auto_23260 ?auto_23281 ) ( CLEAR ?auto_23260 ) ( not ( = ?auto_23259 ?auto_23260 ) ) ( not ( = ?auto_23259 ?auto_23281 ) ) ( not ( = ?auto_23260 ?auto_23281 ) ) ( not ( = ?auto_23266 ?auto_23286 ) ) ( IS-CRATE ?auto_23259 ) ( not ( = ?auto_23290 ?auto_23263 ) ) ( HOIST-AT ?auto_23271 ?auto_23290 ) ( AVAILABLE ?auto_23271 ) ( SURFACE-AT ?auto_23259 ?auto_23290 ) ( ON ?auto_23259 ?auto_23276 ) ( CLEAR ?auto_23259 ) ( not ( = ?auto_23258 ?auto_23259 ) ) ( not ( = ?auto_23258 ?auto_23276 ) ) ( not ( = ?auto_23259 ?auto_23276 ) ) ( not ( = ?auto_23266 ?auto_23271 ) ) ( IS-CRATE ?auto_23258 ) ( AVAILABLE ?auto_23267 ) ( SURFACE-AT ?auto_23258 ?auto_23268 ) ( ON ?auto_23258 ?auto_23277 ) ( CLEAR ?auto_23258 ) ( not ( = ?auto_23257 ?auto_23258 ) ) ( not ( = ?auto_23257 ?auto_23277 ) ) ( not ( = ?auto_23258 ?auto_23277 ) ) ( IS-CRATE ?auto_23257 ) ( not ( = ?auto_23282 ?auto_23263 ) ) ( HOIST-AT ?auto_23275 ?auto_23282 ) ( SURFACE-AT ?auto_23257 ?auto_23282 ) ( ON ?auto_23257 ?auto_23280 ) ( CLEAR ?auto_23257 ) ( not ( = ?auto_23256 ?auto_23257 ) ) ( not ( = ?auto_23256 ?auto_23280 ) ) ( not ( = ?auto_23257 ?auto_23280 ) ) ( not ( = ?auto_23266 ?auto_23275 ) ) ( IS-CRATE ?auto_23256 ) ( not ( = ?auto_23288 ?auto_23263 ) ) ( HOIST-AT ?auto_23285 ?auto_23288 ) ( AVAILABLE ?auto_23285 ) ( SURFACE-AT ?auto_23256 ?auto_23288 ) ( ON ?auto_23256 ?auto_23269 ) ( CLEAR ?auto_23256 ) ( not ( = ?auto_23255 ?auto_23256 ) ) ( not ( = ?auto_23255 ?auto_23269 ) ) ( not ( = ?auto_23256 ?auto_23269 ) ) ( not ( = ?auto_23266 ?auto_23285 ) ) ( IS-CRATE ?auto_23255 ) ( not ( = ?auto_23273 ?auto_23263 ) ) ( HOIST-AT ?auto_23274 ?auto_23273 ) ( AVAILABLE ?auto_23274 ) ( SURFACE-AT ?auto_23255 ?auto_23273 ) ( ON ?auto_23255 ?auto_23284 ) ( CLEAR ?auto_23255 ) ( not ( = ?auto_23254 ?auto_23255 ) ) ( not ( = ?auto_23254 ?auto_23284 ) ) ( not ( = ?auto_23255 ?auto_23284 ) ) ( not ( = ?auto_23266 ?auto_23274 ) ) ( IS-CRATE ?auto_23254 ) ( AVAILABLE ?auto_23275 ) ( SURFACE-AT ?auto_23254 ?auto_23282 ) ( ON ?auto_23254 ?auto_23272 ) ( CLEAR ?auto_23254 ) ( not ( = ?auto_23253 ?auto_23254 ) ) ( not ( = ?auto_23253 ?auto_23272 ) ) ( not ( = ?auto_23254 ?auto_23272 ) ) ( SURFACE-AT ?auto_23252 ?auto_23263 ) ( CLEAR ?auto_23252 ) ( IS-CRATE ?auto_23253 ) ( AVAILABLE ?auto_23266 ) ( not ( = ?auto_23291 ?auto_23263 ) ) ( HOIST-AT ?auto_23287 ?auto_23291 ) ( AVAILABLE ?auto_23287 ) ( SURFACE-AT ?auto_23253 ?auto_23291 ) ( ON ?auto_23253 ?auto_23279 ) ( CLEAR ?auto_23253 ) ( TRUCK-AT ?auto_23264 ?auto_23263 ) ( not ( = ?auto_23252 ?auto_23253 ) ) ( not ( = ?auto_23252 ?auto_23279 ) ) ( not ( = ?auto_23253 ?auto_23279 ) ) ( not ( = ?auto_23266 ?auto_23287 ) ) ( not ( = ?auto_23252 ?auto_23254 ) ) ( not ( = ?auto_23252 ?auto_23272 ) ) ( not ( = ?auto_23254 ?auto_23279 ) ) ( not ( = ?auto_23282 ?auto_23291 ) ) ( not ( = ?auto_23275 ?auto_23287 ) ) ( not ( = ?auto_23272 ?auto_23279 ) ) ( not ( = ?auto_23252 ?auto_23255 ) ) ( not ( = ?auto_23252 ?auto_23284 ) ) ( not ( = ?auto_23253 ?auto_23255 ) ) ( not ( = ?auto_23253 ?auto_23284 ) ) ( not ( = ?auto_23255 ?auto_23272 ) ) ( not ( = ?auto_23255 ?auto_23279 ) ) ( not ( = ?auto_23273 ?auto_23282 ) ) ( not ( = ?auto_23273 ?auto_23291 ) ) ( not ( = ?auto_23274 ?auto_23275 ) ) ( not ( = ?auto_23274 ?auto_23287 ) ) ( not ( = ?auto_23284 ?auto_23272 ) ) ( not ( = ?auto_23284 ?auto_23279 ) ) ( not ( = ?auto_23252 ?auto_23256 ) ) ( not ( = ?auto_23252 ?auto_23269 ) ) ( not ( = ?auto_23253 ?auto_23256 ) ) ( not ( = ?auto_23253 ?auto_23269 ) ) ( not ( = ?auto_23254 ?auto_23256 ) ) ( not ( = ?auto_23254 ?auto_23269 ) ) ( not ( = ?auto_23256 ?auto_23284 ) ) ( not ( = ?auto_23256 ?auto_23272 ) ) ( not ( = ?auto_23256 ?auto_23279 ) ) ( not ( = ?auto_23288 ?auto_23273 ) ) ( not ( = ?auto_23288 ?auto_23282 ) ) ( not ( = ?auto_23288 ?auto_23291 ) ) ( not ( = ?auto_23285 ?auto_23274 ) ) ( not ( = ?auto_23285 ?auto_23275 ) ) ( not ( = ?auto_23285 ?auto_23287 ) ) ( not ( = ?auto_23269 ?auto_23284 ) ) ( not ( = ?auto_23269 ?auto_23272 ) ) ( not ( = ?auto_23269 ?auto_23279 ) ) ( not ( = ?auto_23252 ?auto_23257 ) ) ( not ( = ?auto_23252 ?auto_23280 ) ) ( not ( = ?auto_23253 ?auto_23257 ) ) ( not ( = ?auto_23253 ?auto_23280 ) ) ( not ( = ?auto_23254 ?auto_23257 ) ) ( not ( = ?auto_23254 ?auto_23280 ) ) ( not ( = ?auto_23255 ?auto_23257 ) ) ( not ( = ?auto_23255 ?auto_23280 ) ) ( not ( = ?auto_23257 ?auto_23269 ) ) ( not ( = ?auto_23257 ?auto_23284 ) ) ( not ( = ?auto_23257 ?auto_23272 ) ) ( not ( = ?auto_23257 ?auto_23279 ) ) ( not ( = ?auto_23280 ?auto_23269 ) ) ( not ( = ?auto_23280 ?auto_23284 ) ) ( not ( = ?auto_23280 ?auto_23272 ) ) ( not ( = ?auto_23280 ?auto_23279 ) ) ( not ( = ?auto_23252 ?auto_23258 ) ) ( not ( = ?auto_23252 ?auto_23277 ) ) ( not ( = ?auto_23253 ?auto_23258 ) ) ( not ( = ?auto_23253 ?auto_23277 ) ) ( not ( = ?auto_23254 ?auto_23258 ) ) ( not ( = ?auto_23254 ?auto_23277 ) ) ( not ( = ?auto_23255 ?auto_23258 ) ) ( not ( = ?auto_23255 ?auto_23277 ) ) ( not ( = ?auto_23256 ?auto_23258 ) ) ( not ( = ?auto_23256 ?auto_23277 ) ) ( not ( = ?auto_23258 ?auto_23280 ) ) ( not ( = ?auto_23258 ?auto_23269 ) ) ( not ( = ?auto_23258 ?auto_23284 ) ) ( not ( = ?auto_23258 ?auto_23272 ) ) ( not ( = ?auto_23258 ?auto_23279 ) ) ( not ( = ?auto_23268 ?auto_23282 ) ) ( not ( = ?auto_23268 ?auto_23288 ) ) ( not ( = ?auto_23268 ?auto_23273 ) ) ( not ( = ?auto_23268 ?auto_23291 ) ) ( not ( = ?auto_23267 ?auto_23275 ) ) ( not ( = ?auto_23267 ?auto_23285 ) ) ( not ( = ?auto_23267 ?auto_23274 ) ) ( not ( = ?auto_23267 ?auto_23287 ) ) ( not ( = ?auto_23277 ?auto_23280 ) ) ( not ( = ?auto_23277 ?auto_23269 ) ) ( not ( = ?auto_23277 ?auto_23284 ) ) ( not ( = ?auto_23277 ?auto_23272 ) ) ( not ( = ?auto_23277 ?auto_23279 ) ) ( not ( = ?auto_23252 ?auto_23259 ) ) ( not ( = ?auto_23252 ?auto_23276 ) ) ( not ( = ?auto_23253 ?auto_23259 ) ) ( not ( = ?auto_23253 ?auto_23276 ) ) ( not ( = ?auto_23254 ?auto_23259 ) ) ( not ( = ?auto_23254 ?auto_23276 ) ) ( not ( = ?auto_23255 ?auto_23259 ) ) ( not ( = ?auto_23255 ?auto_23276 ) ) ( not ( = ?auto_23256 ?auto_23259 ) ) ( not ( = ?auto_23256 ?auto_23276 ) ) ( not ( = ?auto_23257 ?auto_23259 ) ) ( not ( = ?auto_23257 ?auto_23276 ) ) ( not ( = ?auto_23259 ?auto_23277 ) ) ( not ( = ?auto_23259 ?auto_23280 ) ) ( not ( = ?auto_23259 ?auto_23269 ) ) ( not ( = ?auto_23259 ?auto_23284 ) ) ( not ( = ?auto_23259 ?auto_23272 ) ) ( not ( = ?auto_23259 ?auto_23279 ) ) ( not ( = ?auto_23290 ?auto_23268 ) ) ( not ( = ?auto_23290 ?auto_23282 ) ) ( not ( = ?auto_23290 ?auto_23288 ) ) ( not ( = ?auto_23290 ?auto_23273 ) ) ( not ( = ?auto_23290 ?auto_23291 ) ) ( not ( = ?auto_23271 ?auto_23267 ) ) ( not ( = ?auto_23271 ?auto_23275 ) ) ( not ( = ?auto_23271 ?auto_23285 ) ) ( not ( = ?auto_23271 ?auto_23274 ) ) ( not ( = ?auto_23271 ?auto_23287 ) ) ( not ( = ?auto_23276 ?auto_23277 ) ) ( not ( = ?auto_23276 ?auto_23280 ) ) ( not ( = ?auto_23276 ?auto_23269 ) ) ( not ( = ?auto_23276 ?auto_23284 ) ) ( not ( = ?auto_23276 ?auto_23272 ) ) ( not ( = ?auto_23276 ?auto_23279 ) ) ( not ( = ?auto_23252 ?auto_23260 ) ) ( not ( = ?auto_23252 ?auto_23281 ) ) ( not ( = ?auto_23253 ?auto_23260 ) ) ( not ( = ?auto_23253 ?auto_23281 ) ) ( not ( = ?auto_23254 ?auto_23260 ) ) ( not ( = ?auto_23254 ?auto_23281 ) ) ( not ( = ?auto_23255 ?auto_23260 ) ) ( not ( = ?auto_23255 ?auto_23281 ) ) ( not ( = ?auto_23256 ?auto_23260 ) ) ( not ( = ?auto_23256 ?auto_23281 ) ) ( not ( = ?auto_23257 ?auto_23260 ) ) ( not ( = ?auto_23257 ?auto_23281 ) ) ( not ( = ?auto_23258 ?auto_23260 ) ) ( not ( = ?auto_23258 ?auto_23281 ) ) ( not ( = ?auto_23260 ?auto_23276 ) ) ( not ( = ?auto_23260 ?auto_23277 ) ) ( not ( = ?auto_23260 ?auto_23280 ) ) ( not ( = ?auto_23260 ?auto_23269 ) ) ( not ( = ?auto_23260 ?auto_23284 ) ) ( not ( = ?auto_23260 ?auto_23272 ) ) ( not ( = ?auto_23260 ?auto_23279 ) ) ( not ( = ?auto_23283 ?auto_23290 ) ) ( not ( = ?auto_23283 ?auto_23268 ) ) ( not ( = ?auto_23283 ?auto_23282 ) ) ( not ( = ?auto_23283 ?auto_23288 ) ) ( not ( = ?auto_23283 ?auto_23273 ) ) ( not ( = ?auto_23283 ?auto_23291 ) ) ( not ( = ?auto_23286 ?auto_23271 ) ) ( not ( = ?auto_23286 ?auto_23267 ) ) ( not ( = ?auto_23286 ?auto_23275 ) ) ( not ( = ?auto_23286 ?auto_23285 ) ) ( not ( = ?auto_23286 ?auto_23274 ) ) ( not ( = ?auto_23286 ?auto_23287 ) ) ( not ( = ?auto_23281 ?auto_23276 ) ) ( not ( = ?auto_23281 ?auto_23277 ) ) ( not ( = ?auto_23281 ?auto_23280 ) ) ( not ( = ?auto_23281 ?auto_23269 ) ) ( not ( = ?auto_23281 ?auto_23284 ) ) ( not ( = ?auto_23281 ?auto_23272 ) ) ( not ( = ?auto_23281 ?auto_23279 ) ) ( not ( = ?auto_23252 ?auto_23261 ) ) ( not ( = ?auto_23252 ?auto_23289 ) ) ( not ( = ?auto_23253 ?auto_23261 ) ) ( not ( = ?auto_23253 ?auto_23289 ) ) ( not ( = ?auto_23254 ?auto_23261 ) ) ( not ( = ?auto_23254 ?auto_23289 ) ) ( not ( = ?auto_23255 ?auto_23261 ) ) ( not ( = ?auto_23255 ?auto_23289 ) ) ( not ( = ?auto_23256 ?auto_23261 ) ) ( not ( = ?auto_23256 ?auto_23289 ) ) ( not ( = ?auto_23257 ?auto_23261 ) ) ( not ( = ?auto_23257 ?auto_23289 ) ) ( not ( = ?auto_23258 ?auto_23261 ) ) ( not ( = ?auto_23258 ?auto_23289 ) ) ( not ( = ?auto_23259 ?auto_23261 ) ) ( not ( = ?auto_23259 ?auto_23289 ) ) ( not ( = ?auto_23261 ?auto_23281 ) ) ( not ( = ?auto_23261 ?auto_23276 ) ) ( not ( = ?auto_23261 ?auto_23277 ) ) ( not ( = ?auto_23261 ?auto_23280 ) ) ( not ( = ?auto_23261 ?auto_23269 ) ) ( not ( = ?auto_23261 ?auto_23284 ) ) ( not ( = ?auto_23261 ?auto_23272 ) ) ( not ( = ?auto_23261 ?auto_23279 ) ) ( not ( = ?auto_23270 ?auto_23283 ) ) ( not ( = ?auto_23270 ?auto_23290 ) ) ( not ( = ?auto_23270 ?auto_23268 ) ) ( not ( = ?auto_23270 ?auto_23282 ) ) ( not ( = ?auto_23270 ?auto_23288 ) ) ( not ( = ?auto_23270 ?auto_23273 ) ) ( not ( = ?auto_23270 ?auto_23291 ) ) ( not ( = ?auto_23278 ?auto_23286 ) ) ( not ( = ?auto_23278 ?auto_23271 ) ) ( not ( = ?auto_23278 ?auto_23267 ) ) ( not ( = ?auto_23278 ?auto_23275 ) ) ( not ( = ?auto_23278 ?auto_23285 ) ) ( not ( = ?auto_23278 ?auto_23274 ) ) ( not ( = ?auto_23278 ?auto_23287 ) ) ( not ( = ?auto_23289 ?auto_23281 ) ) ( not ( = ?auto_23289 ?auto_23276 ) ) ( not ( = ?auto_23289 ?auto_23277 ) ) ( not ( = ?auto_23289 ?auto_23280 ) ) ( not ( = ?auto_23289 ?auto_23269 ) ) ( not ( = ?auto_23289 ?auto_23284 ) ) ( not ( = ?auto_23289 ?auto_23272 ) ) ( not ( = ?auto_23289 ?auto_23279 ) ) ( not ( = ?auto_23252 ?auto_23262 ) ) ( not ( = ?auto_23252 ?auto_23265 ) ) ( not ( = ?auto_23253 ?auto_23262 ) ) ( not ( = ?auto_23253 ?auto_23265 ) ) ( not ( = ?auto_23254 ?auto_23262 ) ) ( not ( = ?auto_23254 ?auto_23265 ) ) ( not ( = ?auto_23255 ?auto_23262 ) ) ( not ( = ?auto_23255 ?auto_23265 ) ) ( not ( = ?auto_23256 ?auto_23262 ) ) ( not ( = ?auto_23256 ?auto_23265 ) ) ( not ( = ?auto_23257 ?auto_23262 ) ) ( not ( = ?auto_23257 ?auto_23265 ) ) ( not ( = ?auto_23258 ?auto_23262 ) ) ( not ( = ?auto_23258 ?auto_23265 ) ) ( not ( = ?auto_23259 ?auto_23262 ) ) ( not ( = ?auto_23259 ?auto_23265 ) ) ( not ( = ?auto_23260 ?auto_23262 ) ) ( not ( = ?auto_23260 ?auto_23265 ) ) ( not ( = ?auto_23262 ?auto_23289 ) ) ( not ( = ?auto_23262 ?auto_23281 ) ) ( not ( = ?auto_23262 ?auto_23276 ) ) ( not ( = ?auto_23262 ?auto_23277 ) ) ( not ( = ?auto_23262 ?auto_23280 ) ) ( not ( = ?auto_23262 ?auto_23269 ) ) ( not ( = ?auto_23262 ?auto_23284 ) ) ( not ( = ?auto_23262 ?auto_23272 ) ) ( not ( = ?auto_23262 ?auto_23279 ) ) ( not ( = ?auto_23265 ?auto_23289 ) ) ( not ( = ?auto_23265 ?auto_23281 ) ) ( not ( = ?auto_23265 ?auto_23276 ) ) ( not ( = ?auto_23265 ?auto_23277 ) ) ( not ( = ?auto_23265 ?auto_23280 ) ) ( not ( = ?auto_23265 ?auto_23269 ) ) ( not ( = ?auto_23265 ?auto_23284 ) ) ( not ( = ?auto_23265 ?auto_23272 ) ) ( not ( = ?auto_23265 ?auto_23279 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_23252 ?auto_23253 ?auto_23254 ?auto_23255 ?auto_23256 ?auto_23257 ?auto_23258 ?auto_23259 ?auto_23260 ?auto_23261 )
      ( MAKE-1CRATE ?auto_23261 ?auto_23262 )
      ( MAKE-10CRATE-VERIFY ?auto_23252 ?auto_23253 ?auto_23254 ?auto_23255 ?auto_23256 ?auto_23257 ?auto_23258 ?auto_23259 ?auto_23260 ?auto_23261 ?auto_23262 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_23314 - SURFACE
      ?auto_23315 - SURFACE
      ?auto_23316 - SURFACE
      ?auto_23317 - SURFACE
      ?auto_23318 - SURFACE
      ?auto_23319 - SURFACE
      ?auto_23320 - SURFACE
      ?auto_23321 - SURFACE
      ?auto_23322 - SURFACE
      ?auto_23323 - SURFACE
      ?auto_23324 - SURFACE
      ?auto_23325 - SURFACE
    )
    :vars
    (
      ?auto_23329 - HOIST
      ?auto_23327 - PLACE
      ?auto_23328 - PLACE
      ?auto_23330 - HOIST
      ?auto_23331 - SURFACE
      ?auto_23357 - PLACE
      ?auto_23346 - HOIST
      ?auto_23332 - SURFACE
      ?auto_23354 - PLACE
      ?auto_23334 - HOIST
      ?auto_23348 - SURFACE
      ?auto_23352 - PLACE
      ?auto_23350 - HOIST
      ?auto_23333 - SURFACE
      ?auto_23349 - PLACE
      ?auto_23337 - HOIST
      ?auto_23343 - SURFACE
      ?auto_23340 - SURFACE
      ?auto_23335 - PLACE
      ?auto_23356 - HOIST
      ?auto_23351 - SURFACE
      ?auto_23341 - PLACE
      ?auto_23338 - HOIST
      ?auto_23345 - SURFACE
      ?auto_23344 - PLACE
      ?auto_23353 - HOIST
      ?auto_23355 - SURFACE
      ?auto_23336 - SURFACE
      ?auto_23347 - PLACE
      ?auto_23339 - HOIST
      ?auto_23342 - SURFACE
      ?auto_23326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23329 ?auto_23327 ) ( IS-CRATE ?auto_23325 ) ( not ( = ?auto_23328 ?auto_23327 ) ) ( HOIST-AT ?auto_23330 ?auto_23328 ) ( AVAILABLE ?auto_23330 ) ( SURFACE-AT ?auto_23325 ?auto_23328 ) ( ON ?auto_23325 ?auto_23331 ) ( CLEAR ?auto_23325 ) ( not ( = ?auto_23324 ?auto_23325 ) ) ( not ( = ?auto_23324 ?auto_23331 ) ) ( not ( = ?auto_23325 ?auto_23331 ) ) ( not ( = ?auto_23329 ?auto_23330 ) ) ( IS-CRATE ?auto_23324 ) ( not ( = ?auto_23357 ?auto_23327 ) ) ( HOIST-AT ?auto_23346 ?auto_23357 ) ( SURFACE-AT ?auto_23324 ?auto_23357 ) ( ON ?auto_23324 ?auto_23332 ) ( CLEAR ?auto_23324 ) ( not ( = ?auto_23323 ?auto_23324 ) ) ( not ( = ?auto_23323 ?auto_23332 ) ) ( not ( = ?auto_23324 ?auto_23332 ) ) ( not ( = ?auto_23329 ?auto_23346 ) ) ( IS-CRATE ?auto_23323 ) ( not ( = ?auto_23354 ?auto_23327 ) ) ( HOIST-AT ?auto_23334 ?auto_23354 ) ( AVAILABLE ?auto_23334 ) ( SURFACE-AT ?auto_23323 ?auto_23354 ) ( ON ?auto_23323 ?auto_23348 ) ( CLEAR ?auto_23323 ) ( not ( = ?auto_23322 ?auto_23323 ) ) ( not ( = ?auto_23322 ?auto_23348 ) ) ( not ( = ?auto_23323 ?auto_23348 ) ) ( not ( = ?auto_23329 ?auto_23334 ) ) ( IS-CRATE ?auto_23322 ) ( not ( = ?auto_23352 ?auto_23327 ) ) ( HOIST-AT ?auto_23350 ?auto_23352 ) ( AVAILABLE ?auto_23350 ) ( SURFACE-AT ?auto_23322 ?auto_23352 ) ( ON ?auto_23322 ?auto_23333 ) ( CLEAR ?auto_23322 ) ( not ( = ?auto_23321 ?auto_23322 ) ) ( not ( = ?auto_23321 ?auto_23333 ) ) ( not ( = ?auto_23322 ?auto_23333 ) ) ( not ( = ?auto_23329 ?auto_23350 ) ) ( IS-CRATE ?auto_23321 ) ( not ( = ?auto_23349 ?auto_23327 ) ) ( HOIST-AT ?auto_23337 ?auto_23349 ) ( AVAILABLE ?auto_23337 ) ( SURFACE-AT ?auto_23321 ?auto_23349 ) ( ON ?auto_23321 ?auto_23343 ) ( CLEAR ?auto_23321 ) ( not ( = ?auto_23320 ?auto_23321 ) ) ( not ( = ?auto_23320 ?auto_23343 ) ) ( not ( = ?auto_23321 ?auto_23343 ) ) ( not ( = ?auto_23329 ?auto_23337 ) ) ( IS-CRATE ?auto_23320 ) ( AVAILABLE ?auto_23346 ) ( SURFACE-AT ?auto_23320 ?auto_23357 ) ( ON ?auto_23320 ?auto_23340 ) ( CLEAR ?auto_23320 ) ( not ( = ?auto_23319 ?auto_23320 ) ) ( not ( = ?auto_23319 ?auto_23340 ) ) ( not ( = ?auto_23320 ?auto_23340 ) ) ( IS-CRATE ?auto_23319 ) ( not ( = ?auto_23335 ?auto_23327 ) ) ( HOIST-AT ?auto_23356 ?auto_23335 ) ( SURFACE-AT ?auto_23319 ?auto_23335 ) ( ON ?auto_23319 ?auto_23351 ) ( CLEAR ?auto_23319 ) ( not ( = ?auto_23318 ?auto_23319 ) ) ( not ( = ?auto_23318 ?auto_23351 ) ) ( not ( = ?auto_23319 ?auto_23351 ) ) ( not ( = ?auto_23329 ?auto_23356 ) ) ( IS-CRATE ?auto_23318 ) ( not ( = ?auto_23341 ?auto_23327 ) ) ( HOIST-AT ?auto_23338 ?auto_23341 ) ( AVAILABLE ?auto_23338 ) ( SURFACE-AT ?auto_23318 ?auto_23341 ) ( ON ?auto_23318 ?auto_23345 ) ( CLEAR ?auto_23318 ) ( not ( = ?auto_23317 ?auto_23318 ) ) ( not ( = ?auto_23317 ?auto_23345 ) ) ( not ( = ?auto_23318 ?auto_23345 ) ) ( not ( = ?auto_23329 ?auto_23338 ) ) ( IS-CRATE ?auto_23317 ) ( not ( = ?auto_23344 ?auto_23327 ) ) ( HOIST-AT ?auto_23353 ?auto_23344 ) ( AVAILABLE ?auto_23353 ) ( SURFACE-AT ?auto_23317 ?auto_23344 ) ( ON ?auto_23317 ?auto_23355 ) ( CLEAR ?auto_23317 ) ( not ( = ?auto_23316 ?auto_23317 ) ) ( not ( = ?auto_23316 ?auto_23355 ) ) ( not ( = ?auto_23317 ?auto_23355 ) ) ( not ( = ?auto_23329 ?auto_23353 ) ) ( IS-CRATE ?auto_23316 ) ( AVAILABLE ?auto_23356 ) ( SURFACE-AT ?auto_23316 ?auto_23335 ) ( ON ?auto_23316 ?auto_23336 ) ( CLEAR ?auto_23316 ) ( not ( = ?auto_23315 ?auto_23316 ) ) ( not ( = ?auto_23315 ?auto_23336 ) ) ( not ( = ?auto_23316 ?auto_23336 ) ) ( SURFACE-AT ?auto_23314 ?auto_23327 ) ( CLEAR ?auto_23314 ) ( IS-CRATE ?auto_23315 ) ( AVAILABLE ?auto_23329 ) ( not ( = ?auto_23347 ?auto_23327 ) ) ( HOIST-AT ?auto_23339 ?auto_23347 ) ( AVAILABLE ?auto_23339 ) ( SURFACE-AT ?auto_23315 ?auto_23347 ) ( ON ?auto_23315 ?auto_23342 ) ( CLEAR ?auto_23315 ) ( TRUCK-AT ?auto_23326 ?auto_23327 ) ( not ( = ?auto_23314 ?auto_23315 ) ) ( not ( = ?auto_23314 ?auto_23342 ) ) ( not ( = ?auto_23315 ?auto_23342 ) ) ( not ( = ?auto_23329 ?auto_23339 ) ) ( not ( = ?auto_23314 ?auto_23316 ) ) ( not ( = ?auto_23314 ?auto_23336 ) ) ( not ( = ?auto_23316 ?auto_23342 ) ) ( not ( = ?auto_23335 ?auto_23347 ) ) ( not ( = ?auto_23356 ?auto_23339 ) ) ( not ( = ?auto_23336 ?auto_23342 ) ) ( not ( = ?auto_23314 ?auto_23317 ) ) ( not ( = ?auto_23314 ?auto_23355 ) ) ( not ( = ?auto_23315 ?auto_23317 ) ) ( not ( = ?auto_23315 ?auto_23355 ) ) ( not ( = ?auto_23317 ?auto_23336 ) ) ( not ( = ?auto_23317 ?auto_23342 ) ) ( not ( = ?auto_23344 ?auto_23335 ) ) ( not ( = ?auto_23344 ?auto_23347 ) ) ( not ( = ?auto_23353 ?auto_23356 ) ) ( not ( = ?auto_23353 ?auto_23339 ) ) ( not ( = ?auto_23355 ?auto_23336 ) ) ( not ( = ?auto_23355 ?auto_23342 ) ) ( not ( = ?auto_23314 ?auto_23318 ) ) ( not ( = ?auto_23314 ?auto_23345 ) ) ( not ( = ?auto_23315 ?auto_23318 ) ) ( not ( = ?auto_23315 ?auto_23345 ) ) ( not ( = ?auto_23316 ?auto_23318 ) ) ( not ( = ?auto_23316 ?auto_23345 ) ) ( not ( = ?auto_23318 ?auto_23355 ) ) ( not ( = ?auto_23318 ?auto_23336 ) ) ( not ( = ?auto_23318 ?auto_23342 ) ) ( not ( = ?auto_23341 ?auto_23344 ) ) ( not ( = ?auto_23341 ?auto_23335 ) ) ( not ( = ?auto_23341 ?auto_23347 ) ) ( not ( = ?auto_23338 ?auto_23353 ) ) ( not ( = ?auto_23338 ?auto_23356 ) ) ( not ( = ?auto_23338 ?auto_23339 ) ) ( not ( = ?auto_23345 ?auto_23355 ) ) ( not ( = ?auto_23345 ?auto_23336 ) ) ( not ( = ?auto_23345 ?auto_23342 ) ) ( not ( = ?auto_23314 ?auto_23319 ) ) ( not ( = ?auto_23314 ?auto_23351 ) ) ( not ( = ?auto_23315 ?auto_23319 ) ) ( not ( = ?auto_23315 ?auto_23351 ) ) ( not ( = ?auto_23316 ?auto_23319 ) ) ( not ( = ?auto_23316 ?auto_23351 ) ) ( not ( = ?auto_23317 ?auto_23319 ) ) ( not ( = ?auto_23317 ?auto_23351 ) ) ( not ( = ?auto_23319 ?auto_23345 ) ) ( not ( = ?auto_23319 ?auto_23355 ) ) ( not ( = ?auto_23319 ?auto_23336 ) ) ( not ( = ?auto_23319 ?auto_23342 ) ) ( not ( = ?auto_23351 ?auto_23345 ) ) ( not ( = ?auto_23351 ?auto_23355 ) ) ( not ( = ?auto_23351 ?auto_23336 ) ) ( not ( = ?auto_23351 ?auto_23342 ) ) ( not ( = ?auto_23314 ?auto_23320 ) ) ( not ( = ?auto_23314 ?auto_23340 ) ) ( not ( = ?auto_23315 ?auto_23320 ) ) ( not ( = ?auto_23315 ?auto_23340 ) ) ( not ( = ?auto_23316 ?auto_23320 ) ) ( not ( = ?auto_23316 ?auto_23340 ) ) ( not ( = ?auto_23317 ?auto_23320 ) ) ( not ( = ?auto_23317 ?auto_23340 ) ) ( not ( = ?auto_23318 ?auto_23320 ) ) ( not ( = ?auto_23318 ?auto_23340 ) ) ( not ( = ?auto_23320 ?auto_23351 ) ) ( not ( = ?auto_23320 ?auto_23345 ) ) ( not ( = ?auto_23320 ?auto_23355 ) ) ( not ( = ?auto_23320 ?auto_23336 ) ) ( not ( = ?auto_23320 ?auto_23342 ) ) ( not ( = ?auto_23357 ?auto_23335 ) ) ( not ( = ?auto_23357 ?auto_23341 ) ) ( not ( = ?auto_23357 ?auto_23344 ) ) ( not ( = ?auto_23357 ?auto_23347 ) ) ( not ( = ?auto_23346 ?auto_23356 ) ) ( not ( = ?auto_23346 ?auto_23338 ) ) ( not ( = ?auto_23346 ?auto_23353 ) ) ( not ( = ?auto_23346 ?auto_23339 ) ) ( not ( = ?auto_23340 ?auto_23351 ) ) ( not ( = ?auto_23340 ?auto_23345 ) ) ( not ( = ?auto_23340 ?auto_23355 ) ) ( not ( = ?auto_23340 ?auto_23336 ) ) ( not ( = ?auto_23340 ?auto_23342 ) ) ( not ( = ?auto_23314 ?auto_23321 ) ) ( not ( = ?auto_23314 ?auto_23343 ) ) ( not ( = ?auto_23315 ?auto_23321 ) ) ( not ( = ?auto_23315 ?auto_23343 ) ) ( not ( = ?auto_23316 ?auto_23321 ) ) ( not ( = ?auto_23316 ?auto_23343 ) ) ( not ( = ?auto_23317 ?auto_23321 ) ) ( not ( = ?auto_23317 ?auto_23343 ) ) ( not ( = ?auto_23318 ?auto_23321 ) ) ( not ( = ?auto_23318 ?auto_23343 ) ) ( not ( = ?auto_23319 ?auto_23321 ) ) ( not ( = ?auto_23319 ?auto_23343 ) ) ( not ( = ?auto_23321 ?auto_23340 ) ) ( not ( = ?auto_23321 ?auto_23351 ) ) ( not ( = ?auto_23321 ?auto_23345 ) ) ( not ( = ?auto_23321 ?auto_23355 ) ) ( not ( = ?auto_23321 ?auto_23336 ) ) ( not ( = ?auto_23321 ?auto_23342 ) ) ( not ( = ?auto_23349 ?auto_23357 ) ) ( not ( = ?auto_23349 ?auto_23335 ) ) ( not ( = ?auto_23349 ?auto_23341 ) ) ( not ( = ?auto_23349 ?auto_23344 ) ) ( not ( = ?auto_23349 ?auto_23347 ) ) ( not ( = ?auto_23337 ?auto_23346 ) ) ( not ( = ?auto_23337 ?auto_23356 ) ) ( not ( = ?auto_23337 ?auto_23338 ) ) ( not ( = ?auto_23337 ?auto_23353 ) ) ( not ( = ?auto_23337 ?auto_23339 ) ) ( not ( = ?auto_23343 ?auto_23340 ) ) ( not ( = ?auto_23343 ?auto_23351 ) ) ( not ( = ?auto_23343 ?auto_23345 ) ) ( not ( = ?auto_23343 ?auto_23355 ) ) ( not ( = ?auto_23343 ?auto_23336 ) ) ( not ( = ?auto_23343 ?auto_23342 ) ) ( not ( = ?auto_23314 ?auto_23322 ) ) ( not ( = ?auto_23314 ?auto_23333 ) ) ( not ( = ?auto_23315 ?auto_23322 ) ) ( not ( = ?auto_23315 ?auto_23333 ) ) ( not ( = ?auto_23316 ?auto_23322 ) ) ( not ( = ?auto_23316 ?auto_23333 ) ) ( not ( = ?auto_23317 ?auto_23322 ) ) ( not ( = ?auto_23317 ?auto_23333 ) ) ( not ( = ?auto_23318 ?auto_23322 ) ) ( not ( = ?auto_23318 ?auto_23333 ) ) ( not ( = ?auto_23319 ?auto_23322 ) ) ( not ( = ?auto_23319 ?auto_23333 ) ) ( not ( = ?auto_23320 ?auto_23322 ) ) ( not ( = ?auto_23320 ?auto_23333 ) ) ( not ( = ?auto_23322 ?auto_23343 ) ) ( not ( = ?auto_23322 ?auto_23340 ) ) ( not ( = ?auto_23322 ?auto_23351 ) ) ( not ( = ?auto_23322 ?auto_23345 ) ) ( not ( = ?auto_23322 ?auto_23355 ) ) ( not ( = ?auto_23322 ?auto_23336 ) ) ( not ( = ?auto_23322 ?auto_23342 ) ) ( not ( = ?auto_23352 ?auto_23349 ) ) ( not ( = ?auto_23352 ?auto_23357 ) ) ( not ( = ?auto_23352 ?auto_23335 ) ) ( not ( = ?auto_23352 ?auto_23341 ) ) ( not ( = ?auto_23352 ?auto_23344 ) ) ( not ( = ?auto_23352 ?auto_23347 ) ) ( not ( = ?auto_23350 ?auto_23337 ) ) ( not ( = ?auto_23350 ?auto_23346 ) ) ( not ( = ?auto_23350 ?auto_23356 ) ) ( not ( = ?auto_23350 ?auto_23338 ) ) ( not ( = ?auto_23350 ?auto_23353 ) ) ( not ( = ?auto_23350 ?auto_23339 ) ) ( not ( = ?auto_23333 ?auto_23343 ) ) ( not ( = ?auto_23333 ?auto_23340 ) ) ( not ( = ?auto_23333 ?auto_23351 ) ) ( not ( = ?auto_23333 ?auto_23345 ) ) ( not ( = ?auto_23333 ?auto_23355 ) ) ( not ( = ?auto_23333 ?auto_23336 ) ) ( not ( = ?auto_23333 ?auto_23342 ) ) ( not ( = ?auto_23314 ?auto_23323 ) ) ( not ( = ?auto_23314 ?auto_23348 ) ) ( not ( = ?auto_23315 ?auto_23323 ) ) ( not ( = ?auto_23315 ?auto_23348 ) ) ( not ( = ?auto_23316 ?auto_23323 ) ) ( not ( = ?auto_23316 ?auto_23348 ) ) ( not ( = ?auto_23317 ?auto_23323 ) ) ( not ( = ?auto_23317 ?auto_23348 ) ) ( not ( = ?auto_23318 ?auto_23323 ) ) ( not ( = ?auto_23318 ?auto_23348 ) ) ( not ( = ?auto_23319 ?auto_23323 ) ) ( not ( = ?auto_23319 ?auto_23348 ) ) ( not ( = ?auto_23320 ?auto_23323 ) ) ( not ( = ?auto_23320 ?auto_23348 ) ) ( not ( = ?auto_23321 ?auto_23323 ) ) ( not ( = ?auto_23321 ?auto_23348 ) ) ( not ( = ?auto_23323 ?auto_23333 ) ) ( not ( = ?auto_23323 ?auto_23343 ) ) ( not ( = ?auto_23323 ?auto_23340 ) ) ( not ( = ?auto_23323 ?auto_23351 ) ) ( not ( = ?auto_23323 ?auto_23345 ) ) ( not ( = ?auto_23323 ?auto_23355 ) ) ( not ( = ?auto_23323 ?auto_23336 ) ) ( not ( = ?auto_23323 ?auto_23342 ) ) ( not ( = ?auto_23354 ?auto_23352 ) ) ( not ( = ?auto_23354 ?auto_23349 ) ) ( not ( = ?auto_23354 ?auto_23357 ) ) ( not ( = ?auto_23354 ?auto_23335 ) ) ( not ( = ?auto_23354 ?auto_23341 ) ) ( not ( = ?auto_23354 ?auto_23344 ) ) ( not ( = ?auto_23354 ?auto_23347 ) ) ( not ( = ?auto_23334 ?auto_23350 ) ) ( not ( = ?auto_23334 ?auto_23337 ) ) ( not ( = ?auto_23334 ?auto_23346 ) ) ( not ( = ?auto_23334 ?auto_23356 ) ) ( not ( = ?auto_23334 ?auto_23338 ) ) ( not ( = ?auto_23334 ?auto_23353 ) ) ( not ( = ?auto_23334 ?auto_23339 ) ) ( not ( = ?auto_23348 ?auto_23333 ) ) ( not ( = ?auto_23348 ?auto_23343 ) ) ( not ( = ?auto_23348 ?auto_23340 ) ) ( not ( = ?auto_23348 ?auto_23351 ) ) ( not ( = ?auto_23348 ?auto_23345 ) ) ( not ( = ?auto_23348 ?auto_23355 ) ) ( not ( = ?auto_23348 ?auto_23336 ) ) ( not ( = ?auto_23348 ?auto_23342 ) ) ( not ( = ?auto_23314 ?auto_23324 ) ) ( not ( = ?auto_23314 ?auto_23332 ) ) ( not ( = ?auto_23315 ?auto_23324 ) ) ( not ( = ?auto_23315 ?auto_23332 ) ) ( not ( = ?auto_23316 ?auto_23324 ) ) ( not ( = ?auto_23316 ?auto_23332 ) ) ( not ( = ?auto_23317 ?auto_23324 ) ) ( not ( = ?auto_23317 ?auto_23332 ) ) ( not ( = ?auto_23318 ?auto_23324 ) ) ( not ( = ?auto_23318 ?auto_23332 ) ) ( not ( = ?auto_23319 ?auto_23324 ) ) ( not ( = ?auto_23319 ?auto_23332 ) ) ( not ( = ?auto_23320 ?auto_23324 ) ) ( not ( = ?auto_23320 ?auto_23332 ) ) ( not ( = ?auto_23321 ?auto_23324 ) ) ( not ( = ?auto_23321 ?auto_23332 ) ) ( not ( = ?auto_23322 ?auto_23324 ) ) ( not ( = ?auto_23322 ?auto_23332 ) ) ( not ( = ?auto_23324 ?auto_23348 ) ) ( not ( = ?auto_23324 ?auto_23333 ) ) ( not ( = ?auto_23324 ?auto_23343 ) ) ( not ( = ?auto_23324 ?auto_23340 ) ) ( not ( = ?auto_23324 ?auto_23351 ) ) ( not ( = ?auto_23324 ?auto_23345 ) ) ( not ( = ?auto_23324 ?auto_23355 ) ) ( not ( = ?auto_23324 ?auto_23336 ) ) ( not ( = ?auto_23324 ?auto_23342 ) ) ( not ( = ?auto_23332 ?auto_23348 ) ) ( not ( = ?auto_23332 ?auto_23333 ) ) ( not ( = ?auto_23332 ?auto_23343 ) ) ( not ( = ?auto_23332 ?auto_23340 ) ) ( not ( = ?auto_23332 ?auto_23351 ) ) ( not ( = ?auto_23332 ?auto_23345 ) ) ( not ( = ?auto_23332 ?auto_23355 ) ) ( not ( = ?auto_23332 ?auto_23336 ) ) ( not ( = ?auto_23332 ?auto_23342 ) ) ( not ( = ?auto_23314 ?auto_23325 ) ) ( not ( = ?auto_23314 ?auto_23331 ) ) ( not ( = ?auto_23315 ?auto_23325 ) ) ( not ( = ?auto_23315 ?auto_23331 ) ) ( not ( = ?auto_23316 ?auto_23325 ) ) ( not ( = ?auto_23316 ?auto_23331 ) ) ( not ( = ?auto_23317 ?auto_23325 ) ) ( not ( = ?auto_23317 ?auto_23331 ) ) ( not ( = ?auto_23318 ?auto_23325 ) ) ( not ( = ?auto_23318 ?auto_23331 ) ) ( not ( = ?auto_23319 ?auto_23325 ) ) ( not ( = ?auto_23319 ?auto_23331 ) ) ( not ( = ?auto_23320 ?auto_23325 ) ) ( not ( = ?auto_23320 ?auto_23331 ) ) ( not ( = ?auto_23321 ?auto_23325 ) ) ( not ( = ?auto_23321 ?auto_23331 ) ) ( not ( = ?auto_23322 ?auto_23325 ) ) ( not ( = ?auto_23322 ?auto_23331 ) ) ( not ( = ?auto_23323 ?auto_23325 ) ) ( not ( = ?auto_23323 ?auto_23331 ) ) ( not ( = ?auto_23325 ?auto_23332 ) ) ( not ( = ?auto_23325 ?auto_23348 ) ) ( not ( = ?auto_23325 ?auto_23333 ) ) ( not ( = ?auto_23325 ?auto_23343 ) ) ( not ( = ?auto_23325 ?auto_23340 ) ) ( not ( = ?auto_23325 ?auto_23351 ) ) ( not ( = ?auto_23325 ?auto_23345 ) ) ( not ( = ?auto_23325 ?auto_23355 ) ) ( not ( = ?auto_23325 ?auto_23336 ) ) ( not ( = ?auto_23325 ?auto_23342 ) ) ( not ( = ?auto_23328 ?auto_23357 ) ) ( not ( = ?auto_23328 ?auto_23354 ) ) ( not ( = ?auto_23328 ?auto_23352 ) ) ( not ( = ?auto_23328 ?auto_23349 ) ) ( not ( = ?auto_23328 ?auto_23335 ) ) ( not ( = ?auto_23328 ?auto_23341 ) ) ( not ( = ?auto_23328 ?auto_23344 ) ) ( not ( = ?auto_23328 ?auto_23347 ) ) ( not ( = ?auto_23330 ?auto_23346 ) ) ( not ( = ?auto_23330 ?auto_23334 ) ) ( not ( = ?auto_23330 ?auto_23350 ) ) ( not ( = ?auto_23330 ?auto_23337 ) ) ( not ( = ?auto_23330 ?auto_23356 ) ) ( not ( = ?auto_23330 ?auto_23338 ) ) ( not ( = ?auto_23330 ?auto_23353 ) ) ( not ( = ?auto_23330 ?auto_23339 ) ) ( not ( = ?auto_23331 ?auto_23332 ) ) ( not ( = ?auto_23331 ?auto_23348 ) ) ( not ( = ?auto_23331 ?auto_23333 ) ) ( not ( = ?auto_23331 ?auto_23343 ) ) ( not ( = ?auto_23331 ?auto_23340 ) ) ( not ( = ?auto_23331 ?auto_23351 ) ) ( not ( = ?auto_23331 ?auto_23345 ) ) ( not ( = ?auto_23331 ?auto_23355 ) ) ( not ( = ?auto_23331 ?auto_23336 ) ) ( not ( = ?auto_23331 ?auto_23342 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_23314 ?auto_23315 ?auto_23316 ?auto_23317 ?auto_23318 ?auto_23319 ?auto_23320 ?auto_23321 ?auto_23322 ?auto_23323 ?auto_23324 )
      ( MAKE-1CRATE ?auto_23324 ?auto_23325 )
      ( MAKE-11CRATE-VERIFY ?auto_23314 ?auto_23315 ?auto_23316 ?auto_23317 ?auto_23318 ?auto_23319 ?auto_23320 ?auto_23321 ?auto_23322 ?auto_23323 ?auto_23324 ?auto_23325 ) )
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
      ?auto_23397 - HOIST
      ?auto_23398 - PLACE
      ?auto_23395 - PLACE
      ?auto_23394 - HOIST
      ?auto_23396 - SURFACE
      ?auto_23424 - PLACE
      ?auto_23412 - HOIST
      ?auto_23425 - SURFACE
      ?auto_23421 - PLACE
      ?auto_23418 - HOIST
      ?auto_23404 - SURFACE
      ?auto_23401 - PLACE
      ?auto_23405 - HOIST
      ?auto_23407 - SURFACE
      ?auto_23409 - PLACE
      ?auto_23413 - HOIST
      ?auto_23426 - SURFACE
      ?auto_23420 - PLACE
      ?auto_23427 - HOIST
      ?auto_23400 - SURFACE
      ?auto_23415 - SURFACE
      ?auto_23403 - PLACE
      ?auto_23406 - HOIST
      ?auto_23402 - SURFACE
      ?auto_23410 - PLACE
      ?auto_23419 - HOIST
      ?auto_23411 - SURFACE
      ?auto_23423 - PLACE
      ?auto_23414 - HOIST
      ?auto_23417 - SURFACE
      ?auto_23428 - SURFACE
      ?auto_23416 - PLACE
      ?auto_23422 - HOIST
      ?auto_23408 - SURFACE
      ?auto_23399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23397 ?auto_23398 ) ( IS-CRATE ?auto_23393 ) ( not ( = ?auto_23395 ?auto_23398 ) ) ( HOIST-AT ?auto_23394 ?auto_23395 ) ( AVAILABLE ?auto_23394 ) ( SURFACE-AT ?auto_23393 ?auto_23395 ) ( ON ?auto_23393 ?auto_23396 ) ( CLEAR ?auto_23393 ) ( not ( = ?auto_23392 ?auto_23393 ) ) ( not ( = ?auto_23392 ?auto_23396 ) ) ( not ( = ?auto_23393 ?auto_23396 ) ) ( not ( = ?auto_23397 ?auto_23394 ) ) ( IS-CRATE ?auto_23392 ) ( not ( = ?auto_23424 ?auto_23398 ) ) ( HOIST-AT ?auto_23412 ?auto_23424 ) ( AVAILABLE ?auto_23412 ) ( SURFACE-AT ?auto_23392 ?auto_23424 ) ( ON ?auto_23392 ?auto_23425 ) ( CLEAR ?auto_23392 ) ( not ( = ?auto_23391 ?auto_23392 ) ) ( not ( = ?auto_23391 ?auto_23425 ) ) ( not ( = ?auto_23392 ?auto_23425 ) ) ( not ( = ?auto_23397 ?auto_23412 ) ) ( IS-CRATE ?auto_23391 ) ( not ( = ?auto_23421 ?auto_23398 ) ) ( HOIST-AT ?auto_23418 ?auto_23421 ) ( SURFACE-AT ?auto_23391 ?auto_23421 ) ( ON ?auto_23391 ?auto_23404 ) ( CLEAR ?auto_23391 ) ( not ( = ?auto_23390 ?auto_23391 ) ) ( not ( = ?auto_23390 ?auto_23404 ) ) ( not ( = ?auto_23391 ?auto_23404 ) ) ( not ( = ?auto_23397 ?auto_23418 ) ) ( IS-CRATE ?auto_23390 ) ( not ( = ?auto_23401 ?auto_23398 ) ) ( HOIST-AT ?auto_23405 ?auto_23401 ) ( AVAILABLE ?auto_23405 ) ( SURFACE-AT ?auto_23390 ?auto_23401 ) ( ON ?auto_23390 ?auto_23407 ) ( CLEAR ?auto_23390 ) ( not ( = ?auto_23389 ?auto_23390 ) ) ( not ( = ?auto_23389 ?auto_23407 ) ) ( not ( = ?auto_23390 ?auto_23407 ) ) ( not ( = ?auto_23397 ?auto_23405 ) ) ( IS-CRATE ?auto_23389 ) ( not ( = ?auto_23409 ?auto_23398 ) ) ( HOIST-AT ?auto_23413 ?auto_23409 ) ( AVAILABLE ?auto_23413 ) ( SURFACE-AT ?auto_23389 ?auto_23409 ) ( ON ?auto_23389 ?auto_23426 ) ( CLEAR ?auto_23389 ) ( not ( = ?auto_23388 ?auto_23389 ) ) ( not ( = ?auto_23388 ?auto_23426 ) ) ( not ( = ?auto_23389 ?auto_23426 ) ) ( not ( = ?auto_23397 ?auto_23413 ) ) ( IS-CRATE ?auto_23388 ) ( not ( = ?auto_23420 ?auto_23398 ) ) ( HOIST-AT ?auto_23427 ?auto_23420 ) ( AVAILABLE ?auto_23427 ) ( SURFACE-AT ?auto_23388 ?auto_23420 ) ( ON ?auto_23388 ?auto_23400 ) ( CLEAR ?auto_23388 ) ( not ( = ?auto_23387 ?auto_23388 ) ) ( not ( = ?auto_23387 ?auto_23400 ) ) ( not ( = ?auto_23388 ?auto_23400 ) ) ( not ( = ?auto_23397 ?auto_23427 ) ) ( IS-CRATE ?auto_23387 ) ( AVAILABLE ?auto_23418 ) ( SURFACE-AT ?auto_23387 ?auto_23421 ) ( ON ?auto_23387 ?auto_23415 ) ( CLEAR ?auto_23387 ) ( not ( = ?auto_23386 ?auto_23387 ) ) ( not ( = ?auto_23386 ?auto_23415 ) ) ( not ( = ?auto_23387 ?auto_23415 ) ) ( IS-CRATE ?auto_23386 ) ( not ( = ?auto_23403 ?auto_23398 ) ) ( HOIST-AT ?auto_23406 ?auto_23403 ) ( SURFACE-AT ?auto_23386 ?auto_23403 ) ( ON ?auto_23386 ?auto_23402 ) ( CLEAR ?auto_23386 ) ( not ( = ?auto_23385 ?auto_23386 ) ) ( not ( = ?auto_23385 ?auto_23402 ) ) ( not ( = ?auto_23386 ?auto_23402 ) ) ( not ( = ?auto_23397 ?auto_23406 ) ) ( IS-CRATE ?auto_23385 ) ( not ( = ?auto_23410 ?auto_23398 ) ) ( HOIST-AT ?auto_23419 ?auto_23410 ) ( AVAILABLE ?auto_23419 ) ( SURFACE-AT ?auto_23385 ?auto_23410 ) ( ON ?auto_23385 ?auto_23411 ) ( CLEAR ?auto_23385 ) ( not ( = ?auto_23384 ?auto_23385 ) ) ( not ( = ?auto_23384 ?auto_23411 ) ) ( not ( = ?auto_23385 ?auto_23411 ) ) ( not ( = ?auto_23397 ?auto_23419 ) ) ( IS-CRATE ?auto_23384 ) ( not ( = ?auto_23423 ?auto_23398 ) ) ( HOIST-AT ?auto_23414 ?auto_23423 ) ( AVAILABLE ?auto_23414 ) ( SURFACE-AT ?auto_23384 ?auto_23423 ) ( ON ?auto_23384 ?auto_23417 ) ( CLEAR ?auto_23384 ) ( not ( = ?auto_23383 ?auto_23384 ) ) ( not ( = ?auto_23383 ?auto_23417 ) ) ( not ( = ?auto_23384 ?auto_23417 ) ) ( not ( = ?auto_23397 ?auto_23414 ) ) ( IS-CRATE ?auto_23383 ) ( AVAILABLE ?auto_23406 ) ( SURFACE-AT ?auto_23383 ?auto_23403 ) ( ON ?auto_23383 ?auto_23428 ) ( CLEAR ?auto_23383 ) ( not ( = ?auto_23382 ?auto_23383 ) ) ( not ( = ?auto_23382 ?auto_23428 ) ) ( not ( = ?auto_23383 ?auto_23428 ) ) ( SURFACE-AT ?auto_23381 ?auto_23398 ) ( CLEAR ?auto_23381 ) ( IS-CRATE ?auto_23382 ) ( AVAILABLE ?auto_23397 ) ( not ( = ?auto_23416 ?auto_23398 ) ) ( HOIST-AT ?auto_23422 ?auto_23416 ) ( AVAILABLE ?auto_23422 ) ( SURFACE-AT ?auto_23382 ?auto_23416 ) ( ON ?auto_23382 ?auto_23408 ) ( CLEAR ?auto_23382 ) ( TRUCK-AT ?auto_23399 ?auto_23398 ) ( not ( = ?auto_23381 ?auto_23382 ) ) ( not ( = ?auto_23381 ?auto_23408 ) ) ( not ( = ?auto_23382 ?auto_23408 ) ) ( not ( = ?auto_23397 ?auto_23422 ) ) ( not ( = ?auto_23381 ?auto_23383 ) ) ( not ( = ?auto_23381 ?auto_23428 ) ) ( not ( = ?auto_23383 ?auto_23408 ) ) ( not ( = ?auto_23403 ?auto_23416 ) ) ( not ( = ?auto_23406 ?auto_23422 ) ) ( not ( = ?auto_23428 ?auto_23408 ) ) ( not ( = ?auto_23381 ?auto_23384 ) ) ( not ( = ?auto_23381 ?auto_23417 ) ) ( not ( = ?auto_23382 ?auto_23384 ) ) ( not ( = ?auto_23382 ?auto_23417 ) ) ( not ( = ?auto_23384 ?auto_23428 ) ) ( not ( = ?auto_23384 ?auto_23408 ) ) ( not ( = ?auto_23423 ?auto_23403 ) ) ( not ( = ?auto_23423 ?auto_23416 ) ) ( not ( = ?auto_23414 ?auto_23406 ) ) ( not ( = ?auto_23414 ?auto_23422 ) ) ( not ( = ?auto_23417 ?auto_23428 ) ) ( not ( = ?auto_23417 ?auto_23408 ) ) ( not ( = ?auto_23381 ?auto_23385 ) ) ( not ( = ?auto_23381 ?auto_23411 ) ) ( not ( = ?auto_23382 ?auto_23385 ) ) ( not ( = ?auto_23382 ?auto_23411 ) ) ( not ( = ?auto_23383 ?auto_23385 ) ) ( not ( = ?auto_23383 ?auto_23411 ) ) ( not ( = ?auto_23385 ?auto_23417 ) ) ( not ( = ?auto_23385 ?auto_23428 ) ) ( not ( = ?auto_23385 ?auto_23408 ) ) ( not ( = ?auto_23410 ?auto_23423 ) ) ( not ( = ?auto_23410 ?auto_23403 ) ) ( not ( = ?auto_23410 ?auto_23416 ) ) ( not ( = ?auto_23419 ?auto_23414 ) ) ( not ( = ?auto_23419 ?auto_23406 ) ) ( not ( = ?auto_23419 ?auto_23422 ) ) ( not ( = ?auto_23411 ?auto_23417 ) ) ( not ( = ?auto_23411 ?auto_23428 ) ) ( not ( = ?auto_23411 ?auto_23408 ) ) ( not ( = ?auto_23381 ?auto_23386 ) ) ( not ( = ?auto_23381 ?auto_23402 ) ) ( not ( = ?auto_23382 ?auto_23386 ) ) ( not ( = ?auto_23382 ?auto_23402 ) ) ( not ( = ?auto_23383 ?auto_23386 ) ) ( not ( = ?auto_23383 ?auto_23402 ) ) ( not ( = ?auto_23384 ?auto_23386 ) ) ( not ( = ?auto_23384 ?auto_23402 ) ) ( not ( = ?auto_23386 ?auto_23411 ) ) ( not ( = ?auto_23386 ?auto_23417 ) ) ( not ( = ?auto_23386 ?auto_23428 ) ) ( not ( = ?auto_23386 ?auto_23408 ) ) ( not ( = ?auto_23402 ?auto_23411 ) ) ( not ( = ?auto_23402 ?auto_23417 ) ) ( not ( = ?auto_23402 ?auto_23428 ) ) ( not ( = ?auto_23402 ?auto_23408 ) ) ( not ( = ?auto_23381 ?auto_23387 ) ) ( not ( = ?auto_23381 ?auto_23415 ) ) ( not ( = ?auto_23382 ?auto_23387 ) ) ( not ( = ?auto_23382 ?auto_23415 ) ) ( not ( = ?auto_23383 ?auto_23387 ) ) ( not ( = ?auto_23383 ?auto_23415 ) ) ( not ( = ?auto_23384 ?auto_23387 ) ) ( not ( = ?auto_23384 ?auto_23415 ) ) ( not ( = ?auto_23385 ?auto_23387 ) ) ( not ( = ?auto_23385 ?auto_23415 ) ) ( not ( = ?auto_23387 ?auto_23402 ) ) ( not ( = ?auto_23387 ?auto_23411 ) ) ( not ( = ?auto_23387 ?auto_23417 ) ) ( not ( = ?auto_23387 ?auto_23428 ) ) ( not ( = ?auto_23387 ?auto_23408 ) ) ( not ( = ?auto_23421 ?auto_23403 ) ) ( not ( = ?auto_23421 ?auto_23410 ) ) ( not ( = ?auto_23421 ?auto_23423 ) ) ( not ( = ?auto_23421 ?auto_23416 ) ) ( not ( = ?auto_23418 ?auto_23406 ) ) ( not ( = ?auto_23418 ?auto_23419 ) ) ( not ( = ?auto_23418 ?auto_23414 ) ) ( not ( = ?auto_23418 ?auto_23422 ) ) ( not ( = ?auto_23415 ?auto_23402 ) ) ( not ( = ?auto_23415 ?auto_23411 ) ) ( not ( = ?auto_23415 ?auto_23417 ) ) ( not ( = ?auto_23415 ?auto_23428 ) ) ( not ( = ?auto_23415 ?auto_23408 ) ) ( not ( = ?auto_23381 ?auto_23388 ) ) ( not ( = ?auto_23381 ?auto_23400 ) ) ( not ( = ?auto_23382 ?auto_23388 ) ) ( not ( = ?auto_23382 ?auto_23400 ) ) ( not ( = ?auto_23383 ?auto_23388 ) ) ( not ( = ?auto_23383 ?auto_23400 ) ) ( not ( = ?auto_23384 ?auto_23388 ) ) ( not ( = ?auto_23384 ?auto_23400 ) ) ( not ( = ?auto_23385 ?auto_23388 ) ) ( not ( = ?auto_23385 ?auto_23400 ) ) ( not ( = ?auto_23386 ?auto_23388 ) ) ( not ( = ?auto_23386 ?auto_23400 ) ) ( not ( = ?auto_23388 ?auto_23415 ) ) ( not ( = ?auto_23388 ?auto_23402 ) ) ( not ( = ?auto_23388 ?auto_23411 ) ) ( not ( = ?auto_23388 ?auto_23417 ) ) ( not ( = ?auto_23388 ?auto_23428 ) ) ( not ( = ?auto_23388 ?auto_23408 ) ) ( not ( = ?auto_23420 ?auto_23421 ) ) ( not ( = ?auto_23420 ?auto_23403 ) ) ( not ( = ?auto_23420 ?auto_23410 ) ) ( not ( = ?auto_23420 ?auto_23423 ) ) ( not ( = ?auto_23420 ?auto_23416 ) ) ( not ( = ?auto_23427 ?auto_23418 ) ) ( not ( = ?auto_23427 ?auto_23406 ) ) ( not ( = ?auto_23427 ?auto_23419 ) ) ( not ( = ?auto_23427 ?auto_23414 ) ) ( not ( = ?auto_23427 ?auto_23422 ) ) ( not ( = ?auto_23400 ?auto_23415 ) ) ( not ( = ?auto_23400 ?auto_23402 ) ) ( not ( = ?auto_23400 ?auto_23411 ) ) ( not ( = ?auto_23400 ?auto_23417 ) ) ( not ( = ?auto_23400 ?auto_23428 ) ) ( not ( = ?auto_23400 ?auto_23408 ) ) ( not ( = ?auto_23381 ?auto_23389 ) ) ( not ( = ?auto_23381 ?auto_23426 ) ) ( not ( = ?auto_23382 ?auto_23389 ) ) ( not ( = ?auto_23382 ?auto_23426 ) ) ( not ( = ?auto_23383 ?auto_23389 ) ) ( not ( = ?auto_23383 ?auto_23426 ) ) ( not ( = ?auto_23384 ?auto_23389 ) ) ( not ( = ?auto_23384 ?auto_23426 ) ) ( not ( = ?auto_23385 ?auto_23389 ) ) ( not ( = ?auto_23385 ?auto_23426 ) ) ( not ( = ?auto_23386 ?auto_23389 ) ) ( not ( = ?auto_23386 ?auto_23426 ) ) ( not ( = ?auto_23387 ?auto_23389 ) ) ( not ( = ?auto_23387 ?auto_23426 ) ) ( not ( = ?auto_23389 ?auto_23400 ) ) ( not ( = ?auto_23389 ?auto_23415 ) ) ( not ( = ?auto_23389 ?auto_23402 ) ) ( not ( = ?auto_23389 ?auto_23411 ) ) ( not ( = ?auto_23389 ?auto_23417 ) ) ( not ( = ?auto_23389 ?auto_23428 ) ) ( not ( = ?auto_23389 ?auto_23408 ) ) ( not ( = ?auto_23409 ?auto_23420 ) ) ( not ( = ?auto_23409 ?auto_23421 ) ) ( not ( = ?auto_23409 ?auto_23403 ) ) ( not ( = ?auto_23409 ?auto_23410 ) ) ( not ( = ?auto_23409 ?auto_23423 ) ) ( not ( = ?auto_23409 ?auto_23416 ) ) ( not ( = ?auto_23413 ?auto_23427 ) ) ( not ( = ?auto_23413 ?auto_23418 ) ) ( not ( = ?auto_23413 ?auto_23406 ) ) ( not ( = ?auto_23413 ?auto_23419 ) ) ( not ( = ?auto_23413 ?auto_23414 ) ) ( not ( = ?auto_23413 ?auto_23422 ) ) ( not ( = ?auto_23426 ?auto_23400 ) ) ( not ( = ?auto_23426 ?auto_23415 ) ) ( not ( = ?auto_23426 ?auto_23402 ) ) ( not ( = ?auto_23426 ?auto_23411 ) ) ( not ( = ?auto_23426 ?auto_23417 ) ) ( not ( = ?auto_23426 ?auto_23428 ) ) ( not ( = ?auto_23426 ?auto_23408 ) ) ( not ( = ?auto_23381 ?auto_23390 ) ) ( not ( = ?auto_23381 ?auto_23407 ) ) ( not ( = ?auto_23382 ?auto_23390 ) ) ( not ( = ?auto_23382 ?auto_23407 ) ) ( not ( = ?auto_23383 ?auto_23390 ) ) ( not ( = ?auto_23383 ?auto_23407 ) ) ( not ( = ?auto_23384 ?auto_23390 ) ) ( not ( = ?auto_23384 ?auto_23407 ) ) ( not ( = ?auto_23385 ?auto_23390 ) ) ( not ( = ?auto_23385 ?auto_23407 ) ) ( not ( = ?auto_23386 ?auto_23390 ) ) ( not ( = ?auto_23386 ?auto_23407 ) ) ( not ( = ?auto_23387 ?auto_23390 ) ) ( not ( = ?auto_23387 ?auto_23407 ) ) ( not ( = ?auto_23388 ?auto_23390 ) ) ( not ( = ?auto_23388 ?auto_23407 ) ) ( not ( = ?auto_23390 ?auto_23426 ) ) ( not ( = ?auto_23390 ?auto_23400 ) ) ( not ( = ?auto_23390 ?auto_23415 ) ) ( not ( = ?auto_23390 ?auto_23402 ) ) ( not ( = ?auto_23390 ?auto_23411 ) ) ( not ( = ?auto_23390 ?auto_23417 ) ) ( not ( = ?auto_23390 ?auto_23428 ) ) ( not ( = ?auto_23390 ?auto_23408 ) ) ( not ( = ?auto_23401 ?auto_23409 ) ) ( not ( = ?auto_23401 ?auto_23420 ) ) ( not ( = ?auto_23401 ?auto_23421 ) ) ( not ( = ?auto_23401 ?auto_23403 ) ) ( not ( = ?auto_23401 ?auto_23410 ) ) ( not ( = ?auto_23401 ?auto_23423 ) ) ( not ( = ?auto_23401 ?auto_23416 ) ) ( not ( = ?auto_23405 ?auto_23413 ) ) ( not ( = ?auto_23405 ?auto_23427 ) ) ( not ( = ?auto_23405 ?auto_23418 ) ) ( not ( = ?auto_23405 ?auto_23406 ) ) ( not ( = ?auto_23405 ?auto_23419 ) ) ( not ( = ?auto_23405 ?auto_23414 ) ) ( not ( = ?auto_23405 ?auto_23422 ) ) ( not ( = ?auto_23407 ?auto_23426 ) ) ( not ( = ?auto_23407 ?auto_23400 ) ) ( not ( = ?auto_23407 ?auto_23415 ) ) ( not ( = ?auto_23407 ?auto_23402 ) ) ( not ( = ?auto_23407 ?auto_23411 ) ) ( not ( = ?auto_23407 ?auto_23417 ) ) ( not ( = ?auto_23407 ?auto_23428 ) ) ( not ( = ?auto_23407 ?auto_23408 ) ) ( not ( = ?auto_23381 ?auto_23391 ) ) ( not ( = ?auto_23381 ?auto_23404 ) ) ( not ( = ?auto_23382 ?auto_23391 ) ) ( not ( = ?auto_23382 ?auto_23404 ) ) ( not ( = ?auto_23383 ?auto_23391 ) ) ( not ( = ?auto_23383 ?auto_23404 ) ) ( not ( = ?auto_23384 ?auto_23391 ) ) ( not ( = ?auto_23384 ?auto_23404 ) ) ( not ( = ?auto_23385 ?auto_23391 ) ) ( not ( = ?auto_23385 ?auto_23404 ) ) ( not ( = ?auto_23386 ?auto_23391 ) ) ( not ( = ?auto_23386 ?auto_23404 ) ) ( not ( = ?auto_23387 ?auto_23391 ) ) ( not ( = ?auto_23387 ?auto_23404 ) ) ( not ( = ?auto_23388 ?auto_23391 ) ) ( not ( = ?auto_23388 ?auto_23404 ) ) ( not ( = ?auto_23389 ?auto_23391 ) ) ( not ( = ?auto_23389 ?auto_23404 ) ) ( not ( = ?auto_23391 ?auto_23407 ) ) ( not ( = ?auto_23391 ?auto_23426 ) ) ( not ( = ?auto_23391 ?auto_23400 ) ) ( not ( = ?auto_23391 ?auto_23415 ) ) ( not ( = ?auto_23391 ?auto_23402 ) ) ( not ( = ?auto_23391 ?auto_23411 ) ) ( not ( = ?auto_23391 ?auto_23417 ) ) ( not ( = ?auto_23391 ?auto_23428 ) ) ( not ( = ?auto_23391 ?auto_23408 ) ) ( not ( = ?auto_23404 ?auto_23407 ) ) ( not ( = ?auto_23404 ?auto_23426 ) ) ( not ( = ?auto_23404 ?auto_23400 ) ) ( not ( = ?auto_23404 ?auto_23415 ) ) ( not ( = ?auto_23404 ?auto_23402 ) ) ( not ( = ?auto_23404 ?auto_23411 ) ) ( not ( = ?auto_23404 ?auto_23417 ) ) ( not ( = ?auto_23404 ?auto_23428 ) ) ( not ( = ?auto_23404 ?auto_23408 ) ) ( not ( = ?auto_23381 ?auto_23392 ) ) ( not ( = ?auto_23381 ?auto_23425 ) ) ( not ( = ?auto_23382 ?auto_23392 ) ) ( not ( = ?auto_23382 ?auto_23425 ) ) ( not ( = ?auto_23383 ?auto_23392 ) ) ( not ( = ?auto_23383 ?auto_23425 ) ) ( not ( = ?auto_23384 ?auto_23392 ) ) ( not ( = ?auto_23384 ?auto_23425 ) ) ( not ( = ?auto_23385 ?auto_23392 ) ) ( not ( = ?auto_23385 ?auto_23425 ) ) ( not ( = ?auto_23386 ?auto_23392 ) ) ( not ( = ?auto_23386 ?auto_23425 ) ) ( not ( = ?auto_23387 ?auto_23392 ) ) ( not ( = ?auto_23387 ?auto_23425 ) ) ( not ( = ?auto_23388 ?auto_23392 ) ) ( not ( = ?auto_23388 ?auto_23425 ) ) ( not ( = ?auto_23389 ?auto_23392 ) ) ( not ( = ?auto_23389 ?auto_23425 ) ) ( not ( = ?auto_23390 ?auto_23392 ) ) ( not ( = ?auto_23390 ?auto_23425 ) ) ( not ( = ?auto_23392 ?auto_23404 ) ) ( not ( = ?auto_23392 ?auto_23407 ) ) ( not ( = ?auto_23392 ?auto_23426 ) ) ( not ( = ?auto_23392 ?auto_23400 ) ) ( not ( = ?auto_23392 ?auto_23415 ) ) ( not ( = ?auto_23392 ?auto_23402 ) ) ( not ( = ?auto_23392 ?auto_23411 ) ) ( not ( = ?auto_23392 ?auto_23417 ) ) ( not ( = ?auto_23392 ?auto_23428 ) ) ( not ( = ?auto_23392 ?auto_23408 ) ) ( not ( = ?auto_23424 ?auto_23421 ) ) ( not ( = ?auto_23424 ?auto_23401 ) ) ( not ( = ?auto_23424 ?auto_23409 ) ) ( not ( = ?auto_23424 ?auto_23420 ) ) ( not ( = ?auto_23424 ?auto_23403 ) ) ( not ( = ?auto_23424 ?auto_23410 ) ) ( not ( = ?auto_23424 ?auto_23423 ) ) ( not ( = ?auto_23424 ?auto_23416 ) ) ( not ( = ?auto_23412 ?auto_23418 ) ) ( not ( = ?auto_23412 ?auto_23405 ) ) ( not ( = ?auto_23412 ?auto_23413 ) ) ( not ( = ?auto_23412 ?auto_23427 ) ) ( not ( = ?auto_23412 ?auto_23406 ) ) ( not ( = ?auto_23412 ?auto_23419 ) ) ( not ( = ?auto_23412 ?auto_23414 ) ) ( not ( = ?auto_23412 ?auto_23422 ) ) ( not ( = ?auto_23425 ?auto_23404 ) ) ( not ( = ?auto_23425 ?auto_23407 ) ) ( not ( = ?auto_23425 ?auto_23426 ) ) ( not ( = ?auto_23425 ?auto_23400 ) ) ( not ( = ?auto_23425 ?auto_23415 ) ) ( not ( = ?auto_23425 ?auto_23402 ) ) ( not ( = ?auto_23425 ?auto_23411 ) ) ( not ( = ?auto_23425 ?auto_23417 ) ) ( not ( = ?auto_23425 ?auto_23428 ) ) ( not ( = ?auto_23425 ?auto_23408 ) ) ( not ( = ?auto_23381 ?auto_23393 ) ) ( not ( = ?auto_23381 ?auto_23396 ) ) ( not ( = ?auto_23382 ?auto_23393 ) ) ( not ( = ?auto_23382 ?auto_23396 ) ) ( not ( = ?auto_23383 ?auto_23393 ) ) ( not ( = ?auto_23383 ?auto_23396 ) ) ( not ( = ?auto_23384 ?auto_23393 ) ) ( not ( = ?auto_23384 ?auto_23396 ) ) ( not ( = ?auto_23385 ?auto_23393 ) ) ( not ( = ?auto_23385 ?auto_23396 ) ) ( not ( = ?auto_23386 ?auto_23393 ) ) ( not ( = ?auto_23386 ?auto_23396 ) ) ( not ( = ?auto_23387 ?auto_23393 ) ) ( not ( = ?auto_23387 ?auto_23396 ) ) ( not ( = ?auto_23388 ?auto_23393 ) ) ( not ( = ?auto_23388 ?auto_23396 ) ) ( not ( = ?auto_23389 ?auto_23393 ) ) ( not ( = ?auto_23389 ?auto_23396 ) ) ( not ( = ?auto_23390 ?auto_23393 ) ) ( not ( = ?auto_23390 ?auto_23396 ) ) ( not ( = ?auto_23391 ?auto_23393 ) ) ( not ( = ?auto_23391 ?auto_23396 ) ) ( not ( = ?auto_23393 ?auto_23425 ) ) ( not ( = ?auto_23393 ?auto_23404 ) ) ( not ( = ?auto_23393 ?auto_23407 ) ) ( not ( = ?auto_23393 ?auto_23426 ) ) ( not ( = ?auto_23393 ?auto_23400 ) ) ( not ( = ?auto_23393 ?auto_23415 ) ) ( not ( = ?auto_23393 ?auto_23402 ) ) ( not ( = ?auto_23393 ?auto_23411 ) ) ( not ( = ?auto_23393 ?auto_23417 ) ) ( not ( = ?auto_23393 ?auto_23428 ) ) ( not ( = ?auto_23393 ?auto_23408 ) ) ( not ( = ?auto_23395 ?auto_23424 ) ) ( not ( = ?auto_23395 ?auto_23421 ) ) ( not ( = ?auto_23395 ?auto_23401 ) ) ( not ( = ?auto_23395 ?auto_23409 ) ) ( not ( = ?auto_23395 ?auto_23420 ) ) ( not ( = ?auto_23395 ?auto_23403 ) ) ( not ( = ?auto_23395 ?auto_23410 ) ) ( not ( = ?auto_23395 ?auto_23423 ) ) ( not ( = ?auto_23395 ?auto_23416 ) ) ( not ( = ?auto_23394 ?auto_23412 ) ) ( not ( = ?auto_23394 ?auto_23418 ) ) ( not ( = ?auto_23394 ?auto_23405 ) ) ( not ( = ?auto_23394 ?auto_23413 ) ) ( not ( = ?auto_23394 ?auto_23427 ) ) ( not ( = ?auto_23394 ?auto_23406 ) ) ( not ( = ?auto_23394 ?auto_23419 ) ) ( not ( = ?auto_23394 ?auto_23414 ) ) ( not ( = ?auto_23394 ?auto_23422 ) ) ( not ( = ?auto_23396 ?auto_23425 ) ) ( not ( = ?auto_23396 ?auto_23404 ) ) ( not ( = ?auto_23396 ?auto_23407 ) ) ( not ( = ?auto_23396 ?auto_23426 ) ) ( not ( = ?auto_23396 ?auto_23400 ) ) ( not ( = ?auto_23396 ?auto_23415 ) ) ( not ( = ?auto_23396 ?auto_23402 ) ) ( not ( = ?auto_23396 ?auto_23411 ) ) ( not ( = ?auto_23396 ?auto_23417 ) ) ( not ( = ?auto_23396 ?auto_23428 ) ) ( not ( = ?auto_23396 ?auto_23408 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_23381 ?auto_23382 ?auto_23383 ?auto_23384 ?auto_23385 ?auto_23386 ?auto_23387 ?auto_23388 ?auto_23389 ?auto_23390 ?auto_23391 ?auto_23392 )
      ( MAKE-1CRATE ?auto_23392 ?auto_23393 )
      ( MAKE-12CRATE-VERIFY ?auto_23381 ?auto_23382 ?auto_23383 ?auto_23384 ?auto_23385 ?auto_23386 ?auto_23387 ?auto_23388 ?auto_23389 ?auto_23390 ?auto_23391 ?auto_23392 ?auto_23393 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_23453 - SURFACE
      ?auto_23454 - SURFACE
      ?auto_23455 - SURFACE
      ?auto_23456 - SURFACE
      ?auto_23457 - SURFACE
      ?auto_23458 - SURFACE
      ?auto_23459 - SURFACE
      ?auto_23460 - SURFACE
      ?auto_23461 - SURFACE
      ?auto_23462 - SURFACE
      ?auto_23463 - SURFACE
      ?auto_23464 - SURFACE
      ?auto_23465 - SURFACE
      ?auto_23466 - SURFACE
    )
    :vars
    (
      ?auto_23467 - HOIST
      ?auto_23468 - PLACE
      ?auto_23470 - PLACE
      ?auto_23469 - HOIST
      ?auto_23471 - SURFACE
      ?auto_23478 - PLACE
      ?auto_23499 - HOIST
      ?auto_23474 - SURFACE
      ?auto_23481 - PLACE
      ?auto_23482 - HOIST
      ?auto_23479 - SURFACE
      ?auto_23485 - PLACE
      ?auto_23477 - HOIST
      ?auto_23476 - SURFACE
      ?auto_23493 - PLACE
      ?auto_23500 - HOIST
      ?auto_23486 - SURFACE
      ?auto_23484 - PLACE
      ?auto_23483 - HOIST
      ?auto_23489 - SURFACE
      ?auto_23491 - PLACE
      ?auto_23498 - HOIST
      ?auto_23473 - SURFACE
      ?auto_23492 - SURFACE
      ?auto_23502 - PLACE
      ?auto_23497 - HOIST
      ?auto_23501 - SURFACE
      ?auto_23480 - PLACE
      ?auto_23475 - HOIST
      ?auto_23490 - SURFACE
      ?auto_23495 - SURFACE
      ?auto_23487 - SURFACE
      ?auto_23494 - PLACE
      ?auto_23496 - HOIST
      ?auto_23488 - SURFACE
      ?auto_23472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23467 ?auto_23468 ) ( IS-CRATE ?auto_23466 ) ( not ( = ?auto_23470 ?auto_23468 ) ) ( HOIST-AT ?auto_23469 ?auto_23470 ) ( SURFACE-AT ?auto_23466 ?auto_23470 ) ( ON ?auto_23466 ?auto_23471 ) ( CLEAR ?auto_23466 ) ( not ( = ?auto_23465 ?auto_23466 ) ) ( not ( = ?auto_23465 ?auto_23471 ) ) ( not ( = ?auto_23466 ?auto_23471 ) ) ( not ( = ?auto_23467 ?auto_23469 ) ) ( IS-CRATE ?auto_23465 ) ( not ( = ?auto_23478 ?auto_23468 ) ) ( HOIST-AT ?auto_23499 ?auto_23478 ) ( AVAILABLE ?auto_23499 ) ( SURFACE-AT ?auto_23465 ?auto_23478 ) ( ON ?auto_23465 ?auto_23474 ) ( CLEAR ?auto_23465 ) ( not ( = ?auto_23464 ?auto_23465 ) ) ( not ( = ?auto_23464 ?auto_23474 ) ) ( not ( = ?auto_23465 ?auto_23474 ) ) ( not ( = ?auto_23467 ?auto_23499 ) ) ( IS-CRATE ?auto_23464 ) ( not ( = ?auto_23481 ?auto_23468 ) ) ( HOIST-AT ?auto_23482 ?auto_23481 ) ( AVAILABLE ?auto_23482 ) ( SURFACE-AT ?auto_23464 ?auto_23481 ) ( ON ?auto_23464 ?auto_23479 ) ( CLEAR ?auto_23464 ) ( not ( = ?auto_23463 ?auto_23464 ) ) ( not ( = ?auto_23463 ?auto_23479 ) ) ( not ( = ?auto_23464 ?auto_23479 ) ) ( not ( = ?auto_23467 ?auto_23482 ) ) ( IS-CRATE ?auto_23463 ) ( not ( = ?auto_23485 ?auto_23468 ) ) ( HOIST-AT ?auto_23477 ?auto_23485 ) ( SURFACE-AT ?auto_23463 ?auto_23485 ) ( ON ?auto_23463 ?auto_23476 ) ( CLEAR ?auto_23463 ) ( not ( = ?auto_23462 ?auto_23463 ) ) ( not ( = ?auto_23462 ?auto_23476 ) ) ( not ( = ?auto_23463 ?auto_23476 ) ) ( not ( = ?auto_23467 ?auto_23477 ) ) ( IS-CRATE ?auto_23462 ) ( not ( = ?auto_23493 ?auto_23468 ) ) ( HOIST-AT ?auto_23500 ?auto_23493 ) ( AVAILABLE ?auto_23500 ) ( SURFACE-AT ?auto_23462 ?auto_23493 ) ( ON ?auto_23462 ?auto_23486 ) ( CLEAR ?auto_23462 ) ( not ( = ?auto_23461 ?auto_23462 ) ) ( not ( = ?auto_23461 ?auto_23486 ) ) ( not ( = ?auto_23462 ?auto_23486 ) ) ( not ( = ?auto_23467 ?auto_23500 ) ) ( IS-CRATE ?auto_23461 ) ( not ( = ?auto_23484 ?auto_23468 ) ) ( HOIST-AT ?auto_23483 ?auto_23484 ) ( AVAILABLE ?auto_23483 ) ( SURFACE-AT ?auto_23461 ?auto_23484 ) ( ON ?auto_23461 ?auto_23489 ) ( CLEAR ?auto_23461 ) ( not ( = ?auto_23460 ?auto_23461 ) ) ( not ( = ?auto_23460 ?auto_23489 ) ) ( not ( = ?auto_23461 ?auto_23489 ) ) ( not ( = ?auto_23467 ?auto_23483 ) ) ( IS-CRATE ?auto_23460 ) ( not ( = ?auto_23491 ?auto_23468 ) ) ( HOIST-AT ?auto_23498 ?auto_23491 ) ( AVAILABLE ?auto_23498 ) ( SURFACE-AT ?auto_23460 ?auto_23491 ) ( ON ?auto_23460 ?auto_23473 ) ( CLEAR ?auto_23460 ) ( not ( = ?auto_23459 ?auto_23460 ) ) ( not ( = ?auto_23459 ?auto_23473 ) ) ( not ( = ?auto_23460 ?auto_23473 ) ) ( not ( = ?auto_23467 ?auto_23498 ) ) ( IS-CRATE ?auto_23459 ) ( AVAILABLE ?auto_23477 ) ( SURFACE-AT ?auto_23459 ?auto_23485 ) ( ON ?auto_23459 ?auto_23492 ) ( CLEAR ?auto_23459 ) ( not ( = ?auto_23458 ?auto_23459 ) ) ( not ( = ?auto_23458 ?auto_23492 ) ) ( not ( = ?auto_23459 ?auto_23492 ) ) ( IS-CRATE ?auto_23458 ) ( not ( = ?auto_23502 ?auto_23468 ) ) ( HOIST-AT ?auto_23497 ?auto_23502 ) ( SURFACE-AT ?auto_23458 ?auto_23502 ) ( ON ?auto_23458 ?auto_23501 ) ( CLEAR ?auto_23458 ) ( not ( = ?auto_23457 ?auto_23458 ) ) ( not ( = ?auto_23457 ?auto_23501 ) ) ( not ( = ?auto_23458 ?auto_23501 ) ) ( not ( = ?auto_23467 ?auto_23497 ) ) ( IS-CRATE ?auto_23457 ) ( not ( = ?auto_23480 ?auto_23468 ) ) ( HOIST-AT ?auto_23475 ?auto_23480 ) ( AVAILABLE ?auto_23475 ) ( SURFACE-AT ?auto_23457 ?auto_23480 ) ( ON ?auto_23457 ?auto_23490 ) ( CLEAR ?auto_23457 ) ( not ( = ?auto_23456 ?auto_23457 ) ) ( not ( = ?auto_23456 ?auto_23490 ) ) ( not ( = ?auto_23457 ?auto_23490 ) ) ( not ( = ?auto_23467 ?auto_23475 ) ) ( IS-CRATE ?auto_23456 ) ( AVAILABLE ?auto_23469 ) ( SURFACE-AT ?auto_23456 ?auto_23470 ) ( ON ?auto_23456 ?auto_23495 ) ( CLEAR ?auto_23456 ) ( not ( = ?auto_23455 ?auto_23456 ) ) ( not ( = ?auto_23455 ?auto_23495 ) ) ( not ( = ?auto_23456 ?auto_23495 ) ) ( IS-CRATE ?auto_23455 ) ( AVAILABLE ?auto_23497 ) ( SURFACE-AT ?auto_23455 ?auto_23502 ) ( ON ?auto_23455 ?auto_23487 ) ( CLEAR ?auto_23455 ) ( not ( = ?auto_23454 ?auto_23455 ) ) ( not ( = ?auto_23454 ?auto_23487 ) ) ( not ( = ?auto_23455 ?auto_23487 ) ) ( SURFACE-AT ?auto_23453 ?auto_23468 ) ( CLEAR ?auto_23453 ) ( IS-CRATE ?auto_23454 ) ( AVAILABLE ?auto_23467 ) ( not ( = ?auto_23494 ?auto_23468 ) ) ( HOIST-AT ?auto_23496 ?auto_23494 ) ( AVAILABLE ?auto_23496 ) ( SURFACE-AT ?auto_23454 ?auto_23494 ) ( ON ?auto_23454 ?auto_23488 ) ( CLEAR ?auto_23454 ) ( TRUCK-AT ?auto_23472 ?auto_23468 ) ( not ( = ?auto_23453 ?auto_23454 ) ) ( not ( = ?auto_23453 ?auto_23488 ) ) ( not ( = ?auto_23454 ?auto_23488 ) ) ( not ( = ?auto_23467 ?auto_23496 ) ) ( not ( = ?auto_23453 ?auto_23455 ) ) ( not ( = ?auto_23453 ?auto_23487 ) ) ( not ( = ?auto_23455 ?auto_23488 ) ) ( not ( = ?auto_23502 ?auto_23494 ) ) ( not ( = ?auto_23497 ?auto_23496 ) ) ( not ( = ?auto_23487 ?auto_23488 ) ) ( not ( = ?auto_23453 ?auto_23456 ) ) ( not ( = ?auto_23453 ?auto_23495 ) ) ( not ( = ?auto_23454 ?auto_23456 ) ) ( not ( = ?auto_23454 ?auto_23495 ) ) ( not ( = ?auto_23456 ?auto_23487 ) ) ( not ( = ?auto_23456 ?auto_23488 ) ) ( not ( = ?auto_23470 ?auto_23502 ) ) ( not ( = ?auto_23470 ?auto_23494 ) ) ( not ( = ?auto_23469 ?auto_23497 ) ) ( not ( = ?auto_23469 ?auto_23496 ) ) ( not ( = ?auto_23495 ?auto_23487 ) ) ( not ( = ?auto_23495 ?auto_23488 ) ) ( not ( = ?auto_23453 ?auto_23457 ) ) ( not ( = ?auto_23453 ?auto_23490 ) ) ( not ( = ?auto_23454 ?auto_23457 ) ) ( not ( = ?auto_23454 ?auto_23490 ) ) ( not ( = ?auto_23455 ?auto_23457 ) ) ( not ( = ?auto_23455 ?auto_23490 ) ) ( not ( = ?auto_23457 ?auto_23495 ) ) ( not ( = ?auto_23457 ?auto_23487 ) ) ( not ( = ?auto_23457 ?auto_23488 ) ) ( not ( = ?auto_23480 ?auto_23470 ) ) ( not ( = ?auto_23480 ?auto_23502 ) ) ( not ( = ?auto_23480 ?auto_23494 ) ) ( not ( = ?auto_23475 ?auto_23469 ) ) ( not ( = ?auto_23475 ?auto_23497 ) ) ( not ( = ?auto_23475 ?auto_23496 ) ) ( not ( = ?auto_23490 ?auto_23495 ) ) ( not ( = ?auto_23490 ?auto_23487 ) ) ( not ( = ?auto_23490 ?auto_23488 ) ) ( not ( = ?auto_23453 ?auto_23458 ) ) ( not ( = ?auto_23453 ?auto_23501 ) ) ( not ( = ?auto_23454 ?auto_23458 ) ) ( not ( = ?auto_23454 ?auto_23501 ) ) ( not ( = ?auto_23455 ?auto_23458 ) ) ( not ( = ?auto_23455 ?auto_23501 ) ) ( not ( = ?auto_23456 ?auto_23458 ) ) ( not ( = ?auto_23456 ?auto_23501 ) ) ( not ( = ?auto_23458 ?auto_23490 ) ) ( not ( = ?auto_23458 ?auto_23495 ) ) ( not ( = ?auto_23458 ?auto_23487 ) ) ( not ( = ?auto_23458 ?auto_23488 ) ) ( not ( = ?auto_23501 ?auto_23490 ) ) ( not ( = ?auto_23501 ?auto_23495 ) ) ( not ( = ?auto_23501 ?auto_23487 ) ) ( not ( = ?auto_23501 ?auto_23488 ) ) ( not ( = ?auto_23453 ?auto_23459 ) ) ( not ( = ?auto_23453 ?auto_23492 ) ) ( not ( = ?auto_23454 ?auto_23459 ) ) ( not ( = ?auto_23454 ?auto_23492 ) ) ( not ( = ?auto_23455 ?auto_23459 ) ) ( not ( = ?auto_23455 ?auto_23492 ) ) ( not ( = ?auto_23456 ?auto_23459 ) ) ( not ( = ?auto_23456 ?auto_23492 ) ) ( not ( = ?auto_23457 ?auto_23459 ) ) ( not ( = ?auto_23457 ?auto_23492 ) ) ( not ( = ?auto_23459 ?auto_23501 ) ) ( not ( = ?auto_23459 ?auto_23490 ) ) ( not ( = ?auto_23459 ?auto_23495 ) ) ( not ( = ?auto_23459 ?auto_23487 ) ) ( not ( = ?auto_23459 ?auto_23488 ) ) ( not ( = ?auto_23485 ?auto_23502 ) ) ( not ( = ?auto_23485 ?auto_23480 ) ) ( not ( = ?auto_23485 ?auto_23470 ) ) ( not ( = ?auto_23485 ?auto_23494 ) ) ( not ( = ?auto_23477 ?auto_23497 ) ) ( not ( = ?auto_23477 ?auto_23475 ) ) ( not ( = ?auto_23477 ?auto_23469 ) ) ( not ( = ?auto_23477 ?auto_23496 ) ) ( not ( = ?auto_23492 ?auto_23501 ) ) ( not ( = ?auto_23492 ?auto_23490 ) ) ( not ( = ?auto_23492 ?auto_23495 ) ) ( not ( = ?auto_23492 ?auto_23487 ) ) ( not ( = ?auto_23492 ?auto_23488 ) ) ( not ( = ?auto_23453 ?auto_23460 ) ) ( not ( = ?auto_23453 ?auto_23473 ) ) ( not ( = ?auto_23454 ?auto_23460 ) ) ( not ( = ?auto_23454 ?auto_23473 ) ) ( not ( = ?auto_23455 ?auto_23460 ) ) ( not ( = ?auto_23455 ?auto_23473 ) ) ( not ( = ?auto_23456 ?auto_23460 ) ) ( not ( = ?auto_23456 ?auto_23473 ) ) ( not ( = ?auto_23457 ?auto_23460 ) ) ( not ( = ?auto_23457 ?auto_23473 ) ) ( not ( = ?auto_23458 ?auto_23460 ) ) ( not ( = ?auto_23458 ?auto_23473 ) ) ( not ( = ?auto_23460 ?auto_23492 ) ) ( not ( = ?auto_23460 ?auto_23501 ) ) ( not ( = ?auto_23460 ?auto_23490 ) ) ( not ( = ?auto_23460 ?auto_23495 ) ) ( not ( = ?auto_23460 ?auto_23487 ) ) ( not ( = ?auto_23460 ?auto_23488 ) ) ( not ( = ?auto_23491 ?auto_23485 ) ) ( not ( = ?auto_23491 ?auto_23502 ) ) ( not ( = ?auto_23491 ?auto_23480 ) ) ( not ( = ?auto_23491 ?auto_23470 ) ) ( not ( = ?auto_23491 ?auto_23494 ) ) ( not ( = ?auto_23498 ?auto_23477 ) ) ( not ( = ?auto_23498 ?auto_23497 ) ) ( not ( = ?auto_23498 ?auto_23475 ) ) ( not ( = ?auto_23498 ?auto_23469 ) ) ( not ( = ?auto_23498 ?auto_23496 ) ) ( not ( = ?auto_23473 ?auto_23492 ) ) ( not ( = ?auto_23473 ?auto_23501 ) ) ( not ( = ?auto_23473 ?auto_23490 ) ) ( not ( = ?auto_23473 ?auto_23495 ) ) ( not ( = ?auto_23473 ?auto_23487 ) ) ( not ( = ?auto_23473 ?auto_23488 ) ) ( not ( = ?auto_23453 ?auto_23461 ) ) ( not ( = ?auto_23453 ?auto_23489 ) ) ( not ( = ?auto_23454 ?auto_23461 ) ) ( not ( = ?auto_23454 ?auto_23489 ) ) ( not ( = ?auto_23455 ?auto_23461 ) ) ( not ( = ?auto_23455 ?auto_23489 ) ) ( not ( = ?auto_23456 ?auto_23461 ) ) ( not ( = ?auto_23456 ?auto_23489 ) ) ( not ( = ?auto_23457 ?auto_23461 ) ) ( not ( = ?auto_23457 ?auto_23489 ) ) ( not ( = ?auto_23458 ?auto_23461 ) ) ( not ( = ?auto_23458 ?auto_23489 ) ) ( not ( = ?auto_23459 ?auto_23461 ) ) ( not ( = ?auto_23459 ?auto_23489 ) ) ( not ( = ?auto_23461 ?auto_23473 ) ) ( not ( = ?auto_23461 ?auto_23492 ) ) ( not ( = ?auto_23461 ?auto_23501 ) ) ( not ( = ?auto_23461 ?auto_23490 ) ) ( not ( = ?auto_23461 ?auto_23495 ) ) ( not ( = ?auto_23461 ?auto_23487 ) ) ( not ( = ?auto_23461 ?auto_23488 ) ) ( not ( = ?auto_23484 ?auto_23491 ) ) ( not ( = ?auto_23484 ?auto_23485 ) ) ( not ( = ?auto_23484 ?auto_23502 ) ) ( not ( = ?auto_23484 ?auto_23480 ) ) ( not ( = ?auto_23484 ?auto_23470 ) ) ( not ( = ?auto_23484 ?auto_23494 ) ) ( not ( = ?auto_23483 ?auto_23498 ) ) ( not ( = ?auto_23483 ?auto_23477 ) ) ( not ( = ?auto_23483 ?auto_23497 ) ) ( not ( = ?auto_23483 ?auto_23475 ) ) ( not ( = ?auto_23483 ?auto_23469 ) ) ( not ( = ?auto_23483 ?auto_23496 ) ) ( not ( = ?auto_23489 ?auto_23473 ) ) ( not ( = ?auto_23489 ?auto_23492 ) ) ( not ( = ?auto_23489 ?auto_23501 ) ) ( not ( = ?auto_23489 ?auto_23490 ) ) ( not ( = ?auto_23489 ?auto_23495 ) ) ( not ( = ?auto_23489 ?auto_23487 ) ) ( not ( = ?auto_23489 ?auto_23488 ) ) ( not ( = ?auto_23453 ?auto_23462 ) ) ( not ( = ?auto_23453 ?auto_23486 ) ) ( not ( = ?auto_23454 ?auto_23462 ) ) ( not ( = ?auto_23454 ?auto_23486 ) ) ( not ( = ?auto_23455 ?auto_23462 ) ) ( not ( = ?auto_23455 ?auto_23486 ) ) ( not ( = ?auto_23456 ?auto_23462 ) ) ( not ( = ?auto_23456 ?auto_23486 ) ) ( not ( = ?auto_23457 ?auto_23462 ) ) ( not ( = ?auto_23457 ?auto_23486 ) ) ( not ( = ?auto_23458 ?auto_23462 ) ) ( not ( = ?auto_23458 ?auto_23486 ) ) ( not ( = ?auto_23459 ?auto_23462 ) ) ( not ( = ?auto_23459 ?auto_23486 ) ) ( not ( = ?auto_23460 ?auto_23462 ) ) ( not ( = ?auto_23460 ?auto_23486 ) ) ( not ( = ?auto_23462 ?auto_23489 ) ) ( not ( = ?auto_23462 ?auto_23473 ) ) ( not ( = ?auto_23462 ?auto_23492 ) ) ( not ( = ?auto_23462 ?auto_23501 ) ) ( not ( = ?auto_23462 ?auto_23490 ) ) ( not ( = ?auto_23462 ?auto_23495 ) ) ( not ( = ?auto_23462 ?auto_23487 ) ) ( not ( = ?auto_23462 ?auto_23488 ) ) ( not ( = ?auto_23493 ?auto_23484 ) ) ( not ( = ?auto_23493 ?auto_23491 ) ) ( not ( = ?auto_23493 ?auto_23485 ) ) ( not ( = ?auto_23493 ?auto_23502 ) ) ( not ( = ?auto_23493 ?auto_23480 ) ) ( not ( = ?auto_23493 ?auto_23470 ) ) ( not ( = ?auto_23493 ?auto_23494 ) ) ( not ( = ?auto_23500 ?auto_23483 ) ) ( not ( = ?auto_23500 ?auto_23498 ) ) ( not ( = ?auto_23500 ?auto_23477 ) ) ( not ( = ?auto_23500 ?auto_23497 ) ) ( not ( = ?auto_23500 ?auto_23475 ) ) ( not ( = ?auto_23500 ?auto_23469 ) ) ( not ( = ?auto_23500 ?auto_23496 ) ) ( not ( = ?auto_23486 ?auto_23489 ) ) ( not ( = ?auto_23486 ?auto_23473 ) ) ( not ( = ?auto_23486 ?auto_23492 ) ) ( not ( = ?auto_23486 ?auto_23501 ) ) ( not ( = ?auto_23486 ?auto_23490 ) ) ( not ( = ?auto_23486 ?auto_23495 ) ) ( not ( = ?auto_23486 ?auto_23487 ) ) ( not ( = ?auto_23486 ?auto_23488 ) ) ( not ( = ?auto_23453 ?auto_23463 ) ) ( not ( = ?auto_23453 ?auto_23476 ) ) ( not ( = ?auto_23454 ?auto_23463 ) ) ( not ( = ?auto_23454 ?auto_23476 ) ) ( not ( = ?auto_23455 ?auto_23463 ) ) ( not ( = ?auto_23455 ?auto_23476 ) ) ( not ( = ?auto_23456 ?auto_23463 ) ) ( not ( = ?auto_23456 ?auto_23476 ) ) ( not ( = ?auto_23457 ?auto_23463 ) ) ( not ( = ?auto_23457 ?auto_23476 ) ) ( not ( = ?auto_23458 ?auto_23463 ) ) ( not ( = ?auto_23458 ?auto_23476 ) ) ( not ( = ?auto_23459 ?auto_23463 ) ) ( not ( = ?auto_23459 ?auto_23476 ) ) ( not ( = ?auto_23460 ?auto_23463 ) ) ( not ( = ?auto_23460 ?auto_23476 ) ) ( not ( = ?auto_23461 ?auto_23463 ) ) ( not ( = ?auto_23461 ?auto_23476 ) ) ( not ( = ?auto_23463 ?auto_23486 ) ) ( not ( = ?auto_23463 ?auto_23489 ) ) ( not ( = ?auto_23463 ?auto_23473 ) ) ( not ( = ?auto_23463 ?auto_23492 ) ) ( not ( = ?auto_23463 ?auto_23501 ) ) ( not ( = ?auto_23463 ?auto_23490 ) ) ( not ( = ?auto_23463 ?auto_23495 ) ) ( not ( = ?auto_23463 ?auto_23487 ) ) ( not ( = ?auto_23463 ?auto_23488 ) ) ( not ( = ?auto_23476 ?auto_23486 ) ) ( not ( = ?auto_23476 ?auto_23489 ) ) ( not ( = ?auto_23476 ?auto_23473 ) ) ( not ( = ?auto_23476 ?auto_23492 ) ) ( not ( = ?auto_23476 ?auto_23501 ) ) ( not ( = ?auto_23476 ?auto_23490 ) ) ( not ( = ?auto_23476 ?auto_23495 ) ) ( not ( = ?auto_23476 ?auto_23487 ) ) ( not ( = ?auto_23476 ?auto_23488 ) ) ( not ( = ?auto_23453 ?auto_23464 ) ) ( not ( = ?auto_23453 ?auto_23479 ) ) ( not ( = ?auto_23454 ?auto_23464 ) ) ( not ( = ?auto_23454 ?auto_23479 ) ) ( not ( = ?auto_23455 ?auto_23464 ) ) ( not ( = ?auto_23455 ?auto_23479 ) ) ( not ( = ?auto_23456 ?auto_23464 ) ) ( not ( = ?auto_23456 ?auto_23479 ) ) ( not ( = ?auto_23457 ?auto_23464 ) ) ( not ( = ?auto_23457 ?auto_23479 ) ) ( not ( = ?auto_23458 ?auto_23464 ) ) ( not ( = ?auto_23458 ?auto_23479 ) ) ( not ( = ?auto_23459 ?auto_23464 ) ) ( not ( = ?auto_23459 ?auto_23479 ) ) ( not ( = ?auto_23460 ?auto_23464 ) ) ( not ( = ?auto_23460 ?auto_23479 ) ) ( not ( = ?auto_23461 ?auto_23464 ) ) ( not ( = ?auto_23461 ?auto_23479 ) ) ( not ( = ?auto_23462 ?auto_23464 ) ) ( not ( = ?auto_23462 ?auto_23479 ) ) ( not ( = ?auto_23464 ?auto_23476 ) ) ( not ( = ?auto_23464 ?auto_23486 ) ) ( not ( = ?auto_23464 ?auto_23489 ) ) ( not ( = ?auto_23464 ?auto_23473 ) ) ( not ( = ?auto_23464 ?auto_23492 ) ) ( not ( = ?auto_23464 ?auto_23501 ) ) ( not ( = ?auto_23464 ?auto_23490 ) ) ( not ( = ?auto_23464 ?auto_23495 ) ) ( not ( = ?auto_23464 ?auto_23487 ) ) ( not ( = ?auto_23464 ?auto_23488 ) ) ( not ( = ?auto_23481 ?auto_23485 ) ) ( not ( = ?auto_23481 ?auto_23493 ) ) ( not ( = ?auto_23481 ?auto_23484 ) ) ( not ( = ?auto_23481 ?auto_23491 ) ) ( not ( = ?auto_23481 ?auto_23502 ) ) ( not ( = ?auto_23481 ?auto_23480 ) ) ( not ( = ?auto_23481 ?auto_23470 ) ) ( not ( = ?auto_23481 ?auto_23494 ) ) ( not ( = ?auto_23482 ?auto_23477 ) ) ( not ( = ?auto_23482 ?auto_23500 ) ) ( not ( = ?auto_23482 ?auto_23483 ) ) ( not ( = ?auto_23482 ?auto_23498 ) ) ( not ( = ?auto_23482 ?auto_23497 ) ) ( not ( = ?auto_23482 ?auto_23475 ) ) ( not ( = ?auto_23482 ?auto_23469 ) ) ( not ( = ?auto_23482 ?auto_23496 ) ) ( not ( = ?auto_23479 ?auto_23476 ) ) ( not ( = ?auto_23479 ?auto_23486 ) ) ( not ( = ?auto_23479 ?auto_23489 ) ) ( not ( = ?auto_23479 ?auto_23473 ) ) ( not ( = ?auto_23479 ?auto_23492 ) ) ( not ( = ?auto_23479 ?auto_23501 ) ) ( not ( = ?auto_23479 ?auto_23490 ) ) ( not ( = ?auto_23479 ?auto_23495 ) ) ( not ( = ?auto_23479 ?auto_23487 ) ) ( not ( = ?auto_23479 ?auto_23488 ) ) ( not ( = ?auto_23453 ?auto_23465 ) ) ( not ( = ?auto_23453 ?auto_23474 ) ) ( not ( = ?auto_23454 ?auto_23465 ) ) ( not ( = ?auto_23454 ?auto_23474 ) ) ( not ( = ?auto_23455 ?auto_23465 ) ) ( not ( = ?auto_23455 ?auto_23474 ) ) ( not ( = ?auto_23456 ?auto_23465 ) ) ( not ( = ?auto_23456 ?auto_23474 ) ) ( not ( = ?auto_23457 ?auto_23465 ) ) ( not ( = ?auto_23457 ?auto_23474 ) ) ( not ( = ?auto_23458 ?auto_23465 ) ) ( not ( = ?auto_23458 ?auto_23474 ) ) ( not ( = ?auto_23459 ?auto_23465 ) ) ( not ( = ?auto_23459 ?auto_23474 ) ) ( not ( = ?auto_23460 ?auto_23465 ) ) ( not ( = ?auto_23460 ?auto_23474 ) ) ( not ( = ?auto_23461 ?auto_23465 ) ) ( not ( = ?auto_23461 ?auto_23474 ) ) ( not ( = ?auto_23462 ?auto_23465 ) ) ( not ( = ?auto_23462 ?auto_23474 ) ) ( not ( = ?auto_23463 ?auto_23465 ) ) ( not ( = ?auto_23463 ?auto_23474 ) ) ( not ( = ?auto_23465 ?auto_23479 ) ) ( not ( = ?auto_23465 ?auto_23476 ) ) ( not ( = ?auto_23465 ?auto_23486 ) ) ( not ( = ?auto_23465 ?auto_23489 ) ) ( not ( = ?auto_23465 ?auto_23473 ) ) ( not ( = ?auto_23465 ?auto_23492 ) ) ( not ( = ?auto_23465 ?auto_23501 ) ) ( not ( = ?auto_23465 ?auto_23490 ) ) ( not ( = ?auto_23465 ?auto_23495 ) ) ( not ( = ?auto_23465 ?auto_23487 ) ) ( not ( = ?auto_23465 ?auto_23488 ) ) ( not ( = ?auto_23478 ?auto_23481 ) ) ( not ( = ?auto_23478 ?auto_23485 ) ) ( not ( = ?auto_23478 ?auto_23493 ) ) ( not ( = ?auto_23478 ?auto_23484 ) ) ( not ( = ?auto_23478 ?auto_23491 ) ) ( not ( = ?auto_23478 ?auto_23502 ) ) ( not ( = ?auto_23478 ?auto_23480 ) ) ( not ( = ?auto_23478 ?auto_23470 ) ) ( not ( = ?auto_23478 ?auto_23494 ) ) ( not ( = ?auto_23499 ?auto_23482 ) ) ( not ( = ?auto_23499 ?auto_23477 ) ) ( not ( = ?auto_23499 ?auto_23500 ) ) ( not ( = ?auto_23499 ?auto_23483 ) ) ( not ( = ?auto_23499 ?auto_23498 ) ) ( not ( = ?auto_23499 ?auto_23497 ) ) ( not ( = ?auto_23499 ?auto_23475 ) ) ( not ( = ?auto_23499 ?auto_23469 ) ) ( not ( = ?auto_23499 ?auto_23496 ) ) ( not ( = ?auto_23474 ?auto_23479 ) ) ( not ( = ?auto_23474 ?auto_23476 ) ) ( not ( = ?auto_23474 ?auto_23486 ) ) ( not ( = ?auto_23474 ?auto_23489 ) ) ( not ( = ?auto_23474 ?auto_23473 ) ) ( not ( = ?auto_23474 ?auto_23492 ) ) ( not ( = ?auto_23474 ?auto_23501 ) ) ( not ( = ?auto_23474 ?auto_23490 ) ) ( not ( = ?auto_23474 ?auto_23495 ) ) ( not ( = ?auto_23474 ?auto_23487 ) ) ( not ( = ?auto_23474 ?auto_23488 ) ) ( not ( = ?auto_23453 ?auto_23466 ) ) ( not ( = ?auto_23453 ?auto_23471 ) ) ( not ( = ?auto_23454 ?auto_23466 ) ) ( not ( = ?auto_23454 ?auto_23471 ) ) ( not ( = ?auto_23455 ?auto_23466 ) ) ( not ( = ?auto_23455 ?auto_23471 ) ) ( not ( = ?auto_23456 ?auto_23466 ) ) ( not ( = ?auto_23456 ?auto_23471 ) ) ( not ( = ?auto_23457 ?auto_23466 ) ) ( not ( = ?auto_23457 ?auto_23471 ) ) ( not ( = ?auto_23458 ?auto_23466 ) ) ( not ( = ?auto_23458 ?auto_23471 ) ) ( not ( = ?auto_23459 ?auto_23466 ) ) ( not ( = ?auto_23459 ?auto_23471 ) ) ( not ( = ?auto_23460 ?auto_23466 ) ) ( not ( = ?auto_23460 ?auto_23471 ) ) ( not ( = ?auto_23461 ?auto_23466 ) ) ( not ( = ?auto_23461 ?auto_23471 ) ) ( not ( = ?auto_23462 ?auto_23466 ) ) ( not ( = ?auto_23462 ?auto_23471 ) ) ( not ( = ?auto_23463 ?auto_23466 ) ) ( not ( = ?auto_23463 ?auto_23471 ) ) ( not ( = ?auto_23464 ?auto_23466 ) ) ( not ( = ?auto_23464 ?auto_23471 ) ) ( not ( = ?auto_23466 ?auto_23474 ) ) ( not ( = ?auto_23466 ?auto_23479 ) ) ( not ( = ?auto_23466 ?auto_23476 ) ) ( not ( = ?auto_23466 ?auto_23486 ) ) ( not ( = ?auto_23466 ?auto_23489 ) ) ( not ( = ?auto_23466 ?auto_23473 ) ) ( not ( = ?auto_23466 ?auto_23492 ) ) ( not ( = ?auto_23466 ?auto_23501 ) ) ( not ( = ?auto_23466 ?auto_23490 ) ) ( not ( = ?auto_23466 ?auto_23495 ) ) ( not ( = ?auto_23466 ?auto_23487 ) ) ( not ( = ?auto_23466 ?auto_23488 ) ) ( not ( = ?auto_23471 ?auto_23474 ) ) ( not ( = ?auto_23471 ?auto_23479 ) ) ( not ( = ?auto_23471 ?auto_23476 ) ) ( not ( = ?auto_23471 ?auto_23486 ) ) ( not ( = ?auto_23471 ?auto_23489 ) ) ( not ( = ?auto_23471 ?auto_23473 ) ) ( not ( = ?auto_23471 ?auto_23492 ) ) ( not ( = ?auto_23471 ?auto_23501 ) ) ( not ( = ?auto_23471 ?auto_23490 ) ) ( not ( = ?auto_23471 ?auto_23495 ) ) ( not ( = ?auto_23471 ?auto_23487 ) ) ( not ( = ?auto_23471 ?auto_23488 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_23453 ?auto_23454 ?auto_23455 ?auto_23456 ?auto_23457 ?auto_23458 ?auto_23459 ?auto_23460 ?auto_23461 ?auto_23462 ?auto_23463 ?auto_23464 ?auto_23465 )
      ( MAKE-1CRATE ?auto_23465 ?auto_23466 )
      ( MAKE-13CRATE-VERIFY ?auto_23453 ?auto_23454 ?auto_23455 ?auto_23456 ?auto_23457 ?auto_23458 ?auto_23459 ?auto_23460 ?auto_23461 ?auto_23462 ?auto_23463 ?auto_23464 ?auto_23465 ?auto_23466 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_23528 - SURFACE
      ?auto_23529 - SURFACE
      ?auto_23530 - SURFACE
      ?auto_23531 - SURFACE
      ?auto_23532 - SURFACE
      ?auto_23533 - SURFACE
      ?auto_23534 - SURFACE
      ?auto_23535 - SURFACE
      ?auto_23536 - SURFACE
      ?auto_23537 - SURFACE
      ?auto_23538 - SURFACE
      ?auto_23539 - SURFACE
      ?auto_23540 - SURFACE
      ?auto_23542 - SURFACE
      ?auto_23541 - SURFACE
    )
    :vars
    (
      ?auto_23547 - HOIST
      ?auto_23543 - PLACE
      ?auto_23548 - PLACE
      ?auto_23544 - HOIST
      ?auto_23545 - SURFACE
      ?auto_23561 - PLACE
      ?auto_23550 - HOIST
      ?auto_23580 - SURFACE
      ?auto_23569 - PLACE
      ?auto_23575 - HOIST
      ?auto_23574 - SURFACE
      ?auto_23557 - PLACE
      ?auto_23568 - HOIST
      ?auto_23549 - SURFACE
      ?auto_23570 - PLACE
      ?auto_23573 - HOIST
      ?auto_23572 - SURFACE
      ?auto_23552 - PLACE
      ?auto_23559 - HOIST
      ?auto_23558 - SURFACE
      ?auto_23560 - PLACE
      ?auto_23571 - HOIST
      ?auto_23553 - SURFACE
      ?auto_23567 - PLACE
      ?auto_23566 - HOIST
      ?auto_23577 - SURFACE
      ?auto_23564 - SURFACE
      ?auto_23551 - PLACE
      ?auto_23565 - HOIST
      ?auto_23576 - SURFACE
      ?auto_23555 - PLACE
      ?auto_23578 - HOIST
      ?auto_23563 - SURFACE
      ?auto_23579 - SURFACE
      ?auto_23556 - SURFACE
      ?auto_23581 - PLACE
      ?auto_23562 - HOIST
      ?auto_23554 - SURFACE
      ?auto_23546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23547 ?auto_23543 ) ( IS-CRATE ?auto_23541 ) ( not ( = ?auto_23548 ?auto_23543 ) ) ( HOIST-AT ?auto_23544 ?auto_23548 ) ( AVAILABLE ?auto_23544 ) ( SURFACE-AT ?auto_23541 ?auto_23548 ) ( ON ?auto_23541 ?auto_23545 ) ( CLEAR ?auto_23541 ) ( not ( = ?auto_23542 ?auto_23541 ) ) ( not ( = ?auto_23542 ?auto_23545 ) ) ( not ( = ?auto_23541 ?auto_23545 ) ) ( not ( = ?auto_23547 ?auto_23544 ) ) ( IS-CRATE ?auto_23542 ) ( not ( = ?auto_23561 ?auto_23543 ) ) ( HOIST-AT ?auto_23550 ?auto_23561 ) ( SURFACE-AT ?auto_23542 ?auto_23561 ) ( ON ?auto_23542 ?auto_23580 ) ( CLEAR ?auto_23542 ) ( not ( = ?auto_23540 ?auto_23542 ) ) ( not ( = ?auto_23540 ?auto_23580 ) ) ( not ( = ?auto_23542 ?auto_23580 ) ) ( not ( = ?auto_23547 ?auto_23550 ) ) ( IS-CRATE ?auto_23540 ) ( not ( = ?auto_23569 ?auto_23543 ) ) ( HOIST-AT ?auto_23575 ?auto_23569 ) ( AVAILABLE ?auto_23575 ) ( SURFACE-AT ?auto_23540 ?auto_23569 ) ( ON ?auto_23540 ?auto_23574 ) ( CLEAR ?auto_23540 ) ( not ( = ?auto_23539 ?auto_23540 ) ) ( not ( = ?auto_23539 ?auto_23574 ) ) ( not ( = ?auto_23540 ?auto_23574 ) ) ( not ( = ?auto_23547 ?auto_23575 ) ) ( IS-CRATE ?auto_23539 ) ( not ( = ?auto_23557 ?auto_23543 ) ) ( HOIST-AT ?auto_23568 ?auto_23557 ) ( AVAILABLE ?auto_23568 ) ( SURFACE-AT ?auto_23539 ?auto_23557 ) ( ON ?auto_23539 ?auto_23549 ) ( CLEAR ?auto_23539 ) ( not ( = ?auto_23538 ?auto_23539 ) ) ( not ( = ?auto_23538 ?auto_23549 ) ) ( not ( = ?auto_23539 ?auto_23549 ) ) ( not ( = ?auto_23547 ?auto_23568 ) ) ( IS-CRATE ?auto_23538 ) ( not ( = ?auto_23570 ?auto_23543 ) ) ( HOIST-AT ?auto_23573 ?auto_23570 ) ( SURFACE-AT ?auto_23538 ?auto_23570 ) ( ON ?auto_23538 ?auto_23572 ) ( CLEAR ?auto_23538 ) ( not ( = ?auto_23537 ?auto_23538 ) ) ( not ( = ?auto_23537 ?auto_23572 ) ) ( not ( = ?auto_23538 ?auto_23572 ) ) ( not ( = ?auto_23547 ?auto_23573 ) ) ( IS-CRATE ?auto_23537 ) ( not ( = ?auto_23552 ?auto_23543 ) ) ( HOIST-AT ?auto_23559 ?auto_23552 ) ( AVAILABLE ?auto_23559 ) ( SURFACE-AT ?auto_23537 ?auto_23552 ) ( ON ?auto_23537 ?auto_23558 ) ( CLEAR ?auto_23537 ) ( not ( = ?auto_23536 ?auto_23537 ) ) ( not ( = ?auto_23536 ?auto_23558 ) ) ( not ( = ?auto_23537 ?auto_23558 ) ) ( not ( = ?auto_23547 ?auto_23559 ) ) ( IS-CRATE ?auto_23536 ) ( not ( = ?auto_23560 ?auto_23543 ) ) ( HOIST-AT ?auto_23571 ?auto_23560 ) ( AVAILABLE ?auto_23571 ) ( SURFACE-AT ?auto_23536 ?auto_23560 ) ( ON ?auto_23536 ?auto_23553 ) ( CLEAR ?auto_23536 ) ( not ( = ?auto_23535 ?auto_23536 ) ) ( not ( = ?auto_23535 ?auto_23553 ) ) ( not ( = ?auto_23536 ?auto_23553 ) ) ( not ( = ?auto_23547 ?auto_23571 ) ) ( IS-CRATE ?auto_23535 ) ( not ( = ?auto_23567 ?auto_23543 ) ) ( HOIST-AT ?auto_23566 ?auto_23567 ) ( AVAILABLE ?auto_23566 ) ( SURFACE-AT ?auto_23535 ?auto_23567 ) ( ON ?auto_23535 ?auto_23577 ) ( CLEAR ?auto_23535 ) ( not ( = ?auto_23534 ?auto_23535 ) ) ( not ( = ?auto_23534 ?auto_23577 ) ) ( not ( = ?auto_23535 ?auto_23577 ) ) ( not ( = ?auto_23547 ?auto_23566 ) ) ( IS-CRATE ?auto_23534 ) ( AVAILABLE ?auto_23573 ) ( SURFACE-AT ?auto_23534 ?auto_23570 ) ( ON ?auto_23534 ?auto_23564 ) ( CLEAR ?auto_23534 ) ( not ( = ?auto_23533 ?auto_23534 ) ) ( not ( = ?auto_23533 ?auto_23564 ) ) ( not ( = ?auto_23534 ?auto_23564 ) ) ( IS-CRATE ?auto_23533 ) ( not ( = ?auto_23551 ?auto_23543 ) ) ( HOIST-AT ?auto_23565 ?auto_23551 ) ( SURFACE-AT ?auto_23533 ?auto_23551 ) ( ON ?auto_23533 ?auto_23576 ) ( CLEAR ?auto_23533 ) ( not ( = ?auto_23532 ?auto_23533 ) ) ( not ( = ?auto_23532 ?auto_23576 ) ) ( not ( = ?auto_23533 ?auto_23576 ) ) ( not ( = ?auto_23547 ?auto_23565 ) ) ( IS-CRATE ?auto_23532 ) ( not ( = ?auto_23555 ?auto_23543 ) ) ( HOIST-AT ?auto_23578 ?auto_23555 ) ( AVAILABLE ?auto_23578 ) ( SURFACE-AT ?auto_23532 ?auto_23555 ) ( ON ?auto_23532 ?auto_23563 ) ( CLEAR ?auto_23532 ) ( not ( = ?auto_23531 ?auto_23532 ) ) ( not ( = ?auto_23531 ?auto_23563 ) ) ( not ( = ?auto_23532 ?auto_23563 ) ) ( not ( = ?auto_23547 ?auto_23578 ) ) ( IS-CRATE ?auto_23531 ) ( AVAILABLE ?auto_23550 ) ( SURFACE-AT ?auto_23531 ?auto_23561 ) ( ON ?auto_23531 ?auto_23579 ) ( CLEAR ?auto_23531 ) ( not ( = ?auto_23530 ?auto_23531 ) ) ( not ( = ?auto_23530 ?auto_23579 ) ) ( not ( = ?auto_23531 ?auto_23579 ) ) ( IS-CRATE ?auto_23530 ) ( AVAILABLE ?auto_23565 ) ( SURFACE-AT ?auto_23530 ?auto_23551 ) ( ON ?auto_23530 ?auto_23556 ) ( CLEAR ?auto_23530 ) ( not ( = ?auto_23529 ?auto_23530 ) ) ( not ( = ?auto_23529 ?auto_23556 ) ) ( not ( = ?auto_23530 ?auto_23556 ) ) ( SURFACE-AT ?auto_23528 ?auto_23543 ) ( CLEAR ?auto_23528 ) ( IS-CRATE ?auto_23529 ) ( AVAILABLE ?auto_23547 ) ( not ( = ?auto_23581 ?auto_23543 ) ) ( HOIST-AT ?auto_23562 ?auto_23581 ) ( AVAILABLE ?auto_23562 ) ( SURFACE-AT ?auto_23529 ?auto_23581 ) ( ON ?auto_23529 ?auto_23554 ) ( CLEAR ?auto_23529 ) ( TRUCK-AT ?auto_23546 ?auto_23543 ) ( not ( = ?auto_23528 ?auto_23529 ) ) ( not ( = ?auto_23528 ?auto_23554 ) ) ( not ( = ?auto_23529 ?auto_23554 ) ) ( not ( = ?auto_23547 ?auto_23562 ) ) ( not ( = ?auto_23528 ?auto_23530 ) ) ( not ( = ?auto_23528 ?auto_23556 ) ) ( not ( = ?auto_23530 ?auto_23554 ) ) ( not ( = ?auto_23551 ?auto_23581 ) ) ( not ( = ?auto_23565 ?auto_23562 ) ) ( not ( = ?auto_23556 ?auto_23554 ) ) ( not ( = ?auto_23528 ?auto_23531 ) ) ( not ( = ?auto_23528 ?auto_23579 ) ) ( not ( = ?auto_23529 ?auto_23531 ) ) ( not ( = ?auto_23529 ?auto_23579 ) ) ( not ( = ?auto_23531 ?auto_23556 ) ) ( not ( = ?auto_23531 ?auto_23554 ) ) ( not ( = ?auto_23561 ?auto_23551 ) ) ( not ( = ?auto_23561 ?auto_23581 ) ) ( not ( = ?auto_23550 ?auto_23565 ) ) ( not ( = ?auto_23550 ?auto_23562 ) ) ( not ( = ?auto_23579 ?auto_23556 ) ) ( not ( = ?auto_23579 ?auto_23554 ) ) ( not ( = ?auto_23528 ?auto_23532 ) ) ( not ( = ?auto_23528 ?auto_23563 ) ) ( not ( = ?auto_23529 ?auto_23532 ) ) ( not ( = ?auto_23529 ?auto_23563 ) ) ( not ( = ?auto_23530 ?auto_23532 ) ) ( not ( = ?auto_23530 ?auto_23563 ) ) ( not ( = ?auto_23532 ?auto_23579 ) ) ( not ( = ?auto_23532 ?auto_23556 ) ) ( not ( = ?auto_23532 ?auto_23554 ) ) ( not ( = ?auto_23555 ?auto_23561 ) ) ( not ( = ?auto_23555 ?auto_23551 ) ) ( not ( = ?auto_23555 ?auto_23581 ) ) ( not ( = ?auto_23578 ?auto_23550 ) ) ( not ( = ?auto_23578 ?auto_23565 ) ) ( not ( = ?auto_23578 ?auto_23562 ) ) ( not ( = ?auto_23563 ?auto_23579 ) ) ( not ( = ?auto_23563 ?auto_23556 ) ) ( not ( = ?auto_23563 ?auto_23554 ) ) ( not ( = ?auto_23528 ?auto_23533 ) ) ( not ( = ?auto_23528 ?auto_23576 ) ) ( not ( = ?auto_23529 ?auto_23533 ) ) ( not ( = ?auto_23529 ?auto_23576 ) ) ( not ( = ?auto_23530 ?auto_23533 ) ) ( not ( = ?auto_23530 ?auto_23576 ) ) ( not ( = ?auto_23531 ?auto_23533 ) ) ( not ( = ?auto_23531 ?auto_23576 ) ) ( not ( = ?auto_23533 ?auto_23563 ) ) ( not ( = ?auto_23533 ?auto_23579 ) ) ( not ( = ?auto_23533 ?auto_23556 ) ) ( not ( = ?auto_23533 ?auto_23554 ) ) ( not ( = ?auto_23576 ?auto_23563 ) ) ( not ( = ?auto_23576 ?auto_23579 ) ) ( not ( = ?auto_23576 ?auto_23556 ) ) ( not ( = ?auto_23576 ?auto_23554 ) ) ( not ( = ?auto_23528 ?auto_23534 ) ) ( not ( = ?auto_23528 ?auto_23564 ) ) ( not ( = ?auto_23529 ?auto_23534 ) ) ( not ( = ?auto_23529 ?auto_23564 ) ) ( not ( = ?auto_23530 ?auto_23534 ) ) ( not ( = ?auto_23530 ?auto_23564 ) ) ( not ( = ?auto_23531 ?auto_23534 ) ) ( not ( = ?auto_23531 ?auto_23564 ) ) ( not ( = ?auto_23532 ?auto_23534 ) ) ( not ( = ?auto_23532 ?auto_23564 ) ) ( not ( = ?auto_23534 ?auto_23576 ) ) ( not ( = ?auto_23534 ?auto_23563 ) ) ( not ( = ?auto_23534 ?auto_23579 ) ) ( not ( = ?auto_23534 ?auto_23556 ) ) ( not ( = ?auto_23534 ?auto_23554 ) ) ( not ( = ?auto_23570 ?auto_23551 ) ) ( not ( = ?auto_23570 ?auto_23555 ) ) ( not ( = ?auto_23570 ?auto_23561 ) ) ( not ( = ?auto_23570 ?auto_23581 ) ) ( not ( = ?auto_23573 ?auto_23565 ) ) ( not ( = ?auto_23573 ?auto_23578 ) ) ( not ( = ?auto_23573 ?auto_23550 ) ) ( not ( = ?auto_23573 ?auto_23562 ) ) ( not ( = ?auto_23564 ?auto_23576 ) ) ( not ( = ?auto_23564 ?auto_23563 ) ) ( not ( = ?auto_23564 ?auto_23579 ) ) ( not ( = ?auto_23564 ?auto_23556 ) ) ( not ( = ?auto_23564 ?auto_23554 ) ) ( not ( = ?auto_23528 ?auto_23535 ) ) ( not ( = ?auto_23528 ?auto_23577 ) ) ( not ( = ?auto_23529 ?auto_23535 ) ) ( not ( = ?auto_23529 ?auto_23577 ) ) ( not ( = ?auto_23530 ?auto_23535 ) ) ( not ( = ?auto_23530 ?auto_23577 ) ) ( not ( = ?auto_23531 ?auto_23535 ) ) ( not ( = ?auto_23531 ?auto_23577 ) ) ( not ( = ?auto_23532 ?auto_23535 ) ) ( not ( = ?auto_23532 ?auto_23577 ) ) ( not ( = ?auto_23533 ?auto_23535 ) ) ( not ( = ?auto_23533 ?auto_23577 ) ) ( not ( = ?auto_23535 ?auto_23564 ) ) ( not ( = ?auto_23535 ?auto_23576 ) ) ( not ( = ?auto_23535 ?auto_23563 ) ) ( not ( = ?auto_23535 ?auto_23579 ) ) ( not ( = ?auto_23535 ?auto_23556 ) ) ( not ( = ?auto_23535 ?auto_23554 ) ) ( not ( = ?auto_23567 ?auto_23570 ) ) ( not ( = ?auto_23567 ?auto_23551 ) ) ( not ( = ?auto_23567 ?auto_23555 ) ) ( not ( = ?auto_23567 ?auto_23561 ) ) ( not ( = ?auto_23567 ?auto_23581 ) ) ( not ( = ?auto_23566 ?auto_23573 ) ) ( not ( = ?auto_23566 ?auto_23565 ) ) ( not ( = ?auto_23566 ?auto_23578 ) ) ( not ( = ?auto_23566 ?auto_23550 ) ) ( not ( = ?auto_23566 ?auto_23562 ) ) ( not ( = ?auto_23577 ?auto_23564 ) ) ( not ( = ?auto_23577 ?auto_23576 ) ) ( not ( = ?auto_23577 ?auto_23563 ) ) ( not ( = ?auto_23577 ?auto_23579 ) ) ( not ( = ?auto_23577 ?auto_23556 ) ) ( not ( = ?auto_23577 ?auto_23554 ) ) ( not ( = ?auto_23528 ?auto_23536 ) ) ( not ( = ?auto_23528 ?auto_23553 ) ) ( not ( = ?auto_23529 ?auto_23536 ) ) ( not ( = ?auto_23529 ?auto_23553 ) ) ( not ( = ?auto_23530 ?auto_23536 ) ) ( not ( = ?auto_23530 ?auto_23553 ) ) ( not ( = ?auto_23531 ?auto_23536 ) ) ( not ( = ?auto_23531 ?auto_23553 ) ) ( not ( = ?auto_23532 ?auto_23536 ) ) ( not ( = ?auto_23532 ?auto_23553 ) ) ( not ( = ?auto_23533 ?auto_23536 ) ) ( not ( = ?auto_23533 ?auto_23553 ) ) ( not ( = ?auto_23534 ?auto_23536 ) ) ( not ( = ?auto_23534 ?auto_23553 ) ) ( not ( = ?auto_23536 ?auto_23577 ) ) ( not ( = ?auto_23536 ?auto_23564 ) ) ( not ( = ?auto_23536 ?auto_23576 ) ) ( not ( = ?auto_23536 ?auto_23563 ) ) ( not ( = ?auto_23536 ?auto_23579 ) ) ( not ( = ?auto_23536 ?auto_23556 ) ) ( not ( = ?auto_23536 ?auto_23554 ) ) ( not ( = ?auto_23560 ?auto_23567 ) ) ( not ( = ?auto_23560 ?auto_23570 ) ) ( not ( = ?auto_23560 ?auto_23551 ) ) ( not ( = ?auto_23560 ?auto_23555 ) ) ( not ( = ?auto_23560 ?auto_23561 ) ) ( not ( = ?auto_23560 ?auto_23581 ) ) ( not ( = ?auto_23571 ?auto_23566 ) ) ( not ( = ?auto_23571 ?auto_23573 ) ) ( not ( = ?auto_23571 ?auto_23565 ) ) ( not ( = ?auto_23571 ?auto_23578 ) ) ( not ( = ?auto_23571 ?auto_23550 ) ) ( not ( = ?auto_23571 ?auto_23562 ) ) ( not ( = ?auto_23553 ?auto_23577 ) ) ( not ( = ?auto_23553 ?auto_23564 ) ) ( not ( = ?auto_23553 ?auto_23576 ) ) ( not ( = ?auto_23553 ?auto_23563 ) ) ( not ( = ?auto_23553 ?auto_23579 ) ) ( not ( = ?auto_23553 ?auto_23556 ) ) ( not ( = ?auto_23553 ?auto_23554 ) ) ( not ( = ?auto_23528 ?auto_23537 ) ) ( not ( = ?auto_23528 ?auto_23558 ) ) ( not ( = ?auto_23529 ?auto_23537 ) ) ( not ( = ?auto_23529 ?auto_23558 ) ) ( not ( = ?auto_23530 ?auto_23537 ) ) ( not ( = ?auto_23530 ?auto_23558 ) ) ( not ( = ?auto_23531 ?auto_23537 ) ) ( not ( = ?auto_23531 ?auto_23558 ) ) ( not ( = ?auto_23532 ?auto_23537 ) ) ( not ( = ?auto_23532 ?auto_23558 ) ) ( not ( = ?auto_23533 ?auto_23537 ) ) ( not ( = ?auto_23533 ?auto_23558 ) ) ( not ( = ?auto_23534 ?auto_23537 ) ) ( not ( = ?auto_23534 ?auto_23558 ) ) ( not ( = ?auto_23535 ?auto_23537 ) ) ( not ( = ?auto_23535 ?auto_23558 ) ) ( not ( = ?auto_23537 ?auto_23553 ) ) ( not ( = ?auto_23537 ?auto_23577 ) ) ( not ( = ?auto_23537 ?auto_23564 ) ) ( not ( = ?auto_23537 ?auto_23576 ) ) ( not ( = ?auto_23537 ?auto_23563 ) ) ( not ( = ?auto_23537 ?auto_23579 ) ) ( not ( = ?auto_23537 ?auto_23556 ) ) ( not ( = ?auto_23537 ?auto_23554 ) ) ( not ( = ?auto_23552 ?auto_23560 ) ) ( not ( = ?auto_23552 ?auto_23567 ) ) ( not ( = ?auto_23552 ?auto_23570 ) ) ( not ( = ?auto_23552 ?auto_23551 ) ) ( not ( = ?auto_23552 ?auto_23555 ) ) ( not ( = ?auto_23552 ?auto_23561 ) ) ( not ( = ?auto_23552 ?auto_23581 ) ) ( not ( = ?auto_23559 ?auto_23571 ) ) ( not ( = ?auto_23559 ?auto_23566 ) ) ( not ( = ?auto_23559 ?auto_23573 ) ) ( not ( = ?auto_23559 ?auto_23565 ) ) ( not ( = ?auto_23559 ?auto_23578 ) ) ( not ( = ?auto_23559 ?auto_23550 ) ) ( not ( = ?auto_23559 ?auto_23562 ) ) ( not ( = ?auto_23558 ?auto_23553 ) ) ( not ( = ?auto_23558 ?auto_23577 ) ) ( not ( = ?auto_23558 ?auto_23564 ) ) ( not ( = ?auto_23558 ?auto_23576 ) ) ( not ( = ?auto_23558 ?auto_23563 ) ) ( not ( = ?auto_23558 ?auto_23579 ) ) ( not ( = ?auto_23558 ?auto_23556 ) ) ( not ( = ?auto_23558 ?auto_23554 ) ) ( not ( = ?auto_23528 ?auto_23538 ) ) ( not ( = ?auto_23528 ?auto_23572 ) ) ( not ( = ?auto_23529 ?auto_23538 ) ) ( not ( = ?auto_23529 ?auto_23572 ) ) ( not ( = ?auto_23530 ?auto_23538 ) ) ( not ( = ?auto_23530 ?auto_23572 ) ) ( not ( = ?auto_23531 ?auto_23538 ) ) ( not ( = ?auto_23531 ?auto_23572 ) ) ( not ( = ?auto_23532 ?auto_23538 ) ) ( not ( = ?auto_23532 ?auto_23572 ) ) ( not ( = ?auto_23533 ?auto_23538 ) ) ( not ( = ?auto_23533 ?auto_23572 ) ) ( not ( = ?auto_23534 ?auto_23538 ) ) ( not ( = ?auto_23534 ?auto_23572 ) ) ( not ( = ?auto_23535 ?auto_23538 ) ) ( not ( = ?auto_23535 ?auto_23572 ) ) ( not ( = ?auto_23536 ?auto_23538 ) ) ( not ( = ?auto_23536 ?auto_23572 ) ) ( not ( = ?auto_23538 ?auto_23558 ) ) ( not ( = ?auto_23538 ?auto_23553 ) ) ( not ( = ?auto_23538 ?auto_23577 ) ) ( not ( = ?auto_23538 ?auto_23564 ) ) ( not ( = ?auto_23538 ?auto_23576 ) ) ( not ( = ?auto_23538 ?auto_23563 ) ) ( not ( = ?auto_23538 ?auto_23579 ) ) ( not ( = ?auto_23538 ?auto_23556 ) ) ( not ( = ?auto_23538 ?auto_23554 ) ) ( not ( = ?auto_23572 ?auto_23558 ) ) ( not ( = ?auto_23572 ?auto_23553 ) ) ( not ( = ?auto_23572 ?auto_23577 ) ) ( not ( = ?auto_23572 ?auto_23564 ) ) ( not ( = ?auto_23572 ?auto_23576 ) ) ( not ( = ?auto_23572 ?auto_23563 ) ) ( not ( = ?auto_23572 ?auto_23579 ) ) ( not ( = ?auto_23572 ?auto_23556 ) ) ( not ( = ?auto_23572 ?auto_23554 ) ) ( not ( = ?auto_23528 ?auto_23539 ) ) ( not ( = ?auto_23528 ?auto_23549 ) ) ( not ( = ?auto_23529 ?auto_23539 ) ) ( not ( = ?auto_23529 ?auto_23549 ) ) ( not ( = ?auto_23530 ?auto_23539 ) ) ( not ( = ?auto_23530 ?auto_23549 ) ) ( not ( = ?auto_23531 ?auto_23539 ) ) ( not ( = ?auto_23531 ?auto_23549 ) ) ( not ( = ?auto_23532 ?auto_23539 ) ) ( not ( = ?auto_23532 ?auto_23549 ) ) ( not ( = ?auto_23533 ?auto_23539 ) ) ( not ( = ?auto_23533 ?auto_23549 ) ) ( not ( = ?auto_23534 ?auto_23539 ) ) ( not ( = ?auto_23534 ?auto_23549 ) ) ( not ( = ?auto_23535 ?auto_23539 ) ) ( not ( = ?auto_23535 ?auto_23549 ) ) ( not ( = ?auto_23536 ?auto_23539 ) ) ( not ( = ?auto_23536 ?auto_23549 ) ) ( not ( = ?auto_23537 ?auto_23539 ) ) ( not ( = ?auto_23537 ?auto_23549 ) ) ( not ( = ?auto_23539 ?auto_23572 ) ) ( not ( = ?auto_23539 ?auto_23558 ) ) ( not ( = ?auto_23539 ?auto_23553 ) ) ( not ( = ?auto_23539 ?auto_23577 ) ) ( not ( = ?auto_23539 ?auto_23564 ) ) ( not ( = ?auto_23539 ?auto_23576 ) ) ( not ( = ?auto_23539 ?auto_23563 ) ) ( not ( = ?auto_23539 ?auto_23579 ) ) ( not ( = ?auto_23539 ?auto_23556 ) ) ( not ( = ?auto_23539 ?auto_23554 ) ) ( not ( = ?auto_23557 ?auto_23570 ) ) ( not ( = ?auto_23557 ?auto_23552 ) ) ( not ( = ?auto_23557 ?auto_23560 ) ) ( not ( = ?auto_23557 ?auto_23567 ) ) ( not ( = ?auto_23557 ?auto_23551 ) ) ( not ( = ?auto_23557 ?auto_23555 ) ) ( not ( = ?auto_23557 ?auto_23561 ) ) ( not ( = ?auto_23557 ?auto_23581 ) ) ( not ( = ?auto_23568 ?auto_23573 ) ) ( not ( = ?auto_23568 ?auto_23559 ) ) ( not ( = ?auto_23568 ?auto_23571 ) ) ( not ( = ?auto_23568 ?auto_23566 ) ) ( not ( = ?auto_23568 ?auto_23565 ) ) ( not ( = ?auto_23568 ?auto_23578 ) ) ( not ( = ?auto_23568 ?auto_23550 ) ) ( not ( = ?auto_23568 ?auto_23562 ) ) ( not ( = ?auto_23549 ?auto_23572 ) ) ( not ( = ?auto_23549 ?auto_23558 ) ) ( not ( = ?auto_23549 ?auto_23553 ) ) ( not ( = ?auto_23549 ?auto_23577 ) ) ( not ( = ?auto_23549 ?auto_23564 ) ) ( not ( = ?auto_23549 ?auto_23576 ) ) ( not ( = ?auto_23549 ?auto_23563 ) ) ( not ( = ?auto_23549 ?auto_23579 ) ) ( not ( = ?auto_23549 ?auto_23556 ) ) ( not ( = ?auto_23549 ?auto_23554 ) ) ( not ( = ?auto_23528 ?auto_23540 ) ) ( not ( = ?auto_23528 ?auto_23574 ) ) ( not ( = ?auto_23529 ?auto_23540 ) ) ( not ( = ?auto_23529 ?auto_23574 ) ) ( not ( = ?auto_23530 ?auto_23540 ) ) ( not ( = ?auto_23530 ?auto_23574 ) ) ( not ( = ?auto_23531 ?auto_23540 ) ) ( not ( = ?auto_23531 ?auto_23574 ) ) ( not ( = ?auto_23532 ?auto_23540 ) ) ( not ( = ?auto_23532 ?auto_23574 ) ) ( not ( = ?auto_23533 ?auto_23540 ) ) ( not ( = ?auto_23533 ?auto_23574 ) ) ( not ( = ?auto_23534 ?auto_23540 ) ) ( not ( = ?auto_23534 ?auto_23574 ) ) ( not ( = ?auto_23535 ?auto_23540 ) ) ( not ( = ?auto_23535 ?auto_23574 ) ) ( not ( = ?auto_23536 ?auto_23540 ) ) ( not ( = ?auto_23536 ?auto_23574 ) ) ( not ( = ?auto_23537 ?auto_23540 ) ) ( not ( = ?auto_23537 ?auto_23574 ) ) ( not ( = ?auto_23538 ?auto_23540 ) ) ( not ( = ?auto_23538 ?auto_23574 ) ) ( not ( = ?auto_23540 ?auto_23549 ) ) ( not ( = ?auto_23540 ?auto_23572 ) ) ( not ( = ?auto_23540 ?auto_23558 ) ) ( not ( = ?auto_23540 ?auto_23553 ) ) ( not ( = ?auto_23540 ?auto_23577 ) ) ( not ( = ?auto_23540 ?auto_23564 ) ) ( not ( = ?auto_23540 ?auto_23576 ) ) ( not ( = ?auto_23540 ?auto_23563 ) ) ( not ( = ?auto_23540 ?auto_23579 ) ) ( not ( = ?auto_23540 ?auto_23556 ) ) ( not ( = ?auto_23540 ?auto_23554 ) ) ( not ( = ?auto_23569 ?auto_23557 ) ) ( not ( = ?auto_23569 ?auto_23570 ) ) ( not ( = ?auto_23569 ?auto_23552 ) ) ( not ( = ?auto_23569 ?auto_23560 ) ) ( not ( = ?auto_23569 ?auto_23567 ) ) ( not ( = ?auto_23569 ?auto_23551 ) ) ( not ( = ?auto_23569 ?auto_23555 ) ) ( not ( = ?auto_23569 ?auto_23561 ) ) ( not ( = ?auto_23569 ?auto_23581 ) ) ( not ( = ?auto_23575 ?auto_23568 ) ) ( not ( = ?auto_23575 ?auto_23573 ) ) ( not ( = ?auto_23575 ?auto_23559 ) ) ( not ( = ?auto_23575 ?auto_23571 ) ) ( not ( = ?auto_23575 ?auto_23566 ) ) ( not ( = ?auto_23575 ?auto_23565 ) ) ( not ( = ?auto_23575 ?auto_23578 ) ) ( not ( = ?auto_23575 ?auto_23550 ) ) ( not ( = ?auto_23575 ?auto_23562 ) ) ( not ( = ?auto_23574 ?auto_23549 ) ) ( not ( = ?auto_23574 ?auto_23572 ) ) ( not ( = ?auto_23574 ?auto_23558 ) ) ( not ( = ?auto_23574 ?auto_23553 ) ) ( not ( = ?auto_23574 ?auto_23577 ) ) ( not ( = ?auto_23574 ?auto_23564 ) ) ( not ( = ?auto_23574 ?auto_23576 ) ) ( not ( = ?auto_23574 ?auto_23563 ) ) ( not ( = ?auto_23574 ?auto_23579 ) ) ( not ( = ?auto_23574 ?auto_23556 ) ) ( not ( = ?auto_23574 ?auto_23554 ) ) ( not ( = ?auto_23528 ?auto_23542 ) ) ( not ( = ?auto_23528 ?auto_23580 ) ) ( not ( = ?auto_23529 ?auto_23542 ) ) ( not ( = ?auto_23529 ?auto_23580 ) ) ( not ( = ?auto_23530 ?auto_23542 ) ) ( not ( = ?auto_23530 ?auto_23580 ) ) ( not ( = ?auto_23531 ?auto_23542 ) ) ( not ( = ?auto_23531 ?auto_23580 ) ) ( not ( = ?auto_23532 ?auto_23542 ) ) ( not ( = ?auto_23532 ?auto_23580 ) ) ( not ( = ?auto_23533 ?auto_23542 ) ) ( not ( = ?auto_23533 ?auto_23580 ) ) ( not ( = ?auto_23534 ?auto_23542 ) ) ( not ( = ?auto_23534 ?auto_23580 ) ) ( not ( = ?auto_23535 ?auto_23542 ) ) ( not ( = ?auto_23535 ?auto_23580 ) ) ( not ( = ?auto_23536 ?auto_23542 ) ) ( not ( = ?auto_23536 ?auto_23580 ) ) ( not ( = ?auto_23537 ?auto_23542 ) ) ( not ( = ?auto_23537 ?auto_23580 ) ) ( not ( = ?auto_23538 ?auto_23542 ) ) ( not ( = ?auto_23538 ?auto_23580 ) ) ( not ( = ?auto_23539 ?auto_23542 ) ) ( not ( = ?auto_23539 ?auto_23580 ) ) ( not ( = ?auto_23542 ?auto_23574 ) ) ( not ( = ?auto_23542 ?auto_23549 ) ) ( not ( = ?auto_23542 ?auto_23572 ) ) ( not ( = ?auto_23542 ?auto_23558 ) ) ( not ( = ?auto_23542 ?auto_23553 ) ) ( not ( = ?auto_23542 ?auto_23577 ) ) ( not ( = ?auto_23542 ?auto_23564 ) ) ( not ( = ?auto_23542 ?auto_23576 ) ) ( not ( = ?auto_23542 ?auto_23563 ) ) ( not ( = ?auto_23542 ?auto_23579 ) ) ( not ( = ?auto_23542 ?auto_23556 ) ) ( not ( = ?auto_23542 ?auto_23554 ) ) ( not ( = ?auto_23580 ?auto_23574 ) ) ( not ( = ?auto_23580 ?auto_23549 ) ) ( not ( = ?auto_23580 ?auto_23572 ) ) ( not ( = ?auto_23580 ?auto_23558 ) ) ( not ( = ?auto_23580 ?auto_23553 ) ) ( not ( = ?auto_23580 ?auto_23577 ) ) ( not ( = ?auto_23580 ?auto_23564 ) ) ( not ( = ?auto_23580 ?auto_23576 ) ) ( not ( = ?auto_23580 ?auto_23563 ) ) ( not ( = ?auto_23580 ?auto_23579 ) ) ( not ( = ?auto_23580 ?auto_23556 ) ) ( not ( = ?auto_23580 ?auto_23554 ) ) ( not ( = ?auto_23528 ?auto_23541 ) ) ( not ( = ?auto_23528 ?auto_23545 ) ) ( not ( = ?auto_23529 ?auto_23541 ) ) ( not ( = ?auto_23529 ?auto_23545 ) ) ( not ( = ?auto_23530 ?auto_23541 ) ) ( not ( = ?auto_23530 ?auto_23545 ) ) ( not ( = ?auto_23531 ?auto_23541 ) ) ( not ( = ?auto_23531 ?auto_23545 ) ) ( not ( = ?auto_23532 ?auto_23541 ) ) ( not ( = ?auto_23532 ?auto_23545 ) ) ( not ( = ?auto_23533 ?auto_23541 ) ) ( not ( = ?auto_23533 ?auto_23545 ) ) ( not ( = ?auto_23534 ?auto_23541 ) ) ( not ( = ?auto_23534 ?auto_23545 ) ) ( not ( = ?auto_23535 ?auto_23541 ) ) ( not ( = ?auto_23535 ?auto_23545 ) ) ( not ( = ?auto_23536 ?auto_23541 ) ) ( not ( = ?auto_23536 ?auto_23545 ) ) ( not ( = ?auto_23537 ?auto_23541 ) ) ( not ( = ?auto_23537 ?auto_23545 ) ) ( not ( = ?auto_23538 ?auto_23541 ) ) ( not ( = ?auto_23538 ?auto_23545 ) ) ( not ( = ?auto_23539 ?auto_23541 ) ) ( not ( = ?auto_23539 ?auto_23545 ) ) ( not ( = ?auto_23540 ?auto_23541 ) ) ( not ( = ?auto_23540 ?auto_23545 ) ) ( not ( = ?auto_23541 ?auto_23580 ) ) ( not ( = ?auto_23541 ?auto_23574 ) ) ( not ( = ?auto_23541 ?auto_23549 ) ) ( not ( = ?auto_23541 ?auto_23572 ) ) ( not ( = ?auto_23541 ?auto_23558 ) ) ( not ( = ?auto_23541 ?auto_23553 ) ) ( not ( = ?auto_23541 ?auto_23577 ) ) ( not ( = ?auto_23541 ?auto_23564 ) ) ( not ( = ?auto_23541 ?auto_23576 ) ) ( not ( = ?auto_23541 ?auto_23563 ) ) ( not ( = ?auto_23541 ?auto_23579 ) ) ( not ( = ?auto_23541 ?auto_23556 ) ) ( not ( = ?auto_23541 ?auto_23554 ) ) ( not ( = ?auto_23548 ?auto_23561 ) ) ( not ( = ?auto_23548 ?auto_23569 ) ) ( not ( = ?auto_23548 ?auto_23557 ) ) ( not ( = ?auto_23548 ?auto_23570 ) ) ( not ( = ?auto_23548 ?auto_23552 ) ) ( not ( = ?auto_23548 ?auto_23560 ) ) ( not ( = ?auto_23548 ?auto_23567 ) ) ( not ( = ?auto_23548 ?auto_23551 ) ) ( not ( = ?auto_23548 ?auto_23555 ) ) ( not ( = ?auto_23548 ?auto_23581 ) ) ( not ( = ?auto_23544 ?auto_23550 ) ) ( not ( = ?auto_23544 ?auto_23575 ) ) ( not ( = ?auto_23544 ?auto_23568 ) ) ( not ( = ?auto_23544 ?auto_23573 ) ) ( not ( = ?auto_23544 ?auto_23559 ) ) ( not ( = ?auto_23544 ?auto_23571 ) ) ( not ( = ?auto_23544 ?auto_23566 ) ) ( not ( = ?auto_23544 ?auto_23565 ) ) ( not ( = ?auto_23544 ?auto_23578 ) ) ( not ( = ?auto_23544 ?auto_23562 ) ) ( not ( = ?auto_23545 ?auto_23580 ) ) ( not ( = ?auto_23545 ?auto_23574 ) ) ( not ( = ?auto_23545 ?auto_23549 ) ) ( not ( = ?auto_23545 ?auto_23572 ) ) ( not ( = ?auto_23545 ?auto_23558 ) ) ( not ( = ?auto_23545 ?auto_23553 ) ) ( not ( = ?auto_23545 ?auto_23577 ) ) ( not ( = ?auto_23545 ?auto_23564 ) ) ( not ( = ?auto_23545 ?auto_23576 ) ) ( not ( = ?auto_23545 ?auto_23563 ) ) ( not ( = ?auto_23545 ?auto_23579 ) ) ( not ( = ?auto_23545 ?auto_23556 ) ) ( not ( = ?auto_23545 ?auto_23554 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_23528 ?auto_23529 ?auto_23530 ?auto_23531 ?auto_23532 ?auto_23533 ?auto_23534 ?auto_23535 ?auto_23536 ?auto_23537 ?auto_23538 ?auto_23539 ?auto_23540 ?auto_23542 )
      ( MAKE-1CRATE ?auto_23542 ?auto_23541 )
      ( MAKE-14CRATE-VERIFY ?auto_23528 ?auto_23529 ?auto_23530 ?auto_23531 ?auto_23532 ?auto_23533 ?auto_23534 ?auto_23535 ?auto_23536 ?auto_23537 ?auto_23538 ?auto_23539 ?auto_23540 ?auto_23542 ?auto_23541 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_23608 - SURFACE
      ?auto_23609 - SURFACE
      ?auto_23610 - SURFACE
      ?auto_23611 - SURFACE
      ?auto_23612 - SURFACE
      ?auto_23613 - SURFACE
      ?auto_23614 - SURFACE
      ?auto_23615 - SURFACE
      ?auto_23616 - SURFACE
      ?auto_23617 - SURFACE
      ?auto_23618 - SURFACE
      ?auto_23619 - SURFACE
      ?auto_23620 - SURFACE
      ?auto_23622 - SURFACE
      ?auto_23621 - SURFACE
      ?auto_23623 - SURFACE
    )
    :vars
    (
      ?auto_23624 - HOIST
      ?auto_23627 - PLACE
      ?auto_23626 - PLACE
      ?auto_23629 - HOIST
      ?auto_23628 - SURFACE
      ?auto_23644 - PLACE
      ?auto_23638 - HOIST
      ?auto_23632 - SURFACE
      ?auto_23637 - PLACE
      ?auto_23660 - HOIST
      ?auto_23635 - SURFACE
      ?auto_23643 - PLACE
      ?auto_23652 - HOIST
      ?auto_23630 - SURFACE
      ?auto_23659 - PLACE
      ?auto_23641 - HOIST
      ?auto_23633 - SURFACE
      ?auto_23650 - PLACE
      ?auto_23661 - HOIST
      ?auto_23645 - SURFACE
      ?auto_23653 - PLACE
      ?auto_23642 - HOIST
      ?auto_23655 - SURFACE
      ?auto_23663 - PLACE
      ?auto_23656 - HOIST
      ?auto_23657 - SURFACE
      ?auto_23662 - SURFACE
      ?auto_23651 - SURFACE
      ?auto_23654 - PLACE
      ?auto_23636 - HOIST
      ?auto_23639 - SURFACE
      ?auto_23658 - PLACE
      ?auto_23647 - HOIST
      ?auto_23649 - SURFACE
      ?auto_23646 - SURFACE
      ?auto_23634 - SURFACE
      ?auto_23648 - PLACE
      ?auto_23640 - HOIST
      ?auto_23631 - SURFACE
      ?auto_23625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23624 ?auto_23627 ) ( IS-CRATE ?auto_23623 ) ( not ( = ?auto_23626 ?auto_23627 ) ) ( HOIST-AT ?auto_23629 ?auto_23626 ) ( SURFACE-AT ?auto_23623 ?auto_23626 ) ( ON ?auto_23623 ?auto_23628 ) ( CLEAR ?auto_23623 ) ( not ( = ?auto_23621 ?auto_23623 ) ) ( not ( = ?auto_23621 ?auto_23628 ) ) ( not ( = ?auto_23623 ?auto_23628 ) ) ( not ( = ?auto_23624 ?auto_23629 ) ) ( IS-CRATE ?auto_23621 ) ( not ( = ?auto_23644 ?auto_23627 ) ) ( HOIST-AT ?auto_23638 ?auto_23644 ) ( AVAILABLE ?auto_23638 ) ( SURFACE-AT ?auto_23621 ?auto_23644 ) ( ON ?auto_23621 ?auto_23632 ) ( CLEAR ?auto_23621 ) ( not ( = ?auto_23622 ?auto_23621 ) ) ( not ( = ?auto_23622 ?auto_23632 ) ) ( not ( = ?auto_23621 ?auto_23632 ) ) ( not ( = ?auto_23624 ?auto_23638 ) ) ( IS-CRATE ?auto_23622 ) ( not ( = ?auto_23637 ?auto_23627 ) ) ( HOIST-AT ?auto_23660 ?auto_23637 ) ( SURFACE-AT ?auto_23622 ?auto_23637 ) ( ON ?auto_23622 ?auto_23635 ) ( CLEAR ?auto_23622 ) ( not ( = ?auto_23620 ?auto_23622 ) ) ( not ( = ?auto_23620 ?auto_23635 ) ) ( not ( = ?auto_23622 ?auto_23635 ) ) ( not ( = ?auto_23624 ?auto_23660 ) ) ( IS-CRATE ?auto_23620 ) ( not ( = ?auto_23643 ?auto_23627 ) ) ( HOIST-AT ?auto_23652 ?auto_23643 ) ( AVAILABLE ?auto_23652 ) ( SURFACE-AT ?auto_23620 ?auto_23643 ) ( ON ?auto_23620 ?auto_23630 ) ( CLEAR ?auto_23620 ) ( not ( = ?auto_23619 ?auto_23620 ) ) ( not ( = ?auto_23619 ?auto_23630 ) ) ( not ( = ?auto_23620 ?auto_23630 ) ) ( not ( = ?auto_23624 ?auto_23652 ) ) ( IS-CRATE ?auto_23619 ) ( not ( = ?auto_23659 ?auto_23627 ) ) ( HOIST-AT ?auto_23641 ?auto_23659 ) ( AVAILABLE ?auto_23641 ) ( SURFACE-AT ?auto_23619 ?auto_23659 ) ( ON ?auto_23619 ?auto_23633 ) ( CLEAR ?auto_23619 ) ( not ( = ?auto_23618 ?auto_23619 ) ) ( not ( = ?auto_23618 ?auto_23633 ) ) ( not ( = ?auto_23619 ?auto_23633 ) ) ( not ( = ?auto_23624 ?auto_23641 ) ) ( IS-CRATE ?auto_23618 ) ( not ( = ?auto_23650 ?auto_23627 ) ) ( HOIST-AT ?auto_23661 ?auto_23650 ) ( SURFACE-AT ?auto_23618 ?auto_23650 ) ( ON ?auto_23618 ?auto_23645 ) ( CLEAR ?auto_23618 ) ( not ( = ?auto_23617 ?auto_23618 ) ) ( not ( = ?auto_23617 ?auto_23645 ) ) ( not ( = ?auto_23618 ?auto_23645 ) ) ( not ( = ?auto_23624 ?auto_23661 ) ) ( IS-CRATE ?auto_23617 ) ( not ( = ?auto_23653 ?auto_23627 ) ) ( HOIST-AT ?auto_23642 ?auto_23653 ) ( AVAILABLE ?auto_23642 ) ( SURFACE-AT ?auto_23617 ?auto_23653 ) ( ON ?auto_23617 ?auto_23655 ) ( CLEAR ?auto_23617 ) ( not ( = ?auto_23616 ?auto_23617 ) ) ( not ( = ?auto_23616 ?auto_23655 ) ) ( not ( = ?auto_23617 ?auto_23655 ) ) ( not ( = ?auto_23624 ?auto_23642 ) ) ( IS-CRATE ?auto_23616 ) ( not ( = ?auto_23663 ?auto_23627 ) ) ( HOIST-AT ?auto_23656 ?auto_23663 ) ( AVAILABLE ?auto_23656 ) ( SURFACE-AT ?auto_23616 ?auto_23663 ) ( ON ?auto_23616 ?auto_23657 ) ( CLEAR ?auto_23616 ) ( not ( = ?auto_23615 ?auto_23616 ) ) ( not ( = ?auto_23615 ?auto_23657 ) ) ( not ( = ?auto_23616 ?auto_23657 ) ) ( not ( = ?auto_23624 ?auto_23656 ) ) ( IS-CRATE ?auto_23615 ) ( AVAILABLE ?auto_23629 ) ( SURFACE-AT ?auto_23615 ?auto_23626 ) ( ON ?auto_23615 ?auto_23662 ) ( CLEAR ?auto_23615 ) ( not ( = ?auto_23614 ?auto_23615 ) ) ( not ( = ?auto_23614 ?auto_23662 ) ) ( not ( = ?auto_23615 ?auto_23662 ) ) ( IS-CRATE ?auto_23614 ) ( AVAILABLE ?auto_23661 ) ( SURFACE-AT ?auto_23614 ?auto_23650 ) ( ON ?auto_23614 ?auto_23651 ) ( CLEAR ?auto_23614 ) ( not ( = ?auto_23613 ?auto_23614 ) ) ( not ( = ?auto_23613 ?auto_23651 ) ) ( not ( = ?auto_23614 ?auto_23651 ) ) ( IS-CRATE ?auto_23613 ) ( not ( = ?auto_23654 ?auto_23627 ) ) ( HOIST-AT ?auto_23636 ?auto_23654 ) ( SURFACE-AT ?auto_23613 ?auto_23654 ) ( ON ?auto_23613 ?auto_23639 ) ( CLEAR ?auto_23613 ) ( not ( = ?auto_23612 ?auto_23613 ) ) ( not ( = ?auto_23612 ?auto_23639 ) ) ( not ( = ?auto_23613 ?auto_23639 ) ) ( not ( = ?auto_23624 ?auto_23636 ) ) ( IS-CRATE ?auto_23612 ) ( not ( = ?auto_23658 ?auto_23627 ) ) ( HOIST-AT ?auto_23647 ?auto_23658 ) ( AVAILABLE ?auto_23647 ) ( SURFACE-AT ?auto_23612 ?auto_23658 ) ( ON ?auto_23612 ?auto_23649 ) ( CLEAR ?auto_23612 ) ( not ( = ?auto_23611 ?auto_23612 ) ) ( not ( = ?auto_23611 ?auto_23649 ) ) ( not ( = ?auto_23612 ?auto_23649 ) ) ( not ( = ?auto_23624 ?auto_23647 ) ) ( IS-CRATE ?auto_23611 ) ( AVAILABLE ?auto_23660 ) ( SURFACE-AT ?auto_23611 ?auto_23637 ) ( ON ?auto_23611 ?auto_23646 ) ( CLEAR ?auto_23611 ) ( not ( = ?auto_23610 ?auto_23611 ) ) ( not ( = ?auto_23610 ?auto_23646 ) ) ( not ( = ?auto_23611 ?auto_23646 ) ) ( IS-CRATE ?auto_23610 ) ( AVAILABLE ?auto_23636 ) ( SURFACE-AT ?auto_23610 ?auto_23654 ) ( ON ?auto_23610 ?auto_23634 ) ( CLEAR ?auto_23610 ) ( not ( = ?auto_23609 ?auto_23610 ) ) ( not ( = ?auto_23609 ?auto_23634 ) ) ( not ( = ?auto_23610 ?auto_23634 ) ) ( SURFACE-AT ?auto_23608 ?auto_23627 ) ( CLEAR ?auto_23608 ) ( IS-CRATE ?auto_23609 ) ( AVAILABLE ?auto_23624 ) ( not ( = ?auto_23648 ?auto_23627 ) ) ( HOIST-AT ?auto_23640 ?auto_23648 ) ( AVAILABLE ?auto_23640 ) ( SURFACE-AT ?auto_23609 ?auto_23648 ) ( ON ?auto_23609 ?auto_23631 ) ( CLEAR ?auto_23609 ) ( TRUCK-AT ?auto_23625 ?auto_23627 ) ( not ( = ?auto_23608 ?auto_23609 ) ) ( not ( = ?auto_23608 ?auto_23631 ) ) ( not ( = ?auto_23609 ?auto_23631 ) ) ( not ( = ?auto_23624 ?auto_23640 ) ) ( not ( = ?auto_23608 ?auto_23610 ) ) ( not ( = ?auto_23608 ?auto_23634 ) ) ( not ( = ?auto_23610 ?auto_23631 ) ) ( not ( = ?auto_23654 ?auto_23648 ) ) ( not ( = ?auto_23636 ?auto_23640 ) ) ( not ( = ?auto_23634 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23611 ) ) ( not ( = ?auto_23608 ?auto_23646 ) ) ( not ( = ?auto_23609 ?auto_23611 ) ) ( not ( = ?auto_23609 ?auto_23646 ) ) ( not ( = ?auto_23611 ?auto_23634 ) ) ( not ( = ?auto_23611 ?auto_23631 ) ) ( not ( = ?auto_23637 ?auto_23654 ) ) ( not ( = ?auto_23637 ?auto_23648 ) ) ( not ( = ?auto_23660 ?auto_23636 ) ) ( not ( = ?auto_23660 ?auto_23640 ) ) ( not ( = ?auto_23646 ?auto_23634 ) ) ( not ( = ?auto_23646 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23612 ) ) ( not ( = ?auto_23608 ?auto_23649 ) ) ( not ( = ?auto_23609 ?auto_23612 ) ) ( not ( = ?auto_23609 ?auto_23649 ) ) ( not ( = ?auto_23610 ?auto_23612 ) ) ( not ( = ?auto_23610 ?auto_23649 ) ) ( not ( = ?auto_23612 ?auto_23646 ) ) ( not ( = ?auto_23612 ?auto_23634 ) ) ( not ( = ?auto_23612 ?auto_23631 ) ) ( not ( = ?auto_23658 ?auto_23637 ) ) ( not ( = ?auto_23658 ?auto_23654 ) ) ( not ( = ?auto_23658 ?auto_23648 ) ) ( not ( = ?auto_23647 ?auto_23660 ) ) ( not ( = ?auto_23647 ?auto_23636 ) ) ( not ( = ?auto_23647 ?auto_23640 ) ) ( not ( = ?auto_23649 ?auto_23646 ) ) ( not ( = ?auto_23649 ?auto_23634 ) ) ( not ( = ?auto_23649 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23613 ) ) ( not ( = ?auto_23608 ?auto_23639 ) ) ( not ( = ?auto_23609 ?auto_23613 ) ) ( not ( = ?auto_23609 ?auto_23639 ) ) ( not ( = ?auto_23610 ?auto_23613 ) ) ( not ( = ?auto_23610 ?auto_23639 ) ) ( not ( = ?auto_23611 ?auto_23613 ) ) ( not ( = ?auto_23611 ?auto_23639 ) ) ( not ( = ?auto_23613 ?auto_23649 ) ) ( not ( = ?auto_23613 ?auto_23646 ) ) ( not ( = ?auto_23613 ?auto_23634 ) ) ( not ( = ?auto_23613 ?auto_23631 ) ) ( not ( = ?auto_23639 ?auto_23649 ) ) ( not ( = ?auto_23639 ?auto_23646 ) ) ( not ( = ?auto_23639 ?auto_23634 ) ) ( not ( = ?auto_23639 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23614 ) ) ( not ( = ?auto_23608 ?auto_23651 ) ) ( not ( = ?auto_23609 ?auto_23614 ) ) ( not ( = ?auto_23609 ?auto_23651 ) ) ( not ( = ?auto_23610 ?auto_23614 ) ) ( not ( = ?auto_23610 ?auto_23651 ) ) ( not ( = ?auto_23611 ?auto_23614 ) ) ( not ( = ?auto_23611 ?auto_23651 ) ) ( not ( = ?auto_23612 ?auto_23614 ) ) ( not ( = ?auto_23612 ?auto_23651 ) ) ( not ( = ?auto_23614 ?auto_23639 ) ) ( not ( = ?auto_23614 ?auto_23649 ) ) ( not ( = ?auto_23614 ?auto_23646 ) ) ( not ( = ?auto_23614 ?auto_23634 ) ) ( not ( = ?auto_23614 ?auto_23631 ) ) ( not ( = ?auto_23650 ?auto_23654 ) ) ( not ( = ?auto_23650 ?auto_23658 ) ) ( not ( = ?auto_23650 ?auto_23637 ) ) ( not ( = ?auto_23650 ?auto_23648 ) ) ( not ( = ?auto_23661 ?auto_23636 ) ) ( not ( = ?auto_23661 ?auto_23647 ) ) ( not ( = ?auto_23661 ?auto_23660 ) ) ( not ( = ?auto_23661 ?auto_23640 ) ) ( not ( = ?auto_23651 ?auto_23639 ) ) ( not ( = ?auto_23651 ?auto_23649 ) ) ( not ( = ?auto_23651 ?auto_23646 ) ) ( not ( = ?auto_23651 ?auto_23634 ) ) ( not ( = ?auto_23651 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23615 ) ) ( not ( = ?auto_23608 ?auto_23662 ) ) ( not ( = ?auto_23609 ?auto_23615 ) ) ( not ( = ?auto_23609 ?auto_23662 ) ) ( not ( = ?auto_23610 ?auto_23615 ) ) ( not ( = ?auto_23610 ?auto_23662 ) ) ( not ( = ?auto_23611 ?auto_23615 ) ) ( not ( = ?auto_23611 ?auto_23662 ) ) ( not ( = ?auto_23612 ?auto_23615 ) ) ( not ( = ?auto_23612 ?auto_23662 ) ) ( not ( = ?auto_23613 ?auto_23615 ) ) ( not ( = ?auto_23613 ?auto_23662 ) ) ( not ( = ?auto_23615 ?auto_23651 ) ) ( not ( = ?auto_23615 ?auto_23639 ) ) ( not ( = ?auto_23615 ?auto_23649 ) ) ( not ( = ?auto_23615 ?auto_23646 ) ) ( not ( = ?auto_23615 ?auto_23634 ) ) ( not ( = ?auto_23615 ?auto_23631 ) ) ( not ( = ?auto_23626 ?auto_23650 ) ) ( not ( = ?auto_23626 ?auto_23654 ) ) ( not ( = ?auto_23626 ?auto_23658 ) ) ( not ( = ?auto_23626 ?auto_23637 ) ) ( not ( = ?auto_23626 ?auto_23648 ) ) ( not ( = ?auto_23629 ?auto_23661 ) ) ( not ( = ?auto_23629 ?auto_23636 ) ) ( not ( = ?auto_23629 ?auto_23647 ) ) ( not ( = ?auto_23629 ?auto_23660 ) ) ( not ( = ?auto_23629 ?auto_23640 ) ) ( not ( = ?auto_23662 ?auto_23651 ) ) ( not ( = ?auto_23662 ?auto_23639 ) ) ( not ( = ?auto_23662 ?auto_23649 ) ) ( not ( = ?auto_23662 ?auto_23646 ) ) ( not ( = ?auto_23662 ?auto_23634 ) ) ( not ( = ?auto_23662 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23616 ) ) ( not ( = ?auto_23608 ?auto_23657 ) ) ( not ( = ?auto_23609 ?auto_23616 ) ) ( not ( = ?auto_23609 ?auto_23657 ) ) ( not ( = ?auto_23610 ?auto_23616 ) ) ( not ( = ?auto_23610 ?auto_23657 ) ) ( not ( = ?auto_23611 ?auto_23616 ) ) ( not ( = ?auto_23611 ?auto_23657 ) ) ( not ( = ?auto_23612 ?auto_23616 ) ) ( not ( = ?auto_23612 ?auto_23657 ) ) ( not ( = ?auto_23613 ?auto_23616 ) ) ( not ( = ?auto_23613 ?auto_23657 ) ) ( not ( = ?auto_23614 ?auto_23616 ) ) ( not ( = ?auto_23614 ?auto_23657 ) ) ( not ( = ?auto_23616 ?auto_23662 ) ) ( not ( = ?auto_23616 ?auto_23651 ) ) ( not ( = ?auto_23616 ?auto_23639 ) ) ( not ( = ?auto_23616 ?auto_23649 ) ) ( not ( = ?auto_23616 ?auto_23646 ) ) ( not ( = ?auto_23616 ?auto_23634 ) ) ( not ( = ?auto_23616 ?auto_23631 ) ) ( not ( = ?auto_23663 ?auto_23626 ) ) ( not ( = ?auto_23663 ?auto_23650 ) ) ( not ( = ?auto_23663 ?auto_23654 ) ) ( not ( = ?auto_23663 ?auto_23658 ) ) ( not ( = ?auto_23663 ?auto_23637 ) ) ( not ( = ?auto_23663 ?auto_23648 ) ) ( not ( = ?auto_23656 ?auto_23629 ) ) ( not ( = ?auto_23656 ?auto_23661 ) ) ( not ( = ?auto_23656 ?auto_23636 ) ) ( not ( = ?auto_23656 ?auto_23647 ) ) ( not ( = ?auto_23656 ?auto_23660 ) ) ( not ( = ?auto_23656 ?auto_23640 ) ) ( not ( = ?auto_23657 ?auto_23662 ) ) ( not ( = ?auto_23657 ?auto_23651 ) ) ( not ( = ?auto_23657 ?auto_23639 ) ) ( not ( = ?auto_23657 ?auto_23649 ) ) ( not ( = ?auto_23657 ?auto_23646 ) ) ( not ( = ?auto_23657 ?auto_23634 ) ) ( not ( = ?auto_23657 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23617 ) ) ( not ( = ?auto_23608 ?auto_23655 ) ) ( not ( = ?auto_23609 ?auto_23617 ) ) ( not ( = ?auto_23609 ?auto_23655 ) ) ( not ( = ?auto_23610 ?auto_23617 ) ) ( not ( = ?auto_23610 ?auto_23655 ) ) ( not ( = ?auto_23611 ?auto_23617 ) ) ( not ( = ?auto_23611 ?auto_23655 ) ) ( not ( = ?auto_23612 ?auto_23617 ) ) ( not ( = ?auto_23612 ?auto_23655 ) ) ( not ( = ?auto_23613 ?auto_23617 ) ) ( not ( = ?auto_23613 ?auto_23655 ) ) ( not ( = ?auto_23614 ?auto_23617 ) ) ( not ( = ?auto_23614 ?auto_23655 ) ) ( not ( = ?auto_23615 ?auto_23617 ) ) ( not ( = ?auto_23615 ?auto_23655 ) ) ( not ( = ?auto_23617 ?auto_23657 ) ) ( not ( = ?auto_23617 ?auto_23662 ) ) ( not ( = ?auto_23617 ?auto_23651 ) ) ( not ( = ?auto_23617 ?auto_23639 ) ) ( not ( = ?auto_23617 ?auto_23649 ) ) ( not ( = ?auto_23617 ?auto_23646 ) ) ( not ( = ?auto_23617 ?auto_23634 ) ) ( not ( = ?auto_23617 ?auto_23631 ) ) ( not ( = ?auto_23653 ?auto_23663 ) ) ( not ( = ?auto_23653 ?auto_23626 ) ) ( not ( = ?auto_23653 ?auto_23650 ) ) ( not ( = ?auto_23653 ?auto_23654 ) ) ( not ( = ?auto_23653 ?auto_23658 ) ) ( not ( = ?auto_23653 ?auto_23637 ) ) ( not ( = ?auto_23653 ?auto_23648 ) ) ( not ( = ?auto_23642 ?auto_23656 ) ) ( not ( = ?auto_23642 ?auto_23629 ) ) ( not ( = ?auto_23642 ?auto_23661 ) ) ( not ( = ?auto_23642 ?auto_23636 ) ) ( not ( = ?auto_23642 ?auto_23647 ) ) ( not ( = ?auto_23642 ?auto_23660 ) ) ( not ( = ?auto_23642 ?auto_23640 ) ) ( not ( = ?auto_23655 ?auto_23657 ) ) ( not ( = ?auto_23655 ?auto_23662 ) ) ( not ( = ?auto_23655 ?auto_23651 ) ) ( not ( = ?auto_23655 ?auto_23639 ) ) ( not ( = ?auto_23655 ?auto_23649 ) ) ( not ( = ?auto_23655 ?auto_23646 ) ) ( not ( = ?auto_23655 ?auto_23634 ) ) ( not ( = ?auto_23655 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23618 ) ) ( not ( = ?auto_23608 ?auto_23645 ) ) ( not ( = ?auto_23609 ?auto_23618 ) ) ( not ( = ?auto_23609 ?auto_23645 ) ) ( not ( = ?auto_23610 ?auto_23618 ) ) ( not ( = ?auto_23610 ?auto_23645 ) ) ( not ( = ?auto_23611 ?auto_23618 ) ) ( not ( = ?auto_23611 ?auto_23645 ) ) ( not ( = ?auto_23612 ?auto_23618 ) ) ( not ( = ?auto_23612 ?auto_23645 ) ) ( not ( = ?auto_23613 ?auto_23618 ) ) ( not ( = ?auto_23613 ?auto_23645 ) ) ( not ( = ?auto_23614 ?auto_23618 ) ) ( not ( = ?auto_23614 ?auto_23645 ) ) ( not ( = ?auto_23615 ?auto_23618 ) ) ( not ( = ?auto_23615 ?auto_23645 ) ) ( not ( = ?auto_23616 ?auto_23618 ) ) ( not ( = ?auto_23616 ?auto_23645 ) ) ( not ( = ?auto_23618 ?auto_23655 ) ) ( not ( = ?auto_23618 ?auto_23657 ) ) ( not ( = ?auto_23618 ?auto_23662 ) ) ( not ( = ?auto_23618 ?auto_23651 ) ) ( not ( = ?auto_23618 ?auto_23639 ) ) ( not ( = ?auto_23618 ?auto_23649 ) ) ( not ( = ?auto_23618 ?auto_23646 ) ) ( not ( = ?auto_23618 ?auto_23634 ) ) ( not ( = ?auto_23618 ?auto_23631 ) ) ( not ( = ?auto_23645 ?auto_23655 ) ) ( not ( = ?auto_23645 ?auto_23657 ) ) ( not ( = ?auto_23645 ?auto_23662 ) ) ( not ( = ?auto_23645 ?auto_23651 ) ) ( not ( = ?auto_23645 ?auto_23639 ) ) ( not ( = ?auto_23645 ?auto_23649 ) ) ( not ( = ?auto_23645 ?auto_23646 ) ) ( not ( = ?auto_23645 ?auto_23634 ) ) ( not ( = ?auto_23645 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23619 ) ) ( not ( = ?auto_23608 ?auto_23633 ) ) ( not ( = ?auto_23609 ?auto_23619 ) ) ( not ( = ?auto_23609 ?auto_23633 ) ) ( not ( = ?auto_23610 ?auto_23619 ) ) ( not ( = ?auto_23610 ?auto_23633 ) ) ( not ( = ?auto_23611 ?auto_23619 ) ) ( not ( = ?auto_23611 ?auto_23633 ) ) ( not ( = ?auto_23612 ?auto_23619 ) ) ( not ( = ?auto_23612 ?auto_23633 ) ) ( not ( = ?auto_23613 ?auto_23619 ) ) ( not ( = ?auto_23613 ?auto_23633 ) ) ( not ( = ?auto_23614 ?auto_23619 ) ) ( not ( = ?auto_23614 ?auto_23633 ) ) ( not ( = ?auto_23615 ?auto_23619 ) ) ( not ( = ?auto_23615 ?auto_23633 ) ) ( not ( = ?auto_23616 ?auto_23619 ) ) ( not ( = ?auto_23616 ?auto_23633 ) ) ( not ( = ?auto_23617 ?auto_23619 ) ) ( not ( = ?auto_23617 ?auto_23633 ) ) ( not ( = ?auto_23619 ?auto_23645 ) ) ( not ( = ?auto_23619 ?auto_23655 ) ) ( not ( = ?auto_23619 ?auto_23657 ) ) ( not ( = ?auto_23619 ?auto_23662 ) ) ( not ( = ?auto_23619 ?auto_23651 ) ) ( not ( = ?auto_23619 ?auto_23639 ) ) ( not ( = ?auto_23619 ?auto_23649 ) ) ( not ( = ?auto_23619 ?auto_23646 ) ) ( not ( = ?auto_23619 ?auto_23634 ) ) ( not ( = ?auto_23619 ?auto_23631 ) ) ( not ( = ?auto_23659 ?auto_23650 ) ) ( not ( = ?auto_23659 ?auto_23653 ) ) ( not ( = ?auto_23659 ?auto_23663 ) ) ( not ( = ?auto_23659 ?auto_23626 ) ) ( not ( = ?auto_23659 ?auto_23654 ) ) ( not ( = ?auto_23659 ?auto_23658 ) ) ( not ( = ?auto_23659 ?auto_23637 ) ) ( not ( = ?auto_23659 ?auto_23648 ) ) ( not ( = ?auto_23641 ?auto_23661 ) ) ( not ( = ?auto_23641 ?auto_23642 ) ) ( not ( = ?auto_23641 ?auto_23656 ) ) ( not ( = ?auto_23641 ?auto_23629 ) ) ( not ( = ?auto_23641 ?auto_23636 ) ) ( not ( = ?auto_23641 ?auto_23647 ) ) ( not ( = ?auto_23641 ?auto_23660 ) ) ( not ( = ?auto_23641 ?auto_23640 ) ) ( not ( = ?auto_23633 ?auto_23645 ) ) ( not ( = ?auto_23633 ?auto_23655 ) ) ( not ( = ?auto_23633 ?auto_23657 ) ) ( not ( = ?auto_23633 ?auto_23662 ) ) ( not ( = ?auto_23633 ?auto_23651 ) ) ( not ( = ?auto_23633 ?auto_23639 ) ) ( not ( = ?auto_23633 ?auto_23649 ) ) ( not ( = ?auto_23633 ?auto_23646 ) ) ( not ( = ?auto_23633 ?auto_23634 ) ) ( not ( = ?auto_23633 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23620 ) ) ( not ( = ?auto_23608 ?auto_23630 ) ) ( not ( = ?auto_23609 ?auto_23620 ) ) ( not ( = ?auto_23609 ?auto_23630 ) ) ( not ( = ?auto_23610 ?auto_23620 ) ) ( not ( = ?auto_23610 ?auto_23630 ) ) ( not ( = ?auto_23611 ?auto_23620 ) ) ( not ( = ?auto_23611 ?auto_23630 ) ) ( not ( = ?auto_23612 ?auto_23620 ) ) ( not ( = ?auto_23612 ?auto_23630 ) ) ( not ( = ?auto_23613 ?auto_23620 ) ) ( not ( = ?auto_23613 ?auto_23630 ) ) ( not ( = ?auto_23614 ?auto_23620 ) ) ( not ( = ?auto_23614 ?auto_23630 ) ) ( not ( = ?auto_23615 ?auto_23620 ) ) ( not ( = ?auto_23615 ?auto_23630 ) ) ( not ( = ?auto_23616 ?auto_23620 ) ) ( not ( = ?auto_23616 ?auto_23630 ) ) ( not ( = ?auto_23617 ?auto_23620 ) ) ( not ( = ?auto_23617 ?auto_23630 ) ) ( not ( = ?auto_23618 ?auto_23620 ) ) ( not ( = ?auto_23618 ?auto_23630 ) ) ( not ( = ?auto_23620 ?auto_23633 ) ) ( not ( = ?auto_23620 ?auto_23645 ) ) ( not ( = ?auto_23620 ?auto_23655 ) ) ( not ( = ?auto_23620 ?auto_23657 ) ) ( not ( = ?auto_23620 ?auto_23662 ) ) ( not ( = ?auto_23620 ?auto_23651 ) ) ( not ( = ?auto_23620 ?auto_23639 ) ) ( not ( = ?auto_23620 ?auto_23649 ) ) ( not ( = ?auto_23620 ?auto_23646 ) ) ( not ( = ?auto_23620 ?auto_23634 ) ) ( not ( = ?auto_23620 ?auto_23631 ) ) ( not ( = ?auto_23643 ?auto_23659 ) ) ( not ( = ?auto_23643 ?auto_23650 ) ) ( not ( = ?auto_23643 ?auto_23653 ) ) ( not ( = ?auto_23643 ?auto_23663 ) ) ( not ( = ?auto_23643 ?auto_23626 ) ) ( not ( = ?auto_23643 ?auto_23654 ) ) ( not ( = ?auto_23643 ?auto_23658 ) ) ( not ( = ?auto_23643 ?auto_23637 ) ) ( not ( = ?auto_23643 ?auto_23648 ) ) ( not ( = ?auto_23652 ?auto_23641 ) ) ( not ( = ?auto_23652 ?auto_23661 ) ) ( not ( = ?auto_23652 ?auto_23642 ) ) ( not ( = ?auto_23652 ?auto_23656 ) ) ( not ( = ?auto_23652 ?auto_23629 ) ) ( not ( = ?auto_23652 ?auto_23636 ) ) ( not ( = ?auto_23652 ?auto_23647 ) ) ( not ( = ?auto_23652 ?auto_23660 ) ) ( not ( = ?auto_23652 ?auto_23640 ) ) ( not ( = ?auto_23630 ?auto_23633 ) ) ( not ( = ?auto_23630 ?auto_23645 ) ) ( not ( = ?auto_23630 ?auto_23655 ) ) ( not ( = ?auto_23630 ?auto_23657 ) ) ( not ( = ?auto_23630 ?auto_23662 ) ) ( not ( = ?auto_23630 ?auto_23651 ) ) ( not ( = ?auto_23630 ?auto_23639 ) ) ( not ( = ?auto_23630 ?auto_23649 ) ) ( not ( = ?auto_23630 ?auto_23646 ) ) ( not ( = ?auto_23630 ?auto_23634 ) ) ( not ( = ?auto_23630 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23622 ) ) ( not ( = ?auto_23608 ?auto_23635 ) ) ( not ( = ?auto_23609 ?auto_23622 ) ) ( not ( = ?auto_23609 ?auto_23635 ) ) ( not ( = ?auto_23610 ?auto_23622 ) ) ( not ( = ?auto_23610 ?auto_23635 ) ) ( not ( = ?auto_23611 ?auto_23622 ) ) ( not ( = ?auto_23611 ?auto_23635 ) ) ( not ( = ?auto_23612 ?auto_23622 ) ) ( not ( = ?auto_23612 ?auto_23635 ) ) ( not ( = ?auto_23613 ?auto_23622 ) ) ( not ( = ?auto_23613 ?auto_23635 ) ) ( not ( = ?auto_23614 ?auto_23622 ) ) ( not ( = ?auto_23614 ?auto_23635 ) ) ( not ( = ?auto_23615 ?auto_23622 ) ) ( not ( = ?auto_23615 ?auto_23635 ) ) ( not ( = ?auto_23616 ?auto_23622 ) ) ( not ( = ?auto_23616 ?auto_23635 ) ) ( not ( = ?auto_23617 ?auto_23622 ) ) ( not ( = ?auto_23617 ?auto_23635 ) ) ( not ( = ?auto_23618 ?auto_23622 ) ) ( not ( = ?auto_23618 ?auto_23635 ) ) ( not ( = ?auto_23619 ?auto_23622 ) ) ( not ( = ?auto_23619 ?auto_23635 ) ) ( not ( = ?auto_23622 ?auto_23630 ) ) ( not ( = ?auto_23622 ?auto_23633 ) ) ( not ( = ?auto_23622 ?auto_23645 ) ) ( not ( = ?auto_23622 ?auto_23655 ) ) ( not ( = ?auto_23622 ?auto_23657 ) ) ( not ( = ?auto_23622 ?auto_23662 ) ) ( not ( = ?auto_23622 ?auto_23651 ) ) ( not ( = ?auto_23622 ?auto_23639 ) ) ( not ( = ?auto_23622 ?auto_23649 ) ) ( not ( = ?auto_23622 ?auto_23646 ) ) ( not ( = ?auto_23622 ?auto_23634 ) ) ( not ( = ?auto_23622 ?auto_23631 ) ) ( not ( = ?auto_23635 ?auto_23630 ) ) ( not ( = ?auto_23635 ?auto_23633 ) ) ( not ( = ?auto_23635 ?auto_23645 ) ) ( not ( = ?auto_23635 ?auto_23655 ) ) ( not ( = ?auto_23635 ?auto_23657 ) ) ( not ( = ?auto_23635 ?auto_23662 ) ) ( not ( = ?auto_23635 ?auto_23651 ) ) ( not ( = ?auto_23635 ?auto_23639 ) ) ( not ( = ?auto_23635 ?auto_23649 ) ) ( not ( = ?auto_23635 ?auto_23646 ) ) ( not ( = ?auto_23635 ?auto_23634 ) ) ( not ( = ?auto_23635 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23621 ) ) ( not ( = ?auto_23608 ?auto_23632 ) ) ( not ( = ?auto_23609 ?auto_23621 ) ) ( not ( = ?auto_23609 ?auto_23632 ) ) ( not ( = ?auto_23610 ?auto_23621 ) ) ( not ( = ?auto_23610 ?auto_23632 ) ) ( not ( = ?auto_23611 ?auto_23621 ) ) ( not ( = ?auto_23611 ?auto_23632 ) ) ( not ( = ?auto_23612 ?auto_23621 ) ) ( not ( = ?auto_23612 ?auto_23632 ) ) ( not ( = ?auto_23613 ?auto_23621 ) ) ( not ( = ?auto_23613 ?auto_23632 ) ) ( not ( = ?auto_23614 ?auto_23621 ) ) ( not ( = ?auto_23614 ?auto_23632 ) ) ( not ( = ?auto_23615 ?auto_23621 ) ) ( not ( = ?auto_23615 ?auto_23632 ) ) ( not ( = ?auto_23616 ?auto_23621 ) ) ( not ( = ?auto_23616 ?auto_23632 ) ) ( not ( = ?auto_23617 ?auto_23621 ) ) ( not ( = ?auto_23617 ?auto_23632 ) ) ( not ( = ?auto_23618 ?auto_23621 ) ) ( not ( = ?auto_23618 ?auto_23632 ) ) ( not ( = ?auto_23619 ?auto_23621 ) ) ( not ( = ?auto_23619 ?auto_23632 ) ) ( not ( = ?auto_23620 ?auto_23621 ) ) ( not ( = ?auto_23620 ?auto_23632 ) ) ( not ( = ?auto_23621 ?auto_23635 ) ) ( not ( = ?auto_23621 ?auto_23630 ) ) ( not ( = ?auto_23621 ?auto_23633 ) ) ( not ( = ?auto_23621 ?auto_23645 ) ) ( not ( = ?auto_23621 ?auto_23655 ) ) ( not ( = ?auto_23621 ?auto_23657 ) ) ( not ( = ?auto_23621 ?auto_23662 ) ) ( not ( = ?auto_23621 ?auto_23651 ) ) ( not ( = ?auto_23621 ?auto_23639 ) ) ( not ( = ?auto_23621 ?auto_23649 ) ) ( not ( = ?auto_23621 ?auto_23646 ) ) ( not ( = ?auto_23621 ?auto_23634 ) ) ( not ( = ?auto_23621 ?auto_23631 ) ) ( not ( = ?auto_23644 ?auto_23637 ) ) ( not ( = ?auto_23644 ?auto_23643 ) ) ( not ( = ?auto_23644 ?auto_23659 ) ) ( not ( = ?auto_23644 ?auto_23650 ) ) ( not ( = ?auto_23644 ?auto_23653 ) ) ( not ( = ?auto_23644 ?auto_23663 ) ) ( not ( = ?auto_23644 ?auto_23626 ) ) ( not ( = ?auto_23644 ?auto_23654 ) ) ( not ( = ?auto_23644 ?auto_23658 ) ) ( not ( = ?auto_23644 ?auto_23648 ) ) ( not ( = ?auto_23638 ?auto_23660 ) ) ( not ( = ?auto_23638 ?auto_23652 ) ) ( not ( = ?auto_23638 ?auto_23641 ) ) ( not ( = ?auto_23638 ?auto_23661 ) ) ( not ( = ?auto_23638 ?auto_23642 ) ) ( not ( = ?auto_23638 ?auto_23656 ) ) ( not ( = ?auto_23638 ?auto_23629 ) ) ( not ( = ?auto_23638 ?auto_23636 ) ) ( not ( = ?auto_23638 ?auto_23647 ) ) ( not ( = ?auto_23638 ?auto_23640 ) ) ( not ( = ?auto_23632 ?auto_23635 ) ) ( not ( = ?auto_23632 ?auto_23630 ) ) ( not ( = ?auto_23632 ?auto_23633 ) ) ( not ( = ?auto_23632 ?auto_23645 ) ) ( not ( = ?auto_23632 ?auto_23655 ) ) ( not ( = ?auto_23632 ?auto_23657 ) ) ( not ( = ?auto_23632 ?auto_23662 ) ) ( not ( = ?auto_23632 ?auto_23651 ) ) ( not ( = ?auto_23632 ?auto_23639 ) ) ( not ( = ?auto_23632 ?auto_23649 ) ) ( not ( = ?auto_23632 ?auto_23646 ) ) ( not ( = ?auto_23632 ?auto_23634 ) ) ( not ( = ?auto_23632 ?auto_23631 ) ) ( not ( = ?auto_23608 ?auto_23623 ) ) ( not ( = ?auto_23608 ?auto_23628 ) ) ( not ( = ?auto_23609 ?auto_23623 ) ) ( not ( = ?auto_23609 ?auto_23628 ) ) ( not ( = ?auto_23610 ?auto_23623 ) ) ( not ( = ?auto_23610 ?auto_23628 ) ) ( not ( = ?auto_23611 ?auto_23623 ) ) ( not ( = ?auto_23611 ?auto_23628 ) ) ( not ( = ?auto_23612 ?auto_23623 ) ) ( not ( = ?auto_23612 ?auto_23628 ) ) ( not ( = ?auto_23613 ?auto_23623 ) ) ( not ( = ?auto_23613 ?auto_23628 ) ) ( not ( = ?auto_23614 ?auto_23623 ) ) ( not ( = ?auto_23614 ?auto_23628 ) ) ( not ( = ?auto_23615 ?auto_23623 ) ) ( not ( = ?auto_23615 ?auto_23628 ) ) ( not ( = ?auto_23616 ?auto_23623 ) ) ( not ( = ?auto_23616 ?auto_23628 ) ) ( not ( = ?auto_23617 ?auto_23623 ) ) ( not ( = ?auto_23617 ?auto_23628 ) ) ( not ( = ?auto_23618 ?auto_23623 ) ) ( not ( = ?auto_23618 ?auto_23628 ) ) ( not ( = ?auto_23619 ?auto_23623 ) ) ( not ( = ?auto_23619 ?auto_23628 ) ) ( not ( = ?auto_23620 ?auto_23623 ) ) ( not ( = ?auto_23620 ?auto_23628 ) ) ( not ( = ?auto_23622 ?auto_23623 ) ) ( not ( = ?auto_23622 ?auto_23628 ) ) ( not ( = ?auto_23623 ?auto_23632 ) ) ( not ( = ?auto_23623 ?auto_23635 ) ) ( not ( = ?auto_23623 ?auto_23630 ) ) ( not ( = ?auto_23623 ?auto_23633 ) ) ( not ( = ?auto_23623 ?auto_23645 ) ) ( not ( = ?auto_23623 ?auto_23655 ) ) ( not ( = ?auto_23623 ?auto_23657 ) ) ( not ( = ?auto_23623 ?auto_23662 ) ) ( not ( = ?auto_23623 ?auto_23651 ) ) ( not ( = ?auto_23623 ?auto_23639 ) ) ( not ( = ?auto_23623 ?auto_23649 ) ) ( not ( = ?auto_23623 ?auto_23646 ) ) ( not ( = ?auto_23623 ?auto_23634 ) ) ( not ( = ?auto_23623 ?auto_23631 ) ) ( not ( = ?auto_23628 ?auto_23632 ) ) ( not ( = ?auto_23628 ?auto_23635 ) ) ( not ( = ?auto_23628 ?auto_23630 ) ) ( not ( = ?auto_23628 ?auto_23633 ) ) ( not ( = ?auto_23628 ?auto_23645 ) ) ( not ( = ?auto_23628 ?auto_23655 ) ) ( not ( = ?auto_23628 ?auto_23657 ) ) ( not ( = ?auto_23628 ?auto_23662 ) ) ( not ( = ?auto_23628 ?auto_23651 ) ) ( not ( = ?auto_23628 ?auto_23639 ) ) ( not ( = ?auto_23628 ?auto_23649 ) ) ( not ( = ?auto_23628 ?auto_23646 ) ) ( not ( = ?auto_23628 ?auto_23634 ) ) ( not ( = ?auto_23628 ?auto_23631 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_23608 ?auto_23609 ?auto_23610 ?auto_23611 ?auto_23612 ?auto_23613 ?auto_23614 ?auto_23615 ?auto_23616 ?auto_23617 ?auto_23618 ?auto_23619 ?auto_23620 ?auto_23622 ?auto_23621 )
      ( MAKE-1CRATE ?auto_23621 ?auto_23623 )
      ( MAKE-15CRATE-VERIFY ?auto_23608 ?auto_23609 ?auto_23610 ?auto_23611 ?auto_23612 ?auto_23613 ?auto_23614 ?auto_23615 ?auto_23616 ?auto_23617 ?auto_23618 ?auto_23619 ?auto_23620 ?auto_23622 ?auto_23621 ?auto_23623 ) )
  )

)

