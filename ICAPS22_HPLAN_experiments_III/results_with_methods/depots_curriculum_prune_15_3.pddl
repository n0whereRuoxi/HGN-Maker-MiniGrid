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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22145 - SURFACE
      ?auto_22146 - SURFACE
      ?auto_22147 - SURFACE
    )
    :vars
    (
      ?auto_22150 - HOIST
      ?auto_22152 - PLACE
      ?auto_22149 - PLACE
      ?auto_22148 - HOIST
      ?auto_22153 - SURFACE
      ?auto_22156 - PLACE
      ?auto_22154 - HOIST
      ?auto_22155 - SURFACE
      ?auto_22151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22150 ?auto_22152 ) ( IS-CRATE ?auto_22147 ) ( not ( = ?auto_22149 ?auto_22152 ) ) ( HOIST-AT ?auto_22148 ?auto_22149 ) ( AVAILABLE ?auto_22148 ) ( SURFACE-AT ?auto_22147 ?auto_22149 ) ( ON ?auto_22147 ?auto_22153 ) ( CLEAR ?auto_22147 ) ( not ( = ?auto_22146 ?auto_22147 ) ) ( not ( = ?auto_22146 ?auto_22153 ) ) ( not ( = ?auto_22147 ?auto_22153 ) ) ( not ( = ?auto_22150 ?auto_22148 ) ) ( SURFACE-AT ?auto_22145 ?auto_22152 ) ( CLEAR ?auto_22145 ) ( IS-CRATE ?auto_22146 ) ( AVAILABLE ?auto_22150 ) ( not ( = ?auto_22156 ?auto_22152 ) ) ( HOIST-AT ?auto_22154 ?auto_22156 ) ( AVAILABLE ?auto_22154 ) ( SURFACE-AT ?auto_22146 ?auto_22156 ) ( ON ?auto_22146 ?auto_22155 ) ( CLEAR ?auto_22146 ) ( TRUCK-AT ?auto_22151 ?auto_22152 ) ( not ( = ?auto_22145 ?auto_22146 ) ) ( not ( = ?auto_22145 ?auto_22155 ) ) ( not ( = ?auto_22146 ?auto_22155 ) ) ( not ( = ?auto_22150 ?auto_22154 ) ) ( not ( = ?auto_22145 ?auto_22147 ) ) ( not ( = ?auto_22145 ?auto_22153 ) ) ( not ( = ?auto_22147 ?auto_22155 ) ) ( not ( = ?auto_22149 ?auto_22156 ) ) ( not ( = ?auto_22148 ?auto_22154 ) ) ( not ( = ?auto_22153 ?auto_22155 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22145 ?auto_22146 )
      ( MAKE-1CRATE ?auto_22146 ?auto_22147 )
      ( MAKE-2CRATE-VERIFY ?auto_22145 ?auto_22146 ?auto_22147 ) )
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
      ?auto_22180 - HOIST
      ?auto_22178 - PLACE
      ?auto_22179 - PLACE
      ?auto_22177 - HOIST
      ?auto_22175 - SURFACE
      ?auto_22184 - PLACE
      ?auto_22186 - HOIST
      ?auto_22183 - SURFACE
      ?auto_22182 - PLACE
      ?auto_22185 - HOIST
      ?auto_22181 - SURFACE
      ?auto_22176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22180 ?auto_22178 ) ( IS-CRATE ?auto_22174 ) ( not ( = ?auto_22179 ?auto_22178 ) ) ( HOIST-AT ?auto_22177 ?auto_22179 ) ( AVAILABLE ?auto_22177 ) ( SURFACE-AT ?auto_22174 ?auto_22179 ) ( ON ?auto_22174 ?auto_22175 ) ( CLEAR ?auto_22174 ) ( not ( = ?auto_22173 ?auto_22174 ) ) ( not ( = ?auto_22173 ?auto_22175 ) ) ( not ( = ?auto_22174 ?auto_22175 ) ) ( not ( = ?auto_22180 ?auto_22177 ) ) ( IS-CRATE ?auto_22173 ) ( not ( = ?auto_22184 ?auto_22178 ) ) ( HOIST-AT ?auto_22186 ?auto_22184 ) ( AVAILABLE ?auto_22186 ) ( SURFACE-AT ?auto_22173 ?auto_22184 ) ( ON ?auto_22173 ?auto_22183 ) ( CLEAR ?auto_22173 ) ( not ( = ?auto_22172 ?auto_22173 ) ) ( not ( = ?auto_22172 ?auto_22183 ) ) ( not ( = ?auto_22173 ?auto_22183 ) ) ( not ( = ?auto_22180 ?auto_22186 ) ) ( SURFACE-AT ?auto_22171 ?auto_22178 ) ( CLEAR ?auto_22171 ) ( IS-CRATE ?auto_22172 ) ( AVAILABLE ?auto_22180 ) ( not ( = ?auto_22182 ?auto_22178 ) ) ( HOIST-AT ?auto_22185 ?auto_22182 ) ( AVAILABLE ?auto_22185 ) ( SURFACE-AT ?auto_22172 ?auto_22182 ) ( ON ?auto_22172 ?auto_22181 ) ( CLEAR ?auto_22172 ) ( TRUCK-AT ?auto_22176 ?auto_22178 ) ( not ( = ?auto_22171 ?auto_22172 ) ) ( not ( = ?auto_22171 ?auto_22181 ) ) ( not ( = ?auto_22172 ?auto_22181 ) ) ( not ( = ?auto_22180 ?auto_22185 ) ) ( not ( = ?auto_22171 ?auto_22173 ) ) ( not ( = ?auto_22171 ?auto_22183 ) ) ( not ( = ?auto_22173 ?auto_22181 ) ) ( not ( = ?auto_22184 ?auto_22182 ) ) ( not ( = ?auto_22186 ?auto_22185 ) ) ( not ( = ?auto_22183 ?auto_22181 ) ) ( not ( = ?auto_22171 ?auto_22174 ) ) ( not ( = ?auto_22171 ?auto_22175 ) ) ( not ( = ?auto_22172 ?auto_22174 ) ) ( not ( = ?auto_22172 ?auto_22175 ) ) ( not ( = ?auto_22174 ?auto_22183 ) ) ( not ( = ?auto_22174 ?auto_22181 ) ) ( not ( = ?auto_22179 ?auto_22184 ) ) ( not ( = ?auto_22179 ?auto_22182 ) ) ( not ( = ?auto_22177 ?auto_22186 ) ) ( not ( = ?auto_22177 ?auto_22185 ) ) ( not ( = ?auto_22175 ?auto_22183 ) ) ( not ( = ?auto_22175 ?auto_22181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22171 ?auto_22172 ?auto_22173 )
      ( MAKE-1CRATE ?auto_22173 ?auto_22174 )
      ( MAKE-3CRATE-VERIFY ?auto_22171 ?auto_22172 ?auto_22173 ?auto_22174 ) )
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
      ?auto_22212 - HOIST
      ?auto_22207 - PLACE
      ?auto_22208 - PLACE
      ?auto_22211 - HOIST
      ?auto_22209 - SURFACE
      ?auto_22215 - PLACE
      ?auto_22214 - HOIST
      ?auto_22213 - SURFACE
      ?auto_22216 - PLACE
      ?auto_22220 - HOIST
      ?auto_22217 - SURFACE
      ?auto_22218 - PLACE
      ?auto_22219 - HOIST
      ?auto_22221 - SURFACE
      ?auto_22210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22212 ?auto_22207 ) ( IS-CRATE ?auto_22206 ) ( not ( = ?auto_22208 ?auto_22207 ) ) ( HOIST-AT ?auto_22211 ?auto_22208 ) ( AVAILABLE ?auto_22211 ) ( SURFACE-AT ?auto_22206 ?auto_22208 ) ( ON ?auto_22206 ?auto_22209 ) ( CLEAR ?auto_22206 ) ( not ( = ?auto_22205 ?auto_22206 ) ) ( not ( = ?auto_22205 ?auto_22209 ) ) ( not ( = ?auto_22206 ?auto_22209 ) ) ( not ( = ?auto_22212 ?auto_22211 ) ) ( IS-CRATE ?auto_22205 ) ( not ( = ?auto_22215 ?auto_22207 ) ) ( HOIST-AT ?auto_22214 ?auto_22215 ) ( AVAILABLE ?auto_22214 ) ( SURFACE-AT ?auto_22205 ?auto_22215 ) ( ON ?auto_22205 ?auto_22213 ) ( CLEAR ?auto_22205 ) ( not ( = ?auto_22204 ?auto_22205 ) ) ( not ( = ?auto_22204 ?auto_22213 ) ) ( not ( = ?auto_22205 ?auto_22213 ) ) ( not ( = ?auto_22212 ?auto_22214 ) ) ( IS-CRATE ?auto_22204 ) ( not ( = ?auto_22216 ?auto_22207 ) ) ( HOIST-AT ?auto_22220 ?auto_22216 ) ( AVAILABLE ?auto_22220 ) ( SURFACE-AT ?auto_22204 ?auto_22216 ) ( ON ?auto_22204 ?auto_22217 ) ( CLEAR ?auto_22204 ) ( not ( = ?auto_22203 ?auto_22204 ) ) ( not ( = ?auto_22203 ?auto_22217 ) ) ( not ( = ?auto_22204 ?auto_22217 ) ) ( not ( = ?auto_22212 ?auto_22220 ) ) ( SURFACE-AT ?auto_22202 ?auto_22207 ) ( CLEAR ?auto_22202 ) ( IS-CRATE ?auto_22203 ) ( AVAILABLE ?auto_22212 ) ( not ( = ?auto_22218 ?auto_22207 ) ) ( HOIST-AT ?auto_22219 ?auto_22218 ) ( AVAILABLE ?auto_22219 ) ( SURFACE-AT ?auto_22203 ?auto_22218 ) ( ON ?auto_22203 ?auto_22221 ) ( CLEAR ?auto_22203 ) ( TRUCK-AT ?auto_22210 ?auto_22207 ) ( not ( = ?auto_22202 ?auto_22203 ) ) ( not ( = ?auto_22202 ?auto_22221 ) ) ( not ( = ?auto_22203 ?auto_22221 ) ) ( not ( = ?auto_22212 ?auto_22219 ) ) ( not ( = ?auto_22202 ?auto_22204 ) ) ( not ( = ?auto_22202 ?auto_22217 ) ) ( not ( = ?auto_22204 ?auto_22221 ) ) ( not ( = ?auto_22216 ?auto_22218 ) ) ( not ( = ?auto_22220 ?auto_22219 ) ) ( not ( = ?auto_22217 ?auto_22221 ) ) ( not ( = ?auto_22202 ?auto_22205 ) ) ( not ( = ?auto_22202 ?auto_22213 ) ) ( not ( = ?auto_22203 ?auto_22205 ) ) ( not ( = ?auto_22203 ?auto_22213 ) ) ( not ( = ?auto_22205 ?auto_22217 ) ) ( not ( = ?auto_22205 ?auto_22221 ) ) ( not ( = ?auto_22215 ?auto_22216 ) ) ( not ( = ?auto_22215 ?auto_22218 ) ) ( not ( = ?auto_22214 ?auto_22220 ) ) ( not ( = ?auto_22214 ?auto_22219 ) ) ( not ( = ?auto_22213 ?auto_22217 ) ) ( not ( = ?auto_22213 ?auto_22221 ) ) ( not ( = ?auto_22202 ?auto_22206 ) ) ( not ( = ?auto_22202 ?auto_22209 ) ) ( not ( = ?auto_22203 ?auto_22206 ) ) ( not ( = ?auto_22203 ?auto_22209 ) ) ( not ( = ?auto_22204 ?auto_22206 ) ) ( not ( = ?auto_22204 ?auto_22209 ) ) ( not ( = ?auto_22206 ?auto_22213 ) ) ( not ( = ?auto_22206 ?auto_22217 ) ) ( not ( = ?auto_22206 ?auto_22221 ) ) ( not ( = ?auto_22208 ?auto_22215 ) ) ( not ( = ?auto_22208 ?auto_22216 ) ) ( not ( = ?auto_22208 ?auto_22218 ) ) ( not ( = ?auto_22211 ?auto_22214 ) ) ( not ( = ?auto_22211 ?auto_22220 ) ) ( not ( = ?auto_22211 ?auto_22219 ) ) ( not ( = ?auto_22209 ?auto_22213 ) ) ( not ( = ?auto_22209 ?auto_22217 ) ) ( not ( = ?auto_22209 ?auto_22221 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_22202 ?auto_22203 ?auto_22204 ?auto_22205 )
      ( MAKE-1CRATE ?auto_22205 ?auto_22206 )
      ( MAKE-4CRATE-VERIFY ?auto_22202 ?auto_22203 ?auto_22204 ?auto_22205 ?auto_22206 ) )
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
      ?auto_22249 - HOIST
      ?auto_22245 - PLACE
      ?auto_22244 - PLACE
      ?auto_22247 - HOIST
      ?auto_22248 - SURFACE
      ?auto_22259 - PLACE
      ?auto_22258 - HOIST
      ?auto_22257 - SURFACE
      ?auto_22251 - PLACE
      ?auto_22256 - HOIST
      ?auto_22261 - SURFACE
      ?auto_22250 - PLACE
      ?auto_22260 - HOIST
      ?auto_22254 - SURFACE
      ?auto_22255 - PLACE
      ?auto_22253 - HOIST
      ?auto_22252 - SURFACE
      ?auto_22246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22249 ?auto_22245 ) ( IS-CRATE ?auto_22243 ) ( not ( = ?auto_22244 ?auto_22245 ) ) ( HOIST-AT ?auto_22247 ?auto_22244 ) ( AVAILABLE ?auto_22247 ) ( SURFACE-AT ?auto_22243 ?auto_22244 ) ( ON ?auto_22243 ?auto_22248 ) ( CLEAR ?auto_22243 ) ( not ( = ?auto_22242 ?auto_22243 ) ) ( not ( = ?auto_22242 ?auto_22248 ) ) ( not ( = ?auto_22243 ?auto_22248 ) ) ( not ( = ?auto_22249 ?auto_22247 ) ) ( IS-CRATE ?auto_22242 ) ( not ( = ?auto_22259 ?auto_22245 ) ) ( HOIST-AT ?auto_22258 ?auto_22259 ) ( AVAILABLE ?auto_22258 ) ( SURFACE-AT ?auto_22242 ?auto_22259 ) ( ON ?auto_22242 ?auto_22257 ) ( CLEAR ?auto_22242 ) ( not ( = ?auto_22241 ?auto_22242 ) ) ( not ( = ?auto_22241 ?auto_22257 ) ) ( not ( = ?auto_22242 ?auto_22257 ) ) ( not ( = ?auto_22249 ?auto_22258 ) ) ( IS-CRATE ?auto_22241 ) ( not ( = ?auto_22251 ?auto_22245 ) ) ( HOIST-AT ?auto_22256 ?auto_22251 ) ( AVAILABLE ?auto_22256 ) ( SURFACE-AT ?auto_22241 ?auto_22251 ) ( ON ?auto_22241 ?auto_22261 ) ( CLEAR ?auto_22241 ) ( not ( = ?auto_22240 ?auto_22241 ) ) ( not ( = ?auto_22240 ?auto_22261 ) ) ( not ( = ?auto_22241 ?auto_22261 ) ) ( not ( = ?auto_22249 ?auto_22256 ) ) ( IS-CRATE ?auto_22240 ) ( not ( = ?auto_22250 ?auto_22245 ) ) ( HOIST-AT ?auto_22260 ?auto_22250 ) ( AVAILABLE ?auto_22260 ) ( SURFACE-AT ?auto_22240 ?auto_22250 ) ( ON ?auto_22240 ?auto_22254 ) ( CLEAR ?auto_22240 ) ( not ( = ?auto_22239 ?auto_22240 ) ) ( not ( = ?auto_22239 ?auto_22254 ) ) ( not ( = ?auto_22240 ?auto_22254 ) ) ( not ( = ?auto_22249 ?auto_22260 ) ) ( SURFACE-AT ?auto_22238 ?auto_22245 ) ( CLEAR ?auto_22238 ) ( IS-CRATE ?auto_22239 ) ( AVAILABLE ?auto_22249 ) ( not ( = ?auto_22255 ?auto_22245 ) ) ( HOIST-AT ?auto_22253 ?auto_22255 ) ( AVAILABLE ?auto_22253 ) ( SURFACE-AT ?auto_22239 ?auto_22255 ) ( ON ?auto_22239 ?auto_22252 ) ( CLEAR ?auto_22239 ) ( TRUCK-AT ?auto_22246 ?auto_22245 ) ( not ( = ?auto_22238 ?auto_22239 ) ) ( not ( = ?auto_22238 ?auto_22252 ) ) ( not ( = ?auto_22239 ?auto_22252 ) ) ( not ( = ?auto_22249 ?auto_22253 ) ) ( not ( = ?auto_22238 ?auto_22240 ) ) ( not ( = ?auto_22238 ?auto_22254 ) ) ( not ( = ?auto_22240 ?auto_22252 ) ) ( not ( = ?auto_22250 ?auto_22255 ) ) ( not ( = ?auto_22260 ?auto_22253 ) ) ( not ( = ?auto_22254 ?auto_22252 ) ) ( not ( = ?auto_22238 ?auto_22241 ) ) ( not ( = ?auto_22238 ?auto_22261 ) ) ( not ( = ?auto_22239 ?auto_22241 ) ) ( not ( = ?auto_22239 ?auto_22261 ) ) ( not ( = ?auto_22241 ?auto_22254 ) ) ( not ( = ?auto_22241 ?auto_22252 ) ) ( not ( = ?auto_22251 ?auto_22250 ) ) ( not ( = ?auto_22251 ?auto_22255 ) ) ( not ( = ?auto_22256 ?auto_22260 ) ) ( not ( = ?auto_22256 ?auto_22253 ) ) ( not ( = ?auto_22261 ?auto_22254 ) ) ( not ( = ?auto_22261 ?auto_22252 ) ) ( not ( = ?auto_22238 ?auto_22242 ) ) ( not ( = ?auto_22238 ?auto_22257 ) ) ( not ( = ?auto_22239 ?auto_22242 ) ) ( not ( = ?auto_22239 ?auto_22257 ) ) ( not ( = ?auto_22240 ?auto_22242 ) ) ( not ( = ?auto_22240 ?auto_22257 ) ) ( not ( = ?auto_22242 ?auto_22261 ) ) ( not ( = ?auto_22242 ?auto_22254 ) ) ( not ( = ?auto_22242 ?auto_22252 ) ) ( not ( = ?auto_22259 ?auto_22251 ) ) ( not ( = ?auto_22259 ?auto_22250 ) ) ( not ( = ?auto_22259 ?auto_22255 ) ) ( not ( = ?auto_22258 ?auto_22256 ) ) ( not ( = ?auto_22258 ?auto_22260 ) ) ( not ( = ?auto_22258 ?auto_22253 ) ) ( not ( = ?auto_22257 ?auto_22261 ) ) ( not ( = ?auto_22257 ?auto_22254 ) ) ( not ( = ?auto_22257 ?auto_22252 ) ) ( not ( = ?auto_22238 ?auto_22243 ) ) ( not ( = ?auto_22238 ?auto_22248 ) ) ( not ( = ?auto_22239 ?auto_22243 ) ) ( not ( = ?auto_22239 ?auto_22248 ) ) ( not ( = ?auto_22240 ?auto_22243 ) ) ( not ( = ?auto_22240 ?auto_22248 ) ) ( not ( = ?auto_22241 ?auto_22243 ) ) ( not ( = ?auto_22241 ?auto_22248 ) ) ( not ( = ?auto_22243 ?auto_22257 ) ) ( not ( = ?auto_22243 ?auto_22261 ) ) ( not ( = ?auto_22243 ?auto_22254 ) ) ( not ( = ?auto_22243 ?auto_22252 ) ) ( not ( = ?auto_22244 ?auto_22259 ) ) ( not ( = ?auto_22244 ?auto_22251 ) ) ( not ( = ?auto_22244 ?auto_22250 ) ) ( not ( = ?auto_22244 ?auto_22255 ) ) ( not ( = ?auto_22247 ?auto_22258 ) ) ( not ( = ?auto_22247 ?auto_22256 ) ) ( not ( = ?auto_22247 ?auto_22260 ) ) ( not ( = ?auto_22247 ?auto_22253 ) ) ( not ( = ?auto_22248 ?auto_22257 ) ) ( not ( = ?auto_22248 ?auto_22261 ) ) ( not ( = ?auto_22248 ?auto_22254 ) ) ( not ( = ?auto_22248 ?auto_22252 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_22238 ?auto_22239 ?auto_22240 ?auto_22241 ?auto_22242 )
      ( MAKE-1CRATE ?auto_22242 ?auto_22243 )
      ( MAKE-5CRATE-VERIFY ?auto_22238 ?auto_22239 ?auto_22240 ?auto_22241 ?auto_22242 ?auto_22243 ) )
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
      ?auto_22288 - PLACE
      ?auto_22286 - HOIST
      ?auto_22290 - SURFACE
      ?auto_22306 - PLACE
      ?auto_22305 - HOIST
      ?auto_22294 - SURFACE
      ?auto_22304 - PLACE
      ?auto_22303 - HOIST
      ?auto_22296 - SURFACE
      ?auto_22293 - PLACE
      ?auto_22297 - HOIST
      ?auto_22295 - SURFACE
      ?auto_22302 - PLACE
      ?auto_22301 - HOIST
      ?auto_22299 - SURFACE
      ?auto_22298 - PLACE
      ?auto_22292 - HOIST
      ?auto_22300 - SURFACE
      ?auto_22289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22291 ?auto_22287 ) ( IS-CRATE ?auto_22285 ) ( not ( = ?auto_22288 ?auto_22287 ) ) ( HOIST-AT ?auto_22286 ?auto_22288 ) ( AVAILABLE ?auto_22286 ) ( SURFACE-AT ?auto_22285 ?auto_22288 ) ( ON ?auto_22285 ?auto_22290 ) ( CLEAR ?auto_22285 ) ( not ( = ?auto_22284 ?auto_22285 ) ) ( not ( = ?auto_22284 ?auto_22290 ) ) ( not ( = ?auto_22285 ?auto_22290 ) ) ( not ( = ?auto_22291 ?auto_22286 ) ) ( IS-CRATE ?auto_22284 ) ( not ( = ?auto_22306 ?auto_22287 ) ) ( HOIST-AT ?auto_22305 ?auto_22306 ) ( AVAILABLE ?auto_22305 ) ( SURFACE-AT ?auto_22284 ?auto_22306 ) ( ON ?auto_22284 ?auto_22294 ) ( CLEAR ?auto_22284 ) ( not ( = ?auto_22283 ?auto_22284 ) ) ( not ( = ?auto_22283 ?auto_22294 ) ) ( not ( = ?auto_22284 ?auto_22294 ) ) ( not ( = ?auto_22291 ?auto_22305 ) ) ( IS-CRATE ?auto_22283 ) ( not ( = ?auto_22304 ?auto_22287 ) ) ( HOIST-AT ?auto_22303 ?auto_22304 ) ( AVAILABLE ?auto_22303 ) ( SURFACE-AT ?auto_22283 ?auto_22304 ) ( ON ?auto_22283 ?auto_22296 ) ( CLEAR ?auto_22283 ) ( not ( = ?auto_22282 ?auto_22283 ) ) ( not ( = ?auto_22282 ?auto_22296 ) ) ( not ( = ?auto_22283 ?auto_22296 ) ) ( not ( = ?auto_22291 ?auto_22303 ) ) ( IS-CRATE ?auto_22282 ) ( not ( = ?auto_22293 ?auto_22287 ) ) ( HOIST-AT ?auto_22297 ?auto_22293 ) ( AVAILABLE ?auto_22297 ) ( SURFACE-AT ?auto_22282 ?auto_22293 ) ( ON ?auto_22282 ?auto_22295 ) ( CLEAR ?auto_22282 ) ( not ( = ?auto_22281 ?auto_22282 ) ) ( not ( = ?auto_22281 ?auto_22295 ) ) ( not ( = ?auto_22282 ?auto_22295 ) ) ( not ( = ?auto_22291 ?auto_22297 ) ) ( IS-CRATE ?auto_22281 ) ( not ( = ?auto_22302 ?auto_22287 ) ) ( HOIST-AT ?auto_22301 ?auto_22302 ) ( AVAILABLE ?auto_22301 ) ( SURFACE-AT ?auto_22281 ?auto_22302 ) ( ON ?auto_22281 ?auto_22299 ) ( CLEAR ?auto_22281 ) ( not ( = ?auto_22280 ?auto_22281 ) ) ( not ( = ?auto_22280 ?auto_22299 ) ) ( not ( = ?auto_22281 ?auto_22299 ) ) ( not ( = ?auto_22291 ?auto_22301 ) ) ( SURFACE-AT ?auto_22279 ?auto_22287 ) ( CLEAR ?auto_22279 ) ( IS-CRATE ?auto_22280 ) ( AVAILABLE ?auto_22291 ) ( not ( = ?auto_22298 ?auto_22287 ) ) ( HOIST-AT ?auto_22292 ?auto_22298 ) ( AVAILABLE ?auto_22292 ) ( SURFACE-AT ?auto_22280 ?auto_22298 ) ( ON ?auto_22280 ?auto_22300 ) ( CLEAR ?auto_22280 ) ( TRUCK-AT ?auto_22289 ?auto_22287 ) ( not ( = ?auto_22279 ?auto_22280 ) ) ( not ( = ?auto_22279 ?auto_22300 ) ) ( not ( = ?auto_22280 ?auto_22300 ) ) ( not ( = ?auto_22291 ?auto_22292 ) ) ( not ( = ?auto_22279 ?auto_22281 ) ) ( not ( = ?auto_22279 ?auto_22299 ) ) ( not ( = ?auto_22281 ?auto_22300 ) ) ( not ( = ?auto_22302 ?auto_22298 ) ) ( not ( = ?auto_22301 ?auto_22292 ) ) ( not ( = ?auto_22299 ?auto_22300 ) ) ( not ( = ?auto_22279 ?auto_22282 ) ) ( not ( = ?auto_22279 ?auto_22295 ) ) ( not ( = ?auto_22280 ?auto_22282 ) ) ( not ( = ?auto_22280 ?auto_22295 ) ) ( not ( = ?auto_22282 ?auto_22299 ) ) ( not ( = ?auto_22282 ?auto_22300 ) ) ( not ( = ?auto_22293 ?auto_22302 ) ) ( not ( = ?auto_22293 ?auto_22298 ) ) ( not ( = ?auto_22297 ?auto_22301 ) ) ( not ( = ?auto_22297 ?auto_22292 ) ) ( not ( = ?auto_22295 ?auto_22299 ) ) ( not ( = ?auto_22295 ?auto_22300 ) ) ( not ( = ?auto_22279 ?auto_22283 ) ) ( not ( = ?auto_22279 ?auto_22296 ) ) ( not ( = ?auto_22280 ?auto_22283 ) ) ( not ( = ?auto_22280 ?auto_22296 ) ) ( not ( = ?auto_22281 ?auto_22283 ) ) ( not ( = ?auto_22281 ?auto_22296 ) ) ( not ( = ?auto_22283 ?auto_22295 ) ) ( not ( = ?auto_22283 ?auto_22299 ) ) ( not ( = ?auto_22283 ?auto_22300 ) ) ( not ( = ?auto_22304 ?auto_22293 ) ) ( not ( = ?auto_22304 ?auto_22302 ) ) ( not ( = ?auto_22304 ?auto_22298 ) ) ( not ( = ?auto_22303 ?auto_22297 ) ) ( not ( = ?auto_22303 ?auto_22301 ) ) ( not ( = ?auto_22303 ?auto_22292 ) ) ( not ( = ?auto_22296 ?auto_22295 ) ) ( not ( = ?auto_22296 ?auto_22299 ) ) ( not ( = ?auto_22296 ?auto_22300 ) ) ( not ( = ?auto_22279 ?auto_22284 ) ) ( not ( = ?auto_22279 ?auto_22294 ) ) ( not ( = ?auto_22280 ?auto_22284 ) ) ( not ( = ?auto_22280 ?auto_22294 ) ) ( not ( = ?auto_22281 ?auto_22284 ) ) ( not ( = ?auto_22281 ?auto_22294 ) ) ( not ( = ?auto_22282 ?auto_22284 ) ) ( not ( = ?auto_22282 ?auto_22294 ) ) ( not ( = ?auto_22284 ?auto_22296 ) ) ( not ( = ?auto_22284 ?auto_22295 ) ) ( not ( = ?auto_22284 ?auto_22299 ) ) ( not ( = ?auto_22284 ?auto_22300 ) ) ( not ( = ?auto_22306 ?auto_22304 ) ) ( not ( = ?auto_22306 ?auto_22293 ) ) ( not ( = ?auto_22306 ?auto_22302 ) ) ( not ( = ?auto_22306 ?auto_22298 ) ) ( not ( = ?auto_22305 ?auto_22303 ) ) ( not ( = ?auto_22305 ?auto_22297 ) ) ( not ( = ?auto_22305 ?auto_22301 ) ) ( not ( = ?auto_22305 ?auto_22292 ) ) ( not ( = ?auto_22294 ?auto_22296 ) ) ( not ( = ?auto_22294 ?auto_22295 ) ) ( not ( = ?auto_22294 ?auto_22299 ) ) ( not ( = ?auto_22294 ?auto_22300 ) ) ( not ( = ?auto_22279 ?auto_22285 ) ) ( not ( = ?auto_22279 ?auto_22290 ) ) ( not ( = ?auto_22280 ?auto_22285 ) ) ( not ( = ?auto_22280 ?auto_22290 ) ) ( not ( = ?auto_22281 ?auto_22285 ) ) ( not ( = ?auto_22281 ?auto_22290 ) ) ( not ( = ?auto_22282 ?auto_22285 ) ) ( not ( = ?auto_22282 ?auto_22290 ) ) ( not ( = ?auto_22283 ?auto_22285 ) ) ( not ( = ?auto_22283 ?auto_22290 ) ) ( not ( = ?auto_22285 ?auto_22294 ) ) ( not ( = ?auto_22285 ?auto_22296 ) ) ( not ( = ?auto_22285 ?auto_22295 ) ) ( not ( = ?auto_22285 ?auto_22299 ) ) ( not ( = ?auto_22285 ?auto_22300 ) ) ( not ( = ?auto_22288 ?auto_22306 ) ) ( not ( = ?auto_22288 ?auto_22304 ) ) ( not ( = ?auto_22288 ?auto_22293 ) ) ( not ( = ?auto_22288 ?auto_22302 ) ) ( not ( = ?auto_22288 ?auto_22298 ) ) ( not ( = ?auto_22286 ?auto_22305 ) ) ( not ( = ?auto_22286 ?auto_22303 ) ) ( not ( = ?auto_22286 ?auto_22297 ) ) ( not ( = ?auto_22286 ?auto_22301 ) ) ( not ( = ?auto_22286 ?auto_22292 ) ) ( not ( = ?auto_22290 ?auto_22294 ) ) ( not ( = ?auto_22290 ?auto_22296 ) ) ( not ( = ?auto_22290 ?auto_22295 ) ) ( not ( = ?auto_22290 ?auto_22299 ) ) ( not ( = ?auto_22290 ?auto_22300 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_22279 ?auto_22280 ?auto_22281 ?auto_22282 ?auto_22283 ?auto_22284 )
      ( MAKE-1CRATE ?auto_22284 ?auto_22285 )
      ( MAKE-6CRATE-VERIFY ?auto_22279 ?auto_22280 ?auto_22281 ?auto_22282 ?auto_22283 ?auto_22284 ?auto_22285 ) )
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
      ?auto_22331 - SURFACE
      ?auto_22332 - SURFACE
    )
    :vars
    (
      ?auto_22335 - HOIST
      ?auto_22334 - PLACE
      ?auto_22333 - PLACE
      ?auto_22338 - HOIST
      ?auto_22337 - SURFACE
      ?auto_22341 - PLACE
      ?auto_22350 - HOIST
      ?auto_22340 - SURFACE
      ?auto_22345 - PLACE
      ?auto_22354 - HOIST
      ?auto_22344 - SURFACE
      ?auto_22353 - PLACE
      ?auto_22352 - HOIST
      ?auto_22349 - SURFACE
      ?auto_22339 - PLACE
      ?auto_22342 - HOIST
      ?auto_22343 - SURFACE
      ?auto_22348 - PLACE
      ?auto_22351 - HOIST
      ?auto_22355 - SURFACE
      ?auto_22356 - PLACE
      ?auto_22346 - HOIST
      ?auto_22347 - SURFACE
      ?auto_22336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22335 ?auto_22334 ) ( IS-CRATE ?auto_22332 ) ( not ( = ?auto_22333 ?auto_22334 ) ) ( HOIST-AT ?auto_22338 ?auto_22333 ) ( AVAILABLE ?auto_22338 ) ( SURFACE-AT ?auto_22332 ?auto_22333 ) ( ON ?auto_22332 ?auto_22337 ) ( CLEAR ?auto_22332 ) ( not ( = ?auto_22331 ?auto_22332 ) ) ( not ( = ?auto_22331 ?auto_22337 ) ) ( not ( = ?auto_22332 ?auto_22337 ) ) ( not ( = ?auto_22335 ?auto_22338 ) ) ( IS-CRATE ?auto_22331 ) ( not ( = ?auto_22341 ?auto_22334 ) ) ( HOIST-AT ?auto_22350 ?auto_22341 ) ( AVAILABLE ?auto_22350 ) ( SURFACE-AT ?auto_22331 ?auto_22341 ) ( ON ?auto_22331 ?auto_22340 ) ( CLEAR ?auto_22331 ) ( not ( = ?auto_22330 ?auto_22331 ) ) ( not ( = ?auto_22330 ?auto_22340 ) ) ( not ( = ?auto_22331 ?auto_22340 ) ) ( not ( = ?auto_22335 ?auto_22350 ) ) ( IS-CRATE ?auto_22330 ) ( not ( = ?auto_22345 ?auto_22334 ) ) ( HOIST-AT ?auto_22354 ?auto_22345 ) ( AVAILABLE ?auto_22354 ) ( SURFACE-AT ?auto_22330 ?auto_22345 ) ( ON ?auto_22330 ?auto_22344 ) ( CLEAR ?auto_22330 ) ( not ( = ?auto_22329 ?auto_22330 ) ) ( not ( = ?auto_22329 ?auto_22344 ) ) ( not ( = ?auto_22330 ?auto_22344 ) ) ( not ( = ?auto_22335 ?auto_22354 ) ) ( IS-CRATE ?auto_22329 ) ( not ( = ?auto_22353 ?auto_22334 ) ) ( HOIST-AT ?auto_22352 ?auto_22353 ) ( AVAILABLE ?auto_22352 ) ( SURFACE-AT ?auto_22329 ?auto_22353 ) ( ON ?auto_22329 ?auto_22349 ) ( CLEAR ?auto_22329 ) ( not ( = ?auto_22328 ?auto_22329 ) ) ( not ( = ?auto_22328 ?auto_22349 ) ) ( not ( = ?auto_22329 ?auto_22349 ) ) ( not ( = ?auto_22335 ?auto_22352 ) ) ( IS-CRATE ?auto_22328 ) ( not ( = ?auto_22339 ?auto_22334 ) ) ( HOIST-AT ?auto_22342 ?auto_22339 ) ( AVAILABLE ?auto_22342 ) ( SURFACE-AT ?auto_22328 ?auto_22339 ) ( ON ?auto_22328 ?auto_22343 ) ( CLEAR ?auto_22328 ) ( not ( = ?auto_22327 ?auto_22328 ) ) ( not ( = ?auto_22327 ?auto_22343 ) ) ( not ( = ?auto_22328 ?auto_22343 ) ) ( not ( = ?auto_22335 ?auto_22342 ) ) ( IS-CRATE ?auto_22327 ) ( not ( = ?auto_22348 ?auto_22334 ) ) ( HOIST-AT ?auto_22351 ?auto_22348 ) ( AVAILABLE ?auto_22351 ) ( SURFACE-AT ?auto_22327 ?auto_22348 ) ( ON ?auto_22327 ?auto_22355 ) ( CLEAR ?auto_22327 ) ( not ( = ?auto_22326 ?auto_22327 ) ) ( not ( = ?auto_22326 ?auto_22355 ) ) ( not ( = ?auto_22327 ?auto_22355 ) ) ( not ( = ?auto_22335 ?auto_22351 ) ) ( SURFACE-AT ?auto_22325 ?auto_22334 ) ( CLEAR ?auto_22325 ) ( IS-CRATE ?auto_22326 ) ( AVAILABLE ?auto_22335 ) ( not ( = ?auto_22356 ?auto_22334 ) ) ( HOIST-AT ?auto_22346 ?auto_22356 ) ( AVAILABLE ?auto_22346 ) ( SURFACE-AT ?auto_22326 ?auto_22356 ) ( ON ?auto_22326 ?auto_22347 ) ( CLEAR ?auto_22326 ) ( TRUCK-AT ?auto_22336 ?auto_22334 ) ( not ( = ?auto_22325 ?auto_22326 ) ) ( not ( = ?auto_22325 ?auto_22347 ) ) ( not ( = ?auto_22326 ?auto_22347 ) ) ( not ( = ?auto_22335 ?auto_22346 ) ) ( not ( = ?auto_22325 ?auto_22327 ) ) ( not ( = ?auto_22325 ?auto_22355 ) ) ( not ( = ?auto_22327 ?auto_22347 ) ) ( not ( = ?auto_22348 ?auto_22356 ) ) ( not ( = ?auto_22351 ?auto_22346 ) ) ( not ( = ?auto_22355 ?auto_22347 ) ) ( not ( = ?auto_22325 ?auto_22328 ) ) ( not ( = ?auto_22325 ?auto_22343 ) ) ( not ( = ?auto_22326 ?auto_22328 ) ) ( not ( = ?auto_22326 ?auto_22343 ) ) ( not ( = ?auto_22328 ?auto_22355 ) ) ( not ( = ?auto_22328 ?auto_22347 ) ) ( not ( = ?auto_22339 ?auto_22348 ) ) ( not ( = ?auto_22339 ?auto_22356 ) ) ( not ( = ?auto_22342 ?auto_22351 ) ) ( not ( = ?auto_22342 ?auto_22346 ) ) ( not ( = ?auto_22343 ?auto_22355 ) ) ( not ( = ?auto_22343 ?auto_22347 ) ) ( not ( = ?auto_22325 ?auto_22329 ) ) ( not ( = ?auto_22325 ?auto_22349 ) ) ( not ( = ?auto_22326 ?auto_22329 ) ) ( not ( = ?auto_22326 ?auto_22349 ) ) ( not ( = ?auto_22327 ?auto_22329 ) ) ( not ( = ?auto_22327 ?auto_22349 ) ) ( not ( = ?auto_22329 ?auto_22343 ) ) ( not ( = ?auto_22329 ?auto_22355 ) ) ( not ( = ?auto_22329 ?auto_22347 ) ) ( not ( = ?auto_22353 ?auto_22339 ) ) ( not ( = ?auto_22353 ?auto_22348 ) ) ( not ( = ?auto_22353 ?auto_22356 ) ) ( not ( = ?auto_22352 ?auto_22342 ) ) ( not ( = ?auto_22352 ?auto_22351 ) ) ( not ( = ?auto_22352 ?auto_22346 ) ) ( not ( = ?auto_22349 ?auto_22343 ) ) ( not ( = ?auto_22349 ?auto_22355 ) ) ( not ( = ?auto_22349 ?auto_22347 ) ) ( not ( = ?auto_22325 ?auto_22330 ) ) ( not ( = ?auto_22325 ?auto_22344 ) ) ( not ( = ?auto_22326 ?auto_22330 ) ) ( not ( = ?auto_22326 ?auto_22344 ) ) ( not ( = ?auto_22327 ?auto_22330 ) ) ( not ( = ?auto_22327 ?auto_22344 ) ) ( not ( = ?auto_22328 ?auto_22330 ) ) ( not ( = ?auto_22328 ?auto_22344 ) ) ( not ( = ?auto_22330 ?auto_22349 ) ) ( not ( = ?auto_22330 ?auto_22343 ) ) ( not ( = ?auto_22330 ?auto_22355 ) ) ( not ( = ?auto_22330 ?auto_22347 ) ) ( not ( = ?auto_22345 ?auto_22353 ) ) ( not ( = ?auto_22345 ?auto_22339 ) ) ( not ( = ?auto_22345 ?auto_22348 ) ) ( not ( = ?auto_22345 ?auto_22356 ) ) ( not ( = ?auto_22354 ?auto_22352 ) ) ( not ( = ?auto_22354 ?auto_22342 ) ) ( not ( = ?auto_22354 ?auto_22351 ) ) ( not ( = ?auto_22354 ?auto_22346 ) ) ( not ( = ?auto_22344 ?auto_22349 ) ) ( not ( = ?auto_22344 ?auto_22343 ) ) ( not ( = ?auto_22344 ?auto_22355 ) ) ( not ( = ?auto_22344 ?auto_22347 ) ) ( not ( = ?auto_22325 ?auto_22331 ) ) ( not ( = ?auto_22325 ?auto_22340 ) ) ( not ( = ?auto_22326 ?auto_22331 ) ) ( not ( = ?auto_22326 ?auto_22340 ) ) ( not ( = ?auto_22327 ?auto_22331 ) ) ( not ( = ?auto_22327 ?auto_22340 ) ) ( not ( = ?auto_22328 ?auto_22331 ) ) ( not ( = ?auto_22328 ?auto_22340 ) ) ( not ( = ?auto_22329 ?auto_22331 ) ) ( not ( = ?auto_22329 ?auto_22340 ) ) ( not ( = ?auto_22331 ?auto_22344 ) ) ( not ( = ?auto_22331 ?auto_22349 ) ) ( not ( = ?auto_22331 ?auto_22343 ) ) ( not ( = ?auto_22331 ?auto_22355 ) ) ( not ( = ?auto_22331 ?auto_22347 ) ) ( not ( = ?auto_22341 ?auto_22345 ) ) ( not ( = ?auto_22341 ?auto_22353 ) ) ( not ( = ?auto_22341 ?auto_22339 ) ) ( not ( = ?auto_22341 ?auto_22348 ) ) ( not ( = ?auto_22341 ?auto_22356 ) ) ( not ( = ?auto_22350 ?auto_22354 ) ) ( not ( = ?auto_22350 ?auto_22352 ) ) ( not ( = ?auto_22350 ?auto_22342 ) ) ( not ( = ?auto_22350 ?auto_22351 ) ) ( not ( = ?auto_22350 ?auto_22346 ) ) ( not ( = ?auto_22340 ?auto_22344 ) ) ( not ( = ?auto_22340 ?auto_22349 ) ) ( not ( = ?auto_22340 ?auto_22343 ) ) ( not ( = ?auto_22340 ?auto_22355 ) ) ( not ( = ?auto_22340 ?auto_22347 ) ) ( not ( = ?auto_22325 ?auto_22332 ) ) ( not ( = ?auto_22325 ?auto_22337 ) ) ( not ( = ?auto_22326 ?auto_22332 ) ) ( not ( = ?auto_22326 ?auto_22337 ) ) ( not ( = ?auto_22327 ?auto_22332 ) ) ( not ( = ?auto_22327 ?auto_22337 ) ) ( not ( = ?auto_22328 ?auto_22332 ) ) ( not ( = ?auto_22328 ?auto_22337 ) ) ( not ( = ?auto_22329 ?auto_22332 ) ) ( not ( = ?auto_22329 ?auto_22337 ) ) ( not ( = ?auto_22330 ?auto_22332 ) ) ( not ( = ?auto_22330 ?auto_22337 ) ) ( not ( = ?auto_22332 ?auto_22340 ) ) ( not ( = ?auto_22332 ?auto_22344 ) ) ( not ( = ?auto_22332 ?auto_22349 ) ) ( not ( = ?auto_22332 ?auto_22343 ) ) ( not ( = ?auto_22332 ?auto_22355 ) ) ( not ( = ?auto_22332 ?auto_22347 ) ) ( not ( = ?auto_22333 ?auto_22341 ) ) ( not ( = ?auto_22333 ?auto_22345 ) ) ( not ( = ?auto_22333 ?auto_22353 ) ) ( not ( = ?auto_22333 ?auto_22339 ) ) ( not ( = ?auto_22333 ?auto_22348 ) ) ( not ( = ?auto_22333 ?auto_22356 ) ) ( not ( = ?auto_22338 ?auto_22350 ) ) ( not ( = ?auto_22338 ?auto_22354 ) ) ( not ( = ?auto_22338 ?auto_22352 ) ) ( not ( = ?auto_22338 ?auto_22342 ) ) ( not ( = ?auto_22338 ?auto_22351 ) ) ( not ( = ?auto_22338 ?auto_22346 ) ) ( not ( = ?auto_22337 ?auto_22340 ) ) ( not ( = ?auto_22337 ?auto_22344 ) ) ( not ( = ?auto_22337 ?auto_22349 ) ) ( not ( = ?auto_22337 ?auto_22343 ) ) ( not ( = ?auto_22337 ?auto_22355 ) ) ( not ( = ?auto_22337 ?auto_22347 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_22325 ?auto_22326 ?auto_22327 ?auto_22328 ?auto_22329 ?auto_22330 ?auto_22331 )
      ( MAKE-1CRATE ?auto_22331 ?auto_22332 )
      ( MAKE-7CRATE-VERIFY ?auto_22325 ?auto_22326 ?auto_22327 ?auto_22328 ?auto_22329 ?auto_22330 ?auto_22331 ?auto_22332 ) )
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
      ?auto_22382 - SURFACE
      ?auto_22383 - SURFACE
      ?auto_22384 - SURFACE
    )
    :vars
    (
      ?auto_22386 - HOIST
      ?auto_22387 - PLACE
      ?auto_22385 - PLACE
      ?auto_22390 - HOIST
      ?auto_22389 - SURFACE
      ?auto_22406 - PLACE
      ?auto_22408 - HOIST
      ?auto_22405 - SURFACE
      ?auto_22391 - PLACE
      ?auto_22394 - HOIST
      ?auto_22392 - SURFACE
      ?auto_22397 - PLACE
      ?auto_22402 - HOIST
      ?auto_22398 - SURFACE
      ?auto_22404 - SURFACE
      ?auto_22401 - PLACE
      ?auto_22407 - HOIST
      ?auto_22399 - SURFACE
      ?auto_22393 - PLACE
      ?auto_22395 - HOIST
      ?auto_22400 - SURFACE
      ?auto_22409 - PLACE
      ?auto_22396 - HOIST
      ?auto_22403 - SURFACE
      ?auto_22388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22386 ?auto_22387 ) ( IS-CRATE ?auto_22384 ) ( not ( = ?auto_22385 ?auto_22387 ) ) ( HOIST-AT ?auto_22390 ?auto_22385 ) ( SURFACE-AT ?auto_22384 ?auto_22385 ) ( ON ?auto_22384 ?auto_22389 ) ( CLEAR ?auto_22384 ) ( not ( = ?auto_22383 ?auto_22384 ) ) ( not ( = ?auto_22383 ?auto_22389 ) ) ( not ( = ?auto_22384 ?auto_22389 ) ) ( not ( = ?auto_22386 ?auto_22390 ) ) ( IS-CRATE ?auto_22383 ) ( not ( = ?auto_22406 ?auto_22387 ) ) ( HOIST-AT ?auto_22408 ?auto_22406 ) ( AVAILABLE ?auto_22408 ) ( SURFACE-AT ?auto_22383 ?auto_22406 ) ( ON ?auto_22383 ?auto_22405 ) ( CLEAR ?auto_22383 ) ( not ( = ?auto_22382 ?auto_22383 ) ) ( not ( = ?auto_22382 ?auto_22405 ) ) ( not ( = ?auto_22383 ?auto_22405 ) ) ( not ( = ?auto_22386 ?auto_22408 ) ) ( IS-CRATE ?auto_22382 ) ( not ( = ?auto_22391 ?auto_22387 ) ) ( HOIST-AT ?auto_22394 ?auto_22391 ) ( AVAILABLE ?auto_22394 ) ( SURFACE-AT ?auto_22382 ?auto_22391 ) ( ON ?auto_22382 ?auto_22392 ) ( CLEAR ?auto_22382 ) ( not ( = ?auto_22381 ?auto_22382 ) ) ( not ( = ?auto_22381 ?auto_22392 ) ) ( not ( = ?auto_22382 ?auto_22392 ) ) ( not ( = ?auto_22386 ?auto_22394 ) ) ( IS-CRATE ?auto_22381 ) ( not ( = ?auto_22397 ?auto_22387 ) ) ( HOIST-AT ?auto_22402 ?auto_22397 ) ( AVAILABLE ?auto_22402 ) ( SURFACE-AT ?auto_22381 ?auto_22397 ) ( ON ?auto_22381 ?auto_22398 ) ( CLEAR ?auto_22381 ) ( not ( = ?auto_22380 ?auto_22381 ) ) ( not ( = ?auto_22380 ?auto_22398 ) ) ( not ( = ?auto_22381 ?auto_22398 ) ) ( not ( = ?auto_22386 ?auto_22402 ) ) ( IS-CRATE ?auto_22380 ) ( AVAILABLE ?auto_22390 ) ( SURFACE-AT ?auto_22380 ?auto_22385 ) ( ON ?auto_22380 ?auto_22404 ) ( CLEAR ?auto_22380 ) ( not ( = ?auto_22379 ?auto_22380 ) ) ( not ( = ?auto_22379 ?auto_22404 ) ) ( not ( = ?auto_22380 ?auto_22404 ) ) ( IS-CRATE ?auto_22379 ) ( not ( = ?auto_22401 ?auto_22387 ) ) ( HOIST-AT ?auto_22407 ?auto_22401 ) ( AVAILABLE ?auto_22407 ) ( SURFACE-AT ?auto_22379 ?auto_22401 ) ( ON ?auto_22379 ?auto_22399 ) ( CLEAR ?auto_22379 ) ( not ( = ?auto_22378 ?auto_22379 ) ) ( not ( = ?auto_22378 ?auto_22399 ) ) ( not ( = ?auto_22379 ?auto_22399 ) ) ( not ( = ?auto_22386 ?auto_22407 ) ) ( IS-CRATE ?auto_22378 ) ( not ( = ?auto_22393 ?auto_22387 ) ) ( HOIST-AT ?auto_22395 ?auto_22393 ) ( AVAILABLE ?auto_22395 ) ( SURFACE-AT ?auto_22378 ?auto_22393 ) ( ON ?auto_22378 ?auto_22400 ) ( CLEAR ?auto_22378 ) ( not ( = ?auto_22377 ?auto_22378 ) ) ( not ( = ?auto_22377 ?auto_22400 ) ) ( not ( = ?auto_22378 ?auto_22400 ) ) ( not ( = ?auto_22386 ?auto_22395 ) ) ( SURFACE-AT ?auto_22376 ?auto_22387 ) ( CLEAR ?auto_22376 ) ( IS-CRATE ?auto_22377 ) ( AVAILABLE ?auto_22386 ) ( not ( = ?auto_22409 ?auto_22387 ) ) ( HOIST-AT ?auto_22396 ?auto_22409 ) ( AVAILABLE ?auto_22396 ) ( SURFACE-AT ?auto_22377 ?auto_22409 ) ( ON ?auto_22377 ?auto_22403 ) ( CLEAR ?auto_22377 ) ( TRUCK-AT ?auto_22388 ?auto_22387 ) ( not ( = ?auto_22376 ?auto_22377 ) ) ( not ( = ?auto_22376 ?auto_22403 ) ) ( not ( = ?auto_22377 ?auto_22403 ) ) ( not ( = ?auto_22386 ?auto_22396 ) ) ( not ( = ?auto_22376 ?auto_22378 ) ) ( not ( = ?auto_22376 ?auto_22400 ) ) ( not ( = ?auto_22378 ?auto_22403 ) ) ( not ( = ?auto_22393 ?auto_22409 ) ) ( not ( = ?auto_22395 ?auto_22396 ) ) ( not ( = ?auto_22400 ?auto_22403 ) ) ( not ( = ?auto_22376 ?auto_22379 ) ) ( not ( = ?auto_22376 ?auto_22399 ) ) ( not ( = ?auto_22377 ?auto_22379 ) ) ( not ( = ?auto_22377 ?auto_22399 ) ) ( not ( = ?auto_22379 ?auto_22400 ) ) ( not ( = ?auto_22379 ?auto_22403 ) ) ( not ( = ?auto_22401 ?auto_22393 ) ) ( not ( = ?auto_22401 ?auto_22409 ) ) ( not ( = ?auto_22407 ?auto_22395 ) ) ( not ( = ?auto_22407 ?auto_22396 ) ) ( not ( = ?auto_22399 ?auto_22400 ) ) ( not ( = ?auto_22399 ?auto_22403 ) ) ( not ( = ?auto_22376 ?auto_22380 ) ) ( not ( = ?auto_22376 ?auto_22404 ) ) ( not ( = ?auto_22377 ?auto_22380 ) ) ( not ( = ?auto_22377 ?auto_22404 ) ) ( not ( = ?auto_22378 ?auto_22380 ) ) ( not ( = ?auto_22378 ?auto_22404 ) ) ( not ( = ?auto_22380 ?auto_22399 ) ) ( not ( = ?auto_22380 ?auto_22400 ) ) ( not ( = ?auto_22380 ?auto_22403 ) ) ( not ( = ?auto_22385 ?auto_22401 ) ) ( not ( = ?auto_22385 ?auto_22393 ) ) ( not ( = ?auto_22385 ?auto_22409 ) ) ( not ( = ?auto_22390 ?auto_22407 ) ) ( not ( = ?auto_22390 ?auto_22395 ) ) ( not ( = ?auto_22390 ?auto_22396 ) ) ( not ( = ?auto_22404 ?auto_22399 ) ) ( not ( = ?auto_22404 ?auto_22400 ) ) ( not ( = ?auto_22404 ?auto_22403 ) ) ( not ( = ?auto_22376 ?auto_22381 ) ) ( not ( = ?auto_22376 ?auto_22398 ) ) ( not ( = ?auto_22377 ?auto_22381 ) ) ( not ( = ?auto_22377 ?auto_22398 ) ) ( not ( = ?auto_22378 ?auto_22381 ) ) ( not ( = ?auto_22378 ?auto_22398 ) ) ( not ( = ?auto_22379 ?auto_22381 ) ) ( not ( = ?auto_22379 ?auto_22398 ) ) ( not ( = ?auto_22381 ?auto_22404 ) ) ( not ( = ?auto_22381 ?auto_22399 ) ) ( not ( = ?auto_22381 ?auto_22400 ) ) ( not ( = ?auto_22381 ?auto_22403 ) ) ( not ( = ?auto_22397 ?auto_22385 ) ) ( not ( = ?auto_22397 ?auto_22401 ) ) ( not ( = ?auto_22397 ?auto_22393 ) ) ( not ( = ?auto_22397 ?auto_22409 ) ) ( not ( = ?auto_22402 ?auto_22390 ) ) ( not ( = ?auto_22402 ?auto_22407 ) ) ( not ( = ?auto_22402 ?auto_22395 ) ) ( not ( = ?auto_22402 ?auto_22396 ) ) ( not ( = ?auto_22398 ?auto_22404 ) ) ( not ( = ?auto_22398 ?auto_22399 ) ) ( not ( = ?auto_22398 ?auto_22400 ) ) ( not ( = ?auto_22398 ?auto_22403 ) ) ( not ( = ?auto_22376 ?auto_22382 ) ) ( not ( = ?auto_22376 ?auto_22392 ) ) ( not ( = ?auto_22377 ?auto_22382 ) ) ( not ( = ?auto_22377 ?auto_22392 ) ) ( not ( = ?auto_22378 ?auto_22382 ) ) ( not ( = ?auto_22378 ?auto_22392 ) ) ( not ( = ?auto_22379 ?auto_22382 ) ) ( not ( = ?auto_22379 ?auto_22392 ) ) ( not ( = ?auto_22380 ?auto_22382 ) ) ( not ( = ?auto_22380 ?auto_22392 ) ) ( not ( = ?auto_22382 ?auto_22398 ) ) ( not ( = ?auto_22382 ?auto_22404 ) ) ( not ( = ?auto_22382 ?auto_22399 ) ) ( not ( = ?auto_22382 ?auto_22400 ) ) ( not ( = ?auto_22382 ?auto_22403 ) ) ( not ( = ?auto_22391 ?auto_22397 ) ) ( not ( = ?auto_22391 ?auto_22385 ) ) ( not ( = ?auto_22391 ?auto_22401 ) ) ( not ( = ?auto_22391 ?auto_22393 ) ) ( not ( = ?auto_22391 ?auto_22409 ) ) ( not ( = ?auto_22394 ?auto_22402 ) ) ( not ( = ?auto_22394 ?auto_22390 ) ) ( not ( = ?auto_22394 ?auto_22407 ) ) ( not ( = ?auto_22394 ?auto_22395 ) ) ( not ( = ?auto_22394 ?auto_22396 ) ) ( not ( = ?auto_22392 ?auto_22398 ) ) ( not ( = ?auto_22392 ?auto_22404 ) ) ( not ( = ?auto_22392 ?auto_22399 ) ) ( not ( = ?auto_22392 ?auto_22400 ) ) ( not ( = ?auto_22392 ?auto_22403 ) ) ( not ( = ?auto_22376 ?auto_22383 ) ) ( not ( = ?auto_22376 ?auto_22405 ) ) ( not ( = ?auto_22377 ?auto_22383 ) ) ( not ( = ?auto_22377 ?auto_22405 ) ) ( not ( = ?auto_22378 ?auto_22383 ) ) ( not ( = ?auto_22378 ?auto_22405 ) ) ( not ( = ?auto_22379 ?auto_22383 ) ) ( not ( = ?auto_22379 ?auto_22405 ) ) ( not ( = ?auto_22380 ?auto_22383 ) ) ( not ( = ?auto_22380 ?auto_22405 ) ) ( not ( = ?auto_22381 ?auto_22383 ) ) ( not ( = ?auto_22381 ?auto_22405 ) ) ( not ( = ?auto_22383 ?auto_22392 ) ) ( not ( = ?auto_22383 ?auto_22398 ) ) ( not ( = ?auto_22383 ?auto_22404 ) ) ( not ( = ?auto_22383 ?auto_22399 ) ) ( not ( = ?auto_22383 ?auto_22400 ) ) ( not ( = ?auto_22383 ?auto_22403 ) ) ( not ( = ?auto_22406 ?auto_22391 ) ) ( not ( = ?auto_22406 ?auto_22397 ) ) ( not ( = ?auto_22406 ?auto_22385 ) ) ( not ( = ?auto_22406 ?auto_22401 ) ) ( not ( = ?auto_22406 ?auto_22393 ) ) ( not ( = ?auto_22406 ?auto_22409 ) ) ( not ( = ?auto_22408 ?auto_22394 ) ) ( not ( = ?auto_22408 ?auto_22402 ) ) ( not ( = ?auto_22408 ?auto_22390 ) ) ( not ( = ?auto_22408 ?auto_22407 ) ) ( not ( = ?auto_22408 ?auto_22395 ) ) ( not ( = ?auto_22408 ?auto_22396 ) ) ( not ( = ?auto_22405 ?auto_22392 ) ) ( not ( = ?auto_22405 ?auto_22398 ) ) ( not ( = ?auto_22405 ?auto_22404 ) ) ( not ( = ?auto_22405 ?auto_22399 ) ) ( not ( = ?auto_22405 ?auto_22400 ) ) ( not ( = ?auto_22405 ?auto_22403 ) ) ( not ( = ?auto_22376 ?auto_22384 ) ) ( not ( = ?auto_22376 ?auto_22389 ) ) ( not ( = ?auto_22377 ?auto_22384 ) ) ( not ( = ?auto_22377 ?auto_22389 ) ) ( not ( = ?auto_22378 ?auto_22384 ) ) ( not ( = ?auto_22378 ?auto_22389 ) ) ( not ( = ?auto_22379 ?auto_22384 ) ) ( not ( = ?auto_22379 ?auto_22389 ) ) ( not ( = ?auto_22380 ?auto_22384 ) ) ( not ( = ?auto_22380 ?auto_22389 ) ) ( not ( = ?auto_22381 ?auto_22384 ) ) ( not ( = ?auto_22381 ?auto_22389 ) ) ( not ( = ?auto_22382 ?auto_22384 ) ) ( not ( = ?auto_22382 ?auto_22389 ) ) ( not ( = ?auto_22384 ?auto_22405 ) ) ( not ( = ?auto_22384 ?auto_22392 ) ) ( not ( = ?auto_22384 ?auto_22398 ) ) ( not ( = ?auto_22384 ?auto_22404 ) ) ( not ( = ?auto_22384 ?auto_22399 ) ) ( not ( = ?auto_22384 ?auto_22400 ) ) ( not ( = ?auto_22384 ?auto_22403 ) ) ( not ( = ?auto_22389 ?auto_22405 ) ) ( not ( = ?auto_22389 ?auto_22392 ) ) ( not ( = ?auto_22389 ?auto_22398 ) ) ( not ( = ?auto_22389 ?auto_22404 ) ) ( not ( = ?auto_22389 ?auto_22399 ) ) ( not ( = ?auto_22389 ?auto_22400 ) ) ( not ( = ?auto_22389 ?auto_22403 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_22376 ?auto_22377 ?auto_22378 ?auto_22379 ?auto_22380 ?auto_22381 ?auto_22382 ?auto_22383 )
      ( MAKE-1CRATE ?auto_22383 ?auto_22384 )
      ( MAKE-8CRATE-VERIFY ?auto_22376 ?auto_22377 ?auto_22378 ?auto_22379 ?auto_22380 ?auto_22381 ?auto_22382 ?auto_22383 ?auto_22384 ) )
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
      ?auto_22436 - SURFACE
      ?auto_22437 - SURFACE
      ?auto_22438 - SURFACE
      ?auto_22439 - SURFACE
    )
    :vars
    (
      ?auto_22442 - HOIST
      ?auto_22443 - PLACE
      ?auto_22441 - PLACE
      ?auto_22444 - HOIST
      ?auto_22440 - SURFACE
      ?auto_22453 - PLACE
      ?auto_22467 - HOIST
      ?auto_22465 - SURFACE
      ?auto_22464 - PLACE
      ?auto_22455 - HOIST
      ?auto_22454 - SURFACE
      ?auto_22456 - PLACE
      ?auto_22452 - HOIST
      ?auto_22466 - SURFACE
      ?auto_22450 - PLACE
      ?auto_22446 - HOIST
      ?auto_22449 - SURFACE
      ?auto_22448 - SURFACE
      ?auto_22462 - PLACE
      ?auto_22451 - HOIST
      ?auto_22461 - SURFACE
      ?auto_22458 - PLACE
      ?auto_22460 - HOIST
      ?auto_22463 - SURFACE
      ?auto_22457 - PLACE
      ?auto_22459 - HOIST
      ?auto_22447 - SURFACE
      ?auto_22445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22442 ?auto_22443 ) ( IS-CRATE ?auto_22439 ) ( not ( = ?auto_22441 ?auto_22443 ) ) ( HOIST-AT ?auto_22444 ?auto_22441 ) ( AVAILABLE ?auto_22444 ) ( SURFACE-AT ?auto_22439 ?auto_22441 ) ( ON ?auto_22439 ?auto_22440 ) ( CLEAR ?auto_22439 ) ( not ( = ?auto_22438 ?auto_22439 ) ) ( not ( = ?auto_22438 ?auto_22440 ) ) ( not ( = ?auto_22439 ?auto_22440 ) ) ( not ( = ?auto_22442 ?auto_22444 ) ) ( IS-CRATE ?auto_22438 ) ( not ( = ?auto_22453 ?auto_22443 ) ) ( HOIST-AT ?auto_22467 ?auto_22453 ) ( SURFACE-AT ?auto_22438 ?auto_22453 ) ( ON ?auto_22438 ?auto_22465 ) ( CLEAR ?auto_22438 ) ( not ( = ?auto_22437 ?auto_22438 ) ) ( not ( = ?auto_22437 ?auto_22465 ) ) ( not ( = ?auto_22438 ?auto_22465 ) ) ( not ( = ?auto_22442 ?auto_22467 ) ) ( IS-CRATE ?auto_22437 ) ( not ( = ?auto_22464 ?auto_22443 ) ) ( HOIST-AT ?auto_22455 ?auto_22464 ) ( AVAILABLE ?auto_22455 ) ( SURFACE-AT ?auto_22437 ?auto_22464 ) ( ON ?auto_22437 ?auto_22454 ) ( CLEAR ?auto_22437 ) ( not ( = ?auto_22436 ?auto_22437 ) ) ( not ( = ?auto_22436 ?auto_22454 ) ) ( not ( = ?auto_22437 ?auto_22454 ) ) ( not ( = ?auto_22442 ?auto_22455 ) ) ( IS-CRATE ?auto_22436 ) ( not ( = ?auto_22456 ?auto_22443 ) ) ( HOIST-AT ?auto_22452 ?auto_22456 ) ( AVAILABLE ?auto_22452 ) ( SURFACE-AT ?auto_22436 ?auto_22456 ) ( ON ?auto_22436 ?auto_22466 ) ( CLEAR ?auto_22436 ) ( not ( = ?auto_22435 ?auto_22436 ) ) ( not ( = ?auto_22435 ?auto_22466 ) ) ( not ( = ?auto_22436 ?auto_22466 ) ) ( not ( = ?auto_22442 ?auto_22452 ) ) ( IS-CRATE ?auto_22435 ) ( not ( = ?auto_22450 ?auto_22443 ) ) ( HOIST-AT ?auto_22446 ?auto_22450 ) ( AVAILABLE ?auto_22446 ) ( SURFACE-AT ?auto_22435 ?auto_22450 ) ( ON ?auto_22435 ?auto_22449 ) ( CLEAR ?auto_22435 ) ( not ( = ?auto_22434 ?auto_22435 ) ) ( not ( = ?auto_22434 ?auto_22449 ) ) ( not ( = ?auto_22435 ?auto_22449 ) ) ( not ( = ?auto_22442 ?auto_22446 ) ) ( IS-CRATE ?auto_22434 ) ( AVAILABLE ?auto_22467 ) ( SURFACE-AT ?auto_22434 ?auto_22453 ) ( ON ?auto_22434 ?auto_22448 ) ( CLEAR ?auto_22434 ) ( not ( = ?auto_22433 ?auto_22434 ) ) ( not ( = ?auto_22433 ?auto_22448 ) ) ( not ( = ?auto_22434 ?auto_22448 ) ) ( IS-CRATE ?auto_22433 ) ( not ( = ?auto_22462 ?auto_22443 ) ) ( HOIST-AT ?auto_22451 ?auto_22462 ) ( AVAILABLE ?auto_22451 ) ( SURFACE-AT ?auto_22433 ?auto_22462 ) ( ON ?auto_22433 ?auto_22461 ) ( CLEAR ?auto_22433 ) ( not ( = ?auto_22432 ?auto_22433 ) ) ( not ( = ?auto_22432 ?auto_22461 ) ) ( not ( = ?auto_22433 ?auto_22461 ) ) ( not ( = ?auto_22442 ?auto_22451 ) ) ( IS-CRATE ?auto_22432 ) ( not ( = ?auto_22458 ?auto_22443 ) ) ( HOIST-AT ?auto_22460 ?auto_22458 ) ( AVAILABLE ?auto_22460 ) ( SURFACE-AT ?auto_22432 ?auto_22458 ) ( ON ?auto_22432 ?auto_22463 ) ( CLEAR ?auto_22432 ) ( not ( = ?auto_22431 ?auto_22432 ) ) ( not ( = ?auto_22431 ?auto_22463 ) ) ( not ( = ?auto_22432 ?auto_22463 ) ) ( not ( = ?auto_22442 ?auto_22460 ) ) ( SURFACE-AT ?auto_22430 ?auto_22443 ) ( CLEAR ?auto_22430 ) ( IS-CRATE ?auto_22431 ) ( AVAILABLE ?auto_22442 ) ( not ( = ?auto_22457 ?auto_22443 ) ) ( HOIST-AT ?auto_22459 ?auto_22457 ) ( AVAILABLE ?auto_22459 ) ( SURFACE-AT ?auto_22431 ?auto_22457 ) ( ON ?auto_22431 ?auto_22447 ) ( CLEAR ?auto_22431 ) ( TRUCK-AT ?auto_22445 ?auto_22443 ) ( not ( = ?auto_22430 ?auto_22431 ) ) ( not ( = ?auto_22430 ?auto_22447 ) ) ( not ( = ?auto_22431 ?auto_22447 ) ) ( not ( = ?auto_22442 ?auto_22459 ) ) ( not ( = ?auto_22430 ?auto_22432 ) ) ( not ( = ?auto_22430 ?auto_22463 ) ) ( not ( = ?auto_22432 ?auto_22447 ) ) ( not ( = ?auto_22458 ?auto_22457 ) ) ( not ( = ?auto_22460 ?auto_22459 ) ) ( not ( = ?auto_22463 ?auto_22447 ) ) ( not ( = ?auto_22430 ?auto_22433 ) ) ( not ( = ?auto_22430 ?auto_22461 ) ) ( not ( = ?auto_22431 ?auto_22433 ) ) ( not ( = ?auto_22431 ?auto_22461 ) ) ( not ( = ?auto_22433 ?auto_22463 ) ) ( not ( = ?auto_22433 ?auto_22447 ) ) ( not ( = ?auto_22462 ?auto_22458 ) ) ( not ( = ?auto_22462 ?auto_22457 ) ) ( not ( = ?auto_22451 ?auto_22460 ) ) ( not ( = ?auto_22451 ?auto_22459 ) ) ( not ( = ?auto_22461 ?auto_22463 ) ) ( not ( = ?auto_22461 ?auto_22447 ) ) ( not ( = ?auto_22430 ?auto_22434 ) ) ( not ( = ?auto_22430 ?auto_22448 ) ) ( not ( = ?auto_22431 ?auto_22434 ) ) ( not ( = ?auto_22431 ?auto_22448 ) ) ( not ( = ?auto_22432 ?auto_22434 ) ) ( not ( = ?auto_22432 ?auto_22448 ) ) ( not ( = ?auto_22434 ?auto_22461 ) ) ( not ( = ?auto_22434 ?auto_22463 ) ) ( not ( = ?auto_22434 ?auto_22447 ) ) ( not ( = ?auto_22453 ?auto_22462 ) ) ( not ( = ?auto_22453 ?auto_22458 ) ) ( not ( = ?auto_22453 ?auto_22457 ) ) ( not ( = ?auto_22467 ?auto_22451 ) ) ( not ( = ?auto_22467 ?auto_22460 ) ) ( not ( = ?auto_22467 ?auto_22459 ) ) ( not ( = ?auto_22448 ?auto_22461 ) ) ( not ( = ?auto_22448 ?auto_22463 ) ) ( not ( = ?auto_22448 ?auto_22447 ) ) ( not ( = ?auto_22430 ?auto_22435 ) ) ( not ( = ?auto_22430 ?auto_22449 ) ) ( not ( = ?auto_22431 ?auto_22435 ) ) ( not ( = ?auto_22431 ?auto_22449 ) ) ( not ( = ?auto_22432 ?auto_22435 ) ) ( not ( = ?auto_22432 ?auto_22449 ) ) ( not ( = ?auto_22433 ?auto_22435 ) ) ( not ( = ?auto_22433 ?auto_22449 ) ) ( not ( = ?auto_22435 ?auto_22448 ) ) ( not ( = ?auto_22435 ?auto_22461 ) ) ( not ( = ?auto_22435 ?auto_22463 ) ) ( not ( = ?auto_22435 ?auto_22447 ) ) ( not ( = ?auto_22450 ?auto_22453 ) ) ( not ( = ?auto_22450 ?auto_22462 ) ) ( not ( = ?auto_22450 ?auto_22458 ) ) ( not ( = ?auto_22450 ?auto_22457 ) ) ( not ( = ?auto_22446 ?auto_22467 ) ) ( not ( = ?auto_22446 ?auto_22451 ) ) ( not ( = ?auto_22446 ?auto_22460 ) ) ( not ( = ?auto_22446 ?auto_22459 ) ) ( not ( = ?auto_22449 ?auto_22448 ) ) ( not ( = ?auto_22449 ?auto_22461 ) ) ( not ( = ?auto_22449 ?auto_22463 ) ) ( not ( = ?auto_22449 ?auto_22447 ) ) ( not ( = ?auto_22430 ?auto_22436 ) ) ( not ( = ?auto_22430 ?auto_22466 ) ) ( not ( = ?auto_22431 ?auto_22436 ) ) ( not ( = ?auto_22431 ?auto_22466 ) ) ( not ( = ?auto_22432 ?auto_22436 ) ) ( not ( = ?auto_22432 ?auto_22466 ) ) ( not ( = ?auto_22433 ?auto_22436 ) ) ( not ( = ?auto_22433 ?auto_22466 ) ) ( not ( = ?auto_22434 ?auto_22436 ) ) ( not ( = ?auto_22434 ?auto_22466 ) ) ( not ( = ?auto_22436 ?auto_22449 ) ) ( not ( = ?auto_22436 ?auto_22448 ) ) ( not ( = ?auto_22436 ?auto_22461 ) ) ( not ( = ?auto_22436 ?auto_22463 ) ) ( not ( = ?auto_22436 ?auto_22447 ) ) ( not ( = ?auto_22456 ?auto_22450 ) ) ( not ( = ?auto_22456 ?auto_22453 ) ) ( not ( = ?auto_22456 ?auto_22462 ) ) ( not ( = ?auto_22456 ?auto_22458 ) ) ( not ( = ?auto_22456 ?auto_22457 ) ) ( not ( = ?auto_22452 ?auto_22446 ) ) ( not ( = ?auto_22452 ?auto_22467 ) ) ( not ( = ?auto_22452 ?auto_22451 ) ) ( not ( = ?auto_22452 ?auto_22460 ) ) ( not ( = ?auto_22452 ?auto_22459 ) ) ( not ( = ?auto_22466 ?auto_22449 ) ) ( not ( = ?auto_22466 ?auto_22448 ) ) ( not ( = ?auto_22466 ?auto_22461 ) ) ( not ( = ?auto_22466 ?auto_22463 ) ) ( not ( = ?auto_22466 ?auto_22447 ) ) ( not ( = ?auto_22430 ?auto_22437 ) ) ( not ( = ?auto_22430 ?auto_22454 ) ) ( not ( = ?auto_22431 ?auto_22437 ) ) ( not ( = ?auto_22431 ?auto_22454 ) ) ( not ( = ?auto_22432 ?auto_22437 ) ) ( not ( = ?auto_22432 ?auto_22454 ) ) ( not ( = ?auto_22433 ?auto_22437 ) ) ( not ( = ?auto_22433 ?auto_22454 ) ) ( not ( = ?auto_22434 ?auto_22437 ) ) ( not ( = ?auto_22434 ?auto_22454 ) ) ( not ( = ?auto_22435 ?auto_22437 ) ) ( not ( = ?auto_22435 ?auto_22454 ) ) ( not ( = ?auto_22437 ?auto_22466 ) ) ( not ( = ?auto_22437 ?auto_22449 ) ) ( not ( = ?auto_22437 ?auto_22448 ) ) ( not ( = ?auto_22437 ?auto_22461 ) ) ( not ( = ?auto_22437 ?auto_22463 ) ) ( not ( = ?auto_22437 ?auto_22447 ) ) ( not ( = ?auto_22464 ?auto_22456 ) ) ( not ( = ?auto_22464 ?auto_22450 ) ) ( not ( = ?auto_22464 ?auto_22453 ) ) ( not ( = ?auto_22464 ?auto_22462 ) ) ( not ( = ?auto_22464 ?auto_22458 ) ) ( not ( = ?auto_22464 ?auto_22457 ) ) ( not ( = ?auto_22455 ?auto_22452 ) ) ( not ( = ?auto_22455 ?auto_22446 ) ) ( not ( = ?auto_22455 ?auto_22467 ) ) ( not ( = ?auto_22455 ?auto_22451 ) ) ( not ( = ?auto_22455 ?auto_22460 ) ) ( not ( = ?auto_22455 ?auto_22459 ) ) ( not ( = ?auto_22454 ?auto_22466 ) ) ( not ( = ?auto_22454 ?auto_22449 ) ) ( not ( = ?auto_22454 ?auto_22448 ) ) ( not ( = ?auto_22454 ?auto_22461 ) ) ( not ( = ?auto_22454 ?auto_22463 ) ) ( not ( = ?auto_22454 ?auto_22447 ) ) ( not ( = ?auto_22430 ?auto_22438 ) ) ( not ( = ?auto_22430 ?auto_22465 ) ) ( not ( = ?auto_22431 ?auto_22438 ) ) ( not ( = ?auto_22431 ?auto_22465 ) ) ( not ( = ?auto_22432 ?auto_22438 ) ) ( not ( = ?auto_22432 ?auto_22465 ) ) ( not ( = ?auto_22433 ?auto_22438 ) ) ( not ( = ?auto_22433 ?auto_22465 ) ) ( not ( = ?auto_22434 ?auto_22438 ) ) ( not ( = ?auto_22434 ?auto_22465 ) ) ( not ( = ?auto_22435 ?auto_22438 ) ) ( not ( = ?auto_22435 ?auto_22465 ) ) ( not ( = ?auto_22436 ?auto_22438 ) ) ( not ( = ?auto_22436 ?auto_22465 ) ) ( not ( = ?auto_22438 ?auto_22454 ) ) ( not ( = ?auto_22438 ?auto_22466 ) ) ( not ( = ?auto_22438 ?auto_22449 ) ) ( not ( = ?auto_22438 ?auto_22448 ) ) ( not ( = ?auto_22438 ?auto_22461 ) ) ( not ( = ?auto_22438 ?auto_22463 ) ) ( not ( = ?auto_22438 ?auto_22447 ) ) ( not ( = ?auto_22465 ?auto_22454 ) ) ( not ( = ?auto_22465 ?auto_22466 ) ) ( not ( = ?auto_22465 ?auto_22449 ) ) ( not ( = ?auto_22465 ?auto_22448 ) ) ( not ( = ?auto_22465 ?auto_22461 ) ) ( not ( = ?auto_22465 ?auto_22463 ) ) ( not ( = ?auto_22465 ?auto_22447 ) ) ( not ( = ?auto_22430 ?auto_22439 ) ) ( not ( = ?auto_22430 ?auto_22440 ) ) ( not ( = ?auto_22431 ?auto_22439 ) ) ( not ( = ?auto_22431 ?auto_22440 ) ) ( not ( = ?auto_22432 ?auto_22439 ) ) ( not ( = ?auto_22432 ?auto_22440 ) ) ( not ( = ?auto_22433 ?auto_22439 ) ) ( not ( = ?auto_22433 ?auto_22440 ) ) ( not ( = ?auto_22434 ?auto_22439 ) ) ( not ( = ?auto_22434 ?auto_22440 ) ) ( not ( = ?auto_22435 ?auto_22439 ) ) ( not ( = ?auto_22435 ?auto_22440 ) ) ( not ( = ?auto_22436 ?auto_22439 ) ) ( not ( = ?auto_22436 ?auto_22440 ) ) ( not ( = ?auto_22437 ?auto_22439 ) ) ( not ( = ?auto_22437 ?auto_22440 ) ) ( not ( = ?auto_22439 ?auto_22465 ) ) ( not ( = ?auto_22439 ?auto_22454 ) ) ( not ( = ?auto_22439 ?auto_22466 ) ) ( not ( = ?auto_22439 ?auto_22449 ) ) ( not ( = ?auto_22439 ?auto_22448 ) ) ( not ( = ?auto_22439 ?auto_22461 ) ) ( not ( = ?auto_22439 ?auto_22463 ) ) ( not ( = ?auto_22439 ?auto_22447 ) ) ( not ( = ?auto_22441 ?auto_22453 ) ) ( not ( = ?auto_22441 ?auto_22464 ) ) ( not ( = ?auto_22441 ?auto_22456 ) ) ( not ( = ?auto_22441 ?auto_22450 ) ) ( not ( = ?auto_22441 ?auto_22462 ) ) ( not ( = ?auto_22441 ?auto_22458 ) ) ( not ( = ?auto_22441 ?auto_22457 ) ) ( not ( = ?auto_22444 ?auto_22467 ) ) ( not ( = ?auto_22444 ?auto_22455 ) ) ( not ( = ?auto_22444 ?auto_22452 ) ) ( not ( = ?auto_22444 ?auto_22446 ) ) ( not ( = ?auto_22444 ?auto_22451 ) ) ( not ( = ?auto_22444 ?auto_22460 ) ) ( not ( = ?auto_22444 ?auto_22459 ) ) ( not ( = ?auto_22440 ?auto_22465 ) ) ( not ( = ?auto_22440 ?auto_22454 ) ) ( not ( = ?auto_22440 ?auto_22466 ) ) ( not ( = ?auto_22440 ?auto_22449 ) ) ( not ( = ?auto_22440 ?auto_22448 ) ) ( not ( = ?auto_22440 ?auto_22461 ) ) ( not ( = ?auto_22440 ?auto_22463 ) ) ( not ( = ?auto_22440 ?auto_22447 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_22430 ?auto_22431 ?auto_22432 ?auto_22433 ?auto_22434 ?auto_22435 ?auto_22436 ?auto_22437 ?auto_22438 )
      ( MAKE-1CRATE ?auto_22438 ?auto_22439 )
      ( MAKE-9CRATE-VERIFY ?auto_22430 ?auto_22431 ?auto_22432 ?auto_22433 ?auto_22434 ?auto_22435 ?auto_22436 ?auto_22437 ?auto_22438 ?auto_22439 ) )
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
      ?auto_22495 - SURFACE
      ?auto_22496 - SURFACE
      ?auto_22497 - SURFACE
      ?auto_22498 - SURFACE
      ?auto_22499 - SURFACE
    )
    :vars
    (
      ?auto_22502 - HOIST
      ?auto_22504 - PLACE
      ?auto_22505 - PLACE
      ?auto_22500 - HOIST
      ?auto_22501 - SURFACE
      ?auto_22526 - PLACE
      ?auto_22515 - HOIST
      ?auto_22521 - SURFACE
      ?auto_22508 - SURFACE
      ?auto_22523 - PLACE
      ?auto_22519 - HOIST
      ?auto_22522 - SURFACE
      ?auto_22517 - PLACE
      ?auto_22510 - HOIST
      ?auto_22528 - SURFACE
      ?auto_22512 - PLACE
      ?auto_22527 - HOIST
      ?auto_22507 - SURFACE
      ?auto_22509 - SURFACE
      ?auto_22516 - PLACE
      ?auto_22511 - HOIST
      ?auto_22506 - SURFACE
      ?auto_22525 - PLACE
      ?auto_22524 - HOIST
      ?auto_22518 - SURFACE
      ?auto_22520 - PLACE
      ?auto_22514 - HOIST
      ?auto_22513 - SURFACE
      ?auto_22503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22502 ?auto_22504 ) ( IS-CRATE ?auto_22499 ) ( not ( = ?auto_22505 ?auto_22504 ) ) ( HOIST-AT ?auto_22500 ?auto_22505 ) ( SURFACE-AT ?auto_22499 ?auto_22505 ) ( ON ?auto_22499 ?auto_22501 ) ( CLEAR ?auto_22499 ) ( not ( = ?auto_22498 ?auto_22499 ) ) ( not ( = ?auto_22498 ?auto_22501 ) ) ( not ( = ?auto_22499 ?auto_22501 ) ) ( not ( = ?auto_22502 ?auto_22500 ) ) ( IS-CRATE ?auto_22498 ) ( not ( = ?auto_22526 ?auto_22504 ) ) ( HOIST-AT ?auto_22515 ?auto_22526 ) ( AVAILABLE ?auto_22515 ) ( SURFACE-AT ?auto_22498 ?auto_22526 ) ( ON ?auto_22498 ?auto_22521 ) ( CLEAR ?auto_22498 ) ( not ( = ?auto_22497 ?auto_22498 ) ) ( not ( = ?auto_22497 ?auto_22521 ) ) ( not ( = ?auto_22498 ?auto_22521 ) ) ( not ( = ?auto_22502 ?auto_22515 ) ) ( IS-CRATE ?auto_22497 ) ( SURFACE-AT ?auto_22497 ?auto_22505 ) ( ON ?auto_22497 ?auto_22508 ) ( CLEAR ?auto_22497 ) ( not ( = ?auto_22496 ?auto_22497 ) ) ( not ( = ?auto_22496 ?auto_22508 ) ) ( not ( = ?auto_22497 ?auto_22508 ) ) ( IS-CRATE ?auto_22496 ) ( not ( = ?auto_22523 ?auto_22504 ) ) ( HOIST-AT ?auto_22519 ?auto_22523 ) ( AVAILABLE ?auto_22519 ) ( SURFACE-AT ?auto_22496 ?auto_22523 ) ( ON ?auto_22496 ?auto_22522 ) ( CLEAR ?auto_22496 ) ( not ( = ?auto_22495 ?auto_22496 ) ) ( not ( = ?auto_22495 ?auto_22522 ) ) ( not ( = ?auto_22496 ?auto_22522 ) ) ( not ( = ?auto_22502 ?auto_22519 ) ) ( IS-CRATE ?auto_22495 ) ( not ( = ?auto_22517 ?auto_22504 ) ) ( HOIST-AT ?auto_22510 ?auto_22517 ) ( AVAILABLE ?auto_22510 ) ( SURFACE-AT ?auto_22495 ?auto_22517 ) ( ON ?auto_22495 ?auto_22528 ) ( CLEAR ?auto_22495 ) ( not ( = ?auto_22494 ?auto_22495 ) ) ( not ( = ?auto_22494 ?auto_22528 ) ) ( not ( = ?auto_22495 ?auto_22528 ) ) ( not ( = ?auto_22502 ?auto_22510 ) ) ( IS-CRATE ?auto_22494 ) ( not ( = ?auto_22512 ?auto_22504 ) ) ( HOIST-AT ?auto_22527 ?auto_22512 ) ( AVAILABLE ?auto_22527 ) ( SURFACE-AT ?auto_22494 ?auto_22512 ) ( ON ?auto_22494 ?auto_22507 ) ( CLEAR ?auto_22494 ) ( not ( = ?auto_22493 ?auto_22494 ) ) ( not ( = ?auto_22493 ?auto_22507 ) ) ( not ( = ?auto_22494 ?auto_22507 ) ) ( not ( = ?auto_22502 ?auto_22527 ) ) ( IS-CRATE ?auto_22493 ) ( AVAILABLE ?auto_22500 ) ( SURFACE-AT ?auto_22493 ?auto_22505 ) ( ON ?auto_22493 ?auto_22509 ) ( CLEAR ?auto_22493 ) ( not ( = ?auto_22492 ?auto_22493 ) ) ( not ( = ?auto_22492 ?auto_22509 ) ) ( not ( = ?auto_22493 ?auto_22509 ) ) ( IS-CRATE ?auto_22492 ) ( not ( = ?auto_22516 ?auto_22504 ) ) ( HOIST-AT ?auto_22511 ?auto_22516 ) ( AVAILABLE ?auto_22511 ) ( SURFACE-AT ?auto_22492 ?auto_22516 ) ( ON ?auto_22492 ?auto_22506 ) ( CLEAR ?auto_22492 ) ( not ( = ?auto_22491 ?auto_22492 ) ) ( not ( = ?auto_22491 ?auto_22506 ) ) ( not ( = ?auto_22492 ?auto_22506 ) ) ( not ( = ?auto_22502 ?auto_22511 ) ) ( IS-CRATE ?auto_22491 ) ( not ( = ?auto_22525 ?auto_22504 ) ) ( HOIST-AT ?auto_22524 ?auto_22525 ) ( AVAILABLE ?auto_22524 ) ( SURFACE-AT ?auto_22491 ?auto_22525 ) ( ON ?auto_22491 ?auto_22518 ) ( CLEAR ?auto_22491 ) ( not ( = ?auto_22490 ?auto_22491 ) ) ( not ( = ?auto_22490 ?auto_22518 ) ) ( not ( = ?auto_22491 ?auto_22518 ) ) ( not ( = ?auto_22502 ?auto_22524 ) ) ( SURFACE-AT ?auto_22489 ?auto_22504 ) ( CLEAR ?auto_22489 ) ( IS-CRATE ?auto_22490 ) ( AVAILABLE ?auto_22502 ) ( not ( = ?auto_22520 ?auto_22504 ) ) ( HOIST-AT ?auto_22514 ?auto_22520 ) ( AVAILABLE ?auto_22514 ) ( SURFACE-AT ?auto_22490 ?auto_22520 ) ( ON ?auto_22490 ?auto_22513 ) ( CLEAR ?auto_22490 ) ( TRUCK-AT ?auto_22503 ?auto_22504 ) ( not ( = ?auto_22489 ?auto_22490 ) ) ( not ( = ?auto_22489 ?auto_22513 ) ) ( not ( = ?auto_22490 ?auto_22513 ) ) ( not ( = ?auto_22502 ?auto_22514 ) ) ( not ( = ?auto_22489 ?auto_22491 ) ) ( not ( = ?auto_22489 ?auto_22518 ) ) ( not ( = ?auto_22491 ?auto_22513 ) ) ( not ( = ?auto_22525 ?auto_22520 ) ) ( not ( = ?auto_22524 ?auto_22514 ) ) ( not ( = ?auto_22518 ?auto_22513 ) ) ( not ( = ?auto_22489 ?auto_22492 ) ) ( not ( = ?auto_22489 ?auto_22506 ) ) ( not ( = ?auto_22490 ?auto_22492 ) ) ( not ( = ?auto_22490 ?auto_22506 ) ) ( not ( = ?auto_22492 ?auto_22518 ) ) ( not ( = ?auto_22492 ?auto_22513 ) ) ( not ( = ?auto_22516 ?auto_22525 ) ) ( not ( = ?auto_22516 ?auto_22520 ) ) ( not ( = ?auto_22511 ?auto_22524 ) ) ( not ( = ?auto_22511 ?auto_22514 ) ) ( not ( = ?auto_22506 ?auto_22518 ) ) ( not ( = ?auto_22506 ?auto_22513 ) ) ( not ( = ?auto_22489 ?auto_22493 ) ) ( not ( = ?auto_22489 ?auto_22509 ) ) ( not ( = ?auto_22490 ?auto_22493 ) ) ( not ( = ?auto_22490 ?auto_22509 ) ) ( not ( = ?auto_22491 ?auto_22493 ) ) ( not ( = ?auto_22491 ?auto_22509 ) ) ( not ( = ?auto_22493 ?auto_22506 ) ) ( not ( = ?auto_22493 ?auto_22518 ) ) ( not ( = ?auto_22493 ?auto_22513 ) ) ( not ( = ?auto_22505 ?auto_22516 ) ) ( not ( = ?auto_22505 ?auto_22525 ) ) ( not ( = ?auto_22505 ?auto_22520 ) ) ( not ( = ?auto_22500 ?auto_22511 ) ) ( not ( = ?auto_22500 ?auto_22524 ) ) ( not ( = ?auto_22500 ?auto_22514 ) ) ( not ( = ?auto_22509 ?auto_22506 ) ) ( not ( = ?auto_22509 ?auto_22518 ) ) ( not ( = ?auto_22509 ?auto_22513 ) ) ( not ( = ?auto_22489 ?auto_22494 ) ) ( not ( = ?auto_22489 ?auto_22507 ) ) ( not ( = ?auto_22490 ?auto_22494 ) ) ( not ( = ?auto_22490 ?auto_22507 ) ) ( not ( = ?auto_22491 ?auto_22494 ) ) ( not ( = ?auto_22491 ?auto_22507 ) ) ( not ( = ?auto_22492 ?auto_22494 ) ) ( not ( = ?auto_22492 ?auto_22507 ) ) ( not ( = ?auto_22494 ?auto_22509 ) ) ( not ( = ?auto_22494 ?auto_22506 ) ) ( not ( = ?auto_22494 ?auto_22518 ) ) ( not ( = ?auto_22494 ?auto_22513 ) ) ( not ( = ?auto_22512 ?auto_22505 ) ) ( not ( = ?auto_22512 ?auto_22516 ) ) ( not ( = ?auto_22512 ?auto_22525 ) ) ( not ( = ?auto_22512 ?auto_22520 ) ) ( not ( = ?auto_22527 ?auto_22500 ) ) ( not ( = ?auto_22527 ?auto_22511 ) ) ( not ( = ?auto_22527 ?auto_22524 ) ) ( not ( = ?auto_22527 ?auto_22514 ) ) ( not ( = ?auto_22507 ?auto_22509 ) ) ( not ( = ?auto_22507 ?auto_22506 ) ) ( not ( = ?auto_22507 ?auto_22518 ) ) ( not ( = ?auto_22507 ?auto_22513 ) ) ( not ( = ?auto_22489 ?auto_22495 ) ) ( not ( = ?auto_22489 ?auto_22528 ) ) ( not ( = ?auto_22490 ?auto_22495 ) ) ( not ( = ?auto_22490 ?auto_22528 ) ) ( not ( = ?auto_22491 ?auto_22495 ) ) ( not ( = ?auto_22491 ?auto_22528 ) ) ( not ( = ?auto_22492 ?auto_22495 ) ) ( not ( = ?auto_22492 ?auto_22528 ) ) ( not ( = ?auto_22493 ?auto_22495 ) ) ( not ( = ?auto_22493 ?auto_22528 ) ) ( not ( = ?auto_22495 ?auto_22507 ) ) ( not ( = ?auto_22495 ?auto_22509 ) ) ( not ( = ?auto_22495 ?auto_22506 ) ) ( not ( = ?auto_22495 ?auto_22518 ) ) ( not ( = ?auto_22495 ?auto_22513 ) ) ( not ( = ?auto_22517 ?auto_22512 ) ) ( not ( = ?auto_22517 ?auto_22505 ) ) ( not ( = ?auto_22517 ?auto_22516 ) ) ( not ( = ?auto_22517 ?auto_22525 ) ) ( not ( = ?auto_22517 ?auto_22520 ) ) ( not ( = ?auto_22510 ?auto_22527 ) ) ( not ( = ?auto_22510 ?auto_22500 ) ) ( not ( = ?auto_22510 ?auto_22511 ) ) ( not ( = ?auto_22510 ?auto_22524 ) ) ( not ( = ?auto_22510 ?auto_22514 ) ) ( not ( = ?auto_22528 ?auto_22507 ) ) ( not ( = ?auto_22528 ?auto_22509 ) ) ( not ( = ?auto_22528 ?auto_22506 ) ) ( not ( = ?auto_22528 ?auto_22518 ) ) ( not ( = ?auto_22528 ?auto_22513 ) ) ( not ( = ?auto_22489 ?auto_22496 ) ) ( not ( = ?auto_22489 ?auto_22522 ) ) ( not ( = ?auto_22490 ?auto_22496 ) ) ( not ( = ?auto_22490 ?auto_22522 ) ) ( not ( = ?auto_22491 ?auto_22496 ) ) ( not ( = ?auto_22491 ?auto_22522 ) ) ( not ( = ?auto_22492 ?auto_22496 ) ) ( not ( = ?auto_22492 ?auto_22522 ) ) ( not ( = ?auto_22493 ?auto_22496 ) ) ( not ( = ?auto_22493 ?auto_22522 ) ) ( not ( = ?auto_22494 ?auto_22496 ) ) ( not ( = ?auto_22494 ?auto_22522 ) ) ( not ( = ?auto_22496 ?auto_22528 ) ) ( not ( = ?auto_22496 ?auto_22507 ) ) ( not ( = ?auto_22496 ?auto_22509 ) ) ( not ( = ?auto_22496 ?auto_22506 ) ) ( not ( = ?auto_22496 ?auto_22518 ) ) ( not ( = ?auto_22496 ?auto_22513 ) ) ( not ( = ?auto_22523 ?auto_22517 ) ) ( not ( = ?auto_22523 ?auto_22512 ) ) ( not ( = ?auto_22523 ?auto_22505 ) ) ( not ( = ?auto_22523 ?auto_22516 ) ) ( not ( = ?auto_22523 ?auto_22525 ) ) ( not ( = ?auto_22523 ?auto_22520 ) ) ( not ( = ?auto_22519 ?auto_22510 ) ) ( not ( = ?auto_22519 ?auto_22527 ) ) ( not ( = ?auto_22519 ?auto_22500 ) ) ( not ( = ?auto_22519 ?auto_22511 ) ) ( not ( = ?auto_22519 ?auto_22524 ) ) ( not ( = ?auto_22519 ?auto_22514 ) ) ( not ( = ?auto_22522 ?auto_22528 ) ) ( not ( = ?auto_22522 ?auto_22507 ) ) ( not ( = ?auto_22522 ?auto_22509 ) ) ( not ( = ?auto_22522 ?auto_22506 ) ) ( not ( = ?auto_22522 ?auto_22518 ) ) ( not ( = ?auto_22522 ?auto_22513 ) ) ( not ( = ?auto_22489 ?auto_22497 ) ) ( not ( = ?auto_22489 ?auto_22508 ) ) ( not ( = ?auto_22490 ?auto_22497 ) ) ( not ( = ?auto_22490 ?auto_22508 ) ) ( not ( = ?auto_22491 ?auto_22497 ) ) ( not ( = ?auto_22491 ?auto_22508 ) ) ( not ( = ?auto_22492 ?auto_22497 ) ) ( not ( = ?auto_22492 ?auto_22508 ) ) ( not ( = ?auto_22493 ?auto_22497 ) ) ( not ( = ?auto_22493 ?auto_22508 ) ) ( not ( = ?auto_22494 ?auto_22497 ) ) ( not ( = ?auto_22494 ?auto_22508 ) ) ( not ( = ?auto_22495 ?auto_22497 ) ) ( not ( = ?auto_22495 ?auto_22508 ) ) ( not ( = ?auto_22497 ?auto_22522 ) ) ( not ( = ?auto_22497 ?auto_22528 ) ) ( not ( = ?auto_22497 ?auto_22507 ) ) ( not ( = ?auto_22497 ?auto_22509 ) ) ( not ( = ?auto_22497 ?auto_22506 ) ) ( not ( = ?auto_22497 ?auto_22518 ) ) ( not ( = ?auto_22497 ?auto_22513 ) ) ( not ( = ?auto_22508 ?auto_22522 ) ) ( not ( = ?auto_22508 ?auto_22528 ) ) ( not ( = ?auto_22508 ?auto_22507 ) ) ( not ( = ?auto_22508 ?auto_22509 ) ) ( not ( = ?auto_22508 ?auto_22506 ) ) ( not ( = ?auto_22508 ?auto_22518 ) ) ( not ( = ?auto_22508 ?auto_22513 ) ) ( not ( = ?auto_22489 ?auto_22498 ) ) ( not ( = ?auto_22489 ?auto_22521 ) ) ( not ( = ?auto_22490 ?auto_22498 ) ) ( not ( = ?auto_22490 ?auto_22521 ) ) ( not ( = ?auto_22491 ?auto_22498 ) ) ( not ( = ?auto_22491 ?auto_22521 ) ) ( not ( = ?auto_22492 ?auto_22498 ) ) ( not ( = ?auto_22492 ?auto_22521 ) ) ( not ( = ?auto_22493 ?auto_22498 ) ) ( not ( = ?auto_22493 ?auto_22521 ) ) ( not ( = ?auto_22494 ?auto_22498 ) ) ( not ( = ?auto_22494 ?auto_22521 ) ) ( not ( = ?auto_22495 ?auto_22498 ) ) ( not ( = ?auto_22495 ?auto_22521 ) ) ( not ( = ?auto_22496 ?auto_22498 ) ) ( not ( = ?auto_22496 ?auto_22521 ) ) ( not ( = ?auto_22498 ?auto_22508 ) ) ( not ( = ?auto_22498 ?auto_22522 ) ) ( not ( = ?auto_22498 ?auto_22528 ) ) ( not ( = ?auto_22498 ?auto_22507 ) ) ( not ( = ?auto_22498 ?auto_22509 ) ) ( not ( = ?auto_22498 ?auto_22506 ) ) ( not ( = ?auto_22498 ?auto_22518 ) ) ( not ( = ?auto_22498 ?auto_22513 ) ) ( not ( = ?auto_22526 ?auto_22505 ) ) ( not ( = ?auto_22526 ?auto_22523 ) ) ( not ( = ?auto_22526 ?auto_22517 ) ) ( not ( = ?auto_22526 ?auto_22512 ) ) ( not ( = ?auto_22526 ?auto_22516 ) ) ( not ( = ?auto_22526 ?auto_22525 ) ) ( not ( = ?auto_22526 ?auto_22520 ) ) ( not ( = ?auto_22515 ?auto_22500 ) ) ( not ( = ?auto_22515 ?auto_22519 ) ) ( not ( = ?auto_22515 ?auto_22510 ) ) ( not ( = ?auto_22515 ?auto_22527 ) ) ( not ( = ?auto_22515 ?auto_22511 ) ) ( not ( = ?auto_22515 ?auto_22524 ) ) ( not ( = ?auto_22515 ?auto_22514 ) ) ( not ( = ?auto_22521 ?auto_22508 ) ) ( not ( = ?auto_22521 ?auto_22522 ) ) ( not ( = ?auto_22521 ?auto_22528 ) ) ( not ( = ?auto_22521 ?auto_22507 ) ) ( not ( = ?auto_22521 ?auto_22509 ) ) ( not ( = ?auto_22521 ?auto_22506 ) ) ( not ( = ?auto_22521 ?auto_22518 ) ) ( not ( = ?auto_22521 ?auto_22513 ) ) ( not ( = ?auto_22489 ?auto_22499 ) ) ( not ( = ?auto_22489 ?auto_22501 ) ) ( not ( = ?auto_22490 ?auto_22499 ) ) ( not ( = ?auto_22490 ?auto_22501 ) ) ( not ( = ?auto_22491 ?auto_22499 ) ) ( not ( = ?auto_22491 ?auto_22501 ) ) ( not ( = ?auto_22492 ?auto_22499 ) ) ( not ( = ?auto_22492 ?auto_22501 ) ) ( not ( = ?auto_22493 ?auto_22499 ) ) ( not ( = ?auto_22493 ?auto_22501 ) ) ( not ( = ?auto_22494 ?auto_22499 ) ) ( not ( = ?auto_22494 ?auto_22501 ) ) ( not ( = ?auto_22495 ?auto_22499 ) ) ( not ( = ?auto_22495 ?auto_22501 ) ) ( not ( = ?auto_22496 ?auto_22499 ) ) ( not ( = ?auto_22496 ?auto_22501 ) ) ( not ( = ?auto_22497 ?auto_22499 ) ) ( not ( = ?auto_22497 ?auto_22501 ) ) ( not ( = ?auto_22499 ?auto_22521 ) ) ( not ( = ?auto_22499 ?auto_22508 ) ) ( not ( = ?auto_22499 ?auto_22522 ) ) ( not ( = ?auto_22499 ?auto_22528 ) ) ( not ( = ?auto_22499 ?auto_22507 ) ) ( not ( = ?auto_22499 ?auto_22509 ) ) ( not ( = ?auto_22499 ?auto_22506 ) ) ( not ( = ?auto_22499 ?auto_22518 ) ) ( not ( = ?auto_22499 ?auto_22513 ) ) ( not ( = ?auto_22501 ?auto_22521 ) ) ( not ( = ?auto_22501 ?auto_22508 ) ) ( not ( = ?auto_22501 ?auto_22522 ) ) ( not ( = ?auto_22501 ?auto_22528 ) ) ( not ( = ?auto_22501 ?auto_22507 ) ) ( not ( = ?auto_22501 ?auto_22509 ) ) ( not ( = ?auto_22501 ?auto_22506 ) ) ( not ( = ?auto_22501 ?auto_22518 ) ) ( not ( = ?auto_22501 ?auto_22513 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_22489 ?auto_22490 ?auto_22491 ?auto_22492 ?auto_22493 ?auto_22494 ?auto_22495 ?auto_22496 ?auto_22497 ?auto_22498 )
      ( MAKE-1CRATE ?auto_22498 ?auto_22499 )
      ( MAKE-10CRATE-VERIFY ?auto_22489 ?auto_22490 ?auto_22491 ?auto_22492 ?auto_22493 ?auto_22494 ?auto_22495 ?auto_22496 ?auto_22497 ?auto_22498 ?auto_22499 ) )
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
      ?auto_22557 - SURFACE
      ?auto_22558 - SURFACE
      ?auto_22559 - SURFACE
      ?auto_22560 - SURFACE
      ?auto_22561 - SURFACE
      ?auto_22562 - SURFACE
    )
    :vars
    (
      ?auto_22565 - HOIST
      ?auto_22566 - PLACE
      ?auto_22564 - PLACE
      ?auto_22567 - HOIST
      ?auto_22563 - SURFACE
      ?auto_22588 - PLACE
      ?auto_22572 - HOIST
      ?auto_22581 - SURFACE
      ?auto_22593 - PLACE
      ?auto_22579 - HOIST
      ?auto_22570 - SURFACE
      ?auto_22582 - SURFACE
      ?auto_22577 - PLACE
      ?auto_22580 - HOIST
      ?auto_22590 - SURFACE
      ?auto_22591 - PLACE
      ?auto_22571 - HOIST
      ?auto_22574 - SURFACE
      ?auto_22584 - PLACE
      ?auto_22586 - HOIST
      ?auto_22569 - SURFACE
      ?auto_22576 - SURFACE
      ?auto_22578 - PLACE
      ?auto_22585 - HOIST
      ?auto_22575 - SURFACE
      ?auto_22573 - PLACE
      ?auto_22592 - HOIST
      ?auto_22583 - SURFACE
      ?auto_22589 - PLACE
      ?auto_22587 - HOIST
      ?auto_22594 - SURFACE
      ?auto_22568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22565 ?auto_22566 ) ( IS-CRATE ?auto_22562 ) ( not ( = ?auto_22564 ?auto_22566 ) ) ( HOIST-AT ?auto_22567 ?auto_22564 ) ( AVAILABLE ?auto_22567 ) ( SURFACE-AT ?auto_22562 ?auto_22564 ) ( ON ?auto_22562 ?auto_22563 ) ( CLEAR ?auto_22562 ) ( not ( = ?auto_22561 ?auto_22562 ) ) ( not ( = ?auto_22561 ?auto_22563 ) ) ( not ( = ?auto_22562 ?auto_22563 ) ) ( not ( = ?auto_22565 ?auto_22567 ) ) ( IS-CRATE ?auto_22561 ) ( not ( = ?auto_22588 ?auto_22566 ) ) ( HOIST-AT ?auto_22572 ?auto_22588 ) ( SURFACE-AT ?auto_22561 ?auto_22588 ) ( ON ?auto_22561 ?auto_22581 ) ( CLEAR ?auto_22561 ) ( not ( = ?auto_22560 ?auto_22561 ) ) ( not ( = ?auto_22560 ?auto_22581 ) ) ( not ( = ?auto_22561 ?auto_22581 ) ) ( not ( = ?auto_22565 ?auto_22572 ) ) ( IS-CRATE ?auto_22560 ) ( not ( = ?auto_22593 ?auto_22566 ) ) ( HOIST-AT ?auto_22579 ?auto_22593 ) ( AVAILABLE ?auto_22579 ) ( SURFACE-AT ?auto_22560 ?auto_22593 ) ( ON ?auto_22560 ?auto_22570 ) ( CLEAR ?auto_22560 ) ( not ( = ?auto_22559 ?auto_22560 ) ) ( not ( = ?auto_22559 ?auto_22570 ) ) ( not ( = ?auto_22560 ?auto_22570 ) ) ( not ( = ?auto_22565 ?auto_22579 ) ) ( IS-CRATE ?auto_22559 ) ( SURFACE-AT ?auto_22559 ?auto_22588 ) ( ON ?auto_22559 ?auto_22582 ) ( CLEAR ?auto_22559 ) ( not ( = ?auto_22558 ?auto_22559 ) ) ( not ( = ?auto_22558 ?auto_22582 ) ) ( not ( = ?auto_22559 ?auto_22582 ) ) ( IS-CRATE ?auto_22558 ) ( not ( = ?auto_22577 ?auto_22566 ) ) ( HOIST-AT ?auto_22580 ?auto_22577 ) ( AVAILABLE ?auto_22580 ) ( SURFACE-AT ?auto_22558 ?auto_22577 ) ( ON ?auto_22558 ?auto_22590 ) ( CLEAR ?auto_22558 ) ( not ( = ?auto_22557 ?auto_22558 ) ) ( not ( = ?auto_22557 ?auto_22590 ) ) ( not ( = ?auto_22558 ?auto_22590 ) ) ( not ( = ?auto_22565 ?auto_22580 ) ) ( IS-CRATE ?auto_22557 ) ( not ( = ?auto_22591 ?auto_22566 ) ) ( HOIST-AT ?auto_22571 ?auto_22591 ) ( AVAILABLE ?auto_22571 ) ( SURFACE-AT ?auto_22557 ?auto_22591 ) ( ON ?auto_22557 ?auto_22574 ) ( CLEAR ?auto_22557 ) ( not ( = ?auto_22556 ?auto_22557 ) ) ( not ( = ?auto_22556 ?auto_22574 ) ) ( not ( = ?auto_22557 ?auto_22574 ) ) ( not ( = ?auto_22565 ?auto_22571 ) ) ( IS-CRATE ?auto_22556 ) ( not ( = ?auto_22584 ?auto_22566 ) ) ( HOIST-AT ?auto_22586 ?auto_22584 ) ( AVAILABLE ?auto_22586 ) ( SURFACE-AT ?auto_22556 ?auto_22584 ) ( ON ?auto_22556 ?auto_22569 ) ( CLEAR ?auto_22556 ) ( not ( = ?auto_22555 ?auto_22556 ) ) ( not ( = ?auto_22555 ?auto_22569 ) ) ( not ( = ?auto_22556 ?auto_22569 ) ) ( not ( = ?auto_22565 ?auto_22586 ) ) ( IS-CRATE ?auto_22555 ) ( AVAILABLE ?auto_22572 ) ( SURFACE-AT ?auto_22555 ?auto_22588 ) ( ON ?auto_22555 ?auto_22576 ) ( CLEAR ?auto_22555 ) ( not ( = ?auto_22554 ?auto_22555 ) ) ( not ( = ?auto_22554 ?auto_22576 ) ) ( not ( = ?auto_22555 ?auto_22576 ) ) ( IS-CRATE ?auto_22554 ) ( not ( = ?auto_22578 ?auto_22566 ) ) ( HOIST-AT ?auto_22585 ?auto_22578 ) ( AVAILABLE ?auto_22585 ) ( SURFACE-AT ?auto_22554 ?auto_22578 ) ( ON ?auto_22554 ?auto_22575 ) ( CLEAR ?auto_22554 ) ( not ( = ?auto_22553 ?auto_22554 ) ) ( not ( = ?auto_22553 ?auto_22575 ) ) ( not ( = ?auto_22554 ?auto_22575 ) ) ( not ( = ?auto_22565 ?auto_22585 ) ) ( IS-CRATE ?auto_22553 ) ( not ( = ?auto_22573 ?auto_22566 ) ) ( HOIST-AT ?auto_22592 ?auto_22573 ) ( AVAILABLE ?auto_22592 ) ( SURFACE-AT ?auto_22553 ?auto_22573 ) ( ON ?auto_22553 ?auto_22583 ) ( CLEAR ?auto_22553 ) ( not ( = ?auto_22552 ?auto_22553 ) ) ( not ( = ?auto_22552 ?auto_22583 ) ) ( not ( = ?auto_22553 ?auto_22583 ) ) ( not ( = ?auto_22565 ?auto_22592 ) ) ( SURFACE-AT ?auto_22551 ?auto_22566 ) ( CLEAR ?auto_22551 ) ( IS-CRATE ?auto_22552 ) ( AVAILABLE ?auto_22565 ) ( not ( = ?auto_22589 ?auto_22566 ) ) ( HOIST-AT ?auto_22587 ?auto_22589 ) ( AVAILABLE ?auto_22587 ) ( SURFACE-AT ?auto_22552 ?auto_22589 ) ( ON ?auto_22552 ?auto_22594 ) ( CLEAR ?auto_22552 ) ( TRUCK-AT ?auto_22568 ?auto_22566 ) ( not ( = ?auto_22551 ?auto_22552 ) ) ( not ( = ?auto_22551 ?auto_22594 ) ) ( not ( = ?auto_22552 ?auto_22594 ) ) ( not ( = ?auto_22565 ?auto_22587 ) ) ( not ( = ?auto_22551 ?auto_22553 ) ) ( not ( = ?auto_22551 ?auto_22583 ) ) ( not ( = ?auto_22553 ?auto_22594 ) ) ( not ( = ?auto_22573 ?auto_22589 ) ) ( not ( = ?auto_22592 ?auto_22587 ) ) ( not ( = ?auto_22583 ?auto_22594 ) ) ( not ( = ?auto_22551 ?auto_22554 ) ) ( not ( = ?auto_22551 ?auto_22575 ) ) ( not ( = ?auto_22552 ?auto_22554 ) ) ( not ( = ?auto_22552 ?auto_22575 ) ) ( not ( = ?auto_22554 ?auto_22583 ) ) ( not ( = ?auto_22554 ?auto_22594 ) ) ( not ( = ?auto_22578 ?auto_22573 ) ) ( not ( = ?auto_22578 ?auto_22589 ) ) ( not ( = ?auto_22585 ?auto_22592 ) ) ( not ( = ?auto_22585 ?auto_22587 ) ) ( not ( = ?auto_22575 ?auto_22583 ) ) ( not ( = ?auto_22575 ?auto_22594 ) ) ( not ( = ?auto_22551 ?auto_22555 ) ) ( not ( = ?auto_22551 ?auto_22576 ) ) ( not ( = ?auto_22552 ?auto_22555 ) ) ( not ( = ?auto_22552 ?auto_22576 ) ) ( not ( = ?auto_22553 ?auto_22555 ) ) ( not ( = ?auto_22553 ?auto_22576 ) ) ( not ( = ?auto_22555 ?auto_22575 ) ) ( not ( = ?auto_22555 ?auto_22583 ) ) ( not ( = ?auto_22555 ?auto_22594 ) ) ( not ( = ?auto_22588 ?auto_22578 ) ) ( not ( = ?auto_22588 ?auto_22573 ) ) ( not ( = ?auto_22588 ?auto_22589 ) ) ( not ( = ?auto_22572 ?auto_22585 ) ) ( not ( = ?auto_22572 ?auto_22592 ) ) ( not ( = ?auto_22572 ?auto_22587 ) ) ( not ( = ?auto_22576 ?auto_22575 ) ) ( not ( = ?auto_22576 ?auto_22583 ) ) ( not ( = ?auto_22576 ?auto_22594 ) ) ( not ( = ?auto_22551 ?auto_22556 ) ) ( not ( = ?auto_22551 ?auto_22569 ) ) ( not ( = ?auto_22552 ?auto_22556 ) ) ( not ( = ?auto_22552 ?auto_22569 ) ) ( not ( = ?auto_22553 ?auto_22556 ) ) ( not ( = ?auto_22553 ?auto_22569 ) ) ( not ( = ?auto_22554 ?auto_22556 ) ) ( not ( = ?auto_22554 ?auto_22569 ) ) ( not ( = ?auto_22556 ?auto_22576 ) ) ( not ( = ?auto_22556 ?auto_22575 ) ) ( not ( = ?auto_22556 ?auto_22583 ) ) ( not ( = ?auto_22556 ?auto_22594 ) ) ( not ( = ?auto_22584 ?auto_22588 ) ) ( not ( = ?auto_22584 ?auto_22578 ) ) ( not ( = ?auto_22584 ?auto_22573 ) ) ( not ( = ?auto_22584 ?auto_22589 ) ) ( not ( = ?auto_22586 ?auto_22572 ) ) ( not ( = ?auto_22586 ?auto_22585 ) ) ( not ( = ?auto_22586 ?auto_22592 ) ) ( not ( = ?auto_22586 ?auto_22587 ) ) ( not ( = ?auto_22569 ?auto_22576 ) ) ( not ( = ?auto_22569 ?auto_22575 ) ) ( not ( = ?auto_22569 ?auto_22583 ) ) ( not ( = ?auto_22569 ?auto_22594 ) ) ( not ( = ?auto_22551 ?auto_22557 ) ) ( not ( = ?auto_22551 ?auto_22574 ) ) ( not ( = ?auto_22552 ?auto_22557 ) ) ( not ( = ?auto_22552 ?auto_22574 ) ) ( not ( = ?auto_22553 ?auto_22557 ) ) ( not ( = ?auto_22553 ?auto_22574 ) ) ( not ( = ?auto_22554 ?auto_22557 ) ) ( not ( = ?auto_22554 ?auto_22574 ) ) ( not ( = ?auto_22555 ?auto_22557 ) ) ( not ( = ?auto_22555 ?auto_22574 ) ) ( not ( = ?auto_22557 ?auto_22569 ) ) ( not ( = ?auto_22557 ?auto_22576 ) ) ( not ( = ?auto_22557 ?auto_22575 ) ) ( not ( = ?auto_22557 ?auto_22583 ) ) ( not ( = ?auto_22557 ?auto_22594 ) ) ( not ( = ?auto_22591 ?auto_22584 ) ) ( not ( = ?auto_22591 ?auto_22588 ) ) ( not ( = ?auto_22591 ?auto_22578 ) ) ( not ( = ?auto_22591 ?auto_22573 ) ) ( not ( = ?auto_22591 ?auto_22589 ) ) ( not ( = ?auto_22571 ?auto_22586 ) ) ( not ( = ?auto_22571 ?auto_22572 ) ) ( not ( = ?auto_22571 ?auto_22585 ) ) ( not ( = ?auto_22571 ?auto_22592 ) ) ( not ( = ?auto_22571 ?auto_22587 ) ) ( not ( = ?auto_22574 ?auto_22569 ) ) ( not ( = ?auto_22574 ?auto_22576 ) ) ( not ( = ?auto_22574 ?auto_22575 ) ) ( not ( = ?auto_22574 ?auto_22583 ) ) ( not ( = ?auto_22574 ?auto_22594 ) ) ( not ( = ?auto_22551 ?auto_22558 ) ) ( not ( = ?auto_22551 ?auto_22590 ) ) ( not ( = ?auto_22552 ?auto_22558 ) ) ( not ( = ?auto_22552 ?auto_22590 ) ) ( not ( = ?auto_22553 ?auto_22558 ) ) ( not ( = ?auto_22553 ?auto_22590 ) ) ( not ( = ?auto_22554 ?auto_22558 ) ) ( not ( = ?auto_22554 ?auto_22590 ) ) ( not ( = ?auto_22555 ?auto_22558 ) ) ( not ( = ?auto_22555 ?auto_22590 ) ) ( not ( = ?auto_22556 ?auto_22558 ) ) ( not ( = ?auto_22556 ?auto_22590 ) ) ( not ( = ?auto_22558 ?auto_22574 ) ) ( not ( = ?auto_22558 ?auto_22569 ) ) ( not ( = ?auto_22558 ?auto_22576 ) ) ( not ( = ?auto_22558 ?auto_22575 ) ) ( not ( = ?auto_22558 ?auto_22583 ) ) ( not ( = ?auto_22558 ?auto_22594 ) ) ( not ( = ?auto_22577 ?auto_22591 ) ) ( not ( = ?auto_22577 ?auto_22584 ) ) ( not ( = ?auto_22577 ?auto_22588 ) ) ( not ( = ?auto_22577 ?auto_22578 ) ) ( not ( = ?auto_22577 ?auto_22573 ) ) ( not ( = ?auto_22577 ?auto_22589 ) ) ( not ( = ?auto_22580 ?auto_22571 ) ) ( not ( = ?auto_22580 ?auto_22586 ) ) ( not ( = ?auto_22580 ?auto_22572 ) ) ( not ( = ?auto_22580 ?auto_22585 ) ) ( not ( = ?auto_22580 ?auto_22592 ) ) ( not ( = ?auto_22580 ?auto_22587 ) ) ( not ( = ?auto_22590 ?auto_22574 ) ) ( not ( = ?auto_22590 ?auto_22569 ) ) ( not ( = ?auto_22590 ?auto_22576 ) ) ( not ( = ?auto_22590 ?auto_22575 ) ) ( not ( = ?auto_22590 ?auto_22583 ) ) ( not ( = ?auto_22590 ?auto_22594 ) ) ( not ( = ?auto_22551 ?auto_22559 ) ) ( not ( = ?auto_22551 ?auto_22582 ) ) ( not ( = ?auto_22552 ?auto_22559 ) ) ( not ( = ?auto_22552 ?auto_22582 ) ) ( not ( = ?auto_22553 ?auto_22559 ) ) ( not ( = ?auto_22553 ?auto_22582 ) ) ( not ( = ?auto_22554 ?auto_22559 ) ) ( not ( = ?auto_22554 ?auto_22582 ) ) ( not ( = ?auto_22555 ?auto_22559 ) ) ( not ( = ?auto_22555 ?auto_22582 ) ) ( not ( = ?auto_22556 ?auto_22559 ) ) ( not ( = ?auto_22556 ?auto_22582 ) ) ( not ( = ?auto_22557 ?auto_22559 ) ) ( not ( = ?auto_22557 ?auto_22582 ) ) ( not ( = ?auto_22559 ?auto_22590 ) ) ( not ( = ?auto_22559 ?auto_22574 ) ) ( not ( = ?auto_22559 ?auto_22569 ) ) ( not ( = ?auto_22559 ?auto_22576 ) ) ( not ( = ?auto_22559 ?auto_22575 ) ) ( not ( = ?auto_22559 ?auto_22583 ) ) ( not ( = ?auto_22559 ?auto_22594 ) ) ( not ( = ?auto_22582 ?auto_22590 ) ) ( not ( = ?auto_22582 ?auto_22574 ) ) ( not ( = ?auto_22582 ?auto_22569 ) ) ( not ( = ?auto_22582 ?auto_22576 ) ) ( not ( = ?auto_22582 ?auto_22575 ) ) ( not ( = ?auto_22582 ?auto_22583 ) ) ( not ( = ?auto_22582 ?auto_22594 ) ) ( not ( = ?auto_22551 ?auto_22560 ) ) ( not ( = ?auto_22551 ?auto_22570 ) ) ( not ( = ?auto_22552 ?auto_22560 ) ) ( not ( = ?auto_22552 ?auto_22570 ) ) ( not ( = ?auto_22553 ?auto_22560 ) ) ( not ( = ?auto_22553 ?auto_22570 ) ) ( not ( = ?auto_22554 ?auto_22560 ) ) ( not ( = ?auto_22554 ?auto_22570 ) ) ( not ( = ?auto_22555 ?auto_22560 ) ) ( not ( = ?auto_22555 ?auto_22570 ) ) ( not ( = ?auto_22556 ?auto_22560 ) ) ( not ( = ?auto_22556 ?auto_22570 ) ) ( not ( = ?auto_22557 ?auto_22560 ) ) ( not ( = ?auto_22557 ?auto_22570 ) ) ( not ( = ?auto_22558 ?auto_22560 ) ) ( not ( = ?auto_22558 ?auto_22570 ) ) ( not ( = ?auto_22560 ?auto_22582 ) ) ( not ( = ?auto_22560 ?auto_22590 ) ) ( not ( = ?auto_22560 ?auto_22574 ) ) ( not ( = ?auto_22560 ?auto_22569 ) ) ( not ( = ?auto_22560 ?auto_22576 ) ) ( not ( = ?auto_22560 ?auto_22575 ) ) ( not ( = ?auto_22560 ?auto_22583 ) ) ( not ( = ?auto_22560 ?auto_22594 ) ) ( not ( = ?auto_22593 ?auto_22588 ) ) ( not ( = ?auto_22593 ?auto_22577 ) ) ( not ( = ?auto_22593 ?auto_22591 ) ) ( not ( = ?auto_22593 ?auto_22584 ) ) ( not ( = ?auto_22593 ?auto_22578 ) ) ( not ( = ?auto_22593 ?auto_22573 ) ) ( not ( = ?auto_22593 ?auto_22589 ) ) ( not ( = ?auto_22579 ?auto_22572 ) ) ( not ( = ?auto_22579 ?auto_22580 ) ) ( not ( = ?auto_22579 ?auto_22571 ) ) ( not ( = ?auto_22579 ?auto_22586 ) ) ( not ( = ?auto_22579 ?auto_22585 ) ) ( not ( = ?auto_22579 ?auto_22592 ) ) ( not ( = ?auto_22579 ?auto_22587 ) ) ( not ( = ?auto_22570 ?auto_22582 ) ) ( not ( = ?auto_22570 ?auto_22590 ) ) ( not ( = ?auto_22570 ?auto_22574 ) ) ( not ( = ?auto_22570 ?auto_22569 ) ) ( not ( = ?auto_22570 ?auto_22576 ) ) ( not ( = ?auto_22570 ?auto_22575 ) ) ( not ( = ?auto_22570 ?auto_22583 ) ) ( not ( = ?auto_22570 ?auto_22594 ) ) ( not ( = ?auto_22551 ?auto_22561 ) ) ( not ( = ?auto_22551 ?auto_22581 ) ) ( not ( = ?auto_22552 ?auto_22561 ) ) ( not ( = ?auto_22552 ?auto_22581 ) ) ( not ( = ?auto_22553 ?auto_22561 ) ) ( not ( = ?auto_22553 ?auto_22581 ) ) ( not ( = ?auto_22554 ?auto_22561 ) ) ( not ( = ?auto_22554 ?auto_22581 ) ) ( not ( = ?auto_22555 ?auto_22561 ) ) ( not ( = ?auto_22555 ?auto_22581 ) ) ( not ( = ?auto_22556 ?auto_22561 ) ) ( not ( = ?auto_22556 ?auto_22581 ) ) ( not ( = ?auto_22557 ?auto_22561 ) ) ( not ( = ?auto_22557 ?auto_22581 ) ) ( not ( = ?auto_22558 ?auto_22561 ) ) ( not ( = ?auto_22558 ?auto_22581 ) ) ( not ( = ?auto_22559 ?auto_22561 ) ) ( not ( = ?auto_22559 ?auto_22581 ) ) ( not ( = ?auto_22561 ?auto_22570 ) ) ( not ( = ?auto_22561 ?auto_22582 ) ) ( not ( = ?auto_22561 ?auto_22590 ) ) ( not ( = ?auto_22561 ?auto_22574 ) ) ( not ( = ?auto_22561 ?auto_22569 ) ) ( not ( = ?auto_22561 ?auto_22576 ) ) ( not ( = ?auto_22561 ?auto_22575 ) ) ( not ( = ?auto_22561 ?auto_22583 ) ) ( not ( = ?auto_22561 ?auto_22594 ) ) ( not ( = ?auto_22581 ?auto_22570 ) ) ( not ( = ?auto_22581 ?auto_22582 ) ) ( not ( = ?auto_22581 ?auto_22590 ) ) ( not ( = ?auto_22581 ?auto_22574 ) ) ( not ( = ?auto_22581 ?auto_22569 ) ) ( not ( = ?auto_22581 ?auto_22576 ) ) ( not ( = ?auto_22581 ?auto_22575 ) ) ( not ( = ?auto_22581 ?auto_22583 ) ) ( not ( = ?auto_22581 ?auto_22594 ) ) ( not ( = ?auto_22551 ?auto_22562 ) ) ( not ( = ?auto_22551 ?auto_22563 ) ) ( not ( = ?auto_22552 ?auto_22562 ) ) ( not ( = ?auto_22552 ?auto_22563 ) ) ( not ( = ?auto_22553 ?auto_22562 ) ) ( not ( = ?auto_22553 ?auto_22563 ) ) ( not ( = ?auto_22554 ?auto_22562 ) ) ( not ( = ?auto_22554 ?auto_22563 ) ) ( not ( = ?auto_22555 ?auto_22562 ) ) ( not ( = ?auto_22555 ?auto_22563 ) ) ( not ( = ?auto_22556 ?auto_22562 ) ) ( not ( = ?auto_22556 ?auto_22563 ) ) ( not ( = ?auto_22557 ?auto_22562 ) ) ( not ( = ?auto_22557 ?auto_22563 ) ) ( not ( = ?auto_22558 ?auto_22562 ) ) ( not ( = ?auto_22558 ?auto_22563 ) ) ( not ( = ?auto_22559 ?auto_22562 ) ) ( not ( = ?auto_22559 ?auto_22563 ) ) ( not ( = ?auto_22560 ?auto_22562 ) ) ( not ( = ?auto_22560 ?auto_22563 ) ) ( not ( = ?auto_22562 ?auto_22581 ) ) ( not ( = ?auto_22562 ?auto_22570 ) ) ( not ( = ?auto_22562 ?auto_22582 ) ) ( not ( = ?auto_22562 ?auto_22590 ) ) ( not ( = ?auto_22562 ?auto_22574 ) ) ( not ( = ?auto_22562 ?auto_22569 ) ) ( not ( = ?auto_22562 ?auto_22576 ) ) ( not ( = ?auto_22562 ?auto_22575 ) ) ( not ( = ?auto_22562 ?auto_22583 ) ) ( not ( = ?auto_22562 ?auto_22594 ) ) ( not ( = ?auto_22564 ?auto_22588 ) ) ( not ( = ?auto_22564 ?auto_22593 ) ) ( not ( = ?auto_22564 ?auto_22577 ) ) ( not ( = ?auto_22564 ?auto_22591 ) ) ( not ( = ?auto_22564 ?auto_22584 ) ) ( not ( = ?auto_22564 ?auto_22578 ) ) ( not ( = ?auto_22564 ?auto_22573 ) ) ( not ( = ?auto_22564 ?auto_22589 ) ) ( not ( = ?auto_22567 ?auto_22572 ) ) ( not ( = ?auto_22567 ?auto_22579 ) ) ( not ( = ?auto_22567 ?auto_22580 ) ) ( not ( = ?auto_22567 ?auto_22571 ) ) ( not ( = ?auto_22567 ?auto_22586 ) ) ( not ( = ?auto_22567 ?auto_22585 ) ) ( not ( = ?auto_22567 ?auto_22592 ) ) ( not ( = ?auto_22567 ?auto_22587 ) ) ( not ( = ?auto_22563 ?auto_22581 ) ) ( not ( = ?auto_22563 ?auto_22570 ) ) ( not ( = ?auto_22563 ?auto_22582 ) ) ( not ( = ?auto_22563 ?auto_22590 ) ) ( not ( = ?auto_22563 ?auto_22574 ) ) ( not ( = ?auto_22563 ?auto_22569 ) ) ( not ( = ?auto_22563 ?auto_22576 ) ) ( not ( = ?auto_22563 ?auto_22575 ) ) ( not ( = ?auto_22563 ?auto_22583 ) ) ( not ( = ?auto_22563 ?auto_22594 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_22551 ?auto_22552 ?auto_22553 ?auto_22554 ?auto_22555 ?auto_22556 ?auto_22557 ?auto_22558 ?auto_22559 ?auto_22560 ?auto_22561 )
      ( MAKE-1CRATE ?auto_22561 ?auto_22562 )
      ( MAKE-11CRATE-VERIFY ?auto_22551 ?auto_22552 ?auto_22553 ?auto_22554 ?auto_22555 ?auto_22556 ?auto_22557 ?auto_22558 ?auto_22559 ?auto_22560 ?auto_22561 ?auto_22562 ) )
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
      ?auto_22624 - SURFACE
      ?auto_22625 - SURFACE
      ?auto_22626 - SURFACE
      ?auto_22627 - SURFACE
      ?auto_22628 - SURFACE
      ?auto_22629 - SURFACE
      ?auto_22630 - SURFACE
    )
    :vars
    (
      ?auto_22632 - HOIST
      ?auto_22636 - PLACE
      ?auto_22634 - PLACE
      ?auto_22635 - HOIST
      ?auto_22631 - SURFACE
      ?auto_22652 - PLACE
      ?auto_22662 - HOIST
      ?auto_22663 - SURFACE
      ?auto_22660 - PLACE
      ?auto_22655 - HOIST
      ?auto_22643 - SURFACE
      ?auto_22637 - PLACE
      ?auto_22657 - HOIST
      ?auto_22642 - SURFACE
      ?auto_22656 - SURFACE
      ?auto_22649 - PLACE
      ?auto_22640 - HOIST
      ?auto_22644 - SURFACE
      ?auto_22659 - PLACE
      ?auto_22639 - HOIST
      ?auto_22661 - SURFACE
      ?auto_22641 - PLACE
      ?auto_22646 - HOIST
      ?auto_22651 - SURFACE
      ?auto_22648 - SURFACE
      ?auto_22658 - PLACE
      ?auto_22638 - HOIST
      ?auto_22645 - SURFACE
      ?auto_22653 - SURFACE
      ?auto_22650 - PLACE
      ?auto_22654 - HOIST
      ?auto_22647 - SURFACE
      ?auto_22633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22632 ?auto_22636 ) ( IS-CRATE ?auto_22630 ) ( not ( = ?auto_22634 ?auto_22636 ) ) ( HOIST-AT ?auto_22635 ?auto_22634 ) ( SURFACE-AT ?auto_22630 ?auto_22634 ) ( ON ?auto_22630 ?auto_22631 ) ( CLEAR ?auto_22630 ) ( not ( = ?auto_22629 ?auto_22630 ) ) ( not ( = ?auto_22629 ?auto_22631 ) ) ( not ( = ?auto_22630 ?auto_22631 ) ) ( not ( = ?auto_22632 ?auto_22635 ) ) ( IS-CRATE ?auto_22629 ) ( not ( = ?auto_22652 ?auto_22636 ) ) ( HOIST-AT ?auto_22662 ?auto_22652 ) ( AVAILABLE ?auto_22662 ) ( SURFACE-AT ?auto_22629 ?auto_22652 ) ( ON ?auto_22629 ?auto_22663 ) ( CLEAR ?auto_22629 ) ( not ( = ?auto_22628 ?auto_22629 ) ) ( not ( = ?auto_22628 ?auto_22663 ) ) ( not ( = ?auto_22629 ?auto_22663 ) ) ( not ( = ?auto_22632 ?auto_22662 ) ) ( IS-CRATE ?auto_22628 ) ( not ( = ?auto_22660 ?auto_22636 ) ) ( HOIST-AT ?auto_22655 ?auto_22660 ) ( SURFACE-AT ?auto_22628 ?auto_22660 ) ( ON ?auto_22628 ?auto_22643 ) ( CLEAR ?auto_22628 ) ( not ( = ?auto_22627 ?auto_22628 ) ) ( not ( = ?auto_22627 ?auto_22643 ) ) ( not ( = ?auto_22628 ?auto_22643 ) ) ( not ( = ?auto_22632 ?auto_22655 ) ) ( IS-CRATE ?auto_22627 ) ( not ( = ?auto_22637 ?auto_22636 ) ) ( HOIST-AT ?auto_22657 ?auto_22637 ) ( AVAILABLE ?auto_22657 ) ( SURFACE-AT ?auto_22627 ?auto_22637 ) ( ON ?auto_22627 ?auto_22642 ) ( CLEAR ?auto_22627 ) ( not ( = ?auto_22626 ?auto_22627 ) ) ( not ( = ?auto_22626 ?auto_22642 ) ) ( not ( = ?auto_22627 ?auto_22642 ) ) ( not ( = ?auto_22632 ?auto_22657 ) ) ( IS-CRATE ?auto_22626 ) ( SURFACE-AT ?auto_22626 ?auto_22660 ) ( ON ?auto_22626 ?auto_22656 ) ( CLEAR ?auto_22626 ) ( not ( = ?auto_22625 ?auto_22626 ) ) ( not ( = ?auto_22625 ?auto_22656 ) ) ( not ( = ?auto_22626 ?auto_22656 ) ) ( IS-CRATE ?auto_22625 ) ( not ( = ?auto_22649 ?auto_22636 ) ) ( HOIST-AT ?auto_22640 ?auto_22649 ) ( AVAILABLE ?auto_22640 ) ( SURFACE-AT ?auto_22625 ?auto_22649 ) ( ON ?auto_22625 ?auto_22644 ) ( CLEAR ?auto_22625 ) ( not ( = ?auto_22624 ?auto_22625 ) ) ( not ( = ?auto_22624 ?auto_22644 ) ) ( not ( = ?auto_22625 ?auto_22644 ) ) ( not ( = ?auto_22632 ?auto_22640 ) ) ( IS-CRATE ?auto_22624 ) ( not ( = ?auto_22659 ?auto_22636 ) ) ( HOIST-AT ?auto_22639 ?auto_22659 ) ( AVAILABLE ?auto_22639 ) ( SURFACE-AT ?auto_22624 ?auto_22659 ) ( ON ?auto_22624 ?auto_22661 ) ( CLEAR ?auto_22624 ) ( not ( = ?auto_22623 ?auto_22624 ) ) ( not ( = ?auto_22623 ?auto_22661 ) ) ( not ( = ?auto_22624 ?auto_22661 ) ) ( not ( = ?auto_22632 ?auto_22639 ) ) ( IS-CRATE ?auto_22623 ) ( not ( = ?auto_22641 ?auto_22636 ) ) ( HOIST-AT ?auto_22646 ?auto_22641 ) ( AVAILABLE ?auto_22646 ) ( SURFACE-AT ?auto_22623 ?auto_22641 ) ( ON ?auto_22623 ?auto_22651 ) ( CLEAR ?auto_22623 ) ( not ( = ?auto_22622 ?auto_22623 ) ) ( not ( = ?auto_22622 ?auto_22651 ) ) ( not ( = ?auto_22623 ?auto_22651 ) ) ( not ( = ?auto_22632 ?auto_22646 ) ) ( IS-CRATE ?auto_22622 ) ( AVAILABLE ?auto_22655 ) ( SURFACE-AT ?auto_22622 ?auto_22660 ) ( ON ?auto_22622 ?auto_22648 ) ( CLEAR ?auto_22622 ) ( not ( = ?auto_22621 ?auto_22622 ) ) ( not ( = ?auto_22621 ?auto_22648 ) ) ( not ( = ?auto_22622 ?auto_22648 ) ) ( IS-CRATE ?auto_22621 ) ( not ( = ?auto_22658 ?auto_22636 ) ) ( HOIST-AT ?auto_22638 ?auto_22658 ) ( AVAILABLE ?auto_22638 ) ( SURFACE-AT ?auto_22621 ?auto_22658 ) ( ON ?auto_22621 ?auto_22645 ) ( CLEAR ?auto_22621 ) ( not ( = ?auto_22620 ?auto_22621 ) ) ( not ( = ?auto_22620 ?auto_22645 ) ) ( not ( = ?auto_22621 ?auto_22645 ) ) ( not ( = ?auto_22632 ?auto_22638 ) ) ( IS-CRATE ?auto_22620 ) ( AVAILABLE ?auto_22635 ) ( SURFACE-AT ?auto_22620 ?auto_22634 ) ( ON ?auto_22620 ?auto_22653 ) ( CLEAR ?auto_22620 ) ( not ( = ?auto_22619 ?auto_22620 ) ) ( not ( = ?auto_22619 ?auto_22653 ) ) ( not ( = ?auto_22620 ?auto_22653 ) ) ( SURFACE-AT ?auto_22618 ?auto_22636 ) ( CLEAR ?auto_22618 ) ( IS-CRATE ?auto_22619 ) ( AVAILABLE ?auto_22632 ) ( not ( = ?auto_22650 ?auto_22636 ) ) ( HOIST-AT ?auto_22654 ?auto_22650 ) ( AVAILABLE ?auto_22654 ) ( SURFACE-AT ?auto_22619 ?auto_22650 ) ( ON ?auto_22619 ?auto_22647 ) ( CLEAR ?auto_22619 ) ( TRUCK-AT ?auto_22633 ?auto_22636 ) ( not ( = ?auto_22618 ?auto_22619 ) ) ( not ( = ?auto_22618 ?auto_22647 ) ) ( not ( = ?auto_22619 ?auto_22647 ) ) ( not ( = ?auto_22632 ?auto_22654 ) ) ( not ( = ?auto_22618 ?auto_22620 ) ) ( not ( = ?auto_22618 ?auto_22653 ) ) ( not ( = ?auto_22620 ?auto_22647 ) ) ( not ( = ?auto_22634 ?auto_22650 ) ) ( not ( = ?auto_22635 ?auto_22654 ) ) ( not ( = ?auto_22653 ?auto_22647 ) ) ( not ( = ?auto_22618 ?auto_22621 ) ) ( not ( = ?auto_22618 ?auto_22645 ) ) ( not ( = ?auto_22619 ?auto_22621 ) ) ( not ( = ?auto_22619 ?auto_22645 ) ) ( not ( = ?auto_22621 ?auto_22653 ) ) ( not ( = ?auto_22621 ?auto_22647 ) ) ( not ( = ?auto_22658 ?auto_22634 ) ) ( not ( = ?auto_22658 ?auto_22650 ) ) ( not ( = ?auto_22638 ?auto_22635 ) ) ( not ( = ?auto_22638 ?auto_22654 ) ) ( not ( = ?auto_22645 ?auto_22653 ) ) ( not ( = ?auto_22645 ?auto_22647 ) ) ( not ( = ?auto_22618 ?auto_22622 ) ) ( not ( = ?auto_22618 ?auto_22648 ) ) ( not ( = ?auto_22619 ?auto_22622 ) ) ( not ( = ?auto_22619 ?auto_22648 ) ) ( not ( = ?auto_22620 ?auto_22622 ) ) ( not ( = ?auto_22620 ?auto_22648 ) ) ( not ( = ?auto_22622 ?auto_22645 ) ) ( not ( = ?auto_22622 ?auto_22653 ) ) ( not ( = ?auto_22622 ?auto_22647 ) ) ( not ( = ?auto_22660 ?auto_22658 ) ) ( not ( = ?auto_22660 ?auto_22634 ) ) ( not ( = ?auto_22660 ?auto_22650 ) ) ( not ( = ?auto_22655 ?auto_22638 ) ) ( not ( = ?auto_22655 ?auto_22635 ) ) ( not ( = ?auto_22655 ?auto_22654 ) ) ( not ( = ?auto_22648 ?auto_22645 ) ) ( not ( = ?auto_22648 ?auto_22653 ) ) ( not ( = ?auto_22648 ?auto_22647 ) ) ( not ( = ?auto_22618 ?auto_22623 ) ) ( not ( = ?auto_22618 ?auto_22651 ) ) ( not ( = ?auto_22619 ?auto_22623 ) ) ( not ( = ?auto_22619 ?auto_22651 ) ) ( not ( = ?auto_22620 ?auto_22623 ) ) ( not ( = ?auto_22620 ?auto_22651 ) ) ( not ( = ?auto_22621 ?auto_22623 ) ) ( not ( = ?auto_22621 ?auto_22651 ) ) ( not ( = ?auto_22623 ?auto_22648 ) ) ( not ( = ?auto_22623 ?auto_22645 ) ) ( not ( = ?auto_22623 ?auto_22653 ) ) ( not ( = ?auto_22623 ?auto_22647 ) ) ( not ( = ?auto_22641 ?auto_22660 ) ) ( not ( = ?auto_22641 ?auto_22658 ) ) ( not ( = ?auto_22641 ?auto_22634 ) ) ( not ( = ?auto_22641 ?auto_22650 ) ) ( not ( = ?auto_22646 ?auto_22655 ) ) ( not ( = ?auto_22646 ?auto_22638 ) ) ( not ( = ?auto_22646 ?auto_22635 ) ) ( not ( = ?auto_22646 ?auto_22654 ) ) ( not ( = ?auto_22651 ?auto_22648 ) ) ( not ( = ?auto_22651 ?auto_22645 ) ) ( not ( = ?auto_22651 ?auto_22653 ) ) ( not ( = ?auto_22651 ?auto_22647 ) ) ( not ( = ?auto_22618 ?auto_22624 ) ) ( not ( = ?auto_22618 ?auto_22661 ) ) ( not ( = ?auto_22619 ?auto_22624 ) ) ( not ( = ?auto_22619 ?auto_22661 ) ) ( not ( = ?auto_22620 ?auto_22624 ) ) ( not ( = ?auto_22620 ?auto_22661 ) ) ( not ( = ?auto_22621 ?auto_22624 ) ) ( not ( = ?auto_22621 ?auto_22661 ) ) ( not ( = ?auto_22622 ?auto_22624 ) ) ( not ( = ?auto_22622 ?auto_22661 ) ) ( not ( = ?auto_22624 ?auto_22651 ) ) ( not ( = ?auto_22624 ?auto_22648 ) ) ( not ( = ?auto_22624 ?auto_22645 ) ) ( not ( = ?auto_22624 ?auto_22653 ) ) ( not ( = ?auto_22624 ?auto_22647 ) ) ( not ( = ?auto_22659 ?auto_22641 ) ) ( not ( = ?auto_22659 ?auto_22660 ) ) ( not ( = ?auto_22659 ?auto_22658 ) ) ( not ( = ?auto_22659 ?auto_22634 ) ) ( not ( = ?auto_22659 ?auto_22650 ) ) ( not ( = ?auto_22639 ?auto_22646 ) ) ( not ( = ?auto_22639 ?auto_22655 ) ) ( not ( = ?auto_22639 ?auto_22638 ) ) ( not ( = ?auto_22639 ?auto_22635 ) ) ( not ( = ?auto_22639 ?auto_22654 ) ) ( not ( = ?auto_22661 ?auto_22651 ) ) ( not ( = ?auto_22661 ?auto_22648 ) ) ( not ( = ?auto_22661 ?auto_22645 ) ) ( not ( = ?auto_22661 ?auto_22653 ) ) ( not ( = ?auto_22661 ?auto_22647 ) ) ( not ( = ?auto_22618 ?auto_22625 ) ) ( not ( = ?auto_22618 ?auto_22644 ) ) ( not ( = ?auto_22619 ?auto_22625 ) ) ( not ( = ?auto_22619 ?auto_22644 ) ) ( not ( = ?auto_22620 ?auto_22625 ) ) ( not ( = ?auto_22620 ?auto_22644 ) ) ( not ( = ?auto_22621 ?auto_22625 ) ) ( not ( = ?auto_22621 ?auto_22644 ) ) ( not ( = ?auto_22622 ?auto_22625 ) ) ( not ( = ?auto_22622 ?auto_22644 ) ) ( not ( = ?auto_22623 ?auto_22625 ) ) ( not ( = ?auto_22623 ?auto_22644 ) ) ( not ( = ?auto_22625 ?auto_22661 ) ) ( not ( = ?auto_22625 ?auto_22651 ) ) ( not ( = ?auto_22625 ?auto_22648 ) ) ( not ( = ?auto_22625 ?auto_22645 ) ) ( not ( = ?auto_22625 ?auto_22653 ) ) ( not ( = ?auto_22625 ?auto_22647 ) ) ( not ( = ?auto_22649 ?auto_22659 ) ) ( not ( = ?auto_22649 ?auto_22641 ) ) ( not ( = ?auto_22649 ?auto_22660 ) ) ( not ( = ?auto_22649 ?auto_22658 ) ) ( not ( = ?auto_22649 ?auto_22634 ) ) ( not ( = ?auto_22649 ?auto_22650 ) ) ( not ( = ?auto_22640 ?auto_22639 ) ) ( not ( = ?auto_22640 ?auto_22646 ) ) ( not ( = ?auto_22640 ?auto_22655 ) ) ( not ( = ?auto_22640 ?auto_22638 ) ) ( not ( = ?auto_22640 ?auto_22635 ) ) ( not ( = ?auto_22640 ?auto_22654 ) ) ( not ( = ?auto_22644 ?auto_22661 ) ) ( not ( = ?auto_22644 ?auto_22651 ) ) ( not ( = ?auto_22644 ?auto_22648 ) ) ( not ( = ?auto_22644 ?auto_22645 ) ) ( not ( = ?auto_22644 ?auto_22653 ) ) ( not ( = ?auto_22644 ?auto_22647 ) ) ( not ( = ?auto_22618 ?auto_22626 ) ) ( not ( = ?auto_22618 ?auto_22656 ) ) ( not ( = ?auto_22619 ?auto_22626 ) ) ( not ( = ?auto_22619 ?auto_22656 ) ) ( not ( = ?auto_22620 ?auto_22626 ) ) ( not ( = ?auto_22620 ?auto_22656 ) ) ( not ( = ?auto_22621 ?auto_22626 ) ) ( not ( = ?auto_22621 ?auto_22656 ) ) ( not ( = ?auto_22622 ?auto_22626 ) ) ( not ( = ?auto_22622 ?auto_22656 ) ) ( not ( = ?auto_22623 ?auto_22626 ) ) ( not ( = ?auto_22623 ?auto_22656 ) ) ( not ( = ?auto_22624 ?auto_22626 ) ) ( not ( = ?auto_22624 ?auto_22656 ) ) ( not ( = ?auto_22626 ?auto_22644 ) ) ( not ( = ?auto_22626 ?auto_22661 ) ) ( not ( = ?auto_22626 ?auto_22651 ) ) ( not ( = ?auto_22626 ?auto_22648 ) ) ( not ( = ?auto_22626 ?auto_22645 ) ) ( not ( = ?auto_22626 ?auto_22653 ) ) ( not ( = ?auto_22626 ?auto_22647 ) ) ( not ( = ?auto_22656 ?auto_22644 ) ) ( not ( = ?auto_22656 ?auto_22661 ) ) ( not ( = ?auto_22656 ?auto_22651 ) ) ( not ( = ?auto_22656 ?auto_22648 ) ) ( not ( = ?auto_22656 ?auto_22645 ) ) ( not ( = ?auto_22656 ?auto_22653 ) ) ( not ( = ?auto_22656 ?auto_22647 ) ) ( not ( = ?auto_22618 ?auto_22627 ) ) ( not ( = ?auto_22618 ?auto_22642 ) ) ( not ( = ?auto_22619 ?auto_22627 ) ) ( not ( = ?auto_22619 ?auto_22642 ) ) ( not ( = ?auto_22620 ?auto_22627 ) ) ( not ( = ?auto_22620 ?auto_22642 ) ) ( not ( = ?auto_22621 ?auto_22627 ) ) ( not ( = ?auto_22621 ?auto_22642 ) ) ( not ( = ?auto_22622 ?auto_22627 ) ) ( not ( = ?auto_22622 ?auto_22642 ) ) ( not ( = ?auto_22623 ?auto_22627 ) ) ( not ( = ?auto_22623 ?auto_22642 ) ) ( not ( = ?auto_22624 ?auto_22627 ) ) ( not ( = ?auto_22624 ?auto_22642 ) ) ( not ( = ?auto_22625 ?auto_22627 ) ) ( not ( = ?auto_22625 ?auto_22642 ) ) ( not ( = ?auto_22627 ?auto_22656 ) ) ( not ( = ?auto_22627 ?auto_22644 ) ) ( not ( = ?auto_22627 ?auto_22661 ) ) ( not ( = ?auto_22627 ?auto_22651 ) ) ( not ( = ?auto_22627 ?auto_22648 ) ) ( not ( = ?auto_22627 ?auto_22645 ) ) ( not ( = ?auto_22627 ?auto_22653 ) ) ( not ( = ?auto_22627 ?auto_22647 ) ) ( not ( = ?auto_22637 ?auto_22660 ) ) ( not ( = ?auto_22637 ?auto_22649 ) ) ( not ( = ?auto_22637 ?auto_22659 ) ) ( not ( = ?auto_22637 ?auto_22641 ) ) ( not ( = ?auto_22637 ?auto_22658 ) ) ( not ( = ?auto_22637 ?auto_22634 ) ) ( not ( = ?auto_22637 ?auto_22650 ) ) ( not ( = ?auto_22657 ?auto_22655 ) ) ( not ( = ?auto_22657 ?auto_22640 ) ) ( not ( = ?auto_22657 ?auto_22639 ) ) ( not ( = ?auto_22657 ?auto_22646 ) ) ( not ( = ?auto_22657 ?auto_22638 ) ) ( not ( = ?auto_22657 ?auto_22635 ) ) ( not ( = ?auto_22657 ?auto_22654 ) ) ( not ( = ?auto_22642 ?auto_22656 ) ) ( not ( = ?auto_22642 ?auto_22644 ) ) ( not ( = ?auto_22642 ?auto_22661 ) ) ( not ( = ?auto_22642 ?auto_22651 ) ) ( not ( = ?auto_22642 ?auto_22648 ) ) ( not ( = ?auto_22642 ?auto_22645 ) ) ( not ( = ?auto_22642 ?auto_22653 ) ) ( not ( = ?auto_22642 ?auto_22647 ) ) ( not ( = ?auto_22618 ?auto_22628 ) ) ( not ( = ?auto_22618 ?auto_22643 ) ) ( not ( = ?auto_22619 ?auto_22628 ) ) ( not ( = ?auto_22619 ?auto_22643 ) ) ( not ( = ?auto_22620 ?auto_22628 ) ) ( not ( = ?auto_22620 ?auto_22643 ) ) ( not ( = ?auto_22621 ?auto_22628 ) ) ( not ( = ?auto_22621 ?auto_22643 ) ) ( not ( = ?auto_22622 ?auto_22628 ) ) ( not ( = ?auto_22622 ?auto_22643 ) ) ( not ( = ?auto_22623 ?auto_22628 ) ) ( not ( = ?auto_22623 ?auto_22643 ) ) ( not ( = ?auto_22624 ?auto_22628 ) ) ( not ( = ?auto_22624 ?auto_22643 ) ) ( not ( = ?auto_22625 ?auto_22628 ) ) ( not ( = ?auto_22625 ?auto_22643 ) ) ( not ( = ?auto_22626 ?auto_22628 ) ) ( not ( = ?auto_22626 ?auto_22643 ) ) ( not ( = ?auto_22628 ?auto_22642 ) ) ( not ( = ?auto_22628 ?auto_22656 ) ) ( not ( = ?auto_22628 ?auto_22644 ) ) ( not ( = ?auto_22628 ?auto_22661 ) ) ( not ( = ?auto_22628 ?auto_22651 ) ) ( not ( = ?auto_22628 ?auto_22648 ) ) ( not ( = ?auto_22628 ?auto_22645 ) ) ( not ( = ?auto_22628 ?auto_22653 ) ) ( not ( = ?auto_22628 ?auto_22647 ) ) ( not ( = ?auto_22643 ?auto_22642 ) ) ( not ( = ?auto_22643 ?auto_22656 ) ) ( not ( = ?auto_22643 ?auto_22644 ) ) ( not ( = ?auto_22643 ?auto_22661 ) ) ( not ( = ?auto_22643 ?auto_22651 ) ) ( not ( = ?auto_22643 ?auto_22648 ) ) ( not ( = ?auto_22643 ?auto_22645 ) ) ( not ( = ?auto_22643 ?auto_22653 ) ) ( not ( = ?auto_22643 ?auto_22647 ) ) ( not ( = ?auto_22618 ?auto_22629 ) ) ( not ( = ?auto_22618 ?auto_22663 ) ) ( not ( = ?auto_22619 ?auto_22629 ) ) ( not ( = ?auto_22619 ?auto_22663 ) ) ( not ( = ?auto_22620 ?auto_22629 ) ) ( not ( = ?auto_22620 ?auto_22663 ) ) ( not ( = ?auto_22621 ?auto_22629 ) ) ( not ( = ?auto_22621 ?auto_22663 ) ) ( not ( = ?auto_22622 ?auto_22629 ) ) ( not ( = ?auto_22622 ?auto_22663 ) ) ( not ( = ?auto_22623 ?auto_22629 ) ) ( not ( = ?auto_22623 ?auto_22663 ) ) ( not ( = ?auto_22624 ?auto_22629 ) ) ( not ( = ?auto_22624 ?auto_22663 ) ) ( not ( = ?auto_22625 ?auto_22629 ) ) ( not ( = ?auto_22625 ?auto_22663 ) ) ( not ( = ?auto_22626 ?auto_22629 ) ) ( not ( = ?auto_22626 ?auto_22663 ) ) ( not ( = ?auto_22627 ?auto_22629 ) ) ( not ( = ?auto_22627 ?auto_22663 ) ) ( not ( = ?auto_22629 ?auto_22643 ) ) ( not ( = ?auto_22629 ?auto_22642 ) ) ( not ( = ?auto_22629 ?auto_22656 ) ) ( not ( = ?auto_22629 ?auto_22644 ) ) ( not ( = ?auto_22629 ?auto_22661 ) ) ( not ( = ?auto_22629 ?auto_22651 ) ) ( not ( = ?auto_22629 ?auto_22648 ) ) ( not ( = ?auto_22629 ?auto_22645 ) ) ( not ( = ?auto_22629 ?auto_22653 ) ) ( not ( = ?auto_22629 ?auto_22647 ) ) ( not ( = ?auto_22652 ?auto_22660 ) ) ( not ( = ?auto_22652 ?auto_22637 ) ) ( not ( = ?auto_22652 ?auto_22649 ) ) ( not ( = ?auto_22652 ?auto_22659 ) ) ( not ( = ?auto_22652 ?auto_22641 ) ) ( not ( = ?auto_22652 ?auto_22658 ) ) ( not ( = ?auto_22652 ?auto_22634 ) ) ( not ( = ?auto_22652 ?auto_22650 ) ) ( not ( = ?auto_22662 ?auto_22655 ) ) ( not ( = ?auto_22662 ?auto_22657 ) ) ( not ( = ?auto_22662 ?auto_22640 ) ) ( not ( = ?auto_22662 ?auto_22639 ) ) ( not ( = ?auto_22662 ?auto_22646 ) ) ( not ( = ?auto_22662 ?auto_22638 ) ) ( not ( = ?auto_22662 ?auto_22635 ) ) ( not ( = ?auto_22662 ?auto_22654 ) ) ( not ( = ?auto_22663 ?auto_22643 ) ) ( not ( = ?auto_22663 ?auto_22642 ) ) ( not ( = ?auto_22663 ?auto_22656 ) ) ( not ( = ?auto_22663 ?auto_22644 ) ) ( not ( = ?auto_22663 ?auto_22661 ) ) ( not ( = ?auto_22663 ?auto_22651 ) ) ( not ( = ?auto_22663 ?auto_22648 ) ) ( not ( = ?auto_22663 ?auto_22645 ) ) ( not ( = ?auto_22663 ?auto_22653 ) ) ( not ( = ?auto_22663 ?auto_22647 ) ) ( not ( = ?auto_22618 ?auto_22630 ) ) ( not ( = ?auto_22618 ?auto_22631 ) ) ( not ( = ?auto_22619 ?auto_22630 ) ) ( not ( = ?auto_22619 ?auto_22631 ) ) ( not ( = ?auto_22620 ?auto_22630 ) ) ( not ( = ?auto_22620 ?auto_22631 ) ) ( not ( = ?auto_22621 ?auto_22630 ) ) ( not ( = ?auto_22621 ?auto_22631 ) ) ( not ( = ?auto_22622 ?auto_22630 ) ) ( not ( = ?auto_22622 ?auto_22631 ) ) ( not ( = ?auto_22623 ?auto_22630 ) ) ( not ( = ?auto_22623 ?auto_22631 ) ) ( not ( = ?auto_22624 ?auto_22630 ) ) ( not ( = ?auto_22624 ?auto_22631 ) ) ( not ( = ?auto_22625 ?auto_22630 ) ) ( not ( = ?auto_22625 ?auto_22631 ) ) ( not ( = ?auto_22626 ?auto_22630 ) ) ( not ( = ?auto_22626 ?auto_22631 ) ) ( not ( = ?auto_22627 ?auto_22630 ) ) ( not ( = ?auto_22627 ?auto_22631 ) ) ( not ( = ?auto_22628 ?auto_22630 ) ) ( not ( = ?auto_22628 ?auto_22631 ) ) ( not ( = ?auto_22630 ?auto_22663 ) ) ( not ( = ?auto_22630 ?auto_22643 ) ) ( not ( = ?auto_22630 ?auto_22642 ) ) ( not ( = ?auto_22630 ?auto_22656 ) ) ( not ( = ?auto_22630 ?auto_22644 ) ) ( not ( = ?auto_22630 ?auto_22661 ) ) ( not ( = ?auto_22630 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22648 ) ) ( not ( = ?auto_22630 ?auto_22645 ) ) ( not ( = ?auto_22630 ?auto_22653 ) ) ( not ( = ?auto_22630 ?auto_22647 ) ) ( not ( = ?auto_22631 ?auto_22663 ) ) ( not ( = ?auto_22631 ?auto_22643 ) ) ( not ( = ?auto_22631 ?auto_22642 ) ) ( not ( = ?auto_22631 ?auto_22656 ) ) ( not ( = ?auto_22631 ?auto_22644 ) ) ( not ( = ?auto_22631 ?auto_22661 ) ) ( not ( = ?auto_22631 ?auto_22651 ) ) ( not ( = ?auto_22631 ?auto_22648 ) ) ( not ( = ?auto_22631 ?auto_22645 ) ) ( not ( = ?auto_22631 ?auto_22653 ) ) ( not ( = ?auto_22631 ?auto_22647 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_22618 ?auto_22619 ?auto_22620 ?auto_22621 ?auto_22622 ?auto_22623 ?auto_22624 ?auto_22625 ?auto_22626 ?auto_22627 ?auto_22628 ?auto_22629 )
      ( MAKE-1CRATE ?auto_22629 ?auto_22630 )
      ( MAKE-12CRATE-VERIFY ?auto_22618 ?auto_22619 ?auto_22620 ?auto_22621 ?auto_22622 ?auto_22623 ?auto_22624 ?auto_22625 ?auto_22626 ?auto_22627 ?auto_22628 ?auto_22629 ?auto_22630 ) )
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
      ?auto_22694 - SURFACE
      ?auto_22695 - SURFACE
      ?auto_22696 - SURFACE
      ?auto_22697 - SURFACE
      ?auto_22698 - SURFACE
      ?auto_22699 - SURFACE
      ?auto_22700 - SURFACE
      ?auto_22701 - SURFACE
    )
    :vars
    (
      ?auto_22703 - HOIST
      ?auto_22704 - PLACE
      ?auto_22702 - PLACE
      ?auto_22705 - HOIST
      ?auto_22707 - SURFACE
      ?auto_22712 - PLACE
      ?auto_22721 - HOIST
      ?auto_22732 - SURFACE
      ?auto_22713 - PLACE
      ?auto_22731 - HOIST
      ?auto_22727 - SURFACE
      ?auto_22717 - PLACE
      ?auto_22737 - HOIST
      ?auto_22728 - SURFACE
      ?auto_22734 - PLACE
      ?auto_22714 - HOIST
      ?auto_22718 - SURFACE
      ?auto_22726 - SURFACE
      ?auto_22729 - PLACE
      ?auto_22710 - HOIST
      ?auto_22722 - SURFACE
      ?auto_22724 - PLACE
      ?auto_22711 - HOIST
      ?auto_22730 - SURFACE
      ?auto_22708 - PLACE
      ?auto_22719 - HOIST
      ?auto_22725 - SURFACE
      ?auto_22709 - SURFACE
      ?auto_22720 - PLACE
      ?auto_22716 - HOIST
      ?auto_22715 - SURFACE
      ?auto_22736 - SURFACE
      ?auto_22735 - PLACE
      ?auto_22723 - HOIST
      ?auto_22733 - SURFACE
      ?auto_22706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22703 ?auto_22704 ) ( IS-CRATE ?auto_22701 ) ( not ( = ?auto_22702 ?auto_22704 ) ) ( HOIST-AT ?auto_22705 ?auto_22702 ) ( AVAILABLE ?auto_22705 ) ( SURFACE-AT ?auto_22701 ?auto_22702 ) ( ON ?auto_22701 ?auto_22707 ) ( CLEAR ?auto_22701 ) ( not ( = ?auto_22700 ?auto_22701 ) ) ( not ( = ?auto_22700 ?auto_22707 ) ) ( not ( = ?auto_22701 ?auto_22707 ) ) ( not ( = ?auto_22703 ?auto_22705 ) ) ( IS-CRATE ?auto_22700 ) ( not ( = ?auto_22712 ?auto_22704 ) ) ( HOIST-AT ?auto_22721 ?auto_22712 ) ( SURFACE-AT ?auto_22700 ?auto_22712 ) ( ON ?auto_22700 ?auto_22732 ) ( CLEAR ?auto_22700 ) ( not ( = ?auto_22699 ?auto_22700 ) ) ( not ( = ?auto_22699 ?auto_22732 ) ) ( not ( = ?auto_22700 ?auto_22732 ) ) ( not ( = ?auto_22703 ?auto_22721 ) ) ( IS-CRATE ?auto_22699 ) ( not ( = ?auto_22713 ?auto_22704 ) ) ( HOIST-AT ?auto_22731 ?auto_22713 ) ( AVAILABLE ?auto_22731 ) ( SURFACE-AT ?auto_22699 ?auto_22713 ) ( ON ?auto_22699 ?auto_22727 ) ( CLEAR ?auto_22699 ) ( not ( = ?auto_22698 ?auto_22699 ) ) ( not ( = ?auto_22698 ?auto_22727 ) ) ( not ( = ?auto_22699 ?auto_22727 ) ) ( not ( = ?auto_22703 ?auto_22731 ) ) ( IS-CRATE ?auto_22698 ) ( not ( = ?auto_22717 ?auto_22704 ) ) ( HOIST-AT ?auto_22737 ?auto_22717 ) ( SURFACE-AT ?auto_22698 ?auto_22717 ) ( ON ?auto_22698 ?auto_22728 ) ( CLEAR ?auto_22698 ) ( not ( = ?auto_22697 ?auto_22698 ) ) ( not ( = ?auto_22697 ?auto_22728 ) ) ( not ( = ?auto_22698 ?auto_22728 ) ) ( not ( = ?auto_22703 ?auto_22737 ) ) ( IS-CRATE ?auto_22697 ) ( not ( = ?auto_22734 ?auto_22704 ) ) ( HOIST-AT ?auto_22714 ?auto_22734 ) ( AVAILABLE ?auto_22714 ) ( SURFACE-AT ?auto_22697 ?auto_22734 ) ( ON ?auto_22697 ?auto_22718 ) ( CLEAR ?auto_22697 ) ( not ( = ?auto_22696 ?auto_22697 ) ) ( not ( = ?auto_22696 ?auto_22718 ) ) ( not ( = ?auto_22697 ?auto_22718 ) ) ( not ( = ?auto_22703 ?auto_22714 ) ) ( IS-CRATE ?auto_22696 ) ( SURFACE-AT ?auto_22696 ?auto_22717 ) ( ON ?auto_22696 ?auto_22726 ) ( CLEAR ?auto_22696 ) ( not ( = ?auto_22695 ?auto_22696 ) ) ( not ( = ?auto_22695 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22726 ) ) ( IS-CRATE ?auto_22695 ) ( not ( = ?auto_22729 ?auto_22704 ) ) ( HOIST-AT ?auto_22710 ?auto_22729 ) ( AVAILABLE ?auto_22710 ) ( SURFACE-AT ?auto_22695 ?auto_22729 ) ( ON ?auto_22695 ?auto_22722 ) ( CLEAR ?auto_22695 ) ( not ( = ?auto_22694 ?auto_22695 ) ) ( not ( = ?auto_22694 ?auto_22722 ) ) ( not ( = ?auto_22695 ?auto_22722 ) ) ( not ( = ?auto_22703 ?auto_22710 ) ) ( IS-CRATE ?auto_22694 ) ( not ( = ?auto_22724 ?auto_22704 ) ) ( HOIST-AT ?auto_22711 ?auto_22724 ) ( AVAILABLE ?auto_22711 ) ( SURFACE-AT ?auto_22694 ?auto_22724 ) ( ON ?auto_22694 ?auto_22730 ) ( CLEAR ?auto_22694 ) ( not ( = ?auto_22693 ?auto_22694 ) ) ( not ( = ?auto_22693 ?auto_22730 ) ) ( not ( = ?auto_22694 ?auto_22730 ) ) ( not ( = ?auto_22703 ?auto_22711 ) ) ( IS-CRATE ?auto_22693 ) ( not ( = ?auto_22708 ?auto_22704 ) ) ( HOIST-AT ?auto_22719 ?auto_22708 ) ( AVAILABLE ?auto_22719 ) ( SURFACE-AT ?auto_22693 ?auto_22708 ) ( ON ?auto_22693 ?auto_22725 ) ( CLEAR ?auto_22693 ) ( not ( = ?auto_22692 ?auto_22693 ) ) ( not ( = ?auto_22692 ?auto_22725 ) ) ( not ( = ?auto_22693 ?auto_22725 ) ) ( not ( = ?auto_22703 ?auto_22719 ) ) ( IS-CRATE ?auto_22692 ) ( AVAILABLE ?auto_22737 ) ( SURFACE-AT ?auto_22692 ?auto_22717 ) ( ON ?auto_22692 ?auto_22709 ) ( CLEAR ?auto_22692 ) ( not ( = ?auto_22691 ?auto_22692 ) ) ( not ( = ?auto_22691 ?auto_22709 ) ) ( not ( = ?auto_22692 ?auto_22709 ) ) ( IS-CRATE ?auto_22691 ) ( not ( = ?auto_22720 ?auto_22704 ) ) ( HOIST-AT ?auto_22716 ?auto_22720 ) ( AVAILABLE ?auto_22716 ) ( SURFACE-AT ?auto_22691 ?auto_22720 ) ( ON ?auto_22691 ?auto_22715 ) ( CLEAR ?auto_22691 ) ( not ( = ?auto_22690 ?auto_22691 ) ) ( not ( = ?auto_22690 ?auto_22715 ) ) ( not ( = ?auto_22691 ?auto_22715 ) ) ( not ( = ?auto_22703 ?auto_22716 ) ) ( IS-CRATE ?auto_22690 ) ( AVAILABLE ?auto_22721 ) ( SURFACE-AT ?auto_22690 ?auto_22712 ) ( ON ?auto_22690 ?auto_22736 ) ( CLEAR ?auto_22690 ) ( not ( = ?auto_22689 ?auto_22690 ) ) ( not ( = ?auto_22689 ?auto_22736 ) ) ( not ( = ?auto_22690 ?auto_22736 ) ) ( SURFACE-AT ?auto_22688 ?auto_22704 ) ( CLEAR ?auto_22688 ) ( IS-CRATE ?auto_22689 ) ( AVAILABLE ?auto_22703 ) ( not ( = ?auto_22735 ?auto_22704 ) ) ( HOIST-AT ?auto_22723 ?auto_22735 ) ( AVAILABLE ?auto_22723 ) ( SURFACE-AT ?auto_22689 ?auto_22735 ) ( ON ?auto_22689 ?auto_22733 ) ( CLEAR ?auto_22689 ) ( TRUCK-AT ?auto_22706 ?auto_22704 ) ( not ( = ?auto_22688 ?auto_22689 ) ) ( not ( = ?auto_22688 ?auto_22733 ) ) ( not ( = ?auto_22689 ?auto_22733 ) ) ( not ( = ?auto_22703 ?auto_22723 ) ) ( not ( = ?auto_22688 ?auto_22690 ) ) ( not ( = ?auto_22688 ?auto_22736 ) ) ( not ( = ?auto_22690 ?auto_22733 ) ) ( not ( = ?auto_22712 ?auto_22735 ) ) ( not ( = ?auto_22721 ?auto_22723 ) ) ( not ( = ?auto_22736 ?auto_22733 ) ) ( not ( = ?auto_22688 ?auto_22691 ) ) ( not ( = ?auto_22688 ?auto_22715 ) ) ( not ( = ?auto_22689 ?auto_22691 ) ) ( not ( = ?auto_22689 ?auto_22715 ) ) ( not ( = ?auto_22691 ?auto_22736 ) ) ( not ( = ?auto_22691 ?auto_22733 ) ) ( not ( = ?auto_22720 ?auto_22712 ) ) ( not ( = ?auto_22720 ?auto_22735 ) ) ( not ( = ?auto_22716 ?auto_22721 ) ) ( not ( = ?auto_22716 ?auto_22723 ) ) ( not ( = ?auto_22715 ?auto_22736 ) ) ( not ( = ?auto_22715 ?auto_22733 ) ) ( not ( = ?auto_22688 ?auto_22692 ) ) ( not ( = ?auto_22688 ?auto_22709 ) ) ( not ( = ?auto_22689 ?auto_22692 ) ) ( not ( = ?auto_22689 ?auto_22709 ) ) ( not ( = ?auto_22690 ?auto_22692 ) ) ( not ( = ?auto_22690 ?auto_22709 ) ) ( not ( = ?auto_22692 ?auto_22715 ) ) ( not ( = ?auto_22692 ?auto_22736 ) ) ( not ( = ?auto_22692 ?auto_22733 ) ) ( not ( = ?auto_22717 ?auto_22720 ) ) ( not ( = ?auto_22717 ?auto_22712 ) ) ( not ( = ?auto_22717 ?auto_22735 ) ) ( not ( = ?auto_22737 ?auto_22716 ) ) ( not ( = ?auto_22737 ?auto_22721 ) ) ( not ( = ?auto_22737 ?auto_22723 ) ) ( not ( = ?auto_22709 ?auto_22715 ) ) ( not ( = ?auto_22709 ?auto_22736 ) ) ( not ( = ?auto_22709 ?auto_22733 ) ) ( not ( = ?auto_22688 ?auto_22693 ) ) ( not ( = ?auto_22688 ?auto_22725 ) ) ( not ( = ?auto_22689 ?auto_22693 ) ) ( not ( = ?auto_22689 ?auto_22725 ) ) ( not ( = ?auto_22690 ?auto_22693 ) ) ( not ( = ?auto_22690 ?auto_22725 ) ) ( not ( = ?auto_22691 ?auto_22693 ) ) ( not ( = ?auto_22691 ?auto_22725 ) ) ( not ( = ?auto_22693 ?auto_22709 ) ) ( not ( = ?auto_22693 ?auto_22715 ) ) ( not ( = ?auto_22693 ?auto_22736 ) ) ( not ( = ?auto_22693 ?auto_22733 ) ) ( not ( = ?auto_22708 ?auto_22717 ) ) ( not ( = ?auto_22708 ?auto_22720 ) ) ( not ( = ?auto_22708 ?auto_22712 ) ) ( not ( = ?auto_22708 ?auto_22735 ) ) ( not ( = ?auto_22719 ?auto_22737 ) ) ( not ( = ?auto_22719 ?auto_22716 ) ) ( not ( = ?auto_22719 ?auto_22721 ) ) ( not ( = ?auto_22719 ?auto_22723 ) ) ( not ( = ?auto_22725 ?auto_22709 ) ) ( not ( = ?auto_22725 ?auto_22715 ) ) ( not ( = ?auto_22725 ?auto_22736 ) ) ( not ( = ?auto_22725 ?auto_22733 ) ) ( not ( = ?auto_22688 ?auto_22694 ) ) ( not ( = ?auto_22688 ?auto_22730 ) ) ( not ( = ?auto_22689 ?auto_22694 ) ) ( not ( = ?auto_22689 ?auto_22730 ) ) ( not ( = ?auto_22690 ?auto_22694 ) ) ( not ( = ?auto_22690 ?auto_22730 ) ) ( not ( = ?auto_22691 ?auto_22694 ) ) ( not ( = ?auto_22691 ?auto_22730 ) ) ( not ( = ?auto_22692 ?auto_22694 ) ) ( not ( = ?auto_22692 ?auto_22730 ) ) ( not ( = ?auto_22694 ?auto_22725 ) ) ( not ( = ?auto_22694 ?auto_22709 ) ) ( not ( = ?auto_22694 ?auto_22715 ) ) ( not ( = ?auto_22694 ?auto_22736 ) ) ( not ( = ?auto_22694 ?auto_22733 ) ) ( not ( = ?auto_22724 ?auto_22708 ) ) ( not ( = ?auto_22724 ?auto_22717 ) ) ( not ( = ?auto_22724 ?auto_22720 ) ) ( not ( = ?auto_22724 ?auto_22712 ) ) ( not ( = ?auto_22724 ?auto_22735 ) ) ( not ( = ?auto_22711 ?auto_22719 ) ) ( not ( = ?auto_22711 ?auto_22737 ) ) ( not ( = ?auto_22711 ?auto_22716 ) ) ( not ( = ?auto_22711 ?auto_22721 ) ) ( not ( = ?auto_22711 ?auto_22723 ) ) ( not ( = ?auto_22730 ?auto_22725 ) ) ( not ( = ?auto_22730 ?auto_22709 ) ) ( not ( = ?auto_22730 ?auto_22715 ) ) ( not ( = ?auto_22730 ?auto_22736 ) ) ( not ( = ?auto_22730 ?auto_22733 ) ) ( not ( = ?auto_22688 ?auto_22695 ) ) ( not ( = ?auto_22688 ?auto_22722 ) ) ( not ( = ?auto_22689 ?auto_22695 ) ) ( not ( = ?auto_22689 ?auto_22722 ) ) ( not ( = ?auto_22690 ?auto_22695 ) ) ( not ( = ?auto_22690 ?auto_22722 ) ) ( not ( = ?auto_22691 ?auto_22695 ) ) ( not ( = ?auto_22691 ?auto_22722 ) ) ( not ( = ?auto_22692 ?auto_22695 ) ) ( not ( = ?auto_22692 ?auto_22722 ) ) ( not ( = ?auto_22693 ?auto_22695 ) ) ( not ( = ?auto_22693 ?auto_22722 ) ) ( not ( = ?auto_22695 ?auto_22730 ) ) ( not ( = ?auto_22695 ?auto_22725 ) ) ( not ( = ?auto_22695 ?auto_22709 ) ) ( not ( = ?auto_22695 ?auto_22715 ) ) ( not ( = ?auto_22695 ?auto_22736 ) ) ( not ( = ?auto_22695 ?auto_22733 ) ) ( not ( = ?auto_22729 ?auto_22724 ) ) ( not ( = ?auto_22729 ?auto_22708 ) ) ( not ( = ?auto_22729 ?auto_22717 ) ) ( not ( = ?auto_22729 ?auto_22720 ) ) ( not ( = ?auto_22729 ?auto_22712 ) ) ( not ( = ?auto_22729 ?auto_22735 ) ) ( not ( = ?auto_22710 ?auto_22711 ) ) ( not ( = ?auto_22710 ?auto_22719 ) ) ( not ( = ?auto_22710 ?auto_22737 ) ) ( not ( = ?auto_22710 ?auto_22716 ) ) ( not ( = ?auto_22710 ?auto_22721 ) ) ( not ( = ?auto_22710 ?auto_22723 ) ) ( not ( = ?auto_22722 ?auto_22730 ) ) ( not ( = ?auto_22722 ?auto_22725 ) ) ( not ( = ?auto_22722 ?auto_22709 ) ) ( not ( = ?auto_22722 ?auto_22715 ) ) ( not ( = ?auto_22722 ?auto_22736 ) ) ( not ( = ?auto_22722 ?auto_22733 ) ) ( not ( = ?auto_22688 ?auto_22696 ) ) ( not ( = ?auto_22688 ?auto_22726 ) ) ( not ( = ?auto_22689 ?auto_22696 ) ) ( not ( = ?auto_22689 ?auto_22726 ) ) ( not ( = ?auto_22690 ?auto_22696 ) ) ( not ( = ?auto_22690 ?auto_22726 ) ) ( not ( = ?auto_22691 ?auto_22696 ) ) ( not ( = ?auto_22691 ?auto_22726 ) ) ( not ( = ?auto_22692 ?auto_22696 ) ) ( not ( = ?auto_22692 ?auto_22726 ) ) ( not ( = ?auto_22693 ?auto_22696 ) ) ( not ( = ?auto_22693 ?auto_22726 ) ) ( not ( = ?auto_22694 ?auto_22696 ) ) ( not ( = ?auto_22694 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22722 ) ) ( not ( = ?auto_22696 ?auto_22730 ) ) ( not ( = ?auto_22696 ?auto_22725 ) ) ( not ( = ?auto_22696 ?auto_22709 ) ) ( not ( = ?auto_22696 ?auto_22715 ) ) ( not ( = ?auto_22696 ?auto_22736 ) ) ( not ( = ?auto_22696 ?auto_22733 ) ) ( not ( = ?auto_22726 ?auto_22722 ) ) ( not ( = ?auto_22726 ?auto_22730 ) ) ( not ( = ?auto_22726 ?auto_22725 ) ) ( not ( = ?auto_22726 ?auto_22709 ) ) ( not ( = ?auto_22726 ?auto_22715 ) ) ( not ( = ?auto_22726 ?auto_22736 ) ) ( not ( = ?auto_22726 ?auto_22733 ) ) ( not ( = ?auto_22688 ?auto_22697 ) ) ( not ( = ?auto_22688 ?auto_22718 ) ) ( not ( = ?auto_22689 ?auto_22697 ) ) ( not ( = ?auto_22689 ?auto_22718 ) ) ( not ( = ?auto_22690 ?auto_22697 ) ) ( not ( = ?auto_22690 ?auto_22718 ) ) ( not ( = ?auto_22691 ?auto_22697 ) ) ( not ( = ?auto_22691 ?auto_22718 ) ) ( not ( = ?auto_22692 ?auto_22697 ) ) ( not ( = ?auto_22692 ?auto_22718 ) ) ( not ( = ?auto_22693 ?auto_22697 ) ) ( not ( = ?auto_22693 ?auto_22718 ) ) ( not ( = ?auto_22694 ?auto_22697 ) ) ( not ( = ?auto_22694 ?auto_22718 ) ) ( not ( = ?auto_22695 ?auto_22697 ) ) ( not ( = ?auto_22695 ?auto_22718 ) ) ( not ( = ?auto_22697 ?auto_22726 ) ) ( not ( = ?auto_22697 ?auto_22722 ) ) ( not ( = ?auto_22697 ?auto_22730 ) ) ( not ( = ?auto_22697 ?auto_22725 ) ) ( not ( = ?auto_22697 ?auto_22709 ) ) ( not ( = ?auto_22697 ?auto_22715 ) ) ( not ( = ?auto_22697 ?auto_22736 ) ) ( not ( = ?auto_22697 ?auto_22733 ) ) ( not ( = ?auto_22734 ?auto_22717 ) ) ( not ( = ?auto_22734 ?auto_22729 ) ) ( not ( = ?auto_22734 ?auto_22724 ) ) ( not ( = ?auto_22734 ?auto_22708 ) ) ( not ( = ?auto_22734 ?auto_22720 ) ) ( not ( = ?auto_22734 ?auto_22712 ) ) ( not ( = ?auto_22734 ?auto_22735 ) ) ( not ( = ?auto_22714 ?auto_22737 ) ) ( not ( = ?auto_22714 ?auto_22710 ) ) ( not ( = ?auto_22714 ?auto_22711 ) ) ( not ( = ?auto_22714 ?auto_22719 ) ) ( not ( = ?auto_22714 ?auto_22716 ) ) ( not ( = ?auto_22714 ?auto_22721 ) ) ( not ( = ?auto_22714 ?auto_22723 ) ) ( not ( = ?auto_22718 ?auto_22726 ) ) ( not ( = ?auto_22718 ?auto_22722 ) ) ( not ( = ?auto_22718 ?auto_22730 ) ) ( not ( = ?auto_22718 ?auto_22725 ) ) ( not ( = ?auto_22718 ?auto_22709 ) ) ( not ( = ?auto_22718 ?auto_22715 ) ) ( not ( = ?auto_22718 ?auto_22736 ) ) ( not ( = ?auto_22718 ?auto_22733 ) ) ( not ( = ?auto_22688 ?auto_22698 ) ) ( not ( = ?auto_22688 ?auto_22728 ) ) ( not ( = ?auto_22689 ?auto_22698 ) ) ( not ( = ?auto_22689 ?auto_22728 ) ) ( not ( = ?auto_22690 ?auto_22698 ) ) ( not ( = ?auto_22690 ?auto_22728 ) ) ( not ( = ?auto_22691 ?auto_22698 ) ) ( not ( = ?auto_22691 ?auto_22728 ) ) ( not ( = ?auto_22692 ?auto_22698 ) ) ( not ( = ?auto_22692 ?auto_22728 ) ) ( not ( = ?auto_22693 ?auto_22698 ) ) ( not ( = ?auto_22693 ?auto_22728 ) ) ( not ( = ?auto_22694 ?auto_22698 ) ) ( not ( = ?auto_22694 ?auto_22728 ) ) ( not ( = ?auto_22695 ?auto_22698 ) ) ( not ( = ?auto_22695 ?auto_22728 ) ) ( not ( = ?auto_22696 ?auto_22698 ) ) ( not ( = ?auto_22696 ?auto_22728 ) ) ( not ( = ?auto_22698 ?auto_22718 ) ) ( not ( = ?auto_22698 ?auto_22726 ) ) ( not ( = ?auto_22698 ?auto_22722 ) ) ( not ( = ?auto_22698 ?auto_22730 ) ) ( not ( = ?auto_22698 ?auto_22725 ) ) ( not ( = ?auto_22698 ?auto_22709 ) ) ( not ( = ?auto_22698 ?auto_22715 ) ) ( not ( = ?auto_22698 ?auto_22736 ) ) ( not ( = ?auto_22698 ?auto_22733 ) ) ( not ( = ?auto_22728 ?auto_22718 ) ) ( not ( = ?auto_22728 ?auto_22726 ) ) ( not ( = ?auto_22728 ?auto_22722 ) ) ( not ( = ?auto_22728 ?auto_22730 ) ) ( not ( = ?auto_22728 ?auto_22725 ) ) ( not ( = ?auto_22728 ?auto_22709 ) ) ( not ( = ?auto_22728 ?auto_22715 ) ) ( not ( = ?auto_22728 ?auto_22736 ) ) ( not ( = ?auto_22728 ?auto_22733 ) ) ( not ( = ?auto_22688 ?auto_22699 ) ) ( not ( = ?auto_22688 ?auto_22727 ) ) ( not ( = ?auto_22689 ?auto_22699 ) ) ( not ( = ?auto_22689 ?auto_22727 ) ) ( not ( = ?auto_22690 ?auto_22699 ) ) ( not ( = ?auto_22690 ?auto_22727 ) ) ( not ( = ?auto_22691 ?auto_22699 ) ) ( not ( = ?auto_22691 ?auto_22727 ) ) ( not ( = ?auto_22692 ?auto_22699 ) ) ( not ( = ?auto_22692 ?auto_22727 ) ) ( not ( = ?auto_22693 ?auto_22699 ) ) ( not ( = ?auto_22693 ?auto_22727 ) ) ( not ( = ?auto_22694 ?auto_22699 ) ) ( not ( = ?auto_22694 ?auto_22727 ) ) ( not ( = ?auto_22695 ?auto_22699 ) ) ( not ( = ?auto_22695 ?auto_22727 ) ) ( not ( = ?auto_22696 ?auto_22699 ) ) ( not ( = ?auto_22696 ?auto_22727 ) ) ( not ( = ?auto_22697 ?auto_22699 ) ) ( not ( = ?auto_22697 ?auto_22727 ) ) ( not ( = ?auto_22699 ?auto_22728 ) ) ( not ( = ?auto_22699 ?auto_22718 ) ) ( not ( = ?auto_22699 ?auto_22726 ) ) ( not ( = ?auto_22699 ?auto_22722 ) ) ( not ( = ?auto_22699 ?auto_22730 ) ) ( not ( = ?auto_22699 ?auto_22725 ) ) ( not ( = ?auto_22699 ?auto_22709 ) ) ( not ( = ?auto_22699 ?auto_22715 ) ) ( not ( = ?auto_22699 ?auto_22736 ) ) ( not ( = ?auto_22699 ?auto_22733 ) ) ( not ( = ?auto_22713 ?auto_22717 ) ) ( not ( = ?auto_22713 ?auto_22734 ) ) ( not ( = ?auto_22713 ?auto_22729 ) ) ( not ( = ?auto_22713 ?auto_22724 ) ) ( not ( = ?auto_22713 ?auto_22708 ) ) ( not ( = ?auto_22713 ?auto_22720 ) ) ( not ( = ?auto_22713 ?auto_22712 ) ) ( not ( = ?auto_22713 ?auto_22735 ) ) ( not ( = ?auto_22731 ?auto_22737 ) ) ( not ( = ?auto_22731 ?auto_22714 ) ) ( not ( = ?auto_22731 ?auto_22710 ) ) ( not ( = ?auto_22731 ?auto_22711 ) ) ( not ( = ?auto_22731 ?auto_22719 ) ) ( not ( = ?auto_22731 ?auto_22716 ) ) ( not ( = ?auto_22731 ?auto_22721 ) ) ( not ( = ?auto_22731 ?auto_22723 ) ) ( not ( = ?auto_22727 ?auto_22728 ) ) ( not ( = ?auto_22727 ?auto_22718 ) ) ( not ( = ?auto_22727 ?auto_22726 ) ) ( not ( = ?auto_22727 ?auto_22722 ) ) ( not ( = ?auto_22727 ?auto_22730 ) ) ( not ( = ?auto_22727 ?auto_22725 ) ) ( not ( = ?auto_22727 ?auto_22709 ) ) ( not ( = ?auto_22727 ?auto_22715 ) ) ( not ( = ?auto_22727 ?auto_22736 ) ) ( not ( = ?auto_22727 ?auto_22733 ) ) ( not ( = ?auto_22688 ?auto_22700 ) ) ( not ( = ?auto_22688 ?auto_22732 ) ) ( not ( = ?auto_22689 ?auto_22700 ) ) ( not ( = ?auto_22689 ?auto_22732 ) ) ( not ( = ?auto_22690 ?auto_22700 ) ) ( not ( = ?auto_22690 ?auto_22732 ) ) ( not ( = ?auto_22691 ?auto_22700 ) ) ( not ( = ?auto_22691 ?auto_22732 ) ) ( not ( = ?auto_22692 ?auto_22700 ) ) ( not ( = ?auto_22692 ?auto_22732 ) ) ( not ( = ?auto_22693 ?auto_22700 ) ) ( not ( = ?auto_22693 ?auto_22732 ) ) ( not ( = ?auto_22694 ?auto_22700 ) ) ( not ( = ?auto_22694 ?auto_22732 ) ) ( not ( = ?auto_22695 ?auto_22700 ) ) ( not ( = ?auto_22695 ?auto_22732 ) ) ( not ( = ?auto_22696 ?auto_22700 ) ) ( not ( = ?auto_22696 ?auto_22732 ) ) ( not ( = ?auto_22697 ?auto_22700 ) ) ( not ( = ?auto_22697 ?auto_22732 ) ) ( not ( = ?auto_22698 ?auto_22700 ) ) ( not ( = ?auto_22698 ?auto_22732 ) ) ( not ( = ?auto_22700 ?auto_22727 ) ) ( not ( = ?auto_22700 ?auto_22728 ) ) ( not ( = ?auto_22700 ?auto_22718 ) ) ( not ( = ?auto_22700 ?auto_22726 ) ) ( not ( = ?auto_22700 ?auto_22722 ) ) ( not ( = ?auto_22700 ?auto_22730 ) ) ( not ( = ?auto_22700 ?auto_22725 ) ) ( not ( = ?auto_22700 ?auto_22709 ) ) ( not ( = ?auto_22700 ?auto_22715 ) ) ( not ( = ?auto_22700 ?auto_22736 ) ) ( not ( = ?auto_22700 ?auto_22733 ) ) ( not ( = ?auto_22732 ?auto_22727 ) ) ( not ( = ?auto_22732 ?auto_22728 ) ) ( not ( = ?auto_22732 ?auto_22718 ) ) ( not ( = ?auto_22732 ?auto_22726 ) ) ( not ( = ?auto_22732 ?auto_22722 ) ) ( not ( = ?auto_22732 ?auto_22730 ) ) ( not ( = ?auto_22732 ?auto_22725 ) ) ( not ( = ?auto_22732 ?auto_22709 ) ) ( not ( = ?auto_22732 ?auto_22715 ) ) ( not ( = ?auto_22732 ?auto_22736 ) ) ( not ( = ?auto_22732 ?auto_22733 ) ) ( not ( = ?auto_22688 ?auto_22701 ) ) ( not ( = ?auto_22688 ?auto_22707 ) ) ( not ( = ?auto_22689 ?auto_22701 ) ) ( not ( = ?auto_22689 ?auto_22707 ) ) ( not ( = ?auto_22690 ?auto_22701 ) ) ( not ( = ?auto_22690 ?auto_22707 ) ) ( not ( = ?auto_22691 ?auto_22701 ) ) ( not ( = ?auto_22691 ?auto_22707 ) ) ( not ( = ?auto_22692 ?auto_22701 ) ) ( not ( = ?auto_22692 ?auto_22707 ) ) ( not ( = ?auto_22693 ?auto_22701 ) ) ( not ( = ?auto_22693 ?auto_22707 ) ) ( not ( = ?auto_22694 ?auto_22701 ) ) ( not ( = ?auto_22694 ?auto_22707 ) ) ( not ( = ?auto_22695 ?auto_22701 ) ) ( not ( = ?auto_22695 ?auto_22707 ) ) ( not ( = ?auto_22696 ?auto_22701 ) ) ( not ( = ?auto_22696 ?auto_22707 ) ) ( not ( = ?auto_22697 ?auto_22701 ) ) ( not ( = ?auto_22697 ?auto_22707 ) ) ( not ( = ?auto_22698 ?auto_22701 ) ) ( not ( = ?auto_22698 ?auto_22707 ) ) ( not ( = ?auto_22699 ?auto_22701 ) ) ( not ( = ?auto_22699 ?auto_22707 ) ) ( not ( = ?auto_22701 ?auto_22732 ) ) ( not ( = ?auto_22701 ?auto_22727 ) ) ( not ( = ?auto_22701 ?auto_22728 ) ) ( not ( = ?auto_22701 ?auto_22718 ) ) ( not ( = ?auto_22701 ?auto_22726 ) ) ( not ( = ?auto_22701 ?auto_22722 ) ) ( not ( = ?auto_22701 ?auto_22730 ) ) ( not ( = ?auto_22701 ?auto_22725 ) ) ( not ( = ?auto_22701 ?auto_22709 ) ) ( not ( = ?auto_22701 ?auto_22715 ) ) ( not ( = ?auto_22701 ?auto_22736 ) ) ( not ( = ?auto_22701 ?auto_22733 ) ) ( not ( = ?auto_22702 ?auto_22712 ) ) ( not ( = ?auto_22702 ?auto_22713 ) ) ( not ( = ?auto_22702 ?auto_22717 ) ) ( not ( = ?auto_22702 ?auto_22734 ) ) ( not ( = ?auto_22702 ?auto_22729 ) ) ( not ( = ?auto_22702 ?auto_22724 ) ) ( not ( = ?auto_22702 ?auto_22708 ) ) ( not ( = ?auto_22702 ?auto_22720 ) ) ( not ( = ?auto_22702 ?auto_22735 ) ) ( not ( = ?auto_22705 ?auto_22721 ) ) ( not ( = ?auto_22705 ?auto_22731 ) ) ( not ( = ?auto_22705 ?auto_22737 ) ) ( not ( = ?auto_22705 ?auto_22714 ) ) ( not ( = ?auto_22705 ?auto_22710 ) ) ( not ( = ?auto_22705 ?auto_22711 ) ) ( not ( = ?auto_22705 ?auto_22719 ) ) ( not ( = ?auto_22705 ?auto_22716 ) ) ( not ( = ?auto_22705 ?auto_22723 ) ) ( not ( = ?auto_22707 ?auto_22732 ) ) ( not ( = ?auto_22707 ?auto_22727 ) ) ( not ( = ?auto_22707 ?auto_22728 ) ) ( not ( = ?auto_22707 ?auto_22718 ) ) ( not ( = ?auto_22707 ?auto_22726 ) ) ( not ( = ?auto_22707 ?auto_22722 ) ) ( not ( = ?auto_22707 ?auto_22730 ) ) ( not ( = ?auto_22707 ?auto_22725 ) ) ( not ( = ?auto_22707 ?auto_22709 ) ) ( not ( = ?auto_22707 ?auto_22715 ) ) ( not ( = ?auto_22707 ?auto_22736 ) ) ( not ( = ?auto_22707 ?auto_22733 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_22688 ?auto_22689 ?auto_22690 ?auto_22691 ?auto_22692 ?auto_22693 ?auto_22694 ?auto_22695 ?auto_22696 ?auto_22697 ?auto_22698 ?auto_22699 ?auto_22700 )
      ( MAKE-1CRATE ?auto_22700 ?auto_22701 )
      ( MAKE-13CRATE-VERIFY ?auto_22688 ?auto_22689 ?auto_22690 ?auto_22691 ?auto_22692 ?auto_22693 ?auto_22694 ?auto_22695 ?auto_22696 ?auto_22697 ?auto_22698 ?auto_22699 ?auto_22700 ?auto_22701 ) )
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
      ?auto_22769 - SURFACE
      ?auto_22770 - SURFACE
      ?auto_22771 - SURFACE
      ?auto_22772 - SURFACE
      ?auto_22773 - SURFACE
      ?auto_22774 - SURFACE
      ?auto_22775 - SURFACE
      ?auto_22776 - SURFACE
      ?auto_22777 - SURFACE
    )
    :vars
    (
      ?auto_22781 - HOIST
      ?auto_22779 - PLACE
      ?auto_22780 - PLACE
      ?auto_22778 - HOIST
      ?auto_22782 - SURFACE
      ?auto_22793 - PLACE
      ?auto_22789 - HOIST
      ?auto_22811 - SURFACE
      ?auto_22808 - PLACE
      ?auto_22796 - HOIST
      ?auto_22787 - SURFACE
      ?auto_22804 - PLACE
      ?auto_22800 - HOIST
      ?auto_22803 - SURFACE
      ?auto_22795 - PLACE
      ?auto_22784 - HOIST
      ?auto_22788 - SURFACE
      ?auto_22813 - PLACE
      ?auto_22809 - HOIST
      ?auto_22797 - SURFACE
      ?auto_22816 - SURFACE
      ?auto_22810 - PLACE
      ?auto_22814 - HOIST
      ?auto_22794 - SURFACE
      ?auto_22812 - PLACE
      ?auto_22806 - HOIST
      ?auto_22802 - SURFACE
      ?auto_22792 - PLACE
      ?auto_22791 - HOIST
      ?auto_22801 - SURFACE
      ?auto_22807 - SURFACE
      ?auto_22798 - PLACE
      ?auto_22799 - HOIST
      ?auto_22785 - SURFACE
      ?auto_22805 - SURFACE
      ?auto_22790 - PLACE
      ?auto_22815 - HOIST
      ?auto_22786 - SURFACE
      ?auto_22783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22781 ?auto_22779 ) ( IS-CRATE ?auto_22777 ) ( not ( = ?auto_22780 ?auto_22779 ) ) ( HOIST-AT ?auto_22778 ?auto_22780 ) ( AVAILABLE ?auto_22778 ) ( SURFACE-AT ?auto_22777 ?auto_22780 ) ( ON ?auto_22777 ?auto_22782 ) ( CLEAR ?auto_22777 ) ( not ( = ?auto_22776 ?auto_22777 ) ) ( not ( = ?auto_22776 ?auto_22782 ) ) ( not ( = ?auto_22777 ?auto_22782 ) ) ( not ( = ?auto_22781 ?auto_22778 ) ) ( IS-CRATE ?auto_22776 ) ( not ( = ?auto_22793 ?auto_22779 ) ) ( HOIST-AT ?auto_22789 ?auto_22793 ) ( AVAILABLE ?auto_22789 ) ( SURFACE-AT ?auto_22776 ?auto_22793 ) ( ON ?auto_22776 ?auto_22811 ) ( CLEAR ?auto_22776 ) ( not ( = ?auto_22775 ?auto_22776 ) ) ( not ( = ?auto_22775 ?auto_22811 ) ) ( not ( = ?auto_22776 ?auto_22811 ) ) ( not ( = ?auto_22781 ?auto_22789 ) ) ( IS-CRATE ?auto_22775 ) ( not ( = ?auto_22808 ?auto_22779 ) ) ( HOIST-AT ?auto_22796 ?auto_22808 ) ( SURFACE-AT ?auto_22775 ?auto_22808 ) ( ON ?auto_22775 ?auto_22787 ) ( CLEAR ?auto_22775 ) ( not ( = ?auto_22774 ?auto_22775 ) ) ( not ( = ?auto_22774 ?auto_22787 ) ) ( not ( = ?auto_22775 ?auto_22787 ) ) ( not ( = ?auto_22781 ?auto_22796 ) ) ( IS-CRATE ?auto_22774 ) ( not ( = ?auto_22804 ?auto_22779 ) ) ( HOIST-AT ?auto_22800 ?auto_22804 ) ( AVAILABLE ?auto_22800 ) ( SURFACE-AT ?auto_22774 ?auto_22804 ) ( ON ?auto_22774 ?auto_22803 ) ( CLEAR ?auto_22774 ) ( not ( = ?auto_22773 ?auto_22774 ) ) ( not ( = ?auto_22773 ?auto_22803 ) ) ( not ( = ?auto_22774 ?auto_22803 ) ) ( not ( = ?auto_22781 ?auto_22800 ) ) ( IS-CRATE ?auto_22773 ) ( not ( = ?auto_22795 ?auto_22779 ) ) ( HOIST-AT ?auto_22784 ?auto_22795 ) ( SURFACE-AT ?auto_22773 ?auto_22795 ) ( ON ?auto_22773 ?auto_22788 ) ( CLEAR ?auto_22773 ) ( not ( = ?auto_22772 ?auto_22773 ) ) ( not ( = ?auto_22772 ?auto_22788 ) ) ( not ( = ?auto_22773 ?auto_22788 ) ) ( not ( = ?auto_22781 ?auto_22784 ) ) ( IS-CRATE ?auto_22772 ) ( not ( = ?auto_22813 ?auto_22779 ) ) ( HOIST-AT ?auto_22809 ?auto_22813 ) ( AVAILABLE ?auto_22809 ) ( SURFACE-AT ?auto_22772 ?auto_22813 ) ( ON ?auto_22772 ?auto_22797 ) ( CLEAR ?auto_22772 ) ( not ( = ?auto_22771 ?auto_22772 ) ) ( not ( = ?auto_22771 ?auto_22797 ) ) ( not ( = ?auto_22772 ?auto_22797 ) ) ( not ( = ?auto_22781 ?auto_22809 ) ) ( IS-CRATE ?auto_22771 ) ( SURFACE-AT ?auto_22771 ?auto_22795 ) ( ON ?auto_22771 ?auto_22816 ) ( CLEAR ?auto_22771 ) ( not ( = ?auto_22770 ?auto_22771 ) ) ( not ( = ?auto_22770 ?auto_22816 ) ) ( not ( = ?auto_22771 ?auto_22816 ) ) ( IS-CRATE ?auto_22770 ) ( not ( = ?auto_22810 ?auto_22779 ) ) ( HOIST-AT ?auto_22814 ?auto_22810 ) ( AVAILABLE ?auto_22814 ) ( SURFACE-AT ?auto_22770 ?auto_22810 ) ( ON ?auto_22770 ?auto_22794 ) ( CLEAR ?auto_22770 ) ( not ( = ?auto_22769 ?auto_22770 ) ) ( not ( = ?auto_22769 ?auto_22794 ) ) ( not ( = ?auto_22770 ?auto_22794 ) ) ( not ( = ?auto_22781 ?auto_22814 ) ) ( IS-CRATE ?auto_22769 ) ( not ( = ?auto_22812 ?auto_22779 ) ) ( HOIST-AT ?auto_22806 ?auto_22812 ) ( AVAILABLE ?auto_22806 ) ( SURFACE-AT ?auto_22769 ?auto_22812 ) ( ON ?auto_22769 ?auto_22802 ) ( CLEAR ?auto_22769 ) ( not ( = ?auto_22768 ?auto_22769 ) ) ( not ( = ?auto_22768 ?auto_22802 ) ) ( not ( = ?auto_22769 ?auto_22802 ) ) ( not ( = ?auto_22781 ?auto_22806 ) ) ( IS-CRATE ?auto_22768 ) ( not ( = ?auto_22792 ?auto_22779 ) ) ( HOIST-AT ?auto_22791 ?auto_22792 ) ( AVAILABLE ?auto_22791 ) ( SURFACE-AT ?auto_22768 ?auto_22792 ) ( ON ?auto_22768 ?auto_22801 ) ( CLEAR ?auto_22768 ) ( not ( = ?auto_22767 ?auto_22768 ) ) ( not ( = ?auto_22767 ?auto_22801 ) ) ( not ( = ?auto_22768 ?auto_22801 ) ) ( not ( = ?auto_22781 ?auto_22791 ) ) ( IS-CRATE ?auto_22767 ) ( AVAILABLE ?auto_22784 ) ( SURFACE-AT ?auto_22767 ?auto_22795 ) ( ON ?auto_22767 ?auto_22807 ) ( CLEAR ?auto_22767 ) ( not ( = ?auto_22766 ?auto_22767 ) ) ( not ( = ?auto_22766 ?auto_22807 ) ) ( not ( = ?auto_22767 ?auto_22807 ) ) ( IS-CRATE ?auto_22766 ) ( not ( = ?auto_22798 ?auto_22779 ) ) ( HOIST-AT ?auto_22799 ?auto_22798 ) ( AVAILABLE ?auto_22799 ) ( SURFACE-AT ?auto_22766 ?auto_22798 ) ( ON ?auto_22766 ?auto_22785 ) ( CLEAR ?auto_22766 ) ( not ( = ?auto_22765 ?auto_22766 ) ) ( not ( = ?auto_22765 ?auto_22785 ) ) ( not ( = ?auto_22766 ?auto_22785 ) ) ( not ( = ?auto_22781 ?auto_22799 ) ) ( IS-CRATE ?auto_22765 ) ( AVAILABLE ?auto_22796 ) ( SURFACE-AT ?auto_22765 ?auto_22808 ) ( ON ?auto_22765 ?auto_22805 ) ( CLEAR ?auto_22765 ) ( not ( = ?auto_22764 ?auto_22765 ) ) ( not ( = ?auto_22764 ?auto_22805 ) ) ( not ( = ?auto_22765 ?auto_22805 ) ) ( SURFACE-AT ?auto_22763 ?auto_22779 ) ( CLEAR ?auto_22763 ) ( IS-CRATE ?auto_22764 ) ( AVAILABLE ?auto_22781 ) ( not ( = ?auto_22790 ?auto_22779 ) ) ( HOIST-AT ?auto_22815 ?auto_22790 ) ( AVAILABLE ?auto_22815 ) ( SURFACE-AT ?auto_22764 ?auto_22790 ) ( ON ?auto_22764 ?auto_22786 ) ( CLEAR ?auto_22764 ) ( TRUCK-AT ?auto_22783 ?auto_22779 ) ( not ( = ?auto_22763 ?auto_22764 ) ) ( not ( = ?auto_22763 ?auto_22786 ) ) ( not ( = ?auto_22764 ?auto_22786 ) ) ( not ( = ?auto_22781 ?auto_22815 ) ) ( not ( = ?auto_22763 ?auto_22765 ) ) ( not ( = ?auto_22763 ?auto_22805 ) ) ( not ( = ?auto_22765 ?auto_22786 ) ) ( not ( = ?auto_22808 ?auto_22790 ) ) ( not ( = ?auto_22796 ?auto_22815 ) ) ( not ( = ?auto_22805 ?auto_22786 ) ) ( not ( = ?auto_22763 ?auto_22766 ) ) ( not ( = ?auto_22763 ?auto_22785 ) ) ( not ( = ?auto_22764 ?auto_22766 ) ) ( not ( = ?auto_22764 ?auto_22785 ) ) ( not ( = ?auto_22766 ?auto_22805 ) ) ( not ( = ?auto_22766 ?auto_22786 ) ) ( not ( = ?auto_22798 ?auto_22808 ) ) ( not ( = ?auto_22798 ?auto_22790 ) ) ( not ( = ?auto_22799 ?auto_22796 ) ) ( not ( = ?auto_22799 ?auto_22815 ) ) ( not ( = ?auto_22785 ?auto_22805 ) ) ( not ( = ?auto_22785 ?auto_22786 ) ) ( not ( = ?auto_22763 ?auto_22767 ) ) ( not ( = ?auto_22763 ?auto_22807 ) ) ( not ( = ?auto_22764 ?auto_22767 ) ) ( not ( = ?auto_22764 ?auto_22807 ) ) ( not ( = ?auto_22765 ?auto_22767 ) ) ( not ( = ?auto_22765 ?auto_22807 ) ) ( not ( = ?auto_22767 ?auto_22785 ) ) ( not ( = ?auto_22767 ?auto_22805 ) ) ( not ( = ?auto_22767 ?auto_22786 ) ) ( not ( = ?auto_22795 ?auto_22798 ) ) ( not ( = ?auto_22795 ?auto_22808 ) ) ( not ( = ?auto_22795 ?auto_22790 ) ) ( not ( = ?auto_22784 ?auto_22799 ) ) ( not ( = ?auto_22784 ?auto_22796 ) ) ( not ( = ?auto_22784 ?auto_22815 ) ) ( not ( = ?auto_22807 ?auto_22785 ) ) ( not ( = ?auto_22807 ?auto_22805 ) ) ( not ( = ?auto_22807 ?auto_22786 ) ) ( not ( = ?auto_22763 ?auto_22768 ) ) ( not ( = ?auto_22763 ?auto_22801 ) ) ( not ( = ?auto_22764 ?auto_22768 ) ) ( not ( = ?auto_22764 ?auto_22801 ) ) ( not ( = ?auto_22765 ?auto_22768 ) ) ( not ( = ?auto_22765 ?auto_22801 ) ) ( not ( = ?auto_22766 ?auto_22768 ) ) ( not ( = ?auto_22766 ?auto_22801 ) ) ( not ( = ?auto_22768 ?auto_22807 ) ) ( not ( = ?auto_22768 ?auto_22785 ) ) ( not ( = ?auto_22768 ?auto_22805 ) ) ( not ( = ?auto_22768 ?auto_22786 ) ) ( not ( = ?auto_22792 ?auto_22795 ) ) ( not ( = ?auto_22792 ?auto_22798 ) ) ( not ( = ?auto_22792 ?auto_22808 ) ) ( not ( = ?auto_22792 ?auto_22790 ) ) ( not ( = ?auto_22791 ?auto_22784 ) ) ( not ( = ?auto_22791 ?auto_22799 ) ) ( not ( = ?auto_22791 ?auto_22796 ) ) ( not ( = ?auto_22791 ?auto_22815 ) ) ( not ( = ?auto_22801 ?auto_22807 ) ) ( not ( = ?auto_22801 ?auto_22785 ) ) ( not ( = ?auto_22801 ?auto_22805 ) ) ( not ( = ?auto_22801 ?auto_22786 ) ) ( not ( = ?auto_22763 ?auto_22769 ) ) ( not ( = ?auto_22763 ?auto_22802 ) ) ( not ( = ?auto_22764 ?auto_22769 ) ) ( not ( = ?auto_22764 ?auto_22802 ) ) ( not ( = ?auto_22765 ?auto_22769 ) ) ( not ( = ?auto_22765 ?auto_22802 ) ) ( not ( = ?auto_22766 ?auto_22769 ) ) ( not ( = ?auto_22766 ?auto_22802 ) ) ( not ( = ?auto_22767 ?auto_22769 ) ) ( not ( = ?auto_22767 ?auto_22802 ) ) ( not ( = ?auto_22769 ?auto_22801 ) ) ( not ( = ?auto_22769 ?auto_22807 ) ) ( not ( = ?auto_22769 ?auto_22785 ) ) ( not ( = ?auto_22769 ?auto_22805 ) ) ( not ( = ?auto_22769 ?auto_22786 ) ) ( not ( = ?auto_22812 ?auto_22792 ) ) ( not ( = ?auto_22812 ?auto_22795 ) ) ( not ( = ?auto_22812 ?auto_22798 ) ) ( not ( = ?auto_22812 ?auto_22808 ) ) ( not ( = ?auto_22812 ?auto_22790 ) ) ( not ( = ?auto_22806 ?auto_22791 ) ) ( not ( = ?auto_22806 ?auto_22784 ) ) ( not ( = ?auto_22806 ?auto_22799 ) ) ( not ( = ?auto_22806 ?auto_22796 ) ) ( not ( = ?auto_22806 ?auto_22815 ) ) ( not ( = ?auto_22802 ?auto_22801 ) ) ( not ( = ?auto_22802 ?auto_22807 ) ) ( not ( = ?auto_22802 ?auto_22785 ) ) ( not ( = ?auto_22802 ?auto_22805 ) ) ( not ( = ?auto_22802 ?auto_22786 ) ) ( not ( = ?auto_22763 ?auto_22770 ) ) ( not ( = ?auto_22763 ?auto_22794 ) ) ( not ( = ?auto_22764 ?auto_22770 ) ) ( not ( = ?auto_22764 ?auto_22794 ) ) ( not ( = ?auto_22765 ?auto_22770 ) ) ( not ( = ?auto_22765 ?auto_22794 ) ) ( not ( = ?auto_22766 ?auto_22770 ) ) ( not ( = ?auto_22766 ?auto_22794 ) ) ( not ( = ?auto_22767 ?auto_22770 ) ) ( not ( = ?auto_22767 ?auto_22794 ) ) ( not ( = ?auto_22768 ?auto_22770 ) ) ( not ( = ?auto_22768 ?auto_22794 ) ) ( not ( = ?auto_22770 ?auto_22802 ) ) ( not ( = ?auto_22770 ?auto_22801 ) ) ( not ( = ?auto_22770 ?auto_22807 ) ) ( not ( = ?auto_22770 ?auto_22785 ) ) ( not ( = ?auto_22770 ?auto_22805 ) ) ( not ( = ?auto_22770 ?auto_22786 ) ) ( not ( = ?auto_22810 ?auto_22812 ) ) ( not ( = ?auto_22810 ?auto_22792 ) ) ( not ( = ?auto_22810 ?auto_22795 ) ) ( not ( = ?auto_22810 ?auto_22798 ) ) ( not ( = ?auto_22810 ?auto_22808 ) ) ( not ( = ?auto_22810 ?auto_22790 ) ) ( not ( = ?auto_22814 ?auto_22806 ) ) ( not ( = ?auto_22814 ?auto_22791 ) ) ( not ( = ?auto_22814 ?auto_22784 ) ) ( not ( = ?auto_22814 ?auto_22799 ) ) ( not ( = ?auto_22814 ?auto_22796 ) ) ( not ( = ?auto_22814 ?auto_22815 ) ) ( not ( = ?auto_22794 ?auto_22802 ) ) ( not ( = ?auto_22794 ?auto_22801 ) ) ( not ( = ?auto_22794 ?auto_22807 ) ) ( not ( = ?auto_22794 ?auto_22785 ) ) ( not ( = ?auto_22794 ?auto_22805 ) ) ( not ( = ?auto_22794 ?auto_22786 ) ) ( not ( = ?auto_22763 ?auto_22771 ) ) ( not ( = ?auto_22763 ?auto_22816 ) ) ( not ( = ?auto_22764 ?auto_22771 ) ) ( not ( = ?auto_22764 ?auto_22816 ) ) ( not ( = ?auto_22765 ?auto_22771 ) ) ( not ( = ?auto_22765 ?auto_22816 ) ) ( not ( = ?auto_22766 ?auto_22771 ) ) ( not ( = ?auto_22766 ?auto_22816 ) ) ( not ( = ?auto_22767 ?auto_22771 ) ) ( not ( = ?auto_22767 ?auto_22816 ) ) ( not ( = ?auto_22768 ?auto_22771 ) ) ( not ( = ?auto_22768 ?auto_22816 ) ) ( not ( = ?auto_22769 ?auto_22771 ) ) ( not ( = ?auto_22769 ?auto_22816 ) ) ( not ( = ?auto_22771 ?auto_22794 ) ) ( not ( = ?auto_22771 ?auto_22802 ) ) ( not ( = ?auto_22771 ?auto_22801 ) ) ( not ( = ?auto_22771 ?auto_22807 ) ) ( not ( = ?auto_22771 ?auto_22785 ) ) ( not ( = ?auto_22771 ?auto_22805 ) ) ( not ( = ?auto_22771 ?auto_22786 ) ) ( not ( = ?auto_22816 ?auto_22794 ) ) ( not ( = ?auto_22816 ?auto_22802 ) ) ( not ( = ?auto_22816 ?auto_22801 ) ) ( not ( = ?auto_22816 ?auto_22807 ) ) ( not ( = ?auto_22816 ?auto_22785 ) ) ( not ( = ?auto_22816 ?auto_22805 ) ) ( not ( = ?auto_22816 ?auto_22786 ) ) ( not ( = ?auto_22763 ?auto_22772 ) ) ( not ( = ?auto_22763 ?auto_22797 ) ) ( not ( = ?auto_22764 ?auto_22772 ) ) ( not ( = ?auto_22764 ?auto_22797 ) ) ( not ( = ?auto_22765 ?auto_22772 ) ) ( not ( = ?auto_22765 ?auto_22797 ) ) ( not ( = ?auto_22766 ?auto_22772 ) ) ( not ( = ?auto_22766 ?auto_22797 ) ) ( not ( = ?auto_22767 ?auto_22772 ) ) ( not ( = ?auto_22767 ?auto_22797 ) ) ( not ( = ?auto_22768 ?auto_22772 ) ) ( not ( = ?auto_22768 ?auto_22797 ) ) ( not ( = ?auto_22769 ?auto_22772 ) ) ( not ( = ?auto_22769 ?auto_22797 ) ) ( not ( = ?auto_22770 ?auto_22772 ) ) ( not ( = ?auto_22770 ?auto_22797 ) ) ( not ( = ?auto_22772 ?auto_22816 ) ) ( not ( = ?auto_22772 ?auto_22794 ) ) ( not ( = ?auto_22772 ?auto_22802 ) ) ( not ( = ?auto_22772 ?auto_22801 ) ) ( not ( = ?auto_22772 ?auto_22807 ) ) ( not ( = ?auto_22772 ?auto_22785 ) ) ( not ( = ?auto_22772 ?auto_22805 ) ) ( not ( = ?auto_22772 ?auto_22786 ) ) ( not ( = ?auto_22813 ?auto_22795 ) ) ( not ( = ?auto_22813 ?auto_22810 ) ) ( not ( = ?auto_22813 ?auto_22812 ) ) ( not ( = ?auto_22813 ?auto_22792 ) ) ( not ( = ?auto_22813 ?auto_22798 ) ) ( not ( = ?auto_22813 ?auto_22808 ) ) ( not ( = ?auto_22813 ?auto_22790 ) ) ( not ( = ?auto_22809 ?auto_22784 ) ) ( not ( = ?auto_22809 ?auto_22814 ) ) ( not ( = ?auto_22809 ?auto_22806 ) ) ( not ( = ?auto_22809 ?auto_22791 ) ) ( not ( = ?auto_22809 ?auto_22799 ) ) ( not ( = ?auto_22809 ?auto_22796 ) ) ( not ( = ?auto_22809 ?auto_22815 ) ) ( not ( = ?auto_22797 ?auto_22816 ) ) ( not ( = ?auto_22797 ?auto_22794 ) ) ( not ( = ?auto_22797 ?auto_22802 ) ) ( not ( = ?auto_22797 ?auto_22801 ) ) ( not ( = ?auto_22797 ?auto_22807 ) ) ( not ( = ?auto_22797 ?auto_22785 ) ) ( not ( = ?auto_22797 ?auto_22805 ) ) ( not ( = ?auto_22797 ?auto_22786 ) ) ( not ( = ?auto_22763 ?auto_22773 ) ) ( not ( = ?auto_22763 ?auto_22788 ) ) ( not ( = ?auto_22764 ?auto_22773 ) ) ( not ( = ?auto_22764 ?auto_22788 ) ) ( not ( = ?auto_22765 ?auto_22773 ) ) ( not ( = ?auto_22765 ?auto_22788 ) ) ( not ( = ?auto_22766 ?auto_22773 ) ) ( not ( = ?auto_22766 ?auto_22788 ) ) ( not ( = ?auto_22767 ?auto_22773 ) ) ( not ( = ?auto_22767 ?auto_22788 ) ) ( not ( = ?auto_22768 ?auto_22773 ) ) ( not ( = ?auto_22768 ?auto_22788 ) ) ( not ( = ?auto_22769 ?auto_22773 ) ) ( not ( = ?auto_22769 ?auto_22788 ) ) ( not ( = ?auto_22770 ?auto_22773 ) ) ( not ( = ?auto_22770 ?auto_22788 ) ) ( not ( = ?auto_22771 ?auto_22773 ) ) ( not ( = ?auto_22771 ?auto_22788 ) ) ( not ( = ?auto_22773 ?auto_22797 ) ) ( not ( = ?auto_22773 ?auto_22816 ) ) ( not ( = ?auto_22773 ?auto_22794 ) ) ( not ( = ?auto_22773 ?auto_22802 ) ) ( not ( = ?auto_22773 ?auto_22801 ) ) ( not ( = ?auto_22773 ?auto_22807 ) ) ( not ( = ?auto_22773 ?auto_22785 ) ) ( not ( = ?auto_22773 ?auto_22805 ) ) ( not ( = ?auto_22773 ?auto_22786 ) ) ( not ( = ?auto_22788 ?auto_22797 ) ) ( not ( = ?auto_22788 ?auto_22816 ) ) ( not ( = ?auto_22788 ?auto_22794 ) ) ( not ( = ?auto_22788 ?auto_22802 ) ) ( not ( = ?auto_22788 ?auto_22801 ) ) ( not ( = ?auto_22788 ?auto_22807 ) ) ( not ( = ?auto_22788 ?auto_22785 ) ) ( not ( = ?auto_22788 ?auto_22805 ) ) ( not ( = ?auto_22788 ?auto_22786 ) ) ( not ( = ?auto_22763 ?auto_22774 ) ) ( not ( = ?auto_22763 ?auto_22803 ) ) ( not ( = ?auto_22764 ?auto_22774 ) ) ( not ( = ?auto_22764 ?auto_22803 ) ) ( not ( = ?auto_22765 ?auto_22774 ) ) ( not ( = ?auto_22765 ?auto_22803 ) ) ( not ( = ?auto_22766 ?auto_22774 ) ) ( not ( = ?auto_22766 ?auto_22803 ) ) ( not ( = ?auto_22767 ?auto_22774 ) ) ( not ( = ?auto_22767 ?auto_22803 ) ) ( not ( = ?auto_22768 ?auto_22774 ) ) ( not ( = ?auto_22768 ?auto_22803 ) ) ( not ( = ?auto_22769 ?auto_22774 ) ) ( not ( = ?auto_22769 ?auto_22803 ) ) ( not ( = ?auto_22770 ?auto_22774 ) ) ( not ( = ?auto_22770 ?auto_22803 ) ) ( not ( = ?auto_22771 ?auto_22774 ) ) ( not ( = ?auto_22771 ?auto_22803 ) ) ( not ( = ?auto_22772 ?auto_22774 ) ) ( not ( = ?auto_22772 ?auto_22803 ) ) ( not ( = ?auto_22774 ?auto_22788 ) ) ( not ( = ?auto_22774 ?auto_22797 ) ) ( not ( = ?auto_22774 ?auto_22816 ) ) ( not ( = ?auto_22774 ?auto_22794 ) ) ( not ( = ?auto_22774 ?auto_22802 ) ) ( not ( = ?auto_22774 ?auto_22801 ) ) ( not ( = ?auto_22774 ?auto_22807 ) ) ( not ( = ?auto_22774 ?auto_22785 ) ) ( not ( = ?auto_22774 ?auto_22805 ) ) ( not ( = ?auto_22774 ?auto_22786 ) ) ( not ( = ?auto_22804 ?auto_22795 ) ) ( not ( = ?auto_22804 ?auto_22813 ) ) ( not ( = ?auto_22804 ?auto_22810 ) ) ( not ( = ?auto_22804 ?auto_22812 ) ) ( not ( = ?auto_22804 ?auto_22792 ) ) ( not ( = ?auto_22804 ?auto_22798 ) ) ( not ( = ?auto_22804 ?auto_22808 ) ) ( not ( = ?auto_22804 ?auto_22790 ) ) ( not ( = ?auto_22800 ?auto_22784 ) ) ( not ( = ?auto_22800 ?auto_22809 ) ) ( not ( = ?auto_22800 ?auto_22814 ) ) ( not ( = ?auto_22800 ?auto_22806 ) ) ( not ( = ?auto_22800 ?auto_22791 ) ) ( not ( = ?auto_22800 ?auto_22799 ) ) ( not ( = ?auto_22800 ?auto_22796 ) ) ( not ( = ?auto_22800 ?auto_22815 ) ) ( not ( = ?auto_22803 ?auto_22788 ) ) ( not ( = ?auto_22803 ?auto_22797 ) ) ( not ( = ?auto_22803 ?auto_22816 ) ) ( not ( = ?auto_22803 ?auto_22794 ) ) ( not ( = ?auto_22803 ?auto_22802 ) ) ( not ( = ?auto_22803 ?auto_22801 ) ) ( not ( = ?auto_22803 ?auto_22807 ) ) ( not ( = ?auto_22803 ?auto_22785 ) ) ( not ( = ?auto_22803 ?auto_22805 ) ) ( not ( = ?auto_22803 ?auto_22786 ) ) ( not ( = ?auto_22763 ?auto_22775 ) ) ( not ( = ?auto_22763 ?auto_22787 ) ) ( not ( = ?auto_22764 ?auto_22775 ) ) ( not ( = ?auto_22764 ?auto_22787 ) ) ( not ( = ?auto_22765 ?auto_22775 ) ) ( not ( = ?auto_22765 ?auto_22787 ) ) ( not ( = ?auto_22766 ?auto_22775 ) ) ( not ( = ?auto_22766 ?auto_22787 ) ) ( not ( = ?auto_22767 ?auto_22775 ) ) ( not ( = ?auto_22767 ?auto_22787 ) ) ( not ( = ?auto_22768 ?auto_22775 ) ) ( not ( = ?auto_22768 ?auto_22787 ) ) ( not ( = ?auto_22769 ?auto_22775 ) ) ( not ( = ?auto_22769 ?auto_22787 ) ) ( not ( = ?auto_22770 ?auto_22775 ) ) ( not ( = ?auto_22770 ?auto_22787 ) ) ( not ( = ?auto_22771 ?auto_22775 ) ) ( not ( = ?auto_22771 ?auto_22787 ) ) ( not ( = ?auto_22772 ?auto_22775 ) ) ( not ( = ?auto_22772 ?auto_22787 ) ) ( not ( = ?auto_22773 ?auto_22775 ) ) ( not ( = ?auto_22773 ?auto_22787 ) ) ( not ( = ?auto_22775 ?auto_22803 ) ) ( not ( = ?auto_22775 ?auto_22788 ) ) ( not ( = ?auto_22775 ?auto_22797 ) ) ( not ( = ?auto_22775 ?auto_22816 ) ) ( not ( = ?auto_22775 ?auto_22794 ) ) ( not ( = ?auto_22775 ?auto_22802 ) ) ( not ( = ?auto_22775 ?auto_22801 ) ) ( not ( = ?auto_22775 ?auto_22807 ) ) ( not ( = ?auto_22775 ?auto_22785 ) ) ( not ( = ?auto_22775 ?auto_22805 ) ) ( not ( = ?auto_22775 ?auto_22786 ) ) ( not ( = ?auto_22787 ?auto_22803 ) ) ( not ( = ?auto_22787 ?auto_22788 ) ) ( not ( = ?auto_22787 ?auto_22797 ) ) ( not ( = ?auto_22787 ?auto_22816 ) ) ( not ( = ?auto_22787 ?auto_22794 ) ) ( not ( = ?auto_22787 ?auto_22802 ) ) ( not ( = ?auto_22787 ?auto_22801 ) ) ( not ( = ?auto_22787 ?auto_22807 ) ) ( not ( = ?auto_22787 ?auto_22785 ) ) ( not ( = ?auto_22787 ?auto_22805 ) ) ( not ( = ?auto_22787 ?auto_22786 ) ) ( not ( = ?auto_22763 ?auto_22776 ) ) ( not ( = ?auto_22763 ?auto_22811 ) ) ( not ( = ?auto_22764 ?auto_22776 ) ) ( not ( = ?auto_22764 ?auto_22811 ) ) ( not ( = ?auto_22765 ?auto_22776 ) ) ( not ( = ?auto_22765 ?auto_22811 ) ) ( not ( = ?auto_22766 ?auto_22776 ) ) ( not ( = ?auto_22766 ?auto_22811 ) ) ( not ( = ?auto_22767 ?auto_22776 ) ) ( not ( = ?auto_22767 ?auto_22811 ) ) ( not ( = ?auto_22768 ?auto_22776 ) ) ( not ( = ?auto_22768 ?auto_22811 ) ) ( not ( = ?auto_22769 ?auto_22776 ) ) ( not ( = ?auto_22769 ?auto_22811 ) ) ( not ( = ?auto_22770 ?auto_22776 ) ) ( not ( = ?auto_22770 ?auto_22811 ) ) ( not ( = ?auto_22771 ?auto_22776 ) ) ( not ( = ?auto_22771 ?auto_22811 ) ) ( not ( = ?auto_22772 ?auto_22776 ) ) ( not ( = ?auto_22772 ?auto_22811 ) ) ( not ( = ?auto_22773 ?auto_22776 ) ) ( not ( = ?auto_22773 ?auto_22811 ) ) ( not ( = ?auto_22774 ?auto_22776 ) ) ( not ( = ?auto_22774 ?auto_22811 ) ) ( not ( = ?auto_22776 ?auto_22787 ) ) ( not ( = ?auto_22776 ?auto_22803 ) ) ( not ( = ?auto_22776 ?auto_22788 ) ) ( not ( = ?auto_22776 ?auto_22797 ) ) ( not ( = ?auto_22776 ?auto_22816 ) ) ( not ( = ?auto_22776 ?auto_22794 ) ) ( not ( = ?auto_22776 ?auto_22802 ) ) ( not ( = ?auto_22776 ?auto_22801 ) ) ( not ( = ?auto_22776 ?auto_22807 ) ) ( not ( = ?auto_22776 ?auto_22785 ) ) ( not ( = ?auto_22776 ?auto_22805 ) ) ( not ( = ?auto_22776 ?auto_22786 ) ) ( not ( = ?auto_22793 ?auto_22808 ) ) ( not ( = ?auto_22793 ?auto_22804 ) ) ( not ( = ?auto_22793 ?auto_22795 ) ) ( not ( = ?auto_22793 ?auto_22813 ) ) ( not ( = ?auto_22793 ?auto_22810 ) ) ( not ( = ?auto_22793 ?auto_22812 ) ) ( not ( = ?auto_22793 ?auto_22792 ) ) ( not ( = ?auto_22793 ?auto_22798 ) ) ( not ( = ?auto_22793 ?auto_22790 ) ) ( not ( = ?auto_22789 ?auto_22796 ) ) ( not ( = ?auto_22789 ?auto_22800 ) ) ( not ( = ?auto_22789 ?auto_22784 ) ) ( not ( = ?auto_22789 ?auto_22809 ) ) ( not ( = ?auto_22789 ?auto_22814 ) ) ( not ( = ?auto_22789 ?auto_22806 ) ) ( not ( = ?auto_22789 ?auto_22791 ) ) ( not ( = ?auto_22789 ?auto_22799 ) ) ( not ( = ?auto_22789 ?auto_22815 ) ) ( not ( = ?auto_22811 ?auto_22787 ) ) ( not ( = ?auto_22811 ?auto_22803 ) ) ( not ( = ?auto_22811 ?auto_22788 ) ) ( not ( = ?auto_22811 ?auto_22797 ) ) ( not ( = ?auto_22811 ?auto_22816 ) ) ( not ( = ?auto_22811 ?auto_22794 ) ) ( not ( = ?auto_22811 ?auto_22802 ) ) ( not ( = ?auto_22811 ?auto_22801 ) ) ( not ( = ?auto_22811 ?auto_22807 ) ) ( not ( = ?auto_22811 ?auto_22785 ) ) ( not ( = ?auto_22811 ?auto_22805 ) ) ( not ( = ?auto_22811 ?auto_22786 ) ) ( not ( = ?auto_22763 ?auto_22777 ) ) ( not ( = ?auto_22763 ?auto_22782 ) ) ( not ( = ?auto_22764 ?auto_22777 ) ) ( not ( = ?auto_22764 ?auto_22782 ) ) ( not ( = ?auto_22765 ?auto_22777 ) ) ( not ( = ?auto_22765 ?auto_22782 ) ) ( not ( = ?auto_22766 ?auto_22777 ) ) ( not ( = ?auto_22766 ?auto_22782 ) ) ( not ( = ?auto_22767 ?auto_22777 ) ) ( not ( = ?auto_22767 ?auto_22782 ) ) ( not ( = ?auto_22768 ?auto_22777 ) ) ( not ( = ?auto_22768 ?auto_22782 ) ) ( not ( = ?auto_22769 ?auto_22777 ) ) ( not ( = ?auto_22769 ?auto_22782 ) ) ( not ( = ?auto_22770 ?auto_22777 ) ) ( not ( = ?auto_22770 ?auto_22782 ) ) ( not ( = ?auto_22771 ?auto_22777 ) ) ( not ( = ?auto_22771 ?auto_22782 ) ) ( not ( = ?auto_22772 ?auto_22777 ) ) ( not ( = ?auto_22772 ?auto_22782 ) ) ( not ( = ?auto_22773 ?auto_22777 ) ) ( not ( = ?auto_22773 ?auto_22782 ) ) ( not ( = ?auto_22774 ?auto_22777 ) ) ( not ( = ?auto_22774 ?auto_22782 ) ) ( not ( = ?auto_22775 ?auto_22777 ) ) ( not ( = ?auto_22775 ?auto_22782 ) ) ( not ( = ?auto_22777 ?auto_22811 ) ) ( not ( = ?auto_22777 ?auto_22787 ) ) ( not ( = ?auto_22777 ?auto_22803 ) ) ( not ( = ?auto_22777 ?auto_22788 ) ) ( not ( = ?auto_22777 ?auto_22797 ) ) ( not ( = ?auto_22777 ?auto_22816 ) ) ( not ( = ?auto_22777 ?auto_22794 ) ) ( not ( = ?auto_22777 ?auto_22802 ) ) ( not ( = ?auto_22777 ?auto_22801 ) ) ( not ( = ?auto_22777 ?auto_22807 ) ) ( not ( = ?auto_22777 ?auto_22785 ) ) ( not ( = ?auto_22777 ?auto_22805 ) ) ( not ( = ?auto_22777 ?auto_22786 ) ) ( not ( = ?auto_22780 ?auto_22793 ) ) ( not ( = ?auto_22780 ?auto_22808 ) ) ( not ( = ?auto_22780 ?auto_22804 ) ) ( not ( = ?auto_22780 ?auto_22795 ) ) ( not ( = ?auto_22780 ?auto_22813 ) ) ( not ( = ?auto_22780 ?auto_22810 ) ) ( not ( = ?auto_22780 ?auto_22812 ) ) ( not ( = ?auto_22780 ?auto_22792 ) ) ( not ( = ?auto_22780 ?auto_22798 ) ) ( not ( = ?auto_22780 ?auto_22790 ) ) ( not ( = ?auto_22778 ?auto_22789 ) ) ( not ( = ?auto_22778 ?auto_22796 ) ) ( not ( = ?auto_22778 ?auto_22800 ) ) ( not ( = ?auto_22778 ?auto_22784 ) ) ( not ( = ?auto_22778 ?auto_22809 ) ) ( not ( = ?auto_22778 ?auto_22814 ) ) ( not ( = ?auto_22778 ?auto_22806 ) ) ( not ( = ?auto_22778 ?auto_22791 ) ) ( not ( = ?auto_22778 ?auto_22799 ) ) ( not ( = ?auto_22778 ?auto_22815 ) ) ( not ( = ?auto_22782 ?auto_22811 ) ) ( not ( = ?auto_22782 ?auto_22787 ) ) ( not ( = ?auto_22782 ?auto_22803 ) ) ( not ( = ?auto_22782 ?auto_22788 ) ) ( not ( = ?auto_22782 ?auto_22797 ) ) ( not ( = ?auto_22782 ?auto_22816 ) ) ( not ( = ?auto_22782 ?auto_22794 ) ) ( not ( = ?auto_22782 ?auto_22802 ) ) ( not ( = ?auto_22782 ?auto_22801 ) ) ( not ( = ?auto_22782 ?auto_22807 ) ) ( not ( = ?auto_22782 ?auto_22785 ) ) ( not ( = ?auto_22782 ?auto_22805 ) ) ( not ( = ?auto_22782 ?auto_22786 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_22763 ?auto_22764 ?auto_22765 ?auto_22766 ?auto_22767 ?auto_22768 ?auto_22769 ?auto_22770 ?auto_22771 ?auto_22772 ?auto_22773 ?auto_22774 ?auto_22775 ?auto_22776 )
      ( MAKE-1CRATE ?auto_22776 ?auto_22777 )
      ( MAKE-14CRATE-VERIFY ?auto_22763 ?auto_22764 ?auto_22765 ?auto_22766 ?auto_22767 ?auto_22768 ?auto_22769 ?auto_22770 ?auto_22771 ?auto_22772 ?auto_22773 ?auto_22774 ?auto_22775 ?auto_22776 ?auto_22777 ) )
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
      ?auto_22849 - SURFACE
      ?auto_22850 - SURFACE
      ?auto_22851 - SURFACE
      ?auto_22852 - SURFACE
      ?auto_22853 - SURFACE
      ?auto_22854 - SURFACE
      ?auto_22855 - SURFACE
      ?auto_22856 - SURFACE
      ?auto_22857 - SURFACE
      ?auto_22858 - SURFACE
    )
    :vars
    (
      ?auto_22863 - HOIST
      ?auto_22860 - PLACE
      ?auto_22862 - PLACE
      ?auto_22864 - HOIST
      ?auto_22861 - SURFACE
      ?auto_22883 - SURFACE
      ?auto_22891 - PLACE
      ?auto_22872 - HOIST
      ?auto_22894 - SURFACE
      ?auto_22882 - PLACE
      ?auto_22886 - HOIST
      ?auto_22888 - SURFACE
      ?auto_22867 - PLACE
      ?auto_22871 - HOIST
      ?auto_22870 - SURFACE
      ?auto_22874 - PLACE
      ?auto_22898 - HOIST
      ?auto_22884 - SURFACE
      ?auto_22881 - PLACE
      ?auto_22866 - HOIST
      ?auto_22896 - SURFACE
      ?auto_22885 - SURFACE
      ?auto_22893 - PLACE
      ?auto_22880 - HOIST
      ?auto_22865 - SURFACE
      ?auto_22892 - PLACE
      ?auto_22875 - HOIST
      ?auto_22878 - SURFACE
      ?auto_22890 - PLACE
      ?auto_22869 - HOIST
      ?auto_22895 - SURFACE
      ?auto_22873 - SURFACE
      ?auto_22876 - PLACE
      ?auto_22887 - HOIST
      ?auto_22879 - SURFACE
      ?auto_22877 - SURFACE
      ?auto_22889 - PLACE
      ?auto_22897 - HOIST
      ?auto_22868 - SURFACE
      ?auto_22859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22863 ?auto_22860 ) ( IS-CRATE ?auto_22858 ) ( not ( = ?auto_22862 ?auto_22860 ) ) ( HOIST-AT ?auto_22864 ?auto_22862 ) ( SURFACE-AT ?auto_22858 ?auto_22862 ) ( ON ?auto_22858 ?auto_22861 ) ( CLEAR ?auto_22858 ) ( not ( = ?auto_22857 ?auto_22858 ) ) ( not ( = ?auto_22857 ?auto_22861 ) ) ( not ( = ?auto_22858 ?auto_22861 ) ) ( not ( = ?auto_22863 ?auto_22864 ) ) ( IS-CRATE ?auto_22857 ) ( AVAILABLE ?auto_22864 ) ( SURFACE-AT ?auto_22857 ?auto_22862 ) ( ON ?auto_22857 ?auto_22883 ) ( CLEAR ?auto_22857 ) ( not ( = ?auto_22856 ?auto_22857 ) ) ( not ( = ?auto_22856 ?auto_22883 ) ) ( not ( = ?auto_22857 ?auto_22883 ) ) ( IS-CRATE ?auto_22856 ) ( not ( = ?auto_22891 ?auto_22860 ) ) ( HOIST-AT ?auto_22872 ?auto_22891 ) ( AVAILABLE ?auto_22872 ) ( SURFACE-AT ?auto_22856 ?auto_22891 ) ( ON ?auto_22856 ?auto_22894 ) ( CLEAR ?auto_22856 ) ( not ( = ?auto_22855 ?auto_22856 ) ) ( not ( = ?auto_22855 ?auto_22894 ) ) ( not ( = ?auto_22856 ?auto_22894 ) ) ( not ( = ?auto_22863 ?auto_22872 ) ) ( IS-CRATE ?auto_22855 ) ( not ( = ?auto_22882 ?auto_22860 ) ) ( HOIST-AT ?auto_22886 ?auto_22882 ) ( SURFACE-AT ?auto_22855 ?auto_22882 ) ( ON ?auto_22855 ?auto_22888 ) ( CLEAR ?auto_22855 ) ( not ( = ?auto_22854 ?auto_22855 ) ) ( not ( = ?auto_22854 ?auto_22888 ) ) ( not ( = ?auto_22855 ?auto_22888 ) ) ( not ( = ?auto_22863 ?auto_22886 ) ) ( IS-CRATE ?auto_22854 ) ( not ( = ?auto_22867 ?auto_22860 ) ) ( HOIST-AT ?auto_22871 ?auto_22867 ) ( AVAILABLE ?auto_22871 ) ( SURFACE-AT ?auto_22854 ?auto_22867 ) ( ON ?auto_22854 ?auto_22870 ) ( CLEAR ?auto_22854 ) ( not ( = ?auto_22853 ?auto_22854 ) ) ( not ( = ?auto_22853 ?auto_22870 ) ) ( not ( = ?auto_22854 ?auto_22870 ) ) ( not ( = ?auto_22863 ?auto_22871 ) ) ( IS-CRATE ?auto_22853 ) ( not ( = ?auto_22874 ?auto_22860 ) ) ( HOIST-AT ?auto_22898 ?auto_22874 ) ( SURFACE-AT ?auto_22853 ?auto_22874 ) ( ON ?auto_22853 ?auto_22884 ) ( CLEAR ?auto_22853 ) ( not ( = ?auto_22852 ?auto_22853 ) ) ( not ( = ?auto_22852 ?auto_22884 ) ) ( not ( = ?auto_22853 ?auto_22884 ) ) ( not ( = ?auto_22863 ?auto_22898 ) ) ( IS-CRATE ?auto_22852 ) ( not ( = ?auto_22881 ?auto_22860 ) ) ( HOIST-AT ?auto_22866 ?auto_22881 ) ( AVAILABLE ?auto_22866 ) ( SURFACE-AT ?auto_22852 ?auto_22881 ) ( ON ?auto_22852 ?auto_22896 ) ( CLEAR ?auto_22852 ) ( not ( = ?auto_22851 ?auto_22852 ) ) ( not ( = ?auto_22851 ?auto_22896 ) ) ( not ( = ?auto_22852 ?auto_22896 ) ) ( not ( = ?auto_22863 ?auto_22866 ) ) ( IS-CRATE ?auto_22851 ) ( SURFACE-AT ?auto_22851 ?auto_22874 ) ( ON ?auto_22851 ?auto_22885 ) ( CLEAR ?auto_22851 ) ( not ( = ?auto_22850 ?auto_22851 ) ) ( not ( = ?auto_22850 ?auto_22885 ) ) ( not ( = ?auto_22851 ?auto_22885 ) ) ( IS-CRATE ?auto_22850 ) ( not ( = ?auto_22893 ?auto_22860 ) ) ( HOIST-AT ?auto_22880 ?auto_22893 ) ( AVAILABLE ?auto_22880 ) ( SURFACE-AT ?auto_22850 ?auto_22893 ) ( ON ?auto_22850 ?auto_22865 ) ( CLEAR ?auto_22850 ) ( not ( = ?auto_22849 ?auto_22850 ) ) ( not ( = ?auto_22849 ?auto_22865 ) ) ( not ( = ?auto_22850 ?auto_22865 ) ) ( not ( = ?auto_22863 ?auto_22880 ) ) ( IS-CRATE ?auto_22849 ) ( not ( = ?auto_22892 ?auto_22860 ) ) ( HOIST-AT ?auto_22875 ?auto_22892 ) ( AVAILABLE ?auto_22875 ) ( SURFACE-AT ?auto_22849 ?auto_22892 ) ( ON ?auto_22849 ?auto_22878 ) ( CLEAR ?auto_22849 ) ( not ( = ?auto_22848 ?auto_22849 ) ) ( not ( = ?auto_22848 ?auto_22878 ) ) ( not ( = ?auto_22849 ?auto_22878 ) ) ( not ( = ?auto_22863 ?auto_22875 ) ) ( IS-CRATE ?auto_22848 ) ( not ( = ?auto_22890 ?auto_22860 ) ) ( HOIST-AT ?auto_22869 ?auto_22890 ) ( AVAILABLE ?auto_22869 ) ( SURFACE-AT ?auto_22848 ?auto_22890 ) ( ON ?auto_22848 ?auto_22895 ) ( CLEAR ?auto_22848 ) ( not ( = ?auto_22847 ?auto_22848 ) ) ( not ( = ?auto_22847 ?auto_22895 ) ) ( not ( = ?auto_22848 ?auto_22895 ) ) ( not ( = ?auto_22863 ?auto_22869 ) ) ( IS-CRATE ?auto_22847 ) ( AVAILABLE ?auto_22898 ) ( SURFACE-AT ?auto_22847 ?auto_22874 ) ( ON ?auto_22847 ?auto_22873 ) ( CLEAR ?auto_22847 ) ( not ( = ?auto_22846 ?auto_22847 ) ) ( not ( = ?auto_22846 ?auto_22873 ) ) ( not ( = ?auto_22847 ?auto_22873 ) ) ( IS-CRATE ?auto_22846 ) ( not ( = ?auto_22876 ?auto_22860 ) ) ( HOIST-AT ?auto_22887 ?auto_22876 ) ( AVAILABLE ?auto_22887 ) ( SURFACE-AT ?auto_22846 ?auto_22876 ) ( ON ?auto_22846 ?auto_22879 ) ( CLEAR ?auto_22846 ) ( not ( = ?auto_22845 ?auto_22846 ) ) ( not ( = ?auto_22845 ?auto_22879 ) ) ( not ( = ?auto_22846 ?auto_22879 ) ) ( not ( = ?auto_22863 ?auto_22887 ) ) ( IS-CRATE ?auto_22845 ) ( AVAILABLE ?auto_22886 ) ( SURFACE-AT ?auto_22845 ?auto_22882 ) ( ON ?auto_22845 ?auto_22877 ) ( CLEAR ?auto_22845 ) ( not ( = ?auto_22844 ?auto_22845 ) ) ( not ( = ?auto_22844 ?auto_22877 ) ) ( not ( = ?auto_22845 ?auto_22877 ) ) ( SURFACE-AT ?auto_22843 ?auto_22860 ) ( CLEAR ?auto_22843 ) ( IS-CRATE ?auto_22844 ) ( AVAILABLE ?auto_22863 ) ( not ( = ?auto_22889 ?auto_22860 ) ) ( HOIST-AT ?auto_22897 ?auto_22889 ) ( AVAILABLE ?auto_22897 ) ( SURFACE-AT ?auto_22844 ?auto_22889 ) ( ON ?auto_22844 ?auto_22868 ) ( CLEAR ?auto_22844 ) ( TRUCK-AT ?auto_22859 ?auto_22860 ) ( not ( = ?auto_22843 ?auto_22844 ) ) ( not ( = ?auto_22843 ?auto_22868 ) ) ( not ( = ?auto_22844 ?auto_22868 ) ) ( not ( = ?auto_22863 ?auto_22897 ) ) ( not ( = ?auto_22843 ?auto_22845 ) ) ( not ( = ?auto_22843 ?auto_22877 ) ) ( not ( = ?auto_22845 ?auto_22868 ) ) ( not ( = ?auto_22882 ?auto_22889 ) ) ( not ( = ?auto_22886 ?auto_22897 ) ) ( not ( = ?auto_22877 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22846 ) ) ( not ( = ?auto_22843 ?auto_22879 ) ) ( not ( = ?auto_22844 ?auto_22846 ) ) ( not ( = ?auto_22844 ?auto_22879 ) ) ( not ( = ?auto_22846 ?auto_22877 ) ) ( not ( = ?auto_22846 ?auto_22868 ) ) ( not ( = ?auto_22876 ?auto_22882 ) ) ( not ( = ?auto_22876 ?auto_22889 ) ) ( not ( = ?auto_22887 ?auto_22886 ) ) ( not ( = ?auto_22887 ?auto_22897 ) ) ( not ( = ?auto_22879 ?auto_22877 ) ) ( not ( = ?auto_22879 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22847 ) ) ( not ( = ?auto_22843 ?auto_22873 ) ) ( not ( = ?auto_22844 ?auto_22847 ) ) ( not ( = ?auto_22844 ?auto_22873 ) ) ( not ( = ?auto_22845 ?auto_22847 ) ) ( not ( = ?auto_22845 ?auto_22873 ) ) ( not ( = ?auto_22847 ?auto_22879 ) ) ( not ( = ?auto_22847 ?auto_22877 ) ) ( not ( = ?auto_22847 ?auto_22868 ) ) ( not ( = ?auto_22874 ?auto_22876 ) ) ( not ( = ?auto_22874 ?auto_22882 ) ) ( not ( = ?auto_22874 ?auto_22889 ) ) ( not ( = ?auto_22898 ?auto_22887 ) ) ( not ( = ?auto_22898 ?auto_22886 ) ) ( not ( = ?auto_22898 ?auto_22897 ) ) ( not ( = ?auto_22873 ?auto_22879 ) ) ( not ( = ?auto_22873 ?auto_22877 ) ) ( not ( = ?auto_22873 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22848 ) ) ( not ( = ?auto_22843 ?auto_22895 ) ) ( not ( = ?auto_22844 ?auto_22848 ) ) ( not ( = ?auto_22844 ?auto_22895 ) ) ( not ( = ?auto_22845 ?auto_22848 ) ) ( not ( = ?auto_22845 ?auto_22895 ) ) ( not ( = ?auto_22846 ?auto_22848 ) ) ( not ( = ?auto_22846 ?auto_22895 ) ) ( not ( = ?auto_22848 ?auto_22873 ) ) ( not ( = ?auto_22848 ?auto_22879 ) ) ( not ( = ?auto_22848 ?auto_22877 ) ) ( not ( = ?auto_22848 ?auto_22868 ) ) ( not ( = ?auto_22890 ?auto_22874 ) ) ( not ( = ?auto_22890 ?auto_22876 ) ) ( not ( = ?auto_22890 ?auto_22882 ) ) ( not ( = ?auto_22890 ?auto_22889 ) ) ( not ( = ?auto_22869 ?auto_22898 ) ) ( not ( = ?auto_22869 ?auto_22887 ) ) ( not ( = ?auto_22869 ?auto_22886 ) ) ( not ( = ?auto_22869 ?auto_22897 ) ) ( not ( = ?auto_22895 ?auto_22873 ) ) ( not ( = ?auto_22895 ?auto_22879 ) ) ( not ( = ?auto_22895 ?auto_22877 ) ) ( not ( = ?auto_22895 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22849 ) ) ( not ( = ?auto_22843 ?auto_22878 ) ) ( not ( = ?auto_22844 ?auto_22849 ) ) ( not ( = ?auto_22844 ?auto_22878 ) ) ( not ( = ?auto_22845 ?auto_22849 ) ) ( not ( = ?auto_22845 ?auto_22878 ) ) ( not ( = ?auto_22846 ?auto_22849 ) ) ( not ( = ?auto_22846 ?auto_22878 ) ) ( not ( = ?auto_22847 ?auto_22849 ) ) ( not ( = ?auto_22847 ?auto_22878 ) ) ( not ( = ?auto_22849 ?auto_22895 ) ) ( not ( = ?auto_22849 ?auto_22873 ) ) ( not ( = ?auto_22849 ?auto_22879 ) ) ( not ( = ?auto_22849 ?auto_22877 ) ) ( not ( = ?auto_22849 ?auto_22868 ) ) ( not ( = ?auto_22892 ?auto_22890 ) ) ( not ( = ?auto_22892 ?auto_22874 ) ) ( not ( = ?auto_22892 ?auto_22876 ) ) ( not ( = ?auto_22892 ?auto_22882 ) ) ( not ( = ?auto_22892 ?auto_22889 ) ) ( not ( = ?auto_22875 ?auto_22869 ) ) ( not ( = ?auto_22875 ?auto_22898 ) ) ( not ( = ?auto_22875 ?auto_22887 ) ) ( not ( = ?auto_22875 ?auto_22886 ) ) ( not ( = ?auto_22875 ?auto_22897 ) ) ( not ( = ?auto_22878 ?auto_22895 ) ) ( not ( = ?auto_22878 ?auto_22873 ) ) ( not ( = ?auto_22878 ?auto_22879 ) ) ( not ( = ?auto_22878 ?auto_22877 ) ) ( not ( = ?auto_22878 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22850 ) ) ( not ( = ?auto_22843 ?auto_22865 ) ) ( not ( = ?auto_22844 ?auto_22850 ) ) ( not ( = ?auto_22844 ?auto_22865 ) ) ( not ( = ?auto_22845 ?auto_22850 ) ) ( not ( = ?auto_22845 ?auto_22865 ) ) ( not ( = ?auto_22846 ?auto_22850 ) ) ( not ( = ?auto_22846 ?auto_22865 ) ) ( not ( = ?auto_22847 ?auto_22850 ) ) ( not ( = ?auto_22847 ?auto_22865 ) ) ( not ( = ?auto_22848 ?auto_22850 ) ) ( not ( = ?auto_22848 ?auto_22865 ) ) ( not ( = ?auto_22850 ?auto_22878 ) ) ( not ( = ?auto_22850 ?auto_22895 ) ) ( not ( = ?auto_22850 ?auto_22873 ) ) ( not ( = ?auto_22850 ?auto_22879 ) ) ( not ( = ?auto_22850 ?auto_22877 ) ) ( not ( = ?auto_22850 ?auto_22868 ) ) ( not ( = ?auto_22893 ?auto_22892 ) ) ( not ( = ?auto_22893 ?auto_22890 ) ) ( not ( = ?auto_22893 ?auto_22874 ) ) ( not ( = ?auto_22893 ?auto_22876 ) ) ( not ( = ?auto_22893 ?auto_22882 ) ) ( not ( = ?auto_22893 ?auto_22889 ) ) ( not ( = ?auto_22880 ?auto_22875 ) ) ( not ( = ?auto_22880 ?auto_22869 ) ) ( not ( = ?auto_22880 ?auto_22898 ) ) ( not ( = ?auto_22880 ?auto_22887 ) ) ( not ( = ?auto_22880 ?auto_22886 ) ) ( not ( = ?auto_22880 ?auto_22897 ) ) ( not ( = ?auto_22865 ?auto_22878 ) ) ( not ( = ?auto_22865 ?auto_22895 ) ) ( not ( = ?auto_22865 ?auto_22873 ) ) ( not ( = ?auto_22865 ?auto_22879 ) ) ( not ( = ?auto_22865 ?auto_22877 ) ) ( not ( = ?auto_22865 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22851 ) ) ( not ( = ?auto_22843 ?auto_22885 ) ) ( not ( = ?auto_22844 ?auto_22851 ) ) ( not ( = ?auto_22844 ?auto_22885 ) ) ( not ( = ?auto_22845 ?auto_22851 ) ) ( not ( = ?auto_22845 ?auto_22885 ) ) ( not ( = ?auto_22846 ?auto_22851 ) ) ( not ( = ?auto_22846 ?auto_22885 ) ) ( not ( = ?auto_22847 ?auto_22851 ) ) ( not ( = ?auto_22847 ?auto_22885 ) ) ( not ( = ?auto_22848 ?auto_22851 ) ) ( not ( = ?auto_22848 ?auto_22885 ) ) ( not ( = ?auto_22849 ?auto_22851 ) ) ( not ( = ?auto_22849 ?auto_22885 ) ) ( not ( = ?auto_22851 ?auto_22865 ) ) ( not ( = ?auto_22851 ?auto_22878 ) ) ( not ( = ?auto_22851 ?auto_22895 ) ) ( not ( = ?auto_22851 ?auto_22873 ) ) ( not ( = ?auto_22851 ?auto_22879 ) ) ( not ( = ?auto_22851 ?auto_22877 ) ) ( not ( = ?auto_22851 ?auto_22868 ) ) ( not ( = ?auto_22885 ?auto_22865 ) ) ( not ( = ?auto_22885 ?auto_22878 ) ) ( not ( = ?auto_22885 ?auto_22895 ) ) ( not ( = ?auto_22885 ?auto_22873 ) ) ( not ( = ?auto_22885 ?auto_22879 ) ) ( not ( = ?auto_22885 ?auto_22877 ) ) ( not ( = ?auto_22885 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22852 ) ) ( not ( = ?auto_22843 ?auto_22896 ) ) ( not ( = ?auto_22844 ?auto_22852 ) ) ( not ( = ?auto_22844 ?auto_22896 ) ) ( not ( = ?auto_22845 ?auto_22852 ) ) ( not ( = ?auto_22845 ?auto_22896 ) ) ( not ( = ?auto_22846 ?auto_22852 ) ) ( not ( = ?auto_22846 ?auto_22896 ) ) ( not ( = ?auto_22847 ?auto_22852 ) ) ( not ( = ?auto_22847 ?auto_22896 ) ) ( not ( = ?auto_22848 ?auto_22852 ) ) ( not ( = ?auto_22848 ?auto_22896 ) ) ( not ( = ?auto_22849 ?auto_22852 ) ) ( not ( = ?auto_22849 ?auto_22896 ) ) ( not ( = ?auto_22850 ?auto_22852 ) ) ( not ( = ?auto_22850 ?auto_22896 ) ) ( not ( = ?auto_22852 ?auto_22885 ) ) ( not ( = ?auto_22852 ?auto_22865 ) ) ( not ( = ?auto_22852 ?auto_22878 ) ) ( not ( = ?auto_22852 ?auto_22895 ) ) ( not ( = ?auto_22852 ?auto_22873 ) ) ( not ( = ?auto_22852 ?auto_22879 ) ) ( not ( = ?auto_22852 ?auto_22877 ) ) ( not ( = ?auto_22852 ?auto_22868 ) ) ( not ( = ?auto_22881 ?auto_22874 ) ) ( not ( = ?auto_22881 ?auto_22893 ) ) ( not ( = ?auto_22881 ?auto_22892 ) ) ( not ( = ?auto_22881 ?auto_22890 ) ) ( not ( = ?auto_22881 ?auto_22876 ) ) ( not ( = ?auto_22881 ?auto_22882 ) ) ( not ( = ?auto_22881 ?auto_22889 ) ) ( not ( = ?auto_22866 ?auto_22898 ) ) ( not ( = ?auto_22866 ?auto_22880 ) ) ( not ( = ?auto_22866 ?auto_22875 ) ) ( not ( = ?auto_22866 ?auto_22869 ) ) ( not ( = ?auto_22866 ?auto_22887 ) ) ( not ( = ?auto_22866 ?auto_22886 ) ) ( not ( = ?auto_22866 ?auto_22897 ) ) ( not ( = ?auto_22896 ?auto_22885 ) ) ( not ( = ?auto_22896 ?auto_22865 ) ) ( not ( = ?auto_22896 ?auto_22878 ) ) ( not ( = ?auto_22896 ?auto_22895 ) ) ( not ( = ?auto_22896 ?auto_22873 ) ) ( not ( = ?auto_22896 ?auto_22879 ) ) ( not ( = ?auto_22896 ?auto_22877 ) ) ( not ( = ?auto_22896 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22853 ) ) ( not ( = ?auto_22843 ?auto_22884 ) ) ( not ( = ?auto_22844 ?auto_22853 ) ) ( not ( = ?auto_22844 ?auto_22884 ) ) ( not ( = ?auto_22845 ?auto_22853 ) ) ( not ( = ?auto_22845 ?auto_22884 ) ) ( not ( = ?auto_22846 ?auto_22853 ) ) ( not ( = ?auto_22846 ?auto_22884 ) ) ( not ( = ?auto_22847 ?auto_22853 ) ) ( not ( = ?auto_22847 ?auto_22884 ) ) ( not ( = ?auto_22848 ?auto_22853 ) ) ( not ( = ?auto_22848 ?auto_22884 ) ) ( not ( = ?auto_22849 ?auto_22853 ) ) ( not ( = ?auto_22849 ?auto_22884 ) ) ( not ( = ?auto_22850 ?auto_22853 ) ) ( not ( = ?auto_22850 ?auto_22884 ) ) ( not ( = ?auto_22851 ?auto_22853 ) ) ( not ( = ?auto_22851 ?auto_22884 ) ) ( not ( = ?auto_22853 ?auto_22896 ) ) ( not ( = ?auto_22853 ?auto_22885 ) ) ( not ( = ?auto_22853 ?auto_22865 ) ) ( not ( = ?auto_22853 ?auto_22878 ) ) ( not ( = ?auto_22853 ?auto_22895 ) ) ( not ( = ?auto_22853 ?auto_22873 ) ) ( not ( = ?auto_22853 ?auto_22879 ) ) ( not ( = ?auto_22853 ?auto_22877 ) ) ( not ( = ?auto_22853 ?auto_22868 ) ) ( not ( = ?auto_22884 ?auto_22896 ) ) ( not ( = ?auto_22884 ?auto_22885 ) ) ( not ( = ?auto_22884 ?auto_22865 ) ) ( not ( = ?auto_22884 ?auto_22878 ) ) ( not ( = ?auto_22884 ?auto_22895 ) ) ( not ( = ?auto_22884 ?auto_22873 ) ) ( not ( = ?auto_22884 ?auto_22879 ) ) ( not ( = ?auto_22884 ?auto_22877 ) ) ( not ( = ?auto_22884 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22854 ) ) ( not ( = ?auto_22843 ?auto_22870 ) ) ( not ( = ?auto_22844 ?auto_22854 ) ) ( not ( = ?auto_22844 ?auto_22870 ) ) ( not ( = ?auto_22845 ?auto_22854 ) ) ( not ( = ?auto_22845 ?auto_22870 ) ) ( not ( = ?auto_22846 ?auto_22854 ) ) ( not ( = ?auto_22846 ?auto_22870 ) ) ( not ( = ?auto_22847 ?auto_22854 ) ) ( not ( = ?auto_22847 ?auto_22870 ) ) ( not ( = ?auto_22848 ?auto_22854 ) ) ( not ( = ?auto_22848 ?auto_22870 ) ) ( not ( = ?auto_22849 ?auto_22854 ) ) ( not ( = ?auto_22849 ?auto_22870 ) ) ( not ( = ?auto_22850 ?auto_22854 ) ) ( not ( = ?auto_22850 ?auto_22870 ) ) ( not ( = ?auto_22851 ?auto_22854 ) ) ( not ( = ?auto_22851 ?auto_22870 ) ) ( not ( = ?auto_22852 ?auto_22854 ) ) ( not ( = ?auto_22852 ?auto_22870 ) ) ( not ( = ?auto_22854 ?auto_22884 ) ) ( not ( = ?auto_22854 ?auto_22896 ) ) ( not ( = ?auto_22854 ?auto_22885 ) ) ( not ( = ?auto_22854 ?auto_22865 ) ) ( not ( = ?auto_22854 ?auto_22878 ) ) ( not ( = ?auto_22854 ?auto_22895 ) ) ( not ( = ?auto_22854 ?auto_22873 ) ) ( not ( = ?auto_22854 ?auto_22879 ) ) ( not ( = ?auto_22854 ?auto_22877 ) ) ( not ( = ?auto_22854 ?auto_22868 ) ) ( not ( = ?auto_22867 ?auto_22874 ) ) ( not ( = ?auto_22867 ?auto_22881 ) ) ( not ( = ?auto_22867 ?auto_22893 ) ) ( not ( = ?auto_22867 ?auto_22892 ) ) ( not ( = ?auto_22867 ?auto_22890 ) ) ( not ( = ?auto_22867 ?auto_22876 ) ) ( not ( = ?auto_22867 ?auto_22882 ) ) ( not ( = ?auto_22867 ?auto_22889 ) ) ( not ( = ?auto_22871 ?auto_22898 ) ) ( not ( = ?auto_22871 ?auto_22866 ) ) ( not ( = ?auto_22871 ?auto_22880 ) ) ( not ( = ?auto_22871 ?auto_22875 ) ) ( not ( = ?auto_22871 ?auto_22869 ) ) ( not ( = ?auto_22871 ?auto_22887 ) ) ( not ( = ?auto_22871 ?auto_22886 ) ) ( not ( = ?auto_22871 ?auto_22897 ) ) ( not ( = ?auto_22870 ?auto_22884 ) ) ( not ( = ?auto_22870 ?auto_22896 ) ) ( not ( = ?auto_22870 ?auto_22885 ) ) ( not ( = ?auto_22870 ?auto_22865 ) ) ( not ( = ?auto_22870 ?auto_22878 ) ) ( not ( = ?auto_22870 ?auto_22895 ) ) ( not ( = ?auto_22870 ?auto_22873 ) ) ( not ( = ?auto_22870 ?auto_22879 ) ) ( not ( = ?auto_22870 ?auto_22877 ) ) ( not ( = ?auto_22870 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22855 ) ) ( not ( = ?auto_22843 ?auto_22888 ) ) ( not ( = ?auto_22844 ?auto_22855 ) ) ( not ( = ?auto_22844 ?auto_22888 ) ) ( not ( = ?auto_22845 ?auto_22855 ) ) ( not ( = ?auto_22845 ?auto_22888 ) ) ( not ( = ?auto_22846 ?auto_22855 ) ) ( not ( = ?auto_22846 ?auto_22888 ) ) ( not ( = ?auto_22847 ?auto_22855 ) ) ( not ( = ?auto_22847 ?auto_22888 ) ) ( not ( = ?auto_22848 ?auto_22855 ) ) ( not ( = ?auto_22848 ?auto_22888 ) ) ( not ( = ?auto_22849 ?auto_22855 ) ) ( not ( = ?auto_22849 ?auto_22888 ) ) ( not ( = ?auto_22850 ?auto_22855 ) ) ( not ( = ?auto_22850 ?auto_22888 ) ) ( not ( = ?auto_22851 ?auto_22855 ) ) ( not ( = ?auto_22851 ?auto_22888 ) ) ( not ( = ?auto_22852 ?auto_22855 ) ) ( not ( = ?auto_22852 ?auto_22888 ) ) ( not ( = ?auto_22853 ?auto_22855 ) ) ( not ( = ?auto_22853 ?auto_22888 ) ) ( not ( = ?auto_22855 ?auto_22870 ) ) ( not ( = ?auto_22855 ?auto_22884 ) ) ( not ( = ?auto_22855 ?auto_22896 ) ) ( not ( = ?auto_22855 ?auto_22885 ) ) ( not ( = ?auto_22855 ?auto_22865 ) ) ( not ( = ?auto_22855 ?auto_22878 ) ) ( not ( = ?auto_22855 ?auto_22895 ) ) ( not ( = ?auto_22855 ?auto_22873 ) ) ( not ( = ?auto_22855 ?auto_22879 ) ) ( not ( = ?auto_22855 ?auto_22877 ) ) ( not ( = ?auto_22855 ?auto_22868 ) ) ( not ( = ?auto_22888 ?auto_22870 ) ) ( not ( = ?auto_22888 ?auto_22884 ) ) ( not ( = ?auto_22888 ?auto_22896 ) ) ( not ( = ?auto_22888 ?auto_22885 ) ) ( not ( = ?auto_22888 ?auto_22865 ) ) ( not ( = ?auto_22888 ?auto_22878 ) ) ( not ( = ?auto_22888 ?auto_22895 ) ) ( not ( = ?auto_22888 ?auto_22873 ) ) ( not ( = ?auto_22888 ?auto_22879 ) ) ( not ( = ?auto_22888 ?auto_22877 ) ) ( not ( = ?auto_22888 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22856 ) ) ( not ( = ?auto_22843 ?auto_22894 ) ) ( not ( = ?auto_22844 ?auto_22856 ) ) ( not ( = ?auto_22844 ?auto_22894 ) ) ( not ( = ?auto_22845 ?auto_22856 ) ) ( not ( = ?auto_22845 ?auto_22894 ) ) ( not ( = ?auto_22846 ?auto_22856 ) ) ( not ( = ?auto_22846 ?auto_22894 ) ) ( not ( = ?auto_22847 ?auto_22856 ) ) ( not ( = ?auto_22847 ?auto_22894 ) ) ( not ( = ?auto_22848 ?auto_22856 ) ) ( not ( = ?auto_22848 ?auto_22894 ) ) ( not ( = ?auto_22849 ?auto_22856 ) ) ( not ( = ?auto_22849 ?auto_22894 ) ) ( not ( = ?auto_22850 ?auto_22856 ) ) ( not ( = ?auto_22850 ?auto_22894 ) ) ( not ( = ?auto_22851 ?auto_22856 ) ) ( not ( = ?auto_22851 ?auto_22894 ) ) ( not ( = ?auto_22852 ?auto_22856 ) ) ( not ( = ?auto_22852 ?auto_22894 ) ) ( not ( = ?auto_22853 ?auto_22856 ) ) ( not ( = ?auto_22853 ?auto_22894 ) ) ( not ( = ?auto_22854 ?auto_22856 ) ) ( not ( = ?auto_22854 ?auto_22894 ) ) ( not ( = ?auto_22856 ?auto_22888 ) ) ( not ( = ?auto_22856 ?auto_22870 ) ) ( not ( = ?auto_22856 ?auto_22884 ) ) ( not ( = ?auto_22856 ?auto_22896 ) ) ( not ( = ?auto_22856 ?auto_22885 ) ) ( not ( = ?auto_22856 ?auto_22865 ) ) ( not ( = ?auto_22856 ?auto_22878 ) ) ( not ( = ?auto_22856 ?auto_22895 ) ) ( not ( = ?auto_22856 ?auto_22873 ) ) ( not ( = ?auto_22856 ?auto_22879 ) ) ( not ( = ?auto_22856 ?auto_22877 ) ) ( not ( = ?auto_22856 ?auto_22868 ) ) ( not ( = ?auto_22891 ?auto_22882 ) ) ( not ( = ?auto_22891 ?auto_22867 ) ) ( not ( = ?auto_22891 ?auto_22874 ) ) ( not ( = ?auto_22891 ?auto_22881 ) ) ( not ( = ?auto_22891 ?auto_22893 ) ) ( not ( = ?auto_22891 ?auto_22892 ) ) ( not ( = ?auto_22891 ?auto_22890 ) ) ( not ( = ?auto_22891 ?auto_22876 ) ) ( not ( = ?auto_22891 ?auto_22889 ) ) ( not ( = ?auto_22872 ?auto_22886 ) ) ( not ( = ?auto_22872 ?auto_22871 ) ) ( not ( = ?auto_22872 ?auto_22898 ) ) ( not ( = ?auto_22872 ?auto_22866 ) ) ( not ( = ?auto_22872 ?auto_22880 ) ) ( not ( = ?auto_22872 ?auto_22875 ) ) ( not ( = ?auto_22872 ?auto_22869 ) ) ( not ( = ?auto_22872 ?auto_22887 ) ) ( not ( = ?auto_22872 ?auto_22897 ) ) ( not ( = ?auto_22894 ?auto_22888 ) ) ( not ( = ?auto_22894 ?auto_22870 ) ) ( not ( = ?auto_22894 ?auto_22884 ) ) ( not ( = ?auto_22894 ?auto_22896 ) ) ( not ( = ?auto_22894 ?auto_22885 ) ) ( not ( = ?auto_22894 ?auto_22865 ) ) ( not ( = ?auto_22894 ?auto_22878 ) ) ( not ( = ?auto_22894 ?auto_22895 ) ) ( not ( = ?auto_22894 ?auto_22873 ) ) ( not ( = ?auto_22894 ?auto_22879 ) ) ( not ( = ?auto_22894 ?auto_22877 ) ) ( not ( = ?auto_22894 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22857 ) ) ( not ( = ?auto_22843 ?auto_22883 ) ) ( not ( = ?auto_22844 ?auto_22857 ) ) ( not ( = ?auto_22844 ?auto_22883 ) ) ( not ( = ?auto_22845 ?auto_22857 ) ) ( not ( = ?auto_22845 ?auto_22883 ) ) ( not ( = ?auto_22846 ?auto_22857 ) ) ( not ( = ?auto_22846 ?auto_22883 ) ) ( not ( = ?auto_22847 ?auto_22857 ) ) ( not ( = ?auto_22847 ?auto_22883 ) ) ( not ( = ?auto_22848 ?auto_22857 ) ) ( not ( = ?auto_22848 ?auto_22883 ) ) ( not ( = ?auto_22849 ?auto_22857 ) ) ( not ( = ?auto_22849 ?auto_22883 ) ) ( not ( = ?auto_22850 ?auto_22857 ) ) ( not ( = ?auto_22850 ?auto_22883 ) ) ( not ( = ?auto_22851 ?auto_22857 ) ) ( not ( = ?auto_22851 ?auto_22883 ) ) ( not ( = ?auto_22852 ?auto_22857 ) ) ( not ( = ?auto_22852 ?auto_22883 ) ) ( not ( = ?auto_22853 ?auto_22857 ) ) ( not ( = ?auto_22853 ?auto_22883 ) ) ( not ( = ?auto_22854 ?auto_22857 ) ) ( not ( = ?auto_22854 ?auto_22883 ) ) ( not ( = ?auto_22855 ?auto_22857 ) ) ( not ( = ?auto_22855 ?auto_22883 ) ) ( not ( = ?auto_22857 ?auto_22894 ) ) ( not ( = ?auto_22857 ?auto_22888 ) ) ( not ( = ?auto_22857 ?auto_22870 ) ) ( not ( = ?auto_22857 ?auto_22884 ) ) ( not ( = ?auto_22857 ?auto_22896 ) ) ( not ( = ?auto_22857 ?auto_22885 ) ) ( not ( = ?auto_22857 ?auto_22865 ) ) ( not ( = ?auto_22857 ?auto_22878 ) ) ( not ( = ?auto_22857 ?auto_22895 ) ) ( not ( = ?auto_22857 ?auto_22873 ) ) ( not ( = ?auto_22857 ?auto_22879 ) ) ( not ( = ?auto_22857 ?auto_22877 ) ) ( not ( = ?auto_22857 ?auto_22868 ) ) ( not ( = ?auto_22862 ?auto_22891 ) ) ( not ( = ?auto_22862 ?auto_22882 ) ) ( not ( = ?auto_22862 ?auto_22867 ) ) ( not ( = ?auto_22862 ?auto_22874 ) ) ( not ( = ?auto_22862 ?auto_22881 ) ) ( not ( = ?auto_22862 ?auto_22893 ) ) ( not ( = ?auto_22862 ?auto_22892 ) ) ( not ( = ?auto_22862 ?auto_22890 ) ) ( not ( = ?auto_22862 ?auto_22876 ) ) ( not ( = ?auto_22862 ?auto_22889 ) ) ( not ( = ?auto_22864 ?auto_22872 ) ) ( not ( = ?auto_22864 ?auto_22886 ) ) ( not ( = ?auto_22864 ?auto_22871 ) ) ( not ( = ?auto_22864 ?auto_22898 ) ) ( not ( = ?auto_22864 ?auto_22866 ) ) ( not ( = ?auto_22864 ?auto_22880 ) ) ( not ( = ?auto_22864 ?auto_22875 ) ) ( not ( = ?auto_22864 ?auto_22869 ) ) ( not ( = ?auto_22864 ?auto_22887 ) ) ( not ( = ?auto_22864 ?auto_22897 ) ) ( not ( = ?auto_22883 ?auto_22894 ) ) ( not ( = ?auto_22883 ?auto_22888 ) ) ( not ( = ?auto_22883 ?auto_22870 ) ) ( not ( = ?auto_22883 ?auto_22884 ) ) ( not ( = ?auto_22883 ?auto_22896 ) ) ( not ( = ?auto_22883 ?auto_22885 ) ) ( not ( = ?auto_22883 ?auto_22865 ) ) ( not ( = ?auto_22883 ?auto_22878 ) ) ( not ( = ?auto_22883 ?auto_22895 ) ) ( not ( = ?auto_22883 ?auto_22873 ) ) ( not ( = ?auto_22883 ?auto_22879 ) ) ( not ( = ?auto_22883 ?auto_22877 ) ) ( not ( = ?auto_22883 ?auto_22868 ) ) ( not ( = ?auto_22843 ?auto_22858 ) ) ( not ( = ?auto_22843 ?auto_22861 ) ) ( not ( = ?auto_22844 ?auto_22858 ) ) ( not ( = ?auto_22844 ?auto_22861 ) ) ( not ( = ?auto_22845 ?auto_22858 ) ) ( not ( = ?auto_22845 ?auto_22861 ) ) ( not ( = ?auto_22846 ?auto_22858 ) ) ( not ( = ?auto_22846 ?auto_22861 ) ) ( not ( = ?auto_22847 ?auto_22858 ) ) ( not ( = ?auto_22847 ?auto_22861 ) ) ( not ( = ?auto_22848 ?auto_22858 ) ) ( not ( = ?auto_22848 ?auto_22861 ) ) ( not ( = ?auto_22849 ?auto_22858 ) ) ( not ( = ?auto_22849 ?auto_22861 ) ) ( not ( = ?auto_22850 ?auto_22858 ) ) ( not ( = ?auto_22850 ?auto_22861 ) ) ( not ( = ?auto_22851 ?auto_22858 ) ) ( not ( = ?auto_22851 ?auto_22861 ) ) ( not ( = ?auto_22852 ?auto_22858 ) ) ( not ( = ?auto_22852 ?auto_22861 ) ) ( not ( = ?auto_22853 ?auto_22858 ) ) ( not ( = ?auto_22853 ?auto_22861 ) ) ( not ( = ?auto_22854 ?auto_22858 ) ) ( not ( = ?auto_22854 ?auto_22861 ) ) ( not ( = ?auto_22855 ?auto_22858 ) ) ( not ( = ?auto_22855 ?auto_22861 ) ) ( not ( = ?auto_22856 ?auto_22858 ) ) ( not ( = ?auto_22856 ?auto_22861 ) ) ( not ( = ?auto_22858 ?auto_22883 ) ) ( not ( = ?auto_22858 ?auto_22894 ) ) ( not ( = ?auto_22858 ?auto_22888 ) ) ( not ( = ?auto_22858 ?auto_22870 ) ) ( not ( = ?auto_22858 ?auto_22884 ) ) ( not ( = ?auto_22858 ?auto_22896 ) ) ( not ( = ?auto_22858 ?auto_22885 ) ) ( not ( = ?auto_22858 ?auto_22865 ) ) ( not ( = ?auto_22858 ?auto_22878 ) ) ( not ( = ?auto_22858 ?auto_22895 ) ) ( not ( = ?auto_22858 ?auto_22873 ) ) ( not ( = ?auto_22858 ?auto_22879 ) ) ( not ( = ?auto_22858 ?auto_22877 ) ) ( not ( = ?auto_22858 ?auto_22868 ) ) ( not ( = ?auto_22861 ?auto_22883 ) ) ( not ( = ?auto_22861 ?auto_22894 ) ) ( not ( = ?auto_22861 ?auto_22888 ) ) ( not ( = ?auto_22861 ?auto_22870 ) ) ( not ( = ?auto_22861 ?auto_22884 ) ) ( not ( = ?auto_22861 ?auto_22896 ) ) ( not ( = ?auto_22861 ?auto_22885 ) ) ( not ( = ?auto_22861 ?auto_22865 ) ) ( not ( = ?auto_22861 ?auto_22878 ) ) ( not ( = ?auto_22861 ?auto_22895 ) ) ( not ( = ?auto_22861 ?auto_22873 ) ) ( not ( = ?auto_22861 ?auto_22879 ) ) ( not ( = ?auto_22861 ?auto_22877 ) ) ( not ( = ?auto_22861 ?auto_22868 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_22843 ?auto_22844 ?auto_22845 ?auto_22846 ?auto_22847 ?auto_22848 ?auto_22849 ?auto_22850 ?auto_22851 ?auto_22852 ?auto_22853 ?auto_22854 ?auto_22855 ?auto_22856 ?auto_22857 )
      ( MAKE-1CRATE ?auto_22857 ?auto_22858 )
      ( MAKE-15CRATE-VERIFY ?auto_22843 ?auto_22844 ?auto_22845 ?auto_22846 ?auto_22847 ?auto_22848 ?auto_22849 ?auto_22850 ?auto_22851 ?auto_22852 ?auto_22853 ?auto_22854 ?auto_22855 ?auto_22856 ?auto_22857 ?auto_22858 ) )
  )

)

