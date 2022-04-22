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
      ?auto_5123 - BLOCK
      ?auto_5124 - BLOCK
      ?auto_5125 - BLOCK
    )
    :vars
    (
      ?auto_5126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5126 ?auto_5125 ) ( CLEAR ?auto_5126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5123 ) ( ON ?auto_5124 ?auto_5123 ) ( ON ?auto_5125 ?auto_5124 ) ( not ( = ?auto_5123 ?auto_5124 ) ) ( not ( = ?auto_5123 ?auto_5125 ) ) ( not ( = ?auto_5123 ?auto_5126 ) ) ( not ( = ?auto_5124 ?auto_5125 ) ) ( not ( = ?auto_5124 ?auto_5126 ) ) ( not ( = ?auto_5125 ?auto_5126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5126 ?auto_5125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5128 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5128 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5128 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5129 - BLOCK
    )
    :vars
    (
      ?auto_5130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5129 ?auto_5130 ) ( CLEAR ?auto_5129 ) ( HAND-EMPTY ) ( not ( = ?auto_5129 ?auto_5130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5129 ?auto_5130 )
      ( MAKE-1PILE ?auto_5129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5133 - BLOCK
      ?auto_5134 - BLOCK
    )
    :vars
    (
      ?auto_5135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5135 ?auto_5134 ) ( CLEAR ?auto_5135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5133 ) ( ON ?auto_5134 ?auto_5133 ) ( not ( = ?auto_5133 ?auto_5134 ) ) ( not ( = ?auto_5133 ?auto_5135 ) ) ( not ( = ?auto_5134 ?auto_5135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5135 ?auto_5134 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5136 - BLOCK
      ?auto_5137 - BLOCK
    )
    :vars
    (
      ?auto_5138 - BLOCK
      ?auto_5139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5138 ?auto_5137 ) ( CLEAR ?auto_5138 ) ( ON-TABLE ?auto_5136 ) ( ON ?auto_5137 ?auto_5136 ) ( not ( = ?auto_5136 ?auto_5137 ) ) ( not ( = ?auto_5136 ?auto_5138 ) ) ( not ( = ?auto_5137 ?auto_5138 ) ) ( HOLDING ?auto_5139 ) ( not ( = ?auto_5136 ?auto_5139 ) ) ( not ( = ?auto_5137 ?auto_5139 ) ) ( not ( = ?auto_5138 ?auto_5139 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5139 )
      ( MAKE-2PILE ?auto_5136 ?auto_5137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5140 - BLOCK
      ?auto_5141 - BLOCK
    )
    :vars
    (
      ?auto_5142 - BLOCK
      ?auto_5143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5142 ?auto_5141 ) ( ON-TABLE ?auto_5140 ) ( ON ?auto_5141 ?auto_5140 ) ( not ( = ?auto_5140 ?auto_5141 ) ) ( not ( = ?auto_5140 ?auto_5142 ) ) ( not ( = ?auto_5141 ?auto_5142 ) ) ( not ( = ?auto_5140 ?auto_5143 ) ) ( not ( = ?auto_5141 ?auto_5143 ) ) ( not ( = ?auto_5142 ?auto_5143 ) ) ( ON ?auto_5143 ?auto_5142 ) ( CLEAR ?auto_5143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5140 ?auto_5141 ?auto_5142 )
      ( MAKE-2PILE ?auto_5140 ?auto_5141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5146 - BLOCK
      ?auto_5147 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5147 ) ( CLEAR ?auto_5146 ) ( ON-TABLE ?auto_5146 ) ( not ( = ?auto_5146 ?auto_5147 ) ) )
    :subtasks
    ( ( !STACK ?auto_5147 ?auto_5146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5148 - BLOCK
      ?auto_5149 - BLOCK
    )
    :vars
    (
      ?auto_5150 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5148 ) ( ON-TABLE ?auto_5148 ) ( not ( = ?auto_5148 ?auto_5149 ) ) ( ON ?auto_5149 ?auto_5150 ) ( CLEAR ?auto_5149 ) ( HAND-EMPTY ) ( not ( = ?auto_5148 ?auto_5150 ) ) ( not ( = ?auto_5149 ?auto_5150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5149 ?auto_5150 )
      ( MAKE-2PILE ?auto_5148 ?auto_5149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5151 - BLOCK
      ?auto_5152 - BLOCK
    )
    :vars
    (
      ?auto_5153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5151 ?auto_5152 ) ) ( ON ?auto_5152 ?auto_5153 ) ( CLEAR ?auto_5152 ) ( not ( = ?auto_5151 ?auto_5153 ) ) ( not ( = ?auto_5152 ?auto_5153 ) ) ( HOLDING ?auto_5151 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5151 )
      ( MAKE-2PILE ?auto_5151 ?auto_5152 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5154 - BLOCK
      ?auto_5155 - BLOCK
    )
    :vars
    (
      ?auto_5156 - BLOCK
      ?auto_5157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5154 ?auto_5155 ) ) ( ON ?auto_5155 ?auto_5156 ) ( not ( = ?auto_5154 ?auto_5156 ) ) ( not ( = ?auto_5155 ?auto_5156 ) ) ( ON ?auto_5154 ?auto_5155 ) ( CLEAR ?auto_5154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5157 ) ( ON ?auto_5156 ?auto_5157 ) ( not ( = ?auto_5157 ?auto_5156 ) ) ( not ( = ?auto_5157 ?auto_5155 ) ) ( not ( = ?auto_5157 ?auto_5154 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5157 ?auto_5156 ?auto_5155 )
      ( MAKE-2PILE ?auto_5154 ?auto_5155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5159 - BLOCK
    )
    :vars
    (
      ?auto_5160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5160 ?auto_5159 ) ( CLEAR ?auto_5160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5159 ) ( not ( = ?auto_5159 ?auto_5160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5160 ?auto_5159 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5161 - BLOCK
    )
    :vars
    (
      ?auto_5162 - BLOCK
      ?auto_5163 - BLOCK
      ?auto_5164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5162 ?auto_5161 ) ( CLEAR ?auto_5162 ) ( ON-TABLE ?auto_5161 ) ( not ( = ?auto_5161 ?auto_5162 ) ) ( HOLDING ?auto_5163 ) ( CLEAR ?auto_5164 ) ( not ( = ?auto_5161 ?auto_5163 ) ) ( not ( = ?auto_5161 ?auto_5164 ) ) ( not ( = ?auto_5162 ?auto_5163 ) ) ( not ( = ?auto_5162 ?auto_5164 ) ) ( not ( = ?auto_5163 ?auto_5164 ) ) )
    :subtasks
    ( ( !STACK ?auto_5163 ?auto_5164 )
      ( MAKE-1PILE ?auto_5161 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5165 - BLOCK
    )
    :vars
    (
      ?auto_5166 - BLOCK
      ?auto_5168 - BLOCK
      ?auto_5167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5166 ?auto_5165 ) ( ON-TABLE ?auto_5165 ) ( not ( = ?auto_5165 ?auto_5166 ) ) ( CLEAR ?auto_5168 ) ( not ( = ?auto_5165 ?auto_5167 ) ) ( not ( = ?auto_5165 ?auto_5168 ) ) ( not ( = ?auto_5166 ?auto_5167 ) ) ( not ( = ?auto_5166 ?auto_5168 ) ) ( not ( = ?auto_5167 ?auto_5168 ) ) ( ON ?auto_5167 ?auto_5166 ) ( CLEAR ?auto_5167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5165 ?auto_5166 )
      ( MAKE-1PILE ?auto_5165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5169 - BLOCK
    )
    :vars
    (
      ?auto_5170 - BLOCK
      ?auto_5172 - BLOCK
      ?auto_5171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5170 ?auto_5169 ) ( ON-TABLE ?auto_5169 ) ( not ( = ?auto_5169 ?auto_5170 ) ) ( not ( = ?auto_5169 ?auto_5172 ) ) ( not ( = ?auto_5169 ?auto_5171 ) ) ( not ( = ?auto_5170 ?auto_5172 ) ) ( not ( = ?auto_5170 ?auto_5171 ) ) ( not ( = ?auto_5172 ?auto_5171 ) ) ( ON ?auto_5172 ?auto_5170 ) ( CLEAR ?auto_5172 ) ( HOLDING ?auto_5171 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5171 )
      ( MAKE-1PILE ?auto_5169 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5173 - BLOCK
    )
    :vars
    (
      ?auto_5175 - BLOCK
      ?auto_5174 - BLOCK
      ?auto_5176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5175 ?auto_5173 ) ( ON-TABLE ?auto_5173 ) ( not ( = ?auto_5173 ?auto_5175 ) ) ( not ( = ?auto_5173 ?auto_5174 ) ) ( not ( = ?auto_5173 ?auto_5176 ) ) ( not ( = ?auto_5175 ?auto_5174 ) ) ( not ( = ?auto_5175 ?auto_5176 ) ) ( not ( = ?auto_5174 ?auto_5176 ) ) ( ON ?auto_5174 ?auto_5175 ) ( ON ?auto_5176 ?auto_5174 ) ( CLEAR ?auto_5176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5173 ?auto_5175 ?auto_5174 )
      ( MAKE-1PILE ?auto_5173 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5180 - BLOCK
      ?auto_5181 - BLOCK
      ?auto_5182 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5182 ) ( CLEAR ?auto_5181 ) ( ON-TABLE ?auto_5180 ) ( ON ?auto_5181 ?auto_5180 ) ( not ( = ?auto_5180 ?auto_5181 ) ) ( not ( = ?auto_5180 ?auto_5182 ) ) ( not ( = ?auto_5181 ?auto_5182 ) ) )
    :subtasks
    ( ( !STACK ?auto_5182 ?auto_5181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5183 - BLOCK
      ?auto_5184 - BLOCK
      ?auto_5185 - BLOCK
    )
    :vars
    (
      ?auto_5186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5184 ) ( ON-TABLE ?auto_5183 ) ( ON ?auto_5184 ?auto_5183 ) ( not ( = ?auto_5183 ?auto_5184 ) ) ( not ( = ?auto_5183 ?auto_5185 ) ) ( not ( = ?auto_5184 ?auto_5185 ) ) ( ON ?auto_5185 ?auto_5186 ) ( CLEAR ?auto_5185 ) ( HAND-EMPTY ) ( not ( = ?auto_5183 ?auto_5186 ) ) ( not ( = ?auto_5184 ?auto_5186 ) ) ( not ( = ?auto_5185 ?auto_5186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5185 ?auto_5186 )
      ( MAKE-3PILE ?auto_5183 ?auto_5184 ?auto_5185 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5187 - BLOCK
      ?auto_5188 - BLOCK
      ?auto_5189 - BLOCK
    )
    :vars
    (
      ?auto_5190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5187 ) ( not ( = ?auto_5187 ?auto_5188 ) ) ( not ( = ?auto_5187 ?auto_5189 ) ) ( not ( = ?auto_5188 ?auto_5189 ) ) ( ON ?auto_5189 ?auto_5190 ) ( CLEAR ?auto_5189 ) ( not ( = ?auto_5187 ?auto_5190 ) ) ( not ( = ?auto_5188 ?auto_5190 ) ) ( not ( = ?auto_5189 ?auto_5190 ) ) ( HOLDING ?auto_5188 ) ( CLEAR ?auto_5187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5187 ?auto_5188 )
      ( MAKE-3PILE ?auto_5187 ?auto_5188 ?auto_5189 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5191 - BLOCK
      ?auto_5192 - BLOCK
      ?auto_5193 - BLOCK
    )
    :vars
    (
      ?auto_5194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5191 ) ( not ( = ?auto_5191 ?auto_5192 ) ) ( not ( = ?auto_5191 ?auto_5193 ) ) ( not ( = ?auto_5192 ?auto_5193 ) ) ( ON ?auto_5193 ?auto_5194 ) ( not ( = ?auto_5191 ?auto_5194 ) ) ( not ( = ?auto_5192 ?auto_5194 ) ) ( not ( = ?auto_5193 ?auto_5194 ) ) ( CLEAR ?auto_5191 ) ( ON ?auto_5192 ?auto_5193 ) ( CLEAR ?auto_5192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5194 ?auto_5193 )
      ( MAKE-3PILE ?auto_5191 ?auto_5192 ?auto_5193 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5195 - BLOCK
      ?auto_5196 - BLOCK
      ?auto_5197 - BLOCK
    )
    :vars
    (
      ?auto_5198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5195 ?auto_5196 ) ) ( not ( = ?auto_5195 ?auto_5197 ) ) ( not ( = ?auto_5196 ?auto_5197 ) ) ( ON ?auto_5197 ?auto_5198 ) ( not ( = ?auto_5195 ?auto_5198 ) ) ( not ( = ?auto_5196 ?auto_5198 ) ) ( not ( = ?auto_5197 ?auto_5198 ) ) ( ON ?auto_5196 ?auto_5197 ) ( CLEAR ?auto_5196 ) ( ON-TABLE ?auto_5198 ) ( HOLDING ?auto_5195 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5195 )
      ( MAKE-3PILE ?auto_5195 ?auto_5196 ?auto_5197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5199 - BLOCK
      ?auto_5200 - BLOCK
      ?auto_5201 - BLOCK
    )
    :vars
    (
      ?auto_5202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5199 ?auto_5200 ) ) ( not ( = ?auto_5199 ?auto_5201 ) ) ( not ( = ?auto_5200 ?auto_5201 ) ) ( ON ?auto_5201 ?auto_5202 ) ( not ( = ?auto_5199 ?auto_5202 ) ) ( not ( = ?auto_5200 ?auto_5202 ) ) ( not ( = ?auto_5201 ?auto_5202 ) ) ( ON ?auto_5200 ?auto_5201 ) ( ON-TABLE ?auto_5202 ) ( ON ?auto_5199 ?auto_5200 ) ( CLEAR ?auto_5199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5202 ?auto_5201 ?auto_5200 )
      ( MAKE-3PILE ?auto_5199 ?auto_5200 ?auto_5201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5205 - BLOCK
      ?auto_5206 - BLOCK
    )
    :vars
    (
      ?auto_5207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5207 ?auto_5206 ) ( CLEAR ?auto_5207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5205 ) ( ON ?auto_5206 ?auto_5205 ) ( not ( = ?auto_5205 ?auto_5206 ) ) ( not ( = ?auto_5205 ?auto_5207 ) ) ( not ( = ?auto_5206 ?auto_5207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5207 ?auto_5206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5215 - BLOCK
      ?auto_5216 - BLOCK
    )
    :vars
    (
      ?auto_5217 - BLOCK
      ?auto_5218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5215 ) ( not ( = ?auto_5215 ?auto_5216 ) ) ( not ( = ?auto_5215 ?auto_5217 ) ) ( not ( = ?auto_5216 ?auto_5217 ) ) ( ON ?auto_5217 ?auto_5218 ) ( CLEAR ?auto_5217 ) ( not ( = ?auto_5215 ?auto_5218 ) ) ( not ( = ?auto_5216 ?auto_5218 ) ) ( not ( = ?auto_5217 ?auto_5218 ) ) ( HOLDING ?auto_5216 ) ( CLEAR ?auto_5215 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5215 ?auto_5216 ?auto_5217 )
      ( MAKE-2PILE ?auto_5215 ?auto_5216 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5219 - BLOCK
      ?auto_5220 - BLOCK
    )
    :vars
    (
      ?auto_5221 - BLOCK
      ?auto_5222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5219 ) ( not ( = ?auto_5219 ?auto_5220 ) ) ( not ( = ?auto_5219 ?auto_5221 ) ) ( not ( = ?auto_5220 ?auto_5221 ) ) ( ON ?auto_5221 ?auto_5222 ) ( not ( = ?auto_5219 ?auto_5222 ) ) ( not ( = ?auto_5220 ?auto_5222 ) ) ( not ( = ?auto_5221 ?auto_5222 ) ) ( CLEAR ?auto_5219 ) ( ON ?auto_5220 ?auto_5221 ) ( CLEAR ?auto_5220 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5222 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5222 ?auto_5221 )
      ( MAKE-2PILE ?auto_5219 ?auto_5220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5223 - BLOCK
      ?auto_5224 - BLOCK
    )
    :vars
    (
      ?auto_5226 - BLOCK
      ?auto_5225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5223 ?auto_5224 ) ) ( not ( = ?auto_5223 ?auto_5226 ) ) ( not ( = ?auto_5224 ?auto_5226 ) ) ( ON ?auto_5226 ?auto_5225 ) ( not ( = ?auto_5223 ?auto_5225 ) ) ( not ( = ?auto_5224 ?auto_5225 ) ) ( not ( = ?auto_5226 ?auto_5225 ) ) ( ON ?auto_5224 ?auto_5226 ) ( CLEAR ?auto_5224 ) ( ON-TABLE ?auto_5225 ) ( HOLDING ?auto_5223 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5223 )
      ( MAKE-2PILE ?auto_5223 ?auto_5224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5227 - BLOCK
      ?auto_5228 - BLOCK
    )
    :vars
    (
      ?auto_5229 - BLOCK
      ?auto_5230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5227 ?auto_5228 ) ) ( not ( = ?auto_5227 ?auto_5229 ) ) ( not ( = ?auto_5228 ?auto_5229 ) ) ( ON ?auto_5229 ?auto_5230 ) ( not ( = ?auto_5227 ?auto_5230 ) ) ( not ( = ?auto_5228 ?auto_5230 ) ) ( not ( = ?auto_5229 ?auto_5230 ) ) ( ON ?auto_5228 ?auto_5229 ) ( ON-TABLE ?auto_5230 ) ( ON ?auto_5227 ?auto_5228 ) ( CLEAR ?auto_5227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5230 ?auto_5229 ?auto_5228 )
      ( MAKE-2PILE ?auto_5227 ?auto_5228 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5232 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5232 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5232 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5233 - BLOCK
    )
    :vars
    (
      ?auto_5234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5233 ?auto_5234 ) ( CLEAR ?auto_5233 ) ( HAND-EMPTY ) ( not ( = ?auto_5233 ?auto_5234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5233 ?auto_5234 )
      ( MAKE-1PILE ?auto_5233 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5235 - BLOCK
    )
    :vars
    (
      ?auto_5236 - BLOCK
      ?auto_5237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5235 ?auto_5236 ) ) ( HOLDING ?auto_5235 ) ( CLEAR ?auto_5236 ) ( ON-TABLE ?auto_5237 ) ( ON ?auto_5236 ?auto_5237 ) ( not ( = ?auto_5237 ?auto_5236 ) ) ( not ( = ?auto_5237 ?auto_5235 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5237 ?auto_5236 ?auto_5235 )
      ( MAKE-1PILE ?auto_5235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5238 - BLOCK
    )
    :vars
    (
      ?auto_5240 - BLOCK
      ?auto_5239 - BLOCK
      ?auto_5241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5238 ?auto_5240 ) ) ( CLEAR ?auto_5240 ) ( ON-TABLE ?auto_5239 ) ( ON ?auto_5240 ?auto_5239 ) ( not ( = ?auto_5239 ?auto_5240 ) ) ( not ( = ?auto_5239 ?auto_5238 ) ) ( ON ?auto_5238 ?auto_5241 ) ( CLEAR ?auto_5238 ) ( HAND-EMPTY ) ( not ( = ?auto_5238 ?auto_5241 ) ) ( not ( = ?auto_5240 ?auto_5241 ) ) ( not ( = ?auto_5239 ?auto_5241 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5238 ?auto_5241 )
      ( MAKE-1PILE ?auto_5238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5242 - BLOCK
    )
    :vars
    (
      ?auto_5243 - BLOCK
      ?auto_5245 - BLOCK
      ?auto_5244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5242 ?auto_5243 ) ) ( ON-TABLE ?auto_5245 ) ( not ( = ?auto_5245 ?auto_5243 ) ) ( not ( = ?auto_5245 ?auto_5242 ) ) ( ON ?auto_5242 ?auto_5244 ) ( CLEAR ?auto_5242 ) ( not ( = ?auto_5242 ?auto_5244 ) ) ( not ( = ?auto_5243 ?auto_5244 ) ) ( not ( = ?auto_5245 ?auto_5244 ) ) ( HOLDING ?auto_5243 ) ( CLEAR ?auto_5245 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5245 ?auto_5243 )
      ( MAKE-1PILE ?auto_5242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5246 - BLOCK
    )
    :vars
    (
      ?auto_5248 - BLOCK
      ?auto_5247 - BLOCK
      ?auto_5249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5246 ?auto_5248 ) ) ( ON-TABLE ?auto_5247 ) ( not ( = ?auto_5247 ?auto_5248 ) ) ( not ( = ?auto_5247 ?auto_5246 ) ) ( ON ?auto_5246 ?auto_5249 ) ( not ( = ?auto_5246 ?auto_5249 ) ) ( not ( = ?auto_5248 ?auto_5249 ) ) ( not ( = ?auto_5247 ?auto_5249 ) ) ( CLEAR ?auto_5247 ) ( ON ?auto_5248 ?auto_5246 ) ( CLEAR ?auto_5248 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5249 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5249 ?auto_5246 )
      ( MAKE-1PILE ?auto_5246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5250 - BLOCK
    )
    :vars
    (
      ?auto_5252 - BLOCK
      ?auto_5251 - BLOCK
      ?auto_5253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5250 ?auto_5252 ) ) ( not ( = ?auto_5251 ?auto_5252 ) ) ( not ( = ?auto_5251 ?auto_5250 ) ) ( ON ?auto_5250 ?auto_5253 ) ( not ( = ?auto_5250 ?auto_5253 ) ) ( not ( = ?auto_5252 ?auto_5253 ) ) ( not ( = ?auto_5251 ?auto_5253 ) ) ( ON ?auto_5252 ?auto_5250 ) ( CLEAR ?auto_5252 ) ( ON-TABLE ?auto_5253 ) ( HOLDING ?auto_5251 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5251 )
      ( MAKE-1PILE ?auto_5250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5254 - BLOCK
    )
    :vars
    (
      ?auto_5256 - BLOCK
      ?auto_5257 - BLOCK
      ?auto_5255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5254 ?auto_5256 ) ) ( not ( = ?auto_5257 ?auto_5256 ) ) ( not ( = ?auto_5257 ?auto_5254 ) ) ( ON ?auto_5254 ?auto_5255 ) ( not ( = ?auto_5254 ?auto_5255 ) ) ( not ( = ?auto_5256 ?auto_5255 ) ) ( not ( = ?auto_5257 ?auto_5255 ) ) ( ON ?auto_5256 ?auto_5254 ) ( ON-TABLE ?auto_5255 ) ( ON ?auto_5257 ?auto_5256 ) ( CLEAR ?auto_5257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5255 ?auto_5254 ?auto_5256 )
      ( MAKE-1PILE ?auto_5254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5259 - BLOCK
    )
    :vars
    (
      ?auto_5260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5260 ?auto_5259 ) ( CLEAR ?auto_5260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5259 ) ( not ( = ?auto_5259 ?auto_5260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5260 ?auto_5259 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5261 - BLOCK
    )
    :vars
    (
      ?auto_5262 - BLOCK
      ?auto_5263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5262 ?auto_5261 ) ( CLEAR ?auto_5262 ) ( ON-TABLE ?auto_5261 ) ( not ( = ?auto_5261 ?auto_5262 ) ) ( HOLDING ?auto_5263 ) ( not ( = ?auto_5261 ?auto_5263 ) ) ( not ( = ?auto_5262 ?auto_5263 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5263 )
      ( MAKE-1PILE ?auto_5261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5264 - BLOCK
    )
    :vars
    (
      ?auto_5266 - BLOCK
      ?auto_5265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5266 ?auto_5264 ) ( ON-TABLE ?auto_5264 ) ( not ( = ?auto_5264 ?auto_5266 ) ) ( not ( = ?auto_5264 ?auto_5265 ) ) ( not ( = ?auto_5266 ?auto_5265 ) ) ( ON ?auto_5265 ?auto_5266 ) ( CLEAR ?auto_5265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5264 ?auto_5266 )
      ( MAKE-1PILE ?auto_5264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5267 - BLOCK
    )
    :vars
    (
      ?auto_5269 - BLOCK
      ?auto_5268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5269 ?auto_5267 ) ( ON-TABLE ?auto_5267 ) ( not ( = ?auto_5267 ?auto_5269 ) ) ( not ( = ?auto_5267 ?auto_5268 ) ) ( not ( = ?auto_5269 ?auto_5268 ) ) ( HOLDING ?auto_5268 ) ( CLEAR ?auto_5269 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5267 ?auto_5269 ?auto_5268 )
      ( MAKE-1PILE ?auto_5267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5270 - BLOCK
    )
    :vars
    (
      ?auto_5272 - BLOCK
      ?auto_5271 - BLOCK
      ?auto_5273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5272 ?auto_5270 ) ( ON-TABLE ?auto_5270 ) ( not ( = ?auto_5270 ?auto_5272 ) ) ( not ( = ?auto_5270 ?auto_5271 ) ) ( not ( = ?auto_5272 ?auto_5271 ) ) ( CLEAR ?auto_5272 ) ( ON ?auto_5271 ?auto_5273 ) ( CLEAR ?auto_5271 ) ( HAND-EMPTY ) ( not ( = ?auto_5270 ?auto_5273 ) ) ( not ( = ?auto_5272 ?auto_5273 ) ) ( not ( = ?auto_5271 ?auto_5273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5271 ?auto_5273 )
      ( MAKE-1PILE ?auto_5270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5282 - BLOCK
    )
    :vars
    (
      ?auto_5283 - BLOCK
      ?auto_5285 - BLOCK
      ?auto_5284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5282 ?auto_5283 ) ) ( not ( = ?auto_5282 ?auto_5285 ) ) ( not ( = ?auto_5283 ?auto_5285 ) ) ( ON ?auto_5285 ?auto_5284 ) ( not ( = ?auto_5282 ?auto_5284 ) ) ( not ( = ?auto_5283 ?auto_5284 ) ) ( not ( = ?auto_5285 ?auto_5284 ) ) ( ON ?auto_5283 ?auto_5285 ) ( CLEAR ?auto_5283 ) ( HOLDING ?auto_5282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5282 ?auto_5283 )
      ( MAKE-1PILE ?auto_5282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5286 - BLOCK
    )
    :vars
    (
      ?auto_5287 - BLOCK
      ?auto_5288 - BLOCK
      ?auto_5289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5286 ?auto_5287 ) ) ( not ( = ?auto_5286 ?auto_5288 ) ) ( not ( = ?auto_5287 ?auto_5288 ) ) ( ON ?auto_5288 ?auto_5289 ) ( not ( = ?auto_5286 ?auto_5289 ) ) ( not ( = ?auto_5287 ?auto_5289 ) ) ( not ( = ?auto_5288 ?auto_5289 ) ) ( ON ?auto_5287 ?auto_5288 ) ( ON ?auto_5286 ?auto_5287 ) ( CLEAR ?auto_5286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5289 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5289 ?auto_5288 ?auto_5287 )
      ( MAKE-1PILE ?auto_5286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5292 - BLOCK
      ?auto_5293 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5293 ) ( CLEAR ?auto_5292 ) ( ON-TABLE ?auto_5292 ) ( not ( = ?auto_5292 ?auto_5293 ) ) )
    :subtasks
    ( ( !STACK ?auto_5293 ?auto_5292 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5294 - BLOCK
      ?auto_5295 - BLOCK
    )
    :vars
    (
      ?auto_5296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5294 ) ( ON-TABLE ?auto_5294 ) ( not ( = ?auto_5294 ?auto_5295 ) ) ( ON ?auto_5295 ?auto_5296 ) ( CLEAR ?auto_5295 ) ( HAND-EMPTY ) ( not ( = ?auto_5294 ?auto_5296 ) ) ( not ( = ?auto_5295 ?auto_5296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5295 ?auto_5296 )
      ( MAKE-2PILE ?auto_5294 ?auto_5295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5297 - BLOCK
      ?auto_5298 - BLOCK
    )
    :vars
    (
      ?auto_5299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5297 ?auto_5298 ) ) ( ON ?auto_5298 ?auto_5299 ) ( CLEAR ?auto_5298 ) ( not ( = ?auto_5297 ?auto_5299 ) ) ( not ( = ?auto_5298 ?auto_5299 ) ) ( HOLDING ?auto_5297 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5297 )
      ( MAKE-2PILE ?auto_5297 ?auto_5298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5300 - BLOCK
      ?auto_5301 - BLOCK
    )
    :vars
    (
      ?auto_5302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5300 ?auto_5301 ) ) ( ON ?auto_5301 ?auto_5302 ) ( not ( = ?auto_5300 ?auto_5302 ) ) ( not ( = ?auto_5301 ?auto_5302 ) ) ( ON ?auto_5300 ?auto_5301 ) ( CLEAR ?auto_5300 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5302 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5302 ?auto_5301 )
      ( MAKE-2PILE ?auto_5300 ?auto_5301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5303 - BLOCK
      ?auto_5304 - BLOCK
    )
    :vars
    (
      ?auto_5305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5303 ?auto_5304 ) ) ( ON ?auto_5304 ?auto_5305 ) ( not ( = ?auto_5303 ?auto_5305 ) ) ( not ( = ?auto_5304 ?auto_5305 ) ) ( ON-TABLE ?auto_5305 ) ( HOLDING ?auto_5303 ) ( CLEAR ?auto_5304 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5305 ?auto_5304 ?auto_5303 )
      ( MAKE-2PILE ?auto_5303 ?auto_5304 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5306 - BLOCK
      ?auto_5307 - BLOCK
    )
    :vars
    (
      ?auto_5308 - BLOCK
      ?auto_5309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5306 ?auto_5307 ) ) ( ON ?auto_5307 ?auto_5308 ) ( not ( = ?auto_5306 ?auto_5308 ) ) ( not ( = ?auto_5307 ?auto_5308 ) ) ( ON-TABLE ?auto_5308 ) ( CLEAR ?auto_5307 ) ( ON ?auto_5306 ?auto_5309 ) ( CLEAR ?auto_5306 ) ( HAND-EMPTY ) ( not ( = ?auto_5306 ?auto_5309 ) ) ( not ( = ?auto_5307 ?auto_5309 ) ) ( not ( = ?auto_5308 ?auto_5309 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5306 ?auto_5309 )
      ( MAKE-2PILE ?auto_5306 ?auto_5307 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5310 - BLOCK
      ?auto_5311 - BLOCK
    )
    :vars
    (
      ?auto_5312 - BLOCK
      ?auto_5313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5310 ?auto_5311 ) ) ( not ( = ?auto_5310 ?auto_5312 ) ) ( not ( = ?auto_5311 ?auto_5312 ) ) ( ON-TABLE ?auto_5312 ) ( ON ?auto_5310 ?auto_5313 ) ( CLEAR ?auto_5310 ) ( not ( = ?auto_5310 ?auto_5313 ) ) ( not ( = ?auto_5311 ?auto_5313 ) ) ( not ( = ?auto_5312 ?auto_5313 ) ) ( HOLDING ?auto_5311 ) ( CLEAR ?auto_5312 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5312 ?auto_5311 )
      ( MAKE-2PILE ?auto_5310 ?auto_5311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5314 - BLOCK
      ?auto_5315 - BLOCK
    )
    :vars
    (
      ?auto_5317 - BLOCK
      ?auto_5316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5314 ?auto_5315 ) ) ( not ( = ?auto_5314 ?auto_5317 ) ) ( not ( = ?auto_5315 ?auto_5317 ) ) ( ON-TABLE ?auto_5317 ) ( ON ?auto_5314 ?auto_5316 ) ( not ( = ?auto_5314 ?auto_5316 ) ) ( not ( = ?auto_5315 ?auto_5316 ) ) ( not ( = ?auto_5317 ?auto_5316 ) ) ( CLEAR ?auto_5317 ) ( ON ?auto_5315 ?auto_5314 ) ( CLEAR ?auto_5315 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5316 ?auto_5314 )
      ( MAKE-2PILE ?auto_5314 ?auto_5315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5318 - BLOCK
      ?auto_5319 - BLOCK
    )
    :vars
    (
      ?auto_5321 - BLOCK
      ?auto_5320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5318 ?auto_5319 ) ) ( not ( = ?auto_5318 ?auto_5321 ) ) ( not ( = ?auto_5319 ?auto_5321 ) ) ( ON ?auto_5318 ?auto_5320 ) ( not ( = ?auto_5318 ?auto_5320 ) ) ( not ( = ?auto_5319 ?auto_5320 ) ) ( not ( = ?auto_5321 ?auto_5320 ) ) ( ON ?auto_5319 ?auto_5318 ) ( CLEAR ?auto_5319 ) ( ON-TABLE ?auto_5320 ) ( HOLDING ?auto_5321 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5321 )
      ( MAKE-2PILE ?auto_5318 ?auto_5319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5322 - BLOCK
      ?auto_5323 - BLOCK
    )
    :vars
    (
      ?auto_5325 - BLOCK
      ?auto_5324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5322 ?auto_5323 ) ) ( not ( = ?auto_5322 ?auto_5325 ) ) ( not ( = ?auto_5323 ?auto_5325 ) ) ( ON ?auto_5322 ?auto_5324 ) ( not ( = ?auto_5322 ?auto_5324 ) ) ( not ( = ?auto_5323 ?auto_5324 ) ) ( not ( = ?auto_5325 ?auto_5324 ) ) ( ON ?auto_5323 ?auto_5322 ) ( ON-TABLE ?auto_5324 ) ( ON ?auto_5325 ?auto_5323 ) ( CLEAR ?auto_5325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5324 ?auto_5322 ?auto_5323 )
      ( MAKE-2PILE ?auto_5322 ?auto_5323 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5329 - BLOCK
      ?auto_5330 - BLOCK
      ?auto_5331 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5331 ) ( CLEAR ?auto_5330 ) ( ON-TABLE ?auto_5329 ) ( ON ?auto_5330 ?auto_5329 ) ( not ( = ?auto_5329 ?auto_5330 ) ) ( not ( = ?auto_5329 ?auto_5331 ) ) ( not ( = ?auto_5330 ?auto_5331 ) ) )
    :subtasks
    ( ( !STACK ?auto_5331 ?auto_5330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5332 - BLOCK
      ?auto_5333 - BLOCK
      ?auto_5334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5333 ) ( ON-TABLE ?auto_5332 ) ( ON ?auto_5333 ?auto_5332 ) ( not ( = ?auto_5332 ?auto_5333 ) ) ( not ( = ?auto_5332 ?auto_5334 ) ) ( not ( = ?auto_5333 ?auto_5334 ) ) ( ON-TABLE ?auto_5334 ) ( CLEAR ?auto_5334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_5334 )
      ( MAKE-3PILE ?auto_5332 ?auto_5333 ?auto_5334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5335 - BLOCK
      ?auto_5336 - BLOCK
      ?auto_5337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5335 ) ( not ( = ?auto_5335 ?auto_5336 ) ) ( not ( = ?auto_5335 ?auto_5337 ) ) ( not ( = ?auto_5336 ?auto_5337 ) ) ( ON-TABLE ?auto_5337 ) ( CLEAR ?auto_5337 ) ( HOLDING ?auto_5336 ) ( CLEAR ?auto_5335 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5335 ?auto_5336 )
      ( MAKE-3PILE ?auto_5335 ?auto_5336 ?auto_5337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5338 - BLOCK
      ?auto_5339 - BLOCK
      ?auto_5340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5338 ) ( not ( = ?auto_5338 ?auto_5339 ) ) ( not ( = ?auto_5338 ?auto_5340 ) ) ( not ( = ?auto_5339 ?auto_5340 ) ) ( ON-TABLE ?auto_5340 ) ( CLEAR ?auto_5338 ) ( ON ?auto_5339 ?auto_5340 ) ( CLEAR ?auto_5339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5340 )
      ( MAKE-3PILE ?auto_5338 ?auto_5339 ?auto_5340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5341 - BLOCK
      ?auto_5342 - BLOCK
      ?auto_5343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5341 ?auto_5342 ) ) ( not ( = ?auto_5341 ?auto_5343 ) ) ( not ( = ?auto_5342 ?auto_5343 ) ) ( ON-TABLE ?auto_5343 ) ( ON ?auto_5342 ?auto_5343 ) ( CLEAR ?auto_5342 ) ( HOLDING ?auto_5341 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5341 )
      ( MAKE-3PILE ?auto_5341 ?auto_5342 ?auto_5343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5344 - BLOCK
      ?auto_5345 - BLOCK
      ?auto_5346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5344 ?auto_5345 ) ) ( not ( = ?auto_5344 ?auto_5346 ) ) ( not ( = ?auto_5345 ?auto_5346 ) ) ( ON-TABLE ?auto_5346 ) ( ON ?auto_5345 ?auto_5346 ) ( ON ?auto_5344 ?auto_5345 ) ( CLEAR ?auto_5344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5346 ?auto_5345 )
      ( MAKE-3PILE ?auto_5344 ?auto_5345 ?auto_5346 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5347 - BLOCK
      ?auto_5348 - BLOCK
      ?auto_5349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5347 ?auto_5348 ) ) ( not ( = ?auto_5347 ?auto_5349 ) ) ( not ( = ?auto_5348 ?auto_5349 ) ) ( ON-TABLE ?auto_5349 ) ( ON ?auto_5348 ?auto_5349 ) ( HOLDING ?auto_5347 ) ( CLEAR ?auto_5348 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5349 ?auto_5348 ?auto_5347 )
      ( MAKE-3PILE ?auto_5347 ?auto_5348 ?auto_5349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5350 - BLOCK
      ?auto_5351 - BLOCK
      ?auto_5352 - BLOCK
    )
    :vars
    (
      ?auto_5353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5350 ?auto_5351 ) ) ( not ( = ?auto_5350 ?auto_5352 ) ) ( not ( = ?auto_5351 ?auto_5352 ) ) ( ON-TABLE ?auto_5352 ) ( ON ?auto_5351 ?auto_5352 ) ( CLEAR ?auto_5351 ) ( ON ?auto_5350 ?auto_5353 ) ( CLEAR ?auto_5350 ) ( HAND-EMPTY ) ( not ( = ?auto_5350 ?auto_5353 ) ) ( not ( = ?auto_5351 ?auto_5353 ) ) ( not ( = ?auto_5352 ?auto_5353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5350 ?auto_5353 )
      ( MAKE-3PILE ?auto_5350 ?auto_5351 ?auto_5352 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5354 - BLOCK
      ?auto_5355 - BLOCK
      ?auto_5356 - BLOCK
    )
    :vars
    (
      ?auto_5357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5354 ?auto_5355 ) ) ( not ( = ?auto_5354 ?auto_5356 ) ) ( not ( = ?auto_5355 ?auto_5356 ) ) ( ON-TABLE ?auto_5356 ) ( ON ?auto_5354 ?auto_5357 ) ( CLEAR ?auto_5354 ) ( not ( = ?auto_5354 ?auto_5357 ) ) ( not ( = ?auto_5355 ?auto_5357 ) ) ( not ( = ?auto_5356 ?auto_5357 ) ) ( HOLDING ?auto_5355 ) ( CLEAR ?auto_5356 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5356 ?auto_5355 )
      ( MAKE-3PILE ?auto_5354 ?auto_5355 ?auto_5356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5358 - BLOCK
      ?auto_5359 - BLOCK
      ?auto_5360 - BLOCK
    )
    :vars
    (
      ?auto_5361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5358 ?auto_5359 ) ) ( not ( = ?auto_5358 ?auto_5360 ) ) ( not ( = ?auto_5359 ?auto_5360 ) ) ( ON-TABLE ?auto_5360 ) ( ON ?auto_5358 ?auto_5361 ) ( not ( = ?auto_5358 ?auto_5361 ) ) ( not ( = ?auto_5359 ?auto_5361 ) ) ( not ( = ?auto_5360 ?auto_5361 ) ) ( CLEAR ?auto_5360 ) ( ON ?auto_5359 ?auto_5358 ) ( CLEAR ?auto_5359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5361 ?auto_5358 )
      ( MAKE-3PILE ?auto_5358 ?auto_5359 ?auto_5360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5362 - BLOCK
      ?auto_5363 - BLOCK
      ?auto_5364 - BLOCK
    )
    :vars
    (
      ?auto_5365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5362 ?auto_5363 ) ) ( not ( = ?auto_5362 ?auto_5364 ) ) ( not ( = ?auto_5363 ?auto_5364 ) ) ( ON ?auto_5362 ?auto_5365 ) ( not ( = ?auto_5362 ?auto_5365 ) ) ( not ( = ?auto_5363 ?auto_5365 ) ) ( not ( = ?auto_5364 ?auto_5365 ) ) ( ON ?auto_5363 ?auto_5362 ) ( CLEAR ?auto_5363 ) ( ON-TABLE ?auto_5365 ) ( HOLDING ?auto_5364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5364 )
      ( MAKE-3PILE ?auto_5362 ?auto_5363 ?auto_5364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5366 - BLOCK
      ?auto_5367 - BLOCK
      ?auto_5368 - BLOCK
    )
    :vars
    (
      ?auto_5369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5366 ?auto_5367 ) ) ( not ( = ?auto_5366 ?auto_5368 ) ) ( not ( = ?auto_5367 ?auto_5368 ) ) ( ON ?auto_5366 ?auto_5369 ) ( not ( = ?auto_5366 ?auto_5369 ) ) ( not ( = ?auto_5367 ?auto_5369 ) ) ( not ( = ?auto_5368 ?auto_5369 ) ) ( ON ?auto_5367 ?auto_5366 ) ( ON-TABLE ?auto_5369 ) ( ON ?auto_5368 ?auto_5367 ) ( CLEAR ?auto_5368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5369 ?auto_5366 ?auto_5367 )
      ( MAKE-3PILE ?auto_5366 ?auto_5367 ?auto_5368 ) )
  )

)

