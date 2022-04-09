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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17089 - SURFACE
      ?auto_17090 - SURFACE
    )
    :vars
    (
      ?auto_17091 - HOIST
      ?auto_17092 - PLACE
      ?auto_17094 - PLACE
      ?auto_17095 - HOIST
      ?auto_17096 - SURFACE
      ?auto_17093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17091 ?auto_17092 ) ( SURFACE-AT ?auto_17089 ?auto_17092 ) ( CLEAR ?auto_17089 ) ( IS-CRATE ?auto_17090 ) ( AVAILABLE ?auto_17091 ) ( not ( = ?auto_17094 ?auto_17092 ) ) ( HOIST-AT ?auto_17095 ?auto_17094 ) ( AVAILABLE ?auto_17095 ) ( SURFACE-AT ?auto_17090 ?auto_17094 ) ( ON ?auto_17090 ?auto_17096 ) ( CLEAR ?auto_17090 ) ( TRUCK-AT ?auto_17093 ?auto_17092 ) ( not ( = ?auto_17089 ?auto_17090 ) ) ( not ( = ?auto_17089 ?auto_17096 ) ) ( not ( = ?auto_17090 ?auto_17096 ) ) ( not ( = ?auto_17091 ?auto_17095 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17093 ?auto_17092 ?auto_17094 )
      ( !LIFT ?auto_17095 ?auto_17090 ?auto_17096 ?auto_17094 )
      ( !LOAD ?auto_17095 ?auto_17090 ?auto_17093 ?auto_17094 )
      ( !DRIVE ?auto_17093 ?auto_17094 ?auto_17092 )
      ( !UNLOAD ?auto_17091 ?auto_17090 ?auto_17093 ?auto_17092 )
      ( !DROP ?auto_17091 ?auto_17090 ?auto_17089 ?auto_17092 )
      ( MAKE-1CRATE-VERIFY ?auto_17089 ?auto_17090 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17110 - SURFACE
      ?auto_17111 - SURFACE
      ?auto_17112 - SURFACE
    )
    :vars
    (
      ?auto_17118 - HOIST
      ?auto_17117 - PLACE
      ?auto_17114 - PLACE
      ?auto_17113 - HOIST
      ?auto_17116 - SURFACE
      ?auto_17121 - PLACE
      ?auto_17119 - HOIST
      ?auto_17120 - SURFACE
      ?auto_17115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17118 ?auto_17117 ) ( IS-CRATE ?auto_17112 ) ( not ( = ?auto_17114 ?auto_17117 ) ) ( HOIST-AT ?auto_17113 ?auto_17114 ) ( AVAILABLE ?auto_17113 ) ( SURFACE-AT ?auto_17112 ?auto_17114 ) ( ON ?auto_17112 ?auto_17116 ) ( CLEAR ?auto_17112 ) ( not ( = ?auto_17111 ?auto_17112 ) ) ( not ( = ?auto_17111 ?auto_17116 ) ) ( not ( = ?auto_17112 ?auto_17116 ) ) ( not ( = ?auto_17118 ?auto_17113 ) ) ( SURFACE-AT ?auto_17110 ?auto_17117 ) ( CLEAR ?auto_17110 ) ( IS-CRATE ?auto_17111 ) ( AVAILABLE ?auto_17118 ) ( not ( = ?auto_17121 ?auto_17117 ) ) ( HOIST-AT ?auto_17119 ?auto_17121 ) ( AVAILABLE ?auto_17119 ) ( SURFACE-AT ?auto_17111 ?auto_17121 ) ( ON ?auto_17111 ?auto_17120 ) ( CLEAR ?auto_17111 ) ( TRUCK-AT ?auto_17115 ?auto_17117 ) ( not ( = ?auto_17110 ?auto_17111 ) ) ( not ( = ?auto_17110 ?auto_17120 ) ) ( not ( = ?auto_17111 ?auto_17120 ) ) ( not ( = ?auto_17118 ?auto_17119 ) ) ( not ( = ?auto_17110 ?auto_17112 ) ) ( not ( = ?auto_17110 ?auto_17116 ) ) ( not ( = ?auto_17112 ?auto_17120 ) ) ( not ( = ?auto_17114 ?auto_17121 ) ) ( not ( = ?auto_17113 ?auto_17119 ) ) ( not ( = ?auto_17116 ?auto_17120 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17110 ?auto_17111 )
      ( MAKE-1CRATE ?auto_17111 ?auto_17112 )
      ( MAKE-2CRATE-VERIFY ?auto_17110 ?auto_17111 ?auto_17112 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17136 - SURFACE
      ?auto_17137 - SURFACE
      ?auto_17138 - SURFACE
      ?auto_17139 - SURFACE
    )
    :vars
    (
      ?auto_17144 - HOIST
      ?auto_17141 - PLACE
      ?auto_17140 - PLACE
      ?auto_17143 - HOIST
      ?auto_17145 - SURFACE
      ?auto_17147 - PLACE
      ?auto_17149 - HOIST
      ?auto_17146 - SURFACE
      ?auto_17148 - SURFACE
      ?auto_17142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17144 ?auto_17141 ) ( IS-CRATE ?auto_17139 ) ( not ( = ?auto_17140 ?auto_17141 ) ) ( HOIST-AT ?auto_17143 ?auto_17140 ) ( SURFACE-AT ?auto_17139 ?auto_17140 ) ( ON ?auto_17139 ?auto_17145 ) ( CLEAR ?auto_17139 ) ( not ( = ?auto_17138 ?auto_17139 ) ) ( not ( = ?auto_17138 ?auto_17145 ) ) ( not ( = ?auto_17139 ?auto_17145 ) ) ( not ( = ?auto_17144 ?auto_17143 ) ) ( IS-CRATE ?auto_17138 ) ( not ( = ?auto_17147 ?auto_17141 ) ) ( HOIST-AT ?auto_17149 ?auto_17147 ) ( AVAILABLE ?auto_17149 ) ( SURFACE-AT ?auto_17138 ?auto_17147 ) ( ON ?auto_17138 ?auto_17146 ) ( CLEAR ?auto_17138 ) ( not ( = ?auto_17137 ?auto_17138 ) ) ( not ( = ?auto_17137 ?auto_17146 ) ) ( not ( = ?auto_17138 ?auto_17146 ) ) ( not ( = ?auto_17144 ?auto_17149 ) ) ( SURFACE-AT ?auto_17136 ?auto_17141 ) ( CLEAR ?auto_17136 ) ( IS-CRATE ?auto_17137 ) ( AVAILABLE ?auto_17144 ) ( AVAILABLE ?auto_17143 ) ( SURFACE-AT ?auto_17137 ?auto_17140 ) ( ON ?auto_17137 ?auto_17148 ) ( CLEAR ?auto_17137 ) ( TRUCK-AT ?auto_17142 ?auto_17141 ) ( not ( = ?auto_17136 ?auto_17137 ) ) ( not ( = ?auto_17136 ?auto_17148 ) ) ( not ( = ?auto_17137 ?auto_17148 ) ) ( not ( = ?auto_17136 ?auto_17138 ) ) ( not ( = ?auto_17136 ?auto_17146 ) ) ( not ( = ?auto_17138 ?auto_17148 ) ) ( not ( = ?auto_17147 ?auto_17140 ) ) ( not ( = ?auto_17149 ?auto_17143 ) ) ( not ( = ?auto_17146 ?auto_17148 ) ) ( not ( = ?auto_17136 ?auto_17139 ) ) ( not ( = ?auto_17136 ?auto_17145 ) ) ( not ( = ?auto_17137 ?auto_17139 ) ) ( not ( = ?auto_17137 ?auto_17145 ) ) ( not ( = ?auto_17139 ?auto_17146 ) ) ( not ( = ?auto_17139 ?auto_17148 ) ) ( not ( = ?auto_17145 ?auto_17146 ) ) ( not ( = ?auto_17145 ?auto_17148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17136 ?auto_17137 ?auto_17138 )
      ( MAKE-1CRATE ?auto_17138 ?auto_17139 )
      ( MAKE-3CRATE-VERIFY ?auto_17136 ?auto_17137 ?auto_17138 ?auto_17139 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17165 - SURFACE
      ?auto_17166 - SURFACE
      ?auto_17167 - SURFACE
      ?auto_17168 - SURFACE
      ?auto_17169 - SURFACE
    )
    :vars
    (
      ?auto_17171 - HOIST
      ?auto_17170 - PLACE
      ?auto_17174 - PLACE
      ?auto_17175 - HOIST
      ?auto_17173 - SURFACE
      ?auto_17180 - PLACE
      ?auto_17182 - HOIST
      ?auto_17178 - SURFACE
      ?auto_17181 - PLACE
      ?auto_17176 - HOIST
      ?auto_17177 - SURFACE
      ?auto_17179 - SURFACE
      ?auto_17172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17171 ?auto_17170 ) ( IS-CRATE ?auto_17169 ) ( not ( = ?auto_17174 ?auto_17170 ) ) ( HOIST-AT ?auto_17175 ?auto_17174 ) ( AVAILABLE ?auto_17175 ) ( SURFACE-AT ?auto_17169 ?auto_17174 ) ( ON ?auto_17169 ?auto_17173 ) ( CLEAR ?auto_17169 ) ( not ( = ?auto_17168 ?auto_17169 ) ) ( not ( = ?auto_17168 ?auto_17173 ) ) ( not ( = ?auto_17169 ?auto_17173 ) ) ( not ( = ?auto_17171 ?auto_17175 ) ) ( IS-CRATE ?auto_17168 ) ( not ( = ?auto_17180 ?auto_17170 ) ) ( HOIST-AT ?auto_17182 ?auto_17180 ) ( SURFACE-AT ?auto_17168 ?auto_17180 ) ( ON ?auto_17168 ?auto_17178 ) ( CLEAR ?auto_17168 ) ( not ( = ?auto_17167 ?auto_17168 ) ) ( not ( = ?auto_17167 ?auto_17178 ) ) ( not ( = ?auto_17168 ?auto_17178 ) ) ( not ( = ?auto_17171 ?auto_17182 ) ) ( IS-CRATE ?auto_17167 ) ( not ( = ?auto_17181 ?auto_17170 ) ) ( HOIST-AT ?auto_17176 ?auto_17181 ) ( AVAILABLE ?auto_17176 ) ( SURFACE-AT ?auto_17167 ?auto_17181 ) ( ON ?auto_17167 ?auto_17177 ) ( CLEAR ?auto_17167 ) ( not ( = ?auto_17166 ?auto_17167 ) ) ( not ( = ?auto_17166 ?auto_17177 ) ) ( not ( = ?auto_17167 ?auto_17177 ) ) ( not ( = ?auto_17171 ?auto_17176 ) ) ( SURFACE-AT ?auto_17165 ?auto_17170 ) ( CLEAR ?auto_17165 ) ( IS-CRATE ?auto_17166 ) ( AVAILABLE ?auto_17171 ) ( AVAILABLE ?auto_17182 ) ( SURFACE-AT ?auto_17166 ?auto_17180 ) ( ON ?auto_17166 ?auto_17179 ) ( CLEAR ?auto_17166 ) ( TRUCK-AT ?auto_17172 ?auto_17170 ) ( not ( = ?auto_17165 ?auto_17166 ) ) ( not ( = ?auto_17165 ?auto_17179 ) ) ( not ( = ?auto_17166 ?auto_17179 ) ) ( not ( = ?auto_17165 ?auto_17167 ) ) ( not ( = ?auto_17165 ?auto_17177 ) ) ( not ( = ?auto_17167 ?auto_17179 ) ) ( not ( = ?auto_17181 ?auto_17180 ) ) ( not ( = ?auto_17176 ?auto_17182 ) ) ( not ( = ?auto_17177 ?auto_17179 ) ) ( not ( = ?auto_17165 ?auto_17168 ) ) ( not ( = ?auto_17165 ?auto_17178 ) ) ( not ( = ?auto_17166 ?auto_17168 ) ) ( not ( = ?auto_17166 ?auto_17178 ) ) ( not ( = ?auto_17168 ?auto_17177 ) ) ( not ( = ?auto_17168 ?auto_17179 ) ) ( not ( = ?auto_17178 ?auto_17177 ) ) ( not ( = ?auto_17178 ?auto_17179 ) ) ( not ( = ?auto_17165 ?auto_17169 ) ) ( not ( = ?auto_17165 ?auto_17173 ) ) ( not ( = ?auto_17166 ?auto_17169 ) ) ( not ( = ?auto_17166 ?auto_17173 ) ) ( not ( = ?auto_17167 ?auto_17169 ) ) ( not ( = ?auto_17167 ?auto_17173 ) ) ( not ( = ?auto_17169 ?auto_17178 ) ) ( not ( = ?auto_17169 ?auto_17177 ) ) ( not ( = ?auto_17169 ?auto_17179 ) ) ( not ( = ?auto_17174 ?auto_17180 ) ) ( not ( = ?auto_17174 ?auto_17181 ) ) ( not ( = ?auto_17175 ?auto_17182 ) ) ( not ( = ?auto_17175 ?auto_17176 ) ) ( not ( = ?auto_17173 ?auto_17178 ) ) ( not ( = ?auto_17173 ?auto_17177 ) ) ( not ( = ?auto_17173 ?auto_17179 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_17165 ?auto_17166 ?auto_17167 ?auto_17168 )
      ( MAKE-1CRATE ?auto_17168 ?auto_17169 )
      ( MAKE-4CRATE-VERIFY ?auto_17165 ?auto_17166 ?auto_17167 ?auto_17168 ?auto_17169 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17199 - SURFACE
      ?auto_17200 - SURFACE
      ?auto_17201 - SURFACE
      ?auto_17202 - SURFACE
      ?auto_17203 - SURFACE
      ?auto_17204 - SURFACE
    )
    :vars
    (
      ?auto_17205 - HOIST
      ?auto_17210 - PLACE
      ?auto_17206 - PLACE
      ?auto_17208 - HOIST
      ?auto_17209 - SURFACE
      ?auto_17214 - PLACE
      ?auto_17213 - HOIST
      ?auto_17219 - SURFACE
      ?auto_17215 - PLACE
      ?auto_17217 - HOIST
      ?auto_17220 - SURFACE
      ?auto_17216 - PLACE
      ?auto_17218 - HOIST
      ?auto_17211 - SURFACE
      ?auto_17212 - SURFACE
      ?auto_17207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17205 ?auto_17210 ) ( IS-CRATE ?auto_17204 ) ( not ( = ?auto_17206 ?auto_17210 ) ) ( HOIST-AT ?auto_17208 ?auto_17206 ) ( AVAILABLE ?auto_17208 ) ( SURFACE-AT ?auto_17204 ?auto_17206 ) ( ON ?auto_17204 ?auto_17209 ) ( CLEAR ?auto_17204 ) ( not ( = ?auto_17203 ?auto_17204 ) ) ( not ( = ?auto_17203 ?auto_17209 ) ) ( not ( = ?auto_17204 ?auto_17209 ) ) ( not ( = ?auto_17205 ?auto_17208 ) ) ( IS-CRATE ?auto_17203 ) ( not ( = ?auto_17214 ?auto_17210 ) ) ( HOIST-AT ?auto_17213 ?auto_17214 ) ( AVAILABLE ?auto_17213 ) ( SURFACE-AT ?auto_17203 ?auto_17214 ) ( ON ?auto_17203 ?auto_17219 ) ( CLEAR ?auto_17203 ) ( not ( = ?auto_17202 ?auto_17203 ) ) ( not ( = ?auto_17202 ?auto_17219 ) ) ( not ( = ?auto_17203 ?auto_17219 ) ) ( not ( = ?auto_17205 ?auto_17213 ) ) ( IS-CRATE ?auto_17202 ) ( not ( = ?auto_17215 ?auto_17210 ) ) ( HOIST-AT ?auto_17217 ?auto_17215 ) ( SURFACE-AT ?auto_17202 ?auto_17215 ) ( ON ?auto_17202 ?auto_17220 ) ( CLEAR ?auto_17202 ) ( not ( = ?auto_17201 ?auto_17202 ) ) ( not ( = ?auto_17201 ?auto_17220 ) ) ( not ( = ?auto_17202 ?auto_17220 ) ) ( not ( = ?auto_17205 ?auto_17217 ) ) ( IS-CRATE ?auto_17201 ) ( not ( = ?auto_17216 ?auto_17210 ) ) ( HOIST-AT ?auto_17218 ?auto_17216 ) ( AVAILABLE ?auto_17218 ) ( SURFACE-AT ?auto_17201 ?auto_17216 ) ( ON ?auto_17201 ?auto_17211 ) ( CLEAR ?auto_17201 ) ( not ( = ?auto_17200 ?auto_17201 ) ) ( not ( = ?auto_17200 ?auto_17211 ) ) ( not ( = ?auto_17201 ?auto_17211 ) ) ( not ( = ?auto_17205 ?auto_17218 ) ) ( SURFACE-AT ?auto_17199 ?auto_17210 ) ( CLEAR ?auto_17199 ) ( IS-CRATE ?auto_17200 ) ( AVAILABLE ?auto_17205 ) ( AVAILABLE ?auto_17217 ) ( SURFACE-AT ?auto_17200 ?auto_17215 ) ( ON ?auto_17200 ?auto_17212 ) ( CLEAR ?auto_17200 ) ( TRUCK-AT ?auto_17207 ?auto_17210 ) ( not ( = ?auto_17199 ?auto_17200 ) ) ( not ( = ?auto_17199 ?auto_17212 ) ) ( not ( = ?auto_17200 ?auto_17212 ) ) ( not ( = ?auto_17199 ?auto_17201 ) ) ( not ( = ?auto_17199 ?auto_17211 ) ) ( not ( = ?auto_17201 ?auto_17212 ) ) ( not ( = ?auto_17216 ?auto_17215 ) ) ( not ( = ?auto_17218 ?auto_17217 ) ) ( not ( = ?auto_17211 ?auto_17212 ) ) ( not ( = ?auto_17199 ?auto_17202 ) ) ( not ( = ?auto_17199 ?auto_17220 ) ) ( not ( = ?auto_17200 ?auto_17202 ) ) ( not ( = ?auto_17200 ?auto_17220 ) ) ( not ( = ?auto_17202 ?auto_17211 ) ) ( not ( = ?auto_17202 ?auto_17212 ) ) ( not ( = ?auto_17220 ?auto_17211 ) ) ( not ( = ?auto_17220 ?auto_17212 ) ) ( not ( = ?auto_17199 ?auto_17203 ) ) ( not ( = ?auto_17199 ?auto_17219 ) ) ( not ( = ?auto_17200 ?auto_17203 ) ) ( not ( = ?auto_17200 ?auto_17219 ) ) ( not ( = ?auto_17201 ?auto_17203 ) ) ( not ( = ?auto_17201 ?auto_17219 ) ) ( not ( = ?auto_17203 ?auto_17220 ) ) ( not ( = ?auto_17203 ?auto_17211 ) ) ( not ( = ?auto_17203 ?auto_17212 ) ) ( not ( = ?auto_17214 ?auto_17215 ) ) ( not ( = ?auto_17214 ?auto_17216 ) ) ( not ( = ?auto_17213 ?auto_17217 ) ) ( not ( = ?auto_17213 ?auto_17218 ) ) ( not ( = ?auto_17219 ?auto_17220 ) ) ( not ( = ?auto_17219 ?auto_17211 ) ) ( not ( = ?auto_17219 ?auto_17212 ) ) ( not ( = ?auto_17199 ?auto_17204 ) ) ( not ( = ?auto_17199 ?auto_17209 ) ) ( not ( = ?auto_17200 ?auto_17204 ) ) ( not ( = ?auto_17200 ?auto_17209 ) ) ( not ( = ?auto_17201 ?auto_17204 ) ) ( not ( = ?auto_17201 ?auto_17209 ) ) ( not ( = ?auto_17202 ?auto_17204 ) ) ( not ( = ?auto_17202 ?auto_17209 ) ) ( not ( = ?auto_17204 ?auto_17219 ) ) ( not ( = ?auto_17204 ?auto_17220 ) ) ( not ( = ?auto_17204 ?auto_17211 ) ) ( not ( = ?auto_17204 ?auto_17212 ) ) ( not ( = ?auto_17206 ?auto_17214 ) ) ( not ( = ?auto_17206 ?auto_17215 ) ) ( not ( = ?auto_17206 ?auto_17216 ) ) ( not ( = ?auto_17208 ?auto_17213 ) ) ( not ( = ?auto_17208 ?auto_17217 ) ) ( not ( = ?auto_17208 ?auto_17218 ) ) ( not ( = ?auto_17209 ?auto_17219 ) ) ( not ( = ?auto_17209 ?auto_17220 ) ) ( not ( = ?auto_17209 ?auto_17211 ) ) ( not ( = ?auto_17209 ?auto_17212 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_17199 ?auto_17200 ?auto_17201 ?auto_17202 ?auto_17203 )
      ( MAKE-1CRATE ?auto_17203 ?auto_17204 )
      ( MAKE-5CRATE-VERIFY ?auto_17199 ?auto_17200 ?auto_17201 ?auto_17202 ?auto_17203 ?auto_17204 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_17238 - SURFACE
      ?auto_17239 - SURFACE
      ?auto_17240 - SURFACE
      ?auto_17241 - SURFACE
      ?auto_17242 - SURFACE
      ?auto_17243 - SURFACE
      ?auto_17244 - SURFACE
    )
    :vars
    (
      ?auto_17248 - HOIST
      ?auto_17250 - PLACE
      ?auto_17247 - PLACE
      ?auto_17245 - HOIST
      ?auto_17246 - SURFACE
      ?auto_17263 - PLACE
      ?auto_17262 - HOIST
      ?auto_17255 - SURFACE
      ?auto_17256 - PLACE
      ?auto_17260 - HOIST
      ?auto_17254 - SURFACE
      ?auto_17261 - PLACE
      ?auto_17258 - HOIST
      ?auto_17252 - SURFACE
      ?auto_17251 - PLACE
      ?auto_17259 - HOIST
      ?auto_17253 - SURFACE
      ?auto_17257 - SURFACE
      ?auto_17249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17248 ?auto_17250 ) ( IS-CRATE ?auto_17244 ) ( not ( = ?auto_17247 ?auto_17250 ) ) ( HOIST-AT ?auto_17245 ?auto_17247 ) ( AVAILABLE ?auto_17245 ) ( SURFACE-AT ?auto_17244 ?auto_17247 ) ( ON ?auto_17244 ?auto_17246 ) ( CLEAR ?auto_17244 ) ( not ( = ?auto_17243 ?auto_17244 ) ) ( not ( = ?auto_17243 ?auto_17246 ) ) ( not ( = ?auto_17244 ?auto_17246 ) ) ( not ( = ?auto_17248 ?auto_17245 ) ) ( IS-CRATE ?auto_17243 ) ( not ( = ?auto_17263 ?auto_17250 ) ) ( HOIST-AT ?auto_17262 ?auto_17263 ) ( AVAILABLE ?auto_17262 ) ( SURFACE-AT ?auto_17243 ?auto_17263 ) ( ON ?auto_17243 ?auto_17255 ) ( CLEAR ?auto_17243 ) ( not ( = ?auto_17242 ?auto_17243 ) ) ( not ( = ?auto_17242 ?auto_17255 ) ) ( not ( = ?auto_17243 ?auto_17255 ) ) ( not ( = ?auto_17248 ?auto_17262 ) ) ( IS-CRATE ?auto_17242 ) ( not ( = ?auto_17256 ?auto_17250 ) ) ( HOIST-AT ?auto_17260 ?auto_17256 ) ( AVAILABLE ?auto_17260 ) ( SURFACE-AT ?auto_17242 ?auto_17256 ) ( ON ?auto_17242 ?auto_17254 ) ( CLEAR ?auto_17242 ) ( not ( = ?auto_17241 ?auto_17242 ) ) ( not ( = ?auto_17241 ?auto_17254 ) ) ( not ( = ?auto_17242 ?auto_17254 ) ) ( not ( = ?auto_17248 ?auto_17260 ) ) ( IS-CRATE ?auto_17241 ) ( not ( = ?auto_17261 ?auto_17250 ) ) ( HOIST-AT ?auto_17258 ?auto_17261 ) ( SURFACE-AT ?auto_17241 ?auto_17261 ) ( ON ?auto_17241 ?auto_17252 ) ( CLEAR ?auto_17241 ) ( not ( = ?auto_17240 ?auto_17241 ) ) ( not ( = ?auto_17240 ?auto_17252 ) ) ( not ( = ?auto_17241 ?auto_17252 ) ) ( not ( = ?auto_17248 ?auto_17258 ) ) ( IS-CRATE ?auto_17240 ) ( not ( = ?auto_17251 ?auto_17250 ) ) ( HOIST-AT ?auto_17259 ?auto_17251 ) ( AVAILABLE ?auto_17259 ) ( SURFACE-AT ?auto_17240 ?auto_17251 ) ( ON ?auto_17240 ?auto_17253 ) ( CLEAR ?auto_17240 ) ( not ( = ?auto_17239 ?auto_17240 ) ) ( not ( = ?auto_17239 ?auto_17253 ) ) ( not ( = ?auto_17240 ?auto_17253 ) ) ( not ( = ?auto_17248 ?auto_17259 ) ) ( SURFACE-AT ?auto_17238 ?auto_17250 ) ( CLEAR ?auto_17238 ) ( IS-CRATE ?auto_17239 ) ( AVAILABLE ?auto_17248 ) ( AVAILABLE ?auto_17258 ) ( SURFACE-AT ?auto_17239 ?auto_17261 ) ( ON ?auto_17239 ?auto_17257 ) ( CLEAR ?auto_17239 ) ( TRUCK-AT ?auto_17249 ?auto_17250 ) ( not ( = ?auto_17238 ?auto_17239 ) ) ( not ( = ?auto_17238 ?auto_17257 ) ) ( not ( = ?auto_17239 ?auto_17257 ) ) ( not ( = ?auto_17238 ?auto_17240 ) ) ( not ( = ?auto_17238 ?auto_17253 ) ) ( not ( = ?auto_17240 ?auto_17257 ) ) ( not ( = ?auto_17251 ?auto_17261 ) ) ( not ( = ?auto_17259 ?auto_17258 ) ) ( not ( = ?auto_17253 ?auto_17257 ) ) ( not ( = ?auto_17238 ?auto_17241 ) ) ( not ( = ?auto_17238 ?auto_17252 ) ) ( not ( = ?auto_17239 ?auto_17241 ) ) ( not ( = ?auto_17239 ?auto_17252 ) ) ( not ( = ?auto_17241 ?auto_17253 ) ) ( not ( = ?auto_17241 ?auto_17257 ) ) ( not ( = ?auto_17252 ?auto_17253 ) ) ( not ( = ?auto_17252 ?auto_17257 ) ) ( not ( = ?auto_17238 ?auto_17242 ) ) ( not ( = ?auto_17238 ?auto_17254 ) ) ( not ( = ?auto_17239 ?auto_17242 ) ) ( not ( = ?auto_17239 ?auto_17254 ) ) ( not ( = ?auto_17240 ?auto_17242 ) ) ( not ( = ?auto_17240 ?auto_17254 ) ) ( not ( = ?auto_17242 ?auto_17252 ) ) ( not ( = ?auto_17242 ?auto_17253 ) ) ( not ( = ?auto_17242 ?auto_17257 ) ) ( not ( = ?auto_17256 ?auto_17261 ) ) ( not ( = ?auto_17256 ?auto_17251 ) ) ( not ( = ?auto_17260 ?auto_17258 ) ) ( not ( = ?auto_17260 ?auto_17259 ) ) ( not ( = ?auto_17254 ?auto_17252 ) ) ( not ( = ?auto_17254 ?auto_17253 ) ) ( not ( = ?auto_17254 ?auto_17257 ) ) ( not ( = ?auto_17238 ?auto_17243 ) ) ( not ( = ?auto_17238 ?auto_17255 ) ) ( not ( = ?auto_17239 ?auto_17243 ) ) ( not ( = ?auto_17239 ?auto_17255 ) ) ( not ( = ?auto_17240 ?auto_17243 ) ) ( not ( = ?auto_17240 ?auto_17255 ) ) ( not ( = ?auto_17241 ?auto_17243 ) ) ( not ( = ?auto_17241 ?auto_17255 ) ) ( not ( = ?auto_17243 ?auto_17254 ) ) ( not ( = ?auto_17243 ?auto_17252 ) ) ( not ( = ?auto_17243 ?auto_17253 ) ) ( not ( = ?auto_17243 ?auto_17257 ) ) ( not ( = ?auto_17263 ?auto_17256 ) ) ( not ( = ?auto_17263 ?auto_17261 ) ) ( not ( = ?auto_17263 ?auto_17251 ) ) ( not ( = ?auto_17262 ?auto_17260 ) ) ( not ( = ?auto_17262 ?auto_17258 ) ) ( not ( = ?auto_17262 ?auto_17259 ) ) ( not ( = ?auto_17255 ?auto_17254 ) ) ( not ( = ?auto_17255 ?auto_17252 ) ) ( not ( = ?auto_17255 ?auto_17253 ) ) ( not ( = ?auto_17255 ?auto_17257 ) ) ( not ( = ?auto_17238 ?auto_17244 ) ) ( not ( = ?auto_17238 ?auto_17246 ) ) ( not ( = ?auto_17239 ?auto_17244 ) ) ( not ( = ?auto_17239 ?auto_17246 ) ) ( not ( = ?auto_17240 ?auto_17244 ) ) ( not ( = ?auto_17240 ?auto_17246 ) ) ( not ( = ?auto_17241 ?auto_17244 ) ) ( not ( = ?auto_17241 ?auto_17246 ) ) ( not ( = ?auto_17242 ?auto_17244 ) ) ( not ( = ?auto_17242 ?auto_17246 ) ) ( not ( = ?auto_17244 ?auto_17255 ) ) ( not ( = ?auto_17244 ?auto_17254 ) ) ( not ( = ?auto_17244 ?auto_17252 ) ) ( not ( = ?auto_17244 ?auto_17253 ) ) ( not ( = ?auto_17244 ?auto_17257 ) ) ( not ( = ?auto_17247 ?auto_17263 ) ) ( not ( = ?auto_17247 ?auto_17256 ) ) ( not ( = ?auto_17247 ?auto_17261 ) ) ( not ( = ?auto_17247 ?auto_17251 ) ) ( not ( = ?auto_17245 ?auto_17262 ) ) ( not ( = ?auto_17245 ?auto_17260 ) ) ( not ( = ?auto_17245 ?auto_17258 ) ) ( not ( = ?auto_17245 ?auto_17259 ) ) ( not ( = ?auto_17246 ?auto_17255 ) ) ( not ( = ?auto_17246 ?auto_17254 ) ) ( not ( = ?auto_17246 ?auto_17252 ) ) ( not ( = ?auto_17246 ?auto_17253 ) ) ( not ( = ?auto_17246 ?auto_17257 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_17238 ?auto_17239 ?auto_17240 ?auto_17241 ?auto_17242 ?auto_17243 )
      ( MAKE-1CRATE ?auto_17243 ?auto_17244 )
      ( MAKE-6CRATE-VERIFY ?auto_17238 ?auto_17239 ?auto_17240 ?auto_17241 ?auto_17242 ?auto_17243 ?auto_17244 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_17282 - SURFACE
      ?auto_17283 - SURFACE
      ?auto_17284 - SURFACE
      ?auto_17285 - SURFACE
      ?auto_17286 - SURFACE
      ?auto_17287 - SURFACE
      ?auto_17288 - SURFACE
      ?auto_17289 - SURFACE
    )
    :vars
    (
      ?auto_17293 - HOIST
      ?auto_17291 - PLACE
      ?auto_17290 - PLACE
      ?auto_17292 - HOIST
      ?auto_17294 - SURFACE
      ?auto_17308 - PLACE
      ?auto_17298 - HOIST
      ?auto_17307 - SURFACE
      ?auto_17302 - PLACE
      ?auto_17301 - HOIST
      ?auto_17306 - SURFACE
      ?auto_17305 - PLACE
      ?auto_17300 - HOIST
      ?auto_17299 - SURFACE
      ?auto_17311 - PLACE
      ?auto_17303 - HOIST
      ?auto_17297 - SURFACE
      ?auto_17309 - PLACE
      ?auto_17310 - HOIST
      ?auto_17296 - SURFACE
      ?auto_17304 - SURFACE
      ?auto_17295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17293 ?auto_17291 ) ( IS-CRATE ?auto_17289 ) ( not ( = ?auto_17290 ?auto_17291 ) ) ( HOIST-AT ?auto_17292 ?auto_17290 ) ( AVAILABLE ?auto_17292 ) ( SURFACE-AT ?auto_17289 ?auto_17290 ) ( ON ?auto_17289 ?auto_17294 ) ( CLEAR ?auto_17289 ) ( not ( = ?auto_17288 ?auto_17289 ) ) ( not ( = ?auto_17288 ?auto_17294 ) ) ( not ( = ?auto_17289 ?auto_17294 ) ) ( not ( = ?auto_17293 ?auto_17292 ) ) ( IS-CRATE ?auto_17288 ) ( not ( = ?auto_17308 ?auto_17291 ) ) ( HOIST-AT ?auto_17298 ?auto_17308 ) ( AVAILABLE ?auto_17298 ) ( SURFACE-AT ?auto_17288 ?auto_17308 ) ( ON ?auto_17288 ?auto_17307 ) ( CLEAR ?auto_17288 ) ( not ( = ?auto_17287 ?auto_17288 ) ) ( not ( = ?auto_17287 ?auto_17307 ) ) ( not ( = ?auto_17288 ?auto_17307 ) ) ( not ( = ?auto_17293 ?auto_17298 ) ) ( IS-CRATE ?auto_17287 ) ( not ( = ?auto_17302 ?auto_17291 ) ) ( HOIST-AT ?auto_17301 ?auto_17302 ) ( AVAILABLE ?auto_17301 ) ( SURFACE-AT ?auto_17287 ?auto_17302 ) ( ON ?auto_17287 ?auto_17306 ) ( CLEAR ?auto_17287 ) ( not ( = ?auto_17286 ?auto_17287 ) ) ( not ( = ?auto_17286 ?auto_17306 ) ) ( not ( = ?auto_17287 ?auto_17306 ) ) ( not ( = ?auto_17293 ?auto_17301 ) ) ( IS-CRATE ?auto_17286 ) ( not ( = ?auto_17305 ?auto_17291 ) ) ( HOIST-AT ?auto_17300 ?auto_17305 ) ( AVAILABLE ?auto_17300 ) ( SURFACE-AT ?auto_17286 ?auto_17305 ) ( ON ?auto_17286 ?auto_17299 ) ( CLEAR ?auto_17286 ) ( not ( = ?auto_17285 ?auto_17286 ) ) ( not ( = ?auto_17285 ?auto_17299 ) ) ( not ( = ?auto_17286 ?auto_17299 ) ) ( not ( = ?auto_17293 ?auto_17300 ) ) ( IS-CRATE ?auto_17285 ) ( not ( = ?auto_17311 ?auto_17291 ) ) ( HOIST-AT ?auto_17303 ?auto_17311 ) ( SURFACE-AT ?auto_17285 ?auto_17311 ) ( ON ?auto_17285 ?auto_17297 ) ( CLEAR ?auto_17285 ) ( not ( = ?auto_17284 ?auto_17285 ) ) ( not ( = ?auto_17284 ?auto_17297 ) ) ( not ( = ?auto_17285 ?auto_17297 ) ) ( not ( = ?auto_17293 ?auto_17303 ) ) ( IS-CRATE ?auto_17284 ) ( not ( = ?auto_17309 ?auto_17291 ) ) ( HOIST-AT ?auto_17310 ?auto_17309 ) ( AVAILABLE ?auto_17310 ) ( SURFACE-AT ?auto_17284 ?auto_17309 ) ( ON ?auto_17284 ?auto_17296 ) ( CLEAR ?auto_17284 ) ( not ( = ?auto_17283 ?auto_17284 ) ) ( not ( = ?auto_17283 ?auto_17296 ) ) ( not ( = ?auto_17284 ?auto_17296 ) ) ( not ( = ?auto_17293 ?auto_17310 ) ) ( SURFACE-AT ?auto_17282 ?auto_17291 ) ( CLEAR ?auto_17282 ) ( IS-CRATE ?auto_17283 ) ( AVAILABLE ?auto_17293 ) ( AVAILABLE ?auto_17303 ) ( SURFACE-AT ?auto_17283 ?auto_17311 ) ( ON ?auto_17283 ?auto_17304 ) ( CLEAR ?auto_17283 ) ( TRUCK-AT ?auto_17295 ?auto_17291 ) ( not ( = ?auto_17282 ?auto_17283 ) ) ( not ( = ?auto_17282 ?auto_17304 ) ) ( not ( = ?auto_17283 ?auto_17304 ) ) ( not ( = ?auto_17282 ?auto_17284 ) ) ( not ( = ?auto_17282 ?auto_17296 ) ) ( not ( = ?auto_17284 ?auto_17304 ) ) ( not ( = ?auto_17309 ?auto_17311 ) ) ( not ( = ?auto_17310 ?auto_17303 ) ) ( not ( = ?auto_17296 ?auto_17304 ) ) ( not ( = ?auto_17282 ?auto_17285 ) ) ( not ( = ?auto_17282 ?auto_17297 ) ) ( not ( = ?auto_17283 ?auto_17285 ) ) ( not ( = ?auto_17283 ?auto_17297 ) ) ( not ( = ?auto_17285 ?auto_17296 ) ) ( not ( = ?auto_17285 ?auto_17304 ) ) ( not ( = ?auto_17297 ?auto_17296 ) ) ( not ( = ?auto_17297 ?auto_17304 ) ) ( not ( = ?auto_17282 ?auto_17286 ) ) ( not ( = ?auto_17282 ?auto_17299 ) ) ( not ( = ?auto_17283 ?auto_17286 ) ) ( not ( = ?auto_17283 ?auto_17299 ) ) ( not ( = ?auto_17284 ?auto_17286 ) ) ( not ( = ?auto_17284 ?auto_17299 ) ) ( not ( = ?auto_17286 ?auto_17297 ) ) ( not ( = ?auto_17286 ?auto_17296 ) ) ( not ( = ?auto_17286 ?auto_17304 ) ) ( not ( = ?auto_17305 ?auto_17311 ) ) ( not ( = ?auto_17305 ?auto_17309 ) ) ( not ( = ?auto_17300 ?auto_17303 ) ) ( not ( = ?auto_17300 ?auto_17310 ) ) ( not ( = ?auto_17299 ?auto_17297 ) ) ( not ( = ?auto_17299 ?auto_17296 ) ) ( not ( = ?auto_17299 ?auto_17304 ) ) ( not ( = ?auto_17282 ?auto_17287 ) ) ( not ( = ?auto_17282 ?auto_17306 ) ) ( not ( = ?auto_17283 ?auto_17287 ) ) ( not ( = ?auto_17283 ?auto_17306 ) ) ( not ( = ?auto_17284 ?auto_17287 ) ) ( not ( = ?auto_17284 ?auto_17306 ) ) ( not ( = ?auto_17285 ?auto_17287 ) ) ( not ( = ?auto_17285 ?auto_17306 ) ) ( not ( = ?auto_17287 ?auto_17299 ) ) ( not ( = ?auto_17287 ?auto_17297 ) ) ( not ( = ?auto_17287 ?auto_17296 ) ) ( not ( = ?auto_17287 ?auto_17304 ) ) ( not ( = ?auto_17302 ?auto_17305 ) ) ( not ( = ?auto_17302 ?auto_17311 ) ) ( not ( = ?auto_17302 ?auto_17309 ) ) ( not ( = ?auto_17301 ?auto_17300 ) ) ( not ( = ?auto_17301 ?auto_17303 ) ) ( not ( = ?auto_17301 ?auto_17310 ) ) ( not ( = ?auto_17306 ?auto_17299 ) ) ( not ( = ?auto_17306 ?auto_17297 ) ) ( not ( = ?auto_17306 ?auto_17296 ) ) ( not ( = ?auto_17306 ?auto_17304 ) ) ( not ( = ?auto_17282 ?auto_17288 ) ) ( not ( = ?auto_17282 ?auto_17307 ) ) ( not ( = ?auto_17283 ?auto_17288 ) ) ( not ( = ?auto_17283 ?auto_17307 ) ) ( not ( = ?auto_17284 ?auto_17288 ) ) ( not ( = ?auto_17284 ?auto_17307 ) ) ( not ( = ?auto_17285 ?auto_17288 ) ) ( not ( = ?auto_17285 ?auto_17307 ) ) ( not ( = ?auto_17286 ?auto_17288 ) ) ( not ( = ?auto_17286 ?auto_17307 ) ) ( not ( = ?auto_17288 ?auto_17306 ) ) ( not ( = ?auto_17288 ?auto_17299 ) ) ( not ( = ?auto_17288 ?auto_17297 ) ) ( not ( = ?auto_17288 ?auto_17296 ) ) ( not ( = ?auto_17288 ?auto_17304 ) ) ( not ( = ?auto_17308 ?auto_17302 ) ) ( not ( = ?auto_17308 ?auto_17305 ) ) ( not ( = ?auto_17308 ?auto_17311 ) ) ( not ( = ?auto_17308 ?auto_17309 ) ) ( not ( = ?auto_17298 ?auto_17301 ) ) ( not ( = ?auto_17298 ?auto_17300 ) ) ( not ( = ?auto_17298 ?auto_17303 ) ) ( not ( = ?auto_17298 ?auto_17310 ) ) ( not ( = ?auto_17307 ?auto_17306 ) ) ( not ( = ?auto_17307 ?auto_17299 ) ) ( not ( = ?auto_17307 ?auto_17297 ) ) ( not ( = ?auto_17307 ?auto_17296 ) ) ( not ( = ?auto_17307 ?auto_17304 ) ) ( not ( = ?auto_17282 ?auto_17289 ) ) ( not ( = ?auto_17282 ?auto_17294 ) ) ( not ( = ?auto_17283 ?auto_17289 ) ) ( not ( = ?auto_17283 ?auto_17294 ) ) ( not ( = ?auto_17284 ?auto_17289 ) ) ( not ( = ?auto_17284 ?auto_17294 ) ) ( not ( = ?auto_17285 ?auto_17289 ) ) ( not ( = ?auto_17285 ?auto_17294 ) ) ( not ( = ?auto_17286 ?auto_17289 ) ) ( not ( = ?auto_17286 ?auto_17294 ) ) ( not ( = ?auto_17287 ?auto_17289 ) ) ( not ( = ?auto_17287 ?auto_17294 ) ) ( not ( = ?auto_17289 ?auto_17307 ) ) ( not ( = ?auto_17289 ?auto_17306 ) ) ( not ( = ?auto_17289 ?auto_17299 ) ) ( not ( = ?auto_17289 ?auto_17297 ) ) ( not ( = ?auto_17289 ?auto_17296 ) ) ( not ( = ?auto_17289 ?auto_17304 ) ) ( not ( = ?auto_17290 ?auto_17308 ) ) ( not ( = ?auto_17290 ?auto_17302 ) ) ( not ( = ?auto_17290 ?auto_17305 ) ) ( not ( = ?auto_17290 ?auto_17311 ) ) ( not ( = ?auto_17290 ?auto_17309 ) ) ( not ( = ?auto_17292 ?auto_17298 ) ) ( not ( = ?auto_17292 ?auto_17301 ) ) ( not ( = ?auto_17292 ?auto_17300 ) ) ( not ( = ?auto_17292 ?auto_17303 ) ) ( not ( = ?auto_17292 ?auto_17310 ) ) ( not ( = ?auto_17294 ?auto_17307 ) ) ( not ( = ?auto_17294 ?auto_17306 ) ) ( not ( = ?auto_17294 ?auto_17299 ) ) ( not ( = ?auto_17294 ?auto_17297 ) ) ( not ( = ?auto_17294 ?auto_17296 ) ) ( not ( = ?auto_17294 ?auto_17304 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_17282 ?auto_17283 ?auto_17284 ?auto_17285 ?auto_17286 ?auto_17287 ?auto_17288 )
      ( MAKE-1CRATE ?auto_17288 ?auto_17289 )
      ( MAKE-7CRATE-VERIFY ?auto_17282 ?auto_17283 ?auto_17284 ?auto_17285 ?auto_17286 ?auto_17287 ?auto_17288 ?auto_17289 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_17331 - SURFACE
      ?auto_17332 - SURFACE
      ?auto_17333 - SURFACE
      ?auto_17334 - SURFACE
      ?auto_17335 - SURFACE
      ?auto_17336 - SURFACE
      ?auto_17337 - SURFACE
      ?auto_17338 - SURFACE
      ?auto_17339 - SURFACE
    )
    :vars
    (
      ?auto_17342 - HOIST
      ?auto_17344 - PLACE
      ?auto_17341 - PLACE
      ?auto_17340 - HOIST
      ?auto_17345 - SURFACE
      ?auto_17348 - PLACE
      ?auto_17364 - HOIST
      ?auto_17347 - SURFACE
      ?auto_17353 - PLACE
      ?auto_17363 - HOIST
      ?auto_17352 - SURFACE
      ?auto_17356 - PLACE
      ?auto_17357 - HOIST
      ?auto_17350 - SURFACE
      ?auto_17351 - PLACE
      ?auto_17358 - HOIST
      ?auto_17362 - SURFACE
      ?auto_17346 - PLACE
      ?auto_17355 - HOIST
      ?auto_17361 - SURFACE
      ?auto_17354 - PLACE
      ?auto_17360 - HOIST
      ?auto_17359 - SURFACE
      ?auto_17349 - SURFACE
      ?auto_17343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17342 ?auto_17344 ) ( IS-CRATE ?auto_17339 ) ( not ( = ?auto_17341 ?auto_17344 ) ) ( HOIST-AT ?auto_17340 ?auto_17341 ) ( AVAILABLE ?auto_17340 ) ( SURFACE-AT ?auto_17339 ?auto_17341 ) ( ON ?auto_17339 ?auto_17345 ) ( CLEAR ?auto_17339 ) ( not ( = ?auto_17338 ?auto_17339 ) ) ( not ( = ?auto_17338 ?auto_17345 ) ) ( not ( = ?auto_17339 ?auto_17345 ) ) ( not ( = ?auto_17342 ?auto_17340 ) ) ( IS-CRATE ?auto_17338 ) ( not ( = ?auto_17348 ?auto_17344 ) ) ( HOIST-AT ?auto_17364 ?auto_17348 ) ( AVAILABLE ?auto_17364 ) ( SURFACE-AT ?auto_17338 ?auto_17348 ) ( ON ?auto_17338 ?auto_17347 ) ( CLEAR ?auto_17338 ) ( not ( = ?auto_17337 ?auto_17338 ) ) ( not ( = ?auto_17337 ?auto_17347 ) ) ( not ( = ?auto_17338 ?auto_17347 ) ) ( not ( = ?auto_17342 ?auto_17364 ) ) ( IS-CRATE ?auto_17337 ) ( not ( = ?auto_17353 ?auto_17344 ) ) ( HOIST-AT ?auto_17363 ?auto_17353 ) ( AVAILABLE ?auto_17363 ) ( SURFACE-AT ?auto_17337 ?auto_17353 ) ( ON ?auto_17337 ?auto_17352 ) ( CLEAR ?auto_17337 ) ( not ( = ?auto_17336 ?auto_17337 ) ) ( not ( = ?auto_17336 ?auto_17352 ) ) ( not ( = ?auto_17337 ?auto_17352 ) ) ( not ( = ?auto_17342 ?auto_17363 ) ) ( IS-CRATE ?auto_17336 ) ( not ( = ?auto_17356 ?auto_17344 ) ) ( HOIST-AT ?auto_17357 ?auto_17356 ) ( AVAILABLE ?auto_17357 ) ( SURFACE-AT ?auto_17336 ?auto_17356 ) ( ON ?auto_17336 ?auto_17350 ) ( CLEAR ?auto_17336 ) ( not ( = ?auto_17335 ?auto_17336 ) ) ( not ( = ?auto_17335 ?auto_17350 ) ) ( not ( = ?auto_17336 ?auto_17350 ) ) ( not ( = ?auto_17342 ?auto_17357 ) ) ( IS-CRATE ?auto_17335 ) ( not ( = ?auto_17351 ?auto_17344 ) ) ( HOIST-AT ?auto_17358 ?auto_17351 ) ( AVAILABLE ?auto_17358 ) ( SURFACE-AT ?auto_17335 ?auto_17351 ) ( ON ?auto_17335 ?auto_17362 ) ( CLEAR ?auto_17335 ) ( not ( = ?auto_17334 ?auto_17335 ) ) ( not ( = ?auto_17334 ?auto_17362 ) ) ( not ( = ?auto_17335 ?auto_17362 ) ) ( not ( = ?auto_17342 ?auto_17358 ) ) ( IS-CRATE ?auto_17334 ) ( not ( = ?auto_17346 ?auto_17344 ) ) ( HOIST-AT ?auto_17355 ?auto_17346 ) ( SURFACE-AT ?auto_17334 ?auto_17346 ) ( ON ?auto_17334 ?auto_17361 ) ( CLEAR ?auto_17334 ) ( not ( = ?auto_17333 ?auto_17334 ) ) ( not ( = ?auto_17333 ?auto_17361 ) ) ( not ( = ?auto_17334 ?auto_17361 ) ) ( not ( = ?auto_17342 ?auto_17355 ) ) ( IS-CRATE ?auto_17333 ) ( not ( = ?auto_17354 ?auto_17344 ) ) ( HOIST-AT ?auto_17360 ?auto_17354 ) ( AVAILABLE ?auto_17360 ) ( SURFACE-AT ?auto_17333 ?auto_17354 ) ( ON ?auto_17333 ?auto_17359 ) ( CLEAR ?auto_17333 ) ( not ( = ?auto_17332 ?auto_17333 ) ) ( not ( = ?auto_17332 ?auto_17359 ) ) ( not ( = ?auto_17333 ?auto_17359 ) ) ( not ( = ?auto_17342 ?auto_17360 ) ) ( SURFACE-AT ?auto_17331 ?auto_17344 ) ( CLEAR ?auto_17331 ) ( IS-CRATE ?auto_17332 ) ( AVAILABLE ?auto_17342 ) ( AVAILABLE ?auto_17355 ) ( SURFACE-AT ?auto_17332 ?auto_17346 ) ( ON ?auto_17332 ?auto_17349 ) ( CLEAR ?auto_17332 ) ( TRUCK-AT ?auto_17343 ?auto_17344 ) ( not ( = ?auto_17331 ?auto_17332 ) ) ( not ( = ?auto_17331 ?auto_17349 ) ) ( not ( = ?auto_17332 ?auto_17349 ) ) ( not ( = ?auto_17331 ?auto_17333 ) ) ( not ( = ?auto_17331 ?auto_17359 ) ) ( not ( = ?auto_17333 ?auto_17349 ) ) ( not ( = ?auto_17354 ?auto_17346 ) ) ( not ( = ?auto_17360 ?auto_17355 ) ) ( not ( = ?auto_17359 ?auto_17349 ) ) ( not ( = ?auto_17331 ?auto_17334 ) ) ( not ( = ?auto_17331 ?auto_17361 ) ) ( not ( = ?auto_17332 ?auto_17334 ) ) ( not ( = ?auto_17332 ?auto_17361 ) ) ( not ( = ?auto_17334 ?auto_17359 ) ) ( not ( = ?auto_17334 ?auto_17349 ) ) ( not ( = ?auto_17361 ?auto_17359 ) ) ( not ( = ?auto_17361 ?auto_17349 ) ) ( not ( = ?auto_17331 ?auto_17335 ) ) ( not ( = ?auto_17331 ?auto_17362 ) ) ( not ( = ?auto_17332 ?auto_17335 ) ) ( not ( = ?auto_17332 ?auto_17362 ) ) ( not ( = ?auto_17333 ?auto_17335 ) ) ( not ( = ?auto_17333 ?auto_17362 ) ) ( not ( = ?auto_17335 ?auto_17361 ) ) ( not ( = ?auto_17335 ?auto_17359 ) ) ( not ( = ?auto_17335 ?auto_17349 ) ) ( not ( = ?auto_17351 ?auto_17346 ) ) ( not ( = ?auto_17351 ?auto_17354 ) ) ( not ( = ?auto_17358 ?auto_17355 ) ) ( not ( = ?auto_17358 ?auto_17360 ) ) ( not ( = ?auto_17362 ?auto_17361 ) ) ( not ( = ?auto_17362 ?auto_17359 ) ) ( not ( = ?auto_17362 ?auto_17349 ) ) ( not ( = ?auto_17331 ?auto_17336 ) ) ( not ( = ?auto_17331 ?auto_17350 ) ) ( not ( = ?auto_17332 ?auto_17336 ) ) ( not ( = ?auto_17332 ?auto_17350 ) ) ( not ( = ?auto_17333 ?auto_17336 ) ) ( not ( = ?auto_17333 ?auto_17350 ) ) ( not ( = ?auto_17334 ?auto_17336 ) ) ( not ( = ?auto_17334 ?auto_17350 ) ) ( not ( = ?auto_17336 ?auto_17362 ) ) ( not ( = ?auto_17336 ?auto_17361 ) ) ( not ( = ?auto_17336 ?auto_17359 ) ) ( not ( = ?auto_17336 ?auto_17349 ) ) ( not ( = ?auto_17356 ?auto_17351 ) ) ( not ( = ?auto_17356 ?auto_17346 ) ) ( not ( = ?auto_17356 ?auto_17354 ) ) ( not ( = ?auto_17357 ?auto_17358 ) ) ( not ( = ?auto_17357 ?auto_17355 ) ) ( not ( = ?auto_17357 ?auto_17360 ) ) ( not ( = ?auto_17350 ?auto_17362 ) ) ( not ( = ?auto_17350 ?auto_17361 ) ) ( not ( = ?auto_17350 ?auto_17359 ) ) ( not ( = ?auto_17350 ?auto_17349 ) ) ( not ( = ?auto_17331 ?auto_17337 ) ) ( not ( = ?auto_17331 ?auto_17352 ) ) ( not ( = ?auto_17332 ?auto_17337 ) ) ( not ( = ?auto_17332 ?auto_17352 ) ) ( not ( = ?auto_17333 ?auto_17337 ) ) ( not ( = ?auto_17333 ?auto_17352 ) ) ( not ( = ?auto_17334 ?auto_17337 ) ) ( not ( = ?auto_17334 ?auto_17352 ) ) ( not ( = ?auto_17335 ?auto_17337 ) ) ( not ( = ?auto_17335 ?auto_17352 ) ) ( not ( = ?auto_17337 ?auto_17350 ) ) ( not ( = ?auto_17337 ?auto_17362 ) ) ( not ( = ?auto_17337 ?auto_17361 ) ) ( not ( = ?auto_17337 ?auto_17359 ) ) ( not ( = ?auto_17337 ?auto_17349 ) ) ( not ( = ?auto_17353 ?auto_17356 ) ) ( not ( = ?auto_17353 ?auto_17351 ) ) ( not ( = ?auto_17353 ?auto_17346 ) ) ( not ( = ?auto_17353 ?auto_17354 ) ) ( not ( = ?auto_17363 ?auto_17357 ) ) ( not ( = ?auto_17363 ?auto_17358 ) ) ( not ( = ?auto_17363 ?auto_17355 ) ) ( not ( = ?auto_17363 ?auto_17360 ) ) ( not ( = ?auto_17352 ?auto_17350 ) ) ( not ( = ?auto_17352 ?auto_17362 ) ) ( not ( = ?auto_17352 ?auto_17361 ) ) ( not ( = ?auto_17352 ?auto_17359 ) ) ( not ( = ?auto_17352 ?auto_17349 ) ) ( not ( = ?auto_17331 ?auto_17338 ) ) ( not ( = ?auto_17331 ?auto_17347 ) ) ( not ( = ?auto_17332 ?auto_17338 ) ) ( not ( = ?auto_17332 ?auto_17347 ) ) ( not ( = ?auto_17333 ?auto_17338 ) ) ( not ( = ?auto_17333 ?auto_17347 ) ) ( not ( = ?auto_17334 ?auto_17338 ) ) ( not ( = ?auto_17334 ?auto_17347 ) ) ( not ( = ?auto_17335 ?auto_17338 ) ) ( not ( = ?auto_17335 ?auto_17347 ) ) ( not ( = ?auto_17336 ?auto_17338 ) ) ( not ( = ?auto_17336 ?auto_17347 ) ) ( not ( = ?auto_17338 ?auto_17352 ) ) ( not ( = ?auto_17338 ?auto_17350 ) ) ( not ( = ?auto_17338 ?auto_17362 ) ) ( not ( = ?auto_17338 ?auto_17361 ) ) ( not ( = ?auto_17338 ?auto_17359 ) ) ( not ( = ?auto_17338 ?auto_17349 ) ) ( not ( = ?auto_17348 ?auto_17353 ) ) ( not ( = ?auto_17348 ?auto_17356 ) ) ( not ( = ?auto_17348 ?auto_17351 ) ) ( not ( = ?auto_17348 ?auto_17346 ) ) ( not ( = ?auto_17348 ?auto_17354 ) ) ( not ( = ?auto_17364 ?auto_17363 ) ) ( not ( = ?auto_17364 ?auto_17357 ) ) ( not ( = ?auto_17364 ?auto_17358 ) ) ( not ( = ?auto_17364 ?auto_17355 ) ) ( not ( = ?auto_17364 ?auto_17360 ) ) ( not ( = ?auto_17347 ?auto_17352 ) ) ( not ( = ?auto_17347 ?auto_17350 ) ) ( not ( = ?auto_17347 ?auto_17362 ) ) ( not ( = ?auto_17347 ?auto_17361 ) ) ( not ( = ?auto_17347 ?auto_17359 ) ) ( not ( = ?auto_17347 ?auto_17349 ) ) ( not ( = ?auto_17331 ?auto_17339 ) ) ( not ( = ?auto_17331 ?auto_17345 ) ) ( not ( = ?auto_17332 ?auto_17339 ) ) ( not ( = ?auto_17332 ?auto_17345 ) ) ( not ( = ?auto_17333 ?auto_17339 ) ) ( not ( = ?auto_17333 ?auto_17345 ) ) ( not ( = ?auto_17334 ?auto_17339 ) ) ( not ( = ?auto_17334 ?auto_17345 ) ) ( not ( = ?auto_17335 ?auto_17339 ) ) ( not ( = ?auto_17335 ?auto_17345 ) ) ( not ( = ?auto_17336 ?auto_17339 ) ) ( not ( = ?auto_17336 ?auto_17345 ) ) ( not ( = ?auto_17337 ?auto_17339 ) ) ( not ( = ?auto_17337 ?auto_17345 ) ) ( not ( = ?auto_17339 ?auto_17347 ) ) ( not ( = ?auto_17339 ?auto_17352 ) ) ( not ( = ?auto_17339 ?auto_17350 ) ) ( not ( = ?auto_17339 ?auto_17362 ) ) ( not ( = ?auto_17339 ?auto_17361 ) ) ( not ( = ?auto_17339 ?auto_17359 ) ) ( not ( = ?auto_17339 ?auto_17349 ) ) ( not ( = ?auto_17341 ?auto_17348 ) ) ( not ( = ?auto_17341 ?auto_17353 ) ) ( not ( = ?auto_17341 ?auto_17356 ) ) ( not ( = ?auto_17341 ?auto_17351 ) ) ( not ( = ?auto_17341 ?auto_17346 ) ) ( not ( = ?auto_17341 ?auto_17354 ) ) ( not ( = ?auto_17340 ?auto_17364 ) ) ( not ( = ?auto_17340 ?auto_17363 ) ) ( not ( = ?auto_17340 ?auto_17357 ) ) ( not ( = ?auto_17340 ?auto_17358 ) ) ( not ( = ?auto_17340 ?auto_17355 ) ) ( not ( = ?auto_17340 ?auto_17360 ) ) ( not ( = ?auto_17345 ?auto_17347 ) ) ( not ( = ?auto_17345 ?auto_17352 ) ) ( not ( = ?auto_17345 ?auto_17350 ) ) ( not ( = ?auto_17345 ?auto_17362 ) ) ( not ( = ?auto_17345 ?auto_17361 ) ) ( not ( = ?auto_17345 ?auto_17359 ) ) ( not ( = ?auto_17345 ?auto_17349 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_17331 ?auto_17332 ?auto_17333 ?auto_17334 ?auto_17335 ?auto_17336 ?auto_17337 ?auto_17338 )
      ( MAKE-1CRATE ?auto_17338 ?auto_17339 )
      ( MAKE-8CRATE-VERIFY ?auto_17331 ?auto_17332 ?auto_17333 ?auto_17334 ?auto_17335 ?auto_17336 ?auto_17337 ?auto_17338 ?auto_17339 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_17385 - SURFACE
      ?auto_17386 - SURFACE
      ?auto_17387 - SURFACE
      ?auto_17388 - SURFACE
      ?auto_17389 - SURFACE
      ?auto_17390 - SURFACE
      ?auto_17391 - SURFACE
      ?auto_17392 - SURFACE
      ?auto_17393 - SURFACE
      ?auto_17394 - SURFACE
    )
    :vars
    (
      ?auto_17399 - HOIST
      ?auto_17395 - PLACE
      ?auto_17396 - PLACE
      ?auto_17398 - HOIST
      ?auto_17397 - SURFACE
      ?auto_17401 - PLACE
      ?auto_17405 - HOIST
      ?auto_17414 - SURFACE
      ?auto_17409 - PLACE
      ?auto_17422 - HOIST
      ?auto_17408 - SURFACE
      ?auto_17417 - PLACE
      ?auto_17406 - HOIST
      ?auto_17418 - SURFACE
      ?auto_17404 - PLACE
      ?auto_17402 - HOIST
      ?auto_17420 - SURFACE
      ?auto_17419 - PLACE
      ?auto_17415 - HOIST
      ?auto_17410 - SURFACE
      ?auto_17413 - PLACE
      ?auto_17403 - HOIST
      ?auto_17412 - SURFACE
      ?auto_17411 - PLACE
      ?auto_17407 - HOIST
      ?auto_17416 - SURFACE
      ?auto_17421 - SURFACE
      ?auto_17400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17399 ?auto_17395 ) ( IS-CRATE ?auto_17394 ) ( not ( = ?auto_17396 ?auto_17395 ) ) ( HOIST-AT ?auto_17398 ?auto_17396 ) ( AVAILABLE ?auto_17398 ) ( SURFACE-AT ?auto_17394 ?auto_17396 ) ( ON ?auto_17394 ?auto_17397 ) ( CLEAR ?auto_17394 ) ( not ( = ?auto_17393 ?auto_17394 ) ) ( not ( = ?auto_17393 ?auto_17397 ) ) ( not ( = ?auto_17394 ?auto_17397 ) ) ( not ( = ?auto_17399 ?auto_17398 ) ) ( IS-CRATE ?auto_17393 ) ( not ( = ?auto_17401 ?auto_17395 ) ) ( HOIST-AT ?auto_17405 ?auto_17401 ) ( AVAILABLE ?auto_17405 ) ( SURFACE-AT ?auto_17393 ?auto_17401 ) ( ON ?auto_17393 ?auto_17414 ) ( CLEAR ?auto_17393 ) ( not ( = ?auto_17392 ?auto_17393 ) ) ( not ( = ?auto_17392 ?auto_17414 ) ) ( not ( = ?auto_17393 ?auto_17414 ) ) ( not ( = ?auto_17399 ?auto_17405 ) ) ( IS-CRATE ?auto_17392 ) ( not ( = ?auto_17409 ?auto_17395 ) ) ( HOIST-AT ?auto_17422 ?auto_17409 ) ( AVAILABLE ?auto_17422 ) ( SURFACE-AT ?auto_17392 ?auto_17409 ) ( ON ?auto_17392 ?auto_17408 ) ( CLEAR ?auto_17392 ) ( not ( = ?auto_17391 ?auto_17392 ) ) ( not ( = ?auto_17391 ?auto_17408 ) ) ( not ( = ?auto_17392 ?auto_17408 ) ) ( not ( = ?auto_17399 ?auto_17422 ) ) ( IS-CRATE ?auto_17391 ) ( not ( = ?auto_17417 ?auto_17395 ) ) ( HOIST-AT ?auto_17406 ?auto_17417 ) ( AVAILABLE ?auto_17406 ) ( SURFACE-AT ?auto_17391 ?auto_17417 ) ( ON ?auto_17391 ?auto_17418 ) ( CLEAR ?auto_17391 ) ( not ( = ?auto_17390 ?auto_17391 ) ) ( not ( = ?auto_17390 ?auto_17418 ) ) ( not ( = ?auto_17391 ?auto_17418 ) ) ( not ( = ?auto_17399 ?auto_17406 ) ) ( IS-CRATE ?auto_17390 ) ( not ( = ?auto_17404 ?auto_17395 ) ) ( HOIST-AT ?auto_17402 ?auto_17404 ) ( AVAILABLE ?auto_17402 ) ( SURFACE-AT ?auto_17390 ?auto_17404 ) ( ON ?auto_17390 ?auto_17420 ) ( CLEAR ?auto_17390 ) ( not ( = ?auto_17389 ?auto_17390 ) ) ( not ( = ?auto_17389 ?auto_17420 ) ) ( not ( = ?auto_17390 ?auto_17420 ) ) ( not ( = ?auto_17399 ?auto_17402 ) ) ( IS-CRATE ?auto_17389 ) ( not ( = ?auto_17419 ?auto_17395 ) ) ( HOIST-AT ?auto_17415 ?auto_17419 ) ( AVAILABLE ?auto_17415 ) ( SURFACE-AT ?auto_17389 ?auto_17419 ) ( ON ?auto_17389 ?auto_17410 ) ( CLEAR ?auto_17389 ) ( not ( = ?auto_17388 ?auto_17389 ) ) ( not ( = ?auto_17388 ?auto_17410 ) ) ( not ( = ?auto_17389 ?auto_17410 ) ) ( not ( = ?auto_17399 ?auto_17415 ) ) ( IS-CRATE ?auto_17388 ) ( not ( = ?auto_17413 ?auto_17395 ) ) ( HOIST-AT ?auto_17403 ?auto_17413 ) ( SURFACE-AT ?auto_17388 ?auto_17413 ) ( ON ?auto_17388 ?auto_17412 ) ( CLEAR ?auto_17388 ) ( not ( = ?auto_17387 ?auto_17388 ) ) ( not ( = ?auto_17387 ?auto_17412 ) ) ( not ( = ?auto_17388 ?auto_17412 ) ) ( not ( = ?auto_17399 ?auto_17403 ) ) ( IS-CRATE ?auto_17387 ) ( not ( = ?auto_17411 ?auto_17395 ) ) ( HOIST-AT ?auto_17407 ?auto_17411 ) ( AVAILABLE ?auto_17407 ) ( SURFACE-AT ?auto_17387 ?auto_17411 ) ( ON ?auto_17387 ?auto_17416 ) ( CLEAR ?auto_17387 ) ( not ( = ?auto_17386 ?auto_17387 ) ) ( not ( = ?auto_17386 ?auto_17416 ) ) ( not ( = ?auto_17387 ?auto_17416 ) ) ( not ( = ?auto_17399 ?auto_17407 ) ) ( SURFACE-AT ?auto_17385 ?auto_17395 ) ( CLEAR ?auto_17385 ) ( IS-CRATE ?auto_17386 ) ( AVAILABLE ?auto_17399 ) ( AVAILABLE ?auto_17403 ) ( SURFACE-AT ?auto_17386 ?auto_17413 ) ( ON ?auto_17386 ?auto_17421 ) ( CLEAR ?auto_17386 ) ( TRUCK-AT ?auto_17400 ?auto_17395 ) ( not ( = ?auto_17385 ?auto_17386 ) ) ( not ( = ?auto_17385 ?auto_17421 ) ) ( not ( = ?auto_17386 ?auto_17421 ) ) ( not ( = ?auto_17385 ?auto_17387 ) ) ( not ( = ?auto_17385 ?auto_17416 ) ) ( not ( = ?auto_17387 ?auto_17421 ) ) ( not ( = ?auto_17411 ?auto_17413 ) ) ( not ( = ?auto_17407 ?auto_17403 ) ) ( not ( = ?auto_17416 ?auto_17421 ) ) ( not ( = ?auto_17385 ?auto_17388 ) ) ( not ( = ?auto_17385 ?auto_17412 ) ) ( not ( = ?auto_17386 ?auto_17388 ) ) ( not ( = ?auto_17386 ?auto_17412 ) ) ( not ( = ?auto_17388 ?auto_17416 ) ) ( not ( = ?auto_17388 ?auto_17421 ) ) ( not ( = ?auto_17412 ?auto_17416 ) ) ( not ( = ?auto_17412 ?auto_17421 ) ) ( not ( = ?auto_17385 ?auto_17389 ) ) ( not ( = ?auto_17385 ?auto_17410 ) ) ( not ( = ?auto_17386 ?auto_17389 ) ) ( not ( = ?auto_17386 ?auto_17410 ) ) ( not ( = ?auto_17387 ?auto_17389 ) ) ( not ( = ?auto_17387 ?auto_17410 ) ) ( not ( = ?auto_17389 ?auto_17412 ) ) ( not ( = ?auto_17389 ?auto_17416 ) ) ( not ( = ?auto_17389 ?auto_17421 ) ) ( not ( = ?auto_17419 ?auto_17413 ) ) ( not ( = ?auto_17419 ?auto_17411 ) ) ( not ( = ?auto_17415 ?auto_17403 ) ) ( not ( = ?auto_17415 ?auto_17407 ) ) ( not ( = ?auto_17410 ?auto_17412 ) ) ( not ( = ?auto_17410 ?auto_17416 ) ) ( not ( = ?auto_17410 ?auto_17421 ) ) ( not ( = ?auto_17385 ?auto_17390 ) ) ( not ( = ?auto_17385 ?auto_17420 ) ) ( not ( = ?auto_17386 ?auto_17390 ) ) ( not ( = ?auto_17386 ?auto_17420 ) ) ( not ( = ?auto_17387 ?auto_17390 ) ) ( not ( = ?auto_17387 ?auto_17420 ) ) ( not ( = ?auto_17388 ?auto_17390 ) ) ( not ( = ?auto_17388 ?auto_17420 ) ) ( not ( = ?auto_17390 ?auto_17410 ) ) ( not ( = ?auto_17390 ?auto_17412 ) ) ( not ( = ?auto_17390 ?auto_17416 ) ) ( not ( = ?auto_17390 ?auto_17421 ) ) ( not ( = ?auto_17404 ?auto_17419 ) ) ( not ( = ?auto_17404 ?auto_17413 ) ) ( not ( = ?auto_17404 ?auto_17411 ) ) ( not ( = ?auto_17402 ?auto_17415 ) ) ( not ( = ?auto_17402 ?auto_17403 ) ) ( not ( = ?auto_17402 ?auto_17407 ) ) ( not ( = ?auto_17420 ?auto_17410 ) ) ( not ( = ?auto_17420 ?auto_17412 ) ) ( not ( = ?auto_17420 ?auto_17416 ) ) ( not ( = ?auto_17420 ?auto_17421 ) ) ( not ( = ?auto_17385 ?auto_17391 ) ) ( not ( = ?auto_17385 ?auto_17418 ) ) ( not ( = ?auto_17386 ?auto_17391 ) ) ( not ( = ?auto_17386 ?auto_17418 ) ) ( not ( = ?auto_17387 ?auto_17391 ) ) ( not ( = ?auto_17387 ?auto_17418 ) ) ( not ( = ?auto_17388 ?auto_17391 ) ) ( not ( = ?auto_17388 ?auto_17418 ) ) ( not ( = ?auto_17389 ?auto_17391 ) ) ( not ( = ?auto_17389 ?auto_17418 ) ) ( not ( = ?auto_17391 ?auto_17420 ) ) ( not ( = ?auto_17391 ?auto_17410 ) ) ( not ( = ?auto_17391 ?auto_17412 ) ) ( not ( = ?auto_17391 ?auto_17416 ) ) ( not ( = ?auto_17391 ?auto_17421 ) ) ( not ( = ?auto_17417 ?auto_17404 ) ) ( not ( = ?auto_17417 ?auto_17419 ) ) ( not ( = ?auto_17417 ?auto_17413 ) ) ( not ( = ?auto_17417 ?auto_17411 ) ) ( not ( = ?auto_17406 ?auto_17402 ) ) ( not ( = ?auto_17406 ?auto_17415 ) ) ( not ( = ?auto_17406 ?auto_17403 ) ) ( not ( = ?auto_17406 ?auto_17407 ) ) ( not ( = ?auto_17418 ?auto_17420 ) ) ( not ( = ?auto_17418 ?auto_17410 ) ) ( not ( = ?auto_17418 ?auto_17412 ) ) ( not ( = ?auto_17418 ?auto_17416 ) ) ( not ( = ?auto_17418 ?auto_17421 ) ) ( not ( = ?auto_17385 ?auto_17392 ) ) ( not ( = ?auto_17385 ?auto_17408 ) ) ( not ( = ?auto_17386 ?auto_17392 ) ) ( not ( = ?auto_17386 ?auto_17408 ) ) ( not ( = ?auto_17387 ?auto_17392 ) ) ( not ( = ?auto_17387 ?auto_17408 ) ) ( not ( = ?auto_17388 ?auto_17392 ) ) ( not ( = ?auto_17388 ?auto_17408 ) ) ( not ( = ?auto_17389 ?auto_17392 ) ) ( not ( = ?auto_17389 ?auto_17408 ) ) ( not ( = ?auto_17390 ?auto_17392 ) ) ( not ( = ?auto_17390 ?auto_17408 ) ) ( not ( = ?auto_17392 ?auto_17418 ) ) ( not ( = ?auto_17392 ?auto_17420 ) ) ( not ( = ?auto_17392 ?auto_17410 ) ) ( not ( = ?auto_17392 ?auto_17412 ) ) ( not ( = ?auto_17392 ?auto_17416 ) ) ( not ( = ?auto_17392 ?auto_17421 ) ) ( not ( = ?auto_17409 ?auto_17417 ) ) ( not ( = ?auto_17409 ?auto_17404 ) ) ( not ( = ?auto_17409 ?auto_17419 ) ) ( not ( = ?auto_17409 ?auto_17413 ) ) ( not ( = ?auto_17409 ?auto_17411 ) ) ( not ( = ?auto_17422 ?auto_17406 ) ) ( not ( = ?auto_17422 ?auto_17402 ) ) ( not ( = ?auto_17422 ?auto_17415 ) ) ( not ( = ?auto_17422 ?auto_17403 ) ) ( not ( = ?auto_17422 ?auto_17407 ) ) ( not ( = ?auto_17408 ?auto_17418 ) ) ( not ( = ?auto_17408 ?auto_17420 ) ) ( not ( = ?auto_17408 ?auto_17410 ) ) ( not ( = ?auto_17408 ?auto_17412 ) ) ( not ( = ?auto_17408 ?auto_17416 ) ) ( not ( = ?auto_17408 ?auto_17421 ) ) ( not ( = ?auto_17385 ?auto_17393 ) ) ( not ( = ?auto_17385 ?auto_17414 ) ) ( not ( = ?auto_17386 ?auto_17393 ) ) ( not ( = ?auto_17386 ?auto_17414 ) ) ( not ( = ?auto_17387 ?auto_17393 ) ) ( not ( = ?auto_17387 ?auto_17414 ) ) ( not ( = ?auto_17388 ?auto_17393 ) ) ( not ( = ?auto_17388 ?auto_17414 ) ) ( not ( = ?auto_17389 ?auto_17393 ) ) ( not ( = ?auto_17389 ?auto_17414 ) ) ( not ( = ?auto_17390 ?auto_17393 ) ) ( not ( = ?auto_17390 ?auto_17414 ) ) ( not ( = ?auto_17391 ?auto_17393 ) ) ( not ( = ?auto_17391 ?auto_17414 ) ) ( not ( = ?auto_17393 ?auto_17408 ) ) ( not ( = ?auto_17393 ?auto_17418 ) ) ( not ( = ?auto_17393 ?auto_17420 ) ) ( not ( = ?auto_17393 ?auto_17410 ) ) ( not ( = ?auto_17393 ?auto_17412 ) ) ( not ( = ?auto_17393 ?auto_17416 ) ) ( not ( = ?auto_17393 ?auto_17421 ) ) ( not ( = ?auto_17401 ?auto_17409 ) ) ( not ( = ?auto_17401 ?auto_17417 ) ) ( not ( = ?auto_17401 ?auto_17404 ) ) ( not ( = ?auto_17401 ?auto_17419 ) ) ( not ( = ?auto_17401 ?auto_17413 ) ) ( not ( = ?auto_17401 ?auto_17411 ) ) ( not ( = ?auto_17405 ?auto_17422 ) ) ( not ( = ?auto_17405 ?auto_17406 ) ) ( not ( = ?auto_17405 ?auto_17402 ) ) ( not ( = ?auto_17405 ?auto_17415 ) ) ( not ( = ?auto_17405 ?auto_17403 ) ) ( not ( = ?auto_17405 ?auto_17407 ) ) ( not ( = ?auto_17414 ?auto_17408 ) ) ( not ( = ?auto_17414 ?auto_17418 ) ) ( not ( = ?auto_17414 ?auto_17420 ) ) ( not ( = ?auto_17414 ?auto_17410 ) ) ( not ( = ?auto_17414 ?auto_17412 ) ) ( not ( = ?auto_17414 ?auto_17416 ) ) ( not ( = ?auto_17414 ?auto_17421 ) ) ( not ( = ?auto_17385 ?auto_17394 ) ) ( not ( = ?auto_17385 ?auto_17397 ) ) ( not ( = ?auto_17386 ?auto_17394 ) ) ( not ( = ?auto_17386 ?auto_17397 ) ) ( not ( = ?auto_17387 ?auto_17394 ) ) ( not ( = ?auto_17387 ?auto_17397 ) ) ( not ( = ?auto_17388 ?auto_17394 ) ) ( not ( = ?auto_17388 ?auto_17397 ) ) ( not ( = ?auto_17389 ?auto_17394 ) ) ( not ( = ?auto_17389 ?auto_17397 ) ) ( not ( = ?auto_17390 ?auto_17394 ) ) ( not ( = ?auto_17390 ?auto_17397 ) ) ( not ( = ?auto_17391 ?auto_17394 ) ) ( not ( = ?auto_17391 ?auto_17397 ) ) ( not ( = ?auto_17392 ?auto_17394 ) ) ( not ( = ?auto_17392 ?auto_17397 ) ) ( not ( = ?auto_17394 ?auto_17414 ) ) ( not ( = ?auto_17394 ?auto_17408 ) ) ( not ( = ?auto_17394 ?auto_17418 ) ) ( not ( = ?auto_17394 ?auto_17420 ) ) ( not ( = ?auto_17394 ?auto_17410 ) ) ( not ( = ?auto_17394 ?auto_17412 ) ) ( not ( = ?auto_17394 ?auto_17416 ) ) ( not ( = ?auto_17394 ?auto_17421 ) ) ( not ( = ?auto_17396 ?auto_17401 ) ) ( not ( = ?auto_17396 ?auto_17409 ) ) ( not ( = ?auto_17396 ?auto_17417 ) ) ( not ( = ?auto_17396 ?auto_17404 ) ) ( not ( = ?auto_17396 ?auto_17419 ) ) ( not ( = ?auto_17396 ?auto_17413 ) ) ( not ( = ?auto_17396 ?auto_17411 ) ) ( not ( = ?auto_17398 ?auto_17405 ) ) ( not ( = ?auto_17398 ?auto_17422 ) ) ( not ( = ?auto_17398 ?auto_17406 ) ) ( not ( = ?auto_17398 ?auto_17402 ) ) ( not ( = ?auto_17398 ?auto_17415 ) ) ( not ( = ?auto_17398 ?auto_17403 ) ) ( not ( = ?auto_17398 ?auto_17407 ) ) ( not ( = ?auto_17397 ?auto_17414 ) ) ( not ( = ?auto_17397 ?auto_17408 ) ) ( not ( = ?auto_17397 ?auto_17418 ) ) ( not ( = ?auto_17397 ?auto_17420 ) ) ( not ( = ?auto_17397 ?auto_17410 ) ) ( not ( = ?auto_17397 ?auto_17412 ) ) ( not ( = ?auto_17397 ?auto_17416 ) ) ( not ( = ?auto_17397 ?auto_17421 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_17385 ?auto_17386 ?auto_17387 ?auto_17388 ?auto_17389 ?auto_17390 ?auto_17391 ?auto_17392 ?auto_17393 )
      ( MAKE-1CRATE ?auto_17393 ?auto_17394 )
      ( MAKE-9CRATE-VERIFY ?auto_17385 ?auto_17386 ?auto_17387 ?auto_17388 ?auto_17389 ?auto_17390 ?auto_17391 ?auto_17392 ?auto_17393 ?auto_17394 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_17444 - SURFACE
      ?auto_17445 - SURFACE
      ?auto_17446 - SURFACE
      ?auto_17447 - SURFACE
      ?auto_17448 - SURFACE
      ?auto_17449 - SURFACE
      ?auto_17450 - SURFACE
      ?auto_17451 - SURFACE
      ?auto_17452 - SURFACE
      ?auto_17453 - SURFACE
      ?auto_17454 - SURFACE
    )
    :vars
    (
      ?auto_17457 - HOIST
      ?auto_17458 - PLACE
      ?auto_17459 - PLACE
      ?auto_17460 - HOIST
      ?auto_17456 - SURFACE
      ?auto_17483 - PLACE
      ?auto_17477 - HOIST
      ?auto_17480 - SURFACE
      ?auto_17484 - PLACE
      ?auto_17462 - HOIST
      ?auto_17465 - SURFACE
      ?auto_17473 - PLACE
      ?auto_17485 - HOIST
      ?auto_17472 - SURFACE
      ?auto_17471 - PLACE
      ?auto_17463 - HOIST
      ?auto_17479 - SURFACE
      ?auto_17482 - PLACE
      ?auto_17461 - HOIST
      ?auto_17470 - SURFACE
      ?auto_17481 - PLACE
      ?auto_17464 - HOIST
      ?auto_17467 - SURFACE
      ?auto_17469 - PLACE
      ?auto_17476 - HOIST
      ?auto_17478 - SURFACE
      ?auto_17468 - PLACE
      ?auto_17466 - HOIST
      ?auto_17474 - SURFACE
      ?auto_17475 - SURFACE
      ?auto_17455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17457 ?auto_17458 ) ( IS-CRATE ?auto_17454 ) ( not ( = ?auto_17459 ?auto_17458 ) ) ( HOIST-AT ?auto_17460 ?auto_17459 ) ( AVAILABLE ?auto_17460 ) ( SURFACE-AT ?auto_17454 ?auto_17459 ) ( ON ?auto_17454 ?auto_17456 ) ( CLEAR ?auto_17454 ) ( not ( = ?auto_17453 ?auto_17454 ) ) ( not ( = ?auto_17453 ?auto_17456 ) ) ( not ( = ?auto_17454 ?auto_17456 ) ) ( not ( = ?auto_17457 ?auto_17460 ) ) ( IS-CRATE ?auto_17453 ) ( not ( = ?auto_17483 ?auto_17458 ) ) ( HOIST-AT ?auto_17477 ?auto_17483 ) ( AVAILABLE ?auto_17477 ) ( SURFACE-AT ?auto_17453 ?auto_17483 ) ( ON ?auto_17453 ?auto_17480 ) ( CLEAR ?auto_17453 ) ( not ( = ?auto_17452 ?auto_17453 ) ) ( not ( = ?auto_17452 ?auto_17480 ) ) ( not ( = ?auto_17453 ?auto_17480 ) ) ( not ( = ?auto_17457 ?auto_17477 ) ) ( IS-CRATE ?auto_17452 ) ( not ( = ?auto_17484 ?auto_17458 ) ) ( HOIST-AT ?auto_17462 ?auto_17484 ) ( AVAILABLE ?auto_17462 ) ( SURFACE-AT ?auto_17452 ?auto_17484 ) ( ON ?auto_17452 ?auto_17465 ) ( CLEAR ?auto_17452 ) ( not ( = ?auto_17451 ?auto_17452 ) ) ( not ( = ?auto_17451 ?auto_17465 ) ) ( not ( = ?auto_17452 ?auto_17465 ) ) ( not ( = ?auto_17457 ?auto_17462 ) ) ( IS-CRATE ?auto_17451 ) ( not ( = ?auto_17473 ?auto_17458 ) ) ( HOIST-AT ?auto_17485 ?auto_17473 ) ( AVAILABLE ?auto_17485 ) ( SURFACE-AT ?auto_17451 ?auto_17473 ) ( ON ?auto_17451 ?auto_17472 ) ( CLEAR ?auto_17451 ) ( not ( = ?auto_17450 ?auto_17451 ) ) ( not ( = ?auto_17450 ?auto_17472 ) ) ( not ( = ?auto_17451 ?auto_17472 ) ) ( not ( = ?auto_17457 ?auto_17485 ) ) ( IS-CRATE ?auto_17450 ) ( not ( = ?auto_17471 ?auto_17458 ) ) ( HOIST-AT ?auto_17463 ?auto_17471 ) ( AVAILABLE ?auto_17463 ) ( SURFACE-AT ?auto_17450 ?auto_17471 ) ( ON ?auto_17450 ?auto_17479 ) ( CLEAR ?auto_17450 ) ( not ( = ?auto_17449 ?auto_17450 ) ) ( not ( = ?auto_17449 ?auto_17479 ) ) ( not ( = ?auto_17450 ?auto_17479 ) ) ( not ( = ?auto_17457 ?auto_17463 ) ) ( IS-CRATE ?auto_17449 ) ( not ( = ?auto_17482 ?auto_17458 ) ) ( HOIST-AT ?auto_17461 ?auto_17482 ) ( AVAILABLE ?auto_17461 ) ( SURFACE-AT ?auto_17449 ?auto_17482 ) ( ON ?auto_17449 ?auto_17470 ) ( CLEAR ?auto_17449 ) ( not ( = ?auto_17448 ?auto_17449 ) ) ( not ( = ?auto_17448 ?auto_17470 ) ) ( not ( = ?auto_17449 ?auto_17470 ) ) ( not ( = ?auto_17457 ?auto_17461 ) ) ( IS-CRATE ?auto_17448 ) ( not ( = ?auto_17481 ?auto_17458 ) ) ( HOIST-AT ?auto_17464 ?auto_17481 ) ( AVAILABLE ?auto_17464 ) ( SURFACE-AT ?auto_17448 ?auto_17481 ) ( ON ?auto_17448 ?auto_17467 ) ( CLEAR ?auto_17448 ) ( not ( = ?auto_17447 ?auto_17448 ) ) ( not ( = ?auto_17447 ?auto_17467 ) ) ( not ( = ?auto_17448 ?auto_17467 ) ) ( not ( = ?auto_17457 ?auto_17464 ) ) ( IS-CRATE ?auto_17447 ) ( not ( = ?auto_17469 ?auto_17458 ) ) ( HOIST-AT ?auto_17476 ?auto_17469 ) ( SURFACE-AT ?auto_17447 ?auto_17469 ) ( ON ?auto_17447 ?auto_17478 ) ( CLEAR ?auto_17447 ) ( not ( = ?auto_17446 ?auto_17447 ) ) ( not ( = ?auto_17446 ?auto_17478 ) ) ( not ( = ?auto_17447 ?auto_17478 ) ) ( not ( = ?auto_17457 ?auto_17476 ) ) ( IS-CRATE ?auto_17446 ) ( not ( = ?auto_17468 ?auto_17458 ) ) ( HOIST-AT ?auto_17466 ?auto_17468 ) ( AVAILABLE ?auto_17466 ) ( SURFACE-AT ?auto_17446 ?auto_17468 ) ( ON ?auto_17446 ?auto_17474 ) ( CLEAR ?auto_17446 ) ( not ( = ?auto_17445 ?auto_17446 ) ) ( not ( = ?auto_17445 ?auto_17474 ) ) ( not ( = ?auto_17446 ?auto_17474 ) ) ( not ( = ?auto_17457 ?auto_17466 ) ) ( SURFACE-AT ?auto_17444 ?auto_17458 ) ( CLEAR ?auto_17444 ) ( IS-CRATE ?auto_17445 ) ( AVAILABLE ?auto_17457 ) ( AVAILABLE ?auto_17476 ) ( SURFACE-AT ?auto_17445 ?auto_17469 ) ( ON ?auto_17445 ?auto_17475 ) ( CLEAR ?auto_17445 ) ( TRUCK-AT ?auto_17455 ?auto_17458 ) ( not ( = ?auto_17444 ?auto_17445 ) ) ( not ( = ?auto_17444 ?auto_17475 ) ) ( not ( = ?auto_17445 ?auto_17475 ) ) ( not ( = ?auto_17444 ?auto_17446 ) ) ( not ( = ?auto_17444 ?auto_17474 ) ) ( not ( = ?auto_17446 ?auto_17475 ) ) ( not ( = ?auto_17468 ?auto_17469 ) ) ( not ( = ?auto_17466 ?auto_17476 ) ) ( not ( = ?auto_17474 ?auto_17475 ) ) ( not ( = ?auto_17444 ?auto_17447 ) ) ( not ( = ?auto_17444 ?auto_17478 ) ) ( not ( = ?auto_17445 ?auto_17447 ) ) ( not ( = ?auto_17445 ?auto_17478 ) ) ( not ( = ?auto_17447 ?auto_17474 ) ) ( not ( = ?auto_17447 ?auto_17475 ) ) ( not ( = ?auto_17478 ?auto_17474 ) ) ( not ( = ?auto_17478 ?auto_17475 ) ) ( not ( = ?auto_17444 ?auto_17448 ) ) ( not ( = ?auto_17444 ?auto_17467 ) ) ( not ( = ?auto_17445 ?auto_17448 ) ) ( not ( = ?auto_17445 ?auto_17467 ) ) ( not ( = ?auto_17446 ?auto_17448 ) ) ( not ( = ?auto_17446 ?auto_17467 ) ) ( not ( = ?auto_17448 ?auto_17478 ) ) ( not ( = ?auto_17448 ?auto_17474 ) ) ( not ( = ?auto_17448 ?auto_17475 ) ) ( not ( = ?auto_17481 ?auto_17469 ) ) ( not ( = ?auto_17481 ?auto_17468 ) ) ( not ( = ?auto_17464 ?auto_17476 ) ) ( not ( = ?auto_17464 ?auto_17466 ) ) ( not ( = ?auto_17467 ?auto_17478 ) ) ( not ( = ?auto_17467 ?auto_17474 ) ) ( not ( = ?auto_17467 ?auto_17475 ) ) ( not ( = ?auto_17444 ?auto_17449 ) ) ( not ( = ?auto_17444 ?auto_17470 ) ) ( not ( = ?auto_17445 ?auto_17449 ) ) ( not ( = ?auto_17445 ?auto_17470 ) ) ( not ( = ?auto_17446 ?auto_17449 ) ) ( not ( = ?auto_17446 ?auto_17470 ) ) ( not ( = ?auto_17447 ?auto_17449 ) ) ( not ( = ?auto_17447 ?auto_17470 ) ) ( not ( = ?auto_17449 ?auto_17467 ) ) ( not ( = ?auto_17449 ?auto_17478 ) ) ( not ( = ?auto_17449 ?auto_17474 ) ) ( not ( = ?auto_17449 ?auto_17475 ) ) ( not ( = ?auto_17482 ?auto_17481 ) ) ( not ( = ?auto_17482 ?auto_17469 ) ) ( not ( = ?auto_17482 ?auto_17468 ) ) ( not ( = ?auto_17461 ?auto_17464 ) ) ( not ( = ?auto_17461 ?auto_17476 ) ) ( not ( = ?auto_17461 ?auto_17466 ) ) ( not ( = ?auto_17470 ?auto_17467 ) ) ( not ( = ?auto_17470 ?auto_17478 ) ) ( not ( = ?auto_17470 ?auto_17474 ) ) ( not ( = ?auto_17470 ?auto_17475 ) ) ( not ( = ?auto_17444 ?auto_17450 ) ) ( not ( = ?auto_17444 ?auto_17479 ) ) ( not ( = ?auto_17445 ?auto_17450 ) ) ( not ( = ?auto_17445 ?auto_17479 ) ) ( not ( = ?auto_17446 ?auto_17450 ) ) ( not ( = ?auto_17446 ?auto_17479 ) ) ( not ( = ?auto_17447 ?auto_17450 ) ) ( not ( = ?auto_17447 ?auto_17479 ) ) ( not ( = ?auto_17448 ?auto_17450 ) ) ( not ( = ?auto_17448 ?auto_17479 ) ) ( not ( = ?auto_17450 ?auto_17470 ) ) ( not ( = ?auto_17450 ?auto_17467 ) ) ( not ( = ?auto_17450 ?auto_17478 ) ) ( not ( = ?auto_17450 ?auto_17474 ) ) ( not ( = ?auto_17450 ?auto_17475 ) ) ( not ( = ?auto_17471 ?auto_17482 ) ) ( not ( = ?auto_17471 ?auto_17481 ) ) ( not ( = ?auto_17471 ?auto_17469 ) ) ( not ( = ?auto_17471 ?auto_17468 ) ) ( not ( = ?auto_17463 ?auto_17461 ) ) ( not ( = ?auto_17463 ?auto_17464 ) ) ( not ( = ?auto_17463 ?auto_17476 ) ) ( not ( = ?auto_17463 ?auto_17466 ) ) ( not ( = ?auto_17479 ?auto_17470 ) ) ( not ( = ?auto_17479 ?auto_17467 ) ) ( not ( = ?auto_17479 ?auto_17478 ) ) ( not ( = ?auto_17479 ?auto_17474 ) ) ( not ( = ?auto_17479 ?auto_17475 ) ) ( not ( = ?auto_17444 ?auto_17451 ) ) ( not ( = ?auto_17444 ?auto_17472 ) ) ( not ( = ?auto_17445 ?auto_17451 ) ) ( not ( = ?auto_17445 ?auto_17472 ) ) ( not ( = ?auto_17446 ?auto_17451 ) ) ( not ( = ?auto_17446 ?auto_17472 ) ) ( not ( = ?auto_17447 ?auto_17451 ) ) ( not ( = ?auto_17447 ?auto_17472 ) ) ( not ( = ?auto_17448 ?auto_17451 ) ) ( not ( = ?auto_17448 ?auto_17472 ) ) ( not ( = ?auto_17449 ?auto_17451 ) ) ( not ( = ?auto_17449 ?auto_17472 ) ) ( not ( = ?auto_17451 ?auto_17479 ) ) ( not ( = ?auto_17451 ?auto_17470 ) ) ( not ( = ?auto_17451 ?auto_17467 ) ) ( not ( = ?auto_17451 ?auto_17478 ) ) ( not ( = ?auto_17451 ?auto_17474 ) ) ( not ( = ?auto_17451 ?auto_17475 ) ) ( not ( = ?auto_17473 ?auto_17471 ) ) ( not ( = ?auto_17473 ?auto_17482 ) ) ( not ( = ?auto_17473 ?auto_17481 ) ) ( not ( = ?auto_17473 ?auto_17469 ) ) ( not ( = ?auto_17473 ?auto_17468 ) ) ( not ( = ?auto_17485 ?auto_17463 ) ) ( not ( = ?auto_17485 ?auto_17461 ) ) ( not ( = ?auto_17485 ?auto_17464 ) ) ( not ( = ?auto_17485 ?auto_17476 ) ) ( not ( = ?auto_17485 ?auto_17466 ) ) ( not ( = ?auto_17472 ?auto_17479 ) ) ( not ( = ?auto_17472 ?auto_17470 ) ) ( not ( = ?auto_17472 ?auto_17467 ) ) ( not ( = ?auto_17472 ?auto_17478 ) ) ( not ( = ?auto_17472 ?auto_17474 ) ) ( not ( = ?auto_17472 ?auto_17475 ) ) ( not ( = ?auto_17444 ?auto_17452 ) ) ( not ( = ?auto_17444 ?auto_17465 ) ) ( not ( = ?auto_17445 ?auto_17452 ) ) ( not ( = ?auto_17445 ?auto_17465 ) ) ( not ( = ?auto_17446 ?auto_17452 ) ) ( not ( = ?auto_17446 ?auto_17465 ) ) ( not ( = ?auto_17447 ?auto_17452 ) ) ( not ( = ?auto_17447 ?auto_17465 ) ) ( not ( = ?auto_17448 ?auto_17452 ) ) ( not ( = ?auto_17448 ?auto_17465 ) ) ( not ( = ?auto_17449 ?auto_17452 ) ) ( not ( = ?auto_17449 ?auto_17465 ) ) ( not ( = ?auto_17450 ?auto_17452 ) ) ( not ( = ?auto_17450 ?auto_17465 ) ) ( not ( = ?auto_17452 ?auto_17472 ) ) ( not ( = ?auto_17452 ?auto_17479 ) ) ( not ( = ?auto_17452 ?auto_17470 ) ) ( not ( = ?auto_17452 ?auto_17467 ) ) ( not ( = ?auto_17452 ?auto_17478 ) ) ( not ( = ?auto_17452 ?auto_17474 ) ) ( not ( = ?auto_17452 ?auto_17475 ) ) ( not ( = ?auto_17484 ?auto_17473 ) ) ( not ( = ?auto_17484 ?auto_17471 ) ) ( not ( = ?auto_17484 ?auto_17482 ) ) ( not ( = ?auto_17484 ?auto_17481 ) ) ( not ( = ?auto_17484 ?auto_17469 ) ) ( not ( = ?auto_17484 ?auto_17468 ) ) ( not ( = ?auto_17462 ?auto_17485 ) ) ( not ( = ?auto_17462 ?auto_17463 ) ) ( not ( = ?auto_17462 ?auto_17461 ) ) ( not ( = ?auto_17462 ?auto_17464 ) ) ( not ( = ?auto_17462 ?auto_17476 ) ) ( not ( = ?auto_17462 ?auto_17466 ) ) ( not ( = ?auto_17465 ?auto_17472 ) ) ( not ( = ?auto_17465 ?auto_17479 ) ) ( not ( = ?auto_17465 ?auto_17470 ) ) ( not ( = ?auto_17465 ?auto_17467 ) ) ( not ( = ?auto_17465 ?auto_17478 ) ) ( not ( = ?auto_17465 ?auto_17474 ) ) ( not ( = ?auto_17465 ?auto_17475 ) ) ( not ( = ?auto_17444 ?auto_17453 ) ) ( not ( = ?auto_17444 ?auto_17480 ) ) ( not ( = ?auto_17445 ?auto_17453 ) ) ( not ( = ?auto_17445 ?auto_17480 ) ) ( not ( = ?auto_17446 ?auto_17453 ) ) ( not ( = ?auto_17446 ?auto_17480 ) ) ( not ( = ?auto_17447 ?auto_17453 ) ) ( not ( = ?auto_17447 ?auto_17480 ) ) ( not ( = ?auto_17448 ?auto_17453 ) ) ( not ( = ?auto_17448 ?auto_17480 ) ) ( not ( = ?auto_17449 ?auto_17453 ) ) ( not ( = ?auto_17449 ?auto_17480 ) ) ( not ( = ?auto_17450 ?auto_17453 ) ) ( not ( = ?auto_17450 ?auto_17480 ) ) ( not ( = ?auto_17451 ?auto_17453 ) ) ( not ( = ?auto_17451 ?auto_17480 ) ) ( not ( = ?auto_17453 ?auto_17465 ) ) ( not ( = ?auto_17453 ?auto_17472 ) ) ( not ( = ?auto_17453 ?auto_17479 ) ) ( not ( = ?auto_17453 ?auto_17470 ) ) ( not ( = ?auto_17453 ?auto_17467 ) ) ( not ( = ?auto_17453 ?auto_17478 ) ) ( not ( = ?auto_17453 ?auto_17474 ) ) ( not ( = ?auto_17453 ?auto_17475 ) ) ( not ( = ?auto_17483 ?auto_17484 ) ) ( not ( = ?auto_17483 ?auto_17473 ) ) ( not ( = ?auto_17483 ?auto_17471 ) ) ( not ( = ?auto_17483 ?auto_17482 ) ) ( not ( = ?auto_17483 ?auto_17481 ) ) ( not ( = ?auto_17483 ?auto_17469 ) ) ( not ( = ?auto_17483 ?auto_17468 ) ) ( not ( = ?auto_17477 ?auto_17462 ) ) ( not ( = ?auto_17477 ?auto_17485 ) ) ( not ( = ?auto_17477 ?auto_17463 ) ) ( not ( = ?auto_17477 ?auto_17461 ) ) ( not ( = ?auto_17477 ?auto_17464 ) ) ( not ( = ?auto_17477 ?auto_17476 ) ) ( not ( = ?auto_17477 ?auto_17466 ) ) ( not ( = ?auto_17480 ?auto_17465 ) ) ( not ( = ?auto_17480 ?auto_17472 ) ) ( not ( = ?auto_17480 ?auto_17479 ) ) ( not ( = ?auto_17480 ?auto_17470 ) ) ( not ( = ?auto_17480 ?auto_17467 ) ) ( not ( = ?auto_17480 ?auto_17478 ) ) ( not ( = ?auto_17480 ?auto_17474 ) ) ( not ( = ?auto_17480 ?auto_17475 ) ) ( not ( = ?auto_17444 ?auto_17454 ) ) ( not ( = ?auto_17444 ?auto_17456 ) ) ( not ( = ?auto_17445 ?auto_17454 ) ) ( not ( = ?auto_17445 ?auto_17456 ) ) ( not ( = ?auto_17446 ?auto_17454 ) ) ( not ( = ?auto_17446 ?auto_17456 ) ) ( not ( = ?auto_17447 ?auto_17454 ) ) ( not ( = ?auto_17447 ?auto_17456 ) ) ( not ( = ?auto_17448 ?auto_17454 ) ) ( not ( = ?auto_17448 ?auto_17456 ) ) ( not ( = ?auto_17449 ?auto_17454 ) ) ( not ( = ?auto_17449 ?auto_17456 ) ) ( not ( = ?auto_17450 ?auto_17454 ) ) ( not ( = ?auto_17450 ?auto_17456 ) ) ( not ( = ?auto_17451 ?auto_17454 ) ) ( not ( = ?auto_17451 ?auto_17456 ) ) ( not ( = ?auto_17452 ?auto_17454 ) ) ( not ( = ?auto_17452 ?auto_17456 ) ) ( not ( = ?auto_17454 ?auto_17480 ) ) ( not ( = ?auto_17454 ?auto_17465 ) ) ( not ( = ?auto_17454 ?auto_17472 ) ) ( not ( = ?auto_17454 ?auto_17479 ) ) ( not ( = ?auto_17454 ?auto_17470 ) ) ( not ( = ?auto_17454 ?auto_17467 ) ) ( not ( = ?auto_17454 ?auto_17478 ) ) ( not ( = ?auto_17454 ?auto_17474 ) ) ( not ( = ?auto_17454 ?auto_17475 ) ) ( not ( = ?auto_17459 ?auto_17483 ) ) ( not ( = ?auto_17459 ?auto_17484 ) ) ( not ( = ?auto_17459 ?auto_17473 ) ) ( not ( = ?auto_17459 ?auto_17471 ) ) ( not ( = ?auto_17459 ?auto_17482 ) ) ( not ( = ?auto_17459 ?auto_17481 ) ) ( not ( = ?auto_17459 ?auto_17469 ) ) ( not ( = ?auto_17459 ?auto_17468 ) ) ( not ( = ?auto_17460 ?auto_17477 ) ) ( not ( = ?auto_17460 ?auto_17462 ) ) ( not ( = ?auto_17460 ?auto_17485 ) ) ( not ( = ?auto_17460 ?auto_17463 ) ) ( not ( = ?auto_17460 ?auto_17461 ) ) ( not ( = ?auto_17460 ?auto_17464 ) ) ( not ( = ?auto_17460 ?auto_17476 ) ) ( not ( = ?auto_17460 ?auto_17466 ) ) ( not ( = ?auto_17456 ?auto_17480 ) ) ( not ( = ?auto_17456 ?auto_17465 ) ) ( not ( = ?auto_17456 ?auto_17472 ) ) ( not ( = ?auto_17456 ?auto_17479 ) ) ( not ( = ?auto_17456 ?auto_17470 ) ) ( not ( = ?auto_17456 ?auto_17467 ) ) ( not ( = ?auto_17456 ?auto_17478 ) ) ( not ( = ?auto_17456 ?auto_17474 ) ) ( not ( = ?auto_17456 ?auto_17475 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_17444 ?auto_17445 ?auto_17446 ?auto_17447 ?auto_17448 ?auto_17449 ?auto_17450 ?auto_17451 ?auto_17452 ?auto_17453 )
      ( MAKE-1CRATE ?auto_17453 ?auto_17454 )
      ( MAKE-10CRATE-VERIFY ?auto_17444 ?auto_17445 ?auto_17446 ?auto_17447 ?auto_17448 ?auto_17449 ?auto_17450 ?auto_17451 ?auto_17452 ?auto_17453 ?auto_17454 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_17508 - SURFACE
      ?auto_17509 - SURFACE
      ?auto_17510 - SURFACE
      ?auto_17511 - SURFACE
      ?auto_17512 - SURFACE
      ?auto_17513 - SURFACE
      ?auto_17514 - SURFACE
      ?auto_17515 - SURFACE
      ?auto_17516 - SURFACE
      ?auto_17517 - SURFACE
      ?auto_17518 - SURFACE
      ?auto_17519 - SURFACE
    )
    :vars
    (
      ?auto_17522 - HOIST
      ?auto_17521 - PLACE
      ?auto_17520 - PLACE
      ?auto_17523 - HOIST
      ?auto_17524 - SURFACE
      ?auto_17544 - PLACE
      ?auto_17526 - HOIST
      ?auto_17553 - SURFACE
      ?auto_17527 - PLACE
      ?auto_17538 - HOIST
      ?auto_17549 - SURFACE
      ?auto_17531 - PLACE
      ?auto_17529 - HOIST
      ?auto_17543 - SURFACE
      ?auto_17535 - PLACE
      ?auto_17552 - HOIST
      ?auto_17541 - SURFACE
      ?auto_17547 - PLACE
      ?auto_17540 - HOIST
      ?auto_17539 - SURFACE
      ?auto_17548 - PLACE
      ?auto_17533 - HOIST
      ?auto_17537 - SURFACE
      ?auto_17550 - PLACE
      ?auto_17534 - HOIST
      ?auto_17530 - SURFACE
      ?auto_17545 - PLACE
      ?auto_17528 - HOIST
      ?auto_17542 - SURFACE
      ?auto_17551 - PLACE
      ?auto_17532 - HOIST
      ?auto_17536 - SURFACE
      ?auto_17546 - SURFACE
      ?auto_17525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17522 ?auto_17521 ) ( IS-CRATE ?auto_17519 ) ( not ( = ?auto_17520 ?auto_17521 ) ) ( HOIST-AT ?auto_17523 ?auto_17520 ) ( AVAILABLE ?auto_17523 ) ( SURFACE-AT ?auto_17519 ?auto_17520 ) ( ON ?auto_17519 ?auto_17524 ) ( CLEAR ?auto_17519 ) ( not ( = ?auto_17518 ?auto_17519 ) ) ( not ( = ?auto_17518 ?auto_17524 ) ) ( not ( = ?auto_17519 ?auto_17524 ) ) ( not ( = ?auto_17522 ?auto_17523 ) ) ( IS-CRATE ?auto_17518 ) ( not ( = ?auto_17544 ?auto_17521 ) ) ( HOIST-AT ?auto_17526 ?auto_17544 ) ( AVAILABLE ?auto_17526 ) ( SURFACE-AT ?auto_17518 ?auto_17544 ) ( ON ?auto_17518 ?auto_17553 ) ( CLEAR ?auto_17518 ) ( not ( = ?auto_17517 ?auto_17518 ) ) ( not ( = ?auto_17517 ?auto_17553 ) ) ( not ( = ?auto_17518 ?auto_17553 ) ) ( not ( = ?auto_17522 ?auto_17526 ) ) ( IS-CRATE ?auto_17517 ) ( not ( = ?auto_17527 ?auto_17521 ) ) ( HOIST-AT ?auto_17538 ?auto_17527 ) ( AVAILABLE ?auto_17538 ) ( SURFACE-AT ?auto_17517 ?auto_17527 ) ( ON ?auto_17517 ?auto_17549 ) ( CLEAR ?auto_17517 ) ( not ( = ?auto_17516 ?auto_17517 ) ) ( not ( = ?auto_17516 ?auto_17549 ) ) ( not ( = ?auto_17517 ?auto_17549 ) ) ( not ( = ?auto_17522 ?auto_17538 ) ) ( IS-CRATE ?auto_17516 ) ( not ( = ?auto_17531 ?auto_17521 ) ) ( HOIST-AT ?auto_17529 ?auto_17531 ) ( AVAILABLE ?auto_17529 ) ( SURFACE-AT ?auto_17516 ?auto_17531 ) ( ON ?auto_17516 ?auto_17543 ) ( CLEAR ?auto_17516 ) ( not ( = ?auto_17515 ?auto_17516 ) ) ( not ( = ?auto_17515 ?auto_17543 ) ) ( not ( = ?auto_17516 ?auto_17543 ) ) ( not ( = ?auto_17522 ?auto_17529 ) ) ( IS-CRATE ?auto_17515 ) ( not ( = ?auto_17535 ?auto_17521 ) ) ( HOIST-AT ?auto_17552 ?auto_17535 ) ( AVAILABLE ?auto_17552 ) ( SURFACE-AT ?auto_17515 ?auto_17535 ) ( ON ?auto_17515 ?auto_17541 ) ( CLEAR ?auto_17515 ) ( not ( = ?auto_17514 ?auto_17515 ) ) ( not ( = ?auto_17514 ?auto_17541 ) ) ( not ( = ?auto_17515 ?auto_17541 ) ) ( not ( = ?auto_17522 ?auto_17552 ) ) ( IS-CRATE ?auto_17514 ) ( not ( = ?auto_17547 ?auto_17521 ) ) ( HOIST-AT ?auto_17540 ?auto_17547 ) ( AVAILABLE ?auto_17540 ) ( SURFACE-AT ?auto_17514 ?auto_17547 ) ( ON ?auto_17514 ?auto_17539 ) ( CLEAR ?auto_17514 ) ( not ( = ?auto_17513 ?auto_17514 ) ) ( not ( = ?auto_17513 ?auto_17539 ) ) ( not ( = ?auto_17514 ?auto_17539 ) ) ( not ( = ?auto_17522 ?auto_17540 ) ) ( IS-CRATE ?auto_17513 ) ( not ( = ?auto_17548 ?auto_17521 ) ) ( HOIST-AT ?auto_17533 ?auto_17548 ) ( AVAILABLE ?auto_17533 ) ( SURFACE-AT ?auto_17513 ?auto_17548 ) ( ON ?auto_17513 ?auto_17537 ) ( CLEAR ?auto_17513 ) ( not ( = ?auto_17512 ?auto_17513 ) ) ( not ( = ?auto_17512 ?auto_17537 ) ) ( not ( = ?auto_17513 ?auto_17537 ) ) ( not ( = ?auto_17522 ?auto_17533 ) ) ( IS-CRATE ?auto_17512 ) ( not ( = ?auto_17550 ?auto_17521 ) ) ( HOIST-AT ?auto_17534 ?auto_17550 ) ( AVAILABLE ?auto_17534 ) ( SURFACE-AT ?auto_17512 ?auto_17550 ) ( ON ?auto_17512 ?auto_17530 ) ( CLEAR ?auto_17512 ) ( not ( = ?auto_17511 ?auto_17512 ) ) ( not ( = ?auto_17511 ?auto_17530 ) ) ( not ( = ?auto_17512 ?auto_17530 ) ) ( not ( = ?auto_17522 ?auto_17534 ) ) ( IS-CRATE ?auto_17511 ) ( not ( = ?auto_17545 ?auto_17521 ) ) ( HOIST-AT ?auto_17528 ?auto_17545 ) ( SURFACE-AT ?auto_17511 ?auto_17545 ) ( ON ?auto_17511 ?auto_17542 ) ( CLEAR ?auto_17511 ) ( not ( = ?auto_17510 ?auto_17511 ) ) ( not ( = ?auto_17510 ?auto_17542 ) ) ( not ( = ?auto_17511 ?auto_17542 ) ) ( not ( = ?auto_17522 ?auto_17528 ) ) ( IS-CRATE ?auto_17510 ) ( not ( = ?auto_17551 ?auto_17521 ) ) ( HOIST-AT ?auto_17532 ?auto_17551 ) ( AVAILABLE ?auto_17532 ) ( SURFACE-AT ?auto_17510 ?auto_17551 ) ( ON ?auto_17510 ?auto_17536 ) ( CLEAR ?auto_17510 ) ( not ( = ?auto_17509 ?auto_17510 ) ) ( not ( = ?auto_17509 ?auto_17536 ) ) ( not ( = ?auto_17510 ?auto_17536 ) ) ( not ( = ?auto_17522 ?auto_17532 ) ) ( SURFACE-AT ?auto_17508 ?auto_17521 ) ( CLEAR ?auto_17508 ) ( IS-CRATE ?auto_17509 ) ( AVAILABLE ?auto_17522 ) ( AVAILABLE ?auto_17528 ) ( SURFACE-AT ?auto_17509 ?auto_17545 ) ( ON ?auto_17509 ?auto_17546 ) ( CLEAR ?auto_17509 ) ( TRUCK-AT ?auto_17525 ?auto_17521 ) ( not ( = ?auto_17508 ?auto_17509 ) ) ( not ( = ?auto_17508 ?auto_17546 ) ) ( not ( = ?auto_17509 ?auto_17546 ) ) ( not ( = ?auto_17508 ?auto_17510 ) ) ( not ( = ?auto_17508 ?auto_17536 ) ) ( not ( = ?auto_17510 ?auto_17546 ) ) ( not ( = ?auto_17551 ?auto_17545 ) ) ( not ( = ?auto_17532 ?auto_17528 ) ) ( not ( = ?auto_17536 ?auto_17546 ) ) ( not ( = ?auto_17508 ?auto_17511 ) ) ( not ( = ?auto_17508 ?auto_17542 ) ) ( not ( = ?auto_17509 ?auto_17511 ) ) ( not ( = ?auto_17509 ?auto_17542 ) ) ( not ( = ?auto_17511 ?auto_17536 ) ) ( not ( = ?auto_17511 ?auto_17546 ) ) ( not ( = ?auto_17542 ?auto_17536 ) ) ( not ( = ?auto_17542 ?auto_17546 ) ) ( not ( = ?auto_17508 ?auto_17512 ) ) ( not ( = ?auto_17508 ?auto_17530 ) ) ( not ( = ?auto_17509 ?auto_17512 ) ) ( not ( = ?auto_17509 ?auto_17530 ) ) ( not ( = ?auto_17510 ?auto_17512 ) ) ( not ( = ?auto_17510 ?auto_17530 ) ) ( not ( = ?auto_17512 ?auto_17542 ) ) ( not ( = ?auto_17512 ?auto_17536 ) ) ( not ( = ?auto_17512 ?auto_17546 ) ) ( not ( = ?auto_17550 ?auto_17545 ) ) ( not ( = ?auto_17550 ?auto_17551 ) ) ( not ( = ?auto_17534 ?auto_17528 ) ) ( not ( = ?auto_17534 ?auto_17532 ) ) ( not ( = ?auto_17530 ?auto_17542 ) ) ( not ( = ?auto_17530 ?auto_17536 ) ) ( not ( = ?auto_17530 ?auto_17546 ) ) ( not ( = ?auto_17508 ?auto_17513 ) ) ( not ( = ?auto_17508 ?auto_17537 ) ) ( not ( = ?auto_17509 ?auto_17513 ) ) ( not ( = ?auto_17509 ?auto_17537 ) ) ( not ( = ?auto_17510 ?auto_17513 ) ) ( not ( = ?auto_17510 ?auto_17537 ) ) ( not ( = ?auto_17511 ?auto_17513 ) ) ( not ( = ?auto_17511 ?auto_17537 ) ) ( not ( = ?auto_17513 ?auto_17530 ) ) ( not ( = ?auto_17513 ?auto_17542 ) ) ( not ( = ?auto_17513 ?auto_17536 ) ) ( not ( = ?auto_17513 ?auto_17546 ) ) ( not ( = ?auto_17548 ?auto_17550 ) ) ( not ( = ?auto_17548 ?auto_17545 ) ) ( not ( = ?auto_17548 ?auto_17551 ) ) ( not ( = ?auto_17533 ?auto_17534 ) ) ( not ( = ?auto_17533 ?auto_17528 ) ) ( not ( = ?auto_17533 ?auto_17532 ) ) ( not ( = ?auto_17537 ?auto_17530 ) ) ( not ( = ?auto_17537 ?auto_17542 ) ) ( not ( = ?auto_17537 ?auto_17536 ) ) ( not ( = ?auto_17537 ?auto_17546 ) ) ( not ( = ?auto_17508 ?auto_17514 ) ) ( not ( = ?auto_17508 ?auto_17539 ) ) ( not ( = ?auto_17509 ?auto_17514 ) ) ( not ( = ?auto_17509 ?auto_17539 ) ) ( not ( = ?auto_17510 ?auto_17514 ) ) ( not ( = ?auto_17510 ?auto_17539 ) ) ( not ( = ?auto_17511 ?auto_17514 ) ) ( not ( = ?auto_17511 ?auto_17539 ) ) ( not ( = ?auto_17512 ?auto_17514 ) ) ( not ( = ?auto_17512 ?auto_17539 ) ) ( not ( = ?auto_17514 ?auto_17537 ) ) ( not ( = ?auto_17514 ?auto_17530 ) ) ( not ( = ?auto_17514 ?auto_17542 ) ) ( not ( = ?auto_17514 ?auto_17536 ) ) ( not ( = ?auto_17514 ?auto_17546 ) ) ( not ( = ?auto_17547 ?auto_17548 ) ) ( not ( = ?auto_17547 ?auto_17550 ) ) ( not ( = ?auto_17547 ?auto_17545 ) ) ( not ( = ?auto_17547 ?auto_17551 ) ) ( not ( = ?auto_17540 ?auto_17533 ) ) ( not ( = ?auto_17540 ?auto_17534 ) ) ( not ( = ?auto_17540 ?auto_17528 ) ) ( not ( = ?auto_17540 ?auto_17532 ) ) ( not ( = ?auto_17539 ?auto_17537 ) ) ( not ( = ?auto_17539 ?auto_17530 ) ) ( not ( = ?auto_17539 ?auto_17542 ) ) ( not ( = ?auto_17539 ?auto_17536 ) ) ( not ( = ?auto_17539 ?auto_17546 ) ) ( not ( = ?auto_17508 ?auto_17515 ) ) ( not ( = ?auto_17508 ?auto_17541 ) ) ( not ( = ?auto_17509 ?auto_17515 ) ) ( not ( = ?auto_17509 ?auto_17541 ) ) ( not ( = ?auto_17510 ?auto_17515 ) ) ( not ( = ?auto_17510 ?auto_17541 ) ) ( not ( = ?auto_17511 ?auto_17515 ) ) ( not ( = ?auto_17511 ?auto_17541 ) ) ( not ( = ?auto_17512 ?auto_17515 ) ) ( not ( = ?auto_17512 ?auto_17541 ) ) ( not ( = ?auto_17513 ?auto_17515 ) ) ( not ( = ?auto_17513 ?auto_17541 ) ) ( not ( = ?auto_17515 ?auto_17539 ) ) ( not ( = ?auto_17515 ?auto_17537 ) ) ( not ( = ?auto_17515 ?auto_17530 ) ) ( not ( = ?auto_17515 ?auto_17542 ) ) ( not ( = ?auto_17515 ?auto_17536 ) ) ( not ( = ?auto_17515 ?auto_17546 ) ) ( not ( = ?auto_17535 ?auto_17547 ) ) ( not ( = ?auto_17535 ?auto_17548 ) ) ( not ( = ?auto_17535 ?auto_17550 ) ) ( not ( = ?auto_17535 ?auto_17545 ) ) ( not ( = ?auto_17535 ?auto_17551 ) ) ( not ( = ?auto_17552 ?auto_17540 ) ) ( not ( = ?auto_17552 ?auto_17533 ) ) ( not ( = ?auto_17552 ?auto_17534 ) ) ( not ( = ?auto_17552 ?auto_17528 ) ) ( not ( = ?auto_17552 ?auto_17532 ) ) ( not ( = ?auto_17541 ?auto_17539 ) ) ( not ( = ?auto_17541 ?auto_17537 ) ) ( not ( = ?auto_17541 ?auto_17530 ) ) ( not ( = ?auto_17541 ?auto_17542 ) ) ( not ( = ?auto_17541 ?auto_17536 ) ) ( not ( = ?auto_17541 ?auto_17546 ) ) ( not ( = ?auto_17508 ?auto_17516 ) ) ( not ( = ?auto_17508 ?auto_17543 ) ) ( not ( = ?auto_17509 ?auto_17516 ) ) ( not ( = ?auto_17509 ?auto_17543 ) ) ( not ( = ?auto_17510 ?auto_17516 ) ) ( not ( = ?auto_17510 ?auto_17543 ) ) ( not ( = ?auto_17511 ?auto_17516 ) ) ( not ( = ?auto_17511 ?auto_17543 ) ) ( not ( = ?auto_17512 ?auto_17516 ) ) ( not ( = ?auto_17512 ?auto_17543 ) ) ( not ( = ?auto_17513 ?auto_17516 ) ) ( not ( = ?auto_17513 ?auto_17543 ) ) ( not ( = ?auto_17514 ?auto_17516 ) ) ( not ( = ?auto_17514 ?auto_17543 ) ) ( not ( = ?auto_17516 ?auto_17541 ) ) ( not ( = ?auto_17516 ?auto_17539 ) ) ( not ( = ?auto_17516 ?auto_17537 ) ) ( not ( = ?auto_17516 ?auto_17530 ) ) ( not ( = ?auto_17516 ?auto_17542 ) ) ( not ( = ?auto_17516 ?auto_17536 ) ) ( not ( = ?auto_17516 ?auto_17546 ) ) ( not ( = ?auto_17531 ?auto_17535 ) ) ( not ( = ?auto_17531 ?auto_17547 ) ) ( not ( = ?auto_17531 ?auto_17548 ) ) ( not ( = ?auto_17531 ?auto_17550 ) ) ( not ( = ?auto_17531 ?auto_17545 ) ) ( not ( = ?auto_17531 ?auto_17551 ) ) ( not ( = ?auto_17529 ?auto_17552 ) ) ( not ( = ?auto_17529 ?auto_17540 ) ) ( not ( = ?auto_17529 ?auto_17533 ) ) ( not ( = ?auto_17529 ?auto_17534 ) ) ( not ( = ?auto_17529 ?auto_17528 ) ) ( not ( = ?auto_17529 ?auto_17532 ) ) ( not ( = ?auto_17543 ?auto_17541 ) ) ( not ( = ?auto_17543 ?auto_17539 ) ) ( not ( = ?auto_17543 ?auto_17537 ) ) ( not ( = ?auto_17543 ?auto_17530 ) ) ( not ( = ?auto_17543 ?auto_17542 ) ) ( not ( = ?auto_17543 ?auto_17536 ) ) ( not ( = ?auto_17543 ?auto_17546 ) ) ( not ( = ?auto_17508 ?auto_17517 ) ) ( not ( = ?auto_17508 ?auto_17549 ) ) ( not ( = ?auto_17509 ?auto_17517 ) ) ( not ( = ?auto_17509 ?auto_17549 ) ) ( not ( = ?auto_17510 ?auto_17517 ) ) ( not ( = ?auto_17510 ?auto_17549 ) ) ( not ( = ?auto_17511 ?auto_17517 ) ) ( not ( = ?auto_17511 ?auto_17549 ) ) ( not ( = ?auto_17512 ?auto_17517 ) ) ( not ( = ?auto_17512 ?auto_17549 ) ) ( not ( = ?auto_17513 ?auto_17517 ) ) ( not ( = ?auto_17513 ?auto_17549 ) ) ( not ( = ?auto_17514 ?auto_17517 ) ) ( not ( = ?auto_17514 ?auto_17549 ) ) ( not ( = ?auto_17515 ?auto_17517 ) ) ( not ( = ?auto_17515 ?auto_17549 ) ) ( not ( = ?auto_17517 ?auto_17543 ) ) ( not ( = ?auto_17517 ?auto_17541 ) ) ( not ( = ?auto_17517 ?auto_17539 ) ) ( not ( = ?auto_17517 ?auto_17537 ) ) ( not ( = ?auto_17517 ?auto_17530 ) ) ( not ( = ?auto_17517 ?auto_17542 ) ) ( not ( = ?auto_17517 ?auto_17536 ) ) ( not ( = ?auto_17517 ?auto_17546 ) ) ( not ( = ?auto_17527 ?auto_17531 ) ) ( not ( = ?auto_17527 ?auto_17535 ) ) ( not ( = ?auto_17527 ?auto_17547 ) ) ( not ( = ?auto_17527 ?auto_17548 ) ) ( not ( = ?auto_17527 ?auto_17550 ) ) ( not ( = ?auto_17527 ?auto_17545 ) ) ( not ( = ?auto_17527 ?auto_17551 ) ) ( not ( = ?auto_17538 ?auto_17529 ) ) ( not ( = ?auto_17538 ?auto_17552 ) ) ( not ( = ?auto_17538 ?auto_17540 ) ) ( not ( = ?auto_17538 ?auto_17533 ) ) ( not ( = ?auto_17538 ?auto_17534 ) ) ( not ( = ?auto_17538 ?auto_17528 ) ) ( not ( = ?auto_17538 ?auto_17532 ) ) ( not ( = ?auto_17549 ?auto_17543 ) ) ( not ( = ?auto_17549 ?auto_17541 ) ) ( not ( = ?auto_17549 ?auto_17539 ) ) ( not ( = ?auto_17549 ?auto_17537 ) ) ( not ( = ?auto_17549 ?auto_17530 ) ) ( not ( = ?auto_17549 ?auto_17542 ) ) ( not ( = ?auto_17549 ?auto_17536 ) ) ( not ( = ?auto_17549 ?auto_17546 ) ) ( not ( = ?auto_17508 ?auto_17518 ) ) ( not ( = ?auto_17508 ?auto_17553 ) ) ( not ( = ?auto_17509 ?auto_17518 ) ) ( not ( = ?auto_17509 ?auto_17553 ) ) ( not ( = ?auto_17510 ?auto_17518 ) ) ( not ( = ?auto_17510 ?auto_17553 ) ) ( not ( = ?auto_17511 ?auto_17518 ) ) ( not ( = ?auto_17511 ?auto_17553 ) ) ( not ( = ?auto_17512 ?auto_17518 ) ) ( not ( = ?auto_17512 ?auto_17553 ) ) ( not ( = ?auto_17513 ?auto_17518 ) ) ( not ( = ?auto_17513 ?auto_17553 ) ) ( not ( = ?auto_17514 ?auto_17518 ) ) ( not ( = ?auto_17514 ?auto_17553 ) ) ( not ( = ?auto_17515 ?auto_17518 ) ) ( not ( = ?auto_17515 ?auto_17553 ) ) ( not ( = ?auto_17516 ?auto_17518 ) ) ( not ( = ?auto_17516 ?auto_17553 ) ) ( not ( = ?auto_17518 ?auto_17549 ) ) ( not ( = ?auto_17518 ?auto_17543 ) ) ( not ( = ?auto_17518 ?auto_17541 ) ) ( not ( = ?auto_17518 ?auto_17539 ) ) ( not ( = ?auto_17518 ?auto_17537 ) ) ( not ( = ?auto_17518 ?auto_17530 ) ) ( not ( = ?auto_17518 ?auto_17542 ) ) ( not ( = ?auto_17518 ?auto_17536 ) ) ( not ( = ?auto_17518 ?auto_17546 ) ) ( not ( = ?auto_17544 ?auto_17527 ) ) ( not ( = ?auto_17544 ?auto_17531 ) ) ( not ( = ?auto_17544 ?auto_17535 ) ) ( not ( = ?auto_17544 ?auto_17547 ) ) ( not ( = ?auto_17544 ?auto_17548 ) ) ( not ( = ?auto_17544 ?auto_17550 ) ) ( not ( = ?auto_17544 ?auto_17545 ) ) ( not ( = ?auto_17544 ?auto_17551 ) ) ( not ( = ?auto_17526 ?auto_17538 ) ) ( not ( = ?auto_17526 ?auto_17529 ) ) ( not ( = ?auto_17526 ?auto_17552 ) ) ( not ( = ?auto_17526 ?auto_17540 ) ) ( not ( = ?auto_17526 ?auto_17533 ) ) ( not ( = ?auto_17526 ?auto_17534 ) ) ( not ( = ?auto_17526 ?auto_17528 ) ) ( not ( = ?auto_17526 ?auto_17532 ) ) ( not ( = ?auto_17553 ?auto_17549 ) ) ( not ( = ?auto_17553 ?auto_17543 ) ) ( not ( = ?auto_17553 ?auto_17541 ) ) ( not ( = ?auto_17553 ?auto_17539 ) ) ( not ( = ?auto_17553 ?auto_17537 ) ) ( not ( = ?auto_17553 ?auto_17530 ) ) ( not ( = ?auto_17553 ?auto_17542 ) ) ( not ( = ?auto_17553 ?auto_17536 ) ) ( not ( = ?auto_17553 ?auto_17546 ) ) ( not ( = ?auto_17508 ?auto_17519 ) ) ( not ( = ?auto_17508 ?auto_17524 ) ) ( not ( = ?auto_17509 ?auto_17519 ) ) ( not ( = ?auto_17509 ?auto_17524 ) ) ( not ( = ?auto_17510 ?auto_17519 ) ) ( not ( = ?auto_17510 ?auto_17524 ) ) ( not ( = ?auto_17511 ?auto_17519 ) ) ( not ( = ?auto_17511 ?auto_17524 ) ) ( not ( = ?auto_17512 ?auto_17519 ) ) ( not ( = ?auto_17512 ?auto_17524 ) ) ( not ( = ?auto_17513 ?auto_17519 ) ) ( not ( = ?auto_17513 ?auto_17524 ) ) ( not ( = ?auto_17514 ?auto_17519 ) ) ( not ( = ?auto_17514 ?auto_17524 ) ) ( not ( = ?auto_17515 ?auto_17519 ) ) ( not ( = ?auto_17515 ?auto_17524 ) ) ( not ( = ?auto_17516 ?auto_17519 ) ) ( not ( = ?auto_17516 ?auto_17524 ) ) ( not ( = ?auto_17517 ?auto_17519 ) ) ( not ( = ?auto_17517 ?auto_17524 ) ) ( not ( = ?auto_17519 ?auto_17553 ) ) ( not ( = ?auto_17519 ?auto_17549 ) ) ( not ( = ?auto_17519 ?auto_17543 ) ) ( not ( = ?auto_17519 ?auto_17541 ) ) ( not ( = ?auto_17519 ?auto_17539 ) ) ( not ( = ?auto_17519 ?auto_17537 ) ) ( not ( = ?auto_17519 ?auto_17530 ) ) ( not ( = ?auto_17519 ?auto_17542 ) ) ( not ( = ?auto_17519 ?auto_17536 ) ) ( not ( = ?auto_17519 ?auto_17546 ) ) ( not ( = ?auto_17520 ?auto_17544 ) ) ( not ( = ?auto_17520 ?auto_17527 ) ) ( not ( = ?auto_17520 ?auto_17531 ) ) ( not ( = ?auto_17520 ?auto_17535 ) ) ( not ( = ?auto_17520 ?auto_17547 ) ) ( not ( = ?auto_17520 ?auto_17548 ) ) ( not ( = ?auto_17520 ?auto_17550 ) ) ( not ( = ?auto_17520 ?auto_17545 ) ) ( not ( = ?auto_17520 ?auto_17551 ) ) ( not ( = ?auto_17523 ?auto_17526 ) ) ( not ( = ?auto_17523 ?auto_17538 ) ) ( not ( = ?auto_17523 ?auto_17529 ) ) ( not ( = ?auto_17523 ?auto_17552 ) ) ( not ( = ?auto_17523 ?auto_17540 ) ) ( not ( = ?auto_17523 ?auto_17533 ) ) ( not ( = ?auto_17523 ?auto_17534 ) ) ( not ( = ?auto_17523 ?auto_17528 ) ) ( not ( = ?auto_17523 ?auto_17532 ) ) ( not ( = ?auto_17524 ?auto_17553 ) ) ( not ( = ?auto_17524 ?auto_17549 ) ) ( not ( = ?auto_17524 ?auto_17543 ) ) ( not ( = ?auto_17524 ?auto_17541 ) ) ( not ( = ?auto_17524 ?auto_17539 ) ) ( not ( = ?auto_17524 ?auto_17537 ) ) ( not ( = ?auto_17524 ?auto_17530 ) ) ( not ( = ?auto_17524 ?auto_17542 ) ) ( not ( = ?auto_17524 ?auto_17536 ) ) ( not ( = ?auto_17524 ?auto_17546 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_17508 ?auto_17509 ?auto_17510 ?auto_17511 ?auto_17512 ?auto_17513 ?auto_17514 ?auto_17515 ?auto_17516 ?auto_17517 ?auto_17518 )
      ( MAKE-1CRATE ?auto_17518 ?auto_17519 )
      ( MAKE-11CRATE-VERIFY ?auto_17508 ?auto_17509 ?auto_17510 ?auto_17511 ?auto_17512 ?auto_17513 ?auto_17514 ?auto_17515 ?auto_17516 ?auto_17517 ?auto_17518 ?auto_17519 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_17577 - SURFACE
      ?auto_17578 - SURFACE
      ?auto_17579 - SURFACE
      ?auto_17580 - SURFACE
      ?auto_17581 - SURFACE
      ?auto_17582 - SURFACE
      ?auto_17583 - SURFACE
      ?auto_17584 - SURFACE
      ?auto_17585 - SURFACE
      ?auto_17586 - SURFACE
      ?auto_17587 - SURFACE
      ?auto_17588 - SURFACE
      ?auto_17589 - SURFACE
    )
    :vars
    (
      ?auto_17590 - HOIST
      ?auto_17593 - PLACE
      ?auto_17591 - PLACE
      ?auto_17595 - HOIST
      ?auto_17592 - SURFACE
      ?auto_17609 - PLACE
      ?auto_17606 - HOIST
      ?auto_17621 - SURFACE
      ?auto_17598 - PLACE
      ?auto_17612 - HOIST
      ?auto_17616 - SURFACE
      ?auto_17613 - PLACE
      ?auto_17596 - HOIST
      ?auto_17619 - SURFACE
      ?auto_17618 - PLACE
      ?auto_17611 - HOIST
      ?auto_17604 - SURFACE
      ?auto_17610 - PLACE
      ?auto_17623 - HOIST
      ?auto_17625 - SURFACE
      ?auto_17607 - PLACE
      ?auto_17605 - HOIST
      ?auto_17617 - SURFACE
      ?auto_17615 - PLACE
      ?auto_17597 - HOIST
      ?auto_17614 - SURFACE
      ?auto_17600 - PLACE
      ?auto_17624 - HOIST
      ?auto_17602 - SURFACE
      ?auto_17626 - PLACE
      ?auto_17599 - HOIST
      ?auto_17603 - SURFACE
      ?auto_17620 - PLACE
      ?auto_17601 - HOIST
      ?auto_17608 - SURFACE
      ?auto_17622 - SURFACE
      ?auto_17594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17590 ?auto_17593 ) ( IS-CRATE ?auto_17589 ) ( not ( = ?auto_17591 ?auto_17593 ) ) ( HOIST-AT ?auto_17595 ?auto_17591 ) ( AVAILABLE ?auto_17595 ) ( SURFACE-AT ?auto_17589 ?auto_17591 ) ( ON ?auto_17589 ?auto_17592 ) ( CLEAR ?auto_17589 ) ( not ( = ?auto_17588 ?auto_17589 ) ) ( not ( = ?auto_17588 ?auto_17592 ) ) ( not ( = ?auto_17589 ?auto_17592 ) ) ( not ( = ?auto_17590 ?auto_17595 ) ) ( IS-CRATE ?auto_17588 ) ( not ( = ?auto_17609 ?auto_17593 ) ) ( HOIST-AT ?auto_17606 ?auto_17609 ) ( AVAILABLE ?auto_17606 ) ( SURFACE-AT ?auto_17588 ?auto_17609 ) ( ON ?auto_17588 ?auto_17621 ) ( CLEAR ?auto_17588 ) ( not ( = ?auto_17587 ?auto_17588 ) ) ( not ( = ?auto_17587 ?auto_17621 ) ) ( not ( = ?auto_17588 ?auto_17621 ) ) ( not ( = ?auto_17590 ?auto_17606 ) ) ( IS-CRATE ?auto_17587 ) ( not ( = ?auto_17598 ?auto_17593 ) ) ( HOIST-AT ?auto_17612 ?auto_17598 ) ( AVAILABLE ?auto_17612 ) ( SURFACE-AT ?auto_17587 ?auto_17598 ) ( ON ?auto_17587 ?auto_17616 ) ( CLEAR ?auto_17587 ) ( not ( = ?auto_17586 ?auto_17587 ) ) ( not ( = ?auto_17586 ?auto_17616 ) ) ( not ( = ?auto_17587 ?auto_17616 ) ) ( not ( = ?auto_17590 ?auto_17612 ) ) ( IS-CRATE ?auto_17586 ) ( not ( = ?auto_17613 ?auto_17593 ) ) ( HOIST-AT ?auto_17596 ?auto_17613 ) ( AVAILABLE ?auto_17596 ) ( SURFACE-AT ?auto_17586 ?auto_17613 ) ( ON ?auto_17586 ?auto_17619 ) ( CLEAR ?auto_17586 ) ( not ( = ?auto_17585 ?auto_17586 ) ) ( not ( = ?auto_17585 ?auto_17619 ) ) ( not ( = ?auto_17586 ?auto_17619 ) ) ( not ( = ?auto_17590 ?auto_17596 ) ) ( IS-CRATE ?auto_17585 ) ( not ( = ?auto_17618 ?auto_17593 ) ) ( HOIST-AT ?auto_17611 ?auto_17618 ) ( AVAILABLE ?auto_17611 ) ( SURFACE-AT ?auto_17585 ?auto_17618 ) ( ON ?auto_17585 ?auto_17604 ) ( CLEAR ?auto_17585 ) ( not ( = ?auto_17584 ?auto_17585 ) ) ( not ( = ?auto_17584 ?auto_17604 ) ) ( not ( = ?auto_17585 ?auto_17604 ) ) ( not ( = ?auto_17590 ?auto_17611 ) ) ( IS-CRATE ?auto_17584 ) ( not ( = ?auto_17610 ?auto_17593 ) ) ( HOIST-AT ?auto_17623 ?auto_17610 ) ( AVAILABLE ?auto_17623 ) ( SURFACE-AT ?auto_17584 ?auto_17610 ) ( ON ?auto_17584 ?auto_17625 ) ( CLEAR ?auto_17584 ) ( not ( = ?auto_17583 ?auto_17584 ) ) ( not ( = ?auto_17583 ?auto_17625 ) ) ( not ( = ?auto_17584 ?auto_17625 ) ) ( not ( = ?auto_17590 ?auto_17623 ) ) ( IS-CRATE ?auto_17583 ) ( not ( = ?auto_17607 ?auto_17593 ) ) ( HOIST-AT ?auto_17605 ?auto_17607 ) ( AVAILABLE ?auto_17605 ) ( SURFACE-AT ?auto_17583 ?auto_17607 ) ( ON ?auto_17583 ?auto_17617 ) ( CLEAR ?auto_17583 ) ( not ( = ?auto_17582 ?auto_17583 ) ) ( not ( = ?auto_17582 ?auto_17617 ) ) ( not ( = ?auto_17583 ?auto_17617 ) ) ( not ( = ?auto_17590 ?auto_17605 ) ) ( IS-CRATE ?auto_17582 ) ( not ( = ?auto_17615 ?auto_17593 ) ) ( HOIST-AT ?auto_17597 ?auto_17615 ) ( AVAILABLE ?auto_17597 ) ( SURFACE-AT ?auto_17582 ?auto_17615 ) ( ON ?auto_17582 ?auto_17614 ) ( CLEAR ?auto_17582 ) ( not ( = ?auto_17581 ?auto_17582 ) ) ( not ( = ?auto_17581 ?auto_17614 ) ) ( not ( = ?auto_17582 ?auto_17614 ) ) ( not ( = ?auto_17590 ?auto_17597 ) ) ( IS-CRATE ?auto_17581 ) ( not ( = ?auto_17600 ?auto_17593 ) ) ( HOIST-AT ?auto_17624 ?auto_17600 ) ( AVAILABLE ?auto_17624 ) ( SURFACE-AT ?auto_17581 ?auto_17600 ) ( ON ?auto_17581 ?auto_17602 ) ( CLEAR ?auto_17581 ) ( not ( = ?auto_17580 ?auto_17581 ) ) ( not ( = ?auto_17580 ?auto_17602 ) ) ( not ( = ?auto_17581 ?auto_17602 ) ) ( not ( = ?auto_17590 ?auto_17624 ) ) ( IS-CRATE ?auto_17580 ) ( not ( = ?auto_17626 ?auto_17593 ) ) ( HOIST-AT ?auto_17599 ?auto_17626 ) ( SURFACE-AT ?auto_17580 ?auto_17626 ) ( ON ?auto_17580 ?auto_17603 ) ( CLEAR ?auto_17580 ) ( not ( = ?auto_17579 ?auto_17580 ) ) ( not ( = ?auto_17579 ?auto_17603 ) ) ( not ( = ?auto_17580 ?auto_17603 ) ) ( not ( = ?auto_17590 ?auto_17599 ) ) ( IS-CRATE ?auto_17579 ) ( not ( = ?auto_17620 ?auto_17593 ) ) ( HOIST-AT ?auto_17601 ?auto_17620 ) ( AVAILABLE ?auto_17601 ) ( SURFACE-AT ?auto_17579 ?auto_17620 ) ( ON ?auto_17579 ?auto_17608 ) ( CLEAR ?auto_17579 ) ( not ( = ?auto_17578 ?auto_17579 ) ) ( not ( = ?auto_17578 ?auto_17608 ) ) ( not ( = ?auto_17579 ?auto_17608 ) ) ( not ( = ?auto_17590 ?auto_17601 ) ) ( SURFACE-AT ?auto_17577 ?auto_17593 ) ( CLEAR ?auto_17577 ) ( IS-CRATE ?auto_17578 ) ( AVAILABLE ?auto_17590 ) ( AVAILABLE ?auto_17599 ) ( SURFACE-AT ?auto_17578 ?auto_17626 ) ( ON ?auto_17578 ?auto_17622 ) ( CLEAR ?auto_17578 ) ( TRUCK-AT ?auto_17594 ?auto_17593 ) ( not ( = ?auto_17577 ?auto_17578 ) ) ( not ( = ?auto_17577 ?auto_17622 ) ) ( not ( = ?auto_17578 ?auto_17622 ) ) ( not ( = ?auto_17577 ?auto_17579 ) ) ( not ( = ?auto_17577 ?auto_17608 ) ) ( not ( = ?auto_17579 ?auto_17622 ) ) ( not ( = ?auto_17620 ?auto_17626 ) ) ( not ( = ?auto_17601 ?auto_17599 ) ) ( not ( = ?auto_17608 ?auto_17622 ) ) ( not ( = ?auto_17577 ?auto_17580 ) ) ( not ( = ?auto_17577 ?auto_17603 ) ) ( not ( = ?auto_17578 ?auto_17580 ) ) ( not ( = ?auto_17578 ?auto_17603 ) ) ( not ( = ?auto_17580 ?auto_17608 ) ) ( not ( = ?auto_17580 ?auto_17622 ) ) ( not ( = ?auto_17603 ?auto_17608 ) ) ( not ( = ?auto_17603 ?auto_17622 ) ) ( not ( = ?auto_17577 ?auto_17581 ) ) ( not ( = ?auto_17577 ?auto_17602 ) ) ( not ( = ?auto_17578 ?auto_17581 ) ) ( not ( = ?auto_17578 ?auto_17602 ) ) ( not ( = ?auto_17579 ?auto_17581 ) ) ( not ( = ?auto_17579 ?auto_17602 ) ) ( not ( = ?auto_17581 ?auto_17603 ) ) ( not ( = ?auto_17581 ?auto_17608 ) ) ( not ( = ?auto_17581 ?auto_17622 ) ) ( not ( = ?auto_17600 ?auto_17626 ) ) ( not ( = ?auto_17600 ?auto_17620 ) ) ( not ( = ?auto_17624 ?auto_17599 ) ) ( not ( = ?auto_17624 ?auto_17601 ) ) ( not ( = ?auto_17602 ?auto_17603 ) ) ( not ( = ?auto_17602 ?auto_17608 ) ) ( not ( = ?auto_17602 ?auto_17622 ) ) ( not ( = ?auto_17577 ?auto_17582 ) ) ( not ( = ?auto_17577 ?auto_17614 ) ) ( not ( = ?auto_17578 ?auto_17582 ) ) ( not ( = ?auto_17578 ?auto_17614 ) ) ( not ( = ?auto_17579 ?auto_17582 ) ) ( not ( = ?auto_17579 ?auto_17614 ) ) ( not ( = ?auto_17580 ?auto_17582 ) ) ( not ( = ?auto_17580 ?auto_17614 ) ) ( not ( = ?auto_17582 ?auto_17602 ) ) ( not ( = ?auto_17582 ?auto_17603 ) ) ( not ( = ?auto_17582 ?auto_17608 ) ) ( not ( = ?auto_17582 ?auto_17622 ) ) ( not ( = ?auto_17615 ?auto_17600 ) ) ( not ( = ?auto_17615 ?auto_17626 ) ) ( not ( = ?auto_17615 ?auto_17620 ) ) ( not ( = ?auto_17597 ?auto_17624 ) ) ( not ( = ?auto_17597 ?auto_17599 ) ) ( not ( = ?auto_17597 ?auto_17601 ) ) ( not ( = ?auto_17614 ?auto_17602 ) ) ( not ( = ?auto_17614 ?auto_17603 ) ) ( not ( = ?auto_17614 ?auto_17608 ) ) ( not ( = ?auto_17614 ?auto_17622 ) ) ( not ( = ?auto_17577 ?auto_17583 ) ) ( not ( = ?auto_17577 ?auto_17617 ) ) ( not ( = ?auto_17578 ?auto_17583 ) ) ( not ( = ?auto_17578 ?auto_17617 ) ) ( not ( = ?auto_17579 ?auto_17583 ) ) ( not ( = ?auto_17579 ?auto_17617 ) ) ( not ( = ?auto_17580 ?auto_17583 ) ) ( not ( = ?auto_17580 ?auto_17617 ) ) ( not ( = ?auto_17581 ?auto_17583 ) ) ( not ( = ?auto_17581 ?auto_17617 ) ) ( not ( = ?auto_17583 ?auto_17614 ) ) ( not ( = ?auto_17583 ?auto_17602 ) ) ( not ( = ?auto_17583 ?auto_17603 ) ) ( not ( = ?auto_17583 ?auto_17608 ) ) ( not ( = ?auto_17583 ?auto_17622 ) ) ( not ( = ?auto_17607 ?auto_17615 ) ) ( not ( = ?auto_17607 ?auto_17600 ) ) ( not ( = ?auto_17607 ?auto_17626 ) ) ( not ( = ?auto_17607 ?auto_17620 ) ) ( not ( = ?auto_17605 ?auto_17597 ) ) ( not ( = ?auto_17605 ?auto_17624 ) ) ( not ( = ?auto_17605 ?auto_17599 ) ) ( not ( = ?auto_17605 ?auto_17601 ) ) ( not ( = ?auto_17617 ?auto_17614 ) ) ( not ( = ?auto_17617 ?auto_17602 ) ) ( not ( = ?auto_17617 ?auto_17603 ) ) ( not ( = ?auto_17617 ?auto_17608 ) ) ( not ( = ?auto_17617 ?auto_17622 ) ) ( not ( = ?auto_17577 ?auto_17584 ) ) ( not ( = ?auto_17577 ?auto_17625 ) ) ( not ( = ?auto_17578 ?auto_17584 ) ) ( not ( = ?auto_17578 ?auto_17625 ) ) ( not ( = ?auto_17579 ?auto_17584 ) ) ( not ( = ?auto_17579 ?auto_17625 ) ) ( not ( = ?auto_17580 ?auto_17584 ) ) ( not ( = ?auto_17580 ?auto_17625 ) ) ( not ( = ?auto_17581 ?auto_17584 ) ) ( not ( = ?auto_17581 ?auto_17625 ) ) ( not ( = ?auto_17582 ?auto_17584 ) ) ( not ( = ?auto_17582 ?auto_17625 ) ) ( not ( = ?auto_17584 ?auto_17617 ) ) ( not ( = ?auto_17584 ?auto_17614 ) ) ( not ( = ?auto_17584 ?auto_17602 ) ) ( not ( = ?auto_17584 ?auto_17603 ) ) ( not ( = ?auto_17584 ?auto_17608 ) ) ( not ( = ?auto_17584 ?auto_17622 ) ) ( not ( = ?auto_17610 ?auto_17607 ) ) ( not ( = ?auto_17610 ?auto_17615 ) ) ( not ( = ?auto_17610 ?auto_17600 ) ) ( not ( = ?auto_17610 ?auto_17626 ) ) ( not ( = ?auto_17610 ?auto_17620 ) ) ( not ( = ?auto_17623 ?auto_17605 ) ) ( not ( = ?auto_17623 ?auto_17597 ) ) ( not ( = ?auto_17623 ?auto_17624 ) ) ( not ( = ?auto_17623 ?auto_17599 ) ) ( not ( = ?auto_17623 ?auto_17601 ) ) ( not ( = ?auto_17625 ?auto_17617 ) ) ( not ( = ?auto_17625 ?auto_17614 ) ) ( not ( = ?auto_17625 ?auto_17602 ) ) ( not ( = ?auto_17625 ?auto_17603 ) ) ( not ( = ?auto_17625 ?auto_17608 ) ) ( not ( = ?auto_17625 ?auto_17622 ) ) ( not ( = ?auto_17577 ?auto_17585 ) ) ( not ( = ?auto_17577 ?auto_17604 ) ) ( not ( = ?auto_17578 ?auto_17585 ) ) ( not ( = ?auto_17578 ?auto_17604 ) ) ( not ( = ?auto_17579 ?auto_17585 ) ) ( not ( = ?auto_17579 ?auto_17604 ) ) ( not ( = ?auto_17580 ?auto_17585 ) ) ( not ( = ?auto_17580 ?auto_17604 ) ) ( not ( = ?auto_17581 ?auto_17585 ) ) ( not ( = ?auto_17581 ?auto_17604 ) ) ( not ( = ?auto_17582 ?auto_17585 ) ) ( not ( = ?auto_17582 ?auto_17604 ) ) ( not ( = ?auto_17583 ?auto_17585 ) ) ( not ( = ?auto_17583 ?auto_17604 ) ) ( not ( = ?auto_17585 ?auto_17625 ) ) ( not ( = ?auto_17585 ?auto_17617 ) ) ( not ( = ?auto_17585 ?auto_17614 ) ) ( not ( = ?auto_17585 ?auto_17602 ) ) ( not ( = ?auto_17585 ?auto_17603 ) ) ( not ( = ?auto_17585 ?auto_17608 ) ) ( not ( = ?auto_17585 ?auto_17622 ) ) ( not ( = ?auto_17618 ?auto_17610 ) ) ( not ( = ?auto_17618 ?auto_17607 ) ) ( not ( = ?auto_17618 ?auto_17615 ) ) ( not ( = ?auto_17618 ?auto_17600 ) ) ( not ( = ?auto_17618 ?auto_17626 ) ) ( not ( = ?auto_17618 ?auto_17620 ) ) ( not ( = ?auto_17611 ?auto_17623 ) ) ( not ( = ?auto_17611 ?auto_17605 ) ) ( not ( = ?auto_17611 ?auto_17597 ) ) ( not ( = ?auto_17611 ?auto_17624 ) ) ( not ( = ?auto_17611 ?auto_17599 ) ) ( not ( = ?auto_17611 ?auto_17601 ) ) ( not ( = ?auto_17604 ?auto_17625 ) ) ( not ( = ?auto_17604 ?auto_17617 ) ) ( not ( = ?auto_17604 ?auto_17614 ) ) ( not ( = ?auto_17604 ?auto_17602 ) ) ( not ( = ?auto_17604 ?auto_17603 ) ) ( not ( = ?auto_17604 ?auto_17608 ) ) ( not ( = ?auto_17604 ?auto_17622 ) ) ( not ( = ?auto_17577 ?auto_17586 ) ) ( not ( = ?auto_17577 ?auto_17619 ) ) ( not ( = ?auto_17578 ?auto_17586 ) ) ( not ( = ?auto_17578 ?auto_17619 ) ) ( not ( = ?auto_17579 ?auto_17586 ) ) ( not ( = ?auto_17579 ?auto_17619 ) ) ( not ( = ?auto_17580 ?auto_17586 ) ) ( not ( = ?auto_17580 ?auto_17619 ) ) ( not ( = ?auto_17581 ?auto_17586 ) ) ( not ( = ?auto_17581 ?auto_17619 ) ) ( not ( = ?auto_17582 ?auto_17586 ) ) ( not ( = ?auto_17582 ?auto_17619 ) ) ( not ( = ?auto_17583 ?auto_17586 ) ) ( not ( = ?auto_17583 ?auto_17619 ) ) ( not ( = ?auto_17584 ?auto_17586 ) ) ( not ( = ?auto_17584 ?auto_17619 ) ) ( not ( = ?auto_17586 ?auto_17604 ) ) ( not ( = ?auto_17586 ?auto_17625 ) ) ( not ( = ?auto_17586 ?auto_17617 ) ) ( not ( = ?auto_17586 ?auto_17614 ) ) ( not ( = ?auto_17586 ?auto_17602 ) ) ( not ( = ?auto_17586 ?auto_17603 ) ) ( not ( = ?auto_17586 ?auto_17608 ) ) ( not ( = ?auto_17586 ?auto_17622 ) ) ( not ( = ?auto_17613 ?auto_17618 ) ) ( not ( = ?auto_17613 ?auto_17610 ) ) ( not ( = ?auto_17613 ?auto_17607 ) ) ( not ( = ?auto_17613 ?auto_17615 ) ) ( not ( = ?auto_17613 ?auto_17600 ) ) ( not ( = ?auto_17613 ?auto_17626 ) ) ( not ( = ?auto_17613 ?auto_17620 ) ) ( not ( = ?auto_17596 ?auto_17611 ) ) ( not ( = ?auto_17596 ?auto_17623 ) ) ( not ( = ?auto_17596 ?auto_17605 ) ) ( not ( = ?auto_17596 ?auto_17597 ) ) ( not ( = ?auto_17596 ?auto_17624 ) ) ( not ( = ?auto_17596 ?auto_17599 ) ) ( not ( = ?auto_17596 ?auto_17601 ) ) ( not ( = ?auto_17619 ?auto_17604 ) ) ( not ( = ?auto_17619 ?auto_17625 ) ) ( not ( = ?auto_17619 ?auto_17617 ) ) ( not ( = ?auto_17619 ?auto_17614 ) ) ( not ( = ?auto_17619 ?auto_17602 ) ) ( not ( = ?auto_17619 ?auto_17603 ) ) ( not ( = ?auto_17619 ?auto_17608 ) ) ( not ( = ?auto_17619 ?auto_17622 ) ) ( not ( = ?auto_17577 ?auto_17587 ) ) ( not ( = ?auto_17577 ?auto_17616 ) ) ( not ( = ?auto_17578 ?auto_17587 ) ) ( not ( = ?auto_17578 ?auto_17616 ) ) ( not ( = ?auto_17579 ?auto_17587 ) ) ( not ( = ?auto_17579 ?auto_17616 ) ) ( not ( = ?auto_17580 ?auto_17587 ) ) ( not ( = ?auto_17580 ?auto_17616 ) ) ( not ( = ?auto_17581 ?auto_17587 ) ) ( not ( = ?auto_17581 ?auto_17616 ) ) ( not ( = ?auto_17582 ?auto_17587 ) ) ( not ( = ?auto_17582 ?auto_17616 ) ) ( not ( = ?auto_17583 ?auto_17587 ) ) ( not ( = ?auto_17583 ?auto_17616 ) ) ( not ( = ?auto_17584 ?auto_17587 ) ) ( not ( = ?auto_17584 ?auto_17616 ) ) ( not ( = ?auto_17585 ?auto_17587 ) ) ( not ( = ?auto_17585 ?auto_17616 ) ) ( not ( = ?auto_17587 ?auto_17619 ) ) ( not ( = ?auto_17587 ?auto_17604 ) ) ( not ( = ?auto_17587 ?auto_17625 ) ) ( not ( = ?auto_17587 ?auto_17617 ) ) ( not ( = ?auto_17587 ?auto_17614 ) ) ( not ( = ?auto_17587 ?auto_17602 ) ) ( not ( = ?auto_17587 ?auto_17603 ) ) ( not ( = ?auto_17587 ?auto_17608 ) ) ( not ( = ?auto_17587 ?auto_17622 ) ) ( not ( = ?auto_17598 ?auto_17613 ) ) ( not ( = ?auto_17598 ?auto_17618 ) ) ( not ( = ?auto_17598 ?auto_17610 ) ) ( not ( = ?auto_17598 ?auto_17607 ) ) ( not ( = ?auto_17598 ?auto_17615 ) ) ( not ( = ?auto_17598 ?auto_17600 ) ) ( not ( = ?auto_17598 ?auto_17626 ) ) ( not ( = ?auto_17598 ?auto_17620 ) ) ( not ( = ?auto_17612 ?auto_17596 ) ) ( not ( = ?auto_17612 ?auto_17611 ) ) ( not ( = ?auto_17612 ?auto_17623 ) ) ( not ( = ?auto_17612 ?auto_17605 ) ) ( not ( = ?auto_17612 ?auto_17597 ) ) ( not ( = ?auto_17612 ?auto_17624 ) ) ( not ( = ?auto_17612 ?auto_17599 ) ) ( not ( = ?auto_17612 ?auto_17601 ) ) ( not ( = ?auto_17616 ?auto_17619 ) ) ( not ( = ?auto_17616 ?auto_17604 ) ) ( not ( = ?auto_17616 ?auto_17625 ) ) ( not ( = ?auto_17616 ?auto_17617 ) ) ( not ( = ?auto_17616 ?auto_17614 ) ) ( not ( = ?auto_17616 ?auto_17602 ) ) ( not ( = ?auto_17616 ?auto_17603 ) ) ( not ( = ?auto_17616 ?auto_17608 ) ) ( not ( = ?auto_17616 ?auto_17622 ) ) ( not ( = ?auto_17577 ?auto_17588 ) ) ( not ( = ?auto_17577 ?auto_17621 ) ) ( not ( = ?auto_17578 ?auto_17588 ) ) ( not ( = ?auto_17578 ?auto_17621 ) ) ( not ( = ?auto_17579 ?auto_17588 ) ) ( not ( = ?auto_17579 ?auto_17621 ) ) ( not ( = ?auto_17580 ?auto_17588 ) ) ( not ( = ?auto_17580 ?auto_17621 ) ) ( not ( = ?auto_17581 ?auto_17588 ) ) ( not ( = ?auto_17581 ?auto_17621 ) ) ( not ( = ?auto_17582 ?auto_17588 ) ) ( not ( = ?auto_17582 ?auto_17621 ) ) ( not ( = ?auto_17583 ?auto_17588 ) ) ( not ( = ?auto_17583 ?auto_17621 ) ) ( not ( = ?auto_17584 ?auto_17588 ) ) ( not ( = ?auto_17584 ?auto_17621 ) ) ( not ( = ?auto_17585 ?auto_17588 ) ) ( not ( = ?auto_17585 ?auto_17621 ) ) ( not ( = ?auto_17586 ?auto_17588 ) ) ( not ( = ?auto_17586 ?auto_17621 ) ) ( not ( = ?auto_17588 ?auto_17616 ) ) ( not ( = ?auto_17588 ?auto_17619 ) ) ( not ( = ?auto_17588 ?auto_17604 ) ) ( not ( = ?auto_17588 ?auto_17625 ) ) ( not ( = ?auto_17588 ?auto_17617 ) ) ( not ( = ?auto_17588 ?auto_17614 ) ) ( not ( = ?auto_17588 ?auto_17602 ) ) ( not ( = ?auto_17588 ?auto_17603 ) ) ( not ( = ?auto_17588 ?auto_17608 ) ) ( not ( = ?auto_17588 ?auto_17622 ) ) ( not ( = ?auto_17609 ?auto_17598 ) ) ( not ( = ?auto_17609 ?auto_17613 ) ) ( not ( = ?auto_17609 ?auto_17618 ) ) ( not ( = ?auto_17609 ?auto_17610 ) ) ( not ( = ?auto_17609 ?auto_17607 ) ) ( not ( = ?auto_17609 ?auto_17615 ) ) ( not ( = ?auto_17609 ?auto_17600 ) ) ( not ( = ?auto_17609 ?auto_17626 ) ) ( not ( = ?auto_17609 ?auto_17620 ) ) ( not ( = ?auto_17606 ?auto_17612 ) ) ( not ( = ?auto_17606 ?auto_17596 ) ) ( not ( = ?auto_17606 ?auto_17611 ) ) ( not ( = ?auto_17606 ?auto_17623 ) ) ( not ( = ?auto_17606 ?auto_17605 ) ) ( not ( = ?auto_17606 ?auto_17597 ) ) ( not ( = ?auto_17606 ?auto_17624 ) ) ( not ( = ?auto_17606 ?auto_17599 ) ) ( not ( = ?auto_17606 ?auto_17601 ) ) ( not ( = ?auto_17621 ?auto_17616 ) ) ( not ( = ?auto_17621 ?auto_17619 ) ) ( not ( = ?auto_17621 ?auto_17604 ) ) ( not ( = ?auto_17621 ?auto_17625 ) ) ( not ( = ?auto_17621 ?auto_17617 ) ) ( not ( = ?auto_17621 ?auto_17614 ) ) ( not ( = ?auto_17621 ?auto_17602 ) ) ( not ( = ?auto_17621 ?auto_17603 ) ) ( not ( = ?auto_17621 ?auto_17608 ) ) ( not ( = ?auto_17621 ?auto_17622 ) ) ( not ( = ?auto_17577 ?auto_17589 ) ) ( not ( = ?auto_17577 ?auto_17592 ) ) ( not ( = ?auto_17578 ?auto_17589 ) ) ( not ( = ?auto_17578 ?auto_17592 ) ) ( not ( = ?auto_17579 ?auto_17589 ) ) ( not ( = ?auto_17579 ?auto_17592 ) ) ( not ( = ?auto_17580 ?auto_17589 ) ) ( not ( = ?auto_17580 ?auto_17592 ) ) ( not ( = ?auto_17581 ?auto_17589 ) ) ( not ( = ?auto_17581 ?auto_17592 ) ) ( not ( = ?auto_17582 ?auto_17589 ) ) ( not ( = ?auto_17582 ?auto_17592 ) ) ( not ( = ?auto_17583 ?auto_17589 ) ) ( not ( = ?auto_17583 ?auto_17592 ) ) ( not ( = ?auto_17584 ?auto_17589 ) ) ( not ( = ?auto_17584 ?auto_17592 ) ) ( not ( = ?auto_17585 ?auto_17589 ) ) ( not ( = ?auto_17585 ?auto_17592 ) ) ( not ( = ?auto_17586 ?auto_17589 ) ) ( not ( = ?auto_17586 ?auto_17592 ) ) ( not ( = ?auto_17587 ?auto_17589 ) ) ( not ( = ?auto_17587 ?auto_17592 ) ) ( not ( = ?auto_17589 ?auto_17621 ) ) ( not ( = ?auto_17589 ?auto_17616 ) ) ( not ( = ?auto_17589 ?auto_17619 ) ) ( not ( = ?auto_17589 ?auto_17604 ) ) ( not ( = ?auto_17589 ?auto_17625 ) ) ( not ( = ?auto_17589 ?auto_17617 ) ) ( not ( = ?auto_17589 ?auto_17614 ) ) ( not ( = ?auto_17589 ?auto_17602 ) ) ( not ( = ?auto_17589 ?auto_17603 ) ) ( not ( = ?auto_17589 ?auto_17608 ) ) ( not ( = ?auto_17589 ?auto_17622 ) ) ( not ( = ?auto_17591 ?auto_17609 ) ) ( not ( = ?auto_17591 ?auto_17598 ) ) ( not ( = ?auto_17591 ?auto_17613 ) ) ( not ( = ?auto_17591 ?auto_17618 ) ) ( not ( = ?auto_17591 ?auto_17610 ) ) ( not ( = ?auto_17591 ?auto_17607 ) ) ( not ( = ?auto_17591 ?auto_17615 ) ) ( not ( = ?auto_17591 ?auto_17600 ) ) ( not ( = ?auto_17591 ?auto_17626 ) ) ( not ( = ?auto_17591 ?auto_17620 ) ) ( not ( = ?auto_17595 ?auto_17606 ) ) ( not ( = ?auto_17595 ?auto_17612 ) ) ( not ( = ?auto_17595 ?auto_17596 ) ) ( not ( = ?auto_17595 ?auto_17611 ) ) ( not ( = ?auto_17595 ?auto_17623 ) ) ( not ( = ?auto_17595 ?auto_17605 ) ) ( not ( = ?auto_17595 ?auto_17597 ) ) ( not ( = ?auto_17595 ?auto_17624 ) ) ( not ( = ?auto_17595 ?auto_17599 ) ) ( not ( = ?auto_17595 ?auto_17601 ) ) ( not ( = ?auto_17592 ?auto_17621 ) ) ( not ( = ?auto_17592 ?auto_17616 ) ) ( not ( = ?auto_17592 ?auto_17619 ) ) ( not ( = ?auto_17592 ?auto_17604 ) ) ( not ( = ?auto_17592 ?auto_17625 ) ) ( not ( = ?auto_17592 ?auto_17617 ) ) ( not ( = ?auto_17592 ?auto_17614 ) ) ( not ( = ?auto_17592 ?auto_17602 ) ) ( not ( = ?auto_17592 ?auto_17603 ) ) ( not ( = ?auto_17592 ?auto_17608 ) ) ( not ( = ?auto_17592 ?auto_17622 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_17577 ?auto_17578 ?auto_17579 ?auto_17580 ?auto_17581 ?auto_17582 ?auto_17583 ?auto_17584 ?auto_17585 ?auto_17586 ?auto_17587 ?auto_17588 )
      ( MAKE-1CRATE ?auto_17588 ?auto_17589 )
      ( MAKE-12CRATE-VERIFY ?auto_17577 ?auto_17578 ?auto_17579 ?auto_17580 ?auto_17581 ?auto_17582 ?auto_17583 ?auto_17584 ?auto_17585 ?auto_17586 ?auto_17587 ?auto_17588 ?auto_17589 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_17651 - SURFACE
      ?auto_17652 - SURFACE
      ?auto_17653 - SURFACE
      ?auto_17654 - SURFACE
      ?auto_17655 - SURFACE
      ?auto_17656 - SURFACE
      ?auto_17657 - SURFACE
      ?auto_17658 - SURFACE
      ?auto_17659 - SURFACE
      ?auto_17660 - SURFACE
      ?auto_17661 - SURFACE
      ?auto_17662 - SURFACE
      ?auto_17663 - SURFACE
      ?auto_17664 - SURFACE
    )
    :vars
    (
      ?auto_17667 - HOIST
      ?auto_17666 - PLACE
      ?auto_17668 - PLACE
      ?auto_17670 - HOIST
      ?auto_17665 - SURFACE
      ?auto_17671 - PLACE
      ?auto_17693 - HOIST
      ?auto_17672 - SURFACE
      ?auto_17685 - PLACE
      ?auto_17694 - HOIST
      ?auto_17691 - SURFACE
      ?auto_17698 - PLACE
      ?auto_17692 - HOIST
      ?auto_17681 - SURFACE
      ?auto_17697 - PLACE
      ?auto_17683 - HOIST
      ?auto_17677 - SURFACE
      ?auto_17682 - SURFACE
      ?auto_17687 - PLACE
      ?auto_17702 - HOIST
      ?auto_17674 - SURFACE
      ?auto_17680 - PLACE
      ?auto_17696 - HOIST
      ?auto_17676 - SURFACE
      ?auto_17688 - PLACE
      ?auto_17700 - HOIST
      ?auto_17686 - SURFACE
      ?auto_17675 - PLACE
      ?auto_17679 - HOIST
      ?auto_17701 - SURFACE
      ?auto_17678 - PLACE
      ?auto_17673 - HOIST
      ?auto_17690 - SURFACE
      ?auto_17695 - PLACE
      ?auto_17699 - HOIST
      ?auto_17689 - SURFACE
      ?auto_17684 - SURFACE
      ?auto_17669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17667 ?auto_17666 ) ( IS-CRATE ?auto_17664 ) ( not ( = ?auto_17668 ?auto_17666 ) ) ( HOIST-AT ?auto_17670 ?auto_17668 ) ( SURFACE-AT ?auto_17664 ?auto_17668 ) ( ON ?auto_17664 ?auto_17665 ) ( CLEAR ?auto_17664 ) ( not ( = ?auto_17663 ?auto_17664 ) ) ( not ( = ?auto_17663 ?auto_17665 ) ) ( not ( = ?auto_17664 ?auto_17665 ) ) ( not ( = ?auto_17667 ?auto_17670 ) ) ( IS-CRATE ?auto_17663 ) ( not ( = ?auto_17671 ?auto_17666 ) ) ( HOIST-AT ?auto_17693 ?auto_17671 ) ( AVAILABLE ?auto_17693 ) ( SURFACE-AT ?auto_17663 ?auto_17671 ) ( ON ?auto_17663 ?auto_17672 ) ( CLEAR ?auto_17663 ) ( not ( = ?auto_17662 ?auto_17663 ) ) ( not ( = ?auto_17662 ?auto_17672 ) ) ( not ( = ?auto_17663 ?auto_17672 ) ) ( not ( = ?auto_17667 ?auto_17693 ) ) ( IS-CRATE ?auto_17662 ) ( not ( = ?auto_17685 ?auto_17666 ) ) ( HOIST-AT ?auto_17694 ?auto_17685 ) ( AVAILABLE ?auto_17694 ) ( SURFACE-AT ?auto_17662 ?auto_17685 ) ( ON ?auto_17662 ?auto_17691 ) ( CLEAR ?auto_17662 ) ( not ( = ?auto_17661 ?auto_17662 ) ) ( not ( = ?auto_17661 ?auto_17691 ) ) ( not ( = ?auto_17662 ?auto_17691 ) ) ( not ( = ?auto_17667 ?auto_17694 ) ) ( IS-CRATE ?auto_17661 ) ( not ( = ?auto_17698 ?auto_17666 ) ) ( HOIST-AT ?auto_17692 ?auto_17698 ) ( AVAILABLE ?auto_17692 ) ( SURFACE-AT ?auto_17661 ?auto_17698 ) ( ON ?auto_17661 ?auto_17681 ) ( CLEAR ?auto_17661 ) ( not ( = ?auto_17660 ?auto_17661 ) ) ( not ( = ?auto_17660 ?auto_17681 ) ) ( not ( = ?auto_17661 ?auto_17681 ) ) ( not ( = ?auto_17667 ?auto_17692 ) ) ( IS-CRATE ?auto_17660 ) ( not ( = ?auto_17697 ?auto_17666 ) ) ( HOIST-AT ?auto_17683 ?auto_17697 ) ( AVAILABLE ?auto_17683 ) ( SURFACE-AT ?auto_17660 ?auto_17697 ) ( ON ?auto_17660 ?auto_17677 ) ( CLEAR ?auto_17660 ) ( not ( = ?auto_17659 ?auto_17660 ) ) ( not ( = ?auto_17659 ?auto_17677 ) ) ( not ( = ?auto_17660 ?auto_17677 ) ) ( not ( = ?auto_17667 ?auto_17683 ) ) ( IS-CRATE ?auto_17659 ) ( AVAILABLE ?auto_17670 ) ( SURFACE-AT ?auto_17659 ?auto_17668 ) ( ON ?auto_17659 ?auto_17682 ) ( CLEAR ?auto_17659 ) ( not ( = ?auto_17658 ?auto_17659 ) ) ( not ( = ?auto_17658 ?auto_17682 ) ) ( not ( = ?auto_17659 ?auto_17682 ) ) ( IS-CRATE ?auto_17658 ) ( not ( = ?auto_17687 ?auto_17666 ) ) ( HOIST-AT ?auto_17702 ?auto_17687 ) ( AVAILABLE ?auto_17702 ) ( SURFACE-AT ?auto_17658 ?auto_17687 ) ( ON ?auto_17658 ?auto_17674 ) ( CLEAR ?auto_17658 ) ( not ( = ?auto_17657 ?auto_17658 ) ) ( not ( = ?auto_17657 ?auto_17674 ) ) ( not ( = ?auto_17658 ?auto_17674 ) ) ( not ( = ?auto_17667 ?auto_17702 ) ) ( IS-CRATE ?auto_17657 ) ( not ( = ?auto_17680 ?auto_17666 ) ) ( HOIST-AT ?auto_17696 ?auto_17680 ) ( AVAILABLE ?auto_17696 ) ( SURFACE-AT ?auto_17657 ?auto_17680 ) ( ON ?auto_17657 ?auto_17676 ) ( CLEAR ?auto_17657 ) ( not ( = ?auto_17656 ?auto_17657 ) ) ( not ( = ?auto_17656 ?auto_17676 ) ) ( not ( = ?auto_17657 ?auto_17676 ) ) ( not ( = ?auto_17667 ?auto_17696 ) ) ( IS-CRATE ?auto_17656 ) ( not ( = ?auto_17688 ?auto_17666 ) ) ( HOIST-AT ?auto_17700 ?auto_17688 ) ( AVAILABLE ?auto_17700 ) ( SURFACE-AT ?auto_17656 ?auto_17688 ) ( ON ?auto_17656 ?auto_17686 ) ( CLEAR ?auto_17656 ) ( not ( = ?auto_17655 ?auto_17656 ) ) ( not ( = ?auto_17655 ?auto_17686 ) ) ( not ( = ?auto_17656 ?auto_17686 ) ) ( not ( = ?auto_17667 ?auto_17700 ) ) ( IS-CRATE ?auto_17655 ) ( not ( = ?auto_17675 ?auto_17666 ) ) ( HOIST-AT ?auto_17679 ?auto_17675 ) ( AVAILABLE ?auto_17679 ) ( SURFACE-AT ?auto_17655 ?auto_17675 ) ( ON ?auto_17655 ?auto_17701 ) ( CLEAR ?auto_17655 ) ( not ( = ?auto_17654 ?auto_17655 ) ) ( not ( = ?auto_17654 ?auto_17701 ) ) ( not ( = ?auto_17655 ?auto_17701 ) ) ( not ( = ?auto_17667 ?auto_17679 ) ) ( IS-CRATE ?auto_17654 ) ( not ( = ?auto_17678 ?auto_17666 ) ) ( HOIST-AT ?auto_17673 ?auto_17678 ) ( SURFACE-AT ?auto_17654 ?auto_17678 ) ( ON ?auto_17654 ?auto_17690 ) ( CLEAR ?auto_17654 ) ( not ( = ?auto_17653 ?auto_17654 ) ) ( not ( = ?auto_17653 ?auto_17690 ) ) ( not ( = ?auto_17654 ?auto_17690 ) ) ( not ( = ?auto_17667 ?auto_17673 ) ) ( IS-CRATE ?auto_17653 ) ( not ( = ?auto_17695 ?auto_17666 ) ) ( HOIST-AT ?auto_17699 ?auto_17695 ) ( AVAILABLE ?auto_17699 ) ( SURFACE-AT ?auto_17653 ?auto_17695 ) ( ON ?auto_17653 ?auto_17689 ) ( CLEAR ?auto_17653 ) ( not ( = ?auto_17652 ?auto_17653 ) ) ( not ( = ?auto_17652 ?auto_17689 ) ) ( not ( = ?auto_17653 ?auto_17689 ) ) ( not ( = ?auto_17667 ?auto_17699 ) ) ( SURFACE-AT ?auto_17651 ?auto_17666 ) ( CLEAR ?auto_17651 ) ( IS-CRATE ?auto_17652 ) ( AVAILABLE ?auto_17667 ) ( AVAILABLE ?auto_17673 ) ( SURFACE-AT ?auto_17652 ?auto_17678 ) ( ON ?auto_17652 ?auto_17684 ) ( CLEAR ?auto_17652 ) ( TRUCK-AT ?auto_17669 ?auto_17666 ) ( not ( = ?auto_17651 ?auto_17652 ) ) ( not ( = ?auto_17651 ?auto_17684 ) ) ( not ( = ?auto_17652 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17653 ) ) ( not ( = ?auto_17651 ?auto_17689 ) ) ( not ( = ?auto_17653 ?auto_17684 ) ) ( not ( = ?auto_17695 ?auto_17678 ) ) ( not ( = ?auto_17699 ?auto_17673 ) ) ( not ( = ?auto_17689 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17654 ) ) ( not ( = ?auto_17651 ?auto_17690 ) ) ( not ( = ?auto_17652 ?auto_17654 ) ) ( not ( = ?auto_17652 ?auto_17690 ) ) ( not ( = ?auto_17654 ?auto_17689 ) ) ( not ( = ?auto_17654 ?auto_17684 ) ) ( not ( = ?auto_17690 ?auto_17689 ) ) ( not ( = ?auto_17690 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17655 ) ) ( not ( = ?auto_17651 ?auto_17701 ) ) ( not ( = ?auto_17652 ?auto_17655 ) ) ( not ( = ?auto_17652 ?auto_17701 ) ) ( not ( = ?auto_17653 ?auto_17655 ) ) ( not ( = ?auto_17653 ?auto_17701 ) ) ( not ( = ?auto_17655 ?auto_17690 ) ) ( not ( = ?auto_17655 ?auto_17689 ) ) ( not ( = ?auto_17655 ?auto_17684 ) ) ( not ( = ?auto_17675 ?auto_17678 ) ) ( not ( = ?auto_17675 ?auto_17695 ) ) ( not ( = ?auto_17679 ?auto_17673 ) ) ( not ( = ?auto_17679 ?auto_17699 ) ) ( not ( = ?auto_17701 ?auto_17690 ) ) ( not ( = ?auto_17701 ?auto_17689 ) ) ( not ( = ?auto_17701 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17656 ) ) ( not ( = ?auto_17651 ?auto_17686 ) ) ( not ( = ?auto_17652 ?auto_17656 ) ) ( not ( = ?auto_17652 ?auto_17686 ) ) ( not ( = ?auto_17653 ?auto_17656 ) ) ( not ( = ?auto_17653 ?auto_17686 ) ) ( not ( = ?auto_17654 ?auto_17656 ) ) ( not ( = ?auto_17654 ?auto_17686 ) ) ( not ( = ?auto_17656 ?auto_17701 ) ) ( not ( = ?auto_17656 ?auto_17690 ) ) ( not ( = ?auto_17656 ?auto_17689 ) ) ( not ( = ?auto_17656 ?auto_17684 ) ) ( not ( = ?auto_17688 ?auto_17675 ) ) ( not ( = ?auto_17688 ?auto_17678 ) ) ( not ( = ?auto_17688 ?auto_17695 ) ) ( not ( = ?auto_17700 ?auto_17679 ) ) ( not ( = ?auto_17700 ?auto_17673 ) ) ( not ( = ?auto_17700 ?auto_17699 ) ) ( not ( = ?auto_17686 ?auto_17701 ) ) ( not ( = ?auto_17686 ?auto_17690 ) ) ( not ( = ?auto_17686 ?auto_17689 ) ) ( not ( = ?auto_17686 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17657 ) ) ( not ( = ?auto_17651 ?auto_17676 ) ) ( not ( = ?auto_17652 ?auto_17657 ) ) ( not ( = ?auto_17652 ?auto_17676 ) ) ( not ( = ?auto_17653 ?auto_17657 ) ) ( not ( = ?auto_17653 ?auto_17676 ) ) ( not ( = ?auto_17654 ?auto_17657 ) ) ( not ( = ?auto_17654 ?auto_17676 ) ) ( not ( = ?auto_17655 ?auto_17657 ) ) ( not ( = ?auto_17655 ?auto_17676 ) ) ( not ( = ?auto_17657 ?auto_17686 ) ) ( not ( = ?auto_17657 ?auto_17701 ) ) ( not ( = ?auto_17657 ?auto_17690 ) ) ( not ( = ?auto_17657 ?auto_17689 ) ) ( not ( = ?auto_17657 ?auto_17684 ) ) ( not ( = ?auto_17680 ?auto_17688 ) ) ( not ( = ?auto_17680 ?auto_17675 ) ) ( not ( = ?auto_17680 ?auto_17678 ) ) ( not ( = ?auto_17680 ?auto_17695 ) ) ( not ( = ?auto_17696 ?auto_17700 ) ) ( not ( = ?auto_17696 ?auto_17679 ) ) ( not ( = ?auto_17696 ?auto_17673 ) ) ( not ( = ?auto_17696 ?auto_17699 ) ) ( not ( = ?auto_17676 ?auto_17686 ) ) ( not ( = ?auto_17676 ?auto_17701 ) ) ( not ( = ?auto_17676 ?auto_17690 ) ) ( not ( = ?auto_17676 ?auto_17689 ) ) ( not ( = ?auto_17676 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17658 ) ) ( not ( = ?auto_17651 ?auto_17674 ) ) ( not ( = ?auto_17652 ?auto_17658 ) ) ( not ( = ?auto_17652 ?auto_17674 ) ) ( not ( = ?auto_17653 ?auto_17658 ) ) ( not ( = ?auto_17653 ?auto_17674 ) ) ( not ( = ?auto_17654 ?auto_17658 ) ) ( not ( = ?auto_17654 ?auto_17674 ) ) ( not ( = ?auto_17655 ?auto_17658 ) ) ( not ( = ?auto_17655 ?auto_17674 ) ) ( not ( = ?auto_17656 ?auto_17658 ) ) ( not ( = ?auto_17656 ?auto_17674 ) ) ( not ( = ?auto_17658 ?auto_17676 ) ) ( not ( = ?auto_17658 ?auto_17686 ) ) ( not ( = ?auto_17658 ?auto_17701 ) ) ( not ( = ?auto_17658 ?auto_17690 ) ) ( not ( = ?auto_17658 ?auto_17689 ) ) ( not ( = ?auto_17658 ?auto_17684 ) ) ( not ( = ?auto_17687 ?auto_17680 ) ) ( not ( = ?auto_17687 ?auto_17688 ) ) ( not ( = ?auto_17687 ?auto_17675 ) ) ( not ( = ?auto_17687 ?auto_17678 ) ) ( not ( = ?auto_17687 ?auto_17695 ) ) ( not ( = ?auto_17702 ?auto_17696 ) ) ( not ( = ?auto_17702 ?auto_17700 ) ) ( not ( = ?auto_17702 ?auto_17679 ) ) ( not ( = ?auto_17702 ?auto_17673 ) ) ( not ( = ?auto_17702 ?auto_17699 ) ) ( not ( = ?auto_17674 ?auto_17676 ) ) ( not ( = ?auto_17674 ?auto_17686 ) ) ( not ( = ?auto_17674 ?auto_17701 ) ) ( not ( = ?auto_17674 ?auto_17690 ) ) ( not ( = ?auto_17674 ?auto_17689 ) ) ( not ( = ?auto_17674 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17659 ) ) ( not ( = ?auto_17651 ?auto_17682 ) ) ( not ( = ?auto_17652 ?auto_17659 ) ) ( not ( = ?auto_17652 ?auto_17682 ) ) ( not ( = ?auto_17653 ?auto_17659 ) ) ( not ( = ?auto_17653 ?auto_17682 ) ) ( not ( = ?auto_17654 ?auto_17659 ) ) ( not ( = ?auto_17654 ?auto_17682 ) ) ( not ( = ?auto_17655 ?auto_17659 ) ) ( not ( = ?auto_17655 ?auto_17682 ) ) ( not ( = ?auto_17656 ?auto_17659 ) ) ( not ( = ?auto_17656 ?auto_17682 ) ) ( not ( = ?auto_17657 ?auto_17659 ) ) ( not ( = ?auto_17657 ?auto_17682 ) ) ( not ( = ?auto_17659 ?auto_17674 ) ) ( not ( = ?auto_17659 ?auto_17676 ) ) ( not ( = ?auto_17659 ?auto_17686 ) ) ( not ( = ?auto_17659 ?auto_17701 ) ) ( not ( = ?auto_17659 ?auto_17690 ) ) ( not ( = ?auto_17659 ?auto_17689 ) ) ( not ( = ?auto_17659 ?auto_17684 ) ) ( not ( = ?auto_17668 ?auto_17687 ) ) ( not ( = ?auto_17668 ?auto_17680 ) ) ( not ( = ?auto_17668 ?auto_17688 ) ) ( not ( = ?auto_17668 ?auto_17675 ) ) ( not ( = ?auto_17668 ?auto_17678 ) ) ( not ( = ?auto_17668 ?auto_17695 ) ) ( not ( = ?auto_17670 ?auto_17702 ) ) ( not ( = ?auto_17670 ?auto_17696 ) ) ( not ( = ?auto_17670 ?auto_17700 ) ) ( not ( = ?auto_17670 ?auto_17679 ) ) ( not ( = ?auto_17670 ?auto_17673 ) ) ( not ( = ?auto_17670 ?auto_17699 ) ) ( not ( = ?auto_17682 ?auto_17674 ) ) ( not ( = ?auto_17682 ?auto_17676 ) ) ( not ( = ?auto_17682 ?auto_17686 ) ) ( not ( = ?auto_17682 ?auto_17701 ) ) ( not ( = ?auto_17682 ?auto_17690 ) ) ( not ( = ?auto_17682 ?auto_17689 ) ) ( not ( = ?auto_17682 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17660 ) ) ( not ( = ?auto_17651 ?auto_17677 ) ) ( not ( = ?auto_17652 ?auto_17660 ) ) ( not ( = ?auto_17652 ?auto_17677 ) ) ( not ( = ?auto_17653 ?auto_17660 ) ) ( not ( = ?auto_17653 ?auto_17677 ) ) ( not ( = ?auto_17654 ?auto_17660 ) ) ( not ( = ?auto_17654 ?auto_17677 ) ) ( not ( = ?auto_17655 ?auto_17660 ) ) ( not ( = ?auto_17655 ?auto_17677 ) ) ( not ( = ?auto_17656 ?auto_17660 ) ) ( not ( = ?auto_17656 ?auto_17677 ) ) ( not ( = ?auto_17657 ?auto_17660 ) ) ( not ( = ?auto_17657 ?auto_17677 ) ) ( not ( = ?auto_17658 ?auto_17660 ) ) ( not ( = ?auto_17658 ?auto_17677 ) ) ( not ( = ?auto_17660 ?auto_17682 ) ) ( not ( = ?auto_17660 ?auto_17674 ) ) ( not ( = ?auto_17660 ?auto_17676 ) ) ( not ( = ?auto_17660 ?auto_17686 ) ) ( not ( = ?auto_17660 ?auto_17701 ) ) ( not ( = ?auto_17660 ?auto_17690 ) ) ( not ( = ?auto_17660 ?auto_17689 ) ) ( not ( = ?auto_17660 ?auto_17684 ) ) ( not ( = ?auto_17697 ?auto_17668 ) ) ( not ( = ?auto_17697 ?auto_17687 ) ) ( not ( = ?auto_17697 ?auto_17680 ) ) ( not ( = ?auto_17697 ?auto_17688 ) ) ( not ( = ?auto_17697 ?auto_17675 ) ) ( not ( = ?auto_17697 ?auto_17678 ) ) ( not ( = ?auto_17697 ?auto_17695 ) ) ( not ( = ?auto_17683 ?auto_17670 ) ) ( not ( = ?auto_17683 ?auto_17702 ) ) ( not ( = ?auto_17683 ?auto_17696 ) ) ( not ( = ?auto_17683 ?auto_17700 ) ) ( not ( = ?auto_17683 ?auto_17679 ) ) ( not ( = ?auto_17683 ?auto_17673 ) ) ( not ( = ?auto_17683 ?auto_17699 ) ) ( not ( = ?auto_17677 ?auto_17682 ) ) ( not ( = ?auto_17677 ?auto_17674 ) ) ( not ( = ?auto_17677 ?auto_17676 ) ) ( not ( = ?auto_17677 ?auto_17686 ) ) ( not ( = ?auto_17677 ?auto_17701 ) ) ( not ( = ?auto_17677 ?auto_17690 ) ) ( not ( = ?auto_17677 ?auto_17689 ) ) ( not ( = ?auto_17677 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17661 ) ) ( not ( = ?auto_17651 ?auto_17681 ) ) ( not ( = ?auto_17652 ?auto_17661 ) ) ( not ( = ?auto_17652 ?auto_17681 ) ) ( not ( = ?auto_17653 ?auto_17661 ) ) ( not ( = ?auto_17653 ?auto_17681 ) ) ( not ( = ?auto_17654 ?auto_17661 ) ) ( not ( = ?auto_17654 ?auto_17681 ) ) ( not ( = ?auto_17655 ?auto_17661 ) ) ( not ( = ?auto_17655 ?auto_17681 ) ) ( not ( = ?auto_17656 ?auto_17661 ) ) ( not ( = ?auto_17656 ?auto_17681 ) ) ( not ( = ?auto_17657 ?auto_17661 ) ) ( not ( = ?auto_17657 ?auto_17681 ) ) ( not ( = ?auto_17658 ?auto_17661 ) ) ( not ( = ?auto_17658 ?auto_17681 ) ) ( not ( = ?auto_17659 ?auto_17661 ) ) ( not ( = ?auto_17659 ?auto_17681 ) ) ( not ( = ?auto_17661 ?auto_17677 ) ) ( not ( = ?auto_17661 ?auto_17682 ) ) ( not ( = ?auto_17661 ?auto_17674 ) ) ( not ( = ?auto_17661 ?auto_17676 ) ) ( not ( = ?auto_17661 ?auto_17686 ) ) ( not ( = ?auto_17661 ?auto_17701 ) ) ( not ( = ?auto_17661 ?auto_17690 ) ) ( not ( = ?auto_17661 ?auto_17689 ) ) ( not ( = ?auto_17661 ?auto_17684 ) ) ( not ( = ?auto_17698 ?auto_17697 ) ) ( not ( = ?auto_17698 ?auto_17668 ) ) ( not ( = ?auto_17698 ?auto_17687 ) ) ( not ( = ?auto_17698 ?auto_17680 ) ) ( not ( = ?auto_17698 ?auto_17688 ) ) ( not ( = ?auto_17698 ?auto_17675 ) ) ( not ( = ?auto_17698 ?auto_17678 ) ) ( not ( = ?auto_17698 ?auto_17695 ) ) ( not ( = ?auto_17692 ?auto_17683 ) ) ( not ( = ?auto_17692 ?auto_17670 ) ) ( not ( = ?auto_17692 ?auto_17702 ) ) ( not ( = ?auto_17692 ?auto_17696 ) ) ( not ( = ?auto_17692 ?auto_17700 ) ) ( not ( = ?auto_17692 ?auto_17679 ) ) ( not ( = ?auto_17692 ?auto_17673 ) ) ( not ( = ?auto_17692 ?auto_17699 ) ) ( not ( = ?auto_17681 ?auto_17677 ) ) ( not ( = ?auto_17681 ?auto_17682 ) ) ( not ( = ?auto_17681 ?auto_17674 ) ) ( not ( = ?auto_17681 ?auto_17676 ) ) ( not ( = ?auto_17681 ?auto_17686 ) ) ( not ( = ?auto_17681 ?auto_17701 ) ) ( not ( = ?auto_17681 ?auto_17690 ) ) ( not ( = ?auto_17681 ?auto_17689 ) ) ( not ( = ?auto_17681 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17662 ) ) ( not ( = ?auto_17651 ?auto_17691 ) ) ( not ( = ?auto_17652 ?auto_17662 ) ) ( not ( = ?auto_17652 ?auto_17691 ) ) ( not ( = ?auto_17653 ?auto_17662 ) ) ( not ( = ?auto_17653 ?auto_17691 ) ) ( not ( = ?auto_17654 ?auto_17662 ) ) ( not ( = ?auto_17654 ?auto_17691 ) ) ( not ( = ?auto_17655 ?auto_17662 ) ) ( not ( = ?auto_17655 ?auto_17691 ) ) ( not ( = ?auto_17656 ?auto_17662 ) ) ( not ( = ?auto_17656 ?auto_17691 ) ) ( not ( = ?auto_17657 ?auto_17662 ) ) ( not ( = ?auto_17657 ?auto_17691 ) ) ( not ( = ?auto_17658 ?auto_17662 ) ) ( not ( = ?auto_17658 ?auto_17691 ) ) ( not ( = ?auto_17659 ?auto_17662 ) ) ( not ( = ?auto_17659 ?auto_17691 ) ) ( not ( = ?auto_17660 ?auto_17662 ) ) ( not ( = ?auto_17660 ?auto_17691 ) ) ( not ( = ?auto_17662 ?auto_17681 ) ) ( not ( = ?auto_17662 ?auto_17677 ) ) ( not ( = ?auto_17662 ?auto_17682 ) ) ( not ( = ?auto_17662 ?auto_17674 ) ) ( not ( = ?auto_17662 ?auto_17676 ) ) ( not ( = ?auto_17662 ?auto_17686 ) ) ( not ( = ?auto_17662 ?auto_17701 ) ) ( not ( = ?auto_17662 ?auto_17690 ) ) ( not ( = ?auto_17662 ?auto_17689 ) ) ( not ( = ?auto_17662 ?auto_17684 ) ) ( not ( = ?auto_17685 ?auto_17698 ) ) ( not ( = ?auto_17685 ?auto_17697 ) ) ( not ( = ?auto_17685 ?auto_17668 ) ) ( not ( = ?auto_17685 ?auto_17687 ) ) ( not ( = ?auto_17685 ?auto_17680 ) ) ( not ( = ?auto_17685 ?auto_17688 ) ) ( not ( = ?auto_17685 ?auto_17675 ) ) ( not ( = ?auto_17685 ?auto_17678 ) ) ( not ( = ?auto_17685 ?auto_17695 ) ) ( not ( = ?auto_17694 ?auto_17692 ) ) ( not ( = ?auto_17694 ?auto_17683 ) ) ( not ( = ?auto_17694 ?auto_17670 ) ) ( not ( = ?auto_17694 ?auto_17702 ) ) ( not ( = ?auto_17694 ?auto_17696 ) ) ( not ( = ?auto_17694 ?auto_17700 ) ) ( not ( = ?auto_17694 ?auto_17679 ) ) ( not ( = ?auto_17694 ?auto_17673 ) ) ( not ( = ?auto_17694 ?auto_17699 ) ) ( not ( = ?auto_17691 ?auto_17681 ) ) ( not ( = ?auto_17691 ?auto_17677 ) ) ( not ( = ?auto_17691 ?auto_17682 ) ) ( not ( = ?auto_17691 ?auto_17674 ) ) ( not ( = ?auto_17691 ?auto_17676 ) ) ( not ( = ?auto_17691 ?auto_17686 ) ) ( not ( = ?auto_17691 ?auto_17701 ) ) ( not ( = ?auto_17691 ?auto_17690 ) ) ( not ( = ?auto_17691 ?auto_17689 ) ) ( not ( = ?auto_17691 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17663 ) ) ( not ( = ?auto_17651 ?auto_17672 ) ) ( not ( = ?auto_17652 ?auto_17663 ) ) ( not ( = ?auto_17652 ?auto_17672 ) ) ( not ( = ?auto_17653 ?auto_17663 ) ) ( not ( = ?auto_17653 ?auto_17672 ) ) ( not ( = ?auto_17654 ?auto_17663 ) ) ( not ( = ?auto_17654 ?auto_17672 ) ) ( not ( = ?auto_17655 ?auto_17663 ) ) ( not ( = ?auto_17655 ?auto_17672 ) ) ( not ( = ?auto_17656 ?auto_17663 ) ) ( not ( = ?auto_17656 ?auto_17672 ) ) ( not ( = ?auto_17657 ?auto_17663 ) ) ( not ( = ?auto_17657 ?auto_17672 ) ) ( not ( = ?auto_17658 ?auto_17663 ) ) ( not ( = ?auto_17658 ?auto_17672 ) ) ( not ( = ?auto_17659 ?auto_17663 ) ) ( not ( = ?auto_17659 ?auto_17672 ) ) ( not ( = ?auto_17660 ?auto_17663 ) ) ( not ( = ?auto_17660 ?auto_17672 ) ) ( not ( = ?auto_17661 ?auto_17663 ) ) ( not ( = ?auto_17661 ?auto_17672 ) ) ( not ( = ?auto_17663 ?auto_17691 ) ) ( not ( = ?auto_17663 ?auto_17681 ) ) ( not ( = ?auto_17663 ?auto_17677 ) ) ( not ( = ?auto_17663 ?auto_17682 ) ) ( not ( = ?auto_17663 ?auto_17674 ) ) ( not ( = ?auto_17663 ?auto_17676 ) ) ( not ( = ?auto_17663 ?auto_17686 ) ) ( not ( = ?auto_17663 ?auto_17701 ) ) ( not ( = ?auto_17663 ?auto_17690 ) ) ( not ( = ?auto_17663 ?auto_17689 ) ) ( not ( = ?auto_17663 ?auto_17684 ) ) ( not ( = ?auto_17671 ?auto_17685 ) ) ( not ( = ?auto_17671 ?auto_17698 ) ) ( not ( = ?auto_17671 ?auto_17697 ) ) ( not ( = ?auto_17671 ?auto_17668 ) ) ( not ( = ?auto_17671 ?auto_17687 ) ) ( not ( = ?auto_17671 ?auto_17680 ) ) ( not ( = ?auto_17671 ?auto_17688 ) ) ( not ( = ?auto_17671 ?auto_17675 ) ) ( not ( = ?auto_17671 ?auto_17678 ) ) ( not ( = ?auto_17671 ?auto_17695 ) ) ( not ( = ?auto_17693 ?auto_17694 ) ) ( not ( = ?auto_17693 ?auto_17692 ) ) ( not ( = ?auto_17693 ?auto_17683 ) ) ( not ( = ?auto_17693 ?auto_17670 ) ) ( not ( = ?auto_17693 ?auto_17702 ) ) ( not ( = ?auto_17693 ?auto_17696 ) ) ( not ( = ?auto_17693 ?auto_17700 ) ) ( not ( = ?auto_17693 ?auto_17679 ) ) ( not ( = ?auto_17693 ?auto_17673 ) ) ( not ( = ?auto_17693 ?auto_17699 ) ) ( not ( = ?auto_17672 ?auto_17691 ) ) ( not ( = ?auto_17672 ?auto_17681 ) ) ( not ( = ?auto_17672 ?auto_17677 ) ) ( not ( = ?auto_17672 ?auto_17682 ) ) ( not ( = ?auto_17672 ?auto_17674 ) ) ( not ( = ?auto_17672 ?auto_17676 ) ) ( not ( = ?auto_17672 ?auto_17686 ) ) ( not ( = ?auto_17672 ?auto_17701 ) ) ( not ( = ?auto_17672 ?auto_17690 ) ) ( not ( = ?auto_17672 ?auto_17689 ) ) ( not ( = ?auto_17672 ?auto_17684 ) ) ( not ( = ?auto_17651 ?auto_17664 ) ) ( not ( = ?auto_17651 ?auto_17665 ) ) ( not ( = ?auto_17652 ?auto_17664 ) ) ( not ( = ?auto_17652 ?auto_17665 ) ) ( not ( = ?auto_17653 ?auto_17664 ) ) ( not ( = ?auto_17653 ?auto_17665 ) ) ( not ( = ?auto_17654 ?auto_17664 ) ) ( not ( = ?auto_17654 ?auto_17665 ) ) ( not ( = ?auto_17655 ?auto_17664 ) ) ( not ( = ?auto_17655 ?auto_17665 ) ) ( not ( = ?auto_17656 ?auto_17664 ) ) ( not ( = ?auto_17656 ?auto_17665 ) ) ( not ( = ?auto_17657 ?auto_17664 ) ) ( not ( = ?auto_17657 ?auto_17665 ) ) ( not ( = ?auto_17658 ?auto_17664 ) ) ( not ( = ?auto_17658 ?auto_17665 ) ) ( not ( = ?auto_17659 ?auto_17664 ) ) ( not ( = ?auto_17659 ?auto_17665 ) ) ( not ( = ?auto_17660 ?auto_17664 ) ) ( not ( = ?auto_17660 ?auto_17665 ) ) ( not ( = ?auto_17661 ?auto_17664 ) ) ( not ( = ?auto_17661 ?auto_17665 ) ) ( not ( = ?auto_17662 ?auto_17664 ) ) ( not ( = ?auto_17662 ?auto_17665 ) ) ( not ( = ?auto_17664 ?auto_17672 ) ) ( not ( = ?auto_17664 ?auto_17691 ) ) ( not ( = ?auto_17664 ?auto_17681 ) ) ( not ( = ?auto_17664 ?auto_17677 ) ) ( not ( = ?auto_17664 ?auto_17682 ) ) ( not ( = ?auto_17664 ?auto_17674 ) ) ( not ( = ?auto_17664 ?auto_17676 ) ) ( not ( = ?auto_17664 ?auto_17686 ) ) ( not ( = ?auto_17664 ?auto_17701 ) ) ( not ( = ?auto_17664 ?auto_17690 ) ) ( not ( = ?auto_17664 ?auto_17689 ) ) ( not ( = ?auto_17664 ?auto_17684 ) ) ( not ( = ?auto_17665 ?auto_17672 ) ) ( not ( = ?auto_17665 ?auto_17691 ) ) ( not ( = ?auto_17665 ?auto_17681 ) ) ( not ( = ?auto_17665 ?auto_17677 ) ) ( not ( = ?auto_17665 ?auto_17682 ) ) ( not ( = ?auto_17665 ?auto_17674 ) ) ( not ( = ?auto_17665 ?auto_17676 ) ) ( not ( = ?auto_17665 ?auto_17686 ) ) ( not ( = ?auto_17665 ?auto_17701 ) ) ( not ( = ?auto_17665 ?auto_17690 ) ) ( not ( = ?auto_17665 ?auto_17689 ) ) ( not ( = ?auto_17665 ?auto_17684 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_17651 ?auto_17652 ?auto_17653 ?auto_17654 ?auto_17655 ?auto_17656 ?auto_17657 ?auto_17658 ?auto_17659 ?auto_17660 ?auto_17661 ?auto_17662 ?auto_17663 )
      ( MAKE-1CRATE ?auto_17663 ?auto_17664 )
      ( MAKE-13CRATE-VERIFY ?auto_17651 ?auto_17652 ?auto_17653 ?auto_17654 ?auto_17655 ?auto_17656 ?auto_17657 ?auto_17658 ?auto_17659 ?auto_17660 ?auto_17661 ?auto_17662 ?auto_17663 ?auto_17664 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_17728 - SURFACE
      ?auto_17729 - SURFACE
      ?auto_17730 - SURFACE
      ?auto_17731 - SURFACE
      ?auto_17732 - SURFACE
      ?auto_17733 - SURFACE
      ?auto_17734 - SURFACE
      ?auto_17735 - SURFACE
      ?auto_17736 - SURFACE
      ?auto_17737 - SURFACE
      ?auto_17738 - SURFACE
      ?auto_17739 - SURFACE
      ?auto_17740 - SURFACE
      ?auto_17741 - SURFACE
      ?auto_17742 - SURFACE
    )
    :vars
    (
      ?auto_17747 - HOIST
      ?auto_17743 - PLACE
      ?auto_17746 - PLACE
      ?auto_17745 - HOIST
      ?auto_17748 - SURFACE
      ?auto_17782 - PLACE
      ?auto_17777 - HOIST
      ?auto_17762 - SURFACE
      ?auto_17761 - PLACE
      ?auto_17780 - HOIST
      ?auto_17775 - SURFACE
      ?auto_17751 - PLACE
      ?auto_17770 - HOIST
      ?auto_17765 - SURFACE
      ?auto_17783 - PLACE
      ?auto_17753 - HOIST
      ?auto_17750 - SURFACE
      ?auto_17779 - PLACE
      ?auto_17749 - HOIST
      ?auto_17758 - SURFACE
      ?auto_17781 - SURFACE
      ?auto_17754 - PLACE
      ?auto_17776 - HOIST
      ?auto_17773 - SURFACE
      ?auto_17771 - PLACE
      ?auto_17763 - HOIST
      ?auto_17766 - SURFACE
      ?auto_17769 - PLACE
      ?auto_17752 - HOIST
      ?auto_17755 - SURFACE
      ?auto_17774 - PLACE
      ?auto_17756 - HOIST
      ?auto_17778 - SURFACE
      ?auto_17772 - PLACE
      ?auto_17760 - HOIST
      ?auto_17759 - SURFACE
      ?auto_17764 - PLACE
      ?auto_17767 - HOIST
      ?auto_17768 - SURFACE
      ?auto_17757 - SURFACE
      ?auto_17744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17747 ?auto_17743 ) ( IS-CRATE ?auto_17742 ) ( not ( = ?auto_17746 ?auto_17743 ) ) ( HOIST-AT ?auto_17745 ?auto_17746 ) ( AVAILABLE ?auto_17745 ) ( SURFACE-AT ?auto_17742 ?auto_17746 ) ( ON ?auto_17742 ?auto_17748 ) ( CLEAR ?auto_17742 ) ( not ( = ?auto_17741 ?auto_17742 ) ) ( not ( = ?auto_17741 ?auto_17748 ) ) ( not ( = ?auto_17742 ?auto_17748 ) ) ( not ( = ?auto_17747 ?auto_17745 ) ) ( IS-CRATE ?auto_17741 ) ( not ( = ?auto_17782 ?auto_17743 ) ) ( HOIST-AT ?auto_17777 ?auto_17782 ) ( SURFACE-AT ?auto_17741 ?auto_17782 ) ( ON ?auto_17741 ?auto_17762 ) ( CLEAR ?auto_17741 ) ( not ( = ?auto_17740 ?auto_17741 ) ) ( not ( = ?auto_17740 ?auto_17762 ) ) ( not ( = ?auto_17741 ?auto_17762 ) ) ( not ( = ?auto_17747 ?auto_17777 ) ) ( IS-CRATE ?auto_17740 ) ( not ( = ?auto_17761 ?auto_17743 ) ) ( HOIST-AT ?auto_17780 ?auto_17761 ) ( AVAILABLE ?auto_17780 ) ( SURFACE-AT ?auto_17740 ?auto_17761 ) ( ON ?auto_17740 ?auto_17775 ) ( CLEAR ?auto_17740 ) ( not ( = ?auto_17739 ?auto_17740 ) ) ( not ( = ?auto_17739 ?auto_17775 ) ) ( not ( = ?auto_17740 ?auto_17775 ) ) ( not ( = ?auto_17747 ?auto_17780 ) ) ( IS-CRATE ?auto_17739 ) ( not ( = ?auto_17751 ?auto_17743 ) ) ( HOIST-AT ?auto_17770 ?auto_17751 ) ( AVAILABLE ?auto_17770 ) ( SURFACE-AT ?auto_17739 ?auto_17751 ) ( ON ?auto_17739 ?auto_17765 ) ( CLEAR ?auto_17739 ) ( not ( = ?auto_17738 ?auto_17739 ) ) ( not ( = ?auto_17738 ?auto_17765 ) ) ( not ( = ?auto_17739 ?auto_17765 ) ) ( not ( = ?auto_17747 ?auto_17770 ) ) ( IS-CRATE ?auto_17738 ) ( not ( = ?auto_17783 ?auto_17743 ) ) ( HOIST-AT ?auto_17753 ?auto_17783 ) ( AVAILABLE ?auto_17753 ) ( SURFACE-AT ?auto_17738 ?auto_17783 ) ( ON ?auto_17738 ?auto_17750 ) ( CLEAR ?auto_17738 ) ( not ( = ?auto_17737 ?auto_17738 ) ) ( not ( = ?auto_17737 ?auto_17750 ) ) ( not ( = ?auto_17738 ?auto_17750 ) ) ( not ( = ?auto_17747 ?auto_17753 ) ) ( IS-CRATE ?auto_17737 ) ( not ( = ?auto_17779 ?auto_17743 ) ) ( HOIST-AT ?auto_17749 ?auto_17779 ) ( AVAILABLE ?auto_17749 ) ( SURFACE-AT ?auto_17737 ?auto_17779 ) ( ON ?auto_17737 ?auto_17758 ) ( CLEAR ?auto_17737 ) ( not ( = ?auto_17736 ?auto_17737 ) ) ( not ( = ?auto_17736 ?auto_17758 ) ) ( not ( = ?auto_17737 ?auto_17758 ) ) ( not ( = ?auto_17747 ?auto_17749 ) ) ( IS-CRATE ?auto_17736 ) ( AVAILABLE ?auto_17777 ) ( SURFACE-AT ?auto_17736 ?auto_17782 ) ( ON ?auto_17736 ?auto_17781 ) ( CLEAR ?auto_17736 ) ( not ( = ?auto_17735 ?auto_17736 ) ) ( not ( = ?auto_17735 ?auto_17781 ) ) ( not ( = ?auto_17736 ?auto_17781 ) ) ( IS-CRATE ?auto_17735 ) ( not ( = ?auto_17754 ?auto_17743 ) ) ( HOIST-AT ?auto_17776 ?auto_17754 ) ( AVAILABLE ?auto_17776 ) ( SURFACE-AT ?auto_17735 ?auto_17754 ) ( ON ?auto_17735 ?auto_17773 ) ( CLEAR ?auto_17735 ) ( not ( = ?auto_17734 ?auto_17735 ) ) ( not ( = ?auto_17734 ?auto_17773 ) ) ( not ( = ?auto_17735 ?auto_17773 ) ) ( not ( = ?auto_17747 ?auto_17776 ) ) ( IS-CRATE ?auto_17734 ) ( not ( = ?auto_17771 ?auto_17743 ) ) ( HOIST-AT ?auto_17763 ?auto_17771 ) ( AVAILABLE ?auto_17763 ) ( SURFACE-AT ?auto_17734 ?auto_17771 ) ( ON ?auto_17734 ?auto_17766 ) ( CLEAR ?auto_17734 ) ( not ( = ?auto_17733 ?auto_17734 ) ) ( not ( = ?auto_17733 ?auto_17766 ) ) ( not ( = ?auto_17734 ?auto_17766 ) ) ( not ( = ?auto_17747 ?auto_17763 ) ) ( IS-CRATE ?auto_17733 ) ( not ( = ?auto_17769 ?auto_17743 ) ) ( HOIST-AT ?auto_17752 ?auto_17769 ) ( AVAILABLE ?auto_17752 ) ( SURFACE-AT ?auto_17733 ?auto_17769 ) ( ON ?auto_17733 ?auto_17755 ) ( CLEAR ?auto_17733 ) ( not ( = ?auto_17732 ?auto_17733 ) ) ( not ( = ?auto_17732 ?auto_17755 ) ) ( not ( = ?auto_17733 ?auto_17755 ) ) ( not ( = ?auto_17747 ?auto_17752 ) ) ( IS-CRATE ?auto_17732 ) ( not ( = ?auto_17774 ?auto_17743 ) ) ( HOIST-AT ?auto_17756 ?auto_17774 ) ( AVAILABLE ?auto_17756 ) ( SURFACE-AT ?auto_17732 ?auto_17774 ) ( ON ?auto_17732 ?auto_17778 ) ( CLEAR ?auto_17732 ) ( not ( = ?auto_17731 ?auto_17732 ) ) ( not ( = ?auto_17731 ?auto_17778 ) ) ( not ( = ?auto_17732 ?auto_17778 ) ) ( not ( = ?auto_17747 ?auto_17756 ) ) ( IS-CRATE ?auto_17731 ) ( not ( = ?auto_17772 ?auto_17743 ) ) ( HOIST-AT ?auto_17760 ?auto_17772 ) ( SURFACE-AT ?auto_17731 ?auto_17772 ) ( ON ?auto_17731 ?auto_17759 ) ( CLEAR ?auto_17731 ) ( not ( = ?auto_17730 ?auto_17731 ) ) ( not ( = ?auto_17730 ?auto_17759 ) ) ( not ( = ?auto_17731 ?auto_17759 ) ) ( not ( = ?auto_17747 ?auto_17760 ) ) ( IS-CRATE ?auto_17730 ) ( not ( = ?auto_17764 ?auto_17743 ) ) ( HOIST-AT ?auto_17767 ?auto_17764 ) ( AVAILABLE ?auto_17767 ) ( SURFACE-AT ?auto_17730 ?auto_17764 ) ( ON ?auto_17730 ?auto_17768 ) ( CLEAR ?auto_17730 ) ( not ( = ?auto_17729 ?auto_17730 ) ) ( not ( = ?auto_17729 ?auto_17768 ) ) ( not ( = ?auto_17730 ?auto_17768 ) ) ( not ( = ?auto_17747 ?auto_17767 ) ) ( SURFACE-AT ?auto_17728 ?auto_17743 ) ( CLEAR ?auto_17728 ) ( IS-CRATE ?auto_17729 ) ( AVAILABLE ?auto_17747 ) ( AVAILABLE ?auto_17760 ) ( SURFACE-AT ?auto_17729 ?auto_17772 ) ( ON ?auto_17729 ?auto_17757 ) ( CLEAR ?auto_17729 ) ( TRUCK-AT ?auto_17744 ?auto_17743 ) ( not ( = ?auto_17728 ?auto_17729 ) ) ( not ( = ?auto_17728 ?auto_17757 ) ) ( not ( = ?auto_17729 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17730 ) ) ( not ( = ?auto_17728 ?auto_17768 ) ) ( not ( = ?auto_17730 ?auto_17757 ) ) ( not ( = ?auto_17764 ?auto_17772 ) ) ( not ( = ?auto_17767 ?auto_17760 ) ) ( not ( = ?auto_17768 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17731 ) ) ( not ( = ?auto_17728 ?auto_17759 ) ) ( not ( = ?auto_17729 ?auto_17731 ) ) ( not ( = ?auto_17729 ?auto_17759 ) ) ( not ( = ?auto_17731 ?auto_17768 ) ) ( not ( = ?auto_17731 ?auto_17757 ) ) ( not ( = ?auto_17759 ?auto_17768 ) ) ( not ( = ?auto_17759 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17732 ) ) ( not ( = ?auto_17728 ?auto_17778 ) ) ( not ( = ?auto_17729 ?auto_17732 ) ) ( not ( = ?auto_17729 ?auto_17778 ) ) ( not ( = ?auto_17730 ?auto_17732 ) ) ( not ( = ?auto_17730 ?auto_17778 ) ) ( not ( = ?auto_17732 ?auto_17759 ) ) ( not ( = ?auto_17732 ?auto_17768 ) ) ( not ( = ?auto_17732 ?auto_17757 ) ) ( not ( = ?auto_17774 ?auto_17772 ) ) ( not ( = ?auto_17774 ?auto_17764 ) ) ( not ( = ?auto_17756 ?auto_17760 ) ) ( not ( = ?auto_17756 ?auto_17767 ) ) ( not ( = ?auto_17778 ?auto_17759 ) ) ( not ( = ?auto_17778 ?auto_17768 ) ) ( not ( = ?auto_17778 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17733 ) ) ( not ( = ?auto_17728 ?auto_17755 ) ) ( not ( = ?auto_17729 ?auto_17733 ) ) ( not ( = ?auto_17729 ?auto_17755 ) ) ( not ( = ?auto_17730 ?auto_17733 ) ) ( not ( = ?auto_17730 ?auto_17755 ) ) ( not ( = ?auto_17731 ?auto_17733 ) ) ( not ( = ?auto_17731 ?auto_17755 ) ) ( not ( = ?auto_17733 ?auto_17778 ) ) ( not ( = ?auto_17733 ?auto_17759 ) ) ( not ( = ?auto_17733 ?auto_17768 ) ) ( not ( = ?auto_17733 ?auto_17757 ) ) ( not ( = ?auto_17769 ?auto_17774 ) ) ( not ( = ?auto_17769 ?auto_17772 ) ) ( not ( = ?auto_17769 ?auto_17764 ) ) ( not ( = ?auto_17752 ?auto_17756 ) ) ( not ( = ?auto_17752 ?auto_17760 ) ) ( not ( = ?auto_17752 ?auto_17767 ) ) ( not ( = ?auto_17755 ?auto_17778 ) ) ( not ( = ?auto_17755 ?auto_17759 ) ) ( not ( = ?auto_17755 ?auto_17768 ) ) ( not ( = ?auto_17755 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17734 ) ) ( not ( = ?auto_17728 ?auto_17766 ) ) ( not ( = ?auto_17729 ?auto_17734 ) ) ( not ( = ?auto_17729 ?auto_17766 ) ) ( not ( = ?auto_17730 ?auto_17734 ) ) ( not ( = ?auto_17730 ?auto_17766 ) ) ( not ( = ?auto_17731 ?auto_17734 ) ) ( not ( = ?auto_17731 ?auto_17766 ) ) ( not ( = ?auto_17732 ?auto_17734 ) ) ( not ( = ?auto_17732 ?auto_17766 ) ) ( not ( = ?auto_17734 ?auto_17755 ) ) ( not ( = ?auto_17734 ?auto_17778 ) ) ( not ( = ?auto_17734 ?auto_17759 ) ) ( not ( = ?auto_17734 ?auto_17768 ) ) ( not ( = ?auto_17734 ?auto_17757 ) ) ( not ( = ?auto_17771 ?auto_17769 ) ) ( not ( = ?auto_17771 ?auto_17774 ) ) ( not ( = ?auto_17771 ?auto_17772 ) ) ( not ( = ?auto_17771 ?auto_17764 ) ) ( not ( = ?auto_17763 ?auto_17752 ) ) ( not ( = ?auto_17763 ?auto_17756 ) ) ( not ( = ?auto_17763 ?auto_17760 ) ) ( not ( = ?auto_17763 ?auto_17767 ) ) ( not ( = ?auto_17766 ?auto_17755 ) ) ( not ( = ?auto_17766 ?auto_17778 ) ) ( not ( = ?auto_17766 ?auto_17759 ) ) ( not ( = ?auto_17766 ?auto_17768 ) ) ( not ( = ?auto_17766 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17735 ) ) ( not ( = ?auto_17728 ?auto_17773 ) ) ( not ( = ?auto_17729 ?auto_17735 ) ) ( not ( = ?auto_17729 ?auto_17773 ) ) ( not ( = ?auto_17730 ?auto_17735 ) ) ( not ( = ?auto_17730 ?auto_17773 ) ) ( not ( = ?auto_17731 ?auto_17735 ) ) ( not ( = ?auto_17731 ?auto_17773 ) ) ( not ( = ?auto_17732 ?auto_17735 ) ) ( not ( = ?auto_17732 ?auto_17773 ) ) ( not ( = ?auto_17733 ?auto_17735 ) ) ( not ( = ?auto_17733 ?auto_17773 ) ) ( not ( = ?auto_17735 ?auto_17766 ) ) ( not ( = ?auto_17735 ?auto_17755 ) ) ( not ( = ?auto_17735 ?auto_17778 ) ) ( not ( = ?auto_17735 ?auto_17759 ) ) ( not ( = ?auto_17735 ?auto_17768 ) ) ( not ( = ?auto_17735 ?auto_17757 ) ) ( not ( = ?auto_17754 ?auto_17771 ) ) ( not ( = ?auto_17754 ?auto_17769 ) ) ( not ( = ?auto_17754 ?auto_17774 ) ) ( not ( = ?auto_17754 ?auto_17772 ) ) ( not ( = ?auto_17754 ?auto_17764 ) ) ( not ( = ?auto_17776 ?auto_17763 ) ) ( not ( = ?auto_17776 ?auto_17752 ) ) ( not ( = ?auto_17776 ?auto_17756 ) ) ( not ( = ?auto_17776 ?auto_17760 ) ) ( not ( = ?auto_17776 ?auto_17767 ) ) ( not ( = ?auto_17773 ?auto_17766 ) ) ( not ( = ?auto_17773 ?auto_17755 ) ) ( not ( = ?auto_17773 ?auto_17778 ) ) ( not ( = ?auto_17773 ?auto_17759 ) ) ( not ( = ?auto_17773 ?auto_17768 ) ) ( not ( = ?auto_17773 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17736 ) ) ( not ( = ?auto_17728 ?auto_17781 ) ) ( not ( = ?auto_17729 ?auto_17736 ) ) ( not ( = ?auto_17729 ?auto_17781 ) ) ( not ( = ?auto_17730 ?auto_17736 ) ) ( not ( = ?auto_17730 ?auto_17781 ) ) ( not ( = ?auto_17731 ?auto_17736 ) ) ( not ( = ?auto_17731 ?auto_17781 ) ) ( not ( = ?auto_17732 ?auto_17736 ) ) ( not ( = ?auto_17732 ?auto_17781 ) ) ( not ( = ?auto_17733 ?auto_17736 ) ) ( not ( = ?auto_17733 ?auto_17781 ) ) ( not ( = ?auto_17734 ?auto_17736 ) ) ( not ( = ?auto_17734 ?auto_17781 ) ) ( not ( = ?auto_17736 ?auto_17773 ) ) ( not ( = ?auto_17736 ?auto_17766 ) ) ( not ( = ?auto_17736 ?auto_17755 ) ) ( not ( = ?auto_17736 ?auto_17778 ) ) ( not ( = ?auto_17736 ?auto_17759 ) ) ( not ( = ?auto_17736 ?auto_17768 ) ) ( not ( = ?auto_17736 ?auto_17757 ) ) ( not ( = ?auto_17782 ?auto_17754 ) ) ( not ( = ?auto_17782 ?auto_17771 ) ) ( not ( = ?auto_17782 ?auto_17769 ) ) ( not ( = ?auto_17782 ?auto_17774 ) ) ( not ( = ?auto_17782 ?auto_17772 ) ) ( not ( = ?auto_17782 ?auto_17764 ) ) ( not ( = ?auto_17777 ?auto_17776 ) ) ( not ( = ?auto_17777 ?auto_17763 ) ) ( not ( = ?auto_17777 ?auto_17752 ) ) ( not ( = ?auto_17777 ?auto_17756 ) ) ( not ( = ?auto_17777 ?auto_17760 ) ) ( not ( = ?auto_17777 ?auto_17767 ) ) ( not ( = ?auto_17781 ?auto_17773 ) ) ( not ( = ?auto_17781 ?auto_17766 ) ) ( not ( = ?auto_17781 ?auto_17755 ) ) ( not ( = ?auto_17781 ?auto_17778 ) ) ( not ( = ?auto_17781 ?auto_17759 ) ) ( not ( = ?auto_17781 ?auto_17768 ) ) ( not ( = ?auto_17781 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17737 ) ) ( not ( = ?auto_17728 ?auto_17758 ) ) ( not ( = ?auto_17729 ?auto_17737 ) ) ( not ( = ?auto_17729 ?auto_17758 ) ) ( not ( = ?auto_17730 ?auto_17737 ) ) ( not ( = ?auto_17730 ?auto_17758 ) ) ( not ( = ?auto_17731 ?auto_17737 ) ) ( not ( = ?auto_17731 ?auto_17758 ) ) ( not ( = ?auto_17732 ?auto_17737 ) ) ( not ( = ?auto_17732 ?auto_17758 ) ) ( not ( = ?auto_17733 ?auto_17737 ) ) ( not ( = ?auto_17733 ?auto_17758 ) ) ( not ( = ?auto_17734 ?auto_17737 ) ) ( not ( = ?auto_17734 ?auto_17758 ) ) ( not ( = ?auto_17735 ?auto_17737 ) ) ( not ( = ?auto_17735 ?auto_17758 ) ) ( not ( = ?auto_17737 ?auto_17781 ) ) ( not ( = ?auto_17737 ?auto_17773 ) ) ( not ( = ?auto_17737 ?auto_17766 ) ) ( not ( = ?auto_17737 ?auto_17755 ) ) ( not ( = ?auto_17737 ?auto_17778 ) ) ( not ( = ?auto_17737 ?auto_17759 ) ) ( not ( = ?auto_17737 ?auto_17768 ) ) ( not ( = ?auto_17737 ?auto_17757 ) ) ( not ( = ?auto_17779 ?auto_17782 ) ) ( not ( = ?auto_17779 ?auto_17754 ) ) ( not ( = ?auto_17779 ?auto_17771 ) ) ( not ( = ?auto_17779 ?auto_17769 ) ) ( not ( = ?auto_17779 ?auto_17774 ) ) ( not ( = ?auto_17779 ?auto_17772 ) ) ( not ( = ?auto_17779 ?auto_17764 ) ) ( not ( = ?auto_17749 ?auto_17777 ) ) ( not ( = ?auto_17749 ?auto_17776 ) ) ( not ( = ?auto_17749 ?auto_17763 ) ) ( not ( = ?auto_17749 ?auto_17752 ) ) ( not ( = ?auto_17749 ?auto_17756 ) ) ( not ( = ?auto_17749 ?auto_17760 ) ) ( not ( = ?auto_17749 ?auto_17767 ) ) ( not ( = ?auto_17758 ?auto_17781 ) ) ( not ( = ?auto_17758 ?auto_17773 ) ) ( not ( = ?auto_17758 ?auto_17766 ) ) ( not ( = ?auto_17758 ?auto_17755 ) ) ( not ( = ?auto_17758 ?auto_17778 ) ) ( not ( = ?auto_17758 ?auto_17759 ) ) ( not ( = ?auto_17758 ?auto_17768 ) ) ( not ( = ?auto_17758 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17738 ) ) ( not ( = ?auto_17728 ?auto_17750 ) ) ( not ( = ?auto_17729 ?auto_17738 ) ) ( not ( = ?auto_17729 ?auto_17750 ) ) ( not ( = ?auto_17730 ?auto_17738 ) ) ( not ( = ?auto_17730 ?auto_17750 ) ) ( not ( = ?auto_17731 ?auto_17738 ) ) ( not ( = ?auto_17731 ?auto_17750 ) ) ( not ( = ?auto_17732 ?auto_17738 ) ) ( not ( = ?auto_17732 ?auto_17750 ) ) ( not ( = ?auto_17733 ?auto_17738 ) ) ( not ( = ?auto_17733 ?auto_17750 ) ) ( not ( = ?auto_17734 ?auto_17738 ) ) ( not ( = ?auto_17734 ?auto_17750 ) ) ( not ( = ?auto_17735 ?auto_17738 ) ) ( not ( = ?auto_17735 ?auto_17750 ) ) ( not ( = ?auto_17736 ?auto_17738 ) ) ( not ( = ?auto_17736 ?auto_17750 ) ) ( not ( = ?auto_17738 ?auto_17758 ) ) ( not ( = ?auto_17738 ?auto_17781 ) ) ( not ( = ?auto_17738 ?auto_17773 ) ) ( not ( = ?auto_17738 ?auto_17766 ) ) ( not ( = ?auto_17738 ?auto_17755 ) ) ( not ( = ?auto_17738 ?auto_17778 ) ) ( not ( = ?auto_17738 ?auto_17759 ) ) ( not ( = ?auto_17738 ?auto_17768 ) ) ( not ( = ?auto_17738 ?auto_17757 ) ) ( not ( = ?auto_17783 ?auto_17779 ) ) ( not ( = ?auto_17783 ?auto_17782 ) ) ( not ( = ?auto_17783 ?auto_17754 ) ) ( not ( = ?auto_17783 ?auto_17771 ) ) ( not ( = ?auto_17783 ?auto_17769 ) ) ( not ( = ?auto_17783 ?auto_17774 ) ) ( not ( = ?auto_17783 ?auto_17772 ) ) ( not ( = ?auto_17783 ?auto_17764 ) ) ( not ( = ?auto_17753 ?auto_17749 ) ) ( not ( = ?auto_17753 ?auto_17777 ) ) ( not ( = ?auto_17753 ?auto_17776 ) ) ( not ( = ?auto_17753 ?auto_17763 ) ) ( not ( = ?auto_17753 ?auto_17752 ) ) ( not ( = ?auto_17753 ?auto_17756 ) ) ( not ( = ?auto_17753 ?auto_17760 ) ) ( not ( = ?auto_17753 ?auto_17767 ) ) ( not ( = ?auto_17750 ?auto_17758 ) ) ( not ( = ?auto_17750 ?auto_17781 ) ) ( not ( = ?auto_17750 ?auto_17773 ) ) ( not ( = ?auto_17750 ?auto_17766 ) ) ( not ( = ?auto_17750 ?auto_17755 ) ) ( not ( = ?auto_17750 ?auto_17778 ) ) ( not ( = ?auto_17750 ?auto_17759 ) ) ( not ( = ?auto_17750 ?auto_17768 ) ) ( not ( = ?auto_17750 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17739 ) ) ( not ( = ?auto_17728 ?auto_17765 ) ) ( not ( = ?auto_17729 ?auto_17739 ) ) ( not ( = ?auto_17729 ?auto_17765 ) ) ( not ( = ?auto_17730 ?auto_17739 ) ) ( not ( = ?auto_17730 ?auto_17765 ) ) ( not ( = ?auto_17731 ?auto_17739 ) ) ( not ( = ?auto_17731 ?auto_17765 ) ) ( not ( = ?auto_17732 ?auto_17739 ) ) ( not ( = ?auto_17732 ?auto_17765 ) ) ( not ( = ?auto_17733 ?auto_17739 ) ) ( not ( = ?auto_17733 ?auto_17765 ) ) ( not ( = ?auto_17734 ?auto_17739 ) ) ( not ( = ?auto_17734 ?auto_17765 ) ) ( not ( = ?auto_17735 ?auto_17739 ) ) ( not ( = ?auto_17735 ?auto_17765 ) ) ( not ( = ?auto_17736 ?auto_17739 ) ) ( not ( = ?auto_17736 ?auto_17765 ) ) ( not ( = ?auto_17737 ?auto_17739 ) ) ( not ( = ?auto_17737 ?auto_17765 ) ) ( not ( = ?auto_17739 ?auto_17750 ) ) ( not ( = ?auto_17739 ?auto_17758 ) ) ( not ( = ?auto_17739 ?auto_17781 ) ) ( not ( = ?auto_17739 ?auto_17773 ) ) ( not ( = ?auto_17739 ?auto_17766 ) ) ( not ( = ?auto_17739 ?auto_17755 ) ) ( not ( = ?auto_17739 ?auto_17778 ) ) ( not ( = ?auto_17739 ?auto_17759 ) ) ( not ( = ?auto_17739 ?auto_17768 ) ) ( not ( = ?auto_17739 ?auto_17757 ) ) ( not ( = ?auto_17751 ?auto_17783 ) ) ( not ( = ?auto_17751 ?auto_17779 ) ) ( not ( = ?auto_17751 ?auto_17782 ) ) ( not ( = ?auto_17751 ?auto_17754 ) ) ( not ( = ?auto_17751 ?auto_17771 ) ) ( not ( = ?auto_17751 ?auto_17769 ) ) ( not ( = ?auto_17751 ?auto_17774 ) ) ( not ( = ?auto_17751 ?auto_17772 ) ) ( not ( = ?auto_17751 ?auto_17764 ) ) ( not ( = ?auto_17770 ?auto_17753 ) ) ( not ( = ?auto_17770 ?auto_17749 ) ) ( not ( = ?auto_17770 ?auto_17777 ) ) ( not ( = ?auto_17770 ?auto_17776 ) ) ( not ( = ?auto_17770 ?auto_17763 ) ) ( not ( = ?auto_17770 ?auto_17752 ) ) ( not ( = ?auto_17770 ?auto_17756 ) ) ( not ( = ?auto_17770 ?auto_17760 ) ) ( not ( = ?auto_17770 ?auto_17767 ) ) ( not ( = ?auto_17765 ?auto_17750 ) ) ( not ( = ?auto_17765 ?auto_17758 ) ) ( not ( = ?auto_17765 ?auto_17781 ) ) ( not ( = ?auto_17765 ?auto_17773 ) ) ( not ( = ?auto_17765 ?auto_17766 ) ) ( not ( = ?auto_17765 ?auto_17755 ) ) ( not ( = ?auto_17765 ?auto_17778 ) ) ( not ( = ?auto_17765 ?auto_17759 ) ) ( not ( = ?auto_17765 ?auto_17768 ) ) ( not ( = ?auto_17765 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17740 ) ) ( not ( = ?auto_17728 ?auto_17775 ) ) ( not ( = ?auto_17729 ?auto_17740 ) ) ( not ( = ?auto_17729 ?auto_17775 ) ) ( not ( = ?auto_17730 ?auto_17740 ) ) ( not ( = ?auto_17730 ?auto_17775 ) ) ( not ( = ?auto_17731 ?auto_17740 ) ) ( not ( = ?auto_17731 ?auto_17775 ) ) ( not ( = ?auto_17732 ?auto_17740 ) ) ( not ( = ?auto_17732 ?auto_17775 ) ) ( not ( = ?auto_17733 ?auto_17740 ) ) ( not ( = ?auto_17733 ?auto_17775 ) ) ( not ( = ?auto_17734 ?auto_17740 ) ) ( not ( = ?auto_17734 ?auto_17775 ) ) ( not ( = ?auto_17735 ?auto_17740 ) ) ( not ( = ?auto_17735 ?auto_17775 ) ) ( not ( = ?auto_17736 ?auto_17740 ) ) ( not ( = ?auto_17736 ?auto_17775 ) ) ( not ( = ?auto_17737 ?auto_17740 ) ) ( not ( = ?auto_17737 ?auto_17775 ) ) ( not ( = ?auto_17738 ?auto_17740 ) ) ( not ( = ?auto_17738 ?auto_17775 ) ) ( not ( = ?auto_17740 ?auto_17765 ) ) ( not ( = ?auto_17740 ?auto_17750 ) ) ( not ( = ?auto_17740 ?auto_17758 ) ) ( not ( = ?auto_17740 ?auto_17781 ) ) ( not ( = ?auto_17740 ?auto_17773 ) ) ( not ( = ?auto_17740 ?auto_17766 ) ) ( not ( = ?auto_17740 ?auto_17755 ) ) ( not ( = ?auto_17740 ?auto_17778 ) ) ( not ( = ?auto_17740 ?auto_17759 ) ) ( not ( = ?auto_17740 ?auto_17768 ) ) ( not ( = ?auto_17740 ?auto_17757 ) ) ( not ( = ?auto_17761 ?auto_17751 ) ) ( not ( = ?auto_17761 ?auto_17783 ) ) ( not ( = ?auto_17761 ?auto_17779 ) ) ( not ( = ?auto_17761 ?auto_17782 ) ) ( not ( = ?auto_17761 ?auto_17754 ) ) ( not ( = ?auto_17761 ?auto_17771 ) ) ( not ( = ?auto_17761 ?auto_17769 ) ) ( not ( = ?auto_17761 ?auto_17774 ) ) ( not ( = ?auto_17761 ?auto_17772 ) ) ( not ( = ?auto_17761 ?auto_17764 ) ) ( not ( = ?auto_17780 ?auto_17770 ) ) ( not ( = ?auto_17780 ?auto_17753 ) ) ( not ( = ?auto_17780 ?auto_17749 ) ) ( not ( = ?auto_17780 ?auto_17777 ) ) ( not ( = ?auto_17780 ?auto_17776 ) ) ( not ( = ?auto_17780 ?auto_17763 ) ) ( not ( = ?auto_17780 ?auto_17752 ) ) ( not ( = ?auto_17780 ?auto_17756 ) ) ( not ( = ?auto_17780 ?auto_17760 ) ) ( not ( = ?auto_17780 ?auto_17767 ) ) ( not ( = ?auto_17775 ?auto_17765 ) ) ( not ( = ?auto_17775 ?auto_17750 ) ) ( not ( = ?auto_17775 ?auto_17758 ) ) ( not ( = ?auto_17775 ?auto_17781 ) ) ( not ( = ?auto_17775 ?auto_17773 ) ) ( not ( = ?auto_17775 ?auto_17766 ) ) ( not ( = ?auto_17775 ?auto_17755 ) ) ( not ( = ?auto_17775 ?auto_17778 ) ) ( not ( = ?auto_17775 ?auto_17759 ) ) ( not ( = ?auto_17775 ?auto_17768 ) ) ( not ( = ?auto_17775 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17741 ) ) ( not ( = ?auto_17728 ?auto_17762 ) ) ( not ( = ?auto_17729 ?auto_17741 ) ) ( not ( = ?auto_17729 ?auto_17762 ) ) ( not ( = ?auto_17730 ?auto_17741 ) ) ( not ( = ?auto_17730 ?auto_17762 ) ) ( not ( = ?auto_17731 ?auto_17741 ) ) ( not ( = ?auto_17731 ?auto_17762 ) ) ( not ( = ?auto_17732 ?auto_17741 ) ) ( not ( = ?auto_17732 ?auto_17762 ) ) ( not ( = ?auto_17733 ?auto_17741 ) ) ( not ( = ?auto_17733 ?auto_17762 ) ) ( not ( = ?auto_17734 ?auto_17741 ) ) ( not ( = ?auto_17734 ?auto_17762 ) ) ( not ( = ?auto_17735 ?auto_17741 ) ) ( not ( = ?auto_17735 ?auto_17762 ) ) ( not ( = ?auto_17736 ?auto_17741 ) ) ( not ( = ?auto_17736 ?auto_17762 ) ) ( not ( = ?auto_17737 ?auto_17741 ) ) ( not ( = ?auto_17737 ?auto_17762 ) ) ( not ( = ?auto_17738 ?auto_17741 ) ) ( not ( = ?auto_17738 ?auto_17762 ) ) ( not ( = ?auto_17739 ?auto_17741 ) ) ( not ( = ?auto_17739 ?auto_17762 ) ) ( not ( = ?auto_17741 ?auto_17775 ) ) ( not ( = ?auto_17741 ?auto_17765 ) ) ( not ( = ?auto_17741 ?auto_17750 ) ) ( not ( = ?auto_17741 ?auto_17758 ) ) ( not ( = ?auto_17741 ?auto_17781 ) ) ( not ( = ?auto_17741 ?auto_17773 ) ) ( not ( = ?auto_17741 ?auto_17766 ) ) ( not ( = ?auto_17741 ?auto_17755 ) ) ( not ( = ?auto_17741 ?auto_17778 ) ) ( not ( = ?auto_17741 ?auto_17759 ) ) ( not ( = ?auto_17741 ?auto_17768 ) ) ( not ( = ?auto_17741 ?auto_17757 ) ) ( not ( = ?auto_17762 ?auto_17775 ) ) ( not ( = ?auto_17762 ?auto_17765 ) ) ( not ( = ?auto_17762 ?auto_17750 ) ) ( not ( = ?auto_17762 ?auto_17758 ) ) ( not ( = ?auto_17762 ?auto_17781 ) ) ( not ( = ?auto_17762 ?auto_17773 ) ) ( not ( = ?auto_17762 ?auto_17766 ) ) ( not ( = ?auto_17762 ?auto_17755 ) ) ( not ( = ?auto_17762 ?auto_17778 ) ) ( not ( = ?auto_17762 ?auto_17759 ) ) ( not ( = ?auto_17762 ?auto_17768 ) ) ( not ( = ?auto_17762 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17742 ) ) ( not ( = ?auto_17728 ?auto_17748 ) ) ( not ( = ?auto_17729 ?auto_17742 ) ) ( not ( = ?auto_17729 ?auto_17748 ) ) ( not ( = ?auto_17730 ?auto_17742 ) ) ( not ( = ?auto_17730 ?auto_17748 ) ) ( not ( = ?auto_17731 ?auto_17742 ) ) ( not ( = ?auto_17731 ?auto_17748 ) ) ( not ( = ?auto_17732 ?auto_17742 ) ) ( not ( = ?auto_17732 ?auto_17748 ) ) ( not ( = ?auto_17733 ?auto_17742 ) ) ( not ( = ?auto_17733 ?auto_17748 ) ) ( not ( = ?auto_17734 ?auto_17742 ) ) ( not ( = ?auto_17734 ?auto_17748 ) ) ( not ( = ?auto_17735 ?auto_17742 ) ) ( not ( = ?auto_17735 ?auto_17748 ) ) ( not ( = ?auto_17736 ?auto_17742 ) ) ( not ( = ?auto_17736 ?auto_17748 ) ) ( not ( = ?auto_17737 ?auto_17742 ) ) ( not ( = ?auto_17737 ?auto_17748 ) ) ( not ( = ?auto_17738 ?auto_17742 ) ) ( not ( = ?auto_17738 ?auto_17748 ) ) ( not ( = ?auto_17739 ?auto_17742 ) ) ( not ( = ?auto_17739 ?auto_17748 ) ) ( not ( = ?auto_17740 ?auto_17742 ) ) ( not ( = ?auto_17740 ?auto_17748 ) ) ( not ( = ?auto_17742 ?auto_17762 ) ) ( not ( = ?auto_17742 ?auto_17775 ) ) ( not ( = ?auto_17742 ?auto_17765 ) ) ( not ( = ?auto_17742 ?auto_17750 ) ) ( not ( = ?auto_17742 ?auto_17758 ) ) ( not ( = ?auto_17742 ?auto_17781 ) ) ( not ( = ?auto_17742 ?auto_17773 ) ) ( not ( = ?auto_17742 ?auto_17766 ) ) ( not ( = ?auto_17742 ?auto_17755 ) ) ( not ( = ?auto_17742 ?auto_17778 ) ) ( not ( = ?auto_17742 ?auto_17759 ) ) ( not ( = ?auto_17742 ?auto_17768 ) ) ( not ( = ?auto_17742 ?auto_17757 ) ) ( not ( = ?auto_17746 ?auto_17782 ) ) ( not ( = ?auto_17746 ?auto_17761 ) ) ( not ( = ?auto_17746 ?auto_17751 ) ) ( not ( = ?auto_17746 ?auto_17783 ) ) ( not ( = ?auto_17746 ?auto_17779 ) ) ( not ( = ?auto_17746 ?auto_17754 ) ) ( not ( = ?auto_17746 ?auto_17771 ) ) ( not ( = ?auto_17746 ?auto_17769 ) ) ( not ( = ?auto_17746 ?auto_17774 ) ) ( not ( = ?auto_17746 ?auto_17772 ) ) ( not ( = ?auto_17746 ?auto_17764 ) ) ( not ( = ?auto_17745 ?auto_17777 ) ) ( not ( = ?auto_17745 ?auto_17780 ) ) ( not ( = ?auto_17745 ?auto_17770 ) ) ( not ( = ?auto_17745 ?auto_17753 ) ) ( not ( = ?auto_17745 ?auto_17749 ) ) ( not ( = ?auto_17745 ?auto_17776 ) ) ( not ( = ?auto_17745 ?auto_17763 ) ) ( not ( = ?auto_17745 ?auto_17752 ) ) ( not ( = ?auto_17745 ?auto_17756 ) ) ( not ( = ?auto_17745 ?auto_17760 ) ) ( not ( = ?auto_17745 ?auto_17767 ) ) ( not ( = ?auto_17748 ?auto_17762 ) ) ( not ( = ?auto_17748 ?auto_17775 ) ) ( not ( = ?auto_17748 ?auto_17765 ) ) ( not ( = ?auto_17748 ?auto_17750 ) ) ( not ( = ?auto_17748 ?auto_17758 ) ) ( not ( = ?auto_17748 ?auto_17781 ) ) ( not ( = ?auto_17748 ?auto_17773 ) ) ( not ( = ?auto_17748 ?auto_17766 ) ) ( not ( = ?auto_17748 ?auto_17755 ) ) ( not ( = ?auto_17748 ?auto_17778 ) ) ( not ( = ?auto_17748 ?auto_17759 ) ) ( not ( = ?auto_17748 ?auto_17768 ) ) ( not ( = ?auto_17748 ?auto_17757 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_17728 ?auto_17729 ?auto_17730 ?auto_17731 ?auto_17732 ?auto_17733 ?auto_17734 ?auto_17735 ?auto_17736 ?auto_17737 ?auto_17738 ?auto_17739 ?auto_17740 ?auto_17741 )
      ( MAKE-1CRATE ?auto_17741 ?auto_17742 )
      ( MAKE-14CRATE-VERIFY ?auto_17728 ?auto_17729 ?auto_17730 ?auto_17731 ?auto_17732 ?auto_17733 ?auto_17734 ?auto_17735 ?auto_17736 ?auto_17737 ?auto_17738 ?auto_17739 ?auto_17740 ?auto_17741 ?auto_17742 ) )
  )

)

