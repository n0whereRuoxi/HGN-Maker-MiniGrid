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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5972 - SURFACE
      ?auto_5973 - SURFACE
    )
    :vars
    (
      ?auto_5974 - HOIST
      ?auto_5975 - PLACE
      ?auto_5977 - PLACE
      ?auto_5978 - HOIST
      ?auto_5979 - SURFACE
      ?auto_5976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5974 ?auto_5975 ) ( SURFACE-AT ?auto_5972 ?auto_5975 ) ( CLEAR ?auto_5972 ) ( IS-CRATE ?auto_5973 ) ( AVAILABLE ?auto_5974 ) ( not ( = ?auto_5977 ?auto_5975 ) ) ( HOIST-AT ?auto_5978 ?auto_5977 ) ( AVAILABLE ?auto_5978 ) ( SURFACE-AT ?auto_5973 ?auto_5977 ) ( ON ?auto_5973 ?auto_5979 ) ( CLEAR ?auto_5973 ) ( TRUCK-AT ?auto_5976 ?auto_5975 ) ( not ( = ?auto_5972 ?auto_5973 ) ) ( not ( = ?auto_5972 ?auto_5979 ) ) ( not ( = ?auto_5973 ?auto_5979 ) ) ( not ( = ?auto_5974 ?auto_5978 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5976 ?auto_5975 ?auto_5977 )
      ( !LIFT ?auto_5978 ?auto_5973 ?auto_5979 ?auto_5977 )
      ( !LOAD ?auto_5978 ?auto_5973 ?auto_5976 ?auto_5977 )
      ( !DRIVE ?auto_5976 ?auto_5977 ?auto_5975 )
      ( !UNLOAD ?auto_5974 ?auto_5973 ?auto_5976 ?auto_5975 )
      ( !DROP ?auto_5974 ?auto_5973 ?auto_5972 ?auto_5975 )
      ( MAKE-1CRATE-VERIFY ?auto_5972 ?auto_5973 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5982 - SURFACE
      ?auto_5983 - SURFACE
    )
    :vars
    (
      ?auto_5984 - HOIST
      ?auto_5985 - PLACE
      ?auto_5987 - PLACE
      ?auto_5988 - HOIST
      ?auto_5989 - SURFACE
      ?auto_5986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5984 ?auto_5985 ) ( SURFACE-AT ?auto_5982 ?auto_5985 ) ( CLEAR ?auto_5982 ) ( IS-CRATE ?auto_5983 ) ( AVAILABLE ?auto_5984 ) ( not ( = ?auto_5987 ?auto_5985 ) ) ( HOIST-AT ?auto_5988 ?auto_5987 ) ( AVAILABLE ?auto_5988 ) ( SURFACE-AT ?auto_5983 ?auto_5987 ) ( ON ?auto_5983 ?auto_5989 ) ( CLEAR ?auto_5983 ) ( TRUCK-AT ?auto_5986 ?auto_5985 ) ( not ( = ?auto_5982 ?auto_5983 ) ) ( not ( = ?auto_5982 ?auto_5989 ) ) ( not ( = ?auto_5983 ?auto_5989 ) ) ( not ( = ?auto_5984 ?auto_5988 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5986 ?auto_5985 ?auto_5987 )
      ( !LIFT ?auto_5988 ?auto_5983 ?auto_5989 ?auto_5987 )
      ( !LOAD ?auto_5988 ?auto_5983 ?auto_5986 ?auto_5987 )
      ( !DRIVE ?auto_5986 ?auto_5987 ?auto_5985 )
      ( !UNLOAD ?auto_5984 ?auto_5983 ?auto_5986 ?auto_5985 )
      ( !DROP ?auto_5984 ?auto_5983 ?auto_5982 ?auto_5985 )
      ( MAKE-1CRATE-VERIFY ?auto_5982 ?auto_5983 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5993 - SURFACE
      ?auto_5994 - SURFACE
      ?auto_5995 - SURFACE
    )
    :vars
    (
      ?auto_6001 - HOIST
      ?auto_5997 - PLACE
      ?auto_5999 - PLACE
      ?auto_6000 - HOIST
      ?auto_5996 - SURFACE
      ?auto_6003 - PLACE
      ?auto_6004 - HOIST
      ?auto_6002 - SURFACE
      ?auto_5998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6001 ?auto_5997 ) ( IS-CRATE ?auto_5995 ) ( not ( = ?auto_5999 ?auto_5997 ) ) ( HOIST-AT ?auto_6000 ?auto_5999 ) ( AVAILABLE ?auto_6000 ) ( SURFACE-AT ?auto_5995 ?auto_5999 ) ( ON ?auto_5995 ?auto_5996 ) ( CLEAR ?auto_5995 ) ( not ( = ?auto_5994 ?auto_5995 ) ) ( not ( = ?auto_5994 ?auto_5996 ) ) ( not ( = ?auto_5995 ?auto_5996 ) ) ( not ( = ?auto_6001 ?auto_6000 ) ) ( SURFACE-AT ?auto_5993 ?auto_5997 ) ( CLEAR ?auto_5993 ) ( IS-CRATE ?auto_5994 ) ( AVAILABLE ?auto_6001 ) ( not ( = ?auto_6003 ?auto_5997 ) ) ( HOIST-AT ?auto_6004 ?auto_6003 ) ( AVAILABLE ?auto_6004 ) ( SURFACE-AT ?auto_5994 ?auto_6003 ) ( ON ?auto_5994 ?auto_6002 ) ( CLEAR ?auto_5994 ) ( TRUCK-AT ?auto_5998 ?auto_5997 ) ( not ( = ?auto_5993 ?auto_5994 ) ) ( not ( = ?auto_5993 ?auto_6002 ) ) ( not ( = ?auto_5994 ?auto_6002 ) ) ( not ( = ?auto_6001 ?auto_6004 ) ) ( not ( = ?auto_5993 ?auto_5995 ) ) ( not ( = ?auto_5993 ?auto_5996 ) ) ( not ( = ?auto_5995 ?auto_6002 ) ) ( not ( = ?auto_5999 ?auto_6003 ) ) ( not ( = ?auto_6000 ?auto_6004 ) ) ( not ( = ?auto_5996 ?auto_6002 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5993 ?auto_5994 )
      ( MAKE-1CRATE ?auto_5994 ?auto_5995 )
      ( MAKE-2CRATE-VERIFY ?auto_5993 ?auto_5994 ?auto_5995 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6007 - SURFACE
      ?auto_6008 - SURFACE
    )
    :vars
    (
      ?auto_6009 - HOIST
      ?auto_6010 - PLACE
      ?auto_6012 - PLACE
      ?auto_6013 - HOIST
      ?auto_6014 - SURFACE
      ?auto_6011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6009 ?auto_6010 ) ( SURFACE-AT ?auto_6007 ?auto_6010 ) ( CLEAR ?auto_6007 ) ( IS-CRATE ?auto_6008 ) ( AVAILABLE ?auto_6009 ) ( not ( = ?auto_6012 ?auto_6010 ) ) ( HOIST-AT ?auto_6013 ?auto_6012 ) ( AVAILABLE ?auto_6013 ) ( SURFACE-AT ?auto_6008 ?auto_6012 ) ( ON ?auto_6008 ?auto_6014 ) ( CLEAR ?auto_6008 ) ( TRUCK-AT ?auto_6011 ?auto_6010 ) ( not ( = ?auto_6007 ?auto_6008 ) ) ( not ( = ?auto_6007 ?auto_6014 ) ) ( not ( = ?auto_6008 ?auto_6014 ) ) ( not ( = ?auto_6009 ?auto_6013 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6011 ?auto_6010 ?auto_6012 )
      ( !LIFT ?auto_6013 ?auto_6008 ?auto_6014 ?auto_6012 )
      ( !LOAD ?auto_6013 ?auto_6008 ?auto_6011 ?auto_6012 )
      ( !DRIVE ?auto_6011 ?auto_6012 ?auto_6010 )
      ( !UNLOAD ?auto_6009 ?auto_6008 ?auto_6011 ?auto_6010 )
      ( !DROP ?auto_6009 ?auto_6008 ?auto_6007 ?auto_6010 )
      ( MAKE-1CRATE-VERIFY ?auto_6007 ?auto_6008 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6019 - SURFACE
      ?auto_6020 - SURFACE
      ?auto_6021 - SURFACE
      ?auto_6022 - SURFACE
    )
    :vars
    (
      ?auto_6025 - HOIST
      ?auto_6028 - PLACE
      ?auto_6024 - PLACE
      ?auto_6026 - HOIST
      ?auto_6023 - SURFACE
      ?auto_6032 - PLACE
      ?auto_6031 - HOIST
      ?auto_6033 - SURFACE
      ?auto_6029 - PLACE
      ?auto_6030 - HOIST
      ?auto_6034 - SURFACE
      ?auto_6027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6025 ?auto_6028 ) ( IS-CRATE ?auto_6022 ) ( not ( = ?auto_6024 ?auto_6028 ) ) ( HOIST-AT ?auto_6026 ?auto_6024 ) ( AVAILABLE ?auto_6026 ) ( SURFACE-AT ?auto_6022 ?auto_6024 ) ( ON ?auto_6022 ?auto_6023 ) ( CLEAR ?auto_6022 ) ( not ( = ?auto_6021 ?auto_6022 ) ) ( not ( = ?auto_6021 ?auto_6023 ) ) ( not ( = ?auto_6022 ?auto_6023 ) ) ( not ( = ?auto_6025 ?auto_6026 ) ) ( IS-CRATE ?auto_6021 ) ( not ( = ?auto_6032 ?auto_6028 ) ) ( HOIST-AT ?auto_6031 ?auto_6032 ) ( AVAILABLE ?auto_6031 ) ( SURFACE-AT ?auto_6021 ?auto_6032 ) ( ON ?auto_6021 ?auto_6033 ) ( CLEAR ?auto_6021 ) ( not ( = ?auto_6020 ?auto_6021 ) ) ( not ( = ?auto_6020 ?auto_6033 ) ) ( not ( = ?auto_6021 ?auto_6033 ) ) ( not ( = ?auto_6025 ?auto_6031 ) ) ( SURFACE-AT ?auto_6019 ?auto_6028 ) ( CLEAR ?auto_6019 ) ( IS-CRATE ?auto_6020 ) ( AVAILABLE ?auto_6025 ) ( not ( = ?auto_6029 ?auto_6028 ) ) ( HOIST-AT ?auto_6030 ?auto_6029 ) ( AVAILABLE ?auto_6030 ) ( SURFACE-AT ?auto_6020 ?auto_6029 ) ( ON ?auto_6020 ?auto_6034 ) ( CLEAR ?auto_6020 ) ( TRUCK-AT ?auto_6027 ?auto_6028 ) ( not ( = ?auto_6019 ?auto_6020 ) ) ( not ( = ?auto_6019 ?auto_6034 ) ) ( not ( = ?auto_6020 ?auto_6034 ) ) ( not ( = ?auto_6025 ?auto_6030 ) ) ( not ( = ?auto_6019 ?auto_6021 ) ) ( not ( = ?auto_6019 ?auto_6033 ) ) ( not ( = ?auto_6021 ?auto_6034 ) ) ( not ( = ?auto_6032 ?auto_6029 ) ) ( not ( = ?auto_6031 ?auto_6030 ) ) ( not ( = ?auto_6033 ?auto_6034 ) ) ( not ( = ?auto_6019 ?auto_6022 ) ) ( not ( = ?auto_6019 ?auto_6023 ) ) ( not ( = ?auto_6020 ?auto_6022 ) ) ( not ( = ?auto_6020 ?auto_6023 ) ) ( not ( = ?auto_6022 ?auto_6033 ) ) ( not ( = ?auto_6022 ?auto_6034 ) ) ( not ( = ?auto_6024 ?auto_6032 ) ) ( not ( = ?auto_6024 ?auto_6029 ) ) ( not ( = ?auto_6026 ?auto_6031 ) ) ( not ( = ?auto_6026 ?auto_6030 ) ) ( not ( = ?auto_6023 ?auto_6033 ) ) ( not ( = ?auto_6023 ?auto_6034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6019 ?auto_6020 ?auto_6021 )
      ( MAKE-1CRATE ?auto_6021 ?auto_6022 )
      ( MAKE-3CRATE-VERIFY ?auto_6019 ?auto_6020 ?auto_6021 ?auto_6022 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6037 - SURFACE
      ?auto_6038 - SURFACE
    )
    :vars
    (
      ?auto_6039 - HOIST
      ?auto_6040 - PLACE
      ?auto_6042 - PLACE
      ?auto_6043 - HOIST
      ?auto_6044 - SURFACE
      ?auto_6041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6039 ?auto_6040 ) ( SURFACE-AT ?auto_6037 ?auto_6040 ) ( CLEAR ?auto_6037 ) ( IS-CRATE ?auto_6038 ) ( AVAILABLE ?auto_6039 ) ( not ( = ?auto_6042 ?auto_6040 ) ) ( HOIST-AT ?auto_6043 ?auto_6042 ) ( AVAILABLE ?auto_6043 ) ( SURFACE-AT ?auto_6038 ?auto_6042 ) ( ON ?auto_6038 ?auto_6044 ) ( CLEAR ?auto_6038 ) ( TRUCK-AT ?auto_6041 ?auto_6040 ) ( not ( = ?auto_6037 ?auto_6038 ) ) ( not ( = ?auto_6037 ?auto_6044 ) ) ( not ( = ?auto_6038 ?auto_6044 ) ) ( not ( = ?auto_6039 ?auto_6043 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6041 ?auto_6040 ?auto_6042 )
      ( !LIFT ?auto_6043 ?auto_6038 ?auto_6044 ?auto_6042 )
      ( !LOAD ?auto_6043 ?auto_6038 ?auto_6041 ?auto_6042 )
      ( !DRIVE ?auto_6041 ?auto_6042 ?auto_6040 )
      ( !UNLOAD ?auto_6039 ?auto_6038 ?auto_6041 ?auto_6040 )
      ( !DROP ?auto_6039 ?auto_6038 ?auto_6037 ?auto_6040 )
      ( MAKE-1CRATE-VERIFY ?auto_6037 ?auto_6038 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6050 - SURFACE
      ?auto_6051 - SURFACE
      ?auto_6052 - SURFACE
      ?auto_6053 - SURFACE
      ?auto_6054 - SURFACE
    )
    :vars
    (
      ?auto_6060 - HOIST
      ?auto_6057 - PLACE
      ?auto_6058 - PLACE
      ?auto_6056 - HOIST
      ?auto_6055 - SURFACE
      ?auto_6063 - SURFACE
      ?auto_6066 - PLACE
      ?auto_6064 - HOIST
      ?auto_6065 - SURFACE
      ?auto_6061 - PLACE
      ?auto_6067 - HOIST
      ?auto_6062 - SURFACE
      ?auto_6059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6060 ?auto_6057 ) ( IS-CRATE ?auto_6054 ) ( not ( = ?auto_6058 ?auto_6057 ) ) ( HOIST-AT ?auto_6056 ?auto_6058 ) ( SURFACE-AT ?auto_6054 ?auto_6058 ) ( ON ?auto_6054 ?auto_6055 ) ( CLEAR ?auto_6054 ) ( not ( = ?auto_6053 ?auto_6054 ) ) ( not ( = ?auto_6053 ?auto_6055 ) ) ( not ( = ?auto_6054 ?auto_6055 ) ) ( not ( = ?auto_6060 ?auto_6056 ) ) ( IS-CRATE ?auto_6053 ) ( AVAILABLE ?auto_6056 ) ( SURFACE-AT ?auto_6053 ?auto_6058 ) ( ON ?auto_6053 ?auto_6063 ) ( CLEAR ?auto_6053 ) ( not ( = ?auto_6052 ?auto_6053 ) ) ( not ( = ?auto_6052 ?auto_6063 ) ) ( not ( = ?auto_6053 ?auto_6063 ) ) ( IS-CRATE ?auto_6052 ) ( not ( = ?auto_6066 ?auto_6057 ) ) ( HOIST-AT ?auto_6064 ?auto_6066 ) ( AVAILABLE ?auto_6064 ) ( SURFACE-AT ?auto_6052 ?auto_6066 ) ( ON ?auto_6052 ?auto_6065 ) ( CLEAR ?auto_6052 ) ( not ( = ?auto_6051 ?auto_6052 ) ) ( not ( = ?auto_6051 ?auto_6065 ) ) ( not ( = ?auto_6052 ?auto_6065 ) ) ( not ( = ?auto_6060 ?auto_6064 ) ) ( SURFACE-AT ?auto_6050 ?auto_6057 ) ( CLEAR ?auto_6050 ) ( IS-CRATE ?auto_6051 ) ( AVAILABLE ?auto_6060 ) ( not ( = ?auto_6061 ?auto_6057 ) ) ( HOIST-AT ?auto_6067 ?auto_6061 ) ( AVAILABLE ?auto_6067 ) ( SURFACE-AT ?auto_6051 ?auto_6061 ) ( ON ?auto_6051 ?auto_6062 ) ( CLEAR ?auto_6051 ) ( TRUCK-AT ?auto_6059 ?auto_6057 ) ( not ( = ?auto_6050 ?auto_6051 ) ) ( not ( = ?auto_6050 ?auto_6062 ) ) ( not ( = ?auto_6051 ?auto_6062 ) ) ( not ( = ?auto_6060 ?auto_6067 ) ) ( not ( = ?auto_6050 ?auto_6052 ) ) ( not ( = ?auto_6050 ?auto_6065 ) ) ( not ( = ?auto_6052 ?auto_6062 ) ) ( not ( = ?auto_6066 ?auto_6061 ) ) ( not ( = ?auto_6064 ?auto_6067 ) ) ( not ( = ?auto_6065 ?auto_6062 ) ) ( not ( = ?auto_6050 ?auto_6053 ) ) ( not ( = ?auto_6050 ?auto_6063 ) ) ( not ( = ?auto_6051 ?auto_6053 ) ) ( not ( = ?auto_6051 ?auto_6063 ) ) ( not ( = ?auto_6053 ?auto_6065 ) ) ( not ( = ?auto_6053 ?auto_6062 ) ) ( not ( = ?auto_6058 ?auto_6066 ) ) ( not ( = ?auto_6058 ?auto_6061 ) ) ( not ( = ?auto_6056 ?auto_6064 ) ) ( not ( = ?auto_6056 ?auto_6067 ) ) ( not ( = ?auto_6063 ?auto_6065 ) ) ( not ( = ?auto_6063 ?auto_6062 ) ) ( not ( = ?auto_6050 ?auto_6054 ) ) ( not ( = ?auto_6050 ?auto_6055 ) ) ( not ( = ?auto_6051 ?auto_6054 ) ) ( not ( = ?auto_6051 ?auto_6055 ) ) ( not ( = ?auto_6052 ?auto_6054 ) ) ( not ( = ?auto_6052 ?auto_6055 ) ) ( not ( = ?auto_6054 ?auto_6063 ) ) ( not ( = ?auto_6054 ?auto_6065 ) ) ( not ( = ?auto_6054 ?auto_6062 ) ) ( not ( = ?auto_6055 ?auto_6063 ) ) ( not ( = ?auto_6055 ?auto_6065 ) ) ( not ( = ?auto_6055 ?auto_6062 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6050 ?auto_6051 ?auto_6052 ?auto_6053 )
      ( MAKE-1CRATE ?auto_6053 ?auto_6054 )
      ( MAKE-4CRATE-VERIFY ?auto_6050 ?auto_6051 ?auto_6052 ?auto_6053 ?auto_6054 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6070 - SURFACE
      ?auto_6071 - SURFACE
    )
    :vars
    (
      ?auto_6072 - HOIST
      ?auto_6073 - PLACE
      ?auto_6075 - PLACE
      ?auto_6076 - HOIST
      ?auto_6077 - SURFACE
      ?auto_6074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6072 ?auto_6073 ) ( SURFACE-AT ?auto_6070 ?auto_6073 ) ( CLEAR ?auto_6070 ) ( IS-CRATE ?auto_6071 ) ( AVAILABLE ?auto_6072 ) ( not ( = ?auto_6075 ?auto_6073 ) ) ( HOIST-AT ?auto_6076 ?auto_6075 ) ( AVAILABLE ?auto_6076 ) ( SURFACE-AT ?auto_6071 ?auto_6075 ) ( ON ?auto_6071 ?auto_6077 ) ( CLEAR ?auto_6071 ) ( TRUCK-AT ?auto_6074 ?auto_6073 ) ( not ( = ?auto_6070 ?auto_6071 ) ) ( not ( = ?auto_6070 ?auto_6077 ) ) ( not ( = ?auto_6071 ?auto_6077 ) ) ( not ( = ?auto_6072 ?auto_6076 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6074 ?auto_6073 ?auto_6075 )
      ( !LIFT ?auto_6076 ?auto_6071 ?auto_6077 ?auto_6075 )
      ( !LOAD ?auto_6076 ?auto_6071 ?auto_6074 ?auto_6075 )
      ( !DRIVE ?auto_6074 ?auto_6075 ?auto_6073 )
      ( !UNLOAD ?auto_6072 ?auto_6071 ?auto_6074 ?auto_6073 )
      ( !DROP ?auto_6072 ?auto_6071 ?auto_6070 ?auto_6073 )
      ( MAKE-1CRATE-VERIFY ?auto_6070 ?auto_6071 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_6084 - SURFACE
      ?auto_6085 - SURFACE
      ?auto_6086 - SURFACE
      ?auto_6087 - SURFACE
      ?auto_6088 - SURFACE
      ?auto_6089 - SURFACE
    )
    :vars
    (
      ?auto_6092 - HOIST
      ?auto_6091 - PLACE
      ?auto_6090 - PLACE
      ?auto_6093 - HOIST
      ?auto_6094 - SURFACE
      ?auto_6097 - PLACE
      ?auto_6098 - HOIST
      ?auto_6103 - SURFACE
      ?auto_6100 - SURFACE
      ?auto_6101 - PLACE
      ?auto_6099 - HOIST
      ?auto_6102 - SURFACE
      ?auto_6096 - SURFACE
      ?auto_6095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6092 ?auto_6091 ) ( IS-CRATE ?auto_6089 ) ( not ( = ?auto_6090 ?auto_6091 ) ) ( HOIST-AT ?auto_6093 ?auto_6090 ) ( SURFACE-AT ?auto_6089 ?auto_6090 ) ( ON ?auto_6089 ?auto_6094 ) ( CLEAR ?auto_6089 ) ( not ( = ?auto_6088 ?auto_6089 ) ) ( not ( = ?auto_6088 ?auto_6094 ) ) ( not ( = ?auto_6089 ?auto_6094 ) ) ( not ( = ?auto_6092 ?auto_6093 ) ) ( IS-CRATE ?auto_6088 ) ( not ( = ?auto_6097 ?auto_6091 ) ) ( HOIST-AT ?auto_6098 ?auto_6097 ) ( SURFACE-AT ?auto_6088 ?auto_6097 ) ( ON ?auto_6088 ?auto_6103 ) ( CLEAR ?auto_6088 ) ( not ( = ?auto_6087 ?auto_6088 ) ) ( not ( = ?auto_6087 ?auto_6103 ) ) ( not ( = ?auto_6088 ?auto_6103 ) ) ( not ( = ?auto_6092 ?auto_6098 ) ) ( IS-CRATE ?auto_6087 ) ( AVAILABLE ?auto_6098 ) ( SURFACE-AT ?auto_6087 ?auto_6097 ) ( ON ?auto_6087 ?auto_6100 ) ( CLEAR ?auto_6087 ) ( not ( = ?auto_6086 ?auto_6087 ) ) ( not ( = ?auto_6086 ?auto_6100 ) ) ( not ( = ?auto_6087 ?auto_6100 ) ) ( IS-CRATE ?auto_6086 ) ( not ( = ?auto_6101 ?auto_6091 ) ) ( HOIST-AT ?auto_6099 ?auto_6101 ) ( AVAILABLE ?auto_6099 ) ( SURFACE-AT ?auto_6086 ?auto_6101 ) ( ON ?auto_6086 ?auto_6102 ) ( CLEAR ?auto_6086 ) ( not ( = ?auto_6085 ?auto_6086 ) ) ( not ( = ?auto_6085 ?auto_6102 ) ) ( not ( = ?auto_6086 ?auto_6102 ) ) ( not ( = ?auto_6092 ?auto_6099 ) ) ( SURFACE-AT ?auto_6084 ?auto_6091 ) ( CLEAR ?auto_6084 ) ( IS-CRATE ?auto_6085 ) ( AVAILABLE ?auto_6092 ) ( AVAILABLE ?auto_6093 ) ( SURFACE-AT ?auto_6085 ?auto_6090 ) ( ON ?auto_6085 ?auto_6096 ) ( CLEAR ?auto_6085 ) ( TRUCK-AT ?auto_6095 ?auto_6091 ) ( not ( = ?auto_6084 ?auto_6085 ) ) ( not ( = ?auto_6084 ?auto_6096 ) ) ( not ( = ?auto_6085 ?auto_6096 ) ) ( not ( = ?auto_6084 ?auto_6086 ) ) ( not ( = ?auto_6084 ?auto_6102 ) ) ( not ( = ?auto_6086 ?auto_6096 ) ) ( not ( = ?auto_6101 ?auto_6090 ) ) ( not ( = ?auto_6099 ?auto_6093 ) ) ( not ( = ?auto_6102 ?auto_6096 ) ) ( not ( = ?auto_6084 ?auto_6087 ) ) ( not ( = ?auto_6084 ?auto_6100 ) ) ( not ( = ?auto_6085 ?auto_6087 ) ) ( not ( = ?auto_6085 ?auto_6100 ) ) ( not ( = ?auto_6087 ?auto_6102 ) ) ( not ( = ?auto_6087 ?auto_6096 ) ) ( not ( = ?auto_6097 ?auto_6101 ) ) ( not ( = ?auto_6097 ?auto_6090 ) ) ( not ( = ?auto_6098 ?auto_6099 ) ) ( not ( = ?auto_6098 ?auto_6093 ) ) ( not ( = ?auto_6100 ?auto_6102 ) ) ( not ( = ?auto_6100 ?auto_6096 ) ) ( not ( = ?auto_6084 ?auto_6088 ) ) ( not ( = ?auto_6084 ?auto_6103 ) ) ( not ( = ?auto_6085 ?auto_6088 ) ) ( not ( = ?auto_6085 ?auto_6103 ) ) ( not ( = ?auto_6086 ?auto_6088 ) ) ( not ( = ?auto_6086 ?auto_6103 ) ) ( not ( = ?auto_6088 ?auto_6100 ) ) ( not ( = ?auto_6088 ?auto_6102 ) ) ( not ( = ?auto_6088 ?auto_6096 ) ) ( not ( = ?auto_6103 ?auto_6100 ) ) ( not ( = ?auto_6103 ?auto_6102 ) ) ( not ( = ?auto_6103 ?auto_6096 ) ) ( not ( = ?auto_6084 ?auto_6089 ) ) ( not ( = ?auto_6084 ?auto_6094 ) ) ( not ( = ?auto_6085 ?auto_6089 ) ) ( not ( = ?auto_6085 ?auto_6094 ) ) ( not ( = ?auto_6086 ?auto_6089 ) ) ( not ( = ?auto_6086 ?auto_6094 ) ) ( not ( = ?auto_6087 ?auto_6089 ) ) ( not ( = ?auto_6087 ?auto_6094 ) ) ( not ( = ?auto_6089 ?auto_6103 ) ) ( not ( = ?auto_6089 ?auto_6100 ) ) ( not ( = ?auto_6089 ?auto_6102 ) ) ( not ( = ?auto_6089 ?auto_6096 ) ) ( not ( = ?auto_6094 ?auto_6103 ) ) ( not ( = ?auto_6094 ?auto_6100 ) ) ( not ( = ?auto_6094 ?auto_6102 ) ) ( not ( = ?auto_6094 ?auto_6096 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6084 ?auto_6085 ?auto_6086 ?auto_6087 ?auto_6088 )
      ( MAKE-1CRATE ?auto_6088 ?auto_6089 )
      ( MAKE-5CRATE-VERIFY ?auto_6084 ?auto_6085 ?auto_6086 ?auto_6087 ?auto_6088 ?auto_6089 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6106 - SURFACE
      ?auto_6107 - SURFACE
    )
    :vars
    (
      ?auto_6108 - HOIST
      ?auto_6109 - PLACE
      ?auto_6111 - PLACE
      ?auto_6112 - HOIST
      ?auto_6113 - SURFACE
      ?auto_6110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6108 ?auto_6109 ) ( SURFACE-AT ?auto_6106 ?auto_6109 ) ( CLEAR ?auto_6106 ) ( IS-CRATE ?auto_6107 ) ( AVAILABLE ?auto_6108 ) ( not ( = ?auto_6111 ?auto_6109 ) ) ( HOIST-AT ?auto_6112 ?auto_6111 ) ( AVAILABLE ?auto_6112 ) ( SURFACE-AT ?auto_6107 ?auto_6111 ) ( ON ?auto_6107 ?auto_6113 ) ( CLEAR ?auto_6107 ) ( TRUCK-AT ?auto_6110 ?auto_6109 ) ( not ( = ?auto_6106 ?auto_6107 ) ) ( not ( = ?auto_6106 ?auto_6113 ) ) ( not ( = ?auto_6107 ?auto_6113 ) ) ( not ( = ?auto_6108 ?auto_6112 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6110 ?auto_6109 ?auto_6111 )
      ( !LIFT ?auto_6112 ?auto_6107 ?auto_6113 ?auto_6111 )
      ( !LOAD ?auto_6112 ?auto_6107 ?auto_6110 ?auto_6111 )
      ( !DRIVE ?auto_6110 ?auto_6111 ?auto_6109 )
      ( !UNLOAD ?auto_6108 ?auto_6107 ?auto_6110 ?auto_6109 )
      ( !DROP ?auto_6108 ?auto_6107 ?auto_6106 ?auto_6109 )
      ( MAKE-1CRATE-VERIFY ?auto_6106 ?auto_6107 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_6121 - SURFACE
      ?auto_6122 - SURFACE
      ?auto_6123 - SURFACE
      ?auto_6124 - SURFACE
      ?auto_6125 - SURFACE
      ?auto_6126 - SURFACE
      ?auto_6127 - SURFACE
    )
    :vars
    (
      ?auto_6128 - HOIST
      ?auto_6131 - PLACE
      ?auto_6133 - PLACE
      ?auto_6132 - HOIST
      ?auto_6130 - SURFACE
      ?auto_6140 - PLACE
      ?auto_6135 - HOIST
      ?auto_6139 - SURFACE
      ?auto_6138 - SURFACE
      ?auto_6137 - SURFACE
      ?auto_6142 - PLACE
      ?auto_6134 - HOIST
      ?auto_6136 - SURFACE
      ?auto_6141 - SURFACE
      ?auto_6129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6128 ?auto_6131 ) ( IS-CRATE ?auto_6127 ) ( not ( = ?auto_6133 ?auto_6131 ) ) ( HOIST-AT ?auto_6132 ?auto_6133 ) ( SURFACE-AT ?auto_6127 ?auto_6133 ) ( ON ?auto_6127 ?auto_6130 ) ( CLEAR ?auto_6127 ) ( not ( = ?auto_6126 ?auto_6127 ) ) ( not ( = ?auto_6126 ?auto_6130 ) ) ( not ( = ?auto_6127 ?auto_6130 ) ) ( not ( = ?auto_6128 ?auto_6132 ) ) ( IS-CRATE ?auto_6126 ) ( not ( = ?auto_6140 ?auto_6131 ) ) ( HOIST-AT ?auto_6135 ?auto_6140 ) ( SURFACE-AT ?auto_6126 ?auto_6140 ) ( ON ?auto_6126 ?auto_6139 ) ( CLEAR ?auto_6126 ) ( not ( = ?auto_6125 ?auto_6126 ) ) ( not ( = ?auto_6125 ?auto_6139 ) ) ( not ( = ?auto_6126 ?auto_6139 ) ) ( not ( = ?auto_6128 ?auto_6135 ) ) ( IS-CRATE ?auto_6125 ) ( SURFACE-AT ?auto_6125 ?auto_6133 ) ( ON ?auto_6125 ?auto_6138 ) ( CLEAR ?auto_6125 ) ( not ( = ?auto_6124 ?auto_6125 ) ) ( not ( = ?auto_6124 ?auto_6138 ) ) ( not ( = ?auto_6125 ?auto_6138 ) ) ( IS-CRATE ?auto_6124 ) ( AVAILABLE ?auto_6132 ) ( SURFACE-AT ?auto_6124 ?auto_6133 ) ( ON ?auto_6124 ?auto_6137 ) ( CLEAR ?auto_6124 ) ( not ( = ?auto_6123 ?auto_6124 ) ) ( not ( = ?auto_6123 ?auto_6137 ) ) ( not ( = ?auto_6124 ?auto_6137 ) ) ( IS-CRATE ?auto_6123 ) ( not ( = ?auto_6142 ?auto_6131 ) ) ( HOIST-AT ?auto_6134 ?auto_6142 ) ( AVAILABLE ?auto_6134 ) ( SURFACE-AT ?auto_6123 ?auto_6142 ) ( ON ?auto_6123 ?auto_6136 ) ( CLEAR ?auto_6123 ) ( not ( = ?auto_6122 ?auto_6123 ) ) ( not ( = ?auto_6122 ?auto_6136 ) ) ( not ( = ?auto_6123 ?auto_6136 ) ) ( not ( = ?auto_6128 ?auto_6134 ) ) ( SURFACE-AT ?auto_6121 ?auto_6131 ) ( CLEAR ?auto_6121 ) ( IS-CRATE ?auto_6122 ) ( AVAILABLE ?auto_6128 ) ( AVAILABLE ?auto_6135 ) ( SURFACE-AT ?auto_6122 ?auto_6140 ) ( ON ?auto_6122 ?auto_6141 ) ( CLEAR ?auto_6122 ) ( TRUCK-AT ?auto_6129 ?auto_6131 ) ( not ( = ?auto_6121 ?auto_6122 ) ) ( not ( = ?auto_6121 ?auto_6141 ) ) ( not ( = ?auto_6122 ?auto_6141 ) ) ( not ( = ?auto_6121 ?auto_6123 ) ) ( not ( = ?auto_6121 ?auto_6136 ) ) ( not ( = ?auto_6123 ?auto_6141 ) ) ( not ( = ?auto_6142 ?auto_6140 ) ) ( not ( = ?auto_6134 ?auto_6135 ) ) ( not ( = ?auto_6136 ?auto_6141 ) ) ( not ( = ?auto_6121 ?auto_6124 ) ) ( not ( = ?auto_6121 ?auto_6137 ) ) ( not ( = ?auto_6122 ?auto_6124 ) ) ( not ( = ?auto_6122 ?auto_6137 ) ) ( not ( = ?auto_6124 ?auto_6136 ) ) ( not ( = ?auto_6124 ?auto_6141 ) ) ( not ( = ?auto_6133 ?auto_6142 ) ) ( not ( = ?auto_6133 ?auto_6140 ) ) ( not ( = ?auto_6132 ?auto_6134 ) ) ( not ( = ?auto_6132 ?auto_6135 ) ) ( not ( = ?auto_6137 ?auto_6136 ) ) ( not ( = ?auto_6137 ?auto_6141 ) ) ( not ( = ?auto_6121 ?auto_6125 ) ) ( not ( = ?auto_6121 ?auto_6138 ) ) ( not ( = ?auto_6122 ?auto_6125 ) ) ( not ( = ?auto_6122 ?auto_6138 ) ) ( not ( = ?auto_6123 ?auto_6125 ) ) ( not ( = ?auto_6123 ?auto_6138 ) ) ( not ( = ?auto_6125 ?auto_6137 ) ) ( not ( = ?auto_6125 ?auto_6136 ) ) ( not ( = ?auto_6125 ?auto_6141 ) ) ( not ( = ?auto_6138 ?auto_6137 ) ) ( not ( = ?auto_6138 ?auto_6136 ) ) ( not ( = ?auto_6138 ?auto_6141 ) ) ( not ( = ?auto_6121 ?auto_6126 ) ) ( not ( = ?auto_6121 ?auto_6139 ) ) ( not ( = ?auto_6122 ?auto_6126 ) ) ( not ( = ?auto_6122 ?auto_6139 ) ) ( not ( = ?auto_6123 ?auto_6126 ) ) ( not ( = ?auto_6123 ?auto_6139 ) ) ( not ( = ?auto_6124 ?auto_6126 ) ) ( not ( = ?auto_6124 ?auto_6139 ) ) ( not ( = ?auto_6126 ?auto_6138 ) ) ( not ( = ?auto_6126 ?auto_6137 ) ) ( not ( = ?auto_6126 ?auto_6136 ) ) ( not ( = ?auto_6126 ?auto_6141 ) ) ( not ( = ?auto_6139 ?auto_6138 ) ) ( not ( = ?auto_6139 ?auto_6137 ) ) ( not ( = ?auto_6139 ?auto_6136 ) ) ( not ( = ?auto_6139 ?auto_6141 ) ) ( not ( = ?auto_6121 ?auto_6127 ) ) ( not ( = ?auto_6121 ?auto_6130 ) ) ( not ( = ?auto_6122 ?auto_6127 ) ) ( not ( = ?auto_6122 ?auto_6130 ) ) ( not ( = ?auto_6123 ?auto_6127 ) ) ( not ( = ?auto_6123 ?auto_6130 ) ) ( not ( = ?auto_6124 ?auto_6127 ) ) ( not ( = ?auto_6124 ?auto_6130 ) ) ( not ( = ?auto_6125 ?auto_6127 ) ) ( not ( = ?auto_6125 ?auto_6130 ) ) ( not ( = ?auto_6127 ?auto_6139 ) ) ( not ( = ?auto_6127 ?auto_6138 ) ) ( not ( = ?auto_6127 ?auto_6137 ) ) ( not ( = ?auto_6127 ?auto_6136 ) ) ( not ( = ?auto_6127 ?auto_6141 ) ) ( not ( = ?auto_6130 ?auto_6139 ) ) ( not ( = ?auto_6130 ?auto_6138 ) ) ( not ( = ?auto_6130 ?auto_6137 ) ) ( not ( = ?auto_6130 ?auto_6136 ) ) ( not ( = ?auto_6130 ?auto_6141 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6121 ?auto_6122 ?auto_6123 ?auto_6124 ?auto_6125 ?auto_6126 )
      ( MAKE-1CRATE ?auto_6126 ?auto_6127 )
      ( MAKE-6CRATE-VERIFY ?auto_6121 ?auto_6122 ?auto_6123 ?auto_6124 ?auto_6125 ?auto_6126 ?auto_6127 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6145 - SURFACE
      ?auto_6146 - SURFACE
    )
    :vars
    (
      ?auto_6147 - HOIST
      ?auto_6148 - PLACE
      ?auto_6150 - PLACE
      ?auto_6151 - HOIST
      ?auto_6152 - SURFACE
      ?auto_6149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6147 ?auto_6148 ) ( SURFACE-AT ?auto_6145 ?auto_6148 ) ( CLEAR ?auto_6145 ) ( IS-CRATE ?auto_6146 ) ( AVAILABLE ?auto_6147 ) ( not ( = ?auto_6150 ?auto_6148 ) ) ( HOIST-AT ?auto_6151 ?auto_6150 ) ( AVAILABLE ?auto_6151 ) ( SURFACE-AT ?auto_6146 ?auto_6150 ) ( ON ?auto_6146 ?auto_6152 ) ( CLEAR ?auto_6146 ) ( TRUCK-AT ?auto_6149 ?auto_6148 ) ( not ( = ?auto_6145 ?auto_6146 ) ) ( not ( = ?auto_6145 ?auto_6152 ) ) ( not ( = ?auto_6146 ?auto_6152 ) ) ( not ( = ?auto_6147 ?auto_6151 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6149 ?auto_6148 ?auto_6150 )
      ( !LIFT ?auto_6151 ?auto_6146 ?auto_6152 ?auto_6150 )
      ( !LOAD ?auto_6151 ?auto_6146 ?auto_6149 ?auto_6150 )
      ( !DRIVE ?auto_6149 ?auto_6150 ?auto_6148 )
      ( !UNLOAD ?auto_6147 ?auto_6146 ?auto_6149 ?auto_6148 )
      ( !DROP ?auto_6147 ?auto_6146 ?auto_6145 ?auto_6148 )
      ( MAKE-1CRATE-VERIFY ?auto_6145 ?auto_6146 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_6161 - SURFACE
      ?auto_6162 - SURFACE
      ?auto_6163 - SURFACE
      ?auto_6164 - SURFACE
      ?auto_6165 - SURFACE
      ?auto_6166 - SURFACE
      ?auto_6167 - SURFACE
      ?auto_6168 - SURFACE
    )
    :vars
    (
      ?auto_6170 - HOIST
      ?auto_6171 - PLACE
      ?auto_6169 - PLACE
      ?auto_6174 - HOIST
      ?auto_6173 - SURFACE
      ?auto_6176 - PLACE
      ?auto_6175 - HOIST
      ?auto_6181 - SURFACE
      ?auto_6182 - PLACE
      ?auto_6185 - HOIST
      ?auto_6183 - SURFACE
      ?auto_6184 - SURFACE
      ?auto_6180 - SURFACE
      ?auto_6177 - PLACE
      ?auto_6186 - HOIST
      ?auto_6179 - SURFACE
      ?auto_6178 - SURFACE
      ?auto_6172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6170 ?auto_6171 ) ( IS-CRATE ?auto_6168 ) ( not ( = ?auto_6169 ?auto_6171 ) ) ( HOIST-AT ?auto_6174 ?auto_6169 ) ( AVAILABLE ?auto_6174 ) ( SURFACE-AT ?auto_6168 ?auto_6169 ) ( ON ?auto_6168 ?auto_6173 ) ( CLEAR ?auto_6168 ) ( not ( = ?auto_6167 ?auto_6168 ) ) ( not ( = ?auto_6167 ?auto_6173 ) ) ( not ( = ?auto_6168 ?auto_6173 ) ) ( not ( = ?auto_6170 ?auto_6174 ) ) ( IS-CRATE ?auto_6167 ) ( not ( = ?auto_6176 ?auto_6171 ) ) ( HOIST-AT ?auto_6175 ?auto_6176 ) ( SURFACE-AT ?auto_6167 ?auto_6176 ) ( ON ?auto_6167 ?auto_6181 ) ( CLEAR ?auto_6167 ) ( not ( = ?auto_6166 ?auto_6167 ) ) ( not ( = ?auto_6166 ?auto_6181 ) ) ( not ( = ?auto_6167 ?auto_6181 ) ) ( not ( = ?auto_6170 ?auto_6175 ) ) ( IS-CRATE ?auto_6166 ) ( not ( = ?auto_6182 ?auto_6171 ) ) ( HOIST-AT ?auto_6185 ?auto_6182 ) ( SURFACE-AT ?auto_6166 ?auto_6182 ) ( ON ?auto_6166 ?auto_6183 ) ( CLEAR ?auto_6166 ) ( not ( = ?auto_6165 ?auto_6166 ) ) ( not ( = ?auto_6165 ?auto_6183 ) ) ( not ( = ?auto_6166 ?auto_6183 ) ) ( not ( = ?auto_6170 ?auto_6185 ) ) ( IS-CRATE ?auto_6165 ) ( SURFACE-AT ?auto_6165 ?auto_6176 ) ( ON ?auto_6165 ?auto_6184 ) ( CLEAR ?auto_6165 ) ( not ( = ?auto_6164 ?auto_6165 ) ) ( not ( = ?auto_6164 ?auto_6184 ) ) ( not ( = ?auto_6165 ?auto_6184 ) ) ( IS-CRATE ?auto_6164 ) ( AVAILABLE ?auto_6175 ) ( SURFACE-AT ?auto_6164 ?auto_6176 ) ( ON ?auto_6164 ?auto_6180 ) ( CLEAR ?auto_6164 ) ( not ( = ?auto_6163 ?auto_6164 ) ) ( not ( = ?auto_6163 ?auto_6180 ) ) ( not ( = ?auto_6164 ?auto_6180 ) ) ( IS-CRATE ?auto_6163 ) ( not ( = ?auto_6177 ?auto_6171 ) ) ( HOIST-AT ?auto_6186 ?auto_6177 ) ( AVAILABLE ?auto_6186 ) ( SURFACE-AT ?auto_6163 ?auto_6177 ) ( ON ?auto_6163 ?auto_6179 ) ( CLEAR ?auto_6163 ) ( not ( = ?auto_6162 ?auto_6163 ) ) ( not ( = ?auto_6162 ?auto_6179 ) ) ( not ( = ?auto_6163 ?auto_6179 ) ) ( not ( = ?auto_6170 ?auto_6186 ) ) ( SURFACE-AT ?auto_6161 ?auto_6171 ) ( CLEAR ?auto_6161 ) ( IS-CRATE ?auto_6162 ) ( AVAILABLE ?auto_6170 ) ( AVAILABLE ?auto_6185 ) ( SURFACE-AT ?auto_6162 ?auto_6182 ) ( ON ?auto_6162 ?auto_6178 ) ( CLEAR ?auto_6162 ) ( TRUCK-AT ?auto_6172 ?auto_6171 ) ( not ( = ?auto_6161 ?auto_6162 ) ) ( not ( = ?auto_6161 ?auto_6178 ) ) ( not ( = ?auto_6162 ?auto_6178 ) ) ( not ( = ?auto_6161 ?auto_6163 ) ) ( not ( = ?auto_6161 ?auto_6179 ) ) ( not ( = ?auto_6163 ?auto_6178 ) ) ( not ( = ?auto_6177 ?auto_6182 ) ) ( not ( = ?auto_6186 ?auto_6185 ) ) ( not ( = ?auto_6179 ?auto_6178 ) ) ( not ( = ?auto_6161 ?auto_6164 ) ) ( not ( = ?auto_6161 ?auto_6180 ) ) ( not ( = ?auto_6162 ?auto_6164 ) ) ( not ( = ?auto_6162 ?auto_6180 ) ) ( not ( = ?auto_6164 ?auto_6179 ) ) ( not ( = ?auto_6164 ?auto_6178 ) ) ( not ( = ?auto_6176 ?auto_6177 ) ) ( not ( = ?auto_6176 ?auto_6182 ) ) ( not ( = ?auto_6175 ?auto_6186 ) ) ( not ( = ?auto_6175 ?auto_6185 ) ) ( not ( = ?auto_6180 ?auto_6179 ) ) ( not ( = ?auto_6180 ?auto_6178 ) ) ( not ( = ?auto_6161 ?auto_6165 ) ) ( not ( = ?auto_6161 ?auto_6184 ) ) ( not ( = ?auto_6162 ?auto_6165 ) ) ( not ( = ?auto_6162 ?auto_6184 ) ) ( not ( = ?auto_6163 ?auto_6165 ) ) ( not ( = ?auto_6163 ?auto_6184 ) ) ( not ( = ?auto_6165 ?auto_6180 ) ) ( not ( = ?auto_6165 ?auto_6179 ) ) ( not ( = ?auto_6165 ?auto_6178 ) ) ( not ( = ?auto_6184 ?auto_6180 ) ) ( not ( = ?auto_6184 ?auto_6179 ) ) ( not ( = ?auto_6184 ?auto_6178 ) ) ( not ( = ?auto_6161 ?auto_6166 ) ) ( not ( = ?auto_6161 ?auto_6183 ) ) ( not ( = ?auto_6162 ?auto_6166 ) ) ( not ( = ?auto_6162 ?auto_6183 ) ) ( not ( = ?auto_6163 ?auto_6166 ) ) ( not ( = ?auto_6163 ?auto_6183 ) ) ( not ( = ?auto_6164 ?auto_6166 ) ) ( not ( = ?auto_6164 ?auto_6183 ) ) ( not ( = ?auto_6166 ?auto_6184 ) ) ( not ( = ?auto_6166 ?auto_6180 ) ) ( not ( = ?auto_6166 ?auto_6179 ) ) ( not ( = ?auto_6166 ?auto_6178 ) ) ( not ( = ?auto_6183 ?auto_6184 ) ) ( not ( = ?auto_6183 ?auto_6180 ) ) ( not ( = ?auto_6183 ?auto_6179 ) ) ( not ( = ?auto_6183 ?auto_6178 ) ) ( not ( = ?auto_6161 ?auto_6167 ) ) ( not ( = ?auto_6161 ?auto_6181 ) ) ( not ( = ?auto_6162 ?auto_6167 ) ) ( not ( = ?auto_6162 ?auto_6181 ) ) ( not ( = ?auto_6163 ?auto_6167 ) ) ( not ( = ?auto_6163 ?auto_6181 ) ) ( not ( = ?auto_6164 ?auto_6167 ) ) ( not ( = ?auto_6164 ?auto_6181 ) ) ( not ( = ?auto_6165 ?auto_6167 ) ) ( not ( = ?auto_6165 ?auto_6181 ) ) ( not ( = ?auto_6167 ?auto_6183 ) ) ( not ( = ?auto_6167 ?auto_6184 ) ) ( not ( = ?auto_6167 ?auto_6180 ) ) ( not ( = ?auto_6167 ?auto_6179 ) ) ( not ( = ?auto_6167 ?auto_6178 ) ) ( not ( = ?auto_6181 ?auto_6183 ) ) ( not ( = ?auto_6181 ?auto_6184 ) ) ( not ( = ?auto_6181 ?auto_6180 ) ) ( not ( = ?auto_6181 ?auto_6179 ) ) ( not ( = ?auto_6181 ?auto_6178 ) ) ( not ( = ?auto_6161 ?auto_6168 ) ) ( not ( = ?auto_6161 ?auto_6173 ) ) ( not ( = ?auto_6162 ?auto_6168 ) ) ( not ( = ?auto_6162 ?auto_6173 ) ) ( not ( = ?auto_6163 ?auto_6168 ) ) ( not ( = ?auto_6163 ?auto_6173 ) ) ( not ( = ?auto_6164 ?auto_6168 ) ) ( not ( = ?auto_6164 ?auto_6173 ) ) ( not ( = ?auto_6165 ?auto_6168 ) ) ( not ( = ?auto_6165 ?auto_6173 ) ) ( not ( = ?auto_6166 ?auto_6168 ) ) ( not ( = ?auto_6166 ?auto_6173 ) ) ( not ( = ?auto_6168 ?auto_6181 ) ) ( not ( = ?auto_6168 ?auto_6183 ) ) ( not ( = ?auto_6168 ?auto_6184 ) ) ( not ( = ?auto_6168 ?auto_6180 ) ) ( not ( = ?auto_6168 ?auto_6179 ) ) ( not ( = ?auto_6168 ?auto_6178 ) ) ( not ( = ?auto_6169 ?auto_6176 ) ) ( not ( = ?auto_6169 ?auto_6182 ) ) ( not ( = ?auto_6169 ?auto_6177 ) ) ( not ( = ?auto_6174 ?auto_6175 ) ) ( not ( = ?auto_6174 ?auto_6185 ) ) ( not ( = ?auto_6174 ?auto_6186 ) ) ( not ( = ?auto_6173 ?auto_6181 ) ) ( not ( = ?auto_6173 ?auto_6183 ) ) ( not ( = ?auto_6173 ?auto_6184 ) ) ( not ( = ?auto_6173 ?auto_6180 ) ) ( not ( = ?auto_6173 ?auto_6179 ) ) ( not ( = ?auto_6173 ?auto_6178 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6161 ?auto_6162 ?auto_6163 ?auto_6164 ?auto_6165 ?auto_6166 ?auto_6167 )
      ( MAKE-1CRATE ?auto_6167 ?auto_6168 )
      ( MAKE-7CRATE-VERIFY ?auto_6161 ?auto_6162 ?auto_6163 ?auto_6164 ?auto_6165 ?auto_6166 ?auto_6167 ?auto_6168 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6189 - SURFACE
      ?auto_6190 - SURFACE
    )
    :vars
    (
      ?auto_6191 - HOIST
      ?auto_6192 - PLACE
      ?auto_6194 - PLACE
      ?auto_6195 - HOIST
      ?auto_6196 - SURFACE
      ?auto_6193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6191 ?auto_6192 ) ( SURFACE-AT ?auto_6189 ?auto_6192 ) ( CLEAR ?auto_6189 ) ( IS-CRATE ?auto_6190 ) ( AVAILABLE ?auto_6191 ) ( not ( = ?auto_6194 ?auto_6192 ) ) ( HOIST-AT ?auto_6195 ?auto_6194 ) ( AVAILABLE ?auto_6195 ) ( SURFACE-AT ?auto_6190 ?auto_6194 ) ( ON ?auto_6190 ?auto_6196 ) ( CLEAR ?auto_6190 ) ( TRUCK-AT ?auto_6193 ?auto_6192 ) ( not ( = ?auto_6189 ?auto_6190 ) ) ( not ( = ?auto_6189 ?auto_6196 ) ) ( not ( = ?auto_6190 ?auto_6196 ) ) ( not ( = ?auto_6191 ?auto_6195 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6193 ?auto_6192 ?auto_6194 )
      ( !LIFT ?auto_6195 ?auto_6190 ?auto_6196 ?auto_6194 )
      ( !LOAD ?auto_6195 ?auto_6190 ?auto_6193 ?auto_6194 )
      ( !DRIVE ?auto_6193 ?auto_6194 ?auto_6192 )
      ( !UNLOAD ?auto_6191 ?auto_6190 ?auto_6193 ?auto_6192 )
      ( !DROP ?auto_6191 ?auto_6190 ?auto_6189 ?auto_6192 )
      ( MAKE-1CRATE-VERIFY ?auto_6189 ?auto_6190 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_6206 - SURFACE
      ?auto_6207 - SURFACE
      ?auto_6208 - SURFACE
      ?auto_6209 - SURFACE
      ?auto_6210 - SURFACE
      ?auto_6211 - SURFACE
      ?auto_6212 - SURFACE
      ?auto_6214 - SURFACE
      ?auto_6213 - SURFACE
    )
    :vars
    (
      ?auto_6216 - HOIST
      ?auto_6218 - PLACE
      ?auto_6219 - PLACE
      ?auto_6217 - HOIST
      ?auto_6215 - SURFACE
      ?auto_6230 - PLACE
      ?auto_6222 - HOIST
      ?auto_6231 - SURFACE
      ?auto_6227 - SURFACE
      ?auto_6226 - PLACE
      ?auto_6223 - HOIST
      ?auto_6221 - SURFACE
      ?auto_6224 - SURFACE
      ?auto_6228 - SURFACE
      ?auto_6232 - PLACE
      ?auto_6225 - HOIST
      ?auto_6229 - SURFACE
      ?auto_6233 - SURFACE
      ?auto_6220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6216 ?auto_6218 ) ( IS-CRATE ?auto_6213 ) ( not ( = ?auto_6219 ?auto_6218 ) ) ( HOIST-AT ?auto_6217 ?auto_6219 ) ( SURFACE-AT ?auto_6213 ?auto_6219 ) ( ON ?auto_6213 ?auto_6215 ) ( CLEAR ?auto_6213 ) ( not ( = ?auto_6214 ?auto_6213 ) ) ( not ( = ?auto_6214 ?auto_6215 ) ) ( not ( = ?auto_6213 ?auto_6215 ) ) ( not ( = ?auto_6216 ?auto_6217 ) ) ( IS-CRATE ?auto_6214 ) ( not ( = ?auto_6230 ?auto_6218 ) ) ( HOIST-AT ?auto_6222 ?auto_6230 ) ( AVAILABLE ?auto_6222 ) ( SURFACE-AT ?auto_6214 ?auto_6230 ) ( ON ?auto_6214 ?auto_6231 ) ( CLEAR ?auto_6214 ) ( not ( = ?auto_6212 ?auto_6214 ) ) ( not ( = ?auto_6212 ?auto_6231 ) ) ( not ( = ?auto_6214 ?auto_6231 ) ) ( not ( = ?auto_6216 ?auto_6222 ) ) ( IS-CRATE ?auto_6212 ) ( SURFACE-AT ?auto_6212 ?auto_6219 ) ( ON ?auto_6212 ?auto_6227 ) ( CLEAR ?auto_6212 ) ( not ( = ?auto_6211 ?auto_6212 ) ) ( not ( = ?auto_6211 ?auto_6227 ) ) ( not ( = ?auto_6212 ?auto_6227 ) ) ( IS-CRATE ?auto_6211 ) ( not ( = ?auto_6226 ?auto_6218 ) ) ( HOIST-AT ?auto_6223 ?auto_6226 ) ( SURFACE-AT ?auto_6211 ?auto_6226 ) ( ON ?auto_6211 ?auto_6221 ) ( CLEAR ?auto_6211 ) ( not ( = ?auto_6210 ?auto_6211 ) ) ( not ( = ?auto_6210 ?auto_6221 ) ) ( not ( = ?auto_6211 ?auto_6221 ) ) ( not ( = ?auto_6216 ?auto_6223 ) ) ( IS-CRATE ?auto_6210 ) ( SURFACE-AT ?auto_6210 ?auto_6219 ) ( ON ?auto_6210 ?auto_6224 ) ( CLEAR ?auto_6210 ) ( not ( = ?auto_6209 ?auto_6210 ) ) ( not ( = ?auto_6209 ?auto_6224 ) ) ( not ( = ?auto_6210 ?auto_6224 ) ) ( IS-CRATE ?auto_6209 ) ( AVAILABLE ?auto_6217 ) ( SURFACE-AT ?auto_6209 ?auto_6219 ) ( ON ?auto_6209 ?auto_6228 ) ( CLEAR ?auto_6209 ) ( not ( = ?auto_6208 ?auto_6209 ) ) ( not ( = ?auto_6208 ?auto_6228 ) ) ( not ( = ?auto_6209 ?auto_6228 ) ) ( IS-CRATE ?auto_6208 ) ( not ( = ?auto_6232 ?auto_6218 ) ) ( HOIST-AT ?auto_6225 ?auto_6232 ) ( AVAILABLE ?auto_6225 ) ( SURFACE-AT ?auto_6208 ?auto_6232 ) ( ON ?auto_6208 ?auto_6229 ) ( CLEAR ?auto_6208 ) ( not ( = ?auto_6207 ?auto_6208 ) ) ( not ( = ?auto_6207 ?auto_6229 ) ) ( not ( = ?auto_6208 ?auto_6229 ) ) ( not ( = ?auto_6216 ?auto_6225 ) ) ( SURFACE-AT ?auto_6206 ?auto_6218 ) ( CLEAR ?auto_6206 ) ( IS-CRATE ?auto_6207 ) ( AVAILABLE ?auto_6216 ) ( AVAILABLE ?auto_6223 ) ( SURFACE-AT ?auto_6207 ?auto_6226 ) ( ON ?auto_6207 ?auto_6233 ) ( CLEAR ?auto_6207 ) ( TRUCK-AT ?auto_6220 ?auto_6218 ) ( not ( = ?auto_6206 ?auto_6207 ) ) ( not ( = ?auto_6206 ?auto_6233 ) ) ( not ( = ?auto_6207 ?auto_6233 ) ) ( not ( = ?auto_6206 ?auto_6208 ) ) ( not ( = ?auto_6206 ?auto_6229 ) ) ( not ( = ?auto_6208 ?auto_6233 ) ) ( not ( = ?auto_6232 ?auto_6226 ) ) ( not ( = ?auto_6225 ?auto_6223 ) ) ( not ( = ?auto_6229 ?auto_6233 ) ) ( not ( = ?auto_6206 ?auto_6209 ) ) ( not ( = ?auto_6206 ?auto_6228 ) ) ( not ( = ?auto_6207 ?auto_6209 ) ) ( not ( = ?auto_6207 ?auto_6228 ) ) ( not ( = ?auto_6209 ?auto_6229 ) ) ( not ( = ?auto_6209 ?auto_6233 ) ) ( not ( = ?auto_6219 ?auto_6232 ) ) ( not ( = ?auto_6219 ?auto_6226 ) ) ( not ( = ?auto_6217 ?auto_6225 ) ) ( not ( = ?auto_6217 ?auto_6223 ) ) ( not ( = ?auto_6228 ?auto_6229 ) ) ( not ( = ?auto_6228 ?auto_6233 ) ) ( not ( = ?auto_6206 ?auto_6210 ) ) ( not ( = ?auto_6206 ?auto_6224 ) ) ( not ( = ?auto_6207 ?auto_6210 ) ) ( not ( = ?auto_6207 ?auto_6224 ) ) ( not ( = ?auto_6208 ?auto_6210 ) ) ( not ( = ?auto_6208 ?auto_6224 ) ) ( not ( = ?auto_6210 ?auto_6228 ) ) ( not ( = ?auto_6210 ?auto_6229 ) ) ( not ( = ?auto_6210 ?auto_6233 ) ) ( not ( = ?auto_6224 ?auto_6228 ) ) ( not ( = ?auto_6224 ?auto_6229 ) ) ( not ( = ?auto_6224 ?auto_6233 ) ) ( not ( = ?auto_6206 ?auto_6211 ) ) ( not ( = ?auto_6206 ?auto_6221 ) ) ( not ( = ?auto_6207 ?auto_6211 ) ) ( not ( = ?auto_6207 ?auto_6221 ) ) ( not ( = ?auto_6208 ?auto_6211 ) ) ( not ( = ?auto_6208 ?auto_6221 ) ) ( not ( = ?auto_6209 ?auto_6211 ) ) ( not ( = ?auto_6209 ?auto_6221 ) ) ( not ( = ?auto_6211 ?auto_6224 ) ) ( not ( = ?auto_6211 ?auto_6228 ) ) ( not ( = ?auto_6211 ?auto_6229 ) ) ( not ( = ?auto_6211 ?auto_6233 ) ) ( not ( = ?auto_6221 ?auto_6224 ) ) ( not ( = ?auto_6221 ?auto_6228 ) ) ( not ( = ?auto_6221 ?auto_6229 ) ) ( not ( = ?auto_6221 ?auto_6233 ) ) ( not ( = ?auto_6206 ?auto_6212 ) ) ( not ( = ?auto_6206 ?auto_6227 ) ) ( not ( = ?auto_6207 ?auto_6212 ) ) ( not ( = ?auto_6207 ?auto_6227 ) ) ( not ( = ?auto_6208 ?auto_6212 ) ) ( not ( = ?auto_6208 ?auto_6227 ) ) ( not ( = ?auto_6209 ?auto_6212 ) ) ( not ( = ?auto_6209 ?auto_6227 ) ) ( not ( = ?auto_6210 ?auto_6212 ) ) ( not ( = ?auto_6210 ?auto_6227 ) ) ( not ( = ?auto_6212 ?auto_6221 ) ) ( not ( = ?auto_6212 ?auto_6224 ) ) ( not ( = ?auto_6212 ?auto_6228 ) ) ( not ( = ?auto_6212 ?auto_6229 ) ) ( not ( = ?auto_6212 ?auto_6233 ) ) ( not ( = ?auto_6227 ?auto_6221 ) ) ( not ( = ?auto_6227 ?auto_6224 ) ) ( not ( = ?auto_6227 ?auto_6228 ) ) ( not ( = ?auto_6227 ?auto_6229 ) ) ( not ( = ?auto_6227 ?auto_6233 ) ) ( not ( = ?auto_6206 ?auto_6214 ) ) ( not ( = ?auto_6206 ?auto_6231 ) ) ( not ( = ?auto_6207 ?auto_6214 ) ) ( not ( = ?auto_6207 ?auto_6231 ) ) ( not ( = ?auto_6208 ?auto_6214 ) ) ( not ( = ?auto_6208 ?auto_6231 ) ) ( not ( = ?auto_6209 ?auto_6214 ) ) ( not ( = ?auto_6209 ?auto_6231 ) ) ( not ( = ?auto_6210 ?auto_6214 ) ) ( not ( = ?auto_6210 ?auto_6231 ) ) ( not ( = ?auto_6211 ?auto_6214 ) ) ( not ( = ?auto_6211 ?auto_6231 ) ) ( not ( = ?auto_6214 ?auto_6227 ) ) ( not ( = ?auto_6214 ?auto_6221 ) ) ( not ( = ?auto_6214 ?auto_6224 ) ) ( not ( = ?auto_6214 ?auto_6228 ) ) ( not ( = ?auto_6214 ?auto_6229 ) ) ( not ( = ?auto_6214 ?auto_6233 ) ) ( not ( = ?auto_6230 ?auto_6219 ) ) ( not ( = ?auto_6230 ?auto_6226 ) ) ( not ( = ?auto_6230 ?auto_6232 ) ) ( not ( = ?auto_6222 ?auto_6217 ) ) ( not ( = ?auto_6222 ?auto_6223 ) ) ( not ( = ?auto_6222 ?auto_6225 ) ) ( not ( = ?auto_6231 ?auto_6227 ) ) ( not ( = ?auto_6231 ?auto_6221 ) ) ( not ( = ?auto_6231 ?auto_6224 ) ) ( not ( = ?auto_6231 ?auto_6228 ) ) ( not ( = ?auto_6231 ?auto_6229 ) ) ( not ( = ?auto_6231 ?auto_6233 ) ) ( not ( = ?auto_6206 ?auto_6213 ) ) ( not ( = ?auto_6206 ?auto_6215 ) ) ( not ( = ?auto_6207 ?auto_6213 ) ) ( not ( = ?auto_6207 ?auto_6215 ) ) ( not ( = ?auto_6208 ?auto_6213 ) ) ( not ( = ?auto_6208 ?auto_6215 ) ) ( not ( = ?auto_6209 ?auto_6213 ) ) ( not ( = ?auto_6209 ?auto_6215 ) ) ( not ( = ?auto_6210 ?auto_6213 ) ) ( not ( = ?auto_6210 ?auto_6215 ) ) ( not ( = ?auto_6211 ?auto_6213 ) ) ( not ( = ?auto_6211 ?auto_6215 ) ) ( not ( = ?auto_6212 ?auto_6213 ) ) ( not ( = ?auto_6212 ?auto_6215 ) ) ( not ( = ?auto_6213 ?auto_6231 ) ) ( not ( = ?auto_6213 ?auto_6227 ) ) ( not ( = ?auto_6213 ?auto_6221 ) ) ( not ( = ?auto_6213 ?auto_6224 ) ) ( not ( = ?auto_6213 ?auto_6228 ) ) ( not ( = ?auto_6213 ?auto_6229 ) ) ( not ( = ?auto_6213 ?auto_6233 ) ) ( not ( = ?auto_6215 ?auto_6231 ) ) ( not ( = ?auto_6215 ?auto_6227 ) ) ( not ( = ?auto_6215 ?auto_6221 ) ) ( not ( = ?auto_6215 ?auto_6224 ) ) ( not ( = ?auto_6215 ?auto_6228 ) ) ( not ( = ?auto_6215 ?auto_6229 ) ) ( not ( = ?auto_6215 ?auto_6233 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6206 ?auto_6207 ?auto_6208 ?auto_6209 ?auto_6210 ?auto_6211 ?auto_6212 ?auto_6214 )
      ( MAKE-1CRATE ?auto_6214 ?auto_6213 )
      ( MAKE-8CRATE-VERIFY ?auto_6206 ?auto_6207 ?auto_6208 ?auto_6209 ?auto_6210 ?auto_6211 ?auto_6212 ?auto_6214 ?auto_6213 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6236 - SURFACE
      ?auto_6237 - SURFACE
    )
    :vars
    (
      ?auto_6238 - HOIST
      ?auto_6239 - PLACE
      ?auto_6241 - PLACE
      ?auto_6242 - HOIST
      ?auto_6243 - SURFACE
      ?auto_6240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6238 ?auto_6239 ) ( SURFACE-AT ?auto_6236 ?auto_6239 ) ( CLEAR ?auto_6236 ) ( IS-CRATE ?auto_6237 ) ( AVAILABLE ?auto_6238 ) ( not ( = ?auto_6241 ?auto_6239 ) ) ( HOIST-AT ?auto_6242 ?auto_6241 ) ( AVAILABLE ?auto_6242 ) ( SURFACE-AT ?auto_6237 ?auto_6241 ) ( ON ?auto_6237 ?auto_6243 ) ( CLEAR ?auto_6237 ) ( TRUCK-AT ?auto_6240 ?auto_6239 ) ( not ( = ?auto_6236 ?auto_6237 ) ) ( not ( = ?auto_6236 ?auto_6243 ) ) ( not ( = ?auto_6237 ?auto_6243 ) ) ( not ( = ?auto_6238 ?auto_6242 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6240 ?auto_6239 ?auto_6241 )
      ( !LIFT ?auto_6242 ?auto_6237 ?auto_6243 ?auto_6241 )
      ( !LOAD ?auto_6242 ?auto_6237 ?auto_6240 ?auto_6241 )
      ( !DRIVE ?auto_6240 ?auto_6241 ?auto_6239 )
      ( !UNLOAD ?auto_6238 ?auto_6237 ?auto_6240 ?auto_6239 )
      ( !DROP ?auto_6238 ?auto_6237 ?auto_6236 ?auto_6239 )
      ( MAKE-1CRATE-VERIFY ?auto_6236 ?auto_6237 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_6254 - SURFACE
      ?auto_6255 - SURFACE
      ?auto_6256 - SURFACE
      ?auto_6257 - SURFACE
      ?auto_6258 - SURFACE
      ?auto_6259 - SURFACE
      ?auto_6260 - SURFACE
      ?auto_6263 - SURFACE
      ?auto_6262 - SURFACE
      ?auto_6261 - SURFACE
    )
    :vars
    (
      ?auto_6269 - HOIST
      ?auto_6268 - PLACE
      ?auto_6267 - PLACE
      ?auto_6266 - HOIST
      ?auto_6264 - SURFACE
      ?auto_6283 - SURFACE
      ?auto_6275 - PLACE
      ?auto_6270 - HOIST
      ?auto_6274 - SURFACE
      ?auto_6279 - SURFACE
      ?auto_6280 - PLACE
      ?auto_6282 - HOIST
      ?auto_6272 - SURFACE
      ?auto_6271 - SURFACE
      ?auto_6278 - SURFACE
      ?auto_6276 - PLACE
      ?auto_6281 - HOIST
      ?auto_6273 - SURFACE
      ?auto_6277 - SURFACE
      ?auto_6265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6269 ?auto_6268 ) ( IS-CRATE ?auto_6261 ) ( not ( = ?auto_6267 ?auto_6268 ) ) ( HOIST-AT ?auto_6266 ?auto_6267 ) ( SURFACE-AT ?auto_6261 ?auto_6267 ) ( ON ?auto_6261 ?auto_6264 ) ( CLEAR ?auto_6261 ) ( not ( = ?auto_6262 ?auto_6261 ) ) ( not ( = ?auto_6262 ?auto_6264 ) ) ( not ( = ?auto_6261 ?auto_6264 ) ) ( not ( = ?auto_6269 ?auto_6266 ) ) ( IS-CRATE ?auto_6262 ) ( SURFACE-AT ?auto_6262 ?auto_6267 ) ( ON ?auto_6262 ?auto_6283 ) ( CLEAR ?auto_6262 ) ( not ( = ?auto_6263 ?auto_6262 ) ) ( not ( = ?auto_6263 ?auto_6283 ) ) ( not ( = ?auto_6262 ?auto_6283 ) ) ( IS-CRATE ?auto_6263 ) ( not ( = ?auto_6275 ?auto_6268 ) ) ( HOIST-AT ?auto_6270 ?auto_6275 ) ( AVAILABLE ?auto_6270 ) ( SURFACE-AT ?auto_6263 ?auto_6275 ) ( ON ?auto_6263 ?auto_6274 ) ( CLEAR ?auto_6263 ) ( not ( = ?auto_6260 ?auto_6263 ) ) ( not ( = ?auto_6260 ?auto_6274 ) ) ( not ( = ?auto_6263 ?auto_6274 ) ) ( not ( = ?auto_6269 ?auto_6270 ) ) ( IS-CRATE ?auto_6260 ) ( SURFACE-AT ?auto_6260 ?auto_6267 ) ( ON ?auto_6260 ?auto_6279 ) ( CLEAR ?auto_6260 ) ( not ( = ?auto_6259 ?auto_6260 ) ) ( not ( = ?auto_6259 ?auto_6279 ) ) ( not ( = ?auto_6260 ?auto_6279 ) ) ( IS-CRATE ?auto_6259 ) ( not ( = ?auto_6280 ?auto_6268 ) ) ( HOIST-AT ?auto_6282 ?auto_6280 ) ( SURFACE-AT ?auto_6259 ?auto_6280 ) ( ON ?auto_6259 ?auto_6272 ) ( CLEAR ?auto_6259 ) ( not ( = ?auto_6258 ?auto_6259 ) ) ( not ( = ?auto_6258 ?auto_6272 ) ) ( not ( = ?auto_6259 ?auto_6272 ) ) ( not ( = ?auto_6269 ?auto_6282 ) ) ( IS-CRATE ?auto_6258 ) ( SURFACE-AT ?auto_6258 ?auto_6267 ) ( ON ?auto_6258 ?auto_6271 ) ( CLEAR ?auto_6258 ) ( not ( = ?auto_6257 ?auto_6258 ) ) ( not ( = ?auto_6257 ?auto_6271 ) ) ( not ( = ?auto_6258 ?auto_6271 ) ) ( IS-CRATE ?auto_6257 ) ( AVAILABLE ?auto_6266 ) ( SURFACE-AT ?auto_6257 ?auto_6267 ) ( ON ?auto_6257 ?auto_6278 ) ( CLEAR ?auto_6257 ) ( not ( = ?auto_6256 ?auto_6257 ) ) ( not ( = ?auto_6256 ?auto_6278 ) ) ( not ( = ?auto_6257 ?auto_6278 ) ) ( IS-CRATE ?auto_6256 ) ( not ( = ?auto_6276 ?auto_6268 ) ) ( HOIST-AT ?auto_6281 ?auto_6276 ) ( AVAILABLE ?auto_6281 ) ( SURFACE-AT ?auto_6256 ?auto_6276 ) ( ON ?auto_6256 ?auto_6273 ) ( CLEAR ?auto_6256 ) ( not ( = ?auto_6255 ?auto_6256 ) ) ( not ( = ?auto_6255 ?auto_6273 ) ) ( not ( = ?auto_6256 ?auto_6273 ) ) ( not ( = ?auto_6269 ?auto_6281 ) ) ( SURFACE-AT ?auto_6254 ?auto_6268 ) ( CLEAR ?auto_6254 ) ( IS-CRATE ?auto_6255 ) ( AVAILABLE ?auto_6269 ) ( AVAILABLE ?auto_6282 ) ( SURFACE-AT ?auto_6255 ?auto_6280 ) ( ON ?auto_6255 ?auto_6277 ) ( CLEAR ?auto_6255 ) ( TRUCK-AT ?auto_6265 ?auto_6268 ) ( not ( = ?auto_6254 ?auto_6255 ) ) ( not ( = ?auto_6254 ?auto_6277 ) ) ( not ( = ?auto_6255 ?auto_6277 ) ) ( not ( = ?auto_6254 ?auto_6256 ) ) ( not ( = ?auto_6254 ?auto_6273 ) ) ( not ( = ?auto_6256 ?auto_6277 ) ) ( not ( = ?auto_6276 ?auto_6280 ) ) ( not ( = ?auto_6281 ?auto_6282 ) ) ( not ( = ?auto_6273 ?auto_6277 ) ) ( not ( = ?auto_6254 ?auto_6257 ) ) ( not ( = ?auto_6254 ?auto_6278 ) ) ( not ( = ?auto_6255 ?auto_6257 ) ) ( not ( = ?auto_6255 ?auto_6278 ) ) ( not ( = ?auto_6257 ?auto_6273 ) ) ( not ( = ?auto_6257 ?auto_6277 ) ) ( not ( = ?auto_6267 ?auto_6276 ) ) ( not ( = ?auto_6267 ?auto_6280 ) ) ( not ( = ?auto_6266 ?auto_6281 ) ) ( not ( = ?auto_6266 ?auto_6282 ) ) ( not ( = ?auto_6278 ?auto_6273 ) ) ( not ( = ?auto_6278 ?auto_6277 ) ) ( not ( = ?auto_6254 ?auto_6258 ) ) ( not ( = ?auto_6254 ?auto_6271 ) ) ( not ( = ?auto_6255 ?auto_6258 ) ) ( not ( = ?auto_6255 ?auto_6271 ) ) ( not ( = ?auto_6256 ?auto_6258 ) ) ( not ( = ?auto_6256 ?auto_6271 ) ) ( not ( = ?auto_6258 ?auto_6278 ) ) ( not ( = ?auto_6258 ?auto_6273 ) ) ( not ( = ?auto_6258 ?auto_6277 ) ) ( not ( = ?auto_6271 ?auto_6278 ) ) ( not ( = ?auto_6271 ?auto_6273 ) ) ( not ( = ?auto_6271 ?auto_6277 ) ) ( not ( = ?auto_6254 ?auto_6259 ) ) ( not ( = ?auto_6254 ?auto_6272 ) ) ( not ( = ?auto_6255 ?auto_6259 ) ) ( not ( = ?auto_6255 ?auto_6272 ) ) ( not ( = ?auto_6256 ?auto_6259 ) ) ( not ( = ?auto_6256 ?auto_6272 ) ) ( not ( = ?auto_6257 ?auto_6259 ) ) ( not ( = ?auto_6257 ?auto_6272 ) ) ( not ( = ?auto_6259 ?auto_6271 ) ) ( not ( = ?auto_6259 ?auto_6278 ) ) ( not ( = ?auto_6259 ?auto_6273 ) ) ( not ( = ?auto_6259 ?auto_6277 ) ) ( not ( = ?auto_6272 ?auto_6271 ) ) ( not ( = ?auto_6272 ?auto_6278 ) ) ( not ( = ?auto_6272 ?auto_6273 ) ) ( not ( = ?auto_6272 ?auto_6277 ) ) ( not ( = ?auto_6254 ?auto_6260 ) ) ( not ( = ?auto_6254 ?auto_6279 ) ) ( not ( = ?auto_6255 ?auto_6260 ) ) ( not ( = ?auto_6255 ?auto_6279 ) ) ( not ( = ?auto_6256 ?auto_6260 ) ) ( not ( = ?auto_6256 ?auto_6279 ) ) ( not ( = ?auto_6257 ?auto_6260 ) ) ( not ( = ?auto_6257 ?auto_6279 ) ) ( not ( = ?auto_6258 ?auto_6260 ) ) ( not ( = ?auto_6258 ?auto_6279 ) ) ( not ( = ?auto_6260 ?auto_6272 ) ) ( not ( = ?auto_6260 ?auto_6271 ) ) ( not ( = ?auto_6260 ?auto_6278 ) ) ( not ( = ?auto_6260 ?auto_6273 ) ) ( not ( = ?auto_6260 ?auto_6277 ) ) ( not ( = ?auto_6279 ?auto_6272 ) ) ( not ( = ?auto_6279 ?auto_6271 ) ) ( not ( = ?auto_6279 ?auto_6278 ) ) ( not ( = ?auto_6279 ?auto_6273 ) ) ( not ( = ?auto_6279 ?auto_6277 ) ) ( not ( = ?auto_6254 ?auto_6263 ) ) ( not ( = ?auto_6254 ?auto_6274 ) ) ( not ( = ?auto_6255 ?auto_6263 ) ) ( not ( = ?auto_6255 ?auto_6274 ) ) ( not ( = ?auto_6256 ?auto_6263 ) ) ( not ( = ?auto_6256 ?auto_6274 ) ) ( not ( = ?auto_6257 ?auto_6263 ) ) ( not ( = ?auto_6257 ?auto_6274 ) ) ( not ( = ?auto_6258 ?auto_6263 ) ) ( not ( = ?auto_6258 ?auto_6274 ) ) ( not ( = ?auto_6259 ?auto_6263 ) ) ( not ( = ?auto_6259 ?auto_6274 ) ) ( not ( = ?auto_6263 ?auto_6279 ) ) ( not ( = ?auto_6263 ?auto_6272 ) ) ( not ( = ?auto_6263 ?auto_6271 ) ) ( not ( = ?auto_6263 ?auto_6278 ) ) ( not ( = ?auto_6263 ?auto_6273 ) ) ( not ( = ?auto_6263 ?auto_6277 ) ) ( not ( = ?auto_6275 ?auto_6267 ) ) ( not ( = ?auto_6275 ?auto_6280 ) ) ( not ( = ?auto_6275 ?auto_6276 ) ) ( not ( = ?auto_6270 ?auto_6266 ) ) ( not ( = ?auto_6270 ?auto_6282 ) ) ( not ( = ?auto_6270 ?auto_6281 ) ) ( not ( = ?auto_6274 ?auto_6279 ) ) ( not ( = ?auto_6274 ?auto_6272 ) ) ( not ( = ?auto_6274 ?auto_6271 ) ) ( not ( = ?auto_6274 ?auto_6278 ) ) ( not ( = ?auto_6274 ?auto_6273 ) ) ( not ( = ?auto_6274 ?auto_6277 ) ) ( not ( = ?auto_6254 ?auto_6262 ) ) ( not ( = ?auto_6254 ?auto_6283 ) ) ( not ( = ?auto_6255 ?auto_6262 ) ) ( not ( = ?auto_6255 ?auto_6283 ) ) ( not ( = ?auto_6256 ?auto_6262 ) ) ( not ( = ?auto_6256 ?auto_6283 ) ) ( not ( = ?auto_6257 ?auto_6262 ) ) ( not ( = ?auto_6257 ?auto_6283 ) ) ( not ( = ?auto_6258 ?auto_6262 ) ) ( not ( = ?auto_6258 ?auto_6283 ) ) ( not ( = ?auto_6259 ?auto_6262 ) ) ( not ( = ?auto_6259 ?auto_6283 ) ) ( not ( = ?auto_6260 ?auto_6262 ) ) ( not ( = ?auto_6260 ?auto_6283 ) ) ( not ( = ?auto_6262 ?auto_6274 ) ) ( not ( = ?auto_6262 ?auto_6279 ) ) ( not ( = ?auto_6262 ?auto_6272 ) ) ( not ( = ?auto_6262 ?auto_6271 ) ) ( not ( = ?auto_6262 ?auto_6278 ) ) ( not ( = ?auto_6262 ?auto_6273 ) ) ( not ( = ?auto_6262 ?auto_6277 ) ) ( not ( = ?auto_6283 ?auto_6274 ) ) ( not ( = ?auto_6283 ?auto_6279 ) ) ( not ( = ?auto_6283 ?auto_6272 ) ) ( not ( = ?auto_6283 ?auto_6271 ) ) ( not ( = ?auto_6283 ?auto_6278 ) ) ( not ( = ?auto_6283 ?auto_6273 ) ) ( not ( = ?auto_6283 ?auto_6277 ) ) ( not ( = ?auto_6254 ?auto_6261 ) ) ( not ( = ?auto_6254 ?auto_6264 ) ) ( not ( = ?auto_6255 ?auto_6261 ) ) ( not ( = ?auto_6255 ?auto_6264 ) ) ( not ( = ?auto_6256 ?auto_6261 ) ) ( not ( = ?auto_6256 ?auto_6264 ) ) ( not ( = ?auto_6257 ?auto_6261 ) ) ( not ( = ?auto_6257 ?auto_6264 ) ) ( not ( = ?auto_6258 ?auto_6261 ) ) ( not ( = ?auto_6258 ?auto_6264 ) ) ( not ( = ?auto_6259 ?auto_6261 ) ) ( not ( = ?auto_6259 ?auto_6264 ) ) ( not ( = ?auto_6260 ?auto_6261 ) ) ( not ( = ?auto_6260 ?auto_6264 ) ) ( not ( = ?auto_6263 ?auto_6261 ) ) ( not ( = ?auto_6263 ?auto_6264 ) ) ( not ( = ?auto_6261 ?auto_6283 ) ) ( not ( = ?auto_6261 ?auto_6274 ) ) ( not ( = ?auto_6261 ?auto_6279 ) ) ( not ( = ?auto_6261 ?auto_6272 ) ) ( not ( = ?auto_6261 ?auto_6271 ) ) ( not ( = ?auto_6261 ?auto_6278 ) ) ( not ( = ?auto_6261 ?auto_6273 ) ) ( not ( = ?auto_6261 ?auto_6277 ) ) ( not ( = ?auto_6264 ?auto_6283 ) ) ( not ( = ?auto_6264 ?auto_6274 ) ) ( not ( = ?auto_6264 ?auto_6279 ) ) ( not ( = ?auto_6264 ?auto_6272 ) ) ( not ( = ?auto_6264 ?auto_6271 ) ) ( not ( = ?auto_6264 ?auto_6278 ) ) ( not ( = ?auto_6264 ?auto_6273 ) ) ( not ( = ?auto_6264 ?auto_6277 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6254 ?auto_6255 ?auto_6256 ?auto_6257 ?auto_6258 ?auto_6259 ?auto_6260 ?auto_6263 ?auto_6262 )
      ( MAKE-1CRATE ?auto_6262 ?auto_6261 )
      ( MAKE-9CRATE-VERIFY ?auto_6254 ?auto_6255 ?auto_6256 ?auto_6257 ?auto_6258 ?auto_6259 ?auto_6260 ?auto_6263 ?auto_6262 ?auto_6261 ) )
  )

)

