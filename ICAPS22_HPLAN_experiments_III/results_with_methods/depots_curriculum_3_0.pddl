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
      ?auto_175 - SURFACE
      ?auto_176 - SURFACE
    )
    :vars
    (
      ?auto_177 - HOIST
      ?auto_178 - PLACE
      ?auto_180 - PLACE
      ?auto_181 - HOIST
      ?auto_182 - SURFACE
      ?auto_179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_177 ?auto_178 ) ( SURFACE-AT ?auto_175 ?auto_178 ) ( CLEAR ?auto_175 ) ( IS-CRATE ?auto_176 ) ( AVAILABLE ?auto_177 ) ( not ( = ?auto_180 ?auto_178 ) ) ( HOIST-AT ?auto_181 ?auto_180 ) ( AVAILABLE ?auto_181 ) ( SURFACE-AT ?auto_176 ?auto_180 ) ( ON ?auto_176 ?auto_182 ) ( CLEAR ?auto_176 ) ( TRUCK-AT ?auto_179 ?auto_178 ) ( not ( = ?auto_175 ?auto_176 ) ) ( not ( = ?auto_175 ?auto_182 ) ) ( not ( = ?auto_176 ?auto_182 ) ) ( not ( = ?auto_177 ?auto_181 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_179 ?auto_178 ?auto_180 )
      ( !LIFT ?auto_181 ?auto_176 ?auto_182 ?auto_180 )
      ( !LOAD ?auto_181 ?auto_176 ?auto_179 ?auto_180 )
      ( !DRIVE ?auto_179 ?auto_180 ?auto_178 )
      ( !UNLOAD ?auto_177 ?auto_176 ?auto_179 ?auto_178 )
      ( !DROP ?auto_177 ?auto_176 ?auto_175 ?auto_178 )
      ( MAKE-1CRATE-VERIFY ?auto_175 ?auto_176 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185 - SURFACE
      ?auto_186 - SURFACE
    )
    :vars
    (
      ?auto_187 - HOIST
      ?auto_188 - PLACE
      ?auto_190 - PLACE
      ?auto_191 - HOIST
      ?auto_192 - SURFACE
      ?auto_189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187 ?auto_188 ) ( SURFACE-AT ?auto_185 ?auto_188 ) ( CLEAR ?auto_185 ) ( IS-CRATE ?auto_186 ) ( AVAILABLE ?auto_187 ) ( not ( = ?auto_190 ?auto_188 ) ) ( HOIST-AT ?auto_191 ?auto_190 ) ( AVAILABLE ?auto_191 ) ( SURFACE-AT ?auto_186 ?auto_190 ) ( ON ?auto_186 ?auto_192 ) ( CLEAR ?auto_186 ) ( TRUCK-AT ?auto_189 ?auto_188 ) ( not ( = ?auto_185 ?auto_186 ) ) ( not ( = ?auto_185 ?auto_192 ) ) ( not ( = ?auto_186 ?auto_192 ) ) ( not ( = ?auto_187 ?auto_191 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_189 ?auto_188 ?auto_190 )
      ( !LIFT ?auto_191 ?auto_186 ?auto_192 ?auto_190 )
      ( !LOAD ?auto_191 ?auto_186 ?auto_189 ?auto_190 )
      ( !DRIVE ?auto_189 ?auto_190 ?auto_188 )
      ( !UNLOAD ?auto_187 ?auto_186 ?auto_189 ?auto_188 )
      ( !DROP ?auto_187 ?auto_186 ?auto_185 ?auto_188 )
      ( MAKE-1CRATE-VERIFY ?auto_185 ?auto_186 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_196 - SURFACE
      ?auto_197 - SURFACE
      ?auto_198 - SURFACE
    )
    :vars
    (
      ?auto_200 - HOIST
      ?auto_199 - PLACE
      ?auto_204 - PLACE
      ?auto_203 - HOIST
      ?auto_202 - SURFACE
      ?auto_205 - SURFACE
      ?auto_201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200 ?auto_199 ) ( IS-CRATE ?auto_198 ) ( not ( = ?auto_204 ?auto_199 ) ) ( HOIST-AT ?auto_203 ?auto_204 ) ( SURFACE-AT ?auto_198 ?auto_204 ) ( ON ?auto_198 ?auto_202 ) ( CLEAR ?auto_198 ) ( not ( = ?auto_197 ?auto_198 ) ) ( not ( = ?auto_197 ?auto_202 ) ) ( not ( = ?auto_198 ?auto_202 ) ) ( not ( = ?auto_200 ?auto_203 ) ) ( SURFACE-AT ?auto_196 ?auto_199 ) ( CLEAR ?auto_196 ) ( IS-CRATE ?auto_197 ) ( AVAILABLE ?auto_200 ) ( AVAILABLE ?auto_203 ) ( SURFACE-AT ?auto_197 ?auto_204 ) ( ON ?auto_197 ?auto_205 ) ( CLEAR ?auto_197 ) ( TRUCK-AT ?auto_201 ?auto_199 ) ( not ( = ?auto_196 ?auto_197 ) ) ( not ( = ?auto_196 ?auto_205 ) ) ( not ( = ?auto_197 ?auto_205 ) ) ( not ( = ?auto_196 ?auto_198 ) ) ( not ( = ?auto_196 ?auto_202 ) ) ( not ( = ?auto_198 ?auto_205 ) ) ( not ( = ?auto_202 ?auto_205 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_196 ?auto_197 )
      ( MAKE-1CRATE ?auto_197 ?auto_198 )
      ( MAKE-2CRATE-VERIFY ?auto_196 ?auto_197 ?auto_198 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_208 - SURFACE
      ?auto_209 - SURFACE
    )
    :vars
    (
      ?auto_210 - HOIST
      ?auto_211 - PLACE
      ?auto_213 - PLACE
      ?auto_214 - HOIST
      ?auto_215 - SURFACE
      ?auto_212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_210 ?auto_211 ) ( SURFACE-AT ?auto_208 ?auto_211 ) ( CLEAR ?auto_208 ) ( IS-CRATE ?auto_209 ) ( AVAILABLE ?auto_210 ) ( not ( = ?auto_213 ?auto_211 ) ) ( HOIST-AT ?auto_214 ?auto_213 ) ( AVAILABLE ?auto_214 ) ( SURFACE-AT ?auto_209 ?auto_213 ) ( ON ?auto_209 ?auto_215 ) ( CLEAR ?auto_209 ) ( TRUCK-AT ?auto_212 ?auto_211 ) ( not ( = ?auto_208 ?auto_209 ) ) ( not ( = ?auto_208 ?auto_215 ) ) ( not ( = ?auto_209 ?auto_215 ) ) ( not ( = ?auto_210 ?auto_214 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_212 ?auto_211 ?auto_213 )
      ( !LIFT ?auto_214 ?auto_209 ?auto_215 ?auto_213 )
      ( !LOAD ?auto_214 ?auto_209 ?auto_212 ?auto_213 )
      ( !DRIVE ?auto_212 ?auto_213 ?auto_211 )
      ( !UNLOAD ?auto_210 ?auto_209 ?auto_212 ?auto_211 )
      ( !DROP ?auto_210 ?auto_209 ?auto_208 ?auto_211 )
      ( MAKE-1CRATE-VERIFY ?auto_208 ?auto_209 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_220 - SURFACE
      ?auto_221 - SURFACE
      ?auto_222 - SURFACE
      ?auto_223 - SURFACE
    )
    :vars
    (
      ?auto_225 - HOIST
      ?auto_224 - PLACE
      ?auto_228 - PLACE
      ?auto_229 - HOIST
      ?auto_227 - SURFACE
      ?auto_230 - PLACE
      ?auto_232 - HOIST
      ?auto_231 - SURFACE
      ?auto_233 - SURFACE
      ?auto_226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225 ?auto_224 ) ( IS-CRATE ?auto_223 ) ( not ( = ?auto_228 ?auto_224 ) ) ( HOIST-AT ?auto_229 ?auto_228 ) ( AVAILABLE ?auto_229 ) ( SURFACE-AT ?auto_223 ?auto_228 ) ( ON ?auto_223 ?auto_227 ) ( CLEAR ?auto_223 ) ( not ( = ?auto_222 ?auto_223 ) ) ( not ( = ?auto_222 ?auto_227 ) ) ( not ( = ?auto_223 ?auto_227 ) ) ( not ( = ?auto_225 ?auto_229 ) ) ( IS-CRATE ?auto_222 ) ( not ( = ?auto_230 ?auto_224 ) ) ( HOIST-AT ?auto_232 ?auto_230 ) ( SURFACE-AT ?auto_222 ?auto_230 ) ( ON ?auto_222 ?auto_231 ) ( CLEAR ?auto_222 ) ( not ( = ?auto_221 ?auto_222 ) ) ( not ( = ?auto_221 ?auto_231 ) ) ( not ( = ?auto_222 ?auto_231 ) ) ( not ( = ?auto_225 ?auto_232 ) ) ( SURFACE-AT ?auto_220 ?auto_224 ) ( CLEAR ?auto_220 ) ( IS-CRATE ?auto_221 ) ( AVAILABLE ?auto_225 ) ( AVAILABLE ?auto_232 ) ( SURFACE-AT ?auto_221 ?auto_230 ) ( ON ?auto_221 ?auto_233 ) ( CLEAR ?auto_221 ) ( TRUCK-AT ?auto_226 ?auto_224 ) ( not ( = ?auto_220 ?auto_221 ) ) ( not ( = ?auto_220 ?auto_233 ) ) ( not ( = ?auto_221 ?auto_233 ) ) ( not ( = ?auto_220 ?auto_222 ) ) ( not ( = ?auto_220 ?auto_231 ) ) ( not ( = ?auto_222 ?auto_233 ) ) ( not ( = ?auto_231 ?auto_233 ) ) ( not ( = ?auto_220 ?auto_223 ) ) ( not ( = ?auto_220 ?auto_227 ) ) ( not ( = ?auto_221 ?auto_223 ) ) ( not ( = ?auto_221 ?auto_227 ) ) ( not ( = ?auto_223 ?auto_231 ) ) ( not ( = ?auto_223 ?auto_233 ) ) ( not ( = ?auto_228 ?auto_230 ) ) ( not ( = ?auto_229 ?auto_232 ) ) ( not ( = ?auto_227 ?auto_231 ) ) ( not ( = ?auto_227 ?auto_233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_220 ?auto_221 ?auto_222 )
      ( MAKE-1CRATE ?auto_222 ?auto_223 )
      ( MAKE-3CRATE-VERIFY ?auto_220 ?auto_221 ?auto_222 ?auto_223 ) )
  )

)

