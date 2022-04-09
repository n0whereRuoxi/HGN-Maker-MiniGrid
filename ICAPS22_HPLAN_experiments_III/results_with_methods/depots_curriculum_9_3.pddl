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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6004 - SURFACE
      ?auto_6005 - SURFACE
    )
    :vars
    (
      ?auto_6006 - HOIST
      ?auto_6007 - PLACE
      ?auto_6009 - PLACE
      ?auto_6010 - HOIST
      ?auto_6011 - SURFACE
      ?auto_6008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6006 ?auto_6007 ) ( SURFACE-AT ?auto_6004 ?auto_6007 ) ( CLEAR ?auto_6004 ) ( IS-CRATE ?auto_6005 ) ( AVAILABLE ?auto_6006 ) ( not ( = ?auto_6009 ?auto_6007 ) ) ( HOIST-AT ?auto_6010 ?auto_6009 ) ( AVAILABLE ?auto_6010 ) ( SURFACE-AT ?auto_6005 ?auto_6009 ) ( ON ?auto_6005 ?auto_6011 ) ( CLEAR ?auto_6005 ) ( TRUCK-AT ?auto_6008 ?auto_6007 ) ( not ( = ?auto_6004 ?auto_6005 ) ) ( not ( = ?auto_6004 ?auto_6011 ) ) ( not ( = ?auto_6005 ?auto_6011 ) ) ( not ( = ?auto_6006 ?auto_6010 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6008 ?auto_6007 ?auto_6009 )
      ( !LIFT ?auto_6010 ?auto_6005 ?auto_6011 ?auto_6009 )
      ( !LOAD ?auto_6010 ?auto_6005 ?auto_6008 ?auto_6009 )
      ( !DRIVE ?auto_6008 ?auto_6009 ?auto_6007 )
      ( !UNLOAD ?auto_6006 ?auto_6005 ?auto_6008 ?auto_6007 )
      ( !DROP ?auto_6006 ?auto_6005 ?auto_6004 ?auto_6007 )
      ( MAKE-1CRATE-VERIFY ?auto_6004 ?auto_6005 ) )
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
      ?auto_6023 - HOIST
      ?auto_6022 - PLACE
      ?auto_6019 - PLACE
      ?auto_6020 - HOIST
      ?auto_6018 - SURFACE
      ?auto_6025 - PLACE
      ?auto_6026 - HOIST
      ?auto_6024 - SURFACE
      ?auto_6021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6023 ?auto_6022 ) ( IS-CRATE ?auto_6017 ) ( not ( = ?auto_6019 ?auto_6022 ) ) ( HOIST-AT ?auto_6020 ?auto_6019 ) ( AVAILABLE ?auto_6020 ) ( SURFACE-AT ?auto_6017 ?auto_6019 ) ( ON ?auto_6017 ?auto_6018 ) ( CLEAR ?auto_6017 ) ( not ( = ?auto_6016 ?auto_6017 ) ) ( not ( = ?auto_6016 ?auto_6018 ) ) ( not ( = ?auto_6017 ?auto_6018 ) ) ( not ( = ?auto_6023 ?auto_6020 ) ) ( SURFACE-AT ?auto_6015 ?auto_6022 ) ( CLEAR ?auto_6015 ) ( IS-CRATE ?auto_6016 ) ( AVAILABLE ?auto_6023 ) ( not ( = ?auto_6025 ?auto_6022 ) ) ( HOIST-AT ?auto_6026 ?auto_6025 ) ( AVAILABLE ?auto_6026 ) ( SURFACE-AT ?auto_6016 ?auto_6025 ) ( ON ?auto_6016 ?auto_6024 ) ( CLEAR ?auto_6016 ) ( TRUCK-AT ?auto_6021 ?auto_6022 ) ( not ( = ?auto_6015 ?auto_6016 ) ) ( not ( = ?auto_6015 ?auto_6024 ) ) ( not ( = ?auto_6016 ?auto_6024 ) ) ( not ( = ?auto_6023 ?auto_6026 ) ) ( not ( = ?auto_6015 ?auto_6017 ) ) ( not ( = ?auto_6015 ?auto_6018 ) ) ( not ( = ?auto_6017 ?auto_6024 ) ) ( not ( = ?auto_6019 ?auto_6025 ) ) ( not ( = ?auto_6020 ?auto_6026 ) ) ( not ( = ?auto_6018 ?auto_6024 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6015 ?auto_6016 )
      ( MAKE-1CRATE ?auto_6016 ?auto_6017 )
      ( MAKE-2CRATE-VERIFY ?auto_6015 ?auto_6016 ?auto_6017 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6029 - SURFACE
      ?auto_6030 - SURFACE
    )
    :vars
    (
      ?auto_6031 - HOIST
      ?auto_6032 - PLACE
      ?auto_6034 - PLACE
      ?auto_6035 - HOIST
      ?auto_6036 - SURFACE
      ?auto_6033 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6031 ?auto_6032 ) ( SURFACE-AT ?auto_6029 ?auto_6032 ) ( CLEAR ?auto_6029 ) ( IS-CRATE ?auto_6030 ) ( AVAILABLE ?auto_6031 ) ( not ( = ?auto_6034 ?auto_6032 ) ) ( HOIST-AT ?auto_6035 ?auto_6034 ) ( AVAILABLE ?auto_6035 ) ( SURFACE-AT ?auto_6030 ?auto_6034 ) ( ON ?auto_6030 ?auto_6036 ) ( CLEAR ?auto_6030 ) ( TRUCK-AT ?auto_6033 ?auto_6032 ) ( not ( = ?auto_6029 ?auto_6030 ) ) ( not ( = ?auto_6029 ?auto_6036 ) ) ( not ( = ?auto_6030 ?auto_6036 ) ) ( not ( = ?auto_6031 ?auto_6035 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6033 ?auto_6032 ?auto_6034 )
      ( !LIFT ?auto_6035 ?auto_6030 ?auto_6036 ?auto_6034 )
      ( !LOAD ?auto_6035 ?auto_6030 ?auto_6033 ?auto_6034 )
      ( !DRIVE ?auto_6033 ?auto_6034 ?auto_6032 )
      ( !UNLOAD ?auto_6031 ?auto_6030 ?auto_6033 ?auto_6032 )
      ( !DROP ?auto_6031 ?auto_6030 ?auto_6029 ?auto_6032 )
      ( MAKE-1CRATE-VERIFY ?auto_6029 ?auto_6030 ) )
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
      ?auto_6046 - HOIST
      ?auto_6049 - PLACE
      ?auto_6050 - PLACE
      ?auto_6047 - HOIST
      ?auto_6045 - SURFACE
      ?auto_6054 - SURFACE
      ?auto_6053 - PLACE
      ?auto_6052 - HOIST
      ?auto_6051 - SURFACE
      ?auto_6048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6046 ?auto_6049 ) ( IS-CRATE ?auto_6044 ) ( not ( = ?auto_6050 ?auto_6049 ) ) ( HOIST-AT ?auto_6047 ?auto_6050 ) ( SURFACE-AT ?auto_6044 ?auto_6050 ) ( ON ?auto_6044 ?auto_6045 ) ( CLEAR ?auto_6044 ) ( not ( = ?auto_6043 ?auto_6044 ) ) ( not ( = ?auto_6043 ?auto_6045 ) ) ( not ( = ?auto_6044 ?auto_6045 ) ) ( not ( = ?auto_6046 ?auto_6047 ) ) ( IS-CRATE ?auto_6043 ) ( AVAILABLE ?auto_6047 ) ( SURFACE-AT ?auto_6043 ?auto_6050 ) ( ON ?auto_6043 ?auto_6054 ) ( CLEAR ?auto_6043 ) ( not ( = ?auto_6042 ?auto_6043 ) ) ( not ( = ?auto_6042 ?auto_6054 ) ) ( not ( = ?auto_6043 ?auto_6054 ) ) ( SURFACE-AT ?auto_6041 ?auto_6049 ) ( CLEAR ?auto_6041 ) ( IS-CRATE ?auto_6042 ) ( AVAILABLE ?auto_6046 ) ( not ( = ?auto_6053 ?auto_6049 ) ) ( HOIST-AT ?auto_6052 ?auto_6053 ) ( AVAILABLE ?auto_6052 ) ( SURFACE-AT ?auto_6042 ?auto_6053 ) ( ON ?auto_6042 ?auto_6051 ) ( CLEAR ?auto_6042 ) ( TRUCK-AT ?auto_6048 ?auto_6049 ) ( not ( = ?auto_6041 ?auto_6042 ) ) ( not ( = ?auto_6041 ?auto_6051 ) ) ( not ( = ?auto_6042 ?auto_6051 ) ) ( not ( = ?auto_6046 ?auto_6052 ) ) ( not ( = ?auto_6041 ?auto_6043 ) ) ( not ( = ?auto_6041 ?auto_6054 ) ) ( not ( = ?auto_6043 ?auto_6051 ) ) ( not ( = ?auto_6050 ?auto_6053 ) ) ( not ( = ?auto_6047 ?auto_6052 ) ) ( not ( = ?auto_6054 ?auto_6051 ) ) ( not ( = ?auto_6041 ?auto_6044 ) ) ( not ( = ?auto_6041 ?auto_6045 ) ) ( not ( = ?auto_6042 ?auto_6044 ) ) ( not ( = ?auto_6042 ?auto_6045 ) ) ( not ( = ?auto_6044 ?auto_6054 ) ) ( not ( = ?auto_6044 ?auto_6051 ) ) ( not ( = ?auto_6045 ?auto_6054 ) ) ( not ( = ?auto_6045 ?auto_6051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6041 ?auto_6042 ?auto_6043 )
      ( MAKE-1CRATE ?auto_6043 ?auto_6044 )
      ( MAKE-3CRATE-VERIFY ?auto_6041 ?auto_6042 ?auto_6043 ?auto_6044 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6057 - SURFACE
      ?auto_6058 - SURFACE
    )
    :vars
    (
      ?auto_6059 - HOIST
      ?auto_6060 - PLACE
      ?auto_6062 - PLACE
      ?auto_6063 - HOIST
      ?auto_6064 - SURFACE
      ?auto_6061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6059 ?auto_6060 ) ( SURFACE-AT ?auto_6057 ?auto_6060 ) ( CLEAR ?auto_6057 ) ( IS-CRATE ?auto_6058 ) ( AVAILABLE ?auto_6059 ) ( not ( = ?auto_6062 ?auto_6060 ) ) ( HOIST-AT ?auto_6063 ?auto_6062 ) ( AVAILABLE ?auto_6063 ) ( SURFACE-AT ?auto_6058 ?auto_6062 ) ( ON ?auto_6058 ?auto_6064 ) ( CLEAR ?auto_6058 ) ( TRUCK-AT ?auto_6061 ?auto_6060 ) ( not ( = ?auto_6057 ?auto_6058 ) ) ( not ( = ?auto_6057 ?auto_6064 ) ) ( not ( = ?auto_6058 ?auto_6064 ) ) ( not ( = ?auto_6059 ?auto_6063 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6061 ?auto_6060 ?auto_6062 )
      ( !LIFT ?auto_6063 ?auto_6058 ?auto_6064 ?auto_6062 )
      ( !LOAD ?auto_6063 ?auto_6058 ?auto_6061 ?auto_6062 )
      ( !DRIVE ?auto_6061 ?auto_6062 ?auto_6060 )
      ( !UNLOAD ?auto_6059 ?auto_6058 ?auto_6061 ?auto_6060 )
      ( !DROP ?auto_6059 ?auto_6058 ?auto_6057 ?auto_6060 )
      ( MAKE-1CRATE-VERIFY ?auto_6057 ?auto_6058 ) )
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
      ?auto_6078 - HOIST
      ?auto_6079 - PLACE
      ?auto_6077 - PLACE
      ?auto_6076 - HOIST
      ?auto_6080 - SURFACE
      ?auto_6086 - PLACE
      ?auto_6085 - HOIST
      ?auto_6084 - SURFACE
      ?auto_6083 - SURFACE
      ?auto_6087 - PLACE
      ?auto_6082 - HOIST
      ?auto_6081 - SURFACE
      ?auto_6075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6078 ?auto_6079 ) ( IS-CRATE ?auto_6074 ) ( not ( = ?auto_6077 ?auto_6079 ) ) ( HOIST-AT ?auto_6076 ?auto_6077 ) ( AVAILABLE ?auto_6076 ) ( SURFACE-AT ?auto_6074 ?auto_6077 ) ( ON ?auto_6074 ?auto_6080 ) ( CLEAR ?auto_6074 ) ( not ( = ?auto_6073 ?auto_6074 ) ) ( not ( = ?auto_6073 ?auto_6080 ) ) ( not ( = ?auto_6074 ?auto_6080 ) ) ( not ( = ?auto_6078 ?auto_6076 ) ) ( IS-CRATE ?auto_6073 ) ( not ( = ?auto_6086 ?auto_6079 ) ) ( HOIST-AT ?auto_6085 ?auto_6086 ) ( SURFACE-AT ?auto_6073 ?auto_6086 ) ( ON ?auto_6073 ?auto_6084 ) ( CLEAR ?auto_6073 ) ( not ( = ?auto_6072 ?auto_6073 ) ) ( not ( = ?auto_6072 ?auto_6084 ) ) ( not ( = ?auto_6073 ?auto_6084 ) ) ( not ( = ?auto_6078 ?auto_6085 ) ) ( IS-CRATE ?auto_6072 ) ( AVAILABLE ?auto_6085 ) ( SURFACE-AT ?auto_6072 ?auto_6086 ) ( ON ?auto_6072 ?auto_6083 ) ( CLEAR ?auto_6072 ) ( not ( = ?auto_6071 ?auto_6072 ) ) ( not ( = ?auto_6071 ?auto_6083 ) ) ( not ( = ?auto_6072 ?auto_6083 ) ) ( SURFACE-AT ?auto_6070 ?auto_6079 ) ( CLEAR ?auto_6070 ) ( IS-CRATE ?auto_6071 ) ( AVAILABLE ?auto_6078 ) ( not ( = ?auto_6087 ?auto_6079 ) ) ( HOIST-AT ?auto_6082 ?auto_6087 ) ( AVAILABLE ?auto_6082 ) ( SURFACE-AT ?auto_6071 ?auto_6087 ) ( ON ?auto_6071 ?auto_6081 ) ( CLEAR ?auto_6071 ) ( TRUCK-AT ?auto_6075 ?auto_6079 ) ( not ( = ?auto_6070 ?auto_6071 ) ) ( not ( = ?auto_6070 ?auto_6081 ) ) ( not ( = ?auto_6071 ?auto_6081 ) ) ( not ( = ?auto_6078 ?auto_6082 ) ) ( not ( = ?auto_6070 ?auto_6072 ) ) ( not ( = ?auto_6070 ?auto_6083 ) ) ( not ( = ?auto_6072 ?auto_6081 ) ) ( not ( = ?auto_6086 ?auto_6087 ) ) ( not ( = ?auto_6085 ?auto_6082 ) ) ( not ( = ?auto_6083 ?auto_6081 ) ) ( not ( = ?auto_6070 ?auto_6073 ) ) ( not ( = ?auto_6070 ?auto_6084 ) ) ( not ( = ?auto_6071 ?auto_6073 ) ) ( not ( = ?auto_6071 ?auto_6084 ) ) ( not ( = ?auto_6073 ?auto_6083 ) ) ( not ( = ?auto_6073 ?auto_6081 ) ) ( not ( = ?auto_6084 ?auto_6083 ) ) ( not ( = ?auto_6084 ?auto_6081 ) ) ( not ( = ?auto_6070 ?auto_6074 ) ) ( not ( = ?auto_6070 ?auto_6080 ) ) ( not ( = ?auto_6071 ?auto_6074 ) ) ( not ( = ?auto_6071 ?auto_6080 ) ) ( not ( = ?auto_6072 ?auto_6074 ) ) ( not ( = ?auto_6072 ?auto_6080 ) ) ( not ( = ?auto_6074 ?auto_6084 ) ) ( not ( = ?auto_6074 ?auto_6083 ) ) ( not ( = ?auto_6074 ?auto_6081 ) ) ( not ( = ?auto_6077 ?auto_6086 ) ) ( not ( = ?auto_6077 ?auto_6087 ) ) ( not ( = ?auto_6076 ?auto_6085 ) ) ( not ( = ?auto_6076 ?auto_6082 ) ) ( not ( = ?auto_6080 ?auto_6084 ) ) ( not ( = ?auto_6080 ?auto_6083 ) ) ( not ( = ?auto_6080 ?auto_6081 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6070 ?auto_6071 ?auto_6072 ?auto_6073 )
      ( MAKE-1CRATE ?auto_6073 ?auto_6074 )
      ( MAKE-4CRATE-VERIFY ?auto_6070 ?auto_6071 ?auto_6072 ?auto_6073 ?auto_6074 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6090 - SURFACE
      ?auto_6091 - SURFACE
    )
    :vars
    (
      ?auto_6092 - HOIST
      ?auto_6093 - PLACE
      ?auto_6095 - PLACE
      ?auto_6096 - HOIST
      ?auto_6097 - SURFACE
      ?auto_6094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6092 ?auto_6093 ) ( SURFACE-AT ?auto_6090 ?auto_6093 ) ( CLEAR ?auto_6090 ) ( IS-CRATE ?auto_6091 ) ( AVAILABLE ?auto_6092 ) ( not ( = ?auto_6095 ?auto_6093 ) ) ( HOIST-AT ?auto_6096 ?auto_6095 ) ( AVAILABLE ?auto_6096 ) ( SURFACE-AT ?auto_6091 ?auto_6095 ) ( ON ?auto_6091 ?auto_6097 ) ( CLEAR ?auto_6091 ) ( TRUCK-AT ?auto_6094 ?auto_6093 ) ( not ( = ?auto_6090 ?auto_6091 ) ) ( not ( = ?auto_6090 ?auto_6097 ) ) ( not ( = ?auto_6091 ?auto_6097 ) ) ( not ( = ?auto_6092 ?auto_6096 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6094 ?auto_6093 ?auto_6095 )
      ( !LIFT ?auto_6096 ?auto_6091 ?auto_6097 ?auto_6095 )
      ( !LOAD ?auto_6096 ?auto_6091 ?auto_6094 ?auto_6095 )
      ( !DRIVE ?auto_6094 ?auto_6095 ?auto_6093 )
      ( !UNLOAD ?auto_6092 ?auto_6091 ?auto_6094 ?auto_6093 )
      ( !DROP ?auto_6092 ?auto_6091 ?auto_6090 ?auto_6093 )
      ( MAKE-1CRATE-VERIFY ?auto_6090 ?auto_6091 ) )
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
      ?auto_6111 - HOIST
      ?auto_6112 - PLACE
      ?auto_6115 - PLACE
      ?auto_6114 - HOIST
      ?auto_6110 - SURFACE
      ?auto_6123 - PLACE
      ?auto_6117 - HOIST
      ?auto_6118 - SURFACE
      ?auto_6119 - PLACE
      ?auto_6122 - HOIST
      ?auto_6124 - SURFACE
      ?auto_6116 - SURFACE
      ?auto_6120 - PLACE
      ?auto_6125 - HOIST
      ?auto_6121 - SURFACE
      ?auto_6113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6111 ?auto_6112 ) ( IS-CRATE ?auto_6109 ) ( not ( = ?auto_6115 ?auto_6112 ) ) ( HOIST-AT ?auto_6114 ?auto_6115 ) ( AVAILABLE ?auto_6114 ) ( SURFACE-AT ?auto_6109 ?auto_6115 ) ( ON ?auto_6109 ?auto_6110 ) ( CLEAR ?auto_6109 ) ( not ( = ?auto_6108 ?auto_6109 ) ) ( not ( = ?auto_6108 ?auto_6110 ) ) ( not ( = ?auto_6109 ?auto_6110 ) ) ( not ( = ?auto_6111 ?auto_6114 ) ) ( IS-CRATE ?auto_6108 ) ( not ( = ?auto_6123 ?auto_6112 ) ) ( HOIST-AT ?auto_6117 ?auto_6123 ) ( AVAILABLE ?auto_6117 ) ( SURFACE-AT ?auto_6108 ?auto_6123 ) ( ON ?auto_6108 ?auto_6118 ) ( CLEAR ?auto_6108 ) ( not ( = ?auto_6107 ?auto_6108 ) ) ( not ( = ?auto_6107 ?auto_6118 ) ) ( not ( = ?auto_6108 ?auto_6118 ) ) ( not ( = ?auto_6111 ?auto_6117 ) ) ( IS-CRATE ?auto_6107 ) ( not ( = ?auto_6119 ?auto_6112 ) ) ( HOIST-AT ?auto_6122 ?auto_6119 ) ( SURFACE-AT ?auto_6107 ?auto_6119 ) ( ON ?auto_6107 ?auto_6124 ) ( CLEAR ?auto_6107 ) ( not ( = ?auto_6106 ?auto_6107 ) ) ( not ( = ?auto_6106 ?auto_6124 ) ) ( not ( = ?auto_6107 ?auto_6124 ) ) ( not ( = ?auto_6111 ?auto_6122 ) ) ( IS-CRATE ?auto_6106 ) ( AVAILABLE ?auto_6122 ) ( SURFACE-AT ?auto_6106 ?auto_6119 ) ( ON ?auto_6106 ?auto_6116 ) ( CLEAR ?auto_6106 ) ( not ( = ?auto_6105 ?auto_6106 ) ) ( not ( = ?auto_6105 ?auto_6116 ) ) ( not ( = ?auto_6106 ?auto_6116 ) ) ( SURFACE-AT ?auto_6104 ?auto_6112 ) ( CLEAR ?auto_6104 ) ( IS-CRATE ?auto_6105 ) ( AVAILABLE ?auto_6111 ) ( not ( = ?auto_6120 ?auto_6112 ) ) ( HOIST-AT ?auto_6125 ?auto_6120 ) ( AVAILABLE ?auto_6125 ) ( SURFACE-AT ?auto_6105 ?auto_6120 ) ( ON ?auto_6105 ?auto_6121 ) ( CLEAR ?auto_6105 ) ( TRUCK-AT ?auto_6113 ?auto_6112 ) ( not ( = ?auto_6104 ?auto_6105 ) ) ( not ( = ?auto_6104 ?auto_6121 ) ) ( not ( = ?auto_6105 ?auto_6121 ) ) ( not ( = ?auto_6111 ?auto_6125 ) ) ( not ( = ?auto_6104 ?auto_6106 ) ) ( not ( = ?auto_6104 ?auto_6116 ) ) ( not ( = ?auto_6106 ?auto_6121 ) ) ( not ( = ?auto_6119 ?auto_6120 ) ) ( not ( = ?auto_6122 ?auto_6125 ) ) ( not ( = ?auto_6116 ?auto_6121 ) ) ( not ( = ?auto_6104 ?auto_6107 ) ) ( not ( = ?auto_6104 ?auto_6124 ) ) ( not ( = ?auto_6105 ?auto_6107 ) ) ( not ( = ?auto_6105 ?auto_6124 ) ) ( not ( = ?auto_6107 ?auto_6116 ) ) ( not ( = ?auto_6107 ?auto_6121 ) ) ( not ( = ?auto_6124 ?auto_6116 ) ) ( not ( = ?auto_6124 ?auto_6121 ) ) ( not ( = ?auto_6104 ?auto_6108 ) ) ( not ( = ?auto_6104 ?auto_6118 ) ) ( not ( = ?auto_6105 ?auto_6108 ) ) ( not ( = ?auto_6105 ?auto_6118 ) ) ( not ( = ?auto_6106 ?auto_6108 ) ) ( not ( = ?auto_6106 ?auto_6118 ) ) ( not ( = ?auto_6108 ?auto_6124 ) ) ( not ( = ?auto_6108 ?auto_6116 ) ) ( not ( = ?auto_6108 ?auto_6121 ) ) ( not ( = ?auto_6123 ?auto_6119 ) ) ( not ( = ?auto_6123 ?auto_6120 ) ) ( not ( = ?auto_6117 ?auto_6122 ) ) ( not ( = ?auto_6117 ?auto_6125 ) ) ( not ( = ?auto_6118 ?auto_6124 ) ) ( not ( = ?auto_6118 ?auto_6116 ) ) ( not ( = ?auto_6118 ?auto_6121 ) ) ( not ( = ?auto_6104 ?auto_6109 ) ) ( not ( = ?auto_6104 ?auto_6110 ) ) ( not ( = ?auto_6105 ?auto_6109 ) ) ( not ( = ?auto_6105 ?auto_6110 ) ) ( not ( = ?auto_6106 ?auto_6109 ) ) ( not ( = ?auto_6106 ?auto_6110 ) ) ( not ( = ?auto_6107 ?auto_6109 ) ) ( not ( = ?auto_6107 ?auto_6110 ) ) ( not ( = ?auto_6109 ?auto_6118 ) ) ( not ( = ?auto_6109 ?auto_6124 ) ) ( not ( = ?auto_6109 ?auto_6116 ) ) ( not ( = ?auto_6109 ?auto_6121 ) ) ( not ( = ?auto_6115 ?auto_6123 ) ) ( not ( = ?auto_6115 ?auto_6119 ) ) ( not ( = ?auto_6115 ?auto_6120 ) ) ( not ( = ?auto_6114 ?auto_6117 ) ) ( not ( = ?auto_6114 ?auto_6122 ) ) ( not ( = ?auto_6114 ?auto_6125 ) ) ( not ( = ?auto_6110 ?auto_6118 ) ) ( not ( = ?auto_6110 ?auto_6124 ) ) ( not ( = ?auto_6110 ?auto_6116 ) ) ( not ( = ?auto_6110 ?auto_6121 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6104 ?auto_6105 ?auto_6106 ?auto_6107 ?auto_6108 )
      ( MAKE-1CRATE ?auto_6108 ?auto_6109 )
      ( MAKE-5CRATE-VERIFY ?auto_6104 ?auto_6105 ?auto_6106 ?auto_6107 ?auto_6108 ?auto_6109 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6128 - SURFACE
      ?auto_6129 - SURFACE
    )
    :vars
    (
      ?auto_6130 - HOIST
      ?auto_6131 - PLACE
      ?auto_6133 - PLACE
      ?auto_6134 - HOIST
      ?auto_6135 - SURFACE
      ?auto_6132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6130 ?auto_6131 ) ( SURFACE-AT ?auto_6128 ?auto_6131 ) ( CLEAR ?auto_6128 ) ( IS-CRATE ?auto_6129 ) ( AVAILABLE ?auto_6130 ) ( not ( = ?auto_6133 ?auto_6131 ) ) ( HOIST-AT ?auto_6134 ?auto_6133 ) ( AVAILABLE ?auto_6134 ) ( SURFACE-AT ?auto_6129 ?auto_6133 ) ( ON ?auto_6129 ?auto_6135 ) ( CLEAR ?auto_6129 ) ( TRUCK-AT ?auto_6132 ?auto_6131 ) ( not ( = ?auto_6128 ?auto_6129 ) ) ( not ( = ?auto_6128 ?auto_6135 ) ) ( not ( = ?auto_6129 ?auto_6135 ) ) ( not ( = ?auto_6130 ?auto_6134 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6132 ?auto_6131 ?auto_6133 )
      ( !LIFT ?auto_6134 ?auto_6129 ?auto_6135 ?auto_6133 )
      ( !LOAD ?auto_6134 ?auto_6129 ?auto_6132 ?auto_6133 )
      ( !DRIVE ?auto_6132 ?auto_6133 ?auto_6131 )
      ( !UNLOAD ?auto_6130 ?auto_6129 ?auto_6132 ?auto_6131 )
      ( !DROP ?auto_6130 ?auto_6129 ?auto_6128 ?auto_6131 )
      ( MAKE-1CRATE-VERIFY ?auto_6128 ?auto_6129 ) )
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
      ?auto_6152 - PLACE
      ?auto_6150 - PLACE
      ?auto_6154 - HOIST
      ?auto_6155 - SURFACE
      ?auto_6161 - PLACE
      ?auto_6163 - HOIST
      ?auto_6162 - SURFACE
      ?auto_6156 - PLACE
      ?auto_6165 - HOIST
      ?auto_6159 - SURFACE
      ?auto_6164 - PLACE
      ?auto_6160 - HOIST
      ?auto_6167 - SURFACE
      ?auto_6168 - SURFACE
      ?auto_6158 - PLACE
      ?auto_6166 - HOIST
      ?auto_6157 - SURFACE
      ?auto_6153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6151 ?auto_6152 ) ( IS-CRATE ?auto_6149 ) ( not ( = ?auto_6150 ?auto_6152 ) ) ( HOIST-AT ?auto_6154 ?auto_6150 ) ( AVAILABLE ?auto_6154 ) ( SURFACE-AT ?auto_6149 ?auto_6150 ) ( ON ?auto_6149 ?auto_6155 ) ( CLEAR ?auto_6149 ) ( not ( = ?auto_6148 ?auto_6149 ) ) ( not ( = ?auto_6148 ?auto_6155 ) ) ( not ( = ?auto_6149 ?auto_6155 ) ) ( not ( = ?auto_6151 ?auto_6154 ) ) ( IS-CRATE ?auto_6148 ) ( not ( = ?auto_6161 ?auto_6152 ) ) ( HOIST-AT ?auto_6163 ?auto_6161 ) ( AVAILABLE ?auto_6163 ) ( SURFACE-AT ?auto_6148 ?auto_6161 ) ( ON ?auto_6148 ?auto_6162 ) ( CLEAR ?auto_6148 ) ( not ( = ?auto_6147 ?auto_6148 ) ) ( not ( = ?auto_6147 ?auto_6162 ) ) ( not ( = ?auto_6148 ?auto_6162 ) ) ( not ( = ?auto_6151 ?auto_6163 ) ) ( IS-CRATE ?auto_6147 ) ( not ( = ?auto_6156 ?auto_6152 ) ) ( HOIST-AT ?auto_6165 ?auto_6156 ) ( AVAILABLE ?auto_6165 ) ( SURFACE-AT ?auto_6147 ?auto_6156 ) ( ON ?auto_6147 ?auto_6159 ) ( CLEAR ?auto_6147 ) ( not ( = ?auto_6146 ?auto_6147 ) ) ( not ( = ?auto_6146 ?auto_6159 ) ) ( not ( = ?auto_6147 ?auto_6159 ) ) ( not ( = ?auto_6151 ?auto_6165 ) ) ( IS-CRATE ?auto_6146 ) ( not ( = ?auto_6164 ?auto_6152 ) ) ( HOIST-AT ?auto_6160 ?auto_6164 ) ( SURFACE-AT ?auto_6146 ?auto_6164 ) ( ON ?auto_6146 ?auto_6167 ) ( CLEAR ?auto_6146 ) ( not ( = ?auto_6145 ?auto_6146 ) ) ( not ( = ?auto_6145 ?auto_6167 ) ) ( not ( = ?auto_6146 ?auto_6167 ) ) ( not ( = ?auto_6151 ?auto_6160 ) ) ( IS-CRATE ?auto_6145 ) ( AVAILABLE ?auto_6160 ) ( SURFACE-AT ?auto_6145 ?auto_6164 ) ( ON ?auto_6145 ?auto_6168 ) ( CLEAR ?auto_6145 ) ( not ( = ?auto_6144 ?auto_6145 ) ) ( not ( = ?auto_6144 ?auto_6168 ) ) ( not ( = ?auto_6145 ?auto_6168 ) ) ( SURFACE-AT ?auto_6143 ?auto_6152 ) ( CLEAR ?auto_6143 ) ( IS-CRATE ?auto_6144 ) ( AVAILABLE ?auto_6151 ) ( not ( = ?auto_6158 ?auto_6152 ) ) ( HOIST-AT ?auto_6166 ?auto_6158 ) ( AVAILABLE ?auto_6166 ) ( SURFACE-AT ?auto_6144 ?auto_6158 ) ( ON ?auto_6144 ?auto_6157 ) ( CLEAR ?auto_6144 ) ( TRUCK-AT ?auto_6153 ?auto_6152 ) ( not ( = ?auto_6143 ?auto_6144 ) ) ( not ( = ?auto_6143 ?auto_6157 ) ) ( not ( = ?auto_6144 ?auto_6157 ) ) ( not ( = ?auto_6151 ?auto_6166 ) ) ( not ( = ?auto_6143 ?auto_6145 ) ) ( not ( = ?auto_6143 ?auto_6168 ) ) ( not ( = ?auto_6145 ?auto_6157 ) ) ( not ( = ?auto_6164 ?auto_6158 ) ) ( not ( = ?auto_6160 ?auto_6166 ) ) ( not ( = ?auto_6168 ?auto_6157 ) ) ( not ( = ?auto_6143 ?auto_6146 ) ) ( not ( = ?auto_6143 ?auto_6167 ) ) ( not ( = ?auto_6144 ?auto_6146 ) ) ( not ( = ?auto_6144 ?auto_6167 ) ) ( not ( = ?auto_6146 ?auto_6168 ) ) ( not ( = ?auto_6146 ?auto_6157 ) ) ( not ( = ?auto_6167 ?auto_6168 ) ) ( not ( = ?auto_6167 ?auto_6157 ) ) ( not ( = ?auto_6143 ?auto_6147 ) ) ( not ( = ?auto_6143 ?auto_6159 ) ) ( not ( = ?auto_6144 ?auto_6147 ) ) ( not ( = ?auto_6144 ?auto_6159 ) ) ( not ( = ?auto_6145 ?auto_6147 ) ) ( not ( = ?auto_6145 ?auto_6159 ) ) ( not ( = ?auto_6147 ?auto_6167 ) ) ( not ( = ?auto_6147 ?auto_6168 ) ) ( not ( = ?auto_6147 ?auto_6157 ) ) ( not ( = ?auto_6156 ?auto_6164 ) ) ( not ( = ?auto_6156 ?auto_6158 ) ) ( not ( = ?auto_6165 ?auto_6160 ) ) ( not ( = ?auto_6165 ?auto_6166 ) ) ( not ( = ?auto_6159 ?auto_6167 ) ) ( not ( = ?auto_6159 ?auto_6168 ) ) ( not ( = ?auto_6159 ?auto_6157 ) ) ( not ( = ?auto_6143 ?auto_6148 ) ) ( not ( = ?auto_6143 ?auto_6162 ) ) ( not ( = ?auto_6144 ?auto_6148 ) ) ( not ( = ?auto_6144 ?auto_6162 ) ) ( not ( = ?auto_6145 ?auto_6148 ) ) ( not ( = ?auto_6145 ?auto_6162 ) ) ( not ( = ?auto_6146 ?auto_6148 ) ) ( not ( = ?auto_6146 ?auto_6162 ) ) ( not ( = ?auto_6148 ?auto_6159 ) ) ( not ( = ?auto_6148 ?auto_6167 ) ) ( not ( = ?auto_6148 ?auto_6168 ) ) ( not ( = ?auto_6148 ?auto_6157 ) ) ( not ( = ?auto_6161 ?auto_6156 ) ) ( not ( = ?auto_6161 ?auto_6164 ) ) ( not ( = ?auto_6161 ?auto_6158 ) ) ( not ( = ?auto_6163 ?auto_6165 ) ) ( not ( = ?auto_6163 ?auto_6160 ) ) ( not ( = ?auto_6163 ?auto_6166 ) ) ( not ( = ?auto_6162 ?auto_6159 ) ) ( not ( = ?auto_6162 ?auto_6167 ) ) ( not ( = ?auto_6162 ?auto_6168 ) ) ( not ( = ?auto_6162 ?auto_6157 ) ) ( not ( = ?auto_6143 ?auto_6149 ) ) ( not ( = ?auto_6143 ?auto_6155 ) ) ( not ( = ?auto_6144 ?auto_6149 ) ) ( not ( = ?auto_6144 ?auto_6155 ) ) ( not ( = ?auto_6145 ?auto_6149 ) ) ( not ( = ?auto_6145 ?auto_6155 ) ) ( not ( = ?auto_6146 ?auto_6149 ) ) ( not ( = ?auto_6146 ?auto_6155 ) ) ( not ( = ?auto_6147 ?auto_6149 ) ) ( not ( = ?auto_6147 ?auto_6155 ) ) ( not ( = ?auto_6149 ?auto_6162 ) ) ( not ( = ?auto_6149 ?auto_6159 ) ) ( not ( = ?auto_6149 ?auto_6167 ) ) ( not ( = ?auto_6149 ?auto_6168 ) ) ( not ( = ?auto_6149 ?auto_6157 ) ) ( not ( = ?auto_6150 ?auto_6161 ) ) ( not ( = ?auto_6150 ?auto_6156 ) ) ( not ( = ?auto_6150 ?auto_6164 ) ) ( not ( = ?auto_6150 ?auto_6158 ) ) ( not ( = ?auto_6154 ?auto_6163 ) ) ( not ( = ?auto_6154 ?auto_6165 ) ) ( not ( = ?auto_6154 ?auto_6160 ) ) ( not ( = ?auto_6154 ?auto_6166 ) ) ( not ( = ?auto_6155 ?auto_6162 ) ) ( not ( = ?auto_6155 ?auto_6159 ) ) ( not ( = ?auto_6155 ?auto_6167 ) ) ( not ( = ?auto_6155 ?auto_6168 ) ) ( not ( = ?auto_6155 ?auto_6157 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6143 ?auto_6144 ?auto_6145 ?auto_6146 ?auto_6147 ?auto_6148 )
      ( MAKE-1CRATE ?auto_6148 ?auto_6149 )
      ( MAKE-6CRATE-VERIFY ?auto_6143 ?auto_6144 ?auto_6145 ?auto_6146 ?auto_6147 ?auto_6148 ?auto_6149 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6171 - SURFACE
      ?auto_6172 - SURFACE
    )
    :vars
    (
      ?auto_6173 - HOIST
      ?auto_6174 - PLACE
      ?auto_6176 - PLACE
      ?auto_6177 - HOIST
      ?auto_6178 - SURFACE
      ?auto_6175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6173 ?auto_6174 ) ( SURFACE-AT ?auto_6171 ?auto_6174 ) ( CLEAR ?auto_6171 ) ( IS-CRATE ?auto_6172 ) ( AVAILABLE ?auto_6173 ) ( not ( = ?auto_6176 ?auto_6174 ) ) ( HOIST-AT ?auto_6177 ?auto_6176 ) ( AVAILABLE ?auto_6177 ) ( SURFACE-AT ?auto_6172 ?auto_6176 ) ( ON ?auto_6172 ?auto_6178 ) ( CLEAR ?auto_6172 ) ( TRUCK-AT ?auto_6175 ?auto_6174 ) ( not ( = ?auto_6171 ?auto_6172 ) ) ( not ( = ?auto_6171 ?auto_6178 ) ) ( not ( = ?auto_6172 ?auto_6178 ) ) ( not ( = ?auto_6173 ?auto_6177 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6175 ?auto_6174 ?auto_6176 )
      ( !LIFT ?auto_6177 ?auto_6172 ?auto_6178 ?auto_6176 )
      ( !LOAD ?auto_6177 ?auto_6172 ?auto_6175 ?auto_6176 )
      ( !DRIVE ?auto_6175 ?auto_6176 ?auto_6174 )
      ( !UNLOAD ?auto_6173 ?auto_6172 ?auto_6175 ?auto_6174 )
      ( !DROP ?auto_6173 ?auto_6172 ?auto_6171 ?auto_6174 )
      ( MAKE-1CRATE-VERIFY ?auto_6171 ?auto_6172 ) )
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
      ?auto_6194 - SURFACE
      ?auto_6193 - SURFACE
    )
    :vars
    (
      ?auto_6197 - HOIST
      ?auto_6195 - PLACE
      ?auto_6199 - PLACE
      ?auto_6200 - HOIST
      ?auto_6196 - SURFACE
      ?auto_6202 - PLACE
      ?auto_6211 - HOIST
      ?auto_6201 - SURFACE
      ?auto_6206 - PLACE
      ?auto_6208 - HOIST
      ?auto_6209 - SURFACE
      ?auto_6213 - PLACE
      ?auto_6216 - HOIST
      ?auto_6210 - SURFACE
      ?auto_6214 - PLACE
      ?auto_6207 - HOIST
      ?auto_6204 - SURFACE
      ?auto_6205 - SURFACE
      ?auto_6212 - PLACE
      ?auto_6215 - HOIST
      ?auto_6203 - SURFACE
      ?auto_6198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6197 ?auto_6195 ) ( IS-CRATE ?auto_6193 ) ( not ( = ?auto_6199 ?auto_6195 ) ) ( HOIST-AT ?auto_6200 ?auto_6199 ) ( AVAILABLE ?auto_6200 ) ( SURFACE-AT ?auto_6193 ?auto_6199 ) ( ON ?auto_6193 ?auto_6196 ) ( CLEAR ?auto_6193 ) ( not ( = ?auto_6194 ?auto_6193 ) ) ( not ( = ?auto_6194 ?auto_6196 ) ) ( not ( = ?auto_6193 ?auto_6196 ) ) ( not ( = ?auto_6197 ?auto_6200 ) ) ( IS-CRATE ?auto_6194 ) ( not ( = ?auto_6202 ?auto_6195 ) ) ( HOIST-AT ?auto_6211 ?auto_6202 ) ( AVAILABLE ?auto_6211 ) ( SURFACE-AT ?auto_6194 ?auto_6202 ) ( ON ?auto_6194 ?auto_6201 ) ( CLEAR ?auto_6194 ) ( not ( = ?auto_6192 ?auto_6194 ) ) ( not ( = ?auto_6192 ?auto_6201 ) ) ( not ( = ?auto_6194 ?auto_6201 ) ) ( not ( = ?auto_6197 ?auto_6211 ) ) ( IS-CRATE ?auto_6192 ) ( not ( = ?auto_6206 ?auto_6195 ) ) ( HOIST-AT ?auto_6208 ?auto_6206 ) ( AVAILABLE ?auto_6208 ) ( SURFACE-AT ?auto_6192 ?auto_6206 ) ( ON ?auto_6192 ?auto_6209 ) ( CLEAR ?auto_6192 ) ( not ( = ?auto_6191 ?auto_6192 ) ) ( not ( = ?auto_6191 ?auto_6209 ) ) ( not ( = ?auto_6192 ?auto_6209 ) ) ( not ( = ?auto_6197 ?auto_6208 ) ) ( IS-CRATE ?auto_6191 ) ( not ( = ?auto_6213 ?auto_6195 ) ) ( HOIST-AT ?auto_6216 ?auto_6213 ) ( AVAILABLE ?auto_6216 ) ( SURFACE-AT ?auto_6191 ?auto_6213 ) ( ON ?auto_6191 ?auto_6210 ) ( CLEAR ?auto_6191 ) ( not ( = ?auto_6190 ?auto_6191 ) ) ( not ( = ?auto_6190 ?auto_6210 ) ) ( not ( = ?auto_6191 ?auto_6210 ) ) ( not ( = ?auto_6197 ?auto_6216 ) ) ( IS-CRATE ?auto_6190 ) ( not ( = ?auto_6214 ?auto_6195 ) ) ( HOIST-AT ?auto_6207 ?auto_6214 ) ( SURFACE-AT ?auto_6190 ?auto_6214 ) ( ON ?auto_6190 ?auto_6204 ) ( CLEAR ?auto_6190 ) ( not ( = ?auto_6189 ?auto_6190 ) ) ( not ( = ?auto_6189 ?auto_6204 ) ) ( not ( = ?auto_6190 ?auto_6204 ) ) ( not ( = ?auto_6197 ?auto_6207 ) ) ( IS-CRATE ?auto_6189 ) ( AVAILABLE ?auto_6207 ) ( SURFACE-AT ?auto_6189 ?auto_6214 ) ( ON ?auto_6189 ?auto_6205 ) ( CLEAR ?auto_6189 ) ( not ( = ?auto_6188 ?auto_6189 ) ) ( not ( = ?auto_6188 ?auto_6205 ) ) ( not ( = ?auto_6189 ?auto_6205 ) ) ( SURFACE-AT ?auto_6187 ?auto_6195 ) ( CLEAR ?auto_6187 ) ( IS-CRATE ?auto_6188 ) ( AVAILABLE ?auto_6197 ) ( not ( = ?auto_6212 ?auto_6195 ) ) ( HOIST-AT ?auto_6215 ?auto_6212 ) ( AVAILABLE ?auto_6215 ) ( SURFACE-AT ?auto_6188 ?auto_6212 ) ( ON ?auto_6188 ?auto_6203 ) ( CLEAR ?auto_6188 ) ( TRUCK-AT ?auto_6198 ?auto_6195 ) ( not ( = ?auto_6187 ?auto_6188 ) ) ( not ( = ?auto_6187 ?auto_6203 ) ) ( not ( = ?auto_6188 ?auto_6203 ) ) ( not ( = ?auto_6197 ?auto_6215 ) ) ( not ( = ?auto_6187 ?auto_6189 ) ) ( not ( = ?auto_6187 ?auto_6205 ) ) ( not ( = ?auto_6189 ?auto_6203 ) ) ( not ( = ?auto_6214 ?auto_6212 ) ) ( not ( = ?auto_6207 ?auto_6215 ) ) ( not ( = ?auto_6205 ?auto_6203 ) ) ( not ( = ?auto_6187 ?auto_6190 ) ) ( not ( = ?auto_6187 ?auto_6204 ) ) ( not ( = ?auto_6188 ?auto_6190 ) ) ( not ( = ?auto_6188 ?auto_6204 ) ) ( not ( = ?auto_6190 ?auto_6205 ) ) ( not ( = ?auto_6190 ?auto_6203 ) ) ( not ( = ?auto_6204 ?auto_6205 ) ) ( not ( = ?auto_6204 ?auto_6203 ) ) ( not ( = ?auto_6187 ?auto_6191 ) ) ( not ( = ?auto_6187 ?auto_6210 ) ) ( not ( = ?auto_6188 ?auto_6191 ) ) ( not ( = ?auto_6188 ?auto_6210 ) ) ( not ( = ?auto_6189 ?auto_6191 ) ) ( not ( = ?auto_6189 ?auto_6210 ) ) ( not ( = ?auto_6191 ?auto_6204 ) ) ( not ( = ?auto_6191 ?auto_6205 ) ) ( not ( = ?auto_6191 ?auto_6203 ) ) ( not ( = ?auto_6213 ?auto_6214 ) ) ( not ( = ?auto_6213 ?auto_6212 ) ) ( not ( = ?auto_6216 ?auto_6207 ) ) ( not ( = ?auto_6216 ?auto_6215 ) ) ( not ( = ?auto_6210 ?auto_6204 ) ) ( not ( = ?auto_6210 ?auto_6205 ) ) ( not ( = ?auto_6210 ?auto_6203 ) ) ( not ( = ?auto_6187 ?auto_6192 ) ) ( not ( = ?auto_6187 ?auto_6209 ) ) ( not ( = ?auto_6188 ?auto_6192 ) ) ( not ( = ?auto_6188 ?auto_6209 ) ) ( not ( = ?auto_6189 ?auto_6192 ) ) ( not ( = ?auto_6189 ?auto_6209 ) ) ( not ( = ?auto_6190 ?auto_6192 ) ) ( not ( = ?auto_6190 ?auto_6209 ) ) ( not ( = ?auto_6192 ?auto_6210 ) ) ( not ( = ?auto_6192 ?auto_6204 ) ) ( not ( = ?auto_6192 ?auto_6205 ) ) ( not ( = ?auto_6192 ?auto_6203 ) ) ( not ( = ?auto_6206 ?auto_6213 ) ) ( not ( = ?auto_6206 ?auto_6214 ) ) ( not ( = ?auto_6206 ?auto_6212 ) ) ( not ( = ?auto_6208 ?auto_6216 ) ) ( not ( = ?auto_6208 ?auto_6207 ) ) ( not ( = ?auto_6208 ?auto_6215 ) ) ( not ( = ?auto_6209 ?auto_6210 ) ) ( not ( = ?auto_6209 ?auto_6204 ) ) ( not ( = ?auto_6209 ?auto_6205 ) ) ( not ( = ?auto_6209 ?auto_6203 ) ) ( not ( = ?auto_6187 ?auto_6194 ) ) ( not ( = ?auto_6187 ?auto_6201 ) ) ( not ( = ?auto_6188 ?auto_6194 ) ) ( not ( = ?auto_6188 ?auto_6201 ) ) ( not ( = ?auto_6189 ?auto_6194 ) ) ( not ( = ?auto_6189 ?auto_6201 ) ) ( not ( = ?auto_6190 ?auto_6194 ) ) ( not ( = ?auto_6190 ?auto_6201 ) ) ( not ( = ?auto_6191 ?auto_6194 ) ) ( not ( = ?auto_6191 ?auto_6201 ) ) ( not ( = ?auto_6194 ?auto_6209 ) ) ( not ( = ?auto_6194 ?auto_6210 ) ) ( not ( = ?auto_6194 ?auto_6204 ) ) ( not ( = ?auto_6194 ?auto_6205 ) ) ( not ( = ?auto_6194 ?auto_6203 ) ) ( not ( = ?auto_6202 ?auto_6206 ) ) ( not ( = ?auto_6202 ?auto_6213 ) ) ( not ( = ?auto_6202 ?auto_6214 ) ) ( not ( = ?auto_6202 ?auto_6212 ) ) ( not ( = ?auto_6211 ?auto_6208 ) ) ( not ( = ?auto_6211 ?auto_6216 ) ) ( not ( = ?auto_6211 ?auto_6207 ) ) ( not ( = ?auto_6211 ?auto_6215 ) ) ( not ( = ?auto_6201 ?auto_6209 ) ) ( not ( = ?auto_6201 ?auto_6210 ) ) ( not ( = ?auto_6201 ?auto_6204 ) ) ( not ( = ?auto_6201 ?auto_6205 ) ) ( not ( = ?auto_6201 ?auto_6203 ) ) ( not ( = ?auto_6187 ?auto_6193 ) ) ( not ( = ?auto_6187 ?auto_6196 ) ) ( not ( = ?auto_6188 ?auto_6193 ) ) ( not ( = ?auto_6188 ?auto_6196 ) ) ( not ( = ?auto_6189 ?auto_6193 ) ) ( not ( = ?auto_6189 ?auto_6196 ) ) ( not ( = ?auto_6190 ?auto_6193 ) ) ( not ( = ?auto_6190 ?auto_6196 ) ) ( not ( = ?auto_6191 ?auto_6193 ) ) ( not ( = ?auto_6191 ?auto_6196 ) ) ( not ( = ?auto_6192 ?auto_6193 ) ) ( not ( = ?auto_6192 ?auto_6196 ) ) ( not ( = ?auto_6193 ?auto_6201 ) ) ( not ( = ?auto_6193 ?auto_6209 ) ) ( not ( = ?auto_6193 ?auto_6210 ) ) ( not ( = ?auto_6193 ?auto_6204 ) ) ( not ( = ?auto_6193 ?auto_6205 ) ) ( not ( = ?auto_6193 ?auto_6203 ) ) ( not ( = ?auto_6199 ?auto_6202 ) ) ( not ( = ?auto_6199 ?auto_6206 ) ) ( not ( = ?auto_6199 ?auto_6213 ) ) ( not ( = ?auto_6199 ?auto_6214 ) ) ( not ( = ?auto_6199 ?auto_6212 ) ) ( not ( = ?auto_6200 ?auto_6211 ) ) ( not ( = ?auto_6200 ?auto_6208 ) ) ( not ( = ?auto_6200 ?auto_6216 ) ) ( not ( = ?auto_6200 ?auto_6207 ) ) ( not ( = ?auto_6200 ?auto_6215 ) ) ( not ( = ?auto_6196 ?auto_6201 ) ) ( not ( = ?auto_6196 ?auto_6209 ) ) ( not ( = ?auto_6196 ?auto_6210 ) ) ( not ( = ?auto_6196 ?auto_6204 ) ) ( not ( = ?auto_6196 ?auto_6205 ) ) ( not ( = ?auto_6196 ?auto_6203 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6187 ?auto_6188 ?auto_6189 ?auto_6190 ?auto_6191 ?auto_6192 ?auto_6194 )
      ( MAKE-1CRATE ?auto_6194 ?auto_6193 )
      ( MAKE-7CRATE-VERIFY ?auto_6187 ?auto_6188 ?auto_6189 ?auto_6190 ?auto_6191 ?auto_6192 ?auto_6194 ?auto_6193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6219 - SURFACE
      ?auto_6220 - SURFACE
    )
    :vars
    (
      ?auto_6221 - HOIST
      ?auto_6222 - PLACE
      ?auto_6224 - PLACE
      ?auto_6225 - HOIST
      ?auto_6226 - SURFACE
      ?auto_6223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6221 ?auto_6222 ) ( SURFACE-AT ?auto_6219 ?auto_6222 ) ( CLEAR ?auto_6219 ) ( IS-CRATE ?auto_6220 ) ( AVAILABLE ?auto_6221 ) ( not ( = ?auto_6224 ?auto_6222 ) ) ( HOIST-AT ?auto_6225 ?auto_6224 ) ( AVAILABLE ?auto_6225 ) ( SURFACE-AT ?auto_6220 ?auto_6224 ) ( ON ?auto_6220 ?auto_6226 ) ( CLEAR ?auto_6220 ) ( TRUCK-AT ?auto_6223 ?auto_6222 ) ( not ( = ?auto_6219 ?auto_6220 ) ) ( not ( = ?auto_6219 ?auto_6226 ) ) ( not ( = ?auto_6220 ?auto_6226 ) ) ( not ( = ?auto_6221 ?auto_6225 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6223 ?auto_6222 ?auto_6224 )
      ( !LIFT ?auto_6225 ?auto_6220 ?auto_6226 ?auto_6224 )
      ( !LOAD ?auto_6225 ?auto_6220 ?auto_6223 ?auto_6224 )
      ( !DRIVE ?auto_6223 ?auto_6224 ?auto_6222 )
      ( !UNLOAD ?auto_6221 ?auto_6220 ?auto_6223 ?auto_6222 )
      ( !DROP ?auto_6221 ?auto_6220 ?auto_6219 ?auto_6222 )
      ( MAKE-1CRATE-VERIFY ?auto_6219 ?auto_6220 ) )
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
      ?auto_6244 - SURFACE
      ?auto_6243 - SURFACE
      ?auto_6242 - SURFACE
    )
    :vars
    (
      ?auto_6249 - HOIST
      ?auto_6245 - PLACE
      ?auto_6247 - PLACE
      ?auto_6248 - HOIST
      ?auto_6246 - SURFACE
      ?auto_6251 - SURFACE
      ?auto_6252 - PLACE
      ?auto_6255 - HOIST
      ?auto_6257 - SURFACE
      ?auto_6264 - PLACE
      ?auto_6262 - HOIST
      ?auto_6267 - SURFACE
      ?auto_6260 - PLACE
      ?auto_6256 - HOIST
      ?auto_6259 - SURFACE
      ?auto_6261 - PLACE
      ?auto_6263 - HOIST
      ?auto_6254 - SURFACE
      ?auto_6265 - SURFACE
      ?auto_6266 - PLACE
      ?auto_6258 - HOIST
      ?auto_6253 - SURFACE
      ?auto_6250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6249 ?auto_6245 ) ( IS-CRATE ?auto_6242 ) ( not ( = ?auto_6247 ?auto_6245 ) ) ( HOIST-AT ?auto_6248 ?auto_6247 ) ( SURFACE-AT ?auto_6242 ?auto_6247 ) ( ON ?auto_6242 ?auto_6246 ) ( CLEAR ?auto_6242 ) ( not ( = ?auto_6243 ?auto_6242 ) ) ( not ( = ?auto_6243 ?auto_6246 ) ) ( not ( = ?auto_6242 ?auto_6246 ) ) ( not ( = ?auto_6249 ?auto_6248 ) ) ( IS-CRATE ?auto_6243 ) ( AVAILABLE ?auto_6248 ) ( SURFACE-AT ?auto_6243 ?auto_6247 ) ( ON ?auto_6243 ?auto_6251 ) ( CLEAR ?auto_6243 ) ( not ( = ?auto_6244 ?auto_6243 ) ) ( not ( = ?auto_6244 ?auto_6251 ) ) ( not ( = ?auto_6243 ?auto_6251 ) ) ( IS-CRATE ?auto_6244 ) ( not ( = ?auto_6252 ?auto_6245 ) ) ( HOIST-AT ?auto_6255 ?auto_6252 ) ( AVAILABLE ?auto_6255 ) ( SURFACE-AT ?auto_6244 ?auto_6252 ) ( ON ?auto_6244 ?auto_6257 ) ( CLEAR ?auto_6244 ) ( not ( = ?auto_6241 ?auto_6244 ) ) ( not ( = ?auto_6241 ?auto_6257 ) ) ( not ( = ?auto_6244 ?auto_6257 ) ) ( not ( = ?auto_6249 ?auto_6255 ) ) ( IS-CRATE ?auto_6241 ) ( not ( = ?auto_6264 ?auto_6245 ) ) ( HOIST-AT ?auto_6262 ?auto_6264 ) ( AVAILABLE ?auto_6262 ) ( SURFACE-AT ?auto_6241 ?auto_6264 ) ( ON ?auto_6241 ?auto_6267 ) ( CLEAR ?auto_6241 ) ( not ( = ?auto_6240 ?auto_6241 ) ) ( not ( = ?auto_6240 ?auto_6267 ) ) ( not ( = ?auto_6241 ?auto_6267 ) ) ( not ( = ?auto_6249 ?auto_6262 ) ) ( IS-CRATE ?auto_6240 ) ( not ( = ?auto_6260 ?auto_6245 ) ) ( HOIST-AT ?auto_6256 ?auto_6260 ) ( AVAILABLE ?auto_6256 ) ( SURFACE-AT ?auto_6240 ?auto_6260 ) ( ON ?auto_6240 ?auto_6259 ) ( CLEAR ?auto_6240 ) ( not ( = ?auto_6239 ?auto_6240 ) ) ( not ( = ?auto_6239 ?auto_6259 ) ) ( not ( = ?auto_6240 ?auto_6259 ) ) ( not ( = ?auto_6249 ?auto_6256 ) ) ( IS-CRATE ?auto_6239 ) ( not ( = ?auto_6261 ?auto_6245 ) ) ( HOIST-AT ?auto_6263 ?auto_6261 ) ( SURFACE-AT ?auto_6239 ?auto_6261 ) ( ON ?auto_6239 ?auto_6254 ) ( CLEAR ?auto_6239 ) ( not ( = ?auto_6238 ?auto_6239 ) ) ( not ( = ?auto_6238 ?auto_6254 ) ) ( not ( = ?auto_6239 ?auto_6254 ) ) ( not ( = ?auto_6249 ?auto_6263 ) ) ( IS-CRATE ?auto_6238 ) ( AVAILABLE ?auto_6263 ) ( SURFACE-AT ?auto_6238 ?auto_6261 ) ( ON ?auto_6238 ?auto_6265 ) ( CLEAR ?auto_6238 ) ( not ( = ?auto_6237 ?auto_6238 ) ) ( not ( = ?auto_6237 ?auto_6265 ) ) ( not ( = ?auto_6238 ?auto_6265 ) ) ( SURFACE-AT ?auto_6236 ?auto_6245 ) ( CLEAR ?auto_6236 ) ( IS-CRATE ?auto_6237 ) ( AVAILABLE ?auto_6249 ) ( not ( = ?auto_6266 ?auto_6245 ) ) ( HOIST-AT ?auto_6258 ?auto_6266 ) ( AVAILABLE ?auto_6258 ) ( SURFACE-AT ?auto_6237 ?auto_6266 ) ( ON ?auto_6237 ?auto_6253 ) ( CLEAR ?auto_6237 ) ( TRUCK-AT ?auto_6250 ?auto_6245 ) ( not ( = ?auto_6236 ?auto_6237 ) ) ( not ( = ?auto_6236 ?auto_6253 ) ) ( not ( = ?auto_6237 ?auto_6253 ) ) ( not ( = ?auto_6249 ?auto_6258 ) ) ( not ( = ?auto_6236 ?auto_6238 ) ) ( not ( = ?auto_6236 ?auto_6265 ) ) ( not ( = ?auto_6238 ?auto_6253 ) ) ( not ( = ?auto_6261 ?auto_6266 ) ) ( not ( = ?auto_6263 ?auto_6258 ) ) ( not ( = ?auto_6265 ?auto_6253 ) ) ( not ( = ?auto_6236 ?auto_6239 ) ) ( not ( = ?auto_6236 ?auto_6254 ) ) ( not ( = ?auto_6237 ?auto_6239 ) ) ( not ( = ?auto_6237 ?auto_6254 ) ) ( not ( = ?auto_6239 ?auto_6265 ) ) ( not ( = ?auto_6239 ?auto_6253 ) ) ( not ( = ?auto_6254 ?auto_6265 ) ) ( not ( = ?auto_6254 ?auto_6253 ) ) ( not ( = ?auto_6236 ?auto_6240 ) ) ( not ( = ?auto_6236 ?auto_6259 ) ) ( not ( = ?auto_6237 ?auto_6240 ) ) ( not ( = ?auto_6237 ?auto_6259 ) ) ( not ( = ?auto_6238 ?auto_6240 ) ) ( not ( = ?auto_6238 ?auto_6259 ) ) ( not ( = ?auto_6240 ?auto_6254 ) ) ( not ( = ?auto_6240 ?auto_6265 ) ) ( not ( = ?auto_6240 ?auto_6253 ) ) ( not ( = ?auto_6260 ?auto_6261 ) ) ( not ( = ?auto_6260 ?auto_6266 ) ) ( not ( = ?auto_6256 ?auto_6263 ) ) ( not ( = ?auto_6256 ?auto_6258 ) ) ( not ( = ?auto_6259 ?auto_6254 ) ) ( not ( = ?auto_6259 ?auto_6265 ) ) ( not ( = ?auto_6259 ?auto_6253 ) ) ( not ( = ?auto_6236 ?auto_6241 ) ) ( not ( = ?auto_6236 ?auto_6267 ) ) ( not ( = ?auto_6237 ?auto_6241 ) ) ( not ( = ?auto_6237 ?auto_6267 ) ) ( not ( = ?auto_6238 ?auto_6241 ) ) ( not ( = ?auto_6238 ?auto_6267 ) ) ( not ( = ?auto_6239 ?auto_6241 ) ) ( not ( = ?auto_6239 ?auto_6267 ) ) ( not ( = ?auto_6241 ?auto_6259 ) ) ( not ( = ?auto_6241 ?auto_6254 ) ) ( not ( = ?auto_6241 ?auto_6265 ) ) ( not ( = ?auto_6241 ?auto_6253 ) ) ( not ( = ?auto_6264 ?auto_6260 ) ) ( not ( = ?auto_6264 ?auto_6261 ) ) ( not ( = ?auto_6264 ?auto_6266 ) ) ( not ( = ?auto_6262 ?auto_6256 ) ) ( not ( = ?auto_6262 ?auto_6263 ) ) ( not ( = ?auto_6262 ?auto_6258 ) ) ( not ( = ?auto_6267 ?auto_6259 ) ) ( not ( = ?auto_6267 ?auto_6254 ) ) ( not ( = ?auto_6267 ?auto_6265 ) ) ( not ( = ?auto_6267 ?auto_6253 ) ) ( not ( = ?auto_6236 ?auto_6244 ) ) ( not ( = ?auto_6236 ?auto_6257 ) ) ( not ( = ?auto_6237 ?auto_6244 ) ) ( not ( = ?auto_6237 ?auto_6257 ) ) ( not ( = ?auto_6238 ?auto_6244 ) ) ( not ( = ?auto_6238 ?auto_6257 ) ) ( not ( = ?auto_6239 ?auto_6244 ) ) ( not ( = ?auto_6239 ?auto_6257 ) ) ( not ( = ?auto_6240 ?auto_6244 ) ) ( not ( = ?auto_6240 ?auto_6257 ) ) ( not ( = ?auto_6244 ?auto_6267 ) ) ( not ( = ?auto_6244 ?auto_6259 ) ) ( not ( = ?auto_6244 ?auto_6254 ) ) ( not ( = ?auto_6244 ?auto_6265 ) ) ( not ( = ?auto_6244 ?auto_6253 ) ) ( not ( = ?auto_6252 ?auto_6264 ) ) ( not ( = ?auto_6252 ?auto_6260 ) ) ( not ( = ?auto_6252 ?auto_6261 ) ) ( not ( = ?auto_6252 ?auto_6266 ) ) ( not ( = ?auto_6255 ?auto_6262 ) ) ( not ( = ?auto_6255 ?auto_6256 ) ) ( not ( = ?auto_6255 ?auto_6263 ) ) ( not ( = ?auto_6255 ?auto_6258 ) ) ( not ( = ?auto_6257 ?auto_6267 ) ) ( not ( = ?auto_6257 ?auto_6259 ) ) ( not ( = ?auto_6257 ?auto_6254 ) ) ( not ( = ?auto_6257 ?auto_6265 ) ) ( not ( = ?auto_6257 ?auto_6253 ) ) ( not ( = ?auto_6236 ?auto_6243 ) ) ( not ( = ?auto_6236 ?auto_6251 ) ) ( not ( = ?auto_6237 ?auto_6243 ) ) ( not ( = ?auto_6237 ?auto_6251 ) ) ( not ( = ?auto_6238 ?auto_6243 ) ) ( not ( = ?auto_6238 ?auto_6251 ) ) ( not ( = ?auto_6239 ?auto_6243 ) ) ( not ( = ?auto_6239 ?auto_6251 ) ) ( not ( = ?auto_6240 ?auto_6243 ) ) ( not ( = ?auto_6240 ?auto_6251 ) ) ( not ( = ?auto_6241 ?auto_6243 ) ) ( not ( = ?auto_6241 ?auto_6251 ) ) ( not ( = ?auto_6243 ?auto_6257 ) ) ( not ( = ?auto_6243 ?auto_6267 ) ) ( not ( = ?auto_6243 ?auto_6259 ) ) ( not ( = ?auto_6243 ?auto_6254 ) ) ( not ( = ?auto_6243 ?auto_6265 ) ) ( not ( = ?auto_6243 ?auto_6253 ) ) ( not ( = ?auto_6247 ?auto_6252 ) ) ( not ( = ?auto_6247 ?auto_6264 ) ) ( not ( = ?auto_6247 ?auto_6260 ) ) ( not ( = ?auto_6247 ?auto_6261 ) ) ( not ( = ?auto_6247 ?auto_6266 ) ) ( not ( = ?auto_6248 ?auto_6255 ) ) ( not ( = ?auto_6248 ?auto_6262 ) ) ( not ( = ?auto_6248 ?auto_6256 ) ) ( not ( = ?auto_6248 ?auto_6263 ) ) ( not ( = ?auto_6248 ?auto_6258 ) ) ( not ( = ?auto_6251 ?auto_6257 ) ) ( not ( = ?auto_6251 ?auto_6267 ) ) ( not ( = ?auto_6251 ?auto_6259 ) ) ( not ( = ?auto_6251 ?auto_6254 ) ) ( not ( = ?auto_6251 ?auto_6265 ) ) ( not ( = ?auto_6251 ?auto_6253 ) ) ( not ( = ?auto_6236 ?auto_6242 ) ) ( not ( = ?auto_6236 ?auto_6246 ) ) ( not ( = ?auto_6237 ?auto_6242 ) ) ( not ( = ?auto_6237 ?auto_6246 ) ) ( not ( = ?auto_6238 ?auto_6242 ) ) ( not ( = ?auto_6238 ?auto_6246 ) ) ( not ( = ?auto_6239 ?auto_6242 ) ) ( not ( = ?auto_6239 ?auto_6246 ) ) ( not ( = ?auto_6240 ?auto_6242 ) ) ( not ( = ?auto_6240 ?auto_6246 ) ) ( not ( = ?auto_6241 ?auto_6242 ) ) ( not ( = ?auto_6241 ?auto_6246 ) ) ( not ( = ?auto_6244 ?auto_6242 ) ) ( not ( = ?auto_6244 ?auto_6246 ) ) ( not ( = ?auto_6242 ?auto_6251 ) ) ( not ( = ?auto_6242 ?auto_6257 ) ) ( not ( = ?auto_6242 ?auto_6267 ) ) ( not ( = ?auto_6242 ?auto_6259 ) ) ( not ( = ?auto_6242 ?auto_6254 ) ) ( not ( = ?auto_6242 ?auto_6265 ) ) ( not ( = ?auto_6242 ?auto_6253 ) ) ( not ( = ?auto_6246 ?auto_6251 ) ) ( not ( = ?auto_6246 ?auto_6257 ) ) ( not ( = ?auto_6246 ?auto_6267 ) ) ( not ( = ?auto_6246 ?auto_6259 ) ) ( not ( = ?auto_6246 ?auto_6254 ) ) ( not ( = ?auto_6246 ?auto_6265 ) ) ( not ( = ?auto_6246 ?auto_6253 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6236 ?auto_6237 ?auto_6238 ?auto_6239 ?auto_6240 ?auto_6241 ?auto_6244 ?auto_6243 )
      ( MAKE-1CRATE ?auto_6243 ?auto_6242 )
      ( MAKE-8CRATE-VERIFY ?auto_6236 ?auto_6237 ?auto_6238 ?auto_6239 ?auto_6240 ?auto_6241 ?auto_6244 ?auto_6243 ?auto_6242 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6270 - SURFACE
      ?auto_6271 - SURFACE
    )
    :vars
    (
      ?auto_6272 - HOIST
      ?auto_6273 - PLACE
      ?auto_6275 - PLACE
      ?auto_6276 - HOIST
      ?auto_6277 - SURFACE
      ?auto_6274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6272 ?auto_6273 ) ( SURFACE-AT ?auto_6270 ?auto_6273 ) ( CLEAR ?auto_6270 ) ( IS-CRATE ?auto_6271 ) ( AVAILABLE ?auto_6272 ) ( not ( = ?auto_6275 ?auto_6273 ) ) ( HOIST-AT ?auto_6276 ?auto_6275 ) ( AVAILABLE ?auto_6276 ) ( SURFACE-AT ?auto_6271 ?auto_6275 ) ( ON ?auto_6271 ?auto_6277 ) ( CLEAR ?auto_6271 ) ( TRUCK-AT ?auto_6274 ?auto_6273 ) ( not ( = ?auto_6270 ?auto_6271 ) ) ( not ( = ?auto_6270 ?auto_6277 ) ) ( not ( = ?auto_6271 ?auto_6277 ) ) ( not ( = ?auto_6272 ?auto_6276 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6274 ?auto_6273 ?auto_6275 )
      ( !LIFT ?auto_6276 ?auto_6271 ?auto_6277 ?auto_6275 )
      ( !LOAD ?auto_6276 ?auto_6271 ?auto_6274 ?auto_6275 )
      ( !DRIVE ?auto_6274 ?auto_6275 ?auto_6273 )
      ( !UNLOAD ?auto_6272 ?auto_6271 ?auto_6274 ?auto_6273 )
      ( !DROP ?auto_6272 ?auto_6271 ?auto_6270 ?auto_6273 )
      ( MAKE-1CRATE-VERIFY ?auto_6270 ?auto_6271 ) )
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
      ?auto_6296 - SURFACE
      ?auto_6295 - SURFACE
      ?auto_6294 - SURFACE
      ?auto_6297 - SURFACE
    )
    :vars
    (
      ?auto_6302 - HOIST
      ?auto_6299 - PLACE
      ?auto_6300 - PLACE
      ?auto_6303 - HOIST
      ?auto_6298 - SURFACE
      ?auto_6322 - PLACE
      ?auto_6313 - HOIST
      ?auto_6318 - SURFACE
      ?auto_6321 - SURFACE
      ?auto_6316 - PLACE
      ?auto_6312 - HOIST
      ?auto_6310 - SURFACE
      ?auto_6308 - PLACE
      ?auto_6306 - HOIST
      ?auto_6319 - SURFACE
      ?auto_6305 - PLACE
      ?auto_6311 - HOIST
      ?auto_6323 - SURFACE
      ?auto_6320 - PLACE
      ?auto_6307 - HOIST
      ?auto_6317 - SURFACE
      ?auto_6315 - SURFACE
      ?auto_6304 - PLACE
      ?auto_6309 - HOIST
      ?auto_6314 - SURFACE
      ?auto_6301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6302 ?auto_6299 ) ( IS-CRATE ?auto_6297 ) ( not ( = ?auto_6300 ?auto_6299 ) ) ( HOIST-AT ?auto_6303 ?auto_6300 ) ( AVAILABLE ?auto_6303 ) ( SURFACE-AT ?auto_6297 ?auto_6300 ) ( ON ?auto_6297 ?auto_6298 ) ( CLEAR ?auto_6297 ) ( not ( = ?auto_6294 ?auto_6297 ) ) ( not ( = ?auto_6294 ?auto_6298 ) ) ( not ( = ?auto_6297 ?auto_6298 ) ) ( not ( = ?auto_6302 ?auto_6303 ) ) ( IS-CRATE ?auto_6294 ) ( not ( = ?auto_6322 ?auto_6299 ) ) ( HOIST-AT ?auto_6313 ?auto_6322 ) ( SURFACE-AT ?auto_6294 ?auto_6322 ) ( ON ?auto_6294 ?auto_6318 ) ( CLEAR ?auto_6294 ) ( not ( = ?auto_6295 ?auto_6294 ) ) ( not ( = ?auto_6295 ?auto_6318 ) ) ( not ( = ?auto_6294 ?auto_6318 ) ) ( not ( = ?auto_6302 ?auto_6313 ) ) ( IS-CRATE ?auto_6295 ) ( AVAILABLE ?auto_6313 ) ( SURFACE-AT ?auto_6295 ?auto_6322 ) ( ON ?auto_6295 ?auto_6321 ) ( CLEAR ?auto_6295 ) ( not ( = ?auto_6296 ?auto_6295 ) ) ( not ( = ?auto_6296 ?auto_6321 ) ) ( not ( = ?auto_6295 ?auto_6321 ) ) ( IS-CRATE ?auto_6296 ) ( not ( = ?auto_6316 ?auto_6299 ) ) ( HOIST-AT ?auto_6312 ?auto_6316 ) ( AVAILABLE ?auto_6312 ) ( SURFACE-AT ?auto_6296 ?auto_6316 ) ( ON ?auto_6296 ?auto_6310 ) ( CLEAR ?auto_6296 ) ( not ( = ?auto_6293 ?auto_6296 ) ) ( not ( = ?auto_6293 ?auto_6310 ) ) ( not ( = ?auto_6296 ?auto_6310 ) ) ( not ( = ?auto_6302 ?auto_6312 ) ) ( IS-CRATE ?auto_6293 ) ( not ( = ?auto_6308 ?auto_6299 ) ) ( HOIST-AT ?auto_6306 ?auto_6308 ) ( AVAILABLE ?auto_6306 ) ( SURFACE-AT ?auto_6293 ?auto_6308 ) ( ON ?auto_6293 ?auto_6319 ) ( CLEAR ?auto_6293 ) ( not ( = ?auto_6292 ?auto_6293 ) ) ( not ( = ?auto_6292 ?auto_6319 ) ) ( not ( = ?auto_6293 ?auto_6319 ) ) ( not ( = ?auto_6302 ?auto_6306 ) ) ( IS-CRATE ?auto_6292 ) ( not ( = ?auto_6305 ?auto_6299 ) ) ( HOIST-AT ?auto_6311 ?auto_6305 ) ( AVAILABLE ?auto_6311 ) ( SURFACE-AT ?auto_6292 ?auto_6305 ) ( ON ?auto_6292 ?auto_6323 ) ( CLEAR ?auto_6292 ) ( not ( = ?auto_6291 ?auto_6292 ) ) ( not ( = ?auto_6291 ?auto_6323 ) ) ( not ( = ?auto_6292 ?auto_6323 ) ) ( not ( = ?auto_6302 ?auto_6311 ) ) ( IS-CRATE ?auto_6291 ) ( not ( = ?auto_6320 ?auto_6299 ) ) ( HOIST-AT ?auto_6307 ?auto_6320 ) ( SURFACE-AT ?auto_6291 ?auto_6320 ) ( ON ?auto_6291 ?auto_6317 ) ( CLEAR ?auto_6291 ) ( not ( = ?auto_6290 ?auto_6291 ) ) ( not ( = ?auto_6290 ?auto_6317 ) ) ( not ( = ?auto_6291 ?auto_6317 ) ) ( not ( = ?auto_6302 ?auto_6307 ) ) ( IS-CRATE ?auto_6290 ) ( AVAILABLE ?auto_6307 ) ( SURFACE-AT ?auto_6290 ?auto_6320 ) ( ON ?auto_6290 ?auto_6315 ) ( CLEAR ?auto_6290 ) ( not ( = ?auto_6289 ?auto_6290 ) ) ( not ( = ?auto_6289 ?auto_6315 ) ) ( not ( = ?auto_6290 ?auto_6315 ) ) ( SURFACE-AT ?auto_6288 ?auto_6299 ) ( CLEAR ?auto_6288 ) ( IS-CRATE ?auto_6289 ) ( AVAILABLE ?auto_6302 ) ( not ( = ?auto_6304 ?auto_6299 ) ) ( HOIST-AT ?auto_6309 ?auto_6304 ) ( AVAILABLE ?auto_6309 ) ( SURFACE-AT ?auto_6289 ?auto_6304 ) ( ON ?auto_6289 ?auto_6314 ) ( CLEAR ?auto_6289 ) ( TRUCK-AT ?auto_6301 ?auto_6299 ) ( not ( = ?auto_6288 ?auto_6289 ) ) ( not ( = ?auto_6288 ?auto_6314 ) ) ( not ( = ?auto_6289 ?auto_6314 ) ) ( not ( = ?auto_6302 ?auto_6309 ) ) ( not ( = ?auto_6288 ?auto_6290 ) ) ( not ( = ?auto_6288 ?auto_6315 ) ) ( not ( = ?auto_6290 ?auto_6314 ) ) ( not ( = ?auto_6320 ?auto_6304 ) ) ( not ( = ?auto_6307 ?auto_6309 ) ) ( not ( = ?auto_6315 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6291 ) ) ( not ( = ?auto_6288 ?auto_6317 ) ) ( not ( = ?auto_6289 ?auto_6291 ) ) ( not ( = ?auto_6289 ?auto_6317 ) ) ( not ( = ?auto_6291 ?auto_6315 ) ) ( not ( = ?auto_6291 ?auto_6314 ) ) ( not ( = ?auto_6317 ?auto_6315 ) ) ( not ( = ?auto_6317 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6292 ) ) ( not ( = ?auto_6288 ?auto_6323 ) ) ( not ( = ?auto_6289 ?auto_6292 ) ) ( not ( = ?auto_6289 ?auto_6323 ) ) ( not ( = ?auto_6290 ?auto_6292 ) ) ( not ( = ?auto_6290 ?auto_6323 ) ) ( not ( = ?auto_6292 ?auto_6317 ) ) ( not ( = ?auto_6292 ?auto_6315 ) ) ( not ( = ?auto_6292 ?auto_6314 ) ) ( not ( = ?auto_6305 ?auto_6320 ) ) ( not ( = ?auto_6305 ?auto_6304 ) ) ( not ( = ?auto_6311 ?auto_6307 ) ) ( not ( = ?auto_6311 ?auto_6309 ) ) ( not ( = ?auto_6323 ?auto_6317 ) ) ( not ( = ?auto_6323 ?auto_6315 ) ) ( not ( = ?auto_6323 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6293 ) ) ( not ( = ?auto_6288 ?auto_6319 ) ) ( not ( = ?auto_6289 ?auto_6293 ) ) ( not ( = ?auto_6289 ?auto_6319 ) ) ( not ( = ?auto_6290 ?auto_6293 ) ) ( not ( = ?auto_6290 ?auto_6319 ) ) ( not ( = ?auto_6291 ?auto_6293 ) ) ( not ( = ?auto_6291 ?auto_6319 ) ) ( not ( = ?auto_6293 ?auto_6323 ) ) ( not ( = ?auto_6293 ?auto_6317 ) ) ( not ( = ?auto_6293 ?auto_6315 ) ) ( not ( = ?auto_6293 ?auto_6314 ) ) ( not ( = ?auto_6308 ?auto_6305 ) ) ( not ( = ?auto_6308 ?auto_6320 ) ) ( not ( = ?auto_6308 ?auto_6304 ) ) ( not ( = ?auto_6306 ?auto_6311 ) ) ( not ( = ?auto_6306 ?auto_6307 ) ) ( not ( = ?auto_6306 ?auto_6309 ) ) ( not ( = ?auto_6319 ?auto_6323 ) ) ( not ( = ?auto_6319 ?auto_6317 ) ) ( not ( = ?auto_6319 ?auto_6315 ) ) ( not ( = ?auto_6319 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6296 ) ) ( not ( = ?auto_6288 ?auto_6310 ) ) ( not ( = ?auto_6289 ?auto_6296 ) ) ( not ( = ?auto_6289 ?auto_6310 ) ) ( not ( = ?auto_6290 ?auto_6296 ) ) ( not ( = ?auto_6290 ?auto_6310 ) ) ( not ( = ?auto_6291 ?auto_6296 ) ) ( not ( = ?auto_6291 ?auto_6310 ) ) ( not ( = ?auto_6292 ?auto_6296 ) ) ( not ( = ?auto_6292 ?auto_6310 ) ) ( not ( = ?auto_6296 ?auto_6319 ) ) ( not ( = ?auto_6296 ?auto_6323 ) ) ( not ( = ?auto_6296 ?auto_6317 ) ) ( not ( = ?auto_6296 ?auto_6315 ) ) ( not ( = ?auto_6296 ?auto_6314 ) ) ( not ( = ?auto_6316 ?auto_6308 ) ) ( not ( = ?auto_6316 ?auto_6305 ) ) ( not ( = ?auto_6316 ?auto_6320 ) ) ( not ( = ?auto_6316 ?auto_6304 ) ) ( not ( = ?auto_6312 ?auto_6306 ) ) ( not ( = ?auto_6312 ?auto_6311 ) ) ( not ( = ?auto_6312 ?auto_6307 ) ) ( not ( = ?auto_6312 ?auto_6309 ) ) ( not ( = ?auto_6310 ?auto_6319 ) ) ( not ( = ?auto_6310 ?auto_6323 ) ) ( not ( = ?auto_6310 ?auto_6317 ) ) ( not ( = ?auto_6310 ?auto_6315 ) ) ( not ( = ?auto_6310 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6295 ) ) ( not ( = ?auto_6288 ?auto_6321 ) ) ( not ( = ?auto_6289 ?auto_6295 ) ) ( not ( = ?auto_6289 ?auto_6321 ) ) ( not ( = ?auto_6290 ?auto_6295 ) ) ( not ( = ?auto_6290 ?auto_6321 ) ) ( not ( = ?auto_6291 ?auto_6295 ) ) ( not ( = ?auto_6291 ?auto_6321 ) ) ( not ( = ?auto_6292 ?auto_6295 ) ) ( not ( = ?auto_6292 ?auto_6321 ) ) ( not ( = ?auto_6293 ?auto_6295 ) ) ( not ( = ?auto_6293 ?auto_6321 ) ) ( not ( = ?auto_6295 ?auto_6310 ) ) ( not ( = ?auto_6295 ?auto_6319 ) ) ( not ( = ?auto_6295 ?auto_6323 ) ) ( not ( = ?auto_6295 ?auto_6317 ) ) ( not ( = ?auto_6295 ?auto_6315 ) ) ( not ( = ?auto_6295 ?auto_6314 ) ) ( not ( = ?auto_6322 ?auto_6316 ) ) ( not ( = ?auto_6322 ?auto_6308 ) ) ( not ( = ?auto_6322 ?auto_6305 ) ) ( not ( = ?auto_6322 ?auto_6320 ) ) ( not ( = ?auto_6322 ?auto_6304 ) ) ( not ( = ?auto_6313 ?auto_6312 ) ) ( not ( = ?auto_6313 ?auto_6306 ) ) ( not ( = ?auto_6313 ?auto_6311 ) ) ( not ( = ?auto_6313 ?auto_6307 ) ) ( not ( = ?auto_6313 ?auto_6309 ) ) ( not ( = ?auto_6321 ?auto_6310 ) ) ( not ( = ?auto_6321 ?auto_6319 ) ) ( not ( = ?auto_6321 ?auto_6323 ) ) ( not ( = ?auto_6321 ?auto_6317 ) ) ( not ( = ?auto_6321 ?auto_6315 ) ) ( not ( = ?auto_6321 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6294 ) ) ( not ( = ?auto_6288 ?auto_6318 ) ) ( not ( = ?auto_6289 ?auto_6294 ) ) ( not ( = ?auto_6289 ?auto_6318 ) ) ( not ( = ?auto_6290 ?auto_6294 ) ) ( not ( = ?auto_6290 ?auto_6318 ) ) ( not ( = ?auto_6291 ?auto_6294 ) ) ( not ( = ?auto_6291 ?auto_6318 ) ) ( not ( = ?auto_6292 ?auto_6294 ) ) ( not ( = ?auto_6292 ?auto_6318 ) ) ( not ( = ?auto_6293 ?auto_6294 ) ) ( not ( = ?auto_6293 ?auto_6318 ) ) ( not ( = ?auto_6296 ?auto_6294 ) ) ( not ( = ?auto_6296 ?auto_6318 ) ) ( not ( = ?auto_6294 ?auto_6321 ) ) ( not ( = ?auto_6294 ?auto_6310 ) ) ( not ( = ?auto_6294 ?auto_6319 ) ) ( not ( = ?auto_6294 ?auto_6323 ) ) ( not ( = ?auto_6294 ?auto_6317 ) ) ( not ( = ?auto_6294 ?auto_6315 ) ) ( not ( = ?auto_6294 ?auto_6314 ) ) ( not ( = ?auto_6318 ?auto_6321 ) ) ( not ( = ?auto_6318 ?auto_6310 ) ) ( not ( = ?auto_6318 ?auto_6319 ) ) ( not ( = ?auto_6318 ?auto_6323 ) ) ( not ( = ?auto_6318 ?auto_6317 ) ) ( not ( = ?auto_6318 ?auto_6315 ) ) ( not ( = ?auto_6318 ?auto_6314 ) ) ( not ( = ?auto_6288 ?auto_6297 ) ) ( not ( = ?auto_6288 ?auto_6298 ) ) ( not ( = ?auto_6289 ?auto_6297 ) ) ( not ( = ?auto_6289 ?auto_6298 ) ) ( not ( = ?auto_6290 ?auto_6297 ) ) ( not ( = ?auto_6290 ?auto_6298 ) ) ( not ( = ?auto_6291 ?auto_6297 ) ) ( not ( = ?auto_6291 ?auto_6298 ) ) ( not ( = ?auto_6292 ?auto_6297 ) ) ( not ( = ?auto_6292 ?auto_6298 ) ) ( not ( = ?auto_6293 ?auto_6297 ) ) ( not ( = ?auto_6293 ?auto_6298 ) ) ( not ( = ?auto_6296 ?auto_6297 ) ) ( not ( = ?auto_6296 ?auto_6298 ) ) ( not ( = ?auto_6295 ?auto_6297 ) ) ( not ( = ?auto_6295 ?auto_6298 ) ) ( not ( = ?auto_6297 ?auto_6318 ) ) ( not ( = ?auto_6297 ?auto_6321 ) ) ( not ( = ?auto_6297 ?auto_6310 ) ) ( not ( = ?auto_6297 ?auto_6319 ) ) ( not ( = ?auto_6297 ?auto_6323 ) ) ( not ( = ?auto_6297 ?auto_6317 ) ) ( not ( = ?auto_6297 ?auto_6315 ) ) ( not ( = ?auto_6297 ?auto_6314 ) ) ( not ( = ?auto_6300 ?auto_6322 ) ) ( not ( = ?auto_6300 ?auto_6316 ) ) ( not ( = ?auto_6300 ?auto_6308 ) ) ( not ( = ?auto_6300 ?auto_6305 ) ) ( not ( = ?auto_6300 ?auto_6320 ) ) ( not ( = ?auto_6300 ?auto_6304 ) ) ( not ( = ?auto_6303 ?auto_6313 ) ) ( not ( = ?auto_6303 ?auto_6312 ) ) ( not ( = ?auto_6303 ?auto_6306 ) ) ( not ( = ?auto_6303 ?auto_6311 ) ) ( not ( = ?auto_6303 ?auto_6307 ) ) ( not ( = ?auto_6303 ?auto_6309 ) ) ( not ( = ?auto_6298 ?auto_6318 ) ) ( not ( = ?auto_6298 ?auto_6321 ) ) ( not ( = ?auto_6298 ?auto_6310 ) ) ( not ( = ?auto_6298 ?auto_6319 ) ) ( not ( = ?auto_6298 ?auto_6323 ) ) ( not ( = ?auto_6298 ?auto_6317 ) ) ( not ( = ?auto_6298 ?auto_6315 ) ) ( not ( = ?auto_6298 ?auto_6314 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6288 ?auto_6289 ?auto_6290 ?auto_6291 ?auto_6292 ?auto_6293 ?auto_6296 ?auto_6295 ?auto_6294 )
      ( MAKE-1CRATE ?auto_6294 ?auto_6297 )
      ( MAKE-9CRATE-VERIFY ?auto_6288 ?auto_6289 ?auto_6290 ?auto_6291 ?auto_6292 ?auto_6293 ?auto_6296 ?auto_6295 ?auto_6294 ?auto_6297 ) )
  )

)

