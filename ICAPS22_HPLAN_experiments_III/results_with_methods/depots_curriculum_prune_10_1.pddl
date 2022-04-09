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
      ?auto_7025 - SURFACE
      ?auto_7026 - SURFACE
    )
    :vars
    (
      ?auto_7027 - HOIST
      ?auto_7028 - PLACE
      ?auto_7030 - PLACE
      ?auto_7031 - HOIST
      ?auto_7032 - SURFACE
      ?auto_7029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7027 ?auto_7028 ) ( SURFACE-AT ?auto_7025 ?auto_7028 ) ( CLEAR ?auto_7025 ) ( IS-CRATE ?auto_7026 ) ( AVAILABLE ?auto_7027 ) ( not ( = ?auto_7030 ?auto_7028 ) ) ( HOIST-AT ?auto_7031 ?auto_7030 ) ( AVAILABLE ?auto_7031 ) ( SURFACE-AT ?auto_7026 ?auto_7030 ) ( ON ?auto_7026 ?auto_7032 ) ( CLEAR ?auto_7026 ) ( TRUCK-AT ?auto_7029 ?auto_7028 ) ( not ( = ?auto_7025 ?auto_7026 ) ) ( not ( = ?auto_7025 ?auto_7032 ) ) ( not ( = ?auto_7026 ?auto_7032 ) ) ( not ( = ?auto_7027 ?auto_7031 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7029 ?auto_7028 ?auto_7030 )
      ( !LIFT ?auto_7031 ?auto_7026 ?auto_7032 ?auto_7030 )
      ( !LOAD ?auto_7031 ?auto_7026 ?auto_7029 ?auto_7030 )
      ( !DRIVE ?auto_7029 ?auto_7030 ?auto_7028 )
      ( !UNLOAD ?auto_7027 ?auto_7026 ?auto_7029 ?auto_7028 )
      ( !DROP ?auto_7027 ?auto_7026 ?auto_7025 ?auto_7028 )
      ( MAKE-1CRATE-VERIFY ?auto_7025 ?auto_7026 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7046 - SURFACE
      ?auto_7047 - SURFACE
      ?auto_7048 - SURFACE
    )
    :vars
    (
      ?auto_7053 - HOIST
      ?auto_7051 - PLACE
      ?auto_7054 - PLACE
      ?auto_7050 - HOIST
      ?auto_7049 - SURFACE
      ?auto_7056 - PLACE
      ?auto_7055 - HOIST
      ?auto_7057 - SURFACE
      ?auto_7052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7053 ?auto_7051 ) ( IS-CRATE ?auto_7048 ) ( not ( = ?auto_7054 ?auto_7051 ) ) ( HOIST-AT ?auto_7050 ?auto_7054 ) ( AVAILABLE ?auto_7050 ) ( SURFACE-AT ?auto_7048 ?auto_7054 ) ( ON ?auto_7048 ?auto_7049 ) ( CLEAR ?auto_7048 ) ( not ( = ?auto_7047 ?auto_7048 ) ) ( not ( = ?auto_7047 ?auto_7049 ) ) ( not ( = ?auto_7048 ?auto_7049 ) ) ( not ( = ?auto_7053 ?auto_7050 ) ) ( SURFACE-AT ?auto_7046 ?auto_7051 ) ( CLEAR ?auto_7046 ) ( IS-CRATE ?auto_7047 ) ( AVAILABLE ?auto_7053 ) ( not ( = ?auto_7056 ?auto_7051 ) ) ( HOIST-AT ?auto_7055 ?auto_7056 ) ( AVAILABLE ?auto_7055 ) ( SURFACE-AT ?auto_7047 ?auto_7056 ) ( ON ?auto_7047 ?auto_7057 ) ( CLEAR ?auto_7047 ) ( TRUCK-AT ?auto_7052 ?auto_7051 ) ( not ( = ?auto_7046 ?auto_7047 ) ) ( not ( = ?auto_7046 ?auto_7057 ) ) ( not ( = ?auto_7047 ?auto_7057 ) ) ( not ( = ?auto_7053 ?auto_7055 ) ) ( not ( = ?auto_7046 ?auto_7048 ) ) ( not ( = ?auto_7046 ?auto_7049 ) ) ( not ( = ?auto_7048 ?auto_7057 ) ) ( not ( = ?auto_7054 ?auto_7056 ) ) ( not ( = ?auto_7050 ?auto_7055 ) ) ( not ( = ?auto_7049 ?auto_7057 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7046 ?auto_7047 )
      ( MAKE-1CRATE ?auto_7047 ?auto_7048 )
      ( MAKE-2CRATE-VERIFY ?auto_7046 ?auto_7047 ?auto_7048 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7072 - SURFACE
      ?auto_7073 - SURFACE
      ?auto_7074 - SURFACE
      ?auto_7075 - SURFACE
    )
    :vars
    (
      ?auto_7080 - HOIST
      ?auto_7078 - PLACE
      ?auto_7076 - PLACE
      ?auto_7081 - HOIST
      ?auto_7079 - SURFACE
      ?auto_7084 - PLACE
      ?auto_7085 - HOIST
      ?auto_7087 - SURFACE
      ?auto_7083 - PLACE
      ?auto_7086 - HOIST
      ?auto_7082 - SURFACE
      ?auto_7077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7080 ?auto_7078 ) ( IS-CRATE ?auto_7075 ) ( not ( = ?auto_7076 ?auto_7078 ) ) ( HOIST-AT ?auto_7081 ?auto_7076 ) ( AVAILABLE ?auto_7081 ) ( SURFACE-AT ?auto_7075 ?auto_7076 ) ( ON ?auto_7075 ?auto_7079 ) ( CLEAR ?auto_7075 ) ( not ( = ?auto_7074 ?auto_7075 ) ) ( not ( = ?auto_7074 ?auto_7079 ) ) ( not ( = ?auto_7075 ?auto_7079 ) ) ( not ( = ?auto_7080 ?auto_7081 ) ) ( IS-CRATE ?auto_7074 ) ( not ( = ?auto_7084 ?auto_7078 ) ) ( HOIST-AT ?auto_7085 ?auto_7084 ) ( AVAILABLE ?auto_7085 ) ( SURFACE-AT ?auto_7074 ?auto_7084 ) ( ON ?auto_7074 ?auto_7087 ) ( CLEAR ?auto_7074 ) ( not ( = ?auto_7073 ?auto_7074 ) ) ( not ( = ?auto_7073 ?auto_7087 ) ) ( not ( = ?auto_7074 ?auto_7087 ) ) ( not ( = ?auto_7080 ?auto_7085 ) ) ( SURFACE-AT ?auto_7072 ?auto_7078 ) ( CLEAR ?auto_7072 ) ( IS-CRATE ?auto_7073 ) ( AVAILABLE ?auto_7080 ) ( not ( = ?auto_7083 ?auto_7078 ) ) ( HOIST-AT ?auto_7086 ?auto_7083 ) ( AVAILABLE ?auto_7086 ) ( SURFACE-AT ?auto_7073 ?auto_7083 ) ( ON ?auto_7073 ?auto_7082 ) ( CLEAR ?auto_7073 ) ( TRUCK-AT ?auto_7077 ?auto_7078 ) ( not ( = ?auto_7072 ?auto_7073 ) ) ( not ( = ?auto_7072 ?auto_7082 ) ) ( not ( = ?auto_7073 ?auto_7082 ) ) ( not ( = ?auto_7080 ?auto_7086 ) ) ( not ( = ?auto_7072 ?auto_7074 ) ) ( not ( = ?auto_7072 ?auto_7087 ) ) ( not ( = ?auto_7074 ?auto_7082 ) ) ( not ( = ?auto_7084 ?auto_7083 ) ) ( not ( = ?auto_7085 ?auto_7086 ) ) ( not ( = ?auto_7087 ?auto_7082 ) ) ( not ( = ?auto_7072 ?auto_7075 ) ) ( not ( = ?auto_7072 ?auto_7079 ) ) ( not ( = ?auto_7073 ?auto_7075 ) ) ( not ( = ?auto_7073 ?auto_7079 ) ) ( not ( = ?auto_7075 ?auto_7087 ) ) ( not ( = ?auto_7075 ?auto_7082 ) ) ( not ( = ?auto_7076 ?auto_7084 ) ) ( not ( = ?auto_7076 ?auto_7083 ) ) ( not ( = ?auto_7081 ?auto_7085 ) ) ( not ( = ?auto_7081 ?auto_7086 ) ) ( not ( = ?auto_7079 ?auto_7087 ) ) ( not ( = ?auto_7079 ?auto_7082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7072 ?auto_7073 ?auto_7074 )
      ( MAKE-1CRATE ?auto_7074 ?auto_7075 )
      ( MAKE-3CRATE-VERIFY ?auto_7072 ?auto_7073 ?auto_7074 ?auto_7075 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7103 - SURFACE
      ?auto_7104 - SURFACE
      ?auto_7105 - SURFACE
      ?auto_7106 - SURFACE
      ?auto_7107 - SURFACE
    )
    :vars
    (
      ?auto_7109 - HOIST
      ?auto_7108 - PLACE
      ?auto_7112 - PLACE
      ?auto_7110 - HOIST
      ?auto_7113 - SURFACE
      ?auto_7122 - PLACE
      ?auto_7121 - HOIST
      ?auto_7114 - SURFACE
      ?auto_7118 - PLACE
      ?auto_7115 - HOIST
      ?auto_7120 - SURFACE
      ?auto_7116 - PLACE
      ?auto_7119 - HOIST
      ?auto_7117 - SURFACE
      ?auto_7111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7109 ?auto_7108 ) ( IS-CRATE ?auto_7107 ) ( not ( = ?auto_7112 ?auto_7108 ) ) ( HOIST-AT ?auto_7110 ?auto_7112 ) ( AVAILABLE ?auto_7110 ) ( SURFACE-AT ?auto_7107 ?auto_7112 ) ( ON ?auto_7107 ?auto_7113 ) ( CLEAR ?auto_7107 ) ( not ( = ?auto_7106 ?auto_7107 ) ) ( not ( = ?auto_7106 ?auto_7113 ) ) ( not ( = ?auto_7107 ?auto_7113 ) ) ( not ( = ?auto_7109 ?auto_7110 ) ) ( IS-CRATE ?auto_7106 ) ( not ( = ?auto_7122 ?auto_7108 ) ) ( HOIST-AT ?auto_7121 ?auto_7122 ) ( AVAILABLE ?auto_7121 ) ( SURFACE-AT ?auto_7106 ?auto_7122 ) ( ON ?auto_7106 ?auto_7114 ) ( CLEAR ?auto_7106 ) ( not ( = ?auto_7105 ?auto_7106 ) ) ( not ( = ?auto_7105 ?auto_7114 ) ) ( not ( = ?auto_7106 ?auto_7114 ) ) ( not ( = ?auto_7109 ?auto_7121 ) ) ( IS-CRATE ?auto_7105 ) ( not ( = ?auto_7118 ?auto_7108 ) ) ( HOIST-AT ?auto_7115 ?auto_7118 ) ( AVAILABLE ?auto_7115 ) ( SURFACE-AT ?auto_7105 ?auto_7118 ) ( ON ?auto_7105 ?auto_7120 ) ( CLEAR ?auto_7105 ) ( not ( = ?auto_7104 ?auto_7105 ) ) ( not ( = ?auto_7104 ?auto_7120 ) ) ( not ( = ?auto_7105 ?auto_7120 ) ) ( not ( = ?auto_7109 ?auto_7115 ) ) ( SURFACE-AT ?auto_7103 ?auto_7108 ) ( CLEAR ?auto_7103 ) ( IS-CRATE ?auto_7104 ) ( AVAILABLE ?auto_7109 ) ( not ( = ?auto_7116 ?auto_7108 ) ) ( HOIST-AT ?auto_7119 ?auto_7116 ) ( AVAILABLE ?auto_7119 ) ( SURFACE-AT ?auto_7104 ?auto_7116 ) ( ON ?auto_7104 ?auto_7117 ) ( CLEAR ?auto_7104 ) ( TRUCK-AT ?auto_7111 ?auto_7108 ) ( not ( = ?auto_7103 ?auto_7104 ) ) ( not ( = ?auto_7103 ?auto_7117 ) ) ( not ( = ?auto_7104 ?auto_7117 ) ) ( not ( = ?auto_7109 ?auto_7119 ) ) ( not ( = ?auto_7103 ?auto_7105 ) ) ( not ( = ?auto_7103 ?auto_7120 ) ) ( not ( = ?auto_7105 ?auto_7117 ) ) ( not ( = ?auto_7118 ?auto_7116 ) ) ( not ( = ?auto_7115 ?auto_7119 ) ) ( not ( = ?auto_7120 ?auto_7117 ) ) ( not ( = ?auto_7103 ?auto_7106 ) ) ( not ( = ?auto_7103 ?auto_7114 ) ) ( not ( = ?auto_7104 ?auto_7106 ) ) ( not ( = ?auto_7104 ?auto_7114 ) ) ( not ( = ?auto_7106 ?auto_7120 ) ) ( not ( = ?auto_7106 ?auto_7117 ) ) ( not ( = ?auto_7122 ?auto_7118 ) ) ( not ( = ?auto_7122 ?auto_7116 ) ) ( not ( = ?auto_7121 ?auto_7115 ) ) ( not ( = ?auto_7121 ?auto_7119 ) ) ( not ( = ?auto_7114 ?auto_7120 ) ) ( not ( = ?auto_7114 ?auto_7117 ) ) ( not ( = ?auto_7103 ?auto_7107 ) ) ( not ( = ?auto_7103 ?auto_7113 ) ) ( not ( = ?auto_7104 ?auto_7107 ) ) ( not ( = ?auto_7104 ?auto_7113 ) ) ( not ( = ?auto_7105 ?auto_7107 ) ) ( not ( = ?auto_7105 ?auto_7113 ) ) ( not ( = ?auto_7107 ?auto_7114 ) ) ( not ( = ?auto_7107 ?auto_7120 ) ) ( not ( = ?auto_7107 ?auto_7117 ) ) ( not ( = ?auto_7112 ?auto_7122 ) ) ( not ( = ?auto_7112 ?auto_7118 ) ) ( not ( = ?auto_7112 ?auto_7116 ) ) ( not ( = ?auto_7110 ?auto_7121 ) ) ( not ( = ?auto_7110 ?auto_7115 ) ) ( not ( = ?auto_7110 ?auto_7119 ) ) ( not ( = ?auto_7113 ?auto_7114 ) ) ( not ( = ?auto_7113 ?auto_7120 ) ) ( not ( = ?auto_7113 ?auto_7117 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7103 ?auto_7104 ?auto_7105 ?auto_7106 )
      ( MAKE-1CRATE ?auto_7106 ?auto_7107 )
      ( MAKE-4CRATE-VERIFY ?auto_7103 ?auto_7104 ?auto_7105 ?auto_7106 ?auto_7107 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_7139 - SURFACE
      ?auto_7140 - SURFACE
      ?auto_7141 - SURFACE
      ?auto_7142 - SURFACE
      ?auto_7143 - SURFACE
      ?auto_7144 - SURFACE
    )
    :vars
    (
      ?auto_7145 - HOIST
      ?auto_7146 - PLACE
      ?auto_7149 - PLACE
      ?auto_7147 - HOIST
      ?auto_7148 - SURFACE
      ?auto_7152 - PLACE
      ?auto_7162 - HOIST
      ?auto_7161 - SURFACE
      ?auto_7156 - PLACE
      ?auto_7159 - HOIST
      ?auto_7158 - SURFACE
      ?auto_7154 - PLACE
      ?auto_7160 - HOIST
      ?auto_7151 - SURFACE
      ?auto_7157 - PLACE
      ?auto_7155 - HOIST
      ?auto_7153 - SURFACE
      ?auto_7150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7145 ?auto_7146 ) ( IS-CRATE ?auto_7144 ) ( not ( = ?auto_7149 ?auto_7146 ) ) ( HOIST-AT ?auto_7147 ?auto_7149 ) ( AVAILABLE ?auto_7147 ) ( SURFACE-AT ?auto_7144 ?auto_7149 ) ( ON ?auto_7144 ?auto_7148 ) ( CLEAR ?auto_7144 ) ( not ( = ?auto_7143 ?auto_7144 ) ) ( not ( = ?auto_7143 ?auto_7148 ) ) ( not ( = ?auto_7144 ?auto_7148 ) ) ( not ( = ?auto_7145 ?auto_7147 ) ) ( IS-CRATE ?auto_7143 ) ( not ( = ?auto_7152 ?auto_7146 ) ) ( HOIST-AT ?auto_7162 ?auto_7152 ) ( AVAILABLE ?auto_7162 ) ( SURFACE-AT ?auto_7143 ?auto_7152 ) ( ON ?auto_7143 ?auto_7161 ) ( CLEAR ?auto_7143 ) ( not ( = ?auto_7142 ?auto_7143 ) ) ( not ( = ?auto_7142 ?auto_7161 ) ) ( not ( = ?auto_7143 ?auto_7161 ) ) ( not ( = ?auto_7145 ?auto_7162 ) ) ( IS-CRATE ?auto_7142 ) ( not ( = ?auto_7156 ?auto_7146 ) ) ( HOIST-AT ?auto_7159 ?auto_7156 ) ( AVAILABLE ?auto_7159 ) ( SURFACE-AT ?auto_7142 ?auto_7156 ) ( ON ?auto_7142 ?auto_7158 ) ( CLEAR ?auto_7142 ) ( not ( = ?auto_7141 ?auto_7142 ) ) ( not ( = ?auto_7141 ?auto_7158 ) ) ( not ( = ?auto_7142 ?auto_7158 ) ) ( not ( = ?auto_7145 ?auto_7159 ) ) ( IS-CRATE ?auto_7141 ) ( not ( = ?auto_7154 ?auto_7146 ) ) ( HOIST-AT ?auto_7160 ?auto_7154 ) ( AVAILABLE ?auto_7160 ) ( SURFACE-AT ?auto_7141 ?auto_7154 ) ( ON ?auto_7141 ?auto_7151 ) ( CLEAR ?auto_7141 ) ( not ( = ?auto_7140 ?auto_7141 ) ) ( not ( = ?auto_7140 ?auto_7151 ) ) ( not ( = ?auto_7141 ?auto_7151 ) ) ( not ( = ?auto_7145 ?auto_7160 ) ) ( SURFACE-AT ?auto_7139 ?auto_7146 ) ( CLEAR ?auto_7139 ) ( IS-CRATE ?auto_7140 ) ( AVAILABLE ?auto_7145 ) ( not ( = ?auto_7157 ?auto_7146 ) ) ( HOIST-AT ?auto_7155 ?auto_7157 ) ( AVAILABLE ?auto_7155 ) ( SURFACE-AT ?auto_7140 ?auto_7157 ) ( ON ?auto_7140 ?auto_7153 ) ( CLEAR ?auto_7140 ) ( TRUCK-AT ?auto_7150 ?auto_7146 ) ( not ( = ?auto_7139 ?auto_7140 ) ) ( not ( = ?auto_7139 ?auto_7153 ) ) ( not ( = ?auto_7140 ?auto_7153 ) ) ( not ( = ?auto_7145 ?auto_7155 ) ) ( not ( = ?auto_7139 ?auto_7141 ) ) ( not ( = ?auto_7139 ?auto_7151 ) ) ( not ( = ?auto_7141 ?auto_7153 ) ) ( not ( = ?auto_7154 ?auto_7157 ) ) ( not ( = ?auto_7160 ?auto_7155 ) ) ( not ( = ?auto_7151 ?auto_7153 ) ) ( not ( = ?auto_7139 ?auto_7142 ) ) ( not ( = ?auto_7139 ?auto_7158 ) ) ( not ( = ?auto_7140 ?auto_7142 ) ) ( not ( = ?auto_7140 ?auto_7158 ) ) ( not ( = ?auto_7142 ?auto_7151 ) ) ( not ( = ?auto_7142 ?auto_7153 ) ) ( not ( = ?auto_7156 ?auto_7154 ) ) ( not ( = ?auto_7156 ?auto_7157 ) ) ( not ( = ?auto_7159 ?auto_7160 ) ) ( not ( = ?auto_7159 ?auto_7155 ) ) ( not ( = ?auto_7158 ?auto_7151 ) ) ( not ( = ?auto_7158 ?auto_7153 ) ) ( not ( = ?auto_7139 ?auto_7143 ) ) ( not ( = ?auto_7139 ?auto_7161 ) ) ( not ( = ?auto_7140 ?auto_7143 ) ) ( not ( = ?auto_7140 ?auto_7161 ) ) ( not ( = ?auto_7141 ?auto_7143 ) ) ( not ( = ?auto_7141 ?auto_7161 ) ) ( not ( = ?auto_7143 ?auto_7158 ) ) ( not ( = ?auto_7143 ?auto_7151 ) ) ( not ( = ?auto_7143 ?auto_7153 ) ) ( not ( = ?auto_7152 ?auto_7156 ) ) ( not ( = ?auto_7152 ?auto_7154 ) ) ( not ( = ?auto_7152 ?auto_7157 ) ) ( not ( = ?auto_7162 ?auto_7159 ) ) ( not ( = ?auto_7162 ?auto_7160 ) ) ( not ( = ?auto_7162 ?auto_7155 ) ) ( not ( = ?auto_7161 ?auto_7158 ) ) ( not ( = ?auto_7161 ?auto_7151 ) ) ( not ( = ?auto_7161 ?auto_7153 ) ) ( not ( = ?auto_7139 ?auto_7144 ) ) ( not ( = ?auto_7139 ?auto_7148 ) ) ( not ( = ?auto_7140 ?auto_7144 ) ) ( not ( = ?auto_7140 ?auto_7148 ) ) ( not ( = ?auto_7141 ?auto_7144 ) ) ( not ( = ?auto_7141 ?auto_7148 ) ) ( not ( = ?auto_7142 ?auto_7144 ) ) ( not ( = ?auto_7142 ?auto_7148 ) ) ( not ( = ?auto_7144 ?auto_7161 ) ) ( not ( = ?auto_7144 ?auto_7158 ) ) ( not ( = ?auto_7144 ?auto_7151 ) ) ( not ( = ?auto_7144 ?auto_7153 ) ) ( not ( = ?auto_7149 ?auto_7152 ) ) ( not ( = ?auto_7149 ?auto_7156 ) ) ( not ( = ?auto_7149 ?auto_7154 ) ) ( not ( = ?auto_7149 ?auto_7157 ) ) ( not ( = ?auto_7147 ?auto_7162 ) ) ( not ( = ?auto_7147 ?auto_7159 ) ) ( not ( = ?auto_7147 ?auto_7160 ) ) ( not ( = ?auto_7147 ?auto_7155 ) ) ( not ( = ?auto_7148 ?auto_7161 ) ) ( not ( = ?auto_7148 ?auto_7158 ) ) ( not ( = ?auto_7148 ?auto_7151 ) ) ( not ( = ?auto_7148 ?auto_7153 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7139 ?auto_7140 ?auto_7141 ?auto_7142 ?auto_7143 )
      ( MAKE-1CRATE ?auto_7143 ?auto_7144 )
      ( MAKE-5CRATE-VERIFY ?auto_7139 ?auto_7140 ?auto_7141 ?auto_7142 ?auto_7143 ?auto_7144 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_7180 - SURFACE
      ?auto_7181 - SURFACE
      ?auto_7182 - SURFACE
      ?auto_7183 - SURFACE
      ?auto_7184 - SURFACE
      ?auto_7185 - SURFACE
      ?auto_7186 - SURFACE
    )
    :vars
    (
      ?auto_7192 - HOIST
      ?auto_7191 - PLACE
      ?auto_7187 - PLACE
      ?auto_7188 - HOIST
      ?auto_7189 - SURFACE
      ?auto_7203 - PLACE
      ?auto_7207 - HOIST
      ?auto_7204 - SURFACE
      ?auto_7195 - PLACE
      ?auto_7206 - HOIST
      ?auto_7202 - SURFACE
      ?auto_7200 - PLACE
      ?auto_7205 - HOIST
      ?auto_7201 - SURFACE
      ?auto_7197 - PLACE
      ?auto_7196 - HOIST
      ?auto_7194 - SURFACE
      ?auto_7199 - PLACE
      ?auto_7198 - HOIST
      ?auto_7193 - SURFACE
      ?auto_7190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7192 ?auto_7191 ) ( IS-CRATE ?auto_7186 ) ( not ( = ?auto_7187 ?auto_7191 ) ) ( HOIST-AT ?auto_7188 ?auto_7187 ) ( AVAILABLE ?auto_7188 ) ( SURFACE-AT ?auto_7186 ?auto_7187 ) ( ON ?auto_7186 ?auto_7189 ) ( CLEAR ?auto_7186 ) ( not ( = ?auto_7185 ?auto_7186 ) ) ( not ( = ?auto_7185 ?auto_7189 ) ) ( not ( = ?auto_7186 ?auto_7189 ) ) ( not ( = ?auto_7192 ?auto_7188 ) ) ( IS-CRATE ?auto_7185 ) ( not ( = ?auto_7203 ?auto_7191 ) ) ( HOIST-AT ?auto_7207 ?auto_7203 ) ( AVAILABLE ?auto_7207 ) ( SURFACE-AT ?auto_7185 ?auto_7203 ) ( ON ?auto_7185 ?auto_7204 ) ( CLEAR ?auto_7185 ) ( not ( = ?auto_7184 ?auto_7185 ) ) ( not ( = ?auto_7184 ?auto_7204 ) ) ( not ( = ?auto_7185 ?auto_7204 ) ) ( not ( = ?auto_7192 ?auto_7207 ) ) ( IS-CRATE ?auto_7184 ) ( not ( = ?auto_7195 ?auto_7191 ) ) ( HOIST-AT ?auto_7206 ?auto_7195 ) ( AVAILABLE ?auto_7206 ) ( SURFACE-AT ?auto_7184 ?auto_7195 ) ( ON ?auto_7184 ?auto_7202 ) ( CLEAR ?auto_7184 ) ( not ( = ?auto_7183 ?auto_7184 ) ) ( not ( = ?auto_7183 ?auto_7202 ) ) ( not ( = ?auto_7184 ?auto_7202 ) ) ( not ( = ?auto_7192 ?auto_7206 ) ) ( IS-CRATE ?auto_7183 ) ( not ( = ?auto_7200 ?auto_7191 ) ) ( HOIST-AT ?auto_7205 ?auto_7200 ) ( AVAILABLE ?auto_7205 ) ( SURFACE-AT ?auto_7183 ?auto_7200 ) ( ON ?auto_7183 ?auto_7201 ) ( CLEAR ?auto_7183 ) ( not ( = ?auto_7182 ?auto_7183 ) ) ( not ( = ?auto_7182 ?auto_7201 ) ) ( not ( = ?auto_7183 ?auto_7201 ) ) ( not ( = ?auto_7192 ?auto_7205 ) ) ( IS-CRATE ?auto_7182 ) ( not ( = ?auto_7197 ?auto_7191 ) ) ( HOIST-AT ?auto_7196 ?auto_7197 ) ( AVAILABLE ?auto_7196 ) ( SURFACE-AT ?auto_7182 ?auto_7197 ) ( ON ?auto_7182 ?auto_7194 ) ( CLEAR ?auto_7182 ) ( not ( = ?auto_7181 ?auto_7182 ) ) ( not ( = ?auto_7181 ?auto_7194 ) ) ( not ( = ?auto_7182 ?auto_7194 ) ) ( not ( = ?auto_7192 ?auto_7196 ) ) ( SURFACE-AT ?auto_7180 ?auto_7191 ) ( CLEAR ?auto_7180 ) ( IS-CRATE ?auto_7181 ) ( AVAILABLE ?auto_7192 ) ( not ( = ?auto_7199 ?auto_7191 ) ) ( HOIST-AT ?auto_7198 ?auto_7199 ) ( AVAILABLE ?auto_7198 ) ( SURFACE-AT ?auto_7181 ?auto_7199 ) ( ON ?auto_7181 ?auto_7193 ) ( CLEAR ?auto_7181 ) ( TRUCK-AT ?auto_7190 ?auto_7191 ) ( not ( = ?auto_7180 ?auto_7181 ) ) ( not ( = ?auto_7180 ?auto_7193 ) ) ( not ( = ?auto_7181 ?auto_7193 ) ) ( not ( = ?auto_7192 ?auto_7198 ) ) ( not ( = ?auto_7180 ?auto_7182 ) ) ( not ( = ?auto_7180 ?auto_7194 ) ) ( not ( = ?auto_7182 ?auto_7193 ) ) ( not ( = ?auto_7197 ?auto_7199 ) ) ( not ( = ?auto_7196 ?auto_7198 ) ) ( not ( = ?auto_7194 ?auto_7193 ) ) ( not ( = ?auto_7180 ?auto_7183 ) ) ( not ( = ?auto_7180 ?auto_7201 ) ) ( not ( = ?auto_7181 ?auto_7183 ) ) ( not ( = ?auto_7181 ?auto_7201 ) ) ( not ( = ?auto_7183 ?auto_7194 ) ) ( not ( = ?auto_7183 ?auto_7193 ) ) ( not ( = ?auto_7200 ?auto_7197 ) ) ( not ( = ?auto_7200 ?auto_7199 ) ) ( not ( = ?auto_7205 ?auto_7196 ) ) ( not ( = ?auto_7205 ?auto_7198 ) ) ( not ( = ?auto_7201 ?auto_7194 ) ) ( not ( = ?auto_7201 ?auto_7193 ) ) ( not ( = ?auto_7180 ?auto_7184 ) ) ( not ( = ?auto_7180 ?auto_7202 ) ) ( not ( = ?auto_7181 ?auto_7184 ) ) ( not ( = ?auto_7181 ?auto_7202 ) ) ( not ( = ?auto_7182 ?auto_7184 ) ) ( not ( = ?auto_7182 ?auto_7202 ) ) ( not ( = ?auto_7184 ?auto_7201 ) ) ( not ( = ?auto_7184 ?auto_7194 ) ) ( not ( = ?auto_7184 ?auto_7193 ) ) ( not ( = ?auto_7195 ?auto_7200 ) ) ( not ( = ?auto_7195 ?auto_7197 ) ) ( not ( = ?auto_7195 ?auto_7199 ) ) ( not ( = ?auto_7206 ?auto_7205 ) ) ( not ( = ?auto_7206 ?auto_7196 ) ) ( not ( = ?auto_7206 ?auto_7198 ) ) ( not ( = ?auto_7202 ?auto_7201 ) ) ( not ( = ?auto_7202 ?auto_7194 ) ) ( not ( = ?auto_7202 ?auto_7193 ) ) ( not ( = ?auto_7180 ?auto_7185 ) ) ( not ( = ?auto_7180 ?auto_7204 ) ) ( not ( = ?auto_7181 ?auto_7185 ) ) ( not ( = ?auto_7181 ?auto_7204 ) ) ( not ( = ?auto_7182 ?auto_7185 ) ) ( not ( = ?auto_7182 ?auto_7204 ) ) ( not ( = ?auto_7183 ?auto_7185 ) ) ( not ( = ?auto_7183 ?auto_7204 ) ) ( not ( = ?auto_7185 ?auto_7202 ) ) ( not ( = ?auto_7185 ?auto_7201 ) ) ( not ( = ?auto_7185 ?auto_7194 ) ) ( not ( = ?auto_7185 ?auto_7193 ) ) ( not ( = ?auto_7203 ?auto_7195 ) ) ( not ( = ?auto_7203 ?auto_7200 ) ) ( not ( = ?auto_7203 ?auto_7197 ) ) ( not ( = ?auto_7203 ?auto_7199 ) ) ( not ( = ?auto_7207 ?auto_7206 ) ) ( not ( = ?auto_7207 ?auto_7205 ) ) ( not ( = ?auto_7207 ?auto_7196 ) ) ( not ( = ?auto_7207 ?auto_7198 ) ) ( not ( = ?auto_7204 ?auto_7202 ) ) ( not ( = ?auto_7204 ?auto_7201 ) ) ( not ( = ?auto_7204 ?auto_7194 ) ) ( not ( = ?auto_7204 ?auto_7193 ) ) ( not ( = ?auto_7180 ?auto_7186 ) ) ( not ( = ?auto_7180 ?auto_7189 ) ) ( not ( = ?auto_7181 ?auto_7186 ) ) ( not ( = ?auto_7181 ?auto_7189 ) ) ( not ( = ?auto_7182 ?auto_7186 ) ) ( not ( = ?auto_7182 ?auto_7189 ) ) ( not ( = ?auto_7183 ?auto_7186 ) ) ( not ( = ?auto_7183 ?auto_7189 ) ) ( not ( = ?auto_7184 ?auto_7186 ) ) ( not ( = ?auto_7184 ?auto_7189 ) ) ( not ( = ?auto_7186 ?auto_7204 ) ) ( not ( = ?auto_7186 ?auto_7202 ) ) ( not ( = ?auto_7186 ?auto_7201 ) ) ( not ( = ?auto_7186 ?auto_7194 ) ) ( not ( = ?auto_7186 ?auto_7193 ) ) ( not ( = ?auto_7187 ?auto_7203 ) ) ( not ( = ?auto_7187 ?auto_7195 ) ) ( not ( = ?auto_7187 ?auto_7200 ) ) ( not ( = ?auto_7187 ?auto_7197 ) ) ( not ( = ?auto_7187 ?auto_7199 ) ) ( not ( = ?auto_7188 ?auto_7207 ) ) ( not ( = ?auto_7188 ?auto_7206 ) ) ( not ( = ?auto_7188 ?auto_7205 ) ) ( not ( = ?auto_7188 ?auto_7196 ) ) ( not ( = ?auto_7188 ?auto_7198 ) ) ( not ( = ?auto_7189 ?auto_7204 ) ) ( not ( = ?auto_7189 ?auto_7202 ) ) ( not ( = ?auto_7189 ?auto_7201 ) ) ( not ( = ?auto_7189 ?auto_7194 ) ) ( not ( = ?auto_7189 ?auto_7193 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7180 ?auto_7181 ?auto_7182 ?auto_7183 ?auto_7184 ?auto_7185 )
      ( MAKE-1CRATE ?auto_7185 ?auto_7186 )
      ( MAKE-6CRATE-VERIFY ?auto_7180 ?auto_7181 ?auto_7182 ?auto_7183 ?auto_7184 ?auto_7185 ?auto_7186 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_7226 - SURFACE
      ?auto_7227 - SURFACE
      ?auto_7228 - SURFACE
      ?auto_7229 - SURFACE
      ?auto_7230 - SURFACE
      ?auto_7231 - SURFACE
      ?auto_7232 - SURFACE
      ?auto_7233 - SURFACE
    )
    :vars
    (
      ?auto_7234 - HOIST
      ?auto_7235 - PLACE
      ?auto_7238 - PLACE
      ?auto_7239 - HOIST
      ?auto_7237 - SURFACE
      ?auto_7253 - PLACE
      ?auto_7250 - HOIST
      ?auto_7241 - SURFACE
      ?auto_7240 - PLACE
      ?auto_7244 - HOIST
      ?auto_7247 - SURFACE
      ?auto_7243 - PLACE
      ?auto_7251 - HOIST
      ?auto_7254 - SURFACE
      ?auto_7255 - PLACE
      ?auto_7249 - HOIST
      ?auto_7248 - SURFACE
      ?auto_7256 - PLACE
      ?auto_7245 - HOIST
      ?auto_7242 - SURFACE
      ?auto_7246 - PLACE
      ?auto_7252 - HOIST
      ?auto_7257 - SURFACE
      ?auto_7236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7234 ?auto_7235 ) ( IS-CRATE ?auto_7233 ) ( not ( = ?auto_7238 ?auto_7235 ) ) ( HOIST-AT ?auto_7239 ?auto_7238 ) ( AVAILABLE ?auto_7239 ) ( SURFACE-AT ?auto_7233 ?auto_7238 ) ( ON ?auto_7233 ?auto_7237 ) ( CLEAR ?auto_7233 ) ( not ( = ?auto_7232 ?auto_7233 ) ) ( not ( = ?auto_7232 ?auto_7237 ) ) ( not ( = ?auto_7233 ?auto_7237 ) ) ( not ( = ?auto_7234 ?auto_7239 ) ) ( IS-CRATE ?auto_7232 ) ( not ( = ?auto_7253 ?auto_7235 ) ) ( HOIST-AT ?auto_7250 ?auto_7253 ) ( AVAILABLE ?auto_7250 ) ( SURFACE-AT ?auto_7232 ?auto_7253 ) ( ON ?auto_7232 ?auto_7241 ) ( CLEAR ?auto_7232 ) ( not ( = ?auto_7231 ?auto_7232 ) ) ( not ( = ?auto_7231 ?auto_7241 ) ) ( not ( = ?auto_7232 ?auto_7241 ) ) ( not ( = ?auto_7234 ?auto_7250 ) ) ( IS-CRATE ?auto_7231 ) ( not ( = ?auto_7240 ?auto_7235 ) ) ( HOIST-AT ?auto_7244 ?auto_7240 ) ( AVAILABLE ?auto_7244 ) ( SURFACE-AT ?auto_7231 ?auto_7240 ) ( ON ?auto_7231 ?auto_7247 ) ( CLEAR ?auto_7231 ) ( not ( = ?auto_7230 ?auto_7231 ) ) ( not ( = ?auto_7230 ?auto_7247 ) ) ( not ( = ?auto_7231 ?auto_7247 ) ) ( not ( = ?auto_7234 ?auto_7244 ) ) ( IS-CRATE ?auto_7230 ) ( not ( = ?auto_7243 ?auto_7235 ) ) ( HOIST-AT ?auto_7251 ?auto_7243 ) ( AVAILABLE ?auto_7251 ) ( SURFACE-AT ?auto_7230 ?auto_7243 ) ( ON ?auto_7230 ?auto_7254 ) ( CLEAR ?auto_7230 ) ( not ( = ?auto_7229 ?auto_7230 ) ) ( not ( = ?auto_7229 ?auto_7254 ) ) ( not ( = ?auto_7230 ?auto_7254 ) ) ( not ( = ?auto_7234 ?auto_7251 ) ) ( IS-CRATE ?auto_7229 ) ( not ( = ?auto_7255 ?auto_7235 ) ) ( HOIST-AT ?auto_7249 ?auto_7255 ) ( AVAILABLE ?auto_7249 ) ( SURFACE-AT ?auto_7229 ?auto_7255 ) ( ON ?auto_7229 ?auto_7248 ) ( CLEAR ?auto_7229 ) ( not ( = ?auto_7228 ?auto_7229 ) ) ( not ( = ?auto_7228 ?auto_7248 ) ) ( not ( = ?auto_7229 ?auto_7248 ) ) ( not ( = ?auto_7234 ?auto_7249 ) ) ( IS-CRATE ?auto_7228 ) ( not ( = ?auto_7256 ?auto_7235 ) ) ( HOIST-AT ?auto_7245 ?auto_7256 ) ( AVAILABLE ?auto_7245 ) ( SURFACE-AT ?auto_7228 ?auto_7256 ) ( ON ?auto_7228 ?auto_7242 ) ( CLEAR ?auto_7228 ) ( not ( = ?auto_7227 ?auto_7228 ) ) ( not ( = ?auto_7227 ?auto_7242 ) ) ( not ( = ?auto_7228 ?auto_7242 ) ) ( not ( = ?auto_7234 ?auto_7245 ) ) ( SURFACE-AT ?auto_7226 ?auto_7235 ) ( CLEAR ?auto_7226 ) ( IS-CRATE ?auto_7227 ) ( AVAILABLE ?auto_7234 ) ( not ( = ?auto_7246 ?auto_7235 ) ) ( HOIST-AT ?auto_7252 ?auto_7246 ) ( AVAILABLE ?auto_7252 ) ( SURFACE-AT ?auto_7227 ?auto_7246 ) ( ON ?auto_7227 ?auto_7257 ) ( CLEAR ?auto_7227 ) ( TRUCK-AT ?auto_7236 ?auto_7235 ) ( not ( = ?auto_7226 ?auto_7227 ) ) ( not ( = ?auto_7226 ?auto_7257 ) ) ( not ( = ?auto_7227 ?auto_7257 ) ) ( not ( = ?auto_7234 ?auto_7252 ) ) ( not ( = ?auto_7226 ?auto_7228 ) ) ( not ( = ?auto_7226 ?auto_7242 ) ) ( not ( = ?auto_7228 ?auto_7257 ) ) ( not ( = ?auto_7256 ?auto_7246 ) ) ( not ( = ?auto_7245 ?auto_7252 ) ) ( not ( = ?auto_7242 ?auto_7257 ) ) ( not ( = ?auto_7226 ?auto_7229 ) ) ( not ( = ?auto_7226 ?auto_7248 ) ) ( not ( = ?auto_7227 ?auto_7229 ) ) ( not ( = ?auto_7227 ?auto_7248 ) ) ( not ( = ?auto_7229 ?auto_7242 ) ) ( not ( = ?auto_7229 ?auto_7257 ) ) ( not ( = ?auto_7255 ?auto_7256 ) ) ( not ( = ?auto_7255 ?auto_7246 ) ) ( not ( = ?auto_7249 ?auto_7245 ) ) ( not ( = ?auto_7249 ?auto_7252 ) ) ( not ( = ?auto_7248 ?auto_7242 ) ) ( not ( = ?auto_7248 ?auto_7257 ) ) ( not ( = ?auto_7226 ?auto_7230 ) ) ( not ( = ?auto_7226 ?auto_7254 ) ) ( not ( = ?auto_7227 ?auto_7230 ) ) ( not ( = ?auto_7227 ?auto_7254 ) ) ( not ( = ?auto_7228 ?auto_7230 ) ) ( not ( = ?auto_7228 ?auto_7254 ) ) ( not ( = ?auto_7230 ?auto_7248 ) ) ( not ( = ?auto_7230 ?auto_7242 ) ) ( not ( = ?auto_7230 ?auto_7257 ) ) ( not ( = ?auto_7243 ?auto_7255 ) ) ( not ( = ?auto_7243 ?auto_7256 ) ) ( not ( = ?auto_7243 ?auto_7246 ) ) ( not ( = ?auto_7251 ?auto_7249 ) ) ( not ( = ?auto_7251 ?auto_7245 ) ) ( not ( = ?auto_7251 ?auto_7252 ) ) ( not ( = ?auto_7254 ?auto_7248 ) ) ( not ( = ?auto_7254 ?auto_7242 ) ) ( not ( = ?auto_7254 ?auto_7257 ) ) ( not ( = ?auto_7226 ?auto_7231 ) ) ( not ( = ?auto_7226 ?auto_7247 ) ) ( not ( = ?auto_7227 ?auto_7231 ) ) ( not ( = ?auto_7227 ?auto_7247 ) ) ( not ( = ?auto_7228 ?auto_7231 ) ) ( not ( = ?auto_7228 ?auto_7247 ) ) ( not ( = ?auto_7229 ?auto_7231 ) ) ( not ( = ?auto_7229 ?auto_7247 ) ) ( not ( = ?auto_7231 ?auto_7254 ) ) ( not ( = ?auto_7231 ?auto_7248 ) ) ( not ( = ?auto_7231 ?auto_7242 ) ) ( not ( = ?auto_7231 ?auto_7257 ) ) ( not ( = ?auto_7240 ?auto_7243 ) ) ( not ( = ?auto_7240 ?auto_7255 ) ) ( not ( = ?auto_7240 ?auto_7256 ) ) ( not ( = ?auto_7240 ?auto_7246 ) ) ( not ( = ?auto_7244 ?auto_7251 ) ) ( not ( = ?auto_7244 ?auto_7249 ) ) ( not ( = ?auto_7244 ?auto_7245 ) ) ( not ( = ?auto_7244 ?auto_7252 ) ) ( not ( = ?auto_7247 ?auto_7254 ) ) ( not ( = ?auto_7247 ?auto_7248 ) ) ( not ( = ?auto_7247 ?auto_7242 ) ) ( not ( = ?auto_7247 ?auto_7257 ) ) ( not ( = ?auto_7226 ?auto_7232 ) ) ( not ( = ?auto_7226 ?auto_7241 ) ) ( not ( = ?auto_7227 ?auto_7232 ) ) ( not ( = ?auto_7227 ?auto_7241 ) ) ( not ( = ?auto_7228 ?auto_7232 ) ) ( not ( = ?auto_7228 ?auto_7241 ) ) ( not ( = ?auto_7229 ?auto_7232 ) ) ( not ( = ?auto_7229 ?auto_7241 ) ) ( not ( = ?auto_7230 ?auto_7232 ) ) ( not ( = ?auto_7230 ?auto_7241 ) ) ( not ( = ?auto_7232 ?auto_7247 ) ) ( not ( = ?auto_7232 ?auto_7254 ) ) ( not ( = ?auto_7232 ?auto_7248 ) ) ( not ( = ?auto_7232 ?auto_7242 ) ) ( not ( = ?auto_7232 ?auto_7257 ) ) ( not ( = ?auto_7253 ?auto_7240 ) ) ( not ( = ?auto_7253 ?auto_7243 ) ) ( not ( = ?auto_7253 ?auto_7255 ) ) ( not ( = ?auto_7253 ?auto_7256 ) ) ( not ( = ?auto_7253 ?auto_7246 ) ) ( not ( = ?auto_7250 ?auto_7244 ) ) ( not ( = ?auto_7250 ?auto_7251 ) ) ( not ( = ?auto_7250 ?auto_7249 ) ) ( not ( = ?auto_7250 ?auto_7245 ) ) ( not ( = ?auto_7250 ?auto_7252 ) ) ( not ( = ?auto_7241 ?auto_7247 ) ) ( not ( = ?auto_7241 ?auto_7254 ) ) ( not ( = ?auto_7241 ?auto_7248 ) ) ( not ( = ?auto_7241 ?auto_7242 ) ) ( not ( = ?auto_7241 ?auto_7257 ) ) ( not ( = ?auto_7226 ?auto_7233 ) ) ( not ( = ?auto_7226 ?auto_7237 ) ) ( not ( = ?auto_7227 ?auto_7233 ) ) ( not ( = ?auto_7227 ?auto_7237 ) ) ( not ( = ?auto_7228 ?auto_7233 ) ) ( not ( = ?auto_7228 ?auto_7237 ) ) ( not ( = ?auto_7229 ?auto_7233 ) ) ( not ( = ?auto_7229 ?auto_7237 ) ) ( not ( = ?auto_7230 ?auto_7233 ) ) ( not ( = ?auto_7230 ?auto_7237 ) ) ( not ( = ?auto_7231 ?auto_7233 ) ) ( not ( = ?auto_7231 ?auto_7237 ) ) ( not ( = ?auto_7233 ?auto_7241 ) ) ( not ( = ?auto_7233 ?auto_7247 ) ) ( not ( = ?auto_7233 ?auto_7254 ) ) ( not ( = ?auto_7233 ?auto_7248 ) ) ( not ( = ?auto_7233 ?auto_7242 ) ) ( not ( = ?auto_7233 ?auto_7257 ) ) ( not ( = ?auto_7238 ?auto_7253 ) ) ( not ( = ?auto_7238 ?auto_7240 ) ) ( not ( = ?auto_7238 ?auto_7243 ) ) ( not ( = ?auto_7238 ?auto_7255 ) ) ( not ( = ?auto_7238 ?auto_7256 ) ) ( not ( = ?auto_7238 ?auto_7246 ) ) ( not ( = ?auto_7239 ?auto_7250 ) ) ( not ( = ?auto_7239 ?auto_7244 ) ) ( not ( = ?auto_7239 ?auto_7251 ) ) ( not ( = ?auto_7239 ?auto_7249 ) ) ( not ( = ?auto_7239 ?auto_7245 ) ) ( not ( = ?auto_7239 ?auto_7252 ) ) ( not ( = ?auto_7237 ?auto_7241 ) ) ( not ( = ?auto_7237 ?auto_7247 ) ) ( not ( = ?auto_7237 ?auto_7254 ) ) ( not ( = ?auto_7237 ?auto_7248 ) ) ( not ( = ?auto_7237 ?auto_7242 ) ) ( not ( = ?auto_7237 ?auto_7257 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7226 ?auto_7227 ?auto_7228 ?auto_7229 ?auto_7230 ?auto_7231 ?auto_7232 )
      ( MAKE-1CRATE ?auto_7232 ?auto_7233 )
      ( MAKE-7CRATE-VERIFY ?auto_7226 ?auto_7227 ?auto_7228 ?auto_7229 ?auto_7230 ?auto_7231 ?auto_7232 ?auto_7233 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_7277 - SURFACE
      ?auto_7278 - SURFACE
      ?auto_7279 - SURFACE
      ?auto_7280 - SURFACE
      ?auto_7281 - SURFACE
      ?auto_7282 - SURFACE
      ?auto_7283 - SURFACE
      ?auto_7284 - SURFACE
      ?auto_7285 - SURFACE
    )
    :vars
    (
      ?auto_7286 - HOIST
      ?auto_7287 - PLACE
      ?auto_7289 - PLACE
      ?auto_7288 - HOIST
      ?auto_7291 - SURFACE
      ?auto_7294 - PLACE
      ?auto_7292 - HOIST
      ?auto_7310 - SURFACE
      ?auto_7307 - PLACE
      ?auto_7306 - HOIST
      ?auto_7303 - SURFACE
      ?auto_7309 - PLACE
      ?auto_7298 - HOIST
      ?auto_7297 - SURFACE
      ?auto_7302 - PLACE
      ?auto_7296 - HOIST
      ?auto_7299 - SURFACE
      ?auto_7305 - SURFACE
      ?auto_7301 - PLACE
      ?auto_7300 - HOIST
      ?auto_7295 - SURFACE
      ?auto_7304 - PLACE
      ?auto_7308 - HOIST
      ?auto_7293 - SURFACE
      ?auto_7290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7286 ?auto_7287 ) ( IS-CRATE ?auto_7285 ) ( not ( = ?auto_7289 ?auto_7287 ) ) ( HOIST-AT ?auto_7288 ?auto_7289 ) ( SURFACE-AT ?auto_7285 ?auto_7289 ) ( ON ?auto_7285 ?auto_7291 ) ( CLEAR ?auto_7285 ) ( not ( = ?auto_7284 ?auto_7285 ) ) ( not ( = ?auto_7284 ?auto_7291 ) ) ( not ( = ?auto_7285 ?auto_7291 ) ) ( not ( = ?auto_7286 ?auto_7288 ) ) ( IS-CRATE ?auto_7284 ) ( not ( = ?auto_7294 ?auto_7287 ) ) ( HOIST-AT ?auto_7292 ?auto_7294 ) ( AVAILABLE ?auto_7292 ) ( SURFACE-AT ?auto_7284 ?auto_7294 ) ( ON ?auto_7284 ?auto_7310 ) ( CLEAR ?auto_7284 ) ( not ( = ?auto_7283 ?auto_7284 ) ) ( not ( = ?auto_7283 ?auto_7310 ) ) ( not ( = ?auto_7284 ?auto_7310 ) ) ( not ( = ?auto_7286 ?auto_7292 ) ) ( IS-CRATE ?auto_7283 ) ( not ( = ?auto_7307 ?auto_7287 ) ) ( HOIST-AT ?auto_7306 ?auto_7307 ) ( AVAILABLE ?auto_7306 ) ( SURFACE-AT ?auto_7283 ?auto_7307 ) ( ON ?auto_7283 ?auto_7303 ) ( CLEAR ?auto_7283 ) ( not ( = ?auto_7282 ?auto_7283 ) ) ( not ( = ?auto_7282 ?auto_7303 ) ) ( not ( = ?auto_7283 ?auto_7303 ) ) ( not ( = ?auto_7286 ?auto_7306 ) ) ( IS-CRATE ?auto_7282 ) ( not ( = ?auto_7309 ?auto_7287 ) ) ( HOIST-AT ?auto_7298 ?auto_7309 ) ( AVAILABLE ?auto_7298 ) ( SURFACE-AT ?auto_7282 ?auto_7309 ) ( ON ?auto_7282 ?auto_7297 ) ( CLEAR ?auto_7282 ) ( not ( = ?auto_7281 ?auto_7282 ) ) ( not ( = ?auto_7281 ?auto_7297 ) ) ( not ( = ?auto_7282 ?auto_7297 ) ) ( not ( = ?auto_7286 ?auto_7298 ) ) ( IS-CRATE ?auto_7281 ) ( not ( = ?auto_7302 ?auto_7287 ) ) ( HOIST-AT ?auto_7296 ?auto_7302 ) ( AVAILABLE ?auto_7296 ) ( SURFACE-AT ?auto_7281 ?auto_7302 ) ( ON ?auto_7281 ?auto_7299 ) ( CLEAR ?auto_7281 ) ( not ( = ?auto_7280 ?auto_7281 ) ) ( not ( = ?auto_7280 ?auto_7299 ) ) ( not ( = ?auto_7281 ?auto_7299 ) ) ( not ( = ?auto_7286 ?auto_7296 ) ) ( IS-CRATE ?auto_7280 ) ( AVAILABLE ?auto_7288 ) ( SURFACE-AT ?auto_7280 ?auto_7289 ) ( ON ?auto_7280 ?auto_7305 ) ( CLEAR ?auto_7280 ) ( not ( = ?auto_7279 ?auto_7280 ) ) ( not ( = ?auto_7279 ?auto_7305 ) ) ( not ( = ?auto_7280 ?auto_7305 ) ) ( IS-CRATE ?auto_7279 ) ( not ( = ?auto_7301 ?auto_7287 ) ) ( HOIST-AT ?auto_7300 ?auto_7301 ) ( AVAILABLE ?auto_7300 ) ( SURFACE-AT ?auto_7279 ?auto_7301 ) ( ON ?auto_7279 ?auto_7295 ) ( CLEAR ?auto_7279 ) ( not ( = ?auto_7278 ?auto_7279 ) ) ( not ( = ?auto_7278 ?auto_7295 ) ) ( not ( = ?auto_7279 ?auto_7295 ) ) ( not ( = ?auto_7286 ?auto_7300 ) ) ( SURFACE-AT ?auto_7277 ?auto_7287 ) ( CLEAR ?auto_7277 ) ( IS-CRATE ?auto_7278 ) ( AVAILABLE ?auto_7286 ) ( not ( = ?auto_7304 ?auto_7287 ) ) ( HOIST-AT ?auto_7308 ?auto_7304 ) ( AVAILABLE ?auto_7308 ) ( SURFACE-AT ?auto_7278 ?auto_7304 ) ( ON ?auto_7278 ?auto_7293 ) ( CLEAR ?auto_7278 ) ( TRUCK-AT ?auto_7290 ?auto_7287 ) ( not ( = ?auto_7277 ?auto_7278 ) ) ( not ( = ?auto_7277 ?auto_7293 ) ) ( not ( = ?auto_7278 ?auto_7293 ) ) ( not ( = ?auto_7286 ?auto_7308 ) ) ( not ( = ?auto_7277 ?auto_7279 ) ) ( not ( = ?auto_7277 ?auto_7295 ) ) ( not ( = ?auto_7279 ?auto_7293 ) ) ( not ( = ?auto_7301 ?auto_7304 ) ) ( not ( = ?auto_7300 ?auto_7308 ) ) ( not ( = ?auto_7295 ?auto_7293 ) ) ( not ( = ?auto_7277 ?auto_7280 ) ) ( not ( = ?auto_7277 ?auto_7305 ) ) ( not ( = ?auto_7278 ?auto_7280 ) ) ( not ( = ?auto_7278 ?auto_7305 ) ) ( not ( = ?auto_7280 ?auto_7295 ) ) ( not ( = ?auto_7280 ?auto_7293 ) ) ( not ( = ?auto_7289 ?auto_7301 ) ) ( not ( = ?auto_7289 ?auto_7304 ) ) ( not ( = ?auto_7288 ?auto_7300 ) ) ( not ( = ?auto_7288 ?auto_7308 ) ) ( not ( = ?auto_7305 ?auto_7295 ) ) ( not ( = ?auto_7305 ?auto_7293 ) ) ( not ( = ?auto_7277 ?auto_7281 ) ) ( not ( = ?auto_7277 ?auto_7299 ) ) ( not ( = ?auto_7278 ?auto_7281 ) ) ( not ( = ?auto_7278 ?auto_7299 ) ) ( not ( = ?auto_7279 ?auto_7281 ) ) ( not ( = ?auto_7279 ?auto_7299 ) ) ( not ( = ?auto_7281 ?auto_7305 ) ) ( not ( = ?auto_7281 ?auto_7295 ) ) ( not ( = ?auto_7281 ?auto_7293 ) ) ( not ( = ?auto_7302 ?auto_7289 ) ) ( not ( = ?auto_7302 ?auto_7301 ) ) ( not ( = ?auto_7302 ?auto_7304 ) ) ( not ( = ?auto_7296 ?auto_7288 ) ) ( not ( = ?auto_7296 ?auto_7300 ) ) ( not ( = ?auto_7296 ?auto_7308 ) ) ( not ( = ?auto_7299 ?auto_7305 ) ) ( not ( = ?auto_7299 ?auto_7295 ) ) ( not ( = ?auto_7299 ?auto_7293 ) ) ( not ( = ?auto_7277 ?auto_7282 ) ) ( not ( = ?auto_7277 ?auto_7297 ) ) ( not ( = ?auto_7278 ?auto_7282 ) ) ( not ( = ?auto_7278 ?auto_7297 ) ) ( not ( = ?auto_7279 ?auto_7282 ) ) ( not ( = ?auto_7279 ?auto_7297 ) ) ( not ( = ?auto_7280 ?auto_7282 ) ) ( not ( = ?auto_7280 ?auto_7297 ) ) ( not ( = ?auto_7282 ?auto_7299 ) ) ( not ( = ?auto_7282 ?auto_7305 ) ) ( not ( = ?auto_7282 ?auto_7295 ) ) ( not ( = ?auto_7282 ?auto_7293 ) ) ( not ( = ?auto_7309 ?auto_7302 ) ) ( not ( = ?auto_7309 ?auto_7289 ) ) ( not ( = ?auto_7309 ?auto_7301 ) ) ( not ( = ?auto_7309 ?auto_7304 ) ) ( not ( = ?auto_7298 ?auto_7296 ) ) ( not ( = ?auto_7298 ?auto_7288 ) ) ( not ( = ?auto_7298 ?auto_7300 ) ) ( not ( = ?auto_7298 ?auto_7308 ) ) ( not ( = ?auto_7297 ?auto_7299 ) ) ( not ( = ?auto_7297 ?auto_7305 ) ) ( not ( = ?auto_7297 ?auto_7295 ) ) ( not ( = ?auto_7297 ?auto_7293 ) ) ( not ( = ?auto_7277 ?auto_7283 ) ) ( not ( = ?auto_7277 ?auto_7303 ) ) ( not ( = ?auto_7278 ?auto_7283 ) ) ( not ( = ?auto_7278 ?auto_7303 ) ) ( not ( = ?auto_7279 ?auto_7283 ) ) ( not ( = ?auto_7279 ?auto_7303 ) ) ( not ( = ?auto_7280 ?auto_7283 ) ) ( not ( = ?auto_7280 ?auto_7303 ) ) ( not ( = ?auto_7281 ?auto_7283 ) ) ( not ( = ?auto_7281 ?auto_7303 ) ) ( not ( = ?auto_7283 ?auto_7297 ) ) ( not ( = ?auto_7283 ?auto_7299 ) ) ( not ( = ?auto_7283 ?auto_7305 ) ) ( not ( = ?auto_7283 ?auto_7295 ) ) ( not ( = ?auto_7283 ?auto_7293 ) ) ( not ( = ?auto_7307 ?auto_7309 ) ) ( not ( = ?auto_7307 ?auto_7302 ) ) ( not ( = ?auto_7307 ?auto_7289 ) ) ( not ( = ?auto_7307 ?auto_7301 ) ) ( not ( = ?auto_7307 ?auto_7304 ) ) ( not ( = ?auto_7306 ?auto_7298 ) ) ( not ( = ?auto_7306 ?auto_7296 ) ) ( not ( = ?auto_7306 ?auto_7288 ) ) ( not ( = ?auto_7306 ?auto_7300 ) ) ( not ( = ?auto_7306 ?auto_7308 ) ) ( not ( = ?auto_7303 ?auto_7297 ) ) ( not ( = ?auto_7303 ?auto_7299 ) ) ( not ( = ?auto_7303 ?auto_7305 ) ) ( not ( = ?auto_7303 ?auto_7295 ) ) ( not ( = ?auto_7303 ?auto_7293 ) ) ( not ( = ?auto_7277 ?auto_7284 ) ) ( not ( = ?auto_7277 ?auto_7310 ) ) ( not ( = ?auto_7278 ?auto_7284 ) ) ( not ( = ?auto_7278 ?auto_7310 ) ) ( not ( = ?auto_7279 ?auto_7284 ) ) ( not ( = ?auto_7279 ?auto_7310 ) ) ( not ( = ?auto_7280 ?auto_7284 ) ) ( not ( = ?auto_7280 ?auto_7310 ) ) ( not ( = ?auto_7281 ?auto_7284 ) ) ( not ( = ?auto_7281 ?auto_7310 ) ) ( not ( = ?auto_7282 ?auto_7284 ) ) ( not ( = ?auto_7282 ?auto_7310 ) ) ( not ( = ?auto_7284 ?auto_7303 ) ) ( not ( = ?auto_7284 ?auto_7297 ) ) ( not ( = ?auto_7284 ?auto_7299 ) ) ( not ( = ?auto_7284 ?auto_7305 ) ) ( not ( = ?auto_7284 ?auto_7295 ) ) ( not ( = ?auto_7284 ?auto_7293 ) ) ( not ( = ?auto_7294 ?auto_7307 ) ) ( not ( = ?auto_7294 ?auto_7309 ) ) ( not ( = ?auto_7294 ?auto_7302 ) ) ( not ( = ?auto_7294 ?auto_7289 ) ) ( not ( = ?auto_7294 ?auto_7301 ) ) ( not ( = ?auto_7294 ?auto_7304 ) ) ( not ( = ?auto_7292 ?auto_7306 ) ) ( not ( = ?auto_7292 ?auto_7298 ) ) ( not ( = ?auto_7292 ?auto_7296 ) ) ( not ( = ?auto_7292 ?auto_7288 ) ) ( not ( = ?auto_7292 ?auto_7300 ) ) ( not ( = ?auto_7292 ?auto_7308 ) ) ( not ( = ?auto_7310 ?auto_7303 ) ) ( not ( = ?auto_7310 ?auto_7297 ) ) ( not ( = ?auto_7310 ?auto_7299 ) ) ( not ( = ?auto_7310 ?auto_7305 ) ) ( not ( = ?auto_7310 ?auto_7295 ) ) ( not ( = ?auto_7310 ?auto_7293 ) ) ( not ( = ?auto_7277 ?auto_7285 ) ) ( not ( = ?auto_7277 ?auto_7291 ) ) ( not ( = ?auto_7278 ?auto_7285 ) ) ( not ( = ?auto_7278 ?auto_7291 ) ) ( not ( = ?auto_7279 ?auto_7285 ) ) ( not ( = ?auto_7279 ?auto_7291 ) ) ( not ( = ?auto_7280 ?auto_7285 ) ) ( not ( = ?auto_7280 ?auto_7291 ) ) ( not ( = ?auto_7281 ?auto_7285 ) ) ( not ( = ?auto_7281 ?auto_7291 ) ) ( not ( = ?auto_7282 ?auto_7285 ) ) ( not ( = ?auto_7282 ?auto_7291 ) ) ( not ( = ?auto_7283 ?auto_7285 ) ) ( not ( = ?auto_7283 ?auto_7291 ) ) ( not ( = ?auto_7285 ?auto_7310 ) ) ( not ( = ?auto_7285 ?auto_7303 ) ) ( not ( = ?auto_7285 ?auto_7297 ) ) ( not ( = ?auto_7285 ?auto_7299 ) ) ( not ( = ?auto_7285 ?auto_7305 ) ) ( not ( = ?auto_7285 ?auto_7295 ) ) ( not ( = ?auto_7285 ?auto_7293 ) ) ( not ( = ?auto_7291 ?auto_7310 ) ) ( not ( = ?auto_7291 ?auto_7303 ) ) ( not ( = ?auto_7291 ?auto_7297 ) ) ( not ( = ?auto_7291 ?auto_7299 ) ) ( not ( = ?auto_7291 ?auto_7305 ) ) ( not ( = ?auto_7291 ?auto_7295 ) ) ( not ( = ?auto_7291 ?auto_7293 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7277 ?auto_7278 ?auto_7279 ?auto_7280 ?auto_7281 ?auto_7282 ?auto_7283 ?auto_7284 )
      ( MAKE-1CRATE ?auto_7284 ?auto_7285 )
      ( MAKE-8CRATE-VERIFY ?auto_7277 ?auto_7278 ?auto_7279 ?auto_7280 ?auto_7281 ?auto_7282 ?auto_7283 ?auto_7284 ?auto_7285 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_7331 - SURFACE
      ?auto_7332 - SURFACE
      ?auto_7333 - SURFACE
      ?auto_7334 - SURFACE
      ?auto_7335 - SURFACE
      ?auto_7336 - SURFACE
      ?auto_7337 - SURFACE
      ?auto_7338 - SURFACE
      ?auto_7339 - SURFACE
      ?auto_7340 - SURFACE
    )
    :vars
    (
      ?auto_7345 - HOIST
      ?auto_7342 - PLACE
      ?auto_7343 - PLACE
      ?auto_7344 - HOIST
      ?auto_7341 - SURFACE
      ?auto_7364 - PLACE
      ?auto_7361 - HOIST
      ?auto_7363 - SURFACE
      ?auto_7356 - PLACE
      ?auto_7368 - HOIST
      ?auto_7349 - SURFACE
      ?auto_7354 - PLACE
      ?auto_7359 - HOIST
      ?auto_7351 - SURFACE
      ?auto_7365 - PLACE
      ?auto_7362 - HOIST
      ?auto_7352 - SURFACE
      ?auto_7347 - PLACE
      ?auto_7348 - HOIST
      ?auto_7355 - SURFACE
      ?auto_7358 - SURFACE
      ?auto_7366 - PLACE
      ?auto_7353 - HOIST
      ?auto_7357 - SURFACE
      ?auto_7350 - PLACE
      ?auto_7367 - HOIST
      ?auto_7360 - SURFACE
      ?auto_7346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7345 ?auto_7342 ) ( IS-CRATE ?auto_7340 ) ( not ( = ?auto_7343 ?auto_7342 ) ) ( HOIST-AT ?auto_7344 ?auto_7343 ) ( AVAILABLE ?auto_7344 ) ( SURFACE-AT ?auto_7340 ?auto_7343 ) ( ON ?auto_7340 ?auto_7341 ) ( CLEAR ?auto_7340 ) ( not ( = ?auto_7339 ?auto_7340 ) ) ( not ( = ?auto_7339 ?auto_7341 ) ) ( not ( = ?auto_7340 ?auto_7341 ) ) ( not ( = ?auto_7345 ?auto_7344 ) ) ( IS-CRATE ?auto_7339 ) ( not ( = ?auto_7364 ?auto_7342 ) ) ( HOIST-AT ?auto_7361 ?auto_7364 ) ( SURFACE-AT ?auto_7339 ?auto_7364 ) ( ON ?auto_7339 ?auto_7363 ) ( CLEAR ?auto_7339 ) ( not ( = ?auto_7338 ?auto_7339 ) ) ( not ( = ?auto_7338 ?auto_7363 ) ) ( not ( = ?auto_7339 ?auto_7363 ) ) ( not ( = ?auto_7345 ?auto_7361 ) ) ( IS-CRATE ?auto_7338 ) ( not ( = ?auto_7356 ?auto_7342 ) ) ( HOIST-AT ?auto_7368 ?auto_7356 ) ( AVAILABLE ?auto_7368 ) ( SURFACE-AT ?auto_7338 ?auto_7356 ) ( ON ?auto_7338 ?auto_7349 ) ( CLEAR ?auto_7338 ) ( not ( = ?auto_7337 ?auto_7338 ) ) ( not ( = ?auto_7337 ?auto_7349 ) ) ( not ( = ?auto_7338 ?auto_7349 ) ) ( not ( = ?auto_7345 ?auto_7368 ) ) ( IS-CRATE ?auto_7337 ) ( not ( = ?auto_7354 ?auto_7342 ) ) ( HOIST-AT ?auto_7359 ?auto_7354 ) ( AVAILABLE ?auto_7359 ) ( SURFACE-AT ?auto_7337 ?auto_7354 ) ( ON ?auto_7337 ?auto_7351 ) ( CLEAR ?auto_7337 ) ( not ( = ?auto_7336 ?auto_7337 ) ) ( not ( = ?auto_7336 ?auto_7351 ) ) ( not ( = ?auto_7337 ?auto_7351 ) ) ( not ( = ?auto_7345 ?auto_7359 ) ) ( IS-CRATE ?auto_7336 ) ( not ( = ?auto_7365 ?auto_7342 ) ) ( HOIST-AT ?auto_7362 ?auto_7365 ) ( AVAILABLE ?auto_7362 ) ( SURFACE-AT ?auto_7336 ?auto_7365 ) ( ON ?auto_7336 ?auto_7352 ) ( CLEAR ?auto_7336 ) ( not ( = ?auto_7335 ?auto_7336 ) ) ( not ( = ?auto_7335 ?auto_7352 ) ) ( not ( = ?auto_7336 ?auto_7352 ) ) ( not ( = ?auto_7345 ?auto_7362 ) ) ( IS-CRATE ?auto_7335 ) ( not ( = ?auto_7347 ?auto_7342 ) ) ( HOIST-AT ?auto_7348 ?auto_7347 ) ( AVAILABLE ?auto_7348 ) ( SURFACE-AT ?auto_7335 ?auto_7347 ) ( ON ?auto_7335 ?auto_7355 ) ( CLEAR ?auto_7335 ) ( not ( = ?auto_7334 ?auto_7335 ) ) ( not ( = ?auto_7334 ?auto_7355 ) ) ( not ( = ?auto_7335 ?auto_7355 ) ) ( not ( = ?auto_7345 ?auto_7348 ) ) ( IS-CRATE ?auto_7334 ) ( AVAILABLE ?auto_7361 ) ( SURFACE-AT ?auto_7334 ?auto_7364 ) ( ON ?auto_7334 ?auto_7358 ) ( CLEAR ?auto_7334 ) ( not ( = ?auto_7333 ?auto_7334 ) ) ( not ( = ?auto_7333 ?auto_7358 ) ) ( not ( = ?auto_7334 ?auto_7358 ) ) ( IS-CRATE ?auto_7333 ) ( not ( = ?auto_7366 ?auto_7342 ) ) ( HOIST-AT ?auto_7353 ?auto_7366 ) ( AVAILABLE ?auto_7353 ) ( SURFACE-AT ?auto_7333 ?auto_7366 ) ( ON ?auto_7333 ?auto_7357 ) ( CLEAR ?auto_7333 ) ( not ( = ?auto_7332 ?auto_7333 ) ) ( not ( = ?auto_7332 ?auto_7357 ) ) ( not ( = ?auto_7333 ?auto_7357 ) ) ( not ( = ?auto_7345 ?auto_7353 ) ) ( SURFACE-AT ?auto_7331 ?auto_7342 ) ( CLEAR ?auto_7331 ) ( IS-CRATE ?auto_7332 ) ( AVAILABLE ?auto_7345 ) ( not ( = ?auto_7350 ?auto_7342 ) ) ( HOIST-AT ?auto_7367 ?auto_7350 ) ( AVAILABLE ?auto_7367 ) ( SURFACE-AT ?auto_7332 ?auto_7350 ) ( ON ?auto_7332 ?auto_7360 ) ( CLEAR ?auto_7332 ) ( TRUCK-AT ?auto_7346 ?auto_7342 ) ( not ( = ?auto_7331 ?auto_7332 ) ) ( not ( = ?auto_7331 ?auto_7360 ) ) ( not ( = ?auto_7332 ?auto_7360 ) ) ( not ( = ?auto_7345 ?auto_7367 ) ) ( not ( = ?auto_7331 ?auto_7333 ) ) ( not ( = ?auto_7331 ?auto_7357 ) ) ( not ( = ?auto_7333 ?auto_7360 ) ) ( not ( = ?auto_7366 ?auto_7350 ) ) ( not ( = ?auto_7353 ?auto_7367 ) ) ( not ( = ?auto_7357 ?auto_7360 ) ) ( not ( = ?auto_7331 ?auto_7334 ) ) ( not ( = ?auto_7331 ?auto_7358 ) ) ( not ( = ?auto_7332 ?auto_7334 ) ) ( not ( = ?auto_7332 ?auto_7358 ) ) ( not ( = ?auto_7334 ?auto_7357 ) ) ( not ( = ?auto_7334 ?auto_7360 ) ) ( not ( = ?auto_7364 ?auto_7366 ) ) ( not ( = ?auto_7364 ?auto_7350 ) ) ( not ( = ?auto_7361 ?auto_7353 ) ) ( not ( = ?auto_7361 ?auto_7367 ) ) ( not ( = ?auto_7358 ?auto_7357 ) ) ( not ( = ?auto_7358 ?auto_7360 ) ) ( not ( = ?auto_7331 ?auto_7335 ) ) ( not ( = ?auto_7331 ?auto_7355 ) ) ( not ( = ?auto_7332 ?auto_7335 ) ) ( not ( = ?auto_7332 ?auto_7355 ) ) ( not ( = ?auto_7333 ?auto_7335 ) ) ( not ( = ?auto_7333 ?auto_7355 ) ) ( not ( = ?auto_7335 ?auto_7358 ) ) ( not ( = ?auto_7335 ?auto_7357 ) ) ( not ( = ?auto_7335 ?auto_7360 ) ) ( not ( = ?auto_7347 ?auto_7364 ) ) ( not ( = ?auto_7347 ?auto_7366 ) ) ( not ( = ?auto_7347 ?auto_7350 ) ) ( not ( = ?auto_7348 ?auto_7361 ) ) ( not ( = ?auto_7348 ?auto_7353 ) ) ( not ( = ?auto_7348 ?auto_7367 ) ) ( not ( = ?auto_7355 ?auto_7358 ) ) ( not ( = ?auto_7355 ?auto_7357 ) ) ( not ( = ?auto_7355 ?auto_7360 ) ) ( not ( = ?auto_7331 ?auto_7336 ) ) ( not ( = ?auto_7331 ?auto_7352 ) ) ( not ( = ?auto_7332 ?auto_7336 ) ) ( not ( = ?auto_7332 ?auto_7352 ) ) ( not ( = ?auto_7333 ?auto_7336 ) ) ( not ( = ?auto_7333 ?auto_7352 ) ) ( not ( = ?auto_7334 ?auto_7336 ) ) ( not ( = ?auto_7334 ?auto_7352 ) ) ( not ( = ?auto_7336 ?auto_7355 ) ) ( not ( = ?auto_7336 ?auto_7358 ) ) ( not ( = ?auto_7336 ?auto_7357 ) ) ( not ( = ?auto_7336 ?auto_7360 ) ) ( not ( = ?auto_7365 ?auto_7347 ) ) ( not ( = ?auto_7365 ?auto_7364 ) ) ( not ( = ?auto_7365 ?auto_7366 ) ) ( not ( = ?auto_7365 ?auto_7350 ) ) ( not ( = ?auto_7362 ?auto_7348 ) ) ( not ( = ?auto_7362 ?auto_7361 ) ) ( not ( = ?auto_7362 ?auto_7353 ) ) ( not ( = ?auto_7362 ?auto_7367 ) ) ( not ( = ?auto_7352 ?auto_7355 ) ) ( not ( = ?auto_7352 ?auto_7358 ) ) ( not ( = ?auto_7352 ?auto_7357 ) ) ( not ( = ?auto_7352 ?auto_7360 ) ) ( not ( = ?auto_7331 ?auto_7337 ) ) ( not ( = ?auto_7331 ?auto_7351 ) ) ( not ( = ?auto_7332 ?auto_7337 ) ) ( not ( = ?auto_7332 ?auto_7351 ) ) ( not ( = ?auto_7333 ?auto_7337 ) ) ( not ( = ?auto_7333 ?auto_7351 ) ) ( not ( = ?auto_7334 ?auto_7337 ) ) ( not ( = ?auto_7334 ?auto_7351 ) ) ( not ( = ?auto_7335 ?auto_7337 ) ) ( not ( = ?auto_7335 ?auto_7351 ) ) ( not ( = ?auto_7337 ?auto_7352 ) ) ( not ( = ?auto_7337 ?auto_7355 ) ) ( not ( = ?auto_7337 ?auto_7358 ) ) ( not ( = ?auto_7337 ?auto_7357 ) ) ( not ( = ?auto_7337 ?auto_7360 ) ) ( not ( = ?auto_7354 ?auto_7365 ) ) ( not ( = ?auto_7354 ?auto_7347 ) ) ( not ( = ?auto_7354 ?auto_7364 ) ) ( not ( = ?auto_7354 ?auto_7366 ) ) ( not ( = ?auto_7354 ?auto_7350 ) ) ( not ( = ?auto_7359 ?auto_7362 ) ) ( not ( = ?auto_7359 ?auto_7348 ) ) ( not ( = ?auto_7359 ?auto_7361 ) ) ( not ( = ?auto_7359 ?auto_7353 ) ) ( not ( = ?auto_7359 ?auto_7367 ) ) ( not ( = ?auto_7351 ?auto_7352 ) ) ( not ( = ?auto_7351 ?auto_7355 ) ) ( not ( = ?auto_7351 ?auto_7358 ) ) ( not ( = ?auto_7351 ?auto_7357 ) ) ( not ( = ?auto_7351 ?auto_7360 ) ) ( not ( = ?auto_7331 ?auto_7338 ) ) ( not ( = ?auto_7331 ?auto_7349 ) ) ( not ( = ?auto_7332 ?auto_7338 ) ) ( not ( = ?auto_7332 ?auto_7349 ) ) ( not ( = ?auto_7333 ?auto_7338 ) ) ( not ( = ?auto_7333 ?auto_7349 ) ) ( not ( = ?auto_7334 ?auto_7338 ) ) ( not ( = ?auto_7334 ?auto_7349 ) ) ( not ( = ?auto_7335 ?auto_7338 ) ) ( not ( = ?auto_7335 ?auto_7349 ) ) ( not ( = ?auto_7336 ?auto_7338 ) ) ( not ( = ?auto_7336 ?auto_7349 ) ) ( not ( = ?auto_7338 ?auto_7351 ) ) ( not ( = ?auto_7338 ?auto_7352 ) ) ( not ( = ?auto_7338 ?auto_7355 ) ) ( not ( = ?auto_7338 ?auto_7358 ) ) ( not ( = ?auto_7338 ?auto_7357 ) ) ( not ( = ?auto_7338 ?auto_7360 ) ) ( not ( = ?auto_7356 ?auto_7354 ) ) ( not ( = ?auto_7356 ?auto_7365 ) ) ( not ( = ?auto_7356 ?auto_7347 ) ) ( not ( = ?auto_7356 ?auto_7364 ) ) ( not ( = ?auto_7356 ?auto_7366 ) ) ( not ( = ?auto_7356 ?auto_7350 ) ) ( not ( = ?auto_7368 ?auto_7359 ) ) ( not ( = ?auto_7368 ?auto_7362 ) ) ( not ( = ?auto_7368 ?auto_7348 ) ) ( not ( = ?auto_7368 ?auto_7361 ) ) ( not ( = ?auto_7368 ?auto_7353 ) ) ( not ( = ?auto_7368 ?auto_7367 ) ) ( not ( = ?auto_7349 ?auto_7351 ) ) ( not ( = ?auto_7349 ?auto_7352 ) ) ( not ( = ?auto_7349 ?auto_7355 ) ) ( not ( = ?auto_7349 ?auto_7358 ) ) ( not ( = ?auto_7349 ?auto_7357 ) ) ( not ( = ?auto_7349 ?auto_7360 ) ) ( not ( = ?auto_7331 ?auto_7339 ) ) ( not ( = ?auto_7331 ?auto_7363 ) ) ( not ( = ?auto_7332 ?auto_7339 ) ) ( not ( = ?auto_7332 ?auto_7363 ) ) ( not ( = ?auto_7333 ?auto_7339 ) ) ( not ( = ?auto_7333 ?auto_7363 ) ) ( not ( = ?auto_7334 ?auto_7339 ) ) ( not ( = ?auto_7334 ?auto_7363 ) ) ( not ( = ?auto_7335 ?auto_7339 ) ) ( not ( = ?auto_7335 ?auto_7363 ) ) ( not ( = ?auto_7336 ?auto_7339 ) ) ( not ( = ?auto_7336 ?auto_7363 ) ) ( not ( = ?auto_7337 ?auto_7339 ) ) ( not ( = ?auto_7337 ?auto_7363 ) ) ( not ( = ?auto_7339 ?auto_7349 ) ) ( not ( = ?auto_7339 ?auto_7351 ) ) ( not ( = ?auto_7339 ?auto_7352 ) ) ( not ( = ?auto_7339 ?auto_7355 ) ) ( not ( = ?auto_7339 ?auto_7358 ) ) ( not ( = ?auto_7339 ?auto_7357 ) ) ( not ( = ?auto_7339 ?auto_7360 ) ) ( not ( = ?auto_7363 ?auto_7349 ) ) ( not ( = ?auto_7363 ?auto_7351 ) ) ( not ( = ?auto_7363 ?auto_7352 ) ) ( not ( = ?auto_7363 ?auto_7355 ) ) ( not ( = ?auto_7363 ?auto_7358 ) ) ( not ( = ?auto_7363 ?auto_7357 ) ) ( not ( = ?auto_7363 ?auto_7360 ) ) ( not ( = ?auto_7331 ?auto_7340 ) ) ( not ( = ?auto_7331 ?auto_7341 ) ) ( not ( = ?auto_7332 ?auto_7340 ) ) ( not ( = ?auto_7332 ?auto_7341 ) ) ( not ( = ?auto_7333 ?auto_7340 ) ) ( not ( = ?auto_7333 ?auto_7341 ) ) ( not ( = ?auto_7334 ?auto_7340 ) ) ( not ( = ?auto_7334 ?auto_7341 ) ) ( not ( = ?auto_7335 ?auto_7340 ) ) ( not ( = ?auto_7335 ?auto_7341 ) ) ( not ( = ?auto_7336 ?auto_7340 ) ) ( not ( = ?auto_7336 ?auto_7341 ) ) ( not ( = ?auto_7337 ?auto_7340 ) ) ( not ( = ?auto_7337 ?auto_7341 ) ) ( not ( = ?auto_7338 ?auto_7340 ) ) ( not ( = ?auto_7338 ?auto_7341 ) ) ( not ( = ?auto_7340 ?auto_7363 ) ) ( not ( = ?auto_7340 ?auto_7349 ) ) ( not ( = ?auto_7340 ?auto_7351 ) ) ( not ( = ?auto_7340 ?auto_7352 ) ) ( not ( = ?auto_7340 ?auto_7355 ) ) ( not ( = ?auto_7340 ?auto_7358 ) ) ( not ( = ?auto_7340 ?auto_7357 ) ) ( not ( = ?auto_7340 ?auto_7360 ) ) ( not ( = ?auto_7343 ?auto_7364 ) ) ( not ( = ?auto_7343 ?auto_7356 ) ) ( not ( = ?auto_7343 ?auto_7354 ) ) ( not ( = ?auto_7343 ?auto_7365 ) ) ( not ( = ?auto_7343 ?auto_7347 ) ) ( not ( = ?auto_7343 ?auto_7366 ) ) ( not ( = ?auto_7343 ?auto_7350 ) ) ( not ( = ?auto_7344 ?auto_7361 ) ) ( not ( = ?auto_7344 ?auto_7368 ) ) ( not ( = ?auto_7344 ?auto_7359 ) ) ( not ( = ?auto_7344 ?auto_7362 ) ) ( not ( = ?auto_7344 ?auto_7348 ) ) ( not ( = ?auto_7344 ?auto_7353 ) ) ( not ( = ?auto_7344 ?auto_7367 ) ) ( not ( = ?auto_7341 ?auto_7363 ) ) ( not ( = ?auto_7341 ?auto_7349 ) ) ( not ( = ?auto_7341 ?auto_7351 ) ) ( not ( = ?auto_7341 ?auto_7352 ) ) ( not ( = ?auto_7341 ?auto_7355 ) ) ( not ( = ?auto_7341 ?auto_7358 ) ) ( not ( = ?auto_7341 ?auto_7357 ) ) ( not ( = ?auto_7341 ?auto_7360 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_7331 ?auto_7332 ?auto_7333 ?auto_7334 ?auto_7335 ?auto_7336 ?auto_7337 ?auto_7338 ?auto_7339 )
      ( MAKE-1CRATE ?auto_7339 ?auto_7340 )
      ( MAKE-9CRATE-VERIFY ?auto_7331 ?auto_7332 ?auto_7333 ?auto_7334 ?auto_7335 ?auto_7336 ?auto_7337 ?auto_7338 ?auto_7339 ?auto_7340 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_7390 - SURFACE
      ?auto_7391 - SURFACE
      ?auto_7392 - SURFACE
      ?auto_7393 - SURFACE
      ?auto_7394 - SURFACE
      ?auto_7395 - SURFACE
      ?auto_7396 - SURFACE
      ?auto_7397 - SURFACE
      ?auto_7398 - SURFACE
      ?auto_7399 - SURFACE
      ?auto_7400 - SURFACE
    )
    :vars
    (
      ?auto_7405 - HOIST
      ?auto_7403 - PLACE
      ?auto_7406 - PLACE
      ?auto_7402 - HOIST
      ?auto_7401 - SURFACE
      ?auto_7431 - PLACE
      ?auto_7407 - HOIST
      ?auto_7428 - SURFACE
      ?auto_7417 - PLACE
      ?auto_7410 - HOIST
      ?auto_7416 - SURFACE
      ?auto_7427 - PLACE
      ?auto_7419 - HOIST
      ?auto_7412 - SURFACE
      ?auto_7426 - PLACE
      ?auto_7423 - HOIST
      ?auto_7425 - SURFACE
      ?auto_7409 - PLACE
      ?auto_7420 - HOIST
      ?auto_7429 - SURFACE
      ?auto_7421 - PLACE
      ?auto_7422 - HOIST
      ?auto_7430 - SURFACE
      ?auto_7408 - SURFACE
      ?auto_7411 - PLACE
      ?auto_7418 - HOIST
      ?auto_7414 - SURFACE
      ?auto_7415 - PLACE
      ?auto_7413 - HOIST
      ?auto_7424 - SURFACE
      ?auto_7404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7405 ?auto_7403 ) ( IS-CRATE ?auto_7400 ) ( not ( = ?auto_7406 ?auto_7403 ) ) ( HOIST-AT ?auto_7402 ?auto_7406 ) ( AVAILABLE ?auto_7402 ) ( SURFACE-AT ?auto_7400 ?auto_7406 ) ( ON ?auto_7400 ?auto_7401 ) ( CLEAR ?auto_7400 ) ( not ( = ?auto_7399 ?auto_7400 ) ) ( not ( = ?auto_7399 ?auto_7401 ) ) ( not ( = ?auto_7400 ?auto_7401 ) ) ( not ( = ?auto_7405 ?auto_7402 ) ) ( IS-CRATE ?auto_7399 ) ( not ( = ?auto_7431 ?auto_7403 ) ) ( HOIST-AT ?auto_7407 ?auto_7431 ) ( AVAILABLE ?auto_7407 ) ( SURFACE-AT ?auto_7399 ?auto_7431 ) ( ON ?auto_7399 ?auto_7428 ) ( CLEAR ?auto_7399 ) ( not ( = ?auto_7398 ?auto_7399 ) ) ( not ( = ?auto_7398 ?auto_7428 ) ) ( not ( = ?auto_7399 ?auto_7428 ) ) ( not ( = ?auto_7405 ?auto_7407 ) ) ( IS-CRATE ?auto_7398 ) ( not ( = ?auto_7417 ?auto_7403 ) ) ( HOIST-AT ?auto_7410 ?auto_7417 ) ( SURFACE-AT ?auto_7398 ?auto_7417 ) ( ON ?auto_7398 ?auto_7416 ) ( CLEAR ?auto_7398 ) ( not ( = ?auto_7397 ?auto_7398 ) ) ( not ( = ?auto_7397 ?auto_7416 ) ) ( not ( = ?auto_7398 ?auto_7416 ) ) ( not ( = ?auto_7405 ?auto_7410 ) ) ( IS-CRATE ?auto_7397 ) ( not ( = ?auto_7427 ?auto_7403 ) ) ( HOIST-AT ?auto_7419 ?auto_7427 ) ( AVAILABLE ?auto_7419 ) ( SURFACE-AT ?auto_7397 ?auto_7427 ) ( ON ?auto_7397 ?auto_7412 ) ( CLEAR ?auto_7397 ) ( not ( = ?auto_7396 ?auto_7397 ) ) ( not ( = ?auto_7396 ?auto_7412 ) ) ( not ( = ?auto_7397 ?auto_7412 ) ) ( not ( = ?auto_7405 ?auto_7419 ) ) ( IS-CRATE ?auto_7396 ) ( not ( = ?auto_7426 ?auto_7403 ) ) ( HOIST-AT ?auto_7423 ?auto_7426 ) ( AVAILABLE ?auto_7423 ) ( SURFACE-AT ?auto_7396 ?auto_7426 ) ( ON ?auto_7396 ?auto_7425 ) ( CLEAR ?auto_7396 ) ( not ( = ?auto_7395 ?auto_7396 ) ) ( not ( = ?auto_7395 ?auto_7425 ) ) ( not ( = ?auto_7396 ?auto_7425 ) ) ( not ( = ?auto_7405 ?auto_7423 ) ) ( IS-CRATE ?auto_7395 ) ( not ( = ?auto_7409 ?auto_7403 ) ) ( HOIST-AT ?auto_7420 ?auto_7409 ) ( AVAILABLE ?auto_7420 ) ( SURFACE-AT ?auto_7395 ?auto_7409 ) ( ON ?auto_7395 ?auto_7429 ) ( CLEAR ?auto_7395 ) ( not ( = ?auto_7394 ?auto_7395 ) ) ( not ( = ?auto_7394 ?auto_7429 ) ) ( not ( = ?auto_7395 ?auto_7429 ) ) ( not ( = ?auto_7405 ?auto_7420 ) ) ( IS-CRATE ?auto_7394 ) ( not ( = ?auto_7421 ?auto_7403 ) ) ( HOIST-AT ?auto_7422 ?auto_7421 ) ( AVAILABLE ?auto_7422 ) ( SURFACE-AT ?auto_7394 ?auto_7421 ) ( ON ?auto_7394 ?auto_7430 ) ( CLEAR ?auto_7394 ) ( not ( = ?auto_7393 ?auto_7394 ) ) ( not ( = ?auto_7393 ?auto_7430 ) ) ( not ( = ?auto_7394 ?auto_7430 ) ) ( not ( = ?auto_7405 ?auto_7422 ) ) ( IS-CRATE ?auto_7393 ) ( AVAILABLE ?auto_7410 ) ( SURFACE-AT ?auto_7393 ?auto_7417 ) ( ON ?auto_7393 ?auto_7408 ) ( CLEAR ?auto_7393 ) ( not ( = ?auto_7392 ?auto_7393 ) ) ( not ( = ?auto_7392 ?auto_7408 ) ) ( not ( = ?auto_7393 ?auto_7408 ) ) ( IS-CRATE ?auto_7392 ) ( not ( = ?auto_7411 ?auto_7403 ) ) ( HOIST-AT ?auto_7418 ?auto_7411 ) ( AVAILABLE ?auto_7418 ) ( SURFACE-AT ?auto_7392 ?auto_7411 ) ( ON ?auto_7392 ?auto_7414 ) ( CLEAR ?auto_7392 ) ( not ( = ?auto_7391 ?auto_7392 ) ) ( not ( = ?auto_7391 ?auto_7414 ) ) ( not ( = ?auto_7392 ?auto_7414 ) ) ( not ( = ?auto_7405 ?auto_7418 ) ) ( SURFACE-AT ?auto_7390 ?auto_7403 ) ( CLEAR ?auto_7390 ) ( IS-CRATE ?auto_7391 ) ( AVAILABLE ?auto_7405 ) ( not ( = ?auto_7415 ?auto_7403 ) ) ( HOIST-AT ?auto_7413 ?auto_7415 ) ( AVAILABLE ?auto_7413 ) ( SURFACE-AT ?auto_7391 ?auto_7415 ) ( ON ?auto_7391 ?auto_7424 ) ( CLEAR ?auto_7391 ) ( TRUCK-AT ?auto_7404 ?auto_7403 ) ( not ( = ?auto_7390 ?auto_7391 ) ) ( not ( = ?auto_7390 ?auto_7424 ) ) ( not ( = ?auto_7391 ?auto_7424 ) ) ( not ( = ?auto_7405 ?auto_7413 ) ) ( not ( = ?auto_7390 ?auto_7392 ) ) ( not ( = ?auto_7390 ?auto_7414 ) ) ( not ( = ?auto_7392 ?auto_7424 ) ) ( not ( = ?auto_7411 ?auto_7415 ) ) ( not ( = ?auto_7418 ?auto_7413 ) ) ( not ( = ?auto_7414 ?auto_7424 ) ) ( not ( = ?auto_7390 ?auto_7393 ) ) ( not ( = ?auto_7390 ?auto_7408 ) ) ( not ( = ?auto_7391 ?auto_7393 ) ) ( not ( = ?auto_7391 ?auto_7408 ) ) ( not ( = ?auto_7393 ?auto_7414 ) ) ( not ( = ?auto_7393 ?auto_7424 ) ) ( not ( = ?auto_7417 ?auto_7411 ) ) ( not ( = ?auto_7417 ?auto_7415 ) ) ( not ( = ?auto_7410 ?auto_7418 ) ) ( not ( = ?auto_7410 ?auto_7413 ) ) ( not ( = ?auto_7408 ?auto_7414 ) ) ( not ( = ?auto_7408 ?auto_7424 ) ) ( not ( = ?auto_7390 ?auto_7394 ) ) ( not ( = ?auto_7390 ?auto_7430 ) ) ( not ( = ?auto_7391 ?auto_7394 ) ) ( not ( = ?auto_7391 ?auto_7430 ) ) ( not ( = ?auto_7392 ?auto_7394 ) ) ( not ( = ?auto_7392 ?auto_7430 ) ) ( not ( = ?auto_7394 ?auto_7408 ) ) ( not ( = ?auto_7394 ?auto_7414 ) ) ( not ( = ?auto_7394 ?auto_7424 ) ) ( not ( = ?auto_7421 ?auto_7417 ) ) ( not ( = ?auto_7421 ?auto_7411 ) ) ( not ( = ?auto_7421 ?auto_7415 ) ) ( not ( = ?auto_7422 ?auto_7410 ) ) ( not ( = ?auto_7422 ?auto_7418 ) ) ( not ( = ?auto_7422 ?auto_7413 ) ) ( not ( = ?auto_7430 ?auto_7408 ) ) ( not ( = ?auto_7430 ?auto_7414 ) ) ( not ( = ?auto_7430 ?auto_7424 ) ) ( not ( = ?auto_7390 ?auto_7395 ) ) ( not ( = ?auto_7390 ?auto_7429 ) ) ( not ( = ?auto_7391 ?auto_7395 ) ) ( not ( = ?auto_7391 ?auto_7429 ) ) ( not ( = ?auto_7392 ?auto_7395 ) ) ( not ( = ?auto_7392 ?auto_7429 ) ) ( not ( = ?auto_7393 ?auto_7395 ) ) ( not ( = ?auto_7393 ?auto_7429 ) ) ( not ( = ?auto_7395 ?auto_7430 ) ) ( not ( = ?auto_7395 ?auto_7408 ) ) ( not ( = ?auto_7395 ?auto_7414 ) ) ( not ( = ?auto_7395 ?auto_7424 ) ) ( not ( = ?auto_7409 ?auto_7421 ) ) ( not ( = ?auto_7409 ?auto_7417 ) ) ( not ( = ?auto_7409 ?auto_7411 ) ) ( not ( = ?auto_7409 ?auto_7415 ) ) ( not ( = ?auto_7420 ?auto_7422 ) ) ( not ( = ?auto_7420 ?auto_7410 ) ) ( not ( = ?auto_7420 ?auto_7418 ) ) ( not ( = ?auto_7420 ?auto_7413 ) ) ( not ( = ?auto_7429 ?auto_7430 ) ) ( not ( = ?auto_7429 ?auto_7408 ) ) ( not ( = ?auto_7429 ?auto_7414 ) ) ( not ( = ?auto_7429 ?auto_7424 ) ) ( not ( = ?auto_7390 ?auto_7396 ) ) ( not ( = ?auto_7390 ?auto_7425 ) ) ( not ( = ?auto_7391 ?auto_7396 ) ) ( not ( = ?auto_7391 ?auto_7425 ) ) ( not ( = ?auto_7392 ?auto_7396 ) ) ( not ( = ?auto_7392 ?auto_7425 ) ) ( not ( = ?auto_7393 ?auto_7396 ) ) ( not ( = ?auto_7393 ?auto_7425 ) ) ( not ( = ?auto_7394 ?auto_7396 ) ) ( not ( = ?auto_7394 ?auto_7425 ) ) ( not ( = ?auto_7396 ?auto_7429 ) ) ( not ( = ?auto_7396 ?auto_7430 ) ) ( not ( = ?auto_7396 ?auto_7408 ) ) ( not ( = ?auto_7396 ?auto_7414 ) ) ( not ( = ?auto_7396 ?auto_7424 ) ) ( not ( = ?auto_7426 ?auto_7409 ) ) ( not ( = ?auto_7426 ?auto_7421 ) ) ( not ( = ?auto_7426 ?auto_7417 ) ) ( not ( = ?auto_7426 ?auto_7411 ) ) ( not ( = ?auto_7426 ?auto_7415 ) ) ( not ( = ?auto_7423 ?auto_7420 ) ) ( not ( = ?auto_7423 ?auto_7422 ) ) ( not ( = ?auto_7423 ?auto_7410 ) ) ( not ( = ?auto_7423 ?auto_7418 ) ) ( not ( = ?auto_7423 ?auto_7413 ) ) ( not ( = ?auto_7425 ?auto_7429 ) ) ( not ( = ?auto_7425 ?auto_7430 ) ) ( not ( = ?auto_7425 ?auto_7408 ) ) ( not ( = ?auto_7425 ?auto_7414 ) ) ( not ( = ?auto_7425 ?auto_7424 ) ) ( not ( = ?auto_7390 ?auto_7397 ) ) ( not ( = ?auto_7390 ?auto_7412 ) ) ( not ( = ?auto_7391 ?auto_7397 ) ) ( not ( = ?auto_7391 ?auto_7412 ) ) ( not ( = ?auto_7392 ?auto_7397 ) ) ( not ( = ?auto_7392 ?auto_7412 ) ) ( not ( = ?auto_7393 ?auto_7397 ) ) ( not ( = ?auto_7393 ?auto_7412 ) ) ( not ( = ?auto_7394 ?auto_7397 ) ) ( not ( = ?auto_7394 ?auto_7412 ) ) ( not ( = ?auto_7395 ?auto_7397 ) ) ( not ( = ?auto_7395 ?auto_7412 ) ) ( not ( = ?auto_7397 ?auto_7425 ) ) ( not ( = ?auto_7397 ?auto_7429 ) ) ( not ( = ?auto_7397 ?auto_7430 ) ) ( not ( = ?auto_7397 ?auto_7408 ) ) ( not ( = ?auto_7397 ?auto_7414 ) ) ( not ( = ?auto_7397 ?auto_7424 ) ) ( not ( = ?auto_7427 ?auto_7426 ) ) ( not ( = ?auto_7427 ?auto_7409 ) ) ( not ( = ?auto_7427 ?auto_7421 ) ) ( not ( = ?auto_7427 ?auto_7417 ) ) ( not ( = ?auto_7427 ?auto_7411 ) ) ( not ( = ?auto_7427 ?auto_7415 ) ) ( not ( = ?auto_7419 ?auto_7423 ) ) ( not ( = ?auto_7419 ?auto_7420 ) ) ( not ( = ?auto_7419 ?auto_7422 ) ) ( not ( = ?auto_7419 ?auto_7410 ) ) ( not ( = ?auto_7419 ?auto_7418 ) ) ( not ( = ?auto_7419 ?auto_7413 ) ) ( not ( = ?auto_7412 ?auto_7425 ) ) ( not ( = ?auto_7412 ?auto_7429 ) ) ( not ( = ?auto_7412 ?auto_7430 ) ) ( not ( = ?auto_7412 ?auto_7408 ) ) ( not ( = ?auto_7412 ?auto_7414 ) ) ( not ( = ?auto_7412 ?auto_7424 ) ) ( not ( = ?auto_7390 ?auto_7398 ) ) ( not ( = ?auto_7390 ?auto_7416 ) ) ( not ( = ?auto_7391 ?auto_7398 ) ) ( not ( = ?auto_7391 ?auto_7416 ) ) ( not ( = ?auto_7392 ?auto_7398 ) ) ( not ( = ?auto_7392 ?auto_7416 ) ) ( not ( = ?auto_7393 ?auto_7398 ) ) ( not ( = ?auto_7393 ?auto_7416 ) ) ( not ( = ?auto_7394 ?auto_7398 ) ) ( not ( = ?auto_7394 ?auto_7416 ) ) ( not ( = ?auto_7395 ?auto_7398 ) ) ( not ( = ?auto_7395 ?auto_7416 ) ) ( not ( = ?auto_7396 ?auto_7398 ) ) ( not ( = ?auto_7396 ?auto_7416 ) ) ( not ( = ?auto_7398 ?auto_7412 ) ) ( not ( = ?auto_7398 ?auto_7425 ) ) ( not ( = ?auto_7398 ?auto_7429 ) ) ( not ( = ?auto_7398 ?auto_7430 ) ) ( not ( = ?auto_7398 ?auto_7408 ) ) ( not ( = ?auto_7398 ?auto_7414 ) ) ( not ( = ?auto_7398 ?auto_7424 ) ) ( not ( = ?auto_7416 ?auto_7412 ) ) ( not ( = ?auto_7416 ?auto_7425 ) ) ( not ( = ?auto_7416 ?auto_7429 ) ) ( not ( = ?auto_7416 ?auto_7430 ) ) ( not ( = ?auto_7416 ?auto_7408 ) ) ( not ( = ?auto_7416 ?auto_7414 ) ) ( not ( = ?auto_7416 ?auto_7424 ) ) ( not ( = ?auto_7390 ?auto_7399 ) ) ( not ( = ?auto_7390 ?auto_7428 ) ) ( not ( = ?auto_7391 ?auto_7399 ) ) ( not ( = ?auto_7391 ?auto_7428 ) ) ( not ( = ?auto_7392 ?auto_7399 ) ) ( not ( = ?auto_7392 ?auto_7428 ) ) ( not ( = ?auto_7393 ?auto_7399 ) ) ( not ( = ?auto_7393 ?auto_7428 ) ) ( not ( = ?auto_7394 ?auto_7399 ) ) ( not ( = ?auto_7394 ?auto_7428 ) ) ( not ( = ?auto_7395 ?auto_7399 ) ) ( not ( = ?auto_7395 ?auto_7428 ) ) ( not ( = ?auto_7396 ?auto_7399 ) ) ( not ( = ?auto_7396 ?auto_7428 ) ) ( not ( = ?auto_7397 ?auto_7399 ) ) ( not ( = ?auto_7397 ?auto_7428 ) ) ( not ( = ?auto_7399 ?auto_7416 ) ) ( not ( = ?auto_7399 ?auto_7412 ) ) ( not ( = ?auto_7399 ?auto_7425 ) ) ( not ( = ?auto_7399 ?auto_7429 ) ) ( not ( = ?auto_7399 ?auto_7430 ) ) ( not ( = ?auto_7399 ?auto_7408 ) ) ( not ( = ?auto_7399 ?auto_7414 ) ) ( not ( = ?auto_7399 ?auto_7424 ) ) ( not ( = ?auto_7431 ?auto_7417 ) ) ( not ( = ?auto_7431 ?auto_7427 ) ) ( not ( = ?auto_7431 ?auto_7426 ) ) ( not ( = ?auto_7431 ?auto_7409 ) ) ( not ( = ?auto_7431 ?auto_7421 ) ) ( not ( = ?auto_7431 ?auto_7411 ) ) ( not ( = ?auto_7431 ?auto_7415 ) ) ( not ( = ?auto_7407 ?auto_7410 ) ) ( not ( = ?auto_7407 ?auto_7419 ) ) ( not ( = ?auto_7407 ?auto_7423 ) ) ( not ( = ?auto_7407 ?auto_7420 ) ) ( not ( = ?auto_7407 ?auto_7422 ) ) ( not ( = ?auto_7407 ?auto_7418 ) ) ( not ( = ?auto_7407 ?auto_7413 ) ) ( not ( = ?auto_7428 ?auto_7416 ) ) ( not ( = ?auto_7428 ?auto_7412 ) ) ( not ( = ?auto_7428 ?auto_7425 ) ) ( not ( = ?auto_7428 ?auto_7429 ) ) ( not ( = ?auto_7428 ?auto_7430 ) ) ( not ( = ?auto_7428 ?auto_7408 ) ) ( not ( = ?auto_7428 ?auto_7414 ) ) ( not ( = ?auto_7428 ?auto_7424 ) ) ( not ( = ?auto_7390 ?auto_7400 ) ) ( not ( = ?auto_7390 ?auto_7401 ) ) ( not ( = ?auto_7391 ?auto_7400 ) ) ( not ( = ?auto_7391 ?auto_7401 ) ) ( not ( = ?auto_7392 ?auto_7400 ) ) ( not ( = ?auto_7392 ?auto_7401 ) ) ( not ( = ?auto_7393 ?auto_7400 ) ) ( not ( = ?auto_7393 ?auto_7401 ) ) ( not ( = ?auto_7394 ?auto_7400 ) ) ( not ( = ?auto_7394 ?auto_7401 ) ) ( not ( = ?auto_7395 ?auto_7400 ) ) ( not ( = ?auto_7395 ?auto_7401 ) ) ( not ( = ?auto_7396 ?auto_7400 ) ) ( not ( = ?auto_7396 ?auto_7401 ) ) ( not ( = ?auto_7397 ?auto_7400 ) ) ( not ( = ?auto_7397 ?auto_7401 ) ) ( not ( = ?auto_7398 ?auto_7400 ) ) ( not ( = ?auto_7398 ?auto_7401 ) ) ( not ( = ?auto_7400 ?auto_7428 ) ) ( not ( = ?auto_7400 ?auto_7416 ) ) ( not ( = ?auto_7400 ?auto_7412 ) ) ( not ( = ?auto_7400 ?auto_7425 ) ) ( not ( = ?auto_7400 ?auto_7429 ) ) ( not ( = ?auto_7400 ?auto_7430 ) ) ( not ( = ?auto_7400 ?auto_7408 ) ) ( not ( = ?auto_7400 ?auto_7414 ) ) ( not ( = ?auto_7400 ?auto_7424 ) ) ( not ( = ?auto_7406 ?auto_7431 ) ) ( not ( = ?auto_7406 ?auto_7417 ) ) ( not ( = ?auto_7406 ?auto_7427 ) ) ( not ( = ?auto_7406 ?auto_7426 ) ) ( not ( = ?auto_7406 ?auto_7409 ) ) ( not ( = ?auto_7406 ?auto_7421 ) ) ( not ( = ?auto_7406 ?auto_7411 ) ) ( not ( = ?auto_7406 ?auto_7415 ) ) ( not ( = ?auto_7402 ?auto_7407 ) ) ( not ( = ?auto_7402 ?auto_7410 ) ) ( not ( = ?auto_7402 ?auto_7419 ) ) ( not ( = ?auto_7402 ?auto_7423 ) ) ( not ( = ?auto_7402 ?auto_7420 ) ) ( not ( = ?auto_7402 ?auto_7422 ) ) ( not ( = ?auto_7402 ?auto_7418 ) ) ( not ( = ?auto_7402 ?auto_7413 ) ) ( not ( = ?auto_7401 ?auto_7428 ) ) ( not ( = ?auto_7401 ?auto_7416 ) ) ( not ( = ?auto_7401 ?auto_7412 ) ) ( not ( = ?auto_7401 ?auto_7425 ) ) ( not ( = ?auto_7401 ?auto_7429 ) ) ( not ( = ?auto_7401 ?auto_7430 ) ) ( not ( = ?auto_7401 ?auto_7408 ) ) ( not ( = ?auto_7401 ?auto_7414 ) ) ( not ( = ?auto_7401 ?auto_7424 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_7390 ?auto_7391 ?auto_7392 ?auto_7393 ?auto_7394 ?auto_7395 ?auto_7396 ?auto_7397 ?auto_7398 ?auto_7399 )
      ( MAKE-1CRATE ?auto_7399 ?auto_7400 )
      ( MAKE-10CRATE-VERIFY ?auto_7390 ?auto_7391 ?auto_7392 ?auto_7393 ?auto_7394 ?auto_7395 ?auto_7396 ?auto_7397 ?auto_7398 ?auto_7399 ?auto_7400 ) )
  )

)

