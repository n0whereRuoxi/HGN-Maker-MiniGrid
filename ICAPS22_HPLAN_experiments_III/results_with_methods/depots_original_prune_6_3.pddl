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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44010 - SURFACE
      ?auto_44011 - SURFACE
    )
    :vars
    (
      ?auto_44012 - HOIST
      ?auto_44013 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44012 ?auto_44013 ) ( SURFACE-AT ?auto_44010 ?auto_44013 ) ( CLEAR ?auto_44010 ) ( LIFTING ?auto_44012 ?auto_44011 ) ( IS-CRATE ?auto_44011 ) ( not ( = ?auto_44010 ?auto_44011 ) ) )
    :subtasks
    ( ( !DROP ?auto_44012 ?auto_44011 ?auto_44010 ?auto_44013 )
      ( MAKE-1CRATE-VERIFY ?auto_44010 ?auto_44011 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44014 - SURFACE
      ?auto_44015 - SURFACE
    )
    :vars
    (
      ?auto_44016 - HOIST
      ?auto_44017 - PLACE
      ?auto_44018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44016 ?auto_44017 ) ( SURFACE-AT ?auto_44014 ?auto_44017 ) ( CLEAR ?auto_44014 ) ( IS-CRATE ?auto_44015 ) ( not ( = ?auto_44014 ?auto_44015 ) ) ( TRUCK-AT ?auto_44018 ?auto_44017 ) ( AVAILABLE ?auto_44016 ) ( IN ?auto_44015 ?auto_44018 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44016 ?auto_44015 ?auto_44018 ?auto_44017 )
      ( MAKE-1CRATE ?auto_44014 ?auto_44015 )
      ( MAKE-1CRATE-VERIFY ?auto_44014 ?auto_44015 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44019 - SURFACE
      ?auto_44020 - SURFACE
    )
    :vars
    (
      ?auto_44022 - HOIST
      ?auto_44021 - PLACE
      ?auto_44023 - TRUCK
      ?auto_44024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44022 ?auto_44021 ) ( SURFACE-AT ?auto_44019 ?auto_44021 ) ( CLEAR ?auto_44019 ) ( IS-CRATE ?auto_44020 ) ( not ( = ?auto_44019 ?auto_44020 ) ) ( AVAILABLE ?auto_44022 ) ( IN ?auto_44020 ?auto_44023 ) ( TRUCK-AT ?auto_44023 ?auto_44024 ) ( not ( = ?auto_44024 ?auto_44021 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44023 ?auto_44024 ?auto_44021 )
      ( MAKE-1CRATE ?auto_44019 ?auto_44020 )
      ( MAKE-1CRATE-VERIFY ?auto_44019 ?auto_44020 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44025 - SURFACE
      ?auto_44026 - SURFACE
    )
    :vars
    (
      ?auto_44028 - HOIST
      ?auto_44027 - PLACE
      ?auto_44030 - TRUCK
      ?auto_44029 - PLACE
      ?auto_44031 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44028 ?auto_44027 ) ( SURFACE-AT ?auto_44025 ?auto_44027 ) ( CLEAR ?auto_44025 ) ( IS-CRATE ?auto_44026 ) ( not ( = ?auto_44025 ?auto_44026 ) ) ( AVAILABLE ?auto_44028 ) ( TRUCK-AT ?auto_44030 ?auto_44029 ) ( not ( = ?auto_44029 ?auto_44027 ) ) ( HOIST-AT ?auto_44031 ?auto_44029 ) ( LIFTING ?auto_44031 ?auto_44026 ) ( not ( = ?auto_44028 ?auto_44031 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44031 ?auto_44026 ?auto_44030 ?auto_44029 )
      ( MAKE-1CRATE ?auto_44025 ?auto_44026 )
      ( MAKE-1CRATE-VERIFY ?auto_44025 ?auto_44026 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44032 - SURFACE
      ?auto_44033 - SURFACE
    )
    :vars
    (
      ?auto_44035 - HOIST
      ?auto_44037 - PLACE
      ?auto_44036 - TRUCK
      ?auto_44034 - PLACE
      ?auto_44038 - HOIST
      ?auto_44039 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44035 ?auto_44037 ) ( SURFACE-AT ?auto_44032 ?auto_44037 ) ( CLEAR ?auto_44032 ) ( IS-CRATE ?auto_44033 ) ( not ( = ?auto_44032 ?auto_44033 ) ) ( AVAILABLE ?auto_44035 ) ( TRUCK-AT ?auto_44036 ?auto_44034 ) ( not ( = ?auto_44034 ?auto_44037 ) ) ( HOIST-AT ?auto_44038 ?auto_44034 ) ( not ( = ?auto_44035 ?auto_44038 ) ) ( AVAILABLE ?auto_44038 ) ( SURFACE-AT ?auto_44033 ?auto_44034 ) ( ON ?auto_44033 ?auto_44039 ) ( CLEAR ?auto_44033 ) ( not ( = ?auto_44032 ?auto_44039 ) ) ( not ( = ?auto_44033 ?auto_44039 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44038 ?auto_44033 ?auto_44039 ?auto_44034 )
      ( MAKE-1CRATE ?auto_44032 ?auto_44033 )
      ( MAKE-1CRATE-VERIFY ?auto_44032 ?auto_44033 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44040 - SURFACE
      ?auto_44041 - SURFACE
    )
    :vars
    (
      ?auto_44042 - HOIST
      ?auto_44046 - PLACE
      ?auto_44045 - PLACE
      ?auto_44043 - HOIST
      ?auto_44047 - SURFACE
      ?auto_44044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44042 ?auto_44046 ) ( SURFACE-AT ?auto_44040 ?auto_44046 ) ( CLEAR ?auto_44040 ) ( IS-CRATE ?auto_44041 ) ( not ( = ?auto_44040 ?auto_44041 ) ) ( AVAILABLE ?auto_44042 ) ( not ( = ?auto_44045 ?auto_44046 ) ) ( HOIST-AT ?auto_44043 ?auto_44045 ) ( not ( = ?auto_44042 ?auto_44043 ) ) ( AVAILABLE ?auto_44043 ) ( SURFACE-AT ?auto_44041 ?auto_44045 ) ( ON ?auto_44041 ?auto_44047 ) ( CLEAR ?auto_44041 ) ( not ( = ?auto_44040 ?auto_44047 ) ) ( not ( = ?auto_44041 ?auto_44047 ) ) ( TRUCK-AT ?auto_44044 ?auto_44046 ) )
    :subtasks
    ( ( !DRIVE ?auto_44044 ?auto_44046 ?auto_44045 )
      ( MAKE-1CRATE ?auto_44040 ?auto_44041 )
      ( MAKE-1CRATE-VERIFY ?auto_44040 ?auto_44041 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44057 - SURFACE
      ?auto_44058 - SURFACE
      ?auto_44059 - SURFACE
    )
    :vars
    (
      ?auto_44060 - HOIST
      ?auto_44061 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44060 ?auto_44061 ) ( SURFACE-AT ?auto_44058 ?auto_44061 ) ( CLEAR ?auto_44058 ) ( LIFTING ?auto_44060 ?auto_44059 ) ( IS-CRATE ?auto_44059 ) ( not ( = ?auto_44058 ?auto_44059 ) ) ( ON ?auto_44058 ?auto_44057 ) ( not ( = ?auto_44057 ?auto_44058 ) ) ( not ( = ?auto_44057 ?auto_44059 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44058 ?auto_44059 )
      ( MAKE-2CRATE-VERIFY ?auto_44057 ?auto_44058 ?auto_44059 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44067 - SURFACE
      ?auto_44068 - SURFACE
      ?auto_44069 - SURFACE
    )
    :vars
    (
      ?auto_44072 - HOIST
      ?auto_44070 - PLACE
      ?auto_44071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44072 ?auto_44070 ) ( SURFACE-AT ?auto_44068 ?auto_44070 ) ( CLEAR ?auto_44068 ) ( IS-CRATE ?auto_44069 ) ( not ( = ?auto_44068 ?auto_44069 ) ) ( TRUCK-AT ?auto_44071 ?auto_44070 ) ( AVAILABLE ?auto_44072 ) ( IN ?auto_44069 ?auto_44071 ) ( ON ?auto_44068 ?auto_44067 ) ( not ( = ?auto_44067 ?auto_44068 ) ) ( not ( = ?auto_44067 ?auto_44069 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44068 ?auto_44069 )
      ( MAKE-2CRATE-VERIFY ?auto_44067 ?auto_44068 ?auto_44069 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44073 - SURFACE
      ?auto_44074 - SURFACE
    )
    :vars
    (
      ?auto_44077 - HOIST
      ?auto_44076 - PLACE
      ?auto_44075 - TRUCK
      ?auto_44078 - SURFACE
      ?auto_44079 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44077 ?auto_44076 ) ( SURFACE-AT ?auto_44073 ?auto_44076 ) ( CLEAR ?auto_44073 ) ( IS-CRATE ?auto_44074 ) ( not ( = ?auto_44073 ?auto_44074 ) ) ( AVAILABLE ?auto_44077 ) ( IN ?auto_44074 ?auto_44075 ) ( ON ?auto_44073 ?auto_44078 ) ( not ( = ?auto_44078 ?auto_44073 ) ) ( not ( = ?auto_44078 ?auto_44074 ) ) ( TRUCK-AT ?auto_44075 ?auto_44079 ) ( not ( = ?auto_44079 ?auto_44076 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44075 ?auto_44079 ?auto_44076 )
      ( MAKE-2CRATE ?auto_44078 ?auto_44073 ?auto_44074 )
      ( MAKE-1CRATE-VERIFY ?auto_44073 ?auto_44074 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44080 - SURFACE
      ?auto_44081 - SURFACE
      ?auto_44082 - SURFACE
    )
    :vars
    (
      ?auto_44084 - HOIST
      ?auto_44085 - PLACE
      ?auto_44086 - TRUCK
      ?auto_44083 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44084 ?auto_44085 ) ( SURFACE-AT ?auto_44081 ?auto_44085 ) ( CLEAR ?auto_44081 ) ( IS-CRATE ?auto_44082 ) ( not ( = ?auto_44081 ?auto_44082 ) ) ( AVAILABLE ?auto_44084 ) ( IN ?auto_44082 ?auto_44086 ) ( ON ?auto_44081 ?auto_44080 ) ( not ( = ?auto_44080 ?auto_44081 ) ) ( not ( = ?auto_44080 ?auto_44082 ) ) ( TRUCK-AT ?auto_44086 ?auto_44083 ) ( not ( = ?auto_44083 ?auto_44085 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44081 ?auto_44082 )
      ( MAKE-2CRATE-VERIFY ?auto_44080 ?auto_44081 ?auto_44082 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44087 - SURFACE
      ?auto_44088 - SURFACE
    )
    :vars
    (
      ?auto_44089 - HOIST
      ?auto_44090 - PLACE
      ?auto_44092 - SURFACE
      ?auto_44093 - TRUCK
      ?auto_44091 - PLACE
      ?auto_44094 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44089 ?auto_44090 ) ( SURFACE-AT ?auto_44087 ?auto_44090 ) ( CLEAR ?auto_44087 ) ( IS-CRATE ?auto_44088 ) ( not ( = ?auto_44087 ?auto_44088 ) ) ( AVAILABLE ?auto_44089 ) ( ON ?auto_44087 ?auto_44092 ) ( not ( = ?auto_44092 ?auto_44087 ) ) ( not ( = ?auto_44092 ?auto_44088 ) ) ( TRUCK-AT ?auto_44093 ?auto_44091 ) ( not ( = ?auto_44091 ?auto_44090 ) ) ( HOIST-AT ?auto_44094 ?auto_44091 ) ( LIFTING ?auto_44094 ?auto_44088 ) ( not ( = ?auto_44089 ?auto_44094 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44094 ?auto_44088 ?auto_44093 ?auto_44091 )
      ( MAKE-2CRATE ?auto_44092 ?auto_44087 ?auto_44088 )
      ( MAKE-1CRATE-VERIFY ?auto_44087 ?auto_44088 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44095 - SURFACE
      ?auto_44096 - SURFACE
      ?auto_44097 - SURFACE
    )
    :vars
    (
      ?auto_44102 - HOIST
      ?auto_44099 - PLACE
      ?auto_44098 - TRUCK
      ?auto_44100 - PLACE
      ?auto_44101 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44102 ?auto_44099 ) ( SURFACE-AT ?auto_44096 ?auto_44099 ) ( CLEAR ?auto_44096 ) ( IS-CRATE ?auto_44097 ) ( not ( = ?auto_44096 ?auto_44097 ) ) ( AVAILABLE ?auto_44102 ) ( ON ?auto_44096 ?auto_44095 ) ( not ( = ?auto_44095 ?auto_44096 ) ) ( not ( = ?auto_44095 ?auto_44097 ) ) ( TRUCK-AT ?auto_44098 ?auto_44100 ) ( not ( = ?auto_44100 ?auto_44099 ) ) ( HOIST-AT ?auto_44101 ?auto_44100 ) ( LIFTING ?auto_44101 ?auto_44097 ) ( not ( = ?auto_44102 ?auto_44101 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44096 ?auto_44097 )
      ( MAKE-2CRATE-VERIFY ?auto_44095 ?auto_44096 ?auto_44097 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44103 - SURFACE
      ?auto_44104 - SURFACE
    )
    :vars
    (
      ?auto_44108 - HOIST
      ?auto_44105 - PLACE
      ?auto_44109 - SURFACE
      ?auto_44107 - TRUCK
      ?auto_44106 - PLACE
      ?auto_44110 - HOIST
      ?auto_44111 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44108 ?auto_44105 ) ( SURFACE-AT ?auto_44103 ?auto_44105 ) ( CLEAR ?auto_44103 ) ( IS-CRATE ?auto_44104 ) ( not ( = ?auto_44103 ?auto_44104 ) ) ( AVAILABLE ?auto_44108 ) ( ON ?auto_44103 ?auto_44109 ) ( not ( = ?auto_44109 ?auto_44103 ) ) ( not ( = ?auto_44109 ?auto_44104 ) ) ( TRUCK-AT ?auto_44107 ?auto_44106 ) ( not ( = ?auto_44106 ?auto_44105 ) ) ( HOIST-AT ?auto_44110 ?auto_44106 ) ( not ( = ?auto_44108 ?auto_44110 ) ) ( AVAILABLE ?auto_44110 ) ( SURFACE-AT ?auto_44104 ?auto_44106 ) ( ON ?auto_44104 ?auto_44111 ) ( CLEAR ?auto_44104 ) ( not ( = ?auto_44103 ?auto_44111 ) ) ( not ( = ?auto_44104 ?auto_44111 ) ) ( not ( = ?auto_44109 ?auto_44111 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44110 ?auto_44104 ?auto_44111 ?auto_44106 )
      ( MAKE-2CRATE ?auto_44109 ?auto_44103 ?auto_44104 )
      ( MAKE-1CRATE-VERIFY ?auto_44103 ?auto_44104 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44112 - SURFACE
      ?auto_44113 - SURFACE
      ?auto_44114 - SURFACE
    )
    :vars
    (
      ?auto_44118 - HOIST
      ?auto_44119 - PLACE
      ?auto_44115 - TRUCK
      ?auto_44117 - PLACE
      ?auto_44116 - HOIST
      ?auto_44120 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44118 ?auto_44119 ) ( SURFACE-AT ?auto_44113 ?auto_44119 ) ( CLEAR ?auto_44113 ) ( IS-CRATE ?auto_44114 ) ( not ( = ?auto_44113 ?auto_44114 ) ) ( AVAILABLE ?auto_44118 ) ( ON ?auto_44113 ?auto_44112 ) ( not ( = ?auto_44112 ?auto_44113 ) ) ( not ( = ?auto_44112 ?auto_44114 ) ) ( TRUCK-AT ?auto_44115 ?auto_44117 ) ( not ( = ?auto_44117 ?auto_44119 ) ) ( HOIST-AT ?auto_44116 ?auto_44117 ) ( not ( = ?auto_44118 ?auto_44116 ) ) ( AVAILABLE ?auto_44116 ) ( SURFACE-AT ?auto_44114 ?auto_44117 ) ( ON ?auto_44114 ?auto_44120 ) ( CLEAR ?auto_44114 ) ( not ( = ?auto_44113 ?auto_44120 ) ) ( not ( = ?auto_44114 ?auto_44120 ) ) ( not ( = ?auto_44112 ?auto_44120 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44113 ?auto_44114 )
      ( MAKE-2CRATE-VERIFY ?auto_44112 ?auto_44113 ?auto_44114 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44121 - SURFACE
      ?auto_44122 - SURFACE
    )
    :vars
    (
      ?auto_44128 - HOIST
      ?auto_44127 - PLACE
      ?auto_44123 - SURFACE
      ?auto_44125 - PLACE
      ?auto_44129 - HOIST
      ?auto_44124 - SURFACE
      ?auto_44126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44128 ?auto_44127 ) ( SURFACE-AT ?auto_44121 ?auto_44127 ) ( CLEAR ?auto_44121 ) ( IS-CRATE ?auto_44122 ) ( not ( = ?auto_44121 ?auto_44122 ) ) ( AVAILABLE ?auto_44128 ) ( ON ?auto_44121 ?auto_44123 ) ( not ( = ?auto_44123 ?auto_44121 ) ) ( not ( = ?auto_44123 ?auto_44122 ) ) ( not ( = ?auto_44125 ?auto_44127 ) ) ( HOIST-AT ?auto_44129 ?auto_44125 ) ( not ( = ?auto_44128 ?auto_44129 ) ) ( AVAILABLE ?auto_44129 ) ( SURFACE-AT ?auto_44122 ?auto_44125 ) ( ON ?auto_44122 ?auto_44124 ) ( CLEAR ?auto_44122 ) ( not ( = ?auto_44121 ?auto_44124 ) ) ( not ( = ?auto_44122 ?auto_44124 ) ) ( not ( = ?auto_44123 ?auto_44124 ) ) ( TRUCK-AT ?auto_44126 ?auto_44127 ) )
    :subtasks
    ( ( !DRIVE ?auto_44126 ?auto_44127 ?auto_44125 )
      ( MAKE-2CRATE ?auto_44123 ?auto_44121 ?auto_44122 )
      ( MAKE-1CRATE-VERIFY ?auto_44121 ?auto_44122 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44130 - SURFACE
      ?auto_44131 - SURFACE
      ?auto_44132 - SURFACE
    )
    :vars
    (
      ?auto_44134 - HOIST
      ?auto_44138 - PLACE
      ?auto_44136 - PLACE
      ?auto_44133 - HOIST
      ?auto_44137 - SURFACE
      ?auto_44135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44134 ?auto_44138 ) ( SURFACE-AT ?auto_44131 ?auto_44138 ) ( CLEAR ?auto_44131 ) ( IS-CRATE ?auto_44132 ) ( not ( = ?auto_44131 ?auto_44132 ) ) ( AVAILABLE ?auto_44134 ) ( ON ?auto_44131 ?auto_44130 ) ( not ( = ?auto_44130 ?auto_44131 ) ) ( not ( = ?auto_44130 ?auto_44132 ) ) ( not ( = ?auto_44136 ?auto_44138 ) ) ( HOIST-AT ?auto_44133 ?auto_44136 ) ( not ( = ?auto_44134 ?auto_44133 ) ) ( AVAILABLE ?auto_44133 ) ( SURFACE-AT ?auto_44132 ?auto_44136 ) ( ON ?auto_44132 ?auto_44137 ) ( CLEAR ?auto_44132 ) ( not ( = ?auto_44131 ?auto_44137 ) ) ( not ( = ?auto_44132 ?auto_44137 ) ) ( not ( = ?auto_44130 ?auto_44137 ) ) ( TRUCK-AT ?auto_44135 ?auto_44138 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44131 ?auto_44132 )
      ( MAKE-2CRATE-VERIFY ?auto_44130 ?auto_44131 ?auto_44132 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44139 - SURFACE
      ?auto_44140 - SURFACE
    )
    :vars
    (
      ?auto_44145 - HOIST
      ?auto_44147 - PLACE
      ?auto_44143 - SURFACE
      ?auto_44142 - PLACE
      ?auto_44141 - HOIST
      ?auto_44144 - SURFACE
      ?auto_44146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44145 ?auto_44147 ) ( IS-CRATE ?auto_44140 ) ( not ( = ?auto_44139 ?auto_44140 ) ) ( not ( = ?auto_44143 ?auto_44139 ) ) ( not ( = ?auto_44143 ?auto_44140 ) ) ( not ( = ?auto_44142 ?auto_44147 ) ) ( HOIST-AT ?auto_44141 ?auto_44142 ) ( not ( = ?auto_44145 ?auto_44141 ) ) ( AVAILABLE ?auto_44141 ) ( SURFACE-AT ?auto_44140 ?auto_44142 ) ( ON ?auto_44140 ?auto_44144 ) ( CLEAR ?auto_44140 ) ( not ( = ?auto_44139 ?auto_44144 ) ) ( not ( = ?auto_44140 ?auto_44144 ) ) ( not ( = ?auto_44143 ?auto_44144 ) ) ( TRUCK-AT ?auto_44146 ?auto_44147 ) ( SURFACE-AT ?auto_44143 ?auto_44147 ) ( CLEAR ?auto_44143 ) ( LIFTING ?auto_44145 ?auto_44139 ) ( IS-CRATE ?auto_44139 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44143 ?auto_44139 )
      ( MAKE-2CRATE ?auto_44143 ?auto_44139 ?auto_44140 )
      ( MAKE-1CRATE-VERIFY ?auto_44139 ?auto_44140 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44148 - SURFACE
      ?auto_44149 - SURFACE
      ?auto_44150 - SURFACE
    )
    :vars
    (
      ?auto_44154 - HOIST
      ?auto_44152 - PLACE
      ?auto_44151 - PLACE
      ?auto_44156 - HOIST
      ?auto_44155 - SURFACE
      ?auto_44153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44154 ?auto_44152 ) ( IS-CRATE ?auto_44150 ) ( not ( = ?auto_44149 ?auto_44150 ) ) ( not ( = ?auto_44148 ?auto_44149 ) ) ( not ( = ?auto_44148 ?auto_44150 ) ) ( not ( = ?auto_44151 ?auto_44152 ) ) ( HOIST-AT ?auto_44156 ?auto_44151 ) ( not ( = ?auto_44154 ?auto_44156 ) ) ( AVAILABLE ?auto_44156 ) ( SURFACE-AT ?auto_44150 ?auto_44151 ) ( ON ?auto_44150 ?auto_44155 ) ( CLEAR ?auto_44150 ) ( not ( = ?auto_44149 ?auto_44155 ) ) ( not ( = ?auto_44150 ?auto_44155 ) ) ( not ( = ?auto_44148 ?auto_44155 ) ) ( TRUCK-AT ?auto_44153 ?auto_44152 ) ( SURFACE-AT ?auto_44148 ?auto_44152 ) ( CLEAR ?auto_44148 ) ( LIFTING ?auto_44154 ?auto_44149 ) ( IS-CRATE ?auto_44149 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44149 ?auto_44150 )
      ( MAKE-2CRATE-VERIFY ?auto_44148 ?auto_44149 ?auto_44150 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44157 - SURFACE
      ?auto_44158 - SURFACE
    )
    :vars
    (
      ?auto_44163 - HOIST
      ?auto_44164 - PLACE
      ?auto_44160 - SURFACE
      ?auto_44165 - PLACE
      ?auto_44159 - HOIST
      ?auto_44161 - SURFACE
      ?auto_44162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44163 ?auto_44164 ) ( IS-CRATE ?auto_44158 ) ( not ( = ?auto_44157 ?auto_44158 ) ) ( not ( = ?auto_44160 ?auto_44157 ) ) ( not ( = ?auto_44160 ?auto_44158 ) ) ( not ( = ?auto_44165 ?auto_44164 ) ) ( HOIST-AT ?auto_44159 ?auto_44165 ) ( not ( = ?auto_44163 ?auto_44159 ) ) ( AVAILABLE ?auto_44159 ) ( SURFACE-AT ?auto_44158 ?auto_44165 ) ( ON ?auto_44158 ?auto_44161 ) ( CLEAR ?auto_44158 ) ( not ( = ?auto_44157 ?auto_44161 ) ) ( not ( = ?auto_44158 ?auto_44161 ) ) ( not ( = ?auto_44160 ?auto_44161 ) ) ( TRUCK-AT ?auto_44162 ?auto_44164 ) ( SURFACE-AT ?auto_44160 ?auto_44164 ) ( CLEAR ?auto_44160 ) ( IS-CRATE ?auto_44157 ) ( AVAILABLE ?auto_44163 ) ( IN ?auto_44157 ?auto_44162 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44163 ?auto_44157 ?auto_44162 ?auto_44164 )
      ( MAKE-2CRATE ?auto_44160 ?auto_44157 ?auto_44158 )
      ( MAKE-1CRATE-VERIFY ?auto_44157 ?auto_44158 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44166 - SURFACE
      ?auto_44167 - SURFACE
      ?auto_44168 - SURFACE
    )
    :vars
    (
      ?auto_44173 - HOIST
      ?auto_44169 - PLACE
      ?auto_44171 - PLACE
      ?auto_44172 - HOIST
      ?auto_44174 - SURFACE
      ?auto_44170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44173 ?auto_44169 ) ( IS-CRATE ?auto_44168 ) ( not ( = ?auto_44167 ?auto_44168 ) ) ( not ( = ?auto_44166 ?auto_44167 ) ) ( not ( = ?auto_44166 ?auto_44168 ) ) ( not ( = ?auto_44171 ?auto_44169 ) ) ( HOIST-AT ?auto_44172 ?auto_44171 ) ( not ( = ?auto_44173 ?auto_44172 ) ) ( AVAILABLE ?auto_44172 ) ( SURFACE-AT ?auto_44168 ?auto_44171 ) ( ON ?auto_44168 ?auto_44174 ) ( CLEAR ?auto_44168 ) ( not ( = ?auto_44167 ?auto_44174 ) ) ( not ( = ?auto_44168 ?auto_44174 ) ) ( not ( = ?auto_44166 ?auto_44174 ) ) ( TRUCK-AT ?auto_44170 ?auto_44169 ) ( SURFACE-AT ?auto_44166 ?auto_44169 ) ( CLEAR ?auto_44166 ) ( IS-CRATE ?auto_44167 ) ( AVAILABLE ?auto_44173 ) ( IN ?auto_44167 ?auto_44170 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44167 ?auto_44168 )
      ( MAKE-2CRATE-VERIFY ?auto_44166 ?auto_44167 ?auto_44168 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44211 - SURFACE
      ?auto_44212 - SURFACE
    )
    :vars
    (
      ?auto_44217 - HOIST
      ?auto_44215 - PLACE
      ?auto_44214 - SURFACE
      ?auto_44216 - PLACE
      ?auto_44218 - HOIST
      ?auto_44219 - SURFACE
      ?auto_44213 - TRUCK
      ?auto_44220 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44217 ?auto_44215 ) ( SURFACE-AT ?auto_44211 ?auto_44215 ) ( CLEAR ?auto_44211 ) ( IS-CRATE ?auto_44212 ) ( not ( = ?auto_44211 ?auto_44212 ) ) ( AVAILABLE ?auto_44217 ) ( ON ?auto_44211 ?auto_44214 ) ( not ( = ?auto_44214 ?auto_44211 ) ) ( not ( = ?auto_44214 ?auto_44212 ) ) ( not ( = ?auto_44216 ?auto_44215 ) ) ( HOIST-AT ?auto_44218 ?auto_44216 ) ( not ( = ?auto_44217 ?auto_44218 ) ) ( AVAILABLE ?auto_44218 ) ( SURFACE-AT ?auto_44212 ?auto_44216 ) ( ON ?auto_44212 ?auto_44219 ) ( CLEAR ?auto_44212 ) ( not ( = ?auto_44211 ?auto_44219 ) ) ( not ( = ?auto_44212 ?auto_44219 ) ) ( not ( = ?auto_44214 ?auto_44219 ) ) ( TRUCK-AT ?auto_44213 ?auto_44220 ) ( not ( = ?auto_44220 ?auto_44215 ) ) ( not ( = ?auto_44216 ?auto_44220 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44213 ?auto_44220 ?auto_44215 )
      ( MAKE-1CRATE ?auto_44211 ?auto_44212 )
      ( MAKE-1CRATE-VERIFY ?auto_44211 ?auto_44212 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44250 - SURFACE
      ?auto_44251 - SURFACE
      ?auto_44252 - SURFACE
      ?auto_44253 - SURFACE
    )
    :vars
    (
      ?auto_44254 - HOIST
      ?auto_44255 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44254 ?auto_44255 ) ( SURFACE-AT ?auto_44252 ?auto_44255 ) ( CLEAR ?auto_44252 ) ( LIFTING ?auto_44254 ?auto_44253 ) ( IS-CRATE ?auto_44253 ) ( not ( = ?auto_44252 ?auto_44253 ) ) ( ON ?auto_44251 ?auto_44250 ) ( ON ?auto_44252 ?auto_44251 ) ( not ( = ?auto_44250 ?auto_44251 ) ) ( not ( = ?auto_44250 ?auto_44252 ) ) ( not ( = ?auto_44250 ?auto_44253 ) ) ( not ( = ?auto_44251 ?auto_44252 ) ) ( not ( = ?auto_44251 ?auto_44253 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44252 ?auto_44253 )
      ( MAKE-3CRATE-VERIFY ?auto_44250 ?auto_44251 ?auto_44252 ?auto_44253 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44267 - SURFACE
      ?auto_44268 - SURFACE
      ?auto_44269 - SURFACE
      ?auto_44270 - SURFACE
    )
    :vars
    (
      ?auto_44271 - HOIST
      ?auto_44273 - PLACE
      ?auto_44272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44271 ?auto_44273 ) ( SURFACE-AT ?auto_44269 ?auto_44273 ) ( CLEAR ?auto_44269 ) ( IS-CRATE ?auto_44270 ) ( not ( = ?auto_44269 ?auto_44270 ) ) ( TRUCK-AT ?auto_44272 ?auto_44273 ) ( AVAILABLE ?auto_44271 ) ( IN ?auto_44270 ?auto_44272 ) ( ON ?auto_44269 ?auto_44268 ) ( not ( = ?auto_44268 ?auto_44269 ) ) ( not ( = ?auto_44268 ?auto_44270 ) ) ( ON ?auto_44268 ?auto_44267 ) ( not ( = ?auto_44267 ?auto_44268 ) ) ( not ( = ?auto_44267 ?auto_44269 ) ) ( not ( = ?auto_44267 ?auto_44270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44268 ?auto_44269 ?auto_44270 )
      ( MAKE-3CRATE-VERIFY ?auto_44267 ?auto_44268 ?auto_44269 ?auto_44270 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44288 - SURFACE
      ?auto_44289 - SURFACE
      ?auto_44290 - SURFACE
      ?auto_44291 - SURFACE
    )
    :vars
    (
      ?auto_44292 - HOIST
      ?auto_44294 - PLACE
      ?auto_44293 - TRUCK
      ?auto_44295 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44292 ?auto_44294 ) ( SURFACE-AT ?auto_44290 ?auto_44294 ) ( CLEAR ?auto_44290 ) ( IS-CRATE ?auto_44291 ) ( not ( = ?auto_44290 ?auto_44291 ) ) ( AVAILABLE ?auto_44292 ) ( IN ?auto_44291 ?auto_44293 ) ( ON ?auto_44290 ?auto_44289 ) ( not ( = ?auto_44289 ?auto_44290 ) ) ( not ( = ?auto_44289 ?auto_44291 ) ) ( TRUCK-AT ?auto_44293 ?auto_44295 ) ( not ( = ?auto_44295 ?auto_44294 ) ) ( ON ?auto_44289 ?auto_44288 ) ( not ( = ?auto_44288 ?auto_44289 ) ) ( not ( = ?auto_44288 ?auto_44290 ) ) ( not ( = ?auto_44288 ?auto_44291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44289 ?auto_44290 ?auto_44291 )
      ( MAKE-3CRATE-VERIFY ?auto_44288 ?auto_44289 ?auto_44290 ?auto_44291 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44312 - SURFACE
      ?auto_44313 - SURFACE
      ?auto_44314 - SURFACE
      ?auto_44315 - SURFACE
    )
    :vars
    (
      ?auto_44316 - HOIST
      ?auto_44319 - PLACE
      ?auto_44320 - TRUCK
      ?auto_44318 - PLACE
      ?auto_44317 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44316 ?auto_44319 ) ( SURFACE-AT ?auto_44314 ?auto_44319 ) ( CLEAR ?auto_44314 ) ( IS-CRATE ?auto_44315 ) ( not ( = ?auto_44314 ?auto_44315 ) ) ( AVAILABLE ?auto_44316 ) ( ON ?auto_44314 ?auto_44313 ) ( not ( = ?auto_44313 ?auto_44314 ) ) ( not ( = ?auto_44313 ?auto_44315 ) ) ( TRUCK-AT ?auto_44320 ?auto_44318 ) ( not ( = ?auto_44318 ?auto_44319 ) ) ( HOIST-AT ?auto_44317 ?auto_44318 ) ( LIFTING ?auto_44317 ?auto_44315 ) ( not ( = ?auto_44316 ?auto_44317 ) ) ( ON ?auto_44313 ?auto_44312 ) ( not ( = ?auto_44312 ?auto_44313 ) ) ( not ( = ?auto_44312 ?auto_44314 ) ) ( not ( = ?auto_44312 ?auto_44315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44313 ?auto_44314 ?auto_44315 )
      ( MAKE-3CRATE-VERIFY ?auto_44312 ?auto_44313 ?auto_44314 ?auto_44315 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44339 - SURFACE
      ?auto_44340 - SURFACE
      ?auto_44341 - SURFACE
      ?auto_44342 - SURFACE
    )
    :vars
    (
      ?auto_44345 - HOIST
      ?auto_44346 - PLACE
      ?auto_44344 - TRUCK
      ?auto_44343 - PLACE
      ?auto_44348 - HOIST
      ?auto_44347 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44345 ?auto_44346 ) ( SURFACE-AT ?auto_44341 ?auto_44346 ) ( CLEAR ?auto_44341 ) ( IS-CRATE ?auto_44342 ) ( not ( = ?auto_44341 ?auto_44342 ) ) ( AVAILABLE ?auto_44345 ) ( ON ?auto_44341 ?auto_44340 ) ( not ( = ?auto_44340 ?auto_44341 ) ) ( not ( = ?auto_44340 ?auto_44342 ) ) ( TRUCK-AT ?auto_44344 ?auto_44343 ) ( not ( = ?auto_44343 ?auto_44346 ) ) ( HOIST-AT ?auto_44348 ?auto_44343 ) ( not ( = ?auto_44345 ?auto_44348 ) ) ( AVAILABLE ?auto_44348 ) ( SURFACE-AT ?auto_44342 ?auto_44343 ) ( ON ?auto_44342 ?auto_44347 ) ( CLEAR ?auto_44342 ) ( not ( = ?auto_44341 ?auto_44347 ) ) ( not ( = ?auto_44342 ?auto_44347 ) ) ( not ( = ?auto_44340 ?auto_44347 ) ) ( ON ?auto_44340 ?auto_44339 ) ( not ( = ?auto_44339 ?auto_44340 ) ) ( not ( = ?auto_44339 ?auto_44341 ) ) ( not ( = ?auto_44339 ?auto_44342 ) ) ( not ( = ?auto_44339 ?auto_44347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44340 ?auto_44341 ?auto_44342 )
      ( MAKE-3CRATE-VERIFY ?auto_44339 ?auto_44340 ?auto_44341 ?auto_44342 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44367 - SURFACE
      ?auto_44368 - SURFACE
      ?auto_44369 - SURFACE
      ?auto_44370 - SURFACE
    )
    :vars
    (
      ?auto_44373 - HOIST
      ?auto_44375 - PLACE
      ?auto_44374 - PLACE
      ?auto_44371 - HOIST
      ?auto_44372 - SURFACE
      ?auto_44376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44373 ?auto_44375 ) ( SURFACE-AT ?auto_44369 ?auto_44375 ) ( CLEAR ?auto_44369 ) ( IS-CRATE ?auto_44370 ) ( not ( = ?auto_44369 ?auto_44370 ) ) ( AVAILABLE ?auto_44373 ) ( ON ?auto_44369 ?auto_44368 ) ( not ( = ?auto_44368 ?auto_44369 ) ) ( not ( = ?auto_44368 ?auto_44370 ) ) ( not ( = ?auto_44374 ?auto_44375 ) ) ( HOIST-AT ?auto_44371 ?auto_44374 ) ( not ( = ?auto_44373 ?auto_44371 ) ) ( AVAILABLE ?auto_44371 ) ( SURFACE-AT ?auto_44370 ?auto_44374 ) ( ON ?auto_44370 ?auto_44372 ) ( CLEAR ?auto_44370 ) ( not ( = ?auto_44369 ?auto_44372 ) ) ( not ( = ?auto_44370 ?auto_44372 ) ) ( not ( = ?auto_44368 ?auto_44372 ) ) ( TRUCK-AT ?auto_44376 ?auto_44375 ) ( ON ?auto_44368 ?auto_44367 ) ( not ( = ?auto_44367 ?auto_44368 ) ) ( not ( = ?auto_44367 ?auto_44369 ) ) ( not ( = ?auto_44367 ?auto_44370 ) ) ( not ( = ?auto_44367 ?auto_44372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44368 ?auto_44369 ?auto_44370 )
      ( MAKE-3CRATE-VERIFY ?auto_44367 ?auto_44368 ?auto_44369 ?auto_44370 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44395 - SURFACE
      ?auto_44396 - SURFACE
      ?auto_44397 - SURFACE
      ?auto_44398 - SURFACE
    )
    :vars
    (
      ?auto_44399 - HOIST
      ?auto_44400 - PLACE
      ?auto_44403 - PLACE
      ?auto_44404 - HOIST
      ?auto_44401 - SURFACE
      ?auto_44402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44399 ?auto_44400 ) ( IS-CRATE ?auto_44398 ) ( not ( = ?auto_44397 ?auto_44398 ) ) ( not ( = ?auto_44396 ?auto_44397 ) ) ( not ( = ?auto_44396 ?auto_44398 ) ) ( not ( = ?auto_44403 ?auto_44400 ) ) ( HOIST-AT ?auto_44404 ?auto_44403 ) ( not ( = ?auto_44399 ?auto_44404 ) ) ( AVAILABLE ?auto_44404 ) ( SURFACE-AT ?auto_44398 ?auto_44403 ) ( ON ?auto_44398 ?auto_44401 ) ( CLEAR ?auto_44398 ) ( not ( = ?auto_44397 ?auto_44401 ) ) ( not ( = ?auto_44398 ?auto_44401 ) ) ( not ( = ?auto_44396 ?auto_44401 ) ) ( TRUCK-AT ?auto_44402 ?auto_44400 ) ( SURFACE-AT ?auto_44396 ?auto_44400 ) ( CLEAR ?auto_44396 ) ( LIFTING ?auto_44399 ?auto_44397 ) ( IS-CRATE ?auto_44397 ) ( ON ?auto_44396 ?auto_44395 ) ( not ( = ?auto_44395 ?auto_44396 ) ) ( not ( = ?auto_44395 ?auto_44397 ) ) ( not ( = ?auto_44395 ?auto_44398 ) ) ( not ( = ?auto_44395 ?auto_44401 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44396 ?auto_44397 ?auto_44398 )
      ( MAKE-3CRATE-VERIFY ?auto_44395 ?auto_44396 ?auto_44397 ?auto_44398 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44423 - SURFACE
      ?auto_44424 - SURFACE
      ?auto_44425 - SURFACE
      ?auto_44426 - SURFACE
    )
    :vars
    (
      ?auto_44427 - HOIST
      ?auto_44431 - PLACE
      ?auto_44430 - PLACE
      ?auto_44432 - HOIST
      ?auto_44429 - SURFACE
      ?auto_44428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44427 ?auto_44431 ) ( IS-CRATE ?auto_44426 ) ( not ( = ?auto_44425 ?auto_44426 ) ) ( not ( = ?auto_44424 ?auto_44425 ) ) ( not ( = ?auto_44424 ?auto_44426 ) ) ( not ( = ?auto_44430 ?auto_44431 ) ) ( HOIST-AT ?auto_44432 ?auto_44430 ) ( not ( = ?auto_44427 ?auto_44432 ) ) ( AVAILABLE ?auto_44432 ) ( SURFACE-AT ?auto_44426 ?auto_44430 ) ( ON ?auto_44426 ?auto_44429 ) ( CLEAR ?auto_44426 ) ( not ( = ?auto_44425 ?auto_44429 ) ) ( not ( = ?auto_44426 ?auto_44429 ) ) ( not ( = ?auto_44424 ?auto_44429 ) ) ( TRUCK-AT ?auto_44428 ?auto_44431 ) ( SURFACE-AT ?auto_44424 ?auto_44431 ) ( CLEAR ?auto_44424 ) ( IS-CRATE ?auto_44425 ) ( AVAILABLE ?auto_44427 ) ( IN ?auto_44425 ?auto_44428 ) ( ON ?auto_44424 ?auto_44423 ) ( not ( = ?auto_44423 ?auto_44424 ) ) ( not ( = ?auto_44423 ?auto_44425 ) ) ( not ( = ?auto_44423 ?auto_44426 ) ) ( not ( = ?auto_44423 ?auto_44429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44424 ?auto_44425 ?auto_44426 )
      ( MAKE-3CRATE-VERIFY ?auto_44423 ?auto_44424 ?auto_44425 ?auto_44426 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44714 - SURFACE
      ?auto_44715 - SURFACE
      ?auto_44716 - SURFACE
      ?auto_44718 - SURFACE
      ?auto_44717 - SURFACE
    )
    :vars
    (
      ?auto_44720 - HOIST
      ?auto_44719 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44720 ?auto_44719 ) ( SURFACE-AT ?auto_44718 ?auto_44719 ) ( CLEAR ?auto_44718 ) ( LIFTING ?auto_44720 ?auto_44717 ) ( IS-CRATE ?auto_44717 ) ( not ( = ?auto_44718 ?auto_44717 ) ) ( ON ?auto_44715 ?auto_44714 ) ( ON ?auto_44716 ?auto_44715 ) ( ON ?auto_44718 ?auto_44716 ) ( not ( = ?auto_44714 ?auto_44715 ) ) ( not ( = ?auto_44714 ?auto_44716 ) ) ( not ( = ?auto_44714 ?auto_44718 ) ) ( not ( = ?auto_44714 ?auto_44717 ) ) ( not ( = ?auto_44715 ?auto_44716 ) ) ( not ( = ?auto_44715 ?auto_44718 ) ) ( not ( = ?auto_44715 ?auto_44717 ) ) ( not ( = ?auto_44716 ?auto_44718 ) ) ( not ( = ?auto_44716 ?auto_44717 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44718 ?auto_44717 )
      ( MAKE-4CRATE-VERIFY ?auto_44714 ?auto_44715 ?auto_44716 ?auto_44718 ?auto_44717 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44739 - SURFACE
      ?auto_44740 - SURFACE
      ?auto_44741 - SURFACE
      ?auto_44743 - SURFACE
      ?auto_44742 - SURFACE
    )
    :vars
    (
      ?auto_44745 - HOIST
      ?auto_44744 - PLACE
      ?auto_44746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44745 ?auto_44744 ) ( SURFACE-AT ?auto_44743 ?auto_44744 ) ( CLEAR ?auto_44743 ) ( IS-CRATE ?auto_44742 ) ( not ( = ?auto_44743 ?auto_44742 ) ) ( TRUCK-AT ?auto_44746 ?auto_44744 ) ( AVAILABLE ?auto_44745 ) ( IN ?auto_44742 ?auto_44746 ) ( ON ?auto_44743 ?auto_44741 ) ( not ( = ?auto_44741 ?auto_44743 ) ) ( not ( = ?auto_44741 ?auto_44742 ) ) ( ON ?auto_44740 ?auto_44739 ) ( ON ?auto_44741 ?auto_44740 ) ( not ( = ?auto_44739 ?auto_44740 ) ) ( not ( = ?auto_44739 ?auto_44741 ) ) ( not ( = ?auto_44739 ?auto_44743 ) ) ( not ( = ?auto_44739 ?auto_44742 ) ) ( not ( = ?auto_44740 ?auto_44741 ) ) ( not ( = ?auto_44740 ?auto_44743 ) ) ( not ( = ?auto_44740 ?auto_44742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44741 ?auto_44743 ?auto_44742 )
      ( MAKE-4CRATE-VERIFY ?auto_44739 ?auto_44740 ?auto_44741 ?auto_44743 ?auto_44742 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44769 - SURFACE
      ?auto_44770 - SURFACE
      ?auto_44771 - SURFACE
      ?auto_44773 - SURFACE
      ?auto_44772 - SURFACE
    )
    :vars
    (
      ?auto_44774 - HOIST
      ?auto_44777 - PLACE
      ?auto_44775 - TRUCK
      ?auto_44776 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44774 ?auto_44777 ) ( SURFACE-AT ?auto_44773 ?auto_44777 ) ( CLEAR ?auto_44773 ) ( IS-CRATE ?auto_44772 ) ( not ( = ?auto_44773 ?auto_44772 ) ) ( AVAILABLE ?auto_44774 ) ( IN ?auto_44772 ?auto_44775 ) ( ON ?auto_44773 ?auto_44771 ) ( not ( = ?auto_44771 ?auto_44773 ) ) ( not ( = ?auto_44771 ?auto_44772 ) ) ( TRUCK-AT ?auto_44775 ?auto_44776 ) ( not ( = ?auto_44776 ?auto_44777 ) ) ( ON ?auto_44770 ?auto_44769 ) ( ON ?auto_44771 ?auto_44770 ) ( not ( = ?auto_44769 ?auto_44770 ) ) ( not ( = ?auto_44769 ?auto_44771 ) ) ( not ( = ?auto_44769 ?auto_44773 ) ) ( not ( = ?auto_44769 ?auto_44772 ) ) ( not ( = ?auto_44770 ?auto_44771 ) ) ( not ( = ?auto_44770 ?auto_44773 ) ) ( not ( = ?auto_44770 ?auto_44772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44771 ?auto_44773 ?auto_44772 )
      ( MAKE-4CRATE-VERIFY ?auto_44769 ?auto_44770 ?auto_44771 ?auto_44773 ?auto_44772 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44803 - SURFACE
      ?auto_44804 - SURFACE
      ?auto_44805 - SURFACE
      ?auto_44807 - SURFACE
      ?auto_44806 - SURFACE
    )
    :vars
    (
      ?auto_44808 - HOIST
      ?auto_44812 - PLACE
      ?auto_44809 - TRUCK
      ?auto_44810 - PLACE
      ?auto_44811 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44808 ?auto_44812 ) ( SURFACE-AT ?auto_44807 ?auto_44812 ) ( CLEAR ?auto_44807 ) ( IS-CRATE ?auto_44806 ) ( not ( = ?auto_44807 ?auto_44806 ) ) ( AVAILABLE ?auto_44808 ) ( ON ?auto_44807 ?auto_44805 ) ( not ( = ?auto_44805 ?auto_44807 ) ) ( not ( = ?auto_44805 ?auto_44806 ) ) ( TRUCK-AT ?auto_44809 ?auto_44810 ) ( not ( = ?auto_44810 ?auto_44812 ) ) ( HOIST-AT ?auto_44811 ?auto_44810 ) ( LIFTING ?auto_44811 ?auto_44806 ) ( not ( = ?auto_44808 ?auto_44811 ) ) ( ON ?auto_44804 ?auto_44803 ) ( ON ?auto_44805 ?auto_44804 ) ( not ( = ?auto_44803 ?auto_44804 ) ) ( not ( = ?auto_44803 ?auto_44805 ) ) ( not ( = ?auto_44803 ?auto_44807 ) ) ( not ( = ?auto_44803 ?auto_44806 ) ) ( not ( = ?auto_44804 ?auto_44805 ) ) ( not ( = ?auto_44804 ?auto_44807 ) ) ( not ( = ?auto_44804 ?auto_44806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44805 ?auto_44807 ?auto_44806 )
      ( MAKE-4CRATE-VERIFY ?auto_44803 ?auto_44804 ?auto_44805 ?auto_44807 ?auto_44806 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44841 - SURFACE
      ?auto_44842 - SURFACE
      ?auto_44843 - SURFACE
      ?auto_44845 - SURFACE
      ?auto_44844 - SURFACE
    )
    :vars
    (
      ?auto_44849 - HOIST
      ?auto_44851 - PLACE
      ?auto_44848 - TRUCK
      ?auto_44847 - PLACE
      ?auto_44846 - HOIST
      ?auto_44850 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44849 ?auto_44851 ) ( SURFACE-AT ?auto_44845 ?auto_44851 ) ( CLEAR ?auto_44845 ) ( IS-CRATE ?auto_44844 ) ( not ( = ?auto_44845 ?auto_44844 ) ) ( AVAILABLE ?auto_44849 ) ( ON ?auto_44845 ?auto_44843 ) ( not ( = ?auto_44843 ?auto_44845 ) ) ( not ( = ?auto_44843 ?auto_44844 ) ) ( TRUCK-AT ?auto_44848 ?auto_44847 ) ( not ( = ?auto_44847 ?auto_44851 ) ) ( HOIST-AT ?auto_44846 ?auto_44847 ) ( not ( = ?auto_44849 ?auto_44846 ) ) ( AVAILABLE ?auto_44846 ) ( SURFACE-AT ?auto_44844 ?auto_44847 ) ( ON ?auto_44844 ?auto_44850 ) ( CLEAR ?auto_44844 ) ( not ( = ?auto_44845 ?auto_44850 ) ) ( not ( = ?auto_44844 ?auto_44850 ) ) ( not ( = ?auto_44843 ?auto_44850 ) ) ( ON ?auto_44842 ?auto_44841 ) ( ON ?auto_44843 ?auto_44842 ) ( not ( = ?auto_44841 ?auto_44842 ) ) ( not ( = ?auto_44841 ?auto_44843 ) ) ( not ( = ?auto_44841 ?auto_44845 ) ) ( not ( = ?auto_44841 ?auto_44844 ) ) ( not ( = ?auto_44841 ?auto_44850 ) ) ( not ( = ?auto_44842 ?auto_44843 ) ) ( not ( = ?auto_44842 ?auto_44845 ) ) ( not ( = ?auto_44842 ?auto_44844 ) ) ( not ( = ?auto_44842 ?auto_44850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44843 ?auto_44845 ?auto_44844 )
      ( MAKE-4CRATE-VERIFY ?auto_44841 ?auto_44842 ?auto_44843 ?auto_44845 ?auto_44844 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44880 - SURFACE
      ?auto_44881 - SURFACE
      ?auto_44882 - SURFACE
      ?auto_44884 - SURFACE
      ?auto_44883 - SURFACE
    )
    :vars
    (
      ?auto_44887 - HOIST
      ?auto_44890 - PLACE
      ?auto_44885 - PLACE
      ?auto_44888 - HOIST
      ?auto_44886 - SURFACE
      ?auto_44889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44887 ?auto_44890 ) ( SURFACE-AT ?auto_44884 ?auto_44890 ) ( CLEAR ?auto_44884 ) ( IS-CRATE ?auto_44883 ) ( not ( = ?auto_44884 ?auto_44883 ) ) ( AVAILABLE ?auto_44887 ) ( ON ?auto_44884 ?auto_44882 ) ( not ( = ?auto_44882 ?auto_44884 ) ) ( not ( = ?auto_44882 ?auto_44883 ) ) ( not ( = ?auto_44885 ?auto_44890 ) ) ( HOIST-AT ?auto_44888 ?auto_44885 ) ( not ( = ?auto_44887 ?auto_44888 ) ) ( AVAILABLE ?auto_44888 ) ( SURFACE-AT ?auto_44883 ?auto_44885 ) ( ON ?auto_44883 ?auto_44886 ) ( CLEAR ?auto_44883 ) ( not ( = ?auto_44884 ?auto_44886 ) ) ( not ( = ?auto_44883 ?auto_44886 ) ) ( not ( = ?auto_44882 ?auto_44886 ) ) ( TRUCK-AT ?auto_44889 ?auto_44890 ) ( ON ?auto_44881 ?auto_44880 ) ( ON ?auto_44882 ?auto_44881 ) ( not ( = ?auto_44880 ?auto_44881 ) ) ( not ( = ?auto_44880 ?auto_44882 ) ) ( not ( = ?auto_44880 ?auto_44884 ) ) ( not ( = ?auto_44880 ?auto_44883 ) ) ( not ( = ?auto_44880 ?auto_44886 ) ) ( not ( = ?auto_44881 ?auto_44882 ) ) ( not ( = ?auto_44881 ?auto_44884 ) ) ( not ( = ?auto_44881 ?auto_44883 ) ) ( not ( = ?auto_44881 ?auto_44886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44882 ?auto_44884 ?auto_44883 )
      ( MAKE-4CRATE-VERIFY ?auto_44880 ?auto_44881 ?auto_44882 ?auto_44884 ?auto_44883 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44919 - SURFACE
      ?auto_44920 - SURFACE
      ?auto_44921 - SURFACE
      ?auto_44923 - SURFACE
      ?auto_44922 - SURFACE
    )
    :vars
    (
      ?auto_44929 - HOIST
      ?auto_44927 - PLACE
      ?auto_44924 - PLACE
      ?auto_44925 - HOIST
      ?auto_44928 - SURFACE
      ?auto_44926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44929 ?auto_44927 ) ( IS-CRATE ?auto_44922 ) ( not ( = ?auto_44923 ?auto_44922 ) ) ( not ( = ?auto_44921 ?auto_44923 ) ) ( not ( = ?auto_44921 ?auto_44922 ) ) ( not ( = ?auto_44924 ?auto_44927 ) ) ( HOIST-AT ?auto_44925 ?auto_44924 ) ( not ( = ?auto_44929 ?auto_44925 ) ) ( AVAILABLE ?auto_44925 ) ( SURFACE-AT ?auto_44922 ?auto_44924 ) ( ON ?auto_44922 ?auto_44928 ) ( CLEAR ?auto_44922 ) ( not ( = ?auto_44923 ?auto_44928 ) ) ( not ( = ?auto_44922 ?auto_44928 ) ) ( not ( = ?auto_44921 ?auto_44928 ) ) ( TRUCK-AT ?auto_44926 ?auto_44927 ) ( SURFACE-AT ?auto_44921 ?auto_44927 ) ( CLEAR ?auto_44921 ) ( LIFTING ?auto_44929 ?auto_44923 ) ( IS-CRATE ?auto_44923 ) ( ON ?auto_44920 ?auto_44919 ) ( ON ?auto_44921 ?auto_44920 ) ( not ( = ?auto_44919 ?auto_44920 ) ) ( not ( = ?auto_44919 ?auto_44921 ) ) ( not ( = ?auto_44919 ?auto_44923 ) ) ( not ( = ?auto_44919 ?auto_44922 ) ) ( not ( = ?auto_44919 ?auto_44928 ) ) ( not ( = ?auto_44920 ?auto_44921 ) ) ( not ( = ?auto_44920 ?auto_44923 ) ) ( not ( = ?auto_44920 ?auto_44922 ) ) ( not ( = ?auto_44920 ?auto_44928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44921 ?auto_44923 ?auto_44922 )
      ( MAKE-4CRATE-VERIFY ?auto_44919 ?auto_44920 ?auto_44921 ?auto_44923 ?auto_44922 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44958 - SURFACE
      ?auto_44959 - SURFACE
      ?auto_44960 - SURFACE
      ?auto_44962 - SURFACE
      ?auto_44961 - SURFACE
    )
    :vars
    (
      ?auto_44967 - HOIST
      ?auto_44968 - PLACE
      ?auto_44964 - PLACE
      ?auto_44966 - HOIST
      ?auto_44963 - SURFACE
      ?auto_44965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44967 ?auto_44968 ) ( IS-CRATE ?auto_44961 ) ( not ( = ?auto_44962 ?auto_44961 ) ) ( not ( = ?auto_44960 ?auto_44962 ) ) ( not ( = ?auto_44960 ?auto_44961 ) ) ( not ( = ?auto_44964 ?auto_44968 ) ) ( HOIST-AT ?auto_44966 ?auto_44964 ) ( not ( = ?auto_44967 ?auto_44966 ) ) ( AVAILABLE ?auto_44966 ) ( SURFACE-AT ?auto_44961 ?auto_44964 ) ( ON ?auto_44961 ?auto_44963 ) ( CLEAR ?auto_44961 ) ( not ( = ?auto_44962 ?auto_44963 ) ) ( not ( = ?auto_44961 ?auto_44963 ) ) ( not ( = ?auto_44960 ?auto_44963 ) ) ( TRUCK-AT ?auto_44965 ?auto_44968 ) ( SURFACE-AT ?auto_44960 ?auto_44968 ) ( CLEAR ?auto_44960 ) ( IS-CRATE ?auto_44962 ) ( AVAILABLE ?auto_44967 ) ( IN ?auto_44962 ?auto_44965 ) ( ON ?auto_44959 ?auto_44958 ) ( ON ?auto_44960 ?auto_44959 ) ( not ( = ?auto_44958 ?auto_44959 ) ) ( not ( = ?auto_44958 ?auto_44960 ) ) ( not ( = ?auto_44958 ?auto_44962 ) ) ( not ( = ?auto_44958 ?auto_44961 ) ) ( not ( = ?auto_44958 ?auto_44963 ) ) ( not ( = ?auto_44959 ?auto_44960 ) ) ( not ( = ?auto_44959 ?auto_44962 ) ) ( not ( = ?auto_44959 ?auto_44961 ) ) ( not ( = ?auto_44959 ?auto_44963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44960 ?auto_44962 ?auto_44961 )
      ( MAKE-4CRATE-VERIFY ?auto_44958 ?auto_44959 ?auto_44960 ?auto_44962 ?auto_44961 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45618 - SURFACE
      ?auto_45619 - SURFACE
      ?auto_45620 - SURFACE
      ?auto_45622 - SURFACE
      ?auto_45621 - SURFACE
      ?auto_45623 - SURFACE
    )
    :vars
    (
      ?auto_45624 - HOIST
      ?auto_45625 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45624 ?auto_45625 ) ( SURFACE-AT ?auto_45621 ?auto_45625 ) ( CLEAR ?auto_45621 ) ( LIFTING ?auto_45624 ?auto_45623 ) ( IS-CRATE ?auto_45623 ) ( not ( = ?auto_45621 ?auto_45623 ) ) ( ON ?auto_45619 ?auto_45618 ) ( ON ?auto_45620 ?auto_45619 ) ( ON ?auto_45622 ?auto_45620 ) ( ON ?auto_45621 ?auto_45622 ) ( not ( = ?auto_45618 ?auto_45619 ) ) ( not ( = ?auto_45618 ?auto_45620 ) ) ( not ( = ?auto_45618 ?auto_45622 ) ) ( not ( = ?auto_45618 ?auto_45621 ) ) ( not ( = ?auto_45618 ?auto_45623 ) ) ( not ( = ?auto_45619 ?auto_45620 ) ) ( not ( = ?auto_45619 ?auto_45622 ) ) ( not ( = ?auto_45619 ?auto_45621 ) ) ( not ( = ?auto_45619 ?auto_45623 ) ) ( not ( = ?auto_45620 ?auto_45622 ) ) ( not ( = ?auto_45620 ?auto_45621 ) ) ( not ( = ?auto_45620 ?auto_45623 ) ) ( not ( = ?auto_45622 ?auto_45621 ) ) ( not ( = ?auto_45622 ?auto_45623 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_45621 ?auto_45623 )
      ( MAKE-5CRATE-VERIFY ?auto_45618 ?auto_45619 ?auto_45620 ?auto_45622 ?auto_45621 ?auto_45623 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45652 - SURFACE
      ?auto_45653 - SURFACE
      ?auto_45654 - SURFACE
      ?auto_45656 - SURFACE
      ?auto_45655 - SURFACE
      ?auto_45657 - SURFACE
    )
    :vars
    (
      ?auto_45660 - HOIST
      ?auto_45658 - PLACE
      ?auto_45659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45660 ?auto_45658 ) ( SURFACE-AT ?auto_45655 ?auto_45658 ) ( CLEAR ?auto_45655 ) ( IS-CRATE ?auto_45657 ) ( not ( = ?auto_45655 ?auto_45657 ) ) ( TRUCK-AT ?auto_45659 ?auto_45658 ) ( AVAILABLE ?auto_45660 ) ( IN ?auto_45657 ?auto_45659 ) ( ON ?auto_45655 ?auto_45656 ) ( not ( = ?auto_45656 ?auto_45655 ) ) ( not ( = ?auto_45656 ?auto_45657 ) ) ( ON ?auto_45653 ?auto_45652 ) ( ON ?auto_45654 ?auto_45653 ) ( ON ?auto_45656 ?auto_45654 ) ( not ( = ?auto_45652 ?auto_45653 ) ) ( not ( = ?auto_45652 ?auto_45654 ) ) ( not ( = ?auto_45652 ?auto_45656 ) ) ( not ( = ?auto_45652 ?auto_45655 ) ) ( not ( = ?auto_45652 ?auto_45657 ) ) ( not ( = ?auto_45653 ?auto_45654 ) ) ( not ( = ?auto_45653 ?auto_45656 ) ) ( not ( = ?auto_45653 ?auto_45655 ) ) ( not ( = ?auto_45653 ?auto_45657 ) ) ( not ( = ?auto_45654 ?auto_45656 ) ) ( not ( = ?auto_45654 ?auto_45655 ) ) ( not ( = ?auto_45654 ?auto_45657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45656 ?auto_45655 ?auto_45657 )
      ( MAKE-5CRATE-VERIFY ?auto_45652 ?auto_45653 ?auto_45654 ?auto_45656 ?auto_45655 ?auto_45657 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45692 - SURFACE
      ?auto_45693 - SURFACE
      ?auto_45694 - SURFACE
      ?auto_45696 - SURFACE
      ?auto_45695 - SURFACE
      ?auto_45697 - SURFACE
    )
    :vars
    (
      ?auto_45700 - HOIST
      ?auto_45698 - PLACE
      ?auto_45699 - TRUCK
      ?auto_45701 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45700 ?auto_45698 ) ( SURFACE-AT ?auto_45695 ?auto_45698 ) ( CLEAR ?auto_45695 ) ( IS-CRATE ?auto_45697 ) ( not ( = ?auto_45695 ?auto_45697 ) ) ( AVAILABLE ?auto_45700 ) ( IN ?auto_45697 ?auto_45699 ) ( ON ?auto_45695 ?auto_45696 ) ( not ( = ?auto_45696 ?auto_45695 ) ) ( not ( = ?auto_45696 ?auto_45697 ) ) ( TRUCK-AT ?auto_45699 ?auto_45701 ) ( not ( = ?auto_45701 ?auto_45698 ) ) ( ON ?auto_45693 ?auto_45692 ) ( ON ?auto_45694 ?auto_45693 ) ( ON ?auto_45696 ?auto_45694 ) ( not ( = ?auto_45692 ?auto_45693 ) ) ( not ( = ?auto_45692 ?auto_45694 ) ) ( not ( = ?auto_45692 ?auto_45696 ) ) ( not ( = ?auto_45692 ?auto_45695 ) ) ( not ( = ?auto_45692 ?auto_45697 ) ) ( not ( = ?auto_45693 ?auto_45694 ) ) ( not ( = ?auto_45693 ?auto_45696 ) ) ( not ( = ?auto_45693 ?auto_45695 ) ) ( not ( = ?auto_45693 ?auto_45697 ) ) ( not ( = ?auto_45694 ?auto_45696 ) ) ( not ( = ?auto_45694 ?auto_45695 ) ) ( not ( = ?auto_45694 ?auto_45697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45696 ?auto_45695 ?auto_45697 )
      ( MAKE-5CRATE-VERIFY ?auto_45692 ?auto_45693 ?auto_45694 ?auto_45696 ?auto_45695 ?auto_45697 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45737 - SURFACE
      ?auto_45738 - SURFACE
      ?auto_45739 - SURFACE
      ?auto_45741 - SURFACE
      ?auto_45740 - SURFACE
      ?auto_45742 - SURFACE
    )
    :vars
    (
      ?auto_45746 - HOIST
      ?auto_45744 - PLACE
      ?auto_45747 - TRUCK
      ?auto_45745 - PLACE
      ?auto_45743 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_45746 ?auto_45744 ) ( SURFACE-AT ?auto_45740 ?auto_45744 ) ( CLEAR ?auto_45740 ) ( IS-CRATE ?auto_45742 ) ( not ( = ?auto_45740 ?auto_45742 ) ) ( AVAILABLE ?auto_45746 ) ( ON ?auto_45740 ?auto_45741 ) ( not ( = ?auto_45741 ?auto_45740 ) ) ( not ( = ?auto_45741 ?auto_45742 ) ) ( TRUCK-AT ?auto_45747 ?auto_45745 ) ( not ( = ?auto_45745 ?auto_45744 ) ) ( HOIST-AT ?auto_45743 ?auto_45745 ) ( LIFTING ?auto_45743 ?auto_45742 ) ( not ( = ?auto_45746 ?auto_45743 ) ) ( ON ?auto_45738 ?auto_45737 ) ( ON ?auto_45739 ?auto_45738 ) ( ON ?auto_45741 ?auto_45739 ) ( not ( = ?auto_45737 ?auto_45738 ) ) ( not ( = ?auto_45737 ?auto_45739 ) ) ( not ( = ?auto_45737 ?auto_45741 ) ) ( not ( = ?auto_45737 ?auto_45740 ) ) ( not ( = ?auto_45737 ?auto_45742 ) ) ( not ( = ?auto_45738 ?auto_45739 ) ) ( not ( = ?auto_45738 ?auto_45741 ) ) ( not ( = ?auto_45738 ?auto_45740 ) ) ( not ( = ?auto_45738 ?auto_45742 ) ) ( not ( = ?auto_45739 ?auto_45741 ) ) ( not ( = ?auto_45739 ?auto_45740 ) ) ( not ( = ?auto_45739 ?auto_45742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45741 ?auto_45740 ?auto_45742 )
      ( MAKE-5CRATE-VERIFY ?auto_45737 ?auto_45738 ?auto_45739 ?auto_45741 ?auto_45740 ?auto_45742 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45787 - SURFACE
      ?auto_45788 - SURFACE
      ?auto_45789 - SURFACE
      ?auto_45791 - SURFACE
      ?auto_45790 - SURFACE
      ?auto_45792 - SURFACE
    )
    :vars
    (
      ?auto_45793 - HOIST
      ?auto_45795 - PLACE
      ?auto_45794 - TRUCK
      ?auto_45796 - PLACE
      ?auto_45798 - HOIST
      ?auto_45797 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45793 ?auto_45795 ) ( SURFACE-AT ?auto_45790 ?auto_45795 ) ( CLEAR ?auto_45790 ) ( IS-CRATE ?auto_45792 ) ( not ( = ?auto_45790 ?auto_45792 ) ) ( AVAILABLE ?auto_45793 ) ( ON ?auto_45790 ?auto_45791 ) ( not ( = ?auto_45791 ?auto_45790 ) ) ( not ( = ?auto_45791 ?auto_45792 ) ) ( TRUCK-AT ?auto_45794 ?auto_45796 ) ( not ( = ?auto_45796 ?auto_45795 ) ) ( HOIST-AT ?auto_45798 ?auto_45796 ) ( not ( = ?auto_45793 ?auto_45798 ) ) ( AVAILABLE ?auto_45798 ) ( SURFACE-AT ?auto_45792 ?auto_45796 ) ( ON ?auto_45792 ?auto_45797 ) ( CLEAR ?auto_45792 ) ( not ( = ?auto_45790 ?auto_45797 ) ) ( not ( = ?auto_45792 ?auto_45797 ) ) ( not ( = ?auto_45791 ?auto_45797 ) ) ( ON ?auto_45788 ?auto_45787 ) ( ON ?auto_45789 ?auto_45788 ) ( ON ?auto_45791 ?auto_45789 ) ( not ( = ?auto_45787 ?auto_45788 ) ) ( not ( = ?auto_45787 ?auto_45789 ) ) ( not ( = ?auto_45787 ?auto_45791 ) ) ( not ( = ?auto_45787 ?auto_45790 ) ) ( not ( = ?auto_45787 ?auto_45792 ) ) ( not ( = ?auto_45787 ?auto_45797 ) ) ( not ( = ?auto_45788 ?auto_45789 ) ) ( not ( = ?auto_45788 ?auto_45791 ) ) ( not ( = ?auto_45788 ?auto_45790 ) ) ( not ( = ?auto_45788 ?auto_45792 ) ) ( not ( = ?auto_45788 ?auto_45797 ) ) ( not ( = ?auto_45789 ?auto_45791 ) ) ( not ( = ?auto_45789 ?auto_45790 ) ) ( not ( = ?auto_45789 ?auto_45792 ) ) ( not ( = ?auto_45789 ?auto_45797 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45791 ?auto_45790 ?auto_45792 )
      ( MAKE-5CRATE-VERIFY ?auto_45787 ?auto_45788 ?auto_45789 ?auto_45791 ?auto_45790 ?auto_45792 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45838 - SURFACE
      ?auto_45839 - SURFACE
      ?auto_45840 - SURFACE
      ?auto_45842 - SURFACE
      ?auto_45841 - SURFACE
      ?auto_45843 - SURFACE
    )
    :vars
    (
      ?auto_45849 - HOIST
      ?auto_45845 - PLACE
      ?auto_45848 - PLACE
      ?auto_45846 - HOIST
      ?auto_45847 - SURFACE
      ?auto_45844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45849 ?auto_45845 ) ( SURFACE-AT ?auto_45841 ?auto_45845 ) ( CLEAR ?auto_45841 ) ( IS-CRATE ?auto_45843 ) ( not ( = ?auto_45841 ?auto_45843 ) ) ( AVAILABLE ?auto_45849 ) ( ON ?auto_45841 ?auto_45842 ) ( not ( = ?auto_45842 ?auto_45841 ) ) ( not ( = ?auto_45842 ?auto_45843 ) ) ( not ( = ?auto_45848 ?auto_45845 ) ) ( HOIST-AT ?auto_45846 ?auto_45848 ) ( not ( = ?auto_45849 ?auto_45846 ) ) ( AVAILABLE ?auto_45846 ) ( SURFACE-AT ?auto_45843 ?auto_45848 ) ( ON ?auto_45843 ?auto_45847 ) ( CLEAR ?auto_45843 ) ( not ( = ?auto_45841 ?auto_45847 ) ) ( not ( = ?auto_45843 ?auto_45847 ) ) ( not ( = ?auto_45842 ?auto_45847 ) ) ( TRUCK-AT ?auto_45844 ?auto_45845 ) ( ON ?auto_45839 ?auto_45838 ) ( ON ?auto_45840 ?auto_45839 ) ( ON ?auto_45842 ?auto_45840 ) ( not ( = ?auto_45838 ?auto_45839 ) ) ( not ( = ?auto_45838 ?auto_45840 ) ) ( not ( = ?auto_45838 ?auto_45842 ) ) ( not ( = ?auto_45838 ?auto_45841 ) ) ( not ( = ?auto_45838 ?auto_45843 ) ) ( not ( = ?auto_45838 ?auto_45847 ) ) ( not ( = ?auto_45839 ?auto_45840 ) ) ( not ( = ?auto_45839 ?auto_45842 ) ) ( not ( = ?auto_45839 ?auto_45841 ) ) ( not ( = ?auto_45839 ?auto_45843 ) ) ( not ( = ?auto_45839 ?auto_45847 ) ) ( not ( = ?auto_45840 ?auto_45842 ) ) ( not ( = ?auto_45840 ?auto_45841 ) ) ( not ( = ?auto_45840 ?auto_45843 ) ) ( not ( = ?auto_45840 ?auto_45847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45842 ?auto_45841 ?auto_45843 )
      ( MAKE-5CRATE-VERIFY ?auto_45838 ?auto_45839 ?auto_45840 ?auto_45842 ?auto_45841 ?auto_45843 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45889 - SURFACE
      ?auto_45890 - SURFACE
      ?auto_45891 - SURFACE
      ?auto_45893 - SURFACE
      ?auto_45892 - SURFACE
      ?auto_45894 - SURFACE
    )
    :vars
    (
      ?auto_45900 - HOIST
      ?auto_45899 - PLACE
      ?auto_45897 - PLACE
      ?auto_45898 - HOIST
      ?auto_45895 - SURFACE
      ?auto_45896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45900 ?auto_45899 ) ( IS-CRATE ?auto_45894 ) ( not ( = ?auto_45892 ?auto_45894 ) ) ( not ( = ?auto_45893 ?auto_45892 ) ) ( not ( = ?auto_45893 ?auto_45894 ) ) ( not ( = ?auto_45897 ?auto_45899 ) ) ( HOIST-AT ?auto_45898 ?auto_45897 ) ( not ( = ?auto_45900 ?auto_45898 ) ) ( AVAILABLE ?auto_45898 ) ( SURFACE-AT ?auto_45894 ?auto_45897 ) ( ON ?auto_45894 ?auto_45895 ) ( CLEAR ?auto_45894 ) ( not ( = ?auto_45892 ?auto_45895 ) ) ( not ( = ?auto_45894 ?auto_45895 ) ) ( not ( = ?auto_45893 ?auto_45895 ) ) ( TRUCK-AT ?auto_45896 ?auto_45899 ) ( SURFACE-AT ?auto_45893 ?auto_45899 ) ( CLEAR ?auto_45893 ) ( LIFTING ?auto_45900 ?auto_45892 ) ( IS-CRATE ?auto_45892 ) ( ON ?auto_45890 ?auto_45889 ) ( ON ?auto_45891 ?auto_45890 ) ( ON ?auto_45893 ?auto_45891 ) ( not ( = ?auto_45889 ?auto_45890 ) ) ( not ( = ?auto_45889 ?auto_45891 ) ) ( not ( = ?auto_45889 ?auto_45893 ) ) ( not ( = ?auto_45889 ?auto_45892 ) ) ( not ( = ?auto_45889 ?auto_45894 ) ) ( not ( = ?auto_45889 ?auto_45895 ) ) ( not ( = ?auto_45890 ?auto_45891 ) ) ( not ( = ?auto_45890 ?auto_45893 ) ) ( not ( = ?auto_45890 ?auto_45892 ) ) ( not ( = ?auto_45890 ?auto_45894 ) ) ( not ( = ?auto_45890 ?auto_45895 ) ) ( not ( = ?auto_45891 ?auto_45893 ) ) ( not ( = ?auto_45891 ?auto_45892 ) ) ( not ( = ?auto_45891 ?auto_45894 ) ) ( not ( = ?auto_45891 ?auto_45895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45893 ?auto_45892 ?auto_45894 )
      ( MAKE-5CRATE-VERIFY ?auto_45889 ?auto_45890 ?auto_45891 ?auto_45893 ?auto_45892 ?auto_45894 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45940 - SURFACE
      ?auto_45941 - SURFACE
      ?auto_45942 - SURFACE
      ?auto_45944 - SURFACE
      ?auto_45943 - SURFACE
      ?auto_45945 - SURFACE
    )
    :vars
    (
      ?auto_45947 - HOIST
      ?auto_45949 - PLACE
      ?auto_45948 - PLACE
      ?auto_45946 - HOIST
      ?auto_45950 - SURFACE
      ?auto_45951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45947 ?auto_45949 ) ( IS-CRATE ?auto_45945 ) ( not ( = ?auto_45943 ?auto_45945 ) ) ( not ( = ?auto_45944 ?auto_45943 ) ) ( not ( = ?auto_45944 ?auto_45945 ) ) ( not ( = ?auto_45948 ?auto_45949 ) ) ( HOIST-AT ?auto_45946 ?auto_45948 ) ( not ( = ?auto_45947 ?auto_45946 ) ) ( AVAILABLE ?auto_45946 ) ( SURFACE-AT ?auto_45945 ?auto_45948 ) ( ON ?auto_45945 ?auto_45950 ) ( CLEAR ?auto_45945 ) ( not ( = ?auto_45943 ?auto_45950 ) ) ( not ( = ?auto_45945 ?auto_45950 ) ) ( not ( = ?auto_45944 ?auto_45950 ) ) ( TRUCK-AT ?auto_45951 ?auto_45949 ) ( SURFACE-AT ?auto_45944 ?auto_45949 ) ( CLEAR ?auto_45944 ) ( IS-CRATE ?auto_45943 ) ( AVAILABLE ?auto_45947 ) ( IN ?auto_45943 ?auto_45951 ) ( ON ?auto_45941 ?auto_45940 ) ( ON ?auto_45942 ?auto_45941 ) ( ON ?auto_45944 ?auto_45942 ) ( not ( = ?auto_45940 ?auto_45941 ) ) ( not ( = ?auto_45940 ?auto_45942 ) ) ( not ( = ?auto_45940 ?auto_45944 ) ) ( not ( = ?auto_45940 ?auto_45943 ) ) ( not ( = ?auto_45940 ?auto_45945 ) ) ( not ( = ?auto_45940 ?auto_45950 ) ) ( not ( = ?auto_45941 ?auto_45942 ) ) ( not ( = ?auto_45941 ?auto_45944 ) ) ( not ( = ?auto_45941 ?auto_45943 ) ) ( not ( = ?auto_45941 ?auto_45945 ) ) ( not ( = ?auto_45941 ?auto_45950 ) ) ( not ( = ?auto_45942 ?auto_45944 ) ) ( not ( = ?auto_45942 ?auto_45943 ) ) ( not ( = ?auto_45942 ?auto_45945 ) ) ( not ( = ?auto_45942 ?auto_45950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45944 ?auto_45943 ?auto_45945 )
      ( MAKE-5CRATE-VERIFY ?auto_45940 ?auto_45941 ?auto_45942 ?auto_45944 ?auto_45943 ?auto_45945 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47149 - SURFACE
      ?auto_47150 - SURFACE
      ?auto_47151 - SURFACE
      ?auto_47153 - SURFACE
      ?auto_47152 - SURFACE
      ?auto_47154 - SURFACE
      ?auto_47155 - SURFACE
    )
    :vars
    (
      ?auto_47156 - HOIST
      ?auto_47157 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47156 ?auto_47157 ) ( SURFACE-AT ?auto_47154 ?auto_47157 ) ( CLEAR ?auto_47154 ) ( LIFTING ?auto_47156 ?auto_47155 ) ( IS-CRATE ?auto_47155 ) ( not ( = ?auto_47154 ?auto_47155 ) ) ( ON ?auto_47150 ?auto_47149 ) ( ON ?auto_47151 ?auto_47150 ) ( ON ?auto_47153 ?auto_47151 ) ( ON ?auto_47152 ?auto_47153 ) ( ON ?auto_47154 ?auto_47152 ) ( not ( = ?auto_47149 ?auto_47150 ) ) ( not ( = ?auto_47149 ?auto_47151 ) ) ( not ( = ?auto_47149 ?auto_47153 ) ) ( not ( = ?auto_47149 ?auto_47152 ) ) ( not ( = ?auto_47149 ?auto_47154 ) ) ( not ( = ?auto_47149 ?auto_47155 ) ) ( not ( = ?auto_47150 ?auto_47151 ) ) ( not ( = ?auto_47150 ?auto_47153 ) ) ( not ( = ?auto_47150 ?auto_47152 ) ) ( not ( = ?auto_47150 ?auto_47154 ) ) ( not ( = ?auto_47150 ?auto_47155 ) ) ( not ( = ?auto_47151 ?auto_47153 ) ) ( not ( = ?auto_47151 ?auto_47152 ) ) ( not ( = ?auto_47151 ?auto_47154 ) ) ( not ( = ?auto_47151 ?auto_47155 ) ) ( not ( = ?auto_47153 ?auto_47152 ) ) ( not ( = ?auto_47153 ?auto_47154 ) ) ( not ( = ?auto_47153 ?auto_47155 ) ) ( not ( = ?auto_47152 ?auto_47154 ) ) ( not ( = ?auto_47152 ?auto_47155 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_47154 ?auto_47155 )
      ( MAKE-6CRATE-VERIFY ?auto_47149 ?auto_47150 ?auto_47151 ?auto_47153 ?auto_47152 ?auto_47154 ?auto_47155 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47193 - SURFACE
      ?auto_47194 - SURFACE
      ?auto_47195 - SURFACE
      ?auto_47197 - SURFACE
      ?auto_47196 - SURFACE
      ?auto_47198 - SURFACE
      ?auto_47199 - SURFACE
    )
    :vars
    (
      ?auto_47202 - HOIST
      ?auto_47201 - PLACE
      ?auto_47200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47202 ?auto_47201 ) ( SURFACE-AT ?auto_47198 ?auto_47201 ) ( CLEAR ?auto_47198 ) ( IS-CRATE ?auto_47199 ) ( not ( = ?auto_47198 ?auto_47199 ) ) ( TRUCK-AT ?auto_47200 ?auto_47201 ) ( AVAILABLE ?auto_47202 ) ( IN ?auto_47199 ?auto_47200 ) ( ON ?auto_47198 ?auto_47196 ) ( not ( = ?auto_47196 ?auto_47198 ) ) ( not ( = ?auto_47196 ?auto_47199 ) ) ( ON ?auto_47194 ?auto_47193 ) ( ON ?auto_47195 ?auto_47194 ) ( ON ?auto_47197 ?auto_47195 ) ( ON ?auto_47196 ?auto_47197 ) ( not ( = ?auto_47193 ?auto_47194 ) ) ( not ( = ?auto_47193 ?auto_47195 ) ) ( not ( = ?auto_47193 ?auto_47197 ) ) ( not ( = ?auto_47193 ?auto_47196 ) ) ( not ( = ?auto_47193 ?auto_47198 ) ) ( not ( = ?auto_47193 ?auto_47199 ) ) ( not ( = ?auto_47194 ?auto_47195 ) ) ( not ( = ?auto_47194 ?auto_47197 ) ) ( not ( = ?auto_47194 ?auto_47196 ) ) ( not ( = ?auto_47194 ?auto_47198 ) ) ( not ( = ?auto_47194 ?auto_47199 ) ) ( not ( = ?auto_47195 ?auto_47197 ) ) ( not ( = ?auto_47195 ?auto_47196 ) ) ( not ( = ?auto_47195 ?auto_47198 ) ) ( not ( = ?auto_47195 ?auto_47199 ) ) ( not ( = ?auto_47197 ?auto_47196 ) ) ( not ( = ?auto_47197 ?auto_47198 ) ) ( not ( = ?auto_47197 ?auto_47199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47196 ?auto_47198 ?auto_47199 )
      ( MAKE-6CRATE-VERIFY ?auto_47193 ?auto_47194 ?auto_47195 ?auto_47197 ?auto_47196 ?auto_47198 ?auto_47199 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47244 - SURFACE
      ?auto_47245 - SURFACE
      ?auto_47246 - SURFACE
      ?auto_47248 - SURFACE
      ?auto_47247 - SURFACE
      ?auto_47249 - SURFACE
      ?auto_47250 - SURFACE
    )
    :vars
    (
      ?auto_47253 - HOIST
      ?auto_47251 - PLACE
      ?auto_47252 - TRUCK
      ?auto_47254 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47253 ?auto_47251 ) ( SURFACE-AT ?auto_47249 ?auto_47251 ) ( CLEAR ?auto_47249 ) ( IS-CRATE ?auto_47250 ) ( not ( = ?auto_47249 ?auto_47250 ) ) ( AVAILABLE ?auto_47253 ) ( IN ?auto_47250 ?auto_47252 ) ( ON ?auto_47249 ?auto_47247 ) ( not ( = ?auto_47247 ?auto_47249 ) ) ( not ( = ?auto_47247 ?auto_47250 ) ) ( TRUCK-AT ?auto_47252 ?auto_47254 ) ( not ( = ?auto_47254 ?auto_47251 ) ) ( ON ?auto_47245 ?auto_47244 ) ( ON ?auto_47246 ?auto_47245 ) ( ON ?auto_47248 ?auto_47246 ) ( ON ?auto_47247 ?auto_47248 ) ( not ( = ?auto_47244 ?auto_47245 ) ) ( not ( = ?auto_47244 ?auto_47246 ) ) ( not ( = ?auto_47244 ?auto_47248 ) ) ( not ( = ?auto_47244 ?auto_47247 ) ) ( not ( = ?auto_47244 ?auto_47249 ) ) ( not ( = ?auto_47244 ?auto_47250 ) ) ( not ( = ?auto_47245 ?auto_47246 ) ) ( not ( = ?auto_47245 ?auto_47248 ) ) ( not ( = ?auto_47245 ?auto_47247 ) ) ( not ( = ?auto_47245 ?auto_47249 ) ) ( not ( = ?auto_47245 ?auto_47250 ) ) ( not ( = ?auto_47246 ?auto_47248 ) ) ( not ( = ?auto_47246 ?auto_47247 ) ) ( not ( = ?auto_47246 ?auto_47249 ) ) ( not ( = ?auto_47246 ?auto_47250 ) ) ( not ( = ?auto_47248 ?auto_47247 ) ) ( not ( = ?auto_47248 ?auto_47249 ) ) ( not ( = ?auto_47248 ?auto_47250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47247 ?auto_47249 ?auto_47250 )
      ( MAKE-6CRATE-VERIFY ?auto_47244 ?auto_47245 ?auto_47246 ?auto_47248 ?auto_47247 ?auto_47249 ?auto_47250 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47301 - SURFACE
      ?auto_47302 - SURFACE
      ?auto_47303 - SURFACE
      ?auto_47305 - SURFACE
      ?auto_47304 - SURFACE
      ?auto_47306 - SURFACE
      ?auto_47307 - SURFACE
    )
    :vars
    (
      ?auto_47311 - HOIST
      ?auto_47312 - PLACE
      ?auto_47309 - TRUCK
      ?auto_47308 - PLACE
      ?auto_47310 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_47311 ?auto_47312 ) ( SURFACE-AT ?auto_47306 ?auto_47312 ) ( CLEAR ?auto_47306 ) ( IS-CRATE ?auto_47307 ) ( not ( = ?auto_47306 ?auto_47307 ) ) ( AVAILABLE ?auto_47311 ) ( ON ?auto_47306 ?auto_47304 ) ( not ( = ?auto_47304 ?auto_47306 ) ) ( not ( = ?auto_47304 ?auto_47307 ) ) ( TRUCK-AT ?auto_47309 ?auto_47308 ) ( not ( = ?auto_47308 ?auto_47312 ) ) ( HOIST-AT ?auto_47310 ?auto_47308 ) ( LIFTING ?auto_47310 ?auto_47307 ) ( not ( = ?auto_47311 ?auto_47310 ) ) ( ON ?auto_47302 ?auto_47301 ) ( ON ?auto_47303 ?auto_47302 ) ( ON ?auto_47305 ?auto_47303 ) ( ON ?auto_47304 ?auto_47305 ) ( not ( = ?auto_47301 ?auto_47302 ) ) ( not ( = ?auto_47301 ?auto_47303 ) ) ( not ( = ?auto_47301 ?auto_47305 ) ) ( not ( = ?auto_47301 ?auto_47304 ) ) ( not ( = ?auto_47301 ?auto_47306 ) ) ( not ( = ?auto_47301 ?auto_47307 ) ) ( not ( = ?auto_47302 ?auto_47303 ) ) ( not ( = ?auto_47302 ?auto_47305 ) ) ( not ( = ?auto_47302 ?auto_47304 ) ) ( not ( = ?auto_47302 ?auto_47306 ) ) ( not ( = ?auto_47302 ?auto_47307 ) ) ( not ( = ?auto_47303 ?auto_47305 ) ) ( not ( = ?auto_47303 ?auto_47304 ) ) ( not ( = ?auto_47303 ?auto_47306 ) ) ( not ( = ?auto_47303 ?auto_47307 ) ) ( not ( = ?auto_47305 ?auto_47304 ) ) ( not ( = ?auto_47305 ?auto_47306 ) ) ( not ( = ?auto_47305 ?auto_47307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47304 ?auto_47306 ?auto_47307 )
      ( MAKE-6CRATE-VERIFY ?auto_47301 ?auto_47302 ?auto_47303 ?auto_47305 ?auto_47304 ?auto_47306 ?auto_47307 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47364 - SURFACE
      ?auto_47365 - SURFACE
      ?auto_47366 - SURFACE
      ?auto_47368 - SURFACE
      ?auto_47367 - SURFACE
      ?auto_47369 - SURFACE
      ?auto_47370 - SURFACE
    )
    :vars
    (
      ?auto_47371 - HOIST
      ?auto_47375 - PLACE
      ?auto_47373 - TRUCK
      ?auto_47376 - PLACE
      ?auto_47374 - HOIST
      ?auto_47372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47371 ?auto_47375 ) ( SURFACE-AT ?auto_47369 ?auto_47375 ) ( CLEAR ?auto_47369 ) ( IS-CRATE ?auto_47370 ) ( not ( = ?auto_47369 ?auto_47370 ) ) ( AVAILABLE ?auto_47371 ) ( ON ?auto_47369 ?auto_47367 ) ( not ( = ?auto_47367 ?auto_47369 ) ) ( not ( = ?auto_47367 ?auto_47370 ) ) ( TRUCK-AT ?auto_47373 ?auto_47376 ) ( not ( = ?auto_47376 ?auto_47375 ) ) ( HOIST-AT ?auto_47374 ?auto_47376 ) ( not ( = ?auto_47371 ?auto_47374 ) ) ( AVAILABLE ?auto_47374 ) ( SURFACE-AT ?auto_47370 ?auto_47376 ) ( ON ?auto_47370 ?auto_47372 ) ( CLEAR ?auto_47370 ) ( not ( = ?auto_47369 ?auto_47372 ) ) ( not ( = ?auto_47370 ?auto_47372 ) ) ( not ( = ?auto_47367 ?auto_47372 ) ) ( ON ?auto_47365 ?auto_47364 ) ( ON ?auto_47366 ?auto_47365 ) ( ON ?auto_47368 ?auto_47366 ) ( ON ?auto_47367 ?auto_47368 ) ( not ( = ?auto_47364 ?auto_47365 ) ) ( not ( = ?auto_47364 ?auto_47366 ) ) ( not ( = ?auto_47364 ?auto_47368 ) ) ( not ( = ?auto_47364 ?auto_47367 ) ) ( not ( = ?auto_47364 ?auto_47369 ) ) ( not ( = ?auto_47364 ?auto_47370 ) ) ( not ( = ?auto_47364 ?auto_47372 ) ) ( not ( = ?auto_47365 ?auto_47366 ) ) ( not ( = ?auto_47365 ?auto_47368 ) ) ( not ( = ?auto_47365 ?auto_47367 ) ) ( not ( = ?auto_47365 ?auto_47369 ) ) ( not ( = ?auto_47365 ?auto_47370 ) ) ( not ( = ?auto_47365 ?auto_47372 ) ) ( not ( = ?auto_47366 ?auto_47368 ) ) ( not ( = ?auto_47366 ?auto_47367 ) ) ( not ( = ?auto_47366 ?auto_47369 ) ) ( not ( = ?auto_47366 ?auto_47370 ) ) ( not ( = ?auto_47366 ?auto_47372 ) ) ( not ( = ?auto_47368 ?auto_47367 ) ) ( not ( = ?auto_47368 ?auto_47369 ) ) ( not ( = ?auto_47368 ?auto_47370 ) ) ( not ( = ?auto_47368 ?auto_47372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47367 ?auto_47369 ?auto_47370 )
      ( MAKE-6CRATE-VERIFY ?auto_47364 ?auto_47365 ?auto_47366 ?auto_47368 ?auto_47367 ?auto_47369 ?auto_47370 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47428 - SURFACE
      ?auto_47429 - SURFACE
      ?auto_47430 - SURFACE
      ?auto_47432 - SURFACE
      ?auto_47431 - SURFACE
      ?auto_47433 - SURFACE
      ?auto_47434 - SURFACE
    )
    :vars
    (
      ?auto_47439 - HOIST
      ?auto_47438 - PLACE
      ?auto_47436 - PLACE
      ?auto_47440 - HOIST
      ?auto_47435 - SURFACE
      ?auto_47437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47439 ?auto_47438 ) ( SURFACE-AT ?auto_47433 ?auto_47438 ) ( CLEAR ?auto_47433 ) ( IS-CRATE ?auto_47434 ) ( not ( = ?auto_47433 ?auto_47434 ) ) ( AVAILABLE ?auto_47439 ) ( ON ?auto_47433 ?auto_47431 ) ( not ( = ?auto_47431 ?auto_47433 ) ) ( not ( = ?auto_47431 ?auto_47434 ) ) ( not ( = ?auto_47436 ?auto_47438 ) ) ( HOIST-AT ?auto_47440 ?auto_47436 ) ( not ( = ?auto_47439 ?auto_47440 ) ) ( AVAILABLE ?auto_47440 ) ( SURFACE-AT ?auto_47434 ?auto_47436 ) ( ON ?auto_47434 ?auto_47435 ) ( CLEAR ?auto_47434 ) ( not ( = ?auto_47433 ?auto_47435 ) ) ( not ( = ?auto_47434 ?auto_47435 ) ) ( not ( = ?auto_47431 ?auto_47435 ) ) ( TRUCK-AT ?auto_47437 ?auto_47438 ) ( ON ?auto_47429 ?auto_47428 ) ( ON ?auto_47430 ?auto_47429 ) ( ON ?auto_47432 ?auto_47430 ) ( ON ?auto_47431 ?auto_47432 ) ( not ( = ?auto_47428 ?auto_47429 ) ) ( not ( = ?auto_47428 ?auto_47430 ) ) ( not ( = ?auto_47428 ?auto_47432 ) ) ( not ( = ?auto_47428 ?auto_47431 ) ) ( not ( = ?auto_47428 ?auto_47433 ) ) ( not ( = ?auto_47428 ?auto_47434 ) ) ( not ( = ?auto_47428 ?auto_47435 ) ) ( not ( = ?auto_47429 ?auto_47430 ) ) ( not ( = ?auto_47429 ?auto_47432 ) ) ( not ( = ?auto_47429 ?auto_47431 ) ) ( not ( = ?auto_47429 ?auto_47433 ) ) ( not ( = ?auto_47429 ?auto_47434 ) ) ( not ( = ?auto_47429 ?auto_47435 ) ) ( not ( = ?auto_47430 ?auto_47432 ) ) ( not ( = ?auto_47430 ?auto_47431 ) ) ( not ( = ?auto_47430 ?auto_47433 ) ) ( not ( = ?auto_47430 ?auto_47434 ) ) ( not ( = ?auto_47430 ?auto_47435 ) ) ( not ( = ?auto_47432 ?auto_47431 ) ) ( not ( = ?auto_47432 ?auto_47433 ) ) ( not ( = ?auto_47432 ?auto_47434 ) ) ( not ( = ?auto_47432 ?auto_47435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47431 ?auto_47433 ?auto_47434 )
      ( MAKE-6CRATE-VERIFY ?auto_47428 ?auto_47429 ?auto_47430 ?auto_47432 ?auto_47431 ?auto_47433 ?auto_47434 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47492 - SURFACE
      ?auto_47493 - SURFACE
      ?auto_47494 - SURFACE
      ?auto_47496 - SURFACE
      ?auto_47495 - SURFACE
      ?auto_47497 - SURFACE
      ?auto_47498 - SURFACE
    )
    :vars
    (
      ?auto_47501 - HOIST
      ?auto_47502 - PLACE
      ?auto_47504 - PLACE
      ?auto_47503 - HOIST
      ?auto_47500 - SURFACE
      ?auto_47499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47501 ?auto_47502 ) ( IS-CRATE ?auto_47498 ) ( not ( = ?auto_47497 ?auto_47498 ) ) ( not ( = ?auto_47495 ?auto_47497 ) ) ( not ( = ?auto_47495 ?auto_47498 ) ) ( not ( = ?auto_47504 ?auto_47502 ) ) ( HOIST-AT ?auto_47503 ?auto_47504 ) ( not ( = ?auto_47501 ?auto_47503 ) ) ( AVAILABLE ?auto_47503 ) ( SURFACE-AT ?auto_47498 ?auto_47504 ) ( ON ?auto_47498 ?auto_47500 ) ( CLEAR ?auto_47498 ) ( not ( = ?auto_47497 ?auto_47500 ) ) ( not ( = ?auto_47498 ?auto_47500 ) ) ( not ( = ?auto_47495 ?auto_47500 ) ) ( TRUCK-AT ?auto_47499 ?auto_47502 ) ( SURFACE-AT ?auto_47495 ?auto_47502 ) ( CLEAR ?auto_47495 ) ( LIFTING ?auto_47501 ?auto_47497 ) ( IS-CRATE ?auto_47497 ) ( ON ?auto_47493 ?auto_47492 ) ( ON ?auto_47494 ?auto_47493 ) ( ON ?auto_47496 ?auto_47494 ) ( ON ?auto_47495 ?auto_47496 ) ( not ( = ?auto_47492 ?auto_47493 ) ) ( not ( = ?auto_47492 ?auto_47494 ) ) ( not ( = ?auto_47492 ?auto_47496 ) ) ( not ( = ?auto_47492 ?auto_47495 ) ) ( not ( = ?auto_47492 ?auto_47497 ) ) ( not ( = ?auto_47492 ?auto_47498 ) ) ( not ( = ?auto_47492 ?auto_47500 ) ) ( not ( = ?auto_47493 ?auto_47494 ) ) ( not ( = ?auto_47493 ?auto_47496 ) ) ( not ( = ?auto_47493 ?auto_47495 ) ) ( not ( = ?auto_47493 ?auto_47497 ) ) ( not ( = ?auto_47493 ?auto_47498 ) ) ( not ( = ?auto_47493 ?auto_47500 ) ) ( not ( = ?auto_47494 ?auto_47496 ) ) ( not ( = ?auto_47494 ?auto_47495 ) ) ( not ( = ?auto_47494 ?auto_47497 ) ) ( not ( = ?auto_47494 ?auto_47498 ) ) ( not ( = ?auto_47494 ?auto_47500 ) ) ( not ( = ?auto_47496 ?auto_47495 ) ) ( not ( = ?auto_47496 ?auto_47497 ) ) ( not ( = ?auto_47496 ?auto_47498 ) ) ( not ( = ?auto_47496 ?auto_47500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47495 ?auto_47497 ?auto_47498 )
      ( MAKE-6CRATE-VERIFY ?auto_47492 ?auto_47493 ?auto_47494 ?auto_47496 ?auto_47495 ?auto_47497 ?auto_47498 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47556 - SURFACE
      ?auto_47557 - SURFACE
      ?auto_47558 - SURFACE
      ?auto_47560 - SURFACE
      ?auto_47559 - SURFACE
      ?auto_47561 - SURFACE
      ?auto_47562 - SURFACE
    )
    :vars
    (
      ?auto_47564 - HOIST
      ?auto_47565 - PLACE
      ?auto_47568 - PLACE
      ?auto_47566 - HOIST
      ?auto_47567 - SURFACE
      ?auto_47563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47564 ?auto_47565 ) ( IS-CRATE ?auto_47562 ) ( not ( = ?auto_47561 ?auto_47562 ) ) ( not ( = ?auto_47559 ?auto_47561 ) ) ( not ( = ?auto_47559 ?auto_47562 ) ) ( not ( = ?auto_47568 ?auto_47565 ) ) ( HOIST-AT ?auto_47566 ?auto_47568 ) ( not ( = ?auto_47564 ?auto_47566 ) ) ( AVAILABLE ?auto_47566 ) ( SURFACE-AT ?auto_47562 ?auto_47568 ) ( ON ?auto_47562 ?auto_47567 ) ( CLEAR ?auto_47562 ) ( not ( = ?auto_47561 ?auto_47567 ) ) ( not ( = ?auto_47562 ?auto_47567 ) ) ( not ( = ?auto_47559 ?auto_47567 ) ) ( TRUCK-AT ?auto_47563 ?auto_47565 ) ( SURFACE-AT ?auto_47559 ?auto_47565 ) ( CLEAR ?auto_47559 ) ( IS-CRATE ?auto_47561 ) ( AVAILABLE ?auto_47564 ) ( IN ?auto_47561 ?auto_47563 ) ( ON ?auto_47557 ?auto_47556 ) ( ON ?auto_47558 ?auto_47557 ) ( ON ?auto_47560 ?auto_47558 ) ( ON ?auto_47559 ?auto_47560 ) ( not ( = ?auto_47556 ?auto_47557 ) ) ( not ( = ?auto_47556 ?auto_47558 ) ) ( not ( = ?auto_47556 ?auto_47560 ) ) ( not ( = ?auto_47556 ?auto_47559 ) ) ( not ( = ?auto_47556 ?auto_47561 ) ) ( not ( = ?auto_47556 ?auto_47562 ) ) ( not ( = ?auto_47556 ?auto_47567 ) ) ( not ( = ?auto_47557 ?auto_47558 ) ) ( not ( = ?auto_47557 ?auto_47560 ) ) ( not ( = ?auto_47557 ?auto_47559 ) ) ( not ( = ?auto_47557 ?auto_47561 ) ) ( not ( = ?auto_47557 ?auto_47562 ) ) ( not ( = ?auto_47557 ?auto_47567 ) ) ( not ( = ?auto_47558 ?auto_47560 ) ) ( not ( = ?auto_47558 ?auto_47559 ) ) ( not ( = ?auto_47558 ?auto_47561 ) ) ( not ( = ?auto_47558 ?auto_47562 ) ) ( not ( = ?auto_47558 ?auto_47567 ) ) ( not ( = ?auto_47560 ?auto_47559 ) ) ( not ( = ?auto_47560 ?auto_47561 ) ) ( not ( = ?auto_47560 ?auto_47562 ) ) ( not ( = ?auto_47560 ?auto_47567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47559 ?auto_47561 ?auto_47562 )
      ( MAKE-6CRATE-VERIFY ?auto_47556 ?auto_47557 ?auto_47558 ?auto_47560 ?auto_47559 ?auto_47561 ?auto_47562 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_48428 - SURFACE
      ?auto_48429 - SURFACE
    )
    :vars
    (
      ?auto_48433 - HOIST
      ?auto_48431 - PLACE
      ?auto_48436 - SURFACE
      ?auto_48430 - TRUCK
      ?auto_48435 - PLACE
      ?auto_48432 - HOIST
      ?auto_48434 - SURFACE
      ?auto_48437 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48433 ?auto_48431 ) ( SURFACE-AT ?auto_48428 ?auto_48431 ) ( CLEAR ?auto_48428 ) ( IS-CRATE ?auto_48429 ) ( not ( = ?auto_48428 ?auto_48429 ) ) ( AVAILABLE ?auto_48433 ) ( ON ?auto_48428 ?auto_48436 ) ( not ( = ?auto_48436 ?auto_48428 ) ) ( not ( = ?auto_48436 ?auto_48429 ) ) ( TRUCK-AT ?auto_48430 ?auto_48435 ) ( not ( = ?auto_48435 ?auto_48431 ) ) ( HOIST-AT ?auto_48432 ?auto_48435 ) ( not ( = ?auto_48433 ?auto_48432 ) ) ( SURFACE-AT ?auto_48429 ?auto_48435 ) ( ON ?auto_48429 ?auto_48434 ) ( CLEAR ?auto_48429 ) ( not ( = ?auto_48428 ?auto_48434 ) ) ( not ( = ?auto_48429 ?auto_48434 ) ) ( not ( = ?auto_48436 ?auto_48434 ) ) ( LIFTING ?auto_48432 ?auto_48437 ) ( IS-CRATE ?auto_48437 ) ( not ( = ?auto_48428 ?auto_48437 ) ) ( not ( = ?auto_48429 ?auto_48437 ) ) ( not ( = ?auto_48436 ?auto_48437 ) ) ( not ( = ?auto_48434 ?auto_48437 ) ) )
    :subtasks
    ( ( !LOAD ?auto_48432 ?auto_48437 ?auto_48430 ?auto_48435 )
      ( MAKE-1CRATE ?auto_48428 ?auto_48429 )
      ( MAKE-1CRATE-VERIFY ?auto_48428 ?auto_48429 ) )
  )

)

