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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54849 - SURFACE
      ?auto_54850 - SURFACE
    )
    :vars
    (
      ?auto_54851 - HOIST
      ?auto_54852 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54851 ?auto_54852 ) ( SURFACE-AT ?auto_54849 ?auto_54852 ) ( CLEAR ?auto_54849 ) ( LIFTING ?auto_54851 ?auto_54850 ) ( IS-CRATE ?auto_54850 ) ( not ( = ?auto_54849 ?auto_54850 ) ) )
    :subtasks
    ( ( !DROP ?auto_54851 ?auto_54850 ?auto_54849 ?auto_54852 )
      ( MAKE-1CRATE-VERIFY ?auto_54849 ?auto_54850 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54853 - SURFACE
      ?auto_54854 - SURFACE
    )
    :vars
    (
      ?auto_54856 - HOIST
      ?auto_54855 - PLACE
      ?auto_54857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54856 ?auto_54855 ) ( SURFACE-AT ?auto_54853 ?auto_54855 ) ( CLEAR ?auto_54853 ) ( IS-CRATE ?auto_54854 ) ( not ( = ?auto_54853 ?auto_54854 ) ) ( TRUCK-AT ?auto_54857 ?auto_54855 ) ( AVAILABLE ?auto_54856 ) ( IN ?auto_54854 ?auto_54857 ) )
    :subtasks
    ( ( !UNLOAD ?auto_54856 ?auto_54854 ?auto_54857 ?auto_54855 )
      ( MAKE-1CRATE ?auto_54853 ?auto_54854 )
      ( MAKE-1CRATE-VERIFY ?auto_54853 ?auto_54854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54858 - SURFACE
      ?auto_54859 - SURFACE
    )
    :vars
    (
      ?auto_54861 - HOIST
      ?auto_54860 - PLACE
      ?auto_54862 - TRUCK
      ?auto_54863 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54861 ?auto_54860 ) ( SURFACE-AT ?auto_54858 ?auto_54860 ) ( CLEAR ?auto_54858 ) ( IS-CRATE ?auto_54859 ) ( not ( = ?auto_54858 ?auto_54859 ) ) ( AVAILABLE ?auto_54861 ) ( IN ?auto_54859 ?auto_54862 ) ( TRUCK-AT ?auto_54862 ?auto_54863 ) ( not ( = ?auto_54863 ?auto_54860 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54862 ?auto_54863 ?auto_54860 )
      ( MAKE-1CRATE ?auto_54858 ?auto_54859 )
      ( MAKE-1CRATE-VERIFY ?auto_54858 ?auto_54859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54864 - SURFACE
      ?auto_54865 - SURFACE
    )
    :vars
    (
      ?auto_54869 - HOIST
      ?auto_54868 - PLACE
      ?auto_54866 - TRUCK
      ?auto_54867 - PLACE
      ?auto_54870 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54869 ?auto_54868 ) ( SURFACE-AT ?auto_54864 ?auto_54868 ) ( CLEAR ?auto_54864 ) ( IS-CRATE ?auto_54865 ) ( not ( = ?auto_54864 ?auto_54865 ) ) ( AVAILABLE ?auto_54869 ) ( TRUCK-AT ?auto_54866 ?auto_54867 ) ( not ( = ?auto_54867 ?auto_54868 ) ) ( HOIST-AT ?auto_54870 ?auto_54867 ) ( LIFTING ?auto_54870 ?auto_54865 ) ( not ( = ?auto_54869 ?auto_54870 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54870 ?auto_54865 ?auto_54866 ?auto_54867 )
      ( MAKE-1CRATE ?auto_54864 ?auto_54865 )
      ( MAKE-1CRATE-VERIFY ?auto_54864 ?auto_54865 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54871 - SURFACE
      ?auto_54872 - SURFACE
    )
    :vars
    (
      ?auto_54874 - HOIST
      ?auto_54877 - PLACE
      ?auto_54876 - TRUCK
      ?auto_54875 - PLACE
      ?auto_54873 - HOIST
      ?auto_54878 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54874 ?auto_54877 ) ( SURFACE-AT ?auto_54871 ?auto_54877 ) ( CLEAR ?auto_54871 ) ( IS-CRATE ?auto_54872 ) ( not ( = ?auto_54871 ?auto_54872 ) ) ( AVAILABLE ?auto_54874 ) ( TRUCK-AT ?auto_54876 ?auto_54875 ) ( not ( = ?auto_54875 ?auto_54877 ) ) ( HOIST-AT ?auto_54873 ?auto_54875 ) ( not ( = ?auto_54874 ?auto_54873 ) ) ( AVAILABLE ?auto_54873 ) ( SURFACE-AT ?auto_54872 ?auto_54875 ) ( ON ?auto_54872 ?auto_54878 ) ( CLEAR ?auto_54872 ) ( not ( = ?auto_54871 ?auto_54878 ) ) ( not ( = ?auto_54872 ?auto_54878 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54873 ?auto_54872 ?auto_54878 ?auto_54875 )
      ( MAKE-1CRATE ?auto_54871 ?auto_54872 )
      ( MAKE-1CRATE-VERIFY ?auto_54871 ?auto_54872 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54879 - SURFACE
      ?auto_54880 - SURFACE
    )
    :vars
    (
      ?auto_54881 - HOIST
      ?auto_54884 - PLACE
      ?auto_54882 - PLACE
      ?auto_54886 - HOIST
      ?auto_54883 - SURFACE
      ?auto_54885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54881 ?auto_54884 ) ( SURFACE-AT ?auto_54879 ?auto_54884 ) ( CLEAR ?auto_54879 ) ( IS-CRATE ?auto_54880 ) ( not ( = ?auto_54879 ?auto_54880 ) ) ( AVAILABLE ?auto_54881 ) ( not ( = ?auto_54882 ?auto_54884 ) ) ( HOIST-AT ?auto_54886 ?auto_54882 ) ( not ( = ?auto_54881 ?auto_54886 ) ) ( AVAILABLE ?auto_54886 ) ( SURFACE-AT ?auto_54880 ?auto_54882 ) ( ON ?auto_54880 ?auto_54883 ) ( CLEAR ?auto_54880 ) ( not ( = ?auto_54879 ?auto_54883 ) ) ( not ( = ?auto_54880 ?auto_54883 ) ) ( TRUCK-AT ?auto_54885 ?auto_54884 ) )
    :subtasks
    ( ( !DRIVE ?auto_54885 ?auto_54884 ?auto_54882 )
      ( MAKE-1CRATE ?auto_54879 ?auto_54880 )
      ( MAKE-1CRATE-VERIFY ?auto_54879 ?auto_54880 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54896 - SURFACE
      ?auto_54897 - SURFACE
      ?auto_54898 - SURFACE
    )
    :vars
    (
      ?auto_54900 - HOIST
      ?auto_54899 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54900 ?auto_54899 ) ( SURFACE-AT ?auto_54897 ?auto_54899 ) ( CLEAR ?auto_54897 ) ( LIFTING ?auto_54900 ?auto_54898 ) ( IS-CRATE ?auto_54898 ) ( not ( = ?auto_54897 ?auto_54898 ) ) ( ON ?auto_54897 ?auto_54896 ) ( not ( = ?auto_54896 ?auto_54897 ) ) ( not ( = ?auto_54896 ?auto_54898 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54897 ?auto_54898 )
      ( MAKE-2CRATE-VERIFY ?auto_54896 ?auto_54897 ?auto_54898 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54906 - SURFACE
      ?auto_54907 - SURFACE
      ?auto_54908 - SURFACE
    )
    :vars
    (
      ?auto_54909 - HOIST
      ?auto_54910 - PLACE
      ?auto_54911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54909 ?auto_54910 ) ( SURFACE-AT ?auto_54907 ?auto_54910 ) ( CLEAR ?auto_54907 ) ( IS-CRATE ?auto_54908 ) ( not ( = ?auto_54907 ?auto_54908 ) ) ( TRUCK-AT ?auto_54911 ?auto_54910 ) ( AVAILABLE ?auto_54909 ) ( IN ?auto_54908 ?auto_54911 ) ( ON ?auto_54907 ?auto_54906 ) ( not ( = ?auto_54906 ?auto_54907 ) ) ( not ( = ?auto_54906 ?auto_54908 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54907 ?auto_54908 )
      ( MAKE-2CRATE-VERIFY ?auto_54906 ?auto_54907 ?auto_54908 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54912 - SURFACE
      ?auto_54913 - SURFACE
    )
    :vars
    (
      ?auto_54917 - HOIST
      ?auto_54914 - PLACE
      ?auto_54916 - TRUCK
      ?auto_54915 - SURFACE
      ?auto_54918 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54917 ?auto_54914 ) ( SURFACE-AT ?auto_54912 ?auto_54914 ) ( CLEAR ?auto_54912 ) ( IS-CRATE ?auto_54913 ) ( not ( = ?auto_54912 ?auto_54913 ) ) ( AVAILABLE ?auto_54917 ) ( IN ?auto_54913 ?auto_54916 ) ( ON ?auto_54912 ?auto_54915 ) ( not ( = ?auto_54915 ?auto_54912 ) ) ( not ( = ?auto_54915 ?auto_54913 ) ) ( TRUCK-AT ?auto_54916 ?auto_54918 ) ( not ( = ?auto_54918 ?auto_54914 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54916 ?auto_54918 ?auto_54914 )
      ( MAKE-2CRATE ?auto_54915 ?auto_54912 ?auto_54913 )
      ( MAKE-1CRATE-VERIFY ?auto_54912 ?auto_54913 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54919 - SURFACE
      ?auto_54920 - SURFACE
      ?auto_54921 - SURFACE
    )
    :vars
    (
      ?auto_54923 - HOIST
      ?auto_54924 - PLACE
      ?auto_54925 - TRUCK
      ?auto_54922 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54923 ?auto_54924 ) ( SURFACE-AT ?auto_54920 ?auto_54924 ) ( CLEAR ?auto_54920 ) ( IS-CRATE ?auto_54921 ) ( not ( = ?auto_54920 ?auto_54921 ) ) ( AVAILABLE ?auto_54923 ) ( IN ?auto_54921 ?auto_54925 ) ( ON ?auto_54920 ?auto_54919 ) ( not ( = ?auto_54919 ?auto_54920 ) ) ( not ( = ?auto_54919 ?auto_54921 ) ) ( TRUCK-AT ?auto_54925 ?auto_54922 ) ( not ( = ?auto_54922 ?auto_54924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54920 ?auto_54921 )
      ( MAKE-2CRATE-VERIFY ?auto_54919 ?auto_54920 ?auto_54921 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54926 - SURFACE
      ?auto_54927 - SURFACE
    )
    :vars
    (
      ?auto_54930 - HOIST
      ?auto_54928 - PLACE
      ?auto_54929 - SURFACE
      ?auto_54932 - TRUCK
      ?auto_54931 - PLACE
      ?auto_54933 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54930 ?auto_54928 ) ( SURFACE-AT ?auto_54926 ?auto_54928 ) ( CLEAR ?auto_54926 ) ( IS-CRATE ?auto_54927 ) ( not ( = ?auto_54926 ?auto_54927 ) ) ( AVAILABLE ?auto_54930 ) ( ON ?auto_54926 ?auto_54929 ) ( not ( = ?auto_54929 ?auto_54926 ) ) ( not ( = ?auto_54929 ?auto_54927 ) ) ( TRUCK-AT ?auto_54932 ?auto_54931 ) ( not ( = ?auto_54931 ?auto_54928 ) ) ( HOIST-AT ?auto_54933 ?auto_54931 ) ( LIFTING ?auto_54933 ?auto_54927 ) ( not ( = ?auto_54930 ?auto_54933 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54933 ?auto_54927 ?auto_54932 ?auto_54931 )
      ( MAKE-2CRATE ?auto_54929 ?auto_54926 ?auto_54927 )
      ( MAKE-1CRATE-VERIFY ?auto_54926 ?auto_54927 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54934 - SURFACE
      ?auto_54935 - SURFACE
      ?auto_54936 - SURFACE
    )
    :vars
    (
      ?auto_54939 - HOIST
      ?auto_54937 - PLACE
      ?auto_54938 - TRUCK
      ?auto_54940 - PLACE
      ?auto_54941 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54939 ?auto_54937 ) ( SURFACE-AT ?auto_54935 ?auto_54937 ) ( CLEAR ?auto_54935 ) ( IS-CRATE ?auto_54936 ) ( not ( = ?auto_54935 ?auto_54936 ) ) ( AVAILABLE ?auto_54939 ) ( ON ?auto_54935 ?auto_54934 ) ( not ( = ?auto_54934 ?auto_54935 ) ) ( not ( = ?auto_54934 ?auto_54936 ) ) ( TRUCK-AT ?auto_54938 ?auto_54940 ) ( not ( = ?auto_54940 ?auto_54937 ) ) ( HOIST-AT ?auto_54941 ?auto_54940 ) ( LIFTING ?auto_54941 ?auto_54936 ) ( not ( = ?auto_54939 ?auto_54941 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54935 ?auto_54936 )
      ( MAKE-2CRATE-VERIFY ?auto_54934 ?auto_54935 ?auto_54936 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54942 - SURFACE
      ?auto_54943 - SURFACE
    )
    :vars
    (
      ?auto_54947 - HOIST
      ?auto_54944 - PLACE
      ?auto_54948 - SURFACE
      ?auto_54945 - TRUCK
      ?auto_54946 - PLACE
      ?auto_54949 - HOIST
      ?auto_54950 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54947 ?auto_54944 ) ( SURFACE-AT ?auto_54942 ?auto_54944 ) ( CLEAR ?auto_54942 ) ( IS-CRATE ?auto_54943 ) ( not ( = ?auto_54942 ?auto_54943 ) ) ( AVAILABLE ?auto_54947 ) ( ON ?auto_54942 ?auto_54948 ) ( not ( = ?auto_54948 ?auto_54942 ) ) ( not ( = ?auto_54948 ?auto_54943 ) ) ( TRUCK-AT ?auto_54945 ?auto_54946 ) ( not ( = ?auto_54946 ?auto_54944 ) ) ( HOIST-AT ?auto_54949 ?auto_54946 ) ( not ( = ?auto_54947 ?auto_54949 ) ) ( AVAILABLE ?auto_54949 ) ( SURFACE-AT ?auto_54943 ?auto_54946 ) ( ON ?auto_54943 ?auto_54950 ) ( CLEAR ?auto_54943 ) ( not ( = ?auto_54942 ?auto_54950 ) ) ( not ( = ?auto_54943 ?auto_54950 ) ) ( not ( = ?auto_54948 ?auto_54950 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54949 ?auto_54943 ?auto_54950 ?auto_54946 )
      ( MAKE-2CRATE ?auto_54948 ?auto_54942 ?auto_54943 )
      ( MAKE-1CRATE-VERIFY ?auto_54942 ?auto_54943 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54951 - SURFACE
      ?auto_54952 - SURFACE
      ?auto_54953 - SURFACE
    )
    :vars
    (
      ?auto_54958 - HOIST
      ?auto_54956 - PLACE
      ?auto_54957 - TRUCK
      ?auto_54959 - PLACE
      ?auto_54955 - HOIST
      ?auto_54954 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54958 ?auto_54956 ) ( SURFACE-AT ?auto_54952 ?auto_54956 ) ( CLEAR ?auto_54952 ) ( IS-CRATE ?auto_54953 ) ( not ( = ?auto_54952 ?auto_54953 ) ) ( AVAILABLE ?auto_54958 ) ( ON ?auto_54952 ?auto_54951 ) ( not ( = ?auto_54951 ?auto_54952 ) ) ( not ( = ?auto_54951 ?auto_54953 ) ) ( TRUCK-AT ?auto_54957 ?auto_54959 ) ( not ( = ?auto_54959 ?auto_54956 ) ) ( HOIST-AT ?auto_54955 ?auto_54959 ) ( not ( = ?auto_54958 ?auto_54955 ) ) ( AVAILABLE ?auto_54955 ) ( SURFACE-AT ?auto_54953 ?auto_54959 ) ( ON ?auto_54953 ?auto_54954 ) ( CLEAR ?auto_54953 ) ( not ( = ?auto_54952 ?auto_54954 ) ) ( not ( = ?auto_54953 ?auto_54954 ) ) ( not ( = ?auto_54951 ?auto_54954 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54952 ?auto_54953 )
      ( MAKE-2CRATE-VERIFY ?auto_54951 ?auto_54952 ?auto_54953 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54960 - SURFACE
      ?auto_54961 - SURFACE
    )
    :vars
    (
      ?auto_54964 - HOIST
      ?auto_54963 - PLACE
      ?auto_54965 - SURFACE
      ?auto_54962 - PLACE
      ?auto_54966 - HOIST
      ?auto_54967 - SURFACE
      ?auto_54968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54964 ?auto_54963 ) ( SURFACE-AT ?auto_54960 ?auto_54963 ) ( CLEAR ?auto_54960 ) ( IS-CRATE ?auto_54961 ) ( not ( = ?auto_54960 ?auto_54961 ) ) ( AVAILABLE ?auto_54964 ) ( ON ?auto_54960 ?auto_54965 ) ( not ( = ?auto_54965 ?auto_54960 ) ) ( not ( = ?auto_54965 ?auto_54961 ) ) ( not ( = ?auto_54962 ?auto_54963 ) ) ( HOIST-AT ?auto_54966 ?auto_54962 ) ( not ( = ?auto_54964 ?auto_54966 ) ) ( AVAILABLE ?auto_54966 ) ( SURFACE-AT ?auto_54961 ?auto_54962 ) ( ON ?auto_54961 ?auto_54967 ) ( CLEAR ?auto_54961 ) ( not ( = ?auto_54960 ?auto_54967 ) ) ( not ( = ?auto_54961 ?auto_54967 ) ) ( not ( = ?auto_54965 ?auto_54967 ) ) ( TRUCK-AT ?auto_54968 ?auto_54963 ) )
    :subtasks
    ( ( !DRIVE ?auto_54968 ?auto_54963 ?auto_54962 )
      ( MAKE-2CRATE ?auto_54965 ?auto_54960 ?auto_54961 )
      ( MAKE-1CRATE-VERIFY ?auto_54960 ?auto_54961 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54969 - SURFACE
      ?auto_54970 - SURFACE
      ?auto_54971 - SURFACE
    )
    :vars
    (
      ?auto_54972 - HOIST
      ?auto_54975 - PLACE
      ?auto_54973 - PLACE
      ?auto_54977 - HOIST
      ?auto_54974 - SURFACE
      ?auto_54976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54972 ?auto_54975 ) ( SURFACE-AT ?auto_54970 ?auto_54975 ) ( CLEAR ?auto_54970 ) ( IS-CRATE ?auto_54971 ) ( not ( = ?auto_54970 ?auto_54971 ) ) ( AVAILABLE ?auto_54972 ) ( ON ?auto_54970 ?auto_54969 ) ( not ( = ?auto_54969 ?auto_54970 ) ) ( not ( = ?auto_54969 ?auto_54971 ) ) ( not ( = ?auto_54973 ?auto_54975 ) ) ( HOIST-AT ?auto_54977 ?auto_54973 ) ( not ( = ?auto_54972 ?auto_54977 ) ) ( AVAILABLE ?auto_54977 ) ( SURFACE-AT ?auto_54971 ?auto_54973 ) ( ON ?auto_54971 ?auto_54974 ) ( CLEAR ?auto_54971 ) ( not ( = ?auto_54970 ?auto_54974 ) ) ( not ( = ?auto_54971 ?auto_54974 ) ) ( not ( = ?auto_54969 ?auto_54974 ) ) ( TRUCK-AT ?auto_54976 ?auto_54975 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54970 ?auto_54971 )
      ( MAKE-2CRATE-VERIFY ?auto_54969 ?auto_54970 ?auto_54971 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54978 - SURFACE
      ?auto_54979 - SURFACE
    )
    :vars
    (
      ?auto_54985 - HOIST
      ?auto_54984 - PLACE
      ?auto_54983 - SURFACE
      ?auto_54981 - PLACE
      ?auto_54980 - HOIST
      ?auto_54986 - SURFACE
      ?auto_54982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54985 ?auto_54984 ) ( IS-CRATE ?auto_54979 ) ( not ( = ?auto_54978 ?auto_54979 ) ) ( not ( = ?auto_54983 ?auto_54978 ) ) ( not ( = ?auto_54983 ?auto_54979 ) ) ( not ( = ?auto_54981 ?auto_54984 ) ) ( HOIST-AT ?auto_54980 ?auto_54981 ) ( not ( = ?auto_54985 ?auto_54980 ) ) ( AVAILABLE ?auto_54980 ) ( SURFACE-AT ?auto_54979 ?auto_54981 ) ( ON ?auto_54979 ?auto_54986 ) ( CLEAR ?auto_54979 ) ( not ( = ?auto_54978 ?auto_54986 ) ) ( not ( = ?auto_54979 ?auto_54986 ) ) ( not ( = ?auto_54983 ?auto_54986 ) ) ( TRUCK-AT ?auto_54982 ?auto_54984 ) ( SURFACE-AT ?auto_54983 ?auto_54984 ) ( CLEAR ?auto_54983 ) ( LIFTING ?auto_54985 ?auto_54978 ) ( IS-CRATE ?auto_54978 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54983 ?auto_54978 )
      ( MAKE-2CRATE ?auto_54983 ?auto_54978 ?auto_54979 )
      ( MAKE-1CRATE-VERIFY ?auto_54978 ?auto_54979 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54987 - SURFACE
      ?auto_54988 - SURFACE
      ?auto_54989 - SURFACE
    )
    :vars
    (
      ?auto_54990 - HOIST
      ?auto_54992 - PLACE
      ?auto_54995 - PLACE
      ?auto_54993 - HOIST
      ?auto_54994 - SURFACE
      ?auto_54991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54990 ?auto_54992 ) ( IS-CRATE ?auto_54989 ) ( not ( = ?auto_54988 ?auto_54989 ) ) ( not ( = ?auto_54987 ?auto_54988 ) ) ( not ( = ?auto_54987 ?auto_54989 ) ) ( not ( = ?auto_54995 ?auto_54992 ) ) ( HOIST-AT ?auto_54993 ?auto_54995 ) ( not ( = ?auto_54990 ?auto_54993 ) ) ( AVAILABLE ?auto_54993 ) ( SURFACE-AT ?auto_54989 ?auto_54995 ) ( ON ?auto_54989 ?auto_54994 ) ( CLEAR ?auto_54989 ) ( not ( = ?auto_54988 ?auto_54994 ) ) ( not ( = ?auto_54989 ?auto_54994 ) ) ( not ( = ?auto_54987 ?auto_54994 ) ) ( TRUCK-AT ?auto_54991 ?auto_54992 ) ( SURFACE-AT ?auto_54987 ?auto_54992 ) ( CLEAR ?auto_54987 ) ( LIFTING ?auto_54990 ?auto_54988 ) ( IS-CRATE ?auto_54988 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54988 ?auto_54989 )
      ( MAKE-2CRATE-VERIFY ?auto_54987 ?auto_54988 ?auto_54989 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54996 - SURFACE
      ?auto_54997 - SURFACE
    )
    :vars
    (
      ?auto_55002 - HOIST
      ?auto_54999 - PLACE
      ?auto_55001 - SURFACE
      ?auto_55004 - PLACE
      ?auto_55000 - HOIST
      ?auto_55003 - SURFACE
      ?auto_54998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55002 ?auto_54999 ) ( IS-CRATE ?auto_54997 ) ( not ( = ?auto_54996 ?auto_54997 ) ) ( not ( = ?auto_55001 ?auto_54996 ) ) ( not ( = ?auto_55001 ?auto_54997 ) ) ( not ( = ?auto_55004 ?auto_54999 ) ) ( HOIST-AT ?auto_55000 ?auto_55004 ) ( not ( = ?auto_55002 ?auto_55000 ) ) ( AVAILABLE ?auto_55000 ) ( SURFACE-AT ?auto_54997 ?auto_55004 ) ( ON ?auto_54997 ?auto_55003 ) ( CLEAR ?auto_54997 ) ( not ( = ?auto_54996 ?auto_55003 ) ) ( not ( = ?auto_54997 ?auto_55003 ) ) ( not ( = ?auto_55001 ?auto_55003 ) ) ( TRUCK-AT ?auto_54998 ?auto_54999 ) ( SURFACE-AT ?auto_55001 ?auto_54999 ) ( CLEAR ?auto_55001 ) ( IS-CRATE ?auto_54996 ) ( AVAILABLE ?auto_55002 ) ( IN ?auto_54996 ?auto_54998 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55002 ?auto_54996 ?auto_54998 ?auto_54999 )
      ( MAKE-2CRATE ?auto_55001 ?auto_54996 ?auto_54997 )
      ( MAKE-1CRATE-VERIFY ?auto_54996 ?auto_54997 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55005 - SURFACE
      ?auto_55006 - SURFACE
      ?auto_55007 - SURFACE
    )
    :vars
    (
      ?auto_55012 - HOIST
      ?auto_55009 - PLACE
      ?auto_55010 - PLACE
      ?auto_55011 - HOIST
      ?auto_55013 - SURFACE
      ?auto_55008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55012 ?auto_55009 ) ( IS-CRATE ?auto_55007 ) ( not ( = ?auto_55006 ?auto_55007 ) ) ( not ( = ?auto_55005 ?auto_55006 ) ) ( not ( = ?auto_55005 ?auto_55007 ) ) ( not ( = ?auto_55010 ?auto_55009 ) ) ( HOIST-AT ?auto_55011 ?auto_55010 ) ( not ( = ?auto_55012 ?auto_55011 ) ) ( AVAILABLE ?auto_55011 ) ( SURFACE-AT ?auto_55007 ?auto_55010 ) ( ON ?auto_55007 ?auto_55013 ) ( CLEAR ?auto_55007 ) ( not ( = ?auto_55006 ?auto_55013 ) ) ( not ( = ?auto_55007 ?auto_55013 ) ) ( not ( = ?auto_55005 ?auto_55013 ) ) ( TRUCK-AT ?auto_55008 ?auto_55009 ) ( SURFACE-AT ?auto_55005 ?auto_55009 ) ( CLEAR ?auto_55005 ) ( IS-CRATE ?auto_55006 ) ( AVAILABLE ?auto_55012 ) ( IN ?auto_55006 ?auto_55008 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55006 ?auto_55007 )
      ( MAKE-2CRATE-VERIFY ?auto_55005 ?auto_55006 ?auto_55007 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55050 - SURFACE
      ?auto_55051 - SURFACE
    )
    :vars
    (
      ?auto_55056 - HOIST
      ?auto_55057 - PLACE
      ?auto_55053 - SURFACE
      ?auto_55054 - PLACE
      ?auto_55052 - HOIST
      ?auto_55055 - SURFACE
      ?auto_55058 - TRUCK
      ?auto_55059 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55056 ?auto_55057 ) ( SURFACE-AT ?auto_55050 ?auto_55057 ) ( CLEAR ?auto_55050 ) ( IS-CRATE ?auto_55051 ) ( not ( = ?auto_55050 ?auto_55051 ) ) ( AVAILABLE ?auto_55056 ) ( ON ?auto_55050 ?auto_55053 ) ( not ( = ?auto_55053 ?auto_55050 ) ) ( not ( = ?auto_55053 ?auto_55051 ) ) ( not ( = ?auto_55054 ?auto_55057 ) ) ( HOIST-AT ?auto_55052 ?auto_55054 ) ( not ( = ?auto_55056 ?auto_55052 ) ) ( AVAILABLE ?auto_55052 ) ( SURFACE-AT ?auto_55051 ?auto_55054 ) ( ON ?auto_55051 ?auto_55055 ) ( CLEAR ?auto_55051 ) ( not ( = ?auto_55050 ?auto_55055 ) ) ( not ( = ?auto_55051 ?auto_55055 ) ) ( not ( = ?auto_55053 ?auto_55055 ) ) ( TRUCK-AT ?auto_55058 ?auto_55059 ) ( not ( = ?auto_55059 ?auto_55057 ) ) ( not ( = ?auto_55054 ?auto_55059 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55058 ?auto_55059 ?auto_55057 )
      ( MAKE-1CRATE ?auto_55050 ?auto_55051 )
      ( MAKE-1CRATE-VERIFY ?auto_55050 ?auto_55051 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55089 - SURFACE
      ?auto_55090 - SURFACE
      ?auto_55091 - SURFACE
      ?auto_55092 - SURFACE
    )
    :vars
    (
      ?auto_55093 - HOIST
      ?auto_55094 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55093 ?auto_55094 ) ( SURFACE-AT ?auto_55091 ?auto_55094 ) ( CLEAR ?auto_55091 ) ( LIFTING ?auto_55093 ?auto_55092 ) ( IS-CRATE ?auto_55092 ) ( not ( = ?auto_55091 ?auto_55092 ) ) ( ON ?auto_55090 ?auto_55089 ) ( ON ?auto_55091 ?auto_55090 ) ( not ( = ?auto_55089 ?auto_55090 ) ) ( not ( = ?auto_55089 ?auto_55091 ) ) ( not ( = ?auto_55089 ?auto_55092 ) ) ( not ( = ?auto_55090 ?auto_55091 ) ) ( not ( = ?auto_55090 ?auto_55092 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55091 ?auto_55092 )
      ( MAKE-3CRATE-VERIFY ?auto_55089 ?auto_55090 ?auto_55091 ?auto_55092 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55106 - SURFACE
      ?auto_55107 - SURFACE
      ?auto_55108 - SURFACE
      ?auto_55109 - SURFACE
    )
    :vars
    (
      ?auto_55112 - HOIST
      ?auto_55111 - PLACE
      ?auto_55110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55112 ?auto_55111 ) ( SURFACE-AT ?auto_55108 ?auto_55111 ) ( CLEAR ?auto_55108 ) ( IS-CRATE ?auto_55109 ) ( not ( = ?auto_55108 ?auto_55109 ) ) ( TRUCK-AT ?auto_55110 ?auto_55111 ) ( AVAILABLE ?auto_55112 ) ( IN ?auto_55109 ?auto_55110 ) ( ON ?auto_55108 ?auto_55107 ) ( not ( = ?auto_55107 ?auto_55108 ) ) ( not ( = ?auto_55107 ?auto_55109 ) ) ( ON ?auto_55107 ?auto_55106 ) ( not ( = ?auto_55106 ?auto_55107 ) ) ( not ( = ?auto_55106 ?auto_55108 ) ) ( not ( = ?auto_55106 ?auto_55109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55107 ?auto_55108 ?auto_55109 )
      ( MAKE-3CRATE-VERIFY ?auto_55106 ?auto_55107 ?auto_55108 ?auto_55109 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55127 - SURFACE
      ?auto_55128 - SURFACE
      ?auto_55129 - SURFACE
      ?auto_55130 - SURFACE
    )
    :vars
    (
      ?auto_55134 - HOIST
      ?auto_55131 - PLACE
      ?auto_55132 - TRUCK
      ?auto_55133 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55134 ?auto_55131 ) ( SURFACE-AT ?auto_55129 ?auto_55131 ) ( CLEAR ?auto_55129 ) ( IS-CRATE ?auto_55130 ) ( not ( = ?auto_55129 ?auto_55130 ) ) ( AVAILABLE ?auto_55134 ) ( IN ?auto_55130 ?auto_55132 ) ( ON ?auto_55129 ?auto_55128 ) ( not ( = ?auto_55128 ?auto_55129 ) ) ( not ( = ?auto_55128 ?auto_55130 ) ) ( TRUCK-AT ?auto_55132 ?auto_55133 ) ( not ( = ?auto_55133 ?auto_55131 ) ) ( ON ?auto_55128 ?auto_55127 ) ( not ( = ?auto_55127 ?auto_55128 ) ) ( not ( = ?auto_55127 ?auto_55129 ) ) ( not ( = ?auto_55127 ?auto_55130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55128 ?auto_55129 ?auto_55130 )
      ( MAKE-3CRATE-VERIFY ?auto_55127 ?auto_55128 ?auto_55129 ?auto_55130 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55151 - SURFACE
      ?auto_55152 - SURFACE
      ?auto_55153 - SURFACE
      ?auto_55154 - SURFACE
    )
    :vars
    (
      ?auto_55155 - HOIST
      ?auto_55159 - PLACE
      ?auto_55156 - TRUCK
      ?auto_55157 - PLACE
      ?auto_55158 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55155 ?auto_55159 ) ( SURFACE-AT ?auto_55153 ?auto_55159 ) ( CLEAR ?auto_55153 ) ( IS-CRATE ?auto_55154 ) ( not ( = ?auto_55153 ?auto_55154 ) ) ( AVAILABLE ?auto_55155 ) ( ON ?auto_55153 ?auto_55152 ) ( not ( = ?auto_55152 ?auto_55153 ) ) ( not ( = ?auto_55152 ?auto_55154 ) ) ( TRUCK-AT ?auto_55156 ?auto_55157 ) ( not ( = ?auto_55157 ?auto_55159 ) ) ( HOIST-AT ?auto_55158 ?auto_55157 ) ( LIFTING ?auto_55158 ?auto_55154 ) ( not ( = ?auto_55155 ?auto_55158 ) ) ( ON ?auto_55152 ?auto_55151 ) ( not ( = ?auto_55151 ?auto_55152 ) ) ( not ( = ?auto_55151 ?auto_55153 ) ) ( not ( = ?auto_55151 ?auto_55154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55152 ?auto_55153 ?auto_55154 )
      ( MAKE-3CRATE-VERIFY ?auto_55151 ?auto_55152 ?auto_55153 ?auto_55154 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55178 - SURFACE
      ?auto_55179 - SURFACE
      ?auto_55180 - SURFACE
      ?auto_55181 - SURFACE
    )
    :vars
    (
      ?auto_55184 - HOIST
      ?auto_55183 - PLACE
      ?auto_55186 - TRUCK
      ?auto_55187 - PLACE
      ?auto_55185 - HOIST
      ?auto_55182 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55184 ?auto_55183 ) ( SURFACE-AT ?auto_55180 ?auto_55183 ) ( CLEAR ?auto_55180 ) ( IS-CRATE ?auto_55181 ) ( not ( = ?auto_55180 ?auto_55181 ) ) ( AVAILABLE ?auto_55184 ) ( ON ?auto_55180 ?auto_55179 ) ( not ( = ?auto_55179 ?auto_55180 ) ) ( not ( = ?auto_55179 ?auto_55181 ) ) ( TRUCK-AT ?auto_55186 ?auto_55187 ) ( not ( = ?auto_55187 ?auto_55183 ) ) ( HOIST-AT ?auto_55185 ?auto_55187 ) ( not ( = ?auto_55184 ?auto_55185 ) ) ( AVAILABLE ?auto_55185 ) ( SURFACE-AT ?auto_55181 ?auto_55187 ) ( ON ?auto_55181 ?auto_55182 ) ( CLEAR ?auto_55181 ) ( not ( = ?auto_55180 ?auto_55182 ) ) ( not ( = ?auto_55181 ?auto_55182 ) ) ( not ( = ?auto_55179 ?auto_55182 ) ) ( ON ?auto_55179 ?auto_55178 ) ( not ( = ?auto_55178 ?auto_55179 ) ) ( not ( = ?auto_55178 ?auto_55180 ) ) ( not ( = ?auto_55178 ?auto_55181 ) ) ( not ( = ?auto_55178 ?auto_55182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55179 ?auto_55180 ?auto_55181 )
      ( MAKE-3CRATE-VERIFY ?auto_55178 ?auto_55179 ?auto_55180 ?auto_55181 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55206 - SURFACE
      ?auto_55207 - SURFACE
      ?auto_55208 - SURFACE
      ?auto_55209 - SURFACE
    )
    :vars
    (
      ?auto_55211 - HOIST
      ?auto_55213 - PLACE
      ?auto_55210 - PLACE
      ?auto_55215 - HOIST
      ?auto_55212 - SURFACE
      ?auto_55214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55211 ?auto_55213 ) ( SURFACE-AT ?auto_55208 ?auto_55213 ) ( CLEAR ?auto_55208 ) ( IS-CRATE ?auto_55209 ) ( not ( = ?auto_55208 ?auto_55209 ) ) ( AVAILABLE ?auto_55211 ) ( ON ?auto_55208 ?auto_55207 ) ( not ( = ?auto_55207 ?auto_55208 ) ) ( not ( = ?auto_55207 ?auto_55209 ) ) ( not ( = ?auto_55210 ?auto_55213 ) ) ( HOIST-AT ?auto_55215 ?auto_55210 ) ( not ( = ?auto_55211 ?auto_55215 ) ) ( AVAILABLE ?auto_55215 ) ( SURFACE-AT ?auto_55209 ?auto_55210 ) ( ON ?auto_55209 ?auto_55212 ) ( CLEAR ?auto_55209 ) ( not ( = ?auto_55208 ?auto_55212 ) ) ( not ( = ?auto_55209 ?auto_55212 ) ) ( not ( = ?auto_55207 ?auto_55212 ) ) ( TRUCK-AT ?auto_55214 ?auto_55213 ) ( ON ?auto_55207 ?auto_55206 ) ( not ( = ?auto_55206 ?auto_55207 ) ) ( not ( = ?auto_55206 ?auto_55208 ) ) ( not ( = ?auto_55206 ?auto_55209 ) ) ( not ( = ?auto_55206 ?auto_55212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55207 ?auto_55208 ?auto_55209 )
      ( MAKE-3CRATE-VERIFY ?auto_55206 ?auto_55207 ?auto_55208 ?auto_55209 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55234 - SURFACE
      ?auto_55235 - SURFACE
      ?auto_55236 - SURFACE
      ?auto_55237 - SURFACE
    )
    :vars
    (
      ?auto_55242 - HOIST
      ?auto_55241 - PLACE
      ?auto_55239 - PLACE
      ?auto_55240 - HOIST
      ?auto_55243 - SURFACE
      ?auto_55238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55242 ?auto_55241 ) ( IS-CRATE ?auto_55237 ) ( not ( = ?auto_55236 ?auto_55237 ) ) ( not ( = ?auto_55235 ?auto_55236 ) ) ( not ( = ?auto_55235 ?auto_55237 ) ) ( not ( = ?auto_55239 ?auto_55241 ) ) ( HOIST-AT ?auto_55240 ?auto_55239 ) ( not ( = ?auto_55242 ?auto_55240 ) ) ( AVAILABLE ?auto_55240 ) ( SURFACE-AT ?auto_55237 ?auto_55239 ) ( ON ?auto_55237 ?auto_55243 ) ( CLEAR ?auto_55237 ) ( not ( = ?auto_55236 ?auto_55243 ) ) ( not ( = ?auto_55237 ?auto_55243 ) ) ( not ( = ?auto_55235 ?auto_55243 ) ) ( TRUCK-AT ?auto_55238 ?auto_55241 ) ( SURFACE-AT ?auto_55235 ?auto_55241 ) ( CLEAR ?auto_55235 ) ( LIFTING ?auto_55242 ?auto_55236 ) ( IS-CRATE ?auto_55236 ) ( ON ?auto_55235 ?auto_55234 ) ( not ( = ?auto_55234 ?auto_55235 ) ) ( not ( = ?auto_55234 ?auto_55236 ) ) ( not ( = ?auto_55234 ?auto_55237 ) ) ( not ( = ?auto_55234 ?auto_55243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55235 ?auto_55236 ?auto_55237 )
      ( MAKE-3CRATE-VERIFY ?auto_55234 ?auto_55235 ?auto_55236 ?auto_55237 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55262 - SURFACE
      ?auto_55263 - SURFACE
      ?auto_55264 - SURFACE
      ?auto_55265 - SURFACE
    )
    :vars
    (
      ?auto_55271 - HOIST
      ?auto_55268 - PLACE
      ?auto_55266 - PLACE
      ?auto_55269 - HOIST
      ?auto_55270 - SURFACE
      ?auto_55267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55271 ?auto_55268 ) ( IS-CRATE ?auto_55265 ) ( not ( = ?auto_55264 ?auto_55265 ) ) ( not ( = ?auto_55263 ?auto_55264 ) ) ( not ( = ?auto_55263 ?auto_55265 ) ) ( not ( = ?auto_55266 ?auto_55268 ) ) ( HOIST-AT ?auto_55269 ?auto_55266 ) ( not ( = ?auto_55271 ?auto_55269 ) ) ( AVAILABLE ?auto_55269 ) ( SURFACE-AT ?auto_55265 ?auto_55266 ) ( ON ?auto_55265 ?auto_55270 ) ( CLEAR ?auto_55265 ) ( not ( = ?auto_55264 ?auto_55270 ) ) ( not ( = ?auto_55265 ?auto_55270 ) ) ( not ( = ?auto_55263 ?auto_55270 ) ) ( TRUCK-AT ?auto_55267 ?auto_55268 ) ( SURFACE-AT ?auto_55263 ?auto_55268 ) ( CLEAR ?auto_55263 ) ( IS-CRATE ?auto_55264 ) ( AVAILABLE ?auto_55271 ) ( IN ?auto_55264 ?auto_55267 ) ( ON ?auto_55263 ?auto_55262 ) ( not ( = ?auto_55262 ?auto_55263 ) ) ( not ( = ?auto_55262 ?auto_55264 ) ) ( not ( = ?auto_55262 ?auto_55265 ) ) ( not ( = ?auto_55262 ?auto_55270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55263 ?auto_55264 ?auto_55265 )
      ( MAKE-3CRATE-VERIFY ?auto_55262 ?auto_55263 ?auto_55264 ?auto_55265 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55447 - SURFACE
      ?auto_55448 - SURFACE
    )
    :vars
    (
      ?auto_55453 - HOIST
      ?auto_55451 - PLACE
      ?auto_55455 - SURFACE
      ?auto_55454 - TRUCK
      ?auto_55449 - PLACE
      ?auto_55450 - HOIST
      ?auto_55452 - SURFACE
      ?auto_55456 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55453 ?auto_55451 ) ( SURFACE-AT ?auto_55447 ?auto_55451 ) ( CLEAR ?auto_55447 ) ( IS-CRATE ?auto_55448 ) ( not ( = ?auto_55447 ?auto_55448 ) ) ( AVAILABLE ?auto_55453 ) ( ON ?auto_55447 ?auto_55455 ) ( not ( = ?auto_55455 ?auto_55447 ) ) ( not ( = ?auto_55455 ?auto_55448 ) ) ( TRUCK-AT ?auto_55454 ?auto_55449 ) ( not ( = ?auto_55449 ?auto_55451 ) ) ( HOIST-AT ?auto_55450 ?auto_55449 ) ( not ( = ?auto_55453 ?auto_55450 ) ) ( SURFACE-AT ?auto_55448 ?auto_55449 ) ( ON ?auto_55448 ?auto_55452 ) ( CLEAR ?auto_55448 ) ( not ( = ?auto_55447 ?auto_55452 ) ) ( not ( = ?auto_55448 ?auto_55452 ) ) ( not ( = ?auto_55455 ?auto_55452 ) ) ( LIFTING ?auto_55450 ?auto_55456 ) ( IS-CRATE ?auto_55456 ) ( not ( = ?auto_55447 ?auto_55456 ) ) ( not ( = ?auto_55448 ?auto_55456 ) ) ( not ( = ?auto_55455 ?auto_55456 ) ) ( not ( = ?auto_55452 ?auto_55456 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55450 ?auto_55456 ?auto_55454 ?auto_55449 )
      ( MAKE-1CRATE ?auto_55447 ?auto_55448 )
      ( MAKE-1CRATE-VERIFY ?auto_55447 ?auto_55448 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55555 - SURFACE
      ?auto_55556 - SURFACE
      ?auto_55557 - SURFACE
      ?auto_55559 - SURFACE
      ?auto_55558 - SURFACE
    )
    :vars
    (
      ?auto_55560 - HOIST
      ?auto_55561 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55560 ?auto_55561 ) ( SURFACE-AT ?auto_55559 ?auto_55561 ) ( CLEAR ?auto_55559 ) ( LIFTING ?auto_55560 ?auto_55558 ) ( IS-CRATE ?auto_55558 ) ( not ( = ?auto_55559 ?auto_55558 ) ) ( ON ?auto_55556 ?auto_55555 ) ( ON ?auto_55557 ?auto_55556 ) ( ON ?auto_55559 ?auto_55557 ) ( not ( = ?auto_55555 ?auto_55556 ) ) ( not ( = ?auto_55555 ?auto_55557 ) ) ( not ( = ?auto_55555 ?auto_55559 ) ) ( not ( = ?auto_55555 ?auto_55558 ) ) ( not ( = ?auto_55556 ?auto_55557 ) ) ( not ( = ?auto_55556 ?auto_55559 ) ) ( not ( = ?auto_55556 ?auto_55558 ) ) ( not ( = ?auto_55557 ?auto_55559 ) ) ( not ( = ?auto_55557 ?auto_55558 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55559 ?auto_55558 )
      ( MAKE-4CRATE-VERIFY ?auto_55555 ?auto_55556 ?auto_55557 ?auto_55559 ?auto_55558 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55580 - SURFACE
      ?auto_55581 - SURFACE
      ?auto_55582 - SURFACE
      ?auto_55584 - SURFACE
      ?auto_55583 - SURFACE
    )
    :vars
    (
      ?auto_55587 - HOIST
      ?auto_55585 - PLACE
      ?auto_55586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55587 ?auto_55585 ) ( SURFACE-AT ?auto_55584 ?auto_55585 ) ( CLEAR ?auto_55584 ) ( IS-CRATE ?auto_55583 ) ( not ( = ?auto_55584 ?auto_55583 ) ) ( TRUCK-AT ?auto_55586 ?auto_55585 ) ( AVAILABLE ?auto_55587 ) ( IN ?auto_55583 ?auto_55586 ) ( ON ?auto_55584 ?auto_55582 ) ( not ( = ?auto_55582 ?auto_55584 ) ) ( not ( = ?auto_55582 ?auto_55583 ) ) ( ON ?auto_55581 ?auto_55580 ) ( ON ?auto_55582 ?auto_55581 ) ( not ( = ?auto_55580 ?auto_55581 ) ) ( not ( = ?auto_55580 ?auto_55582 ) ) ( not ( = ?auto_55580 ?auto_55584 ) ) ( not ( = ?auto_55580 ?auto_55583 ) ) ( not ( = ?auto_55581 ?auto_55582 ) ) ( not ( = ?auto_55581 ?auto_55584 ) ) ( not ( = ?auto_55581 ?auto_55583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55582 ?auto_55584 ?auto_55583 )
      ( MAKE-4CRATE-VERIFY ?auto_55580 ?auto_55581 ?auto_55582 ?auto_55584 ?auto_55583 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55610 - SURFACE
      ?auto_55611 - SURFACE
      ?auto_55612 - SURFACE
      ?auto_55614 - SURFACE
      ?auto_55613 - SURFACE
    )
    :vars
    (
      ?auto_55617 - HOIST
      ?auto_55618 - PLACE
      ?auto_55615 - TRUCK
      ?auto_55616 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55617 ?auto_55618 ) ( SURFACE-AT ?auto_55614 ?auto_55618 ) ( CLEAR ?auto_55614 ) ( IS-CRATE ?auto_55613 ) ( not ( = ?auto_55614 ?auto_55613 ) ) ( AVAILABLE ?auto_55617 ) ( IN ?auto_55613 ?auto_55615 ) ( ON ?auto_55614 ?auto_55612 ) ( not ( = ?auto_55612 ?auto_55614 ) ) ( not ( = ?auto_55612 ?auto_55613 ) ) ( TRUCK-AT ?auto_55615 ?auto_55616 ) ( not ( = ?auto_55616 ?auto_55618 ) ) ( ON ?auto_55611 ?auto_55610 ) ( ON ?auto_55612 ?auto_55611 ) ( not ( = ?auto_55610 ?auto_55611 ) ) ( not ( = ?auto_55610 ?auto_55612 ) ) ( not ( = ?auto_55610 ?auto_55614 ) ) ( not ( = ?auto_55610 ?auto_55613 ) ) ( not ( = ?auto_55611 ?auto_55612 ) ) ( not ( = ?auto_55611 ?auto_55614 ) ) ( not ( = ?auto_55611 ?auto_55613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55612 ?auto_55614 ?auto_55613 )
      ( MAKE-4CRATE-VERIFY ?auto_55610 ?auto_55611 ?auto_55612 ?auto_55614 ?auto_55613 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55644 - SURFACE
      ?auto_55645 - SURFACE
      ?auto_55646 - SURFACE
      ?auto_55648 - SURFACE
      ?auto_55647 - SURFACE
    )
    :vars
    (
      ?auto_55649 - HOIST
      ?auto_55652 - PLACE
      ?auto_55651 - TRUCK
      ?auto_55650 - PLACE
      ?auto_55653 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55649 ?auto_55652 ) ( SURFACE-AT ?auto_55648 ?auto_55652 ) ( CLEAR ?auto_55648 ) ( IS-CRATE ?auto_55647 ) ( not ( = ?auto_55648 ?auto_55647 ) ) ( AVAILABLE ?auto_55649 ) ( ON ?auto_55648 ?auto_55646 ) ( not ( = ?auto_55646 ?auto_55648 ) ) ( not ( = ?auto_55646 ?auto_55647 ) ) ( TRUCK-AT ?auto_55651 ?auto_55650 ) ( not ( = ?auto_55650 ?auto_55652 ) ) ( HOIST-AT ?auto_55653 ?auto_55650 ) ( LIFTING ?auto_55653 ?auto_55647 ) ( not ( = ?auto_55649 ?auto_55653 ) ) ( ON ?auto_55645 ?auto_55644 ) ( ON ?auto_55646 ?auto_55645 ) ( not ( = ?auto_55644 ?auto_55645 ) ) ( not ( = ?auto_55644 ?auto_55646 ) ) ( not ( = ?auto_55644 ?auto_55648 ) ) ( not ( = ?auto_55644 ?auto_55647 ) ) ( not ( = ?auto_55645 ?auto_55646 ) ) ( not ( = ?auto_55645 ?auto_55648 ) ) ( not ( = ?auto_55645 ?auto_55647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55646 ?auto_55648 ?auto_55647 )
      ( MAKE-4CRATE-VERIFY ?auto_55644 ?auto_55645 ?auto_55646 ?auto_55648 ?auto_55647 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55682 - SURFACE
      ?auto_55683 - SURFACE
      ?auto_55684 - SURFACE
      ?auto_55686 - SURFACE
      ?auto_55685 - SURFACE
    )
    :vars
    (
      ?auto_55691 - HOIST
      ?auto_55692 - PLACE
      ?auto_55689 - TRUCK
      ?auto_55688 - PLACE
      ?auto_55690 - HOIST
      ?auto_55687 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55691 ?auto_55692 ) ( SURFACE-AT ?auto_55686 ?auto_55692 ) ( CLEAR ?auto_55686 ) ( IS-CRATE ?auto_55685 ) ( not ( = ?auto_55686 ?auto_55685 ) ) ( AVAILABLE ?auto_55691 ) ( ON ?auto_55686 ?auto_55684 ) ( not ( = ?auto_55684 ?auto_55686 ) ) ( not ( = ?auto_55684 ?auto_55685 ) ) ( TRUCK-AT ?auto_55689 ?auto_55688 ) ( not ( = ?auto_55688 ?auto_55692 ) ) ( HOIST-AT ?auto_55690 ?auto_55688 ) ( not ( = ?auto_55691 ?auto_55690 ) ) ( AVAILABLE ?auto_55690 ) ( SURFACE-AT ?auto_55685 ?auto_55688 ) ( ON ?auto_55685 ?auto_55687 ) ( CLEAR ?auto_55685 ) ( not ( = ?auto_55686 ?auto_55687 ) ) ( not ( = ?auto_55685 ?auto_55687 ) ) ( not ( = ?auto_55684 ?auto_55687 ) ) ( ON ?auto_55683 ?auto_55682 ) ( ON ?auto_55684 ?auto_55683 ) ( not ( = ?auto_55682 ?auto_55683 ) ) ( not ( = ?auto_55682 ?auto_55684 ) ) ( not ( = ?auto_55682 ?auto_55686 ) ) ( not ( = ?auto_55682 ?auto_55685 ) ) ( not ( = ?auto_55682 ?auto_55687 ) ) ( not ( = ?auto_55683 ?auto_55684 ) ) ( not ( = ?auto_55683 ?auto_55686 ) ) ( not ( = ?auto_55683 ?auto_55685 ) ) ( not ( = ?auto_55683 ?auto_55687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55684 ?auto_55686 ?auto_55685 )
      ( MAKE-4CRATE-VERIFY ?auto_55682 ?auto_55683 ?auto_55684 ?auto_55686 ?auto_55685 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55721 - SURFACE
      ?auto_55722 - SURFACE
      ?auto_55723 - SURFACE
      ?auto_55725 - SURFACE
      ?auto_55724 - SURFACE
    )
    :vars
    (
      ?auto_55727 - HOIST
      ?auto_55726 - PLACE
      ?auto_55729 - PLACE
      ?auto_55731 - HOIST
      ?auto_55728 - SURFACE
      ?auto_55730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55727 ?auto_55726 ) ( SURFACE-AT ?auto_55725 ?auto_55726 ) ( CLEAR ?auto_55725 ) ( IS-CRATE ?auto_55724 ) ( not ( = ?auto_55725 ?auto_55724 ) ) ( AVAILABLE ?auto_55727 ) ( ON ?auto_55725 ?auto_55723 ) ( not ( = ?auto_55723 ?auto_55725 ) ) ( not ( = ?auto_55723 ?auto_55724 ) ) ( not ( = ?auto_55729 ?auto_55726 ) ) ( HOIST-AT ?auto_55731 ?auto_55729 ) ( not ( = ?auto_55727 ?auto_55731 ) ) ( AVAILABLE ?auto_55731 ) ( SURFACE-AT ?auto_55724 ?auto_55729 ) ( ON ?auto_55724 ?auto_55728 ) ( CLEAR ?auto_55724 ) ( not ( = ?auto_55725 ?auto_55728 ) ) ( not ( = ?auto_55724 ?auto_55728 ) ) ( not ( = ?auto_55723 ?auto_55728 ) ) ( TRUCK-AT ?auto_55730 ?auto_55726 ) ( ON ?auto_55722 ?auto_55721 ) ( ON ?auto_55723 ?auto_55722 ) ( not ( = ?auto_55721 ?auto_55722 ) ) ( not ( = ?auto_55721 ?auto_55723 ) ) ( not ( = ?auto_55721 ?auto_55725 ) ) ( not ( = ?auto_55721 ?auto_55724 ) ) ( not ( = ?auto_55721 ?auto_55728 ) ) ( not ( = ?auto_55722 ?auto_55723 ) ) ( not ( = ?auto_55722 ?auto_55725 ) ) ( not ( = ?auto_55722 ?auto_55724 ) ) ( not ( = ?auto_55722 ?auto_55728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55723 ?auto_55725 ?auto_55724 )
      ( MAKE-4CRATE-VERIFY ?auto_55721 ?auto_55722 ?auto_55723 ?auto_55725 ?auto_55724 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55760 - SURFACE
      ?auto_55761 - SURFACE
      ?auto_55762 - SURFACE
      ?auto_55764 - SURFACE
      ?auto_55763 - SURFACE
    )
    :vars
    (
      ?auto_55765 - HOIST
      ?auto_55766 - PLACE
      ?auto_55768 - PLACE
      ?auto_55770 - HOIST
      ?auto_55767 - SURFACE
      ?auto_55769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55765 ?auto_55766 ) ( IS-CRATE ?auto_55763 ) ( not ( = ?auto_55764 ?auto_55763 ) ) ( not ( = ?auto_55762 ?auto_55764 ) ) ( not ( = ?auto_55762 ?auto_55763 ) ) ( not ( = ?auto_55768 ?auto_55766 ) ) ( HOIST-AT ?auto_55770 ?auto_55768 ) ( not ( = ?auto_55765 ?auto_55770 ) ) ( AVAILABLE ?auto_55770 ) ( SURFACE-AT ?auto_55763 ?auto_55768 ) ( ON ?auto_55763 ?auto_55767 ) ( CLEAR ?auto_55763 ) ( not ( = ?auto_55764 ?auto_55767 ) ) ( not ( = ?auto_55763 ?auto_55767 ) ) ( not ( = ?auto_55762 ?auto_55767 ) ) ( TRUCK-AT ?auto_55769 ?auto_55766 ) ( SURFACE-AT ?auto_55762 ?auto_55766 ) ( CLEAR ?auto_55762 ) ( LIFTING ?auto_55765 ?auto_55764 ) ( IS-CRATE ?auto_55764 ) ( ON ?auto_55761 ?auto_55760 ) ( ON ?auto_55762 ?auto_55761 ) ( not ( = ?auto_55760 ?auto_55761 ) ) ( not ( = ?auto_55760 ?auto_55762 ) ) ( not ( = ?auto_55760 ?auto_55764 ) ) ( not ( = ?auto_55760 ?auto_55763 ) ) ( not ( = ?auto_55760 ?auto_55767 ) ) ( not ( = ?auto_55761 ?auto_55762 ) ) ( not ( = ?auto_55761 ?auto_55764 ) ) ( not ( = ?auto_55761 ?auto_55763 ) ) ( not ( = ?auto_55761 ?auto_55767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55762 ?auto_55764 ?auto_55763 )
      ( MAKE-4CRATE-VERIFY ?auto_55760 ?auto_55761 ?auto_55762 ?auto_55764 ?auto_55763 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55799 - SURFACE
      ?auto_55800 - SURFACE
      ?auto_55801 - SURFACE
      ?auto_55803 - SURFACE
      ?auto_55802 - SURFACE
    )
    :vars
    (
      ?auto_55808 - HOIST
      ?auto_55807 - PLACE
      ?auto_55809 - PLACE
      ?auto_55805 - HOIST
      ?auto_55804 - SURFACE
      ?auto_55806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55808 ?auto_55807 ) ( IS-CRATE ?auto_55802 ) ( not ( = ?auto_55803 ?auto_55802 ) ) ( not ( = ?auto_55801 ?auto_55803 ) ) ( not ( = ?auto_55801 ?auto_55802 ) ) ( not ( = ?auto_55809 ?auto_55807 ) ) ( HOIST-AT ?auto_55805 ?auto_55809 ) ( not ( = ?auto_55808 ?auto_55805 ) ) ( AVAILABLE ?auto_55805 ) ( SURFACE-AT ?auto_55802 ?auto_55809 ) ( ON ?auto_55802 ?auto_55804 ) ( CLEAR ?auto_55802 ) ( not ( = ?auto_55803 ?auto_55804 ) ) ( not ( = ?auto_55802 ?auto_55804 ) ) ( not ( = ?auto_55801 ?auto_55804 ) ) ( TRUCK-AT ?auto_55806 ?auto_55807 ) ( SURFACE-AT ?auto_55801 ?auto_55807 ) ( CLEAR ?auto_55801 ) ( IS-CRATE ?auto_55803 ) ( AVAILABLE ?auto_55808 ) ( IN ?auto_55803 ?auto_55806 ) ( ON ?auto_55800 ?auto_55799 ) ( ON ?auto_55801 ?auto_55800 ) ( not ( = ?auto_55799 ?auto_55800 ) ) ( not ( = ?auto_55799 ?auto_55801 ) ) ( not ( = ?auto_55799 ?auto_55803 ) ) ( not ( = ?auto_55799 ?auto_55802 ) ) ( not ( = ?auto_55799 ?auto_55804 ) ) ( not ( = ?auto_55800 ?auto_55801 ) ) ( not ( = ?auto_55800 ?auto_55803 ) ) ( not ( = ?auto_55800 ?auto_55802 ) ) ( not ( = ?auto_55800 ?auto_55804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55801 ?auto_55803 ?auto_55802 )
      ( MAKE-4CRATE-VERIFY ?auto_55799 ?auto_55800 ?auto_55801 ?auto_55803 ?auto_55802 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_56300 - SURFACE
      ?auto_56301 - SURFACE
    )
    :vars
    (
      ?auto_56303 - HOIST
      ?auto_56306 - PLACE
      ?auto_56302 - SURFACE
      ?auto_56307 - PLACE
      ?auto_56305 - HOIST
      ?auto_56304 - SURFACE
      ?auto_56308 - TRUCK
      ?auto_56309 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56303 ?auto_56306 ) ( SURFACE-AT ?auto_56300 ?auto_56306 ) ( CLEAR ?auto_56300 ) ( IS-CRATE ?auto_56301 ) ( not ( = ?auto_56300 ?auto_56301 ) ) ( ON ?auto_56300 ?auto_56302 ) ( not ( = ?auto_56302 ?auto_56300 ) ) ( not ( = ?auto_56302 ?auto_56301 ) ) ( not ( = ?auto_56307 ?auto_56306 ) ) ( HOIST-AT ?auto_56305 ?auto_56307 ) ( not ( = ?auto_56303 ?auto_56305 ) ) ( AVAILABLE ?auto_56305 ) ( SURFACE-AT ?auto_56301 ?auto_56307 ) ( ON ?auto_56301 ?auto_56304 ) ( CLEAR ?auto_56301 ) ( not ( = ?auto_56300 ?auto_56304 ) ) ( not ( = ?auto_56301 ?auto_56304 ) ) ( not ( = ?auto_56302 ?auto_56304 ) ) ( TRUCK-AT ?auto_56308 ?auto_56306 ) ( LIFTING ?auto_56303 ?auto_56309 ) ( IS-CRATE ?auto_56309 ) ( not ( = ?auto_56300 ?auto_56309 ) ) ( not ( = ?auto_56301 ?auto_56309 ) ) ( not ( = ?auto_56302 ?auto_56309 ) ) ( not ( = ?auto_56304 ?auto_56309 ) ) )
    :subtasks
    ( ( !LOAD ?auto_56303 ?auto_56309 ?auto_56308 ?auto_56306 )
      ( MAKE-1CRATE ?auto_56300 ?auto_56301 )
      ( MAKE-1CRATE-VERIFY ?auto_56300 ?auto_56301 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56459 - SURFACE
      ?auto_56460 - SURFACE
      ?auto_56461 - SURFACE
      ?auto_56463 - SURFACE
      ?auto_56462 - SURFACE
      ?auto_56464 - SURFACE
    )
    :vars
    (
      ?auto_56466 - HOIST
      ?auto_56465 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56466 ?auto_56465 ) ( SURFACE-AT ?auto_56462 ?auto_56465 ) ( CLEAR ?auto_56462 ) ( LIFTING ?auto_56466 ?auto_56464 ) ( IS-CRATE ?auto_56464 ) ( not ( = ?auto_56462 ?auto_56464 ) ) ( ON ?auto_56460 ?auto_56459 ) ( ON ?auto_56461 ?auto_56460 ) ( ON ?auto_56463 ?auto_56461 ) ( ON ?auto_56462 ?auto_56463 ) ( not ( = ?auto_56459 ?auto_56460 ) ) ( not ( = ?auto_56459 ?auto_56461 ) ) ( not ( = ?auto_56459 ?auto_56463 ) ) ( not ( = ?auto_56459 ?auto_56462 ) ) ( not ( = ?auto_56459 ?auto_56464 ) ) ( not ( = ?auto_56460 ?auto_56461 ) ) ( not ( = ?auto_56460 ?auto_56463 ) ) ( not ( = ?auto_56460 ?auto_56462 ) ) ( not ( = ?auto_56460 ?auto_56464 ) ) ( not ( = ?auto_56461 ?auto_56463 ) ) ( not ( = ?auto_56461 ?auto_56462 ) ) ( not ( = ?auto_56461 ?auto_56464 ) ) ( not ( = ?auto_56463 ?auto_56462 ) ) ( not ( = ?auto_56463 ?auto_56464 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_56462 ?auto_56464 )
      ( MAKE-5CRATE-VERIFY ?auto_56459 ?auto_56460 ?auto_56461 ?auto_56463 ?auto_56462 ?auto_56464 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56493 - SURFACE
      ?auto_56494 - SURFACE
      ?auto_56495 - SURFACE
      ?auto_56497 - SURFACE
      ?auto_56496 - SURFACE
      ?auto_56498 - SURFACE
    )
    :vars
    (
      ?auto_56499 - HOIST
      ?auto_56501 - PLACE
      ?auto_56500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56499 ?auto_56501 ) ( SURFACE-AT ?auto_56496 ?auto_56501 ) ( CLEAR ?auto_56496 ) ( IS-CRATE ?auto_56498 ) ( not ( = ?auto_56496 ?auto_56498 ) ) ( TRUCK-AT ?auto_56500 ?auto_56501 ) ( AVAILABLE ?auto_56499 ) ( IN ?auto_56498 ?auto_56500 ) ( ON ?auto_56496 ?auto_56497 ) ( not ( = ?auto_56497 ?auto_56496 ) ) ( not ( = ?auto_56497 ?auto_56498 ) ) ( ON ?auto_56494 ?auto_56493 ) ( ON ?auto_56495 ?auto_56494 ) ( ON ?auto_56497 ?auto_56495 ) ( not ( = ?auto_56493 ?auto_56494 ) ) ( not ( = ?auto_56493 ?auto_56495 ) ) ( not ( = ?auto_56493 ?auto_56497 ) ) ( not ( = ?auto_56493 ?auto_56496 ) ) ( not ( = ?auto_56493 ?auto_56498 ) ) ( not ( = ?auto_56494 ?auto_56495 ) ) ( not ( = ?auto_56494 ?auto_56497 ) ) ( not ( = ?auto_56494 ?auto_56496 ) ) ( not ( = ?auto_56494 ?auto_56498 ) ) ( not ( = ?auto_56495 ?auto_56497 ) ) ( not ( = ?auto_56495 ?auto_56496 ) ) ( not ( = ?auto_56495 ?auto_56498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56497 ?auto_56496 ?auto_56498 )
      ( MAKE-5CRATE-VERIFY ?auto_56493 ?auto_56494 ?auto_56495 ?auto_56497 ?auto_56496 ?auto_56498 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56533 - SURFACE
      ?auto_56534 - SURFACE
      ?auto_56535 - SURFACE
      ?auto_56537 - SURFACE
      ?auto_56536 - SURFACE
      ?auto_56538 - SURFACE
    )
    :vars
    (
      ?auto_56539 - HOIST
      ?auto_56540 - PLACE
      ?auto_56542 - TRUCK
      ?auto_56541 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56539 ?auto_56540 ) ( SURFACE-AT ?auto_56536 ?auto_56540 ) ( CLEAR ?auto_56536 ) ( IS-CRATE ?auto_56538 ) ( not ( = ?auto_56536 ?auto_56538 ) ) ( AVAILABLE ?auto_56539 ) ( IN ?auto_56538 ?auto_56542 ) ( ON ?auto_56536 ?auto_56537 ) ( not ( = ?auto_56537 ?auto_56536 ) ) ( not ( = ?auto_56537 ?auto_56538 ) ) ( TRUCK-AT ?auto_56542 ?auto_56541 ) ( not ( = ?auto_56541 ?auto_56540 ) ) ( ON ?auto_56534 ?auto_56533 ) ( ON ?auto_56535 ?auto_56534 ) ( ON ?auto_56537 ?auto_56535 ) ( not ( = ?auto_56533 ?auto_56534 ) ) ( not ( = ?auto_56533 ?auto_56535 ) ) ( not ( = ?auto_56533 ?auto_56537 ) ) ( not ( = ?auto_56533 ?auto_56536 ) ) ( not ( = ?auto_56533 ?auto_56538 ) ) ( not ( = ?auto_56534 ?auto_56535 ) ) ( not ( = ?auto_56534 ?auto_56537 ) ) ( not ( = ?auto_56534 ?auto_56536 ) ) ( not ( = ?auto_56534 ?auto_56538 ) ) ( not ( = ?auto_56535 ?auto_56537 ) ) ( not ( = ?auto_56535 ?auto_56536 ) ) ( not ( = ?auto_56535 ?auto_56538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56537 ?auto_56536 ?auto_56538 )
      ( MAKE-5CRATE-VERIFY ?auto_56533 ?auto_56534 ?auto_56535 ?auto_56537 ?auto_56536 ?auto_56538 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56578 - SURFACE
      ?auto_56579 - SURFACE
      ?auto_56580 - SURFACE
      ?auto_56582 - SURFACE
      ?auto_56581 - SURFACE
      ?auto_56583 - SURFACE
    )
    :vars
    (
      ?auto_56586 - HOIST
      ?auto_56584 - PLACE
      ?auto_56585 - TRUCK
      ?auto_56588 - PLACE
      ?auto_56587 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56586 ?auto_56584 ) ( SURFACE-AT ?auto_56581 ?auto_56584 ) ( CLEAR ?auto_56581 ) ( IS-CRATE ?auto_56583 ) ( not ( = ?auto_56581 ?auto_56583 ) ) ( AVAILABLE ?auto_56586 ) ( ON ?auto_56581 ?auto_56582 ) ( not ( = ?auto_56582 ?auto_56581 ) ) ( not ( = ?auto_56582 ?auto_56583 ) ) ( TRUCK-AT ?auto_56585 ?auto_56588 ) ( not ( = ?auto_56588 ?auto_56584 ) ) ( HOIST-AT ?auto_56587 ?auto_56588 ) ( LIFTING ?auto_56587 ?auto_56583 ) ( not ( = ?auto_56586 ?auto_56587 ) ) ( ON ?auto_56579 ?auto_56578 ) ( ON ?auto_56580 ?auto_56579 ) ( ON ?auto_56582 ?auto_56580 ) ( not ( = ?auto_56578 ?auto_56579 ) ) ( not ( = ?auto_56578 ?auto_56580 ) ) ( not ( = ?auto_56578 ?auto_56582 ) ) ( not ( = ?auto_56578 ?auto_56581 ) ) ( not ( = ?auto_56578 ?auto_56583 ) ) ( not ( = ?auto_56579 ?auto_56580 ) ) ( not ( = ?auto_56579 ?auto_56582 ) ) ( not ( = ?auto_56579 ?auto_56581 ) ) ( not ( = ?auto_56579 ?auto_56583 ) ) ( not ( = ?auto_56580 ?auto_56582 ) ) ( not ( = ?auto_56580 ?auto_56581 ) ) ( not ( = ?auto_56580 ?auto_56583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56582 ?auto_56581 ?auto_56583 )
      ( MAKE-5CRATE-VERIFY ?auto_56578 ?auto_56579 ?auto_56580 ?auto_56582 ?auto_56581 ?auto_56583 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56628 - SURFACE
      ?auto_56629 - SURFACE
      ?auto_56630 - SURFACE
      ?auto_56632 - SURFACE
      ?auto_56631 - SURFACE
      ?auto_56633 - SURFACE
    )
    :vars
    (
      ?auto_56639 - HOIST
      ?auto_56638 - PLACE
      ?auto_56636 - TRUCK
      ?auto_56635 - PLACE
      ?auto_56634 - HOIST
      ?auto_56637 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56639 ?auto_56638 ) ( SURFACE-AT ?auto_56631 ?auto_56638 ) ( CLEAR ?auto_56631 ) ( IS-CRATE ?auto_56633 ) ( not ( = ?auto_56631 ?auto_56633 ) ) ( AVAILABLE ?auto_56639 ) ( ON ?auto_56631 ?auto_56632 ) ( not ( = ?auto_56632 ?auto_56631 ) ) ( not ( = ?auto_56632 ?auto_56633 ) ) ( TRUCK-AT ?auto_56636 ?auto_56635 ) ( not ( = ?auto_56635 ?auto_56638 ) ) ( HOIST-AT ?auto_56634 ?auto_56635 ) ( not ( = ?auto_56639 ?auto_56634 ) ) ( AVAILABLE ?auto_56634 ) ( SURFACE-AT ?auto_56633 ?auto_56635 ) ( ON ?auto_56633 ?auto_56637 ) ( CLEAR ?auto_56633 ) ( not ( = ?auto_56631 ?auto_56637 ) ) ( not ( = ?auto_56633 ?auto_56637 ) ) ( not ( = ?auto_56632 ?auto_56637 ) ) ( ON ?auto_56629 ?auto_56628 ) ( ON ?auto_56630 ?auto_56629 ) ( ON ?auto_56632 ?auto_56630 ) ( not ( = ?auto_56628 ?auto_56629 ) ) ( not ( = ?auto_56628 ?auto_56630 ) ) ( not ( = ?auto_56628 ?auto_56632 ) ) ( not ( = ?auto_56628 ?auto_56631 ) ) ( not ( = ?auto_56628 ?auto_56633 ) ) ( not ( = ?auto_56628 ?auto_56637 ) ) ( not ( = ?auto_56629 ?auto_56630 ) ) ( not ( = ?auto_56629 ?auto_56632 ) ) ( not ( = ?auto_56629 ?auto_56631 ) ) ( not ( = ?auto_56629 ?auto_56633 ) ) ( not ( = ?auto_56629 ?auto_56637 ) ) ( not ( = ?auto_56630 ?auto_56632 ) ) ( not ( = ?auto_56630 ?auto_56631 ) ) ( not ( = ?auto_56630 ?auto_56633 ) ) ( not ( = ?auto_56630 ?auto_56637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56632 ?auto_56631 ?auto_56633 )
      ( MAKE-5CRATE-VERIFY ?auto_56628 ?auto_56629 ?auto_56630 ?auto_56632 ?auto_56631 ?auto_56633 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56679 - SURFACE
      ?auto_56680 - SURFACE
      ?auto_56681 - SURFACE
      ?auto_56683 - SURFACE
      ?auto_56682 - SURFACE
      ?auto_56684 - SURFACE
    )
    :vars
    (
      ?auto_56686 - HOIST
      ?auto_56687 - PLACE
      ?auto_56689 - PLACE
      ?auto_56685 - HOIST
      ?auto_56688 - SURFACE
      ?auto_56690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56686 ?auto_56687 ) ( SURFACE-AT ?auto_56682 ?auto_56687 ) ( CLEAR ?auto_56682 ) ( IS-CRATE ?auto_56684 ) ( not ( = ?auto_56682 ?auto_56684 ) ) ( AVAILABLE ?auto_56686 ) ( ON ?auto_56682 ?auto_56683 ) ( not ( = ?auto_56683 ?auto_56682 ) ) ( not ( = ?auto_56683 ?auto_56684 ) ) ( not ( = ?auto_56689 ?auto_56687 ) ) ( HOIST-AT ?auto_56685 ?auto_56689 ) ( not ( = ?auto_56686 ?auto_56685 ) ) ( AVAILABLE ?auto_56685 ) ( SURFACE-AT ?auto_56684 ?auto_56689 ) ( ON ?auto_56684 ?auto_56688 ) ( CLEAR ?auto_56684 ) ( not ( = ?auto_56682 ?auto_56688 ) ) ( not ( = ?auto_56684 ?auto_56688 ) ) ( not ( = ?auto_56683 ?auto_56688 ) ) ( TRUCK-AT ?auto_56690 ?auto_56687 ) ( ON ?auto_56680 ?auto_56679 ) ( ON ?auto_56681 ?auto_56680 ) ( ON ?auto_56683 ?auto_56681 ) ( not ( = ?auto_56679 ?auto_56680 ) ) ( not ( = ?auto_56679 ?auto_56681 ) ) ( not ( = ?auto_56679 ?auto_56683 ) ) ( not ( = ?auto_56679 ?auto_56682 ) ) ( not ( = ?auto_56679 ?auto_56684 ) ) ( not ( = ?auto_56679 ?auto_56688 ) ) ( not ( = ?auto_56680 ?auto_56681 ) ) ( not ( = ?auto_56680 ?auto_56683 ) ) ( not ( = ?auto_56680 ?auto_56682 ) ) ( not ( = ?auto_56680 ?auto_56684 ) ) ( not ( = ?auto_56680 ?auto_56688 ) ) ( not ( = ?auto_56681 ?auto_56683 ) ) ( not ( = ?auto_56681 ?auto_56682 ) ) ( not ( = ?auto_56681 ?auto_56684 ) ) ( not ( = ?auto_56681 ?auto_56688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56683 ?auto_56682 ?auto_56684 )
      ( MAKE-5CRATE-VERIFY ?auto_56679 ?auto_56680 ?auto_56681 ?auto_56683 ?auto_56682 ?auto_56684 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56730 - SURFACE
      ?auto_56731 - SURFACE
      ?auto_56732 - SURFACE
      ?auto_56734 - SURFACE
      ?auto_56733 - SURFACE
      ?auto_56735 - SURFACE
    )
    :vars
    (
      ?auto_56739 - HOIST
      ?auto_56736 - PLACE
      ?auto_56741 - PLACE
      ?auto_56737 - HOIST
      ?auto_56740 - SURFACE
      ?auto_56738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56739 ?auto_56736 ) ( IS-CRATE ?auto_56735 ) ( not ( = ?auto_56733 ?auto_56735 ) ) ( not ( = ?auto_56734 ?auto_56733 ) ) ( not ( = ?auto_56734 ?auto_56735 ) ) ( not ( = ?auto_56741 ?auto_56736 ) ) ( HOIST-AT ?auto_56737 ?auto_56741 ) ( not ( = ?auto_56739 ?auto_56737 ) ) ( AVAILABLE ?auto_56737 ) ( SURFACE-AT ?auto_56735 ?auto_56741 ) ( ON ?auto_56735 ?auto_56740 ) ( CLEAR ?auto_56735 ) ( not ( = ?auto_56733 ?auto_56740 ) ) ( not ( = ?auto_56735 ?auto_56740 ) ) ( not ( = ?auto_56734 ?auto_56740 ) ) ( TRUCK-AT ?auto_56738 ?auto_56736 ) ( SURFACE-AT ?auto_56734 ?auto_56736 ) ( CLEAR ?auto_56734 ) ( LIFTING ?auto_56739 ?auto_56733 ) ( IS-CRATE ?auto_56733 ) ( ON ?auto_56731 ?auto_56730 ) ( ON ?auto_56732 ?auto_56731 ) ( ON ?auto_56734 ?auto_56732 ) ( not ( = ?auto_56730 ?auto_56731 ) ) ( not ( = ?auto_56730 ?auto_56732 ) ) ( not ( = ?auto_56730 ?auto_56734 ) ) ( not ( = ?auto_56730 ?auto_56733 ) ) ( not ( = ?auto_56730 ?auto_56735 ) ) ( not ( = ?auto_56730 ?auto_56740 ) ) ( not ( = ?auto_56731 ?auto_56732 ) ) ( not ( = ?auto_56731 ?auto_56734 ) ) ( not ( = ?auto_56731 ?auto_56733 ) ) ( not ( = ?auto_56731 ?auto_56735 ) ) ( not ( = ?auto_56731 ?auto_56740 ) ) ( not ( = ?auto_56732 ?auto_56734 ) ) ( not ( = ?auto_56732 ?auto_56733 ) ) ( not ( = ?auto_56732 ?auto_56735 ) ) ( not ( = ?auto_56732 ?auto_56740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56734 ?auto_56733 ?auto_56735 )
      ( MAKE-5CRATE-VERIFY ?auto_56730 ?auto_56731 ?auto_56732 ?auto_56734 ?auto_56733 ?auto_56735 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56781 - SURFACE
      ?auto_56782 - SURFACE
      ?auto_56783 - SURFACE
      ?auto_56785 - SURFACE
      ?auto_56784 - SURFACE
      ?auto_56786 - SURFACE
    )
    :vars
    (
      ?auto_56789 - HOIST
      ?auto_56788 - PLACE
      ?auto_56787 - PLACE
      ?auto_56791 - HOIST
      ?auto_56792 - SURFACE
      ?auto_56790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56789 ?auto_56788 ) ( IS-CRATE ?auto_56786 ) ( not ( = ?auto_56784 ?auto_56786 ) ) ( not ( = ?auto_56785 ?auto_56784 ) ) ( not ( = ?auto_56785 ?auto_56786 ) ) ( not ( = ?auto_56787 ?auto_56788 ) ) ( HOIST-AT ?auto_56791 ?auto_56787 ) ( not ( = ?auto_56789 ?auto_56791 ) ) ( AVAILABLE ?auto_56791 ) ( SURFACE-AT ?auto_56786 ?auto_56787 ) ( ON ?auto_56786 ?auto_56792 ) ( CLEAR ?auto_56786 ) ( not ( = ?auto_56784 ?auto_56792 ) ) ( not ( = ?auto_56786 ?auto_56792 ) ) ( not ( = ?auto_56785 ?auto_56792 ) ) ( TRUCK-AT ?auto_56790 ?auto_56788 ) ( SURFACE-AT ?auto_56785 ?auto_56788 ) ( CLEAR ?auto_56785 ) ( IS-CRATE ?auto_56784 ) ( AVAILABLE ?auto_56789 ) ( IN ?auto_56784 ?auto_56790 ) ( ON ?auto_56782 ?auto_56781 ) ( ON ?auto_56783 ?auto_56782 ) ( ON ?auto_56785 ?auto_56783 ) ( not ( = ?auto_56781 ?auto_56782 ) ) ( not ( = ?auto_56781 ?auto_56783 ) ) ( not ( = ?auto_56781 ?auto_56785 ) ) ( not ( = ?auto_56781 ?auto_56784 ) ) ( not ( = ?auto_56781 ?auto_56786 ) ) ( not ( = ?auto_56781 ?auto_56792 ) ) ( not ( = ?auto_56782 ?auto_56783 ) ) ( not ( = ?auto_56782 ?auto_56785 ) ) ( not ( = ?auto_56782 ?auto_56784 ) ) ( not ( = ?auto_56782 ?auto_56786 ) ) ( not ( = ?auto_56782 ?auto_56792 ) ) ( not ( = ?auto_56783 ?auto_56785 ) ) ( not ( = ?auto_56783 ?auto_56784 ) ) ( not ( = ?auto_56783 ?auto_56786 ) ) ( not ( = ?auto_56783 ?auto_56792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56785 ?auto_56784 ?auto_56786 )
      ( MAKE-5CRATE-VERIFY ?auto_56781 ?auto_56782 ?auto_56783 ?auto_56785 ?auto_56784 ?auto_56786 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_57990 - SURFACE
      ?auto_57991 - SURFACE
      ?auto_57992 - SURFACE
      ?auto_57994 - SURFACE
      ?auto_57993 - SURFACE
      ?auto_57995 - SURFACE
      ?auto_57996 - SURFACE
    )
    :vars
    (
      ?auto_57998 - HOIST
      ?auto_57997 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57998 ?auto_57997 ) ( SURFACE-AT ?auto_57995 ?auto_57997 ) ( CLEAR ?auto_57995 ) ( LIFTING ?auto_57998 ?auto_57996 ) ( IS-CRATE ?auto_57996 ) ( not ( = ?auto_57995 ?auto_57996 ) ) ( ON ?auto_57991 ?auto_57990 ) ( ON ?auto_57992 ?auto_57991 ) ( ON ?auto_57994 ?auto_57992 ) ( ON ?auto_57993 ?auto_57994 ) ( ON ?auto_57995 ?auto_57993 ) ( not ( = ?auto_57990 ?auto_57991 ) ) ( not ( = ?auto_57990 ?auto_57992 ) ) ( not ( = ?auto_57990 ?auto_57994 ) ) ( not ( = ?auto_57990 ?auto_57993 ) ) ( not ( = ?auto_57990 ?auto_57995 ) ) ( not ( = ?auto_57990 ?auto_57996 ) ) ( not ( = ?auto_57991 ?auto_57992 ) ) ( not ( = ?auto_57991 ?auto_57994 ) ) ( not ( = ?auto_57991 ?auto_57993 ) ) ( not ( = ?auto_57991 ?auto_57995 ) ) ( not ( = ?auto_57991 ?auto_57996 ) ) ( not ( = ?auto_57992 ?auto_57994 ) ) ( not ( = ?auto_57992 ?auto_57993 ) ) ( not ( = ?auto_57992 ?auto_57995 ) ) ( not ( = ?auto_57992 ?auto_57996 ) ) ( not ( = ?auto_57994 ?auto_57993 ) ) ( not ( = ?auto_57994 ?auto_57995 ) ) ( not ( = ?auto_57994 ?auto_57996 ) ) ( not ( = ?auto_57993 ?auto_57995 ) ) ( not ( = ?auto_57993 ?auto_57996 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_57995 ?auto_57996 )
      ( MAKE-6CRATE-VERIFY ?auto_57990 ?auto_57991 ?auto_57992 ?auto_57994 ?auto_57993 ?auto_57995 ?auto_57996 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58034 - SURFACE
      ?auto_58035 - SURFACE
      ?auto_58036 - SURFACE
      ?auto_58038 - SURFACE
      ?auto_58037 - SURFACE
      ?auto_58039 - SURFACE
      ?auto_58040 - SURFACE
    )
    :vars
    (
      ?auto_58041 - HOIST
      ?auto_58043 - PLACE
      ?auto_58042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58041 ?auto_58043 ) ( SURFACE-AT ?auto_58039 ?auto_58043 ) ( CLEAR ?auto_58039 ) ( IS-CRATE ?auto_58040 ) ( not ( = ?auto_58039 ?auto_58040 ) ) ( TRUCK-AT ?auto_58042 ?auto_58043 ) ( AVAILABLE ?auto_58041 ) ( IN ?auto_58040 ?auto_58042 ) ( ON ?auto_58039 ?auto_58037 ) ( not ( = ?auto_58037 ?auto_58039 ) ) ( not ( = ?auto_58037 ?auto_58040 ) ) ( ON ?auto_58035 ?auto_58034 ) ( ON ?auto_58036 ?auto_58035 ) ( ON ?auto_58038 ?auto_58036 ) ( ON ?auto_58037 ?auto_58038 ) ( not ( = ?auto_58034 ?auto_58035 ) ) ( not ( = ?auto_58034 ?auto_58036 ) ) ( not ( = ?auto_58034 ?auto_58038 ) ) ( not ( = ?auto_58034 ?auto_58037 ) ) ( not ( = ?auto_58034 ?auto_58039 ) ) ( not ( = ?auto_58034 ?auto_58040 ) ) ( not ( = ?auto_58035 ?auto_58036 ) ) ( not ( = ?auto_58035 ?auto_58038 ) ) ( not ( = ?auto_58035 ?auto_58037 ) ) ( not ( = ?auto_58035 ?auto_58039 ) ) ( not ( = ?auto_58035 ?auto_58040 ) ) ( not ( = ?auto_58036 ?auto_58038 ) ) ( not ( = ?auto_58036 ?auto_58037 ) ) ( not ( = ?auto_58036 ?auto_58039 ) ) ( not ( = ?auto_58036 ?auto_58040 ) ) ( not ( = ?auto_58038 ?auto_58037 ) ) ( not ( = ?auto_58038 ?auto_58039 ) ) ( not ( = ?auto_58038 ?auto_58040 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58037 ?auto_58039 ?auto_58040 )
      ( MAKE-6CRATE-VERIFY ?auto_58034 ?auto_58035 ?auto_58036 ?auto_58038 ?auto_58037 ?auto_58039 ?auto_58040 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58085 - SURFACE
      ?auto_58086 - SURFACE
      ?auto_58087 - SURFACE
      ?auto_58089 - SURFACE
      ?auto_58088 - SURFACE
      ?auto_58090 - SURFACE
      ?auto_58091 - SURFACE
    )
    :vars
    (
      ?auto_58094 - HOIST
      ?auto_58095 - PLACE
      ?auto_58093 - TRUCK
      ?auto_58092 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58094 ?auto_58095 ) ( SURFACE-AT ?auto_58090 ?auto_58095 ) ( CLEAR ?auto_58090 ) ( IS-CRATE ?auto_58091 ) ( not ( = ?auto_58090 ?auto_58091 ) ) ( AVAILABLE ?auto_58094 ) ( IN ?auto_58091 ?auto_58093 ) ( ON ?auto_58090 ?auto_58088 ) ( not ( = ?auto_58088 ?auto_58090 ) ) ( not ( = ?auto_58088 ?auto_58091 ) ) ( TRUCK-AT ?auto_58093 ?auto_58092 ) ( not ( = ?auto_58092 ?auto_58095 ) ) ( ON ?auto_58086 ?auto_58085 ) ( ON ?auto_58087 ?auto_58086 ) ( ON ?auto_58089 ?auto_58087 ) ( ON ?auto_58088 ?auto_58089 ) ( not ( = ?auto_58085 ?auto_58086 ) ) ( not ( = ?auto_58085 ?auto_58087 ) ) ( not ( = ?auto_58085 ?auto_58089 ) ) ( not ( = ?auto_58085 ?auto_58088 ) ) ( not ( = ?auto_58085 ?auto_58090 ) ) ( not ( = ?auto_58085 ?auto_58091 ) ) ( not ( = ?auto_58086 ?auto_58087 ) ) ( not ( = ?auto_58086 ?auto_58089 ) ) ( not ( = ?auto_58086 ?auto_58088 ) ) ( not ( = ?auto_58086 ?auto_58090 ) ) ( not ( = ?auto_58086 ?auto_58091 ) ) ( not ( = ?auto_58087 ?auto_58089 ) ) ( not ( = ?auto_58087 ?auto_58088 ) ) ( not ( = ?auto_58087 ?auto_58090 ) ) ( not ( = ?auto_58087 ?auto_58091 ) ) ( not ( = ?auto_58089 ?auto_58088 ) ) ( not ( = ?auto_58089 ?auto_58090 ) ) ( not ( = ?auto_58089 ?auto_58091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58088 ?auto_58090 ?auto_58091 )
      ( MAKE-6CRATE-VERIFY ?auto_58085 ?auto_58086 ?auto_58087 ?auto_58089 ?auto_58088 ?auto_58090 ?auto_58091 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58142 - SURFACE
      ?auto_58143 - SURFACE
      ?auto_58144 - SURFACE
      ?auto_58146 - SURFACE
      ?auto_58145 - SURFACE
      ?auto_58147 - SURFACE
      ?auto_58148 - SURFACE
    )
    :vars
    (
      ?auto_58151 - HOIST
      ?auto_58153 - PLACE
      ?auto_58149 - TRUCK
      ?auto_58152 - PLACE
      ?auto_58150 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_58151 ?auto_58153 ) ( SURFACE-AT ?auto_58147 ?auto_58153 ) ( CLEAR ?auto_58147 ) ( IS-CRATE ?auto_58148 ) ( not ( = ?auto_58147 ?auto_58148 ) ) ( AVAILABLE ?auto_58151 ) ( ON ?auto_58147 ?auto_58145 ) ( not ( = ?auto_58145 ?auto_58147 ) ) ( not ( = ?auto_58145 ?auto_58148 ) ) ( TRUCK-AT ?auto_58149 ?auto_58152 ) ( not ( = ?auto_58152 ?auto_58153 ) ) ( HOIST-AT ?auto_58150 ?auto_58152 ) ( LIFTING ?auto_58150 ?auto_58148 ) ( not ( = ?auto_58151 ?auto_58150 ) ) ( ON ?auto_58143 ?auto_58142 ) ( ON ?auto_58144 ?auto_58143 ) ( ON ?auto_58146 ?auto_58144 ) ( ON ?auto_58145 ?auto_58146 ) ( not ( = ?auto_58142 ?auto_58143 ) ) ( not ( = ?auto_58142 ?auto_58144 ) ) ( not ( = ?auto_58142 ?auto_58146 ) ) ( not ( = ?auto_58142 ?auto_58145 ) ) ( not ( = ?auto_58142 ?auto_58147 ) ) ( not ( = ?auto_58142 ?auto_58148 ) ) ( not ( = ?auto_58143 ?auto_58144 ) ) ( not ( = ?auto_58143 ?auto_58146 ) ) ( not ( = ?auto_58143 ?auto_58145 ) ) ( not ( = ?auto_58143 ?auto_58147 ) ) ( not ( = ?auto_58143 ?auto_58148 ) ) ( not ( = ?auto_58144 ?auto_58146 ) ) ( not ( = ?auto_58144 ?auto_58145 ) ) ( not ( = ?auto_58144 ?auto_58147 ) ) ( not ( = ?auto_58144 ?auto_58148 ) ) ( not ( = ?auto_58146 ?auto_58145 ) ) ( not ( = ?auto_58146 ?auto_58147 ) ) ( not ( = ?auto_58146 ?auto_58148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58145 ?auto_58147 ?auto_58148 )
      ( MAKE-6CRATE-VERIFY ?auto_58142 ?auto_58143 ?auto_58144 ?auto_58146 ?auto_58145 ?auto_58147 ?auto_58148 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58205 - SURFACE
      ?auto_58206 - SURFACE
      ?auto_58207 - SURFACE
      ?auto_58209 - SURFACE
      ?auto_58208 - SURFACE
      ?auto_58210 - SURFACE
      ?auto_58211 - SURFACE
    )
    :vars
    (
      ?auto_58212 - HOIST
      ?auto_58215 - PLACE
      ?auto_58213 - TRUCK
      ?auto_58216 - PLACE
      ?auto_58214 - HOIST
      ?auto_58217 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58212 ?auto_58215 ) ( SURFACE-AT ?auto_58210 ?auto_58215 ) ( CLEAR ?auto_58210 ) ( IS-CRATE ?auto_58211 ) ( not ( = ?auto_58210 ?auto_58211 ) ) ( AVAILABLE ?auto_58212 ) ( ON ?auto_58210 ?auto_58208 ) ( not ( = ?auto_58208 ?auto_58210 ) ) ( not ( = ?auto_58208 ?auto_58211 ) ) ( TRUCK-AT ?auto_58213 ?auto_58216 ) ( not ( = ?auto_58216 ?auto_58215 ) ) ( HOIST-AT ?auto_58214 ?auto_58216 ) ( not ( = ?auto_58212 ?auto_58214 ) ) ( AVAILABLE ?auto_58214 ) ( SURFACE-AT ?auto_58211 ?auto_58216 ) ( ON ?auto_58211 ?auto_58217 ) ( CLEAR ?auto_58211 ) ( not ( = ?auto_58210 ?auto_58217 ) ) ( not ( = ?auto_58211 ?auto_58217 ) ) ( not ( = ?auto_58208 ?auto_58217 ) ) ( ON ?auto_58206 ?auto_58205 ) ( ON ?auto_58207 ?auto_58206 ) ( ON ?auto_58209 ?auto_58207 ) ( ON ?auto_58208 ?auto_58209 ) ( not ( = ?auto_58205 ?auto_58206 ) ) ( not ( = ?auto_58205 ?auto_58207 ) ) ( not ( = ?auto_58205 ?auto_58209 ) ) ( not ( = ?auto_58205 ?auto_58208 ) ) ( not ( = ?auto_58205 ?auto_58210 ) ) ( not ( = ?auto_58205 ?auto_58211 ) ) ( not ( = ?auto_58205 ?auto_58217 ) ) ( not ( = ?auto_58206 ?auto_58207 ) ) ( not ( = ?auto_58206 ?auto_58209 ) ) ( not ( = ?auto_58206 ?auto_58208 ) ) ( not ( = ?auto_58206 ?auto_58210 ) ) ( not ( = ?auto_58206 ?auto_58211 ) ) ( not ( = ?auto_58206 ?auto_58217 ) ) ( not ( = ?auto_58207 ?auto_58209 ) ) ( not ( = ?auto_58207 ?auto_58208 ) ) ( not ( = ?auto_58207 ?auto_58210 ) ) ( not ( = ?auto_58207 ?auto_58211 ) ) ( not ( = ?auto_58207 ?auto_58217 ) ) ( not ( = ?auto_58209 ?auto_58208 ) ) ( not ( = ?auto_58209 ?auto_58210 ) ) ( not ( = ?auto_58209 ?auto_58211 ) ) ( not ( = ?auto_58209 ?auto_58217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58208 ?auto_58210 ?auto_58211 )
      ( MAKE-6CRATE-VERIFY ?auto_58205 ?auto_58206 ?auto_58207 ?auto_58209 ?auto_58208 ?auto_58210 ?auto_58211 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58269 - SURFACE
      ?auto_58270 - SURFACE
      ?auto_58271 - SURFACE
      ?auto_58273 - SURFACE
      ?auto_58272 - SURFACE
      ?auto_58274 - SURFACE
      ?auto_58275 - SURFACE
    )
    :vars
    (
      ?auto_58277 - HOIST
      ?auto_58281 - PLACE
      ?auto_58279 - PLACE
      ?auto_58276 - HOIST
      ?auto_58278 - SURFACE
      ?auto_58280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58277 ?auto_58281 ) ( SURFACE-AT ?auto_58274 ?auto_58281 ) ( CLEAR ?auto_58274 ) ( IS-CRATE ?auto_58275 ) ( not ( = ?auto_58274 ?auto_58275 ) ) ( AVAILABLE ?auto_58277 ) ( ON ?auto_58274 ?auto_58272 ) ( not ( = ?auto_58272 ?auto_58274 ) ) ( not ( = ?auto_58272 ?auto_58275 ) ) ( not ( = ?auto_58279 ?auto_58281 ) ) ( HOIST-AT ?auto_58276 ?auto_58279 ) ( not ( = ?auto_58277 ?auto_58276 ) ) ( AVAILABLE ?auto_58276 ) ( SURFACE-AT ?auto_58275 ?auto_58279 ) ( ON ?auto_58275 ?auto_58278 ) ( CLEAR ?auto_58275 ) ( not ( = ?auto_58274 ?auto_58278 ) ) ( not ( = ?auto_58275 ?auto_58278 ) ) ( not ( = ?auto_58272 ?auto_58278 ) ) ( TRUCK-AT ?auto_58280 ?auto_58281 ) ( ON ?auto_58270 ?auto_58269 ) ( ON ?auto_58271 ?auto_58270 ) ( ON ?auto_58273 ?auto_58271 ) ( ON ?auto_58272 ?auto_58273 ) ( not ( = ?auto_58269 ?auto_58270 ) ) ( not ( = ?auto_58269 ?auto_58271 ) ) ( not ( = ?auto_58269 ?auto_58273 ) ) ( not ( = ?auto_58269 ?auto_58272 ) ) ( not ( = ?auto_58269 ?auto_58274 ) ) ( not ( = ?auto_58269 ?auto_58275 ) ) ( not ( = ?auto_58269 ?auto_58278 ) ) ( not ( = ?auto_58270 ?auto_58271 ) ) ( not ( = ?auto_58270 ?auto_58273 ) ) ( not ( = ?auto_58270 ?auto_58272 ) ) ( not ( = ?auto_58270 ?auto_58274 ) ) ( not ( = ?auto_58270 ?auto_58275 ) ) ( not ( = ?auto_58270 ?auto_58278 ) ) ( not ( = ?auto_58271 ?auto_58273 ) ) ( not ( = ?auto_58271 ?auto_58272 ) ) ( not ( = ?auto_58271 ?auto_58274 ) ) ( not ( = ?auto_58271 ?auto_58275 ) ) ( not ( = ?auto_58271 ?auto_58278 ) ) ( not ( = ?auto_58273 ?auto_58272 ) ) ( not ( = ?auto_58273 ?auto_58274 ) ) ( not ( = ?auto_58273 ?auto_58275 ) ) ( not ( = ?auto_58273 ?auto_58278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58272 ?auto_58274 ?auto_58275 )
      ( MAKE-6CRATE-VERIFY ?auto_58269 ?auto_58270 ?auto_58271 ?auto_58273 ?auto_58272 ?auto_58274 ?auto_58275 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58333 - SURFACE
      ?auto_58334 - SURFACE
      ?auto_58335 - SURFACE
      ?auto_58337 - SURFACE
      ?auto_58336 - SURFACE
      ?auto_58338 - SURFACE
      ?auto_58339 - SURFACE
    )
    :vars
    (
      ?auto_58343 - HOIST
      ?auto_58345 - PLACE
      ?auto_58344 - PLACE
      ?auto_58342 - HOIST
      ?auto_58341 - SURFACE
      ?auto_58340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58343 ?auto_58345 ) ( IS-CRATE ?auto_58339 ) ( not ( = ?auto_58338 ?auto_58339 ) ) ( not ( = ?auto_58336 ?auto_58338 ) ) ( not ( = ?auto_58336 ?auto_58339 ) ) ( not ( = ?auto_58344 ?auto_58345 ) ) ( HOIST-AT ?auto_58342 ?auto_58344 ) ( not ( = ?auto_58343 ?auto_58342 ) ) ( AVAILABLE ?auto_58342 ) ( SURFACE-AT ?auto_58339 ?auto_58344 ) ( ON ?auto_58339 ?auto_58341 ) ( CLEAR ?auto_58339 ) ( not ( = ?auto_58338 ?auto_58341 ) ) ( not ( = ?auto_58339 ?auto_58341 ) ) ( not ( = ?auto_58336 ?auto_58341 ) ) ( TRUCK-AT ?auto_58340 ?auto_58345 ) ( SURFACE-AT ?auto_58336 ?auto_58345 ) ( CLEAR ?auto_58336 ) ( LIFTING ?auto_58343 ?auto_58338 ) ( IS-CRATE ?auto_58338 ) ( ON ?auto_58334 ?auto_58333 ) ( ON ?auto_58335 ?auto_58334 ) ( ON ?auto_58337 ?auto_58335 ) ( ON ?auto_58336 ?auto_58337 ) ( not ( = ?auto_58333 ?auto_58334 ) ) ( not ( = ?auto_58333 ?auto_58335 ) ) ( not ( = ?auto_58333 ?auto_58337 ) ) ( not ( = ?auto_58333 ?auto_58336 ) ) ( not ( = ?auto_58333 ?auto_58338 ) ) ( not ( = ?auto_58333 ?auto_58339 ) ) ( not ( = ?auto_58333 ?auto_58341 ) ) ( not ( = ?auto_58334 ?auto_58335 ) ) ( not ( = ?auto_58334 ?auto_58337 ) ) ( not ( = ?auto_58334 ?auto_58336 ) ) ( not ( = ?auto_58334 ?auto_58338 ) ) ( not ( = ?auto_58334 ?auto_58339 ) ) ( not ( = ?auto_58334 ?auto_58341 ) ) ( not ( = ?auto_58335 ?auto_58337 ) ) ( not ( = ?auto_58335 ?auto_58336 ) ) ( not ( = ?auto_58335 ?auto_58338 ) ) ( not ( = ?auto_58335 ?auto_58339 ) ) ( not ( = ?auto_58335 ?auto_58341 ) ) ( not ( = ?auto_58337 ?auto_58336 ) ) ( not ( = ?auto_58337 ?auto_58338 ) ) ( not ( = ?auto_58337 ?auto_58339 ) ) ( not ( = ?auto_58337 ?auto_58341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58336 ?auto_58338 ?auto_58339 )
      ( MAKE-6CRATE-VERIFY ?auto_58333 ?auto_58334 ?auto_58335 ?auto_58337 ?auto_58336 ?auto_58338 ?auto_58339 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58397 - SURFACE
      ?auto_58398 - SURFACE
      ?auto_58399 - SURFACE
      ?auto_58401 - SURFACE
      ?auto_58400 - SURFACE
      ?auto_58402 - SURFACE
      ?auto_58403 - SURFACE
    )
    :vars
    (
      ?auto_58408 - HOIST
      ?auto_58405 - PLACE
      ?auto_58406 - PLACE
      ?auto_58409 - HOIST
      ?auto_58407 - SURFACE
      ?auto_58404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58408 ?auto_58405 ) ( IS-CRATE ?auto_58403 ) ( not ( = ?auto_58402 ?auto_58403 ) ) ( not ( = ?auto_58400 ?auto_58402 ) ) ( not ( = ?auto_58400 ?auto_58403 ) ) ( not ( = ?auto_58406 ?auto_58405 ) ) ( HOIST-AT ?auto_58409 ?auto_58406 ) ( not ( = ?auto_58408 ?auto_58409 ) ) ( AVAILABLE ?auto_58409 ) ( SURFACE-AT ?auto_58403 ?auto_58406 ) ( ON ?auto_58403 ?auto_58407 ) ( CLEAR ?auto_58403 ) ( not ( = ?auto_58402 ?auto_58407 ) ) ( not ( = ?auto_58403 ?auto_58407 ) ) ( not ( = ?auto_58400 ?auto_58407 ) ) ( TRUCK-AT ?auto_58404 ?auto_58405 ) ( SURFACE-AT ?auto_58400 ?auto_58405 ) ( CLEAR ?auto_58400 ) ( IS-CRATE ?auto_58402 ) ( AVAILABLE ?auto_58408 ) ( IN ?auto_58402 ?auto_58404 ) ( ON ?auto_58398 ?auto_58397 ) ( ON ?auto_58399 ?auto_58398 ) ( ON ?auto_58401 ?auto_58399 ) ( ON ?auto_58400 ?auto_58401 ) ( not ( = ?auto_58397 ?auto_58398 ) ) ( not ( = ?auto_58397 ?auto_58399 ) ) ( not ( = ?auto_58397 ?auto_58401 ) ) ( not ( = ?auto_58397 ?auto_58400 ) ) ( not ( = ?auto_58397 ?auto_58402 ) ) ( not ( = ?auto_58397 ?auto_58403 ) ) ( not ( = ?auto_58397 ?auto_58407 ) ) ( not ( = ?auto_58398 ?auto_58399 ) ) ( not ( = ?auto_58398 ?auto_58401 ) ) ( not ( = ?auto_58398 ?auto_58400 ) ) ( not ( = ?auto_58398 ?auto_58402 ) ) ( not ( = ?auto_58398 ?auto_58403 ) ) ( not ( = ?auto_58398 ?auto_58407 ) ) ( not ( = ?auto_58399 ?auto_58401 ) ) ( not ( = ?auto_58399 ?auto_58400 ) ) ( not ( = ?auto_58399 ?auto_58402 ) ) ( not ( = ?auto_58399 ?auto_58403 ) ) ( not ( = ?auto_58399 ?auto_58407 ) ) ( not ( = ?auto_58401 ?auto_58400 ) ) ( not ( = ?auto_58401 ?auto_58402 ) ) ( not ( = ?auto_58401 ?auto_58403 ) ) ( not ( = ?auto_58401 ?auto_58407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58400 ?auto_58402 ?auto_58403 )
      ( MAKE-6CRATE-VERIFY ?auto_58397 ?auto_58398 ?auto_58399 ?auto_58401 ?auto_58400 ?auto_58402 ?auto_58403 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60353 - SURFACE
      ?auto_60354 - SURFACE
      ?auto_60355 - SURFACE
      ?auto_60357 - SURFACE
      ?auto_60356 - SURFACE
      ?auto_60358 - SURFACE
      ?auto_60359 - SURFACE
      ?auto_60360 - SURFACE
    )
    :vars
    (
      ?auto_60362 - HOIST
      ?auto_60361 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60362 ?auto_60361 ) ( SURFACE-AT ?auto_60359 ?auto_60361 ) ( CLEAR ?auto_60359 ) ( LIFTING ?auto_60362 ?auto_60360 ) ( IS-CRATE ?auto_60360 ) ( not ( = ?auto_60359 ?auto_60360 ) ) ( ON ?auto_60354 ?auto_60353 ) ( ON ?auto_60355 ?auto_60354 ) ( ON ?auto_60357 ?auto_60355 ) ( ON ?auto_60356 ?auto_60357 ) ( ON ?auto_60358 ?auto_60356 ) ( ON ?auto_60359 ?auto_60358 ) ( not ( = ?auto_60353 ?auto_60354 ) ) ( not ( = ?auto_60353 ?auto_60355 ) ) ( not ( = ?auto_60353 ?auto_60357 ) ) ( not ( = ?auto_60353 ?auto_60356 ) ) ( not ( = ?auto_60353 ?auto_60358 ) ) ( not ( = ?auto_60353 ?auto_60359 ) ) ( not ( = ?auto_60353 ?auto_60360 ) ) ( not ( = ?auto_60354 ?auto_60355 ) ) ( not ( = ?auto_60354 ?auto_60357 ) ) ( not ( = ?auto_60354 ?auto_60356 ) ) ( not ( = ?auto_60354 ?auto_60358 ) ) ( not ( = ?auto_60354 ?auto_60359 ) ) ( not ( = ?auto_60354 ?auto_60360 ) ) ( not ( = ?auto_60355 ?auto_60357 ) ) ( not ( = ?auto_60355 ?auto_60356 ) ) ( not ( = ?auto_60355 ?auto_60358 ) ) ( not ( = ?auto_60355 ?auto_60359 ) ) ( not ( = ?auto_60355 ?auto_60360 ) ) ( not ( = ?auto_60357 ?auto_60356 ) ) ( not ( = ?auto_60357 ?auto_60358 ) ) ( not ( = ?auto_60357 ?auto_60359 ) ) ( not ( = ?auto_60357 ?auto_60360 ) ) ( not ( = ?auto_60356 ?auto_60358 ) ) ( not ( = ?auto_60356 ?auto_60359 ) ) ( not ( = ?auto_60356 ?auto_60360 ) ) ( not ( = ?auto_60358 ?auto_60359 ) ) ( not ( = ?auto_60358 ?auto_60360 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_60359 ?auto_60360 )
      ( MAKE-7CRATE-VERIFY ?auto_60353 ?auto_60354 ?auto_60355 ?auto_60357 ?auto_60356 ?auto_60358 ?auto_60359 ?auto_60360 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60408 - SURFACE
      ?auto_60409 - SURFACE
      ?auto_60410 - SURFACE
      ?auto_60412 - SURFACE
      ?auto_60411 - SURFACE
      ?auto_60413 - SURFACE
      ?auto_60414 - SURFACE
      ?auto_60415 - SURFACE
    )
    :vars
    (
      ?auto_60417 - HOIST
      ?auto_60416 - PLACE
      ?auto_60418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60417 ?auto_60416 ) ( SURFACE-AT ?auto_60414 ?auto_60416 ) ( CLEAR ?auto_60414 ) ( IS-CRATE ?auto_60415 ) ( not ( = ?auto_60414 ?auto_60415 ) ) ( TRUCK-AT ?auto_60418 ?auto_60416 ) ( AVAILABLE ?auto_60417 ) ( IN ?auto_60415 ?auto_60418 ) ( ON ?auto_60414 ?auto_60413 ) ( not ( = ?auto_60413 ?auto_60414 ) ) ( not ( = ?auto_60413 ?auto_60415 ) ) ( ON ?auto_60409 ?auto_60408 ) ( ON ?auto_60410 ?auto_60409 ) ( ON ?auto_60412 ?auto_60410 ) ( ON ?auto_60411 ?auto_60412 ) ( ON ?auto_60413 ?auto_60411 ) ( not ( = ?auto_60408 ?auto_60409 ) ) ( not ( = ?auto_60408 ?auto_60410 ) ) ( not ( = ?auto_60408 ?auto_60412 ) ) ( not ( = ?auto_60408 ?auto_60411 ) ) ( not ( = ?auto_60408 ?auto_60413 ) ) ( not ( = ?auto_60408 ?auto_60414 ) ) ( not ( = ?auto_60408 ?auto_60415 ) ) ( not ( = ?auto_60409 ?auto_60410 ) ) ( not ( = ?auto_60409 ?auto_60412 ) ) ( not ( = ?auto_60409 ?auto_60411 ) ) ( not ( = ?auto_60409 ?auto_60413 ) ) ( not ( = ?auto_60409 ?auto_60414 ) ) ( not ( = ?auto_60409 ?auto_60415 ) ) ( not ( = ?auto_60410 ?auto_60412 ) ) ( not ( = ?auto_60410 ?auto_60411 ) ) ( not ( = ?auto_60410 ?auto_60413 ) ) ( not ( = ?auto_60410 ?auto_60414 ) ) ( not ( = ?auto_60410 ?auto_60415 ) ) ( not ( = ?auto_60412 ?auto_60411 ) ) ( not ( = ?auto_60412 ?auto_60413 ) ) ( not ( = ?auto_60412 ?auto_60414 ) ) ( not ( = ?auto_60412 ?auto_60415 ) ) ( not ( = ?auto_60411 ?auto_60413 ) ) ( not ( = ?auto_60411 ?auto_60414 ) ) ( not ( = ?auto_60411 ?auto_60415 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60413 ?auto_60414 ?auto_60415 )
      ( MAKE-7CRATE-VERIFY ?auto_60408 ?auto_60409 ?auto_60410 ?auto_60412 ?auto_60411 ?auto_60413 ?auto_60414 ?auto_60415 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60471 - SURFACE
      ?auto_60472 - SURFACE
      ?auto_60473 - SURFACE
      ?auto_60475 - SURFACE
      ?auto_60474 - SURFACE
      ?auto_60476 - SURFACE
      ?auto_60477 - SURFACE
      ?auto_60478 - SURFACE
    )
    :vars
    (
      ?auto_60480 - HOIST
      ?auto_60482 - PLACE
      ?auto_60481 - TRUCK
      ?auto_60479 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60480 ?auto_60482 ) ( SURFACE-AT ?auto_60477 ?auto_60482 ) ( CLEAR ?auto_60477 ) ( IS-CRATE ?auto_60478 ) ( not ( = ?auto_60477 ?auto_60478 ) ) ( AVAILABLE ?auto_60480 ) ( IN ?auto_60478 ?auto_60481 ) ( ON ?auto_60477 ?auto_60476 ) ( not ( = ?auto_60476 ?auto_60477 ) ) ( not ( = ?auto_60476 ?auto_60478 ) ) ( TRUCK-AT ?auto_60481 ?auto_60479 ) ( not ( = ?auto_60479 ?auto_60482 ) ) ( ON ?auto_60472 ?auto_60471 ) ( ON ?auto_60473 ?auto_60472 ) ( ON ?auto_60475 ?auto_60473 ) ( ON ?auto_60474 ?auto_60475 ) ( ON ?auto_60476 ?auto_60474 ) ( not ( = ?auto_60471 ?auto_60472 ) ) ( not ( = ?auto_60471 ?auto_60473 ) ) ( not ( = ?auto_60471 ?auto_60475 ) ) ( not ( = ?auto_60471 ?auto_60474 ) ) ( not ( = ?auto_60471 ?auto_60476 ) ) ( not ( = ?auto_60471 ?auto_60477 ) ) ( not ( = ?auto_60471 ?auto_60478 ) ) ( not ( = ?auto_60472 ?auto_60473 ) ) ( not ( = ?auto_60472 ?auto_60475 ) ) ( not ( = ?auto_60472 ?auto_60474 ) ) ( not ( = ?auto_60472 ?auto_60476 ) ) ( not ( = ?auto_60472 ?auto_60477 ) ) ( not ( = ?auto_60472 ?auto_60478 ) ) ( not ( = ?auto_60473 ?auto_60475 ) ) ( not ( = ?auto_60473 ?auto_60474 ) ) ( not ( = ?auto_60473 ?auto_60476 ) ) ( not ( = ?auto_60473 ?auto_60477 ) ) ( not ( = ?auto_60473 ?auto_60478 ) ) ( not ( = ?auto_60475 ?auto_60474 ) ) ( not ( = ?auto_60475 ?auto_60476 ) ) ( not ( = ?auto_60475 ?auto_60477 ) ) ( not ( = ?auto_60475 ?auto_60478 ) ) ( not ( = ?auto_60474 ?auto_60476 ) ) ( not ( = ?auto_60474 ?auto_60477 ) ) ( not ( = ?auto_60474 ?auto_60478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60476 ?auto_60477 ?auto_60478 )
      ( MAKE-7CRATE-VERIFY ?auto_60471 ?auto_60472 ?auto_60473 ?auto_60475 ?auto_60474 ?auto_60476 ?auto_60477 ?auto_60478 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60541 - SURFACE
      ?auto_60542 - SURFACE
      ?auto_60543 - SURFACE
      ?auto_60545 - SURFACE
      ?auto_60544 - SURFACE
      ?auto_60546 - SURFACE
      ?auto_60547 - SURFACE
      ?auto_60548 - SURFACE
    )
    :vars
    (
      ?auto_60549 - HOIST
      ?auto_60553 - PLACE
      ?auto_60550 - TRUCK
      ?auto_60552 - PLACE
      ?auto_60551 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60549 ?auto_60553 ) ( SURFACE-AT ?auto_60547 ?auto_60553 ) ( CLEAR ?auto_60547 ) ( IS-CRATE ?auto_60548 ) ( not ( = ?auto_60547 ?auto_60548 ) ) ( AVAILABLE ?auto_60549 ) ( ON ?auto_60547 ?auto_60546 ) ( not ( = ?auto_60546 ?auto_60547 ) ) ( not ( = ?auto_60546 ?auto_60548 ) ) ( TRUCK-AT ?auto_60550 ?auto_60552 ) ( not ( = ?auto_60552 ?auto_60553 ) ) ( HOIST-AT ?auto_60551 ?auto_60552 ) ( LIFTING ?auto_60551 ?auto_60548 ) ( not ( = ?auto_60549 ?auto_60551 ) ) ( ON ?auto_60542 ?auto_60541 ) ( ON ?auto_60543 ?auto_60542 ) ( ON ?auto_60545 ?auto_60543 ) ( ON ?auto_60544 ?auto_60545 ) ( ON ?auto_60546 ?auto_60544 ) ( not ( = ?auto_60541 ?auto_60542 ) ) ( not ( = ?auto_60541 ?auto_60543 ) ) ( not ( = ?auto_60541 ?auto_60545 ) ) ( not ( = ?auto_60541 ?auto_60544 ) ) ( not ( = ?auto_60541 ?auto_60546 ) ) ( not ( = ?auto_60541 ?auto_60547 ) ) ( not ( = ?auto_60541 ?auto_60548 ) ) ( not ( = ?auto_60542 ?auto_60543 ) ) ( not ( = ?auto_60542 ?auto_60545 ) ) ( not ( = ?auto_60542 ?auto_60544 ) ) ( not ( = ?auto_60542 ?auto_60546 ) ) ( not ( = ?auto_60542 ?auto_60547 ) ) ( not ( = ?auto_60542 ?auto_60548 ) ) ( not ( = ?auto_60543 ?auto_60545 ) ) ( not ( = ?auto_60543 ?auto_60544 ) ) ( not ( = ?auto_60543 ?auto_60546 ) ) ( not ( = ?auto_60543 ?auto_60547 ) ) ( not ( = ?auto_60543 ?auto_60548 ) ) ( not ( = ?auto_60545 ?auto_60544 ) ) ( not ( = ?auto_60545 ?auto_60546 ) ) ( not ( = ?auto_60545 ?auto_60547 ) ) ( not ( = ?auto_60545 ?auto_60548 ) ) ( not ( = ?auto_60544 ?auto_60546 ) ) ( not ( = ?auto_60544 ?auto_60547 ) ) ( not ( = ?auto_60544 ?auto_60548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60546 ?auto_60547 ?auto_60548 )
      ( MAKE-7CRATE-VERIFY ?auto_60541 ?auto_60542 ?auto_60543 ?auto_60545 ?auto_60544 ?auto_60546 ?auto_60547 ?auto_60548 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60618 - SURFACE
      ?auto_60619 - SURFACE
      ?auto_60620 - SURFACE
      ?auto_60622 - SURFACE
      ?auto_60621 - SURFACE
      ?auto_60623 - SURFACE
      ?auto_60624 - SURFACE
      ?auto_60625 - SURFACE
    )
    :vars
    (
      ?auto_60628 - HOIST
      ?auto_60630 - PLACE
      ?auto_60631 - TRUCK
      ?auto_60627 - PLACE
      ?auto_60629 - HOIST
      ?auto_60626 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60628 ?auto_60630 ) ( SURFACE-AT ?auto_60624 ?auto_60630 ) ( CLEAR ?auto_60624 ) ( IS-CRATE ?auto_60625 ) ( not ( = ?auto_60624 ?auto_60625 ) ) ( AVAILABLE ?auto_60628 ) ( ON ?auto_60624 ?auto_60623 ) ( not ( = ?auto_60623 ?auto_60624 ) ) ( not ( = ?auto_60623 ?auto_60625 ) ) ( TRUCK-AT ?auto_60631 ?auto_60627 ) ( not ( = ?auto_60627 ?auto_60630 ) ) ( HOIST-AT ?auto_60629 ?auto_60627 ) ( not ( = ?auto_60628 ?auto_60629 ) ) ( AVAILABLE ?auto_60629 ) ( SURFACE-AT ?auto_60625 ?auto_60627 ) ( ON ?auto_60625 ?auto_60626 ) ( CLEAR ?auto_60625 ) ( not ( = ?auto_60624 ?auto_60626 ) ) ( not ( = ?auto_60625 ?auto_60626 ) ) ( not ( = ?auto_60623 ?auto_60626 ) ) ( ON ?auto_60619 ?auto_60618 ) ( ON ?auto_60620 ?auto_60619 ) ( ON ?auto_60622 ?auto_60620 ) ( ON ?auto_60621 ?auto_60622 ) ( ON ?auto_60623 ?auto_60621 ) ( not ( = ?auto_60618 ?auto_60619 ) ) ( not ( = ?auto_60618 ?auto_60620 ) ) ( not ( = ?auto_60618 ?auto_60622 ) ) ( not ( = ?auto_60618 ?auto_60621 ) ) ( not ( = ?auto_60618 ?auto_60623 ) ) ( not ( = ?auto_60618 ?auto_60624 ) ) ( not ( = ?auto_60618 ?auto_60625 ) ) ( not ( = ?auto_60618 ?auto_60626 ) ) ( not ( = ?auto_60619 ?auto_60620 ) ) ( not ( = ?auto_60619 ?auto_60622 ) ) ( not ( = ?auto_60619 ?auto_60621 ) ) ( not ( = ?auto_60619 ?auto_60623 ) ) ( not ( = ?auto_60619 ?auto_60624 ) ) ( not ( = ?auto_60619 ?auto_60625 ) ) ( not ( = ?auto_60619 ?auto_60626 ) ) ( not ( = ?auto_60620 ?auto_60622 ) ) ( not ( = ?auto_60620 ?auto_60621 ) ) ( not ( = ?auto_60620 ?auto_60623 ) ) ( not ( = ?auto_60620 ?auto_60624 ) ) ( not ( = ?auto_60620 ?auto_60625 ) ) ( not ( = ?auto_60620 ?auto_60626 ) ) ( not ( = ?auto_60622 ?auto_60621 ) ) ( not ( = ?auto_60622 ?auto_60623 ) ) ( not ( = ?auto_60622 ?auto_60624 ) ) ( not ( = ?auto_60622 ?auto_60625 ) ) ( not ( = ?auto_60622 ?auto_60626 ) ) ( not ( = ?auto_60621 ?auto_60623 ) ) ( not ( = ?auto_60621 ?auto_60624 ) ) ( not ( = ?auto_60621 ?auto_60625 ) ) ( not ( = ?auto_60621 ?auto_60626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60623 ?auto_60624 ?auto_60625 )
      ( MAKE-7CRATE-VERIFY ?auto_60618 ?auto_60619 ?auto_60620 ?auto_60622 ?auto_60621 ?auto_60623 ?auto_60624 ?auto_60625 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60696 - SURFACE
      ?auto_60697 - SURFACE
      ?auto_60698 - SURFACE
      ?auto_60700 - SURFACE
      ?auto_60699 - SURFACE
      ?auto_60701 - SURFACE
      ?auto_60702 - SURFACE
      ?auto_60703 - SURFACE
    )
    :vars
    (
      ?auto_60707 - HOIST
      ?auto_60706 - PLACE
      ?auto_60709 - PLACE
      ?auto_60704 - HOIST
      ?auto_60705 - SURFACE
      ?auto_60708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60707 ?auto_60706 ) ( SURFACE-AT ?auto_60702 ?auto_60706 ) ( CLEAR ?auto_60702 ) ( IS-CRATE ?auto_60703 ) ( not ( = ?auto_60702 ?auto_60703 ) ) ( AVAILABLE ?auto_60707 ) ( ON ?auto_60702 ?auto_60701 ) ( not ( = ?auto_60701 ?auto_60702 ) ) ( not ( = ?auto_60701 ?auto_60703 ) ) ( not ( = ?auto_60709 ?auto_60706 ) ) ( HOIST-AT ?auto_60704 ?auto_60709 ) ( not ( = ?auto_60707 ?auto_60704 ) ) ( AVAILABLE ?auto_60704 ) ( SURFACE-AT ?auto_60703 ?auto_60709 ) ( ON ?auto_60703 ?auto_60705 ) ( CLEAR ?auto_60703 ) ( not ( = ?auto_60702 ?auto_60705 ) ) ( not ( = ?auto_60703 ?auto_60705 ) ) ( not ( = ?auto_60701 ?auto_60705 ) ) ( TRUCK-AT ?auto_60708 ?auto_60706 ) ( ON ?auto_60697 ?auto_60696 ) ( ON ?auto_60698 ?auto_60697 ) ( ON ?auto_60700 ?auto_60698 ) ( ON ?auto_60699 ?auto_60700 ) ( ON ?auto_60701 ?auto_60699 ) ( not ( = ?auto_60696 ?auto_60697 ) ) ( not ( = ?auto_60696 ?auto_60698 ) ) ( not ( = ?auto_60696 ?auto_60700 ) ) ( not ( = ?auto_60696 ?auto_60699 ) ) ( not ( = ?auto_60696 ?auto_60701 ) ) ( not ( = ?auto_60696 ?auto_60702 ) ) ( not ( = ?auto_60696 ?auto_60703 ) ) ( not ( = ?auto_60696 ?auto_60705 ) ) ( not ( = ?auto_60697 ?auto_60698 ) ) ( not ( = ?auto_60697 ?auto_60700 ) ) ( not ( = ?auto_60697 ?auto_60699 ) ) ( not ( = ?auto_60697 ?auto_60701 ) ) ( not ( = ?auto_60697 ?auto_60702 ) ) ( not ( = ?auto_60697 ?auto_60703 ) ) ( not ( = ?auto_60697 ?auto_60705 ) ) ( not ( = ?auto_60698 ?auto_60700 ) ) ( not ( = ?auto_60698 ?auto_60699 ) ) ( not ( = ?auto_60698 ?auto_60701 ) ) ( not ( = ?auto_60698 ?auto_60702 ) ) ( not ( = ?auto_60698 ?auto_60703 ) ) ( not ( = ?auto_60698 ?auto_60705 ) ) ( not ( = ?auto_60700 ?auto_60699 ) ) ( not ( = ?auto_60700 ?auto_60701 ) ) ( not ( = ?auto_60700 ?auto_60702 ) ) ( not ( = ?auto_60700 ?auto_60703 ) ) ( not ( = ?auto_60700 ?auto_60705 ) ) ( not ( = ?auto_60699 ?auto_60701 ) ) ( not ( = ?auto_60699 ?auto_60702 ) ) ( not ( = ?auto_60699 ?auto_60703 ) ) ( not ( = ?auto_60699 ?auto_60705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60701 ?auto_60702 ?auto_60703 )
      ( MAKE-7CRATE-VERIFY ?auto_60696 ?auto_60697 ?auto_60698 ?auto_60700 ?auto_60699 ?auto_60701 ?auto_60702 ?auto_60703 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60774 - SURFACE
      ?auto_60775 - SURFACE
      ?auto_60776 - SURFACE
      ?auto_60778 - SURFACE
      ?auto_60777 - SURFACE
      ?auto_60779 - SURFACE
      ?auto_60780 - SURFACE
      ?auto_60781 - SURFACE
    )
    :vars
    (
      ?auto_60786 - HOIST
      ?auto_60784 - PLACE
      ?auto_60785 - PLACE
      ?auto_60782 - HOIST
      ?auto_60787 - SURFACE
      ?auto_60783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60786 ?auto_60784 ) ( IS-CRATE ?auto_60781 ) ( not ( = ?auto_60780 ?auto_60781 ) ) ( not ( = ?auto_60779 ?auto_60780 ) ) ( not ( = ?auto_60779 ?auto_60781 ) ) ( not ( = ?auto_60785 ?auto_60784 ) ) ( HOIST-AT ?auto_60782 ?auto_60785 ) ( not ( = ?auto_60786 ?auto_60782 ) ) ( AVAILABLE ?auto_60782 ) ( SURFACE-AT ?auto_60781 ?auto_60785 ) ( ON ?auto_60781 ?auto_60787 ) ( CLEAR ?auto_60781 ) ( not ( = ?auto_60780 ?auto_60787 ) ) ( not ( = ?auto_60781 ?auto_60787 ) ) ( not ( = ?auto_60779 ?auto_60787 ) ) ( TRUCK-AT ?auto_60783 ?auto_60784 ) ( SURFACE-AT ?auto_60779 ?auto_60784 ) ( CLEAR ?auto_60779 ) ( LIFTING ?auto_60786 ?auto_60780 ) ( IS-CRATE ?auto_60780 ) ( ON ?auto_60775 ?auto_60774 ) ( ON ?auto_60776 ?auto_60775 ) ( ON ?auto_60778 ?auto_60776 ) ( ON ?auto_60777 ?auto_60778 ) ( ON ?auto_60779 ?auto_60777 ) ( not ( = ?auto_60774 ?auto_60775 ) ) ( not ( = ?auto_60774 ?auto_60776 ) ) ( not ( = ?auto_60774 ?auto_60778 ) ) ( not ( = ?auto_60774 ?auto_60777 ) ) ( not ( = ?auto_60774 ?auto_60779 ) ) ( not ( = ?auto_60774 ?auto_60780 ) ) ( not ( = ?auto_60774 ?auto_60781 ) ) ( not ( = ?auto_60774 ?auto_60787 ) ) ( not ( = ?auto_60775 ?auto_60776 ) ) ( not ( = ?auto_60775 ?auto_60778 ) ) ( not ( = ?auto_60775 ?auto_60777 ) ) ( not ( = ?auto_60775 ?auto_60779 ) ) ( not ( = ?auto_60775 ?auto_60780 ) ) ( not ( = ?auto_60775 ?auto_60781 ) ) ( not ( = ?auto_60775 ?auto_60787 ) ) ( not ( = ?auto_60776 ?auto_60778 ) ) ( not ( = ?auto_60776 ?auto_60777 ) ) ( not ( = ?auto_60776 ?auto_60779 ) ) ( not ( = ?auto_60776 ?auto_60780 ) ) ( not ( = ?auto_60776 ?auto_60781 ) ) ( not ( = ?auto_60776 ?auto_60787 ) ) ( not ( = ?auto_60778 ?auto_60777 ) ) ( not ( = ?auto_60778 ?auto_60779 ) ) ( not ( = ?auto_60778 ?auto_60780 ) ) ( not ( = ?auto_60778 ?auto_60781 ) ) ( not ( = ?auto_60778 ?auto_60787 ) ) ( not ( = ?auto_60777 ?auto_60779 ) ) ( not ( = ?auto_60777 ?auto_60780 ) ) ( not ( = ?auto_60777 ?auto_60781 ) ) ( not ( = ?auto_60777 ?auto_60787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60779 ?auto_60780 ?auto_60781 )
      ( MAKE-7CRATE-VERIFY ?auto_60774 ?auto_60775 ?auto_60776 ?auto_60778 ?auto_60777 ?auto_60779 ?auto_60780 ?auto_60781 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60852 - SURFACE
      ?auto_60853 - SURFACE
      ?auto_60854 - SURFACE
      ?auto_60856 - SURFACE
      ?auto_60855 - SURFACE
      ?auto_60857 - SURFACE
      ?auto_60858 - SURFACE
      ?auto_60859 - SURFACE
    )
    :vars
    (
      ?auto_60861 - HOIST
      ?auto_60862 - PLACE
      ?auto_60865 - PLACE
      ?auto_60860 - HOIST
      ?auto_60863 - SURFACE
      ?auto_60864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60861 ?auto_60862 ) ( IS-CRATE ?auto_60859 ) ( not ( = ?auto_60858 ?auto_60859 ) ) ( not ( = ?auto_60857 ?auto_60858 ) ) ( not ( = ?auto_60857 ?auto_60859 ) ) ( not ( = ?auto_60865 ?auto_60862 ) ) ( HOIST-AT ?auto_60860 ?auto_60865 ) ( not ( = ?auto_60861 ?auto_60860 ) ) ( AVAILABLE ?auto_60860 ) ( SURFACE-AT ?auto_60859 ?auto_60865 ) ( ON ?auto_60859 ?auto_60863 ) ( CLEAR ?auto_60859 ) ( not ( = ?auto_60858 ?auto_60863 ) ) ( not ( = ?auto_60859 ?auto_60863 ) ) ( not ( = ?auto_60857 ?auto_60863 ) ) ( TRUCK-AT ?auto_60864 ?auto_60862 ) ( SURFACE-AT ?auto_60857 ?auto_60862 ) ( CLEAR ?auto_60857 ) ( IS-CRATE ?auto_60858 ) ( AVAILABLE ?auto_60861 ) ( IN ?auto_60858 ?auto_60864 ) ( ON ?auto_60853 ?auto_60852 ) ( ON ?auto_60854 ?auto_60853 ) ( ON ?auto_60856 ?auto_60854 ) ( ON ?auto_60855 ?auto_60856 ) ( ON ?auto_60857 ?auto_60855 ) ( not ( = ?auto_60852 ?auto_60853 ) ) ( not ( = ?auto_60852 ?auto_60854 ) ) ( not ( = ?auto_60852 ?auto_60856 ) ) ( not ( = ?auto_60852 ?auto_60855 ) ) ( not ( = ?auto_60852 ?auto_60857 ) ) ( not ( = ?auto_60852 ?auto_60858 ) ) ( not ( = ?auto_60852 ?auto_60859 ) ) ( not ( = ?auto_60852 ?auto_60863 ) ) ( not ( = ?auto_60853 ?auto_60854 ) ) ( not ( = ?auto_60853 ?auto_60856 ) ) ( not ( = ?auto_60853 ?auto_60855 ) ) ( not ( = ?auto_60853 ?auto_60857 ) ) ( not ( = ?auto_60853 ?auto_60858 ) ) ( not ( = ?auto_60853 ?auto_60859 ) ) ( not ( = ?auto_60853 ?auto_60863 ) ) ( not ( = ?auto_60854 ?auto_60856 ) ) ( not ( = ?auto_60854 ?auto_60855 ) ) ( not ( = ?auto_60854 ?auto_60857 ) ) ( not ( = ?auto_60854 ?auto_60858 ) ) ( not ( = ?auto_60854 ?auto_60859 ) ) ( not ( = ?auto_60854 ?auto_60863 ) ) ( not ( = ?auto_60856 ?auto_60855 ) ) ( not ( = ?auto_60856 ?auto_60857 ) ) ( not ( = ?auto_60856 ?auto_60858 ) ) ( not ( = ?auto_60856 ?auto_60859 ) ) ( not ( = ?auto_60856 ?auto_60863 ) ) ( not ( = ?auto_60855 ?auto_60857 ) ) ( not ( = ?auto_60855 ?auto_60858 ) ) ( not ( = ?auto_60855 ?auto_60859 ) ) ( not ( = ?auto_60855 ?auto_60863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60857 ?auto_60858 ?auto_60859 )
      ( MAKE-7CRATE-VERIFY ?auto_60852 ?auto_60853 ?auto_60854 ?auto_60856 ?auto_60855 ?auto_60857 ?auto_60858 ?auto_60859 ) )
  )

)

