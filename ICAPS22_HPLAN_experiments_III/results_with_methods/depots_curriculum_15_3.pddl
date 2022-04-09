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
      ?auto_22124 - SURFACE
      ?auto_22125 - SURFACE
    )
    :vars
    (
      ?auto_22126 - HOIST
      ?auto_22127 - PLACE
      ?auto_22129 - PLACE
      ?auto_22130 - HOIST
      ?auto_22131 - SURFACE
      ?auto_22128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22126 ?auto_22127 ) ( SURFACE-AT ?auto_22124 ?auto_22127 ) ( CLEAR ?auto_22124 ) ( IS-CRATE ?auto_22125 ) ( AVAILABLE ?auto_22126 ) ( not ( = ?auto_22129 ?auto_22127 ) ) ( HOIST-AT ?auto_22130 ?auto_22129 ) ( AVAILABLE ?auto_22130 ) ( SURFACE-AT ?auto_22125 ?auto_22129 ) ( ON ?auto_22125 ?auto_22131 ) ( CLEAR ?auto_22125 ) ( TRUCK-AT ?auto_22128 ?auto_22127 ) ( not ( = ?auto_22124 ?auto_22125 ) ) ( not ( = ?auto_22124 ?auto_22131 ) ) ( not ( = ?auto_22125 ?auto_22131 ) ) ( not ( = ?auto_22126 ?auto_22130 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22128 ?auto_22127 ?auto_22129 )
      ( !LIFT ?auto_22130 ?auto_22125 ?auto_22131 ?auto_22129 )
      ( !LOAD ?auto_22130 ?auto_22125 ?auto_22128 ?auto_22129 )
      ( !DRIVE ?auto_22128 ?auto_22129 ?auto_22127 )
      ( !UNLOAD ?auto_22126 ?auto_22125 ?auto_22128 ?auto_22127 )
      ( !DROP ?auto_22126 ?auto_22125 ?auto_22124 ?auto_22127 )
      ( MAKE-1CRATE-VERIFY ?auto_22124 ?auto_22125 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22134 - SURFACE
      ?auto_22135 - SURFACE
    )
    :vars
    (
      ?auto_22136 - HOIST
      ?auto_22137 - PLACE
      ?auto_22139 - PLACE
      ?auto_22140 - HOIST
      ?auto_22141 - SURFACE
      ?auto_22138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22136 ?auto_22137 ) ( SURFACE-AT ?auto_22134 ?auto_22137 ) ( CLEAR ?auto_22134 ) ( IS-CRATE ?auto_22135 ) ( AVAILABLE ?auto_22136 ) ( not ( = ?auto_22139 ?auto_22137 ) ) ( HOIST-AT ?auto_22140 ?auto_22139 ) ( AVAILABLE ?auto_22140 ) ( SURFACE-AT ?auto_22135 ?auto_22139 ) ( ON ?auto_22135 ?auto_22141 ) ( CLEAR ?auto_22135 ) ( TRUCK-AT ?auto_22138 ?auto_22137 ) ( not ( = ?auto_22134 ?auto_22135 ) ) ( not ( = ?auto_22134 ?auto_22141 ) ) ( not ( = ?auto_22135 ?auto_22141 ) ) ( not ( = ?auto_22136 ?auto_22140 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22138 ?auto_22137 ?auto_22139 )
      ( !LIFT ?auto_22140 ?auto_22135 ?auto_22141 ?auto_22139 )
      ( !LOAD ?auto_22140 ?auto_22135 ?auto_22138 ?auto_22139 )
      ( !DRIVE ?auto_22138 ?auto_22139 ?auto_22137 )
      ( !UNLOAD ?auto_22136 ?auto_22135 ?auto_22138 ?auto_22137 )
      ( !DROP ?auto_22136 ?auto_22135 ?auto_22134 ?auto_22137 )
      ( MAKE-1CRATE-VERIFY ?auto_22134 ?auto_22135 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22145 - SURFACE
      ?auto_22146 - SURFACE
      ?auto_22147 - SURFACE
    )
    :vars
    (
      ?auto_22152 - HOIST
      ?auto_22149 - PLACE
      ?auto_22153 - PLACE
      ?auto_22148 - HOIST
      ?auto_22150 - SURFACE
      ?auto_22156 - PLACE
      ?auto_22155 - HOIST
      ?auto_22154 - SURFACE
      ?auto_22151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22152 ?auto_22149 ) ( IS-CRATE ?auto_22147 ) ( not ( = ?auto_22153 ?auto_22149 ) ) ( HOIST-AT ?auto_22148 ?auto_22153 ) ( AVAILABLE ?auto_22148 ) ( SURFACE-AT ?auto_22147 ?auto_22153 ) ( ON ?auto_22147 ?auto_22150 ) ( CLEAR ?auto_22147 ) ( not ( = ?auto_22146 ?auto_22147 ) ) ( not ( = ?auto_22146 ?auto_22150 ) ) ( not ( = ?auto_22147 ?auto_22150 ) ) ( not ( = ?auto_22152 ?auto_22148 ) ) ( SURFACE-AT ?auto_22145 ?auto_22149 ) ( CLEAR ?auto_22145 ) ( IS-CRATE ?auto_22146 ) ( AVAILABLE ?auto_22152 ) ( not ( = ?auto_22156 ?auto_22149 ) ) ( HOIST-AT ?auto_22155 ?auto_22156 ) ( AVAILABLE ?auto_22155 ) ( SURFACE-AT ?auto_22146 ?auto_22156 ) ( ON ?auto_22146 ?auto_22154 ) ( CLEAR ?auto_22146 ) ( TRUCK-AT ?auto_22151 ?auto_22149 ) ( not ( = ?auto_22145 ?auto_22146 ) ) ( not ( = ?auto_22145 ?auto_22154 ) ) ( not ( = ?auto_22146 ?auto_22154 ) ) ( not ( = ?auto_22152 ?auto_22155 ) ) ( not ( = ?auto_22145 ?auto_22147 ) ) ( not ( = ?auto_22145 ?auto_22150 ) ) ( not ( = ?auto_22147 ?auto_22154 ) ) ( not ( = ?auto_22153 ?auto_22156 ) ) ( not ( = ?auto_22148 ?auto_22155 ) ) ( not ( = ?auto_22150 ?auto_22154 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22145 ?auto_22146 )
      ( MAKE-1CRATE ?auto_22146 ?auto_22147 )
      ( MAKE-2CRATE-VERIFY ?auto_22145 ?auto_22146 ?auto_22147 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22159 - SURFACE
      ?auto_22160 - SURFACE
    )
    :vars
    (
      ?auto_22161 - HOIST
      ?auto_22162 - PLACE
      ?auto_22164 - PLACE
      ?auto_22165 - HOIST
      ?auto_22166 - SURFACE
      ?auto_22163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22161 ?auto_22162 ) ( SURFACE-AT ?auto_22159 ?auto_22162 ) ( CLEAR ?auto_22159 ) ( IS-CRATE ?auto_22160 ) ( AVAILABLE ?auto_22161 ) ( not ( = ?auto_22164 ?auto_22162 ) ) ( HOIST-AT ?auto_22165 ?auto_22164 ) ( AVAILABLE ?auto_22165 ) ( SURFACE-AT ?auto_22160 ?auto_22164 ) ( ON ?auto_22160 ?auto_22166 ) ( CLEAR ?auto_22160 ) ( TRUCK-AT ?auto_22163 ?auto_22162 ) ( not ( = ?auto_22159 ?auto_22160 ) ) ( not ( = ?auto_22159 ?auto_22166 ) ) ( not ( = ?auto_22160 ?auto_22166 ) ) ( not ( = ?auto_22161 ?auto_22165 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22163 ?auto_22162 ?auto_22164 )
      ( !LIFT ?auto_22165 ?auto_22160 ?auto_22166 ?auto_22164 )
      ( !LOAD ?auto_22165 ?auto_22160 ?auto_22163 ?auto_22164 )
      ( !DRIVE ?auto_22163 ?auto_22164 ?auto_22162 )
      ( !UNLOAD ?auto_22161 ?auto_22160 ?auto_22163 ?auto_22162 )
      ( !DROP ?auto_22161 ?auto_22160 ?auto_22159 ?auto_22162 )
      ( MAKE-1CRATE-VERIFY ?auto_22159 ?auto_22160 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22171 - SURFACE
      ?auto_22172 - SURFACE
      ?auto_22173 - SURFACE
      ?auto_22174 - SURFACE
    )
    :vars
    (
      ?auto_22175 - HOIST
      ?auto_22176 - PLACE
      ?auto_22179 - PLACE
      ?auto_22178 - HOIST
      ?auto_22180 - SURFACE
      ?auto_22181 - PLACE
      ?auto_22182 - HOIST
      ?auto_22183 - SURFACE
      ?auto_22185 - PLACE
      ?auto_22186 - HOIST
      ?auto_22184 - SURFACE
      ?auto_22177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22175 ?auto_22176 ) ( IS-CRATE ?auto_22174 ) ( not ( = ?auto_22179 ?auto_22176 ) ) ( HOIST-AT ?auto_22178 ?auto_22179 ) ( AVAILABLE ?auto_22178 ) ( SURFACE-AT ?auto_22174 ?auto_22179 ) ( ON ?auto_22174 ?auto_22180 ) ( CLEAR ?auto_22174 ) ( not ( = ?auto_22173 ?auto_22174 ) ) ( not ( = ?auto_22173 ?auto_22180 ) ) ( not ( = ?auto_22174 ?auto_22180 ) ) ( not ( = ?auto_22175 ?auto_22178 ) ) ( IS-CRATE ?auto_22173 ) ( not ( = ?auto_22181 ?auto_22176 ) ) ( HOIST-AT ?auto_22182 ?auto_22181 ) ( AVAILABLE ?auto_22182 ) ( SURFACE-AT ?auto_22173 ?auto_22181 ) ( ON ?auto_22173 ?auto_22183 ) ( CLEAR ?auto_22173 ) ( not ( = ?auto_22172 ?auto_22173 ) ) ( not ( = ?auto_22172 ?auto_22183 ) ) ( not ( = ?auto_22173 ?auto_22183 ) ) ( not ( = ?auto_22175 ?auto_22182 ) ) ( SURFACE-AT ?auto_22171 ?auto_22176 ) ( CLEAR ?auto_22171 ) ( IS-CRATE ?auto_22172 ) ( AVAILABLE ?auto_22175 ) ( not ( = ?auto_22185 ?auto_22176 ) ) ( HOIST-AT ?auto_22186 ?auto_22185 ) ( AVAILABLE ?auto_22186 ) ( SURFACE-AT ?auto_22172 ?auto_22185 ) ( ON ?auto_22172 ?auto_22184 ) ( CLEAR ?auto_22172 ) ( TRUCK-AT ?auto_22177 ?auto_22176 ) ( not ( = ?auto_22171 ?auto_22172 ) ) ( not ( = ?auto_22171 ?auto_22184 ) ) ( not ( = ?auto_22172 ?auto_22184 ) ) ( not ( = ?auto_22175 ?auto_22186 ) ) ( not ( = ?auto_22171 ?auto_22173 ) ) ( not ( = ?auto_22171 ?auto_22183 ) ) ( not ( = ?auto_22173 ?auto_22184 ) ) ( not ( = ?auto_22181 ?auto_22185 ) ) ( not ( = ?auto_22182 ?auto_22186 ) ) ( not ( = ?auto_22183 ?auto_22184 ) ) ( not ( = ?auto_22171 ?auto_22174 ) ) ( not ( = ?auto_22171 ?auto_22180 ) ) ( not ( = ?auto_22172 ?auto_22174 ) ) ( not ( = ?auto_22172 ?auto_22180 ) ) ( not ( = ?auto_22174 ?auto_22183 ) ) ( not ( = ?auto_22174 ?auto_22184 ) ) ( not ( = ?auto_22179 ?auto_22181 ) ) ( not ( = ?auto_22179 ?auto_22185 ) ) ( not ( = ?auto_22178 ?auto_22182 ) ) ( not ( = ?auto_22178 ?auto_22186 ) ) ( not ( = ?auto_22180 ?auto_22183 ) ) ( not ( = ?auto_22180 ?auto_22184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22171 ?auto_22172 ?auto_22173 )
      ( MAKE-1CRATE ?auto_22173 ?auto_22174 )
      ( MAKE-3CRATE-VERIFY ?auto_22171 ?auto_22172 ?auto_22173 ?auto_22174 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22189 - SURFACE
      ?auto_22190 - SURFACE
    )
    :vars
    (
      ?auto_22191 - HOIST
      ?auto_22192 - PLACE
      ?auto_22194 - PLACE
      ?auto_22195 - HOIST
      ?auto_22196 - SURFACE
      ?auto_22193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22191 ?auto_22192 ) ( SURFACE-AT ?auto_22189 ?auto_22192 ) ( CLEAR ?auto_22189 ) ( IS-CRATE ?auto_22190 ) ( AVAILABLE ?auto_22191 ) ( not ( = ?auto_22194 ?auto_22192 ) ) ( HOIST-AT ?auto_22195 ?auto_22194 ) ( AVAILABLE ?auto_22195 ) ( SURFACE-AT ?auto_22190 ?auto_22194 ) ( ON ?auto_22190 ?auto_22196 ) ( CLEAR ?auto_22190 ) ( TRUCK-AT ?auto_22193 ?auto_22192 ) ( not ( = ?auto_22189 ?auto_22190 ) ) ( not ( = ?auto_22189 ?auto_22196 ) ) ( not ( = ?auto_22190 ?auto_22196 ) ) ( not ( = ?auto_22191 ?auto_22195 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22193 ?auto_22192 ?auto_22194 )
      ( !LIFT ?auto_22195 ?auto_22190 ?auto_22196 ?auto_22194 )
      ( !LOAD ?auto_22195 ?auto_22190 ?auto_22193 ?auto_22194 )
      ( !DRIVE ?auto_22193 ?auto_22194 ?auto_22192 )
      ( !UNLOAD ?auto_22191 ?auto_22190 ?auto_22193 ?auto_22192 )
      ( !DROP ?auto_22191 ?auto_22190 ?auto_22189 ?auto_22192 )
      ( MAKE-1CRATE-VERIFY ?auto_22189 ?auto_22190 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22202 - SURFACE
      ?auto_22203 - SURFACE
      ?auto_22204 - SURFACE
      ?auto_22205 - SURFACE
      ?auto_22206 - SURFACE
    )
    :vars
    (
      ?auto_22208 - HOIST
      ?auto_22207 - PLACE
      ?auto_22209 - PLACE
      ?auto_22210 - HOIST
      ?auto_22212 - SURFACE
      ?auto_22214 - PLACE
      ?auto_22216 - HOIST
      ?auto_22220 - SURFACE
      ?auto_22217 - PLACE
      ?auto_22218 - HOIST
      ?auto_22219 - SURFACE
      ?auto_22213 - PLACE
      ?auto_22221 - HOIST
      ?auto_22215 - SURFACE
      ?auto_22211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22208 ?auto_22207 ) ( IS-CRATE ?auto_22206 ) ( not ( = ?auto_22209 ?auto_22207 ) ) ( HOIST-AT ?auto_22210 ?auto_22209 ) ( AVAILABLE ?auto_22210 ) ( SURFACE-AT ?auto_22206 ?auto_22209 ) ( ON ?auto_22206 ?auto_22212 ) ( CLEAR ?auto_22206 ) ( not ( = ?auto_22205 ?auto_22206 ) ) ( not ( = ?auto_22205 ?auto_22212 ) ) ( not ( = ?auto_22206 ?auto_22212 ) ) ( not ( = ?auto_22208 ?auto_22210 ) ) ( IS-CRATE ?auto_22205 ) ( not ( = ?auto_22214 ?auto_22207 ) ) ( HOIST-AT ?auto_22216 ?auto_22214 ) ( AVAILABLE ?auto_22216 ) ( SURFACE-AT ?auto_22205 ?auto_22214 ) ( ON ?auto_22205 ?auto_22220 ) ( CLEAR ?auto_22205 ) ( not ( = ?auto_22204 ?auto_22205 ) ) ( not ( = ?auto_22204 ?auto_22220 ) ) ( not ( = ?auto_22205 ?auto_22220 ) ) ( not ( = ?auto_22208 ?auto_22216 ) ) ( IS-CRATE ?auto_22204 ) ( not ( = ?auto_22217 ?auto_22207 ) ) ( HOIST-AT ?auto_22218 ?auto_22217 ) ( AVAILABLE ?auto_22218 ) ( SURFACE-AT ?auto_22204 ?auto_22217 ) ( ON ?auto_22204 ?auto_22219 ) ( CLEAR ?auto_22204 ) ( not ( = ?auto_22203 ?auto_22204 ) ) ( not ( = ?auto_22203 ?auto_22219 ) ) ( not ( = ?auto_22204 ?auto_22219 ) ) ( not ( = ?auto_22208 ?auto_22218 ) ) ( SURFACE-AT ?auto_22202 ?auto_22207 ) ( CLEAR ?auto_22202 ) ( IS-CRATE ?auto_22203 ) ( AVAILABLE ?auto_22208 ) ( not ( = ?auto_22213 ?auto_22207 ) ) ( HOIST-AT ?auto_22221 ?auto_22213 ) ( AVAILABLE ?auto_22221 ) ( SURFACE-AT ?auto_22203 ?auto_22213 ) ( ON ?auto_22203 ?auto_22215 ) ( CLEAR ?auto_22203 ) ( TRUCK-AT ?auto_22211 ?auto_22207 ) ( not ( = ?auto_22202 ?auto_22203 ) ) ( not ( = ?auto_22202 ?auto_22215 ) ) ( not ( = ?auto_22203 ?auto_22215 ) ) ( not ( = ?auto_22208 ?auto_22221 ) ) ( not ( = ?auto_22202 ?auto_22204 ) ) ( not ( = ?auto_22202 ?auto_22219 ) ) ( not ( = ?auto_22204 ?auto_22215 ) ) ( not ( = ?auto_22217 ?auto_22213 ) ) ( not ( = ?auto_22218 ?auto_22221 ) ) ( not ( = ?auto_22219 ?auto_22215 ) ) ( not ( = ?auto_22202 ?auto_22205 ) ) ( not ( = ?auto_22202 ?auto_22220 ) ) ( not ( = ?auto_22203 ?auto_22205 ) ) ( not ( = ?auto_22203 ?auto_22220 ) ) ( not ( = ?auto_22205 ?auto_22219 ) ) ( not ( = ?auto_22205 ?auto_22215 ) ) ( not ( = ?auto_22214 ?auto_22217 ) ) ( not ( = ?auto_22214 ?auto_22213 ) ) ( not ( = ?auto_22216 ?auto_22218 ) ) ( not ( = ?auto_22216 ?auto_22221 ) ) ( not ( = ?auto_22220 ?auto_22219 ) ) ( not ( = ?auto_22220 ?auto_22215 ) ) ( not ( = ?auto_22202 ?auto_22206 ) ) ( not ( = ?auto_22202 ?auto_22212 ) ) ( not ( = ?auto_22203 ?auto_22206 ) ) ( not ( = ?auto_22203 ?auto_22212 ) ) ( not ( = ?auto_22204 ?auto_22206 ) ) ( not ( = ?auto_22204 ?auto_22212 ) ) ( not ( = ?auto_22206 ?auto_22220 ) ) ( not ( = ?auto_22206 ?auto_22219 ) ) ( not ( = ?auto_22206 ?auto_22215 ) ) ( not ( = ?auto_22209 ?auto_22214 ) ) ( not ( = ?auto_22209 ?auto_22217 ) ) ( not ( = ?auto_22209 ?auto_22213 ) ) ( not ( = ?auto_22210 ?auto_22216 ) ) ( not ( = ?auto_22210 ?auto_22218 ) ) ( not ( = ?auto_22210 ?auto_22221 ) ) ( not ( = ?auto_22212 ?auto_22220 ) ) ( not ( = ?auto_22212 ?auto_22219 ) ) ( not ( = ?auto_22212 ?auto_22215 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_22202 ?auto_22203 ?auto_22204 ?auto_22205 )
      ( MAKE-1CRATE ?auto_22205 ?auto_22206 )
      ( MAKE-4CRATE-VERIFY ?auto_22202 ?auto_22203 ?auto_22204 ?auto_22205 ?auto_22206 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22224 - SURFACE
      ?auto_22225 - SURFACE
    )
    :vars
    (
      ?auto_22226 - HOIST
      ?auto_22227 - PLACE
      ?auto_22229 - PLACE
      ?auto_22230 - HOIST
      ?auto_22231 - SURFACE
      ?auto_22228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22226 ?auto_22227 ) ( SURFACE-AT ?auto_22224 ?auto_22227 ) ( CLEAR ?auto_22224 ) ( IS-CRATE ?auto_22225 ) ( AVAILABLE ?auto_22226 ) ( not ( = ?auto_22229 ?auto_22227 ) ) ( HOIST-AT ?auto_22230 ?auto_22229 ) ( AVAILABLE ?auto_22230 ) ( SURFACE-AT ?auto_22225 ?auto_22229 ) ( ON ?auto_22225 ?auto_22231 ) ( CLEAR ?auto_22225 ) ( TRUCK-AT ?auto_22228 ?auto_22227 ) ( not ( = ?auto_22224 ?auto_22225 ) ) ( not ( = ?auto_22224 ?auto_22231 ) ) ( not ( = ?auto_22225 ?auto_22231 ) ) ( not ( = ?auto_22226 ?auto_22230 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22228 ?auto_22227 ?auto_22229 )
      ( !LIFT ?auto_22230 ?auto_22225 ?auto_22231 ?auto_22229 )
      ( !LOAD ?auto_22230 ?auto_22225 ?auto_22228 ?auto_22229 )
      ( !DRIVE ?auto_22228 ?auto_22229 ?auto_22227 )
      ( !UNLOAD ?auto_22226 ?auto_22225 ?auto_22228 ?auto_22227 )
      ( !DROP ?auto_22226 ?auto_22225 ?auto_22224 ?auto_22227 )
      ( MAKE-1CRATE-VERIFY ?auto_22224 ?auto_22225 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22238 - SURFACE
      ?auto_22239 - SURFACE
      ?auto_22240 - SURFACE
      ?auto_22241 - SURFACE
      ?auto_22242 - SURFACE
      ?auto_22243 - SURFACE
    )
    :vars
    (
      ?auto_22247 - HOIST
      ?auto_22246 - PLACE
      ?auto_22248 - PLACE
      ?auto_22245 - HOIST
      ?auto_22249 - SURFACE
      ?auto_22256 - PLACE
      ?auto_22260 - HOIST
      ?auto_22254 - SURFACE
      ?auto_22261 - PLACE
      ?auto_22255 - HOIST
      ?auto_22259 - SURFACE
      ?auto_22250 - PLACE
      ?auto_22257 - HOIST
      ?auto_22258 - SURFACE
      ?auto_22252 - PLACE
      ?auto_22251 - HOIST
      ?auto_22253 - SURFACE
      ?auto_22244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22247 ?auto_22246 ) ( IS-CRATE ?auto_22243 ) ( not ( = ?auto_22248 ?auto_22246 ) ) ( HOIST-AT ?auto_22245 ?auto_22248 ) ( AVAILABLE ?auto_22245 ) ( SURFACE-AT ?auto_22243 ?auto_22248 ) ( ON ?auto_22243 ?auto_22249 ) ( CLEAR ?auto_22243 ) ( not ( = ?auto_22242 ?auto_22243 ) ) ( not ( = ?auto_22242 ?auto_22249 ) ) ( not ( = ?auto_22243 ?auto_22249 ) ) ( not ( = ?auto_22247 ?auto_22245 ) ) ( IS-CRATE ?auto_22242 ) ( not ( = ?auto_22256 ?auto_22246 ) ) ( HOIST-AT ?auto_22260 ?auto_22256 ) ( AVAILABLE ?auto_22260 ) ( SURFACE-AT ?auto_22242 ?auto_22256 ) ( ON ?auto_22242 ?auto_22254 ) ( CLEAR ?auto_22242 ) ( not ( = ?auto_22241 ?auto_22242 ) ) ( not ( = ?auto_22241 ?auto_22254 ) ) ( not ( = ?auto_22242 ?auto_22254 ) ) ( not ( = ?auto_22247 ?auto_22260 ) ) ( IS-CRATE ?auto_22241 ) ( not ( = ?auto_22261 ?auto_22246 ) ) ( HOIST-AT ?auto_22255 ?auto_22261 ) ( AVAILABLE ?auto_22255 ) ( SURFACE-AT ?auto_22241 ?auto_22261 ) ( ON ?auto_22241 ?auto_22259 ) ( CLEAR ?auto_22241 ) ( not ( = ?auto_22240 ?auto_22241 ) ) ( not ( = ?auto_22240 ?auto_22259 ) ) ( not ( = ?auto_22241 ?auto_22259 ) ) ( not ( = ?auto_22247 ?auto_22255 ) ) ( IS-CRATE ?auto_22240 ) ( not ( = ?auto_22250 ?auto_22246 ) ) ( HOIST-AT ?auto_22257 ?auto_22250 ) ( AVAILABLE ?auto_22257 ) ( SURFACE-AT ?auto_22240 ?auto_22250 ) ( ON ?auto_22240 ?auto_22258 ) ( CLEAR ?auto_22240 ) ( not ( = ?auto_22239 ?auto_22240 ) ) ( not ( = ?auto_22239 ?auto_22258 ) ) ( not ( = ?auto_22240 ?auto_22258 ) ) ( not ( = ?auto_22247 ?auto_22257 ) ) ( SURFACE-AT ?auto_22238 ?auto_22246 ) ( CLEAR ?auto_22238 ) ( IS-CRATE ?auto_22239 ) ( AVAILABLE ?auto_22247 ) ( not ( = ?auto_22252 ?auto_22246 ) ) ( HOIST-AT ?auto_22251 ?auto_22252 ) ( AVAILABLE ?auto_22251 ) ( SURFACE-AT ?auto_22239 ?auto_22252 ) ( ON ?auto_22239 ?auto_22253 ) ( CLEAR ?auto_22239 ) ( TRUCK-AT ?auto_22244 ?auto_22246 ) ( not ( = ?auto_22238 ?auto_22239 ) ) ( not ( = ?auto_22238 ?auto_22253 ) ) ( not ( = ?auto_22239 ?auto_22253 ) ) ( not ( = ?auto_22247 ?auto_22251 ) ) ( not ( = ?auto_22238 ?auto_22240 ) ) ( not ( = ?auto_22238 ?auto_22258 ) ) ( not ( = ?auto_22240 ?auto_22253 ) ) ( not ( = ?auto_22250 ?auto_22252 ) ) ( not ( = ?auto_22257 ?auto_22251 ) ) ( not ( = ?auto_22258 ?auto_22253 ) ) ( not ( = ?auto_22238 ?auto_22241 ) ) ( not ( = ?auto_22238 ?auto_22259 ) ) ( not ( = ?auto_22239 ?auto_22241 ) ) ( not ( = ?auto_22239 ?auto_22259 ) ) ( not ( = ?auto_22241 ?auto_22258 ) ) ( not ( = ?auto_22241 ?auto_22253 ) ) ( not ( = ?auto_22261 ?auto_22250 ) ) ( not ( = ?auto_22261 ?auto_22252 ) ) ( not ( = ?auto_22255 ?auto_22257 ) ) ( not ( = ?auto_22255 ?auto_22251 ) ) ( not ( = ?auto_22259 ?auto_22258 ) ) ( not ( = ?auto_22259 ?auto_22253 ) ) ( not ( = ?auto_22238 ?auto_22242 ) ) ( not ( = ?auto_22238 ?auto_22254 ) ) ( not ( = ?auto_22239 ?auto_22242 ) ) ( not ( = ?auto_22239 ?auto_22254 ) ) ( not ( = ?auto_22240 ?auto_22242 ) ) ( not ( = ?auto_22240 ?auto_22254 ) ) ( not ( = ?auto_22242 ?auto_22259 ) ) ( not ( = ?auto_22242 ?auto_22258 ) ) ( not ( = ?auto_22242 ?auto_22253 ) ) ( not ( = ?auto_22256 ?auto_22261 ) ) ( not ( = ?auto_22256 ?auto_22250 ) ) ( not ( = ?auto_22256 ?auto_22252 ) ) ( not ( = ?auto_22260 ?auto_22255 ) ) ( not ( = ?auto_22260 ?auto_22257 ) ) ( not ( = ?auto_22260 ?auto_22251 ) ) ( not ( = ?auto_22254 ?auto_22259 ) ) ( not ( = ?auto_22254 ?auto_22258 ) ) ( not ( = ?auto_22254 ?auto_22253 ) ) ( not ( = ?auto_22238 ?auto_22243 ) ) ( not ( = ?auto_22238 ?auto_22249 ) ) ( not ( = ?auto_22239 ?auto_22243 ) ) ( not ( = ?auto_22239 ?auto_22249 ) ) ( not ( = ?auto_22240 ?auto_22243 ) ) ( not ( = ?auto_22240 ?auto_22249 ) ) ( not ( = ?auto_22241 ?auto_22243 ) ) ( not ( = ?auto_22241 ?auto_22249 ) ) ( not ( = ?auto_22243 ?auto_22254 ) ) ( not ( = ?auto_22243 ?auto_22259 ) ) ( not ( = ?auto_22243 ?auto_22258 ) ) ( not ( = ?auto_22243 ?auto_22253 ) ) ( not ( = ?auto_22248 ?auto_22256 ) ) ( not ( = ?auto_22248 ?auto_22261 ) ) ( not ( = ?auto_22248 ?auto_22250 ) ) ( not ( = ?auto_22248 ?auto_22252 ) ) ( not ( = ?auto_22245 ?auto_22260 ) ) ( not ( = ?auto_22245 ?auto_22255 ) ) ( not ( = ?auto_22245 ?auto_22257 ) ) ( not ( = ?auto_22245 ?auto_22251 ) ) ( not ( = ?auto_22249 ?auto_22254 ) ) ( not ( = ?auto_22249 ?auto_22259 ) ) ( not ( = ?auto_22249 ?auto_22258 ) ) ( not ( = ?auto_22249 ?auto_22253 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_22238 ?auto_22239 ?auto_22240 ?auto_22241 ?auto_22242 )
      ( MAKE-1CRATE ?auto_22242 ?auto_22243 )
      ( MAKE-5CRATE-VERIFY ?auto_22238 ?auto_22239 ?auto_22240 ?auto_22241 ?auto_22242 ?auto_22243 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22264 - SURFACE
      ?auto_22265 - SURFACE
    )
    :vars
    (
      ?auto_22266 - HOIST
      ?auto_22267 - PLACE
      ?auto_22269 - PLACE
      ?auto_22270 - HOIST
      ?auto_22271 - SURFACE
      ?auto_22268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22266 ?auto_22267 ) ( SURFACE-AT ?auto_22264 ?auto_22267 ) ( CLEAR ?auto_22264 ) ( IS-CRATE ?auto_22265 ) ( AVAILABLE ?auto_22266 ) ( not ( = ?auto_22269 ?auto_22267 ) ) ( HOIST-AT ?auto_22270 ?auto_22269 ) ( AVAILABLE ?auto_22270 ) ( SURFACE-AT ?auto_22265 ?auto_22269 ) ( ON ?auto_22265 ?auto_22271 ) ( CLEAR ?auto_22265 ) ( TRUCK-AT ?auto_22268 ?auto_22267 ) ( not ( = ?auto_22264 ?auto_22265 ) ) ( not ( = ?auto_22264 ?auto_22271 ) ) ( not ( = ?auto_22265 ?auto_22271 ) ) ( not ( = ?auto_22266 ?auto_22270 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22268 ?auto_22267 ?auto_22269 )
      ( !LIFT ?auto_22270 ?auto_22265 ?auto_22271 ?auto_22269 )
      ( !LOAD ?auto_22270 ?auto_22265 ?auto_22268 ?auto_22269 )
      ( !DRIVE ?auto_22268 ?auto_22269 ?auto_22267 )
      ( !UNLOAD ?auto_22266 ?auto_22265 ?auto_22268 ?auto_22267 )
      ( !DROP ?auto_22266 ?auto_22265 ?auto_22264 ?auto_22267 )
      ( MAKE-1CRATE-VERIFY ?auto_22264 ?auto_22265 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_22279 - SURFACE
      ?auto_22280 - SURFACE
      ?auto_22281 - SURFACE
      ?auto_22282 - SURFACE
      ?auto_22283 - SURFACE
      ?auto_22284 - SURFACE
      ?auto_22285 - SURFACE
    )
    :vars
    (
      ?auto_22291 - HOIST
      ?auto_22287 - PLACE
      ?auto_22286 - PLACE
      ?auto_22289 - HOIST
      ?auto_22290 - SURFACE
      ?auto_22292 - PLACE
      ?auto_22306 - HOIST
      ?auto_22293 - SURFACE
      ?auto_22298 - PLACE
      ?auto_22300 - HOIST
      ?auto_22302 - SURFACE
      ?auto_22296 - PLACE
      ?auto_22299 - HOIST
      ?auto_22305 - SURFACE
      ?auto_22295 - PLACE
      ?auto_22297 - HOIST
      ?auto_22303 - SURFACE
      ?auto_22294 - PLACE
      ?auto_22301 - HOIST
      ?auto_22304 - SURFACE
      ?auto_22288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22291 ?auto_22287 ) ( IS-CRATE ?auto_22285 ) ( not ( = ?auto_22286 ?auto_22287 ) ) ( HOIST-AT ?auto_22289 ?auto_22286 ) ( AVAILABLE ?auto_22289 ) ( SURFACE-AT ?auto_22285 ?auto_22286 ) ( ON ?auto_22285 ?auto_22290 ) ( CLEAR ?auto_22285 ) ( not ( = ?auto_22284 ?auto_22285 ) ) ( not ( = ?auto_22284 ?auto_22290 ) ) ( not ( = ?auto_22285 ?auto_22290 ) ) ( not ( = ?auto_22291 ?auto_22289 ) ) ( IS-CRATE ?auto_22284 ) ( not ( = ?auto_22292 ?auto_22287 ) ) ( HOIST-AT ?auto_22306 ?auto_22292 ) ( AVAILABLE ?auto_22306 ) ( SURFACE-AT ?auto_22284 ?auto_22292 ) ( ON ?auto_22284 ?auto_22293 ) ( CLEAR ?auto_22284 ) ( not ( = ?auto_22283 ?auto_22284 ) ) ( not ( = ?auto_22283 ?auto_22293 ) ) ( not ( = ?auto_22284 ?auto_22293 ) ) ( not ( = ?auto_22291 ?auto_22306 ) ) ( IS-CRATE ?auto_22283 ) ( not ( = ?auto_22298 ?auto_22287 ) ) ( HOIST-AT ?auto_22300 ?auto_22298 ) ( AVAILABLE ?auto_22300 ) ( SURFACE-AT ?auto_22283 ?auto_22298 ) ( ON ?auto_22283 ?auto_22302 ) ( CLEAR ?auto_22283 ) ( not ( = ?auto_22282 ?auto_22283 ) ) ( not ( = ?auto_22282 ?auto_22302 ) ) ( not ( = ?auto_22283 ?auto_22302 ) ) ( not ( = ?auto_22291 ?auto_22300 ) ) ( IS-CRATE ?auto_22282 ) ( not ( = ?auto_22296 ?auto_22287 ) ) ( HOIST-AT ?auto_22299 ?auto_22296 ) ( AVAILABLE ?auto_22299 ) ( SURFACE-AT ?auto_22282 ?auto_22296 ) ( ON ?auto_22282 ?auto_22305 ) ( CLEAR ?auto_22282 ) ( not ( = ?auto_22281 ?auto_22282 ) ) ( not ( = ?auto_22281 ?auto_22305 ) ) ( not ( = ?auto_22282 ?auto_22305 ) ) ( not ( = ?auto_22291 ?auto_22299 ) ) ( IS-CRATE ?auto_22281 ) ( not ( = ?auto_22295 ?auto_22287 ) ) ( HOIST-AT ?auto_22297 ?auto_22295 ) ( AVAILABLE ?auto_22297 ) ( SURFACE-AT ?auto_22281 ?auto_22295 ) ( ON ?auto_22281 ?auto_22303 ) ( CLEAR ?auto_22281 ) ( not ( = ?auto_22280 ?auto_22281 ) ) ( not ( = ?auto_22280 ?auto_22303 ) ) ( not ( = ?auto_22281 ?auto_22303 ) ) ( not ( = ?auto_22291 ?auto_22297 ) ) ( SURFACE-AT ?auto_22279 ?auto_22287 ) ( CLEAR ?auto_22279 ) ( IS-CRATE ?auto_22280 ) ( AVAILABLE ?auto_22291 ) ( not ( = ?auto_22294 ?auto_22287 ) ) ( HOIST-AT ?auto_22301 ?auto_22294 ) ( AVAILABLE ?auto_22301 ) ( SURFACE-AT ?auto_22280 ?auto_22294 ) ( ON ?auto_22280 ?auto_22304 ) ( CLEAR ?auto_22280 ) ( TRUCK-AT ?auto_22288 ?auto_22287 ) ( not ( = ?auto_22279 ?auto_22280 ) ) ( not ( = ?auto_22279 ?auto_22304 ) ) ( not ( = ?auto_22280 ?auto_22304 ) ) ( not ( = ?auto_22291 ?auto_22301 ) ) ( not ( = ?auto_22279 ?auto_22281 ) ) ( not ( = ?auto_22279 ?auto_22303 ) ) ( not ( = ?auto_22281 ?auto_22304 ) ) ( not ( = ?auto_22295 ?auto_22294 ) ) ( not ( = ?auto_22297 ?auto_22301 ) ) ( not ( = ?auto_22303 ?auto_22304 ) ) ( not ( = ?auto_22279 ?auto_22282 ) ) ( not ( = ?auto_22279 ?auto_22305 ) ) ( not ( = ?auto_22280 ?auto_22282 ) ) ( not ( = ?auto_22280 ?auto_22305 ) ) ( not ( = ?auto_22282 ?auto_22303 ) ) ( not ( = ?auto_22282 ?auto_22304 ) ) ( not ( = ?auto_22296 ?auto_22295 ) ) ( not ( = ?auto_22296 ?auto_22294 ) ) ( not ( = ?auto_22299 ?auto_22297 ) ) ( not ( = ?auto_22299 ?auto_22301 ) ) ( not ( = ?auto_22305 ?auto_22303 ) ) ( not ( = ?auto_22305 ?auto_22304 ) ) ( not ( = ?auto_22279 ?auto_22283 ) ) ( not ( = ?auto_22279 ?auto_22302 ) ) ( not ( = ?auto_22280 ?auto_22283 ) ) ( not ( = ?auto_22280 ?auto_22302 ) ) ( not ( = ?auto_22281 ?auto_22283 ) ) ( not ( = ?auto_22281 ?auto_22302 ) ) ( not ( = ?auto_22283 ?auto_22305 ) ) ( not ( = ?auto_22283 ?auto_22303 ) ) ( not ( = ?auto_22283 ?auto_22304 ) ) ( not ( = ?auto_22298 ?auto_22296 ) ) ( not ( = ?auto_22298 ?auto_22295 ) ) ( not ( = ?auto_22298 ?auto_22294 ) ) ( not ( = ?auto_22300 ?auto_22299 ) ) ( not ( = ?auto_22300 ?auto_22297 ) ) ( not ( = ?auto_22300 ?auto_22301 ) ) ( not ( = ?auto_22302 ?auto_22305 ) ) ( not ( = ?auto_22302 ?auto_22303 ) ) ( not ( = ?auto_22302 ?auto_22304 ) ) ( not ( = ?auto_22279 ?auto_22284 ) ) ( not ( = ?auto_22279 ?auto_22293 ) ) ( not ( = ?auto_22280 ?auto_22284 ) ) ( not ( = ?auto_22280 ?auto_22293 ) ) ( not ( = ?auto_22281 ?auto_22284 ) ) ( not ( = ?auto_22281 ?auto_22293 ) ) ( not ( = ?auto_22282 ?auto_22284 ) ) ( not ( = ?auto_22282 ?auto_22293 ) ) ( not ( = ?auto_22284 ?auto_22302 ) ) ( not ( = ?auto_22284 ?auto_22305 ) ) ( not ( = ?auto_22284 ?auto_22303 ) ) ( not ( = ?auto_22284 ?auto_22304 ) ) ( not ( = ?auto_22292 ?auto_22298 ) ) ( not ( = ?auto_22292 ?auto_22296 ) ) ( not ( = ?auto_22292 ?auto_22295 ) ) ( not ( = ?auto_22292 ?auto_22294 ) ) ( not ( = ?auto_22306 ?auto_22300 ) ) ( not ( = ?auto_22306 ?auto_22299 ) ) ( not ( = ?auto_22306 ?auto_22297 ) ) ( not ( = ?auto_22306 ?auto_22301 ) ) ( not ( = ?auto_22293 ?auto_22302 ) ) ( not ( = ?auto_22293 ?auto_22305 ) ) ( not ( = ?auto_22293 ?auto_22303 ) ) ( not ( = ?auto_22293 ?auto_22304 ) ) ( not ( = ?auto_22279 ?auto_22285 ) ) ( not ( = ?auto_22279 ?auto_22290 ) ) ( not ( = ?auto_22280 ?auto_22285 ) ) ( not ( = ?auto_22280 ?auto_22290 ) ) ( not ( = ?auto_22281 ?auto_22285 ) ) ( not ( = ?auto_22281 ?auto_22290 ) ) ( not ( = ?auto_22282 ?auto_22285 ) ) ( not ( = ?auto_22282 ?auto_22290 ) ) ( not ( = ?auto_22283 ?auto_22285 ) ) ( not ( = ?auto_22283 ?auto_22290 ) ) ( not ( = ?auto_22285 ?auto_22293 ) ) ( not ( = ?auto_22285 ?auto_22302 ) ) ( not ( = ?auto_22285 ?auto_22305 ) ) ( not ( = ?auto_22285 ?auto_22303 ) ) ( not ( = ?auto_22285 ?auto_22304 ) ) ( not ( = ?auto_22286 ?auto_22292 ) ) ( not ( = ?auto_22286 ?auto_22298 ) ) ( not ( = ?auto_22286 ?auto_22296 ) ) ( not ( = ?auto_22286 ?auto_22295 ) ) ( not ( = ?auto_22286 ?auto_22294 ) ) ( not ( = ?auto_22289 ?auto_22306 ) ) ( not ( = ?auto_22289 ?auto_22300 ) ) ( not ( = ?auto_22289 ?auto_22299 ) ) ( not ( = ?auto_22289 ?auto_22297 ) ) ( not ( = ?auto_22289 ?auto_22301 ) ) ( not ( = ?auto_22290 ?auto_22293 ) ) ( not ( = ?auto_22290 ?auto_22302 ) ) ( not ( = ?auto_22290 ?auto_22305 ) ) ( not ( = ?auto_22290 ?auto_22303 ) ) ( not ( = ?auto_22290 ?auto_22304 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_22279 ?auto_22280 ?auto_22281 ?auto_22282 ?auto_22283 ?auto_22284 )
      ( MAKE-1CRATE ?auto_22284 ?auto_22285 )
      ( MAKE-6CRATE-VERIFY ?auto_22279 ?auto_22280 ?auto_22281 ?auto_22282 ?auto_22283 ?auto_22284 ?auto_22285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22309 - SURFACE
      ?auto_22310 - SURFACE
    )
    :vars
    (
      ?auto_22311 - HOIST
      ?auto_22312 - PLACE
      ?auto_22314 - PLACE
      ?auto_22315 - HOIST
      ?auto_22316 - SURFACE
      ?auto_22313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22311 ?auto_22312 ) ( SURFACE-AT ?auto_22309 ?auto_22312 ) ( CLEAR ?auto_22309 ) ( IS-CRATE ?auto_22310 ) ( AVAILABLE ?auto_22311 ) ( not ( = ?auto_22314 ?auto_22312 ) ) ( HOIST-AT ?auto_22315 ?auto_22314 ) ( AVAILABLE ?auto_22315 ) ( SURFACE-AT ?auto_22310 ?auto_22314 ) ( ON ?auto_22310 ?auto_22316 ) ( CLEAR ?auto_22310 ) ( TRUCK-AT ?auto_22313 ?auto_22312 ) ( not ( = ?auto_22309 ?auto_22310 ) ) ( not ( = ?auto_22309 ?auto_22316 ) ) ( not ( = ?auto_22310 ?auto_22316 ) ) ( not ( = ?auto_22311 ?auto_22315 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22313 ?auto_22312 ?auto_22314 )
      ( !LIFT ?auto_22315 ?auto_22310 ?auto_22316 ?auto_22314 )
      ( !LOAD ?auto_22315 ?auto_22310 ?auto_22313 ?auto_22314 )
      ( !DRIVE ?auto_22313 ?auto_22314 ?auto_22312 )
      ( !UNLOAD ?auto_22311 ?auto_22310 ?auto_22313 ?auto_22312 )
      ( !DROP ?auto_22311 ?auto_22310 ?auto_22309 ?auto_22312 )
      ( MAKE-1CRATE-VERIFY ?auto_22309 ?auto_22310 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_22325 - SURFACE
      ?auto_22326 - SURFACE
      ?auto_22327 - SURFACE
      ?auto_22328 - SURFACE
      ?auto_22329 - SURFACE
      ?auto_22330 - SURFACE
      ?auto_22332 - SURFACE
      ?auto_22331 - SURFACE
    )
    :vars
    (
      ?auto_22334 - HOIST
      ?auto_22338 - PLACE
      ?auto_22333 - PLACE
      ?auto_22336 - HOIST
      ?auto_22335 - SURFACE
      ?auto_22347 - PLACE
      ?auto_22354 - HOIST
      ?auto_22340 - SURFACE
      ?auto_22344 - PLACE
      ?auto_22343 - HOIST
      ?auto_22341 - SURFACE
      ?auto_22339 - PLACE
      ?auto_22345 - HOIST
      ?auto_22346 - SURFACE
      ?auto_22353 - PLACE
      ?auto_22352 - HOIST
      ?auto_22351 - SURFACE
      ?auto_22355 - PLACE
      ?auto_22356 - HOIST
      ?auto_22349 - SURFACE
      ?auto_22342 - PLACE
      ?auto_22348 - HOIST
      ?auto_22350 - SURFACE
      ?auto_22337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22334 ?auto_22338 ) ( IS-CRATE ?auto_22331 ) ( not ( = ?auto_22333 ?auto_22338 ) ) ( HOIST-AT ?auto_22336 ?auto_22333 ) ( AVAILABLE ?auto_22336 ) ( SURFACE-AT ?auto_22331 ?auto_22333 ) ( ON ?auto_22331 ?auto_22335 ) ( CLEAR ?auto_22331 ) ( not ( = ?auto_22332 ?auto_22331 ) ) ( not ( = ?auto_22332 ?auto_22335 ) ) ( not ( = ?auto_22331 ?auto_22335 ) ) ( not ( = ?auto_22334 ?auto_22336 ) ) ( IS-CRATE ?auto_22332 ) ( not ( = ?auto_22347 ?auto_22338 ) ) ( HOIST-AT ?auto_22354 ?auto_22347 ) ( AVAILABLE ?auto_22354 ) ( SURFACE-AT ?auto_22332 ?auto_22347 ) ( ON ?auto_22332 ?auto_22340 ) ( CLEAR ?auto_22332 ) ( not ( = ?auto_22330 ?auto_22332 ) ) ( not ( = ?auto_22330 ?auto_22340 ) ) ( not ( = ?auto_22332 ?auto_22340 ) ) ( not ( = ?auto_22334 ?auto_22354 ) ) ( IS-CRATE ?auto_22330 ) ( not ( = ?auto_22344 ?auto_22338 ) ) ( HOIST-AT ?auto_22343 ?auto_22344 ) ( AVAILABLE ?auto_22343 ) ( SURFACE-AT ?auto_22330 ?auto_22344 ) ( ON ?auto_22330 ?auto_22341 ) ( CLEAR ?auto_22330 ) ( not ( = ?auto_22329 ?auto_22330 ) ) ( not ( = ?auto_22329 ?auto_22341 ) ) ( not ( = ?auto_22330 ?auto_22341 ) ) ( not ( = ?auto_22334 ?auto_22343 ) ) ( IS-CRATE ?auto_22329 ) ( not ( = ?auto_22339 ?auto_22338 ) ) ( HOIST-AT ?auto_22345 ?auto_22339 ) ( AVAILABLE ?auto_22345 ) ( SURFACE-AT ?auto_22329 ?auto_22339 ) ( ON ?auto_22329 ?auto_22346 ) ( CLEAR ?auto_22329 ) ( not ( = ?auto_22328 ?auto_22329 ) ) ( not ( = ?auto_22328 ?auto_22346 ) ) ( not ( = ?auto_22329 ?auto_22346 ) ) ( not ( = ?auto_22334 ?auto_22345 ) ) ( IS-CRATE ?auto_22328 ) ( not ( = ?auto_22353 ?auto_22338 ) ) ( HOIST-AT ?auto_22352 ?auto_22353 ) ( AVAILABLE ?auto_22352 ) ( SURFACE-AT ?auto_22328 ?auto_22353 ) ( ON ?auto_22328 ?auto_22351 ) ( CLEAR ?auto_22328 ) ( not ( = ?auto_22327 ?auto_22328 ) ) ( not ( = ?auto_22327 ?auto_22351 ) ) ( not ( = ?auto_22328 ?auto_22351 ) ) ( not ( = ?auto_22334 ?auto_22352 ) ) ( IS-CRATE ?auto_22327 ) ( not ( = ?auto_22355 ?auto_22338 ) ) ( HOIST-AT ?auto_22356 ?auto_22355 ) ( AVAILABLE ?auto_22356 ) ( SURFACE-AT ?auto_22327 ?auto_22355 ) ( ON ?auto_22327 ?auto_22349 ) ( CLEAR ?auto_22327 ) ( not ( = ?auto_22326 ?auto_22327 ) ) ( not ( = ?auto_22326 ?auto_22349 ) ) ( not ( = ?auto_22327 ?auto_22349 ) ) ( not ( = ?auto_22334 ?auto_22356 ) ) ( SURFACE-AT ?auto_22325 ?auto_22338 ) ( CLEAR ?auto_22325 ) ( IS-CRATE ?auto_22326 ) ( AVAILABLE ?auto_22334 ) ( not ( = ?auto_22342 ?auto_22338 ) ) ( HOIST-AT ?auto_22348 ?auto_22342 ) ( AVAILABLE ?auto_22348 ) ( SURFACE-AT ?auto_22326 ?auto_22342 ) ( ON ?auto_22326 ?auto_22350 ) ( CLEAR ?auto_22326 ) ( TRUCK-AT ?auto_22337 ?auto_22338 ) ( not ( = ?auto_22325 ?auto_22326 ) ) ( not ( = ?auto_22325 ?auto_22350 ) ) ( not ( = ?auto_22326 ?auto_22350 ) ) ( not ( = ?auto_22334 ?auto_22348 ) ) ( not ( = ?auto_22325 ?auto_22327 ) ) ( not ( = ?auto_22325 ?auto_22349 ) ) ( not ( = ?auto_22327 ?auto_22350 ) ) ( not ( = ?auto_22355 ?auto_22342 ) ) ( not ( = ?auto_22356 ?auto_22348 ) ) ( not ( = ?auto_22349 ?auto_22350 ) ) ( not ( = ?auto_22325 ?auto_22328 ) ) ( not ( = ?auto_22325 ?auto_22351 ) ) ( not ( = ?auto_22326 ?auto_22328 ) ) ( not ( = ?auto_22326 ?auto_22351 ) ) ( not ( = ?auto_22328 ?auto_22349 ) ) ( not ( = ?auto_22328 ?auto_22350 ) ) ( not ( = ?auto_22353 ?auto_22355 ) ) ( not ( = ?auto_22353 ?auto_22342 ) ) ( not ( = ?auto_22352 ?auto_22356 ) ) ( not ( = ?auto_22352 ?auto_22348 ) ) ( not ( = ?auto_22351 ?auto_22349 ) ) ( not ( = ?auto_22351 ?auto_22350 ) ) ( not ( = ?auto_22325 ?auto_22329 ) ) ( not ( = ?auto_22325 ?auto_22346 ) ) ( not ( = ?auto_22326 ?auto_22329 ) ) ( not ( = ?auto_22326 ?auto_22346 ) ) ( not ( = ?auto_22327 ?auto_22329 ) ) ( not ( = ?auto_22327 ?auto_22346 ) ) ( not ( = ?auto_22329 ?auto_22351 ) ) ( not ( = ?auto_22329 ?auto_22349 ) ) ( not ( = ?auto_22329 ?auto_22350 ) ) ( not ( = ?auto_22339 ?auto_22353 ) ) ( not ( = ?auto_22339 ?auto_22355 ) ) ( not ( = ?auto_22339 ?auto_22342 ) ) ( not ( = ?auto_22345 ?auto_22352 ) ) ( not ( = ?auto_22345 ?auto_22356 ) ) ( not ( = ?auto_22345 ?auto_22348 ) ) ( not ( = ?auto_22346 ?auto_22351 ) ) ( not ( = ?auto_22346 ?auto_22349 ) ) ( not ( = ?auto_22346 ?auto_22350 ) ) ( not ( = ?auto_22325 ?auto_22330 ) ) ( not ( = ?auto_22325 ?auto_22341 ) ) ( not ( = ?auto_22326 ?auto_22330 ) ) ( not ( = ?auto_22326 ?auto_22341 ) ) ( not ( = ?auto_22327 ?auto_22330 ) ) ( not ( = ?auto_22327 ?auto_22341 ) ) ( not ( = ?auto_22328 ?auto_22330 ) ) ( not ( = ?auto_22328 ?auto_22341 ) ) ( not ( = ?auto_22330 ?auto_22346 ) ) ( not ( = ?auto_22330 ?auto_22351 ) ) ( not ( = ?auto_22330 ?auto_22349 ) ) ( not ( = ?auto_22330 ?auto_22350 ) ) ( not ( = ?auto_22344 ?auto_22339 ) ) ( not ( = ?auto_22344 ?auto_22353 ) ) ( not ( = ?auto_22344 ?auto_22355 ) ) ( not ( = ?auto_22344 ?auto_22342 ) ) ( not ( = ?auto_22343 ?auto_22345 ) ) ( not ( = ?auto_22343 ?auto_22352 ) ) ( not ( = ?auto_22343 ?auto_22356 ) ) ( not ( = ?auto_22343 ?auto_22348 ) ) ( not ( = ?auto_22341 ?auto_22346 ) ) ( not ( = ?auto_22341 ?auto_22351 ) ) ( not ( = ?auto_22341 ?auto_22349 ) ) ( not ( = ?auto_22341 ?auto_22350 ) ) ( not ( = ?auto_22325 ?auto_22332 ) ) ( not ( = ?auto_22325 ?auto_22340 ) ) ( not ( = ?auto_22326 ?auto_22332 ) ) ( not ( = ?auto_22326 ?auto_22340 ) ) ( not ( = ?auto_22327 ?auto_22332 ) ) ( not ( = ?auto_22327 ?auto_22340 ) ) ( not ( = ?auto_22328 ?auto_22332 ) ) ( not ( = ?auto_22328 ?auto_22340 ) ) ( not ( = ?auto_22329 ?auto_22332 ) ) ( not ( = ?auto_22329 ?auto_22340 ) ) ( not ( = ?auto_22332 ?auto_22341 ) ) ( not ( = ?auto_22332 ?auto_22346 ) ) ( not ( = ?auto_22332 ?auto_22351 ) ) ( not ( = ?auto_22332 ?auto_22349 ) ) ( not ( = ?auto_22332 ?auto_22350 ) ) ( not ( = ?auto_22347 ?auto_22344 ) ) ( not ( = ?auto_22347 ?auto_22339 ) ) ( not ( = ?auto_22347 ?auto_22353 ) ) ( not ( = ?auto_22347 ?auto_22355 ) ) ( not ( = ?auto_22347 ?auto_22342 ) ) ( not ( = ?auto_22354 ?auto_22343 ) ) ( not ( = ?auto_22354 ?auto_22345 ) ) ( not ( = ?auto_22354 ?auto_22352 ) ) ( not ( = ?auto_22354 ?auto_22356 ) ) ( not ( = ?auto_22354 ?auto_22348 ) ) ( not ( = ?auto_22340 ?auto_22341 ) ) ( not ( = ?auto_22340 ?auto_22346 ) ) ( not ( = ?auto_22340 ?auto_22351 ) ) ( not ( = ?auto_22340 ?auto_22349 ) ) ( not ( = ?auto_22340 ?auto_22350 ) ) ( not ( = ?auto_22325 ?auto_22331 ) ) ( not ( = ?auto_22325 ?auto_22335 ) ) ( not ( = ?auto_22326 ?auto_22331 ) ) ( not ( = ?auto_22326 ?auto_22335 ) ) ( not ( = ?auto_22327 ?auto_22331 ) ) ( not ( = ?auto_22327 ?auto_22335 ) ) ( not ( = ?auto_22328 ?auto_22331 ) ) ( not ( = ?auto_22328 ?auto_22335 ) ) ( not ( = ?auto_22329 ?auto_22331 ) ) ( not ( = ?auto_22329 ?auto_22335 ) ) ( not ( = ?auto_22330 ?auto_22331 ) ) ( not ( = ?auto_22330 ?auto_22335 ) ) ( not ( = ?auto_22331 ?auto_22340 ) ) ( not ( = ?auto_22331 ?auto_22341 ) ) ( not ( = ?auto_22331 ?auto_22346 ) ) ( not ( = ?auto_22331 ?auto_22351 ) ) ( not ( = ?auto_22331 ?auto_22349 ) ) ( not ( = ?auto_22331 ?auto_22350 ) ) ( not ( = ?auto_22333 ?auto_22347 ) ) ( not ( = ?auto_22333 ?auto_22344 ) ) ( not ( = ?auto_22333 ?auto_22339 ) ) ( not ( = ?auto_22333 ?auto_22353 ) ) ( not ( = ?auto_22333 ?auto_22355 ) ) ( not ( = ?auto_22333 ?auto_22342 ) ) ( not ( = ?auto_22336 ?auto_22354 ) ) ( not ( = ?auto_22336 ?auto_22343 ) ) ( not ( = ?auto_22336 ?auto_22345 ) ) ( not ( = ?auto_22336 ?auto_22352 ) ) ( not ( = ?auto_22336 ?auto_22356 ) ) ( not ( = ?auto_22336 ?auto_22348 ) ) ( not ( = ?auto_22335 ?auto_22340 ) ) ( not ( = ?auto_22335 ?auto_22341 ) ) ( not ( = ?auto_22335 ?auto_22346 ) ) ( not ( = ?auto_22335 ?auto_22351 ) ) ( not ( = ?auto_22335 ?auto_22349 ) ) ( not ( = ?auto_22335 ?auto_22350 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_22325 ?auto_22326 ?auto_22327 ?auto_22328 ?auto_22329 ?auto_22330 ?auto_22332 )
      ( MAKE-1CRATE ?auto_22332 ?auto_22331 )
      ( MAKE-7CRATE-VERIFY ?auto_22325 ?auto_22326 ?auto_22327 ?auto_22328 ?auto_22329 ?auto_22330 ?auto_22332 ?auto_22331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22359 - SURFACE
      ?auto_22360 - SURFACE
    )
    :vars
    (
      ?auto_22361 - HOIST
      ?auto_22362 - PLACE
      ?auto_22364 - PLACE
      ?auto_22365 - HOIST
      ?auto_22366 - SURFACE
      ?auto_22363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22361 ?auto_22362 ) ( SURFACE-AT ?auto_22359 ?auto_22362 ) ( CLEAR ?auto_22359 ) ( IS-CRATE ?auto_22360 ) ( AVAILABLE ?auto_22361 ) ( not ( = ?auto_22364 ?auto_22362 ) ) ( HOIST-AT ?auto_22365 ?auto_22364 ) ( AVAILABLE ?auto_22365 ) ( SURFACE-AT ?auto_22360 ?auto_22364 ) ( ON ?auto_22360 ?auto_22366 ) ( CLEAR ?auto_22360 ) ( TRUCK-AT ?auto_22363 ?auto_22362 ) ( not ( = ?auto_22359 ?auto_22360 ) ) ( not ( = ?auto_22359 ?auto_22366 ) ) ( not ( = ?auto_22360 ?auto_22366 ) ) ( not ( = ?auto_22361 ?auto_22365 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22363 ?auto_22362 ?auto_22364 )
      ( !LIFT ?auto_22365 ?auto_22360 ?auto_22366 ?auto_22364 )
      ( !LOAD ?auto_22365 ?auto_22360 ?auto_22363 ?auto_22364 )
      ( !DRIVE ?auto_22363 ?auto_22364 ?auto_22362 )
      ( !UNLOAD ?auto_22361 ?auto_22360 ?auto_22363 ?auto_22362 )
      ( !DROP ?auto_22361 ?auto_22360 ?auto_22359 ?auto_22362 )
      ( MAKE-1CRATE-VERIFY ?auto_22359 ?auto_22360 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_22376 - SURFACE
      ?auto_22377 - SURFACE
      ?auto_22378 - SURFACE
      ?auto_22379 - SURFACE
      ?auto_22380 - SURFACE
      ?auto_22381 - SURFACE
      ?auto_22384 - SURFACE
      ?auto_22383 - SURFACE
      ?auto_22382 - SURFACE
    )
    :vars
    (
      ?auto_22387 - HOIST
      ?auto_22388 - PLACE
      ?auto_22390 - PLACE
      ?auto_22385 - HOIST
      ?auto_22389 - SURFACE
      ?auto_22393 - PLACE
      ?auto_22398 - HOIST
      ?auto_22403 - SURFACE
      ?auto_22394 - PLACE
      ?auto_22404 - HOIST
      ?auto_22408 - SURFACE
      ?auto_22395 - PLACE
      ?auto_22396 - HOIST
      ?auto_22407 - SURFACE
      ?auto_22402 - SURFACE
      ?auto_22406 - PLACE
      ?auto_22401 - HOIST
      ?auto_22400 - SURFACE
      ?auto_22405 - PLACE
      ?auto_22397 - HOIST
      ?auto_22391 - SURFACE
      ?auto_22409 - PLACE
      ?auto_22392 - HOIST
      ?auto_22399 - SURFACE
      ?auto_22386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22387 ?auto_22388 ) ( IS-CRATE ?auto_22382 ) ( not ( = ?auto_22390 ?auto_22388 ) ) ( HOIST-AT ?auto_22385 ?auto_22390 ) ( SURFACE-AT ?auto_22382 ?auto_22390 ) ( ON ?auto_22382 ?auto_22389 ) ( CLEAR ?auto_22382 ) ( not ( = ?auto_22383 ?auto_22382 ) ) ( not ( = ?auto_22383 ?auto_22389 ) ) ( not ( = ?auto_22382 ?auto_22389 ) ) ( not ( = ?auto_22387 ?auto_22385 ) ) ( IS-CRATE ?auto_22383 ) ( not ( = ?auto_22393 ?auto_22388 ) ) ( HOIST-AT ?auto_22398 ?auto_22393 ) ( AVAILABLE ?auto_22398 ) ( SURFACE-AT ?auto_22383 ?auto_22393 ) ( ON ?auto_22383 ?auto_22403 ) ( CLEAR ?auto_22383 ) ( not ( = ?auto_22384 ?auto_22383 ) ) ( not ( = ?auto_22384 ?auto_22403 ) ) ( not ( = ?auto_22383 ?auto_22403 ) ) ( not ( = ?auto_22387 ?auto_22398 ) ) ( IS-CRATE ?auto_22384 ) ( not ( = ?auto_22394 ?auto_22388 ) ) ( HOIST-AT ?auto_22404 ?auto_22394 ) ( AVAILABLE ?auto_22404 ) ( SURFACE-AT ?auto_22384 ?auto_22394 ) ( ON ?auto_22384 ?auto_22408 ) ( CLEAR ?auto_22384 ) ( not ( = ?auto_22381 ?auto_22384 ) ) ( not ( = ?auto_22381 ?auto_22408 ) ) ( not ( = ?auto_22384 ?auto_22408 ) ) ( not ( = ?auto_22387 ?auto_22404 ) ) ( IS-CRATE ?auto_22381 ) ( not ( = ?auto_22395 ?auto_22388 ) ) ( HOIST-AT ?auto_22396 ?auto_22395 ) ( AVAILABLE ?auto_22396 ) ( SURFACE-AT ?auto_22381 ?auto_22395 ) ( ON ?auto_22381 ?auto_22407 ) ( CLEAR ?auto_22381 ) ( not ( = ?auto_22380 ?auto_22381 ) ) ( not ( = ?auto_22380 ?auto_22407 ) ) ( not ( = ?auto_22381 ?auto_22407 ) ) ( not ( = ?auto_22387 ?auto_22396 ) ) ( IS-CRATE ?auto_22380 ) ( AVAILABLE ?auto_22385 ) ( SURFACE-AT ?auto_22380 ?auto_22390 ) ( ON ?auto_22380 ?auto_22402 ) ( CLEAR ?auto_22380 ) ( not ( = ?auto_22379 ?auto_22380 ) ) ( not ( = ?auto_22379 ?auto_22402 ) ) ( not ( = ?auto_22380 ?auto_22402 ) ) ( IS-CRATE ?auto_22379 ) ( not ( = ?auto_22406 ?auto_22388 ) ) ( HOIST-AT ?auto_22401 ?auto_22406 ) ( AVAILABLE ?auto_22401 ) ( SURFACE-AT ?auto_22379 ?auto_22406 ) ( ON ?auto_22379 ?auto_22400 ) ( CLEAR ?auto_22379 ) ( not ( = ?auto_22378 ?auto_22379 ) ) ( not ( = ?auto_22378 ?auto_22400 ) ) ( not ( = ?auto_22379 ?auto_22400 ) ) ( not ( = ?auto_22387 ?auto_22401 ) ) ( IS-CRATE ?auto_22378 ) ( not ( = ?auto_22405 ?auto_22388 ) ) ( HOIST-AT ?auto_22397 ?auto_22405 ) ( AVAILABLE ?auto_22397 ) ( SURFACE-AT ?auto_22378 ?auto_22405 ) ( ON ?auto_22378 ?auto_22391 ) ( CLEAR ?auto_22378 ) ( not ( = ?auto_22377 ?auto_22378 ) ) ( not ( = ?auto_22377 ?auto_22391 ) ) ( not ( = ?auto_22378 ?auto_22391 ) ) ( not ( = ?auto_22387 ?auto_22397 ) ) ( SURFACE-AT ?auto_22376 ?auto_22388 ) ( CLEAR ?auto_22376 ) ( IS-CRATE ?auto_22377 ) ( AVAILABLE ?auto_22387 ) ( not ( = ?auto_22409 ?auto_22388 ) ) ( HOIST-AT ?auto_22392 ?auto_22409 ) ( AVAILABLE ?auto_22392 ) ( SURFACE-AT ?auto_22377 ?auto_22409 ) ( ON ?auto_22377 ?auto_22399 ) ( CLEAR ?auto_22377 ) ( TRUCK-AT ?auto_22386 ?auto_22388 ) ( not ( = ?auto_22376 ?auto_22377 ) ) ( not ( = ?auto_22376 ?auto_22399 ) ) ( not ( = ?auto_22377 ?auto_22399 ) ) ( not ( = ?auto_22387 ?auto_22392 ) ) ( not ( = ?auto_22376 ?auto_22378 ) ) ( not ( = ?auto_22376 ?auto_22391 ) ) ( not ( = ?auto_22378 ?auto_22399 ) ) ( not ( = ?auto_22405 ?auto_22409 ) ) ( not ( = ?auto_22397 ?auto_22392 ) ) ( not ( = ?auto_22391 ?auto_22399 ) ) ( not ( = ?auto_22376 ?auto_22379 ) ) ( not ( = ?auto_22376 ?auto_22400 ) ) ( not ( = ?auto_22377 ?auto_22379 ) ) ( not ( = ?auto_22377 ?auto_22400 ) ) ( not ( = ?auto_22379 ?auto_22391 ) ) ( not ( = ?auto_22379 ?auto_22399 ) ) ( not ( = ?auto_22406 ?auto_22405 ) ) ( not ( = ?auto_22406 ?auto_22409 ) ) ( not ( = ?auto_22401 ?auto_22397 ) ) ( not ( = ?auto_22401 ?auto_22392 ) ) ( not ( = ?auto_22400 ?auto_22391 ) ) ( not ( = ?auto_22400 ?auto_22399 ) ) ( not ( = ?auto_22376 ?auto_22380 ) ) ( not ( = ?auto_22376 ?auto_22402 ) ) ( not ( = ?auto_22377 ?auto_22380 ) ) ( not ( = ?auto_22377 ?auto_22402 ) ) ( not ( = ?auto_22378 ?auto_22380 ) ) ( not ( = ?auto_22378 ?auto_22402 ) ) ( not ( = ?auto_22380 ?auto_22400 ) ) ( not ( = ?auto_22380 ?auto_22391 ) ) ( not ( = ?auto_22380 ?auto_22399 ) ) ( not ( = ?auto_22390 ?auto_22406 ) ) ( not ( = ?auto_22390 ?auto_22405 ) ) ( not ( = ?auto_22390 ?auto_22409 ) ) ( not ( = ?auto_22385 ?auto_22401 ) ) ( not ( = ?auto_22385 ?auto_22397 ) ) ( not ( = ?auto_22385 ?auto_22392 ) ) ( not ( = ?auto_22402 ?auto_22400 ) ) ( not ( = ?auto_22402 ?auto_22391 ) ) ( not ( = ?auto_22402 ?auto_22399 ) ) ( not ( = ?auto_22376 ?auto_22381 ) ) ( not ( = ?auto_22376 ?auto_22407 ) ) ( not ( = ?auto_22377 ?auto_22381 ) ) ( not ( = ?auto_22377 ?auto_22407 ) ) ( not ( = ?auto_22378 ?auto_22381 ) ) ( not ( = ?auto_22378 ?auto_22407 ) ) ( not ( = ?auto_22379 ?auto_22381 ) ) ( not ( = ?auto_22379 ?auto_22407 ) ) ( not ( = ?auto_22381 ?auto_22402 ) ) ( not ( = ?auto_22381 ?auto_22400 ) ) ( not ( = ?auto_22381 ?auto_22391 ) ) ( not ( = ?auto_22381 ?auto_22399 ) ) ( not ( = ?auto_22395 ?auto_22390 ) ) ( not ( = ?auto_22395 ?auto_22406 ) ) ( not ( = ?auto_22395 ?auto_22405 ) ) ( not ( = ?auto_22395 ?auto_22409 ) ) ( not ( = ?auto_22396 ?auto_22385 ) ) ( not ( = ?auto_22396 ?auto_22401 ) ) ( not ( = ?auto_22396 ?auto_22397 ) ) ( not ( = ?auto_22396 ?auto_22392 ) ) ( not ( = ?auto_22407 ?auto_22402 ) ) ( not ( = ?auto_22407 ?auto_22400 ) ) ( not ( = ?auto_22407 ?auto_22391 ) ) ( not ( = ?auto_22407 ?auto_22399 ) ) ( not ( = ?auto_22376 ?auto_22384 ) ) ( not ( = ?auto_22376 ?auto_22408 ) ) ( not ( = ?auto_22377 ?auto_22384 ) ) ( not ( = ?auto_22377 ?auto_22408 ) ) ( not ( = ?auto_22378 ?auto_22384 ) ) ( not ( = ?auto_22378 ?auto_22408 ) ) ( not ( = ?auto_22379 ?auto_22384 ) ) ( not ( = ?auto_22379 ?auto_22408 ) ) ( not ( = ?auto_22380 ?auto_22384 ) ) ( not ( = ?auto_22380 ?auto_22408 ) ) ( not ( = ?auto_22384 ?auto_22407 ) ) ( not ( = ?auto_22384 ?auto_22402 ) ) ( not ( = ?auto_22384 ?auto_22400 ) ) ( not ( = ?auto_22384 ?auto_22391 ) ) ( not ( = ?auto_22384 ?auto_22399 ) ) ( not ( = ?auto_22394 ?auto_22395 ) ) ( not ( = ?auto_22394 ?auto_22390 ) ) ( not ( = ?auto_22394 ?auto_22406 ) ) ( not ( = ?auto_22394 ?auto_22405 ) ) ( not ( = ?auto_22394 ?auto_22409 ) ) ( not ( = ?auto_22404 ?auto_22396 ) ) ( not ( = ?auto_22404 ?auto_22385 ) ) ( not ( = ?auto_22404 ?auto_22401 ) ) ( not ( = ?auto_22404 ?auto_22397 ) ) ( not ( = ?auto_22404 ?auto_22392 ) ) ( not ( = ?auto_22408 ?auto_22407 ) ) ( not ( = ?auto_22408 ?auto_22402 ) ) ( not ( = ?auto_22408 ?auto_22400 ) ) ( not ( = ?auto_22408 ?auto_22391 ) ) ( not ( = ?auto_22408 ?auto_22399 ) ) ( not ( = ?auto_22376 ?auto_22383 ) ) ( not ( = ?auto_22376 ?auto_22403 ) ) ( not ( = ?auto_22377 ?auto_22383 ) ) ( not ( = ?auto_22377 ?auto_22403 ) ) ( not ( = ?auto_22378 ?auto_22383 ) ) ( not ( = ?auto_22378 ?auto_22403 ) ) ( not ( = ?auto_22379 ?auto_22383 ) ) ( not ( = ?auto_22379 ?auto_22403 ) ) ( not ( = ?auto_22380 ?auto_22383 ) ) ( not ( = ?auto_22380 ?auto_22403 ) ) ( not ( = ?auto_22381 ?auto_22383 ) ) ( not ( = ?auto_22381 ?auto_22403 ) ) ( not ( = ?auto_22383 ?auto_22408 ) ) ( not ( = ?auto_22383 ?auto_22407 ) ) ( not ( = ?auto_22383 ?auto_22402 ) ) ( not ( = ?auto_22383 ?auto_22400 ) ) ( not ( = ?auto_22383 ?auto_22391 ) ) ( not ( = ?auto_22383 ?auto_22399 ) ) ( not ( = ?auto_22393 ?auto_22394 ) ) ( not ( = ?auto_22393 ?auto_22395 ) ) ( not ( = ?auto_22393 ?auto_22390 ) ) ( not ( = ?auto_22393 ?auto_22406 ) ) ( not ( = ?auto_22393 ?auto_22405 ) ) ( not ( = ?auto_22393 ?auto_22409 ) ) ( not ( = ?auto_22398 ?auto_22404 ) ) ( not ( = ?auto_22398 ?auto_22396 ) ) ( not ( = ?auto_22398 ?auto_22385 ) ) ( not ( = ?auto_22398 ?auto_22401 ) ) ( not ( = ?auto_22398 ?auto_22397 ) ) ( not ( = ?auto_22398 ?auto_22392 ) ) ( not ( = ?auto_22403 ?auto_22408 ) ) ( not ( = ?auto_22403 ?auto_22407 ) ) ( not ( = ?auto_22403 ?auto_22402 ) ) ( not ( = ?auto_22403 ?auto_22400 ) ) ( not ( = ?auto_22403 ?auto_22391 ) ) ( not ( = ?auto_22403 ?auto_22399 ) ) ( not ( = ?auto_22376 ?auto_22382 ) ) ( not ( = ?auto_22376 ?auto_22389 ) ) ( not ( = ?auto_22377 ?auto_22382 ) ) ( not ( = ?auto_22377 ?auto_22389 ) ) ( not ( = ?auto_22378 ?auto_22382 ) ) ( not ( = ?auto_22378 ?auto_22389 ) ) ( not ( = ?auto_22379 ?auto_22382 ) ) ( not ( = ?auto_22379 ?auto_22389 ) ) ( not ( = ?auto_22380 ?auto_22382 ) ) ( not ( = ?auto_22380 ?auto_22389 ) ) ( not ( = ?auto_22381 ?auto_22382 ) ) ( not ( = ?auto_22381 ?auto_22389 ) ) ( not ( = ?auto_22384 ?auto_22382 ) ) ( not ( = ?auto_22384 ?auto_22389 ) ) ( not ( = ?auto_22382 ?auto_22403 ) ) ( not ( = ?auto_22382 ?auto_22408 ) ) ( not ( = ?auto_22382 ?auto_22407 ) ) ( not ( = ?auto_22382 ?auto_22402 ) ) ( not ( = ?auto_22382 ?auto_22400 ) ) ( not ( = ?auto_22382 ?auto_22391 ) ) ( not ( = ?auto_22382 ?auto_22399 ) ) ( not ( = ?auto_22389 ?auto_22403 ) ) ( not ( = ?auto_22389 ?auto_22408 ) ) ( not ( = ?auto_22389 ?auto_22407 ) ) ( not ( = ?auto_22389 ?auto_22402 ) ) ( not ( = ?auto_22389 ?auto_22400 ) ) ( not ( = ?auto_22389 ?auto_22391 ) ) ( not ( = ?auto_22389 ?auto_22399 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_22376 ?auto_22377 ?auto_22378 ?auto_22379 ?auto_22380 ?auto_22381 ?auto_22384 ?auto_22383 )
      ( MAKE-1CRATE ?auto_22383 ?auto_22382 )
      ( MAKE-8CRATE-VERIFY ?auto_22376 ?auto_22377 ?auto_22378 ?auto_22379 ?auto_22380 ?auto_22381 ?auto_22384 ?auto_22383 ?auto_22382 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22412 - SURFACE
      ?auto_22413 - SURFACE
    )
    :vars
    (
      ?auto_22414 - HOIST
      ?auto_22415 - PLACE
      ?auto_22417 - PLACE
      ?auto_22418 - HOIST
      ?auto_22419 - SURFACE
      ?auto_22416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22414 ?auto_22415 ) ( SURFACE-AT ?auto_22412 ?auto_22415 ) ( CLEAR ?auto_22412 ) ( IS-CRATE ?auto_22413 ) ( AVAILABLE ?auto_22414 ) ( not ( = ?auto_22417 ?auto_22415 ) ) ( HOIST-AT ?auto_22418 ?auto_22417 ) ( AVAILABLE ?auto_22418 ) ( SURFACE-AT ?auto_22413 ?auto_22417 ) ( ON ?auto_22413 ?auto_22419 ) ( CLEAR ?auto_22413 ) ( TRUCK-AT ?auto_22416 ?auto_22415 ) ( not ( = ?auto_22412 ?auto_22413 ) ) ( not ( = ?auto_22412 ?auto_22419 ) ) ( not ( = ?auto_22413 ?auto_22419 ) ) ( not ( = ?auto_22414 ?auto_22418 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22416 ?auto_22415 ?auto_22417 )
      ( !LIFT ?auto_22418 ?auto_22413 ?auto_22419 ?auto_22417 )
      ( !LOAD ?auto_22418 ?auto_22413 ?auto_22416 ?auto_22417 )
      ( !DRIVE ?auto_22416 ?auto_22417 ?auto_22415 )
      ( !UNLOAD ?auto_22414 ?auto_22413 ?auto_22416 ?auto_22415 )
      ( !DROP ?auto_22414 ?auto_22413 ?auto_22412 ?auto_22415 )
      ( MAKE-1CRATE-VERIFY ?auto_22412 ?auto_22413 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_22430 - SURFACE
      ?auto_22431 - SURFACE
      ?auto_22432 - SURFACE
      ?auto_22433 - SURFACE
      ?auto_22434 - SURFACE
      ?auto_22435 - SURFACE
      ?auto_22438 - SURFACE
      ?auto_22437 - SURFACE
      ?auto_22436 - SURFACE
      ?auto_22439 - SURFACE
    )
    :vars
    (
      ?auto_22445 - HOIST
      ?auto_22440 - PLACE
      ?auto_22441 - PLACE
      ?auto_22443 - HOIST
      ?auto_22442 - SURFACE
      ?auto_22463 - PLACE
      ?auto_22458 - HOIST
      ?auto_22461 - SURFACE
      ?auto_22460 - PLACE
      ?auto_22455 - HOIST
      ?auto_22453 - SURFACE
      ?auto_22462 - PLACE
      ?auto_22454 - HOIST
      ?auto_22466 - SURFACE
      ?auto_22457 - PLACE
      ?auto_22459 - HOIST
      ?auto_22446 - SURFACE
      ?auto_22452 - SURFACE
      ?auto_22448 - PLACE
      ?auto_22450 - HOIST
      ?auto_22451 - SURFACE
      ?auto_22465 - PLACE
      ?auto_22456 - HOIST
      ?auto_22467 - SURFACE
      ?auto_22447 - PLACE
      ?auto_22464 - HOIST
      ?auto_22449 - SURFACE
      ?auto_22444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22445 ?auto_22440 ) ( IS-CRATE ?auto_22439 ) ( not ( = ?auto_22441 ?auto_22440 ) ) ( HOIST-AT ?auto_22443 ?auto_22441 ) ( AVAILABLE ?auto_22443 ) ( SURFACE-AT ?auto_22439 ?auto_22441 ) ( ON ?auto_22439 ?auto_22442 ) ( CLEAR ?auto_22439 ) ( not ( = ?auto_22436 ?auto_22439 ) ) ( not ( = ?auto_22436 ?auto_22442 ) ) ( not ( = ?auto_22439 ?auto_22442 ) ) ( not ( = ?auto_22445 ?auto_22443 ) ) ( IS-CRATE ?auto_22436 ) ( not ( = ?auto_22463 ?auto_22440 ) ) ( HOIST-AT ?auto_22458 ?auto_22463 ) ( SURFACE-AT ?auto_22436 ?auto_22463 ) ( ON ?auto_22436 ?auto_22461 ) ( CLEAR ?auto_22436 ) ( not ( = ?auto_22437 ?auto_22436 ) ) ( not ( = ?auto_22437 ?auto_22461 ) ) ( not ( = ?auto_22436 ?auto_22461 ) ) ( not ( = ?auto_22445 ?auto_22458 ) ) ( IS-CRATE ?auto_22437 ) ( not ( = ?auto_22460 ?auto_22440 ) ) ( HOIST-AT ?auto_22455 ?auto_22460 ) ( AVAILABLE ?auto_22455 ) ( SURFACE-AT ?auto_22437 ?auto_22460 ) ( ON ?auto_22437 ?auto_22453 ) ( CLEAR ?auto_22437 ) ( not ( = ?auto_22438 ?auto_22437 ) ) ( not ( = ?auto_22438 ?auto_22453 ) ) ( not ( = ?auto_22437 ?auto_22453 ) ) ( not ( = ?auto_22445 ?auto_22455 ) ) ( IS-CRATE ?auto_22438 ) ( not ( = ?auto_22462 ?auto_22440 ) ) ( HOIST-AT ?auto_22454 ?auto_22462 ) ( AVAILABLE ?auto_22454 ) ( SURFACE-AT ?auto_22438 ?auto_22462 ) ( ON ?auto_22438 ?auto_22466 ) ( CLEAR ?auto_22438 ) ( not ( = ?auto_22435 ?auto_22438 ) ) ( not ( = ?auto_22435 ?auto_22466 ) ) ( not ( = ?auto_22438 ?auto_22466 ) ) ( not ( = ?auto_22445 ?auto_22454 ) ) ( IS-CRATE ?auto_22435 ) ( not ( = ?auto_22457 ?auto_22440 ) ) ( HOIST-AT ?auto_22459 ?auto_22457 ) ( AVAILABLE ?auto_22459 ) ( SURFACE-AT ?auto_22435 ?auto_22457 ) ( ON ?auto_22435 ?auto_22446 ) ( CLEAR ?auto_22435 ) ( not ( = ?auto_22434 ?auto_22435 ) ) ( not ( = ?auto_22434 ?auto_22446 ) ) ( not ( = ?auto_22435 ?auto_22446 ) ) ( not ( = ?auto_22445 ?auto_22459 ) ) ( IS-CRATE ?auto_22434 ) ( AVAILABLE ?auto_22458 ) ( SURFACE-AT ?auto_22434 ?auto_22463 ) ( ON ?auto_22434 ?auto_22452 ) ( CLEAR ?auto_22434 ) ( not ( = ?auto_22433 ?auto_22434 ) ) ( not ( = ?auto_22433 ?auto_22452 ) ) ( not ( = ?auto_22434 ?auto_22452 ) ) ( IS-CRATE ?auto_22433 ) ( not ( = ?auto_22448 ?auto_22440 ) ) ( HOIST-AT ?auto_22450 ?auto_22448 ) ( AVAILABLE ?auto_22450 ) ( SURFACE-AT ?auto_22433 ?auto_22448 ) ( ON ?auto_22433 ?auto_22451 ) ( CLEAR ?auto_22433 ) ( not ( = ?auto_22432 ?auto_22433 ) ) ( not ( = ?auto_22432 ?auto_22451 ) ) ( not ( = ?auto_22433 ?auto_22451 ) ) ( not ( = ?auto_22445 ?auto_22450 ) ) ( IS-CRATE ?auto_22432 ) ( not ( = ?auto_22465 ?auto_22440 ) ) ( HOIST-AT ?auto_22456 ?auto_22465 ) ( AVAILABLE ?auto_22456 ) ( SURFACE-AT ?auto_22432 ?auto_22465 ) ( ON ?auto_22432 ?auto_22467 ) ( CLEAR ?auto_22432 ) ( not ( = ?auto_22431 ?auto_22432 ) ) ( not ( = ?auto_22431 ?auto_22467 ) ) ( not ( = ?auto_22432 ?auto_22467 ) ) ( not ( = ?auto_22445 ?auto_22456 ) ) ( SURFACE-AT ?auto_22430 ?auto_22440 ) ( CLEAR ?auto_22430 ) ( IS-CRATE ?auto_22431 ) ( AVAILABLE ?auto_22445 ) ( not ( = ?auto_22447 ?auto_22440 ) ) ( HOIST-AT ?auto_22464 ?auto_22447 ) ( AVAILABLE ?auto_22464 ) ( SURFACE-AT ?auto_22431 ?auto_22447 ) ( ON ?auto_22431 ?auto_22449 ) ( CLEAR ?auto_22431 ) ( TRUCK-AT ?auto_22444 ?auto_22440 ) ( not ( = ?auto_22430 ?auto_22431 ) ) ( not ( = ?auto_22430 ?auto_22449 ) ) ( not ( = ?auto_22431 ?auto_22449 ) ) ( not ( = ?auto_22445 ?auto_22464 ) ) ( not ( = ?auto_22430 ?auto_22432 ) ) ( not ( = ?auto_22430 ?auto_22467 ) ) ( not ( = ?auto_22432 ?auto_22449 ) ) ( not ( = ?auto_22465 ?auto_22447 ) ) ( not ( = ?auto_22456 ?auto_22464 ) ) ( not ( = ?auto_22467 ?auto_22449 ) ) ( not ( = ?auto_22430 ?auto_22433 ) ) ( not ( = ?auto_22430 ?auto_22451 ) ) ( not ( = ?auto_22431 ?auto_22433 ) ) ( not ( = ?auto_22431 ?auto_22451 ) ) ( not ( = ?auto_22433 ?auto_22467 ) ) ( not ( = ?auto_22433 ?auto_22449 ) ) ( not ( = ?auto_22448 ?auto_22465 ) ) ( not ( = ?auto_22448 ?auto_22447 ) ) ( not ( = ?auto_22450 ?auto_22456 ) ) ( not ( = ?auto_22450 ?auto_22464 ) ) ( not ( = ?auto_22451 ?auto_22467 ) ) ( not ( = ?auto_22451 ?auto_22449 ) ) ( not ( = ?auto_22430 ?auto_22434 ) ) ( not ( = ?auto_22430 ?auto_22452 ) ) ( not ( = ?auto_22431 ?auto_22434 ) ) ( not ( = ?auto_22431 ?auto_22452 ) ) ( not ( = ?auto_22432 ?auto_22434 ) ) ( not ( = ?auto_22432 ?auto_22452 ) ) ( not ( = ?auto_22434 ?auto_22451 ) ) ( not ( = ?auto_22434 ?auto_22467 ) ) ( not ( = ?auto_22434 ?auto_22449 ) ) ( not ( = ?auto_22463 ?auto_22448 ) ) ( not ( = ?auto_22463 ?auto_22465 ) ) ( not ( = ?auto_22463 ?auto_22447 ) ) ( not ( = ?auto_22458 ?auto_22450 ) ) ( not ( = ?auto_22458 ?auto_22456 ) ) ( not ( = ?auto_22458 ?auto_22464 ) ) ( not ( = ?auto_22452 ?auto_22451 ) ) ( not ( = ?auto_22452 ?auto_22467 ) ) ( not ( = ?auto_22452 ?auto_22449 ) ) ( not ( = ?auto_22430 ?auto_22435 ) ) ( not ( = ?auto_22430 ?auto_22446 ) ) ( not ( = ?auto_22431 ?auto_22435 ) ) ( not ( = ?auto_22431 ?auto_22446 ) ) ( not ( = ?auto_22432 ?auto_22435 ) ) ( not ( = ?auto_22432 ?auto_22446 ) ) ( not ( = ?auto_22433 ?auto_22435 ) ) ( not ( = ?auto_22433 ?auto_22446 ) ) ( not ( = ?auto_22435 ?auto_22452 ) ) ( not ( = ?auto_22435 ?auto_22451 ) ) ( not ( = ?auto_22435 ?auto_22467 ) ) ( not ( = ?auto_22435 ?auto_22449 ) ) ( not ( = ?auto_22457 ?auto_22463 ) ) ( not ( = ?auto_22457 ?auto_22448 ) ) ( not ( = ?auto_22457 ?auto_22465 ) ) ( not ( = ?auto_22457 ?auto_22447 ) ) ( not ( = ?auto_22459 ?auto_22458 ) ) ( not ( = ?auto_22459 ?auto_22450 ) ) ( not ( = ?auto_22459 ?auto_22456 ) ) ( not ( = ?auto_22459 ?auto_22464 ) ) ( not ( = ?auto_22446 ?auto_22452 ) ) ( not ( = ?auto_22446 ?auto_22451 ) ) ( not ( = ?auto_22446 ?auto_22467 ) ) ( not ( = ?auto_22446 ?auto_22449 ) ) ( not ( = ?auto_22430 ?auto_22438 ) ) ( not ( = ?auto_22430 ?auto_22466 ) ) ( not ( = ?auto_22431 ?auto_22438 ) ) ( not ( = ?auto_22431 ?auto_22466 ) ) ( not ( = ?auto_22432 ?auto_22438 ) ) ( not ( = ?auto_22432 ?auto_22466 ) ) ( not ( = ?auto_22433 ?auto_22438 ) ) ( not ( = ?auto_22433 ?auto_22466 ) ) ( not ( = ?auto_22434 ?auto_22438 ) ) ( not ( = ?auto_22434 ?auto_22466 ) ) ( not ( = ?auto_22438 ?auto_22446 ) ) ( not ( = ?auto_22438 ?auto_22452 ) ) ( not ( = ?auto_22438 ?auto_22451 ) ) ( not ( = ?auto_22438 ?auto_22467 ) ) ( not ( = ?auto_22438 ?auto_22449 ) ) ( not ( = ?auto_22462 ?auto_22457 ) ) ( not ( = ?auto_22462 ?auto_22463 ) ) ( not ( = ?auto_22462 ?auto_22448 ) ) ( not ( = ?auto_22462 ?auto_22465 ) ) ( not ( = ?auto_22462 ?auto_22447 ) ) ( not ( = ?auto_22454 ?auto_22459 ) ) ( not ( = ?auto_22454 ?auto_22458 ) ) ( not ( = ?auto_22454 ?auto_22450 ) ) ( not ( = ?auto_22454 ?auto_22456 ) ) ( not ( = ?auto_22454 ?auto_22464 ) ) ( not ( = ?auto_22466 ?auto_22446 ) ) ( not ( = ?auto_22466 ?auto_22452 ) ) ( not ( = ?auto_22466 ?auto_22451 ) ) ( not ( = ?auto_22466 ?auto_22467 ) ) ( not ( = ?auto_22466 ?auto_22449 ) ) ( not ( = ?auto_22430 ?auto_22437 ) ) ( not ( = ?auto_22430 ?auto_22453 ) ) ( not ( = ?auto_22431 ?auto_22437 ) ) ( not ( = ?auto_22431 ?auto_22453 ) ) ( not ( = ?auto_22432 ?auto_22437 ) ) ( not ( = ?auto_22432 ?auto_22453 ) ) ( not ( = ?auto_22433 ?auto_22437 ) ) ( not ( = ?auto_22433 ?auto_22453 ) ) ( not ( = ?auto_22434 ?auto_22437 ) ) ( not ( = ?auto_22434 ?auto_22453 ) ) ( not ( = ?auto_22435 ?auto_22437 ) ) ( not ( = ?auto_22435 ?auto_22453 ) ) ( not ( = ?auto_22437 ?auto_22466 ) ) ( not ( = ?auto_22437 ?auto_22446 ) ) ( not ( = ?auto_22437 ?auto_22452 ) ) ( not ( = ?auto_22437 ?auto_22451 ) ) ( not ( = ?auto_22437 ?auto_22467 ) ) ( not ( = ?auto_22437 ?auto_22449 ) ) ( not ( = ?auto_22460 ?auto_22462 ) ) ( not ( = ?auto_22460 ?auto_22457 ) ) ( not ( = ?auto_22460 ?auto_22463 ) ) ( not ( = ?auto_22460 ?auto_22448 ) ) ( not ( = ?auto_22460 ?auto_22465 ) ) ( not ( = ?auto_22460 ?auto_22447 ) ) ( not ( = ?auto_22455 ?auto_22454 ) ) ( not ( = ?auto_22455 ?auto_22459 ) ) ( not ( = ?auto_22455 ?auto_22458 ) ) ( not ( = ?auto_22455 ?auto_22450 ) ) ( not ( = ?auto_22455 ?auto_22456 ) ) ( not ( = ?auto_22455 ?auto_22464 ) ) ( not ( = ?auto_22453 ?auto_22466 ) ) ( not ( = ?auto_22453 ?auto_22446 ) ) ( not ( = ?auto_22453 ?auto_22452 ) ) ( not ( = ?auto_22453 ?auto_22451 ) ) ( not ( = ?auto_22453 ?auto_22467 ) ) ( not ( = ?auto_22453 ?auto_22449 ) ) ( not ( = ?auto_22430 ?auto_22436 ) ) ( not ( = ?auto_22430 ?auto_22461 ) ) ( not ( = ?auto_22431 ?auto_22436 ) ) ( not ( = ?auto_22431 ?auto_22461 ) ) ( not ( = ?auto_22432 ?auto_22436 ) ) ( not ( = ?auto_22432 ?auto_22461 ) ) ( not ( = ?auto_22433 ?auto_22436 ) ) ( not ( = ?auto_22433 ?auto_22461 ) ) ( not ( = ?auto_22434 ?auto_22436 ) ) ( not ( = ?auto_22434 ?auto_22461 ) ) ( not ( = ?auto_22435 ?auto_22436 ) ) ( not ( = ?auto_22435 ?auto_22461 ) ) ( not ( = ?auto_22438 ?auto_22436 ) ) ( not ( = ?auto_22438 ?auto_22461 ) ) ( not ( = ?auto_22436 ?auto_22453 ) ) ( not ( = ?auto_22436 ?auto_22466 ) ) ( not ( = ?auto_22436 ?auto_22446 ) ) ( not ( = ?auto_22436 ?auto_22452 ) ) ( not ( = ?auto_22436 ?auto_22451 ) ) ( not ( = ?auto_22436 ?auto_22467 ) ) ( not ( = ?auto_22436 ?auto_22449 ) ) ( not ( = ?auto_22461 ?auto_22453 ) ) ( not ( = ?auto_22461 ?auto_22466 ) ) ( not ( = ?auto_22461 ?auto_22446 ) ) ( not ( = ?auto_22461 ?auto_22452 ) ) ( not ( = ?auto_22461 ?auto_22451 ) ) ( not ( = ?auto_22461 ?auto_22467 ) ) ( not ( = ?auto_22461 ?auto_22449 ) ) ( not ( = ?auto_22430 ?auto_22439 ) ) ( not ( = ?auto_22430 ?auto_22442 ) ) ( not ( = ?auto_22431 ?auto_22439 ) ) ( not ( = ?auto_22431 ?auto_22442 ) ) ( not ( = ?auto_22432 ?auto_22439 ) ) ( not ( = ?auto_22432 ?auto_22442 ) ) ( not ( = ?auto_22433 ?auto_22439 ) ) ( not ( = ?auto_22433 ?auto_22442 ) ) ( not ( = ?auto_22434 ?auto_22439 ) ) ( not ( = ?auto_22434 ?auto_22442 ) ) ( not ( = ?auto_22435 ?auto_22439 ) ) ( not ( = ?auto_22435 ?auto_22442 ) ) ( not ( = ?auto_22438 ?auto_22439 ) ) ( not ( = ?auto_22438 ?auto_22442 ) ) ( not ( = ?auto_22437 ?auto_22439 ) ) ( not ( = ?auto_22437 ?auto_22442 ) ) ( not ( = ?auto_22439 ?auto_22461 ) ) ( not ( = ?auto_22439 ?auto_22453 ) ) ( not ( = ?auto_22439 ?auto_22466 ) ) ( not ( = ?auto_22439 ?auto_22446 ) ) ( not ( = ?auto_22439 ?auto_22452 ) ) ( not ( = ?auto_22439 ?auto_22451 ) ) ( not ( = ?auto_22439 ?auto_22467 ) ) ( not ( = ?auto_22439 ?auto_22449 ) ) ( not ( = ?auto_22441 ?auto_22463 ) ) ( not ( = ?auto_22441 ?auto_22460 ) ) ( not ( = ?auto_22441 ?auto_22462 ) ) ( not ( = ?auto_22441 ?auto_22457 ) ) ( not ( = ?auto_22441 ?auto_22448 ) ) ( not ( = ?auto_22441 ?auto_22465 ) ) ( not ( = ?auto_22441 ?auto_22447 ) ) ( not ( = ?auto_22443 ?auto_22458 ) ) ( not ( = ?auto_22443 ?auto_22455 ) ) ( not ( = ?auto_22443 ?auto_22454 ) ) ( not ( = ?auto_22443 ?auto_22459 ) ) ( not ( = ?auto_22443 ?auto_22450 ) ) ( not ( = ?auto_22443 ?auto_22456 ) ) ( not ( = ?auto_22443 ?auto_22464 ) ) ( not ( = ?auto_22442 ?auto_22461 ) ) ( not ( = ?auto_22442 ?auto_22453 ) ) ( not ( = ?auto_22442 ?auto_22466 ) ) ( not ( = ?auto_22442 ?auto_22446 ) ) ( not ( = ?auto_22442 ?auto_22452 ) ) ( not ( = ?auto_22442 ?auto_22451 ) ) ( not ( = ?auto_22442 ?auto_22467 ) ) ( not ( = ?auto_22442 ?auto_22449 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_22430 ?auto_22431 ?auto_22432 ?auto_22433 ?auto_22434 ?auto_22435 ?auto_22438 ?auto_22437 ?auto_22436 )
      ( MAKE-1CRATE ?auto_22436 ?auto_22439 )
      ( MAKE-9CRATE-VERIFY ?auto_22430 ?auto_22431 ?auto_22432 ?auto_22433 ?auto_22434 ?auto_22435 ?auto_22438 ?auto_22437 ?auto_22436 ?auto_22439 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22470 - SURFACE
      ?auto_22471 - SURFACE
    )
    :vars
    (
      ?auto_22472 - HOIST
      ?auto_22473 - PLACE
      ?auto_22475 - PLACE
      ?auto_22476 - HOIST
      ?auto_22477 - SURFACE
      ?auto_22474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22472 ?auto_22473 ) ( SURFACE-AT ?auto_22470 ?auto_22473 ) ( CLEAR ?auto_22470 ) ( IS-CRATE ?auto_22471 ) ( AVAILABLE ?auto_22472 ) ( not ( = ?auto_22475 ?auto_22473 ) ) ( HOIST-AT ?auto_22476 ?auto_22475 ) ( AVAILABLE ?auto_22476 ) ( SURFACE-AT ?auto_22471 ?auto_22475 ) ( ON ?auto_22471 ?auto_22477 ) ( CLEAR ?auto_22471 ) ( TRUCK-AT ?auto_22474 ?auto_22473 ) ( not ( = ?auto_22470 ?auto_22471 ) ) ( not ( = ?auto_22470 ?auto_22477 ) ) ( not ( = ?auto_22471 ?auto_22477 ) ) ( not ( = ?auto_22472 ?auto_22476 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22474 ?auto_22473 ?auto_22475 )
      ( !LIFT ?auto_22476 ?auto_22471 ?auto_22477 ?auto_22475 )
      ( !LOAD ?auto_22476 ?auto_22471 ?auto_22474 ?auto_22475 )
      ( !DRIVE ?auto_22474 ?auto_22475 ?auto_22473 )
      ( !UNLOAD ?auto_22472 ?auto_22471 ?auto_22474 ?auto_22473 )
      ( !DROP ?auto_22472 ?auto_22471 ?auto_22470 ?auto_22473 )
      ( MAKE-1CRATE-VERIFY ?auto_22470 ?auto_22471 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_22489 - SURFACE
      ?auto_22490 - SURFACE
      ?auto_22491 - SURFACE
      ?auto_22492 - SURFACE
      ?auto_22493 - SURFACE
      ?auto_22494 - SURFACE
      ?auto_22497 - SURFACE
      ?auto_22496 - SURFACE
      ?auto_22495 - SURFACE
      ?auto_22498 - SURFACE
      ?auto_22499 - SURFACE
    )
    :vars
    (
      ?auto_22502 - HOIST
      ?auto_22504 - PLACE
      ?auto_22501 - PLACE
      ?auto_22505 - HOIST
      ?auto_22503 - SURFACE
      ?auto_22510 - PLACE
      ?auto_22508 - HOIST
      ?auto_22509 - SURFACE
      ?auto_22528 - SURFACE
      ?auto_22523 - PLACE
      ?auto_22526 - HOIST
      ?auto_22513 - SURFACE
      ?auto_22506 - PLACE
      ?auto_22519 - HOIST
      ?auto_22525 - SURFACE
      ?auto_22527 - PLACE
      ?auto_22512 - HOIST
      ?auto_22517 - SURFACE
      ?auto_22514 - SURFACE
      ?auto_22520 - PLACE
      ?auto_22516 - HOIST
      ?auto_22515 - SURFACE
      ?auto_22524 - PLACE
      ?auto_22521 - HOIST
      ?auto_22511 - SURFACE
      ?auto_22518 - PLACE
      ?auto_22522 - HOIST
      ?auto_22507 - SURFACE
      ?auto_22500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22502 ?auto_22504 ) ( IS-CRATE ?auto_22499 ) ( not ( = ?auto_22501 ?auto_22504 ) ) ( HOIST-AT ?auto_22505 ?auto_22501 ) ( SURFACE-AT ?auto_22499 ?auto_22501 ) ( ON ?auto_22499 ?auto_22503 ) ( CLEAR ?auto_22499 ) ( not ( = ?auto_22498 ?auto_22499 ) ) ( not ( = ?auto_22498 ?auto_22503 ) ) ( not ( = ?auto_22499 ?auto_22503 ) ) ( not ( = ?auto_22502 ?auto_22505 ) ) ( IS-CRATE ?auto_22498 ) ( not ( = ?auto_22510 ?auto_22504 ) ) ( HOIST-AT ?auto_22508 ?auto_22510 ) ( AVAILABLE ?auto_22508 ) ( SURFACE-AT ?auto_22498 ?auto_22510 ) ( ON ?auto_22498 ?auto_22509 ) ( CLEAR ?auto_22498 ) ( not ( = ?auto_22495 ?auto_22498 ) ) ( not ( = ?auto_22495 ?auto_22509 ) ) ( not ( = ?auto_22498 ?auto_22509 ) ) ( not ( = ?auto_22502 ?auto_22508 ) ) ( IS-CRATE ?auto_22495 ) ( SURFACE-AT ?auto_22495 ?auto_22501 ) ( ON ?auto_22495 ?auto_22528 ) ( CLEAR ?auto_22495 ) ( not ( = ?auto_22496 ?auto_22495 ) ) ( not ( = ?auto_22496 ?auto_22528 ) ) ( not ( = ?auto_22495 ?auto_22528 ) ) ( IS-CRATE ?auto_22496 ) ( not ( = ?auto_22523 ?auto_22504 ) ) ( HOIST-AT ?auto_22526 ?auto_22523 ) ( AVAILABLE ?auto_22526 ) ( SURFACE-AT ?auto_22496 ?auto_22523 ) ( ON ?auto_22496 ?auto_22513 ) ( CLEAR ?auto_22496 ) ( not ( = ?auto_22497 ?auto_22496 ) ) ( not ( = ?auto_22497 ?auto_22513 ) ) ( not ( = ?auto_22496 ?auto_22513 ) ) ( not ( = ?auto_22502 ?auto_22526 ) ) ( IS-CRATE ?auto_22497 ) ( not ( = ?auto_22506 ?auto_22504 ) ) ( HOIST-AT ?auto_22519 ?auto_22506 ) ( AVAILABLE ?auto_22519 ) ( SURFACE-AT ?auto_22497 ?auto_22506 ) ( ON ?auto_22497 ?auto_22525 ) ( CLEAR ?auto_22497 ) ( not ( = ?auto_22494 ?auto_22497 ) ) ( not ( = ?auto_22494 ?auto_22525 ) ) ( not ( = ?auto_22497 ?auto_22525 ) ) ( not ( = ?auto_22502 ?auto_22519 ) ) ( IS-CRATE ?auto_22494 ) ( not ( = ?auto_22527 ?auto_22504 ) ) ( HOIST-AT ?auto_22512 ?auto_22527 ) ( AVAILABLE ?auto_22512 ) ( SURFACE-AT ?auto_22494 ?auto_22527 ) ( ON ?auto_22494 ?auto_22517 ) ( CLEAR ?auto_22494 ) ( not ( = ?auto_22493 ?auto_22494 ) ) ( not ( = ?auto_22493 ?auto_22517 ) ) ( not ( = ?auto_22494 ?auto_22517 ) ) ( not ( = ?auto_22502 ?auto_22512 ) ) ( IS-CRATE ?auto_22493 ) ( AVAILABLE ?auto_22505 ) ( SURFACE-AT ?auto_22493 ?auto_22501 ) ( ON ?auto_22493 ?auto_22514 ) ( CLEAR ?auto_22493 ) ( not ( = ?auto_22492 ?auto_22493 ) ) ( not ( = ?auto_22492 ?auto_22514 ) ) ( not ( = ?auto_22493 ?auto_22514 ) ) ( IS-CRATE ?auto_22492 ) ( not ( = ?auto_22520 ?auto_22504 ) ) ( HOIST-AT ?auto_22516 ?auto_22520 ) ( AVAILABLE ?auto_22516 ) ( SURFACE-AT ?auto_22492 ?auto_22520 ) ( ON ?auto_22492 ?auto_22515 ) ( CLEAR ?auto_22492 ) ( not ( = ?auto_22491 ?auto_22492 ) ) ( not ( = ?auto_22491 ?auto_22515 ) ) ( not ( = ?auto_22492 ?auto_22515 ) ) ( not ( = ?auto_22502 ?auto_22516 ) ) ( IS-CRATE ?auto_22491 ) ( not ( = ?auto_22524 ?auto_22504 ) ) ( HOIST-AT ?auto_22521 ?auto_22524 ) ( AVAILABLE ?auto_22521 ) ( SURFACE-AT ?auto_22491 ?auto_22524 ) ( ON ?auto_22491 ?auto_22511 ) ( CLEAR ?auto_22491 ) ( not ( = ?auto_22490 ?auto_22491 ) ) ( not ( = ?auto_22490 ?auto_22511 ) ) ( not ( = ?auto_22491 ?auto_22511 ) ) ( not ( = ?auto_22502 ?auto_22521 ) ) ( SURFACE-AT ?auto_22489 ?auto_22504 ) ( CLEAR ?auto_22489 ) ( IS-CRATE ?auto_22490 ) ( AVAILABLE ?auto_22502 ) ( not ( = ?auto_22518 ?auto_22504 ) ) ( HOIST-AT ?auto_22522 ?auto_22518 ) ( AVAILABLE ?auto_22522 ) ( SURFACE-AT ?auto_22490 ?auto_22518 ) ( ON ?auto_22490 ?auto_22507 ) ( CLEAR ?auto_22490 ) ( TRUCK-AT ?auto_22500 ?auto_22504 ) ( not ( = ?auto_22489 ?auto_22490 ) ) ( not ( = ?auto_22489 ?auto_22507 ) ) ( not ( = ?auto_22490 ?auto_22507 ) ) ( not ( = ?auto_22502 ?auto_22522 ) ) ( not ( = ?auto_22489 ?auto_22491 ) ) ( not ( = ?auto_22489 ?auto_22511 ) ) ( not ( = ?auto_22491 ?auto_22507 ) ) ( not ( = ?auto_22524 ?auto_22518 ) ) ( not ( = ?auto_22521 ?auto_22522 ) ) ( not ( = ?auto_22511 ?auto_22507 ) ) ( not ( = ?auto_22489 ?auto_22492 ) ) ( not ( = ?auto_22489 ?auto_22515 ) ) ( not ( = ?auto_22490 ?auto_22492 ) ) ( not ( = ?auto_22490 ?auto_22515 ) ) ( not ( = ?auto_22492 ?auto_22511 ) ) ( not ( = ?auto_22492 ?auto_22507 ) ) ( not ( = ?auto_22520 ?auto_22524 ) ) ( not ( = ?auto_22520 ?auto_22518 ) ) ( not ( = ?auto_22516 ?auto_22521 ) ) ( not ( = ?auto_22516 ?auto_22522 ) ) ( not ( = ?auto_22515 ?auto_22511 ) ) ( not ( = ?auto_22515 ?auto_22507 ) ) ( not ( = ?auto_22489 ?auto_22493 ) ) ( not ( = ?auto_22489 ?auto_22514 ) ) ( not ( = ?auto_22490 ?auto_22493 ) ) ( not ( = ?auto_22490 ?auto_22514 ) ) ( not ( = ?auto_22491 ?auto_22493 ) ) ( not ( = ?auto_22491 ?auto_22514 ) ) ( not ( = ?auto_22493 ?auto_22515 ) ) ( not ( = ?auto_22493 ?auto_22511 ) ) ( not ( = ?auto_22493 ?auto_22507 ) ) ( not ( = ?auto_22501 ?auto_22520 ) ) ( not ( = ?auto_22501 ?auto_22524 ) ) ( not ( = ?auto_22501 ?auto_22518 ) ) ( not ( = ?auto_22505 ?auto_22516 ) ) ( not ( = ?auto_22505 ?auto_22521 ) ) ( not ( = ?auto_22505 ?auto_22522 ) ) ( not ( = ?auto_22514 ?auto_22515 ) ) ( not ( = ?auto_22514 ?auto_22511 ) ) ( not ( = ?auto_22514 ?auto_22507 ) ) ( not ( = ?auto_22489 ?auto_22494 ) ) ( not ( = ?auto_22489 ?auto_22517 ) ) ( not ( = ?auto_22490 ?auto_22494 ) ) ( not ( = ?auto_22490 ?auto_22517 ) ) ( not ( = ?auto_22491 ?auto_22494 ) ) ( not ( = ?auto_22491 ?auto_22517 ) ) ( not ( = ?auto_22492 ?auto_22494 ) ) ( not ( = ?auto_22492 ?auto_22517 ) ) ( not ( = ?auto_22494 ?auto_22514 ) ) ( not ( = ?auto_22494 ?auto_22515 ) ) ( not ( = ?auto_22494 ?auto_22511 ) ) ( not ( = ?auto_22494 ?auto_22507 ) ) ( not ( = ?auto_22527 ?auto_22501 ) ) ( not ( = ?auto_22527 ?auto_22520 ) ) ( not ( = ?auto_22527 ?auto_22524 ) ) ( not ( = ?auto_22527 ?auto_22518 ) ) ( not ( = ?auto_22512 ?auto_22505 ) ) ( not ( = ?auto_22512 ?auto_22516 ) ) ( not ( = ?auto_22512 ?auto_22521 ) ) ( not ( = ?auto_22512 ?auto_22522 ) ) ( not ( = ?auto_22517 ?auto_22514 ) ) ( not ( = ?auto_22517 ?auto_22515 ) ) ( not ( = ?auto_22517 ?auto_22511 ) ) ( not ( = ?auto_22517 ?auto_22507 ) ) ( not ( = ?auto_22489 ?auto_22497 ) ) ( not ( = ?auto_22489 ?auto_22525 ) ) ( not ( = ?auto_22490 ?auto_22497 ) ) ( not ( = ?auto_22490 ?auto_22525 ) ) ( not ( = ?auto_22491 ?auto_22497 ) ) ( not ( = ?auto_22491 ?auto_22525 ) ) ( not ( = ?auto_22492 ?auto_22497 ) ) ( not ( = ?auto_22492 ?auto_22525 ) ) ( not ( = ?auto_22493 ?auto_22497 ) ) ( not ( = ?auto_22493 ?auto_22525 ) ) ( not ( = ?auto_22497 ?auto_22517 ) ) ( not ( = ?auto_22497 ?auto_22514 ) ) ( not ( = ?auto_22497 ?auto_22515 ) ) ( not ( = ?auto_22497 ?auto_22511 ) ) ( not ( = ?auto_22497 ?auto_22507 ) ) ( not ( = ?auto_22506 ?auto_22527 ) ) ( not ( = ?auto_22506 ?auto_22501 ) ) ( not ( = ?auto_22506 ?auto_22520 ) ) ( not ( = ?auto_22506 ?auto_22524 ) ) ( not ( = ?auto_22506 ?auto_22518 ) ) ( not ( = ?auto_22519 ?auto_22512 ) ) ( not ( = ?auto_22519 ?auto_22505 ) ) ( not ( = ?auto_22519 ?auto_22516 ) ) ( not ( = ?auto_22519 ?auto_22521 ) ) ( not ( = ?auto_22519 ?auto_22522 ) ) ( not ( = ?auto_22525 ?auto_22517 ) ) ( not ( = ?auto_22525 ?auto_22514 ) ) ( not ( = ?auto_22525 ?auto_22515 ) ) ( not ( = ?auto_22525 ?auto_22511 ) ) ( not ( = ?auto_22525 ?auto_22507 ) ) ( not ( = ?auto_22489 ?auto_22496 ) ) ( not ( = ?auto_22489 ?auto_22513 ) ) ( not ( = ?auto_22490 ?auto_22496 ) ) ( not ( = ?auto_22490 ?auto_22513 ) ) ( not ( = ?auto_22491 ?auto_22496 ) ) ( not ( = ?auto_22491 ?auto_22513 ) ) ( not ( = ?auto_22492 ?auto_22496 ) ) ( not ( = ?auto_22492 ?auto_22513 ) ) ( not ( = ?auto_22493 ?auto_22496 ) ) ( not ( = ?auto_22493 ?auto_22513 ) ) ( not ( = ?auto_22494 ?auto_22496 ) ) ( not ( = ?auto_22494 ?auto_22513 ) ) ( not ( = ?auto_22496 ?auto_22525 ) ) ( not ( = ?auto_22496 ?auto_22517 ) ) ( not ( = ?auto_22496 ?auto_22514 ) ) ( not ( = ?auto_22496 ?auto_22515 ) ) ( not ( = ?auto_22496 ?auto_22511 ) ) ( not ( = ?auto_22496 ?auto_22507 ) ) ( not ( = ?auto_22523 ?auto_22506 ) ) ( not ( = ?auto_22523 ?auto_22527 ) ) ( not ( = ?auto_22523 ?auto_22501 ) ) ( not ( = ?auto_22523 ?auto_22520 ) ) ( not ( = ?auto_22523 ?auto_22524 ) ) ( not ( = ?auto_22523 ?auto_22518 ) ) ( not ( = ?auto_22526 ?auto_22519 ) ) ( not ( = ?auto_22526 ?auto_22512 ) ) ( not ( = ?auto_22526 ?auto_22505 ) ) ( not ( = ?auto_22526 ?auto_22516 ) ) ( not ( = ?auto_22526 ?auto_22521 ) ) ( not ( = ?auto_22526 ?auto_22522 ) ) ( not ( = ?auto_22513 ?auto_22525 ) ) ( not ( = ?auto_22513 ?auto_22517 ) ) ( not ( = ?auto_22513 ?auto_22514 ) ) ( not ( = ?auto_22513 ?auto_22515 ) ) ( not ( = ?auto_22513 ?auto_22511 ) ) ( not ( = ?auto_22513 ?auto_22507 ) ) ( not ( = ?auto_22489 ?auto_22495 ) ) ( not ( = ?auto_22489 ?auto_22528 ) ) ( not ( = ?auto_22490 ?auto_22495 ) ) ( not ( = ?auto_22490 ?auto_22528 ) ) ( not ( = ?auto_22491 ?auto_22495 ) ) ( not ( = ?auto_22491 ?auto_22528 ) ) ( not ( = ?auto_22492 ?auto_22495 ) ) ( not ( = ?auto_22492 ?auto_22528 ) ) ( not ( = ?auto_22493 ?auto_22495 ) ) ( not ( = ?auto_22493 ?auto_22528 ) ) ( not ( = ?auto_22494 ?auto_22495 ) ) ( not ( = ?auto_22494 ?auto_22528 ) ) ( not ( = ?auto_22497 ?auto_22495 ) ) ( not ( = ?auto_22497 ?auto_22528 ) ) ( not ( = ?auto_22495 ?auto_22513 ) ) ( not ( = ?auto_22495 ?auto_22525 ) ) ( not ( = ?auto_22495 ?auto_22517 ) ) ( not ( = ?auto_22495 ?auto_22514 ) ) ( not ( = ?auto_22495 ?auto_22515 ) ) ( not ( = ?auto_22495 ?auto_22511 ) ) ( not ( = ?auto_22495 ?auto_22507 ) ) ( not ( = ?auto_22528 ?auto_22513 ) ) ( not ( = ?auto_22528 ?auto_22525 ) ) ( not ( = ?auto_22528 ?auto_22517 ) ) ( not ( = ?auto_22528 ?auto_22514 ) ) ( not ( = ?auto_22528 ?auto_22515 ) ) ( not ( = ?auto_22528 ?auto_22511 ) ) ( not ( = ?auto_22528 ?auto_22507 ) ) ( not ( = ?auto_22489 ?auto_22498 ) ) ( not ( = ?auto_22489 ?auto_22509 ) ) ( not ( = ?auto_22490 ?auto_22498 ) ) ( not ( = ?auto_22490 ?auto_22509 ) ) ( not ( = ?auto_22491 ?auto_22498 ) ) ( not ( = ?auto_22491 ?auto_22509 ) ) ( not ( = ?auto_22492 ?auto_22498 ) ) ( not ( = ?auto_22492 ?auto_22509 ) ) ( not ( = ?auto_22493 ?auto_22498 ) ) ( not ( = ?auto_22493 ?auto_22509 ) ) ( not ( = ?auto_22494 ?auto_22498 ) ) ( not ( = ?auto_22494 ?auto_22509 ) ) ( not ( = ?auto_22497 ?auto_22498 ) ) ( not ( = ?auto_22497 ?auto_22509 ) ) ( not ( = ?auto_22496 ?auto_22498 ) ) ( not ( = ?auto_22496 ?auto_22509 ) ) ( not ( = ?auto_22498 ?auto_22528 ) ) ( not ( = ?auto_22498 ?auto_22513 ) ) ( not ( = ?auto_22498 ?auto_22525 ) ) ( not ( = ?auto_22498 ?auto_22517 ) ) ( not ( = ?auto_22498 ?auto_22514 ) ) ( not ( = ?auto_22498 ?auto_22515 ) ) ( not ( = ?auto_22498 ?auto_22511 ) ) ( not ( = ?auto_22498 ?auto_22507 ) ) ( not ( = ?auto_22510 ?auto_22501 ) ) ( not ( = ?auto_22510 ?auto_22523 ) ) ( not ( = ?auto_22510 ?auto_22506 ) ) ( not ( = ?auto_22510 ?auto_22527 ) ) ( not ( = ?auto_22510 ?auto_22520 ) ) ( not ( = ?auto_22510 ?auto_22524 ) ) ( not ( = ?auto_22510 ?auto_22518 ) ) ( not ( = ?auto_22508 ?auto_22505 ) ) ( not ( = ?auto_22508 ?auto_22526 ) ) ( not ( = ?auto_22508 ?auto_22519 ) ) ( not ( = ?auto_22508 ?auto_22512 ) ) ( not ( = ?auto_22508 ?auto_22516 ) ) ( not ( = ?auto_22508 ?auto_22521 ) ) ( not ( = ?auto_22508 ?auto_22522 ) ) ( not ( = ?auto_22509 ?auto_22528 ) ) ( not ( = ?auto_22509 ?auto_22513 ) ) ( not ( = ?auto_22509 ?auto_22525 ) ) ( not ( = ?auto_22509 ?auto_22517 ) ) ( not ( = ?auto_22509 ?auto_22514 ) ) ( not ( = ?auto_22509 ?auto_22515 ) ) ( not ( = ?auto_22509 ?auto_22511 ) ) ( not ( = ?auto_22509 ?auto_22507 ) ) ( not ( = ?auto_22489 ?auto_22499 ) ) ( not ( = ?auto_22489 ?auto_22503 ) ) ( not ( = ?auto_22490 ?auto_22499 ) ) ( not ( = ?auto_22490 ?auto_22503 ) ) ( not ( = ?auto_22491 ?auto_22499 ) ) ( not ( = ?auto_22491 ?auto_22503 ) ) ( not ( = ?auto_22492 ?auto_22499 ) ) ( not ( = ?auto_22492 ?auto_22503 ) ) ( not ( = ?auto_22493 ?auto_22499 ) ) ( not ( = ?auto_22493 ?auto_22503 ) ) ( not ( = ?auto_22494 ?auto_22499 ) ) ( not ( = ?auto_22494 ?auto_22503 ) ) ( not ( = ?auto_22497 ?auto_22499 ) ) ( not ( = ?auto_22497 ?auto_22503 ) ) ( not ( = ?auto_22496 ?auto_22499 ) ) ( not ( = ?auto_22496 ?auto_22503 ) ) ( not ( = ?auto_22495 ?auto_22499 ) ) ( not ( = ?auto_22495 ?auto_22503 ) ) ( not ( = ?auto_22499 ?auto_22509 ) ) ( not ( = ?auto_22499 ?auto_22528 ) ) ( not ( = ?auto_22499 ?auto_22513 ) ) ( not ( = ?auto_22499 ?auto_22525 ) ) ( not ( = ?auto_22499 ?auto_22517 ) ) ( not ( = ?auto_22499 ?auto_22514 ) ) ( not ( = ?auto_22499 ?auto_22515 ) ) ( not ( = ?auto_22499 ?auto_22511 ) ) ( not ( = ?auto_22499 ?auto_22507 ) ) ( not ( = ?auto_22503 ?auto_22509 ) ) ( not ( = ?auto_22503 ?auto_22528 ) ) ( not ( = ?auto_22503 ?auto_22513 ) ) ( not ( = ?auto_22503 ?auto_22525 ) ) ( not ( = ?auto_22503 ?auto_22517 ) ) ( not ( = ?auto_22503 ?auto_22514 ) ) ( not ( = ?auto_22503 ?auto_22515 ) ) ( not ( = ?auto_22503 ?auto_22511 ) ) ( not ( = ?auto_22503 ?auto_22507 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_22489 ?auto_22490 ?auto_22491 ?auto_22492 ?auto_22493 ?auto_22494 ?auto_22497 ?auto_22496 ?auto_22495 ?auto_22498 )
      ( MAKE-1CRATE ?auto_22498 ?auto_22499 )
      ( MAKE-10CRATE-VERIFY ?auto_22489 ?auto_22490 ?auto_22491 ?auto_22492 ?auto_22493 ?auto_22494 ?auto_22497 ?auto_22496 ?auto_22495 ?auto_22498 ?auto_22499 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22531 - SURFACE
      ?auto_22532 - SURFACE
    )
    :vars
    (
      ?auto_22533 - HOIST
      ?auto_22534 - PLACE
      ?auto_22536 - PLACE
      ?auto_22537 - HOIST
      ?auto_22538 - SURFACE
      ?auto_22535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22533 ?auto_22534 ) ( SURFACE-AT ?auto_22531 ?auto_22534 ) ( CLEAR ?auto_22531 ) ( IS-CRATE ?auto_22532 ) ( AVAILABLE ?auto_22533 ) ( not ( = ?auto_22536 ?auto_22534 ) ) ( HOIST-AT ?auto_22537 ?auto_22536 ) ( AVAILABLE ?auto_22537 ) ( SURFACE-AT ?auto_22532 ?auto_22536 ) ( ON ?auto_22532 ?auto_22538 ) ( CLEAR ?auto_22532 ) ( TRUCK-AT ?auto_22535 ?auto_22534 ) ( not ( = ?auto_22531 ?auto_22532 ) ) ( not ( = ?auto_22531 ?auto_22538 ) ) ( not ( = ?auto_22532 ?auto_22538 ) ) ( not ( = ?auto_22533 ?auto_22537 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22535 ?auto_22534 ?auto_22536 )
      ( !LIFT ?auto_22537 ?auto_22532 ?auto_22538 ?auto_22536 )
      ( !LOAD ?auto_22537 ?auto_22532 ?auto_22535 ?auto_22536 )
      ( !DRIVE ?auto_22535 ?auto_22536 ?auto_22534 )
      ( !UNLOAD ?auto_22533 ?auto_22532 ?auto_22535 ?auto_22534 )
      ( !DROP ?auto_22533 ?auto_22532 ?auto_22531 ?auto_22534 )
      ( MAKE-1CRATE-VERIFY ?auto_22531 ?auto_22532 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_22551 - SURFACE
      ?auto_22552 - SURFACE
      ?auto_22553 - SURFACE
      ?auto_22554 - SURFACE
      ?auto_22555 - SURFACE
      ?auto_22556 - SURFACE
      ?auto_22559 - SURFACE
      ?auto_22558 - SURFACE
      ?auto_22557 - SURFACE
      ?auto_22560 - SURFACE
      ?auto_22562 - SURFACE
      ?auto_22561 - SURFACE
    )
    :vars
    (
      ?auto_22565 - HOIST
      ?auto_22563 - PLACE
      ?auto_22567 - PLACE
      ?auto_22566 - HOIST
      ?auto_22564 - SURFACE
      ?auto_22573 - PLACE
      ?auto_22579 - HOIST
      ?auto_22584 - SURFACE
      ?auto_22592 - PLACE
      ?auto_22570 - HOIST
      ?auto_22576 - SURFACE
      ?auto_22586 - SURFACE
      ?auto_22593 - PLACE
      ?auto_22589 - HOIST
      ?auto_22588 - SURFACE
      ?auto_22575 - PLACE
      ?auto_22583 - HOIST
      ?auto_22587 - SURFACE
      ?auto_22590 - PLACE
      ?auto_22594 - HOIST
      ?auto_22571 - SURFACE
      ?auto_22581 - SURFACE
      ?auto_22585 - PLACE
      ?auto_22577 - HOIST
      ?auto_22578 - SURFACE
      ?auto_22572 - PLACE
      ?auto_22580 - HOIST
      ?auto_22574 - SURFACE
      ?auto_22582 - PLACE
      ?auto_22569 - HOIST
      ?auto_22591 - SURFACE
      ?auto_22568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22565 ?auto_22563 ) ( IS-CRATE ?auto_22561 ) ( not ( = ?auto_22567 ?auto_22563 ) ) ( HOIST-AT ?auto_22566 ?auto_22567 ) ( AVAILABLE ?auto_22566 ) ( SURFACE-AT ?auto_22561 ?auto_22567 ) ( ON ?auto_22561 ?auto_22564 ) ( CLEAR ?auto_22561 ) ( not ( = ?auto_22562 ?auto_22561 ) ) ( not ( = ?auto_22562 ?auto_22564 ) ) ( not ( = ?auto_22561 ?auto_22564 ) ) ( not ( = ?auto_22565 ?auto_22566 ) ) ( IS-CRATE ?auto_22562 ) ( not ( = ?auto_22573 ?auto_22563 ) ) ( HOIST-AT ?auto_22579 ?auto_22573 ) ( SURFACE-AT ?auto_22562 ?auto_22573 ) ( ON ?auto_22562 ?auto_22584 ) ( CLEAR ?auto_22562 ) ( not ( = ?auto_22560 ?auto_22562 ) ) ( not ( = ?auto_22560 ?auto_22584 ) ) ( not ( = ?auto_22562 ?auto_22584 ) ) ( not ( = ?auto_22565 ?auto_22579 ) ) ( IS-CRATE ?auto_22560 ) ( not ( = ?auto_22592 ?auto_22563 ) ) ( HOIST-AT ?auto_22570 ?auto_22592 ) ( AVAILABLE ?auto_22570 ) ( SURFACE-AT ?auto_22560 ?auto_22592 ) ( ON ?auto_22560 ?auto_22576 ) ( CLEAR ?auto_22560 ) ( not ( = ?auto_22557 ?auto_22560 ) ) ( not ( = ?auto_22557 ?auto_22576 ) ) ( not ( = ?auto_22560 ?auto_22576 ) ) ( not ( = ?auto_22565 ?auto_22570 ) ) ( IS-CRATE ?auto_22557 ) ( SURFACE-AT ?auto_22557 ?auto_22573 ) ( ON ?auto_22557 ?auto_22586 ) ( CLEAR ?auto_22557 ) ( not ( = ?auto_22558 ?auto_22557 ) ) ( not ( = ?auto_22558 ?auto_22586 ) ) ( not ( = ?auto_22557 ?auto_22586 ) ) ( IS-CRATE ?auto_22558 ) ( not ( = ?auto_22593 ?auto_22563 ) ) ( HOIST-AT ?auto_22589 ?auto_22593 ) ( AVAILABLE ?auto_22589 ) ( SURFACE-AT ?auto_22558 ?auto_22593 ) ( ON ?auto_22558 ?auto_22588 ) ( CLEAR ?auto_22558 ) ( not ( = ?auto_22559 ?auto_22558 ) ) ( not ( = ?auto_22559 ?auto_22588 ) ) ( not ( = ?auto_22558 ?auto_22588 ) ) ( not ( = ?auto_22565 ?auto_22589 ) ) ( IS-CRATE ?auto_22559 ) ( not ( = ?auto_22575 ?auto_22563 ) ) ( HOIST-AT ?auto_22583 ?auto_22575 ) ( AVAILABLE ?auto_22583 ) ( SURFACE-AT ?auto_22559 ?auto_22575 ) ( ON ?auto_22559 ?auto_22587 ) ( CLEAR ?auto_22559 ) ( not ( = ?auto_22556 ?auto_22559 ) ) ( not ( = ?auto_22556 ?auto_22587 ) ) ( not ( = ?auto_22559 ?auto_22587 ) ) ( not ( = ?auto_22565 ?auto_22583 ) ) ( IS-CRATE ?auto_22556 ) ( not ( = ?auto_22590 ?auto_22563 ) ) ( HOIST-AT ?auto_22594 ?auto_22590 ) ( AVAILABLE ?auto_22594 ) ( SURFACE-AT ?auto_22556 ?auto_22590 ) ( ON ?auto_22556 ?auto_22571 ) ( CLEAR ?auto_22556 ) ( not ( = ?auto_22555 ?auto_22556 ) ) ( not ( = ?auto_22555 ?auto_22571 ) ) ( not ( = ?auto_22556 ?auto_22571 ) ) ( not ( = ?auto_22565 ?auto_22594 ) ) ( IS-CRATE ?auto_22555 ) ( AVAILABLE ?auto_22579 ) ( SURFACE-AT ?auto_22555 ?auto_22573 ) ( ON ?auto_22555 ?auto_22581 ) ( CLEAR ?auto_22555 ) ( not ( = ?auto_22554 ?auto_22555 ) ) ( not ( = ?auto_22554 ?auto_22581 ) ) ( not ( = ?auto_22555 ?auto_22581 ) ) ( IS-CRATE ?auto_22554 ) ( not ( = ?auto_22585 ?auto_22563 ) ) ( HOIST-AT ?auto_22577 ?auto_22585 ) ( AVAILABLE ?auto_22577 ) ( SURFACE-AT ?auto_22554 ?auto_22585 ) ( ON ?auto_22554 ?auto_22578 ) ( CLEAR ?auto_22554 ) ( not ( = ?auto_22553 ?auto_22554 ) ) ( not ( = ?auto_22553 ?auto_22578 ) ) ( not ( = ?auto_22554 ?auto_22578 ) ) ( not ( = ?auto_22565 ?auto_22577 ) ) ( IS-CRATE ?auto_22553 ) ( not ( = ?auto_22572 ?auto_22563 ) ) ( HOIST-AT ?auto_22580 ?auto_22572 ) ( AVAILABLE ?auto_22580 ) ( SURFACE-AT ?auto_22553 ?auto_22572 ) ( ON ?auto_22553 ?auto_22574 ) ( CLEAR ?auto_22553 ) ( not ( = ?auto_22552 ?auto_22553 ) ) ( not ( = ?auto_22552 ?auto_22574 ) ) ( not ( = ?auto_22553 ?auto_22574 ) ) ( not ( = ?auto_22565 ?auto_22580 ) ) ( SURFACE-AT ?auto_22551 ?auto_22563 ) ( CLEAR ?auto_22551 ) ( IS-CRATE ?auto_22552 ) ( AVAILABLE ?auto_22565 ) ( not ( = ?auto_22582 ?auto_22563 ) ) ( HOIST-AT ?auto_22569 ?auto_22582 ) ( AVAILABLE ?auto_22569 ) ( SURFACE-AT ?auto_22552 ?auto_22582 ) ( ON ?auto_22552 ?auto_22591 ) ( CLEAR ?auto_22552 ) ( TRUCK-AT ?auto_22568 ?auto_22563 ) ( not ( = ?auto_22551 ?auto_22552 ) ) ( not ( = ?auto_22551 ?auto_22591 ) ) ( not ( = ?auto_22552 ?auto_22591 ) ) ( not ( = ?auto_22565 ?auto_22569 ) ) ( not ( = ?auto_22551 ?auto_22553 ) ) ( not ( = ?auto_22551 ?auto_22574 ) ) ( not ( = ?auto_22553 ?auto_22591 ) ) ( not ( = ?auto_22572 ?auto_22582 ) ) ( not ( = ?auto_22580 ?auto_22569 ) ) ( not ( = ?auto_22574 ?auto_22591 ) ) ( not ( = ?auto_22551 ?auto_22554 ) ) ( not ( = ?auto_22551 ?auto_22578 ) ) ( not ( = ?auto_22552 ?auto_22554 ) ) ( not ( = ?auto_22552 ?auto_22578 ) ) ( not ( = ?auto_22554 ?auto_22574 ) ) ( not ( = ?auto_22554 ?auto_22591 ) ) ( not ( = ?auto_22585 ?auto_22572 ) ) ( not ( = ?auto_22585 ?auto_22582 ) ) ( not ( = ?auto_22577 ?auto_22580 ) ) ( not ( = ?auto_22577 ?auto_22569 ) ) ( not ( = ?auto_22578 ?auto_22574 ) ) ( not ( = ?auto_22578 ?auto_22591 ) ) ( not ( = ?auto_22551 ?auto_22555 ) ) ( not ( = ?auto_22551 ?auto_22581 ) ) ( not ( = ?auto_22552 ?auto_22555 ) ) ( not ( = ?auto_22552 ?auto_22581 ) ) ( not ( = ?auto_22553 ?auto_22555 ) ) ( not ( = ?auto_22553 ?auto_22581 ) ) ( not ( = ?auto_22555 ?auto_22578 ) ) ( not ( = ?auto_22555 ?auto_22574 ) ) ( not ( = ?auto_22555 ?auto_22591 ) ) ( not ( = ?auto_22573 ?auto_22585 ) ) ( not ( = ?auto_22573 ?auto_22572 ) ) ( not ( = ?auto_22573 ?auto_22582 ) ) ( not ( = ?auto_22579 ?auto_22577 ) ) ( not ( = ?auto_22579 ?auto_22580 ) ) ( not ( = ?auto_22579 ?auto_22569 ) ) ( not ( = ?auto_22581 ?auto_22578 ) ) ( not ( = ?auto_22581 ?auto_22574 ) ) ( not ( = ?auto_22581 ?auto_22591 ) ) ( not ( = ?auto_22551 ?auto_22556 ) ) ( not ( = ?auto_22551 ?auto_22571 ) ) ( not ( = ?auto_22552 ?auto_22556 ) ) ( not ( = ?auto_22552 ?auto_22571 ) ) ( not ( = ?auto_22553 ?auto_22556 ) ) ( not ( = ?auto_22553 ?auto_22571 ) ) ( not ( = ?auto_22554 ?auto_22556 ) ) ( not ( = ?auto_22554 ?auto_22571 ) ) ( not ( = ?auto_22556 ?auto_22581 ) ) ( not ( = ?auto_22556 ?auto_22578 ) ) ( not ( = ?auto_22556 ?auto_22574 ) ) ( not ( = ?auto_22556 ?auto_22591 ) ) ( not ( = ?auto_22590 ?auto_22573 ) ) ( not ( = ?auto_22590 ?auto_22585 ) ) ( not ( = ?auto_22590 ?auto_22572 ) ) ( not ( = ?auto_22590 ?auto_22582 ) ) ( not ( = ?auto_22594 ?auto_22579 ) ) ( not ( = ?auto_22594 ?auto_22577 ) ) ( not ( = ?auto_22594 ?auto_22580 ) ) ( not ( = ?auto_22594 ?auto_22569 ) ) ( not ( = ?auto_22571 ?auto_22581 ) ) ( not ( = ?auto_22571 ?auto_22578 ) ) ( not ( = ?auto_22571 ?auto_22574 ) ) ( not ( = ?auto_22571 ?auto_22591 ) ) ( not ( = ?auto_22551 ?auto_22559 ) ) ( not ( = ?auto_22551 ?auto_22587 ) ) ( not ( = ?auto_22552 ?auto_22559 ) ) ( not ( = ?auto_22552 ?auto_22587 ) ) ( not ( = ?auto_22553 ?auto_22559 ) ) ( not ( = ?auto_22553 ?auto_22587 ) ) ( not ( = ?auto_22554 ?auto_22559 ) ) ( not ( = ?auto_22554 ?auto_22587 ) ) ( not ( = ?auto_22555 ?auto_22559 ) ) ( not ( = ?auto_22555 ?auto_22587 ) ) ( not ( = ?auto_22559 ?auto_22571 ) ) ( not ( = ?auto_22559 ?auto_22581 ) ) ( not ( = ?auto_22559 ?auto_22578 ) ) ( not ( = ?auto_22559 ?auto_22574 ) ) ( not ( = ?auto_22559 ?auto_22591 ) ) ( not ( = ?auto_22575 ?auto_22590 ) ) ( not ( = ?auto_22575 ?auto_22573 ) ) ( not ( = ?auto_22575 ?auto_22585 ) ) ( not ( = ?auto_22575 ?auto_22572 ) ) ( not ( = ?auto_22575 ?auto_22582 ) ) ( not ( = ?auto_22583 ?auto_22594 ) ) ( not ( = ?auto_22583 ?auto_22579 ) ) ( not ( = ?auto_22583 ?auto_22577 ) ) ( not ( = ?auto_22583 ?auto_22580 ) ) ( not ( = ?auto_22583 ?auto_22569 ) ) ( not ( = ?auto_22587 ?auto_22571 ) ) ( not ( = ?auto_22587 ?auto_22581 ) ) ( not ( = ?auto_22587 ?auto_22578 ) ) ( not ( = ?auto_22587 ?auto_22574 ) ) ( not ( = ?auto_22587 ?auto_22591 ) ) ( not ( = ?auto_22551 ?auto_22558 ) ) ( not ( = ?auto_22551 ?auto_22588 ) ) ( not ( = ?auto_22552 ?auto_22558 ) ) ( not ( = ?auto_22552 ?auto_22588 ) ) ( not ( = ?auto_22553 ?auto_22558 ) ) ( not ( = ?auto_22553 ?auto_22588 ) ) ( not ( = ?auto_22554 ?auto_22558 ) ) ( not ( = ?auto_22554 ?auto_22588 ) ) ( not ( = ?auto_22555 ?auto_22558 ) ) ( not ( = ?auto_22555 ?auto_22588 ) ) ( not ( = ?auto_22556 ?auto_22558 ) ) ( not ( = ?auto_22556 ?auto_22588 ) ) ( not ( = ?auto_22558 ?auto_22587 ) ) ( not ( = ?auto_22558 ?auto_22571 ) ) ( not ( = ?auto_22558 ?auto_22581 ) ) ( not ( = ?auto_22558 ?auto_22578 ) ) ( not ( = ?auto_22558 ?auto_22574 ) ) ( not ( = ?auto_22558 ?auto_22591 ) ) ( not ( = ?auto_22593 ?auto_22575 ) ) ( not ( = ?auto_22593 ?auto_22590 ) ) ( not ( = ?auto_22593 ?auto_22573 ) ) ( not ( = ?auto_22593 ?auto_22585 ) ) ( not ( = ?auto_22593 ?auto_22572 ) ) ( not ( = ?auto_22593 ?auto_22582 ) ) ( not ( = ?auto_22589 ?auto_22583 ) ) ( not ( = ?auto_22589 ?auto_22594 ) ) ( not ( = ?auto_22589 ?auto_22579 ) ) ( not ( = ?auto_22589 ?auto_22577 ) ) ( not ( = ?auto_22589 ?auto_22580 ) ) ( not ( = ?auto_22589 ?auto_22569 ) ) ( not ( = ?auto_22588 ?auto_22587 ) ) ( not ( = ?auto_22588 ?auto_22571 ) ) ( not ( = ?auto_22588 ?auto_22581 ) ) ( not ( = ?auto_22588 ?auto_22578 ) ) ( not ( = ?auto_22588 ?auto_22574 ) ) ( not ( = ?auto_22588 ?auto_22591 ) ) ( not ( = ?auto_22551 ?auto_22557 ) ) ( not ( = ?auto_22551 ?auto_22586 ) ) ( not ( = ?auto_22552 ?auto_22557 ) ) ( not ( = ?auto_22552 ?auto_22586 ) ) ( not ( = ?auto_22553 ?auto_22557 ) ) ( not ( = ?auto_22553 ?auto_22586 ) ) ( not ( = ?auto_22554 ?auto_22557 ) ) ( not ( = ?auto_22554 ?auto_22586 ) ) ( not ( = ?auto_22555 ?auto_22557 ) ) ( not ( = ?auto_22555 ?auto_22586 ) ) ( not ( = ?auto_22556 ?auto_22557 ) ) ( not ( = ?auto_22556 ?auto_22586 ) ) ( not ( = ?auto_22559 ?auto_22557 ) ) ( not ( = ?auto_22559 ?auto_22586 ) ) ( not ( = ?auto_22557 ?auto_22588 ) ) ( not ( = ?auto_22557 ?auto_22587 ) ) ( not ( = ?auto_22557 ?auto_22571 ) ) ( not ( = ?auto_22557 ?auto_22581 ) ) ( not ( = ?auto_22557 ?auto_22578 ) ) ( not ( = ?auto_22557 ?auto_22574 ) ) ( not ( = ?auto_22557 ?auto_22591 ) ) ( not ( = ?auto_22586 ?auto_22588 ) ) ( not ( = ?auto_22586 ?auto_22587 ) ) ( not ( = ?auto_22586 ?auto_22571 ) ) ( not ( = ?auto_22586 ?auto_22581 ) ) ( not ( = ?auto_22586 ?auto_22578 ) ) ( not ( = ?auto_22586 ?auto_22574 ) ) ( not ( = ?auto_22586 ?auto_22591 ) ) ( not ( = ?auto_22551 ?auto_22560 ) ) ( not ( = ?auto_22551 ?auto_22576 ) ) ( not ( = ?auto_22552 ?auto_22560 ) ) ( not ( = ?auto_22552 ?auto_22576 ) ) ( not ( = ?auto_22553 ?auto_22560 ) ) ( not ( = ?auto_22553 ?auto_22576 ) ) ( not ( = ?auto_22554 ?auto_22560 ) ) ( not ( = ?auto_22554 ?auto_22576 ) ) ( not ( = ?auto_22555 ?auto_22560 ) ) ( not ( = ?auto_22555 ?auto_22576 ) ) ( not ( = ?auto_22556 ?auto_22560 ) ) ( not ( = ?auto_22556 ?auto_22576 ) ) ( not ( = ?auto_22559 ?auto_22560 ) ) ( not ( = ?auto_22559 ?auto_22576 ) ) ( not ( = ?auto_22558 ?auto_22560 ) ) ( not ( = ?auto_22558 ?auto_22576 ) ) ( not ( = ?auto_22560 ?auto_22586 ) ) ( not ( = ?auto_22560 ?auto_22588 ) ) ( not ( = ?auto_22560 ?auto_22587 ) ) ( not ( = ?auto_22560 ?auto_22571 ) ) ( not ( = ?auto_22560 ?auto_22581 ) ) ( not ( = ?auto_22560 ?auto_22578 ) ) ( not ( = ?auto_22560 ?auto_22574 ) ) ( not ( = ?auto_22560 ?auto_22591 ) ) ( not ( = ?auto_22592 ?auto_22573 ) ) ( not ( = ?auto_22592 ?auto_22593 ) ) ( not ( = ?auto_22592 ?auto_22575 ) ) ( not ( = ?auto_22592 ?auto_22590 ) ) ( not ( = ?auto_22592 ?auto_22585 ) ) ( not ( = ?auto_22592 ?auto_22572 ) ) ( not ( = ?auto_22592 ?auto_22582 ) ) ( not ( = ?auto_22570 ?auto_22579 ) ) ( not ( = ?auto_22570 ?auto_22589 ) ) ( not ( = ?auto_22570 ?auto_22583 ) ) ( not ( = ?auto_22570 ?auto_22594 ) ) ( not ( = ?auto_22570 ?auto_22577 ) ) ( not ( = ?auto_22570 ?auto_22580 ) ) ( not ( = ?auto_22570 ?auto_22569 ) ) ( not ( = ?auto_22576 ?auto_22586 ) ) ( not ( = ?auto_22576 ?auto_22588 ) ) ( not ( = ?auto_22576 ?auto_22587 ) ) ( not ( = ?auto_22576 ?auto_22571 ) ) ( not ( = ?auto_22576 ?auto_22581 ) ) ( not ( = ?auto_22576 ?auto_22578 ) ) ( not ( = ?auto_22576 ?auto_22574 ) ) ( not ( = ?auto_22576 ?auto_22591 ) ) ( not ( = ?auto_22551 ?auto_22562 ) ) ( not ( = ?auto_22551 ?auto_22584 ) ) ( not ( = ?auto_22552 ?auto_22562 ) ) ( not ( = ?auto_22552 ?auto_22584 ) ) ( not ( = ?auto_22553 ?auto_22562 ) ) ( not ( = ?auto_22553 ?auto_22584 ) ) ( not ( = ?auto_22554 ?auto_22562 ) ) ( not ( = ?auto_22554 ?auto_22584 ) ) ( not ( = ?auto_22555 ?auto_22562 ) ) ( not ( = ?auto_22555 ?auto_22584 ) ) ( not ( = ?auto_22556 ?auto_22562 ) ) ( not ( = ?auto_22556 ?auto_22584 ) ) ( not ( = ?auto_22559 ?auto_22562 ) ) ( not ( = ?auto_22559 ?auto_22584 ) ) ( not ( = ?auto_22558 ?auto_22562 ) ) ( not ( = ?auto_22558 ?auto_22584 ) ) ( not ( = ?auto_22557 ?auto_22562 ) ) ( not ( = ?auto_22557 ?auto_22584 ) ) ( not ( = ?auto_22562 ?auto_22576 ) ) ( not ( = ?auto_22562 ?auto_22586 ) ) ( not ( = ?auto_22562 ?auto_22588 ) ) ( not ( = ?auto_22562 ?auto_22587 ) ) ( not ( = ?auto_22562 ?auto_22571 ) ) ( not ( = ?auto_22562 ?auto_22581 ) ) ( not ( = ?auto_22562 ?auto_22578 ) ) ( not ( = ?auto_22562 ?auto_22574 ) ) ( not ( = ?auto_22562 ?auto_22591 ) ) ( not ( = ?auto_22584 ?auto_22576 ) ) ( not ( = ?auto_22584 ?auto_22586 ) ) ( not ( = ?auto_22584 ?auto_22588 ) ) ( not ( = ?auto_22584 ?auto_22587 ) ) ( not ( = ?auto_22584 ?auto_22571 ) ) ( not ( = ?auto_22584 ?auto_22581 ) ) ( not ( = ?auto_22584 ?auto_22578 ) ) ( not ( = ?auto_22584 ?auto_22574 ) ) ( not ( = ?auto_22584 ?auto_22591 ) ) ( not ( = ?auto_22551 ?auto_22561 ) ) ( not ( = ?auto_22551 ?auto_22564 ) ) ( not ( = ?auto_22552 ?auto_22561 ) ) ( not ( = ?auto_22552 ?auto_22564 ) ) ( not ( = ?auto_22553 ?auto_22561 ) ) ( not ( = ?auto_22553 ?auto_22564 ) ) ( not ( = ?auto_22554 ?auto_22561 ) ) ( not ( = ?auto_22554 ?auto_22564 ) ) ( not ( = ?auto_22555 ?auto_22561 ) ) ( not ( = ?auto_22555 ?auto_22564 ) ) ( not ( = ?auto_22556 ?auto_22561 ) ) ( not ( = ?auto_22556 ?auto_22564 ) ) ( not ( = ?auto_22559 ?auto_22561 ) ) ( not ( = ?auto_22559 ?auto_22564 ) ) ( not ( = ?auto_22558 ?auto_22561 ) ) ( not ( = ?auto_22558 ?auto_22564 ) ) ( not ( = ?auto_22557 ?auto_22561 ) ) ( not ( = ?auto_22557 ?auto_22564 ) ) ( not ( = ?auto_22560 ?auto_22561 ) ) ( not ( = ?auto_22560 ?auto_22564 ) ) ( not ( = ?auto_22561 ?auto_22584 ) ) ( not ( = ?auto_22561 ?auto_22576 ) ) ( not ( = ?auto_22561 ?auto_22586 ) ) ( not ( = ?auto_22561 ?auto_22588 ) ) ( not ( = ?auto_22561 ?auto_22587 ) ) ( not ( = ?auto_22561 ?auto_22571 ) ) ( not ( = ?auto_22561 ?auto_22581 ) ) ( not ( = ?auto_22561 ?auto_22578 ) ) ( not ( = ?auto_22561 ?auto_22574 ) ) ( not ( = ?auto_22561 ?auto_22591 ) ) ( not ( = ?auto_22567 ?auto_22573 ) ) ( not ( = ?auto_22567 ?auto_22592 ) ) ( not ( = ?auto_22567 ?auto_22593 ) ) ( not ( = ?auto_22567 ?auto_22575 ) ) ( not ( = ?auto_22567 ?auto_22590 ) ) ( not ( = ?auto_22567 ?auto_22585 ) ) ( not ( = ?auto_22567 ?auto_22572 ) ) ( not ( = ?auto_22567 ?auto_22582 ) ) ( not ( = ?auto_22566 ?auto_22579 ) ) ( not ( = ?auto_22566 ?auto_22570 ) ) ( not ( = ?auto_22566 ?auto_22589 ) ) ( not ( = ?auto_22566 ?auto_22583 ) ) ( not ( = ?auto_22566 ?auto_22594 ) ) ( not ( = ?auto_22566 ?auto_22577 ) ) ( not ( = ?auto_22566 ?auto_22580 ) ) ( not ( = ?auto_22566 ?auto_22569 ) ) ( not ( = ?auto_22564 ?auto_22584 ) ) ( not ( = ?auto_22564 ?auto_22576 ) ) ( not ( = ?auto_22564 ?auto_22586 ) ) ( not ( = ?auto_22564 ?auto_22588 ) ) ( not ( = ?auto_22564 ?auto_22587 ) ) ( not ( = ?auto_22564 ?auto_22571 ) ) ( not ( = ?auto_22564 ?auto_22581 ) ) ( not ( = ?auto_22564 ?auto_22578 ) ) ( not ( = ?auto_22564 ?auto_22574 ) ) ( not ( = ?auto_22564 ?auto_22591 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_22551 ?auto_22552 ?auto_22553 ?auto_22554 ?auto_22555 ?auto_22556 ?auto_22559 ?auto_22558 ?auto_22557 ?auto_22560 ?auto_22562 )
      ( MAKE-1CRATE ?auto_22562 ?auto_22561 )
      ( MAKE-11CRATE-VERIFY ?auto_22551 ?auto_22552 ?auto_22553 ?auto_22554 ?auto_22555 ?auto_22556 ?auto_22559 ?auto_22558 ?auto_22557 ?auto_22560 ?auto_22562 ?auto_22561 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22597 - SURFACE
      ?auto_22598 - SURFACE
    )
    :vars
    (
      ?auto_22599 - HOIST
      ?auto_22600 - PLACE
      ?auto_22602 - PLACE
      ?auto_22603 - HOIST
      ?auto_22604 - SURFACE
      ?auto_22601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22599 ?auto_22600 ) ( SURFACE-AT ?auto_22597 ?auto_22600 ) ( CLEAR ?auto_22597 ) ( IS-CRATE ?auto_22598 ) ( AVAILABLE ?auto_22599 ) ( not ( = ?auto_22602 ?auto_22600 ) ) ( HOIST-AT ?auto_22603 ?auto_22602 ) ( AVAILABLE ?auto_22603 ) ( SURFACE-AT ?auto_22598 ?auto_22602 ) ( ON ?auto_22598 ?auto_22604 ) ( CLEAR ?auto_22598 ) ( TRUCK-AT ?auto_22601 ?auto_22600 ) ( not ( = ?auto_22597 ?auto_22598 ) ) ( not ( = ?auto_22597 ?auto_22604 ) ) ( not ( = ?auto_22598 ?auto_22604 ) ) ( not ( = ?auto_22599 ?auto_22603 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22601 ?auto_22600 ?auto_22602 )
      ( !LIFT ?auto_22603 ?auto_22598 ?auto_22604 ?auto_22602 )
      ( !LOAD ?auto_22603 ?auto_22598 ?auto_22601 ?auto_22602 )
      ( !DRIVE ?auto_22601 ?auto_22602 ?auto_22600 )
      ( !UNLOAD ?auto_22599 ?auto_22598 ?auto_22601 ?auto_22600 )
      ( !DROP ?auto_22599 ?auto_22598 ?auto_22597 ?auto_22600 )
      ( MAKE-1CRATE-VERIFY ?auto_22597 ?auto_22598 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_22618 - SURFACE
      ?auto_22619 - SURFACE
      ?auto_22620 - SURFACE
      ?auto_22621 - SURFACE
      ?auto_22622 - SURFACE
      ?auto_22623 - SURFACE
      ?auto_22626 - SURFACE
      ?auto_22625 - SURFACE
      ?auto_22624 - SURFACE
      ?auto_22627 - SURFACE
      ?auto_22629 - SURFACE
      ?auto_22628 - SURFACE
      ?auto_22630 - SURFACE
    )
    :vars
    (
      ?auto_22633 - HOIST
      ?auto_22635 - PLACE
      ?auto_22636 - PLACE
      ?auto_22634 - HOIST
      ?auto_22632 - SURFACE
      ?auto_22640 - PLACE
      ?auto_22657 - HOIST
      ?auto_22641 - SURFACE
      ?auto_22637 - PLACE
      ?auto_22645 - HOIST
      ?auto_22642 - SURFACE
      ?auto_22653 - PLACE
      ?auto_22639 - HOIST
      ?auto_22651 - SURFACE
      ?auto_22648 - SURFACE
      ?auto_22655 - PLACE
      ?auto_22659 - HOIST
      ?auto_22652 - SURFACE
      ?auto_22647 - PLACE
      ?auto_22643 - HOIST
      ?auto_22663 - SURFACE
      ?auto_22658 - PLACE
      ?auto_22649 - HOIST
      ?auto_22654 - SURFACE
      ?auto_22650 - SURFACE
      ?auto_22656 - PLACE
      ?auto_22660 - HOIST
      ?auto_22646 - SURFACE
      ?auto_22644 - SURFACE
      ?auto_22638 - PLACE
      ?auto_22661 - HOIST
      ?auto_22662 - SURFACE
      ?auto_22631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22633 ?auto_22635 ) ( IS-CRATE ?auto_22630 ) ( not ( = ?auto_22636 ?auto_22635 ) ) ( HOIST-AT ?auto_22634 ?auto_22636 ) ( SURFACE-AT ?auto_22630 ?auto_22636 ) ( ON ?auto_22630 ?auto_22632 ) ( CLEAR ?auto_22630 ) ( not ( = ?auto_22628 ?auto_22630 ) ) ( not ( = ?auto_22628 ?auto_22632 ) ) ( not ( = ?auto_22630 ?auto_22632 ) ) ( not ( = ?auto_22633 ?auto_22634 ) ) ( IS-CRATE ?auto_22628 ) ( not ( = ?auto_22640 ?auto_22635 ) ) ( HOIST-AT ?auto_22657 ?auto_22640 ) ( AVAILABLE ?auto_22657 ) ( SURFACE-AT ?auto_22628 ?auto_22640 ) ( ON ?auto_22628 ?auto_22641 ) ( CLEAR ?auto_22628 ) ( not ( = ?auto_22629 ?auto_22628 ) ) ( not ( = ?auto_22629 ?auto_22641 ) ) ( not ( = ?auto_22628 ?auto_22641 ) ) ( not ( = ?auto_22633 ?auto_22657 ) ) ( IS-CRATE ?auto_22629 ) ( not ( = ?auto_22637 ?auto_22635 ) ) ( HOIST-AT ?auto_22645 ?auto_22637 ) ( SURFACE-AT ?auto_22629 ?auto_22637 ) ( ON ?auto_22629 ?auto_22642 ) ( CLEAR ?auto_22629 ) ( not ( = ?auto_22627 ?auto_22629 ) ) ( not ( = ?auto_22627 ?auto_22642 ) ) ( not ( = ?auto_22629 ?auto_22642 ) ) ( not ( = ?auto_22633 ?auto_22645 ) ) ( IS-CRATE ?auto_22627 ) ( not ( = ?auto_22653 ?auto_22635 ) ) ( HOIST-AT ?auto_22639 ?auto_22653 ) ( AVAILABLE ?auto_22639 ) ( SURFACE-AT ?auto_22627 ?auto_22653 ) ( ON ?auto_22627 ?auto_22651 ) ( CLEAR ?auto_22627 ) ( not ( = ?auto_22624 ?auto_22627 ) ) ( not ( = ?auto_22624 ?auto_22651 ) ) ( not ( = ?auto_22627 ?auto_22651 ) ) ( not ( = ?auto_22633 ?auto_22639 ) ) ( IS-CRATE ?auto_22624 ) ( SURFACE-AT ?auto_22624 ?auto_22637 ) ( ON ?auto_22624 ?auto_22648 ) ( CLEAR ?auto_22624 ) ( not ( = ?auto_22625 ?auto_22624 ) ) ( not ( = ?auto_22625 ?auto_22648 ) ) ( not ( = ?auto_22624 ?auto_22648 ) ) ( IS-CRATE ?auto_22625 ) ( not ( = ?auto_22655 ?auto_22635 ) ) ( HOIST-AT ?auto_22659 ?auto_22655 ) ( AVAILABLE ?auto_22659 ) ( SURFACE-AT ?auto_22625 ?auto_22655 ) ( ON ?auto_22625 ?auto_22652 ) ( CLEAR ?auto_22625 ) ( not ( = ?auto_22626 ?auto_22625 ) ) ( not ( = ?auto_22626 ?auto_22652 ) ) ( not ( = ?auto_22625 ?auto_22652 ) ) ( not ( = ?auto_22633 ?auto_22659 ) ) ( IS-CRATE ?auto_22626 ) ( not ( = ?auto_22647 ?auto_22635 ) ) ( HOIST-AT ?auto_22643 ?auto_22647 ) ( AVAILABLE ?auto_22643 ) ( SURFACE-AT ?auto_22626 ?auto_22647 ) ( ON ?auto_22626 ?auto_22663 ) ( CLEAR ?auto_22626 ) ( not ( = ?auto_22623 ?auto_22626 ) ) ( not ( = ?auto_22623 ?auto_22663 ) ) ( not ( = ?auto_22626 ?auto_22663 ) ) ( not ( = ?auto_22633 ?auto_22643 ) ) ( IS-CRATE ?auto_22623 ) ( not ( = ?auto_22658 ?auto_22635 ) ) ( HOIST-AT ?auto_22649 ?auto_22658 ) ( AVAILABLE ?auto_22649 ) ( SURFACE-AT ?auto_22623 ?auto_22658 ) ( ON ?auto_22623 ?auto_22654 ) ( CLEAR ?auto_22623 ) ( not ( = ?auto_22622 ?auto_22623 ) ) ( not ( = ?auto_22622 ?auto_22654 ) ) ( not ( = ?auto_22623 ?auto_22654 ) ) ( not ( = ?auto_22633 ?auto_22649 ) ) ( IS-CRATE ?auto_22622 ) ( AVAILABLE ?auto_22645 ) ( SURFACE-AT ?auto_22622 ?auto_22637 ) ( ON ?auto_22622 ?auto_22650 ) ( CLEAR ?auto_22622 ) ( not ( = ?auto_22621 ?auto_22622 ) ) ( not ( = ?auto_22621 ?auto_22650 ) ) ( not ( = ?auto_22622 ?auto_22650 ) ) ( IS-CRATE ?auto_22621 ) ( not ( = ?auto_22656 ?auto_22635 ) ) ( HOIST-AT ?auto_22660 ?auto_22656 ) ( AVAILABLE ?auto_22660 ) ( SURFACE-AT ?auto_22621 ?auto_22656 ) ( ON ?auto_22621 ?auto_22646 ) ( CLEAR ?auto_22621 ) ( not ( = ?auto_22620 ?auto_22621 ) ) ( not ( = ?auto_22620 ?auto_22646 ) ) ( not ( = ?auto_22621 ?auto_22646 ) ) ( not ( = ?auto_22633 ?auto_22660 ) ) ( IS-CRATE ?auto_22620 ) ( AVAILABLE ?auto_22634 ) ( SURFACE-AT ?auto_22620 ?auto_22636 ) ( ON ?auto_22620 ?auto_22644 ) ( CLEAR ?auto_22620 ) ( not ( = ?auto_22619 ?auto_22620 ) ) ( not ( = ?auto_22619 ?auto_22644 ) ) ( not ( = ?auto_22620 ?auto_22644 ) ) ( SURFACE-AT ?auto_22618 ?auto_22635 ) ( CLEAR ?auto_22618 ) ( IS-CRATE ?auto_22619 ) ( AVAILABLE ?auto_22633 ) ( not ( = ?auto_22638 ?auto_22635 ) ) ( HOIST-AT ?auto_22661 ?auto_22638 ) ( AVAILABLE ?auto_22661 ) ( SURFACE-AT ?auto_22619 ?auto_22638 ) ( ON ?auto_22619 ?auto_22662 ) ( CLEAR ?auto_22619 ) ( TRUCK-AT ?auto_22631 ?auto_22635 ) ( not ( = ?auto_22618 ?auto_22619 ) ) ( not ( = ?auto_22618 ?auto_22662 ) ) ( not ( = ?auto_22619 ?auto_22662 ) ) ( not ( = ?auto_22633 ?auto_22661 ) ) ( not ( = ?auto_22618 ?auto_22620 ) ) ( not ( = ?auto_22618 ?auto_22644 ) ) ( not ( = ?auto_22620 ?auto_22662 ) ) ( not ( = ?auto_22636 ?auto_22638 ) ) ( not ( = ?auto_22634 ?auto_22661 ) ) ( not ( = ?auto_22644 ?auto_22662 ) ) ( not ( = ?auto_22618 ?auto_22621 ) ) ( not ( = ?auto_22618 ?auto_22646 ) ) ( not ( = ?auto_22619 ?auto_22621 ) ) ( not ( = ?auto_22619 ?auto_22646 ) ) ( not ( = ?auto_22621 ?auto_22644 ) ) ( not ( = ?auto_22621 ?auto_22662 ) ) ( not ( = ?auto_22656 ?auto_22636 ) ) ( not ( = ?auto_22656 ?auto_22638 ) ) ( not ( = ?auto_22660 ?auto_22634 ) ) ( not ( = ?auto_22660 ?auto_22661 ) ) ( not ( = ?auto_22646 ?auto_22644 ) ) ( not ( = ?auto_22646 ?auto_22662 ) ) ( not ( = ?auto_22618 ?auto_22622 ) ) ( not ( = ?auto_22618 ?auto_22650 ) ) ( not ( = ?auto_22619 ?auto_22622 ) ) ( not ( = ?auto_22619 ?auto_22650 ) ) ( not ( = ?auto_22620 ?auto_22622 ) ) ( not ( = ?auto_22620 ?auto_22650 ) ) ( not ( = ?auto_22622 ?auto_22646 ) ) ( not ( = ?auto_22622 ?auto_22644 ) ) ( not ( = ?auto_22622 ?auto_22662 ) ) ( not ( = ?auto_22637 ?auto_22656 ) ) ( not ( = ?auto_22637 ?auto_22636 ) ) ( not ( = ?auto_22637 ?auto_22638 ) ) ( not ( = ?auto_22645 ?auto_22660 ) ) ( not ( = ?auto_22645 ?auto_22634 ) ) ( not ( = ?auto_22645 ?auto_22661 ) ) ( not ( = ?auto_22650 ?auto_22646 ) ) ( not ( = ?auto_22650 ?auto_22644 ) ) ( not ( = ?auto_22650 ?auto_22662 ) ) ( not ( = ?auto_22618 ?auto_22623 ) ) ( not ( = ?auto_22618 ?auto_22654 ) ) ( not ( = ?auto_22619 ?auto_22623 ) ) ( not ( = ?auto_22619 ?auto_22654 ) ) ( not ( = ?auto_22620 ?auto_22623 ) ) ( not ( = ?auto_22620 ?auto_22654 ) ) ( not ( = ?auto_22621 ?auto_22623 ) ) ( not ( = ?auto_22621 ?auto_22654 ) ) ( not ( = ?auto_22623 ?auto_22650 ) ) ( not ( = ?auto_22623 ?auto_22646 ) ) ( not ( = ?auto_22623 ?auto_22644 ) ) ( not ( = ?auto_22623 ?auto_22662 ) ) ( not ( = ?auto_22658 ?auto_22637 ) ) ( not ( = ?auto_22658 ?auto_22656 ) ) ( not ( = ?auto_22658 ?auto_22636 ) ) ( not ( = ?auto_22658 ?auto_22638 ) ) ( not ( = ?auto_22649 ?auto_22645 ) ) ( not ( = ?auto_22649 ?auto_22660 ) ) ( not ( = ?auto_22649 ?auto_22634 ) ) ( not ( = ?auto_22649 ?auto_22661 ) ) ( not ( = ?auto_22654 ?auto_22650 ) ) ( not ( = ?auto_22654 ?auto_22646 ) ) ( not ( = ?auto_22654 ?auto_22644 ) ) ( not ( = ?auto_22654 ?auto_22662 ) ) ( not ( = ?auto_22618 ?auto_22626 ) ) ( not ( = ?auto_22618 ?auto_22663 ) ) ( not ( = ?auto_22619 ?auto_22626 ) ) ( not ( = ?auto_22619 ?auto_22663 ) ) ( not ( = ?auto_22620 ?auto_22626 ) ) ( not ( = ?auto_22620 ?auto_22663 ) ) ( not ( = ?auto_22621 ?auto_22626 ) ) ( not ( = ?auto_22621 ?auto_22663 ) ) ( not ( = ?auto_22622 ?auto_22626 ) ) ( not ( = ?auto_22622 ?auto_22663 ) ) ( not ( = ?auto_22626 ?auto_22654 ) ) ( not ( = ?auto_22626 ?auto_22650 ) ) ( not ( = ?auto_22626 ?auto_22646 ) ) ( not ( = ?auto_22626 ?auto_22644 ) ) ( not ( = ?auto_22626 ?auto_22662 ) ) ( not ( = ?auto_22647 ?auto_22658 ) ) ( not ( = ?auto_22647 ?auto_22637 ) ) ( not ( = ?auto_22647 ?auto_22656 ) ) ( not ( = ?auto_22647 ?auto_22636 ) ) ( not ( = ?auto_22647 ?auto_22638 ) ) ( not ( = ?auto_22643 ?auto_22649 ) ) ( not ( = ?auto_22643 ?auto_22645 ) ) ( not ( = ?auto_22643 ?auto_22660 ) ) ( not ( = ?auto_22643 ?auto_22634 ) ) ( not ( = ?auto_22643 ?auto_22661 ) ) ( not ( = ?auto_22663 ?auto_22654 ) ) ( not ( = ?auto_22663 ?auto_22650 ) ) ( not ( = ?auto_22663 ?auto_22646 ) ) ( not ( = ?auto_22663 ?auto_22644 ) ) ( not ( = ?auto_22663 ?auto_22662 ) ) ( not ( = ?auto_22618 ?auto_22625 ) ) ( not ( = ?auto_22618 ?auto_22652 ) ) ( not ( = ?auto_22619 ?auto_22625 ) ) ( not ( = ?auto_22619 ?auto_22652 ) ) ( not ( = ?auto_22620 ?auto_22625 ) ) ( not ( = ?auto_22620 ?auto_22652 ) ) ( not ( = ?auto_22621 ?auto_22625 ) ) ( not ( = ?auto_22621 ?auto_22652 ) ) ( not ( = ?auto_22622 ?auto_22625 ) ) ( not ( = ?auto_22622 ?auto_22652 ) ) ( not ( = ?auto_22623 ?auto_22625 ) ) ( not ( = ?auto_22623 ?auto_22652 ) ) ( not ( = ?auto_22625 ?auto_22663 ) ) ( not ( = ?auto_22625 ?auto_22654 ) ) ( not ( = ?auto_22625 ?auto_22650 ) ) ( not ( = ?auto_22625 ?auto_22646 ) ) ( not ( = ?auto_22625 ?auto_22644 ) ) ( not ( = ?auto_22625 ?auto_22662 ) ) ( not ( = ?auto_22655 ?auto_22647 ) ) ( not ( = ?auto_22655 ?auto_22658 ) ) ( not ( = ?auto_22655 ?auto_22637 ) ) ( not ( = ?auto_22655 ?auto_22656 ) ) ( not ( = ?auto_22655 ?auto_22636 ) ) ( not ( = ?auto_22655 ?auto_22638 ) ) ( not ( = ?auto_22659 ?auto_22643 ) ) ( not ( = ?auto_22659 ?auto_22649 ) ) ( not ( = ?auto_22659 ?auto_22645 ) ) ( not ( = ?auto_22659 ?auto_22660 ) ) ( not ( = ?auto_22659 ?auto_22634 ) ) ( not ( = ?auto_22659 ?auto_22661 ) ) ( not ( = ?auto_22652 ?auto_22663 ) ) ( not ( = ?auto_22652 ?auto_22654 ) ) ( not ( = ?auto_22652 ?auto_22650 ) ) ( not ( = ?auto_22652 ?auto_22646 ) ) ( not ( = ?auto_22652 ?auto_22644 ) ) ( not ( = ?auto_22652 ?auto_22662 ) ) ( not ( = ?auto_22618 ?auto_22624 ) ) ( not ( = ?auto_22618 ?auto_22648 ) ) ( not ( = ?auto_22619 ?auto_22624 ) ) ( not ( = ?auto_22619 ?auto_22648 ) ) ( not ( = ?auto_22620 ?auto_22624 ) ) ( not ( = ?auto_22620 ?auto_22648 ) ) ( not ( = ?auto_22621 ?auto_22624 ) ) ( not ( = ?auto_22621 ?auto_22648 ) ) ( not ( = ?auto_22622 ?auto_22624 ) ) ( not ( = ?auto_22622 ?auto_22648 ) ) ( not ( = ?auto_22623 ?auto_22624 ) ) ( not ( = ?auto_22623 ?auto_22648 ) ) ( not ( = ?auto_22626 ?auto_22624 ) ) ( not ( = ?auto_22626 ?auto_22648 ) ) ( not ( = ?auto_22624 ?auto_22652 ) ) ( not ( = ?auto_22624 ?auto_22663 ) ) ( not ( = ?auto_22624 ?auto_22654 ) ) ( not ( = ?auto_22624 ?auto_22650 ) ) ( not ( = ?auto_22624 ?auto_22646 ) ) ( not ( = ?auto_22624 ?auto_22644 ) ) ( not ( = ?auto_22624 ?auto_22662 ) ) ( not ( = ?auto_22648 ?auto_22652 ) ) ( not ( = ?auto_22648 ?auto_22663 ) ) ( not ( = ?auto_22648 ?auto_22654 ) ) ( not ( = ?auto_22648 ?auto_22650 ) ) ( not ( = ?auto_22648 ?auto_22646 ) ) ( not ( = ?auto_22648 ?auto_22644 ) ) ( not ( = ?auto_22648 ?auto_22662 ) ) ( not ( = ?auto_22618 ?auto_22627 ) ) ( not ( = ?auto_22618 ?auto_22651 ) ) ( not ( = ?auto_22619 ?auto_22627 ) ) ( not ( = ?auto_22619 ?auto_22651 ) ) ( not ( = ?auto_22620 ?auto_22627 ) ) ( not ( = ?auto_22620 ?auto_22651 ) ) ( not ( = ?auto_22621 ?auto_22627 ) ) ( not ( = ?auto_22621 ?auto_22651 ) ) ( not ( = ?auto_22622 ?auto_22627 ) ) ( not ( = ?auto_22622 ?auto_22651 ) ) ( not ( = ?auto_22623 ?auto_22627 ) ) ( not ( = ?auto_22623 ?auto_22651 ) ) ( not ( = ?auto_22626 ?auto_22627 ) ) ( not ( = ?auto_22626 ?auto_22651 ) ) ( not ( = ?auto_22625 ?auto_22627 ) ) ( not ( = ?auto_22625 ?auto_22651 ) ) ( not ( = ?auto_22627 ?auto_22648 ) ) ( not ( = ?auto_22627 ?auto_22652 ) ) ( not ( = ?auto_22627 ?auto_22663 ) ) ( not ( = ?auto_22627 ?auto_22654 ) ) ( not ( = ?auto_22627 ?auto_22650 ) ) ( not ( = ?auto_22627 ?auto_22646 ) ) ( not ( = ?auto_22627 ?auto_22644 ) ) ( not ( = ?auto_22627 ?auto_22662 ) ) ( not ( = ?auto_22653 ?auto_22637 ) ) ( not ( = ?auto_22653 ?auto_22655 ) ) ( not ( = ?auto_22653 ?auto_22647 ) ) ( not ( = ?auto_22653 ?auto_22658 ) ) ( not ( = ?auto_22653 ?auto_22656 ) ) ( not ( = ?auto_22653 ?auto_22636 ) ) ( not ( = ?auto_22653 ?auto_22638 ) ) ( not ( = ?auto_22639 ?auto_22645 ) ) ( not ( = ?auto_22639 ?auto_22659 ) ) ( not ( = ?auto_22639 ?auto_22643 ) ) ( not ( = ?auto_22639 ?auto_22649 ) ) ( not ( = ?auto_22639 ?auto_22660 ) ) ( not ( = ?auto_22639 ?auto_22634 ) ) ( not ( = ?auto_22639 ?auto_22661 ) ) ( not ( = ?auto_22651 ?auto_22648 ) ) ( not ( = ?auto_22651 ?auto_22652 ) ) ( not ( = ?auto_22651 ?auto_22663 ) ) ( not ( = ?auto_22651 ?auto_22654 ) ) ( not ( = ?auto_22651 ?auto_22650 ) ) ( not ( = ?auto_22651 ?auto_22646 ) ) ( not ( = ?auto_22651 ?auto_22644 ) ) ( not ( = ?auto_22651 ?auto_22662 ) ) ( not ( = ?auto_22618 ?auto_22629 ) ) ( not ( = ?auto_22618 ?auto_22642 ) ) ( not ( = ?auto_22619 ?auto_22629 ) ) ( not ( = ?auto_22619 ?auto_22642 ) ) ( not ( = ?auto_22620 ?auto_22629 ) ) ( not ( = ?auto_22620 ?auto_22642 ) ) ( not ( = ?auto_22621 ?auto_22629 ) ) ( not ( = ?auto_22621 ?auto_22642 ) ) ( not ( = ?auto_22622 ?auto_22629 ) ) ( not ( = ?auto_22622 ?auto_22642 ) ) ( not ( = ?auto_22623 ?auto_22629 ) ) ( not ( = ?auto_22623 ?auto_22642 ) ) ( not ( = ?auto_22626 ?auto_22629 ) ) ( not ( = ?auto_22626 ?auto_22642 ) ) ( not ( = ?auto_22625 ?auto_22629 ) ) ( not ( = ?auto_22625 ?auto_22642 ) ) ( not ( = ?auto_22624 ?auto_22629 ) ) ( not ( = ?auto_22624 ?auto_22642 ) ) ( not ( = ?auto_22629 ?auto_22651 ) ) ( not ( = ?auto_22629 ?auto_22648 ) ) ( not ( = ?auto_22629 ?auto_22652 ) ) ( not ( = ?auto_22629 ?auto_22663 ) ) ( not ( = ?auto_22629 ?auto_22654 ) ) ( not ( = ?auto_22629 ?auto_22650 ) ) ( not ( = ?auto_22629 ?auto_22646 ) ) ( not ( = ?auto_22629 ?auto_22644 ) ) ( not ( = ?auto_22629 ?auto_22662 ) ) ( not ( = ?auto_22642 ?auto_22651 ) ) ( not ( = ?auto_22642 ?auto_22648 ) ) ( not ( = ?auto_22642 ?auto_22652 ) ) ( not ( = ?auto_22642 ?auto_22663 ) ) ( not ( = ?auto_22642 ?auto_22654 ) ) ( not ( = ?auto_22642 ?auto_22650 ) ) ( not ( = ?auto_22642 ?auto_22646 ) ) ( not ( = ?auto_22642 ?auto_22644 ) ) ( not ( = ?auto_22642 ?auto_22662 ) ) ( not ( = ?auto_22618 ?auto_22628 ) ) ( not ( = ?auto_22618 ?auto_22641 ) ) ( not ( = ?auto_22619 ?auto_22628 ) ) ( not ( = ?auto_22619 ?auto_22641 ) ) ( not ( = ?auto_22620 ?auto_22628 ) ) ( not ( = ?auto_22620 ?auto_22641 ) ) ( not ( = ?auto_22621 ?auto_22628 ) ) ( not ( = ?auto_22621 ?auto_22641 ) ) ( not ( = ?auto_22622 ?auto_22628 ) ) ( not ( = ?auto_22622 ?auto_22641 ) ) ( not ( = ?auto_22623 ?auto_22628 ) ) ( not ( = ?auto_22623 ?auto_22641 ) ) ( not ( = ?auto_22626 ?auto_22628 ) ) ( not ( = ?auto_22626 ?auto_22641 ) ) ( not ( = ?auto_22625 ?auto_22628 ) ) ( not ( = ?auto_22625 ?auto_22641 ) ) ( not ( = ?auto_22624 ?auto_22628 ) ) ( not ( = ?auto_22624 ?auto_22641 ) ) ( not ( = ?auto_22627 ?auto_22628 ) ) ( not ( = ?auto_22627 ?auto_22641 ) ) ( not ( = ?auto_22628 ?auto_22642 ) ) ( not ( = ?auto_22628 ?auto_22651 ) ) ( not ( = ?auto_22628 ?auto_22648 ) ) ( not ( = ?auto_22628 ?auto_22652 ) ) ( not ( = ?auto_22628 ?auto_22663 ) ) ( not ( = ?auto_22628 ?auto_22654 ) ) ( not ( = ?auto_22628 ?auto_22650 ) ) ( not ( = ?auto_22628 ?auto_22646 ) ) ( not ( = ?auto_22628 ?auto_22644 ) ) ( not ( = ?auto_22628 ?auto_22662 ) ) ( not ( = ?auto_22640 ?auto_22637 ) ) ( not ( = ?auto_22640 ?auto_22653 ) ) ( not ( = ?auto_22640 ?auto_22655 ) ) ( not ( = ?auto_22640 ?auto_22647 ) ) ( not ( = ?auto_22640 ?auto_22658 ) ) ( not ( = ?auto_22640 ?auto_22656 ) ) ( not ( = ?auto_22640 ?auto_22636 ) ) ( not ( = ?auto_22640 ?auto_22638 ) ) ( not ( = ?auto_22657 ?auto_22645 ) ) ( not ( = ?auto_22657 ?auto_22639 ) ) ( not ( = ?auto_22657 ?auto_22659 ) ) ( not ( = ?auto_22657 ?auto_22643 ) ) ( not ( = ?auto_22657 ?auto_22649 ) ) ( not ( = ?auto_22657 ?auto_22660 ) ) ( not ( = ?auto_22657 ?auto_22634 ) ) ( not ( = ?auto_22657 ?auto_22661 ) ) ( not ( = ?auto_22641 ?auto_22642 ) ) ( not ( = ?auto_22641 ?auto_22651 ) ) ( not ( = ?auto_22641 ?auto_22648 ) ) ( not ( = ?auto_22641 ?auto_22652 ) ) ( not ( = ?auto_22641 ?auto_22663 ) ) ( not ( = ?auto_22641 ?auto_22654 ) ) ( not ( = ?auto_22641 ?auto_22650 ) ) ( not ( = ?auto_22641 ?auto_22646 ) ) ( not ( = ?auto_22641 ?auto_22644 ) ) ( not ( = ?auto_22641 ?auto_22662 ) ) ( not ( = ?auto_22618 ?auto_22630 ) ) ( not ( = ?auto_22618 ?auto_22632 ) ) ( not ( = ?auto_22619 ?auto_22630 ) ) ( not ( = ?auto_22619 ?auto_22632 ) ) ( not ( = ?auto_22620 ?auto_22630 ) ) ( not ( = ?auto_22620 ?auto_22632 ) ) ( not ( = ?auto_22621 ?auto_22630 ) ) ( not ( = ?auto_22621 ?auto_22632 ) ) ( not ( = ?auto_22622 ?auto_22630 ) ) ( not ( = ?auto_22622 ?auto_22632 ) ) ( not ( = ?auto_22623 ?auto_22630 ) ) ( not ( = ?auto_22623 ?auto_22632 ) ) ( not ( = ?auto_22626 ?auto_22630 ) ) ( not ( = ?auto_22626 ?auto_22632 ) ) ( not ( = ?auto_22625 ?auto_22630 ) ) ( not ( = ?auto_22625 ?auto_22632 ) ) ( not ( = ?auto_22624 ?auto_22630 ) ) ( not ( = ?auto_22624 ?auto_22632 ) ) ( not ( = ?auto_22627 ?auto_22630 ) ) ( not ( = ?auto_22627 ?auto_22632 ) ) ( not ( = ?auto_22629 ?auto_22630 ) ) ( not ( = ?auto_22629 ?auto_22632 ) ) ( not ( = ?auto_22630 ?auto_22641 ) ) ( not ( = ?auto_22630 ?auto_22642 ) ) ( not ( = ?auto_22630 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22648 ) ) ( not ( = ?auto_22630 ?auto_22652 ) ) ( not ( = ?auto_22630 ?auto_22663 ) ) ( not ( = ?auto_22630 ?auto_22654 ) ) ( not ( = ?auto_22630 ?auto_22650 ) ) ( not ( = ?auto_22630 ?auto_22646 ) ) ( not ( = ?auto_22630 ?auto_22644 ) ) ( not ( = ?auto_22630 ?auto_22662 ) ) ( not ( = ?auto_22632 ?auto_22641 ) ) ( not ( = ?auto_22632 ?auto_22642 ) ) ( not ( = ?auto_22632 ?auto_22651 ) ) ( not ( = ?auto_22632 ?auto_22648 ) ) ( not ( = ?auto_22632 ?auto_22652 ) ) ( not ( = ?auto_22632 ?auto_22663 ) ) ( not ( = ?auto_22632 ?auto_22654 ) ) ( not ( = ?auto_22632 ?auto_22650 ) ) ( not ( = ?auto_22632 ?auto_22646 ) ) ( not ( = ?auto_22632 ?auto_22644 ) ) ( not ( = ?auto_22632 ?auto_22662 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_22618 ?auto_22619 ?auto_22620 ?auto_22621 ?auto_22622 ?auto_22623 ?auto_22626 ?auto_22625 ?auto_22624 ?auto_22627 ?auto_22629 ?auto_22628 )
      ( MAKE-1CRATE ?auto_22628 ?auto_22630 )
      ( MAKE-12CRATE-VERIFY ?auto_22618 ?auto_22619 ?auto_22620 ?auto_22621 ?auto_22622 ?auto_22623 ?auto_22626 ?auto_22625 ?auto_22624 ?auto_22627 ?auto_22629 ?auto_22628 ?auto_22630 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22666 - SURFACE
      ?auto_22667 - SURFACE
    )
    :vars
    (
      ?auto_22668 - HOIST
      ?auto_22669 - PLACE
      ?auto_22671 - PLACE
      ?auto_22672 - HOIST
      ?auto_22673 - SURFACE
      ?auto_22670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22668 ?auto_22669 ) ( SURFACE-AT ?auto_22666 ?auto_22669 ) ( CLEAR ?auto_22666 ) ( IS-CRATE ?auto_22667 ) ( AVAILABLE ?auto_22668 ) ( not ( = ?auto_22671 ?auto_22669 ) ) ( HOIST-AT ?auto_22672 ?auto_22671 ) ( AVAILABLE ?auto_22672 ) ( SURFACE-AT ?auto_22667 ?auto_22671 ) ( ON ?auto_22667 ?auto_22673 ) ( CLEAR ?auto_22667 ) ( TRUCK-AT ?auto_22670 ?auto_22669 ) ( not ( = ?auto_22666 ?auto_22667 ) ) ( not ( = ?auto_22666 ?auto_22673 ) ) ( not ( = ?auto_22667 ?auto_22673 ) ) ( not ( = ?auto_22668 ?auto_22672 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22670 ?auto_22669 ?auto_22671 )
      ( !LIFT ?auto_22672 ?auto_22667 ?auto_22673 ?auto_22671 )
      ( !LOAD ?auto_22672 ?auto_22667 ?auto_22670 ?auto_22671 )
      ( !DRIVE ?auto_22670 ?auto_22671 ?auto_22669 )
      ( !UNLOAD ?auto_22668 ?auto_22667 ?auto_22670 ?auto_22669 )
      ( !DROP ?auto_22668 ?auto_22667 ?auto_22666 ?auto_22669 )
      ( MAKE-1CRATE-VERIFY ?auto_22666 ?auto_22667 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_22688 - SURFACE
      ?auto_22689 - SURFACE
      ?auto_22690 - SURFACE
      ?auto_22691 - SURFACE
      ?auto_22692 - SURFACE
      ?auto_22693 - SURFACE
      ?auto_22696 - SURFACE
      ?auto_22695 - SURFACE
      ?auto_22694 - SURFACE
      ?auto_22697 - SURFACE
      ?auto_22699 - SURFACE
      ?auto_22698 - SURFACE
      ?auto_22700 - SURFACE
      ?auto_22701 - SURFACE
    )
    :vars
    (
      ?auto_22705 - HOIST
      ?auto_22702 - PLACE
      ?auto_22707 - PLACE
      ?auto_22706 - HOIST
      ?auto_22703 - SURFACE
      ?auto_22716 - PLACE
      ?auto_22719 - HOIST
      ?auto_22709 - SURFACE
      ?auto_22721 - PLACE
      ?auto_22729 - HOIST
      ?auto_22737 - SURFACE
      ?auto_22720 - PLACE
      ?auto_22724 - HOIST
      ?auto_22725 - SURFACE
      ?auto_22708 - PLACE
      ?auto_22722 - HOIST
      ?auto_22715 - SURFACE
      ?auto_22723 - SURFACE
      ?auto_22734 - PLACE
      ?auto_22714 - HOIST
      ?auto_22730 - SURFACE
      ?auto_22728 - PLACE
      ?auto_22732 - HOIST
      ?auto_22711 - SURFACE
      ?auto_22736 - PLACE
      ?auto_22726 - HOIST
      ?auto_22713 - SURFACE
      ?auto_22717 - SURFACE
      ?auto_22712 - PLACE
      ?auto_22710 - HOIST
      ?auto_22735 - SURFACE
      ?auto_22733 - SURFACE
      ?auto_22731 - PLACE
      ?auto_22727 - HOIST
      ?auto_22718 - SURFACE
      ?auto_22704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22705 ?auto_22702 ) ( IS-CRATE ?auto_22701 ) ( not ( = ?auto_22707 ?auto_22702 ) ) ( HOIST-AT ?auto_22706 ?auto_22707 ) ( AVAILABLE ?auto_22706 ) ( SURFACE-AT ?auto_22701 ?auto_22707 ) ( ON ?auto_22701 ?auto_22703 ) ( CLEAR ?auto_22701 ) ( not ( = ?auto_22700 ?auto_22701 ) ) ( not ( = ?auto_22700 ?auto_22703 ) ) ( not ( = ?auto_22701 ?auto_22703 ) ) ( not ( = ?auto_22705 ?auto_22706 ) ) ( IS-CRATE ?auto_22700 ) ( not ( = ?auto_22716 ?auto_22702 ) ) ( HOIST-AT ?auto_22719 ?auto_22716 ) ( SURFACE-AT ?auto_22700 ?auto_22716 ) ( ON ?auto_22700 ?auto_22709 ) ( CLEAR ?auto_22700 ) ( not ( = ?auto_22698 ?auto_22700 ) ) ( not ( = ?auto_22698 ?auto_22709 ) ) ( not ( = ?auto_22700 ?auto_22709 ) ) ( not ( = ?auto_22705 ?auto_22719 ) ) ( IS-CRATE ?auto_22698 ) ( not ( = ?auto_22721 ?auto_22702 ) ) ( HOIST-AT ?auto_22729 ?auto_22721 ) ( AVAILABLE ?auto_22729 ) ( SURFACE-AT ?auto_22698 ?auto_22721 ) ( ON ?auto_22698 ?auto_22737 ) ( CLEAR ?auto_22698 ) ( not ( = ?auto_22699 ?auto_22698 ) ) ( not ( = ?auto_22699 ?auto_22737 ) ) ( not ( = ?auto_22698 ?auto_22737 ) ) ( not ( = ?auto_22705 ?auto_22729 ) ) ( IS-CRATE ?auto_22699 ) ( not ( = ?auto_22720 ?auto_22702 ) ) ( HOIST-AT ?auto_22724 ?auto_22720 ) ( SURFACE-AT ?auto_22699 ?auto_22720 ) ( ON ?auto_22699 ?auto_22725 ) ( CLEAR ?auto_22699 ) ( not ( = ?auto_22697 ?auto_22699 ) ) ( not ( = ?auto_22697 ?auto_22725 ) ) ( not ( = ?auto_22699 ?auto_22725 ) ) ( not ( = ?auto_22705 ?auto_22724 ) ) ( IS-CRATE ?auto_22697 ) ( not ( = ?auto_22708 ?auto_22702 ) ) ( HOIST-AT ?auto_22722 ?auto_22708 ) ( AVAILABLE ?auto_22722 ) ( SURFACE-AT ?auto_22697 ?auto_22708 ) ( ON ?auto_22697 ?auto_22715 ) ( CLEAR ?auto_22697 ) ( not ( = ?auto_22694 ?auto_22697 ) ) ( not ( = ?auto_22694 ?auto_22715 ) ) ( not ( = ?auto_22697 ?auto_22715 ) ) ( not ( = ?auto_22705 ?auto_22722 ) ) ( IS-CRATE ?auto_22694 ) ( SURFACE-AT ?auto_22694 ?auto_22720 ) ( ON ?auto_22694 ?auto_22723 ) ( CLEAR ?auto_22694 ) ( not ( = ?auto_22695 ?auto_22694 ) ) ( not ( = ?auto_22695 ?auto_22723 ) ) ( not ( = ?auto_22694 ?auto_22723 ) ) ( IS-CRATE ?auto_22695 ) ( not ( = ?auto_22734 ?auto_22702 ) ) ( HOIST-AT ?auto_22714 ?auto_22734 ) ( AVAILABLE ?auto_22714 ) ( SURFACE-AT ?auto_22695 ?auto_22734 ) ( ON ?auto_22695 ?auto_22730 ) ( CLEAR ?auto_22695 ) ( not ( = ?auto_22696 ?auto_22695 ) ) ( not ( = ?auto_22696 ?auto_22730 ) ) ( not ( = ?auto_22695 ?auto_22730 ) ) ( not ( = ?auto_22705 ?auto_22714 ) ) ( IS-CRATE ?auto_22696 ) ( not ( = ?auto_22728 ?auto_22702 ) ) ( HOIST-AT ?auto_22732 ?auto_22728 ) ( AVAILABLE ?auto_22732 ) ( SURFACE-AT ?auto_22696 ?auto_22728 ) ( ON ?auto_22696 ?auto_22711 ) ( CLEAR ?auto_22696 ) ( not ( = ?auto_22693 ?auto_22696 ) ) ( not ( = ?auto_22693 ?auto_22711 ) ) ( not ( = ?auto_22696 ?auto_22711 ) ) ( not ( = ?auto_22705 ?auto_22732 ) ) ( IS-CRATE ?auto_22693 ) ( not ( = ?auto_22736 ?auto_22702 ) ) ( HOIST-AT ?auto_22726 ?auto_22736 ) ( AVAILABLE ?auto_22726 ) ( SURFACE-AT ?auto_22693 ?auto_22736 ) ( ON ?auto_22693 ?auto_22713 ) ( CLEAR ?auto_22693 ) ( not ( = ?auto_22692 ?auto_22693 ) ) ( not ( = ?auto_22692 ?auto_22713 ) ) ( not ( = ?auto_22693 ?auto_22713 ) ) ( not ( = ?auto_22705 ?auto_22726 ) ) ( IS-CRATE ?auto_22692 ) ( AVAILABLE ?auto_22724 ) ( SURFACE-AT ?auto_22692 ?auto_22720 ) ( ON ?auto_22692 ?auto_22717 ) ( CLEAR ?auto_22692 ) ( not ( = ?auto_22691 ?auto_22692 ) ) ( not ( = ?auto_22691 ?auto_22717 ) ) ( not ( = ?auto_22692 ?auto_22717 ) ) ( IS-CRATE ?auto_22691 ) ( not ( = ?auto_22712 ?auto_22702 ) ) ( HOIST-AT ?auto_22710 ?auto_22712 ) ( AVAILABLE ?auto_22710 ) ( SURFACE-AT ?auto_22691 ?auto_22712 ) ( ON ?auto_22691 ?auto_22735 ) ( CLEAR ?auto_22691 ) ( not ( = ?auto_22690 ?auto_22691 ) ) ( not ( = ?auto_22690 ?auto_22735 ) ) ( not ( = ?auto_22691 ?auto_22735 ) ) ( not ( = ?auto_22705 ?auto_22710 ) ) ( IS-CRATE ?auto_22690 ) ( AVAILABLE ?auto_22719 ) ( SURFACE-AT ?auto_22690 ?auto_22716 ) ( ON ?auto_22690 ?auto_22733 ) ( CLEAR ?auto_22690 ) ( not ( = ?auto_22689 ?auto_22690 ) ) ( not ( = ?auto_22689 ?auto_22733 ) ) ( not ( = ?auto_22690 ?auto_22733 ) ) ( SURFACE-AT ?auto_22688 ?auto_22702 ) ( CLEAR ?auto_22688 ) ( IS-CRATE ?auto_22689 ) ( AVAILABLE ?auto_22705 ) ( not ( = ?auto_22731 ?auto_22702 ) ) ( HOIST-AT ?auto_22727 ?auto_22731 ) ( AVAILABLE ?auto_22727 ) ( SURFACE-AT ?auto_22689 ?auto_22731 ) ( ON ?auto_22689 ?auto_22718 ) ( CLEAR ?auto_22689 ) ( TRUCK-AT ?auto_22704 ?auto_22702 ) ( not ( = ?auto_22688 ?auto_22689 ) ) ( not ( = ?auto_22688 ?auto_22718 ) ) ( not ( = ?auto_22689 ?auto_22718 ) ) ( not ( = ?auto_22705 ?auto_22727 ) ) ( not ( = ?auto_22688 ?auto_22690 ) ) ( not ( = ?auto_22688 ?auto_22733 ) ) ( not ( = ?auto_22690 ?auto_22718 ) ) ( not ( = ?auto_22716 ?auto_22731 ) ) ( not ( = ?auto_22719 ?auto_22727 ) ) ( not ( = ?auto_22733 ?auto_22718 ) ) ( not ( = ?auto_22688 ?auto_22691 ) ) ( not ( = ?auto_22688 ?auto_22735 ) ) ( not ( = ?auto_22689 ?auto_22691 ) ) ( not ( = ?auto_22689 ?auto_22735 ) ) ( not ( = ?auto_22691 ?auto_22733 ) ) ( not ( = ?auto_22691 ?auto_22718 ) ) ( not ( = ?auto_22712 ?auto_22716 ) ) ( not ( = ?auto_22712 ?auto_22731 ) ) ( not ( = ?auto_22710 ?auto_22719 ) ) ( not ( = ?auto_22710 ?auto_22727 ) ) ( not ( = ?auto_22735 ?auto_22733 ) ) ( not ( = ?auto_22735 ?auto_22718 ) ) ( not ( = ?auto_22688 ?auto_22692 ) ) ( not ( = ?auto_22688 ?auto_22717 ) ) ( not ( = ?auto_22689 ?auto_22692 ) ) ( not ( = ?auto_22689 ?auto_22717 ) ) ( not ( = ?auto_22690 ?auto_22692 ) ) ( not ( = ?auto_22690 ?auto_22717 ) ) ( not ( = ?auto_22692 ?auto_22735 ) ) ( not ( = ?auto_22692 ?auto_22733 ) ) ( not ( = ?auto_22692 ?auto_22718 ) ) ( not ( = ?auto_22720 ?auto_22712 ) ) ( not ( = ?auto_22720 ?auto_22716 ) ) ( not ( = ?auto_22720 ?auto_22731 ) ) ( not ( = ?auto_22724 ?auto_22710 ) ) ( not ( = ?auto_22724 ?auto_22719 ) ) ( not ( = ?auto_22724 ?auto_22727 ) ) ( not ( = ?auto_22717 ?auto_22735 ) ) ( not ( = ?auto_22717 ?auto_22733 ) ) ( not ( = ?auto_22717 ?auto_22718 ) ) ( not ( = ?auto_22688 ?auto_22693 ) ) ( not ( = ?auto_22688 ?auto_22713 ) ) ( not ( = ?auto_22689 ?auto_22693 ) ) ( not ( = ?auto_22689 ?auto_22713 ) ) ( not ( = ?auto_22690 ?auto_22693 ) ) ( not ( = ?auto_22690 ?auto_22713 ) ) ( not ( = ?auto_22691 ?auto_22693 ) ) ( not ( = ?auto_22691 ?auto_22713 ) ) ( not ( = ?auto_22693 ?auto_22717 ) ) ( not ( = ?auto_22693 ?auto_22735 ) ) ( not ( = ?auto_22693 ?auto_22733 ) ) ( not ( = ?auto_22693 ?auto_22718 ) ) ( not ( = ?auto_22736 ?auto_22720 ) ) ( not ( = ?auto_22736 ?auto_22712 ) ) ( not ( = ?auto_22736 ?auto_22716 ) ) ( not ( = ?auto_22736 ?auto_22731 ) ) ( not ( = ?auto_22726 ?auto_22724 ) ) ( not ( = ?auto_22726 ?auto_22710 ) ) ( not ( = ?auto_22726 ?auto_22719 ) ) ( not ( = ?auto_22726 ?auto_22727 ) ) ( not ( = ?auto_22713 ?auto_22717 ) ) ( not ( = ?auto_22713 ?auto_22735 ) ) ( not ( = ?auto_22713 ?auto_22733 ) ) ( not ( = ?auto_22713 ?auto_22718 ) ) ( not ( = ?auto_22688 ?auto_22696 ) ) ( not ( = ?auto_22688 ?auto_22711 ) ) ( not ( = ?auto_22689 ?auto_22696 ) ) ( not ( = ?auto_22689 ?auto_22711 ) ) ( not ( = ?auto_22690 ?auto_22696 ) ) ( not ( = ?auto_22690 ?auto_22711 ) ) ( not ( = ?auto_22691 ?auto_22696 ) ) ( not ( = ?auto_22691 ?auto_22711 ) ) ( not ( = ?auto_22692 ?auto_22696 ) ) ( not ( = ?auto_22692 ?auto_22711 ) ) ( not ( = ?auto_22696 ?auto_22713 ) ) ( not ( = ?auto_22696 ?auto_22717 ) ) ( not ( = ?auto_22696 ?auto_22735 ) ) ( not ( = ?auto_22696 ?auto_22733 ) ) ( not ( = ?auto_22696 ?auto_22718 ) ) ( not ( = ?auto_22728 ?auto_22736 ) ) ( not ( = ?auto_22728 ?auto_22720 ) ) ( not ( = ?auto_22728 ?auto_22712 ) ) ( not ( = ?auto_22728 ?auto_22716 ) ) ( not ( = ?auto_22728 ?auto_22731 ) ) ( not ( = ?auto_22732 ?auto_22726 ) ) ( not ( = ?auto_22732 ?auto_22724 ) ) ( not ( = ?auto_22732 ?auto_22710 ) ) ( not ( = ?auto_22732 ?auto_22719 ) ) ( not ( = ?auto_22732 ?auto_22727 ) ) ( not ( = ?auto_22711 ?auto_22713 ) ) ( not ( = ?auto_22711 ?auto_22717 ) ) ( not ( = ?auto_22711 ?auto_22735 ) ) ( not ( = ?auto_22711 ?auto_22733 ) ) ( not ( = ?auto_22711 ?auto_22718 ) ) ( not ( = ?auto_22688 ?auto_22695 ) ) ( not ( = ?auto_22688 ?auto_22730 ) ) ( not ( = ?auto_22689 ?auto_22695 ) ) ( not ( = ?auto_22689 ?auto_22730 ) ) ( not ( = ?auto_22690 ?auto_22695 ) ) ( not ( = ?auto_22690 ?auto_22730 ) ) ( not ( = ?auto_22691 ?auto_22695 ) ) ( not ( = ?auto_22691 ?auto_22730 ) ) ( not ( = ?auto_22692 ?auto_22695 ) ) ( not ( = ?auto_22692 ?auto_22730 ) ) ( not ( = ?auto_22693 ?auto_22695 ) ) ( not ( = ?auto_22693 ?auto_22730 ) ) ( not ( = ?auto_22695 ?auto_22711 ) ) ( not ( = ?auto_22695 ?auto_22713 ) ) ( not ( = ?auto_22695 ?auto_22717 ) ) ( not ( = ?auto_22695 ?auto_22735 ) ) ( not ( = ?auto_22695 ?auto_22733 ) ) ( not ( = ?auto_22695 ?auto_22718 ) ) ( not ( = ?auto_22734 ?auto_22728 ) ) ( not ( = ?auto_22734 ?auto_22736 ) ) ( not ( = ?auto_22734 ?auto_22720 ) ) ( not ( = ?auto_22734 ?auto_22712 ) ) ( not ( = ?auto_22734 ?auto_22716 ) ) ( not ( = ?auto_22734 ?auto_22731 ) ) ( not ( = ?auto_22714 ?auto_22732 ) ) ( not ( = ?auto_22714 ?auto_22726 ) ) ( not ( = ?auto_22714 ?auto_22724 ) ) ( not ( = ?auto_22714 ?auto_22710 ) ) ( not ( = ?auto_22714 ?auto_22719 ) ) ( not ( = ?auto_22714 ?auto_22727 ) ) ( not ( = ?auto_22730 ?auto_22711 ) ) ( not ( = ?auto_22730 ?auto_22713 ) ) ( not ( = ?auto_22730 ?auto_22717 ) ) ( not ( = ?auto_22730 ?auto_22735 ) ) ( not ( = ?auto_22730 ?auto_22733 ) ) ( not ( = ?auto_22730 ?auto_22718 ) ) ( not ( = ?auto_22688 ?auto_22694 ) ) ( not ( = ?auto_22688 ?auto_22723 ) ) ( not ( = ?auto_22689 ?auto_22694 ) ) ( not ( = ?auto_22689 ?auto_22723 ) ) ( not ( = ?auto_22690 ?auto_22694 ) ) ( not ( = ?auto_22690 ?auto_22723 ) ) ( not ( = ?auto_22691 ?auto_22694 ) ) ( not ( = ?auto_22691 ?auto_22723 ) ) ( not ( = ?auto_22692 ?auto_22694 ) ) ( not ( = ?auto_22692 ?auto_22723 ) ) ( not ( = ?auto_22693 ?auto_22694 ) ) ( not ( = ?auto_22693 ?auto_22723 ) ) ( not ( = ?auto_22696 ?auto_22694 ) ) ( not ( = ?auto_22696 ?auto_22723 ) ) ( not ( = ?auto_22694 ?auto_22730 ) ) ( not ( = ?auto_22694 ?auto_22711 ) ) ( not ( = ?auto_22694 ?auto_22713 ) ) ( not ( = ?auto_22694 ?auto_22717 ) ) ( not ( = ?auto_22694 ?auto_22735 ) ) ( not ( = ?auto_22694 ?auto_22733 ) ) ( not ( = ?auto_22694 ?auto_22718 ) ) ( not ( = ?auto_22723 ?auto_22730 ) ) ( not ( = ?auto_22723 ?auto_22711 ) ) ( not ( = ?auto_22723 ?auto_22713 ) ) ( not ( = ?auto_22723 ?auto_22717 ) ) ( not ( = ?auto_22723 ?auto_22735 ) ) ( not ( = ?auto_22723 ?auto_22733 ) ) ( not ( = ?auto_22723 ?auto_22718 ) ) ( not ( = ?auto_22688 ?auto_22697 ) ) ( not ( = ?auto_22688 ?auto_22715 ) ) ( not ( = ?auto_22689 ?auto_22697 ) ) ( not ( = ?auto_22689 ?auto_22715 ) ) ( not ( = ?auto_22690 ?auto_22697 ) ) ( not ( = ?auto_22690 ?auto_22715 ) ) ( not ( = ?auto_22691 ?auto_22697 ) ) ( not ( = ?auto_22691 ?auto_22715 ) ) ( not ( = ?auto_22692 ?auto_22697 ) ) ( not ( = ?auto_22692 ?auto_22715 ) ) ( not ( = ?auto_22693 ?auto_22697 ) ) ( not ( = ?auto_22693 ?auto_22715 ) ) ( not ( = ?auto_22696 ?auto_22697 ) ) ( not ( = ?auto_22696 ?auto_22715 ) ) ( not ( = ?auto_22695 ?auto_22697 ) ) ( not ( = ?auto_22695 ?auto_22715 ) ) ( not ( = ?auto_22697 ?auto_22723 ) ) ( not ( = ?auto_22697 ?auto_22730 ) ) ( not ( = ?auto_22697 ?auto_22711 ) ) ( not ( = ?auto_22697 ?auto_22713 ) ) ( not ( = ?auto_22697 ?auto_22717 ) ) ( not ( = ?auto_22697 ?auto_22735 ) ) ( not ( = ?auto_22697 ?auto_22733 ) ) ( not ( = ?auto_22697 ?auto_22718 ) ) ( not ( = ?auto_22708 ?auto_22720 ) ) ( not ( = ?auto_22708 ?auto_22734 ) ) ( not ( = ?auto_22708 ?auto_22728 ) ) ( not ( = ?auto_22708 ?auto_22736 ) ) ( not ( = ?auto_22708 ?auto_22712 ) ) ( not ( = ?auto_22708 ?auto_22716 ) ) ( not ( = ?auto_22708 ?auto_22731 ) ) ( not ( = ?auto_22722 ?auto_22724 ) ) ( not ( = ?auto_22722 ?auto_22714 ) ) ( not ( = ?auto_22722 ?auto_22732 ) ) ( not ( = ?auto_22722 ?auto_22726 ) ) ( not ( = ?auto_22722 ?auto_22710 ) ) ( not ( = ?auto_22722 ?auto_22719 ) ) ( not ( = ?auto_22722 ?auto_22727 ) ) ( not ( = ?auto_22715 ?auto_22723 ) ) ( not ( = ?auto_22715 ?auto_22730 ) ) ( not ( = ?auto_22715 ?auto_22711 ) ) ( not ( = ?auto_22715 ?auto_22713 ) ) ( not ( = ?auto_22715 ?auto_22717 ) ) ( not ( = ?auto_22715 ?auto_22735 ) ) ( not ( = ?auto_22715 ?auto_22733 ) ) ( not ( = ?auto_22715 ?auto_22718 ) ) ( not ( = ?auto_22688 ?auto_22699 ) ) ( not ( = ?auto_22688 ?auto_22725 ) ) ( not ( = ?auto_22689 ?auto_22699 ) ) ( not ( = ?auto_22689 ?auto_22725 ) ) ( not ( = ?auto_22690 ?auto_22699 ) ) ( not ( = ?auto_22690 ?auto_22725 ) ) ( not ( = ?auto_22691 ?auto_22699 ) ) ( not ( = ?auto_22691 ?auto_22725 ) ) ( not ( = ?auto_22692 ?auto_22699 ) ) ( not ( = ?auto_22692 ?auto_22725 ) ) ( not ( = ?auto_22693 ?auto_22699 ) ) ( not ( = ?auto_22693 ?auto_22725 ) ) ( not ( = ?auto_22696 ?auto_22699 ) ) ( not ( = ?auto_22696 ?auto_22725 ) ) ( not ( = ?auto_22695 ?auto_22699 ) ) ( not ( = ?auto_22695 ?auto_22725 ) ) ( not ( = ?auto_22694 ?auto_22699 ) ) ( not ( = ?auto_22694 ?auto_22725 ) ) ( not ( = ?auto_22699 ?auto_22715 ) ) ( not ( = ?auto_22699 ?auto_22723 ) ) ( not ( = ?auto_22699 ?auto_22730 ) ) ( not ( = ?auto_22699 ?auto_22711 ) ) ( not ( = ?auto_22699 ?auto_22713 ) ) ( not ( = ?auto_22699 ?auto_22717 ) ) ( not ( = ?auto_22699 ?auto_22735 ) ) ( not ( = ?auto_22699 ?auto_22733 ) ) ( not ( = ?auto_22699 ?auto_22718 ) ) ( not ( = ?auto_22725 ?auto_22715 ) ) ( not ( = ?auto_22725 ?auto_22723 ) ) ( not ( = ?auto_22725 ?auto_22730 ) ) ( not ( = ?auto_22725 ?auto_22711 ) ) ( not ( = ?auto_22725 ?auto_22713 ) ) ( not ( = ?auto_22725 ?auto_22717 ) ) ( not ( = ?auto_22725 ?auto_22735 ) ) ( not ( = ?auto_22725 ?auto_22733 ) ) ( not ( = ?auto_22725 ?auto_22718 ) ) ( not ( = ?auto_22688 ?auto_22698 ) ) ( not ( = ?auto_22688 ?auto_22737 ) ) ( not ( = ?auto_22689 ?auto_22698 ) ) ( not ( = ?auto_22689 ?auto_22737 ) ) ( not ( = ?auto_22690 ?auto_22698 ) ) ( not ( = ?auto_22690 ?auto_22737 ) ) ( not ( = ?auto_22691 ?auto_22698 ) ) ( not ( = ?auto_22691 ?auto_22737 ) ) ( not ( = ?auto_22692 ?auto_22698 ) ) ( not ( = ?auto_22692 ?auto_22737 ) ) ( not ( = ?auto_22693 ?auto_22698 ) ) ( not ( = ?auto_22693 ?auto_22737 ) ) ( not ( = ?auto_22696 ?auto_22698 ) ) ( not ( = ?auto_22696 ?auto_22737 ) ) ( not ( = ?auto_22695 ?auto_22698 ) ) ( not ( = ?auto_22695 ?auto_22737 ) ) ( not ( = ?auto_22694 ?auto_22698 ) ) ( not ( = ?auto_22694 ?auto_22737 ) ) ( not ( = ?auto_22697 ?auto_22698 ) ) ( not ( = ?auto_22697 ?auto_22737 ) ) ( not ( = ?auto_22698 ?auto_22725 ) ) ( not ( = ?auto_22698 ?auto_22715 ) ) ( not ( = ?auto_22698 ?auto_22723 ) ) ( not ( = ?auto_22698 ?auto_22730 ) ) ( not ( = ?auto_22698 ?auto_22711 ) ) ( not ( = ?auto_22698 ?auto_22713 ) ) ( not ( = ?auto_22698 ?auto_22717 ) ) ( not ( = ?auto_22698 ?auto_22735 ) ) ( not ( = ?auto_22698 ?auto_22733 ) ) ( not ( = ?auto_22698 ?auto_22718 ) ) ( not ( = ?auto_22721 ?auto_22720 ) ) ( not ( = ?auto_22721 ?auto_22708 ) ) ( not ( = ?auto_22721 ?auto_22734 ) ) ( not ( = ?auto_22721 ?auto_22728 ) ) ( not ( = ?auto_22721 ?auto_22736 ) ) ( not ( = ?auto_22721 ?auto_22712 ) ) ( not ( = ?auto_22721 ?auto_22716 ) ) ( not ( = ?auto_22721 ?auto_22731 ) ) ( not ( = ?auto_22729 ?auto_22724 ) ) ( not ( = ?auto_22729 ?auto_22722 ) ) ( not ( = ?auto_22729 ?auto_22714 ) ) ( not ( = ?auto_22729 ?auto_22732 ) ) ( not ( = ?auto_22729 ?auto_22726 ) ) ( not ( = ?auto_22729 ?auto_22710 ) ) ( not ( = ?auto_22729 ?auto_22719 ) ) ( not ( = ?auto_22729 ?auto_22727 ) ) ( not ( = ?auto_22737 ?auto_22725 ) ) ( not ( = ?auto_22737 ?auto_22715 ) ) ( not ( = ?auto_22737 ?auto_22723 ) ) ( not ( = ?auto_22737 ?auto_22730 ) ) ( not ( = ?auto_22737 ?auto_22711 ) ) ( not ( = ?auto_22737 ?auto_22713 ) ) ( not ( = ?auto_22737 ?auto_22717 ) ) ( not ( = ?auto_22737 ?auto_22735 ) ) ( not ( = ?auto_22737 ?auto_22733 ) ) ( not ( = ?auto_22737 ?auto_22718 ) ) ( not ( = ?auto_22688 ?auto_22700 ) ) ( not ( = ?auto_22688 ?auto_22709 ) ) ( not ( = ?auto_22689 ?auto_22700 ) ) ( not ( = ?auto_22689 ?auto_22709 ) ) ( not ( = ?auto_22690 ?auto_22700 ) ) ( not ( = ?auto_22690 ?auto_22709 ) ) ( not ( = ?auto_22691 ?auto_22700 ) ) ( not ( = ?auto_22691 ?auto_22709 ) ) ( not ( = ?auto_22692 ?auto_22700 ) ) ( not ( = ?auto_22692 ?auto_22709 ) ) ( not ( = ?auto_22693 ?auto_22700 ) ) ( not ( = ?auto_22693 ?auto_22709 ) ) ( not ( = ?auto_22696 ?auto_22700 ) ) ( not ( = ?auto_22696 ?auto_22709 ) ) ( not ( = ?auto_22695 ?auto_22700 ) ) ( not ( = ?auto_22695 ?auto_22709 ) ) ( not ( = ?auto_22694 ?auto_22700 ) ) ( not ( = ?auto_22694 ?auto_22709 ) ) ( not ( = ?auto_22697 ?auto_22700 ) ) ( not ( = ?auto_22697 ?auto_22709 ) ) ( not ( = ?auto_22699 ?auto_22700 ) ) ( not ( = ?auto_22699 ?auto_22709 ) ) ( not ( = ?auto_22700 ?auto_22737 ) ) ( not ( = ?auto_22700 ?auto_22725 ) ) ( not ( = ?auto_22700 ?auto_22715 ) ) ( not ( = ?auto_22700 ?auto_22723 ) ) ( not ( = ?auto_22700 ?auto_22730 ) ) ( not ( = ?auto_22700 ?auto_22711 ) ) ( not ( = ?auto_22700 ?auto_22713 ) ) ( not ( = ?auto_22700 ?auto_22717 ) ) ( not ( = ?auto_22700 ?auto_22735 ) ) ( not ( = ?auto_22700 ?auto_22733 ) ) ( not ( = ?auto_22700 ?auto_22718 ) ) ( not ( = ?auto_22709 ?auto_22737 ) ) ( not ( = ?auto_22709 ?auto_22725 ) ) ( not ( = ?auto_22709 ?auto_22715 ) ) ( not ( = ?auto_22709 ?auto_22723 ) ) ( not ( = ?auto_22709 ?auto_22730 ) ) ( not ( = ?auto_22709 ?auto_22711 ) ) ( not ( = ?auto_22709 ?auto_22713 ) ) ( not ( = ?auto_22709 ?auto_22717 ) ) ( not ( = ?auto_22709 ?auto_22735 ) ) ( not ( = ?auto_22709 ?auto_22733 ) ) ( not ( = ?auto_22709 ?auto_22718 ) ) ( not ( = ?auto_22688 ?auto_22701 ) ) ( not ( = ?auto_22688 ?auto_22703 ) ) ( not ( = ?auto_22689 ?auto_22701 ) ) ( not ( = ?auto_22689 ?auto_22703 ) ) ( not ( = ?auto_22690 ?auto_22701 ) ) ( not ( = ?auto_22690 ?auto_22703 ) ) ( not ( = ?auto_22691 ?auto_22701 ) ) ( not ( = ?auto_22691 ?auto_22703 ) ) ( not ( = ?auto_22692 ?auto_22701 ) ) ( not ( = ?auto_22692 ?auto_22703 ) ) ( not ( = ?auto_22693 ?auto_22701 ) ) ( not ( = ?auto_22693 ?auto_22703 ) ) ( not ( = ?auto_22696 ?auto_22701 ) ) ( not ( = ?auto_22696 ?auto_22703 ) ) ( not ( = ?auto_22695 ?auto_22701 ) ) ( not ( = ?auto_22695 ?auto_22703 ) ) ( not ( = ?auto_22694 ?auto_22701 ) ) ( not ( = ?auto_22694 ?auto_22703 ) ) ( not ( = ?auto_22697 ?auto_22701 ) ) ( not ( = ?auto_22697 ?auto_22703 ) ) ( not ( = ?auto_22699 ?auto_22701 ) ) ( not ( = ?auto_22699 ?auto_22703 ) ) ( not ( = ?auto_22698 ?auto_22701 ) ) ( not ( = ?auto_22698 ?auto_22703 ) ) ( not ( = ?auto_22701 ?auto_22709 ) ) ( not ( = ?auto_22701 ?auto_22737 ) ) ( not ( = ?auto_22701 ?auto_22725 ) ) ( not ( = ?auto_22701 ?auto_22715 ) ) ( not ( = ?auto_22701 ?auto_22723 ) ) ( not ( = ?auto_22701 ?auto_22730 ) ) ( not ( = ?auto_22701 ?auto_22711 ) ) ( not ( = ?auto_22701 ?auto_22713 ) ) ( not ( = ?auto_22701 ?auto_22717 ) ) ( not ( = ?auto_22701 ?auto_22735 ) ) ( not ( = ?auto_22701 ?auto_22733 ) ) ( not ( = ?auto_22701 ?auto_22718 ) ) ( not ( = ?auto_22707 ?auto_22716 ) ) ( not ( = ?auto_22707 ?auto_22721 ) ) ( not ( = ?auto_22707 ?auto_22720 ) ) ( not ( = ?auto_22707 ?auto_22708 ) ) ( not ( = ?auto_22707 ?auto_22734 ) ) ( not ( = ?auto_22707 ?auto_22728 ) ) ( not ( = ?auto_22707 ?auto_22736 ) ) ( not ( = ?auto_22707 ?auto_22712 ) ) ( not ( = ?auto_22707 ?auto_22731 ) ) ( not ( = ?auto_22706 ?auto_22719 ) ) ( not ( = ?auto_22706 ?auto_22729 ) ) ( not ( = ?auto_22706 ?auto_22724 ) ) ( not ( = ?auto_22706 ?auto_22722 ) ) ( not ( = ?auto_22706 ?auto_22714 ) ) ( not ( = ?auto_22706 ?auto_22732 ) ) ( not ( = ?auto_22706 ?auto_22726 ) ) ( not ( = ?auto_22706 ?auto_22710 ) ) ( not ( = ?auto_22706 ?auto_22727 ) ) ( not ( = ?auto_22703 ?auto_22709 ) ) ( not ( = ?auto_22703 ?auto_22737 ) ) ( not ( = ?auto_22703 ?auto_22725 ) ) ( not ( = ?auto_22703 ?auto_22715 ) ) ( not ( = ?auto_22703 ?auto_22723 ) ) ( not ( = ?auto_22703 ?auto_22730 ) ) ( not ( = ?auto_22703 ?auto_22711 ) ) ( not ( = ?auto_22703 ?auto_22713 ) ) ( not ( = ?auto_22703 ?auto_22717 ) ) ( not ( = ?auto_22703 ?auto_22735 ) ) ( not ( = ?auto_22703 ?auto_22733 ) ) ( not ( = ?auto_22703 ?auto_22718 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_22688 ?auto_22689 ?auto_22690 ?auto_22691 ?auto_22692 ?auto_22693 ?auto_22696 ?auto_22695 ?auto_22694 ?auto_22697 ?auto_22699 ?auto_22698 ?auto_22700 )
      ( MAKE-1CRATE ?auto_22700 ?auto_22701 )
      ( MAKE-13CRATE-VERIFY ?auto_22688 ?auto_22689 ?auto_22690 ?auto_22691 ?auto_22692 ?auto_22693 ?auto_22696 ?auto_22695 ?auto_22694 ?auto_22697 ?auto_22699 ?auto_22698 ?auto_22700 ?auto_22701 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22740 - SURFACE
      ?auto_22741 - SURFACE
    )
    :vars
    (
      ?auto_22742 - HOIST
      ?auto_22743 - PLACE
      ?auto_22745 - PLACE
      ?auto_22746 - HOIST
      ?auto_22747 - SURFACE
      ?auto_22744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22742 ?auto_22743 ) ( SURFACE-AT ?auto_22740 ?auto_22743 ) ( CLEAR ?auto_22740 ) ( IS-CRATE ?auto_22741 ) ( AVAILABLE ?auto_22742 ) ( not ( = ?auto_22745 ?auto_22743 ) ) ( HOIST-AT ?auto_22746 ?auto_22745 ) ( AVAILABLE ?auto_22746 ) ( SURFACE-AT ?auto_22741 ?auto_22745 ) ( ON ?auto_22741 ?auto_22747 ) ( CLEAR ?auto_22741 ) ( TRUCK-AT ?auto_22744 ?auto_22743 ) ( not ( = ?auto_22740 ?auto_22741 ) ) ( not ( = ?auto_22740 ?auto_22747 ) ) ( not ( = ?auto_22741 ?auto_22747 ) ) ( not ( = ?auto_22742 ?auto_22746 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22744 ?auto_22743 ?auto_22745 )
      ( !LIFT ?auto_22746 ?auto_22741 ?auto_22747 ?auto_22745 )
      ( !LOAD ?auto_22746 ?auto_22741 ?auto_22744 ?auto_22745 )
      ( !DRIVE ?auto_22744 ?auto_22745 ?auto_22743 )
      ( !UNLOAD ?auto_22742 ?auto_22741 ?auto_22744 ?auto_22743 )
      ( !DROP ?auto_22742 ?auto_22741 ?auto_22740 ?auto_22743 )
      ( MAKE-1CRATE-VERIFY ?auto_22740 ?auto_22741 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_22763 - SURFACE
      ?auto_22764 - SURFACE
      ?auto_22765 - SURFACE
      ?auto_22766 - SURFACE
      ?auto_22767 - SURFACE
      ?auto_22768 - SURFACE
      ?auto_22771 - SURFACE
      ?auto_22770 - SURFACE
      ?auto_22769 - SURFACE
      ?auto_22772 - SURFACE
      ?auto_22774 - SURFACE
      ?auto_22773 - SURFACE
      ?auto_22775 - SURFACE
      ?auto_22777 - SURFACE
      ?auto_22776 - SURFACE
    )
    :vars
    (
      ?auto_22780 - HOIST
      ?auto_22779 - PLACE
      ?auto_22783 - PLACE
      ?auto_22782 - HOIST
      ?auto_22781 - SURFACE
      ?auto_22800 - PLACE
      ?auto_22803 - HOIST
      ?auto_22813 - SURFACE
      ?auto_22787 - PLACE
      ?auto_22810 - HOIST
      ?auto_22797 - SURFACE
      ?auto_22784 - PLACE
      ?auto_22807 - HOIST
      ?auto_22795 - SURFACE
      ?auto_22790 - PLACE
      ?auto_22808 - HOIST
      ?auto_22794 - SURFACE
      ?auto_22786 - PLACE
      ?auto_22811 - HOIST
      ?auto_22816 - SURFACE
      ?auto_22809 - SURFACE
      ?auto_22789 - PLACE
      ?auto_22806 - HOIST
      ?auto_22802 - SURFACE
      ?auto_22814 - PLACE
      ?auto_22815 - HOIST
      ?auto_22798 - SURFACE
      ?auto_22796 - PLACE
      ?auto_22801 - HOIST
      ?auto_22785 - SURFACE
      ?auto_22792 - SURFACE
      ?auto_22799 - PLACE
      ?auto_22793 - HOIST
      ?auto_22788 - SURFACE
      ?auto_22805 - SURFACE
      ?auto_22812 - PLACE
      ?auto_22804 - HOIST
      ?auto_22791 - SURFACE
      ?auto_22778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22780 ?auto_22779 ) ( IS-CRATE ?auto_22776 ) ( not ( = ?auto_22783 ?auto_22779 ) ) ( HOIST-AT ?auto_22782 ?auto_22783 ) ( AVAILABLE ?auto_22782 ) ( SURFACE-AT ?auto_22776 ?auto_22783 ) ( ON ?auto_22776 ?auto_22781 ) ( CLEAR ?auto_22776 ) ( not ( = ?auto_22777 ?auto_22776 ) ) ( not ( = ?auto_22777 ?auto_22781 ) ) ( not ( = ?auto_22776 ?auto_22781 ) ) ( not ( = ?auto_22780 ?auto_22782 ) ) ( IS-CRATE ?auto_22777 ) ( not ( = ?auto_22800 ?auto_22779 ) ) ( HOIST-AT ?auto_22803 ?auto_22800 ) ( AVAILABLE ?auto_22803 ) ( SURFACE-AT ?auto_22777 ?auto_22800 ) ( ON ?auto_22777 ?auto_22813 ) ( CLEAR ?auto_22777 ) ( not ( = ?auto_22775 ?auto_22777 ) ) ( not ( = ?auto_22775 ?auto_22813 ) ) ( not ( = ?auto_22777 ?auto_22813 ) ) ( not ( = ?auto_22780 ?auto_22803 ) ) ( IS-CRATE ?auto_22775 ) ( not ( = ?auto_22787 ?auto_22779 ) ) ( HOIST-AT ?auto_22810 ?auto_22787 ) ( SURFACE-AT ?auto_22775 ?auto_22787 ) ( ON ?auto_22775 ?auto_22797 ) ( CLEAR ?auto_22775 ) ( not ( = ?auto_22773 ?auto_22775 ) ) ( not ( = ?auto_22773 ?auto_22797 ) ) ( not ( = ?auto_22775 ?auto_22797 ) ) ( not ( = ?auto_22780 ?auto_22810 ) ) ( IS-CRATE ?auto_22773 ) ( not ( = ?auto_22784 ?auto_22779 ) ) ( HOIST-AT ?auto_22807 ?auto_22784 ) ( AVAILABLE ?auto_22807 ) ( SURFACE-AT ?auto_22773 ?auto_22784 ) ( ON ?auto_22773 ?auto_22795 ) ( CLEAR ?auto_22773 ) ( not ( = ?auto_22774 ?auto_22773 ) ) ( not ( = ?auto_22774 ?auto_22795 ) ) ( not ( = ?auto_22773 ?auto_22795 ) ) ( not ( = ?auto_22780 ?auto_22807 ) ) ( IS-CRATE ?auto_22774 ) ( not ( = ?auto_22790 ?auto_22779 ) ) ( HOIST-AT ?auto_22808 ?auto_22790 ) ( SURFACE-AT ?auto_22774 ?auto_22790 ) ( ON ?auto_22774 ?auto_22794 ) ( CLEAR ?auto_22774 ) ( not ( = ?auto_22772 ?auto_22774 ) ) ( not ( = ?auto_22772 ?auto_22794 ) ) ( not ( = ?auto_22774 ?auto_22794 ) ) ( not ( = ?auto_22780 ?auto_22808 ) ) ( IS-CRATE ?auto_22772 ) ( not ( = ?auto_22786 ?auto_22779 ) ) ( HOIST-AT ?auto_22811 ?auto_22786 ) ( AVAILABLE ?auto_22811 ) ( SURFACE-AT ?auto_22772 ?auto_22786 ) ( ON ?auto_22772 ?auto_22816 ) ( CLEAR ?auto_22772 ) ( not ( = ?auto_22769 ?auto_22772 ) ) ( not ( = ?auto_22769 ?auto_22816 ) ) ( not ( = ?auto_22772 ?auto_22816 ) ) ( not ( = ?auto_22780 ?auto_22811 ) ) ( IS-CRATE ?auto_22769 ) ( SURFACE-AT ?auto_22769 ?auto_22790 ) ( ON ?auto_22769 ?auto_22809 ) ( CLEAR ?auto_22769 ) ( not ( = ?auto_22770 ?auto_22769 ) ) ( not ( = ?auto_22770 ?auto_22809 ) ) ( not ( = ?auto_22769 ?auto_22809 ) ) ( IS-CRATE ?auto_22770 ) ( not ( = ?auto_22789 ?auto_22779 ) ) ( HOIST-AT ?auto_22806 ?auto_22789 ) ( AVAILABLE ?auto_22806 ) ( SURFACE-AT ?auto_22770 ?auto_22789 ) ( ON ?auto_22770 ?auto_22802 ) ( CLEAR ?auto_22770 ) ( not ( = ?auto_22771 ?auto_22770 ) ) ( not ( = ?auto_22771 ?auto_22802 ) ) ( not ( = ?auto_22770 ?auto_22802 ) ) ( not ( = ?auto_22780 ?auto_22806 ) ) ( IS-CRATE ?auto_22771 ) ( not ( = ?auto_22814 ?auto_22779 ) ) ( HOIST-AT ?auto_22815 ?auto_22814 ) ( AVAILABLE ?auto_22815 ) ( SURFACE-AT ?auto_22771 ?auto_22814 ) ( ON ?auto_22771 ?auto_22798 ) ( CLEAR ?auto_22771 ) ( not ( = ?auto_22768 ?auto_22771 ) ) ( not ( = ?auto_22768 ?auto_22798 ) ) ( not ( = ?auto_22771 ?auto_22798 ) ) ( not ( = ?auto_22780 ?auto_22815 ) ) ( IS-CRATE ?auto_22768 ) ( not ( = ?auto_22796 ?auto_22779 ) ) ( HOIST-AT ?auto_22801 ?auto_22796 ) ( AVAILABLE ?auto_22801 ) ( SURFACE-AT ?auto_22768 ?auto_22796 ) ( ON ?auto_22768 ?auto_22785 ) ( CLEAR ?auto_22768 ) ( not ( = ?auto_22767 ?auto_22768 ) ) ( not ( = ?auto_22767 ?auto_22785 ) ) ( not ( = ?auto_22768 ?auto_22785 ) ) ( not ( = ?auto_22780 ?auto_22801 ) ) ( IS-CRATE ?auto_22767 ) ( AVAILABLE ?auto_22808 ) ( SURFACE-AT ?auto_22767 ?auto_22790 ) ( ON ?auto_22767 ?auto_22792 ) ( CLEAR ?auto_22767 ) ( not ( = ?auto_22766 ?auto_22767 ) ) ( not ( = ?auto_22766 ?auto_22792 ) ) ( not ( = ?auto_22767 ?auto_22792 ) ) ( IS-CRATE ?auto_22766 ) ( not ( = ?auto_22799 ?auto_22779 ) ) ( HOIST-AT ?auto_22793 ?auto_22799 ) ( AVAILABLE ?auto_22793 ) ( SURFACE-AT ?auto_22766 ?auto_22799 ) ( ON ?auto_22766 ?auto_22788 ) ( CLEAR ?auto_22766 ) ( not ( = ?auto_22765 ?auto_22766 ) ) ( not ( = ?auto_22765 ?auto_22788 ) ) ( not ( = ?auto_22766 ?auto_22788 ) ) ( not ( = ?auto_22780 ?auto_22793 ) ) ( IS-CRATE ?auto_22765 ) ( AVAILABLE ?auto_22810 ) ( SURFACE-AT ?auto_22765 ?auto_22787 ) ( ON ?auto_22765 ?auto_22805 ) ( CLEAR ?auto_22765 ) ( not ( = ?auto_22764 ?auto_22765 ) ) ( not ( = ?auto_22764 ?auto_22805 ) ) ( not ( = ?auto_22765 ?auto_22805 ) ) ( SURFACE-AT ?auto_22763 ?auto_22779 ) ( CLEAR ?auto_22763 ) ( IS-CRATE ?auto_22764 ) ( AVAILABLE ?auto_22780 ) ( not ( = ?auto_22812 ?auto_22779 ) ) ( HOIST-AT ?auto_22804 ?auto_22812 ) ( AVAILABLE ?auto_22804 ) ( SURFACE-AT ?auto_22764 ?auto_22812 ) ( ON ?auto_22764 ?auto_22791 ) ( CLEAR ?auto_22764 ) ( TRUCK-AT ?auto_22778 ?auto_22779 ) ( not ( = ?auto_22763 ?auto_22764 ) ) ( not ( = ?auto_22763 ?auto_22791 ) ) ( not ( = ?auto_22764 ?auto_22791 ) ) ( not ( = ?auto_22780 ?auto_22804 ) ) ( not ( = ?auto_22763 ?auto_22765 ) ) ( not ( = ?auto_22763 ?auto_22805 ) ) ( not ( = ?auto_22765 ?auto_22791 ) ) ( not ( = ?auto_22787 ?auto_22812 ) ) ( not ( = ?auto_22810 ?auto_22804 ) ) ( not ( = ?auto_22805 ?auto_22791 ) ) ( not ( = ?auto_22763 ?auto_22766 ) ) ( not ( = ?auto_22763 ?auto_22788 ) ) ( not ( = ?auto_22764 ?auto_22766 ) ) ( not ( = ?auto_22764 ?auto_22788 ) ) ( not ( = ?auto_22766 ?auto_22805 ) ) ( not ( = ?auto_22766 ?auto_22791 ) ) ( not ( = ?auto_22799 ?auto_22787 ) ) ( not ( = ?auto_22799 ?auto_22812 ) ) ( not ( = ?auto_22793 ?auto_22810 ) ) ( not ( = ?auto_22793 ?auto_22804 ) ) ( not ( = ?auto_22788 ?auto_22805 ) ) ( not ( = ?auto_22788 ?auto_22791 ) ) ( not ( = ?auto_22763 ?auto_22767 ) ) ( not ( = ?auto_22763 ?auto_22792 ) ) ( not ( = ?auto_22764 ?auto_22767 ) ) ( not ( = ?auto_22764 ?auto_22792 ) ) ( not ( = ?auto_22765 ?auto_22767 ) ) ( not ( = ?auto_22765 ?auto_22792 ) ) ( not ( = ?auto_22767 ?auto_22788 ) ) ( not ( = ?auto_22767 ?auto_22805 ) ) ( not ( = ?auto_22767 ?auto_22791 ) ) ( not ( = ?auto_22790 ?auto_22799 ) ) ( not ( = ?auto_22790 ?auto_22787 ) ) ( not ( = ?auto_22790 ?auto_22812 ) ) ( not ( = ?auto_22808 ?auto_22793 ) ) ( not ( = ?auto_22808 ?auto_22810 ) ) ( not ( = ?auto_22808 ?auto_22804 ) ) ( not ( = ?auto_22792 ?auto_22788 ) ) ( not ( = ?auto_22792 ?auto_22805 ) ) ( not ( = ?auto_22792 ?auto_22791 ) ) ( not ( = ?auto_22763 ?auto_22768 ) ) ( not ( = ?auto_22763 ?auto_22785 ) ) ( not ( = ?auto_22764 ?auto_22768 ) ) ( not ( = ?auto_22764 ?auto_22785 ) ) ( not ( = ?auto_22765 ?auto_22768 ) ) ( not ( = ?auto_22765 ?auto_22785 ) ) ( not ( = ?auto_22766 ?auto_22768 ) ) ( not ( = ?auto_22766 ?auto_22785 ) ) ( not ( = ?auto_22768 ?auto_22792 ) ) ( not ( = ?auto_22768 ?auto_22788 ) ) ( not ( = ?auto_22768 ?auto_22805 ) ) ( not ( = ?auto_22768 ?auto_22791 ) ) ( not ( = ?auto_22796 ?auto_22790 ) ) ( not ( = ?auto_22796 ?auto_22799 ) ) ( not ( = ?auto_22796 ?auto_22787 ) ) ( not ( = ?auto_22796 ?auto_22812 ) ) ( not ( = ?auto_22801 ?auto_22808 ) ) ( not ( = ?auto_22801 ?auto_22793 ) ) ( not ( = ?auto_22801 ?auto_22810 ) ) ( not ( = ?auto_22801 ?auto_22804 ) ) ( not ( = ?auto_22785 ?auto_22792 ) ) ( not ( = ?auto_22785 ?auto_22788 ) ) ( not ( = ?auto_22785 ?auto_22805 ) ) ( not ( = ?auto_22785 ?auto_22791 ) ) ( not ( = ?auto_22763 ?auto_22771 ) ) ( not ( = ?auto_22763 ?auto_22798 ) ) ( not ( = ?auto_22764 ?auto_22771 ) ) ( not ( = ?auto_22764 ?auto_22798 ) ) ( not ( = ?auto_22765 ?auto_22771 ) ) ( not ( = ?auto_22765 ?auto_22798 ) ) ( not ( = ?auto_22766 ?auto_22771 ) ) ( not ( = ?auto_22766 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22771 ) ) ( not ( = ?auto_22767 ?auto_22798 ) ) ( not ( = ?auto_22771 ?auto_22785 ) ) ( not ( = ?auto_22771 ?auto_22792 ) ) ( not ( = ?auto_22771 ?auto_22788 ) ) ( not ( = ?auto_22771 ?auto_22805 ) ) ( not ( = ?auto_22771 ?auto_22791 ) ) ( not ( = ?auto_22814 ?auto_22796 ) ) ( not ( = ?auto_22814 ?auto_22790 ) ) ( not ( = ?auto_22814 ?auto_22799 ) ) ( not ( = ?auto_22814 ?auto_22787 ) ) ( not ( = ?auto_22814 ?auto_22812 ) ) ( not ( = ?auto_22815 ?auto_22801 ) ) ( not ( = ?auto_22815 ?auto_22808 ) ) ( not ( = ?auto_22815 ?auto_22793 ) ) ( not ( = ?auto_22815 ?auto_22810 ) ) ( not ( = ?auto_22815 ?auto_22804 ) ) ( not ( = ?auto_22798 ?auto_22785 ) ) ( not ( = ?auto_22798 ?auto_22792 ) ) ( not ( = ?auto_22798 ?auto_22788 ) ) ( not ( = ?auto_22798 ?auto_22805 ) ) ( not ( = ?auto_22798 ?auto_22791 ) ) ( not ( = ?auto_22763 ?auto_22770 ) ) ( not ( = ?auto_22763 ?auto_22802 ) ) ( not ( = ?auto_22764 ?auto_22770 ) ) ( not ( = ?auto_22764 ?auto_22802 ) ) ( not ( = ?auto_22765 ?auto_22770 ) ) ( not ( = ?auto_22765 ?auto_22802 ) ) ( not ( = ?auto_22766 ?auto_22770 ) ) ( not ( = ?auto_22766 ?auto_22802 ) ) ( not ( = ?auto_22767 ?auto_22770 ) ) ( not ( = ?auto_22767 ?auto_22802 ) ) ( not ( = ?auto_22768 ?auto_22770 ) ) ( not ( = ?auto_22768 ?auto_22802 ) ) ( not ( = ?auto_22770 ?auto_22798 ) ) ( not ( = ?auto_22770 ?auto_22785 ) ) ( not ( = ?auto_22770 ?auto_22792 ) ) ( not ( = ?auto_22770 ?auto_22788 ) ) ( not ( = ?auto_22770 ?auto_22805 ) ) ( not ( = ?auto_22770 ?auto_22791 ) ) ( not ( = ?auto_22789 ?auto_22814 ) ) ( not ( = ?auto_22789 ?auto_22796 ) ) ( not ( = ?auto_22789 ?auto_22790 ) ) ( not ( = ?auto_22789 ?auto_22799 ) ) ( not ( = ?auto_22789 ?auto_22787 ) ) ( not ( = ?auto_22789 ?auto_22812 ) ) ( not ( = ?auto_22806 ?auto_22815 ) ) ( not ( = ?auto_22806 ?auto_22801 ) ) ( not ( = ?auto_22806 ?auto_22808 ) ) ( not ( = ?auto_22806 ?auto_22793 ) ) ( not ( = ?auto_22806 ?auto_22810 ) ) ( not ( = ?auto_22806 ?auto_22804 ) ) ( not ( = ?auto_22802 ?auto_22798 ) ) ( not ( = ?auto_22802 ?auto_22785 ) ) ( not ( = ?auto_22802 ?auto_22792 ) ) ( not ( = ?auto_22802 ?auto_22788 ) ) ( not ( = ?auto_22802 ?auto_22805 ) ) ( not ( = ?auto_22802 ?auto_22791 ) ) ( not ( = ?auto_22763 ?auto_22769 ) ) ( not ( = ?auto_22763 ?auto_22809 ) ) ( not ( = ?auto_22764 ?auto_22769 ) ) ( not ( = ?auto_22764 ?auto_22809 ) ) ( not ( = ?auto_22765 ?auto_22769 ) ) ( not ( = ?auto_22765 ?auto_22809 ) ) ( not ( = ?auto_22766 ?auto_22769 ) ) ( not ( = ?auto_22766 ?auto_22809 ) ) ( not ( = ?auto_22767 ?auto_22769 ) ) ( not ( = ?auto_22767 ?auto_22809 ) ) ( not ( = ?auto_22768 ?auto_22769 ) ) ( not ( = ?auto_22768 ?auto_22809 ) ) ( not ( = ?auto_22771 ?auto_22769 ) ) ( not ( = ?auto_22771 ?auto_22809 ) ) ( not ( = ?auto_22769 ?auto_22802 ) ) ( not ( = ?auto_22769 ?auto_22798 ) ) ( not ( = ?auto_22769 ?auto_22785 ) ) ( not ( = ?auto_22769 ?auto_22792 ) ) ( not ( = ?auto_22769 ?auto_22788 ) ) ( not ( = ?auto_22769 ?auto_22805 ) ) ( not ( = ?auto_22769 ?auto_22791 ) ) ( not ( = ?auto_22809 ?auto_22802 ) ) ( not ( = ?auto_22809 ?auto_22798 ) ) ( not ( = ?auto_22809 ?auto_22785 ) ) ( not ( = ?auto_22809 ?auto_22792 ) ) ( not ( = ?auto_22809 ?auto_22788 ) ) ( not ( = ?auto_22809 ?auto_22805 ) ) ( not ( = ?auto_22809 ?auto_22791 ) ) ( not ( = ?auto_22763 ?auto_22772 ) ) ( not ( = ?auto_22763 ?auto_22816 ) ) ( not ( = ?auto_22764 ?auto_22772 ) ) ( not ( = ?auto_22764 ?auto_22816 ) ) ( not ( = ?auto_22765 ?auto_22772 ) ) ( not ( = ?auto_22765 ?auto_22816 ) ) ( not ( = ?auto_22766 ?auto_22772 ) ) ( not ( = ?auto_22766 ?auto_22816 ) ) ( not ( = ?auto_22767 ?auto_22772 ) ) ( not ( = ?auto_22767 ?auto_22816 ) ) ( not ( = ?auto_22768 ?auto_22772 ) ) ( not ( = ?auto_22768 ?auto_22816 ) ) ( not ( = ?auto_22771 ?auto_22772 ) ) ( not ( = ?auto_22771 ?auto_22816 ) ) ( not ( = ?auto_22770 ?auto_22772 ) ) ( not ( = ?auto_22770 ?auto_22816 ) ) ( not ( = ?auto_22772 ?auto_22809 ) ) ( not ( = ?auto_22772 ?auto_22802 ) ) ( not ( = ?auto_22772 ?auto_22798 ) ) ( not ( = ?auto_22772 ?auto_22785 ) ) ( not ( = ?auto_22772 ?auto_22792 ) ) ( not ( = ?auto_22772 ?auto_22788 ) ) ( not ( = ?auto_22772 ?auto_22805 ) ) ( not ( = ?auto_22772 ?auto_22791 ) ) ( not ( = ?auto_22786 ?auto_22790 ) ) ( not ( = ?auto_22786 ?auto_22789 ) ) ( not ( = ?auto_22786 ?auto_22814 ) ) ( not ( = ?auto_22786 ?auto_22796 ) ) ( not ( = ?auto_22786 ?auto_22799 ) ) ( not ( = ?auto_22786 ?auto_22787 ) ) ( not ( = ?auto_22786 ?auto_22812 ) ) ( not ( = ?auto_22811 ?auto_22808 ) ) ( not ( = ?auto_22811 ?auto_22806 ) ) ( not ( = ?auto_22811 ?auto_22815 ) ) ( not ( = ?auto_22811 ?auto_22801 ) ) ( not ( = ?auto_22811 ?auto_22793 ) ) ( not ( = ?auto_22811 ?auto_22810 ) ) ( not ( = ?auto_22811 ?auto_22804 ) ) ( not ( = ?auto_22816 ?auto_22809 ) ) ( not ( = ?auto_22816 ?auto_22802 ) ) ( not ( = ?auto_22816 ?auto_22798 ) ) ( not ( = ?auto_22816 ?auto_22785 ) ) ( not ( = ?auto_22816 ?auto_22792 ) ) ( not ( = ?auto_22816 ?auto_22788 ) ) ( not ( = ?auto_22816 ?auto_22805 ) ) ( not ( = ?auto_22816 ?auto_22791 ) ) ( not ( = ?auto_22763 ?auto_22774 ) ) ( not ( = ?auto_22763 ?auto_22794 ) ) ( not ( = ?auto_22764 ?auto_22774 ) ) ( not ( = ?auto_22764 ?auto_22794 ) ) ( not ( = ?auto_22765 ?auto_22774 ) ) ( not ( = ?auto_22765 ?auto_22794 ) ) ( not ( = ?auto_22766 ?auto_22774 ) ) ( not ( = ?auto_22766 ?auto_22794 ) ) ( not ( = ?auto_22767 ?auto_22774 ) ) ( not ( = ?auto_22767 ?auto_22794 ) ) ( not ( = ?auto_22768 ?auto_22774 ) ) ( not ( = ?auto_22768 ?auto_22794 ) ) ( not ( = ?auto_22771 ?auto_22774 ) ) ( not ( = ?auto_22771 ?auto_22794 ) ) ( not ( = ?auto_22770 ?auto_22774 ) ) ( not ( = ?auto_22770 ?auto_22794 ) ) ( not ( = ?auto_22769 ?auto_22774 ) ) ( not ( = ?auto_22769 ?auto_22794 ) ) ( not ( = ?auto_22774 ?auto_22816 ) ) ( not ( = ?auto_22774 ?auto_22809 ) ) ( not ( = ?auto_22774 ?auto_22802 ) ) ( not ( = ?auto_22774 ?auto_22798 ) ) ( not ( = ?auto_22774 ?auto_22785 ) ) ( not ( = ?auto_22774 ?auto_22792 ) ) ( not ( = ?auto_22774 ?auto_22788 ) ) ( not ( = ?auto_22774 ?auto_22805 ) ) ( not ( = ?auto_22774 ?auto_22791 ) ) ( not ( = ?auto_22794 ?auto_22816 ) ) ( not ( = ?auto_22794 ?auto_22809 ) ) ( not ( = ?auto_22794 ?auto_22802 ) ) ( not ( = ?auto_22794 ?auto_22798 ) ) ( not ( = ?auto_22794 ?auto_22785 ) ) ( not ( = ?auto_22794 ?auto_22792 ) ) ( not ( = ?auto_22794 ?auto_22788 ) ) ( not ( = ?auto_22794 ?auto_22805 ) ) ( not ( = ?auto_22794 ?auto_22791 ) ) ( not ( = ?auto_22763 ?auto_22773 ) ) ( not ( = ?auto_22763 ?auto_22795 ) ) ( not ( = ?auto_22764 ?auto_22773 ) ) ( not ( = ?auto_22764 ?auto_22795 ) ) ( not ( = ?auto_22765 ?auto_22773 ) ) ( not ( = ?auto_22765 ?auto_22795 ) ) ( not ( = ?auto_22766 ?auto_22773 ) ) ( not ( = ?auto_22766 ?auto_22795 ) ) ( not ( = ?auto_22767 ?auto_22773 ) ) ( not ( = ?auto_22767 ?auto_22795 ) ) ( not ( = ?auto_22768 ?auto_22773 ) ) ( not ( = ?auto_22768 ?auto_22795 ) ) ( not ( = ?auto_22771 ?auto_22773 ) ) ( not ( = ?auto_22771 ?auto_22795 ) ) ( not ( = ?auto_22770 ?auto_22773 ) ) ( not ( = ?auto_22770 ?auto_22795 ) ) ( not ( = ?auto_22769 ?auto_22773 ) ) ( not ( = ?auto_22769 ?auto_22795 ) ) ( not ( = ?auto_22772 ?auto_22773 ) ) ( not ( = ?auto_22772 ?auto_22795 ) ) ( not ( = ?auto_22773 ?auto_22794 ) ) ( not ( = ?auto_22773 ?auto_22816 ) ) ( not ( = ?auto_22773 ?auto_22809 ) ) ( not ( = ?auto_22773 ?auto_22802 ) ) ( not ( = ?auto_22773 ?auto_22798 ) ) ( not ( = ?auto_22773 ?auto_22785 ) ) ( not ( = ?auto_22773 ?auto_22792 ) ) ( not ( = ?auto_22773 ?auto_22788 ) ) ( not ( = ?auto_22773 ?auto_22805 ) ) ( not ( = ?auto_22773 ?auto_22791 ) ) ( not ( = ?auto_22784 ?auto_22790 ) ) ( not ( = ?auto_22784 ?auto_22786 ) ) ( not ( = ?auto_22784 ?auto_22789 ) ) ( not ( = ?auto_22784 ?auto_22814 ) ) ( not ( = ?auto_22784 ?auto_22796 ) ) ( not ( = ?auto_22784 ?auto_22799 ) ) ( not ( = ?auto_22784 ?auto_22787 ) ) ( not ( = ?auto_22784 ?auto_22812 ) ) ( not ( = ?auto_22807 ?auto_22808 ) ) ( not ( = ?auto_22807 ?auto_22811 ) ) ( not ( = ?auto_22807 ?auto_22806 ) ) ( not ( = ?auto_22807 ?auto_22815 ) ) ( not ( = ?auto_22807 ?auto_22801 ) ) ( not ( = ?auto_22807 ?auto_22793 ) ) ( not ( = ?auto_22807 ?auto_22810 ) ) ( not ( = ?auto_22807 ?auto_22804 ) ) ( not ( = ?auto_22795 ?auto_22794 ) ) ( not ( = ?auto_22795 ?auto_22816 ) ) ( not ( = ?auto_22795 ?auto_22809 ) ) ( not ( = ?auto_22795 ?auto_22802 ) ) ( not ( = ?auto_22795 ?auto_22798 ) ) ( not ( = ?auto_22795 ?auto_22785 ) ) ( not ( = ?auto_22795 ?auto_22792 ) ) ( not ( = ?auto_22795 ?auto_22788 ) ) ( not ( = ?auto_22795 ?auto_22805 ) ) ( not ( = ?auto_22795 ?auto_22791 ) ) ( not ( = ?auto_22763 ?auto_22775 ) ) ( not ( = ?auto_22763 ?auto_22797 ) ) ( not ( = ?auto_22764 ?auto_22775 ) ) ( not ( = ?auto_22764 ?auto_22797 ) ) ( not ( = ?auto_22765 ?auto_22775 ) ) ( not ( = ?auto_22765 ?auto_22797 ) ) ( not ( = ?auto_22766 ?auto_22775 ) ) ( not ( = ?auto_22766 ?auto_22797 ) ) ( not ( = ?auto_22767 ?auto_22775 ) ) ( not ( = ?auto_22767 ?auto_22797 ) ) ( not ( = ?auto_22768 ?auto_22775 ) ) ( not ( = ?auto_22768 ?auto_22797 ) ) ( not ( = ?auto_22771 ?auto_22775 ) ) ( not ( = ?auto_22771 ?auto_22797 ) ) ( not ( = ?auto_22770 ?auto_22775 ) ) ( not ( = ?auto_22770 ?auto_22797 ) ) ( not ( = ?auto_22769 ?auto_22775 ) ) ( not ( = ?auto_22769 ?auto_22797 ) ) ( not ( = ?auto_22772 ?auto_22775 ) ) ( not ( = ?auto_22772 ?auto_22797 ) ) ( not ( = ?auto_22774 ?auto_22775 ) ) ( not ( = ?auto_22774 ?auto_22797 ) ) ( not ( = ?auto_22775 ?auto_22795 ) ) ( not ( = ?auto_22775 ?auto_22794 ) ) ( not ( = ?auto_22775 ?auto_22816 ) ) ( not ( = ?auto_22775 ?auto_22809 ) ) ( not ( = ?auto_22775 ?auto_22802 ) ) ( not ( = ?auto_22775 ?auto_22798 ) ) ( not ( = ?auto_22775 ?auto_22785 ) ) ( not ( = ?auto_22775 ?auto_22792 ) ) ( not ( = ?auto_22775 ?auto_22788 ) ) ( not ( = ?auto_22775 ?auto_22805 ) ) ( not ( = ?auto_22775 ?auto_22791 ) ) ( not ( = ?auto_22797 ?auto_22795 ) ) ( not ( = ?auto_22797 ?auto_22794 ) ) ( not ( = ?auto_22797 ?auto_22816 ) ) ( not ( = ?auto_22797 ?auto_22809 ) ) ( not ( = ?auto_22797 ?auto_22802 ) ) ( not ( = ?auto_22797 ?auto_22798 ) ) ( not ( = ?auto_22797 ?auto_22785 ) ) ( not ( = ?auto_22797 ?auto_22792 ) ) ( not ( = ?auto_22797 ?auto_22788 ) ) ( not ( = ?auto_22797 ?auto_22805 ) ) ( not ( = ?auto_22797 ?auto_22791 ) ) ( not ( = ?auto_22763 ?auto_22777 ) ) ( not ( = ?auto_22763 ?auto_22813 ) ) ( not ( = ?auto_22764 ?auto_22777 ) ) ( not ( = ?auto_22764 ?auto_22813 ) ) ( not ( = ?auto_22765 ?auto_22777 ) ) ( not ( = ?auto_22765 ?auto_22813 ) ) ( not ( = ?auto_22766 ?auto_22777 ) ) ( not ( = ?auto_22766 ?auto_22813 ) ) ( not ( = ?auto_22767 ?auto_22777 ) ) ( not ( = ?auto_22767 ?auto_22813 ) ) ( not ( = ?auto_22768 ?auto_22777 ) ) ( not ( = ?auto_22768 ?auto_22813 ) ) ( not ( = ?auto_22771 ?auto_22777 ) ) ( not ( = ?auto_22771 ?auto_22813 ) ) ( not ( = ?auto_22770 ?auto_22777 ) ) ( not ( = ?auto_22770 ?auto_22813 ) ) ( not ( = ?auto_22769 ?auto_22777 ) ) ( not ( = ?auto_22769 ?auto_22813 ) ) ( not ( = ?auto_22772 ?auto_22777 ) ) ( not ( = ?auto_22772 ?auto_22813 ) ) ( not ( = ?auto_22774 ?auto_22777 ) ) ( not ( = ?auto_22774 ?auto_22813 ) ) ( not ( = ?auto_22773 ?auto_22777 ) ) ( not ( = ?auto_22773 ?auto_22813 ) ) ( not ( = ?auto_22777 ?auto_22797 ) ) ( not ( = ?auto_22777 ?auto_22795 ) ) ( not ( = ?auto_22777 ?auto_22794 ) ) ( not ( = ?auto_22777 ?auto_22816 ) ) ( not ( = ?auto_22777 ?auto_22809 ) ) ( not ( = ?auto_22777 ?auto_22802 ) ) ( not ( = ?auto_22777 ?auto_22798 ) ) ( not ( = ?auto_22777 ?auto_22785 ) ) ( not ( = ?auto_22777 ?auto_22792 ) ) ( not ( = ?auto_22777 ?auto_22788 ) ) ( not ( = ?auto_22777 ?auto_22805 ) ) ( not ( = ?auto_22777 ?auto_22791 ) ) ( not ( = ?auto_22800 ?auto_22787 ) ) ( not ( = ?auto_22800 ?auto_22784 ) ) ( not ( = ?auto_22800 ?auto_22790 ) ) ( not ( = ?auto_22800 ?auto_22786 ) ) ( not ( = ?auto_22800 ?auto_22789 ) ) ( not ( = ?auto_22800 ?auto_22814 ) ) ( not ( = ?auto_22800 ?auto_22796 ) ) ( not ( = ?auto_22800 ?auto_22799 ) ) ( not ( = ?auto_22800 ?auto_22812 ) ) ( not ( = ?auto_22803 ?auto_22810 ) ) ( not ( = ?auto_22803 ?auto_22807 ) ) ( not ( = ?auto_22803 ?auto_22808 ) ) ( not ( = ?auto_22803 ?auto_22811 ) ) ( not ( = ?auto_22803 ?auto_22806 ) ) ( not ( = ?auto_22803 ?auto_22815 ) ) ( not ( = ?auto_22803 ?auto_22801 ) ) ( not ( = ?auto_22803 ?auto_22793 ) ) ( not ( = ?auto_22803 ?auto_22804 ) ) ( not ( = ?auto_22813 ?auto_22797 ) ) ( not ( = ?auto_22813 ?auto_22795 ) ) ( not ( = ?auto_22813 ?auto_22794 ) ) ( not ( = ?auto_22813 ?auto_22816 ) ) ( not ( = ?auto_22813 ?auto_22809 ) ) ( not ( = ?auto_22813 ?auto_22802 ) ) ( not ( = ?auto_22813 ?auto_22798 ) ) ( not ( = ?auto_22813 ?auto_22785 ) ) ( not ( = ?auto_22813 ?auto_22792 ) ) ( not ( = ?auto_22813 ?auto_22788 ) ) ( not ( = ?auto_22813 ?auto_22805 ) ) ( not ( = ?auto_22813 ?auto_22791 ) ) ( not ( = ?auto_22763 ?auto_22776 ) ) ( not ( = ?auto_22763 ?auto_22781 ) ) ( not ( = ?auto_22764 ?auto_22776 ) ) ( not ( = ?auto_22764 ?auto_22781 ) ) ( not ( = ?auto_22765 ?auto_22776 ) ) ( not ( = ?auto_22765 ?auto_22781 ) ) ( not ( = ?auto_22766 ?auto_22776 ) ) ( not ( = ?auto_22766 ?auto_22781 ) ) ( not ( = ?auto_22767 ?auto_22776 ) ) ( not ( = ?auto_22767 ?auto_22781 ) ) ( not ( = ?auto_22768 ?auto_22776 ) ) ( not ( = ?auto_22768 ?auto_22781 ) ) ( not ( = ?auto_22771 ?auto_22776 ) ) ( not ( = ?auto_22771 ?auto_22781 ) ) ( not ( = ?auto_22770 ?auto_22776 ) ) ( not ( = ?auto_22770 ?auto_22781 ) ) ( not ( = ?auto_22769 ?auto_22776 ) ) ( not ( = ?auto_22769 ?auto_22781 ) ) ( not ( = ?auto_22772 ?auto_22776 ) ) ( not ( = ?auto_22772 ?auto_22781 ) ) ( not ( = ?auto_22774 ?auto_22776 ) ) ( not ( = ?auto_22774 ?auto_22781 ) ) ( not ( = ?auto_22773 ?auto_22776 ) ) ( not ( = ?auto_22773 ?auto_22781 ) ) ( not ( = ?auto_22775 ?auto_22776 ) ) ( not ( = ?auto_22775 ?auto_22781 ) ) ( not ( = ?auto_22776 ?auto_22813 ) ) ( not ( = ?auto_22776 ?auto_22797 ) ) ( not ( = ?auto_22776 ?auto_22795 ) ) ( not ( = ?auto_22776 ?auto_22794 ) ) ( not ( = ?auto_22776 ?auto_22816 ) ) ( not ( = ?auto_22776 ?auto_22809 ) ) ( not ( = ?auto_22776 ?auto_22802 ) ) ( not ( = ?auto_22776 ?auto_22798 ) ) ( not ( = ?auto_22776 ?auto_22785 ) ) ( not ( = ?auto_22776 ?auto_22792 ) ) ( not ( = ?auto_22776 ?auto_22788 ) ) ( not ( = ?auto_22776 ?auto_22805 ) ) ( not ( = ?auto_22776 ?auto_22791 ) ) ( not ( = ?auto_22783 ?auto_22800 ) ) ( not ( = ?auto_22783 ?auto_22787 ) ) ( not ( = ?auto_22783 ?auto_22784 ) ) ( not ( = ?auto_22783 ?auto_22790 ) ) ( not ( = ?auto_22783 ?auto_22786 ) ) ( not ( = ?auto_22783 ?auto_22789 ) ) ( not ( = ?auto_22783 ?auto_22814 ) ) ( not ( = ?auto_22783 ?auto_22796 ) ) ( not ( = ?auto_22783 ?auto_22799 ) ) ( not ( = ?auto_22783 ?auto_22812 ) ) ( not ( = ?auto_22782 ?auto_22803 ) ) ( not ( = ?auto_22782 ?auto_22810 ) ) ( not ( = ?auto_22782 ?auto_22807 ) ) ( not ( = ?auto_22782 ?auto_22808 ) ) ( not ( = ?auto_22782 ?auto_22811 ) ) ( not ( = ?auto_22782 ?auto_22806 ) ) ( not ( = ?auto_22782 ?auto_22815 ) ) ( not ( = ?auto_22782 ?auto_22801 ) ) ( not ( = ?auto_22782 ?auto_22793 ) ) ( not ( = ?auto_22782 ?auto_22804 ) ) ( not ( = ?auto_22781 ?auto_22813 ) ) ( not ( = ?auto_22781 ?auto_22797 ) ) ( not ( = ?auto_22781 ?auto_22795 ) ) ( not ( = ?auto_22781 ?auto_22794 ) ) ( not ( = ?auto_22781 ?auto_22816 ) ) ( not ( = ?auto_22781 ?auto_22809 ) ) ( not ( = ?auto_22781 ?auto_22802 ) ) ( not ( = ?auto_22781 ?auto_22798 ) ) ( not ( = ?auto_22781 ?auto_22785 ) ) ( not ( = ?auto_22781 ?auto_22792 ) ) ( not ( = ?auto_22781 ?auto_22788 ) ) ( not ( = ?auto_22781 ?auto_22805 ) ) ( not ( = ?auto_22781 ?auto_22791 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_22763 ?auto_22764 ?auto_22765 ?auto_22766 ?auto_22767 ?auto_22768 ?auto_22771 ?auto_22770 ?auto_22769 ?auto_22772 ?auto_22774 ?auto_22773 ?auto_22775 ?auto_22777 )
      ( MAKE-1CRATE ?auto_22777 ?auto_22776 )
      ( MAKE-14CRATE-VERIFY ?auto_22763 ?auto_22764 ?auto_22765 ?auto_22766 ?auto_22767 ?auto_22768 ?auto_22771 ?auto_22770 ?auto_22769 ?auto_22772 ?auto_22774 ?auto_22773 ?auto_22775 ?auto_22777 ?auto_22776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22819 - SURFACE
      ?auto_22820 - SURFACE
    )
    :vars
    (
      ?auto_22821 - HOIST
      ?auto_22822 - PLACE
      ?auto_22824 - PLACE
      ?auto_22825 - HOIST
      ?auto_22826 - SURFACE
      ?auto_22823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22821 ?auto_22822 ) ( SURFACE-AT ?auto_22819 ?auto_22822 ) ( CLEAR ?auto_22819 ) ( IS-CRATE ?auto_22820 ) ( AVAILABLE ?auto_22821 ) ( not ( = ?auto_22824 ?auto_22822 ) ) ( HOIST-AT ?auto_22825 ?auto_22824 ) ( AVAILABLE ?auto_22825 ) ( SURFACE-AT ?auto_22820 ?auto_22824 ) ( ON ?auto_22820 ?auto_22826 ) ( CLEAR ?auto_22820 ) ( TRUCK-AT ?auto_22823 ?auto_22822 ) ( not ( = ?auto_22819 ?auto_22820 ) ) ( not ( = ?auto_22819 ?auto_22826 ) ) ( not ( = ?auto_22820 ?auto_22826 ) ) ( not ( = ?auto_22821 ?auto_22825 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22823 ?auto_22822 ?auto_22824 )
      ( !LIFT ?auto_22825 ?auto_22820 ?auto_22826 ?auto_22824 )
      ( !LOAD ?auto_22825 ?auto_22820 ?auto_22823 ?auto_22824 )
      ( !DRIVE ?auto_22823 ?auto_22824 ?auto_22822 )
      ( !UNLOAD ?auto_22821 ?auto_22820 ?auto_22823 ?auto_22822 )
      ( !DROP ?auto_22821 ?auto_22820 ?auto_22819 ?auto_22822 )
      ( MAKE-1CRATE-VERIFY ?auto_22819 ?auto_22820 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_22843 - SURFACE
      ?auto_22844 - SURFACE
      ?auto_22845 - SURFACE
      ?auto_22846 - SURFACE
      ?auto_22847 - SURFACE
      ?auto_22848 - SURFACE
      ?auto_22851 - SURFACE
      ?auto_22850 - SURFACE
      ?auto_22849 - SURFACE
      ?auto_22852 - SURFACE
      ?auto_22854 - SURFACE
      ?auto_22853 - SURFACE
      ?auto_22855 - SURFACE
      ?auto_22857 - SURFACE
      ?auto_22856 - SURFACE
      ?auto_22858 - SURFACE
    )
    :vars
    (
      ?auto_22862 - HOIST
      ?auto_22863 - PLACE
      ?auto_22860 - PLACE
      ?auto_22864 - HOIST
      ?auto_22861 - SURFACE
      ?auto_22870 - SURFACE
      ?auto_22889 - PLACE
      ?auto_22891 - HOIST
      ?auto_22872 - SURFACE
      ?auto_22877 - PLACE
      ?auto_22867 - HOIST
      ?auto_22871 - SURFACE
      ?auto_22874 - PLACE
      ?auto_22897 - HOIST
      ?auto_22883 - SURFACE
      ?auto_22865 - PLACE
      ?auto_22893 - HOIST
      ?auto_22886 - SURFACE
      ?auto_22898 - PLACE
      ?auto_22894 - HOIST
      ?auto_22866 - SURFACE
      ?auto_22888 - SURFACE
      ?auto_22880 - PLACE
      ?auto_22873 - HOIST
      ?auto_22895 - SURFACE
      ?auto_22896 - PLACE
      ?auto_22887 - HOIST
      ?auto_22878 - SURFACE
      ?auto_22876 - PLACE
      ?auto_22869 - HOIST
      ?auto_22892 - SURFACE
      ?auto_22884 - SURFACE
      ?auto_22868 - PLACE
      ?auto_22885 - HOIST
      ?auto_22875 - SURFACE
      ?auto_22879 - SURFACE
      ?auto_22882 - PLACE
      ?auto_22881 - HOIST
      ?auto_22890 - SURFACE
      ?auto_22859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22862 ?auto_22863 ) ( IS-CRATE ?auto_22858 ) ( not ( = ?auto_22860 ?auto_22863 ) ) ( HOIST-AT ?auto_22864 ?auto_22860 ) ( SURFACE-AT ?auto_22858 ?auto_22860 ) ( ON ?auto_22858 ?auto_22861 ) ( CLEAR ?auto_22858 ) ( not ( = ?auto_22856 ?auto_22858 ) ) ( not ( = ?auto_22856 ?auto_22861 ) ) ( not ( = ?auto_22858 ?auto_22861 ) ) ( not ( = ?auto_22862 ?auto_22864 ) ) ( IS-CRATE ?auto_22856 ) ( AVAILABLE ?auto_22864 ) ( SURFACE-AT ?auto_22856 ?auto_22860 ) ( ON ?auto_22856 ?auto_22870 ) ( CLEAR ?auto_22856 ) ( not ( = ?auto_22857 ?auto_22856 ) ) ( not ( = ?auto_22857 ?auto_22870 ) ) ( not ( = ?auto_22856 ?auto_22870 ) ) ( IS-CRATE ?auto_22857 ) ( not ( = ?auto_22889 ?auto_22863 ) ) ( HOIST-AT ?auto_22891 ?auto_22889 ) ( AVAILABLE ?auto_22891 ) ( SURFACE-AT ?auto_22857 ?auto_22889 ) ( ON ?auto_22857 ?auto_22872 ) ( CLEAR ?auto_22857 ) ( not ( = ?auto_22855 ?auto_22857 ) ) ( not ( = ?auto_22855 ?auto_22872 ) ) ( not ( = ?auto_22857 ?auto_22872 ) ) ( not ( = ?auto_22862 ?auto_22891 ) ) ( IS-CRATE ?auto_22855 ) ( not ( = ?auto_22877 ?auto_22863 ) ) ( HOIST-AT ?auto_22867 ?auto_22877 ) ( SURFACE-AT ?auto_22855 ?auto_22877 ) ( ON ?auto_22855 ?auto_22871 ) ( CLEAR ?auto_22855 ) ( not ( = ?auto_22853 ?auto_22855 ) ) ( not ( = ?auto_22853 ?auto_22871 ) ) ( not ( = ?auto_22855 ?auto_22871 ) ) ( not ( = ?auto_22862 ?auto_22867 ) ) ( IS-CRATE ?auto_22853 ) ( not ( = ?auto_22874 ?auto_22863 ) ) ( HOIST-AT ?auto_22897 ?auto_22874 ) ( AVAILABLE ?auto_22897 ) ( SURFACE-AT ?auto_22853 ?auto_22874 ) ( ON ?auto_22853 ?auto_22883 ) ( CLEAR ?auto_22853 ) ( not ( = ?auto_22854 ?auto_22853 ) ) ( not ( = ?auto_22854 ?auto_22883 ) ) ( not ( = ?auto_22853 ?auto_22883 ) ) ( not ( = ?auto_22862 ?auto_22897 ) ) ( IS-CRATE ?auto_22854 ) ( not ( = ?auto_22865 ?auto_22863 ) ) ( HOIST-AT ?auto_22893 ?auto_22865 ) ( SURFACE-AT ?auto_22854 ?auto_22865 ) ( ON ?auto_22854 ?auto_22886 ) ( CLEAR ?auto_22854 ) ( not ( = ?auto_22852 ?auto_22854 ) ) ( not ( = ?auto_22852 ?auto_22886 ) ) ( not ( = ?auto_22854 ?auto_22886 ) ) ( not ( = ?auto_22862 ?auto_22893 ) ) ( IS-CRATE ?auto_22852 ) ( not ( = ?auto_22898 ?auto_22863 ) ) ( HOIST-AT ?auto_22894 ?auto_22898 ) ( AVAILABLE ?auto_22894 ) ( SURFACE-AT ?auto_22852 ?auto_22898 ) ( ON ?auto_22852 ?auto_22866 ) ( CLEAR ?auto_22852 ) ( not ( = ?auto_22849 ?auto_22852 ) ) ( not ( = ?auto_22849 ?auto_22866 ) ) ( not ( = ?auto_22852 ?auto_22866 ) ) ( not ( = ?auto_22862 ?auto_22894 ) ) ( IS-CRATE ?auto_22849 ) ( SURFACE-AT ?auto_22849 ?auto_22865 ) ( ON ?auto_22849 ?auto_22888 ) ( CLEAR ?auto_22849 ) ( not ( = ?auto_22850 ?auto_22849 ) ) ( not ( = ?auto_22850 ?auto_22888 ) ) ( not ( = ?auto_22849 ?auto_22888 ) ) ( IS-CRATE ?auto_22850 ) ( not ( = ?auto_22880 ?auto_22863 ) ) ( HOIST-AT ?auto_22873 ?auto_22880 ) ( AVAILABLE ?auto_22873 ) ( SURFACE-AT ?auto_22850 ?auto_22880 ) ( ON ?auto_22850 ?auto_22895 ) ( CLEAR ?auto_22850 ) ( not ( = ?auto_22851 ?auto_22850 ) ) ( not ( = ?auto_22851 ?auto_22895 ) ) ( not ( = ?auto_22850 ?auto_22895 ) ) ( not ( = ?auto_22862 ?auto_22873 ) ) ( IS-CRATE ?auto_22851 ) ( not ( = ?auto_22896 ?auto_22863 ) ) ( HOIST-AT ?auto_22887 ?auto_22896 ) ( AVAILABLE ?auto_22887 ) ( SURFACE-AT ?auto_22851 ?auto_22896 ) ( ON ?auto_22851 ?auto_22878 ) ( CLEAR ?auto_22851 ) ( not ( = ?auto_22848 ?auto_22851 ) ) ( not ( = ?auto_22848 ?auto_22878 ) ) ( not ( = ?auto_22851 ?auto_22878 ) ) ( not ( = ?auto_22862 ?auto_22887 ) ) ( IS-CRATE ?auto_22848 ) ( not ( = ?auto_22876 ?auto_22863 ) ) ( HOIST-AT ?auto_22869 ?auto_22876 ) ( AVAILABLE ?auto_22869 ) ( SURFACE-AT ?auto_22848 ?auto_22876 ) ( ON ?auto_22848 ?auto_22892 ) ( CLEAR ?auto_22848 ) ( not ( = ?auto_22847 ?auto_22848 ) ) ( not ( = ?auto_22847 ?auto_22892 ) ) ( not ( = ?auto_22848 ?auto_22892 ) ) ( not ( = ?auto_22862 ?auto_22869 ) ) ( IS-CRATE ?auto_22847 ) ( AVAILABLE ?auto_22893 ) ( SURFACE-AT ?auto_22847 ?auto_22865 ) ( ON ?auto_22847 ?auto_22884 ) ( CLEAR ?auto_22847 ) ( not ( = ?auto_22846 ?auto_22847 ) ) ( not ( = ?auto_22846 ?auto_22884 ) ) ( not ( = ?auto_22847 ?auto_22884 ) ) ( IS-CRATE ?auto_22846 ) ( not ( = ?auto_22868 ?auto_22863 ) ) ( HOIST-AT ?auto_22885 ?auto_22868 ) ( AVAILABLE ?auto_22885 ) ( SURFACE-AT ?auto_22846 ?auto_22868 ) ( ON ?auto_22846 ?auto_22875 ) ( CLEAR ?auto_22846 ) ( not ( = ?auto_22845 ?auto_22846 ) ) ( not ( = ?auto_22845 ?auto_22875 ) ) ( not ( = ?auto_22846 ?auto_22875 ) ) ( not ( = ?auto_22862 ?auto_22885 ) ) ( IS-CRATE ?auto_22845 ) ( AVAILABLE ?auto_22867 ) ( SURFACE-AT ?auto_22845 ?auto_22877 ) ( ON ?auto_22845 ?auto_22879 ) ( CLEAR ?auto_22845 ) ( not ( = ?auto_22844 ?auto_22845 ) ) ( not ( = ?auto_22844 ?auto_22879 ) ) ( not ( = ?auto_22845 ?auto_22879 ) ) ( SURFACE-AT ?auto_22843 ?auto_22863 ) ( CLEAR ?auto_22843 ) ( IS-CRATE ?auto_22844 ) ( AVAILABLE ?auto_22862 ) ( not ( = ?auto_22882 ?auto_22863 ) ) ( HOIST-AT ?auto_22881 ?auto_22882 ) ( AVAILABLE ?auto_22881 ) ( SURFACE-AT ?auto_22844 ?auto_22882 ) ( ON ?auto_22844 ?auto_22890 ) ( CLEAR ?auto_22844 ) ( TRUCK-AT ?auto_22859 ?auto_22863 ) ( not ( = ?auto_22843 ?auto_22844 ) ) ( not ( = ?auto_22843 ?auto_22890 ) ) ( not ( = ?auto_22844 ?auto_22890 ) ) ( not ( = ?auto_22862 ?auto_22881 ) ) ( not ( = ?auto_22843 ?auto_22845 ) ) ( not ( = ?auto_22843 ?auto_22879 ) ) ( not ( = ?auto_22845 ?auto_22890 ) ) ( not ( = ?auto_22877 ?auto_22882 ) ) ( not ( = ?auto_22867 ?auto_22881 ) ) ( not ( = ?auto_22879 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22846 ) ) ( not ( = ?auto_22843 ?auto_22875 ) ) ( not ( = ?auto_22844 ?auto_22846 ) ) ( not ( = ?auto_22844 ?auto_22875 ) ) ( not ( = ?auto_22846 ?auto_22879 ) ) ( not ( = ?auto_22846 ?auto_22890 ) ) ( not ( = ?auto_22868 ?auto_22877 ) ) ( not ( = ?auto_22868 ?auto_22882 ) ) ( not ( = ?auto_22885 ?auto_22867 ) ) ( not ( = ?auto_22885 ?auto_22881 ) ) ( not ( = ?auto_22875 ?auto_22879 ) ) ( not ( = ?auto_22875 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22847 ) ) ( not ( = ?auto_22843 ?auto_22884 ) ) ( not ( = ?auto_22844 ?auto_22847 ) ) ( not ( = ?auto_22844 ?auto_22884 ) ) ( not ( = ?auto_22845 ?auto_22847 ) ) ( not ( = ?auto_22845 ?auto_22884 ) ) ( not ( = ?auto_22847 ?auto_22875 ) ) ( not ( = ?auto_22847 ?auto_22879 ) ) ( not ( = ?auto_22847 ?auto_22890 ) ) ( not ( = ?auto_22865 ?auto_22868 ) ) ( not ( = ?auto_22865 ?auto_22877 ) ) ( not ( = ?auto_22865 ?auto_22882 ) ) ( not ( = ?auto_22893 ?auto_22885 ) ) ( not ( = ?auto_22893 ?auto_22867 ) ) ( not ( = ?auto_22893 ?auto_22881 ) ) ( not ( = ?auto_22884 ?auto_22875 ) ) ( not ( = ?auto_22884 ?auto_22879 ) ) ( not ( = ?auto_22884 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22848 ) ) ( not ( = ?auto_22843 ?auto_22892 ) ) ( not ( = ?auto_22844 ?auto_22848 ) ) ( not ( = ?auto_22844 ?auto_22892 ) ) ( not ( = ?auto_22845 ?auto_22848 ) ) ( not ( = ?auto_22845 ?auto_22892 ) ) ( not ( = ?auto_22846 ?auto_22848 ) ) ( not ( = ?auto_22846 ?auto_22892 ) ) ( not ( = ?auto_22848 ?auto_22884 ) ) ( not ( = ?auto_22848 ?auto_22875 ) ) ( not ( = ?auto_22848 ?auto_22879 ) ) ( not ( = ?auto_22848 ?auto_22890 ) ) ( not ( = ?auto_22876 ?auto_22865 ) ) ( not ( = ?auto_22876 ?auto_22868 ) ) ( not ( = ?auto_22876 ?auto_22877 ) ) ( not ( = ?auto_22876 ?auto_22882 ) ) ( not ( = ?auto_22869 ?auto_22893 ) ) ( not ( = ?auto_22869 ?auto_22885 ) ) ( not ( = ?auto_22869 ?auto_22867 ) ) ( not ( = ?auto_22869 ?auto_22881 ) ) ( not ( = ?auto_22892 ?auto_22884 ) ) ( not ( = ?auto_22892 ?auto_22875 ) ) ( not ( = ?auto_22892 ?auto_22879 ) ) ( not ( = ?auto_22892 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22851 ) ) ( not ( = ?auto_22843 ?auto_22878 ) ) ( not ( = ?auto_22844 ?auto_22851 ) ) ( not ( = ?auto_22844 ?auto_22878 ) ) ( not ( = ?auto_22845 ?auto_22851 ) ) ( not ( = ?auto_22845 ?auto_22878 ) ) ( not ( = ?auto_22846 ?auto_22851 ) ) ( not ( = ?auto_22846 ?auto_22878 ) ) ( not ( = ?auto_22847 ?auto_22851 ) ) ( not ( = ?auto_22847 ?auto_22878 ) ) ( not ( = ?auto_22851 ?auto_22892 ) ) ( not ( = ?auto_22851 ?auto_22884 ) ) ( not ( = ?auto_22851 ?auto_22875 ) ) ( not ( = ?auto_22851 ?auto_22879 ) ) ( not ( = ?auto_22851 ?auto_22890 ) ) ( not ( = ?auto_22896 ?auto_22876 ) ) ( not ( = ?auto_22896 ?auto_22865 ) ) ( not ( = ?auto_22896 ?auto_22868 ) ) ( not ( = ?auto_22896 ?auto_22877 ) ) ( not ( = ?auto_22896 ?auto_22882 ) ) ( not ( = ?auto_22887 ?auto_22869 ) ) ( not ( = ?auto_22887 ?auto_22893 ) ) ( not ( = ?auto_22887 ?auto_22885 ) ) ( not ( = ?auto_22887 ?auto_22867 ) ) ( not ( = ?auto_22887 ?auto_22881 ) ) ( not ( = ?auto_22878 ?auto_22892 ) ) ( not ( = ?auto_22878 ?auto_22884 ) ) ( not ( = ?auto_22878 ?auto_22875 ) ) ( not ( = ?auto_22878 ?auto_22879 ) ) ( not ( = ?auto_22878 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22850 ) ) ( not ( = ?auto_22843 ?auto_22895 ) ) ( not ( = ?auto_22844 ?auto_22850 ) ) ( not ( = ?auto_22844 ?auto_22895 ) ) ( not ( = ?auto_22845 ?auto_22850 ) ) ( not ( = ?auto_22845 ?auto_22895 ) ) ( not ( = ?auto_22846 ?auto_22850 ) ) ( not ( = ?auto_22846 ?auto_22895 ) ) ( not ( = ?auto_22847 ?auto_22850 ) ) ( not ( = ?auto_22847 ?auto_22895 ) ) ( not ( = ?auto_22848 ?auto_22850 ) ) ( not ( = ?auto_22848 ?auto_22895 ) ) ( not ( = ?auto_22850 ?auto_22878 ) ) ( not ( = ?auto_22850 ?auto_22892 ) ) ( not ( = ?auto_22850 ?auto_22884 ) ) ( not ( = ?auto_22850 ?auto_22875 ) ) ( not ( = ?auto_22850 ?auto_22879 ) ) ( not ( = ?auto_22850 ?auto_22890 ) ) ( not ( = ?auto_22880 ?auto_22896 ) ) ( not ( = ?auto_22880 ?auto_22876 ) ) ( not ( = ?auto_22880 ?auto_22865 ) ) ( not ( = ?auto_22880 ?auto_22868 ) ) ( not ( = ?auto_22880 ?auto_22877 ) ) ( not ( = ?auto_22880 ?auto_22882 ) ) ( not ( = ?auto_22873 ?auto_22887 ) ) ( not ( = ?auto_22873 ?auto_22869 ) ) ( not ( = ?auto_22873 ?auto_22893 ) ) ( not ( = ?auto_22873 ?auto_22885 ) ) ( not ( = ?auto_22873 ?auto_22867 ) ) ( not ( = ?auto_22873 ?auto_22881 ) ) ( not ( = ?auto_22895 ?auto_22878 ) ) ( not ( = ?auto_22895 ?auto_22892 ) ) ( not ( = ?auto_22895 ?auto_22884 ) ) ( not ( = ?auto_22895 ?auto_22875 ) ) ( not ( = ?auto_22895 ?auto_22879 ) ) ( not ( = ?auto_22895 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22849 ) ) ( not ( = ?auto_22843 ?auto_22888 ) ) ( not ( = ?auto_22844 ?auto_22849 ) ) ( not ( = ?auto_22844 ?auto_22888 ) ) ( not ( = ?auto_22845 ?auto_22849 ) ) ( not ( = ?auto_22845 ?auto_22888 ) ) ( not ( = ?auto_22846 ?auto_22849 ) ) ( not ( = ?auto_22846 ?auto_22888 ) ) ( not ( = ?auto_22847 ?auto_22849 ) ) ( not ( = ?auto_22847 ?auto_22888 ) ) ( not ( = ?auto_22848 ?auto_22849 ) ) ( not ( = ?auto_22848 ?auto_22888 ) ) ( not ( = ?auto_22851 ?auto_22849 ) ) ( not ( = ?auto_22851 ?auto_22888 ) ) ( not ( = ?auto_22849 ?auto_22895 ) ) ( not ( = ?auto_22849 ?auto_22878 ) ) ( not ( = ?auto_22849 ?auto_22892 ) ) ( not ( = ?auto_22849 ?auto_22884 ) ) ( not ( = ?auto_22849 ?auto_22875 ) ) ( not ( = ?auto_22849 ?auto_22879 ) ) ( not ( = ?auto_22849 ?auto_22890 ) ) ( not ( = ?auto_22888 ?auto_22895 ) ) ( not ( = ?auto_22888 ?auto_22878 ) ) ( not ( = ?auto_22888 ?auto_22892 ) ) ( not ( = ?auto_22888 ?auto_22884 ) ) ( not ( = ?auto_22888 ?auto_22875 ) ) ( not ( = ?auto_22888 ?auto_22879 ) ) ( not ( = ?auto_22888 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22852 ) ) ( not ( = ?auto_22843 ?auto_22866 ) ) ( not ( = ?auto_22844 ?auto_22852 ) ) ( not ( = ?auto_22844 ?auto_22866 ) ) ( not ( = ?auto_22845 ?auto_22852 ) ) ( not ( = ?auto_22845 ?auto_22866 ) ) ( not ( = ?auto_22846 ?auto_22852 ) ) ( not ( = ?auto_22846 ?auto_22866 ) ) ( not ( = ?auto_22847 ?auto_22852 ) ) ( not ( = ?auto_22847 ?auto_22866 ) ) ( not ( = ?auto_22848 ?auto_22852 ) ) ( not ( = ?auto_22848 ?auto_22866 ) ) ( not ( = ?auto_22851 ?auto_22852 ) ) ( not ( = ?auto_22851 ?auto_22866 ) ) ( not ( = ?auto_22850 ?auto_22852 ) ) ( not ( = ?auto_22850 ?auto_22866 ) ) ( not ( = ?auto_22852 ?auto_22888 ) ) ( not ( = ?auto_22852 ?auto_22895 ) ) ( not ( = ?auto_22852 ?auto_22878 ) ) ( not ( = ?auto_22852 ?auto_22892 ) ) ( not ( = ?auto_22852 ?auto_22884 ) ) ( not ( = ?auto_22852 ?auto_22875 ) ) ( not ( = ?auto_22852 ?auto_22879 ) ) ( not ( = ?auto_22852 ?auto_22890 ) ) ( not ( = ?auto_22898 ?auto_22865 ) ) ( not ( = ?auto_22898 ?auto_22880 ) ) ( not ( = ?auto_22898 ?auto_22896 ) ) ( not ( = ?auto_22898 ?auto_22876 ) ) ( not ( = ?auto_22898 ?auto_22868 ) ) ( not ( = ?auto_22898 ?auto_22877 ) ) ( not ( = ?auto_22898 ?auto_22882 ) ) ( not ( = ?auto_22894 ?auto_22893 ) ) ( not ( = ?auto_22894 ?auto_22873 ) ) ( not ( = ?auto_22894 ?auto_22887 ) ) ( not ( = ?auto_22894 ?auto_22869 ) ) ( not ( = ?auto_22894 ?auto_22885 ) ) ( not ( = ?auto_22894 ?auto_22867 ) ) ( not ( = ?auto_22894 ?auto_22881 ) ) ( not ( = ?auto_22866 ?auto_22888 ) ) ( not ( = ?auto_22866 ?auto_22895 ) ) ( not ( = ?auto_22866 ?auto_22878 ) ) ( not ( = ?auto_22866 ?auto_22892 ) ) ( not ( = ?auto_22866 ?auto_22884 ) ) ( not ( = ?auto_22866 ?auto_22875 ) ) ( not ( = ?auto_22866 ?auto_22879 ) ) ( not ( = ?auto_22866 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22854 ) ) ( not ( = ?auto_22843 ?auto_22886 ) ) ( not ( = ?auto_22844 ?auto_22854 ) ) ( not ( = ?auto_22844 ?auto_22886 ) ) ( not ( = ?auto_22845 ?auto_22854 ) ) ( not ( = ?auto_22845 ?auto_22886 ) ) ( not ( = ?auto_22846 ?auto_22854 ) ) ( not ( = ?auto_22846 ?auto_22886 ) ) ( not ( = ?auto_22847 ?auto_22854 ) ) ( not ( = ?auto_22847 ?auto_22886 ) ) ( not ( = ?auto_22848 ?auto_22854 ) ) ( not ( = ?auto_22848 ?auto_22886 ) ) ( not ( = ?auto_22851 ?auto_22854 ) ) ( not ( = ?auto_22851 ?auto_22886 ) ) ( not ( = ?auto_22850 ?auto_22854 ) ) ( not ( = ?auto_22850 ?auto_22886 ) ) ( not ( = ?auto_22849 ?auto_22854 ) ) ( not ( = ?auto_22849 ?auto_22886 ) ) ( not ( = ?auto_22854 ?auto_22866 ) ) ( not ( = ?auto_22854 ?auto_22888 ) ) ( not ( = ?auto_22854 ?auto_22895 ) ) ( not ( = ?auto_22854 ?auto_22878 ) ) ( not ( = ?auto_22854 ?auto_22892 ) ) ( not ( = ?auto_22854 ?auto_22884 ) ) ( not ( = ?auto_22854 ?auto_22875 ) ) ( not ( = ?auto_22854 ?auto_22879 ) ) ( not ( = ?auto_22854 ?auto_22890 ) ) ( not ( = ?auto_22886 ?auto_22866 ) ) ( not ( = ?auto_22886 ?auto_22888 ) ) ( not ( = ?auto_22886 ?auto_22895 ) ) ( not ( = ?auto_22886 ?auto_22878 ) ) ( not ( = ?auto_22886 ?auto_22892 ) ) ( not ( = ?auto_22886 ?auto_22884 ) ) ( not ( = ?auto_22886 ?auto_22875 ) ) ( not ( = ?auto_22886 ?auto_22879 ) ) ( not ( = ?auto_22886 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22853 ) ) ( not ( = ?auto_22843 ?auto_22883 ) ) ( not ( = ?auto_22844 ?auto_22853 ) ) ( not ( = ?auto_22844 ?auto_22883 ) ) ( not ( = ?auto_22845 ?auto_22853 ) ) ( not ( = ?auto_22845 ?auto_22883 ) ) ( not ( = ?auto_22846 ?auto_22853 ) ) ( not ( = ?auto_22846 ?auto_22883 ) ) ( not ( = ?auto_22847 ?auto_22853 ) ) ( not ( = ?auto_22847 ?auto_22883 ) ) ( not ( = ?auto_22848 ?auto_22853 ) ) ( not ( = ?auto_22848 ?auto_22883 ) ) ( not ( = ?auto_22851 ?auto_22853 ) ) ( not ( = ?auto_22851 ?auto_22883 ) ) ( not ( = ?auto_22850 ?auto_22853 ) ) ( not ( = ?auto_22850 ?auto_22883 ) ) ( not ( = ?auto_22849 ?auto_22853 ) ) ( not ( = ?auto_22849 ?auto_22883 ) ) ( not ( = ?auto_22852 ?auto_22853 ) ) ( not ( = ?auto_22852 ?auto_22883 ) ) ( not ( = ?auto_22853 ?auto_22886 ) ) ( not ( = ?auto_22853 ?auto_22866 ) ) ( not ( = ?auto_22853 ?auto_22888 ) ) ( not ( = ?auto_22853 ?auto_22895 ) ) ( not ( = ?auto_22853 ?auto_22878 ) ) ( not ( = ?auto_22853 ?auto_22892 ) ) ( not ( = ?auto_22853 ?auto_22884 ) ) ( not ( = ?auto_22853 ?auto_22875 ) ) ( not ( = ?auto_22853 ?auto_22879 ) ) ( not ( = ?auto_22853 ?auto_22890 ) ) ( not ( = ?auto_22874 ?auto_22865 ) ) ( not ( = ?auto_22874 ?auto_22898 ) ) ( not ( = ?auto_22874 ?auto_22880 ) ) ( not ( = ?auto_22874 ?auto_22896 ) ) ( not ( = ?auto_22874 ?auto_22876 ) ) ( not ( = ?auto_22874 ?auto_22868 ) ) ( not ( = ?auto_22874 ?auto_22877 ) ) ( not ( = ?auto_22874 ?auto_22882 ) ) ( not ( = ?auto_22897 ?auto_22893 ) ) ( not ( = ?auto_22897 ?auto_22894 ) ) ( not ( = ?auto_22897 ?auto_22873 ) ) ( not ( = ?auto_22897 ?auto_22887 ) ) ( not ( = ?auto_22897 ?auto_22869 ) ) ( not ( = ?auto_22897 ?auto_22885 ) ) ( not ( = ?auto_22897 ?auto_22867 ) ) ( not ( = ?auto_22897 ?auto_22881 ) ) ( not ( = ?auto_22883 ?auto_22886 ) ) ( not ( = ?auto_22883 ?auto_22866 ) ) ( not ( = ?auto_22883 ?auto_22888 ) ) ( not ( = ?auto_22883 ?auto_22895 ) ) ( not ( = ?auto_22883 ?auto_22878 ) ) ( not ( = ?auto_22883 ?auto_22892 ) ) ( not ( = ?auto_22883 ?auto_22884 ) ) ( not ( = ?auto_22883 ?auto_22875 ) ) ( not ( = ?auto_22883 ?auto_22879 ) ) ( not ( = ?auto_22883 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22855 ) ) ( not ( = ?auto_22843 ?auto_22871 ) ) ( not ( = ?auto_22844 ?auto_22855 ) ) ( not ( = ?auto_22844 ?auto_22871 ) ) ( not ( = ?auto_22845 ?auto_22855 ) ) ( not ( = ?auto_22845 ?auto_22871 ) ) ( not ( = ?auto_22846 ?auto_22855 ) ) ( not ( = ?auto_22846 ?auto_22871 ) ) ( not ( = ?auto_22847 ?auto_22855 ) ) ( not ( = ?auto_22847 ?auto_22871 ) ) ( not ( = ?auto_22848 ?auto_22855 ) ) ( not ( = ?auto_22848 ?auto_22871 ) ) ( not ( = ?auto_22851 ?auto_22855 ) ) ( not ( = ?auto_22851 ?auto_22871 ) ) ( not ( = ?auto_22850 ?auto_22855 ) ) ( not ( = ?auto_22850 ?auto_22871 ) ) ( not ( = ?auto_22849 ?auto_22855 ) ) ( not ( = ?auto_22849 ?auto_22871 ) ) ( not ( = ?auto_22852 ?auto_22855 ) ) ( not ( = ?auto_22852 ?auto_22871 ) ) ( not ( = ?auto_22854 ?auto_22855 ) ) ( not ( = ?auto_22854 ?auto_22871 ) ) ( not ( = ?auto_22855 ?auto_22883 ) ) ( not ( = ?auto_22855 ?auto_22886 ) ) ( not ( = ?auto_22855 ?auto_22866 ) ) ( not ( = ?auto_22855 ?auto_22888 ) ) ( not ( = ?auto_22855 ?auto_22895 ) ) ( not ( = ?auto_22855 ?auto_22878 ) ) ( not ( = ?auto_22855 ?auto_22892 ) ) ( not ( = ?auto_22855 ?auto_22884 ) ) ( not ( = ?auto_22855 ?auto_22875 ) ) ( not ( = ?auto_22855 ?auto_22879 ) ) ( not ( = ?auto_22855 ?auto_22890 ) ) ( not ( = ?auto_22871 ?auto_22883 ) ) ( not ( = ?auto_22871 ?auto_22886 ) ) ( not ( = ?auto_22871 ?auto_22866 ) ) ( not ( = ?auto_22871 ?auto_22888 ) ) ( not ( = ?auto_22871 ?auto_22895 ) ) ( not ( = ?auto_22871 ?auto_22878 ) ) ( not ( = ?auto_22871 ?auto_22892 ) ) ( not ( = ?auto_22871 ?auto_22884 ) ) ( not ( = ?auto_22871 ?auto_22875 ) ) ( not ( = ?auto_22871 ?auto_22879 ) ) ( not ( = ?auto_22871 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22857 ) ) ( not ( = ?auto_22843 ?auto_22872 ) ) ( not ( = ?auto_22844 ?auto_22857 ) ) ( not ( = ?auto_22844 ?auto_22872 ) ) ( not ( = ?auto_22845 ?auto_22857 ) ) ( not ( = ?auto_22845 ?auto_22872 ) ) ( not ( = ?auto_22846 ?auto_22857 ) ) ( not ( = ?auto_22846 ?auto_22872 ) ) ( not ( = ?auto_22847 ?auto_22857 ) ) ( not ( = ?auto_22847 ?auto_22872 ) ) ( not ( = ?auto_22848 ?auto_22857 ) ) ( not ( = ?auto_22848 ?auto_22872 ) ) ( not ( = ?auto_22851 ?auto_22857 ) ) ( not ( = ?auto_22851 ?auto_22872 ) ) ( not ( = ?auto_22850 ?auto_22857 ) ) ( not ( = ?auto_22850 ?auto_22872 ) ) ( not ( = ?auto_22849 ?auto_22857 ) ) ( not ( = ?auto_22849 ?auto_22872 ) ) ( not ( = ?auto_22852 ?auto_22857 ) ) ( not ( = ?auto_22852 ?auto_22872 ) ) ( not ( = ?auto_22854 ?auto_22857 ) ) ( not ( = ?auto_22854 ?auto_22872 ) ) ( not ( = ?auto_22853 ?auto_22857 ) ) ( not ( = ?auto_22853 ?auto_22872 ) ) ( not ( = ?auto_22857 ?auto_22871 ) ) ( not ( = ?auto_22857 ?auto_22883 ) ) ( not ( = ?auto_22857 ?auto_22886 ) ) ( not ( = ?auto_22857 ?auto_22866 ) ) ( not ( = ?auto_22857 ?auto_22888 ) ) ( not ( = ?auto_22857 ?auto_22895 ) ) ( not ( = ?auto_22857 ?auto_22878 ) ) ( not ( = ?auto_22857 ?auto_22892 ) ) ( not ( = ?auto_22857 ?auto_22884 ) ) ( not ( = ?auto_22857 ?auto_22875 ) ) ( not ( = ?auto_22857 ?auto_22879 ) ) ( not ( = ?auto_22857 ?auto_22890 ) ) ( not ( = ?auto_22889 ?auto_22877 ) ) ( not ( = ?auto_22889 ?auto_22874 ) ) ( not ( = ?auto_22889 ?auto_22865 ) ) ( not ( = ?auto_22889 ?auto_22898 ) ) ( not ( = ?auto_22889 ?auto_22880 ) ) ( not ( = ?auto_22889 ?auto_22896 ) ) ( not ( = ?auto_22889 ?auto_22876 ) ) ( not ( = ?auto_22889 ?auto_22868 ) ) ( not ( = ?auto_22889 ?auto_22882 ) ) ( not ( = ?auto_22891 ?auto_22867 ) ) ( not ( = ?auto_22891 ?auto_22897 ) ) ( not ( = ?auto_22891 ?auto_22893 ) ) ( not ( = ?auto_22891 ?auto_22894 ) ) ( not ( = ?auto_22891 ?auto_22873 ) ) ( not ( = ?auto_22891 ?auto_22887 ) ) ( not ( = ?auto_22891 ?auto_22869 ) ) ( not ( = ?auto_22891 ?auto_22885 ) ) ( not ( = ?auto_22891 ?auto_22881 ) ) ( not ( = ?auto_22872 ?auto_22871 ) ) ( not ( = ?auto_22872 ?auto_22883 ) ) ( not ( = ?auto_22872 ?auto_22886 ) ) ( not ( = ?auto_22872 ?auto_22866 ) ) ( not ( = ?auto_22872 ?auto_22888 ) ) ( not ( = ?auto_22872 ?auto_22895 ) ) ( not ( = ?auto_22872 ?auto_22878 ) ) ( not ( = ?auto_22872 ?auto_22892 ) ) ( not ( = ?auto_22872 ?auto_22884 ) ) ( not ( = ?auto_22872 ?auto_22875 ) ) ( not ( = ?auto_22872 ?auto_22879 ) ) ( not ( = ?auto_22872 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22856 ) ) ( not ( = ?auto_22843 ?auto_22870 ) ) ( not ( = ?auto_22844 ?auto_22856 ) ) ( not ( = ?auto_22844 ?auto_22870 ) ) ( not ( = ?auto_22845 ?auto_22856 ) ) ( not ( = ?auto_22845 ?auto_22870 ) ) ( not ( = ?auto_22846 ?auto_22856 ) ) ( not ( = ?auto_22846 ?auto_22870 ) ) ( not ( = ?auto_22847 ?auto_22856 ) ) ( not ( = ?auto_22847 ?auto_22870 ) ) ( not ( = ?auto_22848 ?auto_22856 ) ) ( not ( = ?auto_22848 ?auto_22870 ) ) ( not ( = ?auto_22851 ?auto_22856 ) ) ( not ( = ?auto_22851 ?auto_22870 ) ) ( not ( = ?auto_22850 ?auto_22856 ) ) ( not ( = ?auto_22850 ?auto_22870 ) ) ( not ( = ?auto_22849 ?auto_22856 ) ) ( not ( = ?auto_22849 ?auto_22870 ) ) ( not ( = ?auto_22852 ?auto_22856 ) ) ( not ( = ?auto_22852 ?auto_22870 ) ) ( not ( = ?auto_22854 ?auto_22856 ) ) ( not ( = ?auto_22854 ?auto_22870 ) ) ( not ( = ?auto_22853 ?auto_22856 ) ) ( not ( = ?auto_22853 ?auto_22870 ) ) ( not ( = ?auto_22855 ?auto_22856 ) ) ( not ( = ?auto_22855 ?auto_22870 ) ) ( not ( = ?auto_22856 ?auto_22872 ) ) ( not ( = ?auto_22856 ?auto_22871 ) ) ( not ( = ?auto_22856 ?auto_22883 ) ) ( not ( = ?auto_22856 ?auto_22886 ) ) ( not ( = ?auto_22856 ?auto_22866 ) ) ( not ( = ?auto_22856 ?auto_22888 ) ) ( not ( = ?auto_22856 ?auto_22895 ) ) ( not ( = ?auto_22856 ?auto_22878 ) ) ( not ( = ?auto_22856 ?auto_22892 ) ) ( not ( = ?auto_22856 ?auto_22884 ) ) ( not ( = ?auto_22856 ?auto_22875 ) ) ( not ( = ?auto_22856 ?auto_22879 ) ) ( not ( = ?auto_22856 ?auto_22890 ) ) ( not ( = ?auto_22860 ?auto_22889 ) ) ( not ( = ?auto_22860 ?auto_22877 ) ) ( not ( = ?auto_22860 ?auto_22874 ) ) ( not ( = ?auto_22860 ?auto_22865 ) ) ( not ( = ?auto_22860 ?auto_22898 ) ) ( not ( = ?auto_22860 ?auto_22880 ) ) ( not ( = ?auto_22860 ?auto_22896 ) ) ( not ( = ?auto_22860 ?auto_22876 ) ) ( not ( = ?auto_22860 ?auto_22868 ) ) ( not ( = ?auto_22860 ?auto_22882 ) ) ( not ( = ?auto_22864 ?auto_22891 ) ) ( not ( = ?auto_22864 ?auto_22867 ) ) ( not ( = ?auto_22864 ?auto_22897 ) ) ( not ( = ?auto_22864 ?auto_22893 ) ) ( not ( = ?auto_22864 ?auto_22894 ) ) ( not ( = ?auto_22864 ?auto_22873 ) ) ( not ( = ?auto_22864 ?auto_22887 ) ) ( not ( = ?auto_22864 ?auto_22869 ) ) ( not ( = ?auto_22864 ?auto_22885 ) ) ( not ( = ?auto_22864 ?auto_22881 ) ) ( not ( = ?auto_22870 ?auto_22872 ) ) ( not ( = ?auto_22870 ?auto_22871 ) ) ( not ( = ?auto_22870 ?auto_22883 ) ) ( not ( = ?auto_22870 ?auto_22886 ) ) ( not ( = ?auto_22870 ?auto_22866 ) ) ( not ( = ?auto_22870 ?auto_22888 ) ) ( not ( = ?auto_22870 ?auto_22895 ) ) ( not ( = ?auto_22870 ?auto_22878 ) ) ( not ( = ?auto_22870 ?auto_22892 ) ) ( not ( = ?auto_22870 ?auto_22884 ) ) ( not ( = ?auto_22870 ?auto_22875 ) ) ( not ( = ?auto_22870 ?auto_22879 ) ) ( not ( = ?auto_22870 ?auto_22890 ) ) ( not ( = ?auto_22843 ?auto_22858 ) ) ( not ( = ?auto_22843 ?auto_22861 ) ) ( not ( = ?auto_22844 ?auto_22858 ) ) ( not ( = ?auto_22844 ?auto_22861 ) ) ( not ( = ?auto_22845 ?auto_22858 ) ) ( not ( = ?auto_22845 ?auto_22861 ) ) ( not ( = ?auto_22846 ?auto_22858 ) ) ( not ( = ?auto_22846 ?auto_22861 ) ) ( not ( = ?auto_22847 ?auto_22858 ) ) ( not ( = ?auto_22847 ?auto_22861 ) ) ( not ( = ?auto_22848 ?auto_22858 ) ) ( not ( = ?auto_22848 ?auto_22861 ) ) ( not ( = ?auto_22851 ?auto_22858 ) ) ( not ( = ?auto_22851 ?auto_22861 ) ) ( not ( = ?auto_22850 ?auto_22858 ) ) ( not ( = ?auto_22850 ?auto_22861 ) ) ( not ( = ?auto_22849 ?auto_22858 ) ) ( not ( = ?auto_22849 ?auto_22861 ) ) ( not ( = ?auto_22852 ?auto_22858 ) ) ( not ( = ?auto_22852 ?auto_22861 ) ) ( not ( = ?auto_22854 ?auto_22858 ) ) ( not ( = ?auto_22854 ?auto_22861 ) ) ( not ( = ?auto_22853 ?auto_22858 ) ) ( not ( = ?auto_22853 ?auto_22861 ) ) ( not ( = ?auto_22855 ?auto_22858 ) ) ( not ( = ?auto_22855 ?auto_22861 ) ) ( not ( = ?auto_22857 ?auto_22858 ) ) ( not ( = ?auto_22857 ?auto_22861 ) ) ( not ( = ?auto_22858 ?auto_22870 ) ) ( not ( = ?auto_22858 ?auto_22872 ) ) ( not ( = ?auto_22858 ?auto_22871 ) ) ( not ( = ?auto_22858 ?auto_22883 ) ) ( not ( = ?auto_22858 ?auto_22886 ) ) ( not ( = ?auto_22858 ?auto_22866 ) ) ( not ( = ?auto_22858 ?auto_22888 ) ) ( not ( = ?auto_22858 ?auto_22895 ) ) ( not ( = ?auto_22858 ?auto_22878 ) ) ( not ( = ?auto_22858 ?auto_22892 ) ) ( not ( = ?auto_22858 ?auto_22884 ) ) ( not ( = ?auto_22858 ?auto_22875 ) ) ( not ( = ?auto_22858 ?auto_22879 ) ) ( not ( = ?auto_22858 ?auto_22890 ) ) ( not ( = ?auto_22861 ?auto_22870 ) ) ( not ( = ?auto_22861 ?auto_22872 ) ) ( not ( = ?auto_22861 ?auto_22871 ) ) ( not ( = ?auto_22861 ?auto_22883 ) ) ( not ( = ?auto_22861 ?auto_22886 ) ) ( not ( = ?auto_22861 ?auto_22866 ) ) ( not ( = ?auto_22861 ?auto_22888 ) ) ( not ( = ?auto_22861 ?auto_22895 ) ) ( not ( = ?auto_22861 ?auto_22878 ) ) ( not ( = ?auto_22861 ?auto_22892 ) ) ( not ( = ?auto_22861 ?auto_22884 ) ) ( not ( = ?auto_22861 ?auto_22875 ) ) ( not ( = ?auto_22861 ?auto_22879 ) ) ( not ( = ?auto_22861 ?auto_22890 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_22843 ?auto_22844 ?auto_22845 ?auto_22846 ?auto_22847 ?auto_22848 ?auto_22851 ?auto_22850 ?auto_22849 ?auto_22852 ?auto_22854 ?auto_22853 ?auto_22855 ?auto_22857 ?auto_22856 )
      ( MAKE-1CRATE ?auto_22856 ?auto_22858 )
      ( MAKE-15CRATE-VERIFY ?auto_22843 ?auto_22844 ?auto_22845 ?auto_22846 ?auto_22847 ?auto_22848 ?auto_22851 ?auto_22850 ?auto_22849 ?auto_22852 ?auto_22854 ?auto_22853 ?auto_22855 ?auto_22857 ?auto_22856 ?auto_22858 ) )
  )

)

