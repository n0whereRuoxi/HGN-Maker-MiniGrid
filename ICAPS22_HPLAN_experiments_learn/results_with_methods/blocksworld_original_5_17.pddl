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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36149 - BLOCK
      ?auto_36150 - BLOCK
      ?auto_36151 - BLOCK
      ?auto_36152 - BLOCK
      ?auto_36153 - BLOCK
    )
    :vars
    (
      ?auto_36154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36154 ?auto_36153 ) ( CLEAR ?auto_36154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36149 ) ( ON ?auto_36150 ?auto_36149 ) ( ON ?auto_36151 ?auto_36150 ) ( ON ?auto_36152 ?auto_36151 ) ( ON ?auto_36153 ?auto_36152 ) ( not ( = ?auto_36149 ?auto_36150 ) ) ( not ( = ?auto_36149 ?auto_36151 ) ) ( not ( = ?auto_36149 ?auto_36152 ) ) ( not ( = ?auto_36149 ?auto_36153 ) ) ( not ( = ?auto_36149 ?auto_36154 ) ) ( not ( = ?auto_36150 ?auto_36151 ) ) ( not ( = ?auto_36150 ?auto_36152 ) ) ( not ( = ?auto_36150 ?auto_36153 ) ) ( not ( = ?auto_36150 ?auto_36154 ) ) ( not ( = ?auto_36151 ?auto_36152 ) ) ( not ( = ?auto_36151 ?auto_36153 ) ) ( not ( = ?auto_36151 ?auto_36154 ) ) ( not ( = ?auto_36152 ?auto_36153 ) ) ( not ( = ?auto_36152 ?auto_36154 ) ) ( not ( = ?auto_36153 ?auto_36154 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36154 ?auto_36153 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36156 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36156 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_36156 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36157 - BLOCK
    )
    :vars
    (
      ?auto_36158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36157 ?auto_36158 ) ( CLEAR ?auto_36157 ) ( HAND-EMPTY ) ( not ( = ?auto_36157 ?auto_36158 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36157 ?auto_36158 )
      ( MAKE-1PILE ?auto_36157 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36163 - BLOCK
      ?auto_36164 - BLOCK
      ?auto_36165 - BLOCK
      ?auto_36166 - BLOCK
    )
    :vars
    (
      ?auto_36167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36167 ?auto_36166 ) ( CLEAR ?auto_36167 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36163 ) ( ON ?auto_36164 ?auto_36163 ) ( ON ?auto_36165 ?auto_36164 ) ( ON ?auto_36166 ?auto_36165 ) ( not ( = ?auto_36163 ?auto_36164 ) ) ( not ( = ?auto_36163 ?auto_36165 ) ) ( not ( = ?auto_36163 ?auto_36166 ) ) ( not ( = ?auto_36163 ?auto_36167 ) ) ( not ( = ?auto_36164 ?auto_36165 ) ) ( not ( = ?auto_36164 ?auto_36166 ) ) ( not ( = ?auto_36164 ?auto_36167 ) ) ( not ( = ?auto_36165 ?auto_36166 ) ) ( not ( = ?auto_36165 ?auto_36167 ) ) ( not ( = ?auto_36166 ?auto_36167 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36167 ?auto_36166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36168 - BLOCK
      ?auto_36169 - BLOCK
      ?auto_36170 - BLOCK
      ?auto_36171 - BLOCK
    )
    :vars
    (
      ?auto_36172 - BLOCK
      ?auto_36173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36172 ?auto_36171 ) ( CLEAR ?auto_36172 ) ( ON-TABLE ?auto_36168 ) ( ON ?auto_36169 ?auto_36168 ) ( ON ?auto_36170 ?auto_36169 ) ( ON ?auto_36171 ?auto_36170 ) ( not ( = ?auto_36168 ?auto_36169 ) ) ( not ( = ?auto_36168 ?auto_36170 ) ) ( not ( = ?auto_36168 ?auto_36171 ) ) ( not ( = ?auto_36168 ?auto_36172 ) ) ( not ( = ?auto_36169 ?auto_36170 ) ) ( not ( = ?auto_36169 ?auto_36171 ) ) ( not ( = ?auto_36169 ?auto_36172 ) ) ( not ( = ?auto_36170 ?auto_36171 ) ) ( not ( = ?auto_36170 ?auto_36172 ) ) ( not ( = ?auto_36171 ?auto_36172 ) ) ( HOLDING ?auto_36173 ) ( not ( = ?auto_36168 ?auto_36173 ) ) ( not ( = ?auto_36169 ?auto_36173 ) ) ( not ( = ?auto_36170 ?auto_36173 ) ) ( not ( = ?auto_36171 ?auto_36173 ) ) ( not ( = ?auto_36172 ?auto_36173 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_36173 )
      ( MAKE-4PILE ?auto_36168 ?auto_36169 ?auto_36170 ?auto_36171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36174 - BLOCK
      ?auto_36175 - BLOCK
      ?auto_36176 - BLOCK
      ?auto_36177 - BLOCK
    )
    :vars
    (
      ?auto_36179 - BLOCK
      ?auto_36178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36179 ?auto_36177 ) ( ON-TABLE ?auto_36174 ) ( ON ?auto_36175 ?auto_36174 ) ( ON ?auto_36176 ?auto_36175 ) ( ON ?auto_36177 ?auto_36176 ) ( not ( = ?auto_36174 ?auto_36175 ) ) ( not ( = ?auto_36174 ?auto_36176 ) ) ( not ( = ?auto_36174 ?auto_36177 ) ) ( not ( = ?auto_36174 ?auto_36179 ) ) ( not ( = ?auto_36175 ?auto_36176 ) ) ( not ( = ?auto_36175 ?auto_36177 ) ) ( not ( = ?auto_36175 ?auto_36179 ) ) ( not ( = ?auto_36176 ?auto_36177 ) ) ( not ( = ?auto_36176 ?auto_36179 ) ) ( not ( = ?auto_36177 ?auto_36179 ) ) ( not ( = ?auto_36174 ?auto_36178 ) ) ( not ( = ?auto_36175 ?auto_36178 ) ) ( not ( = ?auto_36176 ?auto_36178 ) ) ( not ( = ?auto_36177 ?auto_36178 ) ) ( not ( = ?auto_36179 ?auto_36178 ) ) ( ON ?auto_36178 ?auto_36179 ) ( CLEAR ?auto_36178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36174 ?auto_36175 ?auto_36176 ?auto_36177 ?auto_36179 )
      ( MAKE-4PILE ?auto_36174 ?auto_36175 ?auto_36176 ?auto_36177 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36182 - BLOCK
      ?auto_36183 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36183 ) ( CLEAR ?auto_36182 ) ( ON-TABLE ?auto_36182 ) ( not ( = ?auto_36182 ?auto_36183 ) ) )
    :subtasks
    ( ( !STACK ?auto_36183 ?auto_36182 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36184 - BLOCK
      ?auto_36185 - BLOCK
    )
    :vars
    (
      ?auto_36186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36184 ) ( ON-TABLE ?auto_36184 ) ( not ( = ?auto_36184 ?auto_36185 ) ) ( ON ?auto_36185 ?auto_36186 ) ( CLEAR ?auto_36185 ) ( HAND-EMPTY ) ( not ( = ?auto_36184 ?auto_36186 ) ) ( not ( = ?auto_36185 ?auto_36186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36185 ?auto_36186 )
      ( MAKE-2PILE ?auto_36184 ?auto_36185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36187 - BLOCK
      ?auto_36188 - BLOCK
    )
    :vars
    (
      ?auto_36189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36187 ?auto_36188 ) ) ( ON ?auto_36188 ?auto_36189 ) ( CLEAR ?auto_36188 ) ( not ( = ?auto_36187 ?auto_36189 ) ) ( not ( = ?auto_36188 ?auto_36189 ) ) ( HOLDING ?auto_36187 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36187 )
      ( MAKE-2PILE ?auto_36187 ?auto_36188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36190 - BLOCK
      ?auto_36191 - BLOCK
    )
    :vars
    (
      ?auto_36192 - BLOCK
      ?auto_36193 - BLOCK
      ?auto_36195 - BLOCK
      ?auto_36194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36190 ?auto_36191 ) ) ( ON ?auto_36191 ?auto_36192 ) ( not ( = ?auto_36190 ?auto_36192 ) ) ( not ( = ?auto_36191 ?auto_36192 ) ) ( ON ?auto_36190 ?auto_36191 ) ( CLEAR ?auto_36190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36193 ) ( ON ?auto_36195 ?auto_36193 ) ( ON ?auto_36194 ?auto_36195 ) ( ON ?auto_36192 ?auto_36194 ) ( not ( = ?auto_36193 ?auto_36195 ) ) ( not ( = ?auto_36193 ?auto_36194 ) ) ( not ( = ?auto_36193 ?auto_36192 ) ) ( not ( = ?auto_36193 ?auto_36191 ) ) ( not ( = ?auto_36193 ?auto_36190 ) ) ( not ( = ?auto_36195 ?auto_36194 ) ) ( not ( = ?auto_36195 ?auto_36192 ) ) ( not ( = ?auto_36195 ?auto_36191 ) ) ( not ( = ?auto_36195 ?auto_36190 ) ) ( not ( = ?auto_36194 ?auto_36192 ) ) ( not ( = ?auto_36194 ?auto_36191 ) ) ( not ( = ?auto_36194 ?auto_36190 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36193 ?auto_36195 ?auto_36194 ?auto_36192 ?auto_36191 )
      ( MAKE-2PILE ?auto_36190 ?auto_36191 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36199 - BLOCK
      ?auto_36200 - BLOCK
      ?auto_36201 - BLOCK
    )
    :vars
    (
      ?auto_36202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36202 ?auto_36201 ) ( CLEAR ?auto_36202 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36199 ) ( ON ?auto_36200 ?auto_36199 ) ( ON ?auto_36201 ?auto_36200 ) ( not ( = ?auto_36199 ?auto_36200 ) ) ( not ( = ?auto_36199 ?auto_36201 ) ) ( not ( = ?auto_36199 ?auto_36202 ) ) ( not ( = ?auto_36200 ?auto_36201 ) ) ( not ( = ?auto_36200 ?auto_36202 ) ) ( not ( = ?auto_36201 ?auto_36202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36202 ?auto_36201 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36203 - BLOCK
      ?auto_36204 - BLOCK
      ?auto_36205 - BLOCK
    )
    :vars
    (
      ?auto_36206 - BLOCK
      ?auto_36207 - BLOCK
      ?auto_36208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36206 ?auto_36205 ) ( CLEAR ?auto_36206 ) ( ON-TABLE ?auto_36203 ) ( ON ?auto_36204 ?auto_36203 ) ( ON ?auto_36205 ?auto_36204 ) ( not ( = ?auto_36203 ?auto_36204 ) ) ( not ( = ?auto_36203 ?auto_36205 ) ) ( not ( = ?auto_36203 ?auto_36206 ) ) ( not ( = ?auto_36204 ?auto_36205 ) ) ( not ( = ?auto_36204 ?auto_36206 ) ) ( not ( = ?auto_36205 ?auto_36206 ) ) ( HOLDING ?auto_36207 ) ( CLEAR ?auto_36208 ) ( not ( = ?auto_36203 ?auto_36207 ) ) ( not ( = ?auto_36203 ?auto_36208 ) ) ( not ( = ?auto_36204 ?auto_36207 ) ) ( not ( = ?auto_36204 ?auto_36208 ) ) ( not ( = ?auto_36205 ?auto_36207 ) ) ( not ( = ?auto_36205 ?auto_36208 ) ) ( not ( = ?auto_36206 ?auto_36207 ) ) ( not ( = ?auto_36206 ?auto_36208 ) ) ( not ( = ?auto_36207 ?auto_36208 ) ) )
    :subtasks
    ( ( !STACK ?auto_36207 ?auto_36208 )
      ( MAKE-3PILE ?auto_36203 ?auto_36204 ?auto_36205 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36209 - BLOCK
      ?auto_36210 - BLOCK
      ?auto_36211 - BLOCK
    )
    :vars
    (
      ?auto_36213 - BLOCK
      ?auto_36214 - BLOCK
      ?auto_36212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36213 ?auto_36211 ) ( ON-TABLE ?auto_36209 ) ( ON ?auto_36210 ?auto_36209 ) ( ON ?auto_36211 ?auto_36210 ) ( not ( = ?auto_36209 ?auto_36210 ) ) ( not ( = ?auto_36209 ?auto_36211 ) ) ( not ( = ?auto_36209 ?auto_36213 ) ) ( not ( = ?auto_36210 ?auto_36211 ) ) ( not ( = ?auto_36210 ?auto_36213 ) ) ( not ( = ?auto_36211 ?auto_36213 ) ) ( CLEAR ?auto_36214 ) ( not ( = ?auto_36209 ?auto_36212 ) ) ( not ( = ?auto_36209 ?auto_36214 ) ) ( not ( = ?auto_36210 ?auto_36212 ) ) ( not ( = ?auto_36210 ?auto_36214 ) ) ( not ( = ?auto_36211 ?auto_36212 ) ) ( not ( = ?auto_36211 ?auto_36214 ) ) ( not ( = ?auto_36213 ?auto_36212 ) ) ( not ( = ?auto_36213 ?auto_36214 ) ) ( not ( = ?auto_36212 ?auto_36214 ) ) ( ON ?auto_36212 ?auto_36213 ) ( CLEAR ?auto_36212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36209 ?auto_36210 ?auto_36211 ?auto_36213 )
      ( MAKE-3PILE ?auto_36209 ?auto_36210 ?auto_36211 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36215 - BLOCK
      ?auto_36216 - BLOCK
      ?auto_36217 - BLOCK
    )
    :vars
    (
      ?auto_36219 - BLOCK
      ?auto_36218 - BLOCK
      ?auto_36220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36219 ?auto_36217 ) ( ON-TABLE ?auto_36215 ) ( ON ?auto_36216 ?auto_36215 ) ( ON ?auto_36217 ?auto_36216 ) ( not ( = ?auto_36215 ?auto_36216 ) ) ( not ( = ?auto_36215 ?auto_36217 ) ) ( not ( = ?auto_36215 ?auto_36219 ) ) ( not ( = ?auto_36216 ?auto_36217 ) ) ( not ( = ?auto_36216 ?auto_36219 ) ) ( not ( = ?auto_36217 ?auto_36219 ) ) ( not ( = ?auto_36215 ?auto_36218 ) ) ( not ( = ?auto_36215 ?auto_36220 ) ) ( not ( = ?auto_36216 ?auto_36218 ) ) ( not ( = ?auto_36216 ?auto_36220 ) ) ( not ( = ?auto_36217 ?auto_36218 ) ) ( not ( = ?auto_36217 ?auto_36220 ) ) ( not ( = ?auto_36219 ?auto_36218 ) ) ( not ( = ?auto_36219 ?auto_36220 ) ) ( not ( = ?auto_36218 ?auto_36220 ) ) ( ON ?auto_36218 ?auto_36219 ) ( CLEAR ?auto_36218 ) ( HOLDING ?auto_36220 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36220 )
      ( MAKE-3PILE ?auto_36215 ?auto_36216 ?auto_36217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36221 - BLOCK
      ?auto_36222 - BLOCK
      ?auto_36223 - BLOCK
    )
    :vars
    (
      ?auto_36225 - BLOCK
      ?auto_36226 - BLOCK
      ?auto_36224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36225 ?auto_36223 ) ( ON-TABLE ?auto_36221 ) ( ON ?auto_36222 ?auto_36221 ) ( ON ?auto_36223 ?auto_36222 ) ( not ( = ?auto_36221 ?auto_36222 ) ) ( not ( = ?auto_36221 ?auto_36223 ) ) ( not ( = ?auto_36221 ?auto_36225 ) ) ( not ( = ?auto_36222 ?auto_36223 ) ) ( not ( = ?auto_36222 ?auto_36225 ) ) ( not ( = ?auto_36223 ?auto_36225 ) ) ( not ( = ?auto_36221 ?auto_36226 ) ) ( not ( = ?auto_36221 ?auto_36224 ) ) ( not ( = ?auto_36222 ?auto_36226 ) ) ( not ( = ?auto_36222 ?auto_36224 ) ) ( not ( = ?auto_36223 ?auto_36226 ) ) ( not ( = ?auto_36223 ?auto_36224 ) ) ( not ( = ?auto_36225 ?auto_36226 ) ) ( not ( = ?auto_36225 ?auto_36224 ) ) ( not ( = ?auto_36226 ?auto_36224 ) ) ( ON ?auto_36226 ?auto_36225 ) ( ON ?auto_36224 ?auto_36226 ) ( CLEAR ?auto_36224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36221 ?auto_36222 ?auto_36223 ?auto_36225 ?auto_36226 )
      ( MAKE-3PILE ?auto_36221 ?auto_36222 ?auto_36223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36230 - BLOCK
      ?auto_36231 - BLOCK
      ?auto_36232 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36232 ) ( CLEAR ?auto_36231 ) ( ON-TABLE ?auto_36230 ) ( ON ?auto_36231 ?auto_36230 ) ( not ( = ?auto_36230 ?auto_36231 ) ) ( not ( = ?auto_36230 ?auto_36232 ) ) ( not ( = ?auto_36231 ?auto_36232 ) ) )
    :subtasks
    ( ( !STACK ?auto_36232 ?auto_36231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36233 - BLOCK
      ?auto_36234 - BLOCK
      ?auto_36235 - BLOCK
    )
    :vars
    (
      ?auto_36236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36234 ) ( ON-TABLE ?auto_36233 ) ( ON ?auto_36234 ?auto_36233 ) ( not ( = ?auto_36233 ?auto_36234 ) ) ( not ( = ?auto_36233 ?auto_36235 ) ) ( not ( = ?auto_36234 ?auto_36235 ) ) ( ON ?auto_36235 ?auto_36236 ) ( CLEAR ?auto_36235 ) ( HAND-EMPTY ) ( not ( = ?auto_36233 ?auto_36236 ) ) ( not ( = ?auto_36234 ?auto_36236 ) ) ( not ( = ?auto_36235 ?auto_36236 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36235 ?auto_36236 )
      ( MAKE-3PILE ?auto_36233 ?auto_36234 ?auto_36235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36237 - BLOCK
      ?auto_36238 - BLOCK
      ?auto_36239 - BLOCK
    )
    :vars
    (
      ?auto_36240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36237 ) ( not ( = ?auto_36237 ?auto_36238 ) ) ( not ( = ?auto_36237 ?auto_36239 ) ) ( not ( = ?auto_36238 ?auto_36239 ) ) ( ON ?auto_36239 ?auto_36240 ) ( CLEAR ?auto_36239 ) ( not ( = ?auto_36237 ?auto_36240 ) ) ( not ( = ?auto_36238 ?auto_36240 ) ) ( not ( = ?auto_36239 ?auto_36240 ) ) ( HOLDING ?auto_36238 ) ( CLEAR ?auto_36237 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36237 ?auto_36238 )
      ( MAKE-3PILE ?auto_36237 ?auto_36238 ?auto_36239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36241 - BLOCK
      ?auto_36242 - BLOCK
      ?auto_36243 - BLOCK
    )
    :vars
    (
      ?auto_36244 - BLOCK
      ?auto_36245 - BLOCK
      ?auto_36246 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36241 ) ( not ( = ?auto_36241 ?auto_36242 ) ) ( not ( = ?auto_36241 ?auto_36243 ) ) ( not ( = ?auto_36242 ?auto_36243 ) ) ( ON ?auto_36243 ?auto_36244 ) ( not ( = ?auto_36241 ?auto_36244 ) ) ( not ( = ?auto_36242 ?auto_36244 ) ) ( not ( = ?auto_36243 ?auto_36244 ) ) ( CLEAR ?auto_36241 ) ( ON ?auto_36242 ?auto_36243 ) ( CLEAR ?auto_36242 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36245 ) ( ON ?auto_36246 ?auto_36245 ) ( ON ?auto_36244 ?auto_36246 ) ( not ( = ?auto_36245 ?auto_36246 ) ) ( not ( = ?auto_36245 ?auto_36244 ) ) ( not ( = ?auto_36245 ?auto_36243 ) ) ( not ( = ?auto_36245 ?auto_36242 ) ) ( not ( = ?auto_36246 ?auto_36244 ) ) ( not ( = ?auto_36246 ?auto_36243 ) ) ( not ( = ?auto_36246 ?auto_36242 ) ) ( not ( = ?auto_36241 ?auto_36245 ) ) ( not ( = ?auto_36241 ?auto_36246 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36245 ?auto_36246 ?auto_36244 ?auto_36243 )
      ( MAKE-3PILE ?auto_36241 ?auto_36242 ?auto_36243 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36247 - BLOCK
      ?auto_36248 - BLOCK
      ?auto_36249 - BLOCK
    )
    :vars
    (
      ?auto_36250 - BLOCK
      ?auto_36252 - BLOCK
      ?auto_36251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36247 ?auto_36248 ) ) ( not ( = ?auto_36247 ?auto_36249 ) ) ( not ( = ?auto_36248 ?auto_36249 ) ) ( ON ?auto_36249 ?auto_36250 ) ( not ( = ?auto_36247 ?auto_36250 ) ) ( not ( = ?auto_36248 ?auto_36250 ) ) ( not ( = ?auto_36249 ?auto_36250 ) ) ( ON ?auto_36248 ?auto_36249 ) ( CLEAR ?auto_36248 ) ( ON-TABLE ?auto_36252 ) ( ON ?auto_36251 ?auto_36252 ) ( ON ?auto_36250 ?auto_36251 ) ( not ( = ?auto_36252 ?auto_36251 ) ) ( not ( = ?auto_36252 ?auto_36250 ) ) ( not ( = ?auto_36252 ?auto_36249 ) ) ( not ( = ?auto_36252 ?auto_36248 ) ) ( not ( = ?auto_36251 ?auto_36250 ) ) ( not ( = ?auto_36251 ?auto_36249 ) ) ( not ( = ?auto_36251 ?auto_36248 ) ) ( not ( = ?auto_36247 ?auto_36252 ) ) ( not ( = ?auto_36247 ?auto_36251 ) ) ( HOLDING ?auto_36247 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36247 )
      ( MAKE-3PILE ?auto_36247 ?auto_36248 ?auto_36249 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36253 - BLOCK
      ?auto_36254 - BLOCK
      ?auto_36255 - BLOCK
    )
    :vars
    (
      ?auto_36256 - BLOCK
      ?auto_36258 - BLOCK
      ?auto_36257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36253 ?auto_36254 ) ) ( not ( = ?auto_36253 ?auto_36255 ) ) ( not ( = ?auto_36254 ?auto_36255 ) ) ( ON ?auto_36255 ?auto_36256 ) ( not ( = ?auto_36253 ?auto_36256 ) ) ( not ( = ?auto_36254 ?auto_36256 ) ) ( not ( = ?auto_36255 ?auto_36256 ) ) ( ON ?auto_36254 ?auto_36255 ) ( ON-TABLE ?auto_36258 ) ( ON ?auto_36257 ?auto_36258 ) ( ON ?auto_36256 ?auto_36257 ) ( not ( = ?auto_36258 ?auto_36257 ) ) ( not ( = ?auto_36258 ?auto_36256 ) ) ( not ( = ?auto_36258 ?auto_36255 ) ) ( not ( = ?auto_36258 ?auto_36254 ) ) ( not ( = ?auto_36257 ?auto_36256 ) ) ( not ( = ?auto_36257 ?auto_36255 ) ) ( not ( = ?auto_36257 ?auto_36254 ) ) ( not ( = ?auto_36253 ?auto_36258 ) ) ( not ( = ?auto_36253 ?auto_36257 ) ) ( ON ?auto_36253 ?auto_36254 ) ( CLEAR ?auto_36253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36258 ?auto_36257 ?auto_36256 ?auto_36255 ?auto_36254 )
      ( MAKE-3PILE ?auto_36253 ?auto_36254 ?auto_36255 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36261 - BLOCK
      ?auto_36262 - BLOCK
    )
    :vars
    (
      ?auto_36263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36263 ?auto_36262 ) ( CLEAR ?auto_36263 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36261 ) ( ON ?auto_36262 ?auto_36261 ) ( not ( = ?auto_36261 ?auto_36262 ) ) ( not ( = ?auto_36261 ?auto_36263 ) ) ( not ( = ?auto_36262 ?auto_36263 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36263 ?auto_36262 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36264 - BLOCK
      ?auto_36265 - BLOCK
    )
    :vars
    (
      ?auto_36266 - BLOCK
      ?auto_36267 - BLOCK
      ?auto_36268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36266 ?auto_36265 ) ( CLEAR ?auto_36266 ) ( ON-TABLE ?auto_36264 ) ( ON ?auto_36265 ?auto_36264 ) ( not ( = ?auto_36264 ?auto_36265 ) ) ( not ( = ?auto_36264 ?auto_36266 ) ) ( not ( = ?auto_36265 ?auto_36266 ) ) ( HOLDING ?auto_36267 ) ( CLEAR ?auto_36268 ) ( not ( = ?auto_36264 ?auto_36267 ) ) ( not ( = ?auto_36264 ?auto_36268 ) ) ( not ( = ?auto_36265 ?auto_36267 ) ) ( not ( = ?auto_36265 ?auto_36268 ) ) ( not ( = ?auto_36266 ?auto_36267 ) ) ( not ( = ?auto_36266 ?auto_36268 ) ) ( not ( = ?auto_36267 ?auto_36268 ) ) )
    :subtasks
    ( ( !STACK ?auto_36267 ?auto_36268 )
      ( MAKE-2PILE ?auto_36264 ?auto_36265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36269 - BLOCK
      ?auto_36270 - BLOCK
    )
    :vars
    (
      ?auto_36271 - BLOCK
      ?auto_36273 - BLOCK
      ?auto_36272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36271 ?auto_36270 ) ( ON-TABLE ?auto_36269 ) ( ON ?auto_36270 ?auto_36269 ) ( not ( = ?auto_36269 ?auto_36270 ) ) ( not ( = ?auto_36269 ?auto_36271 ) ) ( not ( = ?auto_36270 ?auto_36271 ) ) ( CLEAR ?auto_36273 ) ( not ( = ?auto_36269 ?auto_36272 ) ) ( not ( = ?auto_36269 ?auto_36273 ) ) ( not ( = ?auto_36270 ?auto_36272 ) ) ( not ( = ?auto_36270 ?auto_36273 ) ) ( not ( = ?auto_36271 ?auto_36272 ) ) ( not ( = ?auto_36271 ?auto_36273 ) ) ( not ( = ?auto_36272 ?auto_36273 ) ) ( ON ?auto_36272 ?auto_36271 ) ( CLEAR ?auto_36272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36269 ?auto_36270 ?auto_36271 )
      ( MAKE-2PILE ?auto_36269 ?auto_36270 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36274 - BLOCK
      ?auto_36275 - BLOCK
    )
    :vars
    (
      ?auto_36277 - BLOCK
      ?auto_36278 - BLOCK
      ?auto_36276 - BLOCK
      ?auto_36279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36277 ?auto_36275 ) ( ON-TABLE ?auto_36274 ) ( ON ?auto_36275 ?auto_36274 ) ( not ( = ?auto_36274 ?auto_36275 ) ) ( not ( = ?auto_36274 ?auto_36277 ) ) ( not ( = ?auto_36275 ?auto_36277 ) ) ( not ( = ?auto_36274 ?auto_36278 ) ) ( not ( = ?auto_36274 ?auto_36276 ) ) ( not ( = ?auto_36275 ?auto_36278 ) ) ( not ( = ?auto_36275 ?auto_36276 ) ) ( not ( = ?auto_36277 ?auto_36278 ) ) ( not ( = ?auto_36277 ?auto_36276 ) ) ( not ( = ?auto_36278 ?auto_36276 ) ) ( ON ?auto_36278 ?auto_36277 ) ( CLEAR ?auto_36278 ) ( HOLDING ?auto_36276 ) ( CLEAR ?auto_36279 ) ( ON-TABLE ?auto_36279 ) ( not ( = ?auto_36279 ?auto_36276 ) ) ( not ( = ?auto_36274 ?auto_36279 ) ) ( not ( = ?auto_36275 ?auto_36279 ) ) ( not ( = ?auto_36277 ?auto_36279 ) ) ( not ( = ?auto_36278 ?auto_36279 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36279 ?auto_36276 )
      ( MAKE-2PILE ?auto_36274 ?auto_36275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36280 - BLOCK
      ?auto_36281 - BLOCK
    )
    :vars
    (
      ?auto_36284 - BLOCK
      ?auto_36282 - BLOCK
      ?auto_36283 - BLOCK
      ?auto_36285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36284 ?auto_36281 ) ( ON-TABLE ?auto_36280 ) ( ON ?auto_36281 ?auto_36280 ) ( not ( = ?auto_36280 ?auto_36281 ) ) ( not ( = ?auto_36280 ?auto_36284 ) ) ( not ( = ?auto_36281 ?auto_36284 ) ) ( not ( = ?auto_36280 ?auto_36282 ) ) ( not ( = ?auto_36280 ?auto_36283 ) ) ( not ( = ?auto_36281 ?auto_36282 ) ) ( not ( = ?auto_36281 ?auto_36283 ) ) ( not ( = ?auto_36284 ?auto_36282 ) ) ( not ( = ?auto_36284 ?auto_36283 ) ) ( not ( = ?auto_36282 ?auto_36283 ) ) ( ON ?auto_36282 ?auto_36284 ) ( CLEAR ?auto_36285 ) ( ON-TABLE ?auto_36285 ) ( not ( = ?auto_36285 ?auto_36283 ) ) ( not ( = ?auto_36280 ?auto_36285 ) ) ( not ( = ?auto_36281 ?auto_36285 ) ) ( not ( = ?auto_36284 ?auto_36285 ) ) ( not ( = ?auto_36282 ?auto_36285 ) ) ( ON ?auto_36283 ?auto_36282 ) ( CLEAR ?auto_36283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36280 ?auto_36281 ?auto_36284 ?auto_36282 )
      ( MAKE-2PILE ?auto_36280 ?auto_36281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36286 - BLOCK
      ?auto_36287 - BLOCK
    )
    :vars
    (
      ?auto_36291 - BLOCK
      ?auto_36290 - BLOCK
      ?auto_36288 - BLOCK
      ?auto_36289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36291 ?auto_36287 ) ( ON-TABLE ?auto_36286 ) ( ON ?auto_36287 ?auto_36286 ) ( not ( = ?auto_36286 ?auto_36287 ) ) ( not ( = ?auto_36286 ?auto_36291 ) ) ( not ( = ?auto_36287 ?auto_36291 ) ) ( not ( = ?auto_36286 ?auto_36290 ) ) ( not ( = ?auto_36286 ?auto_36288 ) ) ( not ( = ?auto_36287 ?auto_36290 ) ) ( not ( = ?auto_36287 ?auto_36288 ) ) ( not ( = ?auto_36291 ?auto_36290 ) ) ( not ( = ?auto_36291 ?auto_36288 ) ) ( not ( = ?auto_36290 ?auto_36288 ) ) ( ON ?auto_36290 ?auto_36291 ) ( not ( = ?auto_36289 ?auto_36288 ) ) ( not ( = ?auto_36286 ?auto_36289 ) ) ( not ( = ?auto_36287 ?auto_36289 ) ) ( not ( = ?auto_36291 ?auto_36289 ) ) ( not ( = ?auto_36290 ?auto_36289 ) ) ( ON ?auto_36288 ?auto_36290 ) ( CLEAR ?auto_36288 ) ( HOLDING ?auto_36289 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36289 )
      ( MAKE-2PILE ?auto_36286 ?auto_36287 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36292 - BLOCK
      ?auto_36293 - BLOCK
    )
    :vars
    (
      ?auto_36294 - BLOCK
      ?auto_36295 - BLOCK
      ?auto_36296 - BLOCK
      ?auto_36297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36294 ?auto_36293 ) ( ON-TABLE ?auto_36292 ) ( ON ?auto_36293 ?auto_36292 ) ( not ( = ?auto_36292 ?auto_36293 ) ) ( not ( = ?auto_36292 ?auto_36294 ) ) ( not ( = ?auto_36293 ?auto_36294 ) ) ( not ( = ?auto_36292 ?auto_36295 ) ) ( not ( = ?auto_36292 ?auto_36296 ) ) ( not ( = ?auto_36293 ?auto_36295 ) ) ( not ( = ?auto_36293 ?auto_36296 ) ) ( not ( = ?auto_36294 ?auto_36295 ) ) ( not ( = ?auto_36294 ?auto_36296 ) ) ( not ( = ?auto_36295 ?auto_36296 ) ) ( ON ?auto_36295 ?auto_36294 ) ( not ( = ?auto_36297 ?auto_36296 ) ) ( not ( = ?auto_36292 ?auto_36297 ) ) ( not ( = ?auto_36293 ?auto_36297 ) ) ( not ( = ?auto_36294 ?auto_36297 ) ) ( not ( = ?auto_36295 ?auto_36297 ) ) ( ON ?auto_36296 ?auto_36295 ) ( ON ?auto_36297 ?auto_36296 ) ( CLEAR ?auto_36297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36292 ?auto_36293 ?auto_36294 ?auto_36295 ?auto_36296 )
      ( MAKE-2PILE ?auto_36292 ?auto_36293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36302 - BLOCK
      ?auto_36303 - BLOCK
      ?auto_36304 - BLOCK
      ?auto_36305 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36305 ) ( CLEAR ?auto_36304 ) ( ON-TABLE ?auto_36302 ) ( ON ?auto_36303 ?auto_36302 ) ( ON ?auto_36304 ?auto_36303 ) ( not ( = ?auto_36302 ?auto_36303 ) ) ( not ( = ?auto_36302 ?auto_36304 ) ) ( not ( = ?auto_36302 ?auto_36305 ) ) ( not ( = ?auto_36303 ?auto_36304 ) ) ( not ( = ?auto_36303 ?auto_36305 ) ) ( not ( = ?auto_36304 ?auto_36305 ) ) )
    :subtasks
    ( ( !STACK ?auto_36305 ?auto_36304 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36306 - BLOCK
      ?auto_36307 - BLOCK
      ?auto_36308 - BLOCK
      ?auto_36309 - BLOCK
    )
    :vars
    (
      ?auto_36310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36308 ) ( ON-TABLE ?auto_36306 ) ( ON ?auto_36307 ?auto_36306 ) ( ON ?auto_36308 ?auto_36307 ) ( not ( = ?auto_36306 ?auto_36307 ) ) ( not ( = ?auto_36306 ?auto_36308 ) ) ( not ( = ?auto_36306 ?auto_36309 ) ) ( not ( = ?auto_36307 ?auto_36308 ) ) ( not ( = ?auto_36307 ?auto_36309 ) ) ( not ( = ?auto_36308 ?auto_36309 ) ) ( ON ?auto_36309 ?auto_36310 ) ( CLEAR ?auto_36309 ) ( HAND-EMPTY ) ( not ( = ?auto_36306 ?auto_36310 ) ) ( not ( = ?auto_36307 ?auto_36310 ) ) ( not ( = ?auto_36308 ?auto_36310 ) ) ( not ( = ?auto_36309 ?auto_36310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36309 ?auto_36310 )
      ( MAKE-4PILE ?auto_36306 ?auto_36307 ?auto_36308 ?auto_36309 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36311 - BLOCK
      ?auto_36312 - BLOCK
      ?auto_36313 - BLOCK
      ?auto_36314 - BLOCK
    )
    :vars
    (
      ?auto_36315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36311 ) ( ON ?auto_36312 ?auto_36311 ) ( not ( = ?auto_36311 ?auto_36312 ) ) ( not ( = ?auto_36311 ?auto_36313 ) ) ( not ( = ?auto_36311 ?auto_36314 ) ) ( not ( = ?auto_36312 ?auto_36313 ) ) ( not ( = ?auto_36312 ?auto_36314 ) ) ( not ( = ?auto_36313 ?auto_36314 ) ) ( ON ?auto_36314 ?auto_36315 ) ( CLEAR ?auto_36314 ) ( not ( = ?auto_36311 ?auto_36315 ) ) ( not ( = ?auto_36312 ?auto_36315 ) ) ( not ( = ?auto_36313 ?auto_36315 ) ) ( not ( = ?auto_36314 ?auto_36315 ) ) ( HOLDING ?auto_36313 ) ( CLEAR ?auto_36312 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36311 ?auto_36312 ?auto_36313 )
      ( MAKE-4PILE ?auto_36311 ?auto_36312 ?auto_36313 ?auto_36314 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36316 - BLOCK
      ?auto_36317 - BLOCK
      ?auto_36318 - BLOCK
      ?auto_36319 - BLOCK
    )
    :vars
    (
      ?auto_36320 - BLOCK
      ?auto_36321 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36316 ) ( ON ?auto_36317 ?auto_36316 ) ( not ( = ?auto_36316 ?auto_36317 ) ) ( not ( = ?auto_36316 ?auto_36318 ) ) ( not ( = ?auto_36316 ?auto_36319 ) ) ( not ( = ?auto_36317 ?auto_36318 ) ) ( not ( = ?auto_36317 ?auto_36319 ) ) ( not ( = ?auto_36318 ?auto_36319 ) ) ( ON ?auto_36319 ?auto_36320 ) ( not ( = ?auto_36316 ?auto_36320 ) ) ( not ( = ?auto_36317 ?auto_36320 ) ) ( not ( = ?auto_36318 ?auto_36320 ) ) ( not ( = ?auto_36319 ?auto_36320 ) ) ( CLEAR ?auto_36317 ) ( ON ?auto_36318 ?auto_36319 ) ( CLEAR ?auto_36318 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36321 ) ( ON ?auto_36320 ?auto_36321 ) ( not ( = ?auto_36321 ?auto_36320 ) ) ( not ( = ?auto_36321 ?auto_36319 ) ) ( not ( = ?auto_36321 ?auto_36318 ) ) ( not ( = ?auto_36316 ?auto_36321 ) ) ( not ( = ?auto_36317 ?auto_36321 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36321 ?auto_36320 ?auto_36319 )
      ( MAKE-4PILE ?auto_36316 ?auto_36317 ?auto_36318 ?auto_36319 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36322 - BLOCK
      ?auto_36323 - BLOCK
      ?auto_36324 - BLOCK
      ?auto_36325 - BLOCK
    )
    :vars
    (
      ?auto_36326 - BLOCK
      ?auto_36327 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36322 ) ( not ( = ?auto_36322 ?auto_36323 ) ) ( not ( = ?auto_36322 ?auto_36324 ) ) ( not ( = ?auto_36322 ?auto_36325 ) ) ( not ( = ?auto_36323 ?auto_36324 ) ) ( not ( = ?auto_36323 ?auto_36325 ) ) ( not ( = ?auto_36324 ?auto_36325 ) ) ( ON ?auto_36325 ?auto_36326 ) ( not ( = ?auto_36322 ?auto_36326 ) ) ( not ( = ?auto_36323 ?auto_36326 ) ) ( not ( = ?auto_36324 ?auto_36326 ) ) ( not ( = ?auto_36325 ?auto_36326 ) ) ( ON ?auto_36324 ?auto_36325 ) ( CLEAR ?auto_36324 ) ( ON-TABLE ?auto_36327 ) ( ON ?auto_36326 ?auto_36327 ) ( not ( = ?auto_36327 ?auto_36326 ) ) ( not ( = ?auto_36327 ?auto_36325 ) ) ( not ( = ?auto_36327 ?auto_36324 ) ) ( not ( = ?auto_36322 ?auto_36327 ) ) ( not ( = ?auto_36323 ?auto_36327 ) ) ( HOLDING ?auto_36323 ) ( CLEAR ?auto_36322 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36322 ?auto_36323 )
      ( MAKE-4PILE ?auto_36322 ?auto_36323 ?auto_36324 ?auto_36325 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36328 - BLOCK
      ?auto_36329 - BLOCK
      ?auto_36330 - BLOCK
      ?auto_36331 - BLOCK
    )
    :vars
    (
      ?auto_36332 - BLOCK
      ?auto_36333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36328 ) ( not ( = ?auto_36328 ?auto_36329 ) ) ( not ( = ?auto_36328 ?auto_36330 ) ) ( not ( = ?auto_36328 ?auto_36331 ) ) ( not ( = ?auto_36329 ?auto_36330 ) ) ( not ( = ?auto_36329 ?auto_36331 ) ) ( not ( = ?auto_36330 ?auto_36331 ) ) ( ON ?auto_36331 ?auto_36332 ) ( not ( = ?auto_36328 ?auto_36332 ) ) ( not ( = ?auto_36329 ?auto_36332 ) ) ( not ( = ?auto_36330 ?auto_36332 ) ) ( not ( = ?auto_36331 ?auto_36332 ) ) ( ON ?auto_36330 ?auto_36331 ) ( ON-TABLE ?auto_36333 ) ( ON ?auto_36332 ?auto_36333 ) ( not ( = ?auto_36333 ?auto_36332 ) ) ( not ( = ?auto_36333 ?auto_36331 ) ) ( not ( = ?auto_36333 ?auto_36330 ) ) ( not ( = ?auto_36328 ?auto_36333 ) ) ( not ( = ?auto_36329 ?auto_36333 ) ) ( CLEAR ?auto_36328 ) ( ON ?auto_36329 ?auto_36330 ) ( CLEAR ?auto_36329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36333 ?auto_36332 ?auto_36331 ?auto_36330 )
      ( MAKE-4PILE ?auto_36328 ?auto_36329 ?auto_36330 ?auto_36331 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36334 - BLOCK
      ?auto_36335 - BLOCK
      ?auto_36336 - BLOCK
      ?auto_36337 - BLOCK
    )
    :vars
    (
      ?auto_36338 - BLOCK
      ?auto_36339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36334 ?auto_36335 ) ) ( not ( = ?auto_36334 ?auto_36336 ) ) ( not ( = ?auto_36334 ?auto_36337 ) ) ( not ( = ?auto_36335 ?auto_36336 ) ) ( not ( = ?auto_36335 ?auto_36337 ) ) ( not ( = ?auto_36336 ?auto_36337 ) ) ( ON ?auto_36337 ?auto_36338 ) ( not ( = ?auto_36334 ?auto_36338 ) ) ( not ( = ?auto_36335 ?auto_36338 ) ) ( not ( = ?auto_36336 ?auto_36338 ) ) ( not ( = ?auto_36337 ?auto_36338 ) ) ( ON ?auto_36336 ?auto_36337 ) ( ON-TABLE ?auto_36339 ) ( ON ?auto_36338 ?auto_36339 ) ( not ( = ?auto_36339 ?auto_36338 ) ) ( not ( = ?auto_36339 ?auto_36337 ) ) ( not ( = ?auto_36339 ?auto_36336 ) ) ( not ( = ?auto_36334 ?auto_36339 ) ) ( not ( = ?auto_36335 ?auto_36339 ) ) ( ON ?auto_36335 ?auto_36336 ) ( CLEAR ?auto_36335 ) ( HOLDING ?auto_36334 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36334 )
      ( MAKE-4PILE ?auto_36334 ?auto_36335 ?auto_36336 ?auto_36337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36340 - BLOCK
      ?auto_36341 - BLOCK
      ?auto_36342 - BLOCK
      ?auto_36343 - BLOCK
    )
    :vars
    (
      ?auto_36344 - BLOCK
      ?auto_36345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36340 ?auto_36341 ) ) ( not ( = ?auto_36340 ?auto_36342 ) ) ( not ( = ?auto_36340 ?auto_36343 ) ) ( not ( = ?auto_36341 ?auto_36342 ) ) ( not ( = ?auto_36341 ?auto_36343 ) ) ( not ( = ?auto_36342 ?auto_36343 ) ) ( ON ?auto_36343 ?auto_36344 ) ( not ( = ?auto_36340 ?auto_36344 ) ) ( not ( = ?auto_36341 ?auto_36344 ) ) ( not ( = ?auto_36342 ?auto_36344 ) ) ( not ( = ?auto_36343 ?auto_36344 ) ) ( ON ?auto_36342 ?auto_36343 ) ( ON-TABLE ?auto_36345 ) ( ON ?auto_36344 ?auto_36345 ) ( not ( = ?auto_36345 ?auto_36344 ) ) ( not ( = ?auto_36345 ?auto_36343 ) ) ( not ( = ?auto_36345 ?auto_36342 ) ) ( not ( = ?auto_36340 ?auto_36345 ) ) ( not ( = ?auto_36341 ?auto_36345 ) ) ( ON ?auto_36341 ?auto_36342 ) ( ON ?auto_36340 ?auto_36341 ) ( CLEAR ?auto_36340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36345 ?auto_36344 ?auto_36343 ?auto_36342 ?auto_36341 )
      ( MAKE-4PILE ?auto_36340 ?auto_36341 ?auto_36342 ?auto_36343 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36347 - BLOCK
    )
    :vars
    (
      ?auto_36348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36348 ?auto_36347 ) ( CLEAR ?auto_36348 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36347 ) ( not ( = ?auto_36347 ?auto_36348 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36348 ?auto_36347 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36349 - BLOCK
    )
    :vars
    (
      ?auto_36350 - BLOCK
      ?auto_36351 - BLOCK
      ?auto_36352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36350 ?auto_36349 ) ( CLEAR ?auto_36350 ) ( ON-TABLE ?auto_36349 ) ( not ( = ?auto_36349 ?auto_36350 ) ) ( HOLDING ?auto_36351 ) ( CLEAR ?auto_36352 ) ( not ( = ?auto_36349 ?auto_36351 ) ) ( not ( = ?auto_36349 ?auto_36352 ) ) ( not ( = ?auto_36350 ?auto_36351 ) ) ( not ( = ?auto_36350 ?auto_36352 ) ) ( not ( = ?auto_36351 ?auto_36352 ) ) )
    :subtasks
    ( ( !STACK ?auto_36351 ?auto_36352 )
      ( MAKE-1PILE ?auto_36349 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36353 - BLOCK
    )
    :vars
    (
      ?auto_36354 - BLOCK
      ?auto_36356 - BLOCK
      ?auto_36355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36354 ?auto_36353 ) ( ON-TABLE ?auto_36353 ) ( not ( = ?auto_36353 ?auto_36354 ) ) ( CLEAR ?auto_36356 ) ( not ( = ?auto_36353 ?auto_36355 ) ) ( not ( = ?auto_36353 ?auto_36356 ) ) ( not ( = ?auto_36354 ?auto_36355 ) ) ( not ( = ?auto_36354 ?auto_36356 ) ) ( not ( = ?auto_36355 ?auto_36356 ) ) ( ON ?auto_36355 ?auto_36354 ) ( CLEAR ?auto_36355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36353 ?auto_36354 )
      ( MAKE-1PILE ?auto_36353 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36357 - BLOCK
    )
    :vars
    (
      ?auto_36358 - BLOCK
      ?auto_36359 - BLOCK
      ?auto_36360 - BLOCK
      ?auto_36362 - BLOCK
      ?auto_36361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36358 ?auto_36357 ) ( ON-TABLE ?auto_36357 ) ( not ( = ?auto_36357 ?auto_36358 ) ) ( not ( = ?auto_36357 ?auto_36359 ) ) ( not ( = ?auto_36357 ?auto_36360 ) ) ( not ( = ?auto_36358 ?auto_36359 ) ) ( not ( = ?auto_36358 ?auto_36360 ) ) ( not ( = ?auto_36359 ?auto_36360 ) ) ( ON ?auto_36359 ?auto_36358 ) ( CLEAR ?auto_36359 ) ( HOLDING ?auto_36360 ) ( CLEAR ?auto_36362 ) ( ON-TABLE ?auto_36361 ) ( ON ?auto_36362 ?auto_36361 ) ( not ( = ?auto_36361 ?auto_36362 ) ) ( not ( = ?auto_36361 ?auto_36360 ) ) ( not ( = ?auto_36362 ?auto_36360 ) ) ( not ( = ?auto_36357 ?auto_36362 ) ) ( not ( = ?auto_36357 ?auto_36361 ) ) ( not ( = ?auto_36358 ?auto_36362 ) ) ( not ( = ?auto_36358 ?auto_36361 ) ) ( not ( = ?auto_36359 ?auto_36362 ) ) ( not ( = ?auto_36359 ?auto_36361 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36361 ?auto_36362 ?auto_36360 )
      ( MAKE-1PILE ?auto_36357 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36363 - BLOCK
    )
    :vars
    (
      ?auto_36365 - BLOCK
      ?auto_36364 - BLOCK
      ?auto_36366 - BLOCK
      ?auto_36368 - BLOCK
      ?auto_36367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36365 ?auto_36363 ) ( ON-TABLE ?auto_36363 ) ( not ( = ?auto_36363 ?auto_36365 ) ) ( not ( = ?auto_36363 ?auto_36364 ) ) ( not ( = ?auto_36363 ?auto_36366 ) ) ( not ( = ?auto_36365 ?auto_36364 ) ) ( not ( = ?auto_36365 ?auto_36366 ) ) ( not ( = ?auto_36364 ?auto_36366 ) ) ( ON ?auto_36364 ?auto_36365 ) ( CLEAR ?auto_36368 ) ( ON-TABLE ?auto_36367 ) ( ON ?auto_36368 ?auto_36367 ) ( not ( = ?auto_36367 ?auto_36368 ) ) ( not ( = ?auto_36367 ?auto_36366 ) ) ( not ( = ?auto_36368 ?auto_36366 ) ) ( not ( = ?auto_36363 ?auto_36368 ) ) ( not ( = ?auto_36363 ?auto_36367 ) ) ( not ( = ?auto_36365 ?auto_36368 ) ) ( not ( = ?auto_36365 ?auto_36367 ) ) ( not ( = ?auto_36364 ?auto_36368 ) ) ( not ( = ?auto_36364 ?auto_36367 ) ) ( ON ?auto_36366 ?auto_36364 ) ( CLEAR ?auto_36366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36363 ?auto_36365 ?auto_36364 )
      ( MAKE-1PILE ?auto_36363 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36369 - BLOCK
    )
    :vars
    (
      ?auto_36373 - BLOCK
      ?auto_36372 - BLOCK
      ?auto_36371 - BLOCK
      ?auto_36374 - BLOCK
      ?auto_36370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36373 ?auto_36369 ) ( ON-TABLE ?auto_36369 ) ( not ( = ?auto_36369 ?auto_36373 ) ) ( not ( = ?auto_36369 ?auto_36372 ) ) ( not ( = ?auto_36369 ?auto_36371 ) ) ( not ( = ?auto_36373 ?auto_36372 ) ) ( not ( = ?auto_36373 ?auto_36371 ) ) ( not ( = ?auto_36372 ?auto_36371 ) ) ( ON ?auto_36372 ?auto_36373 ) ( ON-TABLE ?auto_36374 ) ( not ( = ?auto_36374 ?auto_36370 ) ) ( not ( = ?auto_36374 ?auto_36371 ) ) ( not ( = ?auto_36370 ?auto_36371 ) ) ( not ( = ?auto_36369 ?auto_36370 ) ) ( not ( = ?auto_36369 ?auto_36374 ) ) ( not ( = ?auto_36373 ?auto_36370 ) ) ( not ( = ?auto_36373 ?auto_36374 ) ) ( not ( = ?auto_36372 ?auto_36370 ) ) ( not ( = ?auto_36372 ?auto_36374 ) ) ( ON ?auto_36371 ?auto_36372 ) ( CLEAR ?auto_36371 ) ( HOLDING ?auto_36370 ) ( CLEAR ?auto_36374 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36374 ?auto_36370 )
      ( MAKE-1PILE ?auto_36369 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36375 - BLOCK
    )
    :vars
    (
      ?auto_36378 - BLOCK
      ?auto_36376 - BLOCK
      ?auto_36379 - BLOCK
      ?auto_36380 - BLOCK
      ?auto_36377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36378 ?auto_36375 ) ( ON-TABLE ?auto_36375 ) ( not ( = ?auto_36375 ?auto_36378 ) ) ( not ( = ?auto_36375 ?auto_36376 ) ) ( not ( = ?auto_36375 ?auto_36379 ) ) ( not ( = ?auto_36378 ?auto_36376 ) ) ( not ( = ?auto_36378 ?auto_36379 ) ) ( not ( = ?auto_36376 ?auto_36379 ) ) ( ON ?auto_36376 ?auto_36378 ) ( ON-TABLE ?auto_36380 ) ( not ( = ?auto_36380 ?auto_36377 ) ) ( not ( = ?auto_36380 ?auto_36379 ) ) ( not ( = ?auto_36377 ?auto_36379 ) ) ( not ( = ?auto_36375 ?auto_36377 ) ) ( not ( = ?auto_36375 ?auto_36380 ) ) ( not ( = ?auto_36378 ?auto_36377 ) ) ( not ( = ?auto_36378 ?auto_36380 ) ) ( not ( = ?auto_36376 ?auto_36377 ) ) ( not ( = ?auto_36376 ?auto_36380 ) ) ( ON ?auto_36379 ?auto_36376 ) ( CLEAR ?auto_36380 ) ( ON ?auto_36377 ?auto_36379 ) ( CLEAR ?auto_36377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36375 ?auto_36378 ?auto_36376 ?auto_36379 )
      ( MAKE-1PILE ?auto_36375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36381 - BLOCK
    )
    :vars
    (
      ?auto_36386 - BLOCK
      ?auto_36382 - BLOCK
      ?auto_36383 - BLOCK
      ?auto_36385 - BLOCK
      ?auto_36384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36386 ?auto_36381 ) ( ON-TABLE ?auto_36381 ) ( not ( = ?auto_36381 ?auto_36386 ) ) ( not ( = ?auto_36381 ?auto_36382 ) ) ( not ( = ?auto_36381 ?auto_36383 ) ) ( not ( = ?auto_36386 ?auto_36382 ) ) ( not ( = ?auto_36386 ?auto_36383 ) ) ( not ( = ?auto_36382 ?auto_36383 ) ) ( ON ?auto_36382 ?auto_36386 ) ( not ( = ?auto_36385 ?auto_36384 ) ) ( not ( = ?auto_36385 ?auto_36383 ) ) ( not ( = ?auto_36384 ?auto_36383 ) ) ( not ( = ?auto_36381 ?auto_36384 ) ) ( not ( = ?auto_36381 ?auto_36385 ) ) ( not ( = ?auto_36386 ?auto_36384 ) ) ( not ( = ?auto_36386 ?auto_36385 ) ) ( not ( = ?auto_36382 ?auto_36384 ) ) ( not ( = ?auto_36382 ?auto_36385 ) ) ( ON ?auto_36383 ?auto_36382 ) ( ON ?auto_36384 ?auto_36383 ) ( CLEAR ?auto_36384 ) ( HOLDING ?auto_36385 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36385 )
      ( MAKE-1PILE ?auto_36381 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36387 - BLOCK
    )
    :vars
    (
      ?auto_36391 - BLOCK
      ?auto_36392 - BLOCK
      ?auto_36388 - BLOCK
      ?auto_36389 - BLOCK
      ?auto_36390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36391 ?auto_36387 ) ( ON-TABLE ?auto_36387 ) ( not ( = ?auto_36387 ?auto_36391 ) ) ( not ( = ?auto_36387 ?auto_36392 ) ) ( not ( = ?auto_36387 ?auto_36388 ) ) ( not ( = ?auto_36391 ?auto_36392 ) ) ( not ( = ?auto_36391 ?auto_36388 ) ) ( not ( = ?auto_36392 ?auto_36388 ) ) ( ON ?auto_36392 ?auto_36391 ) ( not ( = ?auto_36389 ?auto_36390 ) ) ( not ( = ?auto_36389 ?auto_36388 ) ) ( not ( = ?auto_36390 ?auto_36388 ) ) ( not ( = ?auto_36387 ?auto_36390 ) ) ( not ( = ?auto_36387 ?auto_36389 ) ) ( not ( = ?auto_36391 ?auto_36390 ) ) ( not ( = ?auto_36391 ?auto_36389 ) ) ( not ( = ?auto_36392 ?auto_36390 ) ) ( not ( = ?auto_36392 ?auto_36389 ) ) ( ON ?auto_36388 ?auto_36392 ) ( ON ?auto_36390 ?auto_36388 ) ( ON ?auto_36389 ?auto_36390 ) ( CLEAR ?auto_36389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36387 ?auto_36391 ?auto_36392 ?auto_36388 ?auto_36390 )
      ( MAKE-1PILE ?auto_36387 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36398 - BLOCK
      ?auto_36399 - BLOCK
      ?auto_36400 - BLOCK
      ?auto_36401 - BLOCK
      ?auto_36402 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36402 ) ( CLEAR ?auto_36401 ) ( ON-TABLE ?auto_36398 ) ( ON ?auto_36399 ?auto_36398 ) ( ON ?auto_36400 ?auto_36399 ) ( ON ?auto_36401 ?auto_36400 ) ( not ( = ?auto_36398 ?auto_36399 ) ) ( not ( = ?auto_36398 ?auto_36400 ) ) ( not ( = ?auto_36398 ?auto_36401 ) ) ( not ( = ?auto_36398 ?auto_36402 ) ) ( not ( = ?auto_36399 ?auto_36400 ) ) ( not ( = ?auto_36399 ?auto_36401 ) ) ( not ( = ?auto_36399 ?auto_36402 ) ) ( not ( = ?auto_36400 ?auto_36401 ) ) ( not ( = ?auto_36400 ?auto_36402 ) ) ( not ( = ?auto_36401 ?auto_36402 ) ) )
    :subtasks
    ( ( !STACK ?auto_36402 ?auto_36401 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36403 - BLOCK
      ?auto_36404 - BLOCK
      ?auto_36405 - BLOCK
      ?auto_36406 - BLOCK
      ?auto_36407 - BLOCK
    )
    :vars
    (
      ?auto_36408 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36406 ) ( ON-TABLE ?auto_36403 ) ( ON ?auto_36404 ?auto_36403 ) ( ON ?auto_36405 ?auto_36404 ) ( ON ?auto_36406 ?auto_36405 ) ( not ( = ?auto_36403 ?auto_36404 ) ) ( not ( = ?auto_36403 ?auto_36405 ) ) ( not ( = ?auto_36403 ?auto_36406 ) ) ( not ( = ?auto_36403 ?auto_36407 ) ) ( not ( = ?auto_36404 ?auto_36405 ) ) ( not ( = ?auto_36404 ?auto_36406 ) ) ( not ( = ?auto_36404 ?auto_36407 ) ) ( not ( = ?auto_36405 ?auto_36406 ) ) ( not ( = ?auto_36405 ?auto_36407 ) ) ( not ( = ?auto_36406 ?auto_36407 ) ) ( ON ?auto_36407 ?auto_36408 ) ( CLEAR ?auto_36407 ) ( HAND-EMPTY ) ( not ( = ?auto_36403 ?auto_36408 ) ) ( not ( = ?auto_36404 ?auto_36408 ) ) ( not ( = ?auto_36405 ?auto_36408 ) ) ( not ( = ?auto_36406 ?auto_36408 ) ) ( not ( = ?auto_36407 ?auto_36408 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36407 ?auto_36408 )
      ( MAKE-5PILE ?auto_36403 ?auto_36404 ?auto_36405 ?auto_36406 ?auto_36407 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36409 - BLOCK
      ?auto_36410 - BLOCK
      ?auto_36411 - BLOCK
      ?auto_36412 - BLOCK
      ?auto_36413 - BLOCK
    )
    :vars
    (
      ?auto_36414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36409 ) ( ON ?auto_36410 ?auto_36409 ) ( ON ?auto_36411 ?auto_36410 ) ( not ( = ?auto_36409 ?auto_36410 ) ) ( not ( = ?auto_36409 ?auto_36411 ) ) ( not ( = ?auto_36409 ?auto_36412 ) ) ( not ( = ?auto_36409 ?auto_36413 ) ) ( not ( = ?auto_36410 ?auto_36411 ) ) ( not ( = ?auto_36410 ?auto_36412 ) ) ( not ( = ?auto_36410 ?auto_36413 ) ) ( not ( = ?auto_36411 ?auto_36412 ) ) ( not ( = ?auto_36411 ?auto_36413 ) ) ( not ( = ?auto_36412 ?auto_36413 ) ) ( ON ?auto_36413 ?auto_36414 ) ( CLEAR ?auto_36413 ) ( not ( = ?auto_36409 ?auto_36414 ) ) ( not ( = ?auto_36410 ?auto_36414 ) ) ( not ( = ?auto_36411 ?auto_36414 ) ) ( not ( = ?auto_36412 ?auto_36414 ) ) ( not ( = ?auto_36413 ?auto_36414 ) ) ( HOLDING ?auto_36412 ) ( CLEAR ?auto_36411 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36409 ?auto_36410 ?auto_36411 ?auto_36412 )
      ( MAKE-5PILE ?auto_36409 ?auto_36410 ?auto_36411 ?auto_36412 ?auto_36413 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36415 - BLOCK
      ?auto_36416 - BLOCK
      ?auto_36417 - BLOCK
      ?auto_36418 - BLOCK
      ?auto_36419 - BLOCK
    )
    :vars
    (
      ?auto_36420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36415 ) ( ON ?auto_36416 ?auto_36415 ) ( ON ?auto_36417 ?auto_36416 ) ( not ( = ?auto_36415 ?auto_36416 ) ) ( not ( = ?auto_36415 ?auto_36417 ) ) ( not ( = ?auto_36415 ?auto_36418 ) ) ( not ( = ?auto_36415 ?auto_36419 ) ) ( not ( = ?auto_36416 ?auto_36417 ) ) ( not ( = ?auto_36416 ?auto_36418 ) ) ( not ( = ?auto_36416 ?auto_36419 ) ) ( not ( = ?auto_36417 ?auto_36418 ) ) ( not ( = ?auto_36417 ?auto_36419 ) ) ( not ( = ?auto_36418 ?auto_36419 ) ) ( ON ?auto_36419 ?auto_36420 ) ( not ( = ?auto_36415 ?auto_36420 ) ) ( not ( = ?auto_36416 ?auto_36420 ) ) ( not ( = ?auto_36417 ?auto_36420 ) ) ( not ( = ?auto_36418 ?auto_36420 ) ) ( not ( = ?auto_36419 ?auto_36420 ) ) ( CLEAR ?auto_36417 ) ( ON ?auto_36418 ?auto_36419 ) ( CLEAR ?auto_36418 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36420 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36420 ?auto_36419 )
      ( MAKE-5PILE ?auto_36415 ?auto_36416 ?auto_36417 ?auto_36418 ?auto_36419 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36421 - BLOCK
      ?auto_36422 - BLOCK
      ?auto_36423 - BLOCK
      ?auto_36424 - BLOCK
      ?auto_36425 - BLOCK
    )
    :vars
    (
      ?auto_36426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36421 ) ( ON ?auto_36422 ?auto_36421 ) ( not ( = ?auto_36421 ?auto_36422 ) ) ( not ( = ?auto_36421 ?auto_36423 ) ) ( not ( = ?auto_36421 ?auto_36424 ) ) ( not ( = ?auto_36421 ?auto_36425 ) ) ( not ( = ?auto_36422 ?auto_36423 ) ) ( not ( = ?auto_36422 ?auto_36424 ) ) ( not ( = ?auto_36422 ?auto_36425 ) ) ( not ( = ?auto_36423 ?auto_36424 ) ) ( not ( = ?auto_36423 ?auto_36425 ) ) ( not ( = ?auto_36424 ?auto_36425 ) ) ( ON ?auto_36425 ?auto_36426 ) ( not ( = ?auto_36421 ?auto_36426 ) ) ( not ( = ?auto_36422 ?auto_36426 ) ) ( not ( = ?auto_36423 ?auto_36426 ) ) ( not ( = ?auto_36424 ?auto_36426 ) ) ( not ( = ?auto_36425 ?auto_36426 ) ) ( ON ?auto_36424 ?auto_36425 ) ( CLEAR ?auto_36424 ) ( ON-TABLE ?auto_36426 ) ( HOLDING ?auto_36423 ) ( CLEAR ?auto_36422 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36421 ?auto_36422 ?auto_36423 )
      ( MAKE-5PILE ?auto_36421 ?auto_36422 ?auto_36423 ?auto_36424 ?auto_36425 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36427 - BLOCK
      ?auto_36428 - BLOCK
      ?auto_36429 - BLOCK
      ?auto_36430 - BLOCK
      ?auto_36431 - BLOCK
    )
    :vars
    (
      ?auto_36432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36427 ) ( ON ?auto_36428 ?auto_36427 ) ( not ( = ?auto_36427 ?auto_36428 ) ) ( not ( = ?auto_36427 ?auto_36429 ) ) ( not ( = ?auto_36427 ?auto_36430 ) ) ( not ( = ?auto_36427 ?auto_36431 ) ) ( not ( = ?auto_36428 ?auto_36429 ) ) ( not ( = ?auto_36428 ?auto_36430 ) ) ( not ( = ?auto_36428 ?auto_36431 ) ) ( not ( = ?auto_36429 ?auto_36430 ) ) ( not ( = ?auto_36429 ?auto_36431 ) ) ( not ( = ?auto_36430 ?auto_36431 ) ) ( ON ?auto_36431 ?auto_36432 ) ( not ( = ?auto_36427 ?auto_36432 ) ) ( not ( = ?auto_36428 ?auto_36432 ) ) ( not ( = ?auto_36429 ?auto_36432 ) ) ( not ( = ?auto_36430 ?auto_36432 ) ) ( not ( = ?auto_36431 ?auto_36432 ) ) ( ON ?auto_36430 ?auto_36431 ) ( ON-TABLE ?auto_36432 ) ( CLEAR ?auto_36428 ) ( ON ?auto_36429 ?auto_36430 ) ( CLEAR ?auto_36429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36432 ?auto_36431 ?auto_36430 )
      ( MAKE-5PILE ?auto_36427 ?auto_36428 ?auto_36429 ?auto_36430 ?auto_36431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36433 - BLOCK
      ?auto_36434 - BLOCK
      ?auto_36435 - BLOCK
      ?auto_36436 - BLOCK
      ?auto_36437 - BLOCK
    )
    :vars
    (
      ?auto_36438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36433 ) ( not ( = ?auto_36433 ?auto_36434 ) ) ( not ( = ?auto_36433 ?auto_36435 ) ) ( not ( = ?auto_36433 ?auto_36436 ) ) ( not ( = ?auto_36433 ?auto_36437 ) ) ( not ( = ?auto_36434 ?auto_36435 ) ) ( not ( = ?auto_36434 ?auto_36436 ) ) ( not ( = ?auto_36434 ?auto_36437 ) ) ( not ( = ?auto_36435 ?auto_36436 ) ) ( not ( = ?auto_36435 ?auto_36437 ) ) ( not ( = ?auto_36436 ?auto_36437 ) ) ( ON ?auto_36437 ?auto_36438 ) ( not ( = ?auto_36433 ?auto_36438 ) ) ( not ( = ?auto_36434 ?auto_36438 ) ) ( not ( = ?auto_36435 ?auto_36438 ) ) ( not ( = ?auto_36436 ?auto_36438 ) ) ( not ( = ?auto_36437 ?auto_36438 ) ) ( ON ?auto_36436 ?auto_36437 ) ( ON-TABLE ?auto_36438 ) ( ON ?auto_36435 ?auto_36436 ) ( CLEAR ?auto_36435 ) ( HOLDING ?auto_36434 ) ( CLEAR ?auto_36433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36433 ?auto_36434 )
      ( MAKE-5PILE ?auto_36433 ?auto_36434 ?auto_36435 ?auto_36436 ?auto_36437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36439 - BLOCK
      ?auto_36440 - BLOCK
      ?auto_36441 - BLOCK
      ?auto_36442 - BLOCK
      ?auto_36443 - BLOCK
    )
    :vars
    (
      ?auto_36444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36439 ) ( not ( = ?auto_36439 ?auto_36440 ) ) ( not ( = ?auto_36439 ?auto_36441 ) ) ( not ( = ?auto_36439 ?auto_36442 ) ) ( not ( = ?auto_36439 ?auto_36443 ) ) ( not ( = ?auto_36440 ?auto_36441 ) ) ( not ( = ?auto_36440 ?auto_36442 ) ) ( not ( = ?auto_36440 ?auto_36443 ) ) ( not ( = ?auto_36441 ?auto_36442 ) ) ( not ( = ?auto_36441 ?auto_36443 ) ) ( not ( = ?auto_36442 ?auto_36443 ) ) ( ON ?auto_36443 ?auto_36444 ) ( not ( = ?auto_36439 ?auto_36444 ) ) ( not ( = ?auto_36440 ?auto_36444 ) ) ( not ( = ?auto_36441 ?auto_36444 ) ) ( not ( = ?auto_36442 ?auto_36444 ) ) ( not ( = ?auto_36443 ?auto_36444 ) ) ( ON ?auto_36442 ?auto_36443 ) ( ON-TABLE ?auto_36444 ) ( ON ?auto_36441 ?auto_36442 ) ( CLEAR ?auto_36439 ) ( ON ?auto_36440 ?auto_36441 ) ( CLEAR ?auto_36440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36444 ?auto_36443 ?auto_36442 ?auto_36441 )
      ( MAKE-5PILE ?auto_36439 ?auto_36440 ?auto_36441 ?auto_36442 ?auto_36443 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36445 - BLOCK
      ?auto_36446 - BLOCK
      ?auto_36447 - BLOCK
      ?auto_36448 - BLOCK
      ?auto_36449 - BLOCK
    )
    :vars
    (
      ?auto_36450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36445 ?auto_36446 ) ) ( not ( = ?auto_36445 ?auto_36447 ) ) ( not ( = ?auto_36445 ?auto_36448 ) ) ( not ( = ?auto_36445 ?auto_36449 ) ) ( not ( = ?auto_36446 ?auto_36447 ) ) ( not ( = ?auto_36446 ?auto_36448 ) ) ( not ( = ?auto_36446 ?auto_36449 ) ) ( not ( = ?auto_36447 ?auto_36448 ) ) ( not ( = ?auto_36447 ?auto_36449 ) ) ( not ( = ?auto_36448 ?auto_36449 ) ) ( ON ?auto_36449 ?auto_36450 ) ( not ( = ?auto_36445 ?auto_36450 ) ) ( not ( = ?auto_36446 ?auto_36450 ) ) ( not ( = ?auto_36447 ?auto_36450 ) ) ( not ( = ?auto_36448 ?auto_36450 ) ) ( not ( = ?auto_36449 ?auto_36450 ) ) ( ON ?auto_36448 ?auto_36449 ) ( ON-TABLE ?auto_36450 ) ( ON ?auto_36447 ?auto_36448 ) ( ON ?auto_36446 ?auto_36447 ) ( CLEAR ?auto_36446 ) ( HOLDING ?auto_36445 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36445 )
      ( MAKE-5PILE ?auto_36445 ?auto_36446 ?auto_36447 ?auto_36448 ?auto_36449 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36451 - BLOCK
      ?auto_36452 - BLOCK
      ?auto_36453 - BLOCK
      ?auto_36454 - BLOCK
      ?auto_36455 - BLOCK
    )
    :vars
    (
      ?auto_36456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36451 ?auto_36452 ) ) ( not ( = ?auto_36451 ?auto_36453 ) ) ( not ( = ?auto_36451 ?auto_36454 ) ) ( not ( = ?auto_36451 ?auto_36455 ) ) ( not ( = ?auto_36452 ?auto_36453 ) ) ( not ( = ?auto_36452 ?auto_36454 ) ) ( not ( = ?auto_36452 ?auto_36455 ) ) ( not ( = ?auto_36453 ?auto_36454 ) ) ( not ( = ?auto_36453 ?auto_36455 ) ) ( not ( = ?auto_36454 ?auto_36455 ) ) ( ON ?auto_36455 ?auto_36456 ) ( not ( = ?auto_36451 ?auto_36456 ) ) ( not ( = ?auto_36452 ?auto_36456 ) ) ( not ( = ?auto_36453 ?auto_36456 ) ) ( not ( = ?auto_36454 ?auto_36456 ) ) ( not ( = ?auto_36455 ?auto_36456 ) ) ( ON ?auto_36454 ?auto_36455 ) ( ON-TABLE ?auto_36456 ) ( ON ?auto_36453 ?auto_36454 ) ( ON ?auto_36452 ?auto_36453 ) ( ON ?auto_36451 ?auto_36452 ) ( CLEAR ?auto_36451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36456 ?auto_36455 ?auto_36454 ?auto_36453 ?auto_36452 )
      ( MAKE-5PILE ?auto_36451 ?auto_36452 ?auto_36453 ?auto_36454 ?auto_36455 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36461 - BLOCK
      ?auto_36462 - BLOCK
      ?auto_36463 - BLOCK
      ?auto_36464 - BLOCK
    )
    :vars
    (
      ?auto_36465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36465 ?auto_36464 ) ( CLEAR ?auto_36465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36461 ) ( ON ?auto_36462 ?auto_36461 ) ( ON ?auto_36463 ?auto_36462 ) ( ON ?auto_36464 ?auto_36463 ) ( not ( = ?auto_36461 ?auto_36462 ) ) ( not ( = ?auto_36461 ?auto_36463 ) ) ( not ( = ?auto_36461 ?auto_36464 ) ) ( not ( = ?auto_36461 ?auto_36465 ) ) ( not ( = ?auto_36462 ?auto_36463 ) ) ( not ( = ?auto_36462 ?auto_36464 ) ) ( not ( = ?auto_36462 ?auto_36465 ) ) ( not ( = ?auto_36463 ?auto_36464 ) ) ( not ( = ?auto_36463 ?auto_36465 ) ) ( not ( = ?auto_36464 ?auto_36465 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36465 ?auto_36464 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36477 - BLOCK
      ?auto_36478 - BLOCK
      ?auto_36479 - BLOCK
      ?auto_36480 - BLOCK
    )
    :vars
    (
      ?auto_36481 - BLOCK
      ?auto_36482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36477 ) ( ON ?auto_36478 ?auto_36477 ) ( ON ?auto_36479 ?auto_36478 ) ( not ( = ?auto_36477 ?auto_36478 ) ) ( not ( = ?auto_36477 ?auto_36479 ) ) ( not ( = ?auto_36477 ?auto_36480 ) ) ( not ( = ?auto_36477 ?auto_36481 ) ) ( not ( = ?auto_36478 ?auto_36479 ) ) ( not ( = ?auto_36478 ?auto_36480 ) ) ( not ( = ?auto_36478 ?auto_36481 ) ) ( not ( = ?auto_36479 ?auto_36480 ) ) ( not ( = ?auto_36479 ?auto_36481 ) ) ( not ( = ?auto_36480 ?auto_36481 ) ) ( ON ?auto_36481 ?auto_36482 ) ( CLEAR ?auto_36481 ) ( not ( = ?auto_36477 ?auto_36482 ) ) ( not ( = ?auto_36478 ?auto_36482 ) ) ( not ( = ?auto_36479 ?auto_36482 ) ) ( not ( = ?auto_36480 ?auto_36482 ) ) ( not ( = ?auto_36481 ?auto_36482 ) ) ( HOLDING ?auto_36480 ) ( CLEAR ?auto_36479 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36477 ?auto_36478 ?auto_36479 ?auto_36480 ?auto_36481 )
      ( MAKE-4PILE ?auto_36477 ?auto_36478 ?auto_36479 ?auto_36480 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36483 - BLOCK
      ?auto_36484 - BLOCK
      ?auto_36485 - BLOCK
      ?auto_36486 - BLOCK
    )
    :vars
    (
      ?auto_36487 - BLOCK
      ?auto_36488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36483 ) ( ON ?auto_36484 ?auto_36483 ) ( ON ?auto_36485 ?auto_36484 ) ( not ( = ?auto_36483 ?auto_36484 ) ) ( not ( = ?auto_36483 ?auto_36485 ) ) ( not ( = ?auto_36483 ?auto_36486 ) ) ( not ( = ?auto_36483 ?auto_36487 ) ) ( not ( = ?auto_36484 ?auto_36485 ) ) ( not ( = ?auto_36484 ?auto_36486 ) ) ( not ( = ?auto_36484 ?auto_36487 ) ) ( not ( = ?auto_36485 ?auto_36486 ) ) ( not ( = ?auto_36485 ?auto_36487 ) ) ( not ( = ?auto_36486 ?auto_36487 ) ) ( ON ?auto_36487 ?auto_36488 ) ( not ( = ?auto_36483 ?auto_36488 ) ) ( not ( = ?auto_36484 ?auto_36488 ) ) ( not ( = ?auto_36485 ?auto_36488 ) ) ( not ( = ?auto_36486 ?auto_36488 ) ) ( not ( = ?auto_36487 ?auto_36488 ) ) ( CLEAR ?auto_36485 ) ( ON ?auto_36486 ?auto_36487 ) ( CLEAR ?auto_36486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36488 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36488 ?auto_36487 )
      ( MAKE-4PILE ?auto_36483 ?auto_36484 ?auto_36485 ?auto_36486 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36489 - BLOCK
      ?auto_36490 - BLOCK
      ?auto_36491 - BLOCK
      ?auto_36492 - BLOCK
    )
    :vars
    (
      ?auto_36494 - BLOCK
      ?auto_36493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36489 ) ( ON ?auto_36490 ?auto_36489 ) ( not ( = ?auto_36489 ?auto_36490 ) ) ( not ( = ?auto_36489 ?auto_36491 ) ) ( not ( = ?auto_36489 ?auto_36492 ) ) ( not ( = ?auto_36489 ?auto_36494 ) ) ( not ( = ?auto_36490 ?auto_36491 ) ) ( not ( = ?auto_36490 ?auto_36492 ) ) ( not ( = ?auto_36490 ?auto_36494 ) ) ( not ( = ?auto_36491 ?auto_36492 ) ) ( not ( = ?auto_36491 ?auto_36494 ) ) ( not ( = ?auto_36492 ?auto_36494 ) ) ( ON ?auto_36494 ?auto_36493 ) ( not ( = ?auto_36489 ?auto_36493 ) ) ( not ( = ?auto_36490 ?auto_36493 ) ) ( not ( = ?auto_36491 ?auto_36493 ) ) ( not ( = ?auto_36492 ?auto_36493 ) ) ( not ( = ?auto_36494 ?auto_36493 ) ) ( ON ?auto_36492 ?auto_36494 ) ( CLEAR ?auto_36492 ) ( ON-TABLE ?auto_36493 ) ( HOLDING ?auto_36491 ) ( CLEAR ?auto_36490 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36489 ?auto_36490 ?auto_36491 )
      ( MAKE-4PILE ?auto_36489 ?auto_36490 ?auto_36491 ?auto_36492 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36495 - BLOCK
      ?auto_36496 - BLOCK
      ?auto_36497 - BLOCK
      ?auto_36498 - BLOCK
    )
    :vars
    (
      ?auto_36499 - BLOCK
      ?auto_36500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36495 ) ( ON ?auto_36496 ?auto_36495 ) ( not ( = ?auto_36495 ?auto_36496 ) ) ( not ( = ?auto_36495 ?auto_36497 ) ) ( not ( = ?auto_36495 ?auto_36498 ) ) ( not ( = ?auto_36495 ?auto_36499 ) ) ( not ( = ?auto_36496 ?auto_36497 ) ) ( not ( = ?auto_36496 ?auto_36498 ) ) ( not ( = ?auto_36496 ?auto_36499 ) ) ( not ( = ?auto_36497 ?auto_36498 ) ) ( not ( = ?auto_36497 ?auto_36499 ) ) ( not ( = ?auto_36498 ?auto_36499 ) ) ( ON ?auto_36499 ?auto_36500 ) ( not ( = ?auto_36495 ?auto_36500 ) ) ( not ( = ?auto_36496 ?auto_36500 ) ) ( not ( = ?auto_36497 ?auto_36500 ) ) ( not ( = ?auto_36498 ?auto_36500 ) ) ( not ( = ?auto_36499 ?auto_36500 ) ) ( ON ?auto_36498 ?auto_36499 ) ( ON-TABLE ?auto_36500 ) ( CLEAR ?auto_36496 ) ( ON ?auto_36497 ?auto_36498 ) ( CLEAR ?auto_36497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36500 ?auto_36499 ?auto_36498 )
      ( MAKE-4PILE ?auto_36495 ?auto_36496 ?auto_36497 ?auto_36498 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36501 - BLOCK
      ?auto_36502 - BLOCK
      ?auto_36503 - BLOCK
      ?auto_36504 - BLOCK
    )
    :vars
    (
      ?auto_36506 - BLOCK
      ?auto_36505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36501 ) ( not ( = ?auto_36501 ?auto_36502 ) ) ( not ( = ?auto_36501 ?auto_36503 ) ) ( not ( = ?auto_36501 ?auto_36504 ) ) ( not ( = ?auto_36501 ?auto_36506 ) ) ( not ( = ?auto_36502 ?auto_36503 ) ) ( not ( = ?auto_36502 ?auto_36504 ) ) ( not ( = ?auto_36502 ?auto_36506 ) ) ( not ( = ?auto_36503 ?auto_36504 ) ) ( not ( = ?auto_36503 ?auto_36506 ) ) ( not ( = ?auto_36504 ?auto_36506 ) ) ( ON ?auto_36506 ?auto_36505 ) ( not ( = ?auto_36501 ?auto_36505 ) ) ( not ( = ?auto_36502 ?auto_36505 ) ) ( not ( = ?auto_36503 ?auto_36505 ) ) ( not ( = ?auto_36504 ?auto_36505 ) ) ( not ( = ?auto_36506 ?auto_36505 ) ) ( ON ?auto_36504 ?auto_36506 ) ( ON-TABLE ?auto_36505 ) ( ON ?auto_36503 ?auto_36504 ) ( CLEAR ?auto_36503 ) ( HOLDING ?auto_36502 ) ( CLEAR ?auto_36501 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36501 ?auto_36502 )
      ( MAKE-4PILE ?auto_36501 ?auto_36502 ?auto_36503 ?auto_36504 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36507 - BLOCK
      ?auto_36508 - BLOCK
      ?auto_36509 - BLOCK
      ?auto_36510 - BLOCK
    )
    :vars
    (
      ?auto_36512 - BLOCK
      ?auto_36511 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36507 ) ( not ( = ?auto_36507 ?auto_36508 ) ) ( not ( = ?auto_36507 ?auto_36509 ) ) ( not ( = ?auto_36507 ?auto_36510 ) ) ( not ( = ?auto_36507 ?auto_36512 ) ) ( not ( = ?auto_36508 ?auto_36509 ) ) ( not ( = ?auto_36508 ?auto_36510 ) ) ( not ( = ?auto_36508 ?auto_36512 ) ) ( not ( = ?auto_36509 ?auto_36510 ) ) ( not ( = ?auto_36509 ?auto_36512 ) ) ( not ( = ?auto_36510 ?auto_36512 ) ) ( ON ?auto_36512 ?auto_36511 ) ( not ( = ?auto_36507 ?auto_36511 ) ) ( not ( = ?auto_36508 ?auto_36511 ) ) ( not ( = ?auto_36509 ?auto_36511 ) ) ( not ( = ?auto_36510 ?auto_36511 ) ) ( not ( = ?auto_36512 ?auto_36511 ) ) ( ON ?auto_36510 ?auto_36512 ) ( ON-TABLE ?auto_36511 ) ( ON ?auto_36509 ?auto_36510 ) ( CLEAR ?auto_36507 ) ( ON ?auto_36508 ?auto_36509 ) ( CLEAR ?auto_36508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36511 ?auto_36512 ?auto_36510 ?auto_36509 )
      ( MAKE-4PILE ?auto_36507 ?auto_36508 ?auto_36509 ?auto_36510 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36513 - BLOCK
      ?auto_36514 - BLOCK
      ?auto_36515 - BLOCK
      ?auto_36516 - BLOCK
    )
    :vars
    (
      ?auto_36517 - BLOCK
      ?auto_36518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36513 ?auto_36514 ) ) ( not ( = ?auto_36513 ?auto_36515 ) ) ( not ( = ?auto_36513 ?auto_36516 ) ) ( not ( = ?auto_36513 ?auto_36517 ) ) ( not ( = ?auto_36514 ?auto_36515 ) ) ( not ( = ?auto_36514 ?auto_36516 ) ) ( not ( = ?auto_36514 ?auto_36517 ) ) ( not ( = ?auto_36515 ?auto_36516 ) ) ( not ( = ?auto_36515 ?auto_36517 ) ) ( not ( = ?auto_36516 ?auto_36517 ) ) ( ON ?auto_36517 ?auto_36518 ) ( not ( = ?auto_36513 ?auto_36518 ) ) ( not ( = ?auto_36514 ?auto_36518 ) ) ( not ( = ?auto_36515 ?auto_36518 ) ) ( not ( = ?auto_36516 ?auto_36518 ) ) ( not ( = ?auto_36517 ?auto_36518 ) ) ( ON ?auto_36516 ?auto_36517 ) ( ON-TABLE ?auto_36518 ) ( ON ?auto_36515 ?auto_36516 ) ( ON ?auto_36514 ?auto_36515 ) ( CLEAR ?auto_36514 ) ( HOLDING ?auto_36513 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36513 )
      ( MAKE-4PILE ?auto_36513 ?auto_36514 ?auto_36515 ?auto_36516 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36519 - BLOCK
      ?auto_36520 - BLOCK
      ?auto_36521 - BLOCK
      ?auto_36522 - BLOCK
    )
    :vars
    (
      ?auto_36523 - BLOCK
      ?auto_36524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36519 ?auto_36520 ) ) ( not ( = ?auto_36519 ?auto_36521 ) ) ( not ( = ?auto_36519 ?auto_36522 ) ) ( not ( = ?auto_36519 ?auto_36523 ) ) ( not ( = ?auto_36520 ?auto_36521 ) ) ( not ( = ?auto_36520 ?auto_36522 ) ) ( not ( = ?auto_36520 ?auto_36523 ) ) ( not ( = ?auto_36521 ?auto_36522 ) ) ( not ( = ?auto_36521 ?auto_36523 ) ) ( not ( = ?auto_36522 ?auto_36523 ) ) ( ON ?auto_36523 ?auto_36524 ) ( not ( = ?auto_36519 ?auto_36524 ) ) ( not ( = ?auto_36520 ?auto_36524 ) ) ( not ( = ?auto_36521 ?auto_36524 ) ) ( not ( = ?auto_36522 ?auto_36524 ) ) ( not ( = ?auto_36523 ?auto_36524 ) ) ( ON ?auto_36522 ?auto_36523 ) ( ON-TABLE ?auto_36524 ) ( ON ?auto_36521 ?auto_36522 ) ( ON ?auto_36520 ?auto_36521 ) ( ON ?auto_36519 ?auto_36520 ) ( CLEAR ?auto_36519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36524 ?auto_36523 ?auto_36522 ?auto_36521 ?auto_36520 )
      ( MAKE-4PILE ?auto_36519 ?auto_36520 ?auto_36521 ?auto_36522 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36526 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36526 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_36526 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36527 - BLOCK
    )
    :vars
    (
      ?auto_36528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36527 ?auto_36528 ) ( CLEAR ?auto_36527 ) ( HAND-EMPTY ) ( not ( = ?auto_36527 ?auto_36528 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36527 ?auto_36528 )
      ( MAKE-1PILE ?auto_36527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36529 - BLOCK
    )
    :vars
    (
      ?auto_36530 - BLOCK
      ?auto_36531 - BLOCK
      ?auto_36532 - BLOCK
      ?auto_36533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36529 ?auto_36530 ) ) ( HOLDING ?auto_36529 ) ( CLEAR ?auto_36530 ) ( ON-TABLE ?auto_36531 ) ( ON ?auto_36532 ?auto_36531 ) ( ON ?auto_36533 ?auto_36532 ) ( ON ?auto_36530 ?auto_36533 ) ( not ( = ?auto_36531 ?auto_36532 ) ) ( not ( = ?auto_36531 ?auto_36533 ) ) ( not ( = ?auto_36531 ?auto_36530 ) ) ( not ( = ?auto_36531 ?auto_36529 ) ) ( not ( = ?auto_36532 ?auto_36533 ) ) ( not ( = ?auto_36532 ?auto_36530 ) ) ( not ( = ?auto_36532 ?auto_36529 ) ) ( not ( = ?auto_36533 ?auto_36530 ) ) ( not ( = ?auto_36533 ?auto_36529 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36531 ?auto_36532 ?auto_36533 ?auto_36530 ?auto_36529 )
      ( MAKE-1PILE ?auto_36529 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36534 - BLOCK
    )
    :vars
    (
      ?auto_36538 - BLOCK
      ?auto_36535 - BLOCK
      ?auto_36536 - BLOCK
      ?auto_36537 - BLOCK
      ?auto_36539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36534 ?auto_36538 ) ) ( CLEAR ?auto_36538 ) ( ON-TABLE ?auto_36535 ) ( ON ?auto_36536 ?auto_36535 ) ( ON ?auto_36537 ?auto_36536 ) ( ON ?auto_36538 ?auto_36537 ) ( not ( = ?auto_36535 ?auto_36536 ) ) ( not ( = ?auto_36535 ?auto_36537 ) ) ( not ( = ?auto_36535 ?auto_36538 ) ) ( not ( = ?auto_36535 ?auto_36534 ) ) ( not ( = ?auto_36536 ?auto_36537 ) ) ( not ( = ?auto_36536 ?auto_36538 ) ) ( not ( = ?auto_36536 ?auto_36534 ) ) ( not ( = ?auto_36537 ?auto_36538 ) ) ( not ( = ?auto_36537 ?auto_36534 ) ) ( ON ?auto_36534 ?auto_36539 ) ( CLEAR ?auto_36534 ) ( HAND-EMPTY ) ( not ( = ?auto_36534 ?auto_36539 ) ) ( not ( = ?auto_36538 ?auto_36539 ) ) ( not ( = ?auto_36535 ?auto_36539 ) ) ( not ( = ?auto_36536 ?auto_36539 ) ) ( not ( = ?auto_36537 ?auto_36539 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36534 ?auto_36539 )
      ( MAKE-1PILE ?auto_36534 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36540 - BLOCK
    )
    :vars
    (
      ?auto_36544 - BLOCK
      ?auto_36542 - BLOCK
      ?auto_36543 - BLOCK
      ?auto_36541 - BLOCK
      ?auto_36545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36540 ?auto_36544 ) ) ( ON-TABLE ?auto_36542 ) ( ON ?auto_36543 ?auto_36542 ) ( ON ?auto_36541 ?auto_36543 ) ( not ( = ?auto_36542 ?auto_36543 ) ) ( not ( = ?auto_36542 ?auto_36541 ) ) ( not ( = ?auto_36542 ?auto_36544 ) ) ( not ( = ?auto_36542 ?auto_36540 ) ) ( not ( = ?auto_36543 ?auto_36541 ) ) ( not ( = ?auto_36543 ?auto_36544 ) ) ( not ( = ?auto_36543 ?auto_36540 ) ) ( not ( = ?auto_36541 ?auto_36544 ) ) ( not ( = ?auto_36541 ?auto_36540 ) ) ( ON ?auto_36540 ?auto_36545 ) ( CLEAR ?auto_36540 ) ( not ( = ?auto_36540 ?auto_36545 ) ) ( not ( = ?auto_36544 ?auto_36545 ) ) ( not ( = ?auto_36542 ?auto_36545 ) ) ( not ( = ?auto_36543 ?auto_36545 ) ) ( not ( = ?auto_36541 ?auto_36545 ) ) ( HOLDING ?auto_36544 ) ( CLEAR ?auto_36541 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36542 ?auto_36543 ?auto_36541 ?auto_36544 )
      ( MAKE-1PILE ?auto_36540 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36546 - BLOCK
    )
    :vars
    (
      ?auto_36550 - BLOCK
      ?auto_36549 - BLOCK
      ?auto_36548 - BLOCK
      ?auto_36547 - BLOCK
      ?auto_36551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36546 ?auto_36550 ) ) ( ON-TABLE ?auto_36549 ) ( ON ?auto_36548 ?auto_36549 ) ( ON ?auto_36547 ?auto_36548 ) ( not ( = ?auto_36549 ?auto_36548 ) ) ( not ( = ?auto_36549 ?auto_36547 ) ) ( not ( = ?auto_36549 ?auto_36550 ) ) ( not ( = ?auto_36549 ?auto_36546 ) ) ( not ( = ?auto_36548 ?auto_36547 ) ) ( not ( = ?auto_36548 ?auto_36550 ) ) ( not ( = ?auto_36548 ?auto_36546 ) ) ( not ( = ?auto_36547 ?auto_36550 ) ) ( not ( = ?auto_36547 ?auto_36546 ) ) ( ON ?auto_36546 ?auto_36551 ) ( not ( = ?auto_36546 ?auto_36551 ) ) ( not ( = ?auto_36550 ?auto_36551 ) ) ( not ( = ?auto_36549 ?auto_36551 ) ) ( not ( = ?auto_36548 ?auto_36551 ) ) ( not ( = ?auto_36547 ?auto_36551 ) ) ( CLEAR ?auto_36547 ) ( ON ?auto_36550 ?auto_36546 ) ( CLEAR ?auto_36550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36551 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36551 ?auto_36546 )
      ( MAKE-1PILE ?auto_36546 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36552 - BLOCK
    )
    :vars
    (
      ?auto_36554 - BLOCK
      ?auto_36557 - BLOCK
      ?auto_36556 - BLOCK
      ?auto_36555 - BLOCK
      ?auto_36553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36552 ?auto_36554 ) ) ( ON-TABLE ?auto_36557 ) ( ON ?auto_36556 ?auto_36557 ) ( not ( = ?auto_36557 ?auto_36556 ) ) ( not ( = ?auto_36557 ?auto_36555 ) ) ( not ( = ?auto_36557 ?auto_36554 ) ) ( not ( = ?auto_36557 ?auto_36552 ) ) ( not ( = ?auto_36556 ?auto_36555 ) ) ( not ( = ?auto_36556 ?auto_36554 ) ) ( not ( = ?auto_36556 ?auto_36552 ) ) ( not ( = ?auto_36555 ?auto_36554 ) ) ( not ( = ?auto_36555 ?auto_36552 ) ) ( ON ?auto_36552 ?auto_36553 ) ( not ( = ?auto_36552 ?auto_36553 ) ) ( not ( = ?auto_36554 ?auto_36553 ) ) ( not ( = ?auto_36557 ?auto_36553 ) ) ( not ( = ?auto_36556 ?auto_36553 ) ) ( not ( = ?auto_36555 ?auto_36553 ) ) ( ON ?auto_36554 ?auto_36552 ) ( CLEAR ?auto_36554 ) ( ON-TABLE ?auto_36553 ) ( HOLDING ?auto_36555 ) ( CLEAR ?auto_36556 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36557 ?auto_36556 ?auto_36555 )
      ( MAKE-1PILE ?auto_36552 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36558 - BLOCK
    )
    :vars
    (
      ?auto_36563 - BLOCK
      ?auto_36560 - BLOCK
      ?auto_36559 - BLOCK
      ?auto_36562 - BLOCK
      ?auto_36561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36558 ?auto_36563 ) ) ( ON-TABLE ?auto_36560 ) ( ON ?auto_36559 ?auto_36560 ) ( not ( = ?auto_36560 ?auto_36559 ) ) ( not ( = ?auto_36560 ?auto_36562 ) ) ( not ( = ?auto_36560 ?auto_36563 ) ) ( not ( = ?auto_36560 ?auto_36558 ) ) ( not ( = ?auto_36559 ?auto_36562 ) ) ( not ( = ?auto_36559 ?auto_36563 ) ) ( not ( = ?auto_36559 ?auto_36558 ) ) ( not ( = ?auto_36562 ?auto_36563 ) ) ( not ( = ?auto_36562 ?auto_36558 ) ) ( ON ?auto_36558 ?auto_36561 ) ( not ( = ?auto_36558 ?auto_36561 ) ) ( not ( = ?auto_36563 ?auto_36561 ) ) ( not ( = ?auto_36560 ?auto_36561 ) ) ( not ( = ?auto_36559 ?auto_36561 ) ) ( not ( = ?auto_36562 ?auto_36561 ) ) ( ON ?auto_36563 ?auto_36558 ) ( ON-TABLE ?auto_36561 ) ( CLEAR ?auto_36559 ) ( ON ?auto_36562 ?auto_36563 ) ( CLEAR ?auto_36562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36561 ?auto_36558 ?auto_36563 )
      ( MAKE-1PILE ?auto_36558 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36564 - BLOCK
    )
    :vars
    (
      ?auto_36565 - BLOCK
      ?auto_36569 - BLOCK
      ?auto_36567 - BLOCK
      ?auto_36566 - BLOCK
      ?auto_36568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36564 ?auto_36565 ) ) ( ON-TABLE ?auto_36569 ) ( not ( = ?auto_36569 ?auto_36567 ) ) ( not ( = ?auto_36569 ?auto_36566 ) ) ( not ( = ?auto_36569 ?auto_36565 ) ) ( not ( = ?auto_36569 ?auto_36564 ) ) ( not ( = ?auto_36567 ?auto_36566 ) ) ( not ( = ?auto_36567 ?auto_36565 ) ) ( not ( = ?auto_36567 ?auto_36564 ) ) ( not ( = ?auto_36566 ?auto_36565 ) ) ( not ( = ?auto_36566 ?auto_36564 ) ) ( ON ?auto_36564 ?auto_36568 ) ( not ( = ?auto_36564 ?auto_36568 ) ) ( not ( = ?auto_36565 ?auto_36568 ) ) ( not ( = ?auto_36569 ?auto_36568 ) ) ( not ( = ?auto_36567 ?auto_36568 ) ) ( not ( = ?auto_36566 ?auto_36568 ) ) ( ON ?auto_36565 ?auto_36564 ) ( ON-TABLE ?auto_36568 ) ( ON ?auto_36566 ?auto_36565 ) ( CLEAR ?auto_36566 ) ( HOLDING ?auto_36567 ) ( CLEAR ?auto_36569 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36569 ?auto_36567 )
      ( MAKE-1PILE ?auto_36564 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36570 - BLOCK
    )
    :vars
    (
      ?auto_36573 - BLOCK
      ?auto_36572 - BLOCK
      ?auto_36575 - BLOCK
      ?auto_36571 - BLOCK
      ?auto_36574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36570 ?auto_36573 ) ) ( ON-TABLE ?auto_36572 ) ( not ( = ?auto_36572 ?auto_36575 ) ) ( not ( = ?auto_36572 ?auto_36571 ) ) ( not ( = ?auto_36572 ?auto_36573 ) ) ( not ( = ?auto_36572 ?auto_36570 ) ) ( not ( = ?auto_36575 ?auto_36571 ) ) ( not ( = ?auto_36575 ?auto_36573 ) ) ( not ( = ?auto_36575 ?auto_36570 ) ) ( not ( = ?auto_36571 ?auto_36573 ) ) ( not ( = ?auto_36571 ?auto_36570 ) ) ( ON ?auto_36570 ?auto_36574 ) ( not ( = ?auto_36570 ?auto_36574 ) ) ( not ( = ?auto_36573 ?auto_36574 ) ) ( not ( = ?auto_36572 ?auto_36574 ) ) ( not ( = ?auto_36575 ?auto_36574 ) ) ( not ( = ?auto_36571 ?auto_36574 ) ) ( ON ?auto_36573 ?auto_36570 ) ( ON-TABLE ?auto_36574 ) ( ON ?auto_36571 ?auto_36573 ) ( CLEAR ?auto_36572 ) ( ON ?auto_36575 ?auto_36571 ) ( CLEAR ?auto_36575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36574 ?auto_36570 ?auto_36573 ?auto_36571 )
      ( MAKE-1PILE ?auto_36570 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36576 - BLOCK
    )
    :vars
    (
      ?auto_36578 - BLOCK
      ?auto_36579 - BLOCK
      ?auto_36577 - BLOCK
      ?auto_36581 - BLOCK
      ?auto_36580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36576 ?auto_36578 ) ) ( not ( = ?auto_36579 ?auto_36577 ) ) ( not ( = ?auto_36579 ?auto_36581 ) ) ( not ( = ?auto_36579 ?auto_36578 ) ) ( not ( = ?auto_36579 ?auto_36576 ) ) ( not ( = ?auto_36577 ?auto_36581 ) ) ( not ( = ?auto_36577 ?auto_36578 ) ) ( not ( = ?auto_36577 ?auto_36576 ) ) ( not ( = ?auto_36581 ?auto_36578 ) ) ( not ( = ?auto_36581 ?auto_36576 ) ) ( ON ?auto_36576 ?auto_36580 ) ( not ( = ?auto_36576 ?auto_36580 ) ) ( not ( = ?auto_36578 ?auto_36580 ) ) ( not ( = ?auto_36579 ?auto_36580 ) ) ( not ( = ?auto_36577 ?auto_36580 ) ) ( not ( = ?auto_36581 ?auto_36580 ) ) ( ON ?auto_36578 ?auto_36576 ) ( ON-TABLE ?auto_36580 ) ( ON ?auto_36581 ?auto_36578 ) ( ON ?auto_36577 ?auto_36581 ) ( CLEAR ?auto_36577 ) ( HOLDING ?auto_36579 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36579 )
      ( MAKE-1PILE ?auto_36576 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36582 - BLOCK
    )
    :vars
    (
      ?auto_36585 - BLOCK
      ?auto_36587 - BLOCK
      ?auto_36583 - BLOCK
      ?auto_36584 - BLOCK
      ?auto_36586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36582 ?auto_36585 ) ) ( not ( = ?auto_36587 ?auto_36583 ) ) ( not ( = ?auto_36587 ?auto_36584 ) ) ( not ( = ?auto_36587 ?auto_36585 ) ) ( not ( = ?auto_36587 ?auto_36582 ) ) ( not ( = ?auto_36583 ?auto_36584 ) ) ( not ( = ?auto_36583 ?auto_36585 ) ) ( not ( = ?auto_36583 ?auto_36582 ) ) ( not ( = ?auto_36584 ?auto_36585 ) ) ( not ( = ?auto_36584 ?auto_36582 ) ) ( ON ?auto_36582 ?auto_36586 ) ( not ( = ?auto_36582 ?auto_36586 ) ) ( not ( = ?auto_36585 ?auto_36586 ) ) ( not ( = ?auto_36587 ?auto_36586 ) ) ( not ( = ?auto_36583 ?auto_36586 ) ) ( not ( = ?auto_36584 ?auto_36586 ) ) ( ON ?auto_36585 ?auto_36582 ) ( ON-TABLE ?auto_36586 ) ( ON ?auto_36584 ?auto_36585 ) ( ON ?auto_36583 ?auto_36584 ) ( ON ?auto_36587 ?auto_36583 ) ( CLEAR ?auto_36587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36586 ?auto_36582 ?auto_36585 ?auto_36584 ?auto_36583 )
      ( MAKE-1PILE ?auto_36582 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36591 - BLOCK
      ?auto_36592 - BLOCK
      ?auto_36593 - BLOCK
    )
    :vars
    (
      ?auto_36594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36594 ?auto_36593 ) ( CLEAR ?auto_36594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36591 ) ( ON ?auto_36592 ?auto_36591 ) ( ON ?auto_36593 ?auto_36592 ) ( not ( = ?auto_36591 ?auto_36592 ) ) ( not ( = ?auto_36591 ?auto_36593 ) ) ( not ( = ?auto_36591 ?auto_36594 ) ) ( not ( = ?auto_36592 ?auto_36593 ) ) ( not ( = ?auto_36592 ?auto_36594 ) ) ( not ( = ?auto_36593 ?auto_36594 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36594 ?auto_36593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36595 - BLOCK
      ?auto_36596 - BLOCK
      ?auto_36597 - BLOCK
    )
    :vars
    (
      ?auto_36598 - BLOCK
      ?auto_36599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36598 ?auto_36597 ) ( CLEAR ?auto_36598 ) ( ON-TABLE ?auto_36595 ) ( ON ?auto_36596 ?auto_36595 ) ( ON ?auto_36597 ?auto_36596 ) ( not ( = ?auto_36595 ?auto_36596 ) ) ( not ( = ?auto_36595 ?auto_36597 ) ) ( not ( = ?auto_36595 ?auto_36598 ) ) ( not ( = ?auto_36596 ?auto_36597 ) ) ( not ( = ?auto_36596 ?auto_36598 ) ) ( not ( = ?auto_36597 ?auto_36598 ) ) ( HOLDING ?auto_36599 ) ( not ( = ?auto_36595 ?auto_36599 ) ) ( not ( = ?auto_36596 ?auto_36599 ) ) ( not ( = ?auto_36597 ?auto_36599 ) ) ( not ( = ?auto_36598 ?auto_36599 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_36599 )
      ( MAKE-3PILE ?auto_36595 ?auto_36596 ?auto_36597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36600 - BLOCK
      ?auto_36601 - BLOCK
      ?auto_36602 - BLOCK
    )
    :vars
    (
      ?auto_36603 - BLOCK
      ?auto_36604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36603 ?auto_36602 ) ( ON-TABLE ?auto_36600 ) ( ON ?auto_36601 ?auto_36600 ) ( ON ?auto_36602 ?auto_36601 ) ( not ( = ?auto_36600 ?auto_36601 ) ) ( not ( = ?auto_36600 ?auto_36602 ) ) ( not ( = ?auto_36600 ?auto_36603 ) ) ( not ( = ?auto_36601 ?auto_36602 ) ) ( not ( = ?auto_36601 ?auto_36603 ) ) ( not ( = ?auto_36602 ?auto_36603 ) ) ( not ( = ?auto_36600 ?auto_36604 ) ) ( not ( = ?auto_36601 ?auto_36604 ) ) ( not ( = ?auto_36602 ?auto_36604 ) ) ( not ( = ?auto_36603 ?auto_36604 ) ) ( ON ?auto_36604 ?auto_36603 ) ( CLEAR ?auto_36604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36600 ?auto_36601 ?auto_36602 ?auto_36603 )
      ( MAKE-3PILE ?auto_36600 ?auto_36601 ?auto_36602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36605 - BLOCK
      ?auto_36606 - BLOCK
      ?auto_36607 - BLOCK
    )
    :vars
    (
      ?auto_36608 - BLOCK
      ?auto_36609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36608 ?auto_36607 ) ( ON-TABLE ?auto_36605 ) ( ON ?auto_36606 ?auto_36605 ) ( ON ?auto_36607 ?auto_36606 ) ( not ( = ?auto_36605 ?auto_36606 ) ) ( not ( = ?auto_36605 ?auto_36607 ) ) ( not ( = ?auto_36605 ?auto_36608 ) ) ( not ( = ?auto_36606 ?auto_36607 ) ) ( not ( = ?auto_36606 ?auto_36608 ) ) ( not ( = ?auto_36607 ?auto_36608 ) ) ( not ( = ?auto_36605 ?auto_36609 ) ) ( not ( = ?auto_36606 ?auto_36609 ) ) ( not ( = ?auto_36607 ?auto_36609 ) ) ( not ( = ?auto_36608 ?auto_36609 ) ) ( HOLDING ?auto_36609 ) ( CLEAR ?auto_36608 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36605 ?auto_36606 ?auto_36607 ?auto_36608 ?auto_36609 )
      ( MAKE-3PILE ?auto_36605 ?auto_36606 ?auto_36607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36610 - BLOCK
      ?auto_36611 - BLOCK
      ?auto_36612 - BLOCK
    )
    :vars
    (
      ?auto_36613 - BLOCK
      ?auto_36614 - BLOCK
      ?auto_36615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36613 ?auto_36612 ) ( ON-TABLE ?auto_36610 ) ( ON ?auto_36611 ?auto_36610 ) ( ON ?auto_36612 ?auto_36611 ) ( not ( = ?auto_36610 ?auto_36611 ) ) ( not ( = ?auto_36610 ?auto_36612 ) ) ( not ( = ?auto_36610 ?auto_36613 ) ) ( not ( = ?auto_36611 ?auto_36612 ) ) ( not ( = ?auto_36611 ?auto_36613 ) ) ( not ( = ?auto_36612 ?auto_36613 ) ) ( not ( = ?auto_36610 ?auto_36614 ) ) ( not ( = ?auto_36611 ?auto_36614 ) ) ( not ( = ?auto_36612 ?auto_36614 ) ) ( not ( = ?auto_36613 ?auto_36614 ) ) ( CLEAR ?auto_36613 ) ( ON ?auto_36614 ?auto_36615 ) ( CLEAR ?auto_36614 ) ( HAND-EMPTY ) ( not ( = ?auto_36610 ?auto_36615 ) ) ( not ( = ?auto_36611 ?auto_36615 ) ) ( not ( = ?auto_36612 ?auto_36615 ) ) ( not ( = ?auto_36613 ?auto_36615 ) ) ( not ( = ?auto_36614 ?auto_36615 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36614 ?auto_36615 )
      ( MAKE-3PILE ?auto_36610 ?auto_36611 ?auto_36612 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36628 - BLOCK
      ?auto_36629 - BLOCK
      ?auto_36630 - BLOCK
    )
    :vars
    (
      ?auto_36632 - BLOCK
      ?auto_36633 - BLOCK
      ?auto_36631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36628 ) ( ON ?auto_36629 ?auto_36628 ) ( not ( = ?auto_36628 ?auto_36629 ) ) ( not ( = ?auto_36628 ?auto_36630 ) ) ( not ( = ?auto_36628 ?auto_36632 ) ) ( not ( = ?auto_36629 ?auto_36630 ) ) ( not ( = ?auto_36629 ?auto_36632 ) ) ( not ( = ?auto_36630 ?auto_36632 ) ) ( not ( = ?auto_36628 ?auto_36633 ) ) ( not ( = ?auto_36629 ?auto_36633 ) ) ( not ( = ?auto_36630 ?auto_36633 ) ) ( not ( = ?auto_36632 ?auto_36633 ) ) ( ON ?auto_36633 ?auto_36631 ) ( not ( = ?auto_36628 ?auto_36631 ) ) ( not ( = ?auto_36629 ?auto_36631 ) ) ( not ( = ?auto_36630 ?auto_36631 ) ) ( not ( = ?auto_36632 ?auto_36631 ) ) ( not ( = ?auto_36633 ?auto_36631 ) ) ( ON ?auto_36632 ?auto_36633 ) ( CLEAR ?auto_36632 ) ( HOLDING ?auto_36630 ) ( CLEAR ?auto_36629 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36628 ?auto_36629 ?auto_36630 ?auto_36632 )
      ( MAKE-3PILE ?auto_36628 ?auto_36629 ?auto_36630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36634 - BLOCK
      ?auto_36635 - BLOCK
      ?auto_36636 - BLOCK
    )
    :vars
    (
      ?auto_36637 - BLOCK
      ?auto_36638 - BLOCK
      ?auto_36639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36634 ) ( ON ?auto_36635 ?auto_36634 ) ( not ( = ?auto_36634 ?auto_36635 ) ) ( not ( = ?auto_36634 ?auto_36636 ) ) ( not ( = ?auto_36634 ?auto_36637 ) ) ( not ( = ?auto_36635 ?auto_36636 ) ) ( not ( = ?auto_36635 ?auto_36637 ) ) ( not ( = ?auto_36636 ?auto_36637 ) ) ( not ( = ?auto_36634 ?auto_36638 ) ) ( not ( = ?auto_36635 ?auto_36638 ) ) ( not ( = ?auto_36636 ?auto_36638 ) ) ( not ( = ?auto_36637 ?auto_36638 ) ) ( ON ?auto_36638 ?auto_36639 ) ( not ( = ?auto_36634 ?auto_36639 ) ) ( not ( = ?auto_36635 ?auto_36639 ) ) ( not ( = ?auto_36636 ?auto_36639 ) ) ( not ( = ?auto_36637 ?auto_36639 ) ) ( not ( = ?auto_36638 ?auto_36639 ) ) ( ON ?auto_36637 ?auto_36638 ) ( CLEAR ?auto_36635 ) ( ON ?auto_36636 ?auto_36637 ) ( CLEAR ?auto_36636 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36639 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36639 ?auto_36638 ?auto_36637 )
      ( MAKE-3PILE ?auto_36634 ?auto_36635 ?auto_36636 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36640 - BLOCK
      ?auto_36641 - BLOCK
      ?auto_36642 - BLOCK
    )
    :vars
    (
      ?auto_36645 - BLOCK
      ?auto_36644 - BLOCK
      ?auto_36643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36640 ) ( not ( = ?auto_36640 ?auto_36641 ) ) ( not ( = ?auto_36640 ?auto_36642 ) ) ( not ( = ?auto_36640 ?auto_36645 ) ) ( not ( = ?auto_36641 ?auto_36642 ) ) ( not ( = ?auto_36641 ?auto_36645 ) ) ( not ( = ?auto_36642 ?auto_36645 ) ) ( not ( = ?auto_36640 ?auto_36644 ) ) ( not ( = ?auto_36641 ?auto_36644 ) ) ( not ( = ?auto_36642 ?auto_36644 ) ) ( not ( = ?auto_36645 ?auto_36644 ) ) ( ON ?auto_36644 ?auto_36643 ) ( not ( = ?auto_36640 ?auto_36643 ) ) ( not ( = ?auto_36641 ?auto_36643 ) ) ( not ( = ?auto_36642 ?auto_36643 ) ) ( not ( = ?auto_36645 ?auto_36643 ) ) ( not ( = ?auto_36644 ?auto_36643 ) ) ( ON ?auto_36645 ?auto_36644 ) ( ON ?auto_36642 ?auto_36645 ) ( CLEAR ?auto_36642 ) ( ON-TABLE ?auto_36643 ) ( HOLDING ?auto_36641 ) ( CLEAR ?auto_36640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36640 ?auto_36641 )
      ( MAKE-3PILE ?auto_36640 ?auto_36641 ?auto_36642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36646 - BLOCK
      ?auto_36647 - BLOCK
      ?auto_36648 - BLOCK
    )
    :vars
    (
      ?auto_36651 - BLOCK
      ?auto_36650 - BLOCK
      ?auto_36649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36646 ) ( not ( = ?auto_36646 ?auto_36647 ) ) ( not ( = ?auto_36646 ?auto_36648 ) ) ( not ( = ?auto_36646 ?auto_36651 ) ) ( not ( = ?auto_36647 ?auto_36648 ) ) ( not ( = ?auto_36647 ?auto_36651 ) ) ( not ( = ?auto_36648 ?auto_36651 ) ) ( not ( = ?auto_36646 ?auto_36650 ) ) ( not ( = ?auto_36647 ?auto_36650 ) ) ( not ( = ?auto_36648 ?auto_36650 ) ) ( not ( = ?auto_36651 ?auto_36650 ) ) ( ON ?auto_36650 ?auto_36649 ) ( not ( = ?auto_36646 ?auto_36649 ) ) ( not ( = ?auto_36647 ?auto_36649 ) ) ( not ( = ?auto_36648 ?auto_36649 ) ) ( not ( = ?auto_36651 ?auto_36649 ) ) ( not ( = ?auto_36650 ?auto_36649 ) ) ( ON ?auto_36651 ?auto_36650 ) ( ON ?auto_36648 ?auto_36651 ) ( ON-TABLE ?auto_36649 ) ( CLEAR ?auto_36646 ) ( ON ?auto_36647 ?auto_36648 ) ( CLEAR ?auto_36647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36649 ?auto_36650 ?auto_36651 ?auto_36648 )
      ( MAKE-3PILE ?auto_36646 ?auto_36647 ?auto_36648 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36652 - BLOCK
      ?auto_36653 - BLOCK
      ?auto_36654 - BLOCK
    )
    :vars
    (
      ?auto_36655 - BLOCK
      ?auto_36657 - BLOCK
      ?auto_36656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36652 ?auto_36653 ) ) ( not ( = ?auto_36652 ?auto_36654 ) ) ( not ( = ?auto_36652 ?auto_36655 ) ) ( not ( = ?auto_36653 ?auto_36654 ) ) ( not ( = ?auto_36653 ?auto_36655 ) ) ( not ( = ?auto_36654 ?auto_36655 ) ) ( not ( = ?auto_36652 ?auto_36657 ) ) ( not ( = ?auto_36653 ?auto_36657 ) ) ( not ( = ?auto_36654 ?auto_36657 ) ) ( not ( = ?auto_36655 ?auto_36657 ) ) ( ON ?auto_36657 ?auto_36656 ) ( not ( = ?auto_36652 ?auto_36656 ) ) ( not ( = ?auto_36653 ?auto_36656 ) ) ( not ( = ?auto_36654 ?auto_36656 ) ) ( not ( = ?auto_36655 ?auto_36656 ) ) ( not ( = ?auto_36657 ?auto_36656 ) ) ( ON ?auto_36655 ?auto_36657 ) ( ON ?auto_36654 ?auto_36655 ) ( ON-TABLE ?auto_36656 ) ( ON ?auto_36653 ?auto_36654 ) ( CLEAR ?auto_36653 ) ( HOLDING ?auto_36652 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36652 )
      ( MAKE-3PILE ?auto_36652 ?auto_36653 ?auto_36654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36658 - BLOCK
      ?auto_36659 - BLOCK
      ?auto_36660 - BLOCK
    )
    :vars
    (
      ?auto_36661 - BLOCK
      ?auto_36663 - BLOCK
      ?auto_36662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36658 ?auto_36659 ) ) ( not ( = ?auto_36658 ?auto_36660 ) ) ( not ( = ?auto_36658 ?auto_36661 ) ) ( not ( = ?auto_36659 ?auto_36660 ) ) ( not ( = ?auto_36659 ?auto_36661 ) ) ( not ( = ?auto_36660 ?auto_36661 ) ) ( not ( = ?auto_36658 ?auto_36663 ) ) ( not ( = ?auto_36659 ?auto_36663 ) ) ( not ( = ?auto_36660 ?auto_36663 ) ) ( not ( = ?auto_36661 ?auto_36663 ) ) ( ON ?auto_36663 ?auto_36662 ) ( not ( = ?auto_36658 ?auto_36662 ) ) ( not ( = ?auto_36659 ?auto_36662 ) ) ( not ( = ?auto_36660 ?auto_36662 ) ) ( not ( = ?auto_36661 ?auto_36662 ) ) ( not ( = ?auto_36663 ?auto_36662 ) ) ( ON ?auto_36661 ?auto_36663 ) ( ON ?auto_36660 ?auto_36661 ) ( ON-TABLE ?auto_36662 ) ( ON ?auto_36659 ?auto_36660 ) ( ON ?auto_36658 ?auto_36659 ) ( CLEAR ?auto_36658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36662 ?auto_36663 ?auto_36661 ?auto_36660 ?auto_36659 )
      ( MAKE-3PILE ?auto_36658 ?auto_36659 ?auto_36660 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36666 - BLOCK
      ?auto_36667 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36667 ) ( CLEAR ?auto_36666 ) ( ON-TABLE ?auto_36666 ) ( not ( = ?auto_36666 ?auto_36667 ) ) )
    :subtasks
    ( ( !STACK ?auto_36667 ?auto_36666 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36668 - BLOCK
      ?auto_36669 - BLOCK
    )
    :vars
    (
      ?auto_36670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36668 ) ( ON-TABLE ?auto_36668 ) ( not ( = ?auto_36668 ?auto_36669 ) ) ( ON ?auto_36669 ?auto_36670 ) ( CLEAR ?auto_36669 ) ( HAND-EMPTY ) ( not ( = ?auto_36668 ?auto_36670 ) ) ( not ( = ?auto_36669 ?auto_36670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36669 ?auto_36670 )
      ( MAKE-2PILE ?auto_36668 ?auto_36669 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36671 - BLOCK
      ?auto_36672 - BLOCK
    )
    :vars
    (
      ?auto_36673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36671 ?auto_36672 ) ) ( ON ?auto_36672 ?auto_36673 ) ( CLEAR ?auto_36672 ) ( not ( = ?auto_36671 ?auto_36673 ) ) ( not ( = ?auto_36672 ?auto_36673 ) ) ( HOLDING ?auto_36671 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36671 )
      ( MAKE-2PILE ?auto_36671 ?auto_36672 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36674 - BLOCK
      ?auto_36675 - BLOCK
    )
    :vars
    (
      ?auto_36676 - BLOCK
      ?auto_36677 - BLOCK
      ?auto_36678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36674 ?auto_36675 ) ) ( ON ?auto_36675 ?auto_36676 ) ( not ( = ?auto_36674 ?auto_36676 ) ) ( not ( = ?auto_36675 ?auto_36676 ) ) ( ON ?auto_36674 ?auto_36675 ) ( CLEAR ?auto_36674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36677 ) ( ON ?auto_36678 ?auto_36677 ) ( ON ?auto_36676 ?auto_36678 ) ( not ( = ?auto_36677 ?auto_36678 ) ) ( not ( = ?auto_36677 ?auto_36676 ) ) ( not ( = ?auto_36677 ?auto_36675 ) ) ( not ( = ?auto_36677 ?auto_36674 ) ) ( not ( = ?auto_36678 ?auto_36676 ) ) ( not ( = ?auto_36678 ?auto_36675 ) ) ( not ( = ?auto_36678 ?auto_36674 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36677 ?auto_36678 ?auto_36676 ?auto_36675 )
      ( MAKE-2PILE ?auto_36674 ?auto_36675 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36679 - BLOCK
      ?auto_36680 - BLOCK
    )
    :vars
    (
      ?auto_36681 - BLOCK
      ?auto_36682 - BLOCK
      ?auto_36683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36679 ?auto_36680 ) ) ( ON ?auto_36680 ?auto_36681 ) ( not ( = ?auto_36679 ?auto_36681 ) ) ( not ( = ?auto_36680 ?auto_36681 ) ) ( ON-TABLE ?auto_36682 ) ( ON ?auto_36683 ?auto_36682 ) ( ON ?auto_36681 ?auto_36683 ) ( not ( = ?auto_36682 ?auto_36683 ) ) ( not ( = ?auto_36682 ?auto_36681 ) ) ( not ( = ?auto_36682 ?auto_36680 ) ) ( not ( = ?auto_36682 ?auto_36679 ) ) ( not ( = ?auto_36683 ?auto_36681 ) ) ( not ( = ?auto_36683 ?auto_36680 ) ) ( not ( = ?auto_36683 ?auto_36679 ) ) ( HOLDING ?auto_36679 ) ( CLEAR ?auto_36680 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36682 ?auto_36683 ?auto_36681 ?auto_36680 ?auto_36679 )
      ( MAKE-2PILE ?auto_36679 ?auto_36680 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36684 - BLOCK
      ?auto_36685 - BLOCK
    )
    :vars
    (
      ?auto_36687 - BLOCK
      ?auto_36686 - BLOCK
      ?auto_36688 - BLOCK
      ?auto_36689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36684 ?auto_36685 ) ) ( ON ?auto_36685 ?auto_36687 ) ( not ( = ?auto_36684 ?auto_36687 ) ) ( not ( = ?auto_36685 ?auto_36687 ) ) ( ON-TABLE ?auto_36686 ) ( ON ?auto_36688 ?auto_36686 ) ( ON ?auto_36687 ?auto_36688 ) ( not ( = ?auto_36686 ?auto_36688 ) ) ( not ( = ?auto_36686 ?auto_36687 ) ) ( not ( = ?auto_36686 ?auto_36685 ) ) ( not ( = ?auto_36686 ?auto_36684 ) ) ( not ( = ?auto_36688 ?auto_36687 ) ) ( not ( = ?auto_36688 ?auto_36685 ) ) ( not ( = ?auto_36688 ?auto_36684 ) ) ( CLEAR ?auto_36685 ) ( ON ?auto_36684 ?auto_36689 ) ( CLEAR ?auto_36684 ) ( HAND-EMPTY ) ( not ( = ?auto_36684 ?auto_36689 ) ) ( not ( = ?auto_36685 ?auto_36689 ) ) ( not ( = ?auto_36687 ?auto_36689 ) ) ( not ( = ?auto_36686 ?auto_36689 ) ) ( not ( = ?auto_36688 ?auto_36689 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36684 ?auto_36689 )
      ( MAKE-2PILE ?auto_36684 ?auto_36685 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36690 - BLOCK
      ?auto_36691 - BLOCK
    )
    :vars
    (
      ?auto_36694 - BLOCK
      ?auto_36693 - BLOCK
      ?auto_36695 - BLOCK
      ?auto_36692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36690 ?auto_36691 ) ) ( not ( = ?auto_36690 ?auto_36694 ) ) ( not ( = ?auto_36691 ?auto_36694 ) ) ( ON-TABLE ?auto_36693 ) ( ON ?auto_36695 ?auto_36693 ) ( ON ?auto_36694 ?auto_36695 ) ( not ( = ?auto_36693 ?auto_36695 ) ) ( not ( = ?auto_36693 ?auto_36694 ) ) ( not ( = ?auto_36693 ?auto_36691 ) ) ( not ( = ?auto_36693 ?auto_36690 ) ) ( not ( = ?auto_36695 ?auto_36694 ) ) ( not ( = ?auto_36695 ?auto_36691 ) ) ( not ( = ?auto_36695 ?auto_36690 ) ) ( ON ?auto_36690 ?auto_36692 ) ( CLEAR ?auto_36690 ) ( not ( = ?auto_36690 ?auto_36692 ) ) ( not ( = ?auto_36691 ?auto_36692 ) ) ( not ( = ?auto_36694 ?auto_36692 ) ) ( not ( = ?auto_36693 ?auto_36692 ) ) ( not ( = ?auto_36695 ?auto_36692 ) ) ( HOLDING ?auto_36691 ) ( CLEAR ?auto_36694 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36693 ?auto_36695 ?auto_36694 ?auto_36691 )
      ( MAKE-2PILE ?auto_36690 ?auto_36691 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36696 - BLOCK
      ?auto_36697 - BLOCK
    )
    :vars
    (
      ?auto_36699 - BLOCK
      ?auto_36700 - BLOCK
      ?auto_36701 - BLOCK
      ?auto_36698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36696 ?auto_36697 ) ) ( not ( = ?auto_36696 ?auto_36699 ) ) ( not ( = ?auto_36697 ?auto_36699 ) ) ( ON-TABLE ?auto_36700 ) ( ON ?auto_36701 ?auto_36700 ) ( ON ?auto_36699 ?auto_36701 ) ( not ( = ?auto_36700 ?auto_36701 ) ) ( not ( = ?auto_36700 ?auto_36699 ) ) ( not ( = ?auto_36700 ?auto_36697 ) ) ( not ( = ?auto_36700 ?auto_36696 ) ) ( not ( = ?auto_36701 ?auto_36699 ) ) ( not ( = ?auto_36701 ?auto_36697 ) ) ( not ( = ?auto_36701 ?auto_36696 ) ) ( ON ?auto_36696 ?auto_36698 ) ( not ( = ?auto_36696 ?auto_36698 ) ) ( not ( = ?auto_36697 ?auto_36698 ) ) ( not ( = ?auto_36699 ?auto_36698 ) ) ( not ( = ?auto_36700 ?auto_36698 ) ) ( not ( = ?auto_36701 ?auto_36698 ) ) ( CLEAR ?auto_36699 ) ( ON ?auto_36697 ?auto_36696 ) ( CLEAR ?auto_36697 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36698 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36698 ?auto_36696 )
      ( MAKE-2PILE ?auto_36696 ?auto_36697 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36702 - BLOCK
      ?auto_36703 - BLOCK
    )
    :vars
    (
      ?auto_36707 - BLOCK
      ?auto_36705 - BLOCK
      ?auto_36706 - BLOCK
      ?auto_36704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36702 ?auto_36703 ) ) ( not ( = ?auto_36702 ?auto_36707 ) ) ( not ( = ?auto_36703 ?auto_36707 ) ) ( ON-TABLE ?auto_36705 ) ( ON ?auto_36706 ?auto_36705 ) ( not ( = ?auto_36705 ?auto_36706 ) ) ( not ( = ?auto_36705 ?auto_36707 ) ) ( not ( = ?auto_36705 ?auto_36703 ) ) ( not ( = ?auto_36705 ?auto_36702 ) ) ( not ( = ?auto_36706 ?auto_36707 ) ) ( not ( = ?auto_36706 ?auto_36703 ) ) ( not ( = ?auto_36706 ?auto_36702 ) ) ( ON ?auto_36702 ?auto_36704 ) ( not ( = ?auto_36702 ?auto_36704 ) ) ( not ( = ?auto_36703 ?auto_36704 ) ) ( not ( = ?auto_36707 ?auto_36704 ) ) ( not ( = ?auto_36705 ?auto_36704 ) ) ( not ( = ?auto_36706 ?auto_36704 ) ) ( ON ?auto_36703 ?auto_36702 ) ( CLEAR ?auto_36703 ) ( ON-TABLE ?auto_36704 ) ( HOLDING ?auto_36707 ) ( CLEAR ?auto_36706 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36705 ?auto_36706 ?auto_36707 )
      ( MAKE-2PILE ?auto_36702 ?auto_36703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36708 - BLOCK
      ?auto_36709 - BLOCK
    )
    :vars
    (
      ?auto_36710 - BLOCK
      ?auto_36711 - BLOCK
      ?auto_36713 - BLOCK
      ?auto_36712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36708 ?auto_36709 ) ) ( not ( = ?auto_36708 ?auto_36710 ) ) ( not ( = ?auto_36709 ?auto_36710 ) ) ( ON-TABLE ?auto_36711 ) ( ON ?auto_36713 ?auto_36711 ) ( not ( = ?auto_36711 ?auto_36713 ) ) ( not ( = ?auto_36711 ?auto_36710 ) ) ( not ( = ?auto_36711 ?auto_36709 ) ) ( not ( = ?auto_36711 ?auto_36708 ) ) ( not ( = ?auto_36713 ?auto_36710 ) ) ( not ( = ?auto_36713 ?auto_36709 ) ) ( not ( = ?auto_36713 ?auto_36708 ) ) ( ON ?auto_36708 ?auto_36712 ) ( not ( = ?auto_36708 ?auto_36712 ) ) ( not ( = ?auto_36709 ?auto_36712 ) ) ( not ( = ?auto_36710 ?auto_36712 ) ) ( not ( = ?auto_36711 ?auto_36712 ) ) ( not ( = ?auto_36713 ?auto_36712 ) ) ( ON ?auto_36709 ?auto_36708 ) ( ON-TABLE ?auto_36712 ) ( CLEAR ?auto_36713 ) ( ON ?auto_36710 ?auto_36709 ) ( CLEAR ?auto_36710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36712 ?auto_36708 ?auto_36709 )
      ( MAKE-2PILE ?auto_36708 ?auto_36709 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36714 - BLOCK
      ?auto_36715 - BLOCK
    )
    :vars
    (
      ?auto_36717 - BLOCK
      ?auto_36718 - BLOCK
      ?auto_36716 - BLOCK
      ?auto_36719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36714 ?auto_36715 ) ) ( not ( = ?auto_36714 ?auto_36717 ) ) ( not ( = ?auto_36715 ?auto_36717 ) ) ( ON-TABLE ?auto_36718 ) ( not ( = ?auto_36718 ?auto_36716 ) ) ( not ( = ?auto_36718 ?auto_36717 ) ) ( not ( = ?auto_36718 ?auto_36715 ) ) ( not ( = ?auto_36718 ?auto_36714 ) ) ( not ( = ?auto_36716 ?auto_36717 ) ) ( not ( = ?auto_36716 ?auto_36715 ) ) ( not ( = ?auto_36716 ?auto_36714 ) ) ( ON ?auto_36714 ?auto_36719 ) ( not ( = ?auto_36714 ?auto_36719 ) ) ( not ( = ?auto_36715 ?auto_36719 ) ) ( not ( = ?auto_36717 ?auto_36719 ) ) ( not ( = ?auto_36718 ?auto_36719 ) ) ( not ( = ?auto_36716 ?auto_36719 ) ) ( ON ?auto_36715 ?auto_36714 ) ( ON-TABLE ?auto_36719 ) ( ON ?auto_36717 ?auto_36715 ) ( CLEAR ?auto_36717 ) ( HOLDING ?auto_36716 ) ( CLEAR ?auto_36718 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36718 ?auto_36716 )
      ( MAKE-2PILE ?auto_36714 ?auto_36715 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36720 - BLOCK
      ?auto_36721 - BLOCK
    )
    :vars
    (
      ?auto_36722 - BLOCK
      ?auto_36723 - BLOCK
      ?auto_36724 - BLOCK
      ?auto_36725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36720 ?auto_36721 ) ) ( not ( = ?auto_36720 ?auto_36722 ) ) ( not ( = ?auto_36721 ?auto_36722 ) ) ( ON-TABLE ?auto_36723 ) ( not ( = ?auto_36723 ?auto_36724 ) ) ( not ( = ?auto_36723 ?auto_36722 ) ) ( not ( = ?auto_36723 ?auto_36721 ) ) ( not ( = ?auto_36723 ?auto_36720 ) ) ( not ( = ?auto_36724 ?auto_36722 ) ) ( not ( = ?auto_36724 ?auto_36721 ) ) ( not ( = ?auto_36724 ?auto_36720 ) ) ( ON ?auto_36720 ?auto_36725 ) ( not ( = ?auto_36720 ?auto_36725 ) ) ( not ( = ?auto_36721 ?auto_36725 ) ) ( not ( = ?auto_36722 ?auto_36725 ) ) ( not ( = ?auto_36723 ?auto_36725 ) ) ( not ( = ?auto_36724 ?auto_36725 ) ) ( ON ?auto_36721 ?auto_36720 ) ( ON-TABLE ?auto_36725 ) ( ON ?auto_36722 ?auto_36721 ) ( CLEAR ?auto_36723 ) ( ON ?auto_36724 ?auto_36722 ) ( CLEAR ?auto_36724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36725 ?auto_36720 ?auto_36721 ?auto_36722 )
      ( MAKE-2PILE ?auto_36720 ?auto_36721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36726 - BLOCK
      ?auto_36727 - BLOCK
    )
    :vars
    (
      ?auto_36728 - BLOCK
      ?auto_36731 - BLOCK
      ?auto_36729 - BLOCK
      ?auto_36730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36726 ?auto_36727 ) ) ( not ( = ?auto_36726 ?auto_36728 ) ) ( not ( = ?auto_36727 ?auto_36728 ) ) ( not ( = ?auto_36731 ?auto_36729 ) ) ( not ( = ?auto_36731 ?auto_36728 ) ) ( not ( = ?auto_36731 ?auto_36727 ) ) ( not ( = ?auto_36731 ?auto_36726 ) ) ( not ( = ?auto_36729 ?auto_36728 ) ) ( not ( = ?auto_36729 ?auto_36727 ) ) ( not ( = ?auto_36729 ?auto_36726 ) ) ( ON ?auto_36726 ?auto_36730 ) ( not ( = ?auto_36726 ?auto_36730 ) ) ( not ( = ?auto_36727 ?auto_36730 ) ) ( not ( = ?auto_36728 ?auto_36730 ) ) ( not ( = ?auto_36731 ?auto_36730 ) ) ( not ( = ?auto_36729 ?auto_36730 ) ) ( ON ?auto_36727 ?auto_36726 ) ( ON-TABLE ?auto_36730 ) ( ON ?auto_36728 ?auto_36727 ) ( ON ?auto_36729 ?auto_36728 ) ( CLEAR ?auto_36729 ) ( HOLDING ?auto_36731 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36731 )
      ( MAKE-2PILE ?auto_36726 ?auto_36727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36732 - BLOCK
      ?auto_36733 - BLOCK
    )
    :vars
    (
      ?auto_36735 - BLOCK
      ?auto_36736 - BLOCK
      ?auto_36737 - BLOCK
      ?auto_36734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36732 ?auto_36733 ) ) ( not ( = ?auto_36732 ?auto_36735 ) ) ( not ( = ?auto_36733 ?auto_36735 ) ) ( not ( = ?auto_36736 ?auto_36737 ) ) ( not ( = ?auto_36736 ?auto_36735 ) ) ( not ( = ?auto_36736 ?auto_36733 ) ) ( not ( = ?auto_36736 ?auto_36732 ) ) ( not ( = ?auto_36737 ?auto_36735 ) ) ( not ( = ?auto_36737 ?auto_36733 ) ) ( not ( = ?auto_36737 ?auto_36732 ) ) ( ON ?auto_36732 ?auto_36734 ) ( not ( = ?auto_36732 ?auto_36734 ) ) ( not ( = ?auto_36733 ?auto_36734 ) ) ( not ( = ?auto_36735 ?auto_36734 ) ) ( not ( = ?auto_36736 ?auto_36734 ) ) ( not ( = ?auto_36737 ?auto_36734 ) ) ( ON ?auto_36733 ?auto_36732 ) ( ON-TABLE ?auto_36734 ) ( ON ?auto_36735 ?auto_36733 ) ( ON ?auto_36737 ?auto_36735 ) ( ON ?auto_36736 ?auto_36737 ) ( CLEAR ?auto_36736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36734 ?auto_36732 ?auto_36733 ?auto_36735 ?auto_36737 )
      ( MAKE-2PILE ?auto_36732 ?auto_36733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36740 - BLOCK
      ?auto_36741 - BLOCK
    )
    :vars
    (
      ?auto_36742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36742 ?auto_36741 ) ( CLEAR ?auto_36742 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36740 ) ( ON ?auto_36741 ?auto_36740 ) ( not ( = ?auto_36740 ?auto_36741 ) ) ( not ( = ?auto_36740 ?auto_36742 ) ) ( not ( = ?auto_36741 ?auto_36742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36742 ?auto_36741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36743 - BLOCK
      ?auto_36744 - BLOCK
    )
    :vars
    (
      ?auto_36745 - BLOCK
      ?auto_36746 - BLOCK
      ?auto_36747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36745 ?auto_36744 ) ( CLEAR ?auto_36745 ) ( ON-TABLE ?auto_36743 ) ( ON ?auto_36744 ?auto_36743 ) ( not ( = ?auto_36743 ?auto_36744 ) ) ( not ( = ?auto_36743 ?auto_36745 ) ) ( not ( = ?auto_36744 ?auto_36745 ) ) ( HOLDING ?auto_36746 ) ( CLEAR ?auto_36747 ) ( not ( = ?auto_36743 ?auto_36746 ) ) ( not ( = ?auto_36743 ?auto_36747 ) ) ( not ( = ?auto_36744 ?auto_36746 ) ) ( not ( = ?auto_36744 ?auto_36747 ) ) ( not ( = ?auto_36745 ?auto_36746 ) ) ( not ( = ?auto_36745 ?auto_36747 ) ) ( not ( = ?auto_36746 ?auto_36747 ) ) )
    :subtasks
    ( ( !STACK ?auto_36746 ?auto_36747 )
      ( MAKE-2PILE ?auto_36743 ?auto_36744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36748 - BLOCK
      ?auto_36749 - BLOCK
    )
    :vars
    (
      ?auto_36752 - BLOCK
      ?auto_36751 - BLOCK
      ?auto_36750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36752 ?auto_36749 ) ( ON-TABLE ?auto_36748 ) ( ON ?auto_36749 ?auto_36748 ) ( not ( = ?auto_36748 ?auto_36749 ) ) ( not ( = ?auto_36748 ?auto_36752 ) ) ( not ( = ?auto_36749 ?auto_36752 ) ) ( CLEAR ?auto_36751 ) ( not ( = ?auto_36748 ?auto_36750 ) ) ( not ( = ?auto_36748 ?auto_36751 ) ) ( not ( = ?auto_36749 ?auto_36750 ) ) ( not ( = ?auto_36749 ?auto_36751 ) ) ( not ( = ?auto_36752 ?auto_36750 ) ) ( not ( = ?auto_36752 ?auto_36751 ) ) ( not ( = ?auto_36750 ?auto_36751 ) ) ( ON ?auto_36750 ?auto_36752 ) ( CLEAR ?auto_36750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36748 ?auto_36749 ?auto_36752 )
      ( MAKE-2PILE ?auto_36748 ?auto_36749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36753 - BLOCK
      ?auto_36754 - BLOCK
    )
    :vars
    (
      ?auto_36755 - BLOCK
      ?auto_36756 - BLOCK
      ?auto_36757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36755 ?auto_36754 ) ( ON-TABLE ?auto_36753 ) ( ON ?auto_36754 ?auto_36753 ) ( not ( = ?auto_36753 ?auto_36754 ) ) ( not ( = ?auto_36753 ?auto_36755 ) ) ( not ( = ?auto_36754 ?auto_36755 ) ) ( not ( = ?auto_36753 ?auto_36756 ) ) ( not ( = ?auto_36753 ?auto_36757 ) ) ( not ( = ?auto_36754 ?auto_36756 ) ) ( not ( = ?auto_36754 ?auto_36757 ) ) ( not ( = ?auto_36755 ?auto_36756 ) ) ( not ( = ?auto_36755 ?auto_36757 ) ) ( not ( = ?auto_36756 ?auto_36757 ) ) ( ON ?auto_36756 ?auto_36755 ) ( CLEAR ?auto_36756 ) ( HOLDING ?auto_36757 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36757 )
      ( MAKE-2PILE ?auto_36753 ?auto_36754 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36758 - BLOCK
      ?auto_36759 - BLOCK
    )
    :vars
    (
      ?auto_36761 - BLOCK
      ?auto_36760 - BLOCK
      ?auto_36762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36761 ?auto_36759 ) ( ON-TABLE ?auto_36758 ) ( ON ?auto_36759 ?auto_36758 ) ( not ( = ?auto_36758 ?auto_36759 ) ) ( not ( = ?auto_36758 ?auto_36761 ) ) ( not ( = ?auto_36759 ?auto_36761 ) ) ( not ( = ?auto_36758 ?auto_36760 ) ) ( not ( = ?auto_36758 ?auto_36762 ) ) ( not ( = ?auto_36759 ?auto_36760 ) ) ( not ( = ?auto_36759 ?auto_36762 ) ) ( not ( = ?auto_36761 ?auto_36760 ) ) ( not ( = ?auto_36761 ?auto_36762 ) ) ( not ( = ?auto_36760 ?auto_36762 ) ) ( ON ?auto_36760 ?auto_36761 ) ( ON ?auto_36762 ?auto_36760 ) ( CLEAR ?auto_36762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36758 ?auto_36759 ?auto_36761 ?auto_36760 )
      ( MAKE-2PILE ?auto_36758 ?auto_36759 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36763 - BLOCK
      ?auto_36764 - BLOCK
    )
    :vars
    (
      ?auto_36766 - BLOCK
      ?auto_36765 - BLOCK
      ?auto_36767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36766 ?auto_36764 ) ( ON-TABLE ?auto_36763 ) ( ON ?auto_36764 ?auto_36763 ) ( not ( = ?auto_36763 ?auto_36764 ) ) ( not ( = ?auto_36763 ?auto_36766 ) ) ( not ( = ?auto_36764 ?auto_36766 ) ) ( not ( = ?auto_36763 ?auto_36765 ) ) ( not ( = ?auto_36763 ?auto_36767 ) ) ( not ( = ?auto_36764 ?auto_36765 ) ) ( not ( = ?auto_36764 ?auto_36767 ) ) ( not ( = ?auto_36766 ?auto_36765 ) ) ( not ( = ?auto_36766 ?auto_36767 ) ) ( not ( = ?auto_36765 ?auto_36767 ) ) ( ON ?auto_36765 ?auto_36766 ) ( HOLDING ?auto_36767 ) ( CLEAR ?auto_36765 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36763 ?auto_36764 ?auto_36766 ?auto_36765 ?auto_36767 )
      ( MAKE-2PILE ?auto_36763 ?auto_36764 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36768 - BLOCK
      ?auto_36769 - BLOCK
    )
    :vars
    (
      ?auto_36770 - BLOCK
      ?auto_36772 - BLOCK
      ?auto_36771 - BLOCK
      ?auto_36773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36770 ?auto_36769 ) ( ON-TABLE ?auto_36768 ) ( ON ?auto_36769 ?auto_36768 ) ( not ( = ?auto_36768 ?auto_36769 ) ) ( not ( = ?auto_36768 ?auto_36770 ) ) ( not ( = ?auto_36769 ?auto_36770 ) ) ( not ( = ?auto_36768 ?auto_36772 ) ) ( not ( = ?auto_36768 ?auto_36771 ) ) ( not ( = ?auto_36769 ?auto_36772 ) ) ( not ( = ?auto_36769 ?auto_36771 ) ) ( not ( = ?auto_36770 ?auto_36772 ) ) ( not ( = ?auto_36770 ?auto_36771 ) ) ( not ( = ?auto_36772 ?auto_36771 ) ) ( ON ?auto_36772 ?auto_36770 ) ( CLEAR ?auto_36772 ) ( ON ?auto_36771 ?auto_36773 ) ( CLEAR ?auto_36771 ) ( HAND-EMPTY ) ( not ( = ?auto_36768 ?auto_36773 ) ) ( not ( = ?auto_36769 ?auto_36773 ) ) ( not ( = ?auto_36770 ?auto_36773 ) ) ( not ( = ?auto_36772 ?auto_36773 ) ) ( not ( = ?auto_36771 ?auto_36773 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36771 ?auto_36773 )
      ( MAKE-2PILE ?auto_36768 ?auto_36769 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36774 - BLOCK
      ?auto_36775 - BLOCK
    )
    :vars
    (
      ?auto_36777 - BLOCK
      ?auto_36778 - BLOCK
      ?auto_36779 - BLOCK
      ?auto_36776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36777 ?auto_36775 ) ( ON-TABLE ?auto_36774 ) ( ON ?auto_36775 ?auto_36774 ) ( not ( = ?auto_36774 ?auto_36775 ) ) ( not ( = ?auto_36774 ?auto_36777 ) ) ( not ( = ?auto_36775 ?auto_36777 ) ) ( not ( = ?auto_36774 ?auto_36778 ) ) ( not ( = ?auto_36774 ?auto_36779 ) ) ( not ( = ?auto_36775 ?auto_36778 ) ) ( not ( = ?auto_36775 ?auto_36779 ) ) ( not ( = ?auto_36777 ?auto_36778 ) ) ( not ( = ?auto_36777 ?auto_36779 ) ) ( not ( = ?auto_36778 ?auto_36779 ) ) ( ON ?auto_36779 ?auto_36776 ) ( CLEAR ?auto_36779 ) ( not ( = ?auto_36774 ?auto_36776 ) ) ( not ( = ?auto_36775 ?auto_36776 ) ) ( not ( = ?auto_36777 ?auto_36776 ) ) ( not ( = ?auto_36778 ?auto_36776 ) ) ( not ( = ?auto_36779 ?auto_36776 ) ) ( HOLDING ?auto_36778 ) ( CLEAR ?auto_36777 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36774 ?auto_36775 ?auto_36777 ?auto_36778 )
      ( MAKE-2PILE ?auto_36774 ?auto_36775 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36780 - BLOCK
      ?auto_36781 - BLOCK
    )
    :vars
    (
      ?auto_36784 - BLOCK
      ?auto_36785 - BLOCK
      ?auto_36783 - BLOCK
      ?auto_36782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36784 ?auto_36781 ) ( ON-TABLE ?auto_36780 ) ( ON ?auto_36781 ?auto_36780 ) ( not ( = ?auto_36780 ?auto_36781 ) ) ( not ( = ?auto_36780 ?auto_36784 ) ) ( not ( = ?auto_36781 ?auto_36784 ) ) ( not ( = ?auto_36780 ?auto_36785 ) ) ( not ( = ?auto_36780 ?auto_36783 ) ) ( not ( = ?auto_36781 ?auto_36785 ) ) ( not ( = ?auto_36781 ?auto_36783 ) ) ( not ( = ?auto_36784 ?auto_36785 ) ) ( not ( = ?auto_36784 ?auto_36783 ) ) ( not ( = ?auto_36785 ?auto_36783 ) ) ( ON ?auto_36783 ?auto_36782 ) ( not ( = ?auto_36780 ?auto_36782 ) ) ( not ( = ?auto_36781 ?auto_36782 ) ) ( not ( = ?auto_36784 ?auto_36782 ) ) ( not ( = ?auto_36785 ?auto_36782 ) ) ( not ( = ?auto_36783 ?auto_36782 ) ) ( CLEAR ?auto_36784 ) ( ON ?auto_36785 ?auto_36783 ) ( CLEAR ?auto_36785 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36782 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36782 ?auto_36783 )
      ( MAKE-2PILE ?auto_36780 ?auto_36781 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36798 - BLOCK
      ?auto_36799 - BLOCK
    )
    :vars
    (
      ?auto_36802 - BLOCK
      ?auto_36800 - BLOCK
      ?auto_36803 - BLOCK
      ?auto_36801 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36798 ) ( not ( = ?auto_36798 ?auto_36799 ) ) ( not ( = ?auto_36798 ?auto_36802 ) ) ( not ( = ?auto_36799 ?auto_36802 ) ) ( not ( = ?auto_36798 ?auto_36800 ) ) ( not ( = ?auto_36798 ?auto_36803 ) ) ( not ( = ?auto_36799 ?auto_36800 ) ) ( not ( = ?auto_36799 ?auto_36803 ) ) ( not ( = ?auto_36802 ?auto_36800 ) ) ( not ( = ?auto_36802 ?auto_36803 ) ) ( not ( = ?auto_36800 ?auto_36803 ) ) ( ON ?auto_36803 ?auto_36801 ) ( not ( = ?auto_36798 ?auto_36801 ) ) ( not ( = ?auto_36799 ?auto_36801 ) ) ( not ( = ?auto_36802 ?auto_36801 ) ) ( not ( = ?auto_36800 ?auto_36801 ) ) ( not ( = ?auto_36803 ?auto_36801 ) ) ( ON ?auto_36800 ?auto_36803 ) ( ON-TABLE ?auto_36801 ) ( ON ?auto_36802 ?auto_36800 ) ( CLEAR ?auto_36802 ) ( HOLDING ?auto_36799 ) ( CLEAR ?auto_36798 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36798 ?auto_36799 ?auto_36802 )
      ( MAKE-2PILE ?auto_36798 ?auto_36799 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36804 - BLOCK
      ?auto_36805 - BLOCK
    )
    :vars
    (
      ?auto_36809 - BLOCK
      ?auto_36806 - BLOCK
      ?auto_36808 - BLOCK
      ?auto_36807 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36804 ) ( not ( = ?auto_36804 ?auto_36805 ) ) ( not ( = ?auto_36804 ?auto_36809 ) ) ( not ( = ?auto_36805 ?auto_36809 ) ) ( not ( = ?auto_36804 ?auto_36806 ) ) ( not ( = ?auto_36804 ?auto_36808 ) ) ( not ( = ?auto_36805 ?auto_36806 ) ) ( not ( = ?auto_36805 ?auto_36808 ) ) ( not ( = ?auto_36809 ?auto_36806 ) ) ( not ( = ?auto_36809 ?auto_36808 ) ) ( not ( = ?auto_36806 ?auto_36808 ) ) ( ON ?auto_36808 ?auto_36807 ) ( not ( = ?auto_36804 ?auto_36807 ) ) ( not ( = ?auto_36805 ?auto_36807 ) ) ( not ( = ?auto_36809 ?auto_36807 ) ) ( not ( = ?auto_36806 ?auto_36807 ) ) ( not ( = ?auto_36808 ?auto_36807 ) ) ( ON ?auto_36806 ?auto_36808 ) ( ON-TABLE ?auto_36807 ) ( ON ?auto_36809 ?auto_36806 ) ( CLEAR ?auto_36804 ) ( ON ?auto_36805 ?auto_36809 ) ( CLEAR ?auto_36805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36807 ?auto_36808 ?auto_36806 ?auto_36809 )
      ( MAKE-2PILE ?auto_36804 ?auto_36805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36810 - BLOCK
      ?auto_36811 - BLOCK
    )
    :vars
    (
      ?auto_36814 - BLOCK
      ?auto_36813 - BLOCK
      ?auto_36812 - BLOCK
      ?auto_36815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36810 ?auto_36811 ) ) ( not ( = ?auto_36810 ?auto_36814 ) ) ( not ( = ?auto_36811 ?auto_36814 ) ) ( not ( = ?auto_36810 ?auto_36813 ) ) ( not ( = ?auto_36810 ?auto_36812 ) ) ( not ( = ?auto_36811 ?auto_36813 ) ) ( not ( = ?auto_36811 ?auto_36812 ) ) ( not ( = ?auto_36814 ?auto_36813 ) ) ( not ( = ?auto_36814 ?auto_36812 ) ) ( not ( = ?auto_36813 ?auto_36812 ) ) ( ON ?auto_36812 ?auto_36815 ) ( not ( = ?auto_36810 ?auto_36815 ) ) ( not ( = ?auto_36811 ?auto_36815 ) ) ( not ( = ?auto_36814 ?auto_36815 ) ) ( not ( = ?auto_36813 ?auto_36815 ) ) ( not ( = ?auto_36812 ?auto_36815 ) ) ( ON ?auto_36813 ?auto_36812 ) ( ON-TABLE ?auto_36815 ) ( ON ?auto_36814 ?auto_36813 ) ( ON ?auto_36811 ?auto_36814 ) ( CLEAR ?auto_36811 ) ( HOLDING ?auto_36810 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36810 )
      ( MAKE-2PILE ?auto_36810 ?auto_36811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36816 - BLOCK
      ?auto_36817 - BLOCK
    )
    :vars
    (
      ?auto_36820 - BLOCK
      ?auto_36819 - BLOCK
      ?auto_36818 - BLOCK
      ?auto_36821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36816 ?auto_36817 ) ) ( not ( = ?auto_36816 ?auto_36820 ) ) ( not ( = ?auto_36817 ?auto_36820 ) ) ( not ( = ?auto_36816 ?auto_36819 ) ) ( not ( = ?auto_36816 ?auto_36818 ) ) ( not ( = ?auto_36817 ?auto_36819 ) ) ( not ( = ?auto_36817 ?auto_36818 ) ) ( not ( = ?auto_36820 ?auto_36819 ) ) ( not ( = ?auto_36820 ?auto_36818 ) ) ( not ( = ?auto_36819 ?auto_36818 ) ) ( ON ?auto_36818 ?auto_36821 ) ( not ( = ?auto_36816 ?auto_36821 ) ) ( not ( = ?auto_36817 ?auto_36821 ) ) ( not ( = ?auto_36820 ?auto_36821 ) ) ( not ( = ?auto_36819 ?auto_36821 ) ) ( not ( = ?auto_36818 ?auto_36821 ) ) ( ON ?auto_36819 ?auto_36818 ) ( ON-TABLE ?auto_36821 ) ( ON ?auto_36820 ?auto_36819 ) ( ON ?auto_36817 ?auto_36820 ) ( ON ?auto_36816 ?auto_36817 ) ( CLEAR ?auto_36816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36821 ?auto_36818 ?auto_36819 ?auto_36820 ?auto_36817 )
      ( MAKE-2PILE ?auto_36816 ?auto_36817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36825 - BLOCK
      ?auto_36826 - BLOCK
      ?auto_36827 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36827 ) ( CLEAR ?auto_36826 ) ( ON-TABLE ?auto_36825 ) ( ON ?auto_36826 ?auto_36825 ) ( not ( = ?auto_36825 ?auto_36826 ) ) ( not ( = ?auto_36825 ?auto_36827 ) ) ( not ( = ?auto_36826 ?auto_36827 ) ) )
    :subtasks
    ( ( !STACK ?auto_36827 ?auto_36826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36828 - BLOCK
      ?auto_36829 - BLOCK
      ?auto_36830 - BLOCK
    )
    :vars
    (
      ?auto_36831 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36829 ) ( ON-TABLE ?auto_36828 ) ( ON ?auto_36829 ?auto_36828 ) ( not ( = ?auto_36828 ?auto_36829 ) ) ( not ( = ?auto_36828 ?auto_36830 ) ) ( not ( = ?auto_36829 ?auto_36830 ) ) ( ON ?auto_36830 ?auto_36831 ) ( CLEAR ?auto_36830 ) ( HAND-EMPTY ) ( not ( = ?auto_36828 ?auto_36831 ) ) ( not ( = ?auto_36829 ?auto_36831 ) ) ( not ( = ?auto_36830 ?auto_36831 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36830 ?auto_36831 )
      ( MAKE-3PILE ?auto_36828 ?auto_36829 ?auto_36830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36832 - BLOCK
      ?auto_36833 - BLOCK
      ?auto_36834 - BLOCK
    )
    :vars
    (
      ?auto_36835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36832 ) ( not ( = ?auto_36832 ?auto_36833 ) ) ( not ( = ?auto_36832 ?auto_36834 ) ) ( not ( = ?auto_36833 ?auto_36834 ) ) ( ON ?auto_36834 ?auto_36835 ) ( CLEAR ?auto_36834 ) ( not ( = ?auto_36832 ?auto_36835 ) ) ( not ( = ?auto_36833 ?auto_36835 ) ) ( not ( = ?auto_36834 ?auto_36835 ) ) ( HOLDING ?auto_36833 ) ( CLEAR ?auto_36832 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36832 ?auto_36833 )
      ( MAKE-3PILE ?auto_36832 ?auto_36833 ?auto_36834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36836 - BLOCK
      ?auto_36837 - BLOCK
      ?auto_36838 - BLOCK
    )
    :vars
    (
      ?auto_36839 - BLOCK
      ?auto_36840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36836 ) ( not ( = ?auto_36836 ?auto_36837 ) ) ( not ( = ?auto_36836 ?auto_36838 ) ) ( not ( = ?auto_36837 ?auto_36838 ) ) ( ON ?auto_36838 ?auto_36839 ) ( not ( = ?auto_36836 ?auto_36839 ) ) ( not ( = ?auto_36837 ?auto_36839 ) ) ( not ( = ?auto_36838 ?auto_36839 ) ) ( CLEAR ?auto_36836 ) ( ON ?auto_36837 ?auto_36838 ) ( CLEAR ?auto_36837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36840 ) ( ON ?auto_36839 ?auto_36840 ) ( not ( = ?auto_36840 ?auto_36839 ) ) ( not ( = ?auto_36840 ?auto_36838 ) ) ( not ( = ?auto_36840 ?auto_36837 ) ) ( not ( = ?auto_36836 ?auto_36840 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36840 ?auto_36839 ?auto_36838 )
      ( MAKE-3PILE ?auto_36836 ?auto_36837 ?auto_36838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36841 - BLOCK
      ?auto_36842 - BLOCK
      ?auto_36843 - BLOCK
    )
    :vars
    (
      ?auto_36844 - BLOCK
      ?auto_36845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36841 ?auto_36842 ) ) ( not ( = ?auto_36841 ?auto_36843 ) ) ( not ( = ?auto_36842 ?auto_36843 ) ) ( ON ?auto_36843 ?auto_36844 ) ( not ( = ?auto_36841 ?auto_36844 ) ) ( not ( = ?auto_36842 ?auto_36844 ) ) ( not ( = ?auto_36843 ?auto_36844 ) ) ( ON ?auto_36842 ?auto_36843 ) ( CLEAR ?auto_36842 ) ( ON-TABLE ?auto_36845 ) ( ON ?auto_36844 ?auto_36845 ) ( not ( = ?auto_36845 ?auto_36844 ) ) ( not ( = ?auto_36845 ?auto_36843 ) ) ( not ( = ?auto_36845 ?auto_36842 ) ) ( not ( = ?auto_36841 ?auto_36845 ) ) ( HOLDING ?auto_36841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36841 )
      ( MAKE-3PILE ?auto_36841 ?auto_36842 ?auto_36843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36846 - BLOCK
      ?auto_36847 - BLOCK
      ?auto_36848 - BLOCK
    )
    :vars
    (
      ?auto_36850 - BLOCK
      ?auto_36849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36846 ?auto_36847 ) ) ( not ( = ?auto_36846 ?auto_36848 ) ) ( not ( = ?auto_36847 ?auto_36848 ) ) ( ON ?auto_36848 ?auto_36850 ) ( not ( = ?auto_36846 ?auto_36850 ) ) ( not ( = ?auto_36847 ?auto_36850 ) ) ( not ( = ?auto_36848 ?auto_36850 ) ) ( ON ?auto_36847 ?auto_36848 ) ( ON-TABLE ?auto_36849 ) ( ON ?auto_36850 ?auto_36849 ) ( not ( = ?auto_36849 ?auto_36850 ) ) ( not ( = ?auto_36849 ?auto_36848 ) ) ( not ( = ?auto_36849 ?auto_36847 ) ) ( not ( = ?auto_36846 ?auto_36849 ) ) ( ON ?auto_36846 ?auto_36847 ) ( CLEAR ?auto_36846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36849 ?auto_36850 ?auto_36848 ?auto_36847 )
      ( MAKE-3PILE ?auto_36846 ?auto_36847 ?auto_36848 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36851 - BLOCK
      ?auto_36852 - BLOCK
      ?auto_36853 - BLOCK
    )
    :vars
    (
      ?auto_36854 - BLOCK
      ?auto_36855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36851 ?auto_36852 ) ) ( not ( = ?auto_36851 ?auto_36853 ) ) ( not ( = ?auto_36852 ?auto_36853 ) ) ( ON ?auto_36853 ?auto_36854 ) ( not ( = ?auto_36851 ?auto_36854 ) ) ( not ( = ?auto_36852 ?auto_36854 ) ) ( not ( = ?auto_36853 ?auto_36854 ) ) ( ON ?auto_36852 ?auto_36853 ) ( ON-TABLE ?auto_36855 ) ( ON ?auto_36854 ?auto_36855 ) ( not ( = ?auto_36855 ?auto_36854 ) ) ( not ( = ?auto_36855 ?auto_36853 ) ) ( not ( = ?auto_36855 ?auto_36852 ) ) ( not ( = ?auto_36851 ?auto_36855 ) ) ( HOLDING ?auto_36851 ) ( CLEAR ?auto_36852 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36855 ?auto_36854 ?auto_36853 ?auto_36852 ?auto_36851 )
      ( MAKE-3PILE ?auto_36851 ?auto_36852 ?auto_36853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36856 - BLOCK
      ?auto_36857 - BLOCK
      ?auto_36858 - BLOCK
    )
    :vars
    (
      ?auto_36860 - BLOCK
      ?auto_36859 - BLOCK
      ?auto_36861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36856 ?auto_36857 ) ) ( not ( = ?auto_36856 ?auto_36858 ) ) ( not ( = ?auto_36857 ?auto_36858 ) ) ( ON ?auto_36858 ?auto_36860 ) ( not ( = ?auto_36856 ?auto_36860 ) ) ( not ( = ?auto_36857 ?auto_36860 ) ) ( not ( = ?auto_36858 ?auto_36860 ) ) ( ON ?auto_36857 ?auto_36858 ) ( ON-TABLE ?auto_36859 ) ( ON ?auto_36860 ?auto_36859 ) ( not ( = ?auto_36859 ?auto_36860 ) ) ( not ( = ?auto_36859 ?auto_36858 ) ) ( not ( = ?auto_36859 ?auto_36857 ) ) ( not ( = ?auto_36856 ?auto_36859 ) ) ( CLEAR ?auto_36857 ) ( ON ?auto_36856 ?auto_36861 ) ( CLEAR ?auto_36856 ) ( HAND-EMPTY ) ( not ( = ?auto_36856 ?auto_36861 ) ) ( not ( = ?auto_36857 ?auto_36861 ) ) ( not ( = ?auto_36858 ?auto_36861 ) ) ( not ( = ?auto_36860 ?auto_36861 ) ) ( not ( = ?auto_36859 ?auto_36861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36856 ?auto_36861 )
      ( MAKE-3PILE ?auto_36856 ?auto_36857 ?auto_36858 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36862 - BLOCK
      ?auto_36863 - BLOCK
      ?auto_36864 - BLOCK
    )
    :vars
    (
      ?auto_36866 - BLOCK
      ?auto_36867 - BLOCK
      ?auto_36865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36862 ?auto_36863 ) ) ( not ( = ?auto_36862 ?auto_36864 ) ) ( not ( = ?auto_36863 ?auto_36864 ) ) ( ON ?auto_36864 ?auto_36866 ) ( not ( = ?auto_36862 ?auto_36866 ) ) ( not ( = ?auto_36863 ?auto_36866 ) ) ( not ( = ?auto_36864 ?auto_36866 ) ) ( ON-TABLE ?auto_36867 ) ( ON ?auto_36866 ?auto_36867 ) ( not ( = ?auto_36867 ?auto_36866 ) ) ( not ( = ?auto_36867 ?auto_36864 ) ) ( not ( = ?auto_36867 ?auto_36863 ) ) ( not ( = ?auto_36862 ?auto_36867 ) ) ( ON ?auto_36862 ?auto_36865 ) ( CLEAR ?auto_36862 ) ( not ( = ?auto_36862 ?auto_36865 ) ) ( not ( = ?auto_36863 ?auto_36865 ) ) ( not ( = ?auto_36864 ?auto_36865 ) ) ( not ( = ?auto_36866 ?auto_36865 ) ) ( not ( = ?auto_36867 ?auto_36865 ) ) ( HOLDING ?auto_36863 ) ( CLEAR ?auto_36864 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36867 ?auto_36866 ?auto_36864 ?auto_36863 )
      ( MAKE-3PILE ?auto_36862 ?auto_36863 ?auto_36864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36868 - BLOCK
      ?auto_36869 - BLOCK
      ?auto_36870 - BLOCK
    )
    :vars
    (
      ?auto_36872 - BLOCK
      ?auto_36871 - BLOCK
      ?auto_36873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36868 ?auto_36869 ) ) ( not ( = ?auto_36868 ?auto_36870 ) ) ( not ( = ?auto_36869 ?auto_36870 ) ) ( ON ?auto_36870 ?auto_36872 ) ( not ( = ?auto_36868 ?auto_36872 ) ) ( not ( = ?auto_36869 ?auto_36872 ) ) ( not ( = ?auto_36870 ?auto_36872 ) ) ( ON-TABLE ?auto_36871 ) ( ON ?auto_36872 ?auto_36871 ) ( not ( = ?auto_36871 ?auto_36872 ) ) ( not ( = ?auto_36871 ?auto_36870 ) ) ( not ( = ?auto_36871 ?auto_36869 ) ) ( not ( = ?auto_36868 ?auto_36871 ) ) ( ON ?auto_36868 ?auto_36873 ) ( not ( = ?auto_36868 ?auto_36873 ) ) ( not ( = ?auto_36869 ?auto_36873 ) ) ( not ( = ?auto_36870 ?auto_36873 ) ) ( not ( = ?auto_36872 ?auto_36873 ) ) ( not ( = ?auto_36871 ?auto_36873 ) ) ( CLEAR ?auto_36870 ) ( ON ?auto_36869 ?auto_36868 ) ( CLEAR ?auto_36869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36873 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36873 ?auto_36868 )
      ( MAKE-3PILE ?auto_36868 ?auto_36869 ?auto_36870 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36874 - BLOCK
      ?auto_36875 - BLOCK
      ?auto_36876 - BLOCK
    )
    :vars
    (
      ?auto_36877 - BLOCK
      ?auto_36879 - BLOCK
      ?auto_36878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36874 ?auto_36875 ) ) ( not ( = ?auto_36874 ?auto_36876 ) ) ( not ( = ?auto_36875 ?auto_36876 ) ) ( not ( = ?auto_36874 ?auto_36877 ) ) ( not ( = ?auto_36875 ?auto_36877 ) ) ( not ( = ?auto_36876 ?auto_36877 ) ) ( ON-TABLE ?auto_36879 ) ( ON ?auto_36877 ?auto_36879 ) ( not ( = ?auto_36879 ?auto_36877 ) ) ( not ( = ?auto_36879 ?auto_36876 ) ) ( not ( = ?auto_36879 ?auto_36875 ) ) ( not ( = ?auto_36874 ?auto_36879 ) ) ( ON ?auto_36874 ?auto_36878 ) ( not ( = ?auto_36874 ?auto_36878 ) ) ( not ( = ?auto_36875 ?auto_36878 ) ) ( not ( = ?auto_36876 ?auto_36878 ) ) ( not ( = ?auto_36877 ?auto_36878 ) ) ( not ( = ?auto_36879 ?auto_36878 ) ) ( ON ?auto_36875 ?auto_36874 ) ( CLEAR ?auto_36875 ) ( ON-TABLE ?auto_36878 ) ( HOLDING ?auto_36876 ) ( CLEAR ?auto_36877 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36879 ?auto_36877 ?auto_36876 )
      ( MAKE-3PILE ?auto_36874 ?auto_36875 ?auto_36876 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36880 - BLOCK
      ?auto_36881 - BLOCK
      ?auto_36882 - BLOCK
    )
    :vars
    (
      ?auto_36883 - BLOCK
      ?auto_36885 - BLOCK
      ?auto_36884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36880 ?auto_36881 ) ) ( not ( = ?auto_36880 ?auto_36882 ) ) ( not ( = ?auto_36881 ?auto_36882 ) ) ( not ( = ?auto_36880 ?auto_36883 ) ) ( not ( = ?auto_36881 ?auto_36883 ) ) ( not ( = ?auto_36882 ?auto_36883 ) ) ( ON-TABLE ?auto_36885 ) ( ON ?auto_36883 ?auto_36885 ) ( not ( = ?auto_36885 ?auto_36883 ) ) ( not ( = ?auto_36885 ?auto_36882 ) ) ( not ( = ?auto_36885 ?auto_36881 ) ) ( not ( = ?auto_36880 ?auto_36885 ) ) ( ON ?auto_36880 ?auto_36884 ) ( not ( = ?auto_36880 ?auto_36884 ) ) ( not ( = ?auto_36881 ?auto_36884 ) ) ( not ( = ?auto_36882 ?auto_36884 ) ) ( not ( = ?auto_36883 ?auto_36884 ) ) ( not ( = ?auto_36885 ?auto_36884 ) ) ( ON ?auto_36881 ?auto_36880 ) ( ON-TABLE ?auto_36884 ) ( CLEAR ?auto_36883 ) ( ON ?auto_36882 ?auto_36881 ) ( CLEAR ?auto_36882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36884 ?auto_36880 ?auto_36881 )
      ( MAKE-3PILE ?auto_36880 ?auto_36881 ?auto_36882 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36886 - BLOCK
      ?auto_36887 - BLOCK
      ?auto_36888 - BLOCK
    )
    :vars
    (
      ?auto_36891 - BLOCK
      ?auto_36889 - BLOCK
      ?auto_36890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36886 ?auto_36887 ) ) ( not ( = ?auto_36886 ?auto_36888 ) ) ( not ( = ?auto_36887 ?auto_36888 ) ) ( not ( = ?auto_36886 ?auto_36891 ) ) ( not ( = ?auto_36887 ?auto_36891 ) ) ( not ( = ?auto_36888 ?auto_36891 ) ) ( ON-TABLE ?auto_36889 ) ( not ( = ?auto_36889 ?auto_36891 ) ) ( not ( = ?auto_36889 ?auto_36888 ) ) ( not ( = ?auto_36889 ?auto_36887 ) ) ( not ( = ?auto_36886 ?auto_36889 ) ) ( ON ?auto_36886 ?auto_36890 ) ( not ( = ?auto_36886 ?auto_36890 ) ) ( not ( = ?auto_36887 ?auto_36890 ) ) ( not ( = ?auto_36888 ?auto_36890 ) ) ( not ( = ?auto_36891 ?auto_36890 ) ) ( not ( = ?auto_36889 ?auto_36890 ) ) ( ON ?auto_36887 ?auto_36886 ) ( ON-TABLE ?auto_36890 ) ( ON ?auto_36888 ?auto_36887 ) ( CLEAR ?auto_36888 ) ( HOLDING ?auto_36891 ) ( CLEAR ?auto_36889 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36889 ?auto_36891 )
      ( MAKE-3PILE ?auto_36886 ?auto_36887 ?auto_36888 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36892 - BLOCK
      ?auto_36893 - BLOCK
      ?auto_36894 - BLOCK
    )
    :vars
    (
      ?auto_36896 - BLOCK
      ?auto_36897 - BLOCK
      ?auto_36895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36892 ?auto_36893 ) ) ( not ( = ?auto_36892 ?auto_36894 ) ) ( not ( = ?auto_36893 ?auto_36894 ) ) ( not ( = ?auto_36892 ?auto_36896 ) ) ( not ( = ?auto_36893 ?auto_36896 ) ) ( not ( = ?auto_36894 ?auto_36896 ) ) ( ON-TABLE ?auto_36897 ) ( not ( = ?auto_36897 ?auto_36896 ) ) ( not ( = ?auto_36897 ?auto_36894 ) ) ( not ( = ?auto_36897 ?auto_36893 ) ) ( not ( = ?auto_36892 ?auto_36897 ) ) ( ON ?auto_36892 ?auto_36895 ) ( not ( = ?auto_36892 ?auto_36895 ) ) ( not ( = ?auto_36893 ?auto_36895 ) ) ( not ( = ?auto_36894 ?auto_36895 ) ) ( not ( = ?auto_36896 ?auto_36895 ) ) ( not ( = ?auto_36897 ?auto_36895 ) ) ( ON ?auto_36893 ?auto_36892 ) ( ON-TABLE ?auto_36895 ) ( ON ?auto_36894 ?auto_36893 ) ( CLEAR ?auto_36897 ) ( ON ?auto_36896 ?auto_36894 ) ( CLEAR ?auto_36896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36895 ?auto_36892 ?auto_36893 ?auto_36894 )
      ( MAKE-3PILE ?auto_36892 ?auto_36893 ?auto_36894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36898 - BLOCK
      ?auto_36899 - BLOCK
      ?auto_36900 - BLOCK
    )
    :vars
    (
      ?auto_36901 - BLOCK
      ?auto_36902 - BLOCK
      ?auto_36903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36898 ?auto_36899 ) ) ( not ( = ?auto_36898 ?auto_36900 ) ) ( not ( = ?auto_36899 ?auto_36900 ) ) ( not ( = ?auto_36898 ?auto_36901 ) ) ( not ( = ?auto_36899 ?auto_36901 ) ) ( not ( = ?auto_36900 ?auto_36901 ) ) ( not ( = ?auto_36902 ?auto_36901 ) ) ( not ( = ?auto_36902 ?auto_36900 ) ) ( not ( = ?auto_36902 ?auto_36899 ) ) ( not ( = ?auto_36898 ?auto_36902 ) ) ( ON ?auto_36898 ?auto_36903 ) ( not ( = ?auto_36898 ?auto_36903 ) ) ( not ( = ?auto_36899 ?auto_36903 ) ) ( not ( = ?auto_36900 ?auto_36903 ) ) ( not ( = ?auto_36901 ?auto_36903 ) ) ( not ( = ?auto_36902 ?auto_36903 ) ) ( ON ?auto_36899 ?auto_36898 ) ( ON-TABLE ?auto_36903 ) ( ON ?auto_36900 ?auto_36899 ) ( ON ?auto_36901 ?auto_36900 ) ( CLEAR ?auto_36901 ) ( HOLDING ?auto_36902 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36902 )
      ( MAKE-3PILE ?auto_36898 ?auto_36899 ?auto_36900 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36904 - BLOCK
      ?auto_36905 - BLOCK
      ?auto_36906 - BLOCK
    )
    :vars
    (
      ?auto_36909 - BLOCK
      ?auto_36908 - BLOCK
      ?auto_36907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36904 ?auto_36905 ) ) ( not ( = ?auto_36904 ?auto_36906 ) ) ( not ( = ?auto_36905 ?auto_36906 ) ) ( not ( = ?auto_36904 ?auto_36909 ) ) ( not ( = ?auto_36905 ?auto_36909 ) ) ( not ( = ?auto_36906 ?auto_36909 ) ) ( not ( = ?auto_36908 ?auto_36909 ) ) ( not ( = ?auto_36908 ?auto_36906 ) ) ( not ( = ?auto_36908 ?auto_36905 ) ) ( not ( = ?auto_36904 ?auto_36908 ) ) ( ON ?auto_36904 ?auto_36907 ) ( not ( = ?auto_36904 ?auto_36907 ) ) ( not ( = ?auto_36905 ?auto_36907 ) ) ( not ( = ?auto_36906 ?auto_36907 ) ) ( not ( = ?auto_36909 ?auto_36907 ) ) ( not ( = ?auto_36908 ?auto_36907 ) ) ( ON ?auto_36905 ?auto_36904 ) ( ON-TABLE ?auto_36907 ) ( ON ?auto_36906 ?auto_36905 ) ( ON ?auto_36909 ?auto_36906 ) ( ON ?auto_36908 ?auto_36909 ) ( CLEAR ?auto_36908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36907 ?auto_36904 ?auto_36905 ?auto_36906 ?auto_36909 )
      ( MAKE-3PILE ?auto_36904 ?auto_36905 ?auto_36906 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36911 - BLOCK
    )
    :vars
    (
      ?auto_36912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36912 ?auto_36911 ) ( CLEAR ?auto_36912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36911 ) ( not ( = ?auto_36911 ?auto_36912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36912 ?auto_36911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36913 - BLOCK
    )
    :vars
    (
      ?auto_36914 - BLOCK
      ?auto_36915 - BLOCK
      ?auto_36916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36914 ?auto_36913 ) ( CLEAR ?auto_36914 ) ( ON-TABLE ?auto_36913 ) ( not ( = ?auto_36913 ?auto_36914 ) ) ( HOLDING ?auto_36915 ) ( CLEAR ?auto_36916 ) ( not ( = ?auto_36913 ?auto_36915 ) ) ( not ( = ?auto_36913 ?auto_36916 ) ) ( not ( = ?auto_36914 ?auto_36915 ) ) ( not ( = ?auto_36914 ?auto_36916 ) ) ( not ( = ?auto_36915 ?auto_36916 ) ) )
    :subtasks
    ( ( !STACK ?auto_36915 ?auto_36916 )
      ( MAKE-1PILE ?auto_36913 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36917 - BLOCK
    )
    :vars
    (
      ?auto_36920 - BLOCK
      ?auto_36918 - BLOCK
      ?auto_36919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36920 ?auto_36917 ) ( ON-TABLE ?auto_36917 ) ( not ( = ?auto_36917 ?auto_36920 ) ) ( CLEAR ?auto_36918 ) ( not ( = ?auto_36917 ?auto_36919 ) ) ( not ( = ?auto_36917 ?auto_36918 ) ) ( not ( = ?auto_36920 ?auto_36919 ) ) ( not ( = ?auto_36920 ?auto_36918 ) ) ( not ( = ?auto_36919 ?auto_36918 ) ) ( ON ?auto_36919 ?auto_36920 ) ( CLEAR ?auto_36919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36917 ?auto_36920 )
      ( MAKE-1PILE ?auto_36917 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36921 - BLOCK
    )
    :vars
    (
      ?auto_36924 - BLOCK
      ?auto_36923 - BLOCK
      ?auto_36922 - BLOCK
      ?auto_36925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36924 ?auto_36921 ) ( ON-TABLE ?auto_36921 ) ( not ( = ?auto_36921 ?auto_36924 ) ) ( not ( = ?auto_36921 ?auto_36923 ) ) ( not ( = ?auto_36921 ?auto_36922 ) ) ( not ( = ?auto_36924 ?auto_36923 ) ) ( not ( = ?auto_36924 ?auto_36922 ) ) ( not ( = ?auto_36923 ?auto_36922 ) ) ( ON ?auto_36923 ?auto_36924 ) ( CLEAR ?auto_36923 ) ( HOLDING ?auto_36922 ) ( CLEAR ?auto_36925 ) ( ON-TABLE ?auto_36925 ) ( not ( = ?auto_36925 ?auto_36922 ) ) ( not ( = ?auto_36921 ?auto_36925 ) ) ( not ( = ?auto_36924 ?auto_36925 ) ) ( not ( = ?auto_36923 ?auto_36925 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36925 ?auto_36922 )
      ( MAKE-1PILE ?auto_36921 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36926 - BLOCK
    )
    :vars
    (
      ?auto_36929 - BLOCK
      ?auto_36930 - BLOCK
      ?auto_36927 - BLOCK
      ?auto_36928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36929 ?auto_36926 ) ( ON-TABLE ?auto_36926 ) ( not ( = ?auto_36926 ?auto_36929 ) ) ( not ( = ?auto_36926 ?auto_36930 ) ) ( not ( = ?auto_36926 ?auto_36927 ) ) ( not ( = ?auto_36929 ?auto_36930 ) ) ( not ( = ?auto_36929 ?auto_36927 ) ) ( not ( = ?auto_36930 ?auto_36927 ) ) ( ON ?auto_36930 ?auto_36929 ) ( CLEAR ?auto_36928 ) ( ON-TABLE ?auto_36928 ) ( not ( = ?auto_36928 ?auto_36927 ) ) ( not ( = ?auto_36926 ?auto_36928 ) ) ( not ( = ?auto_36929 ?auto_36928 ) ) ( not ( = ?auto_36930 ?auto_36928 ) ) ( ON ?auto_36927 ?auto_36930 ) ( CLEAR ?auto_36927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36926 ?auto_36929 ?auto_36930 )
      ( MAKE-1PILE ?auto_36926 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36931 - BLOCK
    )
    :vars
    (
      ?auto_36934 - BLOCK
      ?auto_36935 - BLOCK
      ?auto_36933 - BLOCK
      ?auto_36932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36934 ?auto_36931 ) ( ON-TABLE ?auto_36931 ) ( not ( = ?auto_36931 ?auto_36934 ) ) ( not ( = ?auto_36931 ?auto_36935 ) ) ( not ( = ?auto_36931 ?auto_36933 ) ) ( not ( = ?auto_36934 ?auto_36935 ) ) ( not ( = ?auto_36934 ?auto_36933 ) ) ( not ( = ?auto_36935 ?auto_36933 ) ) ( ON ?auto_36935 ?auto_36934 ) ( not ( = ?auto_36932 ?auto_36933 ) ) ( not ( = ?auto_36931 ?auto_36932 ) ) ( not ( = ?auto_36934 ?auto_36932 ) ) ( not ( = ?auto_36935 ?auto_36932 ) ) ( ON ?auto_36933 ?auto_36935 ) ( CLEAR ?auto_36933 ) ( HOLDING ?auto_36932 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36932 )
      ( MAKE-1PILE ?auto_36931 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36936 - BLOCK
    )
    :vars
    (
      ?auto_36938 - BLOCK
      ?auto_36939 - BLOCK
      ?auto_36937 - BLOCK
      ?auto_36940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36938 ?auto_36936 ) ( ON-TABLE ?auto_36936 ) ( not ( = ?auto_36936 ?auto_36938 ) ) ( not ( = ?auto_36936 ?auto_36939 ) ) ( not ( = ?auto_36936 ?auto_36937 ) ) ( not ( = ?auto_36938 ?auto_36939 ) ) ( not ( = ?auto_36938 ?auto_36937 ) ) ( not ( = ?auto_36939 ?auto_36937 ) ) ( ON ?auto_36939 ?auto_36938 ) ( not ( = ?auto_36940 ?auto_36937 ) ) ( not ( = ?auto_36936 ?auto_36940 ) ) ( not ( = ?auto_36938 ?auto_36940 ) ) ( not ( = ?auto_36939 ?auto_36940 ) ) ( ON ?auto_36937 ?auto_36939 ) ( ON ?auto_36940 ?auto_36937 ) ( CLEAR ?auto_36940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36936 ?auto_36938 ?auto_36939 ?auto_36937 )
      ( MAKE-1PILE ?auto_36936 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36941 - BLOCK
    )
    :vars
    (
      ?auto_36945 - BLOCK
      ?auto_36943 - BLOCK
      ?auto_36942 - BLOCK
      ?auto_36944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36945 ?auto_36941 ) ( ON-TABLE ?auto_36941 ) ( not ( = ?auto_36941 ?auto_36945 ) ) ( not ( = ?auto_36941 ?auto_36943 ) ) ( not ( = ?auto_36941 ?auto_36942 ) ) ( not ( = ?auto_36945 ?auto_36943 ) ) ( not ( = ?auto_36945 ?auto_36942 ) ) ( not ( = ?auto_36943 ?auto_36942 ) ) ( ON ?auto_36943 ?auto_36945 ) ( not ( = ?auto_36944 ?auto_36942 ) ) ( not ( = ?auto_36941 ?auto_36944 ) ) ( not ( = ?auto_36945 ?auto_36944 ) ) ( not ( = ?auto_36943 ?auto_36944 ) ) ( ON ?auto_36942 ?auto_36943 ) ( HOLDING ?auto_36944 ) ( CLEAR ?auto_36942 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36941 ?auto_36945 ?auto_36943 ?auto_36942 ?auto_36944 )
      ( MAKE-1PILE ?auto_36941 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36946 - BLOCK
    )
    :vars
    (
      ?auto_36950 - BLOCK
      ?auto_36949 - BLOCK
      ?auto_36947 - BLOCK
      ?auto_36948 - BLOCK
      ?auto_36951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36950 ?auto_36946 ) ( ON-TABLE ?auto_36946 ) ( not ( = ?auto_36946 ?auto_36950 ) ) ( not ( = ?auto_36946 ?auto_36949 ) ) ( not ( = ?auto_36946 ?auto_36947 ) ) ( not ( = ?auto_36950 ?auto_36949 ) ) ( not ( = ?auto_36950 ?auto_36947 ) ) ( not ( = ?auto_36949 ?auto_36947 ) ) ( ON ?auto_36949 ?auto_36950 ) ( not ( = ?auto_36948 ?auto_36947 ) ) ( not ( = ?auto_36946 ?auto_36948 ) ) ( not ( = ?auto_36950 ?auto_36948 ) ) ( not ( = ?auto_36949 ?auto_36948 ) ) ( ON ?auto_36947 ?auto_36949 ) ( CLEAR ?auto_36947 ) ( ON ?auto_36948 ?auto_36951 ) ( CLEAR ?auto_36948 ) ( HAND-EMPTY ) ( not ( = ?auto_36946 ?auto_36951 ) ) ( not ( = ?auto_36950 ?auto_36951 ) ) ( not ( = ?auto_36949 ?auto_36951 ) ) ( not ( = ?auto_36947 ?auto_36951 ) ) ( not ( = ?auto_36948 ?auto_36951 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36948 ?auto_36951 )
      ( MAKE-1PILE ?auto_36946 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36952 - BLOCK
    )
    :vars
    (
      ?auto_36957 - BLOCK
      ?auto_36956 - BLOCK
      ?auto_36953 - BLOCK
      ?auto_36955 - BLOCK
      ?auto_36954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36957 ?auto_36952 ) ( ON-TABLE ?auto_36952 ) ( not ( = ?auto_36952 ?auto_36957 ) ) ( not ( = ?auto_36952 ?auto_36956 ) ) ( not ( = ?auto_36952 ?auto_36953 ) ) ( not ( = ?auto_36957 ?auto_36956 ) ) ( not ( = ?auto_36957 ?auto_36953 ) ) ( not ( = ?auto_36956 ?auto_36953 ) ) ( ON ?auto_36956 ?auto_36957 ) ( not ( = ?auto_36955 ?auto_36953 ) ) ( not ( = ?auto_36952 ?auto_36955 ) ) ( not ( = ?auto_36957 ?auto_36955 ) ) ( not ( = ?auto_36956 ?auto_36955 ) ) ( ON ?auto_36955 ?auto_36954 ) ( CLEAR ?auto_36955 ) ( not ( = ?auto_36952 ?auto_36954 ) ) ( not ( = ?auto_36957 ?auto_36954 ) ) ( not ( = ?auto_36956 ?auto_36954 ) ) ( not ( = ?auto_36953 ?auto_36954 ) ) ( not ( = ?auto_36955 ?auto_36954 ) ) ( HOLDING ?auto_36953 ) ( CLEAR ?auto_36956 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36952 ?auto_36957 ?auto_36956 ?auto_36953 )
      ( MAKE-1PILE ?auto_36952 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36958 - BLOCK
    )
    :vars
    (
      ?auto_36959 - BLOCK
      ?auto_36963 - BLOCK
      ?auto_36960 - BLOCK
      ?auto_36962 - BLOCK
      ?auto_36961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36959 ?auto_36958 ) ( ON-TABLE ?auto_36958 ) ( not ( = ?auto_36958 ?auto_36959 ) ) ( not ( = ?auto_36958 ?auto_36963 ) ) ( not ( = ?auto_36958 ?auto_36960 ) ) ( not ( = ?auto_36959 ?auto_36963 ) ) ( not ( = ?auto_36959 ?auto_36960 ) ) ( not ( = ?auto_36963 ?auto_36960 ) ) ( ON ?auto_36963 ?auto_36959 ) ( not ( = ?auto_36962 ?auto_36960 ) ) ( not ( = ?auto_36958 ?auto_36962 ) ) ( not ( = ?auto_36959 ?auto_36962 ) ) ( not ( = ?auto_36963 ?auto_36962 ) ) ( ON ?auto_36962 ?auto_36961 ) ( not ( = ?auto_36958 ?auto_36961 ) ) ( not ( = ?auto_36959 ?auto_36961 ) ) ( not ( = ?auto_36963 ?auto_36961 ) ) ( not ( = ?auto_36960 ?auto_36961 ) ) ( not ( = ?auto_36962 ?auto_36961 ) ) ( CLEAR ?auto_36963 ) ( ON ?auto_36960 ?auto_36962 ) ( CLEAR ?auto_36960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36961 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36961 ?auto_36962 )
      ( MAKE-1PILE ?auto_36958 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36964 - BLOCK
    )
    :vars
    (
      ?auto_36969 - BLOCK
      ?auto_36965 - BLOCK
      ?auto_36967 - BLOCK
      ?auto_36966 - BLOCK
      ?auto_36968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36969 ?auto_36964 ) ( ON-TABLE ?auto_36964 ) ( not ( = ?auto_36964 ?auto_36969 ) ) ( not ( = ?auto_36964 ?auto_36965 ) ) ( not ( = ?auto_36964 ?auto_36967 ) ) ( not ( = ?auto_36969 ?auto_36965 ) ) ( not ( = ?auto_36969 ?auto_36967 ) ) ( not ( = ?auto_36965 ?auto_36967 ) ) ( not ( = ?auto_36966 ?auto_36967 ) ) ( not ( = ?auto_36964 ?auto_36966 ) ) ( not ( = ?auto_36969 ?auto_36966 ) ) ( not ( = ?auto_36965 ?auto_36966 ) ) ( ON ?auto_36966 ?auto_36968 ) ( not ( = ?auto_36964 ?auto_36968 ) ) ( not ( = ?auto_36969 ?auto_36968 ) ) ( not ( = ?auto_36965 ?auto_36968 ) ) ( not ( = ?auto_36967 ?auto_36968 ) ) ( not ( = ?auto_36966 ?auto_36968 ) ) ( ON ?auto_36967 ?auto_36966 ) ( CLEAR ?auto_36967 ) ( ON-TABLE ?auto_36968 ) ( HOLDING ?auto_36965 ) ( CLEAR ?auto_36969 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36964 ?auto_36969 ?auto_36965 )
      ( MAKE-1PILE ?auto_36964 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36970 - BLOCK
    )
    :vars
    (
      ?auto_36971 - BLOCK
      ?auto_36973 - BLOCK
      ?auto_36974 - BLOCK
      ?auto_36972 - BLOCK
      ?auto_36975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36971 ?auto_36970 ) ( ON-TABLE ?auto_36970 ) ( not ( = ?auto_36970 ?auto_36971 ) ) ( not ( = ?auto_36970 ?auto_36973 ) ) ( not ( = ?auto_36970 ?auto_36974 ) ) ( not ( = ?auto_36971 ?auto_36973 ) ) ( not ( = ?auto_36971 ?auto_36974 ) ) ( not ( = ?auto_36973 ?auto_36974 ) ) ( not ( = ?auto_36972 ?auto_36974 ) ) ( not ( = ?auto_36970 ?auto_36972 ) ) ( not ( = ?auto_36971 ?auto_36972 ) ) ( not ( = ?auto_36973 ?auto_36972 ) ) ( ON ?auto_36972 ?auto_36975 ) ( not ( = ?auto_36970 ?auto_36975 ) ) ( not ( = ?auto_36971 ?auto_36975 ) ) ( not ( = ?auto_36973 ?auto_36975 ) ) ( not ( = ?auto_36974 ?auto_36975 ) ) ( not ( = ?auto_36972 ?auto_36975 ) ) ( ON ?auto_36974 ?auto_36972 ) ( ON-TABLE ?auto_36975 ) ( CLEAR ?auto_36971 ) ( ON ?auto_36973 ?auto_36974 ) ( CLEAR ?auto_36973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36975 ?auto_36972 ?auto_36974 )
      ( MAKE-1PILE ?auto_36970 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36988 - BLOCK
    )
    :vars
    (
      ?auto_36990 - BLOCK
      ?auto_36989 - BLOCK
      ?auto_36993 - BLOCK
      ?auto_36992 - BLOCK
      ?auto_36991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36988 ?auto_36990 ) ) ( not ( = ?auto_36988 ?auto_36989 ) ) ( not ( = ?auto_36988 ?auto_36993 ) ) ( not ( = ?auto_36990 ?auto_36989 ) ) ( not ( = ?auto_36990 ?auto_36993 ) ) ( not ( = ?auto_36989 ?auto_36993 ) ) ( not ( = ?auto_36992 ?auto_36993 ) ) ( not ( = ?auto_36988 ?auto_36992 ) ) ( not ( = ?auto_36990 ?auto_36992 ) ) ( not ( = ?auto_36989 ?auto_36992 ) ) ( ON ?auto_36992 ?auto_36991 ) ( not ( = ?auto_36988 ?auto_36991 ) ) ( not ( = ?auto_36990 ?auto_36991 ) ) ( not ( = ?auto_36989 ?auto_36991 ) ) ( not ( = ?auto_36993 ?auto_36991 ) ) ( not ( = ?auto_36992 ?auto_36991 ) ) ( ON ?auto_36993 ?auto_36992 ) ( ON-TABLE ?auto_36991 ) ( ON ?auto_36989 ?auto_36993 ) ( ON ?auto_36990 ?auto_36989 ) ( CLEAR ?auto_36990 ) ( HOLDING ?auto_36988 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36988 ?auto_36990 )
      ( MAKE-1PILE ?auto_36988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36994 - BLOCK
    )
    :vars
    (
      ?auto_36997 - BLOCK
      ?auto_36995 - BLOCK
      ?auto_36996 - BLOCK
      ?auto_36999 - BLOCK
      ?auto_36998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36994 ?auto_36997 ) ) ( not ( = ?auto_36994 ?auto_36995 ) ) ( not ( = ?auto_36994 ?auto_36996 ) ) ( not ( = ?auto_36997 ?auto_36995 ) ) ( not ( = ?auto_36997 ?auto_36996 ) ) ( not ( = ?auto_36995 ?auto_36996 ) ) ( not ( = ?auto_36999 ?auto_36996 ) ) ( not ( = ?auto_36994 ?auto_36999 ) ) ( not ( = ?auto_36997 ?auto_36999 ) ) ( not ( = ?auto_36995 ?auto_36999 ) ) ( ON ?auto_36999 ?auto_36998 ) ( not ( = ?auto_36994 ?auto_36998 ) ) ( not ( = ?auto_36997 ?auto_36998 ) ) ( not ( = ?auto_36995 ?auto_36998 ) ) ( not ( = ?auto_36996 ?auto_36998 ) ) ( not ( = ?auto_36999 ?auto_36998 ) ) ( ON ?auto_36996 ?auto_36999 ) ( ON-TABLE ?auto_36998 ) ( ON ?auto_36995 ?auto_36996 ) ( ON ?auto_36997 ?auto_36995 ) ( ON ?auto_36994 ?auto_36997 ) ( CLEAR ?auto_36994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36998 ?auto_36999 ?auto_36996 ?auto_36995 ?auto_36997 )
      ( MAKE-1PILE ?auto_36994 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37004 - BLOCK
      ?auto_37005 - BLOCK
      ?auto_37006 - BLOCK
      ?auto_37007 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37007 ) ( CLEAR ?auto_37006 ) ( ON-TABLE ?auto_37004 ) ( ON ?auto_37005 ?auto_37004 ) ( ON ?auto_37006 ?auto_37005 ) ( not ( = ?auto_37004 ?auto_37005 ) ) ( not ( = ?auto_37004 ?auto_37006 ) ) ( not ( = ?auto_37004 ?auto_37007 ) ) ( not ( = ?auto_37005 ?auto_37006 ) ) ( not ( = ?auto_37005 ?auto_37007 ) ) ( not ( = ?auto_37006 ?auto_37007 ) ) )
    :subtasks
    ( ( !STACK ?auto_37007 ?auto_37006 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37008 - BLOCK
      ?auto_37009 - BLOCK
      ?auto_37010 - BLOCK
      ?auto_37011 - BLOCK
    )
    :vars
    (
      ?auto_37012 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37010 ) ( ON-TABLE ?auto_37008 ) ( ON ?auto_37009 ?auto_37008 ) ( ON ?auto_37010 ?auto_37009 ) ( not ( = ?auto_37008 ?auto_37009 ) ) ( not ( = ?auto_37008 ?auto_37010 ) ) ( not ( = ?auto_37008 ?auto_37011 ) ) ( not ( = ?auto_37009 ?auto_37010 ) ) ( not ( = ?auto_37009 ?auto_37011 ) ) ( not ( = ?auto_37010 ?auto_37011 ) ) ( ON ?auto_37011 ?auto_37012 ) ( CLEAR ?auto_37011 ) ( HAND-EMPTY ) ( not ( = ?auto_37008 ?auto_37012 ) ) ( not ( = ?auto_37009 ?auto_37012 ) ) ( not ( = ?auto_37010 ?auto_37012 ) ) ( not ( = ?auto_37011 ?auto_37012 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37011 ?auto_37012 )
      ( MAKE-4PILE ?auto_37008 ?auto_37009 ?auto_37010 ?auto_37011 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37013 - BLOCK
      ?auto_37014 - BLOCK
      ?auto_37015 - BLOCK
      ?auto_37016 - BLOCK
    )
    :vars
    (
      ?auto_37017 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37013 ) ( ON ?auto_37014 ?auto_37013 ) ( not ( = ?auto_37013 ?auto_37014 ) ) ( not ( = ?auto_37013 ?auto_37015 ) ) ( not ( = ?auto_37013 ?auto_37016 ) ) ( not ( = ?auto_37014 ?auto_37015 ) ) ( not ( = ?auto_37014 ?auto_37016 ) ) ( not ( = ?auto_37015 ?auto_37016 ) ) ( ON ?auto_37016 ?auto_37017 ) ( CLEAR ?auto_37016 ) ( not ( = ?auto_37013 ?auto_37017 ) ) ( not ( = ?auto_37014 ?auto_37017 ) ) ( not ( = ?auto_37015 ?auto_37017 ) ) ( not ( = ?auto_37016 ?auto_37017 ) ) ( HOLDING ?auto_37015 ) ( CLEAR ?auto_37014 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37013 ?auto_37014 ?auto_37015 )
      ( MAKE-4PILE ?auto_37013 ?auto_37014 ?auto_37015 ?auto_37016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37018 - BLOCK
      ?auto_37019 - BLOCK
      ?auto_37020 - BLOCK
      ?auto_37021 - BLOCK
    )
    :vars
    (
      ?auto_37022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37018 ) ( ON ?auto_37019 ?auto_37018 ) ( not ( = ?auto_37018 ?auto_37019 ) ) ( not ( = ?auto_37018 ?auto_37020 ) ) ( not ( = ?auto_37018 ?auto_37021 ) ) ( not ( = ?auto_37019 ?auto_37020 ) ) ( not ( = ?auto_37019 ?auto_37021 ) ) ( not ( = ?auto_37020 ?auto_37021 ) ) ( ON ?auto_37021 ?auto_37022 ) ( not ( = ?auto_37018 ?auto_37022 ) ) ( not ( = ?auto_37019 ?auto_37022 ) ) ( not ( = ?auto_37020 ?auto_37022 ) ) ( not ( = ?auto_37021 ?auto_37022 ) ) ( CLEAR ?auto_37019 ) ( ON ?auto_37020 ?auto_37021 ) ( CLEAR ?auto_37020 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37022 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37022 ?auto_37021 )
      ( MAKE-4PILE ?auto_37018 ?auto_37019 ?auto_37020 ?auto_37021 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37023 - BLOCK
      ?auto_37024 - BLOCK
      ?auto_37025 - BLOCK
      ?auto_37026 - BLOCK
    )
    :vars
    (
      ?auto_37027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37023 ) ( not ( = ?auto_37023 ?auto_37024 ) ) ( not ( = ?auto_37023 ?auto_37025 ) ) ( not ( = ?auto_37023 ?auto_37026 ) ) ( not ( = ?auto_37024 ?auto_37025 ) ) ( not ( = ?auto_37024 ?auto_37026 ) ) ( not ( = ?auto_37025 ?auto_37026 ) ) ( ON ?auto_37026 ?auto_37027 ) ( not ( = ?auto_37023 ?auto_37027 ) ) ( not ( = ?auto_37024 ?auto_37027 ) ) ( not ( = ?auto_37025 ?auto_37027 ) ) ( not ( = ?auto_37026 ?auto_37027 ) ) ( ON ?auto_37025 ?auto_37026 ) ( CLEAR ?auto_37025 ) ( ON-TABLE ?auto_37027 ) ( HOLDING ?auto_37024 ) ( CLEAR ?auto_37023 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37023 ?auto_37024 )
      ( MAKE-4PILE ?auto_37023 ?auto_37024 ?auto_37025 ?auto_37026 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37028 - BLOCK
      ?auto_37029 - BLOCK
      ?auto_37030 - BLOCK
      ?auto_37031 - BLOCK
    )
    :vars
    (
      ?auto_37032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37028 ) ( not ( = ?auto_37028 ?auto_37029 ) ) ( not ( = ?auto_37028 ?auto_37030 ) ) ( not ( = ?auto_37028 ?auto_37031 ) ) ( not ( = ?auto_37029 ?auto_37030 ) ) ( not ( = ?auto_37029 ?auto_37031 ) ) ( not ( = ?auto_37030 ?auto_37031 ) ) ( ON ?auto_37031 ?auto_37032 ) ( not ( = ?auto_37028 ?auto_37032 ) ) ( not ( = ?auto_37029 ?auto_37032 ) ) ( not ( = ?auto_37030 ?auto_37032 ) ) ( not ( = ?auto_37031 ?auto_37032 ) ) ( ON ?auto_37030 ?auto_37031 ) ( ON-TABLE ?auto_37032 ) ( CLEAR ?auto_37028 ) ( ON ?auto_37029 ?auto_37030 ) ( CLEAR ?auto_37029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37032 ?auto_37031 ?auto_37030 )
      ( MAKE-4PILE ?auto_37028 ?auto_37029 ?auto_37030 ?auto_37031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37033 - BLOCK
      ?auto_37034 - BLOCK
      ?auto_37035 - BLOCK
      ?auto_37036 - BLOCK
    )
    :vars
    (
      ?auto_37037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37033 ?auto_37034 ) ) ( not ( = ?auto_37033 ?auto_37035 ) ) ( not ( = ?auto_37033 ?auto_37036 ) ) ( not ( = ?auto_37034 ?auto_37035 ) ) ( not ( = ?auto_37034 ?auto_37036 ) ) ( not ( = ?auto_37035 ?auto_37036 ) ) ( ON ?auto_37036 ?auto_37037 ) ( not ( = ?auto_37033 ?auto_37037 ) ) ( not ( = ?auto_37034 ?auto_37037 ) ) ( not ( = ?auto_37035 ?auto_37037 ) ) ( not ( = ?auto_37036 ?auto_37037 ) ) ( ON ?auto_37035 ?auto_37036 ) ( ON-TABLE ?auto_37037 ) ( ON ?auto_37034 ?auto_37035 ) ( CLEAR ?auto_37034 ) ( HOLDING ?auto_37033 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37033 )
      ( MAKE-4PILE ?auto_37033 ?auto_37034 ?auto_37035 ?auto_37036 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37038 - BLOCK
      ?auto_37039 - BLOCK
      ?auto_37040 - BLOCK
      ?auto_37041 - BLOCK
    )
    :vars
    (
      ?auto_37042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37038 ?auto_37039 ) ) ( not ( = ?auto_37038 ?auto_37040 ) ) ( not ( = ?auto_37038 ?auto_37041 ) ) ( not ( = ?auto_37039 ?auto_37040 ) ) ( not ( = ?auto_37039 ?auto_37041 ) ) ( not ( = ?auto_37040 ?auto_37041 ) ) ( ON ?auto_37041 ?auto_37042 ) ( not ( = ?auto_37038 ?auto_37042 ) ) ( not ( = ?auto_37039 ?auto_37042 ) ) ( not ( = ?auto_37040 ?auto_37042 ) ) ( not ( = ?auto_37041 ?auto_37042 ) ) ( ON ?auto_37040 ?auto_37041 ) ( ON-TABLE ?auto_37042 ) ( ON ?auto_37039 ?auto_37040 ) ( ON ?auto_37038 ?auto_37039 ) ( CLEAR ?auto_37038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37042 ?auto_37041 ?auto_37040 ?auto_37039 )
      ( MAKE-4PILE ?auto_37038 ?auto_37039 ?auto_37040 ?auto_37041 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37043 - BLOCK
      ?auto_37044 - BLOCK
      ?auto_37045 - BLOCK
      ?auto_37046 - BLOCK
    )
    :vars
    (
      ?auto_37047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37043 ?auto_37044 ) ) ( not ( = ?auto_37043 ?auto_37045 ) ) ( not ( = ?auto_37043 ?auto_37046 ) ) ( not ( = ?auto_37044 ?auto_37045 ) ) ( not ( = ?auto_37044 ?auto_37046 ) ) ( not ( = ?auto_37045 ?auto_37046 ) ) ( ON ?auto_37046 ?auto_37047 ) ( not ( = ?auto_37043 ?auto_37047 ) ) ( not ( = ?auto_37044 ?auto_37047 ) ) ( not ( = ?auto_37045 ?auto_37047 ) ) ( not ( = ?auto_37046 ?auto_37047 ) ) ( ON ?auto_37045 ?auto_37046 ) ( ON-TABLE ?auto_37047 ) ( ON ?auto_37044 ?auto_37045 ) ( HOLDING ?auto_37043 ) ( CLEAR ?auto_37044 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37047 ?auto_37046 ?auto_37045 ?auto_37044 ?auto_37043 )
      ( MAKE-4PILE ?auto_37043 ?auto_37044 ?auto_37045 ?auto_37046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37048 - BLOCK
      ?auto_37049 - BLOCK
      ?auto_37050 - BLOCK
      ?auto_37051 - BLOCK
    )
    :vars
    (
      ?auto_37052 - BLOCK
      ?auto_37053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37048 ?auto_37049 ) ) ( not ( = ?auto_37048 ?auto_37050 ) ) ( not ( = ?auto_37048 ?auto_37051 ) ) ( not ( = ?auto_37049 ?auto_37050 ) ) ( not ( = ?auto_37049 ?auto_37051 ) ) ( not ( = ?auto_37050 ?auto_37051 ) ) ( ON ?auto_37051 ?auto_37052 ) ( not ( = ?auto_37048 ?auto_37052 ) ) ( not ( = ?auto_37049 ?auto_37052 ) ) ( not ( = ?auto_37050 ?auto_37052 ) ) ( not ( = ?auto_37051 ?auto_37052 ) ) ( ON ?auto_37050 ?auto_37051 ) ( ON-TABLE ?auto_37052 ) ( ON ?auto_37049 ?auto_37050 ) ( CLEAR ?auto_37049 ) ( ON ?auto_37048 ?auto_37053 ) ( CLEAR ?auto_37048 ) ( HAND-EMPTY ) ( not ( = ?auto_37048 ?auto_37053 ) ) ( not ( = ?auto_37049 ?auto_37053 ) ) ( not ( = ?auto_37050 ?auto_37053 ) ) ( not ( = ?auto_37051 ?auto_37053 ) ) ( not ( = ?auto_37052 ?auto_37053 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37048 ?auto_37053 )
      ( MAKE-4PILE ?auto_37048 ?auto_37049 ?auto_37050 ?auto_37051 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37054 - BLOCK
      ?auto_37055 - BLOCK
      ?auto_37056 - BLOCK
      ?auto_37057 - BLOCK
    )
    :vars
    (
      ?auto_37059 - BLOCK
      ?auto_37058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37054 ?auto_37055 ) ) ( not ( = ?auto_37054 ?auto_37056 ) ) ( not ( = ?auto_37054 ?auto_37057 ) ) ( not ( = ?auto_37055 ?auto_37056 ) ) ( not ( = ?auto_37055 ?auto_37057 ) ) ( not ( = ?auto_37056 ?auto_37057 ) ) ( ON ?auto_37057 ?auto_37059 ) ( not ( = ?auto_37054 ?auto_37059 ) ) ( not ( = ?auto_37055 ?auto_37059 ) ) ( not ( = ?auto_37056 ?auto_37059 ) ) ( not ( = ?auto_37057 ?auto_37059 ) ) ( ON ?auto_37056 ?auto_37057 ) ( ON-TABLE ?auto_37059 ) ( ON ?auto_37054 ?auto_37058 ) ( CLEAR ?auto_37054 ) ( not ( = ?auto_37054 ?auto_37058 ) ) ( not ( = ?auto_37055 ?auto_37058 ) ) ( not ( = ?auto_37056 ?auto_37058 ) ) ( not ( = ?auto_37057 ?auto_37058 ) ) ( not ( = ?auto_37059 ?auto_37058 ) ) ( HOLDING ?auto_37055 ) ( CLEAR ?auto_37056 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37059 ?auto_37057 ?auto_37056 ?auto_37055 )
      ( MAKE-4PILE ?auto_37054 ?auto_37055 ?auto_37056 ?auto_37057 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37060 - BLOCK
      ?auto_37061 - BLOCK
      ?auto_37062 - BLOCK
      ?auto_37063 - BLOCK
    )
    :vars
    (
      ?auto_37064 - BLOCK
      ?auto_37065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37060 ?auto_37061 ) ) ( not ( = ?auto_37060 ?auto_37062 ) ) ( not ( = ?auto_37060 ?auto_37063 ) ) ( not ( = ?auto_37061 ?auto_37062 ) ) ( not ( = ?auto_37061 ?auto_37063 ) ) ( not ( = ?auto_37062 ?auto_37063 ) ) ( ON ?auto_37063 ?auto_37064 ) ( not ( = ?auto_37060 ?auto_37064 ) ) ( not ( = ?auto_37061 ?auto_37064 ) ) ( not ( = ?auto_37062 ?auto_37064 ) ) ( not ( = ?auto_37063 ?auto_37064 ) ) ( ON ?auto_37062 ?auto_37063 ) ( ON-TABLE ?auto_37064 ) ( ON ?auto_37060 ?auto_37065 ) ( not ( = ?auto_37060 ?auto_37065 ) ) ( not ( = ?auto_37061 ?auto_37065 ) ) ( not ( = ?auto_37062 ?auto_37065 ) ) ( not ( = ?auto_37063 ?auto_37065 ) ) ( not ( = ?auto_37064 ?auto_37065 ) ) ( CLEAR ?auto_37062 ) ( ON ?auto_37061 ?auto_37060 ) ( CLEAR ?auto_37061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37065 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37065 ?auto_37060 )
      ( MAKE-4PILE ?auto_37060 ?auto_37061 ?auto_37062 ?auto_37063 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37066 - BLOCK
      ?auto_37067 - BLOCK
      ?auto_37068 - BLOCK
      ?auto_37069 - BLOCK
    )
    :vars
    (
      ?auto_37070 - BLOCK
      ?auto_37071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37066 ?auto_37067 ) ) ( not ( = ?auto_37066 ?auto_37068 ) ) ( not ( = ?auto_37066 ?auto_37069 ) ) ( not ( = ?auto_37067 ?auto_37068 ) ) ( not ( = ?auto_37067 ?auto_37069 ) ) ( not ( = ?auto_37068 ?auto_37069 ) ) ( ON ?auto_37069 ?auto_37070 ) ( not ( = ?auto_37066 ?auto_37070 ) ) ( not ( = ?auto_37067 ?auto_37070 ) ) ( not ( = ?auto_37068 ?auto_37070 ) ) ( not ( = ?auto_37069 ?auto_37070 ) ) ( ON-TABLE ?auto_37070 ) ( ON ?auto_37066 ?auto_37071 ) ( not ( = ?auto_37066 ?auto_37071 ) ) ( not ( = ?auto_37067 ?auto_37071 ) ) ( not ( = ?auto_37068 ?auto_37071 ) ) ( not ( = ?auto_37069 ?auto_37071 ) ) ( not ( = ?auto_37070 ?auto_37071 ) ) ( ON ?auto_37067 ?auto_37066 ) ( CLEAR ?auto_37067 ) ( ON-TABLE ?auto_37071 ) ( HOLDING ?auto_37068 ) ( CLEAR ?auto_37069 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37070 ?auto_37069 ?auto_37068 )
      ( MAKE-4PILE ?auto_37066 ?auto_37067 ?auto_37068 ?auto_37069 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37072 - BLOCK
      ?auto_37073 - BLOCK
      ?auto_37074 - BLOCK
      ?auto_37075 - BLOCK
    )
    :vars
    (
      ?auto_37077 - BLOCK
      ?auto_37076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37072 ?auto_37073 ) ) ( not ( = ?auto_37072 ?auto_37074 ) ) ( not ( = ?auto_37072 ?auto_37075 ) ) ( not ( = ?auto_37073 ?auto_37074 ) ) ( not ( = ?auto_37073 ?auto_37075 ) ) ( not ( = ?auto_37074 ?auto_37075 ) ) ( ON ?auto_37075 ?auto_37077 ) ( not ( = ?auto_37072 ?auto_37077 ) ) ( not ( = ?auto_37073 ?auto_37077 ) ) ( not ( = ?auto_37074 ?auto_37077 ) ) ( not ( = ?auto_37075 ?auto_37077 ) ) ( ON-TABLE ?auto_37077 ) ( ON ?auto_37072 ?auto_37076 ) ( not ( = ?auto_37072 ?auto_37076 ) ) ( not ( = ?auto_37073 ?auto_37076 ) ) ( not ( = ?auto_37074 ?auto_37076 ) ) ( not ( = ?auto_37075 ?auto_37076 ) ) ( not ( = ?auto_37077 ?auto_37076 ) ) ( ON ?auto_37073 ?auto_37072 ) ( ON-TABLE ?auto_37076 ) ( CLEAR ?auto_37075 ) ( ON ?auto_37074 ?auto_37073 ) ( CLEAR ?auto_37074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37076 ?auto_37072 ?auto_37073 )
      ( MAKE-4PILE ?auto_37072 ?auto_37073 ?auto_37074 ?auto_37075 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37078 - BLOCK
      ?auto_37079 - BLOCK
      ?auto_37080 - BLOCK
      ?auto_37081 - BLOCK
    )
    :vars
    (
      ?auto_37082 - BLOCK
      ?auto_37083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37078 ?auto_37079 ) ) ( not ( = ?auto_37078 ?auto_37080 ) ) ( not ( = ?auto_37078 ?auto_37081 ) ) ( not ( = ?auto_37079 ?auto_37080 ) ) ( not ( = ?auto_37079 ?auto_37081 ) ) ( not ( = ?auto_37080 ?auto_37081 ) ) ( not ( = ?auto_37078 ?auto_37082 ) ) ( not ( = ?auto_37079 ?auto_37082 ) ) ( not ( = ?auto_37080 ?auto_37082 ) ) ( not ( = ?auto_37081 ?auto_37082 ) ) ( ON-TABLE ?auto_37082 ) ( ON ?auto_37078 ?auto_37083 ) ( not ( = ?auto_37078 ?auto_37083 ) ) ( not ( = ?auto_37079 ?auto_37083 ) ) ( not ( = ?auto_37080 ?auto_37083 ) ) ( not ( = ?auto_37081 ?auto_37083 ) ) ( not ( = ?auto_37082 ?auto_37083 ) ) ( ON ?auto_37079 ?auto_37078 ) ( ON-TABLE ?auto_37083 ) ( ON ?auto_37080 ?auto_37079 ) ( CLEAR ?auto_37080 ) ( HOLDING ?auto_37081 ) ( CLEAR ?auto_37082 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37082 ?auto_37081 )
      ( MAKE-4PILE ?auto_37078 ?auto_37079 ?auto_37080 ?auto_37081 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37084 - BLOCK
      ?auto_37085 - BLOCK
      ?auto_37086 - BLOCK
      ?auto_37087 - BLOCK
    )
    :vars
    (
      ?auto_37089 - BLOCK
      ?auto_37088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37084 ?auto_37085 ) ) ( not ( = ?auto_37084 ?auto_37086 ) ) ( not ( = ?auto_37084 ?auto_37087 ) ) ( not ( = ?auto_37085 ?auto_37086 ) ) ( not ( = ?auto_37085 ?auto_37087 ) ) ( not ( = ?auto_37086 ?auto_37087 ) ) ( not ( = ?auto_37084 ?auto_37089 ) ) ( not ( = ?auto_37085 ?auto_37089 ) ) ( not ( = ?auto_37086 ?auto_37089 ) ) ( not ( = ?auto_37087 ?auto_37089 ) ) ( ON-TABLE ?auto_37089 ) ( ON ?auto_37084 ?auto_37088 ) ( not ( = ?auto_37084 ?auto_37088 ) ) ( not ( = ?auto_37085 ?auto_37088 ) ) ( not ( = ?auto_37086 ?auto_37088 ) ) ( not ( = ?auto_37087 ?auto_37088 ) ) ( not ( = ?auto_37089 ?auto_37088 ) ) ( ON ?auto_37085 ?auto_37084 ) ( ON-TABLE ?auto_37088 ) ( ON ?auto_37086 ?auto_37085 ) ( CLEAR ?auto_37089 ) ( ON ?auto_37087 ?auto_37086 ) ( CLEAR ?auto_37087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37088 ?auto_37084 ?auto_37085 ?auto_37086 )
      ( MAKE-4PILE ?auto_37084 ?auto_37085 ?auto_37086 ?auto_37087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37090 - BLOCK
      ?auto_37091 - BLOCK
      ?auto_37092 - BLOCK
      ?auto_37093 - BLOCK
    )
    :vars
    (
      ?auto_37094 - BLOCK
      ?auto_37095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37090 ?auto_37091 ) ) ( not ( = ?auto_37090 ?auto_37092 ) ) ( not ( = ?auto_37090 ?auto_37093 ) ) ( not ( = ?auto_37091 ?auto_37092 ) ) ( not ( = ?auto_37091 ?auto_37093 ) ) ( not ( = ?auto_37092 ?auto_37093 ) ) ( not ( = ?auto_37090 ?auto_37094 ) ) ( not ( = ?auto_37091 ?auto_37094 ) ) ( not ( = ?auto_37092 ?auto_37094 ) ) ( not ( = ?auto_37093 ?auto_37094 ) ) ( ON ?auto_37090 ?auto_37095 ) ( not ( = ?auto_37090 ?auto_37095 ) ) ( not ( = ?auto_37091 ?auto_37095 ) ) ( not ( = ?auto_37092 ?auto_37095 ) ) ( not ( = ?auto_37093 ?auto_37095 ) ) ( not ( = ?auto_37094 ?auto_37095 ) ) ( ON ?auto_37091 ?auto_37090 ) ( ON-TABLE ?auto_37095 ) ( ON ?auto_37092 ?auto_37091 ) ( ON ?auto_37093 ?auto_37092 ) ( CLEAR ?auto_37093 ) ( HOLDING ?auto_37094 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37094 )
      ( MAKE-4PILE ?auto_37090 ?auto_37091 ?auto_37092 ?auto_37093 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37096 - BLOCK
      ?auto_37097 - BLOCK
      ?auto_37098 - BLOCK
      ?auto_37099 - BLOCK
    )
    :vars
    (
      ?auto_37100 - BLOCK
      ?auto_37101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37096 ?auto_37097 ) ) ( not ( = ?auto_37096 ?auto_37098 ) ) ( not ( = ?auto_37096 ?auto_37099 ) ) ( not ( = ?auto_37097 ?auto_37098 ) ) ( not ( = ?auto_37097 ?auto_37099 ) ) ( not ( = ?auto_37098 ?auto_37099 ) ) ( not ( = ?auto_37096 ?auto_37100 ) ) ( not ( = ?auto_37097 ?auto_37100 ) ) ( not ( = ?auto_37098 ?auto_37100 ) ) ( not ( = ?auto_37099 ?auto_37100 ) ) ( ON ?auto_37096 ?auto_37101 ) ( not ( = ?auto_37096 ?auto_37101 ) ) ( not ( = ?auto_37097 ?auto_37101 ) ) ( not ( = ?auto_37098 ?auto_37101 ) ) ( not ( = ?auto_37099 ?auto_37101 ) ) ( not ( = ?auto_37100 ?auto_37101 ) ) ( ON ?auto_37097 ?auto_37096 ) ( ON-TABLE ?auto_37101 ) ( ON ?auto_37098 ?auto_37097 ) ( ON ?auto_37099 ?auto_37098 ) ( ON ?auto_37100 ?auto_37099 ) ( CLEAR ?auto_37100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37101 ?auto_37096 ?auto_37097 ?auto_37098 ?auto_37099 )
      ( MAKE-4PILE ?auto_37096 ?auto_37097 ?auto_37098 ?auto_37099 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37107 - BLOCK
      ?auto_37108 - BLOCK
      ?auto_37109 - BLOCK
      ?auto_37110 - BLOCK
      ?auto_37111 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37111 ) ( CLEAR ?auto_37110 ) ( ON-TABLE ?auto_37107 ) ( ON ?auto_37108 ?auto_37107 ) ( ON ?auto_37109 ?auto_37108 ) ( ON ?auto_37110 ?auto_37109 ) ( not ( = ?auto_37107 ?auto_37108 ) ) ( not ( = ?auto_37107 ?auto_37109 ) ) ( not ( = ?auto_37107 ?auto_37110 ) ) ( not ( = ?auto_37107 ?auto_37111 ) ) ( not ( = ?auto_37108 ?auto_37109 ) ) ( not ( = ?auto_37108 ?auto_37110 ) ) ( not ( = ?auto_37108 ?auto_37111 ) ) ( not ( = ?auto_37109 ?auto_37110 ) ) ( not ( = ?auto_37109 ?auto_37111 ) ) ( not ( = ?auto_37110 ?auto_37111 ) ) )
    :subtasks
    ( ( !STACK ?auto_37111 ?auto_37110 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37112 - BLOCK
      ?auto_37113 - BLOCK
      ?auto_37114 - BLOCK
      ?auto_37115 - BLOCK
      ?auto_37116 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37115 ) ( ON-TABLE ?auto_37112 ) ( ON ?auto_37113 ?auto_37112 ) ( ON ?auto_37114 ?auto_37113 ) ( ON ?auto_37115 ?auto_37114 ) ( not ( = ?auto_37112 ?auto_37113 ) ) ( not ( = ?auto_37112 ?auto_37114 ) ) ( not ( = ?auto_37112 ?auto_37115 ) ) ( not ( = ?auto_37112 ?auto_37116 ) ) ( not ( = ?auto_37113 ?auto_37114 ) ) ( not ( = ?auto_37113 ?auto_37115 ) ) ( not ( = ?auto_37113 ?auto_37116 ) ) ( not ( = ?auto_37114 ?auto_37115 ) ) ( not ( = ?auto_37114 ?auto_37116 ) ) ( not ( = ?auto_37115 ?auto_37116 ) ) ( ON-TABLE ?auto_37116 ) ( CLEAR ?auto_37116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_37116 )
      ( MAKE-5PILE ?auto_37112 ?auto_37113 ?auto_37114 ?auto_37115 ?auto_37116 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37117 - BLOCK
      ?auto_37118 - BLOCK
      ?auto_37119 - BLOCK
      ?auto_37120 - BLOCK
      ?auto_37121 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37117 ) ( ON ?auto_37118 ?auto_37117 ) ( ON ?auto_37119 ?auto_37118 ) ( not ( = ?auto_37117 ?auto_37118 ) ) ( not ( = ?auto_37117 ?auto_37119 ) ) ( not ( = ?auto_37117 ?auto_37120 ) ) ( not ( = ?auto_37117 ?auto_37121 ) ) ( not ( = ?auto_37118 ?auto_37119 ) ) ( not ( = ?auto_37118 ?auto_37120 ) ) ( not ( = ?auto_37118 ?auto_37121 ) ) ( not ( = ?auto_37119 ?auto_37120 ) ) ( not ( = ?auto_37119 ?auto_37121 ) ) ( not ( = ?auto_37120 ?auto_37121 ) ) ( ON-TABLE ?auto_37121 ) ( CLEAR ?auto_37121 ) ( HOLDING ?auto_37120 ) ( CLEAR ?auto_37119 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37117 ?auto_37118 ?auto_37119 ?auto_37120 )
      ( MAKE-5PILE ?auto_37117 ?auto_37118 ?auto_37119 ?auto_37120 ?auto_37121 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37122 - BLOCK
      ?auto_37123 - BLOCK
      ?auto_37124 - BLOCK
      ?auto_37125 - BLOCK
      ?auto_37126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37122 ) ( ON ?auto_37123 ?auto_37122 ) ( ON ?auto_37124 ?auto_37123 ) ( not ( = ?auto_37122 ?auto_37123 ) ) ( not ( = ?auto_37122 ?auto_37124 ) ) ( not ( = ?auto_37122 ?auto_37125 ) ) ( not ( = ?auto_37122 ?auto_37126 ) ) ( not ( = ?auto_37123 ?auto_37124 ) ) ( not ( = ?auto_37123 ?auto_37125 ) ) ( not ( = ?auto_37123 ?auto_37126 ) ) ( not ( = ?auto_37124 ?auto_37125 ) ) ( not ( = ?auto_37124 ?auto_37126 ) ) ( not ( = ?auto_37125 ?auto_37126 ) ) ( ON-TABLE ?auto_37126 ) ( CLEAR ?auto_37124 ) ( ON ?auto_37125 ?auto_37126 ) ( CLEAR ?auto_37125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37126 )
      ( MAKE-5PILE ?auto_37122 ?auto_37123 ?auto_37124 ?auto_37125 ?auto_37126 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37127 - BLOCK
      ?auto_37128 - BLOCK
      ?auto_37129 - BLOCK
      ?auto_37130 - BLOCK
      ?auto_37131 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37127 ) ( ON ?auto_37128 ?auto_37127 ) ( not ( = ?auto_37127 ?auto_37128 ) ) ( not ( = ?auto_37127 ?auto_37129 ) ) ( not ( = ?auto_37127 ?auto_37130 ) ) ( not ( = ?auto_37127 ?auto_37131 ) ) ( not ( = ?auto_37128 ?auto_37129 ) ) ( not ( = ?auto_37128 ?auto_37130 ) ) ( not ( = ?auto_37128 ?auto_37131 ) ) ( not ( = ?auto_37129 ?auto_37130 ) ) ( not ( = ?auto_37129 ?auto_37131 ) ) ( not ( = ?auto_37130 ?auto_37131 ) ) ( ON-TABLE ?auto_37131 ) ( ON ?auto_37130 ?auto_37131 ) ( CLEAR ?auto_37130 ) ( HOLDING ?auto_37129 ) ( CLEAR ?auto_37128 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37127 ?auto_37128 ?auto_37129 )
      ( MAKE-5PILE ?auto_37127 ?auto_37128 ?auto_37129 ?auto_37130 ?auto_37131 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37132 - BLOCK
      ?auto_37133 - BLOCK
      ?auto_37134 - BLOCK
      ?auto_37135 - BLOCK
      ?auto_37136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37132 ) ( ON ?auto_37133 ?auto_37132 ) ( not ( = ?auto_37132 ?auto_37133 ) ) ( not ( = ?auto_37132 ?auto_37134 ) ) ( not ( = ?auto_37132 ?auto_37135 ) ) ( not ( = ?auto_37132 ?auto_37136 ) ) ( not ( = ?auto_37133 ?auto_37134 ) ) ( not ( = ?auto_37133 ?auto_37135 ) ) ( not ( = ?auto_37133 ?auto_37136 ) ) ( not ( = ?auto_37134 ?auto_37135 ) ) ( not ( = ?auto_37134 ?auto_37136 ) ) ( not ( = ?auto_37135 ?auto_37136 ) ) ( ON-TABLE ?auto_37136 ) ( ON ?auto_37135 ?auto_37136 ) ( CLEAR ?auto_37133 ) ( ON ?auto_37134 ?auto_37135 ) ( CLEAR ?auto_37134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37136 ?auto_37135 )
      ( MAKE-5PILE ?auto_37132 ?auto_37133 ?auto_37134 ?auto_37135 ?auto_37136 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37137 - BLOCK
      ?auto_37138 - BLOCK
      ?auto_37139 - BLOCK
      ?auto_37140 - BLOCK
      ?auto_37141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37137 ) ( not ( = ?auto_37137 ?auto_37138 ) ) ( not ( = ?auto_37137 ?auto_37139 ) ) ( not ( = ?auto_37137 ?auto_37140 ) ) ( not ( = ?auto_37137 ?auto_37141 ) ) ( not ( = ?auto_37138 ?auto_37139 ) ) ( not ( = ?auto_37138 ?auto_37140 ) ) ( not ( = ?auto_37138 ?auto_37141 ) ) ( not ( = ?auto_37139 ?auto_37140 ) ) ( not ( = ?auto_37139 ?auto_37141 ) ) ( not ( = ?auto_37140 ?auto_37141 ) ) ( ON-TABLE ?auto_37141 ) ( ON ?auto_37140 ?auto_37141 ) ( ON ?auto_37139 ?auto_37140 ) ( CLEAR ?auto_37139 ) ( HOLDING ?auto_37138 ) ( CLEAR ?auto_37137 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37137 ?auto_37138 )
      ( MAKE-5PILE ?auto_37137 ?auto_37138 ?auto_37139 ?auto_37140 ?auto_37141 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37142 - BLOCK
      ?auto_37143 - BLOCK
      ?auto_37144 - BLOCK
      ?auto_37145 - BLOCK
      ?auto_37146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37142 ) ( not ( = ?auto_37142 ?auto_37143 ) ) ( not ( = ?auto_37142 ?auto_37144 ) ) ( not ( = ?auto_37142 ?auto_37145 ) ) ( not ( = ?auto_37142 ?auto_37146 ) ) ( not ( = ?auto_37143 ?auto_37144 ) ) ( not ( = ?auto_37143 ?auto_37145 ) ) ( not ( = ?auto_37143 ?auto_37146 ) ) ( not ( = ?auto_37144 ?auto_37145 ) ) ( not ( = ?auto_37144 ?auto_37146 ) ) ( not ( = ?auto_37145 ?auto_37146 ) ) ( ON-TABLE ?auto_37146 ) ( ON ?auto_37145 ?auto_37146 ) ( ON ?auto_37144 ?auto_37145 ) ( CLEAR ?auto_37142 ) ( ON ?auto_37143 ?auto_37144 ) ( CLEAR ?auto_37143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37146 ?auto_37145 ?auto_37144 )
      ( MAKE-5PILE ?auto_37142 ?auto_37143 ?auto_37144 ?auto_37145 ?auto_37146 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37147 - BLOCK
      ?auto_37148 - BLOCK
      ?auto_37149 - BLOCK
      ?auto_37150 - BLOCK
      ?auto_37151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37147 ?auto_37148 ) ) ( not ( = ?auto_37147 ?auto_37149 ) ) ( not ( = ?auto_37147 ?auto_37150 ) ) ( not ( = ?auto_37147 ?auto_37151 ) ) ( not ( = ?auto_37148 ?auto_37149 ) ) ( not ( = ?auto_37148 ?auto_37150 ) ) ( not ( = ?auto_37148 ?auto_37151 ) ) ( not ( = ?auto_37149 ?auto_37150 ) ) ( not ( = ?auto_37149 ?auto_37151 ) ) ( not ( = ?auto_37150 ?auto_37151 ) ) ( ON-TABLE ?auto_37151 ) ( ON ?auto_37150 ?auto_37151 ) ( ON ?auto_37149 ?auto_37150 ) ( ON ?auto_37148 ?auto_37149 ) ( CLEAR ?auto_37148 ) ( HOLDING ?auto_37147 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37147 )
      ( MAKE-5PILE ?auto_37147 ?auto_37148 ?auto_37149 ?auto_37150 ?auto_37151 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37152 - BLOCK
      ?auto_37153 - BLOCK
      ?auto_37154 - BLOCK
      ?auto_37155 - BLOCK
      ?auto_37156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37152 ?auto_37153 ) ) ( not ( = ?auto_37152 ?auto_37154 ) ) ( not ( = ?auto_37152 ?auto_37155 ) ) ( not ( = ?auto_37152 ?auto_37156 ) ) ( not ( = ?auto_37153 ?auto_37154 ) ) ( not ( = ?auto_37153 ?auto_37155 ) ) ( not ( = ?auto_37153 ?auto_37156 ) ) ( not ( = ?auto_37154 ?auto_37155 ) ) ( not ( = ?auto_37154 ?auto_37156 ) ) ( not ( = ?auto_37155 ?auto_37156 ) ) ( ON-TABLE ?auto_37156 ) ( ON ?auto_37155 ?auto_37156 ) ( ON ?auto_37154 ?auto_37155 ) ( ON ?auto_37153 ?auto_37154 ) ( ON ?auto_37152 ?auto_37153 ) ( CLEAR ?auto_37152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37156 ?auto_37155 ?auto_37154 ?auto_37153 )
      ( MAKE-5PILE ?auto_37152 ?auto_37153 ?auto_37154 ?auto_37155 ?auto_37156 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37157 - BLOCK
      ?auto_37158 - BLOCK
      ?auto_37159 - BLOCK
      ?auto_37160 - BLOCK
      ?auto_37161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37157 ?auto_37158 ) ) ( not ( = ?auto_37157 ?auto_37159 ) ) ( not ( = ?auto_37157 ?auto_37160 ) ) ( not ( = ?auto_37157 ?auto_37161 ) ) ( not ( = ?auto_37158 ?auto_37159 ) ) ( not ( = ?auto_37158 ?auto_37160 ) ) ( not ( = ?auto_37158 ?auto_37161 ) ) ( not ( = ?auto_37159 ?auto_37160 ) ) ( not ( = ?auto_37159 ?auto_37161 ) ) ( not ( = ?auto_37160 ?auto_37161 ) ) ( ON-TABLE ?auto_37161 ) ( ON ?auto_37160 ?auto_37161 ) ( ON ?auto_37159 ?auto_37160 ) ( ON ?auto_37158 ?auto_37159 ) ( HOLDING ?auto_37157 ) ( CLEAR ?auto_37158 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37161 ?auto_37160 ?auto_37159 ?auto_37158 ?auto_37157 )
      ( MAKE-5PILE ?auto_37157 ?auto_37158 ?auto_37159 ?auto_37160 ?auto_37161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37162 - BLOCK
      ?auto_37163 - BLOCK
      ?auto_37164 - BLOCK
      ?auto_37165 - BLOCK
      ?auto_37166 - BLOCK
    )
    :vars
    (
      ?auto_37167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37162 ?auto_37163 ) ) ( not ( = ?auto_37162 ?auto_37164 ) ) ( not ( = ?auto_37162 ?auto_37165 ) ) ( not ( = ?auto_37162 ?auto_37166 ) ) ( not ( = ?auto_37163 ?auto_37164 ) ) ( not ( = ?auto_37163 ?auto_37165 ) ) ( not ( = ?auto_37163 ?auto_37166 ) ) ( not ( = ?auto_37164 ?auto_37165 ) ) ( not ( = ?auto_37164 ?auto_37166 ) ) ( not ( = ?auto_37165 ?auto_37166 ) ) ( ON-TABLE ?auto_37166 ) ( ON ?auto_37165 ?auto_37166 ) ( ON ?auto_37164 ?auto_37165 ) ( ON ?auto_37163 ?auto_37164 ) ( CLEAR ?auto_37163 ) ( ON ?auto_37162 ?auto_37167 ) ( CLEAR ?auto_37162 ) ( HAND-EMPTY ) ( not ( = ?auto_37162 ?auto_37167 ) ) ( not ( = ?auto_37163 ?auto_37167 ) ) ( not ( = ?auto_37164 ?auto_37167 ) ) ( not ( = ?auto_37165 ?auto_37167 ) ) ( not ( = ?auto_37166 ?auto_37167 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37162 ?auto_37167 )
      ( MAKE-5PILE ?auto_37162 ?auto_37163 ?auto_37164 ?auto_37165 ?auto_37166 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37168 - BLOCK
      ?auto_37169 - BLOCK
      ?auto_37170 - BLOCK
      ?auto_37171 - BLOCK
      ?auto_37172 - BLOCK
    )
    :vars
    (
      ?auto_37173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37168 ?auto_37169 ) ) ( not ( = ?auto_37168 ?auto_37170 ) ) ( not ( = ?auto_37168 ?auto_37171 ) ) ( not ( = ?auto_37168 ?auto_37172 ) ) ( not ( = ?auto_37169 ?auto_37170 ) ) ( not ( = ?auto_37169 ?auto_37171 ) ) ( not ( = ?auto_37169 ?auto_37172 ) ) ( not ( = ?auto_37170 ?auto_37171 ) ) ( not ( = ?auto_37170 ?auto_37172 ) ) ( not ( = ?auto_37171 ?auto_37172 ) ) ( ON-TABLE ?auto_37172 ) ( ON ?auto_37171 ?auto_37172 ) ( ON ?auto_37170 ?auto_37171 ) ( ON ?auto_37168 ?auto_37173 ) ( CLEAR ?auto_37168 ) ( not ( = ?auto_37168 ?auto_37173 ) ) ( not ( = ?auto_37169 ?auto_37173 ) ) ( not ( = ?auto_37170 ?auto_37173 ) ) ( not ( = ?auto_37171 ?auto_37173 ) ) ( not ( = ?auto_37172 ?auto_37173 ) ) ( HOLDING ?auto_37169 ) ( CLEAR ?auto_37170 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37172 ?auto_37171 ?auto_37170 ?auto_37169 )
      ( MAKE-5PILE ?auto_37168 ?auto_37169 ?auto_37170 ?auto_37171 ?auto_37172 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37174 - BLOCK
      ?auto_37175 - BLOCK
      ?auto_37176 - BLOCK
      ?auto_37177 - BLOCK
      ?auto_37178 - BLOCK
    )
    :vars
    (
      ?auto_37179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37174 ?auto_37175 ) ) ( not ( = ?auto_37174 ?auto_37176 ) ) ( not ( = ?auto_37174 ?auto_37177 ) ) ( not ( = ?auto_37174 ?auto_37178 ) ) ( not ( = ?auto_37175 ?auto_37176 ) ) ( not ( = ?auto_37175 ?auto_37177 ) ) ( not ( = ?auto_37175 ?auto_37178 ) ) ( not ( = ?auto_37176 ?auto_37177 ) ) ( not ( = ?auto_37176 ?auto_37178 ) ) ( not ( = ?auto_37177 ?auto_37178 ) ) ( ON-TABLE ?auto_37178 ) ( ON ?auto_37177 ?auto_37178 ) ( ON ?auto_37176 ?auto_37177 ) ( ON ?auto_37174 ?auto_37179 ) ( not ( = ?auto_37174 ?auto_37179 ) ) ( not ( = ?auto_37175 ?auto_37179 ) ) ( not ( = ?auto_37176 ?auto_37179 ) ) ( not ( = ?auto_37177 ?auto_37179 ) ) ( not ( = ?auto_37178 ?auto_37179 ) ) ( CLEAR ?auto_37176 ) ( ON ?auto_37175 ?auto_37174 ) ( CLEAR ?auto_37175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37179 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37179 ?auto_37174 )
      ( MAKE-5PILE ?auto_37174 ?auto_37175 ?auto_37176 ?auto_37177 ?auto_37178 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37180 - BLOCK
      ?auto_37181 - BLOCK
      ?auto_37182 - BLOCK
      ?auto_37183 - BLOCK
      ?auto_37184 - BLOCK
    )
    :vars
    (
      ?auto_37185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37180 ?auto_37181 ) ) ( not ( = ?auto_37180 ?auto_37182 ) ) ( not ( = ?auto_37180 ?auto_37183 ) ) ( not ( = ?auto_37180 ?auto_37184 ) ) ( not ( = ?auto_37181 ?auto_37182 ) ) ( not ( = ?auto_37181 ?auto_37183 ) ) ( not ( = ?auto_37181 ?auto_37184 ) ) ( not ( = ?auto_37182 ?auto_37183 ) ) ( not ( = ?auto_37182 ?auto_37184 ) ) ( not ( = ?auto_37183 ?auto_37184 ) ) ( ON-TABLE ?auto_37184 ) ( ON ?auto_37183 ?auto_37184 ) ( ON ?auto_37180 ?auto_37185 ) ( not ( = ?auto_37180 ?auto_37185 ) ) ( not ( = ?auto_37181 ?auto_37185 ) ) ( not ( = ?auto_37182 ?auto_37185 ) ) ( not ( = ?auto_37183 ?auto_37185 ) ) ( not ( = ?auto_37184 ?auto_37185 ) ) ( ON ?auto_37181 ?auto_37180 ) ( CLEAR ?auto_37181 ) ( ON-TABLE ?auto_37185 ) ( HOLDING ?auto_37182 ) ( CLEAR ?auto_37183 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37184 ?auto_37183 ?auto_37182 )
      ( MAKE-5PILE ?auto_37180 ?auto_37181 ?auto_37182 ?auto_37183 ?auto_37184 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37186 - BLOCK
      ?auto_37187 - BLOCK
      ?auto_37188 - BLOCK
      ?auto_37189 - BLOCK
      ?auto_37190 - BLOCK
    )
    :vars
    (
      ?auto_37191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37186 ?auto_37187 ) ) ( not ( = ?auto_37186 ?auto_37188 ) ) ( not ( = ?auto_37186 ?auto_37189 ) ) ( not ( = ?auto_37186 ?auto_37190 ) ) ( not ( = ?auto_37187 ?auto_37188 ) ) ( not ( = ?auto_37187 ?auto_37189 ) ) ( not ( = ?auto_37187 ?auto_37190 ) ) ( not ( = ?auto_37188 ?auto_37189 ) ) ( not ( = ?auto_37188 ?auto_37190 ) ) ( not ( = ?auto_37189 ?auto_37190 ) ) ( ON-TABLE ?auto_37190 ) ( ON ?auto_37189 ?auto_37190 ) ( ON ?auto_37186 ?auto_37191 ) ( not ( = ?auto_37186 ?auto_37191 ) ) ( not ( = ?auto_37187 ?auto_37191 ) ) ( not ( = ?auto_37188 ?auto_37191 ) ) ( not ( = ?auto_37189 ?auto_37191 ) ) ( not ( = ?auto_37190 ?auto_37191 ) ) ( ON ?auto_37187 ?auto_37186 ) ( ON-TABLE ?auto_37191 ) ( CLEAR ?auto_37189 ) ( ON ?auto_37188 ?auto_37187 ) ( CLEAR ?auto_37188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37191 ?auto_37186 ?auto_37187 )
      ( MAKE-5PILE ?auto_37186 ?auto_37187 ?auto_37188 ?auto_37189 ?auto_37190 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37192 - BLOCK
      ?auto_37193 - BLOCK
      ?auto_37194 - BLOCK
      ?auto_37195 - BLOCK
      ?auto_37196 - BLOCK
    )
    :vars
    (
      ?auto_37197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37192 ?auto_37193 ) ) ( not ( = ?auto_37192 ?auto_37194 ) ) ( not ( = ?auto_37192 ?auto_37195 ) ) ( not ( = ?auto_37192 ?auto_37196 ) ) ( not ( = ?auto_37193 ?auto_37194 ) ) ( not ( = ?auto_37193 ?auto_37195 ) ) ( not ( = ?auto_37193 ?auto_37196 ) ) ( not ( = ?auto_37194 ?auto_37195 ) ) ( not ( = ?auto_37194 ?auto_37196 ) ) ( not ( = ?auto_37195 ?auto_37196 ) ) ( ON-TABLE ?auto_37196 ) ( ON ?auto_37192 ?auto_37197 ) ( not ( = ?auto_37192 ?auto_37197 ) ) ( not ( = ?auto_37193 ?auto_37197 ) ) ( not ( = ?auto_37194 ?auto_37197 ) ) ( not ( = ?auto_37195 ?auto_37197 ) ) ( not ( = ?auto_37196 ?auto_37197 ) ) ( ON ?auto_37193 ?auto_37192 ) ( ON-TABLE ?auto_37197 ) ( ON ?auto_37194 ?auto_37193 ) ( CLEAR ?auto_37194 ) ( HOLDING ?auto_37195 ) ( CLEAR ?auto_37196 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37196 ?auto_37195 )
      ( MAKE-5PILE ?auto_37192 ?auto_37193 ?auto_37194 ?auto_37195 ?auto_37196 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37198 - BLOCK
      ?auto_37199 - BLOCK
      ?auto_37200 - BLOCK
      ?auto_37201 - BLOCK
      ?auto_37202 - BLOCK
    )
    :vars
    (
      ?auto_37203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37198 ?auto_37199 ) ) ( not ( = ?auto_37198 ?auto_37200 ) ) ( not ( = ?auto_37198 ?auto_37201 ) ) ( not ( = ?auto_37198 ?auto_37202 ) ) ( not ( = ?auto_37199 ?auto_37200 ) ) ( not ( = ?auto_37199 ?auto_37201 ) ) ( not ( = ?auto_37199 ?auto_37202 ) ) ( not ( = ?auto_37200 ?auto_37201 ) ) ( not ( = ?auto_37200 ?auto_37202 ) ) ( not ( = ?auto_37201 ?auto_37202 ) ) ( ON-TABLE ?auto_37202 ) ( ON ?auto_37198 ?auto_37203 ) ( not ( = ?auto_37198 ?auto_37203 ) ) ( not ( = ?auto_37199 ?auto_37203 ) ) ( not ( = ?auto_37200 ?auto_37203 ) ) ( not ( = ?auto_37201 ?auto_37203 ) ) ( not ( = ?auto_37202 ?auto_37203 ) ) ( ON ?auto_37199 ?auto_37198 ) ( ON-TABLE ?auto_37203 ) ( ON ?auto_37200 ?auto_37199 ) ( CLEAR ?auto_37202 ) ( ON ?auto_37201 ?auto_37200 ) ( CLEAR ?auto_37201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37203 ?auto_37198 ?auto_37199 ?auto_37200 )
      ( MAKE-5PILE ?auto_37198 ?auto_37199 ?auto_37200 ?auto_37201 ?auto_37202 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37204 - BLOCK
      ?auto_37205 - BLOCK
      ?auto_37206 - BLOCK
      ?auto_37207 - BLOCK
      ?auto_37208 - BLOCK
    )
    :vars
    (
      ?auto_37209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37204 ?auto_37205 ) ) ( not ( = ?auto_37204 ?auto_37206 ) ) ( not ( = ?auto_37204 ?auto_37207 ) ) ( not ( = ?auto_37204 ?auto_37208 ) ) ( not ( = ?auto_37205 ?auto_37206 ) ) ( not ( = ?auto_37205 ?auto_37207 ) ) ( not ( = ?auto_37205 ?auto_37208 ) ) ( not ( = ?auto_37206 ?auto_37207 ) ) ( not ( = ?auto_37206 ?auto_37208 ) ) ( not ( = ?auto_37207 ?auto_37208 ) ) ( ON ?auto_37204 ?auto_37209 ) ( not ( = ?auto_37204 ?auto_37209 ) ) ( not ( = ?auto_37205 ?auto_37209 ) ) ( not ( = ?auto_37206 ?auto_37209 ) ) ( not ( = ?auto_37207 ?auto_37209 ) ) ( not ( = ?auto_37208 ?auto_37209 ) ) ( ON ?auto_37205 ?auto_37204 ) ( ON-TABLE ?auto_37209 ) ( ON ?auto_37206 ?auto_37205 ) ( ON ?auto_37207 ?auto_37206 ) ( CLEAR ?auto_37207 ) ( HOLDING ?auto_37208 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37208 )
      ( MAKE-5PILE ?auto_37204 ?auto_37205 ?auto_37206 ?auto_37207 ?auto_37208 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37210 - BLOCK
      ?auto_37211 - BLOCK
      ?auto_37212 - BLOCK
      ?auto_37213 - BLOCK
      ?auto_37214 - BLOCK
    )
    :vars
    (
      ?auto_37215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37210 ?auto_37211 ) ) ( not ( = ?auto_37210 ?auto_37212 ) ) ( not ( = ?auto_37210 ?auto_37213 ) ) ( not ( = ?auto_37210 ?auto_37214 ) ) ( not ( = ?auto_37211 ?auto_37212 ) ) ( not ( = ?auto_37211 ?auto_37213 ) ) ( not ( = ?auto_37211 ?auto_37214 ) ) ( not ( = ?auto_37212 ?auto_37213 ) ) ( not ( = ?auto_37212 ?auto_37214 ) ) ( not ( = ?auto_37213 ?auto_37214 ) ) ( ON ?auto_37210 ?auto_37215 ) ( not ( = ?auto_37210 ?auto_37215 ) ) ( not ( = ?auto_37211 ?auto_37215 ) ) ( not ( = ?auto_37212 ?auto_37215 ) ) ( not ( = ?auto_37213 ?auto_37215 ) ) ( not ( = ?auto_37214 ?auto_37215 ) ) ( ON ?auto_37211 ?auto_37210 ) ( ON-TABLE ?auto_37215 ) ( ON ?auto_37212 ?auto_37211 ) ( ON ?auto_37213 ?auto_37212 ) ( ON ?auto_37214 ?auto_37213 ) ( CLEAR ?auto_37214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37215 ?auto_37210 ?auto_37211 ?auto_37212 ?auto_37213 )
      ( MAKE-5PILE ?auto_37210 ?auto_37211 ?auto_37212 ?auto_37213 ?auto_37214 ) )
  )

)

