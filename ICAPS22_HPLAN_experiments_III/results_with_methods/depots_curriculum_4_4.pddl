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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_882 - SURFACE
      ?auto_883 - SURFACE
    )
    :vars
    (
      ?auto_884 - HOIST
      ?auto_885 - PLACE
      ?auto_887 - PLACE
      ?auto_888 - HOIST
      ?auto_889 - SURFACE
      ?auto_886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_884 ?auto_885 ) ( SURFACE-AT ?auto_882 ?auto_885 ) ( CLEAR ?auto_882 ) ( IS-CRATE ?auto_883 ) ( AVAILABLE ?auto_884 ) ( not ( = ?auto_887 ?auto_885 ) ) ( HOIST-AT ?auto_888 ?auto_887 ) ( AVAILABLE ?auto_888 ) ( SURFACE-AT ?auto_883 ?auto_887 ) ( ON ?auto_883 ?auto_889 ) ( CLEAR ?auto_883 ) ( TRUCK-AT ?auto_886 ?auto_885 ) ( not ( = ?auto_882 ?auto_883 ) ) ( not ( = ?auto_882 ?auto_889 ) ) ( not ( = ?auto_883 ?auto_889 ) ) ( not ( = ?auto_884 ?auto_888 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_886 ?auto_885 ?auto_887 )
      ( !LIFT ?auto_888 ?auto_883 ?auto_889 ?auto_887 )
      ( !LOAD ?auto_888 ?auto_883 ?auto_886 ?auto_887 )
      ( !DRIVE ?auto_886 ?auto_887 ?auto_885 )
      ( !UNLOAD ?auto_884 ?auto_883 ?auto_886 ?auto_885 )
      ( !DROP ?auto_884 ?auto_883 ?auto_882 ?auto_885 )
      ( MAKE-1CRATE-VERIFY ?auto_882 ?auto_883 ) )
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
      ?auto_898 - HOIST
      ?auto_901 - PLACE
      ?auto_897 - PLACE
      ?auto_896 - HOIST
      ?auto_900 - SURFACE
      ?auto_903 - PLACE
      ?auto_904 - HOIST
      ?auto_902 - SURFACE
      ?auto_899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_898 ?auto_901 ) ( IS-CRATE ?auto_895 ) ( not ( = ?auto_897 ?auto_901 ) ) ( HOIST-AT ?auto_896 ?auto_897 ) ( AVAILABLE ?auto_896 ) ( SURFACE-AT ?auto_895 ?auto_897 ) ( ON ?auto_895 ?auto_900 ) ( CLEAR ?auto_895 ) ( not ( = ?auto_894 ?auto_895 ) ) ( not ( = ?auto_894 ?auto_900 ) ) ( not ( = ?auto_895 ?auto_900 ) ) ( not ( = ?auto_898 ?auto_896 ) ) ( SURFACE-AT ?auto_893 ?auto_901 ) ( CLEAR ?auto_893 ) ( IS-CRATE ?auto_894 ) ( AVAILABLE ?auto_898 ) ( not ( = ?auto_903 ?auto_901 ) ) ( HOIST-AT ?auto_904 ?auto_903 ) ( AVAILABLE ?auto_904 ) ( SURFACE-AT ?auto_894 ?auto_903 ) ( ON ?auto_894 ?auto_902 ) ( CLEAR ?auto_894 ) ( TRUCK-AT ?auto_899 ?auto_901 ) ( not ( = ?auto_893 ?auto_894 ) ) ( not ( = ?auto_893 ?auto_902 ) ) ( not ( = ?auto_894 ?auto_902 ) ) ( not ( = ?auto_898 ?auto_904 ) ) ( not ( = ?auto_893 ?auto_895 ) ) ( not ( = ?auto_893 ?auto_900 ) ) ( not ( = ?auto_895 ?auto_902 ) ) ( not ( = ?auto_897 ?auto_903 ) ) ( not ( = ?auto_896 ?auto_904 ) ) ( not ( = ?auto_900 ?auto_902 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_893 ?auto_894 )
      ( MAKE-1CRATE ?auto_894 ?auto_895 )
      ( MAKE-2CRATE-VERIFY ?auto_893 ?auto_894 ?auto_895 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_907 - SURFACE
      ?auto_908 - SURFACE
    )
    :vars
    (
      ?auto_909 - HOIST
      ?auto_910 - PLACE
      ?auto_912 - PLACE
      ?auto_913 - HOIST
      ?auto_914 - SURFACE
      ?auto_911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_909 ?auto_910 ) ( SURFACE-AT ?auto_907 ?auto_910 ) ( CLEAR ?auto_907 ) ( IS-CRATE ?auto_908 ) ( AVAILABLE ?auto_909 ) ( not ( = ?auto_912 ?auto_910 ) ) ( HOIST-AT ?auto_913 ?auto_912 ) ( AVAILABLE ?auto_913 ) ( SURFACE-AT ?auto_908 ?auto_912 ) ( ON ?auto_908 ?auto_914 ) ( CLEAR ?auto_908 ) ( TRUCK-AT ?auto_911 ?auto_910 ) ( not ( = ?auto_907 ?auto_908 ) ) ( not ( = ?auto_907 ?auto_914 ) ) ( not ( = ?auto_908 ?auto_914 ) ) ( not ( = ?auto_909 ?auto_913 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_911 ?auto_910 ?auto_912 )
      ( !LIFT ?auto_913 ?auto_908 ?auto_914 ?auto_912 )
      ( !LOAD ?auto_913 ?auto_908 ?auto_911 ?auto_912 )
      ( !DRIVE ?auto_911 ?auto_912 ?auto_910 )
      ( !UNLOAD ?auto_909 ?auto_908 ?auto_911 ?auto_910 )
      ( !DROP ?auto_909 ?auto_908 ?auto_907 ?auto_910 )
      ( MAKE-1CRATE-VERIFY ?auto_907 ?auto_908 ) )
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
      ?auto_925 - HOIST
      ?auto_927 - PLACE
      ?auto_926 - PLACE
      ?auto_923 - HOIST
      ?auto_924 - SURFACE
      ?auto_933 - PLACE
      ?auto_934 - HOIST
      ?auto_932 - SURFACE
      ?auto_930 - PLACE
      ?auto_931 - HOIST
      ?auto_929 - SURFACE
      ?auto_928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_925 ?auto_927 ) ( IS-CRATE ?auto_922 ) ( not ( = ?auto_926 ?auto_927 ) ) ( HOIST-AT ?auto_923 ?auto_926 ) ( AVAILABLE ?auto_923 ) ( SURFACE-AT ?auto_922 ?auto_926 ) ( ON ?auto_922 ?auto_924 ) ( CLEAR ?auto_922 ) ( not ( = ?auto_921 ?auto_922 ) ) ( not ( = ?auto_921 ?auto_924 ) ) ( not ( = ?auto_922 ?auto_924 ) ) ( not ( = ?auto_925 ?auto_923 ) ) ( IS-CRATE ?auto_921 ) ( not ( = ?auto_933 ?auto_927 ) ) ( HOIST-AT ?auto_934 ?auto_933 ) ( AVAILABLE ?auto_934 ) ( SURFACE-AT ?auto_921 ?auto_933 ) ( ON ?auto_921 ?auto_932 ) ( CLEAR ?auto_921 ) ( not ( = ?auto_920 ?auto_921 ) ) ( not ( = ?auto_920 ?auto_932 ) ) ( not ( = ?auto_921 ?auto_932 ) ) ( not ( = ?auto_925 ?auto_934 ) ) ( SURFACE-AT ?auto_919 ?auto_927 ) ( CLEAR ?auto_919 ) ( IS-CRATE ?auto_920 ) ( AVAILABLE ?auto_925 ) ( not ( = ?auto_930 ?auto_927 ) ) ( HOIST-AT ?auto_931 ?auto_930 ) ( AVAILABLE ?auto_931 ) ( SURFACE-AT ?auto_920 ?auto_930 ) ( ON ?auto_920 ?auto_929 ) ( CLEAR ?auto_920 ) ( TRUCK-AT ?auto_928 ?auto_927 ) ( not ( = ?auto_919 ?auto_920 ) ) ( not ( = ?auto_919 ?auto_929 ) ) ( not ( = ?auto_920 ?auto_929 ) ) ( not ( = ?auto_925 ?auto_931 ) ) ( not ( = ?auto_919 ?auto_921 ) ) ( not ( = ?auto_919 ?auto_932 ) ) ( not ( = ?auto_921 ?auto_929 ) ) ( not ( = ?auto_933 ?auto_930 ) ) ( not ( = ?auto_934 ?auto_931 ) ) ( not ( = ?auto_932 ?auto_929 ) ) ( not ( = ?auto_919 ?auto_922 ) ) ( not ( = ?auto_919 ?auto_924 ) ) ( not ( = ?auto_920 ?auto_922 ) ) ( not ( = ?auto_920 ?auto_924 ) ) ( not ( = ?auto_922 ?auto_932 ) ) ( not ( = ?auto_922 ?auto_929 ) ) ( not ( = ?auto_926 ?auto_933 ) ) ( not ( = ?auto_926 ?auto_930 ) ) ( not ( = ?auto_923 ?auto_934 ) ) ( not ( = ?auto_923 ?auto_931 ) ) ( not ( = ?auto_924 ?auto_932 ) ) ( not ( = ?auto_924 ?auto_929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_919 ?auto_920 ?auto_921 )
      ( MAKE-1CRATE ?auto_921 ?auto_922 )
      ( MAKE-3CRATE-VERIFY ?auto_919 ?auto_920 ?auto_921 ?auto_922 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_937 - SURFACE
      ?auto_938 - SURFACE
    )
    :vars
    (
      ?auto_939 - HOIST
      ?auto_940 - PLACE
      ?auto_942 - PLACE
      ?auto_943 - HOIST
      ?auto_944 - SURFACE
      ?auto_941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_939 ?auto_940 ) ( SURFACE-AT ?auto_937 ?auto_940 ) ( CLEAR ?auto_937 ) ( IS-CRATE ?auto_938 ) ( AVAILABLE ?auto_939 ) ( not ( = ?auto_942 ?auto_940 ) ) ( HOIST-AT ?auto_943 ?auto_942 ) ( AVAILABLE ?auto_943 ) ( SURFACE-AT ?auto_938 ?auto_942 ) ( ON ?auto_938 ?auto_944 ) ( CLEAR ?auto_938 ) ( TRUCK-AT ?auto_941 ?auto_940 ) ( not ( = ?auto_937 ?auto_938 ) ) ( not ( = ?auto_937 ?auto_944 ) ) ( not ( = ?auto_938 ?auto_944 ) ) ( not ( = ?auto_939 ?auto_943 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_941 ?auto_940 ?auto_942 )
      ( !LIFT ?auto_943 ?auto_938 ?auto_944 ?auto_942 )
      ( !LOAD ?auto_943 ?auto_938 ?auto_941 ?auto_942 )
      ( !DRIVE ?auto_941 ?auto_942 ?auto_940 )
      ( !UNLOAD ?auto_939 ?auto_938 ?auto_941 ?auto_940 )
      ( !DROP ?auto_939 ?auto_938 ?auto_937 ?auto_940 )
      ( MAKE-1CRATE-VERIFY ?auto_937 ?auto_938 ) )
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
      ?auto_960 - PLACE
      ?auto_958 - HOIST
      ?auto_957 - SURFACE
      ?auto_962 - PLACE
      ?auto_965 - HOIST
      ?auto_968 - SURFACE
      ?auto_969 - PLACE
      ?auto_967 - HOIST
      ?auto_961 - SURFACE
      ?auto_964 - PLACE
      ?auto_966 - HOIST
      ?auto_963 - SURFACE
      ?auto_955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_956 ?auto_959 ) ( IS-CRATE ?auto_954 ) ( not ( = ?auto_960 ?auto_959 ) ) ( HOIST-AT ?auto_958 ?auto_960 ) ( AVAILABLE ?auto_958 ) ( SURFACE-AT ?auto_954 ?auto_960 ) ( ON ?auto_954 ?auto_957 ) ( CLEAR ?auto_954 ) ( not ( = ?auto_953 ?auto_954 ) ) ( not ( = ?auto_953 ?auto_957 ) ) ( not ( = ?auto_954 ?auto_957 ) ) ( not ( = ?auto_956 ?auto_958 ) ) ( IS-CRATE ?auto_953 ) ( not ( = ?auto_962 ?auto_959 ) ) ( HOIST-AT ?auto_965 ?auto_962 ) ( AVAILABLE ?auto_965 ) ( SURFACE-AT ?auto_953 ?auto_962 ) ( ON ?auto_953 ?auto_968 ) ( CLEAR ?auto_953 ) ( not ( = ?auto_952 ?auto_953 ) ) ( not ( = ?auto_952 ?auto_968 ) ) ( not ( = ?auto_953 ?auto_968 ) ) ( not ( = ?auto_956 ?auto_965 ) ) ( IS-CRATE ?auto_952 ) ( not ( = ?auto_969 ?auto_959 ) ) ( HOIST-AT ?auto_967 ?auto_969 ) ( AVAILABLE ?auto_967 ) ( SURFACE-AT ?auto_952 ?auto_969 ) ( ON ?auto_952 ?auto_961 ) ( CLEAR ?auto_952 ) ( not ( = ?auto_951 ?auto_952 ) ) ( not ( = ?auto_951 ?auto_961 ) ) ( not ( = ?auto_952 ?auto_961 ) ) ( not ( = ?auto_956 ?auto_967 ) ) ( SURFACE-AT ?auto_950 ?auto_959 ) ( CLEAR ?auto_950 ) ( IS-CRATE ?auto_951 ) ( AVAILABLE ?auto_956 ) ( not ( = ?auto_964 ?auto_959 ) ) ( HOIST-AT ?auto_966 ?auto_964 ) ( AVAILABLE ?auto_966 ) ( SURFACE-AT ?auto_951 ?auto_964 ) ( ON ?auto_951 ?auto_963 ) ( CLEAR ?auto_951 ) ( TRUCK-AT ?auto_955 ?auto_959 ) ( not ( = ?auto_950 ?auto_951 ) ) ( not ( = ?auto_950 ?auto_963 ) ) ( not ( = ?auto_951 ?auto_963 ) ) ( not ( = ?auto_956 ?auto_966 ) ) ( not ( = ?auto_950 ?auto_952 ) ) ( not ( = ?auto_950 ?auto_961 ) ) ( not ( = ?auto_952 ?auto_963 ) ) ( not ( = ?auto_969 ?auto_964 ) ) ( not ( = ?auto_967 ?auto_966 ) ) ( not ( = ?auto_961 ?auto_963 ) ) ( not ( = ?auto_950 ?auto_953 ) ) ( not ( = ?auto_950 ?auto_968 ) ) ( not ( = ?auto_951 ?auto_953 ) ) ( not ( = ?auto_951 ?auto_968 ) ) ( not ( = ?auto_953 ?auto_961 ) ) ( not ( = ?auto_953 ?auto_963 ) ) ( not ( = ?auto_962 ?auto_969 ) ) ( not ( = ?auto_962 ?auto_964 ) ) ( not ( = ?auto_965 ?auto_967 ) ) ( not ( = ?auto_965 ?auto_966 ) ) ( not ( = ?auto_968 ?auto_961 ) ) ( not ( = ?auto_968 ?auto_963 ) ) ( not ( = ?auto_950 ?auto_954 ) ) ( not ( = ?auto_950 ?auto_957 ) ) ( not ( = ?auto_951 ?auto_954 ) ) ( not ( = ?auto_951 ?auto_957 ) ) ( not ( = ?auto_952 ?auto_954 ) ) ( not ( = ?auto_952 ?auto_957 ) ) ( not ( = ?auto_954 ?auto_968 ) ) ( not ( = ?auto_954 ?auto_961 ) ) ( not ( = ?auto_954 ?auto_963 ) ) ( not ( = ?auto_960 ?auto_962 ) ) ( not ( = ?auto_960 ?auto_969 ) ) ( not ( = ?auto_960 ?auto_964 ) ) ( not ( = ?auto_958 ?auto_965 ) ) ( not ( = ?auto_958 ?auto_967 ) ) ( not ( = ?auto_958 ?auto_966 ) ) ( not ( = ?auto_957 ?auto_968 ) ) ( not ( = ?auto_957 ?auto_961 ) ) ( not ( = ?auto_957 ?auto_963 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_950 ?auto_951 ?auto_952 ?auto_953 )
      ( MAKE-1CRATE ?auto_953 ?auto_954 )
      ( MAKE-4CRATE-VERIFY ?auto_950 ?auto_951 ?auto_952 ?auto_953 ?auto_954 ) )
  )

)

