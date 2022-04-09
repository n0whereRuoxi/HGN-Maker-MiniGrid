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
      ?auto_7046 - SURFACE
      ?auto_7047 - SURFACE
      ?auto_7048 - SURFACE
    )
    :vars
    (
      ?auto_7054 - HOIST
      ?auto_7052 - PLACE
      ?auto_7051 - PLACE
      ?auto_7050 - HOIST
      ?auto_7053 - SURFACE
      ?auto_7057 - PLACE
      ?auto_7056 - HOIST
      ?auto_7055 - SURFACE
      ?auto_7049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7054 ?auto_7052 ) ( IS-CRATE ?auto_7048 ) ( not ( = ?auto_7051 ?auto_7052 ) ) ( HOIST-AT ?auto_7050 ?auto_7051 ) ( AVAILABLE ?auto_7050 ) ( SURFACE-AT ?auto_7048 ?auto_7051 ) ( ON ?auto_7048 ?auto_7053 ) ( CLEAR ?auto_7048 ) ( not ( = ?auto_7047 ?auto_7048 ) ) ( not ( = ?auto_7047 ?auto_7053 ) ) ( not ( = ?auto_7048 ?auto_7053 ) ) ( not ( = ?auto_7054 ?auto_7050 ) ) ( SURFACE-AT ?auto_7046 ?auto_7052 ) ( CLEAR ?auto_7046 ) ( IS-CRATE ?auto_7047 ) ( AVAILABLE ?auto_7054 ) ( not ( = ?auto_7057 ?auto_7052 ) ) ( HOIST-AT ?auto_7056 ?auto_7057 ) ( AVAILABLE ?auto_7056 ) ( SURFACE-AT ?auto_7047 ?auto_7057 ) ( ON ?auto_7047 ?auto_7055 ) ( CLEAR ?auto_7047 ) ( TRUCK-AT ?auto_7049 ?auto_7052 ) ( not ( = ?auto_7046 ?auto_7047 ) ) ( not ( = ?auto_7046 ?auto_7055 ) ) ( not ( = ?auto_7047 ?auto_7055 ) ) ( not ( = ?auto_7054 ?auto_7056 ) ) ( not ( = ?auto_7046 ?auto_7048 ) ) ( not ( = ?auto_7046 ?auto_7053 ) ) ( not ( = ?auto_7048 ?auto_7055 ) ) ( not ( = ?auto_7051 ?auto_7057 ) ) ( not ( = ?auto_7050 ?auto_7056 ) ) ( not ( = ?auto_7053 ?auto_7055 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7046 ?auto_7047 )
      ( MAKE-1CRATE ?auto_7047 ?auto_7048 )
      ( MAKE-2CRATE-VERIFY ?auto_7046 ?auto_7047 ?auto_7048 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7060 - SURFACE
      ?auto_7061 - SURFACE
    )
    :vars
    (
      ?auto_7062 - HOIST
      ?auto_7063 - PLACE
      ?auto_7065 - PLACE
      ?auto_7066 - HOIST
      ?auto_7067 - SURFACE
      ?auto_7064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7062 ?auto_7063 ) ( SURFACE-AT ?auto_7060 ?auto_7063 ) ( CLEAR ?auto_7060 ) ( IS-CRATE ?auto_7061 ) ( AVAILABLE ?auto_7062 ) ( not ( = ?auto_7065 ?auto_7063 ) ) ( HOIST-AT ?auto_7066 ?auto_7065 ) ( AVAILABLE ?auto_7066 ) ( SURFACE-AT ?auto_7061 ?auto_7065 ) ( ON ?auto_7061 ?auto_7067 ) ( CLEAR ?auto_7061 ) ( TRUCK-AT ?auto_7064 ?auto_7063 ) ( not ( = ?auto_7060 ?auto_7061 ) ) ( not ( = ?auto_7060 ?auto_7067 ) ) ( not ( = ?auto_7061 ?auto_7067 ) ) ( not ( = ?auto_7062 ?auto_7066 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7064 ?auto_7063 ?auto_7065 )
      ( !LIFT ?auto_7066 ?auto_7061 ?auto_7067 ?auto_7065 )
      ( !LOAD ?auto_7066 ?auto_7061 ?auto_7064 ?auto_7065 )
      ( !DRIVE ?auto_7064 ?auto_7065 ?auto_7063 )
      ( !UNLOAD ?auto_7062 ?auto_7061 ?auto_7064 ?auto_7063 )
      ( !DROP ?auto_7062 ?auto_7061 ?auto_7060 ?auto_7063 )
      ( MAKE-1CRATE-VERIFY ?auto_7060 ?auto_7061 ) )
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
      ?auto_7077 - HOIST
      ?auto_7078 - PLACE
      ?auto_7079 - PLACE
      ?auto_7076 - HOIST
      ?auto_7081 - SURFACE
      ?auto_7084 - PLACE
      ?auto_7083 - HOIST
      ?auto_7085 - SURFACE
      ?auto_7082 - PLACE
      ?auto_7087 - HOIST
      ?auto_7086 - SURFACE
      ?auto_7080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7077 ?auto_7078 ) ( IS-CRATE ?auto_7075 ) ( not ( = ?auto_7079 ?auto_7078 ) ) ( HOIST-AT ?auto_7076 ?auto_7079 ) ( AVAILABLE ?auto_7076 ) ( SURFACE-AT ?auto_7075 ?auto_7079 ) ( ON ?auto_7075 ?auto_7081 ) ( CLEAR ?auto_7075 ) ( not ( = ?auto_7074 ?auto_7075 ) ) ( not ( = ?auto_7074 ?auto_7081 ) ) ( not ( = ?auto_7075 ?auto_7081 ) ) ( not ( = ?auto_7077 ?auto_7076 ) ) ( IS-CRATE ?auto_7074 ) ( not ( = ?auto_7084 ?auto_7078 ) ) ( HOIST-AT ?auto_7083 ?auto_7084 ) ( AVAILABLE ?auto_7083 ) ( SURFACE-AT ?auto_7074 ?auto_7084 ) ( ON ?auto_7074 ?auto_7085 ) ( CLEAR ?auto_7074 ) ( not ( = ?auto_7073 ?auto_7074 ) ) ( not ( = ?auto_7073 ?auto_7085 ) ) ( not ( = ?auto_7074 ?auto_7085 ) ) ( not ( = ?auto_7077 ?auto_7083 ) ) ( SURFACE-AT ?auto_7072 ?auto_7078 ) ( CLEAR ?auto_7072 ) ( IS-CRATE ?auto_7073 ) ( AVAILABLE ?auto_7077 ) ( not ( = ?auto_7082 ?auto_7078 ) ) ( HOIST-AT ?auto_7087 ?auto_7082 ) ( AVAILABLE ?auto_7087 ) ( SURFACE-AT ?auto_7073 ?auto_7082 ) ( ON ?auto_7073 ?auto_7086 ) ( CLEAR ?auto_7073 ) ( TRUCK-AT ?auto_7080 ?auto_7078 ) ( not ( = ?auto_7072 ?auto_7073 ) ) ( not ( = ?auto_7072 ?auto_7086 ) ) ( not ( = ?auto_7073 ?auto_7086 ) ) ( not ( = ?auto_7077 ?auto_7087 ) ) ( not ( = ?auto_7072 ?auto_7074 ) ) ( not ( = ?auto_7072 ?auto_7085 ) ) ( not ( = ?auto_7074 ?auto_7086 ) ) ( not ( = ?auto_7084 ?auto_7082 ) ) ( not ( = ?auto_7083 ?auto_7087 ) ) ( not ( = ?auto_7085 ?auto_7086 ) ) ( not ( = ?auto_7072 ?auto_7075 ) ) ( not ( = ?auto_7072 ?auto_7081 ) ) ( not ( = ?auto_7073 ?auto_7075 ) ) ( not ( = ?auto_7073 ?auto_7081 ) ) ( not ( = ?auto_7075 ?auto_7085 ) ) ( not ( = ?auto_7075 ?auto_7086 ) ) ( not ( = ?auto_7079 ?auto_7084 ) ) ( not ( = ?auto_7079 ?auto_7082 ) ) ( not ( = ?auto_7076 ?auto_7083 ) ) ( not ( = ?auto_7076 ?auto_7087 ) ) ( not ( = ?auto_7081 ?auto_7085 ) ) ( not ( = ?auto_7081 ?auto_7086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7072 ?auto_7073 ?auto_7074 )
      ( MAKE-1CRATE ?auto_7074 ?auto_7075 )
      ( MAKE-3CRATE-VERIFY ?auto_7072 ?auto_7073 ?auto_7074 ?auto_7075 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7090 - SURFACE
      ?auto_7091 - SURFACE
    )
    :vars
    (
      ?auto_7092 - HOIST
      ?auto_7093 - PLACE
      ?auto_7095 - PLACE
      ?auto_7096 - HOIST
      ?auto_7097 - SURFACE
      ?auto_7094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7092 ?auto_7093 ) ( SURFACE-AT ?auto_7090 ?auto_7093 ) ( CLEAR ?auto_7090 ) ( IS-CRATE ?auto_7091 ) ( AVAILABLE ?auto_7092 ) ( not ( = ?auto_7095 ?auto_7093 ) ) ( HOIST-AT ?auto_7096 ?auto_7095 ) ( AVAILABLE ?auto_7096 ) ( SURFACE-AT ?auto_7091 ?auto_7095 ) ( ON ?auto_7091 ?auto_7097 ) ( CLEAR ?auto_7091 ) ( TRUCK-AT ?auto_7094 ?auto_7093 ) ( not ( = ?auto_7090 ?auto_7091 ) ) ( not ( = ?auto_7090 ?auto_7097 ) ) ( not ( = ?auto_7091 ?auto_7097 ) ) ( not ( = ?auto_7092 ?auto_7096 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7094 ?auto_7093 ?auto_7095 )
      ( !LIFT ?auto_7096 ?auto_7091 ?auto_7097 ?auto_7095 )
      ( !LOAD ?auto_7096 ?auto_7091 ?auto_7094 ?auto_7095 )
      ( !DRIVE ?auto_7094 ?auto_7095 ?auto_7093 )
      ( !UNLOAD ?auto_7092 ?auto_7091 ?auto_7094 ?auto_7093 )
      ( !DROP ?auto_7092 ?auto_7091 ?auto_7090 ?auto_7093 )
      ( MAKE-1CRATE-VERIFY ?auto_7090 ?auto_7091 ) )
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
      ?auto_7112 - HOIST
      ?auto_7113 - PLACE
      ?auto_7111 - PLACE
      ?auto_7110 - HOIST
      ?auto_7108 - SURFACE
      ?auto_7119 - PLACE
      ?auto_7122 - HOIST
      ?auto_7120 - SURFACE
      ?auto_7118 - PLACE
      ?auto_7116 - HOIST
      ?auto_7121 - SURFACE
      ?auto_7117 - PLACE
      ?auto_7114 - HOIST
      ?auto_7115 - SURFACE
      ?auto_7109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7112 ?auto_7113 ) ( IS-CRATE ?auto_7107 ) ( not ( = ?auto_7111 ?auto_7113 ) ) ( HOIST-AT ?auto_7110 ?auto_7111 ) ( AVAILABLE ?auto_7110 ) ( SURFACE-AT ?auto_7107 ?auto_7111 ) ( ON ?auto_7107 ?auto_7108 ) ( CLEAR ?auto_7107 ) ( not ( = ?auto_7106 ?auto_7107 ) ) ( not ( = ?auto_7106 ?auto_7108 ) ) ( not ( = ?auto_7107 ?auto_7108 ) ) ( not ( = ?auto_7112 ?auto_7110 ) ) ( IS-CRATE ?auto_7106 ) ( not ( = ?auto_7119 ?auto_7113 ) ) ( HOIST-AT ?auto_7122 ?auto_7119 ) ( AVAILABLE ?auto_7122 ) ( SURFACE-AT ?auto_7106 ?auto_7119 ) ( ON ?auto_7106 ?auto_7120 ) ( CLEAR ?auto_7106 ) ( not ( = ?auto_7105 ?auto_7106 ) ) ( not ( = ?auto_7105 ?auto_7120 ) ) ( not ( = ?auto_7106 ?auto_7120 ) ) ( not ( = ?auto_7112 ?auto_7122 ) ) ( IS-CRATE ?auto_7105 ) ( not ( = ?auto_7118 ?auto_7113 ) ) ( HOIST-AT ?auto_7116 ?auto_7118 ) ( AVAILABLE ?auto_7116 ) ( SURFACE-AT ?auto_7105 ?auto_7118 ) ( ON ?auto_7105 ?auto_7121 ) ( CLEAR ?auto_7105 ) ( not ( = ?auto_7104 ?auto_7105 ) ) ( not ( = ?auto_7104 ?auto_7121 ) ) ( not ( = ?auto_7105 ?auto_7121 ) ) ( not ( = ?auto_7112 ?auto_7116 ) ) ( SURFACE-AT ?auto_7103 ?auto_7113 ) ( CLEAR ?auto_7103 ) ( IS-CRATE ?auto_7104 ) ( AVAILABLE ?auto_7112 ) ( not ( = ?auto_7117 ?auto_7113 ) ) ( HOIST-AT ?auto_7114 ?auto_7117 ) ( AVAILABLE ?auto_7114 ) ( SURFACE-AT ?auto_7104 ?auto_7117 ) ( ON ?auto_7104 ?auto_7115 ) ( CLEAR ?auto_7104 ) ( TRUCK-AT ?auto_7109 ?auto_7113 ) ( not ( = ?auto_7103 ?auto_7104 ) ) ( not ( = ?auto_7103 ?auto_7115 ) ) ( not ( = ?auto_7104 ?auto_7115 ) ) ( not ( = ?auto_7112 ?auto_7114 ) ) ( not ( = ?auto_7103 ?auto_7105 ) ) ( not ( = ?auto_7103 ?auto_7121 ) ) ( not ( = ?auto_7105 ?auto_7115 ) ) ( not ( = ?auto_7118 ?auto_7117 ) ) ( not ( = ?auto_7116 ?auto_7114 ) ) ( not ( = ?auto_7121 ?auto_7115 ) ) ( not ( = ?auto_7103 ?auto_7106 ) ) ( not ( = ?auto_7103 ?auto_7120 ) ) ( not ( = ?auto_7104 ?auto_7106 ) ) ( not ( = ?auto_7104 ?auto_7120 ) ) ( not ( = ?auto_7106 ?auto_7121 ) ) ( not ( = ?auto_7106 ?auto_7115 ) ) ( not ( = ?auto_7119 ?auto_7118 ) ) ( not ( = ?auto_7119 ?auto_7117 ) ) ( not ( = ?auto_7122 ?auto_7116 ) ) ( not ( = ?auto_7122 ?auto_7114 ) ) ( not ( = ?auto_7120 ?auto_7121 ) ) ( not ( = ?auto_7120 ?auto_7115 ) ) ( not ( = ?auto_7103 ?auto_7107 ) ) ( not ( = ?auto_7103 ?auto_7108 ) ) ( not ( = ?auto_7104 ?auto_7107 ) ) ( not ( = ?auto_7104 ?auto_7108 ) ) ( not ( = ?auto_7105 ?auto_7107 ) ) ( not ( = ?auto_7105 ?auto_7108 ) ) ( not ( = ?auto_7107 ?auto_7120 ) ) ( not ( = ?auto_7107 ?auto_7121 ) ) ( not ( = ?auto_7107 ?auto_7115 ) ) ( not ( = ?auto_7111 ?auto_7119 ) ) ( not ( = ?auto_7111 ?auto_7118 ) ) ( not ( = ?auto_7111 ?auto_7117 ) ) ( not ( = ?auto_7110 ?auto_7122 ) ) ( not ( = ?auto_7110 ?auto_7116 ) ) ( not ( = ?auto_7110 ?auto_7114 ) ) ( not ( = ?auto_7108 ?auto_7120 ) ) ( not ( = ?auto_7108 ?auto_7121 ) ) ( not ( = ?auto_7108 ?auto_7115 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7103 ?auto_7104 ?auto_7105 ?auto_7106 )
      ( MAKE-1CRATE ?auto_7106 ?auto_7107 )
      ( MAKE-4CRATE-VERIFY ?auto_7103 ?auto_7104 ?auto_7105 ?auto_7106 ?auto_7107 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7125 - SURFACE
      ?auto_7126 - SURFACE
    )
    :vars
    (
      ?auto_7127 - HOIST
      ?auto_7128 - PLACE
      ?auto_7130 - PLACE
      ?auto_7131 - HOIST
      ?auto_7132 - SURFACE
      ?auto_7129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7127 ?auto_7128 ) ( SURFACE-AT ?auto_7125 ?auto_7128 ) ( CLEAR ?auto_7125 ) ( IS-CRATE ?auto_7126 ) ( AVAILABLE ?auto_7127 ) ( not ( = ?auto_7130 ?auto_7128 ) ) ( HOIST-AT ?auto_7131 ?auto_7130 ) ( AVAILABLE ?auto_7131 ) ( SURFACE-AT ?auto_7126 ?auto_7130 ) ( ON ?auto_7126 ?auto_7132 ) ( CLEAR ?auto_7126 ) ( TRUCK-AT ?auto_7129 ?auto_7128 ) ( not ( = ?auto_7125 ?auto_7126 ) ) ( not ( = ?auto_7125 ?auto_7132 ) ) ( not ( = ?auto_7126 ?auto_7132 ) ) ( not ( = ?auto_7127 ?auto_7131 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7129 ?auto_7128 ?auto_7130 )
      ( !LIFT ?auto_7131 ?auto_7126 ?auto_7132 ?auto_7130 )
      ( !LOAD ?auto_7131 ?auto_7126 ?auto_7129 ?auto_7130 )
      ( !DRIVE ?auto_7129 ?auto_7130 ?auto_7128 )
      ( !UNLOAD ?auto_7127 ?auto_7126 ?auto_7129 ?auto_7128 )
      ( !DROP ?auto_7127 ?auto_7126 ?auto_7125 ?auto_7128 )
      ( MAKE-1CRATE-VERIFY ?auto_7125 ?auto_7126 ) )
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
      ?auto_7150 - HOIST
      ?auto_7146 - PLACE
      ?auto_7145 - PLACE
      ?auto_7149 - HOIST
      ?auto_7147 - SURFACE
      ?auto_7160 - PLACE
      ?auto_7161 - HOIST
      ?auto_7155 - SURFACE
      ?auto_7154 - PLACE
      ?auto_7157 - HOIST
      ?auto_7153 - SURFACE
      ?auto_7162 - PLACE
      ?auto_7158 - HOIST
      ?auto_7152 - SURFACE
      ?auto_7151 - PLACE
      ?auto_7156 - HOIST
      ?auto_7159 - SURFACE
      ?auto_7148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7150 ?auto_7146 ) ( IS-CRATE ?auto_7144 ) ( not ( = ?auto_7145 ?auto_7146 ) ) ( HOIST-AT ?auto_7149 ?auto_7145 ) ( AVAILABLE ?auto_7149 ) ( SURFACE-AT ?auto_7144 ?auto_7145 ) ( ON ?auto_7144 ?auto_7147 ) ( CLEAR ?auto_7144 ) ( not ( = ?auto_7143 ?auto_7144 ) ) ( not ( = ?auto_7143 ?auto_7147 ) ) ( not ( = ?auto_7144 ?auto_7147 ) ) ( not ( = ?auto_7150 ?auto_7149 ) ) ( IS-CRATE ?auto_7143 ) ( not ( = ?auto_7160 ?auto_7146 ) ) ( HOIST-AT ?auto_7161 ?auto_7160 ) ( AVAILABLE ?auto_7161 ) ( SURFACE-AT ?auto_7143 ?auto_7160 ) ( ON ?auto_7143 ?auto_7155 ) ( CLEAR ?auto_7143 ) ( not ( = ?auto_7142 ?auto_7143 ) ) ( not ( = ?auto_7142 ?auto_7155 ) ) ( not ( = ?auto_7143 ?auto_7155 ) ) ( not ( = ?auto_7150 ?auto_7161 ) ) ( IS-CRATE ?auto_7142 ) ( not ( = ?auto_7154 ?auto_7146 ) ) ( HOIST-AT ?auto_7157 ?auto_7154 ) ( AVAILABLE ?auto_7157 ) ( SURFACE-AT ?auto_7142 ?auto_7154 ) ( ON ?auto_7142 ?auto_7153 ) ( CLEAR ?auto_7142 ) ( not ( = ?auto_7141 ?auto_7142 ) ) ( not ( = ?auto_7141 ?auto_7153 ) ) ( not ( = ?auto_7142 ?auto_7153 ) ) ( not ( = ?auto_7150 ?auto_7157 ) ) ( IS-CRATE ?auto_7141 ) ( not ( = ?auto_7162 ?auto_7146 ) ) ( HOIST-AT ?auto_7158 ?auto_7162 ) ( AVAILABLE ?auto_7158 ) ( SURFACE-AT ?auto_7141 ?auto_7162 ) ( ON ?auto_7141 ?auto_7152 ) ( CLEAR ?auto_7141 ) ( not ( = ?auto_7140 ?auto_7141 ) ) ( not ( = ?auto_7140 ?auto_7152 ) ) ( not ( = ?auto_7141 ?auto_7152 ) ) ( not ( = ?auto_7150 ?auto_7158 ) ) ( SURFACE-AT ?auto_7139 ?auto_7146 ) ( CLEAR ?auto_7139 ) ( IS-CRATE ?auto_7140 ) ( AVAILABLE ?auto_7150 ) ( not ( = ?auto_7151 ?auto_7146 ) ) ( HOIST-AT ?auto_7156 ?auto_7151 ) ( AVAILABLE ?auto_7156 ) ( SURFACE-AT ?auto_7140 ?auto_7151 ) ( ON ?auto_7140 ?auto_7159 ) ( CLEAR ?auto_7140 ) ( TRUCK-AT ?auto_7148 ?auto_7146 ) ( not ( = ?auto_7139 ?auto_7140 ) ) ( not ( = ?auto_7139 ?auto_7159 ) ) ( not ( = ?auto_7140 ?auto_7159 ) ) ( not ( = ?auto_7150 ?auto_7156 ) ) ( not ( = ?auto_7139 ?auto_7141 ) ) ( not ( = ?auto_7139 ?auto_7152 ) ) ( not ( = ?auto_7141 ?auto_7159 ) ) ( not ( = ?auto_7162 ?auto_7151 ) ) ( not ( = ?auto_7158 ?auto_7156 ) ) ( not ( = ?auto_7152 ?auto_7159 ) ) ( not ( = ?auto_7139 ?auto_7142 ) ) ( not ( = ?auto_7139 ?auto_7153 ) ) ( not ( = ?auto_7140 ?auto_7142 ) ) ( not ( = ?auto_7140 ?auto_7153 ) ) ( not ( = ?auto_7142 ?auto_7152 ) ) ( not ( = ?auto_7142 ?auto_7159 ) ) ( not ( = ?auto_7154 ?auto_7162 ) ) ( not ( = ?auto_7154 ?auto_7151 ) ) ( not ( = ?auto_7157 ?auto_7158 ) ) ( not ( = ?auto_7157 ?auto_7156 ) ) ( not ( = ?auto_7153 ?auto_7152 ) ) ( not ( = ?auto_7153 ?auto_7159 ) ) ( not ( = ?auto_7139 ?auto_7143 ) ) ( not ( = ?auto_7139 ?auto_7155 ) ) ( not ( = ?auto_7140 ?auto_7143 ) ) ( not ( = ?auto_7140 ?auto_7155 ) ) ( not ( = ?auto_7141 ?auto_7143 ) ) ( not ( = ?auto_7141 ?auto_7155 ) ) ( not ( = ?auto_7143 ?auto_7153 ) ) ( not ( = ?auto_7143 ?auto_7152 ) ) ( not ( = ?auto_7143 ?auto_7159 ) ) ( not ( = ?auto_7160 ?auto_7154 ) ) ( not ( = ?auto_7160 ?auto_7162 ) ) ( not ( = ?auto_7160 ?auto_7151 ) ) ( not ( = ?auto_7161 ?auto_7157 ) ) ( not ( = ?auto_7161 ?auto_7158 ) ) ( not ( = ?auto_7161 ?auto_7156 ) ) ( not ( = ?auto_7155 ?auto_7153 ) ) ( not ( = ?auto_7155 ?auto_7152 ) ) ( not ( = ?auto_7155 ?auto_7159 ) ) ( not ( = ?auto_7139 ?auto_7144 ) ) ( not ( = ?auto_7139 ?auto_7147 ) ) ( not ( = ?auto_7140 ?auto_7144 ) ) ( not ( = ?auto_7140 ?auto_7147 ) ) ( not ( = ?auto_7141 ?auto_7144 ) ) ( not ( = ?auto_7141 ?auto_7147 ) ) ( not ( = ?auto_7142 ?auto_7144 ) ) ( not ( = ?auto_7142 ?auto_7147 ) ) ( not ( = ?auto_7144 ?auto_7155 ) ) ( not ( = ?auto_7144 ?auto_7153 ) ) ( not ( = ?auto_7144 ?auto_7152 ) ) ( not ( = ?auto_7144 ?auto_7159 ) ) ( not ( = ?auto_7145 ?auto_7160 ) ) ( not ( = ?auto_7145 ?auto_7154 ) ) ( not ( = ?auto_7145 ?auto_7162 ) ) ( not ( = ?auto_7145 ?auto_7151 ) ) ( not ( = ?auto_7149 ?auto_7161 ) ) ( not ( = ?auto_7149 ?auto_7157 ) ) ( not ( = ?auto_7149 ?auto_7158 ) ) ( not ( = ?auto_7149 ?auto_7156 ) ) ( not ( = ?auto_7147 ?auto_7155 ) ) ( not ( = ?auto_7147 ?auto_7153 ) ) ( not ( = ?auto_7147 ?auto_7152 ) ) ( not ( = ?auto_7147 ?auto_7159 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7139 ?auto_7140 ?auto_7141 ?auto_7142 ?auto_7143 )
      ( MAKE-1CRATE ?auto_7143 ?auto_7144 )
      ( MAKE-5CRATE-VERIFY ?auto_7139 ?auto_7140 ?auto_7141 ?auto_7142 ?auto_7143 ?auto_7144 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7165 - SURFACE
      ?auto_7166 - SURFACE
    )
    :vars
    (
      ?auto_7167 - HOIST
      ?auto_7168 - PLACE
      ?auto_7170 - PLACE
      ?auto_7171 - HOIST
      ?auto_7172 - SURFACE
      ?auto_7169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7167 ?auto_7168 ) ( SURFACE-AT ?auto_7165 ?auto_7168 ) ( CLEAR ?auto_7165 ) ( IS-CRATE ?auto_7166 ) ( AVAILABLE ?auto_7167 ) ( not ( = ?auto_7170 ?auto_7168 ) ) ( HOIST-AT ?auto_7171 ?auto_7170 ) ( AVAILABLE ?auto_7171 ) ( SURFACE-AT ?auto_7166 ?auto_7170 ) ( ON ?auto_7166 ?auto_7172 ) ( CLEAR ?auto_7166 ) ( TRUCK-AT ?auto_7169 ?auto_7168 ) ( not ( = ?auto_7165 ?auto_7166 ) ) ( not ( = ?auto_7165 ?auto_7172 ) ) ( not ( = ?auto_7166 ?auto_7172 ) ) ( not ( = ?auto_7167 ?auto_7171 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7169 ?auto_7168 ?auto_7170 )
      ( !LIFT ?auto_7171 ?auto_7166 ?auto_7172 ?auto_7170 )
      ( !LOAD ?auto_7171 ?auto_7166 ?auto_7169 ?auto_7170 )
      ( !DRIVE ?auto_7169 ?auto_7170 ?auto_7168 )
      ( !UNLOAD ?auto_7167 ?auto_7166 ?auto_7169 ?auto_7168 )
      ( !DROP ?auto_7167 ?auto_7166 ?auto_7165 ?auto_7168 )
      ( MAKE-1CRATE-VERIFY ?auto_7165 ?auto_7166 ) )
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
      ?auto_7188 - HOIST
      ?auto_7189 - PLACE
      ?auto_7192 - PLACE
      ?auto_7187 - HOIST
      ?auto_7191 - SURFACE
      ?auto_7203 - PLACE
      ?auto_7204 - HOIST
      ?auto_7195 - SURFACE
      ?auto_7198 - PLACE
      ?auto_7194 - HOIST
      ?auto_7207 - SURFACE
      ?auto_7202 - PLACE
      ?auto_7200 - HOIST
      ?auto_7196 - SURFACE
      ?auto_7206 - PLACE
      ?auto_7201 - HOIST
      ?auto_7197 - SURFACE
      ?auto_7193 - PLACE
      ?auto_7199 - HOIST
      ?auto_7205 - SURFACE
      ?auto_7190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7188 ?auto_7189 ) ( IS-CRATE ?auto_7186 ) ( not ( = ?auto_7192 ?auto_7189 ) ) ( HOIST-AT ?auto_7187 ?auto_7192 ) ( AVAILABLE ?auto_7187 ) ( SURFACE-AT ?auto_7186 ?auto_7192 ) ( ON ?auto_7186 ?auto_7191 ) ( CLEAR ?auto_7186 ) ( not ( = ?auto_7185 ?auto_7186 ) ) ( not ( = ?auto_7185 ?auto_7191 ) ) ( not ( = ?auto_7186 ?auto_7191 ) ) ( not ( = ?auto_7188 ?auto_7187 ) ) ( IS-CRATE ?auto_7185 ) ( not ( = ?auto_7203 ?auto_7189 ) ) ( HOIST-AT ?auto_7204 ?auto_7203 ) ( AVAILABLE ?auto_7204 ) ( SURFACE-AT ?auto_7185 ?auto_7203 ) ( ON ?auto_7185 ?auto_7195 ) ( CLEAR ?auto_7185 ) ( not ( = ?auto_7184 ?auto_7185 ) ) ( not ( = ?auto_7184 ?auto_7195 ) ) ( not ( = ?auto_7185 ?auto_7195 ) ) ( not ( = ?auto_7188 ?auto_7204 ) ) ( IS-CRATE ?auto_7184 ) ( not ( = ?auto_7198 ?auto_7189 ) ) ( HOIST-AT ?auto_7194 ?auto_7198 ) ( AVAILABLE ?auto_7194 ) ( SURFACE-AT ?auto_7184 ?auto_7198 ) ( ON ?auto_7184 ?auto_7207 ) ( CLEAR ?auto_7184 ) ( not ( = ?auto_7183 ?auto_7184 ) ) ( not ( = ?auto_7183 ?auto_7207 ) ) ( not ( = ?auto_7184 ?auto_7207 ) ) ( not ( = ?auto_7188 ?auto_7194 ) ) ( IS-CRATE ?auto_7183 ) ( not ( = ?auto_7202 ?auto_7189 ) ) ( HOIST-AT ?auto_7200 ?auto_7202 ) ( AVAILABLE ?auto_7200 ) ( SURFACE-AT ?auto_7183 ?auto_7202 ) ( ON ?auto_7183 ?auto_7196 ) ( CLEAR ?auto_7183 ) ( not ( = ?auto_7182 ?auto_7183 ) ) ( not ( = ?auto_7182 ?auto_7196 ) ) ( not ( = ?auto_7183 ?auto_7196 ) ) ( not ( = ?auto_7188 ?auto_7200 ) ) ( IS-CRATE ?auto_7182 ) ( not ( = ?auto_7206 ?auto_7189 ) ) ( HOIST-AT ?auto_7201 ?auto_7206 ) ( AVAILABLE ?auto_7201 ) ( SURFACE-AT ?auto_7182 ?auto_7206 ) ( ON ?auto_7182 ?auto_7197 ) ( CLEAR ?auto_7182 ) ( not ( = ?auto_7181 ?auto_7182 ) ) ( not ( = ?auto_7181 ?auto_7197 ) ) ( not ( = ?auto_7182 ?auto_7197 ) ) ( not ( = ?auto_7188 ?auto_7201 ) ) ( SURFACE-AT ?auto_7180 ?auto_7189 ) ( CLEAR ?auto_7180 ) ( IS-CRATE ?auto_7181 ) ( AVAILABLE ?auto_7188 ) ( not ( = ?auto_7193 ?auto_7189 ) ) ( HOIST-AT ?auto_7199 ?auto_7193 ) ( AVAILABLE ?auto_7199 ) ( SURFACE-AT ?auto_7181 ?auto_7193 ) ( ON ?auto_7181 ?auto_7205 ) ( CLEAR ?auto_7181 ) ( TRUCK-AT ?auto_7190 ?auto_7189 ) ( not ( = ?auto_7180 ?auto_7181 ) ) ( not ( = ?auto_7180 ?auto_7205 ) ) ( not ( = ?auto_7181 ?auto_7205 ) ) ( not ( = ?auto_7188 ?auto_7199 ) ) ( not ( = ?auto_7180 ?auto_7182 ) ) ( not ( = ?auto_7180 ?auto_7197 ) ) ( not ( = ?auto_7182 ?auto_7205 ) ) ( not ( = ?auto_7206 ?auto_7193 ) ) ( not ( = ?auto_7201 ?auto_7199 ) ) ( not ( = ?auto_7197 ?auto_7205 ) ) ( not ( = ?auto_7180 ?auto_7183 ) ) ( not ( = ?auto_7180 ?auto_7196 ) ) ( not ( = ?auto_7181 ?auto_7183 ) ) ( not ( = ?auto_7181 ?auto_7196 ) ) ( not ( = ?auto_7183 ?auto_7197 ) ) ( not ( = ?auto_7183 ?auto_7205 ) ) ( not ( = ?auto_7202 ?auto_7206 ) ) ( not ( = ?auto_7202 ?auto_7193 ) ) ( not ( = ?auto_7200 ?auto_7201 ) ) ( not ( = ?auto_7200 ?auto_7199 ) ) ( not ( = ?auto_7196 ?auto_7197 ) ) ( not ( = ?auto_7196 ?auto_7205 ) ) ( not ( = ?auto_7180 ?auto_7184 ) ) ( not ( = ?auto_7180 ?auto_7207 ) ) ( not ( = ?auto_7181 ?auto_7184 ) ) ( not ( = ?auto_7181 ?auto_7207 ) ) ( not ( = ?auto_7182 ?auto_7184 ) ) ( not ( = ?auto_7182 ?auto_7207 ) ) ( not ( = ?auto_7184 ?auto_7196 ) ) ( not ( = ?auto_7184 ?auto_7197 ) ) ( not ( = ?auto_7184 ?auto_7205 ) ) ( not ( = ?auto_7198 ?auto_7202 ) ) ( not ( = ?auto_7198 ?auto_7206 ) ) ( not ( = ?auto_7198 ?auto_7193 ) ) ( not ( = ?auto_7194 ?auto_7200 ) ) ( not ( = ?auto_7194 ?auto_7201 ) ) ( not ( = ?auto_7194 ?auto_7199 ) ) ( not ( = ?auto_7207 ?auto_7196 ) ) ( not ( = ?auto_7207 ?auto_7197 ) ) ( not ( = ?auto_7207 ?auto_7205 ) ) ( not ( = ?auto_7180 ?auto_7185 ) ) ( not ( = ?auto_7180 ?auto_7195 ) ) ( not ( = ?auto_7181 ?auto_7185 ) ) ( not ( = ?auto_7181 ?auto_7195 ) ) ( not ( = ?auto_7182 ?auto_7185 ) ) ( not ( = ?auto_7182 ?auto_7195 ) ) ( not ( = ?auto_7183 ?auto_7185 ) ) ( not ( = ?auto_7183 ?auto_7195 ) ) ( not ( = ?auto_7185 ?auto_7207 ) ) ( not ( = ?auto_7185 ?auto_7196 ) ) ( not ( = ?auto_7185 ?auto_7197 ) ) ( not ( = ?auto_7185 ?auto_7205 ) ) ( not ( = ?auto_7203 ?auto_7198 ) ) ( not ( = ?auto_7203 ?auto_7202 ) ) ( not ( = ?auto_7203 ?auto_7206 ) ) ( not ( = ?auto_7203 ?auto_7193 ) ) ( not ( = ?auto_7204 ?auto_7194 ) ) ( not ( = ?auto_7204 ?auto_7200 ) ) ( not ( = ?auto_7204 ?auto_7201 ) ) ( not ( = ?auto_7204 ?auto_7199 ) ) ( not ( = ?auto_7195 ?auto_7207 ) ) ( not ( = ?auto_7195 ?auto_7196 ) ) ( not ( = ?auto_7195 ?auto_7197 ) ) ( not ( = ?auto_7195 ?auto_7205 ) ) ( not ( = ?auto_7180 ?auto_7186 ) ) ( not ( = ?auto_7180 ?auto_7191 ) ) ( not ( = ?auto_7181 ?auto_7186 ) ) ( not ( = ?auto_7181 ?auto_7191 ) ) ( not ( = ?auto_7182 ?auto_7186 ) ) ( not ( = ?auto_7182 ?auto_7191 ) ) ( not ( = ?auto_7183 ?auto_7186 ) ) ( not ( = ?auto_7183 ?auto_7191 ) ) ( not ( = ?auto_7184 ?auto_7186 ) ) ( not ( = ?auto_7184 ?auto_7191 ) ) ( not ( = ?auto_7186 ?auto_7195 ) ) ( not ( = ?auto_7186 ?auto_7207 ) ) ( not ( = ?auto_7186 ?auto_7196 ) ) ( not ( = ?auto_7186 ?auto_7197 ) ) ( not ( = ?auto_7186 ?auto_7205 ) ) ( not ( = ?auto_7192 ?auto_7203 ) ) ( not ( = ?auto_7192 ?auto_7198 ) ) ( not ( = ?auto_7192 ?auto_7202 ) ) ( not ( = ?auto_7192 ?auto_7206 ) ) ( not ( = ?auto_7192 ?auto_7193 ) ) ( not ( = ?auto_7187 ?auto_7204 ) ) ( not ( = ?auto_7187 ?auto_7194 ) ) ( not ( = ?auto_7187 ?auto_7200 ) ) ( not ( = ?auto_7187 ?auto_7201 ) ) ( not ( = ?auto_7187 ?auto_7199 ) ) ( not ( = ?auto_7191 ?auto_7195 ) ) ( not ( = ?auto_7191 ?auto_7207 ) ) ( not ( = ?auto_7191 ?auto_7196 ) ) ( not ( = ?auto_7191 ?auto_7197 ) ) ( not ( = ?auto_7191 ?auto_7205 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7180 ?auto_7181 ?auto_7182 ?auto_7183 ?auto_7184 ?auto_7185 )
      ( MAKE-1CRATE ?auto_7185 ?auto_7186 )
      ( MAKE-6CRATE-VERIFY ?auto_7180 ?auto_7181 ?auto_7182 ?auto_7183 ?auto_7184 ?auto_7185 ?auto_7186 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7210 - SURFACE
      ?auto_7211 - SURFACE
    )
    :vars
    (
      ?auto_7212 - HOIST
      ?auto_7213 - PLACE
      ?auto_7215 - PLACE
      ?auto_7216 - HOIST
      ?auto_7217 - SURFACE
      ?auto_7214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7212 ?auto_7213 ) ( SURFACE-AT ?auto_7210 ?auto_7213 ) ( CLEAR ?auto_7210 ) ( IS-CRATE ?auto_7211 ) ( AVAILABLE ?auto_7212 ) ( not ( = ?auto_7215 ?auto_7213 ) ) ( HOIST-AT ?auto_7216 ?auto_7215 ) ( AVAILABLE ?auto_7216 ) ( SURFACE-AT ?auto_7211 ?auto_7215 ) ( ON ?auto_7211 ?auto_7217 ) ( CLEAR ?auto_7211 ) ( TRUCK-AT ?auto_7214 ?auto_7213 ) ( not ( = ?auto_7210 ?auto_7211 ) ) ( not ( = ?auto_7210 ?auto_7217 ) ) ( not ( = ?auto_7211 ?auto_7217 ) ) ( not ( = ?auto_7212 ?auto_7216 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7214 ?auto_7213 ?auto_7215 )
      ( !LIFT ?auto_7216 ?auto_7211 ?auto_7217 ?auto_7215 )
      ( !LOAD ?auto_7216 ?auto_7211 ?auto_7214 ?auto_7215 )
      ( !DRIVE ?auto_7214 ?auto_7215 ?auto_7213 )
      ( !UNLOAD ?auto_7212 ?auto_7211 ?auto_7214 ?auto_7213 )
      ( !DROP ?auto_7212 ?auto_7211 ?auto_7210 ?auto_7213 )
      ( MAKE-1CRATE-VERIFY ?auto_7210 ?auto_7211 ) )
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
      ?auto_7236 - HOIST
      ?auto_7237 - PLACE
      ?auto_7238 - PLACE
      ?auto_7235 - HOIST
      ?auto_7234 - SURFACE
      ?auto_7256 - PLACE
      ?auto_7255 - HOIST
      ?auto_7257 - SURFACE
      ?auto_7245 - PLACE
      ?auto_7242 - HOIST
      ?auto_7253 - SURFACE
      ?auto_7251 - PLACE
      ?auto_7247 - HOIST
      ?auto_7254 - SURFACE
      ?auto_7241 - PLACE
      ?auto_7249 - HOIST
      ?auto_7246 - SURFACE
      ?auto_7248 - PLACE
      ?auto_7240 - HOIST
      ?auto_7252 - SURFACE
      ?auto_7244 - PLACE
      ?auto_7250 - HOIST
      ?auto_7243 - SURFACE
      ?auto_7239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7236 ?auto_7237 ) ( IS-CRATE ?auto_7233 ) ( not ( = ?auto_7238 ?auto_7237 ) ) ( HOIST-AT ?auto_7235 ?auto_7238 ) ( AVAILABLE ?auto_7235 ) ( SURFACE-AT ?auto_7233 ?auto_7238 ) ( ON ?auto_7233 ?auto_7234 ) ( CLEAR ?auto_7233 ) ( not ( = ?auto_7232 ?auto_7233 ) ) ( not ( = ?auto_7232 ?auto_7234 ) ) ( not ( = ?auto_7233 ?auto_7234 ) ) ( not ( = ?auto_7236 ?auto_7235 ) ) ( IS-CRATE ?auto_7232 ) ( not ( = ?auto_7256 ?auto_7237 ) ) ( HOIST-AT ?auto_7255 ?auto_7256 ) ( AVAILABLE ?auto_7255 ) ( SURFACE-AT ?auto_7232 ?auto_7256 ) ( ON ?auto_7232 ?auto_7257 ) ( CLEAR ?auto_7232 ) ( not ( = ?auto_7231 ?auto_7232 ) ) ( not ( = ?auto_7231 ?auto_7257 ) ) ( not ( = ?auto_7232 ?auto_7257 ) ) ( not ( = ?auto_7236 ?auto_7255 ) ) ( IS-CRATE ?auto_7231 ) ( not ( = ?auto_7245 ?auto_7237 ) ) ( HOIST-AT ?auto_7242 ?auto_7245 ) ( AVAILABLE ?auto_7242 ) ( SURFACE-AT ?auto_7231 ?auto_7245 ) ( ON ?auto_7231 ?auto_7253 ) ( CLEAR ?auto_7231 ) ( not ( = ?auto_7230 ?auto_7231 ) ) ( not ( = ?auto_7230 ?auto_7253 ) ) ( not ( = ?auto_7231 ?auto_7253 ) ) ( not ( = ?auto_7236 ?auto_7242 ) ) ( IS-CRATE ?auto_7230 ) ( not ( = ?auto_7251 ?auto_7237 ) ) ( HOIST-AT ?auto_7247 ?auto_7251 ) ( AVAILABLE ?auto_7247 ) ( SURFACE-AT ?auto_7230 ?auto_7251 ) ( ON ?auto_7230 ?auto_7254 ) ( CLEAR ?auto_7230 ) ( not ( = ?auto_7229 ?auto_7230 ) ) ( not ( = ?auto_7229 ?auto_7254 ) ) ( not ( = ?auto_7230 ?auto_7254 ) ) ( not ( = ?auto_7236 ?auto_7247 ) ) ( IS-CRATE ?auto_7229 ) ( not ( = ?auto_7241 ?auto_7237 ) ) ( HOIST-AT ?auto_7249 ?auto_7241 ) ( AVAILABLE ?auto_7249 ) ( SURFACE-AT ?auto_7229 ?auto_7241 ) ( ON ?auto_7229 ?auto_7246 ) ( CLEAR ?auto_7229 ) ( not ( = ?auto_7228 ?auto_7229 ) ) ( not ( = ?auto_7228 ?auto_7246 ) ) ( not ( = ?auto_7229 ?auto_7246 ) ) ( not ( = ?auto_7236 ?auto_7249 ) ) ( IS-CRATE ?auto_7228 ) ( not ( = ?auto_7248 ?auto_7237 ) ) ( HOIST-AT ?auto_7240 ?auto_7248 ) ( AVAILABLE ?auto_7240 ) ( SURFACE-AT ?auto_7228 ?auto_7248 ) ( ON ?auto_7228 ?auto_7252 ) ( CLEAR ?auto_7228 ) ( not ( = ?auto_7227 ?auto_7228 ) ) ( not ( = ?auto_7227 ?auto_7252 ) ) ( not ( = ?auto_7228 ?auto_7252 ) ) ( not ( = ?auto_7236 ?auto_7240 ) ) ( SURFACE-AT ?auto_7226 ?auto_7237 ) ( CLEAR ?auto_7226 ) ( IS-CRATE ?auto_7227 ) ( AVAILABLE ?auto_7236 ) ( not ( = ?auto_7244 ?auto_7237 ) ) ( HOIST-AT ?auto_7250 ?auto_7244 ) ( AVAILABLE ?auto_7250 ) ( SURFACE-AT ?auto_7227 ?auto_7244 ) ( ON ?auto_7227 ?auto_7243 ) ( CLEAR ?auto_7227 ) ( TRUCK-AT ?auto_7239 ?auto_7237 ) ( not ( = ?auto_7226 ?auto_7227 ) ) ( not ( = ?auto_7226 ?auto_7243 ) ) ( not ( = ?auto_7227 ?auto_7243 ) ) ( not ( = ?auto_7236 ?auto_7250 ) ) ( not ( = ?auto_7226 ?auto_7228 ) ) ( not ( = ?auto_7226 ?auto_7252 ) ) ( not ( = ?auto_7228 ?auto_7243 ) ) ( not ( = ?auto_7248 ?auto_7244 ) ) ( not ( = ?auto_7240 ?auto_7250 ) ) ( not ( = ?auto_7252 ?auto_7243 ) ) ( not ( = ?auto_7226 ?auto_7229 ) ) ( not ( = ?auto_7226 ?auto_7246 ) ) ( not ( = ?auto_7227 ?auto_7229 ) ) ( not ( = ?auto_7227 ?auto_7246 ) ) ( not ( = ?auto_7229 ?auto_7252 ) ) ( not ( = ?auto_7229 ?auto_7243 ) ) ( not ( = ?auto_7241 ?auto_7248 ) ) ( not ( = ?auto_7241 ?auto_7244 ) ) ( not ( = ?auto_7249 ?auto_7240 ) ) ( not ( = ?auto_7249 ?auto_7250 ) ) ( not ( = ?auto_7246 ?auto_7252 ) ) ( not ( = ?auto_7246 ?auto_7243 ) ) ( not ( = ?auto_7226 ?auto_7230 ) ) ( not ( = ?auto_7226 ?auto_7254 ) ) ( not ( = ?auto_7227 ?auto_7230 ) ) ( not ( = ?auto_7227 ?auto_7254 ) ) ( not ( = ?auto_7228 ?auto_7230 ) ) ( not ( = ?auto_7228 ?auto_7254 ) ) ( not ( = ?auto_7230 ?auto_7246 ) ) ( not ( = ?auto_7230 ?auto_7252 ) ) ( not ( = ?auto_7230 ?auto_7243 ) ) ( not ( = ?auto_7251 ?auto_7241 ) ) ( not ( = ?auto_7251 ?auto_7248 ) ) ( not ( = ?auto_7251 ?auto_7244 ) ) ( not ( = ?auto_7247 ?auto_7249 ) ) ( not ( = ?auto_7247 ?auto_7240 ) ) ( not ( = ?auto_7247 ?auto_7250 ) ) ( not ( = ?auto_7254 ?auto_7246 ) ) ( not ( = ?auto_7254 ?auto_7252 ) ) ( not ( = ?auto_7254 ?auto_7243 ) ) ( not ( = ?auto_7226 ?auto_7231 ) ) ( not ( = ?auto_7226 ?auto_7253 ) ) ( not ( = ?auto_7227 ?auto_7231 ) ) ( not ( = ?auto_7227 ?auto_7253 ) ) ( not ( = ?auto_7228 ?auto_7231 ) ) ( not ( = ?auto_7228 ?auto_7253 ) ) ( not ( = ?auto_7229 ?auto_7231 ) ) ( not ( = ?auto_7229 ?auto_7253 ) ) ( not ( = ?auto_7231 ?auto_7254 ) ) ( not ( = ?auto_7231 ?auto_7246 ) ) ( not ( = ?auto_7231 ?auto_7252 ) ) ( not ( = ?auto_7231 ?auto_7243 ) ) ( not ( = ?auto_7245 ?auto_7251 ) ) ( not ( = ?auto_7245 ?auto_7241 ) ) ( not ( = ?auto_7245 ?auto_7248 ) ) ( not ( = ?auto_7245 ?auto_7244 ) ) ( not ( = ?auto_7242 ?auto_7247 ) ) ( not ( = ?auto_7242 ?auto_7249 ) ) ( not ( = ?auto_7242 ?auto_7240 ) ) ( not ( = ?auto_7242 ?auto_7250 ) ) ( not ( = ?auto_7253 ?auto_7254 ) ) ( not ( = ?auto_7253 ?auto_7246 ) ) ( not ( = ?auto_7253 ?auto_7252 ) ) ( not ( = ?auto_7253 ?auto_7243 ) ) ( not ( = ?auto_7226 ?auto_7232 ) ) ( not ( = ?auto_7226 ?auto_7257 ) ) ( not ( = ?auto_7227 ?auto_7232 ) ) ( not ( = ?auto_7227 ?auto_7257 ) ) ( not ( = ?auto_7228 ?auto_7232 ) ) ( not ( = ?auto_7228 ?auto_7257 ) ) ( not ( = ?auto_7229 ?auto_7232 ) ) ( not ( = ?auto_7229 ?auto_7257 ) ) ( not ( = ?auto_7230 ?auto_7232 ) ) ( not ( = ?auto_7230 ?auto_7257 ) ) ( not ( = ?auto_7232 ?auto_7253 ) ) ( not ( = ?auto_7232 ?auto_7254 ) ) ( not ( = ?auto_7232 ?auto_7246 ) ) ( not ( = ?auto_7232 ?auto_7252 ) ) ( not ( = ?auto_7232 ?auto_7243 ) ) ( not ( = ?auto_7256 ?auto_7245 ) ) ( not ( = ?auto_7256 ?auto_7251 ) ) ( not ( = ?auto_7256 ?auto_7241 ) ) ( not ( = ?auto_7256 ?auto_7248 ) ) ( not ( = ?auto_7256 ?auto_7244 ) ) ( not ( = ?auto_7255 ?auto_7242 ) ) ( not ( = ?auto_7255 ?auto_7247 ) ) ( not ( = ?auto_7255 ?auto_7249 ) ) ( not ( = ?auto_7255 ?auto_7240 ) ) ( not ( = ?auto_7255 ?auto_7250 ) ) ( not ( = ?auto_7257 ?auto_7253 ) ) ( not ( = ?auto_7257 ?auto_7254 ) ) ( not ( = ?auto_7257 ?auto_7246 ) ) ( not ( = ?auto_7257 ?auto_7252 ) ) ( not ( = ?auto_7257 ?auto_7243 ) ) ( not ( = ?auto_7226 ?auto_7233 ) ) ( not ( = ?auto_7226 ?auto_7234 ) ) ( not ( = ?auto_7227 ?auto_7233 ) ) ( not ( = ?auto_7227 ?auto_7234 ) ) ( not ( = ?auto_7228 ?auto_7233 ) ) ( not ( = ?auto_7228 ?auto_7234 ) ) ( not ( = ?auto_7229 ?auto_7233 ) ) ( not ( = ?auto_7229 ?auto_7234 ) ) ( not ( = ?auto_7230 ?auto_7233 ) ) ( not ( = ?auto_7230 ?auto_7234 ) ) ( not ( = ?auto_7231 ?auto_7233 ) ) ( not ( = ?auto_7231 ?auto_7234 ) ) ( not ( = ?auto_7233 ?auto_7257 ) ) ( not ( = ?auto_7233 ?auto_7253 ) ) ( not ( = ?auto_7233 ?auto_7254 ) ) ( not ( = ?auto_7233 ?auto_7246 ) ) ( not ( = ?auto_7233 ?auto_7252 ) ) ( not ( = ?auto_7233 ?auto_7243 ) ) ( not ( = ?auto_7238 ?auto_7256 ) ) ( not ( = ?auto_7238 ?auto_7245 ) ) ( not ( = ?auto_7238 ?auto_7251 ) ) ( not ( = ?auto_7238 ?auto_7241 ) ) ( not ( = ?auto_7238 ?auto_7248 ) ) ( not ( = ?auto_7238 ?auto_7244 ) ) ( not ( = ?auto_7235 ?auto_7255 ) ) ( not ( = ?auto_7235 ?auto_7242 ) ) ( not ( = ?auto_7235 ?auto_7247 ) ) ( not ( = ?auto_7235 ?auto_7249 ) ) ( not ( = ?auto_7235 ?auto_7240 ) ) ( not ( = ?auto_7235 ?auto_7250 ) ) ( not ( = ?auto_7234 ?auto_7257 ) ) ( not ( = ?auto_7234 ?auto_7253 ) ) ( not ( = ?auto_7234 ?auto_7254 ) ) ( not ( = ?auto_7234 ?auto_7246 ) ) ( not ( = ?auto_7234 ?auto_7252 ) ) ( not ( = ?auto_7234 ?auto_7243 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7226 ?auto_7227 ?auto_7228 ?auto_7229 ?auto_7230 ?auto_7231 ?auto_7232 )
      ( MAKE-1CRATE ?auto_7232 ?auto_7233 )
      ( MAKE-7CRATE-VERIFY ?auto_7226 ?auto_7227 ?auto_7228 ?auto_7229 ?auto_7230 ?auto_7231 ?auto_7232 ?auto_7233 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7260 - SURFACE
      ?auto_7261 - SURFACE
    )
    :vars
    (
      ?auto_7262 - HOIST
      ?auto_7263 - PLACE
      ?auto_7265 - PLACE
      ?auto_7266 - HOIST
      ?auto_7267 - SURFACE
      ?auto_7264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7262 ?auto_7263 ) ( SURFACE-AT ?auto_7260 ?auto_7263 ) ( CLEAR ?auto_7260 ) ( IS-CRATE ?auto_7261 ) ( AVAILABLE ?auto_7262 ) ( not ( = ?auto_7265 ?auto_7263 ) ) ( HOIST-AT ?auto_7266 ?auto_7265 ) ( AVAILABLE ?auto_7266 ) ( SURFACE-AT ?auto_7261 ?auto_7265 ) ( ON ?auto_7261 ?auto_7267 ) ( CLEAR ?auto_7261 ) ( TRUCK-AT ?auto_7264 ?auto_7263 ) ( not ( = ?auto_7260 ?auto_7261 ) ) ( not ( = ?auto_7260 ?auto_7267 ) ) ( not ( = ?auto_7261 ?auto_7267 ) ) ( not ( = ?auto_7262 ?auto_7266 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7264 ?auto_7263 ?auto_7265 )
      ( !LIFT ?auto_7266 ?auto_7261 ?auto_7267 ?auto_7265 )
      ( !LOAD ?auto_7266 ?auto_7261 ?auto_7264 ?auto_7265 )
      ( !DRIVE ?auto_7264 ?auto_7265 ?auto_7263 )
      ( !UNLOAD ?auto_7262 ?auto_7261 ?auto_7264 ?auto_7263 )
      ( !DROP ?auto_7262 ?auto_7261 ?auto_7260 ?auto_7263 )
      ( MAKE-1CRATE-VERIFY ?auto_7260 ?auto_7261 ) )
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
      ?auto_7285 - SURFACE
      ?auto_7284 - SURFACE
    )
    :vars
    (
      ?auto_7288 - HOIST
      ?auto_7286 - PLACE
      ?auto_7287 - PLACE
      ?auto_7289 - HOIST
      ?auto_7290 - SURFACE
      ?auto_7310 - PLACE
      ?auto_7309 - HOIST
      ?auto_7296 - SURFACE
      ?auto_7293 - PLACE
      ?auto_7299 - HOIST
      ?auto_7292 - SURFACE
      ?auto_7307 - PLACE
      ?auto_7295 - HOIST
      ?auto_7304 - SURFACE
      ?auto_7302 - PLACE
      ?auto_7305 - HOIST
      ?auto_7294 - SURFACE
      ?auto_7306 - SURFACE
      ?auto_7300 - PLACE
      ?auto_7298 - HOIST
      ?auto_7303 - SURFACE
      ?auto_7308 - PLACE
      ?auto_7301 - HOIST
      ?auto_7297 - SURFACE
      ?auto_7291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7288 ?auto_7286 ) ( IS-CRATE ?auto_7284 ) ( not ( = ?auto_7287 ?auto_7286 ) ) ( HOIST-AT ?auto_7289 ?auto_7287 ) ( SURFACE-AT ?auto_7284 ?auto_7287 ) ( ON ?auto_7284 ?auto_7290 ) ( CLEAR ?auto_7284 ) ( not ( = ?auto_7285 ?auto_7284 ) ) ( not ( = ?auto_7285 ?auto_7290 ) ) ( not ( = ?auto_7284 ?auto_7290 ) ) ( not ( = ?auto_7288 ?auto_7289 ) ) ( IS-CRATE ?auto_7285 ) ( not ( = ?auto_7310 ?auto_7286 ) ) ( HOIST-AT ?auto_7309 ?auto_7310 ) ( AVAILABLE ?auto_7309 ) ( SURFACE-AT ?auto_7285 ?auto_7310 ) ( ON ?auto_7285 ?auto_7296 ) ( CLEAR ?auto_7285 ) ( not ( = ?auto_7283 ?auto_7285 ) ) ( not ( = ?auto_7283 ?auto_7296 ) ) ( not ( = ?auto_7285 ?auto_7296 ) ) ( not ( = ?auto_7288 ?auto_7309 ) ) ( IS-CRATE ?auto_7283 ) ( not ( = ?auto_7293 ?auto_7286 ) ) ( HOIST-AT ?auto_7299 ?auto_7293 ) ( AVAILABLE ?auto_7299 ) ( SURFACE-AT ?auto_7283 ?auto_7293 ) ( ON ?auto_7283 ?auto_7292 ) ( CLEAR ?auto_7283 ) ( not ( = ?auto_7282 ?auto_7283 ) ) ( not ( = ?auto_7282 ?auto_7292 ) ) ( not ( = ?auto_7283 ?auto_7292 ) ) ( not ( = ?auto_7288 ?auto_7299 ) ) ( IS-CRATE ?auto_7282 ) ( not ( = ?auto_7307 ?auto_7286 ) ) ( HOIST-AT ?auto_7295 ?auto_7307 ) ( AVAILABLE ?auto_7295 ) ( SURFACE-AT ?auto_7282 ?auto_7307 ) ( ON ?auto_7282 ?auto_7304 ) ( CLEAR ?auto_7282 ) ( not ( = ?auto_7281 ?auto_7282 ) ) ( not ( = ?auto_7281 ?auto_7304 ) ) ( not ( = ?auto_7282 ?auto_7304 ) ) ( not ( = ?auto_7288 ?auto_7295 ) ) ( IS-CRATE ?auto_7281 ) ( not ( = ?auto_7302 ?auto_7286 ) ) ( HOIST-AT ?auto_7305 ?auto_7302 ) ( AVAILABLE ?auto_7305 ) ( SURFACE-AT ?auto_7281 ?auto_7302 ) ( ON ?auto_7281 ?auto_7294 ) ( CLEAR ?auto_7281 ) ( not ( = ?auto_7280 ?auto_7281 ) ) ( not ( = ?auto_7280 ?auto_7294 ) ) ( not ( = ?auto_7281 ?auto_7294 ) ) ( not ( = ?auto_7288 ?auto_7305 ) ) ( IS-CRATE ?auto_7280 ) ( AVAILABLE ?auto_7289 ) ( SURFACE-AT ?auto_7280 ?auto_7287 ) ( ON ?auto_7280 ?auto_7306 ) ( CLEAR ?auto_7280 ) ( not ( = ?auto_7279 ?auto_7280 ) ) ( not ( = ?auto_7279 ?auto_7306 ) ) ( not ( = ?auto_7280 ?auto_7306 ) ) ( IS-CRATE ?auto_7279 ) ( not ( = ?auto_7300 ?auto_7286 ) ) ( HOIST-AT ?auto_7298 ?auto_7300 ) ( AVAILABLE ?auto_7298 ) ( SURFACE-AT ?auto_7279 ?auto_7300 ) ( ON ?auto_7279 ?auto_7303 ) ( CLEAR ?auto_7279 ) ( not ( = ?auto_7278 ?auto_7279 ) ) ( not ( = ?auto_7278 ?auto_7303 ) ) ( not ( = ?auto_7279 ?auto_7303 ) ) ( not ( = ?auto_7288 ?auto_7298 ) ) ( SURFACE-AT ?auto_7277 ?auto_7286 ) ( CLEAR ?auto_7277 ) ( IS-CRATE ?auto_7278 ) ( AVAILABLE ?auto_7288 ) ( not ( = ?auto_7308 ?auto_7286 ) ) ( HOIST-AT ?auto_7301 ?auto_7308 ) ( AVAILABLE ?auto_7301 ) ( SURFACE-AT ?auto_7278 ?auto_7308 ) ( ON ?auto_7278 ?auto_7297 ) ( CLEAR ?auto_7278 ) ( TRUCK-AT ?auto_7291 ?auto_7286 ) ( not ( = ?auto_7277 ?auto_7278 ) ) ( not ( = ?auto_7277 ?auto_7297 ) ) ( not ( = ?auto_7278 ?auto_7297 ) ) ( not ( = ?auto_7288 ?auto_7301 ) ) ( not ( = ?auto_7277 ?auto_7279 ) ) ( not ( = ?auto_7277 ?auto_7303 ) ) ( not ( = ?auto_7279 ?auto_7297 ) ) ( not ( = ?auto_7300 ?auto_7308 ) ) ( not ( = ?auto_7298 ?auto_7301 ) ) ( not ( = ?auto_7303 ?auto_7297 ) ) ( not ( = ?auto_7277 ?auto_7280 ) ) ( not ( = ?auto_7277 ?auto_7306 ) ) ( not ( = ?auto_7278 ?auto_7280 ) ) ( not ( = ?auto_7278 ?auto_7306 ) ) ( not ( = ?auto_7280 ?auto_7303 ) ) ( not ( = ?auto_7280 ?auto_7297 ) ) ( not ( = ?auto_7287 ?auto_7300 ) ) ( not ( = ?auto_7287 ?auto_7308 ) ) ( not ( = ?auto_7289 ?auto_7298 ) ) ( not ( = ?auto_7289 ?auto_7301 ) ) ( not ( = ?auto_7306 ?auto_7303 ) ) ( not ( = ?auto_7306 ?auto_7297 ) ) ( not ( = ?auto_7277 ?auto_7281 ) ) ( not ( = ?auto_7277 ?auto_7294 ) ) ( not ( = ?auto_7278 ?auto_7281 ) ) ( not ( = ?auto_7278 ?auto_7294 ) ) ( not ( = ?auto_7279 ?auto_7281 ) ) ( not ( = ?auto_7279 ?auto_7294 ) ) ( not ( = ?auto_7281 ?auto_7306 ) ) ( not ( = ?auto_7281 ?auto_7303 ) ) ( not ( = ?auto_7281 ?auto_7297 ) ) ( not ( = ?auto_7302 ?auto_7287 ) ) ( not ( = ?auto_7302 ?auto_7300 ) ) ( not ( = ?auto_7302 ?auto_7308 ) ) ( not ( = ?auto_7305 ?auto_7289 ) ) ( not ( = ?auto_7305 ?auto_7298 ) ) ( not ( = ?auto_7305 ?auto_7301 ) ) ( not ( = ?auto_7294 ?auto_7306 ) ) ( not ( = ?auto_7294 ?auto_7303 ) ) ( not ( = ?auto_7294 ?auto_7297 ) ) ( not ( = ?auto_7277 ?auto_7282 ) ) ( not ( = ?auto_7277 ?auto_7304 ) ) ( not ( = ?auto_7278 ?auto_7282 ) ) ( not ( = ?auto_7278 ?auto_7304 ) ) ( not ( = ?auto_7279 ?auto_7282 ) ) ( not ( = ?auto_7279 ?auto_7304 ) ) ( not ( = ?auto_7280 ?auto_7282 ) ) ( not ( = ?auto_7280 ?auto_7304 ) ) ( not ( = ?auto_7282 ?auto_7294 ) ) ( not ( = ?auto_7282 ?auto_7306 ) ) ( not ( = ?auto_7282 ?auto_7303 ) ) ( not ( = ?auto_7282 ?auto_7297 ) ) ( not ( = ?auto_7307 ?auto_7302 ) ) ( not ( = ?auto_7307 ?auto_7287 ) ) ( not ( = ?auto_7307 ?auto_7300 ) ) ( not ( = ?auto_7307 ?auto_7308 ) ) ( not ( = ?auto_7295 ?auto_7305 ) ) ( not ( = ?auto_7295 ?auto_7289 ) ) ( not ( = ?auto_7295 ?auto_7298 ) ) ( not ( = ?auto_7295 ?auto_7301 ) ) ( not ( = ?auto_7304 ?auto_7294 ) ) ( not ( = ?auto_7304 ?auto_7306 ) ) ( not ( = ?auto_7304 ?auto_7303 ) ) ( not ( = ?auto_7304 ?auto_7297 ) ) ( not ( = ?auto_7277 ?auto_7283 ) ) ( not ( = ?auto_7277 ?auto_7292 ) ) ( not ( = ?auto_7278 ?auto_7283 ) ) ( not ( = ?auto_7278 ?auto_7292 ) ) ( not ( = ?auto_7279 ?auto_7283 ) ) ( not ( = ?auto_7279 ?auto_7292 ) ) ( not ( = ?auto_7280 ?auto_7283 ) ) ( not ( = ?auto_7280 ?auto_7292 ) ) ( not ( = ?auto_7281 ?auto_7283 ) ) ( not ( = ?auto_7281 ?auto_7292 ) ) ( not ( = ?auto_7283 ?auto_7304 ) ) ( not ( = ?auto_7283 ?auto_7294 ) ) ( not ( = ?auto_7283 ?auto_7306 ) ) ( not ( = ?auto_7283 ?auto_7303 ) ) ( not ( = ?auto_7283 ?auto_7297 ) ) ( not ( = ?auto_7293 ?auto_7307 ) ) ( not ( = ?auto_7293 ?auto_7302 ) ) ( not ( = ?auto_7293 ?auto_7287 ) ) ( not ( = ?auto_7293 ?auto_7300 ) ) ( not ( = ?auto_7293 ?auto_7308 ) ) ( not ( = ?auto_7299 ?auto_7295 ) ) ( not ( = ?auto_7299 ?auto_7305 ) ) ( not ( = ?auto_7299 ?auto_7289 ) ) ( not ( = ?auto_7299 ?auto_7298 ) ) ( not ( = ?auto_7299 ?auto_7301 ) ) ( not ( = ?auto_7292 ?auto_7304 ) ) ( not ( = ?auto_7292 ?auto_7294 ) ) ( not ( = ?auto_7292 ?auto_7306 ) ) ( not ( = ?auto_7292 ?auto_7303 ) ) ( not ( = ?auto_7292 ?auto_7297 ) ) ( not ( = ?auto_7277 ?auto_7285 ) ) ( not ( = ?auto_7277 ?auto_7296 ) ) ( not ( = ?auto_7278 ?auto_7285 ) ) ( not ( = ?auto_7278 ?auto_7296 ) ) ( not ( = ?auto_7279 ?auto_7285 ) ) ( not ( = ?auto_7279 ?auto_7296 ) ) ( not ( = ?auto_7280 ?auto_7285 ) ) ( not ( = ?auto_7280 ?auto_7296 ) ) ( not ( = ?auto_7281 ?auto_7285 ) ) ( not ( = ?auto_7281 ?auto_7296 ) ) ( not ( = ?auto_7282 ?auto_7285 ) ) ( not ( = ?auto_7282 ?auto_7296 ) ) ( not ( = ?auto_7285 ?auto_7292 ) ) ( not ( = ?auto_7285 ?auto_7304 ) ) ( not ( = ?auto_7285 ?auto_7294 ) ) ( not ( = ?auto_7285 ?auto_7306 ) ) ( not ( = ?auto_7285 ?auto_7303 ) ) ( not ( = ?auto_7285 ?auto_7297 ) ) ( not ( = ?auto_7310 ?auto_7293 ) ) ( not ( = ?auto_7310 ?auto_7307 ) ) ( not ( = ?auto_7310 ?auto_7302 ) ) ( not ( = ?auto_7310 ?auto_7287 ) ) ( not ( = ?auto_7310 ?auto_7300 ) ) ( not ( = ?auto_7310 ?auto_7308 ) ) ( not ( = ?auto_7309 ?auto_7299 ) ) ( not ( = ?auto_7309 ?auto_7295 ) ) ( not ( = ?auto_7309 ?auto_7305 ) ) ( not ( = ?auto_7309 ?auto_7289 ) ) ( not ( = ?auto_7309 ?auto_7298 ) ) ( not ( = ?auto_7309 ?auto_7301 ) ) ( not ( = ?auto_7296 ?auto_7292 ) ) ( not ( = ?auto_7296 ?auto_7304 ) ) ( not ( = ?auto_7296 ?auto_7294 ) ) ( not ( = ?auto_7296 ?auto_7306 ) ) ( not ( = ?auto_7296 ?auto_7303 ) ) ( not ( = ?auto_7296 ?auto_7297 ) ) ( not ( = ?auto_7277 ?auto_7284 ) ) ( not ( = ?auto_7277 ?auto_7290 ) ) ( not ( = ?auto_7278 ?auto_7284 ) ) ( not ( = ?auto_7278 ?auto_7290 ) ) ( not ( = ?auto_7279 ?auto_7284 ) ) ( not ( = ?auto_7279 ?auto_7290 ) ) ( not ( = ?auto_7280 ?auto_7284 ) ) ( not ( = ?auto_7280 ?auto_7290 ) ) ( not ( = ?auto_7281 ?auto_7284 ) ) ( not ( = ?auto_7281 ?auto_7290 ) ) ( not ( = ?auto_7282 ?auto_7284 ) ) ( not ( = ?auto_7282 ?auto_7290 ) ) ( not ( = ?auto_7283 ?auto_7284 ) ) ( not ( = ?auto_7283 ?auto_7290 ) ) ( not ( = ?auto_7284 ?auto_7296 ) ) ( not ( = ?auto_7284 ?auto_7292 ) ) ( not ( = ?auto_7284 ?auto_7304 ) ) ( not ( = ?auto_7284 ?auto_7294 ) ) ( not ( = ?auto_7284 ?auto_7306 ) ) ( not ( = ?auto_7284 ?auto_7303 ) ) ( not ( = ?auto_7284 ?auto_7297 ) ) ( not ( = ?auto_7290 ?auto_7296 ) ) ( not ( = ?auto_7290 ?auto_7292 ) ) ( not ( = ?auto_7290 ?auto_7304 ) ) ( not ( = ?auto_7290 ?auto_7294 ) ) ( not ( = ?auto_7290 ?auto_7306 ) ) ( not ( = ?auto_7290 ?auto_7303 ) ) ( not ( = ?auto_7290 ?auto_7297 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7277 ?auto_7278 ?auto_7279 ?auto_7280 ?auto_7281 ?auto_7282 ?auto_7283 ?auto_7285 )
      ( MAKE-1CRATE ?auto_7285 ?auto_7284 )
      ( MAKE-8CRATE-VERIFY ?auto_7277 ?auto_7278 ?auto_7279 ?auto_7280 ?auto_7281 ?auto_7282 ?auto_7283 ?auto_7285 ?auto_7284 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7313 - SURFACE
      ?auto_7314 - SURFACE
    )
    :vars
    (
      ?auto_7315 - HOIST
      ?auto_7316 - PLACE
      ?auto_7318 - PLACE
      ?auto_7319 - HOIST
      ?auto_7320 - SURFACE
      ?auto_7317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7315 ?auto_7316 ) ( SURFACE-AT ?auto_7313 ?auto_7316 ) ( CLEAR ?auto_7313 ) ( IS-CRATE ?auto_7314 ) ( AVAILABLE ?auto_7315 ) ( not ( = ?auto_7318 ?auto_7316 ) ) ( HOIST-AT ?auto_7319 ?auto_7318 ) ( AVAILABLE ?auto_7319 ) ( SURFACE-AT ?auto_7314 ?auto_7318 ) ( ON ?auto_7314 ?auto_7320 ) ( CLEAR ?auto_7314 ) ( TRUCK-AT ?auto_7317 ?auto_7316 ) ( not ( = ?auto_7313 ?auto_7314 ) ) ( not ( = ?auto_7313 ?auto_7320 ) ) ( not ( = ?auto_7314 ?auto_7320 ) ) ( not ( = ?auto_7315 ?auto_7319 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7317 ?auto_7316 ?auto_7318 )
      ( !LIFT ?auto_7319 ?auto_7314 ?auto_7320 ?auto_7318 )
      ( !LOAD ?auto_7319 ?auto_7314 ?auto_7317 ?auto_7318 )
      ( !DRIVE ?auto_7317 ?auto_7318 ?auto_7316 )
      ( !UNLOAD ?auto_7315 ?auto_7314 ?auto_7317 ?auto_7316 )
      ( !DROP ?auto_7315 ?auto_7314 ?auto_7313 ?auto_7316 )
      ( MAKE-1CRATE-VERIFY ?auto_7313 ?auto_7314 ) )
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
      ?auto_7340 - SURFACE
      ?auto_7339 - SURFACE
      ?auto_7338 - SURFACE
    )
    :vars
    (
      ?auto_7346 - HOIST
      ?auto_7342 - PLACE
      ?auto_7343 - PLACE
      ?auto_7344 - HOIST
      ?auto_7341 - SURFACE
      ?auto_7359 - PLACE
      ?auto_7363 - HOIST
      ?auto_7358 - SURFACE
      ?auto_7347 - PLACE
      ?auto_7360 - HOIST
      ?auto_7357 - SURFACE
      ?auto_7362 - PLACE
      ?auto_7354 - HOIST
      ?auto_7367 - SURFACE
      ?auto_7349 - PLACE
      ?auto_7364 - HOIST
      ?auto_7352 - SURFACE
      ?auto_7365 - PLACE
      ?auto_7353 - HOIST
      ?auto_7368 - SURFACE
      ?auto_7361 - SURFACE
      ?auto_7348 - PLACE
      ?auto_7355 - HOIST
      ?auto_7351 - SURFACE
      ?auto_7366 - PLACE
      ?auto_7350 - HOIST
      ?auto_7356 - SURFACE
      ?auto_7345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7346 ?auto_7342 ) ( IS-CRATE ?auto_7338 ) ( not ( = ?auto_7343 ?auto_7342 ) ) ( HOIST-AT ?auto_7344 ?auto_7343 ) ( AVAILABLE ?auto_7344 ) ( SURFACE-AT ?auto_7338 ?auto_7343 ) ( ON ?auto_7338 ?auto_7341 ) ( CLEAR ?auto_7338 ) ( not ( = ?auto_7339 ?auto_7338 ) ) ( not ( = ?auto_7339 ?auto_7341 ) ) ( not ( = ?auto_7338 ?auto_7341 ) ) ( not ( = ?auto_7346 ?auto_7344 ) ) ( IS-CRATE ?auto_7339 ) ( not ( = ?auto_7359 ?auto_7342 ) ) ( HOIST-AT ?auto_7363 ?auto_7359 ) ( SURFACE-AT ?auto_7339 ?auto_7359 ) ( ON ?auto_7339 ?auto_7358 ) ( CLEAR ?auto_7339 ) ( not ( = ?auto_7340 ?auto_7339 ) ) ( not ( = ?auto_7340 ?auto_7358 ) ) ( not ( = ?auto_7339 ?auto_7358 ) ) ( not ( = ?auto_7346 ?auto_7363 ) ) ( IS-CRATE ?auto_7340 ) ( not ( = ?auto_7347 ?auto_7342 ) ) ( HOIST-AT ?auto_7360 ?auto_7347 ) ( AVAILABLE ?auto_7360 ) ( SURFACE-AT ?auto_7340 ?auto_7347 ) ( ON ?auto_7340 ?auto_7357 ) ( CLEAR ?auto_7340 ) ( not ( = ?auto_7337 ?auto_7340 ) ) ( not ( = ?auto_7337 ?auto_7357 ) ) ( not ( = ?auto_7340 ?auto_7357 ) ) ( not ( = ?auto_7346 ?auto_7360 ) ) ( IS-CRATE ?auto_7337 ) ( not ( = ?auto_7362 ?auto_7342 ) ) ( HOIST-AT ?auto_7354 ?auto_7362 ) ( AVAILABLE ?auto_7354 ) ( SURFACE-AT ?auto_7337 ?auto_7362 ) ( ON ?auto_7337 ?auto_7367 ) ( CLEAR ?auto_7337 ) ( not ( = ?auto_7336 ?auto_7337 ) ) ( not ( = ?auto_7336 ?auto_7367 ) ) ( not ( = ?auto_7337 ?auto_7367 ) ) ( not ( = ?auto_7346 ?auto_7354 ) ) ( IS-CRATE ?auto_7336 ) ( not ( = ?auto_7349 ?auto_7342 ) ) ( HOIST-AT ?auto_7364 ?auto_7349 ) ( AVAILABLE ?auto_7364 ) ( SURFACE-AT ?auto_7336 ?auto_7349 ) ( ON ?auto_7336 ?auto_7352 ) ( CLEAR ?auto_7336 ) ( not ( = ?auto_7335 ?auto_7336 ) ) ( not ( = ?auto_7335 ?auto_7352 ) ) ( not ( = ?auto_7336 ?auto_7352 ) ) ( not ( = ?auto_7346 ?auto_7364 ) ) ( IS-CRATE ?auto_7335 ) ( not ( = ?auto_7365 ?auto_7342 ) ) ( HOIST-AT ?auto_7353 ?auto_7365 ) ( AVAILABLE ?auto_7353 ) ( SURFACE-AT ?auto_7335 ?auto_7365 ) ( ON ?auto_7335 ?auto_7368 ) ( CLEAR ?auto_7335 ) ( not ( = ?auto_7334 ?auto_7335 ) ) ( not ( = ?auto_7334 ?auto_7368 ) ) ( not ( = ?auto_7335 ?auto_7368 ) ) ( not ( = ?auto_7346 ?auto_7353 ) ) ( IS-CRATE ?auto_7334 ) ( AVAILABLE ?auto_7363 ) ( SURFACE-AT ?auto_7334 ?auto_7359 ) ( ON ?auto_7334 ?auto_7361 ) ( CLEAR ?auto_7334 ) ( not ( = ?auto_7333 ?auto_7334 ) ) ( not ( = ?auto_7333 ?auto_7361 ) ) ( not ( = ?auto_7334 ?auto_7361 ) ) ( IS-CRATE ?auto_7333 ) ( not ( = ?auto_7348 ?auto_7342 ) ) ( HOIST-AT ?auto_7355 ?auto_7348 ) ( AVAILABLE ?auto_7355 ) ( SURFACE-AT ?auto_7333 ?auto_7348 ) ( ON ?auto_7333 ?auto_7351 ) ( CLEAR ?auto_7333 ) ( not ( = ?auto_7332 ?auto_7333 ) ) ( not ( = ?auto_7332 ?auto_7351 ) ) ( not ( = ?auto_7333 ?auto_7351 ) ) ( not ( = ?auto_7346 ?auto_7355 ) ) ( SURFACE-AT ?auto_7331 ?auto_7342 ) ( CLEAR ?auto_7331 ) ( IS-CRATE ?auto_7332 ) ( AVAILABLE ?auto_7346 ) ( not ( = ?auto_7366 ?auto_7342 ) ) ( HOIST-AT ?auto_7350 ?auto_7366 ) ( AVAILABLE ?auto_7350 ) ( SURFACE-AT ?auto_7332 ?auto_7366 ) ( ON ?auto_7332 ?auto_7356 ) ( CLEAR ?auto_7332 ) ( TRUCK-AT ?auto_7345 ?auto_7342 ) ( not ( = ?auto_7331 ?auto_7332 ) ) ( not ( = ?auto_7331 ?auto_7356 ) ) ( not ( = ?auto_7332 ?auto_7356 ) ) ( not ( = ?auto_7346 ?auto_7350 ) ) ( not ( = ?auto_7331 ?auto_7333 ) ) ( not ( = ?auto_7331 ?auto_7351 ) ) ( not ( = ?auto_7333 ?auto_7356 ) ) ( not ( = ?auto_7348 ?auto_7366 ) ) ( not ( = ?auto_7355 ?auto_7350 ) ) ( not ( = ?auto_7351 ?auto_7356 ) ) ( not ( = ?auto_7331 ?auto_7334 ) ) ( not ( = ?auto_7331 ?auto_7361 ) ) ( not ( = ?auto_7332 ?auto_7334 ) ) ( not ( = ?auto_7332 ?auto_7361 ) ) ( not ( = ?auto_7334 ?auto_7351 ) ) ( not ( = ?auto_7334 ?auto_7356 ) ) ( not ( = ?auto_7359 ?auto_7348 ) ) ( not ( = ?auto_7359 ?auto_7366 ) ) ( not ( = ?auto_7363 ?auto_7355 ) ) ( not ( = ?auto_7363 ?auto_7350 ) ) ( not ( = ?auto_7361 ?auto_7351 ) ) ( not ( = ?auto_7361 ?auto_7356 ) ) ( not ( = ?auto_7331 ?auto_7335 ) ) ( not ( = ?auto_7331 ?auto_7368 ) ) ( not ( = ?auto_7332 ?auto_7335 ) ) ( not ( = ?auto_7332 ?auto_7368 ) ) ( not ( = ?auto_7333 ?auto_7335 ) ) ( not ( = ?auto_7333 ?auto_7368 ) ) ( not ( = ?auto_7335 ?auto_7361 ) ) ( not ( = ?auto_7335 ?auto_7351 ) ) ( not ( = ?auto_7335 ?auto_7356 ) ) ( not ( = ?auto_7365 ?auto_7359 ) ) ( not ( = ?auto_7365 ?auto_7348 ) ) ( not ( = ?auto_7365 ?auto_7366 ) ) ( not ( = ?auto_7353 ?auto_7363 ) ) ( not ( = ?auto_7353 ?auto_7355 ) ) ( not ( = ?auto_7353 ?auto_7350 ) ) ( not ( = ?auto_7368 ?auto_7361 ) ) ( not ( = ?auto_7368 ?auto_7351 ) ) ( not ( = ?auto_7368 ?auto_7356 ) ) ( not ( = ?auto_7331 ?auto_7336 ) ) ( not ( = ?auto_7331 ?auto_7352 ) ) ( not ( = ?auto_7332 ?auto_7336 ) ) ( not ( = ?auto_7332 ?auto_7352 ) ) ( not ( = ?auto_7333 ?auto_7336 ) ) ( not ( = ?auto_7333 ?auto_7352 ) ) ( not ( = ?auto_7334 ?auto_7336 ) ) ( not ( = ?auto_7334 ?auto_7352 ) ) ( not ( = ?auto_7336 ?auto_7368 ) ) ( not ( = ?auto_7336 ?auto_7361 ) ) ( not ( = ?auto_7336 ?auto_7351 ) ) ( not ( = ?auto_7336 ?auto_7356 ) ) ( not ( = ?auto_7349 ?auto_7365 ) ) ( not ( = ?auto_7349 ?auto_7359 ) ) ( not ( = ?auto_7349 ?auto_7348 ) ) ( not ( = ?auto_7349 ?auto_7366 ) ) ( not ( = ?auto_7364 ?auto_7353 ) ) ( not ( = ?auto_7364 ?auto_7363 ) ) ( not ( = ?auto_7364 ?auto_7355 ) ) ( not ( = ?auto_7364 ?auto_7350 ) ) ( not ( = ?auto_7352 ?auto_7368 ) ) ( not ( = ?auto_7352 ?auto_7361 ) ) ( not ( = ?auto_7352 ?auto_7351 ) ) ( not ( = ?auto_7352 ?auto_7356 ) ) ( not ( = ?auto_7331 ?auto_7337 ) ) ( not ( = ?auto_7331 ?auto_7367 ) ) ( not ( = ?auto_7332 ?auto_7337 ) ) ( not ( = ?auto_7332 ?auto_7367 ) ) ( not ( = ?auto_7333 ?auto_7337 ) ) ( not ( = ?auto_7333 ?auto_7367 ) ) ( not ( = ?auto_7334 ?auto_7337 ) ) ( not ( = ?auto_7334 ?auto_7367 ) ) ( not ( = ?auto_7335 ?auto_7337 ) ) ( not ( = ?auto_7335 ?auto_7367 ) ) ( not ( = ?auto_7337 ?auto_7352 ) ) ( not ( = ?auto_7337 ?auto_7368 ) ) ( not ( = ?auto_7337 ?auto_7361 ) ) ( not ( = ?auto_7337 ?auto_7351 ) ) ( not ( = ?auto_7337 ?auto_7356 ) ) ( not ( = ?auto_7362 ?auto_7349 ) ) ( not ( = ?auto_7362 ?auto_7365 ) ) ( not ( = ?auto_7362 ?auto_7359 ) ) ( not ( = ?auto_7362 ?auto_7348 ) ) ( not ( = ?auto_7362 ?auto_7366 ) ) ( not ( = ?auto_7354 ?auto_7364 ) ) ( not ( = ?auto_7354 ?auto_7353 ) ) ( not ( = ?auto_7354 ?auto_7363 ) ) ( not ( = ?auto_7354 ?auto_7355 ) ) ( not ( = ?auto_7354 ?auto_7350 ) ) ( not ( = ?auto_7367 ?auto_7352 ) ) ( not ( = ?auto_7367 ?auto_7368 ) ) ( not ( = ?auto_7367 ?auto_7361 ) ) ( not ( = ?auto_7367 ?auto_7351 ) ) ( not ( = ?auto_7367 ?auto_7356 ) ) ( not ( = ?auto_7331 ?auto_7340 ) ) ( not ( = ?auto_7331 ?auto_7357 ) ) ( not ( = ?auto_7332 ?auto_7340 ) ) ( not ( = ?auto_7332 ?auto_7357 ) ) ( not ( = ?auto_7333 ?auto_7340 ) ) ( not ( = ?auto_7333 ?auto_7357 ) ) ( not ( = ?auto_7334 ?auto_7340 ) ) ( not ( = ?auto_7334 ?auto_7357 ) ) ( not ( = ?auto_7335 ?auto_7340 ) ) ( not ( = ?auto_7335 ?auto_7357 ) ) ( not ( = ?auto_7336 ?auto_7340 ) ) ( not ( = ?auto_7336 ?auto_7357 ) ) ( not ( = ?auto_7340 ?auto_7367 ) ) ( not ( = ?auto_7340 ?auto_7352 ) ) ( not ( = ?auto_7340 ?auto_7368 ) ) ( not ( = ?auto_7340 ?auto_7361 ) ) ( not ( = ?auto_7340 ?auto_7351 ) ) ( not ( = ?auto_7340 ?auto_7356 ) ) ( not ( = ?auto_7347 ?auto_7362 ) ) ( not ( = ?auto_7347 ?auto_7349 ) ) ( not ( = ?auto_7347 ?auto_7365 ) ) ( not ( = ?auto_7347 ?auto_7359 ) ) ( not ( = ?auto_7347 ?auto_7348 ) ) ( not ( = ?auto_7347 ?auto_7366 ) ) ( not ( = ?auto_7360 ?auto_7354 ) ) ( not ( = ?auto_7360 ?auto_7364 ) ) ( not ( = ?auto_7360 ?auto_7353 ) ) ( not ( = ?auto_7360 ?auto_7363 ) ) ( not ( = ?auto_7360 ?auto_7355 ) ) ( not ( = ?auto_7360 ?auto_7350 ) ) ( not ( = ?auto_7357 ?auto_7367 ) ) ( not ( = ?auto_7357 ?auto_7352 ) ) ( not ( = ?auto_7357 ?auto_7368 ) ) ( not ( = ?auto_7357 ?auto_7361 ) ) ( not ( = ?auto_7357 ?auto_7351 ) ) ( not ( = ?auto_7357 ?auto_7356 ) ) ( not ( = ?auto_7331 ?auto_7339 ) ) ( not ( = ?auto_7331 ?auto_7358 ) ) ( not ( = ?auto_7332 ?auto_7339 ) ) ( not ( = ?auto_7332 ?auto_7358 ) ) ( not ( = ?auto_7333 ?auto_7339 ) ) ( not ( = ?auto_7333 ?auto_7358 ) ) ( not ( = ?auto_7334 ?auto_7339 ) ) ( not ( = ?auto_7334 ?auto_7358 ) ) ( not ( = ?auto_7335 ?auto_7339 ) ) ( not ( = ?auto_7335 ?auto_7358 ) ) ( not ( = ?auto_7336 ?auto_7339 ) ) ( not ( = ?auto_7336 ?auto_7358 ) ) ( not ( = ?auto_7337 ?auto_7339 ) ) ( not ( = ?auto_7337 ?auto_7358 ) ) ( not ( = ?auto_7339 ?auto_7357 ) ) ( not ( = ?auto_7339 ?auto_7367 ) ) ( not ( = ?auto_7339 ?auto_7352 ) ) ( not ( = ?auto_7339 ?auto_7368 ) ) ( not ( = ?auto_7339 ?auto_7361 ) ) ( not ( = ?auto_7339 ?auto_7351 ) ) ( not ( = ?auto_7339 ?auto_7356 ) ) ( not ( = ?auto_7358 ?auto_7357 ) ) ( not ( = ?auto_7358 ?auto_7367 ) ) ( not ( = ?auto_7358 ?auto_7352 ) ) ( not ( = ?auto_7358 ?auto_7368 ) ) ( not ( = ?auto_7358 ?auto_7361 ) ) ( not ( = ?auto_7358 ?auto_7351 ) ) ( not ( = ?auto_7358 ?auto_7356 ) ) ( not ( = ?auto_7331 ?auto_7338 ) ) ( not ( = ?auto_7331 ?auto_7341 ) ) ( not ( = ?auto_7332 ?auto_7338 ) ) ( not ( = ?auto_7332 ?auto_7341 ) ) ( not ( = ?auto_7333 ?auto_7338 ) ) ( not ( = ?auto_7333 ?auto_7341 ) ) ( not ( = ?auto_7334 ?auto_7338 ) ) ( not ( = ?auto_7334 ?auto_7341 ) ) ( not ( = ?auto_7335 ?auto_7338 ) ) ( not ( = ?auto_7335 ?auto_7341 ) ) ( not ( = ?auto_7336 ?auto_7338 ) ) ( not ( = ?auto_7336 ?auto_7341 ) ) ( not ( = ?auto_7337 ?auto_7338 ) ) ( not ( = ?auto_7337 ?auto_7341 ) ) ( not ( = ?auto_7340 ?auto_7338 ) ) ( not ( = ?auto_7340 ?auto_7341 ) ) ( not ( = ?auto_7338 ?auto_7358 ) ) ( not ( = ?auto_7338 ?auto_7357 ) ) ( not ( = ?auto_7338 ?auto_7367 ) ) ( not ( = ?auto_7338 ?auto_7352 ) ) ( not ( = ?auto_7338 ?auto_7368 ) ) ( not ( = ?auto_7338 ?auto_7361 ) ) ( not ( = ?auto_7338 ?auto_7351 ) ) ( not ( = ?auto_7338 ?auto_7356 ) ) ( not ( = ?auto_7343 ?auto_7359 ) ) ( not ( = ?auto_7343 ?auto_7347 ) ) ( not ( = ?auto_7343 ?auto_7362 ) ) ( not ( = ?auto_7343 ?auto_7349 ) ) ( not ( = ?auto_7343 ?auto_7365 ) ) ( not ( = ?auto_7343 ?auto_7348 ) ) ( not ( = ?auto_7343 ?auto_7366 ) ) ( not ( = ?auto_7344 ?auto_7363 ) ) ( not ( = ?auto_7344 ?auto_7360 ) ) ( not ( = ?auto_7344 ?auto_7354 ) ) ( not ( = ?auto_7344 ?auto_7364 ) ) ( not ( = ?auto_7344 ?auto_7353 ) ) ( not ( = ?auto_7344 ?auto_7355 ) ) ( not ( = ?auto_7344 ?auto_7350 ) ) ( not ( = ?auto_7341 ?auto_7358 ) ) ( not ( = ?auto_7341 ?auto_7357 ) ) ( not ( = ?auto_7341 ?auto_7367 ) ) ( not ( = ?auto_7341 ?auto_7352 ) ) ( not ( = ?auto_7341 ?auto_7368 ) ) ( not ( = ?auto_7341 ?auto_7361 ) ) ( not ( = ?auto_7341 ?auto_7351 ) ) ( not ( = ?auto_7341 ?auto_7356 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_7331 ?auto_7332 ?auto_7333 ?auto_7334 ?auto_7335 ?auto_7336 ?auto_7337 ?auto_7340 ?auto_7339 )
      ( MAKE-1CRATE ?auto_7339 ?auto_7338 )
      ( MAKE-9CRATE-VERIFY ?auto_7331 ?auto_7332 ?auto_7333 ?auto_7334 ?auto_7335 ?auto_7336 ?auto_7337 ?auto_7340 ?auto_7339 ?auto_7338 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7371 - SURFACE
      ?auto_7372 - SURFACE
    )
    :vars
    (
      ?auto_7373 - HOIST
      ?auto_7374 - PLACE
      ?auto_7376 - PLACE
      ?auto_7377 - HOIST
      ?auto_7378 - SURFACE
      ?auto_7375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7373 ?auto_7374 ) ( SURFACE-AT ?auto_7371 ?auto_7374 ) ( CLEAR ?auto_7371 ) ( IS-CRATE ?auto_7372 ) ( AVAILABLE ?auto_7373 ) ( not ( = ?auto_7376 ?auto_7374 ) ) ( HOIST-AT ?auto_7377 ?auto_7376 ) ( AVAILABLE ?auto_7377 ) ( SURFACE-AT ?auto_7372 ?auto_7376 ) ( ON ?auto_7372 ?auto_7378 ) ( CLEAR ?auto_7372 ) ( TRUCK-AT ?auto_7375 ?auto_7374 ) ( not ( = ?auto_7371 ?auto_7372 ) ) ( not ( = ?auto_7371 ?auto_7378 ) ) ( not ( = ?auto_7372 ?auto_7378 ) ) ( not ( = ?auto_7373 ?auto_7377 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7375 ?auto_7374 ?auto_7376 )
      ( !LIFT ?auto_7377 ?auto_7372 ?auto_7378 ?auto_7376 )
      ( !LOAD ?auto_7377 ?auto_7372 ?auto_7375 ?auto_7376 )
      ( !DRIVE ?auto_7375 ?auto_7376 ?auto_7374 )
      ( !UNLOAD ?auto_7373 ?auto_7372 ?auto_7375 ?auto_7374 )
      ( !DROP ?auto_7373 ?auto_7372 ?auto_7371 ?auto_7374 )
      ( MAKE-1CRATE-VERIFY ?auto_7371 ?auto_7372 ) )
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
      ?auto_7399 - SURFACE
      ?auto_7398 - SURFACE
      ?auto_7397 - SURFACE
      ?auto_7400 - SURFACE
    )
    :vars
    (
      ?auto_7404 - HOIST
      ?auto_7401 - PLACE
      ?auto_7402 - PLACE
      ?auto_7406 - HOIST
      ?auto_7403 - SURFACE
      ?auto_7413 - PLACE
      ?auto_7415 - HOIST
      ?auto_7431 - SURFACE
      ?auto_7410 - PLACE
      ?auto_7418 - HOIST
      ?auto_7409 - SURFACE
      ?auto_7422 - PLACE
      ?auto_7423 - HOIST
      ?auto_7416 - SURFACE
      ?auto_7412 - PLACE
      ?auto_7427 - HOIST
      ?auto_7428 - SURFACE
      ?auto_7419 - PLACE
      ?auto_7429 - HOIST
      ?auto_7425 - SURFACE
      ?auto_7420 - PLACE
      ?auto_7424 - HOIST
      ?auto_7407 - SURFACE
      ?auto_7414 - SURFACE
      ?auto_7421 - PLACE
      ?auto_7408 - HOIST
      ?auto_7426 - SURFACE
      ?auto_7417 - PLACE
      ?auto_7430 - HOIST
      ?auto_7411 - SURFACE
      ?auto_7405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7404 ?auto_7401 ) ( IS-CRATE ?auto_7400 ) ( not ( = ?auto_7402 ?auto_7401 ) ) ( HOIST-AT ?auto_7406 ?auto_7402 ) ( AVAILABLE ?auto_7406 ) ( SURFACE-AT ?auto_7400 ?auto_7402 ) ( ON ?auto_7400 ?auto_7403 ) ( CLEAR ?auto_7400 ) ( not ( = ?auto_7397 ?auto_7400 ) ) ( not ( = ?auto_7397 ?auto_7403 ) ) ( not ( = ?auto_7400 ?auto_7403 ) ) ( not ( = ?auto_7404 ?auto_7406 ) ) ( IS-CRATE ?auto_7397 ) ( not ( = ?auto_7413 ?auto_7401 ) ) ( HOIST-AT ?auto_7415 ?auto_7413 ) ( AVAILABLE ?auto_7415 ) ( SURFACE-AT ?auto_7397 ?auto_7413 ) ( ON ?auto_7397 ?auto_7431 ) ( CLEAR ?auto_7397 ) ( not ( = ?auto_7398 ?auto_7397 ) ) ( not ( = ?auto_7398 ?auto_7431 ) ) ( not ( = ?auto_7397 ?auto_7431 ) ) ( not ( = ?auto_7404 ?auto_7415 ) ) ( IS-CRATE ?auto_7398 ) ( not ( = ?auto_7410 ?auto_7401 ) ) ( HOIST-AT ?auto_7418 ?auto_7410 ) ( SURFACE-AT ?auto_7398 ?auto_7410 ) ( ON ?auto_7398 ?auto_7409 ) ( CLEAR ?auto_7398 ) ( not ( = ?auto_7399 ?auto_7398 ) ) ( not ( = ?auto_7399 ?auto_7409 ) ) ( not ( = ?auto_7398 ?auto_7409 ) ) ( not ( = ?auto_7404 ?auto_7418 ) ) ( IS-CRATE ?auto_7399 ) ( not ( = ?auto_7422 ?auto_7401 ) ) ( HOIST-AT ?auto_7423 ?auto_7422 ) ( AVAILABLE ?auto_7423 ) ( SURFACE-AT ?auto_7399 ?auto_7422 ) ( ON ?auto_7399 ?auto_7416 ) ( CLEAR ?auto_7399 ) ( not ( = ?auto_7396 ?auto_7399 ) ) ( not ( = ?auto_7396 ?auto_7416 ) ) ( not ( = ?auto_7399 ?auto_7416 ) ) ( not ( = ?auto_7404 ?auto_7423 ) ) ( IS-CRATE ?auto_7396 ) ( not ( = ?auto_7412 ?auto_7401 ) ) ( HOIST-AT ?auto_7427 ?auto_7412 ) ( AVAILABLE ?auto_7427 ) ( SURFACE-AT ?auto_7396 ?auto_7412 ) ( ON ?auto_7396 ?auto_7428 ) ( CLEAR ?auto_7396 ) ( not ( = ?auto_7395 ?auto_7396 ) ) ( not ( = ?auto_7395 ?auto_7428 ) ) ( not ( = ?auto_7396 ?auto_7428 ) ) ( not ( = ?auto_7404 ?auto_7427 ) ) ( IS-CRATE ?auto_7395 ) ( not ( = ?auto_7419 ?auto_7401 ) ) ( HOIST-AT ?auto_7429 ?auto_7419 ) ( AVAILABLE ?auto_7429 ) ( SURFACE-AT ?auto_7395 ?auto_7419 ) ( ON ?auto_7395 ?auto_7425 ) ( CLEAR ?auto_7395 ) ( not ( = ?auto_7394 ?auto_7395 ) ) ( not ( = ?auto_7394 ?auto_7425 ) ) ( not ( = ?auto_7395 ?auto_7425 ) ) ( not ( = ?auto_7404 ?auto_7429 ) ) ( IS-CRATE ?auto_7394 ) ( not ( = ?auto_7420 ?auto_7401 ) ) ( HOIST-AT ?auto_7424 ?auto_7420 ) ( AVAILABLE ?auto_7424 ) ( SURFACE-AT ?auto_7394 ?auto_7420 ) ( ON ?auto_7394 ?auto_7407 ) ( CLEAR ?auto_7394 ) ( not ( = ?auto_7393 ?auto_7394 ) ) ( not ( = ?auto_7393 ?auto_7407 ) ) ( not ( = ?auto_7394 ?auto_7407 ) ) ( not ( = ?auto_7404 ?auto_7424 ) ) ( IS-CRATE ?auto_7393 ) ( AVAILABLE ?auto_7418 ) ( SURFACE-AT ?auto_7393 ?auto_7410 ) ( ON ?auto_7393 ?auto_7414 ) ( CLEAR ?auto_7393 ) ( not ( = ?auto_7392 ?auto_7393 ) ) ( not ( = ?auto_7392 ?auto_7414 ) ) ( not ( = ?auto_7393 ?auto_7414 ) ) ( IS-CRATE ?auto_7392 ) ( not ( = ?auto_7421 ?auto_7401 ) ) ( HOIST-AT ?auto_7408 ?auto_7421 ) ( AVAILABLE ?auto_7408 ) ( SURFACE-AT ?auto_7392 ?auto_7421 ) ( ON ?auto_7392 ?auto_7426 ) ( CLEAR ?auto_7392 ) ( not ( = ?auto_7391 ?auto_7392 ) ) ( not ( = ?auto_7391 ?auto_7426 ) ) ( not ( = ?auto_7392 ?auto_7426 ) ) ( not ( = ?auto_7404 ?auto_7408 ) ) ( SURFACE-AT ?auto_7390 ?auto_7401 ) ( CLEAR ?auto_7390 ) ( IS-CRATE ?auto_7391 ) ( AVAILABLE ?auto_7404 ) ( not ( = ?auto_7417 ?auto_7401 ) ) ( HOIST-AT ?auto_7430 ?auto_7417 ) ( AVAILABLE ?auto_7430 ) ( SURFACE-AT ?auto_7391 ?auto_7417 ) ( ON ?auto_7391 ?auto_7411 ) ( CLEAR ?auto_7391 ) ( TRUCK-AT ?auto_7405 ?auto_7401 ) ( not ( = ?auto_7390 ?auto_7391 ) ) ( not ( = ?auto_7390 ?auto_7411 ) ) ( not ( = ?auto_7391 ?auto_7411 ) ) ( not ( = ?auto_7404 ?auto_7430 ) ) ( not ( = ?auto_7390 ?auto_7392 ) ) ( not ( = ?auto_7390 ?auto_7426 ) ) ( not ( = ?auto_7392 ?auto_7411 ) ) ( not ( = ?auto_7421 ?auto_7417 ) ) ( not ( = ?auto_7408 ?auto_7430 ) ) ( not ( = ?auto_7426 ?auto_7411 ) ) ( not ( = ?auto_7390 ?auto_7393 ) ) ( not ( = ?auto_7390 ?auto_7414 ) ) ( not ( = ?auto_7391 ?auto_7393 ) ) ( not ( = ?auto_7391 ?auto_7414 ) ) ( not ( = ?auto_7393 ?auto_7426 ) ) ( not ( = ?auto_7393 ?auto_7411 ) ) ( not ( = ?auto_7410 ?auto_7421 ) ) ( not ( = ?auto_7410 ?auto_7417 ) ) ( not ( = ?auto_7418 ?auto_7408 ) ) ( not ( = ?auto_7418 ?auto_7430 ) ) ( not ( = ?auto_7414 ?auto_7426 ) ) ( not ( = ?auto_7414 ?auto_7411 ) ) ( not ( = ?auto_7390 ?auto_7394 ) ) ( not ( = ?auto_7390 ?auto_7407 ) ) ( not ( = ?auto_7391 ?auto_7394 ) ) ( not ( = ?auto_7391 ?auto_7407 ) ) ( not ( = ?auto_7392 ?auto_7394 ) ) ( not ( = ?auto_7392 ?auto_7407 ) ) ( not ( = ?auto_7394 ?auto_7414 ) ) ( not ( = ?auto_7394 ?auto_7426 ) ) ( not ( = ?auto_7394 ?auto_7411 ) ) ( not ( = ?auto_7420 ?auto_7410 ) ) ( not ( = ?auto_7420 ?auto_7421 ) ) ( not ( = ?auto_7420 ?auto_7417 ) ) ( not ( = ?auto_7424 ?auto_7418 ) ) ( not ( = ?auto_7424 ?auto_7408 ) ) ( not ( = ?auto_7424 ?auto_7430 ) ) ( not ( = ?auto_7407 ?auto_7414 ) ) ( not ( = ?auto_7407 ?auto_7426 ) ) ( not ( = ?auto_7407 ?auto_7411 ) ) ( not ( = ?auto_7390 ?auto_7395 ) ) ( not ( = ?auto_7390 ?auto_7425 ) ) ( not ( = ?auto_7391 ?auto_7395 ) ) ( not ( = ?auto_7391 ?auto_7425 ) ) ( not ( = ?auto_7392 ?auto_7395 ) ) ( not ( = ?auto_7392 ?auto_7425 ) ) ( not ( = ?auto_7393 ?auto_7395 ) ) ( not ( = ?auto_7393 ?auto_7425 ) ) ( not ( = ?auto_7395 ?auto_7407 ) ) ( not ( = ?auto_7395 ?auto_7414 ) ) ( not ( = ?auto_7395 ?auto_7426 ) ) ( not ( = ?auto_7395 ?auto_7411 ) ) ( not ( = ?auto_7419 ?auto_7420 ) ) ( not ( = ?auto_7419 ?auto_7410 ) ) ( not ( = ?auto_7419 ?auto_7421 ) ) ( not ( = ?auto_7419 ?auto_7417 ) ) ( not ( = ?auto_7429 ?auto_7424 ) ) ( not ( = ?auto_7429 ?auto_7418 ) ) ( not ( = ?auto_7429 ?auto_7408 ) ) ( not ( = ?auto_7429 ?auto_7430 ) ) ( not ( = ?auto_7425 ?auto_7407 ) ) ( not ( = ?auto_7425 ?auto_7414 ) ) ( not ( = ?auto_7425 ?auto_7426 ) ) ( not ( = ?auto_7425 ?auto_7411 ) ) ( not ( = ?auto_7390 ?auto_7396 ) ) ( not ( = ?auto_7390 ?auto_7428 ) ) ( not ( = ?auto_7391 ?auto_7396 ) ) ( not ( = ?auto_7391 ?auto_7428 ) ) ( not ( = ?auto_7392 ?auto_7396 ) ) ( not ( = ?auto_7392 ?auto_7428 ) ) ( not ( = ?auto_7393 ?auto_7396 ) ) ( not ( = ?auto_7393 ?auto_7428 ) ) ( not ( = ?auto_7394 ?auto_7396 ) ) ( not ( = ?auto_7394 ?auto_7428 ) ) ( not ( = ?auto_7396 ?auto_7425 ) ) ( not ( = ?auto_7396 ?auto_7407 ) ) ( not ( = ?auto_7396 ?auto_7414 ) ) ( not ( = ?auto_7396 ?auto_7426 ) ) ( not ( = ?auto_7396 ?auto_7411 ) ) ( not ( = ?auto_7412 ?auto_7419 ) ) ( not ( = ?auto_7412 ?auto_7420 ) ) ( not ( = ?auto_7412 ?auto_7410 ) ) ( not ( = ?auto_7412 ?auto_7421 ) ) ( not ( = ?auto_7412 ?auto_7417 ) ) ( not ( = ?auto_7427 ?auto_7429 ) ) ( not ( = ?auto_7427 ?auto_7424 ) ) ( not ( = ?auto_7427 ?auto_7418 ) ) ( not ( = ?auto_7427 ?auto_7408 ) ) ( not ( = ?auto_7427 ?auto_7430 ) ) ( not ( = ?auto_7428 ?auto_7425 ) ) ( not ( = ?auto_7428 ?auto_7407 ) ) ( not ( = ?auto_7428 ?auto_7414 ) ) ( not ( = ?auto_7428 ?auto_7426 ) ) ( not ( = ?auto_7428 ?auto_7411 ) ) ( not ( = ?auto_7390 ?auto_7399 ) ) ( not ( = ?auto_7390 ?auto_7416 ) ) ( not ( = ?auto_7391 ?auto_7399 ) ) ( not ( = ?auto_7391 ?auto_7416 ) ) ( not ( = ?auto_7392 ?auto_7399 ) ) ( not ( = ?auto_7392 ?auto_7416 ) ) ( not ( = ?auto_7393 ?auto_7399 ) ) ( not ( = ?auto_7393 ?auto_7416 ) ) ( not ( = ?auto_7394 ?auto_7399 ) ) ( not ( = ?auto_7394 ?auto_7416 ) ) ( not ( = ?auto_7395 ?auto_7399 ) ) ( not ( = ?auto_7395 ?auto_7416 ) ) ( not ( = ?auto_7399 ?auto_7428 ) ) ( not ( = ?auto_7399 ?auto_7425 ) ) ( not ( = ?auto_7399 ?auto_7407 ) ) ( not ( = ?auto_7399 ?auto_7414 ) ) ( not ( = ?auto_7399 ?auto_7426 ) ) ( not ( = ?auto_7399 ?auto_7411 ) ) ( not ( = ?auto_7422 ?auto_7412 ) ) ( not ( = ?auto_7422 ?auto_7419 ) ) ( not ( = ?auto_7422 ?auto_7420 ) ) ( not ( = ?auto_7422 ?auto_7410 ) ) ( not ( = ?auto_7422 ?auto_7421 ) ) ( not ( = ?auto_7422 ?auto_7417 ) ) ( not ( = ?auto_7423 ?auto_7427 ) ) ( not ( = ?auto_7423 ?auto_7429 ) ) ( not ( = ?auto_7423 ?auto_7424 ) ) ( not ( = ?auto_7423 ?auto_7418 ) ) ( not ( = ?auto_7423 ?auto_7408 ) ) ( not ( = ?auto_7423 ?auto_7430 ) ) ( not ( = ?auto_7416 ?auto_7428 ) ) ( not ( = ?auto_7416 ?auto_7425 ) ) ( not ( = ?auto_7416 ?auto_7407 ) ) ( not ( = ?auto_7416 ?auto_7414 ) ) ( not ( = ?auto_7416 ?auto_7426 ) ) ( not ( = ?auto_7416 ?auto_7411 ) ) ( not ( = ?auto_7390 ?auto_7398 ) ) ( not ( = ?auto_7390 ?auto_7409 ) ) ( not ( = ?auto_7391 ?auto_7398 ) ) ( not ( = ?auto_7391 ?auto_7409 ) ) ( not ( = ?auto_7392 ?auto_7398 ) ) ( not ( = ?auto_7392 ?auto_7409 ) ) ( not ( = ?auto_7393 ?auto_7398 ) ) ( not ( = ?auto_7393 ?auto_7409 ) ) ( not ( = ?auto_7394 ?auto_7398 ) ) ( not ( = ?auto_7394 ?auto_7409 ) ) ( not ( = ?auto_7395 ?auto_7398 ) ) ( not ( = ?auto_7395 ?auto_7409 ) ) ( not ( = ?auto_7396 ?auto_7398 ) ) ( not ( = ?auto_7396 ?auto_7409 ) ) ( not ( = ?auto_7398 ?auto_7416 ) ) ( not ( = ?auto_7398 ?auto_7428 ) ) ( not ( = ?auto_7398 ?auto_7425 ) ) ( not ( = ?auto_7398 ?auto_7407 ) ) ( not ( = ?auto_7398 ?auto_7414 ) ) ( not ( = ?auto_7398 ?auto_7426 ) ) ( not ( = ?auto_7398 ?auto_7411 ) ) ( not ( = ?auto_7409 ?auto_7416 ) ) ( not ( = ?auto_7409 ?auto_7428 ) ) ( not ( = ?auto_7409 ?auto_7425 ) ) ( not ( = ?auto_7409 ?auto_7407 ) ) ( not ( = ?auto_7409 ?auto_7414 ) ) ( not ( = ?auto_7409 ?auto_7426 ) ) ( not ( = ?auto_7409 ?auto_7411 ) ) ( not ( = ?auto_7390 ?auto_7397 ) ) ( not ( = ?auto_7390 ?auto_7431 ) ) ( not ( = ?auto_7391 ?auto_7397 ) ) ( not ( = ?auto_7391 ?auto_7431 ) ) ( not ( = ?auto_7392 ?auto_7397 ) ) ( not ( = ?auto_7392 ?auto_7431 ) ) ( not ( = ?auto_7393 ?auto_7397 ) ) ( not ( = ?auto_7393 ?auto_7431 ) ) ( not ( = ?auto_7394 ?auto_7397 ) ) ( not ( = ?auto_7394 ?auto_7431 ) ) ( not ( = ?auto_7395 ?auto_7397 ) ) ( not ( = ?auto_7395 ?auto_7431 ) ) ( not ( = ?auto_7396 ?auto_7397 ) ) ( not ( = ?auto_7396 ?auto_7431 ) ) ( not ( = ?auto_7399 ?auto_7397 ) ) ( not ( = ?auto_7399 ?auto_7431 ) ) ( not ( = ?auto_7397 ?auto_7409 ) ) ( not ( = ?auto_7397 ?auto_7416 ) ) ( not ( = ?auto_7397 ?auto_7428 ) ) ( not ( = ?auto_7397 ?auto_7425 ) ) ( not ( = ?auto_7397 ?auto_7407 ) ) ( not ( = ?auto_7397 ?auto_7414 ) ) ( not ( = ?auto_7397 ?auto_7426 ) ) ( not ( = ?auto_7397 ?auto_7411 ) ) ( not ( = ?auto_7413 ?auto_7410 ) ) ( not ( = ?auto_7413 ?auto_7422 ) ) ( not ( = ?auto_7413 ?auto_7412 ) ) ( not ( = ?auto_7413 ?auto_7419 ) ) ( not ( = ?auto_7413 ?auto_7420 ) ) ( not ( = ?auto_7413 ?auto_7421 ) ) ( not ( = ?auto_7413 ?auto_7417 ) ) ( not ( = ?auto_7415 ?auto_7418 ) ) ( not ( = ?auto_7415 ?auto_7423 ) ) ( not ( = ?auto_7415 ?auto_7427 ) ) ( not ( = ?auto_7415 ?auto_7429 ) ) ( not ( = ?auto_7415 ?auto_7424 ) ) ( not ( = ?auto_7415 ?auto_7408 ) ) ( not ( = ?auto_7415 ?auto_7430 ) ) ( not ( = ?auto_7431 ?auto_7409 ) ) ( not ( = ?auto_7431 ?auto_7416 ) ) ( not ( = ?auto_7431 ?auto_7428 ) ) ( not ( = ?auto_7431 ?auto_7425 ) ) ( not ( = ?auto_7431 ?auto_7407 ) ) ( not ( = ?auto_7431 ?auto_7414 ) ) ( not ( = ?auto_7431 ?auto_7426 ) ) ( not ( = ?auto_7431 ?auto_7411 ) ) ( not ( = ?auto_7390 ?auto_7400 ) ) ( not ( = ?auto_7390 ?auto_7403 ) ) ( not ( = ?auto_7391 ?auto_7400 ) ) ( not ( = ?auto_7391 ?auto_7403 ) ) ( not ( = ?auto_7392 ?auto_7400 ) ) ( not ( = ?auto_7392 ?auto_7403 ) ) ( not ( = ?auto_7393 ?auto_7400 ) ) ( not ( = ?auto_7393 ?auto_7403 ) ) ( not ( = ?auto_7394 ?auto_7400 ) ) ( not ( = ?auto_7394 ?auto_7403 ) ) ( not ( = ?auto_7395 ?auto_7400 ) ) ( not ( = ?auto_7395 ?auto_7403 ) ) ( not ( = ?auto_7396 ?auto_7400 ) ) ( not ( = ?auto_7396 ?auto_7403 ) ) ( not ( = ?auto_7399 ?auto_7400 ) ) ( not ( = ?auto_7399 ?auto_7403 ) ) ( not ( = ?auto_7398 ?auto_7400 ) ) ( not ( = ?auto_7398 ?auto_7403 ) ) ( not ( = ?auto_7400 ?auto_7431 ) ) ( not ( = ?auto_7400 ?auto_7409 ) ) ( not ( = ?auto_7400 ?auto_7416 ) ) ( not ( = ?auto_7400 ?auto_7428 ) ) ( not ( = ?auto_7400 ?auto_7425 ) ) ( not ( = ?auto_7400 ?auto_7407 ) ) ( not ( = ?auto_7400 ?auto_7414 ) ) ( not ( = ?auto_7400 ?auto_7426 ) ) ( not ( = ?auto_7400 ?auto_7411 ) ) ( not ( = ?auto_7402 ?auto_7413 ) ) ( not ( = ?auto_7402 ?auto_7410 ) ) ( not ( = ?auto_7402 ?auto_7422 ) ) ( not ( = ?auto_7402 ?auto_7412 ) ) ( not ( = ?auto_7402 ?auto_7419 ) ) ( not ( = ?auto_7402 ?auto_7420 ) ) ( not ( = ?auto_7402 ?auto_7421 ) ) ( not ( = ?auto_7402 ?auto_7417 ) ) ( not ( = ?auto_7406 ?auto_7415 ) ) ( not ( = ?auto_7406 ?auto_7418 ) ) ( not ( = ?auto_7406 ?auto_7423 ) ) ( not ( = ?auto_7406 ?auto_7427 ) ) ( not ( = ?auto_7406 ?auto_7429 ) ) ( not ( = ?auto_7406 ?auto_7424 ) ) ( not ( = ?auto_7406 ?auto_7408 ) ) ( not ( = ?auto_7406 ?auto_7430 ) ) ( not ( = ?auto_7403 ?auto_7431 ) ) ( not ( = ?auto_7403 ?auto_7409 ) ) ( not ( = ?auto_7403 ?auto_7416 ) ) ( not ( = ?auto_7403 ?auto_7428 ) ) ( not ( = ?auto_7403 ?auto_7425 ) ) ( not ( = ?auto_7403 ?auto_7407 ) ) ( not ( = ?auto_7403 ?auto_7414 ) ) ( not ( = ?auto_7403 ?auto_7426 ) ) ( not ( = ?auto_7403 ?auto_7411 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_7390 ?auto_7391 ?auto_7392 ?auto_7393 ?auto_7394 ?auto_7395 ?auto_7396 ?auto_7399 ?auto_7398 ?auto_7397 )
      ( MAKE-1CRATE ?auto_7397 ?auto_7400 )
      ( MAKE-10CRATE-VERIFY ?auto_7390 ?auto_7391 ?auto_7392 ?auto_7393 ?auto_7394 ?auto_7395 ?auto_7396 ?auto_7399 ?auto_7398 ?auto_7397 ?auto_7400 ) )
  )

)

