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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6162 - SURFACE
      ?auto_6163 - SURFACE
    )
    :vars
    (
      ?auto_6164 - HOIST
      ?auto_6165 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6164 ?auto_6165 ) ( SURFACE-AT ?auto_6162 ?auto_6165 ) ( CLEAR ?auto_6162 ) ( LIFTING ?auto_6164 ?auto_6163 ) ( IS-CRATE ?auto_6163 ) ( not ( = ?auto_6162 ?auto_6163 ) ) )
    :subtasks
    ( ( !DROP ?auto_6164 ?auto_6163 ?auto_6162 ?auto_6165 )
      ( MAKE-1CRATE-VERIFY ?auto_6162 ?auto_6163 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6166 - SURFACE
      ?auto_6167 - SURFACE
    )
    :vars
    (
      ?auto_6168 - HOIST
      ?auto_6169 - PLACE
      ?auto_6170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6168 ?auto_6169 ) ( SURFACE-AT ?auto_6166 ?auto_6169 ) ( CLEAR ?auto_6166 ) ( IS-CRATE ?auto_6167 ) ( not ( = ?auto_6166 ?auto_6167 ) ) ( TRUCK-AT ?auto_6170 ?auto_6169 ) ( AVAILABLE ?auto_6168 ) ( IN ?auto_6167 ?auto_6170 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6168 ?auto_6167 ?auto_6170 ?auto_6169 )
      ( MAKE-1CRATE ?auto_6166 ?auto_6167 )
      ( MAKE-1CRATE-VERIFY ?auto_6166 ?auto_6167 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6171 - SURFACE
      ?auto_6172 - SURFACE
    )
    :vars
    (
      ?auto_6174 - HOIST
      ?auto_6175 - PLACE
      ?auto_6173 - TRUCK
      ?auto_6176 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6174 ?auto_6175 ) ( SURFACE-AT ?auto_6171 ?auto_6175 ) ( CLEAR ?auto_6171 ) ( IS-CRATE ?auto_6172 ) ( not ( = ?auto_6171 ?auto_6172 ) ) ( AVAILABLE ?auto_6174 ) ( IN ?auto_6172 ?auto_6173 ) ( TRUCK-AT ?auto_6173 ?auto_6176 ) ( not ( = ?auto_6176 ?auto_6175 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6173 ?auto_6176 ?auto_6175 )
      ( MAKE-1CRATE ?auto_6171 ?auto_6172 )
      ( MAKE-1CRATE-VERIFY ?auto_6171 ?auto_6172 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6177 - SURFACE
      ?auto_6178 - SURFACE
    )
    :vars
    (
      ?auto_6182 - HOIST
      ?auto_6180 - PLACE
      ?auto_6181 - TRUCK
      ?auto_6179 - PLACE
      ?auto_6183 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6182 ?auto_6180 ) ( SURFACE-AT ?auto_6177 ?auto_6180 ) ( CLEAR ?auto_6177 ) ( IS-CRATE ?auto_6178 ) ( not ( = ?auto_6177 ?auto_6178 ) ) ( AVAILABLE ?auto_6182 ) ( TRUCK-AT ?auto_6181 ?auto_6179 ) ( not ( = ?auto_6179 ?auto_6180 ) ) ( HOIST-AT ?auto_6183 ?auto_6179 ) ( LIFTING ?auto_6183 ?auto_6178 ) ( not ( = ?auto_6182 ?auto_6183 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6183 ?auto_6178 ?auto_6181 ?auto_6179 )
      ( MAKE-1CRATE ?auto_6177 ?auto_6178 )
      ( MAKE-1CRATE-VERIFY ?auto_6177 ?auto_6178 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6184 - SURFACE
      ?auto_6185 - SURFACE
    )
    :vars
    (
      ?auto_6189 - HOIST
      ?auto_6188 - PLACE
      ?auto_6186 - TRUCK
      ?auto_6190 - PLACE
      ?auto_6187 - HOIST
      ?auto_6191 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6189 ?auto_6188 ) ( SURFACE-AT ?auto_6184 ?auto_6188 ) ( CLEAR ?auto_6184 ) ( IS-CRATE ?auto_6185 ) ( not ( = ?auto_6184 ?auto_6185 ) ) ( AVAILABLE ?auto_6189 ) ( TRUCK-AT ?auto_6186 ?auto_6190 ) ( not ( = ?auto_6190 ?auto_6188 ) ) ( HOIST-AT ?auto_6187 ?auto_6190 ) ( not ( = ?auto_6189 ?auto_6187 ) ) ( AVAILABLE ?auto_6187 ) ( SURFACE-AT ?auto_6185 ?auto_6190 ) ( ON ?auto_6185 ?auto_6191 ) ( CLEAR ?auto_6185 ) ( not ( = ?auto_6184 ?auto_6191 ) ) ( not ( = ?auto_6185 ?auto_6191 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6187 ?auto_6185 ?auto_6191 ?auto_6190 )
      ( MAKE-1CRATE ?auto_6184 ?auto_6185 )
      ( MAKE-1CRATE-VERIFY ?auto_6184 ?auto_6185 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6192 - SURFACE
      ?auto_6193 - SURFACE
    )
    :vars
    (
      ?auto_6194 - HOIST
      ?auto_6195 - PLACE
      ?auto_6199 - PLACE
      ?auto_6197 - HOIST
      ?auto_6196 - SURFACE
      ?auto_6198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6194 ?auto_6195 ) ( SURFACE-AT ?auto_6192 ?auto_6195 ) ( CLEAR ?auto_6192 ) ( IS-CRATE ?auto_6193 ) ( not ( = ?auto_6192 ?auto_6193 ) ) ( AVAILABLE ?auto_6194 ) ( not ( = ?auto_6199 ?auto_6195 ) ) ( HOIST-AT ?auto_6197 ?auto_6199 ) ( not ( = ?auto_6194 ?auto_6197 ) ) ( AVAILABLE ?auto_6197 ) ( SURFACE-AT ?auto_6193 ?auto_6199 ) ( ON ?auto_6193 ?auto_6196 ) ( CLEAR ?auto_6193 ) ( not ( = ?auto_6192 ?auto_6196 ) ) ( not ( = ?auto_6193 ?auto_6196 ) ) ( TRUCK-AT ?auto_6198 ?auto_6195 ) )
    :subtasks
    ( ( !DRIVE ?auto_6198 ?auto_6195 ?auto_6199 )
      ( MAKE-1CRATE ?auto_6192 ?auto_6193 )
      ( MAKE-1CRATE-VERIFY ?auto_6192 ?auto_6193 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6209 - SURFACE
      ?auto_6210 - SURFACE
      ?auto_6211 - SURFACE
    )
    :vars
    (
      ?auto_6213 - HOIST
      ?auto_6212 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6213 ?auto_6212 ) ( SURFACE-AT ?auto_6210 ?auto_6212 ) ( CLEAR ?auto_6210 ) ( LIFTING ?auto_6213 ?auto_6211 ) ( IS-CRATE ?auto_6211 ) ( not ( = ?auto_6210 ?auto_6211 ) ) ( ON ?auto_6210 ?auto_6209 ) ( not ( = ?auto_6209 ?auto_6210 ) ) ( not ( = ?auto_6209 ?auto_6211 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6210 ?auto_6211 )
      ( MAKE-2CRATE-VERIFY ?auto_6209 ?auto_6210 ?auto_6211 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6219 - SURFACE
      ?auto_6220 - SURFACE
      ?auto_6221 - SURFACE
    )
    :vars
    (
      ?auto_6222 - HOIST
      ?auto_6223 - PLACE
      ?auto_6224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6222 ?auto_6223 ) ( SURFACE-AT ?auto_6220 ?auto_6223 ) ( CLEAR ?auto_6220 ) ( IS-CRATE ?auto_6221 ) ( not ( = ?auto_6220 ?auto_6221 ) ) ( TRUCK-AT ?auto_6224 ?auto_6223 ) ( AVAILABLE ?auto_6222 ) ( IN ?auto_6221 ?auto_6224 ) ( ON ?auto_6220 ?auto_6219 ) ( not ( = ?auto_6219 ?auto_6220 ) ) ( not ( = ?auto_6219 ?auto_6221 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6220 ?auto_6221 )
      ( MAKE-2CRATE-VERIFY ?auto_6219 ?auto_6220 ?auto_6221 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6225 - SURFACE
      ?auto_6226 - SURFACE
    )
    :vars
    (
      ?auto_6230 - HOIST
      ?auto_6228 - PLACE
      ?auto_6227 - TRUCK
      ?auto_6229 - SURFACE
      ?auto_6231 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6230 ?auto_6228 ) ( SURFACE-AT ?auto_6225 ?auto_6228 ) ( CLEAR ?auto_6225 ) ( IS-CRATE ?auto_6226 ) ( not ( = ?auto_6225 ?auto_6226 ) ) ( AVAILABLE ?auto_6230 ) ( IN ?auto_6226 ?auto_6227 ) ( ON ?auto_6225 ?auto_6229 ) ( not ( = ?auto_6229 ?auto_6225 ) ) ( not ( = ?auto_6229 ?auto_6226 ) ) ( TRUCK-AT ?auto_6227 ?auto_6231 ) ( not ( = ?auto_6231 ?auto_6228 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6227 ?auto_6231 ?auto_6228 )
      ( MAKE-2CRATE ?auto_6229 ?auto_6225 ?auto_6226 )
      ( MAKE-1CRATE-VERIFY ?auto_6225 ?auto_6226 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6232 - SURFACE
      ?auto_6233 - SURFACE
      ?auto_6234 - SURFACE
    )
    :vars
    (
      ?auto_6237 - HOIST
      ?auto_6236 - PLACE
      ?auto_6238 - TRUCK
      ?auto_6235 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6237 ?auto_6236 ) ( SURFACE-AT ?auto_6233 ?auto_6236 ) ( CLEAR ?auto_6233 ) ( IS-CRATE ?auto_6234 ) ( not ( = ?auto_6233 ?auto_6234 ) ) ( AVAILABLE ?auto_6237 ) ( IN ?auto_6234 ?auto_6238 ) ( ON ?auto_6233 ?auto_6232 ) ( not ( = ?auto_6232 ?auto_6233 ) ) ( not ( = ?auto_6232 ?auto_6234 ) ) ( TRUCK-AT ?auto_6238 ?auto_6235 ) ( not ( = ?auto_6235 ?auto_6236 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6233 ?auto_6234 )
      ( MAKE-2CRATE-VERIFY ?auto_6232 ?auto_6233 ?auto_6234 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6239 - SURFACE
      ?auto_6240 - SURFACE
    )
    :vars
    (
      ?auto_6245 - HOIST
      ?auto_6244 - PLACE
      ?auto_6243 - SURFACE
      ?auto_6241 - TRUCK
      ?auto_6242 - PLACE
      ?auto_6246 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6245 ?auto_6244 ) ( SURFACE-AT ?auto_6239 ?auto_6244 ) ( CLEAR ?auto_6239 ) ( IS-CRATE ?auto_6240 ) ( not ( = ?auto_6239 ?auto_6240 ) ) ( AVAILABLE ?auto_6245 ) ( ON ?auto_6239 ?auto_6243 ) ( not ( = ?auto_6243 ?auto_6239 ) ) ( not ( = ?auto_6243 ?auto_6240 ) ) ( TRUCK-AT ?auto_6241 ?auto_6242 ) ( not ( = ?auto_6242 ?auto_6244 ) ) ( HOIST-AT ?auto_6246 ?auto_6242 ) ( LIFTING ?auto_6246 ?auto_6240 ) ( not ( = ?auto_6245 ?auto_6246 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6246 ?auto_6240 ?auto_6241 ?auto_6242 )
      ( MAKE-2CRATE ?auto_6243 ?auto_6239 ?auto_6240 )
      ( MAKE-1CRATE-VERIFY ?auto_6239 ?auto_6240 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6247 - SURFACE
      ?auto_6248 - SURFACE
      ?auto_6249 - SURFACE
    )
    :vars
    (
      ?auto_6250 - HOIST
      ?auto_6254 - PLACE
      ?auto_6253 - TRUCK
      ?auto_6252 - PLACE
      ?auto_6251 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6250 ?auto_6254 ) ( SURFACE-AT ?auto_6248 ?auto_6254 ) ( CLEAR ?auto_6248 ) ( IS-CRATE ?auto_6249 ) ( not ( = ?auto_6248 ?auto_6249 ) ) ( AVAILABLE ?auto_6250 ) ( ON ?auto_6248 ?auto_6247 ) ( not ( = ?auto_6247 ?auto_6248 ) ) ( not ( = ?auto_6247 ?auto_6249 ) ) ( TRUCK-AT ?auto_6253 ?auto_6252 ) ( not ( = ?auto_6252 ?auto_6254 ) ) ( HOIST-AT ?auto_6251 ?auto_6252 ) ( LIFTING ?auto_6251 ?auto_6249 ) ( not ( = ?auto_6250 ?auto_6251 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6248 ?auto_6249 )
      ( MAKE-2CRATE-VERIFY ?auto_6247 ?auto_6248 ?auto_6249 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6255 - SURFACE
      ?auto_6256 - SURFACE
    )
    :vars
    (
      ?auto_6261 - HOIST
      ?auto_6257 - PLACE
      ?auto_6258 - SURFACE
      ?auto_6260 - TRUCK
      ?auto_6259 - PLACE
      ?auto_6262 - HOIST
      ?auto_6263 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6261 ?auto_6257 ) ( SURFACE-AT ?auto_6255 ?auto_6257 ) ( CLEAR ?auto_6255 ) ( IS-CRATE ?auto_6256 ) ( not ( = ?auto_6255 ?auto_6256 ) ) ( AVAILABLE ?auto_6261 ) ( ON ?auto_6255 ?auto_6258 ) ( not ( = ?auto_6258 ?auto_6255 ) ) ( not ( = ?auto_6258 ?auto_6256 ) ) ( TRUCK-AT ?auto_6260 ?auto_6259 ) ( not ( = ?auto_6259 ?auto_6257 ) ) ( HOIST-AT ?auto_6262 ?auto_6259 ) ( not ( = ?auto_6261 ?auto_6262 ) ) ( AVAILABLE ?auto_6262 ) ( SURFACE-AT ?auto_6256 ?auto_6259 ) ( ON ?auto_6256 ?auto_6263 ) ( CLEAR ?auto_6256 ) ( not ( = ?auto_6255 ?auto_6263 ) ) ( not ( = ?auto_6256 ?auto_6263 ) ) ( not ( = ?auto_6258 ?auto_6263 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6262 ?auto_6256 ?auto_6263 ?auto_6259 )
      ( MAKE-2CRATE ?auto_6258 ?auto_6255 ?auto_6256 )
      ( MAKE-1CRATE-VERIFY ?auto_6255 ?auto_6256 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6264 - SURFACE
      ?auto_6265 - SURFACE
      ?auto_6266 - SURFACE
    )
    :vars
    (
      ?auto_6269 - HOIST
      ?auto_6272 - PLACE
      ?auto_6271 - TRUCK
      ?auto_6267 - PLACE
      ?auto_6270 - HOIST
      ?auto_6268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6269 ?auto_6272 ) ( SURFACE-AT ?auto_6265 ?auto_6272 ) ( CLEAR ?auto_6265 ) ( IS-CRATE ?auto_6266 ) ( not ( = ?auto_6265 ?auto_6266 ) ) ( AVAILABLE ?auto_6269 ) ( ON ?auto_6265 ?auto_6264 ) ( not ( = ?auto_6264 ?auto_6265 ) ) ( not ( = ?auto_6264 ?auto_6266 ) ) ( TRUCK-AT ?auto_6271 ?auto_6267 ) ( not ( = ?auto_6267 ?auto_6272 ) ) ( HOIST-AT ?auto_6270 ?auto_6267 ) ( not ( = ?auto_6269 ?auto_6270 ) ) ( AVAILABLE ?auto_6270 ) ( SURFACE-AT ?auto_6266 ?auto_6267 ) ( ON ?auto_6266 ?auto_6268 ) ( CLEAR ?auto_6266 ) ( not ( = ?auto_6265 ?auto_6268 ) ) ( not ( = ?auto_6266 ?auto_6268 ) ) ( not ( = ?auto_6264 ?auto_6268 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6265 ?auto_6266 )
      ( MAKE-2CRATE-VERIFY ?auto_6264 ?auto_6265 ?auto_6266 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6273 - SURFACE
      ?auto_6274 - SURFACE
    )
    :vars
    (
      ?auto_6277 - HOIST
      ?auto_6280 - PLACE
      ?auto_6278 - SURFACE
      ?auto_6279 - PLACE
      ?auto_6276 - HOIST
      ?auto_6281 - SURFACE
      ?auto_6275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6277 ?auto_6280 ) ( SURFACE-AT ?auto_6273 ?auto_6280 ) ( CLEAR ?auto_6273 ) ( IS-CRATE ?auto_6274 ) ( not ( = ?auto_6273 ?auto_6274 ) ) ( AVAILABLE ?auto_6277 ) ( ON ?auto_6273 ?auto_6278 ) ( not ( = ?auto_6278 ?auto_6273 ) ) ( not ( = ?auto_6278 ?auto_6274 ) ) ( not ( = ?auto_6279 ?auto_6280 ) ) ( HOIST-AT ?auto_6276 ?auto_6279 ) ( not ( = ?auto_6277 ?auto_6276 ) ) ( AVAILABLE ?auto_6276 ) ( SURFACE-AT ?auto_6274 ?auto_6279 ) ( ON ?auto_6274 ?auto_6281 ) ( CLEAR ?auto_6274 ) ( not ( = ?auto_6273 ?auto_6281 ) ) ( not ( = ?auto_6274 ?auto_6281 ) ) ( not ( = ?auto_6278 ?auto_6281 ) ) ( TRUCK-AT ?auto_6275 ?auto_6280 ) )
    :subtasks
    ( ( !DRIVE ?auto_6275 ?auto_6280 ?auto_6279 )
      ( MAKE-2CRATE ?auto_6278 ?auto_6273 ?auto_6274 )
      ( MAKE-1CRATE-VERIFY ?auto_6273 ?auto_6274 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6282 - SURFACE
      ?auto_6283 - SURFACE
      ?auto_6284 - SURFACE
    )
    :vars
    (
      ?auto_6289 - HOIST
      ?auto_6290 - PLACE
      ?auto_6288 - PLACE
      ?auto_6285 - HOIST
      ?auto_6286 - SURFACE
      ?auto_6287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6289 ?auto_6290 ) ( SURFACE-AT ?auto_6283 ?auto_6290 ) ( CLEAR ?auto_6283 ) ( IS-CRATE ?auto_6284 ) ( not ( = ?auto_6283 ?auto_6284 ) ) ( AVAILABLE ?auto_6289 ) ( ON ?auto_6283 ?auto_6282 ) ( not ( = ?auto_6282 ?auto_6283 ) ) ( not ( = ?auto_6282 ?auto_6284 ) ) ( not ( = ?auto_6288 ?auto_6290 ) ) ( HOIST-AT ?auto_6285 ?auto_6288 ) ( not ( = ?auto_6289 ?auto_6285 ) ) ( AVAILABLE ?auto_6285 ) ( SURFACE-AT ?auto_6284 ?auto_6288 ) ( ON ?auto_6284 ?auto_6286 ) ( CLEAR ?auto_6284 ) ( not ( = ?auto_6283 ?auto_6286 ) ) ( not ( = ?auto_6284 ?auto_6286 ) ) ( not ( = ?auto_6282 ?auto_6286 ) ) ( TRUCK-AT ?auto_6287 ?auto_6290 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6283 ?auto_6284 )
      ( MAKE-2CRATE-VERIFY ?auto_6282 ?auto_6283 ?auto_6284 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6291 - SURFACE
      ?auto_6292 - SURFACE
    )
    :vars
    (
      ?auto_6296 - HOIST
      ?auto_6295 - PLACE
      ?auto_6299 - SURFACE
      ?auto_6298 - PLACE
      ?auto_6293 - HOIST
      ?auto_6297 - SURFACE
      ?auto_6294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6296 ?auto_6295 ) ( IS-CRATE ?auto_6292 ) ( not ( = ?auto_6291 ?auto_6292 ) ) ( not ( = ?auto_6299 ?auto_6291 ) ) ( not ( = ?auto_6299 ?auto_6292 ) ) ( not ( = ?auto_6298 ?auto_6295 ) ) ( HOIST-AT ?auto_6293 ?auto_6298 ) ( not ( = ?auto_6296 ?auto_6293 ) ) ( AVAILABLE ?auto_6293 ) ( SURFACE-AT ?auto_6292 ?auto_6298 ) ( ON ?auto_6292 ?auto_6297 ) ( CLEAR ?auto_6292 ) ( not ( = ?auto_6291 ?auto_6297 ) ) ( not ( = ?auto_6292 ?auto_6297 ) ) ( not ( = ?auto_6299 ?auto_6297 ) ) ( TRUCK-AT ?auto_6294 ?auto_6295 ) ( SURFACE-AT ?auto_6299 ?auto_6295 ) ( CLEAR ?auto_6299 ) ( LIFTING ?auto_6296 ?auto_6291 ) ( IS-CRATE ?auto_6291 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6299 ?auto_6291 )
      ( MAKE-2CRATE ?auto_6299 ?auto_6291 ?auto_6292 )
      ( MAKE-1CRATE-VERIFY ?auto_6291 ?auto_6292 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6300 - SURFACE
      ?auto_6301 - SURFACE
      ?auto_6302 - SURFACE
    )
    :vars
    (
      ?auto_6307 - HOIST
      ?auto_6306 - PLACE
      ?auto_6308 - PLACE
      ?auto_6305 - HOIST
      ?auto_6304 - SURFACE
      ?auto_6303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6307 ?auto_6306 ) ( IS-CRATE ?auto_6302 ) ( not ( = ?auto_6301 ?auto_6302 ) ) ( not ( = ?auto_6300 ?auto_6301 ) ) ( not ( = ?auto_6300 ?auto_6302 ) ) ( not ( = ?auto_6308 ?auto_6306 ) ) ( HOIST-AT ?auto_6305 ?auto_6308 ) ( not ( = ?auto_6307 ?auto_6305 ) ) ( AVAILABLE ?auto_6305 ) ( SURFACE-AT ?auto_6302 ?auto_6308 ) ( ON ?auto_6302 ?auto_6304 ) ( CLEAR ?auto_6302 ) ( not ( = ?auto_6301 ?auto_6304 ) ) ( not ( = ?auto_6302 ?auto_6304 ) ) ( not ( = ?auto_6300 ?auto_6304 ) ) ( TRUCK-AT ?auto_6303 ?auto_6306 ) ( SURFACE-AT ?auto_6300 ?auto_6306 ) ( CLEAR ?auto_6300 ) ( LIFTING ?auto_6307 ?auto_6301 ) ( IS-CRATE ?auto_6301 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6301 ?auto_6302 )
      ( MAKE-2CRATE-VERIFY ?auto_6300 ?auto_6301 ?auto_6302 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6309 - SURFACE
      ?auto_6310 - SURFACE
    )
    :vars
    (
      ?auto_6313 - HOIST
      ?auto_6314 - PLACE
      ?auto_6315 - SURFACE
      ?auto_6317 - PLACE
      ?auto_6311 - HOIST
      ?auto_6312 - SURFACE
      ?auto_6316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6313 ?auto_6314 ) ( IS-CRATE ?auto_6310 ) ( not ( = ?auto_6309 ?auto_6310 ) ) ( not ( = ?auto_6315 ?auto_6309 ) ) ( not ( = ?auto_6315 ?auto_6310 ) ) ( not ( = ?auto_6317 ?auto_6314 ) ) ( HOIST-AT ?auto_6311 ?auto_6317 ) ( not ( = ?auto_6313 ?auto_6311 ) ) ( AVAILABLE ?auto_6311 ) ( SURFACE-AT ?auto_6310 ?auto_6317 ) ( ON ?auto_6310 ?auto_6312 ) ( CLEAR ?auto_6310 ) ( not ( = ?auto_6309 ?auto_6312 ) ) ( not ( = ?auto_6310 ?auto_6312 ) ) ( not ( = ?auto_6315 ?auto_6312 ) ) ( TRUCK-AT ?auto_6316 ?auto_6314 ) ( SURFACE-AT ?auto_6315 ?auto_6314 ) ( CLEAR ?auto_6315 ) ( IS-CRATE ?auto_6309 ) ( AVAILABLE ?auto_6313 ) ( IN ?auto_6309 ?auto_6316 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6313 ?auto_6309 ?auto_6316 ?auto_6314 )
      ( MAKE-2CRATE ?auto_6315 ?auto_6309 ?auto_6310 )
      ( MAKE-1CRATE-VERIFY ?auto_6309 ?auto_6310 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6318 - SURFACE
      ?auto_6319 - SURFACE
      ?auto_6320 - SURFACE
    )
    :vars
    (
      ?auto_6324 - HOIST
      ?auto_6323 - PLACE
      ?auto_6322 - PLACE
      ?auto_6321 - HOIST
      ?auto_6326 - SURFACE
      ?auto_6325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6324 ?auto_6323 ) ( IS-CRATE ?auto_6320 ) ( not ( = ?auto_6319 ?auto_6320 ) ) ( not ( = ?auto_6318 ?auto_6319 ) ) ( not ( = ?auto_6318 ?auto_6320 ) ) ( not ( = ?auto_6322 ?auto_6323 ) ) ( HOIST-AT ?auto_6321 ?auto_6322 ) ( not ( = ?auto_6324 ?auto_6321 ) ) ( AVAILABLE ?auto_6321 ) ( SURFACE-AT ?auto_6320 ?auto_6322 ) ( ON ?auto_6320 ?auto_6326 ) ( CLEAR ?auto_6320 ) ( not ( = ?auto_6319 ?auto_6326 ) ) ( not ( = ?auto_6320 ?auto_6326 ) ) ( not ( = ?auto_6318 ?auto_6326 ) ) ( TRUCK-AT ?auto_6325 ?auto_6323 ) ( SURFACE-AT ?auto_6318 ?auto_6323 ) ( CLEAR ?auto_6318 ) ( IS-CRATE ?auto_6319 ) ( AVAILABLE ?auto_6324 ) ( IN ?auto_6319 ?auto_6325 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6319 ?auto_6320 )
      ( MAKE-2CRATE-VERIFY ?auto_6318 ?auto_6319 ?auto_6320 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6363 - SURFACE
      ?auto_6364 - SURFACE
    )
    :vars
    (
      ?auto_6366 - HOIST
      ?auto_6365 - PLACE
      ?auto_6367 - SURFACE
      ?auto_6368 - PLACE
      ?auto_6371 - HOIST
      ?auto_6370 - SURFACE
      ?auto_6369 - TRUCK
      ?auto_6372 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6366 ?auto_6365 ) ( SURFACE-AT ?auto_6363 ?auto_6365 ) ( CLEAR ?auto_6363 ) ( IS-CRATE ?auto_6364 ) ( not ( = ?auto_6363 ?auto_6364 ) ) ( AVAILABLE ?auto_6366 ) ( ON ?auto_6363 ?auto_6367 ) ( not ( = ?auto_6367 ?auto_6363 ) ) ( not ( = ?auto_6367 ?auto_6364 ) ) ( not ( = ?auto_6368 ?auto_6365 ) ) ( HOIST-AT ?auto_6371 ?auto_6368 ) ( not ( = ?auto_6366 ?auto_6371 ) ) ( AVAILABLE ?auto_6371 ) ( SURFACE-AT ?auto_6364 ?auto_6368 ) ( ON ?auto_6364 ?auto_6370 ) ( CLEAR ?auto_6364 ) ( not ( = ?auto_6363 ?auto_6370 ) ) ( not ( = ?auto_6364 ?auto_6370 ) ) ( not ( = ?auto_6367 ?auto_6370 ) ) ( TRUCK-AT ?auto_6369 ?auto_6372 ) ( not ( = ?auto_6372 ?auto_6365 ) ) ( not ( = ?auto_6368 ?auto_6372 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6369 ?auto_6372 ?auto_6365 )
      ( MAKE-1CRATE ?auto_6363 ?auto_6364 )
      ( MAKE-1CRATE-VERIFY ?auto_6363 ?auto_6364 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6402 - SURFACE
      ?auto_6403 - SURFACE
      ?auto_6404 - SURFACE
      ?auto_6405 - SURFACE
    )
    :vars
    (
      ?auto_6407 - HOIST
      ?auto_6406 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6407 ?auto_6406 ) ( SURFACE-AT ?auto_6404 ?auto_6406 ) ( CLEAR ?auto_6404 ) ( LIFTING ?auto_6407 ?auto_6405 ) ( IS-CRATE ?auto_6405 ) ( not ( = ?auto_6404 ?auto_6405 ) ) ( ON ?auto_6403 ?auto_6402 ) ( ON ?auto_6404 ?auto_6403 ) ( not ( = ?auto_6402 ?auto_6403 ) ) ( not ( = ?auto_6402 ?auto_6404 ) ) ( not ( = ?auto_6402 ?auto_6405 ) ) ( not ( = ?auto_6403 ?auto_6404 ) ) ( not ( = ?auto_6403 ?auto_6405 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6404 ?auto_6405 )
      ( MAKE-3CRATE-VERIFY ?auto_6402 ?auto_6403 ?auto_6404 ?auto_6405 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6419 - SURFACE
      ?auto_6420 - SURFACE
      ?auto_6421 - SURFACE
      ?auto_6422 - SURFACE
    )
    :vars
    (
      ?auto_6424 - HOIST
      ?auto_6423 - PLACE
      ?auto_6425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6424 ?auto_6423 ) ( SURFACE-AT ?auto_6421 ?auto_6423 ) ( CLEAR ?auto_6421 ) ( IS-CRATE ?auto_6422 ) ( not ( = ?auto_6421 ?auto_6422 ) ) ( TRUCK-AT ?auto_6425 ?auto_6423 ) ( AVAILABLE ?auto_6424 ) ( IN ?auto_6422 ?auto_6425 ) ( ON ?auto_6421 ?auto_6420 ) ( not ( = ?auto_6420 ?auto_6421 ) ) ( not ( = ?auto_6420 ?auto_6422 ) ) ( ON ?auto_6420 ?auto_6419 ) ( not ( = ?auto_6419 ?auto_6420 ) ) ( not ( = ?auto_6419 ?auto_6421 ) ) ( not ( = ?auto_6419 ?auto_6422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6420 ?auto_6421 ?auto_6422 )
      ( MAKE-3CRATE-VERIFY ?auto_6419 ?auto_6420 ?auto_6421 ?auto_6422 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6440 - SURFACE
      ?auto_6441 - SURFACE
      ?auto_6442 - SURFACE
      ?auto_6443 - SURFACE
    )
    :vars
    (
      ?auto_6444 - HOIST
      ?auto_6446 - PLACE
      ?auto_6445 - TRUCK
      ?auto_6447 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6444 ?auto_6446 ) ( SURFACE-AT ?auto_6442 ?auto_6446 ) ( CLEAR ?auto_6442 ) ( IS-CRATE ?auto_6443 ) ( not ( = ?auto_6442 ?auto_6443 ) ) ( AVAILABLE ?auto_6444 ) ( IN ?auto_6443 ?auto_6445 ) ( ON ?auto_6442 ?auto_6441 ) ( not ( = ?auto_6441 ?auto_6442 ) ) ( not ( = ?auto_6441 ?auto_6443 ) ) ( TRUCK-AT ?auto_6445 ?auto_6447 ) ( not ( = ?auto_6447 ?auto_6446 ) ) ( ON ?auto_6441 ?auto_6440 ) ( not ( = ?auto_6440 ?auto_6441 ) ) ( not ( = ?auto_6440 ?auto_6442 ) ) ( not ( = ?auto_6440 ?auto_6443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6441 ?auto_6442 ?auto_6443 )
      ( MAKE-3CRATE-VERIFY ?auto_6440 ?auto_6441 ?auto_6442 ?auto_6443 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6464 - SURFACE
      ?auto_6465 - SURFACE
      ?auto_6466 - SURFACE
      ?auto_6467 - SURFACE
    )
    :vars
    (
      ?auto_6469 - HOIST
      ?auto_6468 - PLACE
      ?auto_6470 - TRUCK
      ?auto_6471 - PLACE
      ?auto_6472 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6469 ?auto_6468 ) ( SURFACE-AT ?auto_6466 ?auto_6468 ) ( CLEAR ?auto_6466 ) ( IS-CRATE ?auto_6467 ) ( not ( = ?auto_6466 ?auto_6467 ) ) ( AVAILABLE ?auto_6469 ) ( ON ?auto_6466 ?auto_6465 ) ( not ( = ?auto_6465 ?auto_6466 ) ) ( not ( = ?auto_6465 ?auto_6467 ) ) ( TRUCK-AT ?auto_6470 ?auto_6471 ) ( not ( = ?auto_6471 ?auto_6468 ) ) ( HOIST-AT ?auto_6472 ?auto_6471 ) ( LIFTING ?auto_6472 ?auto_6467 ) ( not ( = ?auto_6469 ?auto_6472 ) ) ( ON ?auto_6465 ?auto_6464 ) ( not ( = ?auto_6464 ?auto_6465 ) ) ( not ( = ?auto_6464 ?auto_6466 ) ) ( not ( = ?auto_6464 ?auto_6467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6465 ?auto_6466 ?auto_6467 )
      ( MAKE-3CRATE-VERIFY ?auto_6464 ?auto_6465 ?auto_6466 ?auto_6467 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6491 - SURFACE
      ?auto_6492 - SURFACE
      ?auto_6493 - SURFACE
      ?auto_6494 - SURFACE
    )
    :vars
    (
      ?auto_6500 - HOIST
      ?auto_6497 - PLACE
      ?auto_6499 - TRUCK
      ?auto_6495 - PLACE
      ?auto_6498 - HOIST
      ?auto_6496 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6500 ?auto_6497 ) ( SURFACE-AT ?auto_6493 ?auto_6497 ) ( CLEAR ?auto_6493 ) ( IS-CRATE ?auto_6494 ) ( not ( = ?auto_6493 ?auto_6494 ) ) ( AVAILABLE ?auto_6500 ) ( ON ?auto_6493 ?auto_6492 ) ( not ( = ?auto_6492 ?auto_6493 ) ) ( not ( = ?auto_6492 ?auto_6494 ) ) ( TRUCK-AT ?auto_6499 ?auto_6495 ) ( not ( = ?auto_6495 ?auto_6497 ) ) ( HOIST-AT ?auto_6498 ?auto_6495 ) ( not ( = ?auto_6500 ?auto_6498 ) ) ( AVAILABLE ?auto_6498 ) ( SURFACE-AT ?auto_6494 ?auto_6495 ) ( ON ?auto_6494 ?auto_6496 ) ( CLEAR ?auto_6494 ) ( not ( = ?auto_6493 ?auto_6496 ) ) ( not ( = ?auto_6494 ?auto_6496 ) ) ( not ( = ?auto_6492 ?auto_6496 ) ) ( ON ?auto_6492 ?auto_6491 ) ( not ( = ?auto_6491 ?auto_6492 ) ) ( not ( = ?auto_6491 ?auto_6493 ) ) ( not ( = ?auto_6491 ?auto_6494 ) ) ( not ( = ?auto_6491 ?auto_6496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6492 ?auto_6493 ?auto_6494 )
      ( MAKE-3CRATE-VERIFY ?auto_6491 ?auto_6492 ?auto_6493 ?auto_6494 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6519 - SURFACE
      ?auto_6520 - SURFACE
      ?auto_6521 - SURFACE
      ?auto_6522 - SURFACE
    )
    :vars
    (
      ?auto_6528 - HOIST
      ?auto_6526 - PLACE
      ?auto_6525 - PLACE
      ?auto_6524 - HOIST
      ?auto_6523 - SURFACE
      ?auto_6527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6528 ?auto_6526 ) ( SURFACE-AT ?auto_6521 ?auto_6526 ) ( CLEAR ?auto_6521 ) ( IS-CRATE ?auto_6522 ) ( not ( = ?auto_6521 ?auto_6522 ) ) ( AVAILABLE ?auto_6528 ) ( ON ?auto_6521 ?auto_6520 ) ( not ( = ?auto_6520 ?auto_6521 ) ) ( not ( = ?auto_6520 ?auto_6522 ) ) ( not ( = ?auto_6525 ?auto_6526 ) ) ( HOIST-AT ?auto_6524 ?auto_6525 ) ( not ( = ?auto_6528 ?auto_6524 ) ) ( AVAILABLE ?auto_6524 ) ( SURFACE-AT ?auto_6522 ?auto_6525 ) ( ON ?auto_6522 ?auto_6523 ) ( CLEAR ?auto_6522 ) ( not ( = ?auto_6521 ?auto_6523 ) ) ( not ( = ?auto_6522 ?auto_6523 ) ) ( not ( = ?auto_6520 ?auto_6523 ) ) ( TRUCK-AT ?auto_6527 ?auto_6526 ) ( ON ?auto_6520 ?auto_6519 ) ( not ( = ?auto_6519 ?auto_6520 ) ) ( not ( = ?auto_6519 ?auto_6521 ) ) ( not ( = ?auto_6519 ?auto_6522 ) ) ( not ( = ?auto_6519 ?auto_6523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6520 ?auto_6521 ?auto_6522 )
      ( MAKE-3CRATE-VERIFY ?auto_6519 ?auto_6520 ?auto_6521 ?auto_6522 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6547 - SURFACE
      ?auto_6548 - SURFACE
      ?auto_6549 - SURFACE
      ?auto_6550 - SURFACE
    )
    :vars
    (
      ?auto_6551 - HOIST
      ?auto_6554 - PLACE
      ?auto_6553 - PLACE
      ?auto_6552 - HOIST
      ?auto_6555 - SURFACE
      ?auto_6556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6551 ?auto_6554 ) ( IS-CRATE ?auto_6550 ) ( not ( = ?auto_6549 ?auto_6550 ) ) ( not ( = ?auto_6548 ?auto_6549 ) ) ( not ( = ?auto_6548 ?auto_6550 ) ) ( not ( = ?auto_6553 ?auto_6554 ) ) ( HOIST-AT ?auto_6552 ?auto_6553 ) ( not ( = ?auto_6551 ?auto_6552 ) ) ( AVAILABLE ?auto_6552 ) ( SURFACE-AT ?auto_6550 ?auto_6553 ) ( ON ?auto_6550 ?auto_6555 ) ( CLEAR ?auto_6550 ) ( not ( = ?auto_6549 ?auto_6555 ) ) ( not ( = ?auto_6550 ?auto_6555 ) ) ( not ( = ?auto_6548 ?auto_6555 ) ) ( TRUCK-AT ?auto_6556 ?auto_6554 ) ( SURFACE-AT ?auto_6548 ?auto_6554 ) ( CLEAR ?auto_6548 ) ( LIFTING ?auto_6551 ?auto_6549 ) ( IS-CRATE ?auto_6549 ) ( ON ?auto_6548 ?auto_6547 ) ( not ( = ?auto_6547 ?auto_6548 ) ) ( not ( = ?auto_6547 ?auto_6549 ) ) ( not ( = ?auto_6547 ?auto_6550 ) ) ( not ( = ?auto_6547 ?auto_6555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6548 ?auto_6549 ?auto_6550 )
      ( MAKE-3CRATE-VERIFY ?auto_6547 ?auto_6548 ?auto_6549 ?auto_6550 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6575 - SURFACE
      ?auto_6576 - SURFACE
      ?auto_6577 - SURFACE
      ?auto_6578 - SURFACE
    )
    :vars
    (
      ?auto_6581 - HOIST
      ?auto_6579 - PLACE
      ?auto_6583 - PLACE
      ?auto_6582 - HOIST
      ?auto_6580 - SURFACE
      ?auto_6584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6581 ?auto_6579 ) ( IS-CRATE ?auto_6578 ) ( not ( = ?auto_6577 ?auto_6578 ) ) ( not ( = ?auto_6576 ?auto_6577 ) ) ( not ( = ?auto_6576 ?auto_6578 ) ) ( not ( = ?auto_6583 ?auto_6579 ) ) ( HOIST-AT ?auto_6582 ?auto_6583 ) ( not ( = ?auto_6581 ?auto_6582 ) ) ( AVAILABLE ?auto_6582 ) ( SURFACE-AT ?auto_6578 ?auto_6583 ) ( ON ?auto_6578 ?auto_6580 ) ( CLEAR ?auto_6578 ) ( not ( = ?auto_6577 ?auto_6580 ) ) ( not ( = ?auto_6578 ?auto_6580 ) ) ( not ( = ?auto_6576 ?auto_6580 ) ) ( TRUCK-AT ?auto_6584 ?auto_6579 ) ( SURFACE-AT ?auto_6576 ?auto_6579 ) ( CLEAR ?auto_6576 ) ( IS-CRATE ?auto_6577 ) ( AVAILABLE ?auto_6581 ) ( IN ?auto_6577 ?auto_6584 ) ( ON ?auto_6576 ?auto_6575 ) ( not ( = ?auto_6575 ?auto_6576 ) ) ( not ( = ?auto_6575 ?auto_6577 ) ) ( not ( = ?auto_6575 ?auto_6578 ) ) ( not ( = ?auto_6575 ?auto_6580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6576 ?auto_6577 ?auto_6578 )
      ( MAKE-3CRATE-VERIFY ?auto_6575 ?auto_6576 ?auto_6577 ?auto_6578 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6585 - SURFACE
      ?auto_6586 - SURFACE
    )
    :vars
    (
      ?auto_6589 - HOIST
      ?auto_6587 - PLACE
      ?auto_6592 - SURFACE
      ?auto_6591 - PLACE
      ?auto_6590 - HOIST
      ?auto_6588 - SURFACE
      ?auto_6593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6589 ?auto_6587 ) ( IS-CRATE ?auto_6586 ) ( not ( = ?auto_6585 ?auto_6586 ) ) ( not ( = ?auto_6592 ?auto_6585 ) ) ( not ( = ?auto_6592 ?auto_6586 ) ) ( not ( = ?auto_6591 ?auto_6587 ) ) ( HOIST-AT ?auto_6590 ?auto_6591 ) ( not ( = ?auto_6589 ?auto_6590 ) ) ( AVAILABLE ?auto_6590 ) ( SURFACE-AT ?auto_6586 ?auto_6591 ) ( ON ?auto_6586 ?auto_6588 ) ( CLEAR ?auto_6586 ) ( not ( = ?auto_6585 ?auto_6588 ) ) ( not ( = ?auto_6586 ?auto_6588 ) ) ( not ( = ?auto_6592 ?auto_6588 ) ) ( SURFACE-AT ?auto_6592 ?auto_6587 ) ( CLEAR ?auto_6592 ) ( IS-CRATE ?auto_6585 ) ( AVAILABLE ?auto_6589 ) ( IN ?auto_6585 ?auto_6593 ) ( TRUCK-AT ?auto_6593 ?auto_6591 ) )
    :subtasks
    ( ( !DRIVE ?auto_6593 ?auto_6591 ?auto_6587 )
      ( MAKE-2CRATE ?auto_6592 ?auto_6585 ?auto_6586 )
      ( MAKE-1CRATE-VERIFY ?auto_6585 ?auto_6586 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6594 - SURFACE
      ?auto_6595 - SURFACE
      ?auto_6596 - SURFACE
    )
    :vars
    (
      ?auto_6598 - HOIST
      ?auto_6599 - PLACE
      ?auto_6602 - PLACE
      ?auto_6601 - HOIST
      ?auto_6597 - SURFACE
      ?auto_6600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6598 ?auto_6599 ) ( IS-CRATE ?auto_6596 ) ( not ( = ?auto_6595 ?auto_6596 ) ) ( not ( = ?auto_6594 ?auto_6595 ) ) ( not ( = ?auto_6594 ?auto_6596 ) ) ( not ( = ?auto_6602 ?auto_6599 ) ) ( HOIST-AT ?auto_6601 ?auto_6602 ) ( not ( = ?auto_6598 ?auto_6601 ) ) ( AVAILABLE ?auto_6601 ) ( SURFACE-AT ?auto_6596 ?auto_6602 ) ( ON ?auto_6596 ?auto_6597 ) ( CLEAR ?auto_6596 ) ( not ( = ?auto_6595 ?auto_6597 ) ) ( not ( = ?auto_6596 ?auto_6597 ) ) ( not ( = ?auto_6594 ?auto_6597 ) ) ( SURFACE-AT ?auto_6594 ?auto_6599 ) ( CLEAR ?auto_6594 ) ( IS-CRATE ?auto_6595 ) ( AVAILABLE ?auto_6598 ) ( IN ?auto_6595 ?auto_6600 ) ( TRUCK-AT ?auto_6600 ?auto_6602 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6595 ?auto_6596 )
      ( MAKE-2CRATE-VERIFY ?auto_6594 ?auto_6595 ?auto_6596 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6603 - SURFACE
      ?auto_6604 - SURFACE
      ?auto_6605 - SURFACE
      ?auto_6606 - SURFACE
    )
    :vars
    (
      ?auto_6607 - HOIST
      ?auto_6611 - PLACE
      ?auto_6610 - PLACE
      ?auto_6608 - HOIST
      ?auto_6612 - SURFACE
      ?auto_6609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6607 ?auto_6611 ) ( IS-CRATE ?auto_6606 ) ( not ( = ?auto_6605 ?auto_6606 ) ) ( not ( = ?auto_6604 ?auto_6605 ) ) ( not ( = ?auto_6604 ?auto_6606 ) ) ( not ( = ?auto_6610 ?auto_6611 ) ) ( HOIST-AT ?auto_6608 ?auto_6610 ) ( not ( = ?auto_6607 ?auto_6608 ) ) ( AVAILABLE ?auto_6608 ) ( SURFACE-AT ?auto_6606 ?auto_6610 ) ( ON ?auto_6606 ?auto_6612 ) ( CLEAR ?auto_6606 ) ( not ( = ?auto_6605 ?auto_6612 ) ) ( not ( = ?auto_6606 ?auto_6612 ) ) ( not ( = ?auto_6604 ?auto_6612 ) ) ( SURFACE-AT ?auto_6604 ?auto_6611 ) ( CLEAR ?auto_6604 ) ( IS-CRATE ?auto_6605 ) ( AVAILABLE ?auto_6607 ) ( IN ?auto_6605 ?auto_6609 ) ( TRUCK-AT ?auto_6609 ?auto_6610 ) ( ON ?auto_6604 ?auto_6603 ) ( not ( = ?auto_6603 ?auto_6604 ) ) ( not ( = ?auto_6603 ?auto_6605 ) ) ( not ( = ?auto_6603 ?auto_6606 ) ) ( not ( = ?auto_6603 ?auto_6612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6604 ?auto_6605 ?auto_6606 )
      ( MAKE-3CRATE-VERIFY ?auto_6603 ?auto_6604 ?auto_6605 ?auto_6606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6613 - SURFACE
      ?auto_6614 - SURFACE
    )
    :vars
    (
      ?auto_6615 - HOIST
      ?auto_6620 - PLACE
      ?auto_6619 - SURFACE
      ?auto_6618 - PLACE
      ?auto_6616 - HOIST
      ?auto_6621 - SURFACE
      ?auto_6617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6615 ?auto_6620 ) ( IS-CRATE ?auto_6614 ) ( not ( = ?auto_6613 ?auto_6614 ) ) ( not ( = ?auto_6619 ?auto_6613 ) ) ( not ( = ?auto_6619 ?auto_6614 ) ) ( not ( = ?auto_6618 ?auto_6620 ) ) ( HOIST-AT ?auto_6616 ?auto_6618 ) ( not ( = ?auto_6615 ?auto_6616 ) ) ( SURFACE-AT ?auto_6614 ?auto_6618 ) ( ON ?auto_6614 ?auto_6621 ) ( CLEAR ?auto_6614 ) ( not ( = ?auto_6613 ?auto_6621 ) ) ( not ( = ?auto_6614 ?auto_6621 ) ) ( not ( = ?auto_6619 ?auto_6621 ) ) ( SURFACE-AT ?auto_6619 ?auto_6620 ) ( CLEAR ?auto_6619 ) ( IS-CRATE ?auto_6613 ) ( AVAILABLE ?auto_6615 ) ( TRUCK-AT ?auto_6617 ?auto_6618 ) ( LIFTING ?auto_6616 ?auto_6613 ) )
    :subtasks
    ( ( !LOAD ?auto_6616 ?auto_6613 ?auto_6617 ?auto_6618 )
      ( MAKE-2CRATE ?auto_6619 ?auto_6613 ?auto_6614 )
      ( MAKE-1CRATE-VERIFY ?auto_6613 ?auto_6614 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6622 - SURFACE
      ?auto_6623 - SURFACE
      ?auto_6624 - SURFACE
    )
    :vars
    (
      ?auto_6629 - HOIST
      ?auto_6628 - PLACE
      ?auto_6625 - PLACE
      ?auto_6630 - HOIST
      ?auto_6626 - SURFACE
      ?auto_6627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6629 ?auto_6628 ) ( IS-CRATE ?auto_6624 ) ( not ( = ?auto_6623 ?auto_6624 ) ) ( not ( = ?auto_6622 ?auto_6623 ) ) ( not ( = ?auto_6622 ?auto_6624 ) ) ( not ( = ?auto_6625 ?auto_6628 ) ) ( HOIST-AT ?auto_6630 ?auto_6625 ) ( not ( = ?auto_6629 ?auto_6630 ) ) ( SURFACE-AT ?auto_6624 ?auto_6625 ) ( ON ?auto_6624 ?auto_6626 ) ( CLEAR ?auto_6624 ) ( not ( = ?auto_6623 ?auto_6626 ) ) ( not ( = ?auto_6624 ?auto_6626 ) ) ( not ( = ?auto_6622 ?auto_6626 ) ) ( SURFACE-AT ?auto_6622 ?auto_6628 ) ( CLEAR ?auto_6622 ) ( IS-CRATE ?auto_6623 ) ( AVAILABLE ?auto_6629 ) ( TRUCK-AT ?auto_6627 ?auto_6625 ) ( LIFTING ?auto_6630 ?auto_6623 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6623 ?auto_6624 )
      ( MAKE-2CRATE-VERIFY ?auto_6622 ?auto_6623 ?auto_6624 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6631 - SURFACE
      ?auto_6632 - SURFACE
      ?auto_6633 - SURFACE
      ?auto_6634 - SURFACE
    )
    :vars
    (
      ?auto_6639 - HOIST
      ?auto_6640 - PLACE
      ?auto_6637 - PLACE
      ?auto_6635 - HOIST
      ?auto_6638 - SURFACE
      ?auto_6636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6639 ?auto_6640 ) ( IS-CRATE ?auto_6634 ) ( not ( = ?auto_6633 ?auto_6634 ) ) ( not ( = ?auto_6632 ?auto_6633 ) ) ( not ( = ?auto_6632 ?auto_6634 ) ) ( not ( = ?auto_6637 ?auto_6640 ) ) ( HOIST-AT ?auto_6635 ?auto_6637 ) ( not ( = ?auto_6639 ?auto_6635 ) ) ( SURFACE-AT ?auto_6634 ?auto_6637 ) ( ON ?auto_6634 ?auto_6638 ) ( CLEAR ?auto_6634 ) ( not ( = ?auto_6633 ?auto_6638 ) ) ( not ( = ?auto_6634 ?auto_6638 ) ) ( not ( = ?auto_6632 ?auto_6638 ) ) ( SURFACE-AT ?auto_6632 ?auto_6640 ) ( CLEAR ?auto_6632 ) ( IS-CRATE ?auto_6633 ) ( AVAILABLE ?auto_6639 ) ( TRUCK-AT ?auto_6636 ?auto_6637 ) ( LIFTING ?auto_6635 ?auto_6633 ) ( ON ?auto_6632 ?auto_6631 ) ( not ( = ?auto_6631 ?auto_6632 ) ) ( not ( = ?auto_6631 ?auto_6633 ) ) ( not ( = ?auto_6631 ?auto_6634 ) ) ( not ( = ?auto_6631 ?auto_6638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6632 ?auto_6633 ?auto_6634 )
      ( MAKE-3CRATE-VERIFY ?auto_6631 ?auto_6632 ?auto_6633 ?auto_6634 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6641 - SURFACE
      ?auto_6642 - SURFACE
    )
    :vars
    (
      ?auto_6647 - HOIST
      ?auto_6649 - PLACE
      ?auto_6648 - SURFACE
      ?auto_6645 - PLACE
      ?auto_6643 - HOIST
      ?auto_6646 - SURFACE
      ?auto_6644 - TRUCK
      ?auto_6650 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6647 ?auto_6649 ) ( IS-CRATE ?auto_6642 ) ( not ( = ?auto_6641 ?auto_6642 ) ) ( not ( = ?auto_6648 ?auto_6641 ) ) ( not ( = ?auto_6648 ?auto_6642 ) ) ( not ( = ?auto_6645 ?auto_6649 ) ) ( HOIST-AT ?auto_6643 ?auto_6645 ) ( not ( = ?auto_6647 ?auto_6643 ) ) ( SURFACE-AT ?auto_6642 ?auto_6645 ) ( ON ?auto_6642 ?auto_6646 ) ( CLEAR ?auto_6642 ) ( not ( = ?auto_6641 ?auto_6646 ) ) ( not ( = ?auto_6642 ?auto_6646 ) ) ( not ( = ?auto_6648 ?auto_6646 ) ) ( SURFACE-AT ?auto_6648 ?auto_6649 ) ( CLEAR ?auto_6648 ) ( IS-CRATE ?auto_6641 ) ( AVAILABLE ?auto_6647 ) ( TRUCK-AT ?auto_6644 ?auto_6645 ) ( AVAILABLE ?auto_6643 ) ( SURFACE-AT ?auto_6641 ?auto_6645 ) ( ON ?auto_6641 ?auto_6650 ) ( CLEAR ?auto_6641 ) ( not ( = ?auto_6641 ?auto_6650 ) ) ( not ( = ?auto_6642 ?auto_6650 ) ) ( not ( = ?auto_6648 ?auto_6650 ) ) ( not ( = ?auto_6646 ?auto_6650 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6643 ?auto_6641 ?auto_6650 ?auto_6645 )
      ( MAKE-2CRATE ?auto_6648 ?auto_6641 ?auto_6642 )
      ( MAKE-1CRATE-VERIFY ?auto_6641 ?auto_6642 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6651 - SURFACE
      ?auto_6652 - SURFACE
      ?auto_6653 - SURFACE
    )
    :vars
    (
      ?auto_6659 - HOIST
      ?auto_6657 - PLACE
      ?auto_6655 - PLACE
      ?auto_6658 - HOIST
      ?auto_6660 - SURFACE
      ?auto_6656 - TRUCK
      ?auto_6654 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6659 ?auto_6657 ) ( IS-CRATE ?auto_6653 ) ( not ( = ?auto_6652 ?auto_6653 ) ) ( not ( = ?auto_6651 ?auto_6652 ) ) ( not ( = ?auto_6651 ?auto_6653 ) ) ( not ( = ?auto_6655 ?auto_6657 ) ) ( HOIST-AT ?auto_6658 ?auto_6655 ) ( not ( = ?auto_6659 ?auto_6658 ) ) ( SURFACE-AT ?auto_6653 ?auto_6655 ) ( ON ?auto_6653 ?auto_6660 ) ( CLEAR ?auto_6653 ) ( not ( = ?auto_6652 ?auto_6660 ) ) ( not ( = ?auto_6653 ?auto_6660 ) ) ( not ( = ?auto_6651 ?auto_6660 ) ) ( SURFACE-AT ?auto_6651 ?auto_6657 ) ( CLEAR ?auto_6651 ) ( IS-CRATE ?auto_6652 ) ( AVAILABLE ?auto_6659 ) ( TRUCK-AT ?auto_6656 ?auto_6655 ) ( AVAILABLE ?auto_6658 ) ( SURFACE-AT ?auto_6652 ?auto_6655 ) ( ON ?auto_6652 ?auto_6654 ) ( CLEAR ?auto_6652 ) ( not ( = ?auto_6652 ?auto_6654 ) ) ( not ( = ?auto_6653 ?auto_6654 ) ) ( not ( = ?auto_6651 ?auto_6654 ) ) ( not ( = ?auto_6660 ?auto_6654 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6652 ?auto_6653 )
      ( MAKE-2CRATE-VERIFY ?auto_6651 ?auto_6652 ?auto_6653 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6661 - SURFACE
      ?auto_6662 - SURFACE
      ?auto_6663 - SURFACE
      ?auto_6664 - SURFACE
    )
    :vars
    (
      ?auto_6671 - HOIST
      ?auto_6670 - PLACE
      ?auto_6667 - PLACE
      ?auto_6668 - HOIST
      ?auto_6669 - SURFACE
      ?auto_6665 - TRUCK
      ?auto_6666 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6671 ?auto_6670 ) ( IS-CRATE ?auto_6664 ) ( not ( = ?auto_6663 ?auto_6664 ) ) ( not ( = ?auto_6662 ?auto_6663 ) ) ( not ( = ?auto_6662 ?auto_6664 ) ) ( not ( = ?auto_6667 ?auto_6670 ) ) ( HOIST-AT ?auto_6668 ?auto_6667 ) ( not ( = ?auto_6671 ?auto_6668 ) ) ( SURFACE-AT ?auto_6664 ?auto_6667 ) ( ON ?auto_6664 ?auto_6669 ) ( CLEAR ?auto_6664 ) ( not ( = ?auto_6663 ?auto_6669 ) ) ( not ( = ?auto_6664 ?auto_6669 ) ) ( not ( = ?auto_6662 ?auto_6669 ) ) ( SURFACE-AT ?auto_6662 ?auto_6670 ) ( CLEAR ?auto_6662 ) ( IS-CRATE ?auto_6663 ) ( AVAILABLE ?auto_6671 ) ( TRUCK-AT ?auto_6665 ?auto_6667 ) ( AVAILABLE ?auto_6668 ) ( SURFACE-AT ?auto_6663 ?auto_6667 ) ( ON ?auto_6663 ?auto_6666 ) ( CLEAR ?auto_6663 ) ( not ( = ?auto_6663 ?auto_6666 ) ) ( not ( = ?auto_6664 ?auto_6666 ) ) ( not ( = ?auto_6662 ?auto_6666 ) ) ( not ( = ?auto_6669 ?auto_6666 ) ) ( ON ?auto_6662 ?auto_6661 ) ( not ( = ?auto_6661 ?auto_6662 ) ) ( not ( = ?auto_6661 ?auto_6663 ) ) ( not ( = ?auto_6661 ?auto_6664 ) ) ( not ( = ?auto_6661 ?auto_6669 ) ) ( not ( = ?auto_6661 ?auto_6666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6662 ?auto_6663 ?auto_6664 )
      ( MAKE-3CRATE-VERIFY ?auto_6661 ?auto_6662 ?auto_6663 ?auto_6664 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6672 - SURFACE
      ?auto_6673 - SURFACE
    )
    :vars
    (
      ?auto_6680 - HOIST
      ?auto_6679 - PLACE
      ?auto_6681 - SURFACE
      ?auto_6676 - PLACE
      ?auto_6677 - HOIST
      ?auto_6678 - SURFACE
      ?auto_6675 - SURFACE
      ?auto_6674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6680 ?auto_6679 ) ( IS-CRATE ?auto_6673 ) ( not ( = ?auto_6672 ?auto_6673 ) ) ( not ( = ?auto_6681 ?auto_6672 ) ) ( not ( = ?auto_6681 ?auto_6673 ) ) ( not ( = ?auto_6676 ?auto_6679 ) ) ( HOIST-AT ?auto_6677 ?auto_6676 ) ( not ( = ?auto_6680 ?auto_6677 ) ) ( SURFACE-AT ?auto_6673 ?auto_6676 ) ( ON ?auto_6673 ?auto_6678 ) ( CLEAR ?auto_6673 ) ( not ( = ?auto_6672 ?auto_6678 ) ) ( not ( = ?auto_6673 ?auto_6678 ) ) ( not ( = ?auto_6681 ?auto_6678 ) ) ( SURFACE-AT ?auto_6681 ?auto_6679 ) ( CLEAR ?auto_6681 ) ( IS-CRATE ?auto_6672 ) ( AVAILABLE ?auto_6680 ) ( AVAILABLE ?auto_6677 ) ( SURFACE-AT ?auto_6672 ?auto_6676 ) ( ON ?auto_6672 ?auto_6675 ) ( CLEAR ?auto_6672 ) ( not ( = ?auto_6672 ?auto_6675 ) ) ( not ( = ?auto_6673 ?auto_6675 ) ) ( not ( = ?auto_6681 ?auto_6675 ) ) ( not ( = ?auto_6678 ?auto_6675 ) ) ( TRUCK-AT ?auto_6674 ?auto_6679 ) )
    :subtasks
    ( ( !DRIVE ?auto_6674 ?auto_6679 ?auto_6676 )
      ( MAKE-2CRATE ?auto_6681 ?auto_6672 ?auto_6673 )
      ( MAKE-1CRATE-VERIFY ?auto_6672 ?auto_6673 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6682 - SURFACE
      ?auto_6683 - SURFACE
      ?auto_6684 - SURFACE
    )
    :vars
    (
      ?auto_6690 - HOIST
      ?auto_6691 - PLACE
      ?auto_6685 - PLACE
      ?auto_6687 - HOIST
      ?auto_6686 - SURFACE
      ?auto_6688 - SURFACE
      ?auto_6689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6690 ?auto_6691 ) ( IS-CRATE ?auto_6684 ) ( not ( = ?auto_6683 ?auto_6684 ) ) ( not ( = ?auto_6682 ?auto_6683 ) ) ( not ( = ?auto_6682 ?auto_6684 ) ) ( not ( = ?auto_6685 ?auto_6691 ) ) ( HOIST-AT ?auto_6687 ?auto_6685 ) ( not ( = ?auto_6690 ?auto_6687 ) ) ( SURFACE-AT ?auto_6684 ?auto_6685 ) ( ON ?auto_6684 ?auto_6686 ) ( CLEAR ?auto_6684 ) ( not ( = ?auto_6683 ?auto_6686 ) ) ( not ( = ?auto_6684 ?auto_6686 ) ) ( not ( = ?auto_6682 ?auto_6686 ) ) ( SURFACE-AT ?auto_6682 ?auto_6691 ) ( CLEAR ?auto_6682 ) ( IS-CRATE ?auto_6683 ) ( AVAILABLE ?auto_6690 ) ( AVAILABLE ?auto_6687 ) ( SURFACE-AT ?auto_6683 ?auto_6685 ) ( ON ?auto_6683 ?auto_6688 ) ( CLEAR ?auto_6683 ) ( not ( = ?auto_6683 ?auto_6688 ) ) ( not ( = ?auto_6684 ?auto_6688 ) ) ( not ( = ?auto_6682 ?auto_6688 ) ) ( not ( = ?auto_6686 ?auto_6688 ) ) ( TRUCK-AT ?auto_6689 ?auto_6691 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6683 ?auto_6684 )
      ( MAKE-2CRATE-VERIFY ?auto_6682 ?auto_6683 ?auto_6684 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6692 - SURFACE
      ?auto_6693 - SURFACE
      ?auto_6694 - SURFACE
      ?auto_6695 - SURFACE
    )
    :vars
    (
      ?auto_6698 - HOIST
      ?auto_6700 - PLACE
      ?auto_6701 - PLACE
      ?auto_6702 - HOIST
      ?auto_6696 - SURFACE
      ?auto_6699 - SURFACE
      ?auto_6697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6698 ?auto_6700 ) ( IS-CRATE ?auto_6695 ) ( not ( = ?auto_6694 ?auto_6695 ) ) ( not ( = ?auto_6693 ?auto_6694 ) ) ( not ( = ?auto_6693 ?auto_6695 ) ) ( not ( = ?auto_6701 ?auto_6700 ) ) ( HOIST-AT ?auto_6702 ?auto_6701 ) ( not ( = ?auto_6698 ?auto_6702 ) ) ( SURFACE-AT ?auto_6695 ?auto_6701 ) ( ON ?auto_6695 ?auto_6696 ) ( CLEAR ?auto_6695 ) ( not ( = ?auto_6694 ?auto_6696 ) ) ( not ( = ?auto_6695 ?auto_6696 ) ) ( not ( = ?auto_6693 ?auto_6696 ) ) ( SURFACE-AT ?auto_6693 ?auto_6700 ) ( CLEAR ?auto_6693 ) ( IS-CRATE ?auto_6694 ) ( AVAILABLE ?auto_6698 ) ( AVAILABLE ?auto_6702 ) ( SURFACE-AT ?auto_6694 ?auto_6701 ) ( ON ?auto_6694 ?auto_6699 ) ( CLEAR ?auto_6694 ) ( not ( = ?auto_6694 ?auto_6699 ) ) ( not ( = ?auto_6695 ?auto_6699 ) ) ( not ( = ?auto_6693 ?auto_6699 ) ) ( not ( = ?auto_6696 ?auto_6699 ) ) ( TRUCK-AT ?auto_6697 ?auto_6700 ) ( ON ?auto_6693 ?auto_6692 ) ( not ( = ?auto_6692 ?auto_6693 ) ) ( not ( = ?auto_6692 ?auto_6694 ) ) ( not ( = ?auto_6692 ?auto_6695 ) ) ( not ( = ?auto_6692 ?auto_6696 ) ) ( not ( = ?auto_6692 ?auto_6699 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6693 ?auto_6694 ?auto_6695 )
      ( MAKE-3CRATE-VERIFY ?auto_6692 ?auto_6693 ?auto_6694 ?auto_6695 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6703 - SURFACE
      ?auto_6704 - SURFACE
    )
    :vars
    (
      ?auto_6707 - HOIST
      ?auto_6709 - PLACE
      ?auto_6712 - SURFACE
      ?auto_6710 - PLACE
      ?auto_6711 - HOIST
      ?auto_6705 - SURFACE
      ?auto_6708 - SURFACE
      ?auto_6706 - TRUCK
      ?auto_6713 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6707 ?auto_6709 ) ( IS-CRATE ?auto_6704 ) ( not ( = ?auto_6703 ?auto_6704 ) ) ( not ( = ?auto_6712 ?auto_6703 ) ) ( not ( = ?auto_6712 ?auto_6704 ) ) ( not ( = ?auto_6710 ?auto_6709 ) ) ( HOIST-AT ?auto_6711 ?auto_6710 ) ( not ( = ?auto_6707 ?auto_6711 ) ) ( SURFACE-AT ?auto_6704 ?auto_6710 ) ( ON ?auto_6704 ?auto_6705 ) ( CLEAR ?auto_6704 ) ( not ( = ?auto_6703 ?auto_6705 ) ) ( not ( = ?auto_6704 ?auto_6705 ) ) ( not ( = ?auto_6712 ?auto_6705 ) ) ( IS-CRATE ?auto_6703 ) ( AVAILABLE ?auto_6711 ) ( SURFACE-AT ?auto_6703 ?auto_6710 ) ( ON ?auto_6703 ?auto_6708 ) ( CLEAR ?auto_6703 ) ( not ( = ?auto_6703 ?auto_6708 ) ) ( not ( = ?auto_6704 ?auto_6708 ) ) ( not ( = ?auto_6712 ?auto_6708 ) ) ( not ( = ?auto_6705 ?auto_6708 ) ) ( TRUCK-AT ?auto_6706 ?auto_6709 ) ( SURFACE-AT ?auto_6713 ?auto_6709 ) ( CLEAR ?auto_6713 ) ( LIFTING ?auto_6707 ?auto_6712 ) ( IS-CRATE ?auto_6712 ) ( not ( = ?auto_6713 ?auto_6712 ) ) ( not ( = ?auto_6703 ?auto_6713 ) ) ( not ( = ?auto_6704 ?auto_6713 ) ) ( not ( = ?auto_6705 ?auto_6713 ) ) ( not ( = ?auto_6708 ?auto_6713 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6713 ?auto_6712 )
      ( MAKE-2CRATE ?auto_6712 ?auto_6703 ?auto_6704 )
      ( MAKE-1CRATE-VERIFY ?auto_6703 ?auto_6704 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6714 - SURFACE
      ?auto_6715 - SURFACE
      ?auto_6716 - SURFACE
    )
    :vars
    (
      ?auto_6717 - HOIST
      ?auto_6719 - PLACE
      ?auto_6723 - PLACE
      ?auto_6722 - HOIST
      ?auto_6721 - SURFACE
      ?auto_6720 - SURFACE
      ?auto_6718 - TRUCK
      ?auto_6724 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6717 ?auto_6719 ) ( IS-CRATE ?auto_6716 ) ( not ( = ?auto_6715 ?auto_6716 ) ) ( not ( = ?auto_6714 ?auto_6715 ) ) ( not ( = ?auto_6714 ?auto_6716 ) ) ( not ( = ?auto_6723 ?auto_6719 ) ) ( HOIST-AT ?auto_6722 ?auto_6723 ) ( not ( = ?auto_6717 ?auto_6722 ) ) ( SURFACE-AT ?auto_6716 ?auto_6723 ) ( ON ?auto_6716 ?auto_6721 ) ( CLEAR ?auto_6716 ) ( not ( = ?auto_6715 ?auto_6721 ) ) ( not ( = ?auto_6716 ?auto_6721 ) ) ( not ( = ?auto_6714 ?auto_6721 ) ) ( IS-CRATE ?auto_6715 ) ( AVAILABLE ?auto_6722 ) ( SURFACE-AT ?auto_6715 ?auto_6723 ) ( ON ?auto_6715 ?auto_6720 ) ( CLEAR ?auto_6715 ) ( not ( = ?auto_6715 ?auto_6720 ) ) ( not ( = ?auto_6716 ?auto_6720 ) ) ( not ( = ?auto_6714 ?auto_6720 ) ) ( not ( = ?auto_6721 ?auto_6720 ) ) ( TRUCK-AT ?auto_6718 ?auto_6719 ) ( SURFACE-AT ?auto_6724 ?auto_6719 ) ( CLEAR ?auto_6724 ) ( LIFTING ?auto_6717 ?auto_6714 ) ( IS-CRATE ?auto_6714 ) ( not ( = ?auto_6724 ?auto_6714 ) ) ( not ( = ?auto_6715 ?auto_6724 ) ) ( not ( = ?auto_6716 ?auto_6724 ) ) ( not ( = ?auto_6721 ?auto_6724 ) ) ( not ( = ?auto_6720 ?auto_6724 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6715 ?auto_6716 )
      ( MAKE-2CRATE-VERIFY ?auto_6714 ?auto_6715 ?auto_6716 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6725 - SURFACE
      ?auto_6726 - SURFACE
      ?auto_6727 - SURFACE
      ?auto_6728 - SURFACE
    )
    :vars
    (
      ?auto_6729 - HOIST
      ?auto_6734 - PLACE
      ?auto_6731 - PLACE
      ?auto_6732 - HOIST
      ?auto_6730 - SURFACE
      ?auto_6735 - SURFACE
      ?auto_6733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6729 ?auto_6734 ) ( IS-CRATE ?auto_6728 ) ( not ( = ?auto_6727 ?auto_6728 ) ) ( not ( = ?auto_6726 ?auto_6727 ) ) ( not ( = ?auto_6726 ?auto_6728 ) ) ( not ( = ?auto_6731 ?auto_6734 ) ) ( HOIST-AT ?auto_6732 ?auto_6731 ) ( not ( = ?auto_6729 ?auto_6732 ) ) ( SURFACE-AT ?auto_6728 ?auto_6731 ) ( ON ?auto_6728 ?auto_6730 ) ( CLEAR ?auto_6728 ) ( not ( = ?auto_6727 ?auto_6730 ) ) ( not ( = ?auto_6728 ?auto_6730 ) ) ( not ( = ?auto_6726 ?auto_6730 ) ) ( IS-CRATE ?auto_6727 ) ( AVAILABLE ?auto_6732 ) ( SURFACE-AT ?auto_6727 ?auto_6731 ) ( ON ?auto_6727 ?auto_6735 ) ( CLEAR ?auto_6727 ) ( not ( = ?auto_6727 ?auto_6735 ) ) ( not ( = ?auto_6728 ?auto_6735 ) ) ( not ( = ?auto_6726 ?auto_6735 ) ) ( not ( = ?auto_6730 ?auto_6735 ) ) ( TRUCK-AT ?auto_6733 ?auto_6734 ) ( SURFACE-AT ?auto_6725 ?auto_6734 ) ( CLEAR ?auto_6725 ) ( LIFTING ?auto_6729 ?auto_6726 ) ( IS-CRATE ?auto_6726 ) ( not ( = ?auto_6725 ?auto_6726 ) ) ( not ( = ?auto_6727 ?auto_6725 ) ) ( not ( = ?auto_6728 ?auto_6725 ) ) ( not ( = ?auto_6730 ?auto_6725 ) ) ( not ( = ?auto_6735 ?auto_6725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6726 ?auto_6727 ?auto_6728 )
      ( MAKE-3CRATE-VERIFY ?auto_6725 ?auto_6726 ?auto_6727 ?auto_6728 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6871 - SURFACE
      ?auto_6872 - SURFACE
      ?auto_6873 - SURFACE
      ?auto_6875 - SURFACE
      ?auto_6874 - SURFACE
    )
    :vars
    (
      ?auto_6877 - HOIST
      ?auto_6876 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6877 ?auto_6876 ) ( SURFACE-AT ?auto_6875 ?auto_6876 ) ( CLEAR ?auto_6875 ) ( LIFTING ?auto_6877 ?auto_6874 ) ( IS-CRATE ?auto_6874 ) ( not ( = ?auto_6875 ?auto_6874 ) ) ( ON ?auto_6872 ?auto_6871 ) ( ON ?auto_6873 ?auto_6872 ) ( ON ?auto_6875 ?auto_6873 ) ( not ( = ?auto_6871 ?auto_6872 ) ) ( not ( = ?auto_6871 ?auto_6873 ) ) ( not ( = ?auto_6871 ?auto_6875 ) ) ( not ( = ?auto_6871 ?auto_6874 ) ) ( not ( = ?auto_6872 ?auto_6873 ) ) ( not ( = ?auto_6872 ?auto_6875 ) ) ( not ( = ?auto_6872 ?auto_6874 ) ) ( not ( = ?auto_6873 ?auto_6875 ) ) ( not ( = ?auto_6873 ?auto_6874 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6875 ?auto_6874 )
      ( MAKE-4CRATE-VERIFY ?auto_6871 ?auto_6872 ?auto_6873 ?auto_6875 ?auto_6874 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6896 - SURFACE
      ?auto_6897 - SURFACE
      ?auto_6898 - SURFACE
      ?auto_6900 - SURFACE
      ?auto_6899 - SURFACE
    )
    :vars
    (
      ?auto_6902 - HOIST
      ?auto_6901 - PLACE
      ?auto_6903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6902 ?auto_6901 ) ( SURFACE-AT ?auto_6900 ?auto_6901 ) ( CLEAR ?auto_6900 ) ( IS-CRATE ?auto_6899 ) ( not ( = ?auto_6900 ?auto_6899 ) ) ( TRUCK-AT ?auto_6903 ?auto_6901 ) ( AVAILABLE ?auto_6902 ) ( IN ?auto_6899 ?auto_6903 ) ( ON ?auto_6900 ?auto_6898 ) ( not ( = ?auto_6898 ?auto_6900 ) ) ( not ( = ?auto_6898 ?auto_6899 ) ) ( ON ?auto_6897 ?auto_6896 ) ( ON ?auto_6898 ?auto_6897 ) ( not ( = ?auto_6896 ?auto_6897 ) ) ( not ( = ?auto_6896 ?auto_6898 ) ) ( not ( = ?auto_6896 ?auto_6900 ) ) ( not ( = ?auto_6896 ?auto_6899 ) ) ( not ( = ?auto_6897 ?auto_6898 ) ) ( not ( = ?auto_6897 ?auto_6900 ) ) ( not ( = ?auto_6897 ?auto_6899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6898 ?auto_6900 ?auto_6899 )
      ( MAKE-4CRATE-VERIFY ?auto_6896 ?auto_6897 ?auto_6898 ?auto_6900 ?auto_6899 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6926 - SURFACE
      ?auto_6927 - SURFACE
      ?auto_6928 - SURFACE
      ?auto_6930 - SURFACE
      ?auto_6929 - SURFACE
    )
    :vars
    (
      ?auto_6934 - HOIST
      ?auto_6933 - PLACE
      ?auto_6932 - TRUCK
      ?auto_6931 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6934 ?auto_6933 ) ( SURFACE-AT ?auto_6930 ?auto_6933 ) ( CLEAR ?auto_6930 ) ( IS-CRATE ?auto_6929 ) ( not ( = ?auto_6930 ?auto_6929 ) ) ( AVAILABLE ?auto_6934 ) ( IN ?auto_6929 ?auto_6932 ) ( ON ?auto_6930 ?auto_6928 ) ( not ( = ?auto_6928 ?auto_6930 ) ) ( not ( = ?auto_6928 ?auto_6929 ) ) ( TRUCK-AT ?auto_6932 ?auto_6931 ) ( not ( = ?auto_6931 ?auto_6933 ) ) ( ON ?auto_6927 ?auto_6926 ) ( ON ?auto_6928 ?auto_6927 ) ( not ( = ?auto_6926 ?auto_6927 ) ) ( not ( = ?auto_6926 ?auto_6928 ) ) ( not ( = ?auto_6926 ?auto_6930 ) ) ( not ( = ?auto_6926 ?auto_6929 ) ) ( not ( = ?auto_6927 ?auto_6928 ) ) ( not ( = ?auto_6927 ?auto_6930 ) ) ( not ( = ?auto_6927 ?auto_6929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6928 ?auto_6930 ?auto_6929 )
      ( MAKE-4CRATE-VERIFY ?auto_6926 ?auto_6927 ?auto_6928 ?auto_6930 ?auto_6929 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6960 - SURFACE
      ?auto_6961 - SURFACE
      ?auto_6962 - SURFACE
      ?auto_6964 - SURFACE
      ?auto_6963 - SURFACE
    )
    :vars
    (
      ?auto_6969 - HOIST
      ?auto_6965 - PLACE
      ?auto_6967 - TRUCK
      ?auto_6966 - PLACE
      ?auto_6968 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6969 ?auto_6965 ) ( SURFACE-AT ?auto_6964 ?auto_6965 ) ( CLEAR ?auto_6964 ) ( IS-CRATE ?auto_6963 ) ( not ( = ?auto_6964 ?auto_6963 ) ) ( AVAILABLE ?auto_6969 ) ( ON ?auto_6964 ?auto_6962 ) ( not ( = ?auto_6962 ?auto_6964 ) ) ( not ( = ?auto_6962 ?auto_6963 ) ) ( TRUCK-AT ?auto_6967 ?auto_6966 ) ( not ( = ?auto_6966 ?auto_6965 ) ) ( HOIST-AT ?auto_6968 ?auto_6966 ) ( LIFTING ?auto_6968 ?auto_6963 ) ( not ( = ?auto_6969 ?auto_6968 ) ) ( ON ?auto_6961 ?auto_6960 ) ( ON ?auto_6962 ?auto_6961 ) ( not ( = ?auto_6960 ?auto_6961 ) ) ( not ( = ?auto_6960 ?auto_6962 ) ) ( not ( = ?auto_6960 ?auto_6964 ) ) ( not ( = ?auto_6960 ?auto_6963 ) ) ( not ( = ?auto_6961 ?auto_6962 ) ) ( not ( = ?auto_6961 ?auto_6964 ) ) ( not ( = ?auto_6961 ?auto_6963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6962 ?auto_6964 ?auto_6963 )
      ( MAKE-4CRATE-VERIFY ?auto_6960 ?auto_6961 ?auto_6962 ?auto_6964 ?auto_6963 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6998 - SURFACE
      ?auto_6999 - SURFACE
      ?auto_7000 - SURFACE
      ?auto_7002 - SURFACE
      ?auto_7001 - SURFACE
    )
    :vars
    (
      ?auto_7006 - HOIST
      ?auto_7007 - PLACE
      ?auto_7008 - TRUCK
      ?auto_7003 - PLACE
      ?auto_7004 - HOIST
      ?auto_7005 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7006 ?auto_7007 ) ( SURFACE-AT ?auto_7002 ?auto_7007 ) ( CLEAR ?auto_7002 ) ( IS-CRATE ?auto_7001 ) ( not ( = ?auto_7002 ?auto_7001 ) ) ( AVAILABLE ?auto_7006 ) ( ON ?auto_7002 ?auto_7000 ) ( not ( = ?auto_7000 ?auto_7002 ) ) ( not ( = ?auto_7000 ?auto_7001 ) ) ( TRUCK-AT ?auto_7008 ?auto_7003 ) ( not ( = ?auto_7003 ?auto_7007 ) ) ( HOIST-AT ?auto_7004 ?auto_7003 ) ( not ( = ?auto_7006 ?auto_7004 ) ) ( AVAILABLE ?auto_7004 ) ( SURFACE-AT ?auto_7001 ?auto_7003 ) ( ON ?auto_7001 ?auto_7005 ) ( CLEAR ?auto_7001 ) ( not ( = ?auto_7002 ?auto_7005 ) ) ( not ( = ?auto_7001 ?auto_7005 ) ) ( not ( = ?auto_7000 ?auto_7005 ) ) ( ON ?auto_6999 ?auto_6998 ) ( ON ?auto_7000 ?auto_6999 ) ( not ( = ?auto_6998 ?auto_6999 ) ) ( not ( = ?auto_6998 ?auto_7000 ) ) ( not ( = ?auto_6998 ?auto_7002 ) ) ( not ( = ?auto_6998 ?auto_7001 ) ) ( not ( = ?auto_6998 ?auto_7005 ) ) ( not ( = ?auto_6999 ?auto_7000 ) ) ( not ( = ?auto_6999 ?auto_7002 ) ) ( not ( = ?auto_6999 ?auto_7001 ) ) ( not ( = ?auto_6999 ?auto_7005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7000 ?auto_7002 ?auto_7001 )
      ( MAKE-4CRATE-VERIFY ?auto_6998 ?auto_6999 ?auto_7000 ?auto_7002 ?auto_7001 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7037 - SURFACE
      ?auto_7038 - SURFACE
      ?auto_7039 - SURFACE
      ?auto_7041 - SURFACE
      ?auto_7040 - SURFACE
    )
    :vars
    (
      ?auto_7047 - HOIST
      ?auto_7043 - PLACE
      ?auto_7042 - PLACE
      ?auto_7044 - HOIST
      ?auto_7046 - SURFACE
      ?auto_7045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7047 ?auto_7043 ) ( SURFACE-AT ?auto_7041 ?auto_7043 ) ( CLEAR ?auto_7041 ) ( IS-CRATE ?auto_7040 ) ( not ( = ?auto_7041 ?auto_7040 ) ) ( AVAILABLE ?auto_7047 ) ( ON ?auto_7041 ?auto_7039 ) ( not ( = ?auto_7039 ?auto_7041 ) ) ( not ( = ?auto_7039 ?auto_7040 ) ) ( not ( = ?auto_7042 ?auto_7043 ) ) ( HOIST-AT ?auto_7044 ?auto_7042 ) ( not ( = ?auto_7047 ?auto_7044 ) ) ( AVAILABLE ?auto_7044 ) ( SURFACE-AT ?auto_7040 ?auto_7042 ) ( ON ?auto_7040 ?auto_7046 ) ( CLEAR ?auto_7040 ) ( not ( = ?auto_7041 ?auto_7046 ) ) ( not ( = ?auto_7040 ?auto_7046 ) ) ( not ( = ?auto_7039 ?auto_7046 ) ) ( TRUCK-AT ?auto_7045 ?auto_7043 ) ( ON ?auto_7038 ?auto_7037 ) ( ON ?auto_7039 ?auto_7038 ) ( not ( = ?auto_7037 ?auto_7038 ) ) ( not ( = ?auto_7037 ?auto_7039 ) ) ( not ( = ?auto_7037 ?auto_7041 ) ) ( not ( = ?auto_7037 ?auto_7040 ) ) ( not ( = ?auto_7037 ?auto_7046 ) ) ( not ( = ?auto_7038 ?auto_7039 ) ) ( not ( = ?auto_7038 ?auto_7041 ) ) ( not ( = ?auto_7038 ?auto_7040 ) ) ( not ( = ?auto_7038 ?auto_7046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7039 ?auto_7041 ?auto_7040 )
      ( MAKE-4CRATE-VERIFY ?auto_7037 ?auto_7038 ?auto_7039 ?auto_7041 ?auto_7040 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7076 - SURFACE
      ?auto_7077 - SURFACE
      ?auto_7078 - SURFACE
      ?auto_7080 - SURFACE
      ?auto_7079 - SURFACE
    )
    :vars
    (
      ?auto_7081 - HOIST
      ?auto_7085 - PLACE
      ?auto_7086 - PLACE
      ?auto_7082 - HOIST
      ?auto_7084 - SURFACE
      ?auto_7083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7081 ?auto_7085 ) ( IS-CRATE ?auto_7079 ) ( not ( = ?auto_7080 ?auto_7079 ) ) ( not ( = ?auto_7078 ?auto_7080 ) ) ( not ( = ?auto_7078 ?auto_7079 ) ) ( not ( = ?auto_7086 ?auto_7085 ) ) ( HOIST-AT ?auto_7082 ?auto_7086 ) ( not ( = ?auto_7081 ?auto_7082 ) ) ( AVAILABLE ?auto_7082 ) ( SURFACE-AT ?auto_7079 ?auto_7086 ) ( ON ?auto_7079 ?auto_7084 ) ( CLEAR ?auto_7079 ) ( not ( = ?auto_7080 ?auto_7084 ) ) ( not ( = ?auto_7079 ?auto_7084 ) ) ( not ( = ?auto_7078 ?auto_7084 ) ) ( TRUCK-AT ?auto_7083 ?auto_7085 ) ( SURFACE-AT ?auto_7078 ?auto_7085 ) ( CLEAR ?auto_7078 ) ( LIFTING ?auto_7081 ?auto_7080 ) ( IS-CRATE ?auto_7080 ) ( ON ?auto_7077 ?auto_7076 ) ( ON ?auto_7078 ?auto_7077 ) ( not ( = ?auto_7076 ?auto_7077 ) ) ( not ( = ?auto_7076 ?auto_7078 ) ) ( not ( = ?auto_7076 ?auto_7080 ) ) ( not ( = ?auto_7076 ?auto_7079 ) ) ( not ( = ?auto_7076 ?auto_7084 ) ) ( not ( = ?auto_7077 ?auto_7078 ) ) ( not ( = ?auto_7077 ?auto_7080 ) ) ( not ( = ?auto_7077 ?auto_7079 ) ) ( not ( = ?auto_7077 ?auto_7084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7078 ?auto_7080 ?auto_7079 )
      ( MAKE-4CRATE-VERIFY ?auto_7076 ?auto_7077 ?auto_7078 ?auto_7080 ?auto_7079 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7115 - SURFACE
      ?auto_7116 - SURFACE
      ?auto_7117 - SURFACE
      ?auto_7119 - SURFACE
      ?auto_7118 - SURFACE
    )
    :vars
    (
      ?auto_7122 - HOIST
      ?auto_7123 - PLACE
      ?auto_7124 - PLACE
      ?auto_7120 - HOIST
      ?auto_7121 - SURFACE
      ?auto_7125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7122 ?auto_7123 ) ( IS-CRATE ?auto_7118 ) ( not ( = ?auto_7119 ?auto_7118 ) ) ( not ( = ?auto_7117 ?auto_7119 ) ) ( not ( = ?auto_7117 ?auto_7118 ) ) ( not ( = ?auto_7124 ?auto_7123 ) ) ( HOIST-AT ?auto_7120 ?auto_7124 ) ( not ( = ?auto_7122 ?auto_7120 ) ) ( AVAILABLE ?auto_7120 ) ( SURFACE-AT ?auto_7118 ?auto_7124 ) ( ON ?auto_7118 ?auto_7121 ) ( CLEAR ?auto_7118 ) ( not ( = ?auto_7119 ?auto_7121 ) ) ( not ( = ?auto_7118 ?auto_7121 ) ) ( not ( = ?auto_7117 ?auto_7121 ) ) ( TRUCK-AT ?auto_7125 ?auto_7123 ) ( SURFACE-AT ?auto_7117 ?auto_7123 ) ( CLEAR ?auto_7117 ) ( IS-CRATE ?auto_7119 ) ( AVAILABLE ?auto_7122 ) ( IN ?auto_7119 ?auto_7125 ) ( ON ?auto_7116 ?auto_7115 ) ( ON ?auto_7117 ?auto_7116 ) ( not ( = ?auto_7115 ?auto_7116 ) ) ( not ( = ?auto_7115 ?auto_7117 ) ) ( not ( = ?auto_7115 ?auto_7119 ) ) ( not ( = ?auto_7115 ?auto_7118 ) ) ( not ( = ?auto_7115 ?auto_7121 ) ) ( not ( = ?auto_7116 ?auto_7117 ) ) ( not ( = ?auto_7116 ?auto_7119 ) ) ( not ( = ?auto_7116 ?auto_7118 ) ) ( not ( = ?auto_7116 ?auto_7121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7117 ?auto_7119 ?auto_7118 )
      ( MAKE-4CRATE-VERIFY ?auto_7115 ?auto_7116 ?auto_7117 ?auto_7119 ?auto_7118 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7388 - SURFACE
      ?auto_7389 - SURFACE
    )
    :vars
    (
      ?auto_7395 - HOIST
      ?auto_7394 - PLACE
      ?auto_7392 - SURFACE
      ?auto_7393 - PLACE
      ?auto_7396 - HOIST
      ?auto_7391 - SURFACE
      ?auto_7390 - TRUCK
      ?auto_7397 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7395 ?auto_7394 ) ( SURFACE-AT ?auto_7388 ?auto_7394 ) ( CLEAR ?auto_7388 ) ( IS-CRATE ?auto_7389 ) ( not ( = ?auto_7388 ?auto_7389 ) ) ( ON ?auto_7388 ?auto_7392 ) ( not ( = ?auto_7392 ?auto_7388 ) ) ( not ( = ?auto_7392 ?auto_7389 ) ) ( not ( = ?auto_7393 ?auto_7394 ) ) ( HOIST-AT ?auto_7396 ?auto_7393 ) ( not ( = ?auto_7395 ?auto_7396 ) ) ( AVAILABLE ?auto_7396 ) ( SURFACE-AT ?auto_7389 ?auto_7393 ) ( ON ?auto_7389 ?auto_7391 ) ( CLEAR ?auto_7389 ) ( not ( = ?auto_7388 ?auto_7391 ) ) ( not ( = ?auto_7389 ?auto_7391 ) ) ( not ( = ?auto_7392 ?auto_7391 ) ) ( TRUCK-AT ?auto_7390 ?auto_7394 ) ( LIFTING ?auto_7395 ?auto_7397 ) ( IS-CRATE ?auto_7397 ) ( not ( = ?auto_7388 ?auto_7397 ) ) ( not ( = ?auto_7389 ?auto_7397 ) ) ( not ( = ?auto_7392 ?auto_7397 ) ) ( not ( = ?auto_7391 ?auto_7397 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7395 ?auto_7397 ?auto_7390 ?auto_7394 )
      ( MAKE-1CRATE ?auto_7388 ?auto_7389 )
      ( MAKE-1CRATE-VERIFY ?auto_7388 ?auto_7389 ) )
  )

)

