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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?above - SURFACE
      ?below - SURFACE
    )
    :precondition
    ( and ( ON ?above ?below ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_146 - SURFACE
      ?auto_145 - SURFACE
    )
    :vars
    (
      ?auto_147 - HOIST
      ?auto_148 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_147 ?auto_148 ) ( SURFACE-AT ?auto_145 ?auto_148 ) ( CLEAR ?auto_145 ) ( LIFTING ?auto_147 ?auto_146 ) ( IS-CRATE ?auto_146 ) ( not ( = ?auto_146 ?auto_145 ) ) )
    :subtasks
    ( ( !DROP ?auto_147 ?auto_146 ?auto_145 ?auto_148 )
      ( MAKE-ON-VERIFY ?auto_146 ?auto_145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_150 - SURFACE
      ?auto_149 - SURFACE
    )
    :vars
    (
      ?auto_152 - HOIST
      ?auto_151 - PLACE
      ?auto_153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152 ?auto_151 ) ( SURFACE-AT ?auto_149 ?auto_151 ) ( CLEAR ?auto_149 ) ( IS-CRATE ?auto_150 ) ( not ( = ?auto_150 ?auto_149 ) ) ( TRUCK-AT ?auto_153 ?auto_151 ) ( AVAILABLE ?auto_152 ) ( IN ?auto_150 ?auto_153 ) )
    :subtasks
    ( ( !UNLOAD ?auto_152 ?auto_150 ?auto_153 ?auto_151 )
      ( MAKE-ON ?auto_150 ?auto_149 )
      ( MAKE-ON-VERIFY ?auto_150 ?auto_149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_155 - SURFACE
      ?auto_154 - SURFACE
    )
    :vars
    (
      ?auto_156 - HOIST
      ?auto_157 - PLACE
      ?auto_158 - TRUCK
      ?auto_159 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_156 ?auto_157 ) ( SURFACE-AT ?auto_154 ?auto_157 ) ( CLEAR ?auto_154 ) ( IS-CRATE ?auto_155 ) ( not ( = ?auto_155 ?auto_154 ) ) ( AVAILABLE ?auto_156 ) ( IN ?auto_155 ?auto_158 ) ( TRUCK-AT ?auto_158 ?auto_159 ) ( not ( = ?auto_159 ?auto_157 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_158 ?auto_159 ?auto_157 )
      ( MAKE-ON ?auto_155 ?auto_154 )
      ( MAKE-ON-VERIFY ?auto_155 ?auto_154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_161 - SURFACE
      ?auto_160 - SURFACE
    )
    :vars
    (
      ?auto_165 - HOIST
      ?auto_163 - PLACE
      ?auto_164 - TRUCK
      ?auto_162 - PLACE
      ?auto_166 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_165 ?auto_163 ) ( SURFACE-AT ?auto_160 ?auto_163 ) ( CLEAR ?auto_160 ) ( IS-CRATE ?auto_161 ) ( not ( = ?auto_161 ?auto_160 ) ) ( AVAILABLE ?auto_165 ) ( TRUCK-AT ?auto_164 ?auto_162 ) ( not ( = ?auto_162 ?auto_163 ) ) ( HOIST-AT ?auto_166 ?auto_162 ) ( LIFTING ?auto_166 ?auto_161 ) ( not ( = ?auto_165 ?auto_166 ) ) )
    :subtasks
    ( ( !LOAD ?auto_166 ?auto_161 ?auto_164 ?auto_162 )
      ( MAKE-ON ?auto_161 ?auto_160 )
      ( MAKE-ON-VERIFY ?auto_161 ?auto_160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_168 - SURFACE
      ?auto_167 - SURFACE
    )
    :vars
    (
      ?auto_169 - HOIST
      ?auto_172 - PLACE
      ?auto_171 - TRUCK
      ?auto_173 - PLACE
      ?auto_170 - HOIST
      ?auto_174 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_169 ?auto_172 ) ( SURFACE-AT ?auto_167 ?auto_172 ) ( CLEAR ?auto_167 ) ( IS-CRATE ?auto_168 ) ( not ( = ?auto_168 ?auto_167 ) ) ( AVAILABLE ?auto_169 ) ( TRUCK-AT ?auto_171 ?auto_173 ) ( not ( = ?auto_173 ?auto_172 ) ) ( HOIST-AT ?auto_170 ?auto_173 ) ( not ( = ?auto_169 ?auto_170 ) ) ( AVAILABLE ?auto_170 ) ( SURFACE-AT ?auto_168 ?auto_173 ) ( ON ?auto_168 ?auto_174 ) ( CLEAR ?auto_168 ) ( not ( = ?auto_168 ?auto_174 ) ) ( not ( = ?auto_167 ?auto_174 ) ) )
    :subtasks
    ( ( !LIFT ?auto_170 ?auto_168 ?auto_174 ?auto_173 )
      ( MAKE-ON ?auto_168 ?auto_167 )
      ( MAKE-ON-VERIFY ?auto_168 ?auto_167 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_176 - SURFACE
      ?auto_175 - SURFACE
    )
    :vars
    (
      ?auto_181 - HOIST
      ?auto_177 - PLACE
      ?auto_179 - PLACE
      ?auto_178 - HOIST
      ?auto_182 - SURFACE
      ?auto_180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_181 ?auto_177 ) ( SURFACE-AT ?auto_175 ?auto_177 ) ( CLEAR ?auto_175 ) ( IS-CRATE ?auto_176 ) ( not ( = ?auto_176 ?auto_175 ) ) ( AVAILABLE ?auto_181 ) ( not ( = ?auto_179 ?auto_177 ) ) ( HOIST-AT ?auto_178 ?auto_179 ) ( not ( = ?auto_181 ?auto_178 ) ) ( AVAILABLE ?auto_178 ) ( SURFACE-AT ?auto_176 ?auto_179 ) ( ON ?auto_176 ?auto_182 ) ( CLEAR ?auto_176 ) ( not ( = ?auto_176 ?auto_182 ) ) ( not ( = ?auto_175 ?auto_182 ) ) ( TRUCK-AT ?auto_180 ?auto_177 ) )
    :subtasks
    ( ( !DRIVE ?auto_180 ?auto_177 ?auto_179 )
      ( MAKE-ON ?auto_176 ?auto_175 )
      ( MAKE-ON-VERIFY ?auto_176 ?auto_175 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_186 - SURFACE
      ?auto_185 - SURFACE
    )
    :vars
    (
      ?auto_187 - HOIST
      ?auto_188 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187 ?auto_188 ) ( SURFACE-AT ?auto_185 ?auto_188 ) ( CLEAR ?auto_185 ) ( LIFTING ?auto_187 ?auto_186 ) ( IS-CRATE ?auto_186 ) ( not ( = ?auto_186 ?auto_185 ) ) )
    :subtasks
    ( ( !DROP ?auto_187 ?auto_186 ?auto_185 ?auto_188 )
      ( MAKE-ON-VERIFY ?auto_186 ?auto_185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_190 - SURFACE
      ?auto_189 - SURFACE
    )
    :vars
    (
      ?auto_191 - HOIST
      ?auto_192 - PLACE
      ?auto_193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_191 ?auto_192 ) ( SURFACE-AT ?auto_189 ?auto_192 ) ( CLEAR ?auto_189 ) ( IS-CRATE ?auto_190 ) ( not ( = ?auto_190 ?auto_189 ) ) ( TRUCK-AT ?auto_193 ?auto_192 ) ( AVAILABLE ?auto_191 ) ( IN ?auto_190 ?auto_193 ) )
    :subtasks
    ( ( !UNLOAD ?auto_191 ?auto_190 ?auto_193 ?auto_192 )
      ( MAKE-ON ?auto_190 ?auto_189 )
      ( MAKE-ON-VERIFY ?auto_190 ?auto_189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_195 - SURFACE
      ?auto_194 - SURFACE
    )
    :vars
    (
      ?auto_196 - HOIST
      ?auto_198 - PLACE
      ?auto_197 - TRUCK
      ?auto_199 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_196 ?auto_198 ) ( SURFACE-AT ?auto_194 ?auto_198 ) ( CLEAR ?auto_194 ) ( IS-CRATE ?auto_195 ) ( not ( = ?auto_195 ?auto_194 ) ) ( AVAILABLE ?auto_196 ) ( IN ?auto_195 ?auto_197 ) ( TRUCK-AT ?auto_197 ?auto_199 ) ( not ( = ?auto_199 ?auto_198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_197 ?auto_199 ?auto_198 )
      ( MAKE-ON ?auto_195 ?auto_194 )
      ( MAKE-ON-VERIFY ?auto_195 ?auto_194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_201 - SURFACE
      ?auto_200 - SURFACE
    )
    :vars
    (
      ?auto_203 - HOIST
      ?auto_204 - PLACE
      ?auto_202 - TRUCK
      ?auto_205 - PLACE
      ?auto_206 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_203 ?auto_204 ) ( SURFACE-AT ?auto_200 ?auto_204 ) ( CLEAR ?auto_200 ) ( IS-CRATE ?auto_201 ) ( not ( = ?auto_201 ?auto_200 ) ) ( AVAILABLE ?auto_203 ) ( TRUCK-AT ?auto_202 ?auto_205 ) ( not ( = ?auto_205 ?auto_204 ) ) ( HOIST-AT ?auto_206 ?auto_205 ) ( LIFTING ?auto_206 ?auto_201 ) ( not ( = ?auto_203 ?auto_206 ) ) )
    :subtasks
    ( ( !LOAD ?auto_206 ?auto_201 ?auto_202 ?auto_205 )
      ( MAKE-ON ?auto_201 ?auto_200 )
      ( MAKE-ON-VERIFY ?auto_201 ?auto_200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_208 - SURFACE
      ?auto_207 - SURFACE
    )
    :vars
    (
      ?auto_209 - HOIST
      ?auto_211 - PLACE
      ?auto_213 - TRUCK
      ?auto_212 - PLACE
      ?auto_210 - HOIST
      ?auto_214 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_209 ?auto_211 ) ( SURFACE-AT ?auto_207 ?auto_211 ) ( CLEAR ?auto_207 ) ( IS-CRATE ?auto_208 ) ( not ( = ?auto_208 ?auto_207 ) ) ( AVAILABLE ?auto_209 ) ( TRUCK-AT ?auto_213 ?auto_212 ) ( not ( = ?auto_212 ?auto_211 ) ) ( HOIST-AT ?auto_210 ?auto_212 ) ( not ( = ?auto_209 ?auto_210 ) ) ( AVAILABLE ?auto_210 ) ( SURFACE-AT ?auto_208 ?auto_212 ) ( ON ?auto_208 ?auto_214 ) ( CLEAR ?auto_208 ) ( not ( = ?auto_208 ?auto_214 ) ) ( not ( = ?auto_207 ?auto_214 ) ) )
    :subtasks
    ( ( !LIFT ?auto_210 ?auto_208 ?auto_214 ?auto_212 )
      ( MAKE-ON ?auto_208 ?auto_207 )
      ( MAKE-ON-VERIFY ?auto_208 ?auto_207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_216 - SURFACE
      ?auto_215 - SURFACE
    )
    :vars
    (
      ?auto_222 - HOIST
      ?auto_221 - PLACE
      ?auto_218 - PLACE
      ?auto_219 - HOIST
      ?auto_217 - SURFACE
      ?auto_220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_222 ?auto_221 ) ( SURFACE-AT ?auto_215 ?auto_221 ) ( CLEAR ?auto_215 ) ( IS-CRATE ?auto_216 ) ( not ( = ?auto_216 ?auto_215 ) ) ( AVAILABLE ?auto_222 ) ( not ( = ?auto_218 ?auto_221 ) ) ( HOIST-AT ?auto_219 ?auto_218 ) ( not ( = ?auto_222 ?auto_219 ) ) ( AVAILABLE ?auto_219 ) ( SURFACE-AT ?auto_216 ?auto_218 ) ( ON ?auto_216 ?auto_217 ) ( CLEAR ?auto_216 ) ( not ( = ?auto_216 ?auto_217 ) ) ( not ( = ?auto_215 ?auto_217 ) ) ( TRUCK-AT ?auto_220 ?auto_221 ) )
    :subtasks
    ( ( !DRIVE ?auto_220 ?auto_221 ?auto_218 )
      ( MAKE-ON ?auto_216 ?auto_215 )
      ( MAKE-ON-VERIFY ?auto_216 ?auto_215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_224 - SURFACE
      ?auto_223 - SURFACE
    )
    :vars
    (
      ?auto_228 - HOIST
      ?auto_227 - PLACE
      ?auto_225 - PLACE
      ?auto_229 - HOIST
      ?auto_226 - SURFACE
      ?auto_230 - TRUCK
      ?auto_231 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228 ?auto_227 ) ( IS-CRATE ?auto_224 ) ( not ( = ?auto_224 ?auto_223 ) ) ( not ( = ?auto_225 ?auto_227 ) ) ( HOIST-AT ?auto_229 ?auto_225 ) ( not ( = ?auto_228 ?auto_229 ) ) ( AVAILABLE ?auto_229 ) ( SURFACE-AT ?auto_224 ?auto_225 ) ( ON ?auto_224 ?auto_226 ) ( CLEAR ?auto_224 ) ( not ( = ?auto_224 ?auto_226 ) ) ( not ( = ?auto_223 ?auto_226 ) ) ( TRUCK-AT ?auto_230 ?auto_227 ) ( SURFACE-AT ?auto_231 ?auto_227 ) ( CLEAR ?auto_231 ) ( LIFTING ?auto_228 ?auto_223 ) ( IS-CRATE ?auto_223 ) ( not ( = ?auto_224 ?auto_231 ) ) ( not ( = ?auto_223 ?auto_231 ) ) ( not ( = ?auto_226 ?auto_231 ) ) )
    :subtasks
    ( ( !DROP ?auto_228 ?auto_223 ?auto_231 ?auto_227 )
      ( MAKE-ON ?auto_224 ?auto_223 )
      ( MAKE-ON-VERIFY ?auto_224 ?auto_223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_233 - SURFACE
      ?auto_232 - SURFACE
    )
    :vars
    (
      ?auto_240 - HOIST
      ?auto_236 - PLACE
      ?auto_239 - PLACE
      ?auto_235 - HOIST
      ?auto_237 - SURFACE
      ?auto_238 - TRUCK
      ?auto_234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_240 ?auto_236 ) ( IS-CRATE ?auto_233 ) ( not ( = ?auto_233 ?auto_232 ) ) ( not ( = ?auto_239 ?auto_236 ) ) ( HOIST-AT ?auto_235 ?auto_239 ) ( not ( = ?auto_240 ?auto_235 ) ) ( AVAILABLE ?auto_235 ) ( SURFACE-AT ?auto_233 ?auto_239 ) ( ON ?auto_233 ?auto_237 ) ( CLEAR ?auto_233 ) ( not ( = ?auto_233 ?auto_237 ) ) ( not ( = ?auto_232 ?auto_237 ) ) ( TRUCK-AT ?auto_238 ?auto_236 ) ( SURFACE-AT ?auto_234 ?auto_236 ) ( CLEAR ?auto_234 ) ( IS-CRATE ?auto_232 ) ( not ( = ?auto_233 ?auto_234 ) ) ( not ( = ?auto_232 ?auto_234 ) ) ( not ( = ?auto_237 ?auto_234 ) ) ( AVAILABLE ?auto_240 ) ( IN ?auto_232 ?auto_238 ) )
    :subtasks
    ( ( !UNLOAD ?auto_240 ?auto_232 ?auto_238 ?auto_236 )
      ( MAKE-ON ?auto_233 ?auto_232 )
      ( MAKE-ON-VERIFY ?auto_233 ?auto_232 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_242 - SURFACE
      ?auto_241 - SURFACE
    )
    :vars
    (
      ?auto_243 - HOIST
      ?auto_247 - PLACE
      ?auto_244 - PLACE
      ?auto_245 - HOIST
      ?auto_249 - SURFACE
      ?auto_246 - SURFACE
      ?auto_248 - TRUCK
      ?auto_250 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_243 ?auto_247 ) ( IS-CRATE ?auto_242 ) ( not ( = ?auto_242 ?auto_241 ) ) ( not ( = ?auto_244 ?auto_247 ) ) ( HOIST-AT ?auto_245 ?auto_244 ) ( not ( = ?auto_243 ?auto_245 ) ) ( AVAILABLE ?auto_245 ) ( SURFACE-AT ?auto_242 ?auto_244 ) ( ON ?auto_242 ?auto_249 ) ( CLEAR ?auto_242 ) ( not ( = ?auto_242 ?auto_249 ) ) ( not ( = ?auto_241 ?auto_249 ) ) ( SURFACE-AT ?auto_246 ?auto_247 ) ( CLEAR ?auto_246 ) ( IS-CRATE ?auto_241 ) ( not ( = ?auto_242 ?auto_246 ) ) ( not ( = ?auto_241 ?auto_246 ) ) ( not ( = ?auto_249 ?auto_246 ) ) ( AVAILABLE ?auto_243 ) ( IN ?auto_241 ?auto_248 ) ( TRUCK-AT ?auto_248 ?auto_250 ) ( not ( = ?auto_250 ?auto_247 ) ) ( not ( = ?auto_244 ?auto_250 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_248 ?auto_250 ?auto_247 )
      ( MAKE-ON ?auto_242 ?auto_241 )
      ( MAKE-ON-VERIFY ?auto_242 ?auto_241 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_252 - SURFACE
      ?auto_251 - SURFACE
    )
    :vars
    (
      ?auto_257 - HOIST
      ?auto_260 - PLACE
      ?auto_259 - PLACE
      ?auto_255 - HOIST
      ?auto_253 - SURFACE
      ?auto_256 - SURFACE
      ?auto_254 - TRUCK
      ?auto_258 - PLACE
      ?auto_261 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_257 ?auto_260 ) ( IS-CRATE ?auto_252 ) ( not ( = ?auto_252 ?auto_251 ) ) ( not ( = ?auto_259 ?auto_260 ) ) ( HOIST-AT ?auto_255 ?auto_259 ) ( not ( = ?auto_257 ?auto_255 ) ) ( AVAILABLE ?auto_255 ) ( SURFACE-AT ?auto_252 ?auto_259 ) ( ON ?auto_252 ?auto_253 ) ( CLEAR ?auto_252 ) ( not ( = ?auto_252 ?auto_253 ) ) ( not ( = ?auto_251 ?auto_253 ) ) ( SURFACE-AT ?auto_256 ?auto_260 ) ( CLEAR ?auto_256 ) ( IS-CRATE ?auto_251 ) ( not ( = ?auto_252 ?auto_256 ) ) ( not ( = ?auto_251 ?auto_256 ) ) ( not ( = ?auto_253 ?auto_256 ) ) ( AVAILABLE ?auto_257 ) ( TRUCK-AT ?auto_254 ?auto_258 ) ( not ( = ?auto_258 ?auto_260 ) ) ( not ( = ?auto_259 ?auto_258 ) ) ( HOIST-AT ?auto_261 ?auto_258 ) ( LIFTING ?auto_261 ?auto_251 ) ( not ( = ?auto_257 ?auto_261 ) ) ( not ( = ?auto_255 ?auto_261 ) ) )
    :subtasks
    ( ( !LOAD ?auto_261 ?auto_251 ?auto_254 ?auto_258 )
      ( MAKE-ON ?auto_252 ?auto_251 )
      ( MAKE-ON-VERIFY ?auto_252 ?auto_251 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_263 - SURFACE
      ?auto_262 - SURFACE
    )
    :vars
    (
      ?auto_268 - HOIST
      ?auto_270 - PLACE
      ?auto_266 - PLACE
      ?auto_272 - HOIST
      ?auto_267 - SURFACE
      ?auto_264 - SURFACE
      ?auto_269 - TRUCK
      ?auto_271 - PLACE
      ?auto_265 - HOIST
      ?auto_273 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_268 ?auto_270 ) ( IS-CRATE ?auto_263 ) ( not ( = ?auto_263 ?auto_262 ) ) ( not ( = ?auto_266 ?auto_270 ) ) ( HOIST-AT ?auto_272 ?auto_266 ) ( not ( = ?auto_268 ?auto_272 ) ) ( AVAILABLE ?auto_272 ) ( SURFACE-AT ?auto_263 ?auto_266 ) ( ON ?auto_263 ?auto_267 ) ( CLEAR ?auto_263 ) ( not ( = ?auto_263 ?auto_267 ) ) ( not ( = ?auto_262 ?auto_267 ) ) ( SURFACE-AT ?auto_264 ?auto_270 ) ( CLEAR ?auto_264 ) ( IS-CRATE ?auto_262 ) ( not ( = ?auto_263 ?auto_264 ) ) ( not ( = ?auto_262 ?auto_264 ) ) ( not ( = ?auto_267 ?auto_264 ) ) ( AVAILABLE ?auto_268 ) ( TRUCK-AT ?auto_269 ?auto_271 ) ( not ( = ?auto_271 ?auto_270 ) ) ( not ( = ?auto_266 ?auto_271 ) ) ( HOIST-AT ?auto_265 ?auto_271 ) ( not ( = ?auto_268 ?auto_265 ) ) ( not ( = ?auto_272 ?auto_265 ) ) ( AVAILABLE ?auto_265 ) ( SURFACE-AT ?auto_262 ?auto_271 ) ( ON ?auto_262 ?auto_273 ) ( CLEAR ?auto_262 ) ( not ( = ?auto_263 ?auto_273 ) ) ( not ( = ?auto_262 ?auto_273 ) ) ( not ( = ?auto_267 ?auto_273 ) ) ( not ( = ?auto_264 ?auto_273 ) ) )
    :subtasks
    ( ( !LIFT ?auto_265 ?auto_262 ?auto_273 ?auto_271 )
      ( MAKE-ON ?auto_263 ?auto_262 )
      ( MAKE-ON-VERIFY ?auto_263 ?auto_262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_275 - SURFACE
      ?auto_274 - SURFACE
    )
    :vars
    (
      ?auto_281 - HOIST
      ?auto_284 - PLACE
      ?auto_277 - PLACE
      ?auto_280 - HOIST
      ?auto_279 - SURFACE
      ?auto_282 - SURFACE
      ?auto_283 - PLACE
      ?auto_276 - HOIST
      ?auto_285 - SURFACE
      ?auto_278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_281 ?auto_284 ) ( IS-CRATE ?auto_275 ) ( not ( = ?auto_275 ?auto_274 ) ) ( not ( = ?auto_277 ?auto_284 ) ) ( HOIST-AT ?auto_280 ?auto_277 ) ( not ( = ?auto_281 ?auto_280 ) ) ( AVAILABLE ?auto_280 ) ( SURFACE-AT ?auto_275 ?auto_277 ) ( ON ?auto_275 ?auto_279 ) ( CLEAR ?auto_275 ) ( not ( = ?auto_275 ?auto_279 ) ) ( not ( = ?auto_274 ?auto_279 ) ) ( SURFACE-AT ?auto_282 ?auto_284 ) ( CLEAR ?auto_282 ) ( IS-CRATE ?auto_274 ) ( not ( = ?auto_275 ?auto_282 ) ) ( not ( = ?auto_274 ?auto_282 ) ) ( not ( = ?auto_279 ?auto_282 ) ) ( AVAILABLE ?auto_281 ) ( not ( = ?auto_283 ?auto_284 ) ) ( not ( = ?auto_277 ?auto_283 ) ) ( HOIST-AT ?auto_276 ?auto_283 ) ( not ( = ?auto_281 ?auto_276 ) ) ( not ( = ?auto_280 ?auto_276 ) ) ( AVAILABLE ?auto_276 ) ( SURFACE-AT ?auto_274 ?auto_283 ) ( ON ?auto_274 ?auto_285 ) ( CLEAR ?auto_274 ) ( not ( = ?auto_275 ?auto_285 ) ) ( not ( = ?auto_274 ?auto_285 ) ) ( not ( = ?auto_279 ?auto_285 ) ) ( not ( = ?auto_282 ?auto_285 ) ) ( TRUCK-AT ?auto_278 ?auto_284 ) )
    :subtasks
    ( ( !DRIVE ?auto_278 ?auto_284 ?auto_283 )
      ( MAKE-ON ?auto_275 ?auto_274 )
      ( MAKE-ON-VERIFY ?auto_275 ?auto_274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_289 - SURFACE
      ?auto_288 - SURFACE
    )
    :vars
    (
      ?auto_290 - HOIST
      ?auto_291 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_290 ?auto_291 ) ( SURFACE-AT ?auto_288 ?auto_291 ) ( CLEAR ?auto_288 ) ( LIFTING ?auto_290 ?auto_289 ) ( IS-CRATE ?auto_289 ) ( not ( = ?auto_289 ?auto_288 ) ) )
    :subtasks
    ( ( !DROP ?auto_290 ?auto_289 ?auto_288 ?auto_291 )
      ( MAKE-ON-VERIFY ?auto_289 ?auto_288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_293 - SURFACE
      ?auto_292 - SURFACE
    )
    :vars
    (
      ?auto_294 - HOIST
      ?auto_295 - PLACE
      ?auto_296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_294 ?auto_295 ) ( SURFACE-AT ?auto_292 ?auto_295 ) ( CLEAR ?auto_292 ) ( IS-CRATE ?auto_293 ) ( not ( = ?auto_293 ?auto_292 ) ) ( TRUCK-AT ?auto_296 ?auto_295 ) ( AVAILABLE ?auto_294 ) ( IN ?auto_293 ?auto_296 ) )
    :subtasks
    ( ( !UNLOAD ?auto_294 ?auto_293 ?auto_296 ?auto_295 )
      ( MAKE-ON ?auto_293 ?auto_292 )
      ( MAKE-ON-VERIFY ?auto_293 ?auto_292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_298 - SURFACE
      ?auto_297 - SURFACE
    )
    :vars
    (
      ?auto_299 - HOIST
      ?auto_300 - PLACE
      ?auto_301 - TRUCK
      ?auto_302 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_299 ?auto_300 ) ( SURFACE-AT ?auto_297 ?auto_300 ) ( CLEAR ?auto_297 ) ( IS-CRATE ?auto_298 ) ( not ( = ?auto_298 ?auto_297 ) ) ( AVAILABLE ?auto_299 ) ( IN ?auto_298 ?auto_301 ) ( TRUCK-AT ?auto_301 ?auto_302 ) ( not ( = ?auto_302 ?auto_300 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_301 ?auto_302 ?auto_300 )
      ( MAKE-ON ?auto_298 ?auto_297 )
      ( MAKE-ON-VERIFY ?auto_298 ?auto_297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_304 - SURFACE
      ?auto_303 - SURFACE
    )
    :vars
    (
      ?auto_305 - HOIST
      ?auto_308 - PLACE
      ?auto_307 - TRUCK
      ?auto_306 - PLACE
      ?auto_309 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_305 ?auto_308 ) ( SURFACE-AT ?auto_303 ?auto_308 ) ( CLEAR ?auto_303 ) ( IS-CRATE ?auto_304 ) ( not ( = ?auto_304 ?auto_303 ) ) ( AVAILABLE ?auto_305 ) ( TRUCK-AT ?auto_307 ?auto_306 ) ( not ( = ?auto_306 ?auto_308 ) ) ( HOIST-AT ?auto_309 ?auto_306 ) ( LIFTING ?auto_309 ?auto_304 ) ( not ( = ?auto_305 ?auto_309 ) ) )
    :subtasks
    ( ( !LOAD ?auto_309 ?auto_304 ?auto_307 ?auto_306 )
      ( MAKE-ON ?auto_304 ?auto_303 )
      ( MAKE-ON-VERIFY ?auto_304 ?auto_303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_311 - SURFACE
      ?auto_310 - SURFACE
    )
    :vars
    (
      ?auto_312 - HOIST
      ?auto_314 - PLACE
      ?auto_313 - TRUCK
      ?auto_315 - PLACE
      ?auto_316 - HOIST
      ?auto_317 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_312 ?auto_314 ) ( SURFACE-AT ?auto_310 ?auto_314 ) ( CLEAR ?auto_310 ) ( IS-CRATE ?auto_311 ) ( not ( = ?auto_311 ?auto_310 ) ) ( AVAILABLE ?auto_312 ) ( TRUCK-AT ?auto_313 ?auto_315 ) ( not ( = ?auto_315 ?auto_314 ) ) ( HOIST-AT ?auto_316 ?auto_315 ) ( not ( = ?auto_312 ?auto_316 ) ) ( AVAILABLE ?auto_316 ) ( SURFACE-AT ?auto_311 ?auto_315 ) ( ON ?auto_311 ?auto_317 ) ( CLEAR ?auto_311 ) ( not ( = ?auto_311 ?auto_317 ) ) ( not ( = ?auto_310 ?auto_317 ) ) )
    :subtasks
    ( ( !LIFT ?auto_316 ?auto_311 ?auto_317 ?auto_315 )
      ( MAKE-ON ?auto_311 ?auto_310 )
      ( MAKE-ON-VERIFY ?auto_311 ?auto_310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_319 - SURFACE
      ?auto_318 - SURFACE
    )
    :vars
    (
      ?auto_325 - HOIST
      ?auto_321 - PLACE
      ?auto_322 - PLACE
      ?auto_324 - HOIST
      ?auto_320 - SURFACE
      ?auto_323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_325 ?auto_321 ) ( SURFACE-AT ?auto_318 ?auto_321 ) ( CLEAR ?auto_318 ) ( IS-CRATE ?auto_319 ) ( not ( = ?auto_319 ?auto_318 ) ) ( AVAILABLE ?auto_325 ) ( not ( = ?auto_322 ?auto_321 ) ) ( HOIST-AT ?auto_324 ?auto_322 ) ( not ( = ?auto_325 ?auto_324 ) ) ( AVAILABLE ?auto_324 ) ( SURFACE-AT ?auto_319 ?auto_322 ) ( ON ?auto_319 ?auto_320 ) ( CLEAR ?auto_319 ) ( not ( = ?auto_319 ?auto_320 ) ) ( not ( = ?auto_318 ?auto_320 ) ) ( TRUCK-AT ?auto_323 ?auto_321 ) )
    :subtasks
    ( ( !DRIVE ?auto_323 ?auto_321 ?auto_322 )
      ( MAKE-ON ?auto_319 ?auto_318 )
      ( MAKE-ON-VERIFY ?auto_319 ?auto_318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_327 - SURFACE
      ?auto_326 - SURFACE
    )
    :vars
    (
      ?auto_332 - HOIST
      ?auto_331 - PLACE
      ?auto_329 - PLACE
      ?auto_330 - HOIST
      ?auto_333 - SURFACE
      ?auto_328 - TRUCK
      ?auto_334 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_332 ?auto_331 ) ( IS-CRATE ?auto_327 ) ( not ( = ?auto_327 ?auto_326 ) ) ( not ( = ?auto_329 ?auto_331 ) ) ( HOIST-AT ?auto_330 ?auto_329 ) ( not ( = ?auto_332 ?auto_330 ) ) ( AVAILABLE ?auto_330 ) ( SURFACE-AT ?auto_327 ?auto_329 ) ( ON ?auto_327 ?auto_333 ) ( CLEAR ?auto_327 ) ( not ( = ?auto_327 ?auto_333 ) ) ( not ( = ?auto_326 ?auto_333 ) ) ( TRUCK-AT ?auto_328 ?auto_331 ) ( SURFACE-AT ?auto_334 ?auto_331 ) ( CLEAR ?auto_334 ) ( LIFTING ?auto_332 ?auto_326 ) ( IS-CRATE ?auto_326 ) ( not ( = ?auto_327 ?auto_334 ) ) ( not ( = ?auto_326 ?auto_334 ) ) ( not ( = ?auto_333 ?auto_334 ) ) )
    :subtasks
    ( ( !DROP ?auto_332 ?auto_326 ?auto_334 ?auto_331 )
      ( MAKE-ON ?auto_327 ?auto_326 )
      ( MAKE-ON-VERIFY ?auto_327 ?auto_326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_336 - SURFACE
      ?auto_335 - SURFACE
    )
    :vars
    (
      ?auto_340 - HOIST
      ?auto_342 - PLACE
      ?auto_338 - PLACE
      ?auto_339 - HOIST
      ?auto_337 - SURFACE
      ?auto_341 - TRUCK
      ?auto_343 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_340 ?auto_342 ) ( IS-CRATE ?auto_336 ) ( not ( = ?auto_336 ?auto_335 ) ) ( not ( = ?auto_338 ?auto_342 ) ) ( HOIST-AT ?auto_339 ?auto_338 ) ( not ( = ?auto_340 ?auto_339 ) ) ( AVAILABLE ?auto_339 ) ( SURFACE-AT ?auto_336 ?auto_338 ) ( ON ?auto_336 ?auto_337 ) ( CLEAR ?auto_336 ) ( not ( = ?auto_336 ?auto_337 ) ) ( not ( = ?auto_335 ?auto_337 ) ) ( TRUCK-AT ?auto_341 ?auto_342 ) ( SURFACE-AT ?auto_343 ?auto_342 ) ( CLEAR ?auto_343 ) ( IS-CRATE ?auto_335 ) ( not ( = ?auto_336 ?auto_343 ) ) ( not ( = ?auto_335 ?auto_343 ) ) ( not ( = ?auto_337 ?auto_343 ) ) ( AVAILABLE ?auto_340 ) ( IN ?auto_335 ?auto_341 ) )
    :subtasks
    ( ( !UNLOAD ?auto_340 ?auto_335 ?auto_341 ?auto_342 )
      ( MAKE-ON ?auto_336 ?auto_335 )
      ( MAKE-ON-VERIFY ?auto_336 ?auto_335 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_345 - SURFACE
      ?auto_344 - SURFACE
    )
    :vars
    (
      ?auto_347 - HOIST
      ?auto_351 - PLACE
      ?auto_350 - PLACE
      ?auto_346 - HOIST
      ?auto_349 - SURFACE
      ?auto_352 - SURFACE
      ?auto_348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347 ?auto_351 ) ( IS-CRATE ?auto_345 ) ( not ( = ?auto_345 ?auto_344 ) ) ( not ( = ?auto_350 ?auto_351 ) ) ( HOIST-AT ?auto_346 ?auto_350 ) ( not ( = ?auto_347 ?auto_346 ) ) ( AVAILABLE ?auto_346 ) ( SURFACE-AT ?auto_345 ?auto_350 ) ( ON ?auto_345 ?auto_349 ) ( CLEAR ?auto_345 ) ( not ( = ?auto_345 ?auto_349 ) ) ( not ( = ?auto_344 ?auto_349 ) ) ( SURFACE-AT ?auto_352 ?auto_351 ) ( CLEAR ?auto_352 ) ( IS-CRATE ?auto_344 ) ( not ( = ?auto_345 ?auto_352 ) ) ( not ( = ?auto_344 ?auto_352 ) ) ( not ( = ?auto_349 ?auto_352 ) ) ( AVAILABLE ?auto_347 ) ( IN ?auto_344 ?auto_348 ) ( TRUCK-AT ?auto_348 ?auto_350 ) )
    :subtasks
    ( ( !DRIVE ?auto_348 ?auto_350 ?auto_351 )
      ( MAKE-ON ?auto_345 ?auto_344 )
      ( MAKE-ON-VERIFY ?auto_345 ?auto_344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_354 - SURFACE
      ?auto_353 - SURFACE
    )
    :vars
    (
      ?auto_355 - HOIST
      ?auto_360 - PLACE
      ?auto_356 - PLACE
      ?auto_361 - HOIST
      ?auto_359 - SURFACE
      ?auto_357 - SURFACE
      ?auto_358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_355 ?auto_360 ) ( IS-CRATE ?auto_354 ) ( not ( = ?auto_354 ?auto_353 ) ) ( not ( = ?auto_356 ?auto_360 ) ) ( HOIST-AT ?auto_361 ?auto_356 ) ( not ( = ?auto_355 ?auto_361 ) ) ( SURFACE-AT ?auto_354 ?auto_356 ) ( ON ?auto_354 ?auto_359 ) ( CLEAR ?auto_354 ) ( not ( = ?auto_354 ?auto_359 ) ) ( not ( = ?auto_353 ?auto_359 ) ) ( SURFACE-AT ?auto_357 ?auto_360 ) ( CLEAR ?auto_357 ) ( IS-CRATE ?auto_353 ) ( not ( = ?auto_354 ?auto_357 ) ) ( not ( = ?auto_353 ?auto_357 ) ) ( not ( = ?auto_359 ?auto_357 ) ) ( AVAILABLE ?auto_355 ) ( TRUCK-AT ?auto_358 ?auto_356 ) ( LIFTING ?auto_361 ?auto_353 ) )
    :subtasks
    ( ( !LOAD ?auto_361 ?auto_353 ?auto_358 ?auto_356 )
      ( MAKE-ON ?auto_354 ?auto_353 )
      ( MAKE-ON-VERIFY ?auto_354 ?auto_353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_363 - SURFACE
      ?auto_362 - SURFACE
    )
    :vars
    (
      ?auto_370 - HOIST
      ?auto_366 - PLACE
      ?auto_367 - PLACE
      ?auto_365 - HOIST
      ?auto_369 - SURFACE
      ?auto_368 - SURFACE
      ?auto_364 - TRUCK
      ?auto_371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_370 ?auto_366 ) ( IS-CRATE ?auto_363 ) ( not ( = ?auto_363 ?auto_362 ) ) ( not ( = ?auto_367 ?auto_366 ) ) ( HOIST-AT ?auto_365 ?auto_367 ) ( not ( = ?auto_370 ?auto_365 ) ) ( SURFACE-AT ?auto_363 ?auto_367 ) ( ON ?auto_363 ?auto_369 ) ( CLEAR ?auto_363 ) ( not ( = ?auto_363 ?auto_369 ) ) ( not ( = ?auto_362 ?auto_369 ) ) ( SURFACE-AT ?auto_368 ?auto_366 ) ( CLEAR ?auto_368 ) ( IS-CRATE ?auto_362 ) ( not ( = ?auto_363 ?auto_368 ) ) ( not ( = ?auto_362 ?auto_368 ) ) ( not ( = ?auto_369 ?auto_368 ) ) ( AVAILABLE ?auto_370 ) ( TRUCK-AT ?auto_364 ?auto_367 ) ( AVAILABLE ?auto_365 ) ( SURFACE-AT ?auto_362 ?auto_367 ) ( ON ?auto_362 ?auto_371 ) ( CLEAR ?auto_362 ) ( not ( = ?auto_363 ?auto_371 ) ) ( not ( = ?auto_362 ?auto_371 ) ) ( not ( = ?auto_369 ?auto_371 ) ) ( not ( = ?auto_368 ?auto_371 ) ) )
    :subtasks
    ( ( !LIFT ?auto_365 ?auto_362 ?auto_371 ?auto_367 )
      ( MAKE-ON ?auto_363 ?auto_362 )
      ( MAKE-ON-VERIFY ?auto_363 ?auto_362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_373 - SURFACE
      ?auto_372 - SURFACE
    )
    :vars
    (
      ?auto_374 - HOIST
      ?auto_375 - PLACE
      ?auto_378 - PLACE
      ?auto_376 - HOIST
      ?auto_380 - SURFACE
      ?auto_379 - SURFACE
      ?auto_381 - SURFACE
      ?auto_377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_374 ?auto_375 ) ( IS-CRATE ?auto_373 ) ( not ( = ?auto_373 ?auto_372 ) ) ( not ( = ?auto_378 ?auto_375 ) ) ( HOIST-AT ?auto_376 ?auto_378 ) ( not ( = ?auto_374 ?auto_376 ) ) ( SURFACE-AT ?auto_373 ?auto_378 ) ( ON ?auto_373 ?auto_380 ) ( CLEAR ?auto_373 ) ( not ( = ?auto_373 ?auto_380 ) ) ( not ( = ?auto_372 ?auto_380 ) ) ( SURFACE-AT ?auto_379 ?auto_375 ) ( CLEAR ?auto_379 ) ( IS-CRATE ?auto_372 ) ( not ( = ?auto_373 ?auto_379 ) ) ( not ( = ?auto_372 ?auto_379 ) ) ( not ( = ?auto_380 ?auto_379 ) ) ( AVAILABLE ?auto_374 ) ( AVAILABLE ?auto_376 ) ( SURFACE-AT ?auto_372 ?auto_378 ) ( ON ?auto_372 ?auto_381 ) ( CLEAR ?auto_372 ) ( not ( = ?auto_373 ?auto_381 ) ) ( not ( = ?auto_372 ?auto_381 ) ) ( not ( = ?auto_380 ?auto_381 ) ) ( not ( = ?auto_379 ?auto_381 ) ) ( TRUCK-AT ?auto_377 ?auto_375 ) )
    :subtasks
    ( ( !DRIVE ?auto_377 ?auto_375 ?auto_378 )
      ( MAKE-ON ?auto_373 ?auto_372 )
      ( MAKE-ON-VERIFY ?auto_373 ?auto_372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_383 - SURFACE
      ?auto_382 - SURFACE
    )
    :vars
    (
      ?auto_391 - HOIST
      ?auto_390 - PLACE
      ?auto_388 - PLACE
      ?auto_386 - HOIST
      ?auto_385 - SURFACE
      ?auto_389 - SURFACE
      ?auto_384 - SURFACE
      ?auto_387 - TRUCK
      ?auto_392 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_391 ?auto_390 ) ( IS-CRATE ?auto_383 ) ( not ( = ?auto_383 ?auto_382 ) ) ( not ( = ?auto_388 ?auto_390 ) ) ( HOIST-AT ?auto_386 ?auto_388 ) ( not ( = ?auto_391 ?auto_386 ) ) ( SURFACE-AT ?auto_383 ?auto_388 ) ( ON ?auto_383 ?auto_385 ) ( CLEAR ?auto_383 ) ( not ( = ?auto_383 ?auto_385 ) ) ( not ( = ?auto_382 ?auto_385 ) ) ( IS-CRATE ?auto_382 ) ( not ( = ?auto_383 ?auto_389 ) ) ( not ( = ?auto_382 ?auto_389 ) ) ( not ( = ?auto_385 ?auto_389 ) ) ( AVAILABLE ?auto_386 ) ( SURFACE-AT ?auto_382 ?auto_388 ) ( ON ?auto_382 ?auto_384 ) ( CLEAR ?auto_382 ) ( not ( = ?auto_383 ?auto_384 ) ) ( not ( = ?auto_382 ?auto_384 ) ) ( not ( = ?auto_385 ?auto_384 ) ) ( not ( = ?auto_389 ?auto_384 ) ) ( TRUCK-AT ?auto_387 ?auto_390 ) ( SURFACE-AT ?auto_392 ?auto_390 ) ( CLEAR ?auto_392 ) ( LIFTING ?auto_391 ?auto_389 ) ( IS-CRATE ?auto_389 ) ( not ( = ?auto_383 ?auto_392 ) ) ( not ( = ?auto_382 ?auto_392 ) ) ( not ( = ?auto_385 ?auto_392 ) ) ( not ( = ?auto_389 ?auto_392 ) ) ( not ( = ?auto_384 ?auto_392 ) ) )
    :subtasks
    ( ( !DROP ?auto_391 ?auto_389 ?auto_392 ?auto_390 )
      ( MAKE-ON ?auto_383 ?auto_382 )
      ( MAKE-ON-VERIFY ?auto_383 ?auto_382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_394 - SURFACE
      ?auto_393 - SURFACE
    )
    :vars
    (
      ?auto_397 - HOIST
      ?auto_399 - PLACE
      ?auto_403 - PLACE
      ?auto_401 - HOIST
      ?auto_400 - SURFACE
      ?auto_402 - SURFACE
      ?auto_398 - SURFACE
      ?auto_396 - TRUCK
      ?auto_395 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_397 ?auto_399 ) ( IS-CRATE ?auto_394 ) ( not ( = ?auto_394 ?auto_393 ) ) ( not ( = ?auto_403 ?auto_399 ) ) ( HOIST-AT ?auto_401 ?auto_403 ) ( not ( = ?auto_397 ?auto_401 ) ) ( SURFACE-AT ?auto_394 ?auto_403 ) ( ON ?auto_394 ?auto_400 ) ( CLEAR ?auto_394 ) ( not ( = ?auto_394 ?auto_400 ) ) ( not ( = ?auto_393 ?auto_400 ) ) ( IS-CRATE ?auto_393 ) ( not ( = ?auto_394 ?auto_402 ) ) ( not ( = ?auto_393 ?auto_402 ) ) ( not ( = ?auto_400 ?auto_402 ) ) ( AVAILABLE ?auto_401 ) ( SURFACE-AT ?auto_393 ?auto_403 ) ( ON ?auto_393 ?auto_398 ) ( CLEAR ?auto_393 ) ( not ( = ?auto_394 ?auto_398 ) ) ( not ( = ?auto_393 ?auto_398 ) ) ( not ( = ?auto_400 ?auto_398 ) ) ( not ( = ?auto_402 ?auto_398 ) ) ( TRUCK-AT ?auto_396 ?auto_399 ) ( SURFACE-AT ?auto_395 ?auto_399 ) ( CLEAR ?auto_395 ) ( IS-CRATE ?auto_402 ) ( not ( = ?auto_394 ?auto_395 ) ) ( not ( = ?auto_393 ?auto_395 ) ) ( not ( = ?auto_400 ?auto_395 ) ) ( not ( = ?auto_402 ?auto_395 ) ) ( not ( = ?auto_398 ?auto_395 ) ) ( AVAILABLE ?auto_397 ) ( IN ?auto_402 ?auto_396 ) )
    :subtasks
    ( ( !UNLOAD ?auto_397 ?auto_402 ?auto_396 ?auto_399 )
      ( MAKE-ON ?auto_394 ?auto_393 )
      ( MAKE-ON-VERIFY ?auto_394 ?auto_393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_405 - SURFACE
      ?auto_404 - SURFACE
    )
    :vars
    (
      ?auto_406 - HOIST
      ?auto_408 - PLACE
      ?auto_409 - PLACE
      ?auto_412 - HOIST
      ?auto_411 - SURFACE
      ?auto_413 - SURFACE
      ?auto_410 - SURFACE
      ?auto_414 - SURFACE
      ?auto_407 - TRUCK
      ?auto_415 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_406 ?auto_408 ) ( IS-CRATE ?auto_405 ) ( not ( = ?auto_405 ?auto_404 ) ) ( not ( = ?auto_409 ?auto_408 ) ) ( HOIST-AT ?auto_412 ?auto_409 ) ( not ( = ?auto_406 ?auto_412 ) ) ( SURFACE-AT ?auto_405 ?auto_409 ) ( ON ?auto_405 ?auto_411 ) ( CLEAR ?auto_405 ) ( not ( = ?auto_405 ?auto_411 ) ) ( not ( = ?auto_404 ?auto_411 ) ) ( IS-CRATE ?auto_404 ) ( not ( = ?auto_405 ?auto_413 ) ) ( not ( = ?auto_404 ?auto_413 ) ) ( not ( = ?auto_411 ?auto_413 ) ) ( AVAILABLE ?auto_412 ) ( SURFACE-AT ?auto_404 ?auto_409 ) ( ON ?auto_404 ?auto_410 ) ( CLEAR ?auto_404 ) ( not ( = ?auto_405 ?auto_410 ) ) ( not ( = ?auto_404 ?auto_410 ) ) ( not ( = ?auto_411 ?auto_410 ) ) ( not ( = ?auto_413 ?auto_410 ) ) ( SURFACE-AT ?auto_414 ?auto_408 ) ( CLEAR ?auto_414 ) ( IS-CRATE ?auto_413 ) ( not ( = ?auto_405 ?auto_414 ) ) ( not ( = ?auto_404 ?auto_414 ) ) ( not ( = ?auto_411 ?auto_414 ) ) ( not ( = ?auto_413 ?auto_414 ) ) ( not ( = ?auto_410 ?auto_414 ) ) ( AVAILABLE ?auto_406 ) ( IN ?auto_413 ?auto_407 ) ( TRUCK-AT ?auto_407 ?auto_415 ) ( not ( = ?auto_415 ?auto_408 ) ) ( not ( = ?auto_409 ?auto_415 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_407 ?auto_415 ?auto_408 )
      ( MAKE-ON ?auto_405 ?auto_404 )
      ( MAKE-ON-VERIFY ?auto_405 ?auto_404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_417 - SURFACE
      ?auto_416 - SURFACE
    )
    :vars
    (
      ?auto_419 - HOIST
      ?auto_425 - PLACE
      ?auto_422 - PLACE
      ?auto_426 - HOIST
      ?auto_423 - SURFACE
      ?auto_424 - SURFACE
      ?auto_420 - SURFACE
      ?auto_418 - SURFACE
      ?auto_421 - TRUCK
      ?auto_427 - PLACE
      ?auto_428 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_419 ?auto_425 ) ( IS-CRATE ?auto_417 ) ( not ( = ?auto_417 ?auto_416 ) ) ( not ( = ?auto_422 ?auto_425 ) ) ( HOIST-AT ?auto_426 ?auto_422 ) ( not ( = ?auto_419 ?auto_426 ) ) ( SURFACE-AT ?auto_417 ?auto_422 ) ( ON ?auto_417 ?auto_423 ) ( CLEAR ?auto_417 ) ( not ( = ?auto_417 ?auto_423 ) ) ( not ( = ?auto_416 ?auto_423 ) ) ( IS-CRATE ?auto_416 ) ( not ( = ?auto_417 ?auto_424 ) ) ( not ( = ?auto_416 ?auto_424 ) ) ( not ( = ?auto_423 ?auto_424 ) ) ( AVAILABLE ?auto_426 ) ( SURFACE-AT ?auto_416 ?auto_422 ) ( ON ?auto_416 ?auto_420 ) ( CLEAR ?auto_416 ) ( not ( = ?auto_417 ?auto_420 ) ) ( not ( = ?auto_416 ?auto_420 ) ) ( not ( = ?auto_423 ?auto_420 ) ) ( not ( = ?auto_424 ?auto_420 ) ) ( SURFACE-AT ?auto_418 ?auto_425 ) ( CLEAR ?auto_418 ) ( IS-CRATE ?auto_424 ) ( not ( = ?auto_417 ?auto_418 ) ) ( not ( = ?auto_416 ?auto_418 ) ) ( not ( = ?auto_423 ?auto_418 ) ) ( not ( = ?auto_424 ?auto_418 ) ) ( not ( = ?auto_420 ?auto_418 ) ) ( AVAILABLE ?auto_419 ) ( TRUCK-AT ?auto_421 ?auto_427 ) ( not ( = ?auto_427 ?auto_425 ) ) ( not ( = ?auto_422 ?auto_427 ) ) ( HOIST-AT ?auto_428 ?auto_427 ) ( LIFTING ?auto_428 ?auto_424 ) ( not ( = ?auto_419 ?auto_428 ) ) ( not ( = ?auto_426 ?auto_428 ) ) )
    :subtasks
    ( ( !LOAD ?auto_428 ?auto_424 ?auto_421 ?auto_427 )
      ( MAKE-ON ?auto_417 ?auto_416 )
      ( MAKE-ON-VERIFY ?auto_417 ?auto_416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_430 - SURFACE
      ?auto_429 - SURFACE
    )
    :vars
    (
      ?auto_435 - HOIST
      ?auto_437 - PLACE
      ?auto_432 - PLACE
      ?auto_440 - HOIST
      ?auto_433 - SURFACE
      ?auto_439 - SURFACE
      ?auto_438 - SURFACE
      ?auto_436 - SURFACE
      ?auto_434 - TRUCK
      ?auto_431 - PLACE
      ?auto_441 - HOIST
      ?auto_442 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_435 ?auto_437 ) ( IS-CRATE ?auto_430 ) ( not ( = ?auto_430 ?auto_429 ) ) ( not ( = ?auto_432 ?auto_437 ) ) ( HOIST-AT ?auto_440 ?auto_432 ) ( not ( = ?auto_435 ?auto_440 ) ) ( SURFACE-AT ?auto_430 ?auto_432 ) ( ON ?auto_430 ?auto_433 ) ( CLEAR ?auto_430 ) ( not ( = ?auto_430 ?auto_433 ) ) ( not ( = ?auto_429 ?auto_433 ) ) ( IS-CRATE ?auto_429 ) ( not ( = ?auto_430 ?auto_439 ) ) ( not ( = ?auto_429 ?auto_439 ) ) ( not ( = ?auto_433 ?auto_439 ) ) ( AVAILABLE ?auto_440 ) ( SURFACE-AT ?auto_429 ?auto_432 ) ( ON ?auto_429 ?auto_438 ) ( CLEAR ?auto_429 ) ( not ( = ?auto_430 ?auto_438 ) ) ( not ( = ?auto_429 ?auto_438 ) ) ( not ( = ?auto_433 ?auto_438 ) ) ( not ( = ?auto_439 ?auto_438 ) ) ( SURFACE-AT ?auto_436 ?auto_437 ) ( CLEAR ?auto_436 ) ( IS-CRATE ?auto_439 ) ( not ( = ?auto_430 ?auto_436 ) ) ( not ( = ?auto_429 ?auto_436 ) ) ( not ( = ?auto_433 ?auto_436 ) ) ( not ( = ?auto_439 ?auto_436 ) ) ( not ( = ?auto_438 ?auto_436 ) ) ( AVAILABLE ?auto_435 ) ( TRUCK-AT ?auto_434 ?auto_431 ) ( not ( = ?auto_431 ?auto_437 ) ) ( not ( = ?auto_432 ?auto_431 ) ) ( HOIST-AT ?auto_441 ?auto_431 ) ( not ( = ?auto_435 ?auto_441 ) ) ( not ( = ?auto_440 ?auto_441 ) ) ( AVAILABLE ?auto_441 ) ( SURFACE-AT ?auto_439 ?auto_431 ) ( ON ?auto_439 ?auto_442 ) ( CLEAR ?auto_439 ) ( not ( = ?auto_430 ?auto_442 ) ) ( not ( = ?auto_429 ?auto_442 ) ) ( not ( = ?auto_433 ?auto_442 ) ) ( not ( = ?auto_439 ?auto_442 ) ) ( not ( = ?auto_438 ?auto_442 ) ) ( not ( = ?auto_436 ?auto_442 ) ) )
    :subtasks
    ( ( !LIFT ?auto_441 ?auto_439 ?auto_442 ?auto_431 )
      ( MAKE-ON ?auto_430 ?auto_429 )
      ( MAKE-ON-VERIFY ?auto_430 ?auto_429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_444 - SURFACE
      ?auto_443 - SURFACE
    )
    :vars
    (
      ?auto_449 - HOIST
      ?auto_448 - PLACE
      ?auto_445 - PLACE
      ?auto_453 - HOIST
      ?auto_446 - SURFACE
      ?auto_454 - SURFACE
      ?auto_447 - SURFACE
      ?auto_450 - SURFACE
      ?auto_455 - PLACE
      ?auto_452 - HOIST
      ?auto_456 - SURFACE
      ?auto_451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_449 ?auto_448 ) ( IS-CRATE ?auto_444 ) ( not ( = ?auto_444 ?auto_443 ) ) ( not ( = ?auto_445 ?auto_448 ) ) ( HOIST-AT ?auto_453 ?auto_445 ) ( not ( = ?auto_449 ?auto_453 ) ) ( SURFACE-AT ?auto_444 ?auto_445 ) ( ON ?auto_444 ?auto_446 ) ( CLEAR ?auto_444 ) ( not ( = ?auto_444 ?auto_446 ) ) ( not ( = ?auto_443 ?auto_446 ) ) ( IS-CRATE ?auto_443 ) ( not ( = ?auto_444 ?auto_454 ) ) ( not ( = ?auto_443 ?auto_454 ) ) ( not ( = ?auto_446 ?auto_454 ) ) ( AVAILABLE ?auto_453 ) ( SURFACE-AT ?auto_443 ?auto_445 ) ( ON ?auto_443 ?auto_447 ) ( CLEAR ?auto_443 ) ( not ( = ?auto_444 ?auto_447 ) ) ( not ( = ?auto_443 ?auto_447 ) ) ( not ( = ?auto_446 ?auto_447 ) ) ( not ( = ?auto_454 ?auto_447 ) ) ( SURFACE-AT ?auto_450 ?auto_448 ) ( CLEAR ?auto_450 ) ( IS-CRATE ?auto_454 ) ( not ( = ?auto_444 ?auto_450 ) ) ( not ( = ?auto_443 ?auto_450 ) ) ( not ( = ?auto_446 ?auto_450 ) ) ( not ( = ?auto_454 ?auto_450 ) ) ( not ( = ?auto_447 ?auto_450 ) ) ( AVAILABLE ?auto_449 ) ( not ( = ?auto_455 ?auto_448 ) ) ( not ( = ?auto_445 ?auto_455 ) ) ( HOIST-AT ?auto_452 ?auto_455 ) ( not ( = ?auto_449 ?auto_452 ) ) ( not ( = ?auto_453 ?auto_452 ) ) ( AVAILABLE ?auto_452 ) ( SURFACE-AT ?auto_454 ?auto_455 ) ( ON ?auto_454 ?auto_456 ) ( CLEAR ?auto_454 ) ( not ( = ?auto_444 ?auto_456 ) ) ( not ( = ?auto_443 ?auto_456 ) ) ( not ( = ?auto_446 ?auto_456 ) ) ( not ( = ?auto_454 ?auto_456 ) ) ( not ( = ?auto_447 ?auto_456 ) ) ( not ( = ?auto_450 ?auto_456 ) ) ( TRUCK-AT ?auto_451 ?auto_448 ) )
    :subtasks
    ( ( !DRIVE ?auto_451 ?auto_448 ?auto_455 )
      ( MAKE-ON ?auto_444 ?auto_443 )
      ( MAKE-ON-VERIFY ?auto_444 ?auto_443 ) )
  )

)

