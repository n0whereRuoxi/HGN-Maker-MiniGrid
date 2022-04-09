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
      ?auto_874 - SURFACE
      ?auto_875 - SURFACE
    )
    :vars
    (
      ?auto_876 - HOIST
      ?auto_877 - PLACE
      ?auto_879 - PLACE
      ?auto_880 - HOIST
      ?auto_881 - SURFACE
      ?auto_878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_876 ?auto_877 ) ( SURFACE-AT ?auto_874 ?auto_877 ) ( CLEAR ?auto_874 ) ( IS-CRATE ?auto_875 ) ( AVAILABLE ?auto_876 ) ( not ( = ?auto_879 ?auto_877 ) ) ( HOIST-AT ?auto_880 ?auto_879 ) ( AVAILABLE ?auto_880 ) ( SURFACE-AT ?auto_875 ?auto_879 ) ( ON ?auto_875 ?auto_881 ) ( CLEAR ?auto_875 ) ( TRUCK-AT ?auto_878 ?auto_877 ) ( not ( = ?auto_874 ?auto_875 ) ) ( not ( = ?auto_874 ?auto_881 ) ) ( not ( = ?auto_875 ?auto_881 ) ) ( not ( = ?auto_876 ?auto_880 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_878 ?auto_877 ?auto_879 )
      ( !LIFT ?auto_880 ?auto_875 ?auto_881 ?auto_879 )
      ( !LOAD ?auto_880 ?auto_875 ?auto_878 ?auto_879 )
      ( !DRIVE ?auto_878 ?auto_879 ?auto_877 )
      ( !UNLOAD ?auto_876 ?auto_875 ?auto_878 ?auto_877 )
      ( !DROP ?auto_876 ?auto_875 ?auto_874 ?auto_877 )
      ( MAKE-1CRATE-VERIFY ?auto_874 ?auto_875 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_895 - SURFACE
      ?auto_896 - SURFACE
      ?auto_897 - SURFACE
    )
    :vars
    (
      ?auto_898 - HOIST
      ?auto_900 - PLACE
      ?auto_901 - PLACE
      ?auto_899 - HOIST
      ?auto_903 - SURFACE
      ?auto_906 - PLACE
      ?auto_905 - HOIST
      ?auto_904 - SURFACE
      ?auto_902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_898 ?auto_900 ) ( IS-CRATE ?auto_897 ) ( not ( = ?auto_901 ?auto_900 ) ) ( HOIST-AT ?auto_899 ?auto_901 ) ( AVAILABLE ?auto_899 ) ( SURFACE-AT ?auto_897 ?auto_901 ) ( ON ?auto_897 ?auto_903 ) ( CLEAR ?auto_897 ) ( not ( = ?auto_896 ?auto_897 ) ) ( not ( = ?auto_896 ?auto_903 ) ) ( not ( = ?auto_897 ?auto_903 ) ) ( not ( = ?auto_898 ?auto_899 ) ) ( SURFACE-AT ?auto_895 ?auto_900 ) ( CLEAR ?auto_895 ) ( IS-CRATE ?auto_896 ) ( AVAILABLE ?auto_898 ) ( not ( = ?auto_906 ?auto_900 ) ) ( HOIST-AT ?auto_905 ?auto_906 ) ( AVAILABLE ?auto_905 ) ( SURFACE-AT ?auto_896 ?auto_906 ) ( ON ?auto_896 ?auto_904 ) ( CLEAR ?auto_896 ) ( TRUCK-AT ?auto_902 ?auto_900 ) ( not ( = ?auto_895 ?auto_896 ) ) ( not ( = ?auto_895 ?auto_904 ) ) ( not ( = ?auto_896 ?auto_904 ) ) ( not ( = ?auto_898 ?auto_905 ) ) ( not ( = ?auto_895 ?auto_897 ) ) ( not ( = ?auto_895 ?auto_903 ) ) ( not ( = ?auto_897 ?auto_904 ) ) ( not ( = ?auto_901 ?auto_906 ) ) ( not ( = ?auto_899 ?auto_905 ) ) ( not ( = ?auto_903 ?auto_904 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_895 ?auto_896 )
      ( MAKE-1CRATE ?auto_896 ?auto_897 )
      ( MAKE-2CRATE-VERIFY ?auto_895 ?auto_896 ?auto_897 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_921 - SURFACE
      ?auto_922 - SURFACE
      ?auto_923 - SURFACE
      ?auto_924 - SURFACE
    )
    :vars
    (
      ?auto_930 - HOIST
      ?auto_928 - PLACE
      ?auto_925 - PLACE
      ?auto_927 - HOIST
      ?auto_926 - SURFACE
      ?auto_936 - PLACE
      ?auto_934 - HOIST
      ?auto_935 - SURFACE
      ?auto_932 - PLACE
      ?auto_931 - HOIST
      ?auto_933 - SURFACE
      ?auto_929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_930 ?auto_928 ) ( IS-CRATE ?auto_924 ) ( not ( = ?auto_925 ?auto_928 ) ) ( HOIST-AT ?auto_927 ?auto_925 ) ( AVAILABLE ?auto_927 ) ( SURFACE-AT ?auto_924 ?auto_925 ) ( ON ?auto_924 ?auto_926 ) ( CLEAR ?auto_924 ) ( not ( = ?auto_923 ?auto_924 ) ) ( not ( = ?auto_923 ?auto_926 ) ) ( not ( = ?auto_924 ?auto_926 ) ) ( not ( = ?auto_930 ?auto_927 ) ) ( IS-CRATE ?auto_923 ) ( not ( = ?auto_936 ?auto_928 ) ) ( HOIST-AT ?auto_934 ?auto_936 ) ( AVAILABLE ?auto_934 ) ( SURFACE-AT ?auto_923 ?auto_936 ) ( ON ?auto_923 ?auto_935 ) ( CLEAR ?auto_923 ) ( not ( = ?auto_922 ?auto_923 ) ) ( not ( = ?auto_922 ?auto_935 ) ) ( not ( = ?auto_923 ?auto_935 ) ) ( not ( = ?auto_930 ?auto_934 ) ) ( SURFACE-AT ?auto_921 ?auto_928 ) ( CLEAR ?auto_921 ) ( IS-CRATE ?auto_922 ) ( AVAILABLE ?auto_930 ) ( not ( = ?auto_932 ?auto_928 ) ) ( HOIST-AT ?auto_931 ?auto_932 ) ( AVAILABLE ?auto_931 ) ( SURFACE-AT ?auto_922 ?auto_932 ) ( ON ?auto_922 ?auto_933 ) ( CLEAR ?auto_922 ) ( TRUCK-AT ?auto_929 ?auto_928 ) ( not ( = ?auto_921 ?auto_922 ) ) ( not ( = ?auto_921 ?auto_933 ) ) ( not ( = ?auto_922 ?auto_933 ) ) ( not ( = ?auto_930 ?auto_931 ) ) ( not ( = ?auto_921 ?auto_923 ) ) ( not ( = ?auto_921 ?auto_935 ) ) ( not ( = ?auto_923 ?auto_933 ) ) ( not ( = ?auto_936 ?auto_932 ) ) ( not ( = ?auto_934 ?auto_931 ) ) ( not ( = ?auto_935 ?auto_933 ) ) ( not ( = ?auto_921 ?auto_924 ) ) ( not ( = ?auto_921 ?auto_926 ) ) ( not ( = ?auto_922 ?auto_924 ) ) ( not ( = ?auto_922 ?auto_926 ) ) ( not ( = ?auto_924 ?auto_935 ) ) ( not ( = ?auto_924 ?auto_933 ) ) ( not ( = ?auto_925 ?auto_936 ) ) ( not ( = ?auto_925 ?auto_932 ) ) ( not ( = ?auto_927 ?auto_934 ) ) ( not ( = ?auto_927 ?auto_931 ) ) ( not ( = ?auto_926 ?auto_935 ) ) ( not ( = ?auto_926 ?auto_933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_921 ?auto_922 ?auto_923 )
      ( MAKE-1CRATE ?auto_923 ?auto_924 )
      ( MAKE-3CRATE-VERIFY ?auto_921 ?auto_922 ?auto_923 ?auto_924 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_952 - SURFACE
      ?auto_953 - SURFACE
      ?auto_954 - SURFACE
      ?auto_955 - SURFACE
      ?auto_956 - SURFACE
    )
    :vars
    (
      ?auto_958 - HOIST
      ?auto_959 - PLACE
      ?auto_962 - PLACE
      ?auto_961 - HOIST
      ?auto_960 - SURFACE
      ?auto_967 - PLACE
      ?auto_963 - HOIST
      ?auto_966 - SURFACE
      ?auto_965 - PLACE
      ?auto_969 - HOIST
      ?auto_968 - SURFACE
      ?auto_971 - PLACE
      ?auto_970 - HOIST
      ?auto_964 - SURFACE
      ?auto_957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_958 ?auto_959 ) ( IS-CRATE ?auto_956 ) ( not ( = ?auto_962 ?auto_959 ) ) ( HOIST-AT ?auto_961 ?auto_962 ) ( AVAILABLE ?auto_961 ) ( SURFACE-AT ?auto_956 ?auto_962 ) ( ON ?auto_956 ?auto_960 ) ( CLEAR ?auto_956 ) ( not ( = ?auto_955 ?auto_956 ) ) ( not ( = ?auto_955 ?auto_960 ) ) ( not ( = ?auto_956 ?auto_960 ) ) ( not ( = ?auto_958 ?auto_961 ) ) ( IS-CRATE ?auto_955 ) ( not ( = ?auto_967 ?auto_959 ) ) ( HOIST-AT ?auto_963 ?auto_967 ) ( AVAILABLE ?auto_963 ) ( SURFACE-AT ?auto_955 ?auto_967 ) ( ON ?auto_955 ?auto_966 ) ( CLEAR ?auto_955 ) ( not ( = ?auto_954 ?auto_955 ) ) ( not ( = ?auto_954 ?auto_966 ) ) ( not ( = ?auto_955 ?auto_966 ) ) ( not ( = ?auto_958 ?auto_963 ) ) ( IS-CRATE ?auto_954 ) ( not ( = ?auto_965 ?auto_959 ) ) ( HOIST-AT ?auto_969 ?auto_965 ) ( AVAILABLE ?auto_969 ) ( SURFACE-AT ?auto_954 ?auto_965 ) ( ON ?auto_954 ?auto_968 ) ( CLEAR ?auto_954 ) ( not ( = ?auto_953 ?auto_954 ) ) ( not ( = ?auto_953 ?auto_968 ) ) ( not ( = ?auto_954 ?auto_968 ) ) ( not ( = ?auto_958 ?auto_969 ) ) ( SURFACE-AT ?auto_952 ?auto_959 ) ( CLEAR ?auto_952 ) ( IS-CRATE ?auto_953 ) ( AVAILABLE ?auto_958 ) ( not ( = ?auto_971 ?auto_959 ) ) ( HOIST-AT ?auto_970 ?auto_971 ) ( AVAILABLE ?auto_970 ) ( SURFACE-AT ?auto_953 ?auto_971 ) ( ON ?auto_953 ?auto_964 ) ( CLEAR ?auto_953 ) ( TRUCK-AT ?auto_957 ?auto_959 ) ( not ( = ?auto_952 ?auto_953 ) ) ( not ( = ?auto_952 ?auto_964 ) ) ( not ( = ?auto_953 ?auto_964 ) ) ( not ( = ?auto_958 ?auto_970 ) ) ( not ( = ?auto_952 ?auto_954 ) ) ( not ( = ?auto_952 ?auto_968 ) ) ( not ( = ?auto_954 ?auto_964 ) ) ( not ( = ?auto_965 ?auto_971 ) ) ( not ( = ?auto_969 ?auto_970 ) ) ( not ( = ?auto_968 ?auto_964 ) ) ( not ( = ?auto_952 ?auto_955 ) ) ( not ( = ?auto_952 ?auto_966 ) ) ( not ( = ?auto_953 ?auto_955 ) ) ( not ( = ?auto_953 ?auto_966 ) ) ( not ( = ?auto_955 ?auto_968 ) ) ( not ( = ?auto_955 ?auto_964 ) ) ( not ( = ?auto_967 ?auto_965 ) ) ( not ( = ?auto_967 ?auto_971 ) ) ( not ( = ?auto_963 ?auto_969 ) ) ( not ( = ?auto_963 ?auto_970 ) ) ( not ( = ?auto_966 ?auto_968 ) ) ( not ( = ?auto_966 ?auto_964 ) ) ( not ( = ?auto_952 ?auto_956 ) ) ( not ( = ?auto_952 ?auto_960 ) ) ( not ( = ?auto_953 ?auto_956 ) ) ( not ( = ?auto_953 ?auto_960 ) ) ( not ( = ?auto_954 ?auto_956 ) ) ( not ( = ?auto_954 ?auto_960 ) ) ( not ( = ?auto_956 ?auto_966 ) ) ( not ( = ?auto_956 ?auto_968 ) ) ( not ( = ?auto_956 ?auto_964 ) ) ( not ( = ?auto_962 ?auto_967 ) ) ( not ( = ?auto_962 ?auto_965 ) ) ( not ( = ?auto_962 ?auto_971 ) ) ( not ( = ?auto_961 ?auto_963 ) ) ( not ( = ?auto_961 ?auto_969 ) ) ( not ( = ?auto_961 ?auto_970 ) ) ( not ( = ?auto_960 ?auto_966 ) ) ( not ( = ?auto_960 ?auto_968 ) ) ( not ( = ?auto_960 ?auto_964 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_952 ?auto_953 ?auto_954 ?auto_955 )
      ( MAKE-1CRATE ?auto_955 ?auto_956 )
      ( MAKE-4CRATE-VERIFY ?auto_952 ?auto_953 ?auto_954 ?auto_955 ?auto_956 ) )
  )

)

