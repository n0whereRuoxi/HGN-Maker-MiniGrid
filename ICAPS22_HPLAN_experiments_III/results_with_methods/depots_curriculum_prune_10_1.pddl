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
      ?auto_7064 - PLACE
      ?auto_7060 - PLACE
      ?auto_7062 - HOIST
      ?auto_7059 - SURFACE
      ?auto_7066 - PLACE
      ?auto_7067 - HOIST
      ?auto_7065 - SURFACE
      ?auto_7063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7061 ?auto_7064 ) ( IS-CRATE ?auto_7058 ) ( not ( = ?auto_7060 ?auto_7064 ) ) ( HOIST-AT ?auto_7062 ?auto_7060 ) ( AVAILABLE ?auto_7062 ) ( SURFACE-AT ?auto_7058 ?auto_7060 ) ( ON ?auto_7058 ?auto_7059 ) ( CLEAR ?auto_7058 ) ( not ( = ?auto_7057 ?auto_7058 ) ) ( not ( = ?auto_7057 ?auto_7059 ) ) ( not ( = ?auto_7058 ?auto_7059 ) ) ( not ( = ?auto_7061 ?auto_7062 ) ) ( SURFACE-AT ?auto_7056 ?auto_7064 ) ( CLEAR ?auto_7056 ) ( IS-CRATE ?auto_7057 ) ( AVAILABLE ?auto_7061 ) ( not ( = ?auto_7066 ?auto_7064 ) ) ( HOIST-AT ?auto_7067 ?auto_7066 ) ( AVAILABLE ?auto_7067 ) ( SURFACE-AT ?auto_7057 ?auto_7066 ) ( ON ?auto_7057 ?auto_7065 ) ( CLEAR ?auto_7057 ) ( TRUCK-AT ?auto_7063 ?auto_7064 ) ( not ( = ?auto_7056 ?auto_7057 ) ) ( not ( = ?auto_7056 ?auto_7065 ) ) ( not ( = ?auto_7057 ?auto_7065 ) ) ( not ( = ?auto_7061 ?auto_7067 ) ) ( not ( = ?auto_7056 ?auto_7058 ) ) ( not ( = ?auto_7056 ?auto_7059 ) ) ( not ( = ?auto_7058 ?auto_7065 ) ) ( not ( = ?auto_7060 ?auto_7066 ) ) ( not ( = ?auto_7062 ?auto_7067 ) ) ( not ( = ?auto_7059 ?auto_7065 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7056 ?auto_7057 )
      ( MAKE-1CRATE ?auto_7057 ?auto_7058 )
      ( MAKE-2CRATE-VERIFY ?auto_7056 ?auto_7057 ?auto_7058 ) )
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
      ?auto_7090 - HOIST
      ?auto_7087 - PLACE
      ?auto_7088 - PLACE
      ?auto_7089 - HOIST
      ?auto_7091 - SURFACE
      ?auto_7094 - PLACE
      ?auto_7093 - HOIST
      ?auto_7092 - SURFACE
      ?auto_7097 - PLACE
      ?auto_7096 - HOIST
      ?auto_7095 - SURFACE
      ?auto_7086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7090 ?auto_7087 ) ( IS-CRATE ?auto_7085 ) ( not ( = ?auto_7088 ?auto_7087 ) ) ( HOIST-AT ?auto_7089 ?auto_7088 ) ( AVAILABLE ?auto_7089 ) ( SURFACE-AT ?auto_7085 ?auto_7088 ) ( ON ?auto_7085 ?auto_7091 ) ( CLEAR ?auto_7085 ) ( not ( = ?auto_7084 ?auto_7085 ) ) ( not ( = ?auto_7084 ?auto_7091 ) ) ( not ( = ?auto_7085 ?auto_7091 ) ) ( not ( = ?auto_7090 ?auto_7089 ) ) ( IS-CRATE ?auto_7084 ) ( not ( = ?auto_7094 ?auto_7087 ) ) ( HOIST-AT ?auto_7093 ?auto_7094 ) ( AVAILABLE ?auto_7093 ) ( SURFACE-AT ?auto_7084 ?auto_7094 ) ( ON ?auto_7084 ?auto_7092 ) ( CLEAR ?auto_7084 ) ( not ( = ?auto_7083 ?auto_7084 ) ) ( not ( = ?auto_7083 ?auto_7092 ) ) ( not ( = ?auto_7084 ?auto_7092 ) ) ( not ( = ?auto_7090 ?auto_7093 ) ) ( SURFACE-AT ?auto_7082 ?auto_7087 ) ( CLEAR ?auto_7082 ) ( IS-CRATE ?auto_7083 ) ( AVAILABLE ?auto_7090 ) ( not ( = ?auto_7097 ?auto_7087 ) ) ( HOIST-AT ?auto_7096 ?auto_7097 ) ( AVAILABLE ?auto_7096 ) ( SURFACE-AT ?auto_7083 ?auto_7097 ) ( ON ?auto_7083 ?auto_7095 ) ( CLEAR ?auto_7083 ) ( TRUCK-AT ?auto_7086 ?auto_7087 ) ( not ( = ?auto_7082 ?auto_7083 ) ) ( not ( = ?auto_7082 ?auto_7095 ) ) ( not ( = ?auto_7083 ?auto_7095 ) ) ( not ( = ?auto_7090 ?auto_7096 ) ) ( not ( = ?auto_7082 ?auto_7084 ) ) ( not ( = ?auto_7082 ?auto_7092 ) ) ( not ( = ?auto_7084 ?auto_7095 ) ) ( not ( = ?auto_7094 ?auto_7097 ) ) ( not ( = ?auto_7093 ?auto_7096 ) ) ( not ( = ?auto_7092 ?auto_7095 ) ) ( not ( = ?auto_7082 ?auto_7085 ) ) ( not ( = ?auto_7082 ?auto_7091 ) ) ( not ( = ?auto_7083 ?auto_7085 ) ) ( not ( = ?auto_7083 ?auto_7091 ) ) ( not ( = ?auto_7085 ?auto_7092 ) ) ( not ( = ?auto_7085 ?auto_7095 ) ) ( not ( = ?auto_7088 ?auto_7094 ) ) ( not ( = ?auto_7088 ?auto_7097 ) ) ( not ( = ?auto_7089 ?auto_7093 ) ) ( not ( = ?auto_7089 ?auto_7096 ) ) ( not ( = ?auto_7091 ?auto_7092 ) ) ( not ( = ?auto_7091 ?auto_7095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7082 ?auto_7083 ?auto_7084 )
      ( MAKE-1CRATE ?auto_7084 ?auto_7085 )
      ( MAKE-3CRATE-VERIFY ?auto_7082 ?auto_7083 ?auto_7084 ?auto_7085 ) )
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
      ?auto_7118 - HOIST
      ?auto_7122 - PLACE
      ?auto_7119 - PLACE
      ?auto_7120 - HOIST
      ?auto_7123 - SURFACE
      ?auto_7124 - PLACE
      ?auto_7131 - HOIST
      ?auto_7130 - SURFACE
      ?auto_7132 - PLACE
      ?auto_7125 - HOIST
      ?auto_7128 - SURFACE
      ?auto_7129 - PLACE
      ?auto_7127 - HOIST
      ?auto_7126 - SURFACE
      ?auto_7121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7118 ?auto_7122 ) ( IS-CRATE ?auto_7117 ) ( not ( = ?auto_7119 ?auto_7122 ) ) ( HOIST-AT ?auto_7120 ?auto_7119 ) ( AVAILABLE ?auto_7120 ) ( SURFACE-AT ?auto_7117 ?auto_7119 ) ( ON ?auto_7117 ?auto_7123 ) ( CLEAR ?auto_7117 ) ( not ( = ?auto_7116 ?auto_7117 ) ) ( not ( = ?auto_7116 ?auto_7123 ) ) ( not ( = ?auto_7117 ?auto_7123 ) ) ( not ( = ?auto_7118 ?auto_7120 ) ) ( IS-CRATE ?auto_7116 ) ( not ( = ?auto_7124 ?auto_7122 ) ) ( HOIST-AT ?auto_7131 ?auto_7124 ) ( AVAILABLE ?auto_7131 ) ( SURFACE-AT ?auto_7116 ?auto_7124 ) ( ON ?auto_7116 ?auto_7130 ) ( CLEAR ?auto_7116 ) ( not ( = ?auto_7115 ?auto_7116 ) ) ( not ( = ?auto_7115 ?auto_7130 ) ) ( not ( = ?auto_7116 ?auto_7130 ) ) ( not ( = ?auto_7118 ?auto_7131 ) ) ( IS-CRATE ?auto_7115 ) ( not ( = ?auto_7132 ?auto_7122 ) ) ( HOIST-AT ?auto_7125 ?auto_7132 ) ( AVAILABLE ?auto_7125 ) ( SURFACE-AT ?auto_7115 ?auto_7132 ) ( ON ?auto_7115 ?auto_7128 ) ( CLEAR ?auto_7115 ) ( not ( = ?auto_7114 ?auto_7115 ) ) ( not ( = ?auto_7114 ?auto_7128 ) ) ( not ( = ?auto_7115 ?auto_7128 ) ) ( not ( = ?auto_7118 ?auto_7125 ) ) ( SURFACE-AT ?auto_7113 ?auto_7122 ) ( CLEAR ?auto_7113 ) ( IS-CRATE ?auto_7114 ) ( AVAILABLE ?auto_7118 ) ( not ( = ?auto_7129 ?auto_7122 ) ) ( HOIST-AT ?auto_7127 ?auto_7129 ) ( AVAILABLE ?auto_7127 ) ( SURFACE-AT ?auto_7114 ?auto_7129 ) ( ON ?auto_7114 ?auto_7126 ) ( CLEAR ?auto_7114 ) ( TRUCK-AT ?auto_7121 ?auto_7122 ) ( not ( = ?auto_7113 ?auto_7114 ) ) ( not ( = ?auto_7113 ?auto_7126 ) ) ( not ( = ?auto_7114 ?auto_7126 ) ) ( not ( = ?auto_7118 ?auto_7127 ) ) ( not ( = ?auto_7113 ?auto_7115 ) ) ( not ( = ?auto_7113 ?auto_7128 ) ) ( not ( = ?auto_7115 ?auto_7126 ) ) ( not ( = ?auto_7132 ?auto_7129 ) ) ( not ( = ?auto_7125 ?auto_7127 ) ) ( not ( = ?auto_7128 ?auto_7126 ) ) ( not ( = ?auto_7113 ?auto_7116 ) ) ( not ( = ?auto_7113 ?auto_7130 ) ) ( not ( = ?auto_7114 ?auto_7116 ) ) ( not ( = ?auto_7114 ?auto_7130 ) ) ( not ( = ?auto_7116 ?auto_7128 ) ) ( not ( = ?auto_7116 ?auto_7126 ) ) ( not ( = ?auto_7124 ?auto_7132 ) ) ( not ( = ?auto_7124 ?auto_7129 ) ) ( not ( = ?auto_7131 ?auto_7125 ) ) ( not ( = ?auto_7131 ?auto_7127 ) ) ( not ( = ?auto_7130 ?auto_7128 ) ) ( not ( = ?auto_7130 ?auto_7126 ) ) ( not ( = ?auto_7113 ?auto_7117 ) ) ( not ( = ?auto_7113 ?auto_7123 ) ) ( not ( = ?auto_7114 ?auto_7117 ) ) ( not ( = ?auto_7114 ?auto_7123 ) ) ( not ( = ?auto_7115 ?auto_7117 ) ) ( not ( = ?auto_7115 ?auto_7123 ) ) ( not ( = ?auto_7117 ?auto_7130 ) ) ( not ( = ?auto_7117 ?auto_7128 ) ) ( not ( = ?auto_7117 ?auto_7126 ) ) ( not ( = ?auto_7119 ?auto_7124 ) ) ( not ( = ?auto_7119 ?auto_7132 ) ) ( not ( = ?auto_7119 ?auto_7129 ) ) ( not ( = ?auto_7120 ?auto_7131 ) ) ( not ( = ?auto_7120 ?auto_7125 ) ) ( not ( = ?auto_7120 ?auto_7127 ) ) ( not ( = ?auto_7123 ?auto_7130 ) ) ( not ( = ?auto_7123 ?auto_7128 ) ) ( not ( = ?auto_7123 ?auto_7126 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7113 ?auto_7114 ?auto_7115 ?auto_7116 )
      ( MAKE-1CRATE ?auto_7116 ?auto_7117 )
      ( MAKE-4CRATE-VERIFY ?auto_7113 ?auto_7114 ?auto_7115 ?auto_7116 ?auto_7117 ) )
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
      ?auto_7157 - HOIST
      ?auto_7156 - PLACE
      ?auto_7160 - PLACE
      ?auto_7155 - HOIST
      ?auto_7159 - SURFACE
      ?auto_7161 - PLACE
      ?auto_7163 - HOIST
      ?auto_7165 - SURFACE
      ?auto_7169 - PLACE
      ?auto_7162 - HOIST
      ?auto_7164 - SURFACE
      ?auto_7166 - PLACE
      ?auto_7168 - HOIST
      ?auto_7170 - SURFACE
      ?auto_7167 - SURFACE
      ?auto_7158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7157 ?auto_7156 ) ( IS-CRATE ?auto_7154 ) ( not ( = ?auto_7160 ?auto_7156 ) ) ( HOIST-AT ?auto_7155 ?auto_7160 ) ( SURFACE-AT ?auto_7154 ?auto_7160 ) ( ON ?auto_7154 ?auto_7159 ) ( CLEAR ?auto_7154 ) ( not ( = ?auto_7153 ?auto_7154 ) ) ( not ( = ?auto_7153 ?auto_7159 ) ) ( not ( = ?auto_7154 ?auto_7159 ) ) ( not ( = ?auto_7157 ?auto_7155 ) ) ( IS-CRATE ?auto_7153 ) ( not ( = ?auto_7161 ?auto_7156 ) ) ( HOIST-AT ?auto_7163 ?auto_7161 ) ( AVAILABLE ?auto_7163 ) ( SURFACE-AT ?auto_7153 ?auto_7161 ) ( ON ?auto_7153 ?auto_7165 ) ( CLEAR ?auto_7153 ) ( not ( = ?auto_7152 ?auto_7153 ) ) ( not ( = ?auto_7152 ?auto_7165 ) ) ( not ( = ?auto_7153 ?auto_7165 ) ) ( not ( = ?auto_7157 ?auto_7163 ) ) ( IS-CRATE ?auto_7152 ) ( not ( = ?auto_7169 ?auto_7156 ) ) ( HOIST-AT ?auto_7162 ?auto_7169 ) ( AVAILABLE ?auto_7162 ) ( SURFACE-AT ?auto_7152 ?auto_7169 ) ( ON ?auto_7152 ?auto_7164 ) ( CLEAR ?auto_7152 ) ( not ( = ?auto_7151 ?auto_7152 ) ) ( not ( = ?auto_7151 ?auto_7164 ) ) ( not ( = ?auto_7152 ?auto_7164 ) ) ( not ( = ?auto_7157 ?auto_7162 ) ) ( IS-CRATE ?auto_7151 ) ( not ( = ?auto_7166 ?auto_7156 ) ) ( HOIST-AT ?auto_7168 ?auto_7166 ) ( AVAILABLE ?auto_7168 ) ( SURFACE-AT ?auto_7151 ?auto_7166 ) ( ON ?auto_7151 ?auto_7170 ) ( CLEAR ?auto_7151 ) ( not ( = ?auto_7150 ?auto_7151 ) ) ( not ( = ?auto_7150 ?auto_7170 ) ) ( not ( = ?auto_7151 ?auto_7170 ) ) ( not ( = ?auto_7157 ?auto_7168 ) ) ( SURFACE-AT ?auto_7149 ?auto_7156 ) ( CLEAR ?auto_7149 ) ( IS-CRATE ?auto_7150 ) ( AVAILABLE ?auto_7157 ) ( AVAILABLE ?auto_7155 ) ( SURFACE-AT ?auto_7150 ?auto_7160 ) ( ON ?auto_7150 ?auto_7167 ) ( CLEAR ?auto_7150 ) ( TRUCK-AT ?auto_7158 ?auto_7156 ) ( not ( = ?auto_7149 ?auto_7150 ) ) ( not ( = ?auto_7149 ?auto_7167 ) ) ( not ( = ?auto_7150 ?auto_7167 ) ) ( not ( = ?auto_7149 ?auto_7151 ) ) ( not ( = ?auto_7149 ?auto_7170 ) ) ( not ( = ?auto_7151 ?auto_7167 ) ) ( not ( = ?auto_7166 ?auto_7160 ) ) ( not ( = ?auto_7168 ?auto_7155 ) ) ( not ( = ?auto_7170 ?auto_7167 ) ) ( not ( = ?auto_7149 ?auto_7152 ) ) ( not ( = ?auto_7149 ?auto_7164 ) ) ( not ( = ?auto_7150 ?auto_7152 ) ) ( not ( = ?auto_7150 ?auto_7164 ) ) ( not ( = ?auto_7152 ?auto_7170 ) ) ( not ( = ?auto_7152 ?auto_7167 ) ) ( not ( = ?auto_7169 ?auto_7166 ) ) ( not ( = ?auto_7169 ?auto_7160 ) ) ( not ( = ?auto_7162 ?auto_7168 ) ) ( not ( = ?auto_7162 ?auto_7155 ) ) ( not ( = ?auto_7164 ?auto_7170 ) ) ( not ( = ?auto_7164 ?auto_7167 ) ) ( not ( = ?auto_7149 ?auto_7153 ) ) ( not ( = ?auto_7149 ?auto_7165 ) ) ( not ( = ?auto_7150 ?auto_7153 ) ) ( not ( = ?auto_7150 ?auto_7165 ) ) ( not ( = ?auto_7151 ?auto_7153 ) ) ( not ( = ?auto_7151 ?auto_7165 ) ) ( not ( = ?auto_7153 ?auto_7164 ) ) ( not ( = ?auto_7153 ?auto_7170 ) ) ( not ( = ?auto_7153 ?auto_7167 ) ) ( not ( = ?auto_7161 ?auto_7169 ) ) ( not ( = ?auto_7161 ?auto_7166 ) ) ( not ( = ?auto_7161 ?auto_7160 ) ) ( not ( = ?auto_7163 ?auto_7162 ) ) ( not ( = ?auto_7163 ?auto_7168 ) ) ( not ( = ?auto_7163 ?auto_7155 ) ) ( not ( = ?auto_7165 ?auto_7164 ) ) ( not ( = ?auto_7165 ?auto_7170 ) ) ( not ( = ?auto_7165 ?auto_7167 ) ) ( not ( = ?auto_7149 ?auto_7154 ) ) ( not ( = ?auto_7149 ?auto_7159 ) ) ( not ( = ?auto_7150 ?auto_7154 ) ) ( not ( = ?auto_7150 ?auto_7159 ) ) ( not ( = ?auto_7151 ?auto_7154 ) ) ( not ( = ?auto_7151 ?auto_7159 ) ) ( not ( = ?auto_7152 ?auto_7154 ) ) ( not ( = ?auto_7152 ?auto_7159 ) ) ( not ( = ?auto_7154 ?auto_7165 ) ) ( not ( = ?auto_7154 ?auto_7164 ) ) ( not ( = ?auto_7154 ?auto_7170 ) ) ( not ( = ?auto_7154 ?auto_7167 ) ) ( not ( = ?auto_7159 ?auto_7165 ) ) ( not ( = ?auto_7159 ?auto_7164 ) ) ( not ( = ?auto_7159 ?auto_7170 ) ) ( not ( = ?auto_7159 ?auto_7167 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7149 ?auto_7150 ?auto_7151 ?auto_7152 ?auto_7153 )
      ( MAKE-1CRATE ?auto_7153 ?auto_7154 )
      ( MAKE-5CRATE-VERIFY ?auto_7149 ?auto_7150 ?auto_7151 ?auto_7152 ?auto_7153 ?auto_7154 ) )
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
      ?auto_7199 - HOIST
      ?auto_7200 - PLACE
      ?auto_7198 - PLACE
      ?auto_7197 - HOIST
      ?auto_7195 - SURFACE
      ?auto_7203 - PLACE
      ?auto_7204 - HOIST
      ?auto_7205 - SURFACE
      ?auto_7207 - PLACE
      ?auto_7206 - HOIST
      ?auto_7211 - SURFACE
      ?auto_7212 - PLACE
      ?auto_7208 - HOIST
      ?auto_7209 - SURFACE
      ?auto_7210 - PLACE
      ?auto_7202 - HOIST
      ?auto_7213 - SURFACE
      ?auto_7201 - SURFACE
      ?auto_7196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7199 ?auto_7200 ) ( IS-CRATE ?auto_7194 ) ( not ( = ?auto_7198 ?auto_7200 ) ) ( HOIST-AT ?auto_7197 ?auto_7198 ) ( AVAILABLE ?auto_7197 ) ( SURFACE-AT ?auto_7194 ?auto_7198 ) ( ON ?auto_7194 ?auto_7195 ) ( CLEAR ?auto_7194 ) ( not ( = ?auto_7193 ?auto_7194 ) ) ( not ( = ?auto_7193 ?auto_7195 ) ) ( not ( = ?auto_7194 ?auto_7195 ) ) ( not ( = ?auto_7199 ?auto_7197 ) ) ( IS-CRATE ?auto_7193 ) ( not ( = ?auto_7203 ?auto_7200 ) ) ( HOIST-AT ?auto_7204 ?auto_7203 ) ( SURFACE-AT ?auto_7193 ?auto_7203 ) ( ON ?auto_7193 ?auto_7205 ) ( CLEAR ?auto_7193 ) ( not ( = ?auto_7192 ?auto_7193 ) ) ( not ( = ?auto_7192 ?auto_7205 ) ) ( not ( = ?auto_7193 ?auto_7205 ) ) ( not ( = ?auto_7199 ?auto_7204 ) ) ( IS-CRATE ?auto_7192 ) ( not ( = ?auto_7207 ?auto_7200 ) ) ( HOIST-AT ?auto_7206 ?auto_7207 ) ( AVAILABLE ?auto_7206 ) ( SURFACE-AT ?auto_7192 ?auto_7207 ) ( ON ?auto_7192 ?auto_7211 ) ( CLEAR ?auto_7192 ) ( not ( = ?auto_7191 ?auto_7192 ) ) ( not ( = ?auto_7191 ?auto_7211 ) ) ( not ( = ?auto_7192 ?auto_7211 ) ) ( not ( = ?auto_7199 ?auto_7206 ) ) ( IS-CRATE ?auto_7191 ) ( not ( = ?auto_7212 ?auto_7200 ) ) ( HOIST-AT ?auto_7208 ?auto_7212 ) ( AVAILABLE ?auto_7208 ) ( SURFACE-AT ?auto_7191 ?auto_7212 ) ( ON ?auto_7191 ?auto_7209 ) ( CLEAR ?auto_7191 ) ( not ( = ?auto_7190 ?auto_7191 ) ) ( not ( = ?auto_7190 ?auto_7209 ) ) ( not ( = ?auto_7191 ?auto_7209 ) ) ( not ( = ?auto_7199 ?auto_7208 ) ) ( IS-CRATE ?auto_7190 ) ( not ( = ?auto_7210 ?auto_7200 ) ) ( HOIST-AT ?auto_7202 ?auto_7210 ) ( AVAILABLE ?auto_7202 ) ( SURFACE-AT ?auto_7190 ?auto_7210 ) ( ON ?auto_7190 ?auto_7213 ) ( CLEAR ?auto_7190 ) ( not ( = ?auto_7189 ?auto_7190 ) ) ( not ( = ?auto_7189 ?auto_7213 ) ) ( not ( = ?auto_7190 ?auto_7213 ) ) ( not ( = ?auto_7199 ?auto_7202 ) ) ( SURFACE-AT ?auto_7188 ?auto_7200 ) ( CLEAR ?auto_7188 ) ( IS-CRATE ?auto_7189 ) ( AVAILABLE ?auto_7199 ) ( AVAILABLE ?auto_7204 ) ( SURFACE-AT ?auto_7189 ?auto_7203 ) ( ON ?auto_7189 ?auto_7201 ) ( CLEAR ?auto_7189 ) ( TRUCK-AT ?auto_7196 ?auto_7200 ) ( not ( = ?auto_7188 ?auto_7189 ) ) ( not ( = ?auto_7188 ?auto_7201 ) ) ( not ( = ?auto_7189 ?auto_7201 ) ) ( not ( = ?auto_7188 ?auto_7190 ) ) ( not ( = ?auto_7188 ?auto_7213 ) ) ( not ( = ?auto_7190 ?auto_7201 ) ) ( not ( = ?auto_7210 ?auto_7203 ) ) ( not ( = ?auto_7202 ?auto_7204 ) ) ( not ( = ?auto_7213 ?auto_7201 ) ) ( not ( = ?auto_7188 ?auto_7191 ) ) ( not ( = ?auto_7188 ?auto_7209 ) ) ( not ( = ?auto_7189 ?auto_7191 ) ) ( not ( = ?auto_7189 ?auto_7209 ) ) ( not ( = ?auto_7191 ?auto_7213 ) ) ( not ( = ?auto_7191 ?auto_7201 ) ) ( not ( = ?auto_7212 ?auto_7210 ) ) ( not ( = ?auto_7212 ?auto_7203 ) ) ( not ( = ?auto_7208 ?auto_7202 ) ) ( not ( = ?auto_7208 ?auto_7204 ) ) ( not ( = ?auto_7209 ?auto_7213 ) ) ( not ( = ?auto_7209 ?auto_7201 ) ) ( not ( = ?auto_7188 ?auto_7192 ) ) ( not ( = ?auto_7188 ?auto_7211 ) ) ( not ( = ?auto_7189 ?auto_7192 ) ) ( not ( = ?auto_7189 ?auto_7211 ) ) ( not ( = ?auto_7190 ?auto_7192 ) ) ( not ( = ?auto_7190 ?auto_7211 ) ) ( not ( = ?auto_7192 ?auto_7209 ) ) ( not ( = ?auto_7192 ?auto_7213 ) ) ( not ( = ?auto_7192 ?auto_7201 ) ) ( not ( = ?auto_7207 ?auto_7212 ) ) ( not ( = ?auto_7207 ?auto_7210 ) ) ( not ( = ?auto_7207 ?auto_7203 ) ) ( not ( = ?auto_7206 ?auto_7208 ) ) ( not ( = ?auto_7206 ?auto_7202 ) ) ( not ( = ?auto_7206 ?auto_7204 ) ) ( not ( = ?auto_7211 ?auto_7209 ) ) ( not ( = ?auto_7211 ?auto_7213 ) ) ( not ( = ?auto_7211 ?auto_7201 ) ) ( not ( = ?auto_7188 ?auto_7193 ) ) ( not ( = ?auto_7188 ?auto_7205 ) ) ( not ( = ?auto_7189 ?auto_7193 ) ) ( not ( = ?auto_7189 ?auto_7205 ) ) ( not ( = ?auto_7190 ?auto_7193 ) ) ( not ( = ?auto_7190 ?auto_7205 ) ) ( not ( = ?auto_7191 ?auto_7193 ) ) ( not ( = ?auto_7191 ?auto_7205 ) ) ( not ( = ?auto_7193 ?auto_7211 ) ) ( not ( = ?auto_7193 ?auto_7209 ) ) ( not ( = ?auto_7193 ?auto_7213 ) ) ( not ( = ?auto_7193 ?auto_7201 ) ) ( not ( = ?auto_7205 ?auto_7211 ) ) ( not ( = ?auto_7205 ?auto_7209 ) ) ( not ( = ?auto_7205 ?auto_7213 ) ) ( not ( = ?auto_7205 ?auto_7201 ) ) ( not ( = ?auto_7188 ?auto_7194 ) ) ( not ( = ?auto_7188 ?auto_7195 ) ) ( not ( = ?auto_7189 ?auto_7194 ) ) ( not ( = ?auto_7189 ?auto_7195 ) ) ( not ( = ?auto_7190 ?auto_7194 ) ) ( not ( = ?auto_7190 ?auto_7195 ) ) ( not ( = ?auto_7191 ?auto_7194 ) ) ( not ( = ?auto_7191 ?auto_7195 ) ) ( not ( = ?auto_7192 ?auto_7194 ) ) ( not ( = ?auto_7192 ?auto_7195 ) ) ( not ( = ?auto_7194 ?auto_7205 ) ) ( not ( = ?auto_7194 ?auto_7211 ) ) ( not ( = ?auto_7194 ?auto_7209 ) ) ( not ( = ?auto_7194 ?auto_7213 ) ) ( not ( = ?auto_7194 ?auto_7201 ) ) ( not ( = ?auto_7198 ?auto_7203 ) ) ( not ( = ?auto_7198 ?auto_7207 ) ) ( not ( = ?auto_7198 ?auto_7212 ) ) ( not ( = ?auto_7198 ?auto_7210 ) ) ( not ( = ?auto_7197 ?auto_7204 ) ) ( not ( = ?auto_7197 ?auto_7206 ) ) ( not ( = ?auto_7197 ?auto_7208 ) ) ( not ( = ?auto_7197 ?auto_7202 ) ) ( not ( = ?auto_7195 ?auto_7205 ) ) ( not ( = ?auto_7195 ?auto_7211 ) ) ( not ( = ?auto_7195 ?auto_7209 ) ) ( not ( = ?auto_7195 ?auto_7213 ) ) ( not ( = ?auto_7195 ?auto_7201 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7188 ?auto_7189 ?auto_7190 ?auto_7191 ?auto_7192 ?auto_7193 )
      ( MAKE-1CRATE ?auto_7193 ?auto_7194 )
      ( MAKE-6CRATE-VERIFY ?auto_7188 ?auto_7189 ?auto_7190 ?auto_7191 ?auto_7192 ?auto_7193 ?auto_7194 ) )
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
      ?auto_7238 - SURFACE
      ?auto_7239 - SURFACE
    )
    :vars
    (
      ?auto_7241 - HOIST
      ?auto_7240 - PLACE
      ?auto_7242 - PLACE
      ?auto_7243 - HOIST
      ?auto_7244 - SURFACE
      ?auto_7249 - PLACE
      ?auto_7254 - HOIST
      ?auto_7252 - SURFACE
      ?auto_7250 - PLACE
      ?auto_7251 - HOIST
      ?auto_7257 - SURFACE
      ?auto_7246 - PLACE
      ?auto_7258 - HOIST
      ?auto_7259 - SURFACE
      ?auto_7253 - SURFACE
      ?auto_7247 - PLACE
      ?auto_7248 - HOIST
      ?auto_7256 - SURFACE
      ?auto_7255 - SURFACE
      ?auto_7245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7241 ?auto_7240 ) ( IS-CRATE ?auto_7239 ) ( not ( = ?auto_7242 ?auto_7240 ) ) ( HOIST-AT ?auto_7243 ?auto_7242 ) ( SURFACE-AT ?auto_7239 ?auto_7242 ) ( ON ?auto_7239 ?auto_7244 ) ( CLEAR ?auto_7239 ) ( not ( = ?auto_7238 ?auto_7239 ) ) ( not ( = ?auto_7238 ?auto_7244 ) ) ( not ( = ?auto_7239 ?auto_7244 ) ) ( not ( = ?auto_7241 ?auto_7243 ) ) ( IS-CRATE ?auto_7238 ) ( not ( = ?auto_7249 ?auto_7240 ) ) ( HOIST-AT ?auto_7254 ?auto_7249 ) ( AVAILABLE ?auto_7254 ) ( SURFACE-AT ?auto_7238 ?auto_7249 ) ( ON ?auto_7238 ?auto_7252 ) ( CLEAR ?auto_7238 ) ( not ( = ?auto_7237 ?auto_7238 ) ) ( not ( = ?auto_7237 ?auto_7252 ) ) ( not ( = ?auto_7238 ?auto_7252 ) ) ( not ( = ?auto_7241 ?auto_7254 ) ) ( IS-CRATE ?auto_7237 ) ( not ( = ?auto_7250 ?auto_7240 ) ) ( HOIST-AT ?auto_7251 ?auto_7250 ) ( SURFACE-AT ?auto_7237 ?auto_7250 ) ( ON ?auto_7237 ?auto_7257 ) ( CLEAR ?auto_7237 ) ( not ( = ?auto_7236 ?auto_7237 ) ) ( not ( = ?auto_7236 ?auto_7257 ) ) ( not ( = ?auto_7237 ?auto_7257 ) ) ( not ( = ?auto_7241 ?auto_7251 ) ) ( IS-CRATE ?auto_7236 ) ( not ( = ?auto_7246 ?auto_7240 ) ) ( HOIST-AT ?auto_7258 ?auto_7246 ) ( AVAILABLE ?auto_7258 ) ( SURFACE-AT ?auto_7236 ?auto_7246 ) ( ON ?auto_7236 ?auto_7259 ) ( CLEAR ?auto_7236 ) ( not ( = ?auto_7235 ?auto_7236 ) ) ( not ( = ?auto_7235 ?auto_7259 ) ) ( not ( = ?auto_7236 ?auto_7259 ) ) ( not ( = ?auto_7241 ?auto_7258 ) ) ( IS-CRATE ?auto_7235 ) ( AVAILABLE ?auto_7243 ) ( SURFACE-AT ?auto_7235 ?auto_7242 ) ( ON ?auto_7235 ?auto_7253 ) ( CLEAR ?auto_7235 ) ( not ( = ?auto_7234 ?auto_7235 ) ) ( not ( = ?auto_7234 ?auto_7253 ) ) ( not ( = ?auto_7235 ?auto_7253 ) ) ( IS-CRATE ?auto_7234 ) ( not ( = ?auto_7247 ?auto_7240 ) ) ( HOIST-AT ?auto_7248 ?auto_7247 ) ( AVAILABLE ?auto_7248 ) ( SURFACE-AT ?auto_7234 ?auto_7247 ) ( ON ?auto_7234 ?auto_7256 ) ( CLEAR ?auto_7234 ) ( not ( = ?auto_7233 ?auto_7234 ) ) ( not ( = ?auto_7233 ?auto_7256 ) ) ( not ( = ?auto_7234 ?auto_7256 ) ) ( not ( = ?auto_7241 ?auto_7248 ) ) ( SURFACE-AT ?auto_7232 ?auto_7240 ) ( CLEAR ?auto_7232 ) ( IS-CRATE ?auto_7233 ) ( AVAILABLE ?auto_7241 ) ( AVAILABLE ?auto_7251 ) ( SURFACE-AT ?auto_7233 ?auto_7250 ) ( ON ?auto_7233 ?auto_7255 ) ( CLEAR ?auto_7233 ) ( TRUCK-AT ?auto_7245 ?auto_7240 ) ( not ( = ?auto_7232 ?auto_7233 ) ) ( not ( = ?auto_7232 ?auto_7255 ) ) ( not ( = ?auto_7233 ?auto_7255 ) ) ( not ( = ?auto_7232 ?auto_7234 ) ) ( not ( = ?auto_7232 ?auto_7256 ) ) ( not ( = ?auto_7234 ?auto_7255 ) ) ( not ( = ?auto_7247 ?auto_7250 ) ) ( not ( = ?auto_7248 ?auto_7251 ) ) ( not ( = ?auto_7256 ?auto_7255 ) ) ( not ( = ?auto_7232 ?auto_7235 ) ) ( not ( = ?auto_7232 ?auto_7253 ) ) ( not ( = ?auto_7233 ?auto_7235 ) ) ( not ( = ?auto_7233 ?auto_7253 ) ) ( not ( = ?auto_7235 ?auto_7256 ) ) ( not ( = ?auto_7235 ?auto_7255 ) ) ( not ( = ?auto_7242 ?auto_7247 ) ) ( not ( = ?auto_7242 ?auto_7250 ) ) ( not ( = ?auto_7243 ?auto_7248 ) ) ( not ( = ?auto_7243 ?auto_7251 ) ) ( not ( = ?auto_7253 ?auto_7256 ) ) ( not ( = ?auto_7253 ?auto_7255 ) ) ( not ( = ?auto_7232 ?auto_7236 ) ) ( not ( = ?auto_7232 ?auto_7259 ) ) ( not ( = ?auto_7233 ?auto_7236 ) ) ( not ( = ?auto_7233 ?auto_7259 ) ) ( not ( = ?auto_7234 ?auto_7236 ) ) ( not ( = ?auto_7234 ?auto_7259 ) ) ( not ( = ?auto_7236 ?auto_7253 ) ) ( not ( = ?auto_7236 ?auto_7256 ) ) ( not ( = ?auto_7236 ?auto_7255 ) ) ( not ( = ?auto_7246 ?auto_7242 ) ) ( not ( = ?auto_7246 ?auto_7247 ) ) ( not ( = ?auto_7246 ?auto_7250 ) ) ( not ( = ?auto_7258 ?auto_7243 ) ) ( not ( = ?auto_7258 ?auto_7248 ) ) ( not ( = ?auto_7258 ?auto_7251 ) ) ( not ( = ?auto_7259 ?auto_7253 ) ) ( not ( = ?auto_7259 ?auto_7256 ) ) ( not ( = ?auto_7259 ?auto_7255 ) ) ( not ( = ?auto_7232 ?auto_7237 ) ) ( not ( = ?auto_7232 ?auto_7257 ) ) ( not ( = ?auto_7233 ?auto_7237 ) ) ( not ( = ?auto_7233 ?auto_7257 ) ) ( not ( = ?auto_7234 ?auto_7237 ) ) ( not ( = ?auto_7234 ?auto_7257 ) ) ( not ( = ?auto_7235 ?auto_7237 ) ) ( not ( = ?auto_7235 ?auto_7257 ) ) ( not ( = ?auto_7237 ?auto_7259 ) ) ( not ( = ?auto_7237 ?auto_7253 ) ) ( not ( = ?auto_7237 ?auto_7256 ) ) ( not ( = ?auto_7237 ?auto_7255 ) ) ( not ( = ?auto_7257 ?auto_7259 ) ) ( not ( = ?auto_7257 ?auto_7253 ) ) ( not ( = ?auto_7257 ?auto_7256 ) ) ( not ( = ?auto_7257 ?auto_7255 ) ) ( not ( = ?auto_7232 ?auto_7238 ) ) ( not ( = ?auto_7232 ?auto_7252 ) ) ( not ( = ?auto_7233 ?auto_7238 ) ) ( not ( = ?auto_7233 ?auto_7252 ) ) ( not ( = ?auto_7234 ?auto_7238 ) ) ( not ( = ?auto_7234 ?auto_7252 ) ) ( not ( = ?auto_7235 ?auto_7238 ) ) ( not ( = ?auto_7235 ?auto_7252 ) ) ( not ( = ?auto_7236 ?auto_7238 ) ) ( not ( = ?auto_7236 ?auto_7252 ) ) ( not ( = ?auto_7238 ?auto_7257 ) ) ( not ( = ?auto_7238 ?auto_7259 ) ) ( not ( = ?auto_7238 ?auto_7253 ) ) ( not ( = ?auto_7238 ?auto_7256 ) ) ( not ( = ?auto_7238 ?auto_7255 ) ) ( not ( = ?auto_7249 ?auto_7250 ) ) ( not ( = ?auto_7249 ?auto_7246 ) ) ( not ( = ?auto_7249 ?auto_7242 ) ) ( not ( = ?auto_7249 ?auto_7247 ) ) ( not ( = ?auto_7254 ?auto_7251 ) ) ( not ( = ?auto_7254 ?auto_7258 ) ) ( not ( = ?auto_7254 ?auto_7243 ) ) ( not ( = ?auto_7254 ?auto_7248 ) ) ( not ( = ?auto_7252 ?auto_7257 ) ) ( not ( = ?auto_7252 ?auto_7259 ) ) ( not ( = ?auto_7252 ?auto_7253 ) ) ( not ( = ?auto_7252 ?auto_7256 ) ) ( not ( = ?auto_7252 ?auto_7255 ) ) ( not ( = ?auto_7232 ?auto_7239 ) ) ( not ( = ?auto_7232 ?auto_7244 ) ) ( not ( = ?auto_7233 ?auto_7239 ) ) ( not ( = ?auto_7233 ?auto_7244 ) ) ( not ( = ?auto_7234 ?auto_7239 ) ) ( not ( = ?auto_7234 ?auto_7244 ) ) ( not ( = ?auto_7235 ?auto_7239 ) ) ( not ( = ?auto_7235 ?auto_7244 ) ) ( not ( = ?auto_7236 ?auto_7239 ) ) ( not ( = ?auto_7236 ?auto_7244 ) ) ( not ( = ?auto_7237 ?auto_7239 ) ) ( not ( = ?auto_7237 ?auto_7244 ) ) ( not ( = ?auto_7239 ?auto_7252 ) ) ( not ( = ?auto_7239 ?auto_7257 ) ) ( not ( = ?auto_7239 ?auto_7259 ) ) ( not ( = ?auto_7239 ?auto_7253 ) ) ( not ( = ?auto_7239 ?auto_7256 ) ) ( not ( = ?auto_7239 ?auto_7255 ) ) ( not ( = ?auto_7244 ?auto_7252 ) ) ( not ( = ?auto_7244 ?auto_7257 ) ) ( not ( = ?auto_7244 ?auto_7259 ) ) ( not ( = ?auto_7244 ?auto_7253 ) ) ( not ( = ?auto_7244 ?auto_7256 ) ) ( not ( = ?auto_7244 ?auto_7255 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7232 ?auto_7233 ?auto_7234 ?auto_7235 ?auto_7236 ?auto_7237 ?auto_7238 )
      ( MAKE-1CRATE ?auto_7238 ?auto_7239 )
      ( MAKE-7CRATE-VERIFY ?auto_7232 ?auto_7233 ?auto_7234 ?auto_7235 ?auto_7236 ?auto_7237 ?auto_7238 ?auto_7239 ) )
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
      ?auto_7285 - SURFACE
      ?auto_7286 - SURFACE
      ?auto_7287 - SURFACE
    )
    :vars
    (
      ?auto_7293 - HOIST
      ?auto_7292 - PLACE
      ?auto_7289 - PLACE
      ?auto_7288 - HOIST
      ?auto_7290 - SURFACE
      ?auto_7294 - PLACE
      ?auto_7298 - HOIST
      ?auto_7306 - SURFACE
      ?auto_7301 - SURFACE
      ?auto_7299 - PLACE
      ?auto_7303 - HOIST
      ?auto_7304 - SURFACE
      ?auto_7297 - PLACE
      ?auto_7295 - HOIST
      ?auto_7300 - SURFACE
      ?auto_7308 - SURFACE
      ?auto_7305 - PLACE
      ?auto_7307 - HOIST
      ?auto_7302 - SURFACE
      ?auto_7296 - SURFACE
      ?auto_7291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7293 ?auto_7292 ) ( IS-CRATE ?auto_7287 ) ( not ( = ?auto_7289 ?auto_7292 ) ) ( HOIST-AT ?auto_7288 ?auto_7289 ) ( SURFACE-AT ?auto_7287 ?auto_7289 ) ( ON ?auto_7287 ?auto_7290 ) ( CLEAR ?auto_7287 ) ( not ( = ?auto_7286 ?auto_7287 ) ) ( not ( = ?auto_7286 ?auto_7290 ) ) ( not ( = ?auto_7287 ?auto_7290 ) ) ( not ( = ?auto_7293 ?auto_7288 ) ) ( IS-CRATE ?auto_7286 ) ( not ( = ?auto_7294 ?auto_7292 ) ) ( HOIST-AT ?auto_7298 ?auto_7294 ) ( SURFACE-AT ?auto_7286 ?auto_7294 ) ( ON ?auto_7286 ?auto_7306 ) ( CLEAR ?auto_7286 ) ( not ( = ?auto_7285 ?auto_7286 ) ) ( not ( = ?auto_7285 ?auto_7306 ) ) ( not ( = ?auto_7286 ?auto_7306 ) ) ( not ( = ?auto_7293 ?auto_7298 ) ) ( IS-CRATE ?auto_7285 ) ( AVAILABLE ?auto_7288 ) ( SURFACE-AT ?auto_7285 ?auto_7289 ) ( ON ?auto_7285 ?auto_7301 ) ( CLEAR ?auto_7285 ) ( not ( = ?auto_7284 ?auto_7285 ) ) ( not ( = ?auto_7284 ?auto_7301 ) ) ( not ( = ?auto_7285 ?auto_7301 ) ) ( IS-CRATE ?auto_7284 ) ( not ( = ?auto_7299 ?auto_7292 ) ) ( HOIST-AT ?auto_7303 ?auto_7299 ) ( SURFACE-AT ?auto_7284 ?auto_7299 ) ( ON ?auto_7284 ?auto_7304 ) ( CLEAR ?auto_7284 ) ( not ( = ?auto_7283 ?auto_7284 ) ) ( not ( = ?auto_7283 ?auto_7304 ) ) ( not ( = ?auto_7284 ?auto_7304 ) ) ( not ( = ?auto_7293 ?auto_7303 ) ) ( IS-CRATE ?auto_7283 ) ( not ( = ?auto_7297 ?auto_7292 ) ) ( HOIST-AT ?auto_7295 ?auto_7297 ) ( AVAILABLE ?auto_7295 ) ( SURFACE-AT ?auto_7283 ?auto_7297 ) ( ON ?auto_7283 ?auto_7300 ) ( CLEAR ?auto_7283 ) ( not ( = ?auto_7282 ?auto_7283 ) ) ( not ( = ?auto_7282 ?auto_7300 ) ) ( not ( = ?auto_7283 ?auto_7300 ) ) ( not ( = ?auto_7293 ?auto_7295 ) ) ( IS-CRATE ?auto_7282 ) ( AVAILABLE ?auto_7298 ) ( SURFACE-AT ?auto_7282 ?auto_7294 ) ( ON ?auto_7282 ?auto_7308 ) ( CLEAR ?auto_7282 ) ( not ( = ?auto_7281 ?auto_7282 ) ) ( not ( = ?auto_7281 ?auto_7308 ) ) ( not ( = ?auto_7282 ?auto_7308 ) ) ( IS-CRATE ?auto_7281 ) ( not ( = ?auto_7305 ?auto_7292 ) ) ( HOIST-AT ?auto_7307 ?auto_7305 ) ( AVAILABLE ?auto_7307 ) ( SURFACE-AT ?auto_7281 ?auto_7305 ) ( ON ?auto_7281 ?auto_7302 ) ( CLEAR ?auto_7281 ) ( not ( = ?auto_7280 ?auto_7281 ) ) ( not ( = ?auto_7280 ?auto_7302 ) ) ( not ( = ?auto_7281 ?auto_7302 ) ) ( not ( = ?auto_7293 ?auto_7307 ) ) ( SURFACE-AT ?auto_7279 ?auto_7292 ) ( CLEAR ?auto_7279 ) ( IS-CRATE ?auto_7280 ) ( AVAILABLE ?auto_7293 ) ( AVAILABLE ?auto_7303 ) ( SURFACE-AT ?auto_7280 ?auto_7299 ) ( ON ?auto_7280 ?auto_7296 ) ( CLEAR ?auto_7280 ) ( TRUCK-AT ?auto_7291 ?auto_7292 ) ( not ( = ?auto_7279 ?auto_7280 ) ) ( not ( = ?auto_7279 ?auto_7296 ) ) ( not ( = ?auto_7280 ?auto_7296 ) ) ( not ( = ?auto_7279 ?auto_7281 ) ) ( not ( = ?auto_7279 ?auto_7302 ) ) ( not ( = ?auto_7281 ?auto_7296 ) ) ( not ( = ?auto_7305 ?auto_7299 ) ) ( not ( = ?auto_7307 ?auto_7303 ) ) ( not ( = ?auto_7302 ?auto_7296 ) ) ( not ( = ?auto_7279 ?auto_7282 ) ) ( not ( = ?auto_7279 ?auto_7308 ) ) ( not ( = ?auto_7280 ?auto_7282 ) ) ( not ( = ?auto_7280 ?auto_7308 ) ) ( not ( = ?auto_7282 ?auto_7302 ) ) ( not ( = ?auto_7282 ?auto_7296 ) ) ( not ( = ?auto_7294 ?auto_7305 ) ) ( not ( = ?auto_7294 ?auto_7299 ) ) ( not ( = ?auto_7298 ?auto_7307 ) ) ( not ( = ?auto_7298 ?auto_7303 ) ) ( not ( = ?auto_7308 ?auto_7302 ) ) ( not ( = ?auto_7308 ?auto_7296 ) ) ( not ( = ?auto_7279 ?auto_7283 ) ) ( not ( = ?auto_7279 ?auto_7300 ) ) ( not ( = ?auto_7280 ?auto_7283 ) ) ( not ( = ?auto_7280 ?auto_7300 ) ) ( not ( = ?auto_7281 ?auto_7283 ) ) ( not ( = ?auto_7281 ?auto_7300 ) ) ( not ( = ?auto_7283 ?auto_7308 ) ) ( not ( = ?auto_7283 ?auto_7302 ) ) ( not ( = ?auto_7283 ?auto_7296 ) ) ( not ( = ?auto_7297 ?auto_7294 ) ) ( not ( = ?auto_7297 ?auto_7305 ) ) ( not ( = ?auto_7297 ?auto_7299 ) ) ( not ( = ?auto_7295 ?auto_7298 ) ) ( not ( = ?auto_7295 ?auto_7307 ) ) ( not ( = ?auto_7295 ?auto_7303 ) ) ( not ( = ?auto_7300 ?auto_7308 ) ) ( not ( = ?auto_7300 ?auto_7302 ) ) ( not ( = ?auto_7300 ?auto_7296 ) ) ( not ( = ?auto_7279 ?auto_7284 ) ) ( not ( = ?auto_7279 ?auto_7304 ) ) ( not ( = ?auto_7280 ?auto_7284 ) ) ( not ( = ?auto_7280 ?auto_7304 ) ) ( not ( = ?auto_7281 ?auto_7284 ) ) ( not ( = ?auto_7281 ?auto_7304 ) ) ( not ( = ?auto_7282 ?auto_7284 ) ) ( not ( = ?auto_7282 ?auto_7304 ) ) ( not ( = ?auto_7284 ?auto_7300 ) ) ( not ( = ?auto_7284 ?auto_7308 ) ) ( not ( = ?auto_7284 ?auto_7302 ) ) ( not ( = ?auto_7284 ?auto_7296 ) ) ( not ( = ?auto_7304 ?auto_7300 ) ) ( not ( = ?auto_7304 ?auto_7308 ) ) ( not ( = ?auto_7304 ?auto_7302 ) ) ( not ( = ?auto_7304 ?auto_7296 ) ) ( not ( = ?auto_7279 ?auto_7285 ) ) ( not ( = ?auto_7279 ?auto_7301 ) ) ( not ( = ?auto_7280 ?auto_7285 ) ) ( not ( = ?auto_7280 ?auto_7301 ) ) ( not ( = ?auto_7281 ?auto_7285 ) ) ( not ( = ?auto_7281 ?auto_7301 ) ) ( not ( = ?auto_7282 ?auto_7285 ) ) ( not ( = ?auto_7282 ?auto_7301 ) ) ( not ( = ?auto_7283 ?auto_7285 ) ) ( not ( = ?auto_7283 ?auto_7301 ) ) ( not ( = ?auto_7285 ?auto_7304 ) ) ( not ( = ?auto_7285 ?auto_7300 ) ) ( not ( = ?auto_7285 ?auto_7308 ) ) ( not ( = ?auto_7285 ?auto_7302 ) ) ( not ( = ?auto_7285 ?auto_7296 ) ) ( not ( = ?auto_7289 ?auto_7299 ) ) ( not ( = ?auto_7289 ?auto_7297 ) ) ( not ( = ?auto_7289 ?auto_7294 ) ) ( not ( = ?auto_7289 ?auto_7305 ) ) ( not ( = ?auto_7288 ?auto_7303 ) ) ( not ( = ?auto_7288 ?auto_7295 ) ) ( not ( = ?auto_7288 ?auto_7298 ) ) ( not ( = ?auto_7288 ?auto_7307 ) ) ( not ( = ?auto_7301 ?auto_7304 ) ) ( not ( = ?auto_7301 ?auto_7300 ) ) ( not ( = ?auto_7301 ?auto_7308 ) ) ( not ( = ?auto_7301 ?auto_7302 ) ) ( not ( = ?auto_7301 ?auto_7296 ) ) ( not ( = ?auto_7279 ?auto_7286 ) ) ( not ( = ?auto_7279 ?auto_7306 ) ) ( not ( = ?auto_7280 ?auto_7286 ) ) ( not ( = ?auto_7280 ?auto_7306 ) ) ( not ( = ?auto_7281 ?auto_7286 ) ) ( not ( = ?auto_7281 ?auto_7306 ) ) ( not ( = ?auto_7282 ?auto_7286 ) ) ( not ( = ?auto_7282 ?auto_7306 ) ) ( not ( = ?auto_7283 ?auto_7286 ) ) ( not ( = ?auto_7283 ?auto_7306 ) ) ( not ( = ?auto_7284 ?auto_7286 ) ) ( not ( = ?auto_7284 ?auto_7306 ) ) ( not ( = ?auto_7286 ?auto_7301 ) ) ( not ( = ?auto_7286 ?auto_7304 ) ) ( not ( = ?auto_7286 ?auto_7300 ) ) ( not ( = ?auto_7286 ?auto_7308 ) ) ( not ( = ?auto_7286 ?auto_7302 ) ) ( not ( = ?auto_7286 ?auto_7296 ) ) ( not ( = ?auto_7306 ?auto_7301 ) ) ( not ( = ?auto_7306 ?auto_7304 ) ) ( not ( = ?auto_7306 ?auto_7300 ) ) ( not ( = ?auto_7306 ?auto_7308 ) ) ( not ( = ?auto_7306 ?auto_7302 ) ) ( not ( = ?auto_7306 ?auto_7296 ) ) ( not ( = ?auto_7279 ?auto_7287 ) ) ( not ( = ?auto_7279 ?auto_7290 ) ) ( not ( = ?auto_7280 ?auto_7287 ) ) ( not ( = ?auto_7280 ?auto_7290 ) ) ( not ( = ?auto_7281 ?auto_7287 ) ) ( not ( = ?auto_7281 ?auto_7290 ) ) ( not ( = ?auto_7282 ?auto_7287 ) ) ( not ( = ?auto_7282 ?auto_7290 ) ) ( not ( = ?auto_7283 ?auto_7287 ) ) ( not ( = ?auto_7283 ?auto_7290 ) ) ( not ( = ?auto_7284 ?auto_7287 ) ) ( not ( = ?auto_7284 ?auto_7290 ) ) ( not ( = ?auto_7285 ?auto_7287 ) ) ( not ( = ?auto_7285 ?auto_7290 ) ) ( not ( = ?auto_7287 ?auto_7306 ) ) ( not ( = ?auto_7287 ?auto_7301 ) ) ( not ( = ?auto_7287 ?auto_7304 ) ) ( not ( = ?auto_7287 ?auto_7300 ) ) ( not ( = ?auto_7287 ?auto_7308 ) ) ( not ( = ?auto_7287 ?auto_7302 ) ) ( not ( = ?auto_7287 ?auto_7296 ) ) ( not ( = ?auto_7290 ?auto_7306 ) ) ( not ( = ?auto_7290 ?auto_7301 ) ) ( not ( = ?auto_7290 ?auto_7304 ) ) ( not ( = ?auto_7290 ?auto_7300 ) ) ( not ( = ?auto_7290 ?auto_7308 ) ) ( not ( = ?auto_7290 ?auto_7302 ) ) ( not ( = ?auto_7290 ?auto_7296 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7279 ?auto_7280 ?auto_7281 ?auto_7282 ?auto_7283 ?auto_7284 ?auto_7285 ?auto_7286 )
      ( MAKE-1CRATE ?auto_7286 ?auto_7287 )
      ( MAKE-8CRATE-VERIFY ?auto_7279 ?auto_7280 ?auto_7281 ?auto_7282 ?auto_7283 ?auto_7284 ?auto_7285 ?auto_7286 ?auto_7287 ) )
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
      ?auto_7335 - SURFACE
      ?auto_7336 - SURFACE
      ?auto_7337 - SURFACE
      ?auto_7338 - SURFACE
    )
    :vars
    (
      ?auto_7343 - HOIST
      ?auto_7342 - PLACE
      ?auto_7344 - PLACE
      ?auto_7340 - HOIST
      ?auto_7341 - SURFACE
      ?auto_7357 - PLACE
      ?auto_7359 - HOIST
      ?auto_7353 - SURFACE
      ?auto_7356 - PLACE
      ?auto_7352 - HOIST
      ?auto_7350 - SURFACE
      ?auto_7360 - SURFACE
      ?auto_7355 - SURFACE
      ?auto_7345 - PLACE
      ?auto_7348 - HOIST
      ?auto_7351 - SURFACE
      ?auto_7347 - SURFACE
      ?auto_7358 - PLACE
      ?auto_7354 - HOIST
      ?auto_7349 - SURFACE
      ?auto_7346 - SURFACE
      ?auto_7339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7343 ?auto_7342 ) ( IS-CRATE ?auto_7338 ) ( not ( = ?auto_7344 ?auto_7342 ) ) ( HOIST-AT ?auto_7340 ?auto_7344 ) ( SURFACE-AT ?auto_7338 ?auto_7344 ) ( ON ?auto_7338 ?auto_7341 ) ( CLEAR ?auto_7338 ) ( not ( = ?auto_7337 ?auto_7338 ) ) ( not ( = ?auto_7337 ?auto_7341 ) ) ( not ( = ?auto_7338 ?auto_7341 ) ) ( not ( = ?auto_7343 ?auto_7340 ) ) ( IS-CRATE ?auto_7337 ) ( not ( = ?auto_7357 ?auto_7342 ) ) ( HOIST-AT ?auto_7359 ?auto_7357 ) ( SURFACE-AT ?auto_7337 ?auto_7357 ) ( ON ?auto_7337 ?auto_7353 ) ( CLEAR ?auto_7337 ) ( not ( = ?auto_7336 ?auto_7337 ) ) ( not ( = ?auto_7336 ?auto_7353 ) ) ( not ( = ?auto_7337 ?auto_7353 ) ) ( not ( = ?auto_7343 ?auto_7359 ) ) ( IS-CRATE ?auto_7336 ) ( not ( = ?auto_7356 ?auto_7342 ) ) ( HOIST-AT ?auto_7352 ?auto_7356 ) ( SURFACE-AT ?auto_7336 ?auto_7356 ) ( ON ?auto_7336 ?auto_7350 ) ( CLEAR ?auto_7336 ) ( not ( = ?auto_7335 ?auto_7336 ) ) ( not ( = ?auto_7335 ?auto_7350 ) ) ( not ( = ?auto_7336 ?auto_7350 ) ) ( not ( = ?auto_7343 ?auto_7352 ) ) ( IS-CRATE ?auto_7335 ) ( AVAILABLE ?auto_7359 ) ( SURFACE-AT ?auto_7335 ?auto_7357 ) ( ON ?auto_7335 ?auto_7360 ) ( CLEAR ?auto_7335 ) ( not ( = ?auto_7334 ?auto_7335 ) ) ( not ( = ?auto_7334 ?auto_7360 ) ) ( not ( = ?auto_7335 ?auto_7360 ) ) ( IS-CRATE ?auto_7334 ) ( SURFACE-AT ?auto_7334 ?auto_7344 ) ( ON ?auto_7334 ?auto_7355 ) ( CLEAR ?auto_7334 ) ( not ( = ?auto_7333 ?auto_7334 ) ) ( not ( = ?auto_7333 ?auto_7355 ) ) ( not ( = ?auto_7334 ?auto_7355 ) ) ( IS-CRATE ?auto_7333 ) ( not ( = ?auto_7345 ?auto_7342 ) ) ( HOIST-AT ?auto_7348 ?auto_7345 ) ( AVAILABLE ?auto_7348 ) ( SURFACE-AT ?auto_7333 ?auto_7345 ) ( ON ?auto_7333 ?auto_7351 ) ( CLEAR ?auto_7333 ) ( not ( = ?auto_7332 ?auto_7333 ) ) ( not ( = ?auto_7332 ?auto_7351 ) ) ( not ( = ?auto_7333 ?auto_7351 ) ) ( not ( = ?auto_7343 ?auto_7348 ) ) ( IS-CRATE ?auto_7332 ) ( AVAILABLE ?auto_7352 ) ( SURFACE-AT ?auto_7332 ?auto_7356 ) ( ON ?auto_7332 ?auto_7347 ) ( CLEAR ?auto_7332 ) ( not ( = ?auto_7331 ?auto_7332 ) ) ( not ( = ?auto_7331 ?auto_7347 ) ) ( not ( = ?auto_7332 ?auto_7347 ) ) ( IS-CRATE ?auto_7331 ) ( not ( = ?auto_7358 ?auto_7342 ) ) ( HOIST-AT ?auto_7354 ?auto_7358 ) ( AVAILABLE ?auto_7354 ) ( SURFACE-AT ?auto_7331 ?auto_7358 ) ( ON ?auto_7331 ?auto_7349 ) ( CLEAR ?auto_7331 ) ( not ( = ?auto_7330 ?auto_7331 ) ) ( not ( = ?auto_7330 ?auto_7349 ) ) ( not ( = ?auto_7331 ?auto_7349 ) ) ( not ( = ?auto_7343 ?auto_7354 ) ) ( SURFACE-AT ?auto_7329 ?auto_7342 ) ( CLEAR ?auto_7329 ) ( IS-CRATE ?auto_7330 ) ( AVAILABLE ?auto_7343 ) ( AVAILABLE ?auto_7340 ) ( SURFACE-AT ?auto_7330 ?auto_7344 ) ( ON ?auto_7330 ?auto_7346 ) ( CLEAR ?auto_7330 ) ( TRUCK-AT ?auto_7339 ?auto_7342 ) ( not ( = ?auto_7329 ?auto_7330 ) ) ( not ( = ?auto_7329 ?auto_7346 ) ) ( not ( = ?auto_7330 ?auto_7346 ) ) ( not ( = ?auto_7329 ?auto_7331 ) ) ( not ( = ?auto_7329 ?auto_7349 ) ) ( not ( = ?auto_7331 ?auto_7346 ) ) ( not ( = ?auto_7358 ?auto_7344 ) ) ( not ( = ?auto_7354 ?auto_7340 ) ) ( not ( = ?auto_7349 ?auto_7346 ) ) ( not ( = ?auto_7329 ?auto_7332 ) ) ( not ( = ?auto_7329 ?auto_7347 ) ) ( not ( = ?auto_7330 ?auto_7332 ) ) ( not ( = ?auto_7330 ?auto_7347 ) ) ( not ( = ?auto_7332 ?auto_7349 ) ) ( not ( = ?auto_7332 ?auto_7346 ) ) ( not ( = ?auto_7356 ?auto_7358 ) ) ( not ( = ?auto_7356 ?auto_7344 ) ) ( not ( = ?auto_7352 ?auto_7354 ) ) ( not ( = ?auto_7352 ?auto_7340 ) ) ( not ( = ?auto_7347 ?auto_7349 ) ) ( not ( = ?auto_7347 ?auto_7346 ) ) ( not ( = ?auto_7329 ?auto_7333 ) ) ( not ( = ?auto_7329 ?auto_7351 ) ) ( not ( = ?auto_7330 ?auto_7333 ) ) ( not ( = ?auto_7330 ?auto_7351 ) ) ( not ( = ?auto_7331 ?auto_7333 ) ) ( not ( = ?auto_7331 ?auto_7351 ) ) ( not ( = ?auto_7333 ?auto_7347 ) ) ( not ( = ?auto_7333 ?auto_7349 ) ) ( not ( = ?auto_7333 ?auto_7346 ) ) ( not ( = ?auto_7345 ?auto_7356 ) ) ( not ( = ?auto_7345 ?auto_7358 ) ) ( not ( = ?auto_7345 ?auto_7344 ) ) ( not ( = ?auto_7348 ?auto_7352 ) ) ( not ( = ?auto_7348 ?auto_7354 ) ) ( not ( = ?auto_7348 ?auto_7340 ) ) ( not ( = ?auto_7351 ?auto_7347 ) ) ( not ( = ?auto_7351 ?auto_7349 ) ) ( not ( = ?auto_7351 ?auto_7346 ) ) ( not ( = ?auto_7329 ?auto_7334 ) ) ( not ( = ?auto_7329 ?auto_7355 ) ) ( not ( = ?auto_7330 ?auto_7334 ) ) ( not ( = ?auto_7330 ?auto_7355 ) ) ( not ( = ?auto_7331 ?auto_7334 ) ) ( not ( = ?auto_7331 ?auto_7355 ) ) ( not ( = ?auto_7332 ?auto_7334 ) ) ( not ( = ?auto_7332 ?auto_7355 ) ) ( not ( = ?auto_7334 ?auto_7351 ) ) ( not ( = ?auto_7334 ?auto_7347 ) ) ( not ( = ?auto_7334 ?auto_7349 ) ) ( not ( = ?auto_7334 ?auto_7346 ) ) ( not ( = ?auto_7355 ?auto_7351 ) ) ( not ( = ?auto_7355 ?auto_7347 ) ) ( not ( = ?auto_7355 ?auto_7349 ) ) ( not ( = ?auto_7355 ?auto_7346 ) ) ( not ( = ?auto_7329 ?auto_7335 ) ) ( not ( = ?auto_7329 ?auto_7360 ) ) ( not ( = ?auto_7330 ?auto_7335 ) ) ( not ( = ?auto_7330 ?auto_7360 ) ) ( not ( = ?auto_7331 ?auto_7335 ) ) ( not ( = ?auto_7331 ?auto_7360 ) ) ( not ( = ?auto_7332 ?auto_7335 ) ) ( not ( = ?auto_7332 ?auto_7360 ) ) ( not ( = ?auto_7333 ?auto_7335 ) ) ( not ( = ?auto_7333 ?auto_7360 ) ) ( not ( = ?auto_7335 ?auto_7355 ) ) ( not ( = ?auto_7335 ?auto_7351 ) ) ( not ( = ?auto_7335 ?auto_7347 ) ) ( not ( = ?auto_7335 ?auto_7349 ) ) ( not ( = ?auto_7335 ?auto_7346 ) ) ( not ( = ?auto_7357 ?auto_7344 ) ) ( not ( = ?auto_7357 ?auto_7345 ) ) ( not ( = ?auto_7357 ?auto_7356 ) ) ( not ( = ?auto_7357 ?auto_7358 ) ) ( not ( = ?auto_7359 ?auto_7340 ) ) ( not ( = ?auto_7359 ?auto_7348 ) ) ( not ( = ?auto_7359 ?auto_7352 ) ) ( not ( = ?auto_7359 ?auto_7354 ) ) ( not ( = ?auto_7360 ?auto_7355 ) ) ( not ( = ?auto_7360 ?auto_7351 ) ) ( not ( = ?auto_7360 ?auto_7347 ) ) ( not ( = ?auto_7360 ?auto_7349 ) ) ( not ( = ?auto_7360 ?auto_7346 ) ) ( not ( = ?auto_7329 ?auto_7336 ) ) ( not ( = ?auto_7329 ?auto_7350 ) ) ( not ( = ?auto_7330 ?auto_7336 ) ) ( not ( = ?auto_7330 ?auto_7350 ) ) ( not ( = ?auto_7331 ?auto_7336 ) ) ( not ( = ?auto_7331 ?auto_7350 ) ) ( not ( = ?auto_7332 ?auto_7336 ) ) ( not ( = ?auto_7332 ?auto_7350 ) ) ( not ( = ?auto_7333 ?auto_7336 ) ) ( not ( = ?auto_7333 ?auto_7350 ) ) ( not ( = ?auto_7334 ?auto_7336 ) ) ( not ( = ?auto_7334 ?auto_7350 ) ) ( not ( = ?auto_7336 ?auto_7360 ) ) ( not ( = ?auto_7336 ?auto_7355 ) ) ( not ( = ?auto_7336 ?auto_7351 ) ) ( not ( = ?auto_7336 ?auto_7347 ) ) ( not ( = ?auto_7336 ?auto_7349 ) ) ( not ( = ?auto_7336 ?auto_7346 ) ) ( not ( = ?auto_7350 ?auto_7360 ) ) ( not ( = ?auto_7350 ?auto_7355 ) ) ( not ( = ?auto_7350 ?auto_7351 ) ) ( not ( = ?auto_7350 ?auto_7347 ) ) ( not ( = ?auto_7350 ?auto_7349 ) ) ( not ( = ?auto_7350 ?auto_7346 ) ) ( not ( = ?auto_7329 ?auto_7337 ) ) ( not ( = ?auto_7329 ?auto_7353 ) ) ( not ( = ?auto_7330 ?auto_7337 ) ) ( not ( = ?auto_7330 ?auto_7353 ) ) ( not ( = ?auto_7331 ?auto_7337 ) ) ( not ( = ?auto_7331 ?auto_7353 ) ) ( not ( = ?auto_7332 ?auto_7337 ) ) ( not ( = ?auto_7332 ?auto_7353 ) ) ( not ( = ?auto_7333 ?auto_7337 ) ) ( not ( = ?auto_7333 ?auto_7353 ) ) ( not ( = ?auto_7334 ?auto_7337 ) ) ( not ( = ?auto_7334 ?auto_7353 ) ) ( not ( = ?auto_7335 ?auto_7337 ) ) ( not ( = ?auto_7335 ?auto_7353 ) ) ( not ( = ?auto_7337 ?auto_7350 ) ) ( not ( = ?auto_7337 ?auto_7360 ) ) ( not ( = ?auto_7337 ?auto_7355 ) ) ( not ( = ?auto_7337 ?auto_7351 ) ) ( not ( = ?auto_7337 ?auto_7347 ) ) ( not ( = ?auto_7337 ?auto_7349 ) ) ( not ( = ?auto_7337 ?auto_7346 ) ) ( not ( = ?auto_7353 ?auto_7350 ) ) ( not ( = ?auto_7353 ?auto_7360 ) ) ( not ( = ?auto_7353 ?auto_7355 ) ) ( not ( = ?auto_7353 ?auto_7351 ) ) ( not ( = ?auto_7353 ?auto_7347 ) ) ( not ( = ?auto_7353 ?auto_7349 ) ) ( not ( = ?auto_7353 ?auto_7346 ) ) ( not ( = ?auto_7329 ?auto_7338 ) ) ( not ( = ?auto_7329 ?auto_7341 ) ) ( not ( = ?auto_7330 ?auto_7338 ) ) ( not ( = ?auto_7330 ?auto_7341 ) ) ( not ( = ?auto_7331 ?auto_7338 ) ) ( not ( = ?auto_7331 ?auto_7341 ) ) ( not ( = ?auto_7332 ?auto_7338 ) ) ( not ( = ?auto_7332 ?auto_7341 ) ) ( not ( = ?auto_7333 ?auto_7338 ) ) ( not ( = ?auto_7333 ?auto_7341 ) ) ( not ( = ?auto_7334 ?auto_7338 ) ) ( not ( = ?auto_7334 ?auto_7341 ) ) ( not ( = ?auto_7335 ?auto_7338 ) ) ( not ( = ?auto_7335 ?auto_7341 ) ) ( not ( = ?auto_7336 ?auto_7338 ) ) ( not ( = ?auto_7336 ?auto_7341 ) ) ( not ( = ?auto_7338 ?auto_7353 ) ) ( not ( = ?auto_7338 ?auto_7350 ) ) ( not ( = ?auto_7338 ?auto_7360 ) ) ( not ( = ?auto_7338 ?auto_7355 ) ) ( not ( = ?auto_7338 ?auto_7351 ) ) ( not ( = ?auto_7338 ?auto_7347 ) ) ( not ( = ?auto_7338 ?auto_7349 ) ) ( not ( = ?auto_7338 ?auto_7346 ) ) ( not ( = ?auto_7341 ?auto_7353 ) ) ( not ( = ?auto_7341 ?auto_7350 ) ) ( not ( = ?auto_7341 ?auto_7360 ) ) ( not ( = ?auto_7341 ?auto_7355 ) ) ( not ( = ?auto_7341 ?auto_7351 ) ) ( not ( = ?auto_7341 ?auto_7347 ) ) ( not ( = ?auto_7341 ?auto_7349 ) ) ( not ( = ?auto_7341 ?auto_7346 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_7329 ?auto_7330 ?auto_7331 ?auto_7332 ?auto_7333 ?auto_7334 ?auto_7335 ?auto_7336 ?auto_7337 )
      ( MAKE-1CRATE ?auto_7337 ?auto_7338 )
      ( MAKE-9CRATE-VERIFY ?auto_7329 ?auto_7330 ?auto_7331 ?auto_7332 ?auto_7333 ?auto_7334 ?auto_7335 ?auto_7336 ?auto_7337 ?auto_7338 ) )
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
      ?auto_7388 - SURFACE
      ?auto_7389 - SURFACE
      ?auto_7390 - SURFACE
      ?auto_7391 - SURFACE
      ?auto_7392 - SURFACE
    )
    :vars
    (
      ?auto_7398 - HOIST
      ?auto_7396 - PLACE
      ?auto_7393 - PLACE
      ?auto_7395 - HOIST
      ?auto_7394 - SURFACE
      ?auto_7400 - SURFACE
      ?auto_7402 - PLACE
      ?auto_7406 - HOIST
      ?auto_7399 - SURFACE
      ?auto_7411 - PLACE
      ?auto_7405 - HOIST
      ?auto_7413 - SURFACE
      ?auto_7407 - SURFACE
      ?auto_7412 - SURFACE
      ?auto_7409 - PLACE
      ?auto_7410 - HOIST
      ?auto_7404 - SURFACE
      ?auto_7414 - SURFACE
      ?auto_7401 - PLACE
      ?auto_7403 - HOIST
      ?auto_7415 - SURFACE
      ?auto_7408 - SURFACE
      ?auto_7397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7398 ?auto_7396 ) ( IS-CRATE ?auto_7392 ) ( not ( = ?auto_7393 ?auto_7396 ) ) ( HOIST-AT ?auto_7395 ?auto_7393 ) ( SURFACE-AT ?auto_7392 ?auto_7393 ) ( ON ?auto_7392 ?auto_7394 ) ( CLEAR ?auto_7392 ) ( not ( = ?auto_7391 ?auto_7392 ) ) ( not ( = ?auto_7391 ?auto_7394 ) ) ( not ( = ?auto_7392 ?auto_7394 ) ) ( not ( = ?auto_7398 ?auto_7395 ) ) ( IS-CRATE ?auto_7391 ) ( SURFACE-AT ?auto_7391 ?auto_7393 ) ( ON ?auto_7391 ?auto_7400 ) ( CLEAR ?auto_7391 ) ( not ( = ?auto_7390 ?auto_7391 ) ) ( not ( = ?auto_7390 ?auto_7400 ) ) ( not ( = ?auto_7391 ?auto_7400 ) ) ( IS-CRATE ?auto_7390 ) ( not ( = ?auto_7402 ?auto_7396 ) ) ( HOIST-AT ?auto_7406 ?auto_7402 ) ( SURFACE-AT ?auto_7390 ?auto_7402 ) ( ON ?auto_7390 ?auto_7399 ) ( CLEAR ?auto_7390 ) ( not ( = ?auto_7389 ?auto_7390 ) ) ( not ( = ?auto_7389 ?auto_7399 ) ) ( not ( = ?auto_7390 ?auto_7399 ) ) ( not ( = ?auto_7398 ?auto_7406 ) ) ( IS-CRATE ?auto_7389 ) ( not ( = ?auto_7411 ?auto_7396 ) ) ( HOIST-AT ?auto_7405 ?auto_7411 ) ( SURFACE-AT ?auto_7389 ?auto_7411 ) ( ON ?auto_7389 ?auto_7413 ) ( CLEAR ?auto_7389 ) ( not ( = ?auto_7388 ?auto_7389 ) ) ( not ( = ?auto_7388 ?auto_7413 ) ) ( not ( = ?auto_7389 ?auto_7413 ) ) ( not ( = ?auto_7398 ?auto_7405 ) ) ( IS-CRATE ?auto_7388 ) ( AVAILABLE ?auto_7406 ) ( SURFACE-AT ?auto_7388 ?auto_7402 ) ( ON ?auto_7388 ?auto_7407 ) ( CLEAR ?auto_7388 ) ( not ( = ?auto_7387 ?auto_7388 ) ) ( not ( = ?auto_7387 ?auto_7407 ) ) ( not ( = ?auto_7388 ?auto_7407 ) ) ( IS-CRATE ?auto_7387 ) ( SURFACE-AT ?auto_7387 ?auto_7393 ) ( ON ?auto_7387 ?auto_7412 ) ( CLEAR ?auto_7387 ) ( not ( = ?auto_7386 ?auto_7387 ) ) ( not ( = ?auto_7386 ?auto_7412 ) ) ( not ( = ?auto_7387 ?auto_7412 ) ) ( IS-CRATE ?auto_7386 ) ( not ( = ?auto_7409 ?auto_7396 ) ) ( HOIST-AT ?auto_7410 ?auto_7409 ) ( AVAILABLE ?auto_7410 ) ( SURFACE-AT ?auto_7386 ?auto_7409 ) ( ON ?auto_7386 ?auto_7404 ) ( CLEAR ?auto_7386 ) ( not ( = ?auto_7385 ?auto_7386 ) ) ( not ( = ?auto_7385 ?auto_7404 ) ) ( not ( = ?auto_7386 ?auto_7404 ) ) ( not ( = ?auto_7398 ?auto_7410 ) ) ( IS-CRATE ?auto_7385 ) ( AVAILABLE ?auto_7405 ) ( SURFACE-AT ?auto_7385 ?auto_7411 ) ( ON ?auto_7385 ?auto_7414 ) ( CLEAR ?auto_7385 ) ( not ( = ?auto_7384 ?auto_7385 ) ) ( not ( = ?auto_7384 ?auto_7414 ) ) ( not ( = ?auto_7385 ?auto_7414 ) ) ( IS-CRATE ?auto_7384 ) ( not ( = ?auto_7401 ?auto_7396 ) ) ( HOIST-AT ?auto_7403 ?auto_7401 ) ( AVAILABLE ?auto_7403 ) ( SURFACE-AT ?auto_7384 ?auto_7401 ) ( ON ?auto_7384 ?auto_7415 ) ( CLEAR ?auto_7384 ) ( not ( = ?auto_7383 ?auto_7384 ) ) ( not ( = ?auto_7383 ?auto_7415 ) ) ( not ( = ?auto_7384 ?auto_7415 ) ) ( not ( = ?auto_7398 ?auto_7403 ) ) ( SURFACE-AT ?auto_7382 ?auto_7396 ) ( CLEAR ?auto_7382 ) ( IS-CRATE ?auto_7383 ) ( AVAILABLE ?auto_7398 ) ( AVAILABLE ?auto_7395 ) ( SURFACE-AT ?auto_7383 ?auto_7393 ) ( ON ?auto_7383 ?auto_7408 ) ( CLEAR ?auto_7383 ) ( TRUCK-AT ?auto_7397 ?auto_7396 ) ( not ( = ?auto_7382 ?auto_7383 ) ) ( not ( = ?auto_7382 ?auto_7408 ) ) ( not ( = ?auto_7383 ?auto_7408 ) ) ( not ( = ?auto_7382 ?auto_7384 ) ) ( not ( = ?auto_7382 ?auto_7415 ) ) ( not ( = ?auto_7384 ?auto_7408 ) ) ( not ( = ?auto_7401 ?auto_7393 ) ) ( not ( = ?auto_7403 ?auto_7395 ) ) ( not ( = ?auto_7415 ?auto_7408 ) ) ( not ( = ?auto_7382 ?auto_7385 ) ) ( not ( = ?auto_7382 ?auto_7414 ) ) ( not ( = ?auto_7383 ?auto_7385 ) ) ( not ( = ?auto_7383 ?auto_7414 ) ) ( not ( = ?auto_7385 ?auto_7415 ) ) ( not ( = ?auto_7385 ?auto_7408 ) ) ( not ( = ?auto_7411 ?auto_7401 ) ) ( not ( = ?auto_7411 ?auto_7393 ) ) ( not ( = ?auto_7405 ?auto_7403 ) ) ( not ( = ?auto_7405 ?auto_7395 ) ) ( not ( = ?auto_7414 ?auto_7415 ) ) ( not ( = ?auto_7414 ?auto_7408 ) ) ( not ( = ?auto_7382 ?auto_7386 ) ) ( not ( = ?auto_7382 ?auto_7404 ) ) ( not ( = ?auto_7383 ?auto_7386 ) ) ( not ( = ?auto_7383 ?auto_7404 ) ) ( not ( = ?auto_7384 ?auto_7386 ) ) ( not ( = ?auto_7384 ?auto_7404 ) ) ( not ( = ?auto_7386 ?auto_7414 ) ) ( not ( = ?auto_7386 ?auto_7415 ) ) ( not ( = ?auto_7386 ?auto_7408 ) ) ( not ( = ?auto_7409 ?auto_7411 ) ) ( not ( = ?auto_7409 ?auto_7401 ) ) ( not ( = ?auto_7409 ?auto_7393 ) ) ( not ( = ?auto_7410 ?auto_7405 ) ) ( not ( = ?auto_7410 ?auto_7403 ) ) ( not ( = ?auto_7410 ?auto_7395 ) ) ( not ( = ?auto_7404 ?auto_7414 ) ) ( not ( = ?auto_7404 ?auto_7415 ) ) ( not ( = ?auto_7404 ?auto_7408 ) ) ( not ( = ?auto_7382 ?auto_7387 ) ) ( not ( = ?auto_7382 ?auto_7412 ) ) ( not ( = ?auto_7383 ?auto_7387 ) ) ( not ( = ?auto_7383 ?auto_7412 ) ) ( not ( = ?auto_7384 ?auto_7387 ) ) ( not ( = ?auto_7384 ?auto_7412 ) ) ( not ( = ?auto_7385 ?auto_7387 ) ) ( not ( = ?auto_7385 ?auto_7412 ) ) ( not ( = ?auto_7387 ?auto_7404 ) ) ( not ( = ?auto_7387 ?auto_7414 ) ) ( not ( = ?auto_7387 ?auto_7415 ) ) ( not ( = ?auto_7387 ?auto_7408 ) ) ( not ( = ?auto_7412 ?auto_7404 ) ) ( not ( = ?auto_7412 ?auto_7414 ) ) ( not ( = ?auto_7412 ?auto_7415 ) ) ( not ( = ?auto_7412 ?auto_7408 ) ) ( not ( = ?auto_7382 ?auto_7388 ) ) ( not ( = ?auto_7382 ?auto_7407 ) ) ( not ( = ?auto_7383 ?auto_7388 ) ) ( not ( = ?auto_7383 ?auto_7407 ) ) ( not ( = ?auto_7384 ?auto_7388 ) ) ( not ( = ?auto_7384 ?auto_7407 ) ) ( not ( = ?auto_7385 ?auto_7388 ) ) ( not ( = ?auto_7385 ?auto_7407 ) ) ( not ( = ?auto_7386 ?auto_7388 ) ) ( not ( = ?auto_7386 ?auto_7407 ) ) ( not ( = ?auto_7388 ?auto_7412 ) ) ( not ( = ?auto_7388 ?auto_7404 ) ) ( not ( = ?auto_7388 ?auto_7414 ) ) ( not ( = ?auto_7388 ?auto_7415 ) ) ( not ( = ?auto_7388 ?auto_7408 ) ) ( not ( = ?auto_7402 ?auto_7393 ) ) ( not ( = ?auto_7402 ?auto_7409 ) ) ( not ( = ?auto_7402 ?auto_7411 ) ) ( not ( = ?auto_7402 ?auto_7401 ) ) ( not ( = ?auto_7406 ?auto_7395 ) ) ( not ( = ?auto_7406 ?auto_7410 ) ) ( not ( = ?auto_7406 ?auto_7405 ) ) ( not ( = ?auto_7406 ?auto_7403 ) ) ( not ( = ?auto_7407 ?auto_7412 ) ) ( not ( = ?auto_7407 ?auto_7404 ) ) ( not ( = ?auto_7407 ?auto_7414 ) ) ( not ( = ?auto_7407 ?auto_7415 ) ) ( not ( = ?auto_7407 ?auto_7408 ) ) ( not ( = ?auto_7382 ?auto_7389 ) ) ( not ( = ?auto_7382 ?auto_7413 ) ) ( not ( = ?auto_7383 ?auto_7389 ) ) ( not ( = ?auto_7383 ?auto_7413 ) ) ( not ( = ?auto_7384 ?auto_7389 ) ) ( not ( = ?auto_7384 ?auto_7413 ) ) ( not ( = ?auto_7385 ?auto_7389 ) ) ( not ( = ?auto_7385 ?auto_7413 ) ) ( not ( = ?auto_7386 ?auto_7389 ) ) ( not ( = ?auto_7386 ?auto_7413 ) ) ( not ( = ?auto_7387 ?auto_7389 ) ) ( not ( = ?auto_7387 ?auto_7413 ) ) ( not ( = ?auto_7389 ?auto_7407 ) ) ( not ( = ?auto_7389 ?auto_7412 ) ) ( not ( = ?auto_7389 ?auto_7404 ) ) ( not ( = ?auto_7389 ?auto_7414 ) ) ( not ( = ?auto_7389 ?auto_7415 ) ) ( not ( = ?auto_7389 ?auto_7408 ) ) ( not ( = ?auto_7413 ?auto_7407 ) ) ( not ( = ?auto_7413 ?auto_7412 ) ) ( not ( = ?auto_7413 ?auto_7404 ) ) ( not ( = ?auto_7413 ?auto_7414 ) ) ( not ( = ?auto_7413 ?auto_7415 ) ) ( not ( = ?auto_7413 ?auto_7408 ) ) ( not ( = ?auto_7382 ?auto_7390 ) ) ( not ( = ?auto_7382 ?auto_7399 ) ) ( not ( = ?auto_7383 ?auto_7390 ) ) ( not ( = ?auto_7383 ?auto_7399 ) ) ( not ( = ?auto_7384 ?auto_7390 ) ) ( not ( = ?auto_7384 ?auto_7399 ) ) ( not ( = ?auto_7385 ?auto_7390 ) ) ( not ( = ?auto_7385 ?auto_7399 ) ) ( not ( = ?auto_7386 ?auto_7390 ) ) ( not ( = ?auto_7386 ?auto_7399 ) ) ( not ( = ?auto_7387 ?auto_7390 ) ) ( not ( = ?auto_7387 ?auto_7399 ) ) ( not ( = ?auto_7388 ?auto_7390 ) ) ( not ( = ?auto_7388 ?auto_7399 ) ) ( not ( = ?auto_7390 ?auto_7413 ) ) ( not ( = ?auto_7390 ?auto_7407 ) ) ( not ( = ?auto_7390 ?auto_7412 ) ) ( not ( = ?auto_7390 ?auto_7404 ) ) ( not ( = ?auto_7390 ?auto_7414 ) ) ( not ( = ?auto_7390 ?auto_7415 ) ) ( not ( = ?auto_7390 ?auto_7408 ) ) ( not ( = ?auto_7399 ?auto_7413 ) ) ( not ( = ?auto_7399 ?auto_7407 ) ) ( not ( = ?auto_7399 ?auto_7412 ) ) ( not ( = ?auto_7399 ?auto_7404 ) ) ( not ( = ?auto_7399 ?auto_7414 ) ) ( not ( = ?auto_7399 ?auto_7415 ) ) ( not ( = ?auto_7399 ?auto_7408 ) ) ( not ( = ?auto_7382 ?auto_7391 ) ) ( not ( = ?auto_7382 ?auto_7400 ) ) ( not ( = ?auto_7383 ?auto_7391 ) ) ( not ( = ?auto_7383 ?auto_7400 ) ) ( not ( = ?auto_7384 ?auto_7391 ) ) ( not ( = ?auto_7384 ?auto_7400 ) ) ( not ( = ?auto_7385 ?auto_7391 ) ) ( not ( = ?auto_7385 ?auto_7400 ) ) ( not ( = ?auto_7386 ?auto_7391 ) ) ( not ( = ?auto_7386 ?auto_7400 ) ) ( not ( = ?auto_7387 ?auto_7391 ) ) ( not ( = ?auto_7387 ?auto_7400 ) ) ( not ( = ?auto_7388 ?auto_7391 ) ) ( not ( = ?auto_7388 ?auto_7400 ) ) ( not ( = ?auto_7389 ?auto_7391 ) ) ( not ( = ?auto_7389 ?auto_7400 ) ) ( not ( = ?auto_7391 ?auto_7399 ) ) ( not ( = ?auto_7391 ?auto_7413 ) ) ( not ( = ?auto_7391 ?auto_7407 ) ) ( not ( = ?auto_7391 ?auto_7412 ) ) ( not ( = ?auto_7391 ?auto_7404 ) ) ( not ( = ?auto_7391 ?auto_7414 ) ) ( not ( = ?auto_7391 ?auto_7415 ) ) ( not ( = ?auto_7391 ?auto_7408 ) ) ( not ( = ?auto_7400 ?auto_7399 ) ) ( not ( = ?auto_7400 ?auto_7413 ) ) ( not ( = ?auto_7400 ?auto_7407 ) ) ( not ( = ?auto_7400 ?auto_7412 ) ) ( not ( = ?auto_7400 ?auto_7404 ) ) ( not ( = ?auto_7400 ?auto_7414 ) ) ( not ( = ?auto_7400 ?auto_7415 ) ) ( not ( = ?auto_7400 ?auto_7408 ) ) ( not ( = ?auto_7382 ?auto_7392 ) ) ( not ( = ?auto_7382 ?auto_7394 ) ) ( not ( = ?auto_7383 ?auto_7392 ) ) ( not ( = ?auto_7383 ?auto_7394 ) ) ( not ( = ?auto_7384 ?auto_7392 ) ) ( not ( = ?auto_7384 ?auto_7394 ) ) ( not ( = ?auto_7385 ?auto_7392 ) ) ( not ( = ?auto_7385 ?auto_7394 ) ) ( not ( = ?auto_7386 ?auto_7392 ) ) ( not ( = ?auto_7386 ?auto_7394 ) ) ( not ( = ?auto_7387 ?auto_7392 ) ) ( not ( = ?auto_7387 ?auto_7394 ) ) ( not ( = ?auto_7388 ?auto_7392 ) ) ( not ( = ?auto_7388 ?auto_7394 ) ) ( not ( = ?auto_7389 ?auto_7392 ) ) ( not ( = ?auto_7389 ?auto_7394 ) ) ( not ( = ?auto_7390 ?auto_7392 ) ) ( not ( = ?auto_7390 ?auto_7394 ) ) ( not ( = ?auto_7392 ?auto_7400 ) ) ( not ( = ?auto_7392 ?auto_7399 ) ) ( not ( = ?auto_7392 ?auto_7413 ) ) ( not ( = ?auto_7392 ?auto_7407 ) ) ( not ( = ?auto_7392 ?auto_7412 ) ) ( not ( = ?auto_7392 ?auto_7404 ) ) ( not ( = ?auto_7392 ?auto_7414 ) ) ( not ( = ?auto_7392 ?auto_7415 ) ) ( not ( = ?auto_7392 ?auto_7408 ) ) ( not ( = ?auto_7394 ?auto_7400 ) ) ( not ( = ?auto_7394 ?auto_7399 ) ) ( not ( = ?auto_7394 ?auto_7413 ) ) ( not ( = ?auto_7394 ?auto_7407 ) ) ( not ( = ?auto_7394 ?auto_7412 ) ) ( not ( = ?auto_7394 ?auto_7404 ) ) ( not ( = ?auto_7394 ?auto_7414 ) ) ( not ( = ?auto_7394 ?auto_7415 ) ) ( not ( = ?auto_7394 ?auto_7408 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_7382 ?auto_7383 ?auto_7384 ?auto_7385 ?auto_7386 ?auto_7387 ?auto_7388 ?auto_7389 ?auto_7390 ?auto_7391 )
      ( MAKE-1CRATE ?auto_7391 ?auto_7392 )
      ( MAKE-10CRATE-VERIFY ?auto_7382 ?auto_7383 ?auto_7384 ?auto_7385 ?auto_7386 ?auto_7387 ?auto_7388 ?auto_7389 ?auto_7390 ?auto_7391 ?auto_7392 ) )
  )

)

