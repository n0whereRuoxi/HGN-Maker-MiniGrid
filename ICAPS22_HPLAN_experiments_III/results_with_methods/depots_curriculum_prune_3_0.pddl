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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_169 - SURFACE
      ?auto_170 - SURFACE
    )
    :vars
    (
      ?auto_171 - HOIST
      ?auto_172 - PLACE
      ?auto_174 - PLACE
      ?auto_175 - HOIST
      ?auto_176 - SURFACE
      ?auto_173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_171 ?auto_172 ) ( SURFACE-AT ?auto_169 ?auto_172 ) ( CLEAR ?auto_169 ) ( IS-CRATE ?auto_170 ) ( AVAILABLE ?auto_171 ) ( not ( = ?auto_174 ?auto_172 ) ) ( HOIST-AT ?auto_175 ?auto_174 ) ( AVAILABLE ?auto_175 ) ( SURFACE-AT ?auto_170 ?auto_174 ) ( ON ?auto_170 ?auto_176 ) ( CLEAR ?auto_170 ) ( TRUCK-AT ?auto_173 ?auto_172 ) ( not ( = ?auto_169 ?auto_170 ) ) ( not ( = ?auto_169 ?auto_176 ) ) ( not ( = ?auto_170 ?auto_176 ) ) ( not ( = ?auto_171 ?auto_175 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_173 ?auto_172 ?auto_174 )
      ( !LIFT ?auto_175 ?auto_170 ?auto_176 ?auto_174 )
      ( !LOAD ?auto_175 ?auto_170 ?auto_173 ?auto_174 )
      ( !DRIVE ?auto_173 ?auto_174 ?auto_172 )
      ( !UNLOAD ?auto_171 ?auto_170 ?auto_173 ?auto_172 )
      ( !DROP ?auto_171 ?auto_170 ?auto_169 ?auto_172 )
      ( MAKE-1CRATE-VERIFY ?auto_169 ?auto_170 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_190 - SURFACE
      ?auto_191 - SURFACE
      ?auto_192 - SURFACE
    )
    :vars
    (
      ?auto_193 - HOIST
      ?auto_194 - PLACE
      ?auto_198 - PLACE
      ?auto_197 - HOIST
      ?auto_196 - SURFACE
      ?auto_199 - PLACE
      ?auto_201 - HOIST
      ?auto_200 - SURFACE
      ?auto_195 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_193 ?auto_194 ) ( IS-CRATE ?auto_192 ) ( not ( = ?auto_198 ?auto_194 ) ) ( HOIST-AT ?auto_197 ?auto_198 ) ( AVAILABLE ?auto_197 ) ( SURFACE-AT ?auto_192 ?auto_198 ) ( ON ?auto_192 ?auto_196 ) ( CLEAR ?auto_192 ) ( not ( = ?auto_191 ?auto_192 ) ) ( not ( = ?auto_191 ?auto_196 ) ) ( not ( = ?auto_192 ?auto_196 ) ) ( not ( = ?auto_193 ?auto_197 ) ) ( SURFACE-AT ?auto_190 ?auto_194 ) ( CLEAR ?auto_190 ) ( IS-CRATE ?auto_191 ) ( AVAILABLE ?auto_193 ) ( not ( = ?auto_199 ?auto_194 ) ) ( HOIST-AT ?auto_201 ?auto_199 ) ( AVAILABLE ?auto_201 ) ( SURFACE-AT ?auto_191 ?auto_199 ) ( ON ?auto_191 ?auto_200 ) ( CLEAR ?auto_191 ) ( TRUCK-AT ?auto_195 ?auto_194 ) ( not ( = ?auto_190 ?auto_191 ) ) ( not ( = ?auto_190 ?auto_200 ) ) ( not ( = ?auto_191 ?auto_200 ) ) ( not ( = ?auto_193 ?auto_201 ) ) ( not ( = ?auto_190 ?auto_192 ) ) ( not ( = ?auto_190 ?auto_196 ) ) ( not ( = ?auto_192 ?auto_200 ) ) ( not ( = ?auto_198 ?auto_199 ) ) ( not ( = ?auto_197 ?auto_201 ) ) ( not ( = ?auto_196 ?auto_200 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_190 ?auto_191 )
      ( MAKE-1CRATE ?auto_191 ?auto_192 )
      ( MAKE-2CRATE-VERIFY ?auto_190 ?auto_191 ?auto_192 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_216 - SURFACE
      ?auto_217 - SURFACE
      ?auto_218 - SURFACE
      ?auto_219 - SURFACE
    )
    :vars
    (
      ?auto_222 - HOIST
      ?auto_220 - PLACE
      ?auto_224 - PLACE
      ?auto_223 - HOIST
      ?auto_221 - SURFACE
      ?auto_227 - PLACE
      ?auto_226 - HOIST
      ?auto_228 - SURFACE
      ?auto_229 - PLACE
      ?auto_231 - HOIST
      ?auto_230 - SURFACE
      ?auto_225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_222 ?auto_220 ) ( IS-CRATE ?auto_219 ) ( not ( = ?auto_224 ?auto_220 ) ) ( HOIST-AT ?auto_223 ?auto_224 ) ( AVAILABLE ?auto_223 ) ( SURFACE-AT ?auto_219 ?auto_224 ) ( ON ?auto_219 ?auto_221 ) ( CLEAR ?auto_219 ) ( not ( = ?auto_218 ?auto_219 ) ) ( not ( = ?auto_218 ?auto_221 ) ) ( not ( = ?auto_219 ?auto_221 ) ) ( not ( = ?auto_222 ?auto_223 ) ) ( IS-CRATE ?auto_218 ) ( not ( = ?auto_227 ?auto_220 ) ) ( HOIST-AT ?auto_226 ?auto_227 ) ( AVAILABLE ?auto_226 ) ( SURFACE-AT ?auto_218 ?auto_227 ) ( ON ?auto_218 ?auto_228 ) ( CLEAR ?auto_218 ) ( not ( = ?auto_217 ?auto_218 ) ) ( not ( = ?auto_217 ?auto_228 ) ) ( not ( = ?auto_218 ?auto_228 ) ) ( not ( = ?auto_222 ?auto_226 ) ) ( SURFACE-AT ?auto_216 ?auto_220 ) ( CLEAR ?auto_216 ) ( IS-CRATE ?auto_217 ) ( AVAILABLE ?auto_222 ) ( not ( = ?auto_229 ?auto_220 ) ) ( HOIST-AT ?auto_231 ?auto_229 ) ( AVAILABLE ?auto_231 ) ( SURFACE-AT ?auto_217 ?auto_229 ) ( ON ?auto_217 ?auto_230 ) ( CLEAR ?auto_217 ) ( TRUCK-AT ?auto_225 ?auto_220 ) ( not ( = ?auto_216 ?auto_217 ) ) ( not ( = ?auto_216 ?auto_230 ) ) ( not ( = ?auto_217 ?auto_230 ) ) ( not ( = ?auto_222 ?auto_231 ) ) ( not ( = ?auto_216 ?auto_218 ) ) ( not ( = ?auto_216 ?auto_228 ) ) ( not ( = ?auto_218 ?auto_230 ) ) ( not ( = ?auto_227 ?auto_229 ) ) ( not ( = ?auto_226 ?auto_231 ) ) ( not ( = ?auto_228 ?auto_230 ) ) ( not ( = ?auto_216 ?auto_219 ) ) ( not ( = ?auto_216 ?auto_221 ) ) ( not ( = ?auto_217 ?auto_219 ) ) ( not ( = ?auto_217 ?auto_221 ) ) ( not ( = ?auto_219 ?auto_228 ) ) ( not ( = ?auto_219 ?auto_230 ) ) ( not ( = ?auto_224 ?auto_227 ) ) ( not ( = ?auto_224 ?auto_229 ) ) ( not ( = ?auto_223 ?auto_226 ) ) ( not ( = ?auto_223 ?auto_231 ) ) ( not ( = ?auto_221 ?auto_228 ) ) ( not ( = ?auto_221 ?auto_230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_216 ?auto_217 ?auto_218 )
      ( MAKE-1CRATE ?auto_218 ?auto_219 )
      ( MAKE-3CRATE-VERIFY ?auto_216 ?auto_217 ?auto_218 ?auto_219 ) )
  )

)

