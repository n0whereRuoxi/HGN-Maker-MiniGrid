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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_884 - SURFACE
      ?auto_885 - SURFACE
    )
    :vars
    (
      ?auto_886 - HOIST
      ?auto_887 - PLACE
      ?auto_889 - PLACE
      ?auto_890 - HOIST
      ?auto_891 - SURFACE
      ?auto_888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_886 ?auto_887 ) ( SURFACE-AT ?auto_884 ?auto_887 ) ( CLEAR ?auto_884 ) ( IS-CRATE ?auto_885 ) ( AVAILABLE ?auto_886 ) ( not ( = ?auto_889 ?auto_887 ) ) ( HOIST-AT ?auto_890 ?auto_889 ) ( AVAILABLE ?auto_890 ) ( SURFACE-AT ?auto_885 ?auto_889 ) ( ON ?auto_885 ?auto_891 ) ( CLEAR ?auto_885 ) ( TRUCK-AT ?auto_888 ?auto_887 ) ( not ( = ?auto_884 ?auto_885 ) ) ( not ( = ?auto_884 ?auto_891 ) ) ( not ( = ?auto_885 ?auto_891 ) ) ( not ( = ?auto_886 ?auto_890 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_888 ?auto_887 ?auto_889 )
      ( !LIFT ?auto_890 ?auto_885 ?auto_891 ?auto_889 )
      ( !LOAD ?auto_890 ?auto_885 ?auto_888 ?auto_889 )
      ( !DRIVE ?auto_888 ?auto_889 ?auto_887 )
      ( !UNLOAD ?auto_886 ?auto_885 ?auto_888 ?auto_887 )
      ( !DROP ?auto_886 ?auto_885 ?auto_884 ?auto_887 )
      ( MAKE-1CRATE-VERIFY ?auto_884 ?auto_885 ) )
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
      ?auto_902 - HOIST
      ?auto_898 - PLACE
      ?auto_901 - PLACE
      ?auto_903 - HOIST
      ?auto_899 - SURFACE
      ?auto_904 - PLACE
      ?auto_905 - HOIST
      ?auto_906 - SURFACE
      ?auto_900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_902 ?auto_898 ) ( IS-CRATE ?auto_897 ) ( not ( = ?auto_901 ?auto_898 ) ) ( HOIST-AT ?auto_903 ?auto_901 ) ( AVAILABLE ?auto_903 ) ( SURFACE-AT ?auto_897 ?auto_901 ) ( ON ?auto_897 ?auto_899 ) ( CLEAR ?auto_897 ) ( not ( = ?auto_896 ?auto_897 ) ) ( not ( = ?auto_896 ?auto_899 ) ) ( not ( = ?auto_897 ?auto_899 ) ) ( not ( = ?auto_902 ?auto_903 ) ) ( SURFACE-AT ?auto_895 ?auto_898 ) ( CLEAR ?auto_895 ) ( IS-CRATE ?auto_896 ) ( AVAILABLE ?auto_902 ) ( not ( = ?auto_904 ?auto_898 ) ) ( HOIST-AT ?auto_905 ?auto_904 ) ( AVAILABLE ?auto_905 ) ( SURFACE-AT ?auto_896 ?auto_904 ) ( ON ?auto_896 ?auto_906 ) ( CLEAR ?auto_896 ) ( TRUCK-AT ?auto_900 ?auto_898 ) ( not ( = ?auto_895 ?auto_896 ) ) ( not ( = ?auto_895 ?auto_906 ) ) ( not ( = ?auto_896 ?auto_906 ) ) ( not ( = ?auto_902 ?auto_905 ) ) ( not ( = ?auto_895 ?auto_897 ) ) ( not ( = ?auto_895 ?auto_899 ) ) ( not ( = ?auto_897 ?auto_906 ) ) ( not ( = ?auto_901 ?auto_904 ) ) ( not ( = ?auto_903 ?auto_905 ) ) ( not ( = ?auto_899 ?auto_906 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_895 ?auto_896 )
      ( MAKE-1CRATE ?auto_896 ?auto_897 )
      ( MAKE-2CRATE-VERIFY ?auto_895 ?auto_896 ?auto_897 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_909 - SURFACE
      ?auto_910 - SURFACE
    )
    :vars
    (
      ?auto_911 - HOIST
      ?auto_912 - PLACE
      ?auto_914 - PLACE
      ?auto_915 - HOIST
      ?auto_916 - SURFACE
      ?auto_913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911 ?auto_912 ) ( SURFACE-AT ?auto_909 ?auto_912 ) ( CLEAR ?auto_909 ) ( IS-CRATE ?auto_910 ) ( AVAILABLE ?auto_911 ) ( not ( = ?auto_914 ?auto_912 ) ) ( HOIST-AT ?auto_915 ?auto_914 ) ( AVAILABLE ?auto_915 ) ( SURFACE-AT ?auto_910 ?auto_914 ) ( ON ?auto_910 ?auto_916 ) ( CLEAR ?auto_910 ) ( TRUCK-AT ?auto_913 ?auto_912 ) ( not ( = ?auto_909 ?auto_910 ) ) ( not ( = ?auto_909 ?auto_916 ) ) ( not ( = ?auto_910 ?auto_916 ) ) ( not ( = ?auto_911 ?auto_915 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_913 ?auto_912 ?auto_914 )
      ( !LIFT ?auto_915 ?auto_910 ?auto_916 ?auto_914 )
      ( !LOAD ?auto_915 ?auto_910 ?auto_913 ?auto_914 )
      ( !DRIVE ?auto_913 ?auto_914 ?auto_912 )
      ( !UNLOAD ?auto_911 ?auto_910 ?auto_913 ?auto_912 )
      ( !DROP ?auto_911 ?auto_910 ?auto_909 ?auto_912 )
      ( MAKE-1CRATE-VERIFY ?auto_909 ?auto_910 ) )
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
      ?auto_927 - PLACE
      ?auto_928 - PLACE
      ?auto_926 - HOIST
      ?auto_925 - SURFACE
      ?auto_935 - PLACE
      ?auto_936 - HOIST
      ?auto_931 - SURFACE
      ?auto_932 - PLACE
      ?auto_933 - HOIST
      ?auto_934 - SURFACE
      ?auto_929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_930 ?auto_927 ) ( IS-CRATE ?auto_924 ) ( not ( = ?auto_928 ?auto_927 ) ) ( HOIST-AT ?auto_926 ?auto_928 ) ( AVAILABLE ?auto_926 ) ( SURFACE-AT ?auto_924 ?auto_928 ) ( ON ?auto_924 ?auto_925 ) ( CLEAR ?auto_924 ) ( not ( = ?auto_923 ?auto_924 ) ) ( not ( = ?auto_923 ?auto_925 ) ) ( not ( = ?auto_924 ?auto_925 ) ) ( not ( = ?auto_930 ?auto_926 ) ) ( IS-CRATE ?auto_923 ) ( not ( = ?auto_935 ?auto_927 ) ) ( HOIST-AT ?auto_936 ?auto_935 ) ( AVAILABLE ?auto_936 ) ( SURFACE-AT ?auto_923 ?auto_935 ) ( ON ?auto_923 ?auto_931 ) ( CLEAR ?auto_923 ) ( not ( = ?auto_922 ?auto_923 ) ) ( not ( = ?auto_922 ?auto_931 ) ) ( not ( = ?auto_923 ?auto_931 ) ) ( not ( = ?auto_930 ?auto_936 ) ) ( SURFACE-AT ?auto_921 ?auto_927 ) ( CLEAR ?auto_921 ) ( IS-CRATE ?auto_922 ) ( AVAILABLE ?auto_930 ) ( not ( = ?auto_932 ?auto_927 ) ) ( HOIST-AT ?auto_933 ?auto_932 ) ( AVAILABLE ?auto_933 ) ( SURFACE-AT ?auto_922 ?auto_932 ) ( ON ?auto_922 ?auto_934 ) ( CLEAR ?auto_922 ) ( TRUCK-AT ?auto_929 ?auto_927 ) ( not ( = ?auto_921 ?auto_922 ) ) ( not ( = ?auto_921 ?auto_934 ) ) ( not ( = ?auto_922 ?auto_934 ) ) ( not ( = ?auto_930 ?auto_933 ) ) ( not ( = ?auto_921 ?auto_923 ) ) ( not ( = ?auto_921 ?auto_931 ) ) ( not ( = ?auto_923 ?auto_934 ) ) ( not ( = ?auto_935 ?auto_932 ) ) ( not ( = ?auto_936 ?auto_933 ) ) ( not ( = ?auto_931 ?auto_934 ) ) ( not ( = ?auto_921 ?auto_924 ) ) ( not ( = ?auto_921 ?auto_925 ) ) ( not ( = ?auto_922 ?auto_924 ) ) ( not ( = ?auto_922 ?auto_925 ) ) ( not ( = ?auto_924 ?auto_931 ) ) ( not ( = ?auto_924 ?auto_934 ) ) ( not ( = ?auto_928 ?auto_935 ) ) ( not ( = ?auto_928 ?auto_932 ) ) ( not ( = ?auto_926 ?auto_936 ) ) ( not ( = ?auto_926 ?auto_933 ) ) ( not ( = ?auto_925 ?auto_931 ) ) ( not ( = ?auto_925 ?auto_934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_921 ?auto_922 ?auto_923 )
      ( MAKE-1CRATE ?auto_923 ?auto_924 )
      ( MAKE-3CRATE-VERIFY ?auto_921 ?auto_922 ?auto_923 ?auto_924 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_939 - SURFACE
      ?auto_940 - SURFACE
    )
    :vars
    (
      ?auto_941 - HOIST
      ?auto_942 - PLACE
      ?auto_944 - PLACE
      ?auto_945 - HOIST
      ?auto_946 - SURFACE
      ?auto_943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_941 ?auto_942 ) ( SURFACE-AT ?auto_939 ?auto_942 ) ( CLEAR ?auto_939 ) ( IS-CRATE ?auto_940 ) ( AVAILABLE ?auto_941 ) ( not ( = ?auto_944 ?auto_942 ) ) ( HOIST-AT ?auto_945 ?auto_944 ) ( AVAILABLE ?auto_945 ) ( SURFACE-AT ?auto_940 ?auto_944 ) ( ON ?auto_940 ?auto_946 ) ( CLEAR ?auto_940 ) ( TRUCK-AT ?auto_943 ?auto_942 ) ( not ( = ?auto_939 ?auto_940 ) ) ( not ( = ?auto_939 ?auto_946 ) ) ( not ( = ?auto_940 ?auto_946 ) ) ( not ( = ?auto_941 ?auto_945 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_943 ?auto_942 ?auto_944 )
      ( !LIFT ?auto_945 ?auto_940 ?auto_946 ?auto_944 )
      ( !LOAD ?auto_945 ?auto_940 ?auto_943 ?auto_944 )
      ( !DRIVE ?auto_943 ?auto_944 ?auto_942 )
      ( !UNLOAD ?auto_941 ?auto_940 ?auto_943 ?auto_942 )
      ( !DROP ?auto_941 ?auto_940 ?auto_939 ?auto_942 )
      ( MAKE-1CRATE-VERIFY ?auto_939 ?auto_940 ) )
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
      ?auto_957 - HOIST
      ?auto_961 - PLACE
      ?auto_962 - PLACE
      ?auto_960 - HOIST
      ?auto_959 - SURFACE
      ?auto_971 - PLACE
      ?auto_966 - HOIST
      ?auto_965 - SURFACE
      ?auto_969 - PLACE
      ?auto_967 - HOIST
      ?auto_964 - SURFACE
      ?auto_963 - PLACE
      ?auto_968 - HOIST
      ?auto_970 - SURFACE
      ?auto_958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_957 ?auto_961 ) ( IS-CRATE ?auto_956 ) ( not ( = ?auto_962 ?auto_961 ) ) ( HOIST-AT ?auto_960 ?auto_962 ) ( AVAILABLE ?auto_960 ) ( SURFACE-AT ?auto_956 ?auto_962 ) ( ON ?auto_956 ?auto_959 ) ( CLEAR ?auto_956 ) ( not ( = ?auto_955 ?auto_956 ) ) ( not ( = ?auto_955 ?auto_959 ) ) ( not ( = ?auto_956 ?auto_959 ) ) ( not ( = ?auto_957 ?auto_960 ) ) ( IS-CRATE ?auto_955 ) ( not ( = ?auto_971 ?auto_961 ) ) ( HOIST-AT ?auto_966 ?auto_971 ) ( AVAILABLE ?auto_966 ) ( SURFACE-AT ?auto_955 ?auto_971 ) ( ON ?auto_955 ?auto_965 ) ( CLEAR ?auto_955 ) ( not ( = ?auto_954 ?auto_955 ) ) ( not ( = ?auto_954 ?auto_965 ) ) ( not ( = ?auto_955 ?auto_965 ) ) ( not ( = ?auto_957 ?auto_966 ) ) ( IS-CRATE ?auto_954 ) ( not ( = ?auto_969 ?auto_961 ) ) ( HOIST-AT ?auto_967 ?auto_969 ) ( AVAILABLE ?auto_967 ) ( SURFACE-AT ?auto_954 ?auto_969 ) ( ON ?auto_954 ?auto_964 ) ( CLEAR ?auto_954 ) ( not ( = ?auto_953 ?auto_954 ) ) ( not ( = ?auto_953 ?auto_964 ) ) ( not ( = ?auto_954 ?auto_964 ) ) ( not ( = ?auto_957 ?auto_967 ) ) ( SURFACE-AT ?auto_952 ?auto_961 ) ( CLEAR ?auto_952 ) ( IS-CRATE ?auto_953 ) ( AVAILABLE ?auto_957 ) ( not ( = ?auto_963 ?auto_961 ) ) ( HOIST-AT ?auto_968 ?auto_963 ) ( AVAILABLE ?auto_968 ) ( SURFACE-AT ?auto_953 ?auto_963 ) ( ON ?auto_953 ?auto_970 ) ( CLEAR ?auto_953 ) ( TRUCK-AT ?auto_958 ?auto_961 ) ( not ( = ?auto_952 ?auto_953 ) ) ( not ( = ?auto_952 ?auto_970 ) ) ( not ( = ?auto_953 ?auto_970 ) ) ( not ( = ?auto_957 ?auto_968 ) ) ( not ( = ?auto_952 ?auto_954 ) ) ( not ( = ?auto_952 ?auto_964 ) ) ( not ( = ?auto_954 ?auto_970 ) ) ( not ( = ?auto_969 ?auto_963 ) ) ( not ( = ?auto_967 ?auto_968 ) ) ( not ( = ?auto_964 ?auto_970 ) ) ( not ( = ?auto_952 ?auto_955 ) ) ( not ( = ?auto_952 ?auto_965 ) ) ( not ( = ?auto_953 ?auto_955 ) ) ( not ( = ?auto_953 ?auto_965 ) ) ( not ( = ?auto_955 ?auto_964 ) ) ( not ( = ?auto_955 ?auto_970 ) ) ( not ( = ?auto_971 ?auto_969 ) ) ( not ( = ?auto_971 ?auto_963 ) ) ( not ( = ?auto_966 ?auto_967 ) ) ( not ( = ?auto_966 ?auto_968 ) ) ( not ( = ?auto_965 ?auto_964 ) ) ( not ( = ?auto_965 ?auto_970 ) ) ( not ( = ?auto_952 ?auto_956 ) ) ( not ( = ?auto_952 ?auto_959 ) ) ( not ( = ?auto_953 ?auto_956 ) ) ( not ( = ?auto_953 ?auto_959 ) ) ( not ( = ?auto_954 ?auto_956 ) ) ( not ( = ?auto_954 ?auto_959 ) ) ( not ( = ?auto_956 ?auto_965 ) ) ( not ( = ?auto_956 ?auto_964 ) ) ( not ( = ?auto_956 ?auto_970 ) ) ( not ( = ?auto_962 ?auto_971 ) ) ( not ( = ?auto_962 ?auto_969 ) ) ( not ( = ?auto_962 ?auto_963 ) ) ( not ( = ?auto_960 ?auto_966 ) ) ( not ( = ?auto_960 ?auto_967 ) ) ( not ( = ?auto_960 ?auto_968 ) ) ( not ( = ?auto_959 ?auto_965 ) ) ( not ( = ?auto_959 ?auto_964 ) ) ( not ( = ?auto_959 ?auto_970 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_952 ?auto_953 ?auto_954 ?auto_955 )
      ( MAKE-1CRATE ?auto_955 ?auto_956 )
      ( MAKE-4CRATE-VERIFY ?auto_952 ?auto_953 ?auto_954 ?auto_955 ?auto_956 ) )
  )

)

