( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11144 - BLOCK
      ?auto_11145 - BLOCK
      ?auto_11146 - BLOCK
      ?auto_11147 - BLOCK
    )
    :vars
    (
      ?auto_11148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11148 ?auto_11147 ) ( CLEAR ?auto_11148 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11144 ) ( ON ?auto_11145 ?auto_11144 ) ( ON ?auto_11146 ?auto_11145 ) ( ON ?auto_11147 ?auto_11146 ) ( not ( = ?auto_11144 ?auto_11145 ) ) ( not ( = ?auto_11144 ?auto_11146 ) ) ( not ( = ?auto_11144 ?auto_11147 ) ) ( not ( = ?auto_11144 ?auto_11148 ) ) ( not ( = ?auto_11145 ?auto_11146 ) ) ( not ( = ?auto_11145 ?auto_11147 ) ) ( not ( = ?auto_11145 ?auto_11148 ) ) ( not ( = ?auto_11146 ?auto_11147 ) ) ( not ( = ?auto_11146 ?auto_11148 ) ) ( not ( = ?auto_11147 ?auto_11148 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11148 ?auto_11147 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11150 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11150 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11150 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11151 - BLOCK
    )
    :vars
    (
      ?auto_11152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11151 ?auto_11152 ) ( CLEAR ?auto_11151 ) ( HAND-EMPTY ) ( not ( = ?auto_11151 ?auto_11152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11151 ?auto_11152 )
      ( MAKE-1PILE ?auto_11151 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11156 - BLOCK
      ?auto_11157 - BLOCK
      ?auto_11158 - BLOCK
    )
    :vars
    (
      ?auto_11159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11159 ?auto_11158 ) ( CLEAR ?auto_11159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11156 ) ( ON ?auto_11157 ?auto_11156 ) ( ON ?auto_11158 ?auto_11157 ) ( not ( = ?auto_11156 ?auto_11157 ) ) ( not ( = ?auto_11156 ?auto_11158 ) ) ( not ( = ?auto_11156 ?auto_11159 ) ) ( not ( = ?auto_11157 ?auto_11158 ) ) ( not ( = ?auto_11157 ?auto_11159 ) ) ( not ( = ?auto_11158 ?auto_11159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11159 ?auto_11158 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11160 - BLOCK
      ?auto_11161 - BLOCK
      ?auto_11162 - BLOCK
    )
    :vars
    (
      ?auto_11163 - BLOCK
      ?auto_11164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11163 ?auto_11162 ) ( CLEAR ?auto_11163 ) ( ON-TABLE ?auto_11160 ) ( ON ?auto_11161 ?auto_11160 ) ( ON ?auto_11162 ?auto_11161 ) ( not ( = ?auto_11160 ?auto_11161 ) ) ( not ( = ?auto_11160 ?auto_11162 ) ) ( not ( = ?auto_11160 ?auto_11163 ) ) ( not ( = ?auto_11161 ?auto_11162 ) ) ( not ( = ?auto_11161 ?auto_11163 ) ) ( not ( = ?auto_11162 ?auto_11163 ) ) ( HOLDING ?auto_11164 ) ( not ( = ?auto_11160 ?auto_11164 ) ) ( not ( = ?auto_11161 ?auto_11164 ) ) ( not ( = ?auto_11162 ?auto_11164 ) ) ( not ( = ?auto_11163 ?auto_11164 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11164 )
      ( MAKE-3PILE ?auto_11160 ?auto_11161 ?auto_11162 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11165 - BLOCK
      ?auto_11166 - BLOCK
      ?auto_11167 - BLOCK
    )
    :vars
    (
      ?auto_11169 - BLOCK
      ?auto_11168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11169 ?auto_11167 ) ( ON-TABLE ?auto_11165 ) ( ON ?auto_11166 ?auto_11165 ) ( ON ?auto_11167 ?auto_11166 ) ( not ( = ?auto_11165 ?auto_11166 ) ) ( not ( = ?auto_11165 ?auto_11167 ) ) ( not ( = ?auto_11165 ?auto_11169 ) ) ( not ( = ?auto_11166 ?auto_11167 ) ) ( not ( = ?auto_11166 ?auto_11169 ) ) ( not ( = ?auto_11167 ?auto_11169 ) ) ( not ( = ?auto_11165 ?auto_11168 ) ) ( not ( = ?auto_11166 ?auto_11168 ) ) ( not ( = ?auto_11167 ?auto_11168 ) ) ( not ( = ?auto_11169 ?auto_11168 ) ) ( ON ?auto_11168 ?auto_11169 ) ( CLEAR ?auto_11168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11165 ?auto_11166 ?auto_11167 ?auto_11169 )
      ( MAKE-3PILE ?auto_11165 ?auto_11166 ?auto_11167 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11172 - BLOCK
      ?auto_11173 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11173 ) ( CLEAR ?auto_11172 ) ( ON-TABLE ?auto_11172 ) ( not ( = ?auto_11172 ?auto_11173 ) ) )
    :subtasks
    ( ( !STACK ?auto_11173 ?auto_11172 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11174 - BLOCK
      ?auto_11175 - BLOCK
    )
    :vars
    (
      ?auto_11176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11174 ) ( ON-TABLE ?auto_11174 ) ( not ( = ?auto_11174 ?auto_11175 ) ) ( ON ?auto_11175 ?auto_11176 ) ( CLEAR ?auto_11175 ) ( HAND-EMPTY ) ( not ( = ?auto_11174 ?auto_11176 ) ) ( not ( = ?auto_11175 ?auto_11176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11175 ?auto_11176 )
      ( MAKE-2PILE ?auto_11174 ?auto_11175 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11177 - BLOCK
      ?auto_11178 - BLOCK
    )
    :vars
    (
      ?auto_11179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11177 ?auto_11178 ) ) ( ON ?auto_11178 ?auto_11179 ) ( CLEAR ?auto_11178 ) ( not ( = ?auto_11177 ?auto_11179 ) ) ( not ( = ?auto_11178 ?auto_11179 ) ) ( HOLDING ?auto_11177 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11177 )
      ( MAKE-2PILE ?auto_11177 ?auto_11178 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11180 - BLOCK
      ?auto_11181 - BLOCK
    )
    :vars
    (
      ?auto_11182 - BLOCK
      ?auto_11183 - BLOCK
      ?auto_11184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11180 ?auto_11181 ) ) ( ON ?auto_11181 ?auto_11182 ) ( not ( = ?auto_11180 ?auto_11182 ) ) ( not ( = ?auto_11181 ?auto_11182 ) ) ( ON ?auto_11180 ?auto_11181 ) ( CLEAR ?auto_11180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11183 ) ( ON ?auto_11184 ?auto_11183 ) ( ON ?auto_11182 ?auto_11184 ) ( not ( = ?auto_11183 ?auto_11184 ) ) ( not ( = ?auto_11183 ?auto_11182 ) ) ( not ( = ?auto_11183 ?auto_11181 ) ) ( not ( = ?auto_11183 ?auto_11180 ) ) ( not ( = ?auto_11184 ?auto_11182 ) ) ( not ( = ?auto_11184 ?auto_11181 ) ) ( not ( = ?auto_11184 ?auto_11180 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11183 ?auto_11184 ?auto_11182 ?auto_11181 )
      ( MAKE-2PILE ?auto_11180 ?auto_11181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11187 - BLOCK
      ?auto_11188 - BLOCK
    )
    :vars
    (
      ?auto_11189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11189 ?auto_11188 ) ( CLEAR ?auto_11189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11187 ) ( ON ?auto_11188 ?auto_11187 ) ( not ( = ?auto_11187 ?auto_11188 ) ) ( not ( = ?auto_11187 ?auto_11189 ) ) ( not ( = ?auto_11188 ?auto_11189 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11189 ?auto_11188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11190 - BLOCK
      ?auto_11191 - BLOCK
    )
    :vars
    (
      ?auto_11192 - BLOCK
      ?auto_11193 - BLOCK
      ?auto_11194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11192 ?auto_11191 ) ( CLEAR ?auto_11192 ) ( ON-TABLE ?auto_11190 ) ( ON ?auto_11191 ?auto_11190 ) ( not ( = ?auto_11190 ?auto_11191 ) ) ( not ( = ?auto_11190 ?auto_11192 ) ) ( not ( = ?auto_11191 ?auto_11192 ) ) ( HOLDING ?auto_11193 ) ( CLEAR ?auto_11194 ) ( not ( = ?auto_11190 ?auto_11193 ) ) ( not ( = ?auto_11190 ?auto_11194 ) ) ( not ( = ?auto_11191 ?auto_11193 ) ) ( not ( = ?auto_11191 ?auto_11194 ) ) ( not ( = ?auto_11192 ?auto_11193 ) ) ( not ( = ?auto_11192 ?auto_11194 ) ) ( not ( = ?auto_11193 ?auto_11194 ) ) )
    :subtasks
    ( ( !STACK ?auto_11193 ?auto_11194 )
      ( MAKE-2PILE ?auto_11190 ?auto_11191 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11195 - BLOCK
      ?auto_11196 - BLOCK
    )
    :vars
    (
      ?auto_11198 - BLOCK
      ?auto_11197 - BLOCK
      ?auto_11199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11198 ?auto_11196 ) ( ON-TABLE ?auto_11195 ) ( ON ?auto_11196 ?auto_11195 ) ( not ( = ?auto_11195 ?auto_11196 ) ) ( not ( = ?auto_11195 ?auto_11198 ) ) ( not ( = ?auto_11196 ?auto_11198 ) ) ( CLEAR ?auto_11197 ) ( not ( = ?auto_11195 ?auto_11199 ) ) ( not ( = ?auto_11195 ?auto_11197 ) ) ( not ( = ?auto_11196 ?auto_11199 ) ) ( not ( = ?auto_11196 ?auto_11197 ) ) ( not ( = ?auto_11198 ?auto_11199 ) ) ( not ( = ?auto_11198 ?auto_11197 ) ) ( not ( = ?auto_11199 ?auto_11197 ) ) ( ON ?auto_11199 ?auto_11198 ) ( CLEAR ?auto_11199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11195 ?auto_11196 ?auto_11198 )
      ( MAKE-2PILE ?auto_11195 ?auto_11196 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11200 - BLOCK
      ?auto_11201 - BLOCK
    )
    :vars
    (
      ?auto_11202 - BLOCK
      ?auto_11204 - BLOCK
      ?auto_11203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11202 ?auto_11201 ) ( ON-TABLE ?auto_11200 ) ( ON ?auto_11201 ?auto_11200 ) ( not ( = ?auto_11200 ?auto_11201 ) ) ( not ( = ?auto_11200 ?auto_11202 ) ) ( not ( = ?auto_11201 ?auto_11202 ) ) ( not ( = ?auto_11200 ?auto_11204 ) ) ( not ( = ?auto_11200 ?auto_11203 ) ) ( not ( = ?auto_11201 ?auto_11204 ) ) ( not ( = ?auto_11201 ?auto_11203 ) ) ( not ( = ?auto_11202 ?auto_11204 ) ) ( not ( = ?auto_11202 ?auto_11203 ) ) ( not ( = ?auto_11204 ?auto_11203 ) ) ( ON ?auto_11204 ?auto_11202 ) ( CLEAR ?auto_11204 ) ( HOLDING ?auto_11203 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11203 )
      ( MAKE-2PILE ?auto_11200 ?auto_11201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11205 - BLOCK
      ?auto_11206 - BLOCK
    )
    :vars
    (
      ?auto_11209 - BLOCK
      ?auto_11208 - BLOCK
      ?auto_11207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11209 ?auto_11206 ) ( ON-TABLE ?auto_11205 ) ( ON ?auto_11206 ?auto_11205 ) ( not ( = ?auto_11205 ?auto_11206 ) ) ( not ( = ?auto_11205 ?auto_11209 ) ) ( not ( = ?auto_11206 ?auto_11209 ) ) ( not ( = ?auto_11205 ?auto_11208 ) ) ( not ( = ?auto_11205 ?auto_11207 ) ) ( not ( = ?auto_11206 ?auto_11208 ) ) ( not ( = ?auto_11206 ?auto_11207 ) ) ( not ( = ?auto_11209 ?auto_11208 ) ) ( not ( = ?auto_11209 ?auto_11207 ) ) ( not ( = ?auto_11208 ?auto_11207 ) ) ( ON ?auto_11208 ?auto_11209 ) ( ON ?auto_11207 ?auto_11208 ) ( CLEAR ?auto_11207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11205 ?auto_11206 ?auto_11209 ?auto_11208 )
      ( MAKE-2PILE ?auto_11205 ?auto_11206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11213 - BLOCK
      ?auto_11214 - BLOCK
      ?auto_11215 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11215 ) ( CLEAR ?auto_11214 ) ( ON-TABLE ?auto_11213 ) ( ON ?auto_11214 ?auto_11213 ) ( not ( = ?auto_11213 ?auto_11214 ) ) ( not ( = ?auto_11213 ?auto_11215 ) ) ( not ( = ?auto_11214 ?auto_11215 ) ) )
    :subtasks
    ( ( !STACK ?auto_11215 ?auto_11214 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11216 - BLOCK
      ?auto_11217 - BLOCK
      ?auto_11218 - BLOCK
    )
    :vars
    (
      ?auto_11219 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11217 ) ( ON-TABLE ?auto_11216 ) ( ON ?auto_11217 ?auto_11216 ) ( not ( = ?auto_11216 ?auto_11217 ) ) ( not ( = ?auto_11216 ?auto_11218 ) ) ( not ( = ?auto_11217 ?auto_11218 ) ) ( ON ?auto_11218 ?auto_11219 ) ( CLEAR ?auto_11218 ) ( HAND-EMPTY ) ( not ( = ?auto_11216 ?auto_11219 ) ) ( not ( = ?auto_11217 ?auto_11219 ) ) ( not ( = ?auto_11218 ?auto_11219 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11218 ?auto_11219 )
      ( MAKE-3PILE ?auto_11216 ?auto_11217 ?auto_11218 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11220 - BLOCK
      ?auto_11221 - BLOCK
      ?auto_11222 - BLOCK
    )
    :vars
    (
      ?auto_11223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11220 ) ( not ( = ?auto_11220 ?auto_11221 ) ) ( not ( = ?auto_11220 ?auto_11222 ) ) ( not ( = ?auto_11221 ?auto_11222 ) ) ( ON ?auto_11222 ?auto_11223 ) ( CLEAR ?auto_11222 ) ( not ( = ?auto_11220 ?auto_11223 ) ) ( not ( = ?auto_11221 ?auto_11223 ) ) ( not ( = ?auto_11222 ?auto_11223 ) ) ( HOLDING ?auto_11221 ) ( CLEAR ?auto_11220 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11220 ?auto_11221 )
      ( MAKE-3PILE ?auto_11220 ?auto_11221 ?auto_11222 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11224 - BLOCK
      ?auto_11225 - BLOCK
      ?auto_11226 - BLOCK
    )
    :vars
    (
      ?auto_11227 - BLOCK
      ?auto_11228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11224 ) ( not ( = ?auto_11224 ?auto_11225 ) ) ( not ( = ?auto_11224 ?auto_11226 ) ) ( not ( = ?auto_11225 ?auto_11226 ) ) ( ON ?auto_11226 ?auto_11227 ) ( not ( = ?auto_11224 ?auto_11227 ) ) ( not ( = ?auto_11225 ?auto_11227 ) ) ( not ( = ?auto_11226 ?auto_11227 ) ) ( CLEAR ?auto_11224 ) ( ON ?auto_11225 ?auto_11226 ) ( CLEAR ?auto_11225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11228 ) ( ON ?auto_11227 ?auto_11228 ) ( not ( = ?auto_11228 ?auto_11227 ) ) ( not ( = ?auto_11228 ?auto_11226 ) ) ( not ( = ?auto_11228 ?auto_11225 ) ) ( not ( = ?auto_11224 ?auto_11228 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11228 ?auto_11227 ?auto_11226 )
      ( MAKE-3PILE ?auto_11224 ?auto_11225 ?auto_11226 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11229 - BLOCK
      ?auto_11230 - BLOCK
      ?auto_11231 - BLOCK
    )
    :vars
    (
      ?auto_11233 - BLOCK
      ?auto_11232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11229 ?auto_11230 ) ) ( not ( = ?auto_11229 ?auto_11231 ) ) ( not ( = ?auto_11230 ?auto_11231 ) ) ( ON ?auto_11231 ?auto_11233 ) ( not ( = ?auto_11229 ?auto_11233 ) ) ( not ( = ?auto_11230 ?auto_11233 ) ) ( not ( = ?auto_11231 ?auto_11233 ) ) ( ON ?auto_11230 ?auto_11231 ) ( CLEAR ?auto_11230 ) ( ON-TABLE ?auto_11232 ) ( ON ?auto_11233 ?auto_11232 ) ( not ( = ?auto_11232 ?auto_11233 ) ) ( not ( = ?auto_11232 ?auto_11231 ) ) ( not ( = ?auto_11232 ?auto_11230 ) ) ( not ( = ?auto_11229 ?auto_11232 ) ) ( HOLDING ?auto_11229 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11229 )
      ( MAKE-3PILE ?auto_11229 ?auto_11230 ?auto_11231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11234 - BLOCK
      ?auto_11235 - BLOCK
      ?auto_11236 - BLOCK
    )
    :vars
    (
      ?auto_11238 - BLOCK
      ?auto_11237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11234 ?auto_11235 ) ) ( not ( = ?auto_11234 ?auto_11236 ) ) ( not ( = ?auto_11235 ?auto_11236 ) ) ( ON ?auto_11236 ?auto_11238 ) ( not ( = ?auto_11234 ?auto_11238 ) ) ( not ( = ?auto_11235 ?auto_11238 ) ) ( not ( = ?auto_11236 ?auto_11238 ) ) ( ON ?auto_11235 ?auto_11236 ) ( ON-TABLE ?auto_11237 ) ( ON ?auto_11238 ?auto_11237 ) ( not ( = ?auto_11237 ?auto_11238 ) ) ( not ( = ?auto_11237 ?auto_11236 ) ) ( not ( = ?auto_11237 ?auto_11235 ) ) ( not ( = ?auto_11234 ?auto_11237 ) ) ( ON ?auto_11234 ?auto_11235 ) ( CLEAR ?auto_11234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11237 ?auto_11238 ?auto_11236 ?auto_11235 )
      ( MAKE-3PILE ?auto_11234 ?auto_11235 ?auto_11236 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11240 - BLOCK
    )
    :vars
    (
      ?auto_11241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11241 ?auto_11240 ) ( CLEAR ?auto_11241 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11240 ) ( not ( = ?auto_11240 ?auto_11241 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11241 ?auto_11240 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11242 - BLOCK
    )
    :vars
    (
      ?auto_11243 - BLOCK
      ?auto_11244 - BLOCK
      ?auto_11245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11243 ?auto_11242 ) ( CLEAR ?auto_11243 ) ( ON-TABLE ?auto_11242 ) ( not ( = ?auto_11242 ?auto_11243 ) ) ( HOLDING ?auto_11244 ) ( CLEAR ?auto_11245 ) ( not ( = ?auto_11242 ?auto_11244 ) ) ( not ( = ?auto_11242 ?auto_11245 ) ) ( not ( = ?auto_11243 ?auto_11244 ) ) ( not ( = ?auto_11243 ?auto_11245 ) ) ( not ( = ?auto_11244 ?auto_11245 ) ) )
    :subtasks
    ( ( !STACK ?auto_11244 ?auto_11245 )
      ( MAKE-1PILE ?auto_11242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11246 - BLOCK
    )
    :vars
    (
      ?auto_11249 - BLOCK
      ?auto_11247 - BLOCK
      ?auto_11248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11249 ?auto_11246 ) ( ON-TABLE ?auto_11246 ) ( not ( = ?auto_11246 ?auto_11249 ) ) ( CLEAR ?auto_11247 ) ( not ( = ?auto_11246 ?auto_11248 ) ) ( not ( = ?auto_11246 ?auto_11247 ) ) ( not ( = ?auto_11249 ?auto_11248 ) ) ( not ( = ?auto_11249 ?auto_11247 ) ) ( not ( = ?auto_11248 ?auto_11247 ) ) ( ON ?auto_11248 ?auto_11249 ) ( CLEAR ?auto_11248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11246 ?auto_11249 )
      ( MAKE-1PILE ?auto_11246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11250 - BLOCK
    )
    :vars
    (
      ?auto_11253 - BLOCK
      ?auto_11251 - BLOCK
      ?auto_11252 - BLOCK
      ?auto_11254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11253 ?auto_11250 ) ( ON-TABLE ?auto_11250 ) ( not ( = ?auto_11250 ?auto_11253 ) ) ( not ( = ?auto_11250 ?auto_11251 ) ) ( not ( = ?auto_11250 ?auto_11252 ) ) ( not ( = ?auto_11253 ?auto_11251 ) ) ( not ( = ?auto_11253 ?auto_11252 ) ) ( not ( = ?auto_11251 ?auto_11252 ) ) ( ON ?auto_11251 ?auto_11253 ) ( CLEAR ?auto_11251 ) ( HOLDING ?auto_11252 ) ( CLEAR ?auto_11254 ) ( ON-TABLE ?auto_11254 ) ( not ( = ?auto_11254 ?auto_11252 ) ) ( not ( = ?auto_11250 ?auto_11254 ) ) ( not ( = ?auto_11253 ?auto_11254 ) ) ( not ( = ?auto_11251 ?auto_11254 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11254 ?auto_11252 )
      ( MAKE-1PILE ?auto_11250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11255 - BLOCK
    )
    :vars
    (
      ?auto_11259 - BLOCK
      ?auto_11258 - BLOCK
      ?auto_11257 - BLOCK
      ?auto_11256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11259 ?auto_11255 ) ( ON-TABLE ?auto_11255 ) ( not ( = ?auto_11255 ?auto_11259 ) ) ( not ( = ?auto_11255 ?auto_11258 ) ) ( not ( = ?auto_11255 ?auto_11257 ) ) ( not ( = ?auto_11259 ?auto_11258 ) ) ( not ( = ?auto_11259 ?auto_11257 ) ) ( not ( = ?auto_11258 ?auto_11257 ) ) ( ON ?auto_11258 ?auto_11259 ) ( CLEAR ?auto_11256 ) ( ON-TABLE ?auto_11256 ) ( not ( = ?auto_11256 ?auto_11257 ) ) ( not ( = ?auto_11255 ?auto_11256 ) ) ( not ( = ?auto_11259 ?auto_11256 ) ) ( not ( = ?auto_11258 ?auto_11256 ) ) ( ON ?auto_11257 ?auto_11258 ) ( CLEAR ?auto_11257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11255 ?auto_11259 ?auto_11258 )
      ( MAKE-1PILE ?auto_11255 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11260 - BLOCK
    )
    :vars
    (
      ?auto_11262 - BLOCK
      ?auto_11261 - BLOCK
      ?auto_11263 - BLOCK
      ?auto_11264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11262 ?auto_11260 ) ( ON-TABLE ?auto_11260 ) ( not ( = ?auto_11260 ?auto_11262 ) ) ( not ( = ?auto_11260 ?auto_11261 ) ) ( not ( = ?auto_11260 ?auto_11263 ) ) ( not ( = ?auto_11262 ?auto_11261 ) ) ( not ( = ?auto_11262 ?auto_11263 ) ) ( not ( = ?auto_11261 ?auto_11263 ) ) ( ON ?auto_11261 ?auto_11262 ) ( not ( = ?auto_11264 ?auto_11263 ) ) ( not ( = ?auto_11260 ?auto_11264 ) ) ( not ( = ?auto_11262 ?auto_11264 ) ) ( not ( = ?auto_11261 ?auto_11264 ) ) ( ON ?auto_11263 ?auto_11261 ) ( CLEAR ?auto_11263 ) ( HOLDING ?auto_11264 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11264 )
      ( MAKE-1PILE ?auto_11260 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11265 - BLOCK
    )
    :vars
    (
      ?auto_11266 - BLOCK
      ?auto_11269 - BLOCK
      ?auto_11268 - BLOCK
      ?auto_11267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11266 ?auto_11265 ) ( ON-TABLE ?auto_11265 ) ( not ( = ?auto_11265 ?auto_11266 ) ) ( not ( = ?auto_11265 ?auto_11269 ) ) ( not ( = ?auto_11265 ?auto_11268 ) ) ( not ( = ?auto_11266 ?auto_11269 ) ) ( not ( = ?auto_11266 ?auto_11268 ) ) ( not ( = ?auto_11269 ?auto_11268 ) ) ( ON ?auto_11269 ?auto_11266 ) ( not ( = ?auto_11267 ?auto_11268 ) ) ( not ( = ?auto_11265 ?auto_11267 ) ) ( not ( = ?auto_11266 ?auto_11267 ) ) ( not ( = ?auto_11269 ?auto_11267 ) ) ( ON ?auto_11268 ?auto_11269 ) ( ON ?auto_11267 ?auto_11268 ) ( CLEAR ?auto_11267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11265 ?auto_11266 ?auto_11269 ?auto_11268 )
      ( MAKE-1PILE ?auto_11265 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11274 - BLOCK
      ?auto_11275 - BLOCK
      ?auto_11276 - BLOCK
      ?auto_11277 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11277 ) ( CLEAR ?auto_11276 ) ( ON-TABLE ?auto_11274 ) ( ON ?auto_11275 ?auto_11274 ) ( ON ?auto_11276 ?auto_11275 ) ( not ( = ?auto_11274 ?auto_11275 ) ) ( not ( = ?auto_11274 ?auto_11276 ) ) ( not ( = ?auto_11274 ?auto_11277 ) ) ( not ( = ?auto_11275 ?auto_11276 ) ) ( not ( = ?auto_11275 ?auto_11277 ) ) ( not ( = ?auto_11276 ?auto_11277 ) ) )
    :subtasks
    ( ( !STACK ?auto_11277 ?auto_11276 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11278 - BLOCK
      ?auto_11279 - BLOCK
      ?auto_11280 - BLOCK
      ?auto_11281 - BLOCK
    )
    :vars
    (
      ?auto_11282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11280 ) ( ON-TABLE ?auto_11278 ) ( ON ?auto_11279 ?auto_11278 ) ( ON ?auto_11280 ?auto_11279 ) ( not ( = ?auto_11278 ?auto_11279 ) ) ( not ( = ?auto_11278 ?auto_11280 ) ) ( not ( = ?auto_11278 ?auto_11281 ) ) ( not ( = ?auto_11279 ?auto_11280 ) ) ( not ( = ?auto_11279 ?auto_11281 ) ) ( not ( = ?auto_11280 ?auto_11281 ) ) ( ON ?auto_11281 ?auto_11282 ) ( CLEAR ?auto_11281 ) ( HAND-EMPTY ) ( not ( = ?auto_11278 ?auto_11282 ) ) ( not ( = ?auto_11279 ?auto_11282 ) ) ( not ( = ?auto_11280 ?auto_11282 ) ) ( not ( = ?auto_11281 ?auto_11282 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11281 ?auto_11282 )
      ( MAKE-4PILE ?auto_11278 ?auto_11279 ?auto_11280 ?auto_11281 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11283 - BLOCK
      ?auto_11284 - BLOCK
      ?auto_11285 - BLOCK
      ?auto_11286 - BLOCK
    )
    :vars
    (
      ?auto_11287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11283 ) ( ON ?auto_11284 ?auto_11283 ) ( not ( = ?auto_11283 ?auto_11284 ) ) ( not ( = ?auto_11283 ?auto_11285 ) ) ( not ( = ?auto_11283 ?auto_11286 ) ) ( not ( = ?auto_11284 ?auto_11285 ) ) ( not ( = ?auto_11284 ?auto_11286 ) ) ( not ( = ?auto_11285 ?auto_11286 ) ) ( ON ?auto_11286 ?auto_11287 ) ( CLEAR ?auto_11286 ) ( not ( = ?auto_11283 ?auto_11287 ) ) ( not ( = ?auto_11284 ?auto_11287 ) ) ( not ( = ?auto_11285 ?auto_11287 ) ) ( not ( = ?auto_11286 ?auto_11287 ) ) ( HOLDING ?auto_11285 ) ( CLEAR ?auto_11284 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11283 ?auto_11284 ?auto_11285 )
      ( MAKE-4PILE ?auto_11283 ?auto_11284 ?auto_11285 ?auto_11286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11288 - BLOCK
      ?auto_11289 - BLOCK
      ?auto_11290 - BLOCK
      ?auto_11291 - BLOCK
    )
    :vars
    (
      ?auto_11292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11288 ) ( ON ?auto_11289 ?auto_11288 ) ( not ( = ?auto_11288 ?auto_11289 ) ) ( not ( = ?auto_11288 ?auto_11290 ) ) ( not ( = ?auto_11288 ?auto_11291 ) ) ( not ( = ?auto_11289 ?auto_11290 ) ) ( not ( = ?auto_11289 ?auto_11291 ) ) ( not ( = ?auto_11290 ?auto_11291 ) ) ( ON ?auto_11291 ?auto_11292 ) ( not ( = ?auto_11288 ?auto_11292 ) ) ( not ( = ?auto_11289 ?auto_11292 ) ) ( not ( = ?auto_11290 ?auto_11292 ) ) ( not ( = ?auto_11291 ?auto_11292 ) ) ( CLEAR ?auto_11289 ) ( ON ?auto_11290 ?auto_11291 ) ( CLEAR ?auto_11290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11292 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11292 ?auto_11291 )
      ( MAKE-4PILE ?auto_11288 ?auto_11289 ?auto_11290 ?auto_11291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11293 - BLOCK
      ?auto_11294 - BLOCK
      ?auto_11295 - BLOCK
      ?auto_11296 - BLOCK
    )
    :vars
    (
      ?auto_11297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11293 ) ( not ( = ?auto_11293 ?auto_11294 ) ) ( not ( = ?auto_11293 ?auto_11295 ) ) ( not ( = ?auto_11293 ?auto_11296 ) ) ( not ( = ?auto_11294 ?auto_11295 ) ) ( not ( = ?auto_11294 ?auto_11296 ) ) ( not ( = ?auto_11295 ?auto_11296 ) ) ( ON ?auto_11296 ?auto_11297 ) ( not ( = ?auto_11293 ?auto_11297 ) ) ( not ( = ?auto_11294 ?auto_11297 ) ) ( not ( = ?auto_11295 ?auto_11297 ) ) ( not ( = ?auto_11296 ?auto_11297 ) ) ( ON ?auto_11295 ?auto_11296 ) ( CLEAR ?auto_11295 ) ( ON-TABLE ?auto_11297 ) ( HOLDING ?auto_11294 ) ( CLEAR ?auto_11293 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11293 ?auto_11294 )
      ( MAKE-4PILE ?auto_11293 ?auto_11294 ?auto_11295 ?auto_11296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11298 - BLOCK
      ?auto_11299 - BLOCK
      ?auto_11300 - BLOCK
      ?auto_11301 - BLOCK
    )
    :vars
    (
      ?auto_11302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11298 ) ( not ( = ?auto_11298 ?auto_11299 ) ) ( not ( = ?auto_11298 ?auto_11300 ) ) ( not ( = ?auto_11298 ?auto_11301 ) ) ( not ( = ?auto_11299 ?auto_11300 ) ) ( not ( = ?auto_11299 ?auto_11301 ) ) ( not ( = ?auto_11300 ?auto_11301 ) ) ( ON ?auto_11301 ?auto_11302 ) ( not ( = ?auto_11298 ?auto_11302 ) ) ( not ( = ?auto_11299 ?auto_11302 ) ) ( not ( = ?auto_11300 ?auto_11302 ) ) ( not ( = ?auto_11301 ?auto_11302 ) ) ( ON ?auto_11300 ?auto_11301 ) ( ON-TABLE ?auto_11302 ) ( CLEAR ?auto_11298 ) ( ON ?auto_11299 ?auto_11300 ) ( CLEAR ?auto_11299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11302 ?auto_11301 ?auto_11300 )
      ( MAKE-4PILE ?auto_11298 ?auto_11299 ?auto_11300 ?auto_11301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11303 - BLOCK
      ?auto_11304 - BLOCK
      ?auto_11305 - BLOCK
      ?auto_11306 - BLOCK
    )
    :vars
    (
      ?auto_11307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11303 ?auto_11304 ) ) ( not ( = ?auto_11303 ?auto_11305 ) ) ( not ( = ?auto_11303 ?auto_11306 ) ) ( not ( = ?auto_11304 ?auto_11305 ) ) ( not ( = ?auto_11304 ?auto_11306 ) ) ( not ( = ?auto_11305 ?auto_11306 ) ) ( ON ?auto_11306 ?auto_11307 ) ( not ( = ?auto_11303 ?auto_11307 ) ) ( not ( = ?auto_11304 ?auto_11307 ) ) ( not ( = ?auto_11305 ?auto_11307 ) ) ( not ( = ?auto_11306 ?auto_11307 ) ) ( ON ?auto_11305 ?auto_11306 ) ( ON-TABLE ?auto_11307 ) ( ON ?auto_11304 ?auto_11305 ) ( CLEAR ?auto_11304 ) ( HOLDING ?auto_11303 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11303 )
      ( MAKE-4PILE ?auto_11303 ?auto_11304 ?auto_11305 ?auto_11306 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11308 - BLOCK
      ?auto_11309 - BLOCK
      ?auto_11310 - BLOCK
      ?auto_11311 - BLOCK
    )
    :vars
    (
      ?auto_11312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11308 ?auto_11309 ) ) ( not ( = ?auto_11308 ?auto_11310 ) ) ( not ( = ?auto_11308 ?auto_11311 ) ) ( not ( = ?auto_11309 ?auto_11310 ) ) ( not ( = ?auto_11309 ?auto_11311 ) ) ( not ( = ?auto_11310 ?auto_11311 ) ) ( ON ?auto_11311 ?auto_11312 ) ( not ( = ?auto_11308 ?auto_11312 ) ) ( not ( = ?auto_11309 ?auto_11312 ) ) ( not ( = ?auto_11310 ?auto_11312 ) ) ( not ( = ?auto_11311 ?auto_11312 ) ) ( ON ?auto_11310 ?auto_11311 ) ( ON-TABLE ?auto_11312 ) ( ON ?auto_11309 ?auto_11310 ) ( ON ?auto_11308 ?auto_11309 ) ( CLEAR ?auto_11308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11312 ?auto_11311 ?auto_11310 ?auto_11309 )
      ( MAKE-4PILE ?auto_11308 ?auto_11309 ?auto_11310 ?auto_11311 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11316 - BLOCK
      ?auto_11317 - BLOCK
      ?auto_11318 - BLOCK
    )
    :vars
    (
      ?auto_11319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11319 ?auto_11318 ) ( CLEAR ?auto_11319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11316 ) ( ON ?auto_11317 ?auto_11316 ) ( ON ?auto_11318 ?auto_11317 ) ( not ( = ?auto_11316 ?auto_11317 ) ) ( not ( = ?auto_11316 ?auto_11318 ) ) ( not ( = ?auto_11316 ?auto_11319 ) ) ( not ( = ?auto_11317 ?auto_11318 ) ) ( not ( = ?auto_11317 ?auto_11319 ) ) ( not ( = ?auto_11318 ?auto_11319 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11319 ?auto_11318 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11329 - BLOCK
      ?auto_11330 - BLOCK
      ?auto_11331 - BLOCK
    )
    :vars
    (
      ?auto_11332 - BLOCK
      ?auto_11333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11329 ) ( ON ?auto_11330 ?auto_11329 ) ( not ( = ?auto_11329 ?auto_11330 ) ) ( not ( = ?auto_11329 ?auto_11331 ) ) ( not ( = ?auto_11329 ?auto_11332 ) ) ( not ( = ?auto_11330 ?auto_11331 ) ) ( not ( = ?auto_11330 ?auto_11332 ) ) ( not ( = ?auto_11331 ?auto_11332 ) ) ( ON ?auto_11332 ?auto_11333 ) ( CLEAR ?auto_11332 ) ( not ( = ?auto_11329 ?auto_11333 ) ) ( not ( = ?auto_11330 ?auto_11333 ) ) ( not ( = ?auto_11331 ?auto_11333 ) ) ( not ( = ?auto_11332 ?auto_11333 ) ) ( HOLDING ?auto_11331 ) ( CLEAR ?auto_11330 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11329 ?auto_11330 ?auto_11331 ?auto_11332 )
      ( MAKE-3PILE ?auto_11329 ?auto_11330 ?auto_11331 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11334 - BLOCK
      ?auto_11335 - BLOCK
      ?auto_11336 - BLOCK
    )
    :vars
    (
      ?auto_11337 - BLOCK
      ?auto_11338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11334 ) ( ON ?auto_11335 ?auto_11334 ) ( not ( = ?auto_11334 ?auto_11335 ) ) ( not ( = ?auto_11334 ?auto_11336 ) ) ( not ( = ?auto_11334 ?auto_11337 ) ) ( not ( = ?auto_11335 ?auto_11336 ) ) ( not ( = ?auto_11335 ?auto_11337 ) ) ( not ( = ?auto_11336 ?auto_11337 ) ) ( ON ?auto_11337 ?auto_11338 ) ( not ( = ?auto_11334 ?auto_11338 ) ) ( not ( = ?auto_11335 ?auto_11338 ) ) ( not ( = ?auto_11336 ?auto_11338 ) ) ( not ( = ?auto_11337 ?auto_11338 ) ) ( CLEAR ?auto_11335 ) ( ON ?auto_11336 ?auto_11337 ) ( CLEAR ?auto_11336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11338 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11338 ?auto_11337 )
      ( MAKE-3PILE ?auto_11334 ?auto_11335 ?auto_11336 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11339 - BLOCK
      ?auto_11340 - BLOCK
      ?auto_11341 - BLOCK
    )
    :vars
    (
      ?auto_11343 - BLOCK
      ?auto_11342 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11339 ) ( not ( = ?auto_11339 ?auto_11340 ) ) ( not ( = ?auto_11339 ?auto_11341 ) ) ( not ( = ?auto_11339 ?auto_11343 ) ) ( not ( = ?auto_11340 ?auto_11341 ) ) ( not ( = ?auto_11340 ?auto_11343 ) ) ( not ( = ?auto_11341 ?auto_11343 ) ) ( ON ?auto_11343 ?auto_11342 ) ( not ( = ?auto_11339 ?auto_11342 ) ) ( not ( = ?auto_11340 ?auto_11342 ) ) ( not ( = ?auto_11341 ?auto_11342 ) ) ( not ( = ?auto_11343 ?auto_11342 ) ) ( ON ?auto_11341 ?auto_11343 ) ( CLEAR ?auto_11341 ) ( ON-TABLE ?auto_11342 ) ( HOLDING ?auto_11340 ) ( CLEAR ?auto_11339 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11339 ?auto_11340 )
      ( MAKE-3PILE ?auto_11339 ?auto_11340 ?auto_11341 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11344 - BLOCK
      ?auto_11345 - BLOCK
      ?auto_11346 - BLOCK
    )
    :vars
    (
      ?auto_11347 - BLOCK
      ?auto_11348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11344 ) ( not ( = ?auto_11344 ?auto_11345 ) ) ( not ( = ?auto_11344 ?auto_11346 ) ) ( not ( = ?auto_11344 ?auto_11347 ) ) ( not ( = ?auto_11345 ?auto_11346 ) ) ( not ( = ?auto_11345 ?auto_11347 ) ) ( not ( = ?auto_11346 ?auto_11347 ) ) ( ON ?auto_11347 ?auto_11348 ) ( not ( = ?auto_11344 ?auto_11348 ) ) ( not ( = ?auto_11345 ?auto_11348 ) ) ( not ( = ?auto_11346 ?auto_11348 ) ) ( not ( = ?auto_11347 ?auto_11348 ) ) ( ON ?auto_11346 ?auto_11347 ) ( ON-TABLE ?auto_11348 ) ( CLEAR ?auto_11344 ) ( ON ?auto_11345 ?auto_11346 ) ( CLEAR ?auto_11345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11348 ?auto_11347 ?auto_11346 )
      ( MAKE-3PILE ?auto_11344 ?auto_11345 ?auto_11346 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11349 - BLOCK
      ?auto_11350 - BLOCK
      ?auto_11351 - BLOCK
    )
    :vars
    (
      ?auto_11353 - BLOCK
      ?auto_11352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11349 ?auto_11350 ) ) ( not ( = ?auto_11349 ?auto_11351 ) ) ( not ( = ?auto_11349 ?auto_11353 ) ) ( not ( = ?auto_11350 ?auto_11351 ) ) ( not ( = ?auto_11350 ?auto_11353 ) ) ( not ( = ?auto_11351 ?auto_11353 ) ) ( ON ?auto_11353 ?auto_11352 ) ( not ( = ?auto_11349 ?auto_11352 ) ) ( not ( = ?auto_11350 ?auto_11352 ) ) ( not ( = ?auto_11351 ?auto_11352 ) ) ( not ( = ?auto_11353 ?auto_11352 ) ) ( ON ?auto_11351 ?auto_11353 ) ( ON-TABLE ?auto_11352 ) ( ON ?auto_11350 ?auto_11351 ) ( CLEAR ?auto_11350 ) ( HOLDING ?auto_11349 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11349 )
      ( MAKE-3PILE ?auto_11349 ?auto_11350 ?auto_11351 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11354 - BLOCK
      ?auto_11355 - BLOCK
      ?auto_11356 - BLOCK
    )
    :vars
    (
      ?auto_11358 - BLOCK
      ?auto_11357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11354 ?auto_11355 ) ) ( not ( = ?auto_11354 ?auto_11356 ) ) ( not ( = ?auto_11354 ?auto_11358 ) ) ( not ( = ?auto_11355 ?auto_11356 ) ) ( not ( = ?auto_11355 ?auto_11358 ) ) ( not ( = ?auto_11356 ?auto_11358 ) ) ( ON ?auto_11358 ?auto_11357 ) ( not ( = ?auto_11354 ?auto_11357 ) ) ( not ( = ?auto_11355 ?auto_11357 ) ) ( not ( = ?auto_11356 ?auto_11357 ) ) ( not ( = ?auto_11358 ?auto_11357 ) ) ( ON ?auto_11356 ?auto_11358 ) ( ON-TABLE ?auto_11357 ) ( ON ?auto_11355 ?auto_11356 ) ( ON ?auto_11354 ?auto_11355 ) ( CLEAR ?auto_11354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11357 ?auto_11358 ?auto_11356 ?auto_11355 )
      ( MAKE-3PILE ?auto_11354 ?auto_11355 ?auto_11356 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11360 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11360 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11360 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11361 - BLOCK
    )
    :vars
    (
      ?auto_11362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11361 ?auto_11362 ) ( CLEAR ?auto_11361 ) ( HAND-EMPTY ) ( not ( = ?auto_11361 ?auto_11362 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11361 ?auto_11362 )
      ( MAKE-1PILE ?auto_11361 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11363 - BLOCK
    )
    :vars
    (
      ?auto_11364 - BLOCK
      ?auto_11365 - BLOCK
      ?auto_11366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11363 ?auto_11364 ) ) ( HOLDING ?auto_11363 ) ( CLEAR ?auto_11364 ) ( ON-TABLE ?auto_11365 ) ( ON ?auto_11366 ?auto_11365 ) ( ON ?auto_11364 ?auto_11366 ) ( not ( = ?auto_11365 ?auto_11366 ) ) ( not ( = ?auto_11365 ?auto_11364 ) ) ( not ( = ?auto_11365 ?auto_11363 ) ) ( not ( = ?auto_11366 ?auto_11364 ) ) ( not ( = ?auto_11366 ?auto_11363 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11365 ?auto_11366 ?auto_11364 ?auto_11363 )
      ( MAKE-1PILE ?auto_11363 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11367 - BLOCK
    )
    :vars
    (
      ?auto_11370 - BLOCK
      ?auto_11369 - BLOCK
      ?auto_11368 - BLOCK
      ?auto_11371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11367 ?auto_11370 ) ) ( CLEAR ?auto_11370 ) ( ON-TABLE ?auto_11369 ) ( ON ?auto_11368 ?auto_11369 ) ( ON ?auto_11370 ?auto_11368 ) ( not ( = ?auto_11369 ?auto_11368 ) ) ( not ( = ?auto_11369 ?auto_11370 ) ) ( not ( = ?auto_11369 ?auto_11367 ) ) ( not ( = ?auto_11368 ?auto_11370 ) ) ( not ( = ?auto_11368 ?auto_11367 ) ) ( ON ?auto_11367 ?auto_11371 ) ( CLEAR ?auto_11367 ) ( HAND-EMPTY ) ( not ( = ?auto_11367 ?auto_11371 ) ) ( not ( = ?auto_11370 ?auto_11371 ) ) ( not ( = ?auto_11369 ?auto_11371 ) ) ( not ( = ?auto_11368 ?auto_11371 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11367 ?auto_11371 )
      ( MAKE-1PILE ?auto_11367 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11372 - BLOCK
    )
    :vars
    (
      ?auto_11375 - BLOCK
      ?auto_11374 - BLOCK
      ?auto_11373 - BLOCK
      ?auto_11376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11372 ?auto_11375 ) ) ( ON-TABLE ?auto_11374 ) ( ON ?auto_11373 ?auto_11374 ) ( not ( = ?auto_11374 ?auto_11373 ) ) ( not ( = ?auto_11374 ?auto_11375 ) ) ( not ( = ?auto_11374 ?auto_11372 ) ) ( not ( = ?auto_11373 ?auto_11375 ) ) ( not ( = ?auto_11373 ?auto_11372 ) ) ( ON ?auto_11372 ?auto_11376 ) ( CLEAR ?auto_11372 ) ( not ( = ?auto_11372 ?auto_11376 ) ) ( not ( = ?auto_11375 ?auto_11376 ) ) ( not ( = ?auto_11374 ?auto_11376 ) ) ( not ( = ?auto_11373 ?auto_11376 ) ) ( HOLDING ?auto_11375 ) ( CLEAR ?auto_11373 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11374 ?auto_11373 ?auto_11375 )
      ( MAKE-1PILE ?auto_11372 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11377 - BLOCK
    )
    :vars
    (
      ?auto_11378 - BLOCK
      ?auto_11381 - BLOCK
      ?auto_11380 - BLOCK
      ?auto_11379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11377 ?auto_11378 ) ) ( ON-TABLE ?auto_11381 ) ( ON ?auto_11380 ?auto_11381 ) ( not ( = ?auto_11381 ?auto_11380 ) ) ( not ( = ?auto_11381 ?auto_11378 ) ) ( not ( = ?auto_11381 ?auto_11377 ) ) ( not ( = ?auto_11380 ?auto_11378 ) ) ( not ( = ?auto_11380 ?auto_11377 ) ) ( ON ?auto_11377 ?auto_11379 ) ( not ( = ?auto_11377 ?auto_11379 ) ) ( not ( = ?auto_11378 ?auto_11379 ) ) ( not ( = ?auto_11381 ?auto_11379 ) ) ( not ( = ?auto_11380 ?auto_11379 ) ) ( CLEAR ?auto_11380 ) ( ON ?auto_11378 ?auto_11377 ) ( CLEAR ?auto_11378 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11379 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11379 ?auto_11377 )
      ( MAKE-1PILE ?auto_11377 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11382 - BLOCK
    )
    :vars
    (
      ?auto_11383 - BLOCK
      ?auto_11384 - BLOCK
      ?auto_11385 - BLOCK
      ?auto_11386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11382 ?auto_11383 ) ) ( ON-TABLE ?auto_11384 ) ( not ( = ?auto_11384 ?auto_11385 ) ) ( not ( = ?auto_11384 ?auto_11383 ) ) ( not ( = ?auto_11384 ?auto_11382 ) ) ( not ( = ?auto_11385 ?auto_11383 ) ) ( not ( = ?auto_11385 ?auto_11382 ) ) ( ON ?auto_11382 ?auto_11386 ) ( not ( = ?auto_11382 ?auto_11386 ) ) ( not ( = ?auto_11383 ?auto_11386 ) ) ( not ( = ?auto_11384 ?auto_11386 ) ) ( not ( = ?auto_11385 ?auto_11386 ) ) ( ON ?auto_11383 ?auto_11382 ) ( CLEAR ?auto_11383 ) ( ON-TABLE ?auto_11386 ) ( HOLDING ?auto_11385 ) ( CLEAR ?auto_11384 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11384 ?auto_11385 )
      ( MAKE-1PILE ?auto_11382 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11387 - BLOCK
    )
    :vars
    (
      ?auto_11391 - BLOCK
      ?auto_11389 - BLOCK
      ?auto_11388 - BLOCK
      ?auto_11390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11387 ?auto_11391 ) ) ( ON-TABLE ?auto_11389 ) ( not ( = ?auto_11389 ?auto_11388 ) ) ( not ( = ?auto_11389 ?auto_11391 ) ) ( not ( = ?auto_11389 ?auto_11387 ) ) ( not ( = ?auto_11388 ?auto_11391 ) ) ( not ( = ?auto_11388 ?auto_11387 ) ) ( ON ?auto_11387 ?auto_11390 ) ( not ( = ?auto_11387 ?auto_11390 ) ) ( not ( = ?auto_11391 ?auto_11390 ) ) ( not ( = ?auto_11389 ?auto_11390 ) ) ( not ( = ?auto_11388 ?auto_11390 ) ) ( ON ?auto_11391 ?auto_11387 ) ( ON-TABLE ?auto_11390 ) ( CLEAR ?auto_11389 ) ( ON ?auto_11388 ?auto_11391 ) ( CLEAR ?auto_11388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11390 ?auto_11387 ?auto_11391 )
      ( MAKE-1PILE ?auto_11387 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11392 - BLOCK
    )
    :vars
    (
      ?auto_11393 - BLOCK
      ?auto_11394 - BLOCK
      ?auto_11395 - BLOCK
      ?auto_11396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11392 ?auto_11393 ) ) ( not ( = ?auto_11394 ?auto_11395 ) ) ( not ( = ?auto_11394 ?auto_11393 ) ) ( not ( = ?auto_11394 ?auto_11392 ) ) ( not ( = ?auto_11395 ?auto_11393 ) ) ( not ( = ?auto_11395 ?auto_11392 ) ) ( ON ?auto_11392 ?auto_11396 ) ( not ( = ?auto_11392 ?auto_11396 ) ) ( not ( = ?auto_11393 ?auto_11396 ) ) ( not ( = ?auto_11394 ?auto_11396 ) ) ( not ( = ?auto_11395 ?auto_11396 ) ) ( ON ?auto_11393 ?auto_11392 ) ( ON-TABLE ?auto_11396 ) ( ON ?auto_11395 ?auto_11393 ) ( CLEAR ?auto_11395 ) ( HOLDING ?auto_11394 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11394 )
      ( MAKE-1PILE ?auto_11392 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11397 - BLOCK
    )
    :vars
    (
      ?auto_11398 - BLOCK
      ?auto_11400 - BLOCK
      ?auto_11401 - BLOCK
      ?auto_11399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11397 ?auto_11398 ) ) ( not ( = ?auto_11400 ?auto_11401 ) ) ( not ( = ?auto_11400 ?auto_11398 ) ) ( not ( = ?auto_11400 ?auto_11397 ) ) ( not ( = ?auto_11401 ?auto_11398 ) ) ( not ( = ?auto_11401 ?auto_11397 ) ) ( ON ?auto_11397 ?auto_11399 ) ( not ( = ?auto_11397 ?auto_11399 ) ) ( not ( = ?auto_11398 ?auto_11399 ) ) ( not ( = ?auto_11400 ?auto_11399 ) ) ( not ( = ?auto_11401 ?auto_11399 ) ) ( ON ?auto_11398 ?auto_11397 ) ( ON-TABLE ?auto_11399 ) ( ON ?auto_11401 ?auto_11398 ) ( ON ?auto_11400 ?auto_11401 ) ( CLEAR ?auto_11400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11399 ?auto_11397 ?auto_11398 ?auto_11401 )
      ( MAKE-1PILE ?auto_11397 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11404 - BLOCK
      ?auto_11405 - BLOCK
    )
    :vars
    (
      ?auto_11406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11406 ?auto_11405 ) ( CLEAR ?auto_11406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11404 ) ( ON ?auto_11405 ?auto_11404 ) ( not ( = ?auto_11404 ?auto_11405 ) ) ( not ( = ?auto_11404 ?auto_11406 ) ) ( not ( = ?auto_11405 ?auto_11406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11406 ?auto_11405 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11407 - BLOCK
      ?auto_11408 - BLOCK
    )
    :vars
    (
      ?auto_11409 - BLOCK
      ?auto_11410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11409 ?auto_11408 ) ( CLEAR ?auto_11409 ) ( ON-TABLE ?auto_11407 ) ( ON ?auto_11408 ?auto_11407 ) ( not ( = ?auto_11407 ?auto_11408 ) ) ( not ( = ?auto_11407 ?auto_11409 ) ) ( not ( = ?auto_11408 ?auto_11409 ) ) ( HOLDING ?auto_11410 ) ( not ( = ?auto_11407 ?auto_11410 ) ) ( not ( = ?auto_11408 ?auto_11410 ) ) ( not ( = ?auto_11409 ?auto_11410 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11410 )
      ( MAKE-2PILE ?auto_11407 ?auto_11408 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11411 - BLOCK
      ?auto_11412 - BLOCK
    )
    :vars
    (
      ?auto_11414 - BLOCK
      ?auto_11413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11414 ?auto_11412 ) ( ON-TABLE ?auto_11411 ) ( ON ?auto_11412 ?auto_11411 ) ( not ( = ?auto_11411 ?auto_11412 ) ) ( not ( = ?auto_11411 ?auto_11414 ) ) ( not ( = ?auto_11412 ?auto_11414 ) ) ( not ( = ?auto_11411 ?auto_11413 ) ) ( not ( = ?auto_11412 ?auto_11413 ) ) ( not ( = ?auto_11414 ?auto_11413 ) ) ( ON ?auto_11413 ?auto_11414 ) ( CLEAR ?auto_11413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11411 ?auto_11412 ?auto_11414 )
      ( MAKE-2PILE ?auto_11411 ?auto_11412 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11415 - BLOCK
      ?auto_11416 - BLOCK
    )
    :vars
    (
      ?auto_11418 - BLOCK
      ?auto_11417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11418 ?auto_11416 ) ( ON-TABLE ?auto_11415 ) ( ON ?auto_11416 ?auto_11415 ) ( not ( = ?auto_11415 ?auto_11416 ) ) ( not ( = ?auto_11415 ?auto_11418 ) ) ( not ( = ?auto_11416 ?auto_11418 ) ) ( not ( = ?auto_11415 ?auto_11417 ) ) ( not ( = ?auto_11416 ?auto_11417 ) ) ( not ( = ?auto_11418 ?auto_11417 ) ) ( HOLDING ?auto_11417 ) ( CLEAR ?auto_11418 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11415 ?auto_11416 ?auto_11418 ?auto_11417 )
      ( MAKE-2PILE ?auto_11415 ?auto_11416 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11419 - BLOCK
      ?auto_11420 - BLOCK
    )
    :vars
    (
      ?auto_11422 - BLOCK
      ?auto_11421 - BLOCK
      ?auto_11423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11422 ?auto_11420 ) ( ON-TABLE ?auto_11419 ) ( ON ?auto_11420 ?auto_11419 ) ( not ( = ?auto_11419 ?auto_11420 ) ) ( not ( = ?auto_11419 ?auto_11422 ) ) ( not ( = ?auto_11420 ?auto_11422 ) ) ( not ( = ?auto_11419 ?auto_11421 ) ) ( not ( = ?auto_11420 ?auto_11421 ) ) ( not ( = ?auto_11422 ?auto_11421 ) ) ( CLEAR ?auto_11422 ) ( ON ?auto_11421 ?auto_11423 ) ( CLEAR ?auto_11421 ) ( HAND-EMPTY ) ( not ( = ?auto_11419 ?auto_11423 ) ) ( not ( = ?auto_11420 ?auto_11423 ) ) ( not ( = ?auto_11422 ?auto_11423 ) ) ( not ( = ?auto_11421 ?auto_11423 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11421 ?auto_11423 )
      ( MAKE-2PILE ?auto_11419 ?auto_11420 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11434 - BLOCK
      ?auto_11435 - BLOCK
    )
    :vars
    (
      ?auto_11436 - BLOCK
      ?auto_11438 - BLOCK
      ?auto_11437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11434 ) ( not ( = ?auto_11434 ?auto_11435 ) ) ( not ( = ?auto_11434 ?auto_11436 ) ) ( not ( = ?auto_11435 ?auto_11436 ) ) ( not ( = ?auto_11434 ?auto_11438 ) ) ( not ( = ?auto_11435 ?auto_11438 ) ) ( not ( = ?auto_11436 ?auto_11438 ) ) ( ON ?auto_11438 ?auto_11437 ) ( not ( = ?auto_11434 ?auto_11437 ) ) ( not ( = ?auto_11435 ?auto_11437 ) ) ( not ( = ?auto_11436 ?auto_11437 ) ) ( not ( = ?auto_11438 ?auto_11437 ) ) ( ON ?auto_11436 ?auto_11438 ) ( CLEAR ?auto_11436 ) ( HOLDING ?auto_11435 ) ( CLEAR ?auto_11434 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11434 ?auto_11435 ?auto_11436 )
      ( MAKE-2PILE ?auto_11434 ?auto_11435 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11439 - BLOCK
      ?auto_11440 - BLOCK
    )
    :vars
    (
      ?auto_11442 - BLOCK
      ?auto_11441 - BLOCK
      ?auto_11443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11439 ) ( not ( = ?auto_11439 ?auto_11440 ) ) ( not ( = ?auto_11439 ?auto_11442 ) ) ( not ( = ?auto_11440 ?auto_11442 ) ) ( not ( = ?auto_11439 ?auto_11441 ) ) ( not ( = ?auto_11440 ?auto_11441 ) ) ( not ( = ?auto_11442 ?auto_11441 ) ) ( ON ?auto_11441 ?auto_11443 ) ( not ( = ?auto_11439 ?auto_11443 ) ) ( not ( = ?auto_11440 ?auto_11443 ) ) ( not ( = ?auto_11442 ?auto_11443 ) ) ( not ( = ?auto_11441 ?auto_11443 ) ) ( ON ?auto_11442 ?auto_11441 ) ( CLEAR ?auto_11439 ) ( ON ?auto_11440 ?auto_11442 ) ( CLEAR ?auto_11440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11443 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11443 ?auto_11441 ?auto_11442 )
      ( MAKE-2PILE ?auto_11439 ?auto_11440 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11444 - BLOCK
      ?auto_11445 - BLOCK
    )
    :vars
    (
      ?auto_11448 - BLOCK
      ?auto_11447 - BLOCK
      ?auto_11446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11444 ?auto_11445 ) ) ( not ( = ?auto_11444 ?auto_11448 ) ) ( not ( = ?auto_11445 ?auto_11448 ) ) ( not ( = ?auto_11444 ?auto_11447 ) ) ( not ( = ?auto_11445 ?auto_11447 ) ) ( not ( = ?auto_11448 ?auto_11447 ) ) ( ON ?auto_11447 ?auto_11446 ) ( not ( = ?auto_11444 ?auto_11446 ) ) ( not ( = ?auto_11445 ?auto_11446 ) ) ( not ( = ?auto_11448 ?auto_11446 ) ) ( not ( = ?auto_11447 ?auto_11446 ) ) ( ON ?auto_11448 ?auto_11447 ) ( ON ?auto_11445 ?auto_11448 ) ( CLEAR ?auto_11445 ) ( ON-TABLE ?auto_11446 ) ( HOLDING ?auto_11444 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11444 )
      ( MAKE-2PILE ?auto_11444 ?auto_11445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11449 - BLOCK
      ?auto_11450 - BLOCK
    )
    :vars
    (
      ?auto_11452 - BLOCK
      ?auto_11453 - BLOCK
      ?auto_11451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11449 ?auto_11450 ) ) ( not ( = ?auto_11449 ?auto_11452 ) ) ( not ( = ?auto_11450 ?auto_11452 ) ) ( not ( = ?auto_11449 ?auto_11453 ) ) ( not ( = ?auto_11450 ?auto_11453 ) ) ( not ( = ?auto_11452 ?auto_11453 ) ) ( ON ?auto_11453 ?auto_11451 ) ( not ( = ?auto_11449 ?auto_11451 ) ) ( not ( = ?auto_11450 ?auto_11451 ) ) ( not ( = ?auto_11452 ?auto_11451 ) ) ( not ( = ?auto_11453 ?auto_11451 ) ) ( ON ?auto_11452 ?auto_11453 ) ( ON ?auto_11450 ?auto_11452 ) ( ON-TABLE ?auto_11451 ) ( ON ?auto_11449 ?auto_11450 ) ( CLEAR ?auto_11449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11451 ?auto_11453 ?auto_11452 ?auto_11450 )
      ( MAKE-2PILE ?auto_11449 ?auto_11450 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11456 - BLOCK
      ?auto_11457 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11457 ) ( CLEAR ?auto_11456 ) ( ON-TABLE ?auto_11456 ) ( not ( = ?auto_11456 ?auto_11457 ) ) )
    :subtasks
    ( ( !STACK ?auto_11457 ?auto_11456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11458 - BLOCK
      ?auto_11459 - BLOCK
    )
    :vars
    (
      ?auto_11460 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11458 ) ( ON-TABLE ?auto_11458 ) ( not ( = ?auto_11458 ?auto_11459 ) ) ( ON ?auto_11459 ?auto_11460 ) ( CLEAR ?auto_11459 ) ( HAND-EMPTY ) ( not ( = ?auto_11458 ?auto_11460 ) ) ( not ( = ?auto_11459 ?auto_11460 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11459 ?auto_11460 )
      ( MAKE-2PILE ?auto_11458 ?auto_11459 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11461 - BLOCK
      ?auto_11462 - BLOCK
    )
    :vars
    (
      ?auto_11463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11461 ?auto_11462 ) ) ( ON ?auto_11462 ?auto_11463 ) ( CLEAR ?auto_11462 ) ( not ( = ?auto_11461 ?auto_11463 ) ) ( not ( = ?auto_11462 ?auto_11463 ) ) ( HOLDING ?auto_11461 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11461 )
      ( MAKE-2PILE ?auto_11461 ?auto_11462 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11464 - BLOCK
      ?auto_11465 - BLOCK
    )
    :vars
    (
      ?auto_11466 - BLOCK
      ?auto_11467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11464 ?auto_11465 ) ) ( ON ?auto_11465 ?auto_11466 ) ( not ( = ?auto_11464 ?auto_11466 ) ) ( not ( = ?auto_11465 ?auto_11466 ) ) ( ON ?auto_11464 ?auto_11465 ) ( CLEAR ?auto_11464 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11467 ) ( ON ?auto_11466 ?auto_11467 ) ( not ( = ?auto_11467 ?auto_11466 ) ) ( not ( = ?auto_11467 ?auto_11465 ) ) ( not ( = ?auto_11467 ?auto_11464 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11467 ?auto_11466 ?auto_11465 )
      ( MAKE-2PILE ?auto_11464 ?auto_11465 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11468 - BLOCK
      ?auto_11469 - BLOCK
    )
    :vars
    (
      ?auto_11470 - BLOCK
      ?auto_11471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11468 ?auto_11469 ) ) ( ON ?auto_11469 ?auto_11470 ) ( not ( = ?auto_11468 ?auto_11470 ) ) ( not ( = ?auto_11469 ?auto_11470 ) ) ( ON-TABLE ?auto_11471 ) ( ON ?auto_11470 ?auto_11471 ) ( not ( = ?auto_11471 ?auto_11470 ) ) ( not ( = ?auto_11471 ?auto_11469 ) ) ( not ( = ?auto_11471 ?auto_11468 ) ) ( HOLDING ?auto_11468 ) ( CLEAR ?auto_11469 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11471 ?auto_11470 ?auto_11469 ?auto_11468 )
      ( MAKE-2PILE ?auto_11468 ?auto_11469 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11472 - BLOCK
      ?auto_11473 - BLOCK
    )
    :vars
    (
      ?auto_11475 - BLOCK
      ?auto_11474 - BLOCK
      ?auto_11476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11472 ?auto_11473 ) ) ( ON ?auto_11473 ?auto_11475 ) ( not ( = ?auto_11472 ?auto_11475 ) ) ( not ( = ?auto_11473 ?auto_11475 ) ) ( ON-TABLE ?auto_11474 ) ( ON ?auto_11475 ?auto_11474 ) ( not ( = ?auto_11474 ?auto_11475 ) ) ( not ( = ?auto_11474 ?auto_11473 ) ) ( not ( = ?auto_11474 ?auto_11472 ) ) ( CLEAR ?auto_11473 ) ( ON ?auto_11472 ?auto_11476 ) ( CLEAR ?auto_11472 ) ( HAND-EMPTY ) ( not ( = ?auto_11472 ?auto_11476 ) ) ( not ( = ?auto_11473 ?auto_11476 ) ) ( not ( = ?auto_11475 ?auto_11476 ) ) ( not ( = ?auto_11474 ?auto_11476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11472 ?auto_11476 )
      ( MAKE-2PILE ?auto_11472 ?auto_11473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11477 - BLOCK
      ?auto_11478 - BLOCK
    )
    :vars
    (
      ?auto_11481 - BLOCK
      ?auto_11480 - BLOCK
      ?auto_11479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11477 ?auto_11478 ) ) ( not ( = ?auto_11477 ?auto_11481 ) ) ( not ( = ?auto_11478 ?auto_11481 ) ) ( ON-TABLE ?auto_11480 ) ( ON ?auto_11481 ?auto_11480 ) ( not ( = ?auto_11480 ?auto_11481 ) ) ( not ( = ?auto_11480 ?auto_11478 ) ) ( not ( = ?auto_11480 ?auto_11477 ) ) ( ON ?auto_11477 ?auto_11479 ) ( CLEAR ?auto_11477 ) ( not ( = ?auto_11477 ?auto_11479 ) ) ( not ( = ?auto_11478 ?auto_11479 ) ) ( not ( = ?auto_11481 ?auto_11479 ) ) ( not ( = ?auto_11480 ?auto_11479 ) ) ( HOLDING ?auto_11478 ) ( CLEAR ?auto_11481 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11480 ?auto_11481 ?auto_11478 )
      ( MAKE-2PILE ?auto_11477 ?auto_11478 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11482 - BLOCK
      ?auto_11483 - BLOCK
    )
    :vars
    (
      ?auto_11484 - BLOCK
      ?auto_11485 - BLOCK
      ?auto_11486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11482 ?auto_11483 ) ) ( not ( = ?auto_11482 ?auto_11484 ) ) ( not ( = ?auto_11483 ?auto_11484 ) ) ( ON-TABLE ?auto_11485 ) ( ON ?auto_11484 ?auto_11485 ) ( not ( = ?auto_11485 ?auto_11484 ) ) ( not ( = ?auto_11485 ?auto_11483 ) ) ( not ( = ?auto_11485 ?auto_11482 ) ) ( ON ?auto_11482 ?auto_11486 ) ( not ( = ?auto_11482 ?auto_11486 ) ) ( not ( = ?auto_11483 ?auto_11486 ) ) ( not ( = ?auto_11484 ?auto_11486 ) ) ( not ( = ?auto_11485 ?auto_11486 ) ) ( CLEAR ?auto_11484 ) ( ON ?auto_11483 ?auto_11482 ) ( CLEAR ?auto_11483 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11486 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11486 ?auto_11482 )
      ( MAKE-2PILE ?auto_11482 ?auto_11483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11487 - BLOCK
      ?auto_11488 - BLOCK
    )
    :vars
    (
      ?auto_11489 - BLOCK
      ?auto_11491 - BLOCK
      ?auto_11490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11487 ?auto_11488 ) ) ( not ( = ?auto_11487 ?auto_11489 ) ) ( not ( = ?auto_11488 ?auto_11489 ) ) ( ON-TABLE ?auto_11491 ) ( not ( = ?auto_11491 ?auto_11489 ) ) ( not ( = ?auto_11491 ?auto_11488 ) ) ( not ( = ?auto_11491 ?auto_11487 ) ) ( ON ?auto_11487 ?auto_11490 ) ( not ( = ?auto_11487 ?auto_11490 ) ) ( not ( = ?auto_11488 ?auto_11490 ) ) ( not ( = ?auto_11489 ?auto_11490 ) ) ( not ( = ?auto_11491 ?auto_11490 ) ) ( ON ?auto_11488 ?auto_11487 ) ( CLEAR ?auto_11488 ) ( ON-TABLE ?auto_11490 ) ( HOLDING ?auto_11489 ) ( CLEAR ?auto_11491 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11491 ?auto_11489 )
      ( MAKE-2PILE ?auto_11487 ?auto_11488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11492 - BLOCK
      ?auto_11493 - BLOCK
    )
    :vars
    (
      ?auto_11494 - BLOCK
      ?auto_11495 - BLOCK
      ?auto_11496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11492 ?auto_11493 ) ) ( not ( = ?auto_11492 ?auto_11494 ) ) ( not ( = ?auto_11493 ?auto_11494 ) ) ( ON-TABLE ?auto_11495 ) ( not ( = ?auto_11495 ?auto_11494 ) ) ( not ( = ?auto_11495 ?auto_11493 ) ) ( not ( = ?auto_11495 ?auto_11492 ) ) ( ON ?auto_11492 ?auto_11496 ) ( not ( = ?auto_11492 ?auto_11496 ) ) ( not ( = ?auto_11493 ?auto_11496 ) ) ( not ( = ?auto_11494 ?auto_11496 ) ) ( not ( = ?auto_11495 ?auto_11496 ) ) ( ON ?auto_11493 ?auto_11492 ) ( ON-TABLE ?auto_11496 ) ( CLEAR ?auto_11495 ) ( ON ?auto_11494 ?auto_11493 ) ( CLEAR ?auto_11494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11496 ?auto_11492 ?auto_11493 )
      ( MAKE-2PILE ?auto_11492 ?auto_11493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11497 - BLOCK
      ?auto_11498 - BLOCK
    )
    :vars
    (
      ?auto_11500 - BLOCK
      ?auto_11501 - BLOCK
      ?auto_11499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11497 ?auto_11498 ) ) ( not ( = ?auto_11497 ?auto_11500 ) ) ( not ( = ?auto_11498 ?auto_11500 ) ) ( not ( = ?auto_11501 ?auto_11500 ) ) ( not ( = ?auto_11501 ?auto_11498 ) ) ( not ( = ?auto_11501 ?auto_11497 ) ) ( ON ?auto_11497 ?auto_11499 ) ( not ( = ?auto_11497 ?auto_11499 ) ) ( not ( = ?auto_11498 ?auto_11499 ) ) ( not ( = ?auto_11500 ?auto_11499 ) ) ( not ( = ?auto_11501 ?auto_11499 ) ) ( ON ?auto_11498 ?auto_11497 ) ( ON-TABLE ?auto_11499 ) ( ON ?auto_11500 ?auto_11498 ) ( CLEAR ?auto_11500 ) ( HOLDING ?auto_11501 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11501 )
      ( MAKE-2PILE ?auto_11497 ?auto_11498 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11502 - BLOCK
      ?auto_11503 - BLOCK
    )
    :vars
    (
      ?auto_11505 - BLOCK
      ?auto_11506 - BLOCK
      ?auto_11504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11502 ?auto_11503 ) ) ( not ( = ?auto_11502 ?auto_11505 ) ) ( not ( = ?auto_11503 ?auto_11505 ) ) ( not ( = ?auto_11506 ?auto_11505 ) ) ( not ( = ?auto_11506 ?auto_11503 ) ) ( not ( = ?auto_11506 ?auto_11502 ) ) ( ON ?auto_11502 ?auto_11504 ) ( not ( = ?auto_11502 ?auto_11504 ) ) ( not ( = ?auto_11503 ?auto_11504 ) ) ( not ( = ?auto_11505 ?auto_11504 ) ) ( not ( = ?auto_11506 ?auto_11504 ) ) ( ON ?auto_11503 ?auto_11502 ) ( ON-TABLE ?auto_11504 ) ( ON ?auto_11505 ?auto_11503 ) ( ON ?auto_11506 ?auto_11505 ) ( CLEAR ?auto_11506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11504 ?auto_11502 ?auto_11503 ?auto_11505 )
      ( MAKE-2PILE ?auto_11502 ?auto_11503 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11508 - BLOCK
    )
    :vars
    (
      ?auto_11509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11509 ?auto_11508 ) ( CLEAR ?auto_11509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11508 ) ( not ( = ?auto_11508 ?auto_11509 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11509 ?auto_11508 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11510 - BLOCK
    )
    :vars
    (
      ?auto_11511 - BLOCK
      ?auto_11512 - BLOCK
      ?auto_11513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11511 ?auto_11510 ) ( CLEAR ?auto_11511 ) ( ON-TABLE ?auto_11510 ) ( not ( = ?auto_11510 ?auto_11511 ) ) ( HOLDING ?auto_11512 ) ( CLEAR ?auto_11513 ) ( not ( = ?auto_11510 ?auto_11512 ) ) ( not ( = ?auto_11510 ?auto_11513 ) ) ( not ( = ?auto_11511 ?auto_11512 ) ) ( not ( = ?auto_11511 ?auto_11513 ) ) ( not ( = ?auto_11512 ?auto_11513 ) ) )
    :subtasks
    ( ( !STACK ?auto_11512 ?auto_11513 )
      ( MAKE-1PILE ?auto_11510 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11514 - BLOCK
    )
    :vars
    (
      ?auto_11515 - BLOCK
      ?auto_11517 - BLOCK
      ?auto_11516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11515 ?auto_11514 ) ( ON-TABLE ?auto_11514 ) ( not ( = ?auto_11514 ?auto_11515 ) ) ( CLEAR ?auto_11517 ) ( not ( = ?auto_11514 ?auto_11516 ) ) ( not ( = ?auto_11514 ?auto_11517 ) ) ( not ( = ?auto_11515 ?auto_11516 ) ) ( not ( = ?auto_11515 ?auto_11517 ) ) ( not ( = ?auto_11516 ?auto_11517 ) ) ( ON ?auto_11516 ?auto_11515 ) ( CLEAR ?auto_11516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11514 ?auto_11515 )
      ( MAKE-1PILE ?auto_11514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11518 - BLOCK
    )
    :vars
    (
      ?auto_11519 - BLOCK
      ?auto_11520 - BLOCK
      ?auto_11521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11519 ?auto_11518 ) ( ON-TABLE ?auto_11518 ) ( not ( = ?auto_11518 ?auto_11519 ) ) ( not ( = ?auto_11518 ?auto_11520 ) ) ( not ( = ?auto_11518 ?auto_11521 ) ) ( not ( = ?auto_11519 ?auto_11520 ) ) ( not ( = ?auto_11519 ?auto_11521 ) ) ( not ( = ?auto_11520 ?auto_11521 ) ) ( ON ?auto_11520 ?auto_11519 ) ( CLEAR ?auto_11520 ) ( HOLDING ?auto_11521 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11521 )
      ( MAKE-1PILE ?auto_11518 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11522 - BLOCK
    )
    :vars
    (
      ?auto_11523 - BLOCK
      ?auto_11524 - BLOCK
      ?auto_11525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11523 ?auto_11522 ) ( ON-TABLE ?auto_11522 ) ( not ( = ?auto_11522 ?auto_11523 ) ) ( not ( = ?auto_11522 ?auto_11524 ) ) ( not ( = ?auto_11522 ?auto_11525 ) ) ( not ( = ?auto_11523 ?auto_11524 ) ) ( not ( = ?auto_11523 ?auto_11525 ) ) ( not ( = ?auto_11524 ?auto_11525 ) ) ( ON ?auto_11524 ?auto_11523 ) ( ON ?auto_11525 ?auto_11524 ) ( CLEAR ?auto_11525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11522 ?auto_11523 ?auto_11524 )
      ( MAKE-1PILE ?auto_11522 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11526 - BLOCK
    )
    :vars
    (
      ?auto_11527 - BLOCK
      ?auto_11528 - BLOCK
      ?auto_11529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11527 ?auto_11526 ) ( ON-TABLE ?auto_11526 ) ( not ( = ?auto_11526 ?auto_11527 ) ) ( not ( = ?auto_11526 ?auto_11528 ) ) ( not ( = ?auto_11526 ?auto_11529 ) ) ( not ( = ?auto_11527 ?auto_11528 ) ) ( not ( = ?auto_11527 ?auto_11529 ) ) ( not ( = ?auto_11528 ?auto_11529 ) ) ( ON ?auto_11528 ?auto_11527 ) ( HOLDING ?auto_11529 ) ( CLEAR ?auto_11528 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11526 ?auto_11527 ?auto_11528 ?auto_11529 )
      ( MAKE-1PILE ?auto_11526 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11530 - BLOCK
    )
    :vars
    (
      ?auto_11531 - BLOCK
      ?auto_11532 - BLOCK
      ?auto_11533 - BLOCK
      ?auto_11534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11531 ?auto_11530 ) ( ON-TABLE ?auto_11530 ) ( not ( = ?auto_11530 ?auto_11531 ) ) ( not ( = ?auto_11530 ?auto_11532 ) ) ( not ( = ?auto_11530 ?auto_11533 ) ) ( not ( = ?auto_11531 ?auto_11532 ) ) ( not ( = ?auto_11531 ?auto_11533 ) ) ( not ( = ?auto_11532 ?auto_11533 ) ) ( ON ?auto_11532 ?auto_11531 ) ( CLEAR ?auto_11532 ) ( ON ?auto_11533 ?auto_11534 ) ( CLEAR ?auto_11533 ) ( HAND-EMPTY ) ( not ( = ?auto_11530 ?auto_11534 ) ) ( not ( = ?auto_11531 ?auto_11534 ) ) ( not ( = ?auto_11532 ?auto_11534 ) ) ( not ( = ?auto_11533 ?auto_11534 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11533 ?auto_11534 )
      ( MAKE-1PILE ?auto_11530 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11535 - BLOCK
    )
    :vars
    (
      ?auto_11537 - BLOCK
      ?auto_11538 - BLOCK
      ?auto_11539 - BLOCK
      ?auto_11536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11537 ?auto_11535 ) ( ON-TABLE ?auto_11535 ) ( not ( = ?auto_11535 ?auto_11537 ) ) ( not ( = ?auto_11535 ?auto_11538 ) ) ( not ( = ?auto_11535 ?auto_11539 ) ) ( not ( = ?auto_11537 ?auto_11538 ) ) ( not ( = ?auto_11537 ?auto_11539 ) ) ( not ( = ?auto_11538 ?auto_11539 ) ) ( ON ?auto_11539 ?auto_11536 ) ( CLEAR ?auto_11539 ) ( not ( = ?auto_11535 ?auto_11536 ) ) ( not ( = ?auto_11537 ?auto_11536 ) ) ( not ( = ?auto_11538 ?auto_11536 ) ) ( not ( = ?auto_11539 ?auto_11536 ) ) ( HOLDING ?auto_11538 ) ( CLEAR ?auto_11537 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11535 ?auto_11537 ?auto_11538 )
      ( MAKE-1PILE ?auto_11535 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11540 - BLOCK
    )
    :vars
    (
      ?auto_11542 - BLOCK
      ?auto_11543 - BLOCK
      ?auto_11544 - BLOCK
      ?auto_11541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11542 ?auto_11540 ) ( ON-TABLE ?auto_11540 ) ( not ( = ?auto_11540 ?auto_11542 ) ) ( not ( = ?auto_11540 ?auto_11543 ) ) ( not ( = ?auto_11540 ?auto_11544 ) ) ( not ( = ?auto_11542 ?auto_11543 ) ) ( not ( = ?auto_11542 ?auto_11544 ) ) ( not ( = ?auto_11543 ?auto_11544 ) ) ( ON ?auto_11544 ?auto_11541 ) ( not ( = ?auto_11540 ?auto_11541 ) ) ( not ( = ?auto_11542 ?auto_11541 ) ) ( not ( = ?auto_11543 ?auto_11541 ) ) ( not ( = ?auto_11544 ?auto_11541 ) ) ( CLEAR ?auto_11542 ) ( ON ?auto_11543 ?auto_11544 ) ( CLEAR ?auto_11543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11541 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11541 ?auto_11544 )
      ( MAKE-1PILE ?auto_11540 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11555 - BLOCK
    )
    :vars
    (
      ?auto_11556 - BLOCK
      ?auto_11558 - BLOCK
      ?auto_11557 - BLOCK
      ?auto_11559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11555 ?auto_11556 ) ) ( not ( = ?auto_11555 ?auto_11558 ) ) ( not ( = ?auto_11555 ?auto_11557 ) ) ( not ( = ?auto_11556 ?auto_11558 ) ) ( not ( = ?auto_11556 ?auto_11557 ) ) ( not ( = ?auto_11558 ?auto_11557 ) ) ( ON ?auto_11557 ?auto_11559 ) ( not ( = ?auto_11555 ?auto_11559 ) ) ( not ( = ?auto_11556 ?auto_11559 ) ) ( not ( = ?auto_11558 ?auto_11559 ) ) ( not ( = ?auto_11557 ?auto_11559 ) ) ( ON ?auto_11558 ?auto_11557 ) ( ON-TABLE ?auto_11559 ) ( ON ?auto_11556 ?auto_11558 ) ( CLEAR ?auto_11556 ) ( HOLDING ?auto_11555 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11555 ?auto_11556 )
      ( MAKE-1PILE ?auto_11555 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11560 - BLOCK
    )
    :vars
    (
      ?auto_11561 - BLOCK
      ?auto_11563 - BLOCK
      ?auto_11562 - BLOCK
      ?auto_11564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11560 ?auto_11561 ) ) ( not ( = ?auto_11560 ?auto_11563 ) ) ( not ( = ?auto_11560 ?auto_11562 ) ) ( not ( = ?auto_11561 ?auto_11563 ) ) ( not ( = ?auto_11561 ?auto_11562 ) ) ( not ( = ?auto_11563 ?auto_11562 ) ) ( ON ?auto_11562 ?auto_11564 ) ( not ( = ?auto_11560 ?auto_11564 ) ) ( not ( = ?auto_11561 ?auto_11564 ) ) ( not ( = ?auto_11563 ?auto_11564 ) ) ( not ( = ?auto_11562 ?auto_11564 ) ) ( ON ?auto_11563 ?auto_11562 ) ( ON-TABLE ?auto_11564 ) ( ON ?auto_11561 ?auto_11563 ) ( ON ?auto_11560 ?auto_11561 ) ( CLEAR ?auto_11560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11564 ?auto_11562 ?auto_11563 ?auto_11561 )
      ( MAKE-1PILE ?auto_11560 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11568 - BLOCK
      ?auto_11569 - BLOCK
      ?auto_11570 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11570 ) ( CLEAR ?auto_11569 ) ( ON-TABLE ?auto_11568 ) ( ON ?auto_11569 ?auto_11568 ) ( not ( = ?auto_11568 ?auto_11569 ) ) ( not ( = ?auto_11568 ?auto_11570 ) ) ( not ( = ?auto_11569 ?auto_11570 ) ) )
    :subtasks
    ( ( !STACK ?auto_11570 ?auto_11569 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11571 - BLOCK
      ?auto_11572 - BLOCK
      ?auto_11573 - BLOCK
    )
    :vars
    (
      ?auto_11574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11572 ) ( ON-TABLE ?auto_11571 ) ( ON ?auto_11572 ?auto_11571 ) ( not ( = ?auto_11571 ?auto_11572 ) ) ( not ( = ?auto_11571 ?auto_11573 ) ) ( not ( = ?auto_11572 ?auto_11573 ) ) ( ON ?auto_11573 ?auto_11574 ) ( CLEAR ?auto_11573 ) ( HAND-EMPTY ) ( not ( = ?auto_11571 ?auto_11574 ) ) ( not ( = ?auto_11572 ?auto_11574 ) ) ( not ( = ?auto_11573 ?auto_11574 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11573 ?auto_11574 )
      ( MAKE-3PILE ?auto_11571 ?auto_11572 ?auto_11573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11575 - BLOCK
      ?auto_11576 - BLOCK
      ?auto_11577 - BLOCK
    )
    :vars
    (
      ?auto_11578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11575 ) ( not ( = ?auto_11575 ?auto_11576 ) ) ( not ( = ?auto_11575 ?auto_11577 ) ) ( not ( = ?auto_11576 ?auto_11577 ) ) ( ON ?auto_11577 ?auto_11578 ) ( CLEAR ?auto_11577 ) ( not ( = ?auto_11575 ?auto_11578 ) ) ( not ( = ?auto_11576 ?auto_11578 ) ) ( not ( = ?auto_11577 ?auto_11578 ) ) ( HOLDING ?auto_11576 ) ( CLEAR ?auto_11575 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11575 ?auto_11576 )
      ( MAKE-3PILE ?auto_11575 ?auto_11576 ?auto_11577 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11579 - BLOCK
      ?auto_11580 - BLOCK
      ?auto_11581 - BLOCK
    )
    :vars
    (
      ?auto_11582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11579 ) ( not ( = ?auto_11579 ?auto_11580 ) ) ( not ( = ?auto_11579 ?auto_11581 ) ) ( not ( = ?auto_11580 ?auto_11581 ) ) ( ON ?auto_11581 ?auto_11582 ) ( not ( = ?auto_11579 ?auto_11582 ) ) ( not ( = ?auto_11580 ?auto_11582 ) ) ( not ( = ?auto_11581 ?auto_11582 ) ) ( CLEAR ?auto_11579 ) ( ON ?auto_11580 ?auto_11581 ) ( CLEAR ?auto_11580 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11582 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11582 ?auto_11581 )
      ( MAKE-3PILE ?auto_11579 ?auto_11580 ?auto_11581 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11583 - BLOCK
      ?auto_11584 - BLOCK
      ?auto_11585 - BLOCK
    )
    :vars
    (
      ?auto_11586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11583 ?auto_11584 ) ) ( not ( = ?auto_11583 ?auto_11585 ) ) ( not ( = ?auto_11584 ?auto_11585 ) ) ( ON ?auto_11585 ?auto_11586 ) ( not ( = ?auto_11583 ?auto_11586 ) ) ( not ( = ?auto_11584 ?auto_11586 ) ) ( not ( = ?auto_11585 ?auto_11586 ) ) ( ON ?auto_11584 ?auto_11585 ) ( CLEAR ?auto_11584 ) ( ON-TABLE ?auto_11586 ) ( HOLDING ?auto_11583 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11583 )
      ( MAKE-3PILE ?auto_11583 ?auto_11584 ?auto_11585 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11587 - BLOCK
      ?auto_11588 - BLOCK
      ?auto_11589 - BLOCK
    )
    :vars
    (
      ?auto_11590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11587 ?auto_11588 ) ) ( not ( = ?auto_11587 ?auto_11589 ) ) ( not ( = ?auto_11588 ?auto_11589 ) ) ( ON ?auto_11589 ?auto_11590 ) ( not ( = ?auto_11587 ?auto_11590 ) ) ( not ( = ?auto_11588 ?auto_11590 ) ) ( not ( = ?auto_11589 ?auto_11590 ) ) ( ON ?auto_11588 ?auto_11589 ) ( ON-TABLE ?auto_11590 ) ( ON ?auto_11587 ?auto_11588 ) ( CLEAR ?auto_11587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11590 ?auto_11589 ?auto_11588 )
      ( MAKE-3PILE ?auto_11587 ?auto_11588 ?auto_11589 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11591 - BLOCK
      ?auto_11592 - BLOCK
      ?auto_11593 - BLOCK
    )
    :vars
    (
      ?auto_11594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11591 ?auto_11592 ) ) ( not ( = ?auto_11591 ?auto_11593 ) ) ( not ( = ?auto_11592 ?auto_11593 ) ) ( ON ?auto_11593 ?auto_11594 ) ( not ( = ?auto_11591 ?auto_11594 ) ) ( not ( = ?auto_11592 ?auto_11594 ) ) ( not ( = ?auto_11593 ?auto_11594 ) ) ( ON ?auto_11592 ?auto_11593 ) ( ON-TABLE ?auto_11594 ) ( HOLDING ?auto_11591 ) ( CLEAR ?auto_11592 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11594 ?auto_11593 ?auto_11592 ?auto_11591 )
      ( MAKE-3PILE ?auto_11591 ?auto_11592 ?auto_11593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11595 - BLOCK
      ?auto_11596 - BLOCK
      ?auto_11597 - BLOCK
    )
    :vars
    (
      ?auto_11598 - BLOCK
      ?auto_11599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11595 ?auto_11596 ) ) ( not ( = ?auto_11595 ?auto_11597 ) ) ( not ( = ?auto_11596 ?auto_11597 ) ) ( ON ?auto_11597 ?auto_11598 ) ( not ( = ?auto_11595 ?auto_11598 ) ) ( not ( = ?auto_11596 ?auto_11598 ) ) ( not ( = ?auto_11597 ?auto_11598 ) ) ( ON ?auto_11596 ?auto_11597 ) ( ON-TABLE ?auto_11598 ) ( CLEAR ?auto_11596 ) ( ON ?auto_11595 ?auto_11599 ) ( CLEAR ?auto_11595 ) ( HAND-EMPTY ) ( not ( = ?auto_11595 ?auto_11599 ) ) ( not ( = ?auto_11596 ?auto_11599 ) ) ( not ( = ?auto_11597 ?auto_11599 ) ) ( not ( = ?auto_11598 ?auto_11599 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11595 ?auto_11599 )
      ( MAKE-3PILE ?auto_11595 ?auto_11596 ?auto_11597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11600 - BLOCK
      ?auto_11601 - BLOCK
      ?auto_11602 - BLOCK
    )
    :vars
    (
      ?auto_11604 - BLOCK
      ?auto_11603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11600 ?auto_11601 ) ) ( not ( = ?auto_11600 ?auto_11602 ) ) ( not ( = ?auto_11601 ?auto_11602 ) ) ( ON ?auto_11602 ?auto_11604 ) ( not ( = ?auto_11600 ?auto_11604 ) ) ( not ( = ?auto_11601 ?auto_11604 ) ) ( not ( = ?auto_11602 ?auto_11604 ) ) ( ON-TABLE ?auto_11604 ) ( ON ?auto_11600 ?auto_11603 ) ( CLEAR ?auto_11600 ) ( not ( = ?auto_11600 ?auto_11603 ) ) ( not ( = ?auto_11601 ?auto_11603 ) ) ( not ( = ?auto_11602 ?auto_11603 ) ) ( not ( = ?auto_11604 ?auto_11603 ) ) ( HOLDING ?auto_11601 ) ( CLEAR ?auto_11602 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11604 ?auto_11602 ?auto_11601 )
      ( MAKE-3PILE ?auto_11600 ?auto_11601 ?auto_11602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11605 - BLOCK
      ?auto_11606 - BLOCK
      ?auto_11607 - BLOCK
    )
    :vars
    (
      ?auto_11608 - BLOCK
      ?auto_11609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11605 ?auto_11606 ) ) ( not ( = ?auto_11605 ?auto_11607 ) ) ( not ( = ?auto_11606 ?auto_11607 ) ) ( ON ?auto_11607 ?auto_11608 ) ( not ( = ?auto_11605 ?auto_11608 ) ) ( not ( = ?auto_11606 ?auto_11608 ) ) ( not ( = ?auto_11607 ?auto_11608 ) ) ( ON-TABLE ?auto_11608 ) ( ON ?auto_11605 ?auto_11609 ) ( not ( = ?auto_11605 ?auto_11609 ) ) ( not ( = ?auto_11606 ?auto_11609 ) ) ( not ( = ?auto_11607 ?auto_11609 ) ) ( not ( = ?auto_11608 ?auto_11609 ) ) ( CLEAR ?auto_11607 ) ( ON ?auto_11606 ?auto_11605 ) ( CLEAR ?auto_11606 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11609 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11609 ?auto_11605 )
      ( MAKE-3PILE ?auto_11605 ?auto_11606 ?auto_11607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11610 - BLOCK
      ?auto_11611 - BLOCK
      ?auto_11612 - BLOCK
    )
    :vars
    (
      ?auto_11614 - BLOCK
      ?auto_11613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11610 ?auto_11611 ) ) ( not ( = ?auto_11610 ?auto_11612 ) ) ( not ( = ?auto_11611 ?auto_11612 ) ) ( not ( = ?auto_11610 ?auto_11614 ) ) ( not ( = ?auto_11611 ?auto_11614 ) ) ( not ( = ?auto_11612 ?auto_11614 ) ) ( ON-TABLE ?auto_11614 ) ( ON ?auto_11610 ?auto_11613 ) ( not ( = ?auto_11610 ?auto_11613 ) ) ( not ( = ?auto_11611 ?auto_11613 ) ) ( not ( = ?auto_11612 ?auto_11613 ) ) ( not ( = ?auto_11614 ?auto_11613 ) ) ( ON ?auto_11611 ?auto_11610 ) ( CLEAR ?auto_11611 ) ( ON-TABLE ?auto_11613 ) ( HOLDING ?auto_11612 ) ( CLEAR ?auto_11614 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11614 ?auto_11612 )
      ( MAKE-3PILE ?auto_11610 ?auto_11611 ?auto_11612 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11615 - BLOCK
      ?auto_11616 - BLOCK
      ?auto_11617 - BLOCK
    )
    :vars
    (
      ?auto_11618 - BLOCK
      ?auto_11619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11615 ?auto_11616 ) ) ( not ( = ?auto_11615 ?auto_11617 ) ) ( not ( = ?auto_11616 ?auto_11617 ) ) ( not ( = ?auto_11615 ?auto_11618 ) ) ( not ( = ?auto_11616 ?auto_11618 ) ) ( not ( = ?auto_11617 ?auto_11618 ) ) ( ON-TABLE ?auto_11618 ) ( ON ?auto_11615 ?auto_11619 ) ( not ( = ?auto_11615 ?auto_11619 ) ) ( not ( = ?auto_11616 ?auto_11619 ) ) ( not ( = ?auto_11617 ?auto_11619 ) ) ( not ( = ?auto_11618 ?auto_11619 ) ) ( ON ?auto_11616 ?auto_11615 ) ( ON-TABLE ?auto_11619 ) ( CLEAR ?auto_11618 ) ( ON ?auto_11617 ?auto_11616 ) ( CLEAR ?auto_11617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11619 ?auto_11615 ?auto_11616 )
      ( MAKE-3PILE ?auto_11615 ?auto_11616 ?auto_11617 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11620 - BLOCK
      ?auto_11621 - BLOCK
      ?auto_11622 - BLOCK
    )
    :vars
    (
      ?auto_11624 - BLOCK
      ?auto_11623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11620 ?auto_11621 ) ) ( not ( = ?auto_11620 ?auto_11622 ) ) ( not ( = ?auto_11621 ?auto_11622 ) ) ( not ( = ?auto_11620 ?auto_11624 ) ) ( not ( = ?auto_11621 ?auto_11624 ) ) ( not ( = ?auto_11622 ?auto_11624 ) ) ( ON ?auto_11620 ?auto_11623 ) ( not ( = ?auto_11620 ?auto_11623 ) ) ( not ( = ?auto_11621 ?auto_11623 ) ) ( not ( = ?auto_11622 ?auto_11623 ) ) ( not ( = ?auto_11624 ?auto_11623 ) ) ( ON ?auto_11621 ?auto_11620 ) ( ON-TABLE ?auto_11623 ) ( ON ?auto_11622 ?auto_11621 ) ( CLEAR ?auto_11622 ) ( HOLDING ?auto_11624 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11624 )
      ( MAKE-3PILE ?auto_11620 ?auto_11621 ?auto_11622 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11625 - BLOCK
      ?auto_11626 - BLOCK
      ?auto_11627 - BLOCK
    )
    :vars
    (
      ?auto_11628 - BLOCK
      ?auto_11629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11625 ?auto_11626 ) ) ( not ( = ?auto_11625 ?auto_11627 ) ) ( not ( = ?auto_11626 ?auto_11627 ) ) ( not ( = ?auto_11625 ?auto_11628 ) ) ( not ( = ?auto_11626 ?auto_11628 ) ) ( not ( = ?auto_11627 ?auto_11628 ) ) ( ON ?auto_11625 ?auto_11629 ) ( not ( = ?auto_11625 ?auto_11629 ) ) ( not ( = ?auto_11626 ?auto_11629 ) ) ( not ( = ?auto_11627 ?auto_11629 ) ) ( not ( = ?auto_11628 ?auto_11629 ) ) ( ON ?auto_11626 ?auto_11625 ) ( ON-TABLE ?auto_11629 ) ( ON ?auto_11627 ?auto_11626 ) ( ON ?auto_11628 ?auto_11627 ) ( CLEAR ?auto_11628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11629 ?auto_11625 ?auto_11626 ?auto_11627 )
      ( MAKE-3PILE ?auto_11625 ?auto_11626 ?auto_11627 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11634 - BLOCK
      ?auto_11635 - BLOCK
      ?auto_11636 - BLOCK
      ?auto_11637 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11637 ) ( CLEAR ?auto_11636 ) ( ON-TABLE ?auto_11634 ) ( ON ?auto_11635 ?auto_11634 ) ( ON ?auto_11636 ?auto_11635 ) ( not ( = ?auto_11634 ?auto_11635 ) ) ( not ( = ?auto_11634 ?auto_11636 ) ) ( not ( = ?auto_11634 ?auto_11637 ) ) ( not ( = ?auto_11635 ?auto_11636 ) ) ( not ( = ?auto_11635 ?auto_11637 ) ) ( not ( = ?auto_11636 ?auto_11637 ) ) )
    :subtasks
    ( ( !STACK ?auto_11637 ?auto_11636 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11638 - BLOCK
      ?auto_11639 - BLOCK
      ?auto_11640 - BLOCK
      ?auto_11641 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11640 ) ( ON-TABLE ?auto_11638 ) ( ON ?auto_11639 ?auto_11638 ) ( ON ?auto_11640 ?auto_11639 ) ( not ( = ?auto_11638 ?auto_11639 ) ) ( not ( = ?auto_11638 ?auto_11640 ) ) ( not ( = ?auto_11638 ?auto_11641 ) ) ( not ( = ?auto_11639 ?auto_11640 ) ) ( not ( = ?auto_11639 ?auto_11641 ) ) ( not ( = ?auto_11640 ?auto_11641 ) ) ( ON-TABLE ?auto_11641 ) ( CLEAR ?auto_11641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_11641 )
      ( MAKE-4PILE ?auto_11638 ?auto_11639 ?auto_11640 ?auto_11641 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11642 - BLOCK
      ?auto_11643 - BLOCK
      ?auto_11644 - BLOCK
      ?auto_11645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11642 ) ( ON ?auto_11643 ?auto_11642 ) ( not ( = ?auto_11642 ?auto_11643 ) ) ( not ( = ?auto_11642 ?auto_11644 ) ) ( not ( = ?auto_11642 ?auto_11645 ) ) ( not ( = ?auto_11643 ?auto_11644 ) ) ( not ( = ?auto_11643 ?auto_11645 ) ) ( not ( = ?auto_11644 ?auto_11645 ) ) ( ON-TABLE ?auto_11645 ) ( CLEAR ?auto_11645 ) ( HOLDING ?auto_11644 ) ( CLEAR ?auto_11643 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11642 ?auto_11643 ?auto_11644 )
      ( MAKE-4PILE ?auto_11642 ?auto_11643 ?auto_11644 ?auto_11645 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11646 - BLOCK
      ?auto_11647 - BLOCK
      ?auto_11648 - BLOCK
      ?auto_11649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11646 ) ( ON ?auto_11647 ?auto_11646 ) ( not ( = ?auto_11646 ?auto_11647 ) ) ( not ( = ?auto_11646 ?auto_11648 ) ) ( not ( = ?auto_11646 ?auto_11649 ) ) ( not ( = ?auto_11647 ?auto_11648 ) ) ( not ( = ?auto_11647 ?auto_11649 ) ) ( not ( = ?auto_11648 ?auto_11649 ) ) ( ON-TABLE ?auto_11649 ) ( CLEAR ?auto_11647 ) ( ON ?auto_11648 ?auto_11649 ) ( CLEAR ?auto_11648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11649 )
      ( MAKE-4PILE ?auto_11646 ?auto_11647 ?auto_11648 ?auto_11649 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11650 - BLOCK
      ?auto_11651 - BLOCK
      ?auto_11652 - BLOCK
      ?auto_11653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11650 ) ( not ( = ?auto_11650 ?auto_11651 ) ) ( not ( = ?auto_11650 ?auto_11652 ) ) ( not ( = ?auto_11650 ?auto_11653 ) ) ( not ( = ?auto_11651 ?auto_11652 ) ) ( not ( = ?auto_11651 ?auto_11653 ) ) ( not ( = ?auto_11652 ?auto_11653 ) ) ( ON-TABLE ?auto_11653 ) ( ON ?auto_11652 ?auto_11653 ) ( CLEAR ?auto_11652 ) ( HOLDING ?auto_11651 ) ( CLEAR ?auto_11650 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11650 ?auto_11651 )
      ( MAKE-4PILE ?auto_11650 ?auto_11651 ?auto_11652 ?auto_11653 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11654 - BLOCK
      ?auto_11655 - BLOCK
      ?auto_11656 - BLOCK
      ?auto_11657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11654 ) ( not ( = ?auto_11654 ?auto_11655 ) ) ( not ( = ?auto_11654 ?auto_11656 ) ) ( not ( = ?auto_11654 ?auto_11657 ) ) ( not ( = ?auto_11655 ?auto_11656 ) ) ( not ( = ?auto_11655 ?auto_11657 ) ) ( not ( = ?auto_11656 ?auto_11657 ) ) ( ON-TABLE ?auto_11657 ) ( ON ?auto_11656 ?auto_11657 ) ( CLEAR ?auto_11654 ) ( ON ?auto_11655 ?auto_11656 ) ( CLEAR ?auto_11655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11657 ?auto_11656 )
      ( MAKE-4PILE ?auto_11654 ?auto_11655 ?auto_11656 ?auto_11657 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11658 - BLOCK
      ?auto_11659 - BLOCK
      ?auto_11660 - BLOCK
      ?auto_11661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11658 ?auto_11659 ) ) ( not ( = ?auto_11658 ?auto_11660 ) ) ( not ( = ?auto_11658 ?auto_11661 ) ) ( not ( = ?auto_11659 ?auto_11660 ) ) ( not ( = ?auto_11659 ?auto_11661 ) ) ( not ( = ?auto_11660 ?auto_11661 ) ) ( ON-TABLE ?auto_11661 ) ( ON ?auto_11660 ?auto_11661 ) ( ON ?auto_11659 ?auto_11660 ) ( CLEAR ?auto_11659 ) ( HOLDING ?auto_11658 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11658 )
      ( MAKE-4PILE ?auto_11658 ?auto_11659 ?auto_11660 ?auto_11661 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11662 - BLOCK
      ?auto_11663 - BLOCK
      ?auto_11664 - BLOCK
      ?auto_11665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11662 ?auto_11663 ) ) ( not ( = ?auto_11662 ?auto_11664 ) ) ( not ( = ?auto_11662 ?auto_11665 ) ) ( not ( = ?auto_11663 ?auto_11664 ) ) ( not ( = ?auto_11663 ?auto_11665 ) ) ( not ( = ?auto_11664 ?auto_11665 ) ) ( ON-TABLE ?auto_11665 ) ( ON ?auto_11664 ?auto_11665 ) ( ON ?auto_11663 ?auto_11664 ) ( ON ?auto_11662 ?auto_11663 ) ( CLEAR ?auto_11662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11665 ?auto_11664 ?auto_11663 )
      ( MAKE-4PILE ?auto_11662 ?auto_11663 ?auto_11664 ?auto_11665 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11666 - BLOCK
      ?auto_11667 - BLOCK
      ?auto_11668 - BLOCK
      ?auto_11669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11666 ?auto_11667 ) ) ( not ( = ?auto_11666 ?auto_11668 ) ) ( not ( = ?auto_11666 ?auto_11669 ) ) ( not ( = ?auto_11667 ?auto_11668 ) ) ( not ( = ?auto_11667 ?auto_11669 ) ) ( not ( = ?auto_11668 ?auto_11669 ) ) ( ON-TABLE ?auto_11669 ) ( ON ?auto_11668 ?auto_11669 ) ( ON ?auto_11667 ?auto_11668 ) ( HOLDING ?auto_11666 ) ( CLEAR ?auto_11667 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11669 ?auto_11668 ?auto_11667 ?auto_11666 )
      ( MAKE-4PILE ?auto_11666 ?auto_11667 ?auto_11668 ?auto_11669 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11670 - BLOCK
      ?auto_11671 - BLOCK
      ?auto_11672 - BLOCK
      ?auto_11673 - BLOCK
    )
    :vars
    (
      ?auto_11674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11670 ?auto_11671 ) ) ( not ( = ?auto_11670 ?auto_11672 ) ) ( not ( = ?auto_11670 ?auto_11673 ) ) ( not ( = ?auto_11671 ?auto_11672 ) ) ( not ( = ?auto_11671 ?auto_11673 ) ) ( not ( = ?auto_11672 ?auto_11673 ) ) ( ON-TABLE ?auto_11673 ) ( ON ?auto_11672 ?auto_11673 ) ( ON ?auto_11671 ?auto_11672 ) ( CLEAR ?auto_11671 ) ( ON ?auto_11670 ?auto_11674 ) ( CLEAR ?auto_11670 ) ( HAND-EMPTY ) ( not ( = ?auto_11670 ?auto_11674 ) ) ( not ( = ?auto_11671 ?auto_11674 ) ) ( not ( = ?auto_11672 ?auto_11674 ) ) ( not ( = ?auto_11673 ?auto_11674 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11670 ?auto_11674 )
      ( MAKE-4PILE ?auto_11670 ?auto_11671 ?auto_11672 ?auto_11673 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11675 - BLOCK
      ?auto_11676 - BLOCK
      ?auto_11677 - BLOCK
      ?auto_11678 - BLOCK
    )
    :vars
    (
      ?auto_11679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11675 ?auto_11676 ) ) ( not ( = ?auto_11675 ?auto_11677 ) ) ( not ( = ?auto_11675 ?auto_11678 ) ) ( not ( = ?auto_11676 ?auto_11677 ) ) ( not ( = ?auto_11676 ?auto_11678 ) ) ( not ( = ?auto_11677 ?auto_11678 ) ) ( ON-TABLE ?auto_11678 ) ( ON ?auto_11677 ?auto_11678 ) ( ON ?auto_11675 ?auto_11679 ) ( CLEAR ?auto_11675 ) ( not ( = ?auto_11675 ?auto_11679 ) ) ( not ( = ?auto_11676 ?auto_11679 ) ) ( not ( = ?auto_11677 ?auto_11679 ) ) ( not ( = ?auto_11678 ?auto_11679 ) ) ( HOLDING ?auto_11676 ) ( CLEAR ?auto_11677 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11678 ?auto_11677 ?auto_11676 )
      ( MAKE-4PILE ?auto_11675 ?auto_11676 ?auto_11677 ?auto_11678 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11680 - BLOCK
      ?auto_11681 - BLOCK
      ?auto_11682 - BLOCK
      ?auto_11683 - BLOCK
    )
    :vars
    (
      ?auto_11684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11680 ?auto_11681 ) ) ( not ( = ?auto_11680 ?auto_11682 ) ) ( not ( = ?auto_11680 ?auto_11683 ) ) ( not ( = ?auto_11681 ?auto_11682 ) ) ( not ( = ?auto_11681 ?auto_11683 ) ) ( not ( = ?auto_11682 ?auto_11683 ) ) ( ON-TABLE ?auto_11683 ) ( ON ?auto_11682 ?auto_11683 ) ( ON ?auto_11680 ?auto_11684 ) ( not ( = ?auto_11680 ?auto_11684 ) ) ( not ( = ?auto_11681 ?auto_11684 ) ) ( not ( = ?auto_11682 ?auto_11684 ) ) ( not ( = ?auto_11683 ?auto_11684 ) ) ( CLEAR ?auto_11682 ) ( ON ?auto_11681 ?auto_11680 ) ( CLEAR ?auto_11681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11684 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11684 ?auto_11680 )
      ( MAKE-4PILE ?auto_11680 ?auto_11681 ?auto_11682 ?auto_11683 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11685 - BLOCK
      ?auto_11686 - BLOCK
      ?auto_11687 - BLOCK
      ?auto_11688 - BLOCK
    )
    :vars
    (
      ?auto_11689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11685 ?auto_11686 ) ) ( not ( = ?auto_11685 ?auto_11687 ) ) ( not ( = ?auto_11685 ?auto_11688 ) ) ( not ( = ?auto_11686 ?auto_11687 ) ) ( not ( = ?auto_11686 ?auto_11688 ) ) ( not ( = ?auto_11687 ?auto_11688 ) ) ( ON-TABLE ?auto_11688 ) ( ON ?auto_11685 ?auto_11689 ) ( not ( = ?auto_11685 ?auto_11689 ) ) ( not ( = ?auto_11686 ?auto_11689 ) ) ( not ( = ?auto_11687 ?auto_11689 ) ) ( not ( = ?auto_11688 ?auto_11689 ) ) ( ON ?auto_11686 ?auto_11685 ) ( CLEAR ?auto_11686 ) ( ON-TABLE ?auto_11689 ) ( HOLDING ?auto_11687 ) ( CLEAR ?auto_11688 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11688 ?auto_11687 )
      ( MAKE-4PILE ?auto_11685 ?auto_11686 ?auto_11687 ?auto_11688 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11690 - BLOCK
      ?auto_11691 - BLOCK
      ?auto_11692 - BLOCK
      ?auto_11693 - BLOCK
    )
    :vars
    (
      ?auto_11694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11690 ?auto_11691 ) ) ( not ( = ?auto_11690 ?auto_11692 ) ) ( not ( = ?auto_11690 ?auto_11693 ) ) ( not ( = ?auto_11691 ?auto_11692 ) ) ( not ( = ?auto_11691 ?auto_11693 ) ) ( not ( = ?auto_11692 ?auto_11693 ) ) ( ON-TABLE ?auto_11693 ) ( ON ?auto_11690 ?auto_11694 ) ( not ( = ?auto_11690 ?auto_11694 ) ) ( not ( = ?auto_11691 ?auto_11694 ) ) ( not ( = ?auto_11692 ?auto_11694 ) ) ( not ( = ?auto_11693 ?auto_11694 ) ) ( ON ?auto_11691 ?auto_11690 ) ( ON-TABLE ?auto_11694 ) ( CLEAR ?auto_11693 ) ( ON ?auto_11692 ?auto_11691 ) ( CLEAR ?auto_11692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11694 ?auto_11690 ?auto_11691 )
      ( MAKE-4PILE ?auto_11690 ?auto_11691 ?auto_11692 ?auto_11693 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11695 - BLOCK
      ?auto_11696 - BLOCK
      ?auto_11697 - BLOCK
      ?auto_11698 - BLOCK
    )
    :vars
    (
      ?auto_11699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11695 ?auto_11696 ) ) ( not ( = ?auto_11695 ?auto_11697 ) ) ( not ( = ?auto_11695 ?auto_11698 ) ) ( not ( = ?auto_11696 ?auto_11697 ) ) ( not ( = ?auto_11696 ?auto_11698 ) ) ( not ( = ?auto_11697 ?auto_11698 ) ) ( ON ?auto_11695 ?auto_11699 ) ( not ( = ?auto_11695 ?auto_11699 ) ) ( not ( = ?auto_11696 ?auto_11699 ) ) ( not ( = ?auto_11697 ?auto_11699 ) ) ( not ( = ?auto_11698 ?auto_11699 ) ) ( ON ?auto_11696 ?auto_11695 ) ( ON-TABLE ?auto_11699 ) ( ON ?auto_11697 ?auto_11696 ) ( CLEAR ?auto_11697 ) ( HOLDING ?auto_11698 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11698 )
      ( MAKE-4PILE ?auto_11695 ?auto_11696 ?auto_11697 ?auto_11698 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11700 - BLOCK
      ?auto_11701 - BLOCK
      ?auto_11702 - BLOCK
      ?auto_11703 - BLOCK
    )
    :vars
    (
      ?auto_11704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11700 ?auto_11701 ) ) ( not ( = ?auto_11700 ?auto_11702 ) ) ( not ( = ?auto_11700 ?auto_11703 ) ) ( not ( = ?auto_11701 ?auto_11702 ) ) ( not ( = ?auto_11701 ?auto_11703 ) ) ( not ( = ?auto_11702 ?auto_11703 ) ) ( ON ?auto_11700 ?auto_11704 ) ( not ( = ?auto_11700 ?auto_11704 ) ) ( not ( = ?auto_11701 ?auto_11704 ) ) ( not ( = ?auto_11702 ?auto_11704 ) ) ( not ( = ?auto_11703 ?auto_11704 ) ) ( ON ?auto_11701 ?auto_11700 ) ( ON-TABLE ?auto_11704 ) ( ON ?auto_11702 ?auto_11701 ) ( ON ?auto_11703 ?auto_11702 ) ( CLEAR ?auto_11703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11704 ?auto_11700 ?auto_11701 ?auto_11702 )
      ( MAKE-4PILE ?auto_11700 ?auto_11701 ?auto_11702 ?auto_11703 ) )
  )

)

