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
      ?auto_1808921 - SURFACE
      ?auto_1808922 - SURFACE
    )
    :vars
    (
      ?auto_1808923 - HOIST
      ?auto_1808924 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808923 ?auto_1808924 ) ( SURFACE-AT ?auto_1808921 ?auto_1808924 ) ( CLEAR ?auto_1808921 ) ( LIFTING ?auto_1808923 ?auto_1808922 ) ( IS-CRATE ?auto_1808922 ) ( not ( = ?auto_1808921 ?auto_1808922 ) ) )
    :subtasks
    ( ( !DROP ?auto_1808923 ?auto_1808922 ?auto_1808921 ?auto_1808924 )
      ( MAKE-1CRATE-VERIFY ?auto_1808921 ?auto_1808922 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808925 - SURFACE
      ?auto_1808926 - SURFACE
    )
    :vars
    (
      ?auto_1808928 - HOIST
      ?auto_1808927 - PLACE
      ?auto_1808929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808928 ?auto_1808927 ) ( SURFACE-AT ?auto_1808925 ?auto_1808927 ) ( CLEAR ?auto_1808925 ) ( IS-CRATE ?auto_1808926 ) ( not ( = ?auto_1808925 ?auto_1808926 ) ) ( TRUCK-AT ?auto_1808929 ?auto_1808927 ) ( AVAILABLE ?auto_1808928 ) ( IN ?auto_1808926 ?auto_1808929 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1808928 ?auto_1808926 ?auto_1808929 ?auto_1808927 )
      ( MAKE-1CRATE ?auto_1808925 ?auto_1808926 )
      ( MAKE-1CRATE-VERIFY ?auto_1808925 ?auto_1808926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808930 - SURFACE
      ?auto_1808931 - SURFACE
    )
    :vars
    (
      ?auto_1808934 - HOIST
      ?auto_1808932 - PLACE
      ?auto_1808933 - TRUCK
      ?auto_1808935 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808934 ?auto_1808932 ) ( SURFACE-AT ?auto_1808930 ?auto_1808932 ) ( CLEAR ?auto_1808930 ) ( IS-CRATE ?auto_1808931 ) ( not ( = ?auto_1808930 ?auto_1808931 ) ) ( AVAILABLE ?auto_1808934 ) ( IN ?auto_1808931 ?auto_1808933 ) ( TRUCK-AT ?auto_1808933 ?auto_1808935 ) ( not ( = ?auto_1808935 ?auto_1808932 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1808933 ?auto_1808935 ?auto_1808932 )
      ( MAKE-1CRATE ?auto_1808930 ?auto_1808931 )
      ( MAKE-1CRATE-VERIFY ?auto_1808930 ?auto_1808931 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808936 - SURFACE
      ?auto_1808937 - SURFACE
    )
    :vars
    (
      ?auto_1808940 - HOIST
      ?auto_1808941 - PLACE
      ?auto_1808938 - TRUCK
      ?auto_1808939 - PLACE
      ?auto_1808942 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808940 ?auto_1808941 ) ( SURFACE-AT ?auto_1808936 ?auto_1808941 ) ( CLEAR ?auto_1808936 ) ( IS-CRATE ?auto_1808937 ) ( not ( = ?auto_1808936 ?auto_1808937 ) ) ( AVAILABLE ?auto_1808940 ) ( TRUCK-AT ?auto_1808938 ?auto_1808939 ) ( not ( = ?auto_1808939 ?auto_1808941 ) ) ( HOIST-AT ?auto_1808942 ?auto_1808939 ) ( LIFTING ?auto_1808942 ?auto_1808937 ) ( not ( = ?auto_1808940 ?auto_1808942 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1808942 ?auto_1808937 ?auto_1808938 ?auto_1808939 )
      ( MAKE-1CRATE ?auto_1808936 ?auto_1808937 )
      ( MAKE-1CRATE-VERIFY ?auto_1808936 ?auto_1808937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808943 - SURFACE
      ?auto_1808944 - SURFACE
    )
    :vars
    (
      ?auto_1808948 - HOIST
      ?auto_1808947 - PLACE
      ?auto_1808946 - TRUCK
      ?auto_1808945 - PLACE
      ?auto_1808949 - HOIST
      ?auto_1808950 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808948 ?auto_1808947 ) ( SURFACE-AT ?auto_1808943 ?auto_1808947 ) ( CLEAR ?auto_1808943 ) ( IS-CRATE ?auto_1808944 ) ( not ( = ?auto_1808943 ?auto_1808944 ) ) ( AVAILABLE ?auto_1808948 ) ( TRUCK-AT ?auto_1808946 ?auto_1808945 ) ( not ( = ?auto_1808945 ?auto_1808947 ) ) ( HOIST-AT ?auto_1808949 ?auto_1808945 ) ( not ( = ?auto_1808948 ?auto_1808949 ) ) ( AVAILABLE ?auto_1808949 ) ( SURFACE-AT ?auto_1808944 ?auto_1808945 ) ( ON ?auto_1808944 ?auto_1808950 ) ( CLEAR ?auto_1808944 ) ( not ( = ?auto_1808943 ?auto_1808950 ) ) ( not ( = ?auto_1808944 ?auto_1808950 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1808949 ?auto_1808944 ?auto_1808950 ?auto_1808945 )
      ( MAKE-1CRATE ?auto_1808943 ?auto_1808944 )
      ( MAKE-1CRATE-VERIFY ?auto_1808943 ?auto_1808944 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808951 - SURFACE
      ?auto_1808952 - SURFACE
    )
    :vars
    (
      ?auto_1808957 - HOIST
      ?auto_1808958 - PLACE
      ?auto_1808956 - PLACE
      ?auto_1808955 - HOIST
      ?auto_1808954 - SURFACE
      ?auto_1808953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808957 ?auto_1808958 ) ( SURFACE-AT ?auto_1808951 ?auto_1808958 ) ( CLEAR ?auto_1808951 ) ( IS-CRATE ?auto_1808952 ) ( not ( = ?auto_1808951 ?auto_1808952 ) ) ( AVAILABLE ?auto_1808957 ) ( not ( = ?auto_1808956 ?auto_1808958 ) ) ( HOIST-AT ?auto_1808955 ?auto_1808956 ) ( not ( = ?auto_1808957 ?auto_1808955 ) ) ( AVAILABLE ?auto_1808955 ) ( SURFACE-AT ?auto_1808952 ?auto_1808956 ) ( ON ?auto_1808952 ?auto_1808954 ) ( CLEAR ?auto_1808952 ) ( not ( = ?auto_1808951 ?auto_1808954 ) ) ( not ( = ?auto_1808952 ?auto_1808954 ) ) ( TRUCK-AT ?auto_1808953 ?auto_1808958 ) )
    :subtasks
    ( ( !DRIVE ?auto_1808953 ?auto_1808958 ?auto_1808956 )
      ( MAKE-1CRATE ?auto_1808951 ?auto_1808952 )
      ( MAKE-1CRATE-VERIFY ?auto_1808951 ?auto_1808952 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1808968 - SURFACE
      ?auto_1808969 - SURFACE
      ?auto_1808970 - SURFACE
    )
    :vars
    (
      ?auto_1808971 - HOIST
      ?auto_1808972 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808971 ?auto_1808972 ) ( SURFACE-AT ?auto_1808969 ?auto_1808972 ) ( CLEAR ?auto_1808969 ) ( LIFTING ?auto_1808971 ?auto_1808970 ) ( IS-CRATE ?auto_1808970 ) ( not ( = ?auto_1808969 ?auto_1808970 ) ) ( ON ?auto_1808969 ?auto_1808968 ) ( not ( = ?auto_1808968 ?auto_1808969 ) ) ( not ( = ?auto_1808968 ?auto_1808970 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808969 ?auto_1808970 )
      ( MAKE-2CRATE-VERIFY ?auto_1808968 ?auto_1808969 ?auto_1808970 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1808978 - SURFACE
      ?auto_1808979 - SURFACE
      ?auto_1808980 - SURFACE
    )
    :vars
    (
      ?auto_1808982 - HOIST
      ?auto_1808983 - PLACE
      ?auto_1808981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808982 ?auto_1808983 ) ( SURFACE-AT ?auto_1808979 ?auto_1808983 ) ( CLEAR ?auto_1808979 ) ( IS-CRATE ?auto_1808980 ) ( not ( = ?auto_1808979 ?auto_1808980 ) ) ( TRUCK-AT ?auto_1808981 ?auto_1808983 ) ( AVAILABLE ?auto_1808982 ) ( IN ?auto_1808980 ?auto_1808981 ) ( ON ?auto_1808979 ?auto_1808978 ) ( not ( = ?auto_1808978 ?auto_1808979 ) ) ( not ( = ?auto_1808978 ?auto_1808980 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808979 ?auto_1808980 )
      ( MAKE-2CRATE-VERIFY ?auto_1808978 ?auto_1808979 ?auto_1808980 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808984 - SURFACE
      ?auto_1808985 - SURFACE
    )
    :vars
    (
      ?auto_1808987 - HOIST
      ?auto_1808989 - PLACE
      ?auto_1808988 - TRUCK
      ?auto_1808986 - SURFACE
      ?auto_1808990 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808987 ?auto_1808989 ) ( SURFACE-AT ?auto_1808984 ?auto_1808989 ) ( CLEAR ?auto_1808984 ) ( IS-CRATE ?auto_1808985 ) ( not ( = ?auto_1808984 ?auto_1808985 ) ) ( AVAILABLE ?auto_1808987 ) ( IN ?auto_1808985 ?auto_1808988 ) ( ON ?auto_1808984 ?auto_1808986 ) ( not ( = ?auto_1808986 ?auto_1808984 ) ) ( not ( = ?auto_1808986 ?auto_1808985 ) ) ( TRUCK-AT ?auto_1808988 ?auto_1808990 ) ( not ( = ?auto_1808990 ?auto_1808989 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1808988 ?auto_1808990 ?auto_1808989 )
      ( MAKE-2CRATE ?auto_1808986 ?auto_1808984 ?auto_1808985 )
      ( MAKE-1CRATE-VERIFY ?auto_1808984 ?auto_1808985 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1808991 - SURFACE
      ?auto_1808992 - SURFACE
      ?auto_1808993 - SURFACE
    )
    :vars
    (
      ?auto_1808997 - HOIST
      ?auto_1808995 - PLACE
      ?auto_1808994 - TRUCK
      ?auto_1808996 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808997 ?auto_1808995 ) ( SURFACE-AT ?auto_1808992 ?auto_1808995 ) ( CLEAR ?auto_1808992 ) ( IS-CRATE ?auto_1808993 ) ( not ( = ?auto_1808992 ?auto_1808993 ) ) ( AVAILABLE ?auto_1808997 ) ( IN ?auto_1808993 ?auto_1808994 ) ( ON ?auto_1808992 ?auto_1808991 ) ( not ( = ?auto_1808991 ?auto_1808992 ) ) ( not ( = ?auto_1808991 ?auto_1808993 ) ) ( TRUCK-AT ?auto_1808994 ?auto_1808996 ) ( not ( = ?auto_1808996 ?auto_1808995 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808992 ?auto_1808993 )
      ( MAKE-2CRATE-VERIFY ?auto_1808991 ?auto_1808992 ?auto_1808993 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808998 - SURFACE
      ?auto_1808999 - SURFACE
    )
    :vars
    (
      ?auto_1809003 - HOIST
      ?auto_1809004 - PLACE
      ?auto_1809002 - SURFACE
      ?auto_1809000 - TRUCK
      ?auto_1809001 - PLACE
      ?auto_1809005 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809003 ?auto_1809004 ) ( SURFACE-AT ?auto_1808998 ?auto_1809004 ) ( CLEAR ?auto_1808998 ) ( IS-CRATE ?auto_1808999 ) ( not ( = ?auto_1808998 ?auto_1808999 ) ) ( AVAILABLE ?auto_1809003 ) ( ON ?auto_1808998 ?auto_1809002 ) ( not ( = ?auto_1809002 ?auto_1808998 ) ) ( not ( = ?auto_1809002 ?auto_1808999 ) ) ( TRUCK-AT ?auto_1809000 ?auto_1809001 ) ( not ( = ?auto_1809001 ?auto_1809004 ) ) ( HOIST-AT ?auto_1809005 ?auto_1809001 ) ( LIFTING ?auto_1809005 ?auto_1808999 ) ( not ( = ?auto_1809003 ?auto_1809005 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1809005 ?auto_1808999 ?auto_1809000 ?auto_1809001 )
      ( MAKE-2CRATE ?auto_1809002 ?auto_1808998 ?auto_1808999 )
      ( MAKE-1CRATE-VERIFY ?auto_1808998 ?auto_1808999 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809006 - SURFACE
      ?auto_1809007 - SURFACE
      ?auto_1809008 - SURFACE
    )
    :vars
    (
      ?auto_1809010 - HOIST
      ?auto_1809009 - PLACE
      ?auto_1809011 - TRUCK
      ?auto_1809013 - PLACE
      ?auto_1809012 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809010 ?auto_1809009 ) ( SURFACE-AT ?auto_1809007 ?auto_1809009 ) ( CLEAR ?auto_1809007 ) ( IS-CRATE ?auto_1809008 ) ( not ( = ?auto_1809007 ?auto_1809008 ) ) ( AVAILABLE ?auto_1809010 ) ( ON ?auto_1809007 ?auto_1809006 ) ( not ( = ?auto_1809006 ?auto_1809007 ) ) ( not ( = ?auto_1809006 ?auto_1809008 ) ) ( TRUCK-AT ?auto_1809011 ?auto_1809013 ) ( not ( = ?auto_1809013 ?auto_1809009 ) ) ( HOIST-AT ?auto_1809012 ?auto_1809013 ) ( LIFTING ?auto_1809012 ?auto_1809008 ) ( not ( = ?auto_1809010 ?auto_1809012 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809007 ?auto_1809008 )
      ( MAKE-2CRATE-VERIFY ?auto_1809006 ?auto_1809007 ?auto_1809008 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809014 - SURFACE
      ?auto_1809015 - SURFACE
    )
    :vars
    (
      ?auto_1809018 - HOIST
      ?auto_1809019 - PLACE
      ?auto_1809016 - SURFACE
      ?auto_1809020 - TRUCK
      ?auto_1809021 - PLACE
      ?auto_1809017 - HOIST
      ?auto_1809022 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809018 ?auto_1809019 ) ( SURFACE-AT ?auto_1809014 ?auto_1809019 ) ( CLEAR ?auto_1809014 ) ( IS-CRATE ?auto_1809015 ) ( not ( = ?auto_1809014 ?auto_1809015 ) ) ( AVAILABLE ?auto_1809018 ) ( ON ?auto_1809014 ?auto_1809016 ) ( not ( = ?auto_1809016 ?auto_1809014 ) ) ( not ( = ?auto_1809016 ?auto_1809015 ) ) ( TRUCK-AT ?auto_1809020 ?auto_1809021 ) ( not ( = ?auto_1809021 ?auto_1809019 ) ) ( HOIST-AT ?auto_1809017 ?auto_1809021 ) ( not ( = ?auto_1809018 ?auto_1809017 ) ) ( AVAILABLE ?auto_1809017 ) ( SURFACE-AT ?auto_1809015 ?auto_1809021 ) ( ON ?auto_1809015 ?auto_1809022 ) ( CLEAR ?auto_1809015 ) ( not ( = ?auto_1809014 ?auto_1809022 ) ) ( not ( = ?auto_1809015 ?auto_1809022 ) ) ( not ( = ?auto_1809016 ?auto_1809022 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1809017 ?auto_1809015 ?auto_1809022 ?auto_1809021 )
      ( MAKE-2CRATE ?auto_1809016 ?auto_1809014 ?auto_1809015 )
      ( MAKE-1CRATE-VERIFY ?auto_1809014 ?auto_1809015 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809023 - SURFACE
      ?auto_1809024 - SURFACE
      ?auto_1809025 - SURFACE
    )
    :vars
    (
      ?auto_1809030 - HOIST
      ?auto_1809031 - PLACE
      ?auto_1809027 - TRUCK
      ?auto_1809029 - PLACE
      ?auto_1809026 - HOIST
      ?auto_1809028 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809030 ?auto_1809031 ) ( SURFACE-AT ?auto_1809024 ?auto_1809031 ) ( CLEAR ?auto_1809024 ) ( IS-CRATE ?auto_1809025 ) ( not ( = ?auto_1809024 ?auto_1809025 ) ) ( AVAILABLE ?auto_1809030 ) ( ON ?auto_1809024 ?auto_1809023 ) ( not ( = ?auto_1809023 ?auto_1809024 ) ) ( not ( = ?auto_1809023 ?auto_1809025 ) ) ( TRUCK-AT ?auto_1809027 ?auto_1809029 ) ( not ( = ?auto_1809029 ?auto_1809031 ) ) ( HOIST-AT ?auto_1809026 ?auto_1809029 ) ( not ( = ?auto_1809030 ?auto_1809026 ) ) ( AVAILABLE ?auto_1809026 ) ( SURFACE-AT ?auto_1809025 ?auto_1809029 ) ( ON ?auto_1809025 ?auto_1809028 ) ( CLEAR ?auto_1809025 ) ( not ( = ?auto_1809024 ?auto_1809028 ) ) ( not ( = ?auto_1809025 ?auto_1809028 ) ) ( not ( = ?auto_1809023 ?auto_1809028 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809024 ?auto_1809025 )
      ( MAKE-2CRATE-VERIFY ?auto_1809023 ?auto_1809024 ?auto_1809025 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809032 - SURFACE
      ?auto_1809033 - SURFACE
    )
    :vars
    (
      ?auto_1809040 - HOIST
      ?auto_1809038 - PLACE
      ?auto_1809035 - SURFACE
      ?auto_1809036 - PLACE
      ?auto_1809034 - HOIST
      ?auto_1809039 - SURFACE
      ?auto_1809037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809040 ?auto_1809038 ) ( SURFACE-AT ?auto_1809032 ?auto_1809038 ) ( CLEAR ?auto_1809032 ) ( IS-CRATE ?auto_1809033 ) ( not ( = ?auto_1809032 ?auto_1809033 ) ) ( AVAILABLE ?auto_1809040 ) ( ON ?auto_1809032 ?auto_1809035 ) ( not ( = ?auto_1809035 ?auto_1809032 ) ) ( not ( = ?auto_1809035 ?auto_1809033 ) ) ( not ( = ?auto_1809036 ?auto_1809038 ) ) ( HOIST-AT ?auto_1809034 ?auto_1809036 ) ( not ( = ?auto_1809040 ?auto_1809034 ) ) ( AVAILABLE ?auto_1809034 ) ( SURFACE-AT ?auto_1809033 ?auto_1809036 ) ( ON ?auto_1809033 ?auto_1809039 ) ( CLEAR ?auto_1809033 ) ( not ( = ?auto_1809032 ?auto_1809039 ) ) ( not ( = ?auto_1809033 ?auto_1809039 ) ) ( not ( = ?auto_1809035 ?auto_1809039 ) ) ( TRUCK-AT ?auto_1809037 ?auto_1809038 ) )
    :subtasks
    ( ( !DRIVE ?auto_1809037 ?auto_1809038 ?auto_1809036 )
      ( MAKE-2CRATE ?auto_1809035 ?auto_1809032 ?auto_1809033 )
      ( MAKE-1CRATE-VERIFY ?auto_1809032 ?auto_1809033 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809041 - SURFACE
      ?auto_1809042 - SURFACE
      ?auto_1809043 - SURFACE
    )
    :vars
    (
      ?auto_1809045 - HOIST
      ?auto_1809044 - PLACE
      ?auto_1809049 - PLACE
      ?auto_1809048 - HOIST
      ?auto_1809047 - SURFACE
      ?auto_1809046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809045 ?auto_1809044 ) ( SURFACE-AT ?auto_1809042 ?auto_1809044 ) ( CLEAR ?auto_1809042 ) ( IS-CRATE ?auto_1809043 ) ( not ( = ?auto_1809042 ?auto_1809043 ) ) ( AVAILABLE ?auto_1809045 ) ( ON ?auto_1809042 ?auto_1809041 ) ( not ( = ?auto_1809041 ?auto_1809042 ) ) ( not ( = ?auto_1809041 ?auto_1809043 ) ) ( not ( = ?auto_1809049 ?auto_1809044 ) ) ( HOIST-AT ?auto_1809048 ?auto_1809049 ) ( not ( = ?auto_1809045 ?auto_1809048 ) ) ( AVAILABLE ?auto_1809048 ) ( SURFACE-AT ?auto_1809043 ?auto_1809049 ) ( ON ?auto_1809043 ?auto_1809047 ) ( CLEAR ?auto_1809043 ) ( not ( = ?auto_1809042 ?auto_1809047 ) ) ( not ( = ?auto_1809043 ?auto_1809047 ) ) ( not ( = ?auto_1809041 ?auto_1809047 ) ) ( TRUCK-AT ?auto_1809046 ?auto_1809044 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809042 ?auto_1809043 )
      ( MAKE-2CRATE-VERIFY ?auto_1809041 ?auto_1809042 ?auto_1809043 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809050 - SURFACE
      ?auto_1809051 - SURFACE
    )
    :vars
    (
      ?auto_1809056 - HOIST
      ?auto_1809053 - PLACE
      ?auto_1809052 - SURFACE
      ?auto_1809057 - PLACE
      ?auto_1809054 - HOIST
      ?auto_1809058 - SURFACE
      ?auto_1809055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809056 ?auto_1809053 ) ( IS-CRATE ?auto_1809051 ) ( not ( = ?auto_1809050 ?auto_1809051 ) ) ( not ( = ?auto_1809052 ?auto_1809050 ) ) ( not ( = ?auto_1809052 ?auto_1809051 ) ) ( not ( = ?auto_1809057 ?auto_1809053 ) ) ( HOIST-AT ?auto_1809054 ?auto_1809057 ) ( not ( = ?auto_1809056 ?auto_1809054 ) ) ( AVAILABLE ?auto_1809054 ) ( SURFACE-AT ?auto_1809051 ?auto_1809057 ) ( ON ?auto_1809051 ?auto_1809058 ) ( CLEAR ?auto_1809051 ) ( not ( = ?auto_1809050 ?auto_1809058 ) ) ( not ( = ?auto_1809051 ?auto_1809058 ) ) ( not ( = ?auto_1809052 ?auto_1809058 ) ) ( TRUCK-AT ?auto_1809055 ?auto_1809053 ) ( SURFACE-AT ?auto_1809052 ?auto_1809053 ) ( CLEAR ?auto_1809052 ) ( LIFTING ?auto_1809056 ?auto_1809050 ) ( IS-CRATE ?auto_1809050 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809052 ?auto_1809050 )
      ( MAKE-2CRATE ?auto_1809052 ?auto_1809050 ?auto_1809051 )
      ( MAKE-1CRATE-VERIFY ?auto_1809050 ?auto_1809051 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809059 - SURFACE
      ?auto_1809060 - SURFACE
      ?auto_1809061 - SURFACE
    )
    :vars
    (
      ?auto_1809063 - HOIST
      ?auto_1809064 - PLACE
      ?auto_1809062 - PLACE
      ?auto_1809065 - HOIST
      ?auto_1809067 - SURFACE
      ?auto_1809066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809063 ?auto_1809064 ) ( IS-CRATE ?auto_1809061 ) ( not ( = ?auto_1809060 ?auto_1809061 ) ) ( not ( = ?auto_1809059 ?auto_1809060 ) ) ( not ( = ?auto_1809059 ?auto_1809061 ) ) ( not ( = ?auto_1809062 ?auto_1809064 ) ) ( HOIST-AT ?auto_1809065 ?auto_1809062 ) ( not ( = ?auto_1809063 ?auto_1809065 ) ) ( AVAILABLE ?auto_1809065 ) ( SURFACE-AT ?auto_1809061 ?auto_1809062 ) ( ON ?auto_1809061 ?auto_1809067 ) ( CLEAR ?auto_1809061 ) ( not ( = ?auto_1809060 ?auto_1809067 ) ) ( not ( = ?auto_1809061 ?auto_1809067 ) ) ( not ( = ?auto_1809059 ?auto_1809067 ) ) ( TRUCK-AT ?auto_1809066 ?auto_1809064 ) ( SURFACE-AT ?auto_1809059 ?auto_1809064 ) ( CLEAR ?auto_1809059 ) ( LIFTING ?auto_1809063 ?auto_1809060 ) ( IS-CRATE ?auto_1809060 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809060 ?auto_1809061 )
      ( MAKE-2CRATE-VERIFY ?auto_1809059 ?auto_1809060 ?auto_1809061 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809068 - SURFACE
      ?auto_1809069 - SURFACE
    )
    :vars
    (
      ?auto_1809076 - HOIST
      ?auto_1809071 - PLACE
      ?auto_1809073 - SURFACE
      ?auto_1809075 - PLACE
      ?auto_1809074 - HOIST
      ?auto_1809070 - SURFACE
      ?auto_1809072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809076 ?auto_1809071 ) ( IS-CRATE ?auto_1809069 ) ( not ( = ?auto_1809068 ?auto_1809069 ) ) ( not ( = ?auto_1809073 ?auto_1809068 ) ) ( not ( = ?auto_1809073 ?auto_1809069 ) ) ( not ( = ?auto_1809075 ?auto_1809071 ) ) ( HOIST-AT ?auto_1809074 ?auto_1809075 ) ( not ( = ?auto_1809076 ?auto_1809074 ) ) ( AVAILABLE ?auto_1809074 ) ( SURFACE-AT ?auto_1809069 ?auto_1809075 ) ( ON ?auto_1809069 ?auto_1809070 ) ( CLEAR ?auto_1809069 ) ( not ( = ?auto_1809068 ?auto_1809070 ) ) ( not ( = ?auto_1809069 ?auto_1809070 ) ) ( not ( = ?auto_1809073 ?auto_1809070 ) ) ( TRUCK-AT ?auto_1809072 ?auto_1809071 ) ( SURFACE-AT ?auto_1809073 ?auto_1809071 ) ( CLEAR ?auto_1809073 ) ( IS-CRATE ?auto_1809068 ) ( AVAILABLE ?auto_1809076 ) ( IN ?auto_1809068 ?auto_1809072 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1809076 ?auto_1809068 ?auto_1809072 ?auto_1809071 )
      ( MAKE-2CRATE ?auto_1809073 ?auto_1809068 ?auto_1809069 )
      ( MAKE-1CRATE-VERIFY ?auto_1809068 ?auto_1809069 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1809077 - SURFACE
      ?auto_1809078 - SURFACE
      ?auto_1809079 - SURFACE
    )
    :vars
    (
      ?auto_1809085 - HOIST
      ?auto_1809084 - PLACE
      ?auto_1809082 - PLACE
      ?auto_1809081 - HOIST
      ?auto_1809080 - SURFACE
      ?auto_1809083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809085 ?auto_1809084 ) ( IS-CRATE ?auto_1809079 ) ( not ( = ?auto_1809078 ?auto_1809079 ) ) ( not ( = ?auto_1809077 ?auto_1809078 ) ) ( not ( = ?auto_1809077 ?auto_1809079 ) ) ( not ( = ?auto_1809082 ?auto_1809084 ) ) ( HOIST-AT ?auto_1809081 ?auto_1809082 ) ( not ( = ?auto_1809085 ?auto_1809081 ) ) ( AVAILABLE ?auto_1809081 ) ( SURFACE-AT ?auto_1809079 ?auto_1809082 ) ( ON ?auto_1809079 ?auto_1809080 ) ( CLEAR ?auto_1809079 ) ( not ( = ?auto_1809078 ?auto_1809080 ) ) ( not ( = ?auto_1809079 ?auto_1809080 ) ) ( not ( = ?auto_1809077 ?auto_1809080 ) ) ( TRUCK-AT ?auto_1809083 ?auto_1809084 ) ( SURFACE-AT ?auto_1809077 ?auto_1809084 ) ( CLEAR ?auto_1809077 ) ( IS-CRATE ?auto_1809078 ) ( AVAILABLE ?auto_1809085 ) ( IN ?auto_1809078 ?auto_1809083 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809078 ?auto_1809079 )
      ( MAKE-2CRATE-VERIFY ?auto_1809077 ?auto_1809078 ?auto_1809079 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1809122 - SURFACE
      ?auto_1809123 - SURFACE
    )
    :vars
    (
      ?auto_1809129 - HOIST
      ?auto_1809124 - PLACE
      ?auto_1809128 - SURFACE
      ?auto_1809130 - PLACE
      ?auto_1809127 - HOIST
      ?auto_1809125 - SURFACE
      ?auto_1809126 - TRUCK
      ?auto_1809131 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809129 ?auto_1809124 ) ( SURFACE-AT ?auto_1809122 ?auto_1809124 ) ( CLEAR ?auto_1809122 ) ( IS-CRATE ?auto_1809123 ) ( not ( = ?auto_1809122 ?auto_1809123 ) ) ( AVAILABLE ?auto_1809129 ) ( ON ?auto_1809122 ?auto_1809128 ) ( not ( = ?auto_1809128 ?auto_1809122 ) ) ( not ( = ?auto_1809128 ?auto_1809123 ) ) ( not ( = ?auto_1809130 ?auto_1809124 ) ) ( HOIST-AT ?auto_1809127 ?auto_1809130 ) ( not ( = ?auto_1809129 ?auto_1809127 ) ) ( AVAILABLE ?auto_1809127 ) ( SURFACE-AT ?auto_1809123 ?auto_1809130 ) ( ON ?auto_1809123 ?auto_1809125 ) ( CLEAR ?auto_1809123 ) ( not ( = ?auto_1809122 ?auto_1809125 ) ) ( not ( = ?auto_1809123 ?auto_1809125 ) ) ( not ( = ?auto_1809128 ?auto_1809125 ) ) ( TRUCK-AT ?auto_1809126 ?auto_1809131 ) ( not ( = ?auto_1809131 ?auto_1809124 ) ) ( not ( = ?auto_1809130 ?auto_1809131 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1809126 ?auto_1809131 ?auto_1809124 )
      ( MAKE-1CRATE ?auto_1809122 ?auto_1809123 )
      ( MAKE-1CRATE-VERIFY ?auto_1809122 ?auto_1809123 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809161 - SURFACE
      ?auto_1809162 - SURFACE
      ?auto_1809163 - SURFACE
      ?auto_1809164 - SURFACE
    )
    :vars
    (
      ?auto_1809165 - HOIST
      ?auto_1809166 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809165 ?auto_1809166 ) ( SURFACE-AT ?auto_1809163 ?auto_1809166 ) ( CLEAR ?auto_1809163 ) ( LIFTING ?auto_1809165 ?auto_1809164 ) ( IS-CRATE ?auto_1809164 ) ( not ( = ?auto_1809163 ?auto_1809164 ) ) ( ON ?auto_1809162 ?auto_1809161 ) ( ON ?auto_1809163 ?auto_1809162 ) ( not ( = ?auto_1809161 ?auto_1809162 ) ) ( not ( = ?auto_1809161 ?auto_1809163 ) ) ( not ( = ?auto_1809161 ?auto_1809164 ) ) ( not ( = ?auto_1809162 ?auto_1809163 ) ) ( not ( = ?auto_1809162 ?auto_1809164 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809163 ?auto_1809164 )
      ( MAKE-3CRATE-VERIFY ?auto_1809161 ?auto_1809162 ?auto_1809163 ?auto_1809164 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809178 - SURFACE
      ?auto_1809179 - SURFACE
      ?auto_1809180 - SURFACE
      ?auto_1809181 - SURFACE
    )
    :vars
    (
      ?auto_1809182 - HOIST
      ?auto_1809184 - PLACE
      ?auto_1809183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809182 ?auto_1809184 ) ( SURFACE-AT ?auto_1809180 ?auto_1809184 ) ( CLEAR ?auto_1809180 ) ( IS-CRATE ?auto_1809181 ) ( not ( = ?auto_1809180 ?auto_1809181 ) ) ( TRUCK-AT ?auto_1809183 ?auto_1809184 ) ( AVAILABLE ?auto_1809182 ) ( IN ?auto_1809181 ?auto_1809183 ) ( ON ?auto_1809180 ?auto_1809179 ) ( not ( = ?auto_1809179 ?auto_1809180 ) ) ( not ( = ?auto_1809179 ?auto_1809181 ) ) ( ON ?auto_1809179 ?auto_1809178 ) ( not ( = ?auto_1809178 ?auto_1809179 ) ) ( not ( = ?auto_1809178 ?auto_1809180 ) ) ( not ( = ?auto_1809178 ?auto_1809181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809179 ?auto_1809180 ?auto_1809181 )
      ( MAKE-3CRATE-VERIFY ?auto_1809178 ?auto_1809179 ?auto_1809180 ?auto_1809181 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809199 - SURFACE
      ?auto_1809200 - SURFACE
      ?auto_1809201 - SURFACE
      ?auto_1809202 - SURFACE
    )
    :vars
    (
      ?auto_1809203 - HOIST
      ?auto_1809205 - PLACE
      ?auto_1809206 - TRUCK
      ?auto_1809204 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809203 ?auto_1809205 ) ( SURFACE-AT ?auto_1809201 ?auto_1809205 ) ( CLEAR ?auto_1809201 ) ( IS-CRATE ?auto_1809202 ) ( not ( = ?auto_1809201 ?auto_1809202 ) ) ( AVAILABLE ?auto_1809203 ) ( IN ?auto_1809202 ?auto_1809206 ) ( ON ?auto_1809201 ?auto_1809200 ) ( not ( = ?auto_1809200 ?auto_1809201 ) ) ( not ( = ?auto_1809200 ?auto_1809202 ) ) ( TRUCK-AT ?auto_1809206 ?auto_1809204 ) ( not ( = ?auto_1809204 ?auto_1809205 ) ) ( ON ?auto_1809200 ?auto_1809199 ) ( not ( = ?auto_1809199 ?auto_1809200 ) ) ( not ( = ?auto_1809199 ?auto_1809201 ) ) ( not ( = ?auto_1809199 ?auto_1809202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809200 ?auto_1809201 ?auto_1809202 )
      ( MAKE-3CRATE-VERIFY ?auto_1809199 ?auto_1809200 ?auto_1809201 ?auto_1809202 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809223 - SURFACE
      ?auto_1809224 - SURFACE
      ?auto_1809225 - SURFACE
      ?auto_1809226 - SURFACE
    )
    :vars
    (
      ?auto_1809229 - HOIST
      ?auto_1809230 - PLACE
      ?auto_1809227 - TRUCK
      ?auto_1809228 - PLACE
      ?auto_1809231 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809229 ?auto_1809230 ) ( SURFACE-AT ?auto_1809225 ?auto_1809230 ) ( CLEAR ?auto_1809225 ) ( IS-CRATE ?auto_1809226 ) ( not ( = ?auto_1809225 ?auto_1809226 ) ) ( AVAILABLE ?auto_1809229 ) ( ON ?auto_1809225 ?auto_1809224 ) ( not ( = ?auto_1809224 ?auto_1809225 ) ) ( not ( = ?auto_1809224 ?auto_1809226 ) ) ( TRUCK-AT ?auto_1809227 ?auto_1809228 ) ( not ( = ?auto_1809228 ?auto_1809230 ) ) ( HOIST-AT ?auto_1809231 ?auto_1809228 ) ( LIFTING ?auto_1809231 ?auto_1809226 ) ( not ( = ?auto_1809229 ?auto_1809231 ) ) ( ON ?auto_1809224 ?auto_1809223 ) ( not ( = ?auto_1809223 ?auto_1809224 ) ) ( not ( = ?auto_1809223 ?auto_1809225 ) ) ( not ( = ?auto_1809223 ?auto_1809226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809224 ?auto_1809225 ?auto_1809226 )
      ( MAKE-3CRATE-VERIFY ?auto_1809223 ?auto_1809224 ?auto_1809225 ?auto_1809226 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809250 - SURFACE
      ?auto_1809251 - SURFACE
      ?auto_1809252 - SURFACE
      ?auto_1809253 - SURFACE
    )
    :vars
    (
      ?auto_1809254 - HOIST
      ?auto_1809257 - PLACE
      ?auto_1809258 - TRUCK
      ?auto_1809256 - PLACE
      ?auto_1809255 - HOIST
      ?auto_1809259 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809254 ?auto_1809257 ) ( SURFACE-AT ?auto_1809252 ?auto_1809257 ) ( CLEAR ?auto_1809252 ) ( IS-CRATE ?auto_1809253 ) ( not ( = ?auto_1809252 ?auto_1809253 ) ) ( AVAILABLE ?auto_1809254 ) ( ON ?auto_1809252 ?auto_1809251 ) ( not ( = ?auto_1809251 ?auto_1809252 ) ) ( not ( = ?auto_1809251 ?auto_1809253 ) ) ( TRUCK-AT ?auto_1809258 ?auto_1809256 ) ( not ( = ?auto_1809256 ?auto_1809257 ) ) ( HOIST-AT ?auto_1809255 ?auto_1809256 ) ( not ( = ?auto_1809254 ?auto_1809255 ) ) ( AVAILABLE ?auto_1809255 ) ( SURFACE-AT ?auto_1809253 ?auto_1809256 ) ( ON ?auto_1809253 ?auto_1809259 ) ( CLEAR ?auto_1809253 ) ( not ( = ?auto_1809252 ?auto_1809259 ) ) ( not ( = ?auto_1809253 ?auto_1809259 ) ) ( not ( = ?auto_1809251 ?auto_1809259 ) ) ( ON ?auto_1809251 ?auto_1809250 ) ( not ( = ?auto_1809250 ?auto_1809251 ) ) ( not ( = ?auto_1809250 ?auto_1809252 ) ) ( not ( = ?auto_1809250 ?auto_1809253 ) ) ( not ( = ?auto_1809250 ?auto_1809259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809251 ?auto_1809252 ?auto_1809253 )
      ( MAKE-3CRATE-VERIFY ?auto_1809250 ?auto_1809251 ?auto_1809252 ?auto_1809253 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809278 - SURFACE
      ?auto_1809279 - SURFACE
      ?auto_1809280 - SURFACE
      ?auto_1809281 - SURFACE
    )
    :vars
    (
      ?auto_1809284 - HOIST
      ?auto_1809282 - PLACE
      ?auto_1809285 - PLACE
      ?auto_1809286 - HOIST
      ?auto_1809283 - SURFACE
      ?auto_1809287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809284 ?auto_1809282 ) ( SURFACE-AT ?auto_1809280 ?auto_1809282 ) ( CLEAR ?auto_1809280 ) ( IS-CRATE ?auto_1809281 ) ( not ( = ?auto_1809280 ?auto_1809281 ) ) ( AVAILABLE ?auto_1809284 ) ( ON ?auto_1809280 ?auto_1809279 ) ( not ( = ?auto_1809279 ?auto_1809280 ) ) ( not ( = ?auto_1809279 ?auto_1809281 ) ) ( not ( = ?auto_1809285 ?auto_1809282 ) ) ( HOIST-AT ?auto_1809286 ?auto_1809285 ) ( not ( = ?auto_1809284 ?auto_1809286 ) ) ( AVAILABLE ?auto_1809286 ) ( SURFACE-AT ?auto_1809281 ?auto_1809285 ) ( ON ?auto_1809281 ?auto_1809283 ) ( CLEAR ?auto_1809281 ) ( not ( = ?auto_1809280 ?auto_1809283 ) ) ( not ( = ?auto_1809281 ?auto_1809283 ) ) ( not ( = ?auto_1809279 ?auto_1809283 ) ) ( TRUCK-AT ?auto_1809287 ?auto_1809282 ) ( ON ?auto_1809279 ?auto_1809278 ) ( not ( = ?auto_1809278 ?auto_1809279 ) ) ( not ( = ?auto_1809278 ?auto_1809280 ) ) ( not ( = ?auto_1809278 ?auto_1809281 ) ) ( not ( = ?auto_1809278 ?auto_1809283 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809279 ?auto_1809280 ?auto_1809281 )
      ( MAKE-3CRATE-VERIFY ?auto_1809278 ?auto_1809279 ?auto_1809280 ?auto_1809281 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809306 - SURFACE
      ?auto_1809307 - SURFACE
      ?auto_1809308 - SURFACE
      ?auto_1809309 - SURFACE
    )
    :vars
    (
      ?auto_1809313 - HOIST
      ?auto_1809310 - PLACE
      ?auto_1809315 - PLACE
      ?auto_1809311 - HOIST
      ?auto_1809312 - SURFACE
      ?auto_1809314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809313 ?auto_1809310 ) ( IS-CRATE ?auto_1809309 ) ( not ( = ?auto_1809308 ?auto_1809309 ) ) ( not ( = ?auto_1809307 ?auto_1809308 ) ) ( not ( = ?auto_1809307 ?auto_1809309 ) ) ( not ( = ?auto_1809315 ?auto_1809310 ) ) ( HOIST-AT ?auto_1809311 ?auto_1809315 ) ( not ( = ?auto_1809313 ?auto_1809311 ) ) ( AVAILABLE ?auto_1809311 ) ( SURFACE-AT ?auto_1809309 ?auto_1809315 ) ( ON ?auto_1809309 ?auto_1809312 ) ( CLEAR ?auto_1809309 ) ( not ( = ?auto_1809308 ?auto_1809312 ) ) ( not ( = ?auto_1809309 ?auto_1809312 ) ) ( not ( = ?auto_1809307 ?auto_1809312 ) ) ( TRUCK-AT ?auto_1809314 ?auto_1809310 ) ( SURFACE-AT ?auto_1809307 ?auto_1809310 ) ( CLEAR ?auto_1809307 ) ( LIFTING ?auto_1809313 ?auto_1809308 ) ( IS-CRATE ?auto_1809308 ) ( ON ?auto_1809307 ?auto_1809306 ) ( not ( = ?auto_1809306 ?auto_1809307 ) ) ( not ( = ?auto_1809306 ?auto_1809308 ) ) ( not ( = ?auto_1809306 ?auto_1809309 ) ) ( not ( = ?auto_1809306 ?auto_1809312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809307 ?auto_1809308 ?auto_1809309 )
      ( MAKE-3CRATE-VERIFY ?auto_1809306 ?auto_1809307 ?auto_1809308 ?auto_1809309 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1809334 - SURFACE
      ?auto_1809335 - SURFACE
      ?auto_1809336 - SURFACE
      ?auto_1809337 - SURFACE
    )
    :vars
    (
      ?auto_1809339 - HOIST
      ?auto_1809341 - PLACE
      ?auto_1809343 - PLACE
      ?auto_1809342 - HOIST
      ?auto_1809340 - SURFACE
      ?auto_1809338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809339 ?auto_1809341 ) ( IS-CRATE ?auto_1809337 ) ( not ( = ?auto_1809336 ?auto_1809337 ) ) ( not ( = ?auto_1809335 ?auto_1809336 ) ) ( not ( = ?auto_1809335 ?auto_1809337 ) ) ( not ( = ?auto_1809343 ?auto_1809341 ) ) ( HOIST-AT ?auto_1809342 ?auto_1809343 ) ( not ( = ?auto_1809339 ?auto_1809342 ) ) ( AVAILABLE ?auto_1809342 ) ( SURFACE-AT ?auto_1809337 ?auto_1809343 ) ( ON ?auto_1809337 ?auto_1809340 ) ( CLEAR ?auto_1809337 ) ( not ( = ?auto_1809336 ?auto_1809340 ) ) ( not ( = ?auto_1809337 ?auto_1809340 ) ) ( not ( = ?auto_1809335 ?auto_1809340 ) ) ( TRUCK-AT ?auto_1809338 ?auto_1809341 ) ( SURFACE-AT ?auto_1809335 ?auto_1809341 ) ( CLEAR ?auto_1809335 ) ( IS-CRATE ?auto_1809336 ) ( AVAILABLE ?auto_1809339 ) ( IN ?auto_1809336 ?auto_1809338 ) ( ON ?auto_1809335 ?auto_1809334 ) ( not ( = ?auto_1809334 ?auto_1809335 ) ) ( not ( = ?auto_1809334 ?auto_1809336 ) ) ( not ( = ?auto_1809334 ?auto_1809337 ) ) ( not ( = ?auto_1809334 ?auto_1809340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809335 ?auto_1809336 ?auto_1809337 )
      ( MAKE-3CRATE-VERIFY ?auto_1809334 ?auto_1809335 ?auto_1809336 ?auto_1809337 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809625 - SURFACE
      ?auto_1809626 - SURFACE
      ?auto_1809627 - SURFACE
      ?auto_1809628 - SURFACE
      ?auto_1809629 - SURFACE
    )
    :vars
    (
      ?auto_1809631 - HOIST
      ?auto_1809630 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809631 ?auto_1809630 ) ( SURFACE-AT ?auto_1809628 ?auto_1809630 ) ( CLEAR ?auto_1809628 ) ( LIFTING ?auto_1809631 ?auto_1809629 ) ( IS-CRATE ?auto_1809629 ) ( not ( = ?auto_1809628 ?auto_1809629 ) ) ( ON ?auto_1809626 ?auto_1809625 ) ( ON ?auto_1809627 ?auto_1809626 ) ( ON ?auto_1809628 ?auto_1809627 ) ( not ( = ?auto_1809625 ?auto_1809626 ) ) ( not ( = ?auto_1809625 ?auto_1809627 ) ) ( not ( = ?auto_1809625 ?auto_1809628 ) ) ( not ( = ?auto_1809625 ?auto_1809629 ) ) ( not ( = ?auto_1809626 ?auto_1809627 ) ) ( not ( = ?auto_1809626 ?auto_1809628 ) ) ( not ( = ?auto_1809626 ?auto_1809629 ) ) ( not ( = ?auto_1809627 ?auto_1809628 ) ) ( not ( = ?auto_1809627 ?auto_1809629 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809628 ?auto_1809629 )
      ( MAKE-4CRATE-VERIFY ?auto_1809625 ?auto_1809626 ?auto_1809627 ?auto_1809628 ?auto_1809629 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809650 - SURFACE
      ?auto_1809651 - SURFACE
      ?auto_1809652 - SURFACE
      ?auto_1809653 - SURFACE
      ?auto_1809654 - SURFACE
    )
    :vars
    (
      ?auto_1809657 - HOIST
      ?auto_1809655 - PLACE
      ?auto_1809656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809657 ?auto_1809655 ) ( SURFACE-AT ?auto_1809653 ?auto_1809655 ) ( CLEAR ?auto_1809653 ) ( IS-CRATE ?auto_1809654 ) ( not ( = ?auto_1809653 ?auto_1809654 ) ) ( TRUCK-AT ?auto_1809656 ?auto_1809655 ) ( AVAILABLE ?auto_1809657 ) ( IN ?auto_1809654 ?auto_1809656 ) ( ON ?auto_1809653 ?auto_1809652 ) ( not ( = ?auto_1809652 ?auto_1809653 ) ) ( not ( = ?auto_1809652 ?auto_1809654 ) ) ( ON ?auto_1809651 ?auto_1809650 ) ( ON ?auto_1809652 ?auto_1809651 ) ( not ( = ?auto_1809650 ?auto_1809651 ) ) ( not ( = ?auto_1809650 ?auto_1809652 ) ) ( not ( = ?auto_1809650 ?auto_1809653 ) ) ( not ( = ?auto_1809650 ?auto_1809654 ) ) ( not ( = ?auto_1809651 ?auto_1809652 ) ) ( not ( = ?auto_1809651 ?auto_1809653 ) ) ( not ( = ?auto_1809651 ?auto_1809654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809652 ?auto_1809653 ?auto_1809654 )
      ( MAKE-4CRATE-VERIFY ?auto_1809650 ?auto_1809651 ?auto_1809652 ?auto_1809653 ?auto_1809654 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809680 - SURFACE
      ?auto_1809681 - SURFACE
      ?auto_1809682 - SURFACE
      ?auto_1809683 - SURFACE
      ?auto_1809684 - SURFACE
    )
    :vars
    (
      ?auto_1809686 - HOIST
      ?auto_1809688 - PLACE
      ?auto_1809685 - TRUCK
      ?auto_1809687 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809686 ?auto_1809688 ) ( SURFACE-AT ?auto_1809683 ?auto_1809688 ) ( CLEAR ?auto_1809683 ) ( IS-CRATE ?auto_1809684 ) ( not ( = ?auto_1809683 ?auto_1809684 ) ) ( AVAILABLE ?auto_1809686 ) ( IN ?auto_1809684 ?auto_1809685 ) ( ON ?auto_1809683 ?auto_1809682 ) ( not ( = ?auto_1809682 ?auto_1809683 ) ) ( not ( = ?auto_1809682 ?auto_1809684 ) ) ( TRUCK-AT ?auto_1809685 ?auto_1809687 ) ( not ( = ?auto_1809687 ?auto_1809688 ) ) ( ON ?auto_1809681 ?auto_1809680 ) ( ON ?auto_1809682 ?auto_1809681 ) ( not ( = ?auto_1809680 ?auto_1809681 ) ) ( not ( = ?auto_1809680 ?auto_1809682 ) ) ( not ( = ?auto_1809680 ?auto_1809683 ) ) ( not ( = ?auto_1809680 ?auto_1809684 ) ) ( not ( = ?auto_1809681 ?auto_1809682 ) ) ( not ( = ?auto_1809681 ?auto_1809683 ) ) ( not ( = ?auto_1809681 ?auto_1809684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809682 ?auto_1809683 ?auto_1809684 )
      ( MAKE-4CRATE-VERIFY ?auto_1809680 ?auto_1809681 ?auto_1809682 ?auto_1809683 ?auto_1809684 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809714 - SURFACE
      ?auto_1809715 - SURFACE
      ?auto_1809716 - SURFACE
      ?auto_1809717 - SURFACE
      ?auto_1809718 - SURFACE
    )
    :vars
    (
      ?auto_1809721 - HOIST
      ?auto_1809720 - PLACE
      ?auto_1809723 - TRUCK
      ?auto_1809719 - PLACE
      ?auto_1809722 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809721 ?auto_1809720 ) ( SURFACE-AT ?auto_1809717 ?auto_1809720 ) ( CLEAR ?auto_1809717 ) ( IS-CRATE ?auto_1809718 ) ( not ( = ?auto_1809717 ?auto_1809718 ) ) ( AVAILABLE ?auto_1809721 ) ( ON ?auto_1809717 ?auto_1809716 ) ( not ( = ?auto_1809716 ?auto_1809717 ) ) ( not ( = ?auto_1809716 ?auto_1809718 ) ) ( TRUCK-AT ?auto_1809723 ?auto_1809719 ) ( not ( = ?auto_1809719 ?auto_1809720 ) ) ( HOIST-AT ?auto_1809722 ?auto_1809719 ) ( LIFTING ?auto_1809722 ?auto_1809718 ) ( not ( = ?auto_1809721 ?auto_1809722 ) ) ( ON ?auto_1809715 ?auto_1809714 ) ( ON ?auto_1809716 ?auto_1809715 ) ( not ( = ?auto_1809714 ?auto_1809715 ) ) ( not ( = ?auto_1809714 ?auto_1809716 ) ) ( not ( = ?auto_1809714 ?auto_1809717 ) ) ( not ( = ?auto_1809714 ?auto_1809718 ) ) ( not ( = ?auto_1809715 ?auto_1809716 ) ) ( not ( = ?auto_1809715 ?auto_1809717 ) ) ( not ( = ?auto_1809715 ?auto_1809718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809716 ?auto_1809717 ?auto_1809718 )
      ( MAKE-4CRATE-VERIFY ?auto_1809714 ?auto_1809715 ?auto_1809716 ?auto_1809717 ?auto_1809718 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809752 - SURFACE
      ?auto_1809753 - SURFACE
      ?auto_1809754 - SURFACE
      ?auto_1809755 - SURFACE
      ?auto_1809756 - SURFACE
    )
    :vars
    (
      ?auto_1809759 - HOIST
      ?auto_1809760 - PLACE
      ?auto_1809761 - TRUCK
      ?auto_1809758 - PLACE
      ?auto_1809757 - HOIST
      ?auto_1809762 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809759 ?auto_1809760 ) ( SURFACE-AT ?auto_1809755 ?auto_1809760 ) ( CLEAR ?auto_1809755 ) ( IS-CRATE ?auto_1809756 ) ( not ( = ?auto_1809755 ?auto_1809756 ) ) ( AVAILABLE ?auto_1809759 ) ( ON ?auto_1809755 ?auto_1809754 ) ( not ( = ?auto_1809754 ?auto_1809755 ) ) ( not ( = ?auto_1809754 ?auto_1809756 ) ) ( TRUCK-AT ?auto_1809761 ?auto_1809758 ) ( not ( = ?auto_1809758 ?auto_1809760 ) ) ( HOIST-AT ?auto_1809757 ?auto_1809758 ) ( not ( = ?auto_1809759 ?auto_1809757 ) ) ( AVAILABLE ?auto_1809757 ) ( SURFACE-AT ?auto_1809756 ?auto_1809758 ) ( ON ?auto_1809756 ?auto_1809762 ) ( CLEAR ?auto_1809756 ) ( not ( = ?auto_1809755 ?auto_1809762 ) ) ( not ( = ?auto_1809756 ?auto_1809762 ) ) ( not ( = ?auto_1809754 ?auto_1809762 ) ) ( ON ?auto_1809753 ?auto_1809752 ) ( ON ?auto_1809754 ?auto_1809753 ) ( not ( = ?auto_1809752 ?auto_1809753 ) ) ( not ( = ?auto_1809752 ?auto_1809754 ) ) ( not ( = ?auto_1809752 ?auto_1809755 ) ) ( not ( = ?auto_1809752 ?auto_1809756 ) ) ( not ( = ?auto_1809752 ?auto_1809762 ) ) ( not ( = ?auto_1809753 ?auto_1809754 ) ) ( not ( = ?auto_1809753 ?auto_1809755 ) ) ( not ( = ?auto_1809753 ?auto_1809756 ) ) ( not ( = ?auto_1809753 ?auto_1809762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809754 ?auto_1809755 ?auto_1809756 )
      ( MAKE-4CRATE-VERIFY ?auto_1809752 ?auto_1809753 ?auto_1809754 ?auto_1809755 ?auto_1809756 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809791 - SURFACE
      ?auto_1809792 - SURFACE
      ?auto_1809793 - SURFACE
      ?auto_1809794 - SURFACE
      ?auto_1809795 - SURFACE
    )
    :vars
    (
      ?auto_1809801 - HOIST
      ?auto_1809799 - PLACE
      ?auto_1809800 - PLACE
      ?auto_1809797 - HOIST
      ?auto_1809796 - SURFACE
      ?auto_1809798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809801 ?auto_1809799 ) ( SURFACE-AT ?auto_1809794 ?auto_1809799 ) ( CLEAR ?auto_1809794 ) ( IS-CRATE ?auto_1809795 ) ( not ( = ?auto_1809794 ?auto_1809795 ) ) ( AVAILABLE ?auto_1809801 ) ( ON ?auto_1809794 ?auto_1809793 ) ( not ( = ?auto_1809793 ?auto_1809794 ) ) ( not ( = ?auto_1809793 ?auto_1809795 ) ) ( not ( = ?auto_1809800 ?auto_1809799 ) ) ( HOIST-AT ?auto_1809797 ?auto_1809800 ) ( not ( = ?auto_1809801 ?auto_1809797 ) ) ( AVAILABLE ?auto_1809797 ) ( SURFACE-AT ?auto_1809795 ?auto_1809800 ) ( ON ?auto_1809795 ?auto_1809796 ) ( CLEAR ?auto_1809795 ) ( not ( = ?auto_1809794 ?auto_1809796 ) ) ( not ( = ?auto_1809795 ?auto_1809796 ) ) ( not ( = ?auto_1809793 ?auto_1809796 ) ) ( TRUCK-AT ?auto_1809798 ?auto_1809799 ) ( ON ?auto_1809792 ?auto_1809791 ) ( ON ?auto_1809793 ?auto_1809792 ) ( not ( = ?auto_1809791 ?auto_1809792 ) ) ( not ( = ?auto_1809791 ?auto_1809793 ) ) ( not ( = ?auto_1809791 ?auto_1809794 ) ) ( not ( = ?auto_1809791 ?auto_1809795 ) ) ( not ( = ?auto_1809791 ?auto_1809796 ) ) ( not ( = ?auto_1809792 ?auto_1809793 ) ) ( not ( = ?auto_1809792 ?auto_1809794 ) ) ( not ( = ?auto_1809792 ?auto_1809795 ) ) ( not ( = ?auto_1809792 ?auto_1809796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809793 ?auto_1809794 ?auto_1809795 )
      ( MAKE-4CRATE-VERIFY ?auto_1809791 ?auto_1809792 ?auto_1809793 ?auto_1809794 ?auto_1809795 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809830 - SURFACE
      ?auto_1809831 - SURFACE
      ?auto_1809832 - SURFACE
      ?auto_1809833 - SURFACE
      ?auto_1809834 - SURFACE
    )
    :vars
    (
      ?auto_1809835 - HOIST
      ?auto_1809836 - PLACE
      ?auto_1809839 - PLACE
      ?auto_1809838 - HOIST
      ?auto_1809837 - SURFACE
      ?auto_1809840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809835 ?auto_1809836 ) ( IS-CRATE ?auto_1809834 ) ( not ( = ?auto_1809833 ?auto_1809834 ) ) ( not ( = ?auto_1809832 ?auto_1809833 ) ) ( not ( = ?auto_1809832 ?auto_1809834 ) ) ( not ( = ?auto_1809839 ?auto_1809836 ) ) ( HOIST-AT ?auto_1809838 ?auto_1809839 ) ( not ( = ?auto_1809835 ?auto_1809838 ) ) ( AVAILABLE ?auto_1809838 ) ( SURFACE-AT ?auto_1809834 ?auto_1809839 ) ( ON ?auto_1809834 ?auto_1809837 ) ( CLEAR ?auto_1809834 ) ( not ( = ?auto_1809833 ?auto_1809837 ) ) ( not ( = ?auto_1809834 ?auto_1809837 ) ) ( not ( = ?auto_1809832 ?auto_1809837 ) ) ( TRUCK-AT ?auto_1809840 ?auto_1809836 ) ( SURFACE-AT ?auto_1809832 ?auto_1809836 ) ( CLEAR ?auto_1809832 ) ( LIFTING ?auto_1809835 ?auto_1809833 ) ( IS-CRATE ?auto_1809833 ) ( ON ?auto_1809831 ?auto_1809830 ) ( ON ?auto_1809832 ?auto_1809831 ) ( not ( = ?auto_1809830 ?auto_1809831 ) ) ( not ( = ?auto_1809830 ?auto_1809832 ) ) ( not ( = ?auto_1809830 ?auto_1809833 ) ) ( not ( = ?auto_1809830 ?auto_1809834 ) ) ( not ( = ?auto_1809830 ?auto_1809837 ) ) ( not ( = ?auto_1809831 ?auto_1809832 ) ) ( not ( = ?auto_1809831 ?auto_1809833 ) ) ( not ( = ?auto_1809831 ?auto_1809834 ) ) ( not ( = ?auto_1809831 ?auto_1809837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809832 ?auto_1809833 ?auto_1809834 )
      ( MAKE-4CRATE-VERIFY ?auto_1809830 ?auto_1809831 ?auto_1809832 ?auto_1809833 ?auto_1809834 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809869 - SURFACE
      ?auto_1809870 - SURFACE
      ?auto_1809871 - SURFACE
      ?auto_1809872 - SURFACE
      ?auto_1809873 - SURFACE
    )
    :vars
    (
      ?auto_1809877 - HOIST
      ?auto_1809878 - PLACE
      ?auto_1809874 - PLACE
      ?auto_1809876 - HOIST
      ?auto_1809875 - SURFACE
      ?auto_1809879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809877 ?auto_1809878 ) ( IS-CRATE ?auto_1809873 ) ( not ( = ?auto_1809872 ?auto_1809873 ) ) ( not ( = ?auto_1809871 ?auto_1809872 ) ) ( not ( = ?auto_1809871 ?auto_1809873 ) ) ( not ( = ?auto_1809874 ?auto_1809878 ) ) ( HOIST-AT ?auto_1809876 ?auto_1809874 ) ( not ( = ?auto_1809877 ?auto_1809876 ) ) ( AVAILABLE ?auto_1809876 ) ( SURFACE-AT ?auto_1809873 ?auto_1809874 ) ( ON ?auto_1809873 ?auto_1809875 ) ( CLEAR ?auto_1809873 ) ( not ( = ?auto_1809872 ?auto_1809875 ) ) ( not ( = ?auto_1809873 ?auto_1809875 ) ) ( not ( = ?auto_1809871 ?auto_1809875 ) ) ( TRUCK-AT ?auto_1809879 ?auto_1809878 ) ( SURFACE-AT ?auto_1809871 ?auto_1809878 ) ( CLEAR ?auto_1809871 ) ( IS-CRATE ?auto_1809872 ) ( AVAILABLE ?auto_1809877 ) ( IN ?auto_1809872 ?auto_1809879 ) ( ON ?auto_1809870 ?auto_1809869 ) ( ON ?auto_1809871 ?auto_1809870 ) ( not ( = ?auto_1809869 ?auto_1809870 ) ) ( not ( = ?auto_1809869 ?auto_1809871 ) ) ( not ( = ?auto_1809869 ?auto_1809872 ) ) ( not ( = ?auto_1809869 ?auto_1809873 ) ) ( not ( = ?auto_1809869 ?auto_1809875 ) ) ( not ( = ?auto_1809870 ?auto_1809871 ) ) ( not ( = ?auto_1809870 ?auto_1809872 ) ) ( not ( = ?auto_1809870 ?auto_1809873 ) ) ( not ( = ?auto_1809870 ?auto_1809875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809871 ?auto_1809872 ?auto_1809873 )
      ( MAKE-4CRATE-VERIFY ?auto_1809869 ?auto_1809870 ?auto_1809871 ?auto_1809872 ?auto_1809873 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810529 - SURFACE
      ?auto_1810530 - SURFACE
      ?auto_1810531 - SURFACE
      ?auto_1810532 - SURFACE
      ?auto_1810533 - SURFACE
      ?auto_1810534 - SURFACE
    )
    :vars
    (
      ?auto_1810535 - HOIST
      ?auto_1810536 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810535 ?auto_1810536 ) ( SURFACE-AT ?auto_1810533 ?auto_1810536 ) ( CLEAR ?auto_1810533 ) ( LIFTING ?auto_1810535 ?auto_1810534 ) ( IS-CRATE ?auto_1810534 ) ( not ( = ?auto_1810533 ?auto_1810534 ) ) ( ON ?auto_1810530 ?auto_1810529 ) ( ON ?auto_1810531 ?auto_1810530 ) ( ON ?auto_1810532 ?auto_1810531 ) ( ON ?auto_1810533 ?auto_1810532 ) ( not ( = ?auto_1810529 ?auto_1810530 ) ) ( not ( = ?auto_1810529 ?auto_1810531 ) ) ( not ( = ?auto_1810529 ?auto_1810532 ) ) ( not ( = ?auto_1810529 ?auto_1810533 ) ) ( not ( = ?auto_1810529 ?auto_1810534 ) ) ( not ( = ?auto_1810530 ?auto_1810531 ) ) ( not ( = ?auto_1810530 ?auto_1810532 ) ) ( not ( = ?auto_1810530 ?auto_1810533 ) ) ( not ( = ?auto_1810530 ?auto_1810534 ) ) ( not ( = ?auto_1810531 ?auto_1810532 ) ) ( not ( = ?auto_1810531 ?auto_1810533 ) ) ( not ( = ?auto_1810531 ?auto_1810534 ) ) ( not ( = ?auto_1810532 ?auto_1810533 ) ) ( not ( = ?auto_1810532 ?auto_1810534 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1810533 ?auto_1810534 )
      ( MAKE-5CRATE-VERIFY ?auto_1810529 ?auto_1810530 ?auto_1810531 ?auto_1810532 ?auto_1810533 ?auto_1810534 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810563 - SURFACE
      ?auto_1810564 - SURFACE
      ?auto_1810565 - SURFACE
      ?auto_1810566 - SURFACE
      ?auto_1810567 - SURFACE
      ?auto_1810568 - SURFACE
    )
    :vars
    (
      ?auto_1810571 - HOIST
      ?auto_1810570 - PLACE
      ?auto_1810569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810571 ?auto_1810570 ) ( SURFACE-AT ?auto_1810567 ?auto_1810570 ) ( CLEAR ?auto_1810567 ) ( IS-CRATE ?auto_1810568 ) ( not ( = ?auto_1810567 ?auto_1810568 ) ) ( TRUCK-AT ?auto_1810569 ?auto_1810570 ) ( AVAILABLE ?auto_1810571 ) ( IN ?auto_1810568 ?auto_1810569 ) ( ON ?auto_1810567 ?auto_1810566 ) ( not ( = ?auto_1810566 ?auto_1810567 ) ) ( not ( = ?auto_1810566 ?auto_1810568 ) ) ( ON ?auto_1810564 ?auto_1810563 ) ( ON ?auto_1810565 ?auto_1810564 ) ( ON ?auto_1810566 ?auto_1810565 ) ( not ( = ?auto_1810563 ?auto_1810564 ) ) ( not ( = ?auto_1810563 ?auto_1810565 ) ) ( not ( = ?auto_1810563 ?auto_1810566 ) ) ( not ( = ?auto_1810563 ?auto_1810567 ) ) ( not ( = ?auto_1810563 ?auto_1810568 ) ) ( not ( = ?auto_1810564 ?auto_1810565 ) ) ( not ( = ?auto_1810564 ?auto_1810566 ) ) ( not ( = ?auto_1810564 ?auto_1810567 ) ) ( not ( = ?auto_1810564 ?auto_1810568 ) ) ( not ( = ?auto_1810565 ?auto_1810566 ) ) ( not ( = ?auto_1810565 ?auto_1810567 ) ) ( not ( = ?auto_1810565 ?auto_1810568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810566 ?auto_1810567 ?auto_1810568 )
      ( MAKE-5CRATE-VERIFY ?auto_1810563 ?auto_1810564 ?auto_1810565 ?auto_1810566 ?auto_1810567 ?auto_1810568 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810603 - SURFACE
      ?auto_1810604 - SURFACE
      ?auto_1810605 - SURFACE
      ?auto_1810606 - SURFACE
      ?auto_1810607 - SURFACE
      ?auto_1810608 - SURFACE
    )
    :vars
    (
      ?auto_1810612 - HOIST
      ?auto_1810610 - PLACE
      ?auto_1810611 - TRUCK
      ?auto_1810609 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810612 ?auto_1810610 ) ( SURFACE-AT ?auto_1810607 ?auto_1810610 ) ( CLEAR ?auto_1810607 ) ( IS-CRATE ?auto_1810608 ) ( not ( = ?auto_1810607 ?auto_1810608 ) ) ( AVAILABLE ?auto_1810612 ) ( IN ?auto_1810608 ?auto_1810611 ) ( ON ?auto_1810607 ?auto_1810606 ) ( not ( = ?auto_1810606 ?auto_1810607 ) ) ( not ( = ?auto_1810606 ?auto_1810608 ) ) ( TRUCK-AT ?auto_1810611 ?auto_1810609 ) ( not ( = ?auto_1810609 ?auto_1810610 ) ) ( ON ?auto_1810604 ?auto_1810603 ) ( ON ?auto_1810605 ?auto_1810604 ) ( ON ?auto_1810606 ?auto_1810605 ) ( not ( = ?auto_1810603 ?auto_1810604 ) ) ( not ( = ?auto_1810603 ?auto_1810605 ) ) ( not ( = ?auto_1810603 ?auto_1810606 ) ) ( not ( = ?auto_1810603 ?auto_1810607 ) ) ( not ( = ?auto_1810603 ?auto_1810608 ) ) ( not ( = ?auto_1810604 ?auto_1810605 ) ) ( not ( = ?auto_1810604 ?auto_1810606 ) ) ( not ( = ?auto_1810604 ?auto_1810607 ) ) ( not ( = ?auto_1810604 ?auto_1810608 ) ) ( not ( = ?auto_1810605 ?auto_1810606 ) ) ( not ( = ?auto_1810605 ?auto_1810607 ) ) ( not ( = ?auto_1810605 ?auto_1810608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810606 ?auto_1810607 ?auto_1810608 )
      ( MAKE-5CRATE-VERIFY ?auto_1810603 ?auto_1810604 ?auto_1810605 ?auto_1810606 ?auto_1810607 ?auto_1810608 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810648 - SURFACE
      ?auto_1810649 - SURFACE
      ?auto_1810650 - SURFACE
      ?auto_1810651 - SURFACE
      ?auto_1810652 - SURFACE
      ?auto_1810653 - SURFACE
    )
    :vars
    (
      ?auto_1810655 - HOIST
      ?auto_1810657 - PLACE
      ?auto_1810654 - TRUCK
      ?auto_1810658 - PLACE
      ?auto_1810656 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810655 ?auto_1810657 ) ( SURFACE-AT ?auto_1810652 ?auto_1810657 ) ( CLEAR ?auto_1810652 ) ( IS-CRATE ?auto_1810653 ) ( not ( = ?auto_1810652 ?auto_1810653 ) ) ( AVAILABLE ?auto_1810655 ) ( ON ?auto_1810652 ?auto_1810651 ) ( not ( = ?auto_1810651 ?auto_1810652 ) ) ( not ( = ?auto_1810651 ?auto_1810653 ) ) ( TRUCK-AT ?auto_1810654 ?auto_1810658 ) ( not ( = ?auto_1810658 ?auto_1810657 ) ) ( HOIST-AT ?auto_1810656 ?auto_1810658 ) ( LIFTING ?auto_1810656 ?auto_1810653 ) ( not ( = ?auto_1810655 ?auto_1810656 ) ) ( ON ?auto_1810649 ?auto_1810648 ) ( ON ?auto_1810650 ?auto_1810649 ) ( ON ?auto_1810651 ?auto_1810650 ) ( not ( = ?auto_1810648 ?auto_1810649 ) ) ( not ( = ?auto_1810648 ?auto_1810650 ) ) ( not ( = ?auto_1810648 ?auto_1810651 ) ) ( not ( = ?auto_1810648 ?auto_1810652 ) ) ( not ( = ?auto_1810648 ?auto_1810653 ) ) ( not ( = ?auto_1810649 ?auto_1810650 ) ) ( not ( = ?auto_1810649 ?auto_1810651 ) ) ( not ( = ?auto_1810649 ?auto_1810652 ) ) ( not ( = ?auto_1810649 ?auto_1810653 ) ) ( not ( = ?auto_1810650 ?auto_1810651 ) ) ( not ( = ?auto_1810650 ?auto_1810652 ) ) ( not ( = ?auto_1810650 ?auto_1810653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810651 ?auto_1810652 ?auto_1810653 )
      ( MAKE-5CRATE-VERIFY ?auto_1810648 ?auto_1810649 ?auto_1810650 ?auto_1810651 ?auto_1810652 ?auto_1810653 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810698 - SURFACE
      ?auto_1810699 - SURFACE
      ?auto_1810700 - SURFACE
      ?auto_1810701 - SURFACE
      ?auto_1810702 - SURFACE
      ?auto_1810703 - SURFACE
    )
    :vars
    (
      ?auto_1810707 - HOIST
      ?auto_1810708 - PLACE
      ?auto_1810704 - TRUCK
      ?auto_1810709 - PLACE
      ?auto_1810706 - HOIST
      ?auto_1810705 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810707 ?auto_1810708 ) ( SURFACE-AT ?auto_1810702 ?auto_1810708 ) ( CLEAR ?auto_1810702 ) ( IS-CRATE ?auto_1810703 ) ( not ( = ?auto_1810702 ?auto_1810703 ) ) ( AVAILABLE ?auto_1810707 ) ( ON ?auto_1810702 ?auto_1810701 ) ( not ( = ?auto_1810701 ?auto_1810702 ) ) ( not ( = ?auto_1810701 ?auto_1810703 ) ) ( TRUCK-AT ?auto_1810704 ?auto_1810709 ) ( not ( = ?auto_1810709 ?auto_1810708 ) ) ( HOIST-AT ?auto_1810706 ?auto_1810709 ) ( not ( = ?auto_1810707 ?auto_1810706 ) ) ( AVAILABLE ?auto_1810706 ) ( SURFACE-AT ?auto_1810703 ?auto_1810709 ) ( ON ?auto_1810703 ?auto_1810705 ) ( CLEAR ?auto_1810703 ) ( not ( = ?auto_1810702 ?auto_1810705 ) ) ( not ( = ?auto_1810703 ?auto_1810705 ) ) ( not ( = ?auto_1810701 ?auto_1810705 ) ) ( ON ?auto_1810699 ?auto_1810698 ) ( ON ?auto_1810700 ?auto_1810699 ) ( ON ?auto_1810701 ?auto_1810700 ) ( not ( = ?auto_1810698 ?auto_1810699 ) ) ( not ( = ?auto_1810698 ?auto_1810700 ) ) ( not ( = ?auto_1810698 ?auto_1810701 ) ) ( not ( = ?auto_1810698 ?auto_1810702 ) ) ( not ( = ?auto_1810698 ?auto_1810703 ) ) ( not ( = ?auto_1810698 ?auto_1810705 ) ) ( not ( = ?auto_1810699 ?auto_1810700 ) ) ( not ( = ?auto_1810699 ?auto_1810701 ) ) ( not ( = ?auto_1810699 ?auto_1810702 ) ) ( not ( = ?auto_1810699 ?auto_1810703 ) ) ( not ( = ?auto_1810699 ?auto_1810705 ) ) ( not ( = ?auto_1810700 ?auto_1810701 ) ) ( not ( = ?auto_1810700 ?auto_1810702 ) ) ( not ( = ?auto_1810700 ?auto_1810703 ) ) ( not ( = ?auto_1810700 ?auto_1810705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810701 ?auto_1810702 ?auto_1810703 )
      ( MAKE-5CRATE-VERIFY ?auto_1810698 ?auto_1810699 ?auto_1810700 ?auto_1810701 ?auto_1810702 ?auto_1810703 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810749 - SURFACE
      ?auto_1810750 - SURFACE
      ?auto_1810751 - SURFACE
      ?auto_1810752 - SURFACE
      ?auto_1810753 - SURFACE
      ?auto_1810754 - SURFACE
    )
    :vars
    (
      ?auto_1810756 - HOIST
      ?auto_1810758 - PLACE
      ?auto_1810757 - PLACE
      ?auto_1810755 - HOIST
      ?auto_1810759 - SURFACE
      ?auto_1810760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810756 ?auto_1810758 ) ( SURFACE-AT ?auto_1810753 ?auto_1810758 ) ( CLEAR ?auto_1810753 ) ( IS-CRATE ?auto_1810754 ) ( not ( = ?auto_1810753 ?auto_1810754 ) ) ( AVAILABLE ?auto_1810756 ) ( ON ?auto_1810753 ?auto_1810752 ) ( not ( = ?auto_1810752 ?auto_1810753 ) ) ( not ( = ?auto_1810752 ?auto_1810754 ) ) ( not ( = ?auto_1810757 ?auto_1810758 ) ) ( HOIST-AT ?auto_1810755 ?auto_1810757 ) ( not ( = ?auto_1810756 ?auto_1810755 ) ) ( AVAILABLE ?auto_1810755 ) ( SURFACE-AT ?auto_1810754 ?auto_1810757 ) ( ON ?auto_1810754 ?auto_1810759 ) ( CLEAR ?auto_1810754 ) ( not ( = ?auto_1810753 ?auto_1810759 ) ) ( not ( = ?auto_1810754 ?auto_1810759 ) ) ( not ( = ?auto_1810752 ?auto_1810759 ) ) ( TRUCK-AT ?auto_1810760 ?auto_1810758 ) ( ON ?auto_1810750 ?auto_1810749 ) ( ON ?auto_1810751 ?auto_1810750 ) ( ON ?auto_1810752 ?auto_1810751 ) ( not ( = ?auto_1810749 ?auto_1810750 ) ) ( not ( = ?auto_1810749 ?auto_1810751 ) ) ( not ( = ?auto_1810749 ?auto_1810752 ) ) ( not ( = ?auto_1810749 ?auto_1810753 ) ) ( not ( = ?auto_1810749 ?auto_1810754 ) ) ( not ( = ?auto_1810749 ?auto_1810759 ) ) ( not ( = ?auto_1810750 ?auto_1810751 ) ) ( not ( = ?auto_1810750 ?auto_1810752 ) ) ( not ( = ?auto_1810750 ?auto_1810753 ) ) ( not ( = ?auto_1810750 ?auto_1810754 ) ) ( not ( = ?auto_1810750 ?auto_1810759 ) ) ( not ( = ?auto_1810751 ?auto_1810752 ) ) ( not ( = ?auto_1810751 ?auto_1810753 ) ) ( not ( = ?auto_1810751 ?auto_1810754 ) ) ( not ( = ?auto_1810751 ?auto_1810759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810752 ?auto_1810753 ?auto_1810754 )
      ( MAKE-5CRATE-VERIFY ?auto_1810749 ?auto_1810750 ?auto_1810751 ?auto_1810752 ?auto_1810753 ?auto_1810754 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810800 - SURFACE
      ?auto_1810801 - SURFACE
      ?auto_1810802 - SURFACE
      ?auto_1810803 - SURFACE
      ?auto_1810804 - SURFACE
      ?auto_1810805 - SURFACE
    )
    :vars
    (
      ?auto_1810810 - HOIST
      ?auto_1810809 - PLACE
      ?auto_1810806 - PLACE
      ?auto_1810807 - HOIST
      ?auto_1810811 - SURFACE
      ?auto_1810808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810810 ?auto_1810809 ) ( IS-CRATE ?auto_1810805 ) ( not ( = ?auto_1810804 ?auto_1810805 ) ) ( not ( = ?auto_1810803 ?auto_1810804 ) ) ( not ( = ?auto_1810803 ?auto_1810805 ) ) ( not ( = ?auto_1810806 ?auto_1810809 ) ) ( HOIST-AT ?auto_1810807 ?auto_1810806 ) ( not ( = ?auto_1810810 ?auto_1810807 ) ) ( AVAILABLE ?auto_1810807 ) ( SURFACE-AT ?auto_1810805 ?auto_1810806 ) ( ON ?auto_1810805 ?auto_1810811 ) ( CLEAR ?auto_1810805 ) ( not ( = ?auto_1810804 ?auto_1810811 ) ) ( not ( = ?auto_1810805 ?auto_1810811 ) ) ( not ( = ?auto_1810803 ?auto_1810811 ) ) ( TRUCK-AT ?auto_1810808 ?auto_1810809 ) ( SURFACE-AT ?auto_1810803 ?auto_1810809 ) ( CLEAR ?auto_1810803 ) ( LIFTING ?auto_1810810 ?auto_1810804 ) ( IS-CRATE ?auto_1810804 ) ( ON ?auto_1810801 ?auto_1810800 ) ( ON ?auto_1810802 ?auto_1810801 ) ( ON ?auto_1810803 ?auto_1810802 ) ( not ( = ?auto_1810800 ?auto_1810801 ) ) ( not ( = ?auto_1810800 ?auto_1810802 ) ) ( not ( = ?auto_1810800 ?auto_1810803 ) ) ( not ( = ?auto_1810800 ?auto_1810804 ) ) ( not ( = ?auto_1810800 ?auto_1810805 ) ) ( not ( = ?auto_1810800 ?auto_1810811 ) ) ( not ( = ?auto_1810801 ?auto_1810802 ) ) ( not ( = ?auto_1810801 ?auto_1810803 ) ) ( not ( = ?auto_1810801 ?auto_1810804 ) ) ( not ( = ?auto_1810801 ?auto_1810805 ) ) ( not ( = ?auto_1810801 ?auto_1810811 ) ) ( not ( = ?auto_1810802 ?auto_1810803 ) ) ( not ( = ?auto_1810802 ?auto_1810804 ) ) ( not ( = ?auto_1810802 ?auto_1810805 ) ) ( not ( = ?auto_1810802 ?auto_1810811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810803 ?auto_1810804 ?auto_1810805 )
      ( MAKE-5CRATE-VERIFY ?auto_1810800 ?auto_1810801 ?auto_1810802 ?auto_1810803 ?auto_1810804 ?auto_1810805 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810851 - SURFACE
      ?auto_1810852 - SURFACE
      ?auto_1810853 - SURFACE
      ?auto_1810854 - SURFACE
      ?auto_1810855 - SURFACE
      ?auto_1810856 - SURFACE
    )
    :vars
    (
      ?auto_1810862 - HOIST
      ?auto_1810857 - PLACE
      ?auto_1810861 - PLACE
      ?auto_1810858 - HOIST
      ?auto_1810860 - SURFACE
      ?auto_1810859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810862 ?auto_1810857 ) ( IS-CRATE ?auto_1810856 ) ( not ( = ?auto_1810855 ?auto_1810856 ) ) ( not ( = ?auto_1810854 ?auto_1810855 ) ) ( not ( = ?auto_1810854 ?auto_1810856 ) ) ( not ( = ?auto_1810861 ?auto_1810857 ) ) ( HOIST-AT ?auto_1810858 ?auto_1810861 ) ( not ( = ?auto_1810862 ?auto_1810858 ) ) ( AVAILABLE ?auto_1810858 ) ( SURFACE-AT ?auto_1810856 ?auto_1810861 ) ( ON ?auto_1810856 ?auto_1810860 ) ( CLEAR ?auto_1810856 ) ( not ( = ?auto_1810855 ?auto_1810860 ) ) ( not ( = ?auto_1810856 ?auto_1810860 ) ) ( not ( = ?auto_1810854 ?auto_1810860 ) ) ( TRUCK-AT ?auto_1810859 ?auto_1810857 ) ( SURFACE-AT ?auto_1810854 ?auto_1810857 ) ( CLEAR ?auto_1810854 ) ( IS-CRATE ?auto_1810855 ) ( AVAILABLE ?auto_1810862 ) ( IN ?auto_1810855 ?auto_1810859 ) ( ON ?auto_1810852 ?auto_1810851 ) ( ON ?auto_1810853 ?auto_1810852 ) ( ON ?auto_1810854 ?auto_1810853 ) ( not ( = ?auto_1810851 ?auto_1810852 ) ) ( not ( = ?auto_1810851 ?auto_1810853 ) ) ( not ( = ?auto_1810851 ?auto_1810854 ) ) ( not ( = ?auto_1810851 ?auto_1810855 ) ) ( not ( = ?auto_1810851 ?auto_1810856 ) ) ( not ( = ?auto_1810851 ?auto_1810860 ) ) ( not ( = ?auto_1810852 ?auto_1810853 ) ) ( not ( = ?auto_1810852 ?auto_1810854 ) ) ( not ( = ?auto_1810852 ?auto_1810855 ) ) ( not ( = ?auto_1810852 ?auto_1810856 ) ) ( not ( = ?auto_1810852 ?auto_1810860 ) ) ( not ( = ?auto_1810853 ?auto_1810854 ) ) ( not ( = ?auto_1810853 ?auto_1810855 ) ) ( not ( = ?auto_1810853 ?auto_1810856 ) ) ( not ( = ?auto_1810853 ?auto_1810860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810854 ?auto_1810855 ?auto_1810856 )
      ( MAKE-5CRATE-VERIFY ?auto_1810851 ?auto_1810852 ?auto_1810853 ?auto_1810854 ?auto_1810855 ?auto_1810856 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812060 - SURFACE
      ?auto_1812061 - SURFACE
      ?auto_1812062 - SURFACE
      ?auto_1812063 - SURFACE
      ?auto_1812064 - SURFACE
      ?auto_1812065 - SURFACE
      ?auto_1812066 - SURFACE
    )
    :vars
    (
      ?auto_1812068 - HOIST
      ?auto_1812067 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812068 ?auto_1812067 ) ( SURFACE-AT ?auto_1812065 ?auto_1812067 ) ( CLEAR ?auto_1812065 ) ( LIFTING ?auto_1812068 ?auto_1812066 ) ( IS-CRATE ?auto_1812066 ) ( not ( = ?auto_1812065 ?auto_1812066 ) ) ( ON ?auto_1812061 ?auto_1812060 ) ( ON ?auto_1812062 ?auto_1812061 ) ( ON ?auto_1812063 ?auto_1812062 ) ( ON ?auto_1812064 ?auto_1812063 ) ( ON ?auto_1812065 ?auto_1812064 ) ( not ( = ?auto_1812060 ?auto_1812061 ) ) ( not ( = ?auto_1812060 ?auto_1812062 ) ) ( not ( = ?auto_1812060 ?auto_1812063 ) ) ( not ( = ?auto_1812060 ?auto_1812064 ) ) ( not ( = ?auto_1812060 ?auto_1812065 ) ) ( not ( = ?auto_1812060 ?auto_1812066 ) ) ( not ( = ?auto_1812061 ?auto_1812062 ) ) ( not ( = ?auto_1812061 ?auto_1812063 ) ) ( not ( = ?auto_1812061 ?auto_1812064 ) ) ( not ( = ?auto_1812061 ?auto_1812065 ) ) ( not ( = ?auto_1812061 ?auto_1812066 ) ) ( not ( = ?auto_1812062 ?auto_1812063 ) ) ( not ( = ?auto_1812062 ?auto_1812064 ) ) ( not ( = ?auto_1812062 ?auto_1812065 ) ) ( not ( = ?auto_1812062 ?auto_1812066 ) ) ( not ( = ?auto_1812063 ?auto_1812064 ) ) ( not ( = ?auto_1812063 ?auto_1812065 ) ) ( not ( = ?auto_1812063 ?auto_1812066 ) ) ( not ( = ?auto_1812064 ?auto_1812065 ) ) ( not ( = ?auto_1812064 ?auto_1812066 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1812065 ?auto_1812066 )
      ( MAKE-6CRATE-VERIFY ?auto_1812060 ?auto_1812061 ?auto_1812062 ?auto_1812063 ?auto_1812064 ?auto_1812065 ?auto_1812066 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812104 - SURFACE
      ?auto_1812105 - SURFACE
      ?auto_1812106 - SURFACE
      ?auto_1812107 - SURFACE
      ?auto_1812108 - SURFACE
      ?auto_1812109 - SURFACE
      ?auto_1812110 - SURFACE
    )
    :vars
    (
      ?auto_1812112 - HOIST
      ?auto_1812111 - PLACE
      ?auto_1812113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812112 ?auto_1812111 ) ( SURFACE-AT ?auto_1812109 ?auto_1812111 ) ( CLEAR ?auto_1812109 ) ( IS-CRATE ?auto_1812110 ) ( not ( = ?auto_1812109 ?auto_1812110 ) ) ( TRUCK-AT ?auto_1812113 ?auto_1812111 ) ( AVAILABLE ?auto_1812112 ) ( IN ?auto_1812110 ?auto_1812113 ) ( ON ?auto_1812109 ?auto_1812108 ) ( not ( = ?auto_1812108 ?auto_1812109 ) ) ( not ( = ?auto_1812108 ?auto_1812110 ) ) ( ON ?auto_1812105 ?auto_1812104 ) ( ON ?auto_1812106 ?auto_1812105 ) ( ON ?auto_1812107 ?auto_1812106 ) ( ON ?auto_1812108 ?auto_1812107 ) ( not ( = ?auto_1812104 ?auto_1812105 ) ) ( not ( = ?auto_1812104 ?auto_1812106 ) ) ( not ( = ?auto_1812104 ?auto_1812107 ) ) ( not ( = ?auto_1812104 ?auto_1812108 ) ) ( not ( = ?auto_1812104 ?auto_1812109 ) ) ( not ( = ?auto_1812104 ?auto_1812110 ) ) ( not ( = ?auto_1812105 ?auto_1812106 ) ) ( not ( = ?auto_1812105 ?auto_1812107 ) ) ( not ( = ?auto_1812105 ?auto_1812108 ) ) ( not ( = ?auto_1812105 ?auto_1812109 ) ) ( not ( = ?auto_1812105 ?auto_1812110 ) ) ( not ( = ?auto_1812106 ?auto_1812107 ) ) ( not ( = ?auto_1812106 ?auto_1812108 ) ) ( not ( = ?auto_1812106 ?auto_1812109 ) ) ( not ( = ?auto_1812106 ?auto_1812110 ) ) ( not ( = ?auto_1812107 ?auto_1812108 ) ) ( not ( = ?auto_1812107 ?auto_1812109 ) ) ( not ( = ?auto_1812107 ?auto_1812110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812108 ?auto_1812109 ?auto_1812110 )
      ( MAKE-6CRATE-VERIFY ?auto_1812104 ?auto_1812105 ?auto_1812106 ?auto_1812107 ?auto_1812108 ?auto_1812109 ?auto_1812110 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812155 - SURFACE
      ?auto_1812156 - SURFACE
      ?auto_1812157 - SURFACE
      ?auto_1812158 - SURFACE
      ?auto_1812159 - SURFACE
      ?auto_1812160 - SURFACE
      ?auto_1812161 - SURFACE
    )
    :vars
    (
      ?auto_1812162 - HOIST
      ?auto_1812163 - PLACE
      ?auto_1812165 - TRUCK
      ?auto_1812164 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812162 ?auto_1812163 ) ( SURFACE-AT ?auto_1812160 ?auto_1812163 ) ( CLEAR ?auto_1812160 ) ( IS-CRATE ?auto_1812161 ) ( not ( = ?auto_1812160 ?auto_1812161 ) ) ( AVAILABLE ?auto_1812162 ) ( IN ?auto_1812161 ?auto_1812165 ) ( ON ?auto_1812160 ?auto_1812159 ) ( not ( = ?auto_1812159 ?auto_1812160 ) ) ( not ( = ?auto_1812159 ?auto_1812161 ) ) ( TRUCK-AT ?auto_1812165 ?auto_1812164 ) ( not ( = ?auto_1812164 ?auto_1812163 ) ) ( ON ?auto_1812156 ?auto_1812155 ) ( ON ?auto_1812157 ?auto_1812156 ) ( ON ?auto_1812158 ?auto_1812157 ) ( ON ?auto_1812159 ?auto_1812158 ) ( not ( = ?auto_1812155 ?auto_1812156 ) ) ( not ( = ?auto_1812155 ?auto_1812157 ) ) ( not ( = ?auto_1812155 ?auto_1812158 ) ) ( not ( = ?auto_1812155 ?auto_1812159 ) ) ( not ( = ?auto_1812155 ?auto_1812160 ) ) ( not ( = ?auto_1812155 ?auto_1812161 ) ) ( not ( = ?auto_1812156 ?auto_1812157 ) ) ( not ( = ?auto_1812156 ?auto_1812158 ) ) ( not ( = ?auto_1812156 ?auto_1812159 ) ) ( not ( = ?auto_1812156 ?auto_1812160 ) ) ( not ( = ?auto_1812156 ?auto_1812161 ) ) ( not ( = ?auto_1812157 ?auto_1812158 ) ) ( not ( = ?auto_1812157 ?auto_1812159 ) ) ( not ( = ?auto_1812157 ?auto_1812160 ) ) ( not ( = ?auto_1812157 ?auto_1812161 ) ) ( not ( = ?auto_1812158 ?auto_1812159 ) ) ( not ( = ?auto_1812158 ?auto_1812160 ) ) ( not ( = ?auto_1812158 ?auto_1812161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812159 ?auto_1812160 ?auto_1812161 )
      ( MAKE-6CRATE-VERIFY ?auto_1812155 ?auto_1812156 ?auto_1812157 ?auto_1812158 ?auto_1812159 ?auto_1812160 ?auto_1812161 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812212 - SURFACE
      ?auto_1812213 - SURFACE
      ?auto_1812214 - SURFACE
      ?auto_1812215 - SURFACE
      ?auto_1812216 - SURFACE
      ?auto_1812217 - SURFACE
      ?auto_1812218 - SURFACE
    )
    :vars
    (
      ?auto_1812222 - HOIST
      ?auto_1812219 - PLACE
      ?auto_1812223 - TRUCK
      ?auto_1812220 - PLACE
      ?auto_1812221 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812222 ?auto_1812219 ) ( SURFACE-AT ?auto_1812217 ?auto_1812219 ) ( CLEAR ?auto_1812217 ) ( IS-CRATE ?auto_1812218 ) ( not ( = ?auto_1812217 ?auto_1812218 ) ) ( AVAILABLE ?auto_1812222 ) ( ON ?auto_1812217 ?auto_1812216 ) ( not ( = ?auto_1812216 ?auto_1812217 ) ) ( not ( = ?auto_1812216 ?auto_1812218 ) ) ( TRUCK-AT ?auto_1812223 ?auto_1812220 ) ( not ( = ?auto_1812220 ?auto_1812219 ) ) ( HOIST-AT ?auto_1812221 ?auto_1812220 ) ( LIFTING ?auto_1812221 ?auto_1812218 ) ( not ( = ?auto_1812222 ?auto_1812221 ) ) ( ON ?auto_1812213 ?auto_1812212 ) ( ON ?auto_1812214 ?auto_1812213 ) ( ON ?auto_1812215 ?auto_1812214 ) ( ON ?auto_1812216 ?auto_1812215 ) ( not ( = ?auto_1812212 ?auto_1812213 ) ) ( not ( = ?auto_1812212 ?auto_1812214 ) ) ( not ( = ?auto_1812212 ?auto_1812215 ) ) ( not ( = ?auto_1812212 ?auto_1812216 ) ) ( not ( = ?auto_1812212 ?auto_1812217 ) ) ( not ( = ?auto_1812212 ?auto_1812218 ) ) ( not ( = ?auto_1812213 ?auto_1812214 ) ) ( not ( = ?auto_1812213 ?auto_1812215 ) ) ( not ( = ?auto_1812213 ?auto_1812216 ) ) ( not ( = ?auto_1812213 ?auto_1812217 ) ) ( not ( = ?auto_1812213 ?auto_1812218 ) ) ( not ( = ?auto_1812214 ?auto_1812215 ) ) ( not ( = ?auto_1812214 ?auto_1812216 ) ) ( not ( = ?auto_1812214 ?auto_1812217 ) ) ( not ( = ?auto_1812214 ?auto_1812218 ) ) ( not ( = ?auto_1812215 ?auto_1812216 ) ) ( not ( = ?auto_1812215 ?auto_1812217 ) ) ( not ( = ?auto_1812215 ?auto_1812218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812216 ?auto_1812217 ?auto_1812218 )
      ( MAKE-6CRATE-VERIFY ?auto_1812212 ?auto_1812213 ?auto_1812214 ?auto_1812215 ?auto_1812216 ?auto_1812217 ?auto_1812218 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812275 - SURFACE
      ?auto_1812276 - SURFACE
      ?auto_1812277 - SURFACE
      ?auto_1812278 - SURFACE
      ?auto_1812279 - SURFACE
      ?auto_1812280 - SURFACE
      ?auto_1812281 - SURFACE
    )
    :vars
    (
      ?auto_1812284 - HOIST
      ?auto_1812282 - PLACE
      ?auto_1812286 - TRUCK
      ?auto_1812287 - PLACE
      ?auto_1812283 - HOIST
      ?auto_1812285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812284 ?auto_1812282 ) ( SURFACE-AT ?auto_1812280 ?auto_1812282 ) ( CLEAR ?auto_1812280 ) ( IS-CRATE ?auto_1812281 ) ( not ( = ?auto_1812280 ?auto_1812281 ) ) ( AVAILABLE ?auto_1812284 ) ( ON ?auto_1812280 ?auto_1812279 ) ( not ( = ?auto_1812279 ?auto_1812280 ) ) ( not ( = ?auto_1812279 ?auto_1812281 ) ) ( TRUCK-AT ?auto_1812286 ?auto_1812287 ) ( not ( = ?auto_1812287 ?auto_1812282 ) ) ( HOIST-AT ?auto_1812283 ?auto_1812287 ) ( not ( = ?auto_1812284 ?auto_1812283 ) ) ( AVAILABLE ?auto_1812283 ) ( SURFACE-AT ?auto_1812281 ?auto_1812287 ) ( ON ?auto_1812281 ?auto_1812285 ) ( CLEAR ?auto_1812281 ) ( not ( = ?auto_1812280 ?auto_1812285 ) ) ( not ( = ?auto_1812281 ?auto_1812285 ) ) ( not ( = ?auto_1812279 ?auto_1812285 ) ) ( ON ?auto_1812276 ?auto_1812275 ) ( ON ?auto_1812277 ?auto_1812276 ) ( ON ?auto_1812278 ?auto_1812277 ) ( ON ?auto_1812279 ?auto_1812278 ) ( not ( = ?auto_1812275 ?auto_1812276 ) ) ( not ( = ?auto_1812275 ?auto_1812277 ) ) ( not ( = ?auto_1812275 ?auto_1812278 ) ) ( not ( = ?auto_1812275 ?auto_1812279 ) ) ( not ( = ?auto_1812275 ?auto_1812280 ) ) ( not ( = ?auto_1812275 ?auto_1812281 ) ) ( not ( = ?auto_1812275 ?auto_1812285 ) ) ( not ( = ?auto_1812276 ?auto_1812277 ) ) ( not ( = ?auto_1812276 ?auto_1812278 ) ) ( not ( = ?auto_1812276 ?auto_1812279 ) ) ( not ( = ?auto_1812276 ?auto_1812280 ) ) ( not ( = ?auto_1812276 ?auto_1812281 ) ) ( not ( = ?auto_1812276 ?auto_1812285 ) ) ( not ( = ?auto_1812277 ?auto_1812278 ) ) ( not ( = ?auto_1812277 ?auto_1812279 ) ) ( not ( = ?auto_1812277 ?auto_1812280 ) ) ( not ( = ?auto_1812277 ?auto_1812281 ) ) ( not ( = ?auto_1812277 ?auto_1812285 ) ) ( not ( = ?auto_1812278 ?auto_1812279 ) ) ( not ( = ?auto_1812278 ?auto_1812280 ) ) ( not ( = ?auto_1812278 ?auto_1812281 ) ) ( not ( = ?auto_1812278 ?auto_1812285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812279 ?auto_1812280 ?auto_1812281 )
      ( MAKE-6CRATE-VERIFY ?auto_1812275 ?auto_1812276 ?auto_1812277 ?auto_1812278 ?auto_1812279 ?auto_1812280 ?auto_1812281 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812339 - SURFACE
      ?auto_1812340 - SURFACE
      ?auto_1812341 - SURFACE
      ?auto_1812342 - SURFACE
      ?auto_1812343 - SURFACE
      ?auto_1812344 - SURFACE
      ?auto_1812345 - SURFACE
    )
    :vars
    (
      ?auto_1812346 - HOIST
      ?auto_1812348 - PLACE
      ?auto_1812347 - PLACE
      ?auto_1812349 - HOIST
      ?auto_1812350 - SURFACE
      ?auto_1812351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812346 ?auto_1812348 ) ( SURFACE-AT ?auto_1812344 ?auto_1812348 ) ( CLEAR ?auto_1812344 ) ( IS-CRATE ?auto_1812345 ) ( not ( = ?auto_1812344 ?auto_1812345 ) ) ( AVAILABLE ?auto_1812346 ) ( ON ?auto_1812344 ?auto_1812343 ) ( not ( = ?auto_1812343 ?auto_1812344 ) ) ( not ( = ?auto_1812343 ?auto_1812345 ) ) ( not ( = ?auto_1812347 ?auto_1812348 ) ) ( HOIST-AT ?auto_1812349 ?auto_1812347 ) ( not ( = ?auto_1812346 ?auto_1812349 ) ) ( AVAILABLE ?auto_1812349 ) ( SURFACE-AT ?auto_1812345 ?auto_1812347 ) ( ON ?auto_1812345 ?auto_1812350 ) ( CLEAR ?auto_1812345 ) ( not ( = ?auto_1812344 ?auto_1812350 ) ) ( not ( = ?auto_1812345 ?auto_1812350 ) ) ( not ( = ?auto_1812343 ?auto_1812350 ) ) ( TRUCK-AT ?auto_1812351 ?auto_1812348 ) ( ON ?auto_1812340 ?auto_1812339 ) ( ON ?auto_1812341 ?auto_1812340 ) ( ON ?auto_1812342 ?auto_1812341 ) ( ON ?auto_1812343 ?auto_1812342 ) ( not ( = ?auto_1812339 ?auto_1812340 ) ) ( not ( = ?auto_1812339 ?auto_1812341 ) ) ( not ( = ?auto_1812339 ?auto_1812342 ) ) ( not ( = ?auto_1812339 ?auto_1812343 ) ) ( not ( = ?auto_1812339 ?auto_1812344 ) ) ( not ( = ?auto_1812339 ?auto_1812345 ) ) ( not ( = ?auto_1812339 ?auto_1812350 ) ) ( not ( = ?auto_1812340 ?auto_1812341 ) ) ( not ( = ?auto_1812340 ?auto_1812342 ) ) ( not ( = ?auto_1812340 ?auto_1812343 ) ) ( not ( = ?auto_1812340 ?auto_1812344 ) ) ( not ( = ?auto_1812340 ?auto_1812345 ) ) ( not ( = ?auto_1812340 ?auto_1812350 ) ) ( not ( = ?auto_1812341 ?auto_1812342 ) ) ( not ( = ?auto_1812341 ?auto_1812343 ) ) ( not ( = ?auto_1812341 ?auto_1812344 ) ) ( not ( = ?auto_1812341 ?auto_1812345 ) ) ( not ( = ?auto_1812341 ?auto_1812350 ) ) ( not ( = ?auto_1812342 ?auto_1812343 ) ) ( not ( = ?auto_1812342 ?auto_1812344 ) ) ( not ( = ?auto_1812342 ?auto_1812345 ) ) ( not ( = ?auto_1812342 ?auto_1812350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812343 ?auto_1812344 ?auto_1812345 )
      ( MAKE-6CRATE-VERIFY ?auto_1812339 ?auto_1812340 ?auto_1812341 ?auto_1812342 ?auto_1812343 ?auto_1812344 ?auto_1812345 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812403 - SURFACE
      ?auto_1812404 - SURFACE
      ?auto_1812405 - SURFACE
      ?auto_1812406 - SURFACE
      ?auto_1812407 - SURFACE
      ?auto_1812408 - SURFACE
      ?auto_1812409 - SURFACE
    )
    :vars
    (
      ?auto_1812414 - HOIST
      ?auto_1812410 - PLACE
      ?auto_1812412 - PLACE
      ?auto_1812415 - HOIST
      ?auto_1812411 - SURFACE
      ?auto_1812413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812414 ?auto_1812410 ) ( IS-CRATE ?auto_1812409 ) ( not ( = ?auto_1812408 ?auto_1812409 ) ) ( not ( = ?auto_1812407 ?auto_1812408 ) ) ( not ( = ?auto_1812407 ?auto_1812409 ) ) ( not ( = ?auto_1812412 ?auto_1812410 ) ) ( HOIST-AT ?auto_1812415 ?auto_1812412 ) ( not ( = ?auto_1812414 ?auto_1812415 ) ) ( AVAILABLE ?auto_1812415 ) ( SURFACE-AT ?auto_1812409 ?auto_1812412 ) ( ON ?auto_1812409 ?auto_1812411 ) ( CLEAR ?auto_1812409 ) ( not ( = ?auto_1812408 ?auto_1812411 ) ) ( not ( = ?auto_1812409 ?auto_1812411 ) ) ( not ( = ?auto_1812407 ?auto_1812411 ) ) ( TRUCK-AT ?auto_1812413 ?auto_1812410 ) ( SURFACE-AT ?auto_1812407 ?auto_1812410 ) ( CLEAR ?auto_1812407 ) ( LIFTING ?auto_1812414 ?auto_1812408 ) ( IS-CRATE ?auto_1812408 ) ( ON ?auto_1812404 ?auto_1812403 ) ( ON ?auto_1812405 ?auto_1812404 ) ( ON ?auto_1812406 ?auto_1812405 ) ( ON ?auto_1812407 ?auto_1812406 ) ( not ( = ?auto_1812403 ?auto_1812404 ) ) ( not ( = ?auto_1812403 ?auto_1812405 ) ) ( not ( = ?auto_1812403 ?auto_1812406 ) ) ( not ( = ?auto_1812403 ?auto_1812407 ) ) ( not ( = ?auto_1812403 ?auto_1812408 ) ) ( not ( = ?auto_1812403 ?auto_1812409 ) ) ( not ( = ?auto_1812403 ?auto_1812411 ) ) ( not ( = ?auto_1812404 ?auto_1812405 ) ) ( not ( = ?auto_1812404 ?auto_1812406 ) ) ( not ( = ?auto_1812404 ?auto_1812407 ) ) ( not ( = ?auto_1812404 ?auto_1812408 ) ) ( not ( = ?auto_1812404 ?auto_1812409 ) ) ( not ( = ?auto_1812404 ?auto_1812411 ) ) ( not ( = ?auto_1812405 ?auto_1812406 ) ) ( not ( = ?auto_1812405 ?auto_1812407 ) ) ( not ( = ?auto_1812405 ?auto_1812408 ) ) ( not ( = ?auto_1812405 ?auto_1812409 ) ) ( not ( = ?auto_1812405 ?auto_1812411 ) ) ( not ( = ?auto_1812406 ?auto_1812407 ) ) ( not ( = ?auto_1812406 ?auto_1812408 ) ) ( not ( = ?auto_1812406 ?auto_1812409 ) ) ( not ( = ?auto_1812406 ?auto_1812411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812407 ?auto_1812408 ?auto_1812409 )
      ( MAKE-6CRATE-VERIFY ?auto_1812403 ?auto_1812404 ?auto_1812405 ?auto_1812406 ?auto_1812407 ?auto_1812408 ?auto_1812409 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812467 - SURFACE
      ?auto_1812468 - SURFACE
      ?auto_1812469 - SURFACE
      ?auto_1812470 - SURFACE
      ?auto_1812471 - SURFACE
      ?auto_1812472 - SURFACE
      ?auto_1812473 - SURFACE
    )
    :vars
    (
      ?auto_1812477 - HOIST
      ?auto_1812479 - PLACE
      ?auto_1812474 - PLACE
      ?auto_1812476 - HOIST
      ?auto_1812475 - SURFACE
      ?auto_1812478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812477 ?auto_1812479 ) ( IS-CRATE ?auto_1812473 ) ( not ( = ?auto_1812472 ?auto_1812473 ) ) ( not ( = ?auto_1812471 ?auto_1812472 ) ) ( not ( = ?auto_1812471 ?auto_1812473 ) ) ( not ( = ?auto_1812474 ?auto_1812479 ) ) ( HOIST-AT ?auto_1812476 ?auto_1812474 ) ( not ( = ?auto_1812477 ?auto_1812476 ) ) ( AVAILABLE ?auto_1812476 ) ( SURFACE-AT ?auto_1812473 ?auto_1812474 ) ( ON ?auto_1812473 ?auto_1812475 ) ( CLEAR ?auto_1812473 ) ( not ( = ?auto_1812472 ?auto_1812475 ) ) ( not ( = ?auto_1812473 ?auto_1812475 ) ) ( not ( = ?auto_1812471 ?auto_1812475 ) ) ( TRUCK-AT ?auto_1812478 ?auto_1812479 ) ( SURFACE-AT ?auto_1812471 ?auto_1812479 ) ( CLEAR ?auto_1812471 ) ( IS-CRATE ?auto_1812472 ) ( AVAILABLE ?auto_1812477 ) ( IN ?auto_1812472 ?auto_1812478 ) ( ON ?auto_1812468 ?auto_1812467 ) ( ON ?auto_1812469 ?auto_1812468 ) ( ON ?auto_1812470 ?auto_1812469 ) ( ON ?auto_1812471 ?auto_1812470 ) ( not ( = ?auto_1812467 ?auto_1812468 ) ) ( not ( = ?auto_1812467 ?auto_1812469 ) ) ( not ( = ?auto_1812467 ?auto_1812470 ) ) ( not ( = ?auto_1812467 ?auto_1812471 ) ) ( not ( = ?auto_1812467 ?auto_1812472 ) ) ( not ( = ?auto_1812467 ?auto_1812473 ) ) ( not ( = ?auto_1812467 ?auto_1812475 ) ) ( not ( = ?auto_1812468 ?auto_1812469 ) ) ( not ( = ?auto_1812468 ?auto_1812470 ) ) ( not ( = ?auto_1812468 ?auto_1812471 ) ) ( not ( = ?auto_1812468 ?auto_1812472 ) ) ( not ( = ?auto_1812468 ?auto_1812473 ) ) ( not ( = ?auto_1812468 ?auto_1812475 ) ) ( not ( = ?auto_1812469 ?auto_1812470 ) ) ( not ( = ?auto_1812469 ?auto_1812471 ) ) ( not ( = ?auto_1812469 ?auto_1812472 ) ) ( not ( = ?auto_1812469 ?auto_1812473 ) ) ( not ( = ?auto_1812469 ?auto_1812475 ) ) ( not ( = ?auto_1812470 ?auto_1812471 ) ) ( not ( = ?auto_1812470 ?auto_1812472 ) ) ( not ( = ?auto_1812470 ?auto_1812473 ) ) ( not ( = ?auto_1812470 ?auto_1812475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812471 ?auto_1812472 ?auto_1812473 )
      ( MAKE-6CRATE-VERIFY ?auto_1812467 ?auto_1812468 ?auto_1812469 ?auto_1812470 ?auto_1812471 ?auto_1812472 ?auto_1812473 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814423 - SURFACE
      ?auto_1814424 - SURFACE
      ?auto_1814425 - SURFACE
      ?auto_1814426 - SURFACE
      ?auto_1814427 - SURFACE
      ?auto_1814428 - SURFACE
      ?auto_1814429 - SURFACE
      ?auto_1814430 - SURFACE
    )
    :vars
    (
      ?auto_1814432 - HOIST
      ?auto_1814431 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814432 ?auto_1814431 ) ( SURFACE-AT ?auto_1814429 ?auto_1814431 ) ( CLEAR ?auto_1814429 ) ( LIFTING ?auto_1814432 ?auto_1814430 ) ( IS-CRATE ?auto_1814430 ) ( not ( = ?auto_1814429 ?auto_1814430 ) ) ( ON ?auto_1814424 ?auto_1814423 ) ( ON ?auto_1814425 ?auto_1814424 ) ( ON ?auto_1814426 ?auto_1814425 ) ( ON ?auto_1814427 ?auto_1814426 ) ( ON ?auto_1814428 ?auto_1814427 ) ( ON ?auto_1814429 ?auto_1814428 ) ( not ( = ?auto_1814423 ?auto_1814424 ) ) ( not ( = ?auto_1814423 ?auto_1814425 ) ) ( not ( = ?auto_1814423 ?auto_1814426 ) ) ( not ( = ?auto_1814423 ?auto_1814427 ) ) ( not ( = ?auto_1814423 ?auto_1814428 ) ) ( not ( = ?auto_1814423 ?auto_1814429 ) ) ( not ( = ?auto_1814423 ?auto_1814430 ) ) ( not ( = ?auto_1814424 ?auto_1814425 ) ) ( not ( = ?auto_1814424 ?auto_1814426 ) ) ( not ( = ?auto_1814424 ?auto_1814427 ) ) ( not ( = ?auto_1814424 ?auto_1814428 ) ) ( not ( = ?auto_1814424 ?auto_1814429 ) ) ( not ( = ?auto_1814424 ?auto_1814430 ) ) ( not ( = ?auto_1814425 ?auto_1814426 ) ) ( not ( = ?auto_1814425 ?auto_1814427 ) ) ( not ( = ?auto_1814425 ?auto_1814428 ) ) ( not ( = ?auto_1814425 ?auto_1814429 ) ) ( not ( = ?auto_1814425 ?auto_1814430 ) ) ( not ( = ?auto_1814426 ?auto_1814427 ) ) ( not ( = ?auto_1814426 ?auto_1814428 ) ) ( not ( = ?auto_1814426 ?auto_1814429 ) ) ( not ( = ?auto_1814426 ?auto_1814430 ) ) ( not ( = ?auto_1814427 ?auto_1814428 ) ) ( not ( = ?auto_1814427 ?auto_1814429 ) ) ( not ( = ?auto_1814427 ?auto_1814430 ) ) ( not ( = ?auto_1814428 ?auto_1814429 ) ) ( not ( = ?auto_1814428 ?auto_1814430 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1814429 ?auto_1814430 )
      ( MAKE-7CRATE-VERIFY ?auto_1814423 ?auto_1814424 ?auto_1814425 ?auto_1814426 ?auto_1814427 ?auto_1814428 ?auto_1814429 ?auto_1814430 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814478 - SURFACE
      ?auto_1814479 - SURFACE
      ?auto_1814480 - SURFACE
      ?auto_1814481 - SURFACE
      ?auto_1814482 - SURFACE
      ?auto_1814483 - SURFACE
      ?auto_1814484 - SURFACE
      ?auto_1814485 - SURFACE
    )
    :vars
    (
      ?auto_1814487 - HOIST
      ?auto_1814488 - PLACE
      ?auto_1814486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814487 ?auto_1814488 ) ( SURFACE-AT ?auto_1814484 ?auto_1814488 ) ( CLEAR ?auto_1814484 ) ( IS-CRATE ?auto_1814485 ) ( not ( = ?auto_1814484 ?auto_1814485 ) ) ( TRUCK-AT ?auto_1814486 ?auto_1814488 ) ( AVAILABLE ?auto_1814487 ) ( IN ?auto_1814485 ?auto_1814486 ) ( ON ?auto_1814484 ?auto_1814483 ) ( not ( = ?auto_1814483 ?auto_1814484 ) ) ( not ( = ?auto_1814483 ?auto_1814485 ) ) ( ON ?auto_1814479 ?auto_1814478 ) ( ON ?auto_1814480 ?auto_1814479 ) ( ON ?auto_1814481 ?auto_1814480 ) ( ON ?auto_1814482 ?auto_1814481 ) ( ON ?auto_1814483 ?auto_1814482 ) ( not ( = ?auto_1814478 ?auto_1814479 ) ) ( not ( = ?auto_1814478 ?auto_1814480 ) ) ( not ( = ?auto_1814478 ?auto_1814481 ) ) ( not ( = ?auto_1814478 ?auto_1814482 ) ) ( not ( = ?auto_1814478 ?auto_1814483 ) ) ( not ( = ?auto_1814478 ?auto_1814484 ) ) ( not ( = ?auto_1814478 ?auto_1814485 ) ) ( not ( = ?auto_1814479 ?auto_1814480 ) ) ( not ( = ?auto_1814479 ?auto_1814481 ) ) ( not ( = ?auto_1814479 ?auto_1814482 ) ) ( not ( = ?auto_1814479 ?auto_1814483 ) ) ( not ( = ?auto_1814479 ?auto_1814484 ) ) ( not ( = ?auto_1814479 ?auto_1814485 ) ) ( not ( = ?auto_1814480 ?auto_1814481 ) ) ( not ( = ?auto_1814480 ?auto_1814482 ) ) ( not ( = ?auto_1814480 ?auto_1814483 ) ) ( not ( = ?auto_1814480 ?auto_1814484 ) ) ( not ( = ?auto_1814480 ?auto_1814485 ) ) ( not ( = ?auto_1814481 ?auto_1814482 ) ) ( not ( = ?auto_1814481 ?auto_1814483 ) ) ( not ( = ?auto_1814481 ?auto_1814484 ) ) ( not ( = ?auto_1814481 ?auto_1814485 ) ) ( not ( = ?auto_1814482 ?auto_1814483 ) ) ( not ( = ?auto_1814482 ?auto_1814484 ) ) ( not ( = ?auto_1814482 ?auto_1814485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814483 ?auto_1814484 ?auto_1814485 )
      ( MAKE-7CRATE-VERIFY ?auto_1814478 ?auto_1814479 ?auto_1814480 ?auto_1814481 ?auto_1814482 ?auto_1814483 ?auto_1814484 ?auto_1814485 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814541 - SURFACE
      ?auto_1814542 - SURFACE
      ?auto_1814543 - SURFACE
      ?auto_1814544 - SURFACE
      ?auto_1814545 - SURFACE
      ?auto_1814546 - SURFACE
      ?auto_1814547 - SURFACE
      ?auto_1814548 - SURFACE
    )
    :vars
    (
      ?auto_1814551 - HOIST
      ?auto_1814549 - PLACE
      ?auto_1814550 - TRUCK
      ?auto_1814552 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814551 ?auto_1814549 ) ( SURFACE-AT ?auto_1814547 ?auto_1814549 ) ( CLEAR ?auto_1814547 ) ( IS-CRATE ?auto_1814548 ) ( not ( = ?auto_1814547 ?auto_1814548 ) ) ( AVAILABLE ?auto_1814551 ) ( IN ?auto_1814548 ?auto_1814550 ) ( ON ?auto_1814547 ?auto_1814546 ) ( not ( = ?auto_1814546 ?auto_1814547 ) ) ( not ( = ?auto_1814546 ?auto_1814548 ) ) ( TRUCK-AT ?auto_1814550 ?auto_1814552 ) ( not ( = ?auto_1814552 ?auto_1814549 ) ) ( ON ?auto_1814542 ?auto_1814541 ) ( ON ?auto_1814543 ?auto_1814542 ) ( ON ?auto_1814544 ?auto_1814543 ) ( ON ?auto_1814545 ?auto_1814544 ) ( ON ?auto_1814546 ?auto_1814545 ) ( not ( = ?auto_1814541 ?auto_1814542 ) ) ( not ( = ?auto_1814541 ?auto_1814543 ) ) ( not ( = ?auto_1814541 ?auto_1814544 ) ) ( not ( = ?auto_1814541 ?auto_1814545 ) ) ( not ( = ?auto_1814541 ?auto_1814546 ) ) ( not ( = ?auto_1814541 ?auto_1814547 ) ) ( not ( = ?auto_1814541 ?auto_1814548 ) ) ( not ( = ?auto_1814542 ?auto_1814543 ) ) ( not ( = ?auto_1814542 ?auto_1814544 ) ) ( not ( = ?auto_1814542 ?auto_1814545 ) ) ( not ( = ?auto_1814542 ?auto_1814546 ) ) ( not ( = ?auto_1814542 ?auto_1814547 ) ) ( not ( = ?auto_1814542 ?auto_1814548 ) ) ( not ( = ?auto_1814543 ?auto_1814544 ) ) ( not ( = ?auto_1814543 ?auto_1814545 ) ) ( not ( = ?auto_1814543 ?auto_1814546 ) ) ( not ( = ?auto_1814543 ?auto_1814547 ) ) ( not ( = ?auto_1814543 ?auto_1814548 ) ) ( not ( = ?auto_1814544 ?auto_1814545 ) ) ( not ( = ?auto_1814544 ?auto_1814546 ) ) ( not ( = ?auto_1814544 ?auto_1814547 ) ) ( not ( = ?auto_1814544 ?auto_1814548 ) ) ( not ( = ?auto_1814545 ?auto_1814546 ) ) ( not ( = ?auto_1814545 ?auto_1814547 ) ) ( not ( = ?auto_1814545 ?auto_1814548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814546 ?auto_1814547 ?auto_1814548 )
      ( MAKE-7CRATE-VERIFY ?auto_1814541 ?auto_1814542 ?auto_1814543 ?auto_1814544 ?auto_1814545 ?auto_1814546 ?auto_1814547 ?auto_1814548 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814611 - SURFACE
      ?auto_1814612 - SURFACE
      ?auto_1814613 - SURFACE
      ?auto_1814614 - SURFACE
      ?auto_1814615 - SURFACE
      ?auto_1814616 - SURFACE
      ?auto_1814617 - SURFACE
      ?auto_1814618 - SURFACE
    )
    :vars
    (
      ?auto_1814622 - HOIST
      ?auto_1814620 - PLACE
      ?auto_1814621 - TRUCK
      ?auto_1814619 - PLACE
      ?auto_1814623 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814622 ?auto_1814620 ) ( SURFACE-AT ?auto_1814617 ?auto_1814620 ) ( CLEAR ?auto_1814617 ) ( IS-CRATE ?auto_1814618 ) ( not ( = ?auto_1814617 ?auto_1814618 ) ) ( AVAILABLE ?auto_1814622 ) ( ON ?auto_1814617 ?auto_1814616 ) ( not ( = ?auto_1814616 ?auto_1814617 ) ) ( not ( = ?auto_1814616 ?auto_1814618 ) ) ( TRUCK-AT ?auto_1814621 ?auto_1814619 ) ( not ( = ?auto_1814619 ?auto_1814620 ) ) ( HOIST-AT ?auto_1814623 ?auto_1814619 ) ( LIFTING ?auto_1814623 ?auto_1814618 ) ( not ( = ?auto_1814622 ?auto_1814623 ) ) ( ON ?auto_1814612 ?auto_1814611 ) ( ON ?auto_1814613 ?auto_1814612 ) ( ON ?auto_1814614 ?auto_1814613 ) ( ON ?auto_1814615 ?auto_1814614 ) ( ON ?auto_1814616 ?auto_1814615 ) ( not ( = ?auto_1814611 ?auto_1814612 ) ) ( not ( = ?auto_1814611 ?auto_1814613 ) ) ( not ( = ?auto_1814611 ?auto_1814614 ) ) ( not ( = ?auto_1814611 ?auto_1814615 ) ) ( not ( = ?auto_1814611 ?auto_1814616 ) ) ( not ( = ?auto_1814611 ?auto_1814617 ) ) ( not ( = ?auto_1814611 ?auto_1814618 ) ) ( not ( = ?auto_1814612 ?auto_1814613 ) ) ( not ( = ?auto_1814612 ?auto_1814614 ) ) ( not ( = ?auto_1814612 ?auto_1814615 ) ) ( not ( = ?auto_1814612 ?auto_1814616 ) ) ( not ( = ?auto_1814612 ?auto_1814617 ) ) ( not ( = ?auto_1814612 ?auto_1814618 ) ) ( not ( = ?auto_1814613 ?auto_1814614 ) ) ( not ( = ?auto_1814613 ?auto_1814615 ) ) ( not ( = ?auto_1814613 ?auto_1814616 ) ) ( not ( = ?auto_1814613 ?auto_1814617 ) ) ( not ( = ?auto_1814613 ?auto_1814618 ) ) ( not ( = ?auto_1814614 ?auto_1814615 ) ) ( not ( = ?auto_1814614 ?auto_1814616 ) ) ( not ( = ?auto_1814614 ?auto_1814617 ) ) ( not ( = ?auto_1814614 ?auto_1814618 ) ) ( not ( = ?auto_1814615 ?auto_1814616 ) ) ( not ( = ?auto_1814615 ?auto_1814617 ) ) ( not ( = ?auto_1814615 ?auto_1814618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814616 ?auto_1814617 ?auto_1814618 )
      ( MAKE-7CRATE-VERIFY ?auto_1814611 ?auto_1814612 ?auto_1814613 ?auto_1814614 ?auto_1814615 ?auto_1814616 ?auto_1814617 ?auto_1814618 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814688 - SURFACE
      ?auto_1814689 - SURFACE
      ?auto_1814690 - SURFACE
      ?auto_1814691 - SURFACE
      ?auto_1814692 - SURFACE
      ?auto_1814693 - SURFACE
      ?auto_1814694 - SURFACE
      ?auto_1814695 - SURFACE
    )
    :vars
    (
      ?auto_1814696 - HOIST
      ?auto_1814697 - PLACE
      ?auto_1814699 - TRUCK
      ?auto_1814700 - PLACE
      ?auto_1814698 - HOIST
      ?auto_1814701 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814696 ?auto_1814697 ) ( SURFACE-AT ?auto_1814694 ?auto_1814697 ) ( CLEAR ?auto_1814694 ) ( IS-CRATE ?auto_1814695 ) ( not ( = ?auto_1814694 ?auto_1814695 ) ) ( AVAILABLE ?auto_1814696 ) ( ON ?auto_1814694 ?auto_1814693 ) ( not ( = ?auto_1814693 ?auto_1814694 ) ) ( not ( = ?auto_1814693 ?auto_1814695 ) ) ( TRUCK-AT ?auto_1814699 ?auto_1814700 ) ( not ( = ?auto_1814700 ?auto_1814697 ) ) ( HOIST-AT ?auto_1814698 ?auto_1814700 ) ( not ( = ?auto_1814696 ?auto_1814698 ) ) ( AVAILABLE ?auto_1814698 ) ( SURFACE-AT ?auto_1814695 ?auto_1814700 ) ( ON ?auto_1814695 ?auto_1814701 ) ( CLEAR ?auto_1814695 ) ( not ( = ?auto_1814694 ?auto_1814701 ) ) ( not ( = ?auto_1814695 ?auto_1814701 ) ) ( not ( = ?auto_1814693 ?auto_1814701 ) ) ( ON ?auto_1814689 ?auto_1814688 ) ( ON ?auto_1814690 ?auto_1814689 ) ( ON ?auto_1814691 ?auto_1814690 ) ( ON ?auto_1814692 ?auto_1814691 ) ( ON ?auto_1814693 ?auto_1814692 ) ( not ( = ?auto_1814688 ?auto_1814689 ) ) ( not ( = ?auto_1814688 ?auto_1814690 ) ) ( not ( = ?auto_1814688 ?auto_1814691 ) ) ( not ( = ?auto_1814688 ?auto_1814692 ) ) ( not ( = ?auto_1814688 ?auto_1814693 ) ) ( not ( = ?auto_1814688 ?auto_1814694 ) ) ( not ( = ?auto_1814688 ?auto_1814695 ) ) ( not ( = ?auto_1814688 ?auto_1814701 ) ) ( not ( = ?auto_1814689 ?auto_1814690 ) ) ( not ( = ?auto_1814689 ?auto_1814691 ) ) ( not ( = ?auto_1814689 ?auto_1814692 ) ) ( not ( = ?auto_1814689 ?auto_1814693 ) ) ( not ( = ?auto_1814689 ?auto_1814694 ) ) ( not ( = ?auto_1814689 ?auto_1814695 ) ) ( not ( = ?auto_1814689 ?auto_1814701 ) ) ( not ( = ?auto_1814690 ?auto_1814691 ) ) ( not ( = ?auto_1814690 ?auto_1814692 ) ) ( not ( = ?auto_1814690 ?auto_1814693 ) ) ( not ( = ?auto_1814690 ?auto_1814694 ) ) ( not ( = ?auto_1814690 ?auto_1814695 ) ) ( not ( = ?auto_1814690 ?auto_1814701 ) ) ( not ( = ?auto_1814691 ?auto_1814692 ) ) ( not ( = ?auto_1814691 ?auto_1814693 ) ) ( not ( = ?auto_1814691 ?auto_1814694 ) ) ( not ( = ?auto_1814691 ?auto_1814695 ) ) ( not ( = ?auto_1814691 ?auto_1814701 ) ) ( not ( = ?auto_1814692 ?auto_1814693 ) ) ( not ( = ?auto_1814692 ?auto_1814694 ) ) ( not ( = ?auto_1814692 ?auto_1814695 ) ) ( not ( = ?auto_1814692 ?auto_1814701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814693 ?auto_1814694 ?auto_1814695 )
      ( MAKE-7CRATE-VERIFY ?auto_1814688 ?auto_1814689 ?auto_1814690 ?auto_1814691 ?auto_1814692 ?auto_1814693 ?auto_1814694 ?auto_1814695 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814766 - SURFACE
      ?auto_1814767 - SURFACE
      ?auto_1814768 - SURFACE
      ?auto_1814769 - SURFACE
      ?auto_1814770 - SURFACE
      ?auto_1814771 - SURFACE
      ?auto_1814772 - SURFACE
      ?auto_1814773 - SURFACE
    )
    :vars
    (
      ?auto_1814777 - HOIST
      ?auto_1814774 - PLACE
      ?auto_1814775 - PLACE
      ?auto_1814779 - HOIST
      ?auto_1814776 - SURFACE
      ?auto_1814778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814777 ?auto_1814774 ) ( SURFACE-AT ?auto_1814772 ?auto_1814774 ) ( CLEAR ?auto_1814772 ) ( IS-CRATE ?auto_1814773 ) ( not ( = ?auto_1814772 ?auto_1814773 ) ) ( AVAILABLE ?auto_1814777 ) ( ON ?auto_1814772 ?auto_1814771 ) ( not ( = ?auto_1814771 ?auto_1814772 ) ) ( not ( = ?auto_1814771 ?auto_1814773 ) ) ( not ( = ?auto_1814775 ?auto_1814774 ) ) ( HOIST-AT ?auto_1814779 ?auto_1814775 ) ( not ( = ?auto_1814777 ?auto_1814779 ) ) ( AVAILABLE ?auto_1814779 ) ( SURFACE-AT ?auto_1814773 ?auto_1814775 ) ( ON ?auto_1814773 ?auto_1814776 ) ( CLEAR ?auto_1814773 ) ( not ( = ?auto_1814772 ?auto_1814776 ) ) ( not ( = ?auto_1814773 ?auto_1814776 ) ) ( not ( = ?auto_1814771 ?auto_1814776 ) ) ( TRUCK-AT ?auto_1814778 ?auto_1814774 ) ( ON ?auto_1814767 ?auto_1814766 ) ( ON ?auto_1814768 ?auto_1814767 ) ( ON ?auto_1814769 ?auto_1814768 ) ( ON ?auto_1814770 ?auto_1814769 ) ( ON ?auto_1814771 ?auto_1814770 ) ( not ( = ?auto_1814766 ?auto_1814767 ) ) ( not ( = ?auto_1814766 ?auto_1814768 ) ) ( not ( = ?auto_1814766 ?auto_1814769 ) ) ( not ( = ?auto_1814766 ?auto_1814770 ) ) ( not ( = ?auto_1814766 ?auto_1814771 ) ) ( not ( = ?auto_1814766 ?auto_1814772 ) ) ( not ( = ?auto_1814766 ?auto_1814773 ) ) ( not ( = ?auto_1814766 ?auto_1814776 ) ) ( not ( = ?auto_1814767 ?auto_1814768 ) ) ( not ( = ?auto_1814767 ?auto_1814769 ) ) ( not ( = ?auto_1814767 ?auto_1814770 ) ) ( not ( = ?auto_1814767 ?auto_1814771 ) ) ( not ( = ?auto_1814767 ?auto_1814772 ) ) ( not ( = ?auto_1814767 ?auto_1814773 ) ) ( not ( = ?auto_1814767 ?auto_1814776 ) ) ( not ( = ?auto_1814768 ?auto_1814769 ) ) ( not ( = ?auto_1814768 ?auto_1814770 ) ) ( not ( = ?auto_1814768 ?auto_1814771 ) ) ( not ( = ?auto_1814768 ?auto_1814772 ) ) ( not ( = ?auto_1814768 ?auto_1814773 ) ) ( not ( = ?auto_1814768 ?auto_1814776 ) ) ( not ( = ?auto_1814769 ?auto_1814770 ) ) ( not ( = ?auto_1814769 ?auto_1814771 ) ) ( not ( = ?auto_1814769 ?auto_1814772 ) ) ( not ( = ?auto_1814769 ?auto_1814773 ) ) ( not ( = ?auto_1814769 ?auto_1814776 ) ) ( not ( = ?auto_1814770 ?auto_1814771 ) ) ( not ( = ?auto_1814770 ?auto_1814772 ) ) ( not ( = ?auto_1814770 ?auto_1814773 ) ) ( not ( = ?auto_1814770 ?auto_1814776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814771 ?auto_1814772 ?auto_1814773 )
      ( MAKE-7CRATE-VERIFY ?auto_1814766 ?auto_1814767 ?auto_1814768 ?auto_1814769 ?auto_1814770 ?auto_1814771 ?auto_1814772 ?auto_1814773 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814844 - SURFACE
      ?auto_1814845 - SURFACE
      ?auto_1814846 - SURFACE
      ?auto_1814847 - SURFACE
      ?auto_1814848 - SURFACE
      ?auto_1814849 - SURFACE
      ?auto_1814850 - SURFACE
      ?auto_1814851 - SURFACE
    )
    :vars
    (
      ?auto_1814852 - HOIST
      ?auto_1814857 - PLACE
      ?auto_1814856 - PLACE
      ?auto_1814853 - HOIST
      ?auto_1814854 - SURFACE
      ?auto_1814855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814852 ?auto_1814857 ) ( IS-CRATE ?auto_1814851 ) ( not ( = ?auto_1814850 ?auto_1814851 ) ) ( not ( = ?auto_1814849 ?auto_1814850 ) ) ( not ( = ?auto_1814849 ?auto_1814851 ) ) ( not ( = ?auto_1814856 ?auto_1814857 ) ) ( HOIST-AT ?auto_1814853 ?auto_1814856 ) ( not ( = ?auto_1814852 ?auto_1814853 ) ) ( AVAILABLE ?auto_1814853 ) ( SURFACE-AT ?auto_1814851 ?auto_1814856 ) ( ON ?auto_1814851 ?auto_1814854 ) ( CLEAR ?auto_1814851 ) ( not ( = ?auto_1814850 ?auto_1814854 ) ) ( not ( = ?auto_1814851 ?auto_1814854 ) ) ( not ( = ?auto_1814849 ?auto_1814854 ) ) ( TRUCK-AT ?auto_1814855 ?auto_1814857 ) ( SURFACE-AT ?auto_1814849 ?auto_1814857 ) ( CLEAR ?auto_1814849 ) ( LIFTING ?auto_1814852 ?auto_1814850 ) ( IS-CRATE ?auto_1814850 ) ( ON ?auto_1814845 ?auto_1814844 ) ( ON ?auto_1814846 ?auto_1814845 ) ( ON ?auto_1814847 ?auto_1814846 ) ( ON ?auto_1814848 ?auto_1814847 ) ( ON ?auto_1814849 ?auto_1814848 ) ( not ( = ?auto_1814844 ?auto_1814845 ) ) ( not ( = ?auto_1814844 ?auto_1814846 ) ) ( not ( = ?auto_1814844 ?auto_1814847 ) ) ( not ( = ?auto_1814844 ?auto_1814848 ) ) ( not ( = ?auto_1814844 ?auto_1814849 ) ) ( not ( = ?auto_1814844 ?auto_1814850 ) ) ( not ( = ?auto_1814844 ?auto_1814851 ) ) ( not ( = ?auto_1814844 ?auto_1814854 ) ) ( not ( = ?auto_1814845 ?auto_1814846 ) ) ( not ( = ?auto_1814845 ?auto_1814847 ) ) ( not ( = ?auto_1814845 ?auto_1814848 ) ) ( not ( = ?auto_1814845 ?auto_1814849 ) ) ( not ( = ?auto_1814845 ?auto_1814850 ) ) ( not ( = ?auto_1814845 ?auto_1814851 ) ) ( not ( = ?auto_1814845 ?auto_1814854 ) ) ( not ( = ?auto_1814846 ?auto_1814847 ) ) ( not ( = ?auto_1814846 ?auto_1814848 ) ) ( not ( = ?auto_1814846 ?auto_1814849 ) ) ( not ( = ?auto_1814846 ?auto_1814850 ) ) ( not ( = ?auto_1814846 ?auto_1814851 ) ) ( not ( = ?auto_1814846 ?auto_1814854 ) ) ( not ( = ?auto_1814847 ?auto_1814848 ) ) ( not ( = ?auto_1814847 ?auto_1814849 ) ) ( not ( = ?auto_1814847 ?auto_1814850 ) ) ( not ( = ?auto_1814847 ?auto_1814851 ) ) ( not ( = ?auto_1814847 ?auto_1814854 ) ) ( not ( = ?auto_1814848 ?auto_1814849 ) ) ( not ( = ?auto_1814848 ?auto_1814850 ) ) ( not ( = ?auto_1814848 ?auto_1814851 ) ) ( not ( = ?auto_1814848 ?auto_1814854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814849 ?auto_1814850 ?auto_1814851 )
      ( MAKE-7CRATE-VERIFY ?auto_1814844 ?auto_1814845 ?auto_1814846 ?auto_1814847 ?auto_1814848 ?auto_1814849 ?auto_1814850 ?auto_1814851 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814922 - SURFACE
      ?auto_1814923 - SURFACE
      ?auto_1814924 - SURFACE
      ?auto_1814925 - SURFACE
      ?auto_1814926 - SURFACE
      ?auto_1814927 - SURFACE
      ?auto_1814928 - SURFACE
      ?auto_1814929 - SURFACE
    )
    :vars
    (
      ?auto_1814932 - HOIST
      ?auto_1814933 - PLACE
      ?auto_1814930 - PLACE
      ?auto_1814935 - HOIST
      ?auto_1814934 - SURFACE
      ?auto_1814931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814932 ?auto_1814933 ) ( IS-CRATE ?auto_1814929 ) ( not ( = ?auto_1814928 ?auto_1814929 ) ) ( not ( = ?auto_1814927 ?auto_1814928 ) ) ( not ( = ?auto_1814927 ?auto_1814929 ) ) ( not ( = ?auto_1814930 ?auto_1814933 ) ) ( HOIST-AT ?auto_1814935 ?auto_1814930 ) ( not ( = ?auto_1814932 ?auto_1814935 ) ) ( AVAILABLE ?auto_1814935 ) ( SURFACE-AT ?auto_1814929 ?auto_1814930 ) ( ON ?auto_1814929 ?auto_1814934 ) ( CLEAR ?auto_1814929 ) ( not ( = ?auto_1814928 ?auto_1814934 ) ) ( not ( = ?auto_1814929 ?auto_1814934 ) ) ( not ( = ?auto_1814927 ?auto_1814934 ) ) ( TRUCK-AT ?auto_1814931 ?auto_1814933 ) ( SURFACE-AT ?auto_1814927 ?auto_1814933 ) ( CLEAR ?auto_1814927 ) ( IS-CRATE ?auto_1814928 ) ( AVAILABLE ?auto_1814932 ) ( IN ?auto_1814928 ?auto_1814931 ) ( ON ?auto_1814923 ?auto_1814922 ) ( ON ?auto_1814924 ?auto_1814923 ) ( ON ?auto_1814925 ?auto_1814924 ) ( ON ?auto_1814926 ?auto_1814925 ) ( ON ?auto_1814927 ?auto_1814926 ) ( not ( = ?auto_1814922 ?auto_1814923 ) ) ( not ( = ?auto_1814922 ?auto_1814924 ) ) ( not ( = ?auto_1814922 ?auto_1814925 ) ) ( not ( = ?auto_1814922 ?auto_1814926 ) ) ( not ( = ?auto_1814922 ?auto_1814927 ) ) ( not ( = ?auto_1814922 ?auto_1814928 ) ) ( not ( = ?auto_1814922 ?auto_1814929 ) ) ( not ( = ?auto_1814922 ?auto_1814934 ) ) ( not ( = ?auto_1814923 ?auto_1814924 ) ) ( not ( = ?auto_1814923 ?auto_1814925 ) ) ( not ( = ?auto_1814923 ?auto_1814926 ) ) ( not ( = ?auto_1814923 ?auto_1814927 ) ) ( not ( = ?auto_1814923 ?auto_1814928 ) ) ( not ( = ?auto_1814923 ?auto_1814929 ) ) ( not ( = ?auto_1814923 ?auto_1814934 ) ) ( not ( = ?auto_1814924 ?auto_1814925 ) ) ( not ( = ?auto_1814924 ?auto_1814926 ) ) ( not ( = ?auto_1814924 ?auto_1814927 ) ) ( not ( = ?auto_1814924 ?auto_1814928 ) ) ( not ( = ?auto_1814924 ?auto_1814929 ) ) ( not ( = ?auto_1814924 ?auto_1814934 ) ) ( not ( = ?auto_1814925 ?auto_1814926 ) ) ( not ( = ?auto_1814925 ?auto_1814927 ) ) ( not ( = ?auto_1814925 ?auto_1814928 ) ) ( not ( = ?auto_1814925 ?auto_1814929 ) ) ( not ( = ?auto_1814925 ?auto_1814934 ) ) ( not ( = ?auto_1814926 ?auto_1814927 ) ) ( not ( = ?auto_1814926 ?auto_1814928 ) ) ( not ( = ?auto_1814926 ?auto_1814929 ) ) ( not ( = ?auto_1814926 ?auto_1814934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814927 ?auto_1814928 ?auto_1814929 )
      ( MAKE-7CRATE-VERIFY ?auto_1814922 ?auto_1814923 ?auto_1814924 ?auto_1814925 ?auto_1814926 ?auto_1814927 ?auto_1814928 ?auto_1814929 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1817841 - SURFACE
      ?auto_1817842 - SURFACE
      ?auto_1817843 - SURFACE
      ?auto_1817844 - SURFACE
      ?auto_1817845 - SURFACE
      ?auto_1817846 - SURFACE
      ?auto_1817847 - SURFACE
      ?auto_1817848 - SURFACE
      ?auto_1817849 - SURFACE
    )
    :vars
    (
      ?auto_1817851 - HOIST
      ?auto_1817850 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1817851 ?auto_1817850 ) ( SURFACE-AT ?auto_1817848 ?auto_1817850 ) ( CLEAR ?auto_1817848 ) ( LIFTING ?auto_1817851 ?auto_1817849 ) ( IS-CRATE ?auto_1817849 ) ( not ( = ?auto_1817848 ?auto_1817849 ) ) ( ON ?auto_1817842 ?auto_1817841 ) ( ON ?auto_1817843 ?auto_1817842 ) ( ON ?auto_1817844 ?auto_1817843 ) ( ON ?auto_1817845 ?auto_1817844 ) ( ON ?auto_1817846 ?auto_1817845 ) ( ON ?auto_1817847 ?auto_1817846 ) ( ON ?auto_1817848 ?auto_1817847 ) ( not ( = ?auto_1817841 ?auto_1817842 ) ) ( not ( = ?auto_1817841 ?auto_1817843 ) ) ( not ( = ?auto_1817841 ?auto_1817844 ) ) ( not ( = ?auto_1817841 ?auto_1817845 ) ) ( not ( = ?auto_1817841 ?auto_1817846 ) ) ( not ( = ?auto_1817841 ?auto_1817847 ) ) ( not ( = ?auto_1817841 ?auto_1817848 ) ) ( not ( = ?auto_1817841 ?auto_1817849 ) ) ( not ( = ?auto_1817842 ?auto_1817843 ) ) ( not ( = ?auto_1817842 ?auto_1817844 ) ) ( not ( = ?auto_1817842 ?auto_1817845 ) ) ( not ( = ?auto_1817842 ?auto_1817846 ) ) ( not ( = ?auto_1817842 ?auto_1817847 ) ) ( not ( = ?auto_1817842 ?auto_1817848 ) ) ( not ( = ?auto_1817842 ?auto_1817849 ) ) ( not ( = ?auto_1817843 ?auto_1817844 ) ) ( not ( = ?auto_1817843 ?auto_1817845 ) ) ( not ( = ?auto_1817843 ?auto_1817846 ) ) ( not ( = ?auto_1817843 ?auto_1817847 ) ) ( not ( = ?auto_1817843 ?auto_1817848 ) ) ( not ( = ?auto_1817843 ?auto_1817849 ) ) ( not ( = ?auto_1817844 ?auto_1817845 ) ) ( not ( = ?auto_1817844 ?auto_1817846 ) ) ( not ( = ?auto_1817844 ?auto_1817847 ) ) ( not ( = ?auto_1817844 ?auto_1817848 ) ) ( not ( = ?auto_1817844 ?auto_1817849 ) ) ( not ( = ?auto_1817845 ?auto_1817846 ) ) ( not ( = ?auto_1817845 ?auto_1817847 ) ) ( not ( = ?auto_1817845 ?auto_1817848 ) ) ( not ( = ?auto_1817845 ?auto_1817849 ) ) ( not ( = ?auto_1817846 ?auto_1817847 ) ) ( not ( = ?auto_1817846 ?auto_1817848 ) ) ( not ( = ?auto_1817846 ?auto_1817849 ) ) ( not ( = ?auto_1817847 ?auto_1817848 ) ) ( not ( = ?auto_1817847 ?auto_1817849 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1817848 ?auto_1817849 )
      ( MAKE-8CRATE-VERIFY ?auto_1817841 ?auto_1817842 ?auto_1817843 ?auto_1817844 ?auto_1817845 ?auto_1817846 ?auto_1817847 ?auto_1817848 ?auto_1817849 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1817908 - SURFACE
      ?auto_1817909 - SURFACE
      ?auto_1817910 - SURFACE
      ?auto_1817911 - SURFACE
      ?auto_1817912 - SURFACE
      ?auto_1817913 - SURFACE
      ?auto_1817914 - SURFACE
      ?auto_1817915 - SURFACE
      ?auto_1817916 - SURFACE
    )
    :vars
    (
      ?auto_1817917 - HOIST
      ?auto_1817918 - PLACE
      ?auto_1817919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1817917 ?auto_1817918 ) ( SURFACE-AT ?auto_1817915 ?auto_1817918 ) ( CLEAR ?auto_1817915 ) ( IS-CRATE ?auto_1817916 ) ( not ( = ?auto_1817915 ?auto_1817916 ) ) ( TRUCK-AT ?auto_1817919 ?auto_1817918 ) ( AVAILABLE ?auto_1817917 ) ( IN ?auto_1817916 ?auto_1817919 ) ( ON ?auto_1817915 ?auto_1817914 ) ( not ( = ?auto_1817914 ?auto_1817915 ) ) ( not ( = ?auto_1817914 ?auto_1817916 ) ) ( ON ?auto_1817909 ?auto_1817908 ) ( ON ?auto_1817910 ?auto_1817909 ) ( ON ?auto_1817911 ?auto_1817910 ) ( ON ?auto_1817912 ?auto_1817911 ) ( ON ?auto_1817913 ?auto_1817912 ) ( ON ?auto_1817914 ?auto_1817913 ) ( not ( = ?auto_1817908 ?auto_1817909 ) ) ( not ( = ?auto_1817908 ?auto_1817910 ) ) ( not ( = ?auto_1817908 ?auto_1817911 ) ) ( not ( = ?auto_1817908 ?auto_1817912 ) ) ( not ( = ?auto_1817908 ?auto_1817913 ) ) ( not ( = ?auto_1817908 ?auto_1817914 ) ) ( not ( = ?auto_1817908 ?auto_1817915 ) ) ( not ( = ?auto_1817908 ?auto_1817916 ) ) ( not ( = ?auto_1817909 ?auto_1817910 ) ) ( not ( = ?auto_1817909 ?auto_1817911 ) ) ( not ( = ?auto_1817909 ?auto_1817912 ) ) ( not ( = ?auto_1817909 ?auto_1817913 ) ) ( not ( = ?auto_1817909 ?auto_1817914 ) ) ( not ( = ?auto_1817909 ?auto_1817915 ) ) ( not ( = ?auto_1817909 ?auto_1817916 ) ) ( not ( = ?auto_1817910 ?auto_1817911 ) ) ( not ( = ?auto_1817910 ?auto_1817912 ) ) ( not ( = ?auto_1817910 ?auto_1817913 ) ) ( not ( = ?auto_1817910 ?auto_1817914 ) ) ( not ( = ?auto_1817910 ?auto_1817915 ) ) ( not ( = ?auto_1817910 ?auto_1817916 ) ) ( not ( = ?auto_1817911 ?auto_1817912 ) ) ( not ( = ?auto_1817911 ?auto_1817913 ) ) ( not ( = ?auto_1817911 ?auto_1817914 ) ) ( not ( = ?auto_1817911 ?auto_1817915 ) ) ( not ( = ?auto_1817911 ?auto_1817916 ) ) ( not ( = ?auto_1817912 ?auto_1817913 ) ) ( not ( = ?auto_1817912 ?auto_1817914 ) ) ( not ( = ?auto_1817912 ?auto_1817915 ) ) ( not ( = ?auto_1817912 ?auto_1817916 ) ) ( not ( = ?auto_1817913 ?auto_1817914 ) ) ( not ( = ?auto_1817913 ?auto_1817915 ) ) ( not ( = ?auto_1817913 ?auto_1817916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1817914 ?auto_1817915 ?auto_1817916 )
      ( MAKE-8CRATE-VERIFY ?auto_1817908 ?auto_1817909 ?auto_1817910 ?auto_1817911 ?auto_1817912 ?auto_1817913 ?auto_1817914 ?auto_1817915 ?auto_1817916 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1817984 - SURFACE
      ?auto_1817985 - SURFACE
      ?auto_1817986 - SURFACE
      ?auto_1817987 - SURFACE
      ?auto_1817988 - SURFACE
      ?auto_1817989 - SURFACE
      ?auto_1817990 - SURFACE
      ?auto_1817991 - SURFACE
      ?auto_1817992 - SURFACE
    )
    :vars
    (
      ?auto_1817995 - HOIST
      ?auto_1817993 - PLACE
      ?auto_1817994 - TRUCK
      ?auto_1817996 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1817995 ?auto_1817993 ) ( SURFACE-AT ?auto_1817991 ?auto_1817993 ) ( CLEAR ?auto_1817991 ) ( IS-CRATE ?auto_1817992 ) ( not ( = ?auto_1817991 ?auto_1817992 ) ) ( AVAILABLE ?auto_1817995 ) ( IN ?auto_1817992 ?auto_1817994 ) ( ON ?auto_1817991 ?auto_1817990 ) ( not ( = ?auto_1817990 ?auto_1817991 ) ) ( not ( = ?auto_1817990 ?auto_1817992 ) ) ( TRUCK-AT ?auto_1817994 ?auto_1817996 ) ( not ( = ?auto_1817996 ?auto_1817993 ) ) ( ON ?auto_1817985 ?auto_1817984 ) ( ON ?auto_1817986 ?auto_1817985 ) ( ON ?auto_1817987 ?auto_1817986 ) ( ON ?auto_1817988 ?auto_1817987 ) ( ON ?auto_1817989 ?auto_1817988 ) ( ON ?auto_1817990 ?auto_1817989 ) ( not ( = ?auto_1817984 ?auto_1817985 ) ) ( not ( = ?auto_1817984 ?auto_1817986 ) ) ( not ( = ?auto_1817984 ?auto_1817987 ) ) ( not ( = ?auto_1817984 ?auto_1817988 ) ) ( not ( = ?auto_1817984 ?auto_1817989 ) ) ( not ( = ?auto_1817984 ?auto_1817990 ) ) ( not ( = ?auto_1817984 ?auto_1817991 ) ) ( not ( = ?auto_1817984 ?auto_1817992 ) ) ( not ( = ?auto_1817985 ?auto_1817986 ) ) ( not ( = ?auto_1817985 ?auto_1817987 ) ) ( not ( = ?auto_1817985 ?auto_1817988 ) ) ( not ( = ?auto_1817985 ?auto_1817989 ) ) ( not ( = ?auto_1817985 ?auto_1817990 ) ) ( not ( = ?auto_1817985 ?auto_1817991 ) ) ( not ( = ?auto_1817985 ?auto_1817992 ) ) ( not ( = ?auto_1817986 ?auto_1817987 ) ) ( not ( = ?auto_1817986 ?auto_1817988 ) ) ( not ( = ?auto_1817986 ?auto_1817989 ) ) ( not ( = ?auto_1817986 ?auto_1817990 ) ) ( not ( = ?auto_1817986 ?auto_1817991 ) ) ( not ( = ?auto_1817986 ?auto_1817992 ) ) ( not ( = ?auto_1817987 ?auto_1817988 ) ) ( not ( = ?auto_1817987 ?auto_1817989 ) ) ( not ( = ?auto_1817987 ?auto_1817990 ) ) ( not ( = ?auto_1817987 ?auto_1817991 ) ) ( not ( = ?auto_1817987 ?auto_1817992 ) ) ( not ( = ?auto_1817988 ?auto_1817989 ) ) ( not ( = ?auto_1817988 ?auto_1817990 ) ) ( not ( = ?auto_1817988 ?auto_1817991 ) ) ( not ( = ?auto_1817988 ?auto_1817992 ) ) ( not ( = ?auto_1817989 ?auto_1817990 ) ) ( not ( = ?auto_1817989 ?auto_1817991 ) ) ( not ( = ?auto_1817989 ?auto_1817992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1817990 ?auto_1817991 ?auto_1817992 )
      ( MAKE-8CRATE-VERIFY ?auto_1817984 ?auto_1817985 ?auto_1817986 ?auto_1817987 ?auto_1817988 ?auto_1817989 ?auto_1817990 ?auto_1817991 ?auto_1817992 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818068 - SURFACE
      ?auto_1818069 - SURFACE
      ?auto_1818070 - SURFACE
      ?auto_1818071 - SURFACE
      ?auto_1818072 - SURFACE
      ?auto_1818073 - SURFACE
      ?auto_1818074 - SURFACE
      ?auto_1818075 - SURFACE
      ?auto_1818076 - SURFACE
    )
    :vars
    (
      ?auto_1818078 - HOIST
      ?auto_1818077 - PLACE
      ?auto_1818079 - TRUCK
      ?auto_1818081 - PLACE
      ?auto_1818080 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818078 ?auto_1818077 ) ( SURFACE-AT ?auto_1818075 ?auto_1818077 ) ( CLEAR ?auto_1818075 ) ( IS-CRATE ?auto_1818076 ) ( not ( = ?auto_1818075 ?auto_1818076 ) ) ( AVAILABLE ?auto_1818078 ) ( ON ?auto_1818075 ?auto_1818074 ) ( not ( = ?auto_1818074 ?auto_1818075 ) ) ( not ( = ?auto_1818074 ?auto_1818076 ) ) ( TRUCK-AT ?auto_1818079 ?auto_1818081 ) ( not ( = ?auto_1818081 ?auto_1818077 ) ) ( HOIST-AT ?auto_1818080 ?auto_1818081 ) ( LIFTING ?auto_1818080 ?auto_1818076 ) ( not ( = ?auto_1818078 ?auto_1818080 ) ) ( ON ?auto_1818069 ?auto_1818068 ) ( ON ?auto_1818070 ?auto_1818069 ) ( ON ?auto_1818071 ?auto_1818070 ) ( ON ?auto_1818072 ?auto_1818071 ) ( ON ?auto_1818073 ?auto_1818072 ) ( ON ?auto_1818074 ?auto_1818073 ) ( not ( = ?auto_1818068 ?auto_1818069 ) ) ( not ( = ?auto_1818068 ?auto_1818070 ) ) ( not ( = ?auto_1818068 ?auto_1818071 ) ) ( not ( = ?auto_1818068 ?auto_1818072 ) ) ( not ( = ?auto_1818068 ?auto_1818073 ) ) ( not ( = ?auto_1818068 ?auto_1818074 ) ) ( not ( = ?auto_1818068 ?auto_1818075 ) ) ( not ( = ?auto_1818068 ?auto_1818076 ) ) ( not ( = ?auto_1818069 ?auto_1818070 ) ) ( not ( = ?auto_1818069 ?auto_1818071 ) ) ( not ( = ?auto_1818069 ?auto_1818072 ) ) ( not ( = ?auto_1818069 ?auto_1818073 ) ) ( not ( = ?auto_1818069 ?auto_1818074 ) ) ( not ( = ?auto_1818069 ?auto_1818075 ) ) ( not ( = ?auto_1818069 ?auto_1818076 ) ) ( not ( = ?auto_1818070 ?auto_1818071 ) ) ( not ( = ?auto_1818070 ?auto_1818072 ) ) ( not ( = ?auto_1818070 ?auto_1818073 ) ) ( not ( = ?auto_1818070 ?auto_1818074 ) ) ( not ( = ?auto_1818070 ?auto_1818075 ) ) ( not ( = ?auto_1818070 ?auto_1818076 ) ) ( not ( = ?auto_1818071 ?auto_1818072 ) ) ( not ( = ?auto_1818071 ?auto_1818073 ) ) ( not ( = ?auto_1818071 ?auto_1818074 ) ) ( not ( = ?auto_1818071 ?auto_1818075 ) ) ( not ( = ?auto_1818071 ?auto_1818076 ) ) ( not ( = ?auto_1818072 ?auto_1818073 ) ) ( not ( = ?auto_1818072 ?auto_1818074 ) ) ( not ( = ?auto_1818072 ?auto_1818075 ) ) ( not ( = ?auto_1818072 ?auto_1818076 ) ) ( not ( = ?auto_1818073 ?auto_1818074 ) ) ( not ( = ?auto_1818073 ?auto_1818075 ) ) ( not ( = ?auto_1818073 ?auto_1818076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818074 ?auto_1818075 ?auto_1818076 )
      ( MAKE-8CRATE-VERIFY ?auto_1818068 ?auto_1818069 ?auto_1818070 ?auto_1818071 ?auto_1818072 ?auto_1818073 ?auto_1818074 ?auto_1818075 ?auto_1818076 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818160 - SURFACE
      ?auto_1818161 - SURFACE
      ?auto_1818162 - SURFACE
      ?auto_1818163 - SURFACE
      ?auto_1818164 - SURFACE
      ?auto_1818165 - SURFACE
      ?auto_1818166 - SURFACE
      ?auto_1818167 - SURFACE
      ?auto_1818168 - SURFACE
    )
    :vars
    (
      ?auto_1818172 - HOIST
      ?auto_1818174 - PLACE
      ?auto_1818170 - TRUCK
      ?auto_1818173 - PLACE
      ?auto_1818171 - HOIST
      ?auto_1818169 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818172 ?auto_1818174 ) ( SURFACE-AT ?auto_1818167 ?auto_1818174 ) ( CLEAR ?auto_1818167 ) ( IS-CRATE ?auto_1818168 ) ( not ( = ?auto_1818167 ?auto_1818168 ) ) ( AVAILABLE ?auto_1818172 ) ( ON ?auto_1818167 ?auto_1818166 ) ( not ( = ?auto_1818166 ?auto_1818167 ) ) ( not ( = ?auto_1818166 ?auto_1818168 ) ) ( TRUCK-AT ?auto_1818170 ?auto_1818173 ) ( not ( = ?auto_1818173 ?auto_1818174 ) ) ( HOIST-AT ?auto_1818171 ?auto_1818173 ) ( not ( = ?auto_1818172 ?auto_1818171 ) ) ( AVAILABLE ?auto_1818171 ) ( SURFACE-AT ?auto_1818168 ?auto_1818173 ) ( ON ?auto_1818168 ?auto_1818169 ) ( CLEAR ?auto_1818168 ) ( not ( = ?auto_1818167 ?auto_1818169 ) ) ( not ( = ?auto_1818168 ?auto_1818169 ) ) ( not ( = ?auto_1818166 ?auto_1818169 ) ) ( ON ?auto_1818161 ?auto_1818160 ) ( ON ?auto_1818162 ?auto_1818161 ) ( ON ?auto_1818163 ?auto_1818162 ) ( ON ?auto_1818164 ?auto_1818163 ) ( ON ?auto_1818165 ?auto_1818164 ) ( ON ?auto_1818166 ?auto_1818165 ) ( not ( = ?auto_1818160 ?auto_1818161 ) ) ( not ( = ?auto_1818160 ?auto_1818162 ) ) ( not ( = ?auto_1818160 ?auto_1818163 ) ) ( not ( = ?auto_1818160 ?auto_1818164 ) ) ( not ( = ?auto_1818160 ?auto_1818165 ) ) ( not ( = ?auto_1818160 ?auto_1818166 ) ) ( not ( = ?auto_1818160 ?auto_1818167 ) ) ( not ( = ?auto_1818160 ?auto_1818168 ) ) ( not ( = ?auto_1818160 ?auto_1818169 ) ) ( not ( = ?auto_1818161 ?auto_1818162 ) ) ( not ( = ?auto_1818161 ?auto_1818163 ) ) ( not ( = ?auto_1818161 ?auto_1818164 ) ) ( not ( = ?auto_1818161 ?auto_1818165 ) ) ( not ( = ?auto_1818161 ?auto_1818166 ) ) ( not ( = ?auto_1818161 ?auto_1818167 ) ) ( not ( = ?auto_1818161 ?auto_1818168 ) ) ( not ( = ?auto_1818161 ?auto_1818169 ) ) ( not ( = ?auto_1818162 ?auto_1818163 ) ) ( not ( = ?auto_1818162 ?auto_1818164 ) ) ( not ( = ?auto_1818162 ?auto_1818165 ) ) ( not ( = ?auto_1818162 ?auto_1818166 ) ) ( not ( = ?auto_1818162 ?auto_1818167 ) ) ( not ( = ?auto_1818162 ?auto_1818168 ) ) ( not ( = ?auto_1818162 ?auto_1818169 ) ) ( not ( = ?auto_1818163 ?auto_1818164 ) ) ( not ( = ?auto_1818163 ?auto_1818165 ) ) ( not ( = ?auto_1818163 ?auto_1818166 ) ) ( not ( = ?auto_1818163 ?auto_1818167 ) ) ( not ( = ?auto_1818163 ?auto_1818168 ) ) ( not ( = ?auto_1818163 ?auto_1818169 ) ) ( not ( = ?auto_1818164 ?auto_1818165 ) ) ( not ( = ?auto_1818164 ?auto_1818166 ) ) ( not ( = ?auto_1818164 ?auto_1818167 ) ) ( not ( = ?auto_1818164 ?auto_1818168 ) ) ( not ( = ?auto_1818164 ?auto_1818169 ) ) ( not ( = ?auto_1818165 ?auto_1818166 ) ) ( not ( = ?auto_1818165 ?auto_1818167 ) ) ( not ( = ?auto_1818165 ?auto_1818168 ) ) ( not ( = ?auto_1818165 ?auto_1818169 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818166 ?auto_1818167 ?auto_1818168 )
      ( MAKE-8CRATE-VERIFY ?auto_1818160 ?auto_1818161 ?auto_1818162 ?auto_1818163 ?auto_1818164 ?auto_1818165 ?auto_1818166 ?auto_1818167 ?auto_1818168 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818253 - SURFACE
      ?auto_1818254 - SURFACE
      ?auto_1818255 - SURFACE
      ?auto_1818256 - SURFACE
      ?auto_1818257 - SURFACE
      ?auto_1818258 - SURFACE
      ?auto_1818259 - SURFACE
      ?auto_1818260 - SURFACE
      ?auto_1818261 - SURFACE
    )
    :vars
    (
      ?auto_1818264 - HOIST
      ?auto_1818266 - PLACE
      ?auto_1818265 - PLACE
      ?auto_1818267 - HOIST
      ?auto_1818263 - SURFACE
      ?auto_1818262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818264 ?auto_1818266 ) ( SURFACE-AT ?auto_1818260 ?auto_1818266 ) ( CLEAR ?auto_1818260 ) ( IS-CRATE ?auto_1818261 ) ( not ( = ?auto_1818260 ?auto_1818261 ) ) ( AVAILABLE ?auto_1818264 ) ( ON ?auto_1818260 ?auto_1818259 ) ( not ( = ?auto_1818259 ?auto_1818260 ) ) ( not ( = ?auto_1818259 ?auto_1818261 ) ) ( not ( = ?auto_1818265 ?auto_1818266 ) ) ( HOIST-AT ?auto_1818267 ?auto_1818265 ) ( not ( = ?auto_1818264 ?auto_1818267 ) ) ( AVAILABLE ?auto_1818267 ) ( SURFACE-AT ?auto_1818261 ?auto_1818265 ) ( ON ?auto_1818261 ?auto_1818263 ) ( CLEAR ?auto_1818261 ) ( not ( = ?auto_1818260 ?auto_1818263 ) ) ( not ( = ?auto_1818261 ?auto_1818263 ) ) ( not ( = ?auto_1818259 ?auto_1818263 ) ) ( TRUCK-AT ?auto_1818262 ?auto_1818266 ) ( ON ?auto_1818254 ?auto_1818253 ) ( ON ?auto_1818255 ?auto_1818254 ) ( ON ?auto_1818256 ?auto_1818255 ) ( ON ?auto_1818257 ?auto_1818256 ) ( ON ?auto_1818258 ?auto_1818257 ) ( ON ?auto_1818259 ?auto_1818258 ) ( not ( = ?auto_1818253 ?auto_1818254 ) ) ( not ( = ?auto_1818253 ?auto_1818255 ) ) ( not ( = ?auto_1818253 ?auto_1818256 ) ) ( not ( = ?auto_1818253 ?auto_1818257 ) ) ( not ( = ?auto_1818253 ?auto_1818258 ) ) ( not ( = ?auto_1818253 ?auto_1818259 ) ) ( not ( = ?auto_1818253 ?auto_1818260 ) ) ( not ( = ?auto_1818253 ?auto_1818261 ) ) ( not ( = ?auto_1818253 ?auto_1818263 ) ) ( not ( = ?auto_1818254 ?auto_1818255 ) ) ( not ( = ?auto_1818254 ?auto_1818256 ) ) ( not ( = ?auto_1818254 ?auto_1818257 ) ) ( not ( = ?auto_1818254 ?auto_1818258 ) ) ( not ( = ?auto_1818254 ?auto_1818259 ) ) ( not ( = ?auto_1818254 ?auto_1818260 ) ) ( not ( = ?auto_1818254 ?auto_1818261 ) ) ( not ( = ?auto_1818254 ?auto_1818263 ) ) ( not ( = ?auto_1818255 ?auto_1818256 ) ) ( not ( = ?auto_1818255 ?auto_1818257 ) ) ( not ( = ?auto_1818255 ?auto_1818258 ) ) ( not ( = ?auto_1818255 ?auto_1818259 ) ) ( not ( = ?auto_1818255 ?auto_1818260 ) ) ( not ( = ?auto_1818255 ?auto_1818261 ) ) ( not ( = ?auto_1818255 ?auto_1818263 ) ) ( not ( = ?auto_1818256 ?auto_1818257 ) ) ( not ( = ?auto_1818256 ?auto_1818258 ) ) ( not ( = ?auto_1818256 ?auto_1818259 ) ) ( not ( = ?auto_1818256 ?auto_1818260 ) ) ( not ( = ?auto_1818256 ?auto_1818261 ) ) ( not ( = ?auto_1818256 ?auto_1818263 ) ) ( not ( = ?auto_1818257 ?auto_1818258 ) ) ( not ( = ?auto_1818257 ?auto_1818259 ) ) ( not ( = ?auto_1818257 ?auto_1818260 ) ) ( not ( = ?auto_1818257 ?auto_1818261 ) ) ( not ( = ?auto_1818257 ?auto_1818263 ) ) ( not ( = ?auto_1818258 ?auto_1818259 ) ) ( not ( = ?auto_1818258 ?auto_1818260 ) ) ( not ( = ?auto_1818258 ?auto_1818261 ) ) ( not ( = ?auto_1818258 ?auto_1818263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818259 ?auto_1818260 ?auto_1818261 )
      ( MAKE-8CRATE-VERIFY ?auto_1818253 ?auto_1818254 ?auto_1818255 ?auto_1818256 ?auto_1818257 ?auto_1818258 ?auto_1818259 ?auto_1818260 ?auto_1818261 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818346 - SURFACE
      ?auto_1818347 - SURFACE
      ?auto_1818348 - SURFACE
      ?auto_1818349 - SURFACE
      ?auto_1818350 - SURFACE
      ?auto_1818351 - SURFACE
      ?auto_1818352 - SURFACE
      ?auto_1818353 - SURFACE
      ?auto_1818354 - SURFACE
    )
    :vars
    (
      ?auto_1818357 - HOIST
      ?auto_1818355 - PLACE
      ?auto_1818359 - PLACE
      ?auto_1818356 - HOIST
      ?auto_1818360 - SURFACE
      ?auto_1818358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818357 ?auto_1818355 ) ( IS-CRATE ?auto_1818354 ) ( not ( = ?auto_1818353 ?auto_1818354 ) ) ( not ( = ?auto_1818352 ?auto_1818353 ) ) ( not ( = ?auto_1818352 ?auto_1818354 ) ) ( not ( = ?auto_1818359 ?auto_1818355 ) ) ( HOIST-AT ?auto_1818356 ?auto_1818359 ) ( not ( = ?auto_1818357 ?auto_1818356 ) ) ( AVAILABLE ?auto_1818356 ) ( SURFACE-AT ?auto_1818354 ?auto_1818359 ) ( ON ?auto_1818354 ?auto_1818360 ) ( CLEAR ?auto_1818354 ) ( not ( = ?auto_1818353 ?auto_1818360 ) ) ( not ( = ?auto_1818354 ?auto_1818360 ) ) ( not ( = ?auto_1818352 ?auto_1818360 ) ) ( TRUCK-AT ?auto_1818358 ?auto_1818355 ) ( SURFACE-AT ?auto_1818352 ?auto_1818355 ) ( CLEAR ?auto_1818352 ) ( LIFTING ?auto_1818357 ?auto_1818353 ) ( IS-CRATE ?auto_1818353 ) ( ON ?auto_1818347 ?auto_1818346 ) ( ON ?auto_1818348 ?auto_1818347 ) ( ON ?auto_1818349 ?auto_1818348 ) ( ON ?auto_1818350 ?auto_1818349 ) ( ON ?auto_1818351 ?auto_1818350 ) ( ON ?auto_1818352 ?auto_1818351 ) ( not ( = ?auto_1818346 ?auto_1818347 ) ) ( not ( = ?auto_1818346 ?auto_1818348 ) ) ( not ( = ?auto_1818346 ?auto_1818349 ) ) ( not ( = ?auto_1818346 ?auto_1818350 ) ) ( not ( = ?auto_1818346 ?auto_1818351 ) ) ( not ( = ?auto_1818346 ?auto_1818352 ) ) ( not ( = ?auto_1818346 ?auto_1818353 ) ) ( not ( = ?auto_1818346 ?auto_1818354 ) ) ( not ( = ?auto_1818346 ?auto_1818360 ) ) ( not ( = ?auto_1818347 ?auto_1818348 ) ) ( not ( = ?auto_1818347 ?auto_1818349 ) ) ( not ( = ?auto_1818347 ?auto_1818350 ) ) ( not ( = ?auto_1818347 ?auto_1818351 ) ) ( not ( = ?auto_1818347 ?auto_1818352 ) ) ( not ( = ?auto_1818347 ?auto_1818353 ) ) ( not ( = ?auto_1818347 ?auto_1818354 ) ) ( not ( = ?auto_1818347 ?auto_1818360 ) ) ( not ( = ?auto_1818348 ?auto_1818349 ) ) ( not ( = ?auto_1818348 ?auto_1818350 ) ) ( not ( = ?auto_1818348 ?auto_1818351 ) ) ( not ( = ?auto_1818348 ?auto_1818352 ) ) ( not ( = ?auto_1818348 ?auto_1818353 ) ) ( not ( = ?auto_1818348 ?auto_1818354 ) ) ( not ( = ?auto_1818348 ?auto_1818360 ) ) ( not ( = ?auto_1818349 ?auto_1818350 ) ) ( not ( = ?auto_1818349 ?auto_1818351 ) ) ( not ( = ?auto_1818349 ?auto_1818352 ) ) ( not ( = ?auto_1818349 ?auto_1818353 ) ) ( not ( = ?auto_1818349 ?auto_1818354 ) ) ( not ( = ?auto_1818349 ?auto_1818360 ) ) ( not ( = ?auto_1818350 ?auto_1818351 ) ) ( not ( = ?auto_1818350 ?auto_1818352 ) ) ( not ( = ?auto_1818350 ?auto_1818353 ) ) ( not ( = ?auto_1818350 ?auto_1818354 ) ) ( not ( = ?auto_1818350 ?auto_1818360 ) ) ( not ( = ?auto_1818351 ?auto_1818352 ) ) ( not ( = ?auto_1818351 ?auto_1818353 ) ) ( not ( = ?auto_1818351 ?auto_1818354 ) ) ( not ( = ?auto_1818351 ?auto_1818360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818352 ?auto_1818353 ?auto_1818354 )
      ( MAKE-8CRATE-VERIFY ?auto_1818346 ?auto_1818347 ?auto_1818348 ?auto_1818349 ?auto_1818350 ?auto_1818351 ?auto_1818352 ?auto_1818353 ?auto_1818354 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818439 - SURFACE
      ?auto_1818440 - SURFACE
      ?auto_1818441 - SURFACE
      ?auto_1818442 - SURFACE
      ?auto_1818443 - SURFACE
      ?auto_1818444 - SURFACE
      ?auto_1818445 - SURFACE
      ?auto_1818446 - SURFACE
      ?auto_1818447 - SURFACE
    )
    :vars
    (
      ?auto_1818450 - HOIST
      ?auto_1818453 - PLACE
      ?auto_1818448 - PLACE
      ?auto_1818451 - HOIST
      ?auto_1818452 - SURFACE
      ?auto_1818449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818450 ?auto_1818453 ) ( IS-CRATE ?auto_1818447 ) ( not ( = ?auto_1818446 ?auto_1818447 ) ) ( not ( = ?auto_1818445 ?auto_1818446 ) ) ( not ( = ?auto_1818445 ?auto_1818447 ) ) ( not ( = ?auto_1818448 ?auto_1818453 ) ) ( HOIST-AT ?auto_1818451 ?auto_1818448 ) ( not ( = ?auto_1818450 ?auto_1818451 ) ) ( AVAILABLE ?auto_1818451 ) ( SURFACE-AT ?auto_1818447 ?auto_1818448 ) ( ON ?auto_1818447 ?auto_1818452 ) ( CLEAR ?auto_1818447 ) ( not ( = ?auto_1818446 ?auto_1818452 ) ) ( not ( = ?auto_1818447 ?auto_1818452 ) ) ( not ( = ?auto_1818445 ?auto_1818452 ) ) ( TRUCK-AT ?auto_1818449 ?auto_1818453 ) ( SURFACE-AT ?auto_1818445 ?auto_1818453 ) ( CLEAR ?auto_1818445 ) ( IS-CRATE ?auto_1818446 ) ( AVAILABLE ?auto_1818450 ) ( IN ?auto_1818446 ?auto_1818449 ) ( ON ?auto_1818440 ?auto_1818439 ) ( ON ?auto_1818441 ?auto_1818440 ) ( ON ?auto_1818442 ?auto_1818441 ) ( ON ?auto_1818443 ?auto_1818442 ) ( ON ?auto_1818444 ?auto_1818443 ) ( ON ?auto_1818445 ?auto_1818444 ) ( not ( = ?auto_1818439 ?auto_1818440 ) ) ( not ( = ?auto_1818439 ?auto_1818441 ) ) ( not ( = ?auto_1818439 ?auto_1818442 ) ) ( not ( = ?auto_1818439 ?auto_1818443 ) ) ( not ( = ?auto_1818439 ?auto_1818444 ) ) ( not ( = ?auto_1818439 ?auto_1818445 ) ) ( not ( = ?auto_1818439 ?auto_1818446 ) ) ( not ( = ?auto_1818439 ?auto_1818447 ) ) ( not ( = ?auto_1818439 ?auto_1818452 ) ) ( not ( = ?auto_1818440 ?auto_1818441 ) ) ( not ( = ?auto_1818440 ?auto_1818442 ) ) ( not ( = ?auto_1818440 ?auto_1818443 ) ) ( not ( = ?auto_1818440 ?auto_1818444 ) ) ( not ( = ?auto_1818440 ?auto_1818445 ) ) ( not ( = ?auto_1818440 ?auto_1818446 ) ) ( not ( = ?auto_1818440 ?auto_1818447 ) ) ( not ( = ?auto_1818440 ?auto_1818452 ) ) ( not ( = ?auto_1818441 ?auto_1818442 ) ) ( not ( = ?auto_1818441 ?auto_1818443 ) ) ( not ( = ?auto_1818441 ?auto_1818444 ) ) ( not ( = ?auto_1818441 ?auto_1818445 ) ) ( not ( = ?auto_1818441 ?auto_1818446 ) ) ( not ( = ?auto_1818441 ?auto_1818447 ) ) ( not ( = ?auto_1818441 ?auto_1818452 ) ) ( not ( = ?auto_1818442 ?auto_1818443 ) ) ( not ( = ?auto_1818442 ?auto_1818444 ) ) ( not ( = ?auto_1818442 ?auto_1818445 ) ) ( not ( = ?auto_1818442 ?auto_1818446 ) ) ( not ( = ?auto_1818442 ?auto_1818447 ) ) ( not ( = ?auto_1818442 ?auto_1818452 ) ) ( not ( = ?auto_1818443 ?auto_1818444 ) ) ( not ( = ?auto_1818443 ?auto_1818445 ) ) ( not ( = ?auto_1818443 ?auto_1818446 ) ) ( not ( = ?auto_1818443 ?auto_1818447 ) ) ( not ( = ?auto_1818443 ?auto_1818452 ) ) ( not ( = ?auto_1818444 ?auto_1818445 ) ) ( not ( = ?auto_1818444 ?auto_1818446 ) ) ( not ( = ?auto_1818444 ?auto_1818447 ) ) ( not ( = ?auto_1818444 ?auto_1818452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818445 ?auto_1818446 ?auto_1818447 )
      ( MAKE-8CRATE-VERIFY ?auto_1818439 ?auto_1818440 ?auto_1818441 ?auto_1818442 ?auto_1818443 ?auto_1818444 ?auto_1818445 ?auto_1818446 ?auto_1818447 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822555 - SURFACE
      ?auto_1822556 - SURFACE
      ?auto_1822557 - SURFACE
      ?auto_1822558 - SURFACE
      ?auto_1822559 - SURFACE
      ?auto_1822560 - SURFACE
      ?auto_1822561 - SURFACE
      ?auto_1822562 - SURFACE
      ?auto_1822563 - SURFACE
      ?auto_1822564 - SURFACE
    )
    :vars
    (
      ?auto_1822566 - HOIST
      ?auto_1822565 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822566 ?auto_1822565 ) ( SURFACE-AT ?auto_1822563 ?auto_1822565 ) ( CLEAR ?auto_1822563 ) ( LIFTING ?auto_1822566 ?auto_1822564 ) ( IS-CRATE ?auto_1822564 ) ( not ( = ?auto_1822563 ?auto_1822564 ) ) ( ON ?auto_1822556 ?auto_1822555 ) ( ON ?auto_1822557 ?auto_1822556 ) ( ON ?auto_1822558 ?auto_1822557 ) ( ON ?auto_1822559 ?auto_1822558 ) ( ON ?auto_1822560 ?auto_1822559 ) ( ON ?auto_1822561 ?auto_1822560 ) ( ON ?auto_1822562 ?auto_1822561 ) ( ON ?auto_1822563 ?auto_1822562 ) ( not ( = ?auto_1822555 ?auto_1822556 ) ) ( not ( = ?auto_1822555 ?auto_1822557 ) ) ( not ( = ?auto_1822555 ?auto_1822558 ) ) ( not ( = ?auto_1822555 ?auto_1822559 ) ) ( not ( = ?auto_1822555 ?auto_1822560 ) ) ( not ( = ?auto_1822555 ?auto_1822561 ) ) ( not ( = ?auto_1822555 ?auto_1822562 ) ) ( not ( = ?auto_1822555 ?auto_1822563 ) ) ( not ( = ?auto_1822555 ?auto_1822564 ) ) ( not ( = ?auto_1822556 ?auto_1822557 ) ) ( not ( = ?auto_1822556 ?auto_1822558 ) ) ( not ( = ?auto_1822556 ?auto_1822559 ) ) ( not ( = ?auto_1822556 ?auto_1822560 ) ) ( not ( = ?auto_1822556 ?auto_1822561 ) ) ( not ( = ?auto_1822556 ?auto_1822562 ) ) ( not ( = ?auto_1822556 ?auto_1822563 ) ) ( not ( = ?auto_1822556 ?auto_1822564 ) ) ( not ( = ?auto_1822557 ?auto_1822558 ) ) ( not ( = ?auto_1822557 ?auto_1822559 ) ) ( not ( = ?auto_1822557 ?auto_1822560 ) ) ( not ( = ?auto_1822557 ?auto_1822561 ) ) ( not ( = ?auto_1822557 ?auto_1822562 ) ) ( not ( = ?auto_1822557 ?auto_1822563 ) ) ( not ( = ?auto_1822557 ?auto_1822564 ) ) ( not ( = ?auto_1822558 ?auto_1822559 ) ) ( not ( = ?auto_1822558 ?auto_1822560 ) ) ( not ( = ?auto_1822558 ?auto_1822561 ) ) ( not ( = ?auto_1822558 ?auto_1822562 ) ) ( not ( = ?auto_1822558 ?auto_1822563 ) ) ( not ( = ?auto_1822558 ?auto_1822564 ) ) ( not ( = ?auto_1822559 ?auto_1822560 ) ) ( not ( = ?auto_1822559 ?auto_1822561 ) ) ( not ( = ?auto_1822559 ?auto_1822562 ) ) ( not ( = ?auto_1822559 ?auto_1822563 ) ) ( not ( = ?auto_1822559 ?auto_1822564 ) ) ( not ( = ?auto_1822560 ?auto_1822561 ) ) ( not ( = ?auto_1822560 ?auto_1822562 ) ) ( not ( = ?auto_1822560 ?auto_1822563 ) ) ( not ( = ?auto_1822560 ?auto_1822564 ) ) ( not ( = ?auto_1822561 ?auto_1822562 ) ) ( not ( = ?auto_1822561 ?auto_1822563 ) ) ( not ( = ?auto_1822561 ?auto_1822564 ) ) ( not ( = ?auto_1822562 ?auto_1822563 ) ) ( not ( = ?auto_1822562 ?auto_1822564 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1822563 ?auto_1822564 )
      ( MAKE-9CRATE-VERIFY ?auto_1822555 ?auto_1822556 ?auto_1822557 ?auto_1822558 ?auto_1822559 ?auto_1822560 ?auto_1822561 ?auto_1822562 ?auto_1822563 ?auto_1822564 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822635 - SURFACE
      ?auto_1822636 - SURFACE
      ?auto_1822637 - SURFACE
      ?auto_1822638 - SURFACE
      ?auto_1822639 - SURFACE
      ?auto_1822640 - SURFACE
      ?auto_1822641 - SURFACE
      ?auto_1822642 - SURFACE
      ?auto_1822643 - SURFACE
      ?auto_1822644 - SURFACE
    )
    :vars
    (
      ?auto_1822647 - HOIST
      ?auto_1822646 - PLACE
      ?auto_1822645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822647 ?auto_1822646 ) ( SURFACE-AT ?auto_1822643 ?auto_1822646 ) ( CLEAR ?auto_1822643 ) ( IS-CRATE ?auto_1822644 ) ( not ( = ?auto_1822643 ?auto_1822644 ) ) ( TRUCK-AT ?auto_1822645 ?auto_1822646 ) ( AVAILABLE ?auto_1822647 ) ( IN ?auto_1822644 ?auto_1822645 ) ( ON ?auto_1822643 ?auto_1822642 ) ( not ( = ?auto_1822642 ?auto_1822643 ) ) ( not ( = ?auto_1822642 ?auto_1822644 ) ) ( ON ?auto_1822636 ?auto_1822635 ) ( ON ?auto_1822637 ?auto_1822636 ) ( ON ?auto_1822638 ?auto_1822637 ) ( ON ?auto_1822639 ?auto_1822638 ) ( ON ?auto_1822640 ?auto_1822639 ) ( ON ?auto_1822641 ?auto_1822640 ) ( ON ?auto_1822642 ?auto_1822641 ) ( not ( = ?auto_1822635 ?auto_1822636 ) ) ( not ( = ?auto_1822635 ?auto_1822637 ) ) ( not ( = ?auto_1822635 ?auto_1822638 ) ) ( not ( = ?auto_1822635 ?auto_1822639 ) ) ( not ( = ?auto_1822635 ?auto_1822640 ) ) ( not ( = ?auto_1822635 ?auto_1822641 ) ) ( not ( = ?auto_1822635 ?auto_1822642 ) ) ( not ( = ?auto_1822635 ?auto_1822643 ) ) ( not ( = ?auto_1822635 ?auto_1822644 ) ) ( not ( = ?auto_1822636 ?auto_1822637 ) ) ( not ( = ?auto_1822636 ?auto_1822638 ) ) ( not ( = ?auto_1822636 ?auto_1822639 ) ) ( not ( = ?auto_1822636 ?auto_1822640 ) ) ( not ( = ?auto_1822636 ?auto_1822641 ) ) ( not ( = ?auto_1822636 ?auto_1822642 ) ) ( not ( = ?auto_1822636 ?auto_1822643 ) ) ( not ( = ?auto_1822636 ?auto_1822644 ) ) ( not ( = ?auto_1822637 ?auto_1822638 ) ) ( not ( = ?auto_1822637 ?auto_1822639 ) ) ( not ( = ?auto_1822637 ?auto_1822640 ) ) ( not ( = ?auto_1822637 ?auto_1822641 ) ) ( not ( = ?auto_1822637 ?auto_1822642 ) ) ( not ( = ?auto_1822637 ?auto_1822643 ) ) ( not ( = ?auto_1822637 ?auto_1822644 ) ) ( not ( = ?auto_1822638 ?auto_1822639 ) ) ( not ( = ?auto_1822638 ?auto_1822640 ) ) ( not ( = ?auto_1822638 ?auto_1822641 ) ) ( not ( = ?auto_1822638 ?auto_1822642 ) ) ( not ( = ?auto_1822638 ?auto_1822643 ) ) ( not ( = ?auto_1822638 ?auto_1822644 ) ) ( not ( = ?auto_1822639 ?auto_1822640 ) ) ( not ( = ?auto_1822639 ?auto_1822641 ) ) ( not ( = ?auto_1822639 ?auto_1822642 ) ) ( not ( = ?auto_1822639 ?auto_1822643 ) ) ( not ( = ?auto_1822639 ?auto_1822644 ) ) ( not ( = ?auto_1822640 ?auto_1822641 ) ) ( not ( = ?auto_1822640 ?auto_1822642 ) ) ( not ( = ?auto_1822640 ?auto_1822643 ) ) ( not ( = ?auto_1822640 ?auto_1822644 ) ) ( not ( = ?auto_1822641 ?auto_1822642 ) ) ( not ( = ?auto_1822641 ?auto_1822643 ) ) ( not ( = ?auto_1822641 ?auto_1822644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822642 ?auto_1822643 ?auto_1822644 )
      ( MAKE-9CRATE-VERIFY ?auto_1822635 ?auto_1822636 ?auto_1822637 ?auto_1822638 ?auto_1822639 ?auto_1822640 ?auto_1822641 ?auto_1822642 ?auto_1822643 ?auto_1822644 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822725 - SURFACE
      ?auto_1822726 - SURFACE
      ?auto_1822727 - SURFACE
      ?auto_1822728 - SURFACE
      ?auto_1822729 - SURFACE
      ?auto_1822730 - SURFACE
      ?auto_1822731 - SURFACE
      ?auto_1822732 - SURFACE
      ?auto_1822733 - SURFACE
      ?auto_1822734 - SURFACE
    )
    :vars
    (
      ?auto_1822738 - HOIST
      ?auto_1822736 - PLACE
      ?auto_1822735 - TRUCK
      ?auto_1822737 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822738 ?auto_1822736 ) ( SURFACE-AT ?auto_1822733 ?auto_1822736 ) ( CLEAR ?auto_1822733 ) ( IS-CRATE ?auto_1822734 ) ( not ( = ?auto_1822733 ?auto_1822734 ) ) ( AVAILABLE ?auto_1822738 ) ( IN ?auto_1822734 ?auto_1822735 ) ( ON ?auto_1822733 ?auto_1822732 ) ( not ( = ?auto_1822732 ?auto_1822733 ) ) ( not ( = ?auto_1822732 ?auto_1822734 ) ) ( TRUCK-AT ?auto_1822735 ?auto_1822737 ) ( not ( = ?auto_1822737 ?auto_1822736 ) ) ( ON ?auto_1822726 ?auto_1822725 ) ( ON ?auto_1822727 ?auto_1822726 ) ( ON ?auto_1822728 ?auto_1822727 ) ( ON ?auto_1822729 ?auto_1822728 ) ( ON ?auto_1822730 ?auto_1822729 ) ( ON ?auto_1822731 ?auto_1822730 ) ( ON ?auto_1822732 ?auto_1822731 ) ( not ( = ?auto_1822725 ?auto_1822726 ) ) ( not ( = ?auto_1822725 ?auto_1822727 ) ) ( not ( = ?auto_1822725 ?auto_1822728 ) ) ( not ( = ?auto_1822725 ?auto_1822729 ) ) ( not ( = ?auto_1822725 ?auto_1822730 ) ) ( not ( = ?auto_1822725 ?auto_1822731 ) ) ( not ( = ?auto_1822725 ?auto_1822732 ) ) ( not ( = ?auto_1822725 ?auto_1822733 ) ) ( not ( = ?auto_1822725 ?auto_1822734 ) ) ( not ( = ?auto_1822726 ?auto_1822727 ) ) ( not ( = ?auto_1822726 ?auto_1822728 ) ) ( not ( = ?auto_1822726 ?auto_1822729 ) ) ( not ( = ?auto_1822726 ?auto_1822730 ) ) ( not ( = ?auto_1822726 ?auto_1822731 ) ) ( not ( = ?auto_1822726 ?auto_1822732 ) ) ( not ( = ?auto_1822726 ?auto_1822733 ) ) ( not ( = ?auto_1822726 ?auto_1822734 ) ) ( not ( = ?auto_1822727 ?auto_1822728 ) ) ( not ( = ?auto_1822727 ?auto_1822729 ) ) ( not ( = ?auto_1822727 ?auto_1822730 ) ) ( not ( = ?auto_1822727 ?auto_1822731 ) ) ( not ( = ?auto_1822727 ?auto_1822732 ) ) ( not ( = ?auto_1822727 ?auto_1822733 ) ) ( not ( = ?auto_1822727 ?auto_1822734 ) ) ( not ( = ?auto_1822728 ?auto_1822729 ) ) ( not ( = ?auto_1822728 ?auto_1822730 ) ) ( not ( = ?auto_1822728 ?auto_1822731 ) ) ( not ( = ?auto_1822728 ?auto_1822732 ) ) ( not ( = ?auto_1822728 ?auto_1822733 ) ) ( not ( = ?auto_1822728 ?auto_1822734 ) ) ( not ( = ?auto_1822729 ?auto_1822730 ) ) ( not ( = ?auto_1822729 ?auto_1822731 ) ) ( not ( = ?auto_1822729 ?auto_1822732 ) ) ( not ( = ?auto_1822729 ?auto_1822733 ) ) ( not ( = ?auto_1822729 ?auto_1822734 ) ) ( not ( = ?auto_1822730 ?auto_1822731 ) ) ( not ( = ?auto_1822730 ?auto_1822732 ) ) ( not ( = ?auto_1822730 ?auto_1822733 ) ) ( not ( = ?auto_1822730 ?auto_1822734 ) ) ( not ( = ?auto_1822731 ?auto_1822732 ) ) ( not ( = ?auto_1822731 ?auto_1822733 ) ) ( not ( = ?auto_1822731 ?auto_1822734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822732 ?auto_1822733 ?auto_1822734 )
      ( MAKE-9CRATE-VERIFY ?auto_1822725 ?auto_1822726 ?auto_1822727 ?auto_1822728 ?auto_1822729 ?auto_1822730 ?auto_1822731 ?auto_1822732 ?auto_1822733 ?auto_1822734 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822824 - SURFACE
      ?auto_1822825 - SURFACE
      ?auto_1822826 - SURFACE
      ?auto_1822827 - SURFACE
      ?auto_1822828 - SURFACE
      ?auto_1822829 - SURFACE
      ?auto_1822830 - SURFACE
      ?auto_1822831 - SURFACE
      ?auto_1822832 - SURFACE
      ?auto_1822833 - SURFACE
    )
    :vars
    (
      ?auto_1822835 - HOIST
      ?auto_1822837 - PLACE
      ?auto_1822834 - TRUCK
      ?auto_1822836 - PLACE
      ?auto_1822838 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822835 ?auto_1822837 ) ( SURFACE-AT ?auto_1822832 ?auto_1822837 ) ( CLEAR ?auto_1822832 ) ( IS-CRATE ?auto_1822833 ) ( not ( = ?auto_1822832 ?auto_1822833 ) ) ( AVAILABLE ?auto_1822835 ) ( ON ?auto_1822832 ?auto_1822831 ) ( not ( = ?auto_1822831 ?auto_1822832 ) ) ( not ( = ?auto_1822831 ?auto_1822833 ) ) ( TRUCK-AT ?auto_1822834 ?auto_1822836 ) ( not ( = ?auto_1822836 ?auto_1822837 ) ) ( HOIST-AT ?auto_1822838 ?auto_1822836 ) ( LIFTING ?auto_1822838 ?auto_1822833 ) ( not ( = ?auto_1822835 ?auto_1822838 ) ) ( ON ?auto_1822825 ?auto_1822824 ) ( ON ?auto_1822826 ?auto_1822825 ) ( ON ?auto_1822827 ?auto_1822826 ) ( ON ?auto_1822828 ?auto_1822827 ) ( ON ?auto_1822829 ?auto_1822828 ) ( ON ?auto_1822830 ?auto_1822829 ) ( ON ?auto_1822831 ?auto_1822830 ) ( not ( = ?auto_1822824 ?auto_1822825 ) ) ( not ( = ?auto_1822824 ?auto_1822826 ) ) ( not ( = ?auto_1822824 ?auto_1822827 ) ) ( not ( = ?auto_1822824 ?auto_1822828 ) ) ( not ( = ?auto_1822824 ?auto_1822829 ) ) ( not ( = ?auto_1822824 ?auto_1822830 ) ) ( not ( = ?auto_1822824 ?auto_1822831 ) ) ( not ( = ?auto_1822824 ?auto_1822832 ) ) ( not ( = ?auto_1822824 ?auto_1822833 ) ) ( not ( = ?auto_1822825 ?auto_1822826 ) ) ( not ( = ?auto_1822825 ?auto_1822827 ) ) ( not ( = ?auto_1822825 ?auto_1822828 ) ) ( not ( = ?auto_1822825 ?auto_1822829 ) ) ( not ( = ?auto_1822825 ?auto_1822830 ) ) ( not ( = ?auto_1822825 ?auto_1822831 ) ) ( not ( = ?auto_1822825 ?auto_1822832 ) ) ( not ( = ?auto_1822825 ?auto_1822833 ) ) ( not ( = ?auto_1822826 ?auto_1822827 ) ) ( not ( = ?auto_1822826 ?auto_1822828 ) ) ( not ( = ?auto_1822826 ?auto_1822829 ) ) ( not ( = ?auto_1822826 ?auto_1822830 ) ) ( not ( = ?auto_1822826 ?auto_1822831 ) ) ( not ( = ?auto_1822826 ?auto_1822832 ) ) ( not ( = ?auto_1822826 ?auto_1822833 ) ) ( not ( = ?auto_1822827 ?auto_1822828 ) ) ( not ( = ?auto_1822827 ?auto_1822829 ) ) ( not ( = ?auto_1822827 ?auto_1822830 ) ) ( not ( = ?auto_1822827 ?auto_1822831 ) ) ( not ( = ?auto_1822827 ?auto_1822832 ) ) ( not ( = ?auto_1822827 ?auto_1822833 ) ) ( not ( = ?auto_1822828 ?auto_1822829 ) ) ( not ( = ?auto_1822828 ?auto_1822830 ) ) ( not ( = ?auto_1822828 ?auto_1822831 ) ) ( not ( = ?auto_1822828 ?auto_1822832 ) ) ( not ( = ?auto_1822828 ?auto_1822833 ) ) ( not ( = ?auto_1822829 ?auto_1822830 ) ) ( not ( = ?auto_1822829 ?auto_1822831 ) ) ( not ( = ?auto_1822829 ?auto_1822832 ) ) ( not ( = ?auto_1822829 ?auto_1822833 ) ) ( not ( = ?auto_1822830 ?auto_1822831 ) ) ( not ( = ?auto_1822830 ?auto_1822832 ) ) ( not ( = ?auto_1822830 ?auto_1822833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822831 ?auto_1822832 ?auto_1822833 )
      ( MAKE-9CRATE-VERIFY ?auto_1822824 ?auto_1822825 ?auto_1822826 ?auto_1822827 ?auto_1822828 ?auto_1822829 ?auto_1822830 ?auto_1822831 ?auto_1822832 ?auto_1822833 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822932 - SURFACE
      ?auto_1822933 - SURFACE
      ?auto_1822934 - SURFACE
      ?auto_1822935 - SURFACE
      ?auto_1822936 - SURFACE
      ?auto_1822937 - SURFACE
      ?auto_1822938 - SURFACE
      ?auto_1822939 - SURFACE
      ?auto_1822940 - SURFACE
      ?auto_1822941 - SURFACE
    )
    :vars
    (
      ?auto_1822946 - HOIST
      ?auto_1822945 - PLACE
      ?auto_1822947 - TRUCK
      ?auto_1822944 - PLACE
      ?auto_1822943 - HOIST
      ?auto_1822942 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822946 ?auto_1822945 ) ( SURFACE-AT ?auto_1822940 ?auto_1822945 ) ( CLEAR ?auto_1822940 ) ( IS-CRATE ?auto_1822941 ) ( not ( = ?auto_1822940 ?auto_1822941 ) ) ( AVAILABLE ?auto_1822946 ) ( ON ?auto_1822940 ?auto_1822939 ) ( not ( = ?auto_1822939 ?auto_1822940 ) ) ( not ( = ?auto_1822939 ?auto_1822941 ) ) ( TRUCK-AT ?auto_1822947 ?auto_1822944 ) ( not ( = ?auto_1822944 ?auto_1822945 ) ) ( HOIST-AT ?auto_1822943 ?auto_1822944 ) ( not ( = ?auto_1822946 ?auto_1822943 ) ) ( AVAILABLE ?auto_1822943 ) ( SURFACE-AT ?auto_1822941 ?auto_1822944 ) ( ON ?auto_1822941 ?auto_1822942 ) ( CLEAR ?auto_1822941 ) ( not ( = ?auto_1822940 ?auto_1822942 ) ) ( not ( = ?auto_1822941 ?auto_1822942 ) ) ( not ( = ?auto_1822939 ?auto_1822942 ) ) ( ON ?auto_1822933 ?auto_1822932 ) ( ON ?auto_1822934 ?auto_1822933 ) ( ON ?auto_1822935 ?auto_1822934 ) ( ON ?auto_1822936 ?auto_1822935 ) ( ON ?auto_1822937 ?auto_1822936 ) ( ON ?auto_1822938 ?auto_1822937 ) ( ON ?auto_1822939 ?auto_1822938 ) ( not ( = ?auto_1822932 ?auto_1822933 ) ) ( not ( = ?auto_1822932 ?auto_1822934 ) ) ( not ( = ?auto_1822932 ?auto_1822935 ) ) ( not ( = ?auto_1822932 ?auto_1822936 ) ) ( not ( = ?auto_1822932 ?auto_1822937 ) ) ( not ( = ?auto_1822932 ?auto_1822938 ) ) ( not ( = ?auto_1822932 ?auto_1822939 ) ) ( not ( = ?auto_1822932 ?auto_1822940 ) ) ( not ( = ?auto_1822932 ?auto_1822941 ) ) ( not ( = ?auto_1822932 ?auto_1822942 ) ) ( not ( = ?auto_1822933 ?auto_1822934 ) ) ( not ( = ?auto_1822933 ?auto_1822935 ) ) ( not ( = ?auto_1822933 ?auto_1822936 ) ) ( not ( = ?auto_1822933 ?auto_1822937 ) ) ( not ( = ?auto_1822933 ?auto_1822938 ) ) ( not ( = ?auto_1822933 ?auto_1822939 ) ) ( not ( = ?auto_1822933 ?auto_1822940 ) ) ( not ( = ?auto_1822933 ?auto_1822941 ) ) ( not ( = ?auto_1822933 ?auto_1822942 ) ) ( not ( = ?auto_1822934 ?auto_1822935 ) ) ( not ( = ?auto_1822934 ?auto_1822936 ) ) ( not ( = ?auto_1822934 ?auto_1822937 ) ) ( not ( = ?auto_1822934 ?auto_1822938 ) ) ( not ( = ?auto_1822934 ?auto_1822939 ) ) ( not ( = ?auto_1822934 ?auto_1822940 ) ) ( not ( = ?auto_1822934 ?auto_1822941 ) ) ( not ( = ?auto_1822934 ?auto_1822942 ) ) ( not ( = ?auto_1822935 ?auto_1822936 ) ) ( not ( = ?auto_1822935 ?auto_1822937 ) ) ( not ( = ?auto_1822935 ?auto_1822938 ) ) ( not ( = ?auto_1822935 ?auto_1822939 ) ) ( not ( = ?auto_1822935 ?auto_1822940 ) ) ( not ( = ?auto_1822935 ?auto_1822941 ) ) ( not ( = ?auto_1822935 ?auto_1822942 ) ) ( not ( = ?auto_1822936 ?auto_1822937 ) ) ( not ( = ?auto_1822936 ?auto_1822938 ) ) ( not ( = ?auto_1822936 ?auto_1822939 ) ) ( not ( = ?auto_1822936 ?auto_1822940 ) ) ( not ( = ?auto_1822936 ?auto_1822941 ) ) ( not ( = ?auto_1822936 ?auto_1822942 ) ) ( not ( = ?auto_1822937 ?auto_1822938 ) ) ( not ( = ?auto_1822937 ?auto_1822939 ) ) ( not ( = ?auto_1822937 ?auto_1822940 ) ) ( not ( = ?auto_1822937 ?auto_1822941 ) ) ( not ( = ?auto_1822937 ?auto_1822942 ) ) ( not ( = ?auto_1822938 ?auto_1822939 ) ) ( not ( = ?auto_1822938 ?auto_1822940 ) ) ( not ( = ?auto_1822938 ?auto_1822941 ) ) ( not ( = ?auto_1822938 ?auto_1822942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822939 ?auto_1822940 ?auto_1822941 )
      ( MAKE-9CRATE-VERIFY ?auto_1822932 ?auto_1822933 ?auto_1822934 ?auto_1822935 ?auto_1822936 ?auto_1822937 ?auto_1822938 ?auto_1822939 ?auto_1822940 ?auto_1822941 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1823041 - SURFACE
      ?auto_1823042 - SURFACE
      ?auto_1823043 - SURFACE
      ?auto_1823044 - SURFACE
      ?auto_1823045 - SURFACE
      ?auto_1823046 - SURFACE
      ?auto_1823047 - SURFACE
      ?auto_1823048 - SURFACE
      ?auto_1823049 - SURFACE
      ?auto_1823050 - SURFACE
    )
    :vars
    (
      ?auto_1823051 - HOIST
      ?auto_1823052 - PLACE
      ?auto_1823054 - PLACE
      ?auto_1823055 - HOIST
      ?auto_1823056 - SURFACE
      ?auto_1823053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1823051 ?auto_1823052 ) ( SURFACE-AT ?auto_1823049 ?auto_1823052 ) ( CLEAR ?auto_1823049 ) ( IS-CRATE ?auto_1823050 ) ( not ( = ?auto_1823049 ?auto_1823050 ) ) ( AVAILABLE ?auto_1823051 ) ( ON ?auto_1823049 ?auto_1823048 ) ( not ( = ?auto_1823048 ?auto_1823049 ) ) ( not ( = ?auto_1823048 ?auto_1823050 ) ) ( not ( = ?auto_1823054 ?auto_1823052 ) ) ( HOIST-AT ?auto_1823055 ?auto_1823054 ) ( not ( = ?auto_1823051 ?auto_1823055 ) ) ( AVAILABLE ?auto_1823055 ) ( SURFACE-AT ?auto_1823050 ?auto_1823054 ) ( ON ?auto_1823050 ?auto_1823056 ) ( CLEAR ?auto_1823050 ) ( not ( = ?auto_1823049 ?auto_1823056 ) ) ( not ( = ?auto_1823050 ?auto_1823056 ) ) ( not ( = ?auto_1823048 ?auto_1823056 ) ) ( TRUCK-AT ?auto_1823053 ?auto_1823052 ) ( ON ?auto_1823042 ?auto_1823041 ) ( ON ?auto_1823043 ?auto_1823042 ) ( ON ?auto_1823044 ?auto_1823043 ) ( ON ?auto_1823045 ?auto_1823044 ) ( ON ?auto_1823046 ?auto_1823045 ) ( ON ?auto_1823047 ?auto_1823046 ) ( ON ?auto_1823048 ?auto_1823047 ) ( not ( = ?auto_1823041 ?auto_1823042 ) ) ( not ( = ?auto_1823041 ?auto_1823043 ) ) ( not ( = ?auto_1823041 ?auto_1823044 ) ) ( not ( = ?auto_1823041 ?auto_1823045 ) ) ( not ( = ?auto_1823041 ?auto_1823046 ) ) ( not ( = ?auto_1823041 ?auto_1823047 ) ) ( not ( = ?auto_1823041 ?auto_1823048 ) ) ( not ( = ?auto_1823041 ?auto_1823049 ) ) ( not ( = ?auto_1823041 ?auto_1823050 ) ) ( not ( = ?auto_1823041 ?auto_1823056 ) ) ( not ( = ?auto_1823042 ?auto_1823043 ) ) ( not ( = ?auto_1823042 ?auto_1823044 ) ) ( not ( = ?auto_1823042 ?auto_1823045 ) ) ( not ( = ?auto_1823042 ?auto_1823046 ) ) ( not ( = ?auto_1823042 ?auto_1823047 ) ) ( not ( = ?auto_1823042 ?auto_1823048 ) ) ( not ( = ?auto_1823042 ?auto_1823049 ) ) ( not ( = ?auto_1823042 ?auto_1823050 ) ) ( not ( = ?auto_1823042 ?auto_1823056 ) ) ( not ( = ?auto_1823043 ?auto_1823044 ) ) ( not ( = ?auto_1823043 ?auto_1823045 ) ) ( not ( = ?auto_1823043 ?auto_1823046 ) ) ( not ( = ?auto_1823043 ?auto_1823047 ) ) ( not ( = ?auto_1823043 ?auto_1823048 ) ) ( not ( = ?auto_1823043 ?auto_1823049 ) ) ( not ( = ?auto_1823043 ?auto_1823050 ) ) ( not ( = ?auto_1823043 ?auto_1823056 ) ) ( not ( = ?auto_1823044 ?auto_1823045 ) ) ( not ( = ?auto_1823044 ?auto_1823046 ) ) ( not ( = ?auto_1823044 ?auto_1823047 ) ) ( not ( = ?auto_1823044 ?auto_1823048 ) ) ( not ( = ?auto_1823044 ?auto_1823049 ) ) ( not ( = ?auto_1823044 ?auto_1823050 ) ) ( not ( = ?auto_1823044 ?auto_1823056 ) ) ( not ( = ?auto_1823045 ?auto_1823046 ) ) ( not ( = ?auto_1823045 ?auto_1823047 ) ) ( not ( = ?auto_1823045 ?auto_1823048 ) ) ( not ( = ?auto_1823045 ?auto_1823049 ) ) ( not ( = ?auto_1823045 ?auto_1823050 ) ) ( not ( = ?auto_1823045 ?auto_1823056 ) ) ( not ( = ?auto_1823046 ?auto_1823047 ) ) ( not ( = ?auto_1823046 ?auto_1823048 ) ) ( not ( = ?auto_1823046 ?auto_1823049 ) ) ( not ( = ?auto_1823046 ?auto_1823050 ) ) ( not ( = ?auto_1823046 ?auto_1823056 ) ) ( not ( = ?auto_1823047 ?auto_1823048 ) ) ( not ( = ?auto_1823047 ?auto_1823049 ) ) ( not ( = ?auto_1823047 ?auto_1823050 ) ) ( not ( = ?auto_1823047 ?auto_1823056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1823048 ?auto_1823049 ?auto_1823050 )
      ( MAKE-9CRATE-VERIFY ?auto_1823041 ?auto_1823042 ?auto_1823043 ?auto_1823044 ?auto_1823045 ?auto_1823046 ?auto_1823047 ?auto_1823048 ?auto_1823049 ?auto_1823050 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1823150 - SURFACE
      ?auto_1823151 - SURFACE
      ?auto_1823152 - SURFACE
      ?auto_1823153 - SURFACE
      ?auto_1823154 - SURFACE
      ?auto_1823155 - SURFACE
      ?auto_1823156 - SURFACE
      ?auto_1823157 - SURFACE
      ?auto_1823158 - SURFACE
      ?auto_1823159 - SURFACE
    )
    :vars
    (
      ?auto_1823163 - HOIST
      ?auto_1823160 - PLACE
      ?auto_1823165 - PLACE
      ?auto_1823161 - HOIST
      ?auto_1823162 - SURFACE
      ?auto_1823164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1823163 ?auto_1823160 ) ( IS-CRATE ?auto_1823159 ) ( not ( = ?auto_1823158 ?auto_1823159 ) ) ( not ( = ?auto_1823157 ?auto_1823158 ) ) ( not ( = ?auto_1823157 ?auto_1823159 ) ) ( not ( = ?auto_1823165 ?auto_1823160 ) ) ( HOIST-AT ?auto_1823161 ?auto_1823165 ) ( not ( = ?auto_1823163 ?auto_1823161 ) ) ( AVAILABLE ?auto_1823161 ) ( SURFACE-AT ?auto_1823159 ?auto_1823165 ) ( ON ?auto_1823159 ?auto_1823162 ) ( CLEAR ?auto_1823159 ) ( not ( = ?auto_1823158 ?auto_1823162 ) ) ( not ( = ?auto_1823159 ?auto_1823162 ) ) ( not ( = ?auto_1823157 ?auto_1823162 ) ) ( TRUCK-AT ?auto_1823164 ?auto_1823160 ) ( SURFACE-AT ?auto_1823157 ?auto_1823160 ) ( CLEAR ?auto_1823157 ) ( LIFTING ?auto_1823163 ?auto_1823158 ) ( IS-CRATE ?auto_1823158 ) ( ON ?auto_1823151 ?auto_1823150 ) ( ON ?auto_1823152 ?auto_1823151 ) ( ON ?auto_1823153 ?auto_1823152 ) ( ON ?auto_1823154 ?auto_1823153 ) ( ON ?auto_1823155 ?auto_1823154 ) ( ON ?auto_1823156 ?auto_1823155 ) ( ON ?auto_1823157 ?auto_1823156 ) ( not ( = ?auto_1823150 ?auto_1823151 ) ) ( not ( = ?auto_1823150 ?auto_1823152 ) ) ( not ( = ?auto_1823150 ?auto_1823153 ) ) ( not ( = ?auto_1823150 ?auto_1823154 ) ) ( not ( = ?auto_1823150 ?auto_1823155 ) ) ( not ( = ?auto_1823150 ?auto_1823156 ) ) ( not ( = ?auto_1823150 ?auto_1823157 ) ) ( not ( = ?auto_1823150 ?auto_1823158 ) ) ( not ( = ?auto_1823150 ?auto_1823159 ) ) ( not ( = ?auto_1823150 ?auto_1823162 ) ) ( not ( = ?auto_1823151 ?auto_1823152 ) ) ( not ( = ?auto_1823151 ?auto_1823153 ) ) ( not ( = ?auto_1823151 ?auto_1823154 ) ) ( not ( = ?auto_1823151 ?auto_1823155 ) ) ( not ( = ?auto_1823151 ?auto_1823156 ) ) ( not ( = ?auto_1823151 ?auto_1823157 ) ) ( not ( = ?auto_1823151 ?auto_1823158 ) ) ( not ( = ?auto_1823151 ?auto_1823159 ) ) ( not ( = ?auto_1823151 ?auto_1823162 ) ) ( not ( = ?auto_1823152 ?auto_1823153 ) ) ( not ( = ?auto_1823152 ?auto_1823154 ) ) ( not ( = ?auto_1823152 ?auto_1823155 ) ) ( not ( = ?auto_1823152 ?auto_1823156 ) ) ( not ( = ?auto_1823152 ?auto_1823157 ) ) ( not ( = ?auto_1823152 ?auto_1823158 ) ) ( not ( = ?auto_1823152 ?auto_1823159 ) ) ( not ( = ?auto_1823152 ?auto_1823162 ) ) ( not ( = ?auto_1823153 ?auto_1823154 ) ) ( not ( = ?auto_1823153 ?auto_1823155 ) ) ( not ( = ?auto_1823153 ?auto_1823156 ) ) ( not ( = ?auto_1823153 ?auto_1823157 ) ) ( not ( = ?auto_1823153 ?auto_1823158 ) ) ( not ( = ?auto_1823153 ?auto_1823159 ) ) ( not ( = ?auto_1823153 ?auto_1823162 ) ) ( not ( = ?auto_1823154 ?auto_1823155 ) ) ( not ( = ?auto_1823154 ?auto_1823156 ) ) ( not ( = ?auto_1823154 ?auto_1823157 ) ) ( not ( = ?auto_1823154 ?auto_1823158 ) ) ( not ( = ?auto_1823154 ?auto_1823159 ) ) ( not ( = ?auto_1823154 ?auto_1823162 ) ) ( not ( = ?auto_1823155 ?auto_1823156 ) ) ( not ( = ?auto_1823155 ?auto_1823157 ) ) ( not ( = ?auto_1823155 ?auto_1823158 ) ) ( not ( = ?auto_1823155 ?auto_1823159 ) ) ( not ( = ?auto_1823155 ?auto_1823162 ) ) ( not ( = ?auto_1823156 ?auto_1823157 ) ) ( not ( = ?auto_1823156 ?auto_1823158 ) ) ( not ( = ?auto_1823156 ?auto_1823159 ) ) ( not ( = ?auto_1823156 ?auto_1823162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1823157 ?auto_1823158 ?auto_1823159 )
      ( MAKE-9CRATE-VERIFY ?auto_1823150 ?auto_1823151 ?auto_1823152 ?auto_1823153 ?auto_1823154 ?auto_1823155 ?auto_1823156 ?auto_1823157 ?auto_1823158 ?auto_1823159 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1823259 - SURFACE
      ?auto_1823260 - SURFACE
      ?auto_1823261 - SURFACE
      ?auto_1823262 - SURFACE
      ?auto_1823263 - SURFACE
      ?auto_1823264 - SURFACE
      ?auto_1823265 - SURFACE
      ?auto_1823266 - SURFACE
      ?auto_1823267 - SURFACE
      ?auto_1823268 - SURFACE
    )
    :vars
    (
      ?auto_1823273 - HOIST
      ?auto_1823271 - PLACE
      ?auto_1823269 - PLACE
      ?auto_1823274 - HOIST
      ?auto_1823272 - SURFACE
      ?auto_1823270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1823273 ?auto_1823271 ) ( IS-CRATE ?auto_1823268 ) ( not ( = ?auto_1823267 ?auto_1823268 ) ) ( not ( = ?auto_1823266 ?auto_1823267 ) ) ( not ( = ?auto_1823266 ?auto_1823268 ) ) ( not ( = ?auto_1823269 ?auto_1823271 ) ) ( HOIST-AT ?auto_1823274 ?auto_1823269 ) ( not ( = ?auto_1823273 ?auto_1823274 ) ) ( AVAILABLE ?auto_1823274 ) ( SURFACE-AT ?auto_1823268 ?auto_1823269 ) ( ON ?auto_1823268 ?auto_1823272 ) ( CLEAR ?auto_1823268 ) ( not ( = ?auto_1823267 ?auto_1823272 ) ) ( not ( = ?auto_1823268 ?auto_1823272 ) ) ( not ( = ?auto_1823266 ?auto_1823272 ) ) ( TRUCK-AT ?auto_1823270 ?auto_1823271 ) ( SURFACE-AT ?auto_1823266 ?auto_1823271 ) ( CLEAR ?auto_1823266 ) ( IS-CRATE ?auto_1823267 ) ( AVAILABLE ?auto_1823273 ) ( IN ?auto_1823267 ?auto_1823270 ) ( ON ?auto_1823260 ?auto_1823259 ) ( ON ?auto_1823261 ?auto_1823260 ) ( ON ?auto_1823262 ?auto_1823261 ) ( ON ?auto_1823263 ?auto_1823262 ) ( ON ?auto_1823264 ?auto_1823263 ) ( ON ?auto_1823265 ?auto_1823264 ) ( ON ?auto_1823266 ?auto_1823265 ) ( not ( = ?auto_1823259 ?auto_1823260 ) ) ( not ( = ?auto_1823259 ?auto_1823261 ) ) ( not ( = ?auto_1823259 ?auto_1823262 ) ) ( not ( = ?auto_1823259 ?auto_1823263 ) ) ( not ( = ?auto_1823259 ?auto_1823264 ) ) ( not ( = ?auto_1823259 ?auto_1823265 ) ) ( not ( = ?auto_1823259 ?auto_1823266 ) ) ( not ( = ?auto_1823259 ?auto_1823267 ) ) ( not ( = ?auto_1823259 ?auto_1823268 ) ) ( not ( = ?auto_1823259 ?auto_1823272 ) ) ( not ( = ?auto_1823260 ?auto_1823261 ) ) ( not ( = ?auto_1823260 ?auto_1823262 ) ) ( not ( = ?auto_1823260 ?auto_1823263 ) ) ( not ( = ?auto_1823260 ?auto_1823264 ) ) ( not ( = ?auto_1823260 ?auto_1823265 ) ) ( not ( = ?auto_1823260 ?auto_1823266 ) ) ( not ( = ?auto_1823260 ?auto_1823267 ) ) ( not ( = ?auto_1823260 ?auto_1823268 ) ) ( not ( = ?auto_1823260 ?auto_1823272 ) ) ( not ( = ?auto_1823261 ?auto_1823262 ) ) ( not ( = ?auto_1823261 ?auto_1823263 ) ) ( not ( = ?auto_1823261 ?auto_1823264 ) ) ( not ( = ?auto_1823261 ?auto_1823265 ) ) ( not ( = ?auto_1823261 ?auto_1823266 ) ) ( not ( = ?auto_1823261 ?auto_1823267 ) ) ( not ( = ?auto_1823261 ?auto_1823268 ) ) ( not ( = ?auto_1823261 ?auto_1823272 ) ) ( not ( = ?auto_1823262 ?auto_1823263 ) ) ( not ( = ?auto_1823262 ?auto_1823264 ) ) ( not ( = ?auto_1823262 ?auto_1823265 ) ) ( not ( = ?auto_1823262 ?auto_1823266 ) ) ( not ( = ?auto_1823262 ?auto_1823267 ) ) ( not ( = ?auto_1823262 ?auto_1823268 ) ) ( not ( = ?auto_1823262 ?auto_1823272 ) ) ( not ( = ?auto_1823263 ?auto_1823264 ) ) ( not ( = ?auto_1823263 ?auto_1823265 ) ) ( not ( = ?auto_1823263 ?auto_1823266 ) ) ( not ( = ?auto_1823263 ?auto_1823267 ) ) ( not ( = ?auto_1823263 ?auto_1823268 ) ) ( not ( = ?auto_1823263 ?auto_1823272 ) ) ( not ( = ?auto_1823264 ?auto_1823265 ) ) ( not ( = ?auto_1823264 ?auto_1823266 ) ) ( not ( = ?auto_1823264 ?auto_1823267 ) ) ( not ( = ?auto_1823264 ?auto_1823268 ) ) ( not ( = ?auto_1823264 ?auto_1823272 ) ) ( not ( = ?auto_1823265 ?auto_1823266 ) ) ( not ( = ?auto_1823265 ?auto_1823267 ) ) ( not ( = ?auto_1823265 ?auto_1823268 ) ) ( not ( = ?auto_1823265 ?auto_1823272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1823266 ?auto_1823267 ?auto_1823268 )
      ( MAKE-9CRATE-VERIFY ?auto_1823259 ?auto_1823260 ?auto_1823261 ?auto_1823262 ?auto_1823263 ?auto_1823264 ?auto_1823265 ?auto_1823266 ?auto_1823267 ?auto_1823268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1826909 - SURFACE
      ?auto_1826910 - SURFACE
    )
    :vars
    (
      ?auto_1826917 - HOIST
      ?auto_1826913 - PLACE
      ?auto_1826914 - SURFACE
      ?auto_1826916 - TRUCK
      ?auto_1826912 - PLACE
      ?auto_1826911 - HOIST
      ?auto_1826915 - SURFACE
      ?auto_1826918 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1826917 ?auto_1826913 ) ( SURFACE-AT ?auto_1826909 ?auto_1826913 ) ( CLEAR ?auto_1826909 ) ( IS-CRATE ?auto_1826910 ) ( not ( = ?auto_1826909 ?auto_1826910 ) ) ( AVAILABLE ?auto_1826917 ) ( ON ?auto_1826909 ?auto_1826914 ) ( not ( = ?auto_1826914 ?auto_1826909 ) ) ( not ( = ?auto_1826914 ?auto_1826910 ) ) ( TRUCK-AT ?auto_1826916 ?auto_1826912 ) ( not ( = ?auto_1826912 ?auto_1826913 ) ) ( HOIST-AT ?auto_1826911 ?auto_1826912 ) ( not ( = ?auto_1826917 ?auto_1826911 ) ) ( SURFACE-AT ?auto_1826910 ?auto_1826912 ) ( ON ?auto_1826910 ?auto_1826915 ) ( CLEAR ?auto_1826910 ) ( not ( = ?auto_1826909 ?auto_1826915 ) ) ( not ( = ?auto_1826910 ?auto_1826915 ) ) ( not ( = ?auto_1826914 ?auto_1826915 ) ) ( LIFTING ?auto_1826911 ?auto_1826918 ) ( IS-CRATE ?auto_1826918 ) ( not ( = ?auto_1826909 ?auto_1826918 ) ) ( not ( = ?auto_1826910 ?auto_1826918 ) ) ( not ( = ?auto_1826914 ?auto_1826918 ) ) ( not ( = ?auto_1826915 ?auto_1826918 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1826911 ?auto_1826918 ?auto_1826916 ?auto_1826912 )
      ( MAKE-1CRATE ?auto_1826909 ?auto_1826910 )
      ( MAKE-1CRATE-VERIFY ?auto_1826909 ?auto_1826910 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1828812 - SURFACE
      ?auto_1828813 - SURFACE
      ?auto_1828814 - SURFACE
      ?auto_1828815 - SURFACE
      ?auto_1828816 - SURFACE
      ?auto_1828817 - SURFACE
      ?auto_1828818 - SURFACE
      ?auto_1828819 - SURFACE
      ?auto_1828820 - SURFACE
      ?auto_1828821 - SURFACE
      ?auto_1828822 - SURFACE
    )
    :vars
    (
      ?auto_1828823 - HOIST
      ?auto_1828824 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1828823 ?auto_1828824 ) ( SURFACE-AT ?auto_1828821 ?auto_1828824 ) ( CLEAR ?auto_1828821 ) ( LIFTING ?auto_1828823 ?auto_1828822 ) ( IS-CRATE ?auto_1828822 ) ( not ( = ?auto_1828821 ?auto_1828822 ) ) ( ON ?auto_1828813 ?auto_1828812 ) ( ON ?auto_1828814 ?auto_1828813 ) ( ON ?auto_1828815 ?auto_1828814 ) ( ON ?auto_1828816 ?auto_1828815 ) ( ON ?auto_1828817 ?auto_1828816 ) ( ON ?auto_1828818 ?auto_1828817 ) ( ON ?auto_1828819 ?auto_1828818 ) ( ON ?auto_1828820 ?auto_1828819 ) ( ON ?auto_1828821 ?auto_1828820 ) ( not ( = ?auto_1828812 ?auto_1828813 ) ) ( not ( = ?auto_1828812 ?auto_1828814 ) ) ( not ( = ?auto_1828812 ?auto_1828815 ) ) ( not ( = ?auto_1828812 ?auto_1828816 ) ) ( not ( = ?auto_1828812 ?auto_1828817 ) ) ( not ( = ?auto_1828812 ?auto_1828818 ) ) ( not ( = ?auto_1828812 ?auto_1828819 ) ) ( not ( = ?auto_1828812 ?auto_1828820 ) ) ( not ( = ?auto_1828812 ?auto_1828821 ) ) ( not ( = ?auto_1828812 ?auto_1828822 ) ) ( not ( = ?auto_1828813 ?auto_1828814 ) ) ( not ( = ?auto_1828813 ?auto_1828815 ) ) ( not ( = ?auto_1828813 ?auto_1828816 ) ) ( not ( = ?auto_1828813 ?auto_1828817 ) ) ( not ( = ?auto_1828813 ?auto_1828818 ) ) ( not ( = ?auto_1828813 ?auto_1828819 ) ) ( not ( = ?auto_1828813 ?auto_1828820 ) ) ( not ( = ?auto_1828813 ?auto_1828821 ) ) ( not ( = ?auto_1828813 ?auto_1828822 ) ) ( not ( = ?auto_1828814 ?auto_1828815 ) ) ( not ( = ?auto_1828814 ?auto_1828816 ) ) ( not ( = ?auto_1828814 ?auto_1828817 ) ) ( not ( = ?auto_1828814 ?auto_1828818 ) ) ( not ( = ?auto_1828814 ?auto_1828819 ) ) ( not ( = ?auto_1828814 ?auto_1828820 ) ) ( not ( = ?auto_1828814 ?auto_1828821 ) ) ( not ( = ?auto_1828814 ?auto_1828822 ) ) ( not ( = ?auto_1828815 ?auto_1828816 ) ) ( not ( = ?auto_1828815 ?auto_1828817 ) ) ( not ( = ?auto_1828815 ?auto_1828818 ) ) ( not ( = ?auto_1828815 ?auto_1828819 ) ) ( not ( = ?auto_1828815 ?auto_1828820 ) ) ( not ( = ?auto_1828815 ?auto_1828821 ) ) ( not ( = ?auto_1828815 ?auto_1828822 ) ) ( not ( = ?auto_1828816 ?auto_1828817 ) ) ( not ( = ?auto_1828816 ?auto_1828818 ) ) ( not ( = ?auto_1828816 ?auto_1828819 ) ) ( not ( = ?auto_1828816 ?auto_1828820 ) ) ( not ( = ?auto_1828816 ?auto_1828821 ) ) ( not ( = ?auto_1828816 ?auto_1828822 ) ) ( not ( = ?auto_1828817 ?auto_1828818 ) ) ( not ( = ?auto_1828817 ?auto_1828819 ) ) ( not ( = ?auto_1828817 ?auto_1828820 ) ) ( not ( = ?auto_1828817 ?auto_1828821 ) ) ( not ( = ?auto_1828817 ?auto_1828822 ) ) ( not ( = ?auto_1828818 ?auto_1828819 ) ) ( not ( = ?auto_1828818 ?auto_1828820 ) ) ( not ( = ?auto_1828818 ?auto_1828821 ) ) ( not ( = ?auto_1828818 ?auto_1828822 ) ) ( not ( = ?auto_1828819 ?auto_1828820 ) ) ( not ( = ?auto_1828819 ?auto_1828821 ) ) ( not ( = ?auto_1828819 ?auto_1828822 ) ) ( not ( = ?auto_1828820 ?auto_1828821 ) ) ( not ( = ?auto_1828820 ?auto_1828822 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1828821 ?auto_1828822 )
      ( MAKE-10CRATE-VERIFY ?auto_1828812 ?auto_1828813 ?auto_1828814 ?auto_1828815 ?auto_1828816 ?auto_1828817 ?auto_1828818 ?auto_1828819 ?auto_1828820 ?auto_1828821 ?auto_1828822 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1828906 - SURFACE
      ?auto_1828907 - SURFACE
      ?auto_1828908 - SURFACE
      ?auto_1828909 - SURFACE
      ?auto_1828910 - SURFACE
      ?auto_1828911 - SURFACE
      ?auto_1828912 - SURFACE
      ?auto_1828913 - SURFACE
      ?auto_1828914 - SURFACE
      ?auto_1828915 - SURFACE
      ?auto_1828916 - SURFACE
    )
    :vars
    (
      ?auto_1828918 - HOIST
      ?auto_1828917 - PLACE
      ?auto_1828919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1828918 ?auto_1828917 ) ( SURFACE-AT ?auto_1828915 ?auto_1828917 ) ( CLEAR ?auto_1828915 ) ( IS-CRATE ?auto_1828916 ) ( not ( = ?auto_1828915 ?auto_1828916 ) ) ( TRUCK-AT ?auto_1828919 ?auto_1828917 ) ( AVAILABLE ?auto_1828918 ) ( IN ?auto_1828916 ?auto_1828919 ) ( ON ?auto_1828915 ?auto_1828914 ) ( not ( = ?auto_1828914 ?auto_1828915 ) ) ( not ( = ?auto_1828914 ?auto_1828916 ) ) ( ON ?auto_1828907 ?auto_1828906 ) ( ON ?auto_1828908 ?auto_1828907 ) ( ON ?auto_1828909 ?auto_1828908 ) ( ON ?auto_1828910 ?auto_1828909 ) ( ON ?auto_1828911 ?auto_1828910 ) ( ON ?auto_1828912 ?auto_1828911 ) ( ON ?auto_1828913 ?auto_1828912 ) ( ON ?auto_1828914 ?auto_1828913 ) ( not ( = ?auto_1828906 ?auto_1828907 ) ) ( not ( = ?auto_1828906 ?auto_1828908 ) ) ( not ( = ?auto_1828906 ?auto_1828909 ) ) ( not ( = ?auto_1828906 ?auto_1828910 ) ) ( not ( = ?auto_1828906 ?auto_1828911 ) ) ( not ( = ?auto_1828906 ?auto_1828912 ) ) ( not ( = ?auto_1828906 ?auto_1828913 ) ) ( not ( = ?auto_1828906 ?auto_1828914 ) ) ( not ( = ?auto_1828906 ?auto_1828915 ) ) ( not ( = ?auto_1828906 ?auto_1828916 ) ) ( not ( = ?auto_1828907 ?auto_1828908 ) ) ( not ( = ?auto_1828907 ?auto_1828909 ) ) ( not ( = ?auto_1828907 ?auto_1828910 ) ) ( not ( = ?auto_1828907 ?auto_1828911 ) ) ( not ( = ?auto_1828907 ?auto_1828912 ) ) ( not ( = ?auto_1828907 ?auto_1828913 ) ) ( not ( = ?auto_1828907 ?auto_1828914 ) ) ( not ( = ?auto_1828907 ?auto_1828915 ) ) ( not ( = ?auto_1828907 ?auto_1828916 ) ) ( not ( = ?auto_1828908 ?auto_1828909 ) ) ( not ( = ?auto_1828908 ?auto_1828910 ) ) ( not ( = ?auto_1828908 ?auto_1828911 ) ) ( not ( = ?auto_1828908 ?auto_1828912 ) ) ( not ( = ?auto_1828908 ?auto_1828913 ) ) ( not ( = ?auto_1828908 ?auto_1828914 ) ) ( not ( = ?auto_1828908 ?auto_1828915 ) ) ( not ( = ?auto_1828908 ?auto_1828916 ) ) ( not ( = ?auto_1828909 ?auto_1828910 ) ) ( not ( = ?auto_1828909 ?auto_1828911 ) ) ( not ( = ?auto_1828909 ?auto_1828912 ) ) ( not ( = ?auto_1828909 ?auto_1828913 ) ) ( not ( = ?auto_1828909 ?auto_1828914 ) ) ( not ( = ?auto_1828909 ?auto_1828915 ) ) ( not ( = ?auto_1828909 ?auto_1828916 ) ) ( not ( = ?auto_1828910 ?auto_1828911 ) ) ( not ( = ?auto_1828910 ?auto_1828912 ) ) ( not ( = ?auto_1828910 ?auto_1828913 ) ) ( not ( = ?auto_1828910 ?auto_1828914 ) ) ( not ( = ?auto_1828910 ?auto_1828915 ) ) ( not ( = ?auto_1828910 ?auto_1828916 ) ) ( not ( = ?auto_1828911 ?auto_1828912 ) ) ( not ( = ?auto_1828911 ?auto_1828913 ) ) ( not ( = ?auto_1828911 ?auto_1828914 ) ) ( not ( = ?auto_1828911 ?auto_1828915 ) ) ( not ( = ?auto_1828911 ?auto_1828916 ) ) ( not ( = ?auto_1828912 ?auto_1828913 ) ) ( not ( = ?auto_1828912 ?auto_1828914 ) ) ( not ( = ?auto_1828912 ?auto_1828915 ) ) ( not ( = ?auto_1828912 ?auto_1828916 ) ) ( not ( = ?auto_1828913 ?auto_1828914 ) ) ( not ( = ?auto_1828913 ?auto_1828915 ) ) ( not ( = ?auto_1828913 ?auto_1828916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1828914 ?auto_1828915 ?auto_1828916 )
      ( MAKE-10CRATE-VERIFY ?auto_1828906 ?auto_1828907 ?auto_1828908 ?auto_1828909 ?auto_1828910 ?auto_1828911 ?auto_1828912 ?auto_1828913 ?auto_1828914 ?auto_1828915 ?auto_1828916 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829011 - SURFACE
      ?auto_1829012 - SURFACE
      ?auto_1829013 - SURFACE
      ?auto_1829014 - SURFACE
      ?auto_1829015 - SURFACE
      ?auto_1829016 - SURFACE
      ?auto_1829017 - SURFACE
      ?auto_1829018 - SURFACE
      ?auto_1829019 - SURFACE
      ?auto_1829020 - SURFACE
      ?auto_1829021 - SURFACE
    )
    :vars
    (
      ?auto_1829024 - HOIST
      ?auto_1829025 - PLACE
      ?auto_1829022 - TRUCK
      ?auto_1829023 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829024 ?auto_1829025 ) ( SURFACE-AT ?auto_1829020 ?auto_1829025 ) ( CLEAR ?auto_1829020 ) ( IS-CRATE ?auto_1829021 ) ( not ( = ?auto_1829020 ?auto_1829021 ) ) ( AVAILABLE ?auto_1829024 ) ( IN ?auto_1829021 ?auto_1829022 ) ( ON ?auto_1829020 ?auto_1829019 ) ( not ( = ?auto_1829019 ?auto_1829020 ) ) ( not ( = ?auto_1829019 ?auto_1829021 ) ) ( TRUCK-AT ?auto_1829022 ?auto_1829023 ) ( not ( = ?auto_1829023 ?auto_1829025 ) ) ( ON ?auto_1829012 ?auto_1829011 ) ( ON ?auto_1829013 ?auto_1829012 ) ( ON ?auto_1829014 ?auto_1829013 ) ( ON ?auto_1829015 ?auto_1829014 ) ( ON ?auto_1829016 ?auto_1829015 ) ( ON ?auto_1829017 ?auto_1829016 ) ( ON ?auto_1829018 ?auto_1829017 ) ( ON ?auto_1829019 ?auto_1829018 ) ( not ( = ?auto_1829011 ?auto_1829012 ) ) ( not ( = ?auto_1829011 ?auto_1829013 ) ) ( not ( = ?auto_1829011 ?auto_1829014 ) ) ( not ( = ?auto_1829011 ?auto_1829015 ) ) ( not ( = ?auto_1829011 ?auto_1829016 ) ) ( not ( = ?auto_1829011 ?auto_1829017 ) ) ( not ( = ?auto_1829011 ?auto_1829018 ) ) ( not ( = ?auto_1829011 ?auto_1829019 ) ) ( not ( = ?auto_1829011 ?auto_1829020 ) ) ( not ( = ?auto_1829011 ?auto_1829021 ) ) ( not ( = ?auto_1829012 ?auto_1829013 ) ) ( not ( = ?auto_1829012 ?auto_1829014 ) ) ( not ( = ?auto_1829012 ?auto_1829015 ) ) ( not ( = ?auto_1829012 ?auto_1829016 ) ) ( not ( = ?auto_1829012 ?auto_1829017 ) ) ( not ( = ?auto_1829012 ?auto_1829018 ) ) ( not ( = ?auto_1829012 ?auto_1829019 ) ) ( not ( = ?auto_1829012 ?auto_1829020 ) ) ( not ( = ?auto_1829012 ?auto_1829021 ) ) ( not ( = ?auto_1829013 ?auto_1829014 ) ) ( not ( = ?auto_1829013 ?auto_1829015 ) ) ( not ( = ?auto_1829013 ?auto_1829016 ) ) ( not ( = ?auto_1829013 ?auto_1829017 ) ) ( not ( = ?auto_1829013 ?auto_1829018 ) ) ( not ( = ?auto_1829013 ?auto_1829019 ) ) ( not ( = ?auto_1829013 ?auto_1829020 ) ) ( not ( = ?auto_1829013 ?auto_1829021 ) ) ( not ( = ?auto_1829014 ?auto_1829015 ) ) ( not ( = ?auto_1829014 ?auto_1829016 ) ) ( not ( = ?auto_1829014 ?auto_1829017 ) ) ( not ( = ?auto_1829014 ?auto_1829018 ) ) ( not ( = ?auto_1829014 ?auto_1829019 ) ) ( not ( = ?auto_1829014 ?auto_1829020 ) ) ( not ( = ?auto_1829014 ?auto_1829021 ) ) ( not ( = ?auto_1829015 ?auto_1829016 ) ) ( not ( = ?auto_1829015 ?auto_1829017 ) ) ( not ( = ?auto_1829015 ?auto_1829018 ) ) ( not ( = ?auto_1829015 ?auto_1829019 ) ) ( not ( = ?auto_1829015 ?auto_1829020 ) ) ( not ( = ?auto_1829015 ?auto_1829021 ) ) ( not ( = ?auto_1829016 ?auto_1829017 ) ) ( not ( = ?auto_1829016 ?auto_1829018 ) ) ( not ( = ?auto_1829016 ?auto_1829019 ) ) ( not ( = ?auto_1829016 ?auto_1829020 ) ) ( not ( = ?auto_1829016 ?auto_1829021 ) ) ( not ( = ?auto_1829017 ?auto_1829018 ) ) ( not ( = ?auto_1829017 ?auto_1829019 ) ) ( not ( = ?auto_1829017 ?auto_1829020 ) ) ( not ( = ?auto_1829017 ?auto_1829021 ) ) ( not ( = ?auto_1829018 ?auto_1829019 ) ) ( not ( = ?auto_1829018 ?auto_1829020 ) ) ( not ( = ?auto_1829018 ?auto_1829021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829019 ?auto_1829020 ?auto_1829021 )
      ( MAKE-10CRATE-VERIFY ?auto_1829011 ?auto_1829012 ?auto_1829013 ?auto_1829014 ?auto_1829015 ?auto_1829016 ?auto_1829017 ?auto_1829018 ?auto_1829019 ?auto_1829020 ?auto_1829021 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829126 - SURFACE
      ?auto_1829127 - SURFACE
      ?auto_1829128 - SURFACE
      ?auto_1829129 - SURFACE
      ?auto_1829130 - SURFACE
      ?auto_1829131 - SURFACE
      ?auto_1829132 - SURFACE
      ?auto_1829133 - SURFACE
      ?auto_1829134 - SURFACE
      ?auto_1829135 - SURFACE
      ?auto_1829136 - SURFACE
    )
    :vars
    (
      ?auto_1829140 - HOIST
      ?auto_1829138 - PLACE
      ?auto_1829141 - TRUCK
      ?auto_1829139 - PLACE
      ?auto_1829137 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829140 ?auto_1829138 ) ( SURFACE-AT ?auto_1829135 ?auto_1829138 ) ( CLEAR ?auto_1829135 ) ( IS-CRATE ?auto_1829136 ) ( not ( = ?auto_1829135 ?auto_1829136 ) ) ( AVAILABLE ?auto_1829140 ) ( ON ?auto_1829135 ?auto_1829134 ) ( not ( = ?auto_1829134 ?auto_1829135 ) ) ( not ( = ?auto_1829134 ?auto_1829136 ) ) ( TRUCK-AT ?auto_1829141 ?auto_1829139 ) ( not ( = ?auto_1829139 ?auto_1829138 ) ) ( HOIST-AT ?auto_1829137 ?auto_1829139 ) ( LIFTING ?auto_1829137 ?auto_1829136 ) ( not ( = ?auto_1829140 ?auto_1829137 ) ) ( ON ?auto_1829127 ?auto_1829126 ) ( ON ?auto_1829128 ?auto_1829127 ) ( ON ?auto_1829129 ?auto_1829128 ) ( ON ?auto_1829130 ?auto_1829129 ) ( ON ?auto_1829131 ?auto_1829130 ) ( ON ?auto_1829132 ?auto_1829131 ) ( ON ?auto_1829133 ?auto_1829132 ) ( ON ?auto_1829134 ?auto_1829133 ) ( not ( = ?auto_1829126 ?auto_1829127 ) ) ( not ( = ?auto_1829126 ?auto_1829128 ) ) ( not ( = ?auto_1829126 ?auto_1829129 ) ) ( not ( = ?auto_1829126 ?auto_1829130 ) ) ( not ( = ?auto_1829126 ?auto_1829131 ) ) ( not ( = ?auto_1829126 ?auto_1829132 ) ) ( not ( = ?auto_1829126 ?auto_1829133 ) ) ( not ( = ?auto_1829126 ?auto_1829134 ) ) ( not ( = ?auto_1829126 ?auto_1829135 ) ) ( not ( = ?auto_1829126 ?auto_1829136 ) ) ( not ( = ?auto_1829127 ?auto_1829128 ) ) ( not ( = ?auto_1829127 ?auto_1829129 ) ) ( not ( = ?auto_1829127 ?auto_1829130 ) ) ( not ( = ?auto_1829127 ?auto_1829131 ) ) ( not ( = ?auto_1829127 ?auto_1829132 ) ) ( not ( = ?auto_1829127 ?auto_1829133 ) ) ( not ( = ?auto_1829127 ?auto_1829134 ) ) ( not ( = ?auto_1829127 ?auto_1829135 ) ) ( not ( = ?auto_1829127 ?auto_1829136 ) ) ( not ( = ?auto_1829128 ?auto_1829129 ) ) ( not ( = ?auto_1829128 ?auto_1829130 ) ) ( not ( = ?auto_1829128 ?auto_1829131 ) ) ( not ( = ?auto_1829128 ?auto_1829132 ) ) ( not ( = ?auto_1829128 ?auto_1829133 ) ) ( not ( = ?auto_1829128 ?auto_1829134 ) ) ( not ( = ?auto_1829128 ?auto_1829135 ) ) ( not ( = ?auto_1829128 ?auto_1829136 ) ) ( not ( = ?auto_1829129 ?auto_1829130 ) ) ( not ( = ?auto_1829129 ?auto_1829131 ) ) ( not ( = ?auto_1829129 ?auto_1829132 ) ) ( not ( = ?auto_1829129 ?auto_1829133 ) ) ( not ( = ?auto_1829129 ?auto_1829134 ) ) ( not ( = ?auto_1829129 ?auto_1829135 ) ) ( not ( = ?auto_1829129 ?auto_1829136 ) ) ( not ( = ?auto_1829130 ?auto_1829131 ) ) ( not ( = ?auto_1829130 ?auto_1829132 ) ) ( not ( = ?auto_1829130 ?auto_1829133 ) ) ( not ( = ?auto_1829130 ?auto_1829134 ) ) ( not ( = ?auto_1829130 ?auto_1829135 ) ) ( not ( = ?auto_1829130 ?auto_1829136 ) ) ( not ( = ?auto_1829131 ?auto_1829132 ) ) ( not ( = ?auto_1829131 ?auto_1829133 ) ) ( not ( = ?auto_1829131 ?auto_1829134 ) ) ( not ( = ?auto_1829131 ?auto_1829135 ) ) ( not ( = ?auto_1829131 ?auto_1829136 ) ) ( not ( = ?auto_1829132 ?auto_1829133 ) ) ( not ( = ?auto_1829132 ?auto_1829134 ) ) ( not ( = ?auto_1829132 ?auto_1829135 ) ) ( not ( = ?auto_1829132 ?auto_1829136 ) ) ( not ( = ?auto_1829133 ?auto_1829134 ) ) ( not ( = ?auto_1829133 ?auto_1829135 ) ) ( not ( = ?auto_1829133 ?auto_1829136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829134 ?auto_1829135 ?auto_1829136 )
      ( MAKE-10CRATE-VERIFY ?auto_1829126 ?auto_1829127 ?auto_1829128 ?auto_1829129 ?auto_1829130 ?auto_1829131 ?auto_1829132 ?auto_1829133 ?auto_1829134 ?auto_1829135 ?auto_1829136 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829251 - SURFACE
      ?auto_1829252 - SURFACE
      ?auto_1829253 - SURFACE
      ?auto_1829254 - SURFACE
      ?auto_1829255 - SURFACE
      ?auto_1829256 - SURFACE
      ?auto_1829257 - SURFACE
      ?auto_1829258 - SURFACE
      ?auto_1829259 - SURFACE
      ?auto_1829260 - SURFACE
      ?auto_1829261 - SURFACE
    )
    :vars
    (
      ?auto_1829264 - HOIST
      ?auto_1829265 - PLACE
      ?auto_1829267 - TRUCK
      ?auto_1829266 - PLACE
      ?auto_1829263 - HOIST
      ?auto_1829262 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829264 ?auto_1829265 ) ( SURFACE-AT ?auto_1829260 ?auto_1829265 ) ( CLEAR ?auto_1829260 ) ( IS-CRATE ?auto_1829261 ) ( not ( = ?auto_1829260 ?auto_1829261 ) ) ( AVAILABLE ?auto_1829264 ) ( ON ?auto_1829260 ?auto_1829259 ) ( not ( = ?auto_1829259 ?auto_1829260 ) ) ( not ( = ?auto_1829259 ?auto_1829261 ) ) ( TRUCK-AT ?auto_1829267 ?auto_1829266 ) ( not ( = ?auto_1829266 ?auto_1829265 ) ) ( HOIST-AT ?auto_1829263 ?auto_1829266 ) ( not ( = ?auto_1829264 ?auto_1829263 ) ) ( AVAILABLE ?auto_1829263 ) ( SURFACE-AT ?auto_1829261 ?auto_1829266 ) ( ON ?auto_1829261 ?auto_1829262 ) ( CLEAR ?auto_1829261 ) ( not ( = ?auto_1829260 ?auto_1829262 ) ) ( not ( = ?auto_1829261 ?auto_1829262 ) ) ( not ( = ?auto_1829259 ?auto_1829262 ) ) ( ON ?auto_1829252 ?auto_1829251 ) ( ON ?auto_1829253 ?auto_1829252 ) ( ON ?auto_1829254 ?auto_1829253 ) ( ON ?auto_1829255 ?auto_1829254 ) ( ON ?auto_1829256 ?auto_1829255 ) ( ON ?auto_1829257 ?auto_1829256 ) ( ON ?auto_1829258 ?auto_1829257 ) ( ON ?auto_1829259 ?auto_1829258 ) ( not ( = ?auto_1829251 ?auto_1829252 ) ) ( not ( = ?auto_1829251 ?auto_1829253 ) ) ( not ( = ?auto_1829251 ?auto_1829254 ) ) ( not ( = ?auto_1829251 ?auto_1829255 ) ) ( not ( = ?auto_1829251 ?auto_1829256 ) ) ( not ( = ?auto_1829251 ?auto_1829257 ) ) ( not ( = ?auto_1829251 ?auto_1829258 ) ) ( not ( = ?auto_1829251 ?auto_1829259 ) ) ( not ( = ?auto_1829251 ?auto_1829260 ) ) ( not ( = ?auto_1829251 ?auto_1829261 ) ) ( not ( = ?auto_1829251 ?auto_1829262 ) ) ( not ( = ?auto_1829252 ?auto_1829253 ) ) ( not ( = ?auto_1829252 ?auto_1829254 ) ) ( not ( = ?auto_1829252 ?auto_1829255 ) ) ( not ( = ?auto_1829252 ?auto_1829256 ) ) ( not ( = ?auto_1829252 ?auto_1829257 ) ) ( not ( = ?auto_1829252 ?auto_1829258 ) ) ( not ( = ?auto_1829252 ?auto_1829259 ) ) ( not ( = ?auto_1829252 ?auto_1829260 ) ) ( not ( = ?auto_1829252 ?auto_1829261 ) ) ( not ( = ?auto_1829252 ?auto_1829262 ) ) ( not ( = ?auto_1829253 ?auto_1829254 ) ) ( not ( = ?auto_1829253 ?auto_1829255 ) ) ( not ( = ?auto_1829253 ?auto_1829256 ) ) ( not ( = ?auto_1829253 ?auto_1829257 ) ) ( not ( = ?auto_1829253 ?auto_1829258 ) ) ( not ( = ?auto_1829253 ?auto_1829259 ) ) ( not ( = ?auto_1829253 ?auto_1829260 ) ) ( not ( = ?auto_1829253 ?auto_1829261 ) ) ( not ( = ?auto_1829253 ?auto_1829262 ) ) ( not ( = ?auto_1829254 ?auto_1829255 ) ) ( not ( = ?auto_1829254 ?auto_1829256 ) ) ( not ( = ?auto_1829254 ?auto_1829257 ) ) ( not ( = ?auto_1829254 ?auto_1829258 ) ) ( not ( = ?auto_1829254 ?auto_1829259 ) ) ( not ( = ?auto_1829254 ?auto_1829260 ) ) ( not ( = ?auto_1829254 ?auto_1829261 ) ) ( not ( = ?auto_1829254 ?auto_1829262 ) ) ( not ( = ?auto_1829255 ?auto_1829256 ) ) ( not ( = ?auto_1829255 ?auto_1829257 ) ) ( not ( = ?auto_1829255 ?auto_1829258 ) ) ( not ( = ?auto_1829255 ?auto_1829259 ) ) ( not ( = ?auto_1829255 ?auto_1829260 ) ) ( not ( = ?auto_1829255 ?auto_1829261 ) ) ( not ( = ?auto_1829255 ?auto_1829262 ) ) ( not ( = ?auto_1829256 ?auto_1829257 ) ) ( not ( = ?auto_1829256 ?auto_1829258 ) ) ( not ( = ?auto_1829256 ?auto_1829259 ) ) ( not ( = ?auto_1829256 ?auto_1829260 ) ) ( not ( = ?auto_1829256 ?auto_1829261 ) ) ( not ( = ?auto_1829256 ?auto_1829262 ) ) ( not ( = ?auto_1829257 ?auto_1829258 ) ) ( not ( = ?auto_1829257 ?auto_1829259 ) ) ( not ( = ?auto_1829257 ?auto_1829260 ) ) ( not ( = ?auto_1829257 ?auto_1829261 ) ) ( not ( = ?auto_1829257 ?auto_1829262 ) ) ( not ( = ?auto_1829258 ?auto_1829259 ) ) ( not ( = ?auto_1829258 ?auto_1829260 ) ) ( not ( = ?auto_1829258 ?auto_1829261 ) ) ( not ( = ?auto_1829258 ?auto_1829262 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829259 ?auto_1829260 ?auto_1829261 )
      ( MAKE-10CRATE-VERIFY ?auto_1829251 ?auto_1829252 ?auto_1829253 ?auto_1829254 ?auto_1829255 ?auto_1829256 ?auto_1829257 ?auto_1829258 ?auto_1829259 ?auto_1829260 ?auto_1829261 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829377 - SURFACE
      ?auto_1829378 - SURFACE
      ?auto_1829379 - SURFACE
      ?auto_1829380 - SURFACE
      ?auto_1829381 - SURFACE
      ?auto_1829382 - SURFACE
      ?auto_1829383 - SURFACE
      ?auto_1829384 - SURFACE
      ?auto_1829385 - SURFACE
      ?auto_1829386 - SURFACE
      ?auto_1829387 - SURFACE
    )
    :vars
    (
      ?auto_1829393 - HOIST
      ?auto_1829392 - PLACE
      ?auto_1829391 - PLACE
      ?auto_1829389 - HOIST
      ?auto_1829390 - SURFACE
      ?auto_1829388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829393 ?auto_1829392 ) ( SURFACE-AT ?auto_1829386 ?auto_1829392 ) ( CLEAR ?auto_1829386 ) ( IS-CRATE ?auto_1829387 ) ( not ( = ?auto_1829386 ?auto_1829387 ) ) ( AVAILABLE ?auto_1829393 ) ( ON ?auto_1829386 ?auto_1829385 ) ( not ( = ?auto_1829385 ?auto_1829386 ) ) ( not ( = ?auto_1829385 ?auto_1829387 ) ) ( not ( = ?auto_1829391 ?auto_1829392 ) ) ( HOIST-AT ?auto_1829389 ?auto_1829391 ) ( not ( = ?auto_1829393 ?auto_1829389 ) ) ( AVAILABLE ?auto_1829389 ) ( SURFACE-AT ?auto_1829387 ?auto_1829391 ) ( ON ?auto_1829387 ?auto_1829390 ) ( CLEAR ?auto_1829387 ) ( not ( = ?auto_1829386 ?auto_1829390 ) ) ( not ( = ?auto_1829387 ?auto_1829390 ) ) ( not ( = ?auto_1829385 ?auto_1829390 ) ) ( TRUCK-AT ?auto_1829388 ?auto_1829392 ) ( ON ?auto_1829378 ?auto_1829377 ) ( ON ?auto_1829379 ?auto_1829378 ) ( ON ?auto_1829380 ?auto_1829379 ) ( ON ?auto_1829381 ?auto_1829380 ) ( ON ?auto_1829382 ?auto_1829381 ) ( ON ?auto_1829383 ?auto_1829382 ) ( ON ?auto_1829384 ?auto_1829383 ) ( ON ?auto_1829385 ?auto_1829384 ) ( not ( = ?auto_1829377 ?auto_1829378 ) ) ( not ( = ?auto_1829377 ?auto_1829379 ) ) ( not ( = ?auto_1829377 ?auto_1829380 ) ) ( not ( = ?auto_1829377 ?auto_1829381 ) ) ( not ( = ?auto_1829377 ?auto_1829382 ) ) ( not ( = ?auto_1829377 ?auto_1829383 ) ) ( not ( = ?auto_1829377 ?auto_1829384 ) ) ( not ( = ?auto_1829377 ?auto_1829385 ) ) ( not ( = ?auto_1829377 ?auto_1829386 ) ) ( not ( = ?auto_1829377 ?auto_1829387 ) ) ( not ( = ?auto_1829377 ?auto_1829390 ) ) ( not ( = ?auto_1829378 ?auto_1829379 ) ) ( not ( = ?auto_1829378 ?auto_1829380 ) ) ( not ( = ?auto_1829378 ?auto_1829381 ) ) ( not ( = ?auto_1829378 ?auto_1829382 ) ) ( not ( = ?auto_1829378 ?auto_1829383 ) ) ( not ( = ?auto_1829378 ?auto_1829384 ) ) ( not ( = ?auto_1829378 ?auto_1829385 ) ) ( not ( = ?auto_1829378 ?auto_1829386 ) ) ( not ( = ?auto_1829378 ?auto_1829387 ) ) ( not ( = ?auto_1829378 ?auto_1829390 ) ) ( not ( = ?auto_1829379 ?auto_1829380 ) ) ( not ( = ?auto_1829379 ?auto_1829381 ) ) ( not ( = ?auto_1829379 ?auto_1829382 ) ) ( not ( = ?auto_1829379 ?auto_1829383 ) ) ( not ( = ?auto_1829379 ?auto_1829384 ) ) ( not ( = ?auto_1829379 ?auto_1829385 ) ) ( not ( = ?auto_1829379 ?auto_1829386 ) ) ( not ( = ?auto_1829379 ?auto_1829387 ) ) ( not ( = ?auto_1829379 ?auto_1829390 ) ) ( not ( = ?auto_1829380 ?auto_1829381 ) ) ( not ( = ?auto_1829380 ?auto_1829382 ) ) ( not ( = ?auto_1829380 ?auto_1829383 ) ) ( not ( = ?auto_1829380 ?auto_1829384 ) ) ( not ( = ?auto_1829380 ?auto_1829385 ) ) ( not ( = ?auto_1829380 ?auto_1829386 ) ) ( not ( = ?auto_1829380 ?auto_1829387 ) ) ( not ( = ?auto_1829380 ?auto_1829390 ) ) ( not ( = ?auto_1829381 ?auto_1829382 ) ) ( not ( = ?auto_1829381 ?auto_1829383 ) ) ( not ( = ?auto_1829381 ?auto_1829384 ) ) ( not ( = ?auto_1829381 ?auto_1829385 ) ) ( not ( = ?auto_1829381 ?auto_1829386 ) ) ( not ( = ?auto_1829381 ?auto_1829387 ) ) ( not ( = ?auto_1829381 ?auto_1829390 ) ) ( not ( = ?auto_1829382 ?auto_1829383 ) ) ( not ( = ?auto_1829382 ?auto_1829384 ) ) ( not ( = ?auto_1829382 ?auto_1829385 ) ) ( not ( = ?auto_1829382 ?auto_1829386 ) ) ( not ( = ?auto_1829382 ?auto_1829387 ) ) ( not ( = ?auto_1829382 ?auto_1829390 ) ) ( not ( = ?auto_1829383 ?auto_1829384 ) ) ( not ( = ?auto_1829383 ?auto_1829385 ) ) ( not ( = ?auto_1829383 ?auto_1829386 ) ) ( not ( = ?auto_1829383 ?auto_1829387 ) ) ( not ( = ?auto_1829383 ?auto_1829390 ) ) ( not ( = ?auto_1829384 ?auto_1829385 ) ) ( not ( = ?auto_1829384 ?auto_1829386 ) ) ( not ( = ?auto_1829384 ?auto_1829387 ) ) ( not ( = ?auto_1829384 ?auto_1829390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829385 ?auto_1829386 ?auto_1829387 )
      ( MAKE-10CRATE-VERIFY ?auto_1829377 ?auto_1829378 ?auto_1829379 ?auto_1829380 ?auto_1829381 ?auto_1829382 ?auto_1829383 ?auto_1829384 ?auto_1829385 ?auto_1829386 ?auto_1829387 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829503 - SURFACE
      ?auto_1829504 - SURFACE
      ?auto_1829505 - SURFACE
      ?auto_1829506 - SURFACE
      ?auto_1829507 - SURFACE
      ?auto_1829508 - SURFACE
      ?auto_1829509 - SURFACE
      ?auto_1829510 - SURFACE
      ?auto_1829511 - SURFACE
      ?auto_1829512 - SURFACE
      ?auto_1829513 - SURFACE
    )
    :vars
    (
      ?auto_1829519 - HOIST
      ?auto_1829518 - PLACE
      ?auto_1829514 - PLACE
      ?auto_1829515 - HOIST
      ?auto_1829517 - SURFACE
      ?auto_1829516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829519 ?auto_1829518 ) ( IS-CRATE ?auto_1829513 ) ( not ( = ?auto_1829512 ?auto_1829513 ) ) ( not ( = ?auto_1829511 ?auto_1829512 ) ) ( not ( = ?auto_1829511 ?auto_1829513 ) ) ( not ( = ?auto_1829514 ?auto_1829518 ) ) ( HOIST-AT ?auto_1829515 ?auto_1829514 ) ( not ( = ?auto_1829519 ?auto_1829515 ) ) ( AVAILABLE ?auto_1829515 ) ( SURFACE-AT ?auto_1829513 ?auto_1829514 ) ( ON ?auto_1829513 ?auto_1829517 ) ( CLEAR ?auto_1829513 ) ( not ( = ?auto_1829512 ?auto_1829517 ) ) ( not ( = ?auto_1829513 ?auto_1829517 ) ) ( not ( = ?auto_1829511 ?auto_1829517 ) ) ( TRUCK-AT ?auto_1829516 ?auto_1829518 ) ( SURFACE-AT ?auto_1829511 ?auto_1829518 ) ( CLEAR ?auto_1829511 ) ( LIFTING ?auto_1829519 ?auto_1829512 ) ( IS-CRATE ?auto_1829512 ) ( ON ?auto_1829504 ?auto_1829503 ) ( ON ?auto_1829505 ?auto_1829504 ) ( ON ?auto_1829506 ?auto_1829505 ) ( ON ?auto_1829507 ?auto_1829506 ) ( ON ?auto_1829508 ?auto_1829507 ) ( ON ?auto_1829509 ?auto_1829508 ) ( ON ?auto_1829510 ?auto_1829509 ) ( ON ?auto_1829511 ?auto_1829510 ) ( not ( = ?auto_1829503 ?auto_1829504 ) ) ( not ( = ?auto_1829503 ?auto_1829505 ) ) ( not ( = ?auto_1829503 ?auto_1829506 ) ) ( not ( = ?auto_1829503 ?auto_1829507 ) ) ( not ( = ?auto_1829503 ?auto_1829508 ) ) ( not ( = ?auto_1829503 ?auto_1829509 ) ) ( not ( = ?auto_1829503 ?auto_1829510 ) ) ( not ( = ?auto_1829503 ?auto_1829511 ) ) ( not ( = ?auto_1829503 ?auto_1829512 ) ) ( not ( = ?auto_1829503 ?auto_1829513 ) ) ( not ( = ?auto_1829503 ?auto_1829517 ) ) ( not ( = ?auto_1829504 ?auto_1829505 ) ) ( not ( = ?auto_1829504 ?auto_1829506 ) ) ( not ( = ?auto_1829504 ?auto_1829507 ) ) ( not ( = ?auto_1829504 ?auto_1829508 ) ) ( not ( = ?auto_1829504 ?auto_1829509 ) ) ( not ( = ?auto_1829504 ?auto_1829510 ) ) ( not ( = ?auto_1829504 ?auto_1829511 ) ) ( not ( = ?auto_1829504 ?auto_1829512 ) ) ( not ( = ?auto_1829504 ?auto_1829513 ) ) ( not ( = ?auto_1829504 ?auto_1829517 ) ) ( not ( = ?auto_1829505 ?auto_1829506 ) ) ( not ( = ?auto_1829505 ?auto_1829507 ) ) ( not ( = ?auto_1829505 ?auto_1829508 ) ) ( not ( = ?auto_1829505 ?auto_1829509 ) ) ( not ( = ?auto_1829505 ?auto_1829510 ) ) ( not ( = ?auto_1829505 ?auto_1829511 ) ) ( not ( = ?auto_1829505 ?auto_1829512 ) ) ( not ( = ?auto_1829505 ?auto_1829513 ) ) ( not ( = ?auto_1829505 ?auto_1829517 ) ) ( not ( = ?auto_1829506 ?auto_1829507 ) ) ( not ( = ?auto_1829506 ?auto_1829508 ) ) ( not ( = ?auto_1829506 ?auto_1829509 ) ) ( not ( = ?auto_1829506 ?auto_1829510 ) ) ( not ( = ?auto_1829506 ?auto_1829511 ) ) ( not ( = ?auto_1829506 ?auto_1829512 ) ) ( not ( = ?auto_1829506 ?auto_1829513 ) ) ( not ( = ?auto_1829506 ?auto_1829517 ) ) ( not ( = ?auto_1829507 ?auto_1829508 ) ) ( not ( = ?auto_1829507 ?auto_1829509 ) ) ( not ( = ?auto_1829507 ?auto_1829510 ) ) ( not ( = ?auto_1829507 ?auto_1829511 ) ) ( not ( = ?auto_1829507 ?auto_1829512 ) ) ( not ( = ?auto_1829507 ?auto_1829513 ) ) ( not ( = ?auto_1829507 ?auto_1829517 ) ) ( not ( = ?auto_1829508 ?auto_1829509 ) ) ( not ( = ?auto_1829508 ?auto_1829510 ) ) ( not ( = ?auto_1829508 ?auto_1829511 ) ) ( not ( = ?auto_1829508 ?auto_1829512 ) ) ( not ( = ?auto_1829508 ?auto_1829513 ) ) ( not ( = ?auto_1829508 ?auto_1829517 ) ) ( not ( = ?auto_1829509 ?auto_1829510 ) ) ( not ( = ?auto_1829509 ?auto_1829511 ) ) ( not ( = ?auto_1829509 ?auto_1829512 ) ) ( not ( = ?auto_1829509 ?auto_1829513 ) ) ( not ( = ?auto_1829509 ?auto_1829517 ) ) ( not ( = ?auto_1829510 ?auto_1829511 ) ) ( not ( = ?auto_1829510 ?auto_1829512 ) ) ( not ( = ?auto_1829510 ?auto_1829513 ) ) ( not ( = ?auto_1829510 ?auto_1829517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829511 ?auto_1829512 ?auto_1829513 )
      ( MAKE-10CRATE-VERIFY ?auto_1829503 ?auto_1829504 ?auto_1829505 ?auto_1829506 ?auto_1829507 ?auto_1829508 ?auto_1829509 ?auto_1829510 ?auto_1829511 ?auto_1829512 ?auto_1829513 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829629 - SURFACE
      ?auto_1829630 - SURFACE
      ?auto_1829631 - SURFACE
      ?auto_1829632 - SURFACE
      ?auto_1829633 - SURFACE
      ?auto_1829634 - SURFACE
      ?auto_1829635 - SURFACE
      ?auto_1829636 - SURFACE
      ?auto_1829637 - SURFACE
      ?auto_1829638 - SURFACE
      ?auto_1829639 - SURFACE
    )
    :vars
    (
      ?auto_1829640 - HOIST
      ?auto_1829641 - PLACE
      ?auto_1829644 - PLACE
      ?auto_1829643 - HOIST
      ?auto_1829645 - SURFACE
      ?auto_1829642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829640 ?auto_1829641 ) ( IS-CRATE ?auto_1829639 ) ( not ( = ?auto_1829638 ?auto_1829639 ) ) ( not ( = ?auto_1829637 ?auto_1829638 ) ) ( not ( = ?auto_1829637 ?auto_1829639 ) ) ( not ( = ?auto_1829644 ?auto_1829641 ) ) ( HOIST-AT ?auto_1829643 ?auto_1829644 ) ( not ( = ?auto_1829640 ?auto_1829643 ) ) ( AVAILABLE ?auto_1829643 ) ( SURFACE-AT ?auto_1829639 ?auto_1829644 ) ( ON ?auto_1829639 ?auto_1829645 ) ( CLEAR ?auto_1829639 ) ( not ( = ?auto_1829638 ?auto_1829645 ) ) ( not ( = ?auto_1829639 ?auto_1829645 ) ) ( not ( = ?auto_1829637 ?auto_1829645 ) ) ( TRUCK-AT ?auto_1829642 ?auto_1829641 ) ( SURFACE-AT ?auto_1829637 ?auto_1829641 ) ( CLEAR ?auto_1829637 ) ( IS-CRATE ?auto_1829638 ) ( AVAILABLE ?auto_1829640 ) ( IN ?auto_1829638 ?auto_1829642 ) ( ON ?auto_1829630 ?auto_1829629 ) ( ON ?auto_1829631 ?auto_1829630 ) ( ON ?auto_1829632 ?auto_1829631 ) ( ON ?auto_1829633 ?auto_1829632 ) ( ON ?auto_1829634 ?auto_1829633 ) ( ON ?auto_1829635 ?auto_1829634 ) ( ON ?auto_1829636 ?auto_1829635 ) ( ON ?auto_1829637 ?auto_1829636 ) ( not ( = ?auto_1829629 ?auto_1829630 ) ) ( not ( = ?auto_1829629 ?auto_1829631 ) ) ( not ( = ?auto_1829629 ?auto_1829632 ) ) ( not ( = ?auto_1829629 ?auto_1829633 ) ) ( not ( = ?auto_1829629 ?auto_1829634 ) ) ( not ( = ?auto_1829629 ?auto_1829635 ) ) ( not ( = ?auto_1829629 ?auto_1829636 ) ) ( not ( = ?auto_1829629 ?auto_1829637 ) ) ( not ( = ?auto_1829629 ?auto_1829638 ) ) ( not ( = ?auto_1829629 ?auto_1829639 ) ) ( not ( = ?auto_1829629 ?auto_1829645 ) ) ( not ( = ?auto_1829630 ?auto_1829631 ) ) ( not ( = ?auto_1829630 ?auto_1829632 ) ) ( not ( = ?auto_1829630 ?auto_1829633 ) ) ( not ( = ?auto_1829630 ?auto_1829634 ) ) ( not ( = ?auto_1829630 ?auto_1829635 ) ) ( not ( = ?auto_1829630 ?auto_1829636 ) ) ( not ( = ?auto_1829630 ?auto_1829637 ) ) ( not ( = ?auto_1829630 ?auto_1829638 ) ) ( not ( = ?auto_1829630 ?auto_1829639 ) ) ( not ( = ?auto_1829630 ?auto_1829645 ) ) ( not ( = ?auto_1829631 ?auto_1829632 ) ) ( not ( = ?auto_1829631 ?auto_1829633 ) ) ( not ( = ?auto_1829631 ?auto_1829634 ) ) ( not ( = ?auto_1829631 ?auto_1829635 ) ) ( not ( = ?auto_1829631 ?auto_1829636 ) ) ( not ( = ?auto_1829631 ?auto_1829637 ) ) ( not ( = ?auto_1829631 ?auto_1829638 ) ) ( not ( = ?auto_1829631 ?auto_1829639 ) ) ( not ( = ?auto_1829631 ?auto_1829645 ) ) ( not ( = ?auto_1829632 ?auto_1829633 ) ) ( not ( = ?auto_1829632 ?auto_1829634 ) ) ( not ( = ?auto_1829632 ?auto_1829635 ) ) ( not ( = ?auto_1829632 ?auto_1829636 ) ) ( not ( = ?auto_1829632 ?auto_1829637 ) ) ( not ( = ?auto_1829632 ?auto_1829638 ) ) ( not ( = ?auto_1829632 ?auto_1829639 ) ) ( not ( = ?auto_1829632 ?auto_1829645 ) ) ( not ( = ?auto_1829633 ?auto_1829634 ) ) ( not ( = ?auto_1829633 ?auto_1829635 ) ) ( not ( = ?auto_1829633 ?auto_1829636 ) ) ( not ( = ?auto_1829633 ?auto_1829637 ) ) ( not ( = ?auto_1829633 ?auto_1829638 ) ) ( not ( = ?auto_1829633 ?auto_1829639 ) ) ( not ( = ?auto_1829633 ?auto_1829645 ) ) ( not ( = ?auto_1829634 ?auto_1829635 ) ) ( not ( = ?auto_1829634 ?auto_1829636 ) ) ( not ( = ?auto_1829634 ?auto_1829637 ) ) ( not ( = ?auto_1829634 ?auto_1829638 ) ) ( not ( = ?auto_1829634 ?auto_1829639 ) ) ( not ( = ?auto_1829634 ?auto_1829645 ) ) ( not ( = ?auto_1829635 ?auto_1829636 ) ) ( not ( = ?auto_1829635 ?auto_1829637 ) ) ( not ( = ?auto_1829635 ?auto_1829638 ) ) ( not ( = ?auto_1829635 ?auto_1829639 ) ) ( not ( = ?auto_1829635 ?auto_1829645 ) ) ( not ( = ?auto_1829636 ?auto_1829637 ) ) ( not ( = ?auto_1829636 ?auto_1829638 ) ) ( not ( = ?auto_1829636 ?auto_1829639 ) ) ( not ( = ?auto_1829636 ?auto_1829645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829637 ?auto_1829638 ?auto_1829639 )
      ( MAKE-10CRATE-VERIFY ?auto_1829629 ?auto_1829630 ?auto_1829631 ?auto_1829632 ?auto_1829633 ?auto_1829634 ?auto_1829635 ?auto_1829636 ?auto_1829637 ?auto_1829638 ?auto_1829639 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1834687 - SURFACE
      ?auto_1834688 - SURFACE
    )
    :vars
    (
      ?auto_1834693 - HOIST
      ?auto_1834690 - PLACE
      ?auto_1834692 - SURFACE
      ?auto_1834691 - PLACE
      ?auto_1834694 - HOIST
      ?auto_1834689 - SURFACE
      ?auto_1834695 - TRUCK
      ?auto_1834696 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1834693 ?auto_1834690 ) ( SURFACE-AT ?auto_1834687 ?auto_1834690 ) ( CLEAR ?auto_1834687 ) ( IS-CRATE ?auto_1834688 ) ( not ( = ?auto_1834687 ?auto_1834688 ) ) ( ON ?auto_1834687 ?auto_1834692 ) ( not ( = ?auto_1834692 ?auto_1834687 ) ) ( not ( = ?auto_1834692 ?auto_1834688 ) ) ( not ( = ?auto_1834691 ?auto_1834690 ) ) ( HOIST-AT ?auto_1834694 ?auto_1834691 ) ( not ( = ?auto_1834693 ?auto_1834694 ) ) ( AVAILABLE ?auto_1834694 ) ( SURFACE-AT ?auto_1834688 ?auto_1834691 ) ( ON ?auto_1834688 ?auto_1834689 ) ( CLEAR ?auto_1834688 ) ( not ( = ?auto_1834687 ?auto_1834689 ) ) ( not ( = ?auto_1834688 ?auto_1834689 ) ) ( not ( = ?auto_1834692 ?auto_1834689 ) ) ( TRUCK-AT ?auto_1834695 ?auto_1834690 ) ( LIFTING ?auto_1834693 ?auto_1834696 ) ( IS-CRATE ?auto_1834696 ) ( not ( = ?auto_1834687 ?auto_1834696 ) ) ( not ( = ?auto_1834688 ?auto_1834696 ) ) ( not ( = ?auto_1834692 ?auto_1834696 ) ) ( not ( = ?auto_1834689 ?auto_1834696 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1834693 ?auto_1834696 ?auto_1834695 ?auto_1834690 )
      ( MAKE-1CRATE ?auto_1834687 ?auto_1834688 )
      ( MAKE-1CRATE-VERIFY ?auto_1834687 ?auto_1834688 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1836899 - SURFACE
      ?auto_1836900 - SURFACE
      ?auto_1836901 - SURFACE
      ?auto_1836902 - SURFACE
      ?auto_1836903 - SURFACE
      ?auto_1836904 - SURFACE
      ?auto_1836905 - SURFACE
      ?auto_1836906 - SURFACE
      ?auto_1836907 - SURFACE
      ?auto_1836908 - SURFACE
      ?auto_1836909 - SURFACE
      ?auto_1836910 - SURFACE
    )
    :vars
    (
      ?auto_1836911 - HOIST
      ?auto_1836912 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1836911 ?auto_1836912 ) ( SURFACE-AT ?auto_1836909 ?auto_1836912 ) ( CLEAR ?auto_1836909 ) ( LIFTING ?auto_1836911 ?auto_1836910 ) ( IS-CRATE ?auto_1836910 ) ( not ( = ?auto_1836909 ?auto_1836910 ) ) ( ON ?auto_1836900 ?auto_1836899 ) ( ON ?auto_1836901 ?auto_1836900 ) ( ON ?auto_1836902 ?auto_1836901 ) ( ON ?auto_1836903 ?auto_1836902 ) ( ON ?auto_1836904 ?auto_1836903 ) ( ON ?auto_1836905 ?auto_1836904 ) ( ON ?auto_1836906 ?auto_1836905 ) ( ON ?auto_1836907 ?auto_1836906 ) ( ON ?auto_1836908 ?auto_1836907 ) ( ON ?auto_1836909 ?auto_1836908 ) ( not ( = ?auto_1836899 ?auto_1836900 ) ) ( not ( = ?auto_1836899 ?auto_1836901 ) ) ( not ( = ?auto_1836899 ?auto_1836902 ) ) ( not ( = ?auto_1836899 ?auto_1836903 ) ) ( not ( = ?auto_1836899 ?auto_1836904 ) ) ( not ( = ?auto_1836899 ?auto_1836905 ) ) ( not ( = ?auto_1836899 ?auto_1836906 ) ) ( not ( = ?auto_1836899 ?auto_1836907 ) ) ( not ( = ?auto_1836899 ?auto_1836908 ) ) ( not ( = ?auto_1836899 ?auto_1836909 ) ) ( not ( = ?auto_1836899 ?auto_1836910 ) ) ( not ( = ?auto_1836900 ?auto_1836901 ) ) ( not ( = ?auto_1836900 ?auto_1836902 ) ) ( not ( = ?auto_1836900 ?auto_1836903 ) ) ( not ( = ?auto_1836900 ?auto_1836904 ) ) ( not ( = ?auto_1836900 ?auto_1836905 ) ) ( not ( = ?auto_1836900 ?auto_1836906 ) ) ( not ( = ?auto_1836900 ?auto_1836907 ) ) ( not ( = ?auto_1836900 ?auto_1836908 ) ) ( not ( = ?auto_1836900 ?auto_1836909 ) ) ( not ( = ?auto_1836900 ?auto_1836910 ) ) ( not ( = ?auto_1836901 ?auto_1836902 ) ) ( not ( = ?auto_1836901 ?auto_1836903 ) ) ( not ( = ?auto_1836901 ?auto_1836904 ) ) ( not ( = ?auto_1836901 ?auto_1836905 ) ) ( not ( = ?auto_1836901 ?auto_1836906 ) ) ( not ( = ?auto_1836901 ?auto_1836907 ) ) ( not ( = ?auto_1836901 ?auto_1836908 ) ) ( not ( = ?auto_1836901 ?auto_1836909 ) ) ( not ( = ?auto_1836901 ?auto_1836910 ) ) ( not ( = ?auto_1836902 ?auto_1836903 ) ) ( not ( = ?auto_1836902 ?auto_1836904 ) ) ( not ( = ?auto_1836902 ?auto_1836905 ) ) ( not ( = ?auto_1836902 ?auto_1836906 ) ) ( not ( = ?auto_1836902 ?auto_1836907 ) ) ( not ( = ?auto_1836902 ?auto_1836908 ) ) ( not ( = ?auto_1836902 ?auto_1836909 ) ) ( not ( = ?auto_1836902 ?auto_1836910 ) ) ( not ( = ?auto_1836903 ?auto_1836904 ) ) ( not ( = ?auto_1836903 ?auto_1836905 ) ) ( not ( = ?auto_1836903 ?auto_1836906 ) ) ( not ( = ?auto_1836903 ?auto_1836907 ) ) ( not ( = ?auto_1836903 ?auto_1836908 ) ) ( not ( = ?auto_1836903 ?auto_1836909 ) ) ( not ( = ?auto_1836903 ?auto_1836910 ) ) ( not ( = ?auto_1836904 ?auto_1836905 ) ) ( not ( = ?auto_1836904 ?auto_1836906 ) ) ( not ( = ?auto_1836904 ?auto_1836907 ) ) ( not ( = ?auto_1836904 ?auto_1836908 ) ) ( not ( = ?auto_1836904 ?auto_1836909 ) ) ( not ( = ?auto_1836904 ?auto_1836910 ) ) ( not ( = ?auto_1836905 ?auto_1836906 ) ) ( not ( = ?auto_1836905 ?auto_1836907 ) ) ( not ( = ?auto_1836905 ?auto_1836908 ) ) ( not ( = ?auto_1836905 ?auto_1836909 ) ) ( not ( = ?auto_1836905 ?auto_1836910 ) ) ( not ( = ?auto_1836906 ?auto_1836907 ) ) ( not ( = ?auto_1836906 ?auto_1836908 ) ) ( not ( = ?auto_1836906 ?auto_1836909 ) ) ( not ( = ?auto_1836906 ?auto_1836910 ) ) ( not ( = ?auto_1836907 ?auto_1836908 ) ) ( not ( = ?auto_1836907 ?auto_1836909 ) ) ( not ( = ?auto_1836907 ?auto_1836910 ) ) ( not ( = ?auto_1836908 ?auto_1836909 ) ) ( not ( = ?auto_1836908 ?auto_1836910 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1836909 ?auto_1836910 )
      ( MAKE-11CRATE-VERIFY ?auto_1836899 ?auto_1836900 ?auto_1836901 ?auto_1836902 ?auto_1836903 ?auto_1836904 ?auto_1836905 ?auto_1836906 ?auto_1836907 ?auto_1836908 ?auto_1836909 ?auto_1836910 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837008 - SURFACE
      ?auto_1837009 - SURFACE
      ?auto_1837010 - SURFACE
      ?auto_1837011 - SURFACE
      ?auto_1837012 - SURFACE
      ?auto_1837013 - SURFACE
      ?auto_1837014 - SURFACE
      ?auto_1837015 - SURFACE
      ?auto_1837016 - SURFACE
      ?auto_1837017 - SURFACE
      ?auto_1837018 - SURFACE
      ?auto_1837019 - SURFACE
    )
    :vars
    (
      ?auto_1837022 - HOIST
      ?auto_1837020 - PLACE
      ?auto_1837021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837022 ?auto_1837020 ) ( SURFACE-AT ?auto_1837018 ?auto_1837020 ) ( CLEAR ?auto_1837018 ) ( IS-CRATE ?auto_1837019 ) ( not ( = ?auto_1837018 ?auto_1837019 ) ) ( TRUCK-AT ?auto_1837021 ?auto_1837020 ) ( AVAILABLE ?auto_1837022 ) ( IN ?auto_1837019 ?auto_1837021 ) ( ON ?auto_1837018 ?auto_1837017 ) ( not ( = ?auto_1837017 ?auto_1837018 ) ) ( not ( = ?auto_1837017 ?auto_1837019 ) ) ( ON ?auto_1837009 ?auto_1837008 ) ( ON ?auto_1837010 ?auto_1837009 ) ( ON ?auto_1837011 ?auto_1837010 ) ( ON ?auto_1837012 ?auto_1837011 ) ( ON ?auto_1837013 ?auto_1837012 ) ( ON ?auto_1837014 ?auto_1837013 ) ( ON ?auto_1837015 ?auto_1837014 ) ( ON ?auto_1837016 ?auto_1837015 ) ( ON ?auto_1837017 ?auto_1837016 ) ( not ( = ?auto_1837008 ?auto_1837009 ) ) ( not ( = ?auto_1837008 ?auto_1837010 ) ) ( not ( = ?auto_1837008 ?auto_1837011 ) ) ( not ( = ?auto_1837008 ?auto_1837012 ) ) ( not ( = ?auto_1837008 ?auto_1837013 ) ) ( not ( = ?auto_1837008 ?auto_1837014 ) ) ( not ( = ?auto_1837008 ?auto_1837015 ) ) ( not ( = ?auto_1837008 ?auto_1837016 ) ) ( not ( = ?auto_1837008 ?auto_1837017 ) ) ( not ( = ?auto_1837008 ?auto_1837018 ) ) ( not ( = ?auto_1837008 ?auto_1837019 ) ) ( not ( = ?auto_1837009 ?auto_1837010 ) ) ( not ( = ?auto_1837009 ?auto_1837011 ) ) ( not ( = ?auto_1837009 ?auto_1837012 ) ) ( not ( = ?auto_1837009 ?auto_1837013 ) ) ( not ( = ?auto_1837009 ?auto_1837014 ) ) ( not ( = ?auto_1837009 ?auto_1837015 ) ) ( not ( = ?auto_1837009 ?auto_1837016 ) ) ( not ( = ?auto_1837009 ?auto_1837017 ) ) ( not ( = ?auto_1837009 ?auto_1837018 ) ) ( not ( = ?auto_1837009 ?auto_1837019 ) ) ( not ( = ?auto_1837010 ?auto_1837011 ) ) ( not ( = ?auto_1837010 ?auto_1837012 ) ) ( not ( = ?auto_1837010 ?auto_1837013 ) ) ( not ( = ?auto_1837010 ?auto_1837014 ) ) ( not ( = ?auto_1837010 ?auto_1837015 ) ) ( not ( = ?auto_1837010 ?auto_1837016 ) ) ( not ( = ?auto_1837010 ?auto_1837017 ) ) ( not ( = ?auto_1837010 ?auto_1837018 ) ) ( not ( = ?auto_1837010 ?auto_1837019 ) ) ( not ( = ?auto_1837011 ?auto_1837012 ) ) ( not ( = ?auto_1837011 ?auto_1837013 ) ) ( not ( = ?auto_1837011 ?auto_1837014 ) ) ( not ( = ?auto_1837011 ?auto_1837015 ) ) ( not ( = ?auto_1837011 ?auto_1837016 ) ) ( not ( = ?auto_1837011 ?auto_1837017 ) ) ( not ( = ?auto_1837011 ?auto_1837018 ) ) ( not ( = ?auto_1837011 ?auto_1837019 ) ) ( not ( = ?auto_1837012 ?auto_1837013 ) ) ( not ( = ?auto_1837012 ?auto_1837014 ) ) ( not ( = ?auto_1837012 ?auto_1837015 ) ) ( not ( = ?auto_1837012 ?auto_1837016 ) ) ( not ( = ?auto_1837012 ?auto_1837017 ) ) ( not ( = ?auto_1837012 ?auto_1837018 ) ) ( not ( = ?auto_1837012 ?auto_1837019 ) ) ( not ( = ?auto_1837013 ?auto_1837014 ) ) ( not ( = ?auto_1837013 ?auto_1837015 ) ) ( not ( = ?auto_1837013 ?auto_1837016 ) ) ( not ( = ?auto_1837013 ?auto_1837017 ) ) ( not ( = ?auto_1837013 ?auto_1837018 ) ) ( not ( = ?auto_1837013 ?auto_1837019 ) ) ( not ( = ?auto_1837014 ?auto_1837015 ) ) ( not ( = ?auto_1837014 ?auto_1837016 ) ) ( not ( = ?auto_1837014 ?auto_1837017 ) ) ( not ( = ?auto_1837014 ?auto_1837018 ) ) ( not ( = ?auto_1837014 ?auto_1837019 ) ) ( not ( = ?auto_1837015 ?auto_1837016 ) ) ( not ( = ?auto_1837015 ?auto_1837017 ) ) ( not ( = ?auto_1837015 ?auto_1837018 ) ) ( not ( = ?auto_1837015 ?auto_1837019 ) ) ( not ( = ?auto_1837016 ?auto_1837017 ) ) ( not ( = ?auto_1837016 ?auto_1837018 ) ) ( not ( = ?auto_1837016 ?auto_1837019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837017 ?auto_1837018 ?auto_1837019 )
      ( MAKE-11CRATE-VERIFY ?auto_1837008 ?auto_1837009 ?auto_1837010 ?auto_1837011 ?auto_1837012 ?auto_1837013 ?auto_1837014 ?auto_1837015 ?auto_1837016 ?auto_1837017 ?auto_1837018 ?auto_1837019 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837129 - SURFACE
      ?auto_1837130 - SURFACE
      ?auto_1837131 - SURFACE
      ?auto_1837132 - SURFACE
      ?auto_1837133 - SURFACE
      ?auto_1837134 - SURFACE
      ?auto_1837135 - SURFACE
      ?auto_1837136 - SURFACE
      ?auto_1837137 - SURFACE
      ?auto_1837138 - SURFACE
      ?auto_1837139 - SURFACE
      ?auto_1837140 - SURFACE
    )
    :vars
    (
      ?auto_1837144 - HOIST
      ?auto_1837141 - PLACE
      ?auto_1837143 - TRUCK
      ?auto_1837142 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837144 ?auto_1837141 ) ( SURFACE-AT ?auto_1837139 ?auto_1837141 ) ( CLEAR ?auto_1837139 ) ( IS-CRATE ?auto_1837140 ) ( not ( = ?auto_1837139 ?auto_1837140 ) ) ( AVAILABLE ?auto_1837144 ) ( IN ?auto_1837140 ?auto_1837143 ) ( ON ?auto_1837139 ?auto_1837138 ) ( not ( = ?auto_1837138 ?auto_1837139 ) ) ( not ( = ?auto_1837138 ?auto_1837140 ) ) ( TRUCK-AT ?auto_1837143 ?auto_1837142 ) ( not ( = ?auto_1837142 ?auto_1837141 ) ) ( ON ?auto_1837130 ?auto_1837129 ) ( ON ?auto_1837131 ?auto_1837130 ) ( ON ?auto_1837132 ?auto_1837131 ) ( ON ?auto_1837133 ?auto_1837132 ) ( ON ?auto_1837134 ?auto_1837133 ) ( ON ?auto_1837135 ?auto_1837134 ) ( ON ?auto_1837136 ?auto_1837135 ) ( ON ?auto_1837137 ?auto_1837136 ) ( ON ?auto_1837138 ?auto_1837137 ) ( not ( = ?auto_1837129 ?auto_1837130 ) ) ( not ( = ?auto_1837129 ?auto_1837131 ) ) ( not ( = ?auto_1837129 ?auto_1837132 ) ) ( not ( = ?auto_1837129 ?auto_1837133 ) ) ( not ( = ?auto_1837129 ?auto_1837134 ) ) ( not ( = ?auto_1837129 ?auto_1837135 ) ) ( not ( = ?auto_1837129 ?auto_1837136 ) ) ( not ( = ?auto_1837129 ?auto_1837137 ) ) ( not ( = ?auto_1837129 ?auto_1837138 ) ) ( not ( = ?auto_1837129 ?auto_1837139 ) ) ( not ( = ?auto_1837129 ?auto_1837140 ) ) ( not ( = ?auto_1837130 ?auto_1837131 ) ) ( not ( = ?auto_1837130 ?auto_1837132 ) ) ( not ( = ?auto_1837130 ?auto_1837133 ) ) ( not ( = ?auto_1837130 ?auto_1837134 ) ) ( not ( = ?auto_1837130 ?auto_1837135 ) ) ( not ( = ?auto_1837130 ?auto_1837136 ) ) ( not ( = ?auto_1837130 ?auto_1837137 ) ) ( not ( = ?auto_1837130 ?auto_1837138 ) ) ( not ( = ?auto_1837130 ?auto_1837139 ) ) ( not ( = ?auto_1837130 ?auto_1837140 ) ) ( not ( = ?auto_1837131 ?auto_1837132 ) ) ( not ( = ?auto_1837131 ?auto_1837133 ) ) ( not ( = ?auto_1837131 ?auto_1837134 ) ) ( not ( = ?auto_1837131 ?auto_1837135 ) ) ( not ( = ?auto_1837131 ?auto_1837136 ) ) ( not ( = ?auto_1837131 ?auto_1837137 ) ) ( not ( = ?auto_1837131 ?auto_1837138 ) ) ( not ( = ?auto_1837131 ?auto_1837139 ) ) ( not ( = ?auto_1837131 ?auto_1837140 ) ) ( not ( = ?auto_1837132 ?auto_1837133 ) ) ( not ( = ?auto_1837132 ?auto_1837134 ) ) ( not ( = ?auto_1837132 ?auto_1837135 ) ) ( not ( = ?auto_1837132 ?auto_1837136 ) ) ( not ( = ?auto_1837132 ?auto_1837137 ) ) ( not ( = ?auto_1837132 ?auto_1837138 ) ) ( not ( = ?auto_1837132 ?auto_1837139 ) ) ( not ( = ?auto_1837132 ?auto_1837140 ) ) ( not ( = ?auto_1837133 ?auto_1837134 ) ) ( not ( = ?auto_1837133 ?auto_1837135 ) ) ( not ( = ?auto_1837133 ?auto_1837136 ) ) ( not ( = ?auto_1837133 ?auto_1837137 ) ) ( not ( = ?auto_1837133 ?auto_1837138 ) ) ( not ( = ?auto_1837133 ?auto_1837139 ) ) ( not ( = ?auto_1837133 ?auto_1837140 ) ) ( not ( = ?auto_1837134 ?auto_1837135 ) ) ( not ( = ?auto_1837134 ?auto_1837136 ) ) ( not ( = ?auto_1837134 ?auto_1837137 ) ) ( not ( = ?auto_1837134 ?auto_1837138 ) ) ( not ( = ?auto_1837134 ?auto_1837139 ) ) ( not ( = ?auto_1837134 ?auto_1837140 ) ) ( not ( = ?auto_1837135 ?auto_1837136 ) ) ( not ( = ?auto_1837135 ?auto_1837137 ) ) ( not ( = ?auto_1837135 ?auto_1837138 ) ) ( not ( = ?auto_1837135 ?auto_1837139 ) ) ( not ( = ?auto_1837135 ?auto_1837140 ) ) ( not ( = ?auto_1837136 ?auto_1837137 ) ) ( not ( = ?auto_1837136 ?auto_1837138 ) ) ( not ( = ?auto_1837136 ?auto_1837139 ) ) ( not ( = ?auto_1837136 ?auto_1837140 ) ) ( not ( = ?auto_1837137 ?auto_1837138 ) ) ( not ( = ?auto_1837137 ?auto_1837139 ) ) ( not ( = ?auto_1837137 ?auto_1837140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837138 ?auto_1837139 ?auto_1837140 )
      ( MAKE-11CRATE-VERIFY ?auto_1837129 ?auto_1837130 ?auto_1837131 ?auto_1837132 ?auto_1837133 ?auto_1837134 ?auto_1837135 ?auto_1837136 ?auto_1837137 ?auto_1837138 ?auto_1837139 ?auto_1837140 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837261 - SURFACE
      ?auto_1837262 - SURFACE
      ?auto_1837263 - SURFACE
      ?auto_1837264 - SURFACE
      ?auto_1837265 - SURFACE
      ?auto_1837266 - SURFACE
      ?auto_1837267 - SURFACE
      ?auto_1837268 - SURFACE
      ?auto_1837269 - SURFACE
      ?auto_1837270 - SURFACE
      ?auto_1837271 - SURFACE
      ?auto_1837272 - SURFACE
    )
    :vars
    (
      ?auto_1837275 - HOIST
      ?auto_1837277 - PLACE
      ?auto_1837273 - TRUCK
      ?auto_1837274 - PLACE
      ?auto_1837276 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837275 ?auto_1837277 ) ( SURFACE-AT ?auto_1837271 ?auto_1837277 ) ( CLEAR ?auto_1837271 ) ( IS-CRATE ?auto_1837272 ) ( not ( = ?auto_1837271 ?auto_1837272 ) ) ( AVAILABLE ?auto_1837275 ) ( ON ?auto_1837271 ?auto_1837270 ) ( not ( = ?auto_1837270 ?auto_1837271 ) ) ( not ( = ?auto_1837270 ?auto_1837272 ) ) ( TRUCK-AT ?auto_1837273 ?auto_1837274 ) ( not ( = ?auto_1837274 ?auto_1837277 ) ) ( HOIST-AT ?auto_1837276 ?auto_1837274 ) ( LIFTING ?auto_1837276 ?auto_1837272 ) ( not ( = ?auto_1837275 ?auto_1837276 ) ) ( ON ?auto_1837262 ?auto_1837261 ) ( ON ?auto_1837263 ?auto_1837262 ) ( ON ?auto_1837264 ?auto_1837263 ) ( ON ?auto_1837265 ?auto_1837264 ) ( ON ?auto_1837266 ?auto_1837265 ) ( ON ?auto_1837267 ?auto_1837266 ) ( ON ?auto_1837268 ?auto_1837267 ) ( ON ?auto_1837269 ?auto_1837268 ) ( ON ?auto_1837270 ?auto_1837269 ) ( not ( = ?auto_1837261 ?auto_1837262 ) ) ( not ( = ?auto_1837261 ?auto_1837263 ) ) ( not ( = ?auto_1837261 ?auto_1837264 ) ) ( not ( = ?auto_1837261 ?auto_1837265 ) ) ( not ( = ?auto_1837261 ?auto_1837266 ) ) ( not ( = ?auto_1837261 ?auto_1837267 ) ) ( not ( = ?auto_1837261 ?auto_1837268 ) ) ( not ( = ?auto_1837261 ?auto_1837269 ) ) ( not ( = ?auto_1837261 ?auto_1837270 ) ) ( not ( = ?auto_1837261 ?auto_1837271 ) ) ( not ( = ?auto_1837261 ?auto_1837272 ) ) ( not ( = ?auto_1837262 ?auto_1837263 ) ) ( not ( = ?auto_1837262 ?auto_1837264 ) ) ( not ( = ?auto_1837262 ?auto_1837265 ) ) ( not ( = ?auto_1837262 ?auto_1837266 ) ) ( not ( = ?auto_1837262 ?auto_1837267 ) ) ( not ( = ?auto_1837262 ?auto_1837268 ) ) ( not ( = ?auto_1837262 ?auto_1837269 ) ) ( not ( = ?auto_1837262 ?auto_1837270 ) ) ( not ( = ?auto_1837262 ?auto_1837271 ) ) ( not ( = ?auto_1837262 ?auto_1837272 ) ) ( not ( = ?auto_1837263 ?auto_1837264 ) ) ( not ( = ?auto_1837263 ?auto_1837265 ) ) ( not ( = ?auto_1837263 ?auto_1837266 ) ) ( not ( = ?auto_1837263 ?auto_1837267 ) ) ( not ( = ?auto_1837263 ?auto_1837268 ) ) ( not ( = ?auto_1837263 ?auto_1837269 ) ) ( not ( = ?auto_1837263 ?auto_1837270 ) ) ( not ( = ?auto_1837263 ?auto_1837271 ) ) ( not ( = ?auto_1837263 ?auto_1837272 ) ) ( not ( = ?auto_1837264 ?auto_1837265 ) ) ( not ( = ?auto_1837264 ?auto_1837266 ) ) ( not ( = ?auto_1837264 ?auto_1837267 ) ) ( not ( = ?auto_1837264 ?auto_1837268 ) ) ( not ( = ?auto_1837264 ?auto_1837269 ) ) ( not ( = ?auto_1837264 ?auto_1837270 ) ) ( not ( = ?auto_1837264 ?auto_1837271 ) ) ( not ( = ?auto_1837264 ?auto_1837272 ) ) ( not ( = ?auto_1837265 ?auto_1837266 ) ) ( not ( = ?auto_1837265 ?auto_1837267 ) ) ( not ( = ?auto_1837265 ?auto_1837268 ) ) ( not ( = ?auto_1837265 ?auto_1837269 ) ) ( not ( = ?auto_1837265 ?auto_1837270 ) ) ( not ( = ?auto_1837265 ?auto_1837271 ) ) ( not ( = ?auto_1837265 ?auto_1837272 ) ) ( not ( = ?auto_1837266 ?auto_1837267 ) ) ( not ( = ?auto_1837266 ?auto_1837268 ) ) ( not ( = ?auto_1837266 ?auto_1837269 ) ) ( not ( = ?auto_1837266 ?auto_1837270 ) ) ( not ( = ?auto_1837266 ?auto_1837271 ) ) ( not ( = ?auto_1837266 ?auto_1837272 ) ) ( not ( = ?auto_1837267 ?auto_1837268 ) ) ( not ( = ?auto_1837267 ?auto_1837269 ) ) ( not ( = ?auto_1837267 ?auto_1837270 ) ) ( not ( = ?auto_1837267 ?auto_1837271 ) ) ( not ( = ?auto_1837267 ?auto_1837272 ) ) ( not ( = ?auto_1837268 ?auto_1837269 ) ) ( not ( = ?auto_1837268 ?auto_1837270 ) ) ( not ( = ?auto_1837268 ?auto_1837271 ) ) ( not ( = ?auto_1837268 ?auto_1837272 ) ) ( not ( = ?auto_1837269 ?auto_1837270 ) ) ( not ( = ?auto_1837269 ?auto_1837271 ) ) ( not ( = ?auto_1837269 ?auto_1837272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837270 ?auto_1837271 ?auto_1837272 )
      ( MAKE-11CRATE-VERIFY ?auto_1837261 ?auto_1837262 ?auto_1837263 ?auto_1837264 ?auto_1837265 ?auto_1837266 ?auto_1837267 ?auto_1837268 ?auto_1837269 ?auto_1837270 ?auto_1837271 ?auto_1837272 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837404 - SURFACE
      ?auto_1837405 - SURFACE
      ?auto_1837406 - SURFACE
      ?auto_1837407 - SURFACE
      ?auto_1837408 - SURFACE
      ?auto_1837409 - SURFACE
      ?auto_1837410 - SURFACE
      ?auto_1837411 - SURFACE
      ?auto_1837412 - SURFACE
      ?auto_1837413 - SURFACE
      ?auto_1837414 - SURFACE
      ?auto_1837415 - SURFACE
    )
    :vars
    (
      ?auto_1837418 - HOIST
      ?auto_1837416 - PLACE
      ?auto_1837420 - TRUCK
      ?auto_1837421 - PLACE
      ?auto_1837417 - HOIST
      ?auto_1837419 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837418 ?auto_1837416 ) ( SURFACE-AT ?auto_1837414 ?auto_1837416 ) ( CLEAR ?auto_1837414 ) ( IS-CRATE ?auto_1837415 ) ( not ( = ?auto_1837414 ?auto_1837415 ) ) ( AVAILABLE ?auto_1837418 ) ( ON ?auto_1837414 ?auto_1837413 ) ( not ( = ?auto_1837413 ?auto_1837414 ) ) ( not ( = ?auto_1837413 ?auto_1837415 ) ) ( TRUCK-AT ?auto_1837420 ?auto_1837421 ) ( not ( = ?auto_1837421 ?auto_1837416 ) ) ( HOIST-AT ?auto_1837417 ?auto_1837421 ) ( not ( = ?auto_1837418 ?auto_1837417 ) ) ( AVAILABLE ?auto_1837417 ) ( SURFACE-AT ?auto_1837415 ?auto_1837421 ) ( ON ?auto_1837415 ?auto_1837419 ) ( CLEAR ?auto_1837415 ) ( not ( = ?auto_1837414 ?auto_1837419 ) ) ( not ( = ?auto_1837415 ?auto_1837419 ) ) ( not ( = ?auto_1837413 ?auto_1837419 ) ) ( ON ?auto_1837405 ?auto_1837404 ) ( ON ?auto_1837406 ?auto_1837405 ) ( ON ?auto_1837407 ?auto_1837406 ) ( ON ?auto_1837408 ?auto_1837407 ) ( ON ?auto_1837409 ?auto_1837408 ) ( ON ?auto_1837410 ?auto_1837409 ) ( ON ?auto_1837411 ?auto_1837410 ) ( ON ?auto_1837412 ?auto_1837411 ) ( ON ?auto_1837413 ?auto_1837412 ) ( not ( = ?auto_1837404 ?auto_1837405 ) ) ( not ( = ?auto_1837404 ?auto_1837406 ) ) ( not ( = ?auto_1837404 ?auto_1837407 ) ) ( not ( = ?auto_1837404 ?auto_1837408 ) ) ( not ( = ?auto_1837404 ?auto_1837409 ) ) ( not ( = ?auto_1837404 ?auto_1837410 ) ) ( not ( = ?auto_1837404 ?auto_1837411 ) ) ( not ( = ?auto_1837404 ?auto_1837412 ) ) ( not ( = ?auto_1837404 ?auto_1837413 ) ) ( not ( = ?auto_1837404 ?auto_1837414 ) ) ( not ( = ?auto_1837404 ?auto_1837415 ) ) ( not ( = ?auto_1837404 ?auto_1837419 ) ) ( not ( = ?auto_1837405 ?auto_1837406 ) ) ( not ( = ?auto_1837405 ?auto_1837407 ) ) ( not ( = ?auto_1837405 ?auto_1837408 ) ) ( not ( = ?auto_1837405 ?auto_1837409 ) ) ( not ( = ?auto_1837405 ?auto_1837410 ) ) ( not ( = ?auto_1837405 ?auto_1837411 ) ) ( not ( = ?auto_1837405 ?auto_1837412 ) ) ( not ( = ?auto_1837405 ?auto_1837413 ) ) ( not ( = ?auto_1837405 ?auto_1837414 ) ) ( not ( = ?auto_1837405 ?auto_1837415 ) ) ( not ( = ?auto_1837405 ?auto_1837419 ) ) ( not ( = ?auto_1837406 ?auto_1837407 ) ) ( not ( = ?auto_1837406 ?auto_1837408 ) ) ( not ( = ?auto_1837406 ?auto_1837409 ) ) ( not ( = ?auto_1837406 ?auto_1837410 ) ) ( not ( = ?auto_1837406 ?auto_1837411 ) ) ( not ( = ?auto_1837406 ?auto_1837412 ) ) ( not ( = ?auto_1837406 ?auto_1837413 ) ) ( not ( = ?auto_1837406 ?auto_1837414 ) ) ( not ( = ?auto_1837406 ?auto_1837415 ) ) ( not ( = ?auto_1837406 ?auto_1837419 ) ) ( not ( = ?auto_1837407 ?auto_1837408 ) ) ( not ( = ?auto_1837407 ?auto_1837409 ) ) ( not ( = ?auto_1837407 ?auto_1837410 ) ) ( not ( = ?auto_1837407 ?auto_1837411 ) ) ( not ( = ?auto_1837407 ?auto_1837412 ) ) ( not ( = ?auto_1837407 ?auto_1837413 ) ) ( not ( = ?auto_1837407 ?auto_1837414 ) ) ( not ( = ?auto_1837407 ?auto_1837415 ) ) ( not ( = ?auto_1837407 ?auto_1837419 ) ) ( not ( = ?auto_1837408 ?auto_1837409 ) ) ( not ( = ?auto_1837408 ?auto_1837410 ) ) ( not ( = ?auto_1837408 ?auto_1837411 ) ) ( not ( = ?auto_1837408 ?auto_1837412 ) ) ( not ( = ?auto_1837408 ?auto_1837413 ) ) ( not ( = ?auto_1837408 ?auto_1837414 ) ) ( not ( = ?auto_1837408 ?auto_1837415 ) ) ( not ( = ?auto_1837408 ?auto_1837419 ) ) ( not ( = ?auto_1837409 ?auto_1837410 ) ) ( not ( = ?auto_1837409 ?auto_1837411 ) ) ( not ( = ?auto_1837409 ?auto_1837412 ) ) ( not ( = ?auto_1837409 ?auto_1837413 ) ) ( not ( = ?auto_1837409 ?auto_1837414 ) ) ( not ( = ?auto_1837409 ?auto_1837415 ) ) ( not ( = ?auto_1837409 ?auto_1837419 ) ) ( not ( = ?auto_1837410 ?auto_1837411 ) ) ( not ( = ?auto_1837410 ?auto_1837412 ) ) ( not ( = ?auto_1837410 ?auto_1837413 ) ) ( not ( = ?auto_1837410 ?auto_1837414 ) ) ( not ( = ?auto_1837410 ?auto_1837415 ) ) ( not ( = ?auto_1837410 ?auto_1837419 ) ) ( not ( = ?auto_1837411 ?auto_1837412 ) ) ( not ( = ?auto_1837411 ?auto_1837413 ) ) ( not ( = ?auto_1837411 ?auto_1837414 ) ) ( not ( = ?auto_1837411 ?auto_1837415 ) ) ( not ( = ?auto_1837411 ?auto_1837419 ) ) ( not ( = ?auto_1837412 ?auto_1837413 ) ) ( not ( = ?auto_1837412 ?auto_1837414 ) ) ( not ( = ?auto_1837412 ?auto_1837415 ) ) ( not ( = ?auto_1837412 ?auto_1837419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837413 ?auto_1837414 ?auto_1837415 )
      ( MAKE-11CRATE-VERIFY ?auto_1837404 ?auto_1837405 ?auto_1837406 ?auto_1837407 ?auto_1837408 ?auto_1837409 ?auto_1837410 ?auto_1837411 ?auto_1837412 ?auto_1837413 ?auto_1837414 ?auto_1837415 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837548 - SURFACE
      ?auto_1837549 - SURFACE
      ?auto_1837550 - SURFACE
      ?auto_1837551 - SURFACE
      ?auto_1837552 - SURFACE
      ?auto_1837553 - SURFACE
      ?auto_1837554 - SURFACE
      ?auto_1837555 - SURFACE
      ?auto_1837556 - SURFACE
      ?auto_1837557 - SURFACE
      ?auto_1837558 - SURFACE
      ?auto_1837559 - SURFACE
    )
    :vars
    (
      ?auto_1837560 - HOIST
      ?auto_1837563 - PLACE
      ?auto_1837561 - PLACE
      ?auto_1837564 - HOIST
      ?auto_1837565 - SURFACE
      ?auto_1837562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837560 ?auto_1837563 ) ( SURFACE-AT ?auto_1837558 ?auto_1837563 ) ( CLEAR ?auto_1837558 ) ( IS-CRATE ?auto_1837559 ) ( not ( = ?auto_1837558 ?auto_1837559 ) ) ( AVAILABLE ?auto_1837560 ) ( ON ?auto_1837558 ?auto_1837557 ) ( not ( = ?auto_1837557 ?auto_1837558 ) ) ( not ( = ?auto_1837557 ?auto_1837559 ) ) ( not ( = ?auto_1837561 ?auto_1837563 ) ) ( HOIST-AT ?auto_1837564 ?auto_1837561 ) ( not ( = ?auto_1837560 ?auto_1837564 ) ) ( AVAILABLE ?auto_1837564 ) ( SURFACE-AT ?auto_1837559 ?auto_1837561 ) ( ON ?auto_1837559 ?auto_1837565 ) ( CLEAR ?auto_1837559 ) ( not ( = ?auto_1837558 ?auto_1837565 ) ) ( not ( = ?auto_1837559 ?auto_1837565 ) ) ( not ( = ?auto_1837557 ?auto_1837565 ) ) ( TRUCK-AT ?auto_1837562 ?auto_1837563 ) ( ON ?auto_1837549 ?auto_1837548 ) ( ON ?auto_1837550 ?auto_1837549 ) ( ON ?auto_1837551 ?auto_1837550 ) ( ON ?auto_1837552 ?auto_1837551 ) ( ON ?auto_1837553 ?auto_1837552 ) ( ON ?auto_1837554 ?auto_1837553 ) ( ON ?auto_1837555 ?auto_1837554 ) ( ON ?auto_1837556 ?auto_1837555 ) ( ON ?auto_1837557 ?auto_1837556 ) ( not ( = ?auto_1837548 ?auto_1837549 ) ) ( not ( = ?auto_1837548 ?auto_1837550 ) ) ( not ( = ?auto_1837548 ?auto_1837551 ) ) ( not ( = ?auto_1837548 ?auto_1837552 ) ) ( not ( = ?auto_1837548 ?auto_1837553 ) ) ( not ( = ?auto_1837548 ?auto_1837554 ) ) ( not ( = ?auto_1837548 ?auto_1837555 ) ) ( not ( = ?auto_1837548 ?auto_1837556 ) ) ( not ( = ?auto_1837548 ?auto_1837557 ) ) ( not ( = ?auto_1837548 ?auto_1837558 ) ) ( not ( = ?auto_1837548 ?auto_1837559 ) ) ( not ( = ?auto_1837548 ?auto_1837565 ) ) ( not ( = ?auto_1837549 ?auto_1837550 ) ) ( not ( = ?auto_1837549 ?auto_1837551 ) ) ( not ( = ?auto_1837549 ?auto_1837552 ) ) ( not ( = ?auto_1837549 ?auto_1837553 ) ) ( not ( = ?auto_1837549 ?auto_1837554 ) ) ( not ( = ?auto_1837549 ?auto_1837555 ) ) ( not ( = ?auto_1837549 ?auto_1837556 ) ) ( not ( = ?auto_1837549 ?auto_1837557 ) ) ( not ( = ?auto_1837549 ?auto_1837558 ) ) ( not ( = ?auto_1837549 ?auto_1837559 ) ) ( not ( = ?auto_1837549 ?auto_1837565 ) ) ( not ( = ?auto_1837550 ?auto_1837551 ) ) ( not ( = ?auto_1837550 ?auto_1837552 ) ) ( not ( = ?auto_1837550 ?auto_1837553 ) ) ( not ( = ?auto_1837550 ?auto_1837554 ) ) ( not ( = ?auto_1837550 ?auto_1837555 ) ) ( not ( = ?auto_1837550 ?auto_1837556 ) ) ( not ( = ?auto_1837550 ?auto_1837557 ) ) ( not ( = ?auto_1837550 ?auto_1837558 ) ) ( not ( = ?auto_1837550 ?auto_1837559 ) ) ( not ( = ?auto_1837550 ?auto_1837565 ) ) ( not ( = ?auto_1837551 ?auto_1837552 ) ) ( not ( = ?auto_1837551 ?auto_1837553 ) ) ( not ( = ?auto_1837551 ?auto_1837554 ) ) ( not ( = ?auto_1837551 ?auto_1837555 ) ) ( not ( = ?auto_1837551 ?auto_1837556 ) ) ( not ( = ?auto_1837551 ?auto_1837557 ) ) ( not ( = ?auto_1837551 ?auto_1837558 ) ) ( not ( = ?auto_1837551 ?auto_1837559 ) ) ( not ( = ?auto_1837551 ?auto_1837565 ) ) ( not ( = ?auto_1837552 ?auto_1837553 ) ) ( not ( = ?auto_1837552 ?auto_1837554 ) ) ( not ( = ?auto_1837552 ?auto_1837555 ) ) ( not ( = ?auto_1837552 ?auto_1837556 ) ) ( not ( = ?auto_1837552 ?auto_1837557 ) ) ( not ( = ?auto_1837552 ?auto_1837558 ) ) ( not ( = ?auto_1837552 ?auto_1837559 ) ) ( not ( = ?auto_1837552 ?auto_1837565 ) ) ( not ( = ?auto_1837553 ?auto_1837554 ) ) ( not ( = ?auto_1837553 ?auto_1837555 ) ) ( not ( = ?auto_1837553 ?auto_1837556 ) ) ( not ( = ?auto_1837553 ?auto_1837557 ) ) ( not ( = ?auto_1837553 ?auto_1837558 ) ) ( not ( = ?auto_1837553 ?auto_1837559 ) ) ( not ( = ?auto_1837553 ?auto_1837565 ) ) ( not ( = ?auto_1837554 ?auto_1837555 ) ) ( not ( = ?auto_1837554 ?auto_1837556 ) ) ( not ( = ?auto_1837554 ?auto_1837557 ) ) ( not ( = ?auto_1837554 ?auto_1837558 ) ) ( not ( = ?auto_1837554 ?auto_1837559 ) ) ( not ( = ?auto_1837554 ?auto_1837565 ) ) ( not ( = ?auto_1837555 ?auto_1837556 ) ) ( not ( = ?auto_1837555 ?auto_1837557 ) ) ( not ( = ?auto_1837555 ?auto_1837558 ) ) ( not ( = ?auto_1837555 ?auto_1837559 ) ) ( not ( = ?auto_1837555 ?auto_1837565 ) ) ( not ( = ?auto_1837556 ?auto_1837557 ) ) ( not ( = ?auto_1837556 ?auto_1837558 ) ) ( not ( = ?auto_1837556 ?auto_1837559 ) ) ( not ( = ?auto_1837556 ?auto_1837565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837557 ?auto_1837558 ?auto_1837559 )
      ( MAKE-11CRATE-VERIFY ?auto_1837548 ?auto_1837549 ?auto_1837550 ?auto_1837551 ?auto_1837552 ?auto_1837553 ?auto_1837554 ?auto_1837555 ?auto_1837556 ?auto_1837557 ?auto_1837558 ?auto_1837559 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837692 - SURFACE
      ?auto_1837693 - SURFACE
      ?auto_1837694 - SURFACE
      ?auto_1837695 - SURFACE
      ?auto_1837696 - SURFACE
      ?auto_1837697 - SURFACE
      ?auto_1837698 - SURFACE
      ?auto_1837699 - SURFACE
      ?auto_1837700 - SURFACE
      ?auto_1837701 - SURFACE
      ?auto_1837702 - SURFACE
      ?auto_1837703 - SURFACE
    )
    :vars
    (
      ?auto_1837706 - HOIST
      ?auto_1837704 - PLACE
      ?auto_1837709 - PLACE
      ?auto_1837705 - HOIST
      ?auto_1837708 - SURFACE
      ?auto_1837707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837706 ?auto_1837704 ) ( IS-CRATE ?auto_1837703 ) ( not ( = ?auto_1837702 ?auto_1837703 ) ) ( not ( = ?auto_1837701 ?auto_1837702 ) ) ( not ( = ?auto_1837701 ?auto_1837703 ) ) ( not ( = ?auto_1837709 ?auto_1837704 ) ) ( HOIST-AT ?auto_1837705 ?auto_1837709 ) ( not ( = ?auto_1837706 ?auto_1837705 ) ) ( AVAILABLE ?auto_1837705 ) ( SURFACE-AT ?auto_1837703 ?auto_1837709 ) ( ON ?auto_1837703 ?auto_1837708 ) ( CLEAR ?auto_1837703 ) ( not ( = ?auto_1837702 ?auto_1837708 ) ) ( not ( = ?auto_1837703 ?auto_1837708 ) ) ( not ( = ?auto_1837701 ?auto_1837708 ) ) ( TRUCK-AT ?auto_1837707 ?auto_1837704 ) ( SURFACE-AT ?auto_1837701 ?auto_1837704 ) ( CLEAR ?auto_1837701 ) ( LIFTING ?auto_1837706 ?auto_1837702 ) ( IS-CRATE ?auto_1837702 ) ( ON ?auto_1837693 ?auto_1837692 ) ( ON ?auto_1837694 ?auto_1837693 ) ( ON ?auto_1837695 ?auto_1837694 ) ( ON ?auto_1837696 ?auto_1837695 ) ( ON ?auto_1837697 ?auto_1837696 ) ( ON ?auto_1837698 ?auto_1837697 ) ( ON ?auto_1837699 ?auto_1837698 ) ( ON ?auto_1837700 ?auto_1837699 ) ( ON ?auto_1837701 ?auto_1837700 ) ( not ( = ?auto_1837692 ?auto_1837693 ) ) ( not ( = ?auto_1837692 ?auto_1837694 ) ) ( not ( = ?auto_1837692 ?auto_1837695 ) ) ( not ( = ?auto_1837692 ?auto_1837696 ) ) ( not ( = ?auto_1837692 ?auto_1837697 ) ) ( not ( = ?auto_1837692 ?auto_1837698 ) ) ( not ( = ?auto_1837692 ?auto_1837699 ) ) ( not ( = ?auto_1837692 ?auto_1837700 ) ) ( not ( = ?auto_1837692 ?auto_1837701 ) ) ( not ( = ?auto_1837692 ?auto_1837702 ) ) ( not ( = ?auto_1837692 ?auto_1837703 ) ) ( not ( = ?auto_1837692 ?auto_1837708 ) ) ( not ( = ?auto_1837693 ?auto_1837694 ) ) ( not ( = ?auto_1837693 ?auto_1837695 ) ) ( not ( = ?auto_1837693 ?auto_1837696 ) ) ( not ( = ?auto_1837693 ?auto_1837697 ) ) ( not ( = ?auto_1837693 ?auto_1837698 ) ) ( not ( = ?auto_1837693 ?auto_1837699 ) ) ( not ( = ?auto_1837693 ?auto_1837700 ) ) ( not ( = ?auto_1837693 ?auto_1837701 ) ) ( not ( = ?auto_1837693 ?auto_1837702 ) ) ( not ( = ?auto_1837693 ?auto_1837703 ) ) ( not ( = ?auto_1837693 ?auto_1837708 ) ) ( not ( = ?auto_1837694 ?auto_1837695 ) ) ( not ( = ?auto_1837694 ?auto_1837696 ) ) ( not ( = ?auto_1837694 ?auto_1837697 ) ) ( not ( = ?auto_1837694 ?auto_1837698 ) ) ( not ( = ?auto_1837694 ?auto_1837699 ) ) ( not ( = ?auto_1837694 ?auto_1837700 ) ) ( not ( = ?auto_1837694 ?auto_1837701 ) ) ( not ( = ?auto_1837694 ?auto_1837702 ) ) ( not ( = ?auto_1837694 ?auto_1837703 ) ) ( not ( = ?auto_1837694 ?auto_1837708 ) ) ( not ( = ?auto_1837695 ?auto_1837696 ) ) ( not ( = ?auto_1837695 ?auto_1837697 ) ) ( not ( = ?auto_1837695 ?auto_1837698 ) ) ( not ( = ?auto_1837695 ?auto_1837699 ) ) ( not ( = ?auto_1837695 ?auto_1837700 ) ) ( not ( = ?auto_1837695 ?auto_1837701 ) ) ( not ( = ?auto_1837695 ?auto_1837702 ) ) ( not ( = ?auto_1837695 ?auto_1837703 ) ) ( not ( = ?auto_1837695 ?auto_1837708 ) ) ( not ( = ?auto_1837696 ?auto_1837697 ) ) ( not ( = ?auto_1837696 ?auto_1837698 ) ) ( not ( = ?auto_1837696 ?auto_1837699 ) ) ( not ( = ?auto_1837696 ?auto_1837700 ) ) ( not ( = ?auto_1837696 ?auto_1837701 ) ) ( not ( = ?auto_1837696 ?auto_1837702 ) ) ( not ( = ?auto_1837696 ?auto_1837703 ) ) ( not ( = ?auto_1837696 ?auto_1837708 ) ) ( not ( = ?auto_1837697 ?auto_1837698 ) ) ( not ( = ?auto_1837697 ?auto_1837699 ) ) ( not ( = ?auto_1837697 ?auto_1837700 ) ) ( not ( = ?auto_1837697 ?auto_1837701 ) ) ( not ( = ?auto_1837697 ?auto_1837702 ) ) ( not ( = ?auto_1837697 ?auto_1837703 ) ) ( not ( = ?auto_1837697 ?auto_1837708 ) ) ( not ( = ?auto_1837698 ?auto_1837699 ) ) ( not ( = ?auto_1837698 ?auto_1837700 ) ) ( not ( = ?auto_1837698 ?auto_1837701 ) ) ( not ( = ?auto_1837698 ?auto_1837702 ) ) ( not ( = ?auto_1837698 ?auto_1837703 ) ) ( not ( = ?auto_1837698 ?auto_1837708 ) ) ( not ( = ?auto_1837699 ?auto_1837700 ) ) ( not ( = ?auto_1837699 ?auto_1837701 ) ) ( not ( = ?auto_1837699 ?auto_1837702 ) ) ( not ( = ?auto_1837699 ?auto_1837703 ) ) ( not ( = ?auto_1837699 ?auto_1837708 ) ) ( not ( = ?auto_1837700 ?auto_1837701 ) ) ( not ( = ?auto_1837700 ?auto_1837702 ) ) ( not ( = ?auto_1837700 ?auto_1837703 ) ) ( not ( = ?auto_1837700 ?auto_1837708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837701 ?auto_1837702 ?auto_1837703 )
      ( MAKE-11CRATE-VERIFY ?auto_1837692 ?auto_1837693 ?auto_1837694 ?auto_1837695 ?auto_1837696 ?auto_1837697 ?auto_1837698 ?auto_1837699 ?auto_1837700 ?auto_1837701 ?auto_1837702 ?auto_1837703 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837836 - SURFACE
      ?auto_1837837 - SURFACE
      ?auto_1837838 - SURFACE
      ?auto_1837839 - SURFACE
      ?auto_1837840 - SURFACE
      ?auto_1837841 - SURFACE
      ?auto_1837842 - SURFACE
      ?auto_1837843 - SURFACE
      ?auto_1837844 - SURFACE
      ?auto_1837845 - SURFACE
      ?auto_1837846 - SURFACE
      ?auto_1837847 - SURFACE
    )
    :vars
    (
      ?auto_1837850 - HOIST
      ?auto_1837851 - PLACE
      ?auto_1837853 - PLACE
      ?auto_1837849 - HOIST
      ?auto_1837852 - SURFACE
      ?auto_1837848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837850 ?auto_1837851 ) ( IS-CRATE ?auto_1837847 ) ( not ( = ?auto_1837846 ?auto_1837847 ) ) ( not ( = ?auto_1837845 ?auto_1837846 ) ) ( not ( = ?auto_1837845 ?auto_1837847 ) ) ( not ( = ?auto_1837853 ?auto_1837851 ) ) ( HOIST-AT ?auto_1837849 ?auto_1837853 ) ( not ( = ?auto_1837850 ?auto_1837849 ) ) ( AVAILABLE ?auto_1837849 ) ( SURFACE-AT ?auto_1837847 ?auto_1837853 ) ( ON ?auto_1837847 ?auto_1837852 ) ( CLEAR ?auto_1837847 ) ( not ( = ?auto_1837846 ?auto_1837852 ) ) ( not ( = ?auto_1837847 ?auto_1837852 ) ) ( not ( = ?auto_1837845 ?auto_1837852 ) ) ( TRUCK-AT ?auto_1837848 ?auto_1837851 ) ( SURFACE-AT ?auto_1837845 ?auto_1837851 ) ( CLEAR ?auto_1837845 ) ( IS-CRATE ?auto_1837846 ) ( AVAILABLE ?auto_1837850 ) ( IN ?auto_1837846 ?auto_1837848 ) ( ON ?auto_1837837 ?auto_1837836 ) ( ON ?auto_1837838 ?auto_1837837 ) ( ON ?auto_1837839 ?auto_1837838 ) ( ON ?auto_1837840 ?auto_1837839 ) ( ON ?auto_1837841 ?auto_1837840 ) ( ON ?auto_1837842 ?auto_1837841 ) ( ON ?auto_1837843 ?auto_1837842 ) ( ON ?auto_1837844 ?auto_1837843 ) ( ON ?auto_1837845 ?auto_1837844 ) ( not ( = ?auto_1837836 ?auto_1837837 ) ) ( not ( = ?auto_1837836 ?auto_1837838 ) ) ( not ( = ?auto_1837836 ?auto_1837839 ) ) ( not ( = ?auto_1837836 ?auto_1837840 ) ) ( not ( = ?auto_1837836 ?auto_1837841 ) ) ( not ( = ?auto_1837836 ?auto_1837842 ) ) ( not ( = ?auto_1837836 ?auto_1837843 ) ) ( not ( = ?auto_1837836 ?auto_1837844 ) ) ( not ( = ?auto_1837836 ?auto_1837845 ) ) ( not ( = ?auto_1837836 ?auto_1837846 ) ) ( not ( = ?auto_1837836 ?auto_1837847 ) ) ( not ( = ?auto_1837836 ?auto_1837852 ) ) ( not ( = ?auto_1837837 ?auto_1837838 ) ) ( not ( = ?auto_1837837 ?auto_1837839 ) ) ( not ( = ?auto_1837837 ?auto_1837840 ) ) ( not ( = ?auto_1837837 ?auto_1837841 ) ) ( not ( = ?auto_1837837 ?auto_1837842 ) ) ( not ( = ?auto_1837837 ?auto_1837843 ) ) ( not ( = ?auto_1837837 ?auto_1837844 ) ) ( not ( = ?auto_1837837 ?auto_1837845 ) ) ( not ( = ?auto_1837837 ?auto_1837846 ) ) ( not ( = ?auto_1837837 ?auto_1837847 ) ) ( not ( = ?auto_1837837 ?auto_1837852 ) ) ( not ( = ?auto_1837838 ?auto_1837839 ) ) ( not ( = ?auto_1837838 ?auto_1837840 ) ) ( not ( = ?auto_1837838 ?auto_1837841 ) ) ( not ( = ?auto_1837838 ?auto_1837842 ) ) ( not ( = ?auto_1837838 ?auto_1837843 ) ) ( not ( = ?auto_1837838 ?auto_1837844 ) ) ( not ( = ?auto_1837838 ?auto_1837845 ) ) ( not ( = ?auto_1837838 ?auto_1837846 ) ) ( not ( = ?auto_1837838 ?auto_1837847 ) ) ( not ( = ?auto_1837838 ?auto_1837852 ) ) ( not ( = ?auto_1837839 ?auto_1837840 ) ) ( not ( = ?auto_1837839 ?auto_1837841 ) ) ( not ( = ?auto_1837839 ?auto_1837842 ) ) ( not ( = ?auto_1837839 ?auto_1837843 ) ) ( not ( = ?auto_1837839 ?auto_1837844 ) ) ( not ( = ?auto_1837839 ?auto_1837845 ) ) ( not ( = ?auto_1837839 ?auto_1837846 ) ) ( not ( = ?auto_1837839 ?auto_1837847 ) ) ( not ( = ?auto_1837839 ?auto_1837852 ) ) ( not ( = ?auto_1837840 ?auto_1837841 ) ) ( not ( = ?auto_1837840 ?auto_1837842 ) ) ( not ( = ?auto_1837840 ?auto_1837843 ) ) ( not ( = ?auto_1837840 ?auto_1837844 ) ) ( not ( = ?auto_1837840 ?auto_1837845 ) ) ( not ( = ?auto_1837840 ?auto_1837846 ) ) ( not ( = ?auto_1837840 ?auto_1837847 ) ) ( not ( = ?auto_1837840 ?auto_1837852 ) ) ( not ( = ?auto_1837841 ?auto_1837842 ) ) ( not ( = ?auto_1837841 ?auto_1837843 ) ) ( not ( = ?auto_1837841 ?auto_1837844 ) ) ( not ( = ?auto_1837841 ?auto_1837845 ) ) ( not ( = ?auto_1837841 ?auto_1837846 ) ) ( not ( = ?auto_1837841 ?auto_1837847 ) ) ( not ( = ?auto_1837841 ?auto_1837852 ) ) ( not ( = ?auto_1837842 ?auto_1837843 ) ) ( not ( = ?auto_1837842 ?auto_1837844 ) ) ( not ( = ?auto_1837842 ?auto_1837845 ) ) ( not ( = ?auto_1837842 ?auto_1837846 ) ) ( not ( = ?auto_1837842 ?auto_1837847 ) ) ( not ( = ?auto_1837842 ?auto_1837852 ) ) ( not ( = ?auto_1837843 ?auto_1837844 ) ) ( not ( = ?auto_1837843 ?auto_1837845 ) ) ( not ( = ?auto_1837843 ?auto_1837846 ) ) ( not ( = ?auto_1837843 ?auto_1837847 ) ) ( not ( = ?auto_1837843 ?auto_1837852 ) ) ( not ( = ?auto_1837844 ?auto_1837845 ) ) ( not ( = ?auto_1837844 ?auto_1837846 ) ) ( not ( = ?auto_1837844 ?auto_1837847 ) ) ( not ( = ?auto_1837844 ?auto_1837852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837845 ?auto_1837846 ?auto_1837847 )
      ( MAKE-11CRATE-VERIFY ?auto_1837836 ?auto_1837837 ?auto_1837838 ?auto_1837839 ?auto_1837840 ?auto_1837841 ?auto_1837842 ?auto_1837843 ?auto_1837844 ?auto_1837845 ?auto_1837846 ?auto_1837847 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847081 - SURFACE
      ?auto_1847082 - SURFACE
      ?auto_1847083 - SURFACE
      ?auto_1847084 - SURFACE
      ?auto_1847085 - SURFACE
      ?auto_1847086 - SURFACE
      ?auto_1847087 - SURFACE
      ?auto_1847088 - SURFACE
      ?auto_1847089 - SURFACE
      ?auto_1847090 - SURFACE
      ?auto_1847091 - SURFACE
      ?auto_1847092 - SURFACE
      ?auto_1847093 - SURFACE
    )
    :vars
    (
      ?auto_1847094 - HOIST
      ?auto_1847095 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847094 ?auto_1847095 ) ( SURFACE-AT ?auto_1847092 ?auto_1847095 ) ( CLEAR ?auto_1847092 ) ( LIFTING ?auto_1847094 ?auto_1847093 ) ( IS-CRATE ?auto_1847093 ) ( not ( = ?auto_1847092 ?auto_1847093 ) ) ( ON ?auto_1847082 ?auto_1847081 ) ( ON ?auto_1847083 ?auto_1847082 ) ( ON ?auto_1847084 ?auto_1847083 ) ( ON ?auto_1847085 ?auto_1847084 ) ( ON ?auto_1847086 ?auto_1847085 ) ( ON ?auto_1847087 ?auto_1847086 ) ( ON ?auto_1847088 ?auto_1847087 ) ( ON ?auto_1847089 ?auto_1847088 ) ( ON ?auto_1847090 ?auto_1847089 ) ( ON ?auto_1847091 ?auto_1847090 ) ( ON ?auto_1847092 ?auto_1847091 ) ( not ( = ?auto_1847081 ?auto_1847082 ) ) ( not ( = ?auto_1847081 ?auto_1847083 ) ) ( not ( = ?auto_1847081 ?auto_1847084 ) ) ( not ( = ?auto_1847081 ?auto_1847085 ) ) ( not ( = ?auto_1847081 ?auto_1847086 ) ) ( not ( = ?auto_1847081 ?auto_1847087 ) ) ( not ( = ?auto_1847081 ?auto_1847088 ) ) ( not ( = ?auto_1847081 ?auto_1847089 ) ) ( not ( = ?auto_1847081 ?auto_1847090 ) ) ( not ( = ?auto_1847081 ?auto_1847091 ) ) ( not ( = ?auto_1847081 ?auto_1847092 ) ) ( not ( = ?auto_1847081 ?auto_1847093 ) ) ( not ( = ?auto_1847082 ?auto_1847083 ) ) ( not ( = ?auto_1847082 ?auto_1847084 ) ) ( not ( = ?auto_1847082 ?auto_1847085 ) ) ( not ( = ?auto_1847082 ?auto_1847086 ) ) ( not ( = ?auto_1847082 ?auto_1847087 ) ) ( not ( = ?auto_1847082 ?auto_1847088 ) ) ( not ( = ?auto_1847082 ?auto_1847089 ) ) ( not ( = ?auto_1847082 ?auto_1847090 ) ) ( not ( = ?auto_1847082 ?auto_1847091 ) ) ( not ( = ?auto_1847082 ?auto_1847092 ) ) ( not ( = ?auto_1847082 ?auto_1847093 ) ) ( not ( = ?auto_1847083 ?auto_1847084 ) ) ( not ( = ?auto_1847083 ?auto_1847085 ) ) ( not ( = ?auto_1847083 ?auto_1847086 ) ) ( not ( = ?auto_1847083 ?auto_1847087 ) ) ( not ( = ?auto_1847083 ?auto_1847088 ) ) ( not ( = ?auto_1847083 ?auto_1847089 ) ) ( not ( = ?auto_1847083 ?auto_1847090 ) ) ( not ( = ?auto_1847083 ?auto_1847091 ) ) ( not ( = ?auto_1847083 ?auto_1847092 ) ) ( not ( = ?auto_1847083 ?auto_1847093 ) ) ( not ( = ?auto_1847084 ?auto_1847085 ) ) ( not ( = ?auto_1847084 ?auto_1847086 ) ) ( not ( = ?auto_1847084 ?auto_1847087 ) ) ( not ( = ?auto_1847084 ?auto_1847088 ) ) ( not ( = ?auto_1847084 ?auto_1847089 ) ) ( not ( = ?auto_1847084 ?auto_1847090 ) ) ( not ( = ?auto_1847084 ?auto_1847091 ) ) ( not ( = ?auto_1847084 ?auto_1847092 ) ) ( not ( = ?auto_1847084 ?auto_1847093 ) ) ( not ( = ?auto_1847085 ?auto_1847086 ) ) ( not ( = ?auto_1847085 ?auto_1847087 ) ) ( not ( = ?auto_1847085 ?auto_1847088 ) ) ( not ( = ?auto_1847085 ?auto_1847089 ) ) ( not ( = ?auto_1847085 ?auto_1847090 ) ) ( not ( = ?auto_1847085 ?auto_1847091 ) ) ( not ( = ?auto_1847085 ?auto_1847092 ) ) ( not ( = ?auto_1847085 ?auto_1847093 ) ) ( not ( = ?auto_1847086 ?auto_1847087 ) ) ( not ( = ?auto_1847086 ?auto_1847088 ) ) ( not ( = ?auto_1847086 ?auto_1847089 ) ) ( not ( = ?auto_1847086 ?auto_1847090 ) ) ( not ( = ?auto_1847086 ?auto_1847091 ) ) ( not ( = ?auto_1847086 ?auto_1847092 ) ) ( not ( = ?auto_1847086 ?auto_1847093 ) ) ( not ( = ?auto_1847087 ?auto_1847088 ) ) ( not ( = ?auto_1847087 ?auto_1847089 ) ) ( not ( = ?auto_1847087 ?auto_1847090 ) ) ( not ( = ?auto_1847087 ?auto_1847091 ) ) ( not ( = ?auto_1847087 ?auto_1847092 ) ) ( not ( = ?auto_1847087 ?auto_1847093 ) ) ( not ( = ?auto_1847088 ?auto_1847089 ) ) ( not ( = ?auto_1847088 ?auto_1847090 ) ) ( not ( = ?auto_1847088 ?auto_1847091 ) ) ( not ( = ?auto_1847088 ?auto_1847092 ) ) ( not ( = ?auto_1847088 ?auto_1847093 ) ) ( not ( = ?auto_1847089 ?auto_1847090 ) ) ( not ( = ?auto_1847089 ?auto_1847091 ) ) ( not ( = ?auto_1847089 ?auto_1847092 ) ) ( not ( = ?auto_1847089 ?auto_1847093 ) ) ( not ( = ?auto_1847090 ?auto_1847091 ) ) ( not ( = ?auto_1847090 ?auto_1847092 ) ) ( not ( = ?auto_1847090 ?auto_1847093 ) ) ( not ( = ?auto_1847091 ?auto_1847092 ) ) ( not ( = ?auto_1847091 ?auto_1847093 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1847092 ?auto_1847093 )
      ( MAKE-12CRATE-VERIFY ?auto_1847081 ?auto_1847082 ?auto_1847083 ?auto_1847084 ?auto_1847085 ?auto_1847086 ?auto_1847087 ?auto_1847088 ?auto_1847089 ?auto_1847090 ?auto_1847091 ?auto_1847092 ?auto_1847093 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847206 - SURFACE
      ?auto_1847207 - SURFACE
      ?auto_1847208 - SURFACE
      ?auto_1847209 - SURFACE
      ?auto_1847210 - SURFACE
      ?auto_1847211 - SURFACE
      ?auto_1847212 - SURFACE
      ?auto_1847213 - SURFACE
      ?auto_1847214 - SURFACE
      ?auto_1847215 - SURFACE
      ?auto_1847216 - SURFACE
      ?auto_1847217 - SURFACE
      ?auto_1847218 - SURFACE
    )
    :vars
    (
      ?auto_1847220 - HOIST
      ?auto_1847219 - PLACE
      ?auto_1847221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847220 ?auto_1847219 ) ( SURFACE-AT ?auto_1847217 ?auto_1847219 ) ( CLEAR ?auto_1847217 ) ( IS-CRATE ?auto_1847218 ) ( not ( = ?auto_1847217 ?auto_1847218 ) ) ( TRUCK-AT ?auto_1847221 ?auto_1847219 ) ( AVAILABLE ?auto_1847220 ) ( IN ?auto_1847218 ?auto_1847221 ) ( ON ?auto_1847217 ?auto_1847216 ) ( not ( = ?auto_1847216 ?auto_1847217 ) ) ( not ( = ?auto_1847216 ?auto_1847218 ) ) ( ON ?auto_1847207 ?auto_1847206 ) ( ON ?auto_1847208 ?auto_1847207 ) ( ON ?auto_1847209 ?auto_1847208 ) ( ON ?auto_1847210 ?auto_1847209 ) ( ON ?auto_1847211 ?auto_1847210 ) ( ON ?auto_1847212 ?auto_1847211 ) ( ON ?auto_1847213 ?auto_1847212 ) ( ON ?auto_1847214 ?auto_1847213 ) ( ON ?auto_1847215 ?auto_1847214 ) ( ON ?auto_1847216 ?auto_1847215 ) ( not ( = ?auto_1847206 ?auto_1847207 ) ) ( not ( = ?auto_1847206 ?auto_1847208 ) ) ( not ( = ?auto_1847206 ?auto_1847209 ) ) ( not ( = ?auto_1847206 ?auto_1847210 ) ) ( not ( = ?auto_1847206 ?auto_1847211 ) ) ( not ( = ?auto_1847206 ?auto_1847212 ) ) ( not ( = ?auto_1847206 ?auto_1847213 ) ) ( not ( = ?auto_1847206 ?auto_1847214 ) ) ( not ( = ?auto_1847206 ?auto_1847215 ) ) ( not ( = ?auto_1847206 ?auto_1847216 ) ) ( not ( = ?auto_1847206 ?auto_1847217 ) ) ( not ( = ?auto_1847206 ?auto_1847218 ) ) ( not ( = ?auto_1847207 ?auto_1847208 ) ) ( not ( = ?auto_1847207 ?auto_1847209 ) ) ( not ( = ?auto_1847207 ?auto_1847210 ) ) ( not ( = ?auto_1847207 ?auto_1847211 ) ) ( not ( = ?auto_1847207 ?auto_1847212 ) ) ( not ( = ?auto_1847207 ?auto_1847213 ) ) ( not ( = ?auto_1847207 ?auto_1847214 ) ) ( not ( = ?auto_1847207 ?auto_1847215 ) ) ( not ( = ?auto_1847207 ?auto_1847216 ) ) ( not ( = ?auto_1847207 ?auto_1847217 ) ) ( not ( = ?auto_1847207 ?auto_1847218 ) ) ( not ( = ?auto_1847208 ?auto_1847209 ) ) ( not ( = ?auto_1847208 ?auto_1847210 ) ) ( not ( = ?auto_1847208 ?auto_1847211 ) ) ( not ( = ?auto_1847208 ?auto_1847212 ) ) ( not ( = ?auto_1847208 ?auto_1847213 ) ) ( not ( = ?auto_1847208 ?auto_1847214 ) ) ( not ( = ?auto_1847208 ?auto_1847215 ) ) ( not ( = ?auto_1847208 ?auto_1847216 ) ) ( not ( = ?auto_1847208 ?auto_1847217 ) ) ( not ( = ?auto_1847208 ?auto_1847218 ) ) ( not ( = ?auto_1847209 ?auto_1847210 ) ) ( not ( = ?auto_1847209 ?auto_1847211 ) ) ( not ( = ?auto_1847209 ?auto_1847212 ) ) ( not ( = ?auto_1847209 ?auto_1847213 ) ) ( not ( = ?auto_1847209 ?auto_1847214 ) ) ( not ( = ?auto_1847209 ?auto_1847215 ) ) ( not ( = ?auto_1847209 ?auto_1847216 ) ) ( not ( = ?auto_1847209 ?auto_1847217 ) ) ( not ( = ?auto_1847209 ?auto_1847218 ) ) ( not ( = ?auto_1847210 ?auto_1847211 ) ) ( not ( = ?auto_1847210 ?auto_1847212 ) ) ( not ( = ?auto_1847210 ?auto_1847213 ) ) ( not ( = ?auto_1847210 ?auto_1847214 ) ) ( not ( = ?auto_1847210 ?auto_1847215 ) ) ( not ( = ?auto_1847210 ?auto_1847216 ) ) ( not ( = ?auto_1847210 ?auto_1847217 ) ) ( not ( = ?auto_1847210 ?auto_1847218 ) ) ( not ( = ?auto_1847211 ?auto_1847212 ) ) ( not ( = ?auto_1847211 ?auto_1847213 ) ) ( not ( = ?auto_1847211 ?auto_1847214 ) ) ( not ( = ?auto_1847211 ?auto_1847215 ) ) ( not ( = ?auto_1847211 ?auto_1847216 ) ) ( not ( = ?auto_1847211 ?auto_1847217 ) ) ( not ( = ?auto_1847211 ?auto_1847218 ) ) ( not ( = ?auto_1847212 ?auto_1847213 ) ) ( not ( = ?auto_1847212 ?auto_1847214 ) ) ( not ( = ?auto_1847212 ?auto_1847215 ) ) ( not ( = ?auto_1847212 ?auto_1847216 ) ) ( not ( = ?auto_1847212 ?auto_1847217 ) ) ( not ( = ?auto_1847212 ?auto_1847218 ) ) ( not ( = ?auto_1847213 ?auto_1847214 ) ) ( not ( = ?auto_1847213 ?auto_1847215 ) ) ( not ( = ?auto_1847213 ?auto_1847216 ) ) ( not ( = ?auto_1847213 ?auto_1847217 ) ) ( not ( = ?auto_1847213 ?auto_1847218 ) ) ( not ( = ?auto_1847214 ?auto_1847215 ) ) ( not ( = ?auto_1847214 ?auto_1847216 ) ) ( not ( = ?auto_1847214 ?auto_1847217 ) ) ( not ( = ?auto_1847214 ?auto_1847218 ) ) ( not ( = ?auto_1847215 ?auto_1847216 ) ) ( not ( = ?auto_1847215 ?auto_1847217 ) ) ( not ( = ?auto_1847215 ?auto_1847218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847216 ?auto_1847217 ?auto_1847218 )
      ( MAKE-12CRATE-VERIFY ?auto_1847206 ?auto_1847207 ?auto_1847208 ?auto_1847209 ?auto_1847210 ?auto_1847211 ?auto_1847212 ?auto_1847213 ?auto_1847214 ?auto_1847215 ?auto_1847216 ?auto_1847217 ?auto_1847218 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847344 - SURFACE
      ?auto_1847345 - SURFACE
      ?auto_1847346 - SURFACE
      ?auto_1847347 - SURFACE
      ?auto_1847348 - SURFACE
      ?auto_1847349 - SURFACE
      ?auto_1847350 - SURFACE
      ?auto_1847351 - SURFACE
      ?auto_1847352 - SURFACE
      ?auto_1847353 - SURFACE
      ?auto_1847354 - SURFACE
      ?auto_1847355 - SURFACE
      ?auto_1847356 - SURFACE
    )
    :vars
    (
      ?auto_1847357 - HOIST
      ?auto_1847358 - PLACE
      ?auto_1847359 - TRUCK
      ?auto_1847360 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847357 ?auto_1847358 ) ( SURFACE-AT ?auto_1847355 ?auto_1847358 ) ( CLEAR ?auto_1847355 ) ( IS-CRATE ?auto_1847356 ) ( not ( = ?auto_1847355 ?auto_1847356 ) ) ( AVAILABLE ?auto_1847357 ) ( IN ?auto_1847356 ?auto_1847359 ) ( ON ?auto_1847355 ?auto_1847354 ) ( not ( = ?auto_1847354 ?auto_1847355 ) ) ( not ( = ?auto_1847354 ?auto_1847356 ) ) ( TRUCK-AT ?auto_1847359 ?auto_1847360 ) ( not ( = ?auto_1847360 ?auto_1847358 ) ) ( ON ?auto_1847345 ?auto_1847344 ) ( ON ?auto_1847346 ?auto_1847345 ) ( ON ?auto_1847347 ?auto_1847346 ) ( ON ?auto_1847348 ?auto_1847347 ) ( ON ?auto_1847349 ?auto_1847348 ) ( ON ?auto_1847350 ?auto_1847349 ) ( ON ?auto_1847351 ?auto_1847350 ) ( ON ?auto_1847352 ?auto_1847351 ) ( ON ?auto_1847353 ?auto_1847352 ) ( ON ?auto_1847354 ?auto_1847353 ) ( not ( = ?auto_1847344 ?auto_1847345 ) ) ( not ( = ?auto_1847344 ?auto_1847346 ) ) ( not ( = ?auto_1847344 ?auto_1847347 ) ) ( not ( = ?auto_1847344 ?auto_1847348 ) ) ( not ( = ?auto_1847344 ?auto_1847349 ) ) ( not ( = ?auto_1847344 ?auto_1847350 ) ) ( not ( = ?auto_1847344 ?auto_1847351 ) ) ( not ( = ?auto_1847344 ?auto_1847352 ) ) ( not ( = ?auto_1847344 ?auto_1847353 ) ) ( not ( = ?auto_1847344 ?auto_1847354 ) ) ( not ( = ?auto_1847344 ?auto_1847355 ) ) ( not ( = ?auto_1847344 ?auto_1847356 ) ) ( not ( = ?auto_1847345 ?auto_1847346 ) ) ( not ( = ?auto_1847345 ?auto_1847347 ) ) ( not ( = ?auto_1847345 ?auto_1847348 ) ) ( not ( = ?auto_1847345 ?auto_1847349 ) ) ( not ( = ?auto_1847345 ?auto_1847350 ) ) ( not ( = ?auto_1847345 ?auto_1847351 ) ) ( not ( = ?auto_1847345 ?auto_1847352 ) ) ( not ( = ?auto_1847345 ?auto_1847353 ) ) ( not ( = ?auto_1847345 ?auto_1847354 ) ) ( not ( = ?auto_1847345 ?auto_1847355 ) ) ( not ( = ?auto_1847345 ?auto_1847356 ) ) ( not ( = ?auto_1847346 ?auto_1847347 ) ) ( not ( = ?auto_1847346 ?auto_1847348 ) ) ( not ( = ?auto_1847346 ?auto_1847349 ) ) ( not ( = ?auto_1847346 ?auto_1847350 ) ) ( not ( = ?auto_1847346 ?auto_1847351 ) ) ( not ( = ?auto_1847346 ?auto_1847352 ) ) ( not ( = ?auto_1847346 ?auto_1847353 ) ) ( not ( = ?auto_1847346 ?auto_1847354 ) ) ( not ( = ?auto_1847346 ?auto_1847355 ) ) ( not ( = ?auto_1847346 ?auto_1847356 ) ) ( not ( = ?auto_1847347 ?auto_1847348 ) ) ( not ( = ?auto_1847347 ?auto_1847349 ) ) ( not ( = ?auto_1847347 ?auto_1847350 ) ) ( not ( = ?auto_1847347 ?auto_1847351 ) ) ( not ( = ?auto_1847347 ?auto_1847352 ) ) ( not ( = ?auto_1847347 ?auto_1847353 ) ) ( not ( = ?auto_1847347 ?auto_1847354 ) ) ( not ( = ?auto_1847347 ?auto_1847355 ) ) ( not ( = ?auto_1847347 ?auto_1847356 ) ) ( not ( = ?auto_1847348 ?auto_1847349 ) ) ( not ( = ?auto_1847348 ?auto_1847350 ) ) ( not ( = ?auto_1847348 ?auto_1847351 ) ) ( not ( = ?auto_1847348 ?auto_1847352 ) ) ( not ( = ?auto_1847348 ?auto_1847353 ) ) ( not ( = ?auto_1847348 ?auto_1847354 ) ) ( not ( = ?auto_1847348 ?auto_1847355 ) ) ( not ( = ?auto_1847348 ?auto_1847356 ) ) ( not ( = ?auto_1847349 ?auto_1847350 ) ) ( not ( = ?auto_1847349 ?auto_1847351 ) ) ( not ( = ?auto_1847349 ?auto_1847352 ) ) ( not ( = ?auto_1847349 ?auto_1847353 ) ) ( not ( = ?auto_1847349 ?auto_1847354 ) ) ( not ( = ?auto_1847349 ?auto_1847355 ) ) ( not ( = ?auto_1847349 ?auto_1847356 ) ) ( not ( = ?auto_1847350 ?auto_1847351 ) ) ( not ( = ?auto_1847350 ?auto_1847352 ) ) ( not ( = ?auto_1847350 ?auto_1847353 ) ) ( not ( = ?auto_1847350 ?auto_1847354 ) ) ( not ( = ?auto_1847350 ?auto_1847355 ) ) ( not ( = ?auto_1847350 ?auto_1847356 ) ) ( not ( = ?auto_1847351 ?auto_1847352 ) ) ( not ( = ?auto_1847351 ?auto_1847353 ) ) ( not ( = ?auto_1847351 ?auto_1847354 ) ) ( not ( = ?auto_1847351 ?auto_1847355 ) ) ( not ( = ?auto_1847351 ?auto_1847356 ) ) ( not ( = ?auto_1847352 ?auto_1847353 ) ) ( not ( = ?auto_1847352 ?auto_1847354 ) ) ( not ( = ?auto_1847352 ?auto_1847355 ) ) ( not ( = ?auto_1847352 ?auto_1847356 ) ) ( not ( = ?auto_1847353 ?auto_1847354 ) ) ( not ( = ?auto_1847353 ?auto_1847355 ) ) ( not ( = ?auto_1847353 ?auto_1847356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847354 ?auto_1847355 ?auto_1847356 )
      ( MAKE-12CRATE-VERIFY ?auto_1847344 ?auto_1847345 ?auto_1847346 ?auto_1847347 ?auto_1847348 ?auto_1847349 ?auto_1847350 ?auto_1847351 ?auto_1847352 ?auto_1847353 ?auto_1847354 ?auto_1847355 ?auto_1847356 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847494 - SURFACE
      ?auto_1847495 - SURFACE
      ?auto_1847496 - SURFACE
      ?auto_1847497 - SURFACE
      ?auto_1847498 - SURFACE
      ?auto_1847499 - SURFACE
      ?auto_1847500 - SURFACE
      ?auto_1847501 - SURFACE
      ?auto_1847502 - SURFACE
      ?auto_1847503 - SURFACE
      ?auto_1847504 - SURFACE
      ?auto_1847505 - SURFACE
      ?auto_1847506 - SURFACE
    )
    :vars
    (
      ?auto_1847508 - HOIST
      ?auto_1847509 - PLACE
      ?auto_1847510 - TRUCK
      ?auto_1847507 - PLACE
      ?auto_1847511 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847508 ?auto_1847509 ) ( SURFACE-AT ?auto_1847505 ?auto_1847509 ) ( CLEAR ?auto_1847505 ) ( IS-CRATE ?auto_1847506 ) ( not ( = ?auto_1847505 ?auto_1847506 ) ) ( AVAILABLE ?auto_1847508 ) ( ON ?auto_1847505 ?auto_1847504 ) ( not ( = ?auto_1847504 ?auto_1847505 ) ) ( not ( = ?auto_1847504 ?auto_1847506 ) ) ( TRUCK-AT ?auto_1847510 ?auto_1847507 ) ( not ( = ?auto_1847507 ?auto_1847509 ) ) ( HOIST-AT ?auto_1847511 ?auto_1847507 ) ( LIFTING ?auto_1847511 ?auto_1847506 ) ( not ( = ?auto_1847508 ?auto_1847511 ) ) ( ON ?auto_1847495 ?auto_1847494 ) ( ON ?auto_1847496 ?auto_1847495 ) ( ON ?auto_1847497 ?auto_1847496 ) ( ON ?auto_1847498 ?auto_1847497 ) ( ON ?auto_1847499 ?auto_1847498 ) ( ON ?auto_1847500 ?auto_1847499 ) ( ON ?auto_1847501 ?auto_1847500 ) ( ON ?auto_1847502 ?auto_1847501 ) ( ON ?auto_1847503 ?auto_1847502 ) ( ON ?auto_1847504 ?auto_1847503 ) ( not ( = ?auto_1847494 ?auto_1847495 ) ) ( not ( = ?auto_1847494 ?auto_1847496 ) ) ( not ( = ?auto_1847494 ?auto_1847497 ) ) ( not ( = ?auto_1847494 ?auto_1847498 ) ) ( not ( = ?auto_1847494 ?auto_1847499 ) ) ( not ( = ?auto_1847494 ?auto_1847500 ) ) ( not ( = ?auto_1847494 ?auto_1847501 ) ) ( not ( = ?auto_1847494 ?auto_1847502 ) ) ( not ( = ?auto_1847494 ?auto_1847503 ) ) ( not ( = ?auto_1847494 ?auto_1847504 ) ) ( not ( = ?auto_1847494 ?auto_1847505 ) ) ( not ( = ?auto_1847494 ?auto_1847506 ) ) ( not ( = ?auto_1847495 ?auto_1847496 ) ) ( not ( = ?auto_1847495 ?auto_1847497 ) ) ( not ( = ?auto_1847495 ?auto_1847498 ) ) ( not ( = ?auto_1847495 ?auto_1847499 ) ) ( not ( = ?auto_1847495 ?auto_1847500 ) ) ( not ( = ?auto_1847495 ?auto_1847501 ) ) ( not ( = ?auto_1847495 ?auto_1847502 ) ) ( not ( = ?auto_1847495 ?auto_1847503 ) ) ( not ( = ?auto_1847495 ?auto_1847504 ) ) ( not ( = ?auto_1847495 ?auto_1847505 ) ) ( not ( = ?auto_1847495 ?auto_1847506 ) ) ( not ( = ?auto_1847496 ?auto_1847497 ) ) ( not ( = ?auto_1847496 ?auto_1847498 ) ) ( not ( = ?auto_1847496 ?auto_1847499 ) ) ( not ( = ?auto_1847496 ?auto_1847500 ) ) ( not ( = ?auto_1847496 ?auto_1847501 ) ) ( not ( = ?auto_1847496 ?auto_1847502 ) ) ( not ( = ?auto_1847496 ?auto_1847503 ) ) ( not ( = ?auto_1847496 ?auto_1847504 ) ) ( not ( = ?auto_1847496 ?auto_1847505 ) ) ( not ( = ?auto_1847496 ?auto_1847506 ) ) ( not ( = ?auto_1847497 ?auto_1847498 ) ) ( not ( = ?auto_1847497 ?auto_1847499 ) ) ( not ( = ?auto_1847497 ?auto_1847500 ) ) ( not ( = ?auto_1847497 ?auto_1847501 ) ) ( not ( = ?auto_1847497 ?auto_1847502 ) ) ( not ( = ?auto_1847497 ?auto_1847503 ) ) ( not ( = ?auto_1847497 ?auto_1847504 ) ) ( not ( = ?auto_1847497 ?auto_1847505 ) ) ( not ( = ?auto_1847497 ?auto_1847506 ) ) ( not ( = ?auto_1847498 ?auto_1847499 ) ) ( not ( = ?auto_1847498 ?auto_1847500 ) ) ( not ( = ?auto_1847498 ?auto_1847501 ) ) ( not ( = ?auto_1847498 ?auto_1847502 ) ) ( not ( = ?auto_1847498 ?auto_1847503 ) ) ( not ( = ?auto_1847498 ?auto_1847504 ) ) ( not ( = ?auto_1847498 ?auto_1847505 ) ) ( not ( = ?auto_1847498 ?auto_1847506 ) ) ( not ( = ?auto_1847499 ?auto_1847500 ) ) ( not ( = ?auto_1847499 ?auto_1847501 ) ) ( not ( = ?auto_1847499 ?auto_1847502 ) ) ( not ( = ?auto_1847499 ?auto_1847503 ) ) ( not ( = ?auto_1847499 ?auto_1847504 ) ) ( not ( = ?auto_1847499 ?auto_1847505 ) ) ( not ( = ?auto_1847499 ?auto_1847506 ) ) ( not ( = ?auto_1847500 ?auto_1847501 ) ) ( not ( = ?auto_1847500 ?auto_1847502 ) ) ( not ( = ?auto_1847500 ?auto_1847503 ) ) ( not ( = ?auto_1847500 ?auto_1847504 ) ) ( not ( = ?auto_1847500 ?auto_1847505 ) ) ( not ( = ?auto_1847500 ?auto_1847506 ) ) ( not ( = ?auto_1847501 ?auto_1847502 ) ) ( not ( = ?auto_1847501 ?auto_1847503 ) ) ( not ( = ?auto_1847501 ?auto_1847504 ) ) ( not ( = ?auto_1847501 ?auto_1847505 ) ) ( not ( = ?auto_1847501 ?auto_1847506 ) ) ( not ( = ?auto_1847502 ?auto_1847503 ) ) ( not ( = ?auto_1847502 ?auto_1847504 ) ) ( not ( = ?auto_1847502 ?auto_1847505 ) ) ( not ( = ?auto_1847502 ?auto_1847506 ) ) ( not ( = ?auto_1847503 ?auto_1847504 ) ) ( not ( = ?auto_1847503 ?auto_1847505 ) ) ( not ( = ?auto_1847503 ?auto_1847506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847504 ?auto_1847505 ?auto_1847506 )
      ( MAKE-12CRATE-VERIFY ?auto_1847494 ?auto_1847495 ?auto_1847496 ?auto_1847497 ?auto_1847498 ?auto_1847499 ?auto_1847500 ?auto_1847501 ?auto_1847502 ?auto_1847503 ?auto_1847504 ?auto_1847505 ?auto_1847506 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847656 - SURFACE
      ?auto_1847657 - SURFACE
      ?auto_1847658 - SURFACE
      ?auto_1847659 - SURFACE
      ?auto_1847660 - SURFACE
      ?auto_1847661 - SURFACE
      ?auto_1847662 - SURFACE
      ?auto_1847663 - SURFACE
      ?auto_1847664 - SURFACE
      ?auto_1847665 - SURFACE
      ?auto_1847666 - SURFACE
      ?auto_1847667 - SURFACE
      ?auto_1847668 - SURFACE
    )
    :vars
    (
      ?auto_1847671 - HOIST
      ?auto_1847672 - PLACE
      ?auto_1847673 - TRUCK
      ?auto_1847670 - PLACE
      ?auto_1847674 - HOIST
      ?auto_1847669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847671 ?auto_1847672 ) ( SURFACE-AT ?auto_1847667 ?auto_1847672 ) ( CLEAR ?auto_1847667 ) ( IS-CRATE ?auto_1847668 ) ( not ( = ?auto_1847667 ?auto_1847668 ) ) ( AVAILABLE ?auto_1847671 ) ( ON ?auto_1847667 ?auto_1847666 ) ( not ( = ?auto_1847666 ?auto_1847667 ) ) ( not ( = ?auto_1847666 ?auto_1847668 ) ) ( TRUCK-AT ?auto_1847673 ?auto_1847670 ) ( not ( = ?auto_1847670 ?auto_1847672 ) ) ( HOIST-AT ?auto_1847674 ?auto_1847670 ) ( not ( = ?auto_1847671 ?auto_1847674 ) ) ( AVAILABLE ?auto_1847674 ) ( SURFACE-AT ?auto_1847668 ?auto_1847670 ) ( ON ?auto_1847668 ?auto_1847669 ) ( CLEAR ?auto_1847668 ) ( not ( = ?auto_1847667 ?auto_1847669 ) ) ( not ( = ?auto_1847668 ?auto_1847669 ) ) ( not ( = ?auto_1847666 ?auto_1847669 ) ) ( ON ?auto_1847657 ?auto_1847656 ) ( ON ?auto_1847658 ?auto_1847657 ) ( ON ?auto_1847659 ?auto_1847658 ) ( ON ?auto_1847660 ?auto_1847659 ) ( ON ?auto_1847661 ?auto_1847660 ) ( ON ?auto_1847662 ?auto_1847661 ) ( ON ?auto_1847663 ?auto_1847662 ) ( ON ?auto_1847664 ?auto_1847663 ) ( ON ?auto_1847665 ?auto_1847664 ) ( ON ?auto_1847666 ?auto_1847665 ) ( not ( = ?auto_1847656 ?auto_1847657 ) ) ( not ( = ?auto_1847656 ?auto_1847658 ) ) ( not ( = ?auto_1847656 ?auto_1847659 ) ) ( not ( = ?auto_1847656 ?auto_1847660 ) ) ( not ( = ?auto_1847656 ?auto_1847661 ) ) ( not ( = ?auto_1847656 ?auto_1847662 ) ) ( not ( = ?auto_1847656 ?auto_1847663 ) ) ( not ( = ?auto_1847656 ?auto_1847664 ) ) ( not ( = ?auto_1847656 ?auto_1847665 ) ) ( not ( = ?auto_1847656 ?auto_1847666 ) ) ( not ( = ?auto_1847656 ?auto_1847667 ) ) ( not ( = ?auto_1847656 ?auto_1847668 ) ) ( not ( = ?auto_1847656 ?auto_1847669 ) ) ( not ( = ?auto_1847657 ?auto_1847658 ) ) ( not ( = ?auto_1847657 ?auto_1847659 ) ) ( not ( = ?auto_1847657 ?auto_1847660 ) ) ( not ( = ?auto_1847657 ?auto_1847661 ) ) ( not ( = ?auto_1847657 ?auto_1847662 ) ) ( not ( = ?auto_1847657 ?auto_1847663 ) ) ( not ( = ?auto_1847657 ?auto_1847664 ) ) ( not ( = ?auto_1847657 ?auto_1847665 ) ) ( not ( = ?auto_1847657 ?auto_1847666 ) ) ( not ( = ?auto_1847657 ?auto_1847667 ) ) ( not ( = ?auto_1847657 ?auto_1847668 ) ) ( not ( = ?auto_1847657 ?auto_1847669 ) ) ( not ( = ?auto_1847658 ?auto_1847659 ) ) ( not ( = ?auto_1847658 ?auto_1847660 ) ) ( not ( = ?auto_1847658 ?auto_1847661 ) ) ( not ( = ?auto_1847658 ?auto_1847662 ) ) ( not ( = ?auto_1847658 ?auto_1847663 ) ) ( not ( = ?auto_1847658 ?auto_1847664 ) ) ( not ( = ?auto_1847658 ?auto_1847665 ) ) ( not ( = ?auto_1847658 ?auto_1847666 ) ) ( not ( = ?auto_1847658 ?auto_1847667 ) ) ( not ( = ?auto_1847658 ?auto_1847668 ) ) ( not ( = ?auto_1847658 ?auto_1847669 ) ) ( not ( = ?auto_1847659 ?auto_1847660 ) ) ( not ( = ?auto_1847659 ?auto_1847661 ) ) ( not ( = ?auto_1847659 ?auto_1847662 ) ) ( not ( = ?auto_1847659 ?auto_1847663 ) ) ( not ( = ?auto_1847659 ?auto_1847664 ) ) ( not ( = ?auto_1847659 ?auto_1847665 ) ) ( not ( = ?auto_1847659 ?auto_1847666 ) ) ( not ( = ?auto_1847659 ?auto_1847667 ) ) ( not ( = ?auto_1847659 ?auto_1847668 ) ) ( not ( = ?auto_1847659 ?auto_1847669 ) ) ( not ( = ?auto_1847660 ?auto_1847661 ) ) ( not ( = ?auto_1847660 ?auto_1847662 ) ) ( not ( = ?auto_1847660 ?auto_1847663 ) ) ( not ( = ?auto_1847660 ?auto_1847664 ) ) ( not ( = ?auto_1847660 ?auto_1847665 ) ) ( not ( = ?auto_1847660 ?auto_1847666 ) ) ( not ( = ?auto_1847660 ?auto_1847667 ) ) ( not ( = ?auto_1847660 ?auto_1847668 ) ) ( not ( = ?auto_1847660 ?auto_1847669 ) ) ( not ( = ?auto_1847661 ?auto_1847662 ) ) ( not ( = ?auto_1847661 ?auto_1847663 ) ) ( not ( = ?auto_1847661 ?auto_1847664 ) ) ( not ( = ?auto_1847661 ?auto_1847665 ) ) ( not ( = ?auto_1847661 ?auto_1847666 ) ) ( not ( = ?auto_1847661 ?auto_1847667 ) ) ( not ( = ?auto_1847661 ?auto_1847668 ) ) ( not ( = ?auto_1847661 ?auto_1847669 ) ) ( not ( = ?auto_1847662 ?auto_1847663 ) ) ( not ( = ?auto_1847662 ?auto_1847664 ) ) ( not ( = ?auto_1847662 ?auto_1847665 ) ) ( not ( = ?auto_1847662 ?auto_1847666 ) ) ( not ( = ?auto_1847662 ?auto_1847667 ) ) ( not ( = ?auto_1847662 ?auto_1847668 ) ) ( not ( = ?auto_1847662 ?auto_1847669 ) ) ( not ( = ?auto_1847663 ?auto_1847664 ) ) ( not ( = ?auto_1847663 ?auto_1847665 ) ) ( not ( = ?auto_1847663 ?auto_1847666 ) ) ( not ( = ?auto_1847663 ?auto_1847667 ) ) ( not ( = ?auto_1847663 ?auto_1847668 ) ) ( not ( = ?auto_1847663 ?auto_1847669 ) ) ( not ( = ?auto_1847664 ?auto_1847665 ) ) ( not ( = ?auto_1847664 ?auto_1847666 ) ) ( not ( = ?auto_1847664 ?auto_1847667 ) ) ( not ( = ?auto_1847664 ?auto_1847668 ) ) ( not ( = ?auto_1847664 ?auto_1847669 ) ) ( not ( = ?auto_1847665 ?auto_1847666 ) ) ( not ( = ?auto_1847665 ?auto_1847667 ) ) ( not ( = ?auto_1847665 ?auto_1847668 ) ) ( not ( = ?auto_1847665 ?auto_1847669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847666 ?auto_1847667 ?auto_1847668 )
      ( MAKE-12CRATE-VERIFY ?auto_1847656 ?auto_1847657 ?auto_1847658 ?auto_1847659 ?auto_1847660 ?auto_1847661 ?auto_1847662 ?auto_1847663 ?auto_1847664 ?auto_1847665 ?auto_1847666 ?auto_1847667 ?auto_1847668 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847819 - SURFACE
      ?auto_1847820 - SURFACE
      ?auto_1847821 - SURFACE
      ?auto_1847822 - SURFACE
      ?auto_1847823 - SURFACE
      ?auto_1847824 - SURFACE
      ?auto_1847825 - SURFACE
      ?auto_1847826 - SURFACE
      ?auto_1847827 - SURFACE
      ?auto_1847828 - SURFACE
      ?auto_1847829 - SURFACE
      ?auto_1847830 - SURFACE
      ?auto_1847831 - SURFACE
    )
    :vars
    (
      ?auto_1847833 - HOIST
      ?auto_1847836 - PLACE
      ?auto_1847834 - PLACE
      ?auto_1847835 - HOIST
      ?auto_1847832 - SURFACE
      ?auto_1847837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847833 ?auto_1847836 ) ( SURFACE-AT ?auto_1847830 ?auto_1847836 ) ( CLEAR ?auto_1847830 ) ( IS-CRATE ?auto_1847831 ) ( not ( = ?auto_1847830 ?auto_1847831 ) ) ( AVAILABLE ?auto_1847833 ) ( ON ?auto_1847830 ?auto_1847829 ) ( not ( = ?auto_1847829 ?auto_1847830 ) ) ( not ( = ?auto_1847829 ?auto_1847831 ) ) ( not ( = ?auto_1847834 ?auto_1847836 ) ) ( HOIST-AT ?auto_1847835 ?auto_1847834 ) ( not ( = ?auto_1847833 ?auto_1847835 ) ) ( AVAILABLE ?auto_1847835 ) ( SURFACE-AT ?auto_1847831 ?auto_1847834 ) ( ON ?auto_1847831 ?auto_1847832 ) ( CLEAR ?auto_1847831 ) ( not ( = ?auto_1847830 ?auto_1847832 ) ) ( not ( = ?auto_1847831 ?auto_1847832 ) ) ( not ( = ?auto_1847829 ?auto_1847832 ) ) ( TRUCK-AT ?auto_1847837 ?auto_1847836 ) ( ON ?auto_1847820 ?auto_1847819 ) ( ON ?auto_1847821 ?auto_1847820 ) ( ON ?auto_1847822 ?auto_1847821 ) ( ON ?auto_1847823 ?auto_1847822 ) ( ON ?auto_1847824 ?auto_1847823 ) ( ON ?auto_1847825 ?auto_1847824 ) ( ON ?auto_1847826 ?auto_1847825 ) ( ON ?auto_1847827 ?auto_1847826 ) ( ON ?auto_1847828 ?auto_1847827 ) ( ON ?auto_1847829 ?auto_1847828 ) ( not ( = ?auto_1847819 ?auto_1847820 ) ) ( not ( = ?auto_1847819 ?auto_1847821 ) ) ( not ( = ?auto_1847819 ?auto_1847822 ) ) ( not ( = ?auto_1847819 ?auto_1847823 ) ) ( not ( = ?auto_1847819 ?auto_1847824 ) ) ( not ( = ?auto_1847819 ?auto_1847825 ) ) ( not ( = ?auto_1847819 ?auto_1847826 ) ) ( not ( = ?auto_1847819 ?auto_1847827 ) ) ( not ( = ?auto_1847819 ?auto_1847828 ) ) ( not ( = ?auto_1847819 ?auto_1847829 ) ) ( not ( = ?auto_1847819 ?auto_1847830 ) ) ( not ( = ?auto_1847819 ?auto_1847831 ) ) ( not ( = ?auto_1847819 ?auto_1847832 ) ) ( not ( = ?auto_1847820 ?auto_1847821 ) ) ( not ( = ?auto_1847820 ?auto_1847822 ) ) ( not ( = ?auto_1847820 ?auto_1847823 ) ) ( not ( = ?auto_1847820 ?auto_1847824 ) ) ( not ( = ?auto_1847820 ?auto_1847825 ) ) ( not ( = ?auto_1847820 ?auto_1847826 ) ) ( not ( = ?auto_1847820 ?auto_1847827 ) ) ( not ( = ?auto_1847820 ?auto_1847828 ) ) ( not ( = ?auto_1847820 ?auto_1847829 ) ) ( not ( = ?auto_1847820 ?auto_1847830 ) ) ( not ( = ?auto_1847820 ?auto_1847831 ) ) ( not ( = ?auto_1847820 ?auto_1847832 ) ) ( not ( = ?auto_1847821 ?auto_1847822 ) ) ( not ( = ?auto_1847821 ?auto_1847823 ) ) ( not ( = ?auto_1847821 ?auto_1847824 ) ) ( not ( = ?auto_1847821 ?auto_1847825 ) ) ( not ( = ?auto_1847821 ?auto_1847826 ) ) ( not ( = ?auto_1847821 ?auto_1847827 ) ) ( not ( = ?auto_1847821 ?auto_1847828 ) ) ( not ( = ?auto_1847821 ?auto_1847829 ) ) ( not ( = ?auto_1847821 ?auto_1847830 ) ) ( not ( = ?auto_1847821 ?auto_1847831 ) ) ( not ( = ?auto_1847821 ?auto_1847832 ) ) ( not ( = ?auto_1847822 ?auto_1847823 ) ) ( not ( = ?auto_1847822 ?auto_1847824 ) ) ( not ( = ?auto_1847822 ?auto_1847825 ) ) ( not ( = ?auto_1847822 ?auto_1847826 ) ) ( not ( = ?auto_1847822 ?auto_1847827 ) ) ( not ( = ?auto_1847822 ?auto_1847828 ) ) ( not ( = ?auto_1847822 ?auto_1847829 ) ) ( not ( = ?auto_1847822 ?auto_1847830 ) ) ( not ( = ?auto_1847822 ?auto_1847831 ) ) ( not ( = ?auto_1847822 ?auto_1847832 ) ) ( not ( = ?auto_1847823 ?auto_1847824 ) ) ( not ( = ?auto_1847823 ?auto_1847825 ) ) ( not ( = ?auto_1847823 ?auto_1847826 ) ) ( not ( = ?auto_1847823 ?auto_1847827 ) ) ( not ( = ?auto_1847823 ?auto_1847828 ) ) ( not ( = ?auto_1847823 ?auto_1847829 ) ) ( not ( = ?auto_1847823 ?auto_1847830 ) ) ( not ( = ?auto_1847823 ?auto_1847831 ) ) ( not ( = ?auto_1847823 ?auto_1847832 ) ) ( not ( = ?auto_1847824 ?auto_1847825 ) ) ( not ( = ?auto_1847824 ?auto_1847826 ) ) ( not ( = ?auto_1847824 ?auto_1847827 ) ) ( not ( = ?auto_1847824 ?auto_1847828 ) ) ( not ( = ?auto_1847824 ?auto_1847829 ) ) ( not ( = ?auto_1847824 ?auto_1847830 ) ) ( not ( = ?auto_1847824 ?auto_1847831 ) ) ( not ( = ?auto_1847824 ?auto_1847832 ) ) ( not ( = ?auto_1847825 ?auto_1847826 ) ) ( not ( = ?auto_1847825 ?auto_1847827 ) ) ( not ( = ?auto_1847825 ?auto_1847828 ) ) ( not ( = ?auto_1847825 ?auto_1847829 ) ) ( not ( = ?auto_1847825 ?auto_1847830 ) ) ( not ( = ?auto_1847825 ?auto_1847831 ) ) ( not ( = ?auto_1847825 ?auto_1847832 ) ) ( not ( = ?auto_1847826 ?auto_1847827 ) ) ( not ( = ?auto_1847826 ?auto_1847828 ) ) ( not ( = ?auto_1847826 ?auto_1847829 ) ) ( not ( = ?auto_1847826 ?auto_1847830 ) ) ( not ( = ?auto_1847826 ?auto_1847831 ) ) ( not ( = ?auto_1847826 ?auto_1847832 ) ) ( not ( = ?auto_1847827 ?auto_1847828 ) ) ( not ( = ?auto_1847827 ?auto_1847829 ) ) ( not ( = ?auto_1847827 ?auto_1847830 ) ) ( not ( = ?auto_1847827 ?auto_1847831 ) ) ( not ( = ?auto_1847827 ?auto_1847832 ) ) ( not ( = ?auto_1847828 ?auto_1847829 ) ) ( not ( = ?auto_1847828 ?auto_1847830 ) ) ( not ( = ?auto_1847828 ?auto_1847831 ) ) ( not ( = ?auto_1847828 ?auto_1847832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847829 ?auto_1847830 ?auto_1847831 )
      ( MAKE-12CRATE-VERIFY ?auto_1847819 ?auto_1847820 ?auto_1847821 ?auto_1847822 ?auto_1847823 ?auto_1847824 ?auto_1847825 ?auto_1847826 ?auto_1847827 ?auto_1847828 ?auto_1847829 ?auto_1847830 ?auto_1847831 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847982 - SURFACE
      ?auto_1847983 - SURFACE
      ?auto_1847984 - SURFACE
      ?auto_1847985 - SURFACE
      ?auto_1847986 - SURFACE
      ?auto_1847987 - SURFACE
      ?auto_1847988 - SURFACE
      ?auto_1847989 - SURFACE
      ?auto_1847990 - SURFACE
      ?auto_1847991 - SURFACE
      ?auto_1847992 - SURFACE
      ?auto_1847993 - SURFACE
      ?auto_1847994 - SURFACE
    )
    :vars
    (
      ?auto_1847995 - HOIST
      ?auto_1848000 - PLACE
      ?auto_1847996 - PLACE
      ?auto_1847999 - HOIST
      ?auto_1847997 - SURFACE
      ?auto_1847998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847995 ?auto_1848000 ) ( IS-CRATE ?auto_1847994 ) ( not ( = ?auto_1847993 ?auto_1847994 ) ) ( not ( = ?auto_1847992 ?auto_1847993 ) ) ( not ( = ?auto_1847992 ?auto_1847994 ) ) ( not ( = ?auto_1847996 ?auto_1848000 ) ) ( HOIST-AT ?auto_1847999 ?auto_1847996 ) ( not ( = ?auto_1847995 ?auto_1847999 ) ) ( AVAILABLE ?auto_1847999 ) ( SURFACE-AT ?auto_1847994 ?auto_1847996 ) ( ON ?auto_1847994 ?auto_1847997 ) ( CLEAR ?auto_1847994 ) ( not ( = ?auto_1847993 ?auto_1847997 ) ) ( not ( = ?auto_1847994 ?auto_1847997 ) ) ( not ( = ?auto_1847992 ?auto_1847997 ) ) ( TRUCK-AT ?auto_1847998 ?auto_1848000 ) ( SURFACE-AT ?auto_1847992 ?auto_1848000 ) ( CLEAR ?auto_1847992 ) ( LIFTING ?auto_1847995 ?auto_1847993 ) ( IS-CRATE ?auto_1847993 ) ( ON ?auto_1847983 ?auto_1847982 ) ( ON ?auto_1847984 ?auto_1847983 ) ( ON ?auto_1847985 ?auto_1847984 ) ( ON ?auto_1847986 ?auto_1847985 ) ( ON ?auto_1847987 ?auto_1847986 ) ( ON ?auto_1847988 ?auto_1847987 ) ( ON ?auto_1847989 ?auto_1847988 ) ( ON ?auto_1847990 ?auto_1847989 ) ( ON ?auto_1847991 ?auto_1847990 ) ( ON ?auto_1847992 ?auto_1847991 ) ( not ( = ?auto_1847982 ?auto_1847983 ) ) ( not ( = ?auto_1847982 ?auto_1847984 ) ) ( not ( = ?auto_1847982 ?auto_1847985 ) ) ( not ( = ?auto_1847982 ?auto_1847986 ) ) ( not ( = ?auto_1847982 ?auto_1847987 ) ) ( not ( = ?auto_1847982 ?auto_1847988 ) ) ( not ( = ?auto_1847982 ?auto_1847989 ) ) ( not ( = ?auto_1847982 ?auto_1847990 ) ) ( not ( = ?auto_1847982 ?auto_1847991 ) ) ( not ( = ?auto_1847982 ?auto_1847992 ) ) ( not ( = ?auto_1847982 ?auto_1847993 ) ) ( not ( = ?auto_1847982 ?auto_1847994 ) ) ( not ( = ?auto_1847982 ?auto_1847997 ) ) ( not ( = ?auto_1847983 ?auto_1847984 ) ) ( not ( = ?auto_1847983 ?auto_1847985 ) ) ( not ( = ?auto_1847983 ?auto_1847986 ) ) ( not ( = ?auto_1847983 ?auto_1847987 ) ) ( not ( = ?auto_1847983 ?auto_1847988 ) ) ( not ( = ?auto_1847983 ?auto_1847989 ) ) ( not ( = ?auto_1847983 ?auto_1847990 ) ) ( not ( = ?auto_1847983 ?auto_1847991 ) ) ( not ( = ?auto_1847983 ?auto_1847992 ) ) ( not ( = ?auto_1847983 ?auto_1847993 ) ) ( not ( = ?auto_1847983 ?auto_1847994 ) ) ( not ( = ?auto_1847983 ?auto_1847997 ) ) ( not ( = ?auto_1847984 ?auto_1847985 ) ) ( not ( = ?auto_1847984 ?auto_1847986 ) ) ( not ( = ?auto_1847984 ?auto_1847987 ) ) ( not ( = ?auto_1847984 ?auto_1847988 ) ) ( not ( = ?auto_1847984 ?auto_1847989 ) ) ( not ( = ?auto_1847984 ?auto_1847990 ) ) ( not ( = ?auto_1847984 ?auto_1847991 ) ) ( not ( = ?auto_1847984 ?auto_1847992 ) ) ( not ( = ?auto_1847984 ?auto_1847993 ) ) ( not ( = ?auto_1847984 ?auto_1847994 ) ) ( not ( = ?auto_1847984 ?auto_1847997 ) ) ( not ( = ?auto_1847985 ?auto_1847986 ) ) ( not ( = ?auto_1847985 ?auto_1847987 ) ) ( not ( = ?auto_1847985 ?auto_1847988 ) ) ( not ( = ?auto_1847985 ?auto_1847989 ) ) ( not ( = ?auto_1847985 ?auto_1847990 ) ) ( not ( = ?auto_1847985 ?auto_1847991 ) ) ( not ( = ?auto_1847985 ?auto_1847992 ) ) ( not ( = ?auto_1847985 ?auto_1847993 ) ) ( not ( = ?auto_1847985 ?auto_1847994 ) ) ( not ( = ?auto_1847985 ?auto_1847997 ) ) ( not ( = ?auto_1847986 ?auto_1847987 ) ) ( not ( = ?auto_1847986 ?auto_1847988 ) ) ( not ( = ?auto_1847986 ?auto_1847989 ) ) ( not ( = ?auto_1847986 ?auto_1847990 ) ) ( not ( = ?auto_1847986 ?auto_1847991 ) ) ( not ( = ?auto_1847986 ?auto_1847992 ) ) ( not ( = ?auto_1847986 ?auto_1847993 ) ) ( not ( = ?auto_1847986 ?auto_1847994 ) ) ( not ( = ?auto_1847986 ?auto_1847997 ) ) ( not ( = ?auto_1847987 ?auto_1847988 ) ) ( not ( = ?auto_1847987 ?auto_1847989 ) ) ( not ( = ?auto_1847987 ?auto_1847990 ) ) ( not ( = ?auto_1847987 ?auto_1847991 ) ) ( not ( = ?auto_1847987 ?auto_1847992 ) ) ( not ( = ?auto_1847987 ?auto_1847993 ) ) ( not ( = ?auto_1847987 ?auto_1847994 ) ) ( not ( = ?auto_1847987 ?auto_1847997 ) ) ( not ( = ?auto_1847988 ?auto_1847989 ) ) ( not ( = ?auto_1847988 ?auto_1847990 ) ) ( not ( = ?auto_1847988 ?auto_1847991 ) ) ( not ( = ?auto_1847988 ?auto_1847992 ) ) ( not ( = ?auto_1847988 ?auto_1847993 ) ) ( not ( = ?auto_1847988 ?auto_1847994 ) ) ( not ( = ?auto_1847988 ?auto_1847997 ) ) ( not ( = ?auto_1847989 ?auto_1847990 ) ) ( not ( = ?auto_1847989 ?auto_1847991 ) ) ( not ( = ?auto_1847989 ?auto_1847992 ) ) ( not ( = ?auto_1847989 ?auto_1847993 ) ) ( not ( = ?auto_1847989 ?auto_1847994 ) ) ( not ( = ?auto_1847989 ?auto_1847997 ) ) ( not ( = ?auto_1847990 ?auto_1847991 ) ) ( not ( = ?auto_1847990 ?auto_1847992 ) ) ( not ( = ?auto_1847990 ?auto_1847993 ) ) ( not ( = ?auto_1847990 ?auto_1847994 ) ) ( not ( = ?auto_1847990 ?auto_1847997 ) ) ( not ( = ?auto_1847991 ?auto_1847992 ) ) ( not ( = ?auto_1847991 ?auto_1847993 ) ) ( not ( = ?auto_1847991 ?auto_1847994 ) ) ( not ( = ?auto_1847991 ?auto_1847997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847992 ?auto_1847993 ?auto_1847994 )
      ( MAKE-12CRATE-VERIFY ?auto_1847982 ?auto_1847983 ?auto_1847984 ?auto_1847985 ?auto_1847986 ?auto_1847987 ?auto_1847988 ?auto_1847989 ?auto_1847990 ?auto_1847991 ?auto_1847992 ?auto_1847993 ?auto_1847994 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1848145 - SURFACE
      ?auto_1848146 - SURFACE
      ?auto_1848147 - SURFACE
      ?auto_1848148 - SURFACE
      ?auto_1848149 - SURFACE
      ?auto_1848150 - SURFACE
      ?auto_1848151 - SURFACE
      ?auto_1848152 - SURFACE
      ?auto_1848153 - SURFACE
      ?auto_1848154 - SURFACE
      ?auto_1848155 - SURFACE
      ?auto_1848156 - SURFACE
      ?auto_1848157 - SURFACE
    )
    :vars
    (
      ?auto_1848160 - HOIST
      ?auto_1848158 - PLACE
      ?auto_1848162 - PLACE
      ?auto_1848163 - HOIST
      ?auto_1848159 - SURFACE
      ?auto_1848161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1848160 ?auto_1848158 ) ( IS-CRATE ?auto_1848157 ) ( not ( = ?auto_1848156 ?auto_1848157 ) ) ( not ( = ?auto_1848155 ?auto_1848156 ) ) ( not ( = ?auto_1848155 ?auto_1848157 ) ) ( not ( = ?auto_1848162 ?auto_1848158 ) ) ( HOIST-AT ?auto_1848163 ?auto_1848162 ) ( not ( = ?auto_1848160 ?auto_1848163 ) ) ( AVAILABLE ?auto_1848163 ) ( SURFACE-AT ?auto_1848157 ?auto_1848162 ) ( ON ?auto_1848157 ?auto_1848159 ) ( CLEAR ?auto_1848157 ) ( not ( = ?auto_1848156 ?auto_1848159 ) ) ( not ( = ?auto_1848157 ?auto_1848159 ) ) ( not ( = ?auto_1848155 ?auto_1848159 ) ) ( TRUCK-AT ?auto_1848161 ?auto_1848158 ) ( SURFACE-AT ?auto_1848155 ?auto_1848158 ) ( CLEAR ?auto_1848155 ) ( IS-CRATE ?auto_1848156 ) ( AVAILABLE ?auto_1848160 ) ( IN ?auto_1848156 ?auto_1848161 ) ( ON ?auto_1848146 ?auto_1848145 ) ( ON ?auto_1848147 ?auto_1848146 ) ( ON ?auto_1848148 ?auto_1848147 ) ( ON ?auto_1848149 ?auto_1848148 ) ( ON ?auto_1848150 ?auto_1848149 ) ( ON ?auto_1848151 ?auto_1848150 ) ( ON ?auto_1848152 ?auto_1848151 ) ( ON ?auto_1848153 ?auto_1848152 ) ( ON ?auto_1848154 ?auto_1848153 ) ( ON ?auto_1848155 ?auto_1848154 ) ( not ( = ?auto_1848145 ?auto_1848146 ) ) ( not ( = ?auto_1848145 ?auto_1848147 ) ) ( not ( = ?auto_1848145 ?auto_1848148 ) ) ( not ( = ?auto_1848145 ?auto_1848149 ) ) ( not ( = ?auto_1848145 ?auto_1848150 ) ) ( not ( = ?auto_1848145 ?auto_1848151 ) ) ( not ( = ?auto_1848145 ?auto_1848152 ) ) ( not ( = ?auto_1848145 ?auto_1848153 ) ) ( not ( = ?auto_1848145 ?auto_1848154 ) ) ( not ( = ?auto_1848145 ?auto_1848155 ) ) ( not ( = ?auto_1848145 ?auto_1848156 ) ) ( not ( = ?auto_1848145 ?auto_1848157 ) ) ( not ( = ?auto_1848145 ?auto_1848159 ) ) ( not ( = ?auto_1848146 ?auto_1848147 ) ) ( not ( = ?auto_1848146 ?auto_1848148 ) ) ( not ( = ?auto_1848146 ?auto_1848149 ) ) ( not ( = ?auto_1848146 ?auto_1848150 ) ) ( not ( = ?auto_1848146 ?auto_1848151 ) ) ( not ( = ?auto_1848146 ?auto_1848152 ) ) ( not ( = ?auto_1848146 ?auto_1848153 ) ) ( not ( = ?auto_1848146 ?auto_1848154 ) ) ( not ( = ?auto_1848146 ?auto_1848155 ) ) ( not ( = ?auto_1848146 ?auto_1848156 ) ) ( not ( = ?auto_1848146 ?auto_1848157 ) ) ( not ( = ?auto_1848146 ?auto_1848159 ) ) ( not ( = ?auto_1848147 ?auto_1848148 ) ) ( not ( = ?auto_1848147 ?auto_1848149 ) ) ( not ( = ?auto_1848147 ?auto_1848150 ) ) ( not ( = ?auto_1848147 ?auto_1848151 ) ) ( not ( = ?auto_1848147 ?auto_1848152 ) ) ( not ( = ?auto_1848147 ?auto_1848153 ) ) ( not ( = ?auto_1848147 ?auto_1848154 ) ) ( not ( = ?auto_1848147 ?auto_1848155 ) ) ( not ( = ?auto_1848147 ?auto_1848156 ) ) ( not ( = ?auto_1848147 ?auto_1848157 ) ) ( not ( = ?auto_1848147 ?auto_1848159 ) ) ( not ( = ?auto_1848148 ?auto_1848149 ) ) ( not ( = ?auto_1848148 ?auto_1848150 ) ) ( not ( = ?auto_1848148 ?auto_1848151 ) ) ( not ( = ?auto_1848148 ?auto_1848152 ) ) ( not ( = ?auto_1848148 ?auto_1848153 ) ) ( not ( = ?auto_1848148 ?auto_1848154 ) ) ( not ( = ?auto_1848148 ?auto_1848155 ) ) ( not ( = ?auto_1848148 ?auto_1848156 ) ) ( not ( = ?auto_1848148 ?auto_1848157 ) ) ( not ( = ?auto_1848148 ?auto_1848159 ) ) ( not ( = ?auto_1848149 ?auto_1848150 ) ) ( not ( = ?auto_1848149 ?auto_1848151 ) ) ( not ( = ?auto_1848149 ?auto_1848152 ) ) ( not ( = ?auto_1848149 ?auto_1848153 ) ) ( not ( = ?auto_1848149 ?auto_1848154 ) ) ( not ( = ?auto_1848149 ?auto_1848155 ) ) ( not ( = ?auto_1848149 ?auto_1848156 ) ) ( not ( = ?auto_1848149 ?auto_1848157 ) ) ( not ( = ?auto_1848149 ?auto_1848159 ) ) ( not ( = ?auto_1848150 ?auto_1848151 ) ) ( not ( = ?auto_1848150 ?auto_1848152 ) ) ( not ( = ?auto_1848150 ?auto_1848153 ) ) ( not ( = ?auto_1848150 ?auto_1848154 ) ) ( not ( = ?auto_1848150 ?auto_1848155 ) ) ( not ( = ?auto_1848150 ?auto_1848156 ) ) ( not ( = ?auto_1848150 ?auto_1848157 ) ) ( not ( = ?auto_1848150 ?auto_1848159 ) ) ( not ( = ?auto_1848151 ?auto_1848152 ) ) ( not ( = ?auto_1848151 ?auto_1848153 ) ) ( not ( = ?auto_1848151 ?auto_1848154 ) ) ( not ( = ?auto_1848151 ?auto_1848155 ) ) ( not ( = ?auto_1848151 ?auto_1848156 ) ) ( not ( = ?auto_1848151 ?auto_1848157 ) ) ( not ( = ?auto_1848151 ?auto_1848159 ) ) ( not ( = ?auto_1848152 ?auto_1848153 ) ) ( not ( = ?auto_1848152 ?auto_1848154 ) ) ( not ( = ?auto_1848152 ?auto_1848155 ) ) ( not ( = ?auto_1848152 ?auto_1848156 ) ) ( not ( = ?auto_1848152 ?auto_1848157 ) ) ( not ( = ?auto_1848152 ?auto_1848159 ) ) ( not ( = ?auto_1848153 ?auto_1848154 ) ) ( not ( = ?auto_1848153 ?auto_1848155 ) ) ( not ( = ?auto_1848153 ?auto_1848156 ) ) ( not ( = ?auto_1848153 ?auto_1848157 ) ) ( not ( = ?auto_1848153 ?auto_1848159 ) ) ( not ( = ?auto_1848154 ?auto_1848155 ) ) ( not ( = ?auto_1848154 ?auto_1848156 ) ) ( not ( = ?auto_1848154 ?auto_1848157 ) ) ( not ( = ?auto_1848154 ?auto_1848159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1848155 ?auto_1848156 ?auto_1848157 )
      ( MAKE-12CRATE-VERIFY ?auto_1848145 ?auto_1848146 ?auto_1848147 ?auto_1848148 ?auto_1848149 ?auto_1848150 ?auto_1848151 ?auto_1848152 ?auto_1848153 ?auto_1848154 ?auto_1848155 ?auto_1848156 ?auto_1848157 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1859675 - SURFACE
      ?auto_1859676 - SURFACE
      ?auto_1859677 - SURFACE
      ?auto_1859678 - SURFACE
      ?auto_1859679 - SURFACE
      ?auto_1859680 - SURFACE
      ?auto_1859681 - SURFACE
      ?auto_1859682 - SURFACE
      ?auto_1859683 - SURFACE
      ?auto_1859684 - SURFACE
      ?auto_1859685 - SURFACE
      ?auto_1859686 - SURFACE
      ?auto_1859687 - SURFACE
      ?auto_1859688 - SURFACE
    )
    :vars
    (
      ?auto_1859690 - HOIST
      ?auto_1859689 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1859690 ?auto_1859689 ) ( SURFACE-AT ?auto_1859687 ?auto_1859689 ) ( CLEAR ?auto_1859687 ) ( LIFTING ?auto_1859690 ?auto_1859688 ) ( IS-CRATE ?auto_1859688 ) ( not ( = ?auto_1859687 ?auto_1859688 ) ) ( ON ?auto_1859676 ?auto_1859675 ) ( ON ?auto_1859677 ?auto_1859676 ) ( ON ?auto_1859678 ?auto_1859677 ) ( ON ?auto_1859679 ?auto_1859678 ) ( ON ?auto_1859680 ?auto_1859679 ) ( ON ?auto_1859681 ?auto_1859680 ) ( ON ?auto_1859682 ?auto_1859681 ) ( ON ?auto_1859683 ?auto_1859682 ) ( ON ?auto_1859684 ?auto_1859683 ) ( ON ?auto_1859685 ?auto_1859684 ) ( ON ?auto_1859686 ?auto_1859685 ) ( ON ?auto_1859687 ?auto_1859686 ) ( not ( = ?auto_1859675 ?auto_1859676 ) ) ( not ( = ?auto_1859675 ?auto_1859677 ) ) ( not ( = ?auto_1859675 ?auto_1859678 ) ) ( not ( = ?auto_1859675 ?auto_1859679 ) ) ( not ( = ?auto_1859675 ?auto_1859680 ) ) ( not ( = ?auto_1859675 ?auto_1859681 ) ) ( not ( = ?auto_1859675 ?auto_1859682 ) ) ( not ( = ?auto_1859675 ?auto_1859683 ) ) ( not ( = ?auto_1859675 ?auto_1859684 ) ) ( not ( = ?auto_1859675 ?auto_1859685 ) ) ( not ( = ?auto_1859675 ?auto_1859686 ) ) ( not ( = ?auto_1859675 ?auto_1859687 ) ) ( not ( = ?auto_1859675 ?auto_1859688 ) ) ( not ( = ?auto_1859676 ?auto_1859677 ) ) ( not ( = ?auto_1859676 ?auto_1859678 ) ) ( not ( = ?auto_1859676 ?auto_1859679 ) ) ( not ( = ?auto_1859676 ?auto_1859680 ) ) ( not ( = ?auto_1859676 ?auto_1859681 ) ) ( not ( = ?auto_1859676 ?auto_1859682 ) ) ( not ( = ?auto_1859676 ?auto_1859683 ) ) ( not ( = ?auto_1859676 ?auto_1859684 ) ) ( not ( = ?auto_1859676 ?auto_1859685 ) ) ( not ( = ?auto_1859676 ?auto_1859686 ) ) ( not ( = ?auto_1859676 ?auto_1859687 ) ) ( not ( = ?auto_1859676 ?auto_1859688 ) ) ( not ( = ?auto_1859677 ?auto_1859678 ) ) ( not ( = ?auto_1859677 ?auto_1859679 ) ) ( not ( = ?auto_1859677 ?auto_1859680 ) ) ( not ( = ?auto_1859677 ?auto_1859681 ) ) ( not ( = ?auto_1859677 ?auto_1859682 ) ) ( not ( = ?auto_1859677 ?auto_1859683 ) ) ( not ( = ?auto_1859677 ?auto_1859684 ) ) ( not ( = ?auto_1859677 ?auto_1859685 ) ) ( not ( = ?auto_1859677 ?auto_1859686 ) ) ( not ( = ?auto_1859677 ?auto_1859687 ) ) ( not ( = ?auto_1859677 ?auto_1859688 ) ) ( not ( = ?auto_1859678 ?auto_1859679 ) ) ( not ( = ?auto_1859678 ?auto_1859680 ) ) ( not ( = ?auto_1859678 ?auto_1859681 ) ) ( not ( = ?auto_1859678 ?auto_1859682 ) ) ( not ( = ?auto_1859678 ?auto_1859683 ) ) ( not ( = ?auto_1859678 ?auto_1859684 ) ) ( not ( = ?auto_1859678 ?auto_1859685 ) ) ( not ( = ?auto_1859678 ?auto_1859686 ) ) ( not ( = ?auto_1859678 ?auto_1859687 ) ) ( not ( = ?auto_1859678 ?auto_1859688 ) ) ( not ( = ?auto_1859679 ?auto_1859680 ) ) ( not ( = ?auto_1859679 ?auto_1859681 ) ) ( not ( = ?auto_1859679 ?auto_1859682 ) ) ( not ( = ?auto_1859679 ?auto_1859683 ) ) ( not ( = ?auto_1859679 ?auto_1859684 ) ) ( not ( = ?auto_1859679 ?auto_1859685 ) ) ( not ( = ?auto_1859679 ?auto_1859686 ) ) ( not ( = ?auto_1859679 ?auto_1859687 ) ) ( not ( = ?auto_1859679 ?auto_1859688 ) ) ( not ( = ?auto_1859680 ?auto_1859681 ) ) ( not ( = ?auto_1859680 ?auto_1859682 ) ) ( not ( = ?auto_1859680 ?auto_1859683 ) ) ( not ( = ?auto_1859680 ?auto_1859684 ) ) ( not ( = ?auto_1859680 ?auto_1859685 ) ) ( not ( = ?auto_1859680 ?auto_1859686 ) ) ( not ( = ?auto_1859680 ?auto_1859687 ) ) ( not ( = ?auto_1859680 ?auto_1859688 ) ) ( not ( = ?auto_1859681 ?auto_1859682 ) ) ( not ( = ?auto_1859681 ?auto_1859683 ) ) ( not ( = ?auto_1859681 ?auto_1859684 ) ) ( not ( = ?auto_1859681 ?auto_1859685 ) ) ( not ( = ?auto_1859681 ?auto_1859686 ) ) ( not ( = ?auto_1859681 ?auto_1859687 ) ) ( not ( = ?auto_1859681 ?auto_1859688 ) ) ( not ( = ?auto_1859682 ?auto_1859683 ) ) ( not ( = ?auto_1859682 ?auto_1859684 ) ) ( not ( = ?auto_1859682 ?auto_1859685 ) ) ( not ( = ?auto_1859682 ?auto_1859686 ) ) ( not ( = ?auto_1859682 ?auto_1859687 ) ) ( not ( = ?auto_1859682 ?auto_1859688 ) ) ( not ( = ?auto_1859683 ?auto_1859684 ) ) ( not ( = ?auto_1859683 ?auto_1859685 ) ) ( not ( = ?auto_1859683 ?auto_1859686 ) ) ( not ( = ?auto_1859683 ?auto_1859687 ) ) ( not ( = ?auto_1859683 ?auto_1859688 ) ) ( not ( = ?auto_1859684 ?auto_1859685 ) ) ( not ( = ?auto_1859684 ?auto_1859686 ) ) ( not ( = ?auto_1859684 ?auto_1859687 ) ) ( not ( = ?auto_1859684 ?auto_1859688 ) ) ( not ( = ?auto_1859685 ?auto_1859686 ) ) ( not ( = ?auto_1859685 ?auto_1859687 ) ) ( not ( = ?auto_1859685 ?auto_1859688 ) ) ( not ( = ?auto_1859686 ?auto_1859687 ) ) ( not ( = ?auto_1859686 ?auto_1859688 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1859687 ?auto_1859688 )
      ( MAKE-13CRATE-VERIFY ?auto_1859675 ?auto_1859676 ?auto_1859677 ?auto_1859678 ?auto_1859679 ?auto_1859680 ?auto_1859681 ?auto_1859682 ?auto_1859683 ?auto_1859684 ?auto_1859685 ?auto_1859686 ?auto_1859687 ?auto_1859688 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1859817 - SURFACE
      ?auto_1859818 - SURFACE
      ?auto_1859819 - SURFACE
      ?auto_1859820 - SURFACE
      ?auto_1859821 - SURFACE
      ?auto_1859822 - SURFACE
      ?auto_1859823 - SURFACE
      ?auto_1859824 - SURFACE
      ?auto_1859825 - SURFACE
      ?auto_1859826 - SURFACE
      ?auto_1859827 - SURFACE
      ?auto_1859828 - SURFACE
      ?auto_1859829 - SURFACE
      ?auto_1859830 - SURFACE
    )
    :vars
    (
      ?auto_1859831 - HOIST
      ?auto_1859832 - PLACE
      ?auto_1859833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1859831 ?auto_1859832 ) ( SURFACE-AT ?auto_1859829 ?auto_1859832 ) ( CLEAR ?auto_1859829 ) ( IS-CRATE ?auto_1859830 ) ( not ( = ?auto_1859829 ?auto_1859830 ) ) ( TRUCK-AT ?auto_1859833 ?auto_1859832 ) ( AVAILABLE ?auto_1859831 ) ( IN ?auto_1859830 ?auto_1859833 ) ( ON ?auto_1859829 ?auto_1859828 ) ( not ( = ?auto_1859828 ?auto_1859829 ) ) ( not ( = ?auto_1859828 ?auto_1859830 ) ) ( ON ?auto_1859818 ?auto_1859817 ) ( ON ?auto_1859819 ?auto_1859818 ) ( ON ?auto_1859820 ?auto_1859819 ) ( ON ?auto_1859821 ?auto_1859820 ) ( ON ?auto_1859822 ?auto_1859821 ) ( ON ?auto_1859823 ?auto_1859822 ) ( ON ?auto_1859824 ?auto_1859823 ) ( ON ?auto_1859825 ?auto_1859824 ) ( ON ?auto_1859826 ?auto_1859825 ) ( ON ?auto_1859827 ?auto_1859826 ) ( ON ?auto_1859828 ?auto_1859827 ) ( not ( = ?auto_1859817 ?auto_1859818 ) ) ( not ( = ?auto_1859817 ?auto_1859819 ) ) ( not ( = ?auto_1859817 ?auto_1859820 ) ) ( not ( = ?auto_1859817 ?auto_1859821 ) ) ( not ( = ?auto_1859817 ?auto_1859822 ) ) ( not ( = ?auto_1859817 ?auto_1859823 ) ) ( not ( = ?auto_1859817 ?auto_1859824 ) ) ( not ( = ?auto_1859817 ?auto_1859825 ) ) ( not ( = ?auto_1859817 ?auto_1859826 ) ) ( not ( = ?auto_1859817 ?auto_1859827 ) ) ( not ( = ?auto_1859817 ?auto_1859828 ) ) ( not ( = ?auto_1859817 ?auto_1859829 ) ) ( not ( = ?auto_1859817 ?auto_1859830 ) ) ( not ( = ?auto_1859818 ?auto_1859819 ) ) ( not ( = ?auto_1859818 ?auto_1859820 ) ) ( not ( = ?auto_1859818 ?auto_1859821 ) ) ( not ( = ?auto_1859818 ?auto_1859822 ) ) ( not ( = ?auto_1859818 ?auto_1859823 ) ) ( not ( = ?auto_1859818 ?auto_1859824 ) ) ( not ( = ?auto_1859818 ?auto_1859825 ) ) ( not ( = ?auto_1859818 ?auto_1859826 ) ) ( not ( = ?auto_1859818 ?auto_1859827 ) ) ( not ( = ?auto_1859818 ?auto_1859828 ) ) ( not ( = ?auto_1859818 ?auto_1859829 ) ) ( not ( = ?auto_1859818 ?auto_1859830 ) ) ( not ( = ?auto_1859819 ?auto_1859820 ) ) ( not ( = ?auto_1859819 ?auto_1859821 ) ) ( not ( = ?auto_1859819 ?auto_1859822 ) ) ( not ( = ?auto_1859819 ?auto_1859823 ) ) ( not ( = ?auto_1859819 ?auto_1859824 ) ) ( not ( = ?auto_1859819 ?auto_1859825 ) ) ( not ( = ?auto_1859819 ?auto_1859826 ) ) ( not ( = ?auto_1859819 ?auto_1859827 ) ) ( not ( = ?auto_1859819 ?auto_1859828 ) ) ( not ( = ?auto_1859819 ?auto_1859829 ) ) ( not ( = ?auto_1859819 ?auto_1859830 ) ) ( not ( = ?auto_1859820 ?auto_1859821 ) ) ( not ( = ?auto_1859820 ?auto_1859822 ) ) ( not ( = ?auto_1859820 ?auto_1859823 ) ) ( not ( = ?auto_1859820 ?auto_1859824 ) ) ( not ( = ?auto_1859820 ?auto_1859825 ) ) ( not ( = ?auto_1859820 ?auto_1859826 ) ) ( not ( = ?auto_1859820 ?auto_1859827 ) ) ( not ( = ?auto_1859820 ?auto_1859828 ) ) ( not ( = ?auto_1859820 ?auto_1859829 ) ) ( not ( = ?auto_1859820 ?auto_1859830 ) ) ( not ( = ?auto_1859821 ?auto_1859822 ) ) ( not ( = ?auto_1859821 ?auto_1859823 ) ) ( not ( = ?auto_1859821 ?auto_1859824 ) ) ( not ( = ?auto_1859821 ?auto_1859825 ) ) ( not ( = ?auto_1859821 ?auto_1859826 ) ) ( not ( = ?auto_1859821 ?auto_1859827 ) ) ( not ( = ?auto_1859821 ?auto_1859828 ) ) ( not ( = ?auto_1859821 ?auto_1859829 ) ) ( not ( = ?auto_1859821 ?auto_1859830 ) ) ( not ( = ?auto_1859822 ?auto_1859823 ) ) ( not ( = ?auto_1859822 ?auto_1859824 ) ) ( not ( = ?auto_1859822 ?auto_1859825 ) ) ( not ( = ?auto_1859822 ?auto_1859826 ) ) ( not ( = ?auto_1859822 ?auto_1859827 ) ) ( not ( = ?auto_1859822 ?auto_1859828 ) ) ( not ( = ?auto_1859822 ?auto_1859829 ) ) ( not ( = ?auto_1859822 ?auto_1859830 ) ) ( not ( = ?auto_1859823 ?auto_1859824 ) ) ( not ( = ?auto_1859823 ?auto_1859825 ) ) ( not ( = ?auto_1859823 ?auto_1859826 ) ) ( not ( = ?auto_1859823 ?auto_1859827 ) ) ( not ( = ?auto_1859823 ?auto_1859828 ) ) ( not ( = ?auto_1859823 ?auto_1859829 ) ) ( not ( = ?auto_1859823 ?auto_1859830 ) ) ( not ( = ?auto_1859824 ?auto_1859825 ) ) ( not ( = ?auto_1859824 ?auto_1859826 ) ) ( not ( = ?auto_1859824 ?auto_1859827 ) ) ( not ( = ?auto_1859824 ?auto_1859828 ) ) ( not ( = ?auto_1859824 ?auto_1859829 ) ) ( not ( = ?auto_1859824 ?auto_1859830 ) ) ( not ( = ?auto_1859825 ?auto_1859826 ) ) ( not ( = ?auto_1859825 ?auto_1859827 ) ) ( not ( = ?auto_1859825 ?auto_1859828 ) ) ( not ( = ?auto_1859825 ?auto_1859829 ) ) ( not ( = ?auto_1859825 ?auto_1859830 ) ) ( not ( = ?auto_1859826 ?auto_1859827 ) ) ( not ( = ?auto_1859826 ?auto_1859828 ) ) ( not ( = ?auto_1859826 ?auto_1859829 ) ) ( not ( = ?auto_1859826 ?auto_1859830 ) ) ( not ( = ?auto_1859827 ?auto_1859828 ) ) ( not ( = ?auto_1859827 ?auto_1859829 ) ) ( not ( = ?auto_1859827 ?auto_1859830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1859828 ?auto_1859829 ?auto_1859830 )
      ( MAKE-13CRATE-VERIFY ?auto_1859817 ?auto_1859818 ?auto_1859819 ?auto_1859820 ?auto_1859821 ?auto_1859822 ?auto_1859823 ?auto_1859824 ?auto_1859825 ?auto_1859826 ?auto_1859827 ?auto_1859828 ?auto_1859829 ?auto_1859830 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1859973 - SURFACE
      ?auto_1859974 - SURFACE
      ?auto_1859975 - SURFACE
      ?auto_1859976 - SURFACE
      ?auto_1859977 - SURFACE
      ?auto_1859978 - SURFACE
      ?auto_1859979 - SURFACE
      ?auto_1859980 - SURFACE
      ?auto_1859981 - SURFACE
      ?auto_1859982 - SURFACE
      ?auto_1859983 - SURFACE
      ?auto_1859984 - SURFACE
      ?auto_1859985 - SURFACE
      ?auto_1859986 - SURFACE
    )
    :vars
    (
      ?auto_1859988 - HOIST
      ?auto_1859990 - PLACE
      ?auto_1859989 - TRUCK
      ?auto_1859987 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1859988 ?auto_1859990 ) ( SURFACE-AT ?auto_1859985 ?auto_1859990 ) ( CLEAR ?auto_1859985 ) ( IS-CRATE ?auto_1859986 ) ( not ( = ?auto_1859985 ?auto_1859986 ) ) ( AVAILABLE ?auto_1859988 ) ( IN ?auto_1859986 ?auto_1859989 ) ( ON ?auto_1859985 ?auto_1859984 ) ( not ( = ?auto_1859984 ?auto_1859985 ) ) ( not ( = ?auto_1859984 ?auto_1859986 ) ) ( TRUCK-AT ?auto_1859989 ?auto_1859987 ) ( not ( = ?auto_1859987 ?auto_1859990 ) ) ( ON ?auto_1859974 ?auto_1859973 ) ( ON ?auto_1859975 ?auto_1859974 ) ( ON ?auto_1859976 ?auto_1859975 ) ( ON ?auto_1859977 ?auto_1859976 ) ( ON ?auto_1859978 ?auto_1859977 ) ( ON ?auto_1859979 ?auto_1859978 ) ( ON ?auto_1859980 ?auto_1859979 ) ( ON ?auto_1859981 ?auto_1859980 ) ( ON ?auto_1859982 ?auto_1859981 ) ( ON ?auto_1859983 ?auto_1859982 ) ( ON ?auto_1859984 ?auto_1859983 ) ( not ( = ?auto_1859973 ?auto_1859974 ) ) ( not ( = ?auto_1859973 ?auto_1859975 ) ) ( not ( = ?auto_1859973 ?auto_1859976 ) ) ( not ( = ?auto_1859973 ?auto_1859977 ) ) ( not ( = ?auto_1859973 ?auto_1859978 ) ) ( not ( = ?auto_1859973 ?auto_1859979 ) ) ( not ( = ?auto_1859973 ?auto_1859980 ) ) ( not ( = ?auto_1859973 ?auto_1859981 ) ) ( not ( = ?auto_1859973 ?auto_1859982 ) ) ( not ( = ?auto_1859973 ?auto_1859983 ) ) ( not ( = ?auto_1859973 ?auto_1859984 ) ) ( not ( = ?auto_1859973 ?auto_1859985 ) ) ( not ( = ?auto_1859973 ?auto_1859986 ) ) ( not ( = ?auto_1859974 ?auto_1859975 ) ) ( not ( = ?auto_1859974 ?auto_1859976 ) ) ( not ( = ?auto_1859974 ?auto_1859977 ) ) ( not ( = ?auto_1859974 ?auto_1859978 ) ) ( not ( = ?auto_1859974 ?auto_1859979 ) ) ( not ( = ?auto_1859974 ?auto_1859980 ) ) ( not ( = ?auto_1859974 ?auto_1859981 ) ) ( not ( = ?auto_1859974 ?auto_1859982 ) ) ( not ( = ?auto_1859974 ?auto_1859983 ) ) ( not ( = ?auto_1859974 ?auto_1859984 ) ) ( not ( = ?auto_1859974 ?auto_1859985 ) ) ( not ( = ?auto_1859974 ?auto_1859986 ) ) ( not ( = ?auto_1859975 ?auto_1859976 ) ) ( not ( = ?auto_1859975 ?auto_1859977 ) ) ( not ( = ?auto_1859975 ?auto_1859978 ) ) ( not ( = ?auto_1859975 ?auto_1859979 ) ) ( not ( = ?auto_1859975 ?auto_1859980 ) ) ( not ( = ?auto_1859975 ?auto_1859981 ) ) ( not ( = ?auto_1859975 ?auto_1859982 ) ) ( not ( = ?auto_1859975 ?auto_1859983 ) ) ( not ( = ?auto_1859975 ?auto_1859984 ) ) ( not ( = ?auto_1859975 ?auto_1859985 ) ) ( not ( = ?auto_1859975 ?auto_1859986 ) ) ( not ( = ?auto_1859976 ?auto_1859977 ) ) ( not ( = ?auto_1859976 ?auto_1859978 ) ) ( not ( = ?auto_1859976 ?auto_1859979 ) ) ( not ( = ?auto_1859976 ?auto_1859980 ) ) ( not ( = ?auto_1859976 ?auto_1859981 ) ) ( not ( = ?auto_1859976 ?auto_1859982 ) ) ( not ( = ?auto_1859976 ?auto_1859983 ) ) ( not ( = ?auto_1859976 ?auto_1859984 ) ) ( not ( = ?auto_1859976 ?auto_1859985 ) ) ( not ( = ?auto_1859976 ?auto_1859986 ) ) ( not ( = ?auto_1859977 ?auto_1859978 ) ) ( not ( = ?auto_1859977 ?auto_1859979 ) ) ( not ( = ?auto_1859977 ?auto_1859980 ) ) ( not ( = ?auto_1859977 ?auto_1859981 ) ) ( not ( = ?auto_1859977 ?auto_1859982 ) ) ( not ( = ?auto_1859977 ?auto_1859983 ) ) ( not ( = ?auto_1859977 ?auto_1859984 ) ) ( not ( = ?auto_1859977 ?auto_1859985 ) ) ( not ( = ?auto_1859977 ?auto_1859986 ) ) ( not ( = ?auto_1859978 ?auto_1859979 ) ) ( not ( = ?auto_1859978 ?auto_1859980 ) ) ( not ( = ?auto_1859978 ?auto_1859981 ) ) ( not ( = ?auto_1859978 ?auto_1859982 ) ) ( not ( = ?auto_1859978 ?auto_1859983 ) ) ( not ( = ?auto_1859978 ?auto_1859984 ) ) ( not ( = ?auto_1859978 ?auto_1859985 ) ) ( not ( = ?auto_1859978 ?auto_1859986 ) ) ( not ( = ?auto_1859979 ?auto_1859980 ) ) ( not ( = ?auto_1859979 ?auto_1859981 ) ) ( not ( = ?auto_1859979 ?auto_1859982 ) ) ( not ( = ?auto_1859979 ?auto_1859983 ) ) ( not ( = ?auto_1859979 ?auto_1859984 ) ) ( not ( = ?auto_1859979 ?auto_1859985 ) ) ( not ( = ?auto_1859979 ?auto_1859986 ) ) ( not ( = ?auto_1859980 ?auto_1859981 ) ) ( not ( = ?auto_1859980 ?auto_1859982 ) ) ( not ( = ?auto_1859980 ?auto_1859983 ) ) ( not ( = ?auto_1859980 ?auto_1859984 ) ) ( not ( = ?auto_1859980 ?auto_1859985 ) ) ( not ( = ?auto_1859980 ?auto_1859986 ) ) ( not ( = ?auto_1859981 ?auto_1859982 ) ) ( not ( = ?auto_1859981 ?auto_1859983 ) ) ( not ( = ?auto_1859981 ?auto_1859984 ) ) ( not ( = ?auto_1859981 ?auto_1859985 ) ) ( not ( = ?auto_1859981 ?auto_1859986 ) ) ( not ( = ?auto_1859982 ?auto_1859983 ) ) ( not ( = ?auto_1859982 ?auto_1859984 ) ) ( not ( = ?auto_1859982 ?auto_1859985 ) ) ( not ( = ?auto_1859982 ?auto_1859986 ) ) ( not ( = ?auto_1859983 ?auto_1859984 ) ) ( not ( = ?auto_1859983 ?auto_1859985 ) ) ( not ( = ?auto_1859983 ?auto_1859986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1859984 ?auto_1859985 ?auto_1859986 )
      ( MAKE-13CRATE-VERIFY ?auto_1859973 ?auto_1859974 ?auto_1859975 ?auto_1859976 ?auto_1859977 ?auto_1859978 ?auto_1859979 ?auto_1859980 ?auto_1859981 ?auto_1859982 ?auto_1859983 ?auto_1859984 ?auto_1859985 ?auto_1859986 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860142 - SURFACE
      ?auto_1860143 - SURFACE
      ?auto_1860144 - SURFACE
      ?auto_1860145 - SURFACE
      ?auto_1860146 - SURFACE
      ?auto_1860147 - SURFACE
      ?auto_1860148 - SURFACE
      ?auto_1860149 - SURFACE
      ?auto_1860150 - SURFACE
      ?auto_1860151 - SURFACE
      ?auto_1860152 - SURFACE
      ?auto_1860153 - SURFACE
      ?auto_1860154 - SURFACE
      ?auto_1860155 - SURFACE
    )
    :vars
    (
      ?auto_1860157 - HOIST
      ?auto_1860160 - PLACE
      ?auto_1860156 - TRUCK
      ?auto_1860158 - PLACE
      ?auto_1860159 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860157 ?auto_1860160 ) ( SURFACE-AT ?auto_1860154 ?auto_1860160 ) ( CLEAR ?auto_1860154 ) ( IS-CRATE ?auto_1860155 ) ( not ( = ?auto_1860154 ?auto_1860155 ) ) ( AVAILABLE ?auto_1860157 ) ( ON ?auto_1860154 ?auto_1860153 ) ( not ( = ?auto_1860153 ?auto_1860154 ) ) ( not ( = ?auto_1860153 ?auto_1860155 ) ) ( TRUCK-AT ?auto_1860156 ?auto_1860158 ) ( not ( = ?auto_1860158 ?auto_1860160 ) ) ( HOIST-AT ?auto_1860159 ?auto_1860158 ) ( LIFTING ?auto_1860159 ?auto_1860155 ) ( not ( = ?auto_1860157 ?auto_1860159 ) ) ( ON ?auto_1860143 ?auto_1860142 ) ( ON ?auto_1860144 ?auto_1860143 ) ( ON ?auto_1860145 ?auto_1860144 ) ( ON ?auto_1860146 ?auto_1860145 ) ( ON ?auto_1860147 ?auto_1860146 ) ( ON ?auto_1860148 ?auto_1860147 ) ( ON ?auto_1860149 ?auto_1860148 ) ( ON ?auto_1860150 ?auto_1860149 ) ( ON ?auto_1860151 ?auto_1860150 ) ( ON ?auto_1860152 ?auto_1860151 ) ( ON ?auto_1860153 ?auto_1860152 ) ( not ( = ?auto_1860142 ?auto_1860143 ) ) ( not ( = ?auto_1860142 ?auto_1860144 ) ) ( not ( = ?auto_1860142 ?auto_1860145 ) ) ( not ( = ?auto_1860142 ?auto_1860146 ) ) ( not ( = ?auto_1860142 ?auto_1860147 ) ) ( not ( = ?auto_1860142 ?auto_1860148 ) ) ( not ( = ?auto_1860142 ?auto_1860149 ) ) ( not ( = ?auto_1860142 ?auto_1860150 ) ) ( not ( = ?auto_1860142 ?auto_1860151 ) ) ( not ( = ?auto_1860142 ?auto_1860152 ) ) ( not ( = ?auto_1860142 ?auto_1860153 ) ) ( not ( = ?auto_1860142 ?auto_1860154 ) ) ( not ( = ?auto_1860142 ?auto_1860155 ) ) ( not ( = ?auto_1860143 ?auto_1860144 ) ) ( not ( = ?auto_1860143 ?auto_1860145 ) ) ( not ( = ?auto_1860143 ?auto_1860146 ) ) ( not ( = ?auto_1860143 ?auto_1860147 ) ) ( not ( = ?auto_1860143 ?auto_1860148 ) ) ( not ( = ?auto_1860143 ?auto_1860149 ) ) ( not ( = ?auto_1860143 ?auto_1860150 ) ) ( not ( = ?auto_1860143 ?auto_1860151 ) ) ( not ( = ?auto_1860143 ?auto_1860152 ) ) ( not ( = ?auto_1860143 ?auto_1860153 ) ) ( not ( = ?auto_1860143 ?auto_1860154 ) ) ( not ( = ?auto_1860143 ?auto_1860155 ) ) ( not ( = ?auto_1860144 ?auto_1860145 ) ) ( not ( = ?auto_1860144 ?auto_1860146 ) ) ( not ( = ?auto_1860144 ?auto_1860147 ) ) ( not ( = ?auto_1860144 ?auto_1860148 ) ) ( not ( = ?auto_1860144 ?auto_1860149 ) ) ( not ( = ?auto_1860144 ?auto_1860150 ) ) ( not ( = ?auto_1860144 ?auto_1860151 ) ) ( not ( = ?auto_1860144 ?auto_1860152 ) ) ( not ( = ?auto_1860144 ?auto_1860153 ) ) ( not ( = ?auto_1860144 ?auto_1860154 ) ) ( not ( = ?auto_1860144 ?auto_1860155 ) ) ( not ( = ?auto_1860145 ?auto_1860146 ) ) ( not ( = ?auto_1860145 ?auto_1860147 ) ) ( not ( = ?auto_1860145 ?auto_1860148 ) ) ( not ( = ?auto_1860145 ?auto_1860149 ) ) ( not ( = ?auto_1860145 ?auto_1860150 ) ) ( not ( = ?auto_1860145 ?auto_1860151 ) ) ( not ( = ?auto_1860145 ?auto_1860152 ) ) ( not ( = ?auto_1860145 ?auto_1860153 ) ) ( not ( = ?auto_1860145 ?auto_1860154 ) ) ( not ( = ?auto_1860145 ?auto_1860155 ) ) ( not ( = ?auto_1860146 ?auto_1860147 ) ) ( not ( = ?auto_1860146 ?auto_1860148 ) ) ( not ( = ?auto_1860146 ?auto_1860149 ) ) ( not ( = ?auto_1860146 ?auto_1860150 ) ) ( not ( = ?auto_1860146 ?auto_1860151 ) ) ( not ( = ?auto_1860146 ?auto_1860152 ) ) ( not ( = ?auto_1860146 ?auto_1860153 ) ) ( not ( = ?auto_1860146 ?auto_1860154 ) ) ( not ( = ?auto_1860146 ?auto_1860155 ) ) ( not ( = ?auto_1860147 ?auto_1860148 ) ) ( not ( = ?auto_1860147 ?auto_1860149 ) ) ( not ( = ?auto_1860147 ?auto_1860150 ) ) ( not ( = ?auto_1860147 ?auto_1860151 ) ) ( not ( = ?auto_1860147 ?auto_1860152 ) ) ( not ( = ?auto_1860147 ?auto_1860153 ) ) ( not ( = ?auto_1860147 ?auto_1860154 ) ) ( not ( = ?auto_1860147 ?auto_1860155 ) ) ( not ( = ?auto_1860148 ?auto_1860149 ) ) ( not ( = ?auto_1860148 ?auto_1860150 ) ) ( not ( = ?auto_1860148 ?auto_1860151 ) ) ( not ( = ?auto_1860148 ?auto_1860152 ) ) ( not ( = ?auto_1860148 ?auto_1860153 ) ) ( not ( = ?auto_1860148 ?auto_1860154 ) ) ( not ( = ?auto_1860148 ?auto_1860155 ) ) ( not ( = ?auto_1860149 ?auto_1860150 ) ) ( not ( = ?auto_1860149 ?auto_1860151 ) ) ( not ( = ?auto_1860149 ?auto_1860152 ) ) ( not ( = ?auto_1860149 ?auto_1860153 ) ) ( not ( = ?auto_1860149 ?auto_1860154 ) ) ( not ( = ?auto_1860149 ?auto_1860155 ) ) ( not ( = ?auto_1860150 ?auto_1860151 ) ) ( not ( = ?auto_1860150 ?auto_1860152 ) ) ( not ( = ?auto_1860150 ?auto_1860153 ) ) ( not ( = ?auto_1860150 ?auto_1860154 ) ) ( not ( = ?auto_1860150 ?auto_1860155 ) ) ( not ( = ?auto_1860151 ?auto_1860152 ) ) ( not ( = ?auto_1860151 ?auto_1860153 ) ) ( not ( = ?auto_1860151 ?auto_1860154 ) ) ( not ( = ?auto_1860151 ?auto_1860155 ) ) ( not ( = ?auto_1860152 ?auto_1860153 ) ) ( not ( = ?auto_1860152 ?auto_1860154 ) ) ( not ( = ?auto_1860152 ?auto_1860155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860153 ?auto_1860154 ?auto_1860155 )
      ( MAKE-13CRATE-VERIFY ?auto_1860142 ?auto_1860143 ?auto_1860144 ?auto_1860145 ?auto_1860146 ?auto_1860147 ?auto_1860148 ?auto_1860149 ?auto_1860150 ?auto_1860151 ?auto_1860152 ?auto_1860153 ?auto_1860154 ?auto_1860155 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860324 - SURFACE
      ?auto_1860325 - SURFACE
      ?auto_1860326 - SURFACE
      ?auto_1860327 - SURFACE
      ?auto_1860328 - SURFACE
      ?auto_1860329 - SURFACE
      ?auto_1860330 - SURFACE
      ?auto_1860331 - SURFACE
      ?auto_1860332 - SURFACE
      ?auto_1860333 - SURFACE
      ?auto_1860334 - SURFACE
      ?auto_1860335 - SURFACE
      ?auto_1860336 - SURFACE
      ?auto_1860337 - SURFACE
    )
    :vars
    (
      ?auto_1860339 - HOIST
      ?auto_1860341 - PLACE
      ?auto_1860343 - TRUCK
      ?auto_1860338 - PLACE
      ?auto_1860342 - HOIST
      ?auto_1860340 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860339 ?auto_1860341 ) ( SURFACE-AT ?auto_1860336 ?auto_1860341 ) ( CLEAR ?auto_1860336 ) ( IS-CRATE ?auto_1860337 ) ( not ( = ?auto_1860336 ?auto_1860337 ) ) ( AVAILABLE ?auto_1860339 ) ( ON ?auto_1860336 ?auto_1860335 ) ( not ( = ?auto_1860335 ?auto_1860336 ) ) ( not ( = ?auto_1860335 ?auto_1860337 ) ) ( TRUCK-AT ?auto_1860343 ?auto_1860338 ) ( not ( = ?auto_1860338 ?auto_1860341 ) ) ( HOIST-AT ?auto_1860342 ?auto_1860338 ) ( not ( = ?auto_1860339 ?auto_1860342 ) ) ( AVAILABLE ?auto_1860342 ) ( SURFACE-AT ?auto_1860337 ?auto_1860338 ) ( ON ?auto_1860337 ?auto_1860340 ) ( CLEAR ?auto_1860337 ) ( not ( = ?auto_1860336 ?auto_1860340 ) ) ( not ( = ?auto_1860337 ?auto_1860340 ) ) ( not ( = ?auto_1860335 ?auto_1860340 ) ) ( ON ?auto_1860325 ?auto_1860324 ) ( ON ?auto_1860326 ?auto_1860325 ) ( ON ?auto_1860327 ?auto_1860326 ) ( ON ?auto_1860328 ?auto_1860327 ) ( ON ?auto_1860329 ?auto_1860328 ) ( ON ?auto_1860330 ?auto_1860329 ) ( ON ?auto_1860331 ?auto_1860330 ) ( ON ?auto_1860332 ?auto_1860331 ) ( ON ?auto_1860333 ?auto_1860332 ) ( ON ?auto_1860334 ?auto_1860333 ) ( ON ?auto_1860335 ?auto_1860334 ) ( not ( = ?auto_1860324 ?auto_1860325 ) ) ( not ( = ?auto_1860324 ?auto_1860326 ) ) ( not ( = ?auto_1860324 ?auto_1860327 ) ) ( not ( = ?auto_1860324 ?auto_1860328 ) ) ( not ( = ?auto_1860324 ?auto_1860329 ) ) ( not ( = ?auto_1860324 ?auto_1860330 ) ) ( not ( = ?auto_1860324 ?auto_1860331 ) ) ( not ( = ?auto_1860324 ?auto_1860332 ) ) ( not ( = ?auto_1860324 ?auto_1860333 ) ) ( not ( = ?auto_1860324 ?auto_1860334 ) ) ( not ( = ?auto_1860324 ?auto_1860335 ) ) ( not ( = ?auto_1860324 ?auto_1860336 ) ) ( not ( = ?auto_1860324 ?auto_1860337 ) ) ( not ( = ?auto_1860324 ?auto_1860340 ) ) ( not ( = ?auto_1860325 ?auto_1860326 ) ) ( not ( = ?auto_1860325 ?auto_1860327 ) ) ( not ( = ?auto_1860325 ?auto_1860328 ) ) ( not ( = ?auto_1860325 ?auto_1860329 ) ) ( not ( = ?auto_1860325 ?auto_1860330 ) ) ( not ( = ?auto_1860325 ?auto_1860331 ) ) ( not ( = ?auto_1860325 ?auto_1860332 ) ) ( not ( = ?auto_1860325 ?auto_1860333 ) ) ( not ( = ?auto_1860325 ?auto_1860334 ) ) ( not ( = ?auto_1860325 ?auto_1860335 ) ) ( not ( = ?auto_1860325 ?auto_1860336 ) ) ( not ( = ?auto_1860325 ?auto_1860337 ) ) ( not ( = ?auto_1860325 ?auto_1860340 ) ) ( not ( = ?auto_1860326 ?auto_1860327 ) ) ( not ( = ?auto_1860326 ?auto_1860328 ) ) ( not ( = ?auto_1860326 ?auto_1860329 ) ) ( not ( = ?auto_1860326 ?auto_1860330 ) ) ( not ( = ?auto_1860326 ?auto_1860331 ) ) ( not ( = ?auto_1860326 ?auto_1860332 ) ) ( not ( = ?auto_1860326 ?auto_1860333 ) ) ( not ( = ?auto_1860326 ?auto_1860334 ) ) ( not ( = ?auto_1860326 ?auto_1860335 ) ) ( not ( = ?auto_1860326 ?auto_1860336 ) ) ( not ( = ?auto_1860326 ?auto_1860337 ) ) ( not ( = ?auto_1860326 ?auto_1860340 ) ) ( not ( = ?auto_1860327 ?auto_1860328 ) ) ( not ( = ?auto_1860327 ?auto_1860329 ) ) ( not ( = ?auto_1860327 ?auto_1860330 ) ) ( not ( = ?auto_1860327 ?auto_1860331 ) ) ( not ( = ?auto_1860327 ?auto_1860332 ) ) ( not ( = ?auto_1860327 ?auto_1860333 ) ) ( not ( = ?auto_1860327 ?auto_1860334 ) ) ( not ( = ?auto_1860327 ?auto_1860335 ) ) ( not ( = ?auto_1860327 ?auto_1860336 ) ) ( not ( = ?auto_1860327 ?auto_1860337 ) ) ( not ( = ?auto_1860327 ?auto_1860340 ) ) ( not ( = ?auto_1860328 ?auto_1860329 ) ) ( not ( = ?auto_1860328 ?auto_1860330 ) ) ( not ( = ?auto_1860328 ?auto_1860331 ) ) ( not ( = ?auto_1860328 ?auto_1860332 ) ) ( not ( = ?auto_1860328 ?auto_1860333 ) ) ( not ( = ?auto_1860328 ?auto_1860334 ) ) ( not ( = ?auto_1860328 ?auto_1860335 ) ) ( not ( = ?auto_1860328 ?auto_1860336 ) ) ( not ( = ?auto_1860328 ?auto_1860337 ) ) ( not ( = ?auto_1860328 ?auto_1860340 ) ) ( not ( = ?auto_1860329 ?auto_1860330 ) ) ( not ( = ?auto_1860329 ?auto_1860331 ) ) ( not ( = ?auto_1860329 ?auto_1860332 ) ) ( not ( = ?auto_1860329 ?auto_1860333 ) ) ( not ( = ?auto_1860329 ?auto_1860334 ) ) ( not ( = ?auto_1860329 ?auto_1860335 ) ) ( not ( = ?auto_1860329 ?auto_1860336 ) ) ( not ( = ?auto_1860329 ?auto_1860337 ) ) ( not ( = ?auto_1860329 ?auto_1860340 ) ) ( not ( = ?auto_1860330 ?auto_1860331 ) ) ( not ( = ?auto_1860330 ?auto_1860332 ) ) ( not ( = ?auto_1860330 ?auto_1860333 ) ) ( not ( = ?auto_1860330 ?auto_1860334 ) ) ( not ( = ?auto_1860330 ?auto_1860335 ) ) ( not ( = ?auto_1860330 ?auto_1860336 ) ) ( not ( = ?auto_1860330 ?auto_1860337 ) ) ( not ( = ?auto_1860330 ?auto_1860340 ) ) ( not ( = ?auto_1860331 ?auto_1860332 ) ) ( not ( = ?auto_1860331 ?auto_1860333 ) ) ( not ( = ?auto_1860331 ?auto_1860334 ) ) ( not ( = ?auto_1860331 ?auto_1860335 ) ) ( not ( = ?auto_1860331 ?auto_1860336 ) ) ( not ( = ?auto_1860331 ?auto_1860337 ) ) ( not ( = ?auto_1860331 ?auto_1860340 ) ) ( not ( = ?auto_1860332 ?auto_1860333 ) ) ( not ( = ?auto_1860332 ?auto_1860334 ) ) ( not ( = ?auto_1860332 ?auto_1860335 ) ) ( not ( = ?auto_1860332 ?auto_1860336 ) ) ( not ( = ?auto_1860332 ?auto_1860337 ) ) ( not ( = ?auto_1860332 ?auto_1860340 ) ) ( not ( = ?auto_1860333 ?auto_1860334 ) ) ( not ( = ?auto_1860333 ?auto_1860335 ) ) ( not ( = ?auto_1860333 ?auto_1860336 ) ) ( not ( = ?auto_1860333 ?auto_1860337 ) ) ( not ( = ?auto_1860333 ?auto_1860340 ) ) ( not ( = ?auto_1860334 ?auto_1860335 ) ) ( not ( = ?auto_1860334 ?auto_1860336 ) ) ( not ( = ?auto_1860334 ?auto_1860337 ) ) ( not ( = ?auto_1860334 ?auto_1860340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860335 ?auto_1860336 ?auto_1860337 )
      ( MAKE-13CRATE-VERIFY ?auto_1860324 ?auto_1860325 ?auto_1860326 ?auto_1860327 ?auto_1860328 ?auto_1860329 ?auto_1860330 ?auto_1860331 ?auto_1860332 ?auto_1860333 ?auto_1860334 ?auto_1860335 ?auto_1860336 ?auto_1860337 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860507 - SURFACE
      ?auto_1860508 - SURFACE
      ?auto_1860509 - SURFACE
      ?auto_1860510 - SURFACE
      ?auto_1860511 - SURFACE
      ?auto_1860512 - SURFACE
      ?auto_1860513 - SURFACE
      ?auto_1860514 - SURFACE
      ?auto_1860515 - SURFACE
      ?auto_1860516 - SURFACE
      ?auto_1860517 - SURFACE
      ?auto_1860518 - SURFACE
      ?auto_1860519 - SURFACE
      ?auto_1860520 - SURFACE
    )
    :vars
    (
      ?auto_1860521 - HOIST
      ?auto_1860522 - PLACE
      ?auto_1860524 - PLACE
      ?auto_1860525 - HOIST
      ?auto_1860523 - SURFACE
      ?auto_1860526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860521 ?auto_1860522 ) ( SURFACE-AT ?auto_1860519 ?auto_1860522 ) ( CLEAR ?auto_1860519 ) ( IS-CRATE ?auto_1860520 ) ( not ( = ?auto_1860519 ?auto_1860520 ) ) ( AVAILABLE ?auto_1860521 ) ( ON ?auto_1860519 ?auto_1860518 ) ( not ( = ?auto_1860518 ?auto_1860519 ) ) ( not ( = ?auto_1860518 ?auto_1860520 ) ) ( not ( = ?auto_1860524 ?auto_1860522 ) ) ( HOIST-AT ?auto_1860525 ?auto_1860524 ) ( not ( = ?auto_1860521 ?auto_1860525 ) ) ( AVAILABLE ?auto_1860525 ) ( SURFACE-AT ?auto_1860520 ?auto_1860524 ) ( ON ?auto_1860520 ?auto_1860523 ) ( CLEAR ?auto_1860520 ) ( not ( = ?auto_1860519 ?auto_1860523 ) ) ( not ( = ?auto_1860520 ?auto_1860523 ) ) ( not ( = ?auto_1860518 ?auto_1860523 ) ) ( TRUCK-AT ?auto_1860526 ?auto_1860522 ) ( ON ?auto_1860508 ?auto_1860507 ) ( ON ?auto_1860509 ?auto_1860508 ) ( ON ?auto_1860510 ?auto_1860509 ) ( ON ?auto_1860511 ?auto_1860510 ) ( ON ?auto_1860512 ?auto_1860511 ) ( ON ?auto_1860513 ?auto_1860512 ) ( ON ?auto_1860514 ?auto_1860513 ) ( ON ?auto_1860515 ?auto_1860514 ) ( ON ?auto_1860516 ?auto_1860515 ) ( ON ?auto_1860517 ?auto_1860516 ) ( ON ?auto_1860518 ?auto_1860517 ) ( not ( = ?auto_1860507 ?auto_1860508 ) ) ( not ( = ?auto_1860507 ?auto_1860509 ) ) ( not ( = ?auto_1860507 ?auto_1860510 ) ) ( not ( = ?auto_1860507 ?auto_1860511 ) ) ( not ( = ?auto_1860507 ?auto_1860512 ) ) ( not ( = ?auto_1860507 ?auto_1860513 ) ) ( not ( = ?auto_1860507 ?auto_1860514 ) ) ( not ( = ?auto_1860507 ?auto_1860515 ) ) ( not ( = ?auto_1860507 ?auto_1860516 ) ) ( not ( = ?auto_1860507 ?auto_1860517 ) ) ( not ( = ?auto_1860507 ?auto_1860518 ) ) ( not ( = ?auto_1860507 ?auto_1860519 ) ) ( not ( = ?auto_1860507 ?auto_1860520 ) ) ( not ( = ?auto_1860507 ?auto_1860523 ) ) ( not ( = ?auto_1860508 ?auto_1860509 ) ) ( not ( = ?auto_1860508 ?auto_1860510 ) ) ( not ( = ?auto_1860508 ?auto_1860511 ) ) ( not ( = ?auto_1860508 ?auto_1860512 ) ) ( not ( = ?auto_1860508 ?auto_1860513 ) ) ( not ( = ?auto_1860508 ?auto_1860514 ) ) ( not ( = ?auto_1860508 ?auto_1860515 ) ) ( not ( = ?auto_1860508 ?auto_1860516 ) ) ( not ( = ?auto_1860508 ?auto_1860517 ) ) ( not ( = ?auto_1860508 ?auto_1860518 ) ) ( not ( = ?auto_1860508 ?auto_1860519 ) ) ( not ( = ?auto_1860508 ?auto_1860520 ) ) ( not ( = ?auto_1860508 ?auto_1860523 ) ) ( not ( = ?auto_1860509 ?auto_1860510 ) ) ( not ( = ?auto_1860509 ?auto_1860511 ) ) ( not ( = ?auto_1860509 ?auto_1860512 ) ) ( not ( = ?auto_1860509 ?auto_1860513 ) ) ( not ( = ?auto_1860509 ?auto_1860514 ) ) ( not ( = ?auto_1860509 ?auto_1860515 ) ) ( not ( = ?auto_1860509 ?auto_1860516 ) ) ( not ( = ?auto_1860509 ?auto_1860517 ) ) ( not ( = ?auto_1860509 ?auto_1860518 ) ) ( not ( = ?auto_1860509 ?auto_1860519 ) ) ( not ( = ?auto_1860509 ?auto_1860520 ) ) ( not ( = ?auto_1860509 ?auto_1860523 ) ) ( not ( = ?auto_1860510 ?auto_1860511 ) ) ( not ( = ?auto_1860510 ?auto_1860512 ) ) ( not ( = ?auto_1860510 ?auto_1860513 ) ) ( not ( = ?auto_1860510 ?auto_1860514 ) ) ( not ( = ?auto_1860510 ?auto_1860515 ) ) ( not ( = ?auto_1860510 ?auto_1860516 ) ) ( not ( = ?auto_1860510 ?auto_1860517 ) ) ( not ( = ?auto_1860510 ?auto_1860518 ) ) ( not ( = ?auto_1860510 ?auto_1860519 ) ) ( not ( = ?auto_1860510 ?auto_1860520 ) ) ( not ( = ?auto_1860510 ?auto_1860523 ) ) ( not ( = ?auto_1860511 ?auto_1860512 ) ) ( not ( = ?auto_1860511 ?auto_1860513 ) ) ( not ( = ?auto_1860511 ?auto_1860514 ) ) ( not ( = ?auto_1860511 ?auto_1860515 ) ) ( not ( = ?auto_1860511 ?auto_1860516 ) ) ( not ( = ?auto_1860511 ?auto_1860517 ) ) ( not ( = ?auto_1860511 ?auto_1860518 ) ) ( not ( = ?auto_1860511 ?auto_1860519 ) ) ( not ( = ?auto_1860511 ?auto_1860520 ) ) ( not ( = ?auto_1860511 ?auto_1860523 ) ) ( not ( = ?auto_1860512 ?auto_1860513 ) ) ( not ( = ?auto_1860512 ?auto_1860514 ) ) ( not ( = ?auto_1860512 ?auto_1860515 ) ) ( not ( = ?auto_1860512 ?auto_1860516 ) ) ( not ( = ?auto_1860512 ?auto_1860517 ) ) ( not ( = ?auto_1860512 ?auto_1860518 ) ) ( not ( = ?auto_1860512 ?auto_1860519 ) ) ( not ( = ?auto_1860512 ?auto_1860520 ) ) ( not ( = ?auto_1860512 ?auto_1860523 ) ) ( not ( = ?auto_1860513 ?auto_1860514 ) ) ( not ( = ?auto_1860513 ?auto_1860515 ) ) ( not ( = ?auto_1860513 ?auto_1860516 ) ) ( not ( = ?auto_1860513 ?auto_1860517 ) ) ( not ( = ?auto_1860513 ?auto_1860518 ) ) ( not ( = ?auto_1860513 ?auto_1860519 ) ) ( not ( = ?auto_1860513 ?auto_1860520 ) ) ( not ( = ?auto_1860513 ?auto_1860523 ) ) ( not ( = ?auto_1860514 ?auto_1860515 ) ) ( not ( = ?auto_1860514 ?auto_1860516 ) ) ( not ( = ?auto_1860514 ?auto_1860517 ) ) ( not ( = ?auto_1860514 ?auto_1860518 ) ) ( not ( = ?auto_1860514 ?auto_1860519 ) ) ( not ( = ?auto_1860514 ?auto_1860520 ) ) ( not ( = ?auto_1860514 ?auto_1860523 ) ) ( not ( = ?auto_1860515 ?auto_1860516 ) ) ( not ( = ?auto_1860515 ?auto_1860517 ) ) ( not ( = ?auto_1860515 ?auto_1860518 ) ) ( not ( = ?auto_1860515 ?auto_1860519 ) ) ( not ( = ?auto_1860515 ?auto_1860520 ) ) ( not ( = ?auto_1860515 ?auto_1860523 ) ) ( not ( = ?auto_1860516 ?auto_1860517 ) ) ( not ( = ?auto_1860516 ?auto_1860518 ) ) ( not ( = ?auto_1860516 ?auto_1860519 ) ) ( not ( = ?auto_1860516 ?auto_1860520 ) ) ( not ( = ?auto_1860516 ?auto_1860523 ) ) ( not ( = ?auto_1860517 ?auto_1860518 ) ) ( not ( = ?auto_1860517 ?auto_1860519 ) ) ( not ( = ?auto_1860517 ?auto_1860520 ) ) ( not ( = ?auto_1860517 ?auto_1860523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860518 ?auto_1860519 ?auto_1860520 )
      ( MAKE-13CRATE-VERIFY ?auto_1860507 ?auto_1860508 ?auto_1860509 ?auto_1860510 ?auto_1860511 ?auto_1860512 ?auto_1860513 ?auto_1860514 ?auto_1860515 ?auto_1860516 ?auto_1860517 ?auto_1860518 ?auto_1860519 ?auto_1860520 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860690 - SURFACE
      ?auto_1860691 - SURFACE
      ?auto_1860692 - SURFACE
      ?auto_1860693 - SURFACE
      ?auto_1860694 - SURFACE
      ?auto_1860695 - SURFACE
      ?auto_1860696 - SURFACE
      ?auto_1860697 - SURFACE
      ?auto_1860698 - SURFACE
      ?auto_1860699 - SURFACE
      ?auto_1860700 - SURFACE
      ?auto_1860701 - SURFACE
      ?auto_1860702 - SURFACE
      ?auto_1860703 - SURFACE
    )
    :vars
    (
      ?auto_1860709 - HOIST
      ?auto_1860705 - PLACE
      ?auto_1860706 - PLACE
      ?auto_1860707 - HOIST
      ?auto_1860708 - SURFACE
      ?auto_1860704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860709 ?auto_1860705 ) ( IS-CRATE ?auto_1860703 ) ( not ( = ?auto_1860702 ?auto_1860703 ) ) ( not ( = ?auto_1860701 ?auto_1860702 ) ) ( not ( = ?auto_1860701 ?auto_1860703 ) ) ( not ( = ?auto_1860706 ?auto_1860705 ) ) ( HOIST-AT ?auto_1860707 ?auto_1860706 ) ( not ( = ?auto_1860709 ?auto_1860707 ) ) ( AVAILABLE ?auto_1860707 ) ( SURFACE-AT ?auto_1860703 ?auto_1860706 ) ( ON ?auto_1860703 ?auto_1860708 ) ( CLEAR ?auto_1860703 ) ( not ( = ?auto_1860702 ?auto_1860708 ) ) ( not ( = ?auto_1860703 ?auto_1860708 ) ) ( not ( = ?auto_1860701 ?auto_1860708 ) ) ( TRUCK-AT ?auto_1860704 ?auto_1860705 ) ( SURFACE-AT ?auto_1860701 ?auto_1860705 ) ( CLEAR ?auto_1860701 ) ( LIFTING ?auto_1860709 ?auto_1860702 ) ( IS-CRATE ?auto_1860702 ) ( ON ?auto_1860691 ?auto_1860690 ) ( ON ?auto_1860692 ?auto_1860691 ) ( ON ?auto_1860693 ?auto_1860692 ) ( ON ?auto_1860694 ?auto_1860693 ) ( ON ?auto_1860695 ?auto_1860694 ) ( ON ?auto_1860696 ?auto_1860695 ) ( ON ?auto_1860697 ?auto_1860696 ) ( ON ?auto_1860698 ?auto_1860697 ) ( ON ?auto_1860699 ?auto_1860698 ) ( ON ?auto_1860700 ?auto_1860699 ) ( ON ?auto_1860701 ?auto_1860700 ) ( not ( = ?auto_1860690 ?auto_1860691 ) ) ( not ( = ?auto_1860690 ?auto_1860692 ) ) ( not ( = ?auto_1860690 ?auto_1860693 ) ) ( not ( = ?auto_1860690 ?auto_1860694 ) ) ( not ( = ?auto_1860690 ?auto_1860695 ) ) ( not ( = ?auto_1860690 ?auto_1860696 ) ) ( not ( = ?auto_1860690 ?auto_1860697 ) ) ( not ( = ?auto_1860690 ?auto_1860698 ) ) ( not ( = ?auto_1860690 ?auto_1860699 ) ) ( not ( = ?auto_1860690 ?auto_1860700 ) ) ( not ( = ?auto_1860690 ?auto_1860701 ) ) ( not ( = ?auto_1860690 ?auto_1860702 ) ) ( not ( = ?auto_1860690 ?auto_1860703 ) ) ( not ( = ?auto_1860690 ?auto_1860708 ) ) ( not ( = ?auto_1860691 ?auto_1860692 ) ) ( not ( = ?auto_1860691 ?auto_1860693 ) ) ( not ( = ?auto_1860691 ?auto_1860694 ) ) ( not ( = ?auto_1860691 ?auto_1860695 ) ) ( not ( = ?auto_1860691 ?auto_1860696 ) ) ( not ( = ?auto_1860691 ?auto_1860697 ) ) ( not ( = ?auto_1860691 ?auto_1860698 ) ) ( not ( = ?auto_1860691 ?auto_1860699 ) ) ( not ( = ?auto_1860691 ?auto_1860700 ) ) ( not ( = ?auto_1860691 ?auto_1860701 ) ) ( not ( = ?auto_1860691 ?auto_1860702 ) ) ( not ( = ?auto_1860691 ?auto_1860703 ) ) ( not ( = ?auto_1860691 ?auto_1860708 ) ) ( not ( = ?auto_1860692 ?auto_1860693 ) ) ( not ( = ?auto_1860692 ?auto_1860694 ) ) ( not ( = ?auto_1860692 ?auto_1860695 ) ) ( not ( = ?auto_1860692 ?auto_1860696 ) ) ( not ( = ?auto_1860692 ?auto_1860697 ) ) ( not ( = ?auto_1860692 ?auto_1860698 ) ) ( not ( = ?auto_1860692 ?auto_1860699 ) ) ( not ( = ?auto_1860692 ?auto_1860700 ) ) ( not ( = ?auto_1860692 ?auto_1860701 ) ) ( not ( = ?auto_1860692 ?auto_1860702 ) ) ( not ( = ?auto_1860692 ?auto_1860703 ) ) ( not ( = ?auto_1860692 ?auto_1860708 ) ) ( not ( = ?auto_1860693 ?auto_1860694 ) ) ( not ( = ?auto_1860693 ?auto_1860695 ) ) ( not ( = ?auto_1860693 ?auto_1860696 ) ) ( not ( = ?auto_1860693 ?auto_1860697 ) ) ( not ( = ?auto_1860693 ?auto_1860698 ) ) ( not ( = ?auto_1860693 ?auto_1860699 ) ) ( not ( = ?auto_1860693 ?auto_1860700 ) ) ( not ( = ?auto_1860693 ?auto_1860701 ) ) ( not ( = ?auto_1860693 ?auto_1860702 ) ) ( not ( = ?auto_1860693 ?auto_1860703 ) ) ( not ( = ?auto_1860693 ?auto_1860708 ) ) ( not ( = ?auto_1860694 ?auto_1860695 ) ) ( not ( = ?auto_1860694 ?auto_1860696 ) ) ( not ( = ?auto_1860694 ?auto_1860697 ) ) ( not ( = ?auto_1860694 ?auto_1860698 ) ) ( not ( = ?auto_1860694 ?auto_1860699 ) ) ( not ( = ?auto_1860694 ?auto_1860700 ) ) ( not ( = ?auto_1860694 ?auto_1860701 ) ) ( not ( = ?auto_1860694 ?auto_1860702 ) ) ( not ( = ?auto_1860694 ?auto_1860703 ) ) ( not ( = ?auto_1860694 ?auto_1860708 ) ) ( not ( = ?auto_1860695 ?auto_1860696 ) ) ( not ( = ?auto_1860695 ?auto_1860697 ) ) ( not ( = ?auto_1860695 ?auto_1860698 ) ) ( not ( = ?auto_1860695 ?auto_1860699 ) ) ( not ( = ?auto_1860695 ?auto_1860700 ) ) ( not ( = ?auto_1860695 ?auto_1860701 ) ) ( not ( = ?auto_1860695 ?auto_1860702 ) ) ( not ( = ?auto_1860695 ?auto_1860703 ) ) ( not ( = ?auto_1860695 ?auto_1860708 ) ) ( not ( = ?auto_1860696 ?auto_1860697 ) ) ( not ( = ?auto_1860696 ?auto_1860698 ) ) ( not ( = ?auto_1860696 ?auto_1860699 ) ) ( not ( = ?auto_1860696 ?auto_1860700 ) ) ( not ( = ?auto_1860696 ?auto_1860701 ) ) ( not ( = ?auto_1860696 ?auto_1860702 ) ) ( not ( = ?auto_1860696 ?auto_1860703 ) ) ( not ( = ?auto_1860696 ?auto_1860708 ) ) ( not ( = ?auto_1860697 ?auto_1860698 ) ) ( not ( = ?auto_1860697 ?auto_1860699 ) ) ( not ( = ?auto_1860697 ?auto_1860700 ) ) ( not ( = ?auto_1860697 ?auto_1860701 ) ) ( not ( = ?auto_1860697 ?auto_1860702 ) ) ( not ( = ?auto_1860697 ?auto_1860703 ) ) ( not ( = ?auto_1860697 ?auto_1860708 ) ) ( not ( = ?auto_1860698 ?auto_1860699 ) ) ( not ( = ?auto_1860698 ?auto_1860700 ) ) ( not ( = ?auto_1860698 ?auto_1860701 ) ) ( not ( = ?auto_1860698 ?auto_1860702 ) ) ( not ( = ?auto_1860698 ?auto_1860703 ) ) ( not ( = ?auto_1860698 ?auto_1860708 ) ) ( not ( = ?auto_1860699 ?auto_1860700 ) ) ( not ( = ?auto_1860699 ?auto_1860701 ) ) ( not ( = ?auto_1860699 ?auto_1860702 ) ) ( not ( = ?auto_1860699 ?auto_1860703 ) ) ( not ( = ?auto_1860699 ?auto_1860708 ) ) ( not ( = ?auto_1860700 ?auto_1860701 ) ) ( not ( = ?auto_1860700 ?auto_1860702 ) ) ( not ( = ?auto_1860700 ?auto_1860703 ) ) ( not ( = ?auto_1860700 ?auto_1860708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860701 ?auto_1860702 ?auto_1860703 )
      ( MAKE-13CRATE-VERIFY ?auto_1860690 ?auto_1860691 ?auto_1860692 ?auto_1860693 ?auto_1860694 ?auto_1860695 ?auto_1860696 ?auto_1860697 ?auto_1860698 ?auto_1860699 ?auto_1860700 ?auto_1860701 ?auto_1860702 ?auto_1860703 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860873 - SURFACE
      ?auto_1860874 - SURFACE
      ?auto_1860875 - SURFACE
      ?auto_1860876 - SURFACE
      ?auto_1860877 - SURFACE
      ?auto_1860878 - SURFACE
      ?auto_1860879 - SURFACE
      ?auto_1860880 - SURFACE
      ?auto_1860881 - SURFACE
      ?auto_1860882 - SURFACE
      ?auto_1860883 - SURFACE
      ?auto_1860884 - SURFACE
      ?auto_1860885 - SURFACE
      ?auto_1860886 - SURFACE
    )
    :vars
    (
      ?auto_1860892 - HOIST
      ?auto_1860889 - PLACE
      ?auto_1860890 - PLACE
      ?auto_1860888 - HOIST
      ?auto_1860891 - SURFACE
      ?auto_1860887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860892 ?auto_1860889 ) ( IS-CRATE ?auto_1860886 ) ( not ( = ?auto_1860885 ?auto_1860886 ) ) ( not ( = ?auto_1860884 ?auto_1860885 ) ) ( not ( = ?auto_1860884 ?auto_1860886 ) ) ( not ( = ?auto_1860890 ?auto_1860889 ) ) ( HOIST-AT ?auto_1860888 ?auto_1860890 ) ( not ( = ?auto_1860892 ?auto_1860888 ) ) ( AVAILABLE ?auto_1860888 ) ( SURFACE-AT ?auto_1860886 ?auto_1860890 ) ( ON ?auto_1860886 ?auto_1860891 ) ( CLEAR ?auto_1860886 ) ( not ( = ?auto_1860885 ?auto_1860891 ) ) ( not ( = ?auto_1860886 ?auto_1860891 ) ) ( not ( = ?auto_1860884 ?auto_1860891 ) ) ( TRUCK-AT ?auto_1860887 ?auto_1860889 ) ( SURFACE-AT ?auto_1860884 ?auto_1860889 ) ( CLEAR ?auto_1860884 ) ( IS-CRATE ?auto_1860885 ) ( AVAILABLE ?auto_1860892 ) ( IN ?auto_1860885 ?auto_1860887 ) ( ON ?auto_1860874 ?auto_1860873 ) ( ON ?auto_1860875 ?auto_1860874 ) ( ON ?auto_1860876 ?auto_1860875 ) ( ON ?auto_1860877 ?auto_1860876 ) ( ON ?auto_1860878 ?auto_1860877 ) ( ON ?auto_1860879 ?auto_1860878 ) ( ON ?auto_1860880 ?auto_1860879 ) ( ON ?auto_1860881 ?auto_1860880 ) ( ON ?auto_1860882 ?auto_1860881 ) ( ON ?auto_1860883 ?auto_1860882 ) ( ON ?auto_1860884 ?auto_1860883 ) ( not ( = ?auto_1860873 ?auto_1860874 ) ) ( not ( = ?auto_1860873 ?auto_1860875 ) ) ( not ( = ?auto_1860873 ?auto_1860876 ) ) ( not ( = ?auto_1860873 ?auto_1860877 ) ) ( not ( = ?auto_1860873 ?auto_1860878 ) ) ( not ( = ?auto_1860873 ?auto_1860879 ) ) ( not ( = ?auto_1860873 ?auto_1860880 ) ) ( not ( = ?auto_1860873 ?auto_1860881 ) ) ( not ( = ?auto_1860873 ?auto_1860882 ) ) ( not ( = ?auto_1860873 ?auto_1860883 ) ) ( not ( = ?auto_1860873 ?auto_1860884 ) ) ( not ( = ?auto_1860873 ?auto_1860885 ) ) ( not ( = ?auto_1860873 ?auto_1860886 ) ) ( not ( = ?auto_1860873 ?auto_1860891 ) ) ( not ( = ?auto_1860874 ?auto_1860875 ) ) ( not ( = ?auto_1860874 ?auto_1860876 ) ) ( not ( = ?auto_1860874 ?auto_1860877 ) ) ( not ( = ?auto_1860874 ?auto_1860878 ) ) ( not ( = ?auto_1860874 ?auto_1860879 ) ) ( not ( = ?auto_1860874 ?auto_1860880 ) ) ( not ( = ?auto_1860874 ?auto_1860881 ) ) ( not ( = ?auto_1860874 ?auto_1860882 ) ) ( not ( = ?auto_1860874 ?auto_1860883 ) ) ( not ( = ?auto_1860874 ?auto_1860884 ) ) ( not ( = ?auto_1860874 ?auto_1860885 ) ) ( not ( = ?auto_1860874 ?auto_1860886 ) ) ( not ( = ?auto_1860874 ?auto_1860891 ) ) ( not ( = ?auto_1860875 ?auto_1860876 ) ) ( not ( = ?auto_1860875 ?auto_1860877 ) ) ( not ( = ?auto_1860875 ?auto_1860878 ) ) ( not ( = ?auto_1860875 ?auto_1860879 ) ) ( not ( = ?auto_1860875 ?auto_1860880 ) ) ( not ( = ?auto_1860875 ?auto_1860881 ) ) ( not ( = ?auto_1860875 ?auto_1860882 ) ) ( not ( = ?auto_1860875 ?auto_1860883 ) ) ( not ( = ?auto_1860875 ?auto_1860884 ) ) ( not ( = ?auto_1860875 ?auto_1860885 ) ) ( not ( = ?auto_1860875 ?auto_1860886 ) ) ( not ( = ?auto_1860875 ?auto_1860891 ) ) ( not ( = ?auto_1860876 ?auto_1860877 ) ) ( not ( = ?auto_1860876 ?auto_1860878 ) ) ( not ( = ?auto_1860876 ?auto_1860879 ) ) ( not ( = ?auto_1860876 ?auto_1860880 ) ) ( not ( = ?auto_1860876 ?auto_1860881 ) ) ( not ( = ?auto_1860876 ?auto_1860882 ) ) ( not ( = ?auto_1860876 ?auto_1860883 ) ) ( not ( = ?auto_1860876 ?auto_1860884 ) ) ( not ( = ?auto_1860876 ?auto_1860885 ) ) ( not ( = ?auto_1860876 ?auto_1860886 ) ) ( not ( = ?auto_1860876 ?auto_1860891 ) ) ( not ( = ?auto_1860877 ?auto_1860878 ) ) ( not ( = ?auto_1860877 ?auto_1860879 ) ) ( not ( = ?auto_1860877 ?auto_1860880 ) ) ( not ( = ?auto_1860877 ?auto_1860881 ) ) ( not ( = ?auto_1860877 ?auto_1860882 ) ) ( not ( = ?auto_1860877 ?auto_1860883 ) ) ( not ( = ?auto_1860877 ?auto_1860884 ) ) ( not ( = ?auto_1860877 ?auto_1860885 ) ) ( not ( = ?auto_1860877 ?auto_1860886 ) ) ( not ( = ?auto_1860877 ?auto_1860891 ) ) ( not ( = ?auto_1860878 ?auto_1860879 ) ) ( not ( = ?auto_1860878 ?auto_1860880 ) ) ( not ( = ?auto_1860878 ?auto_1860881 ) ) ( not ( = ?auto_1860878 ?auto_1860882 ) ) ( not ( = ?auto_1860878 ?auto_1860883 ) ) ( not ( = ?auto_1860878 ?auto_1860884 ) ) ( not ( = ?auto_1860878 ?auto_1860885 ) ) ( not ( = ?auto_1860878 ?auto_1860886 ) ) ( not ( = ?auto_1860878 ?auto_1860891 ) ) ( not ( = ?auto_1860879 ?auto_1860880 ) ) ( not ( = ?auto_1860879 ?auto_1860881 ) ) ( not ( = ?auto_1860879 ?auto_1860882 ) ) ( not ( = ?auto_1860879 ?auto_1860883 ) ) ( not ( = ?auto_1860879 ?auto_1860884 ) ) ( not ( = ?auto_1860879 ?auto_1860885 ) ) ( not ( = ?auto_1860879 ?auto_1860886 ) ) ( not ( = ?auto_1860879 ?auto_1860891 ) ) ( not ( = ?auto_1860880 ?auto_1860881 ) ) ( not ( = ?auto_1860880 ?auto_1860882 ) ) ( not ( = ?auto_1860880 ?auto_1860883 ) ) ( not ( = ?auto_1860880 ?auto_1860884 ) ) ( not ( = ?auto_1860880 ?auto_1860885 ) ) ( not ( = ?auto_1860880 ?auto_1860886 ) ) ( not ( = ?auto_1860880 ?auto_1860891 ) ) ( not ( = ?auto_1860881 ?auto_1860882 ) ) ( not ( = ?auto_1860881 ?auto_1860883 ) ) ( not ( = ?auto_1860881 ?auto_1860884 ) ) ( not ( = ?auto_1860881 ?auto_1860885 ) ) ( not ( = ?auto_1860881 ?auto_1860886 ) ) ( not ( = ?auto_1860881 ?auto_1860891 ) ) ( not ( = ?auto_1860882 ?auto_1860883 ) ) ( not ( = ?auto_1860882 ?auto_1860884 ) ) ( not ( = ?auto_1860882 ?auto_1860885 ) ) ( not ( = ?auto_1860882 ?auto_1860886 ) ) ( not ( = ?auto_1860882 ?auto_1860891 ) ) ( not ( = ?auto_1860883 ?auto_1860884 ) ) ( not ( = ?auto_1860883 ?auto_1860885 ) ) ( not ( = ?auto_1860883 ?auto_1860886 ) ) ( not ( = ?auto_1860883 ?auto_1860891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860884 ?auto_1860885 ?auto_1860886 )
      ( MAKE-13CRATE-VERIFY ?auto_1860873 ?auto_1860874 ?auto_1860875 ?auto_1860876 ?auto_1860877 ?auto_1860878 ?auto_1860879 ?auto_1860880 ?auto_1860881 ?auto_1860882 ?auto_1860883 ?auto_1860884 ?auto_1860885 ?auto_1860886 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875058 - SURFACE
      ?auto_1875059 - SURFACE
      ?auto_1875060 - SURFACE
      ?auto_1875061 - SURFACE
      ?auto_1875062 - SURFACE
      ?auto_1875063 - SURFACE
      ?auto_1875064 - SURFACE
      ?auto_1875065 - SURFACE
      ?auto_1875066 - SURFACE
      ?auto_1875067 - SURFACE
      ?auto_1875068 - SURFACE
      ?auto_1875069 - SURFACE
      ?auto_1875070 - SURFACE
      ?auto_1875071 - SURFACE
      ?auto_1875072 - SURFACE
    )
    :vars
    (
      ?auto_1875073 - HOIST
      ?auto_1875074 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875073 ?auto_1875074 ) ( SURFACE-AT ?auto_1875071 ?auto_1875074 ) ( CLEAR ?auto_1875071 ) ( LIFTING ?auto_1875073 ?auto_1875072 ) ( IS-CRATE ?auto_1875072 ) ( not ( = ?auto_1875071 ?auto_1875072 ) ) ( ON ?auto_1875059 ?auto_1875058 ) ( ON ?auto_1875060 ?auto_1875059 ) ( ON ?auto_1875061 ?auto_1875060 ) ( ON ?auto_1875062 ?auto_1875061 ) ( ON ?auto_1875063 ?auto_1875062 ) ( ON ?auto_1875064 ?auto_1875063 ) ( ON ?auto_1875065 ?auto_1875064 ) ( ON ?auto_1875066 ?auto_1875065 ) ( ON ?auto_1875067 ?auto_1875066 ) ( ON ?auto_1875068 ?auto_1875067 ) ( ON ?auto_1875069 ?auto_1875068 ) ( ON ?auto_1875070 ?auto_1875069 ) ( ON ?auto_1875071 ?auto_1875070 ) ( not ( = ?auto_1875058 ?auto_1875059 ) ) ( not ( = ?auto_1875058 ?auto_1875060 ) ) ( not ( = ?auto_1875058 ?auto_1875061 ) ) ( not ( = ?auto_1875058 ?auto_1875062 ) ) ( not ( = ?auto_1875058 ?auto_1875063 ) ) ( not ( = ?auto_1875058 ?auto_1875064 ) ) ( not ( = ?auto_1875058 ?auto_1875065 ) ) ( not ( = ?auto_1875058 ?auto_1875066 ) ) ( not ( = ?auto_1875058 ?auto_1875067 ) ) ( not ( = ?auto_1875058 ?auto_1875068 ) ) ( not ( = ?auto_1875058 ?auto_1875069 ) ) ( not ( = ?auto_1875058 ?auto_1875070 ) ) ( not ( = ?auto_1875058 ?auto_1875071 ) ) ( not ( = ?auto_1875058 ?auto_1875072 ) ) ( not ( = ?auto_1875059 ?auto_1875060 ) ) ( not ( = ?auto_1875059 ?auto_1875061 ) ) ( not ( = ?auto_1875059 ?auto_1875062 ) ) ( not ( = ?auto_1875059 ?auto_1875063 ) ) ( not ( = ?auto_1875059 ?auto_1875064 ) ) ( not ( = ?auto_1875059 ?auto_1875065 ) ) ( not ( = ?auto_1875059 ?auto_1875066 ) ) ( not ( = ?auto_1875059 ?auto_1875067 ) ) ( not ( = ?auto_1875059 ?auto_1875068 ) ) ( not ( = ?auto_1875059 ?auto_1875069 ) ) ( not ( = ?auto_1875059 ?auto_1875070 ) ) ( not ( = ?auto_1875059 ?auto_1875071 ) ) ( not ( = ?auto_1875059 ?auto_1875072 ) ) ( not ( = ?auto_1875060 ?auto_1875061 ) ) ( not ( = ?auto_1875060 ?auto_1875062 ) ) ( not ( = ?auto_1875060 ?auto_1875063 ) ) ( not ( = ?auto_1875060 ?auto_1875064 ) ) ( not ( = ?auto_1875060 ?auto_1875065 ) ) ( not ( = ?auto_1875060 ?auto_1875066 ) ) ( not ( = ?auto_1875060 ?auto_1875067 ) ) ( not ( = ?auto_1875060 ?auto_1875068 ) ) ( not ( = ?auto_1875060 ?auto_1875069 ) ) ( not ( = ?auto_1875060 ?auto_1875070 ) ) ( not ( = ?auto_1875060 ?auto_1875071 ) ) ( not ( = ?auto_1875060 ?auto_1875072 ) ) ( not ( = ?auto_1875061 ?auto_1875062 ) ) ( not ( = ?auto_1875061 ?auto_1875063 ) ) ( not ( = ?auto_1875061 ?auto_1875064 ) ) ( not ( = ?auto_1875061 ?auto_1875065 ) ) ( not ( = ?auto_1875061 ?auto_1875066 ) ) ( not ( = ?auto_1875061 ?auto_1875067 ) ) ( not ( = ?auto_1875061 ?auto_1875068 ) ) ( not ( = ?auto_1875061 ?auto_1875069 ) ) ( not ( = ?auto_1875061 ?auto_1875070 ) ) ( not ( = ?auto_1875061 ?auto_1875071 ) ) ( not ( = ?auto_1875061 ?auto_1875072 ) ) ( not ( = ?auto_1875062 ?auto_1875063 ) ) ( not ( = ?auto_1875062 ?auto_1875064 ) ) ( not ( = ?auto_1875062 ?auto_1875065 ) ) ( not ( = ?auto_1875062 ?auto_1875066 ) ) ( not ( = ?auto_1875062 ?auto_1875067 ) ) ( not ( = ?auto_1875062 ?auto_1875068 ) ) ( not ( = ?auto_1875062 ?auto_1875069 ) ) ( not ( = ?auto_1875062 ?auto_1875070 ) ) ( not ( = ?auto_1875062 ?auto_1875071 ) ) ( not ( = ?auto_1875062 ?auto_1875072 ) ) ( not ( = ?auto_1875063 ?auto_1875064 ) ) ( not ( = ?auto_1875063 ?auto_1875065 ) ) ( not ( = ?auto_1875063 ?auto_1875066 ) ) ( not ( = ?auto_1875063 ?auto_1875067 ) ) ( not ( = ?auto_1875063 ?auto_1875068 ) ) ( not ( = ?auto_1875063 ?auto_1875069 ) ) ( not ( = ?auto_1875063 ?auto_1875070 ) ) ( not ( = ?auto_1875063 ?auto_1875071 ) ) ( not ( = ?auto_1875063 ?auto_1875072 ) ) ( not ( = ?auto_1875064 ?auto_1875065 ) ) ( not ( = ?auto_1875064 ?auto_1875066 ) ) ( not ( = ?auto_1875064 ?auto_1875067 ) ) ( not ( = ?auto_1875064 ?auto_1875068 ) ) ( not ( = ?auto_1875064 ?auto_1875069 ) ) ( not ( = ?auto_1875064 ?auto_1875070 ) ) ( not ( = ?auto_1875064 ?auto_1875071 ) ) ( not ( = ?auto_1875064 ?auto_1875072 ) ) ( not ( = ?auto_1875065 ?auto_1875066 ) ) ( not ( = ?auto_1875065 ?auto_1875067 ) ) ( not ( = ?auto_1875065 ?auto_1875068 ) ) ( not ( = ?auto_1875065 ?auto_1875069 ) ) ( not ( = ?auto_1875065 ?auto_1875070 ) ) ( not ( = ?auto_1875065 ?auto_1875071 ) ) ( not ( = ?auto_1875065 ?auto_1875072 ) ) ( not ( = ?auto_1875066 ?auto_1875067 ) ) ( not ( = ?auto_1875066 ?auto_1875068 ) ) ( not ( = ?auto_1875066 ?auto_1875069 ) ) ( not ( = ?auto_1875066 ?auto_1875070 ) ) ( not ( = ?auto_1875066 ?auto_1875071 ) ) ( not ( = ?auto_1875066 ?auto_1875072 ) ) ( not ( = ?auto_1875067 ?auto_1875068 ) ) ( not ( = ?auto_1875067 ?auto_1875069 ) ) ( not ( = ?auto_1875067 ?auto_1875070 ) ) ( not ( = ?auto_1875067 ?auto_1875071 ) ) ( not ( = ?auto_1875067 ?auto_1875072 ) ) ( not ( = ?auto_1875068 ?auto_1875069 ) ) ( not ( = ?auto_1875068 ?auto_1875070 ) ) ( not ( = ?auto_1875068 ?auto_1875071 ) ) ( not ( = ?auto_1875068 ?auto_1875072 ) ) ( not ( = ?auto_1875069 ?auto_1875070 ) ) ( not ( = ?auto_1875069 ?auto_1875071 ) ) ( not ( = ?auto_1875069 ?auto_1875072 ) ) ( not ( = ?auto_1875070 ?auto_1875071 ) ) ( not ( = ?auto_1875070 ?auto_1875072 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1875071 ?auto_1875072 )
      ( MAKE-14CRATE-VERIFY ?auto_1875058 ?auto_1875059 ?auto_1875060 ?auto_1875061 ?auto_1875062 ?auto_1875063 ?auto_1875064 ?auto_1875065 ?auto_1875066 ?auto_1875067 ?auto_1875068 ?auto_1875069 ?auto_1875070 ?auto_1875071 ?auto_1875072 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875218 - SURFACE
      ?auto_1875219 - SURFACE
      ?auto_1875220 - SURFACE
      ?auto_1875221 - SURFACE
      ?auto_1875222 - SURFACE
      ?auto_1875223 - SURFACE
      ?auto_1875224 - SURFACE
      ?auto_1875225 - SURFACE
      ?auto_1875226 - SURFACE
      ?auto_1875227 - SURFACE
      ?auto_1875228 - SURFACE
      ?auto_1875229 - SURFACE
      ?auto_1875230 - SURFACE
      ?auto_1875231 - SURFACE
      ?auto_1875232 - SURFACE
    )
    :vars
    (
      ?auto_1875234 - HOIST
      ?auto_1875233 - PLACE
      ?auto_1875235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875234 ?auto_1875233 ) ( SURFACE-AT ?auto_1875231 ?auto_1875233 ) ( CLEAR ?auto_1875231 ) ( IS-CRATE ?auto_1875232 ) ( not ( = ?auto_1875231 ?auto_1875232 ) ) ( TRUCK-AT ?auto_1875235 ?auto_1875233 ) ( AVAILABLE ?auto_1875234 ) ( IN ?auto_1875232 ?auto_1875235 ) ( ON ?auto_1875231 ?auto_1875230 ) ( not ( = ?auto_1875230 ?auto_1875231 ) ) ( not ( = ?auto_1875230 ?auto_1875232 ) ) ( ON ?auto_1875219 ?auto_1875218 ) ( ON ?auto_1875220 ?auto_1875219 ) ( ON ?auto_1875221 ?auto_1875220 ) ( ON ?auto_1875222 ?auto_1875221 ) ( ON ?auto_1875223 ?auto_1875222 ) ( ON ?auto_1875224 ?auto_1875223 ) ( ON ?auto_1875225 ?auto_1875224 ) ( ON ?auto_1875226 ?auto_1875225 ) ( ON ?auto_1875227 ?auto_1875226 ) ( ON ?auto_1875228 ?auto_1875227 ) ( ON ?auto_1875229 ?auto_1875228 ) ( ON ?auto_1875230 ?auto_1875229 ) ( not ( = ?auto_1875218 ?auto_1875219 ) ) ( not ( = ?auto_1875218 ?auto_1875220 ) ) ( not ( = ?auto_1875218 ?auto_1875221 ) ) ( not ( = ?auto_1875218 ?auto_1875222 ) ) ( not ( = ?auto_1875218 ?auto_1875223 ) ) ( not ( = ?auto_1875218 ?auto_1875224 ) ) ( not ( = ?auto_1875218 ?auto_1875225 ) ) ( not ( = ?auto_1875218 ?auto_1875226 ) ) ( not ( = ?auto_1875218 ?auto_1875227 ) ) ( not ( = ?auto_1875218 ?auto_1875228 ) ) ( not ( = ?auto_1875218 ?auto_1875229 ) ) ( not ( = ?auto_1875218 ?auto_1875230 ) ) ( not ( = ?auto_1875218 ?auto_1875231 ) ) ( not ( = ?auto_1875218 ?auto_1875232 ) ) ( not ( = ?auto_1875219 ?auto_1875220 ) ) ( not ( = ?auto_1875219 ?auto_1875221 ) ) ( not ( = ?auto_1875219 ?auto_1875222 ) ) ( not ( = ?auto_1875219 ?auto_1875223 ) ) ( not ( = ?auto_1875219 ?auto_1875224 ) ) ( not ( = ?auto_1875219 ?auto_1875225 ) ) ( not ( = ?auto_1875219 ?auto_1875226 ) ) ( not ( = ?auto_1875219 ?auto_1875227 ) ) ( not ( = ?auto_1875219 ?auto_1875228 ) ) ( not ( = ?auto_1875219 ?auto_1875229 ) ) ( not ( = ?auto_1875219 ?auto_1875230 ) ) ( not ( = ?auto_1875219 ?auto_1875231 ) ) ( not ( = ?auto_1875219 ?auto_1875232 ) ) ( not ( = ?auto_1875220 ?auto_1875221 ) ) ( not ( = ?auto_1875220 ?auto_1875222 ) ) ( not ( = ?auto_1875220 ?auto_1875223 ) ) ( not ( = ?auto_1875220 ?auto_1875224 ) ) ( not ( = ?auto_1875220 ?auto_1875225 ) ) ( not ( = ?auto_1875220 ?auto_1875226 ) ) ( not ( = ?auto_1875220 ?auto_1875227 ) ) ( not ( = ?auto_1875220 ?auto_1875228 ) ) ( not ( = ?auto_1875220 ?auto_1875229 ) ) ( not ( = ?auto_1875220 ?auto_1875230 ) ) ( not ( = ?auto_1875220 ?auto_1875231 ) ) ( not ( = ?auto_1875220 ?auto_1875232 ) ) ( not ( = ?auto_1875221 ?auto_1875222 ) ) ( not ( = ?auto_1875221 ?auto_1875223 ) ) ( not ( = ?auto_1875221 ?auto_1875224 ) ) ( not ( = ?auto_1875221 ?auto_1875225 ) ) ( not ( = ?auto_1875221 ?auto_1875226 ) ) ( not ( = ?auto_1875221 ?auto_1875227 ) ) ( not ( = ?auto_1875221 ?auto_1875228 ) ) ( not ( = ?auto_1875221 ?auto_1875229 ) ) ( not ( = ?auto_1875221 ?auto_1875230 ) ) ( not ( = ?auto_1875221 ?auto_1875231 ) ) ( not ( = ?auto_1875221 ?auto_1875232 ) ) ( not ( = ?auto_1875222 ?auto_1875223 ) ) ( not ( = ?auto_1875222 ?auto_1875224 ) ) ( not ( = ?auto_1875222 ?auto_1875225 ) ) ( not ( = ?auto_1875222 ?auto_1875226 ) ) ( not ( = ?auto_1875222 ?auto_1875227 ) ) ( not ( = ?auto_1875222 ?auto_1875228 ) ) ( not ( = ?auto_1875222 ?auto_1875229 ) ) ( not ( = ?auto_1875222 ?auto_1875230 ) ) ( not ( = ?auto_1875222 ?auto_1875231 ) ) ( not ( = ?auto_1875222 ?auto_1875232 ) ) ( not ( = ?auto_1875223 ?auto_1875224 ) ) ( not ( = ?auto_1875223 ?auto_1875225 ) ) ( not ( = ?auto_1875223 ?auto_1875226 ) ) ( not ( = ?auto_1875223 ?auto_1875227 ) ) ( not ( = ?auto_1875223 ?auto_1875228 ) ) ( not ( = ?auto_1875223 ?auto_1875229 ) ) ( not ( = ?auto_1875223 ?auto_1875230 ) ) ( not ( = ?auto_1875223 ?auto_1875231 ) ) ( not ( = ?auto_1875223 ?auto_1875232 ) ) ( not ( = ?auto_1875224 ?auto_1875225 ) ) ( not ( = ?auto_1875224 ?auto_1875226 ) ) ( not ( = ?auto_1875224 ?auto_1875227 ) ) ( not ( = ?auto_1875224 ?auto_1875228 ) ) ( not ( = ?auto_1875224 ?auto_1875229 ) ) ( not ( = ?auto_1875224 ?auto_1875230 ) ) ( not ( = ?auto_1875224 ?auto_1875231 ) ) ( not ( = ?auto_1875224 ?auto_1875232 ) ) ( not ( = ?auto_1875225 ?auto_1875226 ) ) ( not ( = ?auto_1875225 ?auto_1875227 ) ) ( not ( = ?auto_1875225 ?auto_1875228 ) ) ( not ( = ?auto_1875225 ?auto_1875229 ) ) ( not ( = ?auto_1875225 ?auto_1875230 ) ) ( not ( = ?auto_1875225 ?auto_1875231 ) ) ( not ( = ?auto_1875225 ?auto_1875232 ) ) ( not ( = ?auto_1875226 ?auto_1875227 ) ) ( not ( = ?auto_1875226 ?auto_1875228 ) ) ( not ( = ?auto_1875226 ?auto_1875229 ) ) ( not ( = ?auto_1875226 ?auto_1875230 ) ) ( not ( = ?auto_1875226 ?auto_1875231 ) ) ( not ( = ?auto_1875226 ?auto_1875232 ) ) ( not ( = ?auto_1875227 ?auto_1875228 ) ) ( not ( = ?auto_1875227 ?auto_1875229 ) ) ( not ( = ?auto_1875227 ?auto_1875230 ) ) ( not ( = ?auto_1875227 ?auto_1875231 ) ) ( not ( = ?auto_1875227 ?auto_1875232 ) ) ( not ( = ?auto_1875228 ?auto_1875229 ) ) ( not ( = ?auto_1875228 ?auto_1875230 ) ) ( not ( = ?auto_1875228 ?auto_1875231 ) ) ( not ( = ?auto_1875228 ?auto_1875232 ) ) ( not ( = ?auto_1875229 ?auto_1875230 ) ) ( not ( = ?auto_1875229 ?auto_1875231 ) ) ( not ( = ?auto_1875229 ?auto_1875232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875230 ?auto_1875231 ?auto_1875232 )
      ( MAKE-14CRATE-VERIFY ?auto_1875218 ?auto_1875219 ?auto_1875220 ?auto_1875221 ?auto_1875222 ?auto_1875223 ?auto_1875224 ?auto_1875225 ?auto_1875226 ?auto_1875227 ?auto_1875228 ?auto_1875229 ?auto_1875230 ?auto_1875231 ?auto_1875232 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875393 - SURFACE
      ?auto_1875394 - SURFACE
      ?auto_1875395 - SURFACE
      ?auto_1875396 - SURFACE
      ?auto_1875397 - SURFACE
      ?auto_1875398 - SURFACE
      ?auto_1875399 - SURFACE
      ?auto_1875400 - SURFACE
      ?auto_1875401 - SURFACE
      ?auto_1875402 - SURFACE
      ?auto_1875403 - SURFACE
      ?auto_1875404 - SURFACE
      ?auto_1875405 - SURFACE
      ?auto_1875406 - SURFACE
      ?auto_1875407 - SURFACE
    )
    :vars
    (
      ?auto_1875411 - HOIST
      ?auto_1875410 - PLACE
      ?auto_1875408 - TRUCK
      ?auto_1875409 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875411 ?auto_1875410 ) ( SURFACE-AT ?auto_1875406 ?auto_1875410 ) ( CLEAR ?auto_1875406 ) ( IS-CRATE ?auto_1875407 ) ( not ( = ?auto_1875406 ?auto_1875407 ) ) ( AVAILABLE ?auto_1875411 ) ( IN ?auto_1875407 ?auto_1875408 ) ( ON ?auto_1875406 ?auto_1875405 ) ( not ( = ?auto_1875405 ?auto_1875406 ) ) ( not ( = ?auto_1875405 ?auto_1875407 ) ) ( TRUCK-AT ?auto_1875408 ?auto_1875409 ) ( not ( = ?auto_1875409 ?auto_1875410 ) ) ( ON ?auto_1875394 ?auto_1875393 ) ( ON ?auto_1875395 ?auto_1875394 ) ( ON ?auto_1875396 ?auto_1875395 ) ( ON ?auto_1875397 ?auto_1875396 ) ( ON ?auto_1875398 ?auto_1875397 ) ( ON ?auto_1875399 ?auto_1875398 ) ( ON ?auto_1875400 ?auto_1875399 ) ( ON ?auto_1875401 ?auto_1875400 ) ( ON ?auto_1875402 ?auto_1875401 ) ( ON ?auto_1875403 ?auto_1875402 ) ( ON ?auto_1875404 ?auto_1875403 ) ( ON ?auto_1875405 ?auto_1875404 ) ( not ( = ?auto_1875393 ?auto_1875394 ) ) ( not ( = ?auto_1875393 ?auto_1875395 ) ) ( not ( = ?auto_1875393 ?auto_1875396 ) ) ( not ( = ?auto_1875393 ?auto_1875397 ) ) ( not ( = ?auto_1875393 ?auto_1875398 ) ) ( not ( = ?auto_1875393 ?auto_1875399 ) ) ( not ( = ?auto_1875393 ?auto_1875400 ) ) ( not ( = ?auto_1875393 ?auto_1875401 ) ) ( not ( = ?auto_1875393 ?auto_1875402 ) ) ( not ( = ?auto_1875393 ?auto_1875403 ) ) ( not ( = ?auto_1875393 ?auto_1875404 ) ) ( not ( = ?auto_1875393 ?auto_1875405 ) ) ( not ( = ?auto_1875393 ?auto_1875406 ) ) ( not ( = ?auto_1875393 ?auto_1875407 ) ) ( not ( = ?auto_1875394 ?auto_1875395 ) ) ( not ( = ?auto_1875394 ?auto_1875396 ) ) ( not ( = ?auto_1875394 ?auto_1875397 ) ) ( not ( = ?auto_1875394 ?auto_1875398 ) ) ( not ( = ?auto_1875394 ?auto_1875399 ) ) ( not ( = ?auto_1875394 ?auto_1875400 ) ) ( not ( = ?auto_1875394 ?auto_1875401 ) ) ( not ( = ?auto_1875394 ?auto_1875402 ) ) ( not ( = ?auto_1875394 ?auto_1875403 ) ) ( not ( = ?auto_1875394 ?auto_1875404 ) ) ( not ( = ?auto_1875394 ?auto_1875405 ) ) ( not ( = ?auto_1875394 ?auto_1875406 ) ) ( not ( = ?auto_1875394 ?auto_1875407 ) ) ( not ( = ?auto_1875395 ?auto_1875396 ) ) ( not ( = ?auto_1875395 ?auto_1875397 ) ) ( not ( = ?auto_1875395 ?auto_1875398 ) ) ( not ( = ?auto_1875395 ?auto_1875399 ) ) ( not ( = ?auto_1875395 ?auto_1875400 ) ) ( not ( = ?auto_1875395 ?auto_1875401 ) ) ( not ( = ?auto_1875395 ?auto_1875402 ) ) ( not ( = ?auto_1875395 ?auto_1875403 ) ) ( not ( = ?auto_1875395 ?auto_1875404 ) ) ( not ( = ?auto_1875395 ?auto_1875405 ) ) ( not ( = ?auto_1875395 ?auto_1875406 ) ) ( not ( = ?auto_1875395 ?auto_1875407 ) ) ( not ( = ?auto_1875396 ?auto_1875397 ) ) ( not ( = ?auto_1875396 ?auto_1875398 ) ) ( not ( = ?auto_1875396 ?auto_1875399 ) ) ( not ( = ?auto_1875396 ?auto_1875400 ) ) ( not ( = ?auto_1875396 ?auto_1875401 ) ) ( not ( = ?auto_1875396 ?auto_1875402 ) ) ( not ( = ?auto_1875396 ?auto_1875403 ) ) ( not ( = ?auto_1875396 ?auto_1875404 ) ) ( not ( = ?auto_1875396 ?auto_1875405 ) ) ( not ( = ?auto_1875396 ?auto_1875406 ) ) ( not ( = ?auto_1875396 ?auto_1875407 ) ) ( not ( = ?auto_1875397 ?auto_1875398 ) ) ( not ( = ?auto_1875397 ?auto_1875399 ) ) ( not ( = ?auto_1875397 ?auto_1875400 ) ) ( not ( = ?auto_1875397 ?auto_1875401 ) ) ( not ( = ?auto_1875397 ?auto_1875402 ) ) ( not ( = ?auto_1875397 ?auto_1875403 ) ) ( not ( = ?auto_1875397 ?auto_1875404 ) ) ( not ( = ?auto_1875397 ?auto_1875405 ) ) ( not ( = ?auto_1875397 ?auto_1875406 ) ) ( not ( = ?auto_1875397 ?auto_1875407 ) ) ( not ( = ?auto_1875398 ?auto_1875399 ) ) ( not ( = ?auto_1875398 ?auto_1875400 ) ) ( not ( = ?auto_1875398 ?auto_1875401 ) ) ( not ( = ?auto_1875398 ?auto_1875402 ) ) ( not ( = ?auto_1875398 ?auto_1875403 ) ) ( not ( = ?auto_1875398 ?auto_1875404 ) ) ( not ( = ?auto_1875398 ?auto_1875405 ) ) ( not ( = ?auto_1875398 ?auto_1875406 ) ) ( not ( = ?auto_1875398 ?auto_1875407 ) ) ( not ( = ?auto_1875399 ?auto_1875400 ) ) ( not ( = ?auto_1875399 ?auto_1875401 ) ) ( not ( = ?auto_1875399 ?auto_1875402 ) ) ( not ( = ?auto_1875399 ?auto_1875403 ) ) ( not ( = ?auto_1875399 ?auto_1875404 ) ) ( not ( = ?auto_1875399 ?auto_1875405 ) ) ( not ( = ?auto_1875399 ?auto_1875406 ) ) ( not ( = ?auto_1875399 ?auto_1875407 ) ) ( not ( = ?auto_1875400 ?auto_1875401 ) ) ( not ( = ?auto_1875400 ?auto_1875402 ) ) ( not ( = ?auto_1875400 ?auto_1875403 ) ) ( not ( = ?auto_1875400 ?auto_1875404 ) ) ( not ( = ?auto_1875400 ?auto_1875405 ) ) ( not ( = ?auto_1875400 ?auto_1875406 ) ) ( not ( = ?auto_1875400 ?auto_1875407 ) ) ( not ( = ?auto_1875401 ?auto_1875402 ) ) ( not ( = ?auto_1875401 ?auto_1875403 ) ) ( not ( = ?auto_1875401 ?auto_1875404 ) ) ( not ( = ?auto_1875401 ?auto_1875405 ) ) ( not ( = ?auto_1875401 ?auto_1875406 ) ) ( not ( = ?auto_1875401 ?auto_1875407 ) ) ( not ( = ?auto_1875402 ?auto_1875403 ) ) ( not ( = ?auto_1875402 ?auto_1875404 ) ) ( not ( = ?auto_1875402 ?auto_1875405 ) ) ( not ( = ?auto_1875402 ?auto_1875406 ) ) ( not ( = ?auto_1875402 ?auto_1875407 ) ) ( not ( = ?auto_1875403 ?auto_1875404 ) ) ( not ( = ?auto_1875403 ?auto_1875405 ) ) ( not ( = ?auto_1875403 ?auto_1875406 ) ) ( not ( = ?auto_1875403 ?auto_1875407 ) ) ( not ( = ?auto_1875404 ?auto_1875405 ) ) ( not ( = ?auto_1875404 ?auto_1875406 ) ) ( not ( = ?auto_1875404 ?auto_1875407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875405 ?auto_1875406 ?auto_1875407 )
      ( MAKE-14CRATE-VERIFY ?auto_1875393 ?auto_1875394 ?auto_1875395 ?auto_1875396 ?auto_1875397 ?auto_1875398 ?auto_1875399 ?auto_1875400 ?auto_1875401 ?auto_1875402 ?auto_1875403 ?auto_1875404 ?auto_1875405 ?auto_1875406 ?auto_1875407 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875582 - SURFACE
      ?auto_1875583 - SURFACE
      ?auto_1875584 - SURFACE
      ?auto_1875585 - SURFACE
      ?auto_1875586 - SURFACE
      ?auto_1875587 - SURFACE
      ?auto_1875588 - SURFACE
      ?auto_1875589 - SURFACE
      ?auto_1875590 - SURFACE
      ?auto_1875591 - SURFACE
      ?auto_1875592 - SURFACE
      ?auto_1875593 - SURFACE
      ?auto_1875594 - SURFACE
      ?auto_1875595 - SURFACE
      ?auto_1875596 - SURFACE
    )
    :vars
    (
      ?auto_1875601 - HOIST
      ?auto_1875599 - PLACE
      ?auto_1875600 - TRUCK
      ?auto_1875598 - PLACE
      ?auto_1875597 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875601 ?auto_1875599 ) ( SURFACE-AT ?auto_1875595 ?auto_1875599 ) ( CLEAR ?auto_1875595 ) ( IS-CRATE ?auto_1875596 ) ( not ( = ?auto_1875595 ?auto_1875596 ) ) ( AVAILABLE ?auto_1875601 ) ( ON ?auto_1875595 ?auto_1875594 ) ( not ( = ?auto_1875594 ?auto_1875595 ) ) ( not ( = ?auto_1875594 ?auto_1875596 ) ) ( TRUCK-AT ?auto_1875600 ?auto_1875598 ) ( not ( = ?auto_1875598 ?auto_1875599 ) ) ( HOIST-AT ?auto_1875597 ?auto_1875598 ) ( LIFTING ?auto_1875597 ?auto_1875596 ) ( not ( = ?auto_1875601 ?auto_1875597 ) ) ( ON ?auto_1875583 ?auto_1875582 ) ( ON ?auto_1875584 ?auto_1875583 ) ( ON ?auto_1875585 ?auto_1875584 ) ( ON ?auto_1875586 ?auto_1875585 ) ( ON ?auto_1875587 ?auto_1875586 ) ( ON ?auto_1875588 ?auto_1875587 ) ( ON ?auto_1875589 ?auto_1875588 ) ( ON ?auto_1875590 ?auto_1875589 ) ( ON ?auto_1875591 ?auto_1875590 ) ( ON ?auto_1875592 ?auto_1875591 ) ( ON ?auto_1875593 ?auto_1875592 ) ( ON ?auto_1875594 ?auto_1875593 ) ( not ( = ?auto_1875582 ?auto_1875583 ) ) ( not ( = ?auto_1875582 ?auto_1875584 ) ) ( not ( = ?auto_1875582 ?auto_1875585 ) ) ( not ( = ?auto_1875582 ?auto_1875586 ) ) ( not ( = ?auto_1875582 ?auto_1875587 ) ) ( not ( = ?auto_1875582 ?auto_1875588 ) ) ( not ( = ?auto_1875582 ?auto_1875589 ) ) ( not ( = ?auto_1875582 ?auto_1875590 ) ) ( not ( = ?auto_1875582 ?auto_1875591 ) ) ( not ( = ?auto_1875582 ?auto_1875592 ) ) ( not ( = ?auto_1875582 ?auto_1875593 ) ) ( not ( = ?auto_1875582 ?auto_1875594 ) ) ( not ( = ?auto_1875582 ?auto_1875595 ) ) ( not ( = ?auto_1875582 ?auto_1875596 ) ) ( not ( = ?auto_1875583 ?auto_1875584 ) ) ( not ( = ?auto_1875583 ?auto_1875585 ) ) ( not ( = ?auto_1875583 ?auto_1875586 ) ) ( not ( = ?auto_1875583 ?auto_1875587 ) ) ( not ( = ?auto_1875583 ?auto_1875588 ) ) ( not ( = ?auto_1875583 ?auto_1875589 ) ) ( not ( = ?auto_1875583 ?auto_1875590 ) ) ( not ( = ?auto_1875583 ?auto_1875591 ) ) ( not ( = ?auto_1875583 ?auto_1875592 ) ) ( not ( = ?auto_1875583 ?auto_1875593 ) ) ( not ( = ?auto_1875583 ?auto_1875594 ) ) ( not ( = ?auto_1875583 ?auto_1875595 ) ) ( not ( = ?auto_1875583 ?auto_1875596 ) ) ( not ( = ?auto_1875584 ?auto_1875585 ) ) ( not ( = ?auto_1875584 ?auto_1875586 ) ) ( not ( = ?auto_1875584 ?auto_1875587 ) ) ( not ( = ?auto_1875584 ?auto_1875588 ) ) ( not ( = ?auto_1875584 ?auto_1875589 ) ) ( not ( = ?auto_1875584 ?auto_1875590 ) ) ( not ( = ?auto_1875584 ?auto_1875591 ) ) ( not ( = ?auto_1875584 ?auto_1875592 ) ) ( not ( = ?auto_1875584 ?auto_1875593 ) ) ( not ( = ?auto_1875584 ?auto_1875594 ) ) ( not ( = ?auto_1875584 ?auto_1875595 ) ) ( not ( = ?auto_1875584 ?auto_1875596 ) ) ( not ( = ?auto_1875585 ?auto_1875586 ) ) ( not ( = ?auto_1875585 ?auto_1875587 ) ) ( not ( = ?auto_1875585 ?auto_1875588 ) ) ( not ( = ?auto_1875585 ?auto_1875589 ) ) ( not ( = ?auto_1875585 ?auto_1875590 ) ) ( not ( = ?auto_1875585 ?auto_1875591 ) ) ( not ( = ?auto_1875585 ?auto_1875592 ) ) ( not ( = ?auto_1875585 ?auto_1875593 ) ) ( not ( = ?auto_1875585 ?auto_1875594 ) ) ( not ( = ?auto_1875585 ?auto_1875595 ) ) ( not ( = ?auto_1875585 ?auto_1875596 ) ) ( not ( = ?auto_1875586 ?auto_1875587 ) ) ( not ( = ?auto_1875586 ?auto_1875588 ) ) ( not ( = ?auto_1875586 ?auto_1875589 ) ) ( not ( = ?auto_1875586 ?auto_1875590 ) ) ( not ( = ?auto_1875586 ?auto_1875591 ) ) ( not ( = ?auto_1875586 ?auto_1875592 ) ) ( not ( = ?auto_1875586 ?auto_1875593 ) ) ( not ( = ?auto_1875586 ?auto_1875594 ) ) ( not ( = ?auto_1875586 ?auto_1875595 ) ) ( not ( = ?auto_1875586 ?auto_1875596 ) ) ( not ( = ?auto_1875587 ?auto_1875588 ) ) ( not ( = ?auto_1875587 ?auto_1875589 ) ) ( not ( = ?auto_1875587 ?auto_1875590 ) ) ( not ( = ?auto_1875587 ?auto_1875591 ) ) ( not ( = ?auto_1875587 ?auto_1875592 ) ) ( not ( = ?auto_1875587 ?auto_1875593 ) ) ( not ( = ?auto_1875587 ?auto_1875594 ) ) ( not ( = ?auto_1875587 ?auto_1875595 ) ) ( not ( = ?auto_1875587 ?auto_1875596 ) ) ( not ( = ?auto_1875588 ?auto_1875589 ) ) ( not ( = ?auto_1875588 ?auto_1875590 ) ) ( not ( = ?auto_1875588 ?auto_1875591 ) ) ( not ( = ?auto_1875588 ?auto_1875592 ) ) ( not ( = ?auto_1875588 ?auto_1875593 ) ) ( not ( = ?auto_1875588 ?auto_1875594 ) ) ( not ( = ?auto_1875588 ?auto_1875595 ) ) ( not ( = ?auto_1875588 ?auto_1875596 ) ) ( not ( = ?auto_1875589 ?auto_1875590 ) ) ( not ( = ?auto_1875589 ?auto_1875591 ) ) ( not ( = ?auto_1875589 ?auto_1875592 ) ) ( not ( = ?auto_1875589 ?auto_1875593 ) ) ( not ( = ?auto_1875589 ?auto_1875594 ) ) ( not ( = ?auto_1875589 ?auto_1875595 ) ) ( not ( = ?auto_1875589 ?auto_1875596 ) ) ( not ( = ?auto_1875590 ?auto_1875591 ) ) ( not ( = ?auto_1875590 ?auto_1875592 ) ) ( not ( = ?auto_1875590 ?auto_1875593 ) ) ( not ( = ?auto_1875590 ?auto_1875594 ) ) ( not ( = ?auto_1875590 ?auto_1875595 ) ) ( not ( = ?auto_1875590 ?auto_1875596 ) ) ( not ( = ?auto_1875591 ?auto_1875592 ) ) ( not ( = ?auto_1875591 ?auto_1875593 ) ) ( not ( = ?auto_1875591 ?auto_1875594 ) ) ( not ( = ?auto_1875591 ?auto_1875595 ) ) ( not ( = ?auto_1875591 ?auto_1875596 ) ) ( not ( = ?auto_1875592 ?auto_1875593 ) ) ( not ( = ?auto_1875592 ?auto_1875594 ) ) ( not ( = ?auto_1875592 ?auto_1875595 ) ) ( not ( = ?auto_1875592 ?auto_1875596 ) ) ( not ( = ?auto_1875593 ?auto_1875594 ) ) ( not ( = ?auto_1875593 ?auto_1875595 ) ) ( not ( = ?auto_1875593 ?auto_1875596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875594 ?auto_1875595 ?auto_1875596 )
      ( MAKE-14CRATE-VERIFY ?auto_1875582 ?auto_1875583 ?auto_1875584 ?auto_1875585 ?auto_1875586 ?auto_1875587 ?auto_1875588 ?auto_1875589 ?auto_1875590 ?auto_1875591 ?auto_1875592 ?auto_1875593 ?auto_1875594 ?auto_1875595 ?auto_1875596 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875785 - SURFACE
      ?auto_1875786 - SURFACE
      ?auto_1875787 - SURFACE
      ?auto_1875788 - SURFACE
      ?auto_1875789 - SURFACE
      ?auto_1875790 - SURFACE
      ?auto_1875791 - SURFACE
      ?auto_1875792 - SURFACE
      ?auto_1875793 - SURFACE
      ?auto_1875794 - SURFACE
      ?auto_1875795 - SURFACE
      ?auto_1875796 - SURFACE
      ?auto_1875797 - SURFACE
      ?auto_1875798 - SURFACE
      ?auto_1875799 - SURFACE
    )
    :vars
    (
      ?auto_1875802 - HOIST
      ?auto_1875804 - PLACE
      ?auto_1875805 - TRUCK
      ?auto_1875803 - PLACE
      ?auto_1875800 - HOIST
      ?auto_1875801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875802 ?auto_1875804 ) ( SURFACE-AT ?auto_1875798 ?auto_1875804 ) ( CLEAR ?auto_1875798 ) ( IS-CRATE ?auto_1875799 ) ( not ( = ?auto_1875798 ?auto_1875799 ) ) ( AVAILABLE ?auto_1875802 ) ( ON ?auto_1875798 ?auto_1875797 ) ( not ( = ?auto_1875797 ?auto_1875798 ) ) ( not ( = ?auto_1875797 ?auto_1875799 ) ) ( TRUCK-AT ?auto_1875805 ?auto_1875803 ) ( not ( = ?auto_1875803 ?auto_1875804 ) ) ( HOIST-AT ?auto_1875800 ?auto_1875803 ) ( not ( = ?auto_1875802 ?auto_1875800 ) ) ( AVAILABLE ?auto_1875800 ) ( SURFACE-AT ?auto_1875799 ?auto_1875803 ) ( ON ?auto_1875799 ?auto_1875801 ) ( CLEAR ?auto_1875799 ) ( not ( = ?auto_1875798 ?auto_1875801 ) ) ( not ( = ?auto_1875799 ?auto_1875801 ) ) ( not ( = ?auto_1875797 ?auto_1875801 ) ) ( ON ?auto_1875786 ?auto_1875785 ) ( ON ?auto_1875787 ?auto_1875786 ) ( ON ?auto_1875788 ?auto_1875787 ) ( ON ?auto_1875789 ?auto_1875788 ) ( ON ?auto_1875790 ?auto_1875789 ) ( ON ?auto_1875791 ?auto_1875790 ) ( ON ?auto_1875792 ?auto_1875791 ) ( ON ?auto_1875793 ?auto_1875792 ) ( ON ?auto_1875794 ?auto_1875793 ) ( ON ?auto_1875795 ?auto_1875794 ) ( ON ?auto_1875796 ?auto_1875795 ) ( ON ?auto_1875797 ?auto_1875796 ) ( not ( = ?auto_1875785 ?auto_1875786 ) ) ( not ( = ?auto_1875785 ?auto_1875787 ) ) ( not ( = ?auto_1875785 ?auto_1875788 ) ) ( not ( = ?auto_1875785 ?auto_1875789 ) ) ( not ( = ?auto_1875785 ?auto_1875790 ) ) ( not ( = ?auto_1875785 ?auto_1875791 ) ) ( not ( = ?auto_1875785 ?auto_1875792 ) ) ( not ( = ?auto_1875785 ?auto_1875793 ) ) ( not ( = ?auto_1875785 ?auto_1875794 ) ) ( not ( = ?auto_1875785 ?auto_1875795 ) ) ( not ( = ?auto_1875785 ?auto_1875796 ) ) ( not ( = ?auto_1875785 ?auto_1875797 ) ) ( not ( = ?auto_1875785 ?auto_1875798 ) ) ( not ( = ?auto_1875785 ?auto_1875799 ) ) ( not ( = ?auto_1875785 ?auto_1875801 ) ) ( not ( = ?auto_1875786 ?auto_1875787 ) ) ( not ( = ?auto_1875786 ?auto_1875788 ) ) ( not ( = ?auto_1875786 ?auto_1875789 ) ) ( not ( = ?auto_1875786 ?auto_1875790 ) ) ( not ( = ?auto_1875786 ?auto_1875791 ) ) ( not ( = ?auto_1875786 ?auto_1875792 ) ) ( not ( = ?auto_1875786 ?auto_1875793 ) ) ( not ( = ?auto_1875786 ?auto_1875794 ) ) ( not ( = ?auto_1875786 ?auto_1875795 ) ) ( not ( = ?auto_1875786 ?auto_1875796 ) ) ( not ( = ?auto_1875786 ?auto_1875797 ) ) ( not ( = ?auto_1875786 ?auto_1875798 ) ) ( not ( = ?auto_1875786 ?auto_1875799 ) ) ( not ( = ?auto_1875786 ?auto_1875801 ) ) ( not ( = ?auto_1875787 ?auto_1875788 ) ) ( not ( = ?auto_1875787 ?auto_1875789 ) ) ( not ( = ?auto_1875787 ?auto_1875790 ) ) ( not ( = ?auto_1875787 ?auto_1875791 ) ) ( not ( = ?auto_1875787 ?auto_1875792 ) ) ( not ( = ?auto_1875787 ?auto_1875793 ) ) ( not ( = ?auto_1875787 ?auto_1875794 ) ) ( not ( = ?auto_1875787 ?auto_1875795 ) ) ( not ( = ?auto_1875787 ?auto_1875796 ) ) ( not ( = ?auto_1875787 ?auto_1875797 ) ) ( not ( = ?auto_1875787 ?auto_1875798 ) ) ( not ( = ?auto_1875787 ?auto_1875799 ) ) ( not ( = ?auto_1875787 ?auto_1875801 ) ) ( not ( = ?auto_1875788 ?auto_1875789 ) ) ( not ( = ?auto_1875788 ?auto_1875790 ) ) ( not ( = ?auto_1875788 ?auto_1875791 ) ) ( not ( = ?auto_1875788 ?auto_1875792 ) ) ( not ( = ?auto_1875788 ?auto_1875793 ) ) ( not ( = ?auto_1875788 ?auto_1875794 ) ) ( not ( = ?auto_1875788 ?auto_1875795 ) ) ( not ( = ?auto_1875788 ?auto_1875796 ) ) ( not ( = ?auto_1875788 ?auto_1875797 ) ) ( not ( = ?auto_1875788 ?auto_1875798 ) ) ( not ( = ?auto_1875788 ?auto_1875799 ) ) ( not ( = ?auto_1875788 ?auto_1875801 ) ) ( not ( = ?auto_1875789 ?auto_1875790 ) ) ( not ( = ?auto_1875789 ?auto_1875791 ) ) ( not ( = ?auto_1875789 ?auto_1875792 ) ) ( not ( = ?auto_1875789 ?auto_1875793 ) ) ( not ( = ?auto_1875789 ?auto_1875794 ) ) ( not ( = ?auto_1875789 ?auto_1875795 ) ) ( not ( = ?auto_1875789 ?auto_1875796 ) ) ( not ( = ?auto_1875789 ?auto_1875797 ) ) ( not ( = ?auto_1875789 ?auto_1875798 ) ) ( not ( = ?auto_1875789 ?auto_1875799 ) ) ( not ( = ?auto_1875789 ?auto_1875801 ) ) ( not ( = ?auto_1875790 ?auto_1875791 ) ) ( not ( = ?auto_1875790 ?auto_1875792 ) ) ( not ( = ?auto_1875790 ?auto_1875793 ) ) ( not ( = ?auto_1875790 ?auto_1875794 ) ) ( not ( = ?auto_1875790 ?auto_1875795 ) ) ( not ( = ?auto_1875790 ?auto_1875796 ) ) ( not ( = ?auto_1875790 ?auto_1875797 ) ) ( not ( = ?auto_1875790 ?auto_1875798 ) ) ( not ( = ?auto_1875790 ?auto_1875799 ) ) ( not ( = ?auto_1875790 ?auto_1875801 ) ) ( not ( = ?auto_1875791 ?auto_1875792 ) ) ( not ( = ?auto_1875791 ?auto_1875793 ) ) ( not ( = ?auto_1875791 ?auto_1875794 ) ) ( not ( = ?auto_1875791 ?auto_1875795 ) ) ( not ( = ?auto_1875791 ?auto_1875796 ) ) ( not ( = ?auto_1875791 ?auto_1875797 ) ) ( not ( = ?auto_1875791 ?auto_1875798 ) ) ( not ( = ?auto_1875791 ?auto_1875799 ) ) ( not ( = ?auto_1875791 ?auto_1875801 ) ) ( not ( = ?auto_1875792 ?auto_1875793 ) ) ( not ( = ?auto_1875792 ?auto_1875794 ) ) ( not ( = ?auto_1875792 ?auto_1875795 ) ) ( not ( = ?auto_1875792 ?auto_1875796 ) ) ( not ( = ?auto_1875792 ?auto_1875797 ) ) ( not ( = ?auto_1875792 ?auto_1875798 ) ) ( not ( = ?auto_1875792 ?auto_1875799 ) ) ( not ( = ?auto_1875792 ?auto_1875801 ) ) ( not ( = ?auto_1875793 ?auto_1875794 ) ) ( not ( = ?auto_1875793 ?auto_1875795 ) ) ( not ( = ?auto_1875793 ?auto_1875796 ) ) ( not ( = ?auto_1875793 ?auto_1875797 ) ) ( not ( = ?auto_1875793 ?auto_1875798 ) ) ( not ( = ?auto_1875793 ?auto_1875799 ) ) ( not ( = ?auto_1875793 ?auto_1875801 ) ) ( not ( = ?auto_1875794 ?auto_1875795 ) ) ( not ( = ?auto_1875794 ?auto_1875796 ) ) ( not ( = ?auto_1875794 ?auto_1875797 ) ) ( not ( = ?auto_1875794 ?auto_1875798 ) ) ( not ( = ?auto_1875794 ?auto_1875799 ) ) ( not ( = ?auto_1875794 ?auto_1875801 ) ) ( not ( = ?auto_1875795 ?auto_1875796 ) ) ( not ( = ?auto_1875795 ?auto_1875797 ) ) ( not ( = ?auto_1875795 ?auto_1875798 ) ) ( not ( = ?auto_1875795 ?auto_1875799 ) ) ( not ( = ?auto_1875795 ?auto_1875801 ) ) ( not ( = ?auto_1875796 ?auto_1875797 ) ) ( not ( = ?auto_1875796 ?auto_1875798 ) ) ( not ( = ?auto_1875796 ?auto_1875799 ) ) ( not ( = ?auto_1875796 ?auto_1875801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875797 ?auto_1875798 ?auto_1875799 )
      ( MAKE-14CRATE-VERIFY ?auto_1875785 ?auto_1875786 ?auto_1875787 ?auto_1875788 ?auto_1875789 ?auto_1875790 ?auto_1875791 ?auto_1875792 ?auto_1875793 ?auto_1875794 ?auto_1875795 ?auto_1875796 ?auto_1875797 ?auto_1875798 ?auto_1875799 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875989 - SURFACE
      ?auto_1875990 - SURFACE
      ?auto_1875991 - SURFACE
      ?auto_1875992 - SURFACE
      ?auto_1875993 - SURFACE
      ?auto_1875994 - SURFACE
      ?auto_1875995 - SURFACE
      ?auto_1875996 - SURFACE
      ?auto_1875997 - SURFACE
      ?auto_1875998 - SURFACE
      ?auto_1875999 - SURFACE
      ?auto_1876000 - SURFACE
      ?auto_1876001 - SURFACE
      ?auto_1876002 - SURFACE
      ?auto_1876003 - SURFACE
    )
    :vars
    (
      ?auto_1876006 - HOIST
      ?auto_1876009 - PLACE
      ?auto_1876005 - PLACE
      ?auto_1876007 - HOIST
      ?auto_1876004 - SURFACE
      ?auto_1876008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1876006 ?auto_1876009 ) ( SURFACE-AT ?auto_1876002 ?auto_1876009 ) ( CLEAR ?auto_1876002 ) ( IS-CRATE ?auto_1876003 ) ( not ( = ?auto_1876002 ?auto_1876003 ) ) ( AVAILABLE ?auto_1876006 ) ( ON ?auto_1876002 ?auto_1876001 ) ( not ( = ?auto_1876001 ?auto_1876002 ) ) ( not ( = ?auto_1876001 ?auto_1876003 ) ) ( not ( = ?auto_1876005 ?auto_1876009 ) ) ( HOIST-AT ?auto_1876007 ?auto_1876005 ) ( not ( = ?auto_1876006 ?auto_1876007 ) ) ( AVAILABLE ?auto_1876007 ) ( SURFACE-AT ?auto_1876003 ?auto_1876005 ) ( ON ?auto_1876003 ?auto_1876004 ) ( CLEAR ?auto_1876003 ) ( not ( = ?auto_1876002 ?auto_1876004 ) ) ( not ( = ?auto_1876003 ?auto_1876004 ) ) ( not ( = ?auto_1876001 ?auto_1876004 ) ) ( TRUCK-AT ?auto_1876008 ?auto_1876009 ) ( ON ?auto_1875990 ?auto_1875989 ) ( ON ?auto_1875991 ?auto_1875990 ) ( ON ?auto_1875992 ?auto_1875991 ) ( ON ?auto_1875993 ?auto_1875992 ) ( ON ?auto_1875994 ?auto_1875993 ) ( ON ?auto_1875995 ?auto_1875994 ) ( ON ?auto_1875996 ?auto_1875995 ) ( ON ?auto_1875997 ?auto_1875996 ) ( ON ?auto_1875998 ?auto_1875997 ) ( ON ?auto_1875999 ?auto_1875998 ) ( ON ?auto_1876000 ?auto_1875999 ) ( ON ?auto_1876001 ?auto_1876000 ) ( not ( = ?auto_1875989 ?auto_1875990 ) ) ( not ( = ?auto_1875989 ?auto_1875991 ) ) ( not ( = ?auto_1875989 ?auto_1875992 ) ) ( not ( = ?auto_1875989 ?auto_1875993 ) ) ( not ( = ?auto_1875989 ?auto_1875994 ) ) ( not ( = ?auto_1875989 ?auto_1875995 ) ) ( not ( = ?auto_1875989 ?auto_1875996 ) ) ( not ( = ?auto_1875989 ?auto_1875997 ) ) ( not ( = ?auto_1875989 ?auto_1875998 ) ) ( not ( = ?auto_1875989 ?auto_1875999 ) ) ( not ( = ?auto_1875989 ?auto_1876000 ) ) ( not ( = ?auto_1875989 ?auto_1876001 ) ) ( not ( = ?auto_1875989 ?auto_1876002 ) ) ( not ( = ?auto_1875989 ?auto_1876003 ) ) ( not ( = ?auto_1875989 ?auto_1876004 ) ) ( not ( = ?auto_1875990 ?auto_1875991 ) ) ( not ( = ?auto_1875990 ?auto_1875992 ) ) ( not ( = ?auto_1875990 ?auto_1875993 ) ) ( not ( = ?auto_1875990 ?auto_1875994 ) ) ( not ( = ?auto_1875990 ?auto_1875995 ) ) ( not ( = ?auto_1875990 ?auto_1875996 ) ) ( not ( = ?auto_1875990 ?auto_1875997 ) ) ( not ( = ?auto_1875990 ?auto_1875998 ) ) ( not ( = ?auto_1875990 ?auto_1875999 ) ) ( not ( = ?auto_1875990 ?auto_1876000 ) ) ( not ( = ?auto_1875990 ?auto_1876001 ) ) ( not ( = ?auto_1875990 ?auto_1876002 ) ) ( not ( = ?auto_1875990 ?auto_1876003 ) ) ( not ( = ?auto_1875990 ?auto_1876004 ) ) ( not ( = ?auto_1875991 ?auto_1875992 ) ) ( not ( = ?auto_1875991 ?auto_1875993 ) ) ( not ( = ?auto_1875991 ?auto_1875994 ) ) ( not ( = ?auto_1875991 ?auto_1875995 ) ) ( not ( = ?auto_1875991 ?auto_1875996 ) ) ( not ( = ?auto_1875991 ?auto_1875997 ) ) ( not ( = ?auto_1875991 ?auto_1875998 ) ) ( not ( = ?auto_1875991 ?auto_1875999 ) ) ( not ( = ?auto_1875991 ?auto_1876000 ) ) ( not ( = ?auto_1875991 ?auto_1876001 ) ) ( not ( = ?auto_1875991 ?auto_1876002 ) ) ( not ( = ?auto_1875991 ?auto_1876003 ) ) ( not ( = ?auto_1875991 ?auto_1876004 ) ) ( not ( = ?auto_1875992 ?auto_1875993 ) ) ( not ( = ?auto_1875992 ?auto_1875994 ) ) ( not ( = ?auto_1875992 ?auto_1875995 ) ) ( not ( = ?auto_1875992 ?auto_1875996 ) ) ( not ( = ?auto_1875992 ?auto_1875997 ) ) ( not ( = ?auto_1875992 ?auto_1875998 ) ) ( not ( = ?auto_1875992 ?auto_1875999 ) ) ( not ( = ?auto_1875992 ?auto_1876000 ) ) ( not ( = ?auto_1875992 ?auto_1876001 ) ) ( not ( = ?auto_1875992 ?auto_1876002 ) ) ( not ( = ?auto_1875992 ?auto_1876003 ) ) ( not ( = ?auto_1875992 ?auto_1876004 ) ) ( not ( = ?auto_1875993 ?auto_1875994 ) ) ( not ( = ?auto_1875993 ?auto_1875995 ) ) ( not ( = ?auto_1875993 ?auto_1875996 ) ) ( not ( = ?auto_1875993 ?auto_1875997 ) ) ( not ( = ?auto_1875993 ?auto_1875998 ) ) ( not ( = ?auto_1875993 ?auto_1875999 ) ) ( not ( = ?auto_1875993 ?auto_1876000 ) ) ( not ( = ?auto_1875993 ?auto_1876001 ) ) ( not ( = ?auto_1875993 ?auto_1876002 ) ) ( not ( = ?auto_1875993 ?auto_1876003 ) ) ( not ( = ?auto_1875993 ?auto_1876004 ) ) ( not ( = ?auto_1875994 ?auto_1875995 ) ) ( not ( = ?auto_1875994 ?auto_1875996 ) ) ( not ( = ?auto_1875994 ?auto_1875997 ) ) ( not ( = ?auto_1875994 ?auto_1875998 ) ) ( not ( = ?auto_1875994 ?auto_1875999 ) ) ( not ( = ?auto_1875994 ?auto_1876000 ) ) ( not ( = ?auto_1875994 ?auto_1876001 ) ) ( not ( = ?auto_1875994 ?auto_1876002 ) ) ( not ( = ?auto_1875994 ?auto_1876003 ) ) ( not ( = ?auto_1875994 ?auto_1876004 ) ) ( not ( = ?auto_1875995 ?auto_1875996 ) ) ( not ( = ?auto_1875995 ?auto_1875997 ) ) ( not ( = ?auto_1875995 ?auto_1875998 ) ) ( not ( = ?auto_1875995 ?auto_1875999 ) ) ( not ( = ?auto_1875995 ?auto_1876000 ) ) ( not ( = ?auto_1875995 ?auto_1876001 ) ) ( not ( = ?auto_1875995 ?auto_1876002 ) ) ( not ( = ?auto_1875995 ?auto_1876003 ) ) ( not ( = ?auto_1875995 ?auto_1876004 ) ) ( not ( = ?auto_1875996 ?auto_1875997 ) ) ( not ( = ?auto_1875996 ?auto_1875998 ) ) ( not ( = ?auto_1875996 ?auto_1875999 ) ) ( not ( = ?auto_1875996 ?auto_1876000 ) ) ( not ( = ?auto_1875996 ?auto_1876001 ) ) ( not ( = ?auto_1875996 ?auto_1876002 ) ) ( not ( = ?auto_1875996 ?auto_1876003 ) ) ( not ( = ?auto_1875996 ?auto_1876004 ) ) ( not ( = ?auto_1875997 ?auto_1875998 ) ) ( not ( = ?auto_1875997 ?auto_1875999 ) ) ( not ( = ?auto_1875997 ?auto_1876000 ) ) ( not ( = ?auto_1875997 ?auto_1876001 ) ) ( not ( = ?auto_1875997 ?auto_1876002 ) ) ( not ( = ?auto_1875997 ?auto_1876003 ) ) ( not ( = ?auto_1875997 ?auto_1876004 ) ) ( not ( = ?auto_1875998 ?auto_1875999 ) ) ( not ( = ?auto_1875998 ?auto_1876000 ) ) ( not ( = ?auto_1875998 ?auto_1876001 ) ) ( not ( = ?auto_1875998 ?auto_1876002 ) ) ( not ( = ?auto_1875998 ?auto_1876003 ) ) ( not ( = ?auto_1875998 ?auto_1876004 ) ) ( not ( = ?auto_1875999 ?auto_1876000 ) ) ( not ( = ?auto_1875999 ?auto_1876001 ) ) ( not ( = ?auto_1875999 ?auto_1876002 ) ) ( not ( = ?auto_1875999 ?auto_1876003 ) ) ( not ( = ?auto_1875999 ?auto_1876004 ) ) ( not ( = ?auto_1876000 ?auto_1876001 ) ) ( not ( = ?auto_1876000 ?auto_1876002 ) ) ( not ( = ?auto_1876000 ?auto_1876003 ) ) ( not ( = ?auto_1876000 ?auto_1876004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1876001 ?auto_1876002 ?auto_1876003 )
      ( MAKE-14CRATE-VERIFY ?auto_1875989 ?auto_1875990 ?auto_1875991 ?auto_1875992 ?auto_1875993 ?auto_1875994 ?auto_1875995 ?auto_1875996 ?auto_1875997 ?auto_1875998 ?auto_1875999 ?auto_1876000 ?auto_1876001 ?auto_1876002 ?auto_1876003 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1876193 - SURFACE
      ?auto_1876194 - SURFACE
      ?auto_1876195 - SURFACE
      ?auto_1876196 - SURFACE
      ?auto_1876197 - SURFACE
      ?auto_1876198 - SURFACE
      ?auto_1876199 - SURFACE
      ?auto_1876200 - SURFACE
      ?auto_1876201 - SURFACE
      ?auto_1876202 - SURFACE
      ?auto_1876203 - SURFACE
      ?auto_1876204 - SURFACE
      ?auto_1876205 - SURFACE
      ?auto_1876206 - SURFACE
      ?auto_1876207 - SURFACE
    )
    :vars
    (
      ?auto_1876210 - HOIST
      ?auto_1876213 - PLACE
      ?auto_1876211 - PLACE
      ?auto_1876212 - HOIST
      ?auto_1876208 - SURFACE
      ?auto_1876209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1876210 ?auto_1876213 ) ( IS-CRATE ?auto_1876207 ) ( not ( = ?auto_1876206 ?auto_1876207 ) ) ( not ( = ?auto_1876205 ?auto_1876206 ) ) ( not ( = ?auto_1876205 ?auto_1876207 ) ) ( not ( = ?auto_1876211 ?auto_1876213 ) ) ( HOIST-AT ?auto_1876212 ?auto_1876211 ) ( not ( = ?auto_1876210 ?auto_1876212 ) ) ( AVAILABLE ?auto_1876212 ) ( SURFACE-AT ?auto_1876207 ?auto_1876211 ) ( ON ?auto_1876207 ?auto_1876208 ) ( CLEAR ?auto_1876207 ) ( not ( = ?auto_1876206 ?auto_1876208 ) ) ( not ( = ?auto_1876207 ?auto_1876208 ) ) ( not ( = ?auto_1876205 ?auto_1876208 ) ) ( TRUCK-AT ?auto_1876209 ?auto_1876213 ) ( SURFACE-AT ?auto_1876205 ?auto_1876213 ) ( CLEAR ?auto_1876205 ) ( LIFTING ?auto_1876210 ?auto_1876206 ) ( IS-CRATE ?auto_1876206 ) ( ON ?auto_1876194 ?auto_1876193 ) ( ON ?auto_1876195 ?auto_1876194 ) ( ON ?auto_1876196 ?auto_1876195 ) ( ON ?auto_1876197 ?auto_1876196 ) ( ON ?auto_1876198 ?auto_1876197 ) ( ON ?auto_1876199 ?auto_1876198 ) ( ON ?auto_1876200 ?auto_1876199 ) ( ON ?auto_1876201 ?auto_1876200 ) ( ON ?auto_1876202 ?auto_1876201 ) ( ON ?auto_1876203 ?auto_1876202 ) ( ON ?auto_1876204 ?auto_1876203 ) ( ON ?auto_1876205 ?auto_1876204 ) ( not ( = ?auto_1876193 ?auto_1876194 ) ) ( not ( = ?auto_1876193 ?auto_1876195 ) ) ( not ( = ?auto_1876193 ?auto_1876196 ) ) ( not ( = ?auto_1876193 ?auto_1876197 ) ) ( not ( = ?auto_1876193 ?auto_1876198 ) ) ( not ( = ?auto_1876193 ?auto_1876199 ) ) ( not ( = ?auto_1876193 ?auto_1876200 ) ) ( not ( = ?auto_1876193 ?auto_1876201 ) ) ( not ( = ?auto_1876193 ?auto_1876202 ) ) ( not ( = ?auto_1876193 ?auto_1876203 ) ) ( not ( = ?auto_1876193 ?auto_1876204 ) ) ( not ( = ?auto_1876193 ?auto_1876205 ) ) ( not ( = ?auto_1876193 ?auto_1876206 ) ) ( not ( = ?auto_1876193 ?auto_1876207 ) ) ( not ( = ?auto_1876193 ?auto_1876208 ) ) ( not ( = ?auto_1876194 ?auto_1876195 ) ) ( not ( = ?auto_1876194 ?auto_1876196 ) ) ( not ( = ?auto_1876194 ?auto_1876197 ) ) ( not ( = ?auto_1876194 ?auto_1876198 ) ) ( not ( = ?auto_1876194 ?auto_1876199 ) ) ( not ( = ?auto_1876194 ?auto_1876200 ) ) ( not ( = ?auto_1876194 ?auto_1876201 ) ) ( not ( = ?auto_1876194 ?auto_1876202 ) ) ( not ( = ?auto_1876194 ?auto_1876203 ) ) ( not ( = ?auto_1876194 ?auto_1876204 ) ) ( not ( = ?auto_1876194 ?auto_1876205 ) ) ( not ( = ?auto_1876194 ?auto_1876206 ) ) ( not ( = ?auto_1876194 ?auto_1876207 ) ) ( not ( = ?auto_1876194 ?auto_1876208 ) ) ( not ( = ?auto_1876195 ?auto_1876196 ) ) ( not ( = ?auto_1876195 ?auto_1876197 ) ) ( not ( = ?auto_1876195 ?auto_1876198 ) ) ( not ( = ?auto_1876195 ?auto_1876199 ) ) ( not ( = ?auto_1876195 ?auto_1876200 ) ) ( not ( = ?auto_1876195 ?auto_1876201 ) ) ( not ( = ?auto_1876195 ?auto_1876202 ) ) ( not ( = ?auto_1876195 ?auto_1876203 ) ) ( not ( = ?auto_1876195 ?auto_1876204 ) ) ( not ( = ?auto_1876195 ?auto_1876205 ) ) ( not ( = ?auto_1876195 ?auto_1876206 ) ) ( not ( = ?auto_1876195 ?auto_1876207 ) ) ( not ( = ?auto_1876195 ?auto_1876208 ) ) ( not ( = ?auto_1876196 ?auto_1876197 ) ) ( not ( = ?auto_1876196 ?auto_1876198 ) ) ( not ( = ?auto_1876196 ?auto_1876199 ) ) ( not ( = ?auto_1876196 ?auto_1876200 ) ) ( not ( = ?auto_1876196 ?auto_1876201 ) ) ( not ( = ?auto_1876196 ?auto_1876202 ) ) ( not ( = ?auto_1876196 ?auto_1876203 ) ) ( not ( = ?auto_1876196 ?auto_1876204 ) ) ( not ( = ?auto_1876196 ?auto_1876205 ) ) ( not ( = ?auto_1876196 ?auto_1876206 ) ) ( not ( = ?auto_1876196 ?auto_1876207 ) ) ( not ( = ?auto_1876196 ?auto_1876208 ) ) ( not ( = ?auto_1876197 ?auto_1876198 ) ) ( not ( = ?auto_1876197 ?auto_1876199 ) ) ( not ( = ?auto_1876197 ?auto_1876200 ) ) ( not ( = ?auto_1876197 ?auto_1876201 ) ) ( not ( = ?auto_1876197 ?auto_1876202 ) ) ( not ( = ?auto_1876197 ?auto_1876203 ) ) ( not ( = ?auto_1876197 ?auto_1876204 ) ) ( not ( = ?auto_1876197 ?auto_1876205 ) ) ( not ( = ?auto_1876197 ?auto_1876206 ) ) ( not ( = ?auto_1876197 ?auto_1876207 ) ) ( not ( = ?auto_1876197 ?auto_1876208 ) ) ( not ( = ?auto_1876198 ?auto_1876199 ) ) ( not ( = ?auto_1876198 ?auto_1876200 ) ) ( not ( = ?auto_1876198 ?auto_1876201 ) ) ( not ( = ?auto_1876198 ?auto_1876202 ) ) ( not ( = ?auto_1876198 ?auto_1876203 ) ) ( not ( = ?auto_1876198 ?auto_1876204 ) ) ( not ( = ?auto_1876198 ?auto_1876205 ) ) ( not ( = ?auto_1876198 ?auto_1876206 ) ) ( not ( = ?auto_1876198 ?auto_1876207 ) ) ( not ( = ?auto_1876198 ?auto_1876208 ) ) ( not ( = ?auto_1876199 ?auto_1876200 ) ) ( not ( = ?auto_1876199 ?auto_1876201 ) ) ( not ( = ?auto_1876199 ?auto_1876202 ) ) ( not ( = ?auto_1876199 ?auto_1876203 ) ) ( not ( = ?auto_1876199 ?auto_1876204 ) ) ( not ( = ?auto_1876199 ?auto_1876205 ) ) ( not ( = ?auto_1876199 ?auto_1876206 ) ) ( not ( = ?auto_1876199 ?auto_1876207 ) ) ( not ( = ?auto_1876199 ?auto_1876208 ) ) ( not ( = ?auto_1876200 ?auto_1876201 ) ) ( not ( = ?auto_1876200 ?auto_1876202 ) ) ( not ( = ?auto_1876200 ?auto_1876203 ) ) ( not ( = ?auto_1876200 ?auto_1876204 ) ) ( not ( = ?auto_1876200 ?auto_1876205 ) ) ( not ( = ?auto_1876200 ?auto_1876206 ) ) ( not ( = ?auto_1876200 ?auto_1876207 ) ) ( not ( = ?auto_1876200 ?auto_1876208 ) ) ( not ( = ?auto_1876201 ?auto_1876202 ) ) ( not ( = ?auto_1876201 ?auto_1876203 ) ) ( not ( = ?auto_1876201 ?auto_1876204 ) ) ( not ( = ?auto_1876201 ?auto_1876205 ) ) ( not ( = ?auto_1876201 ?auto_1876206 ) ) ( not ( = ?auto_1876201 ?auto_1876207 ) ) ( not ( = ?auto_1876201 ?auto_1876208 ) ) ( not ( = ?auto_1876202 ?auto_1876203 ) ) ( not ( = ?auto_1876202 ?auto_1876204 ) ) ( not ( = ?auto_1876202 ?auto_1876205 ) ) ( not ( = ?auto_1876202 ?auto_1876206 ) ) ( not ( = ?auto_1876202 ?auto_1876207 ) ) ( not ( = ?auto_1876202 ?auto_1876208 ) ) ( not ( = ?auto_1876203 ?auto_1876204 ) ) ( not ( = ?auto_1876203 ?auto_1876205 ) ) ( not ( = ?auto_1876203 ?auto_1876206 ) ) ( not ( = ?auto_1876203 ?auto_1876207 ) ) ( not ( = ?auto_1876203 ?auto_1876208 ) ) ( not ( = ?auto_1876204 ?auto_1876205 ) ) ( not ( = ?auto_1876204 ?auto_1876206 ) ) ( not ( = ?auto_1876204 ?auto_1876207 ) ) ( not ( = ?auto_1876204 ?auto_1876208 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1876205 ?auto_1876206 ?auto_1876207 )
      ( MAKE-14CRATE-VERIFY ?auto_1876193 ?auto_1876194 ?auto_1876195 ?auto_1876196 ?auto_1876197 ?auto_1876198 ?auto_1876199 ?auto_1876200 ?auto_1876201 ?auto_1876202 ?auto_1876203 ?auto_1876204 ?auto_1876205 ?auto_1876206 ?auto_1876207 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1876397 - SURFACE
      ?auto_1876398 - SURFACE
      ?auto_1876399 - SURFACE
      ?auto_1876400 - SURFACE
      ?auto_1876401 - SURFACE
      ?auto_1876402 - SURFACE
      ?auto_1876403 - SURFACE
      ?auto_1876404 - SURFACE
      ?auto_1876405 - SURFACE
      ?auto_1876406 - SURFACE
      ?auto_1876407 - SURFACE
      ?auto_1876408 - SURFACE
      ?auto_1876409 - SURFACE
      ?auto_1876410 - SURFACE
      ?auto_1876411 - SURFACE
    )
    :vars
    (
      ?auto_1876416 - HOIST
      ?auto_1876417 - PLACE
      ?auto_1876414 - PLACE
      ?auto_1876413 - HOIST
      ?auto_1876412 - SURFACE
      ?auto_1876415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1876416 ?auto_1876417 ) ( IS-CRATE ?auto_1876411 ) ( not ( = ?auto_1876410 ?auto_1876411 ) ) ( not ( = ?auto_1876409 ?auto_1876410 ) ) ( not ( = ?auto_1876409 ?auto_1876411 ) ) ( not ( = ?auto_1876414 ?auto_1876417 ) ) ( HOIST-AT ?auto_1876413 ?auto_1876414 ) ( not ( = ?auto_1876416 ?auto_1876413 ) ) ( AVAILABLE ?auto_1876413 ) ( SURFACE-AT ?auto_1876411 ?auto_1876414 ) ( ON ?auto_1876411 ?auto_1876412 ) ( CLEAR ?auto_1876411 ) ( not ( = ?auto_1876410 ?auto_1876412 ) ) ( not ( = ?auto_1876411 ?auto_1876412 ) ) ( not ( = ?auto_1876409 ?auto_1876412 ) ) ( TRUCK-AT ?auto_1876415 ?auto_1876417 ) ( SURFACE-AT ?auto_1876409 ?auto_1876417 ) ( CLEAR ?auto_1876409 ) ( IS-CRATE ?auto_1876410 ) ( AVAILABLE ?auto_1876416 ) ( IN ?auto_1876410 ?auto_1876415 ) ( ON ?auto_1876398 ?auto_1876397 ) ( ON ?auto_1876399 ?auto_1876398 ) ( ON ?auto_1876400 ?auto_1876399 ) ( ON ?auto_1876401 ?auto_1876400 ) ( ON ?auto_1876402 ?auto_1876401 ) ( ON ?auto_1876403 ?auto_1876402 ) ( ON ?auto_1876404 ?auto_1876403 ) ( ON ?auto_1876405 ?auto_1876404 ) ( ON ?auto_1876406 ?auto_1876405 ) ( ON ?auto_1876407 ?auto_1876406 ) ( ON ?auto_1876408 ?auto_1876407 ) ( ON ?auto_1876409 ?auto_1876408 ) ( not ( = ?auto_1876397 ?auto_1876398 ) ) ( not ( = ?auto_1876397 ?auto_1876399 ) ) ( not ( = ?auto_1876397 ?auto_1876400 ) ) ( not ( = ?auto_1876397 ?auto_1876401 ) ) ( not ( = ?auto_1876397 ?auto_1876402 ) ) ( not ( = ?auto_1876397 ?auto_1876403 ) ) ( not ( = ?auto_1876397 ?auto_1876404 ) ) ( not ( = ?auto_1876397 ?auto_1876405 ) ) ( not ( = ?auto_1876397 ?auto_1876406 ) ) ( not ( = ?auto_1876397 ?auto_1876407 ) ) ( not ( = ?auto_1876397 ?auto_1876408 ) ) ( not ( = ?auto_1876397 ?auto_1876409 ) ) ( not ( = ?auto_1876397 ?auto_1876410 ) ) ( not ( = ?auto_1876397 ?auto_1876411 ) ) ( not ( = ?auto_1876397 ?auto_1876412 ) ) ( not ( = ?auto_1876398 ?auto_1876399 ) ) ( not ( = ?auto_1876398 ?auto_1876400 ) ) ( not ( = ?auto_1876398 ?auto_1876401 ) ) ( not ( = ?auto_1876398 ?auto_1876402 ) ) ( not ( = ?auto_1876398 ?auto_1876403 ) ) ( not ( = ?auto_1876398 ?auto_1876404 ) ) ( not ( = ?auto_1876398 ?auto_1876405 ) ) ( not ( = ?auto_1876398 ?auto_1876406 ) ) ( not ( = ?auto_1876398 ?auto_1876407 ) ) ( not ( = ?auto_1876398 ?auto_1876408 ) ) ( not ( = ?auto_1876398 ?auto_1876409 ) ) ( not ( = ?auto_1876398 ?auto_1876410 ) ) ( not ( = ?auto_1876398 ?auto_1876411 ) ) ( not ( = ?auto_1876398 ?auto_1876412 ) ) ( not ( = ?auto_1876399 ?auto_1876400 ) ) ( not ( = ?auto_1876399 ?auto_1876401 ) ) ( not ( = ?auto_1876399 ?auto_1876402 ) ) ( not ( = ?auto_1876399 ?auto_1876403 ) ) ( not ( = ?auto_1876399 ?auto_1876404 ) ) ( not ( = ?auto_1876399 ?auto_1876405 ) ) ( not ( = ?auto_1876399 ?auto_1876406 ) ) ( not ( = ?auto_1876399 ?auto_1876407 ) ) ( not ( = ?auto_1876399 ?auto_1876408 ) ) ( not ( = ?auto_1876399 ?auto_1876409 ) ) ( not ( = ?auto_1876399 ?auto_1876410 ) ) ( not ( = ?auto_1876399 ?auto_1876411 ) ) ( not ( = ?auto_1876399 ?auto_1876412 ) ) ( not ( = ?auto_1876400 ?auto_1876401 ) ) ( not ( = ?auto_1876400 ?auto_1876402 ) ) ( not ( = ?auto_1876400 ?auto_1876403 ) ) ( not ( = ?auto_1876400 ?auto_1876404 ) ) ( not ( = ?auto_1876400 ?auto_1876405 ) ) ( not ( = ?auto_1876400 ?auto_1876406 ) ) ( not ( = ?auto_1876400 ?auto_1876407 ) ) ( not ( = ?auto_1876400 ?auto_1876408 ) ) ( not ( = ?auto_1876400 ?auto_1876409 ) ) ( not ( = ?auto_1876400 ?auto_1876410 ) ) ( not ( = ?auto_1876400 ?auto_1876411 ) ) ( not ( = ?auto_1876400 ?auto_1876412 ) ) ( not ( = ?auto_1876401 ?auto_1876402 ) ) ( not ( = ?auto_1876401 ?auto_1876403 ) ) ( not ( = ?auto_1876401 ?auto_1876404 ) ) ( not ( = ?auto_1876401 ?auto_1876405 ) ) ( not ( = ?auto_1876401 ?auto_1876406 ) ) ( not ( = ?auto_1876401 ?auto_1876407 ) ) ( not ( = ?auto_1876401 ?auto_1876408 ) ) ( not ( = ?auto_1876401 ?auto_1876409 ) ) ( not ( = ?auto_1876401 ?auto_1876410 ) ) ( not ( = ?auto_1876401 ?auto_1876411 ) ) ( not ( = ?auto_1876401 ?auto_1876412 ) ) ( not ( = ?auto_1876402 ?auto_1876403 ) ) ( not ( = ?auto_1876402 ?auto_1876404 ) ) ( not ( = ?auto_1876402 ?auto_1876405 ) ) ( not ( = ?auto_1876402 ?auto_1876406 ) ) ( not ( = ?auto_1876402 ?auto_1876407 ) ) ( not ( = ?auto_1876402 ?auto_1876408 ) ) ( not ( = ?auto_1876402 ?auto_1876409 ) ) ( not ( = ?auto_1876402 ?auto_1876410 ) ) ( not ( = ?auto_1876402 ?auto_1876411 ) ) ( not ( = ?auto_1876402 ?auto_1876412 ) ) ( not ( = ?auto_1876403 ?auto_1876404 ) ) ( not ( = ?auto_1876403 ?auto_1876405 ) ) ( not ( = ?auto_1876403 ?auto_1876406 ) ) ( not ( = ?auto_1876403 ?auto_1876407 ) ) ( not ( = ?auto_1876403 ?auto_1876408 ) ) ( not ( = ?auto_1876403 ?auto_1876409 ) ) ( not ( = ?auto_1876403 ?auto_1876410 ) ) ( not ( = ?auto_1876403 ?auto_1876411 ) ) ( not ( = ?auto_1876403 ?auto_1876412 ) ) ( not ( = ?auto_1876404 ?auto_1876405 ) ) ( not ( = ?auto_1876404 ?auto_1876406 ) ) ( not ( = ?auto_1876404 ?auto_1876407 ) ) ( not ( = ?auto_1876404 ?auto_1876408 ) ) ( not ( = ?auto_1876404 ?auto_1876409 ) ) ( not ( = ?auto_1876404 ?auto_1876410 ) ) ( not ( = ?auto_1876404 ?auto_1876411 ) ) ( not ( = ?auto_1876404 ?auto_1876412 ) ) ( not ( = ?auto_1876405 ?auto_1876406 ) ) ( not ( = ?auto_1876405 ?auto_1876407 ) ) ( not ( = ?auto_1876405 ?auto_1876408 ) ) ( not ( = ?auto_1876405 ?auto_1876409 ) ) ( not ( = ?auto_1876405 ?auto_1876410 ) ) ( not ( = ?auto_1876405 ?auto_1876411 ) ) ( not ( = ?auto_1876405 ?auto_1876412 ) ) ( not ( = ?auto_1876406 ?auto_1876407 ) ) ( not ( = ?auto_1876406 ?auto_1876408 ) ) ( not ( = ?auto_1876406 ?auto_1876409 ) ) ( not ( = ?auto_1876406 ?auto_1876410 ) ) ( not ( = ?auto_1876406 ?auto_1876411 ) ) ( not ( = ?auto_1876406 ?auto_1876412 ) ) ( not ( = ?auto_1876407 ?auto_1876408 ) ) ( not ( = ?auto_1876407 ?auto_1876409 ) ) ( not ( = ?auto_1876407 ?auto_1876410 ) ) ( not ( = ?auto_1876407 ?auto_1876411 ) ) ( not ( = ?auto_1876407 ?auto_1876412 ) ) ( not ( = ?auto_1876408 ?auto_1876409 ) ) ( not ( = ?auto_1876408 ?auto_1876410 ) ) ( not ( = ?auto_1876408 ?auto_1876411 ) ) ( not ( = ?auto_1876408 ?auto_1876412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1876409 ?auto_1876410 ?auto_1876411 )
      ( MAKE-14CRATE-VERIFY ?auto_1876397 ?auto_1876398 ?auto_1876399 ?auto_1876400 ?auto_1876401 ?auto_1876402 ?auto_1876403 ?auto_1876404 ?auto_1876405 ?auto_1876406 ?auto_1876407 ?auto_1876408 ?auto_1876409 ?auto_1876410 ?auto_1876411 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1893554 - SURFACE
      ?auto_1893555 - SURFACE
      ?auto_1893556 - SURFACE
      ?auto_1893557 - SURFACE
      ?auto_1893558 - SURFACE
      ?auto_1893559 - SURFACE
      ?auto_1893560 - SURFACE
      ?auto_1893561 - SURFACE
      ?auto_1893562 - SURFACE
      ?auto_1893563 - SURFACE
      ?auto_1893564 - SURFACE
      ?auto_1893565 - SURFACE
      ?auto_1893566 - SURFACE
      ?auto_1893567 - SURFACE
      ?auto_1893568 - SURFACE
      ?auto_1893569 - SURFACE
    )
    :vars
    (
      ?auto_1893571 - HOIST
      ?auto_1893570 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1893571 ?auto_1893570 ) ( SURFACE-AT ?auto_1893568 ?auto_1893570 ) ( CLEAR ?auto_1893568 ) ( LIFTING ?auto_1893571 ?auto_1893569 ) ( IS-CRATE ?auto_1893569 ) ( not ( = ?auto_1893568 ?auto_1893569 ) ) ( ON ?auto_1893555 ?auto_1893554 ) ( ON ?auto_1893556 ?auto_1893555 ) ( ON ?auto_1893557 ?auto_1893556 ) ( ON ?auto_1893558 ?auto_1893557 ) ( ON ?auto_1893559 ?auto_1893558 ) ( ON ?auto_1893560 ?auto_1893559 ) ( ON ?auto_1893561 ?auto_1893560 ) ( ON ?auto_1893562 ?auto_1893561 ) ( ON ?auto_1893563 ?auto_1893562 ) ( ON ?auto_1893564 ?auto_1893563 ) ( ON ?auto_1893565 ?auto_1893564 ) ( ON ?auto_1893566 ?auto_1893565 ) ( ON ?auto_1893567 ?auto_1893566 ) ( ON ?auto_1893568 ?auto_1893567 ) ( not ( = ?auto_1893554 ?auto_1893555 ) ) ( not ( = ?auto_1893554 ?auto_1893556 ) ) ( not ( = ?auto_1893554 ?auto_1893557 ) ) ( not ( = ?auto_1893554 ?auto_1893558 ) ) ( not ( = ?auto_1893554 ?auto_1893559 ) ) ( not ( = ?auto_1893554 ?auto_1893560 ) ) ( not ( = ?auto_1893554 ?auto_1893561 ) ) ( not ( = ?auto_1893554 ?auto_1893562 ) ) ( not ( = ?auto_1893554 ?auto_1893563 ) ) ( not ( = ?auto_1893554 ?auto_1893564 ) ) ( not ( = ?auto_1893554 ?auto_1893565 ) ) ( not ( = ?auto_1893554 ?auto_1893566 ) ) ( not ( = ?auto_1893554 ?auto_1893567 ) ) ( not ( = ?auto_1893554 ?auto_1893568 ) ) ( not ( = ?auto_1893554 ?auto_1893569 ) ) ( not ( = ?auto_1893555 ?auto_1893556 ) ) ( not ( = ?auto_1893555 ?auto_1893557 ) ) ( not ( = ?auto_1893555 ?auto_1893558 ) ) ( not ( = ?auto_1893555 ?auto_1893559 ) ) ( not ( = ?auto_1893555 ?auto_1893560 ) ) ( not ( = ?auto_1893555 ?auto_1893561 ) ) ( not ( = ?auto_1893555 ?auto_1893562 ) ) ( not ( = ?auto_1893555 ?auto_1893563 ) ) ( not ( = ?auto_1893555 ?auto_1893564 ) ) ( not ( = ?auto_1893555 ?auto_1893565 ) ) ( not ( = ?auto_1893555 ?auto_1893566 ) ) ( not ( = ?auto_1893555 ?auto_1893567 ) ) ( not ( = ?auto_1893555 ?auto_1893568 ) ) ( not ( = ?auto_1893555 ?auto_1893569 ) ) ( not ( = ?auto_1893556 ?auto_1893557 ) ) ( not ( = ?auto_1893556 ?auto_1893558 ) ) ( not ( = ?auto_1893556 ?auto_1893559 ) ) ( not ( = ?auto_1893556 ?auto_1893560 ) ) ( not ( = ?auto_1893556 ?auto_1893561 ) ) ( not ( = ?auto_1893556 ?auto_1893562 ) ) ( not ( = ?auto_1893556 ?auto_1893563 ) ) ( not ( = ?auto_1893556 ?auto_1893564 ) ) ( not ( = ?auto_1893556 ?auto_1893565 ) ) ( not ( = ?auto_1893556 ?auto_1893566 ) ) ( not ( = ?auto_1893556 ?auto_1893567 ) ) ( not ( = ?auto_1893556 ?auto_1893568 ) ) ( not ( = ?auto_1893556 ?auto_1893569 ) ) ( not ( = ?auto_1893557 ?auto_1893558 ) ) ( not ( = ?auto_1893557 ?auto_1893559 ) ) ( not ( = ?auto_1893557 ?auto_1893560 ) ) ( not ( = ?auto_1893557 ?auto_1893561 ) ) ( not ( = ?auto_1893557 ?auto_1893562 ) ) ( not ( = ?auto_1893557 ?auto_1893563 ) ) ( not ( = ?auto_1893557 ?auto_1893564 ) ) ( not ( = ?auto_1893557 ?auto_1893565 ) ) ( not ( = ?auto_1893557 ?auto_1893566 ) ) ( not ( = ?auto_1893557 ?auto_1893567 ) ) ( not ( = ?auto_1893557 ?auto_1893568 ) ) ( not ( = ?auto_1893557 ?auto_1893569 ) ) ( not ( = ?auto_1893558 ?auto_1893559 ) ) ( not ( = ?auto_1893558 ?auto_1893560 ) ) ( not ( = ?auto_1893558 ?auto_1893561 ) ) ( not ( = ?auto_1893558 ?auto_1893562 ) ) ( not ( = ?auto_1893558 ?auto_1893563 ) ) ( not ( = ?auto_1893558 ?auto_1893564 ) ) ( not ( = ?auto_1893558 ?auto_1893565 ) ) ( not ( = ?auto_1893558 ?auto_1893566 ) ) ( not ( = ?auto_1893558 ?auto_1893567 ) ) ( not ( = ?auto_1893558 ?auto_1893568 ) ) ( not ( = ?auto_1893558 ?auto_1893569 ) ) ( not ( = ?auto_1893559 ?auto_1893560 ) ) ( not ( = ?auto_1893559 ?auto_1893561 ) ) ( not ( = ?auto_1893559 ?auto_1893562 ) ) ( not ( = ?auto_1893559 ?auto_1893563 ) ) ( not ( = ?auto_1893559 ?auto_1893564 ) ) ( not ( = ?auto_1893559 ?auto_1893565 ) ) ( not ( = ?auto_1893559 ?auto_1893566 ) ) ( not ( = ?auto_1893559 ?auto_1893567 ) ) ( not ( = ?auto_1893559 ?auto_1893568 ) ) ( not ( = ?auto_1893559 ?auto_1893569 ) ) ( not ( = ?auto_1893560 ?auto_1893561 ) ) ( not ( = ?auto_1893560 ?auto_1893562 ) ) ( not ( = ?auto_1893560 ?auto_1893563 ) ) ( not ( = ?auto_1893560 ?auto_1893564 ) ) ( not ( = ?auto_1893560 ?auto_1893565 ) ) ( not ( = ?auto_1893560 ?auto_1893566 ) ) ( not ( = ?auto_1893560 ?auto_1893567 ) ) ( not ( = ?auto_1893560 ?auto_1893568 ) ) ( not ( = ?auto_1893560 ?auto_1893569 ) ) ( not ( = ?auto_1893561 ?auto_1893562 ) ) ( not ( = ?auto_1893561 ?auto_1893563 ) ) ( not ( = ?auto_1893561 ?auto_1893564 ) ) ( not ( = ?auto_1893561 ?auto_1893565 ) ) ( not ( = ?auto_1893561 ?auto_1893566 ) ) ( not ( = ?auto_1893561 ?auto_1893567 ) ) ( not ( = ?auto_1893561 ?auto_1893568 ) ) ( not ( = ?auto_1893561 ?auto_1893569 ) ) ( not ( = ?auto_1893562 ?auto_1893563 ) ) ( not ( = ?auto_1893562 ?auto_1893564 ) ) ( not ( = ?auto_1893562 ?auto_1893565 ) ) ( not ( = ?auto_1893562 ?auto_1893566 ) ) ( not ( = ?auto_1893562 ?auto_1893567 ) ) ( not ( = ?auto_1893562 ?auto_1893568 ) ) ( not ( = ?auto_1893562 ?auto_1893569 ) ) ( not ( = ?auto_1893563 ?auto_1893564 ) ) ( not ( = ?auto_1893563 ?auto_1893565 ) ) ( not ( = ?auto_1893563 ?auto_1893566 ) ) ( not ( = ?auto_1893563 ?auto_1893567 ) ) ( not ( = ?auto_1893563 ?auto_1893568 ) ) ( not ( = ?auto_1893563 ?auto_1893569 ) ) ( not ( = ?auto_1893564 ?auto_1893565 ) ) ( not ( = ?auto_1893564 ?auto_1893566 ) ) ( not ( = ?auto_1893564 ?auto_1893567 ) ) ( not ( = ?auto_1893564 ?auto_1893568 ) ) ( not ( = ?auto_1893564 ?auto_1893569 ) ) ( not ( = ?auto_1893565 ?auto_1893566 ) ) ( not ( = ?auto_1893565 ?auto_1893567 ) ) ( not ( = ?auto_1893565 ?auto_1893568 ) ) ( not ( = ?auto_1893565 ?auto_1893569 ) ) ( not ( = ?auto_1893566 ?auto_1893567 ) ) ( not ( = ?auto_1893566 ?auto_1893568 ) ) ( not ( = ?auto_1893566 ?auto_1893569 ) ) ( not ( = ?auto_1893567 ?auto_1893568 ) ) ( not ( = ?auto_1893567 ?auto_1893569 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1893568 ?auto_1893569 )
      ( MAKE-15CRATE-VERIFY ?auto_1893554 ?auto_1893555 ?auto_1893556 ?auto_1893557 ?auto_1893558 ?auto_1893559 ?auto_1893560 ?auto_1893561 ?auto_1893562 ?auto_1893563 ?auto_1893564 ?auto_1893565 ?auto_1893566 ?auto_1893567 ?auto_1893568 ?auto_1893569 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1893733 - SURFACE
      ?auto_1893734 - SURFACE
      ?auto_1893735 - SURFACE
      ?auto_1893736 - SURFACE
      ?auto_1893737 - SURFACE
      ?auto_1893738 - SURFACE
      ?auto_1893739 - SURFACE
      ?auto_1893740 - SURFACE
      ?auto_1893741 - SURFACE
      ?auto_1893742 - SURFACE
      ?auto_1893743 - SURFACE
      ?auto_1893744 - SURFACE
      ?auto_1893745 - SURFACE
      ?auto_1893746 - SURFACE
      ?auto_1893747 - SURFACE
      ?auto_1893748 - SURFACE
    )
    :vars
    (
      ?auto_1893751 - HOIST
      ?auto_1893750 - PLACE
      ?auto_1893749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1893751 ?auto_1893750 ) ( SURFACE-AT ?auto_1893747 ?auto_1893750 ) ( CLEAR ?auto_1893747 ) ( IS-CRATE ?auto_1893748 ) ( not ( = ?auto_1893747 ?auto_1893748 ) ) ( TRUCK-AT ?auto_1893749 ?auto_1893750 ) ( AVAILABLE ?auto_1893751 ) ( IN ?auto_1893748 ?auto_1893749 ) ( ON ?auto_1893747 ?auto_1893746 ) ( not ( = ?auto_1893746 ?auto_1893747 ) ) ( not ( = ?auto_1893746 ?auto_1893748 ) ) ( ON ?auto_1893734 ?auto_1893733 ) ( ON ?auto_1893735 ?auto_1893734 ) ( ON ?auto_1893736 ?auto_1893735 ) ( ON ?auto_1893737 ?auto_1893736 ) ( ON ?auto_1893738 ?auto_1893737 ) ( ON ?auto_1893739 ?auto_1893738 ) ( ON ?auto_1893740 ?auto_1893739 ) ( ON ?auto_1893741 ?auto_1893740 ) ( ON ?auto_1893742 ?auto_1893741 ) ( ON ?auto_1893743 ?auto_1893742 ) ( ON ?auto_1893744 ?auto_1893743 ) ( ON ?auto_1893745 ?auto_1893744 ) ( ON ?auto_1893746 ?auto_1893745 ) ( not ( = ?auto_1893733 ?auto_1893734 ) ) ( not ( = ?auto_1893733 ?auto_1893735 ) ) ( not ( = ?auto_1893733 ?auto_1893736 ) ) ( not ( = ?auto_1893733 ?auto_1893737 ) ) ( not ( = ?auto_1893733 ?auto_1893738 ) ) ( not ( = ?auto_1893733 ?auto_1893739 ) ) ( not ( = ?auto_1893733 ?auto_1893740 ) ) ( not ( = ?auto_1893733 ?auto_1893741 ) ) ( not ( = ?auto_1893733 ?auto_1893742 ) ) ( not ( = ?auto_1893733 ?auto_1893743 ) ) ( not ( = ?auto_1893733 ?auto_1893744 ) ) ( not ( = ?auto_1893733 ?auto_1893745 ) ) ( not ( = ?auto_1893733 ?auto_1893746 ) ) ( not ( = ?auto_1893733 ?auto_1893747 ) ) ( not ( = ?auto_1893733 ?auto_1893748 ) ) ( not ( = ?auto_1893734 ?auto_1893735 ) ) ( not ( = ?auto_1893734 ?auto_1893736 ) ) ( not ( = ?auto_1893734 ?auto_1893737 ) ) ( not ( = ?auto_1893734 ?auto_1893738 ) ) ( not ( = ?auto_1893734 ?auto_1893739 ) ) ( not ( = ?auto_1893734 ?auto_1893740 ) ) ( not ( = ?auto_1893734 ?auto_1893741 ) ) ( not ( = ?auto_1893734 ?auto_1893742 ) ) ( not ( = ?auto_1893734 ?auto_1893743 ) ) ( not ( = ?auto_1893734 ?auto_1893744 ) ) ( not ( = ?auto_1893734 ?auto_1893745 ) ) ( not ( = ?auto_1893734 ?auto_1893746 ) ) ( not ( = ?auto_1893734 ?auto_1893747 ) ) ( not ( = ?auto_1893734 ?auto_1893748 ) ) ( not ( = ?auto_1893735 ?auto_1893736 ) ) ( not ( = ?auto_1893735 ?auto_1893737 ) ) ( not ( = ?auto_1893735 ?auto_1893738 ) ) ( not ( = ?auto_1893735 ?auto_1893739 ) ) ( not ( = ?auto_1893735 ?auto_1893740 ) ) ( not ( = ?auto_1893735 ?auto_1893741 ) ) ( not ( = ?auto_1893735 ?auto_1893742 ) ) ( not ( = ?auto_1893735 ?auto_1893743 ) ) ( not ( = ?auto_1893735 ?auto_1893744 ) ) ( not ( = ?auto_1893735 ?auto_1893745 ) ) ( not ( = ?auto_1893735 ?auto_1893746 ) ) ( not ( = ?auto_1893735 ?auto_1893747 ) ) ( not ( = ?auto_1893735 ?auto_1893748 ) ) ( not ( = ?auto_1893736 ?auto_1893737 ) ) ( not ( = ?auto_1893736 ?auto_1893738 ) ) ( not ( = ?auto_1893736 ?auto_1893739 ) ) ( not ( = ?auto_1893736 ?auto_1893740 ) ) ( not ( = ?auto_1893736 ?auto_1893741 ) ) ( not ( = ?auto_1893736 ?auto_1893742 ) ) ( not ( = ?auto_1893736 ?auto_1893743 ) ) ( not ( = ?auto_1893736 ?auto_1893744 ) ) ( not ( = ?auto_1893736 ?auto_1893745 ) ) ( not ( = ?auto_1893736 ?auto_1893746 ) ) ( not ( = ?auto_1893736 ?auto_1893747 ) ) ( not ( = ?auto_1893736 ?auto_1893748 ) ) ( not ( = ?auto_1893737 ?auto_1893738 ) ) ( not ( = ?auto_1893737 ?auto_1893739 ) ) ( not ( = ?auto_1893737 ?auto_1893740 ) ) ( not ( = ?auto_1893737 ?auto_1893741 ) ) ( not ( = ?auto_1893737 ?auto_1893742 ) ) ( not ( = ?auto_1893737 ?auto_1893743 ) ) ( not ( = ?auto_1893737 ?auto_1893744 ) ) ( not ( = ?auto_1893737 ?auto_1893745 ) ) ( not ( = ?auto_1893737 ?auto_1893746 ) ) ( not ( = ?auto_1893737 ?auto_1893747 ) ) ( not ( = ?auto_1893737 ?auto_1893748 ) ) ( not ( = ?auto_1893738 ?auto_1893739 ) ) ( not ( = ?auto_1893738 ?auto_1893740 ) ) ( not ( = ?auto_1893738 ?auto_1893741 ) ) ( not ( = ?auto_1893738 ?auto_1893742 ) ) ( not ( = ?auto_1893738 ?auto_1893743 ) ) ( not ( = ?auto_1893738 ?auto_1893744 ) ) ( not ( = ?auto_1893738 ?auto_1893745 ) ) ( not ( = ?auto_1893738 ?auto_1893746 ) ) ( not ( = ?auto_1893738 ?auto_1893747 ) ) ( not ( = ?auto_1893738 ?auto_1893748 ) ) ( not ( = ?auto_1893739 ?auto_1893740 ) ) ( not ( = ?auto_1893739 ?auto_1893741 ) ) ( not ( = ?auto_1893739 ?auto_1893742 ) ) ( not ( = ?auto_1893739 ?auto_1893743 ) ) ( not ( = ?auto_1893739 ?auto_1893744 ) ) ( not ( = ?auto_1893739 ?auto_1893745 ) ) ( not ( = ?auto_1893739 ?auto_1893746 ) ) ( not ( = ?auto_1893739 ?auto_1893747 ) ) ( not ( = ?auto_1893739 ?auto_1893748 ) ) ( not ( = ?auto_1893740 ?auto_1893741 ) ) ( not ( = ?auto_1893740 ?auto_1893742 ) ) ( not ( = ?auto_1893740 ?auto_1893743 ) ) ( not ( = ?auto_1893740 ?auto_1893744 ) ) ( not ( = ?auto_1893740 ?auto_1893745 ) ) ( not ( = ?auto_1893740 ?auto_1893746 ) ) ( not ( = ?auto_1893740 ?auto_1893747 ) ) ( not ( = ?auto_1893740 ?auto_1893748 ) ) ( not ( = ?auto_1893741 ?auto_1893742 ) ) ( not ( = ?auto_1893741 ?auto_1893743 ) ) ( not ( = ?auto_1893741 ?auto_1893744 ) ) ( not ( = ?auto_1893741 ?auto_1893745 ) ) ( not ( = ?auto_1893741 ?auto_1893746 ) ) ( not ( = ?auto_1893741 ?auto_1893747 ) ) ( not ( = ?auto_1893741 ?auto_1893748 ) ) ( not ( = ?auto_1893742 ?auto_1893743 ) ) ( not ( = ?auto_1893742 ?auto_1893744 ) ) ( not ( = ?auto_1893742 ?auto_1893745 ) ) ( not ( = ?auto_1893742 ?auto_1893746 ) ) ( not ( = ?auto_1893742 ?auto_1893747 ) ) ( not ( = ?auto_1893742 ?auto_1893748 ) ) ( not ( = ?auto_1893743 ?auto_1893744 ) ) ( not ( = ?auto_1893743 ?auto_1893745 ) ) ( not ( = ?auto_1893743 ?auto_1893746 ) ) ( not ( = ?auto_1893743 ?auto_1893747 ) ) ( not ( = ?auto_1893743 ?auto_1893748 ) ) ( not ( = ?auto_1893744 ?auto_1893745 ) ) ( not ( = ?auto_1893744 ?auto_1893746 ) ) ( not ( = ?auto_1893744 ?auto_1893747 ) ) ( not ( = ?auto_1893744 ?auto_1893748 ) ) ( not ( = ?auto_1893745 ?auto_1893746 ) ) ( not ( = ?auto_1893745 ?auto_1893747 ) ) ( not ( = ?auto_1893745 ?auto_1893748 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1893746 ?auto_1893747 ?auto_1893748 )
      ( MAKE-15CRATE-VERIFY ?auto_1893733 ?auto_1893734 ?auto_1893735 ?auto_1893736 ?auto_1893737 ?auto_1893738 ?auto_1893739 ?auto_1893740 ?auto_1893741 ?auto_1893742 ?auto_1893743 ?auto_1893744 ?auto_1893745 ?auto_1893746 ?auto_1893747 ?auto_1893748 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1893928 - SURFACE
      ?auto_1893929 - SURFACE
      ?auto_1893930 - SURFACE
      ?auto_1893931 - SURFACE
      ?auto_1893932 - SURFACE
      ?auto_1893933 - SURFACE
      ?auto_1893934 - SURFACE
      ?auto_1893935 - SURFACE
      ?auto_1893936 - SURFACE
      ?auto_1893937 - SURFACE
      ?auto_1893938 - SURFACE
      ?auto_1893939 - SURFACE
      ?auto_1893940 - SURFACE
      ?auto_1893941 - SURFACE
      ?auto_1893942 - SURFACE
      ?auto_1893943 - SURFACE
    )
    :vars
    (
      ?auto_1893946 - HOIST
      ?auto_1893947 - PLACE
      ?auto_1893944 - TRUCK
      ?auto_1893945 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1893946 ?auto_1893947 ) ( SURFACE-AT ?auto_1893942 ?auto_1893947 ) ( CLEAR ?auto_1893942 ) ( IS-CRATE ?auto_1893943 ) ( not ( = ?auto_1893942 ?auto_1893943 ) ) ( AVAILABLE ?auto_1893946 ) ( IN ?auto_1893943 ?auto_1893944 ) ( ON ?auto_1893942 ?auto_1893941 ) ( not ( = ?auto_1893941 ?auto_1893942 ) ) ( not ( = ?auto_1893941 ?auto_1893943 ) ) ( TRUCK-AT ?auto_1893944 ?auto_1893945 ) ( not ( = ?auto_1893945 ?auto_1893947 ) ) ( ON ?auto_1893929 ?auto_1893928 ) ( ON ?auto_1893930 ?auto_1893929 ) ( ON ?auto_1893931 ?auto_1893930 ) ( ON ?auto_1893932 ?auto_1893931 ) ( ON ?auto_1893933 ?auto_1893932 ) ( ON ?auto_1893934 ?auto_1893933 ) ( ON ?auto_1893935 ?auto_1893934 ) ( ON ?auto_1893936 ?auto_1893935 ) ( ON ?auto_1893937 ?auto_1893936 ) ( ON ?auto_1893938 ?auto_1893937 ) ( ON ?auto_1893939 ?auto_1893938 ) ( ON ?auto_1893940 ?auto_1893939 ) ( ON ?auto_1893941 ?auto_1893940 ) ( not ( = ?auto_1893928 ?auto_1893929 ) ) ( not ( = ?auto_1893928 ?auto_1893930 ) ) ( not ( = ?auto_1893928 ?auto_1893931 ) ) ( not ( = ?auto_1893928 ?auto_1893932 ) ) ( not ( = ?auto_1893928 ?auto_1893933 ) ) ( not ( = ?auto_1893928 ?auto_1893934 ) ) ( not ( = ?auto_1893928 ?auto_1893935 ) ) ( not ( = ?auto_1893928 ?auto_1893936 ) ) ( not ( = ?auto_1893928 ?auto_1893937 ) ) ( not ( = ?auto_1893928 ?auto_1893938 ) ) ( not ( = ?auto_1893928 ?auto_1893939 ) ) ( not ( = ?auto_1893928 ?auto_1893940 ) ) ( not ( = ?auto_1893928 ?auto_1893941 ) ) ( not ( = ?auto_1893928 ?auto_1893942 ) ) ( not ( = ?auto_1893928 ?auto_1893943 ) ) ( not ( = ?auto_1893929 ?auto_1893930 ) ) ( not ( = ?auto_1893929 ?auto_1893931 ) ) ( not ( = ?auto_1893929 ?auto_1893932 ) ) ( not ( = ?auto_1893929 ?auto_1893933 ) ) ( not ( = ?auto_1893929 ?auto_1893934 ) ) ( not ( = ?auto_1893929 ?auto_1893935 ) ) ( not ( = ?auto_1893929 ?auto_1893936 ) ) ( not ( = ?auto_1893929 ?auto_1893937 ) ) ( not ( = ?auto_1893929 ?auto_1893938 ) ) ( not ( = ?auto_1893929 ?auto_1893939 ) ) ( not ( = ?auto_1893929 ?auto_1893940 ) ) ( not ( = ?auto_1893929 ?auto_1893941 ) ) ( not ( = ?auto_1893929 ?auto_1893942 ) ) ( not ( = ?auto_1893929 ?auto_1893943 ) ) ( not ( = ?auto_1893930 ?auto_1893931 ) ) ( not ( = ?auto_1893930 ?auto_1893932 ) ) ( not ( = ?auto_1893930 ?auto_1893933 ) ) ( not ( = ?auto_1893930 ?auto_1893934 ) ) ( not ( = ?auto_1893930 ?auto_1893935 ) ) ( not ( = ?auto_1893930 ?auto_1893936 ) ) ( not ( = ?auto_1893930 ?auto_1893937 ) ) ( not ( = ?auto_1893930 ?auto_1893938 ) ) ( not ( = ?auto_1893930 ?auto_1893939 ) ) ( not ( = ?auto_1893930 ?auto_1893940 ) ) ( not ( = ?auto_1893930 ?auto_1893941 ) ) ( not ( = ?auto_1893930 ?auto_1893942 ) ) ( not ( = ?auto_1893930 ?auto_1893943 ) ) ( not ( = ?auto_1893931 ?auto_1893932 ) ) ( not ( = ?auto_1893931 ?auto_1893933 ) ) ( not ( = ?auto_1893931 ?auto_1893934 ) ) ( not ( = ?auto_1893931 ?auto_1893935 ) ) ( not ( = ?auto_1893931 ?auto_1893936 ) ) ( not ( = ?auto_1893931 ?auto_1893937 ) ) ( not ( = ?auto_1893931 ?auto_1893938 ) ) ( not ( = ?auto_1893931 ?auto_1893939 ) ) ( not ( = ?auto_1893931 ?auto_1893940 ) ) ( not ( = ?auto_1893931 ?auto_1893941 ) ) ( not ( = ?auto_1893931 ?auto_1893942 ) ) ( not ( = ?auto_1893931 ?auto_1893943 ) ) ( not ( = ?auto_1893932 ?auto_1893933 ) ) ( not ( = ?auto_1893932 ?auto_1893934 ) ) ( not ( = ?auto_1893932 ?auto_1893935 ) ) ( not ( = ?auto_1893932 ?auto_1893936 ) ) ( not ( = ?auto_1893932 ?auto_1893937 ) ) ( not ( = ?auto_1893932 ?auto_1893938 ) ) ( not ( = ?auto_1893932 ?auto_1893939 ) ) ( not ( = ?auto_1893932 ?auto_1893940 ) ) ( not ( = ?auto_1893932 ?auto_1893941 ) ) ( not ( = ?auto_1893932 ?auto_1893942 ) ) ( not ( = ?auto_1893932 ?auto_1893943 ) ) ( not ( = ?auto_1893933 ?auto_1893934 ) ) ( not ( = ?auto_1893933 ?auto_1893935 ) ) ( not ( = ?auto_1893933 ?auto_1893936 ) ) ( not ( = ?auto_1893933 ?auto_1893937 ) ) ( not ( = ?auto_1893933 ?auto_1893938 ) ) ( not ( = ?auto_1893933 ?auto_1893939 ) ) ( not ( = ?auto_1893933 ?auto_1893940 ) ) ( not ( = ?auto_1893933 ?auto_1893941 ) ) ( not ( = ?auto_1893933 ?auto_1893942 ) ) ( not ( = ?auto_1893933 ?auto_1893943 ) ) ( not ( = ?auto_1893934 ?auto_1893935 ) ) ( not ( = ?auto_1893934 ?auto_1893936 ) ) ( not ( = ?auto_1893934 ?auto_1893937 ) ) ( not ( = ?auto_1893934 ?auto_1893938 ) ) ( not ( = ?auto_1893934 ?auto_1893939 ) ) ( not ( = ?auto_1893934 ?auto_1893940 ) ) ( not ( = ?auto_1893934 ?auto_1893941 ) ) ( not ( = ?auto_1893934 ?auto_1893942 ) ) ( not ( = ?auto_1893934 ?auto_1893943 ) ) ( not ( = ?auto_1893935 ?auto_1893936 ) ) ( not ( = ?auto_1893935 ?auto_1893937 ) ) ( not ( = ?auto_1893935 ?auto_1893938 ) ) ( not ( = ?auto_1893935 ?auto_1893939 ) ) ( not ( = ?auto_1893935 ?auto_1893940 ) ) ( not ( = ?auto_1893935 ?auto_1893941 ) ) ( not ( = ?auto_1893935 ?auto_1893942 ) ) ( not ( = ?auto_1893935 ?auto_1893943 ) ) ( not ( = ?auto_1893936 ?auto_1893937 ) ) ( not ( = ?auto_1893936 ?auto_1893938 ) ) ( not ( = ?auto_1893936 ?auto_1893939 ) ) ( not ( = ?auto_1893936 ?auto_1893940 ) ) ( not ( = ?auto_1893936 ?auto_1893941 ) ) ( not ( = ?auto_1893936 ?auto_1893942 ) ) ( not ( = ?auto_1893936 ?auto_1893943 ) ) ( not ( = ?auto_1893937 ?auto_1893938 ) ) ( not ( = ?auto_1893937 ?auto_1893939 ) ) ( not ( = ?auto_1893937 ?auto_1893940 ) ) ( not ( = ?auto_1893937 ?auto_1893941 ) ) ( not ( = ?auto_1893937 ?auto_1893942 ) ) ( not ( = ?auto_1893937 ?auto_1893943 ) ) ( not ( = ?auto_1893938 ?auto_1893939 ) ) ( not ( = ?auto_1893938 ?auto_1893940 ) ) ( not ( = ?auto_1893938 ?auto_1893941 ) ) ( not ( = ?auto_1893938 ?auto_1893942 ) ) ( not ( = ?auto_1893938 ?auto_1893943 ) ) ( not ( = ?auto_1893939 ?auto_1893940 ) ) ( not ( = ?auto_1893939 ?auto_1893941 ) ) ( not ( = ?auto_1893939 ?auto_1893942 ) ) ( not ( = ?auto_1893939 ?auto_1893943 ) ) ( not ( = ?auto_1893940 ?auto_1893941 ) ) ( not ( = ?auto_1893940 ?auto_1893942 ) ) ( not ( = ?auto_1893940 ?auto_1893943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1893941 ?auto_1893942 ?auto_1893943 )
      ( MAKE-15CRATE-VERIFY ?auto_1893928 ?auto_1893929 ?auto_1893930 ?auto_1893931 ?auto_1893932 ?auto_1893933 ?auto_1893934 ?auto_1893935 ?auto_1893936 ?auto_1893937 ?auto_1893938 ?auto_1893939 ?auto_1893940 ?auto_1893941 ?auto_1893942 ?auto_1893943 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1894138 - SURFACE
      ?auto_1894139 - SURFACE
      ?auto_1894140 - SURFACE
      ?auto_1894141 - SURFACE
      ?auto_1894142 - SURFACE
      ?auto_1894143 - SURFACE
      ?auto_1894144 - SURFACE
      ?auto_1894145 - SURFACE
      ?auto_1894146 - SURFACE
      ?auto_1894147 - SURFACE
      ?auto_1894148 - SURFACE
      ?auto_1894149 - SURFACE
      ?auto_1894150 - SURFACE
      ?auto_1894151 - SURFACE
      ?auto_1894152 - SURFACE
      ?auto_1894153 - SURFACE
    )
    :vars
    (
      ?auto_1894154 - HOIST
      ?auto_1894156 - PLACE
      ?auto_1894157 - TRUCK
      ?auto_1894158 - PLACE
      ?auto_1894155 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894154 ?auto_1894156 ) ( SURFACE-AT ?auto_1894152 ?auto_1894156 ) ( CLEAR ?auto_1894152 ) ( IS-CRATE ?auto_1894153 ) ( not ( = ?auto_1894152 ?auto_1894153 ) ) ( AVAILABLE ?auto_1894154 ) ( ON ?auto_1894152 ?auto_1894151 ) ( not ( = ?auto_1894151 ?auto_1894152 ) ) ( not ( = ?auto_1894151 ?auto_1894153 ) ) ( TRUCK-AT ?auto_1894157 ?auto_1894158 ) ( not ( = ?auto_1894158 ?auto_1894156 ) ) ( HOIST-AT ?auto_1894155 ?auto_1894158 ) ( LIFTING ?auto_1894155 ?auto_1894153 ) ( not ( = ?auto_1894154 ?auto_1894155 ) ) ( ON ?auto_1894139 ?auto_1894138 ) ( ON ?auto_1894140 ?auto_1894139 ) ( ON ?auto_1894141 ?auto_1894140 ) ( ON ?auto_1894142 ?auto_1894141 ) ( ON ?auto_1894143 ?auto_1894142 ) ( ON ?auto_1894144 ?auto_1894143 ) ( ON ?auto_1894145 ?auto_1894144 ) ( ON ?auto_1894146 ?auto_1894145 ) ( ON ?auto_1894147 ?auto_1894146 ) ( ON ?auto_1894148 ?auto_1894147 ) ( ON ?auto_1894149 ?auto_1894148 ) ( ON ?auto_1894150 ?auto_1894149 ) ( ON ?auto_1894151 ?auto_1894150 ) ( not ( = ?auto_1894138 ?auto_1894139 ) ) ( not ( = ?auto_1894138 ?auto_1894140 ) ) ( not ( = ?auto_1894138 ?auto_1894141 ) ) ( not ( = ?auto_1894138 ?auto_1894142 ) ) ( not ( = ?auto_1894138 ?auto_1894143 ) ) ( not ( = ?auto_1894138 ?auto_1894144 ) ) ( not ( = ?auto_1894138 ?auto_1894145 ) ) ( not ( = ?auto_1894138 ?auto_1894146 ) ) ( not ( = ?auto_1894138 ?auto_1894147 ) ) ( not ( = ?auto_1894138 ?auto_1894148 ) ) ( not ( = ?auto_1894138 ?auto_1894149 ) ) ( not ( = ?auto_1894138 ?auto_1894150 ) ) ( not ( = ?auto_1894138 ?auto_1894151 ) ) ( not ( = ?auto_1894138 ?auto_1894152 ) ) ( not ( = ?auto_1894138 ?auto_1894153 ) ) ( not ( = ?auto_1894139 ?auto_1894140 ) ) ( not ( = ?auto_1894139 ?auto_1894141 ) ) ( not ( = ?auto_1894139 ?auto_1894142 ) ) ( not ( = ?auto_1894139 ?auto_1894143 ) ) ( not ( = ?auto_1894139 ?auto_1894144 ) ) ( not ( = ?auto_1894139 ?auto_1894145 ) ) ( not ( = ?auto_1894139 ?auto_1894146 ) ) ( not ( = ?auto_1894139 ?auto_1894147 ) ) ( not ( = ?auto_1894139 ?auto_1894148 ) ) ( not ( = ?auto_1894139 ?auto_1894149 ) ) ( not ( = ?auto_1894139 ?auto_1894150 ) ) ( not ( = ?auto_1894139 ?auto_1894151 ) ) ( not ( = ?auto_1894139 ?auto_1894152 ) ) ( not ( = ?auto_1894139 ?auto_1894153 ) ) ( not ( = ?auto_1894140 ?auto_1894141 ) ) ( not ( = ?auto_1894140 ?auto_1894142 ) ) ( not ( = ?auto_1894140 ?auto_1894143 ) ) ( not ( = ?auto_1894140 ?auto_1894144 ) ) ( not ( = ?auto_1894140 ?auto_1894145 ) ) ( not ( = ?auto_1894140 ?auto_1894146 ) ) ( not ( = ?auto_1894140 ?auto_1894147 ) ) ( not ( = ?auto_1894140 ?auto_1894148 ) ) ( not ( = ?auto_1894140 ?auto_1894149 ) ) ( not ( = ?auto_1894140 ?auto_1894150 ) ) ( not ( = ?auto_1894140 ?auto_1894151 ) ) ( not ( = ?auto_1894140 ?auto_1894152 ) ) ( not ( = ?auto_1894140 ?auto_1894153 ) ) ( not ( = ?auto_1894141 ?auto_1894142 ) ) ( not ( = ?auto_1894141 ?auto_1894143 ) ) ( not ( = ?auto_1894141 ?auto_1894144 ) ) ( not ( = ?auto_1894141 ?auto_1894145 ) ) ( not ( = ?auto_1894141 ?auto_1894146 ) ) ( not ( = ?auto_1894141 ?auto_1894147 ) ) ( not ( = ?auto_1894141 ?auto_1894148 ) ) ( not ( = ?auto_1894141 ?auto_1894149 ) ) ( not ( = ?auto_1894141 ?auto_1894150 ) ) ( not ( = ?auto_1894141 ?auto_1894151 ) ) ( not ( = ?auto_1894141 ?auto_1894152 ) ) ( not ( = ?auto_1894141 ?auto_1894153 ) ) ( not ( = ?auto_1894142 ?auto_1894143 ) ) ( not ( = ?auto_1894142 ?auto_1894144 ) ) ( not ( = ?auto_1894142 ?auto_1894145 ) ) ( not ( = ?auto_1894142 ?auto_1894146 ) ) ( not ( = ?auto_1894142 ?auto_1894147 ) ) ( not ( = ?auto_1894142 ?auto_1894148 ) ) ( not ( = ?auto_1894142 ?auto_1894149 ) ) ( not ( = ?auto_1894142 ?auto_1894150 ) ) ( not ( = ?auto_1894142 ?auto_1894151 ) ) ( not ( = ?auto_1894142 ?auto_1894152 ) ) ( not ( = ?auto_1894142 ?auto_1894153 ) ) ( not ( = ?auto_1894143 ?auto_1894144 ) ) ( not ( = ?auto_1894143 ?auto_1894145 ) ) ( not ( = ?auto_1894143 ?auto_1894146 ) ) ( not ( = ?auto_1894143 ?auto_1894147 ) ) ( not ( = ?auto_1894143 ?auto_1894148 ) ) ( not ( = ?auto_1894143 ?auto_1894149 ) ) ( not ( = ?auto_1894143 ?auto_1894150 ) ) ( not ( = ?auto_1894143 ?auto_1894151 ) ) ( not ( = ?auto_1894143 ?auto_1894152 ) ) ( not ( = ?auto_1894143 ?auto_1894153 ) ) ( not ( = ?auto_1894144 ?auto_1894145 ) ) ( not ( = ?auto_1894144 ?auto_1894146 ) ) ( not ( = ?auto_1894144 ?auto_1894147 ) ) ( not ( = ?auto_1894144 ?auto_1894148 ) ) ( not ( = ?auto_1894144 ?auto_1894149 ) ) ( not ( = ?auto_1894144 ?auto_1894150 ) ) ( not ( = ?auto_1894144 ?auto_1894151 ) ) ( not ( = ?auto_1894144 ?auto_1894152 ) ) ( not ( = ?auto_1894144 ?auto_1894153 ) ) ( not ( = ?auto_1894145 ?auto_1894146 ) ) ( not ( = ?auto_1894145 ?auto_1894147 ) ) ( not ( = ?auto_1894145 ?auto_1894148 ) ) ( not ( = ?auto_1894145 ?auto_1894149 ) ) ( not ( = ?auto_1894145 ?auto_1894150 ) ) ( not ( = ?auto_1894145 ?auto_1894151 ) ) ( not ( = ?auto_1894145 ?auto_1894152 ) ) ( not ( = ?auto_1894145 ?auto_1894153 ) ) ( not ( = ?auto_1894146 ?auto_1894147 ) ) ( not ( = ?auto_1894146 ?auto_1894148 ) ) ( not ( = ?auto_1894146 ?auto_1894149 ) ) ( not ( = ?auto_1894146 ?auto_1894150 ) ) ( not ( = ?auto_1894146 ?auto_1894151 ) ) ( not ( = ?auto_1894146 ?auto_1894152 ) ) ( not ( = ?auto_1894146 ?auto_1894153 ) ) ( not ( = ?auto_1894147 ?auto_1894148 ) ) ( not ( = ?auto_1894147 ?auto_1894149 ) ) ( not ( = ?auto_1894147 ?auto_1894150 ) ) ( not ( = ?auto_1894147 ?auto_1894151 ) ) ( not ( = ?auto_1894147 ?auto_1894152 ) ) ( not ( = ?auto_1894147 ?auto_1894153 ) ) ( not ( = ?auto_1894148 ?auto_1894149 ) ) ( not ( = ?auto_1894148 ?auto_1894150 ) ) ( not ( = ?auto_1894148 ?auto_1894151 ) ) ( not ( = ?auto_1894148 ?auto_1894152 ) ) ( not ( = ?auto_1894148 ?auto_1894153 ) ) ( not ( = ?auto_1894149 ?auto_1894150 ) ) ( not ( = ?auto_1894149 ?auto_1894151 ) ) ( not ( = ?auto_1894149 ?auto_1894152 ) ) ( not ( = ?auto_1894149 ?auto_1894153 ) ) ( not ( = ?auto_1894150 ?auto_1894151 ) ) ( not ( = ?auto_1894150 ?auto_1894152 ) ) ( not ( = ?auto_1894150 ?auto_1894153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1894151 ?auto_1894152 ?auto_1894153 )
      ( MAKE-15CRATE-VERIFY ?auto_1894138 ?auto_1894139 ?auto_1894140 ?auto_1894141 ?auto_1894142 ?auto_1894143 ?auto_1894144 ?auto_1894145 ?auto_1894146 ?auto_1894147 ?auto_1894148 ?auto_1894149 ?auto_1894150 ?auto_1894151 ?auto_1894152 ?auto_1894153 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1894363 - SURFACE
      ?auto_1894364 - SURFACE
      ?auto_1894365 - SURFACE
      ?auto_1894366 - SURFACE
      ?auto_1894367 - SURFACE
      ?auto_1894368 - SURFACE
      ?auto_1894369 - SURFACE
      ?auto_1894370 - SURFACE
      ?auto_1894371 - SURFACE
      ?auto_1894372 - SURFACE
      ?auto_1894373 - SURFACE
      ?auto_1894374 - SURFACE
      ?auto_1894375 - SURFACE
      ?auto_1894376 - SURFACE
      ?auto_1894377 - SURFACE
      ?auto_1894378 - SURFACE
    )
    :vars
    (
      ?auto_1894382 - HOIST
      ?auto_1894379 - PLACE
      ?auto_1894380 - TRUCK
      ?auto_1894384 - PLACE
      ?auto_1894383 - HOIST
      ?auto_1894381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894382 ?auto_1894379 ) ( SURFACE-AT ?auto_1894377 ?auto_1894379 ) ( CLEAR ?auto_1894377 ) ( IS-CRATE ?auto_1894378 ) ( not ( = ?auto_1894377 ?auto_1894378 ) ) ( AVAILABLE ?auto_1894382 ) ( ON ?auto_1894377 ?auto_1894376 ) ( not ( = ?auto_1894376 ?auto_1894377 ) ) ( not ( = ?auto_1894376 ?auto_1894378 ) ) ( TRUCK-AT ?auto_1894380 ?auto_1894384 ) ( not ( = ?auto_1894384 ?auto_1894379 ) ) ( HOIST-AT ?auto_1894383 ?auto_1894384 ) ( not ( = ?auto_1894382 ?auto_1894383 ) ) ( AVAILABLE ?auto_1894383 ) ( SURFACE-AT ?auto_1894378 ?auto_1894384 ) ( ON ?auto_1894378 ?auto_1894381 ) ( CLEAR ?auto_1894378 ) ( not ( = ?auto_1894377 ?auto_1894381 ) ) ( not ( = ?auto_1894378 ?auto_1894381 ) ) ( not ( = ?auto_1894376 ?auto_1894381 ) ) ( ON ?auto_1894364 ?auto_1894363 ) ( ON ?auto_1894365 ?auto_1894364 ) ( ON ?auto_1894366 ?auto_1894365 ) ( ON ?auto_1894367 ?auto_1894366 ) ( ON ?auto_1894368 ?auto_1894367 ) ( ON ?auto_1894369 ?auto_1894368 ) ( ON ?auto_1894370 ?auto_1894369 ) ( ON ?auto_1894371 ?auto_1894370 ) ( ON ?auto_1894372 ?auto_1894371 ) ( ON ?auto_1894373 ?auto_1894372 ) ( ON ?auto_1894374 ?auto_1894373 ) ( ON ?auto_1894375 ?auto_1894374 ) ( ON ?auto_1894376 ?auto_1894375 ) ( not ( = ?auto_1894363 ?auto_1894364 ) ) ( not ( = ?auto_1894363 ?auto_1894365 ) ) ( not ( = ?auto_1894363 ?auto_1894366 ) ) ( not ( = ?auto_1894363 ?auto_1894367 ) ) ( not ( = ?auto_1894363 ?auto_1894368 ) ) ( not ( = ?auto_1894363 ?auto_1894369 ) ) ( not ( = ?auto_1894363 ?auto_1894370 ) ) ( not ( = ?auto_1894363 ?auto_1894371 ) ) ( not ( = ?auto_1894363 ?auto_1894372 ) ) ( not ( = ?auto_1894363 ?auto_1894373 ) ) ( not ( = ?auto_1894363 ?auto_1894374 ) ) ( not ( = ?auto_1894363 ?auto_1894375 ) ) ( not ( = ?auto_1894363 ?auto_1894376 ) ) ( not ( = ?auto_1894363 ?auto_1894377 ) ) ( not ( = ?auto_1894363 ?auto_1894378 ) ) ( not ( = ?auto_1894363 ?auto_1894381 ) ) ( not ( = ?auto_1894364 ?auto_1894365 ) ) ( not ( = ?auto_1894364 ?auto_1894366 ) ) ( not ( = ?auto_1894364 ?auto_1894367 ) ) ( not ( = ?auto_1894364 ?auto_1894368 ) ) ( not ( = ?auto_1894364 ?auto_1894369 ) ) ( not ( = ?auto_1894364 ?auto_1894370 ) ) ( not ( = ?auto_1894364 ?auto_1894371 ) ) ( not ( = ?auto_1894364 ?auto_1894372 ) ) ( not ( = ?auto_1894364 ?auto_1894373 ) ) ( not ( = ?auto_1894364 ?auto_1894374 ) ) ( not ( = ?auto_1894364 ?auto_1894375 ) ) ( not ( = ?auto_1894364 ?auto_1894376 ) ) ( not ( = ?auto_1894364 ?auto_1894377 ) ) ( not ( = ?auto_1894364 ?auto_1894378 ) ) ( not ( = ?auto_1894364 ?auto_1894381 ) ) ( not ( = ?auto_1894365 ?auto_1894366 ) ) ( not ( = ?auto_1894365 ?auto_1894367 ) ) ( not ( = ?auto_1894365 ?auto_1894368 ) ) ( not ( = ?auto_1894365 ?auto_1894369 ) ) ( not ( = ?auto_1894365 ?auto_1894370 ) ) ( not ( = ?auto_1894365 ?auto_1894371 ) ) ( not ( = ?auto_1894365 ?auto_1894372 ) ) ( not ( = ?auto_1894365 ?auto_1894373 ) ) ( not ( = ?auto_1894365 ?auto_1894374 ) ) ( not ( = ?auto_1894365 ?auto_1894375 ) ) ( not ( = ?auto_1894365 ?auto_1894376 ) ) ( not ( = ?auto_1894365 ?auto_1894377 ) ) ( not ( = ?auto_1894365 ?auto_1894378 ) ) ( not ( = ?auto_1894365 ?auto_1894381 ) ) ( not ( = ?auto_1894366 ?auto_1894367 ) ) ( not ( = ?auto_1894366 ?auto_1894368 ) ) ( not ( = ?auto_1894366 ?auto_1894369 ) ) ( not ( = ?auto_1894366 ?auto_1894370 ) ) ( not ( = ?auto_1894366 ?auto_1894371 ) ) ( not ( = ?auto_1894366 ?auto_1894372 ) ) ( not ( = ?auto_1894366 ?auto_1894373 ) ) ( not ( = ?auto_1894366 ?auto_1894374 ) ) ( not ( = ?auto_1894366 ?auto_1894375 ) ) ( not ( = ?auto_1894366 ?auto_1894376 ) ) ( not ( = ?auto_1894366 ?auto_1894377 ) ) ( not ( = ?auto_1894366 ?auto_1894378 ) ) ( not ( = ?auto_1894366 ?auto_1894381 ) ) ( not ( = ?auto_1894367 ?auto_1894368 ) ) ( not ( = ?auto_1894367 ?auto_1894369 ) ) ( not ( = ?auto_1894367 ?auto_1894370 ) ) ( not ( = ?auto_1894367 ?auto_1894371 ) ) ( not ( = ?auto_1894367 ?auto_1894372 ) ) ( not ( = ?auto_1894367 ?auto_1894373 ) ) ( not ( = ?auto_1894367 ?auto_1894374 ) ) ( not ( = ?auto_1894367 ?auto_1894375 ) ) ( not ( = ?auto_1894367 ?auto_1894376 ) ) ( not ( = ?auto_1894367 ?auto_1894377 ) ) ( not ( = ?auto_1894367 ?auto_1894378 ) ) ( not ( = ?auto_1894367 ?auto_1894381 ) ) ( not ( = ?auto_1894368 ?auto_1894369 ) ) ( not ( = ?auto_1894368 ?auto_1894370 ) ) ( not ( = ?auto_1894368 ?auto_1894371 ) ) ( not ( = ?auto_1894368 ?auto_1894372 ) ) ( not ( = ?auto_1894368 ?auto_1894373 ) ) ( not ( = ?auto_1894368 ?auto_1894374 ) ) ( not ( = ?auto_1894368 ?auto_1894375 ) ) ( not ( = ?auto_1894368 ?auto_1894376 ) ) ( not ( = ?auto_1894368 ?auto_1894377 ) ) ( not ( = ?auto_1894368 ?auto_1894378 ) ) ( not ( = ?auto_1894368 ?auto_1894381 ) ) ( not ( = ?auto_1894369 ?auto_1894370 ) ) ( not ( = ?auto_1894369 ?auto_1894371 ) ) ( not ( = ?auto_1894369 ?auto_1894372 ) ) ( not ( = ?auto_1894369 ?auto_1894373 ) ) ( not ( = ?auto_1894369 ?auto_1894374 ) ) ( not ( = ?auto_1894369 ?auto_1894375 ) ) ( not ( = ?auto_1894369 ?auto_1894376 ) ) ( not ( = ?auto_1894369 ?auto_1894377 ) ) ( not ( = ?auto_1894369 ?auto_1894378 ) ) ( not ( = ?auto_1894369 ?auto_1894381 ) ) ( not ( = ?auto_1894370 ?auto_1894371 ) ) ( not ( = ?auto_1894370 ?auto_1894372 ) ) ( not ( = ?auto_1894370 ?auto_1894373 ) ) ( not ( = ?auto_1894370 ?auto_1894374 ) ) ( not ( = ?auto_1894370 ?auto_1894375 ) ) ( not ( = ?auto_1894370 ?auto_1894376 ) ) ( not ( = ?auto_1894370 ?auto_1894377 ) ) ( not ( = ?auto_1894370 ?auto_1894378 ) ) ( not ( = ?auto_1894370 ?auto_1894381 ) ) ( not ( = ?auto_1894371 ?auto_1894372 ) ) ( not ( = ?auto_1894371 ?auto_1894373 ) ) ( not ( = ?auto_1894371 ?auto_1894374 ) ) ( not ( = ?auto_1894371 ?auto_1894375 ) ) ( not ( = ?auto_1894371 ?auto_1894376 ) ) ( not ( = ?auto_1894371 ?auto_1894377 ) ) ( not ( = ?auto_1894371 ?auto_1894378 ) ) ( not ( = ?auto_1894371 ?auto_1894381 ) ) ( not ( = ?auto_1894372 ?auto_1894373 ) ) ( not ( = ?auto_1894372 ?auto_1894374 ) ) ( not ( = ?auto_1894372 ?auto_1894375 ) ) ( not ( = ?auto_1894372 ?auto_1894376 ) ) ( not ( = ?auto_1894372 ?auto_1894377 ) ) ( not ( = ?auto_1894372 ?auto_1894378 ) ) ( not ( = ?auto_1894372 ?auto_1894381 ) ) ( not ( = ?auto_1894373 ?auto_1894374 ) ) ( not ( = ?auto_1894373 ?auto_1894375 ) ) ( not ( = ?auto_1894373 ?auto_1894376 ) ) ( not ( = ?auto_1894373 ?auto_1894377 ) ) ( not ( = ?auto_1894373 ?auto_1894378 ) ) ( not ( = ?auto_1894373 ?auto_1894381 ) ) ( not ( = ?auto_1894374 ?auto_1894375 ) ) ( not ( = ?auto_1894374 ?auto_1894376 ) ) ( not ( = ?auto_1894374 ?auto_1894377 ) ) ( not ( = ?auto_1894374 ?auto_1894378 ) ) ( not ( = ?auto_1894374 ?auto_1894381 ) ) ( not ( = ?auto_1894375 ?auto_1894376 ) ) ( not ( = ?auto_1894375 ?auto_1894377 ) ) ( not ( = ?auto_1894375 ?auto_1894378 ) ) ( not ( = ?auto_1894375 ?auto_1894381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1894376 ?auto_1894377 ?auto_1894378 )
      ( MAKE-15CRATE-VERIFY ?auto_1894363 ?auto_1894364 ?auto_1894365 ?auto_1894366 ?auto_1894367 ?auto_1894368 ?auto_1894369 ?auto_1894370 ?auto_1894371 ?auto_1894372 ?auto_1894373 ?auto_1894374 ?auto_1894375 ?auto_1894376 ?auto_1894377 ?auto_1894378 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1894589 - SURFACE
      ?auto_1894590 - SURFACE
      ?auto_1894591 - SURFACE
      ?auto_1894592 - SURFACE
      ?auto_1894593 - SURFACE
      ?auto_1894594 - SURFACE
      ?auto_1894595 - SURFACE
      ?auto_1894596 - SURFACE
      ?auto_1894597 - SURFACE
      ?auto_1894598 - SURFACE
      ?auto_1894599 - SURFACE
      ?auto_1894600 - SURFACE
      ?auto_1894601 - SURFACE
      ?auto_1894602 - SURFACE
      ?auto_1894603 - SURFACE
      ?auto_1894604 - SURFACE
    )
    :vars
    (
      ?auto_1894606 - HOIST
      ?auto_1894607 - PLACE
      ?auto_1894609 - PLACE
      ?auto_1894610 - HOIST
      ?auto_1894605 - SURFACE
      ?auto_1894608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894606 ?auto_1894607 ) ( SURFACE-AT ?auto_1894603 ?auto_1894607 ) ( CLEAR ?auto_1894603 ) ( IS-CRATE ?auto_1894604 ) ( not ( = ?auto_1894603 ?auto_1894604 ) ) ( AVAILABLE ?auto_1894606 ) ( ON ?auto_1894603 ?auto_1894602 ) ( not ( = ?auto_1894602 ?auto_1894603 ) ) ( not ( = ?auto_1894602 ?auto_1894604 ) ) ( not ( = ?auto_1894609 ?auto_1894607 ) ) ( HOIST-AT ?auto_1894610 ?auto_1894609 ) ( not ( = ?auto_1894606 ?auto_1894610 ) ) ( AVAILABLE ?auto_1894610 ) ( SURFACE-AT ?auto_1894604 ?auto_1894609 ) ( ON ?auto_1894604 ?auto_1894605 ) ( CLEAR ?auto_1894604 ) ( not ( = ?auto_1894603 ?auto_1894605 ) ) ( not ( = ?auto_1894604 ?auto_1894605 ) ) ( not ( = ?auto_1894602 ?auto_1894605 ) ) ( TRUCK-AT ?auto_1894608 ?auto_1894607 ) ( ON ?auto_1894590 ?auto_1894589 ) ( ON ?auto_1894591 ?auto_1894590 ) ( ON ?auto_1894592 ?auto_1894591 ) ( ON ?auto_1894593 ?auto_1894592 ) ( ON ?auto_1894594 ?auto_1894593 ) ( ON ?auto_1894595 ?auto_1894594 ) ( ON ?auto_1894596 ?auto_1894595 ) ( ON ?auto_1894597 ?auto_1894596 ) ( ON ?auto_1894598 ?auto_1894597 ) ( ON ?auto_1894599 ?auto_1894598 ) ( ON ?auto_1894600 ?auto_1894599 ) ( ON ?auto_1894601 ?auto_1894600 ) ( ON ?auto_1894602 ?auto_1894601 ) ( not ( = ?auto_1894589 ?auto_1894590 ) ) ( not ( = ?auto_1894589 ?auto_1894591 ) ) ( not ( = ?auto_1894589 ?auto_1894592 ) ) ( not ( = ?auto_1894589 ?auto_1894593 ) ) ( not ( = ?auto_1894589 ?auto_1894594 ) ) ( not ( = ?auto_1894589 ?auto_1894595 ) ) ( not ( = ?auto_1894589 ?auto_1894596 ) ) ( not ( = ?auto_1894589 ?auto_1894597 ) ) ( not ( = ?auto_1894589 ?auto_1894598 ) ) ( not ( = ?auto_1894589 ?auto_1894599 ) ) ( not ( = ?auto_1894589 ?auto_1894600 ) ) ( not ( = ?auto_1894589 ?auto_1894601 ) ) ( not ( = ?auto_1894589 ?auto_1894602 ) ) ( not ( = ?auto_1894589 ?auto_1894603 ) ) ( not ( = ?auto_1894589 ?auto_1894604 ) ) ( not ( = ?auto_1894589 ?auto_1894605 ) ) ( not ( = ?auto_1894590 ?auto_1894591 ) ) ( not ( = ?auto_1894590 ?auto_1894592 ) ) ( not ( = ?auto_1894590 ?auto_1894593 ) ) ( not ( = ?auto_1894590 ?auto_1894594 ) ) ( not ( = ?auto_1894590 ?auto_1894595 ) ) ( not ( = ?auto_1894590 ?auto_1894596 ) ) ( not ( = ?auto_1894590 ?auto_1894597 ) ) ( not ( = ?auto_1894590 ?auto_1894598 ) ) ( not ( = ?auto_1894590 ?auto_1894599 ) ) ( not ( = ?auto_1894590 ?auto_1894600 ) ) ( not ( = ?auto_1894590 ?auto_1894601 ) ) ( not ( = ?auto_1894590 ?auto_1894602 ) ) ( not ( = ?auto_1894590 ?auto_1894603 ) ) ( not ( = ?auto_1894590 ?auto_1894604 ) ) ( not ( = ?auto_1894590 ?auto_1894605 ) ) ( not ( = ?auto_1894591 ?auto_1894592 ) ) ( not ( = ?auto_1894591 ?auto_1894593 ) ) ( not ( = ?auto_1894591 ?auto_1894594 ) ) ( not ( = ?auto_1894591 ?auto_1894595 ) ) ( not ( = ?auto_1894591 ?auto_1894596 ) ) ( not ( = ?auto_1894591 ?auto_1894597 ) ) ( not ( = ?auto_1894591 ?auto_1894598 ) ) ( not ( = ?auto_1894591 ?auto_1894599 ) ) ( not ( = ?auto_1894591 ?auto_1894600 ) ) ( not ( = ?auto_1894591 ?auto_1894601 ) ) ( not ( = ?auto_1894591 ?auto_1894602 ) ) ( not ( = ?auto_1894591 ?auto_1894603 ) ) ( not ( = ?auto_1894591 ?auto_1894604 ) ) ( not ( = ?auto_1894591 ?auto_1894605 ) ) ( not ( = ?auto_1894592 ?auto_1894593 ) ) ( not ( = ?auto_1894592 ?auto_1894594 ) ) ( not ( = ?auto_1894592 ?auto_1894595 ) ) ( not ( = ?auto_1894592 ?auto_1894596 ) ) ( not ( = ?auto_1894592 ?auto_1894597 ) ) ( not ( = ?auto_1894592 ?auto_1894598 ) ) ( not ( = ?auto_1894592 ?auto_1894599 ) ) ( not ( = ?auto_1894592 ?auto_1894600 ) ) ( not ( = ?auto_1894592 ?auto_1894601 ) ) ( not ( = ?auto_1894592 ?auto_1894602 ) ) ( not ( = ?auto_1894592 ?auto_1894603 ) ) ( not ( = ?auto_1894592 ?auto_1894604 ) ) ( not ( = ?auto_1894592 ?auto_1894605 ) ) ( not ( = ?auto_1894593 ?auto_1894594 ) ) ( not ( = ?auto_1894593 ?auto_1894595 ) ) ( not ( = ?auto_1894593 ?auto_1894596 ) ) ( not ( = ?auto_1894593 ?auto_1894597 ) ) ( not ( = ?auto_1894593 ?auto_1894598 ) ) ( not ( = ?auto_1894593 ?auto_1894599 ) ) ( not ( = ?auto_1894593 ?auto_1894600 ) ) ( not ( = ?auto_1894593 ?auto_1894601 ) ) ( not ( = ?auto_1894593 ?auto_1894602 ) ) ( not ( = ?auto_1894593 ?auto_1894603 ) ) ( not ( = ?auto_1894593 ?auto_1894604 ) ) ( not ( = ?auto_1894593 ?auto_1894605 ) ) ( not ( = ?auto_1894594 ?auto_1894595 ) ) ( not ( = ?auto_1894594 ?auto_1894596 ) ) ( not ( = ?auto_1894594 ?auto_1894597 ) ) ( not ( = ?auto_1894594 ?auto_1894598 ) ) ( not ( = ?auto_1894594 ?auto_1894599 ) ) ( not ( = ?auto_1894594 ?auto_1894600 ) ) ( not ( = ?auto_1894594 ?auto_1894601 ) ) ( not ( = ?auto_1894594 ?auto_1894602 ) ) ( not ( = ?auto_1894594 ?auto_1894603 ) ) ( not ( = ?auto_1894594 ?auto_1894604 ) ) ( not ( = ?auto_1894594 ?auto_1894605 ) ) ( not ( = ?auto_1894595 ?auto_1894596 ) ) ( not ( = ?auto_1894595 ?auto_1894597 ) ) ( not ( = ?auto_1894595 ?auto_1894598 ) ) ( not ( = ?auto_1894595 ?auto_1894599 ) ) ( not ( = ?auto_1894595 ?auto_1894600 ) ) ( not ( = ?auto_1894595 ?auto_1894601 ) ) ( not ( = ?auto_1894595 ?auto_1894602 ) ) ( not ( = ?auto_1894595 ?auto_1894603 ) ) ( not ( = ?auto_1894595 ?auto_1894604 ) ) ( not ( = ?auto_1894595 ?auto_1894605 ) ) ( not ( = ?auto_1894596 ?auto_1894597 ) ) ( not ( = ?auto_1894596 ?auto_1894598 ) ) ( not ( = ?auto_1894596 ?auto_1894599 ) ) ( not ( = ?auto_1894596 ?auto_1894600 ) ) ( not ( = ?auto_1894596 ?auto_1894601 ) ) ( not ( = ?auto_1894596 ?auto_1894602 ) ) ( not ( = ?auto_1894596 ?auto_1894603 ) ) ( not ( = ?auto_1894596 ?auto_1894604 ) ) ( not ( = ?auto_1894596 ?auto_1894605 ) ) ( not ( = ?auto_1894597 ?auto_1894598 ) ) ( not ( = ?auto_1894597 ?auto_1894599 ) ) ( not ( = ?auto_1894597 ?auto_1894600 ) ) ( not ( = ?auto_1894597 ?auto_1894601 ) ) ( not ( = ?auto_1894597 ?auto_1894602 ) ) ( not ( = ?auto_1894597 ?auto_1894603 ) ) ( not ( = ?auto_1894597 ?auto_1894604 ) ) ( not ( = ?auto_1894597 ?auto_1894605 ) ) ( not ( = ?auto_1894598 ?auto_1894599 ) ) ( not ( = ?auto_1894598 ?auto_1894600 ) ) ( not ( = ?auto_1894598 ?auto_1894601 ) ) ( not ( = ?auto_1894598 ?auto_1894602 ) ) ( not ( = ?auto_1894598 ?auto_1894603 ) ) ( not ( = ?auto_1894598 ?auto_1894604 ) ) ( not ( = ?auto_1894598 ?auto_1894605 ) ) ( not ( = ?auto_1894599 ?auto_1894600 ) ) ( not ( = ?auto_1894599 ?auto_1894601 ) ) ( not ( = ?auto_1894599 ?auto_1894602 ) ) ( not ( = ?auto_1894599 ?auto_1894603 ) ) ( not ( = ?auto_1894599 ?auto_1894604 ) ) ( not ( = ?auto_1894599 ?auto_1894605 ) ) ( not ( = ?auto_1894600 ?auto_1894601 ) ) ( not ( = ?auto_1894600 ?auto_1894602 ) ) ( not ( = ?auto_1894600 ?auto_1894603 ) ) ( not ( = ?auto_1894600 ?auto_1894604 ) ) ( not ( = ?auto_1894600 ?auto_1894605 ) ) ( not ( = ?auto_1894601 ?auto_1894602 ) ) ( not ( = ?auto_1894601 ?auto_1894603 ) ) ( not ( = ?auto_1894601 ?auto_1894604 ) ) ( not ( = ?auto_1894601 ?auto_1894605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1894602 ?auto_1894603 ?auto_1894604 )
      ( MAKE-15CRATE-VERIFY ?auto_1894589 ?auto_1894590 ?auto_1894591 ?auto_1894592 ?auto_1894593 ?auto_1894594 ?auto_1894595 ?auto_1894596 ?auto_1894597 ?auto_1894598 ?auto_1894599 ?auto_1894600 ?auto_1894601 ?auto_1894602 ?auto_1894603 ?auto_1894604 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1894815 - SURFACE
      ?auto_1894816 - SURFACE
      ?auto_1894817 - SURFACE
      ?auto_1894818 - SURFACE
      ?auto_1894819 - SURFACE
      ?auto_1894820 - SURFACE
      ?auto_1894821 - SURFACE
      ?auto_1894822 - SURFACE
      ?auto_1894823 - SURFACE
      ?auto_1894824 - SURFACE
      ?auto_1894825 - SURFACE
      ?auto_1894826 - SURFACE
      ?auto_1894827 - SURFACE
      ?auto_1894828 - SURFACE
      ?auto_1894829 - SURFACE
      ?auto_1894830 - SURFACE
    )
    :vars
    (
      ?auto_1894836 - HOIST
      ?auto_1894831 - PLACE
      ?auto_1894833 - PLACE
      ?auto_1894835 - HOIST
      ?auto_1894834 - SURFACE
      ?auto_1894832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894836 ?auto_1894831 ) ( IS-CRATE ?auto_1894830 ) ( not ( = ?auto_1894829 ?auto_1894830 ) ) ( not ( = ?auto_1894828 ?auto_1894829 ) ) ( not ( = ?auto_1894828 ?auto_1894830 ) ) ( not ( = ?auto_1894833 ?auto_1894831 ) ) ( HOIST-AT ?auto_1894835 ?auto_1894833 ) ( not ( = ?auto_1894836 ?auto_1894835 ) ) ( AVAILABLE ?auto_1894835 ) ( SURFACE-AT ?auto_1894830 ?auto_1894833 ) ( ON ?auto_1894830 ?auto_1894834 ) ( CLEAR ?auto_1894830 ) ( not ( = ?auto_1894829 ?auto_1894834 ) ) ( not ( = ?auto_1894830 ?auto_1894834 ) ) ( not ( = ?auto_1894828 ?auto_1894834 ) ) ( TRUCK-AT ?auto_1894832 ?auto_1894831 ) ( SURFACE-AT ?auto_1894828 ?auto_1894831 ) ( CLEAR ?auto_1894828 ) ( LIFTING ?auto_1894836 ?auto_1894829 ) ( IS-CRATE ?auto_1894829 ) ( ON ?auto_1894816 ?auto_1894815 ) ( ON ?auto_1894817 ?auto_1894816 ) ( ON ?auto_1894818 ?auto_1894817 ) ( ON ?auto_1894819 ?auto_1894818 ) ( ON ?auto_1894820 ?auto_1894819 ) ( ON ?auto_1894821 ?auto_1894820 ) ( ON ?auto_1894822 ?auto_1894821 ) ( ON ?auto_1894823 ?auto_1894822 ) ( ON ?auto_1894824 ?auto_1894823 ) ( ON ?auto_1894825 ?auto_1894824 ) ( ON ?auto_1894826 ?auto_1894825 ) ( ON ?auto_1894827 ?auto_1894826 ) ( ON ?auto_1894828 ?auto_1894827 ) ( not ( = ?auto_1894815 ?auto_1894816 ) ) ( not ( = ?auto_1894815 ?auto_1894817 ) ) ( not ( = ?auto_1894815 ?auto_1894818 ) ) ( not ( = ?auto_1894815 ?auto_1894819 ) ) ( not ( = ?auto_1894815 ?auto_1894820 ) ) ( not ( = ?auto_1894815 ?auto_1894821 ) ) ( not ( = ?auto_1894815 ?auto_1894822 ) ) ( not ( = ?auto_1894815 ?auto_1894823 ) ) ( not ( = ?auto_1894815 ?auto_1894824 ) ) ( not ( = ?auto_1894815 ?auto_1894825 ) ) ( not ( = ?auto_1894815 ?auto_1894826 ) ) ( not ( = ?auto_1894815 ?auto_1894827 ) ) ( not ( = ?auto_1894815 ?auto_1894828 ) ) ( not ( = ?auto_1894815 ?auto_1894829 ) ) ( not ( = ?auto_1894815 ?auto_1894830 ) ) ( not ( = ?auto_1894815 ?auto_1894834 ) ) ( not ( = ?auto_1894816 ?auto_1894817 ) ) ( not ( = ?auto_1894816 ?auto_1894818 ) ) ( not ( = ?auto_1894816 ?auto_1894819 ) ) ( not ( = ?auto_1894816 ?auto_1894820 ) ) ( not ( = ?auto_1894816 ?auto_1894821 ) ) ( not ( = ?auto_1894816 ?auto_1894822 ) ) ( not ( = ?auto_1894816 ?auto_1894823 ) ) ( not ( = ?auto_1894816 ?auto_1894824 ) ) ( not ( = ?auto_1894816 ?auto_1894825 ) ) ( not ( = ?auto_1894816 ?auto_1894826 ) ) ( not ( = ?auto_1894816 ?auto_1894827 ) ) ( not ( = ?auto_1894816 ?auto_1894828 ) ) ( not ( = ?auto_1894816 ?auto_1894829 ) ) ( not ( = ?auto_1894816 ?auto_1894830 ) ) ( not ( = ?auto_1894816 ?auto_1894834 ) ) ( not ( = ?auto_1894817 ?auto_1894818 ) ) ( not ( = ?auto_1894817 ?auto_1894819 ) ) ( not ( = ?auto_1894817 ?auto_1894820 ) ) ( not ( = ?auto_1894817 ?auto_1894821 ) ) ( not ( = ?auto_1894817 ?auto_1894822 ) ) ( not ( = ?auto_1894817 ?auto_1894823 ) ) ( not ( = ?auto_1894817 ?auto_1894824 ) ) ( not ( = ?auto_1894817 ?auto_1894825 ) ) ( not ( = ?auto_1894817 ?auto_1894826 ) ) ( not ( = ?auto_1894817 ?auto_1894827 ) ) ( not ( = ?auto_1894817 ?auto_1894828 ) ) ( not ( = ?auto_1894817 ?auto_1894829 ) ) ( not ( = ?auto_1894817 ?auto_1894830 ) ) ( not ( = ?auto_1894817 ?auto_1894834 ) ) ( not ( = ?auto_1894818 ?auto_1894819 ) ) ( not ( = ?auto_1894818 ?auto_1894820 ) ) ( not ( = ?auto_1894818 ?auto_1894821 ) ) ( not ( = ?auto_1894818 ?auto_1894822 ) ) ( not ( = ?auto_1894818 ?auto_1894823 ) ) ( not ( = ?auto_1894818 ?auto_1894824 ) ) ( not ( = ?auto_1894818 ?auto_1894825 ) ) ( not ( = ?auto_1894818 ?auto_1894826 ) ) ( not ( = ?auto_1894818 ?auto_1894827 ) ) ( not ( = ?auto_1894818 ?auto_1894828 ) ) ( not ( = ?auto_1894818 ?auto_1894829 ) ) ( not ( = ?auto_1894818 ?auto_1894830 ) ) ( not ( = ?auto_1894818 ?auto_1894834 ) ) ( not ( = ?auto_1894819 ?auto_1894820 ) ) ( not ( = ?auto_1894819 ?auto_1894821 ) ) ( not ( = ?auto_1894819 ?auto_1894822 ) ) ( not ( = ?auto_1894819 ?auto_1894823 ) ) ( not ( = ?auto_1894819 ?auto_1894824 ) ) ( not ( = ?auto_1894819 ?auto_1894825 ) ) ( not ( = ?auto_1894819 ?auto_1894826 ) ) ( not ( = ?auto_1894819 ?auto_1894827 ) ) ( not ( = ?auto_1894819 ?auto_1894828 ) ) ( not ( = ?auto_1894819 ?auto_1894829 ) ) ( not ( = ?auto_1894819 ?auto_1894830 ) ) ( not ( = ?auto_1894819 ?auto_1894834 ) ) ( not ( = ?auto_1894820 ?auto_1894821 ) ) ( not ( = ?auto_1894820 ?auto_1894822 ) ) ( not ( = ?auto_1894820 ?auto_1894823 ) ) ( not ( = ?auto_1894820 ?auto_1894824 ) ) ( not ( = ?auto_1894820 ?auto_1894825 ) ) ( not ( = ?auto_1894820 ?auto_1894826 ) ) ( not ( = ?auto_1894820 ?auto_1894827 ) ) ( not ( = ?auto_1894820 ?auto_1894828 ) ) ( not ( = ?auto_1894820 ?auto_1894829 ) ) ( not ( = ?auto_1894820 ?auto_1894830 ) ) ( not ( = ?auto_1894820 ?auto_1894834 ) ) ( not ( = ?auto_1894821 ?auto_1894822 ) ) ( not ( = ?auto_1894821 ?auto_1894823 ) ) ( not ( = ?auto_1894821 ?auto_1894824 ) ) ( not ( = ?auto_1894821 ?auto_1894825 ) ) ( not ( = ?auto_1894821 ?auto_1894826 ) ) ( not ( = ?auto_1894821 ?auto_1894827 ) ) ( not ( = ?auto_1894821 ?auto_1894828 ) ) ( not ( = ?auto_1894821 ?auto_1894829 ) ) ( not ( = ?auto_1894821 ?auto_1894830 ) ) ( not ( = ?auto_1894821 ?auto_1894834 ) ) ( not ( = ?auto_1894822 ?auto_1894823 ) ) ( not ( = ?auto_1894822 ?auto_1894824 ) ) ( not ( = ?auto_1894822 ?auto_1894825 ) ) ( not ( = ?auto_1894822 ?auto_1894826 ) ) ( not ( = ?auto_1894822 ?auto_1894827 ) ) ( not ( = ?auto_1894822 ?auto_1894828 ) ) ( not ( = ?auto_1894822 ?auto_1894829 ) ) ( not ( = ?auto_1894822 ?auto_1894830 ) ) ( not ( = ?auto_1894822 ?auto_1894834 ) ) ( not ( = ?auto_1894823 ?auto_1894824 ) ) ( not ( = ?auto_1894823 ?auto_1894825 ) ) ( not ( = ?auto_1894823 ?auto_1894826 ) ) ( not ( = ?auto_1894823 ?auto_1894827 ) ) ( not ( = ?auto_1894823 ?auto_1894828 ) ) ( not ( = ?auto_1894823 ?auto_1894829 ) ) ( not ( = ?auto_1894823 ?auto_1894830 ) ) ( not ( = ?auto_1894823 ?auto_1894834 ) ) ( not ( = ?auto_1894824 ?auto_1894825 ) ) ( not ( = ?auto_1894824 ?auto_1894826 ) ) ( not ( = ?auto_1894824 ?auto_1894827 ) ) ( not ( = ?auto_1894824 ?auto_1894828 ) ) ( not ( = ?auto_1894824 ?auto_1894829 ) ) ( not ( = ?auto_1894824 ?auto_1894830 ) ) ( not ( = ?auto_1894824 ?auto_1894834 ) ) ( not ( = ?auto_1894825 ?auto_1894826 ) ) ( not ( = ?auto_1894825 ?auto_1894827 ) ) ( not ( = ?auto_1894825 ?auto_1894828 ) ) ( not ( = ?auto_1894825 ?auto_1894829 ) ) ( not ( = ?auto_1894825 ?auto_1894830 ) ) ( not ( = ?auto_1894825 ?auto_1894834 ) ) ( not ( = ?auto_1894826 ?auto_1894827 ) ) ( not ( = ?auto_1894826 ?auto_1894828 ) ) ( not ( = ?auto_1894826 ?auto_1894829 ) ) ( not ( = ?auto_1894826 ?auto_1894830 ) ) ( not ( = ?auto_1894826 ?auto_1894834 ) ) ( not ( = ?auto_1894827 ?auto_1894828 ) ) ( not ( = ?auto_1894827 ?auto_1894829 ) ) ( not ( = ?auto_1894827 ?auto_1894830 ) ) ( not ( = ?auto_1894827 ?auto_1894834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1894828 ?auto_1894829 ?auto_1894830 )
      ( MAKE-15CRATE-VERIFY ?auto_1894815 ?auto_1894816 ?auto_1894817 ?auto_1894818 ?auto_1894819 ?auto_1894820 ?auto_1894821 ?auto_1894822 ?auto_1894823 ?auto_1894824 ?auto_1894825 ?auto_1894826 ?auto_1894827 ?auto_1894828 ?auto_1894829 ?auto_1894830 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1895041 - SURFACE
      ?auto_1895042 - SURFACE
      ?auto_1895043 - SURFACE
      ?auto_1895044 - SURFACE
      ?auto_1895045 - SURFACE
      ?auto_1895046 - SURFACE
      ?auto_1895047 - SURFACE
      ?auto_1895048 - SURFACE
      ?auto_1895049 - SURFACE
      ?auto_1895050 - SURFACE
      ?auto_1895051 - SURFACE
      ?auto_1895052 - SURFACE
      ?auto_1895053 - SURFACE
      ?auto_1895054 - SURFACE
      ?auto_1895055 - SURFACE
      ?auto_1895056 - SURFACE
    )
    :vars
    (
      ?auto_1895059 - HOIST
      ?auto_1895058 - PLACE
      ?auto_1895057 - PLACE
      ?auto_1895060 - HOIST
      ?auto_1895062 - SURFACE
      ?auto_1895061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1895059 ?auto_1895058 ) ( IS-CRATE ?auto_1895056 ) ( not ( = ?auto_1895055 ?auto_1895056 ) ) ( not ( = ?auto_1895054 ?auto_1895055 ) ) ( not ( = ?auto_1895054 ?auto_1895056 ) ) ( not ( = ?auto_1895057 ?auto_1895058 ) ) ( HOIST-AT ?auto_1895060 ?auto_1895057 ) ( not ( = ?auto_1895059 ?auto_1895060 ) ) ( AVAILABLE ?auto_1895060 ) ( SURFACE-AT ?auto_1895056 ?auto_1895057 ) ( ON ?auto_1895056 ?auto_1895062 ) ( CLEAR ?auto_1895056 ) ( not ( = ?auto_1895055 ?auto_1895062 ) ) ( not ( = ?auto_1895056 ?auto_1895062 ) ) ( not ( = ?auto_1895054 ?auto_1895062 ) ) ( TRUCK-AT ?auto_1895061 ?auto_1895058 ) ( SURFACE-AT ?auto_1895054 ?auto_1895058 ) ( CLEAR ?auto_1895054 ) ( IS-CRATE ?auto_1895055 ) ( AVAILABLE ?auto_1895059 ) ( IN ?auto_1895055 ?auto_1895061 ) ( ON ?auto_1895042 ?auto_1895041 ) ( ON ?auto_1895043 ?auto_1895042 ) ( ON ?auto_1895044 ?auto_1895043 ) ( ON ?auto_1895045 ?auto_1895044 ) ( ON ?auto_1895046 ?auto_1895045 ) ( ON ?auto_1895047 ?auto_1895046 ) ( ON ?auto_1895048 ?auto_1895047 ) ( ON ?auto_1895049 ?auto_1895048 ) ( ON ?auto_1895050 ?auto_1895049 ) ( ON ?auto_1895051 ?auto_1895050 ) ( ON ?auto_1895052 ?auto_1895051 ) ( ON ?auto_1895053 ?auto_1895052 ) ( ON ?auto_1895054 ?auto_1895053 ) ( not ( = ?auto_1895041 ?auto_1895042 ) ) ( not ( = ?auto_1895041 ?auto_1895043 ) ) ( not ( = ?auto_1895041 ?auto_1895044 ) ) ( not ( = ?auto_1895041 ?auto_1895045 ) ) ( not ( = ?auto_1895041 ?auto_1895046 ) ) ( not ( = ?auto_1895041 ?auto_1895047 ) ) ( not ( = ?auto_1895041 ?auto_1895048 ) ) ( not ( = ?auto_1895041 ?auto_1895049 ) ) ( not ( = ?auto_1895041 ?auto_1895050 ) ) ( not ( = ?auto_1895041 ?auto_1895051 ) ) ( not ( = ?auto_1895041 ?auto_1895052 ) ) ( not ( = ?auto_1895041 ?auto_1895053 ) ) ( not ( = ?auto_1895041 ?auto_1895054 ) ) ( not ( = ?auto_1895041 ?auto_1895055 ) ) ( not ( = ?auto_1895041 ?auto_1895056 ) ) ( not ( = ?auto_1895041 ?auto_1895062 ) ) ( not ( = ?auto_1895042 ?auto_1895043 ) ) ( not ( = ?auto_1895042 ?auto_1895044 ) ) ( not ( = ?auto_1895042 ?auto_1895045 ) ) ( not ( = ?auto_1895042 ?auto_1895046 ) ) ( not ( = ?auto_1895042 ?auto_1895047 ) ) ( not ( = ?auto_1895042 ?auto_1895048 ) ) ( not ( = ?auto_1895042 ?auto_1895049 ) ) ( not ( = ?auto_1895042 ?auto_1895050 ) ) ( not ( = ?auto_1895042 ?auto_1895051 ) ) ( not ( = ?auto_1895042 ?auto_1895052 ) ) ( not ( = ?auto_1895042 ?auto_1895053 ) ) ( not ( = ?auto_1895042 ?auto_1895054 ) ) ( not ( = ?auto_1895042 ?auto_1895055 ) ) ( not ( = ?auto_1895042 ?auto_1895056 ) ) ( not ( = ?auto_1895042 ?auto_1895062 ) ) ( not ( = ?auto_1895043 ?auto_1895044 ) ) ( not ( = ?auto_1895043 ?auto_1895045 ) ) ( not ( = ?auto_1895043 ?auto_1895046 ) ) ( not ( = ?auto_1895043 ?auto_1895047 ) ) ( not ( = ?auto_1895043 ?auto_1895048 ) ) ( not ( = ?auto_1895043 ?auto_1895049 ) ) ( not ( = ?auto_1895043 ?auto_1895050 ) ) ( not ( = ?auto_1895043 ?auto_1895051 ) ) ( not ( = ?auto_1895043 ?auto_1895052 ) ) ( not ( = ?auto_1895043 ?auto_1895053 ) ) ( not ( = ?auto_1895043 ?auto_1895054 ) ) ( not ( = ?auto_1895043 ?auto_1895055 ) ) ( not ( = ?auto_1895043 ?auto_1895056 ) ) ( not ( = ?auto_1895043 ?auto_1895062 ) ) ( not ( = ?auto_1895044 ?auto_1895045 ) ) ( not ( = ?auto_1895044 ?auto_1895046 ) ) ( not ( = ?auto_1895044 ?auto_1895047 ) ) ( not ( = ?auto_1895044 ?auto_1895048 ) ) ( not ( = ?auto_1895044 ?auto_1895049 ) ) ( not ( = ?auto_1895044 ?auto_1895050 ) ) ( not ( = ?auto_1895044 ?auto_1895051 ) ) ( not ( = ?auto_1895044 ?auto_1895052 ) ) ( not ( = ?auto_1895044 ?auto_1895053 ) ) ( not ( = ?auto_1895044 ?auto_1895054 ) ) ( not ( = ?auto_1895044 ?auto_1895055 ) ) ( not ( = ?auto_1895044 ?auto_1895056 ) ) ( not ( = ?auto_1895044 ?auto_1895062 ) ) ( not ( = ?auto_1895045 ?auto_1895046 ) ) ( not ( = ?auto_1895045 ?auto_1895047 ) ) ( not ( = ?auto_1895045 ?auto_1895048 ) ) ( not ( = ?auto_1895045 ?auto_1895049 ) ) ( not ( = ?auto_1895045 ?auto_1895050 ) ) ( not ( = ?auto_1895045 ?auto_1895051 ) ) ( not ( = ?auto_1895045 ?auto_1895052 ) ) ( not ( = ?auto_1895045 ?auto_1895053 ) ) ( not ( = ?auto_1895045 ?auto_1895054 ) ) ( not ( = ?auto_1895045 ?auto_1895055 ) ) ( not ( = ?auto_1895045 ?auto_1895056 ) ) ( not ( = ?auto_1895045 ?auto_1895062 ) ) ( not ( = ?auto_1895046 ?auto_1895047 ) ) ( not ( = ?auto_1895046 ?auto_1895048 ) ) ( not ( = ?auto_1895046 ?auto_1895049 ) ) ( not ( = ?auto_1895046 ?auto_1895050 ) ) ( not ( = ?auto_1895046 ?auto_1895051 ) ) ( not ( = ?auto_1895046 ?auto_1895052 ) ) ( not ( = ?auto_1895046 ?auto_1895053 ) ) ( not ( = ?auto_1895046 ?auto_1895054 ) ) ( not ( = ?auto_1895046 ?auto_1895055 ) ) ( not ( = ?auto_1895046 ?auto_1895056 ) ) ( not ( = ?auto_1895046 ?auto_1895062 ) ) ( not ( = ?auto_1895047 ?auto_1895048 ) ) ( not ( = ?auto_1895047 ?auto_1895049 ) ) ( not ( = ?auto_1895047 ?auto_1895050 ) ) ( not ( = ?auto_1895047 ?auto_1895051 ) ) ( not ( = ?auto_1895047 ?auto_1895052 ) ) ( not ( = ?auto_1895047 ?auto_1895053 ) ) ( not ( = ?auto_1895047 ?auto_1895054 ) ) ( not ( = ?auto_1895047 ?auto_1895055 ) ) ( not ( = ?auto_1895047 ?auto_1895056 ) ) ( not ( = ?auto_1895047 ?auto_1895062 ) ) ( not ( = ?auto_1895048 ?auto_1895049 ) ) ( not ( = ?auto_1895048 ?auto_1895050 ) ) ( not ( = ?auto_1895048 ?auto_1895051 ) ) ( not ( = ?auto_1895048 ?auto_1895052 ) ) ( not ( = ?auto_1895048 ?auto_1895053 ) ) ( not ( = ?auto_1895048 ?auto_1895054 ) ) ( not ( = ?auto_1895048 ?auto_1895055 ) ) ( not ( = ?auto_1895048 ?auto_1895056 ) ) ( not ( = ?auto_1895048 ?auto_1895062 ) ) ( not ( = ?auto_1895049 ?auto_1895050 ) ) ( not ( = ?auto_1895049 ?auto_1895051 ) ) ( not ( = ?auto_1895049 ?auto_1895052 ) ) ( not ( = ?auto_1895049 ?auto_1895053 ) ) ( not ( = ?auto_1895049 ?auto_1895054 ) ) ( not ( = ?auto_1895049 ?auto_1895055 ) ) ( not ( = ?auto_1895049 ?auto_1895056 ) ) ( not ( = ?auto_1895049 ?auto_1895062 ) ) ( not ( = ?auto_1895050 ?auto_1895051 ) ) ( not ( = ?auto_1895050 ?auto_1895052 ) ) ( not ( = ?auto_1895050 ?auto_1895053 ) ) ( not ( = ?auto_1895050 ?auto_1895054 ) ) ( not ( = ?auto_1895050 ?auto_1895055 ) ) ( not ( = ?auto_1895050 ?auto_1895056 ) ) ( not ( = ?auto_1895050 ?auto_1895062 ) ) ( not ( = ?auto_1895051 ?auto_1895052 ) ) ( not ( = ?auto_1895051 ?auto_1895053 ) ) ( not ( = ?auto_1895051 ?auto_1895054 ) ) ( not ( = ?auto_1895051 ?auto_1895055 ) ) ( not ( = ?auto_1895051 ?auto_1895056 ) ) ( not ( = ?auto_1895051 ?auto_1895062 ) ) ( not ( = ?auto_1895052 ?auto_1895053 ) ) ( not ( = ?auto_1895052 ?auto_1895054 ) ) ( not ( = ?auto_1895052 ?auto_1895055 ) ) ( not ( = ?auto_1895052 ?auto_1895056 ) ) ( not ( = ?auto_1895052 ?auto_1895062 ) ) ( not ( = ?auto_1895053 ?auto_1895054 ) ) ( not ( = ?auto_1895053 ?auto_1895055 ) ) ( not ( = ?auto_1895053 ?auto_1895056 ) ) ( not ( = ?auto_1895053 ?auto_1895062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1895054 ?auto_1895055 ?auto_1895056 )
      ( MAKE-15CRATE-VERIFY ?auto_1895041 ?auto_1895042 ?auto_1895043 ?auto_1895044 ?auto_1895045 ?auto_1895046 ?auto_1895047 ?auto_1895048 ?auto_1895049 ?auto_1895050 ?auto_1895051 ?auto_1895052 ?auto_1895053 ?auto_1895054 ?auto_1895055 ?auto_1895056 ) )
  )

)

