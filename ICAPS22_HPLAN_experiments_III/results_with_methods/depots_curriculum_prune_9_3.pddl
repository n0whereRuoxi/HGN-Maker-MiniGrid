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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5993 - SURFACE
      ?auto_5994 - SURFACE
      ?auto_5995 - SURFACE
    )
    :vars
    (
      ?auto_5998 - HOIST
      ?auto_5996 - PLACE
      ?auto_5999 - PLACE
      ?auto_6000 - HOIST
      ?auto_6001 - SURFACE
      ?auto_6004 - PLACE
      ?auto_6002 - HOIST
      ?auto_6003 - SURFACE
      ?auto_5997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5998 ?auto_5996 ) ( IS-CRATE ?auto_5995 ) ( not ( = ?auto_5999 ?auto_5996 ) ) ( HOIST-AT ?auto_6000 ?auto_5999 ) ( AVAILABLE ?auto_6000 ) ( SURFACE-AT ?auto_5995 ?auto_5999 ) ( ON ?auto_5995 ?auto_6001 ) ( CLEAR ?auto_5995 ) ( not ( = ?auto_5994 ?auto_5995 ) ) ( not ( = ?auto_5994 ?auto_6001 ) ) ( not ( = ?auto_5995 ?auto_6001 ) ) ( not ( = ?auto_5998 ?auto_6000 ) ) ( SURFACE-AT ?auto_5993 ?auto_5996 ) ( CLEAR ?auto_5993 ) ( IS-CRATE ?auto_5994 ) ( AVAILABLE ?auto_5998 ) ( not ( = ?auto_6004 ?auto_5996 ) ) ( HOIST-AT ?auto_6002 ?auto_6004 ) ( AVAILABLE ?auto_6002 ) ( SURFACE-AT ?auto_5994 ?auto_6004 ) ( ON ?auto_5994 ?auto_6003 ) ( CLEAR ?auto_5994 ) ( TRUCK-AT ?auto_5997 ?auto_5996 ) ( not ( = ?auto_5993 ?auto_5994 ) ) ( not ( = ?auto_5993 ?auto_6003 ) ) ( not ( = ?auto_5994 ?auto_6003 ) ) ( not ( = ?auto_5998 ?auto_6002 ) ) ( not ( = ?auto_5993 ?auto_5995 ) ) ( not ( = ?auto_5993 ?auto_6001 ) ) ( not ( = ?auto_5995 ?auto_6003 ) ) ( not ( = ?auto_5999 ?auto_6004 ) ) ( not ( = ?auto_6000 ?auto_6002 ) ) ( not ( = ?auto_6001 ?auto_6003 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5993 ?auto_5994 )
      ( MAKE-1CRATE ?auto_5994 ?auto_5995 )
      ( MAKE-2CRATE-VERIFY ?auto_5993 ?auto_5994 ?auto_5995 ) )
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
      ?auto_6028 - HOIST
      ?auto_6025 - PLACE
      ?auto_6027 - PLACE
      ?auto_6023 - HOIST
      ?auto_6026 - SURFACE
      ?auto_6032 - PLACE
      ?auto_6029 - HOIST
      ?auto_6033 - SURFACE
      ?auto_6034 - PLACE
      ?auto_6031 - HOIST
      ?auto_6030 - SURFACE
      ?auto_6024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6028 ?auto_6025 ) ( IS-CRATE ?auto_6022 ) ( not ( = ?auto_6027 ?auto_6025 ) ) ( HOIST-AT ?auto_6023 ?auto_6027 ) ( AVAILABLE ?auto_6023 ) ( SURFACE-AT ?auto_6022 ?auto_6027 ) ( ON ?auto_6022 ?auto_6026 ) ( CLEAR ?auto_6022 ) ( not ( = ?auto_6021 ?auto_6022 ) ) ( not ( = ?auto_6021 ?auto_6026 ) ) ( not ( = ?auto_6022 ?auto_6026 ) ) ( not ( = ?auto_6028 ?auto_6023 ) ) ( IS-CRATE ?auto_6021 ) ( not ( = ?auto_6032 ?auto_6025 ) ) ( HOIST-AT ?auto_6029 ?auto_6032 ) ( AVAILABLE ?auto_6029 ) ( SURFACE-AT ?auto_6021 ?auto_6032 ) ( ON ?auto_6021 ?auto_6033 ) ( CLEAR ?auto_6021 ) ( not ( = ?auto_6020 ?auto_6021 ) ) ( not ( = ?auto_6020 ?auto_6033 ) ) ( not ( = ?auto_6021 ?auto_6033 ) ) ( not ( = ?auto_6028 ?auto_6029 ) ) ( SURFACE-AT ?auto_6019 ?auto_6025 ) ( CLEAR ?auto_6019 ) ( IS-CRATE ?auto_6020 ) ( AVAILABLE ?auto_6028 ) ( not ( = ?auto_6034 ?auto_6025 ) ) ( HOIST-AT ?auto_6031 ?auto_6034 ) ( AVAILABLE ?auto_6031 ) ( SURFACE-AT ?auto_6020 ?auto_6034 ) ( ON ?auto_6020 ?auto_6030 ) ( CLEAR ?auto_6020 ) ( TRUCK-AT ?auto_6024 ?auto_6025 ) ( not ( = ?auto_6019 ?auto_6020 ) ) ( not ( = ?auto_6019 ?auto_6030 ) ) ( not ( = ?auto_6020 ?auto_6030 ) ) ( not ( = ?auto_6028 ?auto_6031 ) ) ( not ( = ?auto_6019 ?auto_6021 ) ) ( not ( = ?auto_6019 ?auto_6033 ) ) ( not ( = ?auto_6021 ?auto_6030 ) ) ( not ( = ?auto_6032 ?auto_6034 ) ) ( not ( = ?auto_6029 ?auto_6031 ) ) ( not ( = ?auto_6033 ?auto_6030 ) ) ( not ( = ?auto_6019 ?auto_6022 ) ) ( not ( = ?auto_6019 ?auto_6026 ) ) ( not ( = ?auto_6020 ?auto_6022 ) ) ( not ( = ?auto_6020 ?auto_6026 ) ) ( not ( = ?auto_6022 ?auto_6033 ) ) ( not ( = ?auto_6022 ?auto_6030 ) ) ( not ( = ?auto_6027 ?auto_6032 ) ) ( not ( = ?auto_6027 ?auto_6034 ) ) ( not ( = ?auto_6023 ?auto_6029 ) ) ( not ( = ?auto_6023 ?auto_6031 ) ) ( not ( = ?auto_6026 ?auto_6033 ) ) ( not ( = ?auto_6026 ?auto_6030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6019 ?auto_6020 ?auto_6021 )
      ( MAKE-1CRATE ?auto_6021 ?auto_6022 )
      ( MAKE-3CRATE-VERIFY ?auto_6019 ?auto_6020 ?auto_6021 ?auto_6022 ) )
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
      ?auto_6058 - HOIST
      ?auto_6059 - PLACE
      ?auto_6055 - PLACE
      ?auto_6060 - HOIST
      ?auto_6056 - SURFACE
      ?auto_6064 - SURFACE
      ?auto_6067 - PLACE
      ?auto_6065 - HOIST
      ?auto_6062 - SURFACE
      ?auto_6066 - PLACE
      ?auto_6061 - HOIST
      ?auto_6063 - SURFACE
      ?auto_6057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6058 ?auto_6059 ) ( IS-CRATE ?auto_6054 ) ( not ( = ?auto_6055 ?auto_6059 ) ) ( HOIST-AT ?auto_6060 ?auto_6055 ) ( SURFACE-AT ?auto_6054 ?auto_6055 ) ( ON ?auto_6054 ?auto_6056 ) ( CLEAR ?auto_6054 ) ( not ( = ?auto_6053 ?auto_6054 ) ) ( not ( = ?auto_6053 ?auto_6056 ) ) ( not ( = ?auto_6054 ?auto_6056 ) ) ( not ( = ?auto_6058 ?auto_6060 ) ) ( IS-CRATE ?auto_6053 ) ( AVAILABLE ?auto_6060 ) ( SURFACE-AT ?auto_6053 ?auto_6055 ) ( ON ?auto_6053 ?auto_6064 ) ( CLEAR ?auto_6053 ) ( not ( = ?auto_6052 ?auto_6053 ) ) ( not ( = ?auto_6052 ?auto_6064 ) ) ( not ( = ?auto_6053 ?auto_6064 ) ) ( IS-CRATE ?auto_6052 ) ( not ( = ?auto_6067 ?auto_6059 ) ) ( HOIST-AT ?auto_6065 ?auto_6067 ) ( AVAILABLE ?auto_6065 ) ( SURFACE-AT ?auto_6052 ?auto_6067 ) ( ON ?auto_6052 ?auto_6062 ) ( CLEAR ?auto_6052 ) ( not ( = ?auto_6051 ?auto_6052 ) ) ( not ( = ?auto_6051 ?auto_6062 ) ) ( not ( = ?auto_6052 ?auto_6062 ) ) ( not ( = ?auto_6058 ?auto_6065 ) ) ( SURFACE-AT ?auto_6050 ?auto_6059 ) ( CLEAR ?auto_6050 ) ( IS-CRATE ?auto_6051 ) ( AVAILABLE ?auto_6058 ) ( not ( = ?auto_6066 ?auto_6059 ) ) ( HOIST-AT ?auto_6061 ?auto_6066 ) ( AVAILABLE ?auto_6061 ) ( SURFACE-AT ?auto_6051 ?auto_6066 ) ( ON ?auto_6051 ?auto_6063 ) ( CLEAR ?auto_6051 ) ( TRUCK-AT ?auto_6057 ?auto_6059 ) ( not ( = ?auto_6050 ?auto_6051 ) ) ( not ( = ?auto_6050 ?auto_6063 ) ) ( not ( = ?auto_6051 ?auto_6063 ) ) ( not ( = ?auto_6058 ?auto_6061 ) ) ( not ( = ?auto_6050 ?auto_6052 ) ) ( not ( = ?auto_6050 ?auto_6062 ) ) ( not ( = ?auto_6052 ?auto_6063 ) ) ( not ( = ?auto_6067 ?auto_6066 ) ) ( not ( = ?auto_6065 ?auto_6061 ) ) ( not ( = ?auto_6062 ?auto_6063 ) ) ( not ( = ?auto_6050 ?auto_6053 ) ) ( not ( = ?auto_6050 ?auto_6064 ) ) ( not ( = ?auto_6051 ?auto_6053 ) ) ( not ( = ?auto_6051 ?auto_6064 ) ) ( not ( = ?auto_6053 ?auto_6062 ) ) ( not ( = ?auto_6053 ?auto_6063 ) ) ( not ( = ?auto_6055 ?auto_6067 ) ) ( not ( = ?auto_6055 ?auto_6066 ) ) ( not ( = ?auto_6060 ?auto_6065 ) ) ( not ( = ?auto_6060 ?auto_6061 ) ) ( not ( = ?auto_6064 ?auto_6062 ) ) ( not ( = ?auto_6064 ?auto_6063 ) ) ( not ( = ?auto_6050 ?auto_6054 ) ) ( not ( = ?auto_6050 ?auto_6056 ) ) ( not ( = ?auto_6051 ?auto_6054 ) ) ( not ( = ?auto_6051 ?auto_6056 ) ) ( not ( = ?auto_6052 ?auto_6054 ) ) ( not ( = ?auto_6052 ?auto_6056 ) ) ( not ( = ?auto_6054 ?auto_6064 ) ) ( not ( = ?auto_6054 ?auto_6062 ) ) ( not ( = ?auto_6054 ?auto_6063 ) ) ( not ( = ?auto_6056 ?auto_6064 ) ) ( not ( = ?auto_6056 ?auto_6062 ) ) ( not ( = ?auto_6056 ?auto_6063 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6050 ?auto_6051 ?auto_6052 ?auto_6053 )
      ( MAKE-1CRATE ?auto_6053 ?auto_6054 )
      ( MAKE-4CRATE-VERIFY ?auto_6050 ?auto_6051 ?auto_6052 ?auto_6053 ?auto_6054 ) )
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
      ?auto_6090 - HOIST
      ?auto_6095 - PLACE
      ?auto_6091 - PLACE
      ?auto_6094 - HOIST
      ?auto_6092 - SURFACE
      ?auto_6099 - PLACE
      ?auto_6102 - HOIST
      ?auto_6103 - SURFACE
      ?auto_6097 - SURFACE
      ?auto_6100 - PLACE
      ?auto_6101 - HOIST
      ?auto_6096 - SURFACE
      ?auto_6098 - SURFACE
      ?auto_6093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6090 ?auto_6095 ) ( IS-CRATE ?auto_6089 ) ( not ( = ?auto_6091 ?auto_6095 ) ) ( HOIST-AT ?auto_6094 ?auto_6091 ) ( SURFACE-AT ?auto_6089 ?auto_6091 ) ( ON ?auto_6089 ?auto_6092 ) ( CLEAR ?auto_6089 ) ( not ( = ?auto_6088 ?auto_6089 ) ) ( not ( = ?auto_6088 ?auto_6092 ) ) ( not ( = ?auto_6089 ?auto_6092 ) ) ( not ( = ?auto_6090 ?auto_6094 ) ) ( IS-CRATE ?auto_6088 ) ( not ( = ?auto_6099 ?auto_6095 ) ) ( HOIST-AT ?auto_6102 ?auto_6099 ) ( SURFACE-AT ?auto_6088 ?auto_6099 ) ( ON ?auto_6088 ?auto_6103 ) ( CLEAR ?auto_6088 ) ( not ( = ?auto_6087 ?auto_6088 ) ) ( not ( = ?auto_6087 ?auto_6103 ) ) ( not ( = ?auto_6088 ?auto_6103 ) ) ( not ( = ?auto_6090 ?auto_6102 ) ) ( IS-CRATE ?auto_6087 ) ( AVAILABLE ?auto_6102 ) ( SURFACE-AT ?auto_6087 ?auto_6099 ) ( ON ?auto_6087 ?auto_6097 ) ( CLEAR ?auto_6087 ) ( not ( = ?auto_6086 ?auto_6087 ) ) ( not ( = ?auto_6086 ?auto_6097 ) ) ( not ( = ?auto_6087 ?auto_6097 ) ) ( IS-CRATE ?auto_6086 ) ( not ( = ?auto_6100 ?auto_6095 ) ) ( HOIST-AT ?auto_6101 ?auto_6100 ) ( AVAILABLE ?auto_6101 ) ( SURFACE-AT ?auto_6086 ?auto_6100 ) ( ON ?auto_6086 ?auto_6096 ) ( CLEAR ?auto_6086 ) ( not ( = ?auto_6085 ?auto_6086 ) ) ( not ( = ?auto_6085 ?auto_6096 ) ) ( not ( = ?auto_6086 ?auto_6096 ) ) ( not ( = ?auto_6090 ?auto_6101 ) ) ( SURFACE-AT ?auto_6084 ?auto_6095 ) ( CLEAR ?auto_6084 ) ( IS-CRATE ?auto_6085 ) ( AVAILABLE ?auto_6090 ) ( AVAILABLE ?auto_6094 ) ( SURFACE-AT ?auto_6085 ?auto_6091 ) ( ON ?auto_6085 ?auto_6098 ) ( CLEAR ?auto_6085 ) ( TRUCK-AT ?auto_6093 ?auto_6095 ) ( not ( = ?auto_6084 ?auto_6085 ) ) ( not ( = ?auto_6084 ?auto_6098 ) ) ( not ( = ?auto_6085 ?auto_6098 ) ) ( not ( = ?auto_6084 ?auto_6086 ) ) ( not ( = ?auto_6084 ?auto_6096 ) ) ( not ( = ?auto_6086 ?auto_6098 ) ) ( not ( = ?auto_6100 ?auto_6091 ) ) ( not ( = ?auto_6101 ?auto_6094 ) ) ( not ( = ?auto_6096 ?auto_6098 ) ) ( not ( = ?auto_6084 ?auto_6087 ) ) ( not ( = ?auto_6084 ?auto_6097 ) ) ( not ( = ?auto_6085 ?auto_6087 ) ) ( not ( = ?auto_6085 ?auto_6097 ) ) ( not ( = ?auto_6087 ?auto_6096 ) ) ( not ( = ?auto_6087 ?auto_6098 ) ) ( not ( = ?auto_6099 ?auto_6100 ) ) ( not ( = ?auto_6099 ?auto_6091 ) ) ( not ( = ?auto_6102 ?auto_6101 ) ) ( not ( = ?auto_6102 ?auto_6094 ) ) ( not ( = ?auto_6097 ?auto_6096 ) ) ( not ( = ?auto_6097 ?auto_6098 ) ) ( not ( = ?auto_6084 ?auto_6088 ) ) ( not ( = ?auto_6084 ?auto_6103 ) ) ( not ( = ?auto_6085 ?auto_6088 ) ) ( not ( = ?auto_6085 ?auto_6103 ) ) ( not ( = ?auto_6086 ?auto_6088 ) ) ( not ( = ?auto_6086 ?auto_6103 ) ) ( not ( = ?auto_6088 ?auto_6097 ) ) ( not ( = ?auto_6088 ?auto_6096 ) ) ( not ( = ?auto_6088 ?auto_6098 ) ) ( not ( = ?auto_6103 ?auto_6097 ) ) ( not ( = ?auto_6103 ?auto_6096 ) ) ( not ( = ?auto_6103 ?auto_6098 ) ) ( not ( = ?auto_6084 ?auto_6089 ) ) ( not ( = ?auto_6084 ?auto_6092 ) ) ( not ( = ?auto_6085 ?auto_6089 ) ) ( not ( = ?auto_6085 ?auto_6092 ) ) ( not ( = ?auto_6086 ?auto_6089 ) ) ( not ( = ?auto_6086 ?auto_6092 ) ) ( not ( = ?auto_6087 ?auto_6089 ) ) ( not ( = ?auto_6087 ?auto_6092 ) ) ( not ( = ?auto_6089 ?auto_6103 ) ) ( not ( = ?auto_6089 ?auto_6097 ) ) ( not ( = ?auto_6089 ?auto_6096 ) ) ( not ( = ?auto_6089 ?auto_6098 ) ) ( not ( = ?auto_6092 ?auto_6103 ) ) ( not ( = ?auto_6092 ?auto_6097 ) ) ( not ( = ?auto_6092 ?auto_6096 ) ) ( not ( = ?auto_6092 ?auto_6098 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6084 ?auto_6085 ?auto_6086 ?auto_6087 ?auto_6088 )
      ( MAKE-1CRATE ?auto_6088 ?auto_6089 )
      ( MAKE-5CRATE-VERIFY ?auto_6084 ?auto_6085 ?auto_6086 ?auto_6087 ?auto_6088 ?auto_6089 ) )
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
      ?auto_6131 - HOIST
      ?auto_6129 - PLACE
      ?auto_6128 - PLACE
      ?auto_6130 - HOIST
      ?auto_6133 - SURFACE
      ?auto_6136 - PLACE
      ?auto_6137 - HOIST
      ?auto_6134 - SURFACE
      ?auto_6142 - SURFACE
      ?auto_6141 - SURFACE
      ?auto_6140 - PLACE
      ?auto_6139 - HOIST
      ?auto_6135 - SURFACE
      ?auto_6138 - SURFACE
      ?auto_6132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6131 ?auto_6129 ) ( IS-CRATE ?auto_6127 ) ( not ( = ?auto_6128 ?auto_6129 ) ) ( HOIST-AT ?auto_6130 ?auto_6128 ) ( SURFACE-AT ?auto_6127 ?auto_6128 ) ( ON ?auto_6127 ?auto_6133 ) ( CLEAR ?auto_6127 ) ( not ( = ?auto_6126 ?auto_6127 ) ) ( not ( = ?auto_6126 ?auto_6133 ) ) ( not ( = ?auto_6127 ?auto_6133 ) ) ( not ( = ?auto_6131 ?auto_6130 ) ) ( IS-CRATE ?auto_6126 ) ( not ( = ?auto_6136 ?auto_6129 ) ) ( HOIST-AT ?auto_6137 ?auto_6136 ) ( SURFACE-AT ?auto_6126 ?auto_6136 ) ( ON ?auto_6126 ?auto_6134 ) ( CLEAR ?auto_6126 ) ( not ( = ?auto_6125 ?auto_6126 ) ) ( not ( = ?auto_6125 ?auto_6134 ) ) ( not ( = ?auto_6126 ?auto_6134 ) ) ( not ( = ?auto_6131 ?auto_6137 ) ) ( IS-CRATE ?auto_6125 ) ( SURFACE-AT ?auto_6125 ?auto_6128 ) ( ON ?auto_6125 ?auto_6142 ) ( CLEAR ?auto_6125 ) ( not ( = ?auto_6124 ?auto_6125 ) ) ( not ( = ?auto_6124 ?auto_6142 ) ) ( not ( = ?auto_6125 ?auto_6142 ) ) ( IS-CRATE ?auto_6124 ) ( AVAILABLE ?auto_6130 ) ( SURFACE-AT ?auto_6124 ?auto_6128 ) ( ON ?auto_6124 ?auto_6141 ) ( CLEAR ?auto_6124 ) ( not ( = ?auto_6123 ?auto_6124 ) ) ( not ( = ?auto_6123 ?auto_6141 ) ) ( not ( = ?auto_6124 ?auto_6141 ) ) ( IS-CRATE ?auto_6123 ) ( not ( = ?auto_6140 ?auto_6129 ) ) ( HOIST-AT ?auto_6139 ?auto_6140 ) ( AVAILABLE ?auto_6139 ) ( SURFACE-AT ?auto_6123 ?auto_6140 ) ( ON ?auto_6123 ?auto_6135 ) ( CLEAR ?auto_6123 ) ( not ( = ?auto_6122 ?auto_6123 ) ) ( not ( = ?auto_6122 ?auto_6135 ) ) ( not ( = ?auto_6123 ?auto_6135 ) ) ( not ( = ?auto_6131 ?auto_6139 ) ) ( SURFACE-AT ?auto_6121 ?auto_6129 ) ( CLEAR ?auto_6121 ) ( IS-CRATE ?auto_6122 ) ( AVAILABLE ?auto_6131 ) ( AVAILABLE ?auto_6137 ) ( SURFACE-AT ?auto_6122 ?auto_6136 ) ( ON ?auto_6122 ?auto_6138 ) ( CLEAR ?auto_6122 ) ( TRUCK-AT ?auto_6132 ?auto_6129 ) ( not ( = ?auto_6121 ?auto_6122 ) ) ( not ( = ?auto_6121 ?auto_6138 ) ) ( not ( = ?auto_6122 ?auto_6138 ) ) ( not ( = ?auto_6121 ?auto_6123 ) ) ( not ( = ?auto_6121 ?auto_6135 ) ) ( not ( = ?auto_6123 ?auto_6138 ) ) ( not ( = ?auto_6140 ?auto_6136 ) ) ( not ( = ?auto_6139 ?auto_6137 ) ) ( not ( = ?auto_6135 ?auto_6138 ) ) ( not ( = ?auto_6121 ?auto_6124 ) ) ( not ( = ?auto_6121 ?auto_6141 ) ) ( not ( = ?auto_6122 ?auto_6124 ) ) ( not ( = ?auto_6122 ?auto_6141 ) ) ( not ( = ?auto_6124 ?auto_6135 ) ) ( not ( = ?auto_6124 ?auto_6138 ) ) ( not ( = ?auto_6128 ?auto_6140 ) ) ( not ( = ?auto_6128 ?auto_6136 ) ) ( not ( = ?auto_6130 ?auto_6139 ) ) ( not ( = ?auto_6130 ?auto_6137 ) ) ( not ( = ?auto_6141 ?auto_6135 ) ) ( not ( = ?auto_6141 ?auto_6138 ) ) ( not ( = ?auto_6121 ?auto_6125 ) ) ( not ( = ?auto_6121 ?auto_6142 ) ) ( not ( = ?auto_6122 ?auto_6125 ) ) ( not ( = ?auto_6122 ?auto_6142 ) ) ( not ( = ?auto_6123 ?auto_6125 ) ) ( not ( = ?auto_6123 ?auto_6142 ) ) ( not ( = ?auto_6125 ?auto_6141 ) ) ( not ( = ?auto_6125 ?auto_6135 ) ) ( not ( = ?auto_6125 ?auto_6138 ) ) ( not ( = ?auto_6142 ?auto_6141 ) ) ( not ( = ?auto_6142 ?auto_6135 ) ) ( not ( = ?auto_6142 ?auto_6138 ) ) ( not ( = ?auto_6121 ?auto_6126 ) ) ( not ( = ?auto_6121 ?auto_6134 ) ) ( not ( = ?auto_6122 ?auto_6126 ) ) ( not ( = ?auto_6122 ?auto_6134 ) ) ( not ( = ?auto_6123 ?auto_6126 ) ) ( not ( = ?auto_6123 ?auto_6134 ) ) ( not ( = ?auto_6124 ?auto_6126 ) ) ( not ( = ?auto_6124 ?auto_6134 ) ) ( not ( = ?auto_6126 ?auto_6142 ) ) ( not ( = ?auto_6126 ?auto_6141 ) ) ( not ( = ?auto_6126 ?auto_6135 ) ) ( not ( = ?auto_6126 ?auto_6138 ) ) ( not ( = ?auto_6134 ?auto_6142 ) ) ( not ( = ?auto_6134 ?auto_6141 ) ) ( not ( = ?auto_6134 ?auto_6135 ) ) ( not ( = ?auto_6134 ?auto_6138 ) ) ( not ( = ?auto_6121 ?auto_6127 ) ) ( not ( = ?auto_6121 ?auto_6133 ) ) ( not ( = ?auto_6122 ?auto_6127 ) ) ( not ( = ?auto_6122 ?auto_6133 ) ) ( not ( = ?auto_6123 ?auto_6127 ) ) ( not ( = ?auto_6123 ?auto_6133 ) ) ( not ( = ?auto_6124 ?auto_6127 ) ) ( not ( = ?auto_6124 ?auto_6133 ) ) ( not ( = ?auto_6125 ?auto_6127 ) ) ( not ( = ?auto_6125 ?auto_6133 ) ) ( not ( = ?auto_6127 ?auto_6134 ) ) ( not ( = ?auto_6127 ?auto_6142 ) ) ( not ( = ?auto_6127 ?auto_6141 ) ) ( not ( = ?auto_6127 ?auto_6135 ) ) ( not ( = ?auto_6127 ?auto_6138 ) ) ( not ( = ?auto_6133 ?auto_6134 ) ) ( not ( = ?auto_6133 ?auto_6142 ) ) ( not ( = ?auto_6133 ?auto_6141 ) ) ( not ( = ?auto_6133 ?auto_6135 ) ) ( not ( = ?auto_6133 ?auto_6138 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6121 ?auto_6122 ?auto_6123 ?auto_6124 ?auto_6125 ?auto_6126 )
      ( MAKE-1CRATE ?auto_6126 ?auto_6127 )
      ( MAKE-6CRATE-VERIFY ?auto_6121 ?auto_6122 ?auto_6123 ?auto_6124 ?auto_6125 ?auto_6126 ?auto_6127 ) )
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
      ?auto_6169 - HOIST
      ?auto_6174 - PLACE
      ?auto_6170 - PLACE
      ?auto_6172 - HOIST
      ?auto_6171 - SURFACE
      ?auto_6185 - PLACE
      ?auto_6186 - HOIST
      ?auto_6178 - SURFACE
      ?auto_6183 - PLACE
      ?auto_6181 - HOIST
      ?auto_6176 - SURFACE
      ?auto_6180 - SURFACE
      ?auto_6184 - SURFACE
      ?auto_6179 - PLACE
      ?auto_6182 - HOIST
      ?auto_6177 - SURFACE
      ?auto_6175 - SURFACE
      ?auto_6173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6169 ?auto_6174 ) ( IS-CRATE ?auto_6168 ) ( not ( = ?auto_6170 ?auto_6174 ) ) ( HOIST-AT ?auto_6172 ?auto_6170 ) ( AVAILABLE ?auto_6172 ) ( SURFACE-AT ?auto_6168 ?auto_6170 ) ( ON ?auto_6168 ?auto_6171 ) ( CLEAR ?auto_6168 ) ( not ( = ?auto_6167 ?auto_6168 ) ) ( not ( = ?auto_6167 ?auto_6171 ) ) ( not ( = ?auto_6168 ?auto_6171 ) ) ( not ( = ?auto_6169 ?auto_6172 ) ) ( IS-CRATE ?auto_6167 ) ( not ( = ?auto_6185 ?auto_6174 ) ) ( HOIST-AT ?auto_6186 ?auto_6185 ) ( SURFACE-AT ?auto_6167 ?auto_6185 ) ( ON ?auto_6167 ?auto_6178 ) ( CLEAR ?auto_6167 ) ( not ( = ?auto_6166 ?auto_6167 ) ) ( not ( = ?auto_6166 ?auto_6178 ) ) ( not ( = ?auto_6167 ?auto_6178 ) ) ( not ( = ?auto_6169 ?auto_6186 ) ) ( IS-CRATE ?auto_6166 ) ( not ( = ?auto_6183 ?auto_6174 ) ) ( HOIST-AT ?auto_6181 ?auto_6183 ) ( SURFACE-AT ?auto_6166 ?auto_6183 ) ( ON ?auto_6166 ?auto_6176 ) ( CLEAR ?auto_6166 ) ( not ( = ?auto_6165 ?auto_6166 ) ) ( not ( = ?auto_6165 ?auto_6176 ) ) ( not ( = ?auto_6166 ?auto_6176 ) ) ( not ( = ?auto_6169 ?auto_6181 ) ) ( IS-CRATE ?auto_6165 ) ( SURFACE-AT ?auto_6165 ?auto_6185 ) ( ON ?auto_6165 ?auto_6180 ) ( CLEAR ?auto_6165 ) ( not ( = ?auto_6164 ?auto_6165 ) ) ( not ( = ?auto_6164 ?auto_6180 ) ) ( not ( = ?auto_6165 ?auto_6180 ) ) ( IS-CRATE ?auto_6164 ) ( AVAILABLE ?auto_6186 ) ( SURFACE-AT ?auto_6164 ?auto_6185 ) ( ON ?auto_6164 ?auto_6184 ) ( CLEAR ?auto_6164 ) ( not ( = ?auto_6163 ?auto_6164 ) ) ( not ( = ?auto_6163 ?auto_6184 ) ) ( not ( = ?auto_6164 ?auto_6184 ) ) ( IS-CRATE ?auto_6163 ) ( not ( = ?auto_6179 ?auto_6174 ) ) ( HOIST-AT ?auto_6182 ?auto_6179 ) ( AVAILABLE ?auto_6182 ) ( SURFACE-AT ?auto_6163 ?auto_6179 ) ( ON ?auto_6163 ?auto_6177 ) ( CLEAR ?auto_6163 ) ( not ( = ?auto_6162 ?auto_6163 ) ) ( not ( = ?auto_6162 ?auto_6177 ) ) ( not ( = ?auto_6163 ?auto_6177 ) ) ( not ( = ?auto_6169 ?auto_6182 ) ) ( SURFACE-AT ?auto_6161 ?auto_6174 ) ( CLEAR ?auto_6161 ) ( IS-CRATE ?auto_6162 ) ( AVAILABLE ?auto_6169 ) ( AVAILABLE ?auto_6181 ) ( SURFACE-AT ?auto_6162 ?auto_6183 ) ( ON ?auto_6162 ?auto_6175 ) ( CLEAR ?auto_6162 ) ( TRUCK-AT ?auto_6173 ?auto_6174 ) ( not ( = ?auto_6161 ?auto_6162 ) ) ( not ( = ?auto_6161 ?auto_6175 ) ) ( not ( = ?auto_6162 ?auto_6175 ) ) ( not ( = ?auto_6161 ?auto_6163 ) ) ( not ( = ?auto_6161 ?auto_6177 ) ) ( not ( = ?auto_6163 ?auto_6175 ) ) ( not ( = ?auto_6179 ?auto_6183 ) ) ( not ( = ?auto_6182 ?auto_6181 ) ) ( not ( = ?auto_6177 ?auto_6175 ) ) ( not ( = ?auto_6161 ?auto_6164 ) ) ( not ( = ?auto_6161 ?auto_6184 ) ) ( not ( = ?auto_6162 ?auto_6164 ) ) ( not ( = ?auto_6162 ?auto_6184 ) ) ( not ( = ?auto_6164 ?auto_6177 ) ) ( not ( = ?auto_6164 ?auto_6175 ) ) ( not ( = ?auto_6185 ?auto_6179 ) ) ( not ( = ?auto_6185 ?auto_6183 ) ) ( not ( = ?auto_6186 ?auto_6182 ) ) ( not ( = ?auto_6186 ?auto_6181 ) ) ( not ( = ?auto_6184 ?auto_6177 ) ) ( not ( = ?auto_6184 ?auto_6175 ) ) ( not ( = ?auto_6161 ?auto_6165 ) ) ( not ( = ?auto_6161 ?auto_6180 ) ) ( not ( = ?auto_6162 ?auto_6165 ) ) ( not ( = ?auto_6162 ?auto_6180 ) ) ( not ( = ?auto_6163 ?auto_6165 ) ) ( not ( = ?auto_6163 ?auto_6180 ) ) ( not ( = ?auto_6165 ?auto_6184 ) ) ( not ( = ?auto_6165 ?auto_6177 ) ) ( not ( = ?auto_6165 ?auto_6175 ) ) ( not ( = ?auto_6180 ?auto_6184 ) ) ( not ( = ?auto_6180 ?auto_6177 ) ) ( not ( = ?auto_6180 ?auto_6175 ) ) ( not ( = ?auto_6161 ?auto_6166 ) ) ( not ( = ?auto_6161 ?auto_6176 ) ) ( not ( = ?auto_6162 ?auto_6166 ) ) ( not ( = ?auto_6162 ?auto_6176 ) ) ( not ( = ?auto_6163 ?auto_6166 ) ) ( not ( = ?auto_6163 ?auto_6176 ) ) ( not ( = ?auto_6164 ?auto_6166 ) ) ( not ( = ?auto_6164 ?auto_6176 ) ) ( not ( = ?auto_6166 ?auto_6180 ) ) ( not ( = ?auto_6166 ?auto_6184 ) ) ( not ( = ?auto_6166 ?auto_6177 ) ) ( not ( = ?auto_6166 ?auto_6175 ) ) ( not ( = ?auto_6176 ?auto_6180 ) ) ( not ( = ?auto_6176 ?auto_6184 ) ) ( not ( = ?auto_6176 ?auto_6177 ) ) ( not ( = ?auto_6176 ?auto_6175 ) ) ( not ( = ?auto_6161 ?auto_6167 ) ) ( not ( = ?auto_6161 ?auto_6178 ) ) ( not ( = ?auto_6162 ?auto_6167 ) ) ( not ( = ?auto_6162 ?auto_6178 ) ) ( not ( = ?auto_6163 ?auto_6167 ) ) ( not ( = ?auto_6163 ?auto_6178 ) ) ( not ( = ?auto_6164 ?auto_6167 ) ) ( not ( = ?auto_6164 ?auto_6178 ) ) ( not ( = ?auto_6165 ?auto_6167 ) ) ( not ( = ?auto_6165 ?auto_6178 ) ) ( not ( = ?auto_6167 ?auto_6176 ) ) ( not ( = ?auto_6167 ?auto_6180 ) ) ( not ( = ?auto_6167 ?auto_6184 ) ) ( not ( = ?auto_6167 ?auto_6177 ) ) ( not ( = ?auto_6167 ?auto_6175 ) ) ( not ( = ?auto_6178 ?auto_6176 ) ) ( not ( = ?auto_6178 ?auto_6180 ) ) ( not ( = ?auto_6178 ?auto_6184 ) ) ( not ( = ?auto_6178 ?auto_6177 ) ) ( not ( = ?auto_6178 ?auto_6175 ) ) ( not ( = ?auto_6161 ?auto_6168 ) ) ( not ( = ?auto_6161 ?auto_6171 ) ) ( not ( = ?auto_6162 ?auto_6168 ) ) ( not ( = ?auto_6162 ?auto_6171 ) ) ( not ( = ?auto_6163 ?auto_6168 ) ) ( not ( = ?auto_6163 ?auto_6171 ) ) ( not ( = ?auto_6164 ?auto_6168 ) ) ( not ( = ?auto_6164 ?auto_6171 ) ) ( not ( = ?auto_6165 ?auto_6168 ) ) ( not ( = ?auto_6165 ?auto_6171 ) ) ( not ( = ?auto_6166 ?auto_6168 ) ) ( not ( = ?auto_6166 ?auto_6171 ) ) ( not ( = ?auto_6168 ?auto_6178 ) ) ( not ( = ?auto_6168 ?auto_6176 ) ) ( not ( = ?auto_6168 ?auto_6180 ) ) ( not ( = ?auto_6168 ?auto_6184 ) ) ( not ( = ?auto_6168 ?auto_6177 ) ) ( not ( = ?auto_6168 ?auto_6175 ) ) ( not ( = ?auto_6170 ?auto_6185 ) ) ( not ( = ?auto_6170 ?auto_6183 ) ) ( not ( = ?auto_6170 ?auto_6179 ) ) ( not ( = ?auto_6172 ?auto_6186 ) ) ( not ( = ?auto_6172 ?auto_6181 ) ) ( not ( = ?auto_6172 ?auto_6182 ) ) ( not ( = ?auto_6171 ?auto_6178 ) ) ( not ( = ?auto_6171 ?auto_6176 ) ) ( not ( = ?auto_6171 ?auto_6180 ) ) ( not ( = ?auto_6171 ?auto_6184 ) ) ( not ( = ?auto_6171 ?auto_6177 ) ) ( not ( = ?auto_6171 ?auto_6175 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6161 ?auto_6162 ?auto_6163 ?auto_6164 ?auto_6165 ?auto_6166 ?auto_6167 )
      ( MAKE-1CRATE ?auto_6167 ?auto_6168 )
      ( MAKE-7CRATE-VERIFY ?auto_6161 ?auto_6162 ?auto_6163 ?auto_6164 ?auto_6165 ?auto_6166 ?auto_6167 ?auto_6168 ) )
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
      ?auto_6213 - SURFACE
      ?auto_6214 - SURFACE
    )
    :vars
    (
      ?auto_6218 - HOIST
      ?auto_6220 - PLACE
      ?auto_6215 - PLACE
      ?auto_6216 - HOIST
      ?auto_6217 - SURFACE
      ?auto_6221 - PLACE
      ?auto_6233 - HOIST
      ?auto_6225 - SURFACE
      ?auto_6223 - SURFACE
      ?auto_6231 - PLACE
      ?auto_6229 - HOIST
      ?auto_6232 - SURFACE
      ?auto_6224 - SURFACE
      ?auto_6230 - SURFACE
      ?auto_6222 - PLACE
      ?auto_6227 - HOIST
      ?auto_6226 - SURFACE
      ?auto_6228 - SURFACE
      ?auto_6219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6218 ?auto_6220 ) ( IS-CRATE ?auto_6214 ) ( not ( = ?auto_6215 ?auto_6220 ) ) ( HOIST-AT ?auto_6216 ?auto_6215 ) ( SURFACE-AT ?auto_6214 ?auto_6215 ) ( ON ?auto_6214 ?auto_6217 ) ( CLEAR ?auto_6214 ) ( not ( = ?auto_6213 ?auto_6214 ) ) ( not ( = ?auto_6213 ?auto_6217 ) ) ( not ( = ?auto_6214 ?auto_6217 ) ) ( not ( = ?auto_6218 ?auto_6216 ) ) ( IS-CRATE ?auto_6213 ) ( not ( = ?auto_6221 ?auto_6220 ) ) ( HOIST-AT ?auto_6233 ?auto_6221 ) ( AVAILABLE ?auto_6233 ) ( SURFACE-AT ?auto_6213 ?auto_6221 ) ( ON ?auto_6213 ?auto_6225 ) ( CLEAR ?auto_6213 ) ( not ( = ?auto_6212 ?auto_6213 ) ) ( not ( = ?auto_6212 ?auto_6225 ) ) ( not ( = ?auto_6213 ?auto_6225 ) ) ( not ( = ?auto_6218 ?auto_6233 ) ) ( IS-CRATE ?auto_6212 ) ( SURFACE-AT ?auto_6212 ?auto_6215 ) ( ON ?auto_6212 ?auto_6223 ) ( CLEAR ?auto_6212 ) ( not ( = ?auto_6211 ?auto_6212 ) ) ( not ( = ?auto_6211 ?auto_6223 ) ) ( not ( = ?auto_6212 ?auto_6223 ) ) ( IS-CRATE ?auto_6211 ) ( not ( = ?auto_6231 ?auto_6220 ) ) ( HOIST-AT ?auto_6229 ?auto_6231 ) ( SURFACE-AT ?auto_6211 ?auto_6231 ) ( ON ?auto_6211 ?auto_6232 ) ( CLEAR ?auto_6211 ) ( not ( = ?auto_6210 ?auto_6211 ) ) ( not ( = ?auto_6210 ?auto_6232 ) ) ( not ( = ?auto_6211 ?auto_6232 ) ) ( not ( = ?auto_6218 ?auto_6229 ) ) ( IS-CRATE ?auto_6210 ) ( SURFACE-AT ?auto_6210 ?auto_6215 ) ( ON ?auto_6210 ?auto_6224 ) ( CLEAR ?auto_6210 ) ( not ( = ?auto_6209 ?auto_6210 ) ) ( not ( = ?auto_6209 ?auto_6224 ) ) ( not ( = ?auto_6210 ?auto_6224 ) ) ( IS-CRATE ?auto_6209 ) ( AVAILABLE ?auto_6216 ) ( SURFACE-AT ?auto_6209 ?auto_6215 ) ( ON ?auto_6209 ?auto_6230 ) ( CLEAR ?auto_6209 ) ( not ( = ?auto_6208 ?auto_6209 ) ) ( not ( = ?auto_6208 ?auto_6230 ) ) ( not ( = ?auto_6209 ?auto_6230 ) ) ( IS-CRATE ?auto_6208 ) ( not ( = ?auto_6222 ?auto_6220 ) ) ( HOIST-AT ?auto_6227 ?auto_6222 ) ( AVAILABLE ?auto_6227 ) ( SURFACE-AT ?auto_6208 ?auto_6222 ) ( ON ?auto_6208 ?auto_6226 ) ( CLEAR ?auto_6208 ) ( not ( = ?auto_6207 ?auto_6208 ) ) ( not ( = ?auto_6207 ?auto_6226 ) ) ( not ( = ?auto_6208 ?auto_6226 ) ) ( not ( = ?auto_6218 ?auto_6227 ) ) ( SURFACE-AT ?auto_6206 ?auto_6220 ) ( CLEAR ?auto_6206 ) ( IS-CRATE ?auto_6207 ) ( AVAILABLE ?auto_6218 ) ( AVAILABLE ?auto_6229 ) ( SURFACE-AT ?auto_6207 ?auto_6231 ) ( ON ?auto_6207 ?auto_6228 ) ( CLEAR ?auto_6207 ) ( TRUCK-AT ?auto_6219 ?auto_6220 ) ( not ( = ?auto_6206 ?auto_6207 ) ) ( not ( = ?auto_6206 ?auto_6228 ) ) ( not ( = ?auto_6207 ?auto_6228 ) ) ( not ( = ?auto_6206 ?auto_6208 ) ) ( not ( = ?auto_6206 ?auto_6226 ) ) ( not ( = ?auto_6208 ?auto_6228 ) ) ( not ( = ?auto_6222 ?auto_6231 ) ) ( not ( = ?auto_6227 ?auto_6229 ) ) ( not ( = ?auto_6226 ?auto_6228 ) ) ( not ( = ?auto_6206 ?auto_6209 ) ) ( not ( = ?auto_6206 ?auto_6230 ) ) ( not ( = ?auto_6207 ?auto_6209 ) ) ( not ( = ?auto_6207 ?auto_6230 ) ) ( not ( = ?auto_6209 ?auto_6226 ) ) ( not ( = ?auto_6209 ?auto_6228 ) ) ( not ( = ?auto_6215 ?auto_6222 ) ) ( not ( = ?auto_6215 ?auto_6231 ) ) ( not ( = ?auto_6216 ?auto_6227 ) ) ( not ( = ?auto_6216 ?auto_6229 ) ) ( not ( = ?auto_6230 ?auto_6226 ) ) ( not ( = ?auto_6230 ?auto_6228 ) ) ( not ( = ?auto_6206 ?auto_6210 ) ) ( not ( = ?auto_6206 ?auto_6224 ) ) ( not ( = ?auto_6207 ?auto_6210 ) ) ( not ( = ?auto_6207 ?auto_6224 ) ) ( not ( = ?auto_6208 ?auto_6210 ) ) ( not ( = ?auto_6208 ?auto_6224 ) ) ( not ( = ?auto_6210 ?auto_6230 ) ) ( not ( = ?auto_6210 ?auto_6226 ) ) ( not ( = ?auto_6210 ?auto_6228 ) ) ( not ( = ?auto_6224 ?auto_6230 ) ) ( not ( = ?auto_6224 ?auto_6226 ) ) ( not ( = ?auto_6224 ?auto_6228 ) ) ( not ( = ?auto_6206 ?auto_6211 ) ) ( not ( = ?auto_6206 ?auto_6232 ) ) ( not ( = ?auto_6207 ?auto_6211 ) ) ( not ( = ?auto_6207 ?auto_6232 ) ) ( not ( = ?auto_6208 ?auto_6211 ) ) ( not ( = ?auto_6208 ?auto_6232 ) ) ( not ( = ?auto_6209 ?auto_6211 ) ) ( not ( = ?auto_6209 ?auto_6232 ) ) ( not ( = ?auto_6211 ?auto_6224 ) ) ( not ( = ?auto_6211 ?auto_6230 ) ) ( not ( = ?auto_6211 ?auto_6226 ) ) ( not ( = ?auto_6211 ?auto_6228 ) ) ( not ( = ?auto_6232 ?auto_6224 ) ) ( not ( = ?auto_6232 ?auto_6230 ) ) ( not ( = ?auto_6232 ?auto_6226 ) ) ( not ( = ?auto_6232 ?auto_6228 ) ) ( not ( = ?auto_6206 ?auto_6212 ) ) ( not ( = ?auto_6206 ?auto_6223 ) ) ( not ( = ?auto_6207 ?auto_6212 ) ) ( not ( = ?auto_6207 ?auto_6223 ) ) ( not ( = ?auto_6208 ?auto_6212 ) ) ( not ( = ?auto_6208 ?auto_6223 ) ) ( not ( = ?auto_6209 ?auto_6212 ) ) ( not ( = ?auto_6209 ?auto_6223 ) ) ( not ( = ?auto_6210 ?auto_6212 ) ) ( not ( = ?auto_6210 ?auto_6223 ) ) ( not ( = ?auto_6212 ?auto_6232 ) ) ( not ( = ?auto_6212 ?auto_6224 ) ) ( not ( = ?auto_6212 ?auto_6230 ) ) ( not ( = ?auto_6212 ?auto_6226 ) ) ( not ( = ?auto_6212 ?auto_6228 ) ) ( not ( = ?auto_6223 ?auto_6232 ) ) ( not ( = ?auto_6223 ?auto_6224 ) ) ( not ( = ?auto_6223 ?auto_6230 ) ) ( not ( = ?auto_6223 ?auto_6226 ) ) ( not ( = ?auto_6223 ?auto_6228 ) ) ( not ( = ?auto_6206 ?auto_6213 ) ) ( not ( = ?auto_6206 ?auto_6225 ) ) ( not ( = ?auto_6207 ?auto_6213 ) ) ( not ( = ?auto_6207 ?auto_6225 ) ) ( not ( = ?auto_6208 ?auto_6213 ) ) ( not ( = ?auto_6208 ?auto_6225 ) ) ( not ( = ?auto_6209 ?auto_6213 ) ) ( not ( = ?auto_6209 ?auto_6225 ) ) ( not ( = ?auto_6210 ?auto_6213 ) ) ( not ( = ?auto_6210 ?auto_6225 ) ) ( not ( = ?auto_6211 ?auto_6213 ) ) ( not ( = ?auto_6211 ?auto_6225 ) ) ( not ( = ?auto_6213 ?auto_6223 ) ) ( not ( = ?auto_6213 ?auto_6232 ) ) ( not ( = ?auto_6213 ?auto_6224 ) ) ( not ( = ?auto_6213 ?auto_6230 ) ) ( not ( = ?auto_6213 ?auto_6226 ) ) ( not ( = ?auto_6213 ?auto_6228 ) ) ( not ( = ?auto_6221 ?auto_6215 ) ) ( not ( = ?auto_6221 ?auto_6231 ) ) ( not ( = ?auto_6221 ?auto_6222 ) ) ( not ( = ?auto_6233 ?auto_6216 ) ) ( not ( = ?auto_6233 ?auto_6229 ) ) ( not ( = ?auto_6233 ?auto_6227 ) ) ( not ( = ?auto_6225 ?auto_6223 ) ) ( not ( = ?auto_6225 ?auto_6232 ) ) ( not ( = ?auto_6225 ?auto_6224 ) ) ( not ( = ?auto_6225 ?auto_6230 ) ) ( not ( = ?auto_6225 ?auto_6226 ) ) ( not ( = ?auto_6225 ?auto_6228 ) ) ( not ( = ?auto_6206 ?auto_6214 ) ) ( not ( = ?auto_6206 ?auto_6217 ) ) ( not ( = ?auto_6207 ?auto_6214 ) ) ( not ( = ?auto_6207 ?auto_6217 ) ) ( not ( = ?auto_6208 ?auto_6214 ) ) ( not ( = ?auto_6208 ?auto_6217 ) ) ( not ( = ?auto_6209 ?auto_6214 ) ) ( not ( = ?auto_6209 ?auto_6217 ) ) ( not ( = ?auto_6210 ?auto_6214 ) ) ( not ( = ?auto_6210 ?auto_6217 ) ) ( not ( = ?auto_6211 ?auto_6214 ) ) ( not ( = ?auto_6211 ?auto_6217 ) ) ( not ( = ?auto_6212 ?auto_6214 ) ) ( not ( = ?auto_6212 ?auto_6217 ) ) ( not ( = ?auto_6214 ?auto_6225 ) ) ( not ( = ?auto_6214 ?auto_6223 ) ) ( not ( = ?auto_6214 ?auto_6232 ) ) ( not ( = ?auto_6214 ?auto_6224 ) ) ( not ( = ?auto_6214 ?auto_6230 ) ) ( not ( = ?auto_6214 ?auto_6226 ) ) ( not ( = ?auto_6214 ?auto_6228 ) ) ( not ( = ?auto_6217 ?auto_6225 ) ) ( not ( = ?auto_6217 ?auto_6223 ) ) ( not ( = ?auto_6217 ?auto_6232 ) ) ( not ( = ?auto_6217 ?auto_6224 ) ) ( not ( = ?auto_6217 ?auto_6230 ) ) ( not ( = ?auto_6217 ?auto_6226 ) ) ( not ( = ?auto_6217 ?auto_6228 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6206 ?auto_6207 ?auto_6208 ?auto_6209 ?auto_6210 ?auto_6211 ?auto_6212 ?auto_6213 )
      ( MAKE-1CRATE ?auto_6213 ?auto_6214 )
      ( MAKE-8CRATE-VERIFY ?auto_6206 ?auto_6207 ?auto_6208 ?auto_6209 ?auto_6210 ?auto_6211 ?auto_6212 ?auto_6213 ?auto_6214 ) )
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
      ?auto_6261 - SURFACE
      ?auto_6262 - SURFACE
      ?auto_6263 - SURFACE
    )
    :vars
    (
      ?auto_6265 - HOIST
      ?auto_6266 - PLACE
      ?auto_6268 - PLACE
      ?auto_6269 - HOIST
      ?auto_6267 - SURFACE
      ?auto_6278 - SURFACE
      ?auto_6283 - PLACE
      ?auto_6270 - HOIST
      ?auto_6274 - SURFACE
      ?auto_6281 - SURFACE
      ?auto_6275 - PLACE
      ?auto_6279 - HOIST
      ?auto_6271 - SURFACE
      ?auto_6277 - SURFACE
      ?auto_6280 - SURFACE
      ?auto_6282 - PLACE
      ?auto_6273 - HOIST
      ?auto_6272 - SURFACE
      ?auto_6276 - SURFACE
      ?auto_6264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6265 ?auto_6266 ) ( IS-CRATE ?auto_6263 ) ( not ( = ?auto_6268 ?auto_6266 ) ) ( HOIST-AT ?auto_6269 ?auto_6268 ) ( SURFACE-AT ?auto_6263 ?auto_6268 ) ( ON ?auto_6263 ?auto_6267 ) ( CLEAR ?auto_6263 ) ( not ( = ?auto_6262 ?auto_6263 ) ) ( not ( = ?auto_6262 ?auto_6267 ) ) ( not ( = ?auto_6263 ?auto_6267 ) ) ( not ( = ?auto_6265 ?auto_6269 ) ) ( IS-CRATE ?auto_6262 ) ( SURFACE-AT ?auto_6262 ?auto_6268 ) ( ON ?auto_6262 ?auto_6278 ) ( CLEAR ?auto_6262 ) ( not ( = ?auto_6261 ?auto_6262 ) ) ( not ( = ?auto_6261 ?auto_6278 ) ) ( not ( = ?auto_6262 ?auto_6278 ) ) ( IS-CRATE ?auto_6261 ) ( not ( = ?auto_6283 ?auto_6266 ) ) ( HOIST-AT ?auto_6270 ?auto_6283 ) ( AVAILABLE ?auto_6270 ) ( SURFACE-AT ?auto_6261 ?auto_6283 ) ( ON ?auto_6261 ?auto_6274 ) ( CLEAR ?auto_6261 ) ( not ( = ?auto_6260 ?auto_6261 ) ) ( not ( = ?auto_6260 ?auto_6274 ) ) ( not ( = ?auto_6261 ?auto_6274 ) ) ( not ( = ?auto_6265 ?auto_6270 ) ) ( IS-CRATE ?auto_6260 ) ( SURFACE-AT ?auto_6260 ?auto_6268 ) ( ON ?auto_6260 ?auto_6281 ) ( CLEAR ?auto_6260 ) ( not ( = ?auto_6259 ?auto_6260 ) ) ( not ( = ?auto_6259 ?auto_6281 ) ) ( not ( = ?auto_6260 ?auto_6281 ) ) ( IS-CRATE ?auto_6259 ) ( not ( = ?auto_6275 ?auto_6266 ) ) ( HOIST-AT ?auto_6279 ?auto_6275 ) ( SURFACE-AT ?auto_6259 ?auto_6275 ) ( ON ?auto_6259 ?auto_6271 ) ( CLEAR ?auto_6259 ) ( not ( = ?auto_6258 ?auto_6259 ) ) ( not ( = ?auto_6258 ?auto_6271 ) ) ( not ( = ?auto_6259 ?auto_6271 ) ) ( not ( = ?auto_6265 ?auto_6279 ) ) ( IS-CRATE ?auto_6258 ) ( SURFACE-AT ?auto_6258 ?auto_6268 ) ( ON ?auto_6258 ?auto_6277 ) ( CLEAR ?auto_6258 ) ( not ( = ?auto_6257 ?auto_6258 ) ) ( not ( = ?auto_6257 ?auto_6277 ) ) ( not ( = ?auto_6258 ?auto_6277 ) ) ( IS-CRATE ?auto_6257 ) ( AVAILABLE ?auto_6269 ) ( SURFACE-AT ?auto_6257 ?auto_6268 ) ( ON ?auto_6257 ?auto_6280 ) ( CLEAR ?auto_6257 ) ( not ( = ?auto_6256 ?auto_6257 ) ) ( not ( = ?auto_6256 ?auto_6280 ) ) ( not ( = ?auto_6257 ?auto_6280 ) ) ( IS-CRATE ?auto_6256 ) ( not ( = ?auto_6282 ?auto_6266 ) ) ( HOIST-AT ?auto_6273 ?auto_6282 ) ( AVAILABLE ?auto_6273 ) ( SURFACE-AT ?auto_6256 ?auto_6282 ) ( ON ?auto_6256 ?auto_6272 ) ( CLEAR ?auto_6256 ) ( not ( = ?auto_6255 ?auto_6256 ) ) ( not ( = ?auto_6255 ?auto_6272 ) ) ( not ( = ?auto_6256 ?auto_6272 ) ) ( not ( = ?auto_6265 ?auto_6273 ) ) ( SURFACE-AT ?auto_6254 ?auto_6266 ) ( CLEAR ?auto_6254 ) ( IS-CRATE ?auto_6255 ) ( AVAILABLE ?auto_6265 ) ( AVAILABLE ?auto_6279 ) ( SURFACE-AT ?auto_6255 ?auto_6275 ) ( ON ?auto_6255 ?auto_6276 ) ( CLEAR ?auto_6255 ) ( TRUCK-AT ?auto_6264 ?auto_6266 ) ( not ( = ?auto_6254 ?auto_6255 ) ) ( not ( = ?auto_6254 ?auto_6276 ) ) ( not ( = ?auto_6255 ?auto_6276 ) ) ( not ( = ?auto_6254 ?auto_6256 ) ) ( not ( = ?auto_6254 ?auto_6272 ) ) ( not ( = ?auto_6256 ?auto_6276 ) ) ( not ( = ?auto_6282 ?auto_6275 ) ) ( not ( = ?auto_6273 ?auto_6279 ) ) ( not ( = ?auto_6272 ?auto_6276 ) ) ( not ( = ?auto_6254 ?auto_6257 ) ) ( not ( = ?auto_6254 ?auto_6280 ) ) ( not ( = ?auto_6255 ?auto_6257 ) ) ( not ( = ?auto_6255 ?auto_6280 ) ) ( not ( = ?auto_6257 ?auto_6272 ) ) ( not ( = ?auto_6257 ?auto_6276 ) ) ( not ( = ?auto_6268 ?auto_6282 ) ) ( not ( = ?auto_6268 ?auto_6275 ) ) ( not ( = ?auto_6269 ?auto_6273 ) ) ( not ( = ?auto_6269 ?auto_6279 ) ) ( not ( = ?auto_6280 ?auto_6272 ) ) ( not ( = ?auto_6280 ?auto_6276 ) ) ( not ( = ?auto_6254 ?auto_6258 ) ) ( not ( = ?auto_6254 ?auto_6277 ) ) ( not ( = ?auto_6255 ?auto_6258 ) ) ( not ( = ?auto_6255 ?auto_6277 ) ) ( not ( = ?auto_6256 ?auto_6258 ) ) ( not ( = ?auto_6256 ?auto_6277 ) ) ( not ( = ?auto_6258 ?auto_6280 ) ) ( not ( = ?auto_6258 ?auto_6272 ) ) ( not ( = ?auto_6258 ?auto_6276 ) ) ( not ( = ?auto_6277 ?auto_6280 ) ) ( not ( = ?auto_6277 ?auto_6272 ) ) ( not ( = ?auto_6277 ?auto_6276 ) ) ( not ( = ?auto_6254 ?auto_6259 ) ) ( not ( = ?auto_6254 ?auto_6271 ) ) ( not ( = ?auto_6255 ?auto_6259 ) ) ( not ( = ?auto_6255 ?auto_6271 ) ) ( not ( = ?auto_6256 ?auto_6259 ) ) ( not ( = ?auto_6256 ?auto_6271 ) ) ( not ( = ?auto_6257 ?auto_6259 ) ) ( not ( = ?auto_6257 ?auto_6271 ) ) ( not ( = ?auto_6259 ?auto_6277 ) ) ( not ( = ?auto_6259 ?auto_6280 ) ) ( not ( = ?auto_6259 ?auto_6272 ) ) ( not ( = ?auto_6259 ?auto_6276 ) ) ( not ( = ?auto_6271 ?auto_6277 ) ) ( not ( = ?auto_6271 ?auto_6280 ) ) ( not ( = ?auto_6271 ?auto_6272 ) ) ( not ( = ?auto_6271 ?auto_6276 ) ) ( not ( = ?auto_6254 ?auto_6260 ) ) ( not ( = ?auto_6254 ?auto_6281 ) ) ( not ( = ?auto_6255 ?auto_6260 ) ) ( not ( = ?auto_6255 ?auto_6281 ) ) ( not ( = ?auto_6256 ?auto_6260 ) ) ( not ( = ?auto_6256 ?auto_6281 ) ) ( not ( = ?auto_6257 ?auto_6260 ) ) ( not ( = ?auto_6257 ?auto_6281 ) ) ( not ( = ?auto_6258 ?auto_6260 ) ) ( not ( = ?auto_6258 ?auto_6281 ) ) ( not ( = ?auto_6260 ?auto_6271 ) ) ( not ( = ?auto_6260 ?auto_6277 ) ) ( not ( = ?auto_6260 ?auto_6280 ) ) ( not ( = ?auto_6260 ?auto_6272 ) ) ( not ( = ?auto_6260 ?auto_6276 ) ) ( not ( = ?auto_6281 ?auto_6271 ) ) ( not ( = ?auto_6281 ?auto_6277 ) ) ( not ( = ?auto_6281 ?auto_6280 ) ) ( not ( = ?auto_6281 ?auto_6272 ) ) ( not ( = ?auto_6281 ?auto_6276 ) ) ( not ( = ?auto_6254 ?auto_6261 ) ) ( not ( = ?auto_6254 ?auto_6274 ) ) ( not ( = ?auto_6255 ?auto_6261 ) ) ( not ( = ?auto_6255 ?auto_6274 ) ) ( not ( = ?auto_6256 ?auto_6261 ) ) ( not ( = ?auto_6256 ?auto_6274 ) ) ( not ( = ?auto_6257 ?auto_6261 ) ) ( not ( = ?auto_6257 ?auto_6274 ) ) ( not ( = ?auto_6258 ?auto_6261 ) ) ( not ( = ?auto_6258 ?auto_6274 ) ) ( not ( = ?auto_6259 ?auto_6261 ) ) ( not ( = ?auto_6259 ?auto_6274 ) ) ( not ( = ?auto_6261 ?auto_6281 ) ) ( not ( = ?auto_6261 ?auto_6271 ) ) ( not ( = ?auto_6261 ?auto_6277 ) ) ( not ( = ?auto_6261 ?auto_6280 ) ) ( not ( = ?auto_6261 ?auto_6272 ) ) ( not ( = ?auto_6261 ?auto_6276 ) ) ( not ( = ?auto_6283 ?auto_6268 ) ) ( not ( = ?auto_6283 ?auto_6275 ) ) ( not ( = ?auto_6283 ?auto_6282 ) ) ( not ( = ?auto_6270 ?auto_6269 ) ) ( not ( = ?auto_6270 ?auto_6279 ) ) ( not ( = ?auto_6270 ?auto_6273 ) ) ( not ( = ?auto_6274 ?auto_6281 ) ) ( not ( = ?auto_6274 ?auto_6271 ) ) ( not ( = ?auto_6274 ?auto_6277 ) ) ( not ( = ?auto_6274 ?auto_6280 ) ) ( not ( = ?auto_6274 ?auto_6272 ) ) ( not ( = ?auto_6274 ?auto_6276 ) ) ( not ( = ?auto_6254 ?auto_6262 ) ) ( not ( = ?auto_6254 ?auto_6278 ) ) ( not ( = ?auto_6255 ?auto_6262 ) ) ( not ( = ?auto_6255 ?auto_6278 ) ) ( not ( = ?auto_6256 ?auto_6262 ) ) ( not ( = ?auto_6256 ?auto_6278 ) ) ( not ( = ?auto_6257 ?auto_6262 ) ) ( not ( = ?auto_6257 ?auto_6278 ) ) ( not ( = ?auto_6258 ?auto_6262 ) ) ( not ( = ?auto_6258 ?auto_6278 ) ) ( not ( = ?auto_6259 ?auto_6262 ) ) ( not ( = ?auto_6259 ?auto_6278 ) ) ( not ( = ?auto_6260 ?auto_6262 ) ) ( not ( = ?auto_6260 ?auto_6278 ) ) ( not ( = ?auto_6262 ?auto_6274 ) ) ( not ( = ?auto_6262 ?auto_6281 ) ) ( not ( = ?auto_6262 ?auto_6271 ) ) ( not ( = ?auto_6262 ?auto_6277 ) ) ( not ( = ?auto_6262 ?auto_6280 ) ) ( not ( = ?auto_6262 ?auto_6272 ) ) ( not ( = ?auto_6262 ?auto_6276 ) ) ( not ( = ?auto_6278 ?auto_6274 ) ) ( not ( = ?auto_6278 ?auto_6281 ) ) ( not ( = ?auto_6278 ?auto_6271 ) ) ( not ( = ?auto_6278 ?auto_6277 ) ) ( not ( = ?auto_6278 ?auto_6280 ) ) ( not ( = ?auto_6278 ?auto_6272 ) ) ( not ( = ?auto_6278 ?auto_6276 ) ) ( not ( = ?auto_6254 ?auto_6263 ) ) ( not ( = ?auto_6254 ?auto_6267 ) ) ( not ( = ?auto_6255 ?auto_6263 ) ) ( not ( = ?auto_6255 ?auto_6267 ) ) ( not ( = ?auto_6256 ?auto_6263 ) ) ( not ( = ?auto_6256 ?auto_6267 ) ) ( not ( = ?auto_6257 ?auto_6263 ) ) ( not ( = ?auto_6257 ?auto_6267 ) ) ( not ( = ?auto_6258 ?auto_6263 ) ) ( not ( = ?auto_6258 ?auto_6267 ) ) ( not ( = ?auto_6259 ?auto_6263 ) ) ( not ( = ?auto_6259 ?auto_6267 ) ) ( not ( = ?auto_6260 ?auto_6263 ) ) ( not ( = ?auto_6260 ?auto_6267 ) ) ( not ( = ?auto_6261 ?auto_6263 ) ) ( not ( = ?auto_6261 ?auto_6267 ) ) ( not ( = ?auto_6263 ?auto_6278 ) ) ( not ( = ?auto_6263 ?auto_6274 ) ) ( not ( = ?auto_6263 ?auto_6281 ) ) ( not ( = ?auto_6263 ?auto_6271 ) ) ( not ( = ?auto_6263 ?auto_6277 ) ) ( not ( = ?auto_6263 ?auto_6280 ) ) ( not ( = ?auto_6263 ?auto_6272 ) ) ( not ( = ?auto_6263 ?auto_6276 ) ) ( not ( = ?auto_6267 ?auto_6278 ) ) ( not ( = ?auto_6267 ?auto_6274 ) ) ( not ( = ?auto_6267 ?auto_6281 ) ) ( not ( = ?auto_6267 ?auto_6271 ) ) ( not ( = ?auto_6267 ?auto_6277 ) ) ( not ( = ?auto_6267 ?auto_6280 ) ) ( not ( = ?auto_6267 ?auto_6272 ) ) ( not ( = ?auto_6267 ?auto_6276 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6254 ?auto_6255 ?auto_6256 ?auto_6257 ?auto_6258 ?auto_6259 ?auto_6260 ?auto_6261 ?auto_6262 )
      ( MAKE-1CRATE ?auto_6262 ?auto_6263 )
      ( MAKE-9CRATE-VERIFY ?auto_6254 ?auto_6255 ?auto_6256 ?auto_6257 ?auto_6258 ?auto_6259 ?auto_6260 ?auto_6261 ?auto_6262 ?auto_6263 ) )
  )

)

