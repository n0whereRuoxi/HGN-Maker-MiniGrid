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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_872 - SURFACE
      ?auto_873 - SURFACE
    )
    :vars
    (
      ?auto_874 - HOIST
      ?auto_875 - PLACE
      ?auto_877 - PLACE
      ?auto_878 - HOIST
      ?auto_879 - SURFACE
      ?auto_876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_874 ?auto_875 ) ( SURFACE-AT ?auto_872 ?auto_875 ) ( CLEAR ?auto_872 ) ( IS-CRATE ?auto_873 ) ( AVAILABLE ?auto_874 ) ( not ( = ?auto_877 ?auto_875 ) ) ( HOIST-AT ?auto_878 ?auto_877 ) ( AVAILABLE ?auto_878 ) ( SURFACE-AT ?auto_873 ?auto_877 ) ( ON ?auto_873 ?auto_879 ) ( CLEAR ?auto_873 ) ( TRUCK-AT ?auto_876 ?auto_875 ) ( not ( = ?auto_872 ?auto_873 ) ) ( not ( = ?auto_872 ?auto_879 ) ) ( not ( = ?auto_873 ?auto_879 ) ) ( not ( = ?auto_874 ?auto_878 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_876 ?auto_875 ?auto_877 )
      ( !LIFT ?auto_878 ?auto_873 ?auto_879 ?auto_877 )
      ( !LOAD ?auto_878 ?auto_873 ?auto_876 ?auto_877 )
      ( !DRIVE ?auto_876 ?auto_877 ?auto_875 )
      ( !UNLOAD ?auto_874 ?auto_873 ?auto_876 ?auto_875 )
      ( !DROP ?auto_874 ?auto_873 ?auto_872 ?auto_875 )
      ( MAKE-1CRATE-VERIFY ?auto_872 ?auto_873 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_893 - SURFACE
      ?auto_894 - SURFACE
      ?auto_895 - SURFACE
    )
    :vars
    (
      ?auto_901 - HOIST
      ?auto_897 - PLACE
      ?auto_896 - PLACE
      ?auto_900 - HOIST
      ?auto_899 - SURFACE
      ?auto_904 - PLACE
      ?auto_902 - HOIST
      ?auto_903 - SURFACE
      ?auto_898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_901 ?auto_897 ) ( IS-CRATE ?auto_895 ) ( not ( = ?auto_896 ?auto_897 ) ) ( HOIST-AT ?auto_900 ?auto_896 ) ( AVAILABLE ?auto_900 ) ( SURFACE-AT ?auto_895 ?auto_896 ) ( ON ?auto_895 ?auto_899 ) ( CLEAR ?auto_895 ) ( not ( = ?auto_894 ?auto_895 ) ) ( not ( = ?auto_894 ?auto_899 ) ) ( not ( = ?auto_895 ?auto_899 ) ) ( not ( = ?auto_901 ?auto_900 ) ) ( SURFACE-AT ?auto_893 ?auto_897 ) ( CLEAR ?auto_893 ) ( IS-CRATE ?auto_894 ) ( AVAILABLE ?auto_901 ) ( not ( = ?auto_904 ?auto_897 ) ) ( HOIST-AT ?auto_902 ?auto_904 ) ( AVAILABLE ?auto_902 ) ( SURFACE-AT ?auto_894 ?auto_904 ) ( ON ?auto_894 ?auto_903 ) ( CLEAR ?auto_894 ) ( TRUCK-AT ?auto_898 ?auto_897 ) ( not ( = ?auto_893 ?auto_894 ) ) ( not ( = ?auto_893 ?auto_903 ) ) ( not ( = ?auto_894 ?auto_903 ) ) ( not ( = ?auto_901 ?auto_902 ) ) ( not ( = ?auto_893 ?auto_895 ) ) ( not ( = ?auto_893 ?auto_899 ) ) ( not ( = ?auto_895 ?auto_903 ) ) ( not ( = ?auto_896 ?auto_904 ) ) ( not ( = ?auto_900 ?auto_902 ) ) ( not ( = ?auto_899 ?auto_903 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_893 ?auto_894 )
      ( MAKE-1CRATE ?auto_894 ?auto_895 )
      ( MAKE-2CRATE-VERIFY ?auto_893 ?auto_894 ?auto_895 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_919 - SURFACE
      ?auto_920 - SURFACE
      ?auto_921 - SURFACE
      ?auto_922 - SURFACE
    )
    :vars
    (
      ?auto_928 - HOIST
      ?auto_926 - PLACE
      ?auto_923 - PLACE
      ?auto_925 - HOIST
      ?auto_924 - SURFACE
      ?auto_931 - PLACE
      ?auto_933 - HOIST
      ?auto_934 - SURFACE
      ?auto_930 - PLACE
      ?auto_932 - HOIST
      ?auto_929 - SURFACE
      ?auto_927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_928 ?auto_926 ) ( IS-CRATE ?auto_922 ) ( not ( = ?auto_923 ?auto_926 ) ) ( HOIST-AT ?auto_925 ?auto_923 ) ( AVAILABLE ?auto_925 ) ( SURFACE-AT ?auto_922 ?auto_923 ) ( ON ?auto_922 ?auto_924 ) ( CLEAR ?auto_922 ) ( not ( = ?auto_921 ?auto_922 ) ) ( not ( = ?auto_921 ?auto_924 ) ) ( not ( = ?auto_922 ?auto_924 ) ) ( not ( = ?auto_928 ?auto_925 ) ) ( IS-CRATE ?auto_921 ) ( not ( = ?auto_931 ?auto_926 ) ) ( HOIST-AT ?auto_933 ?auto_931 ) ( AVAILABLE ?auto_933 ) ( SURFACE-AT ?auto_921 ?auto_931 ) ( ON ?auto_921 ?auto_934 ) ( CLEAR ?auto_921 ) ( not ( = ?auto_920 ?auto_921 ) ) ( not ( = ?auto_920 ?auto_934 ) ) ( not ( = ?auto_921 ?auto_934 ) ) ( not ( = ?auto_928 ?auto_933 ) ) ( SURFACE-AT ?auto_919 ?auto_926 ) ( CLEAR ?auto_919 ) ( IS-CRATE ?auto_920 ) ( AVAILABLE ?auto_928 ) ( not ( = ?auto_930 ?auto_926 ) ) ( HOIST-AT ?auto_932 ?auto_930 ) ( AVAILABLE ?auto_932 ) ( SURFACE-AT ?auto_920 ?auto_930 ) ( ON ?auto_920 ?auto_929 ) ( CLEAR ?auto_920 ) ( TRUCK-AT ?auto_927 ?auto_926 ) ( not ( = ?auto_919 ?auto_920 ) ) ( not ( = ?auto_919 ?auto_929 ) ) ( not ( = ?auto_920 ?auto_929 ) ) ( not ( = ?auto_928 ?auto_932 ) ) ( not ( = ?auto_919 ?auto_921 ) ) ( not ( = ?auto_919 ?auto_934 ) ) ( not ( = ?auto_921 ?auto_929 ) ) ( not ( = ?auto_931 ?auto_930 ) ) ( not ( = ?auto_933 ?auto_932 ) ) ( not ( = ?auto_934 ?auto_929 ) ) ( not ( = ?auto_919 ?auto_922 ) ) ( not ( = ?auto_919 ?auto_924 ) ) ( not ( = ?auto_920 ?auto_922 ) ) ( not ( = ?auto_920 ?auto_924 ) ) ( not ( = ?auto_922 ?auto_934 ) ) ( not ( = ?auto_922 ?auto_929 ) ) ( not ( = ?auto_923 ?auto_931 ) ) ( not ( = ?auto_923 ?auto_930 ) ) ( not ( = ?auto_925 ?auto_933 ) ) ( not ( = ?auto_925 ?auto_932 ) ) ( not ( = ?auto_924 ?auto_934 ) ) ( not ( = ?auto_924 ?auto_929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_919 ?auto_920 ?auto_921 )
      ( MAKE-1CRATE ?auto_921 ?auto_922 )
      ( MAKE-3CRATE-VERIFY ?auto_919 ?auto_920 ?auto_921 ?auto_922 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_950 - SURFACE
      ?auto_951 - SURFACE
      ?auto_952 - SURFACE
      ?auto_953 - SURFACE
      ?auto_954 - SURFACE
    )
    :vars
    (
      ?auto_956 - HOIST
      ?auto_959 - PLACE
      ?auto_955 - PLACE
      ?auto_960 - HOIST
      ?auto_957 - SURFACE
      ?auto_962 - PLACE
      ?auto_963 - HOIST
      ?auto_968 - SURFACE
      ?auto_966 - PLACE
      ?auto_964 - HOIST
      ?auto_965 - SURFACE
      ?auto_961 - PLACE
      ?auto_967 - HOIST
      ?auto_969 - SURFACE
      ?auto_958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_956 ?auto_959 ) ( IS-CRATE ?auto_954 ) ( not ( = ?auto_955 ?auto_959 ) ) ( HOIST-AT ?auto_960 ?auto_955 ) ( AVAILABLE ?auto_960 ) ( SURFACE-AT ?auto_954 ?auto_955 ) ( ON ?auto_954 ?auto_957 ) ( CLEAR ?auto_954 ) ( not ( = ?auto_953 ?auto_954 ) ) ( not ( = ?auto_953 ?auto_957 ) ) ( not ( = ?auto_954 ?auto_957 ) ) ( not ( = ?auto_956 ?auto_960 ) ) ( IS-CRATE ?auto_953 ) ( not ( = ?auto_962 ?auto_959 ) ) ( HOIST-AT ?auto_963 ?auto_962 ) ( AVAILABLE ?auto_963 ) ( SURFACE-AT ?auto_953 ?auto_962 ) ( ON ?auto_953 ?auto_968 ) ( CLEAR ?auto_953 ) ( not ( = ?auto_952 ?auto_953 ) ) ( not ( = ?auto_952 ?auto_968 ) ) ( not ( = ?auto_953 ?auto_968 ) ) ( not ( = ?auto_956 ?auto_963 ) ) ( IS-CRATE ?auto_952 ) ( not ( = ?auto_966 ?auto_959 ) ) ( HOIST-AT ?auto_964 ?auto_966 ) ( AVAILABLE ?auto_964 ) ( SURFACE-AT ?auto_952 ?auto_966 ) ( ON ?auto_952 ?auto_965 ) ( CLEAR ?auto_952 ) ( not ( = ?auto_951 ?auto_952 ) ) ( not ( = ?auto_951 ?auto_965 ) ) ( not ( = ?auto_952 ?auto_965 ) ) ( not ( = ?auto_956 ?auto_964 ) ) ( SURFACE-AT ?auto_950 ?auto_959 ) ( CLEAR ?auto_950 ) ( IS-CRATE ?auto_951 ) ( AVAILABLE ?auto_956 ) ( not ( = ?auto_961 ?auto_959 ) ) ( HOIST-AT ?auto_967 ?auto_961 ) ( AVAILABLE ?auto_967 ) ( SURFACE-AT ?auto_951 ?auto_961 ) ( ON ?auto_951 ?auto_969 ) ( CLEAR ?auto_951 ) ( TRUCK-AT ?auto_958 ?auto_959 ) ( not ( = ?auto_950 ?auto_951 ) ) ( not ( = ?auto_950 ?auto_969 ) ) ( not ( = ?auto_951 ?auto_969 ) ) ( not ( = ?auto_956 ?auto_967 ) ) ( not ( = ?auto_950 ?auto_952 ) ) ( not ( = ?auto_950 ?auto_965 ) ) ( not ( = ?auto_952 ?auto_969 ) ) ( not ( = ?auto_966 ?auto_961 ) ) ( not ( = ?auto_964 ?auto_967 ) ) ( not ( = ?auto_965 ?auto_969 ) ) ( not ( = ?auto_950 ?auto_953 ) ) ( not ( = ?auto_950 ?auto_968 ) ) ( not ( = ?auto_951 ?auto_953 ) ) ( not ( = ?auto_951 ?auto_968 ) ) ( not ( = ?auto_953 ?auto_965 ) ) ( not ( = ?auto_953 ?auto_969 ) ) ( not ( = ?auto_962 ?auto_966 ) ) ( not ( = ?auto_962 ?auto_961 ) ) ( not ( = ?auto_963 ?auto_964 ) ) ( not ( = ?auto_963 ?auto_967 ) ) ( not ( = ?auto_968 ?auto_965 ) ) ( not ( = ?auto_968 ?auto_969 ) ) ( not ( = ?auto_950 ?auto_954 ) ) ( not ( = ?auto_950 ?auto_957 ) ) ( not ( = ?auto_951 ?auto_954 ) ) ( not ( = ?auto_951 ?auto_957 ) ) ( not ( = ?auto_952 ?auto_954 ) ) ( not ( = ?auto_952 ?auto_957 ) ) ( not ( = ?auto_954 ?auto_968 ) ) ( not ( = ?auto_954 ?auto_965 ) ) ( not ( = ?auto_954 ?auto_969 ) ) ( not ( = ?auto_955 ?auto_962 ) ) ( not ( = ?auto_955 ?auto_966 ) ) ( not ( = ?auto_955 ?auto_961 ) ) ( not ( = ?auto_960 ?auto_963 ) ) ( not ( = ?auto_960 ?auto_964 ) ) ( not ( = ?auto_960 ?auto_967 ) ) ( not ( = ?auto_957 ?auto_968 ) ) ( not ( = ?auto_957 ?auto_965 ) ) ( not ( = ?auto_957 ?auto_969 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_950 ?auto_951 ?auto_952 ?auto_953 )
      ( MAKE-1CRATE ?auto_953 ?auto_954 )
      ( MAKE-4CRATE-VERIFY ?auto_950 ?auto_951 ?auto_952 ?auto_953 ?auto_954 ) )
  )

)

