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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6123 - BLOCK
      ?auto_6124 - BLOCK
      ?auto_6125 - BLOCK
    )
    :vars
    (
      ?auto_6126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6126 ?auto_6125 ) ( CLEAR ?auto_6126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6123 ) ( ON ?auto_6124 ?auto_6123 ) ( ON ?auto_6125 ?auto_6124 ) ( not ( = ?auto_6123 ?auto_6124 ) ) ( not ( = ?auto_6123 ?auto_6125 ) ) ( not ( = ?auto_6123 ?auto_6126 ) ) ( not ( = ?auto_6124 ?auto_6125 ) ) ( not ( = ?auto_6124 ?auto_6126 ) ) ( not ( = ?auto_6125 ?auto_6126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6126 ?auto_6125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6128 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6128 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6128 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6129 - BLOCK
    )
    :vars
    (
      ?auto_6130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6129 ?auto_6130 ) ( CLEAR ?auto_6129 ) ( HAND-EMPTY ) ( not ( = ?auto_6129 ?auto_6130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6129 ?auto_6130 )
      ( MAKE-1PILE ?auto_6129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6133 - BLOCK
      ?auto_6134 - BLOCK
    )
    :vars
    (
      ?auto_6135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6135 ?auto_6134 ) ( CLEAR ?auto_6135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6133 ) ( ON ?auto_6134 ?auto_6133 ) ( not ( = ?auto_6133 ?auto_6134 ) ) ( not ( = ?auto_6133 ?auto_6135 ) ) ( not ( = ?auto_6134 ?auto_6135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6135 ?auto_6134 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6136 - BLOCK
      ?auto_6137 - BLOCK
    )
    :vars
    (
      ?auto_6138 - BLOCK
      ?auto_6139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6138 ?auto_6137 ) ( CLEAR ?auto_6138 ) ( ON-TABLE ?auto_6136 ) ( ON ?auto_6137 ?auto_6136 ) ( not ( = ?auto_6136 ?auto_6137 ) ) ( not ( = ?auto_6136 ?auto_6138 ) ) ( not ( = ?auto_6137 ?auto_6138 ) ) ( HOLDING ?auto_6139 ) ( not ( = ?auto_6136 ?auto_6139 ) ) ( not ( = ?auto_6137 ?auto_6139 ) ) ( not ( = ?auto_6138 ?auto_6139 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6139 )
      ( MAKE-2PILE ?auto_6136 ?auto_6137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6140 - BLOCK
      ?auto_6141 - BLOCK
    )
    :vars
    (
      ?auto_6142 - BLOCK
      ?auto_6143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6142 ?auto_6141 ) ( ON-TABLE ?auto_6140 ) ( ON ?auto_6141 ?auto_6140 ) ( not ( = ?auto_6140 ?auto_6141 ) ) ( not ( = ?auto_6140 ?auto_6142 ) ) ( not ( = ?auto_6141 ?auto_6142 ) ) ( not ( = ?auto_6140 ?auto_6143 ) ) ( not ( = ?auto_6141 ?auto_6143 ) ) ( not ( = ?auto_6142 ?auto_6143 ) ) ( ON ?auto_6143 ?auto_6142 ) ( CLEAR ?auto_6143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6140 ?auto_6141 ?auto_6142 )
      ( MAKE-2PILE ?auto_6140 ?auto_6141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6146 - BLOCK
      ?auto_6147 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6147 ) ( CLEAR ?auto_6146 ) ( ON-TABLE ?auto_6146 ) ( not ( = ?auto_6146 ?auto_6147 ) ) )
    :subtasks
    ( ( !STACK ?auto_6147 ?auto_6146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6148 - BLOCK
      ?auto_6149 - BLOCK
    )
    :vars
    (
      ?auto_6150 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6148 ) ( ON-TABLE ?auto_6148 ) ( not ( = ?auto_6148 ?auto_6149 ) ) ( ON ?auto_6149 ?auto_6150 ) ( CLEAR ?auto_6149 ) ( HAND-EMPTY ) ( not ( = ?auto_6148 ?auto_6150 ) ) ( not ( = ?auto_6149 ?auto_6150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6149 ?auto_6150 )
      ( MAKE-2PILE ?auto_6148 ?auto_6149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6151 - BLOCK
      ?auto_6152 - BLOCK
    )
    :vars
    (
      ?auto_6153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6151 ?auto_6152 ) ) ( ON ?auto_6152 ?auto_6153 ) ( CLEAR ?auto_6152 ) ( not ( = ?auto_6151 ?auto_6153 ) ) ( not ( = ?auto_6152 ?auto_6153 ) ) ( HOLDING ?auto_6151 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6151 )
      ( MAKE-2PILE ?auto_6151 ?auto_6152 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6154 - BLOCK
      ?auto_6155 - BLOCK
    )
    :vars
    (
      ?auto_6156 - BLOCK
      ?auto_6157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6154 ?auto_6155 ) ) ( ON ?auto_6155 ?auto_6156 ) ( not ( = ?auto_6154 ?auto_6156 ) ) ( not ( = ?auto_6155 ?auto_6156 ) ) ( ON ?auto_6154 ?auto_6155 ) ( CLEAR ?auto_6154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6157 ) ( ON ?auto_6156 ?auto_6157 ) ( not ( = ?auto_6157 ?auto_6156 ) ) ( not ( = ?auto_6157 ?auto_6155 ) ) ( not ( = ?auto_6157 ?auto_6154 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6157 ?auto_6156 ?auto_6155 )
      ( MAKE-2PILE ?auto_6154 ?auto_6155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6159 - BLOCK
    )
    :vars
    (
      ?auto_6160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6160 ?auto_6159 ) ( CLEAR ?auto_6160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6159 ) ( not ( = ?auto_6159 ?auto_6160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6160 ?auto_6159 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6161 - BLOCK
    )
    :vars
    (
      ?auto_6162 - BLOCK
      ?auto_6163 - BLOCK
      ?auto_6164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6162 ?auto_6161 ) ( CLEAR ?auto_6162 ) ( ON-TABLE ?auto_6161 ) ( not ( = ?auto_6161 ?auto_6162 ) ) ( HOLDING ?auto_6163 ) ( CLEAR ?auto_6164 ) ( not ( = ?auto_6161 ?auto_6163 ) ) ( not ( = ?auto_6161 ?auto_6164 ) ) ( not ( = ?auto_6162 ?auto_6163 ) ) ( not ( = ?auto_6162 ?auto_6164 ) ) ( not ( = ?auto_6163 ?auto_6164 ) ) )
    :subtasks
    ( ( !STACK ?auto_6163 ?auto_6164 )
      ( MAKE-1PILE ?auto_6161 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6165 - BLOCK
    )
    :vars
    (
      ?auto_6167 - BLOCK
      ?auto_6168 - BLOCK
      ?auto_6166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6167 ?auto_6165 ) ( ON-TABLE ?auto_6165 ) ( not ( = ?auto_6165 ?auto_6167 ) ) ( CLEAR ?auto_6168 ) ( not ( = ?auto_6165 ?auto_6166 ) ) ( not ( = ?auto_6165 ?auto_6168 ) ) ( not ( = ?auto_6167 ?auto_6166 ) ) ( not ( = ?auto_6167 ?auto_6168 ) ) ( not ( = ?auto_6166 ?auto_6168 ) ) ( ON ?auto_6166 ?auto_6167 ) ( CLEAR ?auto_6166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6165 ?auto_6167 )
      ( MAKE-1PILE ?auto_6165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6169 - BLOCK
    )
    :vars
    (
      ?auto_6172 - BLOCK
      ?auto_6171 - BLOCK
      ?auto_6170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6172 ?auto_6169 ) ( ON-TABLE ?auto_6169 ) ( not ( = ?auto_6169 ?auto_6172 ) ) ( not ( = ?auto_6169 ?auto_6171 ) ) ( not ( = ?auto_6169 ?auto_6170 ) ) ( not ( = ?auto_6172 ?auto_6171 ) ) ( not ( = ?auto_6172 ?auto_6170 ) ) ( not ( = ?auto_6171 ?auto_6170 ) ) ( ON ?auto_6171 ?auto_6172 ) ( CLEAR ?auto_6171 ) ( HOLDING ?auto_6170 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6170 )
      ( MAKE-1PILE ?auto_6169 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6173 - BLOCK
    )
    :vars
    (
      ?auto_6174 - BLOCK
      ?auto_6176 - BLOCK
      ?auto_6175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6174 ?auto_6173 ) ( ON-TABLE ?auto_6173 ) ( not ( = ?auto_6173 ?auto_6174 ) ) ( not ( = ?auto_6173 ?auto_6176 ) ) ( not ( = ?auto_6173 ?auto_6175 ) ) ( not ( = ?auto_6174 ?auto_6176 ) ) ( not ( = ?auto_6174 ?auto_6175 ) ) ( not ( = ?auto_6176 ?auto_6175 ) ) ( ON ?auto_6176 ?auto_6174 ) ( ON ?auto_6175 ?auto_6176 ) ( CLEAR ?auto_6175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6173 ?auto_6174 ?auto_6176 )
      ( MAKE-1PILE ?auto_6173 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6180 - BLOCK
      ?auto_6181 - BLOCK
      ?auto_6182 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6182 ) ( CLEAR ?auto_6181 ) ( ON-TABLE ?auto_6180 ) ( ON ?auto_6181 ?auto_6180 ) ( not ( = ?auto_6180 ?auto_6181 ) ) ( not ( = ?auto_6180 ?auto_6182 ) ) ( not ( = ?auto_6181 ?auto_6182 ) ) )
    :subtasks
    ( ( !STACK ?auto_6182 ?auto_6181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6183 - BLOCK
      ?auto_6184 - BLOCK
      ?auto_6185 - BLOCK
    )
    :vars
    (
      ?auto_6186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6184 ) ( ON-TABLE ?auto_6183 ) ( ON ?auto_6184 ?auto_6183 ) ( not ( = ?auto_6183 ?auto_6184 ) ) ( not ( = ?auto_6183 ?auto_6185 ) ) ( not ( = ?auto_6184 ?auto_6185 ) ) ( ON ?auto_6185 ?auto_6186 ) ( CLEAR ?auto_6185 ) ( HAND-EMPTY ) ( not ( = ?auto_6183 ?auto_6186 ) ) ( not ( = ?auto_6184 ?auto_6186 ) ) ( not ( = ?auto_6185 ?auto_6186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6185 ?auto_6186 )
      ( MAKE-3PILE ?auto_6183 ?auto_6184 ?auto_6185 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6187 - BLOCK
      ?auto_6188 - BLOCK
      ?auto_6189 - BLOCK
    )
    :vars
    (
      ?auto_6190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6187 ) ( not ( = ?auto_6187 ?auto_6188 ) ) ( not ( = ?auto_6187 ?auto_6189 ) ) ( not ( = ?auto_6188 ?auto_6189 ) ) ( ON ?auto_6189 ?auto_6190 ) ( CLEAR ?auto_6189 ) ( not ( = ?auto_6187 ?auto_6190 ) ) ( not ( = ?auto_6188 ?auto_6190 ) ) ( not ( = ?auto_6189 ?auto_6190 ) ) ( HOLDING ?auto_6188 ) ( CLEAR ?auto_6187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6187 ?auto_6188 )
      ( MAKE-3PILE ?auto_6187 ?auto_6188 ?auto_6189 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6191 - BLOCK
      ?auto_6192 - BLOCK
      ?auto_6193 - BLOCK
    )
    :vars
    (
      ?auto_6194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6191 ) ( not ( = ?auto_6191 ?auto_6192 ) ) ( not ( = ?auto_6191 ?auto_6193 ) ) ( not ( = ?auto_6192 ?auto_6193 ) ) ( ON ?auto_6193 ?auto_6194 ) ( not ( = ?auto_6191 ?auto_6194 ) ) ( not ( = ?auto_6192 ?auto_6194 ) ) ( not ( = ?auto_6193 ?auto_6194 ) ) ( CLEAR ?auto_6191 ) ( ON ?auto_6192 ?auto_6193 ) ( CLEAR ?auto_6192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6194 ?auto_6193 )
      ( MAKE-3PILE ?auto_6191 ?auto_6192 ?auto_6193 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6195 - BLOCK
      ?auto_6196 - BLOCK
      ?auto_6197 - BLOCK
    )
    :vars
    (
      ?auto_6198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6195 ?auto_6196 ) ) ( not ( = ?auto_6195 ?auto_6197 ) ) ( not ( = ?auto_6196 ?auto_6197 ) ) ( ON ?auto_6197 ?auto_6198 ) ( not ( = ?auto_6195 ?auto_6198 ) ) ( not ( = ?auto_6196 ?auto_6198 ) ) ( not ( = ?auto_6197 ?auto_6198 ) ) ( ON ?auto_6196 ?auto_6197 ) ( CLEAR ?auto_6196 ) ( ON-TABLE ?auto_6198 ) ( HOLDING ?auto_6195 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6195 )
      ( MAKE-3PILE ?auto_6195 ?auto_6196 ?auto_6197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6199 - BLOCK
      ?auto_6200 - BLOCK
      ?auto_6201 - BLOCK
    )
    :vars
    (
      ?auto_6202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6199 ?auto_6200 ) ) ( not ( = ?auto_6199 ?auto_6201 ) ) ( not ( = ?auto_6200 ?auto_6201 ) ) ( ON ?auto_6201 ?auto_6202 ) ( not ( = ?auto_6199 ?auto_6202 ) ) ( not ( = ?auto_6200 ?auto_6202 ) ) ( not ( = ?auto_6201 ?auto_6202 ) ) ( ON ?auto_6200 ?auto_6201 ) ( ON-TABLE ?auto_6202 ) ( ON ?auto_6199 ?auto_6200 ) ( CLEAR ?auto_6199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6202 ?auto_6201 ?auto_6200 )
      ( MAKE-3PILE ?auto_6199 ?auto_6200 ?auto_6201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6205 - BLOCK
      ?auto_6206 - BLOCK
    )
    :vars
    (
      ?auto_6207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6207 ?auto_6206 ) ( CLEAR ?auto_6207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6205 ) ( ON ?auto_6206 ?auto_6205 ) ( not ( = ?auto_6205 ?auto_6206 ) ) ( not ( = ?auto_6205 ?auto_6207 ) ) ( not ( = ?auto_6206 ?auto_6207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6207 ?auto_6206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6215 - BLOCK
      ?auto_6216 - BLOCK
    )
    :vars
    (
      ?auto_6217 - BLOCK
      ?auto_6218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6215 ) ( not ( = ?auto_6215 ?auto_6216 ) ) ( not ( = ?auto_6215 ?auto_6217 ) ) ( not ( = ?auto_6216 ?auto_6217 ) ) ( ON ?auto_6217 ?auto_6218 ) ( CLEAR ?auto_6217 ) ( not ( = ?auto_6215 ?auto_6218 ) ) ( not ( = ?auto_6216 ?auto_6218 ) ) ( not ( = ?auto_6217 ?auto_6218 ) ) ( HOLDING ?auto_6216 ) ( CLEAR ?auto_6215 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6215 ?auto_6216 ?auto_6217 )
      ( MAKE-2PILE ?auto_6215 ?auto_6216 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6219 - BLOCK
      ?auto_6220 - BLOCK
    )
    :vars
    (
      ?auto_6221 - BLOCK
      ?auto_6222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6219 ) ( not ( = ?auto_6219 ?auto_6220 ) ) ( not ( = ?auto_6219 ?auto_6221 ) ) ( not ( = ?auto_6220 ?auto_6221 ) ) ( ON ?auto_6221 ?auto_6222 ) ( not ( = ?auto_6219 ?auto_6222 ) ) ( not ( = ?auto_6220 ?auto_6222 ) ) ( not ( = ?auto_6221 ?auto_6222 ) ) ( CLEAR ?auto_6219 ) ( ON ?auto_6220 ?auto_6221 ) ( CLEAR ?auto_6220 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6222 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6222 ?auto_6221 )
      ( MAKE-2PILE ?auto_6219 ?auto_6220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6223 - BLOCK
      ?auto_6224 - BLOCK
    )
    :vars
    (
      ?auto_6226 - BLOCK
      ?auto_6225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6223 ?auto_6224 ) ) ( not ( = ?auto_6223 ?auto_6226 ) ) ( not ( = ?auto_6224 ?auto_6226 ) ) ( ON ?auto_6226 ?auto_6225 ) ( not ( = ?auto_6223 ?auto_6225 ) ) ( not ( = ?auto_6224 ?auto_6225 ) ) ( not ( = ?auto_6226 ?auto_6225 ) ) ( ON ?auto_6224 ?auto_6226 ) ( CLEAR ?auto_6224 ) ( ON-TABLE ?auto_6225 ) ( HOLDING ?auto_6223 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6223 )
      ( MAKE-2PILE ?auto_6223 ?auto_6224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6227 - BLOCK
      ?auto_6228 - BLOCK
    )
    :vars
    (
      ?auto_6229 - BLOCK
      ?auto_6230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6227 ?auto_6228 ) ) ( not ( = ?auto_6227 ?auto_6229 ) ) ( not ( = ?auto_6228 ?auto_6229 ) ) ( ON ?auto_6229 ?auto_6230 ) ( not ( = ?auto_6227 ?auto_6230 ) ) ( not ( = ?auto_6228 ?auto_6230 ) ) ( not ( = ?auto_6229 ?auto_6230 ) ) ( ON ?auto_6228 ?auto_6229 ) ( ON-TABLE ?auto_6230 ) ( ON ?auto_6227 ?auto_6228 ) ( CLEAR ?auto_6227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6230 ?auto_6229 ?auto_6228 )
      ( MAKE-2PILE ?auto_6227 ?auto_6228 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6232 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6232 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6232 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6233 - BLOCK
    )
    :vars
    (
      ?auto_6234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6233 ?auto_6234 ) ( CLEAR ?auto_6233 ) ( HAND-EMPTY ) ( not ( = ?auto_6233 ?auto_6234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6233 ?auto_6234 )
      ( MAKE-1PILE ?auto_6233 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6235 - BLOCK
    )
    :vars
    (
      ?auto_6236 - BLOCK
      ?auto_6237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6235 ?auto_6236 ) ) ( HOLDING ?auto_6235 ) ( CLEAR ?auto_6236 ) ( ON-TABLE ?auto_6237 ) ( ON ?auto_6236 ?auto_6237 ) ( not ( = ?auto_6237 ?auto_6236 ) ) ( not ( = ?auto_6237 ?auto_6235 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6237 ?auto_6236 ?auto_6235 )
      ( MAKE-1PILE ?auto_6235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6238 - BLOCK
    )
    :vars
    (
      ?auto_6239 - BLOCK
      ?auto_6240 - BLOCK
      ?auto_6241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6238 ?auto_6239 ) ) ( CLEAR ?auto_6239 ) ( ON-TABLE ?auto_6240 ) ( ON ?auto_6239 ?auto_6240 ) ( not ( = ?auto_6240 ?auto_6239 ) ) ( not ( = ?auto_6240 ?auto_6238 ) ) ( ON ?auto_6238 ?auto_6241 ) ( CLEAR ?auto_6238 ) ( HAND-EMPTY ) ( not ( = ?auto_6238 ?auto_6241 ) ) ( not ( = ?auto_6239 ?auto_6241 ) ) ( not ( = ?auto_6240 ?auto_6241 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6238 ?auto_6241 )
      ( MAKE-1PILE ?auto_6238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6242 - BLOCK
    )
    :vars
    (
      ?auto_6244 - BLOCK
      ?auto_6243 - BLOCK
      ?auto_6245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6242 ?auto_6244 ) ) ( ON-TABLE ?auto_6243 ) ( not ( = ?auto_6243 ?auto_6244 ) ) ( not ( = ?auto_6243 ?auto_6242 ) ) ( ON ?auto_6242 ?auto_6245 ) ( CLEAR ?auto_6242 ) ( not ( = ?auto_6242 ?auto_6245 ) ) ( not ( = ?auto_6244 ?auto_6245 ) ) ( not ( = ?auto_6243 ?auto_6245 ) ) ( HOLDING ?auto_6244 ) ( CLEAR ?auto_6243 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6243 ?auto_6244 )
      ( MAKE-1PILE ?auto_6242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6246 - BLOCK
    )
    :vars
    (
      ?auto_6247 - BLOCK
      ?auto_6248 - BLOCK
      ?auto_6249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6246 ?auto_6247 ) ) ( ON-TABLE ?auto_6248 ) ( not ( = ?auto_6248 ?auto_6247 ) ) ( not ( = ?auto_6248 ?auto_6246 ) ) ( ON ?auto_6246 ?auto_6249 ) ( not ( = ?auto_6246 ?auto_6249 ) ) ( not ( = ?auto_6247 ?auto_6249 ) ) ( not ( = ?auto_6248 ?auto_6249 ) ) ( CLEAR ?auto_6248 ) ( ON ?auto_6247 ?auto_6246 ) ( CLEAR ?auto_6247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6249 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6249 ?auto_6246 )
      ( MAKE-1PILE ?auto_6246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6250 - BLOCK
    )
    :vars
    (
      ?auto_6252 - BLOCK
      ?auto_6251 - BLOCK
      ?auto_6253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6250 ?auto_6252 ) ) ( not ( = ?auto_6251 ?auto_6252 ) ) ( not ( = ?auto_6251 ?auto_6250 ) ) ( ON ?auto_6250 ?auto_6253 ) ( not ( = ?auto_6250 ?auto_6253 ) ) ( not ( = ?auto_6252 ?auto_6253 ) ) ( not ( = ?auto_6251 ?auto_6253 ) ) ( ON ?auto_6252 ?auto_6250 ) ( CLEAR ?auto_6252 ) ( ON-TABLE ?auto_6253 ) ( HOLDING ?auto_6251 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6251 )
      ( MAKE-1PILE ?auto_6250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6254 - BLOCK
    )
    :vars
    (
      ?auto_6255 - BLOCK
      ?auto_6257 - BLOCK
      ?auto_6256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6254 ?auto_6255 ) ) ( not ( = ?auto_6257 ?auto_6255 ) ) ( not ( = ?auto_6257 ?auto_6254 ) ) ( ON ?auto_6254 ?auto_6256 ) ( not ( = ?auto_6254 ?auto_6256 ) ) ( not ( = ?auto_6255 ?auto_6256 ) ) ( not ( = ?auto_6257 ?auto_6256 ) ) ( ON ?auto_6255 ?auto_6254 ) ( ON-TABLE ?auto_6256 ) ( ON ?auto_6257 ?auto_6255 ) ( CLEAR ?auto_6257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6256 ?auto_6254 ?auto_6255 )
      ( MAKE-1PILE ?auto_6254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6259 - BLOCK
    )
    :vars
    (
      ?auto_6260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6260 ?auto_6259 ) ( CLEAR ?auto_6260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6259 ) ( not ( = ?auto_6259 ?auto_6260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6260 ?auto_6259 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6261 - BLOCK
    )
    :vars
    (
      ?auto_6262 - BLOCK
      ?auto_6263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6262 ?auto_6261 ) ( CLEAR ?auto_6262 ) ( ON-TABLE ?auto_6261 ) ( not ( = ?auto_6261 ?auto_6262 ) ) ( HOLDING ?auto_6263 ) ( not ( = ?auto_6261 ?auto_6263 ) ) ( not ( = ?auto_6262 ?auto_6263 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6263 )
      ( MAKE-1PILE ?auto_6261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6264 - BLOCK
    )
    :vars
    (
      ?auto_6266 - BLOCK
      ?auto_6265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6266 ?auto_6264 ) ( ON-TABLE ?auto_6264 ) ( not ( = ?auto_6264 ?auto_6266 ) ) ( not ( = ?auto_6264 ?auto_6265 ) ) ( not ( = ?auto_6266 ?auto_6265 ) ) ( ON ?auto_6265 ?auto_6266 ) ( CLEAR ?auto_6265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6264 ?auto_6266 )
      ( MAKE-1PILE ?auto_6264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6267 - BLOCK
    )
    :vars
    (
      ?auto_6268 - BLOCK
      ?auto_6269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6268 ?auto_6267 ) ( ON-TABLE ?auto_6267 ) ( not ( = ?auto_6267 ?auto_6268 ) ) ( not ( = ?auto_6267 ?auto_6269 ) ) ( not ( = ?auto_6268 ?auto_6269 ) ) ( HOLDING ?auto_6269 ) ( CLEAR ?auto_6268 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6267 ?auto_6268 ?auto_6269 )
      ( MAKE-1PILE ?auto_6267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6270 - BLOCK
    )
    :vars
    (
      ?auto_6272 - BLOCK
      ?auto_6271 - BLOCK
      ?auto_6273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6272 ?auto_6270 ) ( ON-TABLE ?auto_6270 ) ( not ( = ?auto_6270 ?auto_6272 ) ) ( not ( = ?auto_6270 ?auto_6271 ) ) ( not ( = ?auto_6272 ?auto_6271 ) ) ( CLEAR ?auto_6272 ) ( ON ?auto_6271 ?auto_6273 ) ( CLEAR ?auto_6271 ) ( HAND-EMPTY ) ( not ( = ?auto_6270 ?auto_6273 ) ) ( not ( = ?auto_6272 ?auto_6273 ) ) ( not ( = ?auto_6271 ?auto_6273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6271 ?auto_6273 )
      ( MAKE-1PILE ?auto_6270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6282 - BLOCK
    )
    :vars
    (
      ?auto_6283 - BLOCK
      ?auto_6284 - BLOCK
      ?auto_6285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6282 ?auto_6283 ) ) ( not ( = ?auto_6282 ?auto_6284 ) ) ( not ( = ?auto_6283 ?auto_6284 ) ) ( ON ?auto_6284 ?auto_6285 ) ( not ( = ?auto_6282 ?auto_6285 ) ) ( not ( = ?auto_6283 ?auto_6285 ) ) ( not ( = ?auto_6284 ?auto_6285 ) ) ( ON ?auto_6283 ?auto_6284 ) ( CLEAR ?auto_6283 ) ( HOLDING ?auto_6282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6282 ?auto_6283 )
      ( MAKE-1PILE ?auto_6282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6286 - BLOCK
    )
    :vars
    (
      ?auto_6289 - BLOCK
      ?auto_6288 - BLOCK
      ?auto_6287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6286 ?auto_6289 ) ) ( not ( = ?auto_6286 ?auto_6288 ) ) ( not ( = ?auto_6289 ?auto_6288 ) ) ( ON ?auto_6288 ?auto_6287 ) ( not ( = ?auto_6286 ?auto_6287 ) ) ( not ( = ?auto_6289 ?auto_6287 ) ) ( not ( = ?auto_6288 ?auto_6287 ) ) ( ON ?auto_6289 ?auto_6288 ) ( ON ?auto_6286 ?auto_6289 ) ( CLEAR ?auto_6286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6287 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6287 ?auto_6288 ?auto_6289 )
      ( MAKE-1PILE ?auto_6286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6292 - BLOCK
      ?auto_6293 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6293 ) ( CLEAR ?auto_6292 ) ( ON-TABLE ?auto_6292 ) ( not ( = ?auto_6292 ?auto_6293 ) ) )
    :subtasks
    ( ( !STACK ?auto_6293 ?auto_6292 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6294 - BLOCK
      ?auto_6295 - BLOCK
    )
    :vars
    (
      ?auto_6296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6294 ) ( ON-TABLE ?auto_6294 ) ( not ( = ?auto_6294 ?auto_6295 ) ) ( ON ?auto_6295 ?auto_6296 ) ( CLEAR ?auto_6295 ) ( HAND-EMPTY ) ( not ( = ?auto_6294 ?auto_6296 ) ) ( not ( = ?auto_6295 ?auto_6296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6295 ?auto_6296 )
      ( MAKE-2PILE ?auto_6294 ?auto_6295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6297 - BLOCK
      ?auto_6298 - BLOCK
    )
    :vars
    (
      ?auto_6299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6297 ?auto_6298 ) ) ( ON ?auto_6298 ?auto_6299 ) ( CLEAR ?auto_6298 ) ( not ( = ?auto_6297 ?auto_6299 ) ) ( not ( = ?auto_6298 ?auto_6299 ) ) ( HOLDING ?auto_6297 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6297 )
      ( MAKE-2PILE ?auto_6297 ?auto_6298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6300 - BLOCK
      ?auto_6301 - BLOCK
    )
    :vars
    (
      ?auto_6302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6300 ?auto_6301 ) ) ( ON ?auto_6301 ?auto_6302 ) ( not ( = ?auto_6300 ?auto_6302 ) ) ( not ( = ?auto_6301 ?auto_6302 ) ) ( ON ?auto_6300 ?auto_6301 ) ( CLEAR ?auto_6300 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6302 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6302 ?auto_6301 )
      ( MAKE-2PILE ?auto_6300 ?auto_6301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6303 - BLOCK
      ?auto_6304 - BLOCK
    )
    :vars
    (
      ?auto_6305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6303 ?auto_6304 ) ) ( ON ?auto_6304 ?auto_6305 ) ( not ( = ?auto_6303 ?auto_6305 ) ) ( not ( = ?auto_6304 ?auto_6305 ) ) ( ON-TABLE ?auto_6305 ) ( HOLDING ?auto_6303 ) ( CLEAR ?auto_6304 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6305 ?auto_6304 ?auto_6303 )
      ( MAKE-2PILE ?auto_6303 ?auto_6304 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6306 - BLOCK
      ?auto_6307 - BLOCK
    )
    :vars
    (
      ?auto_6308 - BLOCK
      ?auto_6309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6306 ?auto_6307 ) ) ( ON ?auto_6307 ?auto_6308 ) ( not ( = ?auto_6306 ?auto_6308 ) ) ( not ( = ?auto_6307 ?auto_6308 ) ) ( ON-TABLE ?auto_6308 ) ( CLEAR ?auto_6307 ) ( ON ?auto_6306 ?auto_6309 ) ( CLEAR ?auto_6306 ) ( HAND-EMPTY ) ( not ( = ?auto_6306 ?auto_6309 ) ) ( not ( = ?auto_6307 ?auto_6309 ) ) ( not ( = ?auto_6308 ?auto_6309 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6306 ?auto_6309 )
      ( MAKE-2PILE ?auto_6306 ?auto_6307 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6310 - BLOCK
      ?auto_6311 - BLOCK
    )
    :vars
    (
      ?auto_6313 - BLOCK
      ?auto_6312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6310 ?auto_6311 ) ) ( not ( = ?auto_6310 ?auto_6313 ) ) ( not ( = ?auto_6311 ?auto_6313 ) ) ( ON-TABLE ?auto_6313 ) ( ON ?auto_6310 ?auto_6312 ) ( CLEAR ?auto_6310 ) ( not ( = ?auto_6310 ?auto_6312 ) ) ( not ( = ?auto_6311 ?auto_6312 ) ) ( not ( = ?auto_6313 ?auto_6312 ) ) ( HOLDING ?auto_6311 ) ( CLEAR ?auto_6313 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6313 ?auto_6311 )
      ( MAKE-2PILE ?auto_6310 ?auto_6311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6314 - BLOCK
      ?auto_6315 - BLOCK
    )
    :vars
    (
      ?auto_6317 - BLOCK
      ?auto_6316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6314 ?auto_6315 ) ) ( not ( = ?auto_6314 ?auto_6317 ) ) ( not ( = ?auto_6315 ?auto_6317 ) ) ( ON-TABLE ?auto_6317 ) ( ON ?auto_6314 ?auto_6316 ) ( not ( = ?auto_6314 ?auto_6316 ) ) ( not ( = ?auto_6315 ?auto_6316 ) ) ( not ( = ?auto_6317 ?auto_6316 ) ) ( CLEAR ?auto_6317 ) ( ON ?auto_6315 ?auto_6314 ) ( CLEAR ?auto_6315 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6316 ?auto_6314 )
      ( MAKE-2PILE ?auto_6314 ?auto_6315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6318 - BLOCK
      ?auto_6319 - BLOCK
    )
    :vars
    (
      ?auto_6320 - BLOCK
      ?auto_6321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6318 ?auto_6319 ) ) ( not ( = ?auto_6318 ?auto_6320 ) ) ( not ( = ?auto_6319 ?auto_6320 ) ) ( ON ?auto_6318 ?auto_6321 ) ( not ( = ?auto_6318 ?auto_6321 ) ) ( not ( = ?auto_6319 ?auto_6321 ) ) ( not ( = ?auto_6320 ?auto_6321 ) ) ( ON ?auto_6319 ?auto_6318 ) ( CLEAR ?auto_6319 ) ( ON-TABLE ?auto_6321 ) ( HOLDING ?auto_6320 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6320 )
      ( MAKE-2PILE ?auto_6318 ?auto_6319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6322 - BLOCK
      ?auto_6323 - BLOCK
    )
    :vars
    (
      ?auto_6324 - BLOCK
      ?auto_6325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6322 ?auto_6323 ) ) ( not ( = ?auto_6322 ?auto_6324 ) ) ( not ( = ?auto_6323 ?auto_6324 ) ) ( ON ?auto_6322 ?auto_6325 ) ( not ( = ?auto_6322 ?auto_6325 ) ) ( not ( = ?auto_6323 ?auto_6325 ) ) ( not ( = ?auto_6324 ?auto_6325 ) ) ( ON ?auto_6323 ?auto_6322 ) ( ON-TABLE ?auto_6325 ) ( ON ?auto_6324 ?auto_6323 ) ( CLEAR ?auto_6324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6325 ?auto_6322 ?auto_6323 )
      ( MAKE-2PILE ?auto_6322 ?auto_6323 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6329 - BLOCK
      ?auto_6330 - BLOCK
      ?auto_6331 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6331 ) ( CLEAR ?auto_6330 ) ( ON-TABLE ?auto_6329 ) ( ON ?auto_6330 ?auto_6329 ) ( not ( = ?auto_6329 ?auto_6330 ) ) ( not ( = ?auto_6329 ?auto_6331 ) ) ( not ( = ?auto_6330 ?auto_6331 ) ) )
    :subtasks
    ( ( !STACK ?auto_6331 ?auto_6330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6332 - BLOCK
      ?auto_6333 - BLOCK
      ?auto_6334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6333 ) ( ON-TABLE ?auto_6332 ) ( ON ?auto_6333 ?auto_6332 ) ( not ( = ?auto_6332 ?auto_6333 ) ) ( not ( = ?auto_6332 ?auto_6334 ) ) ( not ( = ?auto_6333 ?auto_6334 ) ) ( ON-TABLE ?auto_6334 ) ( CLEAR ?auto_6334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_6334 )
      ( MAKE-3PILE ?auto_6332 ?auto_6333 ?auto_6334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6335 - BLOCK
      ?auto_6336 - BLOCK
      ?auto_6337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6335 ) ( not ( = ?auto_6335 ?auto_6336 ) ) ( not ( = ?auto_6335 ?auto_6337 ) ) ( not ( = ?auto_6336 ?auto_6337 ) ) ( ON-TABLE ?auto_6337 ) ( CLEAR ?auto_6337 ) ( HOLDING ?auto_6336 ) ( CLEAR ?auto_6335 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6335 ?auto_6336 )
      ( MAKE-3PILE ?auto_6335 ?auto_6336 ?auto_6337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6338 - BLOCK
      ?auto_6339 - BLOCK
      ?auto_6340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6338 ) ( not ( = ?auto_6338 ?auto_6339 ) ) ( not ( = ?auto_6338 ?auto_6340 ) ) ( not ( = ?auto_6339 ?auto_6340 ) ) ( ON-TABLE ?auto_6340 ) ( CLEAR ?auto_6338 ) ( ON ?auto_6339 ?auto_6340 ) ( CLEAR ?auto_6339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6340 )
      ( MAKE-3PILE ?auto_6338 ?auto_6339 ?auto_6340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6341 - BLOCK
      ?auto_6342 - BLOCK
      ?auto_6343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6341 ?auto_6342 ) ) ( not ( = ?auto_6341 ?auto_6343 ) ) ( not ( = ?auto_6342 ?auto_6343 ) ) ( ON-TABLE ?auto_6343 ) ( ON ?auto_6342 ?auto_6343 ) ( CLEAR ?auto_6342 ) ( HOLDING ?auto_6341 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6341 )
      ( MAKE-3PILE ?auto_6341 ?auto_6342 ?auto_6343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6344 - BLOCK
      ?auto_6345 - BLOCK
      ?auto_6346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6344 ?auto_6345 ) ) ( not ( = ?auto_6344 ?auto_6346 ) ) ( not ( = ?auto_6345 ?auto_6346 ) ) ( ON-TABLE ?auto_6346 ) ( ON ?auto_6345 ?auto_6346 ) ( ON ?auto_6344 ?auto_6345 ) ( CLEAR ?auto_6344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6346 ?auto_6345 )
      ( MAKE-3PILE ?auto_6344 ?auto_6345 ?auto_6346 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6347 - BLOCK
      ?auto_6348 - BLOCK
      ?auto_6349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6347 ?auto_6348 ) ) ( not ( = ?auto_6347 ?auto_6349 ) ) ( not ( = ?auto_6348 ?auto_6349 ) ) ( ON-TABLE ?auto_6349 ) ( ON ?auto_6348 ?auto_6349 ) ( HOLDING ?auto_6347 ) ( CLEAR ?auto_6348 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6349 ?auto_6348 ?auto_6347 )
      ( MAKE-3PILE ?auto_6347 ?auto_6348 ?auto_6349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6350 - BLOCK
      ?auto_6351 - BLOCK
      ?auto_6352 - BLOCK
    )
    :vars
    (
      ?auto_6353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6350 ?auto_6351 ) ) ( not ( = ?auto_6350 ?auto_6352 ) ) ( not ( = ?auto_6351 ?auto_6352 ) ) ( ON-TABLE ?auto_6352 ) ( ON ?auto_6351 ?auto_6352 ) ( CLEAR ?auto_6351 ) ( ON ?auto_6350 ?auto_6353 ) ( CLEAR ?auto_6350 ) ( HAND-EMPTY ) ( not ( = ?auto_6350 ?auto_6353 ) ) ( not ( = ?auto_6351 ?auto_6353 ) ) ( not ( = ?auto_6352 ?auto_6353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6350 ?auto_6353 )
      ( MAKE-3PILE ?auto_6350 ?auto_6351 ?auto_6352 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6354 - BLOCK
      ?auto_6355 - BLOCK
      ?auto_6356 - BLOCK
    )
    :vars
    (
      ?auto_6357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6354 ?auto_6355 ) ) ( not ( = ?auto_6354 ?auto_6356 ) ) ( not ( = ?auto_6355 ?auto_6356 ) ) ( ON-TABLE ?auto_6356 ) ( ON ?auto_6354 ?auto_6357 ) ( CLEAR ?auto_6354 ) ( not ( = ?auto_6354 ?auto_6357 ) ) ( not ( = ?auto_6355 ?auto_6357 ) ) ( not ( = ?auto_6356 ?auto_6357 ) ) ( HOLDING ?auto_6355 ) ( CLEAR ?auto_6356 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6356 ?auto_6355 )
      ( MAKE-3PILE ?auto_6354 ?auto_6355 ?auto_6356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6358 - BLOCK
      ?auto_6359 - BLOCK
      ?auto_6360 - BLOCK
    )
    :vars
    (
      ?auto_6361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6358 ?auto_6359 ) ) ( not ( = ?auto_6358 ?auto_6360 ) ) ( not ( = ?auto_6359 ?auto_6360 ) ) ( ON-TABLE ?auto_6360 ) ( ON ?auto_6358 ?auto_6361 ) ( not ( = ?auto_6358 ?auto_6361 ) ) ( not ( = ?auto_6359 ?auto_6361 ) ) ( not ( = ?auto_6360 ?auto_6361 ) ) ( CLEAR ?auto_6360 ) ( ON ?auto_6359 ?auto_6358 ) ( CLEAR ?auto_6359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6361 ?auto_6358 )
      ( MAKE-3PILE ?auto_6358 ?auto_6359 ?auto_6360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6362 - BLOCK
      ?auto_6363 - BLOCK
      ?auto_6364 - BLOCK
    )
    :vars
    (
      ?auto_6365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6362 ?auto_6363 ) ) ( not ( = ?auto_6362 ?auto_6364 ) ) ( not ( = ?auto_6363 ?auto_6364 ) ) ( ON ?auto_6362 ?auto_6365 ) ( not ( = ?auto_6362 ?auto_6365 ) ) ( not ( = ?auto_6363 ?auto_6365 ) ) ( not ( = ?auto_6364 ?auto_6365 ) ) ( ON ?auto_6363 ?auto_6362 ) ( CLEAR ?auto_6363 ) ( ON-TABLE ?auto_6365 ) ( HOLDING ?auto_6364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6364 )
      ( MAKE-3PILE ?auto_6362 ?auto_6363 ?auto_6364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6366 - BLOCK
      ?auto_6367 - BLOCK
      ?auto_6368 - BLOCK
    )
    :vars
    (
      ?auto_6369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6366 ?auto_6367 ) ) ( not ( = ?auto_6366 ?auto_6368 ) ) ( not ( = ?auto_6367 ?auto_6368 ) ) ( ON ?auto_6366 ?auto_6369 ) ( not ( = ?auto_6366 ?auto_6369 ) ) ( not ( = ?auto_6367 ?auto_6369 ) ) ( not ( = ?auto_6368 ?auto_6369 ) ) ( ON ?auto_6367 ?auto_6366 ) ( ON-TABLE ?auto_6369 ) ( ON ?auto_6368 ?auto_6367 ) ( CLEAR ?auto_6368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6369 ?auto_6366 ?auto_6367 )
      ( MAKE-3PILE ?auto_6366 ?auto_6367 ?auto_6368 ) )
  )

)

