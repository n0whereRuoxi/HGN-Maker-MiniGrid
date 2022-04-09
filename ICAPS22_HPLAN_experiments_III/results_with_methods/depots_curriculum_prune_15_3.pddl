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
      ?auto_22170 - SURFACE
      ?auto_22171 - SURFACE
    )
    :vars
    (
      ?auto_22172 - HOIST
      ?auto_22173 - PLACE
      ?auto_22175 - PLACE
      ?auto_22176 - HOIST
      ?auto_22177 - SURFACE
      ?auto_22174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22172 ?auto_22173 ) ( SURFACE-AT ?auto_22170 ?auto_22173 ) ( CLEAR ?auto_22170 ) ( IS-CRATE ?auto_22171 ) ( AVAILABLE ?auto_22172 ) ( not ( = ?auto_22175 ?auto_22173 ) ) ( HOIST-AT ?auto_22176 ?auto_22175 ) ( AVAILABLE ?auto_22176 ) ( SURFACE-AT ?auto_22171 ?auto_22175 ) ( ON ?auto_22171 ?auto_22177 ) ( CLEAR ?auto_22171 ) ( TRUCK-AT ?auto_22174 ?auto_22173 ) ( not ( = ?auto_22170 ?auto_22171 ) ) ( not ( = ?auto_22170 ?auto_22177 ) ) ( not ( = ?auto_22171 ?auto_22177 ) ) ( not ( = ?auto_22172 ?auto_22176 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22174 ?auto_22173 ?auto_22175 )
      ( !LIFT ?auto_22176 ?auto_22171 ?auto_22177 ?auto_22175 )
      ( !LOAD ?auto_22176 ?auto_22171 ?auto_22174 ?auto_22175 )
      ( !DRIVE ?auto_22174 ?auto_22175 ?auto_22173 )
      ( !UNLOAD ?auto_22172 ?auto_22171 ?auto_22174 ?auto_22173 )
      ( !DROP ?auto_22172 ?auto_22171 ?auto_22170 ?auto_22173 )
      ( MAKE-1CRATE-VERIFY ?auto_22170 ?auto_22171 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22191 - SURFACE
      ?auto_22192 - SURFACE
      ?auto_22193 - SURFACE
    )
    :vars
    (
      ?auto_22197 - HOIST
      ?auto_22195 - PLACE
      ?auto_22198 - PLACE
      ?auto_22196 - HOIST
      ?auto_22199 - SURFACE
      ?auto_22200 - SURFACE
      ?auto_22194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22197 ?auto_22195 ) ( IS-CRATE ?auto_22193 ) ( not ( = ?auto_22198 ?auto_22195 ) ) ( HOIST-AT ?auto_22196 ?auto_22198 ) ( SURFACE-AT ?auto_22193 ?auto_22198 ) ( ON ?auto_22193 ?auto_22199 ) ( CLEAR ?auto_22193 ) ( not ( = ?auto_22192 ?auto_22193 ) ) ( not ( = ?auto_22192 ?auto_22199 ) ) ( not ( = ?auto_22193 ?auto_22199 ) ) ( not ( = ?auto_22197 ?auto_22196 ) ) ( SURFACE-AT ?auto_22191 ?auto_22195 ) ( CLEAR ?auto_22191 ) ( IS-CRATE ?auto_22192 ) ( AVAILABLE ?auto_22197 ) ( AVAILABLE ?auto_22196 ) ( SURFACE-AT ?auto_22192 ?auto_22198 ) ( ON ?auto_22192 ?auto_22200 ) ( CLEAR ?auto_22192 ) ( TRUCK-AT ?auto_22194 ?auto_22195 ) ( not ( = ?auto_22191 ?auto_22192 ) ) ( not ( = ?auto_22191 ?auto_22200 ) ) ( not ( = ?auto_22192 ?auto_22200 ) ) ( not ( = ?auto_22191 ?auto_22193 ) ) ( not ( = ?auto_22191 ?auto_22199 ) ) ( not ( = ?auto_22193 ?auto_22200 ) ) ( not ( = ?auto_22199 ?auto_22200 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22191 ?auto_22192 )
      ( MAKE-1CRATE ?auto_22192 ?auto_22193 )
      ( MAKE-2CRATE-VERIFY ?auto_22191 ?auto_22192 ?auto_22193 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22215 - SURFACE
      ?auto_22216 - SURFACE
      ?auto_22217 - SURFACE
      ?auto_22218 - SURFACE
    )
    :vars
    (
      ?auto_22220 - HOIST
      ?auto_22219 - PLACE
      ?auto_22221 - PLACE
      ?auto_22222 - HOIST
      ?auto_22224 - SURFACE
      ?auto_22226 - PLACE
      ?auto_22225 - HOIST
      ?auto_22228 - SURFACE
      ?auto_22227 - SURFACE
      ?auto_22223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22220 ?auto_22219 ) ( IS-CRATE ?auto_22218 ) ( not ( = ?auto_22221 ?auto_22219 ) ) ( HOIST-AT ?auto_22222 ?auto_22221 ) ( AVAILABLE ?auto_22222 ) ( SURFACE-AT ?auto_22218 ?auto_22221 ) ( ON ?auto_22218 ?auto_22224 ) ( CLEAR ?auto_22218 ) ( not ( = ?auto_22217 ?auto_22218 ) ) ( not ( = ?auto_22217 ?auto_22224 ) ) ( not ( = ?auto_22218 ?auto_22224 ) ) ( not ( = ?auto_22220 ?auto_22222 ) ) ( IS-CRATE ?auto_22217 ) ( not ( = ?auto_22226 ?auto_22219 ) ) ( HOIST-AT ?auto_22225 ?auto_22226 ) ( SURFACE-AT ?auto_22217 ?auto_22226 ) ( ON ?auto_22217 ?auto_22228 ) ( CLEAR ?auto_22217 ) ( not ( = ?auto_22216 ?auto_22217 ) ) ( not ( = ?auto_22216 ?auto_22228 ) ) ( not ( = ?auto_22217 ?auto_22228 ) ) ( not ( = ?auto_22220 ?auto_22225 ) ) ( SURFACE-AT ?auto_22215 ?auto_22219 ) ( CLEAR ?auto_22215 ) ( IS-CRATE ?auto_22216 ) ( AVAILABLE ?auto_22220 ) ( AVAILABLE ?auto_22225 ) ( SURFACE-AT ?auto_22216 ?auto_22226 ) ( ON ?auto_22216 ?auto_22227 ) ( CLEAR ?auto_22216 ) ( TRUCK-AT ?auto_22223 ?auto_22219 ) ( not ( = ?auto_22215 ?auto_22216 ) ) ( not ( = ?auto_22215 ?auto_22227 ) ) ( not ( = ?auto_22216 ?auto_22227 ) ) ( not ( = ?auto_22215 ?auto_22217 ) ) ( not ( = ?auto_22215 ?auto_22228 ) ) ( not ( = ?auto_22217 ?auto_22227 ) ) ( not ( = ?auto_22228 ?auto_22227 ) ) ( not ( = ?auto_22215 ?auto_22218 ) ) ( not ( = ?auto_22215 ?auto_22224 ) ) ( not ( = ?auto_22216 ?auto_22218 ) ) ( not ( = ?auto_22216 ?auto_22224 ) ) ( not ( = ?auto_22218 ?auto_22228 ) ) ( not ( = ?auto_22218 ?auto_22227 ) ) ( not ( = ?auto_22221 ?auto_22226 ) ) ( not ( = ?auto_22222 ?auto_22225 ) ) ( not ( = ?auto_22224 ?auto_22228 ) ) ( not ( = ?auto_22224 ?auto_22227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22215 ?auto_22216 ?auto_22217 )
      ( MAKE-1CRATE ?auto_22217 ?auto_22218 )
      ( MAKE-3CRATE-VERIFY ?auto_22215 ?auto_22216 ?auto_22217 ?auto_22218 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22244 - SURFACE
      ?auto_22245 - SURFACE
      ?auto_22246 - SURFACE
      ?auto_22247 - SURFACE
      ?auto_22248 - SURFACE
    )
    :vars
    (
      ?auto_22252 - HOIST
      ?auto_22250 - PLACE
      ?auto_22251 - PLACE
      ?auto_22249 - HOIST
      ?auto_22254 - SURFACE
      ?auto_22255 - PLACE
      ?auto_22259 - HOIST
      ?auto_22261 - SURFACE
      ?auto_22256 - PLACE
      ?auto_22258 - HOIST
      ?auto_22257 - SURFACE
      ?auto_22260 - SURFACE
      ?auto_22253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22252 ?auto_22250 ) ( IS-CRATE ?auto_22248 ) ( not ( = ?auto_22251 ?auto_22250 ) ) ( HOIST-AT ?auto_22249 ?auto_22251 ) ( AVAILABLE ?auto_22249 ) ( SURFACE-AT ?auto_22248 ?auto_22251 ) ( ON ?auto_22248 ?auto_22254 ) ( CLEAR ?auto_22248 ) ( not ( = ?auto_22247 ?auto_22248 ) ) ( not ( = ?auto_22247 ?auto_22254 ) ) ( not ( = ?auto_22248 ?auto_22254 ) ) ( not ( = ?auto_22252 ?auto_22249 ) ) ( IS-CRATE ?auto_22247 ) ( not ( = ?auto_22255 ?auto_22250 ) ) ( HOIST-AT ?auto_22259 ?auto_22255 ) ( AVAILABLE ?auto_22259 ) ( SURFACE-AT ?auto_22247 ?auto_22255 ) ( ON ?auto_22247 ?auto_22261 ) ( CLEAR ?auto_22247 ) ( not ( = ?auto_22246 ?auto_22247 ) ) ( not ( = ?auto_22246 ?auto_22261 ) ) ( not ( = ?auto_22247 ?auto_22261 ) ) ( not ( = ?auto_22252 ?auto_22259 ) ) ( IS-CRATE ?auto_22246 ) ( not ( = ?auto_22256 ?auto_22250 ) ) ( HOIST-AT ?auto_22258 ?auto_22256 ) ( SURFACE-AT ?auto_22246 ?auto_22256 ) ( ON ?auto_22246 ?auto_22257 ) ( CLEAR ?auto_22246 ) ( not ( = ?auto_22245 ?auto_22246 ) ) ( not ( = ?auto_22245 ?auto_22257 ) ) ( not ( = ?auto_22246 ?auto_22257 ) ) ( not ( = ?auto_22252 ?auto_22258 ) ) ( SURFACE-AT ?auto_22244 ?auto_22250 ) ( CLEAR ?auto_22244 ) ( IS-CRATE ?auto_22245 ) ( AVAILABLE ?auto_22252 ) ( AVAILABLE ?auto_22258 ) ( SURFACE-AT ?auto_22245 ?auto_22256 ) ( ON ?auto_22245 ?auto_22260 ) ( CLEAR ?auto_22245 ) ( TRUCK-AT ?auto_22253 ?auto_22250 ) ( not ( = ?auto_22244 ?auto_22245 ) ) ( not ( = ?auto_22244 ?auto_22260 ) ) ( not ( = ?auto_22245 ?auto_22260 ) ) ( not ( = ?auto_22244 ?auto_22246 ) ) ( not ( = ?auto_22244 ?auto_22257 ) ) ( not ( = ?auto_22246 ?auto_22260 ) ) ( not ( = ?auto_22257 ?auto_22260 ) ) ( not ( = ?auto_22244 ?auto_22247 ) ) ( not ( = ?auto_22244 ?auto_22261 ) ) ( not ( = ?auto_22245 ?auto_22247 ) ) ( not ( = ?auto_22245 ?auto_22261 ) ) ( not ( = ?auto_22247 ?auto_22257 ) ) ( not ( = ?auto_22247 ?auto_22260 ) ) ( not ( = ?auto_22255 ?auto_22256 ) ) ( not ( = ?auto_22259 ?auto_22258 ) ) ( not ( = ?auto_22261 ?auto_22257 ) ) ( not ( = ?auto_22261 ?auto_22260 ) ) ( not ( = ?auto_22244 ?auto_22248 ) ) ( not ( = ?auto_22244 ?auto_22254 ) ) ( not ( = ?auto_22245 ?auto_22248 ) ) ( not ( = ?auto_22245 ?auto_22254 ) ) ( not ( = ?auto_22246 ?auto_22248 ) ) ( not ( = ?auto_22246 ?auto_22254 ) ) ( not ( = ?auto_22248 ?auto_22261 ) ) ( not ( = ?auto_22248 ?auto_22257 ) ) ( not ( = ?auto_22248 ?auto_22260 ) ) ( not ( = ?auto_22251 ?auto_22255 ) ) ( not ( = ?auto_22251 ?auto_22256 ) ) ( not ( = ?auto_22249 ?auto_22259 ) ) ( not ( = ?auto_22249 ?auto_22258 ) ) ( not ( = ?auto_22254 ?auto_22261 ) ) ( not ( = ?auto_22254 ?auto_22257 ) ) ( not ( = ?auto_22254 ?auto_22260 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_22244 ?auto_22245 ?auto_22246 ?auto_22247 )
      ( MAKE-1CRATE ?auto_22247 ?auto_22248 )
      ( MAKE-4CRATE-VERIFY ?auto_22244 ?auto_22245 ?auto_22246 ?auto_22247 ?auto_22248 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22278 - SURFACE
      ?auto_22279 - SURFACE
      ?auto_22280 - SURFACE
      ?auto_22281 - SURFACE
      ?auto_22282 - SURFACE
      ?auto_22283 - SURFACE
    )
    :vars
    (
      ?auto_22287 - HOIST
      ?auto_22285 - PLACE
      ?auto_22284 - PLACE
      ?auto_22286 - HOIST
      ?auto_22288 - SURFACE
      ?auto_22292 - SURFACE
      ?auto_22293 - PLACE
      ?auto_22295 - HOIST
      ?auto_22290 - SURFACE
      ?auto_22297 - PLACE
      ?auto_22296 - HOIST
      ?auto_22294 - SURFACE
      ?auto_22291 - SURFACE
      ?auto_22289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22287 ?auto_22285 ) ( IS-CRATE ?auto_22283 ) ( not ( = ?auto_22284 ?auto_22285 ) ) ( HOIST-AT ?auto_22286 ?auto_22284 ) ( SURFACE-AT ?auto_22283 ?auto_22284 ) ( ON ?auto_22283 ?auto_22288 ) ( CLEAR ?auto_22283 ) ( not ( = ?auto_22282 ?auto_22283 ) ) ( not ( = ?auto_22282 ?auto_22288 ) ) ( not ( = ?auto_22283 ?auto_22288 ) ) ( not ( = ?auto_22287 ?auto_22286 ) ) ( IS-CRATE ?auto_22282 ) ( AVAILABLE ?auto_22286 ) ( SURFACE-AT ?auto_22282 ?auto_22284 ) ( ON ?auto_22282 ?auto_22292 ) ( CLEAR ?auto_22282 ) ( not ( = ?auto_22281 ?auto_22282 ) ) ( not ( = ?auto_22281 ?auto_22292 ) ) ( not ( = ?auto_22282 ?auto_22292 ) ) ( IS-CRATE ?auto_22281 ) ( not ( = ?auto_22293 ?auto_22285 ) ) ( HOIST-AT ?auto_22295 ?auto_22293 ) ( AVAILABLE ?auto_22295 ) ( SURFACE-AT ?auto_22281 ?auto_22293 ) ( ON ?auto_22281 ?auto_22290 ) ( CLEAR ?auto_22281 ) ( not ( = ?auto_22280 ?auto_22281 ) ) ( not ( = ?auto_22280 ?auto_22290 ) ) ( not ( = ?auto_22281 ?auto_22290 ) ) ( not ( = ?auto_22287 ?auto_22295 ) ) ( IS-CRATE ?auto_22280 ) ( not ( = ?auto_22297 ?auto_22285 ) ) ( HOIST-AT ?auto_22296 ?auto_22297 ) ( SURFACE-AT ?auto_22280 ?auto_22297 ) ( ON ?auto_22280 ?auto_22294 ) ( CLEAR ?auto_22280 ) ( not ( = ?auto_22279 ?auto_22280 ) ) ( not ( = ?auto_22279 ?auto_22294 ) ) ( not ( = ?auto_22280 ?auto_22294 ) ) ( not ( = ?auto_22287 ?auto_22296 ) ) ( SURFACE-AT ?auto_22278 ?auto_22285 ) ( CLEAR ?auto_22278 ) ( IS-CRATE ?auto_22279 ) ( AVAILABLE ?auto_22287 ) ( AVAILABLE ?auto_22296 ) ( SURFACE-AT ?auto_22279 ?auto_22297 ) ( ON ?auto_22279 ?auto_22291 ) ( CLEAR ?auto_22279 ) ( TRUCK-AT ?auto_22289 ?auto_22285 ) ( not ( = ?auto_22278 ?auto_22279 ) ) ( not ( = ?auto_22278 ?auto_22291 ) ) ( not ( = ?auto_22279 ?auto_22291 ) ) ( not ( = ?auto_22278 ?auto_22280 ) ) ( not ( = ?auto_22278 ?auto_22294 ) ) ( not ( = ?auto_22280 ?auto_22291 ) ) ( not ( = ?auto_22294 ?auto_22291 ) ) ( not ( = ?auto_22278 ?auto_22281 ) ) ( not ( = ?auto_22278 ?auto_22290 ) ) ( not ( = ?auto_22279 ?auto_22281 ) ) ( not ( = ?auto_22279 ?auto_22290 ) ) ( not ( = ?auto_22281 ?auto_22294 ) ) ( not ( = ?auto_22281 ?auto_22291 ) ) ( not ( = ?auto_22293 ?auto_22297 ) ) ( not ( = ?auto_22295 ?auto_22296 ) ) ( not ( = ?auto_22290 ?auto_22294 ) ) ( not ( = ?auto_22290 ?auto_22291 ) ) ( not ( = ?auto_22278 ?auto_22282 ) ) ( not ( = ?auto_22278 ?auto_22292 ) ) ( not ( = ?auto_22279 ?auto_22282 ) ) ( not ( = ?auto_22279 ?auto_22292 ) ) ( not ( = ?auto_22280 ?auto_22282 ) ) ( not ( = ?auto_22280 ?auto_22292 ) ) ( not ( = ?auto_22282 ?auto_22290 ) ) ( not ( = ?auto_22282 ?auto_22294 ) ) ( not ( = ?auto_22282 ?auto_22291 ) ) ( not ( = ?auto_22284 ?auto_22293 ) ) ( not ( = ?auto_22284 ?auto_22297 ) ) ( not ( = ?auto_22286 ?auto_22295 ) ) ( not ( = ?auto_22286 ?auto_22296 ) ) ( not ( = ?auto_22292 ?auto_22290 ) ) ( not ( = ?auto_22292 ?auto_22294 ) ) ( not ( = ?auto_22292 ?auto_22291 ) ) ( not ( = ?auto_22278 ?auto_22283 ) ) ( not ( = ?auto_22278 ?auto_22288 ) ) ( not ( = ?auto_22279 ?auto_22283 ) ) ( not ( = ?auto_22279 ?auto_22288 ) ) ( not ( = ?auto_22280 ?auto_22283 ) ) ( not ( = ?auto_22280 ?auto_22288 ) ) ( not ( = ?auto_22281 ?auto_22283 ) ) ( not ( = ?auto_22281 ?auto_22288 ) ) ( not ( = ?auto_22283 ?auto_22292 ) ) ( not ( = ?auto_22283 ?auto_22290 ) ) ( not ( = ?auto_22283 ?auto_22294 ) ) ( not ( = ?auto_22283 ?auto_22291 ) ) ( not ( = ?auto_22288 ?auto_22292 ) ) ( not ( = ?auto_22288 ?auto_22290 ) ) ( not ( = ?auto_22288 ?auto_22294 ) ) ( not ( = ?auto_22288 ?auto_22291 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_22278 ?auto_22279 ?auto_22280 ?auto_22281 ?auto_22282 )
      ( MAKE-1CRATE ?auto_22282 ?auto_22283 )
      ( MAKE-5CRATE-VERIFY ?auto_22278 ?auto_22279 ?auto_22280 ?auto_22281 ?auto_22282 ?auto_22283 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_22315 - SURFACE
      ?auto_22316 - SURFACE
      ?auto_22317 - SURFACE
      ?auto_22318 - SURFACE
      ?auto_22319 - SURFACE
      ?auto_22320 - SURFACE
      ?auto_22321 - SURFACE
    )
    :vars
    (
      ?auto_22327 - HOIST
      ?auto_22323 - PLACE
      ?auto_22325 - PLACE
      ?auto_22326 - HOIST
      ?auto_22324 - SURFACE
      ?auto_22330 - PLACE
      ?auto_22337 - HOIST
      ?auto_22331 - SURFACE
      ?auto_22334 - SURFACE
      ?auto_22338 - PLACE
      ?auto_22332 - HOIST
      ?auto_22335 - SURFACE
      ?auto_22333 - PLACE
      ?auto_22329 - HOIST
      ?auto_22328 - SURFACE
      ?auto_22336 - SURFACE
      ?auto_22322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22327 ?auto_22323 ) ( IS-CRATE ?auto_22321 ) ( not ( = ?auto_22325 ?auto_22323 ) ) ( HOIST-AT ?auto_22326 ?auto_22325 ) ( AVAILABLE ?auto_22326 ) ( SURFACE-AT ?auto_22321 ?auto_22325 ) ( ON ?auto_22321 ?auto_22324 ) ( CLEAR ?auto_22321 ) ( not ( = ?auto_22320 ?auto_22321 ) ) ( not ( = ?auto_22320 ?auto_22324 ) ) ( not ( = ?auto_22321 ?auto_22324 ) ) ( not ( = ?auto_22327 ?auto_22326 ) ) ( IS-CRATE ?auto_22320 ) ( not ( = ?auto_22330 ?auto_22323 ) ) ( HOIST-AT ?auto_22337 ?auto_22330 ) ( SURFACE-AT ?auto_22320 ?auto_22330 ) ( ON ?auto_22320 ?auto_22331 ) ( CLEAR ?auto_22320 ) ( not ( = ?auto_22319 ?auto_22320 ) ) ( not ( = ?auto_22319 ?auto_22331 ) ) ( not ( = ?auto_22320 ?auto_22331 ) ) ( not ( = ?auto_22327 ?auto_22337 ) ) ( IS-CRATE ?auto_22319 ) ( AVAILABLE ?auto_22337 ) ( SURFACE-AT ?auto_22319 ?auto_22330 ) ( ON ?auto_22319 ?auto_22334 ) ( CLEAR ?auto_22319 ) ( not ( = ?auto_22318 ?auto_22319 ) ) ( not ( = ?auto_22318 ?auto_22334 ) ) ( not ( = ?auto_22319 ?auto_22334 ) ) ( IS-CRATE ?auto_22318 ) ( not ( = ?auto_22338 ?auto_22323 ) ) ( HOIST-AT ?auto_22332 ?auto_22338 ) ( AVAILABLE ?auto_22332 ) ( SURFACE-AT ?auto_22318 ?auto_22338 ) ( ON ?auto_22318 ?auto_22335 ) ( CLEAR ?auto_22318 ) ( not ( = ?auto_22317 ?auto_22318 ) ) ( not ( = ?auto_22317 ?auto_22335 ) ) ( not ( = ?auto_22318 ?auto_22335 ) ) ( not ( = ?auto_22327 ?auto_22332 ) ) ( IS-CRATE ?auto_22317 ) ( not ( = ?auto_22333 ?auto_22323 ) ) ( HOIST-AT ?auto_22329 ?auto_22333 ) ( SURFACE-AT ?auto_22317 ?auto_22333 ) ( ON ?auto_22317 ?auto_22328 ) ( CLEAR ?auto_22317 ) ( not ( = ?auto_22316 ?auto_22317 ) ) ( not ( = ?auto_22316 ?auto_22328 ) ) ( not ( = ?auto_22317 ?auto_22328 ) ) ( not ( = ?auto_22327 ?auto_22329 ) ) ( SURFACE-AT ?auto_22315 ?auto_22323 ) ( CLEAR ?auto_22315 ) ( IS-CRATE ?auto_22316 ) ( AVAILABLE ?auto_22327 ) ( AVAILABLE ?auto_22329 ) ( SURFACE-AT ?auto_22316 ?auto_22333 ) ( ON ?auto_22316 ?auto_22336 ) ( CLEAR ?auto_22316 ) ( TRUCK-AT ?auto_22322 ?auto_22323 ) ( not ( = ?auto_22315 ?auto_22316 ) ) ( not ( = ?auto_22315 ?auto_22336 ) ) ( not ( = ?auto_22316 ?auto_22336 ) ) ( not ( = ?auto_22315 ?auto_22317 ) ) ( not ( = ?auto_22315 ?auto_22328 ) ) ( not ( = ?auto_22317 ?auto_22336 ) ) ( not ( = ?auto_22328 ?auto_22336 ) ) ( not ( = ?auto_22315 ?auto_22318 ) ) ( not ( = ?auto_22315 ?auto_22335 ) ) ( not ( = ?auto_22316 ?auto_22318 ) ) ( not ( = ?auto_22316 ?auto_22335 ) ) ( not ( = ?auto_22318 ?auto_22328 ) ) ( not ( = ?auto_22318 ?auto_22336 ) ) ( not ( = ?auto_22338 ?auto_22333 ) ) ( not ( = ?auto_22332 ?auto_22329 ) ) ( not ( = ?auto_22335 ?auto_22328 ) ) ( not ( = ?auto_22335 ?auto_22336 ) ) ( not ( = ?auto_22315 ?auto_22319 ) ) ( not ( = ?auto_22315 ?auto_22334 ) ) ( not ( = ?auto_22316 ?auto_22319 ) ) ( not ( = ?auto_22316 ?auto_22334 ) ) ( not ( = ?auto_22317 ?auto_22319 ) ) ( not ( = ?auto_22317 ?auto_22334 ) ) ( not ( = ?auto_22319 ?auto_22335 ) ) ( not ( = ?auto_22319 ?auto_22328 ) ) ( not ( = ?auto_22319 ?auto_22336 ) ) ( not ( = ?auto_22330 ?auto_22338 ) ) ( not ( = ?auto_22330 ?auto_22333 ) ) ( not ( = ?auto_22337 ?auto_22332 ) ) ( not ( = ?auto_22337 ?auto_22329 ) ) ( not ( = ?auto_22334 ?auto_22335 ) ) ( not ( = ?auto_22334 ?auto_22328 ) ) ( not ( = ?auto_22334 ?auto_22336 ) ) ( not ( = ?auto_22315 ?auto_22320 ) ) ( not ( = ?auto_22315 ?auto_22331 ) ) ( not ( = ?auto_22316 ?auto_22320 ) ) ( not ( = ?auto_22316 ?auto_22331 ) ) ( not ( = ?auto_22317 ?auto_22320 ) ) ( not ( = ?auto_22317 ?auto_22331 ) ) ( not ( = ?auto_22318 ?auto_22320 ) ) ( not ( = ?auto_22318 ?auto_22331 ) ) ( not ( = ?auto_22320 ?auto_22334 ) ) ( not ( = ?auto_22320 ?auto_22335 ) ) ( not ( = ?auto_22320 ?auto_22328 ) ) ( not ( = ?auto_22320 ?auto_22336 ) ) ( not ( = ?auto_22331 ?auto_22334 ) ) ( not ( = ?auto_22331 ?auto_22335 ) ) ( not ( = ?auto_22331 ?auto_22328 ) ) ( not ( = ?auto_22331 ?auto_22336 ) ) ( not ( = ?auto_22315 ?auto_22321 ) ) ( not ( = ?auto_22315 ?auto_22324 ) ) ( not ( = ?auto_22316 ?auto_22321 ) ) ( not ( = ?auto_22316 ?auto_22324 ) ) ( not ( = ?auto_22317 ?auto_22321 ) ) ( not ( = ?auto_22317 ?auto_22324 ) ) ( not ( = ?auto_22318 ?auto_22321 ) ) ( not ( = ?auto_22318 ?auto_22324 ) ) ( not ( = ?auto_22319 ?auto_22321 ) ) ( not ( = ?auto_22319 ?auto_22324 ) ) ( not ( = ?auto_22321 ?auto_22331 ) ) ( not ( = ?auto_22321 ?auto_22334 ) ) ( not ( = ?auto_22321 ?auto_22335 ) ) ( not ( = ?auto_22321 ?auto_22328 ) ) ( not ( = ?auto_22321 ?auto_22336 ) ) ( not ( = ?auto_22325 ?auto_22330 ) ) ( not ( = ?auto_22325 ?auto_22338 ) ) ( not ( = ?auto_22325 ?auto_22333 ) ) ( not ( = ?auto_22326 ?auto_22337 ) ) ( not ( = ?auto_22326 ?auto_22332 ) ) ( not ( = ?auto_22326 ?auto_22329 ) ) ( not ( = ?auto_22324 ?auto_22331 ) ) ( not ( = ?auto_22324 ?auto_22334 ) ) ( not ( = ?auto_22324 ?auto_22335 ) ) ( not ( = ?auto_22324 ?auto_22328 ) ) ( not ( = ?auto_22324 ?auto_22336 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_22315 ?auto_22316 ?auto_22317 ?auto_22318 ?auto_22319 ?auto_22320 )
      ( MAKE-1CRATE ?auto_22320 ?auto_22321 )
      ( MAKE-6CRATE-VERIFY ?auto_22315 ?auto_22316 ?auto_22317 ?auto_22318 ?auto_22319 ?auto_22320 ?auto_22321 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_22357 - SURFACE
      ?auto_22358 - SURFACE
      ?auto_22359 - SURFACE
      ?auto_22360 - SURFACE
      ?auto_22361 - SURFACE
      ?auto_22362 - SURFACE
      ?auto_22363 - SURFACE
      ?auto_22364 - SURFACE
    )
    :vars
    (
      ?auto_22370 - HOIST
      ?auto_22367 - PLACE
      ?auto_22366 - PLACE
      ?auto_22365 - HOIST
      ?auto_22368 - SURFACE
      ?auto_22383 - PLACE
      ?auto_22373 - HOIST
      ?auto_22372 - SURFACE
      ?auto_22378 - PLACE
      ?auto_22377 - HOIST
      ?auto_22371 - SURFACE
      ?auto_22375 - SURFACE
      ?auto_22374 - PLACE
      ?auto_22379 - HOIST
      ?auto_22384 - SURFACE
      ?auto_22382 - PLACE
      ?auto_22380 - HOIST
      ?auto_22376 - SURFACE
      ?auto_22381 - SURFACE
      ?auto_22369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22370 ?auto_22367 ) ( IS-CRATE ?auto_22364 ) ( not ( = ?auto_22366 ?auto_22367 ) ) ( HOIST-AT ?auto_22365 ?auto_22366 ) ( AVAILABLE ?auto_22365 ) ( SURFACE-AT ?auto_22364 ?auto_22366 ) ( ON ?auto_22364 ?auto_22368 ) ( CLEAR ?auto_22364 ) ( not ( = ?auto_22363 ?auto_22364 ) ) ( not ( = ?auto_22363 ?auto_22368 ) ) ( not ( = ?auto_22364 ?auto_22368 ) ) ( not ( = ?auto_22370 ?auto_22365 ) ) ( IS-CRATE ?auto_22363 ) ( not ( = ?auto_22383 ?auto_22367 ) ) ( HOIST-AT ?auto_22373 ?auto_22383 ) ( AVAILABLE ?auto_22373 ) ( SURFACE-AT ?auto_22363 ?auto_22383 ) ( ON ?auto_22363 ?auto_22372 ) ( CLEAR ?auto_22363 ) ( not ( = ?auto_22362 ?auto_22363 ) ) ( not ( = ?auto_22362 ?auto_22372 ) ) ( not ( = ?auto_22363 ?auto_22372 ) ) ( not ( = ?auto_22370 ?auto_22373 ) ) ( IS-CRATE ?auto_22362 ) ( not ( = ?auto_22378 ?auto_22367 ) ) ( HOIST-AT ?auto_22377 ?auto_22378 ) ( SURFACE-AT ?auto_22362 ?auto_22378 ) ( ON ?auto_22362 ?auto_22371 ) ( CLEAR ?auto_22362 ) ( not ( = ?auto_22361 ?auto_22362 ) ) ( not ( = ?auto_22361 ?auto_22371 ) ) ( not ( = ?auto_22362 ?auto_22371 ) ) ( not ( = ?auto_22370 ?auto_22377 ) ) ( IS-CRATE ?auto_22361 ) ( AVAILABLE ?auto_22377 ) ( SURFACE-AT ?auto_22361 ?auto_22378 ) ( ON ?auto_22361 ?auto_22375 ) ( CLEAR ?auto_22361 ) ( not ( = ?auto_22360 ?auto_22361 ) ) ( not ( = ?auto_22360 ?auto_22375 ) ) ( not ( = ?auto_22361 ?auto_22375 ) ) ( IS-CRATE ?auto_22360 ) ( not ( = ?auto_22374 ?auto_22367 ) ) ( HOIST-AT ?auto_22379 ?auto_22374 ) ( AVAILABLE ?auto_22379 ) ( SURFACE-AT ?auto_22360 ?auto_22374 ) ( ON ?auto_22360 ?auto_22384 ) ( CLEAR ?auto_22360 ) ( not ( = ?auto_22359 ?auto_22360 ) ) ( not ( = ?auto_22359 ?auto_22384 ) ) ( not ( = ?auto_22360 ?auto_22384 ) ) ( not ( = ?auto_22370 ?auto_22379 ) ) ( IS-CRATE ?auto_22359 ) ( not ( = ?auto_22382 ?auto_22367 ) ) ( HOIST-AT ?auto_22380 ?auto_22382 ) ( SURFACE-AT ?auto_22359 ?auto_22382 ) ( ON ?auto_22359 ?auto_22376 ) ( CLEAR ?auto_22359 ) ( not ( = ?auto_22358 ?auto_22359 ) ) ( not ( = ?auto_22358 ?auto_22376 ) ) ( not ( = ?auto_22359 ?auto_22376 ) ) ( not ( = ?auto_22370 ?auto_22380 ) ) ( SURFACE-AT ?auto_22357 ?auto_22367 ) ( CLEAR ?auto_22357 ) ( IS-CRATE ?auto_22358 ) ( AVAILABLE ?auto_22370 ) ( AVAILABLE ?auto_22380 ) ( SURFACE-AT ?auto_22358 ?auto_22382 ) ( ON ?auto_22358 ?auto_22381 ) ( CLEAR ?auto_22358 ) ( TRUCK-AT ?auto_22369 ?auto_22367 ) ( not ( = ?auto_22357 ?auto_22358 ) ) ( not ( = ?auto_22357 ?auto_22381 ) ) ( not ( = ?auto_22358 ?auto_22381 ) ) ( not ( = ?auto_22357 ?auto_22359 ) ) ( not ( = ?auto_22357 ?auto_22376 ) ) ( not ( = ?auto_22359 ?auto_22381 ) ) ( not ( = ?auto_22376 ?auto_22381 ) ) ( not ( = ?auto_22357 ?auto_22360 ) ) ( not ( = ?auto_22357 ?auto_22384 ) ) ( not ( = ?auto_22358 ?auto_22360 ) ) ( not ( = ?auto_22358 ?auto_22384 ) ) ( not ( = ?auto_22360 ?auto_22376 ) ) ( not ( = ?auto_22360 ?auto_22381 ) ) ( not ( = ?auto_22374 ?auto_22382 ) ) ( not ( = ?auto_22379 ?auto_22380 ) ) ( not ( = ?auto_22384 ?auto_22376 ) ) ( not ( = ?auto_22384 ?auto_22381 ) ) ( not ( = ?auto_22357 ?auto_22361 ) ) ( not ( = ?auto_22357 ?auto_22375 ) ) ( not ( = ?auto_22358 ?auto_22361 ) ) ( not ( = ?auto_22358 ?auto_22375 ) ) ( not ( = ?auto_22359 ?auto_22361 ) ) ( not ( = ?auto_22359 ?auto_22375 ) ) ( not ( = ?auto_22361 ?auto_22384 ) ) ( not ( = ?auto_22361 ?auto_22376 ) ) ( not ( = ?auto_22361 ?auto_22381 ) ) ( not ( = ?auto_22378 ?auto_22374 ) ) ( not ( = ?auto_22378 ?auto_22382 ) ) ( not ( = ?auto_22377 ?auto_22379 ) ) ( not ( = ?auto_22377 ?auto_22380 ) ) ( not ( = ?auto_22375 ?auto_22384 ) ) ( not ( = ?auto_22375 ?auto_22376 ) ) ( not ( = ?auto_22375 ?auto_22381 ) ) ( not ( = ?auto_22357 ?auto_22362 ) ) ( not ( = ?auto_22357 ?auto_22371 ) ) ( not ( = ?auto_22358 ?auto_22362 ) ) ( not ( = ?auto_22358 ?auto_22371 ) ) ( not ( = ?auto_22359 ?auto_22362 ) ) ( not ( = ?auto_22359 ?auto_22371 ) ) ( not ( = ?auto_22360 ?auto_22362 ) ) ( not ( = ?auto_22360 ?auto_22371 ) ) ( not ( = ?auto_22362 ?auto_22375 ) ) ( not ( = ?auto_22362 ?auto_22384 ) ) ( not ( = ?auto_22362 ?auto_22376 ) ) ( not ( = ?auto_22362 ?auto_22381 ) ) ( not ( = ?auto_22371 ?auto_22375 ) ) ( not ( = ?auto_22371 ?auto_22384 ) ) ( not ( = ?auto_22371 ?auto_22376 ) ) ( not ( = ?auto_22371 ?auto_22381 ) ) ( not ( = ?auto_22357 ?auto_22363 ) ) ( not ( = ?auto_22357 ?auto_22372 ) ) ( not ( = ?auto_22358 ?auto_22363 ) ) ( not ( = ?auto_22358 ?auto_22372 ) ) ( not ( = ?auto_22359 ?auto_22363 ) ) ( not ( = ?auto_22359 ?auto_22372 ) ) ( not ( = ?auto_22360 ?auto_22363 ) ) ( not ( = ?auto_22360 ?auto_22372 ) ) ( not ( = ?auto_22361 ?auto_22363 ) ) ( not ( = ?auto_22361 ?auto_22372 ) ) ( not ( = ?auto_22363 ?auto_22371 ) ) ( not ( = ?auto_22363 ?auto_22375 ) ) ( not ( = ?auto_22363 ?auto_22384 ) ) ( not ( = ?auto_22363 ?auto_22376 ) ) ( not ( = ?auto_22363 ?auto_22381 ) ) ( not ( = ?auto_22383 ?auto_22378 ) ) ( not ( = ?auto_22383 ?auto_22374 ) ) ( not ( = ?auto_22383 ?auto_22382 ) ) ( not ( = ?auto_22373 ?auto_22377 ) ) ( not ( = ?auto_22373 ?auto_22379 ) ) ( not ( = ?auto_22373 ?auto_22380 ) ) ( not ( = ?auto_22372 ?auto_22371 ) ) ( not ( = ?auto_22372 ?auto_22375 ) ) ( not ( = ?auto_22372 ?auto_22384 ) ) ( not ( = ?auto_22372 ?auto_22376 ) ) ( not ( = ?auto_22372 ?auto_22381 ) ) ( not ( = ?auto_22357 ?auto_22364 ) ) ( not ( = ?auto_22357 ?auto_22368 ) ) ( not ( = ?auto_22358 ?auto_22364 ) ) ( not ( = ?auto_22358 ?auto_22368 ) ) ( not ( = ?auto_22359 ?auto_22364 ) ) ( not ( = ?auto_22359 ?auto_22368 ) ) ( not ( = ?auto_22360 ?auto_22364 ) ) ( not ( = ?auto_22360 ?auto_22368 ) ) ( not ( = ?auto_22361 ?auto_22364 ) ) ( not ( = ?auto_22361 ?auto_22368 ) ) ( not ( = ?auto_22362 ?auto_22364 ) ) ( not ( = ?auto_22362 ?auto_22368 ) ) ( not ( = ?auto_22364 ?auto_22372 ) ) ( not ( = ?auto_22364 ?auto_22371 ) ) ( not ( = ?auto_22364 ?auto_22375 ) ) ( not ( = ?auto_22364 ?auto_22384 ) ) ( not ( = ?auto_22364 ?auto_22376 ) ) ( not ( = ?auto_22364 ?auto_22381 ) ) ( not ( = ?auto_22366 ?auto_22383 ) ) ( not ( = ?auto_22366 ?auto_22378 ) ) ( not ( = ?auto_22366 ?auto_22374 ) ) ( not ( = ?auto_22366 ?auto_22382 ) ) ( not ( = ?auto_22365 ?auto_22373 ) ) ( not ( = ?auto_22365 ?auto_22377 ) ) ( not ( = ?auto_22365 ?auto_22379 ) ) ( not ( = ?auto_22365 ?auto_22380 ) ) ( not ( = ?auto_22368 ?auto_22372 ) ) ( not ( = ?auto_22368 ?auto_22371 ) ) ( not ( = ?auto_22368 ?auto_22375 ) ) ( not ( = ?auto_22368 ?auto_22384 ) ) ( not ( = ?auto_22368 ?auto_22376 ) ) ( not ( = ?auto_22368 ?auto_22381 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_22357 ?auto_22358 ?auto_22359 ?auto_22360 ?auto_22361 ?auto_22362 ?auto_22363 )
      ( MAKE-1CRATE ?auto_22363 ?auto_22364 )
      ( MAKE-7CRATE-VERIFY ?auto_22357 ?auto_22358 ?auto_22359 ?auto_22360 ?auto_22361 ?auto_22362 ?auto_22363 ?auto_22364 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_22404 - SURFACE
      ?auto_22405 - SURFACE
      ?auto_22406 - SURFACE
      ?auto_22407 - SURFACE
      ?auto_22408 - SURFACE
      ?auto_22409 - SURFACE
      ?auto_22410 - SURFACE
      ?auto_22411 - SURFACE
      ?auto_22412 - SURFACE
    )
    :vars
    (
      ?auto_22415 - HOIST
      ?auto_22418 - PLACE
      ?auto_22413 - PLACE
      ?auto_22417 - HOIST
      ?auto_22414 - SURFACE
      ?auto_22425 - PLACE
      ?auto_22429 - HOIST
      ?auto_22431 - SURFACE
      ?auto_22427 - PLACE
      ?auto_22432 - HOIST
      ?auto_22428 - SURFACE
      ?auto_22423 - PLACE
      ?auto_22419 - HOIST
      ?auto_22424 - SURFACE
      ?auto_22421 - SURFACE
      ?auto_22426 - PLACE
      ?auto_22433 - HOIST
      ?auto_22420 - SURFACE
      ?auto_22422 - SURFACE
      ?auto_22430 - SURFACE
      ?auto_22416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22415 ?auto_22418 ) ( IS-CRATE ?auto_22412 ) ( not ( = ?auto_22413 ?auto_22418 ) ) ( HOIST-AT ?auto_22417 ?auto_22413 ) ( SURFACE-AT ?auto_22412 ?auto_22413 ) ( ON ?auto_22412 ?auto_22414 ) ( CLEAR ?auto_22412 ) ( not ( = ?auto_22411 ?auto_22412 ) ) ( not ( = ?auto_22411 ?auto_22414 ) ) ( not ( = ?auto_22412 ?auto_22414 ) ) ( not ( = ?auto_22415 ?auto_22417 ) ) ( IS-CRATE ?auto_22411 ) ( not ( = ?auto_22425 ?auto_22418 ) ) ( HOIST-AT ?auto_22429 ?auto_22425 ) ( AVAILABLE ?auto_22429 ) ( SURFACE-AT ?auto_22411 ?auto_22425 ) ( ON ?auto_22411 ?auto_22431 ) ( CLEAR ?auto_22411 ) ( not ( = ?auto_22410 ?auto_22411 ) ) ( not ( = ?auto_22410 ?auto_22431 ) ) ( not ( = ?auto_22411 ?auto_22431 ) ) ( not ( = ?auto_22415 ?auto_22429 ) ) ( IS-CRATE ?auto_22410 ) ( not ( = ?auto_22427 ?auto_22418 ) ) ( HOIST-AT ?auto_22432 ?auto_22427 ) ( AVAILABLE ?auto_22432 ) ( SURFACE-AT ?auto_22410 ?auto_22427 ) ( ON ?auto_22410 ?auto_22428 ) ( CLEAR ?auto_22410 ) ( not ( = ?auto_22409 ?auto_22410 ) ) ( not ( = ?auto_22409 ?auto_22428 ) ) ( not ( = ?auto_22410 ?auto_22428 ) ) ( not ( = ?auto_22415 ?auto_22432 ) ) ( IS-CRATE ?auto_22409 ) ( not ( = ?auto_22423 ?auto_22418 ) ) ( HOIST-AT ?auto_22419 ?auto_22423 ) ( SURFACE-AT ?auto_22409 ?auto_22423 ) ( ON ?auto_22409 ?auto_22424 ) ( CLEAR ?auto_22409 ) ( not ( = ?auto_22408 ?auto_22409 ) ) ( not ( = ?auto_22408 ?auto_22424 ) ) ( not ( = ?auto_22409 ?auto_22424 ) ) ( not ( = ?auto_22415 ?auto_22419 ) ) ( IS-CRATE ?auto_22408 ) ( AVAILABLE ?auto_22419 ) ( SURFACE-AT ?auto_22408 ?auto_22423 ) ( ON ?auto_22408 ?auto_22421 ) ( CLEAR ?auto_22408 ) ( not ( = ?auto_22407 ?auto_22408 ) ) ( not ( = ?auto_22407 ?auto_22421 ) ) ( not ( = ?auto_22408 ?auto_22421 ) ) ( IS-CRATE ?auto_22407 ) ( not ( = ?auto_22426 ?auto_22418 ) ) ( HOIST-AT ?auto_22433 ?auto_22426 ) ( AVAILABLE ?auto_22433 ) ( SURFACE-AT ?auto_22407 ?auto_22426 ) ( ON ?auto_22407 ?auto_22420 ) ( CLEAR ?auto_22407 ) ( not ( = ?auto_22406 ?auto_22407 ) ) ( not ( = ?auto_22406 ?auto_22420 ) ) ( not ( = ?auto_22407 ?auto_22420 ) ) ( not ( = ?auto_22415 ?auto_22433 ) ) ( IS-CRATE ?auto_22406 ) ( SURFACE-AT ?auto_22406 ?auto_22413 ) ( ON ?auto_22406 ?auto_22422 ) ( CLEAR ?auto_22406 ) ( not ( = ?auto_22405 ?auto_22406 ) ) ( not ( = ?auto_22405 ?auto_22422 ) ) ( not ( = ?auto_22406 ?auto_22422 ) ) ( SURFACE-AT ?auto_22404 ?auto_22418 ) ( CLEAR ?auto_22404 ) ( IS-CRATE ?auto_22405 ) ( AVAILABLE ?auto_22415 ) ( AVAILABLE ?auto_22417 ) ( SURFACE-AT ?auto_22405 ?auto_22413 ) ( ON ?auto_22405 ?auto_22430 ) ( CLEAR ?auto_22405 ) ( TRUCK-AT ?auto_22416 ?auto_22418 ) ( not ( = ?auto_22404 ?auto_22405 ) ) ( not ( = ?auto_22404 ?auto_22430 ) ) ( not ( = ?auto_22405 ?auto_22430 ) ) ( not ( = ?auto_22404 ?auto_22406 ) ) ( not ( = ?auto_22404 ?auto_22422 ) ) ( not ( = ?auto_22406 ?auto_22430 ) ) ( not ( = ?auto_22422 ?auto_22430 ) ) ( not ( = ?auto_22404 ?auto_22407 ) ) ( not ( = ?auto_22404 ?auto_22420 ) ) ( not ( = ?auto_22405 ?auto_22407 ) ) ( not ( = ?auto_22405 ?auto_22420 ) ) ( not ( = ?auto_22407 ?auto_22422 ) ) ( not ( = ?auto_22407 ?auto_22430 ) ) ( not ( = ?auto_22426 ?auto_22413 ) ) ( not ( = ?auto_22433 ?auto_22417 ) ) ( not ( = ?auto_22420 ?auto_22422 ) ) ( not ( = ?auto_22420 ?auto_22430 ) ) ( not ( = ?auto_22404 ?auto_22408 ) ) ( not ( = ?auto_22404 ?auto_22421 ) ) ( not ( = ?auto_22405 ?auto_22408 ) ) ( not ( = ?auto_22405 ?auto_22421 ) ) ( not ( = ?auto_22406 ?auto_22408 ) ) ( not ( = ?auto_22406 ?auto_22421 ) ) ( not ( = ?auto_22408 ?auto_22420 ) ) ( not ( = ?auto_22408 ?auto_22422 ) ) ( not ( = ?auto_22408 ?auto_22430 ) ) ( not ( = ?auto_22423 ?auto_22426 ) ) ( not ( = ?auto_22423 ?auto_22413 ) ) ( not ( = ?auto_22419 ?auto_22433 ) ) ( not ( = ?auto_22419 ?auto_22417 ) ) ( not ( = ?auto_22421 ?auto_22420 ) ) ( not ( = ?auto_22421 ?auto_22422 ) ) ( not ( = ?auto_22421 ?auto_22430 ) ) ( not ( = ?auto_22404 ?auto_22409 ) ) ( not ( = ?auto_22404 ?auto_22424 ) ) ( not ( = ?auto_22405 ?auto_22409 ) ) ( not ( = ?auto_22405 ?auto_22424 ) ) ( not ( = ?auto_22406 ?auto_22409 ) ) ( not ( = ?auto_22406 ?auto_22424 ) ) ( not ( = ?auto_22407 ?auto_22409 ) ) ( not ( = ?auto_22407 ?auto_22424 ) ) ( not ( = ?auto_22409 ?auto_22421 ) ) ( not ( = ?auto_22409 ?auto_22420 ) ) ( not ( = ?auto_22409 ?auto_22422 ) ) ( not ( = ?auto_22409 ?auto_22430 ) ) ( not ( = ?auto_22424 ?auto_22421 ) ) ( not ( = ?auto_22424 ?auto_22420 ) ) ( not ( = ?auto_22424 ?auto_22422 ) ) ( not ( = ?auto_22424 ?auto_22430 ) ) ( not ( = ?auto_22404 ?auto_22410 ) ) ( not ( = ?auto_22404 ?auto_22428 ) ) ( not ( = ?auto_22405 ?auto_22410 ) ) ( not ( = ?auto_22405 ?auto_22428 ) ) ( not ( = ?auto_22406 ?auto_22410 ) ) ( not ( = ?auto_22406 ?auto_22428 ) ) ( not ( = ?auto_22407 ?auto_22410 ) ) ( not ( = ?auto_22407 ?auto_22428 ) ) ( not ( = ?auto_22408 ?auto_22410 ) ) ( not ( = ?auto_22408 ?auto_22428 ) ) ( not ( = ?auto_22410 ?auto_22424 ) ) ( not ( = ?auto_22410 ?auto_22421 ) ) ( not ( = ?auto_22410 ?auto_22420 ) ) ( not ( = ?auto_22410 ?auto_22422 ) ) ( not ( = ?auto_22410 ?auto_22430 ) ) ( not ( = ?auto_22427 ?auto_22423 ) ) ( not ( = ?auto_22427 ?auto_22426 ) ) ( not ( = ?auto_22427 ?auto_22413 ) ) ( not ( = ?auto_22432 ?auto_22419 ) ) ( not ( = ?auto_22432 ?auto_22433 ) ) ( not ( = ?auto_22432 ?auto_22417 ) ) ( not ( = ?auto_22428 ?auto_22424 ) ) ( not ( = ?auto_22428 ?auto_22421 ) ) ( not ( = ?auto_22428 ?auto_22420 ) ) ( not ( = ?auto_22428 ?auto_22422 ) ) ( not ( = ?auto_22428 ?auto_22430 ) ) ( not ( = ?auto_22404 ?auto_22411 ) ) ( not ( = ?auto_22404 ?auto_22431 ) ) ( not ( = ?auto_22405 ?auto_22411 ) ) ( not ( = ?auto_22405 ?auto_22431 ) ) ( not ( = ?auto_22406 ?auto_22411 ) ) ( not ( = ?auto_22406 ?auto_22431 ) ) ( not ( = ?auto_22407 ?auto_22411 ) ) ( not ( = ?auto_22407 ?auto_22431 ) ) ( not ( = ?auto_22408 ?auto_22411 ) ) ( not ( = ?auto_22408 ?auto_22431 ) ) ( not ( = ?auto_22409 ?auto_22411 ) ) ( not ( = ?auto_22409 ?auto_22431 ) ) ( not ( = ?auto_22411 ?auto_22428 ) ) ( not ( = ?auto_22411 ?auto_22424 ) ) ( not ( = ?auto_22411 ?auto_22421 ) ) ( not ( = ?auto_22411 ?auto_22420 ) ) ( not ( = ?auto_22411 ?auto_22422 ) ) ( not ( = ?auto_22411 ?auto_22430 ) ) ( not ( = ?auto_22425 ?auto_22427 ) ) ( not ( = ?auto_22425 ?auto_22423 ) ) ( not ( = ?auto_22425 ?auto_22426 ) ) ( not ( = ?auto_22425 ?auto_22413 ) ) ( not ( = ?auto_22429 ?auto_22432 ) ) ( not ( = ?auto_22429 ?auto_22419 ) ) ( not ( = ?auto_22429 ?auto_22433 ) ) ( not ( = ?auto_22429 ?auto_22417 ) ) ( not ( = ?auto_22431 ?auto_22428 ) ) ( not ( = ?auto_22431 ?auto_22424 ) ) ( not ( = ?auto_22431 ?auto_22421 ) ) ( not ( = ?auto_22431 ?auto_22420 ) ) ( not ( = ?auto_22431 ?auto_22422 ) ) ( not ( = ?auto_22431 ?auto_22430 ) ) ( not ( = ?auto_22404 ?auto_22412 ) ) ( not ( = ?auto_22404 ?auto_22414 ) ) ( not ( = ?auto_22405 ?auto_22412 ) ) ( not ( = ?auto_22405 ?auto_22414 ) ) ( not ( = ?auto_22406 ?auto_22412 ) ) ( not ( = ?auto_22406 ?auto_22414 ) ) ( not ( = ?auto_22407 ?auto_22412 ) ) ( not ( = ?auto_22407 ?auto_22414 ) ) ( not ( = ?auto_22408 ?auto_22412 ) ) ( not ( = ?auto_22408 ?auto_22414 ) ) ( not ( = ?auto_22409 ?auto_22412 ) ) ( not ( = ?auto_22409 ?auto_22414 ) ) ( not ( = ?auto_22410 ?auto_22412 ) ) ( not ( = ?auto_22410 ?auto_22414 ) ) ( not ( = ?auto_22412 ?auto_22431 ) ) ( not ( = ?auto_22412 ?auto_22428 ) ) ( not ( = ?auto_22412 ?auto_22424 ) ) ( not ( = ?auto_22412 ?auto_22421 ) ) ( not ( = ?auto_22412 ?auto_22420 ) ) ( not ( = ?auto_22412 ?auto_22422 ) ) ( not ( = ?auto_22412 ?auto_22430 ) ) ( not ( = ?auto_22414 ?auto_22431 ) ) ( not ( = ?auto_22414 ?auto_22428 ) ) ( not ( = ?auto_22414 ?auto_22424 ) ) ( not ( = ?auto_22414 ?auto_22421 ) ) ( not ( = ?auto_22414 ?auto_22420 ) ) ( not ( = ?auto_22414 ?auto_22422 ) ) ( not ( = ?auto_22414 ?auto_22430 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_22404 ?auto_22405 ?auto_22406 ?auto_22407 ?auto_22408 ?auto_22409 ?auto_22410 ?auto_22411 )
      ( MAKE-1CRATE ?auto_22411 ?auto_22412 )
      ( MAKE-8CRATE-VERIFY ?auto_22404 ?auto_22405 ?auto_22406 ?auto_22407 ?auto_22408 ?auto_22409 ?auto_22410 ?auto_22411 ?auto_22412 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_22454 - SURFACE
      ?auto_22455 - SURFACE
      ?auto_22456 - SURFACE
      ?auto_22457 - SURFACE
      ?auto_22458 - SURFACE
      ?auto_22459 - SURFACE
      ?auto_22460 - SURFACE
      ?auto_22461 - SURFACE
      ?auto_22462 - SURFACE
      ?auto_22463 - SURFACE
    )
    :vars
    (
      ?auto_22469 - HOIST
      ?auto_22467 - PLACE
      ?auto_22464 - PLACE
      ?auto_22465 - HOIST
      ?auto_22466 - SURFACE
      ?auto_22487 - PLACE
      ?auto_22470 - HOIST
      ?auto_22478 - SURFACE
      ?auto_22486 - PLACE
      ?auto_22485 - HOIST
      ?auto_22481 - SURFACE
      ?auto_22473 - PLACE
      ?auto_22479 - HOIST
      ?auto_22476 - SURFACE
      ?auto_22474 - PLACE
      ?auto_22475 - HOIST
      ?auto_22480 - SURFACE
      ?auto_22472 - SURFACE
      ?auto_22477 - PLACE
      ?auto_22483 - HOIST
      ?auto_22484 - SURFACE
      ?auto_22471 - SURFACE
      ?auto_22482 - SURFACE
      ?auto_22468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22469 ?auto_22467 ) ( IS-CRATE ?auto_22463 ) ( not ( = ?auto_22464 ?auto_22467 ) ) ( HOIST-AT ?auto_22465 ?auto_22464 ) ( AVAILABLE ?auto_22465 ) ( SURFACE-AT ?auto_22463 ?auto_22464 ) ( ON ?auto_22463 ?auto_22466 ) ( CLEAR ?auto_22463 ) ( not ( = ?auto_22462 ?auto_22463 ) ) ( not ( = ?auto_22462 ?auto_22466 ) ) ( not ( = ?auto_22463 ?auto_22466 ) ) ( not ( = ?auto_22469 ?auto_22465 ) ) ( IS-CRATE ?auto_22462 ) ( not ( = ?auto_22487 ?auto_22467 ) ) ( HOIST-AT ?auto_22470 ?auto_22487 ) ( SURFACE-AT ?auto_22462 ?auto_22487 ) ( ON ?auto_22462 ?auto_22478 ) ( CLEAR ?auto_22462 ) ( not ( = ?auto_22461 ?auto_22462 ) ) ( not ( = ?auto_22461 ?auto_22478 ) ) ( not ( = ?auto_22462 ?auto_22478 ) ) ( not ( = ?auto_22469 ?auto_22470 ) ) ( IS-CRATE ?auto_22461 ) ( not ( = ?auto_22486 ?auto_22467 ) ) ( HOIST-AT ?auto_22485 ?auto_22486 ) ( AVAILABLE ?auto_22485 ) ( SURFACE-AT ?auto_22461 ?auto_22486 ) ( ON ?auto_22461 ?auto_22481 ) ( CLEAR ?auto_22461 ) ( not ( = ?auto_22460 ?auto_22461 ) ) ( not ( = ?auto_22460 ?auto_22481 ) ) ( not ( = ?auto_22461 ?auto_22481 ) ) ( not ( = ?auto_22469 ?auto_22485 ) ) ( IS-CRATE ?auto_22460 ) ( not ( = ?auto_22473 ?auto_22467 ) ) ( HOIST-AT ?auto_22479 ?auto_22473 ) ( AVAILABLE ?auto_22479 ) ( SURFACE-AT ?auto_22460 ?auto_22473 ) ( ON ?auto_22460 ?auto_22476 ) ( CLEAR ?auto_22460 ) ( not ( = ?auto_22459 ?auto_22460 ) ) ( not ( = ?auto_22459 ?auto_22476 ) ) ( not ( = ?auto_22460 ?auto_22476 ) ) ( not ( = ?auto_22469 ?auto_22479 ) ) ( IS-CRATE ?auto_22459 ) ( not ( = ?auto_22474 ?auto_22467 ) ) ( HOIST-AT ?auto_22475 ?auto_22474 ) ( SURFACE-AT ?auto_22459 ?auto_22474 ) ( ON ?auto_22459 ?auto_22480 ) ( CLEAR ?auto_22459 ) ( not ( = ?auto_22458 ?auto_22459 ) ) ( not ( = ?auto_22458 ?auto_22480 ) ) ( not ( = ?auto_22459 ?auto_22480 ) ) ( not ( = ?auto_22469 ?auto_22475 ) ) ( IS-CRATE ?auto_22458 ) ( AVAILABLE ?auto_22475 ) ( SURFACE-AT ?auto_22458 ?auto_22474 ) ( ON ?auto_22458 ?auto_22472 ) ( CLEAR ?auto_22458 ) ( not ( = ?auto_22457 ?auto_22458 ) ) ( not ( = ?auto_22457 ?auto_22472 ) ) ( not ( = ?auto_22458 ?auto_22472 ) ) ( IS-CRATE ?auto_22457 ) ( not ( = ?auto_22477 ?auto_22467 ) ) ( HOIST-AT ?auto_22483 ?auto_22477 ) ( AVAILABLE ?auto_22483 ) ( SURFACE-AT ?auto_22457 ?auto_22477 ) ( ON ?auto_22457 ?auto_22484 ) ( CLEAR ?auto_22457 ) ( not ( = ?auto_22456 ?auto_22457 ) ) ( not ( = ?auto_22456 ?auto_22484 ) ) ( not ( = ?auto_22457 ?auto_22484 ) ) ( not ( = ?auto_22469 ?auto_22483 ) ) ( IS-CRATE ?auto_22456 ) ( SURFACE-AT ?auto_22456 ?auto_22487 ) ( ON ?auto_22456 ?auto_22471 ) ( CLEAR ?auto_22456 ) ( not ( = ?auto_22455 ?auto_22456 ) ) ( not ( = ?auto_22455 ?auto_22471 ) ) ( not ( = ?auto_22456 ?auto_22471 ) ) ( SURFACE-AT ?auto_22454 ?auto_22467 ) ( CLEAR ?auto_22454 ) ( IS-CRATE ?auto_22455 ) ( AVAILABLE ?auto_22469 ) ( AVAILABLE ?auto_22470 ) ( SURFACE-AT ?auto_22455 ?auto_22487 ) ( ON ?auto_22455 ?auto_22482 ) ( CLEAR ?auto_22455 ) ( TRUCK-AT ?auto_22468 ?auto_22467 ) ( not ( = ?auto_22454 ?auto_22455 ) ) ( not ( = ?auto_22454 ?auto_22482 ) ) ( not ( = ?auto_22455 ?auto_22482 ) ) ( not ( = ?auto_22454 ?auto_22456 ) ) ( not ( = ?auto_22454 ?auto_22471 ) ) ( not ( = ?auto_22456 ?auto_22482 ) ) ( not ( = ?auto_22471 ?auto_22482 ) ) ( not ( = ?auto_22454 ?auto_22457 ) ) ( not ( = ?auto_22454 ?auto_22484 ) ) ( not ( = ?auto_22455 ?auto_22457 ) ) ( not ( = ?auto_22455 ?auto_22484 ) ) ( not ( = ?auto_22457 ?auto_22471 ) ) ( not ( = ?auto_22457 ?auto_22482 ) ) ( not ( = ?auto_22477 ?auto_22487 ) ) ( not ( = ?auto_22483 ?auto_22470 ) ) ( not ( = ?auto_22484 ?auto_22471 ) ) ( not ( = ?auto_22484 ?auto_22482 ) ) ( not ( = ?auto_22454 ?auto_22458 ) ) ( not ( = ?auto_22454 ?auto_22472 ) ) ( not ( = ?auto_22455 ?auto_22458 ) ) ( not ( = ?auto_22455 ?auto_22472 ) ) ( not ( = ?auto_22456 ?auto_22458 ) ) ( not ( = ?auto_22456 ?auto_22472 ) ) ( not ( = ?auto_22458 ?auto_22484 ) ) ( not ( = ?auto_22458 ?auto_22471 ) ) ( not ( = ?auto_22458 ?auto_22482 ) ) ( not ( = ?auto_22474 ?auto_22477 ) ) ( not ( = ?auto_22474 ?auto_22487 ) ) ( not ( = ?auto_22475 ?auto_22483 ) ) ( not ( = ?auto_22475 ?auto_22470 ) ) ( not ( = ?auto_22472 ?auto_22484 ) ) ( not ( = ?auto_22472 ?auto_22471 ) ) ( not ( = ?auto_22472 ?auto_22482 ) ) ( not ( = ?auto_22454 ?auto_22459 ) ) ( not ( = ?auto_22454 ?auto_22480 ) ) ( not ( = ?auto_22455 ?auto_22459 ) ) ( not ( = ?auto_22455 ?auto_22480 ) ) ( not ( = ?auto_22456 ?auto_22459 ) ) ( not ( = ?auto_22456 ?auto_22480 ) ) ( not ( = ?auto_22457 ?auto_22459 ) ) ( not ( = ?auto_22457 ?auto_22480 ) ) ( not ( = ?auto_22459 ?auto_22472 ) ) ( not ( = ?auto_22459 ?auto_22484 ) ) ( not ( = ?auto_22459 ?auto_22471 ) ) ( not ( = ?auto_22459 ?auto_22482 ) ) ( not ( = ?auto_22480 ?auto_22472 ) ) ( not ( = ?auto_22480 ?auto_22484 ) ) ( not ( = ?auto_22480 ?auto_22471 ) ) ( not ( = ?auto_22480 ?auto_22482 ) ) ( not ( = ?auto_22454 ?auto_22460 ) ) ( not ( = ?auto_22454 ?auto_22476 ) ) ( not ( = ?auto_22455 ?auto_22460 ) ) ( not ( = ?auto_22455 ?auto_22476 ) ) ( not ( = ?auto_22456 ?auto_22460 ) ) ( not ( = ?auto_22456 ?auto_22476 ) ) ( not ( = ?auto_22457 ?auto_22460 ) ) ( not ( = ?auto_22457 ?auto_22476 ) ) ( not ( = ?auto_22458 ?auto_22460 ) ) ( not ( = ?auto_22458 ?auto_22476 ) ) ( not ( = ?auto_22460 ?auto_22480 ) ) ( not ( = ?auto_22460 ?auto_22472 ) ) ( not ( = ?auto_22460 ?auto_22484 ) ) ( not ( = ?auto_22460 ?auto_22471 ) ) ( not ( = ?auto_22460 ?auto_22482 ) ) ( not ( = ?auto_22473 ?auto_22474 ) ) ( not ( = ?auto_22473 ?auto_22477 ) ) ( not ( = ?auto_22473 ?auto_22487 ) ) ( not ( = ?auto_22479 ?auto_22475 ) ) ( not ( = ?auto_22479 ?auto_22483 ) ) ( not ( = ?auto_22479 ?auto_22470 ) ) ( not ( = ?auto_22476 ?auto_22480 ) ) ( not ( = ?auto_22476 ?auto_22472 ) ) ( not ( = ?auto_22476 ?auto_22484 ) ) ( not ( = ?auto_22476 ?auto_22471 ) ) ( not ( = ?auto_22476 ?auto_22482 ) ) ( not ( = ?auto_22454 ?auto_22461 ) ) ( not ( = ?auto_22454 ?auto_22481 ) ) ( not ( = ?auto_22455 ?auto_22461 ) ) ( not ( = ?auto_22455 ?auto_22481 ) ) ( not ( = ?auto_22456 ?auto_22461 ) ) ( not ( = ?auto_22456 ?auto_22481 ) ) ( not ( = ?auto_22457 ?auto_22461 ) ) ( not ( = ?auto_22457 ?auto_22481 ) ) ( not ( = ?auto_22458 ?auto_22461 ) ) ( not ( = ?auto_22458 ?auto_22481 ) ) ( not ( = ?auto_22459 ?auto_22461 ) ) ( not ( = ?auto_22459 ?auto_22481 ) ) ( not ( = ?auto_22461 ?auto_22476 ) ) ( not ( = ?auto_22461 ?auto_22480 ) ) ( not ( = ?auto_22461 ?auto_22472 ) ) ( not ( = ?auto_22461 ?auto_22484 ) ) ( not ( = ?auto_22461 ?auto_22471 ) ) ( not ( = ?auto_22461 ?auto_22482 ) ) ( not ( = ?auto_22486 ?auto_22473 ) ) ( not ( = ?auto_22486 ?auto_22474 ) ) ( not ( = ?auto_22486 ?auto_22477 ) ) ( not ( = ?auto_22486 ?auto_22487 ) ) ( not ( = ?auto_22485 ?auto_22479 ) ) ( not ( = ?auto_22485 ?auto_22475 ) ) ( not ( = ?auto_22485 ?auto_22483 ) ) ( not ( = ?auto_22485 ?auto_22470 ) ) ( not ( = ?auto_22481 ?auto_22476 ) ) ( not ( = ?auto_22481 ?auto_22480 ) ) ( not ( = ?auto_22481 ?auto_22472 ) ) ( not ( = ?auto_22481 ?auto_22484 ) ) ( not ( = ?auto_22481 ?auto_22471 ) ) ( not ( = ?auto_22481 ?auto_22482 ) ) ( not ( = ?auto_22454 ?auto_22462 ) ) ( not ( = ?auto_22454 ?auto_22478 ) ) ( not ( = ?auto_22455 ?auto_22462 ) ) ( not ( = ?auto_22455 ?auto_22478 ) ) ( not ( = ?auto_22456 ?auto_22462 ) ) ( not ( = ?auto_22456 ?auto_22478 ) ) ( not ( = ?auto_22457 ?auto_22462 ) ) ( not ( = ?auto_22457 ?auto_22478 ) ) ( not ( = ?auto_22458 ?auto_22462 ) ) ( not ( = ?auto_22458 ?auto_22478 ) ) ( not ( = ?auto_22459 ?auto_22462 ) ) ( not ( = ?auto_22459 ?auto_22478 ) ) ( not ( = ?auto_22460 ?auto_22462 ) ) ( not ( = ?auto_22460 ?auto_22478 ) ) ( not ( = ?auto_22462 ?auto_22481 ) ) ( not ( = ?auto_22462 ?auto_22476 ) ) ( not ( = ?auto_22462 ?auto_22480 ) ) ( not ( = ?auto_22462 ?auto_22472 ) ) ( not ( = ?auto_22462 ?auto_22484 ) ) ( not ( = ?auto_22462 ?auto_22471 ) ) ( not ( = ?auto_22462 ?auto_22482 ) ) ( not ( = ?auto_22478 ?auto_22481 ) ) ( not ( = ?auto_22478 ?auto_22476 ) ) ( not ( = ?auto_22478 ?auto_22480 ) ) ( not ( = ?auto_22478 ?auto_22472 ) ) ( not ( = ?auto_22478 ?auto_22484 ) ) ( not ( = ?auto_22478 ?auto_22471 ) ) ( not ( = ?auto_22478 ?auto_22482 ) ) ( not ( = ?auto_22454 ?auto_22463 ) ) ( not ( = ?auto_22454 ?auto_22466 ) ) ( not ( = ?auto_22455 ?auto_22463 ) ) ( not ( = ?auto_22455 ?auto_22466 ) ) ( not ( = ?auto_22456 ?auto_22463 ) ) ( not ( = ?auto_22456 ?auto_22466 ) ) ( not ( = ?auto_22457 ?auto_22463 ) ) ( not ( = ?auto_22457 ?auto_22466 ) ) ( not ( = ?auto_22458 ?auto_22463 ) ) ( not ( = ?auto_22458 ?auto_22466 ) ) ( not ( = ?auto_22459 ?auto_22463 ) ) ( not ( = ?auto_22459 ?auto_22466 ) ) ( not ( = ?auto_22460 ?auto_22463 ) ) ( not ( = ?auto_22460 ?auto_22466 ) ) ( not ( = ?auto_22461 ?auto_22463 ) ) ( not ( = ?auto_22461 ?auto_22466 ) ) ( not ( = ?auto_22463 ?auto_22478 ) ) ( not ( = ?auto_22463 ?auto_22481 ) ) ( not ( = ?auto_22463 ?auto_22476 ) ) ( not ( = ?auto_22463 ?auto_22480 ) ) ( not ( = ?auto_22463 ?auto_22472 ) ) ( not ( = ?auto_22463 ?auto_22484 ) ) ( not ( = ?auto_22463 ?auto_22471 ) ) ( not ( = ?auto_22463 ?auto_22482 ) ) ( not ( = ?auto_22464 ?auto_22487 ) ) ( not ( = ?auto_22464 ?auto_22486 ) ) ( not ( = ?auto_22464 ?auto_22473 ) ) ( not ( = ?auto_22464 ?auto_22474 ) ) ( not ( = ?auto_22464 ?auto_22477 ) ) ( not ( = ?auto_22465 ?auto_22470 ) ) ( not ( = ?auto_22465 ?auto_22485 ) ) ( not ( = ?auto_22465 ?auto_22479 ) ) ( not ( = ?auto_22465 ?auto_22475 ) ) ( not ( = ?auto_22465 ?auto_22483 ) ) ( not ( = ?auto_22466 ?auto_22478 ) ) ( not ( = ?auto_22466 ?auto_22481 ) ) ( not ( = ?auto_22466 ?auto_22476 ) ) ( not ( = ?auto_22466 ?auto_22480 ) ) ( not ( = ?auto_22466 ?auto_22472 ) ) ( not ( = ?auto_22466 ?auto_22484 ) ) ( not ( = ?auto_22466 ?auto_22471 ) ) ( not ( = ?auto_22466 ?auto_22482 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_22454 ?auto_22455 ?auto_22456 ?auto_22457 ?auto_22458 ?auto_22459 ?auto_22460 ?auto_22461 ?auto_22462 )
      ( MAKE-1CRATE ?auto_22462 ?auto_22463 )
      ( MAKE-9CRATE-VERIFY ?auto_22454 ?auto_22455 ?auto_22456 ?auto_22457 ?auto_22458 ?auto_22459 ?auto_22460 ?auto_22461 ?auto_22462 ?auto_22463 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_22509 - SURFACE
      ?auto_22510 - SURFACE
      ?auto_22511 - SURFACE
      ?auto_22512 - SURFACE
      ?auto_22513 - SURFACE
      ?auto_22514 - SURFACE
      ?auto_22515 - SURFACE
      ?auto_22516 - SURFACE
      ?auto_22517 - SURFACE
      ?auto_22518 - SURFACE
      ?auto_22519 - SURFACE
    )
    :vars
    (
      ?auto_22520 - HOIST
      ?auto_22525 - PLACE
      ?auto_22524 - PLACE
      ?auto_22522 - HOIST
      ?auto_22523 - SURFACE
      ?auto_22534 - PLACE
      ?auto_22537 - HOIST
      ?auto_22526 - SURFACE
      ?auto_22541 - PLACE
      ?auto_22530 - HOIST
      ?auto_22538 - SURFACE
      ?auto_22542 - PLACE
      ?auto_22539 - HOIST
      ?auto_22531 - SURFACE
      ?auto_22527 - PLACE
      ?auto_22540 - HOIST
      ?auto_22532 - SURFACE
      ?auto_22543 - PLACE
      ?auto_22533 - HOIST
      ?auto_22535 - SURFACE
      ?auto_22536 - SURFACE
      ?auto_22544 - SURFACE
      ?auto_22529 - SURFACE
      ?auto_22528 - SURFACE
      ?auto_22521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22520 ?auto_22525 ) ( IS-CRATE ?auto_22519 ) ( not ( = ?auto_22524 ?auto_22525 ) ) ( HOIST-AT ?auto_22522 ?auto_22524 ) ( SURFACE-AT ?auto_22519 ?auto_22524 ) ( ON ?auto_22519 ?auto_22523 ) ( CLEAR ?auto_22519 ) ( not ( = ?auto_22518 ?auto_22519 ) ) ( not ( = ?auto_22518 ?auto_22523 ) ) ( not ( = ?auto_22519 ?auto_22523 ) ) ( not ( = ?auto_22520 ?auto_22522 ) ) ( IS-CRATE ?auto_22518 ) ( not ( = ?auto_22534 ?auto_22525 ) ) ( HOIST-AT ?auto_22537 ?auto_22534 ) ( AVAILABLE ?auto_22537 ) ( SURFACE-AT ?auto_22518 ?auto_22534 ) ( ON ?auto_22518 ?auto_22526 ) ( CLEAR ?auto_22518 ) ( not ( = ?auto_22517 ?auto_22518 ) ) ( not ( = ?auto_22517 ?auto_22526 ) ) ( not ( = ?auto_22518 ?auto_22526 ) ) ( not ( = ?auto_22520 ?auto_22537 ) ) ( IS-CRATE ?auto_22517 ) ( not ( = ?auto_22541 ?auto_22525 ) ) ( HOIST-AT ?auto_22530 ?auto_22541 ) ( SURFACE-AT ?auto_22517 ?auto_22541 ) ( ON ?auto_22517 ?auto_22538 ) ( CLEAR ?auto_22517 ) ( not ( = ?auto_22516 ?auto_22517 ) ) ( not ( = ?auto_22516 ?auto_22538 ) ) ( not ( = ?auto_22517 ?auto_22538 ) ) ( not ( = ?auto_22520 ?auto_22530 ) ) ( IS-CRATE ?auto_22516 ) ( not ( = ?auto_22542 ?auto_22525 ) ) ( HOIST-AT ?auto_22539 ?auto_22542 ) ( AVAILABLE ?auto_22539 ) ( SURFACE-AT ?auto_22516 ?auto_22542 ) ( ON ?auto_22516 ?auto_22531 ) ( CLEAR ?auto_22516 ) ( not ( = ?auto_22515 ?auto_22516 ) ) ( not ( = ?auto_22515 ?auto_22531 ) ) ( not ( = ?auto_22516 ?auto_22531 ) ) ( not ( = ?auto_22520 ?auto_22539 ) ) ( IS-CRATE ?auto_22515 ) ( not ( = ?auto_22527 ?auto_22525 ) ) ( HOIST-AT ?auto_22540 ?auto_22527 ) ( AVAILABLE ?auto_22540 ) ( SURFACE-AT ?auto_22515 ?auto_22527 ) ( ON ?auto_22515 ?auto_22532 ) ( CLEAR ?auto_22515 ) ( not ( = ?auto_22514 ?auto_22515 ) ) ( not ( = ?auto_22514 ?auto_22532 ) ) ( not ( = ?auto_22515 ?auto_22532 ) ) ( not ( = ?auto_22520 ?auto_22540 ) ) ( IS-CRATE ?auto_22514 ) ( not ( = ?auto_22543 ?auto_22525 ) ) ( HOIST-AT ?auto_22533 ?auto_22543 ) ( SURFACE-AT ?auto_22514 ?auto_22543 ) ( ON ?auto_22514 ?auto_22535 ) ( CLEAR ?auto_22514 ) ( not ( = ?auto_22513 ?auto_22514 ) ) ( not ( = ?auto_22513 ?auto_22535 ) ) ( not ( = ?auto_22514 ?auto_22535 ) ) ( not ( = ?auto_22520 ?auto_22533 ) ) ( IS-CRATE ?auto_22513 ) ( AVAILABLE ?auto_22533 ) ( SURFACE-AT ?auto_22513 ?auto_22543 ) ( ON ?auto_22513 ?auto_22536 ) ( CLEAR ?auto_22513 ) ( not ( = ?auto_22512 ?auto_22513 ) ) ( not ( = ?auto_22512 ?auto_22536 ) ) ( not ( = ?auto_22513 ?auto_22536 ) ) ( IS-CRATE ?auto_22512 ) ( AVAILABLE ?auto_22522 ) ( SURFACE-AT ?auto_22512 ?auto_22524 ) ( ON ?auto_22512 ?auto_22544 ) ( CLEAR ?auto_22512 ) ( not ( = ?auto_22511 ?auto_22512 ) ) ( not ( = ?auto_22511 ?auto_22544 ) ) ( not ( = ?auto_22512 ?auto_22544 ) ) ( IS-CRATE ?auto_22511 ) ( SURFACE-AT ?auto_22511 ?auto_22541 ) ( ON ?auto_22511 ?auto_22529 ) ( CLEAR ?auto_22511 ) ( not ( = ?auto_22510 ?auto_22511 ) ) ( not ( = ?auto_22510 ?auto_22529 ) ) ( not ( = ?auto_22511 ?auto_22529 ) ) ( SURFACE-AT ?auto_22509 ?auto_22525 ) ( CLEAR ?auto_22509 ) ( IS-CRATE ?auto_22510 ) ( AVAILABLE ?auto_22520 ) ( AVAILABLE ?auto_22530 ) ( SURFACE-AT ?auto_22510 ?auto_22541 ) ( ON ?auto_22510 ?auto_22528 ) ( CLEAR ?auto_22510 ) ( TRUCK-AT ?auto_22521 ?auto_22525 ) ( not ( = ?auto_22509 ?auto_22510 ) ) ( not ( = ?auto_22509 ?auto_22528 ) ) ( not ( = ?auto_22510 ?auto_22528 ) ) ( not ( = ?auto_22509 ?auto_22511 ) ) ( not ( = ?auto_22509 ?auto_22529 ) ) ( not ( = ?auto_22511 ?auto_22528 ) ) ( not ( = ?auto_22529 ?auto_22528 ) ) ( not ( = ?auto_22509 ?auto_22512 ) ) ( not ( = ?auto_22509 ?auto_22544 ) ) ( not ( = ?auto_22510 ?auto_22512 ) ) ( not ( = ?auto_22510 ?auto_22544 ) ) ( not ( = ?auto_22512 ?auto_22529 ) ) ( not ( = ?auto_22512 ?auto_22528 ) ) ( not ( = ?auto_22524 ?auto_22541 ) ) ( not ( = ?auto_22522 ?auto_22530 ) ) ( not ( = ?auto_22544 ?auto_22529 ) ) ( not ( = ?auto_22544 ?auto_22528 ) ) ( not ( = ?auto_22509 ?auto_22513 ) ) ( not ( = ?auto_22509 ?auto_22536 ) ) ( not ( = ?auto_22510 ?auto_22513 ) ) ( not ( = ?auto_22510 ?auto_22536 ) ) ( not ( = ?auto_22511 ?auto_22513 ) ) ( not ( = ?auto_22511 ?auto_22536 ) ) ( not ( = ?auto_22513 ?auto_22544 ) ) ( not ( = ?auto_22513 ?auto_22529 ) ) ( not ( = ?auto_22513 ?auto_22528 ) ) ( not ( = ?auto_22543 ?auto_22524 ) ) ( not ( = ?auto_22543 ?auto_22541 ) ) ( not ( = ?auto_22533 ?auto_22522 ) ) ( not ( = ?auto_22533 ?auto_22530 ) ) ( not ( = ?auto_22536 ?auto_22544 ) ) ( not ( = ?auto_22536 ?auto_22529 ) ) ( not ( = ?auto_22536 ?auto_22528 ) ) ( not ( = ?auto_22509 ?auto_22514 ) ) ( not ( = ?auto_22509 ?auto_22535 ) ) ( not ( = ?auto_22510 ?auto_22514 ) ) ( not ( = ?auto_22510 ?auto_22535 ) ) ( not ( = ?auto_22511 ?auto_22514 ) ) ( not ( = ?auto_22511 ?auto_22535 ) ) ( not ( = ?auto_22512 ?auto_22514 ) ) ( not ( = ?auto_22512 ?auto_22535 ) ) ( not ( = ?auto_22514 ?auto_22536 ) ) ( not ( = ?auto_22514 ?auto_22544 ) ) ( not ( = ?auto_22514 ?auto_22529 ) ) ( not ( = ?auto_22514 ?auto_22528 ) ) ( not ( = ?auto_22535 ?auto_22536 ) ) ( not ( = ?auto_22535 ?auto_22544 ) ) ( not ( = ?auto_22535 ?auto_22529 ) ) ( not ( = ?auto_22535 ?auto_22528 ) ) ( not ( = ?auto_22509 ?auto_22515 ) ) ( not ( = ?auto_22509 ?auto_22532 ) ) ( not ( = ?auto_22510 ?auto_22515 ) ) ( not ( = ?auto_22510 ?auto_22532 ) ) ( not ( = ?auto_22511 ?auto_22515 ) ) ( not ( = ?auto_22511 ?auto_22532 ) ) ( not ( = ?auto_22512 ?auto_22515 ) ) ( not ( = ?auto_22512 ?auto_22532 ) ) ( not ( = ?auto_22513 ?auto_22515 ) ) ( not ( = ?auto_22513 ?auto_22532 ) ) ( not ( = ?auto_22515 ?auto_22535 ) ) ( not ( = ?auto_22515 ?auto_22536 ) ) ( not ( = ?auto_22515 ?auto_22544 ) ) ( not ( = ?auto_22515 ?auto_22529 ) ) ( not ( = ?auto_22515 ?auto_22528 ) ) ( not ( = ?auto_22527 ?auto_22543 ) ) ( not ( = ?auto_22527 ?auto_22524 ) ) ( not ( = ?auto_22527 ?auto_22541 ) ) ( not ( = ?auto_22540 ?auto_22533 ) ) ( not ( = ?auto_22540 ?auto_22522 ) ) ( not ( = ?auto_22540 ?auto_22530 ) ) ( not ( = ?auto_22532 ?auto_22535 ) ) ( not ( = ?auto_22532 ?auto_22536 ) ) ( not ( = ?auto_22532 ?auto_22544 ) ) ( not ( = ?auto_22532 ?auto_22529 ) ) ( not ( = ?auto_22532 ?auto_22528 ) ) ( not ( = ?auto_22509 ?auto_22516 ) ) ( not ( = ?auto_22509 ?auto_22531 ) ) ( not ( = ?auto_22510 ?auto_22516 ) ) ( not ( = ?auto_22510 ?auto_22531 ) ) ( not ( = ?auto_22511 ?auto_22516 ) ) ( not ( = ?auto_22511 ?auto_22531 ) ) ( not ( = ?auto_22512 ?auto_22516 ) ) ( not ( = ?auto_22512 ?auto_22531 ) ) ( not ( = ?auto_22513 ?auto_22516 ) ) ( not ( = ?auto_22513 ?auto_22531 ) ) ( not ( = ?auto_22514 ?auto_22516 ) ) ( not ( = ?auto_22514 ?auto_22531 ) ) ( not ( = ?auto_22516 ?auto_22532 ) ) ( not ( = ?auto_22516 ?auto_22535 ) ) ( not ( = ?auto_22516 ?auto_22536 ) ) ( not ( = ?auto_22516 ?auto_22544 ) ) ( not ( = ?auto_22516 ?auto_22529 ) ) ( not ( = ?auto_22516 ?auto_22528 ) ) ( not ( = ?auto_22542 ?auto_22527 ) ) ( not ( = ?auto_22542 ?auto_22543 ) ) ( not ( = ?auto_22542 ?auto_22524 ) ) ( not ( = ?auto_22542 ?auto_22541 ) ) ( not ( = ?auto_22539 ?auto_22540 ) ) ( not ( = ?auto_22539 ?auto_22533 ) ) ( not ( = ?auto_22539 ?auto_22522 ) ) ( not ( = ?auto_22539 ?auto_22530 ) ) ( not ( = ?auto_22531 ?auto_22532 ) ) ( not ( = ?auto_22531 ?auto_22535 ) ) ( not ( = ?auto_22531 ?auto_22536 ) ) ( not ( = ?auto_22531 ?auto_22544 ) ) ( not ( = ?auto_22531 ?auto_22529 ) ) ( not ( = ?auto_22531 ?auto_22528 ) ) ( not ( = ?auto_22509 ?auto_22517 ) ) ( not ( = ?auto_22509 ?auto_22538 ) ) ( not ( = ?auto_22510 ?auto_22517 ) ) ( not ( = ?auto_22510 ?auto_22538 ) ) ( not ( = ?auto_22511 ?auto_22517 ) ) ( not ( = ?auto_22511 ?auto_22538 ) ) ( not ( = ?auto_22512 ?auto_22517 ) ) ( not ( = ?auto_22512 ?auto_22538 ) ) ( not ( = ?auto_22513 ?auto_22517 ) ) ( not ( = ?auto_22513 ?auto_22538 ) ) ( not ( = ?auto_22514 ?auto_22517 ) ) ( not ( = ?auto_22514 ?auto_22538 ) ) ( not ( = ?auto_22515 ?auto_22517 ) ) ( not ( = ?auto_22515 ?auto_22538 ) ) ( not ( = ?auto_22517 ?auto_22531 ) ) ( not ( = ?auto_22517 ?auto_22532 ) ) ( not ( = ?auto_22517 ?auto_22535 ) ) ( not ( = ?auto_22517 ?auto_22536 ) ) ( not ( = ?auto_22517 ?auto_22544 ) ) ( not ( = ?auto_22517 ?auto_22529 ) ) ( not ( = ?auto_22517 ?auto_22528 ) ) ( not ( = ?auto_22538 ?auto_22531 ) ) ( not ( = ?auto_22538 ?auto_22532 ) ) ( not ( = ?auto_22538 ?auto_22535 ) ) ( not ( = ?auto_22538 ?auto_22536 ) ) ( not ( = ?auto_22538 ?auto_22544 ) ) ( not ( = ?auto_22538 ?auto_22529 ) ) ( not ( = ?auto_22538 ?auto_22528 ) ) ( not ( = ?auto_22509 ?auto_22518 ) ) ( not ( = ?auto_22509 ?auto_22526 ) ) ( not ( = ?auto_22510 ?auto_22518 ) ) ( not ( = ?auto_22510 ?auto_22526 ) ) ( not ( = ?auto_22511 ?auto_22518 ) ) ( not ( = ?auto_22511 ?auto_22526 ) ) ( not ( = ?auto_22512 ?auto_22518 ) ) ( not ( = ?auto_22512 ?auto_22526 ) ) ( not ( = ?auto_22513 ?auto_22518 ) ) ( not ( = ?auto_22513 ?auto_22526 ) ) ( not ( = ?auto_22514 ?auto_22518 ) ) ( not ( = ?auto_22514 ?auto_22526 ) ) ( not ( = ?auto_22515 ?auto_22518 ) ) ( not ( = ?auto_22515 ?auto_22526 ) ) ( not ( = ?auto_22516 ?auto_22518 ) ) ( not ( = ?auto_22516 ?auto_22526 ) ) ( not ( = ?auto_22518 ?auto_22538 ) ) ( not ( = ?auto_22518 ?auto_22531 ) ) ( not ( = ?auto_22518 ?auto_22532 ) ) ( not ( = ?auto_22518 ?auto_22535 ) ) ( not ( = ?auto_22518 ?auto_22536 ) ) ( not ( = ?auto_22518 ?auto_22544 ) ) ( not ( = ?auto_22518 ?auto_22529 ) ) ( not ( = ?auto_22518 ?auto_22528 ) ) ( not ( = ?auto_22534 ?auto_22541 ) ) ( not ( = ?auto_22534 ?auto_22542 ) ) ( not ( = ?auto_22534 ?auto_22527 ) ) ( not ( = ?auto_22534 ?auto_22543 ) ) ( not ( = ?auto_22534 ?auto_22524 ) ) ( not ( = ?auto_22537 ?auto_22530 ) ) ( not ( = ?auto_22537 ?auto_22539 ) ) ( not ( = ?auto_22537 ?auto_22540 ) ) ( not ( = ?auto_22537 ?auto_22533 ) ) ( not ( = ?auto_22537 ?auto_22522 ) ) ( not ( = ?auto_22526 ?auto_22538 ) ) ( not ( = ?auto_22526 ?auto_22531 ) ) ( not ( = ?auto_22526 ?auto_22532 ) ) ( not ( = ?auto_22526 ?auto_22535 ) ) ( not ( = ?auto_22526 ?auto_22536 ) ) ( not ( = ?auto_22526 ?auto_22544 ) ) ( not ( = ?auto_22526 ?auto_22529 ) ) ( not ( = ?auto_22526 ?auto_22528 ) ) ( not ( = ?auto_22509 ?auto_22519 ) ) ( not ( = ?auto_22509 ?auto_22523 ) ) ( not ( = ?auto_22510 ?auto_22519 ) ) ( not ( = ?auto_22510 ?auto_22523 ) ) ( not ( = ?auto_22511 ?auto_22519 ) ) ( not ( = ?auto_22511 ?auto_22523 ) ) ( not ( = ?auto_22512 ?auto_22519 ) ) ( not ( = ?auto_22512 ?auto_22523 ) ) ( not ( = ?auto_22513 ?auto_22519 ) ) ( not ( = ?auto_22513 ?auto_22523 ) ) ( not ( = ?auto_22514 ?auto_22519 ) ) ( not ( = ?auto_22514 ?auto_22523 ) ) ( not ( = ?auto_22515 ?auto_22519 ) ) ( not ( = ?auto_22515 ?auto_22523 ) ) ( not ( = ?auto_22516 ?auto_22519 ) ) ( not ( = ?auto_22516 ?auto_22523 ) ) ( not ( = ?auto_22517 ?auto_22519 ) ) ( not ( = ?auto_22517 ?auto_22523 ) ) ( not ( = ?auto_22519 ?auto_22526 ) ) ( not ( = ?auto_22519 ?auto_22538 ) ) ( not ( = ?auto_22519 ?auto_22531 ) ) ( not ( = ?auto_22519 ?auto_22532 ) ) ( not ( = ?auto_22519 ?auto_22535 ) ) ( not ( = ?auto_22519 ?auto_22536 ) ) ( not ( = ?auto_22519 ?auto_22544 ) ) ( not ( = ?auto_22519 ?auto_22529 ) ) ( not ( = ?auto_22519 ?auto_22528 ) ) ( not ( = ?auto_22523 ?auto_22526 ) ) ( not ( = ?auto_22523 ?auto_22538 ) ) ( not ( = ?auto_22523 ?auto_22531 ) ) ( not ( = ?auto_22523 ?auto_22532 ) ) ( not ( = ?auto_22523 ?auto_22535 ) ) ( not ( = ?auto_22523 ?auto_22536 ) ) ( not ( = ?auto_22523 ?auto_22544 ) ) ( not ( = ?auto_22523 ?auto_22529 ) ) ( not ( = ?auto_22523 ?auto_22528 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_22509 ?auto_22510 ?auto_22511 ?auto_22512 ?auto_22513 ?auto_22514 ?auto_22515 ?auto_22516 ?auto_22517 ?auto_22518 )
      ( MAKE-1CRATE ?auto_22518 ?auto_22519 )
      ( MAKE-10CRATE-VERIFY ?auto_22509 ?auto_22510 ?auto_22511 ?auto_22512 ?auto_22513 ?auto_22514 ?auto_22515 ?auto_22516 ?auto_22517 ?auto_22518 ?auto_22519 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_22567 - SURFACE
      ?auto_22568 - SURFACE
      ?auto_22569 - SURFACE
      ?auto_22570 - SURFACE
      ?auto_22571 - SURFACE
      ?auto_22572 - SURFACE
      ?auto_22573 - SURFACE
      ?auto_22574 - SURFACE
      ?auto_22575 - SURFACE
      ?auto_22576 - SURFACE
      ?auto_22577 - SURFACE
      ?auto_22578 - SURFACE
    )
    :vars
    (
      ?auto_22584 - HOIST
      ?auto_22583 - PLACE
      ?auto_22580 - PLACE
      ?auto_22579 - HOIST
      ?auto_22582 - SURFACE
      ?auto_22590 - PLACE
      ?auto_22599 - HOIST
      ?auto_22603 - SURFACE
      ?auto_22595 - PLACE
      ?auto_22604 - HOIST
      ?auto_22598 - SURFACE
      ?auto_22589 - PLACE
      ?auto_22606 - HOIST
      ?auto_22587 - SURFACE
      ?auto_22602 - PLACE
      ?auto_22592 - HOIST
      ?auto_22585 - SURFACE
      ?auto_22593 - PLACE
      ?auto_22605 - HOIST
      ?auto_22591 - SURFACE
      ?auto_22597 - PLACE
      ?auto_22600 - HOIST
      ?auto_22594 - SURFACE
      ?auto_22586 - SURFACE
      ?auto_22588 - SURFACE
      ?auto_22601 - SURFACE
      ?auto_22596 - SURFACE
      ?auto_22581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22584 ?auto_22583 ) ( IS-CRATE ?auto_22578 ) ( not ( = ?auto_22580 ?auto_22583 ) ) ( HOIST-AT ?auto_22579 ?auto_22580 ) ( AVAILABLE ?auto_22579 ) ( SURFACE-AT ?auto_22578 ?auto_22580 ) ( ON ?auto_22578 ?auto_22582 ) ( CLEAR ?auto_22578 ) ( not ( = ?auto_22577 ?auto_22578 ) ) ( not ( = ?auto_22577 ?auto_22582 ) ) ( not ( = ?auto_22578 ?auto_22582 ) ) ( not ( = ?auto_22584 ?auto_22579 ) ) ( IS-CRATE ?auto_22577 ) ( not ( = ?auto_22590 ?auto_22583 ) ) ( HOIST-AT ?auto_22599 ?auto_22590 ) ( SURFACE-AT ?auto_22577 ?auto_22590 ) ( ON ?auto_22577 ?auto_22603 ) ( CLEAR ?auto_22577 ) ( not ( = ?auto_22576 ?auto_22577 ) ) ( not ( = ?auto_22576 ?auto_22603 ) ) ( not ( = ?auto_22577 ?auto_22603 ) ) ( not ( = ?auto_22584 ?auto_22599 ) ) ( IS-CRATE ?auto_22576 ) ( not ( = ?auto_22595 ?auto_22583 ) ) ( HOIST-AT ?auto_22604 ?auto_22595 ) ( AVAILABLE ?auto_22604 ) ( SURFACE-AT ?auto_22576 ?auto_22595 ) ( ON ?auto_22576 ?auto_22598 ) ( CLEAR ?auto_22576 ) ( not ( = ?auto_22575 ?auto_22576 ) ) ( not ( = ?auto_22575 ?auto_22598 ) ) ( not ( = ?auto_22576 ?auto_22598 ) ) ( not ( = ?auto_22584 ?auto_22604 ) ) ( IS-CRATE ?auto_22575 ) ( not ( = ?auto_22589 ?auto_22583 ) ) ( HOIST-AT ?auto_22606 ?auto_22589 ) ( SURFACE-AT ?auto_22575 ?auto_22589 ) ( ON ?auto_22575 ?auto_22587 ) ( CLEAR ?auto_22575 ) ( not ( = ?auto_22574 ?auto_22575 ) ) ( not ( = ?auto_22574 ?auto_22587 ) ) ( not ( = ?auto_22575 ?auto_22587 ) ) ( not ( = ?auto_22584 ?auto_22606 ) ) ( IS-CRATE ?auto_22574 ) ( not ( = ?auto_22602 ?auto_22583 ) ) ( HOIST-AT ?auto_22592 ?auto_22602 ) ( AVAILABLE ?auto_22592 ) ( SURFACE-AT ?auto_22574 ?auto_22602 ) ( ON ?auto_22574 ?auto_22585 ) ( CLEAR ?auto_22574 ) ( not ( = ?auto_22573 ?auto_22574 ) ) ( not ( = ?auto_22573 ?auto_22585 ) ) ( not ( = ?auto_22574 ?auto_22585 ) ) ( not ( = ?auto_22584 ?auto_22592 ) ) ( IS-CRATE ?auto_22573 ) ( not ( = ?auto_22593 ?auto_22583 ) ) ( HOIST-AT ?auto_22605 ?auto_22593 ) ( AVAILABLE ?auto_22605 ) ( SURFACE-AT ?auto_22573 ?auto_22593 ) ( ON ?auto_22573 ?auto_22591 ) ( CLEAR ?auto_22573 ) ( not ( = ?auto_22572 ?auto_22573 ) ) ( not ( = ?auto_22572 ?auto_22591 ) ) ( not ( = ?auto_22573 ?auto_22591 ) ) ( not ( = ?auto_22584 ?auto_22605 ) ) ( IS-CRATE ?auto_22572 ) ( not ( = ?auto_22597 ?auto_22583 ) ) ( HOIST-AT ?auto_22600 ?auto_22597 ) ( SURFACE-AT ?auto_22572 ?auto_22597 ) ( ON ?auto_22572 ?auto_22594 ) ( CLEAR ?auto_22572 ) ( not ( = ?auto_22571 ?auto_22572 ) ) ( not ( = ?auto_22571 ?auto_22594 ) ) ( not ( = ?auto_22572 ?auto_22594 ) ) ( not ( = ?auto_22584 ?auto_22600 ) ) ( IS-CRATE ?auto_22571 ) ( AVAILABLE ?auto_22600 ) ( SURFACE-AT ?auto_22571 ?auto_22597 ) ( ON ?auto_22571 ?auto_22586 ) ( CLEAR ?auto_22571 ) ( not ( = ?auto_22570 ?auto_22571 ) ) ( not ( = ?auto_22570 ?auto_22586 ) ) ( not ( = ?auto_22571 ?auto_22586 ) ) ( IS-CRATE ?auto_22570 ) ( AVAILABLE ?auto_22599 ) ( SURFACE-AT ?auto_22570 ?auto_22590 ) ( ON ?auto_22570 ?auto_22588 ) ( CLEAR ?auto_22570 ) ( not ( = ?auto_22569 ?auto_22570 ) ) ( not ( = ?auto_22569 ?auto_22588 ) ) ( not ( = ?auto_22570 ?auto_22588 ) ) ( IS-CRATE ?auto_22569 ) ( SURFACE-AT ?auto_22569 ?auto_22589 ) ( ON ?auto_22569 ?auto_22601 ) ( CLEAR ?auto_22569 ) ( not ( = ?auto_22568 ?auto_22569 ) ) ( not ( = ?auto_22568 ?auto_22601 ) ) ( not ( = ?auto_22569 ?auto_22601 ) ) ( SURFACE-AT ?auto_22567 ?auto_22583 ) ( CLEAR ?auto_22567 ) ( IS-CRATE ?auto_22568 ) ( AVAILABLE ?auto_22584 ) ( AVAILABLE ?auto_22606 ) ( SURFACE-AT ?auto_22568 ?auto_22589 ) ( ON ?auto_22568 ?auto_22596 ) ( CLEAR ?auto_22568 ) ( TRUCK-AT ?auto_22581 ?auto_22583 ) ( not ( = ?auto_22567 ?auto_22568 ) ) ( not ( = ?auto_22567 ?auto_22596 ) ) ( not ( = ?auto_22568 ?auto_22596 ) ) ( not ( = ?auto_22567 ?auto_22569 ) ) ( not ( = ?auto_22567 ?auto_22601 ) ) ( not ( = ?auto_22569 ?auto_22596 ) ) ( not ( = ?auto_22601 ?auto_22596 ) ) ( not ( = ?auto_22567 ?auto_22570 ) ) ( not ( = ?auto_22567 ?auto_22588 ) ) ( not ( = ?auto_22568 ?auto_22570 ) ) ( not ( = ?auto_22568 ?auto_22588 ) ) ( not ( = ?auto_22570 ?auto_22601 ) ) ( not ( = ?auto_22570 ?auto_22596 ) ) ( not ( = ?auto_22590 ?auto_22589 ) ) ( not ( = ?auto_22599 ?auto_22606 ) ) ( not ( = ?auto_22588 ?auto_22601 ) ) ( not ( = ?auto_22588 ?auto_22596 ) ) ( not ( = ?auto_22567 ?auto_22571 ) ) ( not ( = ?auto_22567 ?auto_22586 ) ) ( not ( = ?auto_22568 ?auto_22571 ) ) ( not ( = ?auto_22568 ?auto_22586 ) ) ( not ( = ?auto_22569 ?auto_22571 ) ) ( not ( = ?auto_22569 ?auto_22586 ) ) ( not ( = ?auto_22571 ?auto_22588 ) ) ( not ( = ?auto_22571 ?auto_22601 ) ) ( not ( = ?auto_22571 ?auto_22596 ) ) ( not ( = ?auto_22597 ?auto_22590 ) ) ( not ( = ?auto_22597 ?auto_22589 ) ) ( not ( = ?auto_22600 ?auto_22599 ) ) ( not ( = ?auto_22600 ?auto_22606 ) ) ( not ( = ?auto_22586 ?auto_22588 ) ) ( not ( = ?auto_22586 ?auto_22601 ) ) ( not ( = ?auto_22586 ?auto_22596 ) ) ( not ( = ?auto_22567 ?auto_22572 ) ) ( not ( = ?auto_22567 ?auto_22594 ) ) ( not ( = ?auto_22568 ?auto_22572 ) ) ( not ( = ?auto_22568 ?auto_22594 ) ) ( not ( = ?auto_22569 ?auto_22572 ) ) ( not ( = ?auto_22569 ?auto_22594 ) ) ( not ( = ?auto_22570 ?auto_22572 ) ) ( not ( = ?auto_22570 ?auto_22594 ) ) ( not ( = ?auto_22572 ?auto_22586 ) ) ( not ( = ?auto_22572 ?auto_22588 ) ) ( not ( = ?auto_22572 ?auto_22601 ) ) ( not ( = ?auto_22572 ?auto_22596 ) ) ( not ( = ?auto_22594 ?auto_22586 ) ) ( not ( = ?auto_22594 ?auto_22588 ) ) ( not ( = ?auto_22594 ?auto_22601 ) ) ( not ( = ?auto_22594 ?auto_22596 ) ) ( not ( = ?auto_22567 ?auto_22573 ) ) ( not ( = ?auto_22567 ?auto_22591 ) ) ( not ( = ?auto_22568 ?auto_22573 ) ) ( not ( = ?auto_22568 ?auto_22591 ) ) ( not ( = ?auto_22569 ?auto_22573 ) ) ( not ( = ?auto_22569 ?auto_22591 ) ) ( not ( = ?auto_22570 ?auto_22573 ) ) ( not ( = ?auto_22570 ?auto_22591 ) ) ( not ( = ?auto_22571 ?auto_22573 ) ) ( not ( = ?auto_22571 ?auto_22591 ) ) ( not ( = ?auto_22573 ?auto_22594 ) ) ( not ( = ?auto_22573 ?auto_22586 ) ) ( not ( = ?auto_22573 ?auto_22588 ) ) ( not ( = ?auto_22573 ?auto_22601 ) ) ( not ( = ?auto_22573 ?auto_22596 ) ) ( not ( = ?auto_22593 ?auto_22597 ) ) ( not ( = ?auto_22593 ?auto_22590 ) ) ( not ( = ?auto_22593 ?auto_22589 ) ) ( not ( = ?auto_22605 ?auto_22600 ) ) ( not ( = ?auto_22605 ?auto_22599 ) ) ( not ( = ?auto_22605 ?auto_22606 ) ) ( not ( = ?auto_22591 ?auto_22594 ) ) ( not ( = ?auto_22591 ?auto_22586 ) ) ( not ( = ?auto_22591 ?auto_22588 ) ) ( not ( = ?auto_22591 ?auto_22601 ) ) ( not ( = ?auto_22591 ?auto_22596 ) ) ( not ( = ?auto_22567 ?auto_22574 ) ) ( not ( = ?auto_22567 ?auto_22585 ) ) ( not ( = ?auto_22568 ?auto_22574 ) ) ( not ( = ?auto_22568 ?auto_22585 ) ) ( not ( = ?auto_22569 ?auto_22574 ) ) ( not ( = ?auto_22569 ?auto_22585 ) ) ( not ( = ?auto_22570 ?auto_22574 ) ) ( not ( = ?auto_22570 ?auto_22585 ) ) ( not ( = ?auto_22571 ?auto_22574 ) ) ( not ( = ?auto_22571 ?auto_22585 ) ) ( not ( = ?auto_22572 ?auto_22574 ) ) ( not ( = ?auto_22572 ?auto_22585 ) ) ( not ( = ?auto_22574 ?auto_22591 ) ) ( not ( = ?auto_22574 ?auto_22594 ) ) ( not ( = ?auto_22574 ?auto_22586 ) ) ( not ( = ?auto_22574 ?auto_22588 ) ) ( not ( = ?auto_22574 ?auto_22601 ) ) ( not ( = ?auto_22574 ?auto_22596 ) ) ( not ( = ?auto_22602 ?auto_22593 ) ) ( not ( = ?auto_22602 ?auto_22597 ) ) ( not ( = ?auto_22602 ?auto_22590 ) ) ( not ( = ?auto_22602 ?auto_22589 ) ) ( not ( = ?auto_22592 ?auto_22605 ) ) ( not ( = ?auto_22592 ?auto_22600 ) ) ( not ( = ?auto_22592 ?auto_22599 ) ) ( not ( = ?auto_22592 ?auto_22606 ) ) ( not ( = ?auto_22585 ?auto_22591 ) ) ( not ( = ?auto_22585 ?auto_22594 ) ) ( not ( = ?auto_22585 ?auto_22586 ) ) ( not ( = ?auto_22585 ?auto_22588 ) ) ( not ( = ?auto_22585 ?auto_22601 ) ) ( not ( = ?auto_22585 ?auto_22596 ) ) ( not ( = ?auto_22567 ?auto_22575 ) ) ( not ( = ?auto_22567 ?auto_22587 ) ) ( not ( = ?auto_22568 ?auto_22575 ) ) ( not ( = ?auto_22568 ?auto_22587 ) ) ( not ( = ?auto_22569 ?auto_22575 ) ) ( not ( = ?auto_22569 ?auto_22587 ) ) ( not ( = ?auto_22570 ?auto_22575 ) ) ( not ( = ?auto_22570 ?auto_22587 ) ) ( not ( = ?auto_22571 ?auto_22575 ) ) ( not ( = ?auto_22571 ?auto_22587 ) ) ( not ( = ?auto_22572 ?auto_22575 ) ) ( not ( = ?auto_22572 ?auto_22587 ) ) ( not ( = ?auto_22573 ?auto_22575 ) ) ( not ( = ?auto_22573 ?auto_22587 ) ) ( not ( = ?auto_22575 ?auto_22585 ) ) ( not ( = ?auto_22575 ?auto_22591 ) ) ( not ( = ?auto_22575 ?auto_22594 ) ) ( not ( = ?auto_22575 ?auto_22586 ) ) ( not ( = ?auto_22575 ?auto_22588 ) ) ( not ( = ?auto_22575 ?auto_22601 ) ) ( not ( = ?auto_22575 ?auto_22596 ) ) ( not ( = ?auto_22587 ?auto_22585 ) ) ( not ( = ?auto_22587 ?auto_22591 ) ) ( not ( = ?auto_22587 ?auto_22594 ) ) ( not ( = ?auto_22587 ?auto_22586 ) ) ( not ( = ?auto_22587 ?auto_22588 ) ) ( not ( = ?auto_22587 ?auto_22601 ) ) ( not ( = ?auto_22587 ?auto_22596 ) ) ( not ( = ?auto_22567 ?auto_22576 ) ) ( not ( = ?auto_22567 ?auto_22598 ) ) ( not ( = ?auto_22568 ?auto_22576 ) ) ( not ( = ?auto_22568 ?auto_22598 ) ) ( not ( = ?auto_22569 ?auto_22576 ) ) ( not ( = ?auto_22569 ?auto_22598 ) ) ( not ( = ?auto_22570 ?auto_22576 ) ) ( not ( = ?auto_22570 ?auto_22598 ) ) ( not ( = ?auto_22571 ?auto_22576 ) ) ( not ( = ?auto_22571 ?auto_22598 ) ) ( not ( = ?auto_22572 ?auto_22576 ) ) ( not ( = ?auto_22572 ?auto_22598 ) ) ( not ( = ?auto_22573 ?auto_22576 ) ) ( not ( = ?auto_22573 ?auto_22598 ) ) ( not ( = ?auto_22574 ?auto_22576 ) ) ( not ( = ?auto_22574 ?auto_22598 ) ) ( not ( = ?auto_22576 ?auto_22587 ) ) ( not ( = ?auto_22576 ?auto_22585 ) ) ( not ( = ?auto_22576 ?auto_22591 ) ) ( not ( = ?auto_22576 ?auto_22594 ) ) ( not ( = ?auto_22576 ?auto_22586 ) ) ( not ( = ?auto_22576 ?auto_22588 ) ) ( not ( = ?auto_22576 ?auto_22601 ) ) ( not ( = ?auto_22576 ?auto_22596 ) ) ( not ( = ?auto_22595 ?auto_22589 ) ) ( not ( = ?auto_22595 ?auto_22602 ) ) ( not ( = ?auto_22595 ?auto_22593 ) ) ( not ( = ?auto_22595 ?auto_22597 ) ) ( not ( = ?auto_22595 ?auto_22590 ) ) ( not ( = ?auto_22604 ?auto_22606 ) ) ( not ( = ?auto_22604 ?auto_22592 ) ) ( not ( = ?auto_22604 ?auto_22605 ) ) ( not ( = ?auto_22604 ?auto_22600 ) ) ( not ( = ?auto_22604 ?auto_22599 ) ) ( not ( = ?auto_22598 ?auto_22587 ) ) ( not ( = ?auto_22598 ?auto_22585 ) ) ( not ( = ?auto_22598 ?auto_22591 ) ) ( not ( = ?auto_22598 ?auto_22594 ) ) ( not ( = ?auto_22598 ?auto_22586 ) ) ( not ( = ?auto_22598 ?auto_22588 ) ) ( not ( = ?auto_22598 ?auto_22601 ) ) ( not ( = ?auto_22598 ?auto_22596 ) ) ( not ( = ?auto_22567 ?auto_22577 ) ) ( not ( = ?auto_22567 ?auto_22603 ) ) ( not ( = ?auto_22568 ?auto_22577 ) ) ( not ( = ?auto_22568 ?auto_22603 ) ) ( not ( = ?auto_22569 ?auto_22577 ) ) ( not ( = ?auto_22569 ?auto_22603 ) ) ( not ( = ?auto_22570 ?auto_22577 ) ) ( not ( = ?auto_22570 ?auto_22603 ) ) ( not ( = ?auto_22571 ?auto_22577 ) ) ( not ( = ?auto_22571 ?auto_22603 ) ) ( not ( = ?auto_22572 ?auto_22577 ) ) ( not ( = ?auto_22572 ?auto_22603 ) ) ( not ( = ?auto_22573 ?auto_22577 ) ) ( not ( = ?auto_22573 ?auto_22603 ) ) ( not ( = ?auto_22574 ?auto_22577 ) ) ( not ( = ?auto_22574 ?auto_22603 ) ) ( not ( = ?auto_22575 ?auto_22577 ) ) ( not ( = ?auto_22575 ?auto_22603 ) ) ( not ( = ?auto_22577 ?auto_22598 ) ) ( not ( = ?auto_22577 ?auto_22587 ) ) ( not ( = ?auto_22577 ?auto_22585 ) ) ( not ( = ?auto_22577 ?auto_22591 ) ) ( not ( = ?auto_22577 ?auto_22594 ) ) ( not ( = ?auto_22577 ?auto_22586 ) ) ( not ( = ?auto_22577 ?auto_22588 ) ) ( not ( = ?auto_22577 ?auto_22601 ) ) ( not ( = ?auto_22577 ?auto_22596 ) ) ( not ( = ?auto_22603 ?auto_22598 ) ) ( not ( = ?auto_22603 ?auto_22587 ) ) ( not ( = ?auto_22603 ?auto_22585 ) ) ( not ( = ?auto_22603 ?auto_22591 ) ) ( not ( = ?auto_22603 ?auto_22594 ) ) ( not ( = ?auto_22603 ?auto_22586 ) ) ( not ( = ?auto_22603 ?auto_22588 ) ) ( not ( = ?auto_22603 ?auto_22601 ) ) ( not ( = ?auto_22603 ?auto_22596 ) ) ( not ( = ?auto_22567 ?auto_22578 ) ) ( not ( = ?auto_22567 ?auto_22582 ) ) ( not ( = ?auto_22568 ?auto_22578 ) ) ( not ( = ?auto_22568 ?auto_22582 ) ) ( not ( = ?auto_22569 ?auto_22578 ) ) ( not ( = ?auto_22569 ?auto_22582 ) ) ( not ( = ?auto_22570 ?auto_22578 ) ) ( not ( = ?auto_22570 ?auto_22582 ) ) ( not ( = ?auto_22571 ?auto_22578 ) ) ( not ( = ?auto_22571 ?auto_22582 ) ) ( not ( = ?auto_22572 ?auto_22578 ) ) ( not ( = ?auto_22572 ?auto_22582 ) ) ( not ( = ?auto_22573 ?auto_22578 ) ) ( not ( = ?auto_22573 ?auto_22582 ) ) ( not ( = ?auto_22574 ?auto_22578 ) ) ( not ( = ?auto_22574 ?auto_22582 ) ) ( not ( = ?auto_22575 ?auto_22578 ) ) ( not ( = ?auto_22575 ?auto_22582 ) ) ( not ( = ?auto_22576 ?auto_22578 ) ) ( not ( = ?auto_22576 ?auto_22582 ) ) ( not ( = ?auto_22578 ?auto_22603 ) ) ( not ( = ?auto_22578 ?auto_22598 ) ) ( not ( = ?auto_22578 ?auto_22587 ) ) ( not ( = ?auto_22578 ?auto_22585 ) ) ( not ( = ?auto_22578 ?auto_22591 ) ) ( not ( = ?auto_22578 ?auto_22594 ) ) ( not ( = ?auto_22578 ?auto_22586 ) ) ( not ( = ?auto_22578 ?auto_22588 ) ) ( not ( = ?auto_22578 ?auto_22601 ) ) ( not ( = ?auto_22578 ?auto_22596 ) ) ( not ( = ?auto_22580 ?auto_22590 ) ) ( not ( = ?auto_22580 ?auto_22595 ) ) ( not ( = ?auto_22580 ?auto_22589 ) ) ( not ( = ?auto_22580 ?auto_22602 ) ) ( not ( = ?auto_22580 ?auto_22593 ) ) ( not ( = ?auto_22580 ?auto_22597 ) ) ( not ( = ?auto_22579 ?auto_22599 ) ) ( not ( = ?auto_22579 ?auto_22604 ) ) ( not ( = ?auto_22579 ?auto_22606 ) ) ( not ( = ?auto_22579 ?auto_22592 ) ) ( not ( = ?auto_22579 ?auto_22605 ) ) ( not ( = ?auto_22579 ?auto_22600 ) ) ( not ( = ?auto_22582 ?auto_22603 ) ) ( not ( = ?auto_22582 ?auto_22598 ) ) ( not ( = ?auto_22582 ?auto_22587 ) ) ( not ( = ?auto_22582 ?auto_22585 ) ) ( not ( = ?auto_22582 ?auto_22591 ) ) ( not ( = ?auto_22582 ?auto_22594 ) ) ( not ( = ?auto_22582 ?auto_22586 ) ) ( not ( = ?auto_22582 ?auto_22588 ) ) ( not ( = ?auto_22582 ?auto_22601 ) ) ( not ( = ?auto_22582 ?auto_22596 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_22567 ?auto_22568 ?auto_22569 ?auto_22570 ?auto_22571 ?auto_22572 ?auto_22573 ?auto_22574 ?auto_22575 ?auto_22576 ?auto_22577 )
      ( MAKE-1CRATE ?auto_22577 ?auto_22578 )
      ( MAKE-11CRATE-VERIFY ?auto_22567 ?auto_22568 ?auto_22569 ?auto_22570 ?auto_22571 ?auto_22572 ?auto_22573 ?auto_22574 ?auto_22575 ?auto_22576 ?auto_22577 ?auto_22578 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_22630 - SURFACE
      ?auto_22631 - SURFACE
      ?auto_22632 - SURFACE
      ?auto_22633 - SURFACE
      ?auto_22634 - SURFACE
      ?auto_22635 - SURFACE
      ?auto_22636 - SURFACE
      ?auto_22637 - SURFACE
      ?auto_22638 - SURFACE
      ?auto_22639 - SURFACE
      ?auto_22640 - SURFACE
      ?auto_22641 - SURFACE
      ?auto_22642 - SURFACE
    )
    :vars
    (
      ?auto_22647 - HOIST
      ?auto_22644 - PLACE
      ?auto_22646 - PLACE
      ?auto_22648 - HOIST
      ?auto_22643 - SURFACE
      ?auto_22665 - PLACE
      ?auto_22666 - HOIST
      ?auto_22657 - SURFACE
      ?auto_22652 - PLACE
      ?auto_22671 - HOIST
      ?auto_22669 - SURFACE
      ?auto_22663 - PLACE
      ?auto_22654 - HOIST
      ?auto_22668 - SURFACE
      ?auto_22655 - SURFACE
      ?auto_22659 - PLACE
      ?auto_22656 - HOIST
      ?auto_22664 - SURFACE
      ?auto_22653 - PLACE
      ?auto_22667 - HOIST
      ?auto_22661 - SURFACE
      ?auto_22660 - PLACE
      ?auto_22658 - HOIST
      ?auto_22662 - SURFACE
      ?auto_22650 - SURFACE
      ?auto_22649 - SURFACE
      ?auto_22670 - SURFACE
      ?auto_22651 - SURFACE
      ?auto_22645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22647 ?auto_22644 ) ( IS-CRATE ?auto_22642 ) ( not ( = ?auto_22646 ?auto_22644 ) ) ( HOIST-AT ?auto_22648 ?auto_22646 ) ( SURFACE-AT ?auto_22642 ?auto_22646 ) ( ON ?auto_22642 ?auto_22643 ) ( CLEAR ?auto_22642 ) ( not ( = ?auto_22641 ?auto_22642 ) ) ( not ( = ?auto_22641 ?auto_22643 ) ) ( not ( = ?auto_22642 ?auto_22643 ) ) ( not ( = ?auto_22647 ?auto_22648 ) ) ( IS-CRATE ?auto_22641 ) ( not ( = ?auto_22665 ?auto_22644 ) ) ( HOIST-AT ?auto_22666 ?auto_22665 ) ( AVAILABLE ?auto_22666 ) ( SURFACE-AT ?auto_22641 ?auto_22665 ) ( ON ?auto_22641 ?auto_22657 ) ( CLEAR ?auto_22641 ) ( not ( = ?auto_22640 ?auto_22641 ) ) ( not ( = ?auto_22640 ?auto_22657 ) ) ( not ( = ?auto_22641 ?auto_22657 ) ) ( not ( = ?auto_22647 ?auto_22666 ) ) ( IS-CRATE ?auto_22640 ) ( not ( = ?auto_22652 ?auto_22644 ) ) ( HOIST-AT ?auto_22671 ?auto_22652 ) ( SURFACE-AT ?auto_22640 ?auto_22652 ) ( ON ?auto_22640 ?auto_22669 ) ( CLEAR ?auto_22640 ) ( not ( = ?auto_22639 ?auto_22640 ) ) ( not ( = ?auto_22639 ?auto_22669 ) ) ( not ( = ?auto_22640 ?auto_22669 ) ) ( not ( = ?auto_22647 ?auto_22671 ) ) ( IS-CRATE ?auto_22639 ) ( not ( = ?auto_22663 ?auto_22644 ) ) ( HOIST-AT ?auto_22654 ?auto_22663 ) ( AVAILABLE ?auto_22654 ) ( SURFACE-AT ?auto_22639 ?auto_22663 ) ( ON ?auto_22639 ?auto_22668 ) ( CLEAR ?auto_22639 ) ( not ( = ?auto_22638 ?auto_22639 ) ) ( not ( = ?auto_22638 ?auto_22668 ) ) ( not ( = ?auto_22639 ?auto_22668 ) ) ( not ( = ?auto_22647 ?auto_22654 ) ) ( IS-CRATE ?auto_22638 ) ( SURFACE-AT ?auto_22638 ?auto_22646 ) ( ON ?auto_22638 ?auto_22655 ) ( CLEAR ?auto_22638 ) ( not ( = ?auto_22637 ?auto_22638 ) ) ( not ( = ?auto_22637 ?auto_22655 ) ) ( not ( = ?auto_22638 ?auto_22655 ) ) ( IS-CRATE ?auto_22637 ) ( not ( = ?auto_22659 ?auto_22644 ) ) ( HOIST-AT ?auto_22656 ?auto_22659 ) ( AVAILABLE ?auto_22656 ) ( SURFACE-AT ?auto_22637 ?auto_22659 ) ( ON ?auto_22637 ?auto_22664 ) ( CLEAR ?auto_22637 ) ( not ( = ?auto_22636 ?auto_22637 ) ) ( not ( = ?auto_22636 ?auto_22664 ) ) ( not ( = ?auto_22637 ?auto_22664 ) ) ( not ( = ?auto_22647 ?auto_22656 ) ) ( IS-CRATE ?auto_22636 ) ( not ( = ?auto_22653 ?auto_22644 ) ) ( HOIST-AT ?auto_22667 ?auto_22653 ) ( AVAILABLE ?auto_22667 ) ( SURFACE-AT ?auto_22636 ?auto_22653 ) ( ON ?auto_22636 ?auto_22661 ) ( CLEAR ?auto_22636 ) ( not ( = ?auto_22635 ?auto_22636 ) ) ( not ( = ?auto_22635 ?auto_22661 ) ) ( not ( = ?auto_22636 ?auto_22661 ) ) ( not ( = ?auto_22647 ?auto_22667 ) ) ( IS-CRATE ?auto_22635 ) ( not ( = ?auto_22660 ?auto_22644 ) ) ( HOIST-AT ?auto_22658 ?auto_22660 ) ( SURFACE-AT ?auto_22635 ?auto_22660 ) ( ON ?auto_22635 ?auto_22662 ) ( CLEAR ?auto_22635 ) ( not ( = ?auto_22634 ?auto_22635 ) ) ( not ( = ?auto_22634 ?auto_22662 ) ) ( not ( = ?auto_22635 ?auto_22662 ) ) ( not ( = ?auto_22647 ?auto_22658 ) ) ( IS-CRATE ?auto_22634 ) ( AVAILABLE ?auto_22658 ) ( SURFACE-AT ?auto_22634 ?auto_22660 ) ( ON ?auto_22634 ?auto_22650 ) ( CLEAR ?auto_22634 ) ( not ( = ?auto_22633 ?auto_22634 ) ) ( not ( = ?auto_22633 ?auto_22650 ) ) ( not ( = ?auto_22634 ?auto_22650 ) ) ( IS-CRATE ?auto_22633 ) ( AVAILABLE ?auto_22671 ) ( SURFACE-AT ?auto_22633 ?auto_22652 ) ( ON ?auto_22633 ?auto_22649 ) ( CLEAR ?auto_22633 ) ( not ( = ?auto_22632 ?auto_22633 ) ) ( not ( = ?auto_22632 ?auto_22649 ) ) ( not ( = ?auto_22633 ?auto_22649 ) ) ( IS-CRATE ?auto_22632 ) ( SURFACE-AT ?auto_22632 ?auto_22646 ) ( ON ?auto_22632 ?auto_22670 ) ( CLEAR ?auto_22632 ) ( not ( = ?auto_22631 ?auto_22632 ) ) ( not ( = ?auto_22631 ?auto_22670 ) ) ( not ( = ?auto_22632 ?auto_22670 ) ) ( SURFACE-AT ?auto_22630 ?auto_22644 ) ( CLEAR ?auto_22630 ) ( IS-CRATE ?auto_22631 ) ( AVAILABLE ?auto_22647 ) ( AVAILABLE ?auto_22648 ) ( SURFACE-AT ?auto_22631 ?auto_22646 ) ( ON ?auto_22631 ?auto_22651 ) ( CLEAR ?auto_22631 ) ( TRUCK-AT ?auto_22645 ?auto_22644 ) ( not ( = ?auto_22630 ?auto_22631 ) ) ( not ( = ?auto_22630 ?auto_22651 ) ) ( not ( = ?auto_22631 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22632 ) ) ( not ( = ?auto_22630 ?auto_22670 ) ) ( not ( = ?auto_22632 ?auto_22651 ) ) ( not ( = ?auto_22670 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22633 ) ) ( not ( = ?auto_22630 ?auto_22649 ) ) ( not ( = ?auto_22631 ?auto_22633 ) ) ( not ( = ?auto_22631 ?auto_22649 ) ) ( not ( = ?auto_22633 ?auto_22670 ) ) ( not ( = ?auto_22633 ?auto_22651 ) ) ( not ( = ?auto_22652 ?auto_22646 ) ) ( not ( = ?auto_22671 ?auto_22648 ) ) ( not ( = ?auto_22649 ?auto_22670 ) ) ( not ( = ?auto_22649 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22634 ) ) ( not ( = ?auto_22630 ?auto_22650 ) ) ( not ( = ?auto_22631 ?auto_22634 ) ) ( not ( = ?auto_22631 ?auto_22650 ) ) ( not ( = ?auto_22632 ?auto_22634 ) ) ( not ( = ?auto_22632 ?auto_22650 ) ) ( not ( = ?auto_22634 ?auto_22649 ) ) ( not ( = ?auto_22634 ?auto_22670 ) ) ( not ( = ?auto_22634 ?auto_22651 ) ) ( not ( = ?auto_22660 ?auto_22652 ) ) ( not ( = ?auto_22660 ?auto_22646 ) ) ( not ( = ?auto_22658 ?auto_22671 ) ) ( not ( = ?auto_22658 ?auto_22648 ) ) ( not ( = ?auto_22650 ?auto_22649 ) ) ( not ( = ?auto_22650 ?auto_22670 ) ) ( not ( = ?auto_22650 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22635 ) ) ( not ( = ?auto_22630 ?auto_22662 ) ) ( not ( = ?auto_22631 ?auto_22635 ) ) ( not ( = ?auto_22631 ?auto_22662 ) ) ( not ( = ?auto_22632 ?auto_22635 ) ) ( not ( = ?auto_22632 ?auto_22662 ) ) ( not ( = ?auto_22633 ?auto_22635 ) ) ( not ( = ?auto_22633 ?auto_22662 ) ) ( not ( = ?auto_22635 ?auto_22650 ) ) ( not ( = ?auto_22635 ?auto_22649 ) ) ( not ( = ?auto_22635 ?auto_22670 ) ) ( not ( = ?auto_22635 ?auto_22651 ) ) ( not ( = ?auto_22662 ?auto_22650 ) ) ( not ( = ?auto_22662 ?auto_22649 ) ) ( not ( = ?auto_22662 ?auto_22670 ) ) ( not ( = ?auto_22662 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22636 ) ) ( not ( = ?auto_22630 ?auto_22661 ) ) ( not ( = ?auto_22631 ?auto_22636 ) ) ( not ( = ?auto_22631 ?auto_22661 ) ) ( not ( = ?auto_22632 ?auto_22636 ) ) ( not ( = ?auto_22632 ?auto_22661 ) ) ( not ( = ?auto_22633 ?auto_22636 ) ) ( not ( = ?auto_22633 ?auto_22661 ) ) ( not ( = ?auto_22634 ?auto_22636 ) ) ( not ( = ?auto_22634 ?auto_22661 ) ) ( not ( = ?auto_22636 ?auto_22662 ) ) ( not ( = ?auto_22636 ?auto_22650 ) ) ( not ( = ?auto_22636 ?auto_22649 ) ) ( not ( = ?auto_22636 ?auto_22670 ) ) ( not ( = ?auto_22636 ?auto_22651 ) ) ( not ( = ?auto_22653 ?auto_22660 ) ) ( not ( = ?auto_22653 ?auto_22652 ) ) ( not ( = ?auto_22653 ?auto_22646 ) ) ( not ( = ?auto_22667 ?auto_22658 ) ) ( not ( = ?auto_22667 ?auto_22671 ) ) ( not ( = ?auto_22667 ?auto_22648 ) ) ( not ( = ?auto_22661 ?auto_22662 ) ) ( not ( = ?auto_22661 ?auto_22650 ) ) ( not ( = ?auto_22661 ?auto_22649 ) ) ( not ( = ?auto_22661 ?auto_22670 ) ) ( not ( = ?auto_22661 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22637 ) ) ( not ( = ?auto_22630 ?auto_22664 ) ) ( not ( = ?auto_22631 ?auto_22637 ) ) ( not ( = ?auto_22631 ?auto_22664 ) ) ( not ( = ?auto_22632 ?auto_22637 ) ) ( not ( = ?auto_22632 ?auto_22664 ) ) ( not ( = ?auto_22633 ?auto_22637 ) ) ( not ( = ?auto_22633 ?auto_22664 ) ) ( not ( = ?auto_22634 ?auto_22637 ) ) ( not ( = ?auto_22634 ?auto_22664 ) ) ( not ( = ?auto_22635 ?auto_22637 ) ) ( not ( = ?auto_22635 ?auto_22664 ) ) ( not ( = ?auto_22637 ?auto_22661 ) ) ( not ( = ?auto_22637 ?auto_22662 ) ) ( not ( = ?auto_22637 ?auto_22650 ) ) ( not ( = ?auto_22637 ?auto_22649 ) ) ( not ( = ?auto_22637 ?auto_22670 ) ) ( not ( = ?auto_22637 ?auto_22651 ) ) ( not ( = ?auto_22659 ?auto_22653 ) ) ( not ( = ?auto_22659 ?auto_22660 ) ) ( not ( = ?auto_22659 ?auto_22652 ) ) ( not ( = ?auto_22659 ?auto_22646 ) ) ( not ( = ?auto_22656 ?auto_22667 ) ) ( not ( = ?auto_22656 ?auto_22658 ) ) ( not ( = ?auto_22656 ?auto_22671 ) ) ( not ( = ?auto_22656 ?auto_22648 ) ) ( not ( = ?auto_22664 ?auto_22661 ) ) ( not ( = ?auto_22664 ?auto_22662 ) ) ( not ( = ?auto_22664 ?auto_22650 ) ) ( not ( = ?auto_22664 ?auto_22649 ) ) ( not ( = ?auto_22664 ?auto_22670 ) ) ( not ( = ?auto_22664 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22638 ) ) ( not ( = ?auto_22630 ?auto_22655 ) ) ( not ( = ?auto_22631 ?auto_22638 ) ) ( not ( = ?auto_22631 ?auto_22655 ) ) ( not ( = ?auto_22632 ?auto_22638 ) ) ( not ( = ?auto_22632 ?auto_22655 ) ) ( not ( = ?auto_22633 ?auto_22638 ) ) ( not ( = ?auto_22633 ?auto_22655 ) ) ( not ( = ?auto_22634 ?auto_22638 ) ) ( not ( = ?auto_22634 ?auto_22655 ) ) ( not ( = ?auto_22635 ?auto_22638 ) ) ( not ( = ?auto_22635 ?auto_22655 ) ) ( not ( = ?auto_22636 ?auto_22638 ) ) ( not ( = ?auto_22636 ?auto_22655 ) ) ( not ( = ?auto_22638 ?auto_22664 ) ) ( not ( = ?auto_22638 ?auto_22661 ) ) ( not ( = ?auto_22638 ?auto_22662 ) ) ( not ( = ?auto_22638 ?auto_22650 ) ) ( not ( = ?auto_22638 ?auto_22649 ) ) ( not ( = ?auto_22638 ?auto_22670 ) ) ( not ( = ?auto_22638 ?auto_22651 ) ) ( not ( = ?auto_22655 ?auto_22664 ) ) ( not ( = ?auto_22655 ?auto_22661 ) ) ( not ( = ?auto_22655 ?auto_22662 ) ) ( not ( = ?auto_22655 ?auto_22650 ) ) ( not ( = ?auto_22655 ?auto_22649 ) ) ( not ( = ?auto_22655 ?auto_22670 ) ) ( not ( = ?auto_22655 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22639 ) ) ( not ( = ?auto_22630 ?auto_22668 ) ) ( not ( = ?auto_22631 ?auto_22639 ) ) ( not ( = ?auto_22631 ?auto_22668 ) ) ( not ( = ?auto_22632 ?auto_22639 ) ) ( not ( = ?auto_22632 ?auto_22668 ) ) ( not ( = ?auto_22633 ?auto_22639 ) ) ( not ( = ?auto_22633 ?auto_22668 ) ) ( not ( = ?auto_22634 ?auto_22639 ) ) ( not ( = ?auto_22634 ?auto_22668 ) ) ( not ( = ?auto_22635 ?auto_22639 ) ) ( not ( = ?auto_22635 ?auto_22668 ) ) ( not ( = ?auto_22636 ?auto_22639 ) ) ( not ( = ?auto_22636 ?auto_22668 ) ) ( not ( = ?auto_22637 ?auto_22639 ) ) ( not ( = ?auto_22637 ?auto_22668 ) ) ( not ( = ?auto_22639 ?auto_22655 ) ) ( not ( = ?auto_22639 ?auto_22664 ) ) ( not ( = ?auto_22639 ?auto_22661 ) ) ( not ( = ?auto_22639 ?auto_22662 ) ) ( not ( = ?auto_22639 ?auto_22650 ) ) ( not ( = ?auto_22639 ?auto_22649 ) ) ( not ( = ?auto_22639 ?auto_22670 ) ) ( not ( = ?auto_22639 ?auto_22651 ) ) ( not ( = ?auto_22663 ?auto_22646 ) ) ( not ( = ?auto_22663 ?auto_22659 ) ) ( not ( = ?auto_22663 ?auto_22653 ) ) ( not ( = ?auto_22663 ?auto_22660 ) ) ( not ( = ?auto_22663 ?auto_22652 ) ) ( not ( = ?auto_22654 ?auto_22648 ) ) ( not ( = ?auto_22654 ?auto_22656 ) ) ( not ( = ?auto_22654 ?auto_22667 ) ) ( not ( = ?auto_22654 ?auto_22658 ) ) ( not ( = ?auto_22654 ?auto_22671 ) ) ( not ( = ?auto_22668 ?auto_22655 ) ) ( not ( = ?auto_22668 ?auto_22664 ) ) ( not ( = ?auto_22668 ?auto_22661 ) ) ( not ( = ?auto_22668 ?auto_22662 ) ) ( not ( = ?auto_22668 ?auto_22650 ) ) ( not ( = ?auto_22668 ?auto_22649 ) ) ( not ( = ?auto_22668 ?auto_22670 ) ) ( not ( = ?auto_22668 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22640 ) ) ( not ( = ?auto_22630 ?auto_22669 ) ) ( not ( = ?auto_22631 ?auto_22640 ) ) ( not ( = ?auto_22631 ?auto_22669 ) ) ( not ( = ?auto_22632 ?auto_22640 ) ) ( not ( = ?auto_22632 ?auto_22669 ) ) ( not ( = ?auto_22633 ?auto_22640 ) ) ( not ( = ?auto_22633 ?auto_22669 ) ) ( not ( = ?auto_22634 ?auto_22640 ) ) ( not ( = ?auto_22634 ?auto_22669 ) ) ( not ( = ?auto_22635 ?auto_22640 ) ) ( not ( = ?auto_22635 ?auto_22669 ) ) ( not ( = ?auto_22636 ?auto_22640 ) ) ( not ( = ?auto_22636 ?auto_22669 ) ) ( not ( = ?auto_22637 ?auto_22640 ) ) ( not ( = ?auto_22637 ?auto_22669 ) ) ( not ( = ?auto_22638 ?auto_22640 ) ) ( not ( = ?auto_22638 ?auto_22669 ) ) ( not ( = ?auto_22640 ?auto_22668 ) ) ( not ( = ?auto_22640 ?auto_22655 ) ) ( not ( = ?auto_22640 ?auto_22664 ) ) ( not ( = ?auto_22640 ?auto_22661 ) ) ( not ( = ?auto_22640 ?auto_22662 ) ) ( not ( = ?auto_22640 ?auto_22650 ) ) ( not ( = ?auto_22640 ?auto_22649 ) ) ( not ( = ?auto_22640 ?auto_22670 ) ) ( not ( = ?auto_22640 ?auto_22651 ) ) ( not ( = ?auto_22669 ?auto_22668 ) ) ( not ( = ?auto_22669 ?auto_22655 ) ) ( not ( = ?auto_22669 ?auto_22664 ) ) ( not ( = ?auto_22669 ?auto_22661 ) ) ( not ( = ?auto_22669 ?auto_22662 ) ) ( not ( = ?auto_22669 ?auto_22650 ) ) ( not ( = ?auto_22669 ?auto_22649 ) ) ( not ( = ?auto_22669 ?auto_22670 ) ) ( not ( = ?auto_22669 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22641 ) ) ( not ( = ?auto_22630 ?auto_22657 ) ) ( not ( = ?auto_22631 ?auto_22641 ) ) ( not ( = ?auto_22631 ?auto_22657 ) ) ( not ( = ?auto_22632 ?auto_22641 ) ) ( not ( = ?auto_22632 ?auto_22657 ) ) ( not ( = ?auto_22633 ?auto_22641 ) ) ( not ( = ?auto_22633 ?auto_22657 ) ) ( not ( = ?auto_22634 ?auto_22641 ) ) ( not ( = ?auto_22634 ?auto_22657 ) ) ( not ( = ?auto_22635 ?auto_22641 ) ) ( not ( = ?auto_22635 ?auto_22657 ) ) ( not ( = ?auto_22636 ?auto_22641 ) ) ( not ( = ?auto_22636 ?auto_22657 ) ) ( not ( = ?auto_22637 ?auto_22641 ) ) ( not ( = ?auto_22637 ?auto_22657 ) ) ( not ( = ?auto_22638 ?auto_22641 ) ) ( not ( = ?auto_22638 ?auto_22657 ) ) ( not ( = ?auto_22639 ?auto_22641 ) ) ( not ( = ?auto_22639 ?auto_22657 ) ) ( not ( = ?auto_22641 ?auto_22669 ) ) ( not ( = ?auto_22641 ?auto_22668 ) ) ( not ( = ?auto_22641 ?auto_22655 ) ) ( not ( = ?auto_22641 ?auto_22664 ) ) ( not ( = ?auto_22641 ?auto_22661 ) ) ( not ( = ?auto_22641 ?auto_22662 ) ) ( not ( = ?auto_22641 ?auto_22650 ) ) ( not ( = ?auto_22641 ?auto_22649 ) ) ( not ( = ?auto_22641 ?auto_22670 ) ) ( not ( = ?auto_22641 ?auto_22651 ) ) ( not ( = ?auto_22665 ?auto_22652 ) ) ( not ( = ?auto_22665 ?auto_22663 ) ) ( not ( = ?auto_22665 ?auto_22646 ) ) ( not ( = ?auto_22665 ?auto_22659 ) ) ( not ( = ?auto_22665 ?auto_22653 ) ) ( not ( = ?auto_22665 ?auto_22660 ) ) ( not ( = ?auto_22666 ?auto_22671 ) ) ( not ( = ?auto_22666 ?auto_22654 ) ) ( not ( = ?auto_22666 ?auto_22648 ) ) ( not ( = ?auto_22666 ?auto_22656 ) ) ( not ( = ?auto_22666 ?auto_22667 ) ) ( not ( = ?auto_22666 ?auto_22658 ) ) ( not ( = ?auto_22657 ?auto_22669 ) ) ( not ( = ?auto_22657 ?auto_22668 ) ) ( not ( = ?auto_22657 ?auto_22655 ) ) ( not ( = ?auto_22657 ?auto_22664 ) ) ( not ( = ?auto_22657 ?auto_22661 ) ) ( not ( = ?auto_22657 ?auto_22662 ) ) ( not ( = ?auto_22657 ?auto_22650 ) ) ( not ( = ?auto_22657 ?auto_22649 ) ) ( not ( = ?auto_22657 ?auto_22670 ) ) ( not ( = ?auto_22657 ?auto_22651 ) ) ( not ( = ?auto_22630 ?auto_22642 ) ) ( not ( = ?auto_22630 ?auto_22643 ) ) ( not ( = ?auto_22631 ?auto_22642 ) ) ( not ( = ?auto_22631 ?auto_22643 ) ) ( not ( = ?auto_22632 ?auto_22642 ) ) ( not ( = ?auto_22632 ?auto_22643 ) ) ( not ( = ?auto_22633 ?auto_22642 ) ) ( not ( = ?auto_22633 ?auto_22643 ) ) ( not ( = ?auto_22634 ?auto_22642 ) ) ( not ( = ?auto_22634 ?auto_22643 ) ) ( not ( = ?auto_22635 ?auto_22642 ) ) ( not ( = ?auto_22635 ?auto_22643 ) ) ( not ( = ?auto_22636 ?auto_22642 ) ) ( not ( = ?auto_22636 ?auto_22643 ) ) ( not ( = ?auto_22637 ?auto_22642 ) ) ( not ( = ?auto_22637 ?auto_22643 ) ) ( not ( = ?auto_22638 ?auto_22642 ) ) ( not ( = ?auto_22638 ?auto_22643 ) ) ( not ( = ?auto_22639 ?auto_22642 ) ) ( not ( = ?auto_22639 ?auto_22643 ) ) ( not ( = ?auto_22640 ?auto_22642 ) ) ( not ( = ?auto_22640 ?auto_22643 ) ) ( not ( = ?auto_22642 ?auto_22657 ) ) ( not ( = ?auto_22642 ?auto_22669 ) ) ( not ( = ?auto_22642 ?auto_22668 ) ) ( not ( = ?auto_22642 ?auto_22655 ) ) ( not ( = ?auto_22642 ?auto_22664 ) ) ( not ( = ?auto_22642 ?auto_22661 ) ) ( not ( = ?auto_22642 ?auto_22662 ) ) ( not ( = ?auto_22642 ?auto_22650 ) ) ( not ( = ?auto_22642 ?auto_22649 ) ) ( not ( = ?auto_22642 ?auto_22670 ) ) ( not ( = ?auto_22642 ?auto_22651 ) ) ( not ( = ?auto_22643 ?auto_22657 ) ) ( not ( = ?auto_22643 ?auto_22669 ) ) ( not ( = ?auto_22643 ?auto_22668 ) ) ( not ( = ?auto_22643 ?auto_22655 ) ) ( not ( = ?auto_22643 ?auto_22664 ) ) ( not ( = ?auto_22643 ?auto_22661 ) ) ( not ( = ?auto_22643 ?auto_22662 ) ) ( not ( = ?auto_22643 ?auto_22650 ) ) ( not ( = ?auto_22643 ?auto_22649 ) ) ( not ( = ?auto_22643 ?auto_22670 ) ) ( not ( = ?auto_22643 ?auto_22651 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_22630 ?auto_22631 ?auto_22632 ?auto_22633 ?auto_22634 ?auto_22635 ?auto_22636 ?auto_22637 ?auto_22638 ?auto_22639 ?auto_22640 ?auto_22641 )
      ( MAKE-1CRATE ?auto_22641 ?auto_22642 )
      ( MAKE-12CRATE-VERIFY ?auto_22630 ?auto_22631 ?auto_22632 ?auto_22633 ?auto_22634 ?auto_22635 ?auto_22636 ?auto_22637 ?auto_22638 ?auto_22639 ?auto_22640 ?auto_22641 ?auto_22642 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_22696 - SURFACE
      ?auto_22697 - SURFACE
      ?auto_22698 - SURFACE
      ?auto_22699 - SURFACE
      ?auto_22700 - SURFACE
      ?auto_22701 - SURFACE
      ?auto_22702 - SURFACE
      ?auto_22703 - SURFACE
      ?auto_22704 - SURFACE
      ?auto_22705 - SURFACE
      ?auto_22706 - SURFACE
      ?auto_22707 - SURFACE
      ?auto_22708 - SURFACE
      ?auto_22709 - SURFACE
    )
    :vars
    (
      ?auto_22715 - HOIST
      ?auto_22714 - PLACE
      ?auto_22711 - PLACE
      ?auto_22710 - HOIST
      ?auto_22712 - SURFACE
      ?auto_22738 - PLACE
      ?auto_22730 - HOIST
      ?auto_22735 - SURFACE
      ?auto_22731 - PLACE
      ?auto_22719 - HOIST
      ?auto_22716 - SURFACE
      ?auto_22728 - PLACE
      ?auto_22739 - HOIST
      ?auto_22741 - SURFACE
      ?auto_22721 - PLACE
      ?auto_22725 - HOIST
      ?auto_22723 - SURFACE
      ?auto_22720 - SURFACE
      ?auto_22729 - PLACE
      ?auto_22736 - HOIST
      ?auto_22722 - SURFACE
      ?auto_22740 - PLACE
      ?auto_22734 - HOIST
      ?auto_22733 - SURFACE
      ?auto_22737 - PLACE
      ?auto_22727 - HOIST
      ?auto_22717 - SURFACE
      ?auto_22724 - SURFACE
      ?auto_22718 - SURFACE
      ?auto_22732 - SURFACE
      ?auto_22726 - SURFACE
      ?auto_22713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22715 ?auto_22714 ) ( IS-CRATE ?auto_22709 ) ( not ( = ?auto_22711 ?auto_22714 ) ) ( HOIST-AT ?auto_22710 ?auto_22711 ) ( AVAILABLE ?auto_22710 ) ( SURFACE-AT ?auto_22709 ?auto_22711 ) ( ON ?auto_22709 ?auto_22712 ) ( CLEAR ?auto_22709 ) ( not ( = ?auto_22708 ?auto_22709 ) ) ( not ( = ?auto_22708 ?auto_22712 ) ) ( not ( = ?auto_22709 ?auto_22712 ) ) ( not ( = ?auto_22715 ?auto_22710 ) ) ( IS-CRATE ?auto_22708 ) ( not ( = ?auto_22738 ?auto_22714 ) ) ( HOIST-AT ?auto_22730 ?auto_22738 ) ( SURFACE-AT ?auto_22708 ?auto_22738 ) ( ON ?auto_22708 ?auto_22735 ) ( CLEAR ?auto_22708 ) ( not ( = ?auto_22707 ?auto_22708 ) ) ( not ( = ?auto_22707 ?auto_22735 ) ) ( not ( = ?auto_22708 ?auto_22735 ) ) ( not ( = ?auto_22715 ?auto_22730 ) ) ( IS-CRATE ?auto_22707 ) ( not ( = ?auto_22731 ?auto_22714 ) ) ( HOIST-AT ?auto_22719 ?auto_22731 ) ( AVAILABLE ?auto_22719 ) ( SURFACE-AT ?auto_22707 ?auto_22731 ) ( ON ?auto_22707 ?auto_22716 ) ( CLEAR ?auto_22707 ) ( not ( = ?auto_22706 ?auto_22707 ) ) ( not ( = ?auto_22706 ?auto_22716 ) ) ( not ( = ?auto_22707 ?auto_22716 ) ) ( not ( = ?auto_22715 ?auto_22719 ) ) ( IS-CRATE ?auto_22706 ) ( not ( = ?auto_22728 ?auto_22714 ) ) ( HOIST-AT ?auto_22739 ?auto_22728 ) ( SURFACE-AT ?auto_22706 ?auto_22728 ) ( ON ?auto_22706 ?auto_22741 ) ( CLEAR ?auto_22706 ) ( not ( = ?auto_22705 ?auto_22706 ) ) ( not ( = ?auto_22705 ?auto_22741 ) ) ( not ( = ?auto_22706 ?auto_22741 ) ) ( not ( = ?auto_22715 ?auto_22739 ) ) ( IS-CRATE ?auto_22705 ) ( not ( = ?auto_22721 ?auto_22714 ) ) ( HOIST-AT ?auto_22725 ?auto_22721 ) ( AVAILABLE ?auto_22725 ) ( SURFACE-AT ?auto_22705 ?auto_22721 ) ( ON ?auto_22705 ?auto_22723 ) ( CLEAR ?auto_22705 ) ( not ( = ?auto_22704 ?auto_22705 ) ) ( not ( = ?auto_22704 ?auto_22723 ) ) ( not ( = ?auto_22705 ?auto_22723 ) ) ( not ( = ?auto_22715 ?auto_22725 ) ) ( IS-CRATE ?auto_22704 ) ( SURFACE-AT ?auto_22704 ?auto_22738 ) ( ON ?auto_22704 ?auto_22720 ) ( CLEAR ?auto_22704 ) ( not ( = ?auto_22703 ?auto_22704 ) ) ( not ( = ?auto_22703 ?auto_22720 ) ) ( not ( = ?auto_22704 ?auto_22720 ) ) ( IS-CRATE ?auto_22703 ) ( not ( = ?auto_22729 ?auto_22714 ) ) ( HOIST-AT ?auto_22736 ?auto_22729 ) ( AVAILABLE ?auto_22736 ) ( SURFACE-AT ?auto_22703 ?auto_22729 ) ( ON ?auto_22703 ?auto_22722 ) ( CLEAR ?auto_22703 ) ( not ( = ?auto_22702 ?auto_22703 ) ) ( not ( = ?auto_22702 ?auto_22722 ) ) ( not ( = ?auto_22703 ?auto_22722 ) ) ( not ( = ?auto_22715 ?auto_22736 ) ) ( IS-CRATE ?auto_22702 ) ( not ( = ?auto_22740 ?auto_22714 ) ) ( HOIST-AT ?auto_22734 ?auto_22740 ) ( AVAILABLE ?auto_22734 ) ( SURFACE-AT ?auto_22702 ?auto_22740 ) ( ON ?auto_22702 ?auto_22733 ) ( CLEAR ?auto_22702 ) ( not ( = ?auto_22701 ?auto_22702 ) ) ( not ( = ?auto_22701 ?auto_22733 ) ) ( not ( = ?auto_22702 ?auto_22733 ) ) ( not ( = ?auto_22715 ?auto_22734 ) ) ( IS-CRATE ?auto_22701 ) ( not ( = ?auto_22737 ?auto_22714 ) ) ( HOIST-AT ?auto_22727 ?auto_22737 ) ( SURFACE-AT ?auto_22701 ?auto_22737 ) ( ON ?auto_22701 ?auto_22717 ) ( CLEAR ?auto_22701 ) ( not ( = ?auto_22700 ?auto_22701 ) ) ( not ( = ?auto_22700 ?auto_22717 ) ) ( not ( = ?auto_22701 ?auto_22717 ) ) ( not ( = ?auto_22715 ?auto_22727 ) ) ( IS-CRATE ?auto_22700 ) ( AVAILABLE ?auto_22727 ) ( SURFACE-AT ?auto_22700 ?auto_22737 ) ( ON ?auto_22700 ?auto_22724 ) ( CLEAR ?auto_22700 ) ( not ( = ?auto_22699 ?auto_22700 ) ) ( not ( = ?auto_22699 ?auto_22724 ) ) ( not ( = ?auto_22700 ?auto_22724 ) ) ( IS-CRATE ?auto_22699 ) ( AVAILABLE ?auto_22739 ) ( SURFACE-AT ?auto_22699 ?auto_22728 ) ( ON ?auto_22699 ?auto_22718 ) ( CLEAR ?auto_22699 ) ( not ( = ?auto_22698 ?auto_22699 ) ) ( not ( = ?auto_22698 ?auto_22718 ) ) ( not ( = ?auto_22699 ?auto_22718 ) ) ( IS-CRATE ?auto_22698 ) ( SURFACE-AT ?auto_22698 ?auto_22738 ) ( ON ?auto_22698 ?auto_22732 ) ( CLEAR ?auto_22698 ) ( not ( = ?auto_22697 ?auto_22698 ) ) ( not ( = ?auto_22697 ?auto_22732 ) ) ( not ( = ?auto_22698 ?auto_22732 ) ) ( SURFACE-AT ?auto_22696 ?auto_22714 ) ( CLEAR ?auto_22696 ) ( IS-CRATE ?auto_22697 ) ( AVAILABLE ?auto_22715 ) ( AVAILABLE ?auto_22730 ) ( SURFACE-AT ?auto_22697 ?auto_22738 ) ( ON ?auto_22697 ?auto_22726 ) ( CLEAR ?auto_22697 ) ( TRUCK-AT ?auto_22713 ?auto_22714 ) ( not ( = ?auto_22696 ?auto_22697 ) ) ( not ( = ?auto_22696 ?auto_22726 ) ) ( not ( = ?auto_22697 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22698 ) ) ( not ( = ?auto_22696 ?auto_22732 ) ) ( not ( = ?auto_22698 ?auto_22726 ) ) ( not ( = ?auto_22732 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22699 ) ) ( not ( = ?auto_22696 ?auto_22718 ) ) ( not ( = ?auto_22697 ?auto_22699 ) ) ( not ( = ?auto_22697 ?auto_22718 ) ) ( not ( = ?auto_22699 ?auto_22732 ) ) ( not ( = ?auto_22699 ?auto_22726 ) ) ( not ( = ?auto_22728 ?auto_22738 ) ) ( not ( = ?auto_22739 ?auto_22730 ) ) ( not ( = ?auto_22718 ?auto_22732 ) ) ( not ( = ?auto_22718 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22700 ) ) ( not ( = ?auto_22696 ?auto_22724 ) ) ( not ( = ?auto_22697 ?auto_22700 ) ) ( not ( = ?auto_22697 ?auto_22724 ) ) ( not ( = ?auto_22698 ?auto_22700 ) ) ( not ( = ?auto_22698 ?auto_22724 ) ) ( not ( = ?auto_22700 ?auto_22718 ) ) ( not ( = ?auto_22700 ?auto_22732 ) ) ( not ( = ?auto_22700 ?auto_22726 ) ) ( not ( = ?auto_22737 ?auto_22728 ) ) ( not ( = ?auto_22737 ?auto_22738 ) ) ( not ( = ?auto_22727 ?auto_22739 ) ) ( not ( = ?auto_22727 ?auto_22730 ) ) ( not ( = ?auto_22724 ?auto_22718 ) ) ( not ( = ?auto_22724 ?auto_22732 ) ) ( not ( = ?auto_22724 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22701 ) ) ( not ( = ?auto_22696 ?auto_22717 ) ) ( not ( = ?auto_22697 ?auto_22701 ) ) ( not ( = ?auto_22697 ?auto_22717 ) ) ( not ( = ?auto_22698 ?auto_22701 ) ) ( not ( = ?auto_22698 ?auto_22717 ) ) ( not ( = ?auto_22699 ?auto_22701 ) ) ( not ( = ?auto_22699 ?auto_22717 ) ) ( not ( = ?auto_22701 ?auto_22724 ) ) ( not ( = ?auto_22701 ?auto_22718 ) ) ( not ( = ?auto_22701 ?auto_22732 ) ) ( not ( = ?auto_22701 ?auto_22726 ) ) ( not ( = ?auto_22717 ?auto_22724 ) ) ( not ( = ?auto_22717 ?auto_22718 ) ) ( not ( = ?auto_22717 ?auto_22732 ) ) ( not ( = ?auto_22717 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22702 ) ) ( not ( = ?auto_22696 ?auto_22733 ) ) ( not ( = ?auto_22697 ?auto_22702 ) ) ( not ( = ?auto_22697 ?auto_22733 ) ) ( not ( = ?auto_22698 ?auto_22702 ) ) ( not ( = ?auto_22698 ?auto_22733 ) ) ( not ( = ?auto_22699 ?auto_22702 ) ) ( not ( = ?auto_22699 ?auto_22733 ) ) ( not ( = ?auto_22700 ?auto_22702 ) ) ( not ( = ?auto_22700 ?auto_22733 ) ) ( not ( = ?auto_22702 ?auto_22717 ) ) ( not ( = ?auto_22702 ?auto_22724 ) ) ( not ( = ?auto_22702 ?auto_22718 ) ) ( not ( = ?auto_22702 ?auto_22732 ) ) ( not ( = ?auto_22702 ?auto_22726 ) ) ( not ( = ?auto_22740 ?auto_22737 ) ) ( not ( = ?auto_22740 ?auto_22728 ) ) ( not ( = ?auto_22740 ?auto_22738 ) ) ( not ( = ?auto_22734 ?auto_22727 ) ) ( not ( = ?auto_22734 ?auto_22739 ) ) ( not ( = ?auto_22734 ?auto_22730 ) ) ( not ( = ?auto_22733 ?auto_22717 ) ) ( not ( = ?auto_22733 ?auto_22724 ) ) ( not ( = ?auto_22733 ?auto_22718 ) ) ( not ( = ?auto_22733 ?auto_22732 ) ) ( not ( = ?auto_22733 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22703 ) ) ( not ( = ?auto_22696 ?auto_22722 ) ) ( not ( = ?auto_22697 ?auto_22703 ) ) ( not ( = ?auto_22697 ?auto_22722 ) ) ( not ( = ?auto_22698 ?auto_22703 ) ) ( not ( = ?auto_22698 ?auto_22722 ) ) ( not ( = ?auto_22699 ?auto_22703 ) ) ( not ( = ?auto_22699 ?auto_22722 ) ) ( not ( = ?auto_22700 ?auto_22703 ) ) ( not ( = ?auto_22700 ?auto_22722 ) ) ( not ( = ?auto_22701 ?auto_22703 ) ) ( not ( = ?auto_22701 ?auto_22722 ) ) ( not ( = ?auto_22703 ?auto_22733 ) ) ( not ( = ?auto_22703 ?auto_22717 ) ) ( not ( = ?auto_22703 ?auto_22724 ) ) ( not ( = ?auto_22703 ?auto_22718 ) ) ( not ( = ?auto_22703 ?auto_22732 ) ) ( not ( = ?auto_22703 ?auto_22726 ) ) ( not ( = ?auto_22729 ?auto_22740 ) ) ( not ( = ?auto_22729 ?auto_22737 ) ) ( not ( = ?auto_22729 ?auto_22728 ) ) ( not ( = ?auto_22729 ?auto_22738 ) ) ( not ( = ?auto_22736 ?auto_22734 ) ) ( not ( = ?auto_22736 ?auto_22727 ) ) ( not ( = ?auto_22736 ?auto_22739 ) ) ( not ( = ?auto_22736 ?auto_22730 ) ) ( not ( = ?auto_22722 ?auto_22733 ) ) ( not ( = ?auto_22722 ?auto_22717 ) ) ( not ( = ?auto_22722 ?auto_22724 ) ) ( not ( = ?auto_22722 ?auto_22718 ) ) ( not ( = ?auto_22722 ?auto_22732 ) ) ( not ( = ?auto_22722 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22704 ) ) ( not ( = ?auto_22696 ?auto_22720 ) ) ( not ( = ?auto_22697 ?auto_22704 ) ) ( not ( = ?auto_22697 ?auto_22720 ) ) ( not ( = ?auto_22698 ?auto_22704 ) ) ( not ( = ?auto_22698 ?auto_22720 ) ) ( not ( = ?auto_22699 ?auto_22704 ) ) ( not ( = ?auto_22699 ?auto_22720 ) ) ( not ( = ?auto_22700 ?auto_22704 ) ) ( not ( = ?auto_22700 ?auto_22720 ) ) ( not ( = ?auto_22701 ?auto_22704 ) ) ( not ( = ?auto_22701 ?auto_22720 ) ) ( not ( = ?auto_22702 ?auto_22704 ) ) ( not ( = ?auto_22702 ?auto_22720 ) ) ( not ( = ?auto_22704 ?auto_22722 ) ) ( not ( = ?auto_22704 ?auto_22733 ) ) ( not ( = ?auto_22704 ?auto_22717 ) ) ( not ( = ?auto_22704 ?auto_22724 ) ) ( not ( = ?auto_22704 ?auto_22718 ) ) ( not ( = ?auto_22704 ?auto_22732 ) ) ( not ( = ?auto_22704 ?auto_22726 ) ) ( not ( = ?auto_22720 ?auto_22722 ) ) ( not ( = ?auto_22720 ?auto_22733 ) ) ( not ( = ?auto_22720 ?auto_22717 ) ) ( not ( = ?auto_22720 ?auto_22724 ) ) ( not ( = ?auto_22720 ?auto_22718 ) ) ( not ( = ?auto_22720 ?auto_22732 ) ) ( not ( = ?auto_22720 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22705 ) ) ( not ( = ?auto_22696 ?auto_22723 ) ) ( not ( = ?auto_22697 ?auto_22705 ) ) ( not ( = ?auto_22697 ?auto_22723 ) ) ( not ( = ?auto_22698 ?auto_22705 ) ) ( not ( = ?auto_22698 ?auto_22723 ) ) ( not ( = ?auto_22699 ?auto_22705 ) ) ( not ( = ?auto_22699 ?auto_22723 ) ) ( not ( = ?auto_22700 ?auto_22705 ) ) ( not ( = ?auto_22700 ?auto_22723 ) ) ( not ( = ?auto_22701 ?auto_22705 ) ) ( not ( = ?auto_22701 ?auto_22723 ) ) ( not ( = ?auto_22702 ?auto_22705 ) ) ( not ( = ?auto_22702 ?auto_22723 ) ) ( not ( = ?auto_22703 ?auto_22705 ) ) ( not ( = ?auto_22703 ?auto_22723 ) ) ( not ( = ?auto_22705 ?auto_22720 ) ) ( not ( = ?auto_22705 ?auto_22722 ) ) ( not ( = ?auto_22705 ?auto_22733 ) ) ( not ( = ?auto_22705 ?auto_22717 ) ) ( not ( = ?auto_22705 ?auto_22724 ) ) ( not ( = ?auto_22705 ?auto_22718 ) ) ( not ( = ?auto_22705 ?auto_22732 ) ) ( not ( = ?auto_22705 ?auto_22726 ) ) ( not ( = ?auto_22721 ?auto_22738 ) ) ( not ( = ?auto_22721 ?auto_22729 ) ) ( not ( = ?auto_22721 ?auto_22740 ) ) ( not ( = ?auto_22721 ?auto_22737 ) ) ( not ( = ?auto_22721 ?auto_22728 ) ) ( not ( = ?auto_22725 ?auto_22730 ) ) ( not ( = ?auto_22725 ?auto_22736 ) ) ( not ( = ?auto_22725 ?auto_22734 ) ) ( not ( = ?auto_22725 ?auto_22727 ) ) ( not ( = ?auto_22725 ?auto_22739 ) ) ( not ( = ?auto_22723 ?auto_22720 ) ) ( not ( = ?auto_22723 ?auto_22722 ) ) ( not ( = ?auto_22723 ?auto_22733 ) ) ( not ( = ?auto_22723 ?auto_22717 ) ) ( not ( = ?auto_22723 ?auto_22724 ) ) ( not ( = ?auto_22723 ?auto_22718 ) ) ( not ( = ?auto_22723 ?auto_22732 ) ) ( not ( = ?auto_22723 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22706 ) ) ( not ( = ?auto_22696 ?auto_22741 ) ) ( not ( = ?auto_22697 ?auto_22706 ) ) ( not ( = ?auto_22697 ?auto_22741 ) ) ( not ( = ?auto_22698 ?auto_22706 ) ) ( not ( = ?auto_22698 ?auto_22741 ) ) ( not ( = ?auto_22699 ?auto_22706 ) ) ( not ( = ?auto_22699 ?auto_22741 ) ) ( not ( = ?auto_22700 ?auto_22706 ) ) ( not ( = ?auto_22700 ?auto_22741 ) ) ( not ( = ?auto_22701 ?auto_22706 ) ) ( not ( = ?auto_22701 ?auto_22741 ) ) ( not ( = ?auto_22702 ?auto_22706 ) ) ( not ( = ?auto_22702 ?auto_22741 ) ) ( not ( = ?auto_22703 ?auto_22706 ) ) ( not ( = ?auto_22703 ?auto_22741 ) ) ( not ( = ?auto_22704 ?auto_22706 ) ) ( not ( = ?auto_22704 ?auto_22741 ) ) ( not ( = ?auto_22706 ?auto_22723 ) ) ( not ( = ?auto_22706 ?auto_22720 ) ) ( not ( = ?auto_22706 ?auto_22722 ) ) ( not ( = ?auto_22706 ?auto_22733 ) ) ( not ( = ?auto_22706 ?auto_22717 ) ) ( not ( = ?auto_22706 ?auto_22724 ) ) ( not ( = ?auto_22706 ?auto_22718 ) ) ( not ( = ?auto_22706 ?auto_22732 ) ) ( not ( = ?auto_22706 ?auto_22726 ) ) ( not ( = ?auto_22741 ?auto_22723 ) ) ( not ( = ?auto_22741 ?auto_22720 ) ) ( not ( = ?auto_22741 ?auto_22722 ) ) ( not ( = ?auto_22741 ?auto_22733 ) ) ( not ( = ?auto_22741 ?auto_22717 ) ) ( not ( = ?auto_22741 ?auto_22724 ) ) ( not ( = ?auto_22741 ?auto_22718 ) ) ( not ( = ?auto_22741 ?auto_22732 ) ) ( not ( = ?auto_22741 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22707 ) ) ( not ( = ?auto_22696 ?auto_22716 ) ) ( not ( = ?auto_22697 ?auto_22707 ) ) ( not ( = ?auto_22697 ?auto_22716 ) ) ( not ( = ?auto_22698 ?auto_22707 ) ) ( not ( = ?auto_22698 ?auto_22716 ) ) ( not ( = ?auto_22699 ?auto_22707 ) ) ( not ( = ?auto_22699 ?auto_22716 ) ) ( not ( = ?auto_22700 ?auto_22707 ) ) ( not ( = ?auto_22700 ?auto_22716 ) ) ( not ( = ?auto_22701 ?auto_22707 ) ) ( not ( = ?auto_22701 ?auto_22716 ) ) ( not ( = ?auto_22702 ?auto_22707 ) ) ( not ( = ?auto_22702 ?auto_22716 ) ) ( not ( = ?auto_22703 ?auto_22707 ) ) ( not ( = ?auto_22703 ?auto_22716 ) ) ( not ( = ?auto_22704 ?auto_22707 ) ) ( not ( = ?auto_22704 ?auto_22716 ) ) ( not ( = ?auto_22705 ?auto_22707 ) ) ( not ( = ?auto_22705 ?auto_22716 ) ) ( not ( = ?auto_22707 ?auto_22741 ) ) ( not ( = ?auto_22707 ?auto_22723 ) ) ( not ( = ?auto_22707 ?auto_22720 ) ) ( not ( = ?auto_22707 ?auto_22722 ) ) ( not ( = ?auto_22707 ?auto_22733 ) ) ( not ( = ?auto_22707 ?auto_22717 ) ) ( not ( = ?auto_22707 ?auto_22724 ) ) ( not ( = ?auto_22707 ?auto_22718 ) ) ( not ( = ?auto_22707 ?auto_22732 ) ) ( not ( = ?auto_22707 ?auto_22726 ) ) ( not ( = ?auto_22731 ?auto_22728 ) ) ( not ( = ?auto_22731 ?auto_22721 ) ) ( not ( = ?auto_22731 ?auto_22738 ) ) ( not ( = ?auto_22731 ?auto_22729 ) ) ( not ( = ?auto_22731 ?auto_22740 ) ) ( not ( = ?auto_22731 ?auto_22737 ) ) ( not ( = ?auto_22719 ?auto_22739 ) ) ( not ( = ?auto_22719 ?auto_22725 ) ) ( not ( = ?auto_22719 ?auto_22730 ) ) ( not ( = ?auto_22719 ?auto_22736 ) ) ( not ( = ?auto_22719 ?auto_22734 ) ) ( not ( = ?auto_22719 ?auto_22727 ) ) ( not ( = ?auto_22716 ?auto_22741 ) ) ( not ( = ?auto_22716 ?auto_22723 ) ) ( not ( = ?auto_22716 ?auto_22720 ) ) ( not ( = ?auto_22716 ?auto_22722 ) ) ( not ( = ?auto_22716 ?auto_22733 ) ) ( not ( = ?auto_22716 ?auto_22717 ) ) ( not ( = ?auto_22716 ?auto_22724 ) ) ( not ( = ?auto_22716 ?auto_22718 ) ) ( not ( = ?auto_22716 ?auto_22732 ) ) ( not ( = ?auto_22716 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22708 ) ) ( not ( = ?auto_22696 ?auto_22735 ) ) ( not ( = ?auto_22697 ?auto_22708 ) ) ( not ( = ?auto_22697 ?auto_22735 ) ) ( not ( = ?auto_22698 ?auto_22708 ) ) ( not ( = ?auto_22698 ?auto_22735 ) ) ( not ( = ?auto_22699 ?auto_22708 ) ) ( not ( = ?auto_22699 ?auto_22735 ) ) ( not ( = ?auto_22700 ?auto_22708 ) ) ( not ( = ?auto_22700 ?auto_22735 ) ) ( not ( = ?auto_22701 ?auto_22708 ) ) ( not ( = ?auto_22701 ?auto_22735 ) ) ( not ( = ?auto_22702 ?auto_22708 ) ) ( not ( = ?auto_22702 ?auto_22735 ) ) ( not ( = ?auto_22703 ?auto_22708 ) ) ( not ( = ?auto_22703 ?auto_22735 ) ) ( not ( = ?auto_22704 ?auto_22708 ) ) ( not ( = ?auto_22704 ?auto_22735 ) ) ( not ( = ?auto_22705 ?auto_22708 ) ) ( not ( = ?auto_22705 ?auto_22735 ) ) ( not ( = ?auto_22706 ?auto_22708 ) ) ( not ( = ?auto_22706 ?auto_22735 ) ) ( not ( = ?auto_22708 ?auto_22716 ) ) ( not ( = ?auto_22708 ?auto_22741 ) ) ( not ( = ?auto_22708 ?auto_22723 ) ) ( not ( = ?auto_22708 ?auto_22720 ) ) ( not ( = ?auto_22708 ?auto_22722 ) ) ( not ( = ?auto_22708 ?auto_22733 ) ) ( not ( = ?auto_22708 ?auto_22717 ) ) ( not ( = ?auto_22708 ?auto_22724 ) ) ( not ( = ?auto_22708 ?auto_22718 ) ) ( not ( = ?auto_22708 ?auto_22732 ) ) ( not ( = ?auto_22708 ?auto_22726 ) ) ( not ( = ?auto_22735 ?auto_22716 ) ) ( not ( = ?auto_22735 ?auto_22741 ) ) ( not ( = ?auto_22735 ?auto_22723 ) ) ( not ( = ?auto_22735 ?auto_22720 ) ) ( not ( = ?auto_22735 ?auto_22722 ) ) ( not ( = ?auto_22735 ?auto_22733 ) ) ( not ( = ?auto_22735 ?auto_22717 ) ) ( not ( = ?auto_22735 ?auto_22724 ) ) ( not ( = ?auto_22735 ?auto_22718 ) ) ( not ( = ?auto_22735 ?auto_22732 ) ) ( not ( = ?auto_22735 ?auto_22726 ) ) ( not ( = ?auto_22696 ?auto_22709 ) ) ( not ( = ?auto_22696 ?auto_22712 ) ) ( not ( = ?auto_22697 ?auto_22709 ) ) ( not ( = ?auto_22697 ?auto_22712 ) ) ( not ( = ?auto_22698 ?auto_22709 ) ) ( not ( = ?auto_22698 ?auto_22712 ) ) ( not ( = ?auto_22699 ?auto_22709 ) ) ( not ( = ?auto_22699 ?auto_22712 ) ) ( not ( = ?auto_22700 ?auto_22709 ) ) ( not ( = ?auto_22700 ?auto_22712 ) ) ( not ( = ?auto_22701 ?auto_22709 ) ) ( not ( = ?auto_22701 ?auto_22712 ) ) ( not ( = ?auto_22702 ?auto_22709 ) ) ( not ( = ?auto_22702 ?auto_22712 ) ) ( not ( = ?auto_22703 ?auto_22709 ) ) ( not ( = ?auto_22703 ?auto_22712 ) ) ( not ( = ?auto_22704 ?auto_22709 ) ) ( not ( = ?auto_22704 ?auto_22712 ) ) ( not ( = ?auto_22705 ?auto_22709 ) ) ( not ( = ?auto_22705 ?auto_22712 ) ) ( not ( = ?auto_22706 ?auto_22709 ) ) ( not ( = ?auto_22706 ?auto_22712 ) ) ( not ( = ?auto_22707 ?auto_22709 ) ) ( not ( = ?auto_22707 ?auto_22712 ) ) ( not ( = ?auto_22709 ?auto_22735 ) ) ( not ( = ?auto_22709 ?auto_22716 ) ) ( not ( = ?auto_22709 ?auto_22741 ) ) ( not ( = ?auto_22709 ?auto_22723 ) ) ( not ( = ?auto_22709 ?auto_22720 ) ) ( not ( = ?auto_22709 ?auto_22722 ) ) ( not ( = ?auto_22709 ?auto_22733 ) ) ( not ( = ?auto_22709 ?auto_22717 ) ) ( not ( = ?auto_22709 ?auto_22724 ) ) ( not ( = ?auto_22709 ?auto_22718 ) ) ( not ( = ?auto_22709 ?auto_22732 ) ) ( not ( = ?auto_22709 ?auto_22726 ) ) ( not ( = ?auto_22711 ?auto_22738 ) ) ( not ( = ?auto_22711 ?auto_22731 ) ) ( not ( = ?auto_22711 ?auto_22728 ) ) ( not ( = ?auto_22711 ?auto_22721 ) ) ( not ( = ?auto_22711 ?auto_22729 ) ) ( not ( = ?auto_22711 ?auto_22740 ) ) ( not ( = ?auto_22711 ?auto_22737 ) ) ( not ( = ?auto_22710 ?auto_22730 ) ) ( not ( = ?auto_22710 ?auto_22719 ) ) ( not ( = ?auto_22710 ?auto_22739 ) ) ( not ( = ?auto_22710 ?auto_22725 ) ) ( not ( = ?auto_22710 ?auto_22736 ) ) ( not ( = ?auto_22710 ?auto_22734 ) ) ( not ( = ?auto_22710 ?auto_22727 ) ) ( not ( = ?auto_22712 ?auto_22735 ) ) ( not ( = ?auto_22712 ?auto_22716 ) ) ( not ( = ?auto_22712 ?auto_22741 ) ) ( not ( = ?auto_22712 ?auto_22723 ) ) ( not ( = ?auto_22712 ?auto_22720 ) ) ( not ( = ?auto_22712 ?auto_22722 ) ) ( not ( = ?auto_22712 ?auto_22733 ) ) ( not ( = ?auto_22712 ?auto_22717 ) ) ( not ( = ?auto_22712 ?auto_22724 ) ) ( not ( = ?auto_22712 ?auto_22718 ) ) ( not ( = ?auto_22712 ?auto_22732 ) ) ( not ( = ?auto_22712 ?auto_22726 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_22696 ?auto_22697 ?auto_22698 ?auto_22699 ?auto_22700 ?auto_22701 ?auto_22702 ?auto_22703 ?auto_22704 ?auto_22705 ?auto_22706 ?auto_22707 ?auto_22708 )
      ( MAKE-1CRATE ?auto_22708 ?auto_22709 )
      ( MAKE-13CRATE-VERIFY ?auto_22696 ?auto_22697 ?auto_22698 ?auto_22699 ?auto_22700 ?auto_22701 ?auto_22702 ?auto_22703 ?auto_22704 ?auto_22705 ?auto_22706 ?auto_22707 ?auto_22708 ?auto_22709 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
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
      ?auto_22778 - SURFACE
      ?auto_22779 - SURFACE
      ?auto_22781 - SURFACE
      ?auto_22780 - SURFACE
    )
    :vars
    (
      ?auto_22786 - HOIST
      ?auto_22783 - PLACE
      ?auto_22784 - PLACE
      ?auto_22785 - HOIST
      ?auto_22782 - SURFACE
      ?auto_22813 - PLACE
      ?auto_22795 - HOIST
      ?auto_22800 - SURFACE
      ?auto_22812 - PLACE
      ?auto_22788 - HOIST
      ?auto_22808 - SURFACE
      ?auto_22811 - PLACE
      ?auto_22801 - HOIST
      ?auto_22790 - SURFACE
      ?auto_22804 - PLACE
      ?auto_22809 - HOIST
      ?auto_22791 - SURFACE
      ?auto_22805 - SURFACE
      ?auto_22806 - SURFACE
      ?auto_22814 - PLACE
      ?auto_22799 - HOIST
      ?auto_22796 - SURFACE
      ?auto_22803 - PLACE
      ?auto_22802 - HOIST
      ?auto_22807 - SURFACE
      ?auto_22789 - PLACE
      ?auto_22792 - HOIST
      ?auto_22794 - SURFACE
      ?auto_22810 - SURFACE
      ?auto_22793 - SURFACE
      ?auto_22797 - SURFACE
      ?auto_22798 - SURFACE
      ?auto_22787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22786 ?auto_22783 ) ( IS-CRATE ?auto_22780 ) ( not ( = ?auto_22784 ?auto_22783 ) ) ( HOIST-AT ?auto_22785 ?auto_22784 ) ( SURFACE-AT ?auto_22780 ?auto_22784 ) ( ON ?auto_22780 ?auto_22782 ) ( CLEAR ?auto_22780 ) ( not ( = ?auto_22781 ?auto_22780 ) ) ( not ( = ?auto_22781 ?auto_22782 ) ) ( not ( = ?auto_22780 ?auto_22782 ) ) ( not ( = ?auto_22786 ?auto_22785 ) ) ( IS-CRATE ?auto_22781 ) ( not ( = ?auto_22813 ?auto_22783 ) ) ( HOIST-AT ?auto_22795 ?auto_22813 ) ( AVAILABLE ?auto_22795 ) ( SURFACE-AT ?auto_22781 ?auto_22813 ) ( ON ?auto_22781 ?auto_22800 ) ( CLEAR ?auto_22781 ) ( not ( = ?auto_22779 ?auto_22781 ) ) ( not ( = ?auto_22779 ?auto_22800 ) ) ( not ( = ?auto_22781 ?auto_22800 ) ) ( not ( = ?auto_22786 ?auto_22795 ) ) ( IS-CRATE ?auto_22779 ) ( not ( = ?auto_22812 ?auto_22783 ) ) ( HOIST-AT ?auto_22788 ?auto_22812 ) ( SURFACE-AT ?auto_22779 ?auto_22812 ) ( ON ?auto_22779 ?auto_22808 ) ( CLEAR ?auto_22779 ) ( not ( = ?auto_22778 ?auto_22779 ) ) ( not ( = ?auto_22778 ?auto_22808 ) ) ( not ( = ?auto_22779 ?auto_22808 ) ) ( not ( = ?auto_22786 ?auto_22788 ) ) ( IS-CRATE ?auto_22778 ) ( not ( = ?auto_22811 ?auto_22783 ) ) ( HOIST-AT ?auto_22801 ?auto_22811 ) ( AVAILABLE ?auto_22801 ) ( SURFACE-AT ?auto_22778 ?auto_22811 ) ( ON ?auto_22778 ?auto_22790 ) ( CLEAR ?auto_22778 ) ( not ( = ?auto_22777 ?auto_22778 ) ) ( not ( = ?auto_22777 ?auto_22790 ) ) ( not ( = ?auto_22778 ?auto_22790 ) ) ( not ( = ?auto_22786 ?auto_22801 ) ) ( IS-CRATE ?auto_22777 ) ( not ( = ?auto_22804 ?auto_22783 ) ) ( HOIST-AT ?auto_22809 ?auto_22804 ) ( SURFACE-AT ?auto_22777 ?auto_22804 ) ( ON ?auto_22777 ?auto_22791 ) ( CLEAR ?auto_22777 ) ( not ( = ?auto_22776 ?auto_22777 ) ) ( not ( = ?auto_22776 ?auto_22791 ) ) ( not ( = ?auto_22777 ?auto_22791 ) ) ( not ( = ?auto_22786 ?auto_22809 ) ) ( IS-CRATE ?auto_22776 ) ( AVAILABLE ?auto_22785 ) ( SURFACE-AT ?auto_22776 ?auto_22784 ) ( ON ?auto_22776 ?auto_22805 ) ( CLEAR ?auto_22776 ) ( not ( = ?auto_22775 ?auto_22776 ) ) ( not ( = ?auto_22775 ?auto_22805 ) ) ( not ( = ?auto_22776 ?auto_22805 ) ) ( IS-CRATE ?auto_22775 ) ( SURFACE-AT ?auto_22775 ?auto_22812 ) ( ON ?auto_22775 ?auto_22806 ) ( CLEAR ?auto_22775 ) ( not ( = ?auto_22774 ?auto_22775 ) ) ( not ( = ?auto_22774 ?auto_22806 ) ) ( not ( = ?auto_22775 ?auto_22806 ) ) ( IS-CRATE ?auto_22774 ) ( not ( = ?auto_22814 ?auto_22783 ) ) ( HOIST-AT ?auto_22799 ?auto_22814 ) ( AVAILABLE ?auto_22799 ) ( SURFACE-AT ?auto_22774 ?auto_22814 ) ( ON ?auto_22774 ?auto_22796 ) ( CLEAR ?auto_22774 ) ( not ( = ?auto_22773 ?auto_22774 ) ) ( not ( = ?auto_22773 ?auto_22796 ) ) ( not ( = ?auto_22774 ?auto_22796 ) ) ( not ( = ?auto_22786 ?auto_22799 ) ) ( IS-CRATE ?auto_22773 ) ( not ( = ?auto_22803 ?auto_22783 ) ) ( HOIST-AT ?auto_22802 ?auto_22803 ) ( AVAILABLE ?auto_22802 ) ( SURFACE-AT ?auto_22773 ?auto_22803 ) ( ON ?auto_22773 ?auto_22807 ) ( CLEAR ?auto_22773 ) ( not ( = ?auto_22772 ?auto_22773 ) ) ( not ( = ?auto_22772 ?auto_22807 ) ) ( not ( = ?auto_22773 ?auto_22807 ) ) ( not ( = ?auto_22786 ?auto_22802 ) ) ( IS-CRATE ?auto_22772 ) ( not ( = ?auto_22789 ?auto_22783 ) ) ( HOIST-AT ?auto_22792 ?auto_22789 ) ( SURFACE-AT ?auto_22772 ?auto_22789 ) ( ON ?auto_22772 ?auto_22794 ) ( CLEAR ?auto_22772 ) ( not ( = ?auto_22771 ?auto_22772 ) ) ( not ( = ?auto_22771 ?auto_22794 ) ) ( not ( = ?auto_22772 ?auto_22794 ) ) ( not ( = ?auto_22786 ?auto_22792 ) ) ( IS-CRATE ?auto_22771 ) ( AVAILABLE ?auto_22792 ) ( SURFACE-AT ?auto_22771 ?auto_22789 ) ( ON ?auto_22771 ?auto_22810 ) ( CLEAR ?auto_22771 ) ( not ( = ?auto_22770 ?auto_22771 ) ) ( not ( = ?auto_22770 ?auto_22810 ) ) ( not ( = ?auto_22771 ?auto_22810 ) ) ( IS-CRATE ?auto_22770 ) ( AVAILABLE ?auto_22809 ) ( SURFACE-AT ?auto_22770 ?auto_22804 ) ( ON ?auto_22770 ?auto_22793 ) ( CLEAR ?auto_22770 ) ( not ( = ?auto_22769 ?auto_22770 ) ) ( not ( = ?auto_22769 ?auto_22793 ) ) ( not ( = ?auto_22770 ?auto_22793 ) ) ( IS-CRATE ?auto_22769 ) ( SURFACE-AT ?auto_22769 ?auto_22812 ) ( ON ?auto_22769 ?auto_22797 ) ( CLEAR ?auto_22769 ) ( not ( = ?auto_22768 ?auto_22769 ) ) ( not ( = ?auto_22768 ?auto_22797 ) ) ( not ( = ?auto_22769 ?auto_22797 ) ) ( SURFACE-AT ?auto_22767 ?auto_22783 ) ( CLEAR ?auto_22767 ) ( IS-CRATE ?auto_22768 ) ( AVAILABLE ?auto_22786 ) ( AVAILABLE ?auto_22788 ) ( SURFACE-AT ?auto_22768 ?auto_22812 ) ( ON ?auto_22768 ?auto_22798 ) ( CLEAR ?auto_22768 ) ( TRUCK-AT ?auto_22787 ?auto_22783 ) ( not ( = ?auto_22767 ?auto_22768 ) ) ( not ( = ?auto_22767 ?auto_22798 ) ) ( not ( = ?auto_22768 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22769 ) ) ( not ( = ?auto_22767 ?auto_22797 ) ) ( not ( = ?auto_22769 ?auto_22798 ) ) ( not ( = ?auto_22797 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22770 ) ) ( not ( = ?auto_22767 ?auto_22793 ) ) ( not ( = ?auto_22768 ?auto_22770 ) ) ( not ( = ?auto_22768 ?auto_22793 ) ) ( not ( = ?auto_22770 ?auto_22797 ) ) ( not ( = ?auto_22770 ?auto_22798 ) ) ( not ( = ?auto_22804 ?auto_22812 ) ) ( not ( = ?auto_22809 ?auto_22788 ) ) ( not ( = ?auto_22793 ?auto_22797 ) ) ( not ( = ?auto_22793 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22771 ) ) ( not ( = ?auto_22767 ?auto_22810 ) ) ( not ( = ?auto_22768 ?auto_22771 ) ) ( not ( = ?auto_22768 ?auto_22810 ) ) ( not ( = ?auto_22769 ?auto_22771 ) ) ( not ( = ?auto_22769 ?auto_22810 ) ) ( not ( = ?auto_22771 ?auto_22793 ) ) ( not ( = ?auto_22771 ?auto_22797 ) ) ( not ( = ?auto_22771 ?auto_22798 ) ) ( not ( = ?auto_22789 ?auto_22804 ) ) ( not ( = ?auto_22789 ?auto_22812 ) ) ( not ( = ?auto_22792 ?auto_22809 ) ) ( not ( = ?auto_22792 ?auto_22788 ) ) ( not ( = ?auto_22810 ?auto_22793 ) ) ( not ( = ?auto_22810 ?auto_22797 ) ) ( not ( = ?auto_22810 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22772 ) ) ( not ( = ?auto_22767 ?auto_22794 ) ) ( not ( = ?auto_22768 ?auto_22772 ) ) ( not ( = ?auto_22768 ?auto_22794 ) ) ( not ( = ?auto_22769 ?auto_22772 ) ) ( not ( = ?auto_22769 ?auto_22794 ) ) ( not ( = ?auto_22770 ?auto_22772 ) ) ( not ( = ?auto_22770 ?auto_22794 ) ) ( not ( = ?auto_22772 ?auto_22810 ) ) ( not ( = ?auto_22772 ?auto_22793 ) ) ( not ( = ?auto_22772 ?auto_22797 ) ) ( not ( = ?auto_22772 ?auto_22798 ) ) ( not ( = ?auto_22794 ?auto_22810 ) ) ( not ( = ?auto_22794 ?auto_22793 ) ) ( not ( = ?auto_22794 ?auto_22797 ) ) ( not ( = ?auto_22794 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22773 ) ) ( not ( = ?auto_22767 ?auto_22807 ) ) ( not ( = ?auto_22768 ?auto_22773 ) ) ( not ( = ?auto_22768 ?auto_22807 ) ) ( not ( = ?auto_22769 ?auto_22773 ) ) ( not ( = ?auto_22769 ?auto_22807 ) ) ( not ( = ?auto_22770 ?auto_22773 ) ) ( not ( = ?auto_22770 ?auto_22807 ) ) ( not ( = ?auto_22771 ?auto_22773 ) ) ( not ( = ?auto_22771 ?auto_22807 ) ) ( not ( = ?auto_22773 ?auto_22794 ) ) ( not ( = ?auto_22773 ?auto_22810 ) ) ( not ( = ?auto_22773 ?auto_22793 ) ) ( not ( = ?auto_22773 ?auto_22797 ) ) ( not ( = ?auto_22773 ?auto_22798 ) ) ( not ( = ?auto_22803 ?auto_22789 ) ) ( not ( = ?auto_22803 ?auto_22804 ) ) ( not ( = ?auto_22803 ?auto_22812 ) ) ( not ( = ?auto_22802 ?auto_22792 ) ) ( not ( = ?auto_22802 ?auto_22809 ) ) ( not ( = ?auto_22802 ?auto_22788 ) ) ( not ( = ?auto_22807 ?auto_22794 ) ) ( not ( = ?auto_22807 ?auto_22810 ) ) ( not ( = ?auto_22807 ?auto_22793 ) ) ( not ( = ?auto_22807 ?auto_22797 ) ) ( not ( = ?auto_22807 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22774 ) ) ( not ( = ?auto_22767 ?auto_22796 ) ) ( not ( = ?auto_22768 ?auto_22774 ) ) ( not ( = ?auto_22768 ?auto_22796 ) ) ( not ( = ?auto_22769 ?auto_22774 ) ) ( not ( = ?auto_22769 ?auto_22796 ) ) ( not ( = ?auto_22770 ?auto_22774 ) ) ( not ( = ?auto_22770 ?auto_22796 ) ) ( not ( = ?auto_22771 ?auto_22774 ) ) ( not ( = ?auto_22771 ?auto_22796 ) ) ( not ( = ?auto_22772 ?auto_22774 ) ) ( not ( = ?auto_22772 ?auto_22796 ) ) ( not ( = ?auto_22774 ?auto_22807 ) ) ( not ( = ?auto_22774 ?auto_22794 ) ) ( not ( = ?auto_22774 ?auto_22810 ) ) ( not ( = ?auto_22774 ?auto_22793 ) ) ( not ( = ?auto_22774 ?auto_22797 ) ) ( not ( = ?auto_22774 ?auto_22798 ) ) ( not ( = ?auto_22814 ?auto_22803 ) ) ( not ( = ?auto_22814 ?auto_22789 ) ) ( not ( = ?auto_22814 ?auto_22804 ) ) ( not ( = ?auto_22814 ?auto_22812 ) ) ( not ( = ?auto_22799 ?auto_22802 ) ) ( not ( = ?auto_22799 ?auto_22792 ) ) ( not ( = ?auto_22799 ?auto_22809 ) ) ( not ( = ?auto_22799 ?auto_22788 ) ) ( not ( = ?auto_22796 ?auto_22807 ) ) ( not ( = ?auto_22796 ?auto_22794 ) ) ( not ( = ?auto_22796 ?auto_22810 ) ) ( not ( = ?auto_22796 ?auto_22793 ) ) ( not ( = ?auto_22796 ?auto_22797 ) ) ( not ( = ?auto_22796 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22775 ) ) ( not ( = ?auto_22767 ?auto_22806 ) ) ( not ( = ?auto_22768 ?auto_22775 ) ) ( not ( = ?auto_22768 ?auto_22806 ) ) ( not ( = ?auto_22769 ?auto_22775 ) ) ( not ( = ?auto_22769 ?auto_22806 ) ) ( not ( = ?auto_22770 ?auto_22775 ) ) ( not ( = ?auto_22770 ?auto_22806 ) ) ( not ( = ?auto_22771 ?auto_22775 ) ) ( not ( = ?auto_22771 ?auto_22806 ) ) ( not ( = ?auto_22772 ?auto_22775 ) ) ( not ( = ?auto_22772 ?auto_22806 ) ) ( not ( = ?auto_22773 ?auto_22775 ) ) ( not ( = ?auto_22773 ?auto_22806 ) ) ( not ( = ?auto_22775 ?auto_22796 ) ) ( not ( = ?auto_22775 ?auto_22807 ) ) ( not ( = ?auto_22775 ?auto_22794 ) ) ( not ( = ?auto_22775 ?auto_22810 ) ) ( not ( = ?auto_22775 ?auto_22793 ) ) ( not ( = ?auto_22775 ?auto_22797 ) ) ( not ( = ?auto_22775 ?auto_22798 ) ) ( not ( = ?auto_22806 ?auto_22796 ) ) ( not ( = ?auto_22806 ?auto_22807 ) ) ( not ( = ?auto_22806 ?auto_22794 ) ) ( not ( = ?auto_22806 ?auto_22810 ) ) ( not ( = ?auto_22806 ?auto_22793 ) ) ( not ( = ?auto_22806 ?auto_22797 ) ) ( not ( = ?auto_22806 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22776 ) ) ( not ( = ?auto_22767 ?auto_22805 ) ) ( not ( = ?auto_22768 ?auto_22776 ) ) ( not ( = ?auto_22768 ?auto_22805 ) ) ( not ( = ?auto_22769 ?auto_22776 ) ) ( not ( = ?auto_22769 ?auto_22805 ) ) ( not ( = ?auto_22770 ?auto_22776 ) ) ( not ( = ?auto_22770 ?auto_22805 ) ) ( not ( = ?auto_22771 ?auto_22776 ) ) ( not ( = ?auto_22771 ?auto_22805 ) ) ( not ( = ?auto_22772 ?auto_22776 ) ) ( not ( = ?auto_22772 ?auto_22805 ) ) ( not ( = ?auto_22773 ?auto_22776 ) ) ( not ( = ?auto_22773 ?auto_22805 ) ) ( not ( = ?auto_22774 ?auto_22776 ) ) ( not ( = ?auto_22774 ?auto_22805 ) ) ( not ( = ?auto_22776 ?auto_22806 ) ) ( not ( = ?auto_22776 ?auto_22796 ) ) ( not ( = ?auto_22776 ?auto_22807 ) ) ( not ( = ?auto_22776 ?auto_22794 ) ) ( not ( = ?auto_22776 ?auto_22810 ) ) ( not ( = ?auto_22776 ?auto_22793 ) ) ( not ( = ?auto_22776 ?auto_22797 ) ) ( not ( = ?auto_22776 ?auto_22798 ) ) ( not ( = ?auto_22784 ?auto_22812 ) ) ( not ( = ?auto_22784 ?auto_22814 ) ) ( not ( = ?auto_22784 ?auto_22803 ) ) ( not ( = ?auto_22784 ?auto_22789 ) ) ( not ( = ?auto_22784 ?auto_22804 ) ) ( not ( = ?auto_22785 ?auto_22788 ) ) ( not ( = ?auto_22785 ?auto_22799 ) ) ( not ( = ?auto_22785 ?auto_22802 ) ) ( not ( = ?auto_22785 ?auto_22792 ) ) ( not ( = ?auto_22785 ?auto_22809 ) ) ( not ( = ?auto_22805 ?auto_22806 ) ) ( not ( = ?auto_22805 ?auto_22796 ) ) ( not ( = ?auto_22805 ?auto_22807 ) ) ( not ( = ?auto_22805 ?auto_22794 ) ) ( not ( = ?auto_22805 ?auto_22810 ) ) ( not ( = ?auto_22805 ?auto_22793 ) ) ( not ( = ?auto_22805 ?auto_22797 ) ) ( not ( = ?auto_22805 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22777 ) ) ( not ( = ?auto_22767 ?auto_22791 ) ) ( not ( = ?auto_22768 ?auto_22777 ) ) ( not ( = ?auto_22768 ?auto_22791 ) ) ( not ( = ?auto_22769 ?auto_22777 ) ) ( not ( = ?auto_22769 ?auto_22791 ) ) ( not ( = ?auto_22770 ?auto_22777 ) ) ( not ( = ?auto_22770 ?auto_22791 ) ) ( not ( = ?auto_22771 ?auto_22777 ) ) ( not ( = ?auto_22771 ?auto_22791 ) ) ( not ( = ?auto_22772 ?auto_22777 ) ) ( not ( = ?auto_22772 ?auto_22791 ) ) ( not ( = ?auto_22773 ?auto_22777 ) ) ( not ( = ?auto_22773 ?auto_22791 ) ) ( not ( = ?auto_22774 ?auto_22777 ) ) ( not ( = ?auto_22774 ?auto_22791 ) ) ( not ( = ?auto_22775 ?auto_22777 ) ) ( not ( = ?auto_22775 ?auto_22791 ) ) ( not ( = ?auto_22777 ?auto_22805 ) ) ( not ( = ?auto_22777 ?auto_22806 ) ) ( not ( = ?auto_22777 ?auto_22796 ) ) ( not ( = ?auto_22777 ?auto_22807 ) ) ( not ( = ?auto_22777 ?auto_22794 ) ) ( not ( = ?auto_22777 ?auto_22810 ) ) ( not ( = ?auto_22777 ?auto_22793 ) ) ( not ( = ?auto_22777 ?auto_22797 ) ) ( not ( = ?auto_22777 ?auto_22798 ) ) ( not ( = ?auto_22791 ?auto_22805 ) ) ( not ( = ?auto_22791 ?auto_22806 ) ) ( not ( = ?auto_22791 ?auto_22796 ) ) ( not ( = ?auto_22791 ?auto_22807 ) ) ( not ( = ?auto_22791 ?auto_22794 ) ) ( not ( = ?auto_22791 ?auto_22810 ) ) ( not ( = ?auto_22791 ?auto_22793 ) ) ( not ( = ?auto_22791 ?auto_22797 ) ) ( not ( = ?auto_22791 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22778 ) ) ( not ( = ?auto_22767 ?auto_22790 ) ) ( not ( = ?auto_22768 ?auto_22778 ) ) ( not ( = ?auto_22768 ?auto_22790 ) ) ( not ( = ?auto_22769 ?auto_22778 ) ) ( not ( = ?auto_22769 ?auto_22790 ) ) ( not ( = ?auto_22770 ?auto_22778 ) ) ( not ( = ?auto_22770 ?auto_22790 ) ) ( not ( = ?auto_22771 ?auto_22778 ) ) ( not ( = ?auto_22771 ?auto_22790 ) ) ( not ( = ?auto_22772 ?auto_22778 ) ) ( not ( = ?auto_22772 ?auto_22790 ) ) ( not ( = ?auto_22773 ?auto_22778 ) ) ( not ( = ?auto_22773 ?auto_22790 ) ) ( not ( = ?auto_22774 ?auto_22778 ) ) ( not ( = ?auto_22774 ?auto_22790 ) ) ( not ( = ?auto_22775 ?auto_22778 ) ) ( not ( = ?auto_22775 ?auto_22790 ) ) ( not ( = ?auto_22776 ?auto_22778 ) ) ( not ( = ?auto_22776 ?auto_22790 ) ) ( not ( = ?auto_22778 ?auto_22791 ) ) ( not ( = ?auto_22778 ?auto_22805 ) ) ( not ( = ?auto_22778 ?auto_22806 ) ) ( not ( = ?auto_22778 ?auto_22796 ) ) ( not ( = ?auto_22778 ?auto_22807 ) ) ( not ( = ?auto_22778 ?auto_22794 ) ) ( not ( = ?auto_22778 ?auto_22810 ) ) ( not ( = ?auto_22778 ?auto_22793 ) ) ( not ( = ?auto_22778 ?auto_22797 ) ) ( not ( = ?auto_22778 ?auto_22798 ) ) ( not ( = ?auto_22811 ?auto_22804 ) ) ( not ( = ?auto_22811 ?auto_22784 ) ) ( not ( = ?auto_22811 ?auto_22812 ) ) ( not ( = ?auto_22811 ?auto_22814 ) ) ( not ( = ?auto_22811 ?auto_22803 ) ) ( not ( = ?auto_22811 ?auto_22789 ) ) ( not ( = ?auto_22801 ?auto_22809 ) ) ( not ( = ?auto_22801 ?auto_22785 ) ) ( not ( = ?auto_22801 ?auto_22788 ) ) ( not ( = ?auto_22801 ?auto_22799 ) ) ( not ( = ?auto_22801 ?auto_22802 ) ) ( not ( = ?auto_22801 ?auto_22792 ) ) ( not ( = ?auto_22790 ?auto_22791 ) ) ( not ( = ?auto_22790 ?auto_22805 ) ) ( not ( = ?auto_22790 ?auto_22806 ) ) ( not ( = ?auto_22790 ?auto_22796 ) ) ( not ( = ?auto_22790 ?auto_22807 ) ) ( not ( = ?auto_22790 ?auto_22794 ) ) ( not ( = ?auto_22790 ?auto_22810 ) ) ( not ( = ?auto_22790 ?auto_22793 ) ) ( not ( = ?auto_22790 ?auto_22797 ) ) ( not ( = ?auto_22790 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22779 ) ) ( not ( = ?auto_22767 ?auto_22808 ) ) ( not ( = ?auto_22768 ?auto_22779 ) ) ( not ( = ?auto_22768 ?auto_22808 ) ) ( not ( = ?auto_22769 ?auto_22779 ) ) ( not ( = ?auto_22769 ?auto_22808 ) ) ( not ( = ?auto_22770 ?auto_22779 ) ) ( not ( = ?auto_22770 ?auto_22808 ) ) ( not ( = ?auto_22771 ?auto_22779 ) ) ( not ( = ?auto_22771 ?auto_22808 ) ) ( not ( = ?auto_22772 ?auto_22779 ) ) ( not ( = ?auto_22772 ?auto_22808 ) ) ( not ( = ?auto_22773 ?auto_22779 ) ) ( not ( = ?auto_22773 ?auto_22808 ) ) ( not ( = ?auto_22774 ?auto_22779 ) ) ( not ( = ?auto_22774 ?auto_22808 ) ) ( not ( = ?auto_22775 ?auto_22779 ) ) ( not ( = ?auto_22775 ?auto_22808 ) ) ( not ( = ?auto_22776 ?auto_22779 ) ) ( not ( = ?auto_22776 ?auto_22808 ) ) ( not ( = ?auto_22777 ?auto_22779 ) ) ( not ( = ?auto_22777 ?auto_22808 ) ) ( not ( = ?auto_22779 ?auto_22790 ) ) ( not ( = ?auto_22779 ?auto_22791 ) ) ( not ( = ?auto_22779 ?auto_22805 ) ) ( not ( = ?auto_22779 ?auto_22806 ) ) ( not ( = ?auto_22779 ?auto_22796 ) ) ( not ( = ?auto_22779 ?auto_22807 ) ) ( not ( = ?auto_22779 ?auto_22794 ) ) ( not ( = ?auto_22779 ?auto_22810 ) ) ( not ( = ?auto_22779 ?auto_22793 ) ) ( not ( = ?auto_22779 ?auto_22797 ) ) ( not ( = ?auto_22779 ?auto_22798 ) ) ( not ( = ?auto_22808 ?auto_22790 ) ) ( not ( = ?auto_22808 ?auto_22791 ) ) ( not ( = ?auto_22808 ?auto_22805 ) ) ( not ( = ?auto_22808 ?auto_22806 ) ) ( not ( = ?auto_22808 ?auto_22796 ) ) ( not ( = ?auto_22808 ?auto_22807 ) ) ( not ( = ?auto_22808 ?auto_22794 ) ) ( not ( = ?auto_22808 ?auto_22810 ) ) ( not ( = ?auto_22808 ?auto_22793 ) ) ( not ( = ?auto_22808 ?auto_22797 ) ) ( not ( = ?auto_22808 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22781 ) ) ( not ( = ?auto_22767 ?auto_22800 ) ) ( not ( = ?auto_22768 ?auto_22781 ) ) ( not ( = ?auto_22768 ?auto_22800 ) ) ( not ( = ?auto_22769 ?auto_22781 ) ) ( not ( = ?auto_22769 ?auto_22800 ) ) ( not ( = ?auto_22770 ?auto_22781 ) ) ( not ( = ?auto_22770 ?auto_22800 ) ) ( not ( = ?auto_22771 ?auto_22781 ) ) ( not ( = ?auto_22771 ?auto_22800 ) ) ( not ( = ?auto_22772 ?auto_22781 ) ) ( not ( = ?auto_22772 ?auto_22800 ) ) ( not ( = ?auto_22773 ?auto_22781 ) ) ( not ( = ?auto_22773 ?auto_22800 ) ) ( not ( = ?auto_22774 ?auto_22781 ) ) ( not ( = ?auto_22774 ?auto_22800 ) ) ( not ( = ?auto_22775 ?auto_22781 ) ) ( not ( = ?auto_22775 ?auto_22800 ) ) ( not ( = ?auto_22776 ?auto_22781 ) ) ( not ( = ?auto_22776 ?auto_22800 ) ) ( not ( = ?auto_22777 ?auto_22781 ) ) ( not ( = ?auto_22777 ?auto_22800 ) ) ( not ( = ?auto_22778 ?auto_22781 ) ) ( not ( = ?auto_22778 ?auto_22800 ) ) ( not ( = ?auto_22781 ?auto_22808 ) ) ( not ( = ?auto_22781 ?auto_22790 ) ) ( not ( = ?auto_22781 ?auto_22791 ) ) ( not ( = ?auto_22781 ?auto_22805 ) ) ( not ( = ?auto_22781 ?auto_22806 ) ) ( not ( = ?auto_22781 ?auto_22796 ) ) ( not ( = ?auto_22781 ?auto_22807 ) ) ( not ( = ?auto_22781 ?auto_22794 ) ) ( not ( = ?auto_22781 ?auto_22810 ) ) ( not ( = ?auto_22781 ?auto_22793 ) ) ( not ( = ?auto_22781 ?auto_22797 ) ) ( not ( = ?auto_22781 ?auto_22798 ) ) ( not ( = ?auto_22813 ?auto_22812 ) ) ( not ( = ?auto_22813 ?auto_22811 ) ) ( not ( = ?auto_22813 ?auto_22804 ) ) ( not ( = ?auto_22813 ?auto_22784 ) ) ( not ( = ?auto_22813 ?auto_22814 ) ) ( not ( = ?auto_22813 ?auto_22803 ) ) ( not ( = ?auto_22813 ?auto_22789 ) ) ( not ( = ?auto_22795 ?auto_22788 ) ) ( not ( = ?auto_22795 ?auto_22801 ) ) ( not ( = ?auto_22795 ?auto_22809 ) ) ( not ( = ?auto_22795 ?auto_22785 ) ) ( not ( = ?auto_22795 ?auto_22799 ) ) ( not ( = ?auto_22795 ?auto_22802 ) ) ( not ( = ?auto_22795 ?auto_22792 ) ) ( not ( = ?auto_22800 ?auto_22808 ) ) ( not ( = ?auto_22800 ?auto_22790 ) ) ( not ( = ?auto_22800 ?auto_22791 ) ) ( not ( = ?auto_22800 ?auto_22805 ) ) ( not ( = ?auto_22800 ?auto_22806 ) ) ( not ( = ?auto_22800 ?auto_22796 ) ) ( not ( = ?auto_22800 ?auto_22807 ) ) ( not ( = ?auto_22800 ?auto_22794 ) ) ( not ( = ?auto_22800 ?auto_22810 ) ) ( not ( = ?auto_22800 ?auto_22793 ) ) ( not ( = ?auto_22800 ?auto_22797 ) ) ( not ( = ?auto_22800 ?auto_22798 ) ) ( not ( = ?auto_22767 ?auto_22780 ) ) ( not ( = ?auto_22767 ?auto_22782 ) ) ( not ( = ?auto_22768 ?auto_22780 ) ) ( not ( = ?auto_22768 ?auto_22782 ) ) ( not ( = ?auto_22769 ?auto_22780 ) ) ( not ( = ?auto_22769 ?auto_22782 ) ) ( not ( = ?auto_22770 ?auto_22780 ) ) ( not ( = ?auto_22770 ?auto_22782 ) ) ( not ( = ?auto_22771 ?auto_22780 ) ) ( not ( = ?auto_22771 ?auto_22782 ) ) ( not ( = ?auto_22772 ?auto_22780 ) ) ( not ( = ?auto_22772 ?auto_22782 ) ) ( not ( = ?auto_22773 ?auto_22780 ) ) ( not ( = ?auto_22773 ?auto_22782 ) ) ( not ( = ?auto_22774 ?auto_22780 ) ) ( not ( = ?auto_22774 ?auto_22782 ) ) ( not ( = ?auto_22775 ?auto_22780 ) ) ( not ( = ?auto_22775 ?auto_22782 ) ) ( not ( = ?auto_22776 ?auto_22780 ) ) ( not ( = ?auto_22776 ?auto_22782 ) ) ( not ( = ?auto_22777 ?auto_22780 ) ) ( not ( = ?auto_22777 ?auto_22782 ) ) ( not ( = ?auto_22778 ?auto_22780 ) ) ( not ( = ?auto_22778 ?auto_22782 ) ) ( not ( = ?auto_22779 ?auto_22780 ) ) ( not ( = ?auto_22779 ?auto_22782 ) ) ( not ( = ?auto_22780 ?auto_22800 ) ) ( not ( = ?auto_22780 ?auto_22808 ) ) ( not ( = ?auto_22780 ?auto_22790 ) ) ( not ( = ?auto_22780 ?auto_22791 ) ) ( not ( = ?auto_22780 ?auto_22805 ) ) ( not ( = ?auto_22780 ?auto_22806 ) ) ( not ( = ?auto_22780 ?auto_22796 ) ) ( not ( = ?auto_22780 ?auto_22807 ) ) ( not ( = ?auto_22780 ?auto_22794 ) ) ( not ( = ?auto_22780 ?auto_22810 ) ) ( not ( = ?auto_22780 ?auto_22793 ) ) ( not ( = ?auto_22780 ?auto_22797 ) ) ( not ( = ?auto_22780 ?auto_22798 ) ) ( not ( = ?auto_22782 ?auto_22800 ) ) ( not ( = ?auto_22782 ?auto_22808 ) ) ( not ( = ?auto_22782 ?auto_22790 ) ) ( not ( = ?auto_22782 ?auto_22791 ) ) ( not ( = ?auto_22782 ?auto_22805 ) ) ( not ( = ?auto_22782 ?auto_22806 ) ) ( not ( = ?auto_22782 ?auto_22796 ) ) ( not ( = ?auto_22782 ?auto_22807 ) ) ( not ( = ?auto_22782 ?auto_22794 ) ) ( not ( = ?auto_22782 ?auto_22810 ) ) ( not ( = ?auto_22782 ?auto_22793 ) ) ( not ( = ?auto_22782 ?auto_22797 ) ) ( not ( = ?auto_22782 ?auto_22798 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_22767 ?auto_22768 ?auto_22769 ?auto_22770 ?auto_22771 ?auto_22772 ?auto_22773 ?auto_22774 ?auto_22775 ?auto_22776 ?auto_22777 ?auto_22778 ?auto_22779 ?auto_22781 )
      ( MAKE-1CRATE ?auto_22781 ?auto_22780 )
      ( MAKE-14CRATE-VERIFY ?auto_22767 ?auto_22768 ?auto_22769 ?auto_22770 ?auto_22771 ?auto_22772 ?auto_22773 ?auto_22774 ?auto_22775 ?auto_22776 ?auto_22777 ?auto_22778 ?auto_22779 ?auto_22781 ?auto_22780 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_22841 - SURFACE
      ?auto_22842 - SURFACE
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
      ?auto_22855 - SURFACE
      ?auto_22854 - SURFACE
      ?auto_22856 - SURFACE
    )
    :vars
    (
      ?auto_22860 - HOIST
      ?auto_22862 - PLACE
      ?auto_22857 - PLACE
      ?auto_22859 - HOIST
      ?auto_22858 - SURFACE
      ?auto_22886 - PLACE
      ?auto_22881 - HOIST
      ?auto_22871 - SURFACE
      ?auto_22864 - SURFACE
      ?auto_22872 - PLACE
      ?auto_22863 - HOIST
      ?auto_22870 - SURFACE
      ?auto_22865 - PLACE
      ?auto_22883 - HOIST
      ?auto_22875 - SURFACE
      ?auto_22887 - PLACE
      ?auto_22889 - HOIST
      ?auto_22866 - SURFACE
      ?auto_22882 - SURFACE
      ?auto_22880 - SURFACE
      ?auto_22888 - PLACE
      ?auto_22868 - HOIST
      ?auto_22878 - SURFACE
      ?auto_22873 - PLACE
      ?auto_22890 - HOIST
      ?auto_22885 - SURFACE
      ?auto_22867 - PLACE
      ?auto_22869 - HOIST
      ?auto_22877 - SURFACE
      ?auto_22874 - SURFACE
      ?auto_22884 - SURFACE
      ?auto_22876 - SURFACE
      ?auto_22879 - SURFACE
      ?auto_22861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22860 ?auto_22862 ) ( IS-CRATE ?auto_22856 ) ( not ( = ?auto_22857 ?auto_22862 ) ) ( HOIST-AT ?auto_22859 ?auto_22857 ) ( SURFACE-AT ?auto_22856 ?auto_22857 ) ( ON ?auto_22856 ?auto_22858 ) ( CLEAR ?auto_22856 ) ( not ( = ?auto_22854 ?auto_22856 ) ) ( not ( = ?auto_22854 ?auto_22858 ) ) ( not ( = ?auto_22856 ?auto_22858 ) ) ( not ( = ?auto_22860 ?auto_22859 ) ) ( IS-CRATE ?auto_22854 ) ( not ( = ?auto_22886 ?auto_22862 ) ) ( HOIST-AT ?auto_22881 ?auto_22886 ) ( SURFACE-AT ?auto_22854 ?auto_22886 ) ( ON ?auto_22854 ?auto_22871 ) ( CLEAR ?auto_22854 ) ( not ( = ?auto_22855 ?auto_22854 ) ) ( not ( = ?auto_22855 ?auto_22871 ) ) ( not ( = ?auto_22854 ?auto_22871 ) ) ( not ( = ?auto_22860 ?auto_22881 ) ) ( IS-CRATE ?auto_22855 ) ( AVAILABLE ?auto_22859 ) ( SURFACE-AT ?auto_22855 ?auto_22857 ) ( ON ?auto_22855 ?auto_22864 ) ( CLEAR ?auto_22855 ) ( not ( = ?auto_22853 ?auto_22855 ) ) ( not ( = ?auto_22853 ?auto_22864 ) ) ( not ( = ?auto_22855 ?auto_22864 ) ) ( IS-CRATE ?auto_22853 ) ( not ( = ?auto_22872 ?auto_22862 ) ) ( HOIST-AT ?auto_22863 ?auto_22872 ) ( SURFACE-AT ?auto_22853 ?auto_22872 ) ( ON ?auto_22853 ?auto_22870 ) ( CLEAR ?auto_22853 ) ( not ( = ?auto_22852 ?auto_22853 ) ) ( not ( = ?auto_22852 ?auto_22870 ) ) ( not ( = ?auto_22853 ?auto_22870 ) ) ( not ( = ?auto_22860 ?auto_22863 ) ) ( IS-CRATE ?auto_22852 ) ( not ( = ?auto_22865 ?auto_22862 ) ) ( HOIST-AT ?auto_22883 ?auto_22865 ) ( AVAILABLE ?auto_22883 ) ( SURFACE-AT ?auto_22852 ?auto_22865 ) ( ON ?auto_22852 ?auto_22875 ) ( CLEAR ?auto_22852 ) ( not ( = ?auto_22851 ?auto_22852 ) ) ( not ( = ?auto_22851 ?auto_22875 ) ) ( not ( = ?auto_22852 ?auto_22875 ) ) ( not ( = ?auto_22860 ?auto_22883 ) ) ( IS-CRATE ?auto_22851 ) ( not ( = ?auto_22887 ?auto_22862 ) ) ( HOIST-AT ?auto_22889 ?auto_22887 ) ( SURFACE-AT ?auto_22851 ?auto_22887 ) ( ON ?auto_22851 ?auto_22866 ) ( CLEAR ?auto_22851 ) ( not ( = ?auto_22850 ?auto_22851 ) ) ( not ( = ?auto_22850 ?auto_22866 ) ) ( not ( = ?auto_22851 ?auto_22866 ) ) ( not ( = ?auto_22860 ?auto_22889 ) ) ( IS-CRATE ?auto_22850 ) ( AVAILABLE ?auto_22881 ) ( SURFACE-AT ?auto_22850 ?auto_22886 ) ( ON ?auto_22850 ?auto_22882 ) ( CLEAR ?auto_22850 ) ( not ( = ?auto_22849 ?auto_22850 ) ) ( not ( = ?auto_22849 ?auto_22882 ) ) ( not ( = ?auto_22850 ?auto_22882 ) ) ( IS-CRATE ?auto_22849 ) ( SURFACE-AT ?auto_22849 ?auto_22872 ) ( ON ?auto_22849 ?auto_22880 ) ( CLEAR ?auto_22849 ) ( not ( = ?auto_22848 ?auto_22849 ) ) ( not ( = ?auto_22848 ?auto_22880 ) ) ( not ( = ?auto_22849 ?auto_22880 ) ) ( IS-CRATE ?auto_22848 ) ( not ( = ?auto_22888 ?auto_22862 ) ) ( HOIST-AT ?auto_22868 ?auto_22888 ) ( AVAILABLE ?auto_22868 ) ( SURFACE-AT ?auto_22848 ?auto_22888 ) ( ON ?auto_22848 ?auto_22878 ) ( CLEAR ?auto_22848 ) ( not ( = ?auto_22847 ?auto_22848 ) ) ( not ( = ?auto_22847 ?auto_22878 ) ) ( not ( = ?auto_22848 ?auto_22878 ) ) ( not ( = ?auto_22860 ?auto_22868 ) ) ( IS-CRATE ?auto_22847 ) ( not ( = ?auto_22873 ?auto_22862 ) ) ( HOIST-AT ?auto_22890 ?auto_22873 ) ( AVAILABLE ?auto_22890 ) ( SURFACE-AT ?auto_22847 ?auto_22873 ) ( ON ?auto_22847 ?auto_22885 ) ( CLEAR ?auto_22847 ) ( not ( = ?auto_22846 ?auto_22847 ) ) ( not ( = ?auto_22846 ?auto_22885 ) ) ( not ( = ?auto_22847 ?auto_22885 ) ) ( not ( = ?auto_22860 ?auto_22890 ) ) ( IS-CRATE ?auto_22846 ) ( not ( = ?auto_22867 ?auto_22862 ) ) ( HOIST-AT ?auto_22869 ?auto_22867 ) ( SURFACE-AT ?auto_22846 ?auto_22867 ) ( ON ?auto_22846 ?auto_22877 ) ( CLEAR ?auto_22846 ) ( not ( = ?auto_22845 ?auto_22846 ) ) ( not ( = ?auto_22845 ?auto_22877 ) ) ( not ( = ?auto_22846 ?auto_22877 ) ) ( not ( = ?auto_22860 ?auto_22869 ) ) ( IS-CRATE ?auto_22845 ) ( AVAILABLE ?auto_22869 ) ( SURFACE-AT ?auto_22845 ?auto_22867 ) ( ON ?auto_22845 ?auto_22874 ) ( CLEAR ?auto_22845 ) ( not ( = ?auto_22844 ?auto_22845 ) ) ( not ( = ?auto_22844 ?auto_22874 ) ) ( not ( = ?auto_22845 ?auto_22874 ) ) ( IS-CRATE ?auto_22844 ) ( AVAILABLE ?auto_22889 ) ( SURFACE-AT ?auto_22844 ?auto_22887 ) ( ON ?auto_22844 ?auto_22884 ) ( CLEAR ?auto_22844 ) ( not ( = ?auto_22843 ?auto_22844 ) ) ( not ( = ?auto_22843 ?auto_22884 ) ) ( not ( = ?auto_22844 ?auto_22884 ) ) ( IS-CRATE ?auto_22843 ) ( SURFACE-AT ?auto_22843 ?auto_22872 ) ( ON ?auto_22843 ?auto_22876 ) ( CLEAR ?auto_22843 ) ( not ( = ?auto_22842 ?auto_22843 ) ) ( not ( = ?auto_22842 ?auto_22876 ) ) ( not ( = ?auto_22843 ?auto_22876 ) ) ( SURFACE-AT ?auto_22841 ?auto_22862 ) ( CLEAR ?auto_22841 ) ( IS-CRATE ?auto_22842 ) ( AVAILABLE ?auto_22860 ) ( AVAILABLE ?auto_22863 ) ( SURFACE-AT ?auto_22842 ?auto_22872 ) ( ON ?auto_22842 ?auto_22879 ) ( CLEAR ?auto_22842 ) ( TRUCK-AT ?auto_22861 ?auto_22862 ) ( not ( = ?auto_22841 ?auto_22842 ) ) ( not ( = ?auto_22841 ?auto_22879 ) ) ( not ( = ?auto_22842 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22843 ) ) ( not ( = ?auto_22841 ?auto_22876 ) ) ( not ( = ?auto_22843 ?auto_22879 ) ) ( not ( = ?auto_22876 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22844 ) ) ( not ( = ?auto_22841 ?auto_22884 ) ) ( not ( = ?auto_22842 ?auto_22844 ) ) ( not ( = ?auto_22842 ?auto_22884 ) ) ( not ( = ?auto_22844 ?auto_22876 ) ) ( not ( = ?auto_22844 ?auto_22879 ) ) ( not ( = ?auto_22887 ?auto_22872 ) ) ( not ( = ?auto_22889 ?auto_22863 ) ) ( not ( = ?auto_22884 ?auto_22876 ) ) ( not ( = ?auto_22884 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22845 ) ) ( not ( = ?auto_22841 ?auto_22874 ) ) ( not ( = ?auto_22842 ?auto_22845 ) ) ( not ( = ?auto_22842 ?auto_22874 ) ) ( not ( = ?auto_22843 ?auto_22845 ) ) ( not ( = ?auto_22843 ?auto_22874 ) ) ( not ( = ?auto_22845 ?auto_22884 ) ) ( not ( = ?auto_22845 ?auto_22876 ) ) ( not ( = ?auto_22845 ?auto_22879 ) ) ( not ( = ?auto_22867 ?auto_22887 ) ) ( not ( = ?auto_22867 ?auto_22872 ) ) ( not ( = ?auto_22869 ?auto_22889 ) ) ( not ( = ?auto_22869 ?auto_22863 ) ) ( not ( = ?auto_22874 ?auto_22884 ) ) ( not ( = ?auto_22874 ?auto_22876 ) ) ( not ( = ?auto_22874 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22846 ) ) ( not ( = ?auto_22841 ?auto_22877 ) ) ( not ( = ?auto_22842 ?auto_22846 ) ) ( not ( = ?auto_22842 ?auto_22877 ) ) ( not ( = ?auto_22843 ?auto_22846 ) ) ( not ( = ?auto_22843 ?auto_22877 ) ) ( not ( = ?auto_22844 ?auto_22846 ) ) ( not ( = ?auto_22844 ?auto_22877 ) ) ( not ( = ?auto_22846 ?auto_22874 ) ) ( not ( = ?auto_22846 ?auto_22884 ) ) ( not ( = ?auto_22846 ?auto_22876 ) ) ( not ( = ?auto_22846 ?auto_22879 ) ) ( not ( = ?auto_22877 ?auto_22874 ) ) ( not ( = ?auto_22877 ?auto_22884 ) ) ( not ( = ?auto_22877 ?auto_22876 ) ) ( not ( = ?auto_22877 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22847 ) ) ( not ( = ?auto_22841 ?auto_22885 ) ) ( not ( = ?auto_22842 ?auto_22847 ) ) ( not ( = ?auto_22842 ?auto_22885 ) ) ( not ( = ?auto_22843 ?auto_22847 ) ) ( not ( = ?auto_22843 ?auto_22885 ) ) ( not ( = ?auto_22844 ?auto_22847 ) ) ( not ( = ?auto_22844 ?auto_22885 ) ) ( not ( = ?auto_22845 ?auto_22847 ) ) ( not ( = ?auto_22845 ?auto_22885 ) ) ( not ( = ?auto_22847 ?auto_22877 ) ) ( not ( = ?auto_22847 ?auto_22874 ) ) ( not ( = ?auto_22847 ?auto_22884 ) ) ( not ( = ?auto_22847 ?auto_22876 ) ) ( not ( = ?auto_22847 ?auto_22879 ) ) ( not ( = ?auto_22873 ?auto_22867 ) ) ( not ( = ?auto_22873 ?auto_22887 ) ) ( not ( = ?auto_22873 ?auto_22872 ) ) ( not ( = ?auto_22890 ?auto_22869 ) ) ( not ( = ?auto_22890 ?auto_22889 ) ) ( not ( = ?auto_22890 ?auto_22863 ) ) ( not ( = ?auto_22885 ?auto_22877 ) ) ( not ( = ?auto_22885 ?auto_22874 ) ) ( not ( = ?auto_22885 ?auto_22884 ) ) ( not ( = ?auto_22885 ?auto_22876 ) ) ( not ( = ?auto_22885 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22848 ) ) ( not ( = ?auto_22841 ?auto_22878 ) ) ( not ( = ?auto_22842 ?auto_22848 ) ) ( not ( = ?auto_22842 ?auto_22878 ) ) ( not ( = ?auto_22843 ?auto_22848 ) ) ( not ( = ?auto_22843 ?auto_22878 ) ) ( not ( = ?auto_22844 ?auto_22848 ) ) ( not ( = ?auto_22844 ?auto_22878 ) ) ( not ( = ?auto_22845 ?auto_22848 ) ) ( not ( = ?auto_22845 ?auto_22878 ) ) ( not ( = ?auto_22846 ?auto_22848 ) ) ( not ( = ?auto_22846 ?auto_22878 ) ) ( not ( = ?auto_22848 ?auto_22885 ) ) ( not ( = ?auto_22848 ?auto_22877 ) ) ( not ( = ?auto_22848 ?auto_22874 ) ) ( not ( = ?auto_22848 ?auto_22884 ) ) ( not ( = ?auto_22848 ?auto_22876 ) ) ( not ( = ?auto_22848 ?auto_22879 ) ) ( not ( = ?auto_22888 ?auto_22873 ) ) ( not ( = ?auto_22888 ?auto_22867 ) ) ( not ( = ?auto_22888 ?auto_22887 ) ) ( not ( = ?auto_22888 ?auto_22872 ) ) ( not ( = ?auto_22868 ?auto_22890 ) ) ( not ( = ?auto_22868 ?auto_22869 ) ) ( not ( = ?auto_22868 ?auto_22889 ) ) ( not ( = ?auto_22868 ?auto_22863 ) ) ( not ( = ?auto_22878 ?auto_22885 ) ) ( not ( = ?auto_22878 ?auto_22877 ) ) ( not ( = ?auto_22878 ?auto_22874 ) ) ( not ( = ?auto_22878 ?auto_22884 ) ) ( not ( = ?auto_22878 ?auto_22876 ) ) ( not ( = ?auto_22878 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22849 ) ) ( not ( = ?auto_22841 ?auto_22880 ) ) ( not ( = ?auto_22842 ?auto_22849 ) ) ( not ( = ?auto_22842 ?auto_22880 ) ) ( not ( = ?auto_22843 ?auto_22849 ) ) ( not ( = ?auto_22843 ?auto_22880 ) ) ( not ( = ?auto_22844 ?auto_22849 ) ) ( not ( = ?auto_22844 ?auto_22880 ) ) ( not ( = ?auto_22845 ?auto_22849 ) ) ( not ( = ?auto_22845 ?auto_22880 ) ) ( not ( = ?auto_22846 ?auto_22849 ) ) ( not ( = ?auto_22846 ?auto_22880 ) ) ( not ( = ?auto_22847 ?auto_22849 ) ) ( not ( = ?auto_22847 ?auto_22880 ) ) ( not ( = ?auto_22849 ?auto_22878 ) ) ( not ( = ?auto_22849 ?auto_22885 ) ) ( not ( = ?auto_22849 ?auto_22877 ) ) ( not ( = ?auto_22849 ?auto_22874 ) ) ( not ( = ?auto_22849 ?auto_22884 ) ) ( not ( = ?auto_22849 ?auto_22876 ) ) ( not ( = ?auto_22849 ?auto_22879 ) ) ( not ( = ?auto_22880 ?auto_22878 ) ) ( not ( = ?auto_22880 ?auto_22885 ) ) ( not ( = ?auto_22880 ?auto_22877 ) ) ( not ( = ?auto_22880 ?auto_22874 ) ) ( not ( = ?auto_22880 ?auto_22884 ) ) ( not ( = ?auto_22880 ?auto_22876 ) ) ( not ( = ?auto_22880 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22850 ) ) ( not ( = ?auto_22841 ?auto_22882 ) ) ( not ( = ?auto_22842 ?auto_22850 ) ) ( not ( = ?auto_22842 ?auto_22882 ) ) ( not ( = ?auto_22843 ?auto_22850 ) ) ( not ( = ?auto_22843 ?auto_22882 ) ) ( not ( = ?auto_22844 ?auto_22850 ) ) ( not ( = ?auto_22844 ?auto_22882 ) ) ( not ( = ?auto_22845 ?auto_22850 ) ) ( not ( = ?auto_22845 ?auto_22882 ) ) ( not ( = ?auto_22846 ?auto_22850 ) ) ( not ( = ?auto_22846 ?auto_22882 ) ) ( not ( = ?auto_22847 ?auto_22850 ) ) ( not ( = ?auto_22847 ?auto_22882 ) ) ( not ( = ?auto_22848 ?auto_22850 ) ) ( not ( = ?auto_22848 ?auto_22882 ) ) ( not ( = ?auto_22850 ?auto_22880 ) ) ( not ( = ?auto_22850 ?auto_22878 ) ) ( not ( = ?auto_22850 ?auto_22885 ) ) ( not ( = ?auto_22850 ?auto_22877 ) ) ( not ( = ?auto_22850 ?auto_22874 ) ) ( not ( = ?auto_22850 ?auto_22884 ) ) ( not ( = ?auto_22850 ?auto_22876 ) ) ( not ( = ?auto_22850 ?auto_22879 ) ) ( not ( = ?auto_22886 ?auto_22872 ) ) ( not ( = ?auto_22886 ?auto_22888 ) ) ( not ( = ?auto_22886 ?auto_22873 ) ) ( not ( = ?auto_22886 ?auto_22867 ) ) ( not ( = ?auto_22886 ?auto_22887 ) ) ( not ( = ?auto_22881 ?auto_22863 ) ) ( not ( = ?auto_22881 ?auto_22868 ) ) ( not ( = ?auto_22881 ?auto_22890 ) ) ( not ( = ?auto_22881 ?auto_22869 ) ) ( not ( = ?auto_22881 ?auto_22889 ) ) ( not ( = ?auto_22882 ?auto_22880 ) ) ( not ( = ?auto_22882 ?auto_22878 ) ) ( not ( = ?auto_22882 ?auto_22885 ) ) ( not ( = ?auto_22882 ?auto_22877 ) ) ( not ( = ?auto_22882 ?auto_22874 ) ) ( not ( = ?auto_22882 ?auto_22884 ) ) ( not ( = ?auto_22882 ?auto_22876 ) ) ( not ( = ?auto_22882 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22851 ) ) ( not ( = ?auto_22841 ?auto_22866 ) ) ( not ( = ?auto_22842 ?auto_22851 ) ) ( not ( = ?auto_22842 ?auto_22866 ) ) ( not ( = ?auto_22843 ?auto_22851 ) ) ( not ( = ?auto_22843 ?auto_22866 ) ) ( not ( = ?auto_22844 ?auto_22851 ) ) ( not ( = ?auto_22844 ?auto_22866 ) ) ( not ( = ?auto_22845 ?auto_22851 ) ) ( not ( = ?auto_22845 ?auto_22866 ) ) ( not ( = ?auto_22846 ?auto_22851 ) ) ( not ( = ?auto_22846 ?auto_22866 ) ) ( not ( = ?auto_22847 ?auto_22851 ) ) ( not ( = ?auto_22847 ?auto_22866 ) ) ( not ( = ?auto_22848 ?auto_22851 ) ) ( not ( = ?auto_22848 ?auto_22866 ) ) ( not ( = ?auto_22849 ?auto_22851 ) ) ( not ( = ?auto_22849 ?auto_22866 ) ) ( not ( = ?auto_22851 ?auto_22882 ) ) ( not ( = ?auto_22851 ?auto_22880 ) ) ( not ( = ?auto_22851 ?auto_22878 ) ) ( not ( = ?auto_22851 ?auto_22885 ) ) ( not ( = ?auto_22851 ?auto_22877 ) ) ( not ( = ?auto_22851 ?auto_22874 ) ) ( not ( = ?auto_22851 ?auto_22884 ) ) ( not ( = ?auto_22851 ?auto_22876 ) ) ( not ( = ?auto_22851 ?auto_22879 ) ) ( not ( = ?auto_22866 ?auto_22882 ) ) ( not ( = ?auto_22866 ?auto_22880 ) ) ( not ( = ?auto_22866 ?auto_22878 ) ) ( not ( = ?auto_22866 ?auto_22885 ) ) ( not ( = ?auto_22866 ?auto_22877 ) ) ( not ( = ?auto_22866 ?auto_22874 ) ) ( not ( = ?auto_22866 ?auto_22884 ) ) ( not ( = ?auto_22866 ?auto_22876 ) ) ( not ( = ?auto_22866 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22852 ) ) ( not ( = ?auto_22841 ?auto_22875 ) ) ( not ( = ?auto_22842 ?auto_22852 ) ) ( not ( = ?auto_22842 ?auto_22875 ) ) ( not ( = ?auto_22843 ?auto_22852 ) ) ( not ( = ?auto_22843 ?auto_22875 ) ) ( not ( = ?auto_22844 ?auto_22852 ) ) ( not ( = ?auto_22844 ?auto_22875 ) ) ( not ( = ?auto_22845 ?auto_22852 ) ) ( not ( = ?auto_22845 ?auto_22875 ) ) ( not ( = ?auto_22846 ?auto_22852 ) ) ( not ( = ?auto_22846 ?auto_22875 ) ) ( not ( = ?auto_22847 ?auto_22852 ) ) ( not ( = ?auto_22847 ?auto_22875 ) ) ( not ( = ?auto_22848 ?auto_22852 ) ) ( not ( = ?auto_22848 ?auto_22875 ) ) ( not ( = ?auto_22849 ?auto_22852 ) ) ( not ( = ?auto_22849 ?auto_22875 ) ) ( not ( = ?auto_22850 ?auto_22852 ) ) ( not ( = ?auto_22850 ?auto_22875 ) ) ( not ( = ?auto_22852 ?auto_22866 ) ) ( not ( = ?auto_22852 ?auto_22882 ) ) ( not ( = ?auto_22852 ?auto_22880 ) ) ( not ( = ?auto_22852 ?auto_22878 ) ) ( not ( = ?auto_22852 ?auto_22885 ) ) ( not ( = ?auto_22852 ?auto_22877 ) ) ( not ( = ?auto_22852 ?auto_22874 ) ) ( not ( = ?auto_22852 ?auto_22884 ) ) ( not ( = ?auto_22852 ?auto_22876 ) ) ( not ( = ?auto_22852 ?auto_22879 ) ) ( not ( = ?auto_22865 ?auto_22887 ) ) ( not ( = ?auto_22865 ?auto_22886 ) ) ( not ( = ?auto_22865 ?auto_22872 ) ) ( not ( = ?auto_22865 ?auto_22888 ) ) ( not ( = ?auto_22865 ?auto_22873 ) ) ( not ( = ?auto_22865 ?auto_22867 ) ) ( not ( = ?auto_22883 ?auto_22889 ) ) ( not ( = ?auto_22883 ?auto_22881 ) ) ( not ( = ?auto_22883 ?auto_22863 ) ) ( not ( = ?auto_22883 ?auto_22868 ) ) ( not ( = ?auto_22883 ?auto_22890 ) ) ( not ( = ?auto_22883 ?auto_22869 ) ) ( not ( = ?auto_22875 ?auto_22866 ) ) ( not ( = ?auto_22875 ?auto_22882 ) ) ( not ( = ?auto_22875 ?auto_22880 ) ) ( not ( = ?auto_22875 ?auto_22878 ) ) ( not ( = ?auto_22875 ?auto_22885 ) ) ( not ( = ?auto_22875 ?auto_22877 ) ) ( not ( = ?auto_22875 ?auto_22874 ) ) ( not ( = ?auto_22875 ?auto_22884 ) ) ( not ( = ?auto_22875 ?auto_22876 ) ) ( not ( = ?auto_22875 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22853 ) ) ( not ( = ?auto_22841 ?auto_22870 ) ) ( not ( = ?auto_22842 ?auto_22853 ) ) ( not ( = ?auto_22842 ?auto_22870 ) ) ( not ( = ?auto_22843 ?auto_22853 ) ) ( not ( = ?auto_22843 ?auto_22870 ) ) ( not ( = ?auto_22844 ?auto_22853 ) ) ( not ( = ?auto_22844 ?auto_22870 ) ) ( not ( = ?auto_22845 ?auto_22853 ) ) ( not ( = ?auto_22845 ?auto_22870 ) ) ( not ( = ?auto_22846 ?auto_22853 ) ) ( not ( = ?auto_22846 ?auto_22870 ) ) ( not ( = ?auto_22847 ?auto_22853 ) ) ( not ( = ?auto_22847 ?auto_22870 ) ) ( not ( = ?auto_22848 ?auto_22853 ) ) ( not ( = ?auto_22848 ?auto_22870 ) ) ( not ( = ?auto_22849 ?auto_22853 ) ) ( not ( = ?auto_22849 ?auto_22870 ) ) ( not ( = ?auto_22850 ?auto_22853 ) ) ( not ( = ?auto_22850 ?auto_22870 ) ) ( not ( = ?auto_22851 ?auto_22853 ) ) ( not ( = ?auto_22851 ?auto_22870 ) ) ( not ( = ?auto_22853 ?auto_22875 ) ) ( not ( = ?auto_22853 ?auto_22866 ) ) ( not ( = ?auto_22853 ?auto_22882 ) ) ( not ( = ?auto_22853 ?auto_22880 ) ) ( not ( = ?auto_22853 ?auto_22878 ) ) ( not ( = ?auto_22853 ?auto_22885 ) ) ( not ( = ?auto_22853 ?auto_22877 ) ) ( not ( = ?auto_22853 ?auto_22874 ) ) ( not ( = ?auto_22853 ?auto_22884 ) ) ( not ( = ?auto_22853 ?auto_22876 ) ) ( not ( = ?auto_22853 ?auto_22879 ) ) ( not ( = ?auto_22870 ?auto_22875 ) ) ( not ( = ?auto_22870 ?auto_22866 ) ) ( not ( = ?auto_22870 ?auto_22882 ) ) ( not ( = ?auto_22870 ?auto_22880 ) ) ( not ( = ?auto_22870 ?auto_22878 ) ) ( not ( = ?auto_22870 ?auto_22885 ) ) ( not ( = ?auto_22870 ?auto_22877 ) ) ( not ( = ?auto_22870 ?auto_22874 ) ) ( not ( = ?auto_22870 ?auto_22884 ) ) ( not ( = ?auto_22870 ?auto_22876 ) ) ( not ( = ?auto_22870 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22855 ) ) ( not ( = ?auto_22841 ?auto_22864 ) ) ( not ( = ?auto_22842 ?auto_22855 ) ) ( not ( = ?auto_22842 ?auto_22864 ) ) ( not ( = ?auto_22843 ?auto_22855 ) ) ( not ( = ?auto_22843 ?auto_22864 ) ) ( not ( = ?auto_22844 ?auto_22855 ) ) ( not ( = ?auto_22844 ?auto_22864 ) ) ( not ( = ?auto_22845 ?auto_22855 ) ) ( not ( = ?auto_22845 ?auto_22864 ) ) ( not ( = ?auto_22846 ?auto_22855 ) ) ( not ( = ?auto_22846 ?auto_22864 ) ) ( not ( = ?auto_22847 ?auto_22855 ) ) ( not ( = ?auto_22847 ?auto_22864 ) ) ( not ( = ?auto_22848 ?auto_22855 ) ) ( not ( = ?auto_22848 ?auto_22864 ) ) ( not ( = ?auto_22849 ?auto_22855 ) ) ( not ( = ?auto_22849 ?auto_22864 ) ) ( not ( = ?auto_22850 ?auto_22855 ) ) ( not ( = ?auto_22850 ?auto_22864 ) ) ( not ( = ?auto_22851 ?auto_22855 ) ) ( not ( = ?auto_22851 ?auto_22864 ) ) ( not ( = ?auto_22852 ?auto_22855 ) ) ( not ( = ?auto_22852 ?auto_22864 ) ) ( not ( = ?auto_22855 ?auto_22870 ) ) ( not ( = ?auto_22855 ?auto_22875 ) ) ( not ( = ?auto_22855 ?auto_22866 ) ) ( not ( = ?auto_22855 ?auto_22882 ) ) ( not ( = ?auto_22855 ?auto_22880 ) ) ( not ( = ?auto_22855 ?auto_22878 ) ) ( not ( = ?auto_22855 ?auto_22885 ) ) ( not ( = ?auto_22855 ?auto_22877 ) ) ( not ( = ?auto_22855 ?auto_22874 ) ) ( not ( = ?auto_22855 ?auto_22884 ) ) ( not ( = ?auto_22855 ?auto_22876 ) ) ( not ( = ?auto_22855 ?auto_22879 ) ) ( not ( = ?auto_22857 ?auto_22872 ) ) ( not ( = ?auto_22857 ?auto_22865 ) ) ( not ( = ?auto_22857 ?auto_22887 ) ) ( not ( = ?auto_22857 ?auto_22886 ) ) ( not ( = ?auto_22857 ?auto_22888 ) ) ( not ( = ?auto_22857 ?auto_22873 ) ) ( not ( = ?auto_22857 ?auto_22867 ) ) ( not ( = ?auto_22859 ?auto_22863 ) ) ( not ( = ?auto_22859 ?auto_22883 ) ) ( not ( = ?auto_22859 ?auto_22889 ) ) ( not ( = ?auto_22859 ?auto_22881 ) ) ( not ( = ?auto_22859 ?auto_22868 ) ) ( not ( = ?auto_22859 ?auto_22890 ) ) ( not ( = ?auto_22859 ?auto_22869 ) ) ( not ( = ?auto_22864 ?auto_22870 ) ) ( not ( = ?auto_22864 ?auto_22875 ) ) ( not ( = ?auto_22864 ?auto_22866 ) ) ( not ( = ?auto_22864 ?auto_22882 ) ) ( not ( = ?auto_22864 ?auto_22880 ) ) ( not ( = ?auto_22864 ?auto_22878 ) ) ( not ( = ?auto_22864 ?auto_22885 ) ) ( not ( = ?auto_22864 ?auto_22877 ) ) ( not ( = ?auto_22864 ?auto_22874 ) ) ( not ( = ?auto_22864 ?auto_22884 ) ) ( not ( = ?auto_22864 ?auto_22876 ) ) ( not ( = ?auto_22864 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22854 ) ) ( not ( = ?auto_22841 ?auto_22871 ) ) ( not ( = ?auto_22842 ?auto_22854 ) ) ( not ( = ?auto_22842 ?auto_22871 ) ) ( not ( = ?auto_22843 ?auto_22854 ) ) ( not ( = ?auto_22843 ?auto_22871 ) ) ( not ( = ?auto_22844 ?auto_22854 ) ) ( not ( = ?auto_22844 ?auto_22871 ) ) ( not ( = ?auto_22845 ?auto_22854 ) ) ( not ( = ?auto_22845 ?auto_22871 ) ) ( not ( = ?auto_22846 ?auto_22854 ) ) ( not ( = ?auto_22846 ?auto_22871 ) ) ( not ( = ?auto_22847 ?auto_22854 ) ) ( not ( = ?auto_22847 ?auto_22871 ) ) ( not ( = ?auto_22848 ?auto_22854 ) ) ( not ( = ?auto_22848 ?auto_22871 ) ) ( not ( = ?auto_22849 ?auto_22854 ) ) ( not ( = ?auto_22849 ?auto_22871 ) ) ( not ( = ?auto_22850 ?auto_22854 ) ) ( not ( = ?auto_22850 ?auto_22871 ) ) ( not ( = ?auto_22851 ?auto_22854 ) ) ( not ( = ?auto_22851 ?auto_22871 ) ) ( not ( = ?auto_22852 ?auto_22854 ) ) ( not ( = ?auto_22852 ?auto_22871 ) ) ( not ( = ?auto_22853 ?auto_22854 ) ) ( not ( = ?auto_22853 ?auto_22871 ) ) ( not ( = ?auto_22854 ?auto_22864 ) ) ( not ( = ?auto_22854 ?auto_22870 ) ) ( not ( = ?auto_22854 ?auto_22875 ) ) ( not ( = ?auto_22854 ?auto_22866 ) ) ( not ( = ?auto_22854 ?auto_22882 ) ) ( not ( = ?auto_22854 ?auto_22880 ) ) ( not ( = ?auto_22854 ?auto_22878 ) ) ( not ( = ?auto_22854 ?auto_22885 ) ) ( not ( = ?auto_22854 ?auto_22877 ) ) ( not ( = ?auto_22854 ?auto_22874 ) ) ( not ( = ?auto_22854 ?auto_22884 ) ) ( not ( = ?auto_22854 ?auto_22876 ) ) ( not ( = ?auto_22854 ?auto_22879 ) ) ( not ( = ?auto_22871 ?auto_22864 ) ) ( not ( = ?auto_22871 ?auto_22870 ) ) ( not ( = ?auto_22871 ?auto_22875 ) ) ( not ( = ?auto_22871 ?auto_22866 ) ) ( not ( = ?auto_22871 ?auto_22882 ) ) ( not ( = ?auto_22871 ?auto_22880 ) ) ( not ( = ?auto_22871 ?auto_22878 ) ) ( not ( = ?auto_22871 ?auto_22885 ) ) ( not ( = ?auto_22871 ?auto_22877 ) ) ( not ( = ?auto_22871 ?auto_22874 ) ) ( not ( = ?auto_22871 ?auto_22884 ) ) ( not ( = ?auto_22871 ?auto_22876 ) ) ( not ( = ?auto_22871 ?auto_22879 ) ) ( not ( = ?auto_22841 ?auto_22856 ) ) ( not ( = ?auto_22841 ?auto_22858 ) ) ( not ( = ?auto_22842 ?auto_22856 ) ) ( not ( = ?auto_22842 ?auto_22858 ) ) ( not ( = ?auto_22843 ?auto_22856 ) ) ( not ( = ?auto_22843 ?auto_22858 ) ) ( not ( = ?auto_22844 ?auto_22856 ) ) ( not ( = ?auto_22844 ?auto_22858 ) ) ( not ( = ?auto_22845 ?auto_22856 ) ) ( not ( = ?auto_22845 ?auto_22858 ) ) ( not ( = ?auto_22846 ?auto_22856 ) ) ( not ( = ?auto_22846 ?auto_22858 ) ) ( not ( = ?auto_22847 ?auto_22856 ) ) ( not ( = ?auto_22847 ?auto_22858 ) ) ( not ( = ?auto_22848 ?auto_22856 ) ) ( not ( = ?auto_22848 ?auto_22858 ) ) ( not ( = ?auto_22849 ?auto_22856 ) ) ( not ( = ?auto_22849 ?auto_22858 ) ) ( not ( = ?auto_22850 ?auto_22856 ) ) ( not ( = ?auto_22850 ?auto_22858 ) ) ( not ( = ?auto_22851 ?auto_22856 ) ) ( not ( = ?auto_22851 ?auto_22858 ) ) ( not ( = ?auto_22852 ?auto_22856 ) ) ( not ( = ?auto_22852 ?auto_22858 ) ) ( not ( = ?auto_22853 ?auto_22856 ) ) ( not ( = ?auto_22853 ?auto_22858 ) ) ( not ( = ?auto_22855 ?auto_22856 ) ) ( not ( = ?auto_22855 ?auto_22858 ) ) ( not ( = ?auto_22856 ?auto_22871 ) ) ( not ( = ?auto_22856 ?auto_22864 ) ) ( not ( = ?auto_22856 ?auto_22870 ) ) ( not ( = ?auto_22856 ?auto_22875 ) ) ( not ( = ?auto_22856 ?auto_22866 ) ) ( not ( = ?auto_22856 ?auto_22882 ) ) ( not ( = ?auto_22856 ?auto_22880 ) ) ( not ( = ?auto_22856 ?auto_22878 ) ) ( not ( = ?auto_22856 ?auto_22885 ) ) ( not ( = ?auto_22856 ?auto_22877 ) ) ( not ( = ?auto_22856 ?auto_22874 ) ) ( not ( = ?auto_22856 ?auto_22884 ) ) ( not ( = ?auto_22856 ?auto_22876 ) ) ( not ( = ?auto_22856 ?auto_22879 ) ) ( not ( = ?auto_22858 ?auto_22871 ) ) ( not ( = ?auto_22858 ?auto_22864 ) ) ( not ( = ?auto_22858 ?auto_22870 ) ) ( not ( = ?auto_22858 ?auto_22875 ) ) ( not ( = ?auto_22858 ?auto_22866 ) ) ( not ( = ?auto_22858 ?auto_22882 ) ) ( not ( = ?auto_22858 ?auto_22880 ) ) ( not ( = ?auto_22858 ?auto_22878 ) ) ( not ( = ?auto_22858 ?auto_22885 ) ) ( not ( = ?auto_22858 ?auto_22877 ) ) ( not ( = ?auto_22858 ?auto_22874 ) ) ( not ( = ?auto_22858 ?auto_22884 ) ) ( not ( = ?auto_22858 ?auto_22876 ) ) ( not ( = ?auto_22858 ?auto_22879 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_22841 ?auto_22842 ?auto_22843 ?auto_22844 ?auto_22845 ?auto_22846 ?auto_22847 ?auto_22848 ?auto_22849 ?auto_22850 ?auto_22851 ?auto_22852 ?auto_22853 ?auto_22855 ?auto_22854 )
      ( MAKE-1CRATE ?auto_22854 ?auto_22856 )
      ( MAKE-15CRATE-VERIFY ?auto_22841 ?auto_22842 ?auto_22843 ?auto_22844 ?auto_22845 ?auto_22846 ?auto_22847 ?auto_22848 ?auto_22849 ?auto_22850 ?auto_22851 ?auto_22852 ?auto_22853 ?auto_22855 ?auto_22854 ?auto_22856 ) )
  )

)

