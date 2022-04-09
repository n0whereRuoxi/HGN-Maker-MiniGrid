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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11900 - SURFACE
      ?auto_11901 - SURFACE
    )
    :vars
    (
      ?auto_11902 - HOIST
      ?auto_11903 - PLACE
      ?auto_11905 - PLACE
      ?auto_11906 - HOIST
      ?auto_11907 - SURFACE
      ?auto_11904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11902 ?auto_11903 ) ( SURFACE-AT ?auto_11900 ?auto_11903 ) ( CLEAR ?auto_11900 ) ( IS-CRATE ?auto_11901 ) ( AVAILABLE ?auto_11902 ) ( not ( = ?auto_11905 ?auto_11903 ) ) ( HOIST-AT ?auto_11906 ?auto_11905 ) ( AVAILABLE ?auto_11906 ) ( SURFACE-AT ?auto_11901 ?auto_11905 ) ( ON ?auto_11901 ?auto_11907 ) ( CLEAR ?auto_11901 ) ( TRUCK-AT ?auto_11904 ?auto_11903 ) ( not ( = ?auto_11900 ?auto_11901 ) ) ( not ( = ?auto_11900 ?auto_11907 ) ) ( not ( = ?auto_11901 ?auto_11907 ) ) ( not ( = ?auto_11902 ?auto_11906 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11904 ?auto_11903 ?auto_11905 )
      ( !LIFT ?auto_11906 ?auto_11901 ?auto_11907 ?auto_11905 )
      ( !LOAD ?auto_11906 ?auto_11901 ?auto_11904 ?auto_11905 )
      ( !DRIVE ?auto_11904 ?auto_11905 ?auto_11903 )
      ( !UNLOAD ?auto_11902 ?auto_11901 ?auto_11904 ?auto_11903 )
      ( !DROP ?auto_11902 ?auto_11901 ?auto_11900 ?auto_11903 )
      ( MAKE-1CRATE-VERIFY ?auto_11900 ?auto_11901 ) )
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
      ?auto_11915 - HOIST
      ?auto_11918 - PLACE
      ?auto_11916 - PLACE
      ?auto_11917 - HOIST
      ?auto_11919 - SURFACE
      ?auto_11920 - PLACE
      ?auto_11922 - HOIST
      ?auto_11921 - SURFACE
      ?auto_11914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11915 ?auto_11918 ) ( IS-CRATE ?auto_11913 ) ( not ( = ?auto_11916 ?auto_11918 ) ) ( HOIST-AT ?auto_11917 ?auto_11916 ) ( AVAILABLE ?auto_11917 ) ( SURFACE-AT ?auto_11913 ?auto_11916 ) ( ON ?auto_11913 ?auto_11919 ) ( CLEAR ?auto_11913 ) ( not ( = ?auto_11912 ?auto_11913 ) ) ( not ( = ?auto_11912 ?auto_11919 ) ) ( not ( = ?auto_11913 ?auto_11919 ) ) ( not ( = ?auto_11915 ?auto_11917 ) ) ( SURFACE-AT ?auto_11911 ?auto_11918 ) ( CLEAR ?auto_11911 ) ( IS-CRATE ?auto_11912 ) ( AVAILABLE ?auto_11915 ) ( not ( = ?auto_11920 ?auto_11918 ) ) ( HOIST-AT ?auto_11922 ?auto_11920 ) ( AVAILABLE ?auto_11922 ) ( SURFACE-AT ?auto_11912 ?auto_11920 ) ( ON ?auto_11912 ?auto_11921 ) ( CLEAR ?auto_11912 ) ( TRUCK-AT ?auto_11914 ?auto_11918 ) ( not ( = ?auto_11911 ?auto_11912 ) ) ( not ( = ?auto_11911 ?auto_11921 ) ) ( not ( = ?auto_11912 ?auto_11921 ) ) ( not ( = ?auto_11915 ?auto_11922 ) ) ( not ( = ?auto_11911 ?auto_11913 ) ) ( not ( = ?auto_11911 ?auto_11919 ) ) ( not ( = ?auto_11913 ?auto_11921 ) ) ( not ( = ?auto_11916 ?auto_11920 ) ) ( not ( = ?auto_11917 ?auto_11922 ) ) ( not ( = ?auto_11919 ?auto_11921 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11911 ?auto_11912 )
      ( MAKE-1CRATE ?auto_11912 ?auto_11913 )
      ( MAKE-2CRATE-VERIFY ?auto_11911 ?auto_11912 ?auto_11913 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11925 - SURFACE
      ?auto_11926 - SURFACE
    )
    :vars
    (
      ?auto_11927 - HOIST
      ?auto_11928 - PLACE
      ?auto_11930 - PLACE
      ?auto_11931 - HOIST
      ?auto_11932 - SURFACE
      ?auto_11929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11927 ?auto_11928 ) ( SURFACE-AT ?auto_11925 ?auto_11928 ) ( CLEAR ?auto_11925 ) ( IS-CRATE ?auto_11926 ) ( AVAILABLE ?auto_11927 ) ( not ( = ?auto_11930 ?auto_11928 ) ) ( HOIST-AT ?auto_11931 ?auto_11930 ) ( AVAILABLE ?auto_11931 ) ( SURFACE-AT ?auto_11926 ?auto_11930 ) ( ON ?auto_11926 ?auto_11932 ) ( CLEAR ?auto_11926 ) ( TRUCK-AT ?auto_11929 ?auto_11928 ) ( not ( = ?auto_11925 ?auto_11926 ) ) ( not ( = ?auto_11925 ?auto_11932 ) ) ( not ( = ?auto_11926 ?auto_11932 ) ) ( not ( = ?auto_11927 ?auto_11931 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11929 ?auto_11928 ?auto_11930 )
      ( !LIFT ?auto_11931 ?auto_11926 ?auto_11932 ?auto_11930 )
      ( !LOAD ?auto_11931 ?auto_11926 ?auto_11929 ?auto_11930 )
      ( !DRIVE ?auto_11929 ?auto_11930 ?auto_11928 )
      ( !UNLOAD ?auto_11927 ?auto_11926 ?auto_11929 ?auto_11928 )
      ( !DROP ?auto_11927 ?auto_11926 ?auto_11925 ?auto_11928 )
      ( MAKE-1CRATE-VERIFY ?auto_11925 ?auto_11926 ) )
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
      ?auto_11941 - HOIST
      ?auto_11942 - PLACE
      ?auto_11945 - PLACE
      ?auto_11944 - HOIST
      ?auto_11946 - SURFACE
      ?auto_11952 - PLACE
      ?auto_11949 - HOIST
      ?auto_11947 - SURFACE
      ?auto_11951 - PLACE
      ?auto_11948 - HOIST
      ?auto_11950 - SURFACE
      ?auto_11943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11941 ?auto_11942 ) ( IS-CRATE ?auto_11940 ) ( not ( = ?auto_11945 ?auto_11942 ) ) ( HOIST-AT ?auto_11944 ?auto_11945 ) ( AVAILABLE ?auto_11944 ) ( SURFACE-AT ?auto_11940 ?auto_11945 ) ( ON ?auto_11940 ?auto_11946 ) ( CLEAR ?auto_11940 ) ( not ( = ?auto_11939 ?auto_11940 ) ) ( not ( = ?auto_11939 ?auto_11946 ) ) ( not ( = ?auto_11940 ?auto_11946 ) ) ( not ( = ?auto_11941 ?auto_11944 ) ) ( IS-CRATE ?auto_11939 ) ( not ( = ?auto_11952 ?auto_11942 ) ) ( HOIST-AT ?auto_11949 ?auto_11952 ) ( AVAILABLE ?auto_11949 ) ( SURFACE-AT ?auto_11939 ?auto_11952 ) ( ON ?auto_11939 ?auto_11947 ) ( CLEAR ?auto_11939 ) ( not ( = ?auto_11938 ?auto_11939 ) ) ( not ( = ?auto_11938 ?auto_11947 ) ) ( not ( = ?auto_11939 ?auto_11947 ) ) ( not ( = ?auto_11941 ?auto_11949 ) ) ( SURFACE-AT ?auto_11937 ?auto_11942 ) ( CLEAR ?auto_11937 ) ( IS-CRATE ?auto_11938 ) ( AVAILABLE ?auto_11941 ) ( not ( = ?auto_11951 ?auto_11942 ) ) ( HOIST-AT ?auto_11948 ?auto_11951 ) ( AVAILABLE ?auto_11948 ) ( SURFACE-AT ?auto_11938 ?auto_11951 ) ( ON ?auto_11938 ?auto_11950 ) ( CLEAR ?auto_11938 ) ( TRUCK-AT ?auto_11943 ?auto_11942 ) ( not ( = ?auto_11937 ?auto_11938 ) ) ( not ( = ?auto_11937 ?auto_11950 ) ) ( not ( = ?auto_11938 ?auto_11950 ) ) ( not ( = ?auto_11941 ?auto_11948 ) ) ( not ( = ?auto_11937 ?auto_11939 ) ) ( not ( = ?auto_11937 ?auto_11947 ) ) ( not ( = ?auto_11939 ?auto_11950 ) ) ( not ( = ?auto_11952 ?auto_11951 ) ) ( not ( = ?auto_11949 ?auto_11948 ) ) ( not ( = ?auto_11947 ?auto_11950 ) ) ( not ( = ?auto_11937 ?auto_11940 ) ) ( not ( = ?auto_11937 ?auto_11946 ) ) ( not ( = ?auto_11938 ?auto_11940 ) ) ( not ( = ?auto_11938 ?auto_11946 ) ) ( not ( = ?auto_11940 ?auto_11947 ) ) ( not ( = ?auto_11940 ?auto_11950 ) ) ( not ( = ?auto_11945 ?auto_11952 ) ) ( not ( = ?auto_11945 ?auto_11951 ) ) ( not ( = ?auto_11944 ?auto_11949 ) ) ( not ( = ?auto_11944 ?auto_11948 ) ) ( not ( = ?auto_11946 ?auto_11947 ) ) ( not ( = ?auto_11946 ?auto_11950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11937 ?auto_11938 ?auto_11939 )
      ( MAKE-1CRATE ?auto_11939 ?auto_11940 )
      ( MAKE-3CRATE-VERIFY ?auto_11937 ?auto_11938 ?auto_11939 ?auto_11940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11955 - SURFACE
      ?auto_11956 - SURFACE
    )
    :vars
    (
      ?auto_11957 - HOIST
      ?auto_11958 - PLACE
      ?auto_11960 - PLACE
      ?auto_11961 - HOIST
      ?auto_11962 - SURFACE
      ?auto_11959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11957 ?auto_11958 ) ( SURFACE-AT ?auto_11955 ?auto_11958 ) ( CLEAR ?auto_11955 ) ( IS-CRATE ?auto_11956 ) ( AVAILABLE ?auto_11957 ) ( not ( = ?auto_11960 ?auto_11958 ) ) ( HOIST-AT ?auto_11961 ?auto_11960 ) ( AVAILABLE ?auto_11961 ) ( SURFACE-AT ?auto_11956 ?auto_11960 ) ( ON ?auto_11956 ?auto_11962 ) ( CLEAR ?auto_11956 ) ( TRUCK-AT ?auto_11959 ?auto_11958 ) ( not ( = ?auto_11955 ?auto_11956 ) ) ( not ( = ?auto_11955 ?auto_11962 ) ) ( not ( = ?auto_11956 ?auto_11962 ) ) ( not ( = ?auto_11957 ?auto_11961 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11959 ?auto_11958 ?auto_11960 )
      ( !LIFT ?auto_11961 ?auto_11956 ?auto_11962 ?auto_11960 )
      ( !LOAD ?auto_11961 ?auto_11956 ?auto_11959 ?auto_11960 )
      ( !DRIVE ?auto_11959 ?auto_11960 ?auto_11958 )
      ( !UNLOAD ?auto_11957 ?auto_11956 ?auto_11959 ?auto_11958 )
      ( !DROP ?auto_11957 ?auto_11956 ?auto_11955 ?auto_11958 )
      ( MAKE-1CRATE-VERIFY ?auto_11955 ?auto_11956 ) )
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
      ?auto_11977 - HOIST
      ?auto_11975 - PLACE
      ?auto_11974 - PLACE
      ?auto_11978 - HOIST
      ?auto_11973 - SURFACE
      ?auto_11987 - PLACE
      ?auto_11979 - HOIST
      ?auto_11985 - SURFACE
      ?auto_11981 - PLACE
      ?auto_11982 - HOIST
      ?auto_11984 - SURFACE
      ?auto_11980 - PLACE
      ?auto_11986 - HOIST
      ?auto_11983 - SURFACE
      ?auto_11976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11977 ?auto_11975 ) ( IS-CRATE ?auto_11972 ) ( not ( = ?auto_11974 ?auto_11975 ) ) ( HOIST-AT ?auto_11978 ?auto_11974 ) ( AVAILABLE ?auto_11978 ) ( SURFACE-AT ?auto_11972 ?auto_11974 ) ( ON ?auto_11972 ?auto_11973 ) ( CLEAR ?auto_11972 ) ( not ( = ?auto_11971 ?auto_11972 ) ) ( not ( = ?auto_11971 ?auto_11973 ) ) ( not ( = ?auto_11972 ?auto_11973 ) ) ( not ( = ?auto_11977 ?auto_11978 ) ) ( IS-CRATE ?auto_11971 ) ( not ( = ?auto_11987 ?auto_11975 ) ) ( HOIST-AT ?auto_11979 ?auto_11987 ) ( AVAILABLE ?auto_11979 ) ( SURFACE-AT ?auto_11971 ?auto_11987 ) ( ON ?auto_11971 ?auto_11985 ) ( CLEAR ?auto_11971 ) ( not ( = ?auto_11970 ?auto_11971 ) ) ( not ( = ?auto_11970 ?auto_11985 ) ) ( not ( = ?auto_11971 ?auto_11985 ) ) ( not ( = ?auto_11977 ?auto_11979 ) ) ( IS-CRATE ?auto_11970 ) ( not ( = ?auto_11981 ?auto_11975 ) ) ( HOIST-AT ?auto_11982 ?auto_11981 ) ( AVAILABLE ?auto_11982 ) ( SURFACE-AT ?auto_11970 ?auto_11981 ) ( ON ?auto_11970 ?auto_11984 ) ( CLEAR ?auto_11970 ) ( not ( = ?auto_11969 ?auto_11970 ) ) ( not ( = ?auto_11969 ?auto_11984 ) ) ( not ( = ?auto_11970 ?auto_11984 ) ) ( not ( = ?auto_11977 ?auto_11982 ) ) ( SURFACE-AT ?auto_11968 ?auto_11975 ) ( CLEAR ?auto_11968 ) ( IS-CRATE ?auto_11969 ) ( AVAILABLE ?auto_11977 ) ( not ( = ?auto_11980 ?auto_11975 ) ) ( HOIST-AT ?auto_11986 ?auto_11980 ) ( AVAILABLE ?auto_11986 ) ( SURFACE-AT ?auto_11969 ?auto_11980 ) ( ON ?auto_11969 ?auto_11983 ) ( CLEAR ?auto_11969 ) ( TRUCK-AT ?auto_11976 ?auto_11975 ) ( not ( = ?auto_11968 ?auto_11969 ) ) ( not ( = ?auto_11968 ?auto_11983 ) ) ( not ( = ?auto_11969 ?auto_11983 ) ) ( not ( = ?auto_11977 ?auto_11986 ) ) ( not ( = ?auto_11968 ?auto_11970 ) ) ( not ( = ?auto_11968 ?auto_11984 ) ) ( not ( = ?auto_11970 ?auto_11983 ) ) ( not ( = ?auto_11981 ?auto_11980 ) ) ( not ( = ?auto_11982 ?auto_11986 ) ) ( not ( = ?auto_11984 ?auto_11983 ) ) ( not ( = ?auto_11968 ?auto_11971 ) ) ( not ( = ?auto_11968 ?auto_11985 ) ) ( not ( = ?auto_11969 ?auto_11971 ) ) ( not ( = ?auto_11969 ?auto_11985 ) ) ( not ( = ?auto_11971 ?auto_11984 ) ) ( not ( = ?auto_11971 ?auto_11983 ) ) ( not ( = ?auto_11987 ?auto_11981 ) ) ( not ( = ?auto_11987 ?auto_11980 ) ) ( not ( = ?auto_11979 ?auto_11982 ) ) ( not ( = ?auto_11979 ?auto_11986 ) ) ( not ( = ?auto_11985 ?auto_11984 ) ) ( not ( = ?auto_11985 ?auto_11983 ) ) ( not ( = ?auto_11968 ?auto_11972 ) ) ( not ( = ?auto_11968 ?auto_11973 ) ) ( not ( = ?auto_11969 ?auto_11972 ) ) ( not ( = ?auto_11969 ?auto_11973 ) ) ( not ( = ?auto_11970 ?auto_11972 ) ) ( not ( = ?auto_11970 ?auto_11973 ) ) ( not ( = ?auto_11972 ?auto_11985 ) ) ( not ( = ?auto_11972 ?auto_11984 ) ) ( not ( = ?auto_11972 ?auto_11983 ) ) ( not ( = ?auto_11974 ?auto_11987 ) ) ( not ( = ?auto_11974 ?auto_11981 ) ) ( not ( = ?auto_11974 ?auto_11980 ) ) ( not ( = ?auto_11978 ?auto_11979 ) ) ( not ( = ?auto_11978 ?auto_11982 ) ) ( not ( = ?auto_11978 ?auto_11986 ) ) ( not ( = ?auto_11973 ?auto_11985 ) ) ( not ( = ?auto_11973 ?auto_11984 ) ) ( not ( = ?auto_11973 ?auto_11983 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_11968 ?auto_11969 ?auto_11970 ?auto_11971 )
      ( MAKE-1CRATE ?auto_11971 ?auto_11972 )
      ( MAKE-4CRATE-VERIFY ?auto_11968 ?auto_11969 ?auto_11970 ?auto_11971 ?auto_11972 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11990 - SURFACE
      ?auto_11991 - SURFACE
    )
    :vars
    (
      ?auto_11992 - HOIST
      ?auto_11993 - PLACE
      ?auto_11995 - PLACE
      ?auto_11996 - HOIST
      ?auto_11997 - SURFACE
      ?auto_11994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11992 ?auto_11993 ) ( SURFACE-AT ?auto_11990 ?auto_11993 ) ( CLEAR ?auto_11990 ) ( IS-CRATE ?auto_11991 ) ( AVAILABLE ?auto_11992 ) ( not ( = ?auto_11995 ?auto_11993 ) ) ( HOIST-AT ?auto_11996 ?auto_11995 ) ( AVAILABLE ?auto_11996 ) ( SURFACE-AT ?auto_11991 ?auto_11995 ) ( ON ?auto_11991 ?auto_11997 ) ( CLEAR ?auto_11991 ) ( TRUCK-AT ?auto_11994 ?auto_11993 ) ( not ( = ?auto_11990 ?auto_11991 ) ) ( not ( = ?auto_11990 ?auto_11997 ) ) ( not ( = ?auto_11991 ?auto_11997 ) ) ( not ( = ?auto_11992 ?auto_11996 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11994 ?auto_11993 ?auto_11995 )
      ( !LIFT ?auto_11996 ?auto_11991 ?auto_11997 ?auto_11995 )
      ( !LOAD ?auto_11996 ?auto_11991 ?auto_11994 ?auto_11995 )
      ( !DRIVE ?auto_11994 ?auto_11995 ?auto_11993 )
      ( !UNLOAD ?auto_11992 ?auto_11991 ?auto_11994 ?auto_11993 )
      ( !DROP ?auto_11992 ?auto_11991 ?auto_11990 ?auto_11993 )
      ( MAKE-1CRATE-VERIFY ?auto_11990 ?auto_11991 ) )
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
      ?auto_12012 - HOIST
      ?auto_12011 - PLACE
      ?auto_12015 - PLACE
      ?auto_12010 - HOIST
      ?auto_12014 - SURFACE
      ?auto_12018 - PLACE
      ?auto_12021 - HOIST
      ?auto_12017 - SURFACE
      ?auto_12025 - PLACE
      ?auto_12024 - HOIST
      ?auto_12020 - SURFACE
      ?auto_12019 - SURFACE
      ?auto_12016 - PLACE
      ?auto_12022 - HOIST
      ?auto_12023 - SURFACE
      ?auto_12013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12012 ?auto_12011 ) ( IS-CRATE ?auto_12009 ) ( not ( = ?auto_12015 ?auto_12011 ) ) ( HOIST-AT ?auto_12010 ?auto_12015 ) ( SURFACE-AT ?auto_12009 ?auto_12015 ) ( ON ?auto_12009 ?auto_12014 ) ( CLEAR ?auto_12009 ) ( not ( = ?auto_12008 ?auto_12009 ) ) ( not ( = ?auto_12008 ?auto_12014 ) ) ( not ( = ?auto_12009 ?auto_12014 ) ) ( not ( = ?auto_12012 ?auto_12010 ) ) ( IS-CRATE ?auto_12008 ) ( not ( = ?auto_12018 ?auto_12011 ) ) ( HOIST-AT ?auto_12021 ?auto_12018 ) ( AVAILABLE ?auto_12021 ) ( SURFACE-AT ?auto_12008 ?auto_12018 ) ( ON ?auto_12008 ?auto_12017 ) ( CLEAR ?auto_12008 ) ( not ( = ?auto_12007 ?auto_12008 ) ) ( not ( = ?auto_12007 ?auto_12017 ) ) ( not ( = ?auto_12008 ?auto_12017 ) ) ( not ( = ?auto_12012 ?auto_12021 ) ) ( IS-CRATE ?auto_12007 ) ( not ( = ?auto_12025 ?auto_12011 ) ) ( HOIST-AT ?auto_12024 ?auto_12025 ) ( AVAILABLE ?auto_12024 ) ( SURFACE-AT ?auto_12007 ?auto_12025 ) ( ON ?auto_12007 ?auto_12020 ) ( CLEAR ?auto_12007 ) ( not ( = ?auto_12006 ?auto_12007 ) ) ( not ( = ?auto_12006 ?auto_12020 ) ) ( not ( = ?auto_12007 ?auto_12020 ) ) ( not ( = ?auto_12012 ?auto_12024 ) ) ( IS-CRATE ?auto_12006 ) ( AVAILABLE ?auto_12010 ) ( SURFACE-AT ?auto_12006 ?auto_12015 ) ( ON ?auto_12006 ?auto_12019 ) ( CLEAR ?auto_12006 ) ( not ( = ?auto_12005 ?auto_12006 ) ) ( not ( = ?auto_12005 ?auto_12019 ) ) ( not ( = ?auto_12006 ?auto_12019 ) ) ( SURFACE-AT ?auto_12004 ?auto_12011 ) ( CLEAR ?auto_12004 ) ( IS-CRATE ?auto_12005 ) ( AVAILABLE ?auto_12012 ) ( not ( = ?auto_12016 ?auto_12011 ) ) ( HOIST-AT ?auto_12022 ?auto_12016 ) ( AVAILABLE ?auto_12022 ) ( SURFACE-AT ?auto_12005 ?auto_12016 ) ( ON ?auto_12005 ?auto_12023 ) ( CLEAR ?auto_12005 ) ( TRUCK-AT ?auto_12013 ?auto_12011 ) ( not ( = ?auto_12004 ?auto_12005 ) ) ( not ( = ?auto_12004 ?auto_12023 ) ) ( not ( = ?auto_12005 ?auto_12023 ) ) ( not ( = ?auto_12012 ?auto_12022 ) ) ( not ( = ?auto_12004 ?auto_12006 ) ) ( not ( = ?auto_12004 ?auto_12019 ) ) ( not ( = ?auto_12006 ?auto_12023 ) ) ( not ( = ?auto_12015 ?auto_12016 ) ) ( not ( = ?auto_12010 ?auto_12022 ) ) ( not ( = ?auto_12019 ?auto_12023 ) ) ( not ( = ?auto_12004 ?auto_12007 ) ) ( not ( = ?auto_12004 ?auto_12020 ) ) ( not ( = ?auto_12005 ?auto_12007 ) ) ( not ( = ?auto_12005 ?auto_12020 ) ) ( not ( = ?auto_12007 ?auto_12019 ) ) ( not ( = ?auto_12007 ?auto_12023 ) ) ( not ( = ?auto_12025 ?auto_12015 ) ) ( not ( = ?auto_12025 ?auto_12016 ) ) ( not ( = ?auto_12024 ?auto_12010 ) ) ( not ( = ?auto_12024 ?auto_12022 ) ) ( not ( = ?auto_12020 ?auto_12019 ) ) ( not ( = ?auto_12020 ?auto_12023 ) ) ( not ( = ?auto_12004 ?auto_12008 ) ) ( not ( = ?auto_12004 ?auto_12017 ) ) ( not ( = ?auto_12005 ?auto_12008 ) ) ( not ( = ?auto_12005 ?auto_12017 ) ) ( not ( = ?auto_12006 ?auto_12008 ) ) ( not ( = ?auto_12006 ?auto_12017 ) ) ( not ( = ?auto_12008 ?auto_12020 ) ) ( not ( = ?auto_12008 ?auto_12019 ) ) ( not ( = ?auto_12008 ?auto_12023 ) ) ( not ( = ?auto_12018 ?auto_12025 ) ) ( not ( = ?auto_12018 ?auto_12015 ) ) ( not ( = ?auto_12018 ?auto_12016 ) ) ( not ( = ?auto_12021 ?auto_12024 ) ) ( not ( = ?auto_12021 ?auto_12010 ) ) ( not ( = ?auto_12021 ?auto_12022 ) ) ( not ( = ?auto_12017 ?auto_12020 ) ) ( not ( = ?auto_12017 ?auto_12019 ) ) ( not ( = ?auto_12017 ?auto_12023 ) ) ( not ( = ?auto_12004 ?auto_12009 ) ) ( not ( = ?auto_12004 ?auto_12014 ) ) ( not ( = ?auto_12005 ?auto_12009 ) ) ( not ( = ?auto_12005 ?auto_12014 ) ) ( not ( = ?auto_12006 ?auto_12009 ) ) ( not ( = ?auto_12006 ?auto_12014 ) ) ( not ( = ?auto_12007 ?auto_12009 ) ) ( not ( = ?auto_12007 ?auto_12014 ) ) ( not ( = ?auto_12009 ?auto_12017 ) ) ( not ( = ?auto_12009 ?auto_12020 ) ) ( not ( = ?auto_12009 ?auto_12019 ) ) ( not ( = ?auto_12009 ?auto_12023 ) ) ( not ( = ?auto_12014 ?auto_12017 ) ) ( not ( = ?auto_12014 ?auto_12020 ) ) ( not ( = ?auto_12014 ?auto_12019 ) ) ( not ( = ?auto_12014 ?auto_12023 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_12004 ?auto_12005 ?auto_12006 ?auto_12007 ?auto_12008 )
      ( MAKE-1CRATE ?auto_12008 ?auto_12009 )
      ( MAKE-5CRATE-VERIFY ?auto_12004 ?auto_12005 ?auto_12006 ?auto_12007 ?auto_12008 ?auto_12009 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12028 - SURFACE
      ?auto_12029 - SURFACE
    )
    :vars
    (
      ?auto_12030 - HOIST
      ?auto_12031 - PLACE
      ?auto_12033 - PLACE
      ?auto_12034 - HOIST
      ?auto_12035 - SURFACE
      ?auto_12032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12030 ?auto_12031 ) ( SURFACE-AT ?auto_12028 ?auto_12031 ) ( CLEAR ?auto_12028 ) ( IS-CRATE ?auto_12029 ) ( AVAILABLE ?auto_12030 ) ( not ( = ?auto_12033 ?auto_12031 ) ) ( HOIST-AT ?auto_12034 ?auto_12033 ) ( AVAILABLE ?auto_12034 ) ( SURFACE-AT ?auto_12029 ?auto_12033 ) ( ON ?auto_12029 ?auto_12035 ) ( CLEAR ?auto_12029 ) ( TRUCK-AT ?auto_12032 ?auto_12031 ) ( not ( = ?auto_12028 ?auto_12029 ) ) ( not ( = ?auto_12028 ?auto_12035 ) ) ( not ( = ?auto_12029 ?auto_12035 ) ) ( not ( = ?auto_12030 ?auto_12034 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12032 ?auto_12031 ?auto_12033 )
      ( !LIFT ?auto_12034 ?auto_12029 ?auto_12035 ?auto_12033 )
      ( !LOAD ?auto_12034 ?auto_12029 ?auto_12032 ?auto_12033 )
      ( !DRIVE ?auto_12032 ?auto_12033 ?auto_12031 )
      ( !UNLOAD ?auto_12030 ?auto_12029 ?auto_12032 ?auto_12031 )
      ( !DROP ?auto_12030 ?auto_12029 ?auto_12028 ?auto_12031 )
      ( MAKE-1CRATE-VERIFY ?auto_12028 ?auto_12029 ) )
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
      ?auto_12051 - HOIST
      ?auto_12052 - PLACE
      ?auto_12050 - PLACE
      ?auto_12054 - HOIST
      ?auto_12055 - SURFACE
      ?auto_12056 - PLACE
      ?auto_12058 - HOIST
      ?auto_12059 - SURFACE
      ?auto_12067 - PLACE
      ?auto_12063 - HOIST
      ?auto_12060 - SURFACE
      ?auto_12061 - PLACE
      ?auto_12062 - HOIST
      ?auto_12066 - SURFACE
      ?auto_12068 - SURFACE
      ?auto_12057 - PLACE
      ?auto_12064 - HOIST
      ?auto_12065 - SURFACE
      ?auto_12053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12051 ?auto_12052 ) ( IS-CRATE ?auto_12049 ) ( not ( = ?auto_12050 ?auto_12052 ) ) ( HOIST-AT ?auto_12054 ?auto_12050 ) ( AVAILABLE ?auto_12054 ) ( SURFACE-AT ?auto_12049 ?auto_12050 ) ( ON ?auto_12049 ?auto_12055 ) ( CLEAR ?auto_12049 ) ( not ( = ?auto_12048 ?auto_12049 ) ) ( not ( = ?auto_12048 ?auto_12055 ) ) ( not ( = ?auto_12049 ?auto_12055 ) ) ( not ( = ?auto_12051 ?auto_12054 ) ) ( IS-CRATE ?auto_12048 ) ( not ( = ?auto_12056 ?auto_12052 ) ) ( HOIST-AT ?auto_12058 ?auto_12056 ) ( SURFACE-AT ?auto_12048 ?auto_12056 ) ( ON ?auto_12048 ?auto_12059 ) ( CLEAR ?auto_12048 ) ( not ( = ?auto_12047 ?auto_12048 ) ) ( not ( = ?auto_12047 ?auto_12059 ) ) ( not ( = ?auto_12048 ?auto_12059 ) ) ( not ( = ?auto_12051 ?auto_12058 ) ) ( IS-CRATE ?auto_12047 ) ( not ( = ?auto_12067 ?auto_12052 ) ) ( HOIST-AT ?auto_12063 ?auto_12067 ) ( AVAILABLE ?auto_12063 ) ( SURFACE-AT ?auto_12047 ?auto_12067 ) ( ON ?auto_12047 ?auto_12060 ) ( CLEAR ?auto_12047 ) ( not ( = ?auto_12046 ?auto_12047 ) ) ( not ( = ?auto_12046 ?auto_12060 ) ) ( not ( = ?auto_12047 ?auto_12060 ) ) ( not ( = ?auto_12051 ?auto_12063 ) ) ( IS-CRATE ?auto_12046 ) ( not ( = ?auto_12061 ?auto_12052 ) ) ( HOIST-AT ?auto_12062 ?auto_12061 ) ( AVAILABLE ?auto_12062 ) ( SURFACE-AT ?auto_12046 ?auto_12061 ) ( ON ?auto_12046 ?auto_12066 ) ( CLEAR ?auto_12046 ) ( not ( = ?auto_12045 ?auto_12046 ) ) ( not ( = ?auto_12045 ?auto_12066 ) ) ( not ( = ?auto_12046 ?auto_12066 ) ) ( not ( = ?auto_12051 ?auto_12062 ) ) ( IS-CRATE ?auto_12045 ) ( AVAILABLE ?auto_12058 ) ( SURFACE-AT ?auto_12045 ?auto_12056 ) ( ON ?auto_12045 ?auto_12068 ) ( CLEAR ?auto_12045 ) ( not ( = ?auto_12044 ?auto_12045 ) ) ( not ( = ?auto_12044 ?auto_12068 ) ) ( not ( = ?auto_12045 ?auto_12068 ) ) ( SURFACE-AT ?auto_12043 ?auto_12052 ) ( CLEAR ?auto_12043 ) ( IS-CRATE ?auto_12044 ) ( AVAILABLE ?auto_12051 ) ( not ( = ?auto_12057 ?auto_12052 ) ) ( HOIST-AT ?auto_12064 ?auto_12057 ) ( AVAILABLE ?auto_12064 ) ( SURFACE-AT ?auto_12044 ?auto_12057 ) ( ON ?auto_12044 ?auto_12065 ) ( CLEAR ?auto_12044 ) ( TRUCK-AT ?auto_12053 ?auto_12052 ) ( not ( = ?auto_12043 ?auto_12044 ) ) ( not ( = ?auto_12043 ?auto_12065 ) ) ( not ( = ?auto_12044 ?auto_12065 ) ) ( not ( = ?auto_12051 ?auto_12064 ) ) ( not ( = ?auto_12043 ?auto_12045 ) ) ( not ( = ?auto_12043 ?auto_12068 ) ) ( not ( = ?auto_12045 ?auto_12065 ) ) ( not ( = ?auto_12056 ?auto_12057 ) ) ( not ( = ?auto_12058 ?auto_12064 ) ) ( not ( = ?auto_12068 ?auto_12065 ) ) ( not ( = ?auto_12043 ?auto_12046 ) ) ( not ( = ?auto_12043 ?auto_12066 ) ) ( not ( = ?auto_12044 ?auto_12046 ) ) ( not ( = ?auto_12044 ?auto_12066 ) ) ( not ( = ?auto_12046 ?auto_12068 ) ) ( not ( = ?auto_12046 ?auto_12065 ) ) ( not ( = ?auto_12061 ?auto_12056 ) ) ( not ( = ?auto_12061 ?auto_12057 ) ) ( not ( = ?auto_12062 ?auto_12058 ) ) ( not ( = ?auto_12062 ?auto_12064 ) ) ( not ( = ?auto_12066 ?auto_12068 ) ) ( not ( = ?auto_12066 ?auto_12065 ) ) ( not ( = ?auto_12043 ?auto_12047 ) ) ( not ( = ?auto_12043 ?auto_12060 ) ) ( not ( = ?auto_12044 ?auto_12047 ) ) ( not ( = ?auto_12044 ?auto_12060 ) ) ( not ( = ?auto_12045 ?auto_12047 ) ) ( not ( = ?auto_12045 ?auto_12060 ) ) ( not ( = ?auto_12047 ?auto_12066 ) ) ( not ( = ?auto_12047 ?auto_12068 ) ) ( not ( = ?auto_12047 ?auto_12065 ) ) ( not ( = ?auto_12067 ?auto_12061 ) ) ( not ( = ?auto_12067 ?auto_12056 ) ) ( not ( = ?auto_12067 ?auto_12057 ) ) ( not ( = ?auto_12063 ?auto_12062 ) ) ( not ( = ?auto_12063 ?auto_12058 ) ) ( not ( = ?auto_12063 ?auto_12064 ) ) ( not ( = ?auto_12060 ?auto_12066 ) ) ( not ( = ?auto_12060 ?auto_12068 ) ) ( not ( = ?auto_12060 ?auto_12065 ) ) ( not ( = ?auto_12043 ?auto_12048 ) ) ( not ( = ?auto_12043 ?auto_12059 ) ) ( not ( = ?auto_12044 ?auto_12048 ) ) ( not ( = ?auto_12044 ?auto_12059 ) ) ( not ( = ?auto_12045 ?auto_12048 ) ) ( not ( = ?auto_12045 ?auto_12059 ) ) ( not ( = ?auto_12046 ?auto_12048 ) ) ( not ( = ?auto_12046 ?auto_12059 ) ) ( not ( = ?auto_12048 ?auto_12060 ) ) ( not ( = ?auto_12048 ?auto_12066 ) ) ( not ( = ?auto_12048 ?auto_12068 ) ) ( not ( = ?auto_12048 ?auto_12065 ) ) ( not ( = ?auto_12059 ?auto_12060 ) ) ( not ( = ?auto_12059 ?auto_12066 ) ) ( not ( = ?auto_12059 ?auto_12068 ) ) ( not ( = ?auto_12059 ?auto_12065 ) ) ( not ( = ?auto_12043 ?auto_12049 ) ) ( not ( = ?auto_12043 ?auto_12055 ) ) ( not ( = ?auto_12044 ?auto_12049 ) ) ( not ( = ?auto_12044 ?auto_12055 ) ) ( not ( = ?auto_12045 ?auto_12049 ) ) ( not ( = ?auto_12045 ?auto_12055 ) ) ( not ( = ?auto_12046 ?auto_12049 ) ) ( not ( = ?auto_12046 ?auto_12055 ) ) ( not ( = ?auto_12047 ?auto_12049 ) ) ( not ( = ?auto_12047 ?auto_12055 ) ) ( not ( = ?auto_12049 ?auto_12059 ) ) ( not ( = ?auto_12049 ?auto_12060 ) ) ( not ( = ?auto_12049 ?auto_12066 ) ) ( not ( = ?auto_12049 ?auto_12068 ) ) ( not ( = ?auto_12049 ?auto_12065 ) ) ( not ( = ?auto_12050 ?auto_12056 ) ) ( not ( = ?auto_12050 ?auto_12067 ) ) ( not ( = ?auto_12050 ?auto_12061 ) ) ( not ( = ?auto_12050 ?auto_12057 ) ) ( not ( = ?auto_12054 ?auto_12058 ) ) ( not ( = ?auto_12054 ?auto_12063 ) ) ( not ( = ?auto_12054 ?auto_12062 ) ) ( not ( = ?auto_12054 ?auto_12064 ) ) ( not ( = ?auto_12055 ?auto_12059 ) ) ( not ( = ?auto_12055 ?auto_12060 ) ) ( not ( = ?auto_12055 ?auto_12066 ) ) ( not ( = ?auto_12055 ?auto_12068 ) ) ( not ( = ?auto_12055 ?auto_12065 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_12043 ?auto_12044 ?auto_12045 ?auto_12046 ?auto_12047 ?auto_12048 )
      ( MAKE-1CRATE ?auto_12048 ?auto_12049 )
      ( MAKE-6CRATE-VERIFY ?auto_12043 ?auto_12044 ?auto_12045 ?auto_12046 ?auto_12047 ?auto_12048 ?auto_12049 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12071 - SURFACE
      ?auto_12072 - SURFACE
    )
    :vars
    (
      ?auto_12073 - HOIST
      ?auto_12074 - PLACE
      ?auto_12076 - PLACE
      ?auto_12077 - HOIST
      ?auto_12078 - SURFACE
      ?auto_12075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12073 ?auto_12074 ) ( SURFACE-AT ?auto_12071 ?auto_12074 ) ( CLEAR ?auto_12071 ) ( IS-CRATE ?auto_12072 ) ( AVAILABLE ?auto_12073 ) ( not ( = ?auto_12076 ?auto_12074 ) ) ( HOIST-AT ?auto_12077 ?auto_12076 ) ( AVAILABLE ?auto_12077 ) ( SURFACE-AT ?auto_12072 ?auto_12076 ) ( ON ?auto_12072 ?auto_12078 ) ( CLEAR ?auto_12072 ) ( TRUCK-AT ?auto_12075 ?auto_12074 ) ( not ( = ?auto_12071 ?auto_12072 ) ) ( not ( = ?auto_12071 ?auto_12078 ) ) ( not ( = ?auto_12072 ?auto_12078 ) ) ( not ( = ?auto_12073 ?auto_12077 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12075 ?auto_12074 ?auto_12076 )
      ( !LIFT ?auto_12077 ?auto_12072 ?auto_12078 ?auto_12076 )
      ( !LOAD ?auto_12077 ?auto_12072 ?auto_12075 ?auto_12076 )
      ( !DRIVE ?auto_12075 ?auto_12076 ?auto_12074 )
      ( !UNLOAD ?auto_12073 ?auto_12072 ?auto_12075 ?auto_12074 )
      ( !DROP ?auto_12073 ?auto_12072 ?auto_12071 ?auto_12074 )
      ( MAKE-1CRATE-VERIFY ?auto_12071 ?auto_12072 ) )
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
      ?auto_12095 - HOIST
      ?auto_12100 - PLACE
      ?auto_12097 - PLACE
      ?auto_12099 - HOIST
      ?auto_12096 - SURFACE
      ?auto_12104 - PLACE
      ?auto_12109 - HOIST
      ?auto_12108 - SURFACE
      ?auto_12107 - PLACE
      ?auto_12106 - HOIST
      ?auto_12105 - SURFACE
      ?auto_12112 - PLACE
      ?auto_12111 - HOIST
      ?auto_12103 - SURFACE
      ?auto_12102 - PLACE
      ?auto_12101 - HOIST
      ?auto_12114 - SURFACE
      ?auto_12110 - SURFACE
      ?auto_12113 - SURFACE
      ?auto_12098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12095 ?auto_12100 ) ( IS-CRATE ?auto_12094 ) ( not ( = ?auto_12097 ?auto_12100 ) ) ( HOIST-AT ?auto_12099 ?auto_12097 ) ( SURFACE-AT ?auto_12094 ?auto_12097 ) ( ON ?auto_12094 ?auto_12096 ) ( CLEAR ?auto_12094 ) ( not ( = ?auto_12093 ?auto_12094 ) ) ( not ( = ?auto_12093 ?auto_12096 ) ) ( not ( = ?auto_12094 ?auto_12096 ) ) ( not ( = ?auto_12095 ?auto_12099 ) ) ( IS-CRATE ?auto_12093 ) ( not ( = ?auto_12104 ?auto_12100 ) ) ( HOIST-AT ?auto_12109 ?auto_12104 ) ( AVAILABLE ?auto_12109 ) ( SURFACE-AT ?auto_12093 ?auto_12104 ) ( ON ?auto_12093 ?auto_12108 ) ( CLEAR ?auto_12093 ) ( not ( = ?auto_12092 ?auto_12093 ) ) ( not ( = ?auto_12092 ?auto_12108 ) ) ( not ( = ?auto_12093 ?auto_12108 ) ) ( not ( = ?auto_12095 ?auto_12109 ) ) ( IS-CRATE ?auto_12092 ) ( not ( = ?auto_12107 ?auto_12100 ) ) ( HOIST-AT ?auto_12106 ?auto_12107 ) ( SURFACE-AT ?auto_12092 ?auto_12107 ) ( ON ?auto_12092 ?auto_12105 ) ( CLEAR ?auto_12092 ) ( not ( = ?auto_12091 ?auto_12092 ) ) ( not ( = ?auto_12091 ?auto_12105 ) ) ( not ( = ?auto_12092 ?auto_12105 ) ) ( not ( = ?auto_12095 ?auto_12106 ) ) ( IS-CRATE ?auto_12091 ) ( not ( = ?auto_12112 ?auto_12100 ) ) ( HOIST-AT ?auto_12111 ?auto_12112 ) ( AVAILABLE ?auto_12111 ) ( SURFACE-AT ?auto_12091 ?auto_12112 ) ( ON ?auto_12091 ?auto_12103 ) ( CLEAR ?auto_12091 ) ( not ( = ?auto_12090 ?auto_12091 ) ) ( not ( = ?auto_12090 ?auto_12103 ) ) ( not ( = ?auto_12091 ?auto_12103 ) ) ( not ( = ?auto_12095 ?auto_12111 ) ) ( IS-CRATE ?auto_12090 ) ( not ( = ?auto_12102 ?auto_12100 ) ) ( HOIST-AT ?auto_12101 ?auto_12102 ) ( AVAILABLE ?auto_12101 ) ( SURFACE-AT ?auto_12090 ?auto_12102 ) ( ON ?auto_12090 ?auto_12114 ) ( CLEAR ?auto_12090 ) ( not ( = ?auto_12089 ?auto_12090 ) ) ( not ( = ?auto_12089 ?auto_12114 ) ) ( not ( = ?auto_12090 ?auto_12114 ) ) ( not ( = ?auto_12095 ?auto_12101 ) ) ( IS-CRATE ?auto_12089 ) ( AVAILABLE ?auto_12106 ) ( SURFACE-AT ?auto_12089 ?auto_12107 ) ( ON ?auto_12089 ?auto_12110 ) ( CLEAR ?auto_12089 ) ( not ( = ?auto_12088 ?auto_12089 ) ) ( not ( = ?auto_12088 ?auto_12110 ) ) ( not ( = ?auto_12089 ?auto_12110 ) ) ( SURFACE-AT ?auto_12087 ?auto_12100 ) ( CLEAR ?auto_12087 ) ( IS-CRATE ?auto_12088 ) ( AVAILABLE ?auto_12095 ) ( AVAILABLE ?auto_12099 ) ( SURFACE-AT ?auto_12088 ?auto_12097 ) ( ON ?auto_12088 ?auto_12113 ) ( CLEAR ?auto_12088 ) ( TRUCK-AT ?auto_12098 ?auto_12100 ) ( not ( = ?auto_12087 ?auto_12088 ) ) ( not ( = ?auto_12087 ?auto_12113 ) ) ( not ( = ?auto_12088 ?auto_12113 ) ) ( not ( = ?auto_12087 ?auto_12089 ) ) ( not ( = ?auto_12087 ?auto_12110 ) ) ( not ( = ?auto_12089 ?auto_12113 ) ) ( not ( = ?auto_12107 ?auto_12097 ) ) ( not ( = ?auto_12106 ?auto_12099 ) ) ( not ( = ?auto_12110 ?auto_12113 ) ) ( not ( = ?auto_12087 ?auto_12090 ) ) ( not ( = ?auto_12087 ?auto_12114 ) ) ( not ( = ?auto_12088 ?auto_12090 ) ) ( not ( = ?auto_12088 ?auto_12114 ) ) ( not ( = ?auto_12090 ?auto_12110 ) ) ( not ( = ?auto_12090 ?auto_12113 ) ) ( not ( = ?auto_12102 ?auto_12107 ) ) ( not ( = ?auto_12102 ?auto_12097 ) ) ( not ( = ?auto_12101 ?auto_12106 ) ) ( not ( = ?auto_12101 ?auto_12099 ) ) ( not ( = ?auto_12114 ?auto_12110 ) ) ( not ( = ?auto_12114 ?auto_12113 ) ) ( not ( = ?auto_12087 ?auto_12091 ) ) ( not ( = ?auto_12087 ?auto_12103 ) ) ( not ( = ?auto_12088 ?auto_12091 ) ) ( not ( = ?auto_12088 ?auto_12103 ) ) ( not ( = ?auto_12089 ?auto_12091 ) ) ( not ( = ?auto_12089 ?auto_12103 ) ) ( not ( = ?auto_12091 ?auto_12114 ) ) ( not ( = ?auto_12091 ?auto_12110 ) ) ( not ( = ?auto_12091 ?auto_12113 ) ) ( not ( = ?auto_12112 ?auto_12102 ) ) ( not ( = ?auto_12112 ?auto_12107 ) ) ( not ( = ?auto_12112 ?auto_12097 ) ) ( not ( = ?auto_12111 ?auto_12101 ) ) ( not ( = ?auto_12111 ?auto_12106 ) ) ( not ( = ?auto_12111 ?auto_12099 ) ) ( not ( = ?auto_12103 ?auto_12114 ) ) ( not ( = ?auto_12103 ?auto_12110 ) ) ( not ( = ?auto_12103 ?auto_12113 ) ) ( not ( = ?auto_12087 ?auto_12092 ) ) ( not ( = ?auto_12087 ?auto_12105 ) ) ( not ( = ?auto_12088 ?auto_12092 ) ) ( not ( = ?auto_12088 ?auto_12105 ) ) ( not ( = ?auto_12089 ?auto_12092 ) ) ( not ( = ?auto_12089 ?auto_12105 ) ) ( not ( = ?auto_12090 ?auto_12092 ) ) ( not ( = ?auto_12090 ?auto_12105 ) ) ( not ( = ?auto_12092 ?auto_12103 ) ) ( not ( = ?auto_12092 ?auto_12114 ) ) ( not ( = ?auto_12092 ?auto_12110 ) ) ( not ( = ?auto_12092 ?auto_12113 ) ) ( not ( = ?auto_12105 ?auto_12103 ) ) ( not ( = ?auto_12105 ?auto_12114 ) ) ( not ( = ?auto_12105 ?auto_12110 ) ) ( not ( = ?auto_12105 ?auto_12113 ) ) ( not ( = ?auto_12087 ?auto_12093 ) ) ( not ( = ?auto_12087 ?auto_12108 ) ) ( not ( = ?auto_12088 ?auto_12093 ) ) ( not ( = ?auto_12088 ?auto_12108 ) ) ( not ( = ?auto_12089 ?auto_12093 ) ) ( not ( = ?auto_12089 ?auto_12108 ) ) ( not ( = ?auto_12090 ?auto_12093 ) ) ( not ( = ?auto_12090 ?auto_12108 ) ) ( not ( = ?auto_12091 ?auto_12093 ) ) ( not ( = ?auto_12091 ?auto_12108 ) ) ( not ( = ?auto_12093 ?auto_12105 ) ) ( not ( = ?auto_12093 ?auto_12103 ) ) ( not ( = ?auto_12093 ?auto_12114 ) ) ( not ( = ?auto_12093 ?auto_12110 ) ) ( not ( = ?auto_12093 ?auto_12113 ) ) ( not ( = ?auto_12104 ?auto_12107 ) ) ( not ( = ?auto_12104 ?auto_12112 ) ) ( not ( = ?auto_12104 ?auto_12102 ) ) ( not ( = ?auto_12104 ?auto_12097 ) ) ( not ( = ?auto_12109 ?auto_12106 ) ) ( not ( = ?auto_12109 ?auto_12111 ) ) ( not ( = ?auto_12109 ?auto_12101 ) ) ( not ( = ?auto_12109 ?auto_12099 ) ) ( not ( = ?auto_12108 ?auto_12105 ) ) ( not ( = ?auto_12108 ?auto_12103 ) ) ( not ( = ?auto_12108 ?auto_12114 ) ) ( not ( = ?auto_12108 ?auto_12110 ) ) ( not ( = ?auto_12108 ?auto_12113 ) ) ( not ( = ?auto_12087 ?auto_12094 ) ) ( not ( = ?auto_12087 ?auto_12096 ) ) ( not ( = ?auto_12088 ?auto_12094 ) ) ( not ( = ?auto_12088 ?auto_12096 ) ) ( not ( = ?auto_12089 ?auto_12094 ) ) ( not ( = ?auto_12089 ?auto_12096 ) ) ( not ( = ?auto_12090 ?auto_12094 ) ) ( not ( = ?auto_12090 ?auto_12096 ) ) ( not ( = ?auto_12091 ?auto_12094 ) ) ( not ( = ?auto_12091 ?auto_12096 ) ) ( not ( = ?auto_12092 ?auto_12094 ) ) ( not ( = ?auto_12092 ?auto_12096 ) ) ( not ( = ?auto_12094 ?auto_12108 ) ) ( not ( = ?auto_12094 ?auto_12105 ) ) ( not ( = ?auto_12094 ?auto_12103 ) ) ( not ( = ?auto_12094 ?auto_12114 ) ) ( not ( = ?auto_12094 ?auto_12110 ) ) ( not ( = ?auto_12094 ?auto_12113 ) ) ( not ( = ?auto_12096 ?auto_12108 ) ) ( not ( = ?auto_12096 ?auto_12105 ) ) ( not ( = ?auto_12096 ?auto_12103 ) ) ( not ( = ?auto_12096 ?auto_12114 ) ) ( not ( = ?auto_12096 ?auto_12110 ) ) ( not ( = ?auto_12096 ?auto_12113 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_12087 ?auto_12088 ?auto_12089 ?auto_12090 ?auto_12091 ?auto_12092 ?auto_12093 )
      ( MAKE-1CRATE ?auto_12093 ?auto_12094 )
      ( MAKE-7CRATE-VERIFY ?auto_12087 ?auto_12088 ?auto_12089 ?auto_12090 ?auto_12091 ?auto_12092 ?auto_12093 ?auto_12094 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12117 - SURFACE
      ?auto_12118 - SURFACE
    )
    :vars
    (
      ?auto_12119 - HOIST
      ?auto_12120 - PLACE
      ?auto_12122 - PLACE
      ?auto_12123 - HOIST
      ?auto_12124 - SURFACE
      ?auto_12121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12119 ?auto_12120 ) ( SURFACE-AT ?auto_12117 ?auto_12120 ) ( CLEAR ?auto_12117 ) ( IS-CRATE ?auto_12118 ) ( AVAILABLE ?auto_12119 ) ( not ( = ?auto_12122 ?auto_12120 ) ) ( HOIST-AT ?auto_12123 ?auto_12122 ) ( AVAILABLE ?auto_12123 ) ( SURFACE-AT ?auto_12118 ?auto_12122 ) ( ON ?auto_12118 ?auto_12124 ) ( CLEAR ?auto_12118 ) ( TRUCK-AT ?auto_12121 ?auto_12120 ) ( not ( = ?auto_12117 ?auto_12118 ) ) ( not ( = ?auto_12117 ?auto_12124 ) ) ( not ( = ?auto_12118 ?auto_12124 ) ) ( not ( = ?auto_12119 ?auto_12123 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12121 ?auto_12120 ?auto_12122 )
      ( !LIFT ?auto_12123 ?auto_12118 ?auto_12124 ?auto_12122 )
      ( !LOAD ?auto_12123 ?auto_12118 ?auto_12121 ?auto_12122 )
      ( !DRIVE ?auto_12121 ?auto_12122 ?auto_12120 )
      ( !UNLOAD ?auto_12119 ?auto_12118 ?auto_12121 ?auto_12120 )
      ( !DROP ?auto_12119 ?auto_12118 ?auto_12117 ?auto_12120 )
      ( MAKE-1CRATE-VERIFY ?auto_12117 ?auto_12118 ) )
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
      ?auto_12142 - SURFACE
      ?auto_12141 - SURFACE
    )
    :vars
    (
      ?auto_12145 - HOIST
      ?auto_12146 - PLACE
      ?auto_12148 - PLACE
      ?auto_12147 - HOIST
      ?auto_12144 - SURFACE
      ?auto_12160 - PLACE
      ?auto_12163 - HOIST
      ?auto_12161 - SURFACE
      ?auto_12162 - PLACE
      ?auto_12150 - HOIST
      ?auto_12156 - SURFACE
      ?auto_12157 - PLACE
      ?auto_12158 - HOIST
      ?auto_12159 - SURFACE
      ?auto_12153 - PLACE
      ?auto_12151 - HOIST
      ?auto_12149 - SURFACE
      ?auto_12165 - PLACE
      ?auto_12164 - HOIST
      ?auto_12155 - SURFACE
      ?auto_12152 - SURFACE
      ?auto_12154 - SURFACE
      ?auto_12143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12145 ?auto_12146 ) ( IS-CRATE ?auto_12141 ) ( not ( = ?auto_12148 ?auto_12146 ) ) ( HOIST-AT ?auto_12147 ?auto_12148 ) ( AVAILABLE ?auto_12147 ) ( SURFACE-AT ?auto_12141 ?auto_12148 ) ( ON ?auto_12141 ?auto_12144 ) ( CLEAR ?auto_12141 ) ( not ( = ?auto_12142 ?auto_12141 ) ) ( not ( = ?auto_12142 ?auto_12144 ) ) ( not ( = ?auto_12141 ?auto_12144 ) ) ( not ( = ?auto_12145 ?auto_12147 ) ) ( IS-CRATE ?auto_12142 ) ( not ( = ?auto_12160 ?auto_12146 ) ) ( HOIST-AT ?auto_12163 ?auto_12160 ) ( SURFACE-AT ?auto_12142 ?auto_12160 ) ( ON ?auto_12142 ?auto_12161 ) ( CLEAR ?auto_12142 ) ( not ( = ?auto_12140 ?auto_12142 ) ) ( not ( = ?auto_12140 ?auto_12161 ) ) ( not ( = ?auto_12142 ?auto_12161 ) ) ( not ( = ?auto_12145 ?auto_12163 ) ) ( IS-CRATE ?auto_12140 ) ( not ( = ?auto_12162 ?auto_12146 ) ) ( HOIST-AT ?auto_12150 ?auto_12162 ) ( AVAILABLE ?auto_12150 ) ( SURFACE-AT ?auto_12140 ?auto_12162 ) ( ON ?auto_12140 ?auto_12156 ) ( CLEAR ?auto_12140 ) ( not ( = ?auto_12139 ?auto_12140 ) ) ( not ( = ?auto_12139 ?auto_12156 ) ) ( not ( = ?auto_12140 ?auto_12156 ) ) ( not ( = ?auto_12145 ?auto_12150 ) ) ( IS-CRATE ?auto_12139 ) ( not ( = ?auto_12157 ?auto_12146 ) ) ( HOIST-AT ?auto_12158 ?auto_12157 ) ( SURFACE-AT ?auto_12139 ?auto_12157 ) ( ON ?auto_12139 ?auto_12159 ) ( CLEAR ?auto_12139 ) ( not ( = ?auto_12138 ?auto_12139 ) ) ( not ( = ?auto_12138 ?auto_12159 ) ) ( not ( = ?auto_12139 ?auto_12159 ) ) ( not ( = ?auto_12145 ?auto_12158 ) ) ( IS-CRATE ?auto_12138 ) ( not ( = ?auto_12153 ?auto_12146 ) ) ( HOIST-AT ?auto_12151 ?auto_12153 ) ( AVAILABLE ?auto_12151 ) ( SURFACE-AT ?auto_12138 ?auto_12153 ) ( ON ?auto_12138 ?auto_12149 ) ( CLEAR ?auto_12138 ) ( not ( = ?auto_12137 ?auto_12138 ) ) ( not ( = ?auto_12137 ?auto_12149 ) ) ( not ( = ?auto_12138 ?auto_12149 ) ) ( not ( = ?auto_12145 ?auto_12151 ) ) ( IS-CRATE ?auto_12137 ) ( not ( = ?auto_12165 ?auto_12146 ) ) ( HOIST-AT ?auto_12164 ?auto_12165 ) ( AVAILABLE ?auto_12164 ) ( SURFACE-AT ?auto_12137 ?auto_12165 ) ( ON ?auto_12137 ?auto_12155 ) ( CLEAR ?auto_12137 ) ( not ( = ?auto_12136 ?auto_12137 ) ) ( not ( = ?auto_12136 ?auto_12155 ) ) ( not ( = ?auto_12137 ?auto_12155 ) ) ( not ( = ?auto_12145 ?auto_12164 ) ) ( IS-CRATE ?auto_12136 ) ( AVAILABLE ?auto_12158 ) ( SURFACE-AT ?auto_12136 ?auto_12157 ) ( ON ?auto_12136 ?auto_12152 ) ( CLEAR ?auto_12136 ) ( not ( = ?auto_12135 ?auto_12136 ) ) ( not ( = ?auto_12135 ?auto_12152 ) ) ( not ( = ?auto_12136 ?auto_12152 ) ) ( SURFACE-AT ?auto_12134 ?auto_12146 ) ( CLEAR ?auto_12134 ) ( IS-CRATE ?auto_12135 ) ( AVAILABLE ?auto_12145 ) ( AVAILABLE ?auto_12163 ) ( SURFACE-AT ?auto_12135 ?auto_12160 ) ( ON ?auto_12135 ?auto_12154 ) ( CLEAR ?auto_12135 ) ( TRUCK-AT ?auto_12143 ?auto_12146 ) ( not ( = ?auto_12134 ?auto_12135 ) ) ( not ( = ?auto_12134 ?auto_12154 ) ) ( not ( = ?auto_12135 ?auto_12154 ) ) ( not ( = ?auto_12134 ?auto_12136 ) ) ( not ( = ?auto_12134 ?auto_12152 ) ) ( not ( = ?auto_12136 ?auto_12154 ) ) ( not ( = ?auto_12157 ?auto_12160 ) ) ( not ( = ?auto_12158 ?auto_12163 ) ) ( not ( = ?auto_12152 ?auto_12154 ) ) ( not ( = ?auto_12134 ?auto_12137 ) ) ( not ( = ?auto_12134 ?auto_12155 ) ) ( not ( = ?auto_12135 ?auto_12137 ) ) ( not ( = ?auto_12135 ?auto_12155 ) ) ( not ( = ?auto_12137 ?auto_12152 ) ) ( not ( = ?auto_12137 ?auto_12154 ) ) ( not ( = ?auto_12165 ?auto_12157 ) ) ( not ( = ?auto_12165 ?auto_12160 ) ) ( not ( = ?auto_12164 ?auto_12158 ) ) ( not ( = ?auto_12164 ?auto_12163 ) ) ( not ( = ?auto_12155 ?auto_12152 ) ) ( not ( = ?auto_12155 ?auto_12154 ) ) ( not ( = ?auto_12134 ?auto_12138 ) ) ( not ( = ?auto_12134 ?auto_12149 ) ) ( not ( = ?auto_12135 ?auto_12138 ) ) ( not ( = ?auto_12135 ?auto_12149 ) ) ( not ( = ?auto_12136 ?auto_12138 ) ) ( not ( = ?auto_12136 ?auto_12149 ) ) ( not ( = ?auto_12138 ?auto_12155 ) ) ( not ( = ?auto_12138 ?auto_12152 ) ) ( not ( = ?auto_12138 ?auto_12154 ) ) ( not ( = ?auto_12153 ?auto_12165 ) ) ( not ( = ?auto_12153 ?auto_12157 ) ) ( not ( = ?auto_12153 ?auto_12160 ) ) ( not ( = ?auto_12151 ?auto_12164 ) ) ( not ( = ?auto_12151 ?auto_12158 ) ) ( not ( = ?auto_12151 ?auto_12163 ) ) ( not ( = ?auto_12149 ?auto_12155 ) ) ( not ( = ?auto_12149 ?auto_12152 ) ) ( not ( = ?auto_12149 ?auto_12154 ) ) ( not ( = ?auto_12134 ?auto_12139 ) ) ( not ( = ?auto_12134 ?auto_12159 ) ) ( not ( = ?auto_12135 ?auto_12139 ) ) ( not ( = ?auto_12135 ?auto_12159 ) ) ( not ( = ?auto_12136 ?auto_12139 ) ) ( not ( = ?auto_12136 ?auto_12159 ) ) ( not ( = ?auto_12137 ?auto_12139 ) ) ( not ( = ?auto_12137 ?auto_12159 ) ) ( not ( = ?auto_12139 ?auto_12149 ) ) ( not ( = ?auto_12139 ?auto_12155 ) ) ( not ( = ?auto_12139 ?auto_12152 ) ) ( not ( = ?auto_12139 ?auto_12154 ) ) ( not ( = ?auto_12159 ?auto_12149 ) ) ( not ( = ?auto_12159 ?auto_12155 ) ) ( not ( = ?auto_12159 ?auto_12152 ) ) ( not ( = ?auto_12159 ?auto_12154 ) ) ( not ( = ?auto_12134 ?auto_12140 ) ) ( not ( = ?auto_12134 ?auto_12156 ) ) ( not ( = ?auto_12135 ?auto_12140 ) ) ( not ( = ?auto_12135 ?auto_12156 ) ) ( not ( = ?auto_12136 ?auto_12140 ) ) ( not ( = ?auto_12136 ?auto_12156 ) ) ( not ( = ?auto_12137 ?auto_12140 ) ) ( not ( = ?auto_12137 ?auto_12156 ) ) ( not ( = ?auto_12138 ?auto_12140 ) ) ( not ( = ?auto_12138 ?auto_12156 ) ) ( not ( = ?auto_12140 ?auto_12159 ) ) ( not ( = ?auto_12140 ?auto_12149 ) ) ( not ( = ?auto_12140 ?auto_12155 ) ) ( not ( = ?auto_12140 ?auto_12152 ) ) ( not ( = ?auto_12140 ?auto_12154 ) ) ( not ( = ?auto_12162 ?auto_12157 ) ) ( not ( = ?auto_12162 ?auto_12153 ) ) ( not ( = ?auto_12162 ?auto_12165 ) ) ( not ( = ?auto_12162 ?auto_12160 ) ) ( not ( = ?auto_12150 ?auto_12158 ) ) ( not ( = ?auto_12150 ?auto_12151 ) ) ( not ( = ?auto_12150 ?auto_12164 ) ) ( not ( = ?auto_12150 ?auto_12163 ) ) ( not ( = ?auto_12156 ?auto_12159 ) ) ( not ( = ?auto_12156 ?auto_12149 ) ) ( not ( = ?auto_12156 ?auto_12155 ) ) ( not ( = ?auto_12156 ?auto_12152 ) ) ( not ( = ?auto_12156 ?auto_12154 ) ) ( not ( = ?auto_12134 ?auto_12142 ) ) ( not ( = ?auto_12134 ?auto_12161 ) ) ( not ( = ?auto_12135 ?auto_12142 ) ) ( not ( = ?auto_12135 ?auto_12161 ) ) ( not ( = ?auto_12136 ?auto_12142 ) ) ( not ( = ?auto_12136 ?auto_12161 ) ) ( not ( = ?auto_12137 ?auto_12142 ) ) ( not ( = ?auto_12137 ?auto_12161 ) ) ( not ( = ?auto_12138 ?auto_12142 ) ) ( not ( = ?auto_12138 ?auto_12161 ) ) ( not ( = ?auto_12139 ?auto_12142 ) ) ( not ( = ?auto_12139 ?auto_12161 ) ) ( not ( = ?auto_12142 ?auto_12156 ) ) ( not ( = ?auto_12142 ?auto_12159 ) ) ( not ( = ?auto_12142 ?auto_12149 ) ) ( not ( = ?auto_12142 ?auto_12155 ) ) ( not ( = ?auto_12142 ?auto_12152 ) ) ( not ( = ?auto_12142 ?auto_12154 ) ) ( not ( = ?auto_12161 ?auto_12156 ) ) ( not ( = ?auto_12161 ?auto_12159 ) ) ( not ( = ?auto_12161 ?auto_12149 ) ) ( not ( = ?auto_12161 ?auto_12155 ) ) ( not ( = ?auto_12161 ?auto_12152 ) ) ( not ( = ?auto_12161 ?auto_12154 ) ) ( not ( = ?auto_12134 ?auto_12141 ) ) ( not ( = ?auto_12134 ?auto_12144 ) ) ( not ( = ?auto_12135 ?auto_12141 ) ) ( not ( = ?auto_12135 ?auto_12144 ) ) ( not ( = ?auto_12136 ?auto_12141 ) ) ( not ( = ?auto_12136 ?auto_12144 ) ) ( not ( = ?auto_12137 ?auto_12141 ) ) ( not ( = ?auto_12137 ?auto_12144 ) ) ( not ( = ?auto_12138 ?auto_12141 ) ) ( not ( = ?auto_12138 ?auto_12144 ) ) ( not ( = ?auto_12139 ?auto_12141 ) ) ( not ( = ?auto_12139 ?auto_12144 ) ) ( not ( = ?auto_12140 ?auto_12141 ) ) ( not ( = ?auto_12140 ?auto_12144 ) ) ( not ( = ?auto_12141 ?auto_12161 ) ) ( not ( = ?auto_12141 ?auto_12156 ) ) ( not ( = ?auto_12141 ?auto_12159 ) ) ( not ( = ?auto_12141 ?auto_12149 ) ) ( not ( = ?auto_12141 ?auto_12155 ) ) ( not ( = ?auto_12141 ?auto_12152 ) ) ( not ( = ?auto_12141 ?auto_12154 ) ) ( not ( = ?auto_12148 ?auto_12160 ) ) ( not ( = ?auto_12148 ?auto_12162 ) ) ( not ( = ?auto_12148 ?auto_12157 ) ) ( not ( = ?auto_12148 ?auto_12153 ) ) ( not ( = ?auto_12148 ?auto_12165 ) ) ( not ( = ?auto_12147 ?auto_12163 ) ) ( not ( = ?auto_12147 ?auto_12150 ) ) ( not ( = ?auto_12147 ?auto_12158 ) ) ( not ( = ?auto_12147 ?auto_12151 ) ) ( not ( = ?auto_12147 ?auto_12164 ) ) ( not ( = ?auto_12144 ?auto_12161 ) ) ( not ( = ?auto_12144 ?auto_12156 ) ) ( not ( = ?auto_12144 ?auto_12159 ) ) ( not ( = ?auto_12144 ?auto_12149 ) ) ( not ( = ?auto_12144 ?auto_12155 ) ) ( not ( = ?auto_12144 ?auto_12152 ) ) ( not ( = ?auto_12144 ?auto_12154 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_12134 ?auto_12135 ?auto_12136 ?auto_12137 ?auto_12138 ?auto_12139 ?auto_12140 ?auto_12142 )
      ( MAKE-1CRATE ?auto_12142 ?auto_12141 )
      ( MAKE-8CRATE-VERIFY ?auto_12134 ?auto_12135 ?auto_12136 ?auto_12137 ?auto_12138 ?auto_12139 ?auto_12140 ?auto_12142 ?auto_12141 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12168 - SURFACE
      ?auto_12169 - SURFACE
    )
    :vars
    (
      ?auto_12170 - HOIST
      ?auto_12171 - PLACE
      ?auto_12173 - PLACE
      ?auto_12174 - HOIST
      ?auto_12175 - SURFACE
      ?auto_12172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12170 ?auto_12171 ) ( SURFACE-AT ?auto_12168 ?auto_12171 ) ( CLEAR ?auto_12168 ) ( IS-CRATE ?auto_12169 ) ( AVAILABLE ?auto_12170 ) ( not ( = ?auto_12173 ?auto_12171 ) ) ( HOIST-AT ?auto_12174 ?auto_12173 ) ( AVAILABLE ?auto_12174 ) ( SURFACE-AT ?auto_12169 ?auto_12173 ) ( ON ?auto_12169 ?auto_12175 ) ( CLEAR ?auto_12169 ) ( TRUCK-AT ?auto_12172 ?auto_12171 ) ( not ( = ?auto_12168 ?auto_12169 ) ) ( not ( = ?auto_12168 ?auto_12175 ) ) ( not ( = ?auto_12169 ?auto_12175 ) ) ( not ( = ?auto_12170 ?auto_12174 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12172 ?auto_12171 ?auto_12173 )
      ( !LIFT ?auto_12174 ?auto_12169 ?auto_12175 ?auto_12173 )
      ( !LOAD ?auto_12174 ?auto_12169 ?auto_12172 ?auto_12173 )
      ( !DRIVE ?auto_12172 ?auto_12173 ?auto_12171 )
      ( !UNLOAD ?auto_12170 ?auto_12169 ?auto_12172 ?auto_12171 )
      ( !DROP ?auto_12170 ?auto_12169 ?auto_12168 ?auto_12171 )
      ( MAKE-1CRATE-VERIFY ?auto_12168 ?auto_12169 ) )
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
      ?auto_12195 - SURFACE
      ?auto_12194 - SURFACE
      ?auto_12193 - SURFACE
    )
    :vars
    (
      ?auto_12199 - HOIST
      ?auto_12200 - PLACE
      ?auto_12198 - PLACE
      ?auto_12197 - HOIST
      ?auto_12196 - SURFACE
      ?auto_12209 - PLACE
      ?auto_12210 - HOIST
      ?auto_12211 - SURFACE
      ?auto_12216 - PLACE
      ?auto_12208 - HOIST
      ?auto_12202 - SURFACE
      ?auto_12203 - PLACE
      ?auto_12220 - HOIST
      ?auto_12204 - SURFACE
      ?auto_12218 - PLACE
      ?auto_12215 - HOIST
      ?auto_12214 - SURFACE
      ?auto_12207 - PLACE
      ?auto_12221 - HOIST
      ?auto_12219 - SURFACE
      ?auto_12213 - PLACE
      ?auto_12217 - HOIST
      ?auto_12205 - SURFACE
      ?auto_12212 - SURFACE
      ?auto_12206 - SURFACE
      ?auto_12201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12199 ?auto_12200 ) ( IS-CRATE ?auto_12193 ) ( not ( = ?auto_12198 ?auto_12200 ) ) ( HOIST-AT ?auto_12197 ?auto_12198 ) ( AVAILABLE ?auto_12197 ) ( SURFACE-AT ?auto_12193 ?auto_12198 ) ( ON ?auto_12193 ?auto_12196 ) ( CLEAR ?auto_12193 ) ( not ( = ?auto_12194 ?auto_12193 ) ) ( not ( = ?auto_12194 ?auto_12196 ) ) ( not ( = ?auto_12193 ?auto_12196 ) ) ( not ( = ?auto_12199 ?auto_12197 ) ) ( IS-CRATE ?auto_12194 ) ( not ( = ?auto_12209 ?auto_12200 ) ) ( HOIST-AT ?auto_12210 ?auto_12209 ) ( AVAILABLE ?auto_12210 ) ( SURFACE-AT ?auto_12194 ?auto_12209 ) ( ON ?auto_12194 ?auto_12211 ) ( CLEAR ?auto_12194 ) ( not ( = ?auto_12195 ?auto_12194 ) ) ( not ( = ?auto_12195 ?auto_12211 ) ) ( not ( = ?auto_12194 ?auto_12211 ) ) ( not ( = ?auto_12199 ?auto_12210 ) ) ( IS-CRATE ?auto_12195 ) ( not ( = ?auto_12216 ?auto_12200 ) ) ( HOIST-AT ?auto_12208 ?auto_12216 ) ( SURFACE-AT ?auto_12195 ?auto_12216 ) ( ON ?auto_12195 ?auto_12202 ) ( CLEAR ?auto_12195 ) ( not ( = ?auto_12192 ?auto_12195 ) ) ( not ( = ?auto_12192 ?auto_12202 ) ) ( not ( = ?auto_12195 ?auto_12202 ) ) ( not ( = ?auto_12199 ?auto_12208 ) ) ( IS-CRATE ?auto_12192 ) ( not ( = ?auto_12203 ?auto_12200 ) ) ( HOIST-AT ?auto_12220 ?auto_12203 ) ( AVAILABLE ?auto_12220 ) ( SURFACE-AT ?auto_12192 ?auto_12203 ) ( ON ?auto_12192 ?auto_12204 ) ( CLEAR ?auto_12192 ) ( not ( = ?auto_12191 ?auto_12192 ) ) ( not ( = ?auto_12191 ?auto_12204 ) ) ( not ( = ?auto_12192 ?auto_12204 ) ) ( not ( = ?auto_12199 ?auto_12220 ) ) ( IS-CRATE ?auto_12191 ) ( not ( = ?auto_12218 ?auto_12200 ) ) ( HOIST-AT ?auto_12215 ?auto_12218 ) ( SURFACE-AT ?auto_12191 ?auto_12218 ) ( ON ?auto_12191 ?auto_12214 ) ( CLEAR ?auto_12191 ) ( not ( = ?auto_12190 ?auto_12191 ) ) ( not ( = ?auto_12190 ?auto_12214 ) ) ( not ( = ?auto_12191 ?auto_12214 ) ) ( not ( = ?auto_12199 ?auto_12215 ) ) ( IS-CRATE ?auto_12190 ) ( not ( = ?auto_12207 ?auto_12200 ) ) ( HOIST-AT ?auto_12221 ?auto_12207 ) ( AVAILABLE ?auto_12221 ) ( SURFACE-AT ?auto_12190 ?auto_12207 ) ( ON ?auto_12190 ?auto_12219 ) ( CLEAR ?auto_12190 ) ( not ( = ?auto_12189 ?auto_12190 ) ) ( not ( = ?auto_12189 ?auto_12219 ) ) ( not ( = ?auto_12190 ?auto_12219 ) ) ( not ( = ?auto_12199 ?auto_12221 ) ) ( IS-CRATE ?auto_12189 ) ( not ( = ?auto_12213 ?auto_12200 ) ) ( HOIST-AT ?auto_12217 ?auto_12213 ) ( AVAILABLE ?auto_12217 ) ( SURFACE-AT ?auto_12189 ?auto_12213 ) ( ON ?auto_12189 ?auto_12205 ) ( CLEAR ?auto_12189 ) ( not ( = ?auto_12188 ?auto_12189 ) ) ( not ( = ?auto_12188 ?auto_12205 ) ) ( not ( = ?auto_12189 ?auto_12205 ) ) ( not ( = ?auto_12199 ?auto_12217 ) ) ( IS-CRATE ?auto_12188 ) ( AVAILABLE ?auto_12215 ) ( SURFACE-AT ?auto_12188 ?auto_12218 ) ( ON ?auto_12188 ?auto_12212 ) ( CLEAR ?auto_12188 ) ( not ( = ?auto_12187 ?auto_12188 ) ) ( not ( = ?auto_12187 ?auto_12212 ) ) ( not ( = ?auto_12188 ?auto_12212 ) ) ( SURFACE-AT ?auto_12186 ?auto_12200 ) ( CLEAR ?auto_12186 ) ( IS-CRATE ?auto_12187 ) ( AVAILABLE ?auto_12199 ) ( AVAILABLE ?auto_12208 ) ( SURFACE-AT ?auto_12187 ?auto_12216 ) ( ON ?auto_12187 ?auto_12206 ) ( CLEAR ?auto_12187 ) ( TRUCK-AT ?auto_12201 ?auto_12200 ) ( not ( = ?auto_12186 ?auto_12187 ) ) ( not ( = ?auto_12186 ?auto_12206 ) ) ( not ( = ?auto_12187 ?auto_12206 ) ) ( not ( = ?auto_12186 ?auto_12188 ) ) ( not ( = ?auto_12186 ?auto_12212 ) ) ( not ( = ?auto_12188 ?auto_12206 ) ) ( not ( = ?auto_12218 ?auto_12216 ) ) ( not ( = ?auto_12215 ?auto_12208 ) ) ( not ( = ?auto_12212 ?auto_12206 ) ) ( not ( = ?auto_12186 ?auto_12189 ) ) ( not ( = ?auto_12186 ?auto_12205 ) ) ( not ( = ?auto_12187 ?auto_12189 ) ) ( not ( = ?auto_12187 ?auto_12205 ) ) ( not ( = ?auto_12189 ?auto_12212 ) ) ( not ( = ?auto_12189 ?auto_12206 ) ) ( not ( = ?auto_12213 ?auto_12218 ) ) ( not ( = ?auto_12213 ?auto_12216 ) ) ( not ( = ?auto_12217 ?auto_12215 ) ) ( not ( = ?auto_12217 ?auto_12208 ) ) ( not ( = ?auto_12205 ?auto_12212 ) ) ( not ( = ?auto_12205 ?auto_12206 ) ) ( not ( = ?auto_12186 ?auto_12190 ) ) ( not ( = ?auto_12186 ?auto_12219 ) ) ( not ( = ?auto_12187 ?auto_12190 ) ) ( not ( = ?auto_12187 ?auto_12219 ) ) ( not ( = ?auto_12188 ?auto_12190 ) ) ( not ( = ?auto_12188 ?auto_12219 ) ) ( not ( = ?auto_12190 ?auto_12205 ) ) ( not ( = ?auto_12190 ?auto_12212 ) ) ( not ( = ?auto_12190 ?auto_12206 ) ) ( not ( = ?auto_12207 ?auto_12213 ) ) ( not ( = ?auto_12207 ?auto_12218 ) ) ( not ( = ?auto_12207 ?auto_12216 ) ) ( not ( = ?auto_12221 ?auto_12217 ) ) ( not ( = ?auto_12221 ?auto_12215 ) ) ( not ( = ?auto_12221 ?auto_12208 ) ) ( not ( = ?auto_12219 ?auto_12205 ) ) ( not ( = ?auto_12219 ?auto_12212 ) ) ( not ( = ?auto_12219 ?auto_12206 ) ) ( not ( = ?auto_12186 ?auto_12191 ) ) ( not ( = ?auto_12186 ?auto_12214 ) ) ( not ( = ?auto_12187 ?auto_12191 ) ) ( not ( = ?auto_12187 ?auto_12214 ) ) ( not ( = ?auto_12188 ?auto_12191 ) ) ( not ( = ?auto_12188 ?auto_12214 ) ) ( not ( = ?auto_12189 ?auto_12191 ) ) ( not ( = ?auto_12189 ?auto_12214 ) ) ( not ( = ?auto_12191 ?auto_12219 ) ) ( not ( = ?auto_12191 ?auto_12205 ) ) ( not ( = ?auto_12191 ?auto_12212 ) ) ( not ( = ?auto_12191 ?auto_12206 ) ) ( not ( = ?auto_12214 ?auto_12219 ) ) ( not ( = ?auto_12214 ?auto_12205 ) ) ( not ( = ?auto_12214 ?auto_12212 ) ) ( not ( = ?auto_12214 ?auto_12206 ) ) ( not ( = ?auto_12186 ?auto_12192 ) ) ( not ( = ?auto_12186 ?auto_12204 ) ) ( not ( = ?auto_12187 ?auto_12192 ) ) ( not ( = ?auto_12187 ?auto_12204 ) ) ( not ( = ?auto_12188 ?auto_12192 ) ) ( not ( = ?auto_12188 ?auto_12204 ) ) ( not ( = ?auto_12189 ?auto_12192 ) ) ( not ( = ?auto_12189 ?auto_12204 ) ) ( not ( = ?auto_12190 ?auto_12192 ) ) ( not ( = ?auto_12190 ?auto_12204 ) ) ( not ( = ?auto_12192 ?auto_12214 ) ) ( not ( = ?auto_12192 ?auto_12219 ) ) ( not ( = ?auto_12192 ?auto_12205 ) ) ( not ( = ?auto_12192 ?auto_12212 ) ) ( not ( = ?auto_12192 ?auto_12206 ) ) ( not ( = ?auto_12203 ?auto_12218 ) ) ( not ( = ?auto_12203 ?auto_12207 ) ) ( not ( = ?auto_12203 ?auto_12213 ) ) ( not ( = ?auto_12203 ?auto_12216 ) ) ( not ( = ?auto_12220 ?auto_12215 ) ) ( not ( = ?auto_12220 ?auto_12221 ) ) ( not ( = ?auto_12220 ?auto_12217 ) ) ( not ( = ?auto_12220 ?auto_12208 ) ) ( not ( = ?auto_12204 ?auto_12214 ) ) ( not ( = ?auto_12204 ?auto_12219 ) ) ( not ( = ?auto_12204 ?auto_12205 ) ) ( not ( = ?auto_12204 ?auto_12212 ) ) ( not ( = ?auto_12204 ?auto_12206 ) ) ( not ( = ?auto_12186 ?auto_12195 ) ) ( not ( = ?auto_12186 ?auto_12202 ) ) ( not ( = ?auto_12187 ?auto_12195 ) ) ( not ( = ?auto_12187 ?auto_12202 ) ) ( not ( = ?auto_12188 ?auto_12195 ) ) ( not ( = ?auto_12188 ?auto_12202 ) ) ( not ( = ?auto_12189 ?auto_12195 ) ) ( not ( = ?auto_12189 ?auto_12202 ) ) ( not ( = ?auto_12190 ?auto_12195 ) ) ( not ( = ?auto_12190 ?auto_12202 ) ) ( not ( = ?auto_12191 ?auto_12195 ) ) ( not ( = ?auto_12191 ?auto_12202 ) ) ( not ( = ?auto_12195 ?auto_12204 ) ) ( not ( = ?auto_12195 ?auto_12214 ) ) ( not ( = ?auto_12195 ?auto_12219 ) ) ( not ( = ?auto_12195 ?auto_12205 ) ) ( not ( = ?auto_12195 ?auto_12212 ) ) ( not ( = ?auto_12195 ?auto_12206 ) ) ( not ( = ?auto_12202 ?auto_12204 ) ) ( not ( = ?auto_12202 ?auto_12214 ) ) ( not ( = ?auto_12202 ?auto_12219 ) ) ( not ( = ?auto_12202 ?auto_12205 ) ) ( not ( = ?auto_12202 ?auto_12212 ) ) ( not ( = ?auto_12202 ?auto_12206 ) ) ( not ( = ?auto_12186 ?auto_12194 ) ) ( not ( = ?auto_12186 ?auto_12211 ) ) ( not ( = ?auto_12187 ?auto_12194 ) ) ( not ( = ?auto_12187 ?auto_12211 ) ) ( not ( = ?auto_12188 ?auto_12194 ) ) ( not ( = ?auto_12188 ?auto_12211 ) ) ( not ( = ?auto_12189 ?auto_12194 ) ) ( not ( = ?auto_12189 ?auto_12211 ) ) ( not ( = ?auto_12190 ?auto_12194 ) ) ( not ( = ?auto_12190 ?auto_12211 ) ) ( not ( = ?auto_12191 ?auto_12194 ) ) ( not ( = ?auto_12191 ?auto_12211 ) ) ( not ( = ?auto_12192 ?auto_12194 ) ) ( not ( = ?auto_12192 ?auto_12211 ) ) ( not ( = ?auto_12194 ?auto_12202 ) ) ( not ( = ?auto_12194 ?auto_12204 ) ) ( not ( = ?auto_12194 ?auto_12214 ) ) ( not ( = ?auto_12194 ?auto_12219 ) ) ( not ( = ?auto_12194 ?auto_12205 ) ) ( not ( = ?auto_12194 ?auto_12212 ) ) ( not ( = ?auto_12194 ?auto_12206 ) ) ( not ( = ?auto_12209 ?auto_12216 ) ) ( not ( = ?auto_12209 ?auto_12203 ) ) ( not ( = ?auto_12209 ?auto_12218 ) ) ( not ( = ?auto_12209 ?auto_12207 ) ) ( not ( = ?auto_12209 ?auto_12213 ) ) ( not ( = ?auto_12210 ?auto_12208 ) ) ( not ( = ?auto_12210 ?auto_12220 ) ) ( not ( = ?auto_12210 ?auto_12215 ) ) ( not ( = ?auto_12210 ?auto_12221 ) ) ( not ( = ?auto_12210 ?auto_12217 ) ) ( not ( = ?auto_12211 ?auto_12202 ) ) ( not ( = ?auto_12211 ?auto_12204 ) ) ( not ( = ?auto_12211 ?auto_12214 ) ) ( not ( = ?auto_12211 ?auto_12219 ) ) ( not ( = ?auto_12211 ?auto_12205 ) ) ( not ( = ?auto_12211 ?auto_12212 ) ) ( not ( = ?auto_12211 ?auto_12206 ) ) ( not ( = ?auto_12186 ?auto_12193 ) ) ( not ( = ?auto_12186 ?auto_12196 ) ) ( not ( = ?auto_12187 ?auto_12193 ) ) ( not ( = ?auto_12187 ?auto_12196 ) ) ( not ( = ?auto_12188 ?auto_12193 ) ) ( not ( = ?auto_12188 ?auto_12196 ) ) ( not ( = ?auto_12189 ?auto_12193 ) ) ( not ( = ?auto_12189 ?auto_12196 ) ) ( not ( = ?auto_12190 ?auto_12193 ) ) ( not ( = ?auto_12190 ?auto_12196 ) ) ( not ( = ?auto_12191 ?auto_12193 ) ) ( not ( = ?auto_12191 ?auto_12196 ) ) ( not ( = ?auto_12192 ?auto_12193 ) ) ( not ( = ?auto_12192 ?auto_12196 ) ) ( not ( = ?auto_12195 ?auto_12193 ) ) ( not ( = ?auto_12195 ?auto_12196 ) ) ( not ( = ?auto_12193 ?auto_12211 ) ) ( not ( = ?auto_12193 ?auto_12202 ) ) ( not ( = ?auto_12193 ?auto_12204 ) ) ( not ( = ?auto_12193 ?auto_12214 ) ) ( not ( = ?auto_12193 ?auto_12219 ) ) ( not ( = ?auto_12193 ?auto_12205 ) ) ( not ( = ?auto_12193 ?auto_12212 ) ) ( not ( = ?auto_12193 ?auto_12206 ) ) ( not ( = ?auto_12198 ?auto_12209 ) ) ( not ( = ?auto_12198 ?auto_12216 ) ) ( not ( = ?auto_12198 ?auto_12203 ) ) ( not ( = ?auto_12198 ?auto_12218 ) ) ( not ( = ?auto_12198 ?auto_12207 ) ) ( not ( = ?auto_12198 ?auto_12213 ) ) ( not ( = ?auto_12197 ?auto_12210 ) ) ( not ( = ?auto_12197 ?auto_12208 ) ) ( not ( = ?auto_12197 ?auto_12220 ) ) ( not ( = ?auto_12197 ?auto_12215 ) ) ( not ( = ?auto_12197 ?auto_12221 ) ) ( not ( = ?auto_12197 ?auto_12217 ) ) ( not ( = ?auto_12196 ?auto_12211 ) ) ( not ( = ?auto_12196 ?auto_12202 ) ) ( not ( = ?auto_12196 ?auto_12204 ) ) ( not ( = ?auto_12196 ?auto_12214 ) ) ( not ( = ?auto_12196 ?auto_12219 ) ) ( not ( = ?auto_12196 ?auto_12205 ) ) ( not ( = ?auto_12196 ?auto_12212 ) ) ( not ( = ?auto_12196 ?auto_12206 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_12186 ?auto_12187 ?auto_12188 ?auto_12189 ?auto_12190 ?auto_12191 ?auto_12192 ?auto_12195 ?auto_12194 )
      ( MAKE-1CRATE ?auto_12194 ?auto_12193 )
      ( MAKE-9CRATE-VERIFY ?auto_12186 ?auto_12187 ?auto_12188 ?auto_12189 ?auto_12190 ?auto_12191 ?auto_12192 ?auto_12195 ?auto_12194 ?auto_12193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12224 - SURFACE
      ?auto_12225 - SURFACE
    )
    :vars
    (
      ?auto_12226 - HOIST
      ?auto_12227 - PLACE
      ?auto_12229 - PLACE
      ?auto_12230 - HOIST
      ?auto_12231 - SURFACE
      ?auto_12228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12226 ?auto_12227 ) ( SURFACE-AT ?auto_12224 ?auto_12227 ) ( CLEAR ?auto_12224 ) ( IS-CRATE ?auto_12225 ) ( AVAILABLE ?auto_12226 ) ( not ( = ?auto_12229 ?auto_12227 ) ) ( HOIST-AT ?auto_12230 ?auto_12229 ) ( AVAILABLE ?auto_12230 ) ( SURFACE-AT ?auto_12225 ?auto_12229 ) ( ON ?auto_12225 ?auto_12231 ) ( CLEAR ?auto_12225 ) ( TRUCK-AT ?auto_12228 ?auto_12227 ) ( not ( = ?auto_12224 ?auto_12225 ) ) ( not ( = ?auto_12224 ?auto_12231 ) ) ( not ( = ?auto_12225 ?auto_12231 ) ) ( not ( = ?auto_12226 ?auto_12230 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12228 ?auto_12227 ?auto_12229 )
      ( !LIFT ?auto_12230 ?auto_12225 ?auto_12231 ?auto_12229 )
      ( !LOAD ?auto_12230 ?auto_12225 ?auto_12228 ?auto_12229 )
      ( !DRIVE ?auto_12228 ?auto_12229 ?auto_12227 )
      ( !UNLOAD ?auto_12226 ?auto_12225 ?auto_12228 ?auto_12227 )
      ( !DROP ?auto_12226 ?auto_12225 ?auto_12224 ?auto_12227 )
      ( MAKE-1CRATE-VERIFY ?auto_12224 ?auto_12225 ) )
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
      ?auto_12252 - SURFACE
      ?auto_12251 - SURFACE
      ?auto_12250 - SURFACE
      ?auto_12253 - SURFACE
    )
    :vars
    (
      ?auto_12257 - HOIST
      ?auto_12255 - PLACE
      ?auto_12259 - PLACE
      ?auto_12258 - HOIST
      ?auto_12254 - SURFACE
      ?auto_12265 - PLACE
      ?auto_12275 - HOIST
      ?auto_12280 - SURFACE
      ?auto_12270 - PLACE
      ?auto_12281 - HOIST
      ?auto_12268 - SURFACE
      ?auto_12264 - PLACE
      ?auto_12262 - HOIST
      ?auto_12266 - SURFACE
      ?auto_12274 - PLACE
      ?auto_12267 - HOIST
      ?auto_12278 - SURFACE
      ?auto_12277 - PLACE
      ?auto_12269 - HOIST
      ?auto_12273 - SURFACE
      ?auto_12261 - PLACE
      ?auto_12276 - HOIST
      ?auto_12263 - SURFACE
      ?auto_12271 - PLACE
      ?auto_12272 - HOIST
      ?auto_12282 - SURFACE
      ?auto_12279 - SURFACE
      ?auto_12260 - SURFACE
      ?auto_12256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12257 ?auto_12255 ) ( IS-CRATE ?auto_12253 ) ( not ( = ?auto_12259 ?auto_12255 ) ) ( HOIST-AT ?auto_12258 ?auto_12259 ) ( AVAILABLE ?auto_12258 ) ( SURFACE-AT ?auto_12253 ?auto_12259 ) ( ON ?auto_12253 ?auto_12254 ) ( CLEAR ?auto_12253 ) ( not ( = ?auto_12250 ?auto_12253 ) ) ( not ( = ?auto_12250 ?auto_12254 ) ) ( not ( = ?auto_12253 ?auto_12254 ) ) ( not ( = ?auto_12257 ?auto_12258 ) ) ( IS-CRATE ?auto_12250 ) ( not ( = ?auto_12265 ?auto_12255 ) ) ( HOIST-AT ?auto_12275 ?auto_12265 ) ( AVAILABLE ?auto_12275 ) ( SURFACE-AT ?auto_12250 ?auto_12265 ) ( ON ?auto_12250 ?auto_12280 ) ( CLEAR ?auto_12250 ) ( not ( = ?auto_12251 ?auto_12250 ) ) ( not ( = ?auto_12251 ?auto_12280 ) ) ( not ( = ?auto_12250 ?auto_12280 ) ) ( not ( = ?auto_12257 ?auto_12275 ) ) ( IS-CRATE ?auto_12251 ) ( not ( = ?auto_12270 ?auto_12255 ) ) ( HOIST-AT ?auto_12281 ?auto_12270 ) ( AVAILABLE ?auto_12281 ) ( SURFACE-AT ?auto_12251 ?auto_12270 ) ( ON ?auto_12251 ?auto_12268 ) ( CLEAR ?auto_12251 ) ( not ( = ?auto_12252 ?auto_12251 ) ) ( not ( = ?auto_12252 ?auto_12268 ) ) ( not ( = ?auto_12251 ?auto_12268 ) ) ( not ( = ?auto_12257 ?auto_12281 ) ) ( IS-CRATE ?auto_12252 ) ( not ( = ?auto_12264 ?auto_12255 ) ) ( HOIST-AT ?auto_12262 ?auto_12264 ) ( SURFACE-AT ?auto_12252 ?auto_12264 ) ( ON ?auto_12252 ?auto_12266 ) ( CLEAR ?auto_12252 ) ( not ( = ?auto_12249 ?auto_12252 ) ) ( not ( = ?auto_12249 ?auto_12266 ) ) ( not ( = ?auto_12252 ?auto_12266 ) ) ( not ( = ?auto_12257 ?auto_12262 ) ) ( IS-CRATE ?auto_12249 ) ( not ( = ?auto_12274 ?auto_12255 ) ) ( HOIST-AT ?auto_12267 ?auto_12274 ) ( AVAILABLE ?auto_12267 ) ( SURFACE-AT ?auto_12249 ?auto_12274 ) ( ON ?auto_12249 ?auto_12278 ) ( CLEAR ?auto_12249 ) ( not ( = ?auto_12248 ?auto_12249 ) ) ( not ( = ?auto_12248 ?auto_12278 ) ) ( not ( = ?auto_12249 ?auto_12278 ) ) ( not ( = ?auto_12257 ?auto_12267 ) ) ( IS-CRATE ?auto_12248 ) ( not ( = ?auto_12277 ?auto_12255 ) ) ( HOIST-AT ?auto_12269 ?auto_12277 ) ( SURFACE-AT ?auto_12248 ?auto_12277 ) ( ON ?auto_12248 ?auto_12273 ) ( CLEAR ?auto_12248 ) ( not ( = ?auto_12247 ?auto_12248 ) ) ( not ( = ?auto_12247 ?auto_12273 ) ) ( not ( = ?auto_12248 ?auto_12273 ) ) ( not ( = ?auto_12257 ?auto_12269 ) ) ( IS-CRATE ?auto_12247 ) ( not ( = ?auto_12261 ?auto_12255 ) ) ( HOIST-AT ?auto_12276 ?auto_12261 ) ( AVAILABLE ?auto_12276 ) ( SURFACE-AT ?auto_12247 ?auto_12261 ) ( ON ?auto_12247 ?auto_12263 ) ( CLEAR ?auto_12247 ) ( not ( = ?auto_12246 ?auto_12247 ) ) ( not ( = ?auto_12246 ?auto_12263 ) ) ( not ( = ?auto_12247 ?auto_12263 ) ) ( not ( = ?auto_12257 ?auto_12276 ) ) ( IS-CRATE ?auto_12246 ) ( not ( = ?auto_12271 ?auto_12255 ) ) ( HOIST-AT ?auto_12272 ?auto_12271 ) ( AVAILABLE ?auto_12272 ) ( SURFACE-AT ?auto_12246 ?auto_12271 ) ( ON ?auto_12246 ?auto_12282 ) ( CLEAR ?auto_12246 ) ( not ( = ?auto_12245 ?auto_12246 ) ) ( not ( = ?auto_12245 ?auto_12282 ) ) ( not ( = ?auto_12246 ?auto_12282 ) ) ( not ( = ?auto_12257 ?auto_12272 ) ) ( IS-CRATE ?auto_12245 ) ( AVAILABLE ?auto_12269 ) ( SURFACE-AT ?auto_12245 ?auto_12277 ) ( ON ?auto_12245 ?auto_12279 ) ( CLEAR ?auto_12245 ) ( not ( = ?auto_12244 ?auto_12245 ) ) ( not ( = ?auto_12244 ?auto_12279 ) ) ( not ( = ?auto_12245 ?auto_12279 ) ) ( SURFACE-AT ?auto_12243 ?auto_12255 ) ( CLEAR ?auto_12243 ) ( IS-CRATE ?auto_12244 ) ( AVAILABLE ?auto_12257 ) ( AVAILABLE ?auto_12262 ) ( SURFACE-AT ?auto_12244 ?auto_12264 ) ( ON ?auto_12244 ?auto_12260 ) ( CLEAR ?auto_12244 ) ( TRUCK-AT ?auto_12256 ?auto_12255 ) ( not ( = ?auto_12243 ?auto_12244 ) ) ( not ( = ?auto_12243 ?auto_12260 ) ) ( not ( = ?auto_12244 ?auto_12260 ) ) ( not ( = ?auto_12243 ?auto_12245 ) ) ( not ( = ?auto_12243 ?auto_12279 ) ) ( not ( = ?auto_12245 ?auto_12260 ) ) ( not ( = ?auto_12277 ?auto_12264 ) ) ( not ( = ?auto_12269 ?auto_12262 ) ) ( not ( = ?auto_12279 ?auto_12260 ) ) ( not ( = ?auto_12243 ?auto_12246 ) ) ( not ( = ?auto_12243 ?auto_12282 ) ) ( not ( = ?auto_12244 ?auto_12246 ) ) ( not ( = ?auto_12244 ?auto_12282 ) ) ( not ( = ?auto_12246 ?auto_12279 ) ) ( not ( = ?auto_12246 ?auto_12260 ) ) ( not ( = ?auto_12271 ?auto_12277 ) ) ( not ( = ?auto_12271 ?auto_12264 ) ) ( not ( = ?auto_12272 ?auto_12269 ) ) ( not ( = ?auto_12272 ?auto_12262 ) ) ( not ( = ?auto_12282 ?auto_12279 ) ) ( not ( = ?auto_12282 ?auto_12260 ) ) ( not ( = ?auto_12243 ?auto_12247 ) ) ( not ( = ?auto_12243 ?auto_12263 ) ) ( not ( = ?auto_12244 ?auto_12247 ) ) ( not ( = ?auto_12244 ?auto_12263 ) ) ( not ( = ?auto_12245 ?auto_12247 ) ) ( not ( = ?auto_12245 ?auto_12263 ) ) ( not ( = ?auto_12247 ?auto_12282 ) ) ( not ( = ?auto_12247 ?auto_12279 ) ) ( not ( = ?auto_12247 ?auto_12260 ) ) ( not ( = ?auto_12261 ?auto_12271 ) ) ( not ( = ?auto_12261 ?auto_12277 ) ) ( not ( = ?auto_12261 ?auto_12264 ) ) ( not ( = ?auto_12276 ?auto_12272 ) ) ( not ( = ?auto_12276 ?auto_12269 ) ) ( not ( = ?auto_12276 ?auto_12262 ) ) ( not ( = ?auto_12263 ?auto_12282 ) ) ( not ( = ?auto_12263 ?auto_12279 ) ) ( not ( = ?auto_12263 ?auto_12260 ) ) ( not ( = ?auto_12243 ?auto_12248 ) ) ( not ( = ?auto_12243 ?auto_12273 ) ) ( not ( = ?auto_12244 ?auto_12248 ) ) ( not ( = ?auto_12244 ?auto_12273 ) ) ( not ( = ?auto_12245 ?auto_12248 ) ) ( not ( = ?auto_12245 ?auto_12273 ) ) ( not ( = ?auto_12246 ?auto_12248 ) ) ( not ( = ?auto_12246 ?auto_12273 ) ) ( not ( = ?auto_12248 ?auto_12263 ) ) ( not ( = ?auto_12248 ?auto_12282 ) ) ( not ( = ?auto_12248 ?auto_12279 ) ) ( not ( = ?auto_12248 ?auto_12260 ) ) ( not ( = ?auto_12273 ?auto_12263 ) ) ( not ( = ?auto_12273 ?auto_12282 ) ) ( not ( = ?auto_12273 ?auto_12279 ) ) ( not ( = ?auto_12273 ?auto_12260 ) ) ( not ( = ?auto_12243 ?auto_12249 ) ) ( not ( = ?auto_12243 ?auto_12278 ) ) ( not ( = ?auto_12244 ?auto_12249 ) ) ( not ( = ?auto_12244 ?auto_12278 ) ) ( not ( = ?auto_12245 ?auto_12249 ) ) ( not ( = ?auto_12245 ?auto_12278 ) ) ( not ( = ?auto_12246 ?auto_12249 ) ) ( not ( = ?auto_12246 ?auto_12278 ) ) ( not ( = ?auto_12247 ?auto_12249 ) ) ( not ( = ?auto_12247 ?auto_12278 ) ) ( not ( = ?auto_12249 ?auto_12273 ) ) ( not ( = ?auto_12249 ?auto_12263 ) ) ( not ( = ?auto_12249 ?auto_12282 ) ) ( not ( = ?auto_12249 ?auto_12279 ) ) ( not ( = ?auto_12249 ?auto_12260 ) ) ( not ( = ?auto_12274 ?auto_12277 ) ) ( not ( = ?auto_12274 ?auto_12261 ) ) ( not ( = ?auto_12274 ?auto_12271 ) ) ( not ( = ?auto_12274 ?auto_12264 ) ) ( not ( = ?auto_12267 ?auto_12269 ) ) ( not ( = ?auto_12267 ?auto_12276 ) ) ( not ( = ?auto_12267 ?auto_12272 ) ) ( not ( = ?auto_12267 ?auto_12262 ) ) ( not ( = ?auto_12278 ?auto_12273 ) ) ( not ( = ?auto_12278 ?auto_12263 ) ) ( not ( = ?auto_12278 ?auto_12282 ) ) ( not ( = ?auto_12278 ?auto_12279 ) ) ( not ( = ?auto_12278 ?auto_12260 ) ) ( not ( = ?auto_12243 ?auto_12252 ) ) ( not ( = ?auto_12243 ?auto_12266 ) ) ( not ( = ?auto_12244 ?auto_12252 ) ) ( not ( = ?auto_12244 ?auto_12266 ) ) ( not ( = ?auto_12245 ?auto_12252 ) ) ( not ( = ?auto_12245 ?auto_12266 ) ) ( not ( = ?auto_12246 ?auto_12252 ) ) ( not ( = ?auto_12246 ?auto_12266 ) ) ( not ( = ?auto_12247 ?auto_12252 ) ) ( not ( = ?auto_12247 ?auto_12266 ) ) ( not ( = ?auto_12248 ?auto_12252 ) ) ( not ( = ?auto_12248 ?auto_12266 ) ) ( not ( = ?auto_12252 ?auto_12278 ) ) ( not ( = ?auto_12252 ?auto_12273 ) ) ( not ( = ?auto_12252 ?auto_12263 ) ) ( not ( = ?auto_12252 ?auto_12282 ) ) ( not ( = ?auto_12252 ?auto_12279 ) ) ( not ( = ?auto_12252 ?auto_12260 ) ) ( not ( = ?auto_12266 ?auto_12278 ) ) ( not ( = ?auto_12266 ?auto_12273 ) ) ( not ( = ?auto_12266 ?auto_12263 ) ) ( not ( = ?auto_12266 ?auto_12282 ) ) ( not ( = ?auto_12266 ?auto_12279 ) ) ( not ( = ?auto_12266 ?auto_12260 ) ) ( not ( = ?auto_12243 ?auto_12251 ) ) ( not ( = ?auto_12243 ?auto_12268 ) ) ( not ( = ?auto_12244 ?auto_12251 ) ) ( not ( = ?auto_12244 ?auto_12268 ) ) ( not ( = ?auto_12245 ?auto_12251 ) ) ( not ( = ?auto_12245 ?auto_12268 ) ) ( not ( = ?auto_12246 ?auto_12251 ) ) ( not ( = ?auto_12246 ?auto_12268 ) ) ( not ( = ?auto_12247 ?auto_12251 ) ) ( not ( = ?auto_12247 ?auto_12268 ) ) ( not ( = ?auto_12248 ?auto_12251 ) ) ( not ( = ?auto_12248 ?auto_12268 ) ) ( not ( = ?auto_12249 ?auto_12251 ) ) ( not ( = ?auto_12249 ?auto_12268 ) ) ( not ( = ?auto_12251 ?auto_12266 ) ) ( not ( = ?auto_12251 ?auto_12278 ) ) ( not ( = ?auto_12251 ?auto_12273 ) ) ( not ( = ?auto_12251 ?auto_12263 ) ) ( not ( = ?auto_12251 ?auto_12282 ) ) ( not ( = ?auto_12251 ?auto_12279 ) ) ( not ( = ?auto_12251 ?auto_12260 ) ) ( not ( = ?auto_12270 ?auto_12264 ) ) ( not ( = ?auto_12270 ?auto_12274 ) ) ( not ( = ?auto_12270 ?auto_12277 ) ) ( not ( = ?auto_12270 ?auto_12261 ) ) ( not ( = ?auto_12270 ?auto_12271 ) ) ( not ( = ?auto_12281 ?auto_12262 ) ) ( not ( = ?auto_12281 ?auto_12267 ) ) ( not ( = ?auto_12281 ?auto_12269 ) ) ( not ( = ?auto_12281 ?auto_12276 ) ) ( not ( = ?auto_12281 ?auto_12272 ) ) ( not ( = ?auto_12268 ?auto_12266 ) ) ( not ( = ?auto_12268 ?auto_12278 ) ) ( not ( = ?auto_12268 ?auto_12273 ) ) ( not ( = ?auto_12268 ?auto_12263 ) ) ( not ( = ?auto_12268 ?auto_12282 ) ) ( not ( = ?auto_12268 ?auto_12279 ) ) ( not ( = ?auto_12268 ?auto_12260 ) ) ( not ( = ?auto_12243 ?auto_12250 ) ) ( not ( = ?auto_12243 ?auto_12280 ) ) ( not ( = ?auto_12244 ?auto_12250 ) ) ( not ( = ?auto_12244 ?auto_12280 ) ) ( not ( = ?auto_12245 ?auto_12250 ) ) ( not ( = ?auto_12245 ?auto_12280 ) ) ( not ( = ?auto_12246 ?auto_12250 ) ) ( not ( = ?auto_12246 ?auto_12280 ) ) ( not ( = ?auto_12247 ?auto_12250 ) ) ( not ( = ?auto_12247 ?auto_12280 ) ) ( not ( = ?auto_12248 ?auto_12250 ) ) ( not ( = ?auto_12248 ?auto_12280 ) ) ( not ( = ?auto_12249 ?auto_12250 ) ) ( not ( = ?auto_12249 ?auto_12280 ) ) ( not ( = ?auto_12252 ?auto_12250 ) ) ( not ( = ?auto_12252 ?auto_12280 ) ) ( not ( = ?auto_12250 ?auto_12268 ) ) ( not ( = ?auto_12250 ?auto_12266 ) ) ( not ( = ?auto_12250 ?auto_12278 ) ) ( not ( = ?auto_12250 ?auto_12273 ) ) ( not ( = ?auto_12250 ?auto_12263 ) ) ( not ( = ?auto_12250 ?auto_12282 ) ) ( not ( = ?auto_12250 ?auto_12279 ) ) ( not ( = ?auto_12250 ?auto_12260 ) ) ( not ( = ?auto_12265 ?auto_12270 ) ) ( not ( = ?auto_12265 ?auto_12264 ) ) ( not ( = ?auto_12265 ?auto_12274 ) ) ( not ( = ?auto_12265 ?auto_12277 ) ) ( not ( = ?auto_12265 ?auto_12261 ) ) ( not ( = ?auto_12265 ?auto_12271 ) ) ( not ( = ?auto_12275 ?auto_12281 ) ) ( not ( = ?auto_12275 ?auto_12262 ) ) ( not ( = ?auto_12275 ?auto_12267 ) ) ( not ( = ?auto_12275 ?auto_12269 ) ) ( not ( = ?auto_12275 ?auto_12276 ) ) ( not ( = ?auto_12275 ?auto_12272 ) ) ( not ( = ?auto_12280 ?auto_12268 ) ) ( not ( = ?auto_12280 ?auto_12266 ) ) ( not ( = ?auto_12280 ?auto_12278 ) ) ( not ( = ?auto_12280 ?auto_12273 ) ) ( not ( = ?auto_12280 ?auto_12263 ) ) ( not ( = ?auto_12280 ?auto_12282 ) ) ( not ( = ?auto_12280 ?auto_12279 ) ) ( not ( = ?auto_12280 ?auto_12260 ) ) ( not ( = ?auto_12243 ?auto_12253 ) ) ( not ( = ?auto_12243 ?auto_12254 ) ) ( not ( = ?auto_12244 ?auto_12253 ) ) ( not ( = ?auto_12244 ?auto_12254 ) ) ( not ( = ?auto_12245 ?auto_12253 ) ) ( not ( = ?auto_12245 ?auto_12254 ) ) ( not ( = ?auto_12246 ?auto_12253 ) ) ( not ( = ?auto_12246 ?auto_12254 ) ) ( not ( = ?auto_12247 ?auto_12253 ) ) ( not ( = ?auto_12247 ?auto_12254 ) ) ( not ( = ?auto_12248 ?auto_12253 ) ) ( not ( = ?auto_12248 ?auto_12254 ) ) ( not ( = ?auto_12249 ?auto_12253 ) ) ( not ( = ?auto_12249 ?auto_12254 ) ) ( not ( = ?auto_12252 ?auto_12253 ) ) ( not ( = ?auto_12252 ?auto_12254 ) ) ( not ( = ?auto_12251 ?auto_12253 ) ) ( not ( = ?auto_12251 ?auto_12254 ) ) ( not ( = ?auto_12253 ?auto_12280 ) ) ( not ( = ?auto_12253 ?auto_12268 ) ) ( not ( = ?auto_12253 ?auto_12266 ) ) ( not ( = ?auto_12253 ?auto_12278 ) ) ( not ( = ?auto_12253 ?auto_12273 ) ) ( not ( = ?auto_12253 ?auto_12263 ) ) ( not ( = ?auto_12253 ?auto_12282 ) ) ( not ( = ?auto_12253 ?auto_12279 ) ) ( not ( = ?auto_12253 ?auto_12260 ) ) ( not ( = ?auto_12259 ?auto_12265 ) ) ( not ( = ?auto_12259 ?auto_12270 ) ) ( not ( = ?auto_12259 ?auto_12264 ) ) ( not ( = ?auto_12259 ?auto_12274 ) ) ( not ( = ?auto_12259 ?auto_12277 ) ) ( not ( = ?auto_12259 ?auto_12261 ) ) ( not ( = ?auto_12259 ?auto_12271 ) ) ( not ( = ?auto_12258 ?auto_12275 ) ) ( not ( = ?auto_12258 ?auto_12281 ) ) ( not ( = ?auto_12258 ?auto_12262 ) ) ( not ( = ?auto_12258 ?auto_12267 ) ) ( not ( = ?auto_12258 ?auto_12269 ) ) ( not ( = ?auto_12258 ?auto_12276 ) ) ( not ( = ?auto_12258 ?auto_12272 ) ) ( not ( = ?auto_12254 ?auto_12280 ) ) ( not ( = ?auto_12254 ?auto_12268 ) ) ( not ( = ?auto_12254 ?auto_12266 ) ) ( not ( = ?auto_12254 ?auto_12278 ) ) ( not ( = ?auto_12254 ?auto_12273 ) ) ( not ( = ?auto_12254 ?auto_12263 ) ) ( not ( = ?auto_12254 ?auto_12282 ) ) ( not ( = ?auto_12254 ?auto_12279 ) ) ( not ( = ?auto_12254 ?auto_12260 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_12243 ?auto_12244 ?auto_12245 ?auto_12246 ?auto_12247 ?auto_12248 ?auto_12249 ?auto_12252 ?auto_12251 ?auto_12250 )
      ( MAKE-1CRATE ?auto_12250 ?auto_12253 )
      ( MAKE-10CRATE-VERIFY ?auto_12243 ?auto_12244 ?auto_12245 ?auto_12246 ?auto_12247 ?auto_12248 ?auto_12249 ?auto_12252 ?auto_12251 ?auto_12250 ?auto_12253 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12285 - SURFACE
      ?auto_12286 - SURFACE
    )
    :vars
    (
      ?auto_12287 - HOIST
      ?auto_12288 - PLACE
      ?auto_12290 - PLACE
      ?auto_12291 - HOIST
      ?auto_12292 - SURFACE
      ?auto_12289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12287 ?auto_12288 ) ( SURFACE-AT ?auto_12285 ?auto_12288 ) ( CLEAR ?auto_12285 ) ( IS-CRATE ?auto_12286 ) ( AVAILABLE ?auto_12287 ) ( not ( = ?auto_12290 ?auto_12288 ) ) ( HOIST-AT ?auto_12291 ?auto_12290 ) ( AVAILABLE ?auto_12291 ) ( SURFACE-AT ?auto_12286 ?auto_12290 ) ( ON ?auto_12286 ?auto_12292 ) ( CLEAR ?auto_12286 ) ( TRUCK-AT ?auto_12289 ?auto_12288 ) ( not ( = ?auto_12285 ?auto_12286 ) ) ( not ( = ?auto_12285 ?auto_12292 ) ) ( not ( = ?auto_12286 ?auto_12292 ) ) ( not ( = ?auto_12287 ?auto_12291 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12289 ?auto_12288 ?auto_12290 )
      ( !LIFT ?auto_12291 ?auto_12286 ?auto_12292 ?auto_12290 )
      ( !LOAD ?auto_12291 ?auto_12286 ?auto_12289 ?auto_12290 )
      ( !DRIVE ?auto_12289 ?auto_12290 ?auto_12288 )
      ( !UNLOAD ?auto_12287 ?auto_12286 ?auto_12289 ?auto_12288 )
      ( !DROP ?auto_12287 ?auto_12286 ?auto_12285 ?auto_12288 )
      ( MAKE-1CRATE-VERIFY ?auto_12285 ?auto_12286 ) )
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
      ?auto_12314 - SURFACE
      ?auto_12313 - SURFACE
      ?auto_12312 - SURFACE
      ?auto_12315 - SURFACE
      ?auto_12316 - SURFACE
    )
    :vars
    (
      ?auto_12319 - HOIST
      ?auto_12317 - PLACE
      ?auto_12321 - PLACE
      ?auto_12322 - HOIST
      ?auto_12318 - SURFACE
      ?auto_12342 - PLACE
      ?auto_12324 - HOIST
      ?auto_12339 - SURFACE
      ?auto_12344 - PLACE
      ?auto_12337 - HOIST
      ?auto_12331 - SURFACE
      ?auto_12341 - PLACE
      ?auto_12333 - HOIST
      ?auto_12343 - SURFACE
      ?auto_12335 - SURFACE
      ?auto_12340 - PLACE
      ?auto_12329 - HOIST
      ?auto_12346 - SURFACE
      ?auto_12328 - PLACE
      ?auto_12323 - HOIST
      ?auto_12336 - SURFACE
      ?auto_12334 - PLACE
      ?auto_12326 - HOIST
      ?auto_12325 - SURFACE
      ?auto_12327 - PLACE
      ?auto_12338 - HOIST
      ?auto_12330 - SURFACE
      ?auto_12332 - SURFACE
      ?auto_12345 - SURFACE
      ?auto_12320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12319 ?auto_12317 ) ( IS-CRATE ?auto_12316 ) ( not ( = ?auto_12321 ?auto_12317 ) ) ( HOIST-AT ?auto_12322 ?auto_12321 ) ( SURFACE-AT ?auto_12316 ?auto_12321 ) ( ON ?auto_12316 ?auto_12318 ) ( CLEAR ?auto_12316 ) ( not ( = ?auto_12315 ?auto_12316 ) ) ( not ( = ?auto_12315 ?auto_12318 ) ) ( not ( = ?auto_12316 ?auto_12318 ) ) ( not ( = ?auto_12319 ?auto_12322 ) ) ( IS-CRATE ?auto_12315 ) ( not ( = ?auto_12342 ?auto_12317 ) ) ( HOIST-AT ?auto_12324 ?auto_12342 ) ( AVAILABLE ?auto_12324 ) ( SURFACE-AT ?auto_12315 ?auto_12342 ) ( ON ?auto_12315 ?auto_12339 ) ( CLEAR ?auto_12315 ) ( not ( = ?auto_12312 ?auto_12315 ) ) ( not ( = ?auto_12312 ?auto_12339 ) ) ( not ( = ?auto_12315 ?auto_12339 ) ) ( not ( = ?auto_12319 ?auto_12324 ) ) ( IS-CRATE ?auto_12312 ) ( not ( = ?auto_12344 ?auto_12317 ) ) ( HOIST-AT ?auto_12337 ?auto_12344 ) ( AVAILABLE ?auto_12337 ) ( SURFACE-AT ?auto_12312 ?auto_12344 ) ( ON ?auto_12312 ?auto_12331 ) ( CLEAR ?auto_12312 ) ( not ( = ?auto_12313 ?auto_12312 ) ) ( not ( = ?auto_12313 ?auto_12331 ) ) ( not ( = ?auto_12312 ?auto_12331 ) ) ( not ( = ?auto_12319 ?auto_12337 ) ) ( IS-CRATE ?auto_12313 ) ( not ( = ?auto_12341 ?auto_12317 ) ) ( HOIST-AT ?auto_12333 ?auto_12341 ) ( AVAILABLE ?auto_12333 ) ( SURFACE-AT ?auto_12313 ?auto_12341 ) ( ON ?auto_12313 ?auto_12343 ) ( CLEAR ?auto_12313 ) ( not ( = ?auto_12314 ?auto_12313 ) ) ( not ( = ?auto_12314 ?auto_12343 ) ) ( not ( = ?auto_12313 ?auto_12343 ) ) ( not ( = ?auto_12319 ?auto_12333 ) ) ( IS-CRATE ?auto_12314 ) ( SURFACE-AT ?auto_12314 ?auto_12321 ) ( ON ?auto_12314 ?auto_12335 ) ( CLEAR ?auto_12314 ) ( not ( = ?auto_12311 ?auto_12314 ) ) ( not ( = ?auto_12311 ?auto_12335 ) ) ( not ( = ?auto_12314 ?auto_12335 ) ) ( IS-CRATE ?auto_12311 ) ( not ( = ?auto_12340 ?auto_12317 ) ) ( HOIST-AT ?auto_12329 ?auto_12340 ) ( AVAILABLE ?auto_12329 ) ( SURFACE-AT ?auto_12311 ?auto_12340 ) ( ON ?auto_12311 ?auto_12346 ) ( CLEAR ?auto_12311 ) ( not ( = ?auto_12310 ?auto_12311 ) ) ( not ( = ?auto_12310 ?auto_12346 ) ) ( not ( = ?auto_12311 ?auto_12346 ) ) ( not ( = ?auto_12319 ?auto_12329 ) ) ( IS-CRATE ?auto_12310 ) ( not ( = ?auto_12328 ?auto_12317 ) ) ( HOIST-AT ?auto_12323 ?auto_12328 ) ( SURFACE-AT ?auto_12310 ?auto_12328 ) ( ON ?auto_12310 ?auto_12336 ) ( CLEAR ?auto_12310 ) ( not ( = ?auto_12309 ?auto_12310 ) ) ( not ( = ?auto_12309 ?auto_12336 ) ) ( not ( = ?auto_12310 ?auto_12336 ) ) ( not ( = ?auto_12319 ?auto_12323 ) ) ( IS-CRATE ?auto_12309 ) ( not ( = ?auto_12334 ?auto_12317 ) ) ( HOIST-AT ?auto_12326 ?auto_12334 ) ( AVAILABLE ?auto_12326 ) ( SURFACE-AT ?auto_12309 ?auto_12334 ) ( ON ?auto_12309 ?auto_12325 ) ( CLEAR ?auto_12309 ) ( not ( = ?auto_12308 ?auto_12309 ) ) ( not ( = ?auto_12308 ?auto_12325 ) ) ( not ( = ?auto_12309 ?auto_12325 ) ) ( not ( = ?auto_12319 ?auto_12326 ) ) ( IS-CRATE ?auto_12308 ) ( not ( = ?auto_12327 ?auto_12317 ) ) ( HOIST-AT ?auto_12338 ?auto_12327 ) ( AVAILABLE ?auto_12338 ) ( SURFACE-AT ?auto_12308 ?auto_12327 ) ( ON ?auto_12308 ?auto_12330 ) ( CLEAR ?auto_12308 ) ( not ( = ?auto_12307 ?auto_12308 ) ) ( not ( = ?auto_12307 ?auto_12330 ) ) ( not ( = ?auto_12308 ?auto_12330 ) ) ( not ( = ?auto_12319 ?auto_12338 ) ) ( IS-CRATE ?auto_12307 ) ( AVAILABLE ?auto_12323 ) ( SURFACE-AT ?auto_12307 ?auto_12328 ) ( ON ?auto_12307 ?auto_12332 ) ( CLEAR ?auto_12307 ) ( not ( = ?auto_12306 ?auto_12307 ) ) ( not ( = ?auto_12306 ?auto_12332 ) ) ( not ( = ?auto_12307 ?auto_12332 ) ) ( SURFACE-AT ?auto_12305 ?auto_12317 ) ( CLEAR ?auto_12305 ) ( IS-CRATE ?auto_12306 ) ( AVAILABLE ?auto_12319 ) ( AVAILABLE ?auto_12322 ) ( SURFACE-AT ?auto_12306 ?auto_12321 ) ( ON ?auto_12306 ?auto_12345 ) ( CLEAR ?auto_12306 ) ( TRUCK-AT ?auto_12320 ?auto_12317 ) ( not ( = ?auto_12305 ?auto_12306 ) ) ( not ( = ?auto_12305 ?auto_12345 ) ) ( not ( = ?auto_12306 ?auto_12345 ) ) ( not ( = ?auto_12305 ?auto_12307 ) ) ( not ( = ?auto_12305 ?auto_12332 ) ) ( not ( = ?auto_12307 ?auto_12345 ) ) ( not ( = ?auto_12328 ?auto_12321 ) ) ( not ( = ?auto_12323 ?auto_12322 ) ) ( not ( = ?auto_12332 ?auto_12345 ) ) ( not ( = ?auto_12305 ?auto_12308 ) ) ( not ( = ?auto_12305 ?auto_12330 ) ) ( not ( = ?auto_12306 ?auto_12308 ) ) ( not ( = ?auto_12306 ?auto_12330 ) ) ( not ( = ?auto_12308 ?auto_12332 ) ) ( not ( = ?auto_12308 ?auto_12345 ) ) ( not ( = ?auto_12327 ?auto_12328 ) ) ( not ( = ?auto_12327 ?auto_12321 ) ) ( not ( = ?auto_12338 ?auto_12323 ) ) ( not ( = ?auto_12338 ?auto_12322 ) ) ( not ( = ?auto_12330 ?auto_12332 ) ) ( not ( = ?auto_12330 ?auto_12345 ) ) ( not ( = ?auto_12305 ?auto_12309 ) ) ( not ( = ?auto_12305 ?auto_12325 ) ) ( not ( = ?auto_12306 ?auto_12309 ) ) ( not ( = ?auto_12306 ?auto_12325 ) ) ( not ( = ?auto_12307 ?auto_12309 ) ) ( not ( = ?auto_12307 ?auto_12325 ) ) ( not ( = ?auto_12309 ?auto_12330 ) ) ( not ( = ?auto_12309 ?auto_12332 ) ) ( not ( = ?auto_12309 ?auto_12345 ) ) ( not ( = ?auto_12334 ?auto_12327 ) ) ( not ( = ?auto_12334 ?auto_12328 ) ) ( not ( = ?auto_12334 ?auto_12321 ) ) ( not ( = ?auto_12326 ?auto_12338 ) ) ( not ( = ?auto_12326 ?auto_12323 ) ) ( not ( = ?auto_12326 ?auto_12322 ) ) ( not ( = ?auto_12325 ?auto_12330 ) ) ( not ( = ?auto_12325 ?auto_12332 ) ) ( not ( = ?auto_12325 ?auto_12345 ) ) ( not ( = ?auto_12305 ?auto_12310 ) ) ( not ( = ?auto_12305 ?auto_12336 ) ) ( not ( = ?auto_12306 ?auto_12310 ) ) ( not ( = ?auto_12306 ?auto_12336 ) ) ( not ( = ?auto_12307 ?auto_12310 ) ) ( not ( = ?auto_12307 ?auto_12336 ) ) ( not ( = ?auto_12308 ?auto_12310 ) ) ( not ( = ?auto_12308 ?auto_12336 ) ) ( not ( = ?auto_12310 ?auto_12325 ) ) ( not ( = ?auto_12310 ?auto_12330 ) ) ( not ( = ?auto_12310 ?auto_12332 ) ) ( not ( = ?auto_12310 ?auto_12345 ) ) ( not ( = ?auto_12336 ?auto_12325 ) ) ( not ( = ?auto_12336 ?auto_12330 ) ) ( not ( = ?auto_12336 ?auto_12332 ) ) ( not ( = ?auto_12336 ?auto_12345 ) ) ( not ( = ?auto_12305 ?auto_12311 ) ) ( not ( = ?auto_12305 ?auto_12346 ) ) ( not ( = ?auto_12306 ?auto_12311 ) ) ( not ( = ?auto_12306 ?auto_12346 ) ) ( not ( = ?auto_12307 ?auto_12311 ) ) ( not ( = ?auto_12307 ?auto_12346 ) ) ( not ( = ?auto_12308 ?auto_12311 ) ) ( not ( = ?auto_12308 ?auto_12346 ) ) ( not ( = ?auto_12309 ?auto_12311 ) ) ( not ( = ?auto_12309 ?auto_12346 ) ) ( not ( = ?auto_12311 ?auto_12336 ) ) ( not ( = ?auto_12311 ?auto_12325 ) ) ( not ( = ?auto_12311 ?auto_12330 ) ) ( not ( = ?auto_12311 ?auto_12332 ) ) ( not ( = ?auto_12311 ?auto_12345 ) ) ( not ( = ?auto_12340 ?auto_12328 ) ) ( not ( = ?auto_12340 ?auto_12334 ) ) ( not ( = ?auto_12340 ?auto_12327 ) ) ( not ( = ?auto_12340 ?auto_12321 ) ) ( not ( = ?auto_12329 ?auto_12323 ) ) ( not ( = ?auto_12329 ?auto_12326 ) ) ( not ( = ?auto_12329 ?auto_12338 ) ) ( not ( = ?auto_12329 ?auto_12322 ) ) ( not ( = ?auto_12346 ?auto_12336 ) ) ( not ( = ?auto_12346 ?auto_12325 ) ) ( not ( = ?auto_12346 ?auto_12330 ) ) ( not ( = ?auto_12346 ?auto_12332 ) ) ( not ( = ?auto_12346 ?auto_12345 ) ) ( not ( = ?auto_12305 ?auto_12314 ) ) ( not ( = ?auto_12305 ?auto_12335 ) ) ( not ( = ?auto_12306 ?auto_12314 ) ) ( not ( = ?auto_12306 ?auto_12335 ) ) ( not ( = ?auto_12307 ?auto_12314 ) ) ( not ( = ?auto_12307 ?auto_12335 ) ) ( not ( = ?auto_12308 ?auto_12314 ) ) ( not ( = ?auto_12308 ?auto_12335 ) ) ( not ( = ?auto_12309 ?auto_12314 ) ) ( not ( = ?auto_12309 ?auto_12335 ) ) ( not ( = ?auto_12310 ?auto_12314 ) ) ( not ( = ?auto_12310 ?auto_12335 ) ) ( not ( = ?auto_12314 ?auto_12346 ) ) ( not ( = ?auto_12314 ?auto_12336 ) ) ( not ( = ?auto_12314 ?auto_12325 ) ) ( not ( = ?auto_12314 ?auto_12330 ) ) ( not ( = ?auto_12314 ?auto_12332 ) ) ( not ( = ?auto_12314 ?auto_12345 ) ) ( not ( = ?auto_12335 ?auto_12346 ) ) ( not ( = ?auto_12335 ?auto_12336 ) ) ( not ( = ?auto_12335 ?auto_12325 ) ) ( not ( = ?auto_12335 ?auto_12330 ) ) ( not ( = ?auto_12335 ?auto_12332 ) ) ( not ( = ?auto_12335 ?auto_12345 ) ) ( not ( = ?auto_12305 ?auto_12313 ) ) ( not ( = ?auto_12305 ?auto_12343 ) ) ( not ( = ?auto_12306 ?auto_12313 ) ) ( not ( = ?auto_12306 ?auto_12343 ) ) ( not ( = ?auto_12307 ?auto_12313 ) ) ( not ( = ?auto_12307 ?auto_12343 ) ) ( not ( = ?auto_12308 ?auto_12313 ) ) ( not ( = ?auto_12308 ?auto_12343 ) ) ( not ( = ?auto_12309 ?auto_12313 ) ) ( not ( = ?auto_12309 ?auto_12343 ) ) ( not ( = ?auto_12310 ?auto_12313 ) ) ( not ( = ?auto_12310 ?auto_12343 ) ) ( not ( = ?auto_12311 ?auto_12313 ) ) ( not ( = ?auto_12311 ?auto_12343 ) ) ( not ( = ?auto_12313 ?auto_12335 ) ) ( not ( = ?auto_12313 ?auto_12346 ) ) ( not ( = ?auto_12313 ?auto_12336 ) ) ( not ( = ?auto_12313 ?auto_12325 ) ) ( not ( = ?auto_12313 ?auto_12330 ) ) ( not ( = ?auto_12313 ?auto_12332 ) ) ( not ( = ?auto_12313 ?auto_12345 ) ) ( not ( = ?auto_12341 ?auto_12321 ) ) ( not ( = ?auto_12341 ?auto_12340 ) ) ( not ( = ?auto_12341 ?auto_12328 ) ) ( not ( = ?auto_12341 ?auto_12334 ) ) ( not ( = ?auto_12341 ?auto_12327 ) ) ( not ( = ?auto_12333 ?auto_12322 ) ) ( not ( = ?auto_12333 ?auto_12329 ) ) ( not ( = ?auto_12333 ?auto_12323 ) ) ( not ( = ?auto_12333 ?auto_12326 ) ) ( not ( = ?auto_12333 ?auto_12338 ) ) ( not ( = ?auto_12343 ?auto_12335 ) ) ( not ( = ?auto_12343 ?auto_12346 ) ) ( not ( = ?auto_12343 ?auto_12336 ) ) ( not ( = ?auto_12343 ?auto_12325 ) ) ( not ( = ?auto_12343 ?auto_12330 ) ) ( not ( = ?auto_12343 ?auto_12332 ) ) ( not ( = ?auto_12343 ?auto_12345 ) ) ( not ( = ?auto_12305 ?auto_12312 ) ) ( not ( = ?auto_12305 ?auto_12331 ) ) ( not ( = ?auto_12306 ?auto_12312 ) ) ( not ( = ?auto_12306 ?auto_12331 ) ) ( not ( = ?auto_12307 ?auto_12312 ) ) ( not ( = ?auto_12307 ?auto_12331 ) ) ( not ( = ?auto_12308 ?auto_12312 ) ) ( not ( = ?auto_12308 ?auto_12331 ) ) ( not ( = ?auto_12309 ?auto_12312 ) ) ( not ( = ?auto_12309 ?auto_12331 ) ) ( not ( = ?auto_12310 ?auto_12312 ) ) ( not ( = ?auto_12310 ?auto_12331 ) ) ( not ( = ?auto_12311 ?auto_12312 ) ) ( not ( = ?auto_12311 ?auto_12331 ) ) ( not ( = ?auto_12314 ?auto_12312 ) ) ( not ( = ?auto_12314 ?auto_12331 ) ) ( not ( = ?auto_12312 ?auto_12343 ) ) ( not ( = ?auto_12312 ?auto_12335 ) ) ( not ( = ?auto_12312 ?auto_12346 ) ) ( not ( = ?auto_12312 ?auto_12336 ) ) ( not ( = ?auto_12312 ?auto_12325 ) ) ( not ( = ?auto_12312 ?auto_12330 ) ) ( not ( = ?auto_12312 ?auto_12332 ) ) ( not ( = ?auto_12312 ?auto_12345 ) ) ( not ( = ?auto_12344 ?auto_12341 ) ) ( not ( = ?auto_12344 ?auto_12321 ) ) ( not ( = ?auto_12344 ?auto_12340 ) ) ( not ( = ?auto_12344 ?auto_12328 ) ) ( not ( = ?auto_12344 ?auto_12334 ) ) ( not ( = ?auto_12344 ?auto_12327 ) ) ( not ( = ?auto_12337 ?auto_12333 ) ) ( not ( = ?auto_12337 ?auto_12322 ) ) ( not ( = ?auto_12337 ?auto_12329 ) ) ( not ( = ?auto_12337 ?auto_12323 ) ) ( not ( = ?auto_12337 ?auto_12326 ) ) ( not ( = ?auto_12337 ?auto_12338 ) ) ( not ( = ?auto_12331 ?auto_12343 ) ) ( not ( = ?auto_12331 ?auto_12335 ) ) ( not ( = ?auto_12331 ?auto_12346 ) ) ( not ( = ?auto_12331 ?auto_12336 ) ) ( not ( = ?auto_12331 ?auto_12325 ) ) ( not ( = ?auto_12331 ?auto_12330 ) ) ( not ( = ?auto_12331 ?auto_12332 ) ) ( not ( = ?auto_12331 ?auto_12345 ) ) ( not ( = ?auto_12305 ?auto_12315 ) ) ( not ( = ?auto_12305 ?auto_12339 ) ) ( not ( = ?auto_12306 ?auto_12315 ) ) ( not ( = ?auto_12306 ?auto_12339 ) ) ( not ( = ?auto_12307 ?auto_12315 ) ) ( not ( = ?auto_12307 ?auto_12339 ) ) ( not ( = ?auto_12308 ?auto_12315 ) ) ( not ( = ?auto_12308 ?auto_12339 ) ) ( not ( = ?auto_12309 ?auto_12315 ) ) ( not ( = ?auto_12309 ?auto_12339 ) ) ( not ( = ?auto_12310 ?auto_12315 ) ) ( not ( = ?auto_12310 ?auto_12339 ) ) ( not ( = ?auto_12311 ?auto_12315 ) ) ( not ( = ?auto_12311 ?auto_12339 ) ) ( not ( = ?auto_12314 ?auto_12315 ) ) ( not ( = ?auto_12314 ?auto_12339 ) ) ( not ( = ?auto_12313 ?auto_12315 ) ) ( not ( = ?auto_12313 ?auto_12339 ) ) ( not ( = ?auto_12315 ?auto_12331 ) ) ( not ( = ?auto_12315 ?auto_12343 ) ) ( not ( = ?auto_12315 ?auto_12335 ) ) ( not ( = ?auto_12315 ?auto_12346 ) ) ( not ( = ?auto_12315 ?auto_12336 ) ) ( not ( = ?auto_12315 ?auto_12325 ) ) ( not ( = ?auto_12315 ?auto_12330 ) ) ( not ( = ?auto_12315 ?auto_12332 ) ) ( not ( = ?auto_12315 ?auto_12345 ) ) ( not ( = ?auto_12342 ?auto_12344 ) ) ( not ( = ?auto_12342 ?auto_12341 ) ) ( not ( = ?auto_12342 ?auto_12321 ) ) ( not ( = ?auto_12342 ?auto_12340 ) ) ( not ( = ?auto_12342 ?auto_12328 ) ) ( not ( = ?auto_12342 ?auto_12334 ) ) ( not ( = ?auto_12342 ?auto_12327 ) ) ( not ( = ?auto_12324 ?auto_12337 ) ) ( not ( = ?auto_12324 ?auto_12333 ) ) ( not ( = ?auto_12324 ?auto_12322 ) ) ( not ( = ?auto_12324 ?auto_12329 ) ) ( not ( = ?auto_12324 ?auto_12323 ) ) ( not ( = ?auto_12324 ?auto_12326 ) ) ( not ( = ?auto_12324 ?auto_12338 ) ) ( not ( = ?auto_12339 ?auto_12331 ) ) ( not ( = ?auto_12339 ?auto_12343 ) ) ( not ( = ?auto_12339 ?auto_12335 ) ) ( not ( = ?auto_12339 ?auto_12346 ) ) ( not ( = ?auto_12339 ?auto_12336 ) ) ( not ( = ?auto_12339 ?auto_12325 ) ) ( not ( = ?auto_12339 ?auto_12330 ) ) ( not ( = ?auto_12339 ?auto_12332 ) ) ( not ( = ?auto_12339 ?auto_12345 ) ) ( not ( = ?auto_12305 ?auto_12316 ) ) ( not ( = ?auto_12305 ?auto_12318 ) ) ( not ( = ?auto_12306 ?auto_12316 ) ) ( not ( = ?auto_12306 ?auto_12318 ) ) ( not ( = ?auto_12307 ?auto_12316 ) ) ( not ( = ?auto_12307 ?auto_12318 ) ) ( not ( = ?auto_12308 ?auto_12316 ) ) ( not ( = ?auto_12308 ?auto_12318 ) ) ( not ( = ?auto_12309 ?auto_12316 ) ) ( not ( = ?auto_12309 ?auto_12318 ) ) ( not ( = ?auto_12310 ?auto_12316 ) ) ( not ( = ?auto_12310 ?auto_12318 ) ) ( not ( = ?auto_12311 ?auto_12316 ) ) ( not ( = ?auto_12311 ?auto_12318 ) ) ( not ( = ?auto_12314 ?auto_12316 ) ) ( not ( = ?auto_12314 ?auto_12318 ) ) ( not ( = ?auto_12313 ?auto_12316 ) ) ( not ( = ?auto_12313 ?auto_12318 ) ) ( not ( = ?auto_12312 ?auto_12316 ) ) ( not ( = ?auto_12312 ?auto_12318 ) ) ( not ( = ?auto_12316 ?auto_12339 ) ) ( not ( = ?auto_12316 ?auto_12331 ) ) ( not ( = ?auto_12316 ?auto_12343 ) ) ( not ( = ?auto_12316 ?auto_12335 ) ) ( not ( = ?auto_12316 ?auto_12346 ) ) ( not ( = ?auto_12316 ?auto_12336 ) ) ( not ( = ?auto_12316 ?auto_12325 ) ) ( not ( = ?auto_12316 ?auto_12330 ) ) ( not ( = ?auto_12316 ?auto_12332 ) ) ( not ( = ?auto_12316 ?auto_12345 ) ) ( not ( = ?auto_12318 ?auto_12339 ) ) ( not ( = ?auto_12318 ?auto_12331 ) ) ( not ( = ?auto_12318 ?auto_12343 ) ) ( not ( = ?auto_12318 ?auto_12335 ) ) ( not ( = ?auto_12318 ?auto_12346 ) ) ( not ( = ?auto_12318 ?auto_12336 ) ) ( not ( = ?auto_12318 ?auto_12325 ) ) ( not ( = ?auto_12318 ?auto_12330 ) ) ( not ( = ?auto_12318 ?auto_12332 ) ) ( not ( = ?auto_12318 ?auto_12345 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_12305 ?auto_12306 ?auto_12307 ?auto_12308 ?auto_12309 ?auto_12310 ?auto_12311 ?auto_12314 ?auto_12313 ?auto_12312 ?auto_12315 )
      ( MAKE-1CRATE ?auto_12315 ?auto_12316 )
      ( MAKE-11CRATE-VERIFY ?auto_12305 ?auto_12306 ?auto_12307 ?auto_12308 ?auto_12309 ?auto_12310 ?auto_12311 ?auto_12314 ?auto_12313 ?auto_12312 ?auto_12315 ?auto_12316 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12349 - SURFACE
      ?auto_12350 - SURFACE
    )
    :vars
    (
      ?auto_12351 - HOIST
      ?auto_12352 - PLACE
      ?auto_12354 - PLACE
      ?auto_12355 - HOIST
      ?auto_12356 - SURFACE
      ?auto_12353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12351 ?auto_12352 ) ( SURFACE-AT ?auto_12349 ?auto_12352 ) ( CLEAR ?auto_12349 ) ( IS-CRATE ?auto_12350 ) ( AVAILABLE ?auto_12351 ) ( not ( = ?auto_12354 ?auto_12352 ) ) ( HOIST-AT ?auto_12355 ?auto_12354 ) ( AVAILABLE ?auto_12355 ) ( SURFACE-AT ?auto_12350 ?auto_12354 ) ( ON ?auto_12350 ?auto_12356 ) ( CLEAR ?auto_12350 ) ( TRUCK-AT ?auto_12353 ?auto_12352 ) ( not ( = ?auto_12349 ?auto_12350 ) ) ( not ( = ?auto_12349 ?auto_12356 ) ) ( not ( = ?auto_12350 ?auto_12356 ) ) ( not ( = ?auto_12351 ?auto_12355 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12353 ?auto_12352 ?auto_12354 )
      ( !LIFT ?auto_12355 ?auto_12350 ?auto_12356 ?auto_12354 )
      ( !LOAD ?auto_12355 ?auto_12350 ?auto_12353 ?auto_12354 )
      ( !DRIVE ?auto_12353 ?auto_12354 ?auto_12352 )
      ( !UNLOAD ?auto_12351 ?auto_12350 ?auto_12353 ?auto_12352 )
      ( !DROP ?auto_12351 ?auto_12350 ?auto_12349 ?auto_12352 )
      ( MAKE-1CRATE-VERIFY ?auto_12349 ?auto_12350 ) )
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
      ?auto_12379 - SURFACE
      ?auto_12378 - SURFACE
      ?auto_12377 - SURFACE
      ?auto_12380 - SURFACE
      ?auto_12381 - SURFACE
      ?auto_12382 - SURFACE
    )
    :vars
    (
      ?auto_12387 - HOIST
      ?auto_12388 - PLACE
      ?auto_12385 - PLACE
      ?auto_12386 - HOIST
      ?auto_12384 - SURFACE
      ?auto_12398 - PLACE
      ?auto_12400 - HOIST
      ?auto_12412 - SURFACE
      ?auto_12389 - PLACE
      ?auto_12397 - HOIST
      ?auto_12406 - SURFACE
      ?auto_12393 - SURFACE
      ?auto_12391 - PLACE
      ?auto_12402 - HOIST
      ?auto_12401 - SURFACE
      ?auto_12410 - SURFACE
      ?auto_12408 - PLACE
      ?auto_12407 - HOIST
      ?auto_12404 - SURFACE
      ?auto_12394 - PLACE
      ?auto_12395 - HOIST
      ?auto_12399 - SURFACE
      ?auto_12413 - PLACE
      ?auto_12392 - HOIST
      ?auto_12405 - SURFACE
      ?auto_12411 - PLACE
      ?auto_12390 - HOIST
      ?auto_12409 - SURFACE
      ?auto_12403 - SURFACE
      ?auto_12396 - SURFACE
      ?auto_12383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12387 ?auto_12388 ) ( IS-CRATE ?auto_12382 ) ( not ( = ?auto_12385 ?auto_12388 ) ) ( HOIST-AT ?auto_12386 ?auto_12385 ) ( SURFACE-AT ?auto_12382 ?auto_12385 ) ( ON ?auto_12382 ?auto_12384 ) ( CLEAR ?auto_12382 ) ( not ( = ?auto_12381 ?auto_12382 ) ) ( not ( = ?auto_12381 ?auto_12384 ) ) ( not ( = ?auto_12382 ?auto_12384 ) ) ( not ( = ?auto_12387 ?auto_12386 ) ) ( IS-CRATE ?auto_12381 ) ( not ( = ?auto_12398 ?auto_12388 ) ) ( HOIST-AT ?auto_12400 ?auto_12398 ) ( SURFACE-AT ?auto_12381 ?auto_12398 ) ( ON ?auto_12381 ?auto_12412 ) ( CLEAR ?auto_12381 ) ( not ( = ?auto_12380 ?auto_12381 ) ) ( not ( = ?auto_12380 ?auto_12412 ) ) ( not ( = ?auto_12381 ?auto_12412 ) ) ( not ( = ?auto_12387 ?auto_12400 ) ) ( IS-CRATE ?auto_12380 ) ( not ( = ?auto_12389 ?auto_12388 ) ) ( HOIST-AT ?auto_12397 ?auto_12389 ) ( AVAILABLE ?auto_12397 ) ( SURFACE-AT ?auto_12380 ?auto_12389 ) ( ON ?auto_12380 ?auto_12406 ) ( CLEAR ?auto_12380 ) ( not ( = ?auto_12377 ?auto_12380 ) ) ( not ( = ?auto_12377 ?auto_12406 ) ) ( not ( = ?auto_12380 ?auto_12406 ) ) ( not ( = ?auto_12387 ?auto_12397 ) ) ( IS-CRATE ?auto_12377 ) ( AVAILABLE ?auto_12386 ) ( SURFACE-AT ?auto_12377 ?auto_12385 ) ( ON ?auto_12377 ?auto_12393 ) ( CLEAR ?auto_12377 ) ( not ( = ?auto_12378 ?auto_12377 ) ) ( not ( = ?auto_12378 ?auto_12393 ) ) ( not ( = ?auto_12377 ?auto_12393 ) ) ( IS-CRATE ?auto_12378 ) ( not ( = ?auto_12391 ?auto_12388 ) ) ( HOIST-AT ?auto_12402 ?auto_12391 ) ( AVAILABLE ?auto_12402 ) ( SURFACE-AT ?auto_12378 ?auto_12391 ) ( ON ?auto_12378 ?auto_12401 ) ( CLEAR ?auto_12378 ) ( not ( = ?auto_12379 ?auto_12378 ) ) ( not ( = ?auto_12379 ?auto_12401 ) ) ( not ( = ?auto_12378 ?auto_12401 ) ) ( not ( = ?auto_12387 ?auto_12402 ) ) ( IS-CRATE ?auto_12379 ) ( SURFACE-AT ?auto_12379 ?auto_12398 ) ( ON ?auto_12379 ?auto_12410 ) ( CLEAR ?auto_12379 ) ( not ( = ?auto_12376 ?auto_12379 ) ) ( not ( = ?auto_12376 ?auto_12410 ) ) ( not ( = ?auto_12379 ?auto_12410 ) ) ( IS-CRATE ?auto_12376 ) ( not ( = ?auto_12408 ?auto_12388 ) ) ( HOIST-AT ?auto_12407 ?auto_12408 ) ( AVAILABLE ?auto_12407 ) ( SURFACE-AT ?auto_12376 ?auto_12408 ) ( ON ?auto_12376 ?auto_12404 ) ( CLEAR ?auto_12376 ) ( not ( = ?auto_12375 ?auto_12376 ) ) ( not ( = ?auto_12375 ?auto_12404 ) ) ( not ( = ?auto_12376 ?auto_12404 ) ) ( not ( = ?auto_12387 ?auto_12407 ) ) ( IS-CRATE ?auto_12375 ) ( not ( = ?auto_12394 ?auto_12388 ) ) ( HOIST-AT ?auto_12395 ?auto_12394 ) ( SURFACE-AT ?auto_12375 ?auto_12394 ) ( ON ?auto_12375 ?auto_12399 ) ( CLEAR ?auto_12375 ) ( not ( = ?auto_12374 ?auto_12375 ) ) ( not ( = ?auto_12374 ?auto_12399 ) ) ( not ( = ?auto_12375 ?auto_12399 ) ) ( not ( = ?auto_12387 ?auto_12395 ) ) ( IS-CRATE ?auto_12374 ) ( not ( = ?auto_12413 ?auto_12388 ) ) ( HOIST-AT ?auto_12392 ?auto_12413 ) ( AVAILABLE ?auto_12392 ) ( SURFACE-AT ?auto_12374 ?auto_12413 ) ( ON ?auto_12374 ?auto_12405 ) ( CLEAR ?auto_12374 ) ( not ( = ?auto_12373 ?auto_12374 ) ) ( not ( = ?auto_12373 ?auto_12405 ) ) ( not ( = ?auto_12374 ?auto_12405 ) ) ( not ( = ?auto_12387 ?auto_12392 ) ) ( IS-CRATE ?auto_12373 ) ( not ( = ?auto_12411 ?auto_12388 ) ) ( HOIST-AT ?auto_12390 ?auto_12411 ) ( AVAILABLE ?auto_12390 ) ( SURFACE-AT ?auto_12373 ?auto_12411 ) ( ON ?auto_12373 ?auto_12409 ) ( CLEAR ?auto_12373 ) ( not ( = ?auto_12372 ?auto_12373 ) ) ( not ( = ?auto_12372 ?auto_12409 ) ) ( not ( = ?auto_12373 ?auto_12409 ) ) ( not ( = ?auto_12387 ?auto_12390 ) ) ( IS-CRATE ?auto_12372 ) ( AVAILABLE ?auto_12395 ) ( SURFACE-AT ?auto_12372 ?auto_12394 ) ( ON ?auto_12372 ?auto_12403 ) ( CLEAR ?auto_12372 ) ( not ( = ?auto_12371 ?auto_12372 ) ) ( not ( = ?auto_12371 ?auto_12403 ) ) ( not ( = ?auto_12372 ?auto_12403 ) ) ( SURFACE-AT ?auto_12370 ?auto_12388 ) ( CLEAR ?auto_12370 ) ( IS-CRATE ?auto_12371 ) ( AVAILABLE ?auto_12387 ) ( AVAILABLE ?auto_12400 ) ( SURFACE-AT ?auto_12371 ?auto_12398 ) ( ON ?auto_12371 ?auto_12396 ) ( CLEAR ?auto_12371 ) ( TRUCK-AT ?auto_12383 ?auto_12388 ) ( not ( = ?auto_12370 ?auto_12371 ) ) ( not ( = ?auto_12370 ?auto_12396 ) ) ( not ( = ?auto_12371 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12372 ) ) ( not ( = ?auto_12370 ?auto_12403 ) ) ( not ( = ?auto_12372 ?auto_12396 ) ) ( not ( = ?auto_12394 ?auto_12398 ) ) ( not ( = ?auto_12395 ?auto_12400 ) ) ( not ( = ?auto_12403 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12373 ) ) ( not ( = ?auto_12370 ?auto_12409 ) ) ( not ( = ?auto_12371 ?auto_12373 ) ) ( not ( = ?auto_12371 ?auto_12409 ) ) ( not ( = ?auto_12373 ?auto_12403 ) ) ( not ( = ?auto_12373 ?auto_12396 ) ) ( not ( = ?auto_12411 ?auto_12394 ) ) ( not ( = ?auto_12411 ?auto_12398 ) ) ( not ( = ?auto_12390 ?auto_12395 ) ) ( not ( = ?auto_12390 ?auto_12400 ) ) ( not ( = ?auto_12409 ?auto_12403 ) ) ( not ( = ?auto_12409 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12374 ) ) ( not ( = ?auto_12370 ?auto_12405 ) ) ( not ( = ?auto_12371 ?auto_12374 ) ) ( not ( = ?auto_12371 ?auto_12405 ) ) ( not ( = ?auto_12372 ?auto_12374 ) ) ( not ( = ?auto_12372 ?auto_12405 ) ) ( not ( = ?auto_12374 ?auto_12409 ) ) ( not ( = ?auto_12374 ?auto_12403 ) ) ( not ( = ?auto_12374 ?auto_12396 ) ) ( not ( = ?auto_12413 ?auto_12411 ) ) ( not ( = ?auto_12413 ?auto_12394 ) ) ( not ( = ?auto_12413 ?auto_12398 ) ) ( not ( = ?auto_12392 ?auto_12390 ) ) ( not ( = ?auto_12392 ?auto_12395 ) ) ( not ( = ?auto_12392 ?auto_12400 ) ) ( not ( = ?auto_12405 ?auto_12409 ) ) ( not ( = ?auto_12405 ?auto_12403 ) ) ( not ( = ?auto_12405 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12375 ) ) ( not ( = ?auto_12370 ?auto_12399 ) ) ( not ( = ?auto_12371 ?auto_12375 ) ) ( not ( = ?auto_12371 ?auto_12399 ) ) ( not ( = ?auto_12372 ?auto_12375 ) ) ( not ( = ?auto_12372 ?auto_12399 ) ) ( not ( = ?auto_12373 ?auto_12375 ) ) ( not ( = ?auto_12373 ?auto_12399 ) ) ( not ( = ?auto_12375 ?auto_12405 ) ) ( not ( = ?auto_12375 ?auto_12409 ) ) ( not ( = ?auto_12375 ?auto_12403 ) ) ( not ( = ?auto_12375 ?auto_12396 ) ) ( not ( = ?auto_12399 ?auto_12405 ) ) ( not ( = ?auto_12399 ?auto_12409 ) ) ( not ( = ?auto_12399 ?auto_12403 ) ) ( not ( = ?auto_12399 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12376 ) ) ( not ( = ?auto_12370 ?auto_12404 ) ) ( not ( = ?auto_12371 ?auto_12376 ) ) ( not ( = ?auto_12371 ?auto_12404 ) ) ( not ( = ?auto_12372 ?auto_12376 ) ) ( not ( = ?auto_12372 ?auto_12404 ) ) ( not ( = ?auto_12373 ?auto_12376 ) ) ( not ( = ?auto_12373 ?auto_12404 ) ) ( not ( = ?auto_12374 ?auto_12376 ) ) ( not ( = ?auto_12374 ?auto_12404 ) ) ( not ( = ?auto_12376 ?auto_12399 ) ) ( not ( = ?auto_12376 ?auto_12405 ) ) ( not ( = ?auto_12376 ?auto_12409 ) ) ( not ( = ?auto_12376 ?auto_12403 ) ) ( not ( = ?auto_12376 ?auto_12396 ) ) ( not ( = ?auto_12408 ?auto_12394 ) ) ( not ( = ?auto_12408 ?auto_12413 ) ) ( not ( = ?auto_12408 ?auto_12411 ) ) ( not ( = ?auto_12408 ?auto_12398 ) ) ( not ( = ?auto_12407 ?auto_12395 ) ) ( not ( = ?auto_12407 ?auto_12392 ) ) ( not ( = ?auto_12407 ?auto_12390 ) ) ( not ( = ?auto_12407 ?auto_12400 ) ) ( not ( = ?auto_12404 ?auto_12399 ) ) ( not ( = ?auto_12404 ?auto_12405 ) ) ( not ( = ?auto_12404 ?auto_12409 ) ) ( not ( = ?auto_12404 ?auto_12403 ) ) ( not ( = ?auto_12404 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12379 ) ) ( not ( = ?auto_12370 ?auto_12410 ) ) ( not ( = ?auto_12371 ?auto_12379 ) ) ( not ( = ?auto_12371 ?auto_12410 ) ) ( not ( = ?auto_12372 ?auto_12379 ) ) ( not ( = ?auto_12372 ?auto_12410 ) ) ( not ( = ?auto_12373 ?auto_12379 ) ) ( not ( = ?auto_12373 ?auto_12410 ) ) ( not ( = ?auto_12374 ?auto_12379 ) ) ( not ( = ?auto_12374 ?auto_12410 ) ) ( not ( = ?auto_12375 ?auto_12379 ) ) ( not ( = ?auto_12375 ?auto_12410 ) ) ( not ( = ?auto_12379 ?auto_12404 ) ) ( not ( = ?auto_12379 ?auto_12399 ) ) ( not ( = ?auto_12379 ?auto_12405 ) ) ( not ( = ?auto_12379 ?auto_12409 ) ) ( not ( = ?auto_12379 ?auto_12403 ) ) ( not ( = ?auto_12379 ?auto_12396 ) ) ( not ( = ?auto_12410 ?auto_12404 ) ) ( not ( = ?auto_12410 ?auto_12399 ) ) ( not ( = ?auto_12410 ?auto_12405 ) ) ( not ( = ?auto_12410 ?auto_12409 ) ) ( not ( = ?auto_12410 ?auto_12403 ) ) ( not ( = ?auto_12410 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12378 ) ) ( not ( = ?auto_12370 ?auto_12401 ) ) ( not ( = ?auto_12371 ?auto_12378 ) ) ( not ( = ?auto_12371 ?auto_12401 ) ) ( not ( = ?auto_12372 ?auto_12378 ) ) ( not ( = ?auto_12372 ?auto_12401 ) ) ( not ( = ?auto_12373 ?auto_12378 ) ) ( not ( = ?auto_12373 ?auto_12401 ) ) ( not ( = ?auto_12374 ?auto_12378 ) ) ( not ( = ?auto_12374 ?auto_12401 ) ) ( not ( = ?auto_12375 ?auto_12378 ) ) ( not ( = ?auto_12375 ?auto_12401 ) ) ( not ( = ?auto_12376 ?auto_12378 ) ) ( not ( = ?auto_12376 ?auto_12401 ) ) ( not ( = ?auto_12378 ?auto_12410 ) ) ( not ( = ?auto_12378 ?auto_12404 ) ) ( not ( = ?auto_12378 ?auto_12399 ) ) ( not ( = ?auto_12378 ?auto_12405 ) ) ( not ( = ?auto_12378 ?auto_12409 ) ) ( not ( = ?auto_12378 ?auto_12403 ) ) ( not ( = ?auto_12378 ?auto_12396 ) ) ( not ( = ?auto_12391 ?auto_12398 ) ) ( not ( = ?auto_12391 ?auto_12408 ) ) ( not ( = ?auto_12391 ?auto_12394 ) ) ( not ( = ?auto_12391 ?auto_12413 ) ) ( not ( = ?auto_12391 ?auto_12411 ) ) ( not ( = ?auto_12402 ?auto_12400 ) ) ( not ( = ?auto_12402 ?auto_12407 ) ) ( not ( = ?auto_12402 ?auto_12395 ) ) ( not ( = ?auto_12402 ?auto_12392 ) ) ( not ( = ?auto_12402 ?auto_12390 ) ) ( not ( = ?auto_12401 ?auto_12410 ) ) ( not ( = ?auto_12401 ?auto_12404 ) ) ( not ( = ?auto_12401 ?auto_12399 ) ) ( not ( = ?auto_12401 ?auto_12405 ) ) ( not ( = ?auto_12401 ?auto_12409 ) ) ( not ( = ?auto_12401 ?auto_12403 ) ) ( not ( = ?auto_12401 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12377 ) ) ( not ( = ?auto_12370 ?auto_12393 ) ) ( not ( = ?auto_12371 ?auto_12377 ) ) ( not ( = ?auto_12371 ?auto_12393 ) ) ( not ( = ?auto_12372 ?auto_12377 ) ) ( not ( = ?auto_12372 ?auto_12393 ) ) ( not ( = ?auto_12373 ?auto_12377 ) ) ( not ( = ?auto_12373 ?auto_12393 ) ) ( not ( = ?auto_12374 ?auto_12377 ) ) ( not ( = ?auto_12374 ?auto_12393 ) ) ( not ( = ?auto_12375 ?auto_12377 ) ) ( not ( = ?auto_12375 ?auto_12393 ) ) ( not ( = ?auto_12376 ?auto_12377 ) ) ( not ( = ?auto_12376 ?auto_12393 ) ) ( not ( = ?auto_12379 ?auto_12377 ) ) ( not ( = ?auto_12379 ?auto_12393 ) ) ( not ( = ?auto_12377 ?auto_12401 ) ) ( not ( = ?auto_12377 ?auto_12410 ) ) ( not ( = ?auto_12377 ?auto_12404 ) ) ( not ( = ?auto_12377 ?auto_12399 ) ) ( not ( = ?auto_12377 ?auto_12405 ) ) ( not ( = ?auto_12377 ?auto_12409 ) ) ( not ( = ?auto_12377 ?auto_12403 ) ) ( not ( = ?auto_12377 ?auto_12396 ) ) ( not ( = ?auto_12385 ?auto_12391 ) ) ( not ( = ?auto_12385 ?auto_12398 ) ) ( not ( = ?auto_12385 ?auto_12408 ) ) ( not ( = ?auto_12385 ?auto_12394 ) ) ( not ( = ?auto_12385 ?auto_12413 ) ) ( not ( = ?auto_12385 ?auto_12411 ) ) ( not ( = ?auto_12386 ?auto_12402 ) ) ( not ( = ?auto_12386 ?auto_12400 ) ) ( not ( = ?auto_12386 ?auto_12407 ) ) ( not ( = ?auto_12386 ?auto_12395 ) ) ( not ( = ?auto_12386 ?auto_12392 ) ) ( not ( = ?auto_12386 ?auto_12390 ) ) ( not ( = ?auto_12393 ?auto_12401 ) ) ( not ( = ?auto_12393 ?auto_12410 ) ) ( not ( = ?auto_12393 ?auto_12404 ) ) ( not ( = ?auto_12393 ?auto_12399 ) ) ( not ( = ?auto_12393 ?auto_12405 ) ) ( not ( = ?auto_12393 ?auto_12409 ) ) ( not ( = ?auto_12393 ?auto_12403 ) ) ( not ( = ?auto_12393 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12380 ) ) ( not ( = ?auto_12370 ?auto_12406 ) ) ( not ( = ?auto_12371 ?auto_12380 ) ) ( not ( = ?auto_12371 ?auto_12406 ) ) ( not ( = ?auto_12372 ?auto_12380 ) ) ( not ( = ?auto_12372 ?auto_12406 ) ) ( not ( = ?auto_12373 ?auto_12380 ) ) ( not ( = ?auto_12373 ?auto_12406 ) ) ( not ( = ?auto_12374 ?auto_12380 ) ) ( not ( = ?auto_12374 ?auto_12406 ) ) ( not ( = ?auto_12375 ?auto_12380 ) ) ( not ( = ?auto_12375 ?auto_12406 ) ) ( not ( = ?auto_12376 ?auto_12380 ) ) ( not ( = ?auto_12376 ?auto_12406 ) ) ( not ( = ?auto_12379 ?auto_12380 ) ) ( not ( = ?auto_12379 ?auto_12406 ) ) ( not ( = ?auto_12378 ?auto_12380 ) ) ( not ( = ?auto_12378 ?auto_12406 ) ) ( not ( = ?auto_12380 ?auto_12393 ) ) ( not ( = ?auto_12380 ?auto_12401 ) ) ( not ( = ?auto_12380 ?auto_12410 ) ) ( not ( = ?auto_12380 ?auto_12404 ) ) ( not ( = ?auto_12380 ?auto_12399 ) ) ( not ( = ?auto_12380 ?auto_12405 ) ) ( not ( = ?auto_12380 ?auto_12409 ) ) ( not ( = ?auto_12380 ?auto_12403 ) ) ( not ( = ?auto_12380 ?auto_12396 ) ) ( not ( = ?auto_12389 ?auto_12385 ) ) ( not ( = ?auto_12389 ?auto_12391 ) ) ( not ( = ?auto_12389 ?auto_12398 ) ) ( not ( = ?auto_12389 ?auto_12408 ) ) ( not ( = ?auto_12389 ?auto_12394 ) ) ( not ( = ?auto_12389 ?auto_12413 ) ) ( not ( = ?auto_12389 ?auto_12411 ) ) ( not ( = ?auto_12397 ?auto_12386 ) ) ( not ( = ?auto_12397 ?auto_12402 ) ) ( not ( = ?auto_12397 ?auto_12400 ) ) ( not ( = ?auto_12397 ?auto_12407 ) ) ( not ( = ?auto_12397 ?auto_12395 ) ) ( not ( = ?auto_12397 ?auto_12392 ) ) ( not ( = ?auto_12397 ?auto_12390 ) ) ( not ( = ?auto_12406 ?auto_12393 ) ) ( not ( = ?auto_12406 ?auto_12401 ) ) ( not ( = ?auto_12406 ?auto_12410 ) ) ( not ( = ?auto_12406 ?auto_12404 ) ) ( not ( = ?auto_12406 ?auto_12399 ) ) ( not ( = ?auto_12406 ?auto_12405 ) ) ( not ( = ?auto_12406 ?auto_12409 ) ) ( not ( = ?auto_12406 ?auto_12403 ) ) ( not ( = ?auto_12406 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12381 ) ) ( not ( = ?auto_12370 ?auto_12412 ) ) ( not ( = ?auto_12371 ?auto_12381 ) ) ( not ( = ?auto_12371 ?auto_12412 ) ) ( not ( = ?auto_12372 ?auto_12381 ) ) ( not ( = ?auto_12372 ?auto_12412 ) ) ( not ( = ?auto_12373 ?auto_12381 ) ) ( not ( = ?auto_12373 ?auto_12412 ) ) ( not ( = ?auto_12374 ?auto_12381 ) ) ( not ( = ?auto_12374 ?auto_12412 ) ) ( not ( = ?auto_12375 ?auto_12381 ) ) ( not ( = ?auto_12375 ?auto_12412 ) ) ( not ( = ?auto_12376 ?auto_12381 ) ) ( not ( = ?auto_12376 ?auto_12412 ) ) ( not ( = ?auto_12379 ?auto_12381 ) ) ( not ( = ?auto_12379 ?auto_12412 ) ) ( not ( = ?auto_12378 ?auto_12381 ) ) ( not ( = ?auto_12378 ?auto_12412 ) ) ( not ( = ?auto_12377 ?auto_12381 ) ) ( not ( = ?auto_12377 ?auto_12412 ) ) ( not ( = ?auto_12381 ?auto_12406 ) ) ( not ( = ?auto_12381 ?auto_12393 ) ) ( not ( = ?auto_12381 ?auto_12401 ) ) ( not ( = ?auto_12381 ?auto_12410 ) ) ( not ( = ?auto_12381 ?auto_12404 ) ) ( not ( = ?auto_12381 ?auto_12399 ) ) ( not ( = ?auto_12381 ?auto_12405 ) ) ( not ( = ?auto_12381 ?auto_12409 ) ) ( not ( = ?auto_12381 ?auto_12403 ) ) ( not ( = ?auto_12381 ?auto_12396 ) ) ( not ( = ?auto_12412 ?auto_12406 ) ) ( not ( = ?auto_12412 ?auto_12393 ) ) ( not ( = ?auto_12412 ?auto_12401 ) ) ( not ( = ?auto_12412 ?auto_12410 ) ) ( not ( = ?auto_12412 ?auto_12404 ) ) ( not ( = ?auto_12412 ?auto_12399 ) ) ( not ( = ?auto_12412 ?auto_12405 ) ) ( not ( = ?auto_12412 ?auto_12409 ) ) ( not ( = ?auto_12412 ?auto_12403 ) ) ( not ( = ?auto_12412 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12382 ) ) ( not ( = ?auto_12370 ?auto_12384 ) ) ( not ( = ?auto_12371 ?auto_12382 ) ) ( not ( = ?auto_12371 ?auto_12384 ) ) ( not ( = ?auto_12372 ?auto_12382 ) ) ( not ( = ?auto_12372 ?auto_12384 ) ) ( not ( = ?auto_12373 ?auto_12382 ) ) ( not ( = ?auto_12373 ?auto_12384 ) ) ( not ( = ?auto_12374 ?auto_12382 ) ) ( not ( = ?auto_12374 ?auto_12384 ) ) ( not ( = ?auto_12375 ?auto_12382 ) ) ( not ( = ?auto_12375 ?auto_12384 ) ) ( not ( = ?auto_12376 ?auto_12382 ) ) ( not ( = ?auto_12376 ?auto_12384 ) ) ( not ( = ?auto_12379 ?auto_12382 ) ) ( not ( = ?auto_12379 ?auto_12384 ) ) ( not ( = ?auto_12378 ?auto_12382 ) ) ( not ( = ?auto_12378 ?auto_12384 ) ) ( not ( = ?auto_12377 ?auto_12382 ) ) ( not ( = ?auto_12377 ?auto_12384 ) ) ( not ( = ?auto_12380 ?auto_12382 ) ) ( not ( = ?auto_12380 ?auto_12384 ) ) ( not ( = ?auto_12382 ?auto_12412 ) ) ( not ( = ?auto_12382 ?auto_12406 ) ) ( not ( = ?auto_12382 ?auto_12393 ) ) ( not ( = ?auto_12382 ?auto_12401 ) ) ( not ( = ?auto_12382 ?auto_12410 ) ) ( not ( = ?auto_12382 ?auto_12404 ) ) ( not ( = ?auto_12382 ?auto_12399 ) ) ( not ( = ?auto_12382 ?auto_12405 ) ) ( not ( = ?auto_12382 ?auto_12409 ) ) ( not ( = ?auto_12382 ?auto_12403 ) ) ( not ( = ?auto_12382 ?auto_12396 ) ) ( not ( = ?auto_12384 ?auto_12412 ) ) ( not ( = ?auto_12384 ?auto_12406 ) ) ( not ( = ?auto_12384 ?auto_12393 ) ) ( not ( = ?auto_12384 ?auto_12401 ) ) ( not ( = ?auto_12384 ?auto_12410 ) ) ( not ( = ?auto_12384 ?auto_12404 ) ) ( not ( = ?auto_12384 ?auto_12399 ) ) ( not ( = ?auto_12384 ?auto_12405 ) ) ( not ( = ?auto_12384 ?auto_12409 ) ) ( not ( = ?auto_12384 ?auto_12403 ) ) ( not ( = ?auto_12384 ?auto_12396 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_12370 ?auto_12371 ?auto_12372 ?auto_12373 ?auto_12374 ?auto_12375 ?auto_12376 ?auto_12379 ?auto_12378 ?auto_12377 ?auto_12380 ?auto_12381 )
      ( MAKE-1CRATE ?auto_12381 ?auto_12382 )
      ( MAKE-12CRATE-VERIFY ?auto_12370 ?auto_12371 ?auto_12372 ?auto_12373 ?auto_12374 ?auto_12375 ?auto_12376 ?auto_12379 ?auto_12378 ?auto_12377 ?auto_12380 ?auto_12381 ?auto_12382 ) )
  )

)

