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
      ?auto_5994 - SURFACE
      ?auto_5995 - SURFACE
    )
    :vars
    (
      ?auto_5996 - HOIST
      ?auto_5997 - PLACE
      ?auto_5999 - PLACE
      ?auto_6000 - HOIST
      ?auto_6001 - SURFACE
      ?auto_5998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5996 ?auto_5997 ) ( SURFACE-AT ?auto_5994 ?auto_5997 ) ( CLEAR ?auto_5994 ) ( IS-CRATE ?auto_5995 ) ( AVAILABLE ?auto_5996 ) ( not ( = ?auto_5999 ?auto_5997 ) ) ( HOIST-AT ?auto_6000 ?auto_5999 ) ( AVAILABLE ?auto_6000 ) ( SURFACE-AT ?auto_5995 ?auto_5999 ) ( ON ?auto_5995 ?auto_6001 ) ( CLEAR ?auto_5995 ) ( TRUCK-AT ?auto_5998 ?auto_5997 ) ( not ( = ?auto_5994 ?auto_5995 ) ) ( not ( = ?auto_5994 ?auto_6001 ) ) ( not ( = ?auto_5995 ?auto_6001 ) ) ( not ( = ?auto_5996 ?auto_6000 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5998 ?auto_5997 ?auto_5999 )
      ( !LIFT ?auto_6000 ?auto_5995 ?auto_6001 ?auto_5999 )
      ( !LOAD ?auto_6000 ?auto_5995 ?auto_5998 ?auto_5999 )
      ( !DRIVE ?auto_5998 ?auto_5999 ?auto_5997 )
      ( !UNLOAD ?auto_5996 ?auto_5995 ?auto_5998 ?auto_5997 )
      ( !DROP ?auto_5996 ?auto_5995 ?auto_5994 ?auto_5997 )
      ( MAKE-1CRATE-VERIFY ?auto_5994 ?auto_5995 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6015 - SURFACE
      ?auto_6016 - SURFACE
      ?auto_6017 - SURFACE
    )
    :vars
    (
      ?auto_6021 - HOIST
      ?auto_6023 - PLACE
      ?auto_6020 - PLACE
      ?auto_6018 - HOIST
      ?auto_6019 - SURFACE
      ?auto_6024 - PLACE
      ?auto_6025 - HOIST
      ?auto_6026 - SURFACE
      ?auto_6022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6021 ?auto_6023 ) ( IS-CRATE ?auto_6017 ) ( not ( = ?auto_6020 ?auto_6023 ) ) ( HOIST-AT ?auto_6018 ?auto_6020 ) ( AVAILABLE ?auto_6018 ) ( SURFACE-AT ?auto_6017 ?auto_6020 ) ( ON ?auto_6017 ?auto_6019 ) ( CLEAR ?auto_6017 ) ( not ( = ?auto_6016 ?auto_6017 ) ) ( not ( = ?auto_6016 ?auto_6019 ) ) ( not ( = ?auto_6017 ?auto_6019 ) ) ( not ( = ?auto_6021 ?auto_6018 ) ) ( SURFACE-AT ?auto_6015 ?auto_6023 ) ( CLEAR ?auto_6015 ) ( IS-CRATE ?auto_6016 ) ( AVAILABLE ?auto_6021 ) ( not ( = ?auto_6024 ?auto_6023 ) ) ( HOIST-AT ?auto_6025 ?auto_6024 ) ( AVAILABLE ?auto_6025 ) ( SURFACE-AT ?auto_6016 ?auto_6024 ) ( ON ?auto_6016 ?auto_6026 ) ( CLEAR ?auto_6016 ) ( TRUCK-AT ?auto_6022 ?auto_6023 ) ( not ( = ?auto_6015 ?auto_6016 ) ) ( not ( = ?auto_6015 ?auto_6026 ) ) ( not ( = ?auto_6016 ?auto_6026 ) ) ( not ( = ?auto_6021 ?auto_6025 ) ) ( not ( = ?auto_6015 ?auto_6017 ) ) ( not ( = ?auto_6015 ?auto_6019 ) ) ( not ( = ?auto_6017 ?auto_6026 ) ) ( not ( = ?auto_6020 ?auto_6024 ) ) ( not ( = ?auto_6018 ?auto_6025 ) ) ( not ( = ?auto_6019 ?auto_6026 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6015 ?auto_6016 )
      ( MAKE-1CRATE ?auto_6016 ?auto_6017 )
      ( MAKE-2CRATE-VERIFY ?auto_6015 ?auto_6016 ?auto_6017 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6041 - SURFACE
      ?auto_6042 - SURFACE
      ?auto_6043 - SURFACE
      ?auto_6044 - SURFACE
    )
    :vars
    (
      ?auto_6048 - HOIST
      ?auto_6047 - PLACE
      ?auto_6046 - PLACE
      ?auto_6050 - HOIST
      ?auto_6049 - SURFACE
      ?auto_6054 - SURFACE
      ?auto_6052 - PLACE
      ?auto_6053 - HOIST
      ?auto_6051 - SURFACE
      ?auto_6045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6048 ?auto_6047 ) ( IS-CRATE ?auto_6044 ) ( not ( = ?auto_6046 ?auto_6047 ) ) ( HOIST-AT ?auto_6050 ?auto_6046 ) ( SURFACE-AT ?auto_6044 ?auto_6046 ) ( ON ?auto_6044 ?auto_6049 ) ( CLEAR ?auto_6044 ) ( not ( = ?auto_6043 ?auto_6044 ) ) ( not ( = ?auto_6043 ?auto_6049 ) ) ( not ( = ?auto_6044 ?auto_6049 ) ) ( not ( = ?auto_6048 ?auto_6050 ) ) ( IS-CRATE ?auto_6043 ) ( AVAILABLE ?auto_6050 ) ( SURFACE-AT ?auto_6043 ?auto_6046 ) ( ON ?auto_6043 ?auto_6054 ) ( CLEAR ?auto_6043 ) ( not ( = ?auto_6042 ?auto_6043 ) ) ( not ( = ?auto_6042 ?auto_6054 ) ) ( not ( = ?auto_6043 ?auto_6054 ) ) ( SURFACE-AT ?auto_6041 ?auto_6047 ) ( CLEAR ?auto_6041 ) ( IS-CRATE ?auto_6042 ) ( AVAILABLE ?auto_6048 ) ( not ( = ?auto_6052 ?auto_6047 ) ) ( HOIST-AT ?auto_6053 ?auto_6052 ) ( AVAILABLE ?auto_6053 ) ( SURFACE-AT ?auto_6042 ?auto_6052 ) ( ON ?auto_6042 ?auto_6051 ) ( CLEAR ?auto_6042 ) ( TRUCK-AT ?auto_6045 ?auto_6047 ) ( not ( = ?auto_6041 ?auto_6042 ) ) ( not ( = ?auto_6041 ?auto_6051 ) ) ( not ( = ?auto_6042 ?auto_6051 ) ) ( not ( = ?auto_6048 ?auto_6053 ) ) ( not ( = ?auto_6041 ?auto_6043 ) ) ( not ( = ?auto_6041 ?auto_6054 ) ) ( not ( = ?auto_6043 ?auto_6051 ) ) ( not ( = ?auto_6046 ?auto_6052 ) ) ( not ( = ?auto_6050 ?auto_6053 ) ) ( not ( = ?auto_6054 ?auto_6051 ) ) ( not ( = ?auto_6041 ?auto_6044 ) ) ( not ( = ?auto_6041 ?auto_6049 ) ) ( not ( = ?auto_6042 ?auto_6044 ) ) ( not ( = ?auto_6042 ?auto_6049 ) ) ( not ( = ?auto_6044 ?auto_6054 ) ) ( not ( = ?auto_6044 ?auto_6051 ) ) ( not ( = ?auto_6049 ?auto_6054 ) ) ( not ( = ?auto_6049 ?auto_6051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6041 ?auto_6042 ?auto_6043 )
      ( MAKE-1CRATE ?auto_6043 ?auto_6044 )
      ( MAKE-3CRATE-VERIFY ?auto_6041 ?auto_6042 ?auto_6043 ?auto_6044 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6070 - SURFACE
      ?auto_6071 - SURFACE
      ?auto_6072 - SURFACE
      ?auto_6073 - SURFACE
      ?auto_6074 - SURFACE
    )
    :vars
    (
      ?auto_6076 - HOIST
      ?auto_6080 - PLACE
      ?auto_6078 - PLACE
      ?auto_6077 - HOIST
      ?auto_6075 - SURFACE
      ?auto_6087 - PLACE
      ?auto_6086 - HOIST
      ?auto_6082 - SURFACE
      ?auto_6085 - SURFACE
      ?auto_6083 - PLACE
      ?auto_6084 - HOIST
      ?auto_6081 - SURFACE
      ?auto_6079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6076 ?auto_6080 ) ( IS-CRATE ?auto_6074 ) ( not ( = ?auto_6078 ?auto_6080 ) ) ( HOIST-AT ?auto_6077 ?auto_6078 ) ( AVAILABLE ?auto_6077 ) ( SURFACE-AT ?auto_6074 ?auto_6078 ) ( ON ?auto_6074 ?auto_6075 ) ( CLEAR ?auto_6074 ) ( not ( = ?auto_6073 ?auto_6074 ) ) ( not ( = ?auto_6073 ?auto_6075 ) ) ( not ( = ?auto_6074 ?auto_6075 ) ) ( not ( = ?auto_6076 ?auto_6077 ) ) ( IS-CRATE ?auto_6073 ) ( not ( = ?auto_6087 ?auto_6080 ) ) ( HOIST-AT ?auto_6086 ?auto_6087 ) ( SURFACE-AT ?auto_6073 ?auto_6087 ) ( ON ?auto_6073 ?auto_6082 ) ( CLEAR ?auto_6073 ) ( not ( = ?auto_6072 ?auto_6073 ) ) ( not ( = ?auto_6072 ?auto_6082 ) ) ( not ( = ?auto_6073 ?auto_6082 ) ) ( not ( = ?auto_6076 ?auto_6086 ) ) ( IS-CRATE ?auto_6072 ) ( AVAILABLE ?auto_6086 ) ( SURFACE-AT ?auto_6072 ?auto_6087 ) ( ON ?auto_6072 ?auto_6085 ) ( CLEAR ?auto_6072 ) ( not ( = ?auto_6071 ?auto_6072 ) ) ( not ( = ?auto_6071 ?auto_6085 ) ) ( not ( = ?auto_6072 ?auto_6085 ) ) ( SURFACE-AT ?auto_6070 ?auto_6080 ) ( CLEAR ?auto_6070 ) ( IS-CRATE ?auto_6071 ) ( AVAILABLE ?auto_6076 ) ( not ( = ?auto_6083 ?auto_6080 ) ) ( HOIST-AT ?auto_6084 ?auto_6083 ) ( AVAILABLE ?auto_6084 ) ( SURFACE-AT ?auto_6071 ?auto_6083 ) ( ON ?auto_6071 ?auto_6081 ) ( CLEAR ?auto_6071 ) ( TRUCK-AT ?auto_6079 ?auto_6080 ) ( not ( = ?auto_6070 ?auto_6071 ) ) ( not ( = ?auto_6070 ?auto_6081 ) ) ( not ( = ?auto_6071 ?auto_6081 ) ) ( not ( = ?auto_6076 ?auto_6084 ) ) ( not ( = ?auto_6070 ?auto_6072 ) ) ( not ( = ?auto_6070 ?auto_6085 ) ) ( not ( = ?auto_6072 ?auto_6081 ) ) ( not ( = ?auto_6087 ?auto_6083 ) ) ( not ( = ?auto_6086 ?auto_6084 ) ) ( not ( = ?auto_6085 ?auto_6081 ) ) ( not ( = ?auto_6070 ?auto_6073 ) ) ( not ( = ?auto_6070 ?auto_6082 ) ) ( not ( = ?auto_6071 ?auto_6073 ) ) ( not ( = ?auto_6071 ?auto_6082 ) ) ( not ( = ?auto_6073 ?auto_6085 ) ) ( not ( = ?auto_6073 ?auto_6081 ) ) ( not ( = ?auto_6082 ?auto_6085 ) ) ( not ( = ?auto_6082 ?auto_6081 ) ) ( not ( = ?auto_6070 ?auto_6074 ) ) ( not ( = ?auto_6070 ?auto_6075 ) ) ( not ( = ?auto_6071 ?auto_6074 ) ) ( not ( = ?auto_6071 ?auto_6075 ) ) ( not ( = ?auto_6072 ?auto_6074 ) ) ( not ( = ?auto_6072 ?auto_6075 ) ) ( not ( = ?auto_6074 ?auto_6082 ) ) ( not ( = ?auto_6074 ?auto_6085 ) ) ( not ( = ?auto_6074 ?auto_6081 ) ) ( not ( = ?auto_6078 ?auto_6087 ) ) ( not ( = ?auto_6078 ?auto_6083 ) ) ( not ( = ?auto_6077 ?auto_6086 ) ) ( not ( = ?auto_6077 ?auto_6084 ) ) ( not ( = ?auto_6075 ?auto_6082 ) ) ( not ( = ?auto_6075 ?auto_6085 ) ) ( not ( = ?auto_6075 ?auto_6081 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6070 ?auto_6071 ?auto_6072 ?auto_6073 )
      ( MAKE-1CRATE ?auto_6073 ?auto_6074 )
      ( MAKE-4CRATE-VERIFY ?auto_6070 ?auto_6071 ?auto_6072 ?auto_6073 ?auto_6074 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_6104 - SURFACE
      ?auto_6105 - SURFACE
      ?auto_6106 - SURFACE
      ?auto_6107 - SURFACE
      ?auto_6108 - SURFACE
      ?auto_6109 - SURFACE
    )
    :vars
    (
      ?auto_6115 - HOIST
      ?auto_6113 - PLACE
      ?auto_6111 - PLACE
      ?auto_6112 - HOIST
      ?auto_6114 - SURFACE
      ?auto_6122 - PLACE
      ?auto_6123 - HOIST
      ?auto_6118 - SURFACE
      ?auto_6119 - PLACE
      ?auto_6117 - HOIST
      ?auto_6124 - SURFACE
      ?auto_6116 - SURFACE
      ?auto_6121 - PLACE
      ?auto_6125 - HOIST
      ?auto_6120 - SURFACE
      ?auto_6110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6115 ?auto_6113 ) ( IS-CRATE ?auto_6109 ) ( not ( = ?auto_6111 ?auto_6113 ) ) ( HOIST-AT ?auto_6112 ?auto_6111 ) ( AVAILABLE ?auto_6112 ) ( SURFACE-AT ?auto_6109 ?auto_6111 ) ( ON ?auto_6109 ?auto_6114 ) ( CLEAR ?auto_6109 ) ( not ( = ?auto_6108 ?auto_6109 ) ) ( not ( = ?auto_6108 ?auto_6114 ) ) ( not ( = ?auto_6109 ?auto_6114 ) ) ( not ( = ?auto_6115 ?auto_6112 ) ) ( IS-CRATE ?auto_6108 ) ( not ( = ?auto_6122 ?auto_6113 ) ) ( HOIST-AT ?auto_6123 ?auto_6122 ) ( AVAILABLE ?auto_6123 ) ( SURFACE-AT ?auto_6108 ?auto_6122 ) ( ON ?auto_6108 ?auto_6118 ) ( CLEAR ?auto_6108 ) ( not ( = ?auto_6107 ?auto_6108 ) ) ( not ( = ?auto_6107 ?auto_6118 ) ) ( not ( = ?auto_6108 ?auto_6118 ) ) ( not ( = ?auto_6115 ?auto_6123 ) ) ( IS-CRATE ?auto_6107 ) ( not ( = ?auto_6119 ?auto_6113 ) ) ( HOIST-AT ?auto_6117 ?auto_6119 ) ( SURFACE-AT ?auto_6107 ?auto_6119 ) ( ON ?auto_6107 ?auto_6124 ) ( CLEAR ?auto_6107 ) ( not ( = ?auto_6106 ?auto_6107 ) ) ( not ( = ?auto_6106 ?auto_6124 ) ) ( not ( = ?auto_6107 ?auto_6124 ) ) ( not ( = ?auto_6115 ?auto_6117 ) ) ( IS-CRATE ?auto_6106 ) ( AVAILABLE ?auto_6117 ) ( SURFACE-AT ?auto_6106 ?auto_6119 ) ( ON ?auto_6106 ?auto_6116 ) ( CLEAR ?auto_6106 ) ( not ( = ?auto_6105 ?auto_6106 ) ) ( not ( = ?auto_6105 ?auto_6116 ) ) ( not ( = ?auto_6106 ?auto_6116 ) ) ( SURFACE-AT ?auto_6104 ?auto_6113 ) ( CLEAR ?auto_6104 ) ( IS-CRATE ?auto_6105 ) ( AVAILABLE ?auto_6115 ) ( not ( = ?auto_6121 ?auto_6113 ) ) ( HOIST-AT ?auto_6125 ?auto_6121 ) ( AVAILABLE ?auto_6125 ) ( SURFACE-AT ?auto_6105 ?auto_6121 ) ( ON ?auto_6105 ?auto_6120 ) ( CLEAR ?auto_6105 ) ( TRUCK-AT ?auto_6110 ?auto_6113 ) ( not ( = ?auto_6104 ?auto_6105 ) ) ( not ( = ?auto_6104 ?auto_6120 ) ) ( not ( = ?auto_6105 ?auto_6120 ) ) ( not ( = ?auto_6115 ?auto_6125 ) ) ( not ( = ?auto_6104 ?auto_6106 ) ) ( not ( = ?auto_6104 ?auto_6116 ) ) ( not ( = ?auto_6106 ?auto_6120 ) ) ( not ( = ?auto_6119 ?auto_6121 ) ) ( not ( = ?auto_6117 ?auto_6125 ) ) ( not ( = ?auto_6116 ?auto_6120 ) ) ( not ( = ?auto_6104 ?auto_6107 ) ) ( not ( = ?auto_6104 ?auto_6124 ) ) ( not ( = ?auto_6105 ?auto_6107 ) ) ( not ( = ?auto_6105 ?auto_6124 ) ) ( not ( = ?auto_6107 ?auto_6116 ) ) ( not ( = ?auto_6107 ?auto_6120 ) ) ( not ( = ?auto_6124 ?auto_6116 ) ) ( not ( = ?auto_6124 ?auto_6120 ) ) ( not ( = ?auto_6104 ?auto_6108 ) ) ( not ( = ?auto_6104 ?auto_6118 ) ) ( not ( = ?auto_6105 ?auto_6108 ) ) ( not ( = ?auto_6105 ?auto_6118 ) ) ( not ( = ?auto_6106 ?auto_6108 ) ) ( not ( = ?auto_6106 ?auto_6118 ) ) ( not ( = ?auto_6108 ?auto_6124 ) ) ( not ( = ?auto_6108 ?auto_6116 ) ) ( not ( = ?auto_6108 ?auto_6120 ) ) ( not ( = ?auto_6122 ?auto_6119 ) ) ( not ( = ?auto_6122 ?auto_6121 ) ) ( not ( = ?auto_6123 ?auto_6117 ) ) ( not ( = ?auto_6123 ?auto_6125 ) ) ( not ( = ?auto_6118 ?auto_6124 ) ) ( not ( = ?auto_6118 ?auto_6116 ) ) ( not ( = ?auto_6118 ?auto_6120 ) ) ( not ( = ?auto_6104 ?auto_6109 ) ) ( not ( = ?auto_6104 ?auto_6114 ) ) ( not ( = ?auto_6105 ?auto_6109 ) ) ( not ( = ?auto_6105 ?auto_6114 ) ) ( not ( = ?auto_6106 ?auto_6109 ) ) ( not ( = ?auto_6106 ?auto_6114 ) ) ( not ( = ?auto_6107 ?auto_6109 ) ) ( not ( = ?auto_6107 ?auto_6114 ) ) ( not ( = ?auto_6109 ?auto_6118 ) ) ( not ( = ?auto_6109 ?auto_6124 ) ) ( not ( = ?auto_6109 ?auto_6116 ) ) ( not ( = ?auto_6109 ?auto_6120 ) ) ( not ( = ?auto_6111 ?auto_6122 ) ) ( not ( = ?auto_6111 ?auto_6119 ) ) ( not ( = ?auto_6111 ?auto_6121 ) ) ( not ( = ?auto_6112 ?auto_6123 ) ) ( not ( = ?auto_6112 ?auto_6117 ) ) ( not ( = ?auto_6112 ?auto_6125 ) ) ( not ( = ?auto_6114 ?auto_6118 ) ) ( not ( = ?auto_6114 ?auto_6124 ) ) ( not ( = ?auto_6114 ?auto_6116 ) ) ( not ( = ?auto_6114 ?auto_6120 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6104 ?auto_6105 ?auto_6106 ?auto_6107 ?auto_6108 )
      ( MAKE-1CRATE ?auto_6108 ?auto_6109 )
      ( MAKE-5CRATE-VERIFY ?auto_6104 ?auto_6105 ?auto_6106 ?auto_6107 ?auto_6108 ?auto_6109 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_6143 - SURFACE
      ?auto_6144 - SURFACE
      ?auto_6145 - SURFACE
      ?auto_6146 - SURFACE
      ?auto_6147 - SURFACE
      ?auto_6148 - SURFACE
      ?auto_6149 - SURFACE
    )
    :vars
    (
      ?auto_6151 - HOIST
      ?auto_6153 - PLACE
      ?auto_6150 - PLACE
      ?auto_6154 - HOIST
      ?auto_6155 - SURFACE
      ?auto_6165 - PLACE
      ?auto_6162 - HOIST
      ?auto_6159 - SURFACE
      ?auto_6163 - PLACE
      ?auto_6158 - HOIST
      ?auto_6166 - SURFACE
      ?auto_6168 - PLACE
      ?auto_6156 - HOIST
      ?auto_6160 - SURFACE
      ?auto_6164 - SURFACE
      ?auto_6157 - PLACE
      ?auto_6161 - HOIST
      ?auto_6167 - SURFACE
      ?auto_6152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6151 ?auto_6153 ) ( IS-CRATE ?auto_6149 ) ( not ( = ?auto_6150 ?auto_6153 ) ) ( HOIST-AT ?auto_6154 ?auto_6150 ) ( AVAILABLE ?auto_6154 ) ( SURFACE-AT ?auto_6149 ?auto_6150 ) ( ON ?auto_6149 ?auto_6155 ) ( CLEAR ?auto_6149 ) ( not ( = ?auto_6148 ?auto_6149 ) ) ( not ( = ?auto_6148 ?auto_6155 ) ) ( not ( = ?auto_6149 ?auto_6155 ) ) ( not ( = ?auto_6151 ?auto_6154 ) ) ( IS-CRATE ?auto_6148 ) ( not ( = ?auto_6165 ?auto_6153 ) ) ( HOIST-AT ?auto_6162 ?auto_6165 ) ( AVAILABLE ?auto_6162 ) ( SURFACE-AT ?auto_6148 ?auto_6165 ) ( ON ?auto_6148 ?auto_6159 ) ( CLEAR ?auto_6148 ) ( not ( = ?auto_6147 ?auto_6148 ) ) ( not ( = ?auto_6147 ?auto_6159 ) ) ( not ( = ?auto_6148 ?auto_6159 ) ) ( not ( = ?auto_6151 ?auto_6162 ) ) ( IS-CRATE ?auto_6147 ) ( not ( = ?auto_6163 ?auto_6153 ) ) ( HOIST-AT ?auto_6158 ?auto_6163 ) ( AVAILABLE ?auto_6158 ) ( SURFACE-AT ?auto_6147 ?auto_6163 ) ( ON ?auto_6147 ?auto_6166 ) ( CLEAR ?auto_6147 ) ( not ( = ?auto_6146 ?auto_6147 ) ) ( not ( = ?auto_6146 ?auto_6166 ) ) ( not ( = ?auto_6147 ?auto_6166 ) ) ( not ( = ?auto_6151 ?auto_6158 ) ) ( IS-CRATE ?auto_6146 ) ( not ( = ?auto_6168 ?auto_6153 ) ) ( HOIST-AT ?auto_6156 ?auto_6168 ) ( SURFACE-AT ?auto_6146 ?auto_6168 ) ( ON ?auto_6146 ?auto_6160 ) ( CLEAR ?auto_6146 ) ( not ( = ?auto_6145 ?auto_6146 ) ) ( not ( = ?auto_6145 ?auto_6160 ) ) ( not ( = ?auto_6146 ?auto_6160 ) ) ( not ( = ?auto_6151 ?auto_6156 ) ) ( IS-CRATE ?auto_6145 ) ( AVAILABLE ?auto_6156 ) ( SURFACE-AT ?auto_6145 ?auto_6168 ) ( ON ?auto_6145 ?auto_6164 ) ( CLEAR ?auto_6145 ) ( not ( = ?auto_6144 ?auto_6145 ) ) ( not ( = ?auto_6144 ?auto_6164 ) ) ( not ( = ?auto_6145 ?auto_6164 ) ) ( SURFACE-AT ?auto_6143 ?auto_6153 ) ( CLEAR ?auto_6143 ) ( IS-CRATE ?auto_6144 ) ( AVAILABLE ?auto_6151 ) ( not ( = ?auto_6157 ?auto_6153 ) ) ( HOIST-AT ?auto_6161 ?auto_6157 ) ( AVAILABLE ?auto_6161 ) ( SURFACE-AT ?auto_6144 ?auto_6157 ) ( ON ?auto_6144 ?auto_6167 ) ( CLEAR ?auto_6144 ) ( TRUCK-AT ?auto_6152 ?auto_6153 ) ( not ( = ?auto_6143 ?auto_6144 ) ) ( not ( = ?auto_6143 ?auto_6167 ) ) ( not ( = ?auto_6144 ?auto_6167 ) ) ( not ( = ?auto_6151 ?auto_6161 ) ) ( not ( = ?auto_6143 ?auto_6145 ) ) ( not ( = ?auto_6143 ?auto_6164 ) ) ( not ( = ?auto_6145 ?auto_6167 ) ) ( not ( = ?auto_6168 ?auto_6157 ) ) ( not ( = ?auto_6156 ?auto_6161 ) ) ( not ( = ?auto_6164 ?auto_6167 ) ) ( not ( = ?auto_6143 ?auto_6146 ) ) ( not ( = ?auto_6143 ?auto_6160 ) ) ( not ( = ?auto_6144 ?auto_6146 ) ) ( not ( = ?auto_6144 ?auto_6160 ) ) ( not ( = ?auto_6146 ?auto_6164 ) ) ( not ( = ?auto_6146 ?auto_6167 ) ) ( not ( = ?auto_6160 ?auto_6164 ) ) ( not ( = ?auto_6160 ?auto_6167 ) ) ( not ( = ?auto_6143 ?auto_6147 ) ) ( not ( = ?auto_6143 ?auto_6166 ) ) ( not ( = ?auto_6144 ?auto_6147 ) ) ( not ( = ?auto_6144 ?auto_6166 ) ) ( not ( = ?auto_6145 ?auto_6147 ) ) ( not ( = ?auto_6145 ?auto_6166 ) ) ( not ( = ?auto_6147 ?auto_6160 ) ) ( not ( = ?auto_6147 ?auto_6164 ) ) ( not ( = ?auto_6147 ?auto_6167 ) ) ( not ( = ?auto_6163 ?auto_6168 ) ) ( not ( = ?auto_6163 ?auto_6157 ) ) ( not ( = ?auto_6158 ?auto_6156 ) ) ( not ( = ?auto_6158 ?auto_6161 ) ) ( not ( = ?auto_6166 ?auto_6160 ) ) ( not ( = ?auto_6166 ?auto_6164 ) ) ( not ( = ?auto_6166 ?auto_6167 ) ) ( not ( = ?auto_6143 ?auto_6148 ) ) ( not ( = ?auto_6143 ?auto_6159 ) ) ( not ( = ?auto_6144 ?auto_6148 ) ) ( not ( = ?auto_6144 ?auto_6159 ) ) ( not ( = ?auto_6145 ?auto_6148 ) ) ( not ( = ?auto_6145 ?auto_6159 ) ) ( not ( = ?auto_6146 ?auto_6148 ) ) ( not ( = ?auto_6146 ?auto_6159 ) ) ( not ( = ?auto_6148 ?auto_6166 ) ) ( not ( = ?auto_6148 ?auto_6160 ) ) ( not ( = ?auto_6148 ?auto_6164 ) ) ( not ( = ?auto_6148 ?auto_6167 ) ) ( not ( = ?auto_6165 ?auto_6163 ) ) ( not ( = ?auto_6165 ?auto_6168 ) ) ( not ( = ?auto_6165 ?auto_6157 ) ) ( not ( = ?auto_6162 ?auto_6158 ) ) ( not ( = ?auto_6162 ?auto_6156 ) ) ( not ( = ?auto_6162 ?auto_6161 ) ) ( not ( = ?auto_6159 ?auto_6166 ) ) ( not ( = ?auto_6159 ?auto_6160 ) ) ( not ( = ?auto_6159 ?auto_6164 ) ) ( not ( = ?auto_6159 ?auto_6167 ) ) ( not ( = ?auto_6143 ?auto_6149 ) ) ( not ( = ?auto_6143 ?auto_6155 ) ) ( not ( = ?auto_6144 ?auto_6149 ) ) ( not ( = ?auto_6144 ?auto_6155 ) ) ( not ( = ?auto_6145 ?auto_6149 ) ) ( not ( = ?auto_6145 ?auto_6155 ) ) ( not ( = ?auto_6146 ?auto_6149 ) ) ( not ( = ?auto_6146 ?auto_6155 ) ) ( not ( = ?auto_6147 ?auto_6149 ) ) ( not ( = ?auto_6147 ?auto_6155 ) ) ( not ( = ?auto_6149 ?auto_6159 ) ) ( not ( = ?auto_6149 ?auto_6166 ) ) ( not ( = ?auto_6149 ?auto_6160 ) ) ( not ( = ?auto_6149 ?auto_6164 ) ) ( not ( = ?auto_6149 ?auto_6167 ) ) ( not ( = ?auto_6150 ?auto_6165 ) ) ( not ( = ?auto_6150 ?auto_6163 ) ) ( not ( = ?auto_6150 ?auto_6168 ) ) ( not ( = ?auto_6150 ?auto_6157 ) ) ( not ( = ?auto_6154 ?auto_6162 ) ) ( not ( = ?auto_6154 ?auto_6158 ) ) ( not ( = ?auto_6154 ?auto_6156 ) ) ( not ( = ?auto_6154 ?auto_6161 ) ) ( not ( = ?auto_6155 ?auto_6159 ) ) ( not ( = ?auto_6155 ?auto_6166 ) ) ( not ( = ?auto_6155 ?auto_6160 ) ) ( not ( = ?auto_6155 ?auto_6164 ) ) ( not ( = ?auto_6155 ?auto_6167 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6143 ?auto_6144 ?auto_6145 ?auto_6146 ?auto_6147 ?auto_6148 )
      ( MAKE-1CRATE ?auto_6148 ?auto_6149 )
      ( MAKE-6CRATE-VERIFY ?auto_6143 ?auto_6144 ?auto_6145 ?auto_6146 ?auto_6147 ?auto_6148 ?auto_6149 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_6187 - SURFACE
      ?auto_6188 - SURFACE
      ?auto_6189 - SURFACE
      ?auto_6190 - SURFACE
      ?auto_6191 - SURFACE
      ?auto_6192 - SURFACE
      ?auto_6193 - SURFACE
      ?auto_6194 - SURFACE
    )
    :vars
    (
      ?auto_6200 - HOIST
      ?auto_6196 - PLACE
      ?auto_6198 - PLACE
      ?auto_6197 - HOIST
      ?auto_6195 - SURFACE
      ?auto_6203 - PLACE
      ?auto_6205 - HOIST
      ?auto_6213 - SURFACE
      ?auto_6209 - PLACE
      ?auto_6216 - HOIST
      ?auto_6214 - SURFACE
      ?auto_6211 - PLACE
      ?auto_6212 - HOIST
      ?auto_6206 - SURFACE
      ?auto_6202 - PLACE
      ?auto_6204 - HOIST
      ?auto_6210 - SURFACE
      ?auto_6207 - SURFACE
      ?auto_6208 - PLACE
      ?auto_6215 - HOIST
      ?auto_6201 - SURFACE
      ?auto_6199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6200 ?auto_6196 ) ( IS-CRATE ?auto_6194 ) ( not ( = ?auto_6198 ?auto_6196 ) ) ( HOIST-AT ?auto_6197 ?auto_6198 ) ( AVAILABLE ?auto_6197 ) ( SURFACE-AT ?auto_6194 ?auto_6198 ) ( ON ?auto_6194 ?auto_6195 ) ( CLEAR ?auto_6194 ) ( not ( = ?auto_6193 ?auto_6194 ) ) ( not ( = ?auto_6193 ?auto_6195 ) ) ( not ( = ?auto_6194 ?auto_6195 ) ) ( not ( = ?auto_6200 ?auto_6197 ) ) ( IS-CRATE ?auto_6193 ) ( not ( = ?auto_6203 ?auto_6196 ) ) ( HOIST-AT ?auto_6205 ?auto_6203 ) ( AVAILABLE ?auto_6205 ) ( SURFACE-AT ?auto_6193 ?auto_6203 ) ( ON ?auto_6193 ?auto_6213 ) ( CLEAR ?auto_6193 ) ( not ( = ?auto_6192 ?auto_6193 ) ) ( not ( = ?auto_6192 ?auto_6213 ) ) ( not ( = ?auto_6193 ?auto_6213 ) ) ( not ( = ?auto_6200 ?auto_6205 ) ) ( IS-CRATE ?auto_6192 ) ( not ( = ?auto_6209 ?auto_6196 ) ) ( HOIST-AT ?auto_6216 ?auto_6209 ) ( AVAILABLE ?auto_6216 ) ( SURFACE-AT ?auto_6192 ?auto_6209 ) ( ON ?auto_6192 ?auto_6214 ) ( CLEAR ?auto_6192 ) ( not ( = ?auto_6191 ?auto_6192 ) ) ( not ( = ?auto_6191 ?auto_6214 ) ) ( not ( = ?auto_6192 ?auto_6214 ) ) ( not ( = ?auto_6200 ?auto_6216 ) ) ( IS-CRATE ?auto_6191 ) ( not ( = ?auto_6211 ?auto_6196 ) ) ( HOIST-AT ?auto_6212 ?auto_6211 ) ( AVAILABLE ?auto_6212 ) ( SURFACE-AT ?auto_6191 ?auto_6211 ) ( ON ?auto_6191 ?auto_6206 ) ( CLEAR ?auto_6191 ) ( not ( = ?auto_6190 ?auto_6191 ) ) ( not ( = ?auto_6190 ?auto_6206 ) ) ( not ( = ?auto_6191 ?auto_6206 ) ) ( not ( = ?auto_6200 ?auto_6212 ) ) ( IS-CRATE ?auto_6190 ) ( not ( = ?auto_6202 ?auto_6196 ) ) ( HOIST-AT ?auto_6204 ?auto_6202 ) ( SURFACE-AT ?auto_6190 ?auto_6202 ) ( ON ?auto_6190 ?auto_6210 ) ( CLEAR ?auto_6190 ) ( not ( = ?auto_6189 ?auto_6190 ) ) ( not ( = ?auto_6189 ?auto_6210 ) ) ( not ( = ?auto_6190 ?auto_6210 ) ) ( not ( = ?auto_6200 ?auto_6204 ) ) ( IS-CRATE ?auto_6189 ) ( AVAILABLE ?auto_6204 ) ( SURFACE-AT ?auto_6189 ?auto_6202 ) ( ON ?auto_6189 ?auto_6207 ) ( CLEAR ?auto_6189 ) ( not ( = ?auto_6188 ?auto_6189 ) ) ( not ( = ?auto_6188 ?auto_6207 ) ) ( not ( = ?auto_6189 ?auto_6207 ) ) ( SURFACE-AT ?auto_6187 ?auto_6196 ) ( CLEAR ?auto_6187 ) ( IS-CRATE ?auto_6188 ) ( AVAILABLE ?auto_6200 ) ( not ( = ?auto_6208 ?auto_6196 ) ) ( HOIST-AT ?auto_6215 ?auto_6208 ) ( AVAILABLE ?auto_6215 ) ( SURFACE-AT ?auto_6188 ?auto_6208 ) ( ON ?auto_6188 ?auto_6201 ) ( CLEAR ?auto_6188 ) ( TRUCK-AT ?auto_6199 ?auto_6196 ) ( not ( = ?auto_6187 ?auto_6188 ) ) ( not ( = ?auto_6187 ?auto_6201 ) ) ( not ( = ?auto_6188 ?auto_6201 ) ) ( not ( = ?auto_6200 ?auto_6215 ) ) ( not ( = ?auto_6187 ?auto_6189 ) ) ( not ( = ?auto_6187 ?auto_6207 ) ) ( not ( = ?auto_6189 ?auto_6201 ) ) ( not ( = ?auto_6202 ?auto_6208 ) ) ( not ( = ?auto_6204 ?auto_6215 ) ) ( not ( = ?auto_6207 ?auto_6201 ) ) ( not ( = ?auto_6187 ?auto_6190 ) ) ( not ( = ?auto_6187 ?auto_6210 ) ) ( not ( = ?auto_6188 ?auto_6190 ) ) ( not ( = ?auto_6188 ?auto_6210 ) ) ( not ( = ?auto_6190 ?auto_6207 ) ) ( not ( = ?auto_6190 ?auto_6201 ) ) ( not ( = ?auto_6210 ?auto_6207 ) ) ( not ( = ?auto_6210 ?auto_6201 ) ) ( not ( = ?auto_6187 ?auto_6191 ) ) ( not ( = ?auto_6187 ?auto_6206 ) ) ( not ( = ?auto_6188 ?auto_6191 ) ) ( not ( = ?auto_6188 ?auto_6206 ) ) ( not ( = ?auto_6189 ?auto_6191 ) ) ( not ( = ?auto_6189 ?auto_6206 ) ) ( not ( = ?auto_6191 ?auto_6210 ) ) ( not ( = ?auto_6191 ?auto_6207 ) ) ( not ( = ?auto_6191 ?auto_6201 ) ) ( not ( = ?auto_6211 ?auto_6202 ) ) ( not ( = ?auto_6211 ?auto_6208 ) ) ( not ( = ?auto_6212 ?auto_6204 ) ) ( not ( = ?auto_6212 ?auto_6215 ) ) ( not ( = ?auto_6206 ?auto_6210 ) ) ( not ( = ?auto_6206 ?auto_6207 ) ) ( not ( = ?auto_6206 ?auto_6201 ) ) ( not ( = ?auto_6187 ?auto_6192 ) ) ( not ( = ?auto_6187 ?auto_6214 ) ) ( not ( = ?auto_6188 ?auto_6192 ) ) ( not ( = ?auto_6188 ?auto_6214 ) ) ( not ( = ?auto_6189 ?auto_6192 ) ) ( not ( = ?auto_6189 ?auto_6214 ) ) ( not ( = ?auto_6190 ?auto_6192 ) ) ( not ( = ?auto_6190 ?auto_6214 ) ) ( not ( = ?auto_6192 ?auto_6206 ) ) ( not ( = ?auto_6192 ?auto_6210 ) ) ( not ( = ?auto_6192 ?auto_6207 ) ) ( not ( = ?auto_6192 ?auto_6201 ) ) ( not ( = ?auto_6209 ?auto_6211 ) ) ( not ( = ?auto_6209 ?auto_6202 ) ) ( not ( = ?auto_6209 ?auto_6208 ) ) ( not ( = ?auto_6216 ?auto_6212 ) ) ( not ( = ?auto_6216 ?auto_6204 ) ) ( not ( = ?auto_6216 ?auto_6215 ) ) ( not ( = ?auto_6214 ?auto_6206 ) ) ( not ( = ?auto_6214 ?auto_6210 ) ) ( not ( = ?auto_6214 ?auto_6207 ) ) ( not ( = ?auto_6214 ?auto_6201 ) ) ( not ( = ?auto_6187 ?auto_6193 ) ) ( not ( = ?auto_6187 ?auto_6213 ) ) ( not ( = ?auto_6188 ?auto_6193 ) ) ( not ( = ?auto_6188 ?auto_6213 ) ) ( not ( = ?auto_6189 ?auto_6193 ) ) ( not ( = ?auto_6189 ?auto_6213 ) ) ( not ( = ?auto_6190 ?auto_6193 ) ) ( not ( = ?auto_6190 ?auto_6213 ) ) ( not ( = ?auto_6191 ?auto_6193 ) ) ( not ( = ?auto_6191 ?auto_6213 ) ) ( not ( = ?auto_6193 ?auto_6214 ) ) ( not ( = ?auto_6193 ?auto_6206 ) ) ( not ( = ?auto_6193 ?auto_6210 ) ) ( not ( = ?auto_6193 ?auto_6207 ) ) ( not ( = ?auto_6193 ?auto_6201 ) ) ( not ( = ?auto_6203 ?auto_6209 ) ) ( not ( = ?auto_6203 ?auto_6211 ) ) ( not ( = ?auto_6203 ?auto_6202 ) ) ( not ( = ?auto_6203 ?auto_6208 ) ) ( not ( = ?auto_6205 ?auto_6216 ) ) ( not ( = ?auto_6205 ?auto_6212 ) ) ( not ( = ?auto_6205 ?auto_6204 ) ) ( not ( = ?auto_6205 ?auto_6215 ) ) ( not ( = ?auto_6213 ?auto_6214 ) ) ( not ( = ?auto_6213 ?auto_6206 ) ) ( not ( = ?auto_6213 ?auto_6210 ) ) ( not ( = ?auto_6213 ?auto_6207 ) ) ( not ( = ?auto_6213 ?auto_6201 ) ) ( not ( = ?auto_6187 ?auto_6194 ) ) ( not ( = ?auto_6187 ?auto_6195 ) ) ( not ( = ?auto_6188 ?auto_6194 ) ) ( not ( = ?auto_6188 ?auto_6195 ) ) ( not ( = ?auto_6189 ?auto_6194 ) ) ( not ( = ?auto_6189 ?auto_6195 ) ) ( not ( = ?auto_6190 ?auto_6194 ) ) ( not ( = ?auto_6190 ?auto_6195 ) ) ( not ( = ?auto_6191 ?auto_6194 ) ) ( not ( = ?auto_6191 ?auto_6195 ) ) ( not ( = ?auto_6192 ?auto_6194 ) ) ( not ( = ?auto_6192 ?auto_6195 ) ) ( not ( = ?auto_6194 ?auto_6213 ) ) ( not ( = ?auto_6194 ?auto_6214 ) ) ( not ( = ?auto_6194 ?auto_6206 ) ) ( not ( = ?auto_6194 ?auto_6210 ) ) ( not ( = ?auto_6194 ?auto_6207 ) ) ( not ( = ?auto_6194 ?auto_6201 ) ) ( not ( = ?auto_6198 ?auto_6203 ) ) ( not ( = ?auto_6198 ?auto_6209 ) ) ( not ( = ?auto_6198 ?auto_6211 ) ) ( not ( = ?auto_6198 ?auto_6202 ) ) ( not ( = ?auto_6198 ?auto_6208 ) ) ( not ( = ?auto_6197 ?auto_6205 ) ) ( not ( = ?auto_6197 ?auto_6216 ) ) ( not ( = ?auto_6197 ?auto_6212 ) ) ( not ( = ?auto_6197 ?auto_6204 ) ) ( not ( = ?auto_6197 ?auto_6215 ) ) ( not ( = ?auto_6195 ?auto_6213 ) ) ( not ( = ?auto_6195 ?auto_6214 ) ) ( not ( = ?auto_6195 ?auto_6206 ) ) ( not ( = ?auto_6195 ?auto_6210 ) ) ( not ( = ?auto_6195 ?auto_6207 ) ) ( not ( = ?auto_6195 ?auto_6201 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6187 ?auto_6188 ?auto_6189 ?auto_6190 ?auto_6191 ?auto_6192 ?auto_6193 )
      ( MAKE-1CRATE ?auto_6193 ?auto_6194 )
      ( MAKE-7CRATE-VERIFY ?auto_6187 ?auto_6188 ?auto_6189 ?auto_6190 ?auto_6191 ?auto_6192 ?auto_6193 ?auto_6194 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_6236 - SURFACE
      ?auto_6237 - SURFACE
      ?auto_6238 - SURFACE
      ?auto_6239 - SURFACE
      ?auto_6240 - SURFACE
      ?auto_6241 - SURFACE
      ?auto_6242 - SURFACE
      ?auto_6243 - SURFACE
      ?auto_6244 - SURFACE
    )
    :vars
    (
      ?auto_6250 - HOIST
      ?auto_6249 - PLACE
      ?auto_6247 - PLACE
      ?auto_6246 - HOIST
      ?auto_6245 - SURFACE
      ?auto_6255 - SURFACE
      ?auto_6254 - PLACE
      ?auto_6256 - HOIST
      ?auto_6251 - SURFACE
      ?auto_6252 - PLACE
      ?auto_6266 - HOIST
      ?auto_6253 - SURFACE
      ?auto_6263 - PLACE
      ?auto_6260 - HOIST
      ?auto_6264 - SURFACE
      ?auto_6258 - PLACE
      ?auto_6261 - HOIST
      ?auto_6257 - SURFACE
      ?auto_6262 - SURFACE
      ?auto_6265 - PLACE
      ?auto_6259 - HOIST
      ?auto_6267 - SURFACE
      ?auto_6248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6250 ?auto_6249 ) ( IS-CRATE ?auto_6244 ) ( not ( = ?auto_6247 ?auto_6249 ) ) ( HOIST-AT ?auto_6246 ?auto_6247 ) ( SURFACE-AT ?auto_6244 ?auto_6247 ) ( ON ?auto_6244 ?auto_6245 ) ( CLEAR ?auto_6244 ) ( not ( = ?auto_6243 ?auto_6244 ) ) ( not ( = ?auto_6243 ?auto_6245 ) ) ( not ( = ?auto_6244 ?auto_6245 ) ) ( not ( = ?auto_6250 ?auto_6246 ) ) ( IS-CRATE ?auto_6243 ) ( AVAILABLE ?auto_6246 ) ( SURFACE-AT ?auto_6243 ?auto_6247 ) ( ON ?auto_6243 ?auto_6255 ) ( CLEAR ?auto_6243 ) ( not ( = ?auto_6242 ?auto_6243 ) ) ( not ( = ?auto_6242 ?auto_6255 ) ) ( not ( = ?auto_6243 ?auto_6255 ) ) ( IS-CRATE ?auto_6242 ) ( not ( = ?auto_6254 ?auto_6249 ) ) ( HOIST-AT ?auto_6256 ?auto_6254 ) ( AVAILABLE ?auto_6256 ) ( SURFACE-AT ?auto_6242 ?auto_6254 ) ( ON ?auto_6242 ?auto_6251 ) ( CLEAR ?auto_6242 ) ( not ( = ?auto_6241 ?auto_6242 ) ) ( not ( = ?auto_6241 ?auto_6251 ) ) ( not ( = ?auto_6242 ?auto_6251 ) ) ( not ( = ?auto_6250 ?auto_6256 ) ) ( IS-CRATE ?auto_6241 ) ( not ( = ?auto_6252 ?auto_6249 ) ) ( HOIST-AT ?auto_6266 ?auto_6252 ) ( AVAILABLE ?auto_6266 ) ( SURFACE-AT ?auto_6241 ?auto_6252 ) ( ON ?auto_6241 ?auto_6253 ) ( CLEAR ?auto_6241 ) ( not ( = ?auto_6240 ?auto_6241 ) ) ( not ( = ?auto_6240 ?auto_6253 ) ) ( not ( = ?auto_6241 ?auto_6253 ) ) ( not ( = ?auto_6250 ?auto_6266 ) ) ( IS-CRATE ?auto_6240 ) ( not ( = ?auto_6263 ?auto_6249 ) ) ( HOIST-AT ?auto_6260 ?auto_6263 ) ( AVAILABLE ?auto_6260 ) ( SURFACE-AT ?auto_6240 ?auto_6263 ) ( ON ?auto_6240 ?auto_6264 ) ( CLEAR ?auto_6240 ) ( not ( = ?auto_6239 ?auto_6240 ) ) ( not ( = ?auto_6239 ?auto_6264 ) ) ( not ( = ?auto_6240 ?auto_6264 ) ) ( not ( = ?auto_6250 ?auto_6260 ) ) ( IS-CRATE ?auto_6239 ) ( not ( = ?auto_6258 ?auto_6249 ) ) ( HOIST-AT ?auto_6261 ?auto_6258 ) ( SURFACE-AT ?auto_6239 ?auto_6258 ) ( ON ?auto_6239 ?auto_6257 ) ( CLEAR ?auto_6239 ) ( not ( = ?auto_6238 ?auto_6239 ) ) ( not ( = ?auto_6238 ?auto_6257 ) ) ( not ( = ?auto_6239 ?auto_6257 ) ) ( not ( = ?auto_6250 ?auto_6261 ) ) ( IS-CRATE ?auto_6238 ) ( AVAILABLE ?auto_6261 ) ( SURFACE-AT ?auto_6238 ?auto_6258 ) ( ON ?auto_6238 ?auto_6262 ) ( CLEAR ?auto_6238 ) ( not ( = ?auto_6237 ?auto_6238 ) ) ( not ( = ?auto_6237 ?auto_6262 ) ) ( not ( = ?auto_6238 ?auto_6262 ) ) ( SURFACE-AT ?auto_6236 ?auto_6249 ) ( CLEAR ?auto_6236 ) ( IS-CRATE ?auto_6237 ) ( AVAILABLE ?auto_6250 ) ( not ( = ?auto_6265 ?auto_6249 ) ) ( HOIST-AT ?auto_6259 ?auto_6265 ) ( AVAILABLE ?auto_6259 ) ( SURFACE-AT ?auto_6237 ?auto_6265 ) ( ON ?auto_6237 ?auto_6267 ) ( CLEAR ?auto_6237 ) ( TRUCK-AT ?auto_6248 ?auto_6249 ) ( not ( = ?auto_6236 ?auto_6237 ) ) ( not ( = ?auto_6236 ?auto_6267 ) ) ( not ( = ?auto_6237 ?auto_6267 ) ) ( not ( = ?auto_6250 ?auto_6259 ) ) ( not ( = ?auto_6236 ?auto_6238 ) ) ( not ( = ?auto_6236 ?auto_6262 ) ) ( not ( = ?auto_6238 ?auto_6267 ) ) ( not ( = ?auto_6258 ?auto_6265 ) ) ( not ( = ?auto_6261 ?auto_6259 ) ) ( not ( = ?auto_6262 ?auto_6267 ) ) ( not ( = ?auto_6236 ?auto_6239 ) ) ( not ( = ?auto_6236 ?auto_6257 ) ) ( not ( = ?auto_6237 ?auto_6239 ) ) ( not ( = ?auto_6237 ?auto_6257 ) ) ( not ( = ?auto_6239 ?auto_6262 ) ) ( not ( = ?auto_6239 ?auto_6267 ) ) ( not ( = ?auto_6257 ?auto_6262 ) ) ( not ( = ?auto_6257 ?auto_6267 ) ) ( not ( = ?auto_6236 ?auto_6240 ) ) ( not ( = ?auto_6236 ?auto_6264 ) ) ( not ( = ?auto_6237 ?auto_6240 ) ) ( not ( = ?auto_6237 ?auto_6264 ) ) ( not ( = ?auto_6238 ?auto_6240 ) ) ( not ( = ?auto_6238 ?auto_6264 ) ) ( not ( = ?auto_6240 ?auto_6257 ) ) ( not ( = ?auto_6240 ?auto_6262 ) ) ( not ( = ?auto_6240 ?auto_6267 ) ) ( not ( = ?auto_6263 ?auto_6258 ) ) ( not ( = ?auto_6263 ?auto_6265 ) ) ( not ( = ?auto_6260 ?auto_6261 ) ) ( not ( = ?auto_6260 ?auto_6259 ) ) ( not ( = ?auto_6264 ?auto_6257 ) ) ( not ( = ?auto_6264 ?auto_6262 ) ) ( not ( = ?auto_6264 ?auto_6267 ) ) ( not ( = ?auto_6236 ?auto_6241 ) ) ( not ( = ?auto_6236 ?auto_6253 ) ) ( not ( = ?auto_6237 ?auto_6241 ) ) ( not ( = ?auto_6237 ?auto_6253 ) ) ( not ( = ?auto_6238 ?auto_6241 ) ) ( not ( = ?auto_6238 ?auto_6253 ) ) ( not ( = ?auto_6239 ?auto_6241 ) ) ( not ( = ?auto_6239 ?auto_6253 ) ) ( not ( = ?auto_6241 ?auto_6264 ) ) ( not ( = ?auto_6241 ?auto_6257 ) ) ( not ( = ?auto_6241 ?auto_6262 ) ) ( not ( = ?auto_6241 ?auto_6267 ) ) ( not ( = ?auto_6252 ?auto_6263 ) ) ( not ( = ?auto_6252 ?auto_6258 ) ) ( not ( = ?auto_6252 ?auto_6265 ) ) ( not ( = ?auto_6266 ?auto_6260 ) ) ( not ( = ?auto_6266 ?auto_6261 ) ) ( not ( = ?auto_6266 ?auto_6259 ) ) ( not ( = ?auto_6253 ?auto_6264 ) ) ( not ( = ?auto_6253 ?auto_6257 ) ) ( not ( = ?auto_6253 ?auto_6262 ) ) ( not ( = ?auto_6253 ?auto_6267 ) ) ( not ( = ?auto_6236 ?auto_6242 ) ) ( not ( = ?auto_6236 ?auto_6251 ) ) ( not ( = ?auto_6237 ?auto_6242 ) ) ( not ( = ?auto_6237 ?auto_6251 ) ) ( not ( = ?auto_6238 ?auto_6242 ) ) ( not ( = ?auto_6238 ?auto_6251 ) ) ( not ( = ?auto_6239 ?auto_6242 ) ) ( not ( = ?auto_6239 ?auto_6251 ) ) ( not ( = ?auto_6240 ?auto_6242 ) ) ( not ( = ?auto_6240 ?auto_6251 ) ) ( not ( = ?auto_6242 ?auto_6253 ) ) ( not ( = ?auto_6242 ?auto_6264 ) ) ( not ( = ?auto_6242 ?auto_6257 ) ) ( not ( = ?auto_6242 ?auto_6262 ) ) ( not ( = ?auto_6242 ?auto_6267 ) ) ( not ( = ?auto_6254 ?auto_6252 ) ) ( not ( = ?auto_6254 ?auto_6263 ) ) ( not ( = ?auto_6254 ?auto_6258 ) ) ( not ( = ?auto_6254 ?auto_6265 ) ) ( not ( = ?auto_6256 ?auto_6266 ) ) ( not ( = ?auto_6256 ?auto_6260 ) ) ( not ( = ?auto_6256 ?auto_6261 ) ) ( not ( = ?auto_6256 ?auto_6259 ) ) ( not ( = ?auto_6251 ?auto_6253 ) ) ( not ( = ?auto_6251 ?auto_6264 ) ) ( not ( = ?auto_6251 ?auto_6257 ) ) ( not ( = ?auto_6251 ?auto_6262 ) ) ( not ( = ?auto_6251 ?auto_6267 ) ) ( not ( = ?auto_6236 ?auto_6243 ) ) ( not ( = ?auto_6236 ?auto_6255 ) ) ( not ( = ?auto_6237 ?auto_6243 ) ) ( not ( = ?auto_6237 ?auto_6255 ) ) ( not ( = ?auto_6238 ?auto_6243 ) ) ( not ( = ?auto_6238 ?auto_6255 ) ) ( not ( = ?auto_6239 ?auto_6243 ) ) ( not ( = ?auto_6239 ?auto_6255 ) ) ( not ( = ?auto_6240 ?auto_6243 ) ) ( not ( = ?auto_6240 ?auto_6255 ) ) ( not ( = ?auto_6241 ?auto_6243 ) ) ( not ( = ?auto_6241 ?auto_6255 ) ) ( not ( = ?auto_6243 ?auto_6251 ) ) ( not ( = ?auto_6243 ?auto_6253 ) ) ( not ( = ?auto_6243 ?auto_6264 ) ) ( not ( = ?auto_6243 ?auto_6257 ) ) ( not ( = ?auto_6243 ?auto_6262 ) ) ( not ( = ?auto_6243 ?auto_6267 ) ) ( not ( = ?auto_6247 ?auto_6254 ) ) ( not ( = ?auto_6247 ?auto_6252 ) ) ( not ( = ?auto_6247 ?auto_6263 ) ) ( not ( = ?auto_6247 ?auto_6258 ) ) ( not ( = ?auto_6247 ?auto_6265 ) ) ( not ( = ?auto_6246 ?auto_6256 ) ) ( not ( = ?auto_6246 ?auto_6266 ) ) ( not ( = ?auto_6246 ?auto_6260 ) ) ( not ( = ?auto_6246 ?auto_6261 ) ) ( not ( = ?auto_6246 ?auto_6259 ) ) ( not ( = ?auto_6255 ?auto_6251 ) ) ( not ( = ?auto_6255 ?auto_6253 ) ) ( not ( = ?auto_6255 ?auto_6264 ) ) ( not ( = ?auto_6255 ?auto_6257 ) ) ( not ( = ?auto_6255 ?auto_6262 ) ) ( not ( = ?auto_6255 ?auto_6267 ) ) ( not ( = ?auto_6236 ?auto_6244 ) ) ( not ( = ?auto_6236 ?auto_6245 ) ) ( not ( = ?auto_6237 ?auto_6244 ) ) ( not ( = ?auto_6237 ?auto_6245 ) ) ( not ( = ?auto_6238 ?auto_6244 ) ) ( not ( = ?auto_6238 ?auto_6245 ) ) ( not ( = ?auto_6239 ?auto_6244 ) ) ( not ( = ?auto_6239 ?auto_6245 ) ) ( not ( = ?auto_6240 ?auto_6244 ) ) ( not ( = ?auto_6240 ?auto_6245 ) ) ( not ( = ?auto_6241 ?auto_6244 ) ) ( not ( = ?auto_6241 ?auto_6245 ) ) ( not ( = ?auto_6242 ?auto_6244 ) ) ( not ( = ?auto_6242 ?auto_6245 ) ) ( not ( = ?auto_6244 ?auto_6255 ) ) ( not ( = ?auto_6244 ?auto_6251 ) ) ( not ( = ?auto_6244 ?auto_6253 ) ) ( not ( = ?auto_6244 ?auto_6264 ) ) ( not ( = ?auto_6244 ?auto_6257 ) ) ( not ( = ?auto_6244 ?auto_6262 ) ) ( not ( = ?auto_6244 ?auto_6267 ) ) ( not ( = ?auto_6245 ?auto_6255 ) ) ( not ( = ?auto_6245 ?auto_6251 ) ) ( not ( = ?auto_6245 ?auto_6253 ) ) ( not ( = ?auto_6245 ?auto_6264 ) ) ( not ( = ?auto_6245 ?auto_6257 ) ) ( not ( = ?auto_6245 ?auto_6262 ) ) ( not ( = ?auto_6245 ?auto_6267 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6236 ?auto_6237 ?auto_6238 ?auto_6239 ?auto_6240 ?auto_6241 ?auto_6242 ?auto_6243 )
      ( MAKE-1CRATE ?auto_6243 ?auto_6244 )
      ( MAKE-8CRATE-VERIFY ?auto_6236 ?auto_6237 ?auto_6238 ?auto_6239 ?auto_6240 ?auto_6241 ?auto_6242 ?auto_6243 ?auto_6244 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_6288 - SURFACE
      ?auto_6289 - SURFACE
      ?auto_6290 - SURFACE
      ?auto_6291 - SURFACE
      ?auto_6292 - SURFACE
      ?auto_6293 - SURFACE
      ?auto_6294 - SURFACE
      ?auto_6295 - SURFACE
      ?auto_6296 - SURFACE
      ?auto_6297 - SURFACE
    )
    :vars
    (
      ?auto_6300 - HOIST
      ?auto_6302 - PLACE
      ?auto_6301 - PLACE
      ?auto_6298 - HOIST
      ?auto_6299 - SURFACE
      ?auto_6313 - PLACE
      ?auto_6306 - HOIST
      ?auto_6323 - SURFACE
      ?auto_6308 - SURFACE
      ?auto_6317 - PLACE
      ?auto_6321 - HOIST
      ?auto_6307 - SURFACE
      ?auto_6305 - PLACE
      ?auto_6320 - HOIST
      ?auto_6316 - SURFACE
      ?auto_6312 - PLACE
      ?auto_6319 - HOIST
      ?auto_6311 - SURFACE
      ?auto_6315 - PLACE
      ?auto_6309 - HOIST
      ?auto_6310 - SURFACE
      ?auto_6304 - SURFACE
      ?auto_6322 - PLACE
      ?auto_6318 - HOIST
      ?auto_6314 - SURFACE
      ?auto_6303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6300 ?auto_6302 ) ( IS-CRATE ?auto_6297 ) ( not ( = ?auto_6301 ?auto_6302 ) ) ( HOIST-AT ?auto_6298 ?auto_6301 ) ( AVAILABLE ?auto_6298 ) ( SURFACE-AT ?auto_6297 ?auto_6301 ) ( ON ?auto_6297 ?auto_6299 ) ( CLEAR ?auto_6297 ) ( not ( = ?auto_6296 ?auto_6297 ) ) ( not ( = ?auto_6296 ?auto_6299 ) ) ( not ( = ?auto_6297 ?auto_6299 ) ) ( not ( = ?auto_6300 ?auto_6298 ) ) ( IS-CRATE ?auto_6296 ) ( not ( = ?auto_6313 ?auto_6302 ) ) ( HOIST-AT ?auto_6306 ?auto_6313 ) ( SURFACE-AT ?auto_6296 ?auto_6313 ) ( ON ?auto_6296 ?auto_6323 ) ( CLEAR ?auto_6296 ) ( not ( = ?auto_6295 ?auto_6296 ) ) ( not ( = ?auto_6295 ?auto_6323 ) ) ( not ( = ?auto_6296 ?auto_6323 ) ) ( not ( = ?auto_6300 ?auto_6306 ) ) ( IS-CRATE ?auto_6295 ) ( AVAILABLE ?auto_6306 ) ( SURFACE-AT ?auto_6295 ?auto_6313 ) ( ON ?auto_6295 ?auto_6308 ) ( CLEAR ?auto_6295 ) ( not ( = ?auto_6294 ?auto_6295 ) ) ( not ( = ?auto_6294 ?auto_6308 ) ) ( not ( = ?auto_6295 ?auto_6308 ) ) ( IS-CRATE ?auto_6294 ) ( not ( = ?auto_6317 ?auto_6302 ) ) ( HOIST-AT ?auto_6321 ?auto_6317 ) ( AVAILABLE ?auto_6321 ) ( SURFACE-AT ?auto_6294 ?auto_6317 ) ( ON ?auto_6294 ?auto_6307 ) ( CLEAR ?auto_6294 ) ( not ( = ?auto_6293 ?auto_6294 ) ) ( not ( = ?auto_6293 ?auto_6307 ) ) ( not ( = ?auto_6294 ?auto_6307 ) ) ( not ( = ?auto_6300 ?auto_6321 ) ) ( IS-CRATE ?auto_6293 ) ( not ( = ?auto_6305 ?auto_6302 ) ) ( HOIST-AT ?auto_6320 ?auto_6305 ) ( AVAILABLE ?auto_6320 ) ( SURFACE-AT ?auto_6293 ?auto_6305 ) ( ON ?auto_6293 ?auto_6316 ) ( CLEAR ?auto_6293 ) ( not ( = ?auto_6292 ?auto_6293 ) ) ( not ( = ?auto_6292 ?auto_6316 ) ) ( not ( = ?auto_6293 ?auto_6316 ) ) ( not ( = ?auto_6300 ?auto_6320 ) ) ( IS-CRATE ?auto_6292 ) ( not ( = ?auto_6312 ?auto_6302 ) ) ( HOIST-AT ?auto_6319 ?auto_6312 ) ( AVAILABLE ?auto_6319 ) ( SURFACE-AT ?auto_6292 ?auto_6312 ) ( ON ?auto_6292 ?auto_6311 ) ( CLEAR ?auto_6292 ) ( not ( = ?auto_6291 ?auto_6292 ) ) ( not ( = ?auto_6291 ?auto_6311 ) ) ( not ( = ?auto_6292 ?auto_6311 ) ) ( not ( = ?auto_6300 ?auto_6319 ) ) ( IS-CRATE ?auto_6291 ) ( not ( = ?auto_6315 ?auto_6302 ) ) ( HOIST-AT ?auto_6309 ?auto_6315 ) ( SURFACE-AT ?auto_6291 ?auto_6315 ) ( ON ?auto_6291 ?auto_6310 ) ( CLEAR ?auto_6291 ) ( not ( = ?auto_6290 ?auto_6291 ) ) ( not ( = ?auto_6290 ?auto_6310 ) ) ( not ( = ?auto_6291 ?auto_6310 ) ) ( not ( = ?auto_6300 ?auto_6309 ) ) ( IS-CRATE ?auto_6290 ) ( AVAILABLE ?auto_6309 ) ( SURFACE-AT ?auto_6290 ?auto_6315 ) ( ON ?auto_6290 ?auto_6304 ) ( CLEAR ?auto_6290 ) ( not ( = ?auto_6289 ?auto_6290 ) ) ( not ( = ?auto_6289 ?auto_6304 ) ) ( not ( = ?auto_6290 ?auto_6304 ) ) ( SURFACE-AT ?auto_6288 ?auto_6302 ) ( CLEAR ?auto_6288 ) ( IS-CRATE ?auto_6289 ) ( AVAILABLE ?auto_6300 ) ( not ( = ?auto_6322 ?auto_6302 ) ) ( HOIST-AT ?auto_6318 ?auto_6322 ) ( AVAILABLE ?auto_6318 ) ( SURFACE-AT ?auto_6289 ?auto_6322 ) ( ON ?auto_6289 ?auto_6314 ) ( CLEAR ?auto_6289 ) ( TRUCK-AT ?auto_6303 ?auto_6302 ) ( not ( = ?auto_6288 ?auto_6289 ) ) ( not ( = ?auto_6288 ?auto_6314 ) ) ( not ( = ?auto_6289 ?auto_6314 ) ) ( not ( = ?auto_6300 ?auto_6318 ) ) ( not ( = ?auto_6288 ?auto_6290 ) ) ( not ( = ?auto_6288 ?auto_6304 ) ) ( not ( = ?auto_6290 ?auto_6314 ) ) ( not ( = ?auto_6315 ?auto_6322 ) ) ( not ( = ?auto_6309 ?auto_6318 ) ) ( not ( = ?auto_6304 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6291 ) ) ( not ( = ?auto_6288 ?auto_6310 ) ) ( not ( = ?auto_6289 ?auto_6291 ) ) ( not ( = ?auto_6289 ?auto_6310 ) ) ( not ( = ?auto_6291 ?auto_6304 ) ) ( not ( = ?auto_6291 ?auto_6314 ) ) ( not ( = ?auto_6310 ?auto_6304 ) ) ( not ( = ?auto_6310 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6292 ) ) ( not ( = ?auto_6288 ?auto_6311 ) ) ( not ( = ?auto_6289 ?auto_6292 ) ) ( not ( = ?auto_6289 ?auto_6311 ) ) ( not ( = ?auto_6290 ?auto_6292 ) ) ( not ( = ?auto_6290 ?auto_6311 ) ) ( not ( = ?auto_6292 ?auto_6310 ) ) ( not ( = ?auto_6292 ?auto_6304 ) ) ( not ( = ?auto_6292 ?auto_6314 ) ) ( not ( = ?auto_6312 ?auto_6315 ) ) ( not ( = ?auto_6312 ?auto_6322 ) ) ( not ( = ?auto_6319 ?auto_6309 ) ) ( not ( = ?auto_6319 ?auto_6318 ) ) ( not ( = ?auto_6311 ?auto_6310 ) ) ( not ( = ?auto_6311 ?auto_6304 ) ) ( not ( = ?auto_6311 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6293 ) ) ( not ( = ?auto_6288 ?auto_6316 ) ) ( not ( = ?auto_6289 ?auto_6293 ) ) ( not ( = ?auto_6289 ?auto_6316 ) ) ( not ( = ?auto_6290 ?auto_6293 ) ) ( not ( = ?auto_6290 ?auto_6316 ) ) ( not ( = ?auto_6291 ?auto_6293 ) ) ( not ( = ?auto_6291 ?auto_6316 ) ) ( not ( = ?auto_6293 ?auto_6311 ) ) ( not ( = ?auto_6293 ?auto_6310 ) ) ( not ( = ?auto_6293 ?auto_6304 ) ) ( not ( = ?auto_6293 ?auto_6314 ) ) ( not ( = ?auto_6305 ?auto_6312 ) ) ( not ( = ?auto_6305 ?auto_6315 ) ) ( not ( = ?auto_6305 ?auto_6322 ) ) ( not ( = ?auto_6320 ?auto_6319 ) ) ( not ( = ?auto_6320 ?auto_6309 ) ) ( not ( = ?auto_6320 ?auto_6318 ) ) ( not ( = ?auto_6316 ?auto_6311 ) ) ( not ( = ?auto_6316 ?auto_6310 ) ) ( not ( = ?auto_6316 ?auto_6304 ) ) ( not ( = ?auto_6316 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6294 ) ) ( not ( = ?auto_6288 ?auto_6307 ) ) ( not ( = ?auto_6289 ?auto_6294 ) ) ( not ( = ?auto_6289 ?auto_6307 ) ) ( not ( = ?auto_6290 ?auto_6294 ) ) ( not ( = ?auto_6290 ?auto_6307 ) ) ( not ( = ?auto_6291 ?auto_6294 ) ) ( not ( = ?auto_6291 ?auto_6307 ) ) ( not ( = ?auto_6292 ?auto_6294 ) ) ( not ( = ?auto_6292 ?auto_6307 ) ) ( not ( = ?auto_6294 ?auto_6316 ) ) ( not ( = ?auto_6294 ?auto_6311 ) ) ( not ( = ?auto_6294 ?auto_6310 ) ) ( not ( = ?auto_6294 ?auto_6304 ) ) ( not ( = ?auto_6294 ?auto_6314 ) ) ( not ( = ?auto_6317 ?auto_6305 ) ) ( not ( = ?auto_6317 ?auto_6312 ) ) ( not ( = ?auto_6317 ?auto_6315 ) ) ( not ( = ?auto_6317 ?auto_6322 ) ) ( not ( = ?auto_6321 ?auto_6320 ) ) ( not ( = ?auto_6321 ?auto_6319 ) ) ( not ( = ?auto_6321 ?auto_6309 ) ) ( not ( = ?auto_6321 ?auto_6318 ) ) ( not ( = ?auto_6307 ?auto_6316 ) ) ( not ( = ?auto_6307 ?auto_6311 ) ) ( not ( = ?auto_6307 ?auto_6310 ) ) ( not ( = ?auto_6307 ?auto_6304 ) ) ( not ( = ?auto_6307 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6295 ) ) ( not ( = ?auto_6288 ?auto_6308 ) ) ( not ( = ?auto_6289 ?auto_6295 ) ) ( not ( = ?auto_6289 ?auto_6308 ) ) ( not ( = ?auto_6290 ?auto_6295 ) ) ( not ( = ?auto_6290 ?auto_6308 ) ) ( not ( = ?auto_6291 ?auto_6295 ) ) ( not ( = ?auto_6291 ?auto_6308 ) ) ( not ( = ?auto_6292 ?auto_6295 ) ) ( not ( = ?auto_6292 ?auto_6308 ) ) ( not ( = ?auto_6293 ?auto_6295 ) ) ( not ( = ?auto_6293 ?auto_6308 ) ) ( not ( = ?auto_6295 ?auto_6307 ) ) ( not ( = ?auto_6295 ?auto_6316 ) ) ( not ( = ?auto_6295 ?auto_6311 ) ) ( not ( = ?auto_6295 ?auto_6310 ) ) ( not ( = ?auto_6295 ?auto_6304 ) ) ( not ( = ?auto_6295 ?auto_6314 ) ) ( not ( = ?auto_6313 ?auto_6317 ) ) ( not ( = ?auto_6313 ?auto_6305 ) ) ( not ( = ?auto_6313 ?auto_6312 ) ) ( not ( = ?auto_6313 ?auto_6315 ) ) ( not ( = ?auto_6313 ?auto_6322 ) ) ( not ( = ?auto_6306 ?auto_6321 ) ) ( not ( = ?auto_6306 ?auto_6320 ) ) ( not ( = ?auto_6306 ?auto_6319 ) ) ( not ( = ?auto_6306 ?auto_6309 ) ) ( not ( = ?auto_6306 ?auto_6318 ) ) ( not ( = ?auto_6308 ?auto_6307 ) ) ( not ( = ?auto_6308 ?auto_6316 ) ) ( not ( = ?auto_6308 ?auto_6311 ) ) ( not ( = ?auto_6308 ?auto_6310 ) ) ( not ( = ?auto_6308 ?auto_6304 ) ) ( not ( = ?auto_6308 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6296 ) ) ( not ( = ?auto_6288 ?auto_6323 ) ) ( not ( = ?auto_6289 ?auto_6296 ) ) ( not ( = ?auto_6289 ?auto_6323 ) ) ( not ( = ?auto_6290 ?auto_6296 ) ) ( not ( = ?auto_6290 ?auto_6323 ) ) ( not ( = ?auto_6291 ?auto_6296 ) ) ( not ( = ?auto_6291 ?auto_6323 ) ) ( not ( = ?auto_6292 ?auto_6296 ) ) ( not ( = ?auto_6292 ?auto_6323 ) ) ( not ( = ?auto_6293 ?auto_6296 ) ) ( not ( = ?auto_6293 ?auto_6323 ) ) ( not ( = ?auto_6294 ?auto_6296 ) ) ( not ( = ?auto_6294 ?auto_6323 ) ) ( not ( = ?auto_6296 ?auto_6308 ) ) ( not ( = ?auto_6296 ?auto_6307 ) ) ( not ( = ?auto_6296 ?auto_6316 ) ) ( not ( = ?auto_6296 ?auto_6311 ) ) ( not ( = ?auto_6296 ?auto_6310 ) ) ( not ( = ?auto_6296 ?auto_6304 ) ) ( not ( = ?auto_6296 ?auto_6314 ) ) ( not ( = ?auto_6323 ?auto_6308 ) ) ( not ( = ?auto_6323 ?auto_6307 ) ) ( not ( = ?auto_6323 ?auto_6316 ) ) ( not ( = ?auto_6323 ?auto_6311 ) ) ( not ( = ?auto_6323 ?auto_6310 ) ) ( not ( = ?auto_6323 ?auto_6304 ) ) ( not ( = ?auto_6323 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6297 ) ) ( not ( = ?auto_6288 ?auto_6299 ) ) ( not ( = ?auto_6289 ?auto_6297 ) ) ( not ( = ?auto_6289 ?auto_6299 ) ) ( not ( = ?auto_6290 ?auto_6297 ) ) ( not ( = ?auto_6290 ?auto_6299 ) ) ( not ( = ?auto_6291 ?auto_6297 ) ) ( not ( = ?auto_6291 ?auto_6299 ) ) ( not ( = ?auto_6292 ?auto_6297 ) ) ( not ( = ?auto_6292 ?auto_6299 ) ) ( not ( = ?auto_6293 ?auto_6297 ) ) ( not ( = ?auto_6293 ?auto_6299 ) ) ( not ( = ?auto_6294 ?auto_6297 ) ) ( not ( = ?auto_6294 ?auto_6299 ) ) ( not ( = ?auto_6295 ?auto_6297 ) ) ( not ( = ?auto_6295 ?auto_6299 ) ) ( not ( = ?auto_6297 ?auto_6323 ) ) ( not ( = ?auto_6297 ?auto_6308 ) ) ( not ( = ?auto_6297 ?auto_6307 ) ) ( not ( = ?auto_6297 ?auto_6316 ) ) ( not ( = ?auto_6297 ?auto_6311 ) ) ( not ( = ?auto_6297 ?auto_6310 ) ) ( not ( = ?auto_6297 ?auto_6304 ) ) ( not ( = ?auto_6297 ?auto_6314 ) ) ( not ( = ?auto_6301 ?auto_6313 ) ) ( not ( = ?auto_6301 ?auto_6317 ) ) ( not ( = ?auto_6301 ?auto_6305 ) ) ( not ( = ?auto_6301 ?auto_6312 ) ) ( not ( = ?auto_6301 ?auto_6315 ) ) ( not ( = ?auto_6301 ?auto_6322 ) ) ( not ( = ?auto_6298 ?auto_6306 ) ) ( not ( = ?auto_6298 ?auto_6321 ) ) ( not ( = ?auto_6298 ?auto_6320 ) ) ( not ( = ?auto_6298 ?auto_6319 ) ) ( not ( = ?auto_6298 ?auto_6309 ) ) ( not ( = ?auto_6298 ?auto_6318 ) ) ( not ( = ?auto_6299 ?auto_6323 ) ) ( not ( = ?auto_6299 ?auto_6308 ) ) ( not ( = ?auto_6299 ?auto_6307 ) ) ( not ( = ?auto_6299 ?auto_6316 ) ) ( not ( = ?auto_6299 ?auto_6311 ) ) ( not ( = ?auto_6299 ?auto_6310 ) ) ( not ( = ?auto_6299 ?auto_6304 ) ) ( not ( = ?auto_6299 ?auto_6314 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6288 ?auto_6289 ?auto_6290 ?auto_6291 ?auto_6292 ?auto_6293 ?auto_6294 ?auto_6295 ?auto_6296 )
      ( MAKE-1CRATE ?auto_6296 ?auto_6297 )
      ( MAKE-9CRATE-VERIFY ?auto_6288 ?auto_6289 ?auto_6290 ?auto_6291 ?auto_6292 ?auto_6293 ?auto_6294 ?auto_6295 ?auto_6296 ?auto_6297 ) )
  )

)

