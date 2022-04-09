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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7035 - SURFACE
      ?auto_7036 - SURFACE
    )
    :vars
    (
      ?auto_7037 - HOIST
      ?auto_7038 - PLACE
      ?auto_7040 - PLACE
      ?auto_7041 - HOIST
      ?auto_7042 - SURFACE
      ?auto_7039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7037 ?auto_7038 ) ( SURFACE-AT ?auto_7035 ?auto_7038 ) ( CLEAR ?auto_7035 ) ( IS-CRATE ?auto_7036 ) ( AVAILABLE ?auto_7037 ) ( not ( = ?auto_7040 ?auto_7038 ) ) ( HOIST-AT ?auto_7041 ?auto_7040 ) ( AVAILABLE ?auto_7041 ) ( SURFACE-AT ?auto_7036 ?auto_7040 ) ( ON ?auto_7036 ?auto_7042 ) ( CLEAR ?auto_7036 ) ( TRUCK-AT ?auto_7039 ?auto_7038 ) ( not ( = ?auto_7035 ?auto_7036 ) ) ( not ( = ?auto_7035 ?auto_7042 ) ) ( not ( = ?auto_7036 ?auto_7042 ) ) ( not ( = ?auto_7037 ?auto_7041 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7039 ?auto_7038 ?auto_7040 )
      ( !LIFT ?auto_7041 ?auto_7036 ?auto_7042 ?auto_7040 )
      ( !LOAD ?auto_7041 ?auto_7036 ?auto_7039 ?auto_7040 )
      ( !DRIVE ?auto_7039 ?auto_7040 ?auto_7038 )
      ( !UNLOAD ?auto_7037 ?auto_7036 ?auto_7039 ?auto_7038 )
      ( !DROP ?auto_7037 ?auto_7036 ?auto_7035 ?auto_7038 )
      ( MAKE-1CRATE-VERIFY ?auto_7035 ?auto_7036 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7045 - SURFACE
      ?auto_7046 - SURFACE
    )
    :vars
    (
      ?auto_7047 - HOIST
      ?auto_7048 - PLACE
      ?auto_7050 - PLACE
      ?auto_7051 - HOIST
      ?auto_7052 - SURFACE
      ?auto_7049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7047 ?auto_7048 ) ( SURFACE-AT ?auto_7045 ?auto_7048 ) ( CLEAR ?auto_7045 ) ( IS-CRATE ?auto_7046 ) ( AVAILABLE ?auto_7047 ) ( not ( = ?auto_7050 ?auto_7048 ) ) ( HOIST-AT ?auto_7051 ?auto_7050 ) ( AVAILABLE ?auto_7051 ) ( SURFACE-AT ?auto_7046 ?auto_7050 ) ( ON ?auto_7046 ?auto_7052 ) ( CLEAR ?auto_7046 ) ( TRUCK-AT ?auto_7049 ?auto_7048 ) ( not ( = ?auto_7045 ?auto_7046 ) ) ( not ( = ?auto_7045 ?auto_7052 ) ) ( not ( = ?auto_7046 ?auto_7052 ) ) ( not ( = ?auto_7047 ?auto_7051 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7049 ?auto_7048 ?auto_7050 )
      ( !LIFT ?auto_7051 ?auto_7046 ?auto_7052 ?auto_7050 )
      ( !LOAD ?auto_7051 ?auto_7046 ?auto_7049 ?auto_7050 )
      ( !DRIVE ?auto_7049 ?auto_7050 ?auto_7048 )
      ( !UNLOAD ?auto_7047 ?auto_7046 ?auto_7049 ?auto_7048 )
      ( !DROP ?auto_7047 ?auto_7046 ?auto_7045 ?auto_7048 )
      ( MAKE-1CRATE-VERIFY ?auto_7045 ?auto_7046 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7056 - SURFACE
      ?auto_7057 - SURFACE
      ?auto_7058 - SURFACE
    )
    :vars
    (
      ?auto_7061 - HOIST
      ?auto_7063 - PLACE
      ?auto_7064 - PLACE
      ?auto_7059 - HOIST
      ?auto_7062 - SURFACE
      ?auto_7067 - PLACE
      ?auto_7066 - HOIST
      ?auto_7065 - SURFACE
      ?auto_7060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7061 ?auto_7063 ) ( IS-CRATE ?auto_7058 ) ( not ( = ?auto_7064 ?auto_7063 ) ) ( HOIST-AT ?auto_7059 ?auto_7064 ) ( AVAILABLE ?auto_7059 ) ( SURFACE-AT ?auto_7058 ?auto_7064 ) ( ON ?auto_7058 ?auto_7062 ) ( CLEAR ?auto_7058 ) ( not ( = ?auto_7057 ?auto_7058 ) ) ( not ( = ?auto_7057 ?auto_7062 ) ) ( not ( = ?auto_7058 ?auto_7062 ) ) ( not ( = ?auto_7061 ?auto_7059 ) ) ( SURFACE-AT ?auto_7056 ?auto_7063 ) ( CLEAR ?auto_7056 ) ( IS-CRATE ?auto_7057 ) ( AVAILABLE ?auto_7061 ) ( not ( = ?auto_7067 ?auto_7063 ) ) ( HOIST-AT ?auto_7066 ?auto_7067 ) ( AVAILABLE ?auto_7066 ) ( SURFACE-AT ?auto_7057 ?auto_7067 ) ( ON ?auto_7057 ?auto_7065 ) ( CLEAR ?auto_7057 ) ( TRUCK-AT ?auto_7060 ?auto_7063 ) ( not ( = ?auto_7056 ?auto_7057 ) ) ( not ( = ?auto_7056 ?auto_7065 ) ) ( not ( = ?auto_7057 ?auto_7065 ) ) ( not ( = ?auto_7061 ?auto_7066 ) ) ( not ( = ?auto_7056 ?auto_7058 ) ) ( not ( = ?auto_7056 ?auto_7062 ) ) ( not ( = ?auto_7058 ?auto_7065 ) ) ( not ( = ?auto_7064 ?auto_7067 ) ) ( not ( = ?auto_7059 ?auto_7066 ) ) ( not ( = ?auto_7062 ?auto_7065 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7056 ?auto_7057 )
      ( MAKE-1CRATE ?auto_7057 ?auto_7058 )
      ( MAKE-2CRATE-VERIFY ?auto_7056 ?auto_7057 ?auto_7058 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7070 - SURFACE
      ?auto_7071 - SURFACE
    )
    :vars
    (
      ?auto_7072 - HOIST
      ?auto_7073 - PLACE
      ?auto_7075 - PLACE
      ?auto_7076 - HOIST
      ?auto_7077 - SURFACE
      ?auto_7074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7072 ?auto_7073 ) ( SURFACE-AT ?auto_7070 ?auto_7073 ) ( CLEAR ?auto_7070 ) ( IS-CRATE ?auto_7071 ) ( AVAILABLE ?auto_7072 ) ( not ( = ?auto_7075 ?auto_7073 ) ) ( HOIST-AT ?auto_7076 ?auto_7075 ) ( AVAILABLE ?auto_7076 ) ( SURFACE-AT ?auto_7071 ?auto_7075 ) ( ON ?auto_7071 ?auto_7077 ) ( CLEAR ?auto_7071 ) ( TRUCK-AT ?auto_7074 ?auto_7073 ) ( not ( = ?auto_7070 ?auto_7071 ) ) ( not ( = ?auto_7070 ?auto_7077 ) ) ( not ( = ?auto_7071 ?auto_7077 ) ) ( not ( = ?auto_7072 ?auto_7076 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7074 ?auto_7073 ?auto_7075 )
      ( !LIFT ?auto_7076 ?auto_7071 ?auto_7077 ?auto_7075 )
      ( !LOAD ?auto_7076 ?auto_7071 ?auto_7074 ?auto_7075 )
      ( !DRIVE ?auto_7074 ?auto_7075 ?auto_7073 )
      ( !UNLOAD ?auto_7072 ?auto_7071 ?auto_7074 ?auto_7073 )
      ( !DROP ?auto_7072 ?auto_7071 ?auto_7070 ?auto_7073 )
      ( MAKE-1CRATE-VERIFY ?auto_7070 ?auto_7071 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7082 - SURFACE
      ?auto_7083 - SURFACE
      ?auto_7084 - SURFACE
      ?auto_7085 - SURFACE
    )
    :vars
    (
      ?auto_7089 - HOIST
      ?auto_7087 - PLACE
      ?auto_7091 - PLACE
      ?auto_7088 - HOIST
      ?auto_7086 - SURFACE
      ?auto_7092 - PLACE
      ?auto_7096 - HOIST
      ?auto_7093 - SURFACE
      ?auto_7095 - PLACE
      ?auto_7094 - HOIST
      ?auto_7097 - SURFACE
      ?auto_7090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7089 ?auto_7087 ) ( IS-CRATE ?auto_7085 ) ( not ( = ?auto_7091 ?auto_7087 ) ) ( HOIST-AT ?auto_7088 ?auto_7091 ) ( AVAILABLE ?auto_7088 ) ( SURFACE-AT ?auto_7085 ?auto_7091 ) ( ON ?auto_7085 ?auto_7086 ) ( CLEAR ?auto_7085 ) ( not ( = ?auto_7084 ?auto_7085 ) ) ( not ( = ?auto_7084 ?auto_7086 ) ) ( not ( = ?auto_7085 ?auto_7086 ) ) ( not ( = ?auto_7089 ?auto_7088 ) ) ( IS-CRATE ?auto_7084 ) ( not ( = ?auto_7092 ?auto_7087 ) ) ( HOIST-AT ?auto_7096 ?auto_7092 ) ( AVAILABLE ?auto_7096 ) ( SURFACE-AT ?auto_7084 ?auto_7092 ) ( ON ?auto_7084 ?auto_7093 ) ( CLEAR ?auto_7084 ) ( not ( = ?auto_7083 ?auto_7084 ) ) ( not ( = ?auto_7083 ?auto_7093 ) ) ( not ( = ?auto_7084 ?auto_7093 ) ) ( not ( = ?auto_7089 ?auto_7096 ) ) ( SURFACE-AT ?auto_7082 ?auto_7087 ) ( CLEAR ?auto_7082 ) ( IS-CRATE ?auto_7083 ) ( AVAILABLE ?auto_7089 ) ( not ( = ?auto_7095 ?auto_7087 ) ) ( HOIST-AT ?auto_7094 ?auto_7095 ) ( AVAILABLE ?auto_7094 ) ( SURFACE-AT ?auto_7083 ?auto_7095 ) ( ON ?auto_7083 ?auto_7097 ) ( CLEAR ?auto_7083 ) ( TRUCK-AT ?auto_7090 ?auto_7087 ) ( not ( = ?auto_7082 ?auto_7083 ) ) ( not ( = ?auto_7082 ?auto_7097 ) ) ( not ( = ?auto_7083 ?auto_7097 ) ) ( not ( = ?auto_7089 ?auto_7094 ) ) ( not ( = ?auto_7082 ?auto_7084 ) ) ( not ( = ?auto_7082 ?auto_7093 ) ) ( not ( = ?auto_7084 ?auto_7097 ) ) ( not ( = ?auto_7092 ?auto_7095 ) ) ( not ( = ?auto_7096 ?auto_7094 ) ) ( not ( = ?auto_7093 ?auto_7097 ) ) ( not ( = ?auto_7082 ?auto_7085 ) ) ( not ( = ?auto_7082 ?auto_7086 ) ) ( not ( = ?auto_7083 ?auto_7085 ) ) ( not ( = ?auto_7083 ?auto_7086 ) ) ( not ( = ?auto_7085 ?auto_7093 ) ) ( not ( = ?auto_7085 ?auto_7097 ) ) ( not ( = ?auto_7091 ?auto_7092 ) ) ( not ( = ?auto_7091 ?auto_7095 ) ) ( not ( = ?auto_7088 ?auto_7096 ) ) ( not ( = ?auto_7088 ?auto_7094 ) ) ( not ( = ?auto_7086 ?auto_7093 ) ) ( not ( = ?auto_7086 ?auto_7097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7082 ?auto_7083 ?auto_7084 )
      ( MAKE-1CRATE ?auto_7084 ?auto_7085 )
      ( MAKE-3CRATE-VERIFY ?auto_7082 ?auto_7083 ?auto_7084 ?auto_7085 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7100 - SURFACE
      ?auto_7101 - SURFACE
    )
    :vars
    (
      ?auto_7102 - HOIST
      ?auto_7103 - PLACE
      ?auto_7105 - PLACE
      ?auto_7106 - HOIST
      ?auto_7107 - SURFACE
      ?auto_7104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7102 ?auto_7103 ) ( SURFACE-AT ?auto_7100 ?auto_7103 ) ( CLEAR ?auto_7100 ) ( IS-CRATE ?auto_7101 ) ( AVAILABLE ?auto_7102 ) ( not ( = ?auto_7105 ?auto_7103 ) ) ( HOIST-AT ?auto_7106 ?auto_7105 ) ( AVAILABLE ?auto_7106 ) ( SURFACE-AT ?auto_7101 ?auto_7105 ) ( ON ?auto_7101 ?auto_7107 ) ( CLEAR ?auto_7101 ) ( TRUCK-AT ?auto_7104 ?auto_7103 ) ( not ( = ?auto_7100 ?auto_7101 ) ) ( not ( = ?auto_7100 ?auto_7107 ) ) ( not ( = ?auto_7101 ?auto_7107 ) ) ( not ( = ?auto_7102 ?auto_7106 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7104 ?auto_7103 ?auto_7105 )
      ( !LIFT ?auto_7106 ?auto_7101 ?auto_7107 ?auto_7105 )
      ( !LOAD ?auto_7106 ?auto_7101 ?auto_7104 ?auto_7105 )
      ( !DRIVE ?auto_7104 ?auto_7105 ?auto_7103 )
      ( !UNLOAD ?auto_7102 ?auto_7101 ?auto_7104 ?auto_7103 )
      ( !DROP ?auto_7102 ?auto_7101 ?auto_7100 ?auto_7103 )
      ( MAKE-1CRATE-VERIFY ?auto_7100 ?auto_7101 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7113 - SURFACE
      ?auto_7114 - SURFACE
      ?auto_7115 - SURFACE
      ?auto_7116 - SURFACE
      ?auto_7117 - SURFACE
    )
    :vars
    (
      ?auto_7119 - HOIST
      ?auto_7118 - PLACE
      ?auto_7120 - PLACE
      ?auto_7122 - HOIST
      ?auto_7121 - SURFACE
      ?auto_7132 - PLACE
      ?auto_7126 - HOIST
      ?auto_7127 - SURFACE
      ?auto_7129 - PLACE
      ?auto_7131 - HOIST
      ?auto_7128 - SURFACE
      ?auto_7124 - PLACE
      ?auto_7130 - HOIST
      ?auto_7125 - SURFACE
      ?auto_7123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7119 ?auto_7118 ) ( IS-CRATE ?auto_7117 ) ( not ( = ?auto_7120 ?auto_7118 ) ) ( HOIST-AT ?auto_7122 ?auto_7120 ) ( AVAILABLE ?auto_7122 ) ( SURFACE-AT ?auto_7117 ?auto_7120 ) ( ON ?auto_7117 ?auto_7121 ) ( CLEAR ?auto_7117 ) ( not ( = ?auto_7116 ?auto_7117 ) ) ( not ( = ?auto_7116 ?auto_7121 ) ) ( not ( = ?auto_7117 ?auto_7121 ) ) ( not ( = ?auto_7119 ?auto_7122 ) ) ( IS-CRATE ?auto_7116 ) ( not ( = ?auto_7132 ?auto_7118 ) ) ( HOIST-AT ?auto_7126 ?auto_7132 ) ( AVAILABLE ?auto_7126 ) ( SURFACE-AT ?auto_7116 ?auto_7132 ) ( ON ?auto_7116 ?auto_7127 ) ( CLEAR ?auto_7116 ) ( not ( = ?auto_7115 ?auto_7116 ) ) ( not ( = ?auto_7115 ?auto_7127 ) ) ( not ( = ?auto_7116 ?auto_7127 ) ) ( not ( = ?auto_7119 ?auto_7126 ) ) ( IS-CRATE ?auto_7115 ) ( not ( = ?auto_7129 ?auto_7118 ) ) ( HOIST-AT ?auto_7131 ?auto_7129 ) ( AVAILABLE ?auto_7131 ) ( SURFACE-AT ?auto_7115 ?auto_7129 ) ( ON ?auto_7115 ?auto_7128 ) ( CLEAR ?auto_7115 ) ( not ( = ?auto_7114 ?auto_7115 ) ) ( not ( = ?auto_7114 ?auto_7128 ) ) ( not ( = ?auto_7115 ?auto_7128 ) ) ( not ( = ?auto_7119 ?auto_7131 ) ) ( SURFACE-AT ?auto_7113 ?auto_7118 ) ( CLEAR ?auto_7113 ) ( IS-CRATE ?auto_7114 ) ( AVAILABLE ?auto_7119 ) ( not ( = ?auto_7124 ?auto_7118 ) ) ( HOIST-AT ?auto_7130 ?auto_7124 ) ( AVAILABLE ?auto_7130 ) ( SURFACE-AT ?auto_7114 ?auto_7124 ) ( ON ?auto_7114 ?auto_7125 ) ( CLEAR ?auto_7114 ) ( TRUCK-AT ?auto_7123 ?auto_7118 ) ( not ( = ?auto_7113 ?auto_7114 ) ) ( not ( = ?auto_7113 ?auto_7125 ) ) ( not ( = ?auto_7114 ?auto_7125 ) ) ( not ( = ?auto_7119 ?auto_7130 ) ) ( not ( = ?auto_7113 ?auto_7115 ) ) ( not ( = ?auto_7113 ?auto_7128 ) ) ( not ( = ?auto_7115 ?auto_7125 ) ) ( not ( = ?auto_7129 ?auto_7124 ) ) ( not ( = ?auto_7131 ?auto_7130 ) ) ( not ( = ?auto_7128 ?auto_7125 ) ) ( not ( = ?auto_7113 ?auto_7116 ) ) ( not ( = ?auto_7113 ?auto_7127 ) ) ( not ( = ?auto_7114 ?auto_7116 ) ) ( not ( = ?auto_7114 ?auto_7127 ) ) ( not ( = ?auto_7116 ?auto_7128 ) ) ( not ( = ?auto_7116 ?auto_7125 ) ) ( not ( = ?auto_7132 ?auto_7129 ) ) ( not ( = ?auto_7132 ?auto_7124 ) ) ( not ( = ?auto_7126 ?auto_7131 ) ) ( not ( = ?auto_7126 ?auto_7130 ) ) ( not ( = ?auto_7127 ?auto_7128 ) ) ( not ( = ?auto_7127 ?auto_7125 ) ) ( not ( = ?auto_7113 ?auto_7117 ) ) ( not ( = ?auto_7113 ?auto_7121 ) ) ( not ( = ?auto_7114 ?auto_7117 ) ) ( not ( = ?auto_7114 ?auto_7121 ) ) ( not ( = ?auto_7115 ?auto_7117 ) ) ( not ( = ?auto_7115 ?auto_7121 ) ) ( not ( = ?auto_7117 ?auto_7127 ) ) ( not ( = ?auto_7117 ?auto_7128 ) ) ( not ( = ?auto_7117 ?auto_7125 ) ) ( not ( = ?auto_7120 ?auto_7132 ) ) ( not ( = ?auto_7120 ?auto_7129 ) ) ( not ( = ?auto_7120 ?auto_7124 ) ) ( not ( = ?auto_7122 ?auto_7126 ) ) ( not ( = ?auto_7122 ?auto_7131 ) ) ( not ( = ?auto_7122 ?auto_7130 ) ) ( not ( = ?auto_7121 ?auto_7127 ) ) ( not ( = ?auto_7121 ?auto_7128 ) ) ( not ( = ?auto_7121 ?auto_7125 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7113 ?auto_7114 ?auto_7115 ?auto_7116 )
      ( MAKE-1CRATE ?auto_7116 ?auto_7117 )
      ( MAKE-4CRATE-VERIFY ?auto_7113 ?auto_7114 ?auto_7115 ?auto_7116 ?auto_7117 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7135 - SURFACE
      ?auto_7136 - SURFACE
    )
    :vars
    (
      ?auto_7137 - HOIST
      ?auto_7138 - PLACE
      ?auto_7140 - PLACE
      ?auto_7141 - HOIST
      ?auto_7142 - SURFACE
      ?auto_7139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7137 ?auto_7138 ) ( SURFACE-AT ?auto_7135 ?auto_7138 ) ( CLEAR ?auto_7135 ) ( IS-CRATE ?auto_7136 ) ( AVAILABLE ?auto_7137 ) ( not ( = ?auto_7140 ?auto_7138 ) ) ( HOIST-AT ?auto_7141 ?auto_7140 ) ( AVAILABLE ?auto_7141 ) ( SURFACE-AT ?auto_7136 ?auto_7140 ) ( ON ?auto_7136 ?auto_7142 ) ( CLEAR ?auto_7136 ) ( TRUCK-AT ?auto_7139 ?auto_7138 ) ( not ( = ?auto_7135 ?auto_7136 ) ) ( not ( = ?auto_7135 ?auto_7142 ) ) ( not ( = ?auto_7136 ?auto_7142 ) ) ( not ( = ?auto_7137 ?auto_7141 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7139 ?auto_7138 ?auto_7140 )
      ( !LIFT ?auto_7141 ?auto_7136 ?auto_7142 ?auto_7140 )
      ( !LOAD ?auto_7141 ?auto_7136 ?auto_7139 ?auto_7140 )
      ( !DRIVE ?auto_7139 ?auto_7140 ?auto_7138 )
      ( !UNLOAD ?auto_7137 ?auto_7136 ?auto_7139 ?auto_7138 )
      ( !DROP ?auto_7137 ?auto_7136 ?auto_7135 ?auto_7138 )
      ( MAKE-1CRATE-VERIFY ?auto_7135 ?auto_7136 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_7149 - SURFACE
      ?auto_7150 - SURFACE
      ?auto_7151 - SURFACE
      ?auto_7152 - SURFACE
      ?auto_7153 - SURFACE
      ?auto_7154 - SURFACE
    )
    :vars
    (
      ?auto_7156 - HOIST
      ?auto_7158 - PLACE
      ?auto_7155 - PLACE
      ?auto_7160 - HOIST
      ?auto_7159 - SURFACE
      ?auto_7165 - PLACE
      ?auto_7170 - HOIST
      ?auto_7168 - SURFACE
      ?auto_7166 - PLACE
      ?auto_7169 - HOIST
      ?auto_7167 - SURFACE
      ?auto_7162 - PLACE
      ?auto_7163 - HOIST
      ?auto_7161 - SURFACE
      ?auto_7164 - SURFACE
      ?auto_7157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7156 ?auto_7158 ) ( IS-CRATE ?auto_7154 ) ( not ( = ?auto_7155 ?auto_7158 ) ) ( HOIST-AT ?auto_7160 ?auto_7155 ) ( SURFACE-AT ?auto_7154 ?auto_7155 ) ( ON ?auto_7154 ?auto_7159 ) ( CLEAR ?auto_7154 ) ( not ( = ?auto_7153 ?auto_7154 ) ) ( not ( = ?auto_7153 ?auto_7159 ) ) ( not ( = ?auto_7154 ?auto_7159 ) ) ( not ( = ?auto_7156 ?auto_7160 ) ) ( IS-CRATE ?auto_7153 ) ( not ( = ?auto_7165 ?auto_7158 ) ) ( HOIST-AT ?auto_7170 ?auto_7165 ) ( AVAILABLE ?auto_7170 ) ( SURFACE-AT ?auto_7153 ?auto_7165 ) ( ON ?auto_7153 ?auto_7168 ) ( CLEAR ?auto_7153 ) ( not ( = ?auto_7152 ?auto_7153 ) ) ( not ( = ?auto_7152 ?auto_7168 ) ) ( not ( = ?auto_7153 ?auto_7168 ) ) ( not ( = ?auto_7156 ?auto_7170 ) ) ( IS-CRATE ?auto_7152 ) ( not ( = ?auto_7166 ?auto_7158 ) ) ( HOIST-AT ?auto_7169 ?auto_7166 ) ( AVAILABLE ?auto_7169 ) ( SURFACE-AT ?auto_7152 ?auto_7166 ) ( ON ?auto_7152 ?auto_7167 ) ( CLEAR ?auto_7152 ) ( not ( = ?auto_7151 ?auto_7152 ) ) ( not ( = ?auto_7151 ?auto_7167 ) ) ( not ( = ?auto_7152 ?auto_7167 ) ) ( not ( = ?auto_7156 ?auto_7169 ) ) ( IS-CRATE ?auto_7151 ) ( not ( = ?auto_7162 ?auto_7158 ) ) ( HOIST-AT ?auto_7163 ?auto_7162 ) ( AVAILABLE ?auto_7163 ) ( SURFACE-AT ?auto_7151 ?auto_7162 ) ( ON ?auto_7151 ?auto_7161 ) ( CLEAR ?auto_7151 ) ( not ( = ?auto_7150 ?auto_7151 ) ) ( not ( = ?auto_7150 ?auto_7161 ) ) ( not ( = ?auto_7151 ?auto_7161 ) ) ( not ( = ?auto_7156 ?auto_7163 ) ) ( SURFACE-AT ?auto_7149 ?auto_7158 ) ( CLEAR ?auto_7149 ) ( IS-CRATE ?auto_7150 ) ( AVAILABLE ?auto_7156 ) ( AVAILABLE ?auto_7160 ) ( SURFACE-AT ?auto_7150 ?auto_7155 ) ( ON ?auto_7150 ?auto_7164 ) ( CLEAR ?auto_7150 ) ( TRUCK-AT ?auto_7157 ?auto_7158 ) ( not ( = ?auto_7149 ?auto_7150 ) ) ( not ( = ?auto_7149 ?auto_7164 ) ) ( not ( = ?auto_7150 ?auto_7164 ) ) ( not ( = ?auto_7149 ?auto_7151 ) ) ( not ( = ?auto_7149 ?auto_7161 ) ) ( not ( = ?auto_7151 ?auto_7164 ) ) ( not ( = ?auto_7162 ?auto_7155 ) ) ( not ( = ?auto_7163 ?auto_7160 ) ) ( not ( = ?auto_7161 ?auto_7164 ) ) ( not ( = ?auto_7149 ?auto_7152 ) ) ( not ( = ?auto_7149 ?auto_7167 ) ) ( not ( = ?auto_7150 ?auto_7152 ) ) ( not ( = ?auto_7150 ?auto_7167 ) ) ( not ( = ?auto_7152 ?auto_7161 ) ) ( not ( = ?auto_7152 ?auto_7164 ) ) ( not ( = ?auto_7166 ?auto_7162 ) ) ( not ( = ?auto_7166 ?auto_7155 ) ) ( not ( = ?auto_7169 ?auto_7163 ) ) ( not ( = ?auto_7169 ?auto_7160 ) ) ( not ( = ?auto_7167 ?auto_7161 ) ) ( not ( = ?auto_7167 ?auto_7164 ) ) ( not ( = ?auto_7149 ?auto_7153 ) ) ( not ( = ?auto_7149 ?auto_7168 ) ) ( not ( = ?auto_7150 ?auto_7153 ) ) ( not ( = ?auto_7150 ?auto_7168 ) ) ( not ( = ?auto_7151 ?auto_7153 ) ) ( not ( = ?auto_7151 ?auto_7168 ) ) ( not ( = ?auto_7153 ?auto_7167 ) ) ( not ( = ?auto_7153 ?auto_7161 ) ) ( not ( = ?auto_7153 ?auto_7164 ) ) ( not ( = ?auto_7165 ?auto_7166 ) ) ( not ( = ?auto_7165 ?auto_7162 ) ) ( not ( = ?auto_7165 ?auto_7155 ) ) ( not ( = ?auto_7170 ?auto_7169 ) ) ( not ( = ?auto_7170 ?auto_7163 ) ) ( not ( = ?auto_7170 ?auto_7160 ) ) ( not ( = ?auto_7168 ?auto_7167 ) ) ( not ( = ?auto_7168 ?auto_7161 ) ) ( not ( = ?auto_7168 ?auto_7164 ) ) ( not ( = ?auto_7149 ?auto_7154 ) ) ( not ( = ?auto_7149 ?auto_7159 ) ) ( not ( = ?auto_7150 ?auto_7154 ) ) ( not ( = ?auto_7150 ?auto_7159 ) ) ( not ( = ?auto_7151 ?auto_7154 ) ) ( not ( = ?auto_7151 ?auto_7159 ) ) ( not ( = ?auto_7152 ?auto_7154 ) ) ( not ( = ?auto_7152 ?auto_7159 ) ) ( not ( = ?auto_7154 ?auto_7168 ) ) ( not ( = ?auto_7154 ?auto_7167 ) ) ( not ( = ?auto_7154 ?auto_7161 ) ) ( not ( = ?auto_7154 ?auto_7164 ) ) ( not ( = ?auto_7159 ?auto_7168 ) ) ( not ( = ?auto_7159 ?auto_7167 ) ) ( not ( = ?auto_7159 ?auto_7161 ) ) ( not ( = ?auto_7159 ?auto_7164 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7149 ?auto_7150 ?auto_7151 ?auto_7152 ?auto_7153 )
      ( MAKE-1CRATE ?auto_7153 ?auto_7154 )
      ( MAKE-5CRATE-VERIFY ?auto_7149 ?auto_7150 ?auto_7151 ?auto_7152 ?auto_7153 ?auto_7154 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7173 - SURFACE
      ?auto_7174 - SURFACE
    )
    :vars
    (
      ?auto_7175 - HOIST
      ?auto_7176 - PLACE
      ?auto_7178 - PLACE
      ?auto_7179 - HOIST
      ?auto_7180 - SURFACE
      ?auto_7177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7175 ?auto_7176 ) ( SURFACE-AT ?auto_7173 ?auto_7176 ) ( CLEAR ?auto_7173 ) ( IS-CRATE ?auto_7174 ) ( AVAILABLE ?auto_7175 ) ( not ( = ?auto_7178 ?auto_7176 ) ) ( HOIST-AT ?auto_7179 ?auto_7178 ) ( AVAILABLE ?auto_7179 ) ( SURFACE-AT ?auto_7174 ?auto_7178 ) ( ON ?auto_7174 ?auto_7180 ) ( CLEAR ?auto_7174 ) ( TRUCK-AT ?auto_7177 ?auto_7176 ) ( not ( = ?auto_7173 ?auto_7174 ) ) ( not ( = ?auto_7173 ?auto_7180 ) ) ( not ( = ?auto_7174 ?auto_7180 ) ) ( not ( = ?auto_7175 ?auto_7179 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7177 ?auto_7176 ?auto_7178 )
      ( !LIFT ?auto_7179 ?auto_7174 ?auto_7180 ?auto_7178 )
      ( !LOAD ?auto_7179 ?auto_7174 ?auto_7177 ?auto_7178 )
      ( !DRIVE ?auto_7177 ?auto_7178 ?auto_7176 )
      ( !UNLOAD ?auto_7175 ?auto_7174 ?auto_7177 ?auto_7176 )
      ( !DROP ?auto_7175 ?auto_7174 ?auto_7173 ?auto_7176 )
      ( MAKE-1CRATE-VERIFY ?auto_7173 ?auto_7174 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_7188 - SURFACE
      ?auto_7189 - SURFACE
      ?auto_7190 - SURFACE
      ?auto_7191 - SURFACE
      ?auto_7192 - SURFACE
      ?auto_7193 - SURFACE
      ?auto_7194 - SURFACE
    )
    :vars
    (
      ?auto_7197 - HOIST
      ?auto_7200 - PLACE
      ?auto_7196 - PLACE
      ?auto_7195 - HOIST
      ?auto_7199 - SURFACE
      ?auto_7202 - PLACE
      ?auto_7203 - HOIST
      ?auto_7204 - SURFACE
      ?auto_7212 - PLACE
      ?auto_7210 - HOIST
      ?auto_7205 - SURFACE
      ?auto_7213 - PLACE
      ?auto_7206 - HOIST
      ?auto_7211 - SURFACE
      ?auto_7201 - PLACE
      ?auto_7207 - HOIST
      ?auto_7209 - SURFACE
      ?auto_7208 - SURFACE
      ?auto_7198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7197 ?auto_7200 ) ( IS-CRATE ?auto_7194 ) ( not ( = ?auto_7196 ?auto_7200 ) ) ( HOIST-AT ?auto_7195 ?auto_7196 ) ( AVAILABLE ?auto_7195 ) ( SURFACE-AT ?auto_7194 ?auto_7196 ) ( ON ?auto_7194 ?auto_7199 ) ( CLEAR ?auto_7194 ) ( not ( = ?auto_7193 ?auto_7194 ) ) ( not ( = ?auto_7193 ?auto_7199 ) ) ( not ( = ?auto_7194 ?auto_7199 ) ) ( not ( = ?auto_7197 ?auto_7195 ) ) ( IS-CRATE ?auto_7193 ) ( not ( = ?auto_7202 ?auto_7200 ) ) ( HOIST-AT ?auto_7203 ?auto_7202 ) ( SURFACE-AT ?auto_7193 ?auto_7202 ) ( ON ?auto_7193 ?auto_7204 ) ( CLEAR ?auto_7193 ) ( not ( = ?auto_7192 ?auto_7193 ) ) ( not ( = ?auto_7192 ?auto_7204 ) ) ( not ( = ?auto_7193 ?auto_7204 ) ) ( not ( = ?auto_7197 ?auto_7203 ) ) ( IS-CRATE ?auto_7192 ) ( not ( = ?auto_7212 ?auto_7200 ) ) ( HOIST-AT ?auto_7210 ?auto_7212 ) ( AVAILABLE ?auto_7210 ) ( SURFACE-AT ?auto_7192 ?auto_7212 ) ( ON ?auto_7192 ?auto_7205 ) ( CLEAR ?auto_7192 ) ( not ( = ?auto_7191 ?auto_7192 ) ) ( not ( = ?auto_7191 ?auto_7205 ) ) ( not ( = ?auto_7192 ?auto_7205 ) ) ( not ( = ?auto_7197 ?auto_7210 ) ) ( IS-CRATE ?auto_7191 ) ( not ( = ?auto_7213 ?auto_7200 ) ) ( HOIST-AT ?auto_7206 ?auto_7213 ) ( AVAILABLE ?auto_7206 ) ( SURFACE-AT ?auto_7191 ?auto_7213 ) ( ON ?auto_7191 ?auto_7211 ) ( CLEAR ?auto_7191 ) ( not ( = ?auto_7190 ?auto_7191 ) ) ( not ( = ?auto_7190 ?auto_7211 ) ) ( not ( = ?auto_7191 ?auto_7211 ) ) ( not ( = ?auto_7197 ?auto_7206 ) ) ( IS-CRATE ?auto_7190 ) ( not ( = ?auto_7201 ?auto_7200 ) ) ( HOIST-AT ?auto_7207 ?auto_7201 ) ( AVAILABLE ?auto_7207 ) ( SURFACE-AT ?auto_7190 ?auto_7201 ) ( ON ?auto_7190 ?auto_7209 ) ( CLEAR ?auto_7190 ) ( not ( = ?auto_7189 ?auto_7190 ) ) ( not ( = ?auto_7189 ?auto_7209 ) ) ( not ( = ?auto_7190 ?auto_7209 ) ) ( not ( = ?auto_7197 ?auto_7207 ) ) ( SURFACE-AT ?auto_7188 ?auto_7200 ) ( CLEAR ?auto_7188 ) ( IS-CRATE ?auto_7189 ) ( AVAILABLE ?auto_7197 ) ( AVAILABLE ?auto_7203 ) ( SURFACE-AT ?auto_7189 ?auto_7202 ) ( ON ?auto_7189 ?auto_7208 ) ( CLEAR ?auto_7189 ) ( TRUCK-AT ?auto_7198 ?auto_7200 ) ( not ( = ?auto_7188 ?auto_7189 ) ) ( not ( = ?auto_7188 ?auto_7208 ) ) ( not ( = ?auto_7189 ?auto_7208 ) ) ( not ( = ?auto_7188 ?auto_7190 ) ) ( not ( = ?auto_7188 ?auto_7209 ) ) ( not ( = ?auto_7190 ?auto_7208 ) ) ( not ( = ?auto_7201 ?auto_7202 ) ) ( not ( = ?auto_7207 ?auto_7203 ) ) ( not ( = ?auto_7209 ?auto_7208 ) ) ( not ( = ?auto_7188 ?auto_7191 ) ) ( not ( = ?auto_7188 ?auto_7211 ) ) ( not ( = ?auto_7189 ?auto_7191 ) ) ( not ( = ?auto_7189 ?auto_7211 ) ) ( not ( = ?auto_7191 ?auto_7209 ) ) ( not ( = ?auto_7191 ?auto_7208 ) ) ( not ( = ?auto_7213 ?auto_7201 ) ) ( not ( = ?auto_7213 ?auto_7202 ) ) ( not ( = ?auto_7206 ?auto_7207 ) ) ( not ( = ?auto_7206 ?auto_7203 ) ) ( not ( = ?auto_7211 ?auto_7209 ) ) ( not ( = ?auto_7211 ?auto_7208 ) ) ( not ( = ?auto_7188 ?auto_7192 ) ) ( not ( = ?auto_7188 ?auto_7205 ) ) ( not ( = ?auto_7189 ?auto_7192 ) ) ( not ( = ?auto_7189 ?auto_7205 ) ) ( not ( = ?auto_7190 ?auto_7192 ) ) ( not ( = ?auto_7190 ?auto_7205 ) ) ( not ( = ?auto_7192 ?auto_7211 ) ) ( not ( = ?auto_7192 ?auto_7209 ) ) ( not ( = ?auto_7192 ?auto_7208 ) ) ( not ( = ?auto_7212 ?auto_7213 ) ) ( not ( = ?auto_7212 ?auto_7201 ) ) ( not ( = ?auto_7212 ?auto_7202 ) ) ( not ( = ?auto_7210 ?auto_7206 ) ) ( not ( = ?auto_7210 ?auto_7207 ) ) ( not ( = ?auto_7210 ?auto_7203 ) ) ( not ( = ?auto_7205 ?auto_7211 ) ) ( not ( = ?auto_7205 ?auto_7209 ) ) ( not ( = ?auto_7205 ?auto_7208 ) ) ( not ( = ?auto_7188 ?auto_7193 ) ) ( not ( = ?auto_7188 ?auto_7204 ) ) ( not ( = ?auto_7189 ?auto_7193 ) ) ( not ( = ?auto_7189 ?auto_7204 ) ) ( not ( = ?auto_7190 ?auto_7193 ) ) ( not ( = ?auto_7190 ?auto_7204 ) ) ( not ( = ?auto_7191 ?auto_7193 ) ) ( not ( = ?auto_7191 ?auto_7204 ) ) ( not ( = ?auto_7193 ?auto_7205 ) ) ( not ( = ?auto_7193 ?auto_7211 ) ) ( not ( = ?auto_7193 ?auto_7209 ) ) ( not ( = ?auto_7193 ?auto_7208 ) ) ( not ( = ?auto_7204 ?auto_7205 ) ) ( not ( = ?auto_7204 ?auto_7211 ) ) ( not ( = ?auto_7204 ?auto_7209 ) ) ( not ( = ?auto_7204 ?auto_7208 ) ) ( not ( = ?auto_7188 ?auto_7194 ) ) ( not ( = ?auto_7188 ?auto_7199 ) ) ( not ( = ?auto_7189 ?auto_7194 ) ) ( not ( = ?auto_7189 ?auto_7199 ) ) ( not ( = ?auto_7190 ?auto_7194 ) ) ( not ( = ?auto_7190 ?auto_7199 ) ) ( not ( = ?auto_7191 ?auto_7194 ) ) ( not ( = ?auto_7191 ?auto_7199 ) ) ( not ( = ?auto_7192 ?auto_7194 ) ) ( not ( = ?auto_7192 ?auto_7199 ) ) ( not ( = ?auto_7194 ?auto_7204 ) ) ( not ( = ?auto_7194 ?auto_7205 ) ) ( not ( = ?auto_7194 ?auto_7211 ) ) ( not ( = ?auto_7194 ?auto_7209 ) ) ( not ( = ?auto_7194 ?auto_7208 ) ) ( not ( = ?auto_7196 ?auto_7202 ) ) ( not ( = ?auto_7196 ?auto_7212 ) ) ( not ( = ?auto_7196 ?auto_7213 ) ) ( not ( = ?auto_7196 ?auto_7201 ) ) ( not ( = ?auto_7195 ?auto_7203 ) ) ( not ( = ?auto_7195 ?auto_7210 ) ) ( not ( = ?auto_7195 ?auto_7206 ) ) ( not ( = ?auto_7195 ?auto_7207 ) ) ( not ( = ?auto_7199 ?auto_7204 ) ) ( not ( = ?auto_7199 ?auto_7205 ) ) ( not ( = ?auto_7199 ?auto_7211 ) ) ( not ( = ?auto_7199 ?auto_7209 ) ) ( not ( = ?auto_7199 ?auto_7208 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7188 ?auto_7189 ?auto_7190 ?auto_7191 ?auto_7192 ?auto_7193 )
      ( MAKE-1CRATE ?auto_7193 ?auto_7194 )
      ( MAKE-6CRATE-VERIFY ?auto_7188 ?auto_7189 ?auto_7190 ?auto_7191 ?auto_7192 ?auto_7193 ?auto_7194 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7216 - SURFACE
      ?auto_7217 - SURFACE
    )
    :vars
    (
      ?auto_7218 - HOIST
      ?auto_7219 - PLACE
      ?auto_7221 - PLACE
      ?auto_7222 - HOIST
      ?auto_7223 - SURFACE
      ?auto_7220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7218 ?auto_7219 ) ( SURFACE-AT ?auto_7216 ?auto_7219 ) ( CLEAR ?auto_7216 ) ( IS-CRATE ?auto_7217 ) ( AVAILABLE ?auto_7218 ) ( not ( = ?auto_7221 ?auto_7219 ) ) ( HOIST-AT ?auto_7222 ?auto_7221 ) ( AVAILABLE ?auto_7222 ) ( SURFACE-AT ?auto_7217 ?auto_7221 ) ( ON ?auto_7217 ?auto_7223 ) ( CLEAR ?auto_7217 ) ( TRUCK-AT ?auto_7220 ?auto_7219 ) ( not ( = ?auto_7216 ?auto_7217 ) ) ( not ( = ?auto_7216 ?auto_7223 ) ) ( not ( = ?auto_7217 ?auto_7223 ) ) ( not ( = ?auto_7218 ?auto_7222 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7220 ?auto_7219 ?auto_7221 )
      ( !LIFT ?auto_7222 ?auto_7217 ?auto_7223 ?auto_7221 )
      ( !LOAD ?auto_7222 ?auto_7217 ?auto_7220 ?auto_7221 )
      ( !DRIVE ?auto_7220 ?auto_7221 ?auto_7219 )
      ( !UNLOAD ?auto_7218 ?auto_7217 ?auto_7220 ?auto_7219 )
      ( !DROP ?auto_7218 ?auto_7217 ?auto_7216 ?auto_7219 )
      ( MAKE-1CRATE-VERIFY ?auto_7216 ?auto_7217 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_7232 - SURFACE
      ?auto_7233 - SURFACE
      ?auto_7234 - SURFACE
      ?auto_7235 - SURFACE
      ?auto_7236 - SURFACE
      ?auto_7237 - SURFACE
      ?auto_7239 - SURFACE
      ?auto_7238 - SURFACE
    )
    :vars
    (
      ?auto_7245 - HOIST
      ?auto_7240 - PLACE
      ?auto_7242 - PLACE
      ?auto_7244 - HOIST
      ?auto_7241 - SURFACE
      ?auto_7257 - PLACE
      ?auto_7253 - HOIST
      ?auto_7254 - SURFACE
      ?auto_7259 - PLACE
      ?auto_7255 - HOIST
      ?auto_7258 - SURFACE
      ?auto_7246 - PLACE
      ?auto_7248 - HOIST
      ?auto_7252 - SURFACE
      ?auto_7249 - SURFACE
      ?auto_7256 - PLACE
      ?auto_7251 - HOIST
      ?auto_7250 - SURFACE
      ?auto_7247 - SURFACE
      ?auto_7243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7245 ?auto_7240 ) ( IS-CRATE ?auto_7238 ) ( not ( = ?auto_7242 ?auto_7240 ) ) ( HOIST-AT ?auto_7244 ?auto_7242 ) ( SURFACE-AT ?auto_7238 ?auto_7242 ) ( ON ?auto_7238 ?auto_7241 ) ( CLEAR ?auto_7238 ) ( not ( = ?auto_7239 ?auto_7238 ) ) ( not ( = ?auto_7239 ?auto_7241 ) ) ( not ( = ?auto_7238 ?auto_7241 ) ) ( not ( = ?auto_7245 ?auto_7244 ) ) ( IS-CRATE ?auto_7239 ) ( not ( = ?auto_7257 ?auto_7240 ) ) ( HOIST-AT ?auto_7253 ?auto_7257 ) ( AVAILABLE ?auto_7253 ) ( SURFACE-AT ?auto_7239 ?auto_7257 ) ( ON ?auto_7239 ?auto_7254 ) ( CLEAR ?auto_7239 ) ( not ( = ?auto_7237 ?auto_7239 ) ) ( not ( = ?auto_7237 ?auto_7254 ) ) ( not ( = ?auto_7239 ?auto_7254 ) ) ( not ( = ?auto_7245 ?auto_7253 ) ) ( IS-CRATE ?auto_7237 ) ( not ( = ?auto_7259 ?auto_7240 ) ) ( HOIST-AT ?auto_7255 ?auto_7259 ) ( SURFACE-AT ?auto_7237 ?auto_7259 ) ( ON ?auto_7237 ?auto_7258 ) ( CLEAR ?auto_7237 ) ( not ( = ?auto_7236 ?auto_7237 ) ) ( not ( = ?auto_7236 ?auto_7258 ) ) ( not ( = ?auto_7237 ?auto_7258 ) ) ( not ( = ?auto_7245 ?auto_7255 ) ) ( IS-CRATE ?auto_7236 ) ( not ( = ?auto_7246 ?auto_7240 ) ) ( HOIST-AT ?auto_7248 ?auto_7246 ) ( AVAILABLE ?auto_7248 ) ( SURFACE-AT ?auto_7236 ?auto_7246 ) ( ON ?auto_7236 ?auto_7252 ) ( CLEAR ?auto_7236 ) ( not ( = ?auto_7235 ?auto_7236 ) ) ( not ( = ?auto_7235 ?auto_7252 ) ) ( not ( = ?auto_7236 ?auto_7252 ) ) ( not ( = ?auto_7245 ?auto_7248 ) ) ( IS-CRATE ?auto_7235 ) ( AVAILABLE ?auto_7244 ) ( SURFACE-AT ?auto_7235 ?auto_7242 ) ( ON ?auto_7235 ?auto_7249 ) ( CLEAR ?auto_7235 ) ( not ( = ?auto_7234 ?auto_7235 ) ) ( not ( = ?auto_7234 ?auto_7249 ) ) ( not ( = ?auto_7235 ?auto_7249 ) ) ( IS-CRATE ?auto_7234 ) ( not ( = ?auto_7256 ?auto_7240 ) ) ( HOIST-AT ?auto_7251 ?auto_7256 ) ( AVAILABLE ?auto_7251 ) ( SURFACE-AT ?auto_7234 ?auto_7256 ) ( ON ?auto_7234 ?auto_7250 ) ( CLEAR ?auto_7234 ) ( not ( = ?auto_7233 ?auto_7234 ) ) ( not ( = ?auto_7233 ?auto_7250 ) ) ( not ( = ?auto_7234 ?auto_7250 ) ) ( not ( = ?auto_7245 ?auto_7251 ) ) ( SURFACE-AT ?auto_7232 ?auto_7240 ) ( CLEAR ?auto_7232 ) ( IS-CRATE ?auto_7233 ) ( AVAILABLE ?auto_7245 ) ( AVAILABLE ?auto_7255 ) ( SURFACE-AT ?auto_7233 ?auto_7259 ) ( ON ?auto_7233 ?auto_7247 ) ( CLEAR ?auto_7233 ) ( TRUCK-AT ?auto_7243 ?auto_7240 ) ( not ( = ?auto_7232 ?auto_7233 ) ) ( not ( = ?auto_7232 ?auto_7247 ) ) ( not ( = ?auto_7233 ?auto_7247 ) ) ( not ( = ?auto_7232 ?auto_7234 ) ) ( not ( = ?auto_7232 ?auto_7250 ) ) ( not ( = ?auto_7234 ?auto_7247 ) ) ( not ( = ?auto_7256 ?auto_7259 ) ) ( not ( = ?auto_7251 ?auto_7255 ) ) ( not ( = ?auto_7250 ?auto_7247 ) ) ( not ( = ?auto_7232 ?auto_7235 ) ) ( not ( = ?auto_7232 ?auto_7249 ) ) ( not ( = ?auto_7233 ?auto_7235 ) ) ( not ( = ?auto_7233 ?auto_7249 ) ) ( not ( = ?auto_7235 ?auto_7250 ) ) ( not ( = ?auto_7235 ?auto_7247 ) ) ( not ( = ?auto_7242 ?auto_7256 ) ) ( not ( = ?auto_7242 ?auto_7259 ) ) ( not ( = ?auto_7244 ?auto_7251 ) ) ( not ( = ?auto_7244 ?auto_7255 ) ) ( not ( = ?auto_7249 ?auto_7250 ) ) ( not ( = ?auto_7249 ?auto_7247 ) ) ( not ( = ?auto_7232 ?auto_7236 ) ) ( not ( = ?auto_7232 ?auto_7252 ) ) ( not ( = ?auto_7233 ?auto_7236 ) ) ( not ( = ?auto_7233 ?auto_7252 ) ) ( not ( = ?auto_7234 ?auto_7236 ) ) ( not ( = ?auto_7234 ?auto_7252 ) ) ( not ( = ?auto_7236 ?auto_7249 ) ) ( not ( = ?auto_7236 ?auto_7250 ) ) ( not ( = ?auto_7236 ?auto_7247 ) ) ( not ( = ?auto_7246 ?auto_7242 ) ) ( not ( = ?auto_7246 ?auto_7256 ) ) ( not ( = ?auto_7246 ?auto_7259 ) ) ( not ( = ?auto_7248 ?auto_7244 ) ) ( not ( = ?auto_7248 ?auto_7251 ) ) ( not ( = ?auto_7248 ?auto_7255 ) ) ( not ( = ?auto_7252 ?auto_7249 ) ) ( not ( = ?auto_7252 ?auto_7250 ) ) ( not ( = ?auto_7252 ?auto_7247 ) ) ( not ( = ?auto_7232 ?auto_7237 ) ) ( not ( = ?auto_7232 ?auto_7258 ) ) ( not ( = ?auto_7233 ?auto_7237 ) ) ( not ( = ?auto_7233 ?auto_7258 ) ) ( not ( = ?auto_7234 ?auto_7237 ) ) ( not ( = ?auto_7234 ?auto_7258 ) ) ( not ( = ?auto_7235 ?auto_7237 ) ) ( not ( = ?auto_7235 ?auto_7258 ) ) ( not ( = ?auto_7237 ?auto_7252 ) ) ( not ( = ?auto_7237 ?auto_7249 ) ) ( not ( = ?auto_7237 ?auto_7250 ) ) ( not ( = ?auto_7237 ?auto_7247 ) ) ( not ( = ?auto_7258 ?auto_7252 ) ) ( not ( = ?auto_7258 ?auto_7249 ) ) ( not ( = ?auto_7258 ?auto_7250 ) ) ( not ( = ?auto_7258 ?auto_7247 ) ) ( not ( = ?auto_7232 ?auto_7239 ) ) ( not ( = ?auto_7232 ?auto_7254 ) ) ( not ( = ?auto_7233 ?auto_7239 ) ) ( not ( = ?auto_7233 ?auto_7254 ) ) ( not ( = ?auto_7234 ?auto_7239 ) ) ( not ( = ?auto_7234 ?auto_7254 ) ) ( not ( = ?auto_7235 ?auto_7239 ) ) ( not ( = ?auto_7235 ?auto_7254 ) ) ( not ( = ?auto_7236 ?auto_7239 ) ) ( not ( = ?auto_7236 ?auto_7254 ) ) ( not ( = ?auto_7239 ?auto_7258 ) ) ( not ( = ?auto_7239 ?auto_7252 ) ) ( not ( = ?auto_7239 ?auto_7249 ) ) ( not ( = ?auto_7239 ?auto_7250 ) ) ( not ( = ?auto_7239 ?auto_7247 ) ) ( not ( = ?auto_7257 ?auto_7259 ) ) ( not ( = ?auto_7257 ?auto_7246 ) ) ( not ( = ?auto_7257 ?auto_7242 ) ) ( not ( = ?auto_7257 ?auto_7256 ) ) ( not ( = ?auto_7253 ?auto_7255 ) ) ( not ( = ?auto_7253 ?auto_7248 ) ) ( not ( = ?auto_7253 ?auto_7244 ) ) ( not ( = ?auto_7253 ?auto_7251 ) ) ( not ( = ?auto_7254 ?auto_7258 ) ) ( not ( = ?auto_7254 ?auto_7252 ) ) ( not ( = ?auto_7254 ?auto_7249 ) ) ( not ( = ?auto_7254 ?auto_7250 ) ) ( not ( = ?auto_7254 ?auto_7247 ) ) ( not ( = ?auto_7232 ?auto_7238 ) ) ( not ( = ?auto_7232 ?auto_7241 ) ) ( not ( = ?auto_7233 ?auto_7238 ) ) ( not ( = ?auto_7233 ?auto_7241 ) ) ( not ( = ?auto_7234 ?auto_7238 ) ) ( not ( = ?auto_7234 ?auto_7241 ) ) ( not ( = ?auto_7235 ?auto_7238 ) ) ( not ( = ?auto_7235 ?auto_7241 ) ) ( not ( = ?auto_7236 ?auto_7238 ) ) ( not ( = ?auto_7236 ?auto_7241 ) ) ( not ( = ?auto_7237 ?auto_7238 ) ) ( not ( = ?auto_7237 ?auto_7241 ) ) ( not ( = ?auto_7238 ?auto_7254 ) ) ( not ( = ?auto_7238 ?auto_7258 ) ) ( not ( = ?auto_7238 ?auto_7252 ) ) ( not ( = ?auto_7238 ?auto_7249 ) ) ( not ( = ?auto_7238 ?auto_7250 ) ) ( not ( = ?auto_7238 ?auto_7247 ) ) ( not ( = ?auto_7241 ?auto_7254 ) ) ( not ( = ?auto_7241 ?auto_7258 ) ) ( not ( = ?auto_7241 ?auto_7252 ) ) ( not ( = ?auto_7241 ?auto_7249 ) ) ( not ( = ?auto_7241 ?auto_7250 ) ) ( not ( = ?auto_7241 ?auto_7247 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7232 ?auto_7233 ?auto_7234 ?auto_7235 ?auto_7236 ?auto_7237 ?auto_7239 )
      ( MAKE-1CRATE ?auto_7239 ?auto_7238 )
      ( MAKE-7CRATE-VERIFY ?auto_7232 ?auto_7233 ?auto_7234 ?auto_7235 ?auto_7236 ?auto_7237 ?auto_7239 ?auto_7238 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7262 - SURFACE
      ?auto_7263 - SURFACE
    )
    :vars
    (
      ?auto_7264 - HOIST
      ?auto_7265 - PLACE
      ?auto_7267 - PLACE
      ?auto_7268 - HOIST
      ?auto_7269 - SURFACE
      ?auto_7266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7264 ?auto_7265 ) ( SURFACE-AT ?auto_7262 ?auto_7265 ) ( CLEAR ?auto_7262 ) ( IS-CRATE ?auto_7263 ) ( AVAILABLE ?auto_7264 ) ( not ( = ?auto_7267 ?auto_7265 ) ) ( HOIST-AT ?auto_7268 ?auto_7267 ) ( AVAILABLE ?auto_7268 ) ( SURFACE-AT ?auto_7263 ?auto_7267 ) ( ON ?auto_7263 ?auto_7269 ) ( CLEAR ?auto_7263 ) ( TRUCK-AT ?auto_7266 ?auto_7265 ) ( not ( = ?auto_7262 ?auto_7263 ) ) ( not ( = ?auto_7262 ?auto_7269 ) ) ( not ( = ?auto_7263 ?auto_7269 ) ) ( not ( = ?auto_7264 ?auto_7268 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7266 ?auto_7265 ?auto_7267 )
      ( !LIFT ?auto_7268 ?auto_7263 ?auto_7269 ?auto_7267 )
      ( !LOAD ?auto_7268 ?auto_7263 ?auto_7266 ?auto_7267 )
      ( !DRIVE ?auto_7266 ?auto_7267 ?auto_7265 )
      ( !UNLOAD ?auto_7264 ?auto_7263 ?auto_7266 ?auto_7265 )
      ( !DROP ?auto_7264 ?auto_7263 ?auto_7262 ?auto_7265 )
      ( MAKE-1CRATE-VERIFY ?auto_7262 ?auto_7263 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_7279 - SURFACE
      ?auto_7280 - SURFACE
      ?auto_7281 - SURFACE
      ?auto_7282 - SURFACE
      ?auto_7283 - SURFACE
      ?auto_7284 - SURFACE
      ?auto_7287 - SURFACE
      ?auto_7286 - SURFACE
      ?auto_7285 - SURFACE
    )
    :vars
    (
      ?auto_7293 - HOIST
      ?auto_7291 - PLACE
      ?auto_7292 - PLACE
      ?auto_7288 - HOIST
      ?auto_7289 - SURFACE
      ?auto_7307 - PLACE
      ?auto_7295 - HOIST
      ?auto_7296 - SURFACE
      ?auto_7302 - SURFACE
      ?auto_7306 - PLACE
      ?auto_7304 - HOIST
      ?auto_7305 - SURFACE
      ?auto_7301 - PLACE
      ?auto_7300 - HOIST
      ?auto_7297 - SURFACE
      ?auto_7298 - SURFACE
      ?auto_7303 - PLACE
      ?auto_7308 - HOIST
      ?auto_7294 - SURFACE
      ?auto_7299 - SURFACE
      ?auto_7290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7293 ?auto_7291 ) ( IS-CRATE ?auto_7285 ) ( not ( = ?auto_7292 ?auto_7291 ) ) ( HOIST-AT ?auto_7288 ?auto_7292 ) ( SURFACE-AT ?auto_7285 ?auto_7292 ) ( ON ?auto_7285 ?auto_7289 ) ( CLEAR ?auto_7285 ) ( not ( = ?auto_7286 ?auto_7285 ) ) ( not ( = ?auto_7286 ?auto_7289 ) ) ( not ( = ?auto_7285 ?auto_7289 ) ) ( not ( = ?auto_7293 ?auto_7288 ) ) ( IS-CRATE ?auto_7286 ) ( not ( = ?auto_7307 ?auto_7291 ) ) ( HOIST-AT ?auto_7295 ?auto_7307 ) ( SURFACE-AT ?auto_7286 ?auto_7307 ) ( ON ?auto_7286 ?auto_7296 ) ( CLEAR ?auto_7286 ) ( not ( = ?auto_7287 ?auto_7286 ) ) ( not ( = ?auto_7287 ?auto_7296 ) ) ( not ( = ?auto_7286 ?auto_7296 ) ) ( not ( = ?auto_7293 ?auto_7295 ) ) ( IS-CRATE ?auto_7287 ) ( AVAILABLE ?auto_7288 ) ( SURFACE-AT ?auto_7287 ?auto_7292 ) ( ON ?auto_7287 ?auto_7302 ) ( CLEAR ?auto_7287 ) ( not ( = ?auto_7284 ?auto_7287 ) ) ( not ( = ?auto_7284 ?auto_7302 ) ) ( not ( = ?auto_7287 ?auto_7302 ) ) ( IS-CRATE ?auto_7284 ) ( not ( = ?auto_7306 ?auto_7291 ) ) ( HOIST-AT ?auto_7304 ?auto_7306 ) ( SURFACE-AT ?auto_7284 ?auto_7306 ) ( ON ?auto_7284 ?auto_7305 ) ( CLEAR ?auto_7284 ) ( not ( = ?auto_7283 ?auto_7284 ) ) ( not ( = ?auto_7283 ?auto_7305 ) ) ( not ( = ?auto_7284 ?auto_7305 ) ) ( not ( = ?auto_7293 ?auto_7304 ) ) ( IS-CRATE ?auto_7283 ) ( not ( = ?auto_7301 ?auto_7291 ) ) ( HOIST-AT ?auto_7300 ?auto_7301 ) ( AVAILABLE ?auto_7300 ) ( SURFACE-AT ?auto_7283 ?auto_7301 ) ( ON ?auto_7283 ?auto_7297 ) ( CLEAR ?auto_7283 ) ( not ( = ?auto_7282 ?auto_7283 ) ) ( not ( = ?auto_7282 ?auto_7297 ) ) ( not ( = ?auto_7283 ?auto_7297 ) ) ( not ( = ?auto_7293 ?auto_7300 ) ) ( IS-CRATE ?auto_7282 ) ( AVAILABLE ?auto_7295 ) ( SURFACE-AT ?auto_7282 ?auto_7307 ) ( ON ?auto_7282 ?auto_7298 ) ( CLEAR ?auto_7282 ) ( not ( = ?auto_7281 ?auto_7282 ) ) ( not ( = ?auto_7281 ?auto_7298 ) ) ( not ( = ?auto_7282 ?auto_7298 ) ) ( IS-CRATE ?auto_7281 ) ( not ( = ?auto_7303 ?auto_7291 ) ) ( HOIST-AT ?auto_7308 ?auto_7303 ) ( AVAILABLE ?auto_7308 ) ( SURFACE-AT ?auto_7281 ?auto_7303 ) ( ON ?auto_7281 ?auto_7294 ) ( CLEAR ?auto_7281 ) ( not ( = ?auto_7280 ?auto_7281 ) ) ( not ( = ?auto_7280 ?auto_7294 ) ) ( not ( = ?auto_7281 ?auto_7294 ) ) ( not ( = ?auto_7293 ?auto_7308 ) ) ( SURFACE-AT ?auto_7279 ?auto_7291 ) ( CLEAR ?auto_7279 ) ( IS-CRATE ?auto_7280 ) ( AVAILABLE ?auto_7293 ) ( AVAILABLE ?auto_7304 ) ( SURFACE-AT ?auto_7280 ?auto_7306 ) ( ON ?auto_7280 ?auto_7299 ) ( CLEAR ?auto_7280 ) ( TRUCK-AT ?auto_7290 ?auto_7291 ) ( not ( = ?auto_7279 ?auto_7280 ) ) ( not ( = ?auto_7279 ?auto_7299 ) ) ( not ( = ?auto_7280 ?auto_7299 ) ) ( not ( = ?auto_7279 ?auto_7281 ) ) ( not ( = ?auto_7279 ?auto_7294 ) ) ( not ( = ?auto_7281 ?auto_7299 ) ) ( not ( = ?auto_7303 ?auto_7306 ) ) ( not ( = ?auto_7308 ?auto_7304 ) ) ( not ( = ?auto_7294 ?auto_7299 ) ) ( not ( = ?auto_7279 ?auto_7282 ) ) ( not ( = ?auto_7279 ?auto_7298 ) ) ( not ( = ?auto_7280 ?auto_7282 ) ) ( not ( = ?auto_7280 ?auto_7298 ) ) ( not ( = ?auto_7282 ?auto_7294 ) ) ( not ( = ?auto_7282 ?auto_7299 ) ) ( not ( = ?auto_7307 ?auto_7303 ) ) ( not ( = ?auto_7307 ?auto_7306 ) ) ( not ( = ?auto_7295 ?auto_7308 ) ) ( not ( = ?auto_7295 ?auto_7304 ) ) ( not ( = ?auto_7298 ?auto_7294 ) ) ( not ( = ?auto_7298 ?auto_7299 ) ) ( not ( = ?auto_7279 ?auto_7283 ) ) ( not ( = ?auto_7279 ?auto_7297 ) ) ( not ( = ?auto_7280 ?auto_7283 ) ) ( not ( = ?auto_7280 ?auto_7297 ) ) ( not ( = ?auto_7281 ?auto_7283 ) ) ( not ( = ?auto_7281 ?auto_7297 ) ) ( not ( = ?auto_7283 ?auto_7298 ) ) ( not ( = ?auto_7283 ?auto_7294 ) ) ( not ( = ?auto_7283 ?auto_7299 ) ) ( not ( = ?auto_7301 ?auto_7307 ) ) ( not ( = ?auto_7301 ?auto_7303 ) ) ( not ( = ?auto_7301 ?auto_7306 ) ) ( not ( = ?auto_7300 ?auto_7295 ) ) ( not ( = ?auto_7300 ?auto_7308 ) ) ( not ( = ?auto_7300 ?auto_7304 ) ) ( not ( = ?auto_7297 ?auto_7298 ) ) ( not ( = ?auto_7297 ?auto_7294 ) ) ( not ( = ?auto_7297 ?auto_7299 ) ) ( not ( = ?auto_7279 ?auto_7284 ) ) ( not ( = ?auto_7279 ?auto_7305 ) ) ( not ( = ?auto_7280 ?auto_7284 ) ) ( not ( = ?auto_7280 ?auto_7305 ) ) ( not ( = ?auto_7281 ?auto_7284 ) ) ( not ( = ?auto_7281 ?auto_7305 ) ) ( not ( = ?auto_7282 ?auto_7284 ) ) ( not ( = ?auto_7282 ?auto_7305 ) ) ( not ( = ?auto_7284 ?auto_7297 ) ) ( not ( = ?auto_7284 ?auto_7298 ) ) ( not ( = ?auto_7284 ?auto_7294 ) ) ( not ( = ?auto_7284 ?auto_7299 ) ) ( not ( = ?auto_7305 ?auto_7297 ) ) ( not ( = ?auto_7305 ?auto_7298 ) ) ( not ( = ?auto_7305 ?auto_7294 ) ) ( not ( = ?auto_7305 ?auto_7299 ) ) ( not ( = ?auto_7279 ?auto_7287 ) ) ( not ( = ?auto_7279 ?auto_7302 ) ) ( not ( = ?auto_7280 ?auto_7287 ) ) ( not ( = ?auto_7280 ?auto_7302 ) ) ( not ( = ?auto_7281 ?auto_7287 ) ) ( not ( = ?auto_7281 ?auto_7302 ) ) ( not ( = ?auto_7282 ?auto_7287 ) ) ( not ( = ?auto_7282 ?auto_7302 ) ) ( not ( = ?auto_7283 ?auto_7287 ) ) ( not ( = ?auto_7283 ?auto_7302 ) ) ( not ( = ?auto_7287 ?auto_7305 ) ) ( not ( = ?auto_7287 ?auto_7297 ) ) ( not ( = ?auto_7287 ?auto_7298 ) ) ( not ( = ?auto_7287 ?auto_7294 ) ) ( not ( = ?auto_7287 ?auto_7299 ) ) ( not ( = ?auto_7292 ?auto_7306 ) ) ( not ( = ?auto_7292 ?auto_7301 ) ) ( not ( = ?auto_7292 ?auto_7307 ) ) ( not ( = ?auto_7292 ?auto_7303 ) ) ( not ( = ?auto_7288 ?auto_7304 ) ) ( not ( = ?auto_7288 ?auto_7300 ) ) ( not ( = ?auto_7288 ?auto_7295 ) ) ( not ( = ?auto_7288 ?auto_7308 ) ) ( not ( = ?auto_7302 ?auto_7305 ) ) ( not ( = ?auto_7302 ?auto_7297 ) ) ( not ( = ?auto_7302 ?auto_7298 ) ) ( not ( = ?auto_7302 ?auto_7294 ) ) ( not ( = ?auto_7302 ?auto_7299 ) ) ( not ( = ?auto_7279 ?auto_7286 ) ) ( not ( = ?auto_7279 ?auto_7296 ) ) ( not ( = ?auto_7280 ?auto_7286 ) ) ( not ( = ?auto_7280 ?auto_7296 ) ) ( not ( = ?auto_7281 ?auto_7286 ) ) ( not ( = ?auto_7281 ?auto_7296 ) ) ( not ( = ?auto_7282 ?auto_7286 ) ) ( not ( = ?auto_7282 ?auto_7296 ) ) ( not ( = ?auto_7283 ?auto_7286 ) ) ( not ( = ?auto_7283 ?auto_7296 ) ) ( not ( = ?auto_7284 ?auto_7286 ) ) ( not ( = ?auto_7284 ?auto_7296 ) ) ( not ( = ?auto_7286 ?auto_7302 ) ) ( not ( = ?auto_7286 ?auto_7305 ) ) ( not ( = ?auto_7286 ?auto_7297 ) ) ( not ( = ?auto_7286 ?auto_7298 ) ) ( not ( = ?auto_7286 ?auto_7294 ) ) ( not ( = ?auto_7286 ?auto_7299 ) ) ( not ( = ?auto_7296 ?auto_7302 ) ) ( not ( = ?auto_7296 ?auto_7305 ) ) ( not ( = ?auto_7296 ?auto_7297 ) ) ( not ( = ?auto_7296 ?auto_7298 ) ) ( not ( = ?auto_7296 ?auto_7294 ) ) ( not ( = ?auto_7296 ?auto_7299 ) ) ( not ( = ?auto_7279 ?auto_7285 ) ) ( not ( = ?auto_7279 ?auto_7289 ) ) ( not ( = ?auto_7280 ?auto_7285 ) ) ( not ( = ?auto_7280 ?auto_7289 ) ) ( not ( = ?auto_7281 ?auto_7285 ) ) ( not ( = ?auto_7281 ?auto_7289 ) ) ( not ( = ?auto_7282 ?auto_7285 ) ) ( not ( = ?auto_7282 ?auto_7289 ) ) ( not ( = ?auto_7283 ?auto_7285 ) ) ( not ( = ?auto_7283 ?auto_7289 ) ) ( not ( = ?auto_7284 ?auto_7285 ) ) ( not ( = ?auto_7284 ?auto_7289 ) ) ( not ( = ?auto_7287 ?auto_7285 ) ) ( not ( = ?auto_7287 ?auto_7289 ) ) ( not ( = ?auto_7285 ?auto_7296 ) ) ( not ( = ?auto_7285 ?auto_7302 ) ) ( not ( = ?auto_7285 ?auto_7305 ) ) ( not ( = ?auto_7285 ?auto_7297 ) ) ( not ( = ?auto_7285 ?auto_7298 ) ) ( not ( = ?auto_7285 ?auto_7294 ) ) ( not ( = ?auto_7285 ?auto_7299 ) ) ( not ( = ?auto_7289 ?auto_7296 ) ) ( not ( = ?auto_7289 ?auto_7302 ) ) ( not ( = ?auto_7289 ?auto_7305 ) ) ( not ( = ?auto_7289 ?auto_7297 ) ) ( not ( = ?auto_7289 ?auto_7298 ) ) ( not ( = ?auto_7289 ?auto_7294 ) ) ( not ( = ?auto_7289 ?auto_7299 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7279 ?auto_7280 ?auto_7281 ?auto_7282 ?auto_7283 ?auto_7284 ?auto_7287 ?auto_7286 )
      ( MAKE-1CRATE ?auto_7286 ?auto_7285 )
      ( MAKE-8CRATE-VERIFY ?auto_7279 ?auto_7280 ?auto_7281 ?auto_7282 ?auto_7283 ?auto_7284 ?auto_7287 ?auto_7286 ?auto_7285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7311 - SURFACE
      ?auto_7312 - SURFACE
    )
    :vars
    (
      ?auto_7313 - HOIST
      ?auto_7314 - PLACE
      ?auto_7316 - PLACE
      ?auto_7317 - HOIST
      ?auto_7318 - SURFACE
      ?auto_7315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7313 ?auto_7314 ) ( SURFACE-AT ?auto_7311 ?auto_7314 ) ( CLEAR ?auto_7311 ) ( IS-CRATE ?auto_7312 ) ( AVAILABLE ?auto_7313 ) ( not ( = ?auto_7316 ?auto_7314 ) ) ( HOIST-AT ?auto_7317 ?auto_7316 ) ( AVAILABLE ?auto_7317 ) ( SURFACE-AT ?auto_7312 ?auto_7316 ) ( ON ?auto_7312 ?auto_7318 ) ( CLEAR ?auto_7312 ) ( TRUCK-AT ?auto_7315 ?auto_7314 ) ( not ( = ?auto_7311 ?auto_7312 ) ) ( not ( = ?auto_7311 ?auto_7318 ) ) ( not ( = ?auto_7312 ?auto_7318 ) ) ( not ( = ?auto_7313 ?auto_7317 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7315 ?auto_7314 ?auto_7316 )
      ( !LIFT ?auto_7317 ?auto_7312 ?auto_7318 ?auto_7316 )
      ( !LOAD ?auto_7317 ?auto_7312 ?auto_7315 ?auto_7316 )
      ( !DRIVE ?auto_7315 ?auto_7316 ?auto_7314 )
      ( !UNLOAD ?auto_7313 ?auto_7312 ?auto_7315 ?auto_7314 )
      ( !DROP ?auto_7313 ?auto_7312 ?auto_7311 ?auto_7314 )
      ( MAKE-1CRATE-VERIFY ?auto_7311 ?auto_7312 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_7329 - SURFACE
      ?auto_7330 - SURFACE
      ?auto_7331 - SURFACE
      ?auto_7332 - SURFACE
      ?auto_7333 - SURFACE
      ?auto_7334 - SURFACE
      ?auto_7337 - SURFACE
      ?auto_7336 - SURFACE
      ?auto_7335 - SURFACE
      ?auto_7338 - SURFACE
    )
    :vars
    (
      ?auto_7342 - HOIST
      ?auto_7344 - PLACE
      ?auto_7340 - PLACE
      ?auto_7341 - HOIST
      ?auto_7339 - SURFACE
      ?auto_7359 - PLACE
      ?auto_7349 - HOIST
      ?auto_7360 - SURFACE
      ?auto_7354 - PLACE
      ?auto_7346 - HOIST
      ?auto_7345 - SURFACE
      ?auto_7351 - SURFACE
      ?auto_7353 - SURFACE
      ?auto_7355 - PLACE
      ?auto_7356 - HOIST
      ?auto_7348 - SURFACE
      ?auto_7358 - SURFACE
      ?auto_7352 - PLACE
      ?auto_7347 - HOIST
      ?auto_7350 - SURFACE
      ?auto_7357 - SURFACE
      ?auto_7343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7342 ?auto_7344 ) ( IS-CRATE ?auto_7338 ) ( not ( = ?auto_7340 ?auto_7344 ) ) ( HOIST-AT ?auto_7341 ?auto_7340 ) ( SURFACE-AT ?auto_7338 ?auto_7340 ) ( ON ?auto_7338 ?auto_7339 ) ( CLEAR ?auto_7338 ) ( not ( = ?auto_7335 ?auto_7338 ) ) ( not ( = ?auto_7335 ?auto_7339 ) ) ( not ( = ?auto_7338 ?auto_7339 ) ) ( not ( = ?auto_7342 ?auto_7341 ) ) ( IS-CRATE ?auto_7335 ) ( not ( = ?auto_7359 ?auto_7344 ) ) ( HOIST-AT ?auto_7349 ?auto_7359 ) ( SURFACE-AT ?auto_7335 ?auto_7359 ) ( ON ?auto_7335 ?auto_7360 ) ( CLEAR ?auto_7335 ) ( not ( = ?auto_7336 ?auto_7335 ) ) ( not ( = ?auto_7336 ?auto_7360 ) ) ( not ( = ?auto_7335 ?auto_7360 ) ) ( not ( = ?auto_7342 ?auto_7349 ) ) ( IS-CRATE ?auto_7336 ) ( not ( = ?auto_7354 ?auto_7344 ) ) ( HOIST-AT ?auto_7346 ?auto_7354 ) ( SURFACE-AT ?auto_7336 ?auto_7354 ) ( ON ?auto_7336 ?auto_7345 ) ( CLEAR ?auto_7336 ) ( not ( = ?auto_7337 ?auto_7336 ) ) ( not ( = ?auto_7337 ?auto_7345 ) ) ( not ( = ?auto_7336 ?auto_7345 ) ) ( not ( = ?auto_7342 ?auto_7346 ) ) ( IS-CRATE ?auto_7337 ) ( AVAILABLE ?auto_7349 ) ( SURFACE-AT ?auto_7337 ?auto_7359 ) ( ON ?auto_7337 ?auto_7351 ) ( CLEAR ?auto_7337 ) ( not ( = ?auto_7334 ?auto_7337 ) ) ( not ( = ?auto_7334 ?auto_7351 ) ) ( not ( = ?auto_7337 ?auto_7351 ) ) ( IS-CRATE ?auto_7334 ) ( SURFACE-AT ?auto_7334 ?auto_7340 ) ( ON ?auto_7334 ?auto_7353 ) ( CLEAR ?auto_7334 ) ( not ( = ?auto_7333 ?auto_7334 ) ) ( not ( = ?auto_7333 ?auto_7353 ) ) ( not ( = ?auto_7334 ?auto_7353 ) ) ( IS-CRATE ?auto_7333 ) ( not ( = ?auto_7355 ?auto_7344 ) ) ( HOIST-AT ?auto_7356 ?auto_7355 ) ( AVAILABLE ?auto_7356 ) ( SURFACE-AT ?auto_7333 ?auto_7355 ) ( ON ?auto_7333 ?auto_7348 ) ( CLEAR ?auto_7333 ) ( not ( = ?auto_7332 ?auto_7333 ) ) ( not ( = ?auto_7332 ?auto_7348 ) ) ( not ( = ?auto_7333 ?auto_7348 ) ) ( not ( = ?auto_7342 ?auto_7356 ) ) ( IS-CRATE ?auto_7332 ) ( AVAILABLE ?auto_7346 ) ( SURFACE-AT ?auto_7332 ?auto_7354 ) ( ON ?auto_7332 ?auto_7358 ) ( CLEAR ?auto_7332 ) ( not ( = ?auto_7331 ?auto_7332 ) ) ( not ( = ?auto_7331 ?auto_7358 ) ) ( not ( = ?auto_7332 ?auto_7358 ) ) ( IS-CRATE ?auto_7331 ) ( not ( = ?auto_7352 ?auto_7344 ) ) ( HOIST-AT ?auto_7347 ?auto_7352 ) ( AVAILABLE ?auto_7347 ) ( SURFACE-AT ?auto_7331 ?auto_7352 ) ( ON ?auto_7331 ?auto_7350 ) ( CLEAR ?auto_7331 ) ( not ( = ?auto_7330 ?auto_7331 ) ) ( not ( = ?auto_7330 ?auto_7350 ) ) ( not ( = ?auto_7331 ?auto_7350 ) ) ( not ( = ?auto_7342 ?auto_7347 ) ) ( SURFACE-AT ?auto_7329 ?auto_7344 ) ( CLEAR ?auto_7329 ) ( IS-CRATE ?auto_7330 ) ( AVAILABLE ?auto_7342 ) ( AVAILABLE ?auto_7341 ) ( SURFACE-AT ?auto_7330 ?auto_7340 ) ( ON ?auto_7330 ?auto_7357 ) ( CLEAR ?auto_7330 ) ( TRUCK-AT ?auto_7343 ?auto_7344 ) ( not ( = ?auto_7329 ?auto_7330 ) ) ( not ( = ?auto_7329 ?auto_7357 ) ) ( not ( = ?auto_7330 ?auto_7357 ) ) ( not ( = ?auto_7329 ?auto_7331 ) ) ( not ( = ?auto_7329 ?auto_7350 ) ) ( not ( = ?auto_7331 ?auto_7357 ) ) ( not ( = ?auto_7352 ?auto_7340 ) ) ( not ( = ?auto_7347 ?auto_7341 ) ) ( not ( = ?auto_7350 ?auto_7357 ) ) ( not ( = ?auto_7329 ?auto_7332 ) ) ( not ( = ?auto_7329 ?auto_7358 ) ) ( not ( = ?auto_7330 ?auto_7332 ) ) ( not ( = ?auto_7330 ?auto_7358 ) ) ( not ( = ?auto_7332 ?auto_7350 ) ) ( not ( = ?auto_7332 ?auto_7357 ) ) ( not ( = ?auto_7354 ?auto_7352 ) ) ( not ( = ?auto_7354 ?auto_7340 ) ) ( not ( = ?auto_7346 ?auto_7347 ) ) ( not ( = ?auto_7346 ?auto_7341 ) ) ( not ( = ?auto_7358 ?auto_7350 ) ) ( not ( = ?auto_7358 ?auto_7357 ) ) ( not ( = ?auto_7329 ?auto_7333 ) ) ( not ( = ?auto_7329 ?auto_7348 ) ) ( not ( = ?auto_7330 ?auto_7333 ) ) ( not ( = ?auto_7330 ?auto_7348 ) ) ( not ( = ?auto_7331 ?auto_7333 ) ) ( not ( = ?auto_7331 ?auto_7348 ) ) ( not ( = ?auto_7333 ?auto_7358 ) ) ( not ( = ?auto_7333 ?auto_7350 ) ) ( not ( = ?auto_7333 ?auto_7357 ) ) ( not ( = ?auto_7355 ?auto_7354 ) ) ( not ( = ?auto_7355 ?auto_7352 ) ) ( not ( = ?auto_7355 ?auto_7340 ) ) ( not ( = ?auto_7356 ?auto_7346 ) ) ( not ( = ?auto_7356 ?auto_7347 ) ) ( not ( = ?auto_7356 ?auto_7341 ) ) ( not ( = ?auto_7348 ?auto_7358 ) ) ( not ( = ?auto_7348 ?auto_7350 ) ) ( not ( = ?auto_7348 ?auto_7357 ) ) ( not ( = ?auto_7329 ?auto_7334 ) ) ( not ( = ?auto_7329 ?auto_7353 ) ) ( not ( = ?auto_7330 ?auto_7334 ) ) ( not ( = ?auto_7330 ?auto_7353 ) ) ( not ( = ?auto_7331 ?auto_7334 ) ) ( not ( = ?auto_7331 ?auto_7353 ) ) ( not ( = ?auto_7332 ?auto_7334 ) ) ( not ( = ?auto_7332 ?auto_7353 ) ) ( not ( = ?auto_7334 ?auto_7348 ) ) ( not ( = ?auto_7334 ?auto_7358 ) ) ( not ( = ?auto_7334 ?auto_7350 ) ) ( not ( = ?auto_7334 ?auto_7357 ) ) ( not ( = ?auto_7353 ?auto_7348 ) ) ( not ( = ?auto_7353 ?auto_7358 ) ) ( not ( = ?auto_7353 ?auto_7350 ) ) ( not ( = ?auto_7353 ?auto_7357 ) ) ( not ( = ?auto_7329 ?auto_7337 ) ) ( not ( = ?auto_7329 ?auto_7351 ) ) ( not ( = ?auto_7330 ?auto_7337 ) ) ( not ( = ?auto_7330 ?auto_7351 ) ) ( not ( = ?auto_7331 ?auto_7337 ) ) ( not ( = ?auto_7331 ?auto_7351 ) ) ( not ( = ?auto_7332 ?auto_7337 ) ) ( not ( = ?auto_7332 ?auto_7351 ) ) ( not ( = ?auto_7333 ?auto_7337 ) ) ( not ( = ?auto_7333 ?auto_7351 ) ) ( not ( = ?auto_7337 ?auto_7353 ) ) ( not ( = ?auto_7337 ?auto_7348 ) ) ( not ( = ?auto_7337 ?auto_7358 ) ) ( not ( = ?auto_7337 ?auto_7350 ) ) ( not ( = ?auto_7337 ?auto_7357 ) ) ( not ( = ?auto_7359 ?auto_7340 ) ) ( not ( = ?auto_7359 ?auto_7355 ) ) ( not ( = ?auto_7359 ?auto_7354 ) ) ( not ( = ?auto_7359 ?auto_7352 ) ) ( not ( = ?auto_7349 ?auto_7341 ) ) ( not ( = ?auto_7349 ?auto_7356 ) ) ( not ( = ?auto_7349 ?auto_7346 ) ) ( not ( = ?auto_7349 ?auto_7347 ) ) ( not ( = ?auto_7351 ?auto_7353 ) ) ( not ( = ?auto_7351 ?auto_7348 ) ) ( not ( = ?auto_7351 ?auto_7358 ) ) ( not ( = ?auto_7351 ?auto_7350 ) ) ( not ( = ?auto_7351 ?auto_7357 ) ) ( not ( = ?auto_7329 ?auto_7336 ) ) ( not ( = ?auto_7329 ?auto_7345 ) ) ( not ( = ?auto_7330 ?auto_7336 ) ) ( not ( = ?auto_7330 ?auto_7345 ) ) ( not ( = ?auto_7331 ?auto_7336 ) ) ( not ( = ?auto_7331 ?auto_7345 ) ) ( not ( = ?auto_7332 ?auto_7336 ) ) ( not ( = ?auto_7332 ?auto_7345 ) ) ( not ( = ?auto_7333 ?auto_7336 ) ) ( not ( = ?auto_7333 ?auto_7345 ) ) ( not ( = ?auto_7334 ?auto_7336 ) ) ( not ( = ?auto_7334 ?auto_7345 ) ) ( not ( = ?auto_7336 ?auto_7351 ) ) ( not ( = ?auto_7336 ?auto_7353 ) ) ( not ( = ?auto_7336 ?auto_7348 ) ) ( not ( = ?auto_7336 ?auto_7358 ) ) ( not ( = ?auto_7336 ?auto_7350 ) ) ( not ( = ?auto_7336 ?auto_7357 ) ) ( not ( = ?auto_7345 ?auto_7351 ) ) ( not ( = ?auto_7345 ?auto_7353 ) ) ( not ( = ?auto_7345 ?auto_7348 ) ) ( not ( = ?auto_7345 ?auto_7358 ) ) ( not ( = ?auto_7345 ?auto_7350 ) ) ( not ( = ?auto_7345 ?auto_7357 ) ) ( not ( = ?auto_7329 ?auto_7335 ) ) ( not ( = ?auto_7329 ?auto_7360 ) ) ( not ( = ?auto_7330 ?auto_7335 ) ) ( not ( = ?auto_7330 ?auto_7360 ) ) ( not ( = ?auto_7331 ?auto_7335 ) ) ( not ( = ?auto_7331 ?auto_7360 ) ) ( not ( = ?auto_7332 ?auto_7335 ) ) ( not ( = ?auto_7332 ?auto_7360 ) ) ( not ( = ?auto_7333 ?auto_7335 ) ) ( not ( = ?auto_7333 ?auto_7360 ) ) ( not ( = ?auto_7334 ?auto_7335 ) ) ( not ( = ?auto_7334 ?auto_7360 ) ) ( not ( = ?auto_7337 ?auto_7335 ) ) ( not ( = ?auto_7337 ?auto_7360 ) ) ( not ( = ?auto_7335 ?auto_7345 ) ) ( not ( = ?auto_7335 ?auto_7351 ) ) ( not ( = ?auto_7335 ?auto_7353 ) ) ( not ( = ?auto_7335 ?auto_7348 ) ) ( not ( = ?auto_7335 ?auto_7358 ) ) ( not ( = ?auto_7335 ?auto_7350 ) ) ( not ( = ?auto_7335 ?auto_7357 ) ) ( not ( = ?auto_7360 ?auto_7345 ) ) ( not ( = ?auto_7360 ?auto_7351 ) ) ( not ( = ?auto_7360 ?auto_7353 ) ) ( not ( = ?auto_7360 ?auto_7348 ) ) ( not ( = ?auto_7360 ?auto_7358 ) ) ( not ( = ?auto_7360 ?auto_7350 ) ) ( not ( = ?auto_7360 ?auto_7357 ) ) ( not ( = ?auto_7329 ?auto_7338 ) ) ( not ( = ?auto_7329 ?auto_7339 ) ) ( not ( = ?auto_7330 ?auto_7338 ) ) ( not ( = ?auto_7330 ?auto_7339 ) ) ( not ( = ?auto_7331 ?auto_7338 ) ) ( not ( = ?auto_7331 ?auto_7339 ) ) ( not ( = ?auto_7332 ?auto_7338 ) ) ( not ( = ?auto_7332 ?auto_7339 ) ) ( not ( = ?auto_7333 ?auto_7338 ) ) ( not ( = ?auto_7333 ?auto_7339 ) ) ( not ( = ?auto_7334 ?auto_7338 ) ) ( not ( = ?auto_7334 ?auto_7339 ) ) ( not ( = ?auto_7337 ?auto_7338 ) ) ( not ( = ?auto_7337 ?auto_7339 ) ) ( not ( = ?auto_7336 ?auto_7338 ) ) ( not ( = ?auto_7336 ?auto_7339 ) ) ( not ( = ?auto_7338 ?auto_7360 ) ) ( not ( = ?auto_7338 ?auto_7345 ) ) ( not ( = ?auto_7338 ?auto_7351 ) ) ( not ( = ?auto_7338 ?auto_7353 ) ) ( not ( = ?auto_7338 ?auto_7348 ) ) ( not ( = ?auto_7338 ?auto_7358 ) ) ( not ( = ?auto_7338 ?auto_7350 ) ) ( not ( = ?auto_7338 ?auto_7357 ) ) ( not ( = ?auto_7339 ?auto_7360 ) ) ( not ( = ?auto_7339 ?auto_7345 ) ) ( not ( = ?auto_7339 ?auto_7351 ) ) ( not ( = ?auto_7339 ?auto_7353 ) ) ( not ( = ?auto_7339 ?auto_7348 ) ) ( not ( = ?auto_7339 ?auto_7358 ) ) ( not ( = ?auto_7339 ?auto_7350 ) ) ( not ( = ?auto_7339 ?auto_7357 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_7329 ?auto_7330 ?auto_7331 ?auto_7332 ?auto_7333 ?auto_7334 ?auto_7337 ?auto_7336 ?auto_7335 )
      ( MAKE-1CRATE ?auto_7335 ?auto_7338 )
      ( MAKE-9CRATE-VERIFY ?auto_7329 ?auto_7330 ?auto_7331 ?auto_7332 ?auto_7333 ?auto_7334 ?auto_7337 ?auto_7336 ?auto_7335 ?auto_7338 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7363 - SURFACE
      ?auto_7364 - SURFACE
    )
    :vars
    (
      ?auto_7365 - HOIST
      ?auto_7366 - PLACE
      ?auto_7368 - PLACE
      ?auto_7369 - HOIST
      ?auto_7370 - SURFACE
      ?auto_7367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7365 ?auto_7366 ) ( SURFACE-AT ?auto_7363 ?auto_7366 ) ( CLEAR ?auto_7363 ) ( IS-CRATE ?auto_7364 ) ( AVAILABLE ?auto_7365 ) ( not ( = ?auto_7368 ?auto_7366 ) ) ( HOIST-AT ?auto_7369 ?auto_7368 ) ( AVAILABLE ?auto_7369 ) ( SURFACE-AT ?auto_7364 ?auto_7368 ) ( ON ?auto_7364 ?auto_7370 ) ( CLEAR ?auto_7364 ) ( TRUCK-AT ?auto_7367 ?auto_7366 ) ( not ( = ?auto_7363 ?auto_7364 ) ) ( not ( = ?auto_7363 ?auto_7370 ) ) ( not ( = ?auto_7364 ?auto_7370 ) ) ( not ( = ?auto_7365 ?auto_7369 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7367 ?auto_7366 ?auto_7368 )
      ( !LIFT ?auto_7369 ?auto_7364 ?auto_7370 ?auto_7368 )
      ( !LOAD ?auto_7369 ?auto_7364 ?auto_7367 ?auto_7368 )
      ( !DRIVE ?auto_7367 ?auto_7368 ?auto_7366 )
      ( !UNLOAD ?auto_7365 ?auto_7364 ?auto_7367 ?auto_7366 )
      ( !DROP ?auto_7365 ?auto_7364 ?auto_7363 ?auto_7366 )
      ( MAKE-1CRATE-VERIFY ?auto_7363 ?auto_7364 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_7382 - SURFACE
      ?auto_7383 - SURFACE
      ?auto_7384 - SURFACE
      ?auto_7385 - SURFACE
      ?auto_7386 - SURFACE
      ?auto_7387 - SURFACE
      ?auto_7390 - SURFACE
      ?auto_7389 - SURFACE
      ?auto_7388 - SURFACE
      ?auto_7391 - SURFACE
      ?auto_7392 - SURFACE
    )
    :vars
    (
      ?auto_7394 - HOIST
      ?auto_7397 - PLACE
      ?auto_7396 - PLACE
      ?auto_7395 - HOIST
      ?auto_7398 - SURFACE
      ?auto_7414 - SURFACE
      ?auto_7413 - PLACE
      ?auto_7403 - HOIST
      ?auto_7409 - SURFACE
      ?auto_7405 - PLACE
      ?auto_7415 - HOIST
      ?auto_7401 - SURFACE
      ?auto_7412 - SURFACE
      ?auto_7404 - SURFACE
      ?auto_7399 - PLACE
      ?auto_7408 - HOIST
      ?auto_7411 - SURFACE
      ?auto_7406 - SURFACE
      ?auto_7407 - PLACE
      ?auto_7400 - HOIST
      ?auto_7402 - SURFACE
      ?auto_7410 - SURFACE
      ?auto_7393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7394 ?auto_7397 ) ( IS-CRATE ?auto_7392 ) ( not ( = ?auto_7396 ?auto_7397 ) ) ( HOIST-AT ?auto_7395 ?auto_7396 ) ( SURFACE-AT ?auto_7392 ?auto_7396 ) ( ON ?auto_7392 ?auto_7398 ) ( CLEAR ?auto_7392 ) ( not ( = ?auto_7391 ?auto_7392 ) ) ( not ( = ?auto_7391 ?auto_7398 ) ) ( not ( = ?auto_7392 ?auto_7398 ) ) ( not ( = ?auto_7394 ?auto_7395 ) ) ( IS-CRATE ?auto_7391 ) ( SURFACE-AT ?auto_7391 ?auto_7396 ) ( ON ?auto_7391 ?auto_7414 ) ( CLEAR ?auto_7391 ) ( not ( = ?auto_7388 ?auto_7391 ) ) ( not ( = ?auto_7388 ?auto_7414 ) ) ( not ( = ?auto_7391 ?auto_7414 ) ) ( IS-CRATE ?auto_7388 ) ( not ( = ?auto_7413 ?auto_7397 ) ) ( HOIST-AT ?auto_7403 ?auto_7413 ) ( SURFACE-AT ?auto_7388 ?auto_7413 ) ( ON ?auto_7388 ?auto_7409 ) ( CLEAR ?auto_7388 ) ( not ( = ?auto_7389 ?auto_7388 ) ) ( not ( = ?auto_7389 ?auto_7409 ) ) ( not ( = ?auto_7388 ?auto_7409 ) ) ( not ( = ?auto_7394 ?auto_7403 ) ) ( IS-CRATE ?auto_7389 ) ( not ( = ?auto_7405 ?auto_7397 ) ) ( HOIST-AT ?auto_7415 ?auto_7405 ) ( SURFACE-AT ?auto_7389 ?auto_7405 ) ( ON ?auto_7389 ?auto_7401 ) ( CLEAR ?auto_7389 ) ( not ( = ?auto_7390 ?auto_7389 ) ) ( not ( = ?auto_7390 ?auto_7401 ) ) ( not ( = ?auto_7389 ?auto_7401 ) ) ( not ( = ?auto_7394 ?auto_7415 ) ) ( IS-CRATE ?auto_7390 ) ( AVAILABLE ?auto_7403 ) ( SURFACE-AT ?auto_7390 ?auto_7413 ) ( ON ?auto_7390 ?auto_7412 ) ( CLEAR ?auto_7390 ) ( not ( = ?auto_7387 ?auto_7390 ) ) ( not ( = ?auto_7387 ?auto_7412 ) ) ( not ( = ?auto_7390 ?auto_7412 ) ) ( IS-CRATE ?auto_7387 ) ( SURFACE-AT ?auto_7387 ?auto_7396 ) ( ON ?auto_7387 ?auto_7404 ) ( CLEAR ?auto_7387 ) ( not ( = ?auto_7386 ?auto_7387 ) ) ( not ( = ?auto_7386 ?auto_7404 ) ) ( not ( = ?auto_7387 ?auto_7404 ) ) ( IS-CRATE ?auto_7386 ) ( not ( = ?auto_7399 ?auto_7397 ) ) ( HOIST-AT ?auto_7408 ?auto_7399 ) ( AVAILABLE ?auto_7408 ) ( SURFACE-AT ?auto_7386 ?auto_7399 ) ( ON ?auto_7386 ?auto_7411 ) ( CLEAR ?auto_7386 ) ( not ( = ?auto_7385 ?auto_7386 ) ) ( not ( = ?auto_7385 ?auto_7411 ) ) ( not ( = ?auto_7386 ?auto_7411 ) ) ( not ( = ?auto_7394 ?auto_7408 ) ) ( IS-CRATE ?auto_7385 ) ( AVAILABLE ?auto_7415 ) ( SURFACE-AT ?auto_7385 ?auto_7405 ) ( ON ?auto_7385 ?auto_7406 ) ( CLEAR ?auto_7385 ) ( not ( = ?auto_7384 ?auto_7385 ) ) ( not ( = ?auto_7384 ?auto_7406 ) ) ( not ( = ?auto_7385 ?auto_7406 ) ) ( IS-CRATE ?auto_7384 ) ( not ( = ?auto_7407 ?auto_7397 ) ) ( HOIST-AT ?auto_7400 ?auto_7407 ) ( AVAILABLE ?auto_7400 ) ( SURFACE-AT ?auto_7384 ?auto_7407 ) ( ON ?auto_7384 ?auto_7402 ) ( CLEAR ?auto_7384 ) ( not ( = ?auto_7383 ?auto_7384 ) ) ( not ( = ?auto_7383 ?auto_7402 ) ) ( not ( = ?auto_7384 ?auto_7402 ) ) ( not ( = ?auto_7394 ?auto_7400 ) ) ( SURFACE-AT ?auto_7382 ?auto_7397 ) ( CLEAR ?auto_7382 ) ( IS-CRATE ?auto_7383 ) ( AVAILABLE ?auto_7394 ) ( AVAILABLE ?auto_7395 ) ( SURFACE-AT ?auto_7383 ?auto_7396 ) ( ON ?auto_7383 ?auto_7410 ) ( CLEAR ?auto_7383 ) ( TRUCK-AT ?auto_7393 ?auto_7397 ) ( not ( = ?auto_7382 ?auto_7383 ) ) ( not ( = ?auto_7382 ?auto_7410 ) ) ( not ( = ?auto_7383 ?auto_7410 ) ) ( not ( = ?auto_7382 ?auto_7384 ) ) ( not ( = ?auto_7382 ?auto_7402 ) ) ( not ( = ?auto_7384 ?auto_7410 ) ) ( not ( = ?auto_7407 ?auto_7396 ) ) ( not ( = ?auto_7400 ?auto_7395 ) ) ( not ( = ?auto_7402 ?auto_7410 ) ) ( not ( = ?auto_7382 ?auto_7385 ) ) ( not ( = ?auto_7382 ?auto_7406 ) ) ( not ( = ?auto_7383 ?auto_7385 ) ) ( not ( = ?auto_7383 ?auto_7406 ) ) ( not ( = ?auto_7385 ?auto_7402 ) ) ( not ( = ?auto_7385 ?auto_7410 ) ) ( not ( = ?auto_7405 ?auto_7407 ) ) ( not ( = ?auto_7405 ?auto_7396 ) ) ( not ( = ?auto_7415 ?auto_7400 ) ) ( not ( = ?auto_7415 ?auto_7395 ) ) ( not ( = ?auto_7406 ?auto_7402 ) ) ( not ( = ?auto_7406 ?auto_7410 ) ) ( not ( = ?auto_7382 ?auto_7386 ) ) ( not ( = ?auto_7382 ?auto_7411 ) ) ( not ( = ?auto_7383 ?auto_7386 ) ) ( not ( = ?auto_7383 ?auto_7411 ) ) ( not ( = ?auto_7384 ?auto_7386 ) ) ( not ( = ?auto_7384 ?auto_7411 ) ) ( not ( = ?auto_7386 ?auto_7406 ) ) ( not ( = ?auto_7386 ?auto_7402 ) ) ( not ( = ?auto_7386 ?auto_7410 ) ) ( not ( = ?auto_7399 ?auto_7405 ) ) ( not ( = ?auto_7399 ?auto_7407 ) ) ( not ( = ?auto_7399 ?auto_7396 ) ) ( not ( = ?auto_7408 ?auto_7415 ) ) ( not ( = ?auto_7408 ?auto_7400 ) ) ( not ( = ?auto_7408 ?auto_7395 ) ) ( not ( = ?auto_7411 ?auto_7406 ) ) ( not ( = ?auto_7411 ?auto_7402 ) ) ( not ( = ?auto_7411 ?auto_7410 ) ) ( not ( = ?auto_7382 ?auto_7387 ) ) ( not ( = ?auto_7382 ?auto_7404 ) ) ( not ( = ?auto_7383 ?auto_7387 ) ) ( not ( = ?auto_7383 ?auto_7404 ) ) ( not ( = ?auto_7384 ?auto_7387 ) ) ( not ( = ?auto_7384 ?auto_7404 ) ) ( not ( = ?auto_7385 ?auto_7387 ) ) ( not ( = ?auto_7385 ?auto_7404 ) ) ( not ( = ?auto_7387 ?auto_7411 ) ) ( not ( = ?auto_7387 ?auto_7406 ) ) ( not ( = ?auto_7387 ?auto_7402 ) ) ( not ( = ?auto_7387 ?auto_7410 ) ) ( not ( = ?auto_7404 ?auto_7411 ) ) ( not ( = ?auto_7404 ?auto_7406 ) ) ( not ( = ?auto_7404 ?auto_7402 ) ) ( not ( = ?auto_7404 ?auto_7410 ) ) ( not ( = ?auto_7382 ?auto_7390 ) ) ( not ( = ?auto_7382 ?auto_7412 ) ) ( not ( = ?auto_7383 ?auto_7390 ) ) ( not ( = ?auto_7383 ?auto_7412 ) ) ( not ( = ?auto_7384 ?auto_7390 ) ) ( not ( = ?auto_7384 ?auto_7412 ) ) ( not ( = ?auto_7385 ?auto_7390 ) ) ( not ( = ?auto_7385 ?auto_7412 ) ) ( not ( = ?auto_7386 ?auto_7390 ) ) ( not ( = ?auto_7386 ?auto_7412 ) ) ( not ( = ?auto_7390 ?auto_7404 ) ) ( not ( = ?auto_7390 ?auto_7411 ) ) ( not ( = ?auto_7390 ?auto_7406 ) ) ( not ( = ?auto_7390 ?auto_7402 ) ) ( not ( = ?auto_7390 ?auto_7410 ) ) ( not ( = ?auto_7413 ?auto_7396 ) ) ( not ( = ?auto_7413 ?auto_7399 ) ) ( not ( = ?auto_7413 ?auto_7405 ) ) ( not ( = ?auto_7413 ?auto_7407 ) ) ( not ( = ?auto_7403 ?auto_7395 ) ) ( not ( = ?auto_7403 ?auto_7408 ) ) ( not ( = ?auto_7403 ?auto_7415 ) ) ( not ( = ?auto_7403 ?auto_7400 ) ) ( not ( = ?auto_7412 ?auto_7404 ) ) ( not ( = ?auto_7412 ?auto_7411 ) ) ( not ( = ?auto_7412 ?auto_7406 ) ) ( not ( = ?auto_7412 ?auto_7402 ) ) ( not ( = ?auto_7412 ?auto_7410 ) ) ( not ( = ?auto_7382 ?auto_7389 ) ) ( not ( = ?auto_7382 ?auto_7401 ) ) ( not ( = ?auto_7383 ?auto_7389 ) ) ( not ( = ?auto_7383 ?auto_7401 ) ) ( not ( = ?auto_7384 ?auto_7389 ) ) ( not ( = ?auto_7384 ?auto_7401 ) ) ( not ( = ?auto_7385 ?auto_7389 ) ) ( not ( = ?auto_7385 ?auto_7401 ) ) ( not ( = ?auto_7386 ?auto_7389 ) ) ( not ( = ?auto_7386 ?auto_7401 ) ) ( not ( = ?auto_7387 ?auto_7389 ) ) ( not ( = ?auto_7387 ?auto_7401 ) ) ( not ( = ?auto_7389 ?auto_7412 ) ) ( not ( = ?auto_7389 ?auto_7404 ) ) ( not ( = ?auto_7389 ?auto_7411 ) ) ( not ( = ?auto_7389 ?auto_7406 ) ) ( not ( = ?auto_7389 ?auto_7402 ) ) ( not ( = ?auto_7389 ?auto_7410 ) ) ( not ( = ?auto_7401 ?auto_7412 ) ) ( not ( = ?auto_7401 ?auto_7404 ) ) ( not ( = ?auto_7401 ?auto_7411 ) ) ( not ( = ?auto_7401 ?auto_7406 ) ) ( not ( = ?auto_7401 ?auto_7402 ) ) ( not ( = ?auto_7401 ?auto_7410 ) ) ( not ( = ?auto_7382 ?auto_7388 ) ) ( not ( = ?auto_7382 ?auto_7409 ) ) ( not ( = ?auto_7383 ?auto_7388 ) ) ( not ( = ?auto_7383 ?auto_7409 ) ) ( not ( = ?auto_7384 ?auto_7388 ) ) ( not ( = ?auto_7384 ?auto_7409 ) ) ( not ( = ?auto_7385 ?auto_7388 ) ) ( not ( = ?auto_7385 ?auto_7409 ) ) ( not ( = ?auto_7386 ?auto_7388 ) ) ( not ( = ?auto_7386 ?auto_7409 ) ) ( not ( = ?auto_7387 ?auto_7388 ) ) ( not ( = ?auto_7387 ?auto_7409 ) ) ( not ( = ?auto_7390 ?auto_7388 ) ) ( not ( = ?auto_7390 ?auto_7409 ) ) ( not ( = ?auto_7388 ?auto_7401 ) ) ( not ( = ?auto_7388 ?auto_7412 ) ) ( not ( = ?auto_7388 ?auto_7404 ) ) ( not ( = ?auto_7388 ?auto_7411 ) ) ( not ( = ?auto_7388 ?auto_7406 ) ) ( not ( = ?auto_7388 ?auto_7402 ) ) ( not ( = ?auto_7388 ?auto_7410 ) ) ( not ( = ?auto_7409 ?auto_7401 ) ) ( not ( = ?auto_7409 ?auto_7412 ) ) ( not ( = ?auto_7409 ?auto_7404 ) ) ( not ( = ?auto_7409 ?auto_7411 ) ) ( not ( = ?auto_7409 ?auto_7406 ) ) ( not ( = ?auto_7409 ?auto_7402 ) ) ( not ( = ?auto_7409 ?auto_7410 ) ) ( not ( = ?auto_7382 ?auto_7391 ) ) ( not ( = ?auto_7382 ?auto_7414 ) ) ( not ( = ?auto_7383 ?auto_7391 ) ) ( not ( = ?auto_7383 ?auto_7414 ) ) ( not ( = ?auto_7384 ?auto_7391 ) ) ( not ( = ?auto_7384 ?auto_7414 ) ) ( not ( = ?auto_7385 ?auto_7391 ) ) ( not ( = ?auto_7385 ?auto_7414 ) ) ( not ( = ?auto_7386 ?auto_7391 ) ) ( not ( = ?auto_7386 ?auto_7414 ) ) ( not ( = ?auto_7387 ?auto_7391 ) ) ( not ( = ?auto_7387 ?auto_7414 ) ) ( not ( = ?auto_7390 ?auto_7391 ) ) ( not ( = ?auto_7390 ?auto_7414 ) ) ( not ( = ?auto_7389 ?auto_7391 ) ) ( not ( = ?auto_7389 ?auto_7414 ) ) ( not ( = ?auto_7391 ?auto_7409 ) ) ( not ( = ?auto_7391 ?auto_7401 ) ) ( not ( = ?auto_7391 ?auto_7412 ) ) ( not ( = ?auto_7391 ?auto_7404 ) ) ( not ( = ?auto_7391 ?auto_7411 ) ) ( not ( = ?auto_7391 ?auto_7406 ) ) ( not ( = ?auto_7391 ?auto_7402 ) ) ( not ( = ?auto_7391 ?auto_7410 ) ) ( not ( = ?auto_7414 ?auto_7409 ) ) ( not ( = ?auto_7414 ?auto_7401 ) ) ( not ( = ?auto_7414 ?auto_7412 ) ) ( not ( = ?auto_7414 ?auto_7404 ) ) ( not ( = ?auto_7414 ?auto_7411 ) ) ( not ( = ?auto_7414 ?auto_7406 ) ) ( not ( = ?auto_7414 ?auto_7402 ) ) ( not ( = ?auto_7414 ?auto_7410 ) ) ( not ( = ?auto_7382 ?auto_7392 ) ) ( not ( = ?auto_7382 ?auto_7398 ) ) ( not ( = ?auto_7383 ?auto_7392 ) ) ( not ( = ?auto_7383 ?auto_7398 ) ) ( not ( = ?auto_7384 ?auto_7392 ) ) ( not ( = ?auto_7384 ?auto_7398 ) ) ( not ( = ?auto_7385 ?auto_7392 ) ) ( not ( = ?auto_7385 ?auto_7398 ) ) ( not ( = ?auto_7386 ?auto_7392 ) ) ( not ( = ?auto_7386 ?auto_7398 ) ) ( not ( = ?auto_7387 ?auto_7392 ) ) ( not ( = ?auto_7387 ?auto_7398 ) ) ( not ( = ?auto_7390 ?auto_7392 ) ) ( not ( = ?auto_7390 ?auto_7398 ) ) ( not ( = ?auto_7389 ?auto_7392 ) ) ( not ( = ?auto_7389 ?auto_7398 ) ) ( not ( = ?auto_7388 ?auto_7392 ) ) ( not ( = ?auto_7388 ?auto_7398 ) ) ( not ( = ?auto_7392 ?auto_7414 ) ) ( not ( = ?auto_7392 ?auto_7409 ) ) ( not ( = ?auto_7392 ?auto_7401 ) ) ( not ( = ?auto_7392 ?auto_7412 ) ) ( not ( = ?auto_7392 ?auto_7404 ) ) ( not ( = ?auto_7392 ?auto_7411 ) ) ( not ( = ?auto_7392 ?auto_7406 ) ) ( not ( = ?auto_7392 ?auto_7402 ) ) ( not ( = ?auto_7392 ?auto_7410 ) ) ( not ( = ?auto_7398 ?auto_7414 ) ) ( not ( = ?auto_7398 ?auto_7409 ) ) ( not ( = ?auto_7398 ?auto_7401 ) ) ( not ( = ?auto_7398 ?auto_7412 ) ) ( not ( = ?auto_7398 ?auto_7404 ) ) ( not ( = ?auto_7398 ?auto_7411 ) ) ( not ( = ?auto_7398 ?auto_7406 ) ) ( not ( = ?auto_7398 ?auto_7402 ) ) ( not ( = ?auto_7398 ?auto_7410 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_7382 ?auto_7383 ?auto_7384 ?auto_7385 ?auto_7386 ?auto_7387 ?auto_7390 ?auto_7389 ?auto_7388 ?auto_7391 )
      ( MAKE-1CRATE ?auto_7391 ?auto_7392 )
      ( MAKE-10CRATE-VERIFY ?auto_7382 ?auto_7383 ?auto_7384 ?auto_7385 ?auto_7386 ?auto_7387 ?auto_7390 ?auto_7389 ?auto_7388 ?auto_7391 ?auto_7392 ) )
  )

)

