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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11890 - SURFACE
      ?auto_11891 - SURFACE
    )
    :vars
    (
      ?auto_11892 - HOIST
      ?auto_11893 - PLACE
      ?auto_11895 - PLACE
      ?auto_11896 - HOIST
      ?auto_11897 - SURFACE
      ?auto_11894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11892 ?auto_11893 ) ( SURFACE-AT ?auto_11890 ?auto_11893 ) ( CLEAR ?auto_11890 ) ( IS-CRATE ?auto_11891 ) ( AVAILABLE ?auto_11892 ) ( not ( = ?auto_11895 ?auto_11893 ) ) ( HOIST-AT ?auto_11896 ?auto_11895 ) ( AVAILABLE ?auto_11896 ) ( SURFACE-AT ?auto_11891 ?auto_11895 ) ( ON ?auto_11891 ?auto_11897 ) ( CLEAR ?auto_11891 ) ( TRUCK-AT ?auto_11894 ?auto_11893 ) ( not ( = ?auto_11890 ?auto_11891 ) ) ( not ( = ?auto_11890 ?auto_11897 ) ) ( not ( = ?auto_11891 ?auto_11897 ) ) ( not ( = ?auto_11892 ?auto_11896 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11894 ?auto_11893 ?auto_11895 )
      ( !LIFT ?auto_11896 ?auto_11891 ?auto_11897 ?auto_11895 )
      ( !LOAD ?auto_11896 ?auto_11891 ?auto_11894 ?auto_11895 )
      ( !DRIVE ?auto_11894 ?auto_11895 ?auto_11893 )
      ( !UNLOAD ?auto_11892 ?auto_11891 ?auto_11894 ?auto_11893 )
      ( !DROP ?auto_11892 ?auto_11891 ?auto_11890 ?auto_11893 )
      ( MAKE-1CRATE-VERIFY ?auto_11890 ?auto_11891 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11911 - SURFACE
      ?auto_11912 - SURFACE
      ?auto_11913 - SURFACE
    )
    :vars
    (
      ?auto_11914 - HOIST
      ?auto_11917 - PLACE
      ?auto_11919 - PLACE
      ?auto_11915 - HOIST
      ?auto_11918 - SURFACE
      ?auto_11920 - PLACE
      ?auto_11921 - HOIST
      ?auto_11922 - SURFACE
      ?auto_11916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11914 ?auto_11917 ) ( IS-CRATE ?auto_11913 ) ( not ( = ?auto_11919 ?auto_11917 ) ) ( HOIST-AT ?auto_11915 ?auto_11919 ) ( AVAILABLE ?auto_11915 ) ( SURFACE-AT ?auto_11913 ?auto_11919 ) ( ON ?auto_11913 ?auto_11918 ) ( CLEAR ?auto_11913 ) ( not ( = ?auto_11912 ?auto_11913 ) ) ( not ( = ?auto_11912 ?auto_11918 ) ) ( not ( = ?auto_11913 ?auto_11918 ) ) ( not ( = ?auto_11914 ?auto_11915 ) ) ( SURFACE-AT ?auto_11911 ?auto_11917 ) ( CLEAR ?auto_11911 ) ( IS-CRATE ?auto_11912 ) ( AVAILABLE ?auto_11914 ) ( not ( = ?auto_11920 ?auto_11917 ) ) ( HOIST-AT ?auto_11921 ?auto_11920 ) ( AVAILABLE ?auto_11921 ) ( SURFACE-AT ?auto_11912 ?auto_11920 ) ( ON ?auto_11912 ?auto_11922 ) ( CLEAR ?auto_11912 ) ( TRUCK-AT ?auto_11916 ?auto_11917 ) ( not ( = ?auto_11911 ?auto_11912 ) ) ( not ( = ?auto_11911 ?auto_11922 ) ) ( not ( = ?auto_11912 ?auto_11922 ) ) ( not ( = ?auto_11914 ?auto_11921 ) ) ( not ( = ?auto_11911 ?auto_11913 ) ) ( not ( = ?auto_11911 ?auto_11918 ) ) ( not ( = ?auto_11913 ?auto_11922 ) ) ( not ( = ?auto_11919 ?auto_11920 ) ) ( not ( = ?auto_11915 ?auto_11921 ) ) ( not ( = ?auto_11918 ?auto_11922 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11911 ?auto_11912 )
      ( MAKE-1CRATE ?auto_11912 ?auto_11913 )
      ( MAKE-2CRATE-VERIFY ?auto_11911 ?auto_11912 ?auto_11913 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11937 - SURFACE
      ?auto_11938 - SURFACE
      ?auto_11939 - SURFACE
      ?auto_11940 - SURFACE
    )
    :vars
    (
      ?auto_11945 - HOIST
      ?auto_11946 - PLACE
      ?auto_11944 - PLACE
      ?auto_11942 - HOIST
      ?auto_11943 - SURFACE
      ?auto_11952 - PLACE
      ?auto_11951 - HOIST
      ?auto_11948 - SURFACE
      ?auto_11949 - PLACE
      ?auto_11947 - HOIST
      ?auto_11950 - SURFACE
      ?auto_11941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11945 ?auto_11946 ) ( IS-CRATE ?auto_11940 ) ( not ( = ?auto_11944 ?auto_11946 ) ) ( HOIST-AT ?auto_11942 ?auto_11944 ) ( AVAILABLE ?auto_11942 ) ( SURFACE-AT ?auto_11940 ?auto_11944 ) ( ON ?auto_11940 ?auto_11943 ) ( CLEAR ?auto_11940 ) ( not ( = ?auto_11939 ?auto_11940 ) ) ( not ( = ?auto_11939 ?auto_11943 ) ) ( not ( = ?auto_11940 ?auto_11943 ) ) ( not ( = ?auto_11945 ?auto_11942 ) ) ( IS-CRATE ?auto_11939 ) ( not ( = ?auto_11952 ?auto_11946 ) ) ( HOIST-AT ?auto_11951 ?auto_11952 ) ( AVAILABLE ?auto_11951 ) ( SURFACE-AT ?auto_11939 ?auto_11952 ) ( ON ?auto_11939 ?auto_11948 ) ( CLEAR ?auto_11939 ) ( not ( = ?auto_11938 ?auto_11939 ) ) ( not ( = ?auto_11938 ?auto_11948 ) ) ( not ( = ?auto_11939 ?auto_11948 ) ) ( not ( = ?auto_11945 ?auto_11951 ) ) ( SURFACE-AT ?auto_11937 ?auto_11946 ) ( CLEAR ?auto_11937 ) ( IS-CRATE ?auto_11938 ) ( AVAILABLE ?auto_11945 ) ( not ( = ?auto_11949 ?auto_11946 ) ) ( HOIST-AT ?auto_11947 ?auto_11949 ) ( AVAILABLE ?auto_11947 ) ( SURFACE-AT ?auto_11938 ?auto_11949 ) ( ON ?auto_11938 ?auto_11950 ) ( CLEAR ?auto_11938 ) ( TRUCK-AT ?auto_11941 ?auto_11946 ) ( not ( = ?auto_11937 ?auto_11938 ) ) ( not ( = ?auto_11937 ?auto_11950 ) ) ( not ( = ?auto_11938 ?auto_11950 ) ) ( not ( = ?auto_11945 ?auto_11947 ) ) ( not ( = ?auto_11937 ?auto_11939 ) ) ( not ( = ?auto_11937 ?auto_11948 ) ) ( not ( = ?auto_11939 ?auto_11950 ) ) ( not ( = ?auto_11952 ?auto_11949 ) ) ( not ( = ?auto_11951 ?auto_11947 ) ) ( not ( = ?auto_11948 ?auto_11950 ) ) ( not ( = ?auto_11937 ?auto_11940 ) ) ( not ( = ?auto_11937 ?auto_11943 ) ) ( not ( = ?auto_11938 ?auto_11940 ) ) ( not ( = ?auto_11938 ?auto_11943 ) ) ( not ( = ?auto_11940 ?auto_11948 ) ) ( not ( = ?auto_11940 ?auto_11950 ) ) ( not ( = ?auto_11944 ?auto_11952 ) ) ( not ( = ?auto_11944 ?auto_11949 ) ) ( not ( = ?auto_11942 ?auto_11951 ) ) ( not ( = ?auto_11942 ?auto_11947 ) ) ( not ( = ?auto_11943 ?auto_11948 ) ) ( not ( = ?auto_11943 ?auto_11950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11937 ?auto_11938 ?auto_11939 )
      ( MAKE-1CRATE ?auto_11939 ?auto_11940 )
      ( MAKE-3CRATE-VERIFY ?auto_11937 ?auto_11938 ?auto_11939 ?auto_11940 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11968 - SURFACE
      ?auto_11969 - SURFACE
      ?auto_11970 - SURFACE
      ?auto_11971 - SURFACE
      ?auto_11972 - SURFACE
    )
    :vars
    (
      ?auto_11973 - HOIST
      ?auto_11975 - PLACE
      ?auto_11974 - PLACE
      ?auto_11978 - HOIST
      ?auto_11977 - SURFACE
      ?auto_11983 - PLACE
      ?auto_11982 - HOIST
      ?auto_11985 - SURFACE
      ?auto_11980 - PLACE
      ?auto_11981 - HOIST
      ?auto_11986 - SURFACE
      ?auto_11979 - PLACE
      ?auto_11987 - HOIST
      ?auto_11984 - SURFACE
      ?auto_11976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11973 ?auto_11975 ) ( IS-CRATE ?auto_11972 ) ( not ( = ?auto_11974 ?auto_11975 ) ) ( HOIST-AT ?auto_11978 ?auto_11974 ) ( AVAILABLE ?auto_11978 ) ( SURFACE-AT ?auto_11972 ?auto_11974 ) ( ON ?auto_11972 ?auto_11977 ) ( CLEAR ?auto_11972 ) ( not ( = ?auto_11971 ?auto_11972 ) ) ( not ( = ?auto_11971 ?auto_11977 ) ) ( not ( = ?auto_11972 ?auto_11977 ) ) ( not ( = ?auto_11973 ?auto_11978 ) ) ( IS-CRATE ?auto_11971 ) ( not ( = ?auto_11983 ?auto_11975 ) ) ( HOIST-AT ?auto_11982 ?auto_11983 ) ( AVAILABLE ?auto_11982 ) ( SURFACE-AT ?auto_11971 ?auto_11983 ) ( ON ?auto_11971 ?auto_11985 ) ( CLEAR ?auto_11971 ) ( not ( = ?auto_11970 ?auto_11971 ) ) ( not ( = ?auto_11970 ?auto_11985 ) ) ( not ( = ?auto_11971 ?auto_11985 ) ) ( not ( = ?auto_11973 ?auto_11982 ) ) ( IS-CRATE ?auto_11970 ) ( not ( = ?auto_11980 ?auto_11975 ) ) ( HOIST-AT ?auto_11981 ?auto_11980 ) ( AVAILABLE ?auto_11981 ) ( SURFACE-AT ?auto_11970 ?auto_11980 ) ( ON ?auto_11970 ?auto_11986 ) ( CLEAR ?auto_11970 ) ( not ( = ?auto_11969 ?auto_11970 ) ) ( not ( = ?auto_11969 ?auto_11986 ) ) ( not ( = ?auto_11970 ?auto_11986 ) ) ( not ( = ?auto_11973 ?auto_11981 ) ) ( SURFACE-AT ?auto_11968 ?auto_11975 ) ( CLEAR ?auto_11968 ) ( IS-CRATE ?auto_11969 ) ( AVAILABLE ?auto_11973 ) ( not ( = ?auto_11979 ?auto_11975 ) ) ( HOIST-AT ?auto_11987 ?auto_11979 ) ( AVAILABLE ?auto_11987 ) ( SURFACE-AT ?auto_11969 ?auto_11979 ) ( ON ?auto_11969 ?auto_11984 ) ( CLEAR ?auto_11969 ) ( TRUCK-AT ?auto_11976 ?auto_11975 ) ( not ( = ?auto_11968 ?auto_11969 ) ) ( not ( = ?auto_11968 ?auto_11984 ) ) ( not ( = ?auto_11969 ?auto_11984 ) ) ( not ( = ?auto_11973 ?auto_11987 ) ) ( not ( = ?auto_11968 ?auto_11970 ) ) ( not ( = ?auto_11968 ?auto_11986 ) ) ( not ( = ?auto_11970 ?auto_11984 ) ) ( not ( = ?auto_11980 ?auto_11979 ) ) ( not ( = ?auto_11981 ?auto_11987 ) ) ( not ( = ?auto_11986 ?auto_11984 ) ) ( not ( = ?auto_11968 ?auto_11971 ) ) ( not ( = ?auto_11968 ?auto_11985 ) ) ( not ( = ?auto_11969 ?auto_11971 ) ) ( not ( = ?auto_11969 ?auto_11985 ) ) ( not ( = ?auto_11971 ?auto_11986 ) ) ( not ( = ?auto_11971 ?auto_11984 ) ) ( not ( = ?auto_11983 ?auto_11980 ) ) ( not ( = ?auto_11983 ?auto_11979 ) ) ( not ( = ?auto_11982 ?auto_11981 ) ) ( not ( = ?auto_11982 ?auto_11987 ) ) ( not ( = ?auto_11985 ?auto_11986 ) ) ( not ( = ?auto_11985 ?auto_11984 ) ) ( not ( = ?auto_11968 ?auto_11972 ) ) ( not ( = ?auto_11968 ?auto_11977 ) ) ( not ( = ?auto_11969 ?auto_11972 ) ) ( not ( = ?auto_11969 ?auto_11977 ) ) ( not ( = ?auto_11970 ?auto_11972 ) ) ( not ( = ?auto_11970 ?auto_11977 ) ) ( not ( = ?auto_11972 ?auto_11985 ) ) ( not ( = ?auto_11972 ?auto_11986 ) ) ( not ( = ?auto_11972 ?auto_11984 ) ) ( not ( = ?auto_11974 ?auto_11983 ) ) ( not ( = ?auto_11974 ?auto_11980 ) ) ( not ( = ?auto_11974 ?auto_11979 ) ) ( not ( = ?auto_11978 ?auto_11982 ) ) ( not ( = ?auto_11978 ?auto_11981 ) ) ( not ( = ?auto_11978 ?auto_11987 ) ) ( not ( = ?auto_11977 ?auto_11985 ) ) ( not ( = ?auto_11977 ?auto_11986 ) ) ( not ( = ?auto_11977 ?auto_11984 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_11968 ?auto_11969 ?auto_11970 ?auto_11971 )
      ( MAKE-1CRATE ?auto_11971 ?auto_11972 )
      ( MAKE-4CRATE-VERIFY ?auto_11968 ?auto_11969 ?auto_11970 ?auto_11971 ?auto_11972 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_12004 - SURFACE
      ?auto_12005 - SURFACE
      ?auto_12006 - SURFACE
      ?auto_12007 - SURFACE
      ?auto_12008 - SURFACE
      ?auto_12009 - SURFACE
    )
    :vars
    (
      ?auto_12013 - HOIST
      ?auto_12010 - PLACE
      ?auto_12014 - PLACE
      ?auto_12011 - HOIST
      ?auto_12012 - SURFACE
      ?auto_12020 - PLACE
      ?auto_12018 - HOIST
      ?auto_12021 - SURFACE
      ?auto_12025 - PLACE
      ?auto_12016 - HOIST
      ?auto_12022 - SURFACE
      ?auto_12019 - SURFACE
      ?auto_12024 - PLACE
      ?auto_12017 - HOIST
      ?auto_12023 - SURFACE
      ?auto_12015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12013 ?auto_12010 ) ( IS-CRATE ?auto_12009 ) ( not ( = ?auto_12014 ?auto_12010 ) ) ( HOIST-AT ?auto_12011 ?auto_12014 ) ( SURFACE-AT ?auto_12009 ?auto_12014 ) ( ON ?auto_12009 ?auto_12012 ) ( CLEAR ?auto_12009 ) ( not ( = ?auto_12008 ?auto_12009 ) ) ( not ( = ?auto_12008 ?auto_12012 ) ) ( not ( = ?auto_12009 ?auto_12012 ) ) ( not ( = ?auto_12013 ?auto_12011 ) ) ( IS-CRATE ?auto_12008 ) ( not ( = ?auto_12020 ?auto_12010 ) ) ( HOIST-AT ?auto_12018 ?auto_12020 ) ( AVAILABLE ?auto_12018 ) ( SURFACE-AT ?auto_12008 ?auto_12020 ) ( ON ?auto_12008 ?auto_12021 ) ( CLEAR ?auto_12008 ) ( not ( = ?auto_12007 ?auto_12008 ) ) ( not ( = ?auto_12007 ?auto_12021 ) ) ( not ( = ?auto_12008 ?auto_12021 ) ) ( not ( = ?auto_12013 ?auto_12018 ) ) ( IS-CRATE ?auto_12007 ) ( not ( = ?auto_12025 ?auto_12010 ) ) ( HOIST-AT ?auto_12016 ?auto_12025 ) ( AVAILABLE ?auto_12016 ) ( SURFACE-AT ?auto_12007 ?auto_12025 ) ( ON ?auto_12007 ?auto_12022 ) ( CLEAR ?auto_12007 ) ( not ( = ?auto_12006 ?auto_12007 ) ) ( not ( = ?auto_12006 ?auto_12022 ) ) ( not ( = ?auto_12007 ?auto_12022 ) ) ( not ( = ?auto_12013 ?auto_12016 ) ) ( IS-CRATE ?auto_12006 ) ( AVAILABLE ?auto_12011 ) ( SURFACE-AT ?auto_12006 ?auto_12014 ) ( ON ?auto_12006 ?auto_12019 ) ( CLEAR ?auto_12006 ) ( not ( = ?auto_12005 ?auto_12006 ) ) ( not ( = ?auto_12005 ?auto_12019 ) ) ( not ( = ?auto_12006 ?auto_12019 ) ) ( SURFACE-AT ?auto_12004 ?auto_12010 ) ( CLEAR ?auto_12004 ) ( IS-CRATE ?auto_12005 ) ( AVAILABLE ?auto_12013 ) ( not ( = ?auto_12024 ?auto_12010 ) ) ( HOIST-AT ?auto_12017 ?auto_12024 ) ( AVAILABLE ?auto_12017 ) ( SURFACE-AT ?auto_12005 ?auto_12024 ) ( ON ?auto_12005 ?auto_12023 ) ( CLEAR ?auto_12005 ) ( TRUCK-AT ?auto_12015 ?auto_12010 ) ( not ( = ?auto_12004 ?auto_12005 ) ) ( not ( = ?auto_12004 ?auto_12023 ) ) ( not ( = ?auto_12005 ?auto_12023 ) ) ( not ( = ?auto_12013 ?auto_12017 ) ) ( not ( = ?auto_12004 ?auto_12006 ) ) ( not ( = ?auto_12004 ?auto_12019 ) ) ( not ( = ?auto_12006 ?auto_12023 ) ) ( not ( = ?auto_12014 ?auto_12024 ) ) ( not ( = ?auto_12011 ?auto_12017 ) ) ( not ( = ?auto_12019 ?auto_12023 ) ) ( not ( = ?auto_12004 ?auto_12007 ) ) ( not ( = ?auto_12004 ?auto_12022 ) ) ( not ( = ?auto_12005 ?auto_12007 ) ) ( not ( = ?auto_12005 ?auto_12022 ) ) ( not ( = ?auto_12007 ?auto_12019 ) ) ( not ( = ?auto_12007 ?auto_12023 ) ) ( not ( = ?auto_12025 ?auto_12014 ) ) ( not ( = ?auto_12025 ?auto_12024 ) ) ( not ( = ?auto_12016 ?auto_12011 ) ) ( not ( = ?auto_12016 ?auto_12017 ) ) ( not ( = ?auto_12022 ?auto_12019 ) ) ( not ( = ?auto_12022 ?auto_12023 ) ) ( not ( = ?auto_12004 ?auto_12008 ) ) ( not ( = ?auto_12004 ?auto_12021 ) ) ( not ( = ?auto_12005 ?auto_12008 ) ) ( not ( = ?auto_12005 ?auto_12021 ) ) ( not ( = ?auto_12006 ?auto_12008 ) ) ( not ( = ?auto_12006 ?auto_12021 ) ) ( not ( = ?auto_12008 ?auto_12022 ) ) ( not ( = ?auto_12008 ?auto_12019 ) ) ( not ( = ?auto_12008 ?auto_12023 ) ) ( not ( = ?auto_12020 ?auto_12025 ) ) ( not ( = ?auto_12020 ?auto_12014 ) ) ( not ( = ?auto_12020 ?auto_12024 ) ) ( not ( = ?auto_12018 ?auto_12016 ) ) ( not ( = ?auto_12018 ?auto_12011 ) ) ( not ( = ?auto_12018 ?auto_12017 ) ) ( not ( = ?auto_12021 ?auto_12022 ) ) ( not ( = ?auto_12021 ?auto_12019 ) ) ( not ( = ?auto_12021 ?auto_12023 ) ) ( not ( = ?auto_12004 ?auto_12009 ) ) ( not ( = ?auto_12004 ?auto_12012 ) ) ( not ( = ?auto_12005 ?auto_12009 ) ) ( not ( = ?auto_12005 ?auto_12012 ) ) ( not ( = ?auto_12006 ?auto_12009 ) ) ( not ( = ?auto_12006 ?auto_12012 ) ) ( not ( = ?auto_12007 ?auto_12009 ) ) ( not ( = ?auto_12007 ?auto_12012 ) ) ( not ( = ?auto_12009 ?auto_12021 ) ) ( not ( = ?auto_12009 ?auto_12022 ) ) ( not ( = ?auto_12009 ?auto_12019 ) ) ( not ( = ?auto_12009 ?auto_12023 ) ) ( not ( = ?auto_12012 ?auto_12021 ) ) ( not ( = ?auto_12012 ?auto_12022 ) ) ( not ( = ?auto_12012 ?auto_12019 ) ) ( not ( = ?auto_12012 ?auto_12023 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_12004 ?auto_12005 ?auto_12006 ?auto_12007 ?auto_12008 )
      ( MAKE-1CRATE ?auto_12008 ?auto_12009 )
      ( MAKE-5CRATE-VERIFY ?auto_12004 ?auto_12005 ?auto_12006 ?auto_12007 ?auto_12008 ?auto_12009 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_12043 - SURFACE
      ?auto_12044 - SURFACE
      ?auto_12045 - SURFACE
      ?auto_12046 - SURFACE
      ?auto_12047 - SURFACE
      ?auto_12048 - SURFACE
      ?auto_12049 - SURFACE
    )
    :vars
    (
      ?auto_12055 - HOIST
      ?auto_12051 - PLACE
      ?auto_12054 - PLACE
      ?auto_12053 - HOIST
      ?auto_12050 - SURFACE
      ?auto_12059 - PLACE
      ?auto_12062 - HOIST
      ?auto_12056 - SURFACE
      ?auto_12066 - PLACE
      ?auto_12058 - HOIST
      ?auto_12065 - SURFACE
      ?auto_12061 - PLACE
      ?auto_12063 - HOIST
      ?auto_12067 - SURFACE
      ?auto_12064 - SURFACE
      ?auto_12060 - PLACE
      ?auto_12057 - HOIST
      ?auto_12068 - SURFACE
      ?auto_12052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12055 ?auto_12051 ) ( IS-CRATE ?auto_12049 ) ( not ( = ?auto_12054 ?auto_12051 ) ) ( HOIST-AT ?auto_12053 ?auto_12054 ) ( AVAILABLE ?auto_12053 ) ( SURFACE-AT ?auto_12049 ?auto_12054 ) ( ON ?auto_12049 ?auto_12050 ) ( CLEAR ?auto_12049 ) ( not ( = ?auto_12048 ?auto_12049 ) ) ( not ( = ?auto_12048 ?auto_12050 ) ) ( not ( = ?auto_12049 ?auto_12050 ) ) ( not ( = ?auto_12055 ?auto_12053 ) ) ( IS-CRATE ?auto_12048 ) ( not ( = ?auto_12059 ?auto_12051 ) ) ( HOIST-AT ?auto_12062 ?auto_12059 ) ( SURFACE-AT ?auto_12048 ?auto_12059 ) ( ON ?auto_12048 ?auto_12056 ) ( CLEAR ?auto_12048 ) ( not ( = ?auto_12047 ?auto_12048 ) ) ( not ( = ?auto_12047 ?auto_12056 ) ) ( not ( = ?auto_12048 ?auto_12056 ) ) ( not ( = ?auto_12055 ?auto_12062 ) ) ( IS-CRATE ?auto_12047 ) ( not ( = ?auto_12066 ?auto_12051 ) ) ( HOIST-AT ?auto_12058 ?auto_12066 ) ( AVAILABLE ?auto_12058 ) ( SURFACE-AT ?auto_12047 ?auto_12066 ) ( ON ?auto_12047 ?auto_12065 ) ( CLEAR ?auto_12047 ) ( not ( = ?auto_12046 ?auto_12047 ) ) ( not ( = ?auto_12046 ?auto_12065 ) ) ( not ( = ?auto_12047 ?auto_12065 ) ) ( not ( = ?auto_12055 ?auto_12058 ) ) ( IS-CRATE ?auto_12046 ) ( not ( = ?auto_12061 ?auto_12051 ) ) ( HOIST-AT ?auto_12063 ?auto_12061 ) ( AVAILABLE ?auto_12063 ) ( SURFACE-AT ?auto_12046 ?auto_12061 ) ( ON ?auto_12046 ?auto_12067 ) ( CLEAR ?auto_12046 ) ( not ( = ?auto_12045 ?auto_12046 ) ) ( not ( = ?auto_12045 ?auto_12067 ) ) ( not ( = ?auto_12046 ?auto_12067 ) ) ( not ( = ?auto_12055 ?auto_12063 ) ) ( IS-CRATE ?auto_12045 ) ( AVAILABLE ?auto_12062 ) ( SURFACE-AT ?auto_12045 ?auto_12059 ) ( ON ?auto_12045 ?auto_12064 ) ( CLEAR ?auto_12045 ) ( not ( = ?auto_12044 ?auto_12045 ) ) ( not ( = ?auto_12044 ?auto_12064 ) ) ( not ( = ?auto_12045 ?auto_12064 ) ) ( SURFACE-AT ?auto_12043 ?auto_12051 ) ( CLEAR ?auto_12043 ) ( IS-CRATE ?auto_12044 ) ( AVAILABLE ?auto_12055 ) ( not ( = ?auto_12060 ?auto_12051 ) ) ( HOIST-AT ?auto_12057 ?auto_12060 ) ( AVAILABLE ?auto_12057 ) ( SURFACE-AT ?auto_12044 ?auto_12060 ) ( ON ?auto_12044 ?auto_12068 ) ( CLEAR ?auto_12044 ) ( TRUCK-AT ?auto_12052 ?auto_12051 ) ( not ( = ?auto_12043 ?auto_12044 ) ) ( not ( = ?auto_12043 ?auto_12068 ) ) ( not ( = ?auto_12044 ?auto_12068 ) ) ( not ( = ?auto_12055 ?auto_12057 ) ) ( not ( = ?auto_12043 ?auto_12045 ) ) ( not ( = ?auto_12043 ?auto_12064 ) ) ( not ( = ?auto_12045 ?auto_12068 ) ) ( not ( = ?auto_12059 ?auto_12060 ) ) ( not ( = ?auto_12062 ?auto_12057 ) ) ( not ( = ?auto_12064 ?auto_12068 ) ) ( not ( = ?auto_12043 ?auto_12046 ) ) ( not ( = ?auto_12043 ?auto_12067 ) ) ( not ( = ?auto_12044 ?auto_12046 ) ) ( not ( = ?auto_12044 ?auto_12067 ) ) ( not ( = ?auto_12046 ?auto_12064 ) ) ( not ( = ?auto_12046 ?auto_12068 ) ) ( not ( = ?auto_12061 ?auto_12059 ) ) ( not ( = ?auto_12061 ?auto_12060 ) ) ( not ( = ?auto_12063 ?auto_12062 ) ) ( not ( = ?auto_12063 ?auto_12057 ) ) ( not ( = ?auto_12067 ?auto_12064 ) ) ( not ( = ?auto_12067 ?auto_12068 ) ) ( not ( = ?auto_12043 ?auto_12047 ) ) ( not ( = ?auto_12043 ?auto_12065 ) ) ( not ( = ?auto_12044 ?auto_12047 ) ) ( not ( = ?auto_12044 ?auto_12065 ) ) ( not ( = ?auto_12045 ?auto_12047 ) ) ( not ( = ?auto_12045 ?auto_12065 ) ) ( not ( = ?auto_12047 ?auto_12067 ) ) ( not ( = ?auto_12047 ?auto_12064 ) ) ( not ( = ?auto_12047 ?auto_12068 ) ) ( not ( = ?auto_12066 ?auto_12061 ) ) ( not ( = ?auto_12066 ?auto_12059 ) ) ( not ( = ?auto_12066 ?auto_12060 ) ) ( not ( = ?auto_12058 ?auto_12063 ) ) ( not ( = ?auto_12058 ?auto_12062 ) ) ( not ( = ?auto_12058 ?auto_12057 ) ) ( not ( = ?auto_12065 ?auto_12067 ) ) ( not ( = ?auto_12065 ?auto_12064 ) ) ( not ( = ?auto_12065 ?auto_12068 ) ) ( not ( = ?auto_12043 ?auto_12048 ) ) ( not ( = ?auto_12043 ?auto_12056 ) ) ( not ( = ?auto_12044 ?auto_12048 ) ) ( not ( = ?auto_12044 ?auto_12056 ) ) ( not ( = ?auto_12045 ?auto_12048 ) ) ( not ( = ?auto_12045 ?auto_12056 ) ) ( not ( = ?auto_12046 ?auto_12048 ) ) ( not ( = ?auto_12046 ?auto_12056 ) ) ( not ( = ?auto_12048 ?auto_12065 ) ) ( not ( = ?auto_12048 ?auto_12067 ) ) ( not ( = ?auto_12048 ?auto_12064 ) ) ( not ( = ?auto_12048 ?auto_12068 ) ) ( not ( = ?auto_12056 ?auto_12065 ) ) ( not ( = ?auto_12056 ?auto_12067 ) ) ( not ( = ?auto_12056 ?auto_12064 ) ) ( not ( = ?auto_12056 ?auto_12068 ) ) ( not ( = ?auto_12043 ?auto_12049 ) ) ( not ( = ?auto_12043 ?auto_12050 ) ) ( not ( = ?auto_12044 ?auto_12049 ) ) ( not ( = ?auto_12044 ?auto_12050 ) ) ( not ( = ?auto_12045 ?auto_12049 ) ) ( not ( = ?auto_12045 ?auto_12050 ) ) ( not ( = ?auto_12046 ?auto_12049 ) ) ( not ( = ?auto_12046 ?auto_12050 ) ) ( not ( = ?auto_12047 ?auto_12049 ) ) ( not ( = ?auto_12047 ?auto_12050 ) ) ( not ( = ?auto_12049 ?auto_12056 ) ) ( not ( = ?auto_12049 ?auto_12065 ) ) ( not ( = ?auto_12049 ?auto_12067 ) ) ( not ( = ?auto_12049 ?auto_12064 ) ) ( not ( = ?auto_12049 ?auto_12068 ) ) ( not ( = ?auto_12054 ?auto_12059 ) ) ( not ( = ?auto_12054 ?auto_12066 ) ) ( not ( = ?auto_12054 ?auto_12061 ) ) ( not ( = ?auto_12054 ?auto_12060 ) ) ( not ( = ?auto_12053 ?auto_12062 ) ) ( not ( = ?auto_12053 ?auto_12058 ) ) ( not ( = ?auto_12053 ?auto_12063 ) ) ( not ( = ?auto_12053 ?auto_12057 ) ) ( not ( = ?auto_12050 ?auto_12056 ) ) ( not ( = ?auto_12050 ?auto_12065 ) ) ( not ( = ?auto_12050 ?auto_12067 ) ) ( not ( = ?auto_12050 ?auto_12064 ) ) ( not ( = ?auto_12050 ?auto_12068 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_12043 ?auto_12044 ?auto_12045 ?auto_12046 ?auto_12047 ?auto_12048 )
      ( MAKE-1CRATE ?auto_12048 ?auto_12049 )
      ( MAKE-6CRATE-VERIFY ?auto_12043 ?auto_12044 ?auto_12045 ?auto_12046 ?auto_12047 ?auto_12048 ?auto_12049 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_12087 - SURFACE
      ?auto_12088 - SURFACE
      ?auto_12089 - SURFACE
      ?auto_12090 - SURFACE
      ?auto_12091 - SURFACE
      ?auto_12092 - SURFACE
      ?auto_12093 - SURFACE
      ?auto_12094 - SURFACE
    )
    :vars
    (
      ?auto_12100 - HOIST
      ?auto_12095 - PLACE
      ?auto_12098 - PLACE
      ?auto_12099 - HOIST
      ?auto_12097 - SURFACE
      ?auto_12104 - PLACE
      ?auto_12101 - HOIST
      ?auto_12102 - SURFACE
      ?auto_12114 - PLACE
      ?auto_12109 - HOIST
      ?auto_12105 - SURFACE
      ?auto_12112 - PLACE
      ?auto_12103 - HOIST
      ?auto_12113 - SURFACE
      ?auto_12110 - PLACE
      ?auto_12108 - HOIST
      ?auto_12106 - SURFACE
      ?auto_12111 - SURFACE
      ?auto_12107 - SURFACE
      ?auto_12096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12100 ?auto_12095 ) ( IS-CRATE ?auto_12094 ) ( not ( = ?auto_12098 ?auto_12095 ) ) ( HOIST-AT ?auto_12099 ?auto_12098 ) ( SURFACE-AT ?auto_12094 ?auto_12098 ) ( ON ?auto_12094 ?auto_12097 ) ( CLEAR ?auto_12094 ) ( not ( = ?auto_12093 ?auto_12094 ) ) ( not ( = ?auto_12093 ?auto_12097 ) ) ( not ( = ?auto_12094 ?auto_12097 ) ) ( not ( = ?auto_12100 ?auto_12099 ) ) ( IS-CRATE ?auto_12093 ) ( not ( = ?auto_12104 ?auto_12095 ) ) ( HOIST-AT ?auto_12101 ?auto_12104 ) ( AVAILABLE ?auto_12101 ) ( SURFACE-AT ?auto_12093 ?auto_12104 ) ( ON ?auto_12093 ?auto_12102 ) ( CLEAR ?auto_12093 ) ( not ( = ?auto_12092 ?auto_12093 ) ) ( not ( = ?auto_12092 ?auto_12102 ) ) ( not ( = ?auto_12093 ?auto_12102 ) ) ( not ( = ?auto_12100 ?auto_12101 ) ) ( IS-CRATE ?auto_12092 ) ( not ( = ?auto_12114 ?auto_12095 ) ) ( HOIST-AT ?auto_12109 ?auto_12114 ) ( SURFACE-AT ?auto_12092 ?auto_12114 ) ( ON ?auto_12092 ?auto_12105 ) ( CLEAR ?auto_12092 ) ( not ( = ?auto_12091 ?auto_12092 ) ) ( not ( = ?auto_12091 ?auto_12105 ) ) ( not ( = ?auto_12092 ?auto_12105 ) ) ( not ( = ?auto_12100 ?auto_12109 ) ) ( IS-CRATE ?auto_12091 ) ( not ( = ?auto_12112 ?auto_12095 ) ) ( HOIST-AT ?auto_12103 ?auto_12112 ) ( AVAILABLE ?auto_12103 ) ( SURFACE-AT ?auto_12091 ?auto_12112 ) ( ON ?auto_12091 ?auto_12113 ) ( CLEAR ?auto_12091 ) ( not ( = ?auto_12090 ?auto_12091 ) ) ( not ( = ?auto_12090 ?auto_12113 ) ) ( not ( = ?auto_12091 ?auto_12113 ) ) ( not ( = ?auto_12100 ?auto_12103 ) ) ( IS-CRATE ?auto_12090 ) ( not ( = ?auto_12110 ?auto_12095 ) ) ( HOIST-AT ?auto_12108 ?auto_12110 ) ( AVAILABLE ?auto_12108 ) ( SURFACE-AT ?auto_12090 ?auto_12110 ) ( ON ?auto_12090 ?auto_12106 ) ( CLEAR ?auto_12090 ) ( not ( = ?auto_12089 ?auto_12090 ) ) ( not ( = ?auto_12089 ?auto_12106 ) ) ( not ( = ?auto_12090 ?auto_12106 ) ) ( not ( = ?auto_12100 ?auto_12108 ) ) ( IS-CRATE ?auto_12089 ) ( AVAILABLE ?auto_12109 ) ( SURFACE-AT ?auto_12089 ?auto_12114 ) ( ON ?auto_12089 ?auto_12111 ) ( CLEAR ?auto_12089 ) ( not ( = ?auto_12088 ?auto_12089 ) ) ( not ( = ?auto_12088 ?auto_12111 ) ) ( not ( = ?auto_12089 ?auto_12111 ) ) ( SURFACE-AT ?auto_12087 ?auto_12095 ) ( CLEAR ?auto_12087 ) ( IS-CRATE ?auto_12088 ) ( AVAILABLE ?auto_12100 ) ( AVAILABLE ?auto_12099 ) ( SURFACE-AT ?auto_12088 ?auto_12098 ) ( ON ?auto_12088 ?auto_12107 ) ( CLEAR ?auto_12088 ) ( TRUCK-AT ?auto_12096 ?auto_12095 ) ( not ( = ?auto_12087 ?auto_12088 ) ) ( not ( = ?auto_12087 ?auto_12107 ) ) ( not ( = ?auto_12088 ?auto_12107 ) ) ( not ( = ?auto_12087 ?auto_12089 ) ) ( not ( = ?auto_12087 ?auto_12111 ) ) ( not ( = ?auto_12089 ?auto_12107 ) ) ( not ( = ?auto_12114 ?auto_12098 ) ) ( not ( = ?auto_12109 ?auto_12099 ) ) ( not ( = ?auto_12111 ?auto_12107 ) ) ( not ( = ?auto_12087 ?auto_12090 ) ) ( not ( = ?auto_12087 ?auto_12106 ) ) ( not ( = ?auto_12088 ?auto_12090 ) ) ( not ( = ?auto_12088 ?auto_12106 ) ) ( not ( = ?auto_12090 ?auto_12111 ) ) ( not ( = ?auto_12090 ?auto_12107 ) ) ( not ( = ?auto_12110 ?auto_12114 ) ) ( not ( = ?auto_12110 ?auto_12098 ) ) ( not ( = ?auto_12108 ?auto_12109 ) ) ( not ( = ?auto_12108 ?auto_12099 ) ) ( not ( = ?auto_12106 ?auto_12111 ) ) ( not ( = ?auto_12106 ?auto_12107 ) ) ( not ( = ?auto_12087 ?auto_12091 ) ) ( not ( = ?auto_12087 ?auto_12113 ) ) ( not ( = ?auto_12088 ?auto_12091 ) ) ( not ( = ?auto_12088 ?auto_12113 ) ) ( not ( = ?auto_12089 ?auto_12091 ) ) ( not ( = ?auto_12089 ?auto_12113 ) ) ( not ( = ?auto_12091 ?auto_12106 ) ) ( not ( = ?auto_12091 ?auto_12111 ) ) ( not ( = ?auto_12091 ?auto_12107 ) ) ( not ( = ?auto_12112 ?auto_12110 ) ) ( not ( = ?auto_12112 ?auto_12114 ) ) ( not ( = ?auto_12112 ?auto_12098 ) ) ( not ( = ?auto_12103 ?auto_12108 ) ) ( not ( = ?auto_12103 ?auto_12109 ) ) ( not ( = ?auto_12103 ?auto_12099 ) ) ( not ( = ?auto_12113 ?auto_12106 ) ) ( not ( = ?auto_12113 ?auto_12111 ) ) ( not ( = ?auto_12113 ?auto_12107 ) ) ( not ( = ?auto_12087 ?auto_12092 ) ) ( not ( = ?auto_12087 ?auto_12105 ) ) ( not ( = ?auto_12088 ?auto_12092 ) ) ( not ( = ?auto_12088 ?auto_12105 ) ) ( not ( = ?auto_12089 ?auto_12092 ) ) ( not ( = ?auto_12089 ?auto_12105 ) ) ( not ( = ?auto_12090 ?auto_12092 ) ) ( not ( = ?auto_12090 ?auto_12105 ) ) ( not ( = ?auto_12092 ?auto_12113 ) ) ( not ( = ?auto_12092 ?auto_12106 ) ) ( not ( = ?auto_12092 ?auto_12111 ) ) ( not ( = ?auto_12092 ?auto_12107 ) ) ( not ( = ?auto_12105 ?auto_12113 ) ) ( not ( = ?auto_12105 ?auto_12106 ) ) ( not ( = ?auto_12105 ?auto_12111 ) ) ( not ( = ?auto_12105 ?auto_12107 ) ) ( not ( = ?auto_12087 ?auto_12093 ) ) ( not ( = ?auto_12087 ?auto_12102 ) ) ( not ( = ?auto_12088 ?auto_12093 ) ) ( not ( = ?auto_12088 ?auto_12102 ) ) ( not ( = ?auto_12089 ?auto_12093 ) ) ( not ( = ?auto_12089 ?auto_12102 ) ) ( not ( = ?auto_12090 ?auto_12093 ) ) ( not ( = ?auto_12090 ?auto_12102 ) ) ( not ( = ?auto_12091 ?auto_12093 ) ) ( not ( = ?auto_12091 ?auto_12102 ) ) ( not ( = ?auto_12093 ?auto_12105 ) ) ( not ( = ?auto_12093 ?auto_12113 ) ) ( not ( = ?auto_12093 ?auto_12106 ) ) ( not ( = ?auto_12093 ?auto_12111 ) ) ( not ( = ?auto_12093 ?auto_12107 ) ) ( not ( = ?auto_12104 ?auto_12114 ) ) ( not ( = ?auto_12104 ?auto_12112 ) ) ( not ( = ?auto_12104 ?auto_12110 ) ) ( not ( = ?auto_12104 ?auto_12098 ) ) ( not ( = ?auto_12101 ?auto_12109 ) ) ( not ( = ?auto_12101 ?auto_12103 ) ) ( not ( = ?auto_12101 ?auto_12108 ) ) ( not ( = ?auto_12101 ?auto_12099 ) ) ( not ( = ?auto_12102 ?auto_12105 ) ) ( not ( = ?auto_12102 ?auto_12113 ) ) ( not ( = ?auto_12102 ?auto_12106 ) ) ( not ( = ?auto_12102 ?auto_12111 ) ) ( not ( = ?auto_12102 ?auto_12107 ) ) ( not ( = ?auto_12087 ?auto_12094 ) ) ( not ( = ?auto_12087 ?auto_12097 ) ) ( not ( = ?auto_12088 ?auto_12094 ) ) ( not ( = ?auto_12088 ?auto_12097 ) ) ( not ( = ?auto_12089 ?auto_12094 ) ) ( not ( = ?auto_12089 ?auto_12097 ) ) ( not ( = ?auto_12090 ?auto_12094 ) ) ( not ( = ?auto_12090 ?auto_12097 ) ) ( not ( = ?auto_12091 ?auto_12094 ) ) ( not ( = ?auto_12091 ?auto_12097 ) ) ( not ( = ?auto_12092 ?auto_12094 ) ) ( not ( = ?auto_12092 ?auto_12097 ) ) ( not ( = ?auto_12094 ?auto_12102 ) ) ( not ( = ?auto_12094 ?auto_12105 ) ) ( not ( = ?auto_12094 ?auto_12113 ) ) ( not ( = ?auto_12094 ?auto_12106 ) ) ( not ( = ?auto_12094 ?auto_12111 ) ) ( not ( = ?auto_12094 ?auto_12107 ) ) ( not ( = ?auto_12097 ?auto_12102 ) ) ( not ( = ?auto_12097 ?auto_12105 ) ) ( not ( = ?auto_12097 ?auto_12113 ) ) ( not ( = ?auto_12097 ?auto_12106 ) ) ( not ( = ?auto_12097 ?auto_12111 ) ) ( not ( = ?auto_12097 ?auto_12107 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_12087 ?auto_12088 ?auto_12089 ?auto_12090 ?auto_12091 ?auto_12092 ?auto_12093 )
      ( MAKE-1CRATE ?auto_12093 ?auto_12094 )
      ( MAKE-7CRATE-VERIFY ?auto_12087 ?auto_12088 ?auto_12089 ?auto_12090 ?auto_12091 ?auto_12092 ?auto_12093 ?auto_12094 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_12134 - SURFACE
      ?auto_12135 - SURFACE
      ?auto_12136 - SURFACE
      ?auto_12137 - SURFACE
      ?auto_12138 - SURFACE
      ?auto_12139 - SURFACE
      ?auto_12140 - SURFACE
      ?auto_12141 - SURFACE
      ?auto_12142 - SURFACE
    )
    :vars
    (
      ?auto_12144 - HOIST
      ?auto_12146 - PLACE
      ?auto_12148 - PLACE
      ?auto_12147 - HOIST
      ?auto_12143 - SURFACE
      ?auto_12163 - PLACE
      ?auto_12157 - HOIST
      ?auto_12164 - SURFACE
      ?auto_12149 - PLACE
      ?auto_12165 - HOIST
      ?auto_12153 - SURFACE
      ?auto_12159 - PLACE
      ?auto_12161 - HOIST
      ?auto_12150 - SURFACE
      ?auto_12158 - PLACE
      ?auto_12156 - HOIST
      ?auto_12154 - SURFACE
      ?auto_12160 - PLACE
      ?auto_12155 - HOIST
      ?auto_12152 - SURFACE
      ?auto_12162 - SURFACE
      ?auto_12151 - SURFACE
      ?auto_12145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12144 ?auto_12146 ) ( IS-CRATE ?auto_12142 ) ( not ( = ?auto_12148 ?auto_12146 ) ) ( HOIST-AT ?auto_12147 ?auto_12148 ) ( AVAILABLE ?auto_12147 ) ( SURFACE-AT ?auto_12142 ?auto_12148 ) ( ON ?auto_12142 ?auto_12143 ) ( CLEAR ?auto_12142 ) ( not ( = ?auto_12141 ?auto_12142 ) ) ( not ( = ?auto_12141 ?auto_12143 ) ) ( not ( = ?auto_12142 ?auto_12143 ) ) ( not ( = ?auto_12144 ?auto_12147 ) ) ( IS-CRATE ?auto_12141 ) ( not ( = ?auto_12163 ?auto_12146 ) ) ( HOIST-AT ?auto_12157 ?auto_12163 ) ( SURFACE-AT ?auto_12141 ?auto_12163 ) ( ON ?auto_12141 ?auto_12164 ) ( CLEAR ?auto_12141 ) ( not ( = ?auto_12140 ?auto_12141 ) ) ( not ( = ?auto_12140 ?auto_12164 ) ) ( not ( = ?auto_12141 ?auto_12164 ) ) ( not ( = ?auto_12144 ?auto_12157 ) ) ( IS-CRATE ?auto_12140 ) ( not ( = ?auto_12149 ?auto_12146 ) ) ( HOIST-AT ?auto_12165 ?auto_12149 ) ( AVAILABLE ?auto_12165 ) ( SURFACE-AT ?auto_12140 ?auto_12149 ) ( ON ?auto_12140 ?auto_12153 ) ( CLEAR ?auto_12140 ) ( not ( = ?auto_12139 ?auto_12140 ) ) ( not ( = ?auto_12139 ?auto_12153 ) ) ( not ( = ?auto_12140 ?auto_12153 ) ) ( not ( = ?auto_12144 ?auto_12165 ) ) ( IS-CRATE ?auto_12139 ) ( not ( = ?auto_12159 ?auto_12146 ) ) ( HOIST-AT ?auto_12161 ?auto_12159 ) ( SURFACE-AT ?auto_12139 ?auto_12159 ) ( ON ?auto_12139 ?auto_12150 ) ( CLEAR ?auto_12139 ) ( not ( = ?auto_12138 ?auto_12139 ) ) ( not ( = ?auto_12138 ?auto_12150 ) ) ( not ( = ?auto_12139 ?auto_12150 ) ) ( not ( = ?auto_12144 ?auto_12161 ) ) ( IS-CRATE ?auto_12138 ) ( not ( = ?auto_12158 ?auto_12146 ) ) ( HOIST-AT ?auto_12156 ?auto_12158 ) ( AVAILABLE ?auto_12156 ) ( SURFACE-AT ?auto_12138 ?auto_12158 ) ( ON ?auto_12138 ?auto_12154 ) ( CLEAR ?auto_12138 ) ( not ( = ?auto_12137 ?auto_12138 ) ) ( not ( = ?auto_12137 ?auto_12154 ) ) ( not ( = ?auto_12138 ?auto_12154 ) ) ( not ( = ?auto_12144 ?auto_12156 ) ) ( IS-CRATE ?auto_12137 ) ( not ( = ?auto_12160 ?auto_12146 ) ) ( HOIST-AT ?auto_12155 ?auto_12160 ) ( AVAILABLE ?auto_12155 ) ( SURFACE-AT ?auto_12137 ?auto_12160 ) ( ON ?auto_12137 ?auto_12152 ) ( CLEAR ?auto_12137 ) ( not ( = ?auto_12136 ?auto_12137 ) ) ( not ( = ?auto_12136 ?auto_12152 ) ) ( not ( = ?auto_12137 ?auto_12152 ) ) ( not ( = ?auto_12144 ?auto_12155 ) ) ( IS-CRATE ?auto_12136 ) ( AVAILABLE ?auto_12161 ) ( SURFACE-AT ?auto_12136 ?auto_12159 ) ( ON ?auto_12136 ?auto_12162 ) ( CLEAR ?auto_12136 ) ( not ( = ?auto_12135 ?auto_12136 ) ) ( not ( = ?auto_12135 ?auto_12162 ) ) ( not ( = ?auto_12136 ?auto_12162 ) ) ( SURFACE-AT ?auto_12134 ?auto_12146 ) ( CLEAR ?auto_12134 ) ( IS-CRATE ?auto_12135 ) ( AVAILABLE ?auto_12144 ) ( AVAILABLE ?auto_12157 ) ( SURFACE-AT ?auto_12135 ?auto_12163 ) ( ON ?auto_12135 ?auto_12151 ) ( CLEAR ?auto_12135 ) ( TRUCK-AT ?auto_12145 ?auto_12146 ) ( not ( = ?auto_12134 ?auto_12135 ) ) ( not ( = ?auto_12134 ?auto_12151 ) ) ( not ( = ?auto_12135 ?auto_12151 ) ) ( not ( = ?auto_12134 ?auto_12136 ) ) ( not ( = ?auto_12134 ?auto_12162 ) ) ( not ( = ?auto_12136 ?auto_12151 ) ) ( not ( = ?auto_12159 ?auto_12163 ) ) ( not ( = ?auto_12161 ?auto_12157 ) ) ( not ( = ?auto_12162 ?auto_12151 ) ) ( not ( = ?auto_12134 ?auto_12137 ) ) ( not ( = ?auto_12134 ?auto_12152 ) ) ( not ( = ?auto_12135 ?auto_12137 ) ) ( not ( = ?auto_12135 ?auto_12152 ) ) ( not ( = ?auto_12137 ?auto_12162 ) ) ( not ( = ?auto_12137 ?auto_12151 ) ) ( not ( = ?auto_12160 ?auto_12159 ) ) ( not ( = ?auto_12160 ?auto_12163 ) ) ( not ( = ?auto_12155 ?auto_12161 ) ) ( not ( = ?auto_12155 ?auto_12157 ) ) ( not ( = ?auto_12152 ?auto_12162 ) ) ( not ( = ?auto_12152 ?auto_12151 ) ) ( not ( = ?auto_12134 ?auto_12138 ) ) ( not ( = ?auto_12134 ?auto_12154 ) ) ( not ( = ?auto_12135 ?auto_12138 ) ) ( not ( = ?auto_12135 ?auto_12154 ) ) ( not ( = ?auto_12136 ?auto_12138 ) ) ( not ( = ?auto_12136 ?auto_12154 ) ) ( not ( = ?auto_12138 ?auto_12152 ) ) ( not ( = ?auto_12138 ?auto_12162 ) ) ( not ( = ?auto_12138 ?auto_12151 ) ) ( not ( = ?auto_12158 ?auto_12160 ) ) ( not ( = ?auto_12158 ?auto_12159 ) ) ( not ( = ?auto_12158 ?auto_12163 ) ) ( not ( = ?auto_12156 ?auto_12155 ) ) ( not ( = ?auto_12156 ?auto_12161 ) ) ( not ( = ?auto_12156 ?auto_12157 ) ) ( not ( = ?auto_12154 ?auto_12152 ) ) ( not ( = ?auto_12154 ?auto_12162 ) ) ( not ( = ?auto_12154 ?auto_12151 ) ) ( not ( = ?auto_12134 ?auto_12139 ) ) ( not ( = ?auto_12134 ?auto_12150 ) ) ( not ( = ?auto_12135 ?auto_12139 ) ) ( not ( = ?auto_12135 ?auto_12150 ) ) ( not ( = ?auto_12136 ?auto_12139 ) ) ( not ( = ?auto_12136 ?auto_12150 ) ) ( not ( = ?auto_12137 ?auto_12139 ) ) ( not ( = ?auto_12137 ?auto_12150 ) ) ( not ( = ?auto_12139 ?auto_12154 ) ) ( not ( = ?auto_12139 ?auto_12152 ) ) ( not ( = ?auto_12139 ?auto_12162 ) ) ( not ( = ?auto_12139 ?auto_12151 ) ) ( not ( = ?auto_12150 ?auto_12154 ) ) ( not ( = ?auto_12150 ?auto_12152 ) ) ( not ( = ?auto_12150 ?auto_12162 ) ) ( not ( = ?auto_12150 ?auto_12151 ) ) ( not ( = ?auto_12134 ?auto_12140 ) ) ( not ( = ?auto_12134 ?auto_12153 ) ) ( not ( = ?auto_12135 ?auto_12140 ) ) ( not ( = ?auto_12135 ?auto_12153 ) ) ( not ( = ?auto_12136 ?auto_12140 ) ) ( not ( = ?auto_12136 ?auto_12153 ) ) ( not ( = ?auto_12137 ?auto_12140 ) ) ( not ( = ?auto_12137 ?auto_12153 ) ) ( not ( = ?auto_12138 ?auto_12140 ) ) ( not ( = ?auto_12138 ?auto_12153 ) ) ( not ( = ?auto_12140 ?auto_12150 ) ) ( not ( = ?auto_12140 ?auto_12154 ) ) ( not ( = ?auto_12140 ?auto_12152 ) ) ( not ( = ?auto_12140 ?auto_12162 ) ) ( not ( = ?auto_12140 ?auto_12151 ) ) ( not ( = ?auto_12149 ?auto_12159 ) ) ( not ( = ?auto_12149 ?auto_12158 ) ) ( not ( = ?auto_12149 ?auto_12160 ) ) ( not ( = ?auto_12149 ?auto_12163 ) ) ( not ( = ?auto_12165 ?auto_12161 ) ) ( not ( = ?auto_12165 ?auto_12156 ) ) ( not ( = ?auto_12165 ?auto_12155 ) ) ( not ( = ?auto_12165 ?auto_12157 ) ) ( not ( = ?auto_12153 ?auto_12150 ) ) ( not ( = ?auto_12153 ?auto_12154 ) ) ( not ( = ?auto_12153 ?auto_12152 ) ) ( not ( = ?auto_12153 ?auto_12162 ) ) ( not ( = ?auto_12153 ?auto_12151 ) ) ( not ( = ?auto_12134 ?auto_12141 ) ) ( not ( = ?auto_12134 ?auto_12164 ) ) ( not ( = ?auto_12135 ?auto_12141 ) ) ( not ( = ?auto_12135 ?auto_12164 ) ) ( not ( = ?auto_12136 ?auto_12141 ) ) ( not ( = ?auto_12136 ?auto_12164 ) ) ( not ( = ?auto_12137 ?auto_12141 ) ) ( not ( = ?auto_12137 ?auto_12164 ) ) ( not ( = ?auto_12138 ?auto_12141 ) ) ( not ( = ?auto_12138 ?auto_12164 ) ) ( not ( = ?auto_12139 ?auto_12141 ) ) ( not ( = ?auto_12139 ?auto_12164 ) ) ( not ( = ?auto_12141 ?auto_12153 ) ) ( not ( = ?auto_12141 ?auto_12150 ) ) ( not ( = ?auto_12141 ?auto_12154 ) ) ( not ( = ?auto_12141 ?auto_12152 ) ) ( not ( = ?auto_12141 ?auto_12162 ) ) ( not ( = ?auto_12141 ?auto_12151 ) ) ( not ( = ?auto_12164 ?auto_12153 ) ) ( not ( = ?auto_12164 ?auto_12150 ) ) ( not ( = ?auto_12164 ?auto_12154 ) ) ( not ( = ?auto_12164 ?auto_12152 ) ) ( not ( = ?auto_12164 ?auto_12162 ) ) ( not ( = ?auto_12164 ?auto_12151 ) ) ( not ( = ?auto_12134 ?auto_12142 ) ) ( not ( = ?auto_12134 ?auto_12143 ) ) ( not ( = ?auto_12135 ?auto_12142 ) ) ( not ( = ?auto_12135 ?auto_12143 ) ) ( not ( = ?auto_12136 ?auto_12142 ) ) ( not ( = ?auto_12136 ?auto_12143 ) ) ( not ( = ?auto_12137 ?auto_12142 ) ) ( not ( = ?auto_12137 ?auto_12143 ) ) ( not ( = ?auto_12138 ?auto_12142 ) ) ( not ( = ?auto_12138 ?auto_12143 ) ) ( not ( = ?auto_12139 ?auto_12142 ) ) ( not ( = ?auto_12139 ?auto_12143 ) ) ( not ( = ?auto_12140 ?auto_12142 ) ) ( not ( = ?auto_12140 ?auto_12143 ) ) ( not ( = ?auto_12142 ?auto_12164 ) ) ( not ( = ?auto_12142 ?auto_12153 ) ) ( not ( = ?auto_12142 ?auto_12150 ) ) ( not ( = ?auto_12142 ?auto_12154 ) ) ( not ( = ?auto_12142 ?auto_12152 ) ) ( not ( = ?auto_12142 ?auto_12162 ) ) ( not ( = ?auto_12142 ?auto_12151 ) ) ( not ( = ?auto_12148 ?auto_12163 ) ) ( not ( = ?auto_12148 ?auto_12149 ) ) ( not ( = ?auto_12148 ?auto_12159 ) ) ( not ( = ?auto_12148 ?auto_12158 ) ) ( not ( = ?auto_12148 ?auto_12160 ) ) ( not ( = ?auto_12147 ?auto_12157 ) ) ( not ( = ?auto_12147 ?auto_12165 ) ) ( not ( = ?auto_12147 ?auto_12161 ) ) ( not ( = ?auto_12147 ?auto_12156 ) ) ( not ( = ?auto_12147 ?auto_12155 ) ) ( not ( = ?auto_12143 ?auto_12164 ) ) ( not ( = ?auto_12143 ?auto_12153 ) ) ( not ( = ?auto_12143 ?auto_12150 ) ) ( not ( = ?auto_12143 ?auto_12154 ) ) ( not ( = ?auto_12143 ?auto_12152 ) ) ( not ( = ?auto_12143 ?auto_12162 ) ) ( not ( = ?auto_12143 ?auto_12151 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_12134 ?auto_12135 ?auto_12136 ?auto_12137 ?auto_12138 ?auto_12139 ?auto_12140 ?auto_12141 )
      ( MAKE-1CRATE ?auto_12141 ?auto_12142 )
      ( MAKE-8CRATE-VERIFY ?auto_12134 ?auto_12135 ?auto_12136 ?auto_12137 ?auto_12138 ?auto_12139 ?auto_12140 ?auto_12141 ?auto_12142 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_12186 - SURFACE
      ?auto_12187 - SURFACE
      ?auto_12188 - SURFACE
      ?auto_12189 - SURFACE
      ?auto_12190 - SURFACE
      ?auto_12191 - SURFACE
      ?auto_12192 - SURFACE
      ?auto_12193 - SURFACE
      ?auto_12194 - SURFACE
      ?auto_12195 - SURFACE
    )
    :vars
    (
      ?auto_12198 - HOIST
      ?auto_12197 - PLACE
      ?auto_12196 - PLACE
      ?auto_12201 - HOIST
      ?auto_12200 - SURFACE
      ?auto_12202 - PLACE
      ?auto_12203 - HOIST
      ?auto_12221 - SURFACE
      ?auto_12215 - PLACE
      ?auto_12218 - HOIST
      ?auto_12204 - SURFACE
      ?auto_12205 - PLACE
      ?auto_12213 - HOIST
      ?auto_12210 - SURFACE
      ?auto_12216 - PLACE
      ?auto_12207 - HOIST
      ?auto_12208 - SURFACE
      ?auto_12219 - PLACE
      ?auto_12217 - HOIST
      ?auto_12211 - SURFACE
      ?auto_12206 - PLACE
      ?auto_12212 - HOIST
      ?auto_12209 - SURFACE
      ?auto_12220 - SURFACE
      ?auto_12214 - SURFACE
      ?auto_12199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12198 ?auto_12197 ) ( IS-CRATE ?auto_12195 ) ( not ( = ?auto_12196 ?auto_12197 ) ) ( HOIST-AT ?auto_12201 ?auto_12196 ) ( AVAILABLE ?auto_12201 ) ( SURFACE-AT ?auto_12195 ?auto_12196 ) ( ON ?auto_12195 ?auto_12200 ) ( CLEAR ?auto_12195 ) ( not ( = ?auto_12194 ?auto_12195 ) ) ( not ( = ?auto_12194 ?auto_12200 ) ) ( not ( = ?auto_12195 ?auto_12200 ) ) ( not ( = ?auto_12198 ?auto_12201 ) ) ( IS-CRATE ?auto_12194 ) ( not ( = ?auto_12202 ?auto_12197 ) ) ( HOIST-AT ?auto_12203 ?auto_12202 ) ( AVAILABLE ?auto_12203 ) ( SURFACE-AT ?auto_12194 ?auto_12202 ) ( ON ?auto_12194 ?auto_12221 ) ( CLEAR ?auto_12194 ) ( not ( = ?auto_12193 ?auto_12194 ) ) ( not ( = ?auto_12193 ?auto_12221 ) ) ( not ( = ?auto_12194 ?auto_12221 ) ) ( not ( = ?auto_12198 ?auto_12203 ) ) ( IS-CRATE ?auto_12193 ) ( not ( = ?auto_12215 ?auto_12197 ) ) ( HOIST-AT ?auto_12218 ?auto_12215 ) ( SURFACE-AT ?auto_12193 ?auto_12215 ) ( ON ?auto_12193 ?auto_12204 ) ( CLEAR ?auto_12193 ) ( not ( = ?auto_12192 ?auto_12193 ) ) ( not ( = ?auto_12192 ?auto_12204 ) ) ( not ( = ?auto_12193 ?auto_12204 ) ) ( not ( = ?auto_12198 ?auto_12218 ) ) ( IS-CRATE ?auto_12192 ) ( not ( = ?auto_12205 ?auto_12197 ) ) ( HOIST-AT ?auto_12213 ?auto_12205 ) ( AVAILABLE ?auto_12213 ) ( SURFACE-AT ?auto_12192 ?auto_12205 ) ( ON ?auto_12192 ?auto_12210 ) ( CLEAR ?auto_12192 ) ( not ( = ?auto_12191 ?auto_12192 ) ) ( not ( = ?auto_12191 ?auto_12210 ) ) ( not ( = ?auto_12192 ?auto_12210 ) ) ( not ( = ?auto_12198 ?auto_12213 ) ) ( IS-CRATE ?auto_12191 ) ( not ( = ?auto_12216 ?auto_12197 ) ) ( HOIST-AT ?auto_12207 ?auto_12216 ) ( SURFACE-AT ?auto_12191 ?auto_12216 ) ( ON ?auto_12191 ?auto_12208 ) ( CLEAR ?auto_12191 ) ( not ( = ?auto_12190 ?auto_12191 ) ) ( not ( = ?auto_12190 ?auto_12208 ) ) ( not ( = ?auto_12191 ?auto_12208 ) ) ( not ( = ?auto_12198 ?auto_12207 ) ) ( IS-CRATE ?auto_12190 ) ( not ( = ?auto_12219 ?auto_12197 ) ) ( HOIST-AT ?auto_12217 ?auto_12219 ) ( AVAILABLE ?auto_12217 ) ( SURFACE-AT ?auto_12190 ?auto_12219 ) ( ON ?auto_12190 ?auto_12211 ) ( CLEAR ?auto_12190 ) ( not ( = ?auto_12189 ?auto_12190 ) ) ( not ( = ?auto_12189 ?auto_12211 ) ) ( not ( = ?auto_12190 ?auto_12211 ) ) ( not ( = ?auto_12198 ?auto_12217 ) ) ( IS-CRATE ?auto_12189 ) ( not ( = ?auto_12206 ?auto_12197 ) ) ( HOIST-AT ?auto_12212 ?auto_12206 ) ( AVAILABLE ?auto_12212 ) ( SURFACE-AT ?auto_12189 ?auto_12206 ) ( ON ?auto_12189 ?auto_12209 ) ( CLEAR ?auto_12189 ) ( not ( = ?auto_12188 ?auto_12189 ) ) ( not ( = ?auto_12188 ?auto_12209 ) ) ( not ( = ?auto_12189 ?auto_12209 ) ) ( not ( = ?auto_12198 ?auto_12212 ) ) ( IS-CRATE ?auto_12188 ) ( AVAILABLE ?auto_12207 ) ( SURFACE-AT ?auto_12188 ?auto_12216 ) ( ON ?auto_12188 ?auto_12220 ) ( CLEAR ?auto_12188 ) ( not ( = ?auto_12187 ?auto_12188 ) ) ( not ( = ?auto_12187 ?auto_12220 ) ) ( not ( = ?auto_12188 ?auto_12220 ) ) ( SURFACE-AT ?auto_12186 ?auto_12197 ) ( CLEAR ?auto_12186 ) ( IS-CRATE ?auto_12187 ) ( AVAILABLE ?auto_12198 ) ( AVAILABLE ?auto_12218 ) ( SURFACE-AT ?auto_12187 ?auto_12215 ) ( ON ?auto_12187 ?auto_12214 ) ( CLEAR ?auto_12187 ) ( TRUCK-AT ?auto_12199 ?auto_12197 ) ( not ( = ?auto_12186 ?auto_12187 ) ) ( not ( = ?auto_12186 ?auto_12214 ) ) ( not ( = ?auto_12187 ?auto_12214 ) ) ( not ( = ?auto_12186 ?auto_12188 ) ) ( not ( = ?auto_12186 ?auto_12220 ) ) ( not ( = ?auto_12188 ?auto_12214 ) ) ( not ( = ?auto_12216 ?auto_12215 ) ) ( not ( = ?auto_12207 ?auto_12218 ) ) ( not ( = ?auto_12220 ?auto_12214 ) ) ( not ( = ?auto_12186 ?auto_12189 ) ) ( not ( = ?auto_12186 ?auto_12209 ) ) ( not ( = ?auto_12187 ?auto_12189 ) ) ( not ( = ?auto_12187 ?auto_12209 ) ) ( not ( = ?auto_12189 ?auto_12220 ) ) ( not ( = ?auto_12189 ?auto_12214 ) ) ( not ( = ?auto_12206 ?auto_12216 ) ) ( not ( = ?auto_12206 ?auto_12215 ) ) ( not ( = ?auto_12212 ?auto_12207 ) ) ( not ( = ?auto_12212 ?auto_12218 ) ) ( not ( = ?auto_12209 ?auto_12220 ) ) ( not ( = ?auto_12209 ?auto_12214 ) ) ( not ( = ?auto_12186 ?auto_12190 ) ) ( not ( = ?auto_12186 ?auto_12211 ) ) ( not ( = ?auto_12187 ?auto_12190 ) ) ( not ( = ?auto_12187 ?auto_12211 ) ) ( not ( = ?auto_12188 ?auto_12190 ) ) ( not ( = ?auto_12188 ?auto_12211 ) ) ( not ( = ?auto_12190 ?auto_12209 ) ) ( not ( = ?auto_12190 ?auto_12220 ) ) ( not ( = ?auto_12190 ?auto_12214 ) ) ( not ( = ?auto_12219 ?auto_12206 ) ) ( not ( = ?auto_12219 ?auto_12216 ) ) ( not ( = ?auto_12219 ?auto_12215 ) ) ( not ( = ?auto_12217 ?auto_12212 ) ) ( not ( = ?auto_12217 ?auto_12207 ) ) ( not ( = ?auto_12217 ?auto_12218 ) ) ( not ( = ?auto_12211 ?auto_12209 ) ) ( not ( = ?auto_12211 ?auto_12220 ) ) ( not ( = ?auto_12211 ?auto_12214 ) ) ( not ( = ?auto_12186 ?auto_12191 ) ) ( not ( = ?auto_12186 ?auto_12208 ) ) ( not ( = ?auto_12187 ?auto_12191 ) ) ( not ( = ?auto_12187 ?auto_12208 ) ) ( not ( = ?auto_12188 ?auto_12191 ) ) ( not ( = ?auto_12188 ?auto_12208 ) ) ( not ( = ?auto_12189 ?auto_12191 ) ) ( not ( = ?auto_12189 ?auto_12208 ) ) ( not ( = ?auto_12191 ?auto_12211 ) ) ( not ( = ?auto_12191 ?auto_12209 ) ) ( not ( = ?auto_12191 ?auto_12220 ) ) ( not ( = ?auto_12191 ?auto_12214 ) ) ( not ( = ?auto_12208 ?auto_12211 ) ) ( not ( = ?auto_12208 ?auto_12209 ) ) ( not ( = ?auto_12208 ?auto_12220 ) ) ( not ( = ?auto_12208 ?auto_12214 ) ) ( not ( = ?auto_12186 ?auto_12192 ) ) ( not ( = ?auto_12186 ?auto_12210 ) ) ( not ( = ?auto_12187 ?auto_12192 ) ) ( not ( = ?auto_12187 ?auto_12210 ) ) ( not ( = ?auto_12188 ?auto_12192 ) ) ( not ( = ?auto_12188 ?auto_12210 ) ) ( not ( = ?auto_12189 ?auto_12192 ) ) ( not ( = ?auto_12189 ?auto_12210 ) ) ( not ( = ?auto_12190 ?auto_12192 ) ) ( not ( = ?auto_12190 ?auto_12210 ) ) ( not ( = ?auto_12192 ?auto_12208 ) ) ( not ( = ?auto_12192 ?auto_12211 ) ) ( not ( = ?auto_12192 ?auto_12209 ) ) ( not ( = ?auto_12192 ?auto_12220 ) ) ( not ( = ?auto_12192 ?auto_12214 ) ) ( not ( = ?auto_12205 ?auto_12216 ) ) ( not ( = ?auto_12205 ?auto_12219 ) ) ( not ( = ?auto_12205 ?auto_12206 ) ) ( not ( = ?auto_12205 ?auto_12215 ) ) ( not ( = ?auto_12213 ?auto_12207 ) ) ( not ( = ?auto_12213 ?auto_12217 ) ) ( not ( = ?auto_12213 ?auto_12212 ) ) ( not ( = ?auto_12213 ?auto_12218 ) ) ( not ( = ?auto_12210 ?auto_12208 ) ) ( not ( = ?auto_12210 ?auto_12211 ) ) ( not ( = ?auto_12210 ?auto_12209 ) ) ( not ( = ?auto_12210 ?auto_12220 ) ) ( not ( = ?auto_12210 ?auto_12214 ) ) ( not ( = ?auto_12186 ?auto_12193 ) ) ( not ( = ?auto_12186 ?auto_12204 ) ) ( not ( = ?auto_12187 ?auto_12193 ) ) ( not ( = ?auto_12187 ?auto_12204 ) ) ( not ( = ?auto_12188 ?auto_12193 ) ) ( not ( = ?auto_12188 ?auto_12204 ) ) ( not ( = ?auto_12189 ?auto_12193 ) ) ( not ( = ?auto_12189 ?auto_12204 ) ) ( not ( = ?auto_12190 ?auto_12193 ) ) ( not ( = ?auto_12190 ?auto_12204 ) ) ( not ( = ?auto_12191 ?auto_12193 ) ) ( not ( = ?auto_12191 ?auto_12204 ) ) ( not ( = ?auto_12193 ?auto_12210 ) ) ( not ( = ?auto_12193 ?auto_12208 ) ) ( not ( = ?auto_12193 ?auto_12211 ) ) ( not ( = ?auto_12193 ?auto_12209 ) ) ( not ( = ?auto_12193 ?auto_12220 ) ) ( not ( = ?auto_12193 ?auto_12214 ) ) ( not ( = ?auto_12204 ?auto_12210 ) ) ( not ( = ?auto_12204 ?auto_12208 ) ) ( not ( = ?auto_12204 ?auto_12211 ) ) ( not ( = ?auto_12204 ?auto_12209 ) ) ( not ( = ?auto_12204 ?auto_12220 ) ) ( not ( = ?auto_12204 ?auto_12214 ) ) ( not ( = ?auto_12186 ?auto_12194 ) ) ( not ( = ?auto_12186 ?auto_12221 ) ) ( not ( = ?auto_12187 ?auto_12194 ) ) ( not ( = ?auto_12187 ?auto_12221 ) ) ( not ( = ?auto_12188 ?auto_12194 ) ) ( not ( = ?auto_12188 ?auto_12221 ) ) ( not ( = ?auto_12189 ?auto_12194 ) ) ( not ( = ?auto_12189 ?auto_12221 ) ) ( not ( = ?auto_12190 ?auto_12194 ) ) ( not ( = ?auto_12190 ?auto_12221 ) ) ( not ( = ?auto_12191 ?auto_12194 ) ) ( not ( = ?auto_12191 ?auto_12221 ) ) ( not ( = ?auto_12192 ?auto_12194 ) ) ( not ( = ?auto_12192 ?auto_12221 ) ) ( not ( = ?auto_12194 ?auto_12204 ) ) ( not ( = ?auto_12194 ?auto_12210 ) ) ( not ( = ?auto_12194 ?auto_12208 ) ) ( not ( = ?auto_12194 ?auto_12211 ) ) ( not ( = ?auto_12194 ?auto_12209 ) ) ( not ( = ?auto_12194 ?auto_12220 ) ) ( not ( = ?auto_12194 ?auto_12214 ) ) ( not ( = ?auto_12202 ?auto_12215 ) ) ( not ( = ?auto_12202 ?auto_12205 ) ) ( not ( = ?auto_12202 ?auto_12216 ) ) ( not ( = ?auto_12202 ?auto_12219 ) ) ( not ( = ?auto_12202 ?auto_12206 ) ) ( not ( = ?auto_12203 ?auto_12218 ) ) ( not ( = ?auto_12203 ?auto_12213 ) ) ( not ( = ?auto_12203 ?auto_12207 ) ) ( not ( = ?auto_12203 ?auto_12217 ) ) ( not ( = ?auto_12203 ?auto_12212 ) ) ( not ( = ?auto_12221 ?auto_12204 ) ) ( not ( = ?auto_12221 ?auto_12210 ) ) ( not ( = ?auto_12221 ?auto_12208 ) ) ( not ( = ?auto_12221 ?auto_12211 ) ) ( not ( = ?auto_12221 ?auto_12209 ) ) ( not ( = ?auto_12221 ?auto_12220 ) ) ( not ( = ?auto_12221 ?auto_12214 ) ) ( not ( = ?auto_12186 ?auto_12195 ) ) ( not ( = ?auto_12186 ?auto_12200 ) ) ( not ( = ?auto_12187 ?auto_12195 ) ) ( not ( = ?auto_12187 ?auto_12200 ) ) ( not ( = ?auto_12188 ?auto_12195 ) ) ( not ( = ?auto_12188 ?auto_12200 ) ) ( not ( = ?auto_12189 ?auto_12195 ) ) ( not ( = ?auto_12189 ?auto_12200 ) ) ( not ( = ?auto_12190 ?auto_12195 ) ) ( not ( = ?auto_12190 ?auto_12200 ) ) ( not ( = ?auto_12191 ?auto_12195 ) ) ( not ( = ?auto_12191 ?auto_12200 ) ) ( not ( = ?auto_12192 ?auto_12195 ) ) ( not ( = ?auto_12192 ?auto_12200 ) ) ( not ( = ?auto_12193 ?auto_12195 ) ) ( not ( = ?auto_12193 ?auto_12200 ) ) ( not ( = ?auto_12195 ?auto_12221 ) ) ( not ( = ?auto_12195 ?auto_12204 ) ) ( not ( = ?auto_12195 ?auto_12210 ) ) ( not ( = ?auto_12195 ?auto_12208 ) ) ( not ( = ?auto_12195 ?auto_12211 ) ) ( not ( = ?auto_12195 ?auto_12209 ) ) ( not ( = ?auto_12195 ?auto_12220 ) ) ( not ( = ?auto_12195 ?auto_12214 ) ) ( not ( = ?auto_12196 ?auto_12202 ) ) ( not ( = ?auto_12196 ?auto_12215 ) ) ( not ( = ?auto_12196 ?auto_12205 ) ) ( not ( = ?auto_12196 ?auto_12216 ) ) ( not ( = ?auto_12196 ?auto_12219 ) ) ( not ( = ?auto_12196 ?auto_12206 ) ) ( not ( = ?auto_12201 ?auto_12203 ) ) ( not ( = ?auto_12201 ?auto_12218 ) ) ( not ( = ?auto_12201 ?auto_12213 ) ) ( not ( = ?auto_12201 ?auto_12207 ) ) ( not ( = ?auto_12201 ?auto_12217 ) ) ( not ( = ?auto_12201 ?auto_12212 ) ) ( not ( = ?auto_12200 ?auto_12221 ) ) ( not ( = ?auto_12200 ?auto_12204 ) ) ( not ( = ?auto_12200 ?auto_12210 ) ) ( not ( = ?auto_12200 ?auto_12208 ) ) ( not ( = ?auto_12200 ?auto_12211 ) ) ( not ( = ?auto_12200 ?auto_12209 ) ) ( not ( = ?auto_12200 ?auto_12220 ) ) ( not ( = ?auto_12200 ?auto_12214 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_12186 ?auto_12187 ?auto_12188 ?auto_12189 ?auto_12190 ?auto_12191 ?auto_12192 ?auto_12193 ?auto_12194 )
      ( MAKE-1CRATE ?auto_12194 ?auto_12195 )
      ( MAKE-9CRATE-VERIFY ?auto_12186 ?auto_12187 ?auto_12188 ?auto_12189 ?auto_12190 ?auto_12191 ?auto_12192 ?auto_12193 ?auto_12194 ?auto_12195 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_12243 - SURFACE
      ?auto_12244 - SURFACE
      ?auto_12245 - SURFACE
      ?auto_12246 - SURFACE
      ?auto_12247 - SURFACE
      ?auto_12248 - SURFACE
      ?auto_12249 - SURFACE
      ?auto_12250 - SURFACE
      ?auto_12251 - SURFACE
      ?auto_12252 - SURFACE
      ?auto_12253 - SURFACE
    )
    :vars
    (
      ?auto_12254 - HOIST
      ?auto_12255 - PLACE
      ?auto_12257 - PLACE
      ?auto_12259 - HOIST
      ?auto_12258 - SURFACE
      ?auto_12261 - PLACE
      ?auto_12282 - HOIST
      ?auto_12269 - SURFACE
      ?auto_12274 - PLACE
      ?auto_12275 - HOIST
      ?auto_12277 - SURFACE
      ?auto_12271 - PLACE
      ?auto_12263 - HOIST
      ?auto_12281 - SURFACE
      ?auto_12264 - PLACE
      ?auto_12262 - HOIST
      ?auto_12273 - SURFACE
      ?auto_12266 - PLACE
      ?auto_12279 - HOIST
      ?auto_12260 - SURFACE
      ?auto_12272 - PLACE
      ?auto_12265 - HOIST
      ?auto_12267 - SURFACE
      ?auto_12280 - PLACE
      ?auto_12276 - HOIST
      ?auto_12270 - SURFACE
      ?auto_12278 - SURFACE
      ?auto_12268 - SURFACE
      ?auto_12256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12254 ?auto_12255 ) ( IS-CRATE ?auto_12253 ) ( not ( = ?auto_12257 ?auto_12255 ) ) ( HOIST-AT ?auto_12259 ?auto_12257 ) ( AVAILABLE ?auto_12259 ) ( SURFACE-AT ?auto_12253 ?auto_12257 ) ( ON ?auto_12253 ?auto_12258 ) ( CLEAR ?auto_12253 ) ( not ( = ?auto_12252 ?auto_12253 ) ) ( not ( = ?auto_12252 ?auto_12258 ) ) ( not ( = ?auto_12253 ?auto_12258 ) ) ( not ( = ?auto_12254 ?auto_12259 ) ) ( IS-CRATE ?auto_12252 ) ( not ( = ?auto_12261 ?auto_12255 ) ) ( HOIST-AT ?auto_12282 ?auto_12261 ) ( AVAILABLE ?auto_12282 ) ( SURFACE-AT ?auto_12252 ?auto_12261 ) ( ON ?auto_12252 ?auto_12269 ) ( CLEAR ?auto_12252 ) ( not ( = ?auto_12251 ?auto_12252 ) ) ( not ( = ?auto_12251 ?auto_12269 ) ) ( not ( = ?auto_12252 ?auto_12269 ) ) ( not ( = ?auto_12254 ?auto_12282 ) ) ( IS-CRATE ?auto_12251 ) ( not ( = ?auto_12274 ?auto_12255 ) ) ( HOIST-AT ?auto_12275 ?auto_12274 ) ( AVAILABLE ?auto_12275 ) ( SURFACE-AT ?auto_12251 ?auto_12274 ) ( ON ?auto_12251 ?auto_12277 ) ( CLEAR ?auto_12251 ) ( not ( = ?auto_12250 ?auto_12251 ) ) ( not ( = ?auto_12250 ?auto_12277 ) ) ( not ( = ?auto_12251 ?auto_12277 ) ) ( not ( = ?auto_12254 ?auto_12275 ) ) ( IS-CRATE ?auto_12250 ) ( not ( = ?auto_12271 ?auto_12255 ) ) ( HOIST-AT ?auto_12263 ?auto_12271 ) ( SURFACE-AT ?auto_12250 ?auto_12271 ) ( ON ?auto_12250 ?auto_12281 ) ( CLEAR ?auto_12250 ) ( not ( = ?auto_12249 ?auto_12250 ) ) ( not ( = ?auto_12249 ?auto_12281 ) ) ( not ( = ?auto_12250 ?auto_12281 ) ) ( not ( = ?auto_12254 ?auto_12263 ) ) ( IS-CRATE ?auto_12249 ) ( not ( = ?auto_12264 ?auto_12255 ) ) ( HOIST-AT ?auto_12262 ?auto_12264 ) ( AVAILABLE ?auto_12262 ) ( SURFACE-AT ?auto_12249 ?auto_12264 ) ( ON ?auto_12249 ?auto_12273 ) ( CLEAR ?auto_12249 ) ( not ( = ?auto_12248 ?auto_12249 ) ) ( not ( = ?auto_12248 ?auto_12273 ) ) ( not ( = ?auto_12249 ?auto_12273 ) ) ( not ( = ?auto_12254 ?auto_12262 ) ) ( IS-CRATE ?auto_12248 ) ( not ( = ?auto_12266 ?auto_12255 ) ) ( HOIST-AT ?auto_12279 ?auto_12266 ) ( SURFACE-AT ?auto_12248 ?auto_12266 ) ( ON ?auto_12248 ?auto_12260 ) ( CLEAR ?auto_12248 ) ( not ( = ?auto_12247 ?auto_12248 ) ) ( not ( = ?auto_12247 ?auto_12260 ) ) ( not ( = ?auto_12248 ?auto_12260 ) ) ( not ( = ?auto_12254 ?auto_12279 ) ) ( IS-CRATE ?auto_12247 ) ( not ( = ?auto_12272 ?auto_12255 ) ) ( HOIST-AT ?auto_12265 ?auto_12272 ) ( AVAILABLE ?auto_12265 ) ( SURFACE-AT ?auto_12247 ?auto_12272 ) ( ON ?auto_12247 ?auto_12267 ) ( CLEAR ?auto_12247 ) ( not ( = ?auto_12246 ?auto_12247 ) ) ( not ( = ?auto_12246 ?auto_12267 ) ) ( not ( = ?auto_12247 ?auto_12267 ) ) ( not ( = ?auto_12254 ?auto_12265 ) ) ( IS-CRATE ?auto_12246 ) ( not ( = ?auto_12280 ?auto_12255 ) ) ( HOIST-AT ?auto_12276 ?auto_12280 ) ( AVAILABLE ?auto_12276 ) ( SURFACE-AT ?auto_12246 ?auto_12280 ) ( ON ?auto_12246 ?auto_12270 ) ( CLEAR ?auto_12246 ) ( not ( = ?auto_12245 ?auto_12246 ) ) ( not ( = ?auto_12245 ?auto_12270 ) ) ( not ( = ?auto_12246 ?auto_12270 ) ) ( not ( = ?auto_12254 ?auto_12276 ) ) ( IS-CRATE ?auto_12245 ) ( AVAILABLE ?auto_12279 ) ( SURFACE-AT ?auto_12245 ?auto_12266 ) ( ON ?auto_12245 ?auto_12278 ) ( CLEAR ?auto_12245 ) ( not ( = ?auto_12244 ?auto_12245 ) ) ( not ( = ?auto_12244 ?auto_12278 ) ) ( not ( = ?auto_12245 ?auto_12278 ) ) ( SURFACE-AT ?auto_12243 ?auto_12255 ) ( CLEAR ?auto_12243 ) ( IS-CRATE ?auto_12244 ) ( AVAILABLE ?auto_12254 ) ( AVAILABLE ?auto_12263 ) ( SURFACE-AT ?auto_12244 ?auto_12271 ) ( ON ?auto_12244 ?auto_12268 ) ( CLEAR ?auto_12244 ) ( TRUCK-AT ?auto_12256 ?auto_12255 ) ( not ( = ?auto_12243 ?auto_12244 ) ) ( not ( = ?auto_12243 ?auto_12268 ) ) ( not ( = ?auto_12244 ?auto_12268 ) ) ( not ( = ?auto_12243 ?auto_12245 ) ) ( not ( = ?auto_12243 ?auto_12278 ) ) ( not ( = ?auto_12245 ?auto_12268 ) ) ( not ( = ?auto_12266 ?auto_12271 ) ) ( not ( = ?auto_12279 ?auto_12263 ) ) ( not ( = ?auto_12278 ?auto_12268 ) ) ( not ( = ?auto_12243 ?auto_12246 ) ) ( not ( = ?auto_12243 ?auto_12270 ) ) ( not ( = ?auto_12244 ?auto_12246 ) ) ( not ( = ?auto_12244 ?auto_12270 ) ) ( not ( = ?auto_12246 ?auto_12278 ) ) ( not ( = ?auto_12246 ?auto_12268 ) ) ( not ( = ?auto_12280 ?auto_12266 ) ) ( not ( = ?auto_12280 ?auto_12271 ) ) ( not ( = ?auto_12276 ?auto_12279 ) ) ( not ( = ?auto_12276 ?auto_12263 ) ) ( not ( = ?auto_12270 ?auto_12278 ) ) ( not ( = ?auto_12270 ?auto_12268 ) ) ( not ( = ?auto_12243 ?auto_12247 ) ) ( not ( = ?auto_12243 ?auto_12267 ) ) ( not ( = ?auto_12244 ?auto_12247 ) ) ( not ( = ?auto_12244 ?auto_12267 ) ) ( not ( = ?auto_12245 ?auto_12247 ) ) ( not ( = ?auto_12245 ?auto_12267 ) ) ( not ( = ?auto_12247 ?auto_12270 ) ) ( not ( = ?auto_12247 ?auto_12278 ) ) ( not ( = ?auto_12247 ?auto_12268 ) ) ( not ( = ?auto_12272 ?auto_12280 ) ) ( not ( = ?auto_12272 ?auto_12266 ) ) ( not ( = ?auto_12272 ?auto_12271 ) ) ( not ( = ?auto_12265 ?auto_12276 ) ) ( not ( = ?auto_12265 ?auto_12279 ) ) ( not ( = ?auto_12265 ?auto_12263 ) ) ( not ( = ?auto_12267 ?auto_12270 ) ) ( not ( = ?auto_12267 ?auto_12278 ) ) ( not ( = ?auto_12267 ?auto_12268 ) ) ( not ( = ?auto_12243 ?auto_12248 ) ) ( not ( = ?auto_12243 ?auto_12260 ) ) ( not ( = ?auto_12244 ?auto_12248 ) ) ( not ( = ?auto_12244 ?auto_12260 ) ) ( not ( = ?auto_12245 ?auto_12248 ) ) ( not ( = ?auto_12245 ?auto_12260 ) ) ( not ( = ?auto_12246 ?auto_12248 ) ) ( not ( = ?auto_12246 ?auto_12260 ) ) ( not ( = ?auto_12248 ?auto_12267 ) ) ( not ( = ?auto_12248 ?auto_12270 ) ) ( not ( = ?auto_12248 ?auto_12278 ) ) ( not ( = ?auto_12248 ?auto_12268 ) ) ( not ( = ?auto_12260 ?auto_12267 ) ) ( not ( = ?auto_12260 ?auto_12270 ) ) ( not ( = ?auto_12260 ?auto_12278 ) ) ( not ( = ?auto_12260 ?auto_12268 ) ) ( not ( = ?auto_12243 ?auto_12249 ) ) ( not ( = ?auto_12243 ?auto_12273 ) ) ( not ( = ?auto_12244 ?auto_12249 ) ) ( not ( = ?auto_12244 ?auto_12273 ) ) ( not ( = ?auto_12245 ?auto_12249 ) ) ( not ( = ?auto_12245 ?auto_12273 ) ) ( not ( = ?auto_12246 ?auto_12249 ) ) ( not ( = ?auto_12246 ?auto_12273 ) ) ( not ( = ?auto_12247 ?auto_12249 ) ) ( not ( = ?auto_12247 ?auto_12273 ) ) ( not ( = ?auto_12249 ?auto_12260 ) ) ( not ( = ?auto_12249 ?auto_12267 ) ) ( not ( = ?auto_12249 ?auto_12270 ) ) ( not ( = ?auto_12249 ?auto_12278 ) ) ( not ( = ?auto_12249 ?auto_12268 ) ) ( not ( = ?auto_12264 ?auto_12266 ) ) ( not ( = ?auto_12264 ?auto_12272 ) ) ( not ( = ?auto_12264 ?auto_12280 ) ) ( not ( = ?auto_12264 ?auto_12271 ) ) ( not ( = ?auto_12262 ?auto_12279 ) ) ( not ( = ?auto_12262 ?auto_12265 ) ) ( not ( = ?auto_12262 ?auto_12276 ) ) ( not ( = ?auto_12262 ?auto_12263 ) ) ( not ( = ?auto_12273 ?auto_12260 ) ) ( not ( = ?auto_12273 ?auto_12267 ) ) ( not ( = ?auto_12273 ?auto_12270 ) ) ( not ( = ?auto_12273 ?auto_12278 ) ) ( not ( = ?auto_12273 ?auto_12268 ) ) ( not ( = ?auto_12243 ?auto_12250 ) ) ( not ( = ?auto_12243 ?auto_12281 ) ) ( not ( = ?auto_12244 ?auto_12250 ) ) ( not ( = ?auto_12244 ?auto_12281 ) ) ( not ( = ?auto_12245 ?auto_12250 ) ) ( not ( = ?auto_12245 ?auto_12281 ) ) ( not ( = ?auto_12246 ?auto_12250 ) ) ( not ( = ?auto_12246 ?auto_12281 ) ) ( not ( = ?auto_12247 ?auto_12250 ) ) ( not ( = ?auto_12247 ?auto_12281 ) ) ( not ( = ?auto_12248 ?auto_12250 ) ) ( not ( = ?auto_12248 ?auto_12281 ) ) ( not ( = ?auto_12250 ?auto_12273 ) ) ( not ( = ?auto_12250 ?auto_12260 ) ) ( not ( = ?auto_12250 ?auto_12267 ) ) ( not ( = ?auto_12250 ?auto_12270 ) ) ( not ( = ?auto_12250 ?auto_12278 ) ) ( not ( = ?auto_12250 ?auto_12268 ) ) ( not ( = ?auto_12281 ?auto_12273 ) ) ( not ( = ?auto_12281 ?auto_12260 ) ) ( not ( = ?auto_12281 ?auto_12267 ) ) ( not ( = ?auto_12281 ?auto_12270 ) ) ( not ( = ?auto_12281 ?auto_12278 ) ) ( not ( = ?auto_12281 ?auto_12268 ) ) ( not ( = ?auto_12243 ?auto_12251 ) ) ( not ( = ?auto_12243 ?auto_12277 ) ) ( not ( = ?auto_12244 ?auto_12251 ) ) ( not ( = ?auto_12244 ?auto_12277 ) ) ( not ( = ?auto_12245 ?auto_12251 ) ) ( not ( = ?auto_12245 ?auto_12277 ) ) ( not ( = ?auto_12246 ?auto_12251 ) ) ( not ( = ?auto_12246 ?auto_12277 ) ) ( not ( = ?auto_12247 ?auto_12251 ) ) ( not ( = ?auto_12247 ?auto_12277 ) ) ( not ( = ?auto_12248 ?auto_12251 ) ) ( not ( = ?auto_12248 ?auto_12277 ) ) ( not ( = ?auto_12249 ?auto_12251 ) ) ( not ( = ?auto_12249 ?auto_12277 ) ) ( not ( = ?auto_12251 ?auto_12281 ) ) ( not ( = ?auto_12251 ?auto_12273 ) ) ( not ( = ?auto_12251 ?auto_12260 ) ) ( not ( = ?auto_12251 ?auto_12267 ) ) ( not ( = ?auto_12251 ?auto_12270 ) ) ( not ( = ?auto_12251 ?auto_12278 ) ) ( not ( = ?auto_12251 ?auto_12268 ) ) ( not ( = ?auto_12274 ?auto_12271 ) ) ( not ( = ?auto_12274 ?auto_12264 ) ) ( not ( = ?auto_12274 ?auto_12266 ) ) ( not ( = ?auto_12274 ?auto_12272 ) ) ( not ( = ?auto_12274 ?auto_12280 ) ) ( not ( = ?auto_12275 ?auto_12263 ) ) ( not ( = ?auto_12275 ?auto_12262 ) ) ( not ( = ?auto_12275 ?auto_12279 ) ) ( not ( = ?auto_12275 ?auto_12265 ) ) ( not ( = ?auto_12275 ?auto_12276 ) ) ( not ( = ?auto_12277 ?auto_12281 ) ) ( not ( = ?auto_12277 ?auto_12273 ) ) ( not ( = ?auto_12277 ?auto_12260 ) ) ( not ( = ?auto_12277 ?auto_12267 ) ) ( not ( = ?auto_12277 ?auto_12270 ) ) ( not ( = ?auto_12277 ?auto_12278 ) ) ( not ( = ?auto_12277 ?auto_12268 ) ) ( not ( = ?auto_12243 ?auto_12252 ) ) ( not ( = ?auto_12243 ?auto_12269 ) ) ( not ( = ?auto_12244 ?auto_12252 ) ) ( not ( = ?auto_12244 ?auto_12269 ) ) ( not ( = ?auto_12245 ?auto_12252 ) ) ( not ( = ?auto_12245 ?auto_12269 ) ) ( not ( = ?auto_12246 ?auto_12252 ) ) ( not ( = ?auto_12246 ?auto_12269 ) ) ( not ( = ?auto_12247 ?auto_12252 ) ) ( not ( = ?auto_12247 ?auto_12269 ) ) ( not ( = ?auto_12248 ?auto_12252 ) ) ( not ( = ?auto_12248 ?auto_12269 ) ) ( not ( = ?auto_12249 ?auto_12252 ) ) ( not ( = ?auto_12249 ?auto_12269 ) ) ( not ( = ?auto_12250 ?auto_12252 ) ) ( not ( = ?auto_12250 ?auto_12269 ) ) ( not ( = ?auto_12252 ?auto_12277 ) ) ( not ( = ?auto_12252 ?auto_12281 ) ) ( not ( = ?auto_12252 ?auto_12273 ) ) ( not ( = ?auto_12252 ?auto_12260 ) ) ( not ( = ?auto_12252 ?auto_12267 ) ) ( not ( = ?auto_12252 ?auto_12270 ) ) ( not ( = ?auto_12252 ?auto_12278 ) ) ( not ( = ?auto_12252 ?auto_12268 ) ) ( not ( = ?auto_12261 ?auto_12274 ) ) ( not ( = ?auto_12261 ?auto_12271 ) ) ( not ( = ?auto_12261 ?auto_12264 ) ) ( not ( = ?auto_12261 ?auto_12266 ) ) ( not ( = ?auto_12261 ?auto_12272 ) ) ( not ( = ?auto_12261 ?auto_12280 ) ) ( not ( = ?auto_12282 ?auto_12275 ) ) ( not ( = ?auto_12282 ?auto_12263 ) ) ( not ( = ?auto_12282 ?auto_12262 ) ) ( not ( = ?auto_12282 ?auto_12279 ) ) ( not ( = ?auto_12282 ?auto_12265 ) ) ( not ( = ?auto_12282 ?auto_12276 ) ) ( not ( = ?auto_12269 ?auto_12277 ) ) ( not ( = ?auto_12269 ?auto_12281 ) ) ( not ( = ?auto_12269 ?auto_12273 ) ) ( not ( = ?auto_12269 ?auto_12260 ) ) ( not ( = ?auto_12269 ?auto_12267 ) ) ( not ( = ?auto_12269 ?auto_12270 ) ) ( not ( = ?auto_12269 ?auto_12278 ) ) ( not ( = ?auto_12269 ?auto_12268 ) ) ( not ( = ?auto_12243 ?auto_12253 ) ) ( not ( = ?auto_12243 ?auto_12258 ) ) ( not ( = ?auto_12244 ?auto_12253 ) ) ( not ( = ?auto_12244 ?auto_12258 ) ) ( not ( = ?auto_12245 ?auto_12253 ) ) ( not ( = ?auto_12245 ?auto_12258 ) ) ( not ( = ?auto_12246 ?auto_12253 ) ) ( not ( = ?auto_12246 ?auto_12258 ) ) ( not ( = ?auto_12247 ?auto_12253 ) ) ( not ( = ?auto_12247 ?auto_12258 ) ) ( not ( = ?auto_12248 ?auto_12253 ) ) ( not ( = ?auto_12248 ?auto_12258 ) ) ( not ( = ?auto_12249 ?auto_12253 ) ) ( not ( = ?auto_12249 ?auto_12258 ) ) ( not ( = ?auto_12250 ?auto_12253 ) ) ( not ( = ?auto_12250 ?auto_12258 ) ) ( not ( = ?auto_12251 ?auto_12253 ) ) ( not ( = ?auto_12251 ?auto_12258 ) ) ( not ( = ?auto_12253 ?auto_12269 ) ) ( not ( = ?auto_12253 ?auto_12277 ) ) ( not ( = ?auto_12253 ?auto_12281 ) ) ( not ( = ?auto_12253 ?auto_12273 ) ) ( not ( = ?auto_12253 ?auto_12260 ) ) ( not ( = ?auto_12253 ?auto_12267 ) ) ( not ( = ?auto_12253 ?auto_12270 ) ) ( not ( = ?auto_12253 ?auto_12278 ) ) ( not ( = ?auto_12253 ?auto_12268 ) ) ( not ( = ?auto_12257 ?auto_12261 ) ) ( not ( = ?auto_12257 ?auto_12274 ) ) ( not ( = ?auto_12257 ?auto_12271 ) ) ( not ( = ?auto_12257 ?auto_12264 ) ) ( not ( = ?auto_12257 ?auto_12266 ) ) ( not ( = ?auto_12257 ?auto_12272 ) ) ( not ( = ?auto_12257 ?auto_12280 ) ) ( not ( = ?auto_12259 ?auto_12282 ) ) ( not ( = ?auto_12259 ?auto_12275 ) ) ( not ( = ?auto_12259 ?auto_12263 ) ) ( not ( = ?auto_12259 ?auto_12262 ) ) ( not ( = ?auto_12259 ?auto_12279 ) ) ( not ( = ?auto_12259 ?auto_12265 ) ) ( not ( = ?auto_12259 ?auto_12276 ) ) ( not ( = ?auto_12258 ?auto_12269 ) ) ( not ( = ?auto_12258 ?auto_12277 ) ) ( not ( = ?auto_12258 ?auto_12281 ) ) ( not ( = ?auto_12258 ?auto_12273 ) ) ( not ( = ?auto_12258 ?auto_12260 ) ) ( not ( = ?auto_12258 ?auto_12267 ) ) ( not ( = ?auto_12258 ?auto_12270 ) ) ( not ( = ?auto_12258 ?auto_12278 ) ) ( not ( = ?auto_12258 ?auto_12268 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_12243 ?auto_12244 ?auto_12245 ?auto_12246 ?auto_12247 ?auto_12248 ?auto_12249 ?auto_12250 ?auto_12251 ?auto_12252 )
      ( MAKE-1CRATE ?auto_12252 ?auto_12253 )
      ( MAKE-10CRATE-VERIFY ?auto_12243 ?auto_12244 ?auto_12245 ?auto_12246 ?auto_12247 ?auto_12248 ?auto_12249 ?auto_12250 ?auto_12251 ?auto_12252 ?auto_12253 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_12305 - SURFACE
      ?auto_12306 - SURFACE
      ?auto_12307 - SURFACE
      ?auto_12308 - SURFACE
      ?auto_12309 - SURFACE
      ?auto_12310 - SURFACE
      ?auto_12311 - SURFACE
      ?auto_12312 - SURFACE
      ?auto_12313 - SURFACE
      ?auto_12314 - SURFACE
      ?auto_12315 - SURFACE
      ?auto_12316 - SURFACE
    )
    :vars
    (
      ?auto_12318 - HOIST
      ?auto_12317 - PLACE
      ?auto_12319 - PLACE
      ?auto_12321 - HOIST
      ?auto_12322 - SURFACE
      ?auto_12331 - PLACE
      ?auto_12334 - HOIST
      ?auto_12341 - SURFACE
      ?auto_12337 - PLACE
      ?auto_12346 - HOIST
      ?auto_12332 - SURFACE
      ?auto_12343 - PLACE
      ?auto_12329 - HOIST
      ?auto_12333 - SURFACE
      ?auto_12338 - SURFACE
      ?auto_12345 - PLACE
      ?auto_12326 - HOIST
      ?auto_12328 - SURFACE
      ?auto_12323 - PLACE
      ?auto_12344 - HOIST
      ?auto_12330 - SURFACE
      ?auto_12336 - PLACE
      ?auto_12340 - HOIST
      ?auto_12339 - SURFACE
      ?auto_12342 - PLACE
      ?auto_12327 - HOIST
      ?auto_12324 - SURFACE
      ?auto_12325 - SURFACE
      ?auto_12335 - SURFACE
      ?auto_12320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12318 ?auto_12317 ) ( IS-CRATE ?auto_12316 ) ( not ( = ?auto_12319 ?auto_12317 ) ) ( HOIST-AT ?auto_12321 ?auto_12319 ) ( SURFACE-AT ?auto_12316 ?auto_12319 ) ( ON ?auto_12316 ?auto_12322 ) ( CLEAR ?auto_12316 ) ( not ( = ?auto_12315 ?auto_12316 ) ) ( not ( = ?auto_12315 ?auto_12322 ) ) ( not ( = ?auto_12316 ?auto_12322 ) ) ( not ( = ?auto_12318 ?auto_12321 ) ) ( IS-CRATE ?auto_12315 ) ( not ( = ?auto_12331 ?auto_12317 ) ) ( HOIST-AT ?auto_12334 ?auto_12331 ) ( AVAILABLE ?auto_12334 ) ( SURFACE-AT ?auto_12315 ?auto_12331 ) ( ON ?auto_12315 ?auto_12341 ) ( CLEAR ?auto_12315 ) ( not ( = ?auto_12314 ?auto_12315 ) ) ( not ( = ?auto_12314 ?auto_12341 ) ) ( not ( = ?auto_12315 ?auto_12341 ) ) ( not ( = ?auto_12318 ?auto_12334 ) ) ( IS-CRATE ?auto_12314 ) ( not ( = ?auto_12337 ?auto_12317 ) ) ( HOIST-AT ?auto_12346 ?auto_12337 ) ( AVAILABLE ?auto_12346 ) ( SURFACE-AT ?auto_12314 ?auto_12337 ) ( ON ?auto_12314 ?auto_12332 ) ( CLEAR ?auto_12314 ) ( not ( = ?auto_12313 ?auto_12314 ) ) ( not ( = ?auto_12313 ?auto_12332 ) ) ( not ( = ?auto_12314 ?auto_12332 ) ) ( not ( = ?auto_12318 ?auto_12346 ) ) ( IS-CRATE ?auto_12313 ) ( not ( = ?auto_12343 ?auto_12317 ) ) ( HOIST-AT ?auto_12329 ?auto_12343 ) ( AVAILABLE ?auto_12329 ) ( SURFACE-AT ?auto_12313 ?auto_12343 ) ( ON ?auto_12313 ?auto_12333 ) ( CLEAR ?auto_12313 ) ( not ( = ?auto_12312 ?auto_12313 ) ) ( not ( = ?auto_12312 ?auto_12333 ) ) ( not ( = ?auto_12313 ?auto_12333 ) ) ( not ( = ?auto_12318 ?auto_12329 ) ) ( IS-CRATE ?auto_12312 ) ( SURFACE-AT ?auto_12312 ?auto_12319 ) ( ON ?auto_12312 ?auto_12338 ) ( CLEAR ?auto_12312 ) ( not ( = ?auto_12311 ?auto_12312 ) ) ( not ( = ?auto_12311 ?auto_12338 ) ) ( not ( = ?auto_12312 ?auto_12338 ) ) ( IS-CRATE ?auto_12311 ) ( not ( = ?auto_12345 ?auto_12317 ) ) ( HOIST-AT ?auto_12326 ?auto_12345 ) ( AVAILABLE ?auto_12326 ) ( SURFACE-AT ?auto_12311 ?auto_12345 ) ( ON ?auto_12311 ?auto_12328 ) ( CLEAR ?auto_12311 ) ( not ( = ?auto_12310 ?auto_12311 ) ) ( not ( = ?auto_12310 ?auto_12328 ) ) ( not ( = ?auto_12311 ?auto_12328 ) ) ( not ( = ?auto_12318 ?auto_12326 ) ) ( IS-CRATE ?auto_12310 ) ( not ( = ?auto_12323 ?auto_12317 ) ) ( HOIST-AT ?auto_12344 ?auto_12323 ) ( SURFACE-AT ?auto_12310 ?auto_12323 ) ( ON ?auto_12310 ?auto_12330 ) ( CLEAR ?auto_12310 ) ( not ( = ?auto_12309 ?auto_12310 ) ) ( not ( = ?auto_12309 ?auto_12330 ) ) ( not ( = ?auto_12310 ?auto_12330 ) ) ( not ( = ?auto_12318 ?auto_12344 ) ) ( IS-CRATE ?auto_12309 ) ( not ( = ?auto_12336 ?auto_12317 ) ) ( HOIST-AT ?auto_12340 ?auto_12336 ) ( AVAILABLE ?auto_12340 ) ( SURFACE-AT ?auto_12309 ?auto_12336 ) ( ON ?auto_12309 ?auto_12339 ) ( CLEAR ?auto_12309 ) ( not ( = ?auto_12308 ?auto_12309 ) ) ( not ( = ?auto_12308 ?auto_12339 ) ) ( not ( = ?auto_12309 ?auto_12339 ) ) ( not ( = ?auto_12318 ?auto_12340 ) ) ( IS-CRATE ?auto_12308 ) ( not ( = ?auto_12342 ?auto_12317 ) ) ( HOIST-AT ?auto_12327 ?auto_12342 ) ( AVAILABLE ?auto_12327 ) ( SURFACE-AT ?auto_12308 ?auto_12342 ) ( ON ?auto_12308 ?auto_12324 ) ( CLEAR ?auto_12308 ) ( not ( = ?auto_12307 ?auto_12308 ) ) ( not ( = ?auto_12307 ?auto_12324 ) ) ( not ( = ?auto_12308 ?auto_12324 ) ) ( not ( = ?auto_12318 ?auto_12327 ) ) ( IS-CRATE ?auto_12307 ) ( AVAILABLE ?auto_12344 ) ( SURFACE-AT ?auto_12307 ?auto_12323 ) ( ON ?auto_12307 ?auto_12325 ) ( CLEAR ?auto_12307 ) ( not ( = ?auto_12306 ?auto_12307 ) ) ( not ( = ?auto_12306 ?auto_12325 ) ) ( not ( = ?auto_12307 ?auto_12325 ) ) ( SURFACE-AT ?auto_12305 ?auto_12317 ) ( CLEAR ?auto_12305 ) ( IS-CRATE ?auto_12306 ) ( AVAILABLE ?auto_12318 ) ( AVAILABLE ?auto_12321 ) ( SURFACE-AT ?auto_12306 ?auto_12319 ) ( ON ?auto_12306 ?auto_12335 ) ( CLEAR ?auto_12306 ) ( TRUCK-AT ?auto_12320 ?auto_12317 ) ( not ( = ?auto_12305 ?auto_12306 ) ) ( not ( = ?auto_12305 ?auto_12335 ) ) ( not ( = ?auto_12306 ?auto_12335 ) ) ( not ( = ?auto_12305 ?auto_12307 ) ) ( not ( = ?auto_12305 ?auto_12325 ) ) ( not ( = ?auto_12307 ?auto_12335 ) ) ( not ( = ?auto_12323 ?auto_12319 ) ) ( not ( = ?auto_12344 ?auto_12321 ) ) ( not ( = ?auto_12325 ?auto_12335 ) ) ( not ( = ?auto_12305 ?auto_12308 ) ) ( not ( = ?auto_12305 ?auto_12324 ) ) ( not ( = ?auto_12306 ?auto_12308 ) ) ( not ( = ?auto_12306 ?auto_12324 ) ) ( not ( = ?auto_12308 ?auto_12325 ) ) ( not ( = ?auto_12308 ?auto_12335 ) ) ( not ( = ?auto_12342 ?auto_12323 ) ) ( not ( = ?auto_12342 ?auto_12319 ) ) ( not ( = ?auto_12327 ?auto_12344 ) ) ( not ( = ?auto_12327 ?auto_12321 ) ) ( not ( = ?auto_12324 ?auto_12325 ) ) ( not ( = ?auto_12324 ?auto_12335 ) ) ( not ( = ?auto_12305 ?auto_12309 ) ) ( not ( = ?auto_12305 ?auto_12339 ) ) ( not ( = ?auto_12306 ?auto_12309 ) ) ( not ( = ?auto_12306 ?auto_12339 ) ) ( not ( = ?auto_12307 ?auto_12309 ) ) ( not ( = ?auto_12307 ?auto_12339 ) ) ( not ( = ?auto_12309 ?auto_12324 ) ) ( not ( = ?auto_12309 ?auto_12325 ) ) ( not ( = ?auto_12309 ?auto_12335 ) ) ( not ( = ?auto_12336 ?auto_12342 ) ) ( not ( = ?auto_12336 ?auto_12323 ) ) ( not ( = ?auto_12336 ?auto_12319 ) ) ( not ( = ?auto_12340 ?auto_12327 ) ) ( not ( = ?auto_12340 ?auto_12344 ) ) ( not ( = ?auto_12340 ?auto_12321 ) ) ( not ( = ?auto_12339 ?auto_12324 ) ) ( not ( = ?auto_12339 ?auto_12325 ) ) ( not ( = ?auto_12339 ?auto_12335 ) ) ( not ( = ?auto_12305 ?auto_12310 ) ) ( not ( = ?auto_12305 ?auto_12330 ) ) ( not ( = ?auto_12306 ?auto_12310 ) ) ( not ( = ?auto_12306 ?auto_12330 ) ) ( not ( = ?auto_12307 ?auto_12310 ) ) ( not ( = ?auto_12307 ?auto_12330 ) ) ( not ( = ?auto_12308 ?auto_12310 ) ) ( not ( = ?auto_12308 ?auto_12330 ) ) ( not ( = ?auto_12310 ?auto_12339 ) ) ( not ( = ?auto_12310 ?auto_12324 ) ) ( not ( = ?auto_12310 ?auto_12325 ) ) ( not ( = ?auto_12310 ?auto_12335 ) ) ( not ( = ?auto_12330 ?auto_12339 ) ) ( not ( = ?auto_12330 ?auto_12324 ) ) ( not ( = ?auto_12330 ?auto_12325 ) ) ( not ( = ?auto_12330 ?auto_12335 ) ) ( not ( = ?auto_12305 ?auto_12311 ) ) ( not ( = ?auto_12305 ?auto_12328 ) ) ( not ( = ?auto_12306 ?auto_12311 ) ) ( not ( = ?auto_12306 ?auto_12328 ) ) ( not ( = ?auto_12307 ?auto_12311 ) ) ( not ( = ?auto_12307 ?auto_12328 ) ) ( not ( = ?auto_12308 ?auto_12311 ) ) ( not ( = ?auto_12308 ?auto_12328 ) ) ( not ( = ?auto_12309 ?auto_12311 ) ) ( not ( = ?auto_12309 ?auto_12328 ) ) ( not ( = ?auto_12311 ?auto_12330 ) ) ( not ( = ?auto_12311 ?auto_12339 ) ) ( not ( = ?auto_12311 ?auto_12324 ) ) ( not ( = ?auto_12311 ?auto_12325 ) ) ( not ( = ?auto_12311 ?auto_12335 ) ) ( not ( = ?auto_12345 ?auto_12323 ) ) ( not ( = ?auto_12345 ?auto_12336 ) ) ( not ( = ?auto_12345 ?auto_12342 ) ) ( not ( = ?auto_12345 ?auto_12319 ) ) ( not ( = ?auto_12326 ?auto_12344 ) ) ( not ( = ?auto_12326 ?auto_12340 ) ) ( not ( = ?auto_12326 ?auto_12327 ) ) ( not ( = ?auto_12326 ?auto_12321 ) ) ( not ( = ?auto_12328 ?auto_12330 ) ) ( not ( = ?auto_12328 ?auto_12339 ) ) ( not ( = ?auto_12328 ?auto_12324 ) ) ( not ( = ?auto_12328 ?auto_12325 ) ) ( not ( = ?auto_12328 ?auto_12335 ) ) ( not ( = ?auto_12305 ?auto_12312 ) ) ( not ( = ?auto_12305 ?auto_12338 ) ) ( not ( = ?auto_12306 ?auto_12312 ) ) ( not ( = ?auto_12306 ?auto_12338 ) ) ( not ( = ?auto_12307 ?auto_12312 ) ) ( not ( = ?auto_12307 ?auto_12338 ) ) ( not ( = ?auto_12308 ?auto_12312 ) ) ( not ( = ?auto_12308 ?auto_12338 ) ) ( not ( = ?auto_12309 ?auto_12312 ) ) ( not ( = ?auto_12309 ?auto_12338 ) ) ( not ( = ?auto_12310 ?auto_12312 ) ) ( not ( = ?auto_12310 ?auto_12338 ) ) ( not ( = ?auto_12312 ?auto_12328 ) ) ( not ( = ?auto_12312 ?auto_12330 ) ) ( not ( = ?auto_12312 ?auto_12339 ) ) ( not ( = ?auto_12312 ?auto_12324 ) ) ( not ( = ?auto_12312 ?auto_12325 ) ) ( not ( = ?auto_12312 ?auto_12335 ) ) ( not ( = ?auto_12338 ?auto_12328 ) ) ( not ( = ?auto_12338 ?auto_12330 ) ) ( not ( = ?auto_12338 ?auto_12339 ) ) ( not ( = ?auto_12338 ?auto_12324 ) ) ( not ( = ?auto_12338 ?auto_12325 ) ) ( not ( = ?auto_12338 ?auto_12335 ) ) ( not ( = ?auto_12305 ?auto_12313 ) ) ( not ( = ?auto_12305 ?auto_12333 ) ) ( not ( = ?auto_12306 ?auto_12313 ) ) ( not ( = ?auto_12306 ?auto_12333 ) ) ( not ( = ?auto_12307 ?auto_12313 ) ) ( not ( = ?auto_12307 ?auto_12333 ) ) ( not ( = ?auto_12308 ?auto_12313 ) ) ( not ( = ?auto_12308 ?auto_12333 ) ) ( not ( = ?auto_12309 ?auto_12313 ) ) ( not ( = ?auto_12309 ?auto_12333 ) ) ( not ( = ?auto_12310 ?auto_12313 ) ) ( not ( = ?auto_12310 ?auto_12333 ) ) ( not ( = ?auto_12311 ?auto_12313 ) ) ( not ( = ?auto_12311 ?auto_12333 ) ) ( not ( = ?auto_12313 ?auto_12338 ) ) ( not ( = ?auto_12313 ?auto_12328 ) ) ( not ( = ?auto_12313 ?auto_12330 ) ) ( not ( = ?auto_12313 ?auto_12339 ) ) ( not ( = ?auto_12313 ?auto_12324 ) ) ( not ( = ?auto_12313 ?auto_12325 ) ) ( not ( = ?auto_12313 ?auto_12335 ) ) ( not ( = ?auto_12343 ?auto_12319 ) ) ( not ( = ?auto_12343 ?auto_12345 ) ) ( not ( = ?auto_12343 ?auto_12323 ) ) ( not ( = ?auto_12343 ?auto_12336 ) ) ( not ( = ?auto_12343 ?auto_12342 ) ) ( not ( = ?auto_12329 ?auto_12321 ) ) ( not ( = ?auto_12329 ?auto_12326 ) ) ( not ( = ?auto_12329 ?auto_12344 ) ) ( not ( = ?auto_12329 ?auto_12340 ) ) ( not ( = ?auto_12329 ?auto_12327 ) ) ( not ( = ?auto_12333 ?auto_12338 ) ) ( not ( = ?auto_12333 ?auto_12328 ) ) ( not ( = ?auto_12333 ?auto_12330 ) ) ( not ( = ?auto_12333 ?auto_12339 ) ) ( not ( = ?auto_12333 ?auto_12324 ) ) ( not ( = ?auto_12333 ?auto_12325 ) ) ( not ( = ?auto_12333 ?auto_12335 ) ) ( not ( = ?auto_12305 ?auto_12314 ) ) ( not ( = ?auto_12305 ?auto_12332 ) ) ( not ( = ?auto_12306 ?auto_12314 ) ) ( not ( = ?auto_12306 ?auto_12332 ) ) ( not ( = ?auto_12307 ?auto_12314 ) ) ( not ( = ?auto_12307 ?auto_12332 ) ) ( not ( = ?auto_12308 ?auto_12314 ) ) ( not ( = ?auto_12308 ?auto_12332 ) ) ( not ( = ?auto_12309 ?auto_12314 ) ) ( not ( = ?auto_12309 ?auto_12332 ) ) ( not ( = ?auto_12310 ?auto_12314 ) ) ( not ( = ?auto_12310 ?auto_12332 ) ) ( not ( = ?auto_12311 ?auto_12314 ) ) ( not ( = ?auto_12311 ?auto_12332 ) ) ( not ( = ?auto_12312 ?auto_12314 ) ) ( not ( = ?auto_12312 ?auto_12332 ) ) ( not ( = ?auto_12314 ?auto_12333 ) ) ( not ( = ?auto_12314 ?auto_12338 ) ) ( not ( = ?auto_12314 ?auto_12328 ) ) ( not ( = ?auto_12314 ?auto_12330 ) ) ( not ( = ?auto_12314 ?auto_12339 ) ) ( not ( = ?auto_12314 ?auto_12324 ) ) ( not ( = ?auto_12314 ?auto_12325 ) ) ( not ( = ?auto_12314 ?auto_12335 ) ) ( not ( = ?auto_12337 ?auto_12343 ) ) ( not ( = ?auto_12337 ?auto_12319 ) ) ( not ( = ?auto_12337 ?auto_12345 ) ) ( not ( = ?auto_12337 ?auto_12323 ) ) ( not ( = ?auto_12337 ?auto_12336 ) ) ( not ( = ?auto_12337 ?auto_12342 ) ) ( not ( = ?auto_12346 ?auto_12329 ) ) ( not ( = ?auto_12346 ?auto_12321 ) ) ( not ( = ?auto_12346 ?auto_12326 ) ) ( not ( = ?auto_12346 ?auto_12344 ) ) ( not ( = ?auto_12346 ?auto_12340 ) ) ( not ( = ?auto_12346 ?auto_12327 ) ) ( not ( = ?auto_12332 ?auto_12333 ) ) ( not ( = ?auto_12332 ?auto_12338 ) ) ( not ( = ?auto_12332 ?auto_12328 ) ) ( not ( = ?auto_12332 ?auto_12330 ) ) ( not ( = ?auto_12332 ?auto_12339 ) ) ( not ( = ?auto_12332 ?auto_12324 ) ) ( not ( = ?auto_12332 ?auto_12325 ) ) ( not ( = ?auto_12332 ?auto_12335 ) ) ( not ( = ?auto_12305 ?auto_12315 ) ) ( not ( = ?auto_12305 ?auto_12341 ) ) ( not ( = ?auto_12306 ?auto_12315 ) ) ( not ( = ?auto_12306 ?auto_12341 ) ) ( not ( = ?auto_12307 ?auto_12315 ) ) ( not ( = ?auto_12307 ?auto_12341 ) ) ( not ( = ?auto_12308 ?auto_12315 ) ) ( not ( = ?auto_12308 ?auto_12341 ) ) ( not ( = ?auto_12309 ?auto_12315 ) ) ( not ( = ?auto_12309 ?auto_12341 ) ) ( not ( = ?auto_12310 ?auto_12315 ) ) ( not ( = ?auto_12310 ?auto_12341 ) ) ( not ( = ?auto_12311 ?auto_12315 ) ) ( not ( = ?auto_12311 ?auto_12341 ) ) ( not ( = ?auto_12312 ?auto_12315 ) ) ( not ( = ?auto_12312 ?auto_12341 ) ) ( not ( = ?auto_12313 ?auto_12315 ) ) ( not ( = ?auto_12313 ?auto_12341 ) ) ( not ( = ?auto_12315 ?auto_12332 ) ) ( not ( = ?auto_12315 ?auto_12333 ) ) ( not ( = ?auto_12315 ?auto_12338 ) ) ( not ( = ?auto_12315 ?auto_12328 ) ) ( not ( = ?auto_12315 ?auto_12330 ) ) ( not ( = ?auto_12315 ?auto_12339 ) ) ( not ( = ?auto_12315 ?auto_12324 ) ) ( not ( = ?auto_12315 ?auto_12325 ) ) ( not ( = ?auto_12315 ?auto_12335 ) ) ( not ( = ?auto_12331 ?auto_12337 ) ) ( not ( = ?auto_12331 ?auto_12343 ) ) ( not ( = ?auto_12331 ?auto_12319 ) ) ( not ( = ?auto_12331 ?auto_12345 ) ) ( not ( = ?auto_12331 ?auto_12323 ) ) ( not ( = ?auto_12331 ?auto_12336 ) ) ( not ( = ?auto_12331 ?auto_12342 ) ) ( not ( = ?auto_12334 ?auto_12346 ) ) ( not ( = ?auto_12334 ?auto_12329 ) ) ( not ( = ?auto_12334 ?auto_12321 ) ) ( not ( = ?auto_12334 ?auto_12326 ) ) ( not ( = ?auto_12334 ?auto_12344 ) ) ( not ( = ?auto_12334 ?auto_12340 ) ) ( not ( = ?auto_12334 ?auto_12327 ) ) ( not ( = ?auto_12341 ?auto_12332 ) ) ( not ( = ?auto_12341 ?auto_12333 ) ) ( not ( = ?auto_12341 ?auto_12338 ) ) ( not ( = ?auto_12341 ?auto_12328 ) ) ( not ( = ?auto_12341 ?auto_12330 ) ) ( not ( = ?auto_12341 ?auto_12339 ) ) ( not ( = ?auto_12341 ?auto_12324 ) ) ( not ( = ?auto_12341 ?auto_12325 ) ) ( not ( = ?auto_12341 ?auto_12335 ) ) ( not ( = ?auto_12305 ?auto_12316 ) ) ( not ( = ?auto_12305 ?auto_12322 ) ) ( not ( = ?auto_12306 ?auto_12316 ) ) ( not ( = ?auto_12306 ?auto_12322 ) ) ( not ( = ?auto_12307 ?auto_12316 ) ) ( not ( = ?auto_12307 ?auto_12322 ) ) ( not ( = ?auto_12308 ?auto_12316 ) ) ( not ( = ?auto_12308 ?auto_12322 ) ) ( not ( = ?auto_12309 ?auto_12316 ) ) ( not ( = ?auto_12309 ?auto_12322 ) ) ( not ( = ?auto_12310 ?auto_12316 ) ) ( not ( = ?auto_12310 ?auto_12322 ) ) ( not ( = ?auto_12311 ?auto_12316 ) ) ( not ( = ?auto_12311 ?auto_12322 ) ) ( not ( = ?auto_12312 ?auto_12316 ) ) ( not ( = ?auto_12312 ?auto_12322 ) ) ( not ( = ?auto_12313 ?auto_12316 ) ) ( not ( = ?auto_12313 ?auto_12322 ) ) ( not ( = ?auto_12314 ?auto_12316 ) ) ( not ( = ?auto_12314 ?auto_12322 ) ) ( not ( = ?auto_12316 ?auto_12341 ) ) ( not ( = ?auto_12316 ?auto_12332 ) ) ( not ( = ?auto_12316 ?auto_12333 ) ) ( not ( = ?auto_12316 ?auto_12338 ) ) ( not ( = ?auto_12316 ?auto_12328 ) ) ( not ( = ?auto_12316 ?auto_12330 ) ) ( not ( = ?auto_12316 ?auto_12339 ) ) ( not ( = ?auto_12316 ?auto_12324 ) ) ( not ( = ?auto_12316 ?auto_12325 ) ) ( not ( = ?auto_12316 ?auto_12335 ) ) ( not ( = ?auto_12322 ?auto_12341 ) ) ( not ( = ?auto_12322 ?auto_12332 ) ) ( not ( = ?auto_12322 ?auto_12333 ) ) ( not ( = ?auto_12322 ?auto_12338 ) ) ( not ( = ?auto_12322 ?auto_12328 ) ) ( not ( = ?auto_12322 ?auto_12330 ) ) ( not ( = ?auto_12322 ?auto_12339 ) ) ( not ( = ?auto_12322 ?auto_12324 ) ) ( not ( = ?auto_12322 ?auto_12325 ) ) ( not ( = ?auto_12322 ?auto_12335 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_12305 ?auto_12306 ?auto_12307 ?auto_12308 ?auto_12309 ?auto_12310 ?auto_12311 ?auto_12312 ?auto_12313 ?auto_12314 ?auto_12315 )
      ( MAKE-1CRATE ?auto_12315 ?auto_12316 )
      ( MAKE-11CRATE-VERIFY ?auto_12305 ?auto_12306 ?auto_12307 ?auto_12308 ?auto_12309 ?auto_12310 ?auto_12311 ?auto_12312 ?auto_12313 ?auto_12314 ?auto_12315 ?auto_12316 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_12370 - SURFACE
      ?auto_12371 - SURFACE
      ?auto_12372 - SURFACE
      ?auto_12373 - SURFACE
      ?auto_12374 - SURFACE
      ?auto_12375 - SURFACE
      ?auto_12376 - SURFACE
      ?auto_12377 - SURFACE
      ?auto_12378 - SURFACE
      ?auto_12379 - SURFACE
      ?auto_12380 - SURFACE
      ?auto_12381 - SURFACE
      ?auto_12382 - SURFACE
    )
    :vars
    (
      ?auto_12383 - HOIST
      ?auto_12387 - PLACE
      ?auto_12385 - PLACE
      ?auto_12386 - HOIST
      ?auto_12384 - SURFACE
      ?auto_12392 - PLACE
      ?auto_12411 - HOIST
      ?auto_12405 - SURFACE
      ?auto_12389 - PLACE
      ?auto_12402 - HOIST
      ?auto_12393 - SURFACE
      ?auto_12398 - SURFACE
      ?auto_12396 - PLACE
      ?auto_12394 - HOIST
      ?auto_12397 - SURFACE
      ?auto_12403 - SURFACE
      ?auto_12399 - PLACE
      ?auto_12410 - HOIST
      ?auto_12390 - SURFACE
      ?auto_12413 - PLACE
      ?auto_12395 - HOIST
      ?auto_12401 - SURFACE
      ?auto_12412 - PLACE
      ?auto_12407 - HOIST
      ?auto_12391 - SURFACE
      ?auto_12400 - PLACE
      ?auto_12404 - HOIST
      ?auto_12406 - SURFACE
      ?auto_12408 - SURFACE
      ?auto_12409 - SURFACE
      ?auto_12388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12383 ?auto_12387 ) ( IS-CRATE ?auto_12382 ) ( not ( = ?auto_12385 ?auto_12387 ) ) ( HOIST-AT ?auto_12386 ?auto_12385 ) ( SURFACE-AT ?auto_12382 ?auto_12385 ) ( ON ?auto_12382 ?auto_12384 ) ( CLEAR ?auto_12382 ) ( not ( = ?auto_12381 ?auto_12382 ) ) ( not ( = ?auto_12381 ?auto_12384 ) ) ( not ( = ?auto_12382 ?auto_12384 ) ) ( not ( = ?auto_12383 ?auto_12386 ) ) ( IS-CRATE ?auto_12381 ) ( not ( = ?auto_12392 ?auto_12387 ) ) ( HOIST-AT ?auto_12411 ?auto_12392 ) ( SURFACE-AT ?auto_12381 ?auto_12392 ) ( ON ?auto_12381 ?auto_12405 ) ( CLEAR ?auto_12381 ) ( not ( = ?auto_12380 ?auto_12381 ) ) ( not ( = ?auto_12380 ?auto_12405 ) ) ( not ( = ?auto_12381 ?auto_12405 ) ) ( not ( = ?auto_12383 ?auto_12411 ) ) ( IS-CRATE ?auto_12380 ) ( not ( = ?auto_12389 ?auto_12387 ) ) ( HOIST-AT ?auto_12402 ?auto_12389 ) ( AVAILABLE ?auto_12402 ) ( SURFACE-AT ?auto_12380 ?auto_12389 ) ( ON ?auto_12380 ?auto_12393 ) ( CLEAR ?auto_12380 ) ( not ( = ?auto_12379 ?auto_12380 ) ) ( not ( = ?auto_12379 ?auto_12393 ) ) ( not ( = ?auto_12380 ?auto_12393 ) ) ( not ( = ?auto_12383 ?auto_12402 ) ) ( IS-CRATE ?auto_12379 ) ( AVAILABLE ?auto_12386 ) ( SURFACE-AT ?auto_12379 ?auto_12385 ) ( ON ?auto_12379 ?auto_12398 ) ( CLEAR ?auto_12379 ) ( not ( = ?auto_12378 ?auto_12379 ) ) ( not ( = ?auto_12378 ?auto_12398 ) ) ( not ( = ?auto_12379 ?auto_12398 ) ) ( IS-CRATE ?auto_12378 ) ( not ( = ?auto_12396 ?auto_12387 ) ) ( HOIST-AT ?auto_12394 ?auto_12396 ) ( AVAILABLE ?auto_12394 ) ( SURFACE-AT ?auto_12378 ?auto_12396 ) ( ON ?auto_12378 ?auto_12397 ) ( CLEAR ?auto_12378 ) ( not ( = ?auto_12377 ?auto_12378 ) ) ( not ( = ?auto_12377 ?auto_12397 ) ) ( not ( = ?auto_12378 ?auto_12397 ) ) ( not ( = ?auto_12383 ?auto_12394 ) ) ( IS-CRATE ?auto_12377 ) ( SURFACE-AT ?auto_12377 ?auto_12392 ) ( ON ?auto_12377 ?auto_12403 ) ( CLEAR ?auto_12377 ) ( not ( = ?auto_12376 ?auto_12377 ) ) ( not ( = ?auto_12376 ?auto_12403 ) ) ( not ( = ?auto_12377 ?auto_12403 ) ) ( IS-CRATE ?auto_12376 ) ( not ( = ?auto_12399 ?auto_12387 ) ) ( HOIST-AT ?auto_12410 ?auto_12399 ) ( AVAILABLE ?auto_12410 ) ( SURFACE-AT ?auto_12376 ?auto_12399 ) ( ON ?auto_12376 ?auto_12390 ) ( CLEAR ?auto_12376 ) ( not ( = ?auto_12375 ?auto_12376 ) ) ( not ( = ?auto_12375 ?auto_12390 ) ) ( not ( = ?auto_12376 ?auto_12390 ) ) ( not ( = ?auto_12383 ?auto_12410 ) ) ( IS-CRATE ?auto_12375 ) ( not ( = ?auto_12413 ?auto_12387 ) ) ( HOIST-AT ?auto_12395 ?auto_12413 ) ( SURFACE-AT ?auto_12375 ?auto_12413 ) ( ON ?auto_12375 ?auto_12401 ) ( CLEAR ?auto_12375 ) ( not ( = ?auto_12374 ?auto_12375 ) ) ( not ( = ?auto_12374 ?auto_12401 ) ) ( not ( = ?auto_12375 ?auto_12401 ) ) ( not ( = ?auto_12383 ?auto_12395 ) ) ( IS-CRATE ?auto_12374 ) ( not ( = ?auto_12412 ?auto_12387 ) ) ( HOIST-AT ?auto_12407 ?auto_12412 ) ( AVAILABLE ?auto_12407 ) ( SURFACE-AT ?auto_12374 ?auto_12412 ) ( ON ?auto_12374 ?auto_12391 ) ( CLEAR ?auto_12374 ) ( not ( = ?auto_12373 ?auto_12374 ) ) ( not ( = ?auto_12373 ?auto_12391 ) ) ( not ( = ?auto_12374 ?auto_12391 ) ) ( not ( = ?auto_12383 ?auto_12407 ) ) ( IS-CRATE ?auto_12373 ) ( not ( = ?auto_12400 ?auto_12387 ) ) ( HOIST-AT ?auto_12404 ?auto_12400 ) ( AVAILABLE ?auto_12404 ) ( SURFACE-AT ?auto_12373 ?auto_12400 ) ( ON ?auto_12373 ?auto_12406 ) ( CLEAR ?auto_12373 ) ( not ( = ?auto_12372 ?auto_12373 ) ) ( not ( = ?auto_12372 ?auto_12406 ) ) ( not ( = ?auto_12373 ?auto_12406 ) ) ( not ( = ?auto_12383 ?auto_12404 ) ) ( IS-CRATE ?auto_12372 ) ( AVAILABLE ?auto_12395 ) ( SURFACE-AT ?auto_12372 ?auto_12413 ) ( ON ?auto_12372 ?auto_12408 ) ( CLEAR ?auto_12372 ) ( not ( = ?auto_12371 ?auto_12372 ) ) ( not ( = ?auto_12371 ?auto_12408 ) ) ( not ( = ?auto_12372 ?auto_12408 ) ) ( SURFACE-AT ?auto_12370 ?auto_12387 ) ( CLEAR ?auto_12370 ) ( IS-CRATE ?auto_12371 ) ( AVAILABLE ?auto_12383 ) ( AVAILABLE ?auto_12411 ) ( SURFACE-AT ?auto_12371 ?auto_12392 ) ( ON ?auto_12371 ?auto_12409 ) ( CLEAR ?auto_12371 ) ( TRUCK-AT ?auto_12388 ?auto_12387 ) ( not ( = ?auto_12370 ?auto_12371 ) ) ( not ( = ?auto_12370 ?auto_12409 ) ) ( not ( = ?auto_12371 ?auto_12409 ) ) ( not ( = ?auto_12370 ?auto_12372 ) ) ( not ( = ?auto_12370 ?auto_12408 ) ) ( not ( = ?auto_12372 ?auto_12409 ) ) ( not ( = ?auto_12413 ?auto_12392 ) ) ( not ( = ?auto_12395 ?auto_12411 ) ) ( not ( = ?auto_12408 ?auto_12409 ) ) ( not ( = ?auto_12370 ?auto_12373 ) ) ( not ( = ?auto_12370 ?auto_12406 ) ) ( not ( = ?auto_12371 ?auto_12373 ) ) ( not ( = ?auto_12371 ?auto_12406 ) ) ( not ( = ?auto_12373 ?auto_12408 ) ) ( not ( = ?auto_12373 ?auto_12409 ) ) ( not ( = ?auto_12400 ?auto_12413 ) ) ( not ( = ?auto_12400 ?auto_12392 ) ) ( not ( = ?auto_12404 ?auto_12395 ) ) ( not ( = ?auto_12404 ?auto_12411 ) ) ( not ( = ?auto_12406 ?auto_12408 ) ) ( not ( = ?auto_12406 ?auto_12409 ) ) ( not ( = ?auto_12370 ?auto_12374 ) ) ( not ( = ?auto_12370 ?auto_12391 ) ) ( not ( = ?auto_12371 ?auto_12374 ) ) ( not ( = ?auto_12371 ?auto_12391 ) ) ( not ( = ?auto_12372 ?auto_12374 ) ) ( not ( = ?auto_12372 ?auto_12391 ) ) ( not ( = ?auto_12374 ?auto_12406 ) ) ( not ( = ?auto_12374 ?auto_12408 ) ) ( not ( = ?auto_12374 ?auto_12409 ) ) ( not ( = ?auto_12412 ?auto_12400 ) ) ( not ( = ?auto_12412 ?auto_12413 ) ) ( not ( = ?auto_12412 ?auto_12392 ) ) ( not ( = ?auto_12407 ?auto_12404 ) ) ( not ( = ?auto_12407 ?auto_12395 ) ) ( not ( = ?auto_12407 ?auto_12411 ) ) ( not ( = ?auto_12391 ?auto_12406 ) ) ( not ( = ?auto_12391 ?auto_12408 ) ) ( not ( = ?auto_12391 ?auto_12409 ) ) ( not ( = ?auto_12370 ?auto_12375 ) ) ( not ( = ?auto_12370 ?auto_12401 ) ) ( not ( = ?auto_12371 ?auto_12375 ) ) ( not ( = ?auto_12371 ?auto_12401 ) ) ( not ( = ?auto_12372 ?auto_12375 ) ) ( not ( = ?auto_12372 ?auto_12401 ) ) ( not ( = ?auto_12373 ?auto_12375 ) ) ( not ( = ?auto_12373 ?auto_12401 ) ) ( not ( = ?auto_12375 ?auto_12391 ) ) ( not ( = ?auto_12375 ?auto_12406 ) ) ( not ( = ?auto_12375 ?auto_12408 ) ) ( not ( = ?auto_12375 ?auto_12409 ) ) ( not ( = ?auto_12401 ?auto_12391 ) ) ( not ( = ?auto_12401 ?auto_12406 ) ) ( not ( = ?auto_12401 ?auto_12408 ) ) ( not ( = ?auto_12401 ?auto_12409 ) ) ( not ( = ?auto_12370 ?auto_12376 ) ) ( not ( = ?auto_12370 ?auto_12390 ) ) ( not ( = ?auto_12371 ?auto_12376 ) ) ( not ( = ?auto_12371 ?auto_12390 ) ) ( not ( = ?auto_12372 ?auto_12376 ) ) ( not ( = ?auto_12372 ?auto_12390 ) ) ( not ( = ?auto_12373 ?auto_12376 ) ) ( not ( = ?auto_12373 ?auto_12390 ) ) ( not ( = ?auto_12374 ?auto_12376 ) ) ( not ( = ?auto_12374 ?auto_12390 ) ) ( not ( = ?auto_12376 ?auto_12401 ) ) ( not ( = ?auto_12376 ?auto_12391 ) ) ( not ( = ?auto_12376 ?auto_12406 ) ) ( not ( = ?auto_12376 ?auto_12408 ) ) ( not ( = ?auto_12376 ?auto_12409 ) ) ( not ( = ?auto_12399 ?auto_12413 ) ) ( not ( = ?auto_12399 ?auto_12412 ) ) ( not ( = ?auto_12399 ?auto_12400 ) ) ( not ( = ?auto_12399 ?auto_12392 ) ) ( not ( = ?auto_12410 ?auto_12395 ) ) ( not ( = ?auto_12410 ?auto_12407 ) ) ( not ( = ?auto_12410 ?auto_12404 ) ) ( not ( = ?auto_12410 ?auto_12411 ) ) ( not ( = ?auto_12390 ?auto_12401 ) ) ( not ( = ?auto_12390 ?auto_12391 ) ) ( not ( = ?auto_12390 ?auto_12406 ) ) ( not ( = ?auto_12390 ?auto_12408 ) ) ( not ( = ?auto_12390 ?auto_12409 ) ) ( not ( = ?auto_12370 ?auto_12377 ) ) ( not ( = ?auto_12370 ?auto_12403 ) ) ( not ( = ?auto_12371 ?auto_12377 ) ) ( not ( = ?auto_12371 ?auto_12403 ) ) ( not ( = ?auto_12372 ?auto_12377 ) ) ( not ( = ?auto_12372 ?auto_12403 ) ) ( not ( = ?auto_12373 ?auto_12377 ) ) ( not ( = ?auto_12373 ?auto_12403 ) ) ( not ( = ?auto_12374 ?auto_12377 ) ) ( not ( = ?auto_12374 ?auto_12403 ) ) ( not ( = ?auto_12375 ?auto_12377 ) ) ( not ( = ?auto_12375 ?auto_12403 ) ) ( not ( = ?auto_12377 ?auto_12390 ) ) ( not ( = ?auto_12377 ?auto_12401 ) ) ( not ( = ?auto_12377 ?auto_12391 ) ) ( not ( = ?auto_12377 ?auto_12406 ) ) ( not ( = ?auto_12377 ?auto_12408 ) ) ( not ( = ?auto_12377 ?auto_12409 ) ) ( not ( = ?auto_12403 ?auto_12390 ) ) ( not ( = ?auto_12403 ?auto_12401 ) ) ( not ( = ?auto_12403 ?auto_12391 ) ) ( not ( = ?auto_12403 ?auto_12406 ) ) ( not ( = ?auto_12403 ?auto_12408 ) ) ( not ( = ?auto_12403 ?auto_12409 ) ) ( not ( = ?auto_12370 ?auto_12378 ) ) ( not ( = ?auto_12370 ?auto_12397 ) ) ( not ( = ?auto_12371 ?auto_12378 ) ) ( not ( = ?auto_12371 ?auto_12397 ) ) ( not ( = ?auto_12372 ?auto_12378 ) ) ( not ( = ?auto_12372 ?auto_12397 ) ) ( not ( = ?auto_12373 ?auto_12378 ) ) ( not ( = ?auto_12373 ?auto_12397 ) ) ( not ( = ?auto_12374 ?auto_12378 ) ) ( not ( = ?auto_12374 ?auto_12397 ) ) ( not ( = ?auto_12375 ?auto_12378 ) ) ( not ( = ?auto_12375 ?auto_12397 ) ) ( not ( = ?auto_12376 ?auto_12378 ) ) ( not ( = ?auto_12376 ?auto_12397 ) ) ( not ( = ?auto_12378 ?auto_12403 ) ) ( not ( = ?auto_12378 ?auto_12390 ) ) ( not ( = ?auto_12378 ?auto_12401 ) ) ( not ( = ?auto_12378 ?auto_12391 ) ) ( not ( = ?auto_12378 ?auto_12406 ) ) ( not ( = ?auto_12378 ?auto_12408 ) ) ( not ( = ?auto_12378 ?auto_12409 ) ) ( not ( = ?auto_12396 ?auto_12392 ) ) ( not ( = ?auto_12396 ?auto_12399 ) ) ( not ( = ?auto_12396 ?auto_12413 ) ) ( not ( = ?auto_12396 ?auto_12412 ) ) ( not ( = ?auto_12396 ?auto_12400 ) ) ( not ( = ?auto_12394 ?auto_12411 ) ) ( not ( = ?auto_12394 ?auto_12410 ) ) ( not ( = ?auto_12394 ?auto_12395 ) ) ( not ( = ?auto_12394 ?auto_12407 ) ) ( not ( = ?auto_12394 ?auto_12404 ) ) ( not ( = ?auto_12397 ?auto_12403 ) ) ( not ( = ?auto_12397 ?auto_12390 ) ) ( not ( = ?auto_12397 ?auto_12401 ) ) ( not ( = ?auto_12397 ?auto_12391 ) ) ( not ( = ?auto_12397 ?auto_12406 ) ) ( not ( = ?auto_12397 ?auto_12408 ) ) ( not ( = ?auto_12397 ?auto_12409 ) ) ( not ( = ?auto_12370 ?auto_12379 ) ) ( not ( = ?auto_12370 ?auto_12398 ) ) ( not ( = ?auto_12371 ?auto_12379 ) ) ( not ( = ?auto_12371 ?auto_12398 ) ) ( not ( = ?auto_12372 ?auto_12379 ) ) ( not ( = ?auto_12372 ?auto_12398 ) ) ( not ( = ?auto_12373 ?auto_12379 ) ) ( not ( = ?auto_12373 ?auto_12398 ) ) ( not ( = ?auto_12374 ?auto_12379 ) ) ( not ( = ?auto_12374 ?auto_12398 ) ) ( not ( = ?auto_12375 ?auto_12379 ) ) ( not ( = ?auto_12375 ?auto_12398 ) ) ( not ( = ?auto_12376 ?auto_12379 ) ) ( not ( = ?auto_12376 ?auto_12398 ) ) ( not ( = ?auto_12377 ?auto_12379 ) ) ( not ( = ?auto_12377 ?auto_12398 ) ) ( not ( = ?auto_12379 ?auto_12397 ) ) ( not ( = ?auto_12379 ?auto_12403 ) ) ( not ( = ?auto_12379 ?auto_12390 ) ) ( not ( = ?auto_12379 ?auto_12401 ) ) ( not ( = ?auto_12379 ?auto_12391 ) ) ( not ( = ?auto_12379 ?auto_12406 ) ) ( not ( = ?auto_12379 ?auto_12408 ) ) ( not ( = ?auto_12379 ?auto_12409 ) ) ( not ( = ?auto_12385 ?auto_12396 ) ) ( not ( = ?auto_12385 ?auto_12392 ) ) ( not ( = ?auto_12385 ?auto_12399 ) ) ( not ( = ?auto_12385 ?auto_12413 ) ) ( not ( = ?auto_12385 ?auto_12412 ) ) ( not ( = ?auto_12385 ?auto_12400 ) ) ( not ( = ?auto_12386 ?auto_12394 ) ) ( not ( = ?auto_12386 ?auto_12411 ) ) ( not ( = ?auto_12386 ?auto_12410 ) ) ( not ( = ?auto_12386 ?auto_12395 ) ) ( not ( = ?auto_12386 ?auto_12407 ) ) ( not ( = ?auto_12386 ?auto_12404 ) ) ( not ( = ?auto_12398 ?auto_12397 ) ) ( not ( = ?auto_12398 ?auto_12403 ) ) ( not ( = ?auto_12398 ?auto_12390 ) ) ( not ( = ?auto_12398 ?auto_12401 ) ) ( not ( = ?auto_12398 ?auto_12391 ) ) ( not ( = ?auto_12398 ?auto_12406 ) ) ( not ( = ?auto_12398 ?auto_12408 ) ) ( not ( = ?auto_12398 ?auto_12409 ) ) ( not ( = ?auto_12370 ?auto_12380 ) ) ( not ( = ?auto_12370 ?auto_12393 ) ) ( not ( = ?auto_12371 ?auto_12380 ) ) ( not ( = ?auto_12371 ?auto_12393 ) ) ( not ( = ?auto_12372 ?auto_12380 ) ) ( not ( = ?auto_12372 ?auto_12393 ) ) ( not ( = ?auto_12373 ?auto_12380 ) ) ( not ( = ?auto_12373 ?auto_12393 ) ) ( not ( = ?auto_12374 ?auto_12380 ) ) ( not ( = ?auto_12374 ?auto_12393 ) ) ( not ( = ?auto_12375 ?auto_12380 ) ) ( not ( = ?auto_12375 ?auto_12393 ) ) ( not ( = ?auto_12376 ?auto_12380 ) ) ( not ( = ?auto_12376 ?auto_12393 ) ) ( not ( = ?auto_12377 ?auto_12380 ) ) ( not ( = ?auto_12377 ?auto_12393 ) ) ( not ( = ?auto_12378 ?auto_12380 ) ) ( not ( = ?auto_12378 ?auto_12393 ) ) ( not ( = ?auto_12380 ?auto_12398 ) ) ( not ( = ?auto_12380 ?auto_12397 ) ) ( not ( = ?auto_12380 ?auto_12403 ) ) ( not ( = ?auto_12380 ?auto_12390 ) ) ( not ( = ?auto_12380 ?auto_12401 ) ) ( not ( = ?auto_12380 ?auto_12391 ) ) ( not ( = ?auto_12380 ?auto_12406 ) ) ( not ( = ?auto_12380 ?auto_12408 ) ) ( not ( = ?auto_12380 ?auto_12409 ) ) ( not ( = ?auto_12389 ?auto_12385 ) ) ( not ( = ?auto_12389 ?auto_12396 ) ) ( not ( = ?auto_12389 ?auto_12392 ) ) ( not ( = ?auto_12389 ?auto_12399 ) ) ( not ( = ?auto_12389 ?auto_12413 ) ) ( not ( = ?auto_12389 ?auto_12412 ) ) ( not ( = ?auto_12389 ?auto_12400 ) ) ( not ( = ?auto_12402 ?auto_12386 ) ) ( not ( = ?auto_12402 ?auto_12394 ) ) ( not ( = ?auto_12402 ?auto_12411 ) ) ( not ( = ?auto_12402 ?auto_12410 ) ) ( not ( = ?auto_12402 ?auto_12395 ) ) ( not ( = ?auto_12402 ?auto_12407 ) ) ( not ( = ?auto_12402 ?auto_12404 ) ) ( not ( = ?auto_12393 ?auto_12398 ) ) ( not ( = ?auto_12393 ?auto_12397 ) ) ( not ( = ?auto_12393 ?auto_12403 ) ) ( not ( = ?auto_12393 ?auto_12390 ) ) ( not ( = ?auto_12393 ?auto_12401 ) ) ( not ( = ?auto_12393 ?auto_12391 ) ) ( not ( = ?auto_12393 ?auto_12406 ) ) ( not ( = ?auto_12393 ?auto_12408 ) ) ( not ( = ?auto_12393 ?auto_12409 ) ) ( not ( = ?auto_12370 ?auto_12381 ) ) ( not ( = ?auto_12370 ?auto_12405 ) ) ( not ( = ?auto_12371 ?auto_12381 ) ) ( not ( = ?auto_12371 ?auto_12405 ) ) ( not ( = ?auto_12372 ?auto_12381 ) ) ( not ( = ?auto_12372 ?auto_12405 ) ) ( not ( = ?auto_12373 ?auto_12381 ) ) ( not ( = ?auto_12373 ?auto_12405 ) ) ( not ( = ?auto_12374 ?auto_12381 ) ) ( not ( = ?auto_12374 ?auto_12405 ) ) ( not ( = ?auto_12375 ?auto_12381 ) ) ( not ( = ?auto_12375 ?auto_12405 ) ) ( not ( = ?auto_12376 ?auto_12381 ) ) ( not ( = ?auto_12376 ?auto_12405 ) ) ( not ( = ?auto_12377 ?auto_12381 ) ) ( not ( = ?auto_12377 ?auto_12405 ) ) ( not ( = ?auto_12378 ?auto_12381 ) ) ( not ( = ?auto_12378 ?auto_12405 ) ) ( not ( = ?auto_12379 ?auto_12381 ) ) ( not ( = ?auto_12379 ?auto_12405 ) ) ( not ( = ?auto_12381 ?auto_12393 ) ) ( not ( = ?auto_12381 ?auto_12398 ) ) ( not ( = ?auto_12381 ?auto_12397 ) ) ( not ( = ?auto_12381 ?auto_12403 ) ) ( not ( = ?auto_12381 ?auto_12390 ) ) ( not ( = ?auto_12381 ?auto_12401 ) ) ( not ( = ?auto_12381 ?auto_12391 ) ) ( not ( = ?auto_12381 ?auto_12406 ) ) ( not ( = ?auto_12381 ?auto_12408 ) ) ( not ( = ?auto_12381 ?auto_12409 ) ) ( not ( = ?auto_12405 ?auto_12393 ) ) ( not ( = ?auto_12405 ?auto_12398 ) ) ( not ( = ?auto_12405 ?auto_12397 ) ) ( not ( = ?auto_12405 ?auto_12403 ) ) ( not ( = ?auto_12405 ?auto_12390 ) ) ( not ( = ?auto_12405 ?auto_12401 ) ) ( not ( = ?auto_12405 ?auto_12391 ) ) ( not ( = ?auto_12405 ?auto_12406 ) ) ( not ( = ?auto_12405 ?auto_12408 ) ) ( not ( = ?auto_12405 ?auto_12409 ) ) ( not ( = ?auto_12370 ?auto_12382 ) ) ( not ( = ?auto_12370 ?auto_12384 ) ) ( not ( = ?auto_12371 ?auto_12382 ) ) ( not ( = ?auto_12371 ?auto_12384 ) ) ( not ( = ?auto_12372 ?auto_12382 ) ) ( not ( = ?auto_12372 ?auto_12384 ) ) ( not ( = ?auto_12373 ?auto_12382 ) ) ( not ( = ?auto_12373 ?auto_12384 ) ) ( not ( = ?auto_12374 ?auto_12382 ) ) ( not ( = ?auto_12374 ?auto_12384 ) ) ( not ( = ?auto_12375 ?auto_12382 ) ) ( not ( = ?auto_12375 ?auto_12384 ) ) ( not ( = ?auto_12376 ?auto_12382 ) ) ( not ( = ?auto_12376 ?auto_12384 ) ) ( not ( = ?auto_12377 ?auto_12382 ) ) ( not ( = ?auto_12377 ?auto_12384 ) ) ( not ( = ?auto_12378 ?auto_12382 ) ) ( not ( = ?auto_12378 ?auto_12384 ) ) ( not ( = ?auto_12379 ?auto_12382 ) ) ( not ( = ?auto_12379 ?auto_12384 ) ) ( not ( = ?auto_12380 ?auto_12382 ) ) ( not ( = ?auto_12380 ?auto_12384 ) ) ( not ( = ?auto_12382 ?auto_12405 ) ) ( not ( = ?auto_12382 ?auto_12393 ) ) ( not ( = ?auto_12382 ?auto_12398 ) ) ( not ( = ?auto_12382 ?auto_12397 ) ) ( not ( = ?auto_12382 ?auto_12403 ) ) ( not ( = ?auto_12382 ?auto_12390 ) ) ( not ( = ?auto_12382 ?auto_12401 ) ) ( not ( = ?auto_12382 ?auto_12391 ) ) ( not ( = ?auto_12382 ?auto_12406 ) ) ( not ( = ?auto_12382 ?auto_12408 ) ) ( not ( = ?auto_12382 ?auto_12409 ) ) ( not ( = ?auto_12384 ?auto_12405 ) ) ( not ( = ?auto_12384 ?auto_12393 ) ) ( not ( = ?auto_12384 ?auto_12398 ) ) ( not ( = ?auto_12384 ?auto_12397 ) ) ( not ( = ?auto_12384 ?auto_12403 ) ) ( not ( = ?auto_12384 ?auto_12390 ) ) ( not ( = ?auto_12384 ?auto_12401 ) ) ( not ( = ?auto_12384 ?auto_12391 ) ) ( not ( = ?auto_12384 ?auto_12406 ) ) ( not ( = ?auto_12384 ?auto_12408 ) ) ( not ( = ?auto_12384 ?auto_12409 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_12370 ?auto_12371 ?auto_12372 ?auto_12373 ?auto_12374 ?auto_12375 ?auto_12376 ?auto_12377 ?auto_12378 ?auto_12379 ?auto_12380 ?auto_12381 )
      ( MAKE-1CRATE ?auto_12381 ?auto_12382 )
      ( MAKE-12CRATE-VERIFY ?auto_12370 ?auto_12371 ?auto_12372 ?auto_12373 ?auto_12374 ?auto_12375 ?auto_12376 ?auto_12377 ?auto_12378 ?auto_12379 ?auto_12380 ?auto_12381 ?auto_12382 ) )
  )

)

