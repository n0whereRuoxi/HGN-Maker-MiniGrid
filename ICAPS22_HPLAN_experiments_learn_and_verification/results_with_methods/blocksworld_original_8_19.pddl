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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213103 - BLOCK
      ?auto_213104 - BLOCK
      ?auto_213105 - BLOCK
      ?auto_213106 - BLOCK
      ?auto_213107 - BLOCK
      ?auto_213108 - BLOCK
      ?auto_213109 - BLOCK
      ?auto_213110 - BLOCK
    )
    :vars
    (
      ?auto_213111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213111 ?auto_213110 ) ( CLEAR ?auto_213111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213103 ) ( ON ?auto_213104 ?auto_213103 ) ( ON ?auto_213105 ?auto_213104 ) ( ON ?auto_213106 ?auto_213105 ) ( ON ?auto_213107 ?auto_213106 ) ( ON ?auto_213108 ?auto_213107 ) ( ON ?auto_213109 ?auto_213108 ) ( ON ?auto_213110 ?auto_213109 ) ( not ( = ?auto_213103 ?auto_213104 ) ) ( not ( = ?auto_213103 ?auto_213105 ) ) ( not ( = ?auto_213103 ?auto_213106 ) ) ( not ( = ?auto_213103 ?auto_213107 ) ) ( not ( = ?auto_213103 ?auto_213108 ) ) ( not ( = ?auto_213103 ?auto_213109 ) ) ( not ( = ?auto_213103 ?auto_213110 ) ) ( not ( = ?auto_213103 ?auto_213111 ) ) ( not ( = ?auto_213104 ?auto_213105 ) ) ( not ( = ?auto_213104 ?auto_213106 ) ) ( not ( = ?auto_213104 ?auto_213107 ) ) ( not ( = ?auto_213104 ?auto_213108 ) ) ( not ( = ?auto_213104 ?auto_213109 ) ) ( not ( = ?auto_213104 ?auto_213110 ) ) ( not ( = ?auto_213104 ?auto_213111 ) ) ( not ( = ?auto_213105 ?auto_213106 ) ) ( not ( = ?auto_213105 ?auto_213107 ) ) ( not ( = ?auto_213105 ?auto_213108 ) ) ( not ( = ?auto_213105 ?auto_213109 ) ) ( not ( = ?auto_213105 ?auto_213110 ) ) ( not ( = ?auto_213105 ?auto_213111 ) ) ( not ( = ?auto_213106 ?auto_213107 ) ) ( not ( = ?auto_213106 ?auto_213108 ) ) ( not ( = ?auto_213106 ?auto_213109 ) ) ( not ( = ?auto_213106 ?auto_213110 ) ) ( not ( = ?auto_213106 ?auto_213111 ) ) ( not ( = ?auto_213107 ?auto_213108 ) ) ( not ( = ?auto_213107 ?auto_213109 ) ) ( not ( = ?auto_213107 ?auto_213110 ) ) ( not ( = ?auto_213107 ?auto_213111 ) ) ( not ( = ?auto_213108 ?auto_213109 ) ) ( not ( = ?auto_213108 ?auto_213110 ) ) ( not ( = ?auto_213108 ?auto_213111 ) ) ( not ( = ?auto_213109 ?auto_213110 ) ) ( not ( = ?auto_213109 ?auto_213111 ) ) ( not ( = ?auto_213110 ?auto_213111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213111 ?auto_213110 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_213113 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_213113 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_213113 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_213114 - BLOCK
    )
    :vars
    (
      ?auto_213115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213114 ?auto_213115 ) ( CLEAR ?auto_213114 ) ( HAND-EMPTY ) ( not ( = ?auto_213114 ?auto_213115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213114 ?auto_213115 )
      ( MAKE-1PILE ?auto_213114 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213123 - BLOCK
      ?auto_213124 - BLOCK
      ?auto_213125 - BLOCK
      ?auto_213126 - BLOCK
      ?auto_213127 - BLOCK
      ?auto_213128 - BLOCK
      ?auto_213129 - BLOCK
    )
    :vars
    (
      ?auto_213130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213130 ?auto_213129 ) ( CLEAR ?auto_213130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213123 ) ( ON ?auto_213124 ?auto_213123 ) ( ON ?auto_213125 ?auto_213124 ) ( ON ?auto_213126 ?auto_213125 ) ( ON ?auto_213127 ?auto_213126 ) ( ON ?auto_213128 ?auto_213127 ) ( ON ?auto_213129 ?auto_213128 ) ( not ( = ?auto_213123 ?auto_213124 ) ) ( not ( = ?auto_213123 ?auto_213125 ) ) ( not ( = ?auto_213123 ?auto_213126 ) ) ( not ( = ?auto_213123 ?auto_213127 ) ) ( not ( = ?auto_213123 ?auto_213128 ) ) ( not ( = ?auto_213123 ?auto_213129 ) ) ( not ( = ?auto_213123 ?auto_213130 ) ) ( not ( = ?auto_213124 ?auto_213125 ) ) ( not ( = ?auto_213124 ?auto_213126 ) ) ( not ( = ?auto_213124 ?auto_213127 ) ) ( not ( = ?auto_213124 ?auto_213128 ) ) ( not ( = ?auto_213124 ?auto_213129 ) ) ( not ( = ?auto_213124 ?auto_213130 ) ) ( not ( = ?auto_213125 ?auto_213126 ) ) ( not ( = ?auto_213125 ?auto_213127 ) ) ( not ( = ?auto_213125 ?auto_213128 ) ) ( not ( = ?auto_213125 ?auto_213129 ) ) ( not ( = ?auto_213125 ?auto_213130 ) ) ( not ( = ?auto_213126 ?auto_213127 ) ) ( not ( = ?auto_213126 ?auto_213128 ) ) ( not ( = ?auto_213126 ?auto_213129 ) ) ( not ( = ?auto_213126 ?auto_213130 ) ) ( not ( = ?auto_213127 ?auto_213128 ) ) ( not ( = ?auto_213127 ?auto_213129 ) ) ( not ( = ?auto_213127 ?auto_213130 ) ) ( not ( = ?auto_213128 ?auto_213129 ) ) ( not ( = ?auto_213128 ?auto_213130 ) ) ( not ( = ?auto_213129 ?auto_213130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213130 ?auto_213129 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213131 - BLOCK
      ?auto_213132 - BLOCK
      ?auto_213133 - BLOCK
      ?auto_213134 - BLOCK
      ?auto_213135 - BLOCK
      ?auto_213136 - BLOCK
      ?auto_213137 - BLOCK
    )
    :vars
    (
      ?auto_213138 - BLOCK
      ?auto_213139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213138 ?auto_213137 ) ( CLEAR ?auto_213138 ) ( ON-TABLE ?auto_213131 ) ( ON ?auto_213132 ?auto_213131 ) ( ON ?auto_213133 ?auto_213132 ) ( ON ?auto_213134 ?auto_213133 ) ( ON ?auto_213135 ?auto_213134 ) ( ON ?auto_213136 ?auto_213135 ) ( ON ?auto_213137 ?auto_213136 ) ( not ( = ?auto_213131 ?auto_213132 ) ) ( not ( = ?auto_213131 ?auto_213133 ) ) ( not ( = ?auto_213131 ?auto_213134 ) ) ( not ( = ?auto_213131 ?auto_213135 ) ) ( not ( = ?auto_213131 ?auto_213136 ) ) ( not ( = ?auto_213131 ?auto_213137 ) ) ( not ( = ?auto_213131 ?auto_213138 ) ) ( not ( = ?auto_213132 ?auto_213133 ) ) ( not ( = ?auto_213132 ?auto_213134 ) ) ( not ( = ?auto_213132 ?auto_213135 ) ) ( not ( = ?auto_213132 ?auto_213136 ) ) ( not ( = ?auto_213132 ?auto_213137 ) ) ( not ( = ?auto_213132 ?auto_213138 ) ) ( not ( = ?auto_213133 ?auto_213134 ) ) ( not ( = ?auto_213133 ?auto_213135 ) ) ( not ( = ?auto_213133 ?auto_213136 ) ) ( not ( = ?auto_213133 ?auto_213137 ) ) ( not ( = ?auto_213133 ?auto_213138 ) ) ( not ( = ?auto_213134 ?auto_213135 ) ) ( not ( = ?auto_213134 ?auto_213136 ) ) ( not ( = ?auto_213134 ?auto_213137 ) ) ( not ( = ?auto_213134 ?auto_213138 ) ) ( not ( = ?auto_213135 ?auto_213136 ) ) ( not ( = ?auto_213135 ?auto_213137 ) ) ( not ( = ?auto_213135 ?auto_213138 ) ) ( not ( = ?auto_213136 ?auto_213137 ) ) ( not ( = ?auto_213136 ?auto_213138 ) ) ( not ( = ?auto_213137 ?auto_213138 ) ) ( HOLDING ?auto_213139 ) ( not ( = ?auto_213131 ?auto_213139 ) ) ( not ( = ?auto_213132 ?auto_213139 ) ) ( not ( = ?auto_213133 ?auto_213139 ) ) ( not ( = ?auto_213134 ?auto_213139 ) ) ( not ( = ?auto_213135 ?auto_213139 ) ) ( not ( = ?auto_213136 ?auto_213139 ) ) ( not ( = ?auto_213137 ?auto_213139 ) ) ( not ( = ?auto_213138 ?auto_213139 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_213139 )
      ( MAKE-7PILE ?auto_213131 ?auto_213132 ?auto_213133 ?auto_213134 ?auto_213135 ?auto_213136 ?auto_213137 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213140 - BLOCK
      ?auto_213141 - BLOCK
      ?auto_213142 - BLOCK
      ?auto_213143 - BLOCK
      ?auto_213144 - BLOCK
      ?auto_213145 - BLOCK
      ?auto_213146 - BLOCK
    )
    :vars
    (
      ?auto_213147 - BLOCK
      ?auto_213148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213147 ?auto_213146 ) ( ON-TABLE ?auto_213140 ) ( ON ?auto_213141 ?auto_213140 ) ( ON ?auto_213142 ?auto_213141 ) ( ON ?auto_213143 ?auto_213142 ) ( ON ?auto_213144 ?auto_213143 ) ( ON ?auto_213145 ?auto_213144 ) ( ON ?auto_213146 ?auto_213145 ) ( not ( = ?auto_213140 ?auto_213141 ) ) ( not ( = ?auto_213140 ?auto_213142 ) ) ( not ( = ?auto_213140 ?auto_213143 ) ) ( not ( = ?auto_213140 ?auto_213144 ) ) ( not ( = ?auto_213140 ?auto_213145 ) ) ( not ( = ?auto_213140 ?auto_213146 ) ) ( not ( = ?auto_213140 ?auto_213147 ) ) ( not ( = ?auto_213141 ?auto_213142 ) ) ( not ( = ?auto_213141 ?auto_213143 ) ) ( not ( = ?auto_213141 ?auto_213144 ) ) ( not ( = ?auto_213141 ?auto_213145 ) ) ( not ( = ?auto_213141 ?auto_213146 ) ) ( not ( = ?auto_213141 ?auto_213147 ) ) ( not ( = ?auto_213142 ?auto_213143 ) ) ( not ( = ?auto_213142 ?auto_213144 ) ) ( not ( = ?auto_213142 ?auto_213145 ) ) ( not ( = ?auto_213142 ?auto_213146 ) ) ( not ( = ?auto_213142 ?auto_213147 ) ) ( not ( = ?auto_213143 ?auto_213144 ) ) ( not ( = ?auto_213143 ?auto_213145 ) ) ( not ( = ?auto_213143 ?auto_213146 ) ) ( not ( = ?auto_213143 ?auto_213147 ) ) ( not ( = ?auto_213144 ?auto_213145 ) ) ( not ( = ?auto_213144 ?auto_213146 ) ) ( not ( = ?auto_213144 ?auto_213147 ) ) ( not ( = ?auto_213145 ?auto_213146 ) ) ( not ( = ?auto_213145 ?auto_213147 ) ) ( not ( = ?auto_213146 ?auto_213147 ) ) ( not ( = ?auto_213140 ?auto_213148 ) ) ( not ( = ?auto_213141 ?auto_213148 ) ) ( not ( = ?auto_213142 ?auto_213148 ) ) ( not ( = ?auto_213143 ?auto_213148 ) ) ( not ( = ?auto_213144 ?auto_213148 ) ) ( not ( = ?auto_213145 ?auto_213148 ) ) ( not ( = ?auto_213146 ?auto_213148 ) ) ( not ( = ?auto_213147 ?auto_213148 ) ) ( ON ?auto_213148 ?auto_213147 ) ( CLEAR ?auto_213148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213140 ?auto_213141 ?auto_213142 ?auto_213143 ?auto_213144 ?auto_213145 ?auto_213146 ?auto_213147 )
      ( MAKE-7PILE ?auto_213140 ?auto_213141 ?auto_213142 ?auto_213143 ?auto_213144 ?auto_213145 ?auto_213146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213151 - BLOCK
      ?auto_213152 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_213152 ) ( CLEAR ?auto_213151 ) ( ON-TABLE ?auto_213151 ) ( not ( = ?auto_213151 ?auto_213152 ) ) )
    :subtasks
    ( ( !STACK ?auto_213152 ?auto_213151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213153 - BLOCK
      ?auto_213154 - BLOCK
    )
    :vars
    (
      ?auto_213155 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_213153 ) ( ON-TABLE ?auto_213153 ) ( not ( = ?auto_213153 ?auto_213154 ) ) ( ON ?auto_213154 ?auto_213155 ) ( CLEAR ?auto_213154 ) ( HAND-EMPTY ) ( not ( = ?auto_213153 ?auto_213155 ) ) ( not ( = ?auto_213154 ?auto_213155 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213154 ?auto_213155 )
      ( MAKE-2PILE ?auto_213153 ?auto_213154 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213156 - BLOCK
      ?auto_213157 - BLOCK
    )
    :vars
    (
      ?auto_213158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213156 ?auto_213157 ) ) ( ON ?auto_213157 ?auto_213158 ) ( CLEAR ?auto_213157 ) ( not ( = ?auto_213156 ?auto_213158 ) ) ( not ( = ?auto_213157 ?auto_213158 ) ) ( HOLDING ?auto_213156 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213156 )
      ( MAKE-2PILE ?auto_213156 ?auto_213157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213159 - BLOCK
      ?auto_213160 - BLOCK
    )
    :vars
    (
      ?auto_213161 - BLOCK
      ?auto_213166 - BLOCK
      ?auto_213162 - BLOCK
      ?auto_213167 - BLOCK
      ?auto_213165 - BLOCK
      ?auto_213164 - BLOCK
      ?auto_213163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213159 ?auto_213160 ) ) ( ON ?auto_213160 ?auto_213161 ) ( not ( = ?auto_213159 ?auto_213161 ) ) ( not ( = ?auto_213160 ?auto_213161 ) ) ( ON ?auto_213159 ?auto_213160 ) ( CLEAR ?auto_213159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213166 ) ( ON ?auto_213162 ?auto_213166 ) ( ON ?auto_213167 ?auto_213162 ) ( ON ?auto_213165 ?auto_213167 ) ( ON ?auto_213164 ?auto_213165 ) ( ON ?auto_213163 ?auto_213164 ) ( ON ?auto_213161 ?auto_213163 ) ( not ( = ?auto_213166 ?auto_213162 ) ) ( not ( = ?auto_213166 ?auto_213167 ) ) ( not ( = ?auto_213166 ?auto_213165 ) ) ( not ( = ?auto_213166 ?auto_213164 ) ) ( not ( = ?auto_213166 ?auto_213163 ) ) ( not ( = ?auto_213166 ?auto_213161 ) ) ( not ( = ?auto_213166 ?auto_213160 ) ) ( not ( = ?auto_213166 ?auto_213159 ) ) ( not ( = ?auto_213162 ?auto_213167 ) ) ( not ( = ?auto_213162 ?auto_213165 ) ) ( not ( = ?auto_213162 ?auto_213164 ) ) ( not ( = ?auto_213162 ?auto_213163 ) ) ( not ( = ?auto_213162 ?auto_213161 ) ) ( not ( = ?auto_213162 ?auto_213160 ) ) ( not ( = ?auto_213162 ?auto_213159 ) ) ( not ( = ?auto_213167 ?auto_213165 ) ) ( not ( = ?auto_213167 ?auto_213164 ) ) ( not ( = ?auto_213167 ?auto_213163 ) ) ( not ( = ?auto_213167 ?auto_213161 ) ) ( not ( = ?auto_213167 ?auto_213160 ) ) ( not ( = ?auto_213167 ?auto_213159 ) ) ( not ( = ?auto_213165 ?auto_213164 ) ) ( not ( = ?auto_213165 ?auto_213163 ) ) ( not ( = ?auto_213165 ?auto_213161 ) ) ( not ( = ?auto_213165 ?auto_213160 ) ) ( not ( = ?auto_213165 ?auto_213159 ) ) ( not ( = ?auto_213164 ?auto_213163 ) ) ( not ( = ?auto_213164 ?auto_213161 ) ) ( not ( = ?auto_213164 ?auto_213160 ) ) ( not ( = ?auto_213164 ?auto_213159 ) ) ( not ( = ?auto_213163 ?auto_213161 ) ) ( not ( = ?auto_213163 ?auto_213160 ) ) ( not ( = ?auto_213163 ?auto_213159 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213166 ?auto_213162 ?auto_213167 ?auto_213165 ?auto_213164 ?auto_213163 ?auto_213161 ?auto_213160 )
      ( MAKE-2PILE ?auto_213159 ?auto_213160 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213174 - BLOCK
      ?auto_213175 - BLOCK
      ?auto_213176 - BLOCK
      ?auto_213177 - BLOCK
      ?auto_213178 - BLOCK
      ?auto_213179 - BLOCK
    )
    :vars
    (
      ?auto_213180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213180 ?auto_213179 ) ( CLEAR ?auto_213180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213174 ) ( ON ?auto_213175 ?auto_213174 ) ( ON ?auto_213176 ?auto_213175 ) ( ON ?auto_213177 ?auto_213176 ) ( ON ?auto_213178 ?auto_213177 ) ( ON ?auto_213179 ?auto_213178 ) ( not ( = ?auto_213174 ?auto_213175 ) ) ( not ( = ?auto_213174 ?auto_213176 ) ) ( not ( = ?auto_213174 ?auto_213177 ) ) ( not ( = ?auto_213174 ?auto_213178 ) ) ( not ( = ?auto_213174 ?auto_213179 ) ) ( not ( = ?auto_213174 ?auto_213180 ) ) ( not ( = ?auto_213175 ?auto_213176 ) ) ( not ( = ?auto_213175 ?auto_213177 ) ) ( not ( = ?auto_213175 ?auto_213178 ) ) ( not ( = ?auto_213175 ?auto_213179 ) ) ( not ( = ?auto_213175 ?auto_213180 ) ) ( not ( = ?auto_213176 ?auto_213177 ) ) ( not ( = ?auto_213176 ?auto_213178 ) ) ( not ( = ?auto_213176 ?auto_213179 ) ) ( not ( = ?auto_213176 ?auto_213180 ) ) ( not ( = ?auto_213177 ?auto_213178 ) ) ( not ( = ?auto_213177 ?auto_213179 ) ) ( not ( = ?auto_213177 ?auto_213180 ) ) ( not ( = ?auto_213178 ?auto_213179 ) ) ( not ( = ?auto_213178 ?auto_213180 ) ) ( not ( = ?auto_213179 ?auto_213180 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213180 ?auto_213179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213181 - BLOCK
      ?auto_213182 - BLOCK
      ?auto_213183 - BLOCK
      ?auto_213184 - BLOCK
      ?auto_213185 - BLOCK
      ?auto_213186 - BLOCK
    )
    :vars
    (
      ?auto_213187 - BLOCK
      ?auto_213188 - BLOCK
      ?auto_213189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213187 ?auto_213186 ) ( CLEAR ?auto_213187 ) ( ON-TABLE ?auto_213181 ) ( ON ?auto_213182 ?auto_213181 ) ( ON ?auto_213183 ?auto_213182 ) ( ON ?auto_213184 ?auto_213183 ) ( ON ?auto_213185 ?auto_213184 ) ( ON ?auto_213186 ?auto_213185 ) ( not ( = ?auto_213181 ?auto_213182 ) ) ( not ( = ?auto_213181 ?auto_213183 ) ) ( not ( = ?auto_213181 ?auto_213184 ) ) ( not ( = ?auto_213181 ?auto_213185 ) ) ( not ( = ?auto_213181 ?auto_213186 ) ) ( not ( = ?auto_213181 ?auto_213187 ) ) ( not ( = ?auto_213182 ?auto_213183 ) ) ( not ( = ?auto_213182 ?auto_213184 ) ) ( not ( = ?auto_213182 ?auto_213185 ) ) ( not ( = ?auto_213182 ?auto_213186 ) ) ( not ( = ?auto_213182 ?auto_213187 ) ) ( not ( = ?auto_213183 ?auto_213184 ) ) ( not ( = ?auto_213183 ?auto_213185 ) ) ( not ( = ?auto_213183 ?auto_213186 ) ) ( not ( = ?auto_213183 ?auto_213187 ) ) ( not ( = ?auto_213184 ?auto_213185 ) ) ( not ( = ?auto_213184 ?auto_213186 ) ) ( not ( = ?auto_213184 ?auto_213187 ) ) ( not ( = ?auto_213185 ?auto_213186 ) ) ( not ( = ?auto_213185 ?auto_213187 ) ) ( not ( = ?auto_213186 ?auto_213187 ) ) ( HOLDING ?auto_213188 ) ( CLEAR ?auto_213189 ) ( not ( = ?auto_213181 ?auto_213188 ) ) ( not ( = ?auto_213181 ?auto_213189 ) ) ( not ( = ?auto_213182 ?auto_213188 ) ) ( not ( = ?auto_213182 ?auto_213189 ) ) ( not ( = ?auto_213183 ?auto_213188 ) ) ( not ( = ?auto_213183 ?auto_213189 ) ) ( not ( = ?auto_213184 ?auto_213188 ) ) ( not ( = ?auto_213184 ?auto_213189 ) ) ( not ( = ?auto_213185 ?auto_213188 ) ) ( not ( = ?auto_213185 ?auto_213189 ) ) ( not ( = ?auto_213186 ?auto_213188 ) ) ( not ( = ?auto_213186 ?auto_213189 ) ) ( not ( = ?auto_213187 ?auto_213188 ) ) ( not ( = ?auto_213187 ?auto_213189 ) ) ( not ( = ?auto_213188 ?auto_213189 ) ) )
    :subtasks
    ( ( !STACK ?auto_213188 ?auto_213189 )
      ( MAKE-6PILE ?auto_213181 ?auto_213182 ?auto_213183 ?auto_213184 ?auto_213185 ?auto_213186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213190 - BLOCK
      ?auto_213191 - BLOCK
      ?auto_213192 - BLOCK
      ?auto_213193 - BLOCK
      ?auto_213194 - BLOCK
      ?auto_213195 - BLOCK
    )
    :vars
    (
      ?auto_213196 - BLOCK
      ?auto_213197 - BLOCK
      ?auto_213198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213196 ?auto_213195 ) ( ON-TABLE ?auto_213190 ) ( ON ?auto_213191 ?auto_213190 ) ( ON ?auto_213192 ?auto_213191 ) ( ON ?auto_213193 ?auto_213192 ) ( ON ?auto_213194 ?auto_213193 ) ( ON ?auto_213195 ?auto_213194 ) ( not ( = ?auto_213190 ?auto_213191 ) ) ( not ( = ?auto_213190 ?auto_213192 ) ) ( not ( = ?auto_213190 ?auto_213193 ) ) ( not ( = ?auto_213190 ?auto_213194 ) ) ( not ( = ?auto_213190 ?auto_213195 ) ) ( not ( = ?auto_213190 ?auto_213196 ) ) ( not ( = ?auto_213191 ?auto_213192 ) ) ( not ( = ?auto_213191 ?auto_213193 ) ) ( not ( = ?auto_213191 ?auto_213194 ) ) ( not ( = ?auto_213191 ?auto_213195 ) ) ( not ( = ?auto_213191 ?auto_213196 ) ) ( not ( = ?auto_213192 ?auto_213193 ) ) ( not ( = ?auto_213192 ?auto_213194 ) ) ( not ( = ?auto_213192 ?auto_213195 ) ) ( not ( = ?auto_213192 ?auto_213196 ) ) ( not ( = ?auto_213193 ?auto_213194 ) ) ( not ( = ?auto_213193 ?auto_213195 ) ) ( not ( = ?auto_213193 ?auto_213196 ) ) ( not ( = ?auto_213194 ?auto_213195 ) ) ( not ( = ?auto_213194 ?auto_213196 ) ) ( not ( = ?auto_213195 ?auto_213196 ) ) ( CLEAR ?auto_213197 ) ( not ( = ?auto_213190 ?auto_213198 ) ) ( not ( = ?auto_213190 ?auto_213197 ) ) ( not ( = ?auto_213191 ?auto_213198 ) ) ( not ( = ?auto_213191 ?auto_213197 ) ) ( not ( = ?auto_213192 ?auto_213198 ) ) ( not ( = ?auto_213192 ?auto_213197 ) ) ( not ( = ?auto_213193 ?auto_213198 ) ) ( not ( = ?auto_213193 ?auto_213197 ) ) ( not ( = ?auto_213194 ?auto_213198 ) ) ( not ( = ?auto_213194 ?auto_213197 ) ) ( not ( = ?auto_213195 ?auto_213198 ) ) ( not ( = ?auto_213195 ?auto_213197 ) ) ( not ( = ?auto_213196 ?auto_213198 ) ) ( not ( = ?auto_213196 ?auto_213197 ) ) ( not ( = ?auto_213198 ?auto_213197 ) ) ( ON ?auto_213198 ?auto_213196 ) ( CLEAR ?auto_213198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213190 ?auto_213191 ?auto_213192 ?auto_213193 ?auto_213194 ?auto_213195 ?auto_213196 )
      ( MAKE-6PILE ?auto_213190 ?auto_213191 ?auto_213192 ?auto_213193 ?auto_213194 ?auto_213195 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213199 - BLOCK
      ?auto_213200 - BLOCK
      ?auto_213201 - BLOCK
      ?auto_213202 - BLOCK
      ?auto_213203 - BLOCK
      ?auto_213204 - BLOCK
    )
    :vars
    (
      ?auto_213206 - BLOCK
      ?auto_213207 - BLOCK
      ?auto_213205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213206 ?auto_213204 ) ( ON-TABLE ?auto_213199 ) ( ON ?auto_213200 ?auto_213199 ) ( ON ?auto_213201 ?auto_213200 ) ( ON ?auto_213202 ?auto_213201 ) ( ON ?auto_213203 ?auto_213202 ) ( ON ?auto_213204 ?auto_213203 ) ( not ( = ?auto_213199 ?auto_213200 ) ) ( not ( = ?auto_213199 ?auto_213201 ) ) ( not ( = ?auto_213199 ?auto_213202 ) ) ( not ( = ?auto_213199 ?auto_213203 ) ) ( not ( = ?auto_213199 ?auto_213204 ) ) ( not ( = ?auto_213199 ?auto_213206 ) ) ( not ( = ?auto_213200 ?auto_213201 ) ) ( not ( = ?auto_213200 ?auto_213202 ) ) ( not ( = ?auto_213200 ?auto_213203 ) ) ( not ( = ?auto_213200 ?auto_213204 ) ) ( not ( = ?auto_213200 ?auto_213206 ) ) ( not ( = ?auto_213201 ?auto_213202 ) ) ( not ( = ?auto_213201 ?auto_213203 ) ) ( not ( = ?auto_213201 ?auto_213204 ) ) ( not ( = ?auto_213201 ?auto_213206 ) ) ( not ( = ?auto_213202 ?auto_213203 ) ) ( not ( = ?auto_213202 ?auto_213204 ) ) ( not ( = ?auto_213202 ?auto_213206 ) ) ( not ( = ?auto_213203 ?auto_213204 ) ) ( not ( = ?auto_213203 ?auto_213206 ) ) ( not ( = ?auto_213204 ?auto_213206 ) ) ( not ( = ?auto_213199 ?auto_213207 ) ) ( not ( = ?auto_213199 ?auto_213205 ) ) ( not ( = ?auto_213200 ?auto_213207 ) ) ( not ( = ?auto_213200 ?auto_213205 ) ) ( not ( = ?auto_213201 ?auto_213207 ) ) ( not ( = ?auto_213201 ?auto_213205 ) ) ( not ( = ?auto_213202 ?auto_213207 ) ) ( not ( = ?auto_213202 ?auto_213205 ) ) ( not ( = ?auto_213203 ?auto_213207 ) ) ( not ( = ?auto_213203 ?auto_213205 ) ) ( not ( = ?auto_213204 ?auto_213207 ) ) ( not ( = ?auto_213204 ?auto_213205 ) ) ( not ( = ?auto_213206 ?auto_213207 ) ) ( not ( = ?auto_213206 ?auto_213205 ) ) ( not ( = ?auto_213207 ?auto_213205 ) ) ( ON ?auto_213207 ?auto_213206 ) ( CLEAR ?auto_213207 ) ( HOLDING ?auto_213205 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213205 )
      ( MAKE-6PILE ?auto_213199 ?auto_213200 ?auto_213201 ?auto_213202 ?auto_213203 ?auto_213204 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213208 - BLOCK
      ?auto_213209 - BLOCK
      ?auto_213210 - BLOCK
      ?auto_213211 - BLOCK
      ?auto_213212 - BLOCK
      ?auto_213213 - BLOCK
    )
    :vars
    (
      ?auto_213215 - BLOCK
      ?auto_213216 - BLOCK
      ?auto_213214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213215 ?auto_213213 ) ( ON-TABLE ?auto_213208 ) ( ON ?auto_213209 ?auto_213208 ) ( ON ?auto_213210 ?auto_213209 ) ( ON ?auto_213211 ?auto_213210 ) ( ON ?auto_213212 ?auto_213211 ) ( ON ?auto_213213 ?auto_213212 ) ( not ( = ?auto_213208 ?auto_213209 ) ) ( not ( = ?auto_213208 ?auto_213210 ) ) ( not ( = ?auto_213208 ?auto_213211 ) ) ( not ( = ?auto_213208 ?auto_213212 ) ) ( not ( = ?auto_213208 ?auto_213213 ) ) ( not ( = ?auto_213208 ?auto_213215 ) ) ( not ( = ?auto_213209 ?auto_213210 ) ) ( not ( = ?auto_213209 ?auto_213211 ) ) ( not ( = ?auto_213209 ?auto_213212 ) ) ( not ( = ?auto_213209 ?auto_213213 ) ) ( not ( = ?auto_213209 ?auto_213215 ) ) ( not ( = ?auto_213210 ?auto_213211 ) ) ( not ( = ?auto_213210 ?auto_213212 ) ) ( not ( = ?auto_213210 ?auto_213213 ) ) ( not ( = ?auto_213210 ?auto_213215 ) ) ( not ( = ?auto_213211 ?auto_213212 ) ) ( not ( = ?auto_213211 ?auto_213213 ) ) ( not ( = ?auto_213211 ?auto_213215 ) ) ( not ( = ?auto_213212 ?auto_213213 ) ) ( not ( = ?auto_213212 ?auto_213215 ) ) ( not ( = ?auto_213213 ?auto_213215 ) ) ( not ( = ?auto_213208 ?auto_213216 ) ) ( not ( = ?auto_213208 ?auto_213214 ) ) ( not ( = ?auto_213209 ?auto_213216 ) ) ( not ( = ?auto_213209 ?auto_213214 ) ) ( not ( = ?auto_213210 ?auto_213216 ) ) ( not ( = ?auto_213210 ?auto_213214 ) ) ( not ( = ?auto_213211 ?auto_213216 ) ) ( not ( = ?auto_213211 ?auto_213214 ) ) ( not ( = ?auto_213212 ?auto_213216 ) ) ( not ( = ?auto_213212 ?auto_213214 ) ) ( not ( = ?auto_213213 ?auto_213216 ) ) ( not ( = ?auto_213213 ?auto_213214 ) ) ( not ( = ?auto_213215 ?auto_213216 ) ) ( not ( = ?auto_213215 ?auto_213214 ) ) ( not ( = ?auto_213216 ?auto_213214 ) ) ( ON ?auto_213216 ?auto_213215 ) ( ON ?auto_213214 ?auto_213216 ) ( CLEAR ?auto_213214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213208 ?auto_213209 ?auto_213210 ?auto_213211 ?auto_213212 ?auto_213213 ?auto_213215 ?auto_213216 )
      ( MAKE-6PILE ?auto_213208 ?auto_213209 ?auto_213210 ?auto_213211 ?auto_213212 ?auto_213213 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213220 - BLOCK
      ?auto_213221 - BLOCK
      ?auto_213222 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_213222 ) ( CLEAR ?auto_213221 ) ( ON-TABLE ?auto_213220 ) ( ON ?auto_213221 ?auto_213220 ) ( not ( = ?auto_213220 ?auto_213221 ) ) ( not ( = ?auto_213220 ?auto_213222 ) ) ( not ( = ?auto_213221 ?auto_213222 ) ) )
    :subtasks
    ( ( !STACK ?auto_213222 ?auto_213221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213223 - BLOCK
      ?auto_213224 - BLOCK
      ?auto_213225 - BLOCK
    )
    :vars
    (
      ?auto_213226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_213224 ) ( ON-TABLE ?auto_213223 ) ( ON ?auto_213224 ?auto_213223 ) ( not ( = ?auto_213223 ?auto_213224 ) ) ( not ( = ?auto_213223 ?auto_213225 ) ) ( not ( = ?auto_213224 ?auto_213225 ) ) ( ON ?auto_213225 ?auto_213226 ) ( CLEAR ?auto_213225 ) ( HAND-EMPTY ) ( not ( = ?auto_213223 ?auto_213226 ) ) ( not ( = ?auto_213224 ?auto_213226 ) ) ( not ( = ?auto_213225 ?auto_213226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213225 ?auto_213226 )
      ( MAKE-3PILE ?auto_213223 ?auto_213224 ?auto_213225 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213227 - BLOCK
      ?auto_213228 - BLOCK
      ?auto_213229 - BLOCK
    )
    :vars
    (
      ?auto_213230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213227 ) ( not ( = ?auto_213227 ?auto_213228 ) ) ( not ( = ?auto_213227 ?auto_213229 ) ) ( not ( = ?auto_213228 ?auto_213229 ) ) ( ON ?auto_213229 ?auto_213230 ) ( CLEAR ?auto_213229 ) ( not ( = ?auto_213227 ?auto_213230 ) ) ( not ( = ?auto_213228 ?auto_213230 ) ) ( not ( = ?auto_213229 ?auto_213230 ) ) ( HOLDING ?auto_213228 ) ( CLEAR ?auto_213227 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213227 ?auto_213228 )
      ( MAKE-3PILE ?auto_213227 ?auto_213228 ?auto_213229 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213231 - BLOCK
      ?auto_213232 - BLOCK
      ?auto_213233 - BLOCK
    )
    :vars
    (
      ?auto_213234 - BLOCK
      ?auto_213238 - BLOCK
      ?auto_213236 - BLOCK
      ?auto_213237 - BLOCK
      ?auto_213239 - BLOCK
      ?auto_213235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213231 ) ( not ( = ?auto_213231 ?auto_213232 ) ) ( not ( = ?auto_213231 ?auto_213233 ) ) ( not ( = ?auto_213232 ?auto_213233 ) ) ( ON ?auto_213233 ?auto_213234 ) ( not ( = ?auto_213231 ?auto_213234 ) ) ( not ( = ?auto_213232 ?auto_213234 ) ) ( not ( = ?auto_213233 ?auto_213234 ) ) ( CLEAR ?auto_213231 ) ( ON ?auto_213232 ?auto_213233 ) ( CLEAR ?auto_213232 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213238 ) ( ON ?auto_213236 ?auto_213238 ) ( ON ?auto_213237 ?auto_213236 ) ( ON ?auto_213239 ?auto_213237 ) ( ON ?auto_213235 ?auto_213239 ) ( ON ?auto_213234 ?auto_213235 ) ( not ( = ?auto_213238 ?auto_213236 ) ) ( not ( = ?auto_213238 ?auto_213237 ) ) ( not ( = ?auto_213238 ?auto_213239 ) ) ( not ( = ?auto_213238 ?auto_213235 ) ) ( not ( = ?auto_213238 ?auto_213234 ) ) ( not ( = ?auto_213238 ?auto_213233 ) ) ( not ( = ?auto_213238 ?auto_213232 ) ) ( not ( = ?auto_213236 ?auto_213237 ) ) ( not ( = ?auto_213236 ?auto_213239 ) ) ( not ( = ?auto_213236 ?auto_213235 ) ) ( not ( = ?auto_213236 ?auto_213234 ) ) ( not ( = ?auto_213236 ?auto_213233 ) ) ( not ( = ?auto_213236 ?auto_213232 ) ) ( not ( = ?auto_213237 ?auto_213239 ) ) ( not ( = ?auto_213237 ?auto_213235 ) ) ( not ( = ?auto_213237 ?auto_213234 ) ) ( not ( = ?auto_213237 ?auto_213233 ) ) ( not ( = ?auto_213237 ?auto_213232 ) ) ( not ( = ?auto_213239 ?auto_213235 ) ) ( not ( = ?auto_213239 ?auto_213234 ) ) ( not ( = ?auto_213239 ?auto_213233 ) ) ( not ( = ?auto_213239 ?auto_213232 ) ) ( not ( = ?auto_213235 ?auto_213234 ) ) ( not ( = ?auto_213235 ?auto_213233 ) ) ( not ( = ?auto_213235 ?auto_213232 ) ) ( not ( = ?auto_213231 ?auto_213238 ) ) ( not ( = ?auto_213231 ?auto_213236 ) ) ( not ( = ?auto_213231 ?auto_213237 ) ) ( not ( = ?auto_213231 ?auto_213239 ) ) ( not ( = ?auto_213231 ?auto_213235 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213238 ?auto_213236 ?auto_213237 ?auto_213239 ?auto_213235 ?auto_213234 ?auto_213233 )
      ( MAKE-3PILE ?auto_213231 ?auto_213232 ?auto_213233 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213240 - BLOCK
      ?auto_213241 - BLOCK
      ?auto_213242 - BLOCK
    )
    :vars
    (
      ?auto_213243 - BLOCK
      ?auto_213246 - BLOCK
      ?auto_213244 - BLOCK
      ?auto_213248 - BLOCK
      ?auto_213247 - BLOCK
      ?auto_213245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213240 ?auto_213241 ) ) ( not ( = ?auto_213240 ?auto_213242 ) ) ( not ( = ?auto_213241 ?auto_213242 ) ) ( ON ?auto_213242 ?auto_213243 ) ( not ( = ?auto_213240 ?auto_213243 ) ) ( not ( = ?auto_213241 ?auto_213243 ) ) ( not ( = ?auto_213242 ?auto_213243 ) ) ( ON ?auto_213241 ?auto_213242 ) ( CLEAR ?auto_213241 ) ( ON-TABLE ?auto_213246 ) ( ON ?auto_213244 ?auto_213246 ) ( ON ?auto_213248 ?auto_213244 ) ( ON ?auto_213247 ?auto_213248 ) ( ON ?auto_213245 ?auto_213247 ) ( ON ?auto_213243 ?auto_213245 ) ( not ( = ?auto_213246 ?auto_213244 ) ) ( not ( = ?auto_213246 ?auto_213248 ) ) ( not ( = ?auto_213246 ?auto_213247 ) ) ( not ( = ?auto_213246 ?auto_213245 ) ) ( not ( = ?auto_213246 ?auto_213243 ) ) ( not ( = ?auto_213246 ?auto_213242 ) ) ( not ( = ?auto_213246 ?auto_213241 ) ) ( not ( = ?auto_213244 ?auto_213248 ) ) ( not ( = ?auto_213244 ?auto_213247 ) ) ( not ( = ?auto_213244 ?auto_213245 ) ) ( not ( = ?auto_213244 ?auto_213243 ) ) ( not ( = ?auto_213244 ?auto_213242 ) ) ( not ( = ?auto_213244 ?auto_213241 ) ) ( not ( = ?auto_213248 ?auto_213247 ) ) ( not ( = ?auto_213248 ?auto_213245 ) ) ( not ( = ?auto_213248 ?auto_213243 ) ) ( not ( = ?auto_213248 ?auto_213242 ) ) ( not ( = ?auto_213248 ?auto_213241 ) ) ( not ( = ?auto_213247 ?auto_213245 ) ) ( not ( = ?auto_213247 ?auto_213243 ) ) ( not ( = ?auto_213247 ?auto_213242 ) ) ( not ( = ?auto_213247 ?auto_213241 ) ) ( not ( = ?auto_213245 ?auto_213243 ) ) ( not ( = ?auto_213245 ?auto_213242 ) ) ( not ( = ?auto_213245 ?auto_213241 ) ) ( not ( = ?auto_213240 ?auto_213246 ) ) ( not ( = ?auto_213240 ?auto_213244 ) ) ( not ( = ?auto_213240 ?auto_213248 ) ) ( not ( = ?auto_213240 ?auto_213247 ) ) ( not ( = ?auto_213240 ?auto_213245 ) ) ( HOLDING ?auto_213240 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213240 )
      ( MAKE-3PILE ?auto_213240 ?auto_213241 ?auto_213242 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213249 - BLOCK
      ?auto_213250 - BLOCK
      ?auto_213251 - BLOCK
    )
    :vars
    (
      ?auto_213254 - BLOCK
      ?auto_213252 - BLOCK
      ?auto_213253 - BLOCK
      ?auto_213255 - BLOCK
      ?auto_213256 - BLOCK
      ?auto_213257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213249 ?auto_213250 ) ) ( not ( = ?auto_213249 ?auto_213251 ) ) ( not ( = ?auto_213250 ?auto_213251 ) ) ( ON ?auto_213251 ?auto_213254 ) ( not ( = ?auto_213249 ?auto_213254 ) ) ( not ( = ?auto_213250 ?auto_213254 ) ) ( not ( = ?auto_213251 ?auto_213254 ) ) ( ON ?auto_213250 ?auto_213251 ) ( ON-TABLE ?auto_213252 ) ( ON ?auto_213253 ?auto_213252 ) ( ON ?auto_213255 ?auto_213253 ) ( ON ?auto_213256 ?auto_213255 ) ( ON ?auto_213257 ?auto_213256 ) ( ON ?auto_213254 ?auto_213257 ) ( not ( = ?auto_213252 ?auto_213253 ) ) ( not ( = ?auto_213252 ?auto_213255 ) ) ( not ( = ?auto_213252 ?auto_213256 ) ) ( not ( = ?auto_213252 ?auto_213257 ) ) ( not ( = ?auto_213252 ?auto_213254 ) ) ( not ( = ?auto_213252 ?auto_213251 ) ) ( not ( = ?auto_213252 ?auto_213250 ) ) ( not ( = ?auto_213253 ?auto_213255 ) ) ( not ( = ?auto_213253 ?auto_213256 ) ) ( not ( = ?auto_213253 ?auto_213257 ) ) ( not ( = ?auto_213253 ?auto_213254 ) ) ( not ( = ?auto_213253 ?auto_213251 ) ) ( not ( = ?auto_213253 ?auto_213250 ) ) ( not ( = ?auto_213255 ?auto_213256 ) ) ( not ( = ?auto_213255 ?auto_213257 ) ) ( not ( = ?auto_213255 ?auto_213254 ) ) ( not ( = ?auto_213255 ?auto_213251 ) ) ( not ( = ?auto_213255 ?auto_213250 ) ) ( not ( = ?auto_213256 ?auto_213257 ) ) ( not ( = ?auto_213256 ?auto_213254 ) ) ( not ( = ?auto_213256 ?auto_213251 ) ) ( not ( = ?auto_213256 ?auto_213250 ) ) ( not ( = ?auto_213257 ?auto_213254 ) ) ( not ( = ?auto_213257 ?auto_213251 ) ) ( not ( = ?auto_213257 ?auto_213250 ) ) ( not ( = ?auto_213249 ?auto_213252 ) ) ( not ( = ?auto_213249 ?auto_213253 ) ) ( not ( = ?auto_213249 ?auto_213255 ) ) ( not ( = ?auto_213249 ?auto_213256 ) ) ( not ( = ?auto_213249 ?auto_213257 ) ) ( ON ?auto_213249 ?auto_213250 ) ( CLEAR ?auto_213249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213252 ?auto_213253 ?auto_213255 ?auto_213256 ?auto_213257 ?auto_213254 ?auto_213251 ?auto_213250 )
      ( MAKE-3PILE ?auto_213249 ?auto_213250 ?auto_213251 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213263 - BLOCK
      ?auto_213264 - BLOCK
      ?auto_213265 - BLOCK
      ?auto_213266 - BLOCK
      ?auto_213267 - BLOCK
    )
    :vars
    (
      ?auto_213268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213268 ?auto_213267 ) ( CLEAR ?auto_213268 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213263 ) ( ON ?auto_213264 ?auto_213263 ) ( ON ?auto_213265 ?auto_213264 ) ( ON ?auto_213266 ?auto_213265 ) ( ON ?auto_213267 ?auto_213266 ) ( not ( = ?auto_213263 ?auto_213264 ) ) ( not ( = ?auto_213263 ?auto_213265 ) ) ( not ( = ?auto_213263 ?auto_213266 ) ) ( not ( = ?auto_213263 ?auto_213267 ) ) ( not ( = ?auto_213263 ?auto_213268 ) ) ( not ( = ?auto_213264 ?auto_213265 ) ) ( not ( = ?auto_213264 ?auto_213266 ) ) ( not ( = ?auto_213264 ?auto_213267 ) ) ( not ( = ?auto_213264 ?auto_213268 ) ) ( not ( = ?auto_213265 ?auto_213266 ) ) ( not ( = ?auto_213265 ?auto_213267 ) ) ( not ( = ?auto_213265 ?auto_213268 ) ) ( not ( = ?auto_213266 ?auto_213267 ) ) ( not ( = ?auto_213266 ?auto_213268 ) ) ( not ( = ?auto_213267 ?auto_213268 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213268 ?auto_213267 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213269 - BLOCK
      ?auto_213270 - BLOCK
      ?auto_213271 - BLOCK
      ?auto_213272 - BLOCK
      ?auto_213273 - BLOCK
    )
    :vars
    (
      ?auto_213274 - BLOCK
      ?auto_213275 - BLOCK
      ?auto_213276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213274 ?auto_213273 ) ( CLEAR ?auto_213274 ) ( ON-TABLE ?auto_213269 ) ( ON ?auto_213270 ?auto_213269 ) ( ON ?auto_213271 ?auto_213270 ) ( ON ?auto_213272 ?auto_213271 ) ( ON ?auto_213273 ?auto_213272 ) ( not ( = ?auto_213269 ?auto_213270 ) ) ( not ( = ?auto_213269 ?auto_213271 ) ) ( not ( = ?auto_213269 ?auto_213272 ) ) ( not ( = ?auto_213269 ?auto_213273 ) ) ( not ( = ?auto_213269 ?auto_213274 ) ) ( not ( = ?auto_213270 ?auto_213271 ) ) ( not ( = ?auto_213270 ?auto_213272 ) ) ( not ( = ?auto_213270 ?auto_213273 ) ) ( not ( = ?auto_213270 ?auto_213274 ) ) ( not ( = ?auto_213271 ?auto_213272 ) ) ( not ( = ?auto_213271 ?auto_213273 ) ) ( not ( = ?auto_213271 ?auto_213274 ) ) ( not ( = ?auto_213272 ?auto_213273 ) ) ( not ( = ?auto_213272 ?auto_213274 ) ) ( not ( = ?auto_213273 ?auto_213274 ) ) ( HOLDING ?auto_213275 ) ( CLEAR ?auto_213276 ) ( not ( = ?auto_213269 ?auto_213275 ) ) ( not ( = ?auto_213269 ?auto_213276 ) ) ( not ( = ?auto_213270 ?auto_213275 ) ) ( not ( = ?auto_213270 ?auto_213276 ) ) ( not ( = ?auto_213271 ?auto_213275 ) ) ( not ( = ?auto_213271 ?auto_213276 ) ) ( not ( = ?auto_213272 ?auto_213275 ) ) ( not ( = ?auto_213272 ?auto_213276 ) ) ( not ( = ?auto_213273 ?auto_213275 ) ) ( not ( = ?auto_213273 ?auto_213276 ) ) ( not ( = ?auto_213274 ?auto_213275 ) ) ( not ( = ?auto_213274 ?auto_213276 ) ) ( not ( = ?auto_213275 ?auto_213276 ) ) )
    :subtasks
    ( ( !STACK ?auto_213275 ?auto_213276 )
      ( MAKE-5PILE ?auto_213269 ?auto_213270 ?auto_213271 ?auto_213272 ?auto_213273 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213277 - BLOCK
      ?auto_213278 - BLOCK
      ?auto_213279 - BLOCK
      ?auto_213280 - BLOCK
      ?auto_213281 - BLOCK
    )
    :vars
    (
      ?auto_213283 - BLOCK
      ?auto_213282 - BLOCK
      ?auto_213284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213283 ?auto_213281 ) ( ON-TABLE ?auto_213277 ) ( ON ?auto_213278 ?auto_213277 ) ( ON ?auto_213279 ?auto_213278 ) ( ON ?auto_213280 ?auto_213279 ) ( ON ?auto_213281 ?auto_213280 ) ( not ( = ?auto_213277 ?auto_213278 ) ) ( not ( = ?auto_213277 ?auto_213279 ) ) ( not ( = ?auto_213277 ?auto_213280 ) ) ( not ( = ?auto_213277 ?auto_213281 ) ) ( not ( = ?auto_213277 ?auto_213283 ) ) ( not ( = ?auto_213278 ?auto_213279 ) ) ( not ( = ?auto_213278 ?auto_213280 ) ) ( not ( = ?auto_213278 ?auto_213281 ) ) ( not ( = ?auto_213278 ?auto_213283 ) ) ( not ( = ?auto_213279 ?auto_213280 ) ) ( not ( = ?auto_213279 ?auto_213281 ) ) ( not ( = ?auto_213279 ?auto_213283 ) ) ( not ( = ?auto_213280 ?auto_213281 ) ) ( not ( = ?auto_213280 ?auto_213283 ) ) ( not ( = ?auto_213281 ?auto_213283 ) ) ( CLEAR ?auto_213282 ) ( not ( = ?auto_213277 ?auto_213284 ) ) ( not ( = ?auto_213277 ?auto_213282 ) ) ( not ( = ?auto_213278 ?auto_213284 ) ) ( not ( = ?auto_213278 ?auto_213282 ) ) ( not ( = ?auto_213279 ?auto_213284 ) ) ( not ( = ?auto_213279 ?auto_213282 ) ) ( not ( = ?auto_213280 ?auto_213284 ) ) ( not ( = ?auto_213280 ?auto_213282 ) ) ( not ( = ?auto_213281 ?auto_213284 ) ) ( not ( = ?auto_213281 ?auto_213282 ) ) ( not ( = ?auto_213283 ?auto_213284 ) ) ( not ( = ?auto_213283 ?auto_213282 ) ) ( not ( = ?auto_213284 ?auto_213282 ) ) ( ON ?auto_213284 ?auto_213283 ) ( CLEAR ?auto_213284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213277 ?auto_213278 ?auto_213279 ?auto_213280 ?auto_213281 ?auto_213283 )
      ( MAKE-5PILE ?auto_213277 ?auto_213278 ?auto_213279 ?auto_213280 ?auto_213281 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213285 - BLOCK
      ?auto_213286 - BLOCK
      ?auto_213287 - BLOCK
      ?auto_213288 - BLOCK
      ?auto_213289 - BLOCK
    )
    :vars
    (
      ?auto_213292 - BLOCK
      ?auto_213290 - BLOCK
      ?auto_213291 - BLOCK
      ?auto_213293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213292 ?auto_213289 ) ( ON-TABLE ?auto_213285 ) ( ON ?auto_213286 ?auto_213285 ) ( ON ?auto_213287 ?auto_213286 ) ( ON ?auto_213288 ?auto_213287 ) ( ON ?auto_213289 ?auto_213288 ) ( not ( = ?auto_213285 ?auto_213286 ) ) ( not ( = ?auto_213285 ?auto_213287 ) ) ( not ( = ?auto_213285 ?auto_213288 ) ) ( not ( = ?auto_213285 ?auto_213289 ) ) ( not ( = ?auto_213285 ?auto_213292 ) ) ( not ( = ?auto_213286 ?auto_213287 ) ) ( not ( = ?auto_213286 ?auto_213288 ) ) ( not ( = ?auto_213286 ?auto_213289 ) ) ( not ( = ?auto_213286 ?auto_213292 ) ) ( not ( = ?auto_213287 ?auto_213288 ) ) ( not ( = ?auto_213287 ?auto_213289 ) ) ( not ( = ?auto_213287 ?auto_213292 ) ) ( not ( = ?auto_213288 ?auto_213289 ) ) ( not ( = ?auto_213288 ?auto_213292 ) ) ( not ( = ?auto_213289 ?auto_213292 ) ) ( not ( = ?auto_213285 ?auto_213290 ) ) ( not ( = ?auto_213285 ?auto_213291 ) ) ( not ( = ?auto_213286 ?auto_213290 ) ) ( not ( = ?auto_213286 ?auto_213291 ) ) ( not ( = ?auto_213287 ?auto_213290 ) ) ( not ( = ?auto_213287 ?auto_213291 ) ) ( not ( = ?auto_213288 ?auto_213290 ) ) ( not ( = ?auto_213288 ?auto_213291 ) ) ( not ( = ?auto_213289 ?auto_213290 ) ) ( not ( = ?auto_213289 ?auto_213291 ) ) ( not ( = ?auto_213292 ?auto_213290 ) ) ( not ( = ?auto_213292 ?auto_213291 ) ) ( not ( = ?auto_213290 ?auto_213291 ) ) ( ON ?auto_213290 ?auto_213292 ) ( CLEAR ?auto_213290 ) ( HOLDING ?auto_213291 ) ( CLEAR ?auto_213293 ) ( ON-TABLE ?auto_213293 ) ( not ( = ?auto_213293 ?auto_213291 ) ) ( not ( = ?auto_213285 ?auto_213293 ) ) ( not ( = ?auto_213286 ?auto_213293 ) ) ( not ( = ?auto_213287 ?auto_213293 ) ) ( not ( = ?auto_213288 ?auto_213293 ) ) ( not ( = ?auto_213289 ?auto_213293 ) ) ( not ( = ?auto_213292 ?auto_213293 ) ) ( not ( = ?auto_213290 ?auto_213293 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213293 ?auto_213291 )
      ( MAKE-5PILE ?auto_213285 ?auto_213286 ?auto_213287 ?auto_213288 ?auto_213289 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213294 - BLOCK
      ?auto_213295 - BLOCK
      ?auto_213296 - BLOCK
      ?auto_213297 - BLOCK
      ?auto_213298 - BLOCK
    )
    :vars
    (
      ?auto_213301 - BLOCK
      ?auto_213300 - BLOCK
      ?auto_213299 - BLOCK
      ?auto_213302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213301 ?auto_213298 ) ( ON-TABLE ?auto_213294 ) ( ON ?auto_213295 ?auto_213294 ) ( ON ?auto_213296 ?auto_213295 ) ( ON ?auto_213297 ?auto_213296 ) ( ON ?auto_213298 ?auto_213297 ) ( not ( = ?auto_213294 ?auto_213295 ) ) ( not ( = ?auto_213294 ?auto_213296 ) ) ( not ( = ?auto_213294 ?auto_213297 ) ) ( not ( = ?auto_213294 ?auto_213298 ) ) ( not ( = ?auto_213294 ?auto_213301 ) ) ( not ( = ?auto_213295 ?auto_213296 ) ) ( not ( = ?auto_213295 ?auto_213297 ) ) ( not ( = ?auto_213295 ?auto_213298 ) ) ( not ( = ?auto_213295 ?auto_213301 ) ) ( not ( = ?auto_213296 ?auto_213297 ) ) ( not ( = ?auto_213296 ?auto_213298 ) ) ( not ( = ?auto_213296 ?auto_213301 ) ) ( not ( = ?auto_213297 ?auto_213298 ) ) ( not ( = ?auto_213297 ?auto_213301 ) ) ( not ( = ?auto_213298 ?auto_213301 ) ) ( not ( = ?auto_213294 ?auto_213300 ) ) ( not ( = ?auto_213294 ?auto_213299 ) ) ( not ( = ?auto_213295 ?auto_213300 ) ) ( not ( = ?auto_213295 ?auto_213299 ) ) ( not ( = ?auto_213296 ?auto_213300 ) ) ( not ( = ?auto_213296 ?auto_213299 ) ) ( not ( = ?auto_213297 ?auto_213300 ) ) ( not ( = ?auto_213297 ?auto_213299 ) ) ( not ( = ?auto_213298 ?auto_213300 ) ) ( not ( = ?auto_213298 ?auto_213299 ) ) ( not ( = ?auto_213301 ?auto_213300 ) ) ( not ( = ?auto_213301 ?auto_213299 ) ) ( not ( = ?auto_213300 ?auto_213299 ) ) ( ON ?auto_213300 ?auto_213301 ) ( CLEAR ?auto_213302 ) ( ON-TABLE ?auto_213302 ) ( not ( = ?auto_213302 ?auto_213299 ) ) ( not ( = ?auto_213294 ?auto_213302 ) ) ( not ( = ?auto_213295 ?auto_213302 ) ) ( not ( = ?auto_213296 ?auto_213302 ) ) ( not ( = ?auto_213297 ?auto_213302 ) ) ( not ( = ?auto_213298 ?auto_213302 ) ) ( not ( = ?auto_213301 ?auto_213302 ) ) ( not ( = ?auto_213300 ?auto_213302 ) ) ( ON ?auto_213299 ?auto_213300 ) ( CLEAR ?auto_213299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213294 ?auto_213295 ?auto_213296 ?auto_213297 ?auto_213298 ?auto_213301 ?auto_213300 )
      ( MAKE-5PILE ?auto_213294 ?auto_213295 ?auto_213296 ?auto_213297 ?auto_213298 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213303 - BLOCK
      ?auto_213304 - BLOCK
      ?auto_213305 - BLOCK
      ?auto_213306 - BLOCK
      ?auto_213307 - BLOCK
    )
    :vars
    (
      ?auto_213310 - BLOCK
      ?auto_213311 - BLOCK
      ?auto_213308 - BLOCK
      ?auto_213309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213310 ?auto_213307 ) ( ON-TABLE ?auto_213303 ) ( ON ?auto_213304 ?auto_213303 ) ( ON ?auto_213305 ?auto_213304 ) ( ON ?auto_213306 ?auto_213305 ) ( ON ?auto_213307 ?auto_213306 ) ( not ( = ?auto_213303 ?auto_213304 ) ) ( not ( = ?auto_213303 ?auto_213305 ) ) ( not ( = ?auto_213303 ?auto_213306 ) ) ( not ( = ?auto_213303 ?auto_213307 ) ) ( not ( = ?auto_213303 ?auto_213310 ) ) ( not ( = ?auto_213304 ?auto_213305 ) ) ( not ( = ?auto_213304 ?auto_213306 ) ) ( not ( = ?auto_213304 ?auto_213307 ) ) ( not ( = ?auto_213304 ?auto_213310 ) ) ( not ( = ?auto_213305 ?auto_213306 ) ) ( not ( = ?auto_213305 ?auto_213307 ) ) ( not ( = ?auto_213305 ?auto_213310 ) ) ( not ( = ?auto_213306 ?auto_213307 ) ) ( not ( = ?auto_213306 ?auto_213310 ) ) ( not ( = ?auto_213307 ?auto_213310 ) ) ( not ( = ?auto_213303 ?auto_213311 ) ) ( not ( = ?auto_213303 ?auto_213308 ) ) ( not ( = ?auto_213304 ?auto_213311 ) ) ( not ( = ?auto_213304 ?auto_213308 ) ) ( not ( = ?auto_213305 ?auto_213311 ) ) ( not ( = ?auto_213305 ?auto_213308 ) ) ( not ( = ?auto_213306 ?auto_213311 ) ) ( not ( = ?auto_213306 ?auto_213308 ) ) ( not ( = ?auto_213307 ?auto_213311 ) ) ( not ( = ?auto_213307 ?auto_213308 ) ) ( not ( = ?auto_213310 ?auto_213311 ) ) ( not ( = ?auto_213310 ?auto_213308 ) ) ( not ( = ?auto_213311 ?auto_213308 ) ) ( ON ?auto_213311 ?auto_213310 ) ( not ( = ?auto_213309 ?auto_213308 ) ) ( not ( = ?auto_213303 ?auto_213309 ) ) ( not ( = ?auto_213304 ?auto_213309 ) ) ( not ( = ?auto_213305 ?auto_213309 ) ) ( not ( = ?auto_213306 ?auto_213309 ) ) ( not ( = ?auto_213307 ?auto_213309 ) ) ( not ( = ?auto_213310 ?auto_213309 ) ) ( not ( = ?auto_213311 ?auto_213309 ) ) ( ON ?auto_213308 ?auto_213311 ) ( CLEAR ?auto_213308 ) ( HOLDING ?auto_213309 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213309 )
      ( MAKE-5PILE ?auto_213303 ?auto_213304 ?auto_213305 ?auto_213306 ?auto_213307 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213312 - BLOCK
      ?auto_213313 - BLOCK
      ?auto_213314 - BLOCK
      ?auto_213315 - BLOCK
      ?auto_213316 - BLOCK
    )
    :vars
    (
      ?auto_213318 - BLOCK
      ?auto_213320 - BLOCK
      ?auto_213319 - BLOCK
      ?auto_213317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213318 ?auto_213316 ) ( ON-TABLE ?auto_213312 ) ( ON ?auto_213313 ?auto_213312 ) ( ON ?auto_213314 ?auto_213313 ) ( ON ?auto_213315 ?auto_213314 ) ( ON ?auto_213316 ?auto_213315 ) ( not ( = ?auto_213312 ?auto_213313 ) ) ( not ( = ?auto_213312 ?auto_213314 ) ) ( not ( = ?auto_213312 ?auto_213315 ) ) ( not ( = ?auto_213312 ?auto_213316 ) ) ( not ( = ?auto_213312 ?auto_213318 ) ) ( not ( = ?auto_213313 ?auto_213314 ) ) ( not ( = ?auto_213313 ?auto_213315 ) ) ( not ( = ?auto_213313 ?auto_213316 ) ) ( not ( = ?auto_213313 ?auto_213318 ) ) ( not ( = ?auto_213314 ?auto_213315 ) ) ( not ( = ?auto_213314 ?auto_213316 ) ) ( not ( = ?auto_213314 ?auto_213318 ) ) ( not ( = ?auto_213315 ?auto_213316 ) ) ( not ( = ?auto_213315 ?auto_213318 ) ) ( not ( = ?auto_213316 ?auto_213318 ) ) ( not ( = ?auto_213312 ?auto_213320 ) ) ( not ( = ?auto_213312 ?auto_213319 ) ) ( not ( = ?auto_213313 ?auto_213320 ) ) ( not ( = ?auto_213313 ?auto_213319 ) ) ( not ( = ?auto_213314 ?auto_213320 ) ) ( not ( = ?auto_213314 ?auto_213319 ) ) ( not ( = ?auto_213315 ?auto_213320 ) ) ( not ( = ?auto_213315 ?auto_213319 ) ) ( not ( = ?auto_213316 ?auto_213320 ) ) ( not ( = ?auto_213316 ?auto_213319 ) ) ( not ( = ?auto_213318 ?auto_213320 ) ) ( not ( = ?auto_213318 ?auto_213319 ) ) ( not ( = ?auto_213320 ?auto_213319 ) ) ( ON ?auto_213320 ?auto_213318 ) ( not ( = ?auto_213317 ?auto_213319 ) ) ( not ( = ?auto_213312 ?auto_213317 ) ) ( not ( = ?auto_213313 ?auto_213317 ) ) ( not ( = ?auto_213314 ?auto_213317 ) ) ( not ( = ?auto_213315 ?auto_213317 ) ) ( not ( = ?auto_213316 ?auto_213317 ) ) ( not ( = ?auto_213318 ?auto_213317 ) ) ( not ( = ?auto_213320 ?auto_213317 ) ) ( ON ?auto_213319 ?auto_213320 ) ( ON ?auto_213317 ?auto_213319 ) ( CLEAR ?auto_213317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213312 ?auto_213313 ?auto_213314 ?auto_213315 ?auto_213316 ?auto_213318 ?auto_213320 ?auto_213319 )
      ( MAKE-5PILE ?auto_213312 ?auto_213313 ?auto_213314 ?auto_213315 ?auto_213316 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213325 - BLOCK
      ?auto_213326 - BLOCK
      ?auto_213327 - BLOCK
      ?auto_213328 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_213328 ) ( CLEAR ?auto_213327 ) ( ON-TABLE ?auto_213325 ) ( ON ?auto_213326 ?auto_213325 ) ( ON ?auto_213327 ?auto_213326 ) ( not ( = ?auto_213325 ?auto_213326 ) ) ( not ( = ?auto_213325 ?auto_213327 ) ) ( not ( = ?auto_213325 ?auto_213328 ) ) ( not ( = ?auto_213326 ?auto_213327 ) ) ( not ( = ?auto_213326 ?auto_213328 ) ) ( not ( = ?auto_213327 ?auto_213328 ) ) )
    :subtasks
    ( ( !STACK ?auto_213328 ?auto_213327 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213329 - BLOCK
      ?auto_213330 - BLOCK
      ?auto_213331 - BLOCK
      ?auto_213332 - BLOCK
    )
    :vars
    (
      ?auto_213333 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_213331 ) ( ON-TABLE ?auto_213329 ) ( ON ?auto_213330 ?auto_213329 ) ( ON ?auto_213331 ?auto_213330 ) ( not ( = ?auto_213329 ?auto_213330 ) ) ( not ( = ?auto_213329 ?auto_213331 ) ) ( not ( = ?auto_213329 ?auto_213332 ) ) ( not ( = ?auto_213330 ?auto_213331 ) ) ( not ( = ?auto_213330 ?auto_213332 ) ) ( not ( = ?auto_213331 ?auto_213332 ) ) ( ON ?auto_213332 ?auto_213333 ) ( CLEAR ?auto_213332 ) ( HAND-EMPTY ) ( not ( = ?auto_213329 ?auto_213333 ) ) ( not ( = ?auto_213330 ?auto_213333 ) ) ( not ( = ?auto_213331 ?auto_213333 ) ) ( not ( = ?auto_213332 ?auto_213333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213332 ?auto_213333 )
      ( MAKE-4PILE ?auto_213329 ?auto_213330 ?auto_213331 ?auto_213332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213334 - BLOCK
      ?auto_213335 - BLOCK
      ?auto_213336 - BLOCK
      ?auto_213337 - BLOCK
    )
    :vars
    (
      ?auto_213338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213334 ) ( ON ?auto_213335 ?auto_213334 ) ( not ( = ?auto_213334 ?auto_213335 ) ) ( not ( = ?auto_213334 ?auto_213336 ) ) ( not ( = ?auto_213334 ?auto_213337 ) ) ( not ( = ?auto_213335 ?auto_213336 ) ) ( not ( = ?auto_213335 ?auto_213337 ) ) ( not ( = ?auto_213336 ?auto_213337 ) ) ( ON ?auto_213337 ?auto_213338 ) ( CLEAR ?auto_213337 ) ( not ( = ?auto_213334 ?auto_213338 ) ) ( not ( = ?auto_213335 ?auto_213338 ) ) ( not ( = ?auto_213336 ?auto_213338 ) ) ( not ( = ?auto_213337 ?auto_213338 ) ) ( HOLDING ?auto_213336 ) ( CLEAR ?auto_213335 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213334 ?auto_213335 ?auto_213336 )
      ( MAKE-4PILE ?auto_213334 ?auto_213335 ?auto_213336 ?auto_213337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213339 - BLOCK
      ?auto_213340 - BLOCK
      ?auto_213341 - BLOCK
      ?auto_213342 - BLOCK
    )
    :vars
    (
      ?auto_213343 - BLOCK
      ?auto_213344 - BLOCK
      ?auto_213345 - BLOCK
      ?auto_213346 - BLOCK
      ?auto_213347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213339 ) ( ON ?auto_213340 ?auto_213339 ) ( not ( = ?auto_213339 ?auto_213340 ) ) ( not ( = ?auto_213339 ?auto_213341 ) ) ( not ( = ?auto_213339 ?auto_213342 ) ) ( not ( = ?auto_213340 ?auto_213341 ) ) ( not ( = ?auto_213340 ?auto_213342 ) ) ( not ( = ?auto_213341 ?auto_213342 ) ) ( ON ?auto_213342 ?auto_213343 ) ( not ( = ?auto_213339 ?auto_213343 ) ) ( not ( = ?auto_213340 ?auto_213343 ) ) ( not ( = ?auto_213341 ?auto_213343 ) ) ( not ( = ?auto_213342 ?auto_213343 ) ) ( CLEAR ?auto_213340 ) ( ON ?auto_213341 ?auto_213342 ) ( CLEAR ?auto_213341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213344 ) ( ON ?auto_213345 ?auto_213344 ) ( ON ?auto_213346 ?auto_213345 ) ( ON ?auto_213347 ?auto_213346 ) ( ON ?auto_213343 ?auto_213347 ) ( not ( = ?auto_213344 ?auto_213345 ) ) ( not ( = ?auto_213344 ?auto_213346 ) ) ( not ( = ?auto_213344 ?auto_213347 ) ) ( not ( = ?auto_213344 ?auto_213343 ) ) ( not ( = ?auto_213344 ?auto_213342 ) ) ( not ( = ?auto_213344 ?auto_213341 ) ) ( not ( = ?auto_213345 ?auto_213346 ) ) ( not ( = ?auto_213345 ?auto_213347 ) ) ( not ( = ?auto_213345 ?auto_213343 ) ) ( not ( = ?auto_213345 ?auto_213342 ) ) ( not ( = ?auto_213345 ?auto_213341 ) ) ( not ( = ?auto_213346 ?auto_213347 ) ) ( not ( = ?auto_213346 ?auto_213343 ) ) ( not ( = ?auto_213346 ?auto_213342 ) ) ( not ( = ?auto_213346 ?auto_213341 ) ) ( not ( = ?auto_213347 ?auto_213343 ) ) ( not ( = ?auto_213347 ?auto_213342 ) ) ( not ( = ?auto_213347 ?auto_213341 ) ) ( not ( = ?auto_213339 ?auto_213344 ) ) ( not ( = ?auto_213339 ?auto_213345 ) ) ( not ( = ?auto_213339 ?auto_213346 ) ) ( not ( = ?auto_213339 ?auto_213347 ) ) ( not ( = ?auto_213340 ?auto_213344 ) ) ( not ( = ?auto_213340 ?auto_213345 ) ) ( not ( = ?auto_213340 ?auto_213346 ) ) ( not ( = ?auto_213340 ?auto_213347 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213344 ?auto_213345 ?auto_213346 ?auto_213347 ?auto_213343 ?auto_213342 )
      ( MAKE-4PILE ?auto_213339 ?auto_213340 ?auto_213341 ?auto_213342 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213348 - BLOCK
      ?auto_213349 - BLOCK
      ?auto_213350 - BLOCK
      ?auto_213351 - BLOCK
    )
    :vars
    (
      ?auto_213355 - BLOCK
      ?auto_213353 - BLOCK
      ?auto_213354 - BLOCK
      ?auto_213356 - BLOCK
      ?auto_213352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213348 ) ( not ( = ?auto_213348 ?auto_213349 ) ) ( not ( = ?auto_213348 ?auto_213350 ) ) ( not ( = ?auto_213348 ?auto_213351 ) ) ( not ( = ?auto_213349 ?auto_213350 ) ) ( not ( = ?auto_213349 ?auto_213351 ) ) ( not ( = ?auto_213350 ?auto_213351 ) ) ( ON ?auto_213351 ?auto_213355 ) ( not ( = ?auto_213348 ?auto_213355 ) ) ( not ( = ?auto_213349 ?auto_213355 ) ) ( not ( = ?auto_213350 ?auto_213355 ) ) ( not ( = ?auto_213351 ?auto_213355 ) ) ( ON ?auto_213350 ?auto_213351 ) ( CLEAR ?auto_213350 ) ( ON-TABLE ?auto_213353 ) ( ON ?auto_213354 ?auto_213353 ) ( ON ?auto_213356 ?auto_213354 ) ( ON ?auto_213352 ?auto_213356 ) ( ON ?auto_213355 ?auto_213352 ) ( not ( = ?auto_213353 ?auto_213354 ) ) ( not ( = ?auto_213353 ?auto_213356 ) ) ( not ( = ?auto_213353 ?auto_213352 ) ) ( not ( = ?auto_213353 ?auto_213355 ) ) ( not ( = ?auto_213353 ?auto_213351 ) ) ( not ( = ?auto_213353 ?auto_213350 ) ) ( not ( = ?auto_213354 ?auto_213356 ) ) ( not ( = ?auto_213354 ?auto_213352 ) ) ( not ( = ?auto_213354 ?auto_213355 ) ) ( not ( = ?auto_213354 ?auto_213351 ) ) ( not ( = ?auto_213354 ?auto_213350 ) ) ( not ( = ?auto_213356 ?auto_213352 ) ) ( not ( = ?auto_213356 ?auto_213355 ) ) ( not ( = ?auto_213356 ?auto_213351 ) ) ( not ( = ?auto_213356 ?auto_213350 ) ) ( not ( = ?auto_213352 ?auto_213355 ) ) ( not ( = ?auto_213352 ?auto_213351 ) ) ( not ( = ?auto_213352 ?auto_213350 ) ) ( not ( = ?auto_213348 ?auto_213353 ) ) ( not ( = ?auto_213348 ?auto_213354 ) ) ( not ( = ?auto_213348 ?auto_213356 ) ) ( not ( = ?auto_213348 ?auto_213352 ) ) ( not ( = ?auto_213349 ?auto_213353 ) ) ( not ( = ?auto_213349 ?auto_213354 ) ) ( not ( = ?auto_213349 ?auto_213356 ) ) ( not ( = ?auto_213349 ?auto_213352 ) ) ( HOLDING ?auto_213349 ) ( CLEAR ?auto_213348 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213348 ?auto_213349 )
      ( MAKE-4PILE ?auto_213348 ?auto_213349 ?auto_213350 ?auto_213351 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213357 - BLOCK
      ?auto_213358 - BLOCK
      ?auto_213359 - BLOCK
      ?auto_213360 - BLOCK
    )
    :vars
    (
      ?auto_213364 - BLOCK
      ?auto_213362 - BLOCK
      ?auto_213361 - BLOCK
      ?auto_213365 - BLOCK
      ?auto_213363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213357 ) ( not ( = ?auto_213357 ?auto_213358 ) ) ( not ( = ?auto_213357 ?auto_213359 ) ) ( not ( = ?auto_213357 ?auto_213360 ) ) ( not ( = ?auto_213358 ?auto_213359 ) ) ( not ( = ?auto_213358 ?auto_213360 ) ) ( not ( = ?auto_213359 ?auto_213360 ) ) ( ON ?auto_213360 ?auto_213364 ) ( not ( = ?auto_213357 ?auto_213364 ) ) ( not ( = ?auto_213358 ?auto_213364 ) ) ( not ( = ?auto_213359 ?auto_213364 ) ) ( not ( = ?auto_213360 ?auto_213364 ) ) ( ON ?auto_213359 ?auto_213360 ) ( ON-TABLE ?auto_213362 ) ( ON ?auto_213361 ?auto_213362 ) ( ON ?auto_213365 ?auto_213361 ) ( ON ?auto_213363 ?auto_213365 ) ( ON ?auto_213364 ?auto_213363 ) ( not ( = ?auto_213362 ?auto_213361 ) ) ( not ( = ?auto_213362 ?auto_213365 ) ) ( not ( = ?auto_213362 ?auto_213363 ) ) ( not ( = ?auto_213362 ?auto_213364 ) ) ( not ( = ?auto_213362 ?auto_213360 ) ) ( not ( = ?auto_213362 ?auto_213359 ) ) ( not ( = ?auto_213361 ?auto_213365 ) ) ( not ( = ?auto_213361 ?auto_213363 ) ) ( not ( = ?auto_213361 ?auto_213364 ) ) ( not ( = ?auto_213361 ?auto_213360 ) ) ( not ( = ?auto_213361 ?auto_213359 ) ) ( not ( = ?auto_213365 ?auto_213363 ) ) ( not ( = ?auto_213365 ?auto_213364 ) ) ( not ( = ?auto_213365 ?auto_213360 ) ) ( not ( = ?auto_213365 ?auto_213359 ) ) ( not ( = ?auto_213363 ?auto_213364 ) ) ( not ( = ?auto_213363 ?auto_213360 ) ) ( not ( = ?auto_213363 ?auto_213359 ) ) ( not ( = ?auto_213357 ?auto_213362 ) ) ( not ( = ?auto_213357 ?auto_213361 ) ) ( not ( = ?auto_213357 ?auto_213365 ) ) ( not ( = ?auto_213357 ?auto_213363 ) ) ( not ( = ?auto_213358 ?auto_213362 ) ) ( not ( = ?auto_213358 ?auto_213361 ) ) ( not ( = ?auto_213358 ?auto_213365 ) ) ( not ( = ?auto_213358 ?auto_213363 ) ) ( CLEAR ?auto_213357 ) ( ON ?auto_213358 ?auto_213359 ) ( CLEAR ?auto_213358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213362 ?auto_213361 ?auto_213365 ?auto_213363 ?auto_213364 ?auto_213360 ?auto_213359 )
      ( MAKE-4PILE ?auto_213357 ?auto_213358 ?auto_213359 ?auto_213360 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213366 - BLOCK
      ?auto_213367 - BLOCK
      ?auto_213368 - BLOCK
      ?auto_213369 - BLOCK
    )
    :vars
    (
      ?auto_213371 - BLOCK
      ?auto_213370 - BLOCK
      ?auto_213373 - BLOCK
      ?auto_213374 - BLOCK
      ?auto_213372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213366 ?auto_213367 ) ) ( not ( = ?auto_213366 ?auto_213368 ) ) ( not ( = ?auto_213366 ?auto_213369 ) ) ( not ( = ?auto_213367 ?auto_213368 ) ) ( not ( = ?auto_213367 ?auto_213369 ) ) ( not ( = ?auto_213368 ?auto_213369 ) ) ( ON ?auto_213369 ?auto_213371 ) ( not ( = ?auto_213366 ?auto_213371 ) ) ( not ( = ?auto_213367 ?auto_213371 ) ) ( not ( = ?auto_213368 ?auto_213371 ) ) ( not ( = ?auto_213369 ?auto_213371 ) ) ( ON ?auto_213368 ?auto_213369 ) ( ON-TABLE ?auto_213370 ) ( ON ?auto_213373 ?auto_213370 ) ( ON ?auto_213374 ?auto_213373 ) ( ON ?auto_213372 ?auto_213374 ) ( ON ?auto_213371 ?auto_213372 ) ( not ( = ?auto_213370 ?auto_213373 ) ) ( not ( = ?auto_213370 ?auto_213374 ) ) ( not ( = ?auto_213370 ?auto_213372 ) ) ( not ( = ?auto_213370 ?auto_213371 ) ) ( not ( = ?auto_213370 ?auto_213369 ) ) ( not ( = ?auto_213370 ?auto_213368 ) ) ( not ( = ?auto_213373 ?auto_213374 ) ) ( not ( = ?auto_213373 ?auto_213372 ) ) ( not ( = ?auto_213373 ?auto_213371 ) ) ( not ( = ?auto_213373 ?auto_213369 ) ) ( not ( = ?auto_213373 ?auto_213368 ) ) ( not ( = ?auto_213374 ?auto_213372 ) ) ( not ( = ?auto_213374 ?auto_213371 ) ) ( not ( = ?auto_213374 ?auto_213369 ) ) ( not ( = ?auto_213374 ?auto_213368 ) ) ( not ( = ?auto_213372 ?auto_213371 ) ) ( not ( = ?auto_213372 ?auto_213369 ) ) ( not ( = ?auto_213372 ?auto_213368 ) ) ( not ( = ?auto_213366 ?auto_213370 ) ) ( not ( = ?auto_213366 ?auto_213373 ) ) ( not ( = ?auto_213366 ?auto_213374 ) ) ( not ( = ?auto_213366 ?auto_213372 ) ) ( not ( = ?auto_213367 ?auto_213370 ) ) ( not ( = ?auto_213367 ?auto_213373 ) ) ( not ( = ?auto_213367 ?auto_213374 ) ) ( not ( = ?auto_213367 ?auto_213372 ) ) ( ON ?auto_213367 ?auto_213368 ) ( CLEAR ?auto_213367 ) ( HOLDING ?auto_213366 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213366 )
      ( MAKE-4PILE ?auto_213366 ?auto_213367 ?auto_213368 ?auto_213369 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213375 - BLOCK
      ?auto_213376 - BLOCK
      ?auto_213377 - BLOCK
      ?auto_213378 - BLOCK
    )
    :vars
    (
      ?auto_213380 - BLOCK
      ?auto_213379 - BLOCK
      ?auto_213381 - BLOCK
      ?auto_213383 - BLOCK
      ?auto_213382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213375 ?auto_213376 ) ) ( not ( = ?auto_213375 ?auto_213377 ) ) ( not ( = ?auto_213375 ?auto_213378 ) ) ( not ( = ?auto_213376 ?auto_213377 ) ) ( not ( = ?auto_213376 ?auto_213378 ) ) ( not ( = ?auto_213377 ?auto_213378 ) ) ( ON ?auto_213378 ?auto_213380 ) ( not ( = ?auto_213375 ?auto_213380 ) ) ( not ( = ?auto_213376 ?auto_213380 ) ) ( not ( = ?auto_213377 ?auto_213380 ) ) ( not ( = ?auto_213378 ?auto_213380 ) ) ( ON ?auto_213377 ?auto_213378 ) ( ON-TABLE ?auto_213379 ) ( ON ?auto_213381 ?auto_213379 ) ( ON ?auto_213383 ?auto_213381 ) ( ON ?auto_213382 ?auto_213383 ) ( ON ?auto_213380 ?auto_213382 ) ( not ( = ?auto_213379 ?auto_213381 ) ) ( not ( = ?auto_213379 ?auto_213383 ) ) ( not ( = ?auto_213379 ?auto_213382 ) ) ( not ( = ?auto_213379 ?auto_213380 ) ) ( not ( = ?auto_213379 ?auto_213378 ) ) ( not ( = ?auto_213379 ?auto_213377 ) ) ( not ( = ?auto_213381 ?auto_213383 ) ) ( not ( = ?auto_213381 ?auto_213382 ) ) ( not ( = ?auto_213381 ?auto_213380 ) ) ( not ( = ?auto_213381 ?auto_213378 ) ) ( not ( = ?auto_213381 ?auto_213377 ) ) ( not ( = ?auto_213383 ?auto_213382 ) ) ( not ( = ?auto_213383 ?auto_213380 ) ) ( not ( = ?auto_213383 ?auto_213378 ) ) ( not ( = ?auto_213383 ?auto_213377 ) ) ( not ( = ?auto_213382 ?auto_213380 ) ) ( not ( = ?auto_213382 ?auto_213378 ) ) ( not ( = ?auto_213382 ?auto_213377 ) ) ( not ( = ?auto_213375 ?auto_213379 ) ) ( not ( = ?auto_213375 ?auto_213381 ) ) ( not ( = ?auto_213375 ?auto_213383 ) ) ( not ( = ?auto_213375 ?auto_213382 ) ) ( not ( = ?auto_213376 ?auto_213379 ) ) ( not ( = ?auto_213376 ?auto_213381 ) ) ( not ( = ?auto_213376 ?auto_213383 ) ) ( not ( = ?auto_213376 ?auto_213382 ) ) ( ON ?auto_213376 ?auto_213377 ) ( ON ?auto_213375 ?auto_213376 ) ( CLEAR ?auto_213375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213379 ?auto_213381 ?auto_213383 ?auto_213382 ?auto_213380 ?auto_213378 ?auto_213377 ?auto_213376 )
      ( MAKE-4PILE ?auto_213375 ?auto_213376 ?auto_213377 ?auto_213378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213388 - BLOCK
      ?auto_213389 - BLOCK
      ?auto_213390 - BLOCK
      ?auto_213391 - BLOCK
    )
    :vars
    (
      ?auto_213392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213392 ?auto_213391 ) ( CLEAR ?auto_213392 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213388 ) ( ON ?auto_213389 ?auto_213388 ) ( ON ?auto_213390 ?auto_213389 ) ( ON ?auto_213391 ?auto_213390 ) ( not ( = ?auto_213388 ?auto_213389 ) ) ( not ( = ?auto_213388 ?auto_213390 ) ) ( not ( = ?auto_213388 ?auto_213391 ) ) ( not ( = ?auto_213388 ?auto_213392 ) ) ( not ( = ?auto_213389 ?auto_213390 ) ) ( not ( = ?auto_213389 ?auto_213391 ) ) ( not ( = ?auto_213389 ?auto_213392 ) ) ( not ( = ?auto_213390 ?auto_213391 ) ) ( not ( = ?auto_213390 ?auto_213392 ) ) ( not ( = ?auto_213391 ?auto_213392 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213392 ?auto_213391 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213393 - BLOCK
      ?auto_213394 - BLOCK
      ?auto_213395 - BLOCK
      ?auto_213396 - BLOCK
    )
    :vars
    (
      ?auto_213397 - BLOCK
      ?auto_213398 - BLOCK
      ?auto_213399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213397 ?auto_213396 ) ( CLEAR ?auto_213397 ) ( ON-TABLE ?auto_213393 ) ( ON ?auto_213394 ?auto_213393 ) ( ON ?auto_213395 ?auto_213394 ) ( ON ?auto_213396 ?auto_213395 ) ( not ( = ?auto_213393 ?auto_213394 ) ) ( not ( = ?auto_213393 ?auto_213395 ) ) ( not ( = ?auto_213393 ?auto_213396 ) ) ( not ( = ?auto_213393 ?auto_213397 ) ) ( not ( = ?auto_213394 ?auto_213395 ) ) ( not ( = ?auto_213394 ?auto_213396 ) ) ( not ( = ?auto_213394 ?auto_213397 ) ) ( not ( = ?auto_213395 ?auto_213396 ) ) ( not ( = ?auto_213395 ?auto_213397 ) ) ( not ( = ?auto_213396 ?auto_213397 ) ) ( HOLDING ?auto_213398 ) ( CLEAR ?auto_213399 ) ( not ( = ?auto_213393 ?auto_213398 ) ) ( not ( = ?auto_213393 ?auto_213399 ) ) ( not ( = ?auto_213394 ?auto_213398 ) ) ( not ( = ?auto_213394 ?auto_213399 ) ) ( not ( = ?auto_213395 ?auto_213398 ) ) ( not ( = ?auto_213395 ?auto_213399 ) ) ( not ( = ?auto_213396 ?auto_213398 ) ) ( not ( = ?auto_213396 ?auto_213399 ) ) ( not ( = ?auto_213397 ?auto_213398 ) ) ( not ( = ?auto_213397 ?auto_213399 ) ) ( not ( = ?auto_213398 ?auto_213399 ) ) )
    :subtasks
    ( ( !STACK ?auto_213398 ?auto_213399 )
      ( MAKE-4PILE ?auto_213393 ?auto_213394 ?auto_213395 ?auto_213396 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213400 - BLOCK
      ?auto_213401 - BLOCK
      ?auto_213402 - BLOCK
      ?auto_213403 - BLOCK
    )
    :vars
    (
      ?auto_213406 - BLOCK
      ?auto_213405 - BLOCK
      ?auto_213404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213406 ?auto_213403 ) ( ON-TABLE ?auto_213400 ) ( ON ?auto_213401 ?auto_213400 ) ( ON ?auto_213402 ?auto_213401 ) ( ON ?auto_213403 ?auto_213402 ) ( not ( = ?auto_213400 ?auto_213401 ) ) ( not ( = ?auto_213400 ?auto_213402 ) ) ( not ( = ?auto_213400 ?auto_213403 ) ) ( not ( = ?auto_213400 ?auto_213406 ) ) ( not ( = ?auto_213401 ?auto_213402 ) ) ( not ( = ?auto_213401 ?auto_213403 ) ) ( not ( = ?auto_213401 ?auto_213406 ) ) ( not ( = ?auto_213402 ?auto_213403 ) ) ( not ( = ?auto_213402 ?auto_213406 ) ) ( not ( = ?auto_213403 ?auto_213406 ) ) ( CLEAR ?auto_213405 ) ( not ( = ?auto_213400 ?auto_213404 ) ) ( not ( = ?auto_213400 ?auto_213405 ) ) ( not ( = ?auto_213401 ?auto_213404 ) ) ( not ( = ?auto_213401 ?auto_213405 ) ) ( not ( = ?auto_213402 ?auto_213404 ) ) ( not ( = ?auto_213402 ?auto_213405 ) ) ( not ( = ?auto_213403 ?auto_213404 ) ) ( not ( = ?auto_213403 ?auto_213405 ) ) ( not ( = ?auto_213406 ?auto_213404 ) ) ( not ( = ?auto_213406 ?auto_213405 ) ) ( not ( = ?auto_213404 ?auto_213405 ) ) ( ON ?auto_213404 ?auto_213406 ) ( CLEAR ?auto_213404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213400 ?auto_213401 ?auto_213402 ?auto_213403 ?auto_213406 )
      ( MAKE-4PILE ?auto_213400 ?auto_213401 ?auto_213402 ?auto_213403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213407 - BLOCK
      ?auto_213408 - BLOCK
      ?auto_213409 - BLOCK
      ?auto_213410 - BLOCK
    )
    :vars
    (
      ?auto_213411 - BLOCK
      ?auto_213412 - BLOCK
      ?auto_213413 - BLOCK
      ?auto_213414 - BLOCK
      ?auto_213415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213411 ?auto_213410 ) ( ON-TABLE ?auto_213407 ) ( ON ?auto_213408 ?auto_213407 ) ( ON ?auto_213409 ?auto_213408 ) ( ON ?auto_213410 ?auto_213409 ) ( not ( = ?auto_213407 ?auto_213408 ) ) ( not ( = ?auto_213407 ?auto_213409 ) ) ( not ( = ?auto_213407 ?auto_213410 ) ) ( not ( = ?auto_213407 ?auto_213411 ) ) ( not ( = ?auto_213408 ?auto_213409 ) ) ( not ( = ?auto_213408 ?auto_213410 ) ) ( not ( = ?auto_213408 ?auto_213411 ) ) ( not ( = ?auto_213409 ?auto_213410 ) ) ( not ( = ?auto_213409 ?auto_213411 ) ) ( not ( = ?auto_213410 ?auto_213411 ) ) ( not ( = ?auto_213407 ?auto_213412 ) ) ( not ( = ?auto_213407 ?auto_213413 ) ) ( not ( = ?auto_213408 ?auto_213412 ) ) ( not ( = ?auto_213408 ?auto_213413 ) ) ( not ( = ?auto_213409 ?auto_213412 ) ) ( not ( = ?auto_213409 ?auto_213413 ) ) ( not ( = ?auto_213410 ?auto_213412 ) ) ( not ( = ?auto_213410 ?auto_213413 ) ) ( not ( = ?auto_213411 ?auto_213412 ) ) ( not ( = ?auto_213411 ?auto_213413 ) ) ( not ( = ?auto_213412 ?auto_213413 ) ) ( ON ?auto_213412 ?auto_213411 ) ( CLEAR ?auto_213412 ) ( HOLDING ?auto_213413 ) ( CLEAR ?auto_213414 ) ( ON-TABLE ?auto_213415 ) ( ON ?auto_213414 ?auto_213415 ) ( not ( = ?auto_213415 ?auto_213414 ) ) ( not ( = ?auto_213415 ?auto_213413 ) ) ( not ( = ?auto_213414 ?auto_213413 ) ) ( not ( = ?auto_213407 ?auto_213414 ) ) ( not ( = ?auto_213407 ?auto_213415 ) ) ( not ( = ?auto_213408 ?auto_213414 ) ) ( not ( = ?auto_213408 ?auto_213415 ) ) ( not ( = ?auto_213409 ?auto_213414 ) ) ( not ( = ?auto_213409 ?auto_213415 ) ) ( not ( = ?auto_213410 ?auto_213414 ) ) ( not ( = ?auto_213410 ?auto_213415 ) ) ( not ( = ?auto_213411 ?auto_213414 ) ) ( not ( = ?auto_213411 ?auto_213415 ) ) ( not ( = ?auto_213412 ?auto_213414 ) ) ( not ( = ?auto_213412 ?auto_213415 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213415 ?auto_213414 ?auto_213413 )
      ( MAKE-4PILE ?auto_213407 ?auto_213408 ?auto_213409 ?auto_213410 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213416 - BLOCK
      ?auto_213417 - BLOCK
      ?auto_213418 - BLOCK
      ?auto_213419 - BLOCK
    )
    :vars
    (
      ?auto_213423 - BLOCK
      ?auto_213424 - BLOCK
      ?auto_213422 - BLOCK
      ?auto_213421 - BLOCK
      ?auto_213420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213423 ?auto_213419 ) ( ON-TABLE ?auto_213416 ) ( ON ?auto_213417 ?auto_213416 ) ( ON ?auto_213418 ?auto_213417 ) ( ON ?auto_213419 ?auto_213418 ) ( not ( = ?auto_213416 ?auto_213417 ) ) ( not ( = ?auto_213416 ?auto_213418 ) ) ( not ( = ?auto_213416 ?auto_213419 ) ) ( not ( = ?auto_213416 ?auto_213423 ) ) ( not ( = ?auto_213417 ?auto_213418 ) ) ( not ( = ?auto_213417 ?auto_213419 ) ) ( not ( = ?auto_213417 ?auto_213423 ) ) ( not ( = ?auto_213418 ?auto_213419 ) ) ( not ( = ?auto_213418 ?auto_213423 ) ) ( not ( = ?auto_213419 ?auto_213423 ) ) ( not ( = ?auto_213416 ?auto_213424 ) ) ( not ( = ?auto_213416 ?auto_213422 ) ) ( not ( = ?auto_213417 ?auto_213424 ) ) ( not ( = ?auto_213417 ?auto_213422 ) ) ( not ( = ?auto_213418 ?auto_213424 ) ) ( not ( = ?auto_213418 ?auto_213422 ) ) ( not ( = ?auto_213419 ?auto_213424 ) ) ( not ( = ?auto_213419 ?auto_213422 ) ) ( not ( = ?auto_213423 ?auto_213424 ) ) ( not ( = ?auto_213423 ?auto_213422 ) ) ( not ( = ?auto_213424 ?auto_213422 ) ) ( ON ?auto_213424 ?auto_213423 ) ( CLEAR ?auto_213421 ) ( ON-TABLE ?auto_213420 ) ( ON ?auto_213421 ?auto_213420 ) ( not ( = ?auto_213420 ?auto_213421 ) ) ( not ( = ?auto_213420 ?auto_213422 ) ) ( not ( = ?auto_213421 ?auto_213422 ) ) ( not ( = ?auto_213416 ?auto_213421 ) ) ( not ( = ?auto_213416 ?auto_213420 ) ) ( not ( = ?auto_213417 ?auto_213421 ) ) ( not ( = ?auto_213417 ?auto_213420 ) ) ( not ( = ?auto_213418 ?auto_213421 ) ) ( not ( = ?auto_213418 ?auto_213420 ) ) ( not ( = ?auto_213419 ?auto_213421 ) ) ( not ( = ?auto_213419 ?auto_213420 ) ) ( not ( = ?auto_213423 ?auto_213421 ) ) ( not ( = ?auto_213423 ?auto_213420 ) ) ( not ( = ?auto_213424 ?auto_213421 ) ) ( not ( = ?auto_213424 ?auto_213420 ) ) ( ON ?auto_213422 ?auto_213424 ) ( CLEAR ?auto_213422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213416 ?auto_213417 ?auto_213418 ?auto_213419 ?auto_213423 ?auto_213424 )
      ( MAKE-4PILE ?auto_213416 ?auto_213417 ?auto_213418 ?auto_213419 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213425 - BLOCK
      ?auto_213426 - BLOCK
      ?auto_213427 - BLOCK
      ?auto_213428 - BLOCK
    )
    :vars
    (
      ?auto_213433 - BLOCK
      ?auto_213429 - BLOCK
      ?auto_213430 - BLOCK
      ?auto_213431 - BLOCK
      ?auto_213432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213433 ?auto_213428 ) ( ON-TABLE ?auto_213425 ) ( ON ?auto_213426 ?auto_213425 ) ( ON ?auto_213427 ?auto_213426 ) ( ON ?auto_213428 ?auto_213427 ) ( not ( = ?auto_213425 ?auto_213426 ) ) ( not ( = ?auto_213425 ?auto_213427 ) ) ( not ( = ?auto_213425 ?auto_213428 ) ) ( not ( = ?auto_213425 ?auto_213433 ) ) ( not ( = ?auto_213426 ?auto_213427 ) ) ( not ( = ?auto_213426 ?auto_213428 ) ) ( not ( = ?auto_213426 ?auto_213433 ) ) ( not ( = ?auto_213427 ?auto_213428 ) ) ( not ( = ?auto_213427 ?auto_213433 ) ) ( not ( = ?auto_213428 ?auto_213433 ) ) ( not ( = ?auto_213425 ?auto_213429 ) ) ( not ( = ?auto_213425 ?auto_213430 ) ) ( not ( = ?auto_213426 ?auto_213429 ) ) ( not ( = ?auto_213426 ?auto_213430 ) ) ( not ( = ?auto_213427 ?auto_213429 ) ) ( not ( = ?auto_213427 ?auto_213430 ) ) ( not ( = ?auto_213428 ?auto_213429 ) ) ( not ( = ?auto_213428 ?auto_213430 ) ) ( not ( = ?auto_213433 ?auto_213429 ) ) ( not ( = ?auto_213433 ?auto_213430 ) ) ( not ( = ?auto_213429 ?auto_213430 ) ) ( ON ?auto_213429 ?auto_213433 ) ( ON-TABLE ?auto_213431 ) ( not ( = ?auto_213431 ?auto_213432 ) ) ( not ( = ?auto_213431 ?auto_213430 ) ) ( not ( = ?auto_213432 ?auto_213430 ) ) ( not ( = ?auto_213425 ?auto_213432 ) ) ( not ( = ?auto_213425 ?auto_213431 ) ) ( not ( = ?auto_213426 ?auto_213432 ) ) ( not ( = ?auto_213426 ?auto_213431 ) ) ( not ( = ?auto_213427 ?auto_213432 ) ) ( not ( = ?auto_213427 ?auto_213431 ) ) ( not ( = ?auto_213428 ?auto_213432 ) ) ( not ( = ?auto_213428 ?auto_213431 ) ) ( not ( = ?auto_213433 ?auto_213432 ) ) ( not ( = ?auto_213433 ?auto_213431 ) ) ( not ( = ?auto_213429 ?auto_213432 ) ) ( not ( = ?auto_213429 ?auto_213431 ) ) ( ON ?auto_213430 ?auto_213429 ) ( CLEAR ?auto_213430 ) ( HOLDING ?auto_213432 ) ( CLEAR ?auto_213431 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213431 ?auto_213432 )
      ( MAKE-4PILE ?auto_213425 ?auto_213426 ?auto_213427 ?auto_213428 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213434 - BLOCK
      ?auto_213435 - BLOCK
      ?auto_213436 - BLOCK
      ?auto_213437 - BLOCK
    )
    :vars
    (
      ?auto_213438 - BLOCK
      ?auto_213439 - BLOCK
      ?auto_213440 - BLOCK
      ?auto_213442 - BLOCK
      ?auto_213441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213438 ?auto_213437 ) ( ON-TABLE ?auto_213434 ) ( ON ?auto_213435 ?auto_213434 ) ( ON ?auto_213436 ?auto_213435 ) ( ON ?auto_213437 ?auto_213436 ) ( not ( = ?auto_213434 ?auto_213435 ) ) ( not ( = ?auto_213434 ?auto_213436 ) ) ( not ( = ?auto_213434 ?auto_213437 ) ) ( not ( = ?auto_213434 ?auto_213438 ) ) ( not ( = ?auto_213435 ?auto_213436 ) ) ( not ( = ?auto_213435 ?auto_213437 ) ) ( not ( = ?auto_213435 ?auto_213438 ) ) ( not ( = ?auto_213436 ?auto_213437 ) ) ( not ( = ?auto_213436 ?auto_213438 ) ) ( not ( = ?auto_213437 ?auto_213438 ) ) ( not ( = ?auto_213434 ?auto_213439 ) ) ( not ( = ?auto_213434 ?auto_213440 ) ) ( not ( = ?auto_213435 ?auto_213439 ) ) ( not ( = ?auto_213435 ?auto_213440 ) ) ( not ( = ?auto_213436 ?auto_213439 ) ) ( not ( = ?auto_213436 ?auto_213440 ) ) ( not ( = ?auto_213437 ?auto_213439 ) ) ( not ( = ?auto_213437 ?auto_213440 ) ) ( not ( = ?auto_213438 ?auto_213439 ) ) ( not ( = ?auto_213438 ?auto_213440 ) ) ( not ( = ?auto_213439 ?auto_213440 ) ) ( ON ?auto_213439 ?auto_213438 ) ( ON-TABLE ?auto_213442 ) ( not ( = ?auto_213442 ?auto_213441 ) ) ( not ( = ?auto_213442 ?auto_213440 ) ) ( not ( = ?auto_213441 ?auto_213440 ) ) ( not ( = ?auto_213434 ?auto_213441 ) ) ( not ( = ?auto_213434 ?auto_213442 ) ) ( not ( = ?auto_213435 ?auto_213441 ) ) ( not ( = ?auto_213435 ?auto_213442 ) ) ( not ( = ?auto_213436 ?auto_213441 ) ) ( not ( = ?auto_213436 ?auto_213442 ) ) ( not ( = ?auto_213437 ?auto_213441 ) ) ( not ( = ?auto_213437 ?auto_213442 ) ) ( not ( = ?auto_213438 ?auto_213441 ) ) ( not ( = ?auto_213438 ?auto_213442 ) ) ( not ( = ?auto_213439 ?auto_213441 ) ) ( not ( = ?auto_213439 ?auto_213442 ) ) ( ON ?auto_213440 ?auto_213439 ) ( CLEAR ?auto_213442 ) ( ON ?auto_213441 ?auto_213440 ) ( CLEAR ?auto_213441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213434 ?auto_213435 ?auto_213436 ?auto_213437 ?auto_213438 ?auto_213439 ?auto_213440 )
      ( MAKE-4PILE ?auto_213434 ?auto_213435 ?auto_213436 ?auto_213437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213443 - BLOCK
      ?auto_213444 - BLOCK
      ?auto_213445 - BLOCK
      ?auto_213446 - BLOCK
    )
    :vars
    (
      ?auto_213447 - BLOCK
      ?auto_213448 - BLOCK
      ?auto_213450 - BLOCK
      ?auto_213449 - BLOCK
      ?auto_213451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213447 ?auto_213446 ) ( ON-TABLE ?auto_213443 ) ( ON ?auto_213444 ?auto_213443 ) ( ON ?auto_213445 ?auto_213444 ) ( ON ?auto_213446 ?auto_213445 ) ( not ( = ?auto_213443 ?auto_213444 ) ) ( not ( = ?auto_213443 ?auto_213445 ) ) ( not ( = ?auto_213443 ?auto_213446 ) ) ( not ( = ?auto_213443 ?auto_213447 ) ) ( not ( = ?auto_213444 ?auto_213445 ) ) ( not ( = ?auto_213444 ?auto_213446 ) ) ( not ( = ?auto_213444 ?auto_213447 ) ) ( not ( = ?auto_213445 ?auto_213446 ) ) ( not ( = ?auto_213445 ?auto_213447 ) ) ( not ( = ?auto_213446 ?auto_213447 ) ) ( not ( = ?auto_213443 ?auto_213448 ) ) ( not ( = ?auto_213443 ?auto_213450 ) ) ( not ( = ?auto_213444 ?auto_213448 ) ) ( not ( = ?auto_213444 ?auto_213450 ) ) ( not ( = ?auto_213445 ?auto_213448 ) ) ( not ( = ?auto_213445 ?auto_213450 ) ) ( not ( = ?auto_213446 ?auto_213448 ) ) ( not ( = ?auto_213446 ?auto_213450 ) ) ( not ( = ?auto_213447 ?auto_213448 ) ) ( not ( = ?auto_213447 ?auto_213450 ) ) ( not ( = ?auto_213448 ?auto_213450 ) ) ( ON ?auto_213448 ?auto_213447 ) ( not ( = ?auto_213449 ?auto_213451 ) ) ( not ( = ?auto_213449 ?auto_213450 ) ) ( not ( = ?auto_213451 ?auto_213450 ) ) ( not ( = ?auto_213443 ?auto_213451 ) ) ( not ( = ?auto_213443 ?auto_213449 ) ) ( not ( = ?auto_213444 ?auto_213451 ) ) ( not ( = ?auto_213444 ?auto_213449 ) ) ( not ( = ?auto_213445 ?auto_213451 ) ) ( not ( = ?auto_213445 ?auto_213449 ) ) ( not ( = ?auto_213446 ?auto_213451 ) ) ( not ( = ?auto_213446 ?auto_213449 ) ) ( not ( = ?auto_213447 ?auto_213451 ) ) ( not ( = ?auto_213447 ?auto_213449 ) ) ( not ( = ?auto_213448 ?auto_213451 ) ) ( not ( = ?auto_213448 ?auto_213449 ) ) ( ON ?auto_213450 ?auto_213448 ) ( ON ?auto_213451 ?auto_213450 ) ( CLEAR ?auto_213451 ) ( HOLDING ?auto_213449 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213449 )
      ( MAKE-4PILE ?auto_213443 ?auto_213444 ?auto_213445 ?auto_213446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_213452 - BLOCK
      ?auto_213453 - BLOCK
      ?auto_213454 - BLOCK
      ?auto_213455 - BLOCK
    )
    :vars
    (
      ?auto_213458 - BLOCK
      ?auto_213456 - BLOCK
      ?auto_213460 - BLOCK
      ?auto_213457 - BLOCK
      ?auto_213459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213458 ?auto_213455 ) ( ON-TABLE ?auto_213452 ) ( ON ?auto_213453 ?auto_213452 ) ( ON ?auto_213454 ?auto_213453 ) ( ON ?auto_213455 ?auto_213454 ) ( not ( = ?auto_213452 ?auto_213453 ) ) ( not ( = ?auto_213452 ?auto_213454 ) ) ( not ( = ?auto_213452 ?auto_213455 ) ) ( not ( = ?auto_213452 ?auto_213458 ) ) ( not ( = ?auto_213453 ?auto_213454 ) ) ( not ( = ?auto_213453 ?auto_213455 ) ) ( not ( = ?auto_213453 ?auto_213458 ) ) ( not ( = ?auto_213454 ?auto_213455 ) ) ( not ( = ?auto_213454 ?auto_213458 ) ) ( not ( = ?auto_213455 ?auto_213458 ) ) ( not ( = ?auto_213452 ?auto_213456 ) ) ( not ( = ?auto_213452 ?auto_213460 ) ) ( not ( = ?auto_213453 ?auto_213456 ) ) ( not ( = ?auto_213453 ?auto_213460 ) ) ( not ( = ?auto_213454 ?auto_213456 ) ) ( not ( = ?auto_213454 ?auto_213460 ) ) ( not ( = ?auto_213455 ?auto_213456 ) ) ( not ( = ?auto_213455 ?auto_213460 ) ) ( not ( = ?auto_213458 ?auto_213456 ) ) ( not ( = ?auto_213458 ?auto_213460 ) ) ( not ( = ?auto_213456 ?auto_213460 ) ) ( ON ?auto_213456 ?auto_213458 ) ( not ( = ?auto_213457 ?auto_213459 ) ) ( not ( = ?auto_213457 ?auto_213460 ) ) ( not ( = ?auto_213459 ?auto_213460 ) ) ( not ( = ?auto_213452 ?auto_213459 ) ) ( not ( = ?auto_213452 ?auto_213457 ) ) ( not ( = ?auto_213453 ?auto_213459 ) ) ( not ( = ?auto_213453 ?auto_213457 ) ) ( not ( = ?auto_213454 ?auto_213459 ) ) ( not ( = ?auto_213454 ?auto_213457 ) ) ( not ( = ?auto_213455 ?auto_213459 ) ) ( not ( = ?auto_213455 ?auto_213457 ) ) ( not ( = ?auto_213458 ?auto_213459 ) ) ( not ( = ?auto_213458 ?auto_213457 ) ) ( not ( = ?auto_213456 ?auto_213459 ) ) ( not ( = ?auto_213456 ?auto_213457 ) ) ( ON ?auto_213460 ?auto_213456 ) ( ON ?auto_213459 ?auto_213460 ) ( ON ?auto_213457 ?auto_213459 ) ( CLEAR ?auto_213457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213452 ?auto_213453 ?auto_213454 ?auto_213455 ?auto_213458 ?auto_213456 ?auto_213460 ?auto_213459 )
      ( MAKE-4PILE ?auto_213452 ?auto_213453 ?auto_213454 ?auto_213455 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213466 - BLOCK
      ?auto_213467 - BLOCK
      ?auto_213468 - BLOCK
      ?auto_213469 - BLOCK
      ?auto_213470 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_213470 ) ( CLEAR ?auto_213469 ) ( ON-TABLE ?auto_213466 ) ( ON ?auto_213467 ?auto_213466 ) ( ON ?auto_213468 ?auto_213467 ) ( ON ?auto_213469 ?auto_213468 ) ( not ( = ?auto_213466 ?auto_213467 ) ) ( not ( = ?auto_213466 ?auto_213468 ) ) ( not ( = ?auto_213466 ?auto_213469 ) ) ( not ( = ?auto_213466 ?auto_213470 ) ) ( not ( = ?auto_213467 ?auto_213468 ) ) ( not ( = ?auto_213467 ?auto_213469 ) ) ( not ( = ?auto_213467 ?auto_213470 ) ) ( not ( = ?auto_213468 ?auto_213469 ) ) ( not ( = ?auto_213468 ?auto_213470 ) ) ( not ( = ?auto_213469 ?auto_213470 ) ) )
    :subtasks
    ( ( !STACK ?auto_213470 ?auto_213469 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213471 - BLOCK
      ?auto_213472 - BLOCK
      ?auto_213473 - BLOCK
      ?auto_213474 - BLOCK
      ?auto_213475 - BLOCK
    )
    :vars
    (
      ?auto_213476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_213474 ) ( ON-TABLE ?auto_213471 ) ( ON ?auto_213472 ?auto_213471 ) ( ON ?auto_213473 ?auto_213472 ) ( ON ?auto_213474 ?auto_213473 ) ( not ( = ?auto_213471 ?auto_213472 ) ) ( not ( = ?auto_213471 ?auto_213473 ) ) ( not ( = ?auto_213471 ?auto_213474 ) ) ( not ( = ?auto_213471 ?auto_213475 ) ) ( not ( = ?auto_213472 ?auto_213473 ) ) ( not ( = ?auto_213472 ?auto_213474 ) ) ( not ( = ?auto_213472 ?auto_213475 ) ) ( not ( = ?auto_213473 ?auto_213474 ) ) ( not ( = ?auto_213473 ?auto_213475 ) ) ( not ( = ?auto_213474 ?auto_213475 ) ) ( ON ?auto_213475 ?auto_213476 ) ( CLEAR ?auto_213475 ) ( HAND-EMPTY ) ( not ( = ?auto_213471 ?auto_213476 ) ) ( not ( = ?auto_213472 ?auto_213476 ) ) ( not ( = ?auto_213473 ?auto_213476 ) ) ( not ( = ?auto_213474 ?auto_213476 ) ) ( not ( = ?auto_213475 ?auto_213476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213475 ?auto_213476 )
      ( MAKE-5PILE ?auto_213471 ?auto_213472 ?auto_213473 ?auto_213474 ?auto_213475 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213477 - BLOCK
      ?auto_213478 - BLOCK
      ?auto_213479 - BLOCK
      ?auto_213480 - BLOCK
      ?auto_213481 - BLOCK
    )
    :vars
    (
      ?auto_213482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213477 ) ( ON ?auto_213478 ?auto_213477 ) ( ON ?auto_213479 ?auto_213478 ) ( not ( = ?auto_213477 ?auto_213478 ) ) ( not ( = ?auto_213477 ?auto_213479 ) ) ( not ( = ?auto_213477 ?auto_213480 ) ) ( not ( = ?auto_213477 ?auto_213481 ) ) ( not ( = ?auto_213478 ?auto_213479 ) ) ( not ( = ?auto_213478 ?auto_213480 ) ) ( not ( = ?auto_213478 ?auto_213481 ) ) ( not ( = ?auto_213479 ?auto_213480 ) ) ( not ( = ?auto_213479 ?auto_213481 ) ) ( not ( = ?auto_213480 ?auto_213481 ) ) ( ON ?auto_213481 ?auto_213482 ) ( CLEAR ?auto_213481 ) ( not ( = ?auto_213477 ?auto_213482 ) ) ( not ( = ?auto_213478 ?auto_213482 ) ) ( not ( = ?auto_213479 ?auto_213482 ) ) ( not ( = ?auto_213480 ?auto_213482 ) ) ( not ( = ?auto_213481 ?auto_213482 ) ) ( HOLDING ?auto_213480 ) ( CLEAR ?auto_213479 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213477 ?auto_213478 ?auto_213479 ?auto_213480 )
      ( MAKE-5PILE ?auto_213477 ?auto_213478 ?auto_213479 ?auto_213480 ?auto_213481 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213483 - BLOCK
      ?auto_213484 - BLOCK
      ?auto_213485 - BLOCK
      ?auto_213486 - BLOCK
      ?auto_213487 - BLOCK
    )
    :vars
    (
      ?auto_213488 - BLOCK
      ?auto_213489 - BLOCK
      ?auto_213490 - BLOCK
      ?auto_213491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213483 ) ( ON ?auto_213484 ?auto_213483 ) ( ON ?auto_213485 ?auto_213484 ) ( not ( = ?auto_213483 ?auto_213484 ) ) ( not ( = ?auto_213483 ?auto_213485 ) ) ( not ( = ?auto_213483 ?auto_213486 ) ) ( not ( = ?auto_213483 ?auto_213487 ) ) ( not ( = ?auto_213484 ?auto_213485 ) ) ( not ( = ?auto_213484 ?auto_213486 ) ) ( not ( = ?auto_213484 ?auto_213487 ) ) ( not ( = ?auto_213485 ?auto_213486 ) ) ( not ( = ?auto_213485 ?auto_213487 ) ) ( not ( = ?auto_213486 ?auto_213487 ) ) ( ON ?auto_213487 ?auto_213488 ) ( not ( = ?auto_213483 ?auto_213488 ) ) ( not ( = ?auto_213484 ?auto_213488 ) ) ( not ( = ?auto_213485 ?auto_213488 ) ) ( not ( = ?auto_213486 ?auto_213488 ) ) ( not ( = ?auto_213487 ?auto_213488 ) ) ( CLEAR ?auto_213485 ) ( ON ?auto_213486 ?auto_213487 ) ( CLEAR ?auto_213486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213489 ) ( ON ?auto_213490 ?auto_213489 ) ( ON ?auto_213491 ?auto_213490 ) ( ON ?auto_213488 ?auto_213491 ) ( not ( = ?auto_213489 ?auto_213490 ) ) ( not ( = ?auto_213489 ?auto_213491 ) ) ( not ( = ?auto_213489 ?auto_213488 ) ) ( not ( = ?auto_213489 ?auto_213487 ) ) ( not ( = ?auto_213489 ?auto_213486 ) ) ( not ( = ?auto_213490 ?auto_213491 ) ) ( not ( = ?auto_213490 ?auto_213488 ) ) ( not ( = ?auto_213490 ?auto_213487 ) ) ( not ( = ?auto_213490 ?auto_213486 ) ) ( not ( = ?auto_213491 ?auto_213488 ) ) ( not ( = ?auto_213491 ?auto_213487 ) ) ( not ( = ?auto_213491 ?auto_213486 ) ) ( not ( = ?auto_213483 ?auto_213489 ) ) ( not ( = ?auto_213483 ?auto_213490 ) ) ( not ( = ?auto_213483 ?auto_213491 ) ) ( not ( = ?auto_213484 ?auto_213489 ) ) ( not ( = ?auto_213484 ?auto_213490 ) ) ( not ( = ?auto_213484 ?auto_213491 ) ) ( not ( = ?auto_213485 ?auto_213489 ) ) ( not ( = ?auto_213485 ?auto_213490 ) ) ( not ( = ?auto_213485 ?auto_213491 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213489 ?auto_213490 ?auto_213491 ?auto_213488 ?auto_213487 )
      ( MAKE-5PILE ?auto_213483 ?auto_213484 ?auto_213485 ?auto_213486 ?auto_213487 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213492 - BLOCK
      ?auto_213493 - BLOCK
      ?auto_213494 - BLOCK
      ?auto_213495 - BLOCK
      ?auto_213496 - BLOCK
    )
    :vars
    (
      ?auto_213497 - BLOCK
      ?auto_213498 - BLOCK
      ?auto_213500 - BLOCK
      ?auto_213499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213492 ) ( ON ?auto_213493 ?auto_213492 ) ( not ( = ?auto_213492 ?auto_213493 ) ) ( not ( = ?auto_213492 ?auto_213494 ) ) ( not ( = ?auto_213492 ?auto_213495 ) ) ( not ( = ?auto_213492 ?auto_213496 ) ) ( not ( = ?auto_213493 ?auto_213494 ) ) ( not ( = ?auto_213493 ?auto_213495 ) ) ( not ( = ?auto_213493 ?auto_213496 ) ) ( not ( = ?auto_213494 ?auto_213495 ) ) ( not ( = ?auto_213494 ?auto_213496 ) ) ( not ( = ?auto_213495 ?auto_213496 ) ) ( ON ?auto_213496 ?auto_213497 ) ( not ( = ?auto_213492 ?auto_213497 ) ) ( not ( = ?auto_213493 ?auto_213497 ) ) ( not ( = ?auto_213494 ?auto_213497 ) ) ( not ( = ?auto_213495 ?auto_213497 ) ) ( not ( = ?auto_213496 ?auto_213497 ) ) ( ON ?auto_213495 ?auto_213496 ) ( CLEAR ?auto_213495 ) ( ON-TABLE ?auto_213498 ) ( ON ?auto_213500 ?auto_213498 ) ( ON ?auto_213499 ?auto_213500 ) ( ON ?auto_213497 ?auto_213499 ) ( not ( = ?auto_213498 ?auto_213500 ) ) ( not ( = ?auto_213498 ?auto_213499 ) ) ( not ( = ?auto_213498 ?auto_213497 ) ) ( not ( = ?auto_213498 ?auto_213496 ) ) ( not ( = ?auto_213498 ?auto_213495 ) ) ( not ( = ?auto_213500 ?auto_213499 ) ) ( not ( = ?auto_213500 ?auto_213497 ) ) ( not ( = ?auto_213500 ?auto_213496 ) ) ( not ( = ?auto_213500 ?auto_213495 ) ) ( not ( = ?auto_213499 ?auto_213497 ) ) ( not ( = ?auto_213499 ?auto_213496 ) ) ( not ( = ?auto_213499 ?auto_213495 ) ) ( not ( = ?auto_213492 ?auto_213498 ) ) ( not ( = ?auto_213492 ?auto_213500 ) ) ( not ( = ?auto_213492 ?auto_213499 ) ) ( not ( = ?auto_213493 ?auto_213498 ) ) ( not ( = ?auto_213493 ?auto_213500 ) ) ( not ( = ?auto_213493 ?auto_213499 ) ) ( not ( = ?auto_213494 ?auto_213498 ) ) ( not ( = ?auto_213494 ?auto_213500 ) ) ( not ( = ?auto_213494 ?auto_213499 ) ) ( HOLDING ?auto_213494 ) ( CLEAR ?auto_213493 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213492 ?auto_213493 ?auto_213494 )
      ( MAKE-5PILE ?auto_213492 ?auto_213493 ?auto_213494 ?auto_213495 ?auto_213496 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213501 - BLOCK
      ?auto_213502 - BLOCK
      ?auto_213503 - BLOCK
      ?auto_213504 - BLOCK
      ?auto_213505 - BLOCK
    )
    :vars
    (
      ?auto_213509 - BLOCK
      ?auto_213508 - BLOCK
      ?auto_213507 - BLOCK
      ?auto_213506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213501 ) ( ON ?auto_213502 ?auto_213501 ) ( not ( = ?auto_213501 ?auto_213502 ) ) ( not ( = ?auto_213501 ?auto_213503 ) ) ( not ( = ?auto_213501 ?auto_213504 ) ) ( not ( = ?auto_213501 ?auto_213505 ) ) ( not ( = ?auto_213502 ?auto_213503 ) ) ( not ( = ?auto_213502 ?auto_213504 ) ) ( not ( = ?auto_213502 ?auto_213505 ) ) ( not ( = ?auto_213503 ?auto_213504 ) ) ( not ( = ?auto_213503 ?auto_213505 ) ) ( not ( = ?auto_213504 ?auto_213505 ) ) ( ON ?auto_213505 ?auto_213509 ) ( not ( = ?auto_213501 ?auto_213509 ) ) ( not ( = ?auto_213502 ?auto_213509 ) ) ( not ( = ?auto_213503 ?auto_213509 ) ) ( not ( = ?auto_213504 ?auto_213509 ) ) ( not ( = ?auto_213505 ?auto_213509 ) ) ( ON ?auto_213504 ?auto_213505 ) ( ON-TABLE ?auto_213508 ) ( ON ?auto_213507 ?auto_213508 ) ( ON ?auto_213506 ?auto_213507 ) ( ON ?auto_213509 ?auto_213506 ) ( not ( = ?auto_213508 ?auto_213507 ) ) ( not ( = ?auto_213508 ?auto_213506 ) ) ( not ( = ?auto_213508 ?auto_213509 ) ) ( not ( = ?auto_213508 ?auto_213505 ) ) ( not ( = ?auto_213508 ?auto_213504 ) ) ( not ( = ?auto_213507 ?auto_213506 ) ) ( not ( = ?auto_213507 ?auto_213509 ) ) ( not ( = ?auto_213507 ?auto_213505 ) ) ( not ( = ?auto_213507 ?auto_213504 ) ) ( not ( = ?auto_213506 ?auto_213509 ) ) ( not ( = ?auto_213506 ?auto_213505 ) ) ( not ( = ?auto_213506 ?auto_213504 ) ) ( not ( = ?auto_213501 ?auto_213508 ) ) ( not ( = ?auto_213501 ?auto_213507 ) ) ( not ( = ?auto_213501 ?auto_213506 ) ) ( not ( = ?auto_213502 ?auto_213508 ) ) ( not ( = ?auto_213502 ?auto_213507 ) ) ( not ( = ?auto_213502 ?auto_213506 ) ) ( not ( = ?auto_213503 ?auto_213508 ) ) ( not ( = ?auto_213503 ?auto_213507 ) ) ( not ( = ?auto_213503 ?auto_213506 ) ) ( CLEAR ?auto_213502 ) ( ON ?auto_213503 ?auto_213504 ) ( CLEAR ?auto_213503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213508 ?auto_213507 ?auto_213506 ?auto_213509 ?auto_213505 ?auto_213504 )
      ( MAKE-5PILE ?auto_213501 ?auto_213502 ?auto_213503 ?auto_213504 ?auto_213505 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213510 - BLOCK
      ?auto_213511 - BLOCK
      ?auto_213512 - BLOCK
      ?auto_213513 - BLOCK
      ?auto_213514 - BLOCK
    )
    :vars
    (
      ?auto_213516 - BLOCK
      ?auto_213515 - BLOCK
      ?auto_213517 - BLOCK
      ?auto_213518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213510 ) ( not ( = ?auto_213510 ?auto_213511 ) ) ( not ( = ?auto_213510 ?auto_213512 ) ) ( not ( = ?auto_213510 ?auto_213513 ) ) ( not ( = ?auto_213510 ?auto_213514 ) ) ( not ( = ?auto_213511 ?auto_213512 ) ) ( not ( = ?auto_213511 ?auto_213513 ) ) ( not ( = ?auto_213511 ?auto_213514 ) ) ( not ( = ?auto_213512 ?auto_213513 ) ) ( not ( = ?auto_213512 ?auto_213514 ) ) ( not ( = ?auto_213513 ?auto_213514 ) ) ( ON ?auto_213514 ?auto_213516 ) ( not ( = ?auto_213510 ?auto_213516 ) ) ( not ( = ?auto_213511 ?auto_213516 ) ) ( not ( = ?auto_213512 ?auto_213516 ) ) ( not ( = ?auto_213513 ?auto_213516 ) ) ( not ( = ?auto_213514 ?auto_213516 ) ) ( ON ?auto_213513 ?auto_213514 ) ( ON-TABLE ?auto_213515 ) ( ON ?auto_213517 ?auto_213515 ) ( ON ?auto_213518 ?auto_213517 ) ( ON ?auto_213516 ?auto_213518 ) ( not ( = ?auto_213515 ?auto_213517 ) ) ( not ( = ?auto_213515 ?auto_213518 ) ) ( not ( = ?auto_213515 ?auto_213516 ) ) ( not ( = ?auto_213515 ?auto_213514 ) ) ( not ( = ?auto_213515 ?auto_213513 ) ) ( not ( = ?auto_213517 ?auto_213518 ) ) ( not ( = ?auto_213517 ?auto_213516 ) ) ( not ( = ?auto_213517 ?auto_213514 ) ) ( not ( = ?auto_213517 ?auto_213513 ) ) ( not ( = ?auto_213518 ?auto_213516 ) ) ( not ( = ?auto_213518 ?auto_213514 ) ) ( not ( = ?auto_213518 ?auto_213513 ) ) ( not ( = ?auto_213510 ?auto_213515 ) ) ( not ( = ?auto_213510 ?auto_213517 ) ) ( not ( = ?auto_213510 ?auto_213518 ) ) ( not ( = ?auto_213511 ?auto_213515 ) ) ( not ( = ?auto_213511 ?auto_213517 ) ) ( not ( = ?auto_213511 ?auto_213518 ) ) ( not ( = ?auto_213512 ?auto_213515 ) ) ( not ( = ?auto_213512 ?auto_213517 ) ) ( not ( = ?auto_213512 ?auto_213518 ) ) ( ON ?auto_213512 ?auto_213513 ) ( CLEAR ?auto_213512 ) ( HOLDING ?auto_213511 ) ( CLEAR ?auto_213510 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213510 ?auto_213511 )
      ( MAKE-5PILE ?auto_213510 ?auto_213511 ?auto_213512 ?auto_213513 ?auto_213514 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213519 - BLOCK
      ?auto_213520 - BLOCK
      ?auto_213521 - BLOCK
      ?auto_213522 - BLOCK
      ?auto_213523 - BLOCK
    )
    :vars
    (
      ?auto_213524 - BLOCK
      ?auto_213527 - BLOCK
      ?auto_213526 - BLOCK
      ?auto_213525 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213519 ) ( not ( = ?auto_213519 ?auto_213520 ) ) ( not ( = ?auto_213519 ?auto_213521 ) ) ( not ( = ?auto_213519 ?auto_213522 ) ) ( not ( = ?auto_213519 ?auto_213523 ) ) ( not ( = ?auto_213520 ?auto_213521 ) ) ( not ( = ?auto_213520 ?auto_213522 ) ) ( not ( = ?auto_213520 ?auto_213523 ) ) ( not ( = ?auto_213521 ?auto_213522 ) ) ( not ( = ?auto_213521 ?auto_213523 ) ) ( not ( = ?auto_213522 ?auto_213523 ) ) ( ON ?auto_213523 ?auto_213524 ) ( not ( = ?auto_213519 ?auto_213524 ) ) ( not ( = ?auto_213520 ?auto_213524 ) ) ( not ( = ?auto_213521 ?auto_213524 ) ) ( not ( = ?auto_213522 ?auto_213524 ) ) ( not ( = ?auto_213523 ?auto_213524 ) ) ( ON ?auto_213522 ?auto_213523 ) ( ON-TABLE ?auto_213527 ) ( ON ?auto_213526 ?auto_213527 ) ( ON ?auto_213525 ?auto_213526 ) ( ON ?auto_213524 ?auto_213525 ) ( not ( = ?auto_213527 ?auto_213526 ) ) ( not ( = ?auto_213527 ?auto_213525 ) ) ( not ( = ?auto_213527 ?auto_213524 ) ) ( not ( = ?auto_213527 ?auto_213523 ) ) ( not ( = ?auto_213527 ?auto_213522 ) ) ( not ( = ?auto_213526 ?auto_213525 ) ) ( not ( = ?auto_213526 ?auto_213524 ) ) ( not ( = ?auto_213526 ?auto_213523 ) ) ( not ( = ?auto_213526 ?auto_213522 ) ) ( not ( = ?auto_213525 ?auto_213524 ) ) ( not ( = ?auto_213525 ?auto_213523 ) ) ( not ( = ?auto_213525 ?auto_213522 ) ) ( not ( = ?auto_213519 ?auto_213527 ) ) ( not ( = ?auto_213519 ?auto_213526 ) ) ( not ( = ?auto_213519 ?auto_213525 ) ) ( not ( = ?auto_213520 ?auto_213527 ) ) ( not ( = ?auto_213520 ?auto_213526 ) ) ( not ( = ?auto_213520 ?auto_213525 ) ) ( not ( = ?auto_213521 ?auto_213527 ) ) ( not ( = ?auto_213521 ?auto_213526 ) ) ( not ( = ?auto_213521 ?auto_213525 ) ) ( ON ?auto_213521 ?auto_213522 ) ( CLEAR ?auto_213519 ) ( ON ?auto_213520 ?auto_213521 ) ( CLEAR ?auto_213520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213527 ?auto_213526 ?auto_213525 ?auto_213524 ?auto_213523 ?auto_213522 ?auto_213521 )
      ( MAKE-5PILE ?auto_213519 ?auto_213520 ?auto_213521 ?auto_213522 ?auto_213523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213528 - BLOCK
      ?auto_213529 - BLOCK
      ?auto_213530 - BLOCK
      ?auto_213531 - BLOCK
      ?auto_213532 - BLOCK
    )
    :vars
    (
      ?auto_213535 - BLOCK
      ?auto_213536 - BLOCK
      ?auto_213534 - BLOCK
      ?auto_213533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213528 ?auto_213529 ) ) ( not ( = ?auto_213528 ?auto_213530 ) ) ( not ( = ?auto_213528 ?auto_213531 ) ) ( not ( = ?auto_213528 ?auto_213532 ) ) ( not ( = ?auto_213529 ?auto_213530 ) ) ( not ( = ?auto_213529 ?auto_213531 ) ) ( not ( = ?auto_213529 ?auto_213532 ) ) ( not ( = ?auto_213530 ?auto_213531 ) ) ( not ( = ?auto_213530 ?auto_213532 ) ) ( not ( = ?auto_213531 ?auto_213532 ) ) ( ON ?auto_213532 ?auto_213535 ) ( not ( = ?auto_213528 ?auto_213535 ) ) ( not ( = ?auto_213529 ?auto_213535 ) ) ( not ( = ?auto_213530 ?auto_213535 ) ) ( not ( = ?auto_213531 ?auto_213535 ) ) ( not ( = ?auto_213532 ?auto_213535 ) ) ( ON ?auto_213531 ?auto_213532 ) ( ON-TABLE ?auto_213536 ) ( ON ?auto_213534 ?auto_213536 ) ( ON ?auto_213533 ?auto_213534 ) ( ON ?auto_213535 ?auto_213533 ) ( not ( = ?auto_213536 ?auto_213534 ) ) ( not ( = ?auto_213536 ?auto_213533 ) ) ( not ( = ?auto_213536 ?auto_213535 ) ) ( not ( = ?auto_213536 ?auto_213532 ) ) ( not ( = ?auto_213536 ?auto_213531 ) ) ( not ( = ?auto_213534 ?auto_213533 ) ) ( not ( = ?auto_213534 ?auto_213535 ) ) ( not ( = ?auto_213534 ?auto_213532 ) ) ( not ( = ?auto_213534 ?auto_213531 ) ) ( not ( = ?auto_213533 ?auto_213535 ) ) ( not ( = ?auto_213533 ?auto_213532 ) ) ( not ( = ?auto_213533 ?auto_213531 ) ) ( not ( = ?auto_213528 ?auto_213536 ) ) ( not ( = ?auto_213528 ?auto_213534 ) ) ( not ( = ?auto_213528 ?auto_213533 ) ) ( not ( = ?auto_213529 ?auto_213536 ) ) ( not ( = ?auto_213529 ?auto_213534 ) ) ( not ( = ?auto_213529 ?auto_213533 ) ) ( not ( = ?auto_213530 ?auto_213536 ) ) ( not ( = ?auto_213530 ?auto_213534 ) ) ( not ( = ?auto_213530 ?auto_213533 ) ) ( ON ?auto_213530 ?auto_213531 ) ( ON ?auto_213529 ?auto_213530 ) ( CLEAR ?auto_213529 ) ( HOLDING ?auto_213528 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213528 )
      ( MAKE-5PILE ?auto_213528 ?auto_213529 ?auto_213530 ?auto_213531 ?auto_213532 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_213537 - BLOCK
      ?auto_213538 - BLOCK
      ?auto_213539 - BLOCK
      ?auto_213540 - BLOCK
      ?auto_213541 - BLOCK
    )
    :vars
    (
      ?auto_213543 - BLOCK
      ?auto_213545 - BLOCK
      ?auto_213542 - BLOCK
      ?auto_213544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213537 ?auto_213538 ) ) ( not ( = ?auto_213537 ?auto_213539 ) ) ( not ( = ?auto_213537 ?auto_213540 ) ) ( not ( = ?auto_213537 ?auto_213541 ) ) ( not ( = ?auto_213538 ?auto_213539 ) ) ( not ( = ?auto_213538 ?auto_213540 ) ) ( not ( = ?auto_213538 ?auto_213541 ) ) ( not ( = ?auto_213539 ?auto_213540 ) ) ( not ( = ?auto_213539 ?auto_213541 ) ) ( not ( = ?auto_213540 ?auto_213541 ) ) ( ON ?auto_213541 ?auto_213543 ) ( not ( = ?auto_213537 ?auto_213543 ) ) ( not ( = ?auto_213538 ?auto_213543 ) ) ( not ( = ?auto_213539 ?auto_213543 ) ) ( not ( = ?auto_213540 ?auto_213543 ) ) ( not ( = ?auto_213541 ?auto_213543 ) ) ( ON ?auto_213540 ?auto_213541 ) ( ON-TABLE ?auto_213545 ) ( ON ?auto_213542 ?auto_213545 ) ( ON ?auto_213544 ?auto_213542 ) ( ON ?auto_213543 ?auto_213544 ) ( not ( = ?auto_213545 ?auto_213542 ) ) ( not ( = ?auto_213545 ?auto_213544 ) ) ( not ( = ?auto_213545 ?auto_213543 ) ) ( not ( = ?auto_213545 ?auto_213541 ) ) ( not ( = ?auto_213545 ?auto_213540 ) ) ( not ( = ?auto_213542 ?auto_213544 ) ) ( not ( = ?auto_213542 ?auto_213543 ) ) ( not ( = ?auto_213542 ?auto_213541 ) ) ( not ( = ?auto_213542 ?auto_213540 ) ) ( not ( = ?auto_213544 ?auto_213543 ) ) ( not ( = ?auto_213544 ?auto_213541 ) ) ( not ( = ?auto_213544 ?auto_213540 ) ) ( not ( = ?auto_213537 ?auto_213545 ) ) ( not ( = ?auto_213537 ?auto_213542 ) ) ( not ( = ?auto_213537 ?auto_213544 ) ) ( not ( = ?auto_213538 ?auto_213545 ) ) ( not ( = ?auto_213538 ?auto_213542 ) ) ( not ( = ?auto_213538 ?auto_213544 ) ) ( not ( = ?auto_213539 ?auto_213545 ) ) ( not ( = ?auto_213539 ?auto_213542 ) ) ( not ( = ?auto_213539 ?auto_213544 ) ) ( ON ?auto_213539 ?auto_213540 ) ( ON ?auto_213538 ?auto_213539 ) ( ON ?auto_213537 ?auto_213538 ) ( CLEAR ?auto_213537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213545 ?auto_213542 ?auto_213544 ?auto_213543 ?auto_213541 ?auto_213540 ?auto_213539 ?auto_213538 )
      ( MAKE-5PILE ?auto_213537 ?auto_213538 ?auto_213539 ?auto_213540 ?auto_213541 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213549 - BLOCK
      ?auto_213550 - BLOCK
      ?auto_213551 - BLOCK
    )
    :vars
    (
      ?auto_213552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213552 ?auto_213551 ) ( CLEAR ?auto_213552 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213549 ) ( ON ?auto_213550 ?auto_213549 ) ( ON ?auto_213551 ?auto_213550 ) ( not ( = ?auto_213549 ?auto_213550 ) ) ( not ( = ?auto_213549 ?auto_213551 ) ) ( not ( = ?auto_213549 ?auto_213552 ) ) ( not ( = ?auto_213550 ?auto_213551 ) ) ( not ( = ?auto_213550 ?auto_213552 ) ) ( not ( = ?auto_213551 ?auto_213552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213552 ?auto_213551 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213553 - BLOCK
      ?auto_213554 - BLOCK
      ?auto_213555 - BLOCK
    )
    :vars
    (
      ?auto_213556 - BLOCK
      ?auto_213557 - BLOCK
      ?auto_213558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213556 ?auto_213555 ) ( CLEAR ?auto_213556 ) ( ON-TABLE ?auto_213553 ) ( ON ?auto_213554 ?auto_213553 ) ( ON ?auto_213555 ?auto_213554 ) ( not ( = ?auto_213553 ?auto_213554 ) ) ( not ( = ?auto_213553 ?auto_213555 ) ) ( not ( = ?auto_213553 ?auto_213556 ) ) ( not ( = ?auto_213554 ?auto_213555 ) ) ( not ( = ?auto_213554 ?auto_213556 ) ) ( not ( = ?auto_213555 ?auto_213556 ) ) ( HOLDING ?auto_213557 ) ( CLEAR ?auto_213558 ) ( not ( = ?auto_213553 ?auto_213557 ) ) ( not ( = ?auto_213553 ?auto_213558 ) ) ( not ( = ?auto_213554 ?auto_213557 ) ) ( not ( = ?auto_213554 ?auto_213558 ) ) ( not ( = ?auto_213555 ?auto_213557 ) ) ( not ( = ?auto_213555 ?auto_213558 ) ) ( not ( = ?auto_213556 ?auto_213557 ) ) ( not ( = ?auto_213556 ?auto_213558 ) ) ( not ( = ?auto_213557 ?auto_213558 ) ) )
    :subtasks
    ( ( !STACK ?auto_213557 ?auto_213558 )
      ( MAKE-3PILE ?auto_213553 ?auto_213554 ?auto_213555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213559 - BLOCK
      ?auto_213560 - BLOCK
      ?auto_213561 - BLOCK
    )
    :vars
    (
      ?auto_213563 - BLOCK
      ?auto_213564 - BLOCK
      ?auto_213562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213563 ?auto_213561 ) ( ON-TABLE ?auto_213559 ) ( ON ?auto_213560 ?auto_213559 ) ( ON ?auto_213561 ?auto_213560 ) ( not ( = ?auto_213559 ?auto_213560 ) ) ( not ( = ?auto_213559 ?auto_213561 ) ) ( not ( = ?auto_213559 ?auto_213563 ) ) ( not ( = ?auto_213560 ?auto_213561 ) ) ( not ( = ?auto_213560 ?auto_213563 ) ) ( not ( = ?auto_213561 ?auto_213563 ) ) ( CLEAR ?auto_213564 ) ( not ( = ?auto_213559 ?auto_213562 ) ) ( not ( = ?auto_213559 ?auto_213564 ) ) ( not ( = ?auto_213560 ?auto_213562 ) ) ( not ( = ?auto_213560 ?auto_213564 ) ) ( not ( = ?auto_213561 ?auto_213562 ) ) ( not ( = ?auto_213561 ?auto_213564 ) ) ( not ( = ?auto_213563 ?auto_213562 ) ) ( not ( = ?auto_213563 ?auto_213564 ) ) ( not ( = ?auto_213562 ?auto_213564 ) ) ( ON ?auto_213562 ?auto_213563 ) ( CLEAR ?auto_213562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213559 ?auto_213560 ?auto_213561 ?auto_213563 )
      ( MAKE-3PILE ?auto_213559 ?auto_213560 ?auto_213561 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213565 - BLOCK
      ?auto_213566 - BLOCK
      ?auto_213567 - BLOCK
    )
    :vars
    (
      ?auto_213570 - BLOCK
      ?auto_213569 - BLOCK
      ?auto_213568 - BLOCK
      ?auto_213573 - BLOCK
      ?auto_213571 - BLOCK
      ?auto_213572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213570 ?auto_213567 ) ( ON-TABLE ?auto_213565 ) ( ON ?auto_213566 ?auto_213565 ) ( ON ?auto_213567 ?auto_213566 ) ( not ( = ?auto_213565 ?auto_213566 ) ) ( not ( = ?auto_213565 ?auto_213567 ) ) ( not ( = ?auto_213565 ?auto_213570 ) ) ( not ( = ?auto_213566 ?auto_213567 ) ) ( not ( = ?auto_213566 ?auto_213570 ) ) ( not ( = ?auto_213567 ?auto_213570 ) ) ( not ( = ?auto_213565 ?auto_213569 ) ) ( not ( = ?auto_213565 ?auto_213568 ) ) ( not ( = ?auto_213566 ?auto_213569 ) ) ( not ( = ?auto_213566 ?auto_213568 ) ) ( not ( = ?auto_213567 ?auto_213569 ) ) ( not ( = ?auto_213567 ?auto_213568 ) ) ( not ( = ?auto_213570 ?auto_213569 ) ) ( not ( = ?auto_213570 ?auto_213568 ) ) ( not ( = ?auto_213569 ?auto_213568 ) ) ( ON ?auto_213569 ?auto_213570 ) ( CLEAR ?auto_213569 ) ( HOLDING ?auto_213568 ) ( CLEAR ?auto_213573 ) ( ON-TABLE ?auto_213571 ) ( ON ?auto_213572 ?auto_213571 ) ( ON ?auto_213573 ?auto_213572 ) ( not ( = ?auto_213571 ?auto_213572 ) ) ( not ( = ?auto_213571 ?auto_213573 ) ) ( not ( = ?auto_213571 ?auto_213568 ) ) ( not ( = ?auto_213572 ?auto_213573 ) ) ( not ( = ?auto_213572 ?auto_213568 ) ) ( not ( = ?auto_213573 ?auto_213568 ) ) ( not ( = ?auto_213565 ?auto_213573 ) ) ( not ( = ?auto_213565 ?auto_213571 ) ) ( not ( = ?auto_213565 ?auto_213572 ) ) ( not ( = ?auto_213566 ?auto_213573 ) ) ( not ( = ?auto_213566 ?auto_213571 ) ) ( not ( = ?auto_213566 ?auto_213572 ) ) ( not ( = ?auto_213567 ?auto_213573 ) ) ( not ( = ?auto_213567 ?auto_213571 ) ) ( not ( = ?auto_213567 ?auto_213572 ) ) ( not ( = ?auto_213570 ?auto_213573 ) ) ( not ( = ?auto_213570 ?auto_213571 ) ) ( not ( = ?auto_213570 ?auto_213572 ) ) ( not ( = ?auto_213569 ?auto_213573 ) ) ( not ( = ?auto_213569 ?auto_213571 ) ) ( not ( = ?auto_213569 ?auto_213572 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213571 ?auto_213572 ?auto_213573 ?auto_213568 )
      ( MAKE-3PILE ?auto_213565 ?auto_213566 ?auto_213567 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213574 - BLOCK
      ?auto_213575 - BLOCK
      ?auto_213576 - BLOCK
    )
    :vars
    (
      ?auto_213582 - BLOCK
      ?auto_213580 - BLOCK
      ?auto_213581 - BLOCK
      ?auto_213577 - BLOCK
      ?auto_213578 - BLOCK
      ?auto_213579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213582 ?auto_213576 ) ( ON-TABLE ?auto_213574 ) ( ON ?auto_213575 ?auto_213574 ) ( ON ?auto_213576 ?auto_213575 ) ( not ( = ?auto_213574 ?auto_213575 ) ) ( not ( = ?auto_213574 ?auto_213576 ) ) ( not ( = ?auto_213574 ?auto_213582 ) ) ( not ( = ?auto_213575 ?auto_213576 ) ) ( not ( = ?auto_213575 ?auto_213582 ) ) ( not ( = ?auto_213576 ?auto_213582 ) ) ( not ( = ?auto_213574 ?auto_213580 ) ) ( not ( = ?auto_213574 ?auto_213581 ) ) ( not ( = ?auto_213575 ?auto_213580 ) ) ( not ( = ?auto_213575 ?auto_213581 ) ) ( not ( = ?auto_213576 ?auto_213580 ) ) ( not ( = ?auto_213576 ?auto_213581 ) ) ( not ( = ?auto_213582 ?auto_213580 ) ) ( not ( = ?auto_213582 ?auto_213581 ) ) ( not ( = ?auto_213580 ?auto_213581 ) ) ( ON ?auto_213580 ?auto_213582 ) ( CLEAR ?auto_213577 ) ( ON-TABLE ?auto_213578 ) ( ON ?auto_213579 ?auto_213578 ) ( ON ?auto_213577 ?auto_213579 ) ( not ( = ?auto_213578 ?auto_213579 ) ) ( not ( = ?auto_213578 ?auto_213577 ) ) ( not ( = ?auto_213578 ?auto_213581 ) ) ( not ( = ?auto_213579 ?auto_213577 ) ) ( not ( = ?auto_213579 ?auto_213581 ) ) ( not ( = ?auto_213577 ?auto_213581 ) ) ( not ( = ?auto_213574 ?auto_213577 ) ) ( not ( = ?auto_213574 ?auto_213578 ) ) ( not ( = ?auto_213574 ?auto_213579 ) ) ( not ( = ?auto_213575 ?auto_213577 ) ) ( not ( = ?auto_213575 ?auto_213578 ) ) ( not ( = ?auto_213575 ?auto_213579 ) ) ( not ( = ?auto_213576 ?auto_213577 ) ) ( not ( = ?auto_213576 ?auto_213578 ) ) ( not ( = ?auto_213576 ?auto_213579 ) ) ( not ( = ?auto_213582 ?auto_213577 ) ) ( not ( = ?auto_213582 ?auto_213578 ) ) ( not ( = ?auto_213582 ?auto_213579 ) ) ( not ( = ?auto_213580 ?auto_213577 ) ) ( not ( = ?auto_213580 ?auto_213578 ) ) ( not ( = ?auto_213580 ?auto_213579 ) ) ( ON ?auto_213581 ?auto_213580 ) ( CLEAR ?auto_213581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213574 ?auto_213575 ?auto_213576 ?auto_213582 ?auto_213580 )
      ( MAKE-3PILE ?auto_213574 ?auto_213575 ?auto_213576 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213583 - BLOCK
      ?auto_213584 - BLOCK
      ?auto_213585 - BLOCK
    )
    :vars
    (
      ?auto_213587 - BLOCK
      ?auto_213586 - BLOCK
      ?auto_213590 - BLOCK
      ?auto_213588 - BLOCK
      ?auto_213589 - BLOCK
      ?auto_213591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213587 ?auto_213585 ) ( ON-TABLE ?auto_213583 ) ( ON ?auto_213584 ?auto_213583 ) ( ON ?auto_213585 ?auto_213584 ) ( not ( = ?auto_213583 ?auto_213584 ) ) ( not ( = ?auto_213583 ?auto_213585 ) ) ( not ( = ?auto_213583 ?auto_213587 ) ) ( not ( = ?auto_213584 ?auto_213585 ) ) ( not ( = ?auto_213584 ?auto_213587 ) ) ( not ( = ?auto_213585 ?auto_213587 ) ) ( not ( = ?auto_213583 ?auto_213586 ) ) ( not ( = ?auto_213583 ?auto_213590 ) ) ( not ( = ?auto_213584 ?auto_213586 ) ) ( not ( = ?auto_213584 ?auto_213590 ) ) ( not ( = ?auto_213585 ?auto_213586 ) ) ( not ( = ?auto_213585 ?auto_213590 ) ) ( not ( = ?auto_213587 ?auto_213586 ) ) ( not ( = ?auto_213587 ?auto_213590 ) ) ( not ( = ?auto_213586 ?auto_213590 ) ) ( ON ?auto_213586 ?auto_213587 ) ( ON-TABLE ?auto_213588 ) ( ON ?auto_213589 ?auto_213588 ) ( not ( = ?auto_213588 ?auto_213589 ) ) ( not ( = ?auto_213588 ?auto_213591 ) ) ( not ( = ?auto_213588 ?auto_213590 ) ) ( not ( = ?auto_213589 ?auto_213591 ) ) ( not ( = ?auto_213589 ?auto_213590 ) ) ( not ( = ?auto_213591 ?auto_213590 ) ) ( not ( = ?auto_213583 ?auto_213591 ) ) ( not ( = ?auto_213583 ?auto_213588 ) ) ( not ( = ?auto_213583 ?auto_213589 ) ) ( not ( = ?auto_213584 ?auto_213591 ) ) ( not ( = ?auto_213584 ?auto_213588 ) ) ( not ( = ?auto_213584 ?auto_213589 ) ) ( not ( = ?auto_213585 ?auto_213591 ) ) ( not ( = ?auto_213585 ?auto_213588 ) ) ( not ( = ?auto_213585 ?auto_213589 ) ) ( not ( = ?auto_213587 ?auto_213591 ) ) ( not ( = ?auto_213587 ?auto_213588 ) ) ( not ( = ?auto_213587 ?auto_213589 ) ) ( not ( = ?auto_213586 ?auto_213591 ) ) ( not ( = ?auto_213586 ?auto_213588 ) ) ( not ( = ?auto_213586 ?auto_213589 ) ) ( ON ?auto_213590 ?auto_213586 ) ( CLEAR ?auto_213590 ) ( HOLDING ?auto_213591 ) ( CLEAR ?auto_213589 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213588 ?auto_213589 ?auto_213591 )
      ( MAKE-3PILE ?auto_213583 ?auto_213584 ?auto_213585 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213592 - BLOCK
      ?auto_213593 - BLOCK
      ?auto_213594 - BLOCK
    )
    :vars
    (
      ?auto_213600 - BLOCK
      ?auto_213598 - BLOCK
      ?auto_213599 - BLOCK
      ?auto_213596 - BLOCK
      ?auto_213595 - BLOCK
      ?auto_213597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213600 ?auto_213594 ) ( ON-TABLE ?auto_213592 ) ( ON ?auto_213593 ?auto_213592 ) ( ON ?auto_213594 ?auto_213593 ) ( not ( = ?auto_213592 ?auto_213593 ) ) ( not ( = ?auto_213592 ?auto_213594 ) ) ( not ( = ?auto_213592 ?auto_213600 ) ) ( not ( = ?auto_213593 ?auto_213594 ) ) ( not ( = ?auto_213593 ?auto_213600 ) ) ( not ( = ?auto_213594 ?auto_213600 ) ) ( not ( = ?auto_213592 ?auto_213598 ) ) ( not ( = ?auto_213592 ?auto_213599 ) ) ( not ( = ?auto_213593 ?auto_213598 ) ) ( not ( = ?auto_213593 ?auto_213599 ) ) ( not ( = ?auto_213594 ?auto_213598 ) ) ( not ( = ?auto_213594 ?auto_213599 ) ) ( not ( = ?auto_213600 ?auto_213598 ) ) ( not ( = ?auto_213600 ?auto_213599 ) ) ( not ( = ?auto_213598 ?auto_213599 ) ) ( ON ?auto_213598 ?auto_213600 ) ( ON-TABLE ?auto_213596 ) ( ON ?auto_213595 ?auto_213596 ) ( not ( = ?auto_213596 ?auto_213595 ) ) ( not ( = ?auto_213596 ?auto_213597 ) ) ( not ( = ?auto_213596 ?auto_213599 ) ) ( not ( = ?auto_213595 ?auto_213597 ) ) ( not ( = ?auto_213595 ?auto_213599 ) ) ( not ( = ?auto_213597 ?auto_213599 ) ) ( not ( = ?auto_213592 ?auto_213597 ) ) ( not ( = ?auto_213592 ?auto_213596 ) ) ( not ( = ?auto_213592 ?auto_213595 ) ) ( not ( = ?auto_213593 ?auto_213597 ) ) ( not ( = ?auto_213593 ?auto_213596 ) ) ( not ( = ?auto_213593 ?auto_213595 ) ) ( not ( = ?auto_213594 ?auto_213597 ) ) ( not ( = ?auto_213594 ?auto_213596 ) ) ( not ( = ?auto_213594 ?auto_213595 ) ) ( not ( = ?auto_213600 ?auto_213597 ) ) ( not ( = ?auto_213600 ?auto_213596 ) ) ( not ( = ?auto_213600 ?auto_213595 ) ) ( not ( = ?auto_213598 ?auto_213597 ) ) ( not ( = ?auto_213598 ?auto_213596 ) ) ( not ( = ?auto_213598 ?auto_213595 ) ) ( ON ?auto_213599 ?auto_213598 ) ( CLEAR ?auto_213595 ) ( ON ?auto_213597 ?auto_213599 ) ( CLEAR ?auto_213597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213592 ?auto_213593 ?auto_213594 ?auto_213600 ?auto_213598 ?auto_213599 )
      ( MAKE-3PILE ?auto_213592 ?auto_213593 ?auto_213594 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213601 - BLOCK
      ?auto_213602 - BLOCK
      ?auto_213603 - BLOCK
    )
    :vars
    (
      ?auto_213604 - BLOCK
      ?auto_213607 - BLOCK
      ?auto_213608 - BLOCK
      ?auto_213605 - BLOCK
      ?auto_213609 - BLOCK
      ?auto_213606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213604 ?auto_213603 ) ( ON-TABLE ?auto_213601 ) ( ON ?auto_213602 ?auto_213601 ) ( ON ?auto_213603 ?auto_213602 ) ( not ( = ?auto_213601 ?auto_213602 ) ) ( not ( = ?auto_213601 ?auto_213603 ) ) ( not ( = ?auto_213601 ?auto_213604 ) ) ( not ( = ?auto_213602 ?auto_213603 ) ) ( not ( = ?auto_213602 ?auto_213604 ) ) ( not ( = ?auto_213603 ?auto_213604 ) ) ( not ( = ?auto_213601 ?auto_213607 ) ) ( not ( = ?auto_213601 ?auto_213608 ) ) ( not ( = ?auto_213602 ?auto_213607 ) ) ( not ( = ?auto_213602 ?auto_213608 ) ) ( not ( = ?auto_213603 ?auto_213607 ) ) ( not ( = ?auto_213603 ?auto_213608 ) ) ( not ( = ?auto_213604 ?auto_213607 ) ) ( not ( = ?auto_213604 ?auto_213608 ) ) ( not ( = ?auto_213607 ?auto_213608 ) ) ( ON ?auto_213607 ?auto_213604 ) ( ON-TABLE ?auto_213605 ) ( not ( = ?auto_213605 ?auto_213609 ) ) ( not ( = ?auto_213605 ?auto_213606 ) ) ( not ( = ?auto_213605 ?auto_213608 ) ) ( not ( = ?auto_213609 ?auto_213606 ) ) ( not ( = ?auto_213609 ?auto_213608 ) ) ( not ( = ?auto_213606 ?auto_213608 ) ) ( not ( = ?auto_213601 ?auto_213606 ) ) ( not ( = ?auto_213601 ?auto_213605 ) ) ( not ( = ?auto_213601 ?auto_213609 ) ) ( not ( = ?auto_213602 ?auto_213606 ) ) ( not ( = ?auto_213602 ?auto_213605 ) ) ( not ( = ?auto_213602 ?auto_213609 ) ) ( not ( = ?auto_213603 ?auto_213606 ) ) ( not ( = ?auto_213603 ?auto_213605 ) ) ( not ( = ?auto_213603 ?auto_213609 ) ) ( not ( = ?auto_213604 ?auto_213606 ) ) ( not ( = ?auto_213604 ?auto_213605 ) ) ( not ( = ?auto_213604 ?auto_213609 ) ) ( not ( = ?auto_213607 ?auto_213606 ) ) ( not ( = ?auto_213607 ?auto_213605 ) ) ( not ( = ?auto_213607 ?auto_213609 ) ) ( ON ?auto_213608 ?auto_213607 ) ( ON ?auto_213606 ?auto_213608 ) ( CLEAR ?auto_213606 ) ( HOLDING ?auto_213609 ) ( CLEAR ?auto_213605 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213605 ?auto_213609 )
      ( MAKE-3PILE ?auto_213601 ?auto_213602 ?auto_213603 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213610 - BLOCK
      ?auto_213611 - BLOCK
      ?auto_213612 - BLOCK
    )
    :vars
    (
      ?auto_213614 - BLOCK
      ?auto_213618 - BLOCK
      ?auto_213617 - BLOCK
      ?auto_213615 - BLOCK
      ?auto_213613 - BLOCK
      ?auto_213616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213614 ?auto_213612 ) ( ON-TABLE ?auto_213610 ) ( ON ?auto_213611 ?auto_213610 ) ( ON ?auto_213612 ?auto_213611 ) ( not ( = ?auto_213610 ?auto_213611 ) ) ( not ( = ?auto_213610 ?auto_213612 ) ) ( not ( = ?auto_213610 ?auto_213614 ) ) ( not ( = ?auto_213611 ?auto_213612 ) ) ( not ( = ?auto_213611 ?auto_213614 ) ) ( not ( = ?auto_213612 ?auto_213614 ) ) ( not ( = ?auto_213610 ?auto_213618 ) ) ( not ( = ?auto_213610 ?auto_213617 ) ) ( not ( = ?auto_213611 ?auto_213618 ) ) ( not ( = ?auto_213611 ?auto_213617 ) ) ( not ( = ?auto_213612 ?auto_213618 ) ) ( not ( = ?auto_213612 ?auto_213617 ) ) ( not ( = ?auto_213614 ?auto_213618 ) ) ( not ( = ?auto_213614 ?auto_213617 ) ) ( not ( = ?auto_213618 ?auto_213617 ) ) ( ON ?auto_213618 ?auto_213614 ) ( ON-TABLE ?auto_213615 ) ( not ( = ?auto_213615 ?auto_213613 ) ) ( not ( = ?auto_213615 ?auto_213616 ) ) ( not ( = ?auto_213615 ?auto_213617 ) ) ( not ( = ?auto_213613 ?auto_213616 ) ) ( not ( = ?auto_213613 ?auto_213617 ) ) ( not ( = ?auto_213616 ?auto_213617 ) ) ( not ( = ?auto_213610 ?auto_213616 ) ) ( not ( = ?auto_213610 ?auto_213615 ) ) ( not ( = ?auto_213610 ?auto_213613 ) ) ( not ( = ?auto_213611 ?auto_213616 ) ) ( not ( = ?auto_213611 ?auto_213615 ) ) ( not ( = ?auto_213611 ?auto_213613 ) ) ( not ( = ?auto_213612 ?auto_213616 ) ) ( not ( = ?auto_213612 ?auto_213615 ) ) ( not ( = ?auto_213612 ?auto_213613 ) ) ( not ( = ?auto_213614 ?auto_213616 ) ) ( not ( = ?auto_213614 ?auto_213615 ) ) ( not ( = ?auto_213614 ?auto_213613 ) ) ( not ( = ?auto_213618 ?auto_213616 ) ) ( not ( = ?auto_213618 ?auto_213615 ) ) ( not ( = ?auto_213618 ?auto_213613 ) ) ( ON ?auto_213617 ?auto_213618 ) ( ON ?auto_213616 ?auto_213617 ) ( CLEAR ?auto_213615 ) ( ON ?auto_213613 ?auto_213616 ) ( CLEAR ?auto_213613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213610 ?auto_213611 ?auto_213612 ?auto_213614 ?auto_213618 ?auto_213617 ?auto_213616 )
      ( MAKE-3PILE ?auto_213610 ?auto_213611 ?auto_213612 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213619 - BLOCK
      ?auto_213620 - BLOCK
      ?auto_213621 - BLOCK
    )
    :vars
    (
      ?auto_213626 - BLOCK
      ?auto_213625 - BLOCK
      ?auto_213623 - BLOCK
      ?auto_213627 - BLOCK
      ?auto_213622 - BLOCK
      ?auto_213624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213626 ?auto_213621 ) ( ON-TABLE ?auto_213619 ) ( ON ?auto_213620 ?auto_213619 ) ( ON ?auto_213621 ?auto_213620 ) ( not ( = ?auto_213619 ?auto_213620 ) ) ( not ( = ?auto_213619 ?auto_213621 ) ) ( not ( = ?auto_213619 ?auto_213626 ) ) ( not ( = ?auto_213620 ?auto_213621 ) ) ( not ( = ?auto_213620 ?auto_213626 ) ) ( not ( = ?auto_213621 ?auto_213626 ) ) ( not ( = ?auto_213619 ?auto_213625 ) ) ( not ( = ?auto_213619 ?auto_213623 ) ) ( not ( = ?auto_213620 ?auto_213625 ) ) ( not ( = ?auto_213620 ?auto_213623 ) ) ( not ( = ?auto_213621 ?auto_213625 ) ) ( not ( = ?auto_213621 ?auto_213623 ) ) ( not ( = ?auto_213626 ?auto_213625 ) ) ( not ( = ?auto_213626 ?auto_213623 ) ) ( not ( = ?auto_213625 ?auto_213623 ) ) ( ON ?auto_213625 ?auto_213626 ) ( not ( = ?auto_213627 ?auto_213622 ) ) ( not ( = ?auto_213627 ?auto_213624 ) ) ( not ( = ?auto_213627 ?auto_213623 ) ) ( not ( = ?auto_213622 ?auto_213624 ) ) ( not ( = ?auto_213622 ?auto_213623 ) ) ( not ( = ?auto_213624 ?auto_213623 ) ) ( not ( = ?auto_213619 ?auto_213624 ) ) ( not ( = ?auto_213619 ?auto_213627 ) ) ( not ( = ?auto_213619 ?auto_213622 ) ) ( not ( = ?auto_213620 ?auto_213624 ) ) ( not ( = ?auto_213620 ?auto_213627 ) ) ( not ( = ?auto_213620 ?auto_213622 ) ) ( not ( = ?auto_213621 ?auto_213624 ) ) ( not ( = ?auto_213621 ?auto_213627 ) ) ( not ( = ?auto_213621 ?auto_213622 ) ) ( not ( = ?auto_213626 ?auto_213624 ) ) ( not ( = ?auto_213626 ?auto_213627 ) ) ( not ( = ?auto_213626 ?auto_213622 ) ) ( not ( = ?auto_213625 ?auto_213624 ) ) ( not ( = ?auto_213625 ?auto_213627 ) ) ( not ( = ?auto_213625 ?auto_213622 ) ) ( ON ?auto_213623 ?auto_213625 ) ( ON ?auto_213624 ?auto_213623 ) ( ON ?auto_213622 ?auto_213624 ) ( CLEAR ?auto_213622 ) ( HOLDING ?auto_213627 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213627 )
      ( MAKE-3PILE ?auto_213619 ?auto_213620 ?auto_213621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_213628 - BLOCK
      ?auto_213629 - BLOCK
      ?auto_213630 - BLOCK
    )
    :vars
    (
      ?auto_213631 - BLOCK
      ?auto_213632 - BLOCK
      ?auto_213635 - BLOCK
      ?auto_213636 - BLOCK
      ?auto_213634 - BLOCK
      ?auto_213633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213631 ?auto_213630 ) ( ON-TABLE ?auto_213628 ) ( ON ?auto_213629 ?auto_213628 ) ( ON ?auto_213630 ?auto_213629 ) ( not ( = ?auto_213628 ?auto_213629 ) ) ( not ( = ?auto_213628 ?auto_213630 ) ) ( not ( = ?auto_213628 ?auto_213631 ) ) ( not ( = ?auto_213629 ?auto_213630 ) ) ( not ( = ?auto_213629 ?auto_213631 ) ) ( not ( = ?auto_213630 ?auto_213631 ) ) ( not ( = ?auto_213628 ?auto_213632 ) ) ( not ( = ?auto_213628 ?auto_213635 ) ) ( not ( = ?auto_213629 ?auto_213632 ) ) ( not ( = ?auto_213629 ?auto_213635 ) ) ( not ( = ?auto_213630 ?auto_213632 ) ) ( not ( = ?auto_213630 ?auto_213635 ) ) ( not ( = ?auto_213631 ?auto_213632 ) ) ( not ( = ?auto_213631 ?auto_213635 ) ) ( not ( = ?auto_213632 ?auto_213635 ) ) ( ON ?auto_213632 ?auto_213631 ) ( not ( = ?auto_213636 ?auto_213634 ) ) ( not ( = ?auto_213636 ?auto_213633 ) ) ( not ( = ?auto_213636 ?auto_213635 ) ) ( not ( = ?auto_213634 ?auto_213633 ) ) ( not ( = ?auto_213634 ?auto_213635 ) ) ( not ( = ?auto_213633 ?auto_213635 ) ) ( not ( = ?auto_213628 ?auto_213633 ) ) ( not ( = ?auto_213628 ?auto_213636 ) ) ( not ( = ?auto_213628 ?auto_213634 ) ) ( not ( = ?auto_213629 ?auto_213633 ) ) ( not ( = ?auto_213629 ?auto_213636 ) ) ( not ( = ?auto_213629 ?auto_213634 ) ) ( not ( = ?auto_213630 ?auto_213633 ) ) ( not ( = ?auto_213630 ?auto_213636 ) ) ( not ( = ?auto_213630 ?auto_213634 ) ) ( not ( = ?auto_213631 ?auto_213633 ) ) ( not ( = ?auto_213631 ?auto_213636 ) ) ( not ( = ?auto_213631 ?auto_213634 ) ) ( not ( = ?auto_213632 ?auto_213633 ) ) ( not ( = ?auto_213632 ?auto_213636 ) ) ( not ( = ?auto_213632 ?auto_213634 ) ) ( ON ?auto_213635 ?auto_213632 ) ( ON ?auto_213633 ?auto_213635 ) ( ON ?auto_213634 ?auto_213633 ) ( ON ?auto_213636 ?auto_213634 ) ( CLEAR ?auto_213636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213628 ?auto_213629 ?auto_213630 ?auto_213631 ?auto_213632 ?auto_213635 ?auto_213633 ?auto_213634 )
      ( MAKE-3PILE ?auto_213628 ?auto_213629 ?auto_213630 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213643 - BLOCK
      ?auto_213644 - BLOCK
      ?auto_213645 - BLOCK
      ?auto_213646 - BLOCK
      ?auto_213647 - BLOCK
      ?auto_213648 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_213648 ) ( CLEAR ?auto_213647 ) ( ON-TABLE ?auto_213643 ) ( ON ?auto_213644 ?auto_213643 ) ( ON ?auto_213645 ?auto_213644 ) ( ON ?auto_213646 ?auto_213645 ) ( ON ?auto_213647 ?auto_213646 ) ( not ( = ?auto_213643 ?auto_213644 ) ) ( not ( = ?auto_213643 ?auto_213645 ) ) ( not ( = ?auto_213643 ?auto_213646 ) ) ( not ( = ?auto_213643 ?auto_213647 ) ) ( not ( = ?auto_213643 ?auto_213648 ) ) ( not ( = ?auto_213644 ?auto_213645 ) ) ( not ( = ?auto_213644 ?auto_213646 ) ) ( not ( = ?auto_213644 ?auto_213647 ) ) ( not ( = ?auto_213644 ?auto_213648 ) ) ( not ( = ?auto_213645 ?auto_213646 ) ) ( not ( = ?auto_213645 ?auto_213647 ) ) ( not ( = ?auto_213645 ?auto_213648 ) ) ( not ( = ?auto_213646 ?auto_213647 ) ) ( not ( = ?auto_213646 ?auto_213648 ) ) ( not ( = ?auto_213647 ?auto_213648 ) ) )
    :subtasks
    ( ( !STACK ?auto_213648 ?auto_213647 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213649 - BLOCK
      ?auto_213650 - BLOCK
      ?auto_213651 - BLOCK
      ?auto_213652 - BLOCK
      ?auto_213653 - BLOCK
      ?auto_213654 - BLOCK
    )
    :vars
    (
      ?auto_213655 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_213653 ) ( ON-TABLE ?auto_213649 ) ( ON ?auto_213650 ?auto_213649 ) ( ON ?auto_213651 ?auto_213650 ) ( ON ?auto_213652 ?auto_213651 ) ( ON ?auto_213653 ?auto_213652 ) ( not ( = ?auto_213649 ?auto_213650 ) ) ( not ( = ?auto_213649 ?auto_213651 ) ) ( not ( = ?auto_213649 ?auto_213652 ) ) ( not ( = ?auto_213649 ?auto_213653 ) ) ( not ( = ?auto_213649 ?auto_213654 ) ) ( not ( = ?auto_213650 ?auto_213651 ) ) ( not ( = ?auto_213650 ?auto_213652 ) ) ( not ( = ?auto_213650 ?auto_213653 ) ) ( not ( = ?auto_213650 ?auto_213654 ) ) ( not ( = ?auto_213651 ?auto_213652 ) ) ( not ( = ?auto_213651 ?auto_213653 ) ) ( not ( = ?auto_213651 ?auto_213654 ) ) ( not ( = ?auto_213652 ?auto_213653 ) ) ( not ( = ?auto_213652 ?auto_213654 ) ) ( not ( = ?auto_213653 ?auto_213654 ) ) ( ON ?auto_213654 ?auto_213655 ) ( CLEAR ?auto_213654 ) ( HAND-EMPTY ) ( not ( = ?auto_213649 ?auto_213655 ) ) ( not ( = ?auto_213650 ?auto_213655 ) ) ( not ( = ?auto_213651 ?auto_213655 ) ) ( not ( = ?auto_213652 ?auto_213655 ) ) ( not ( = ?auto_213653 ?auto_213655 ) ) ( not ( = ?auto_213654 ?auto_213655 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213654 ?auto_213655 )
      ( MAKE-6PILE ?auto_213649 ?auto_213650 ?auto_213651 ?auto_213652 ?auto_213653 ?auto_213654 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213656 - BLOCK
      ?auto_213657 - BLOCK
      ?auto_213658 - BLOCK
      ?auto_213659 - BLOCK
      ?auto_213660 - BLOCK
      ?auto_213661 - BLOCK
    )
    :vars
    (
      ?auto_213662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213656 ) ( ON ?auto_213657 ?auto_213656 ) ( ON ?auto_213658 ?auto_213657 ) ( ON ?auto_213659 ?auto_213658 ) ( not ( = ?auto_213656 ?auto_213657 ) ) ( not ( = ?auto_213656 ?auto_213658 ) ) ( not ( = ?auto_213656 ?auto_213659 ) ) ( not ( = ?auto_213656 ?auto_213660 ) ) ( not ( = ?auto_213656 ?auto_213661 ) ) ( not ( = ?auto_213657 ?auto_213658 ) ) ( not ( = ?auto_213657 ?auto_213659 ) ) ( not ( = ?auto_213657 ?auto_213660 ) ) ( not ( = ?auto_213657 ?auto_213661 ) ) ( not ( = ?auto_213658 ?auto_213659 ) ) ( not ( = ?auto_213658 ?auto_213660 ) ) ( not ( = ?auto_213658 ?auto_213661 ) ) ( not ( = ?auto_213659 ?auto_213660 ) ) ( not ( = ?auto_213659 ?auto_213661 ) ) ( not ( = ?auto_213660 ?auto_213661 ) ) ( ON ?auto_213661 ?auto_213662 ) ( CLEAR ?auto_213661 ) ( not ( = ?auto_213656 ?auto_213662 ) ) ( not ( = ?auto_213657 ?auto_213662 ) ) ( not ( = ?auto_213658 ?auto_213662 ) ) ( not ( = ?auto_213659 ?auto_213662 ) ) ( not ( = ?auto_213660 ?auto_213662 ) ) ( not ( = ?auto_213661 ?auto_213662 ) ) ( HOLDING ?auto_213660 ) ( CLEAR ?auto_213659 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213656 ?auto_213657 ?auto_213658 ?auto_213659 ?auto_213660 )
      ( MAKE-6PILE ?auto_213656 ?auto_213657 ?auto_213658 ?auto_213659 ?auto_213660 ?auto_213661 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213663 - BLOCK
      ?auto_213664 - BLOCK
      ?auto_213665 - BLOCK
      ?auto_213666 - BLOCK
      ?auto_213667 - BLOCK
      ?auto_213668 - BLOCK
    )
    :vars
    (
      ?auto_213669 - BLOCK
      ?auto_213671 - BLOCK
      ?auto_213670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213663 ) ( ON ?auto_213664 ?auto_213663 ) ( ON ?auto_213665 ?auto_213664 ) ( ON ?auto_213666 ?auto_213665 ) ( not ( = ?auto_213663 ?auto_213664 ) ) ( not ( = ?auto_213663 ?auto_213665 ) ) ( not ( = ?auto_213663 ?auto_213666 ) ) ( not ( = ?auto_213663 ?auto_213667 ) ) ( not ( = ?auto_213663 ?auto_213668 ) ) ( not ( = ?auto_213664 ?auto_213665 ) ) ( not ( = ?auto_213664 ?auto_213666 ) ) ( not ( = ?auto_213664 ?auto_213667 ) ) ( not ( = ?auto_213664 ?auto_213668 ) ) ( not ( = ?auto_213665 ?auto_213666 ) ) ( not ( = ?auto_213665 ?auto_213667 ) ) ( not ( = ?auto_213665 ?auto_213668 ) ) ( not ( = ?auto_213666 ?auto_213667 ) ) ( not ( = ?auto_213666 ?auto_213668 ) ) ( not ( = ?auto_213667 ?auto_213668 ) ) ( ON ?auto_213668 ?auto_213669 ) ( not ( = ?auto_213663 ?auto_213669 ) ) ( not ( = ?auto_213664 ?auto_213669 ) ) ( not ( = ?auto_213665 ?auto_213669 ) ) ( not ( = ?auto_213666 ?auto_213669 ) ) ( not ( = ?auto_213667 ?auto_213669 ) ) ( not ( = ?auto_213668 ?auto_213669 ) ) ( CLEAR ?auto_213666 ) ( ON ?auto_213667 ?auto_213668 ) ( CLEAR ?auto_213667 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213671 ) ( ON ?auto_213670 ?auto_213671 ) ( ON ?auto_213669 ?auto_213670 ) ( not ( = ?auto_213671 ?auto_213670 ) ) ( not ( = ?auto_213671 ?auto_213669 ) ) ( not ( = ?auto_213671 ?auto_213668 ) ) ( not ( = ?auto_213671 ?auto_213667 ) ) ( not ( = ?auto_213670 ?auto_213669 ) ) ( not ( = ?auto_213670 ?auto_213668 ) ) ( not ( = ?auto_213670 ?auto_213667 ) ) ( not ( = ?auto_213663 ?auto_213671 ) ) ( not ( = ?auto_213663 ?auto_213670 ) ) ( not ( = ?auto_213664 ?auto_213671 ) ) ( not ( = ?auto_213664 ?auto_213670 ) ) ( not ( = ?auto_213665 ?auto_213671 ) ) ( not ( = ?auto_213665 ?auto_213670 ) ) ( not ( = ?auto_213666 ?auto_213671 ) ) ( not ( = ?auto_213666 ?auto_213670 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213671 ?auto_213670 ?auto_213669 ?auto_213668 )
      ( MAKE-6PILE ?auto_213663 ?auto_213664 ?auto_213665 ?auto_213666 ?auto_213667 ?auto_213668 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213672 - BLOCK
      ?auto_213673 - BLOCK
      ?auto_213674 - BLOCK
      ?auto_213675 - BLOCK
      ?auto_213676 - BLOCK
      ?auto_213677 - BLOCK
    )
    :vars
    (
      ?auto_213678 - BLOCK
      ?auto_213680 - BLOCK
      ?auto_213679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213672 ) ( ON ?auto_213673 ?auto_213672 ) ( ON ?auto_213674 ?auto_213673 ) ( not ( = ?auto_213672 ?auto_213673 ) ) ( not ( = ?auto_213672 ?auto_213674 ) ) ( not ( = ?auto_213672 ?auto_213675 ) ) ( not ( = ?auto_213672 ?auto_213676 ) ) ( not ( = ?auto_213672 ?auto_213677 ) ) ( not ( = ?auto_213673 ?auto_213674 ) ) ( not ( = ?auto_213673 ?auto_213675 ) ) ( not ( = ?auto_213673 ?auto_213676 ) ) ( not ( = ?auto_213673 ?auto_213677 ) ) ( not ( = ?auto_213674 ?auto_213675 ) ) ( not ( = ?auto_213674 ?auto_213676 ) ) ( not ( = ?auto_213674 ?auto_213677 ) ) ( not ( = ?auto_213675 ?auto_213676 ) ) ( not ( = ?auto_213675 ?auto_213677 ) ) ( not ( = ?auto_213676 ?auto_213677 ) ) ( ON ?auto_213677 ?auto_213678 ) ( not ( = ?auto_213672 ?auto_213678 ) ) ( not ( = ?auto_213673 ?auto_213678 ) ) ( not ( = ?auto_213674 ?auto_213678 ) ) ( not ( = ?auto_213675 ?auto_213678 ) ) ( not ( = ?auto_213676 ?auto_213678 ) ) ( not ( = ?auto_213677 ?auto_213678 ) ) ( ON ?auto_213676 ?auto_213677 ) ( CLEAR ?auto_213676 ) ( ON-TABLE ?auto_213680 ) ( ON ?auto_213679 ?auto_213680 ) ( ON ?auto_213678 ?auto_213679 ) ( not ( = ?auto_213680 ?auto_213679 ) ) ( not ( = ?auto_213680 ?auto_213678 ) ) ( not ( = ?auto_213680 ?auto_213677 ) ) ( not ( = ?auto_213680 ?auto_213676 ) ) ( not ( = ?auto_213679 ?auto_213678 ) ) ( not ( = ?auto_213679 ?auto_213677 ) ) ( not ( = ?auto_213679 ?auto_213676 ) ) ( not ( = ?auto_213672 ?auto_213680 ) ) ( not ( = ?auto_213672 ?auto_213679 ) ) ( not ( = ?auto_213673 ?auto_213680 ) ) ( not ( = ?auto_213673 ?auto_213679 ) ) ( not ( = ?auto_213674 ?auto_213680 ) ) ( not ( = ?auto_213674 ?auto_213679 ) ) ( not ( = ?auto_213675 ?auto_213680 ) ) ( not ( = ?auto_213675 ?auto_213679 ) ) ( HOLDING ?auto_213675 ) ( CLEAR ?auto_213674 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213672 ?auto_213673 ?auto_213674 ?auto_213675 )
      ( MAKE-6PILE ?auto_213672 ?auto_213673 ?auto_213674 ?auto_213675 ?auto_213676 ?auto_213677 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213681 - BLOCK
      ?auto_213682 - BLOCK
      ?auto_213683 - BLOCK
      ?auto_213684 - BLOCK
      ?auto_213685 - BLOCK
      ?auto_213686 - BLOCK
    )
    :vars
    (
      ?auto_213688 - BLOCK
      ?auto_213687 - BLOCK
      ?auto_213689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213681 ) ( ON ?auto_213682 ?auto_213681 ) ( ON ?auto_213683 ?auto_213682 ) ( not ( = ?auto_213681 ?auto_213682 ) ) ( not ( = ?auto_213681 ?auto_213683 ) ) ( not ( = ?auto_213681 ?auto_213684 ) ) ( not ( = ?auto_213681 ?auto_213685 ) ) ( not ( = ?auto_213681 ?auto_213686 ) ) ( not ( = ?auto_213682 ?auto_213683 ) ) ( not ( = ?auto_213682 ?auto_213684 ) ) ( not ( = ?auto_213682 ?auto_213685 ) ) ( not ( = ?auto_213682 ?auto_213686 ) ) ( not ( = ?auto_213683 ?auto_213684 ) ) ( not ( = ?auto_213683 ?auto_213685 ) ) ( not ( = ?auto_213683 ?auto_213686 ) ) ( not ( = ?auto_213684 ?auto_213685 ) ) ( not ( = ?auto_213684 ?auto_213686 ) ) ( not ( = ?auto_213685 ?auto_213686 ) ) ( ON ?auto_213686 ?auto_213688 ) ( not ( = ?auto_213681 ?auto_213688 ) ) ( not ( = ?auto_213682 ?auto_213688 ) ) ( not ( = ?auto_213683 ?auto_213688 ) ) ( not ( = ?auto_213684 ?auto_213688 ) ) ( not ( = ?auto_213685 ?auto_213688 ) ) ( not ( = ?auto_213686 ?auto_213688 ) ) ( ON ?auto_213685 ?auto_213686 ) ( ON-TABLE ?auto_213687 ) ( ON ?auto_213689 ?auto_213687 ) ( ON ?auto_213688 ?auto_213689 ) ( not ( = ?auto_213687 ?auto_213689 ) ) ( not ( = ?auto_213687 ?auto_213688 ) ) ( not ( = ?auto_213687 ?auto_213686 ) ) ( not ( = ?auto_213687 ?auto_213685 ) ) ( not ( = ?auto_213689 ?auto_213688 ) ) ( not ( = ?auto_213689 ?auto_213686 ) ) ( not ( = ?auto_213689 ?auto_213685 ) ) ( not ( = ?auto_213681 ?auto_213687 ) ) ( not ( = ?auto_213681 ?auto_213689 ) ) ( not ( = ?auto_213682 ?auto_213687 ) ) ( not ( = ?auto_213682 ?auto_213689 ) ) ( not ( = ?auto_213683 ?auto_213687 ) ) ( not ( = ?auto_213683 ?auto_213689 ) ) ( not ( = ?auto_213684 ?auto_213687 ) ) ( not ( = ?auto_213684 ?auto_213689 ) ) ( CLEAR ?auto_213683 ) ( ON ?auto_213684 ?auto_213685 ) ( CLEAR ?auto_213684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213687 ?auto_213689 ?auto_213688 ?auto_213686 ?auto_213685 )
      ( MAKE-6PILE ?auto_213681 ?auto_213682 ?auto_213683 ?auto_213684 ?auto_213685 ?auto_213686 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213690 - BLOCK
      ?auto_213691 - BLOCK
      ?auto_213692 - BLOCK
      ?auto_213693 - BLOCK
      ?auto_213694 - BLOCK
      ?auto_213695 - BLOCK
    )
    :vars
    (
      ?auto_213697 - BLOCK
      ?auto_213696 - BLOCK
      ?auto_213698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213690 ) ( ON ?auto_213691 ?auto_213690 ) ( not ( = ?auto_213690 ?auto_213691 ) ) ( not ( = ?auto_213690 ?auto_213692 ) ) ( not ( = ?auto_213690 ?auto_213693 ) ) ( not ( = ?auto_213690 ?auto_213694 ) ) ( not ( = ?auto_213690 ?auto_213695 ) ) ( not ( = ?auto_213691 ?auto_213692 ) ) ( not ( = ?auto_213691 ?auto_213693 ) ) ( not ( = ?auto_213691 ?auto_213694 ) ) ( not ( = ?auto_213691 ?auto_213695 ) ) ( not ( = ?auto_213692 ?auto_213693 ) ) ( not ( = ?auto_213692 ?auto_213694 ) ) ( not ( = ?auto_213692 ?auto_213695 ) ) ( not ( = ?auto_213693 ?auto_213694 ) ) ( not ( = ?auto_213693 ?auto_213695 ) ) ( not ( = ?auto_213694 ?auto_213695 ) ) ( ON ?auto_213695 ?auto_213697 ) ( not ( = ?auto_213690 ?auto_213697 ) ) ( not ( = ?auto_213691 ?auto_213697 ) ) ( not ( = ?auto_213692 ?auto_213697 ) ) ( not ( = ?auto_213693 ?auto_213697 ) ) ( not ( = ?auto_213694 ?auto_213697 ) ) ( not ( = ?auto_213695 ?auto_213697 ) ) ( ON ?auto_213694 ?auto_213695 ) ( ON-TABLE ?auto_213696 ) ( ON ?auto_213698 ?auto_213696 ) ( ON ?auto_213697 ?auto_213698 ) ( not ( = ?auto_213696 ?auto_213698 ) ) ( not ( = ?auto_213696 ?auto_213697 ) ) ( not ( = ?auto_213696 ?auto_213695 ) ) ( not ( = ?auto_213696 ?auto_213694 ) ) ( not ( = ?auto_213698 ?auto_213697 ) ) ( not ( = ?auto_213698 ?auto_213695 ) ) ( not ( = ?auto_213698 ?auto_213694 ) ) ( not ( = ?auto_213690 ?auto_213696 ) ) ( not ( = ?auto_213690 ?auto_213698 ) ) ( not ( = ?auto_213691 ?auto_213696 ) ) ( not ( = ?auto_213691 ?auto_213698 ) ) ( not ( = ?auto_213692 ?auto_213696 ) ) ( not ( = ?auto_213692 ?auto_213698 ) ) ( not ( = ?auto_213693 ?auto_213696 ) ) ( not ( = ?auto_213693 ?auto_213698 ) ) ( ON ?auto_213693 ?auto_213694 ) ( CLEAR ?auto_213693 ) ( HOLDING ?auto_213692 ) ( CLEAR ?auto_213691 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213690 ?auto_213691 ?auto_213692 )
      ( MAKE-6PILE ?auto_213690 ?auto_213691 ?auto_213692 ?auto_213693 ?auto_213694 ?auto_213695 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213699 - BLOCK
      ?auto_213700 - BLOCK
      ?auto_213701 - BLOCK
      ?auto_213702 - BLOCK
      ?auto_213703 - BLOCK
      ?auto_213704 - BLOCK
    )
    :vars
    (
      ?auto_213706 - BLOCK
      ?auto_213705 - BLOCK
      ?auto_213707 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213699 ) ( ON ?auto_213700 ?auto_213699 ) ( not ( = ?auto_213699 ?auto_213700 ) ) ( not ( = ?auto_213699 ?auto_213701 ) ) ( not ( = ?auto_213699 ?auto_213702 ) ) ( not ( = ?auto_213699 ?auto_213703 ) ) ( not ( = ?auto_213699 ?auto_213704 ) ) ( not ( = ?auto_213700 ?auto_213701 ) ) ( not ( = ?auto_213700 ?auto_213702 ) ) ( not ( = ?auto_213700 ?auto_213703 ) ) ( not ( = ?auto_213700 ?auto_213704 ) ) ( not ( = ?auto_213701 ?auto_213702 ) ) ( not ( = ?auto_213701 ?auto_213703 ) ) ( not ( = ?auto_213701 ?auto_213704 ) ) ( not ( = ?auto_213702 ?auto_213703 ) ) ( not ( = ?auto_213702 ?auto_213704 ) ) ( not ( = ?auto_213703 ?auto_213704 ) ) ( ON ?auto_213704 ?auto_213706 ) ( not ( = ?auto_213699 ?auto_213706 ) ) ( not ( = ?auto_213700 ?auto_213706 ) ) ( not ( = ?auto_213701 ?auto_213706 ) ) ( not ( = ?auto_213702 ?auto_213706 ) ) ( not ( = ?auto_213703 ?auto_213706 ) ) ( not ( = ?auto_213704 ?auto_213706 ) ) ( ON ?auto_213703 ?auto_213704 ) ( ON-TABLE ?auto_213705 ) ( ON ?auto_213707 ?auto_213705 ) ( ON ?auto_213706 ?auto_213707 ) ( not ( = ?auto_213705 ?auto_213707 ) ) ( not ( = ?auto_213705 ?auto_213706 ) ) ( not ( = ?auto_213705 ?auto_213704 ) ) ( not ( = ?auto_213705 ?auto_213703 ) ) ( not ( = ?auto_213707 ?auto_213706 ) ) ( not ( = ?auto_213707 ?auto_213704 ) ) ( not ( = ?auto_213707 ?auto_213703 ) ) ( not ( = ?auto_213699 ?auto_213705 ) ) ( not ( = ?auto_213699 ?auto_213707 ) ) ( not ( = ?auto_213700 ?auto_213705 ) ) ( not ( = ?auto_213700 ?auto_213707 ) ) ( not ( = ?auto_213701 ?auto_213705 ) ) ( not ( = ?auto_213701 ?auto_213707 ) ) ( not ( = ?auto_213702 ?auto_213705 ) ) ( not ( = ?auto_213702 ?auto_213707 ) ) ( ON ?auto_213702 ?auto_213703 ) ( CLEAR ?auto_213700 ) ( ON ?auto_213701 ?auto_213702 ) ( CLEAR ?auto_213701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213705 ?auto_213707 ?auto_213706 ?auto_213704 ?auto_213703 ?auto_213702 )
      ( MAKE-6PILE ?auto_213699 ?auto_213700 ?auto_213701 ?auto_213702 ?auto_213703 ?auto_213704 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213708 - BLOCK
      ?auto_213709 - BLOCK
      ?auto_213710 - BLOCK
      ?auto_213711 - BLOCK
      ?auto_213712 - BLOCK
      ?auto_213713 - BLOCK
    )
    :vars
    (
      ?auto_213715 - BLOCK
      ?auto_213716 - BLOCK
      ?auto_213714 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213708 ) ( not ( = ?auto_213708 ?auto_213709 ) ) ( not ( = ?auto_213708 ?auto_213710 ) ) ( not ( = ?auto_213708 ?auto_213711 ) ) ( not ( = ?auto_213708 ?auto_213712 ) ) ( not ( = ?auto_213708 ?auto_213713 ) ) ( not ( = ?auto_213709 ?auto_213710 ) ) ( not ( = ?auto_213709 ?auto_213711 ) ) ( not ( = ?auto_213709 ?auto_213712 ) ) ( not ( = ?auto_213709 ?auto_213713 ) ) ( not ( = ?auto_213710 ?auto_213711 ) ) ( not ( = ?auto_213710 ?auto_213712 ) ) ( not ( = ?auto_213710 ?auto_213713 ) ) ( not ( = ?auto_213711 ?auto_213712 ) ) ( not ( = ?auto_213711 ?auto_213713 ) ) ( not ( = ?auto_213712 ?auto_213713 ) ) ( ON ?auto_213713 ?auto_213715 ) ( not ( = ?auto_213708 ?auto_213715 ) ) ( not ( = ?auto_213709 ?auto_213715 ) ) ( not ( = ?auto_213710 ?auto_213715 ) ) ( not ( = ?auto_213711 ?auto_213715 ) ) ( not ( = ?auto_213712 ?auto_213715 ) ) ( not ( = ?auto_213713 ?auto_213715 ) ) ( ON ?auto_213712 ?auto_213713 ) ( ON-TABLE ?auto_213716 ) ( ON ?auto_213714 ?auto_213716 ) ( ON ?auto_213715 ?auto_213714 ) ( not ( = ?auto_213716 ?auto_213714 ) ) ( not ( = ?auto_213716 ?auto_213715 ) ) ( not ( = ?auto_213716 ?auto_213713 ) ) ( not ( = ?auto_213716 ?auto_213712 ) ) ( not ( = ?auto_213714 ?auto_213715 ) ) ( not ( = ?auto_213714 ?auto_213713 ) ) ( not ( = ?auto_213714 ?auto_213712 ) ) ( not ( = ?auto_213708 ?auto_213716 ) ) ( not ( = ?auto_213708 ?auto_213714 ) ) ( not ( = ?auto_213709 ?auto_213716 ) ) ( not ( = ?auto_213709 ?auto_213714 ) ) ( not ( = ?auto_213710 ?auto_213716 ) ) ( not ( = ?auto_213710 ?auto_213714 ) ) ( not ( = ?auto_213711 ?auto_213716 ) ) ( not ( = ?auto_213711 ?auto_213714 ) ) ( ON ?auto_213711 ?auto_213712 ) ( ON ?auto_213710 ?auto_213711 ) ( CLEAR ?auto_213710 ) ( HOLDING ?auto_213709 ) ( CLEAR ?auto_213708 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213708 ?auto_213709 )
      ( MAKE-6PILE ?auto_213708 ?auto_213709 ?auto_213710 ?auto_213711 ?auto_213712 ?auto_213713 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213717 - BLOCK
      ?auto_213718 - BLOCK
      ?auto_213719 - BLOCK
      ?auto_213720 - BLOCK
      ?auto_213721 - BLOCK
      ?auto_213722 - BLOCK
    )
    :vars
    (
      ?auto_213723 - BLOCK
      ?auto_213724 - BLOCK
      ?auto_213725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213717 ) ( not ( = ?auto_213717 ?auto_213718 ) ) ( not ( = ?auto_213717 ?auto_213719 ) ) ( not ( = ?auto_213717 ?auto_213720 ) ) ( not ( = ?auto_213717 ?auto_213721 ) ) ( not ( = ?auto_213717 ?auto_213722 ) ) ( not ( = ?auto_213718 ?auto_213719 ) ) ( not ( = ?auto_213718 ?auto_213720 ) ) ( not ( = ?auto_213718 ?auto_213721 ) ) ( not ( = ?auto_213718 ?auto_213722 ) ) ( not ( = ?auto_213719 ?auto_213720 ) ) ( not ( = ?auto_213719 ?auto_213721 ) ) ( not ( = ?auto_213719 ?auto_213722 ) ) ( not ( = ?auto_213720 ?auto_213721 ) ) ( not ( = ?auto_213720 ?auto_213722 ) ) ( not ( = ?auto_213721 ?auto_213722 ) ) ( ON ?auto_213722 ?auto_213723 ) ( not ( = ?auto_213717 ?auto_213723 ) ) ( not ( = ?auto_213718 ?auto_213723 ) ) ( not ( = ?auto_213719 ?auto_213723 ) ) ( not ( = ?auto_213720 ?auto_213723 ) ) ( not ( = ?auto_213721 ?auto_213723 ) ) ( not ( = ?auto_213722 ?auto_213723 ) ) ( ON ?auto_213721 ?auto_213722 ) ( ON-TABLE ?auto_213724 ) ( ON ?auto_213725 ?auto_213724 ) ( ON ?auto_213723 ?auto_213725 ) ( not ( = ?auto_213724 ?auto_213725 ) ) ( not ( = ?auto_213724 ?auto_213723 ) ) ( not ( = ?auto_213724 ?auto_213722 ) ) ( not ( = ?auto_213724 ?auto_213721 ) ) ( not ( = ?auto_213725 ?auto_213723 ) ) ( not ( = ?auto_213725 ?auto_213722 ) ) ( not ( = ?auto_213725 ?auto_213721 ) ) ( not ( = ?auto_213717 ?auto_213724 ) ) ( not ( = ?auto_213717 ?auto_213725 ) ) ( not ( = ?auto_213718 ?auto_213724 ) ) ( not ( = ?auto_213718 ?auto_213725 ) ) ( not ( = ?auto_213719 ?auto_213724 ) ) ( not ( = ?auto_213719 ?auto_213725 ) ) ( not ( = ?auto_213720 ?auto_213724 ) ) ( not ( = ?auto_213720 ?auto_213725 ) ) ( ON ?auto_213720 ?auto_213721 ) ( ON ?auto_213719 ?auto_213720 ) ( CLEAR ?auto_213717 ) ( ON ?auto_213718 ?auto_213719 ) ( CLEAR ?auto_213718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213724 ?auto_213725 ?auto_213723 ?auto_213722 ?auto_213721 ?auto_213720 ?auto_213719 )
      ( MAKE-6PILE ?auto_213717 ?auto_213718 ?auto_213719 ?auto_213720 ?auto_213721 ?auto_213722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213726 - BLOCK
      ?auto_213727 - BLOCK
      ?auto_213728 - BLOCK
      ?auto_213729 - BLOCK
      ?auto_213730 - BLOCK
      ?auto_213731 - BLOCK
    )
    :vars
    (
      ?auto_213732 - BLOCK
      ?auto_213734 - BLOCK
      ?auto_213733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213726 ?auto_213727 ) ) ( not ( = ?auto_213726 ?auto_213728 ) ) ( not ( = ?auto_213726 ?auto_213729 ) ) ( not ( = ?auto_213726 ?auto_213730 ) ) ( not ( = ?auto_213726 ?auto_213731 ) ) ( not ( = ?auto_213727 ?auto_213728 ) ) ( not ( = ?auto_213727 ?auto_213729 ) ) ( not ( = ?auto_213727 ?auto_213730 ) ) ( not ( = ?auto_213727 ?auto_213731 ) ) ( not ( = ?auto_213728 ?auto_213729 ) ) ( not ( = ?auto_213728 ?auto_213730 ) ) ( not ( = ?auto_213728 ?auto_213731 ) ) ( not ( = ?auto_213729 ?auto_213730 ) ) ( not ( = ?auto_213729 ?auto_213731 ) ) ( not ( = ?auto_213730 ?auto_213731 ) ) ( ON ?auto_213731 ?auto_213732 ) ( not ( = ?auto_213726 ?auto_213732 ) ) ( not ( = ?auto_213727 ?auto_213732 ) ) ( not ( = ?auto_213728 ?auto_213732 ) ) ( not ( = ?auto_213729 ?auto_213732 ) ) ( not ( = ?auto_213730 ?auto_213732 ) ) ( not ( = ?auto_213731 ?auto_213732 ) ) ( ON ?auto_213730 ?auto_213731 ) ( ON-TABLE ?auto_213734 ) ( ON ?auto_213733 ?auto_213734 ) ( ON ?auto_213732 ?auto_213733 ) ( not ( = ?auto_213734 ?auto_213733 ) ) ( not ( = ?auto_213734 ?auto_213732 ) ) ( not ( = ?auto_213734 ?auto_213731 ) ) ( not ( = ?auto_213734 ?auto_213730 ) ) ( not ( = ?auto_213733 ?auto_213732 ) ) ( not ( = ?auto_213733 ?auto_213731 ) ) ( not ( = ?auto_213733 ?auto_213730 ) ) ( not ( = ?auto_213726 ?auto_213734 ) ) ( not ( = ?auto_213726 ?auto_213733 ) ) ( not ( = ?auto_213727 ?auto_213734 ) ) ( not ( = ?auto_213727 ?auto_213733 ) ) ( not ( = ?auto_213728 ?auto_213734 ) ) ( not ( = ?auto_213728 ?auto_213733 ) ) ( not ( = ?auto_213729 ?auto_213734 ) ) ( not ( = ?auto_213729 ?auto_213733 ) ) ( ON ?auto_213729 ?auto_213730 ) ( ON ?auto_213728 ?auto_213729 ) ( ON ?auto_213727 ?auto_213728 ) ( CLEAR ?auto_213727 ) ( HOLDING ?auto_213726 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213726 )
      ( MAKE-6PILE ?auto_213726 ?auto_213727 ?auto_213728 ?auto_213729 ?auto_213730 ?auto_213731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_213735 - BLOCK
      ?auto_213736 - BLOCK
      ?auto_213737 - BLOCK
      ?auto_213738 - BLOCK
      ?auto_213739 - BLOCK
      ?auto_213740 - BLOCK
    )
    :vars
    (
      ?auto_213741 - BLOCK
      ?auto_213742 - BLOCK
      ?auto_213743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213735 ?auto_213736 ) ) ( not ( = ?auto_213735 ?auto_213737 ) ) ( not ( = ?auto_213735 ?auto_213738 ) ) ( not ( = ?auto_213735 ?auto_213739 ) ) ( not ( = ?auto_213735 ?auto_213740 ) ) ( not ( = ?auto_213736 ?auto_213737 ) ) ( not ( = ?auto_213736 ?auto_213738 ) ) ( not ( = ?auto_213736 ?auto_213739 ) ) ( not ( = ?auto_213736 ?auto_213740 ) ) ( not ( = ?auto_213737 ?auto_213738 ) ) ( not ( = ?auto_213737 ?auto_213739 ) ) ( not ( = ?auto_213737 ?auto_213740 ) ) ( not ( = ?auto_213738 ?auto_213739 ) ) ( not ( = ?auto_213738 ?auto_213740 ) ) ( not ( = ?auto_213739 ?auto_213740 ) ) ( ON ?auto_213740 ?auto_213741 ) ( not ( = ?auto_213735 ?auto_213741 ) ) ( not ( = ?auto_213736 ?auto_213741 ) ) ( not ( = ?auto_213737 ?auto_213741 ) ) ( not ( = ?auto_213738 ?auto_213741 ) ) ( not ( = ?auto_213739 ?auto_213741 ) ) ( not ( = ?auto_213740 ?auto_213741 ) ) ( ON ?auto_213739 ?auto_213740 ) ( ON-TABLE ?auto_213742 ) ( ON ?auto_213743 ?auto_213742 ) ( ON ?auto_213741 ?auto_213743 ) ( not ( = ?auto_213742 ?auto_213743 ) ) ( not ( = ?auto_213742 ?auto_213741 ) ) ( not ( = ?auto_213742 ?auto_213740 ) ) ( not ( = ?auto_213742 ?auto_213739 ) ) ( not ( = ?auto_213743 ?auto_213741 ) ) ( not ( = ?auto_213743 ?auto_213740 ) ) ( not ( = ?auto_213743 ?auto_213739 ) ) ( not ( = ?auto_213735 ?auto_213742 ) ) ( not ( = ?auto_213735 ?auto_213743 ) ) ( not ( = ?auto_213736 ?auto_213742 ) ) ( not ( = ?auto_213736 ?auto_213743 ) ) ( not ( = ?auto_213737 ?auto_213742 ) ) ( not ( = ?auto_213737 ?auto_213743 ) ) ( not ( = ?auto_213738 ?auto_213742 ) ) ( not ( = ?auto_213738 ?auto_213743 ) ) ( ON ?auto_213738 ?auto_213739 ) ( ON ?auto_213737 ?auto_213738 ) ( ON ?auto_213736 ?auto_213737 ) ( ON ?auto_213735 ?auto_213736 ) ( CLEAR ?auto_213735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213742 ?auto_213743 ?auto_213741 ?auto_213740 ?auto_213739 ?auto_213738 ?auto_213737 ?auto_213736 )
      ( MAKE-6PILE ?auto_213735 ?auto_213736 ?auto_213737 ?auto_213738 ?auto_213739 ?auto_213740 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213746 - BLOCK
      ?auto_213747 - BLOCK
    )
    :vars
    (
      ?auto_213748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213748 ?auto_213747 ) ( CLEAR ?auto_213748 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213746 ) ( ON ?auto_213747 ?auto_213746 ) ( not ( = ?auto_213746 ?auto_213747 ) ) ( not ( = ?auto_213746 ?auto_213748 ) ) ( not ( = ?auto_213747 ?auto_213748 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213748 ?auto_213747 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213749 - BLOCK
      ?auto_213750 - BLOCK
    )
    :vars
    (
      ?auto_213751 - BLOCK
      ?auto_213752 - BLOCK
      ?auto_213753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213751 ?auto_213750 ) ( CLEAR ?auto_213751 ) ( ON-TABLE ?auto_213749 ) ( ON ?auto_213750 ?auto_213749 ) ( not ( = ?auto_213749 ?auto_213750 ) ) ( not ( = ?auto_213749 ?auto_213751 ) ) ( not ( = ?auto_213750 ?auto_213751 ) ) ( HOLDING ?auto_213752 ) ( CLEAR ?auto_213753 ) ( not ( = ?auto_213749 ?auto_213752 ) ) ( not ( = ?auto_213749 ?auto_213753 ) ) ( not ( = ?auto_213750 ?auto_213752 ) ) ( not ( = ?auto_213750 ?auto_213753 ) ) ( not ( = ?auto_213751 ?auto_213752 ) ) ( not ( = ?auto_213751 ?auto_213753 ) ) ( not ( = ?auto_213752 ?auto_213753 ) ) )
    :subtasks
    ( ( !STACK ?auto_213752 ?auto_213753 )
      ( MAKE-2PILE ?auto_213749 ?auto_213750 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213754 - BLOCK
      ?auto_213755 - BLOCK
    )
    :vars
    (
      ?auto_213757 - BLOCK
      ?auto_213758 - BLOCK
      ?auto_213756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213757 ?auto_213755 ) ( ON-TABLE ?auto_213754 ) ( ON ?auto_213755 ?auto_213754 ) ( not ( = ?auto_213754 ?auto_213755 ) ) ( not ( = ?auto_213754 ?auto_213757 ) ) ( not ( = ?auto_213755 ?auto_213757 ) ) ( CLEAR ?auto_213758 ) ( not ( = ?auto_213754 ?auto_213756 ) ) ( not ( = ?auto_213754 ?auto_213758 ) ) ( not ( = ?auto_213755 ?auto_213756 ) ) ( not ( = ?auto_213755 ?auto_213758 ) ) ( not ( = ?auto_213757 ?auto_213756 ) ) ( not ( = ?auto_213757 ?auto_213758 ) ) ( not ( = ?auto_213756 ?auto_213758 ) ) ( ON ?auto_213756 ?auto_213757 ) ( CLEAR ?auto_213756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213754 ?auto_213755 ?auto_213757 )
      ( MAKE-2PILE ?auto_213754 ?auto_213755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213759 - BLOCK
      ?auto_213760 - BLOCK
    )
    :vars
    (
      ?auto_213763 - BLOCK
      ?auto_213762 - BLOCK
      ?auto_213761 - BLOCK
      ?auto_213767 - BLOCK
      ?auto_213766 - BLOCK
      ?auto_213764 - BLOCK
      ?auto_213765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213763 ?auto_213760 ) ( ON-TABLE ?auto_213759 ) ( ON ?auto_213760 ?auto_213759 ) ( not ( = ?auto_213759 ?auto_213760 ) ) ( not ( = ?auto_213759 ?auto_213763 ) ) ( not ( = ?auto_213760 ?auto_213763 ) ) ( not ( = ?auto_213759 ?auto_213762 ) ) ( not ( = ?auto_213759 ?auto_213761 ) ) ( not ( = ?auto_213760 ?auto_213762 ) ) ( not ( = ?auto_213760 ?auto_213761 ) ) ( not ( = ?auto_213763 ?auto_213762 ) ) ( not ( = ?auto_213763 ?auto_213761 ) ) ( not ( = ?auto_213762 ?auto_213761 ) ) ( ON ?auto_213762 ?auto_213763 ) ( CLEAR ?auto_213762 ) ( HOLDING ?auto_213761 ) ( CLEAR ?auto_213767 ) ( ON-TABLE ?auto_213766 ) ( ON ?auto_213764 ?auto_213766 ) ( ON ?auto_213765 ?auto_213764 ) ( ON ?auto_213767 ?auto_213765 ) ( not ( = ?auto_213766 ?auto_213764 ) ) ( not ( = ?auto_213766 ?auto_213765 ) ) ( not ( = ?auto_213766 ?auto_213767 ) ) ( not ( = ?auto_213766 ?auto_213761 ) ) ( not ( = ?auto_213764 ?auto_213765 ) ) ( not ( = ?auto_213764 ?auto_213767 ) ) ( not ( = ?auto_213764 ?auto_213761 ) ) ( not ( = ?auto_213765 ?auto_213767 ) ) ( not ( = ?auto_213765 ?auto_213761 ) ) ( not ( = ?auto_213767 ?auto_213761 ) ) ( not ( = ?auto_213759 ?auto_213767 ) ) ( not ( = ?auto_213759 ?auto_213766 ) ) ( not ( = ?auto_213759 ?auto_213764 ) ) ( not ( = ?auto_213759 ?auto_213765 ) ) ( not ( = ?auto_213760 ?auto_213767 ) ) ( not ( = ?auto_213760 ?auto_213766 ) ) ( not ( = ?auto_213760 ?auto_213764 ) ) ( not ( = ?auto_213760 ?auto_213765 ) ) ( not ( = ?auto_213763 ?auto_213767 ) ) ( not ( = ?auto_213763 ?auto_213766 ) ) ( not ( = ?auto_213763 ?auto_213764 ) ) ( not ( = ?auto_213763 ?auto_213765 ) ) ( not ( = ?auto_213762 ?auto_213767 ) ) ( not ( = ?auto_213762 ?auto_213766 ) ) ( not ( = ?auto_213762 ?auto_213764 ) ) ( not ( = ?auto_213762 ?auto_213765 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213766 ?auto_213764 ?auto_213765 ?auto_213767 ?auto_213761 )
      ( MAKE-2PILE ?auto_213759 ?auto_213760 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213768 - BLOCK
      ?auto_213769 - BLOCK
    )
    :vars
    (
      ?auto_213775 - BLOCK
      ?auto_213774 - BLOCK
      ?auto_213776 - BLOCK
      ?auto_213771 - BLOCK
      ?auto_213773 - BLOCK
      ?auto_213772 - BLOCK
      ?auto_213770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213775 ?auto_213769 ) ( ON-TABLE ?auto_213768 ) ( ON ?auto_213769 ?auto_213768 ) ( not ( = ?auto_213768 ?auto_213769 ) ) ( not ( = ?auto_213768 ?auto_213775 ) ) ( not ( = ?auto_213769 ?auto_213775 ) ) ( not ( = ?auto_213768 ?auto_213774 ) ) ( not ( = ?auto_213768 ?auto_213776 ) ) ( not ( = ?auto_213769 ?auto_213774 ) ) ( not ( = ?auto_213769 ?auto_213776 ) ) ( not ( = ?auto_213775 ?auto_213774 ) ) ( not ( = ?auto_213775 ?auto_213776 ) ) ( not ( = ?auto_213774 ?auto_213776 ) ) ( ON ?auto_213774 ?auto_213775 ) ( CLEAR ?auto_213771 ) ( ON-TABLE ?auto_213773 ) ( ON ?auto_213772 ?auto_213773 ) ( ON ?auto_213770 ?auto_213772 ) ( ON ?auto_213771 ?auto_213770 ) ( not ( = ?auto_213773 ?auto_213772 ) ) ( not ( = ?auto_213773 ?auto_213770 ) ) ( not ( = ?auto_213773 ?auto_213771 ) ) ( not ( = ?auto_213773 ?auto_213776 ) ) ( not ( = ?auto_213772 ?auto_213770 ) ) ( not ( = ?auto_213772 ?auto_213771 ) ) ( not ( = ?auto_213772 ?auto_213776 ) ) ( not ( = ?auto_213770 ?auto_213771 ) ) ( not ( = ?auto_213770 ?auto_213776 ) ) ( not ( = ?auto_213771 ?auto_213776 ) ) ( not ( = ?auto_213768 ?auto_213771 ) ) ( not ( = ?auto_213768 ?auto_213773 ) ) ( not ( = ?auto_213768 ?auto_213772 ) ) ( not ( = ?auto_213768 ?auto_213770 ) ) ( not ( = ?auto_213769 ?auto_213771 ) ) ( not ( = ?auto_213769 ?auto_213773 ) ) ( not ( = ?auto_213769 ?auto_213772 ) ) ( not ( = ?auto_213769 ?auto_213770 ) ) ( not ( = ?auto_213775 ?auto_213771 ) ) ( not ( = ?auto_213775 ?auto_213773 ) ) ( not ( = ?auto_213775 ?auto_213772 ) ) ( not ( = ?auto_213775 ?auto_213770 ) ) ( not ( = ?auto_213774 ?auto_213771 ) ) ( not ( = ?auto_213774 ?auto_213773 ) ) ( not ( = ?auto_213774 ?auto_213772 ) ) ( not ( = ?auto_213774 ?auto_213770 ) ) ( ON ?auto_213776 ?auto_213774 ) ( CLEAR ?auto_213776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213768 ?auto_213769 ?auto_213775 ?auto_213774 )
      ( MAKE-2PILE ?auto_213768 ?auto_213769 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213777 - BLOCK
      ?auto_213778 - BLOCK
    )
    :vars
    (
      ?auto_213783 - BLOCK
      ?auto_213781 - BLOCK
      ?auto_213780 - BLOCK
      ?auto_213784 - BLOCK
      ?auto_213785 - BLOCK
      ?auto_213779 - BLOCK
      ?auto_213782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213783 ?auto_213778 ) ( ON-TABLE ?auto_213777 ) ( ON ?auto_213778 ?auto_213777 ) ( not ( = ?auto_213777 ?auto_213778 ) ) ( not ( = ?auto_213777 ?auto_213783 ) ) ( not ( = ?auto_213778 ?auto_213783 ) ) ( not ( = ?auto_213777 ?auto_213781 ) ) ( not ( = ?auto_213777 ?auto_213780 ) ) ( not ( = ?auto_213778 ?auto_213781 ) ) ( not ( = ?auto_213778 ?auto_213780 ) ) ( not ( = ?auto_213783 ?auto_213781 ) ) ( not ( = ?auto_213783 ?auto_213780 ) ) ( not ( = ?auto_213781 ?auto_213780 ) ) ( ON ?auto_213781 ?auto_213783 ) ( ON-TABLE ?auto_213784 ) ( ON ?auto_213785 ?auto_213784 ) ( ON ?auto_213779 ?auto_213785 ) ( not ( = ?auto_213784 ?auto_213785 ) ) ( not ( = ?auto_213784 ?auto_213779 ) ) ( not ( = ?auto_213784 ?auto_213782 ) ) ( not ( = ?auto_213784 ?auto_213780 ) ) ( not ( = ?auto_213785 ?auto_213779 ) ) ( not ( = ?auto_213785 ?auto_213782 ) ) ( not ( = ?auto_213785 ?auto_213780 ) ) ( not ( = ?auto_213779 ?auto_213782 ) ) ( not ( = ?auto_213779 ?auto_213780 ) ) ( not ( = ?auto_213782 ?auto_213780 ) ) ( not ( = ?auto_213777 ?auto_213782 ) ) ( not ( = ?auto_213777 ?auto_213784 ) ) ( not ( = ?auto_213777 ?auto_213785 ) ) ( not ( = ?auto_213777 ?auto_213779 ) ) ( not ( = ?auto_213778 ?auto_213782 ) ) ( not ( = ?auto_213778 ?auto_213784 ) ) ( not ( = ?auto_213778 ?auto_213785 ) ) ( not ( = ?auto_213778 ?auto_213779 ) ) ( not ( = ?auto_213783 ?auto_213782 ) ) ( not ( = ?auto_213783 ?auto_213784 ) ) ( not ( = ?auto_213783 ?auto_213785 ) ) ( not ( = ?auto_213783 ?auto_213779 ) ) ( not ( = ?auto_213781 ?auto_213782 ) ) ( not ( = ?auto_213781 ?auto_213784 ) ) ( not ( = ?auto_213781 ?auto_213785 ) ) ( not ( = ?auto_213781 ?auto_213779 ) ) ( ON ?auto_213780 ?auto_213781 ) ( CLEAR ?auto_213780 ) ( HOLDING ?auto_213782 ) ( CLEAR ?auto_213779 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213784 ?auto_213785 ?auto_213779 ?auto_213782 )
      ( MAKE-2PILE ?auto_213777 ?auto_213778 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213786 - BLOCK
      ?auto_213787 - BLOCK
    )
    :vars
    (
      ?auto_213791 - BLOCK
      ?auto_213789 - BLOCK
      ?auto_213788 - BLOCK
      ?auto_213794 - BLOCK
      ?auto_213792 - BLOCK
      ?auto_213790 - BLOCK
      ?auto_213793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213791 ?auto_213787 ) ( ON-TABLE ?auto_213786 ) ( ON ?auto_213787 ?auto_213786 ) ( not ( = ?auto_213786 ?auto_213787 ) ) ( not ( = ?auto_213786 ?auto_213791 ) ) ( not ( = ?auto_213787 ?auto_213791 ) ) ( not ( = ?auto_213786 ?auto_213789 ) ) ( not ( = ?auto_213786 ?auto_213788 ) ) ( not ( = ?auto_213787 ?auto_213789 ) ) ( not ( = ?auto_213787 ?auto_213788 ) ) ( not ( = ?auto_213791 ?auto_213789 ) ) ( not ( = ?auto_213791 ?auto_213788 ) ) ( not ( = ?auto_213789 ?auto_213788 ) ) ( ON ?auto_213789 ?auto_213791 ) ( ON-TABLE ?auto_213794 ) ( ON ?auto_213792 ?auto_213794 ) ( ON ?auto_213790 ?auto_213792 ) ( not ( = ?auto_213794 ?auto_213792 ) ) ( not ( = ?auto_213794 ?auto_213790 ) ) ( not ( = ?auto_213794 ?auto_213793 ) ) ( not ( = ?auto_213794 ?auto_213788 ) ) ( not ( = ?auto_213792 ?auto_213790 ) ) ( not ( = ?auto_213792 ?auto_213793 ) ) ( not ( = ?auto_213792 ?auto_213788 ) ) ( not ( = ?auto_213790 ?auto_213793 ) ) ( not ( = ?auto_213790 ?auto_213788 ) ) ( not ( = ?auto_213793 ?auto_213788 ) ) ( not ( = ?auto_213786 ?auto_213793 ) ) ( not ( = ?auto_213786 ?auto_213794 ) ) ( not ( = ?auto_213786 ?auto_213792 ) ) ( not ( = ?auto_213786 ?auto_213790 ) ) ( not ( = ?auto_213787 ?auto_213793 ) ) ( not ( = ?auto_213787 ?auto_213794 ) ) ( not ( = ?auto_213787 ?auto_213792 ) ) ( not ( = ?auto_213787 ?auto_213790 ) ) ( not ( = ?auto_213791 ?auto_213793 ) ) ( not ( = ?auto_213791 ?auto_213794 ) ) ( not ( = ?auto_213791 ?auto_213792 ) ) ( not ( = ?auto_213791 ?auto_213790 ) ) ( not ( = ?auto_213789 ?auto_213793 ) ) ( not ( = ?auto_213789 ?auto_213794 ) ) ( not ( = ?auto_213789 ?auto_213792 ) ) ( not ( = ?auto_213789 ?auto_213790 ) ) ( ON ?auto_213788 ?auto_213789 ) ( CLEAR ?auto_213790 ) ( ON ?auto_213793 ?auto_213788 ) ( CLEAR ?auto_213793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213786 ?auto_213787 ?auto_213791 ?auto_213789 ?auto_213788 )
      ( MAKE-2PILE ?auto_213786 ?auto_213787 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213795 - BLOCK
      ?auto_213796 - BLOCK
    )
    :vars
    (
      ?auto_213797 - BLOCK
      ?auto_213803 - BLOCK
      ?auto_213802 - BLOCK
      ?auto_213801 - BLOCK
      ?auto_213798 - BLOCK
      ?auto_213800 - BLOCK
      ?auto_213799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213797 ?auto_213796 ) ( ON-TABLE ?auto_213795 ) ( ON ?auto_213796 ?auto_213795 ) ( not ( = ?auto_213795 ?auto_213796 ) ) ( not ( = ?auto_213795 ?auto_213797 ) ) ( not ( = ?auto_213796 ?auto_213797 ) ) ( not ( = ?auto_213795 ?auto_213803 ) ) ( not ( = ?auto_213795 ?auto_213802 ) ) ( not ( = ?auto_213796 ?auto_213803 ) ) ( not ( = ?auto_213796 ?auto_213802 ) ) ( not ( = ?auto_213797 ?auto_213803 ) ) ( not ( = ?auto_213797 ?auto_213802 ) ) ( not ( = ?auto_213803 ?auto_213802 ) ) ( ON ?auto_213803 ?auto_213797 ) ( ON-TABLE ?auto_213801 ) ( ON ?auto_213798 ?auto_213801 ) ( not ( = ?auto_213801 ?auto_213798 ) ) ( not ( = ?auto_213801 ?auto_213800 ) ) ( not ( = ?auto_213801 ?auto_213799 ) ) ( not ( = ?auto_213801 ?auto_213802 ) ) ( not ( = ?auto_213798 ?auto_213800 ) ) ( not ( = ?auto_213798 ?auto_213799 ) ) ( not ( = ?auto_213798 ?auto_213802 ) ) ( not ( = ?auto_213800 ?auto_213799 ) ) ( not ( = ?auto_213800 ?auto_213802 ) ) ( not ( = ?auto_213799 ?auto_213802 ) ) ( not ( = ?auto_213795 ?auto_213799 ) ) ( not ( = ?auto_213795 ?auto_213801 ) ) ( not ( = ?auto_213795 ?auto_213798 ) ) ( not ( = ?auto_213795 ?auto_213800 ) ) ( not ( = ?auto_213796 ?auto_213799 ) ) ( not ( = ?auto_213796 ?auto_213801 ) ) ( not ( = ?auto_213796 ?auto_213798 ) ) ( not ( = ?auto_213796 ?auto_213800 ) ) ( not ( = ?auto_213797 ?auto_213799 ) ) ( not ( = ?auto_213797 ?auto_213801 ) ) ( not ( = ?auto_213797 ?auto_213798 ) ) ( not ( = ?auto_213797 ?auto_213800 ) ) ( not ( = ?auto_213803 ?auto_213799 ) ) ( not ( = ?auto_213803 ?auto_213801 ) ) ( not ( = ?auto_213803 ?auto_213798 ) ) ( not ( = ?auto_213803 ?auto_213800 ) ) ( ON ?auto_213802 ?auto_213803 ) ( ON ?auto_213799 ?auto_213802 ) ( CLEAR ?auto_213799 ) ( HOLDING ?auto_213800 ) ( CLEAR ?auto_213798 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213801 ?auto_213798 ?auto_213800 )
      ( MAKE-2PILE ?auto_213795 ?auto_213796 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213804 - BLOCK
      ?auto_213805 - BLOCK
    )
    :vars
    (
      ?auto_213810 - BLOCK
      ?auto_213811 - BLOCK
      ?auto_213807 - BLOCK
      ?auto_213806 - BLOCK
      ?auto_213808 - BLOCK
      ?auto_213809 - BLOCK
      ?auto_213812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213810 ?auto_213805 ) ( ON-TABLE ?auto_213804 ) ( ON ?auto_213805 ?auto_213804 ) ( not ( = ?auto_213804 ?auto_213805 ) ) ( not ( = ?auto_213804 ?auto_213810 ) ) ( not ( = ?auto_213805 ?auto_213810 ) ) ( not ( = ?auto_213804 ?auto_213811 ) ) ( not ( = ?auto_213804 ?auto_213807 ) ) ( not ( = ?auto_213805 ?auto_213811 ) ) ( not ( = ?auto_213805 ?auto_213807 ) ) ( not ( = ?auto_213810 ?auto_213811 ) ) ( not ( = ?auto_213810 ?auto_213807 ) ) ( not ( = ?auto_213811 ?auto_213807 ) ) ( ON ?auto_213811 ?auto_213810 ) ( ON-TABLE ?auto_213806 ) ( ON ?auto_213808 ?auto_213806 ) ( not ( = ?auto_213806 ?auto_213808 ) ) ( not ( = ?auto_213806 ?auto_213809 ) ) ( not ( = ?auto_213806 ?auto_213812 ) ) ( not ( = ?auto_213806 ?auto_213807 ) ) ( not ( = ?auto_213808 ?auto_213809 ) ) ( not ( = ?auto_213808 ?auto_213812 ) ) ( not ( = ?auto_213808 ?auto_213807 ) ) ( not ( = ?auto_213809 ?auto_213812 ) ) ( not ( = ?auto_213809 ?auto_213807 ) ) ( not ( = ?auto_213812 ?auto_213807 ) ) ( not ( = ?auto_213804 ?auto_213812 ) ) ( not ( = ?auto_213804 ?auto_213806 ) ) ( not ( = ?auto_213804 ?auto_213808 ) ) ( not ( = ?auto_213804 ?auto_213809 ) ) ( not ( = ?auto_213805 ?auto_213812 ) ) ( not ( = ?auto_213805 ?auto_213806 ) ) ( not ( = ?auto_213805 ?auto_213808 ) ) ( not ( = ?auto_213805 ?auto_213809 ) ) ( not ( = ?auto_213810 ?auto_213812 ) ) ( not ( = ?auto_213810 ?auto_213806 ) ) ( not ( = ?auto_213810 ?auto_213808 ) ) ( not ( = ?auto_213810 ?auto_213809 ) ) ( not ( = ?auto_213811 ?auto_213812 ) ) ( not ( = ?auto_213811 ?auto_213806 ) ) ( not ( = ?auto_213811 ?auto_213808 ) ) ( not ( = ?auto_213811 ?auto_213809 ) ) ( ON ?auto_213807 ?auto_213811 ) ( ON ?auto_213812 ?auto_213807 ) ( CLEAR ?auto_213808 ) ( ON ?auto_213809 ?auto_213812 ) ( CLEAR ?auto_213809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213804 ?auto_213805 ?auto_213810 ?auto_213811 ?auto_213807 ?auto_213812 )
      ( MAKE-2PILE ?auto_213804 ?auto_213805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213813 - BLOCK
      ?auto_213814 - BLOCK
    )
    :vars
    (
      ?auto_213821 - BLOCK
      ?auto_213815 - BLOCK
      ?auto_213816 - BLOCK
      ?auto_213818 - BLOCK
      ?auto_213819 - BLOCK
      ?auto_213817 - BLOCK
      ?auto_213820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213821 ?auto_213814 ) ( ON-TABLE ?auto_213813 ) ( ON ?auto_213814 ?auto_213813 ) ( not ( = ?auto_213813 ?auto_213814 ) ) ( not ( = ?auto_213813 ?auto_213821 ) ) ( not ( = ?auto_213814 ?auto_213821 ) ) ( not ( = ?auto_213813 ?auto_213815 ) ) ( not ( = ?auto_213813 ?auto_213816 ) ) ( not ( = ?auto_213814 ?auto_213815 ) ) ( not ( = ?auto_213814 ?auto_213816 ) ) ( not ( = ?auto_213821 ?auto_213815 ) ) ( not ( = ?auto_213821 ?auto_213816 ) ) ( not ( = ?auto_213815 ?auto_213816 ) ) ( ON ?auto_213815 ?auto_213821 ) ( ON-TABLE ?auto_213818 ) ( not ( = ?auto_213818 ?auto_213819 ) ) ( not ( = ?auto_213818 ?auto_213817 ) ) ( not ( = ?auto_213818 ?auto_213820 ) ) ( not ( = ?auto_213818 ?auto_213816 ) ) ( not ( = ?auto_213819 ?auto_213817 ) ) ( not ( = ?auto_213819 ?auto_213820 ) ) ( not ( = ?auto_213819 ?auto_213816 ) ) ( not ( = ?auto_213817 ?auto_213820 ) ) ( not ( = ?auto_213817 ?auto_213816 ) ) ( not ( = ?auto_213820 ?auto_213816 ) ) ( not ( = ?auto_213813 ?auto_213820 ) ) ( not ( = ?auto_213813 ?auto_213818 ) ) ( not ( = ?auto_213813 ?auto_213819 ) ) ( not ( = ?auto_213813 ?auto_213817 ) ) ( not ( = ?auto_213814 ?auto_213820 ) ) ( not ( = ?auto_213814 ?auto_213818 ) ) ( not ( = ?auto_213814 ?auto_213819 ) ) ( not ( = ?auto_213814 ?auto_213817 ) ) ( not ( = ?auto_213821 ?auto_213820 ) ) ( not ( = ?auto_213821 ?auto_213818 ) ) ( not ( = ?auto_213821 ?auto_213819 ) ) ( not ( = ?auto_213821 ?auto_213817 ) ) ( not ( = ?auto_213815 ?auto_213820 ) ) ( not ( = ?auto_213815 ?auto_213818 ) ) ( not ( = ?auto_213815 ?auto_213819 ) ) ( not ( = ?auto_213815 ?auto_213817 ) ) ( ON ?auto_213816 ?auto_213815 ) ( ON ?auto_213820 ?auto_213816 ) ( ON ?auto_213817 ?auto_213820 ) ( CLEAR ?auto_213817 ) ( HOLDING ?auto_213819 ) ( CLEAR ?auto_213818 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213818 ?auto_213819 )
      ( MAKE-2PILE ?auto_213813 ?auto_213814 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213822 - BLOCK
      ?auto_213823 - BLOCK
    )
    :vars
    (
      ?auto_213824 - BLOCK
      ?auto_213828 - BLOCK
      ?auto_213830 - BLOCK
      ?auto_213829 - BLOCK
      ?auto_213826 - BLOCK
      ?auto_213825 - BLOCK
      ?auto_213827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213824 ?auto_213823 ) ( ON-TABLE ?auto_213822 ) ( ON ?auto_213823 ?auto_213822 ) ( not ( = ?auto_213822 ?auto_213823 ) ) ( not ( = ?auto_213822 ?auto_213824 ) ) ( not ( = ?auto_213823 ?auto_213824 ) ) ( not ( = ?auto_213822 ?auto_213828 ) ) ( not ( = ?auto_213822 ?auto_213830 ) ) ( not ( = ?auto_213823 ?auto_213828 ) ) ( not ( = ?auto_213823 ?auto_213830 ) ) ( not ( = ?auto_213824 ?auto_213828 ) ) ( not ( = ?auto_213824 ?auto_213830 ) ) ( not ( = ?auto_213828 ?auto_213830 ) ) ( ON ?auto_213828 ?auto_213824 ) ( ON-TABLE ?auto_213829 ) ( not ( = ?auto_213829 ?auto_213826 ) ) ( not ( = ?auto_213829 ?auto_213825 ) ) ( not ( = ?auto_213829 ?auto_213827 ) ) ( not ( = ?auto_213829 ?auto_213830 ) ) ( not ( = ?auto_213826 ?auto_213825 ) ) ( not ( = ?auto_213826 ?auto_213827 ) ) ( not ( = ?auto_213826 ?auto_213830 ) ) ( not ( = ?auto_213825 ?auto_213827 ) ) ( not ( = ?auto_213825 ?auto_213830 ) ) ( not ( = ?auto_213827 ?auto_213830 ) ) ( not ( = ?auto_213822 ?auto_213827 ) ) ( not ( = ?auto_213822 ?auto_213829 ) ) ( not ( = ?auto_213822 ?auto_213826 ) ) ( not ( = ?auto_213822 ?auto_213825 ) ) ( not ( = ?auto_213823 ?auto_213827 ) ) ( not ( = ?auto_213823 ?auto_213829 ) ) ( not ( = ?auto_213823 ?auto_213826 ) ) ( not ( = ?auto_213823 ?auto_213825 ) ) ( not ( = ?auto_213824 ?auto_213827 ) ) ( not ( = ?auto_213824 ?auto_213829 ) ) ( not ( = ?auto_213824 ?auto_213826 ) ) ( not ( = ?auto_213824 ?auto_213825 ) ) ( not ( = ?auto_213828 ?auto_213827 ) ) ( not ( = ?auto_213828 ?auto_213829 ) ) ( not ( = ?auto_213828 ?auto_213826 ) ) ( not ( = ?auto_213828 ?auto_213825 ) ) ( ON ?auto_213830 ?auto_213828 ) ( ON ?auto_213827 ?auto_213830 ) ( ON ?auto_213825 ?auto_213827 ) ( CLEAR ?auto_213829 ) ( ON ?auto_213826 ?auto_213825 ) ( CLEAR ?auto_213826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213822 ?auto_213823 ?auto_213824 ?auto_213828 ?auto_213830 ?auto_213827 ?auto_213825 )
      ( MAKE-2PILE ?auto_213822 ?auto_213823 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213831 - BLOCK
      ?auto_213832 - BLOCK
    )
    :vars
    (
      ?auto_213837 - BLOCK
      ?auto_213834 - BLOCK
      ?auto_213838 - BLOCK
      ?auto_213835 - BLOCK
      ?auto_213836 - BLOCK
      ?auto_213839 - BLOCK
      ?auto_213833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213837 ?auto_213832 ) ( ON-TABLE ?auto_213831 ) ( ON ?auto_213832 ?auto_213831 ) ( not ( = ?auto_213831 ?auto_213832 ) ) ( not ( = ?auto_213831 ?auto_213837 ) ) ( not ( = ?auto_213832 ?auto_213837 ) ) ( not ( = ?auto_213831 ?auto_213834 ) ) ( not ( = ?auto_213831 ?auto_213838 ) ) ( not ( = ?auto_213832 ?auto_213834 ) ) ( not ( = ?auto_213832 ?auto_213838 ) ) ( not ( = ?auto_213837 ?auto_213834 ) ) ( not ( = ?auto_213837 ?auto_213838 ) ) ( not ( = ?auto_213834 ?auto_213838 ) ) ( ON ?auto_213834 ?auto_213837 ) ( not ( = ?auto_213835 ?auto_213836 ) ) ( not ( = ?auto_213835 ?auto_213839 ) ) ( not ( = ?auto_213835 ?auto_213833 ) ) ( not ( = ?auto_213835 ?auto_213838 ) ) ( not ( = ?auto_213836 ?auto_213839 ) ) ( not ( = ?auto_213836 ?auto_213833 ) ) ( not ( = ?auto_213836 ?auto_213838 ) ) ( not ( = ?auto_213839 ?auto_213833 ) ) ( not ( = ?auto_213839 ?auto_213838 ) ) ( not ( = ?auto_213833 ?auto_213838 ) ) ( not ( = ?auto_213831 ?auto_213833 ) ) ( not ( = ?auto_213831 ?auto_213835 ) ) ( not ( = ?auto_213831 ?auto_213836 ) ) ( not ( = ?auto_213831 ?auto_213839 ) ) ( not ( = ?auto_213832 ?auto_213833 ) ) ( not ( = ?auto_213832 ?auto_213835 ) ) ( not ( = ?auto_213832 ?auto_213836 ) ) ( not ( = ?auto_213832 ?auto_213839 ) ) ( not ( = ?auto_213837 ?auto_213833 ) ) ( not ( = ?auto_213837 ?auto_213835 ) ) ( not ( = ?auto_213837 ?auto_213836 ) ) ( not ( = ?auto_213837 ?auto_213839 ) ) ( not ( = ?auto_213834 ?auto_213833 ) ) ( not ( = ?auto_213834 ?auto_213835 ) ) ( not ( = ?auto_213834 ?auto_213836 ) ) ( not ( = ?auto_213834 ?auto_213839 ) ) ( ON ?auto_213838 ?auto_213834 ) ( ON ?auto_213833 ?auto_213838 ) ( ON ?auto_213839 ?auto_213833 ) ( ON ?auto_213836 ?auto_213839 ) ( CLEAR ?auto_213836 ) ( HOLDING ?auto_213835 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213835 )
      ( MAKE-2PILE ?auto_213831 ?auto_213832 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_213840 - BLOCK
      ?auto_213841 - BLOCK
    )
    :vars
    (
      ?auto_213845 - BLOCK
      ?auto_213847 - BLOCK
      ?auto_213843 - BLOCK
      ?auto_213842 - BLOCK
      ?auto_213846 - BLOCK
      ?auto_213848 - BLOCK
      ?auto_213844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213845 ?auto_213841 ) ( ON-TABLE ?auto_213840 ) ( ON ?auto_213841 ?auto_213840 ) ( not ( = ?auto_213840 ?auto_213841 ) ) ( not ( = ?auto_213840 ?auto_213845 ) ) ( not ( = ?auto_213841 ?auto_213845 ) ) ( not ( = ?auto_213840 ?auto_213847 ) ) ( not ( = ?auto_213840 ?auto_213843 ) ) ( not ( = ?auto_213841 ?auto_213847 ) ) ( not ( = ?auto_213841 ?auto_213843 ) ) ( not ( = ?auto_213845 ?auto_213847 ) ) ( not ( = ?auto_213845 ?auto_213843 ) ) ( not ( = ?auto_213847 ?auto_213843 ) ) ( ON ?auto_213847 ?auto_213845 ) ( not ( = ?auto_213842 ?auto_213846 ) ) ( not ( = ?auto_213842 ?auto_213848 ) ) ( not ( = ?auto_213842 ?auto_213844 ) ) ( not ( = ?auto_213842 ?auto_213843 ) ) ( not ( = ?auto_213846 ?auto_213848 ) ) ( not ( = ?auto_213846 ?auto_213844 ) ) ( not ( = ?auto_213846 ?auto_213843 ) ) ( not ( = ?auto_213848 ?auto_213844 ) ) ( not ( = ?auto_213848 ?auto_213843 ) ) ( not ( = ?auto_213844 ?auto_213843 ) ) ( not ( = ?auto_213840 ?auto_213844 ) ) ( not ( = ?auto_213840 ?auto_213842 ) ) ( not ( = ?auto_213840 ?auto_213846 ) ) ( not ( = ?auto_213840 ?auto_213848 ) ) ( not ( = ?auto_213841 ?auto_213844 ) ) ( not ( = ?auto_213841 ?auto_213842 ) ) ( not ( = ?auto_213841 ?auto_213846 ) ) ( not ( = ?auto_213841 ?auto_213848 ) ) ( not ( = ?auto_213845 ?auto_213844 ) ) ( not ( = ?auto_213845 ?auto_213842 ) ) ( not ( = ?auto_213845 ?auto_213846 ) ) ( not ( = ?auto_213845 ?auto_213848 ) ) ( not ( = ?auto_213847 ?auto_213844 ) ) ( not ( = ?auto_213847 ?auto_213842 ) ) ( not ( = ?auto_213847 ?auto_213846 ) ) ( not ( = ?auto_213847 ?auto_213848 ) ) ( ON ?auto_213843 ?auto_213847 ) ( ON ?auto_213844 ?auto_213843 ) ( ON ?auto_213848 ?auto_213844 ) ( ON ?auto_213846 ?auto_213848 ) ( ON ?auto_213842 ?auto_213846 ) ( CLEAR ?auto_213842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213840 ?auto_213841 ?auto_213845 ?auto_213847 ?auto_213843 ?auto_213844 ?auto_213848 ?auto_213846 )
      ( MAKE-2PILE ?auto_213840 ?auto_213841 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213856 - BLOCK
      ?auto_213857 - BLOCK
      ?auto_213858 - BLOCK
      ?auto_213859 - BLOCK
      ?auto_213860 - BLOCK
      ?auto_213861 - BLOCK
      ?auto_213862 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_213862 ) ( CLEAR ?auto_213861 ) ( ON-TABLE ?auto_213856 ) ( ON ?auto_213857 ?auto_213856 ) ( ON ?auto_213858 ?auto_213857 ) ( ON ?auto_213859 ?auto_213858 ) ( ON ?auto_213860 ?auto_213859 ) ( ON ?auto_213861 ?auto_213860 ) ( not ( = ?auto_213856 ?auto_213857 ) ) ( not ( = ?auto_213856 ?auto_213858 ) ) ( not ( = ?auto_213856 ?auto_213859 ) ) ( not ( = ?auto_213856 ?auto_213860 ) ) ( not ( = ?auto_213856 ?auto_213861 ) ) ( not ( = ?auto_213856 ?auto_213862 ) ) ( not ( = ?auto_213857 ?auto_213858 ) ) ( not ( = ?auto_213857 ?auto_213859 ) ) ( not ( = ?auto_213857 ?auto_213860 ) ) ( not ( = ?auto_213857 ?auto_213861 ) ) ( not ( = ?auto_213857 ?auto_213862 ) ) ( not ( = ?auto_213858 ?auto_213859 ) ) ( not ( = ?auto_213858 ?auto_213860 ) ) ( not ( = ?auto_213858 ?auto_213861 ) ) ( not ( = ?auto_213858 ?auto_213862 ) ) ( not ( = ?auto_213859 ?auto_213860 ) ) ( not ( = ?auto_213859 ?auto_213861 ) ) ( not ( = ?auto_213859 ?auto_213862 ) ) ( not ( = ?auto_213860 ?auto_213861 ) ) ( not ( = ?auto_213860 ?auto_213862 ) ) ( not ( = ?auto_213861 ?auto_213862 ) ) )
    :subtasks
    ( ( !STACK ?auto_213862 ?auto_213861 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213863 - BLOCK
      ?auto_213864 - BLOCK
      ?auto_213865 - BLOCK
      ?auto_213866 - BLOCK
      ?auto_213867 - BLOCK
      ?auto_213868 - BLOCK
      ?auto_213869 - BLOCK
    )
    :vars
    (
      ?auto_213870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_213868 ) ( ON-TABLE ?auto_213863 ) ( ON ?auto_213864 ?auto_213863 ) ( ON ?auto_213865 ?auto_213864 ) ( ON ?auto_213866 ?auto_213865 ) ( ON ?auto_213867 ?auto_213866 ) ( ON ?auto_213868 ?auto_213867 ) ( not ( = ?auto_213863 ?auto_213864 ) ) ( not ( = ?auto_213863 ?auto_213865 ) ) ( not ( = ?auto_213863 ?auto_213866 ) ) ( not ( = ?auto_213863 ?auto_213867 ) ) ( not ( = ?auto_213863 ?auto_213868 ) ) ( not ( = ?auto_213863 ?auto_213869 ) ) ( not ( = ?auto_213864 ?auto_213865 ) ) ( not ( = ?auto_213864 ?auto_213866 ) ) ( not ( = ?auto_213864 ?auto_213867 ) ) ( not ( = ?auto_213864 ?auto_213868 ) ) ( not ( = ?auto_213864 ?auto_213869 ) ) ( not ( = ?auto_213865 ?auto_213866 ) ) ( not ( = ?auto_213865 ?auto_213867 ) ) ( not ( = ?auto_213865 ?auto_213868 ) ) ( not ( = ?auto_213865 ?auto_213869 ) ) ( not ( = ?auto_213866 ?auto_213867 ) ) ( not ( = ?auto_213866 ?auto_213868 ) ) ( not ( = ?auto_213866 ?auto_213869 ) ) ( not ( = ?auto_213867 ?auto_213868 ) ) ( not ( = ?auto_213867 ?auto_213869 ) ) ( not ( = ?auto_213868 ?auto_213869 ) ) ( ON ?auto_213869 ?auto_213870 ) ( CLEAR ?auto_213869 ) ( HAND-EMPTY ) ( not ( = ?auto_213863 ?auto_213870 ) ) ( not ( = ?auto_213864 ?auto_213870 ) ) ( not ( = ?auto_213865 ?auto_213870 ) ) ( not ( = ?auto_213866 ?auto_213870 ) ) ( not ( = ?auto_213867 ?auto_213870 ) ) ( not ( = ?auto_213868 ?auto_213870 ) ) ( not ( = ?auto_213869 ?auto_213870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213869 ?auto_213870 )
      ( MAKE-7PILE ?auto_213863 ?auto_213864 ?auto_213865 ?auto_213866 ?auto_213867 ?auto_213868 ?auto_213869 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213871 - BLOCK
      ?auto_213872 - BLOCK
      ?auto_213873 - BLOCK
      ?auto_213874 - BLOCK
      ?auto_213875 - BLOCK
      ?auto_213876 - BLOCK
      ?auto_213877 - BLOCK
    )
    :vars
    (
      ?auto_213878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213871 ) ( ON ?auto_213872 ?auto_213871 ) ( ON ?auto_213873 ?auto_213872 ) ( ON ?auto_213874 ?auto_213873 ) ( ON ?auto_213875 ?auto_213874 ) ( not ( = ?auto_213871 ?auto_213872 ) ) ( not ( = ?auto_213871 ?auto_213873 ) ) ( not ( = ?auto_213871 ?auto_213874 ) ) ( not ( = ?auto_213871 ?auto_213875 ) ) ( not ( = ?auto_213871 ?auto_213876 ) ) ( not ( = ?auto_213871 ?auto_213877 ) ) ( not ( = ?auto_213872 ?auto_213873 ) ) ( not ( = ?auto_213872 ?auto_213874 ) ) ( not ( = ?auto_213872 ?auto_213875 ) ) ( not ( = ?auto_213872 ?auto_213876 ) ) ( not ( = ?auto_213872 ?auto_213877 ) ) ( not ( = ?auto_213873 ?auto_213874 ) ) ( not ( = ?auto_213873 ?auto_213875 ) ) ( not ( = ?auto_213873 ?auto_213876 ) ) ( not ( = ?auto_213873 ?auto_213877 ) ) ( not ( = ?auto_213874 ?auto_213875 ) ) ( not ( = ?auto_213874 ?auto_213876 ) ) ( not ( = ?auto_213874 ?auto_213877 ) ) ( not ( = ?auto_213875 ?auto_213876 ) ) ( not ( = ?auto_213875 ?auto_213877 ) ) ( not ( = ?auto_213876 ?auto_213877 ) ) ( ON ?auto_213877 ?auto_213878 ) ( CLEAR ?auto_213877 ) ( not ( = ?auto_213871 ?auto_213878 ) ) ( not ( = ?auto_213872 ?auto_213878 ) ) ( not ( = ?auto_213873 ?auto_213878 ) ) ( not ( = ?auto_213874 ?auto_213878 ) ) ( not ( = ?auto_213875 ?auto_213878 ) ) ( not ( = ?auto_213876 ?auto_213878 ) ) ( not ( = ?auto_213877 ?auto_213878 ) ) ( HOLDING ?auto_213876 ) ( CLEAR ?auto_213875 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213871 ?auto_213872 ?auto_213873 ?auto_213874 ?auto_213875 ?auto_213876 )
      ( MAKE-7PILE ?auto_213871 ?auto_213872 ?auto_213873 ?auto_213874 ?auto_213875 ?auto_213876 ?auto_213877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213879 - BLOCK
      ?auto_213880 - BLOCK
      ?auto_213881 - BLOCK
      ?auto_213882 - BLOCK
      ?auto_213883 - BLOCK
      ?auto_213884 - BLOCK
      ?auto_213885 - BLOCK
    )
    :vars
    (
      ?auto_213886 - BLOCK
      ?auto_213887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213879 ) ( ON ?auto_213880 ?auto_213879 ) ( ON ?auto_213881 ?auto_213880 ) ( ON ?auto_213882 ?auto_213881 ) ( ON ?auto_213883 ?auto_213882 ) ( not ( = ?auto_213879 ?auto_213880 ) ) ( not ( = ?auto_213879 ?auto_213881 ) ) ( not ( = ?auto_213879 ?auto_213882 ) ) ( not ( = ?auto_213879 ?auto_213883 ) ) ( not ( = ?auto_213879 ?auto_213884 ) ) ( not ( = ?auto_213879 ?auto_213885 ) ) ( not ( = ?auto_213880 ?auto_213881 ) ) ( not ( = ?auto_213880 ?auto_213882 ) ) ( not ( = ?auto_213880 ?auto_213883 ) ) ( not ( = ?auto_213880 ?auto_213884 ) ) ( not ( = ?auto_213880 ?auto_213885 ) ) ( not ( = ?auto_213881 ?auto_213882 ) ) ( not ( = ?auto_213881 ?auto_213883 ) ) ( not ( = ?auto_213881 ?auto_213884 ) ) ( not ( = ?auto_213881 ?auto_213885 ) ) ( not ( = ?auto_213882 ?auto_213883 ) ) ( not ( = ?auto_213882 ?auto_213884 ) ) ( not ( = ?auto_213882 ?auto_213885 ) ) ( not ( = ?auto_213883 ?auto_213884 ) ) ( not ( = ?auto_213883 ?auto_213885 ) ) ( not ( = ?auto_213884 ?auto_213885 ) ) ( ON ?auto_213885 ?auto_213886 ) ( not ( = ?auto_213879 ?auto_213886 ) ) ( not ( = ?auto_213880 ?auto_213886 ) ) ( not ( = ?auto_213881 ?auto_213886 ) ) ( not ( = ?auto_213882 ?auto_213886 ) ) ( not ( = ?auto_213883 ?auto_213886 ) ) ( not ( = ?auto_213884 ?auto_213886 ) ) ( not ( = ?auto_213885 ?auto_213886 ) ) ( CLEAR ?auto_213883 ) ( ON ?auto_213884 ?auto_213885 ) ( CLEAR ?auto_213884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213887 ) ( ON ?auto_213886 ?auto_213887 ) ( not ( = ?auto_213887 ?auto_213886 ) ) ( not ( = ?auto_213887 ?auto_213885 ) ) ( not ( = ?auto_213887 ?auto_213884 ) ) ( not ( = ?auto_213879 ?auto_213887 ) ) ( not ( = ?auto_213880 ?auto_213887 ) ) ( not ( = ?auto_213881 ?auto_213887 ) ) ( not ( = ?auto_213882 ?auto_213887 ) ) ( not ( = ?auto_213883 ?auto_213887 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213887 ?auto_213886 ?auto_213885 )
      ( MAKE-7PILE ?auto_213879 ?auto_213880 ?auto_213881 ?auto_213882 ?auto_213883 ?auto_213884 ?auto_213885 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213888 - BLOCK
      ?auto_213889 - BLOCK
      ?auto_213890 - BLOCK
      ?auto_213891 - BLOCK
      ?auto_213892 - BLOCK
      ?auto_213893 - BLOCK
      ?auto_213894 - BLOCK
    )
    :vars
    (
      ?auto_213895 - BLOCK
      ?auto_213896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213888 ) ( ON ?auto_213889 ?auto_213888 ) ( ON ?auto_213890 ?auto_213889 ) ( ON ?auto_213891 ?auto_213890 ) ( not ( = ?auto_213888 ?auto_213889 ) ) ( not ( = ?auto_213888 ?auto_213890 ) ) ( not ( = ?auto_213888 ?auto_213891 ) ) ( not ( = ?auto_213888 ?auto_213892 ) ) ( not ( = ?auto_213888 ?auto_213893 ) ) ( not ( = ?auto_213888 ?auto_213894 ) ) ( not ( = ?auto_213889 ?auto_213890 ) ) ( not ( = ?auto_213889 ?auto_213891 ) ) ( not ( = ?auto_213889 ?auto_213892 ) ) ( not ( = ?auto_213889 ?auto_213893 ) ) ( not ( = ?auto_213889 ?auto_213894 ) ) ( not ( = ?auto_213890 ?auto_213891 ) ) ( not ( = ?auto_213890 ?auto_213892 ) ) ( not ( = ?auto_213890 ?auto_213893 ) ) ( not ( = ?auto_213890 ?auto_213894 ) ) ( not ( = ?auto_213891 ?auto_213892 ) ) ( not ( = ?auto_213891 ?auto_213893 ) ) ( not ( = ?auto_213891 ?auto_213894 ) ) ( not ( = ?auto_213892 ?auto_213893 ) ) ( not ( = ?auto_213892 ?auto_213894 ) ) ( not ( = ?auto_213893 ?auto_213894 ) ) ( ON ?auto_213894 ?auto_213895 ) ( not ( = ?auto_213888 ?auto_213895 ) ) ( not ( = ?auto_213889 ?auto_213895 ) ) ( not ( = ?auto_213890 ?auto_213895 ) ) ( not ( = ?auto_213891 ?auto_213895 ) ) ( not ( = ?auto_213892 ?auto_213895 ) ) ( not ( = ?auto_213893 ?auto_213895 ) ) ( not ( = ?auto_213894 ?auto_213895 ) ) ( ON ?auto_213893 ?auto_213894 ) ( CLEAR ?auto_213893 ) ( ON-TABLE ?auto_213896 ) ( ON ?auto_213895 ?auto_213896 ) ( not ( = ?auto_213896 ?auto_213895 ) ) ( not ( = ?auto_213896 ?auto_213894 ) ) ( not ( = ?auto_213896 ?auto_213893 ) ) ( not ( = ?auto_213888 ?auto_213896 ) ) ( not ( = ?auto_213889 ?auto_213896 ) ) ( not ( = ?auto_213890 ?auto_213896 ) ) ( not ( = ?auto_213891 ?auto_213896 ) ) ( not ( = ?auto_213892 ?auto_213896 ) ) ( HOLDING ?auto_213892 ) ( CLEAR ?auto_213891 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213888 ?auto_213889 ?auto_213890 ?auto_213891 ?auto_213892 )
      ( MAKE-7PILE ?auto_213888 ?auto_213889 ?auto_213890 ?auto_213891 ?auto_213892 ?auto_213893 ?auto_213894 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213897 - BLOCK
      ?auto_213898 - BLOCK
      ?auto_213899 - BLOCK
      ?auto_213900 - BLOCK
      ?auto_213901 - BLOCK
      ?auto_213902 - BLOCK
      ?auto_213903 - BLOCK
    )
    :vars
    (
      ?auto_213905 - BLOCK
      ?auto_213904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213897 ) ( ON ?auto_213898 ?auto_213897 ) ( ON ?auto_213899 ?auto_213898 ) ( ON ?auto_213900 ?auto_213899 ) ( not ( = ?auto_213897 ?auto_213898 ) ) ( not ( = ?auto_213897 ?auto_213899 ) ) ( not ( = ?auto_213897 ?auto_213900 ) ) ( not ( = ?auto_213897 ?auto_213901 ) ) ( not ( = ?auto_213897 ?auto_213902 ) ) ( not ( = ?auto_213897 ?auto_213903 ) ) ( not ( = ?auto_213898 ?auto_213899 ) ) ( not ( = ?auto_213898 ?auto_213900 ) ) ( not ( = ?auto_213898 ?auto_213901 ) ) ( not ( = ?auto_213898 ?auto_213902 ) ) ( not ( = ?auto_213898 ?auto_213903 ) ) ( not ( = ?auto_213899 ?auto_213900 ) ) ( not ( = ?auto_213899 ?auto_213901 ) ) ( not ( = ?auto_213899 ?auto_213902 ) ) ( not ( = ?auto_213899 ?auto_213903 ) ) ( not ( = ?auto_213900 ?auto_213901 ) ) ( not ( = ?auto_213900 ?auto_213902 ) ) ( not ( = ?auto_213900 ?auto_213903 ) ) ( not ( = ?auto_213901 ?auto_213902 ) ) ( not ( = ?auto_213901 ?auto_213903 ) ) ( not ( = ?auto_213902 ?auto_213903 ) ) ( ON ?auto_213903 ?auto_213905 ) ( not ( = ?auto_213897 ?auto_213905 ) ) ( not ( = ?auto_213898 ?auto_213905 ) ) ( not ( = ?auto_213899 ?auto_213905 ) ) ( not ( = ?auto_213900 ?auto_213905 ) ) ( not ( = ?auto_213901 ?auto_213905 ) ) ( not ( = ?auto_213902 ?auto_213905 ) ) ( not ( = ?auto_213903 ?auto_213905 ) ) ( ON ?auto_213902 ?auto_213903 ) ( ON-TABLE ?auto_213904 ) ( ON ?auto_213905 ?auto_213904 ) ( not ( = ?auto_213904 ?auto_213905 ) ) ( not ( = ?auto_213904 ?auto_213903 ) ) ( not ( = ?auto_213904 ?auto_213902 ) ) ( not ( = ?auto_213897 ?auto_213904 ) ) ( not ( = ?auto_213898 ?auto_213904 ) ) ( not ( = ?auto_213899 ?auto_213904 ) ) ( not ( = ?auto_213900 ?auto_213904 ) ) ( not ( = ?auto_213901 ?auto_213904 ) ) ( CLEAR ?auto_213900 ) ( ON ?auto_213901 ?auto_213902 ) ( CLEAR ?auto_213901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213904 ?auto_213905 ?auto_213903 ?auto_213902 )
      ( MAKE-7PILE ?auto_213897 ?auto_213898 ?auto_213899 ?auto_213900 ?auto_213901 ?auto_213902 ?auto_213903 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213906 - BLOCK
      ?auto_213907 - BLOCK
      ?auto_213908 - BLOCK
      ?auto_213909 - BLOCK
      ?auto_213910 - BLOCK
      ?auto_213911 - BLOCK
      ?auto_213912 - BLOCK
    )
    :vars
    (
      ?auto_213913 - BLOCK
      ?auto_213914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213906 ) ( ON ?auto_213907 ?auto_213906 ) ( ON ?auto_213908 ?auto_213907 ) ( not ( = ?auto_213906 ?auto_213907 ) ) ( not ( = ?auto_213906 ?auto_213908 ) ) ( not ( = ?auto_213906 ?auto_213909 ) ) ( not ( = ?auto_213906 ?auto_213910 ) ) ( not ( = ?auto_213906 ?auto_213911 ) ) ( not ( = ?auto_213906 ?auto_213912 ) ) ( not ( = ?auto_213907 ?auto_213908 ) ) ( not ( = ?auto_213907 ?auto_213909 ) ) ( not ( = ?auto_213907 ?auto_213910 ) ) ( not ( = ?auto_213907 ?auto_213911 ) ) ( not ( = ?auto_213907 ?auto_213912 ) ) ( not ( = ?auto_213908 ?auto_213909 ) ) ( not ( = ?auto_213908 ?auto_213910 ) ) ( not ( = ?auto_213908 ?auto_213911 ) ) ( not ( = ?auto_213908 ?auto_213912 ) ) ( not ( = ?auto_213909 ?auto_213910 ) ) ( not ( = ?auto_213909 ?auto_213911 ) ) ( not ( = ?auto_213909 ?auto_213912 ) ) ( not ( = ?auto_213910 ?auto_213911 ) ) ( not ( = ?auto_213910 ?auto_213912 ) ) ( not ( = ?auto_213911 ?auto_213912 ) ) ( ON ?auto_213912 ?auto_213913 ) ( not ( = ?auto_213906 ?auto_213913 ) ) ( not ( = ?auto_213907 ?auto_213913 ) ) ( not ( = ?auto_213908 ?auto_213913 ) ) ( not ( = ?auto_213909 ?auto_213913 ) ) ( not ( = ?auto_213910 ?auto_213913 ) ) ( not ( = ?auto_213911 ?auto_213913 ) ) ( not ( = ?auto_213912 ?auto_213913 ) ) ( ON ?auto_213911 ?auto_213912 ) ( ON-TABLE ?auto_213914 ) ( ON ?auto_213913 ?auto_213914 ) ( not ( = ?auto_213914 ?auto_213913 ) ) ( not ( = ?auto_213914 ?auto_213912 ) ) ( not ( = ?auto_213914 ?auto_213911 ) ) ( not ( = ?auto_213906 ?auto_213914 ) ) ( not ( = ?auto_213907 ?auto_213914 ) ) ( not ( = ?auto_213908 ?auto_213914 ) ) ( not ( = ?auto_213909 ?auto_213914 ) ) ( not ( = ?auto_213910 ?auto_213914 ) ) ( ON ?auto_213910 ?auto_213911 ) ( CLEAR ?auto_213910 ) ( HOLDING ?auto_213909 ) ( CLEAR ?auto_213908 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213906 ?auto_213907 ?auto_213908 ?auto_213909 )
      ( MAKE-7PILE ?auto_213906 ?auto_213907 ?auto_213908 ?auto_213909 ?auto_213910 ?auto_213911 ?auto_213912 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213915 - BLOCK
      ?auto_213916 - BLOCK
      ?auto_213917 - BLOCK
      ?auto_213918 - BLOCK
      ?auto_213919 - BLOCK
      ?auto_213920 - BLOCK
      ?auto_213921 - BLOCK
    )
    :vars
    (
      ?auto_213922 - BLOCK
      ?auto_213923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213915 ) ( ON ?auto_213916 ?auto_213915 ) ( ON ?auto_213917 ?auto_213916 ) ( not ( = ?auto_213915 ?auto_213916 ) ) ( not ( = ?auto_213915 ?auto_213917 ) ) ( not ( = ?auto_213915 ?auto_213918 ) ) ( not ( = ?auto_213915 ?auto_213919 ) ) ( not ( = ?auto_213915 ?auto_213920 ) ) ( not ( = ?auto_213915 ?auto_213921 ) ) ( not ( = ?auto_213916 ?auto_213917 ) ) ( not ( = ?auto_213916 ?auto_213918 ) ) ( not ( = ?auto_213916 ?auto_213919 ) ) ( not ( = ?auto_213916 ?auto_213920 ) ) ( not ( = ?auto_213916 ?auto_213921 ) ) ( not ( = ?auto_213917 ?auto_213918 ) ) ( not ( = ?auto_213917 ?auto_213919 ) ) ( not ( = ?auto_213917 ?auto_213920 ) ) ( not ( = ?auto_213917 ?auto_213921 ) ) ( not ( = ?auto_213918 ?auto_213919 ) ) ( not ( = ?auto_213918 ?auto_213920 ) ) ( not ( = ?auto_213918 ?auto_213921 ) ) ( not ( = ?auto_213919 ?auto_213920 ) ) ( not ( = ?auto_213919 ?auto_213921 ) ) ( not ( = ?auto_213920 ?auto_213921 ) ) ( ON ?auto_213921 ?auto_213922 ) ( not ( = ?auto_213915 ?auto_213922 ) ) ( not ( = ?auto_213916 ?auto_213922 ) ) ( not ( = ?auto_213917 ?auto_213922 ) ) ( not ( = ?auto_213918 ?auto_213922 ) ) ( not ( = ?auto_213919 ?auto_213922 ) ) ( not ( = ?auto_213920 ?auto_213922 ) ) ( not ( = ?auto_213921 ?auto_213922 ) ) ( ON ?auto_213920 ?auto_213921 ) ( ON-TABLE ?auto_213923 ) ( ON ?auto_213922 ?auto_213923 ) ( not ( = ?auto_213923 ?auto_213922 ) ) ( not ( = ?auto_213923 ?auto_213921 ) ) ( not ( = ?auto_213923 ?auto_213920 ) ) ( not ( = ?auto_213915 ?auto_213923 ) ) ( not ( = ?auto_213916 ?auto_213923 ) ) ( not ( = ?auto_213917 ?auto_213923 ) ) ( not ( = ?auto_213918 ?auto_213923 ) ) ( not ( = ?auto_213919 ?auto_213923 ) ) ( ON ?auto_213919 ?auto_213920 ) ( CLEAR ?auto_213917 ) ( ON ?auto_213918 ?auto_213919 ) ( CLEAR ?auto_213918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213923 ?auto_213922 ?auto_213921 ?auto_213920 ?auto_213919 )
      ( MAKE-7PILE ?auto_213915 ?auto_213916 ?auto_213917 ?auto_213918 ?auto_213919 ?auto_213920 ?auto_213921 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213924 - BLOCK
      ?auto_213925 - BLOCK
      ?auto_213926 - BLOCK
      ?auto_213927 - BLOCK
      ?auto_213928 - BLOCK
      ?auto_213929 - BLOCK
      ?auto_213930 - BLOCK
    )
    :vars
    (
      ?auto_213932 - BLOCK
      ?auto_213931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213924 ) ( ON ?auto_213925 ?auto_213924 ) ( not ( = ?auto_213924 ?auto_213925 ) ) ( not ( = ?auto_213924 ?auto_213926 ) ) ( not ( = ?auto_213924 ?auto_213927 ) ) ( not ( = ?auto_213924 ?auto_213928 ) ) ( not ( = ?auto_213924 ?auto_213929 ) ) ( not ( = ?auto_213924 ?auto_213930 ) ) ( not ( = ?auto_213925 ?auto_213926 ) ) ( not ( = ?auto_213925 ?auto_213927 ) ) ( not ( = ?auto_213925 ?auto_213928 ) ) ( not ( = ?auto_213925 ?auto_213929 ) ) ( not ( = ?auto_213925 ?auto_213930 ) ) ( not ( = ?auto_213926 ?auto_213927 ) ) ( not ( = ?auto_213926 ?auto_213928 ) ) ( not ( = ?auto_213926 ?auto_213929 ) ) ( not ( = ?auto_213926 ?auto_213930 ) ) ( not ( = ?auto_213927 ?auto_213928 ) ) ( not ( = ?auto_213927 ?auto_213929 ) ) ( not ( = ?auto_213927 ?auto_213930 ) ) ( not ( = ?auto_213928 ?auto_213929 ) ) ( not ( = ?auto_213928 ?auto_213930 ) ) ( not ( = ?auto_213929 ?auto_213930 ) ) ( ON ?auto_213930 ?auto_213932 ) ( not ( = ?auto_213924 ?auto_213932 ) ) ( not ( = ?auto_213925 ?auto_213932 ) ) ( not ( = ?auto_213926 ?auto_213932 ) ) ( not ( = ?auto_213927 ?auto_213932 ) ) ( not ( = ?auto_213928 ?auto_213932 ) ) ( not ( = ?auto_213929 ?auto_213932 ) ) ( not ( = ?auto_213930 ?auto_213932 ) ) ( ON ?auto_213929 ?auto_213930 ) ( ON-TABLE ?auto_213931 ) ( ON ?auto_213932 ?auto_213931 ) ( not ( = ?auto_213931 ?auto_213932 ) ) ( not ( = ?auto_213931 ?auto_213930 ) ) ( not ( = ?auto_213931 ?auto_213929 ) ) ( not ( = ?auto_213924 ?auto_213931 ) ) ( not ( = ?auto_213925 ?auto_213931 ) ) ( not ( = ?auto_213926 ?auto_213931 ) ) ( not ( = ?auto_213927 ?auto_213931 ) ) ( not ( = ?auto_213928 ?auto_213931 ) ) ( ON ?auto_213928 ?auto_213929 ) ( ON ?auto_213927 ?auto_213928 ) ( CLEAR ?auto_213927 ) ( HOLDING ?auto_213926 ) ( CLEAR ?auto_213925 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213924 ?auto_213925 ?auto_213926 )
      ( MAKE-7PILE ?auto_213924 ?auto_213925 ?auto_213926 ?auto_213927 ?auto_213928 ?auto_213929 ?auto_213930 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213933 - BLOCK
      ?auto_213934 - BLOCK
      ?auto_213935 - BLOCK
      ?auto_213936 - BLOCK
      ?auto_213937 - BLOCK
      ?auto_213938 - BLOCK
      ?auto_213939 - BLOCK
    )
    :vars
    (
      ?auto_213940 - BLOCK
      ?auto_213941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213933 ) ( ON ?auto_213934 ?auto_213933 ) ( not ( = ?auto_213933 ?auto_213934 ) ) ( not ( = ?auto_213933 ?auto_213935 ) ) ( not ( = ?auto_213933 ?auto_213936 ) ) ( not ( = ?auto_213933 ?auto_213937 ) ) ( not ( = ?auto_213933 ?auto_213938 ) ) ( not ( = ?auto_213933 ?auto_213939 ) ) ( not ( = ?auto_213934 ?auto_213935 ) ) ( not ( = ?auto_213934 ?auto_213936 ) ) ( not ( = ?auto_213934 ?auto_213937 ) ) ( not ( = ?auto_213934 ?auto_213938 ) ) ( not ( = ?auto_213934 ?auto_213939 ) ) ( not ( = ?auto_213935 ?auto_213936 ) ) ( not ( = ?auto_213935 ?auto_213937 ) ) ( not ( = ?auto_213935 ?auto_213938 ) ) ( not ( = ?auto_213935 ?auto_213939 ) ) ( not ( = ?auto_213936 ?auto_213937 ) ) ( not ( = ?auto_213936 ?auto_213938 ) ) ( not ( = ?auto_213936 ?auto_213939 ) ) ( not ( = ?auto_213937 ?auto_213938 ) ) ( not ( = ?auto_213937 ?auto_213939 ) ) ( not ( = ?auto_213938 ?auto_213939 ) ) ( ON ?auto_213939 ?auto_213940 ) ( not ( = ?auto_213933 ?auto_213940 ) ) ( not ( = ?auto_213934 ?auto_213940 ) ) ( not ( = ?auto_213935 ?auto_213940 ) ) ( not ( = ?auto_213936 ?auto_213940 ) ) ( not ( = ?auto_213937 ?auto_213940 ) ) ( not ( = ?auto_213938 ?auto_213940 ) ) ( not ( = ?auto_213939 ?auto_213940 ) ) ( ON ?auto_213938 ?auto_213939 ) ( ON-TABLE ?auto_213941 ) ( ON ?auto_213940 ?auto_213941 ) ( not ( = ?auto_213941 ?auto_213940 ) ) ( not ( = ?auto_213941 ?auto_213939 ) ) ( not ( = ?auto_213941 ?auto_213938 ) ) ( not ( = ?auto_213933 ?auto_213941 ) ) ( not ( = ?auto_213934 ?auto_213941 ) ) ( not ( = ?auto_213935 ?auto_213941 ) ) ( not ( = ?auto_213936 ?auto_213941 ) ) ( not ( = ?auto_213937 ?auto_213941 ) ) ( ON ?auto_213937 ?auto_213938 ) ( ON ?auto_213936 ?auto_213937 ) ( CLEAR ?auto_213934 ) ( ON ?auto_213935 ?auto_213936 ) ( CLEAR ?auto_213935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213941 ?auto_213940 ?auto_213939 ?auto_213938 ?auto_213937 ?auto_213936 )
      ( MAKE-7PILE ?auto_213933 ?auto_213934 ?auto_213935 ?auto_213936 ?auto_213937 ?auto_213938 ?auto_213939 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213942 - BLOCK
      ?auto_213943 - BLOCK
      ?auto_213944 - BLOCK
      ?auto_213945 - BLOCK
      ?auto_213946 - BLOCK
      ?auto_213947 - BLOCK
      ?auto_213948 - BLOCK
    )
    :vars
    (
      ?auto_213949 - BLOCK
      ?auto_213950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213942 ) ( not ( = ?auto_213942 ?auto_213943 ) ) ( not ( = ?auto_213942 ?auto_213944 ) ) ( not ( = ?auto_213942 ?auto_213945 ) ) ( not ( = ?auto_213942 ?auto_213946 ) ) ( not ( = ?auto_213942 ?auto_213947 ) ) ( not ( = ?auto_213942 ?auto_213948 ) ) ( not ( = ?auto_213943 ?auto_213944 ) ) ( not ( = ?auto_213943 ?auto_213945 ) ) ( not ( = ?auto_213943 ?auto_213946 ) ) ( not ( = ?auto_213943 ?auto_213947 ) ) ( not ( = ?auto_213943 ?auto_213948 ) ) ( not ( = ?auto_213944 ?auto_213945 ) ) ( not ( = ?auto_213944 ?auto_213946 ) ) ( not ( = ?auto_213944 ?auto_213947 ) ) ( not ( = ?auto_213944 ?auto_213948 ) ) ( not ( = ?auto_213945 ?auto_213946 ) ) ( not ( = ?auto_213945 ?auto_213947 ) ) ( not ( = ?auto_213945 ?auto_213948 ) ) ( not ( = ?auto_213946 ?auto_213947 ) ) ( not ( = ?auto_213946 ?auto_213948 ) ) ( not ( = ?auto_213947 ?auto_213948 ) ) ( ON ?auto_213948 ?auto_213949 ) ( not ( = ?auto_213942 ?auto_213949 ) ) ( not ( = ?auto_213943 ?auto_213949 ) ) ( not ( = ?auto_213944 ?auto_213949 ) ) ( not ( = ?auto_213945 ?auto_213949 ) ) ( not ( = ?auto_213946 ?auto_213949 ) ) ( not ( = ?auto_213947 ?auto_213949 ) ) ( not ( = ?auto_213948 ?auto_213949 ) ) ( ON ?auto_213947 ?auto_213948 ) ( ON-TABLE ?auto_213950 ) ( ON ?auto_213949 ?auto_213950 ) ( not ( = ?auto_213950 ?auto_213949 ) ) ( not ( = ?auto_213950 ?auto_213948 ) ) ( not ( = ?auto_213950 ?auto_213947 ) ) ( not ( = ?auto_213942 ?auto_213950 ) ) ( not ( = ?auto_213943 ?auto_213950 ) ) ( not ( = ?auto_213944 ?auto_213950 ) ) ( not ( = ?auto_213945 ?auto_213950 ) ) ( not ( = ?auto_213946 ?auto_213950 ) ) ( ON ?auto_213946 ?auto_213947 ) ( ON ?auto_213945 ?auto_213946 ) ( ON ?auto_213944 ?auto_213945 ) ( CLEAR ?auto_213944 ) ( HOLDING ?auto_213943 ) ( CLEAR ?auto_213942 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213942 ?auto_213943 )
      ( MAKE-7PILE ?auto_213942 ?auto_213943 ?auto_213944 ?auto_213945 ?auto_213946 ?auto_213947 ?auto_213948 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213951 - BLOCK
      ?auto_213952 - BLOCK
      ?auto_213953 - BLOCK
      ?auto_213954 - BLOCK
      ?auto_213955 - BLOCK
      ?auto_213956 - BLOCK
      ?auto_213957 - BLOCK
    )
    :vars
    (
      ?auto_213959 - BLOCK
      ?auto_213958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_213951 ) ( not ( = ?auto_213951 ?auto_213952 ) ) ( not ( = ?auto_213951 ?auto_213953 ) ) ( not ( = ?auto_213951 ?auto_213954 ) ) ( not ( = ?auto_213951 ?auto_213955 ) ) ( not ( = ?auto_213951 ?auto_213956 ) ) ( not ( = ?auto_213951 ?auto_213957 ) ) ( not ( = ?auto_213952 ?auto_213953 ) ) ( not ( = ?auto_213952 ?auto_213954 ) ) ( not ( = ?auto_213952 ?auto_213955 ) ) ( not ( = ?auto_213952 ?auto_213956 ) ) ( not ( = ?auto_213952 ?auto_213957 ) ) ( not ( = ?auto_213953 ?auto_213954 ) ) ( not ( = ?auto_213953 ?auto_213955 ) ) ( not ( = ?auto_213953 ?auto_213956 ) ) ( not ( = ?auto_213953 ?auto_213957 ) ) ( not ( = ?auto_213954 ?auto_213955 ) ) ( not ( = ?auto_213954 ?auto_213956 ) ) ( not ( = ?auto_213954 ?auto_213957 ) ) ( not ( = ?auto_213955 ?auto_213956 ) ) ( not ( = ?auto_213955 ?auto_213957 ) ) ( not ( = ?auto_213956 ?auto_213957 ) ) ( ON ?auto_213957 ?auto_213959 ) ( not ( = ?auto_213951 ?auto_213959 ) ) ( not ( = ?auto_213952 ?auto_213959 ) ) ( not ( = ?auto_213953 ?auto_213959 ) ) ( not ( = ?auto_213954 ?auto_213959 ) ) ( not ( = ?auto_213955 ?auto_213959 ) ) ( not ( = ?auto_213956 ?auto_213959 ) ) ( not ( = ?auto_213957 ?auto_213959 ) ) ( ON ?auto_213956 ?auto_213957 ) ( ON-TABLE ?auto_213958 ) ( ON ?auto_213959 ?auto_213958 ) ( not ( = ?auto_213958 ?auto_213959 ) ) ( not ( = ?auto_213958 ?auto_213957 ) ) ( not ( = ?auto_213958 ?auto_213956 ) ) ( not ( = ?auto_213951 ?auto_213958 ) ) ( not ( = ?auto_213952 ?auto_213958 ) ) ( not ( = ?auto_213953 ?auto_213958 ) ) ( not ( = ?auto_213954 ?auto_213958 ) ) ( not ( = ?auto_213955 ?auto_213958 ) ) ( ON ?auto_213955 ?auto_213956 ) ( ON ?auto_213954 ?auto_213955 ) ( ON ?auto_213953 ?auto_213954 ) ( CLEAR ?auto_213951 ) ( ON ?auto_213952 ?auto_213953 ) ( CLEAR ?auto_213952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213958 ?auto_213959 ?auto_213957 ?auto_213956 ?auto_213955 ?auto_213954 ?auto_213953 )
      ( MAKE-7PILE ?auto_213951 ?auto_213952 ?auto_213953 ?auto_213954 ?auto_213955 ?auto_213956 ?auto_213957 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213960 - BLOCK
      ?auto_213961 - BLOCK
      ?auto_213962 - BLOCK
      ?auto_213963 - BLOCK
      ?auto_213964 - BLOCK
      ?auto_213965 - BLOCK
      ?auto_213966 - BLOCK
    )
    :vars
    (
      ?auto_213968 - BLOCK
      ?auto_213967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213960 ?auto_213961 ) ) ( not ( = ?auto_213960 ?auto_213962 ) ) ( not ( = ?auto_213960 ?auto_213963 ) ) ( not ( = ?auto_213960 ?auto_213964 ) ) ( not ( = ?auto_213960 ?auto_213965 ) ) ( not ( = ?auto_213960 ?auto_213966 ) ) ( not ( = ?auto_213961 ?auto_213962 ) ) ( not ( = ?auto_213961 ?auto_213963 ) ) ( not ( = ?auto_213961 ?auto_213964 ) ) ( not ( = ?auto_213961 ?auto_213965 ) ) ( not ( = ?auto_213961 ?auto_213966 ) ) ( not ( = ?auto_213962 ?auto_213963 ) ) ( not ( = ?auto_213962 ?auto_213964 ) ) ( not ( = ?auto_213962 ?auto_213965 ) ) ( not ( = ?auto_213962 ?auto_213966 ) ) ( not ( = ?auto_213963 ?auto_213964 ) ) ( not ( = ?auto_213963 ?auto_213965 ) ) ( not ( = ?auto_213963 ?auto_213966 ) ) ( not ( = ?auto_213964 ?auto_213965 ) ) ( not ( = ?auto_213964 ?auto_213966 ) ) ( not ( = ?auto_213965 ?auto_213966 ) ) ( ON ?auto_213966 ?auto_213968 ) ( not ( = ?auto_213960 ?auto_213968 ) ) ( not ( = ?auto_213961 ?auto_213968 ) ) ( not ( = ?auto_213962 ?auto_213968 ) ) ( not ( = ?auto_213963 ?auto_213968 ) ) ( not ( = ?auto_213964 ?auto_213968 ) ) ( not ( = ?auto_213965 ?auto_213968 ) ) ( not ( = ?auto_213966 ?auto_213968 ) ) ( ON ?auto_213965 ?auto_213966 ) ( ON-TABLE ?auto_213967 ) ( ON ?auto_213968 ?auto_213967 ) ( not ( = ?auto_213967 ?auto_213968 ) ) ( not ( = ?auto_213967 ?auto_213966 ) ) ( not ( = ?auto_213967 ?auto_213965 ) ) ( not ( = ?auto_213960 ?auto_213967 ) ) ( not ( = ?auto_213961 ?auto_213967 ) ) ( not ( = ?auto_213962 ?auto_213967 ) ) ( not ( = ?auto_213963 ?auto_213967 ) ) ( not ( = ?auto_213964 ?auto_213967 ) ) ( ON ?auto_213964 ?auto_213965 ) ( ON ?auto_213963 ?auto_213964 ) ( ON ?auto_213962 ?auto_213963 ) ( ON ?auto_213961 ?auto_213962 ) ( CLEAR ?auto_213961 ) ( HOLDING ?auto_213960 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213960 )
      ( MAKE-7PILE ?auto_213960 ?auto_213961 ?auto_213962 ?auto_213963 ?auto_213964 ?auto_213965 ?auto_213966 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213969 - BLOCK
      ?auto_213970 - BLOCK
      ?auto_213971 - BLOCK
      ?auto_213972 - BLOCK
      ?auto_213973 - BLOCK
      ?auto_213974 - BLOCK
      ?auto_213975 - BLOCK
    )
    :vars
    (
      ?auto_213976 - BLOCK
      ?auto_213977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213969 ?auto_213970 ) ) ( not ( = ?auto_213969 ?auto_213971 ) ) ( not ( = ?auto_213969 ?auto_213972 ) ) ( not ( = ?auto_213969 ?auto_213973 ) ) ( not ( = ?auto_213969 ?auto_213974 ) ) ( not ( = ?auto_213969 ?auto_213975 ) ) ( not ( = ?auto_213970 ?auto_213971 ) ) ( not ( = ?auto_213970 ?auto_213972 ) ) ( not ( = ?auto_213970 ?auto_213973 ) ) ( not ( = ?auto_213970 ?auto_213974 ) ) ( not ( = ?auto_213970 ?auto_213975 ) ) ( not ( = ?auto_213971 ?auto_213972 ) ) ( not ( = ?auto_213971 ?auto_213973 ) ) ( not ( = ?auto_213971 ?auto_213974 ) ) ( not ( = ?auto_213971 ?auto_213975 ) ) ( not ( = ?auto_213972 ?auto_213973 ) ) ( not ( = ?auto_213972 ?auto_213974 ) ) ( not ( = ?auto_213972 ?auto_213975 ) ) ( not ( = ?auto_213973 ?auto_213974 ) ) ( not ( = ?auto_213973 ?auto_213975 ) ) ( not ( = ?auto_213974 ?auto_213975 ) ) ( ON ?auto_213975 ?auto_213976 ) ( not ( = ?auto_213969 ?auto_213976 ) ) ( not ( = ?auto_213970 ?auto_213976 ) ) ( not ( = ?auto_213971 ?auto_213976 ) ) ( not ( = ?auto_213972 ?auto_213976 ) ) ( not ( = ?auto_213973 ?auto_213976 ) ) ( not ( = ?auto_213974 ?auto_213976 ) ) ( not ( = ?auto_213975 ?auto_213976 ) ) ( ON ?auto_213974 ?auto_213975 ) ( ON-TABLE ?auto_213977 ) ( ON ?auto_213976 ?auto_213977 ) ( not ( = ?auto_213977 ?auto_213976 ) ) ( not ( = ?auto_213977 ?auto_213975 ) ) ( not ( = ?auto_213977 ?auto_213974 ) ) ( not ( = ?auto_213969 ?auto_213977 ) ) ( not ( = ?auto_213970 ?auto_213977 ) ) ( not ( = ?auto_213971 ?auto_213977 ) ) ( not ( = ?auto_213972 ?auto_213977 ) ) ( not ( = ?auto_213973 ?auto_213977 ) ) ( ON ?auto_213973 ?auto_213974 ) ( ON ?auto_213972 ?auto_213973 ) ( ON ?auto_213971 ?auto_213972 ) ( ON ?auto_213970 ?auto_213971 ) ( ON ?auto_213969 ?auto_213970 ) ( CLEAR ?auto_213969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213977 ?auto_213976 ?auto_213975 ?auto_213974 ?auto_213973 ?auto_213972 ?auto_213971 ?auto_213970 )
      ( MAKE-7PILE ?auto_213969 ?auto_213970 ?auto_213971 ?auto_213972 ?auto_213973 ?auto_213974 ?auto_213975 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_213979 - BLOCK
    )
    :vars
    (
      ?auto_213980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213980 ?auto_213979 ) ( CLEAR ?auto_213980 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213979 ) ( not ( = ?auto_213979 ?auto_213980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213980 ?auto_213979 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_213981 - BLOCK
    )
    :vars
    (
      ?auto_213982 - BLOCK
      ?auto_213983 - BLOCK
      ?auto_213984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213982 ?auto_213981 ) ( CLEAR ?auto_213982 ) ( ON-TABLE ?auto_213981 ) ( not ( = ?auto_213981 ?auto_213982 ) ) ( HOLDING ?auto_213983 ) ( CLEAR ?auto_213984 ) ( not ( = ?auto_213981 ?auto_213983 ) ) ( not ( = ?auto_213981 ?auto_213984 ) ) ( not ( = ?auto_213982 ?auto_213983 ) ) ( not ( = ?auto_213982 ?auto_213984 ) ) ( not ( = ?auto_213983 ?auto_213984 ) ) )
    :subtasks
    ( ( !STACK ?auto_213983 ?auto_213984 )
      ( MAKE-1PILE ?auto_213981 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_213985 - BLOCK
    )
    :vars
    (
      ?auto_213986 - BLOCK
      ?auto_213987 - BLOCK
      ?auto_213988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213986 ?auto_213985 ) ( ON-TABLE ?auto_213985 ) ( not ( = ?auto_213985 ?auto_213986 ) ) ( CLEAR ?auto_213987 ) ( not ( = ?auto_213985 ?auto_213988 ) ) ( not ( = ?auto_213985 ?auto_213987 ) ) ( not ( = ?auto_213986 ?auto_213988 ) ) ( not ( = ?auto_213986 ?auto_213987 ) ) ( not ( = ?auto_213988 ?auto_213987 ) ) ( ON ?auto_213988 ?auto_213986 ) ( CLEAR ?auto_213988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213985 ?auto_213986 )
      ( MAKE-1PILE ?auto_213985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_213989 - BLOCK
    )
    :vars
    (
      ?auto_213991 - BLOCK
      ?auto_213992 - BLOCK
      ?auto_213990 - BLOCK
      ?auto_213997 - BLOCK
      ?auto_213994 - BLOCK
      ?auto_213993 - BLOCK
      ?auto_213995 - BLOCK
      ?auto_213996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213991 ?auto_213989 ) ( ON-TABLE ?auto_213989 ) ( not ( = ?auto_213989 ?auto_213991 ) ) ( not ( = ?auto_213989 ?auto_213992 ) ) ( not ( = ?auto_213989 ?auto_213990 ) ) ( not ( = ?auto_213991 ?auto_213992 ) ) ( not ( = ?auto_213991 ?auto_213990 ) ) ( not ( = ?auto_213992 ?auto_213990 ) ) ( ON ?auto_213992 ?auto_213991 ) ( CLEAR ?auto_213992 ) ( HOLDING ?auto_213990 ) ( CLEAR ?auto_213997 ) ( ON-TABLE ?auto_213994 ) ( ON ?auto_213993 ?auto_213994 ) ( ON ?auto_213995 ?auto_213993 ) ( ON ?auto_213996 ?auto_213995 ) ( ON ?auto_213997 ?auto_213996 ) ( not ( = ?auto_213994 ?auto_213993 ) ) ( not ( = ?auto_213994 ?auto_213995 ) ) ( not ( = ?auto_213994 ?auto_213996 ) ) ( not ( = ?auto_213994 ?auto_213997 ) ) ( not ( = ?auto_213994 ?auto_213990 ) ) ( not ( = ?auto_213993 ?auto_213995 ) ) ( not ( = ?auto_213993 ?auto_213996 ) ) ( not ( = ?auto_213993 ?auto_213997 ) ) ( not ( = ?auto_213993 ?auto_213990 ) ) ( not ( = ?auto_213995 ?auto_213996 ) ) ( not ( = ?auto_213995 ?auto_213997 ) ) ( not ( = ?auto_213995 ?auto_213990 ) ) ( not ( = ?auto_213996 ?auto_213997 ) ) ( not ( = ?auto_213996 ?auto_213990 ) ) ( not ( = ?auto_213997 ?auto_213990 ) ) ( not ( = ?auto_213989 ?auto_213997 ) ) ( not ( = ?auto_213989 ?auto_213994 ) ) ( not ( = ?auto_213989 ?auto_213993 ) ) ( not ( = ?auto_213989 ?auto_213995 ) ) ( not ( = ?auto_213989 ?auto_213996 ) ) ( not ( = ?auto_213991 ?auto_213997 ) ) ( not ( = ?auto_213991 ?auto_213994 ) ) ( not ( = ?auto_213991 ?auto_213993 ) ) ( not ( = ?auto_213991 ?auto_213995 ) ) ( not ( = ?auto_213991 ?auto_213996 ) ) ( not ( = ?auto_213992 ?auto_213997 ) ) ( not ( = ?auto_213992 ?auto_213994 ) ) ( not ( = ?auto_213992 ?auto_213993 ) ) ( not ( = ?auto_213992 ?auto_213995 ) ) ( not ( = ?auto_213992 ?auto_213996 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213994 ?auto_213993 ?auto_213995 ?auto_213996 ?auto_213997 ?auto_213990 )
      ( MAKE-1PILE ?auto_213989 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_213998 - BLOCK
    )
    :vars
    (
      ?auto_214002 - BLOCK
      ?auto_214001 - BLOCK
      ?auto_214004 - BLOCK
      ?auto_214003 - BLOCK
      ?auto_214006 - BLOCK
      ?auto_213999 - BLOCK
      ?auto_214000 - BLOCK
      ?auto_214005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214002 ?auto_213998 ) ( ON-TABLE ?auto_213998 ) ( not ( = ?auto_213998 ?auto_214002 ) ) ( not ( = ?auto_213998 ?auto_214001 ) ) ( not ( = ?auto_213998 ?auto_214004 ) ) ( not ( = ?auto_214002 ?auto_214001 ) ) ( not ( = ?auto_214002 ?auto_214004 ) ) ( not ( = ?auto_214001 ?auto_214004 ) ) ( ON ?auto_214001 ?auto_214002 ) ( CLEAR ?auto_214003 ) ( ON-TABLE ?auto_214006 ) ( ON ?auto_213999 ?auto_214006 ) ( ON ?auto_214000 ?auto_213999 ) ( ON ?auto_214005 ?auto_214000 ) ( ON ?auto_214003 ?auto_214005 ) ( not ( = ?auto_214006 ?auto_213999 ) ) ( not ( = ?auto_214006 ?auto_214000 ) ) ( not ( = ?auto_214006 ?auto_214005 ) ) ( not ( = ?auto_214006 ?auto_214003 ) ) ( not ( = ?auto_214006 ?auto_214004 ) ) ( not ( = ?auto_213999 ?auto_214000 ) ) ( not ( = ?auto_213999 ?auto_214005 ) ) ( not ( = ?auto_213999 ?auto_214003 ) ) ( not ( = ?auto_213999 ?auto_214004 ) ) ( not ( = ?auto_214000 ?auto_214005 ) ) ( not ( = ?auto_214000 ?auto_214003 ) ) ( not ( = ?auto_214000 ?auto_214004 ) ) ( not ( = ?auto_214005 ?auto_214003 ) ) ( not ( = ?auto_214005 ?auto_214004 ) ) ( not ( = ?auto_214003 ?auto_214004 ) ) ( not ( = ?auto_213998 ?auto_214003 ) ) ( not ( = ?auto_213998 ?auto_214006 ) ) ( not ( = ?auto_213998 ?auto_213999 ) ) ( not ( = ?auto_213998 ?auto_214000 ) ) ( not ( = ?auto_213998 ?auto_214005 ) ) ( not ( = ?auto_214002 ?auto_214003 ) ) ( not ( = ?auto_214002 ?auto_214006 ) ) ( not ( = ?auto_214002 ?auto_213999 ) ) ( not ( = ?auto_214002 ?auto_214000 ) ) ( not ( = ?auto_214002 ?auto_214005 ) ) ( not ( = ?auto_214001 ?auto_214003 ) ) ( not ( = ?auto_214001 ?auto_214006 ) ) ( not ( = ?auto_214001 ?auto_213999 ) ) ( not ( = ?auto_214001 ?auto_214000 ) ) ( not ( = ?auto_214001 ?auto_214005 ) ) ( ON ?auto_214004 ?auto_214001 ) ( CLEAR ?auto_214004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213998 ?auto_214002 ?auto_214001 )
      ( MAKE-1PILE ?auto_213998 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214007 - BLOCK
    )
    :vars
    (
      ?auto_214015 - BLOCK
      ?auto_214009 - BLOCK
      ?auto_214008 - BLOCK
      ?auto_214014 - BLOCK
      ?auto_214010 - BLOCK
      ?auto_214013 - BLOCK
      ?auto_214011 - BLOCK
      ?auto_214012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214015 ?auto_214007 ) ( ON-TABLE ?auto_214007 ) ( not ( = ?auto_214007 ?auto_214015 ) ) ( not ( = ?auto_214007 ?auto_214009 ) ) ( not ( = ?auto_214007 ?auto_214008 ) ) ( not ( = ?auto_214015 ?auto_214009 ) ) ( not ( = ?auto_214015 ?auto_214008 ) ) ( not ( = ?auto_214009 ?auto_214008 ) ) ( ON ?auto_214009 ?auto_214015 ) ( ON-TABLE ?auto_214014 ) ( ON ?auto_214010 ?auto_214014 ) ( ON ?auto_214013 ?auto_214010 ) ( ON ?auto_214011 ?auto_214013 ) ( not ( = ?auto_214014 ?auto_214010 ) ) ( not ( = ?auto_214014 ?auto_214013 ) ) ( not ( = ?auto_214014 ?auto_214011 ) ) ( not ( = ?auto_214014 ?auto_214012 ) ) ( not ( = ?auto_214014 ?auto_214008 ) ) ( not ( = ?auto_214010 ?auto_214013 ) ) ( not ( = ?auto_214010 ?auto_214011 ) ) ( not ( = ?auto_214010 ?auto_214012 ) ) ( not ( = ?auto_214010 ?auto_214008 ) ) ( not ( = ?auto_214013 ?auto_214011 ) ) ( not ( = ?auto_214013 ?auto_214012 ) ) ( not ( = ?auto_214013 ?auto_214008 ) ) ( not ( = ?auto_214011 ?auto_214012 ) ) ( not ( = ?auto_214011 ?auto_214008 ) ) ( not ( = ?auto_214012 ?auto_214008 ) ) ( not ( = ?auto_214007 ?auto_214012 ) ) ( not ( = ?auto_214007 ?auto_214014 ) ) ( not ( = ?auto_214007 ?auto_214010 ) ) ( not ( = ?auto_214007 ?auto_214013 ) ) ( not ( = ?auto_214007 ?auto_214011 ) ) ( not ( = ?auto_214015 ?auto_214012 ) ) ( not ( = ?auto_214015 ?auto_214014 ) ) ( not ( = ?auto_214015 ?auto_214010 ) ) ( not ( = ?auto_214015 ?auto_214013 ) ) ( not ( = ?auto_214015 ?auto_214011 ) ) ( not ( = ?auto_214009 ?auto_214012 ) ) ( not ( = ?auto_214009 ?auto_214014 ) ) ( not ( = ?auto_214009 ?auto_214010 ) ) ( not ( = ?auto_214009 ?auto_214013 ) ) ( not ( = ?auto_214009 ?auto_214011 ) ) ( ON ?auto_214008 ?auto_214009 ) ( CLEAR ?auto_214008 ) ( HOLDING ?auto_214012 ) ( CLEAR ?auto_214011 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214014 ?auto_214010 ?auto_214013 ?auto_214011 ?auto_214012 )
      ( MAKE-1PILE ?auto_214007 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214016 - BLOCK
    )
    :vars
    (
      ?auto_214023 - BLOCK
      ?auto_214017 - BLOCK
      ?auto_214020 - BLOCK
      ?auto_214022 - BLOCK
      ?auto_214021 - BLOCK
      ?auto_214019 - BLOCK
      ?auto_214024 - BLOCK
      ?auto_214018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214023 ?auto_214016 ) ( ON-TABLE ?auto_214016 ) ( not ( = ?auto_214016 ?auto_214023 ) ) ( not ( = ?auto_214016 ?auto_214017 ) ) ( not ( = ?auto_214016 ?auto_214020 ) ) ( not ( = ?auto_214023 ?auto_214017 ) ) ( not ( = ?auto_214023 ?auto_214020 ) ) ( not ( = ?auto_214017 ?auto_214020 ) ) ( ON ?auto_214017 ?auto_214023 ) ( ON-TABLE ?auto_214022 ) ( ON ?auto_214021 ?auto_214022 ) ( ON ?auto_214019 ?auto_214021 ) ( ON ?auto_214024 ?auto_214019 ) ( not ( = ?auto_214022 ?auto_214021 ) ) ( not ( = ?auto_214022 ?auto_214019 ) ) ( not ( = ?auto_214022 ?auto_214024 ) ) ( not ( = ?auto_214022 ?auto_214018 ) ) ( not ( = ?auto_214022 ?auto_214020 ) ) ( not ( = ?auto_214021 ?auto_214019 ) ) ( not ( = ?auto_214021 ?auto_214024 ) ) ( not ( = ?auto_214021 ?auto_214018 ) ) ( not ( = ?auto_214021 ?auto_214020 ) ) ( not ( = ?auto_214019 ?auto_214024 ) ) ( not ( = ?auto_214019 ?auto_214018 ) ) ( not ( = ?auto_214019 ?auto_214020 ) ) ( not ( = ?auto_214024 ?auto_214018 ) ) ( not ( = ?auto_214024 ?auto_214020 ) ) ( not ( = ?auto_214018 ?auto_214020 ) ) ( not ( = ?auto_214016 ?auto_214018 ) ) ( not ( = ?auto_214016 ?auto_214022 ) ) ( not ( = ?auto_214016 ?auto_214021 ) ) ( not ( = ?auto_214016 ?auto_214019 ) ) ( not ( = ?auto_214016 ?auto_214024 ) ) ( not ( = ?auto_214023 ?auto_214018 ) ) ( not ( = ?auto_214023 ?auto_214022 ) ) ( not ( = ?auto_214023 ?auto_214021 ) ) ( not ( = ?auto_214023 ?auto_214019 ) ) ( not ( = ?auto_214023 ?auto_214024 ) ) ( not ( = ?auto_214017 ?auto_214018 ) ) ( not ( = ?auto_214017 ?auto_214022 ) ) ( not ( = ?auto_214017 ?auto_214021 ) ) ( not ( = ?auto_214017 ?auto_214019 ) ) ( not ( = ?auto_214017 ?auto_214024 ) ) ( ON ?auto_214020 ?auto_214017 ) ( CLEAR ?auto_214024 ) ( ON ?auto_214018 ?auto_214020 ) ( CLEAR ?auto_214018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214016 ?auto_214023 ?auto_214017 ?auto_214020 )
      ( MAKE-1PILE ?auto_214016 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214025 - BLOCK
    )
    :vars
    (
      ?auto_214028 - BLOCK
      ?auto_214033 - BLOCK
      ?auto_214030 - BLOCK
      ?auto_214029 - BLOCK
      ?auto_214027 - BLOCK
      ?auto_214031 - BLOCK
      ?auto_214026 - BLOCK
      ?auto_214032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214028 ?auto_214025 ) ( ON-TABLE ?auto_214025 ) ( not ( = ?auto_214025 ?auto_214028 ) ) ( not ( = ?auto_214025 ?auto_214033 ) ) ( not ( = ?auto_214025 ?auto_214030 ) ) ( not ( = ?auto_214028 ?auto_214033 ) ) ( not ( = ?auto_214028 ?auto_214030 ) ) ( not ( = ?auto_214033 ?auto_214030 ) ) ( ON ?auto_214033 ?auto_214028 ) ( ON-TABLE ?auto_214029 ) ( ON ?auto_214027 ?auto_214029 ) ( ON ?auto_214031 ?auto_214027 ) ( not ( = ?auto_214029 ?auto_214027 ) ) ( not ( = ?auto_214029 ?auto_214031 ) ) ( not ( = ?auto_214029 ?auto_214026 ) ) ( not ( = ?auto_214029 ?auto_214032 ) ) ( not ( = ?auto_214029 ?auto_214030 ) ) ( not ( = ?auto_214027 ?auto_214031 ) ) ( not ( = ?auto_214027 ?auto_214026 ) ) ( not ( = ?auto_214027 ?auto_214032 ) ) ( not ( = ?auto_214027 ?auto_214030 ) ) ( not ( = ?auto_214031 ?auto_214026 ) ) ( not ( = ?auto_214031 ?auto_214032 ) ) ( not ( = ?auto_214031 ?auto_214030 ) ) ( not ( = ?auto_214026 ?auto_214032 ) ) ( not ( = ?auto_214026 ?auto_214030 ) ) ( not ( = ?auto_214032 ?auto_214030 ) ) ( not ( = ?auto_214025 ?auto_214032 ) ) ( not ( = ?auto_214025 ?auto_214029 ) ) ( not ( = ?auto_214025 ?auto_214027 ) ) ( not ( = ?auto_214025 ?auto_214031 ) ) ( not ( = ?auto_214025 ?auto_214026 ) ) ( not ( = ?auto_214028 ?auto_214032 ) ) ( not ( = ?auto_214028 ?auto_214029 ) ) ( not ( = ?auto_214028 ?auto_214027 ) ) ( not ( = ?auto_214028 ?auto_214031 ) ) ( not ( = ?auto_214028 ?auto_214026 ) ) ( not ( = ?auto_214033 ?auto_214032 ) ) ( not ( = ?auto_214033 ?auto_214029 ) ) ( not ( = ?auto_214033 ?auto_214027 ) ) ( not ( = ?auto_214033 ?auto_214031 ) ) ( not ( = ?auto_214033 ?auto_214026 ) ) ( ON ?auto_214030 ?auto_214033 ) ( ON ?auto_214032 ?auto_214030 ) ( CLEAR ?auto_214032 ) ( HOLDING ?auto_214026 ) ( CLEAR ?auto_214031 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214029 ?auto_214027 ?auto_214031 ?auto_214026 )
      ( MAKE-1PILE ?auto_214025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214034 - BLOCK
    )
    :vars
    (
      ?auto_214041 - BLOCK
      ?auto_214035 - BLOCK
      ?auto_214038 - BLOCK
      ?auto_214040 - BLOCK
      ?auto_214039 - BLOCK
      ?auto_214037 - BLOCK
      ?auto_214036 - BLOCK
      ?auto_214042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214041 ?auto_214034 ) ( ON-TABLE ?auto_214034 ) ( not ( = ?auto_214034 ?auto_214041 ) ) ( not ( = ?auto_214034 ?auto_214035 ) ) ( not ( = ?auto_214034 ?auto_214038 ) ) ( not ( = ?auto_214041 ?auto_214035 ) ) ( not ( = ?auto_214041 ?auto_214038 ) ) ( not ( = ?auto_214035 ?auto_214038 ) ) ( ON ?auto_214035 ?auto_214041 ) ( ON-TABLE ?auto_214040 ) ( ON ?auto_214039 ?auto_214040 ) ( ON ?auto_214037 ?auto_214039 ) ( not ( = ?auto_214040 ?auto_214039 ) ) ( not ( = ?auto_214040 ?auto_214037 ) ) ( not ( = ?auto_214040 ?auto_214036 ) ) ( not ( = ?auto_214040 ?auto_214042 ) ) ( not ( = ?auto_214040 ?auto_214038 ) ) ( not ( = ?auto_214039 ?auto_214037 ) ) ( not ( = ?auto_214039 ?auto_214036 ) ) ( not ( = ?auto_214039 ?auto_214042 ) ) ( not ( = ?auto_214039 ?auto_214038 ) ) ( not ( = ?auto_214037 ?auto_214036 ) ) ( not ( = ?auto_214037 ?auto_214042 ) ) ( not ( = ?auto_214037 ?auto_214038 ) ) ( not ( = ?auto_214036 ?auto_214042 ) ) ( not ( = ?auto_214036 ?auto_214038 ) ) ( not ( = ?auto_214042 ?auto_214038 ) ) ( not ( = ?auto_214034 ?auto_214042 ) ) ( not ( = ?auto_214034 ?auto_214040 ) ) ( not ( = ?auto_214034 ?auto_214039 ) ) ( not ( = ?auto_214034 ?auto_214037 ) ) ( not ( = ?auto_214034 ?auto_214036 ) ) ( not ( = ?auto_214041 ?auto_214042 ) ) ( not ( = ?auto_214041 ?auto_214040 ) ) ( not ( = ?auto_214041 ?auto_214039 ) ) ( not ( = ?auto_214041 ?auto_214037 ) ) ( not ( = ?auto_214041 ?auto_214036 ) ) ( not ( = ?auto_214035 ?auto_214042 ) ) ( not ( = ?auto_214035 ?auto_214040 ) ) ( not ( = ?auto_214035 ?auto_214039 ) ) ( not ( = ?auto_214035 ?auto_214037 ) ) ( not ( = ?auto_214035 ?auto_214036 ) ) ( ON ?auto_214038 ?auto_214035 ) ( ON ?auto_214042 ?auto_214038 ) ( CLEAR ?auto_214037 ) ( ON ?auto_214036 ?auto_214042 ) ( CLEAR ?auto_214036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214034 ?auto_214041 ?auto_214035 ?auto_214038 ?auto_214042 )
      ( MAKE-1PILE ?auto_214034 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214043 - BLOCK
    )
    :vars
    (
      ?auto_214048 - BLOCK
      ?auto_214044 - BLOCK
      ?auto_214050 - BLOCK
      ?auto_214046 - BLOCK
      ?auto_214047 - BLOCK
      ?auto_214045 - BLOCK
      ?auto_214049 - BLOCK
      ?auto_214051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214048 ?auto_214043 ) ( ON-TABLE ?auto_214043 ) ( not ( = ?auto_214043 ?auto_214048 ) ) ( not ( = ?auto_214043 ?auto_214044 ) ) ( not ( = ?auto_214043 ?auto_214050 ) ) ( not ( = ?auto_214048 ?auto_214044 ) ) ( not ( = ?auto_214048 ?auto_214050 ) ) ( not ( = ?auto_214044 ?auto_214050 ) ) ( ON ?auto_214044 ?auto_214048 ) ( ON-TABLE ?auto_214046 ) ( ON ?auto_214047 ?auto_214046 ) ( not ( = ?auto_214046 ?auto_214047 ) ) ( not ( = ?auto_214046 ?auto_214045 ) ) ( not ( = ?auto_214046 ?auto_214049 ) ) ( not ( = ?auto_214046 ?auto_214051 ) ) ( not ( = ?auto_214046 ?auto_214050 ) ) ( not ( = ?auto_214047 ?auto_214045 ) ) ( not ( = ?auto_214047 ?auto_214049 ) ) ( not ( = ?auto_214047 ?auto_214051 ) ) ( not ( = ?auto_214047 ?auto_214050 ) ) ( not ( = ?auto_214045 ?auto_214049 ) ) ( not ( = ?auto_214045 ?auto_214051 ) ) ( not ( = ?auto_214045 ?auto_214050 ) ) ( not ( = ?auto_214049 ?auto_214051 ) ) ( not ( = ?auto_214049 ?auto_214050 ) ) ( not ( = ?auto_214051 ?auto_214050 ) ) ( not ( = ?auto_214043 ?auto_214051 ) ) ( not ( = ?auto_214043 ?auto_214046 ) ) ( not ( = ?auto_214043 ?auto_214047 ) ) ( not ( = ?auto_214043 ?auto_214045 ) ) ( not ( = ?auto_214043 ?auto_214049 ) ) ( not ( = ?auto_214048 ?auto_214051 ) ) ( not ( = ?auto_214048 ?auto_214046 ) ) ( not ( = ?auto_214048 ?auto_214047 ) ) ( not ( = ?auto_214048 ?auto_214045 ) ) ( not ( = ?auto_214048 ?auto_214049 ) ) ( not ( = ?auto_214044 ?auto_214051 ) ) ( not ( = ?auto_214044 ?auto_214046 ) ) ( not ( = ?auto_214044 ?auto_214047 ) ) ( not ( = ?auto_214044 ?auto_214045 ) ) ( not ( = ?auto_214044 ?auto_214049 ) ) ( ON ?auto_214050 ?auto_214044 ) ( ON ?auto_214051 ?auto_214050 ) ( ON ?auto_214049 ?auto_214051 ) ( CLEAR ?auto_214049 ) ( HOLDING ?auto_214045 ) ( CLEAR ?auto_214047 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214046 ?auto_214047 ?auto_214045 )
      ( MAKE-1PILE ?auto_214043 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214052 - BLOCK
    )
    :vars
    (
      ?auto_214059 - BLOCK
      ?auto_214053 - BLOCK
      ?auto_214054 - BLOCK
      ?auto_214055 - BLOCK
      ?auto_214060 - BLOCK
      ?auto_214058 - BLOCK
      ?auto_214057 - BLOCK
      ?auto_214056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214059 ?auto_214052 ) ( ON-TABLE ?auto_214052 ) ( not ( = ?auto_214052 ?auto_214059 ) ) ( not ( = ?auto_214052 ?auto_214053 ) ) ( not ( = ?auto_214052 ?auto_214054 ) ) ( not ( = ?auto_214059 ?auto_214053 ) ) ( not ( = ?auto_214059 ?auto_214054 ) ) ( not ( = ?auto_214053 ?auto_214054 ) ) ( ON ?auto_214053 ?auto_214059 ) ( ON-TABLE ?auto_214055 ) ( ON ?auto_214060 ?auto_214055 ) ( not ( = ?auto_214055 ?auto_214060 ) ) ( not ( = ?auto_214055 ?auto_214058 ) ) ( not ( = ?auto_214055 ?auto_214057 ) ) ( not ( = ?auto_214055 ?auto_214056 ) ) ( not ( = ?auto_214055 ?auto_214054 ) ) ( not ( = ?auto_214060 ?auto_214058 ) ) ( not ( = ?auto_214060 ?auto_214057 ) ) ( not ( = ?auto_214060 ?auto_214056 ) ) ( not ( = ?auto_214060 ?auto_214054 ) ) ( not ( = ?auto_214058 ?auto_214057 ) ) ( not ( = ?auto_214058 ?auto_214056 ) ) ( not ( = ?auto_214058 ?auto_214054 ) ) ( not ( = ?auto_214057 ?auto_214056 ) ) ( not ( = ?auto_214057 ?auto_214054 ) ) ( not ( = ?auto_214056 ?auto_214054 ) ) ( not ( = ?auto_214052 ?auto_214056 ) ) ( not ( = ?auto_214052 ?auto_214055 ) ) ( not ( = ?auto_214052 ?auto_214060 ) ) ( not ( = ?auto_214052 ?auto_214058 ) ) ( not ( = ?auto_214052 ?auto_214057 ) ) ( not ( = ?auto_214059 ?auto_214056 ) ) ( not ( = ?auto_214059 ?auto_214055 ) ) ( not ( = ?auto_214059 ?auto_214060 ) ) ( not ( = ?auto_214059 ?auto_214058 ) ) ( not ( = ?auto_214059 ?auto_214057 ) ) ( not ( = ?auto_214053 ?auto_214056 ) ) ( not ( = ?auto_214053 ?auto_214055 ) ) ( not ( = ?auto_214053 ?auto_214060 ) ) ( not ( = ?auto_214053 ?auto_214058 ) ) ( not ( = ?auto_214053 ?auto_214057 ) ) ( ON ?auto_214054 ?auto_214053 ) ( ON ?auto_214056 ?auto_214054 ) ( ON ?auto_214057 ?auto_214056 ) ( CLEAR ?auto_214060 ) ( ON ?auto_214058 ?auto_214057 ) ( CLEAR ?auto_214058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214052 ?auto_214059 ?auto_214053 ?auto_214054 ?auto_214056 ?auto_214057 )
      ( MAKE-1PILE ?auto_214052 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214061 - BLOCK
    )
    :vars
    (
      ?auto_214067 - BLOCK
      ?auto_214063 - BLOCK
      ?auto_214066 - BLOCK
      ?auto_214062 - BLOCK
      ?auto_214068 - BLOCK
      ?auto_214065 - BLOCK
      ?auto_214069 - BLOCK
      ?auto_214064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214067 ?auto_214061 ) ( ON-TABLE ?auto_214061 ) ( not ( = ?auto_214061 ?auto_214067 ) ) ( not ( = ?auto_214061 ?auto_214063 ) ) ( not ( = ?auto_214061 ?auto_214066 ) ) ( not ( = ?auto_214067 ?auto_214063 ) ) ( not ( = ?auto_214067 ?auto_214066 ) ) ( not ( = ?auto_214063 ?auto_214066 ) ) ( ON ?auto_214063 ?auto_214067 ) ( ON-TABLE ?auto_214062 ) ( not ( = ?auto_214062 ?auto_214068 ) ) ( not ( = ?auto_214062 ?auto_214065 ) ) ( not ( = ?auto_214062 ?auto_214069 ) ) ( not ( = ?auto_214062 ?auto_214064 ) ) ( not ( = ?auto_214062 ?auto_214066 ) ) ( not ( = ?auto_214068 ?auto_214065 ) ) ( not ( = ?auto_214068 ?auto_214069 ) ) ( not ( = ?auto_214068 ?auto_214064 ) ) ( not ( = ?auto_214068 ?auto_214066 ) ) ( not ( = ?auto_214065 ?auto_214069 ) ) ( not ( = ?auto_214065 ?auto_214064 ) ) ( not ( = ?auto_214065 ?auto_214066 ) ) ( not ( = ?auto_214069 ?auto_214064 ) ) ( not ( = ?auto_214069 ?auto_214066 ) ) ( not ( = ?auto_214064 ?auto_214066 ) ) ( not ( = ?auto_214061 ?auto_214064 ) ) ( not ( = ?auto_214061 ?auto_214062 ) ) ( not ( = ?auto_214061 ?auto_214068 ) ) ( not ( = ?auto_214061 ?auto_214065 ) ) ( not ( = ?auto_214061 ?auto_214069 ) ) ( not ( = ?auto_214067 ?auto_214064 ) ) ( not ( = ?auto_214067 ?auto_214062 ) ) ( not ( = ?auto_214067 ?auto_214068 ) ) ( not ( = ?auto_214067 ?auto_214065 ) ) ( not ( = ?auto_214067 ?auto_214069 ) ) ( not ( = ?auto_214063 ?auto_214064 ) ) ( not ( = ?auto_214063 ?auto_214062 ) ) ( not ( = ?auto_214063 ?auto_214068 ) ) ( not ( = ?auto_214063 ?auto_214065 ) ) ( not ( = ?auto_214063 ?auto_214069 ) ) ( ON ?auto_214066 ?auto_214063 ) ( ON ?auto_214064 ?auto_214066 ) ( ON ?auto_214069 ?auto_214064 ) ( ON ?auto_214065 ?auto_214069 ) ( CLEAR ?auto_214065 ) ( HOLDING ?auto_214068 ) ( CLEAR ?auto_214062 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214062 ?auto_214068 )
      ( MAKE-1PILE ?auto_214061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214070 - BLOCK
    )
    :vars
    (
      ?auto_214077 - BLOCK
      ?auto_214073 - BLOCK
      ?auto_214076 - BLOCK
      ?auto_214074 - BLOCK
      ?auto_214075 - BLOCK
      ?auto_214071 - BLOCK
      ?auto_214078 - BLOCK
      ?auto_214072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214077 ?auto_214070 ) ( ON-TABLE ?auto_214070 ) ( not ( = ?auto_214070 ?auto_214077 ) ) ( not ( = ?auto_214070 ?auto_214073 ) ) ( not ( = ?auto_214070 ?auto_214076 ) ) ( not ( = ?auto_214077 ?auto_214073 ) ) ( not ( = ?auto_214077 ?auto_214076 ) ) ( not ( = ?auto_214073 ?auto_214076 ) ) ( ON ?auto_214073 ?auto_214077 ) ( ON-TABLE ?auto_214074 ) ( not ( = ?auto_214074 ?auto_214075 ) ) ( not ( = ?auto_214074 ?auto_214071 ) ) ( not ( = ?auto_214074 ?auto_214078 ) ) ( not ( = ?auto_214074 ?auto_214072 ) ) ( not ( = ?auto_214074 ?auto_214076 ) ) ( not ( = ?auto_214075 ?auto_214071 ) ) ( not ( = ?auto_214075 ?auto_214078 ) ) ( not ( = ?auto_214075 ?auto_214072 ) ) ( not ( = ?auto_214075 ?auto_214076 ) ) ( not ( = ?auto_214071 ?auto_214078 ) ) ( not ( = ?auto_214071 ?auto_214072 ) ) ( not ( = ?auto_214071 ?auto_214076 ) ) ( not ( = ?auto_214078 ?auto_214072 ) ) ( not ( = ?auto_214078 ?auto_214076 ) ) ( not ( = ?auto_214072 ?auto_214076 ) ) ( not ( = ?auto_214070 ?auto_214072 ) ) ( not ( = ?auto_214070 ?auto_214074 ) ) ( not ( = ?auto_214070 ?auto_214075 ) ) ( not ( = ?auto_214070 ?auto_214071 ) ) ( not ( = ?auto_214070 ?auto_214078 ) ) ( not ( = ?auto_214077 ?auto_214072 ) ) ( not ( = ?auto_214077 ?auto_214074 ) ) ( not ( = ?auto_214077 ?auto_214075 ) ) ( not ( = ?auto_214077 ?auto_214071 ) ) ( not ( = ?auto_214077 ?auto_214078 ) ) ( not ( = ?auto_214073 ?auto_214072 ) ) ( not ( = ?auto_214073 ?auto_214074 ) ) ( not ( = ?auto_214073 ?auto_214075 ) ) ( not ( = ?auto_214073 ?auto_214071 ) ) ( not ( = ?auto_214073 ?auto_214078 ) ) ( ON ?auto_214076 ?auto_214073 ) ( ON ?auto_214072 ?auto_214076 ) ( ON ?auto_214078 ?auto_214072 ) ( ON ?auto_214071 ?auto_214078 ) ( CLEAR ?auto_214074 ) ( ON ?auto_214075 ?auto_214071 ) ( CLEAR ?auto_214075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214070 ?auto_214077 ?auto_214073 ?auto_214076 ?auto_214072 ?auto_214078 ?auto_214071 )
      ( MAKE-1PILE ?auto_214070 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214079 - BLOCK
    )
    :vars
    (
      ?auto_214085 - BLOCK
      ?auto_214083 - BLOCK
      ?auto_214087 - BLOCK
      ?auto_214084 - BLOCK
      ?auto_214082 - BLOCK
      ?auto_214080 - BLOCK
      ?auto_214086 - BLOCK
      ?auto_214081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214085 ?auto_214079 ) ( ON-TABLE ?auto_214079 ) ( not ( = ?auto_214079 ?auto_214085 ) ) ( not ( = ?auto_214079 ?auto_214083 ) ) ( not ( = ?auto_214079 ?auto_214087 ) ) ( not ( = ?auto_214085 ?auto_214083 ) ) ( not ( = ?auto_214085 ?auto_214087 ) ) ( not ( = ?auto_214083 ?auto_214087 ) ) ( ON ?auto_214083 ?auto_214085 ) ( not ( = ?auto_214084 ?auto_214082 ) ) ( not ( = ?auto_214084 ?auto_214080 ) ) ( not ( = ?auto_214084 ?auto_214086 ) ) ( not ( = ?auto_214084 ?auto_214081 ) ) ( not ( = ?auto_214084 ?auto_214087 ) ) ( not ( = ?auto_214082 ?auto_214080 ) ) ( not ( = ?auto_214082 ?auto_214086 ) ) ( not ( = ?auto_214082 ?auto_214081 ) ) ( not ( = ?auto_214082 ?auto_214087 ) ) ( not ( = ?auto_214080 ?auto_214086 ) ) ( not ( = ?auto_214080 ?auto_214081 ) ) ( not ( = ?auto_214080 ?auto_214087 ) ) ( not ( = ?auto_214086 ?auto_214081 ) ) ( not ( = ?auto_214086 ?auto_214087 ) ) ( not ( = ?auto_214081 ?auto_214087 ) ) ( not ( = ?auto_214079 ?auto_214081 ) ) ( not ( = ?auto_214079 ?auto_214084 ) ) ( not ( = ?auto_214079 ?auto_214082 ) ) ( not ( = ?auto_214079 ?auto_214080 ) ) ( not ( = ?auto_214079 ?auto_214086 ) ) ( not ( = ?auto_214085 ?auto_214081 ) ) ( not ( = ?auto_214085 ?auto_214084 ) ) ( not ( = ?auto_214085 ?auto_214082 ) ) ( not ( = ?auto_214085 ?auto_214080 ) ) ( not ( = ?auto_214085 ?auto_214086 ) ) ( not ( = ?auto_214083 ?auto_214081 ) ) ( not ( = ?auto_214083 ?auto_214084 ) ) ( not ( = ?auto_214083 ?auto_214082 ) ) ( not ( = ?auto_214083 ?auto_214080 ) ) ( not ( = ?auto_214083 ?auto_214086 ) ) ( ON ?auto_214087 ?auto_214083 ) ( ON ?auto_214081 ?auto_214087 ) ( ON ?auto_214086 ?auto_214081 ) ( ON ?auto_214080 ?auto_214086 ) ( ON ?auto_214082 ?auto_214080 ) ( CLEAR ?auto_214082 ) ( HOLDING ?auto_214084 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_214084 )
      ( MAKE-1PILE ?auto_214079 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214088 - BLOCK
    )
    :vars
    (
      ?auto_214091 - BLOCK
      ?auto_214090 - BLOCK
      ?auto_214096 - BLOCK
      ?auto_214095 - BLOCK
      ?auto_214094 - BLOCK
      ?auto_214089 - BLOCK
      ?auto_214092 - BLOCK
      ?auto_214093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214091 ?auto_214088 ) ( ON-TABLE ?auto_214088 ) ( not ( = ?auto_214088 ?auto_214091 ) ) ( not ( = ?auto_214088 ?auto_214090 ) ) ( not ( = ?auto_214088 ?auto_214096 ) ) ( not ( = ?auto_214091 ?auto_214090 ) ) ( not ( = ?auto_214091 ?auto_214096 ) ) ( not ( = ?auto_214090 ?auto_214096 ) ) ( ON ?auto_214090 ?auto_214091 ) ( not ( = ?auto_214095 ?auto_214094 ) ) ( not ( = ?auto_214095 ?auto_214089 ) ) ( not ( = ?auto_214095 ?auto_214092 ) ) ( not ( = ?auto_214095 ?auto_214093 ) ) ( not ( = ?auto_214095 ?auto_214096 ) ) ( not ( = ?auto_214094 ?auto_214089 ) ) ( not ( = ?auto_214094 ?auto_214092 ) ) ( not ( = ?auto_214094 ?auto_214093 ) ) ( not ( = ?auto_214094 ?auto_214096 ) ) ( not ( = ?auto_214089 ?auto_214092 ) ) ( not ( = ?auto_214089 ?auto_214093 ) ) ( not ( = ?auto_214089 ?auto_214096 ) ) ( not ( = ?auto_214092 ?auto_214093 ) ) ( not ( = ?auto_214092 ?auto_214096 ) ) ( not ( = ?auto_214093 ?auto_214096 ) ) ( not ( = ?auto_214088 ?auto_214093 ) ) ( not ( = ?auto_214088 ?auto_214095 ) ) ( not ( = ?auto_214088 ?auto_214094 ) ) ( not ( = ?auto_214088 ?auto_214089 ) ) ( not ( = ?auto_214088 ?auto_214092 ) ) ( not ( = ?auto_214091 ?auto_214093 ) ) ( not ( = ?auto_214091 ?auto_214095 ) ) ( not ( = ?auto_214091 ?auto_214094 ) ) ( not ( = ?auto_214091 ?auto_214089 ) ) ( not ( = ?auto_214091 ?auto_214092 ) ) ( not ( = ?auto_214090 ?auto_214093 ) ) ( not ( = ?auto_214090 ?auto_214095 ) ) ( not ( = ?auto_214090 ?auto_214094 ) ) ( not ( = ?auto_214090 ?auto_214089 ) ) ( not ( = ?auto_214090 ?auto_214092 ) ) ( ON ?auto_214096 ?auto_214090 ) ( ON ?auto_214093 ?auto_214096 ) ( ON ?auto_214092 ?auto_214093 ) ( ON ?auto_214089 ?auto_214092 ) ( ON ?auto_214094 ?auto_214089 ) ( ON ?auto_214095 ?auto_214094 ) ( CLEAR ?auto_214095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214088 ?auto_214091 ?auto_214090 ?auto_214096 ?auto_214093 ?auto_214092 ?auto_214089 ?auto_214094 )
      ( MAKE-1PILE ?auto_214088 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214105 - BLOCK
      ?auto_214106 - BLOCK
      ?auto_214107 - BLOCK
      ?auto_214108 - BLOCK
      ?auto_214109 - BLOCK
      ?auto_214110 - BLOCK
      ?auto_214111 - BLOCK
      ?auto_214112 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_214112 ) ( CLEAR ?auto_214111 ) ( ON-TABLE ?auto_214105 ) ( ON ?auto_214106 ?auto_214105 ) ( ON ?auto_214107 ?auto_214106 ) ( ON ?auto_214108 ?auto_214107 ) ( ON ?auto_214109 ?auto_214108 ) ( ON ?auto_214110 ?auto_214109 ) ( ON ?auto_214111 ?auto_214110 ) ( not ( = ?auto_214105 ?auto_214106 ) ) ( not ( = ?auto_214105 ?auto_214107 ) ) ( not ( = ?auto_214105 ?auto_214108 ) ) ( not ( = ?auto_214105 ?auto_214109 ) ) ( not ( = ?auto_214105 ?auto_214110 ) ) ( not ( = ?auto_214105 ?auto_214111 ) ) ( not ( = ?auto_214105 ?auto_214112 ) ) ( not ( = ?auto_214106 ?auto_214107 ) ) ( not ( = ?auto_214106 ?auto_214108 ) ) ( not ( = ?auto_214106 ?auto_214109 ) ) ( not ( = ?auto_214106 ?auto_214110 ) ) ( not ( = ?auto_214106 ?auto_214111 ) ) ( not ( = ?auto_214106 ?auto_214112 ) ) ( not ( = ?auto_214107 ?auto_214108 ) ) ( not ( = ?auto_214107 ?auto_214109 ) ) ( not ( = ?auto_214107 ?auto_214110 ) ) ( not ( = ?auto_214107 ?auto_214111 ) ) ( not ( = ?auto_214107 ?auto_214112 ) ) ( not ( = ?auto_214108 ?auto_214109 ) ) ( not ( = ?auto_214108 ?auto_214110 ) ) ( not ( = ?auto_214108 ?auto_214111 ) ) ( not ( = ?auto_214108 ?auto_214112 ) ) ( not ( = ?auto_214109 ?auto_214110 ) ) ( not ( = ?auto_214109 ?auto_214111 ) ) ( not ( = ?auto_214109 ?auto_214112 ) ) ( not ( = ?auto_214110 ?auto_214111 ) ) ( not ( = ?auto_214110 ?auto_214112 ) ) ( not ( = ?auto_214111 ?auto_214112 ) ) )
    :subtasks
    ( ( !STACK ?auto_214112 ?auto_214111 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214113 - BLOCK
      ?auto_214114 - BLOCK
      ?auto_214115 - BLOCK
      ?auto_214116 - BLOCK
      ?auto_214117 - BLOCK
      ?auto_214118 - BLOCK
      ?auto_214119 - BLOCK
      ?auto_214120 - BLOCK
    )
    :vars
    (
      ?auto_214121 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_214119 ) ( ON-TABLE ?auto_214113 ) ( ON ?auto_214114 ?auto_214113 ) ( ON ?auto_214115 ?auto_214114 ) ( ON ?auto_214116 ?auto_214115 ) ( ON ?auto_214117 ?auto_214116 ) ( ON ?auto_214118 ?auto_214117 ) ( ON ?auto_214119 ?auto_214118 ) ( not ( = ?auto_214113 ?auto_214114 ) ) ( not ( = ?auto_214113 ?auto_214115 ) ) ( not ( = ?auto_214113 ?auto_214116 ) ) ( not ( = ?auto_214113 ?auto_214117 ) ) ( not ( = ?auto_214113 ?auto_214118 ) ) ( not ( = ?auto_214113 ?auto_214119 ) ) ( not ( = ?auto_214113 ?auto_214120 ) ) ( not ( = ?auto_214114 ?auto_214115 ) ) ( not ( = ?auto_214114 ?auto_214116 ) ) ( not ( = ?auto_214114 ?auto_214117 ) ) ( not ( = ?auto_214114 ?auto_214118 ) ) ( not ( = ?auto_214114 ?auto_214119 ) ) ( not ( = ?auto_214114 ?auto_214120 ) ) ( not ( = ?auto_214115 ?auto_214116 ) ) ( not ( = ?auto_214115 ?auto_214117 ) ) ( not ( = ?auto_214115 ?auto_214118 ) ) ( not ( = ?auto_214115 ?auto_214119 ) ) ( not ( = ?auto_214115 ?auto_214120 ) ) ( not ( = ?auto_214116 ?auto_214117 ) ) ( not ( = ?auto_214116 ?auto_214118 ) ) ( not ( = ?auto_214116 ?auto_214119 ) ) ( not ( = ?auto_214116 ?auto_214120 ) ) ( not ( = ?auto_214117 ?auto_214118 ) ) ( not ( = ?auto_214117 ?auto_214119 ) ) ( not ( = ?auto_214117 ?auto_214120 ) ) ( not ( = ?auto_214118 ?auto_214119 ) ) ( not ( = ?auto_214118 ?auto_214120 ) ) ( not ( = ?auto_214119 ?auto_214120 ) ) ( ON ?auto_214120 ?auto_214121 ) ( CLEAR ?auto_214120 ) ( HAND-EMPTY ) ( not ( = ?auto_214113 ?auto_214121 ) ) ( not ( = ?auto_214114 ?auto_214121 ) ) ( not ( = ?auto_214115 ?auto_214121 ) ) ( not ( = ?auto_214116 ?auto_214121 ) ) ( not ( = ?auto_214117 ?auto_214121 ) ) ( not ( = ?auto_214118 ?auto_214121 ) ) ( not ( = ?auto_214119 ?auto_214121 ) ) ( not ( = ?auto_214120 ?auto_214121 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214120 ?auto_214121 )
      ( MAKE-8PILE ?auto_214113 ?auto_214114 ?auto_214115 ?auto_214116 ?auto_214117 ?auto_214118 ?auto_214119 ?auto_214120 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214122 - BLOCK
      ?auto_214123 - BLOCK
      ?auto_214124 - BLOCK
      ?auto_214125 - BLOCK
      ?auto_214126 - BLOCK
      ?auto_214127 - BLOCK
      ?auto_214128 - BLOCK
      ?auto_214129 - BLOCK
    )
    :vars
    (
      ?auto_214130 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214122 ) ( ON ?auto_214123 ?auto_214122 ) ( ON ?auto_214124 ?auto_214123 ) ( ON ?auto_214125 ?auto_214124 ) ( ON ?auto_214126 ?auto_214125 ) ( ON ?auto_214127 ?auto_214126 ) ( not ( = ?auto_214122 ?auto_214123 ) ) ( not ( = ?auto_214122 ?auto_214124 ) ) ( not ( = ?auto_214122 ?auto_214125 ) ) ( not ( = ?auto_214122 ?auto_214126 ) ) ( not ( = ?auto_214122 ?auto_214127 ) ) ( not ( = ?auto_214122 ?auto_214128 ) ) ( not ( = ?auto_214122 ?auto_214129 ) ) ( not ( = ?auto_214123 ?auto_214124 ) ) ( not ( = ?auto_214123 ?auto_214125 ) ) ( not ( = ?auto_214123 ?auto_214126 ) ) ( not ( = ?auto_214123 ?auto_214127 ) ) ( not ( = ?auto_214123 ?auto_214128 ) ) ( not ( = ?auto_214123 ?auto_214129 ) ) ( not ( = ?auto_214124 ?auto_214125 ) ) ( not ( = ?auto_214124 ?auto_214126 ) ) ( not ( = ?auto_214124 ?auto_214127 ) ) ( not ( = ?auto_214124 ?auto_214128 ) ) ( not ( = ?auto_214124 ?auto_214129 ) ) ( not ( = ?auto_214125 ?auto_214126 ) ) ( not ( = ?auto_214125 ?auto_214127 ) ) ( not ( = ?auto_214125 ?auto_214128 ) ) ( not ( = ?auto_214125 ?auto_214129 ) ) ( not ( = ?auto_214126 ?auto_214127 ) ) ( not ( = ?auto_214126 ?auto_214128 ) ) ( not ( = ?auto_214126 ?auto_214129 ) ) ( not ( = ?auto_214127 ?auto_214128 ) ) ( not ( = ?auto_214127 ?auto_214129 ) ) ( not ( = ?auto_214128 ?auto_214129 ) ) ( ON ?auto_214129 ?auto_214130 ) ( CLEAR ?auto_214129 ) ( not ( = ?auto_214122 ?auto_214130 ) ) ( not ( = ?auto_214123 ?auto_214130 ) ) ( not ( = ?auto_214124 ?auto_214130 ) ) ( not ( = ?auto_214125 ?auto_214130 ) ) ( not ( = ?auto_214126 ?auto_214130 ) ) ( not ( = ?auto_214127 ?auto_214130 ) ) ( not ( = ?auto_214128 ?auto_214130 ) ) ( not ( = ?auto_214129 ?auto_214130 ) ) ( HOLDING ?auto_214128 ) ( CLEAR ?auto_214127 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214122 ?auto_214123 ?auto_214124 ?auto_214125 ?auto_214126 ?auto_214127 ?auto_214128 )
      ( MAKE-8PILE ?auto_214122 ?auto_214123 ?auto_214124 ?auto_214125 ?auto_214126 ?auto_214127 ?auto_214128 ?auto_214129 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214131 - BLOCK
      ?auto_214132 - BLOCK
      ?auto_214133 - BLOCK
      ?auto_214134 - BLOCK
      ?auto_214135 - BLOCK
      ?auto_214136 - BLOCK
      ?auto_214137 - BLOCK
      ?auto_214138 - BLOCK
    )
    :vars
    (
      ?auto_214139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214131 ) ( ON ?auto_214132 ?auto_214131 ) ( ON ?auto_214133 ?auto_214132 ) ( ON ?auto_214134 ?auto_214133 ) ( ON ?auto_214135 ?auto_214134 ) ( ON ?auto_214136 ?auto_214135 ) ( not ( = ?auto_214131 ?auto_214132 ) ) ( not ( = ?auto_214131 ?auto_214133 ) ) ( not ( = ?auto_214131 ?auto_214134 ) ) ( not ( = ?auto_214131 ?auto_214135 ) ) ( not ( = ?auto_214131 ?auto_214136 ) ) ( not ( = ?auto_214131 ?auto_214137 ) ) ( not ( = ?auto_214131 ?auto_214138 ) ) ( not ( = ?auto_214132 ?auto_214133 ) ) ( not ( = ?auto_214132 ?auto_214134 ) ) ( not ( = ?auto_214132 ?auto_214135 ) ) ( not ( = ?auto_214132 ?auto_214136 ) ) ( not ( = ?auto_214132 ?auto_214137 ) ) ( not ( = ?auto_214132 ?auto_214138 ) ) ( not ( = ?auto_214133 ?auto_214134 ) ) ( not ( = ?auto_214133 ?auto_214135 ) ) ( not ( = ?auto_214133 ?auto_214136 ) ) ( not ( = ?auto_214133 ?auto_214137 ) ) ( not ( = ?auto_214133 ?auto_214138 ) ) ( not ( = ?auto_214134 ?auto_214135 ) ) ( not ( = ?auto_214134 ?auto_214136 ) ) ( not ( = ?auto_214134 ?auto_214137 ) ) ( not ( = ?auto_214134 ?auto_214138 ) ) ( not ( = ?auto_214135 ?auto_214136 ) ) ( not ( = ?auto_214135 ?auto_214137 ) ) ( not ( = ?auto_214135 ?auto_214138 ) ) ( not ( = ?auto_214136 ?auto_214137 ) ) ( not ( = ?auto_214136 ?auto_214138 ) ) ( not ( = ?auto_214137 ?auto_214138 ) ) ( ON ?auto_214138 ?auto_214139 ) ( not ( = ?auto_214131 ?auto_214139 ) ) ( not ( = ?auto_214132 ?auto_214139 ) ) ( not ( = ?auto_214133 ?auto_214139 ) ) ( not ( = ?auto_214134 ?auto_214139 ) ) ( not ( = ?auto_214135 ?auto_214139 ) ) ( not ( = ?auto_214136 ?auto_214139 ) ) ( not ( = ?auto_214137 ?auto_214139 ) ) ( not ( = ?auto_214138 ?auto_214139 ) ) ( CLEAR ?auto_214136 ) ( ON ?auto_214137 ?auto_214138 ) ( CLEAR ?auto_214137 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214139 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214139 ?auto_214138 )
      ( MAKE-8PILE ?auto_214131 ?auto_214132 ?auto_214133 ?auto_214134 ?auto_214135 ?auto_214136 ?auto_214137 ?auto_214138 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214140 - BLOCK
      ?auto_214141 - BLOCK
      ?auto_214142 - BLOCK
      ?auto_214143 - BLOCK
      ?auto_214144 - BLOCK
      ?auto_214145 - BLOCK
      ?auto_214146 - BLOCK
      ?auto_214147 - BLOCK
    )
    :vars
    (
      ?auto_214148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214140 ) ( ON ?auto_214141 ?auto_214140 ) ( ON ?auto_214142 ?auto_214141 ) ( ON ?auto_214143 ?auto_214142 ) ( ON ?auto_214144 ?auto_214143 ) ( not ( = ?auto_214140 ?auto_214141 ) ) ( not ( = ?auto_214140 ?auto_214142 ) ) ( not ( = ?auto_214140 ?auto_214143 ) ) ( not ( = ?auto_214140 ?auto_214144 ) ) ( not ( = ?auto_214140 ?auto_214145 ) ) ( not ( = ?auto_214140 ?auto_214146 ) ) ( not ( = ?auto_214140 ?auto_214147 ) ) ( not ( = ?auto_214141 ?auto_214142 ) ) ( not ( = ?auto_214141 ?auto_214143 ) ) ( not ( = ?auto_214141 ?auto_214144 ) ) ( not ( = ?auto_214141 ?auto_214145 ) ) ( not ( = ?auto_214141 ?auto_214146 ) ) ( not ( = ?auto_214141 ?auto_214147 ) ) ( not ( = ?auto_214142 ?auto_214143 ) ) ( not ( = ?auto_214142 ?auto_214144 ) ) ( not ( = ?auto_214142 ?auto_214145 ) ) ( not ( = ?auto_214142 ?auto_214146 ) ) ( not ( = ?auto_214142 ?auto_214147 ) ) ( not ( = ?auto_214143 ?auto_214144 ) ) ( not ( = ?auto_214143 ?auto_214145 ) ) ( not ( = ?auto_214143 ?auto_214146 ) ) ( not ( = ?auto_214143 ?auto_214147 ) ) ( not ( = ?auto_214144 ?auto_214145 ) ) ( not ( = ?auto_214144 ?auto_214146 ) ) ( not ( = ?auto_214144 ?auto_214147 ) ) ( not ( = ?auto_214145 ?auto_214146 ) ) ( not ( = ?auto_214145 ?auto_214147 ) ) ( not ( = ?auto_214146 ?auto_214147 ) ) ( ON ?auto_214147 ?auto_214148 ) ( not ( = ?auto_214140 ?auto_214148 ) ) ( not ( = ?auto_214141 ?auto_214148 ) ) ( not ( = ?auto_214142 ?auto_214148 ) ) ( not ( = ?auto_214143 ?auto_214148 ) ) ( not ( = ?auto_214144 ?auto_214148 ) ) ( not ( = ?auto_214145 ?auto_214148 ) ) ( not ( = ?auto_214146 ?auto_214148 ) ) ( not ( = ?auto_214147 ?auto_214148 ) ) ( ON ?auto_214146 ?auto_214147 ) ( CLEAR ?auto_214146 ) ( ON-TABLE ?auto_214148 ) ( HOLDING ?auto_214145 ) ( CLEAR ?auto_214144 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214140 ?auto_214141 ?auto_214142 ?auto_214143 ?auto_214144 ?auto_214145 )
      ( MAKE-8PILE ?auto_214140 ?auto_214141 ?auto_214142 ?auto_214143 ?auto_214144 ?auto_214145 ?auto_214146 ?auto_214147 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214149 - BLOCK
      ?auto_214150 - BLOCK
      ?auto_214151 - BLOCK
      ?auto_214152 - BLOCK
      ?auto_214153 - BLOCK
      ?auto_214154 - BLOCK
      ?auto_214155 - BLOCK
      ?auto_214156 - BLOCK
    )
    :vars
    (
      ?auto_214157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214149 ) ( ON ?auto_214150 ?auto_214149 ) ( ON ?auto_214151 ?auto_214150 ) ( ON ?auto_214152 ?auto_214151 ) ( ON ?auto_214153 ?auto_214152 ) ( not ( = ?auto_214149 ?auto_214150 ) ) ( not ( = ?auto_214149 ?auto_214151 ) ) ( not ( = ?auto_214149 ?auto_214152 ) ) ( not ( = ?auto_214149 ?auto_214153 ) ) ( not ( = ?auto_214149 ?auto_214154 ) ) ( not ( = ?auto_214149 ?auto_214155 ) ) ( not ( = ?auto_214149 ?auto_214156 ) ) ( not ( = ?auto_214150 ?auto_214151 ) ) ( not ( = ?auto_214150 ?auto_214152 ) ) ( not ( = ?auto_214150 ?auto_214153 ) ) ( not ( = ?auto_214150 ?auto_214154 ) ) ( not ( = ?auto_214150 ?auto_214155 ) ) ( not ( = ?auto_214150 ?auto_214156 ) ) ( not ( = ?auto_214151 ?auto_214152 ) ) ( not ( = ?auto_214151 ?auto_214153 ) ) ( not ( = ?auto_214151 ?auto_214154 ) ) ( not ( = ?auto_214151 ?auto_214155 ) ) ( not ( = ?auto_214151 ?auto_214156 ) ) ( not ( = ?auto_214152 ?auto_214153 ) ) ( not ( = ?auto_214152 ?auto_214154 ) ) ( not ( = ?auto_214152 ?auto_214155 ) ) ( not ( = ?auto_214152 ?auto_214156 ) ) ( not ( = ?auto_214153 ?auto_214154 ) ) ( not ( = ?auto_214153 ?auto_214155 ) ) ( not ( = ?auto_214153 ?auto_214156 ) ) ( not ( = ?auto_214154 ?auto_214155 ) ) ( not ( = ?auto_214154 ?auto_214156 ) ) ( not ( = ?auto_214155 ?auto_214156 ) ) ( ON ?auto_214156 ?auto_214157 ) ( not ( = ?auto_214149 ?auto_214157 ) ) ( not ( = ?auto_214150 ?auto_214157 ) ) ( not ( = ?auto_214151 ?auto_214157 ) ) ( not ( = ?auto_214152 ?auto_214157 ) ) ( not ( = ?auto_214153 ?auto_214157 ) ) ( not ( = ?auto_214154 ?auto_214157 ) ) ( not ( = ?auto_214155 ?auto_214157 ) ) ( not ( = ?auto_214156 ?auto_214157 ) ) ( ON ?auto_214155 ?auto_214156 ) ( ON-TABLE ?auto_214157 ) ( CLEAR ?auto_214153 ) ( ON ?auto_214154 ?auto_214155 ) ( CLEAR ?auto_214154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214157 ?auto_214156 ?auto_214155 )
      ( MAKE-8PILE ?auto_214149 ?auto_214150 ?auto_214151 ?auto_214152 ?auto_214153 ?auto_214154 ?auto_214155 ?auto_214156 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214158 - BLOCK
      ?auto_214159 - BLOCK
      ?auto_214160 - BLOCK
      ?auto_214161 - BLOCK
      ?auto_214162 - BLOCK
      ?auto_214163 - BLOCK
      ?auto_214164 - BLOCK
      ?auto_214165 - BLOCK
    )
    :vars
    (
      ?auto_214166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214158 ) ( ON ?auto_214159 ?auto_214158 ) ( ON ?auto_214160 ?auto_214159 ) ( ON ?auto_214161 ?auto_214160 ) ( not ( = ?auto_214158 ?auto_214159 ) ) ( not ( = ?auto_214158 ?auto_214160 ) ) ( not ( = ?auto_214158 ?auto_214161 ) ) ( not ( = ?auto_214158 ?auto_214162 ) ) ( not ( = ?auto_214158 ?auto_214163 ) ) ( not ( = ?auto_214158 ?auto_214164 ) ) ( not ( = ?auto_214158 ?auto_214165 ) ) ( not ( = ?auto_214159 ?auto_214160 ) ) ( not ( = ?auto_214159 ?auto_214161 ) ) ( not ( = ?auto_214159 ?auto_214162 ) ) ( not ( = ?auto_214159 ?auto_214163 ) ) ( not ( = ?auto_214159 ?auto_214164 ) ) ( not ( = ?auto_214159 ?auto_214165 ) ) ( not ( = ?auto_214160 ?auto_214161 ) ) ( not ( = ?auto_214160 ?auto_214162 ) ) ( not ( = ?auto_214160 ?auto_214163 ) ) ( not ( = ?auto_214160 ?auto_214164 ) ) ( not ( = ?auto_214160 ?auto_214165 ) ) ( not ( = ?auto_214161 ?auto_214162 ) ) ( not ( = ?auto_214161 ?auto_214163 ) ) ( not ( = ?auto_214161 ?auto_214164 ) ) ( not ( = ?auto_214161 ?auto_214165 ) ) ( not ( = ?auto_214162 ?auto_214163 ) ) ( not ( = ?auto_214162 ?auto_214164 ) ) ( not ( = ?auto_214162 ?auto_214165 ) ) ( not ( = ?auto_214163 ?auto_214164 ) ) ( not ( = ?auto_214163 ?auto_214165 ) ) ( not ( = ?auto_214164 ?auto_214165 ) ) ( ON ?auto_214165 ?auto_214166 ) ( not ( = ?auto_214158 ?auto_214166 ) ) ( not ( = ?auto_214159 ?auto_214166 ) ) ( not ( = ?auto_214160 ?auto_214166 ) ) ( not ( = ?auto_214161 ?auto_214166 ) ) ( not ( = ?auto_214162 ?auto_214166 ) ) ( not ( = ?auto_214163 ?auto_214166 ) ) ( not ( = ?auto_214164 ?auto_214166 ) ) ( not ( = ?auto_214165 ?auto_214166 ) ) ( ON ?auto_214164 ?auto_214165 ) ( ON-TABLE ?auto_214166 ) ( ON ?auto_214163 ?auto_214164 ) ( CLEAR ?auto_214163 ) ( HOLDING ?auto_214162 ) ( CLEAR ?auto_214161 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214158 ?auto_214159 ?auto_214160 ?auto_214161 ?auto_214162 )
      ( MAKE-8PILE ?auto_214158 ?auto_214159 ?auto_214160 ?auto_214161 ?auto_214162 ?auto_214163 ?auto_214164 ?auto_214165 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214167 - BLOCK
      ?auto_214168 - BLOCK
      ?auto_214169 - BLOCK
      ?auto_214170 - BLOCK
      ?auto_214171 - BLOCK
      ?auto_214172 - BLOCK
      ?auto_214173 - BLOCK
      ?auto_214174 - BLOCK
    )
    :vars
    (
      ?auto_214175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214167 ) ( ON ?auto_214168 ?auto_214167 ) ( ON ?auto_214169 ?auto_214168 ) ( ON ?auto_214170 ?auto_214169 ) ( not ( = ?auto_214167 ?auto_214168 ) ) ( not ( = ?auto_214167 ?auto_214169 ) ) ( not ( = ?auto_214167 ?auto_214170 ) ) ( not ( = ?auto_214167 ?auto_214171 ) ) ( not ( = ?auto_214167 ?auto_214172 ) ) ( not ( = ?auto_214167 ?auto_214173 ) ) ( not ( = ?auto_214167 ?auto_214174 ) ) ( not ( = ?auto_214168 ?auto_214169 ) ) ( not ( = ?auto_214168 ?auto_214170 ) ) ( not ( = ?auto_214168 ?auto_214171 ) ) ( not ( = ?auto_214168 ?auto_214172 ) ) ( not ( = ?auto_214168 ?auto_214173 ) ) ( not ( = ?auto_214168 ?auto_214174 ) ) ( not ( = ?auto_214169 ?auto_214170 ) ) ( not ( = ?auto_214169 ?auto_214171 ) ) ( not ( = ?auto_214169 ?auto_214172 ) ) ( not ( = ?auto_214169 ?auto_214173 ) ) ( not ( = ?auto_214169 ?auto_214174 ) ) ( not ( = ?auto_214170 ?auto_214171 ) ) ( not ( = ?auto_214170 ?auto_214172 ) ) ( not ( = ?auto_214170 ?auto_214173 ) ) ( not ( = ?auto_214170 ?auto_214174 ) ) ( not ( = ?auto_214171 ?auto_214172 ) ) ( not ( = ?auto_214171 ?auto_214173 ) ) ( not ( = ?auto_214171 ?auto_214174 ) ) ( not ( = ?auto_214172 ?auto_214173 ) ) ( not ( = ?auto_214172 ?auto_214174 ) ) ( not ( = ?auto_214173 ?auto_214174 ) ) ( ON ?auto_214174 ?auto_214175 ) ( not ( = ?auto_214167 ?auto_214175 ) ) ( not ( = ?auto_214168 ?auto_214175 ) ) ( not ( = ?auto_214169 ?auto_214175 ) ) ( not ( = ?auto_214170 ?auto_214175 ) ) ( not ( = ?auto_214171 ?auto_214175 ) ) ( not ( = ?auto_214172 ?auto_214175 ) ) ( not ( = ?auto_214173 ?auto_214175 ) ) ( not ( = ?auto_214174 ?auto_214175 ) ) ( ON ?auto_214173 ?auto_214174 ) ( ON-TABLE ?auto_214175 ) ( ON ?auto_214172 ?auto_214173 ) ( CLEAR ?auto_214170 ) ( ON ?auto_214171 ?auto_214172 ) ( CLEAR ?auto_214171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214175 ?auto_214174 ?auto_214173 ?auto_214172 )
      ( MAKE-8PILE ?auto_214167 ?auto_214168 ?auto_214169 ?auto_214170 ?auto_214171 ?auto_214172 ?auto_214173 ?auto_214174 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214176 - BLOCK
      ?auto_214177 - BLOCK
      ?auto_214178 - BLOCK
      ?auto_214179 - BLOCK
      ?auto_214180 - BLOCK
      ?auto_214181 - BLOCK
      ?auto_214182 - BLOCK
      ?auto_214183 - BLOCK
    )
    :vars
    (
      ?auto_214184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214176 ) ( ON ?auto_214177 ?auto_214176 ) ( ON ?auto_214178 ?auto_214177 ) ( not ( = ?auto_214176 ?auto_214177 ) ) ( not ( = ?auto_214176 ?auto_214178 ) ) ( not ( = ?auto_214176 ?auto_214179 ) ) ( not ( = ?auto_214176 ?auto_214180 ) ) ( not ( = ?auto_214176 ?auto_214181 ) ) ( not ( = ?auto_214176 ?auto_214182 ) ) ( not ( = ?auto_214176 ?auto_214183 ) ) ( not ( = ?auto_214177 ?auto_214178 ) ) ( not ( = ?auto_214177 ?auto_214179 ) ) ( not ( = ?auto_214177 ?auto_214180 ) ) ( not ( = ?auto_214177 ?auto_214181 ) ) ( not ( = ?auto_214177 ?auto_214182 ) ) ( not ( = ?auto_214177 ?auto_214183 ) ) ( not ( = ?auto_214178 ?auto_214179 ) ) ( not ( = ?auto_214178 ?auto_214180 ) ) ( not ( = ?auto_214178 ?auto_214181 ) ) ( not ( = ?auto_214178 ?auto_214182 ) ) ( not ( = ?auto_214178 ?auto_214183 ) ) ( not ( = ?auto_214179 ?auto_214180 ) ) ( not ( = ?auto_214179 ?auto_214181 ) ) ( not ( = ?auto_214179 ?auto_214182 ) ) ( not ( = ?auto_214179 ?auto_214183 ) ) ( not ( = ?auto_214180 ?auto_214181 ) ) ( not ( = ?auto_214180 ?auto_214182 ) ) ( not ( = ?auto_214180 ?auto_214183 ) ) ( not ( = ?auto_214181 ?auto_214182 ) ) ( not ( = ?auto_214181 ?auto_214183 ) ) ( not ( = ?auto_214182 ?auto_214183 ) ) ( ON ?auto_214183 ?auto_214184 ) ( not ( = ?auto_214176 ?auto_214184 ) ) ( not ( = ?auto_214177 ?auto_214184 ) ) ( not ( = ?auto_214178 ?auto_214184 ) ) ( not ( = ?auto_214179 ?auto_214184 ) ) ( not ( = ?auto_214180 ?auto_214184 ) ) ( not ( = ?auto_214181 ?auto_214184 ) ) ( not ( = ?auto_214182 ?auto_214184 ) ) ( not ( = ?auto_214183 ?auto_214184 ) ) ( ON ?auto_214182 ?auto_214183 ) ( ON-TABLE ?auto_214184 ) ( ON ?auto_214181 ?auto_214182 ) ( ON ?auto_214180 ?auto_214181 ) ( CLEAR ?auto_214180 ) ( HOLDING ?auto_214179 ) ( CLEAR ?auto_214178 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214176 ?auto_214177 ?auto_214178 ?auto_214179 )
      ( MAKE-8PILE ?auto_214176 ?auto_214177 ?auto_214178 ?auto_214179 ?auto_214180 ?auto_214181 ?auto_214182 ?auto_214183 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214185 - BLOCK
      ?auto_214186 - BLOCK
      ?auto_214187 - BLOCK
      ?auto_214188 - BLOCK
      ?auto_214189 - BLOCK
      ?auto_214190 - BLOCK
      ?auto_214191 - BLOCK
      ?auto_214192 - BLOCK
    )
    :vars
    (
      ?auto_214193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214185 ) ( ON ?auto_214186 ?auto_214185 ) ( ON ?auto_214187 ?auto_214186 ) ( not ( = ?auto_214185 ?auto_214186 ) ) ( not ( = ?auto_214185 ?auto_214187 ) ) ( not ( = ?auto_214185 ?auto_214188 ) ) ( not ( = ?auto_214185 ?auto_214189 ) ) ( not ( = ?auto_214185 ?auto_214190 ) ) ( not ( = ?auto_214185 ?auto_214191 ) ) ( not ( = ?auto_214185 ?auto_214192 ) ) ( not ( = ?auto_214186 ?auto_214187 ) ) ( not ( = ?auto_214186 ?auto_214188 ) ) ( not ( = ?auto_214186 ?auto_214189 ) ) ( not ( = ?auto_214186 ?auto_214190 ) ) ( not ( = ?auto_214186 ?auto_214191 ) ) ( not ( = ?auto_214186 ?auto_214192 ) ) ( not ( = ?auto_214187 ?auto_214188 ) ) ( not ( = ?auto_214187 ?auto_214189 ) ) ( not ( = ?auto_214187 ?auto_214190 ) ) ( not ( = ?auto_214187 ?auto_214191 ) ) ( not ( = ?auto_214187 ?auto_214192 ) ) ( not ( = ?auto_214188 ?auto_214189 ) ) ( not ( = ?auto_214188 ?auto_214190 ) ) ( not ( = ?auto_214188 ?auto_214191 ) ) ( not ( = ?auto_214188 ?auto_214192 ) ) ( not ( = ?auto_214189 ?auto_214190 ) ) ( not ( = ?auto_214189 ?auto_214191 ) ) ( not ( = ?auto_214189 ?auto_214192 ) ) ( not ( = ?auto_214190 ?auto_214191 ) ) ( not ( = ?auto_214190 ?auto_214192 ) ) ( not ( = ?auto_214191 ?auto_214192 ) ) ( ON ?auto_214192 ?auto_214193 ) ( not ( = ?auto_214185 ?auto_214193 ) ) ( not ( = ?auto_214186 ?auto_214193 ) ) ( not ( = ?auto_214187 ?auto_214193 ) ) ( not ( = ?auto_214188 ?auto_214193 ) ) ( not ( = ?auto_214189 ?auto_214193 ) ) ( not ( = ?auto_214190 ?auto_214193 ) ) ( not ( = ?auto_214191 ?auto_214193 ) ) ( not ( = ?auto_214192 ?auto_214193 ) ) ( ON ?auto_214191 ?auto_214192 ) ( ON-TABLE ?auto_214193 ) ( ON ?auto_214190 ?auto_214191 ) ( ON ?auto_214189 ?auto_214190 ) ( CLEAR ?auto_214187 ) ( ON ?auto_214188 ?auto_214189 ) ( CLEAR ?auto_214188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214193 ?auto_214192 ?auto_214191 ?auto_214190 ?auto_214189 )
      ( MAKE-8PILE ?auto_214185 ?auto_214186 ?auto_214187 ?auto_214188 ?auto_214189 ?auto_214190 ?auto_214191 ?auto_214192 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214194 - BLOCK
      ?auto_214195 - BLOCK
      ?auto_214196 - BLOCK
      ?auto_214197 - BLOCK
      ?auto_214198 - BLOCK
      ?auto_214199 - BLOCK
      ?auto_214200 - BLOCK
      ?auto_214201 - BLOCK
    )
    :vars
    (
      ?auto_214202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214194 ) ( ON ?auto_214195 ?auto_214194 ) ( not ( = ?auto_214194 ?auto_214195 ) ) ( not ( = ?auto_214194 ?auto_214196 ) ) ( not ( = ?auto_214194 ?auto_214197 ) ) ( not ( = ?auto_214194 ?auto_214198 ) ) ( not ( = ?auto_214194 ?auto_214199 ) ) ( not ( = ?auto_214194 ?auto_214200 ) ) ( not ( = ?auto_214194 ?auto_214201 ) ) ( not ( = ?auto_214195 ?auto_214196 ) ) ( not ( = ?auto_214195 ?auto_214197 ) ) ( not ( = ?auto_214195 ?auto_214198 ) ) ( not ( = ?auto_214195 ?auto_214199 ) ) ( not ( = ?auto_214195 ?auto_214200 ) ) ( not ( = ?auto_214195 ?auto_214201 ) ) ( not ( = ?auto_214196 ?auto_214197 ) ) ( not ( = ?auto_214196 ?auto_214198 ) ) ( not ( = ?auto_214196 ?auto_214199 ) ) ( not ( = ?auto_214196 ?auto_214200 ) ) ( not ( = ?auto_214196 ?auto_214201 ) ) ( not ( = ?auto_214197 ?auto_214198 ) ) ( not ( = ?auto_214197 ?auto_214199 ) ) ( not ( = ?auto_214197 ?auto_214200 ) ) ( not ( = ?auto_214197 ?auto_214201 ) ) ( not ( = ?auto_214198 ?auto_214199 ) ) ( not ( = ?auto_214198 ?auto_214200 ) ) ( not ( = ?auto_214198 ?auto_214201 ) ) ( not ( = ?auto_214199 ?auto_214200 ) ) ( not ( = ?auto_214199 ?auto_214201 ) ) ( not ( = ?auto_214200 ?auto_214201 ) ) ( ON ?auto_214201 ?auto_214202 ) ( not ( = ?auto_214194 ?auto_214202 ) ) ( not ( = ?auto_214195 ?auto_214202 ) ) ( not ( = ?auto_214196 ?auto_214202 ) ) ( not ( = ?auto_214197 ?auto_214202 ) ) ( not ( = ?auto_214198 ?auto_214202 ) ) ( not ( = ?auto_214199 ?auto_214202 ) ) ( not ( = ?auto_214200 ?auto_214202 ) ) ( not ( = ?auto_214201 ?auto_214202 ) ) ( ON ?auto_214200 ?auto_214201 ) ( ON-TABLE ?auto_214202 ) ( ON ?auto_214199 ?auto_214200 ) ( ON ?auto_214198 ?auto_214199 ) ( ON ?auto_214197 ?auto_214198 ) ( CLEAR ?auto_214197 ) ( HOLDING ?auto_214196 ) ( CLEAR ?auto_214195 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214194 ?auto_214195 ?auto_214196 )
      ( MAKE-8PILE ?auto_214194 ?auto_214195 ?auto_214196 ?auto_214197 ?auto_214198 ?auto_214199 ?auto_214200 ?auto_214201 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214203 - BLOCK
      ?auto_214204 - BLOCK
      ?auto_214205 - BLOCK
      ?auto_214206 - BLOCK
      ?auto_214207 - BLOCK
      ?auto_214208 - BLOCK
      ?auto_214209 - BLOCK
      ?auto_214210 - BLOCK
    )
    :vars
    (
      ?auto_214211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214203 ) ( ON ?auto_214204 ?auto_214203 ) ( not ( = ?auto_214203 ?auto_214204 ) ) ( not ( = ?auto_214203 ?auto_214205 ) ) ( not ( = ?auto_214203 ?auto_214206 ) ) ( not ( = ?auto_214203 ?auto_214207 ) ) ( not ( = ?auto_214203 ?auto_214208 ) ) ( not ( = ?auto_214203 ?auto_214209 ) ) ( not ( = ?auto_214203 ?auto_214210 ) ) ( not ( = ?auto_214204 ?auto_214205 ) ) ( not ( = ?auto_214204 ?auto_214206 ) ) ( not ( = ?auto_214204 ?auto_214207 ) ) ( not ( = ?auto_214204 ?auto_214208 ) ) ( not ( = ?auto_214204 ?auto_214209 ) ) ( not ( = ?auto_214204 ?auto_214210 ) ) ( not ( = ?auto_214205 ?auto_214206 ) ) ( not ( = ?auto_214205 ?auto_214207 ) ) ( not ( = ?auto_214205 ?auto_214208 ) ) ( not ( = ?auto_214205 ?auto_214209 ) ) ( not ( = ?auto_214205 ?auto_214210 ) ) ( not ( = ?auto_214206 ?auto_214207 ) ) ( not ( = ?auto_214206 ?auto_214208 ) ) ( not ( = ?auto_214206 ?auto_214209 ) ) ( not ( = ?auto_214206 ?auto_214210 ) ) ( not ( = ?auto_214207 ?auto_214208 ) ) ( not ( = ?auto_214207 ?auto_214209 ) ) ( not ( = ?auto_214207 ?auto_214210 ) ) ( not ( = ?auto_214208 ?auto_214209 ) ) ( not ( = ?auto_214208 ?auto_214210 ) ) ( not ( = ?auto_214209 ?auto_214210 ) ) ( ON ?auto_214210 ?auto_214211 ) ( not ( = ?auto_214203 ?auto_214211 ) ) ( not ( = ?auto_214204 ?auto_214211 ) ) ( not ( = ?auto_214205 ?auto_214211 ) ) ( not ( = ?auto_214206 ?auto_214211 ) ) ( not ( = ?auto_214207 ?auto_214211 ) ) ( not ( = ?auto_214208 ?auto_214211 ) ) ( not ( = ?auto_214209 ?auto_214211 ) ) ( not ( = ?auto_214210 ?auto_214211 ) ) ( ON ?auto_214209 ?auto_214210 ) ( ON-TABLE ?auto_214211 ) ( ON ?auto_214208 ?auto_214209 ) ( ON ?auto_214207 ?auto_214208 ) ( ON ?auto_214206 ?auto_214207 ) ( CLEAR ?auto_214204 ) ( ON ?auto_214205 ?auto_214206 ) ( CLEAR ?auto_214205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214211 ?auto_214210 ?auto_214209 ?auto_214208 ?auto_214207 ?auto_214206 )
      ( MAKE-8PILE ?auto_214203 ?auto_214204 ?auto_214205 ?auto_214206 ?auto_214207 ?auto_214208 ?auto_214209 ?auto_214210 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214212 - BLOCK
      ?auto_214213 - BLOCK
      ?auto_214214 - BLOCK
      ?auto_214215 - BLOCK
      ?auto_214216 - BLOCK
      ?auto_214217 - BLOCK
      ?auto_214218 - BLOCK
      ?auto_214219 - BLOCK
    )
    :vars
    (
      ?auto_214220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214212 ) ( not ( = ?auto_214212 ?auto_214213 ) ) ( not ( = ?auto_214212 ?auto_214214 ) ) ( not ( = ?auto_214212 ?auto_214215 ) ) ( not ( = ?auto_214212 ?auto_214216 ) ) ( not ( = ?auto_214212 ?auto_214217 ) ) ( not ( = ?auto_214212 ?auto_214218 ) ) ( not ( = ?auto_214212 ?auto_214219 ) ) ( not ( = ?auto_214213 ?auto_214214 ) ) ( not ( = ?auto_214213 ?auto_214215 ) ) ( not ( = ?auto_214213 ?auto_214216 ) ) ( not ( = ?auto_214213 ?auto_214217 ) ) ( not ( = ?auto_214213 ?auto_214218 ) ) ( not ( = ?auto_214213 ?auto_214219 ) ) ( not ( = ?auto_214214 ?auto_214215 ) ) ( not ( = ?auto_214214 ?auto_214216 ) ) ( not ( = ?auto_214214 ?auto_214217 ) ) ( not ( = ?auto_214214 ?auto_214218 ) ) ( not ( = ?auto_214214 ?auto_214219 ) ) ( not ( = ?auto_214215 ?auto_214216 ) ) ( not ( = ?auto_214215 ?auto_214217 ) ) ( not ( = ?auto_214215 ?auto_214218 ) ) ( not ( = ?auto_214215 ?auto_214219 ) ) ( not ( = ?auto_214216 ?auto_214217 ) ) ( not ( = ?auto_214216 ?auto_214218 ) ) ( not ( = ?auto_214216 ?auto_214219 ) ) ( not ( = ?auto_214217 ?auto_214218 ) ) ( not ( = ?auto_214217 ?auto_214219 ) ) ( not ( = ?auto_214218 ?auto_214219 ) ) ( ON ?auto_214219 ?auto_214220 ) ( not ( = ?auto_214212 ?auto_214220 ) ) ( not ( = ?auto_214213 ?auto_214220 ) ) ( not ( = ?auto_214214 ?auto_214220 ) ) ( not ( = ?auto_214215 ?auto_214220 ) ) ( not ( = ?auto_214216 ?auto_214220 ) ) ( not ( = ?auto_214217 ?auto_214220 ) ) ( not ( = ?auto_214218 ?auto_214220 ) ) ( not ( = ?auto_214219 ?auto_214220 ) ) ( ON ?auto_214218 ?auto_214219 ) ( ON-TABLE ?auto_214220 ) ( ON ?auto_214217 ?auto_214218 ) ( ON ?auto_214216 ?auto_214217 ) ( ON ?auto_214215 ?auto_214216 ) ( ON ?auto_214214 ?auto_214215 ) ( CLEAR ?auto_214214 ) ( HOLDING ?auto_214213 ) ( CLEAR ?auto_214212 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214212 ?auto_214213 )
      ( MAKE-8PILE ?auto_214212 ?auto_214213 ?auto_214214 ?auto_214215 ?auto_214216 ?auto_214217 ?auto_214218 ?auto_214219 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214221 - BLOCK
      ?auto_214222 - BLOCK
      ?auto_214223 - BLOCK
      ?auto_214224 - BLOCK
      ?auto_214225 - BLOCK
      ?auto_214226 - BLOCK
      ?auto_214227 - BLOCK
      ?auto_214228 - BLOCK
    )
    :vars
    (
      ?auto_214229 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214221 ) ( not ( = ?auto_214221 ?auto_214222 ) ) ( not ( = ?auto_214221 ?auto_214223 ) ) ( not ( = ?auto_214221 ?auto_214224 ) ) ( not ( = ?auto_214221 ?auto_214225 ) ) ( not ( = ?auto_214221 ?auto_214226 ) ) ( not ( = ?auto_214221 ?auto_214227 ) ) ( not ( = ?auto_214221 ?auto_214228 ) ) ( not ( = ?auto_214222 ?auto_214223 ) ) ( not ( = ?auto_214222 ?auto_214224 ) ) ( not ( = ?auto_214222 ?auto_214225 ) ) ( not ( = ?auto_214222 ?auto_214226 ) ) ( not ( = ?auto_214222 ?auto_214227 ) ) ( not ( = ?auto_214222 ?auto_214228 ) ) ( not ( = ?auto_214223 ?auto_214224 ) ) ( not ( = ?auto_214223 ?auto_214225 ) ) ( not ( = ?auto_214223 ?auto_214226 ) ) ( not ( = ?auto_214223 ?auto_214227 ) ) ( not ( = ?auto_214223 ?auto_214228 ) ) ( not ( = ?auto_214224 ?auto_214225 ) ) ( not ( = ?auto_214224 ?auto_214226 ) ) ( not ( = ?auto_214224 ?auto_214227 ) ) ( not ( = ?auto_214224 ?auto_214228 ) ) ( not ( = ?auto_214225 ?auto_214226 ) ) ( not ( = ?auto_214225 ?auto_214227 ) ) ( not ( = ?auto_214225 ?auto_214228 ) ) ( not ( = ?auto_214226 ?auto_214227 ) ) ( not ( = ?auto_214226 ?auto_214228 ) ) ( not ( = ?auto_214227 ?auto_214228 ) ) ( ON ?auto_214228 ?auto_214229 ) ( not ( = ?auto_214221 ?auto_214229 ) ) ( not ( = ?auto_214222 ?auto_214229 ) ) ( not ( = ?auto_214223 ?auto_214229 ) ) ( not ( = ?auto_214224 ?auto_214229 ) ) ( not ( = ?auto_214225 ?auto_214229 ) ) ( not ( = ?auto_214226 ?auto_214229 ) ) ( not ( = ?auto_214227 ?auto_214229 ) ) ( not ( = ?auto_214228 ?auto_214229 ) ) ( ON ?auto_214227 ?auto_214228 ) ( ON-TABLE ?auto_214229 ) ( ON ?auto_214226 ?auto_214227 ) ( ON ?auto_214225 ?auto_214226 ) ( ON ?auto_214224 ?auto_214225 ) ( ON ?auto_214223 ?auto_214224 ) ( CLEAR ?auto_214221 ) ( ON ?auto_214222 ?auto_214223 ) ( CLEAR ?auto_214222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214229 ?auto_214228 ?auto_214227 ?auto_214226 ?auto_214225 ?auto_214224 ?auto_214223 )
      ( MAKE-8PILE ?auto_214221 ?auto_214222 ?auto_214223 ?auto_214224 ?auto_214225 ?auto_214226 ?auto_214227 ?auto_214228 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214230 - BLOCK
      ?auto_214231 - BLOCK
      ?auto_214232 - BLOCK
      ?auto_214233 - BLOCK
      ?auto_214234 - BLOCK
      ?auto_214235 - BLOCK
      ?auto_214236 - BLOCK
      ?auto_214237 - BLOCK
    )
    :vars
    (
      ?auto_214238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214230 ?auto_214231 ) ) ( not ( = ?auto_214230 ?auto_214232 ) ) ( not ( = ?auto_214230 ?auto_214233 ) ) ( not ( = ?auto_214230 ?auto_214234 ) ) ( not ( = ?auto_214230 ?auto_214235 ) ) ( not ( = ?auto_214230 ?auto_214236 ) ) ( not ( = ?auto_214230 ?auto_214237 ) ) ( not ( = ?auto_214231 ?auto_214232 ) ) ( not ( = ?auto_214231 ?auto_214233 ) ) ( not ( = ?auto_214231 ?auto_214234 ) ) ( not ( = ?auto_214231 ?auto_214235 ) ) ( not ( = ?auto_214231 ?auto_214236 ) ) ( not ( = ?auto_214231 ?auto_214237 ) ) ( not ( = ?auto_214232 ?auto_214233 ) ) ( not ( = ?auto_214232 ?auto_214234 ) ) ( not ( = ?auto_214232 ?auto_214235 ) ) ( not ( = ?auto_214232 ?auto_214236 ) ) ( not ( = ?auto_214232 ?auto_214237 ) ) ( not ( = ?auto_214233 ?auto_214234 ) ) ( not ( = ?auto_214233 ?auto_214235 ) ) ( not ( = ?auto_214233 ?auto_214236 ) ) ( not ( = ?auto_214233 ?auto_214237 ) ) ( not ( = ?auto_214234 ?auto_214235 ) ) ( not ( = ?auto_214234 ?auto_214236 ) ) ( not ( = ?auto_214234 ?auto_214237 ) ) ( not ( = ?auto_214235 ?auto_214236 ) ) ( not ( = ?auto_214235 ?auto_214237 ) ) ( not ( = ?auto_214236 ?auto_214237 ) ) ( ON ?auto_214237 ?auto_214238 ) ( not ( = ?auto_214230 ?auto_214238 ) ) ( not ( = ?auto_214231 ?auto_214238 ) ) ( not ( = ?auto_214232 ?auto_214238 ) ) ( not ( = ?auto_214233 ?auto_214238 ) ) ( not ( = ?auto_214234 ?auto_214238 ) ) ( not ( = ?auto_214235 ?auto_214238 ) ) ( not ( = ?auto_214236 ?auto_214238 ) ) ( not ( = ?auto_214237 ?auto_214238 ) ) ( ON ?auto_214236 ?auto_214237 ) ( ON-TABLE ?auto_214238 ) ( ON ?auto_214235 ?auto_214236 ) ( ON ?auto_214234 ?auto_214235 ) ( ON ?auto_214233 ?auto_214234 ) ( ON ?auto_214232 ?auto_214233 ) ( ON ?auto_214231 ?auto_214232 ) ( CLEAR ?auto_214231 ) ( HOLDING ?auto_214230 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_214230 )
      ( MAKE-8PILE ?auto_214230 ?auto_214231 ?auto_214232 ?auto_214233 ?auto_214234 ?auto_214235 ?auto_214236 ?auto_214237 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_214239 - BLOCK
      ?auto_214240 - BLOCK
      ?auto_214241 - BLOCK
      ?auto_214242 - BLOCK
      ?auto_214243 - BLOCK
      ?auto_214244 - BLOCK
      ?auto_214245 - BLOCK
      ?auto_214246 - BLOCK
    )
    :vars
    (
      ?auto_214247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214239 ?auto_214240 ) ) ( not ( = ?auto_214239 ?auto_214241 ) ) ( not ( = ?auto_214239 ?auto_214242 ) ) ( not ( = ?auto_214239 ?auto_214243 ) ) ( not ( = ?auto_214239 ?auto_214244 ) ) ( not ( = ?auto_214239 ?auto_214245 ) ) ( not ( = ?auto_214239 ?auto_214246 ) ) ( not ( = ?auto_214240 ?auto_214241 ) ) ( not ( = ?auto_214240 ?auto_214242 ) ) ( not ( = ?auto_214240 ?auto_214243 ) ) ( not ( = ?auto_214240 ?auto_214244 ) ) ( not ( = ?auto_214240 ?auto_214245 ) ) ( not ( = ?auto_214240 ?auto_214246 ) ) ( not ( = ?auto_214241 ?auto_214242 ) ) ( not ( = ?auto_214241 ?auto_214243 ) ) ( not ( = ?auto_214241 ?auto_214244 ) ) ( not ( = ?auto_214241 ?auto_214245 ) ) ( not ( = ?auto_214241 ?auto_214246 ) ) ( not ( = ?auto_214242 ?auto_214243 ) ) ( not ( = ?auto_214242 ?auto_214244 ) ) ( not ( = ?auto_214242 ?auto_214245 ) ) ( not ( = ?auto_214242 ?auto_214246 ) ) ( not ( = ?auto_214243 ?auto_214244 ) ) ( not ( = ?auto_214243 ?auto_214245 ) ) ( not ( = ?auto_214243 ?auto_214246 ) ) ( not ( = ?auto_214244 ?auto_214245 ) ) ( not ( = ?auto_214244 ?auto_214246 ) ) ( not ( = ?auto_214245 ?auto_214246 ) ) ( ON ?auto_214246 ?auto_214247 ) ( not ( = ?auto_214239 ?auto_214247 ) ) ( not ( = ?auto_214240 ?auto_214247 ) ) ( not ( = ?auto_214241 ?auto_214247 ) ) ( not ( = ?auto_214242 ?auto_214247 ) ) ( not ( = ?auto_214243 ?auto_214247 ) ) ( not ( = ?auto_214244 ?auto_214247 ) ) ( not ( = ?auto_214245 ?auto_214247 ) ) ( not ( = ?auto_214246 ?auto_214247 ) ) ( ON ?auto_214245 ?auto_214246 ) ( ON-TABLE ?auto_214247 ) ( ON ?auto_214244 ?auto_214245 ) ( ON ?auto_214243 ?auto_214244 ) ( ON ?auto_214242 ?auto_214243 ) ( ON ?auto_214241 ?auto_214242 ) ( ON ?auto_214240 ?auto_214241 ) ( ON ?auto_214239 ?auto_214240 ) ( CLEAR ?auto_214239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214247 ?auto_214246 ?auto_214245 ?auto_214244 ?auto_214243 ?auto_214242 ?auto_214241 ?auto_214240 )
      ( MAKE-8PILE ?auto_214239 ?auto_214240 ?auto_214241 ?auto_214242 ?auto_214243 ?auto_214244 ?auto_214245 ?auto_214246 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214255 - BLOCK
      ?auto_214256 - BLOCK
      ?auto_214257 - BLOCK
      ?auto_214258 - BLOCK
      ?auto_214259 - BLOCK
      ?auto_214260 - BLOCK
      ?auto_214261 - BLOCK
    )
    :vars
    (
      ?auto_214262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214262 ?auto_214261 ) ( CLEAR ?auto_214262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214255 ) ( ON ?auto_214256 ?auto_214255 ) ( ON ?auto_214257 ?auto_214256 ) ( ON ?auto_214258 ?auto_214257 ) ( ON ?auto_214259 ?auto_214258 ) ( ON ?auto_214260 ?auto_214259 ) ( ON ?auto_214261 ?auto_214260 ) ( not ( = ?auto_214255 ?auto_214256 ) ) ( not ( = ?auto_214255 ?auto_214257 ) ) ( not ( = ?auto_214255 ?auto_214258 ) ) ( not ( = ?auto_214255 ?auto_214259 ) ) ( not ( = ?auto_214255 ?auto_214260 ) ) ( not ( = ?auto_214255 ?auto_214261 ) ) ( not ( = ?auto_214255 ?auto_214262 ) ) ( not ( = ?auto_214256 ?auto_214257 ) ) ( not ( = ?auto_214256 ?auto_214258 ) ) ( not ( = ?auto_214256 ?auto_214259 ) ) ( not ( = ?auto_214256 ?auto_214260 ) ) ( not ( = ?auto_214256 ?auto_214261 ) ) ( not ( = ?auto_214256 ?auto_214262 ) ) ( not ( = ?auto_214257 ?auto_214258 ) ) ( not ( = ?auto_214257 ?auto_214259 ) ) ( not ( = ?auto_214257 ?auto_214260 ) ) ( not ( = ?auto_214257 ?auto_214261 ) ) ( not ( = ?auto_214257 ?auto_214262 ) ) ( not ( = ?auto_214258 ?auto_214259 ) ) ( not ( = ?auto_214258 ?auto_214260 ) ) ( not ( = ?auto_214258 ?auto_214261 ) ) ( not ( = ?auto_214258 ?auto_214262 ) ) ( not ( = ?auto_214259 ?auto_214260 ) ) ( not ( = ?auto_214259 ?auto_214261 ) ) ( not ( = ?auto_214259 ?auto_214262 ) ) ( not ( = ?auto_214260 ?auto_214261 ) ) ( not ( = ?auto_214260 ?auto_214262 ) ) ( not ( = ?auto_214261 ?auto_214262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214262 ?auto_214261 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214280 - BLOCK
      ?auto_214281 - BLOCK
      ?auto_214282 - BLOCK
      ?auto_214283 - BLOCK
      ?auto_214284 - BLOCK
      ?auto_214285 - BLOCK
      ?auto_214286 - BLOCK
    )
    :vars
    (
      ?auto_214287 - BLOCK
      ?auto_214288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214280 ) ( ON ?auto_214281 ?auto_214280 ) ( ON ?auto_214282 ?auto_214281 ) ( ON ?auto_214283 ?auto_214282 ) ( ON ?auto_214284 ?auto_214283 ) ( ON ?auto_214285 ?auto_214284 ) ( not ( = ?auto_214280 ?auto_214281 ) ) ( not ( = ?auto_214280 ?auto_214282 ) ) ( not ( = ?auto_214280 ?auto_214283 ) ) ( not ( = ?auto_214280 ?auto_214284 ) ) ( not ( = ?auto_214280 ?auto_214285 ) ) ( not ( = ?auto_214280 ?auto_214286 ) ) ( not ( = ?auto_214280 ?auto_214287 ) ) ( not ( = ?auto_214281 ?auto_214282 ) ) ( not ( = ?auto_214281 ?auto_214283 ) ) ( not ( = ?auto_214281 ?auto_214284 ) ) ( not ( = ?auto_214281 ?auto_214285 ) ) ( not ( = ?auto_214281 ?auto_214286 ) ) ( not ( = ?auto_214281 ?auto_214287 ) ) ( not ( = ?auto_214282 ?auto_214283 ) ) ( not ( = ?auto_214282 ?auto_214284 ) ) ( not ( = ?auto_214282 ?auto_214285 ) ) ( not ( = ?auto_214282 ?auto_214286 ) ) ( not ( = ?auto_214282 ?auto_214287 ) ) ( not ( = ?auto_214283 ?auto_214284 ) ) ( not ( = ?auto_214283 ?auto_214285 ) ) ( not ( = ?auto_214283 ?auto_214286 ) ) ( not ( = ?auto_214283 ?auto_214287 ) ) ( not ( = ?auto_214284 ?auto_214285 ) ) ( not ( = ?auto_214284 ?auto_214286 ) ) ( not ( = ?auto_214284 ?auto_214287 ) ) ( not ( = ?auto_214285 ?auto_214286 ) ) ( not ( = ?auto_214285 ?auto_214287 ) ) ( not ( = ?auto_214286 ?auto_214287 ) ) ( ON ?auto_214287 ?auto_214288 ) ( CLEAR ?auto_214287 ) ( not ( = ?auto_214280 ?auto_214288 ) ) ( not ( = ?auto_214281 ?auto_214288 ) ) ( not ( = ?auto_214282 ?auto_214288 ) ) ( not ( = ?auto_214283 ?auto_214288 ) ) ( not ( = ?auto_214284 ?auto_214288 ) ) ( not ( = ?auto_214285 ?auto_214288 ) ) ( not ( = ?auto_214286 ?auto_214288 ) ) ( not ( = ?auto_214287 ?auto_214288 ) ) ( HOLDING ?auto_214286 ) ( CLEAR ?auto_214285 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214280 ?auto_214281 ?auto_214282 ?auto_214283 ?auto_214284 ?auto_214285 ?auto_214286 ?auto_214287 )
      ( MAKE-7PILE ?auto_214280 ?auto_214281 ?auto_214282 ?auto_214283 ?auto_214284 ?auto_214285 ?auto_214286 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214289 - BLOCK
      ?auto_214290 - BLOCK
      ?auto_214291 - BLOCK
      ?auto_214292 - BLOCK
      ?auto_214293 - BLOCK
      ?auto_214294 - BLOCK
      ?auto_214295 - BLOCK
    )
    :vars
    (
      ?auto_214296 - BLOCK
      ?auto_214297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214289 ) ( ON ?auto_214290 ?auto_214289 ) ( ON ?auto_214291 ?auto_214290 ) ( ON ?auto_214292 ?auto_214291 ) ( ON ?auto_214293 ?auto_214292 ) ( ON ?auto_214294 ?auto_214293 ) ( not ( = ?auto_214289 ?auto_214290 ) ) ( not ( = ?auto_214289 ?auto_214291 ) ) ( not ( = ?auto_214289 ?auto_214292 ) ) ( not ( = ?auto_214289 ?auto_214293 ) ) ( not ( = ?auto_214289 ?auto_214294 ) ) ( not ( = ?auto_214289 ?auto_214295 ) ) ( not ( = ?auto_214289 ?auto_214296 ) ) ( not ( = ?auto_214290 ?auto_214291 ) ) ( not ( = ?auto_214290 ?auto_214292 ) ) ( not ( = ?auto_214290 ?auto_214293 ) ) ( not ( = ?auto_214290 ?auto_214294 ) ) ( not ( = ?auto_214290 ?auto_214295 ) ) ( not ( = ?auto_214290 ?auto_214296 ) ) ( not ( = ?auto_214291 ?auto_214292 ) ) ( not ( = ?auto_214291 ?auto_214293 ) ) ( not ( = ?auto_214291 ?auto_214294 ) ) ( not ( = ?auto_214291 ?auto_214295 ) ) ( not ( = ?auto_214291 ?auto_214296 ) ) ( not ( = ?auto_214292 ?auto_214293 ) ) ( not ( = ?auto_214292 ?auto_214294 ) ) ( not ( = ?auto_214292 ?auto_214295 ) ) ( not ( = ?auto_214292 ?auto_214296 ) ) ( not ( = ?auto_214293 ?auto_214294 ) ) ( not ( = ?auto_214293 ?auto_214295 ) ) ( not ( = ?auto_214293 ?auto_214296 ) ) ( not ( = ?auto_214294 ?auto_214295 ) ) ( not ( = ?auto_214294 ?auto_214296 ) ) ( not ( = ?auto_214295 ?auto_214296 ) ) ( ON ?auto_214296 ?auto_214297 ) ( not ( = ?auto_214289 ?auto_214297 ) ) ( not ( = ?auto_214290 ?auto_214297 ) ) ( not ( = ?auto_214291 ?auto_214297 ) ) ( not ( = ?auto_214292 ?auto_214297 ) ) ( not ( = ?auto_214293 ?auto_214297 ) ) ( not ( = ?auto_214294 ?auto_214297 ) ) ( not ( = ?auto_214295 ?auto_214297 ) ) ( not ( = ?auto_214296 ?auto_214297 ) ) ( CLEAR ?auto_214294 ) ( ON ?auto_214295 ?auto_214296 ) ( CLEAR ?auto_214295 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214297 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214297 ?auto_214296 )
      ( MAKE-7PILE ?auto_214289 ?auto_214290 ?auto_214291 ?auto_214292 ?auto_214293 ?auto_214294 ?auto_214295 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214298 - BLOCK
      ?auto_214299 - BLOCK
      ?auto_214300 - BLOCK
      ?auto_214301 - BLOCK
      ?auto_214302 - BLOCK
      ?auto_214303 - BLOCK
      ?auto_214304 - BLOCK
    )
    :vars
    (
      ?auto_214306 - BLOCK
      ?auto_214305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214298 ) ( ON ?auto_214299 ?auto_214298 ) ( ON ?auto_214300 ?auto_214299 ) ( ON ?auto_214301 ?auto_214300 ) ( ON ?auto_214302 ?auto_214301 ) ( not ( = ?auto_214298 ?auto_214299 ) ) ( not ( = ?auto_214298 ?auto_214300 ) ) ( not ( = ?auto_214298 ?auto_214301 ) ) ( not ( = ?auto_214298 ?auto_214302 ) ) ( not ( = ?auto_214298 ?auto_214303 ) ) ( not ( = ?auto_214298 ?auto_214304 ) ) ( not ( = ?auto_214298 ?auto_214306 ) ) ( not ( = ?auto_214299 ?auto_214300 ) ) ( not ( = ?auto_214299 ?auto_214301 ) ) ( not ( = ?auto_214299 ?auto_214302 ) ) ( not ( = ?auto_214299 ?auto_214303 ) ) ( not ( = ?auto_214299 ?auto_214304 ) ) ( not ( = ?auto_214299 ?auto_214306 ) ) ( not ( = ?auto_214300 ?auto_214301 ) ) ( not ( = ?auto_214300 ?auto_214302 ) ) ( not ( = ?auto_214300 ?auto_214303 ) ) ( not ( = ?auto_214300 ?auto_214304 ) ) ( not ( = ?auto_214300 ?auto_214306 ) ) ( not ( = ?auto_214301 ?auto_214302 ) ) ( not ( = ?auto_214301 ?auto_214303 ) ) ( not ( = ?auto_214301 ?auto_214304 ) ) ( not ( = ?auto_214301 ?auto_214306 ) ) ( not ( = ?auto_214302 ?auto_214303 ) ) ( not ( = ?auto_214302 ?auto_214304 ) ) ( not ( = ?auto_214302 ?auto_214306 ) ) ( not ( = ?auto_214303 ?auto_214304 ) ) ( not ( = ?auto_214303 ?auto_214306 ) ) ( not ( = ?auto_214304 ?auto_214306 ) ) ( ON ?auto_214306 ?auto_214305 ) ( not ( = ?auto_214298 ?auto_214305 ) ) ( not ( = ?auto_214299 ?auto_214305 ) ) ( not ( = ?auto_214300 ?auto_214305 ) ) ( not ( = ?auto_214301 ?auto_214305 ) ) ( not ( = ?auto_214302 ?auto_214305 ) ) ( not ( = ?auto_214303 ?auto_214305 ) ) ( not ( = ?auto_214304 ?auto_214305 ) ) ( not ( = ?auto_214306 ?auto_214305 ) ) ( ON ?auto_214304 ?auto_214306 ) ( CLEAR ?auto_214304 ) ( ON-TABLE ?auto_214305 ) ( HOLDING ?auto_214303 ) ( CLEAR ?auto_214302 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214298 ?auto_214299 ?auto_214300 ?auto_214301 ?auto_214302 ?auto_214303 )
      ( MAKE-7PILE ?auto_214298 ?auto_214299 ?auto_214300 ?auto_214301 ?auto_214302 ?auto_214303 ?auto_214304 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214307 - BLOCK
      ?auto_214308 - BLOCK
      ?auto_214309 - BLOCK
      ?auto_214310 - BLOCK
      ?auto_214311 - BLOCK
      ?auto_214312 - BLOCK
      ?auto_214313 - BLOCK
    )
    :vars
    (
      ?auto_214315 - BLOCK
      ?auto_214314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214307 ) ( ON ?auto_214308 ?auto_214307 ) ( ON ?auto_214309 ?auto_214308 ) ( ON ?auto_214310 ?auto_214309 ) ( ON ?auto_214311 ?auto_214310 ) ( not ( = ?auto_214307 ?auto_214308 ) ) ( not ( = ?auto_214307 ?auto_214309 ) ) ( not ( = ?auto_214307 ?auto_214310 ) ) ( not ( = ?auto_214307 ?auto_214311 ) ) ( not ( = ?auto_214307 ?auto_214312 ) ) ( not ( = ?auto_214307 ?auto_214313 ) ) ( not ( = ?auto_214307 ?auto_214315 ) ) ( not ( = ?auto_214308 ?auto_214309 ) ) ( not ( = ?auto_214308 ?auto_214310 ) ) ( not ( = ?auto_214308 ?auto_214311 ) ) ( not ( = ?auto_214308 ?auto_214312 ) ) ( not ( = ?auto_214308 ?auto_214313 ) ) ( not ( = ?auto_214308 ?auto_214315 ) ) ( not ( = ?auto_214309 ?auto_214310 ) ) ( not ( = ?auto_214309 ?auto_214311 ) ) ( not ( = ?auto_214309 ?auto_214312 ) ) ( not ( = ?auto_214309 ?auto_214313 ) ) ( not ( = ?auto_214309 ?auto_214315 ) ) ( not ( = ?auto_214310 ?auto_214311 ) ) ( not ( = ?auto_214310 ?auto_214312 ) ) ( not ( = ?auto_214310 ?auto_214313 ) ) ( not ( = ?auto_214310 ?auto_214315 ) ) ( not ( = ?auto_214311 ?auto_214312 ) ) ( not ( = ?auto_214311 ?auto_214313 ) ) ( not ( = ?auto_214311 ?auto_214315 ) ) ( not ( = ?auto_214312 ?auto_214313 ) ) ( not ( = ?auto_214312 ?auto_214315 ) ) ( not ( = ?auto_214313 ?auto_214315 ) ) ( ON ?auto_214315 ?auto_214314 ) ( not ( = ?auto_214307 ?auto_214314 ) ) ( not ( = ?auto_214308 ?auto_214314 ) ) ( not ( = ?auto_214309 ?auto_214314 ) ) ( not ( = ?auto_214310 ?auto_214314 ) ) ( not ( = ?auto_214311 ?auto_214314 ) ) ( not ( = ?auto_214312 ?auto_214314 ) ) ( not ( = ?auto_214313 ?auto_214314 ) ) ( not ( = ?auto_214315 ?auto_214314 ) ) ( ON ?auto_214313 ?auto_214315 ) ( ON-TABLE ?auto_214314 ) ( CLEAR ?auto_214311 ) ( ON ?auto_214312 ?auto_214313 ) ( CLEAR ?auto_214312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214314 ?auto_214315 ?auto_214313 )
      ( MAKE-7PILE ?auto_214307 ?auto_214308 ?auto_214309 ?auto_214310 ?auto_214311 ?auto_214312 ?auto_214313 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214316 - BLOCK
      ?auto_214317 - BLOCK
      ?auto_214318 - BLOCK
      ?auto_214319 - BLOCK
      ?auto_214320 - BLOCK
      ?auto_214321 - BLOCK
      ?auto_214322 - BLOCK
    )
    :vars
    (
      ?auto_214323 - BLOCK
      ?auto_214324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214316 ) ( ON ?auto_214317 ?auto_214316 ) ( ON ?auto_214318 ?auto_214317 ) ( ON ?auto_214319 ?auto_214318 ) ( not ( = ?auto_214316 ?auto_214317 ) ) ( not ( = ?auto_214316 ?auto_214318 ) ) ( not ( = ?auto_214316 ?auto_214319 ) ) ( not ( = ?auto_214316 ?auto_214320 ) ) ( not ( = ?auto_214316 ?auto_214321 ) ) ( not ( = ?auto_214316 ?auto_214322 ) ) ( not ( = ?auto_214316 ?auto_214323 ) ) ( not ( = ?auto_214317 ?auto_214318 ) ) ( not ( = ?auto_214317 ?auto_214319 ) ) ( not ( = ?auto_214317 ?auto_214320 ) ) ( not ( = ?auto_214317 ?auto_214321 ) ) ( not ( = ?auto_214317 ?auto_214322 ) ) ( not ( = ?auto_214317 ?auto_214323 ) ) ( not ( = ?auto_214318 ?auto_214319 ) ) ( not ( = ?auto_214318 ?auto_214320 ) ) ( not ( = ?auto_214318 ?auto_214321 ) ) ( not ( = ?auto_214318 ?auto_214322 ) ) ( not ( = ?auto_214318 ?auto_214323 ) ) ( not ( = ?auto_214319 ?auto_214320 ) ) ( not ( = ?auto_214319 ?auto_214321 ) ) ( not ( = ?auto_214319 ?auto_214322 ) ) ( not ( = ?auto_214319 ?auto_214323 ) ) ( not ( = ?auto_214320 ?auto_214321 ) ) ( not ( = ?auto_214320 ?auto_214322 ) ) ( not ( = ?auto_214320 ?auto_214323 ) ) ( not ( = ?auto_214321 ?auto_214322 ) ) ( not ( = ?auto_214321 ?auto_214323 ) ) ( not ( = ?auto_214322 ?auto_214323 ) ) ( ON ?auto_214323 ?auto_214324 ) ( not ( = ?auto_214316 ?auto_214324 ) ) ( not ( = ?auto_214317 ?auto_214324 ) ) ( not ( = ?auto_214318 ?auto_214324 ) ) ( not ( = ?auto_214319 ?auto_214324 ) ) ( not ( = ?auto_214320 ?auto_214324 ) ) ( not ( = ?auto_214321 ?auto_214324 ) ) ( not ( = ?auto_214322 ?auto_214324 ) ) ( not ( = ?auto_214323 ?auto_214324 ) ) ( ON ?auto_214322 ?auto_214323 ) ( ON-TABLE ?auto_214324 ) ( ON ?auto_214321 ?auto_214322 ) ( CLEAR ?auto_214321 ) ( HOLDING ?auto_214320 ) ( CLEAR ?auto_214319 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214316 ?auto_214317 ?auto_214318 ?auto_214319 ?auto_214320 )
      ( MAKE-7PILE ?auto_214316 ?auto_214317 ?auto_214318 ?auto_214319 ?auto_214320 ?auto_214321 ?auto_214322 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214325 - BLOCK
      ?auto_214326 - BLOCK
      ?auto_214327 - BLOCK
      ?auto_214328 - BLOCK
      ?auto_214329 - BLOCK
      ?auto_214330 - BLOCK
      ?auto_214331 - BLOCK
    )
    :vars
    (
      ?auto_214332 - BLOCK
      ?auto_214333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214325 ) ( ON ?auto_214326 ?auto_214325 ) ( ON ?auto_214327 ?auto_214326 ) ( ON ?auto_214328 ?auto_214327 ) ( not ( = ?auto_214325 ?auto_214326 ) ) ( not ( = ?auto_214325 ?auto_214327 ) ) ( not ( = ?auto_214325 ?auto_214328 ) ) ( not ( = ?auto_214325 ?auto_214329 ) ) ( not ( = ?auto_214325 ?auto_214330 ) ) ( not ( = ?auto_214325 ?auto_214331 ) ) ( not ( = ?auto_214325 ?auto_214332 ) ) ( not ( = ?auto_214326 ?auto_214327 ) ) ( not ( = ?auto_214326 ?auto_214328 ) ) ( not ( = ?auto_214326 ?auto_214329 ) ) ( not ( = ?auto_214326 ?auto_214330 ) ) ( not ( = ?auto_214326 ?auto_214331 ) ) ( not ( = ?auto_214326 ?auto_214332 ) ) ( not ( = ?auto_214327 ?auto_214328 ) ) ( not ( = ?auto_214327 ?auto_214329 ) ) ( not ( = ?auto_214327 ?auto_214330 ) ) ( not ( = ?auto_214327 ?auto_214331 ) ) ( not ( = ?auto_214327 ?auto_214332 ) ) ( not ( = ?auto_214328 ?auto_214329 ) ) ( not ( = ?auto_214328 ?auto_214330 ) ) ( not ( = ?auto_214328 ?auto_214331 ) ) ( not ( = ?auto_214328 ?auto_214332 ) ) ( not ( = ?auto_214329 ?auto_214330 ) ) ( not ( = ?auto_214329 ?auto_214331 ) ) ( not ( = ?auto_214329 ?auto_214332 ) ) ( not ( = ?auto_214330 ?auto_214331 ) ) ( not ( = ?auto_214330 ?auto_214332 ) ) ( not ( = ?auto_214331 ?auto_214332 ) ) ( ON ?auto_214332 ?auto_214333 ) ( not ( = ?auto_214325 ?auto_214333 ) ) ( not ( = ?auto_214326 ?auto_214333 ) ) ( not ( = ?auto_214327 ?auto_214333 ) ) ( not ( = ?auto_214328 ?auto_214333 ) ) ( not ( = ?auto_214329 ?auto_214333 ) ) ( not ( = ?auto_214330 ?auto_214333 ) ) ( not ( = ?auto_214331 ?auto_214333 ) ) ( not ( = ?auto_214332 ?auto_214333 ) ) ( ON ?auto_214331 ?auto_214332 ) ( ON-TABLE ?auto_214333 ) ( ON ?auto_214330 ?auto_214331 ) ( CLEAR ?auto_214328 ) ( ON ?auto_214329 ?auto_214330 ) ( CLEAR ?auto_214329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214333 ?auto_214332 ?auto_214331 ?auto_214330 )
      ( MAKE-7PILE ?auto_214325 ?auto_214326 ?auto_214327 ?auto_214328 ?auto_214329 ?auto_214330 ?auto_214331 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214334 - BLOCK
      ?auto_214335 - BLOCK
      ?auto_214336 - BLOCK
      ?auto_214337 - BLOCK
      ?auto_214338 - BLOCK
      ?auto_214339 - BLOCK
      ?auto_214340 - BLOCK
    )
    :vars
    (
      ?auto_214341 - BLOCK
      ?auto_214342 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214334 ) ( ON ?auto_214335 ?auto_214334 ) ( ON ?auto_214336 ?auto_214335 ) ( not ( = ?auto_214334 ?auto_214335 ) ) ( not ( = ?auto_214334 ?auto_214336 ) ) ( not ( = ?auto_214334 ?auto_214337 ) ) ( not ( = ?auto_214334 ?auto_214338 ) ) ( not ( = ?auto_214334 ?auto_214339 ) ) ( not ( = ?auto_214334 ?auto_214340 ) ) ( not ( = ?auto_214334 ?auto_214341 ) ) ( not ( = ?auto_214335 ?auto_214336 ) ) ( not ( = ?auto_214335 ?auto_214337 ) ) ( not ( = ?auto_214335 ?auto_214338 ) ) ( not ( = ?auto_214335 ?auto_214339 ) ) ( not ( = ?auto_214335 ?auto_214340 ) ) ( not ( = ?auto_214335 ?auto_214341 ) ) ( not ( = ?auto_214336 ?auto_214337 ) ) ( not ( = ?auto_214336 ?auto_214338 ) ) ( not ( = ?auto_214336 ?auto_214339 ) ) ( not ( = ?auto_214336 ?auto_214340 ) ) ( not ( = ?auto_214336 ?auto_214341 ) ) ( not ( = ?auto_214337 ?auto_214338 ) ) ( not ( = ?auto_214337 ?auto_214339 ) ) ( not ( = ?auto_214337 ?auto_214340 ) ) ( not ( = ?auto_214337 ?auto_214341 ) ) ( not ( = ?auto_214338 ?auto_214339 ) ) ( not ( = ?auto_214338 ?auto_214340 ) ) ( not ( = ?auto_214338 ?auto_214341 ) ) ( not ( = ?auto_214339 ?auto_214340 ) ) ( not ( = ?auto_214339 ?auto_214341 ) ) ( not ( = ?auto_214340 ?auto_214341 ) ) ( ON ?auto_214341 ?auto_214342 ) ( not ( = ?auto_214334 ?auto_214342 ) ) ( not ( = ?auto_214335 ?auto_214342 ) ) ( not ( = ?auto_214336 ?auto_214342 ) ) ( not ( = ?auto_214337 ?auto_214342 ) ) ( not ( = ?auto_214338 ?auto_214342 ) ) ( not ( = ?auto_214339 ?auto_214342 ) ) ( not ( = ?auto_214340 ?auto_214342 ) ) ( not ( = ?auto_214341 ?auto_214342 ) ) ( ON ?auto_214340 ?auto_214341 ) ( ON-TABLE ?auto_214342 ) ( ON ?auto_214339 ?auto_214340 ) ( ON ?auto_214338 ?auto_214339 ) ( CLEAR ?auto_214338 ) ( HOLDING ?auto_214337 ) ( CLEAR ?auto_214336 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214334 ?auto_214335 ?auto_214336 ?auto_214337 )
      ( MAKE-7PILE ?auto_214334 ?auto_214335 ?auto_214336 ?auto_214337 ?auto_214338 ?auto_214339 ?auto_214340 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214343 - BLOCK
      ?auto_214344 - BLOCK
      ?auto_214345 - BLOCK
      ?auto_214346 - BLOCK
      ?auto_214347 - BLOCK
      ?auto_214348 - BLOCK
      ?auto_214349 - BLOCK
    )
    :vars
    (
      ?auto_214350 - BLOCK
      ?auto_214351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214343 ) ( ON ?auto_214344 ?auto_214343 ) ( ON ?auto_214345 ?auto_214344 ) ( not ( = ?auto_214343 ?auto_214344 ) ) ( not ( = ?auto_214343 ?auto_214345 ) ) ( not ( = ?auto_214343 ?auto_214346 ) ) ( not ( = ?auto_214343 ?auto_214347 ) ) ( not ( = ?auto_214343 ?auto_214348 ) ) ( not ( = ?auto_214343 ?auto_214349 ) ) ( not ( = ?auto_214343 ?auto_214350 ) ) ( not ( = ?auto_214344 ?auto_214345 ) ) ( not ( = ?auto_214344 ?auto_214346 ) ) ( not ( = ?auto_214344 ?auto_214347 ) ) ( not ( = ?auto_214344 ?auto_214348 ) ) ( not ( = ?auto_214344 ?auto_214349 ) ) ( not ( = ?auto_214344 ?auto_214350 ) ) ( not ( = ?auto_214345 ?auto_214346 ) ) ( not ( = ?auto_214345 ?auto_214347 ) ) ( not ( = ?auto_214345 ?auto_214348 ) ) ( not ( = ?auto_214345 ?auto_214349 ) ) ( not ( = ?auto_214345 ?auto_214350 ) ) ( not ( = ?auto_214346 ?auto_214347 ) ) ( not ( = ?auto_214346 ?auto_214348 ) ) ( not ( = ?auto_214346 ?auto_214349 ) ) ( not ( = ?auto_214346 ?auto_214350 ) ) ( not ( = ?auto_214347 ?auto_214348 ) ) ( not ( = ?auto_214347 ?auto_214349 ) ) ( not ( = ?auto_214347 ?auto_214350 ) ) ( not ( = ?auto_214348 ?auto_214349 ) ) ( not ( = ?auto_214348 ?auto_214350 ) ) ( not ( = ?auto_214349 ?auto_214350 ) ) ( ON ?auto_214350 ?auto_214351 ) ( not ( = ?auto_214343 ?auto_214351 ) ) ( not ( = ?auto_214344 ?auto_214351 ) ) ( not ( = ?auto_214345 ?auto_214351 ) ) ( not ( = ?auto_214346 ?auto_214351 ) ) ( not ( = ?auto_214347 ?auto_214351 ) ) ( not ( = ?auto_214348 ?auto_214351 ) ) ( not ( = ?auto_214349 ?auto_214351 ) ) ( not ( = ?auto_214350 ?auto_214351 ) ) ( ON ?auto_214349 ?auto_214350 ) ( ON-TABLE ?auto_214351 ) ( ON ?auto_214348 ?auto_214349 ) ( ON ?auto_214347 ?auto_214348 ) ( CLEAR ?auto_214345 ) ( ON ?auto_214346 ?auto_214347 ) ( CLEAR ?auto_214346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214351 ?auto_214350 ?auto_214349 ?auto_214348 ?auto_214347 )
      ( MAKE-7PILE ?auto_214343 ?auto_214344 ?auto_214345 ?auto_214346 ?auto_214347 ?auto_214348 ?auto_214349 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214352 - BLOCK
      ?auto_214353 - BLOCK
      ?auto_214354 - BLOCK
      ?auto_214355 - BLOCK
      ?auto_214356 - BLOCK
      ?auto_214357 - BLOCK
      ?auto_214358 - BLOCK
    )
    :vars
    (
      ?auto_214360 - BLOCK
      ?auto_214359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214352 ) ( ON ?auto_214353 ?auto_214352 ) ( not ( = ?auto_214352 ?auto_214353 ) ) ( not ( = ?auto_214352 ?auto_214354 ) ) ( not ( = ?auto_214352 ?auto_214355 ) ) ( not ( = ?auto_214352 ?auto_214356 ) ) ( not ( = ?auto_214352 ?auto_214357 ) ) ( not ( = ?auto_214352 ?auto_214358 ) ) ( not ( = ?auto_214352 ?auto_214360 ) ) ( not ( = ?auto_214353 ?auto_214354 ) ) ( not ( = ?auto_214353 ?auto_214355 ) ) ( not ( = ?auto_214353 ?auto_214356 ) ) ( not ( = ?auto_214353 ?auto_214357 ) ) ( not ( = ?auto_214353 ?auto_214358 ) ) ( not ( = ?auto_214353 ?auto_214360 ) ) ( not ( = ?auto_214354 ?auto_214355 ) ) ( not ( = ?auto_214354 ?auto_214356 ) ) ( not ( = ?auto_214354 ?auto_214357 ) ) ( not ( = ?auto_214354 ?auto_214358 ) ) ( not ( = ?auto_214354 ?auto_214360 ) ) ( not ( = ?auto_214355 ?auto_214356 ) ) ( not ( = ?auto_214355 ?auto_214357 ) ) ( not ( = ?auto_214355 ?auto_214358 ) ) ( not ( = ?auto_214355 ?auto_214360 ) ) ( not ( = ?auto_214356 ?auto_214357 ) ) ( not ( = ?auto_214356 ?auto_214358 ) ) ( not ( = ?auto_214356 ?auto_214360 ) ) ( not ( = ?auto_214357 ?auto_214358 ) ) ( not ( = ?auto_214357 ?auto_214360 ) ) ( not ( = ?auto_214358 ?auto_214360 ) ) ( ON ?auto_214360 ?auto_214359 ) ( not ( = ?auto_214352 ?auto_214359 ) ) ( not ( = ?auto_214353 ?auto_214359 ) ) ( not ( = ?auto_214354 ?auto_214359 ) ) ( not ( = ?auto_214355 ?auto_214359 ) ) ( not ( = ?auto_214356 ?auto_214359 ) ) ( not ( = ?auto_214357 ?auto_214359 ) ) ( not ( = ?auto_214358 ?auto_214359 ) ) ( not ( = ?auto_214360 ?auto_214359 ) ) ( ON ?auto_214358 ?auto_214360 ) ( ON-TABLE ?auto_214359 ) ( ON ?auto_214357 ?auto_214358 ) ( ON ?auto_214356 ?auto_214357 ) ( ON ?auto_214355 ?auto_214356 ) ( CLEAR ?auto_214355 ) ( HOLDING ?auto_214354 ) ( CLEAR ?auto_214353 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214352 ?auto_214353 ?auto_214354 )
      ( MAKE-7PILE ?auto_214352 ?auto_214353 ?auto_214354 ?auto_214355 ?auto_214356 ?auto_214357 ?auto_214358 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214361 - BLOCK
      ?auto_214362 - BLOCK
      ?auto_214363 - BLOCK
      ?auto_214364 - BLOCK
      ?auto_214365 - BLOCK
      ?auto_214366 - BLOCK
      ?auto_214367 - BLOCK
    )
    :vars
    (
      ?auto_214369 - BLOCK
      ?auto_214368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214361 ) ( ON ?auto_214362 ?auto_214361 ) ( not ( = ?auto_214361 ?auto_214362 ) ) ( not ( = ?auto_214361 ?auto_214363 ) ) ( not ( = ?auto_214361 ?auto_214364 ) ) ( not ( = ?auto_214361 ?auto_214365 ) ) ( not ( = ?auto_214361 ?auto_214366 ) ) ( not ( = ?auto_214361 ?auto_214367 ) ) ( not ( = ?auto_214361 ?auto_214369 ) ) ( not ( = ?auto_214362 ?auto_214363 ) ) ( not ( = ?auto_214362 ?auto_214364 ) ) ( not ( = ?auto_214362 ?auto_214365 ) ) ( not ( = ?auto_214362 ?auto_214366 ) ) ( not ( = ?auto_214362 ?auto_214367 ) ) ( not ( = ?auto_214362 ?auto_214369 ) ) ( not ( = ?auto_214363 ?auto_214364 ) ) ( not ( = ?auto_214363 ?auto_214365 ) ) ( not ( = ?auto_214363 ?auto_214366 ) ) ( not ( = ?auto_214363 ?auto_214367 ) ) ( not ( = ?auto_214363 ?auto_214369 ) ) ( not ( = ?auto_214364 ?auto_214365 ) ) ( not ( = ?auto_214364 ?auto_214366 ) ) ( not ( = ?auto_214364 ?auto_214367 ) ) ( not ( = ?auto_214364 ?auto_214369 ) ) ( not ( = ?auto_214365 ?auto_214366 ) ) ( not ( = ?auto_214365 ?auto_214367 ) ) ( not ( = ?auto_214365 ?auto_214369 ) ) ( not ( = ?auto_214366 ?auto_214367 ) ) ( not ( = ?auto_214366 ?auto_214369 ) ) ( not ( = ?auto_214367 ?auto_214369 ) ) ( ON ?auto_214369 ?auto_214368 ) ( not ( = ?auto_214361 ?auto_214368 ) ) ( not ( = ?auto_214362 ?auto_214368 ) ) ( not ( = ?auto_214363 ?auto_214368 ) ) ( not ( = ?auto_214364 ?auto_214368 ) ) ( not ( = ?auto_214365 ?auto_214368 ) ) ( not ( = ?auto_214366 ?auto_214368 ) ) ( not ( = ?auto_214367 ?auto_214368 ) ) ( not ( = ?auto_214369 ?auto_214368 ) ) ( ON ?auto_214367 ?auto_214369 ) ( ON-TABLE ?auto_214368 ) ( ON ?auto_214366 ?auto_214367 ) ( ON ?auto_214365 ?auto_214366 ) ( ON ?auto_214364 ?auto_214365 ) ( CLEAR ?auto_214362 ) ( ON ?auto_214363 ?auto_214364 ) ( CLEAR ?auto_214363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214368 ?auto_214369 ?auto_214367 ?auto_214366 ?auto_214365 ?auto_214364 )
      ( MAKE-7PILE ?auto_214361 ?auto_214362 ?auto_214363 ?auto_214364 ?auto_214365 ?auto_214366 ?auto_214367 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214370 - BLOCK
      ?auto_214371 - BLOCK
      ?auto_214372 - BLOCK
      ?auto_214373 - BLOCK
      ?auto_214374 - BLOCK
      ?auto_214375 - BLOCK
      ?auto_214376 - BLOCK
    )
    :vars
    (
      ?auto_214377 - BLOCK
      ?auto_214378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214370 ) ( not ( = ?auto_214370 ?auto_214371 ) ) ( not ( = ?auto_214370 ?auto_214372 ) ) ( not ( = ?auto_214370 ?auto_214373 ) ) ( not ( = ?auto_214370 ?auto_214374 ) ) ( not ( = ?auto_214370 ?auto_214375 ) ) ( not ( = ?auto_214370 ?auto_214376 ) ) ( not ( = ?auto_214370 ?auto_214377 ) ) ( not ( = ?auto_214371 ?auto_214372 ) ) ( not ( = ?auto_214371 ?auto_214373 ) ) ( not ( = ?auto_214371 ?auto_214374 ) ) ( not ( = ?auto_214371 ?auto_214375 ) ) ( not ( = ?auto_214371 ?auto_214376 ) ) ( not ( = ?auto_214371 ?auto_214377 ) ) ( not ( = ?auto_214372 ?auto_214373 ) ) ( not ( = ?auto_214372 ?auto_214374 ) ) ( not ( = ?auto_214372 ?auto_214375 ) ) ( not ( = ?auto_214372 ?auto_214376 ) ) ( not ( = ?auto_214372 ?auto_214377 ) ) ( not ( = ?auto_214373 ?auto_214374 ) ) ( not ( = ?auto_214373 ?auto_214375 ) ) ( not ( = ?auto_214373 ?auto_214376 ) ) ( not ( = ?auto_214373 ?auto_214377 ) ) ( not ( = ?auto_214374 ?auto_214375 ) ) ( not ( = ?auto_214374 ?auto_214376 ) ) ( not ( = ?auto_214374 ?auto_214377 ) ) ( not ( = ?auto_214375 ?auto_214376 ) ) ( not ( = ?auto_214375 ?auto_214377 ) ) ( not ( = ?auto_214376 ?auto_214377 ) ) ( ON ?auto_214377 ?auto_214378 ) ( not ( = ?auto_214370 ?auto_214378 ) ) ( not ( = ?auto_214371 ?auto_214378 ) ) ( not ( = ?auto_214372 ?auto_214378 ) ) ( not ( = ?auto_214373 ?auto_214378 ) ) ( not ( = ?auto_214374 ?auto_214378 ) ) ( not ( = ?auto_214375 ?auto_214378 ) ) ( not ( = ?auto_214376 ?auto_214378 ) ) ( not ( = ?auto_214377 ?auto_214378 ) ) ( ON ?auto_214376 ?auto_214377 ) ( ON-TABLE ?auto_214378 ) ( ON ?auto_214375 ?auto_214376 ) ( ON ?auto_214374 ?auto_214375 ) ( ON ?auto_214373 ?auto_214374 ) ( ON ?auto_214372 ?auto_214373 ) ( CLEAR ?auto_214372 ) ( HOLDING ?auto_214371 ) ( CLEAR ?auto_214370 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214370 ?auto_214371 )
      ( MAKE-7PILE ?auto_214370 ?auto_214371 ?auto_214372 ?auto_214373 ?auto_214374 ?auto_214375 ?auto_214376 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214379 - BLOCK
      ?auto_214380 - BLOCK
      ?auto_214381 - BLOCK
      ?auto_214382 - BLOCK
      ?auto_214383 - BLOCK
      ?auto_214384 - BLOCK
      ?auto_214385 - BLOCK
    )
    :vars
    (
      ?auto_214387 - BLOCK
      ?auto_214386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214379 ) ( not ( = ?auto_214379 ?auto_214380 ) ) ( not ( = ?auto_214379 ?auto_214381 ) ) ( not ( = ?auto_214379 ?auto_214382 ) ) ( not ( = ?auto_214379 ?auto_214383 ) ) ( not ( = ?auto_214379 ?auto_214384 ) ) ( not ( = ?auto_214379 ?auto_214385 ) ) ( not ( = ?auto_214379 ?auto_214387 ) ) ( not ( = ?auto_214380 ?auto_214381 ) ) ( not ( = ?auto_214380 ?auto_214382 ) ) ( not ( = ?auto_214380 ?auto_214383 ) ) ( not ( = ?auto_214380 ?auto_214384 ) ) ( not ( = ?auto_214380 ?auto_214385 ) ) ( not ( = ?auto_214380 ?auto_214387 ) ) ( not ( = ?auto_214381 ?auto_214382 ) ) ( not ( = ?auto_214381 ?auto_214383 ) ) ( not ( = ?auto_214381 ?auto_214384 ) ) ( not ( = ?auto_214381 ?auto_214385 ) ) ( not ( = ?auto_214381 ?auto_214387 ) ) ( not ( = ?auto_214382 ?auto_214383 ) ) ( not ( = ?auto_214382 ?auto_214384 ) ) ( not ( = ?auto_214382 ?auto_214385 ) ) ( not ( = ?auto_214382 ?auto_214387 ) ) ( not ( = ?auto_214383 ?auto_214384 ) ) ( not ( = ?auto_214383 ?auto_214385 ) ) ( not ( = ?auto_214383 ?auto_214387 ) ) ( not ( = ?auto_214384 ?auto_214385 ) ) ( not ( = ?auto_214384 ?auto_214387 ) ) ( not ( = ?auto_214385 ?auto_214387 ) ) ( ON ?auto_214387 ?auto_214386 ) ( not ( = ?auto_214379 ?auto_214386 ) ) ( not ( = ?auto_214380 ?auto_214386 ) ) ( not ( = ?auto_214381 ?auto_214386 ) ) ( not ( = ?auto_214382 ?auto_214386 ) ) ( not ( = ?auto_214383 ?auto_214386 ) ) ( not ( = ?auto_214384 ?auto_214386 ) ) ( not ( = ?auto_214385 ?auto_214386 ) ) ( not ( = ?auto_214387 ?auto_214386 ) ) ( ON ?auto_214385 ?auto_214387 ) ( ON-TABLE ?auto_214386 ) ( ON ?auto_214384 ?auto_214385 ) ( ON ?auto_214383 ?auto_214384 ) ( ON ?auto_214382 ?auto_214383 ) ( ON ?auto_214381 ?auto_214382 ) ( CLEAR ?auto_214379 ) ( ON ?auto_214380 ?auto_214381 ) ( CLEAR ?auto_214380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214386 ?auto_214387 ?auto_214385 ?auto_214384 ?auto_214383 ?auto_214382 ?auto_214381 )
      ( MAKE-7PILE ?auto_214379 ?auto_214380 ?auto_214381 ?auto_214382 ?auto_214383 ?auto_214384 ?auto_214385 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214388 - BLOCK
      ?auto_214389 - BLOCK
      ?auto_214390 - BLOCK
      ?auto_214391 - BLOCK
      ?auto_214392 - BLOCK
      ?auto_214393 - BLOCK
      ?auto_214394 - BLOCK
    )
    :vars
    (
      ?auto_214395 - BLOCK
      ?auto_214396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214388 ?auto_214389 ) ) ( not ( = ?auto_214388 ?auto_214390 ) ) ( not ( = ?auto_214388 ?auto_214391 ) ) ( not ( = ?auto_214388 ?auto_214392 ) ) ( not ( = ?auto_214388 ?auto_214393 ) ) ( not ( = ?auto_214388 ?auto_214394 ) ) ( not ( = ?auto_214388 ?auto_214395 ) ) ( not ( = ?auto_214389 ?auto_214390 ) ) ( not ( = ?auto_214389 ?auto_214391 ) ) ( not ( = ?auto_214389 ?auto_214392 ) ) ( not ( = ?auto_214389 ?auto_214393 ) ) ( not ( = ?auto_214389 ?auto_214394 ) ) ( not ( = ?auto_214389 ?auto_214395 ) ) ( not ( = ?auto_214390 ?auto_214391 ) ) ( not ( = ?auto_214390 ?auto_214392 ) ) ( not ( = ?auto_214390 ?auto_214393 ) ) ( not ( = ?auto_214390 ?auto_214394 ) ) ( not ( = ?auto_214390 ?auto_214395 ) ) ( not ( = ?auto_214391 ?auto_214392 ) ) ( not ( = ?auto_214391 ?auto_214393 ) ) ( not ( = ?auto_214391 ?auto_214394 ) ) ( not ( = ?auto_214391 ?auto_214395 ) ) ( not ( = ?auto_214392 ?auto_214393 ) ) ( not ( = ?auto_214392 ?auto_214394 ) ) ( not ( = ?auto_214392 ?auto_214395 ) ) ( not ( = ?auto_214393 ?auto_214394 ) ) ( not ( = ?auto_214393 ?auto_214395 ) ) ( not ( = ?auto_214394 ?auto_214395 ) ) ( ON ?auto_214395 ?auto_214396 ) ( not ( = ?auto_214388 ?auto_214396 ) ) ( not ( = ?auto_214389 ?auto_214396 ) ) ( not ( = ?auto_214390 ?auto_214396 ) ) ( not ( = ?auto_214391 ?auto_214396 ) ) ( not ( = ?auto_214392 ?auto_214396 ) ) ( not ( = ?auto_214393 ?auto_214396 ) ) ( not ( = ?auto_214394 ?auto_214396 ) ) ( not ( = ?auto_214395 ?auto_214396 ) ) ( ON ?auto_214394 ?auto_214395 ) ( ON-TABLE ?auto_214396 ) ( ON ?auto_214393 ?auto_214394 ) ( ON ?auto_214392 ?auto_214393 ) ( ON ?auto_214391 ?auto_214392 ) ( ON ?auto_214390 ?auto_214391 ) ( ON ?auto_214389 ?auto_214390 ) ( CLEAR ?auto_214389 ) ( HOLDING ?auto_214388 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_214388 )
      ( MAKE-7PILE ?auto_214388 ?auto_214389 ?auto_214390 ?auto_214391 ?auto_214392 ?auto_214393 ?auto_214394 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_214397 - BLOCK
      ?auto_214398 - BLOCK
      ?auto_214399 - BLOCK
      ?auto_214400 - BLOCK
      ?auto_214401 - BLOCK
      ?auto_214402 - BLOCK
      ?auto_214403 - BLOCK
    )
    :vars
    (
      ?auto_214405 - BLOCK
      ?auto_214404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214397 ?auto_214398 ) ) ( not ( = ?auto_214397 ?auto_214399 ) ) ( not ( = ?auto_214397 ?auto_214400 ) ) ( not ( = ?auto_214397 ?auto_214401 ) ) ( not ( = ?auto_214397 ?auto_214402 ) ) ( not ( = ?auto_214397 ?auto_214403 ) ) ( not ( = ?auto_214397 ?auto_214405 ) ) ( not ( = ?auto_214398 ?auto_214399 ) ) ( not ( = ?auto_214398 ?auto_214400 ) ) ( not ( = ?auto_214398 ?auto_214401 ) ) ( not ( = ?auto_214398 ?auto_214402 ) ) ( not ( = ?auto_214398 ?auto_214403 ) ) ( not ( = ?auto_214398 ?auto_214405 ) ) ( not ( = ?auto_214399 ?auto_214400 ) ) ( not ( = ?auto_214399 ?auto_214401 ) ) ( not ( = ?auto_214399 ?auto_214402 ) ) ( not ( = ?auto_214399 ?auto_214403 ) ) ( not ( = ?auto_214399 ?auto_214405 ) ) ( not ( = ?auto_214400 ?auto_214401 ) ) ( not ( = ?auto_214400 ?auto_214402 ) ) ( not ( = ?auto_214400 ?auto_214403 ) ) ( not ( = ?auto_214400 ?auto_214405 ) ) ( not ( = ?auto_214401 ?auto_214402 ) ) ( not ( = ?auto_214401 ?auto_214403 ) ) ( not ( = ?auto_214401 ?auto_214405 ) ) ( not ( = ?auto_214402 ?auto_214403 ) ) ( not ( = ?auto_214402 ?auto_214405 ) ) ( not ( = ?auto_214403 ?auto_214405 ) ) ( ON ?auto_214405 ?auto_214404 ) ( not ( = ?auto_214397 ?auto_214404 ) ) ( not ( = ?auto_214398 ?auto_214404 ) ) ( not ( = ?auto_214399 ?auto_214404 ) ) ( not ( = ?auto_214400 ?auto_214404 ) ) ( not ( = ?auto_214401 ?auto_214404 ) ) ( not ( = ?auto_214402 ?auto_214404 ) ) ( not ( = ?auto_214403 ?auto_214404 ) ) ( not ( = ?auto_214405 ?auto_214404 ) ) ( ON ?auto_214403 ?auto_214405 ) ( ON-TABLE ?auto_214404 ) ( ON ?auto_214402 ?auto_214403 ) ( ON ?auto_214401 ?auto_214402 ) ( ON ?auto_214400 ?auto_214401 ) ( ON ?auto_214399 ?auto_214400 ) ( ON ?auto_214398 ?auto_214399 ) ( ON ?auto_214397 ?auto_214398 ) ( CLEAR ?auto_214397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214404 ?auto_214405 ?auto_214403 ?auto_214402 ?auto_214401 ?auto_214400 ?auto_214399 ?auto_214398 )
      ( MAKE-7PILE ?auto_214397 ?auto_214398 ?auto_214399 ?auto_214400 ?auto_214401 ?auto_214402 ?auto_214403 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214407 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_214407 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_214407 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214408 - BLOCK
    )
    :vars
    (
      ?auto_214409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214408 ?auto_214409 ) ( CLEAR ?auto_214408 ) ( HAND-EMPTY ) ( not ( = ?auto_214408 ?auto_214409 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214408 ?auto_214409 )
      ( MAKE-1PILE ?auto_214408 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214410 - BLOCK
    )
    :vars
    (
      ?auto_214411 - BLOCK
      ?auto_214412 - BLOCK
      ?auto_214417 - BLOCK
      ?auto_214414 - BLOCK
      ?auto_214415 - BLOCK
      ?auto_214416 - BLOCK
      ?auto_214413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214410 ?auto_214411 ) ) ( HOLDING ?auto_214410 ) ( CLEAR ?auto_214411 ) ( ON-TABLE ?auto_214412 ) ( ON ?auto_214417 ?auto_214412 ) ( ON ?auto_214414 ?auto_214417 ) ( ON ?auto_214415 ?auto_214414 ) ( ON ?auto_214416 ?auto_214415 ) ( ON ?auto_214413 ?auto_214416 ) ( ON ?auto_214411 ?auto_214413 ) ( not ( = ?auto_214412 ?auto_214417 ) ) ( not ( = ?auto_214412 ?auto_214414 ) ) ( not ( = ?auto_214412 ?auto_214415 ) ) ( not ( = ?auto_214412 ?auto_214416 ) ) ( not ( = ?auto_214412 ?auto_214413 ) ) ( not ( = ?auto_214412 ?auto_214411 ) ) ( not ( = ?auto_214412 ?auto_214410 ) ) ( not ( = ?auto_214417 ?auto_214414 ) ) ( not ( = ?auto_214417 ?auto_214415 ) ) ( not ( = ?auto_214417 ?auto_214416 ) ) ( not ( = ?auto_214417 ?auto_214413 ) ) ( not ( = ?auto_214417 ?auto_214411 ) ) ( not ( = ?auto_214417 ?auto_214410 ) ) ( not ( = ?auto_214414 ?auto_214415 ) ) ( not ( = ?auto_214414 ?auto_214416 ) ) ( not ( = ?auto_214414 ?auto_214413 ) ) ( not ( = ?auto_214414 ?auto_214411 ) ) ( not ( = ?auto_214414 ?auto_214410 ) ) ( not ( = ?auto_214415 ?auto_214416 ) ) ( not ( = ?auto_214415 ?auto_214413 ) ) ( not ( = ?auto_214415 ?auto_214411 ) ) ( not ( = ?auto_214415 ?auto_214410 ) ) ( not ( = ?auto_214416 ?auto_214413 ) ) ( not ( = ?auto_214416 ?auto_214411 ) ) ( not ( = ?auto_214416 ?auto_214410 ) ) ( not ( = ?auto_214413 ?auto_214411 ) ) ( not ( = ?auto_214413 ?auto_214410 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214412 ?auto_214417 ?auto_214414 ?auto_214415 ?auto_214416 ?auto_214413 ?auto_214411 ?auto_214410 )
      ( MAKE-1PILE ?auto_214410 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214418 - BLOCK
    )
    :vars
    (
      ?auto_214420 - BLOCK
      ?auto_214424 - BLOCK
      ?auto_214422 - BLOCK
      ?auto_214421 - BLOCK
      ?auto_214423 - BLOCK
      ?auto_214419 - BLOCK
      ?auto_214425 - BLOCK
      ?auto_214426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214418 ?auto_214420 ) ) ( CLEAR ?auto_214420 ) ( ON-TABLE ?auto_214424 ) ( ON ?auto_214422 ?auto_214424 ) ( ON ?auto_214421 ?auto_214422 ) ( ON ?auto_214423 ?auto_214421 ) ( ON ?auto_214419 ?auto_214423 ) ( ON ?auto_214425 ?auto_214419 ) ( ON ?auto_214420 ?auto_214425 ) ( not ( = ?auto_214424 ?auto_214422 ) ) ( not ( = ?auto_214424 ?auto_214421 ) ) ( not ( = ?auto_214424 ?auto_214423 ) ) ( not ( = ?auto_214424 ?auto_214419 ) ) ( not ( = ?auto_214424 ?auto_214425 ) ) ( not ( = ?auto_214424 ?auto_214420 ) ) ( not ( = ?auto_214424 ?auto_214418 ) ) ( not ( = ?auto_214422 ?auto_214421 ) ) ( not ( = ?auto_214422 ?auto_214423 ) ) ( not ( = ?auto_214422 ?auto_214419 ) ) ( not ( = ?auto_214422 ?auto_214425 ) ) ( not ( = ?auto_214422 ?auto_214420 ) ) ( not ( = ?auto_214422 ?auto_214418 ) ) ( not ( = ?auto_214421 ?auto_214423 ) ) ( not ( = ?auto_214421 ?auto_214419 ) ) ( not ( = ?auto_214421 ?auto_214425 ) ) ( not ( = ?auto_214421 ?auto_214420 ) ) ( not ( = ?auto_214421 ?auto_214418 ) ) ( not ( = ?auto_214423 ?auto_214419 ) ) ( not ( = ?auto_214423 ?auto_214425 ) ) ( not ( = ?auto_214423 ?auto_214420 ) ) ( not ( = ?auto_214423 ?auto_214418 ) ) ( not ( = ?auto_214419 ?auto_214425 ) ) ( not ( = ?auto_214419 ?auto_214420 ) ) ( not ( = ?auto_214419 ?auto_214418 ) ) ( not ( = ?auto_214425 ?auto_214420 ) ) ( not ( = ?auto_214425 ?auto_214418 ) ) ( ON ?auto_214418 ?auto_214426 ) ( CLEAR ?auto_214418 ) ( HAND-EMPTY ) ( not ( = ?auto_214418 ?auto_214426 ) ) ( not ( = ?auto_214420 ?auto_214426 ) ) ( not ( = ?auto_214424 ?auto_214426 ) ) ( not ( = ?auto_214422 ?auto_214426 ) ) ( not ( = ?auto_214421 ?auto_214426 ) ) ( not ( = ?auto_214423 ?auto_214426 ) ) ( not ( = ?auto_214419 ?auto_214426 ) ) ( not ( = ?auto_214425 ?auto_214426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214418 ?auto_214426 )
      ( MAKE-1PILE ?auto_214418 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214427 - BLOCK
    )
    :vars
    (
      ?auto_214429 - BLOCK
      ?auto_214431 - BLOCK
      ?auto_214435 - BLOCK
      ?auto_214430 - BLOCK
      ?auto_214434 - BLOCK
      ?auto_214432 - BLOCK
      ?auto_214433 - BLOCK
      ?auto_214428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214427 ?auto_214429 ) ) ( ON-TABLE ?auto_214431 ) ( ON ?auto_214435 ?auto_214431 ) ( ON ?auto_214430 ?auto_214435 ) ( ON ?auto_214434 ?auto_214430 ) ( ON ?auto_214432 ?auto_214434 ) ( ON ?auto_214433 ?auto_214432 ) ( not ( = ?auto_214431 ?auto_214435 ) ) ( not ( = ?auto_214431 ?auto_214430 ) ) ( not ( = ?auto_214431 ?auto_214434 ) ) ( not ( = ?auto_214431 ?auto_214432 ) ) ( not ( = ?auto_214431 ?auto_214433 ) ) ( not ( = ?auto_214431 ?auto_214429 ) ) ( not ( = ?auto_214431 ?auto_214427 ) ) ( not ( = ?auto_214435 ?auto_214430 ) ) ( not ( = ?auto_214435 ?auto_214434 ) ) ( not ( = ?auto_214435 ?auto_214432 ) ) ( not ( = ?auto_214435 ?auto_214433 ) ) ( not ( = ?auto_214435 ?auto_214429 ) ) ( not ( = ?auto_214435 ?auto_214427 ) ) ( not ( = ?auto_214430 ?auto_214434 ) ) ( not ( = ?auto_214430 ?auto_214432 ) ) ( not ( = ?auto_214430 ?auto_214433 ) ) ( not ( = ?auto_214430 ?auto_214429 ) ) ( not ( = ?auto_214430 ?auto_214427 ) ) ( not ( = ?auto_214434 ?auto_214432 ) ) ( not ( = ?auto_214434 ?auto_214433 ) ) ( not ( = ?auto_214434 ?auto_214429 ) ) ( not ( = ?auto_214434 ?auto_214427 ) ) ( not ( = ?auto_214432 ?auto_214433 ) ) ( not ( = ?auto_214432 ?auto_214429 ) ) ( not ( = ?auto_214432 ?auto_214427 ) ) ( not ( = ?auto_214433 ?auto_214429 ) ) ( not ( = ?auto_214433 ?auto_214427 ) ) ( ON ?auto_214427 ?auto_214428 ) ( CLEAR ?auto_214427 ) ( not ( = ?auto_214427 ?auto_214428 ) ) ( not ( = ?auto_214429 ?auto_214428 ) ) ( not ( = ?auto_214431 ?auto_214428 ) ) ( not ( = ?auto_214435 ?auto_214428 ) ) ( not ( = ?auto_214430 ?auto_214428 ) ) ( not ( = ?auto_214434 ?auto_214428 ) ) ( not ( = ?auto_214432 ?auto_214428 ) ) ( not ( = ?auto_214433 ?auto_214428 ) ) ( HOLDING ?auto_214429 ) ( CLEAR ?auto_214433 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214431 ?auto_214435 ?auto_214430 ?auto_214434 ?auto_214432 ?auto_214433 ?auto_214429 )
      ( MAKE-1PILE ?auto_214427 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214436 - BLOCK
    )
    :vars
    (
      ?auto_214437 - BLOCK
      ?auto_214438 - BLOCK
      ?auto_214439 - BLOCK
      ?auto_214442 - BLOCK
      ?auto_214444 - BLOCK
      ?auto_214441 - BLOCK
      ?auto_214443 - BLOCK
      ?auto_214440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214436 ?auto_214437 ) ) ( ON-TABLE ?auto_214438 ) ( ON ?auto_214439 ?auto_214438 ) ( ON ?auto_214442 ?auto_214439 ) ( ON ?auto_214444 ?auto_214442 ) ( ON ?auto_214441 ?auto_214444 ) ( ON ?auto_214443 ?auto_214441 ) ( not ( = ?auto_214438 ?auto_214439 ) ) ( not ( = ?auto_214438 ?auto_214442 ) ) ( not ( = ?auto_214438 ?auto_214444 ) ) ( not ( = ?auto_214438 ?auto_214441 ) ) ( not ( = ?auto_214438 ?auto_214443 ) ) ( not ( = ?auto_214438 ?auto_214437 ) ) ( not ( = ?auto_214438 ?auto_214436 ) ) ( not ( = ?auto_214439 ?auto_214442 ) ) ( not ( = ?auto_214439 ?auto_214444 ) ) ( not ( = ?auto_214439 ?auto_214441 ) ) ( not ( = ?auto_214439 ?auto_214443 ) ) ( not ( = ?auto_214439 ?auto_214437 ) ) ( not ( = ?auto_214439 ?auto_214436 ) ) ( not ( = ?auto_214442 ?auto_214444 ) ) ( not ( = ?auto_214442 ?auto_214441 ) ) ( not ( = ?auto_214442 ?auto_214443 ) ) ( not ( = ?auto_214442 ?auto_214437 ) ) ( not ( = ?auto_214442 ?auto_214436 ) ) ( not ( = ?auto_214444 ?auto_214441 ) ) ( not ( = ?auto_214444 ?auto_214443 ) ) ( not ( = ?auto_214444 ?auto_214437 ) ) ( not ( = ?auto_214444 ?auto_214436 ) ) ( not ( = ?auto_214441 ?auto_214443 ) ) ( not ( = ?auto_214441 ?auto_214437 ) ) ( not ( = ?auto_214441 ?auto_214436 ) ) ( not ( = ?auto_214443 ?auto_214437 ) ) ( not ( = ?auto_214443 ?auto_214436 ) ) ( ON ?auto_214436 ?auto_214440 ) ( not ( = ?auto_214436 ?auto_214440 ) ) ( not ( = ?auto_214437 ?auto_214440 ) ) ( not ( = ?auto_214438 ?auto_214440 ) ) ( not ( = ?auto_214439 ?auto_214440 ) ) ( not ( = ?auto_214442 ?auto_214440 ) ) ( not ( = ?auto_214444 ?auto_214440 ) ) ( not ( = ?auto_214441 ?auto_214440 ) ) ( not ( = ?auto_214443 ?auto_214440 ) ) ( CLEAR ?auto_214443 ) ( ON ?auto_214437 ?auto_214436 ) ( CLEAR ?auto_214437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214440 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214440 ?auto_214436 )
      ( MAKE-1PILE ?auto_214436 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214445 - BLOCK
    )
    :vars
    (
      ?auto_214446 - BLOCK
      ?auto_214451 - BLOCK
      ?auto_214452 - BLOCK
      ?auto_214450 - BLOCK
      ?auto_214449 - BLOCK
      ?auto_214453 - BLOCK
      ?auto_214447 - BLOCK
      ?auto_214448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214445 ?auto_214446 ) ) ( ON-TABLE ?auto_214451 ) ( ON ?auto_214452 ?auto_214451 ) ( ON ?auto_214450 ?auto_214452 ) ( ON ?auto_214449 ?auto_214450 ) ( ON ?auto_214453 ?auto_214449 ) ( not ( = ?auto_214451 ?auto_214452 ) ) ( not ( = ?auto_214451 ?auto_214450 ) ) ( not ( = ?auto_214451 ?auto_214449 ) ) ( not ( = ?auto_214451 ?auto_214453 ) ) ( not ( = ?auto_214451 ?auto_214447 ) ) ( not ( = ?auto_214451 ?auto_214446 ) ) ( not ( = ?auto_214451 ?auto_214445 ) ) ( not ( = ?auto_214452 ?auto_214450 ) ) ( not ( = ?auto_214452 ?auto_214449 ) ) ( not ( = ?auto_214452 ?auto_214453 ) ) ( not ( = ?auto_214452 ?auto_214447 ) ) ( not ( = ?auto_214452 ?auto_214446 ) ) ( not ( = ?auto_214452 ?auto_214445 ) ) ( not ( = ?auto_214450 ?auto_214449 ) ) ( not ( = ?auto_214450 ?auto_214453 ) ) ( not ( = ?auto_214450 ?auto_214447 ) ) ( not ( = ?auto_214450 ?auto_214446 ) ) ( not ( = ?auto_214450 ?auto_214445 ) ) ( not ( = ?auto_214449 ?auto_214453 ) ) ( not ( = ?auto_214449 ?auto_214447 ) ) ( not ( = ?auto_214449 ?auto_214446 ) ) ( not ( = ?auto_214449 ?auto_214445 ) ) ( not ( = ?auto_214453 ?auto_214447 ) ) ( not ( = ?auto_214453 ?auto_214446 ) ) ( not ( = ?auto_214453 ?auto_214445 ) ) ( not ( = ?auto_214447 ?auto_214446 ) ) ( not ( = ?auto_214447 ?auto_214445 ) ) ( ON ?auto_214445 ?auto_214448 ) ( not ( = ?auto_214445 ?auto_214448 ) ) ( not ( = ?auto_214446 ?auto_214448 ) ) ( not ( = ?auto_214451 ?auto_214448 ) ) ( not ( = ?auto_214452 ?auto_214448 ) ) ( not ( = ?auto_214450 ?auto_214448 ) ) ( not ( = ?auto_214449 ?auto_214448 ) ) ( not ( = ?auto_214453 ?auto_214448 ) ) ( not ( = ?auto_214447 ?auto_214448 ) ) ( ON ?auto_214446 ?auto_214445 ) ( CLEAR ?auto_214446 ) ( ON-TABLE ?auto_214448 ) ( HOLDING ?auto_214447 ) ( CLEAR ?auto_214453 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214451 ?auto_214452 ?auto_214450 ?auto_214449 ?auto_214453 ?auto_214447 )
      ( MAKE-1PILE ?auto_214445 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214454 - BLOCK
    )
    :vars
    (
      ?auto_214459 - BLOCK
      ?auto_214456 - BLOCK
      ?auto_214461 - BLOCK
      ?auto_214462 - BLOCK
      ?auto_214460 - BLOCK
      ?auto_214458 - BLOCK
      ?auto_214457 - BLOCK
      ?auto_214455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214454 ?auto_214459 ) ) ( ON-TABLE ?auto_214456 ) ( ON ?auto_214461 ?auto_214456 ) ( ON ?auto_214462 ?auto_214461 ) ( ON ?auto_214460 ?auto_214462 ) ( ON ?auto_214458 ?auto_214460 ) ( not ( = ?auto_214456 ?auto_214461 ) ) ( not ( = ?auto_214456 ?auto_214462 ) ) ( not ( = ?auto_214456 ?auto_214460 ) ) ( not ( = ?auto_214456 ?auto_214458 ) ) ( not ( = ?auto_214456 ?auto_214457 ) ) ( not ( = ?auto_214456 ?auto_214459 ) ) ( not ( = ?auto_214456 ?auto_214454 ) ) ( not ( = ?auto_214461 ?auto_214462 ) ) ( not ( = ?auto_214461 ?auto_214460 ) ) ( not ( = ?auto_214461 ?auto_214458 ) ) ( not ( = ?auto_214461 ?auto_214457 ) ) ( not ( = ?auto_214461 ?auto_214459 ) ) ( not ( = ?auto_214461 ?auto_214454 ) ) ( not ( = ?auto_214462 ?auto_214460 ) ) ( not ( = ?auto_214462 ?auto_214458 ) ) ( not ( = ?auto_214462 ?auto_214457 ) ) ( not ( = ?auto_214462 ?auto_214459 ) ) ( not ( = ?auto_214462 ?auto_214454 ) ) ( not ( = ?auto_214460 ?auto_214458 ) ) ( not ( = ?auto_214460 ?auto_214457 ) ) ( not ( = ?auto_214460 ?auto_214459 ) ) ( not ( = ?auto_214460 ?auto_214454 ) ) ( not ( = ?auto_214458 ?auto_214457 ) ) ( not ( = ?auto_214458 ?auto_214459 ) ) ( not ( = ?auto_214458 ?auto_214454 ) ) ( not ( = ?auto_214457 ?auto_214459 ) ) ( not ( = ?auto_214457 ?auto_214454 ) ) ( ON ?auto_214454 ?auto_214455 ) ( not ( = ?auto_214454 ?auto_214455 ) ) ( not ( = ?auto_214459 ?auto_214455 ) ) ( not ( = ?auto_214456 ?auto_214455 ) ) ( not ( = ?auto_214461 ?auto_214455 ) ) ( not ( = ?auto_214462 ?auto_214455 ) ) ( not ( = ?auto_214460 ?auto_214455 ) ) ( not ( = ?auto_214458 ?auto_214455 ) ) ( not ( = ?auto_214457 ?auto_214455 ) ) ( ON ?auto_214459 ?auto_214454 ) ( ON-TABLE ?auto_214455 ) ( CLEAR ?auto_214458 ) ( ON ?auto_214457 ?auto_214459 ) ( CLEAR ?auto_214457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214455 ?auto_214454 ?auto_214459 )
      ( MAKE-1PILE ?auto_214454 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214463 - BLOCK
    )
    :vars
    (
      ?auto_214464 - BLOCK
      ?auto_214468 - BLOCK
      ?auto_214469 - BLOCK
      ?auto_214465 - BLOCK
      ?auto_214466 - BLOCK
      ?auto_214471 - BLOCK
      ?auto_214467 - BLOCK
      ?auto_214470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214463 ?auto_214464 ) ) ( ON-TABLE ?auto_214468 ) ( ON ?auto_214469 ?auto_214468 ) ( ON ?auto_214465 ?auto_214469 ) ( ON ?auto_214466 ?auto_214465 ) ( not ( = ?auto_214468 ?auto_214469 ) ) ( not ( = ?auto_214468 ?auto_214465 ) ) ( not ( = ?auto_214468 ?auto_214466 ) ) ( not ( = ?auto_214468 ?auto_214471 ) ) ( not ( = ?auto_214468 ?auto_214467 ) ) ( not ( = ?auto_214468 ?auto_214464 ) ) ( not ( = ?auto_214468 ?auto_214463 ) ) ( not ( = ?auto_214469 ?auto_214465 ) ) ( not ( = ?auto_214469 ?auto_214466 ) ) ( not ( = ?auto_214469 ?auto_214471 ) ) ( not ( = ?auto_214469 ?auto_214467 ) ) ( not ( = ?auto_214469 ?auto_214464 ) ) ( not ( = ?auto_214469 ?auto_214463 ) ) ( not ( = ?auto_214465 ?auto_214466 ) ) ( not ( = ?auto_214465 ?auto_214471 ) ) ( not ( = ?auto_214465 ?auto_214467 ) ) ( not ( = ?auto_214465 ?auto_214464 ) ) ( not ( = ?auto_214465 ?auto_214463 ) ) ( not ( = ?auto_214466 ?auto_214471 ) ) ( not ( = ?auto_214466 ?auto_214467 ) ) ( not ( = ?auto_214466 ?auto_214464 ) ) ( not ( = ?auto_214466 ?auto_214463 ) ) ( not ( = ?auto_214471 ?auto_214467 ) ) ( not ( = ?auto_214471 ?auto_214464 ) ) ( not ( = ?auto_214471 ?auto_214463 ) ) ( not ( = ?auto_214467 ?auto_214464 ) ) ( not ( = ?auto_214467 ?auto_214463 ) ) ( ON ?auto_214463 ?auto_214470 ) ( not ( = ?auto_214463 ?auto_214470 ) ) ( not ( = ?auto_214464 ?auto_214470 ) ) ( not ( = ?auto_214468 ?auto_214470 ) ) ( not ( = ?auto_214469 ?auto_214470 ) ) ( not ( = ?auto_214465 ?auto_214470 ) ) ( not ( = ?auto_214466 ?auto_214470 ) ) ( not ( = ?auto_214471 ?auto_214470 ) ) ( not ( = ?auto_214467 ?auto_214470 ) ) ( ON ?auto_214464 ?auto_214463 ) ( ON-TABLE ?auto_214470 ) ( ON ?auto_214467 ?auto_214464 ) ( CLEAR ?auto_214467 ) ( HOLDING ?auto_214471 ) ( CLEAR ?auto_214466 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214468 ?auto_214469 ?auto_214465 ?auto_214466 ?auto_214471 )
      ( MAKE-1PILE ?auto_214463 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214472 - BLOCK
    )
    :vars
    (
      ?auto_214474 - BLOCK
      ?auto_214479 - BLOCK
      ?auto_214473 - BLOCK
      ?auto_214475 - BLOCK
      ?auto_214477 - BLOCK
      ?auto_214478 - BLOCK
      ?auto_214476 - BLOCK
      ?auto_214480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214472 ?auto_214474 ) ) ( ON-TABLE ?auto_214479 ) ( ON ?auto_214473 ?auto_214479 ) ( ON ?auto_214475 ?auto_214473 ) ( ON ?auto_214477 ?auto_214475 ) ( not ( = ?auto_214479 ?auto_214473 ) ) ( not ( = ?auto_214479 ?auto_214475 ) ) ( not ( = ?auto_214479 ?auto_214477 ) ) ( not ( = ?auto_214479 ?auto_214478 ) ) ( not ( = ?auto_214479 ?auto_214476 ) ) ( not ( = ?auto_214479 ?auto_214474 ) ) ( not ( = ?auto_214479 ?auto_214472 ) ) ( not ( = ?auto_214473 ?auto_214475 ) ) ( not ( = ?auto_214473 ?auto_214477 ) ) ( not ( = ?auto_214473 ?auto_214478 ) ) ( not ( = ?auto_214473 ?auto_214476 ) ) ( not ( = ?auto_214473 ?auto_214474 ) ) ( not ( = ?auto_214473 ?auto_214472 ) ) ( not ( = ?auto_214475 ?auto_214477 ) ) ( not ( = ?auto_214475 ?auto_214478 ) ) ( not ( = ?auto_214475 ?auto_214476 ) ) ( not ( = ?auto_214475 ?auto_214474 ) ) ( not ( = ?auto_214475 ?auto_214472 ) ) ( not ( = ?auto_214477 ?auto_214478 ) ) ( not ( = ?auto_214477 ?auto_214476 ) ) ( not ( = ?auto_214477 ?auto_214474 ) ) ( not ( = ?auto_214477 ?auto_214472 ) ) ( not ( = ?auto_214478 ?auto_214476 ) ) ( not ( = ?auto_214478 ?auto_214474 ) ) ( not ( = ?auto_214478 ?auto_214472 ) ) ( not ( = ?auto_214476 ?auto_214474 ) ) ( not ( = ?auto_214476 ?auto_214472 ) ) ( ON ?auto_214472 ?auto_214480 ) ( not ( = ?auto_214472 ?auto_214480 ) ) ( not ( = ?auto_214474 ?auto_214480 ) ) ( not ( = ?auto_214479 ?auto_214480 ) ) ( not ( = ?auto_214473 ?auto_214480 ) ) ( not ( = ?auto_214475 ?auto_214480 ) ) ( not ( = ?auto_214477 ?auto_214480 ) ) ( not ( = ?auto_214478 ?auto_214480 ) ) ( not ( = ?auto_214476 ?auto_214480 ) ) ( ON ?auto_214474 ?auto_214472 ) ( ON-TABLE ?auto_214480 ) ( ON ?auto_214476 ?auto_214474 ) ( CLEAR ?auto_214477 ) ( ON ?auto_214478 ?auto_214476 ) ( CLEAR ?auto_214478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214480 ?auto_214472 ?auto_214474 ?auto_214476 )
      ( MAKE-1PILE ?auto_214472 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214481 - BLOCK
    )
    :vars
    (
      ?auto_214484 - BLOCK
      ?auto_214482 - BLOCK
      ?auto_214485 - BLOCK
      ?auto_214488 - BLOCK
      ?auto_214486 - BLOCK
      ?auto_214489 - BLOCK
      ?auto_214483 - BLOCK
      ?auto_214487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214481 ?auto_214484 ) ) ( ON-TABLE ?auto_214482 ) ( ON ?auto_214485 ?auto_214482 ) ( ON ?auto_214488 ?auto_214485 ) ( not ( = ?auto_214482 ?auto_214485 ) ) ( not ( = ?auto_214482 ?auto_214488 ) ) ( not ( = ?auto_214482 ?auto_214486 ) ) ( not ( = ?auto_214482 ?auto_214489 ) ) ( not ( = ?auto_214482 ?auto_214483 ) ) ( not ( = ?auto_214482 ?auto_214484 ) ) ( not ( = ?auto_214482 ?auto_214481 ) ) ( not ( = ?auto_214485 ?auto_214488 ) ) ( not ( = ?auto_214485 ?auto_214486 ) ) ( not ( = ?auto_214485 ?auto_214489 ) ) ( not ( = ?auto_214485 ?auto_214483 ) ) ( not ( = ?auto_214485 ?auto_214484 ) ) ( not ( = ?auto_214485 ?auto_214481 ) ) ( not ( = ?auto_214488 ?auto_214486 ) ) ( not ( = ?auto_214488 ?auto_214489 ) ) ( not ( = ?auto_214488 ?auto_214483 ) ) ( not ( = ?auto_214488 ?auto_214484 ) ) ( not ( = ?auto_214488 ?auto_214481 ) ) ( not ( = ?auto_214486 ?auto_214489 ) ) ( not ( = ?auto_214486 ?auto_214483 ) ) ( not ( = ?auto_214486 ?auto_214484 ) ) ( not ( = ?auto_214486 ?auto_214481 ) ) ( not ( = ?auto_214489 ?auto_214483 ) ) ( not ( = ?auto_214489 ?auto_214484 ) ) ( not ( = ?auto_214489 ?auto_214481 ) ) ( not ( = ?auto_214483 ?auto_214484 ) ) ( not ( = ?auto_214483 ?auto_214481 ) ) ( ON ?auto_214481 ?auto_214487 ) ( not ( = ?auto_214481 ?auto_214487 ) ) ( not ( = ?auto_214484 ?auto_214487 ) ) ( not ( = ?auto_214482 ?auto_214487 ) ) ( not ( = ?auto_214485 ?auto_214487 ) ) ( not ( = ?auto_214488 ?auto_214487 ) ) ( not ( = ?auto_214486 ?auto_214487 ) ) ( not ( = ?auto_214489 ?auto_214487 ) ) ( not ( = ?auto_214483 ?auto_214487 ) ) ( ON ?auto_214484 ?auto_214481 ) ( ON-TABLE ?auto_214487 ) ( ON ?auto_214483 ?auto_214484 ) ( ON ?auto_214489 ?auto_214483 ) ( CLEAR ?auto_214489 ) ( HOLDING ?auto_214486 ) ( CLEAR ?auto_214488 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214482 ?auto_214485 ?auto_214488 ?auto_214486 )
      ( MAKE-1PILE ?auto_214481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214490 - BLOCK
    )
    :vars
    (
      ?auto_214493 - BLOCK
      ?auto_214498 - BLOCK
      ?auto_214492 - BLOCK
      ?auto_214495 - BLOCK
      ?auto_214494 - BLOCK
      ?auto_214497 - BLOCK
      ?auto_214496 - BLOCK
      ?auto_214491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214490 ?auto_214493 ) ) ( ON-TABLE ?auto_214498 ) ( ON ?auto_214492 ?auto_214498 ) ( ON ?auto_214495 ?auto_214492 ) ( not ( = ?auto_214498 ?auto_214492 ) ) ( not ( = ?auto_214498 ?auto_214495 ) ) ( not ( = ?auto_214498 ?auto_214494 ) ) ( not ( = ?auto_214498 ?auto_214497 ) ) ( not ( = ?auto_214498 ?auto_214496 ) ) ( not ( = ?auto_214498 ?auto_214493 ) ) ( not ( = ?auto_214498 ?auto_214490 ) ) ( not ( = ?auto_214492 ?auto_214495 ) ) ( not ( = ?auto_214492 ?auto_214494 ) ) ( not ( = ?auto_214492 ?auto_214497 ) ) ( not ( = ?auto_214492 ?auto_214496 ) ) ( not ( = ?auto_214492 ?auto_214493 ) ) ( not ( = ?auto_214492 ?auto_214490 ) ) ( not ( = ?auto_214495 ?auto_214494 ) ) ( not ( = ?auto_214495 ?auto_214497 ) ) ( not ( = ?auto_214495 ?auto_214496 ) ) ( not ( = ?auto_214495 ?auto_214493 ) ) ( not ( = ?auto_214495 ?auto_214490 ) ) ( not ( = ?auto_214494 ?auto_214497 ) ) ( not ( = ?auto_214494 ?auto_214496 ) ) ( not ( = ?auto_214494 ?auto_214493 ) ) ( not ( = ?auto_214494 ?auto_214490 ) ) ( not ( = ?auto_214497 ?auto_214496 ) ) ( not ( = ?auto_214497 ?auto_214493 ) ) ( not ( = ?auto_214497 ?auto_214490 ) ) ( not ( = ?auto_214496 ?auto_214493 ) ) ( not ( = ?auto_214496 ?auto_214490 ) ) ( ON ?auto_214490 ?auto_214491 ) ( not ( = ?auto_214490 ?auto_214491 ) ) ( not ( = ?auto_214493 ?auto_214491 ) ) ( not ( = ?auto_214498 ?auto_214491 ) ) ( not ( = ?auto_214492 ?auto_214491 ) ) ( not ( = ?auto_214495 ?auto_214491 ) ) ( not ( = ?auto_214494 ?auto_214491 ) ) ( not ( = ?auto_214497 ?auto_214491 ) ) ( not ( = ?auto_214496 ?auto_214491 ) ) ( ON ?auto_214493 ?auto_214490 ) ( ON-TABLE ?auto_214491 ) ( ON ?auto_214496 ?auto_214493 ) ( ON ?auto_214497 ?auto_214496 ) ( CLEAR ?auto_214495 ) ( ON ?auto_214494 ?auto_214497 ) ( CLEAR ?auto_214494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214491 ?auto_214490 ?auto_214493 ?auto_214496 ?auto_214497 )
      ( MAKE-1PILE ?auto_214490 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214499 - BLOCK
    )
    :vars
    (
      ?auto_214506 - BLOCK
      ?auto_214504 - BLOCK
      ?auto_214502 - BLOCK
      ?auto_214503 - BLOCK
      ?auto_214501 - BLOCK
      ?auto_214505 - BLOCK
      ?auto_214500 - BLOCK
      ?auto_214507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214499 ?auto_214506 ) ) ( ON-TABLE ?auto_214504 ) ( ON ?auto_214502 ?auto_214504 ) ( not ( = ?auto_214504 ?auto_214502 ) ) ( not ( = ?auto_214504 ?auto_214503 ) ) ( not ( = ?auto_214504 ?auto_214501 ) ) ( not ( = ?auto_214504 ?auto_214505 ) ) ( not ( = ?auto_214504 ?auto_214500 ) ) ( not ( = ?auto_214504 ?auto_214506 ) ) ( not ( = ?auto_214504 ?auto_214499 ) ) ( not ( = ?auto_214502 ?auto_214503 ) ) ( not ( = ?auto_214502 ?auto_214501 ) ) ( not ( = ?auto_214502 ?auto_214505 ) ) ( not ( = ?auto_214502 ?auto_214500 ) ) ( not ( = ?auto_214502 ?auto_214506 ) ) ( not ( = ?auto_214502 ?auto_214499 ) ) ( not ( = ?auto_214503 ?auto_214501 ) ) ( not ( = ?auto_214503 ?auto_214505 ) ) ( not ( = ?auto_214503 ?auto_214500 ) ) ( not ( = ?auto_214503 ?auto_214506 ) ) ( not ( = ?auto_214503 ?auto_214499 ) ) ( not ( = ?auto_214501 ?auto_214505 ) ) ( not ( = ?auto_214501 ?auto_214500 ) ) ( not ( = ?auto_214501 ?auto_214506 ) ) ( not ( = ?auto_214501 ?auto_214499 ) ) ( not ( = ?auto_214505 ?auto_214500 ) ) ( not ( = ?auto_214505 ?auto_214506 ) ) ( not ( = ?auto_214505 ?auto_214499 ) ) ( not ( = ?auto_214500 ?auto_214506 ) ) ( not ( = ?auto_214500 ?auto_214499 ) ) ( ON ?auto_214499 ?auto_214507 ) ( not ( = ?auto_214499 ?auto_214507 ) ) ( not ( = ?auto_214506 ?auto_214507 ) ) ( not ( = ?auto_214504 ?auto_214507 ) ) ( not ( = ?auto_214502 ?auto_214507 ) ) ( not ( = ?auto_214503 ?auto_214507 ) ) ( not ( = ?auto_214501 ?auto_214507 ) ) ( not ( = ?auto_214505 ?auto_214507 ) ) ( not ( = ?auto_214500 ?auto_214507 ) ) ( ON ?auto_214506 ?auto_214499 ) ( ON-TABLE ?auto_214507 ) ( ON ?auto_214500 ?auto_214506 ) ( ON ?auto_214505 ?auto_214500 ) ( ON ?auto_214501 ?auto_214505 ) ( CLEAR ?auto_214501 ) ( HOLDING ?auto_214503 ) ( CLEAR ?auto_214502 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214504 ?auto_214502 ?auto_214503 )
      ( MAKE-1PILE ?auto_214499 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214508 - BLOCK
    )
    :vars
    (
      ?auto_214515 - BLOCK
      ?auto_214516 - BLOCK
      ?auto_214509 - BLOCK
      ?auto_214514 - BLOCK
      ?auto_214512 - BLOCK
      ?auto_214513 - BLOCK
      ?auto_214511 - BLOCK
      ?auto_214510 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214508 ?auto_214515 ) ) ( ON-TABLE ?auto_214516 ) ( ON ?auto_214509 ?auto_214516 ) ( not ( = ?auto_214516 ?auto_214509 ) ) ( not ( = ?auto_214516 ?auto_214514 ) ) ( not ( = ?auto_214516 ?auto_214512 ) ) ( not ( = ?auto_214516 ?auto_214513 ) ) ( not ( = ?auto_214516 ?auto_214511 ) ) ( not ( = ?auto_214516 ?auto_214515 ) ) ( not ( = ?auto_214516 ?auto_214508 ) ) ( not ( = ?auto_214509 ?auto_214514 ) ) ( not ( = ?auto_214509 ?auto_214512 ) ) ( not ( = ?auto_214509 ?auto_214513 ) ) ( not ( = ?auto_214509 ?auto_214511 ) ) ( not ( = ?auto_214509 ?auto_214515 ) ) ( not ( = ?auto_214509 ?auto_214508 ) ) ( not ( = ?auto_214514 ?auto_214512 ) ) ( not ( = ?auto_214514 ?auto_214513 ) ) ( not ( = ?auto_214514 ?auto_214511 ) ) ( not ( = ?auto_214514 ?auto_214515 ) ) ( not ( = ?auto_214514 ?auto_214508 ) ) ( not ( = ?auto_214512 ?auto_214513 ) ) ( not ( = ?auto_214512 ?auto_214511 ) ) ( not ( = ?auto_214512 ?auto_214515 ) ) ( not ( = ?auto_214512 ?auto_214508 ) ) ( not ( = ?auto_214513 ?auto_214511 ) ) ( not ( = ?auto_214513 ?auto_214515 ) ) ( not ( = ?auto_214513 ?auto_214508 ) ) ( not ( = ?auto_214511 ?auto_214515 ) ) ( not ( = ?auto_214511 ?auto_214508 ) ) ( ON ?auto_214508 ?auto_214510 ) ( not ( = ?auto_214508 ?auto_214510 ) ) ( not ( = ?auto_214515 ?auto_214510 ) ) ( not ( = ?auto_214516 ?auto_214510 ) ) ( not ( = ?auto_214509 ?auto_214510 ) ) ( not ( = ?auto_214514 ?auto_214510 ) ) ( not ( = ?auto_214512 ?auto_214510 ) ) ( not ( = ?auto_214513 ?auto_214510 ) ) ( not ( = ?auto_214511 ?auto_214510 ) ) ( ON ?auto_214515 ?auto_214508 ) ( ON-TABLE ?auto_214510 ) ( ON ?auto_214511 ?auto_214515 ) ( ON ?auto_214513 ?auto_214511 ) ( ON ?auto_214512 ?auto_214513 ) ( CLEAR ?auto_214509 ) ( ON ?auto_214514 ?auto_214512 ) ( CLEAR ?auto_214514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214510 ?auto_214508 ?auto_214515 ?auto_214511 ?auto_214513 ?auto_214512 )
      ( MAKE-1PILE ?auto_214508 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214517 - BLOCK
    )
    :vars
    (
      ?auto_214519 - BLOCK
      ?auto_214524 - BLOCK
      ?auto_214523 - BLOCK
      ?auto_214520 - BLOCK
      ?auto_214518 - BLOCK
      ?auto_214521 - BLOCK
      ?auto_214522 - BLOCK
      ?auto_214525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214517 ?auto_214519 ) ) ( ON-TABLE ?auto_214524 ) ( not ( = ?auto_214524 ?auto_214523 ) ) ( not ( = ?auto_214524 ?auto_214520 ) ) ( not ( = ?auto_214524 ?auto_214518 ) ) ( not ( = ?auto_214524 ?auto_214521 ) ) ( not ( = ?auto_214524 ?auto_214522 ) ) ( not ( = ?auto_214524 ?auto_214519 ) ) ( not ( = ?auto_214524 ?auto_214517 ) ) ( not ( = ?auto_214523 ?auto_214520 ) ) ( not ( = ?auto_214523 ?auto_214518 ) ) ( not ( = ?auto_214523 ?auto_214521 ) ) ( not ( = ?auto_214523 ?auto_214522 ) ) ( not ( = ?auto_214523 ?auto_214519 ) ) ( not ( = ?auto_214523 ?auto_214517 ) ) ( not ( = ?auto_214520 ?auto_214518 ) ) ( not ( = ?auto_214520 ?auto_214521 ) ) ( not ( = ?auto_214520 ?auto_214522 ) ) ( not ( = ?auto_214520 ?auto_214519 ) ) ( not ( = ?auto_214520 ?auto_214517 ) ) ( not ( = ?auto_214518 ?auto_214521 ) ) ( not ( = ?auto_214518 ?auto_214522 ) ) ( not ( = ?auto_214518 ?auto_214519 ) ) ( not ( = ?auto_214518 ?auto_214517 ) ) ( not ( = ?auto_214521 ?auto_214522 ) ) ( not ( = ?auto_214521 ?auto_214519 ) ) ( not ( = ?auto_214521 ?auto_214517 ) ) ( not ( = ?auto_214522 ?auto_214519 ) ) ( not ( = ?auto_214522 ?auto_214517 ) ) ( ON ?auto_214517 ?auto_214525 ) ( not ( = ?auto_214517 ?auto_214525 ) ) ( not ( = ?auto_214519 ?auto_214525 ) ) ( not ( = ?auto_214524 ?auto_214525 ) ) ( not ( = ?auto_214523 ?auto_214525 ) ) ( not ( = ?auto_214520 ?auto_214525 ) ) ( not ( = ?auto_214518 ?auto_214525 ) ) ( not ( = ?auto_214521 ?auto_214525 ) ) ( not ( = ?auto_214522 ?auto_214525 ) ) ( ON ?auto_214519 ?auto_214517 ) ( ON-TABLE ?auto_214525 ) ( ON ?auto_214522 ?auto_214519 ) ( ON ?auto_214521 ?auto_214522 ) ( ON ?auto_214518 ?auto_214521 ) ( ON ?auto_214520 ?auto_214518 ) ( CLEAR ?auto_214520 ) ( HOLDING ?auto_214523 ) ( CLEAR ?auto_214524 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214524 ?auto_214523 )
      ( MAKE-1PILE ?auto_214517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214526 - BLOCK
    )
    :vars
    (
      ?auto_214530 - BLOCK
      ?auto_214531 - BLOCK
      ?auto_214532 - BLOCK
      ?auto_214527 - BLOCK
      ?auto_214534 - BLOCK
      ?auto_214529 - BLOCK
      ?auto_214528 - BLOCK
      ?auto_214533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214526 ?auto_214530 ) ) ( ON-TABLE ?auto_214531 ) ( not ( = ?auto_214531 ?auto_214532 ) ) ( not ( = ?auto_214531 ?auto_214527 ) ) ( not ( = ?auto_214531 ?auto_214534 ) ) ( not ( = ?auto_214531 ?auto_214529 ) ) ( not ( = ?auto_214531 ?auto_214528 ) ) ( not ( = ?auto_214531 ?auto_214530 ) ) ( not ( = ?auto_214531 ?auto_214526 ) ) ( not ( = ?auto_214532 ?auto_214527 ) ) ( not ( = ?auto_214532 ?auto_214534 ) ) ( not ( = ?auto_214532 ?auto_214529 ) ) ( not ( = ?auto_214532 ?auto_214528 ) ) ( not ( = ?auto_214532 ?auto_214530 ) ) ( not ( = ?auto_214532 ?auto_214526 ) ) ( not ( = ?auto_214527 ?auto_214534 ) ) ( not ( = ?auto_214527 ?auto_214529 ) ) ( not ( = ?auto_214527 ?auto_214528 ) ) ( not ( = ?auto_214527 ?auto_214530 ) ) ( not ( = ?auto_214527 ?auto_214526 ) ) ( not ( = ?auto_214534 ?auto_214529 ) ) ( not ( = ?auto_214534 ?auto_214528 ) ) ( not ( = ?auto_214534 ?auto_214530 ) ) ( not ( = ?auto_214534 ?auto_214526 ) ) ( not ( = ?auto_214529 ?auto_214528 ) ) ( not ( = ?auto_214529 ?auto_214530 ) ) ( not ( = ?auto_214529 ?auto_214526 ) ) ( not ( = ?auto_214528 ?auto_214530 ) ) ( not ( = ?auto_214528 ?auto_214526 ) ) ( ON ?auto_214526 ?auto_214533 ) ( not ( = ?auto_214526 ?auto_214533 ) ) ( not ( = ?auto_214530 ?auto_214533 ) ) ( not ( = ?auto_214531 ?auto_214533 ) ) ( not ( = ?auto_214532 ?auto_214533 ) ) ( not ( = ?auto_214527 ?auto_214533 ) ) ( not ( = ?auto_214534 ?auto_214533 ) ) ( not ( = ?auto_214529 ?auto_214533 ) ) ( not ( = ?auto_214528 ?auto_214533 ) ) ( ON ?auto_214530 ?auto_214526 ) ( ON-TABLE ?auto_214533 ) ( ON ?auto_214528 ?auto_214530 ) ( ON ?auto_214529 ?auto_214528 ) ( ON ?auto_214534 ?auto_214529 ) ( ON ?auto_214527 ?auto_214534 ) ( CLEAR ?auto_214531 ) ( ON ?auto_214532 ?auto_214527 ) ( CLEAR ?auto_214532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214533 ?auto_214526 ?auto_214530 ?auto_214528 ?auto_214529 ?auto_214534 ?auto_214527 )
      ( MAKE-1PILE ?auto_214526 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214535 - BLOCK
    )
    :vars
    (
      ?auto_214543 - BLOCK
      ?auto_214541 - BLOCK
      ?auto_214539 - BLOCK
      ?auto_214540 - BLOCK
      ?auto_214538 - BLOCK
      ?auto_214542 - BLOCK
      ?auto_214536 - BLOCK
      ?auto_214537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214535 ?auto_214543 ) ) ( not ( = ?auto_214541 ?auto_214539 ) ) ( not ( = ?auto_214541 ?auto_214540 ) ) ( not ( = ?auto_214541 ?auto_214538 ) ) ( not ( = ?auto_214541 ?auto_214542 ) ) ( not ( = ?auto_214541 ?auto_214536 ) ) ( not ( = ?auto_214541 ?auto_214543 ) ) ( not ( = ?auto_214541 ?auto_214535 ) ) ( not ( = ?auto_214539 ?auto_214540 ) ) ( not ( = ?auto_214539 ?auto_214538 ) ) ( not ( = ?auto_214539 ?auto_214542 ) ) ( not ( = ?auto_214539 ?auto_214536 ) ) ( not ( = ?auto_214539 ?auto_214543 ) ) ( not ( = ?auto_214539 ?auto_214535 ) ) ( not ( = ?auto_214540 ?auto_214538 ) ) ( not ( = ?auto_214540 ?auto_214542 ) ) ( not ( = ?auto_214540 ?auto_214536 ) ) ( not ( = ?auto_214540 ?auto_214543 ) ) ( not ( = ?auto_214540 ?auto_214535 ) ) ( not ( = ?auto_214538 ?auto_214542 ) ) ( not ( = ?auto_214538 ?auto_214536 ) ) ( not ( = ?auto_214538 ?auto_214543 ) ) ( not ( = ?auto_214538 ?auto_214535 ) ) ( not ( = ?auto_214542 ?auto_214536 ) ) ( not ( = ?auto_214542 ?auto_214543 ) ) ( not ( = ?auto_214542 ?auto_214535 ) ) ( not ( = ?auto_214536 ?auto_214543 ) ) ( not ( = ?auto_214536 ?auto_214535 ) ) ( ON ?auto_214535 ?auto_214537 ) ( not ( = ?auto_214535 ?auto_214537 ) ) ( not ( = ?auto_214543 ?auto_214537 ) ) ( not ( = ?auto_214541 ?auto_214537 ) ) ( not ( = ?auto_214539 ?auto_214537 ) ) ( not ( = ?auto_214540 ?auto_214537 ) ) ( not ( = ?auto_214538 ?auto_214537 ) ) ( not ( = ?auto_214542 ?auto_214537 ) ) ( not ( = ?auto_214536 ?auto_214537 ) ) ( ON ?auto_214543 ?auto_214535 ) ( ON-TABLE ?auto_214537 ) ( ON ?auto_214536 ?auto_214543 ) ( ON ?auto_214542 ?auto_214536 ) ( ON ?auto_214538 ?auto_214542 ) ( ON ?auto_214540 ?auto_214538 ) ( ON ?auto_214539 ?auto_214540 ) ( CLEAR ?auto_214539 ) ( HOLDING ?auto_214541 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_214541 )
      ( MAKE-1PILE ?auto_214535 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_214544 - BLOCK
    )
    :vars
    (
      ?auto_214551 - BLOCK
      ?auto_214552 - BLOCK
      ?auto_214546 - BLOCK
      ?auto_214549 - BLOCK
      ?auto_214550 - BLOCK
      ?auto_214548 - BLOCK
      ?auto_214547 - BLOCK
      ?auto_214545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214544 ?auto_214551 ) ) ( not ( = ?auto_214552 ?auto_214546 ) ) ( not ( = ?auto_214552 ?auto_214549 ) ) ( not ( = ?auto_214552 ?auto_214550 ) ) ( not ( = ?auto_214552 ?auto_214548 ) ) ( not ( = ?auto_214552 ?auto_214547 ) ) ( not ( = ?auto_214552 ?auto_214551 ) ) ( not ( = ?auto_214552 ?auto_214544 ) ) ( not ( = ?auto_214546 ?auto_214549 ) ) ( not ( = ?auto_214546 ?auto_214550 ) ) ( not ( = ?auto_214546 ?auto_214548 ) ) ( not ( = ?auto_214546 ?auto_214547 ) ) ( not ( = ?auto_214546 ?auto_214551 ) ) ( not ( = ?auto_214546 ?auto_214544 ) ) ( not ( = ?auto_214549 ?auto_214550 ) ) ( not ( = ?auto_214549 ?auto_214548 ) ) ( not ( = ?auto_214549 ?auto_214547 ) ) ( not ( = ?auto_214549 ?auto_214551 ) ) ( not ( = ?auto_214549 ?auto_214544 ) ) ( not ( = ?auto_214550 ?auto_214548 ) ) ( not ( = ?auto_214550 ?auto_214547 ) ) ( not ( = ?auto_214550 ?auto_214551 ) ) ( not ( = ?auto_214550 ?auto_214544 ) ) ( not ( = ?auto_214548 ?auto_214547 ) ) ( not ( = ?auto_214548 ?auto_214551 ) ) ( not ( = ?auto_214548 ?auto_214544 ) ) ( not ( = ?auto_214547 ?auto_214551 ) ) ( not ( = ?auto_214547 ?auto_214544 ) ) ( ON ?auto_214544 ?auto_214545 ) ( not ( = ?auto_214544 ?auto_214545 ) ) ( not ( = ?auto_214551 ?auto_214545 ) ) ( not ( = ?auto_214552 ?auto_214545 ) ) ( not ( = ?auto_214546 ?auto_214545 ) ) ( not ( = ?auto_214549 ?auto_214545 ) ) ( not ( = ?auto_214550 ?auto_214545 ) ) ( not ( = ?auto_214548 ?auto_214545 ) ) ( not ( = ?auto_214547 ?auto_214545 ) ) ( ON ?auto_214551 ?auto_214544 ) ( ON-TABLE ?auto_214545 ) ( ON ?auto_214547 ?auto_214551 ) ( ON ?auto_214548 ?auto_214547 ) ( ON ?auto_214550 ?auto_214548 ) ( ON ?auto_214549 ?auto_214550 ) ( ON ?auto_214546 ?auto_214549 ) ( ON ?auto_214552 ?auto_214546 ) ( CLEAR ?auto_214552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214545 ?auto_214544 ?auto_214551 ?auto_214547 ?auto_214548 ?auto_214550 ?auto_214549 ?auto_214546 )
      ( MAKE-1PILE ?auto_214544 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214559 - BLOCK
      ?auto_214560 - BLOCK
      ?auto_214561 - BLOCK
      ?auto_214562 - BLOCK
      ?auto_214563 - BLOCK
      ?auto_214564 - BLOCK
    )
    :vars
    (
      ?auto_214565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214565 ?auto_214564 ) ( CLEAR ?auto_214565 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214559 ) ( ON ?auto_214560 ?auto_214559 ) ( ON ?auto_214561 ?auto_214560 ) ( ON ?auto_214562 ?auto_214561 ) ( ON ?auto_214563 ?auto_214562 ) ( ON ?auto_214564 ?auto_214563 ) ( not ( = ?auto_214559 ?auto_214560 ) ) ( not ( = ?auto_214559 ?auto_214561 ) ) ( not ( = ?auto_214559 ?auto_214562 ) ) ( not ( = ?auto_214559 ?auto_214563 ) ) ( not ( = ?auto_214559 ?auto_214564 ) ) ( not ( = ?auto_214559 ?auto_214565 ) ) ( not ( = ?auto_214560 ?auto_214561 ) ) ( not ( = ?auto_214560 ?auto_214562 ) ) ( not ( = ?auto_214560 ?auto_214563 ) ) ( not ( = ?auto_214560 ?auto_214564 ) ) ( not ( = ?auto_214560 ?auto_214565 ) ) ( not ( = ?auto_214561 ?auto_214562 ) ) ( not ( = ?auto_214561 ?auto_214563 ) ) ( not ( = ?auto_214561 ?auto_214564 ) ) ( not ( = ?auto_214561 ?auto_214565 ) ) ( not ( = ?auto_214562 ?auto_214563 ) ) ( not ( = ?auto_214562 ?auto_214564 ) ) ( not ( = ?auto_214562 ?auto_214565 ) ) ( not ( = ?auto_214563 ?auto_214564 ) ) ( not ( = ?auto_214563 ?auto_214565 ) ) ( not ( = ?auto_214564 ?auto_214565 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214565 ?auto_214564 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214566 - BLOCK
      ?auto_214567 - BLOCK
      ?auto_214568 - BLOCK
      ?auto_214569 - BLOCK
      ?auto_214570 - BLOCK
      ?auto_214571 - BLOCK
    )
    :vars
    (
      ?auto_214572 - BLOCK
      ?auto_214573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214572 ?auto_214571 ) ( CLEAR ?auto_214572 ) ( ON-TABLE ?auto_214566 ) ( ON ?auto_214567 ?auto_214566 ) ( ON ?auto_214568 ?auto_214567 ) ( ON ?auto_214569 ?auto_214568 ) ( ON ?auto_214570 ?auto_214569 ) ( ON ?auto_214571 ?auto_214570 ) ( not ( = ?auto_214566 ?auto_214567 ) ) ( not ( = ?auto_214566 ?auto_214568 ) ) ( not ( = ?auto_214566 ?auto_214569 ) ) ( not ( = ?auto_214566 ?auto_214570 ) ) ( not ( = ?auto_214566 ?auto_214571 ) ) ( not ( = ?auto_214566 ?auto_214572 ) ) ( not ( = ?auto_214567 ?auto_214568 ) ) ( not ( = ?auto_214567 ?auto_214569 ) ) ( not ( = ?auto_214567 ?auto_214570 ) ) ( not ( = ?auto_214567 ?auto_214571 ) ) ( not ( = ?auto_214567 ?auto_214572 ) ) ( not ( = ?auto_214568 ?auto_214569 ) ) ( not ( = ?auto_214568 ?auto_214570 ) ) ( not ( = ?auto_214568 ?auto_214571 ) ) ( not ( = ?auto_214568 ?auto_214572 ) ) ( not ( = ?auto_214569 ?auto_214570 ) ) ( not ( = ?auto_214569 ?auto_214571 ) ) ( not ( = ?auto_214569 ?auto_214572 ) ) ( not ( = ?auto_214570 ?auto_214571 ) ) ( not ( = ?auto_214570 ?auto_214572 ) ) ( not ( = ?auto_214571 ?auto_214572 ) ) ( HOLDING ?auto_214573 ) ( not ( = ?auto_214566 ?auto_214573 ) ) ( not ( = ?auto_214567 ?auto_214573 ) ) ( not ( = ?auto_214568 ?auto_214573 ) ) ( not ( = ?auto_214569 ?auto_214573 ) ) ( not ( = ?auto_214570 ?auto_214573 ) ) ( not ( = ?auto_214571 ?auto_214573 ) ) ( not ( = ?auto_214572 ?auto_214573 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_214573 )
      ( MAKE-6PILE ?auto_214566 ?auto_214567 ?auto_214568 ?auto_214569 ?auto_214570 ?auto_214571 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214574 - BLOCK
      ?auto_214575 - BLOCK
      ?auto_214576 - BLOCK
      ?auto_214577 - BLOCK
      ?auto_214578 - BLOCK
      ?auto_214579 - BLOCK
    )
    :vars
    (
      ?auto_214580 - BLOCK
      ?auto_214581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214580 ?auto_214579 ) ( ON-TABLE ?auto_214574 ) ( ON ?auto_214575 ?auto_214574 ) ( ON ?auto_214576 ?auto_214575 ) ( ON ?auto_214577 ?auto_214576 ) ( ON ?auto_214578 ?auto_214577 ) ( ON ?auto_214579 ?auto_214578 ) ( not ( = ?auto_214574 ?auto_214575 ) ) ( not ( = ?auto_214574 ?auto_214576 ) ) ( not ( = ?auto_214574 ?auto_214577 ) ) ( not ( = ?auto_214574 ?auto_214578 ) ) ( not ( = ?auto_214574 ?auto_214579 ) ) ( not ( = ?auto_214574 ?auto_214580 ) ) ( not ( = ?auto_214575 ?auto_214576 ) ) ( not ( = ?auto_214575 ?auto_214577 ) ) ( not ( = ?auto_214575 ?auto_214578 ) ) ( not ( = ?auto_214575 ?auto_214579 ) ) ( not ( = ?auto_214575 ?auto_214580 ) ) ( not ( = ?auto_214576 ?auto_214577 ) ) ( not ( = ?auto_214576 ?auto_214578 ) ) ( not ( = ?auto_214576 ?auto_214579 ) ) ( not ( = ?auto_214576 ?auto_214580 ) ) ( not ( = ?auto_214577 ?auto_214578 ) ) ( not ( = ?auto_214577 ?auto_214579 ) ) ( not ( = ?auto_214577 ?auto_214580 ) ) ( not ( = ?auto_214578 ?auto_214579 ) ) ( not ( = ?auto_214578 ?auto_214580 ) ) ( not ( = ?auto_214579 ?auto_214580 ) ) ( not ( = ?auto_214574 ?auto_214581 ) ) ( not ( = ?auto_214575 ?auto_214581 ) ) ( not ( = ?auto_214576 ?auto_214581 ) ) ( not ( = ?auto_214577 ?auto_214581 ) ) ( not ( = ?auto_214578 ?auto_214581 ) ) ( not ( = ?auto_214579 ?auto_214581 ) ) ( not ( = ?auto_214580 ?auto_214581 ) ) ( ON ?auto_214581 ?auto_214580 ) ( CLEAR ?auto_214581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214574 ?auto_214575 ?auto_214576 ?auto_214577 ?auto_214578 ?auto_214579 ?auto_214580 )
      ( MAKE-6PILE ?auto_214574 ?auto_214575 ?auto_214576 ?auto_214577 ?auto_214578 ?auto_214579 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214582 - BLOCK
      ?auto_214583 - BLOCK
      ?auto_214584 - BLOCK
      ?auto_214585 - BLOCK
      ?auto_214586 - BLOCK
      ?auto_214587 - BLOCK
    )
    :vars
    (
      ?auto_214588 - BLOCK
      ?auto_214589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214588 ?auto_214587 ) ( ON-TABLE ?auto_214582 ) ( ON ?auto_214583 ?auto_214582 ) ( ON ?auto_214584 ?auto_214583 ) ( ON ?auto_214585 ?auto_214584 ) ( ON ?auto_214586 ?auto_214585 ) ( ON ?auto_214587 ?auto_214586 ) ( not ( = ?auto_214582 ?auto_214583 ) ) ( not ( = ?auto_214582 ?auto_214584 ) ) ( not ( = ?auto_214582 ?auto_214585 ) ) ( not ( = ?auto_214582 ?auto_214586 ) ) ( not ( = ?auto_214582 ?auto_214587 ) ) ( not ( = ?auto_214582 ?auto_214588 ) ) ( not ( = ?auto_214583 ?auto_214584 ) ) ( not ( = ?auto_214583 ?auto_214585 ) ) ( not ( = ?auto_214583 ?auto_214586 ) ) ( not ( = ?auto_214583 ?auto_214587 ) ) ( not ( = ?auto_214583 ?auto_214588 ) ) ( not ( = ?auto_214584 ?auto_214585 ) ) ( not ( = ?auto_214584 ?auto_214586 ) ) ( not ( = ?auto_214584 ?auto_214587 ) ) ( not ( = ?auto_214584 ?auto_214588 ) ) ( not ( = ?auto_214585 ?auto_214586 ) ) ( not ( = ?auto_214585 ?auto_214587 ) ) ( not ( = ?auto_214585 ?auto_214588 ) ) ( not ( = ?auto_214586 ?auto_214587 ) ) ( not ( = ?auto_214586 ?auto_214588 ) ) ( not ( = ?auto_214587 ?auto_214588 ) ) ( not ( = ?auto_214582 ?auto_214589 ) ) ( not ( = ?auto_214583 ?auto_214589 ) ) ( not ( = ?auto_214584 ?auto_214589 ) ) ( not ( = ?auto_214585 ?auto_214589 ) ) ( not ( = ?auto_214586 ?auto_214589 ) ) ( not ( = ?auto_214587 ?auto_214589 ) ) ( not ( = ?auto_214588 ?auto_214589 ) ) ( HOLDING ?auto_214589 ) ( CLEAR ?auto_214588 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214582 ?auto_214583 ?auto_214584 ?auto_214585 ?auto_214586 ?auto_214587 ?auto_214588 ?auto_214589 )
      ( MAKE-6PILE ?auto_214582 ?auto_214583 ?auto_214584 ?auto_214585 ?auto_214586 ?auto_214587 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214590 - BLOCK
      ?auto_214591 - BLOCK
      ?auto_214592 - BLOCK
      ?auto_214593 - BLOCK
      ?auto_214594 - BLOCK
      ?auto_214595 - BLOCK
    )
    :vars
    (
      ?auto_214596 - BLOCK
      ?auto_214597 - BLOCK
      ?auto_214598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214596 ?auto_214595 ) ( ON-TABLE ?auto_214590 ) ( ON ?auto_214591 ?auto_214590 ) ( ON ?auto_214592 ?auto_214591 ) ( ON ?auto_214593 ?auto_214592 ) ( ON ?auto_214594 ?auto_214593 ) ( ON ?auto_214595 ?auto_214594 ) ( not ( = ?auto_214590 ?auto_214591 ) ) ( not ( = ?auto_214590 ?auto_214592 ) ) ( not ( = ?auto_214590 ?auto_214593 ) ) ( not ( = ?auto_214590 ?auto_214594 ) ) ( not ( = ?auto_214590 ?auto_214595 ) ) ( not ( = ?auto_214590 ?auto_214596 ) ) ( not ( = ?auto_214591 ?auto_214592 ) ) ( not ( = ?auto_214591 ?auto_214593 ) ) ( not ( = ?auto_214591 ?auto_214594 ) ) ( not ( = ?auto_214591 ?auto_214595 ) ) ( not ( = ?auto_214591 ?auto_214596 ) ) ( not ( = ?auto_214592 ?auto_214593 ) ) ( not ( = ?auto_214592 ?auto_214594 ) ) ( not ( = ?auto_214592 ?auto_214595 ) ) ( not ( = ?auto_214592 ?auto_214596 ) ) ( not ( = ?auto_214593 ?auto_214594 ) ) ( not ( = ?auto_214593 ?auto_214595 ) ) ( not ( = ?auto_214593 ?auto_214596 ) ) ( not ( = ?auto_214594 ?auto_214595 ) ) ( not ( = ?auto_214594 ?auto_214596 ) ) ( not ( = ?auto_214595 ?auto_214596 ) ) ( not ( = ?auto_214590 ?auto_214597 ) ) ( not ( = ?auto_214591 ?auto_214597 ) ) ( not ( = ?auto_214592 ?auto_214597 ) ) ( not ( = ?auto_214593 ?auto_214597 ) ) ( not ( = ?auto_214594 ?auto_214597 ) ) ( not ( = ?auto_214595 ?auto_214597 ) ) ( not ( = ?auto_214596 ?auto_214597 ) ) ( CLEAR ?auto_214596 ) ( ON ?auto_214597 ?auto_214598 ) ( CLEAR ?auto_214597 ) ( HAND-EMPTY ) ( not ( = ?auto_214590 ?auto_214598 ) ) ( not ( = ?auto_214591 ?auto_214598 ) ) ( not ( = ?auto_214592 ?auto_214598 ) ) ( not ( = ?auto_214593 ?auto_214598 ) ) ( not ( = ?auto_214594 ?auto_214598 ) ) ( not ( = ?auto_214595 ?auto_214598 ) ) ( not ( = ?auto_214596 ?auto_214598 ) ) ( not ( = ?auto_214597 ?auto_214598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214597 ?auto_214598 )
      ( MAKE-6PILE ?auto_214590 ?auto_214591 ?auto_214592 ?auto_214593 ?auto_214594 ?auto_214595 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214617 - BLOCK
      ?auto_214618 - BLOCK
      ?auto_214619 - BLOCK
      ?auto_214620 - BLOCK
      ?auto_214621 - BLOCK
      ?auto_214622 - BLOCK
    )
    :vars
    (
      ?auto_214625 - BLOCK
      ?auto_214624 - BLOCK
      ?auto_214623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214617 ) ( ON ?auto_214618 ?auto_214617 ) ( ON ?auto_214619 ?auto_214618 ) ( ON ?auto_214620 ?auto_214619 ) ( ON ?auto_214621 ?auto_214620 ) ( not ( = ?auto_214617 ?auto_214618 ) ) ( not ( = ?auto_214617 ?auto_214619 ) ) ( not ( = ?auto_214617 ?auto_214620 ) ) ( not ( = ?auto_214617 ?auto_214621 ) ) ( not ( = ?auto_214617 ?auto_214622 ) ) ( not ( = ?auto_214617 ?auto_214625 ) ) ( not ( = ?auto_214618 ?auto_214619 ) ) ( not ( = ?auto_214618 ?auto_214620 ) ) ( not ( = ?auto_214618 ?auto_214621 ) ) ( not ( = ?auto_214618 ?auto_214622 ) ) ( not ( = ?auto_214618 ?auto_214625 ) ) ( not ( = ?auto_214619 ?auto_214620 ) ) ( not ( = ?auto_214619 ?auto_214621 ) ) ( not ( = ?auto_214619 ?auto_214622 ) ) ( not ( = ?auto_214619 ?auto_214625 ) ) ( not ( = ?auto_214620 ?auto_214621 ) ) ( not ( = ?auto_214620 ?auto_214622 ) ) ( not ( = ?auto_214620 ?auto_214625 ) ) ( not ( = ?auto_214621 ?auto_214622 ) ) ( not ( = ?auto_214621 ?auto_214625 ) ) ( not ( = ?auto_214622 ?auto_214625 ) ) ( not ( = ?auto_214617 ?auto_214624 ) ) ( not ( = ?auto_214618 ?auto_214624 ) ) ( not ( = ?auto_214619 ?auto_214624 ) ) ( not ( = ?auto_214620 ?auto_214624 ) ) ( not ( = ?auto_214621 ?auto_214624 ) ) ( not ( = ?auto_214622 ?auto_214624 ) ) ( not ( = ?auto_214625 ?auto_214624 ) ) ( ON ?auto_214624 ?auto_214623 ) ( not ( = ?auto_214617 ?auto_214623 ) ) ( not ( = ?auto_214618 ?auto_214623 ) ) ( not ( = ?auto_214619 ?auto_214623 ) ) ( not ( = ?auto_214620 ?auto_214623 ) ) ( not ( = ?auto_214621 ?auto_214623 ) ) ( not ( = ?auto_214622 ?auto_214623 ) ) ( not ( = ?auto_214625 ?auto_214623 ) ) ( not ( = ?auto_214624 ?auto_214623 ) ) ( ON ?auto_214625 ?auto_214624 ) ( CLEAR ?auto_214625 ) ( HOLDING ?auto_214622 ) ( CLEAR ?auto_214621 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214617 ?auto_214618 ?auto_214619 ?auto_214620 ?auto_214621 ?auto_214622 ?auto_214625 )
      ( MAKE-6PILE ?auto_214617 ?auto_214618 ?auto_214619 ?auto_214620 ?auto_214621 ?auto_214622 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214626 - BLOCK
      ?auto_214627 - BLOCK
      ?auto_214628 - BLOCK
      ?auto_214629 - BLOCK
      ?auto_214630 - BLOCK
      ?auto_214631 - BLOCK
    )
    :vars
    (
      ?auto_214634 - BLOCK
      ?auto_214632 - BLOCK
      ?auto_214633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214626 ) ( ON ?auto_214627 ?auto_214626 ) ( ON ?auto_214628 ?auto_214627 ) ( ON ?auto_214629 ?auto_214628 ) ( ON ?auto_214630 ?auto_214629 ) ( not ( = ?auto_214626 ?auto_214627 ) ) ( not ( = ?auto_214626 ?auto_214628 ) ) ( not ( = ?auto_214626 ?auto_214629 ) ) ( not ( = ?auto_214626 ?auto_214630 ) ) ( not ( = ?auto_214626 ?auto_214631 ) ) ( not ( = ?auto_214626 ?auto_214634 ) ) ( not ( = ?auto_214627 ?auto_214628 ) ) ( not ( = ?auto_214627 ?auto_214629 ) ) ( not ( = ?auto_214627 ?auto_214630 ) ) ( not ( = ?auto_214627 ?auto_214631 ) ) ( not ( = ?auto_214627 ?auto_214634 ) ) ( not ( = ?auto_214628 ?auto_214629 ) ) ( not ( = ?auto_214628 ?auto_214630 ) ) ( not ( = ?auto_214628 ?auto_214631 ) ) ( not ( = ?auto_214628 ?auto_214634 ) ) ( not ( = ?auto_214629 ?auto_214630 ) ) ( not ( = ?auto_214629 ?auto_214631 ) ) ( not ( = ?auto_214629 ?auto_214634 ) ) ( not ( = ?auto_214630 ?auto_214631 ) ) ( not ( = ?auto_214630 ?auto_214634 ) ) ( not ( = ?auto_214631 ?auto_214634 ) ) ( not ( = ?auto_214626 ?auto_214632 ) ) ( not ( = ?auto_214627 ?auto_214632 ) ) ( not ( = ?auto_214628 ?auto_214632 ) ) ( not ( = ?auto_214629 ?auto_214632 ) ) ( not ( = ?auto_214630 ?auto_214632 ) ) ( not ( = ?auto_214631 ?auto_214632 ) ) ( not ( = ?auto_214634 ?auto_214632 ) ) ( ON ?auto_214632 ?auto_214633 ) ( not ( = ?auto_214626 ?auto_214633 ) ) ( not ( = ?auto_214627 ?auto_214633 ) ) ( not ( = ?auto_214628 ?auto_214633 ) ) ( not ( = ?auto_214629 ?auto_214633 ) ) ( not ( = ?auto_214630 ?auto_214633 ) ) ( not ( = ?auto_214631 ?auto_214633 ) ) ( not ( = ?auto_214634 ?auto_214633 ) ) ( not ( = ?auto_214632 ?auto_214633 ) ) ( ON ?auto_214634 ?auto_214632 ) ( CLEAR ?auto_214630 ) ( ON ?auto_214631 ?auto_214634 ) ( CLEAR ?auto_214631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214633 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214633 ?auto_214632 ?auto_214634 )
      ( MAKE-6PILE ?auto_214626 ?auto_214627 ?auto_214628 ?auto_214629 ?auto_214630 ?auto_214631 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214635 - BLOCK
      ?auto_214636 - BLOCK
      ?auto_214637 - BLOCK
      ?auto_214638 - BLOCK
      ?auto_214639 - BLOCK
      ?auto_214640 - BLOCK
    )
    :vars
    (
      ?auto_214643 - BLOCK
      ?auto_214642 - BLOCK
      ?auto_214641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214635 ) ( ON ?auto_214636 ?auto_214635 ) ( ON ?auto_214637 ?auto_214636 ) ( ON ?auto_214638 ?auto_214637 ) ( not ( = ?auto_214635 ?auto_214636 ) ) ( not ( = ?auto_214635 ?auto_214637 ) ) ( not ( = ?auto_214635 ?auto_214638 ) ) ( not ( = ?auto_214635 ?auto_214639 ) ) ( not ( = ?auto_214635 ?auto_214640 ) ) ( not ( = ?auto_214635 ?auto_214643 ) ) ( not ( = ?auto_214636 ?auto_214637 ) ) ( not ( = ?auto_214636 ?auto_214638 ) ) ( not ( = ?auto_214636 ?auto_214639 ) ) ( not ( = ?auto_214636 ?auto_214640 ) ) ( not ( = ?auto_214636 ?auto_214643 ) ) ( not ( = ?auto_214637 ?auto_214638 ) ) ( not ( = ?auto_214637 ?auto_214639 ) ) ( not ( = ?auto_214637 ?auto_214640 ) ) ( not ( = ?auto_214637 ?auto_214643 ) ) ( not ( = ?auto_214638 ?auto_214639 ) ) ( not ( = ?auto_214638 ?auto_214640 ) ) ( not ( = ?auto_214638 ?auto_214643 ) ) ( not ( = ?auto_214639 ?auto_214640 ) ) ( not ( = ?auto_214639 ?auto_214643 ) ) ( not ( = ?auto_214640 ?auto_214643 ) ) ( not ( = ?auto_214635 ?auto_214642 ) ) ( not ( = ?auto_214636 ?auto_214642 ) ) ( not ( = ?auto_214637 ?auto_214642 ) ) ( not ( = ?auto_214638 ?auto_214642 ) ) ( not ( = ?auto_214639 ?auto_214642 ) ) ( not ( = ?auto_214640 ?auto_214642 ) ) ( not ( = ?auto_214643 ?auto_214642 ) ) ( ON ?auto_214642 ?auto_214641 ) ( not ( = ?auto_214635 ?auto_214641 ) ) ( not ( = ?auto_214636 ?auto_214641 ) ) ( not ( = ?auto_214637 ?auto_214641 ) ) ( not ( = ?auto_214638 ?auto_214641 ) ) ( not ( = ?auto_214639 ?auto_214641 ) ) ( not ( = ?auto_214640 ?auto_214641 ) ) ( not ( = ?auto_214643 ?auto_214641 ) ) ( not ( = ?auto_214642 ?auto_214641 ) ) ( ON ?auto_214643 ?auto_214642 ) ( ON ?auto_214640 ?auto_214643 ) ( CLEAR ?auto_214640 ) ( ON-TABLE ?auto_214641 ) ( HOLDING ?auto_214639 ) ( CLEAR ?auto_214638 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214635 ?auto_214636 ?auto_214637 ?auto_214638 ?auto_214639 )
      ( MAKE-6PILE ?auto_214635 ?auto_214636 ?auto_214637 ?auto_214638 ?auto_214639 ?auto_214640 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214644 - BLOCK
      ?auto_214645 - BLOCK
      ?auto_214646 - BLOCK
      ?auto_214647 - BLOCK
      ?auto_214648 - BLOCK
      ?auto_214649 - BLOCK
    )
    :vars
    (
      ?auto_214651 - BLOCK
      ?auto_214650 - BLOCK
      ?auto_214652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214644 ) ( ON ?auto_214645 ?auto_214644 ) ( ON ?auto_214646 ?auto_214645 ) ( ON ?auto_214647 ?auto_214646 ) ( not ( = ?auto_214644 ?auto_214645 ) ) ( not ( = ?auto_214644 ?auto_214646 ) ) ( not ( = ?auto_214644 ?auto_214647 ) ) ( not ( = ?auto_214644 ?auto_214648 ) ) ( not ( = ?auto_214644 ?auto_214649 ) ) ( not ( = ?auto_214644 ?auto_214651 ) ) ( not ( = ?auto_214645 ?auto_214646 ) ) ( not ( = ?auto_214645 ?auto_214647 ) ) ( not ( = ?auto_214645 ?auto_214648 ) ) ( not ( = ?auto_214645 ?auto_214649 ) ) ( not ( = ?auto_214645 ?auto_214651 ) ) ( not ( = ?auto_214646 ?auto_214647 ) ) ( not ( = ?auto_214646 ?auto_214648 ) ) ( not ( = ?auto_214646 ?auto_214649 ) ) ( not ( = ?auto_214646 ?auto_214651 ) ) ( not ( = ?auto_214647 ?auto_214648 ) ) ( not ( = ?auto_214647 ?auto_214649 ) ) ( not ( = ?auto_214647 ?auto_214651 ) ) ( not ( = ?auto_214648 ?auto_214649 ) ) ( not ( = ?auto_214648 ?auto_214651 ) ) ( not ( = ?auto_214649 ?auto_214651 ) ) ( not ( = ?auto_214644 ?auto_214650 ) ) ( not ( = ?auto_214645 ?auto_214650 ) ) ( not ( = ?auto_214646 ?auto_214650 ) ) ( not ( = ?auto_214647 ?auto_214650 ) ) ( not ( = ?auto_214648 ?auto_214650 ) ) ( not ( = ?auto_214649 ?auto_214650 ) ) ( not ( = ?auto_214651 ?auto_214650 ) ) ( ON ?auto_214650 ?auto_214652 ) ( not ( = ?auto_214644 ?auto_214652 ) ) ( not ( = ?auto_214645 ?auto_214652 ) ) ( not ( = ?auto_214646 ?auto_214652 ) ) ( not ( = ?auto_214647 ?auto_214652 ) ) ( not ( = ?auto_214648 ?auto_214652 ) ) ( not ( = ?auto_214649 ?auto_214652 ) ) ( not ( = ?auto_214651 ?auto_214652 ) ) ( not ( = ?auto_214650 ?auto_214652 ) ) ( ON ?auto_214651 ?auto_214650 ) ( ON ?auto_214649 ?auto_214651 ) ( ON-TABLE ?auto_214652 ) ( CLEAR ?auto_214647 ) ( ON ?auto_214648 ?auto_214649 ) ( CLEAR ?auto_214648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214652 ?auto_214650 ?auto_214651 ?auto_214649 )
      ( MAKE-6PILE ?auto_214644 ?auto_214645 ?auto_214646 ?auto_214647 ?auto_214648 ?auto_214649 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214653 - BLOCK
      ?auto_214654 - BLOCK
      ?auto_214655 - BLOCK
      ?auto_214656 - BLOCK
      ?auto_214657 - BLOCK
      ?auto_214658 - BLOCK
    )
    :vars
    (
      ?auto_214660 - BLOCK
      ?auto_214661 - BLOCK
      ?auto_214659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214653 ) ( ON ?auto_214654 ?auto_214653 ) ( ON ?auto_214655 ?auto_214654 ) ( not ( = ?auto_214653 ?auto_214654 ) ) ( not ( = ?auto_214653 ?auto_214655 ) ) ( not ( = ?auto_214653 ?auto_214656 ) ) ( not ( = ?auto_214653 ?auto_214657 ) ) ( not ( = ?auto_214653 ?auto_214658 ) ) ( not ( = ?auto_214653 ?auto_214660 ) ) ( not ( = ?auto_214654 ?auto_214655 ) ) ( not ( = ?auto_214654 ?auto_214656 ) ) ( not ( = ?auto_214654 ?auto_214657 ) ) ( not ( = ?auto_214654 ?auto_214658 ) ) ( not ( = ?auto_214654 ?auto_214660 ) ) ( not ( = ?auto_214655 ?auto_214656 ) ) ( not ( = ?auto_214655 ?auto_214657 ) ) ( not ( = ?auto_214655 ?auto_214658 ) ) ( not ( = ?auto_214655 ?auto_214660 ) ) ( not ( = ?auto_214656 ?auto_214657 ) ) ( not ( = ?auto_214656 ?auto_214658 ) ) ( not ( = ?auto_214656 ?auto_214660 ) ) ( not ( = ?auto_214657 ?auto_214658 ) ) ( not ( = ?auto_214657 ?auto_214660 ) ) ( not ( = ?auto_214658 ?auto_214660 ) ) ( not ( = ?auto_214653 ?auto_214661 ) ) ( not ( = ?auto_214654 ?auto_214661 ) ) ( not ( = ?auto_214655 ?auto_214661 ) ) ( not ( = ?auto_214656 ?auto_214661 ) ) ( not ( = ?auto_214657 ?auto_214661 ) ) ( not ( = ?auto_214658 ?auto_214661 ) ) ( not ( = ?auto_214660 ?auto_214661 ) ) ( ON ?auto_214661 ?auto_214659 ) ( not ( = ?auto_214653 ?auto_214659 ) ) ( not ( = ?auto_214654 ?auto_214659 ) ) ( not ( = ?auto_214655 ?auto_214659 ) ) ( not ( = ?auto_214656 ?auto_214659 ) ) ( not ( = ?auto_214657 ?auto_214659 ) ) ( not ( = ?auto_214658 ?auto_214659 ) ) ( not ( = ?auto_214660 ?auto_214659 ) ) ( not ( = ?auto_214661 ?auto_214659 ) ) ( ON ?auto_214660 ?auto_214661 ) ( ON ?auto_214658 ?auto_214660 ) ( ON-TABLE ?auto_214659 ) ( ON ?auto_214657 ?auto_214658 ) ( CLEAR ?auto_214657 ) ( HOLDING ?auto_214656 ) ( CLEAR ?auto_214655 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214653 ?auto_214654 ?auto_214655 ?auto_214656 )
      ( MAKE-6PILE ?auto_214653 ?auto_214654 ?auto_214655 ?auto_214656 ?auto_214657 ?auto_214658 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214662 - BLOCK
      ?auto_214663 - BLOCK
      ?auto_214664 - BLOCK
      ?auto_214665 - BLOCK
      ?auto_214666 - BLOCK
      ?auto_214667 - BLOCK
    )
    :vars
    (
      ?auto_214668 - BLOCK
      ?auto_214669 - BLOCK
      ?auto_214670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214662 ) ( ON ?auto_214663 ?auto_214662 ) ( ON ?auto_214664 ?auto_214663 ) ( not ( = ?auto_214662 ?auto_214663 ) ) ( not ( = ?auto_214662 ?auto_214664 ) ) ( not ( = ?auto_214662 ?auto_214665 ) ) ( not ( = ?auto_214662 ?auto_214666 ) ) ( not ( = ?auto_214662 ?auto_214667 ) ) ( not ( = ?auto_214662 ?auto_214668 ) ) ( not ( = ?auto_214663 ?auto_214664 ) ) ( not ( = ?auto_214663 ?auto_214665 ) ) ( not ( = ?auto_214663 ?auto_214666 ) ) ( not ( = ?auto_214663 ?auto_214667 ) ) ( not ( = ?auto_214663 ?auto_214668 ) ) ( not ( = ?auto_214664 ?auto_214665 ) ) ( not ( = ?auto_214664 ?auto_214666 ) ) ( not ( = ?auto_214664 ?auto_214667 ) ) ( not ( = ?auto_214664 ?auto_214668 ) ) ( not ( = ?auto_214665 ?auto_214666 ) ) ( not ( = ?auto_214665 ?auto_214667 ) ) ( not ( = ?auto_214665 ?auto_214668 ) ) ( not ( = ?auto_214666 ?auto_214667 ) ) ( not ( = ?auto_214666 ?auto_214668 ) ) ( not ( = ?auto_214667 ?auto_214668 ) ) ( not ( = ?auto_214662 ?auto_214669 ) ) ( not ( = ?auto_214663 ?auto_214669 ) ) ( not ( = ?auto_214664 ?auto_214669 ) ) ( not ( = ?auto_214665 ?auto_214669 ) ) ( not ( = ?auto_214666 ?auto_214669 ) ) ( not ( = ?auto_214667 ?auto_214669 ) ) ( not ( = ?auto_214668 ?auto_214669 ) ) ( ON ?auto_214669 ?auto_214670 ) ( not ( = ?auto_214662 ?auto_214670 ) ) ( not ( = ?auto_214663 ?auto_214670 ) ) ( not ( = ?auto_214664 ?auto_214670 ) ) ( not ( = ?auto_214665 ?auto_214670 ) ) ( not ( = ?auto_214666 ?auto_214670 ) ) ( not ( = ?auto_214667 ?auto_214670 ) ) ( not ( = ?auto_214668 ?auto_214670 ) ) ( not ( = ?auto_214669 ?auto_214670 ) ) ( ON ?auto_214668 ?auto_214669 ) ( ON ?auto_214667 ?auto_214668 ) ( ON-TABLE ?auto_214670 ) ( ON ?auto_214666 ?auto_214667 ) ( CLEAR ?auto_214664 ) ( ON ?auto_214665 ?auto_214666 ) ( CLEAR ?auto_214665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214670 ?auto_214669 ?auto_214668 ?auto_214667 ?auto_214666 )
      ( MAKE-6PILE ?auto_214662 ?auto_214663 ?auto_214664 ?auto_214665 ?auto_214666 ?auto_214667 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214671 - BLOCK
      ?auto_214672 - BLOCK
      ?auto_214673 - BLOCK
      ?auto_214674 - BLOCK
      ?auto_214675 - BLOCK
      ?auto_214676 - BLOCK
    )
    :vars
    (
      ?auto_214677 - BLOCK
      ?auto_214678 - BLOCK
      ?auto_214679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214671 ) ( ON ?auto_214672 ?auto_214671 ) ( not ( = ?auto_214671 ?auto_214672 ) ) ( not ( = ?auto_214671 ?auto_214673 ) ) ( not ( = ?auto_214671 ?auto_214674 ) ) ( not ( = ?auto_214671 ?auto_214675 ) ) ( not ( = ?auto_214671 ?auto_214676 ) ) ( not ( = ?auto_214671 ?auto_214677 ) ) ( not ( = ?auto_214672 ?auto_214673 ) ) ( not ( = ?auto_214672 ?auto_214674 ) ) ( not ( = ?auto_214672 ?auto_214675 ) ) ( not ( = ?auto_214672 ?auto_214676 ) ) ( not ( = ?auto_214672 ?auto_214677 ) ) ( not ( = ?auto_214673 ?auto_214674 ) ) ( not ( = ?auto_214673 ?auto_214675 ) ) ( not ( = ?auto_214673 ?auto_214676 ) ) ( not ( = ?auto_214673 ?auto_214677 ) ) ( not ( = ?auto_214674 ?auto_214675 ) ) ( not ( = ?auto_214674 ?auto_214676 ) ) ( not ( = ?auto_214674 ?auto_214677 ) ) ( not ( = ?auto_214675 ?auto_214676 ) ) ( not ( = ?auto_214675 ?auto_214677 ) ) ( not ( = ?auto_214676 ?auto_214677 ) ) ( not ( = ?auto_214671 ?auto_214678 ) ) ( not ( = ?auto_214672 ?auto_214678 ) ) ( not ( = ?auto_214673 ?auto_214678 ) ) ( not ( = ?auto_214674 ?auto_214678 ) ) ( not ( = ?auto_214675 ?auto_214678 ) ) ( not ( = ?auto_214676 ?auto_214678 ) ) ( not ( = ?auto_214677 ?auto_214678 ) ) ( ON ?auto_214678 ?auto_214679 ) ( not ( = ?auto_214671 ?auto_214679 ) ) ( not ( = ?auto_214672 ?auto_214679 ) ) ( not ( = ?auto_214673 ?auto_214679 ) ) ( not ( = ?auto_214674 ?auto_214679 ) ) ( not ( = ?auto_214675 ?auto_214679 ) ) ( not ( = ?auto_214676 ?auto_214679 ) ) ( not ( = ?auto_214677 ?auto_214679 ) ) ( not ( = ?auto_214678 ?auto_214679 ) ) ( ON ?auto_214677 ?auto_214678 ) ( ON ?auto_214676 ?auto_214677 ) ( ON-TABLE ?auto_214679 ) ( ON ?auto_214675 ?auto_214676 ) ( ON ?auto_214674 ?auto_214675 ) ( CLEAR ?auto_214674 ) ( HOLDING ?auto_214673 ) ( CLEAR ?auto_214672 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214671 ?auto_214672 ?auto_214673 )
      ( MAKE-6PILE ?auto_214671 ?auto_214672 ?auto_214673 ?auto_214674 ?auto_214675 ?auto_214676 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214680 - BLOCK
      ?auto_214681 - BLOCK
      ?auto_214682 - BLOCK
      ?auto_214683 - BLOCK
      ?auto_214684 - BLOCK
      ?auto_214685 - BLOCK
    )
    :vars
    (
      ?auto_214686 - BLOCK
      ?auto_214687 - BLOCK
      ?auto_214688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214680 ) ( ON ?auto_214681 ?auto_214680 ) ( not ( = ?auto_214680 ?auto_214681 ) ) ( not ( = ?auto_214680 ?auto_214682 ) ) ( not ( = ?auto_214680 ?auto_214683 ) ) ( not ( = ?auto_214680 ?auto_214684 ) ) ( not ( = ?auto_214680 ?auto_214685 ) ) ( not ( = ?auto_214680 ?auto_214686 ) ) ( not ( = ?auto_214681 ?auto_214682 ) ) ( not ( = ?auto_214681 ?auto_214683 ) ) ( not ( = ?auto_214681 ?auto_214684 ) ) ( not ( = ?auto_214681 ?auto_214685 ) ) ( not ( = ?auto_214681 ?auto_214686 ) ) ( not ( = ?auto_214682 ?auto_214683 ) ) ( not ( = ?auto_214682 ?auto_214684 ) ) ( not ( = ?auto_214682 ?auto_214685 ) ) ( not ( = ?auto_214682 ?auto_214686 ) ) ( not ( = ?auto_214683 ?auto_214684 ) ) ( not ( = ?auto_214683 ?auto_214685 ) ) ( not ( = ?auto_214683 ?auto_214686 ) ) ( not ( = ?auto_214684 ?auto_214685 ) ) ( not ( = ?auto_214684 ?auto_214686 ) ) ( not ( = ?auto_214685 ?auto_214686 ) ) ( not ( = ?auto_214680 ?auto_214687 ) ) ( not ( = ?auto_214681 ?auto_214687 ) ) ( not ( = ?auto_214682 ?auto_214687 ) ) ( not ( = ?auto_214683 ?auto_214687 ) ) ( not ( = ?auto_214684 ?auto_214687 ) ) ( not ( = ?auto_214685 ?auto_214687 ) ) ( not ( = ?auto_214686 ?auto_214687 ) ) ( ON ?auto_214687 ?auto_214688 ) ( not ( = ?auto_214680 ?auto_214688 ) ) ( not ( = ?auto_214681 ?auto_214688 ) ) ( not ( = ?auto_214682 ?auto_214688 ) ) ( not ( = ?auto_214683 ?auto_214688 ) ) ( not ( = ?auto_214684 ?auto_214688 ) ) ( not ( = ?auto_214685 ?auto_214688 ) ) ( not ( = ?auto_214686 ?auto_214688 ) ) ( not ( = ?auto_214687 ?auto_214688 ) ) ( ON ?auto_214686 ?auto_214687 ) ( ON ?auto_214685 ?auto_214686 ) ( ON-TABLE ?auto_214688 ) ( ON ?auto_214684 ?auto_214685 ) ( ON ?auto_214683 ?auto_214684 ) ( CLEAR ?auto_214681 ) ( ON ?auto_214682 ?auto_214683 ) ( CLEAR ?auto_214682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214688 ?auto_214687 ?auto_214686 ?auto_214685 ?auto_214684 ?auto_214683 )
      ( MAKE-6PILE ?auto_214680 ?auto_214681 ?auto_214682 ?auto_214683 ?auto_214684 ?auto_214685 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214689 - BLOCK
      ?auto_214690 - BLOCK
      ?auto_214691 - BLOCK
      ?auto_214692 - BLOCK
      ?auto_214693 - BLOCK
      ?auto_214694 - BLOCK
    )
    :vars
    (
      ?auto_214695 - BLOCK
      ?auto_214697 - BLOCK
      ?auto_214696 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214689 ) ( not ( = ?auto_214689 ?auto_214690 ) ) ( not ( = ?auto_214689 ?auto_214691 ) ) ( not ( = ?auto_214689 ?auto_214692 ) ) ( not ( = ?auto_214689 ?auto_214693 ) ) ( not ( = ?auto_214689 ?auto_214694 ) ) ( not ( = ?auto_214689 ?auto_214695 ) ) ( not ( = ?auto_214690 ?auto_214691 ) ) ( not ( = ?auto_214690 ?auto_214692 ) ) ( not ( = ?auto_214690 ?auto_214693 ) ) ( not ( = ?auto_214690 ?auto_214694 ) ) ( not ( = ?auto_214690 ?auto_214695 ) ) ( not ( = ?auto_214691 ?auto_214692 ) ) ( not ( = ?auto_214691 ?auto_214693 ) ) ( not ( = ?auto_214691 ?auto_214694 ) ) ( not ( = ?auto_214691 ?auto_214695 ) ) ( not ( = ?auto_214692 ?auto_214693 ) ) ( not ( = ?auto_214692 ?auto_214694 ) ) ( not ( = ?auto_214692 ?auto_214695 ) ) ( not ( = ?auto_214693 ?auto_214694 ) ) ( not ( = ?auto_214693 ?auto_214695 ) ) ( not ( = ?auto_214694 ?auto_214695 ) ) ( not ( = ?auto_214689 ?auto_214697 ) ) ( not ( = ?auto_214690 ?auto_214697 ) ) ( not ( = ?auto_214691 ?auto_214697 ) ) ( not ( = ?auto_214692 ?auto_214697 ) ) ( not ( = ?auto_214693 ?auto_214697 ) ) ( not ( = ?auto_214694 ?auto_214697 ) ) ( not ( = ?auto_214695 ?auto_214697 ) ) ( ON ?auto_214697 ?auto_214696 ) ( not ( = ?auto_214689 ?auto_214696 ) ) ( not ( = ?auto_214690 ?auto_214696 ) ) ( not ( = ?auto_214691 ?auto_214696 ) ) ( not ( = ?auto_214692 ?auto_214696 ) ) ( not ( = ?auto_214693 ?auto_214696 ) ) ( not ( = ?auto_214694 ?auto_214696 ) ) ( not ( = ?auto_214695 ?auto_214696 ) ) ( not ( = ?auto_214697 ?auto_214696 ) ) ( ON ?auto_214695 ?auto_214697 ) ( ON ?auto_214694 ?auto_214695 ) ( ON-TABLE ?auto_214696 ) ( ON ?auto_214693 ?auto_214694 ) ( ON ?auto_214692 ?auto_214693 ) ( ON ?auto_214691 ?auto_214692 ) ( CLEAR ?auto_214691 ) ( HOLDING ?auto_214690 ) ( CLEAR ?auto_214689 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214689 ?auto_214690 )
      ( MAKE-6PILE ?auto_214689 ?auto_214690 ?auto_214691 ?auto_214692 ?auto_214693 ?auto_214694 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214698 - BLOCK
      ?auto_214699 - BLOCK
      ?auto_214700 - BLOCK
      ?auto_214701 - BLOCK
      ?auto_214702 - BLOCK
      ?auto_214703 - BLOCK
    )
    :vars
    (
      ?auto_214704 - BLOCK
      ?auto_214705 - BLOCK
      ?auto_214706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214698 ) ( not ( = ?auto_214698 ?auto_214699 ) ) ( not ( = ?auto_214698 ?auto_214700 ) ) ( not ( = ?auto_214698 ?auto_214701 ) ) ( not ( = ?auto_214698 ?auto_214702 ) ) ( not ( = ?auto_214698 ?auto_214703 ) ) ( not ( = ?auto_214698 ?auto_214704 ) ) ( not ( = ?auto_214699 ?auto_214700 ) ) ( not ( = ?auto_214699 ?auto_214701 ) ) ( not ( = ?auto_214699 ?auto_214702 ) ) ( not ( = ?auto_214699 ?auto_214703 ) ) ( not ( = ?auto_214699 ?auto_214704 ) ) ( not ( = ?auto_214700 ?auto_214701 ) ) ( not ( = ?auto_214700 ?auto_214702 ) ) ( not ( = ?auto_214700 ?auto_214703 ) ) ( not ( = ?auto_214700 ?auto_214704 ) ) ( not ( = ?auto_214701 ?auto_214702 ) ) ( not ( = ?auto_214701 ?auto_214703 ) ) ( not ( = ?auto_214701 ?auto_214704 ) ) ( not ( = ?auto_214702 ?auto_214703 ) ) ( not ( = ?auto_214702 ?auto_214704 ) ) ( not ( = ?auto_214703 ?auto_214704 ) ) ( not ( = ?auto_214698 ?auto_214705 ) ) ( not ( = ?auto_214699 ?auto_214705 ) ) ( not ( = ?auto_214700 ?auto_214705 ) ) ( not ( = ?auto_214701 ?auto_214705 ) ) ( not ( = ?auto_214702 ?auto_214705 ) ) ( not ( = ?auto_214703 ?auto_214705 ) ) ( not ( = ?auto_214704 ?auto_214705 ) ) ( ON ?auto_214705 ?auto_214706 ) ( not ( = ?auto_214698 ?auto_214706 ) ) ( not ( = ?auto_214699 ?auto_214706 ) ) ( not ( = ?auto_214700 ?auto_214706 ) ) ( not ( = ?auto_214701 ?auto_214706 ) ) ( not ( = ?auto_214702 ?auto_214706 ) ) ( not ( = ?auto_214703 ?auto_214706 ) ) ( not ( = ?auto_214704 ?auto_214706 ) ) ( not ( = ?auto_214705 ?auto_214706 ) ) ( ON ?auto_214704 ?auto_214705 ) ( ON ?auto_214703 ?auto_214704 ) ( ON-TABLE ?auto_214706 ) ( ON ?auto_214702 ?auto_214703 ) ( ON ?auto_214701 ?auto_214702 ) ( ON ?auto_214700 ?auto_214701 ) ( CLEAR ?auto_214698 ) ( ON ?auto_214699 ?auto_214700 ) ( CLEAR ?auto_214699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214706 ?auto_214705 ?auto_214704 ?auto_214703 ?auto_214702 ?auto_214701 ?auto_214700 )
      ( MAKE-6PILE ?auto_214698 ?auto_214699 ?auto_214700 ?auto_214701 ?auto_214702 ?auto_214703 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214707 - BLOCK
      ?auto_214708 - BLOCK
      ?auto_214709 - BLOCK
      ?auto_214710 - BLOCK
      ?auto_214711 - BLOCK
      ?auto_214712 - BLOCK
    )
    :vars
    (
      ?auto_214714 - BLOCK
      ?auto_214713 - BLOCK
      ?auto_214715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214707 ?auto_214708 ) ) ( not ( = ?auto_214707 ?auto_214709 ) ) ( not ( = ?auto_214707 ?auto_214710 ) ) ( not ( = ?auto_214707 ?auto_214711 ) ) ( not ( = ?auto_214707 ?auto_214712 ) ) ( not ( = ?auto_214707 ?auto_214714 ) ) ( not ( = ?auto_214708 ?auto_214709 ) ) ( not ( = ?auto_214708 ?auto_214710 ) ) ( not ( = ?auto_214708 ?auto_214711 ) ) ( not ( = ?auto_214708 ?auto_214712 ) ) ( not ( = ?auto_214708 ?auto_214714 ) ) ( not ( = ?auto_214709 ?auto_214710 ) ) ( not ( = ?auto_214709 ?auto_214711 ) ) ( not ( = ?auto_214709 ?auto_214712 ) ) ( not ( = ?auto_214709 ?auto_214714 ) ) ( not ( = ?auto_214710 ?auto_214711 ) ) ( not ( = ?auto_214710 ?auto_214712 ) ) ( not ( = ?auto_214710 ?auto_214714 ) ) ( not ( = ?auto_214711 ?auto_214712 ) ) ( not ( = ?auto_214711 ?auto_214714 ) ) ( not ( = ?auto_214712 ?auto_214714 ) ) ( not ( = ?auto_214707 ?auto_214713 ) ) ( not ( = ?auto_214708 ?auto_214713 ) ) ( not ( = ?auto_214709 ?auto_214713 ) ) ( not ( = ?auto_214710 ?auto_214713 ) ) ( not ( = ?auto_214711 ?auto_214713 ) ) ( not ( = ?auto_214712 ?auto_214713 ) ) ( not ( = ?auto_214714 ?auto_214713 ) ) ( ON ?auto_214713 ?auto_214715 ) ( not ( = ?auto_214707 ?auto_214715 ) ) ( not ( = ?auto_214708 ?auto_214715 ) ) ( not ( = ?auto_214709 ?auto_214715 ) ) ( not ( = ?auto_214710 ?auto_214715 ) ) ( not ( = ?auto_214711 ?auto_214715 ) ) ( not ( = ?auto_214712 ?auto_214715 ) ) ( not ( = ?auto_214714 ?auto_214715 ) ) ( not ( = ?auto_214713 ?auto_214715 ) ) ( ON ?auto_214714 ?auto_214713 ) ( ON ?auto_214712 ?auto_214714 ) ( ON-TABLE ?auto_214715 ) ( ON ?auto_214711 ?auto_214712 ) ( ON ?auto_214710 ?auto_214711 ) ( ON ?auto_214709 ?auto_214710 ) ( ON ?auto_214708 ?auto_214709 ) ( CLEAR ?auto_214708 ) ( HOLDING ?auto_214707 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_214707 )
      ( MAKE-6PILE ?auto_214707 ?auto_214708 ?auto_214709 ?auto_214710 ?auto_214711 ?auto_214712 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_214716 - BLOCK
      ?auto_214717 - BLOCK
      ?auto_214718 - BLOCK
      ?auto_214719 - BLOCK
      ?auto_214720 - BLOCK
      ?auto_214721 - BLOCK
    )
    :vars
    (
      ?auto_214724 - BLOCK
      ?auto_214723 - BLOCK
      ?auto_214722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214716 ?auto_214717 ) ) ( not ( = ?auto_214716 ?auto_214718 ) ) ( not ( = ?auto_214716 ?auto_214719 ) ) ( not ( = ?auto_214716 ?auto_214720 ) ) ( not ( = ?auto_214716 ?auto_214721 ) ) ( not ( = ?auto_214716 ?auto_214724 ) ) ( not ( = ?auto_214717 ?auto_214718 ) ) ( not ( = ?auto_214717 ?auto_214719 ) ) ( not ( = ?auto_214717 ?auto_214720 ) ) ( not ( = ?auto_214717 ?auto_214721 ) ) ( not ( = ?auto_214717 ?auto_214724 ) ) ( not ( = ?auto_214718 ?auto_214719 ) ) ( not ( = ?auto_214718 ?auto_214720 ) ) ( not ( = ?auto_214718 ?auto_214721 ) ) ( not ( = ?auto_214718 ?auto_214724 ) ) ( not ( = ?auto_214719 ?auto_214720 ) ) ( not ( = ?auto_214719 ?auto_214721 ) ) ( not ( = ?auto_214719 ?auto_214724 ) ) ( not ( = ?auto_214720 ?auto_214721 ) ) ( not ( = ?auto_214720 ?auto_214724 ) ) ( not ( = ?auto_214721 ?auto_214724 ) ) ( not ( = ?auto_214716 ?auto_214723 ) ) ( not ( = ?auto_214717 ?auto_214723 ) ) ( not ( = ?auto_214718 ?auto_214723 ) ) ( not ( = ?auto_214719 ?auto_214723 ) ) ( not ( = ?auto_214720 ?auto_214723 ) ) ( not ( = ?auto_214721 ?auto_214723 ) ) ( not ( = ?auto_214724 ?auto_214723 ) ) ( ON ?auto_214723 ?auto_214722 ) ( not ( = ?auto_214716 ?auto_214722 ) ) ( not ( = ?auto_214717 ?auto_214722 ) ) ( not ( = ?auto_214718 ?auto_214722 ) ) ( not ( = ?auto_214719 ?auto_214722 ) ) ( not ( = ?auto_214720 ?auto_214722 ) ) ( not ( = ?auto_214721 ?auto_214722 ) ) ( not ( = ?auto_214724 ?auto_214722 ) ) ( not ( = ?auto_214723 ?auto_214722 ) ) ( ON ?auto_214724 ?auto_214723 ) ( ON ?auto_214721 ?auto_214724 ) ( ON-TABLE ?auto_214722 ) ( ON ?auto_214720 ?auto_214721 ) ( ON ?auto_214719 ?auto_214720 ) ( ON ?auto_214718 ?auto_214719 ) ( ON ?auto_214717 ?auto_214718 ) ( ON ?auto_214716 ?auto_214717 ) ( CLEAR ?auto_214716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214722 ?auto_214723 ?auto_214724 ?auto_214721 ?auto_214720 ?auto_214719 ?auto_214718 ?auto_214717 )
      ( MAKE-6PILE ?auto_214716 ?auto_214717 ?auto_214718 ?auto_214719 ?auto_214720 ?auto_214721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214727 - BLOCK
      ?auto_214728 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_214728 ) ( CLEAR ?auto_214727 ) ( ON-TABLE ?auto_214727 ) ( not ( = ?auto_214727 ?auto_214728 ) ) )
    :subtasks
    ( ( !STACK ?auto_214728 ?auto_214727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214729 - BLOCK
      ?auto_214730 - BLOCK
    )
    :vars
    (
      ?auto_214731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_214729 ) ( ON-TABLE ?auto_214729 ) ( not ( = ?auto_214729 ?auto_214730 ) ) ( ON ?auto_214730 ?auto_214731 ) ( CLEAR ?auto_214730 ) ( HAND-EMPTY ) ( not ( = ?auto_214729 ?auto_214731 ) ) ( not ( = ?auto_214730 ?auto_214731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214730 ?auto_214731 )
      ( MAKE-2PILE ?auto_214729 ?auto_214730 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214732 - BLOCK
      ?auto_214733 - BLOCK
    )
    :vars
    (
      ?auto_214734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214732 ?auto_214733 ) ) ( ON ?auto_214733 ?auto_214734 ) ( CLEAR ?auto_214733 ) ( not ( = ?auto_214732 ?auto_214734 ) ) ( not ( = ?auto_214733 ?auto_214734 ) ) ( HOLDING ?auto_214732 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_214732 )
      ( MAKE-2PILE ?auto_214732 ?auto_214733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214735 - BLOCK
      ?auto_214736 - BLOCK
    )
    :vars
    (
      ?auto_214737 - BLOCK
      ?auto_214742 - BLOCK
      ?auto_214739 - BLOCK
      ?auto_214738 - BLOCK
      ?auto_214740 - BLOCK
      ?auto_214741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214735 ?auto_214736 ) ) ( ON ?auto_214736 ?auto_214737 ) ( not ( = ?auto_214735 ?auto_214737 ) ) ( not ( = ?auto_214736 ?auto_214737 ) ) ( ON ?auto_214735 ?auto_214736 ) ( CLEAR ?auto_214735 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214742 ) ( ON ?auto_214739 ?auto_214742 ) ( ON ?auto_214738 ?auto_214739 ) ( ON ?auto_214740 ?auto_214738 ) ( ON ?auto_214741 ?auto_214740 ) ( ON ?auto_214737 ?auto_214741 ) ( not ( = ?auto_214742 ?auto_214739 ) ) ( not ( = ?auto_214742 ?auto_214738 ) ) ( not ( = ?auto_214742 ?auto_214740 ) ) ( not ( = ?auto_214742 ?auto_214741 ) ) ( not ( = ?auto_214742 ?auto_214737 ) ) ( not ( = ?auto_214742 ?auto_214736 ) ) ( not ( = ?auto_214742 ?auto_214735 ) ) ( not ( = ?auto_214739 ?auto_214738 ) ) ( not ( = ?auto_214739 ?auto_214740 ) ) ( not ( = ?auto_214739 ?auto_214741 ) ) ( not ( = ?auto_214739 ?auto_214737 ) ) ( not ( = ?auto_214739 ?auto_214736 ) ) ( not ( = ?auto_214739 ?auto_214735 ) ) ( not ( = ?auto_214738 ?auto_214740 ) ) ( not ( = ?auto_214738 ?auto_214741 ) ) ( not ( = ?auto_214738 ?auto_214737 ) ) ( not ( = ?auto_214738 ?auto_214736 ) ) ( not ( = ?auto_214738 ?auto_214735 ) ) ( not ( = ?auto_214740 ?auto_214741 ) ) ( not ( = ?auto_214740 ?auto_214737 ) ) ( not ( = ?auto_214740 ?auto_214736 ) ) ( not ( = ?auto_214740 ?auto_214735 ) ) ( not ( = ?auto_214741 ?auto_214737 ) ) ( not ( = ?auto_214741 ?auto_214736 ) ) ( not ( = ?auto_214741 ?auto_214735 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214742 ?auto_214739 ?auto_214738 ?auto_214740 ?auto_214741 ?auto_214737 ?auto_214736 )
      ( MAKE-2PILE ?auto_214735 ?auto_214736 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214743 - BLOCK
      ?auto_214744 - BLOCK
    )
    :vars
    (
      ?auto_214748 - BLOCK
      ?auto_214750 - BLOCK
      ?auto_214747 - BLOCK
      ?auto_214749 - BLOCK
      ?auto_214746 - BLOCK
      ?auto_214745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214743 ?auto_214744 ) ) ( ON ?auto_214744 ?auto_214748 ) ( not ( = ?auto_214743 ?auto_214748 ) ) ( not ( = ?auto_214744 ?auto_214748 ) ) ( ON-TABLE ?auto_214750 ) ( ON ?auto_214747 ?auto_214750 ) ( ON ?auto_214749 ?auto_214747 ) ( ON ?auto_214746 ?auto_214749 ) ( ON ?auto_214745 ?auto_214746 ) ( ON ?auto_214748 ?auto_214745 ) ( not ( = ?auto_214750 ?auto_214747 ) ) ( not ( = ?auto_214750 ?auto_214749 ) ) ( not ( = ?auto_214750 ?auto_214746 ) ) ( not ( = ?auto_214750 ?auto_214745 ) ) ( not ( = ?auto_214750 ?auto_214748 ) ) ( not ( = ?auto_214750 ?auto_214744 ) ) ( not ( = ?auto_214750 ?auto_214743 ) ) ( not ( = ?auto_214747 ?auto_214749 ) ) ( not ( = ?auto_214747 ?auto_214746 ) ) ( not ( = ?auto_214747 ?auto_214745 ) ) ( not ( = ?auto_214747 ?auto_214748 ) ) ( not ( = ?auto_214747 ?auto_214744 ) ) ( not ( = ?auto_214747 ?auto_214743 ) ) ( not ( = ?auto_214749 ?auto_214746 ) ) ( not ( = ?auto_214749 ?auto_214745 ) ) ( not ( = ?auto_214749 ?auto_214748 ) ) ( not ( = ?auto_214749 ?auto_214744 ) ) ( not ( = ?auto_214749 ?auto_214743 ) ) ( not ( = ?auto_214746 ?auto_214745 ) ) ( not ( = ?auto_214746 ?auto_214748 ) ) ( not ( = ?auto_214746 ?auto_214744 ) ) ( not ( = ?auto_214746 ?auto_214743 ) ) ( not ( = ?auto_214745 ?auto_214748 ) ) ( not ( = ?auto_214745 ?auto_214744 ) ) ( not ( = ?auto_214745 ?auto_214743 ) ) ( HOLDING ?auto_214743 ) ( CLEAR ?auto_214744 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214750 ?auto_214747 ?auto_214749 ?auto_214746 ?auto_214745 ?auto_214748 ?auto_214744 ?auto_214743 )
      ( MAKE-2PILE ?auto_214743 ?auto_214744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214751 - BLOCK
      ?auto_214752 - BLOCK
    )
    :vars
    (
      ?auto_214756 - BLOCK
      ?auto_214754 - BLOCK
      ?auto_214757 - BLOCK
      ?auto_214755 - BLOCK
      ?auto_214753 - BLOCK
      ?auto_214758 - BLOCK
      ?auto_214759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214751 ?auto_214752 ) ) ( ON ?auto_214752 ?auto_214756 ) ( not ( = ?auto_214751 ?auto_214756 ) ) ( not ( = ?auto_214752 ?auto_214756 ) ) ( ON-TABLE ?auto_214754 ) ( ON ?auto_214757 ?auto_214754 ) ( ON ?auto_214755 ?auto_214757 ) ( ON ?auto_214753 ?auto_214755 ) ( ON ?auto_214758 ?auto_214753 ) ( ON ?auto_214756 ?auto_214758 ) ( not ( = ?auto_214754 ?auto_214757 ) ) ( not ( = ?auto_214754 ?auto_214755 ) ) ( not ( = ?auto_214754 ?auto_214753 ) ) ( not ( = ?auto_214754 ?auto_214758 ) ) ( not ( = ?auto_214754 ?auto_214756 ) ) ( not ( = ?auto_214754 ?auto_214752 ) ) ( not ( = ?auto_214754 ?auto_214751 ) ) ( not ( = ?auto_214757 ?auto_214755 ) ) ( not ( = ?auto_214757 ?auto_214753 ) ) ( not ( = ?auto_214757 ?auto_214758 ) ) ( not ( = ?auto_214757 ?auto_214756 ) ) ( not ( = ?auto_214757 ?auto_214752 ) ) ( not ( = ?auto_214757 ?auto_214751 ) ) ( not ( = ?auto_214755 ?auto_214753 ) ) ( not ( = ?auto_214755 ?auto_214758 ) ) ( not ( = ?auto_214755 ?auto_214756 ) ) ( not ( = ?auto_214755 ?auto_214752 ) ) ( not ( = ?auto_214755 ?auto_214751 ) ) ( not ( = ?auto_214753 ?auto_214758 ) ) ( not ( = ?auto_214753 ?auto_214756 ) ) ( not ( = ?auto_214753 ?auto_214752 ) ) ( not ( = ?auto_214753 ?auto_214751 ) ) ( not ( = ?auto_214758 ?auto_214756 ) ) ( not ( = ?auto_214758 ?auto_214752 ) ) ( not ( = ?auto_214758 ?auto_214751 ) ) ( CLEAR ?auto_214752 ) ( ON ?auto_214751 ?auto_214759 ) ( CLEAR ?auto_214751 ) ( HAND-EMPTY ) ( not ( = ?auto_214751 ?auto_214759 ) ) ( not ( = ?auto_214752 ?auto_214759 ) ) ( not ( = ?auto_214756 ?auto_214759 ) ) ( not ( = ?auto_214754 ?auto_214759 ) ) ( not ( = ?auto_214757 ?auto_214759 ) ) ( not ( = ?auto_214755 ?auto_214759 ) ) ( not ( = ?auto_214753 ?auto_214759 ) ) ( not ( = ?auto_214758 ?auto_214759 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214751 ?auto_214759 )
      ( MAKE-2PILE ?auto_214751 ?auto_214752 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214760 - BLOCK
      ?auto_214761 - BLOCK
    )
    :vars
    (
      ?auto_214762 - BLOCK
      ?auto_214763 - BLOCK
      ?auto_214767 - BLOCK
      ?auto_214766 - BLOCK
      ?auto_214764 - BLOCK
      ?auto_214768 - BLOCK
      ?auto_214765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214760 ?auto_214761 ) ) ( not ( = ?auto_214760 ?auto_214762 ) ) ( not ( = ?auto_214761 ?auto_214762 ) ) ( ON-TABLE ?auto_214763 ) ( ON ?auto_214767 ?auto_214763 ) ( ON ?auto_214766 ?auto_214767 ) ( ON ?auto_214764 ?auto_214766 ) ( ON ?auto_214768 ?auto_214764 ) ( ON ?auto_214762 ?auto_214768 ) ( not ( = ?auto_214763 ?auto_214767 ) ) ( not ( = ?auto_214763 ?auto_214766 ) ) ( not ( = ?auto_214763 ?auto_214764 ) ) ( not ( = ?auto_214763 ?auto_214768 ) ) ( not ( = ?auto_214763 ?auto_214762 ) ) ( not ( = ?auto_214763 ?auto_214761 ) ) ( not ( = ?auto_214763 ?auto_214760 ) ) ( not ( = ?auto_214767 ?auto_214766 ) ) ( not ( = ?auto_214767 ?auto_214764 ) ) ( not ( = ?auto_214767 ?auto_214768 ) ) ( not ( = ?auto_214767 ?auto_214762 ) ) ( not ( = ?auto_214767 ?auto_214761 ) ) ( not ( = ?auto_214767 ?auto_214760 ) ) ( not ( = ?auto_214766 ?auto_214764 ) ) ( not ( = ?auto_214766 ?auto_214768 ) ) ( not ( = ?auto_214766 ?auto_214762 ) ) ( not ( = ?auto_214766 ?auto_214761 ) ) ( not ( = ?auto_214766 ?auto_214760 ) ) ( not ( = ?auto_214764 ?auto_214768 ) ) ( not ( = ?auto_214764 ?auto_214762 ) ) ( not ( = ?auto_214764 ?auto_214761 ) ) ( not ( = ?auto_214764 ?auto_214760 ) ) ( not ( = ?auto_214768 ?auto_214762 ) ) ( not ( = ?auto_214768 ?auto_214761 ) ) ( not ( = ?auto_214768 ?auto_214760 ) ) ( ON ?auto_214760 ?auto_214765 ) ( CLEAR ?auto_214760 ) ( not ( = ?auto_214760 ?auto_214765 ) ) ( not ( = ?auto_214761 ?auto_214765 ) ) ( not ( = ?auto_214762 ?auto_214765 ) ) ( not ( = ?auto_214763 ?auto_214765 ) ) ( not ( = ?auto_214767 ?auto_214765 ) ) ( not ( = ?auto_214766 ?auto_214765 ) ) ( not ( = ?auto_214764 ?auto_214765 ) ) ( not ( = ?auto_214768 ?auto_214765 ) ) ( HOLDING ?auto_214761 ) ( CLEAR ?auto_214762 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214763 ?auto_214767 ?auto_214766 ?auto_214764 ?auto_214768 ?auto_214762 ?auto_214761 )
      ( MAKE-2PILE ?auto_214760 ?auto_214761 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214769 - BLOCK
      ?auto_214770 - BLOCK
    )
    :vars
    (
      ?auto_214777 - BLOCK
      ?auto_214774 - BLOCK
      ?auto_214773 - BLOCK
      ?auto_214776 - BLOCK
      ?auto_214771 - BLOCK
      ?auto_214775 - BLOCK
      ?auto_214772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214769 ?auto_214770 ) ) ( not ( = ?auto_214769 ?auto_214777 ) ) ( not ( = ?auto_214770 ?auto_214777 ) ) ( ON-TABLE ?auto_214774 ) ( ON ?auto_214773 ?auto_214774 ) ( ON ?auto_214776 ?auto_214773 ) ( ON ?auto_214771 ?auto_214776 ) ( ON ?auto_214775 ?auto_214771 ) ( ON ?auto_214777 ?auto_214775 ) ( not ( = ?auto_214774 ?auto_214773 ) ) ( not ( = ?auto_214774 ?auto_214776 ) ) ( not ( = ?auto_214774 ?auto_214771 ) ) ( not ( = ?auto_214774 ?auto_214775 ) ) ( not ( = ?auto_214774 ?auto_214777 ) ) ( not ( = ?auto_214774 ?auto_214770 ) ) ( not ( = ?auto_214774 ?auto_214769 ) ) ( not ( = ?auto_214773 ?auto_214776 ) ) ( not ( = ?auto_214773 ?auto_214771 ) ) ( not ( = ?auto_214773 ?auto_214775 ) ) ( not ( = ?auto_214773 ?auto_214777 ) ) ( not ( = ?auto_214773 ?auto_214770 ) ) ( not ( = ?auto_214773 ?auto_214769 ) ) ( not ( = ?auto_214776 ?auto_214771 ) ) ( not ( = ?auto_214776 ?auto_214775 ) ) ( not ( = ?auto_214776 ?auto_214777 ) ) ( not ( = ?auto_214776 ?auto_214770 ) ) ( not ( = ?auto_214776 ?auto_214769 ) ) ( not ( = ?auto_214771 ?auto_214775 ) ) ( not ( = ?auto_214771 ?auto_214777 ) ) ( not ( = ?auto_214771 ?auto_214770 ) ) ( not ( = ?auto_214771 ?auto_214769 ) ) ( not ( = ?auto_214775 ?auto_214777 ) ) ( not ( = ?auto_214775 ?auto_214770 ) ) ( not ( = ?auto_214775 ?auto_214769 ) ) ( ON ?auto_214769 ?auto_214772 ) ( not ( = ?auto_214769 ?auto_214772 ) ) ( not ( = ?auto_214770 ?auto_214772 ) ) ( not ( = ?auto_214777 ?auto_214772 ) ) ( not ( = ?auto_214774 ?auto_214772 ) ) ( not ( = ?auto_214773 ?auto_214772 ) ) ( not ( = ?auto_214776 ?auto_214772 ) ) ( not ( = ?auto_214771 ?auto_214772 ) ) ( not ( = ?auto_214775 ?auto_214772 ) ) ( CLEAR ?auto_214777 ) ( ON ?auto_214770 ?auto_214769 ) ( CLEAR ?auto_214770 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214772 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214772 ?auto_214769 )
      ( MAKE-2PILE ?auto_214769 ?auto_214770 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214778 - BLOCK
      ?auto_214779 - BLOCK
    )
    :vars
    (
      ?auto_214785 - BLOCK
      ?auto_214784 - BLOCK
      ?auto_214786 - BLOCK
      ?auto_214783 - BLOCK
      ?auto_214782 - BLOCK
      ?auto_214781 - BLOCK
      ?auto_214780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214778 ?auto_214779 ) ) ( not ( = ?auto_214778 ?auto_214785 ) ) ( not ( = ?auto_214779 ?auto_214785 ) ) ( ON-TABLE ?auto_214784 ) ( ON ?auto_214786 ?auto_214784 ) ( ON ?auto_214783 ?auto_214786 ) ( ON ?auto_214782 ?auto_214783 ) ( ON ?auto_214781 ?auto_214782 ) ( not ( = ?auto_214784 ?auto_214786 ) ) ( not ( = ?auto_214784 ?auto_214783 ) ) ( not ( = ?auto_214784 ?auto_214782 ) ) ( not ( = ?auto_214784 ?auto_214781 ) ) ( not ( = ?auto_214784 ?auto_214785 ) ) ( not ( = ?auto_214784 ?auto_214779 ) ) ( not ( = ?auto_214784 ?auto_214778 ) ) ( not ( = ?auto_214786 ?auto_214783 ) ) ( not ( = ?auto_214786 ?auto_214782 ) ) ( not ( = ?auto_214786 ?auto_214781 ) ) ( not ( = ?auto_214786 ?auto_214785 ) ) ( not ( = ?auto_214786 ?auto_214779 ) ) ( not ( = ?auto_214786 ?auto_214778 ) ) ( not ( = ?auto_214783 ?auto_214782 ) ) ( not ( = ?auto_214783 ?auto_214781 ) ) ( not ( = ?auto_214783 ?auto_214785 ) ) ( not ( = ?auto_214783 ?auto_214779 ) ) ( not ( = ?auto_214783 ?auto_214778 ) ) ( not ( = ?auto_214782 ?auto_214781 ) ) ( not ( = ?auto_214782 ?auto_214785 ) ) ( not ( = ?auto_214782 ?auto_214779 ) ) ( not ( = ?auto_214782 ?auto_214778 ) ) ( not ( = ?auto_214781 ?auto_214785 ) ) ( not ( = ?auto_214781 ?auto_214779 ) ) ( not ( = ?auto_214781 ?auto_214778 ) ) ( ON ?auto_214778 ?auto_214780 ) ( not ( = ?auto_214778 ?auto_214780 ) ) ( not ( = ?auto_214779 ?auto_214780 ) ) ( not ( = ?auto_214785 ?auto_214780 ) ) ( not ( = ?auto_214784 ?auto_214780 ) ) ( not ( = ?auto_214786 ?auto_214780 ) ) ( not ( = ?auto_214783 ?auto_214780 ) ) ( not ( = ?auto_214782 ?auto_214780 ) ) ( not ( = ?auto_214781 ?auto_214780 ) ) ( ON ?auto_214779 ?auto_214778 ) ( CLEAR ?auto_214779 ) ( ON-TABLE ?auto_214780 ) ( HOLDING ?auto_214785 ) ( CLEAR ?auto_214781 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214784 ?auto_214786 ?auto_214783 ?auto_214782 ?auto_214781 ?auto_214785 )
      ( MAKE-2PILE ?auto_214778 ?auto_214779 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214787 - BLOCK
      ?auto_214788 - BLOCK
    )
    :vars
    (
      ?auto_214794 - BLOCK
      ?auto_214795 - BLOCK
      ?auto_214792 - BLOCK
      ?auto_214791 - BLOCK
      ?auto_214790 - BLOCK
      ?auto_214789 - BLOCK
      ?auto_214793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214787 ?auto_214788 ) ) ( not ( = ?auto_214787 ?auto_214794 ) ) ( not ( = ?auto_214788 ?auto_214794 ) ) ( ON-TABLE ?auto_214795 ) ( ON ?auto_214792 ?auto_214795 ) ( ON ?auto_214791 ?auto_214792 ) ( ON ?auto_214790 ?auto_214791 ) ( ON ?auto_214789 ?auto_214790 ) ( not ( = ?auto_214795 ?auto_214792 ) ) ( not ( = ?auto_214795 ?auto_214791 ) ) ( not ( = ?auto_214795 ?auto_214790 ) ) ( not ( = ?auto_214795 ?auto_214789 ) ) ( not ( = ?auto_214795 ?auto_214794 ) ) ( not ( = ?auto_214795 ?auto_214788 ) ) ( not ( = ?auto_214795 ?auto_214787 ) ) ( not ( = ?auto_214792 ?auto_214791 ) ) ( not ( = ?auto_214792 ?auto_214790 ) ) ( not ( = ?auto_214792 ?auto_214789 ) ) ( not ( = ?auto_214792 ?auto_214794 ) ) ( not ( = ?auto_214792 ?auto_214788 ) ) ( not ( = ?auto_214792 ?auto_214787 ) ) ( not ( = ?auto_214791 ?auto_214790 ) ) ( not ( = ?auto_214791 ?auto_214789 ) ) ( not ( = ?auto_214791 ?auto_214794 ) ) ( not ( = ?auto_214791 ?auto_214788 ) ) ( not ( = ?auto_214791 ?auto_214787 ) ) ( not ( = ?auto_214790 ?auto_214789 ) ) ( not ( = ?auto_214790 ?auto_214794 ) ) ( not ( = ?auto_214790 ?auto_214788 ) ) ( not ( = ?auto_214790 ?auto_214787 ) ) ( not ( = ?auto_214789 ?auto_214794 ) ) ( not ( = ?auto_214789 ?auto_214788 ) ) ( not ( = ?auto_214789 ?auto_214787 ) ) ( ON ?auto_214787 ?auto_214793 ) ( not ( = ?auto_214787 ?auto_214793 ) ) ( not ( = ?auto_214788 ?auto_214793 ) ) ( not ( = ?auto_214794 ?auto_214793 ) ) ( not ( = ?auto_214795 ?auto_214793 ) ) ( not ( = ?auto_214792 ?auto_214793 ) ) ( not ( = ?auto_214791 ?auto_214793 ) ) ( not ( = ?auto_214790 ?auto_214793 ) ) ( not ( = ?auto_214789 ?auto_214793 ) ) ( ON ?auto_214788 ?auto_214787 ) ( ON-TABLE ?auto_214793 ) ( CLEAR ?auto_214789 ) ( ON ?auto_214794 ?auto_214788 ) ( CLEAR ?auto_214794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214793 ?auto_214787 ?auto_214788 )
      ( MAKE-2PILE ?auto_214787 ?auto_214788 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214796 - BLOCK
      ?auto_214797 - BLOCK
    )
    :vars
    (
      ?auto_214800 - BLOCK
      ?auto_214801 - BLOCK
      ?auto_214803 - BLOCK
      ?auto_214799 - BLOCK
      ?auto_214802 - BLOCK
      ?auto_214798 - BLOCK
      ?auto_214804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214796 ?auto_214797 ) ) ( not ( = ?auto_214796 ?auto_214800 ) ) ( not ( = ?auto_214797 ?auto_214800 ) ) ( ON-TABLE ?auto_214801 ) ( ON ?auto_214803 ?auto_214801 ) ( ON ?auto_214799 ?auto_214803 ) ( ON ?auto_214802 ?auto_214799 ) ( not ( = ?auto_214801 ?auto_214803 ) ) ( not ( = ?auto_214801 ?auto_214799 ) ) ( not ( = ?auto_214801 ?auto_214802 ) ) ( not ( = ?auto_214801 ?auto_214798 ) ) ( not ( = ?auto_214801 ?auto_214800 ) ) ( not ( = ?auto_214801 ?auto_214797 ) ) ( not ( = ?auto_214801 ?auto_214796 ) ) ( not ( = ?auto_214803 ?auto_214799 ) ) ( not ( = ?auto_214803 ?auto_214802 ) ) ( not ( = ?auto_214803 ?auto_214798 ) ) ( not ( = ?auto_214803 ?auto_214800 ) ) ( not ( = ?auto_214803 ?auto_214797 ) ) ( not ( = ?auto_214803 ?auto_214796 ) ) ( not ( = ?auto_214799 ?auto_214802 ) ) ( not ( = ?auto_214799 ?auto_214798 ) ) ( not ( = ?auto_214799 ?auto_214800 ) ) ( not ( = ?auto_214799 ?auto_214797 ) ) ( not ( = ?auto_214799 ?auto_214796 ) ) ( not ( = ?auto_214802 ?auto_214798 ) ) ( not ( = ?auto_214802 ?auto_214800 ) ) ( not ( = ?auto_214802 ?auto_214797 ) ) ( not ( = ?auto_214802 ?auto_214796 ) ) ( not ( = ?auto_214798 ?auto_214800 ) ) ( not ( = ?auto_214798 ?auto_214797 ) ) ( not ( = ?auto_214798 ?auto_214796 ) ) ( ON ?auto_214796 ?auto_214804 ) ( not ( = ?auto_214796 ?auto_214804 ) ) ( not ( = ?auto_214797 ?auto_214804 ) ) ( not ( = ?auto_214800 ?auto_214804 ) ) ( not ( = ?auto_214801 ?auto_214804 ) ) ( not ( = ?auto_214803 ?auto_214804 ) ) ( not ( = ?auto_214799 ?auto_214804 ) ) ( not ( = ?auto_214802 ?auto_214804 ) ) ( not ( = ?auto_214798 ?auto_214804 ) ) ( ON ?auto_214797 ?auto_214796 ) ( ON-TABLE ?auto_214804 ) ( ON ?auto_214800 ?auto_214797 ) ( CLEAR ?auto_214800 ) ( HOLDING ?auto_214798 ) ( CLEAR ?auto_214802 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214801 ?auto_214803 ?auto_214799 ?auto_214802 ?auto_214798 )
      ( MAKE-2PILE ?auto_214796 ?auto_214797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214805 - BLOCK
      ?auto_214806 - BLOCK
    )
    :vars
    (
      ?auto_214809 - BLOCK
      ?auto_214810 - BLOCK
      ?auto_214807 - BLOCK
      ?auto_214812 - BLOCK
      ?auto_214808 - BLOCK
      ?auto_214811 - BLOCK
      ?auto_214813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214805 ?auto_214806 ) ) ( not ( = ?auto_214805 ?auto_214809 ) ) ( not ( = ?auto_214806 ?auto_214809 ) ) ( ON-TABLE ?auto_214810 ) ( ON ?auto_214807 ?auto_214810 ) ( ON ?auto_214812 ?auto_214807 ) ( ON ?auto_214808 ?auto_214812 ) ( not ( = ?auto_214810 ?auto_214807 ) ) ( not ( = ?auto_214810 ?auto_214812 ) ) ( not ( = ?auto_214810 ?auto_214808 ) ) ( not ( = ?auto_214810 ?auto_214811 ) ) ( not ( = ?auto_214810 ?auto_214809 ) ) ( not ( = ?auto_214810 ?auto_214806 ) ) ( not ( = ?auto_214810 ?auto_214805 ) ) ( not ( = ?auto_214807 ?auto_214812 ) ) ( not ( = ?auto_214807 ?auto_214808 ) ) ( not ( = ?auto_214807 ?auto_214811 ) ) ( not ( = ?auto_214807 ?auto_214809 ) ) ( not ( = ?auto_214807 ?auto_214806 ) ) ( not ( = ?auto_214807 ?auto_214805 ) ) ( not ( = ?auto_214812 ?auto_214808 ) ) ( not ( = ?auto_214812 ?auto_214811 ) ) ( not ( = ?auto_214812 ?auto_214809 ) ) ( not ( = ?auto_214812 ?auto_214806 ) ) ( not ( = ?auto_214812 ?auto_214805 ) ) ( not ( = ?auto_214808 ?auto_214811 ) ) ( not ( = ?auto_214808 ?auto_214809 ) ) ( not ( = ?auto_214808 ?auto_214806 ) ) ( not ( = ?auto_214808 ?auto_214805 ) ) ( not ( = ?auto_214811 ?auto_214809 ) ) ( not ( = ?auto_214811 ?auto_214806 ) ) ( not ( = ?auto_214811 ?auto_214805 ) ) ( ON ?auto_214805 ?auto_214813 ) ( not ( = ?auto_214805 ?auto_214813 ) ) ( not ( = ?auto_214806 ?auto_214813 ) ) ( not ( = ?auto_214809 ?auto_214813 ) ) ( not ( = ?auto_214810 ?auto_214813 ) ) ( not ( = ?auto_214807 ?auto_214813 ) ) ( not ( = ?auto_214812 ?auto_214813 ) ) ( not ( = ?auto_214808 ?auto_214813 ) ) ( not ( = ?auto_214811 ?auto_214813 ) ) ( ON ?auto_214806 ?auto_214805 ) ( ON-TABLE ?auto_214813 ) ( ON ?auto_214809 ?auto_214806 ) ( CLEAR ?auto_214808 ) ( ON ?auto_214811 ?auto_214809 ) ( CLEAR ?auto_214811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214813 ?auto_214805 ?auto_214806 ?auto_214809 )
      ( MAKE-2PILE ?auto_214805 ?auto_214806 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214814 - BLOCK
      ?auto_214815 - BLOCK
    )
    :vars
    (
      ?auto_214816 - BLOCK
      ?auto_214817 - BLOCK
      ?auto_214820 - BLOCK
      ?auto_214821 - BLOCK
      ?auto_214818 - BLOCK
      ?auto_214822 - BLOCK
      ?auto_214819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214814 ?auto_214815 ) ) ( not ( = ?auto_214814 ?auto_214816 ) ) ( not ( = ?auto_214815 ?auto_214816 ) ) ( ON-TABLE ?auto_214817 ) ( ON ?auto_214820 ?auto_214817 ) ( ON ?auto_214821 ?auto_214820 ) ( not ( = ?auto_214817 ?auto_214820 ) ) ( not ( = ?auto_214817 ?auto_214821 ) ) ( not ( = ?auto_214817 ?auto_214818 ) ) ( not ( = ?auto_214817 ?auto_214822 ) ) ( not ( = ?auto_214817 ?auto_214816 ) ) ( not ( = ?auto_214817 ?auto_214815 ) ) ( not ( = ?auto_214817 ?auto_214814 ) ) ( not ( = ?auto_214820 ?auto_214821 ) ) ( not ( = ?auto_214820 ?auto_214818 ) ) ( not ( = ?auto_214820 ?auto_214822 ) ) ( not ( = ?auto_214820 ?auto_214816 ) ) ( not ( = ?auto_214820 ?auto_214815 ) ) ( not ( = ?auto_214820 ?auto_214814 ) ) ( not ( = ?auto_214821 ?auto_214818 ) ) ( not ( = ?auto_214821 ?auto_214822 ) ) ( not ( = ?auto_214821 ?auto_214816 ) ) ( not ( = ?auto_214821 ?auto_214815 ) ) ( not ( = ?auto_214821 ?auto_214814 ) ) ( not ( = ?auto_214818 ?auto_214822 ) ) ( not ( = ?auto_214818 ?auto_214816 ) ) ( not ( = ?auto_214818 ?auto_214815 ) ) ( not ( = ?auto_214818 ?auto_214814 ) ) ( not ( = ?auto_214822 ?auto_214816 ) ) ( not ( = ?auto_214822 ?auto_214815 ) ) ( not ( = ?auto_214822 ?auto_214814 ) ) ( ON ?auto_214814 ?auto_214819 ) ( not ( = ?auto_214814 ?auto_214819 ) ) ( not ( = ?auto_214815 ?auto_214819 ) ) ( not ( = ?auto_214816 ?auto_214819 ) ) ( not ( = ?auto_214817 ?auto_214819 ) ) ( not ( = ?auto_214820 ?auto_214819 ) ) ( not ( = ?auto_214821 ?auto_214819 ) ) ( not ( = ?auto_214818 ?auto_214819 ) ) ( not ( = ?auto_214822 ?auto_214819 ) ) ( ON ?auto_214815 ?auto_214814 ) ( ON-TABLE ?auto_214819 ) ( ON ?auto_214816 ?auto_214815 ) ( ON ?auto_214822 ?auto_214816 ) ( CLEAR ?auto_214822 ) ( HOLDING ?auto_214818 ) ( CLEAR ?auto_214821 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214817 ?auto_214820 ?auto_214821 ?auto_214818 )
      ( MAKE-2PILE ?auto_214814 ?auto_214815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214823 - BLOCK
      ?auto_214824 - BLOCK
    )
    :vars
    (
      ?auto_214825 - BLOCK
      ?auto_214826 - BLOCK
      ?auto_214829 - BLOCK
      ?auto_214830 - BLOCK
      ?auto_214827 - BLOCK
      ?auto_214828 - BLOCK
      ?auto_214831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214823 ?auto_214824 ) ) ( not ( = ?auto_214823 ?auto_214825 ) ) ( not ( = ?auto_214824 ?auto_214825 ) ) ( ON-TABLE ?auto_214826 ) ( ON ?auto_214829 ?auto_214826 ) ( ON ?auto_214830 ?auto_214829 ) ( not ( = ?auto_214826 ?auto_214829 ) ) ( not ( = ?auto_214826 ?auto_214830 ) ) ( not ( = ?auto_214826 ?auto_214827 ) ) ( not ( = ?auto_214826 ?auto_214828 ) ) ( not ( = ?auto_214826 ?auto_214825 ) ) ( not ( = ?auto_214826 ?auto_214824 ) ) ( not ( = ?auto_214826 ?auto_214823 ) ) ( not ( = ?auto_214829 ?auto_214830 ) ) ( not ( = ?auto_214829 ?auto_214827 ) ) ( not ( = ?auto_214829 ?auto_214828 ) ) ( not ( = ?auto_214829 ?auto_214825 ) ) ( not ( = ?auto_214829 ?auto_214824 ) ) ( not ( = ?auto_214829 ?auto_214823 ) ) ( not ( = ?auto_214830 ?auto_214827 ) ) ( not ( = ?auto_214830 ?auto_214828 ) ) ( not ( = ?auto_214830 ?auto_214825 ) ) ( not ( = ?auto_214830 ?auto_214824 ) ) ( not ( = ?auto_214830 ?auto_214823 ) ) ( not ( = ?auto_214827 ?auto_214828 ) ) ( not ( = ?auto_214827 ?auto_214825 ) ) ( not ( = ?auto_214827 ?auto_214824 ) ) ( not ( = ?auto_214827 ?auto_214823 ) ) ( not ( = ?auto_214828 ?auto_214825 ) ) ( not ( = ?auto_214828 ?auto_214824 ) ) ( not ( = ?auto_214828 ?auto_214823 ) ) ( ON ?auto_214823 ?auto_214831 ) ( not ( = ?auto_214823 ?auto_214831 ) ) ( not ( = ?auto_214824 ?auto_214831 ) ) ( not ( = ?auto_214825 ?auto_214831 ) ) ( not ( = ?auto_214826 ?auto_214831 ) ) ( not ( = ?auto_214829 ?auto_214831 ) ) ( not ( = ?auto_214830 ?auto_214831 ) ) ( not ( = ?auto_214827 ?auto_214831 ) ) ( not ( = ?auto_214828 ?auto_214831 ) ) ( ON ?auto_214824 ?auto_214823 ) ( ON-TABLE ?auto_214831 ) ( ON ?auto_214825 ?auto_214824 ) ( ON ?auto_214828 ?auto_214825 ) ( CLEAR ?auto_214830 ) ( ON ?auto_214827 ?auto_214828 ) ( CLEAR ?auto_214827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214831 ?auto_214823 ?auto_214824 ?auto_214825 ?auto_214828 )
      ( MAKE-2PILE ?auto_214823 ?auto_214824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214832 - BLOCK
      ?auto_214833 - BLOCK
    )
    :vars
    (
      ?auto_214839 - BLOCK
      ?auto_214836 - BLOCK
      ?auto_214838 - BLOCK
      ?auto_214840 - BLOCK
      ?auto_214835 - BLOCK
      ?auto_214834 - BLOCK
      ?auto_214837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214832 ?auto_214833 ) ) ( not ( = ?auto_214832 ?auto_214839 ) ) ( not ( = ?auto_214833 ?auto_214839 ) ) ( ON-TABLE ?auto_214836 ) ( ON ?auto_214838 ?auto_214836 ) ( not ( = ?auto_214836 ?auto_214838 ) ) ( not ( = ?auto_214836 ?auto_214840 ) ) ( not ( = ?auto_214836 ?auto_214835 ) ) ( not ( = ?auto_214836 ?auto_214834 ) ) ( not ( = ?auto_214836 ?auto_214839 ) ) ( not ( = ?auto_214836 ?auto_214833 ) ) ( not ( = ?auto_214836 ?auto_214832 ) ) ( not ( = ?auto_214838 ?auto_214840 ) ) ( not ( = ?auto_214838 ?auto_214835 ) ) ( not ( = ?auto_214838 ?auto_214834 ) ) ( not ( = ?auto_214838 ?auto_214839 ) ) ( not ( = ?auto_214838 ?auto_214833 ) ) ( not ( = ?auto_214838 ?auto_214832 ) ) ( not ( = ?auto_214840 ?auto_214835 ) ) ( not ( = ?auto_214840 ?auto_214834 ) ) ( not ( = ?auto_214840 ?auto_214839 ) ) ( not ( = ?auto_214840 ?auto_214833 ) ) ( not ( = ?auto_214840 ?auto_214832 ) ) ( not ( = ?auto_214835 ?auto_214834 ) ) ( not ( = ?auto_214835 ?auto_214839 ) ) ( not ( = ?auto_214835 ?auto_214833 ) ) ( not ( = ?auto_214835 ?auto_214832 ) ) ( not ( = ?auto_214834 ?auto_214839 ) ) ( not ( = ?auto_214834 ?auto_214833 ) ) ( not ( = ?auto_214834 ?auto_214832 ) ) ( ON ?auto_214832 ?auto_214837 ) ( not ( = ?auto_214832 ?auto_214837 ) ) ( not ( = ?auto_214833 ?auto_214837 ) ) ( not ( = ?auto_214839 ?auto_214837 ) ) ( not ( = ?auto_214836 ?auto_214837 ) ) ( not ( = ?auto_214838 ?auto_214837 ) ) ( not ( = ?auto_214840 ?auto_214837 ) ) ( not ( = ?auto_214835 ?auto_214837 ) ) ( not ( = ?auto_214834 ?auto_214837 ) ) ( ON ?auto_214833 ?auto_214832 ) ( ON-TABLE ?auto_214837 ) ( ON ?auto_214839 ?auto_214833 ) ( ON ?auto_214834 ?auto_214839 ) ( ON ?auto_214835 ?auto_214834 ) ( CLEAR ?auto_214835 ) ( HOLDING ?auto_214840 ) ( CLEAR ?auto_214838 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214836 ?auto_214838 ?auto_214840 )
      ( MAKE-2PILE ?auto_214832 ?auto_214833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214841 - BLOCK
      ?auto_214842 - BLOCK
    )
    :vars
    (
      ?auto_214847 - BLOCK
      ?auto_214845 - BLOCK
      ?auto_214844 - BLOCK
      ?auto_214849 - BLOCK
      ?auto_214848 - BLOCK
      ?auto_214843 - BLOCK
      ?auto_214846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214841 ?auto_214842 ) ) ( not ( = ?auto_214841 ?auto_214847 ) ) ( not ( = ?auto_214842 ?auto_214847 ) ) ( ON-TABLE ?auto_214845 ) ( ON ?auto_214844 ?auto_214845 ) ( not ( = ?auto_214845 ?auto_214844 ) ) ( not ( = ?auto_214845 ?auto_214849 ) ) ( not ( = ?auto_214845 ?auto_214848 ) ) ( not ( = ?auto_214845 ?auto_214843 ) ) ( not ( = ?auto_214845 ?auto_214847 ) ) ( not ( = ?auto_214845 ?auto_214842 ) ) ( not ( = ?auto_214845 ?auto_214841 ) ) ( not ( = ?auto_214844 ?auto_214849 ) ) ( not ( = ?auto_214844 ?auto_214848 ) ) ( not ( = ?auto_214844 ?auto_214843 ) ) ( not ( = ?auto_214844 ?auto_214847 ) ) ( not ( = ?auto_214844 ?auto_214842 ) ) ( not ( = ?auto_214844 ?auto_214841 ) ) ( not ( = ?auto_214849 ?auto_214848 ) ) ( not ( = ?auto_214849 ?auto_214843 ) ) ( not ( = ?auto_214849 ?auto_214847 ) ) ( not ( = ?auto_214849 ?auto_214842 ) ) ( not ( = ?auto_214849 ?auto_214841 ) ) ( not ( = ?auto_214848 ?auto_214843 ) ) ( not ( = ?auto_214848 ?auto_214847 ) ) ( not ( = ?auto_214848 ?auto_214842 ) ) ( not ( = ?auto_214848 ?auto_214841 ) ) ( not ( = ?auto_214843 ?auto_214847 ) ) ( not ( = ?auto_214843 ?auto_214842 ) ) ( not ( = ?auto_214843 ?auto_214841 ) ) ( ON ?auto_214841 ?auto_214846 ) ( not ( = ?auto_214841 ?auto_214846 ) ) ( not ( = ?auto_214842 ?auto_214846 ) ) ( not ( = ?auto_214847 ?auto_214846 ) ) ( not ( = ?auto_214845 ?auto_214846 ) ) ( not ( = ?auto_214844 ?auto_214846 ) ) ( not ( = ?auto_214849 ?auto_214846 ) ) ( not ( = ?auto_214848 ?auto_214846 ) ) ( not ( = ?auto_214843 ?auto_214846 ) ) ( ON ?auto_214842 ?auto_214841 ) ( ON-TABLE ?auto_214846 ) ( ON ?auto_214847 ?auto_214842 ) ( ON ?auto_214843 ?auto_214847 ) ( ON ?auto_214848 ?auto_214843 ) ( CLEAR ?auto_214844 ) ( ON ?auto_214849 ?auto_214848 ) ( CLEAR ?auto_214849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214846 ?auto_214841 ?auto_214842 ?auto_214847 ?auto_214843 ?auto_214848 )
      ( MAKE-2PILE ?auto_214841 ?auto_214842 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214850 - BLOCK
      ?auto_214851 - BLOCK
    )
    :vars
    (
      ?auto_214855 - BLOCK
      ?auto_214858 - BLOCK
      ?auto_214852 - BLOCK
      ?auto_214856 - BLOCK
      ?auto_214853 - BLOCK
      ?auto_214854 - BLOCK
      ?auto_214857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214850 ?auto_214851 ) ) ( not ( = ?auto_214850 ?auto_214855 ) ) ( not ( = ?auto_214851 ?auto_214855 ) ) ( ON-TABLE ?auto_214858 ) ( not ( = ?auto_214858 ?auto_214852 ) ) ( not ( = ?auto_214858 ?auto_214856 ) ) ( not ( = ?auto_214858 ?auto_214853 ) ) ( not ( = ?auto_214858 ?auto_214854 ) ) ( not ( = ?auto_214858 ?auto_214855 ) ) ( not ( = ?auto_214858 ?auto_214851 ) ) ( not ( = ?auto_214858 ?auto_214850 ) ) ( not ( = ?auto_214852 ?auto_214856 ) ) ( not ( = ?auto_214852 ?auto_214853 ) ) ( not ( = ?auto_214852 ?auto_214854 ) ) ( not ( = ?auto_214852 ?auto_214855 ) ) ( not ( = ?auto_214852 ?auto_214851 ) ) ( not ( = ?auto_214852 ?auto_214850 ) ) ( not ( = ?auto_214856 ?auto_214853 ) ) ( not ( = ?auto_214856 ?auto_214854 ) ) ( not ( = ?auto_214856 ?auto_214855 ) ) ( not ( = ?auto_214856 ?auto_214851 ) ) ( not ( = ?auto_214856 ?auto_214850 ) ) ( not ( = ?auto_214853 ?auto_214854 ) ) ( not ( = ?auto_214853 ?auto_214855 ) ) ( not ( = ?auto_214853 ?auto_214851 ) ) ( not ( = ?auto_214853 ?auto_214850 ) ) ( not ( = ?auto_214854 ?auto_214855 ) ) ( not ( = ?auto_214854 ?auto_214851 ) ) ( not ( = ?auto_214854 ?auto_214850 ) ) ( ON ?auto_214850 ?auto_214857 ) ( not ( = ?auto_214850 ?auto_214857 ) ) ( not ( = ?auto_214851 ?auto_214857 ) ) ( not ( = ?auto_214855 ?auto_214857 ) ) ( not ( = ?auto_214858 ?auto_214857 ) ) ( not ( = ?auto_214852 ?auto_214857 ) ) ( not ( = ?auto_214856 ?auto_214857 ) ) ( not ( = ?auto_214853 ?auto_214857 ) ) ( not ( = ?auto_214854 ?auto_214857 ) ) ( ON ?auto_214851 ?auto_214850 ) ( ON-TABLE ?auto_214857 ) ( ON ?auto_214855 ?auto_214851 ) ( ON ?auto_214854 ?auto_214855 ) ( ON ?auto_214853 ?auto_214854 ) ( ON ?auto_214856 ?auto_214853 ) ( CLEAR ?auto_214856 ) ( HOLDING ?auto_214852 ) ( CLEAR ?auto_214858 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214858 ?auto_214852 )
      ( MAKE-2PILE ?auto_214850 ?auto_214851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214859 - BLOCK
      ?auto_214860 - BLOCK
    )
    :vars
    (
      ?auto_214867 - BLOCK
      ?auto_214862 - BLOCK
      ?auto_214864 - BLOCK
      ?auto_214865 - BLOCK
      ?auto_214866 - BLOCK
      ?auto_214863 - BLOCK
      ?auto_214861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214859 ?auto_214860 ) ) ( not ( = ?auto_214859 ?auto_214867 ) ) ( not ( = ?auto_214860 ?auto_214867 ) ) ( ON-TABLE ?auto_214862 ) ( not ( = ?auto_214862 ?auto_214864 ) ) ( not ( = ?auto_214862 ?auto_214865 ) ) ( not ( = ?auto_214862 ?auto_214866 ) ) ( not ( = ?auto_214862 ?auto_214863 ) ) ( not ( = ?auto_214862 ?auto_214867 ) ) ( not ( = ?auto_214862 ?auto_214860 ) ) ( not ( = ?auto_214862 ?auto_214859 ) ) ( not ( = ?auto_214864 ?auto_214865 ) ) ( not ( = ?auto_214864 ?auto_214866 ) ) ( not ( = ?auto_214864 ?auto_214863 ) ) ( not ( = ?auto_214864 ?auto_214867 ) ) ( not ( = ?auto_214864 ?auto_214860 ) ) ( not ( = ?auto_214864 ?auto_214859 ) ) ( not ( = ?auto_214865 ?auto_214866 ) ) ( not ( = ?auto_214865 ?auto_214863 ) ) ( not ( = ?auto_214865 ?auto_214867 ) ) ( not ( = ?auto_214865 ?auto_214860 ) ) ( not ( = ?auto_214865 ?auto_214859 ) ) ( not ( = ?auto_214866 ?auto_214863 ) ) ( not ( = ?auto_214866 ?auto_214867 ) ) ( not ( = ?auto_214866 ?auto_214860 ) ) ( not ( = ?auto_214866 ?auto_214859 ) ) ( not ( = ?auto_214863 ?auto_214867 ) ) ( not ( = ?auto_214863 ?auto_214860 ) ) ( not ( = ?auto_214863 ?auto_214859 ) ) ( ON ?auto_214859 ?auto_214861 ) ( not ( = ?auto_214859 ?auto_214861 ) ) ( not ( = ?auto_214860 ?auto_214861 ) ) ( not ( = ?auto_214867 ?auto_214861 ) ) ( not ( = ?auto_214862 ?auto_214861 ) ) ( not ( = ?auto_214864 ?auto_214861 ) ) ( not ( = ?auto_214865 ?auto_214861 ) ) ( not ( = ?auto_214866 ?auto_214861 ) ) ( not ( = ?auto_214863 ?auto_214861 ) ) ( ON ?auto_214860 ?auto_214859 ) ( ON-TABLE ?auto_214861 ) ( ON ?auto_214867 ?auto_214860 ) ( ON ?auto_214863 ?auto_214867 ) ( ON ?auto_214866 ?auto_214863 ) ( ON ?auto_214865 ?auto_214866 ) ( CLEAR ?auto_214862 ) ( ON ?auto_214864 ?auto_214865 ) ( CLEAR ?auto_214864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214861 ?auto_214859 ?auto_214860 ?auto_214867 ?auto_214863 ?auto_214866 ?auto_214865 )
      ( MAKE-2PILE ?auto_214859 ?auto_214860 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214868 - BLOCK
      ?auto_214869 - BLOCK
    )
    :vars
    (
      ?auto_214870 - BLOCK
      ?auto_214875 - BLOCK
      ?auto_214872 - BLOCK
      ?auto_214874 - BLOCK
      ?auto_214876 - BLOCK
      ?auto_214871 - BLOCK
      ?auto_214873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214868 ?auto_214869 ) ) ( not ( = ?auto_214868 ?auto_214870 ) ) ( not ( = ?auto_214869 ?auto_214870 ) ) ( not ( = ?auto_214875 ?auto_214872 ) ) ( not ( = ?auto_214875 ?auto_214874 ) ) ( not ( = ?auto_214875 ?auto_214876 ) ) ( not ( = ?auto_214875 ?auto_214871 ) ) ( not ( = ?auto_214875 ?auto_214870 ) ) ( not ( = ?auto_214875 ?auto_214869 ) ) ( not ( = ?auto_214875 ?auto_214868 ) ) ( not ( = ?auto_214872 ?auto_214874 ) ) ( not ( = ?auto_214872 ?auto_214876 ) ) ( not ( = ?auto_214872 ?auto_214871 ) ) ( not ( = ?auto_214872 ?auto_214870 ) ) ( not ( = ?auto_214872 ?auto_214869 ) ) ( not ( = ?auto_214872 ?auto_214868 ) ) ( not ( = ?auto_214874 ?auto_214876 ) ) ( not ( = ?auto_214874 ?auto_214871 ) ) ( not ( = ?auto_214874 ?auto_214870 ) ) ( not ( = ?auto_214874 ?auto_214869 ) ) ( not ( = ?auto_214874 ?auto_214868 ) ) ( not ( = ?auto_214876 ?auto_214871 ) ) ( not ( = ?auto_214876 ?auto_214870 ) ) ( not ( = ?auto_214876 ?auto_214869 ) ) ( not ( = ?auto_214876 ?auto_214868 ) ) ( not ( = ?auto_214871 ?auto_214870 ) ) ( not ( = ?auto_214871 ?auto_214869 ) ) ( not ( = ?auto_214871 ?auto_214868 ) ) ( ON ?auto_214868 ?auto_214873 ) ( not ( = ?auto_214868 ?auto_214873 ) ) ( not ( = ?auto_214869 ?auto_214873 ) ) ( not ( = ?auto_214870 ?auto_214873 ) ) ( not ( = ?auto_214875 ?auto_214873 ) ) ( not ( = ?auto_214872 ?auto_214873 ) ) ( not ( = ?auto_214874 ?auto_214873 ) ) ( not ( = ?auto_214876 ?auto_214873 ) ) ( not ( = ?auto_214871 ?auto_214873 ) ) ( ON ?auto_214869 ?auto_214868 ) ( ON-TABLE ?auto_214873 ) ( ON ?auto_214870 ?auto_214869 ) ( ON ?auto_214871 ?auto_214870 ) ( ON ?auto_214876 ?auto_214871 ) ( ON ?auto_214874 ?auto_214876 ) ( ON ?auto_214872 ?auto_214874 ) ( CLEAR ?auto_214872 ) ( HOLDING ?auto_214875 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_214875 )
      ( MAKE-2PILE ?auto_214868 ?auto_214869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_214877 - BLOCK
      ?auto_214878 - BLOCK
    )
    :vars
    (
      ?auto_214879 - BLOCK
      ?auto_214883 - BLOCK
      ?auto_214881 - BLOCK
      ?auto_214882 - BLOCK
      ?auto_214880 - BLOCK
      ?auto_214885 - BLOCK
      ?auto_214884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_214877 ?auto_214878 ) ) ( not ( = ?auto_214877 ?auto_214879 ) ) ( not ( = ?auto_214878 ?auto_214879 ) ) ( not ( = ?auto_214883 ?auto_214881 ) ) ( not ( = ?auto_214883 ?auto_214882 ) ) ( not ( = ?auto_214883 ?auto_214880 ) ) ( not ( = ?auto_214883 ?auto_214885 ) ) ( not ( = ?auto_214883 ?auto_214879 ) ) ( not ( = ?auto_214883 ?auto_214878 ) ) ( not ( = ?auto_214883 ?auto_214877 ) ) ( not ( = ?auto_214881 ?auto_214882 ) ) ( not ( = ?auto_214881 ?auto_214880 ) ) ( not ( = ?auto_214881 ?auto_214885 ) ) ( not ( = ?auto_214881 ?auto_214879 ) ) ( not ( = ?auto_214881 ?auto_214878 ) ) ( not ( = ?auto_214881 ?auto_214877 ) ) ( not ( = ?auto_214882 ?auto_214880 ) ) ( not ( = ?auto_214882 ?auto_214885 ) ) ( not ( = ?auto_214882 ?auto_214879 ) ) ( not ( = ?auto_214882 ?auto_214878 ) ) ( not ( = ?auto_214882 ?auto_214877 ) ) ( not ( = ?auto_214880 ?auto_214885 ) ) ( not ( = ?auto_214880 ?auto_214879 ) ) ( not ( = ?auto_214880 ?auto_214878 ) ) ( not ( = ?auto_214880 ?auto_214877 ) ) ( not ( = ?auto_214885 ?auto_214879 ) ) ( not ( = ?auto_214885 ?auto_214878 ) ) ( not ( = ?auto_214885 ?auto_214877 ) ) ( ON ?auto_214877 ?auto_214884 ) ( not ( = ?auto_214877 ?auto_214884 ) ) ( not ( = ?auto_214878 ?auto_214884 ) ) ( not ( = ?auto_214879 ?auto_214884 ) ) ( not ( = ?auto_214883 ?auto_214884 ) ) ( not ( = ?auto_214881 ?auto_214884 ) ) ( not ( = ?auto_214882 ?auto_214884 ) ) ( not ( = ?auto_214880 ?auto_214884 ) ) ( not ( = ?auto_214885 ?auto_214884 ) ) ( ON ?auto_214878 ?auto_214877 ) ( ON-TABLE ?auto_214884 ) ( ON ?auto_214879 ?auto_214878 ) ( ON ?auto_214885 ?auto_214879 ) ( ON ?auto_214880 ?auto_214885 ) ( ON ?auto_214882 ?auto_214880 ) ( ON ?auto_214881 ?auto_214882 ) ( ON ?auto_214883 ?auto_214881 ) ( CLEAR ?auto_214883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214884 ?auto_214877 ?auto_214878 ?auto_214879 ?auto_214885 ?auto_214880 ?auto_214882 ?auto_214881 )
      ( MAKE-2PILE ?auto_214877 ?auto_214878 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_214891 - BLOCK
      ?auto_214892 - BLOCK
      ?auto_214893 - BLOCK
      ?auto_214894 - BLOCK
      ?auto_214895 - BLOCK
    )
    :vars
    (
      ?auto_214896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214896 ?auto_214895 ) ( CLEAR ?auto_214896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214891 ) ( ON ?auto_214892 ?auto_214891 ) ( ON ?auto_214893 ?auto_214892 ) ( ON ?auto_214894 ?auto_214893 ) ( ON ?auto_214895 ?auto_214894 ) ( not ( = ?auto_214891 ?auto_214892 ) ) ( not ( = ?auto_214891 ?auto_214893 ) ) ( not ( = ?auto_214891 ?auto_214894 ) ) ( not ( = ?auto_214891 ?auto_214895 ) ) ( not ( = ?auto_214891 ?auto_214896 ) ) ( not ( = ?auto_214892 ?auto_214893 ) ) ( not ( = ?auto_214892 ?auto_214894 ) ) ( not ( = ?auto_214892 ?auto_214895 ) ) ( not ( = ?auto_214892 ?auto_214896 ) ) ( not ( = ?auto_214893 ?auto_214894 ) ) ( not ( = ?auto_214893 ?auto_214895 ) ) ( not ( = ?auto_214893 ?auto_214896 ) ) ( not ( = ?auto_214894 ?auto_214895 ) ) ( not ( = ?auto_214894 ?auto_214896 ) ) ( not ( = ?auto_214895 ?auto_214896 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214896 ?auto_214895 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_214897 - BLOCK
      ?auto_214898 - BLOCK
      ?auto_214899 - BLOCK
      ?auto_214900 - BLOCK
      ?auto_214901 - BLOCK
    )
    :vars
    (
      ?auto_214902 - BLOCK
      ?auto_214903 - BLOCK
      ?auto_214904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214902 ?auto_214901 ) ( CLEAR ?auto_214902 ) ( ON-TABLE ?auto_214897 ) ( ON ?auto_214898 ?auto_214897 ) ( ON ?auto_214899 ?auto_214898 ) ( ON ?auto_214900 ?auto_214899 ) ( ON ?auto_214901 ?auto_214900 ) ( not ( = ?auto_214897 ?auto_214898 ) ) ( not ( = ?auto_214897 ?auto_214899 ) ) ( not ( = ?auto_214897 ?auto_214900 ) ) ( not ( = ?auto_214897 ?auto_214901 ) ) ( not ( = ?auto_214897 ?auto_214902 ) ) ( not ( = ?auto_214898 ?auto_214899 ) ) ( not ( = ?auto_214898 ?auto_214900 ) ) ( not ( = ?auto_214898 ?auto_214901 ) ) ( not ( = ?auto_214898 ?auto_214902 ) ) ( not ( = ?auto_214899 ?auto_214900 ) ) ( not ( = ?auto_214899 ?auto_214901 ) ) ( not ( = ?auto_214899 ?auto_214902 ) ) ( not ( = ?auto_214900 ?auto_214901 ) ) ( not ( = ?auto_214900 ?auto_214902 ) ) ( not ( = ?auto_214901 ?auto_214902 ) ) ( HOLDING ?auto_214903 ) ( CLEAR ?auto_214904 ) ( not ( = ?auto_214897 ?auto_214903 ) ) ( not ( = ?auto_214897 ?auto_214904 ) ) ( not ( = ?auto_214898 ?auto_214903 ) ) ( not ( = ?auto_214898 ?auto_214904 ) ) ( not ( = ?auto_214899 ?auto_214903 ) ) ( not ( = ?auto_214899 ?auto_214904 ) ) ( not ( = ?auto_214900 ?auto_214903 ) ) ( not ( = ?auto_214900 ?auto_214904 ) ) ( not ( = ?auto_214901 ?auto_214903 ) ) ( not ( = ?auto_214901 ?auto_214904 ) ) ( not ( = ?auto_214902 ?auto_214903 ) ) ( not ( = ?auto_214902 ?auto_214904 ) ) ( not ( = ?auto_214903 ?auto_214904 ) ) )
    :subtasks
    ( ( !STACK ?auto_214903 ?auto_214904 )
      ( MAKE-5PILE ?auto_214897 ?auto_214898 ?auto_214899 ?auto_214900 ?auto_214901 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_214905 - BLOCK
      ?auto_214906 - BLOCK
      ?auto_214907 - BLOCK
      ?auto_214908 - BLOCK
      ?auto_214909 - BLOCK
    )
    :vars
    (
      ?auto_214911 - BLOCK
      ?auto_214912 - BLOCK
      ?auto_214910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214911 ?auto_214909 ) ( ON-TABLE ?auto_214905 ) ( ON ?auto_214906 ?auto_214905 ) ( ON ?auto_214907 ?auto_214906 ) ( ON ?auto_214908 ?auto_214907 ) ( ON ?auto_214909 ?auto_214908 ) ( not ( = ?auto_214905 ?auto_214906 ) ) ( not ( = ?auto_214905 ?auto_214907 ) ) ( not ( = ?auto_214905 ?auto_214908 ) ) ( not ( = ?auto_214905 ?auto_214909 ) ) ( not ( = ?auto_214905 ?auto_214911 ) ) ( not ( = ?auto_214906 ?auto_214907 ) ) ( not ( = ?auto_214906 ?auto_214908 ) ) ( not ( = ?auto_214906 ?auto_214909 ) ) ( not ( = ?auto_214906 ?auto_214911 ) ) ( not ( = ?auto_214907 ?auto_214908 ) ) ( not ( = ?auto_214907 ?auto_214909 ) ) ( not ( = ?auto_214907 ?auto_214911 ) ) ( not ( = ?auto_214908 ?auto_214909 ) ) ( not ( = ?auto_214908 ?auto_214911 ) ) ( not ( = ?auto_214909 ?auto_214911 ) ) ( CLEAR ?auto_214912 ) ( not ( = ?auto_214905 ?auto_214910 ) ) ( not ( = ?auto_214905 ?auto_214912 ) ) ( not ( = ?auto_214906 ?auto_214910 ) ) ( not ( = ?auto_214906 ?auto_214912 ) ) ( not ( = ?auto_214907 ?auto_214910 ) ) ( not ( = ?auto_214907 ?auto_214912 ) ) ( not ( = ?auto_214908 ?auto_214910 ) ) ( not ( = ?auto_214908 ?auto_214912 ) ) ( not ( = ?auto_214909 ?auto_214910 ) ) ( not ( = ?auto_214909 ?auto_214912 ) ) ( not ( = ?auto_214911 ?auto_214910 ) ) ( not ( = ?auto_214911 ?auto_214912 ) ) ( not ( = ?auto_214910 ?auto_214912 ) ) ( ON ?auto_214910 ?auto_214911 ) ( CLEAR ?auto_214910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214905 ?auto_214906 ?auto_214907 ?auto_214908 ?auto_214909 ?auto_214911 )
      ( MAKE-5PILE ?auto_214905 ?auto_214906 ?auto_214907 ?auto_214908 ?auto_214909 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_214913 - BLOCK
      ?auto_214914 - BLOCK
      ?auto_214915 - BLOCK
      ?auto_214916 - BLOCK
      ?auto_214917 - BLOCK
    )
    :vars
    (
      ?auto_214919 - BLOCK
      ?auto_214920 - BLOCK
      ?auto_214918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214919 ?auto_214917 ) ( ON-TABLE ?auto_214913 ) ( ON ?auto_214914 ?auto_214913 ) ( ON ?auto_214915 ?auto_214914 ) ( ON ?auto_214916 ?auto_214915 ) ( ON ?auto_214917 ?auto_214916 ) ( not ( = ?auto_214913 ?auto_214914 ) ) ( not ( = ?auto_214913 ?auto_214915 ) ) ( not ( = ?auto_214913 ?auto_214916 ) ) ( not ( = ?auto_214913 ?auto_214917 ) ) ( not ( = ?auto_214913 ?auto_214919 ) ) ( not ( = ?auto_214914 ?auto_214915 ) ) ( not ( = ?auto_214914 ?auto_214916 ) ) ( not ( = ?auto_214914 ?auto_214917 ) ) ( not ( = ?auto_214914 ?auto_214919 ) ) ( not ( = ?auto_214915 ?auto_214916 ) ) ( not ( = ?auto_214915 ?auto_214917 ) ) ( not ( = ?auto_214915 ?auto_214919 ) ) ( not ( = ?auto_214916 ?auto_214917 ) ) ( not ( = ?auto_214916 ?auto_214919 ) ) ( not ( = ?auto_214917 ?auto_214919 ) ) ( not ( = ?auto_214913 ?auto_214920 ) ) ( not ( = ?auto_214913 ?auto_214918 ) ) ( not ( = ?auto_214914 ?auto_214920 ) ) ( not ( = ?auto_214914 ?auto_214918 ) ) ( not ( = ?auto_214915 ?auto_214920 ) ) ( not ( = ?auto_214915 ?auto_214918 ) ) ( not ( = ?auto_214916 ?auto_214920 ) ) ( not ( = ?auto_214916 ?auto_214918 ) ) ( not ( = ?auto_214917 ?auto_214920 ) ) ( not ( = ?auto_214917 ?auto_214918 ) ) ( not ( = ?auto_214919 ?auto_214920 ) ) ( not ( = ?auto_214919 ?auto_214918 ) ) ( not ( = ?auto_214920 ?auto_214918 ) ) ( ON ?auto_214920 ?auto_214919 ) ( CLEAR ?auto_214920 ) ( HOLDING ?auto_214918 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_214918 )
      ( MAKE-5PILE ?auto_214913 ?auto_214914 ?auto_214915 ?auto_214916 ?auto_214917 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_214921 - BLOCK
      ?auto_214922 - BLOCK
      ?auto_214923 - BLOCK
      ?auto_214924 - BLOCK
      ?auto_214925 - BLOCK
    )
    :vars
    (
      ?auto_214927 - BLOCK
      ?auto_214928 - BLOCK
      ?auto_214926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214927 ?auto_214925 ) ( ON-TABLE ?auto_214921 ) ( ON ?auto_214922 ?auto_214921 ) ( ON ?auto_214923 ?auto_214922 ) ( ON ?auto_214924 ?auto_214923 ) ( ON ?auto_214925 ?auto_214924 ) ( not ( = ?auto_214921 ?auto_214922 ) ) ( not ( = ?auto_214921 ?auto_214923 ) ) ( not ( = ?auto_214921 ?auto_214924 ) ) ( not ( = ?auto_214921 ?auto_214925 ) ) ( not ( = ?auto_214921 ?auto_214927 ) ) ( not ( = ?auto_214922 ?auto_214923 ) ) ( not ( = ?auto_214922 ?auto_214924 ) ) ( not ( = ?auto_214922 ?auto_214925 ) ) ( not ( = ?auto_214922 ?auto_214927 ) ) ( not ( = ?auto_214923 ?auto_214924 ) ) ( not ( = ?auto_214923 ?auto_214925 ) ) ( not ( = ?auto_214923 ?auto_214927 ) ) ( not ( = ?auto_214924 ?auto_214925 ) ) ( not ( = ?auto_214924 ?auto_214927 ) ) ( not ( = ?auto_214925 ?auto_214927 ) ) ( not ( = ?auto_214921 ?auto_214928 ) ) ( not ( = ?auto_214921 ?auto_214926 ) ) ( not ( = ?auto_214922 ?auto_214928 ) ) ( not ( = ?auto_214922 ?auto_214926 ) ) ( not ( = ?auto_214923 ?auto_214928 ) ) ( not ( = ?auto_214923 ?auto_214926 ) ) ( not ( = ?auto_214924 ?auto_214928 ) ) ( not ( = ?auto_214924 ?auto_214926 ) ) ( not ( = ?auto_214925 ?auto_214928 ) ) ( not ( = ?auto_214925 ?auto_214926 ) ) ( not ( = ?auto_214927 ?auto_214928 ) ) ( not ( = ?auto_214927 ?auto_214926 ) ) ( not ( = ?auto_214928 ?auto_214926 ) ) ( ON ?auto_214928 ?auto_214927 ) ( ON ?auto_214926 ?auto_214928 ) ( CLEAR ?auto_214926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214921 ?auto_214922 ?auto_214923 ?auto_214924 ?auto_214925 ?auto_214927 ?auto_214928 )
      ( MAKE-5PILE ?auto_214921 ?auto_214922 ?auto_214923 ?auto_214924 ?auto_214925 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_214929 - BLOCK
      ?auto_214930 - BLOCK
      ?auto_214931 - BLOCK
      ?auto_214932 - BLOCK
      ?auto_214933 - BLOCK
    )
    :vars
    (
      ?auto_214936 - BLOCK
      ?auto_214935 - BLOCK
      ?auto_214934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214936 ?auto_214933 ) ( ON-TABLE ?auto_214929 ) ( ON ?auto_214930 ?auto_214929 ) ( ON ?auto_214931 ?auto_214930 ) ( ON ?auto_214932 ?auto_214931 ) ( ON ?auto_214933 ?auto_214932 ) ( not ( = ?auto_214929 ?auto_214930 ) ) ( not ( = ?auto_214929 ?auto_214931 ) ) ( not ( = ?auto_214929 ?auto_214932 ) ) ( not ( = ?auto_214929 ?auto_214933 ) ) ( not ( = ?auto_214929 ?auto_214936 ) ) ( not ( = ?auto_214930 ?auto_214931 ) ) ( not ( = ?auto_214930 ?auto_214932 ) ) ( not ( = ?auto_214930 ?auto_214933 ) ) ( not ( = ?auto_214930 ?auto_214936 ) ) ( not ( = ?auto_214931 ?auto_214932 ) ) ( not ( = ?auto_214931 ?auto_214933 ) ) ( not ( = ?auto_214931 ?auto_214936 ) ) ( not ( = ?auto_214932 ?auto_214933 ) ) ( not ( = ?auto_214932 ?auto_214936 ) ) ( not ( = ?auto_214933 ?auto_214936 ) ) ( not ( = ?auto_214929 ?auto_214935 ) ) ( not ( = ?auto_214929 ?auto_214934 ) ) ( not ( = ?auto_214930 ?auto_214935 ) ) ( not ( = ?auto_214930 ?auto_214934 ) ) ( not ( = ?auto_214931 ?auto_214935 ) ) ( not ( = ?auto_214931 ?auto_214934 ) ) ( not ( = ?auto_214932 ?auto_214935 ) ) ( not ( = ?auto_214932 ?auto_214934 ) ) ( not ( = ?auto_214933 ?auto_214935 ) ) ( not ( = ?auto_214933 ?auto_214934 ) ) ( not ( = ?auto_214936 ?auto_214935 ) ) ( not ( = ?auto_214936 ?auto_214934 ) ) ( not ( = ?auto_214935 ?auto_214934 ) ) ( ON ?auto_214935 ?auto_214936 ) ( HOLDING ?auto_214934 ) ( CLEAR ?auto_214935 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214929 ?auto_214930 ?auto_214931 ?auto_214932 ?auto_214933 ?auto_214936 ?auto_214935 ?auto_214934 )
      ( MAKE-5PILE ?auto_214929 ?auto_214930 ?auto_214931 ?auto_214932 ?auto_214933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_214937 - BLOCK
      ?auto_214938 - BLOCK
      ?auto_214939 - BLOCK
      ?auto_214940 - BLOCK
      ?auto_214941 - BLOCK
    )
    :vars
    (
      ?auto_214944 - BLOCK
      ?auto_214943 - BLOCK
      ?auto_214942 - BLOCK
      ?auto_214945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214944 ?auto_214941 ) ( ON-TABLE ?auto_214937 ) ( ON ?auto_214938 ?auto_214937 ) ( ON ?auto_214939 ?auto_214938 ) ( ON ?auto_214940 ?auto_214939 ) ( ON ?auto_214941 ?auto_214940 ) ( not ( = ?auto_214937 ?auto_214938 ) ) ( not ( = ?auto_214937 ?auto_214939 ) ) ( not ( = ?auto_214937 ?auto_214940 ) ) ( not ( = ?auto_214937 ?auto_214941 ) ) ( not ( = ?auto_214937 ?auto_214944 ) ) ( not ( = ?auto_214938 ?auto_214939 ) ) ( not ( = ?auto_214938 ?auto_214940 ) ) ( not ( = ?auto_214938 ?auto_214941 ) ) ( not ( = ?auto_214938 ?auto_214944 ) ) ( not ( = ?auto_214939 ?auto_214940 ) ) ( not ( = ?auto_214939 ?auto_214941 ) ) ( not ( = ?auto_214939 ?auto_214944 ) ) ( not ( = ?auto_214940 ?auto_214941 ) ) ( not ( = ?auto_214940 ?auto_214944 ) ) ( not ( = ?auto_214941 ?auto_214944 ) ) ( not ( = ?auto_214937 ?auto_214943 ) ) ( not ( = ?auto_214937 ?auto_214942 ) ) ( not ( = ?auto_214938 ?auto_214943 ) ) ( not ( = ?auto_214938 ?auto_214942 ) ) ( not ( = ?auto_214939 ?auto_214943 ) ) ( not ( = ?auto_214939 ?auto_214942 ) ) ( not ( = ?auto_214940 ?auto_214943 ) ) ( not ( = ?auto_214940 ?auto_214942 ) ) ( not ( = ?auto_214941 ?auto_214943 ) ) ( not ( = ?auto_214941 ?auto_214942 ) ) ( not ( = ?auto_214944 ?auto_214943 ) ) ( not ( = ?auto_214944 ?auto_214942 ) ) ( not ( = ?auto_214943 ?auto_214942 ) ) ( ON ?auto_214943 ?auto_214944 ) ( CLEAR ?auto_214943 ) ( ON ?auto_214942 ?auto_214945 ) ( CLEAR ?auto_214942 ) ( HAND-EMPTY ) ( not ( = ?auto_214937 ?auto_214945 ) ) ( not ( = ?auto_214938 ?auto_214945 ) ) ( not ( = ?auto_214939 ?auto_214945 ) ) ( not ( = ?auto_214940 ?auto_214945 ) ) ( not ( = ?auto_214941 ?auto_214945 ) ) ( not ( = ?auto_214944 ?auto_214945 ) ) ( not ( = ?auto_214943 ?auto_214945 ) ) ( not ( = ?auto_214942 ?auto_214945 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214942 ?auto_214945 )
      ( MAKE-5PILE ?auto_214937 ?auto_214938 ?auto_214939 ?auto_214940 ?auto_214941 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_214946 - BLOCK
      ?auto_214947 - BLOCK
      ?auto_214948 - BLOCK
      ?auto_214949 - BLOCK
      ?auto_214950 - BLOCK
    )
    :vars
    (
      ?auto_214953 - BLOCK
      ?auto_214951 - BLOCK
      ?auto_214954 - BLOCK
      ?auto_214952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214953 ?auto_214950 ) ( ON-TABLE ?auto_214946 ) ( ON ?auto_214947 ?auto_214946 ) ( ON ?auto_214948 ?auto_214947 ) ( ON ?auto_214949 ?auto_214948 ) ( ON ?auto_214950 ?auto_214949 ) ( not ( = ?auto_214946 ?auto_214947 ) ) ( not ( = ?auto_214946 ?auto_214948 ) ) ( not ( = ?auto_214946 ?auto_214949 ) ) ( not ( = ?auto_214946 ?auto_214950 ) ) ( not ( = ?auto_214946 ?auto_214953 ) ) ( not ( = ?auto_214947 ?auto_214948 ) ) ( not ( = ?auto_214947 ?auto_214949 ) ) ( not ( = ?auto_214947 ?auto_214950 ) ) ( not ( = ?auto_214947 ?auto_214953 ) ) ( not ( = ?auto_214948 ?auto_214949 ) ) ( not ( = ?auto_214948 ?auto_214950 ) ) ( not ( = ?auto_214948 ?auto_214953 ) ) ( not ( = ?auto_214949 ?auto_214950 ) ) ( not ( = ?auto_214949 ?auto_214953 ) ) ( not ( = ?auto_214950 ?auto_214953 ) ) ( not ( = ?auto_214946 ?auto_214951 ) ) ( not ( = ?auto_214946 ?auto_214954 ) ) ( not ( = ?auto_214947 ?auto_214951 ) ) ( not ( = ?auto_214947 ?auto_214954 ) ) ( not ( = ?auto_214948 ?auto_214951 ) ) ( not ( = ?auto_214948 ?auto_214954 ) ) ( not ( = ?auto_214949 ?auto_214951 ) ) ( not ( = ?auto_214949 ?auto_214954 ) ) ( not ( = ?auto_214950 ?auto_214951 ) ) ( not ( = ?auto_214950 ?auto_214954 ) ) ( not ( = ?auto_214953 ?auto_214951 ) ) ( not ( = ?auto_214953 ?auto_214954 ) ) ( not ( = ?auto_214951 ?auto_214954 ) ) ( ON ?auto_214954 ?auto_214952 ) ( CLEAR ?auto_214954 ) ( not ( = ?auto_214946 ?auto_214952 ) ) ( not ( = ?auto_214947 ?auto_214952 ) ) ( not ( = ?auto_214948 ?auto_214952 ) ) ( not ( = ?auto_214949 ?auto_214952 ) ) ( not ( = ?auto_214950 ?auto_214952 ) ) ( not ( = ?auto_214953 ?auto_214952 ) ) ( not ( = ?auto_214951 ?auto_214952 ) ) ( not ( = ?auto_214954 ?auto_214952 ) ) ( HOLDING ?auto_214951 ) ( CLEAR ?auto_214953 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214946 ?auto_214947 ?auto_214948 ?auto_214949 ?auto_214950 ?auto_214953 ?auto_214951 )
      ( MAKE-5PILE ?auto_214946 ?auto_214947 ?auto_214948 ?auto_214949 ?auto_214950 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_214955 - BLOCK
      ?auto_214956 - BLOCK
      ?auto_214957 - BLOCK
      ?auto_214958 - BLOCK
      ?auto_214959 - BLOCK
    )
    :vars
    (
      ?auto_214961 - BLOCK
      ?auto_214960 - BLOCK
      ?auto_214963 - BLOCK
      ?auto_214962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214961 ?auto_214959 ) ( ON-TABLE ?auto_214955 ) ( ON ?auto_214956 ?auto_214955 ) ( ON ?auto_214957 ?auto_214956 ) ( ON ?auto_214958 ?auto_214957 ) ( ON ?auto_214959 ?auto_214958 ) ( not ( = ?auto_214955 ?auto_214956 ) ) ( not ( = ?auto_214955 ?auto_214957 ) ) ( not ( = ?auto_214955 ?auto_214958 ) ) ( not ( = ?auto_214955 ?auto_214959 ) ) ( not ( = ?auto_214955 ?auto_214961 ) ) ( not ( = ?auto_214956 ?auto_214957 ) ) ( not ( = ?auto_214956 ?auto_214958 ) ) ( not ( = ?auto_214956 ?auto_214959 ) ) ( not ( = ?auto_214956 ?auto_214961 ) ) ( not ( = ?auto_214957 ?auto_214958 ) ) ( not ( = ?auto_214957 ?auto_214959 ) ) ( not ( = ?auto_214957 ?auto_214961 ) ) ( not ( = ?auto_214958 ?auto_214959 ) ) ( not ( = ?auto_214958 ?auto_214961 ) ) ( not ( = ?auto_214959 ?auto_214961 ) ) ( not ( = ?auto_214955 ?auto_214960 ) ) ( not ( = ?auto_214955 ?auto_214963 ) ) ( not ( = ?auto_214956 ?auto_214960 ) ) ( not ( = ?auto_214956 ?auto_214963 ) ) ( not ( = ?auto_214957 ?auto_214960 ) ) ( not ( = ?auto_214957 ?auto_214963 ) ) ( not ( = ?auto_214958 ?auto_214960 ) ) ( not ( = ?auto_214958 ?auto_214963 ) ) ( not ( = ?auto_214959 ?auto_214960 ) ) ( not ( = ?auto_214959 ?auto_214963 ) ) ( not ( = ?auto_214961 ?auto_214960 ) ) ( not ( = ?auto_214961 ?auto_214963 ) ) ( not ( = ?auto_214960 ?auto_214963 ) ) ( ON ?auto_214963 ?auto_214962 ) ( not ( = ?auto_214955 ?auto_214962 ) ) ( not ( = ?auto_214956 ?auto_214962 ) ) ( not ( = ?auto_214957 ?auto_214962 ) ) ( not ( = ?auto_214958 ?auto_214962 ) ) ( not ( = ?auto_214959 ?auto_214962 ) ) ( not ( = ?auto_214961 ?auto_214962 ) ) ( not ( = ?auto_214960 ?auto_214962 ) ) ( not ( = ?auto_214963 ?auto_214962 ) ) ( CLEAR ?auto_214961 ) ( ON ?auto_214960 ?auto_214963 ) ( CLEAR ?auto_214960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214962 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214962 ?auto_214963 )
      ( MAKE-5PILE ?auto_214955 ?auto_214956 ?auto_214957 ?auto_214958 ?auto_214959 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_214982 - BLOCK
      ?auto_214983 - BLOCK
      ?auto_214984 - BLOCK
      ?auto_214985 - BLOCK
      ?auto_214986 - BLOCK
    )
    :vars
    (
      ?auto_214988 - BLOCK
      ?auto_214989 - BLOCK
      ?auto_214990 - BLOCK
      ?auto_214987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214982 ) ( ON ?auto_214983 ?auto_214982 ) ( ON ?auto_214984 ?auto_214983 ) ( ON ?auto_214985 ?auto_214984 ) ( not ( = ?auto_214982 ?auto_214983 ) ) ( not ( = ?auto_214982 ?auto_214984 ) ) ( not ( = ?auto_214982 ?auto_214985 ) ) ( not ( = ?auto_214982 ?auto_214986 ) ) ( not ( = ?auto_214982 ?auto_214988 ) ) ( not ( = ?auto_214983 ?auto_214984 ) ) ( not ( = ?auto_214983 ?auto_214985 ) ) ( not ( = ?auto_214983 ?auto_214986 ) ) ( not ( = ?auto_214983 ?auto_214988 ) ) ( not ( = ?auto_214984 ?auto_214985 ) ) ( not ( = ?auto_214984 ?auto_214986 ) ) ( not ( = ?auto_214984 ?auto_214988 ) ) ( not ( = ?auto_214985 ?auto_214986 ) ) ( not ( = ?auto_214985 ?auto_214988 ) ) ( not ( = ?auto_214986 ?auto_214988 ) ) ( not ( = ?auto_214982 ?auto_214989 ) ) ( not ( = ?auto_214982 ?auto_214990 ) ) ( not ( = ?auto_214983 ?auto_214989 ) ) ( not ( = ?auto_214983 ?auto_214990 ) ) ( not ( = ?auto_214984 ?auto_214989 ) ) ( not ( = ?auto_214984 ?auto_214990 ) ) ( not ( = ?auto_214985 ?auto_214989 ) ) ( not ( = ?auto_214985 ?auto_214990 ) ) ( not ( = ?auto_214986 ?auto_214989 ) ) ( not ( = ?auto_214986 ?auto_214990 ) ) ( not ( = ?auto_214988 ?auto_214989 ) ) ( not ( = ?auto_214988 ?auto_214990 ) ) ( not ( = ?auto_214989 ?auto_214990 ) ) ( ON ?auto_214990 ?auto_214987 ) ( not ( = ?auto_214982 ?auto_214987 ) ) ( not ( = ?auto_214983 ?auto_214987 ) ) ( not ( = ?auto_214984 ?auto_214987 ) ) ( not ( = ?auto_214985 ?auto_214987 ) ) ( not ( = ?auto_214986 ?auto_214987 ) ) ( not ( = ?auto_214988 ?auto_214987 ) ) ( not ( = ?auto_214989 ?auto_214987 ) ) ( not ( = ?auto_214990 ?auto_214987 ) ) ( ON ?auto_214989 ?auto_214990 ) ( ON-TABLE ?auto_214987 ) ( ON ?auto_214988 ?auto_214989 ) ( CLEAR ?auto_214988 ) ( HOLDING ?auto_214986 ) ( CLEAR ?auto_214985 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214982 ?auto_214983 ?auto_214984 ?auto_214985 ?auto_214986 ?auto_214988 )
      ( MAKE-5PILE ?auto_214982 ?auto_214983 ?auto_214984 ?auto_214985 ?auto_214986 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_214991 - BLOCK
      ?auto_214992 - BLOCK
      ?auto_214993 - BLOCK
      ?auto_214994 - BLOCK
      ?auto_214995 - BLOCK
    )
    :vars
    (
      ?auto_214996 - BLOCK
      ?auto_214998 - BLOCK
      ?auto_214999 - BLOCK
      ?auto_214997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_214991 ) ( ON ?auto_214992 ?auto_214991 ) ( ON ?auto_214993 ?auto_214992 ) ( ON ?auto_214994 ?auto_214993 ) ( not ( = ?auto_214991 ?auto_214992 ) ) ( not ( = ?auto_214991 ?auto_214993 ) ) ( not ( = ?auto_214991 ?auto_214994 ) ) ( not ( = ?auto_214991 ?auto_214995 ) ) ( not ( = ?auto_214991 ?auto_214996 ) ) ( not ( = ?auto_214992 ?auto_214993 ) ) ( not ( = ?auto_214992 ?auto_214994 ) ) ( not ( = ?auto_214992 ?auto_214995 ) ) ( not ( = ?auto_214992 ?auto_214996 ) ) ( not ( = ?auto_214993 ?auto_214994 ) ) ( not ( = ?auto_214993 ?auto_214995 ) ) ( not ( = ?auto_214993 ?auto_214996 ) ) ( not ( = ?auto_214994 ?auto_214995 ) ) ( not ( = ?auto_214994 ?auto_214996 ) ) ( not ( = ?auto_214995 ?auto_214996 ) ) ( not ( = ?auto_214991 ?auto_214998 ) ) ( not ( = ?auto_214991 ?auto_214999 ) ) ( not ( = ?auto_214992 ?auto_214998 ) ) ( not ( = ?auto_214992 ?auto_214999 ) ) ( not ( = ?auto_214993 ?auto_214998 ) ) ( not ( = ?auto_214993 ?auto_214999 ) ) ( not ( = ?auto_214994 ?auto_214998 ) ) ( not ( = ?auto_214994 ?auto_214999 ) ) ( not ( = ?auto_214995 ?auto_214998 ) ) ( not ( = ?auto_214995 ?auto_214999 ) ) ( not ( = ?auto_214996 ?auto_214998 ) ) ( not ( = ?auto_214996 ?auto_214999 ) ) ( not ( = ?auto_214998 ?auto_214999 ) ) ( ON ?auto_214999 ?auto_214997 ) ( not ( = ?auto_214991 ?auto_214997 ) ) ( not ( = ?auto_214992 ?auto_214997 ) ) ( not ( = ?auto_214993 ?auto_214997 ) ) ( not ( = ?auto_214994 ?auto_214997 ) ) ( not ( = ?auto_214995 ?auto_214997 ) ) ( not ( = ?auto_214996 ?auto_214997 ) ) ( not ( = ?auto_214998 ?auto_214997 ) ) ( not ( = ?auto_214999 ?auto_214997 ) ) ( ON ?auto_214998 ?auto_214999 ) ( ON-TABLE ?auto_214997 ) ( ON ?auto_214996 ?auto_214998 ) ( CLEAR ?auto_214994 ) ( ON ?auto_214995 ?auto_214996 ) ( CLEAR ?auto_214995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214997 ?auto_214999 ?auto_214998 ?auto_214996 )
      ( MAKE-5PILE ?auto_214991 ?auto_214992 ?auto_214993 ?auto_214994 ?auto_214995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215000 - BLOCK
      ?auto_215001 - BLOCK
      ?auto_215002 - BLOCK
      ?auto_215003 - BLOCK
      ?auto_215004 - BLOCK
    )
    :vars
    (
      ?auto_215007 - BLOCK
      ?auto_215006 - BLOCK
      ?auto_215008 - BLOCK
      ?auto_215005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215000 ) ( ON ?auto_215001 ?auto_215000 ) ( ON ?auto_215002 ?auto_215001 ) ( not ( = ?auto_215000 ?auto_215001 ) ) ( not ( = ?auto_215000 ?auto_215002 ) ) ( not ( = ?auto_215000 ?auto_215003 ) ) ( not ( = ?auto_215000 ?auto_215004 ) ) ( not ( = ?auto_215000 ?auto_215007 ) ) ( not ( = ?auto_215001 ?auto_215002 ) ) ( not ( = ?auto_215001 ?auto_215003 ) ) ( not ( = ?auto_215001 ?auto_215004 ) ) ( not ( = ?auto_215001 ?auto_215007 ) ) ( not ( = ?auto_215002 ?auto_215003 ) ) ( not ( = ?auto_215002 ?auto_215004 ) ) ( not ( = ?auto_215002 ?auto_215007 ) ) ( not ( = ?auto_215003 ?auto_215004 ) ) ( not ( = ?auto_215003 ?auto_215007 ) ) ( not ( = ?auto_215004 ?auto_215007 ) ) ( not ( = ?auto_215000 ?auto_215006 ) ) ( not ( = ?auto_215000 ?auto_215008 ) ) ( not ( = ?auto_215001 ?auto_215006 ) ) ( not ( = ?auto_215001 ?auto_215008 ) ) ( not ( = ?auto_215002 ?auto_215006 ) ) ( not ( = ?auto_215002 ?auto_215008 ) ) ( not ( = ?auto_215003 ?auto_215006 ) ) ( not ( = ?auto_215003 ?auto_215008 ) ) ( not ( = ?auto_215004 ?auto_215006 ) ) ( not ( = ?auto_215004 ?auto_215008 ) ) ( not ( = ?auto_215007 ?auto_215006 ) ) ( not ( = ?auto_215007 ?auto_215008 ) ) ( not ( = ?auto_215006 ?auto_215008 ) ) ( ON ?auto_215008 ?auto_215005 ) ( not ( = ?auto_215000 ?auto_215005 ) ) ( not ( = ?auto_215001 ?auto_215005 ) ) ( not ( = ?auto_215002 ?auto_215005 ) ) ( not ( = ?auto_215003 ?auto_215005 ) ) ( not ( = ?auto_215004 ?auto_215005 ) ) ( not ( = ?auto_215007 ?auto_215005 ) ) ( not ( = ?auto_215006 ?auto_215005 ) ) ( not ( = ?auto_215008 ?auto_215005 ) ) ( ON ?auto_215006 ?auto_215008 ) ( ON-TABLE ?auto_215005 ) ( ON ?auto_215007 ?auto_215006 ) ( ON ?auto_215004 ?auto_215007 ) ( CLEAR ?auto_215004 ) ( HOLDING ?auto_215003 ) ( CLEAR ?auto_215002 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215000 ?auto_215001 ?auto_215002 ?auto_215003 )
      ( MAKE-5PILE ?auto_215000 ?auto_215001 ?auto_215002 ?auto_215003 ?auto_215004 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215009 - BLOCK
      ?auto_215010 - BLOCK
      ?auto_215011 - BLOCK
      ?auto_215012 - BLOCK
      ?auto_215013 - BLOCK
    )
    :vars
    (
      ?auto_215017 - BLOCK
      ?auto_215014 - BLOCK
      ?auto_215016 - BLOCK
      ?auto_215015 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215009 ) ( ON ?auto_215010 ?auto_215009 ) ( ON ?auto_215011 ?auto_215010 ) ( not ( = ?auto_215009 ?auto_215010 ) ) ( not ( = ?auto_215009 ?auto_215011 ) ) ( not ( = ?auto_215009 ?auto_215012 ) ) ( not ( = ?auto_215009 ?auto_215013 ) ) ( not ( = ?auto_215009 ?auto_215017 ) ) ( not ( = ?auto_215010 ?auto_215011 ) ) ( not ( = ?auto_215010 ?auto_215012 ) ) ( not ( = ?auto_215010 ?auto_215013 ) ) ( not ( = ?auto_215010 ?auto_215017 ) ) ( not ( = ?auto_215011 ?auto_215012 ) ) ( not ( = ?auto_215011 ?auto_215013 ) ) ( not ( = ?auto_215011 ?auto_215017 ) ) ( not ( = ?auto_215012 ?auto_215013 ) ) ( not ( = ?auto_215012 ?auto_215017 ) ) ( not ( = ?auto_215013 ?auto_215017 ) ) ( not ( = ?auto_215009 ?auto_215014 ) ) ( not ( = ?auto_215009 ?auto_215016 ) ) ( not ( = ?auto_215010 ?auto_215014 ) ) ( not ( = ?auto_215010 ?auto_215016 ) ) ( not ( = ?auto_215011 ?auto_215014 ) ) ( not ( = ?auto_215011 ?auto_215016 ) ) ( not ( = ?auto_215012 ?auto_215014 ) ) ( not ( = ?auto_215012 ?auto_215016 ) ) ( not ( = ?auto_215013 ?auto_215014 ) ) ( not ( = ?auto_215013 ?auto_215016 ) ) ( not ( = ?auto_215017 ?auto_215014 ) ) ( not ( = ?auto_215017 ?auto_215016 ) ) ( not ( = ?auto_215014 ?auto_215016 ) ) ( ON ?auto_215016 ?auto_215015 ) ( not ( = ?auto_215009 ?auto_215015 ) ) ( not ( = ?auto_215010 ?auto_215015 ) ) ( not ( = ?auto_215011 ?auto_215015 ) ) ( not ( = ?auto_215012 ?auto_215015 ) ) ( not ( = ?auto_215013 ?auto_215015 ) ) ( not ( = ?auto_215017 ?auto_215015 ) ) ( not ( = ?auto_215014 ?auto_215015 ) ) ( not ( = ?auto_215016 ?auto_215015 ) ) ( ON ?auto_215014 ?auto_215016 ) ( ON-TABLE ?auto_215015 ) ( ON ?auto_215017 ?auto_215014 ) ( ON ?auto_215013 ?auto_215017 ) ( CLEAR ?auto_215011 ) ( ON ?auto_215012 ?auto_215013 ) ( CLEAR ?auto_215012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215015 ?auto_215016 ?auto_215014 ?auto_215017 ?auto_215013 )
      ( MAKE-5PILE ?auto_215009 ?auto_215010 ?auto_215011 ?auto_215012 ?auto_215013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215018 - BLOCK
      ?auto_215019 - BLOCK
      ?auto_215020 - BLOCK
      ?auto_215021 - BLOCK
      ?auto_215022 - BLOCK
    )
    :vars
    (
      ?auto_215025 - BLOCK
      ?auto_215024 - BLOCK
      ?auto_215023 - BLOCK
      ?auto_215026 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215018 ) ( ON ?auto_215019 ?auto_215018 ) ( not ( = ?auto_215018 ?auto_215019 ) ) ( not ( = ?auto_215018 ?auto_215020 ) ) ( not ( = ?auto_215018 ?auto_215021 ) ) ( not ( = ?auto_215018 ?auto_215022 ) ) ( not ( = ?auto_215018 ?auto_215025 ) ) ( not ( = ?auto_215019 ?auto_215020 ) ) ( not ( = ?auto_215019 ?auto_215021 ) ) ( not ( = ?auto_215019 ?auto_215022 ) ) ( not ( = ?auto_215019 ?auto_215025 ) ) ( not ( = ?auto_215020 ?auto_215021 ) ) ( not ( = ?auto_215020 ?auto_215022 ) ) ( not ( = ?auto_215020 ?auto_215025 ) ) ( not ( = ?auto_215021 ?auto_215022 ) ) ( not ( = ?auto_215021 ?auto_215025 ) ) ( not ( = ?auto_215022 ?auto_215025 ) ) ( not ( = ?auto_215018 ?auto_215024 ) ) ( not ( = ?auto_215018 ?auto_215023 ) ) ( not ( = ?auto_215019 ?auto_215024 ) ) ( not ( = ?auto_215019 ?auto_215023 ) ) ( not ( = ?auto_215020 ?auto_215024 ) ) ( not ( = ?auto_215020 ?auto_215023 ) ) ( not ( = ?auto_215021 ?auto_215024 ) ) ( not ( = ?auto_215021 ?auto_215023 ) ) ( not ( = ?auto_215022 ?auto_215024 ) ) ( not ( = ?auto_215022 ?auto_215023 ) ) ( not ( = ?auto_215025 ?auto_215024 ) ) ( not ( = ?auto_215025 ?auto_215023 ) ) ( not ( = ?auto_215024 ?auto_215023 ) ) ( ON ?auto_215023 ?auto_215026 ) ( not ( = ?auto_215018 ?auto_215026 ) ) ( not ( = ?auto_215019 ?auto_215026 ) ) ( not ( = ?auto_215020 ?auto_215026 ) ) ( not ( = ?auto_215021 ?auto_215026 ) ) ( not ( = ?auto_215022 ?auto_215026 ) ) ( not ( = ?auto_215025 ?auto_215026 ) ) ( not ( = ?auto_215024 ?auto_215026 ) ) ( not ( = ?auto_215023 ?auto_215026 ) ) ( ON ?auto_215024 ?auto_215023 ) ( ON-TABLE ?auto_215026 ) ( ON ?auto_215025 ?auto_215024 ) ( ON ?auto_215022 ?auto_215025 ) ( ON ?auto_215021 ?auto_215022 ) ( CLEAR ?auto_215021 ) ( HOLDING ?auto_215020 ) ( CLEAR ?auto_215019 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215018 ?auto_215019 ?auto_215020 )
      ( MAKE-5PILE ?auto_215018 ?auto_215019 ?auto_215020 ?auto_215021 ?auto_215022 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215027 - BLOCK
      ?auto_215028 - BLOCK
      ?auto_215029 - BLOCK
      ?auto_215030 - BLOCK
      ?auto_215031 - BLOCK
    )
    :vars
    (
      ?auto_215033 - BLOCK
      ?auto_215032 - BLOCK
      ?auto_215034 - BLOCK
      ?auto_215035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215027 ) ( ON ?auto_215028 ?auto_215027 ) ( not ( = ?auto_215027 ?auto_215028 ) ) ( not ( = ?auto_215027 ?auto_215029 ) ) ( not ( = ?auto_215027 ?auto_215030 ) ) ( not ( = ?auto_215027 ?auto_215031 ) ) ( not ( = ?auto_215027 ?auto_215033 ) ) ( not ( = ?auto_215028 ?auto_215029 ) ) ( not ( = ?auto_215028 ?auto_215030 ) ) ( not ( = ?auto_215028 ?auto_215031 ) ) ( not ( = ?auto_215028 ?auto_215033 ) ) ( not ( = ?auto_215029 ?auto_215030 ) ) ( not ( = ?auto_215029 ?auto_215031 ) ) ( not ( = ?auto_215029 ?auto_215033 ) ) ( not ( = ?auto_215030 ?auto_215031 ) ) ( not ( = ?auto_215030 ?auto_215033 ) ) ( not ( = ?auto_215031 ?auto_215033 ) ) ( not ( = ?auto_215027 ?auto_215032 ) ) ( not ( = ?auto_215027 ?auto_215034 ) ) ( not ( = ?auto_215028 ?auto_215032 ) ) ( not ( = ?auto_215028 ?auto_215034 ) ) ( not ( = ?auto_215029 ?auto_215032 ) ) ( not ( = ?auto_215029 ?auto_215034 ) ) ( not ( = ?auto_215030 ?auto_215032 ) ) ( not ( = ?auto_215030 ?auto_215034 ) ) ( not ( = ?auto_215031 ?auto_215032 ) ) ( not ( = ?auto_215031 ?auto_215034 ) ) ( not ( = ?auto_215033 ?auto_215032 ) ) ( not ( = ?auto_215033 ?auto_215034 ) ) ( not ( = ?auto_215032 ?auto_215034 ) ) ( ON ?auto_215034 ?auto_215035 ) ( not ( = ?auto_215027 ?auto_215035 ) ) ( not ( = ?auto_215028 ?auto_215035 ) ) ( not ( = ?auto_215029 ?auto_215035 ) ) ( not ( = ?auto_215030 ?auto_215035 ) ) ( not ( = ?auto_215031 ?auto_215035 ) ) ( not ( = ?auto_215033 ?auto_215035 ) ) ( not ( = ?auto_215032 ?auto_215035 ) ) ( not ( = ?auto_215034 ?auto_215035 ) ) ( ON ?auto_215032 ?auto_215034 ) ( ON-TABLE ?auto_215035 ) ( ON ?auto_215033 ?auto_215032 ) ( ON ?auto_215031 ?auto_215033 ) ( ON ?auto_215030 ?auto_215031 ) ( CLEAR ?auto_215028 ) ( ON ?auto_215029 ?auto_215030 ) ( CLEAR ?auto_215029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215035 ?auto_215034 ?auto_215032 ?auto_215033 ?auto_215031 ?auto_215030 )
      ( MAKE-5PILE ?auto_215027 ?auto_215028 ?auto_215029 ?auto_215030 ?auto_215031 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215036 - BLOCK
      ?auto_215037 - BLOCK
      ?auto_215038 - BLOCK
      ?auto_215039 - BLOCK
      ?auto_215040 - BLOCK
    )
    :vars
    (
      ?auto_215041 - BLOCK
      ?auto_215042 - BLOCK
      ?auto_215043 - BLOCK
      ?auto_215044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215036 ) ( not ( = ?auto_215036 ?auto_215037 ) ) ( not ( = ?auto_215036 ?auto_215038 ) ) ( not ( = ?auto_215036 ?auto_215039 ) ) ( not ( = ?auto_215036 ?auto_215040 ) ) ( not ( = ?auto_215036 ?auto_215041 ) ) ( not ( = ?auto_215037 ?auto_215038 ) ) ( not ( = ?auto_215037 ?auto_215039 ) ) ( not ( = ?auto_215037 ?auto_215040 ) ) ( not ( = ?auto_215037 ?auto_215041 ) ) ( not ( = ?auto_215038 ?auto_215039 ) ) ( not ( = ?auto_215038 ?auto_215040 ) ) ( not ( = ?auto_215038 ?auto_215041 ) ) ( not ( = ?auto_215039 ?auto_215040 ) ) ( not ( = ?auto_215039 ?auto_215041 ) ) ( not ( = ?auto_215040 ?auto_215041 ) ) ( not ( = ?auto_215036 ?auto_215042 ) ) ( not ( = ?auto_215036 ?auto_215043 ) ) ( not ( = ?auto_215037 ?auto_215042 ) ) ( not ( = ?auto_215037 ?auto_215043 ) ) ( not ( = ?auto_215038 ?auto_215042 ) ) ( not ( = ?auto_215038 ?auto_215043 ) ) ( not ( = ?auto_215039 ?auto_215042 ) ) ( not ( = ?auto_215039 ?auto_215043 ) ) ( not ( = ?auto_215040 ?auto_215042 ) ) ( not ( = ?auto_215040 ?auto_215043 ) ) ( not ( = ?auto_215041 ?auto_215042 ) ) ( not ( = ?auto_215041 ?auto_215043 ) ) ( not ( = ?auto_215042 ?auto_215043 ) ) ( ON ?auto_215043 ?auto_215044 ) ( not ( = ?auto_215036 ?auto_215044 ) ) ( not ( = ?auto_215037 ?auto_215044 ) ) ( not ( = ?auto_215038 ?auto_215044 ) ) ( not ( = ?auto_215039 ?auto_215044 ) ) ( not ( = ?auto_215040 ?auto_215044 ) ) ( not ( = ?auto_215041 ?auto_215044 ) ) ( not ( = ?auto_215042 ?auto_215044 ) ) ( not ( = ?auto_215043 ?auto_215044 ) ) ( ON ?auto_215042 ?auto_215043 ) ( ON-TABLE ?auto_215044 ) ( ON ?auto_215041 ?auto_215042 ) ( ON ?auto_215040 ?auto_215041 ) ( ON ?auto_215039 ?auto_215040 ) ( ON ?auto_215038 ?auto_215039 ) ( CLEAR ?auto_215038 ) ( HOLDING ?auto_215037 ) ( CLEAR ?auto_215036 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215036 ?auto_215037 )
      ( MAKE-5PILE ?auto_215036 ?auto_215037 ?auto_215038 ?auto_215039 ?auto_215040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215045 - BLOCK
      ?auto_215046 - BLOCK
      ?auto_215047 - BLOCK
      ?auto_215048 - BLOCK
      ?auto_215049 - BLOCK
    )
    :vars
    (
      ?auto_215052 - BLOCK
      ?auto_215050 - BLOCK
      ?auto_215051 - BLOCK
      ?auto_215053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215045 ) ( not ( = ?auto_215045 ?auto_215046 ) ) ( not ( = ?auto_215045 ?auto_215047 ) ) ( not ( = ?auto_215045 ?auto_215048 ) ) ( not ( = ?auto_215045 ?auto_215049 ) ) ( not ( = ?auto_215045 ?auto_215052 ) ) ( not ( = ?auto_215046 ?auto_215047 ) ) ( not ( = ?auto_215046 ?auto_215048 ) ) ( not ( = ?auto_215046 ?auto_215049 ) ) ( not ( = ?auto_215046 ?auto_215052 ) ) ( not ( = ?auto_215047 ?auto_215048 ) ) ( not ( = ?auto_215047 ?auto_215049 ) ) ( not ( = ?auto_215047 ?auto_215052 ) ) ( not ( = ?auto_215048 ?auto_215049 ) ) ( not ( = ?auto_215048 ?auto_215052 ) ) ( not ( = ?auto_215049 ?auto_215052 ) ) ( not ( = ?auto_215045 ?auto_215050 ) ) ( not ( = ?auto_215045 ?auto_215051 ) ) ( not ( = ?auto_215046 ?auto_215050 ) ) ( not ( = ?auto_215046 ?auto_215051 ) ) ( not ( = ?auto_215047 ?auto_215050 ) ) ( not ( = ?auto_215047 ?auto_215051 ) ) ( not ( = ?auto_215048 ?auto_215050 ) ) ( not ( = ?auto_215048 ?auto_215051 ) ) ( not ( = ?auto_215049 ?auto_215050 ) ) ( not ( = ?auto_215049 ?auto_215051 ) ) ( not ( = ?auto_215052 ?auto_215050 ) ) ( not ( = ?auto_215052 ?auto_215051 ) ) ( not ( = ?auto_215050 ?auto_215051 ) ) ( ON ?auto_215051 ?auto_215053 ) ( not ( = ?auto_215045 ?auto_215053 ) ) ( not ( = ?auto_215046 ?auto_215053 ) ) ( not ( = ?auto_215047 ?auto_215053 ) ) ( not ( = ?auto_215048 ?auto_215053 ) ) ( not ( = ?auto_215049 ?auto_215053 ) ) ( not ( = ?auto_215052 ?auto_215053 ) ) ( not ( = ?auto_215050 ?auto_215053 ) ) ( not ( = ?auto_215051 ?auto_215053 ) ) ( ON ?auto_215050 ?auto_215051 ) ( ON-TABLE ?auto_215053 ) ( ON ?auto_215052 ?auto_215050 ) ( ON ?auto_215049 ?auto_215052 ) ( ON ?auto_215048 ?auto_215049 ) ( ON ?auto_215047 ?auto_215048 ) ( CLEAR ?auto_215045 ) ( ON ?auto_215046 ?auto_215047 ) ( CLEAR ?auto_215046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215053 ?auto_215051 ?auto_215050 ?auto_215052 ?auto_215049 ?auto_215048 ?auto_215047 )
      ( MAKE-5PILE ?auto_215045 ?auto_215046 ?auto_215047 ?auto_215048 ?auto_215049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215054 - BLOCK
      ?auto_215055 - BLOCK
      ?auto_215056 - BLOCK
      ?auto_215057 - BLOCK
      ?auto_215058 - BLOCK
    )
    :vars
    (
      ?auto_215059 - BLOCK
      ?auto_215060 - BLOCK
      ?auto_215062 - BLOCK
      ?auto_215061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215054 ?auto_215055 ) ) ( not ( = ?auto_215054 ?auto_215056 ) ) ( not ( = ?auto_215054 ?auto_215057 ) ) ( not ( = ?auto_215054 ?auto_215058 ) ) ( not ( = ?auto_215054 ?auto_215059 ) ) ( not ( = ?auto_215055 ?auto_215056 ) ) ( not ( = ?auto_215055 ?auto_215057 ) ) ( not ( = ?auto_215055 ?auto_215058 ) ) ( not ( = ?auto_215055 ?auto_215059 ) ) ( not ( = ?auto_215056 ?auto_215057 ) ) ( not ( = ?auto_215056 ?auto_215058 ) ) ( not ( = ?auto_215056 ?auto_215059 ) ) ( not ( = ?auto_215057 ?auto_215058 ) ) ( not ( = ?auto_215057 ?auto_215059 ) ) ( not ( = ?auto_215058 ?auto_215059 ) ) ( not ( = ?auto_215054 ?auto_215060 ) ) ( not ( = ?auto_215054 ?auto_215062 ) ) ( not ( = ?auto_215055 ?auto_215060 ) ) ( not ( = ?auto_215055 ?auto_215062 ) ) ( not ( = ?auto_215056 ?auto_215060 ) ) ( not ( = ?auto_215056 ?auto_215062 ) ) ( not ( = ?auto_215057 ?auto_215060 ) ) ( not ( = ?auto_215057 ?auto_215062 ) ) ( not ( = ?auto_215058 ?auto_215060 ) ) ( not ( = ?auto_215058 ?auto_215062 ) ) ( not ( = ?auto_215059 ?auto_215060 ) ) ( not ( = ?auto_215059 ?auto_215062 ) ) ( not ( = ?auto_215060 ?auto_215062 ) ) ( ON ?auto_215062 ?auto_215061 ) ( not ( = ?auto_215054 ?auto_215061 ) ) ( not ( = ?auto_215055 ?auto_215061 ) ) ( not ( = ?auto_215056 ?auto_215061 ) ) ( not ( = ?auto_215057 ?auto_215061 ) ) ( not ( = ?auto_215058 ?auto_215061 ) ) ( not ( = ?auto_215059 ?auto_215061 ) ) ( not ( = ?auto_215060 ?auto_215061 ) ) ( not ( = ?auto_215062 ?auto_215061 ) ) ( ON ?auto_215060 ?auto_215062 ) ( ON-TABLE ?auto_215061 ) ( ON ?auto_215059 ?auto_215060 ) ( ON ?auto_215058 ?auto_215059 ) ( ON ?auto_215057 ?auto_215058 ) ( ON ?auto_215056 ?auto_215057 ) ( ON ?auto_215055 ?auto_215056 ) ( CLEAR ?auto_215055 ) ( HOLDING ?auto_215054 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215054 )
      ( MAKE-5PILE ?auto_215054 ?auto_215055 ?auto_215056 ?auto_215057 ?auto_215058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215063 - BLOCK
      ?auto_215064 - BLOCK
      ?auto_215065 - BLOCK
      ?auto_215066 - BLOCK
      ?auto_215067 - BLOCK
    )
    :vars
    (
      ?auto_215070 - BLOCK
      ?auto_215069 - BLOCK
      ?auto_215068 - BLOCK
      ?auto_215071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215063 ?auto_215064 ) ) ( not ( = ?auto_215063 ?auto_215065 ) ) ( not ( = ?auto_215063 ?auto_215066 ) ) ( not ( = ?auto_215063 ?auto_215067 ) ) ( not ( = ?auto_215063 ?auto_215070 ) ) ( not ( = ?auto_215064 ?auto_215065 ) ) ( not ( = ?auto_215064 ?auto_215066 ) ) ( not ( = ?auto_215064 ?auto_215067 ) ) ( not ( = ?auto_215064 ?auto_215070 ) ) ( not ( = ?auto_215065 ?auto_215066 ) ) ( not ( = ?auto_215065 ?auto_215067 ) ) ( not ( = ?auto_215065 ?auto_215070 ) ) ( not ( = ?auto_215066 ?auto_215067 ) ) ( not ( = ?auto_215066 ?auto_215070 ) ) ( not ( = ?auto_215067 ?auto_215070 ) ) ( not ( = ?auto_215063 ?auto_215069 ) ) ( not ( = ?auto_215063 ?auto_215068 ) ) ( not ( = ?auto_215064 ?auto_215069 ) ) ( not ( = ?auto_215064 ?auto_215068 ) ) ( not ( = ?auto_215065 ?auto_215069 ) ) ( not ( = ?auto_215065 ?auto_215068 ) ) ( not ( = ?auto_215066 ?auto_215069 ) ) ( not ( = ?auto_215066 ?auto_215068 ) ) ( not ( = ?auto_215067 ?auto_215069 ) ) ( not ( = ?auto_215067 ?auto_215068 ) ) ( not ( = ?auto_215070 ?auto_215069 ) ) ( not ( = ?auto_215070 ?auto_215068 ) ) ( not ( = ?auto_215069 ?auto_215068 ) ) ( ON ?auto_215068 ?auto_215071 ) ( not ( = ?auto_215063 ?auto_215071 ) ) ( not ( = ?auto_215064 ?auto_215071 ) ) ( not ( = ?auto_215065 ?auto_215071 ) ) ( not ( = ?auto_215066 ?auto_215071 ) ) ( not ( = ?auto_215067 ?auto_215071 ) ) ( not ( = ?auto_215070 ?auto_215071 ) ) ( not ( = ?auto_215069 ?auto_215071 ) ) ( not ( = ?auto_215068 ?auto_215071 ) ) ( ON ?auto_215069 ?auto_215068 ) ( ON-TABLE ?auto_215071 ) ( ON ?auto_215070 ?auto_215069 ) ( ON ?auto_215067 ?auto_215070 ) ( ON ?auto_215066 ?auto_215067 ) ( ON ?auto_215065 ?auto_215066 ) ( ON ?auto_215064 ?auto_215065 ) ( ON ?auto_215063 ?auto_215064 ) ( CLEAR ?auto_215063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_215071 ?auto_215068 ?auto_215069 ?auto_215070 ?auto_215067 ?auto_215066 ?auto_215065 ?auto_215064 )
      ( MAKE-5PILE ?auto_215063 ?auto_215064 ?auto_215065 ?auto_215066 ?auto_215067 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215075 - BLOCK
      ?auto_215076 - BLOCK
      ?auto_215077 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_215077 ) ( CLEAR ?auto_215076 ) ( ON-TABLE ?auto_215075 ) ( ON ?auto_215076 ?auto_215075 ) ( not ( = ?auto_215075 ?auto_215076 ) ) ( not ( = ?auto_215075 ?auto_215077 ) ) ( not ( = ?auto_215076 ?auto_215077 ) ) )
    :subtasks
    ( ( !STACK ?auto_215077 ?auto_215076 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215078 - BLOCK
      ?auto_215079 - BLOCK
      ?auto_215080 - BLOCK
    )
    :vars
    (
      ?auto_215081 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_215079 ) ( ON-TABLE ?auto_215078 ) ( ON ?auto_215079 ?auto_215078 ) ( not ( = ?auto_215078 ?auto_215079 ) ) ( not ( = ?auto_215078 ?auto_215080 ) ) ( not ( = ?auto_215079 ?auto_215080 ) ) ( ON ?auto_215080 ?auto_215081 ) ( CLEAR ?auto_215080 ) ( HAND-EMPTY ) ( not ( = ?auto_215078 ?auto_215081 ) ) ( not ( = ?auto_215079 ?auto_215081 ) ) ( not ( = ?auto_215080 ?auto_215081 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215080 ?auto_215081 )
      ( MAKE-3PILE ?auto_215078 ?auto_215079 ?auto_215080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215082 - BLOCK
      ?auto_215083 - BLOCK
      ?auto_215084 - BLOCK
    )
    :vars
    (
      ?auto_215085 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215082 ) ( not ( = ?auto_215082 ?auto_215083 ) ) ( not ( = ?auto_215082 ?auto_215084 ) ) ( not ( = ?auto_215083 ?auto_215084 ) ) ( ON ?auto_215084 ?auto_215085 ) ( CLEAR ?auto_215084 ) ( not ( = ?auto_215082 ?auto_215085 ) ) ( not ( = ?auto_215083 ?auto_215085 ) ) ( not ( = ?auto_215084 ?auto_215085 ) ) ( HOLDING ?auto_215083 ) ( CLEAR ?auto_215082 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215082 ?auto_215083 )
      ( MAKE-3PILE ?auto_215082 ?auto_215083 ?auto_215084 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215086 - BLOCK
      ?auto_215087 - BLOCK
      ?auto_215088 - BLOCK
    )
    :vars
    (
      ?auto_215089 - BLOCK
      ?auto_215092 - BLOCK
      ?auto_215093 - BLOCK
      ?auto_215090 - BLOCK
      ?auto_215091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215086 ) ( not ( = ?auto_215086 ?auto_215087 ) ) ( not ( = ?auto_215086 ?auto_215088 ) ) ( not ( = ?auto_215087 ?auto_215088 ) ) ( ON ?auto_215088 ?auto_215089 ) ( not ( = ?auto_215086 ?auto_215089 ) ) ( not ( = ?auto_215087 ?auto_215089 ) ) ( not ( = ?auto_215088 ?auto_215089 ) ) ( CLEAR ?auto_215086 ) ( ON ?auto_215087 ?auto_215088 ) ( CLEAR ?auto_215087 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215092 ) ( ON ?auto_215093 ?auto_215092 ) ( ON ?auto_215090 ?auto_215093 ) ( ON ?auto_215091 ?auto_215090 ) ( ON ?auto_215089 ?auto_215091 ) ( not ( = ?auto_215092 ?auto_215093 ) ) ( not ( = ?auto_215092 ?auto_215090 ) ) ( not ( = ?auto_215092 ?auto_215091 ) ) ( not ( = ?auto_215092 ?auto_215089 ) ) ( not ( = ?auto_215092 ?auto_215088 ) ) ( not ( = ?auto_215092 ?auto_215087 ) ) ( not ( = ?auto_215093 ?auto_215090 ) ) ( not ( = ?auto_215093 ?auto_215091 ) ) ( not ( = ?auto_215093 ?auto_215089 ) ) ( not ( = ?auto_215093 ?auto_215088 ) ) ( not ( = ?auto_215093 ?auto_215087 ) ) ( not ( = ?auto_215090 ?auto_215091 ) ) ( not ( = ?auto_215090 ?auto_215089 ) ) ( not ( = ?auto_215090 ?auto_215088 ) ) ( not ( = ?auto_215090 ?auto_215087 ) ) ( not ( = ?auto_215091 ?auto_215089 ) ) ( not ( = ?auto_215091 ?auto_215088 ) ) ( not ( = ?auto_215091 ?auto_215087 ) ) ( not ( = ?auto_215086 ?auto_215092 ) ) ( not ( = ?auto_215086 ?auto_215093 ) ) ( not ( = ?auto_215086 ?auto_215090 ) ) ( not ( = ?auto_215086 ?auto_215091 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215092 ?auto_215093 ?auto_215090 ?auto_215091 ?auto_215089 ?auto_215088 )
      ( MAKE-3PILE ?auto_215086 ?auto_215087 ?auto_215088 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215094 - BLOCK
      ?auto_215095 - BLOCK
      ?auto_215096 - BLOCK
    )
    :vars
    (
      ?auto_215097 - BLOCK
      ?auto_215100 - BLOCK
      ?auto_215098 - BLOCK
      ?auto_215099 - BLOCK
      ?auto_215101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215094 ?auto_215095 ) ) ( not ( = ?auto_215094 ?auto_215096 ) ) ( not ( = ?auto_215095 ?auto_215096 ) ) ( ON ?auto_215096 ?auto_215097 ) ( not ( = ?auto_215094 ?auto_215097 ) ) ( not ( = ?auto_215095 ?auto_215097 ) ) ( not ( = ?auto_215096 ?auto_215097 ) ) ( ON ?auto_215095 ?auto_215096 ) ( CLEAR ?auto_215095 ) ( ON-TABLE ?auto_215100 ) ( ON ?auto_215098 ?auto_215100 ) ( ON ?auto_215099 ?auto_215098 ) ( ON ?auto_215101 ?auto_215099 ) ( ON ?auto_215097 ?auto_215101 ) ( not ( = ?auto_215100 ?auto_215098 ) ) ( not ( = ?auto_215100 ?auto_215099 ) ) ( not ( = ?auto_215100 ?auto_215101 ) ) ( not ( = ?auto_215100 ?auto_215097 ) ) ( not ( = ?auto_215100 ?auto_215096 ) ) ( not ( = ?auto_215100 ?auto_215095 ) ) ( not ( = ?auto_215098 ?auto_215099 ) ) ( not ( = ?auto_215098 ?auto_215101 ) ) ( not ( = ?auto_215098 ?auto_215097 ) ) ( not ( = ?auto_215098 ?auto_215096 ) ) ( not ( = ?auto_215098 ?auto_215095 ) ) ( not ( = ?auto_215099 ?auto_215101 ) ) ( not ( = ?auto_215099 ?auto_215097 ) ) ( not ( = ?auto_215099 ?auto_215096 ) ) ( not ( = ?auto_215099 ?auto_215095 ) ) ( not ( = ?auto_215101 ?auto_215097 ) ) ( not ( = ?auto_215101 ?auto_215096 ) ) ( not ( = ?auto_215101 ?auto_215095 ) ) ( not ( = ?auto_215094 ?auto_215100 ) ) ( not ( = ?auto_215094 ?auto_215098 ) ) ( not ( = ?auto_215094 ?auto_215099 ) ) ( not ( = ?auto_215094 ?auto_215101 ) ) ( HOLDING ?auto_215094 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215094 )
      ( MAKE-3PILE ?auto_215094 ?auto_215095 ?auto_215096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215102 - BLOCK
      ?auto_215103 - BLOCK
      ?auto_215104 - BLOCK
    )
    :vars
    (
      ?auto_215105 - BLOCK
      ?auto_215108 - BLOCK
      ?auto_215109 - BLOCK
      ?auto_215106 - BLOCK
      ?auto_215107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215102 ?auto_215103 ) ) ( not ( = ?auto_215102 ?auto_215104 ) ) ( not ( = ?auto_215103 ?auto_215104 ) ) ( ON ?auto_215104 ?auto_215105 ) ( not ( = ?auto_215102 ?auto_215105 ) ) ( not ( = ?auto_215103 ?auto_215105 ) ) ( not ( = ?auto_215104 ?auto_215105 ) ) ( ON ?auto_215103 ?auto_215104 ) ( ON-TABLE ?auto_215108 ) ( ON ?auto_215109 ?auto_215108 ) ( ON ?auto_215106 ?auto_215109 ) ( ON ?auto_215107 ?auto_215106 ) ( ON ?auto_215105 ?auto_215107 ) ( not ( = ?auto_215108 ?auto_215109 ) ) ( not ( = ?auto_215108 ?auto_215106 ) ) ( not ( = ?auto_215108 ?auto_215107 ) ) ( not ( = ?auto_215108 ?auto_215105 ) ) ( not ( = ?auto_215108 ?auto_215104 ) ) ( not ( = ?auto_215108 ?auto_215103 ) ) ( not ( = ?auto_215109 ?auto_215106 ) ) ( not ( = ?auto_215109 ?auto_215107 ) ) ( not ( = ?auto_215109 ?auto_215105 ) ) ( not ( = ?auto_215109 ?auto_215104 ) ) ( not ( = ?auto_215109 ?auto_215103 ) ) ( not ( = ?auto_215106 ?auto_215107 ) ) ( not ( = ?auto_215106 ?auto_215105 ) ) ( not ( = ?auto_215106 ?auto_215104 ) ) ( not ( = ?auto_215106 ?auto_215103 ) ) ( not ( = ?auto_215107 ?auto_215105 ) ) ( not ( = ?auto_215107 ?auto_215104 ) ) ( not ( = ?auto_215107 ?auto_215103 ) ) ( not ( = ?auto_215102 ?auto_215108 ) ) ( not ( = ?auto_215102 ?auto_215109 ) ) ( not ( = ?auto_215102 ?auto_215106 ) ) ( not ( = ?auto_215102 ?auto_215107 ) ) ( ON ?auto_215102 ?auto_215103 ) ( CLEAR ?auto_215102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215108 ?auto_215109 ?auto_215106 ?auto_215107 ?auto_215105 ?auto_215104 ?auto_215103 )
      ( MAKE-3PILE ?auto_215102 ?auto_215103 ?auto_215104 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215110 - BLOCK
      ?auto_215111 - BLOCK
      ?auto_215112 - BLOCK
    )
    :vars
    (
      ?auto_215113 - BLOCK
      ?auto_215115 - BLOCK
      ?auto_215116 - BLOCK
      ?auto_215117 - BLOCK
      ?auto_215114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215110 ?auto_215111 ) ) ( not ( = ?auto_215110 ?auto_215112 ) ) ( not ( = ?auto_215111 ?auto_215112 ) ) ( ON ?auto_215112 ?auto_215113 ) ( not ( = ?auto_215110 ?auto_215113 ) ) ( not ( = ?auto_215111 ?auto_215113 ) ) ( not ( = ?auto_215112 ?auto_215113 ) ) ( ON ?auto_215111 ?auto_215112 ) ( ON-TABLE ?auto_215115 ) ( ON ?auto_215116 ?auto_215115 ) ( ON ?auto_215117 ?auto_215116 ) ( ON ?auto_215114 ?auto_215117 ) ( ON ?auto_215113 ?auto_215114 ) ( not ( = ?auto_215115 ?auto_215116 ) ) ( not ( = ?auto_215115 ?auto_215117 ) ) ( not ( = ?auto_215115 ?auto_215114 ) ) ( not ( = ?auto_215115 ?auto_215113 ) ) ( not ( = ?auto_215115 ?auto_215112 ) ) ( not ( = ?auto_215115 ?auto_215111 ) ) ( not ( = ?auto_215116 ?auto_215117 ) ) ( not ( = ?auto_215116 ?auto_215114 ) ) ( not ( = ?auto_215116 ?auto_215113 ) ) ( not ( = ?auto_215116 ?auto_215112 ) ) ( not ( = ?auto_215116 ?auto_215111 ) ) ( not ( = ?auto_215117 ?auto_215114 ) ) ( not ( = ?auto_215117 ?auto_215113 ) ) ( not ( = ?auto_215117 ?auto_215112 ) ) ( not ( = ?auto_215117 ?auto_215111 ) ) ( not ( = ?auto_215114 ?auto_215113 ) ) ( not ( = ?auto_215114 ?auto_215112 ) ) ( not ( = ?auto_215114 ?auto_215111 ) ) ( not ( = ?auto_215110 ?auto_215115 ) ) ( not ( = ?auto_215110 ?auto_215116 ) ) ( not ( = ?auto_215110 ?auto_215117 ) ) ( not ( = ?auto_215110 ?auto_215114 ) ) ( HOLDING ?auto_215110 ) ( CLEAR ?auto_215111 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_215115 ?auto_215116 ?auto_215117 ?auto_215114 ?auto_215113 ?auto_215112 ?auto_215111 ?auto_215110 )
      ( MAKE-3PILE ?auto_215110 ?auto_215111 ?auto_215112 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215118 - BLOCK
      ?auto_215119 - BLOCK
      ?auto_215120 - BLOCK
    )
    :vars
    (
      ?auto_215121 - BLOCK
      ?auto_215122 - BLOCK
      ?auto_215124 - BLOCK
      ?auto_215125 - BLOCK
      ?auto_215123 - BLOCK
      ?auto_215126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215118 ?auto_215119 ) ) ( not ( = ?auto_215118 ?auto_215120 ) ) ( not ( = ?auto_215119 ?auto_215120 ) ) ( ON ?auto_215120 ?auto_215121 ) ( not ( = ?auto_215118 ?auto_215121 ) ) ( not ( = ?auto_215119 ?auto_215121 ) ) ( not ( = ?auto_215120 ?auto_215121 ) ) ( ON ?auto_215119 ?auto_215120 ) ( ON-TABLE ?auto_215122 ) ( ON ?auto_215124 ?auto_215122 ) ( ON ?auto_215125 ?auto_215124 ) ( ON ?auto_215123 ?auto_215125 ) ( ON ?auto_215121 ?auto_215123 ) ( not ( = ?auto_215122 ?auto_215124 ) ) ( not ( = ?auto_215122 ?auto_215125 ) ) ( not ( = ?auto_215122 ?auto_215123 ) ) ( not ( = ?auto_215122 ?auto_215121 ) ) ( not ( = ?auto_215122 ?auto_215120 ) ) ( not ( = ?auto_215122 ?auto_215119 ) ) ( not ( = ?auto_215124 ?auto_215125 ) ) ( not ( = ?auto_215124 ?auto_215123 ) ) ( not ( = ?auto_215124 ?auto_215121 ) ) ( not ( = ?auto_215124 ?auto_215120 ) ) ( not ( = ?auto_215124 ?auto_215119 ) ) ( not ( = ?auto_215125 ?auto_215123 ) ) ( not ( = ?auto_215125 ?auto_215121 ) ) ( not ( = ?auto_215125 ?auto_215120 ) ) ( not ( = ?auto_215125 ?auto_215119 ) ) ( not ( = ?auto_215123 ?auto_215121 ) ) ( not ( = ?auto_215123 ?auto_215120 ) ) ( not ( = ?auto_215123 ?auto_215119 ) ) ( not ( = ?auto_215118 ?auto_215122 ) ) ( not ( = ?auto_215118 ?auto_215124 ) ) ( not ( = ?auto_215118 ?auto_215125 ) ) ( not ( = ?auto_215118 ?auto_215123 ) ) ( CLEAR ?auto_215119 ) ( ON ?auto_215118 ?auto_215126 ) ( CLEAR ?auto_215118 ) ( HAND-EMPTY ) ( not ( = ?auto_215118 ?auto_215126 ) ) ( not ( = ?auto_215119 ?auto_215126 ) ) ( not ( = ?auto_215120 ?auto_215126 ) ) ( not ( = ?auto_215121 ?auto_215126 ) ) ( not ( = ?auto_215122 ?auto_215126 ) ) ( not ( = ?auto_215124 ?auto_215126 ) ) ( not ( = ?auto_215125 ?auto_215126 ) ) ( not ( = ?auto_215123 ?auto_215126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215118 ?auto_215126 )
      ( MAKE-3PILE ?auto_215118 ?auto_215119 ?auto_215120 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215127 - BLOCK
      ?auto_215128 - BLOCK
      ?auto_215129 - BLOCK
    )
    :vars
    (
      ?auto_215135 - BLOCK
      ?auto_215134 - BLOCK
      ?auto_215132 - BLOCK
      ?auto_215130 - BLOCK
      ?auto_215133 - BLOCK
      ?auto_215131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215127 ?auto_215128 ) ) ( not ( = ?auto_215127 ?auto_215129 ) ) ( not ( = ?auto_215128 ?auto_215129 ) ) ( ON ?auto_215129 ?auto_215135 ) ( not ( = ?auto_215127 ?auto_215135 ) ) ( not ( = ?auto_215128 ?auto_215135 ) ) ( not ( = ?auto_215129 ?auto_215135 ) ) ( ON-TABLE ?auto_215134 ) ( ON ?auto_215132 ?auto_215134 ) ( ON ?auto_215130 ?auto_215132 ) ( ON ?auto_215133 ?auto_215130 ) ( ON ?auto_215135 ?auto_215133 ) ( not ( = ?auto_215134 ?auto_215132 ) ) ( not ( = ?auto_215134 ?auto_215130 ) ) ( not ( = ?auto_215134 ?auto_215133 ) ) ( not ( = ?auto_215134 ?auto_215135 ) ) ( not ( = ?auto_215134 ?auto_215129 ) ) ( not ( = ?auto_215134 ?auto_215128 ) ) ( not ( = ?auto_215132 ?auto_215130 ) ) ( not ( = ?auto_215132 ?auto_215133 ) ) ( not ( = ?auto_215132 ?auto_215135 ) ) ( not ( = ?auto_215132 ?auto_215129 ) ) ( not ( = ?auto_215132 ?auto_215128 ) ) ( not ( = ?auto_215130 ?auto_215133 ) ) ( not ( = ?auto_215130 ?auto_215135 ) ) ( not ( = ?auto_215130 ?auto_215129 ) ) ( not ( = ?auto_215130 ?auto_215128 ) ) ( not ( = ?auto_215133 ?auto_215135 ) ) ( not ( = ?auto_215133 ?auto_215129 ) ) ( not ( = ?auto_215133 ?auto_215128 ) ) ( not ( = ?auto_215127 ?auto_215134 ) ) ( not ( = ?auto_215127 ?auto_215132 ) ) ( not ( = ?auto_215127 ?auto_215130 ) ) ( not ( = ?auto_215127 ?auto_215133 ) ) ( ON ?auto_215127 ?auto_215131 ) ( CLEAR ?auto_215127 ) ( not ( = ?auto_215127 ?auto_215131 ) ) ( not ( = ?auto_215128 ?auto_215131 ) ) ( not ( = ?auto_215129 ?auto_215131 ) ) ( not ( = ?auto_215135 ?auto_215131 ) ) ( not ( = ?auto_215134 ?auto_215131 ) ) ( not ( = ?auto_215132 ?auto_215131 ) ) ( not ( = ?auto_215130 ?auto_215131 ) ) ( not ( = ?auto_215133 ?auto_215131 ) ) ( HOLDING ?auto_215128 ) ( CLEAR ?auto_215129 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215134 ?auto_215132 ?auto_215130 ?auto_215133 ?auto_215135 ?auto_215129 ?auto_215128 )
      ( MAKE-3PILE ?auto_215127 ?auto_215128 ?auto_215129 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215136 - BLOCK
      ?auto_215137 - BLOCK
      ?auto_215138 - BLOCK
    )
    :vars
    (
      ?auto_215139 - BLOCK
      ?auto_215142 - BLOCK
      ?auto_215143 - BLOCK
      ?auto_215141 - BLOCK
      ?auto_215144 - BLOCK
      ?auto_215140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215136 ?auto_215137 ) ) ( not ( = ?auto_215136 ?auto_215138 ) ) ( not ( = ?auto_215137 ?auto_215138 ) ) ( ON ?auto_215138 ?auto_215139 ) ( not ( = ?auto_215136 ?auto_215139 ) ) ( not ( = ?auto_215137 ?auto_215139 ) ) ( not ( = ?auto_215138 ?auto_215139 ) ) ( ON-TABLE ?auto_215142 ) ( ON ?auto_215143 ?auto_215142 ) ( ON ?auto_215141 ?auto_215143 ) ( ON ?auto_215144 ?auto_215141 ) ( ON ?auto_215139 ?auto_215144 ) ( not ( = ?auto_215142 ?auto_215143 ) ) ( not ( = ?auto_215142 ?auto_215141 ) ) ( not ( = ?auto_215142 ?auto_215144 ) ) ( not ( = ?auto_215142 ?auto_215139 ) ) ( not ( = ?auto_215142 ?auto_215138 ) ) ( not ( = ?auto_215142 ?auto_215137 ) ) ( not ( = ?auto_215143 ?auto_215141 ) ) ( not ( = ?auto_215143 ?auto_215144 ) ) ( not ( = ?auto_215143 ?auto_215139 ) ) ( not ( = ?auto_215143 ?auto_215138 ) ) ( not ( = ?auto_215143 ?auto_215137 ) ) ( not ( = ?auto_215141 ?auto_215144 ) ) ( not ( = ?auto_215141 ?auto_215139 ) ) ( not ( = ?auto_215141 ?auto_215138 ) ) ( not ( = ?auto_215141 ?auto_215137 ) ) ( not ( = ?auto_215144 ?auto_215139 ) ) ( not ( = ?auto_215144 ?auto_215138 ) ) ( not ( = ?auto_215144 ?auto_215137 ) ) ( not ( = ?auto_215136 ?auto_215142 ) ) ( not ( = ?auto_215136 ?auto_215143 ) ) ( not ( = ?auto_215136 ?auto_215141 ) ) ( not ( = ?auto_215136 ?auto_215144 ) ) ( ON ?auto_215136 ?auto_215140 ) ( not ( = ?auto_215136 ?auto_215140 ) ) ( not ( = ?auto_215137 ?auto_215140 ) ) ( not ( = ?auto_215138 ?auto_215140 ) ) ( not ( = ?auto_215139 ?auto_215140 ) ) ( not ( = ?auto_215142 ?auto_215140 ) ) ( not ( = ?auto_215143 ?auto_215140 ) ) ( not ( = ?auto_215141 ?auto_215140 ) ) ( not ( = ?auto_215144 ?auto_215140 ) ) ( CLEAR ?auto_215138 ) ( ON ?auto_215137 ?auto_215136 ) ( CLEAR ?auto_215137 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215140 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215140 ?auto_215136 )
      ( MAKE-3PILE ?auto_215136 ?auto_215137 ?auto_215138 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215145 - BLOCK
      ?auto_215146 - BLOCK
      ?auto_215147 - BLOCK
    )
    :vars
    (
      ?auto_215151 - BLOCK
      ?auto_215150 - BLOCK
      ?auto_215148 - BLOCK
      ?auto_215149 - BLOCK
      ?auto_215153 - BLOCK
      ?auto_215152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215145 ?auto_215146 ) ) ( not ( = ?auto_215145 ?auto_215147 ) ) ( not ( = ?auto_215146 ?auto_215147 ) ) ( not ( = ?auto_215145 ?auto_215151 ) ) ( not ( = ?auto_215146 ?auto_215151 ) ) ( not ( = ?auto_215147 ?auto_215151 ) ) ( ON-TABLE ?auto_215150 ) ( ON ?auto_215148 ?auto_215150 ) ( ON ?auto_215149 ?auto_215148 ) ( ON ?auto_215153 ?auto_215149 ) ( ON ?auto_215151 ?auto_215153 ) ( not ( = ?auto_215150 ?auto_215148 ) ) ( not ( = ?auto_215150 ?auto_215149 ) ) ( not ( = ?auto_215150 ?auto_215153 ) ) ( not ( = ?auto_215150 ?auto_215151 ) ) ( not ( = ?auto_215150 ?auto_215147 ) ) ( not ( = ?auto_215150 ?auto_215146 ) ) ( not ( = ?auto_215148 ?auto_215149 ) ) ( not ( = ?auto_215148 ?auto_215153 ) ) ( not ( = ?auto_215148 ?auto_215151 ) ) ( not ( = ?auto_215148 ?auto_215147 ) ) ( not ( = ?auto_215148 ?auto_215146 ) ) ( not ( = ?auto_215149 ?auto_215153 ) ) ( not ( = ?auto_215149 ?auto_215151 ) ) ( not ( = ?auto_215149 ?auto_215147 ) ) ( not ( = ?auto_215149 ?auto_215146 ) ) ( not ( = ?auto_215153 ?auto_215151 ) ) ( not ( = ?auto_215153 ?auto_215147 ) ) ( not ( = ?auto_215153 ?auto_215146 ) ) ( not ( = ?auto_215145 ?auto_215150 ) ) ( not ( = ?auto_215145 ?auto_215148 ) ) ( not ( = ?auto_215145 ?auto_215149 ) ) ( not ( = ?auto_215145 ?auto_215153 ) ) ( ON ?auto_215145 ?auto_215152 ) ( not ( = ?auto_215145 ?auto_215152 ) ) ( not ( = ?auto_215146 ?auto_215152 ) ) ( not ( = ?auto_215147 ?auto_215152 ) ) ( not ( = ?auto_215151 ?auto_215152 ) ) ( not ( = ?auto_215150 ?auto_215152 ) ) ( not ( = ?auto_215148 ?auto_215152 ) ) ( not ( = ?auto_215149 ?auto_215152 ) ) ( not ( = ?auto_215153 ?auto_215152 ) ) ( ON ?auto_215146 ?auto_215145 ) ( CLEAR ?auto_215146 ) ( ON-TABLE ?auto_215152 ) ( HOLDING ?auto_215147 ) ( CLEAR ?auto_215151 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215150 ?auto_215148 ?auto_215149 ?auto_215153 ?auto_215151 ?auto_215147 )
      ( MAKE-3PILE ?auto_215145 ?auto_215146 ?auto_215147 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215154 - BLOCK
      ?auto_215155 - BLOCK
      ?auto_215156 - BLOCK
    )
    :vars
    (
      ?auto_215160 - BLOCK
      ?auto_215161 - BLOCK
      ?auto_215158 - BLOCK
      ?auto_215159 - BLOCK
      ?auto_215162 - BLOCK
      ?auto_215157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215154 ?auto_215155 ) ) ( not ( = ?auto_215154 ?auto_215156 ) ) ( not ( = ?auto_215155 ?auto_215156 ) ) ( not ( = ?auto_215154 ?auto_215160 ) ) ( not ( = ?auto_215155 ?auto_215160 ) ) ( not ( = ?auto_215156 ?auto_215160 ) ) ( ON-TABLE ?auto_215161 ) ( ON ?auto_215158 ?auto_215161 ) ( ON ?auto_215159 ?auto_215158 ) ( ON ?auto_215162 ?auto_215159 ) ( ON ?auto_215160 ?auto_215162 ) ( not ( = ?auto_215161 ?auto_215158 ) ) ( not ( = ?auto_215161 ?auto_215159 ) ) ( not ( = ?auto_215161 ?auto_215162 ) ) ( not ( = ?auto_215161 ?auto_215160 ) ) ( not ( = ?auto_215161 ?auto_215156 ) ) ( not ( = ?auto_215161 ?auto_215155 ) ) ( not ( = ?auto_215158 ?auto_215159 ) ) ( not ( = ?auto_215158 ?auto_215162 ) ) ( not ( = ?auto_215158 ?auto_215160 ) ) ( not ( = ?auto_215158 ?auto_215156 ) ) ( not ( = ?auto_215158 ?auto_215155 ) ) ( not ( = ?auto_215159 ?auto_215162 ) ) ( not ( = ?auto_215159 ?auto_215160 ) ) ( not ( = ?auto_215159 ?auto_215156 ) ) ( not ( = ?auto_215159 ?auto_215155 ) ) ( not ( = ?auto_215162 ?auto_215160 ) ) ( not ( = ?auto_215162 ?auto_215156 ) ) ( not ( = ?auto_215162 ?auto_215155 ) ) ( not ( = ?auto_215154 ?auto_215161 ) ) ( not ( = ?auto_215154 ?auto_215158 ) ) ( not ( = ?auto_215154 ?auto_215159 ) ) ( not ( = ?auto_215154 ?auto_215162 ) ) ( ON ?auto_215154 ?auto_215157 ) ( not ( = ?auto_215154 ?auto_215157 ) ) ( not ( = ?auto_215155 ?auto_215157 ) ) ( not ( = ?auto_215156 ?auto_215157 ) ) ( not ( = ?auto_215160 ?auto_215157 ) ) ( not ( = ?auto_215161 ?auto_215157 ) ) ( not ( = ?auto_215158 ?auto_215157 ) ) ( not ( = ?auto_215159 ?auto_215157 ) ) ( not ( = ?auto_215162 ?auto_215157 ) ) ( ON ?auto_215155 ?auto_215154 ) ( ON-TABLE ?auto_215157 ) ( CLEAR ?auto_215160 ) ( ON ?auto_215156 ?auto_215155 ) ( CLEAR ?auto_215156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215157 ?auto_215154 ?auto_215155 )
      ( MAKE-3PILE ?auto_215154 ?auto_215155 ?auto_215156 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215163 - BLOCK
      ?auto_215164 - BLOCK
      ?auto_215165 - BLOCK
    )
    :vars
    (
      ?auto_215170 - BLOCK
      ?auto_215168 - BLOCK
      ?auto_215167 - BLOCK
      ?auto_215169 - BLOCK
      ?auto_215166 - BLOCK
      ?auto_215171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215163 ?auto_215164 ) ) ( not ( = ?auto_215163 ?auto_215165 ) ) ( not ( = ?auto_215164 ?auto_215165 ) ) ( not ( = ?auto_215163 ?auto_215170 ) ) ( not ( = ?auto_215164 ?auto_215170 ) ) ( not ( = ?auto_215165 ?auto_215170 ) ) ( ON-TABLE ?auto_215168 ) ( ON ?auto_215167 ?auto_215168 ) ( ON ?auto_215169 ?auto_215167 ) ( ON ?auto_215166 ?auto_215169 ) ( not ( = ?auto_215168 ?auto_215167 ) ) ( not ( = ?auto_215168 ?auto_215169 ) ) ( not ( = ?auto_215168 ?auto_215166 ) ) ( not ( = ?auto_215168 ?auto_215170 ) ) ( not ( = ?auto_215168 ?auto_215165 ) ) ( not ( = ?auto_215168 ?auto_215164 ) ) ( not ( = ?auto_215167 ?auto_215169 ) ) ( not ( = ?auto_215167 ?auto_215166 ) ) ( not ( = ?auto_215167 ?auto_215170 ) ) ( not ( = ?auto_215167 ?auto_215165 ) ) ( not ( = ?auto_215167 ?auto_215164 ) ) ( not ( = ?auto_215169 ?auto_215166 ) ) ( not ( = ?auto_215169 ?auto_215170 ) ) ( not ( = ?auto_215169 ?auto_215165 ) ) ( not ( = ?auto_215169 ?auto_215164 ) ) ( not ( = ?auto_215166 ?auto_215170 ) ) ( not ( = ?auto_215166 ?auto_215165 ) ) ( not ( = ?auto_215166 ?auto_215164 ) ) ( not ( = ?auto_215163 ?auto_215168 ) ) ( not ( = ?auto_215163 ?auto_215167 ) ) ( not ( = ?auto_215163 ?auto_215169 ) ) ( not ( = ?auto_215163 ?auto_215166 ) ) ( ON ?auto_215163 ?auto_215171 ) ( not ( = ?auto_215163 ?auto_215171 ) ) ( not ( = ?auto_215164 ?auto_215171 ) ) ( not ( = ?auto_215165 ?auto_215171 ) ) ( not ( = ?auto_215170 ?auto_215171 ) ) ( not ( = ?auto_215168 ?auto_215171 ) ) ( not ( = ?auto_215167 ?auto_215171 ) ) ( not ( = ?auto_215169 ?auto_215171 ) ) ( not ( = ?auto_215166 ?auto_215171 ) ) ( ON ?auto_215164 ?auto_215163 ) ( ON-TABLE ?auto_215171 ) ( ON ?auto_215165 ?auto_215164 ) ( CLEAR ?auto_215165 ) ( HOLDING ?auto_215170 ) ( CLEAR ?auto_215166 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215168 ?auto_215167 ?auto_215169 ?auto_215166 ?auto_215170 )
      ( MAKE-3PILE ?auto_215163 ?auto_215164 ?auto_215165 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215172 - BLOCK
      ?auto_215173 - BLOCK
      ?auto_215174 - BLOCK
    )
    :vars
    (
      ?auto_215175 - BLOCK
      ?auto_215179 - BLOCK
      ?auto_215176 - BLOCK
      ?auto_215178 - BLOCK
      ?auto_215180 - BLOCK
      ?auto_215177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215172 ?auto_215173 ) ) ( not ( = ?auto_215172 ?auto_215174 ) ) ( not ( = ?auto_215173 ?auto_215174 ) ) ( not ( = ?auto_215172 ?auto_215175 ) ) ( not ( = ?auto_215173 ?auto_215175 ) ) ( not ( = ?auto_215174 ?auto_215175 ) ) ( ON-TABLE ?auto_215179 ) ( ON ?auto_215176 ?auto_215179 ) ( ON ?auto_215178 ?auto_215176 ) ( ON ?auto_215180 ?auto_215178 ) ( not ( = ?auto_215179 ?auto_215176 ) ) ( not ( = ?auto_215179 ?auto_215178 ) ) ( not ( = ?auto_215179 ?auto_215180 ) ) ( not ( = ?auto_215179 ?auto_215175 ) ) ( not ( = ?auto_215179 ?auto_215174 ) ) ( not ( = ?auto_215179 ?auto_215173 ) ) ( not ( = ?auto_215176 ?auto_215178 ) ) ( not ( = ?auto_215176 ?auto_215180 ) ) ( not ( = ?auto_215176 ?auto_215175 ) ) ( not ( = ?auto_215176 ?auto_215174 ) ) ( not ( = ?auto_215176 ?auto_215173 ) ) ( not ( = ?auto_215178 ?auto_215180 ) ) ( not ( = ?auto_215178 ?auto_215175 ) ) ( not ( = ?auto_215178 ?auto_215174 ) ) ( not ( = ?auto_215178 ?auto_215173 ) ) ( not ( = ?auto_215180 ?auto_215175 ) ) ( not ( = ?auto_215180 ?auto_215174 ) ) ( not ( = ?auto_215180 ?auto_215173 ) ) ( not ( = ?auto_215172 ?auto_215179 ) ) ( not ( = ?auto_215172 ?auto_215176 ) ) ( not ( = ?auto_215172 ?auto_215178 ) ) ( not ( = ?auto_215172 ?auto_215180 ) ) ( ON ?auto_215172 ?auto_215177 ) ( not ( = ?auto_215172 ?auto_215177 ) ) ( not ( = ?auto_215173 ?auto_215177 ) ) ( not ( = ?auto_215174 ?auto_215177 ) ) ( not ( = ?auto_215175 ?auto_215177 ) ) ( not ( = ?auto_215179 ?auto_215177 ) ) ( not ( = ?auto_215176 ?auto_215177 ) ) ( not ( = ?auto_215178 ?auto_215177 ) ) ( not ( = ?auto_215180 ?auto_215177 ) ) ( ON ?auto_215173 ?auto_215172 ) ( ON-TABLE ?auto_215177 ) ( ON ?auto_215174 ?auto_215173 ) ( CLEAR ?auto_215180 ) ( ON ?auto_215175 ?auto_215174 ) ( CLEAR ?auto_215175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215177 ?auto_215172 ?auto_215173 ?auto_215174 )
      ( MAKE-3PILE ?auto_215172 ?auto_215173 ?auto_215174 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215181 - BLOCK
      ?auto_215182 - BLOCK
      ?auto_215183 - BLOCK
    )
    :vars
    (
      ?auto_215186 - BLOCK
      ?auto_215184 - BLOCK
      ?auto_215189 - BLOCK
      ?auto_215187 - BLOCK
      ?auto_215188 - BLOCK
      ?auto_215185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215181 ?auto_215182 ) ) ( not ( = ?auto_215181 ?auto_215183 ) ) ( not ( = ?auto_215182 ?auto_215183 ) ) ( not ( = ?auto_215181 ?auto_215186 ) ) ( not ( = ?auto_215182 ?auto_215186 ) ) ( not ( = ?auto_215183 ?auto_215186 ) ) ( ON-TABLE ?auto_215184 ) ( ON ?auto_215189 ?auto_215184 ) ( ON ?auto_215187 ?auto_215189 ) ( not ( = ?auto_215184 ?auto_215189 ) ) ( not ( = ?auto_215184 ?auto_215187 ) ) ( not ( = ?auto_215184 ?auto_215188 ) ) ( not ( = ?auto_215184 ?auto_215186 ) ) ( not ( = ?auto_215184 ?auto_215183 ) ) ( not ( = ?auto_215184 ?auto_215182 ) ) ( not ( = ?auto_215189 ?auto_215187 ) ) ( not ( = ?auto_215189 ?auto_215188 ) ) ( not ( = ?auto_215189 ?auto_215186 ) ) ( not ( = ?auto_215189 ?auto_215183 ) ) ( not ( = ?auto_215189 ?auto_215182 ) ) ( not ( = ?auto_215187 ?auto_215188 ) ) ( not ( = ?auto_215187 ?auto_215186 ) ) ( not ( = ?auto_215187 ?auto_215183 ) ) ( not ( = ?auto_215187 ?auto_215182 ) ) ( not ( = ?auto_215188 ?auto_215186 ) ) ( not ( = ?auto_215188 ?auto_215183 ) ) ( not ( = ?auto_215188 ?auto_215182 ) ) ( not ( = ?auto_215181 ?auto_215184 ) ) ( not ( = ?auto_215181 ?auto_215189 ) ) ( not ( = ?auto_215181 ?auto_215187 ) ) ( not ( = ?auto_215181 ?auto_215188 ) ) ( ON ?auto_215181 ?auto_215185 ) ( not ( = ?auto_215181 ?auto_215185 ) ) ( not ( = ?auto_215182 ?auto_215185 ) ) ( not ( = ?auto_215183 ?auto_215185 ) ) ( not ( = ?auto_215186 ?auto_215185 ) ) ( not ( = ?auto_215184 ?auto_215185 ) ) ( not ( = ?auto_215189 ?auto_215185 ) ) ( not ( = ?auto_215187 ?auto_215185 ) ) ( not ( = ?auto_215188 ?auto_215185 ) ) ( ON ?auto_215182 ?auto_215181 ) ( ON-TABLE ?auto_215185 ) ( ON ?auto_215183 ?auto_215182 ) ( ON ?auto_215186 ?auto_215183 ) ( CLEAR ?auto_215186 ) ( HOLDING ?auto_215188 ) ( CLEAR ?auto_215187 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215184 ?auto_215189 ?auto_215187 ?auto_215188 )
      ( MAKE-3PILE ?auto_215181 ?auto_215182 ?auto_215183 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215190 - BLOCK
      ?auto_215191 - BLOCK
      ?auto_215192 - BLOCK
    )
    :vars
    (
      ?auto_215198 - BLOCK
      ?auto_215193 - BLOCK
      ?auto_215195 - BLOCK
      ?auto_215196 - BLOCK
      ?auto_215197 - BLOCK
      ?auto_215194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215190 ?auto_215191 ) ) ( not ( = ?auto_215190 ?auto_215192 ) ) ( not ( = ?auto_215191 ?auto_215192 ) ) ( not ( = ?auto_215190 ?auto_215198 ) ) ( not ( = ?auto_215191 ?auto_215198 ) ) ( not ( = ?auto_215192 ?auto_215198 ) ) ( ON-TABLE ?auto_215193 ) ( ON ?auto_215195 ?auto_215193 ) ( ON ?auto_215196 ?auto_215195 ) ( not ( = ?auto_215193 ?auto_215195 ) ) ( not ( = ?auto_215193 ?auto_215196 ) ) ( not ( = ?auto_215193 ?auto_215197 ) ) ( not ( = ?auto_215193 ?auto_215198 ) ) ( not ( = ?auto_215193 ?auto_215192 ) ) ( not ( = ?auto_215193 ?auto_215191 ) ) ( not ( = ?auto_215195 ?auto_215196 ) ) ( not ( = ?auto_215195 ?auto_215197 ) ) ( not ( = ?auto_215195 ?auto_215198 ) ) ( not ( = ?auto_215195 ?auto_215192 ) ) ( not ( = ?auto_215195 ?auto_215191 ) ) ( not ( = ?auto_215196 ?auto_215197 ) ) ( not ( = ?auto_215196 ?auto_215198 ) ) ( not ( = ?auto_215196 ?auto_215192 ) ) ( not ( = ?auto_215196 ?auto_215191 ) ) ( not ( = ?auto_215197 ?auto_215198 ) ) ( not ( = ?auto_215197 ?auto_215192 ) ) ( not ( = ?auto_215197 ?auto_215191 ) ) ( not ( = ?auto_215190 ?auto_215193 ) ) ( not ( = ?auto_215190 ?auto_215195 ) ) ( not ( = ?auto_215190 ?auto_215196 ) ) ( not ( = ?auto_215190 ?auto_215197 ) ) ( ON ?auto_215190 ?auto_215194 ) ( not ( = ?auto_215190 ?auto_215194 ) ) ( not ( = ?auto_215191 ?auto_215194 ) ) ( not ( = ?auto_215192 ?auto_215194 ) ) ( not ( = ?auto_215198 ?auto_215194 ) ) ( not ( = ?auto_215193 ?auto_215194 ) ) ( not ( = ?auto_215195 ?auto_215194 ) ) ( not ( = ?auto_215196 ?auto_215194 ) ) ( not ( = ?auto_215197 ?auto_215194 ) ) ( ON ?auto_215191 ?auto_215190 ) ( ON-TABLE ?auto_215194 ) ( ON ?auto_215192 ?auto_215191 ) ( ON ?auto_215198 ?auto_215192 ) ( CLEAR ?auto_215196 ) ( ON ?auto_215197 ?auto_215198 ) ( CLEAR ?auto_215197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215194 ?auto_215190 ?auto_215191 ?auto_215192 ?auto_215198 )
      ( MAKE-3PILE ?auto_215190 ?auto_215191 ?auto_215192 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215199 - BLOCK
      ?auto_215200 - BLOCK
      ?auto_215201 - BLOCK
    )
    :vars
    (
      ?auto_215206 - BLOCK
      ?auto_215203 - BLOCK
      ?auto_215207 - BLOCK
      ?auto_215202 - BLOCK
      ?auto_215205 - BLOCK
      ?auto_215204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215199 ?auto_215200 ) ) ( not ( = ?auto_215199 ?auto_215201 ) ) ( not ( = ?auto_215200 ?auto_215201 ) ) ( not ( = ?auto_215199 ?auto_215206 ) ) ( not ( = ?auto_215200 ?auto_215206 ) ) ( not ( = ?auto_215201 ?auto_215206 ) ) ( ON-TABLE ?auto_215203 ) ( ON ?auto_215207 ?auto_215203 ) ( not ( = ?auto_215203 ?auto_215207 ) ) ( not ( = ?auto_215203 ?auto_215202 ) ) ( not ( = ?auto_215203 ?auto_215205 ) ) ( not ( = ?auto_215203 ?auto_215206 ) ) ( not ( = ?auto_215203 ?auto_215201 ) ) ( not ( = ?auto_215203 ?auto_215200 ) ) ( not ( = ?auto_215207 ?auto_215202 ) ) ( not ( = ?auto_215207 ?auto_215205 ) ) ( not ( = ?auto_215207 ?auto_215206 ) ) ( not ( = ?auto_215207 ?auto_215201 ) ) ( not ( = ?auto_215207 ?auto_215200 ) ) ( not ( = ?auto_215202 ?auto_215205 ) ) ( not ( = ?auto_215202 ?auto_215206 ) ) ( not ( = ?auto_215202 ?auto_215201 ) ) ( not ( = ?auto_215202 ?auto_215200 ) ) ( not ( = ?auto_215205 ?auto_215206 ) ) ( not ( = ?auto_215205 ?auto_215201 ) ) ( not ( = ?auto_215205 ?auto_215200 ) ) ( not ( = ?auto_215199 ?auto_215203 ) ) ( not ( = ?auto_215199 ?auto_215207 ) ) ( not ( = ?auto_215199 ?auto_215202 ) ) ( not ( = ?auto_215199 ?auto_215205 ) ) ( ON ?auto_215199 ?auto_215204 ) ( not ( = ?auto_215199 ?auto_215204 ) ) ( not ( = ?auto_215200 ?auto_215204 ) ) ( not ( = ?auto_215201 ?auto_215204 ) ) ( not ( = ?auto_215206 ?auto_215204 ) ) ( not ( = ?auto_215203 ?auto_215204 ) ) ( not ( = ?auto_215207 ?auto_215204 ) ) ( not ( = ?auto_215202 ?auto_215204 ) ) ( not ( = ?auto_215205 ?auto_215204 ) ) ( ON ?auto_215200 ?auto_215199 ) ( ON-TABLE ?auto_215204 ) ( ON ?auto_215201 ?auto_215200 ) ( ON ?auto_215206 ?auto_215201 ) ( ON ?auto_215205 ?auto_215206 ) ( CLEAR ?auto_215205 ) ( HOLDING ?auto_215202 ) ( CLEAR ?auto_215207 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215203 ?auto_215207 ?auto_215202 )
      ( MAKE-3PILE ?auto_215199 ?auto_215200 ?auto_215201 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215208 - BLOCK
      ?auto_215209 - BLOCK
      ?auto_215210 - BLOCK
    )
    :vars
    (
      ?auto_215216 - BLOCK
      ?auto_215214 - BLOCK
      ?auto_215213 - BLOCK
      ?auto_215215 - BLOCK
      ?auto_215211 - BLOCK
      ?auto_215212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215208 ?auto_215209 ) ) ( not ( = ?auto_215208 ?auto_215210 ) ) ( not ( = ?auto_215209 ?auto_215210 ) ) ( not ( = ?auto_215208 ?auto_215216 ) ) ( not ( = ?auto_215209 ?auto_215216 ) ) ( not ( = ?auto_215210 ?auto_215216 ) ) ( ON-TABLE ?auto_215214 ) ( ON ?auto_215213 ?auto_215214 ) ( not ( = ?auto_215214 ?auto_215213 ) ) ( not ( = ?auto_215214 ?auto_215215 ) ) ( not ( = ?auto_215214 ?auto_215211 ) ) ( not ( = ?auto_215214 ?auto_215216 ) ) ( not ( = ?auto_215214 ?auto_215210 ) ) ( not ( = ?auto_215214 ?auto_215209 ) ) ( not ( = ?auto_215213 ?auto_215215 ) ) ( not ( = ?auto_215213 ?auto_215211 ) ) ( not ( = ?auto_215213 ?auto_215216 ) ) ( not ( = ?auto_215213 ?auto_215210 ) ) ( not ( = ?auto_215213 ?auto_215209 ) ) ( not ( = ?auto_215215 ?auto_215211 ) ) ( not ( = ?auto_215215 ?auto_215216 ) ) ( not ( = ?auto_215215 ?auto_215210 ) ) ( not ( = ?auto_215215 ?auto_215209 ) ) ( not ( = ?auto_215211 ?auto_215216 ) ) ( not ( = ?auto_215211 ?auto_215210 ) ) ( not ( = ?auto_215211 ?auto_215209 ) ) ( not ( = ?auto_215208 ?auto_215214 ) ) ( not ( = ?auto_215208 ?auto_215213 ) ) ( not ( = ?auto_215208 ?auto_215215 ) ) ( not ( = ?auto_215208 ?auto_215211 ) ) ( ON ?auto_215208 ?auto_215212 ) ( not ( = ?auto_215208 ?auto_215212 ) ) ( not ( = ?auto_215209 ?auto_215212 ) ) ( not ( = ?auto_215210 ?auto_215212 ) ) ( not ( = ?auto_215216 ?auto_215212 ) ) ( not ( = ?auto_215214 ?auto_215212 ) ) ( not ( = ?auto_215213 ?auto_215212 ) ) ( not ( = ?auto_215215 ?auto_215212 ) ) ( not ( = ?auto_215211 ?auto_215212 ) ) ( ON ?auto_215209 ?auto_215208 ) ( ON-TABLE ?auto_215212 ) ( ON ?auto_215210 ?auto_215209 ) ( ON ?auto_215216 ?auto_215210 ) ( ON ?auto_215211 ?auto_215216 ) ( CLEAR ?auto_215213 ) ( ON ?auto_215215 ?auto_215211 ) ( CLEAR ?auto_215215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215212 ?auto_215208 ?auto_215209 ?auto_215210 ?auto_215216 ?auto_215211 )
      ( MAKE-3PILE ?auto_215208 ?auto_215209 ?auto_215210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215217 - BLOCK
      ?auto_215218 - BLOCK
      ?auto_215219 - BLOCK
    )
    :vars
    (
      ?auto_215223 - BLOCK
      ?auto_215222 - BLOCK
      ?auto_215221 - BLOCK
      ?auto_215220 - BLOCK
      ?auto_215225 - BLOCK
      ?auto_215224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215217 ?auto_215218 ) ) ( not ( = ?auto_215217 ?auto_215219 ) ) ( not ( = ?auto_215218 ?auto_215219 ) ) ( not ( = ?auto_215217 ?auto_215223 ) ) ( not ( = ?auto_215218 ?auto_215223 ) ) ( not ( = ?auto_215219 ?auto_215223 ) ) ( ON-TABLE ?auto_215222 ) ( not ( = ?auto_215222 ?auto_215221 ) ) ( not ( = ?auto_215222 ?auto_215220 ) ) ( not ( = ?auto_215222 ?auto_215225 ) ) ( not ( = ?auto_215222 ?auto_215223 ) ) ( not ( = ?auto_215222 ?auto_215219 ) ) ( not ( = ?auto_215222 ?auto_215218 ) ) ( not ( = ?auto_215221 ?auto_215220 ) ) ( not ( = ?auto_215221 ?auto_215225 ) ) ( not ( = ?auto_215221 ?auto_215223 ) ) ( not ( = ?auto_215221 ?auto_215219 ) ) ( not ( = ?auto_215221 ?auto_215218 ) ) ( not ( = ?auto_215220 ?auto_215225 ) ) ( not ( = ?auto_215220 ?auto_215223 ) ) ( not ( = ?auto_215220 ?auto_215219 ) ) ( not ( = ?auto_215220 ?auto_215218 ) ) ( not ( = ?auto_215225 ?auto_215223 ) ) ( not ( = ?auto_215225 ?auto_215219 ) ) ( not ( = ?auto_215225 ?auto_215218 ) ) ( not ( = ?auto_215217 ?auto_215222 ) ) ( not ( = ?auto_215217 ?auto_215221 ) ) ( not ( = ?auto_215217 ?auto_215220 ) ) ( not ( = ?auto_215217 ?auto_215225 ) ) ( ON ?auto_215217 ?auto_215224 ) ( not ( = ?auto_215217 ?auto_215224 ) ) ( not ( = ?auto_215218 ?auto_215224 ) ) ( not ( = ?auto_215219 ?auto_215224 ) ) ( not ( = ?auto_215223 ?auto_215224 ) ) ( not ( = ?auto_215222 ?auto_215224 ) ) ( not ( = ?auto_215221 ?auto_215224 ) ) ( not ( = ?auto_215220 ?auto_215224 ) ) ( not ( = ?auto_215225 ?auto_215224 ) ) ( ON ?auto_215218 ?auto_215217 ) ( ON-TABLE ?auto_215224 ) ( ON ?auto_215219 ?auto_215218 ) ( ON ?auto_215223 ?auto_215219 ) ( ON ?auto_215225 ?auto_215223 ) ( ON ?auto_215220 ?auto_215225 ) ( CLEAR ?auto_215220 ) ( HOLDING ?auto_215221 ) ( CLEAR ?auto_215222 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215222 ?auto_215221 )
      ( MAKE-3PILE ?auto_215217 ?auto_215218 ?auto_215219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215226 - BLOCK
      ?auto_215227 - BLOCK
      ?auto_215228 - BLOCK
    )
    :vars
    (
      ?auto_215229 - BLOCK
      ?auto_215232 - BLOCK
      ?auto_215230 - BLOCK
      ?auto_215234 - BLOCK
      ?auto_215231 - BLOCK
      ?auto_215233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215226 ?auto_215227 ) ) ( not ( = ?auto_215226 ?auto_215228 ) ) ( not ( = ?auto_215227 ?auto_215228 ) ) ( not ( = ?auto_215226 ?auto_215229 ) ) ( not ( = ?auto_215227 ?auto_215229 ) ) ( not ( = ?auto_215228 ?auto_215229 ) ) ( ON-TABLE ?auto_215232 ) ( not ( = ?auto_215232 ?auto_215230 ) ) ( not ( = ?auto_215232 ?auto_215234 ) ) ( not ( = ?auto_215232 ?auto_215231 ) ) ( not ( = ?auto_215232 ?auto_215229 ) ) ( not ( = ?auto_215232 ?auto_215228 ) ) ( not ( = ?auto_215232 ?auto_215227 ) ) ( not ( = ?auto_215230 ?auto_215234 ) ) ( not ( = ?auto_215230 ?auto_215231 ) ) ( not ( = ?auto_215230 ?auto_215229 ) ) ( not ( = ?auto_215230 ?auto_215228 ) ) ( not ( = ?auto_215230 ?auto_215227 ) ) ( not ( = ?auto_215234 ?auto_215231 ) ) ( not ( = ?auto_215234 ?auto_215229 ) ) ( not ( = ?auto_215234 ?auto_215228 ) ) ( not ( = ?auto_215234 ?auto_215227 ) ) ( not ( = ?auto_215231 ?auto_215229 ) ) ( not ( = ?auto_215231 ?auto_215228 ) ) ( not ( = ?auto_215231 ?auto_215227 ) ) ( not ( = ?auto_215226 ?auto_215232 ) ) ( not ( = ?auto_215226 ?auto_215230 ) ) ( not ( = ?auto_215226 ?auto_215234 ) ) ( not ( = ?auto_215226 ?auto_215231 ) ) ( ON ?auto_215226 ?auto_215233 ) ( not ( = ?auto_215226 ?auto_215233 ) ) ( not ( = ?auto_215227 ?auto_215233 ) ) ( not ( = ?auto_215228 ?auto_215233 ) ) ( not ( = ?auto_215229 ?auto_215233 ) ) ( not ( = ?auto_215232 ?auto_215233 ) ) ( not ( = ?auto_215230 ?auto_215233 ) ) ( not ( = ?auto_215234 ?auto_215233 ) ) ( not ( = ?auto_215231 ?auto_215233 ) ) ( ON ?auto_215227 ?auto_215226 ) ( ON-TABLE ?auto_215233 ) ( ON ?auto_215228 ?auto_215227 ) ( ON ?auto_215229 ?auto_215228 ) ( ON ?auto_215231 ?auto_215229 ) ( ON ?auto_215234 ?auto_215231 ) ( CLEAR ?auto_215232 ) ( ON ?auto_215230 ?auto_215234 ) ( CLEAR ?auto_215230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215233 ?auto_215226 ?auto_215227 ?auto_215228 ?auto_215229 ?auto_215231 ?auto_215234 )
      ( MAKE-3PILE ?auto_215226 ?auto_215227 ?auto_215228 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215235 - BLOCK
      ?auto_215236 - BLOCK
      ?auto_215237 - BLOCK
    )
    :vars
    (
      ?auto_215242 - BLOCK
      ?auto_215240 - BLOCK
      ?auto_215241 - BLOCK
      ?auto_215238 - BLOCK
      ?auto_215243 - BLOCK
      ?auto_215239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215235 ?auto_215236 ) ) ( not ( = ?auto_215235 ?auto_215237 ) ) ( not ( = ?auto_215236 ?auto_215237 ) ) ( not ( = ?auto_215235 ?auto_215242 ) ) ( not ( = ?auto_215236 ?auto_215242 ) ) ( not ( = ?auto_215237 ?auto_215242 ) ) ( not ( = ?auto_215240 ?auto_215241 ) ) ( not ( = ?auto_215240 ?auto_215238 ) ) ( not ( = ?auto_215240 ?auto_215243 ) ) ( not ( = ?auto_215240 ?auto_215242 ) ) ( not ( = ?auto_215240 ?auto_215237 ) ) ( not ( = ?auto_215240 ?auto_215236 ) ) ( not ( = ?auto_215241 ?auto_215238 ) ) ( not ( = ?auto_215241 ?auto_215243 ) ) ( not ( = ?auto_215241 ?auto_215242 ) ) ( not ( = ?auto_215241 ?auto_215237 ) ) ( not ( = ?auto_215241 ?auto_215236 ) ) ( not ( = ?auto_215238 ?auto_215243 ) ) ( not ( = ?auto_215238 ?auto_215242 ) ) ( not ( = ?auto_215238 ?auto_215237 ) ) ( not ( = ?auto_215238 ?auto_215236 ) ) ( not ( = ?auto_215243 ?auto_215242 ) ) ( not ( = ?auto_215243 ?auto_215237 ) ) ( not ( = ?auto_215243 ?auto_215236 ) ) ( not ( = ?auto_215235 ?auto_215240 ) ) ( not ( = ?auto_215235 ?auto_215241 ) ) ( not ( = ?auto_215235 ?auto_215238 ) ) ( not ( = ?auto_215235 ?auto_215243 ) ) ( ON ?auto_215235 ?auto_215239 ) ( not ( = ?auto_215235 ?auto_215239 ) ) ( not ( = ?auto_215236 ?auto_215239 ) ) ( not ( = ?auto_215237 ?auto_215239 ) ) ( not ( = ?auto_215242 ?auto_215239 ) ) ( not ( = ?auto_215240 ?auto_215239 ) ) ( not ( = ?auto_215241 ?auto_215239 ) ) ( not ( = ?auto_215238 ?auto_215239 ) ) ( not ( = ?auto_215243 ?auto_215239 ) ) ( ON ?auto_215236 ?auto_215235 ) ( ON-TABLE ?auto_215239 ) ( ON ?auto_215237 ?auto_215236 ) ( ON ?auto_215242 ?auto_215237 ) ( ON ?auto_215243 ?auto_215242 ) ( ON ?auto_215238 ?auto_215243 ) ( ON ?auto_215241 ?auto_215238 ) ( CLEAR ?auto_215241 ) ( HOLDING ?auto_215240 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215240 )
      ( MAKE-3PILE ?auto_215235 ?auto_215236 ?auto_215237 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215244 - BLOCK
      ?auto_215245 - BLOCK
      ?auto_215246 - BLOCK
    )
    :vars
    (
      ?auto_215248 - BLOCK
      ?auto_215250 - BLOCK
      ?auto_215249 - BLOCK
      ?auto_215247 - BLOCK
      ?auto_215251 - BLOCK
      ?auto_215252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215244 ?auto_215245 ) ) ( not ( = ?auto_215244 ?auto_215246 ) ) ( not ( = ?auto_215245 ?auto_215246 ) ) ( not ( = ?auto_215244 ?auto_215248 ) ) ( not ( = ?auto_215245 ?auto_215248 ) ) ( not ( = ?auto_215246 ?auto_215248 ) ) ( not ( = ?auto_215250 ?auto_215249 ) ) ( not ( = ?auto_215250 ?auto_215247 ) ) ( not ( = ?auto_215250 ?auto_215251 ) ) ( not ( = ?auto_215250 ?auto_215248 ) ) ( not ( = ?auto_215250 ?auto_215246 ) ) ( not ( = ?auto_215250 ?auto_215245 ) ) ( not ( = ?auto_215249 ?auto_215247 ) ) ( not ( = ?auto_215249 ?auto_215251 ) ) ( not ( = ?auto_215249 ?auto_215248 ) ) ( not ( = ?auto_215249 ?auto_215246 ) ) ( not ( = ?auto_215249 ?auto_215245 ) ) ( not ( = ?auto_215247 ?auto_215251 ) ) ( not ( = ?auto_215247 ?auto_215248 ) ) ( not ( = ?auto_215247 ?auto_215246 ) ) ( not ( = ?auto_215247 ?auto_215245 ) ) ( not ( = ?auto_215251 ?auto_215248 ) ) ( not ( = ?auto_215251 ?auto_215246 ) ) ( not ( = ?auto_215251 ?auto_215245 ) ) ( not ( = ?auto_215244 ?auto_215250 ) ) ( not ( = ?auto_215244 ?auto_215249 ) ) ( not ( = ?auto_215244 ?auto_215247 ) ) ( not ( = ?auto_215244 ?auto_215251 ) ) ( ON ?auto_215244 ?auto_215252 ) ( not ( = ?auto_215244 ?auto_215252 ) ) ( not ( = ?auto_215245 ?auto_215252 ) ) ( not ( = ?auto_215246 ?auto_215252 ) ) ( not ( = ?auto_215248 ?auto_215252 ) ) ( not ( = ?auto_215250 ?auto_215252 ) ) ( not ( = ?auto_215249 ?auto_215252 ) ) ( not ( = ?auto_215247 ?auto_215252 ) ) ( not ( = ?auto_215251 ?auto_215252 ) ) ( ON ?auto_215245 ?auto_215244 ) ( ON-TABLE ?auto_215252 ) ( ON ?auto_215246 ?auto_215245 ) ( ON ?auto_215248 ?auto_215246 ) ( ON ?auto_215251 ?auto_215248 ) ( ON ?auto_215247 ?auto_215251 ) ( ON ?auto_215249 ?auto_215247 ) ( ON ?auto_215250 ?auto_215249 ) ( CLEAR ?auto_215250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_215252 ?auto_215244 ?auto_215245 ?auto_215246 ?auto_215248 ?auto_215251 ?auto_215247 ?auto_215249 )
      ( MAKE-3PILE ?auto_215244 ?auto_215245 ?auto_215246 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215257 - BLOCK
      ?auto_215258 - BLOCK
      ?auto_215259 - BLOCK
      ?auto_215260 - BLOCK
    )
    :vars
    (
      ?auto_215261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215261 ?auto_215260 ) ( CLEAR ?auto_215261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215257 ) ( ON ?auto_215258 ?auto_215257 ) ( ON ?auto_215259 ?auto_215258 ) ( ON ?auto_215260 ?auto_215259 ) ( not ( = ?auto_215257 ?auto_215258 ) ) ( not ( = ?auto_215257 ?auto_215259 ) ) ( not ( = ?auto_215257 ?auto_215260 ) ) ( not ( = ?auto_215257 ?auto_215261 ) ) ( not ( = ?auto_215258 ?auto_215259 ) ) ( not ( = ?auto_215258 ?auto_215260 ) ) ( not ( = ?auto_215258 ?auto_215261 ) ) ( not ( = ?auto_215259 ?auto_215260 ) ) ( not ( = ?auto_215259 ?auto_215261 ) ) ( not ( = ?auto_215260 ?auto_215261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215261 ?auto_215260 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215262 - BLOCK
      ?auto_215263 - BLOCK
      ?auto_215264 - BLOCK
      ?auto_215265 - BLOCK
    )
    :vars
    (
      ?auto_215266 - BLOCK
      ?auto_215267 - BLOCK
      ?auto_215268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215266 ?auto_215265 ) ( CLEAR ?auto_215266 ) ( ON-TABLE ?auto_215262 ) ( ON ?auto_215263 ?auto_215262 ) ( ON ?auto_215264 ?auto_215263 ) ( ON ?auto_215265 ?auto_215264 ) ( not ( = ?auto_215262 ?auto_215263 ) ) ( not ( = ?auto_215262 ?auto_215264 ) ) ( not ( = ?auto_215262 ?auto_215265 ) ) ( not ( = ?auto_215262 ?auto_215266 ) ) ( not ( = ?auto_215263 ?auto_215264 ) ) ( not ( = ?auto_215263 ?auto_215265 ) ) ( not ( = ?auto_215263 ?auto_215266 ) ) ( not ( = ?auto_215264 ?auto_215265 ) ) ( not ( = ?auto_215264 ?auto_215266 ) ) ( not ( = ?auto_215265 ?auto_215266 ) ) ( HOLDING ?auto_215267 ) ( CLEAR ?auto_215268 ) ( not ( = ?auto_215262 ?auto_215267 ) ) ( not ( = ?auto_215262 ?auto_215268 ) ) ( not ( = ?auto_215263 ?auto_215267 ) ) ( not ( = ?auto_215263 ?auto_215268 ) ) ( not ( = ?auto_215264 ?auto_215267 ) ) ( not ( = ?auto_215264 ?auto_215268 ) ) ( not ( = ?auto_215265 ?auto_215267 ) ) ( not ( = ?auto_215265 ?auto_215268 ) ) ( not ( = ?auto_215266 ?auto_215267 ) ) ( not ( = ?auto_215266 ?auto_215268 ) ) ( not ( = ?auto_215267 ?auto_215268 ) ) )
    :subtasks
    ( ( !STACK ?auto_215267 ?auto_215268 )
      ( MAKE-4PILE ?auto_215262 ?auto_215263 ?auto_215264 ?auto_215265 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215269 - BLOCK
      ?auto_215270 - BLOCK
      ?auto_215271 - BLOCK
      ?auto_215272 - BLOCK
    )
    :vars
    (
      ?auto_215273 - BLOCK
      ?auto_215274 - BLOCK
      ?auto_215275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215273 ?auto_215272 ) ( ON-TABLE ?auto_215269 ) ( ON ?auto_215270 ?auto_215269 ) ( ON ?auto_215271 ?auto_215270 ) ( ON ?auto_215272 ?auto_215271 ) ( not ( = ?auto_215269 ?auto_215270 ) ) ( not ( = ?auto_215269 ?auto_215271 ) ) ( not ( = ?auto_215269 ?auto_215272 ) ) ( not ( = ?auto_215269 ?auto_215273 ) ) ( not ( = ?auto_215270 ?auto_215271 ) ) ( not ( = ?auto_215270 ?auto_215272 ) ) ( not ( = ?auto_215270 ?auto_215273 ) ) ( not ( = ?auto_215271 ?auto_215272 ) ) ( not ( = ?auto_215271 ?auto_215273 ) ) ( not ( = ?auto_215272 ?auto_215273 ) ) ( CLEAR ?auto_215274 ) ( not ( = ?auto_215269 ?auto_215275 ) ) ( not ( = ?auto_215269 ?auto_215274 ) ) ( not ( = ?auto_215270 ?auto_215275 ) ) ( not ( = ?auto_215270 ?auto_215274 ) ) ( not ( = ?auto_215271 ?auto_215275 ) ) ( not ( = ?auto_215271 ?auto_215274 ) ) ( not ( = ?auto_215272 ?auto_215275 ) ) ( not ( = ?auto_215272 ?auto_215274 ) ) ( not ( = ?auto_215273 ?auto_215275 ) ) ( not ( = ?auto_215273 ?auto_215274 ) ) ( not ( = ?auto_215275 ?auto_215274 ) ) ( ON ?auto_215275 ?auto_215273 ) ( CLEAR ?auto_215275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215269 ?auto_215270 ?auto_215271 ?auto_215272 ?auto_215273 )
      ( MAKE-4PILE ?auto_215269 ?auto_215270 ?auto_215271 ?auto_215272 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215276 - BLOCK
      ?auto_215277 - BLOCK
      ?auto_215278 - BLOCK
      ?auto_215279 - BLOCK
    )
    :vars
    (
      ?auto_215280 - BLOCK
      ?auto_215282 - BLOCK
      ?auto_215281 - BLOCK
      ?auto_215283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215280 ?auto_215279 ) ( ON-TABLE ?auto_215276 ) ( ON ?auto_215277 ?auto_215276 ) ( ON ?auto_215278 ?auto_215277 ) ( ON ?auto_215279 ?auto_215278 ) ( not ( = ?auto_215276 ?auto_215277 ) ) ( not ( = ?auto_215276 ?auto_215278 ) ) ( not ( = ?auto_215276 ?auto_215279 ) ) ( not ( = ?auto_215276 ?auto_215280 ) ) ( not ( = ?auto_215277 ?auto_215278 ) ) ( not ( = ?auto_215277 ?auto_215279 ) ) ( not ( = ?auto_215277 ?auto_215280 ) ) ( not ( = ?auto_215278 ?auto_215279 ) ) ( not ( = ?auto_215278 ?auto_215280 ) ) ( not ( = ?auto_215279 ?auto_215280 ) ) ( not ( = ?auto_215276 ?auto_215282 ) ) ( not ( = ?auto_215276 ?auto_215281 ) ) ( not ( = ?auto_215277 ?auto_215282 ) ) ( not ( = ?auto_215277 ?auto_215281 ) ) ( not ( = ?auto_215278 ?auto_215282 ) ) ( not ( = ?auto_215278 ?auto_215281 ) ) ( not ( = ?auto_215279 ?auto_215282 ) ) ( not ( = ?auto_215279 ?auto_215281 ) ) ( not ( = ?auto_215280 ?auto_215282 ) ) ( not ( = ?auto_215280 ?auto_215281 ) ) ( not ( = ?auto_215282 ?auto_215281 ) ) ( ON ?auto_215282 ?auto_215280 ) ( CLEAR ?auto_215282 ) ( HOLDING ?auto_215281 ) ( CLEAR ?auto_215283 ) ( ON-TABLE ?auto_215283 ) ( not ( = ?auto_215283 ?auto_215281 ) ) ( not ( = ?auto_215276 ?auto_215283 ) ) ( not ( = ?auto_215277 ?auto_215283 ) ) ( not ( = ?auto_215278 ?auto_215283 ) ) ( not ( = ?auto_215279 ?auto_215283 ) ) ( not ( = ?auto_215280 ?auto_215283 ) ) ( not ( = ?auto_215282 ?auto_215283 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215283 ?auto_215281 )
      ( MAKE-4PILE ?auto_215276 ?auto_215277 ?auto_215278 ?auto_215279 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215284 - BLOCK
      ?auto_215285 - BLOCK
      ?auto_215286 - BLOCK
      ?auto_215287 - BLOCK
    )
    :vars
    (
      ?auto_215289 - BLOCK
      ?auto_215290 - BLOCK
      ?auto_215288 - BLOCK
      ?auto_215291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215289 ?auto_215287 ) ( ON-TABLE ?auto_215284 ) ( ON ?auto_215285 ?auto_215284 ) ( ON ?auto_215286 ?auto_215285 ) ( ON ?auto_215287 ?auto_215286 ) ( not ( = ?auto_215284 ?auto_215285 ) ) ( not ( = ?auto_215284 ?auto_215286 ) ) ( not ( = ?auto_215284 ?auto_215287 ) ) ( not ( = ?auto_215284 ?auto_215289 ) ) ( not ( = ?auto_215285 ?auto_215286 ) ) ( not ( = ?auto_215285 ?auto_215287 ) ) ( not ( = ?auto_215285 ?auto_215289 ) ) ( not ( = ?auto_215286 ?auto_215287 ) ) ( not ( = ?auto_215286 ?auto_215289 ) ) ( not ( = ?auto_215287 ?auto_215289 ) ) ( not ( = ?auto_215284 ?auto_215290 ) ) ( not ( = ?auto_215284 ?auto_215288 ) ) ( not ( = ?auto_215285 ?auto_215290 ) ) ( not ( = ?auto_215285 ?auto_215288 ) ) ( not ( = ?auto_215286 ?auto_215290 ) ) ( not ( = ?auto_215286 ?auto_215288 ) ) ( not ( = ?auto_215287 ?auto_215290 ) ) ( not ( = ?auto_215287 ?auto_215288 ) ) ( not ( = ?auto_215289 ?auto_215290 ) ) ( not ( = ?auto_215289 ?auto_215288 ) ) ( not ( = ?auto_215290 ?auto_215288 ) ) ( ON ?auto_215290 ?auto_215289 ) ( CLEAR ?auto_215291 ) ( ON-TABLE ?auto_215291 ) ( not ( = ?auto_215291 ?auto_215288 ) ) ( not ( = ?auto_215284 ?auto_215291 ) ) ( not ( = ?auto_215285 ?auto_215291 ) ) ( not ( = ?auto_215286 ?auto_215291 ) ) ( not ( = ?auto_215287 ?auto_215291 ) ) ( not ( = ?auto_215289 ?auto_215291 ) ) ( not ( = ?auto_215290 ?auto_215291 ) ) ( ON ?auto_215288 ?auto_215290 ) ( CLEAR ?auto_215288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215284 ?auto_215285 ?auto_215286 ?auto_215287 ?auto_215289 ?auto_215290 )
      ( MAKE-4PILE ?auto_215284 ?auto_215285 ?auto_215286 ?auto_215287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215292 - BLOCK
      ?auto_215293 - BLOCK
      ?auto_215294 - BLOCK
      ?auto_215295 - BLOCK
    )
    :vars
    (
      ?auto_215299 - BLOCK
      ?auto_215297 - BLOCK
      ?auto_215298 - BLOCK
      ?auto_215296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215299 ?auto_215295 ) ( ON-TABLE ?auto_215292 ) ( ON ?auto_215293 ?auto_215292 ) ( ON ?auto_215294 ?auto_215293 ) ( ON ?auto_215295 ?auto_215294 ) ( not ( = ?auto_215292 ?auto_215293 ) ) ( not ( = ?auto_215292 ?auto_215294 ) ) ( not ( = ?auto_215292 ?auto_215295 ) ) ( not ( = ?auto_215292 ?auto_215299 ) ) ( not ( = ?auto_215293 ?auto_215294 ) ) ( not ( = ?auto_215293 ?auto_215295 ) ) ( not ( = ?auto_215293 ?auto_215299 ) ) ( not ( = ?auto_215294 ?auto_215295 ) ) ( not ( = ?auto_215294 ?auto_215299 ) ) ( not ( = ?auto_215295 ?auto_215299 ) ) ( not ( = ?auto_215292 ?auto_215297 ) ) ( not ( = ?auto_215292 ?auto_215298 ) ) ( not ( = ?auto_215293 ?auto_215297 ) ) ( not ( = ?auto_215293 ?auto_215298 ) ) ( not ( = ?auto_215294 ?auto_215297 ) ) ( not ( = ?auto_215294 ?auto_215298 ) ) ( not ( = ?auto_215295 ?auto_215297 ) ) ( not ( = ?auto_215295 ?auto_215298 ) ) ( not ( = ?auto_215299 ?auto_215297 ) ) ( not ( = ?auto_215299 ?auto_215298 ) ) ( not ( = ?auto_215297 ?auto_215298 ) ) ( ON ?auto_215297 ?auto_215299 ) ( not ( = ?auto_215296 ?auto_215298 ) ) ( not ( = ?auto_215292 ?auto_215296 ) ) ( not ( = ?auto_215293 ?auto_215296 ) ) ( not ( = ?auto_215294 ?auto_215296 ) ) ( not ( = ?auto_215295 ?auto_215296 ) ) ( not ( = ?auto_215299 ?auto_215296 ) ) ( not ( = ?auto_215297 ?auto_215296 ) ) ( ON ?auto_215298 ?auto_215297 ) ( CLEAR ?auto_215298 ) ( HOLDING ?auto_215296 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215296 )
      ( MAKE-4PILE ?auto_215292 ?auto_215293 ?auto_215294 ?auto_215295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215300 - BLOCK
      ?auto_215301 - BLOCK
      ?auto_215302 - BLOCK
      ?auto_215303 - BLOCK
    )
    :vars
    (
      ?auto_215307 - BLOCK
      ?auto_215304 - BLOCK
      ?auto_215306 - BLOCK
      ?auto_215305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215307 ?auto_215303 ) ( ON-TABLE ?auto_215300 ) ( ON ?auto_215301 ?auto_215300 ) ( ON ?auto_215302 ?auto_215301 ) ( ON ?auto_215303 ?auto_215302 ) ( not ( = ?auto_215300 ?auto_215301 ) ) ( not ( = ?auto_215300 ?auto_215302 ) ) ( not ( = ?auto_215300 ?auto_215303 ) ) ( not ( = ?auto_215300 ?auto_215307 ) ) ( not ( = ?auto_215301 ?auto_215302 ) ) ( not ( = ?auto_215301 ?auto_215303 ) ) ( not ( = ?auto_215301 ?auto_215307 ) ) ( not ( = ?auto_215302 ?auto_215303 ) ) ( not ( = ?auto_215302 ?auto_215307 ) ) ( not ( = ?auto_215303 ?auto_215307 ) ) ( not ( = ?auto_215300 ?auto_215304 ) ) ( not ( = ?auto_215300 ?auto_215306 ) ) ( not ( = ?auto_215301 ?auto_215304 ) ) ( not ( = ?auto_215301 ?auto_215306 ) ) ( not ( = ?auto_215302 ?auto_215304 ) ) ( not ( = ?auto_215302 ?auto_215306 ) ) ( not ( = ?auto_215303 ?auto_215304 ) ) ( not ( = ?auto_215303 ?auto_215306 ) ) ( not ( = ?auto_215307 ?auto_215304 ) ) ( not ( = ?auto_215307 ?auto_215306 ) ) ( not ( = ?auto_215304 ?auto_215306 ) ) ( ON ?auto_215304 ?auto_215307 ) ( not ( = ?auto_215305 ?auto_215306 ) ) ( not ( = ?auto_215300 ?auto_215305 ) ) ( not ( = ?auto_215301 ?auto_215305 ) ) ( not ( = ?auto_215302 ?auto_215305 ) ) ( not ( = ?auto_215303 ?auto_215305 ) ) ( not ( = ?auto_215307 ?auto_215305 ) ) ( not ( = ?auto_215304 ?auto_215305 ) ) ( ON ?auto_215306 ?auto_215304 ) ( ON ?auto_215305 ?auto_215306 ) ( CLEAR ?auto_215305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215300 ?auto_215301 ?auto_215302 ?auto_215303 ?auto_215307 ?auto_215304 ?auto_215306 )
      ( MAKE-4PILE ?auto_215300 ?auto_215301 ?auto_215302 ?auto_215303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215308 - BLOCK
      ?auto_215309 - BLOCK
      ?auto_215310 - BLOCK
      ?auto_215311 - BLOCK
    )
    :vars
    (
      ?auto_215314 - BLOCK
      ?auto_215312 - BLOCK
      ?auto_215315 - BLOCK
      ?auto_215313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215314 ?auto_215311 ) ( ON-TABLE ?auto_215308 ) ( ON ?auto_215309 ?auto_215308 ) ( ON ?auto_215310 ?auto_215309 ) ( ON ?auto_215311 ?auto_215310 ) ( not ( = ?auto_215308 ?auto_215309 ) ) ( not ( = ?auto_215308 ?auto_215310 ) ) ( not ( = ?auto_215308 ?auto_215311 ) ) ( not ( = ?auto_215308 ?auto_215314 ) ) ( not ( = ?auto_215309 ?auto_215310 ) ) ( not ( = ?auto_215309 ?auto_215311 ) ) ( not ( = ?auto_215309 ?auto_215314 ) ) ( not ( = ?auto_215310 ?auto_215311 ) ) ( not ( = ?auto_215310 ?auto_215314 ) ) ( not ( = ?auto_215311 ?auto_215314 ) ) ( not ( = ?auto_215308 ?auto_215312 ) ) ( not ( = ?auto_215308 ?auto_215315 ) ) ( not ( = ?auto_215309 ?auto_215312 ) ) ( not ( = ?auto_215309 ?auto_215315 ) ) ( not ( = ?auto_215310 ?auto_215312 ) ) ( not ( = ?auto_215310 ?auto_215315 ) ) ( not ( = ?auto_215311 ?auto_215312 ) ) ( not ( = ?auto_215311 ?auto_215315 ) ) ( not ( = ?auto_215314 ?auto_215312 ) ) ( not ( = ?auto_215314 ?auto_215315 ) ) ( not ( = ?auto_215312 ?auto_215315 ) ) ( ON ?auto_215312 ?auto_215314 ) ( not ( = ?auto_215313 ?auto_215315 ) ) ( not ( = ?auto_215308 ?auto_215313 ) ) ( not ( = ?auto_215309 ?auto_215313 ) ) ( not ( = ?auto_215310 ?auto_215313 ) ) ( not ( = ?auto_215311 ?auto_215313 ) ) ( not ( = ?auto_215314 ?auto_215313 ) ) ( not ( = ?auto_215312 ?auto_215313 ) ) ( ON ?auto_215315 ?auto_215312 ) ( HOLDING ?auto_215313 ) ( CLEAR ?auto_215315 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_215308 ?auto_215309 ?auto_215310 ?auto_215311 ?auto_215314 ?auto_215312 ?auto_215315 ?auto_215313 )
      ( MAKE-4PILE ?auto_215308 ?auto_215309 ?auto_215310 ?auto_215311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215316 - BLOCK
      ?auto_215317 - BLOCK
      ?auto_215318 - BLOCK
      ?auto_215319 - BLOCK
    )
    :vars
    (
      ?auto_215323 - BLOCK
      ?auto_215320 - BLOCK
      ?auto_215321 - BLOCK
      ?auto_215322 - BLOCK
      ?auto_215324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215323 ?auto_215319 ) ( ON-TABLE ?auto_215316 ) ( ON ?auto_215317 ?auto_215316 ) ( ON ?auto_215318 ?auto_215317 ) ( ON ?auto_215319 ?auto_215318 ) ( not ( = ?auto_215316 ?auto_215317 ) ) ( not ( = ?auto_215316 ?auto_215318 ) ) ( not ( = ?auto_215316 ?auto_215319 ) ) ( not ( = ?auto_215316 ?auto_215323 ) ) ( not ( = ?auto_215317 ?auto_215318 ) ) ( not ( = ?auto_215317 ?auto_215319 ) ) ( not ( = ?auto_215317 ?auto_215323 ) ) ( not ( = ?auto_215318 ?auto_215319 ) ) ( not ( = ?auto_215318 ?auto_215323 ) ) ( not ( = ?auto_215319 ?auto_215323 ) ) ( not ( = ?auto_215316 ?auto_215320 ) ) ( not ( = ?auto_215316 ?auto_215321 ) ) ( not ( = ?auto_215317 ?auto_215320 ) ) ( not ( = ?auto_215317 ?auto_215321 ) ) ( not ( = ?auto_215318 ?auto_215320 ) ) ( not ( = ?auto_215318 ?auto_215321 ) ) ( not ( = ?auto_215319 ?auto_215320 ) ) ( not ( = ?auto_215319 ?auto_215321 ) ) ( not ( = ?auto_215323 ?auto_215320 ) ) ( not ( = ?auto_215323 ?auto_215321 ) ) ( not ( = ?auto_215320 ?auto_215321 ) ) ( ON ?auto_215320 ?auto_215323 ) ( not ( = ?auto_215322 ?auto_215321 ) ) ( not ( = ?auto_215316 ?auto_215322 ) ) ( not ( = ?auto_215317 ?auto_215322 ) ) ( not ( = ?auto_215318 ?auto_215322 ) ) ( not ( = ?auto_215319 ?auto_215322 ) ) ( not ( = ?auto_215323 ?auto_215322 ) ) ( not ( = ?auto_215320 ?auto_215322 ) ) ( ON ?auto_215321 ?auto_215320 ) ( CLEAR ?auto_215321 ) ( ON ?auto_215322 ?auto_215324 ) ( CLEAR ?auto_215322 ) ( HAND-EMPTY ) ( not ( = ?auto_215316 ?auto_215324 ) ) ( not ( = ?auto_215317 ?auto_215324 ) ) ( not ( = ?auto_215318 ?auto_215324 ) ) ( not ( = ?auto_215319 ?auto_215324 ) ) ( not ( = ?auto_215323 ?auto_215324 ) ) ( not ( = ?auto_215320 ?auto_215324 ) ) ( not ( = ?auto_215321 ?auto_215324 ) ) ( not ( = ?auto_215322 ?auto_215324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215322 ?auto_215324 )
      ( MAKE-4PILE ?auto_215316 ?auto_215317 ?auto_215318 ?auto_215319 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215325 - BLOCK
      ?auto_215326 - BLOCK
      ?auto_215327 - BLOCK
      ?auto_215328 - BLOCK
    )
    :vars
    (
      ?auto_215333 - BLOCK
      ?auto_215332 - BLOCK
      ?auto_215330 - BLOCK
      ?auto_215331 - BLOCK
      ?auto_215329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215333 ?auto_215328 ) ( ON-TABLE ?auto_215325 ) ( ON ?auto_215326 ?auto_215325 ) ( ON ?auto_215327 ?auto_215326 ) ( ON ?auto_215328 ?auto_215327 ) ( not ( = ?auto_215325 ?auto_215326 ) ) ( not ( = ?auto_215325 ?auto_215327 ) ) ( not ( = ?auto_215325 ?auto_215328 ) ) ( not ( = ?auto_215325 ?auto_215333 ) ) ( not ( = ?auto_215326 ?auto_215327 ) ) ( not ( = ?auto_215326 ?auto_215328 ) ) ( not ( = ?auto_215326 ?auto_215333 ) ) ( not ( = ?auto_215327 ?auto_215328 ) ) ( not ( = ?auto_215327 ?auto_215333 ) ) ( not ( = ?auto_215328 ?auto_215333 ) ) ( not ( = ?auto_215325 ?auto_215332 ) ) ( not ( = ?auto_215325 ?auto_215330 ) ) ( not ( = ?auto_215326 ?auto_215332 ) ) ( not ( = ?auto_215326 ?auto_215330 ) ) ( not ( = ?auto_215327 ?auto_215332 ) ) ( not ( = ?auto_215327 ?auto_215330 ) ) ( not ( = ?auto_215328 ?auto_215332 ) ) ( not ( = ?auto_215328 ?auto_215330 ) ) ( not ( = ?auto_215333 ?auto_215332 ) ) ( not ( = ?auto_215333 ?auto_215330 ) ) ( not ( = ?auto_215332 ?auto_215330 ) ) ( ON ?auto_215332 ?auto_215333 ) ( not ( = ?auto_215331 ?auto_215330 ) ) ( not ( = ?auto_215325 ?auto_215331 ) ) ( not ( = ?auto_215326 ?auto_215331 ) ) ( not ( = ?auto_215327 ?auto_215331 ) ) ( not ( = ?auto_215328 ?auto_215331 ) ) ( not ( = ?auto_215333 ?auto_215331 ) ) ( not ( = ?auto_215332 ?auto_215331 ) ) ( ON ?auto_215331 ?auto_215329 ) ( CLEAR ?auto_215331 ) ( not ( = ?auto_215325 ?auto_215329 ) ) ( not ( = ?auto_215326 ?auto_215329 ) ) ( not ( = ?auto_215327 ?auto_215329 ) ) ( not ( = ?auto_215328 ?auto_215329 ) ) ( not ( = ?auto_215333 ?auto_215329 ) ) ( not ( = ?auto_215332 ?auto_215329 ) ) ( not ( = ?auto_215330 ?auto_215329 ) ) ( not ( = ?auto_215331 ?auto_215329 ) ) ( HOLDING ?auto_215330 ) ( CLEAR ?auto_215332 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215325 ?auto_215326 ?auto_215327 ?auto_215328 ?auto_215333 ?auto_215332 ?auto_215330 )
      ( MAKE-4PILE ?auto_215325 ?auto_215326 ?auto_215327 ?auto_215328 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215334 - BLOCK
      ?auto_215335 - BLOCK
      ?auto_215336 - BLOCK
      ?auto_215337 - BLOCK
    )
    :vars
    (
      ?auto_215342 - BLOCK
      ?auto_215339 - BLOCK
      ?auto_215341 - BLOCK
      ?auto_215338 - BLOCK
      ?auto_215340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215342 ?auto_215337 ) ( ON-TABLE ?auto_215334 ) ( ON ?auto_215335 ?auto_215334 ) ( ON ?auto_215336 ?auto_215335 ) ( ON ?auto_215337 ?auto_215336 ) ( not ( = ?auto_215334 ?auto_215335 ) ) ( not ( = ?auto_215334 ?auto_215336 ) ) ( not ( = ?auto_215334 ?auto_215337 ) ) ( not ( = ?auto_215334 ?auto_215342 ) ) ( not ( = ?auto_215335 ?auto_215336 ) ) ( not ( = ?auto_215335 ?auto_215337 ) ) ( not ( = ?auto_215335 ?auto_215342 ) ) ( not ( = ?auto_215336 ?auto_215337 ) ) ( not ( = ?auto_215336 ?auto_215342 ) ) ( not ( = ?auto_215337 ?auto_215342 ) ) ( not ( = ?auto_215334 ?auto_215339 ) ) ( not ( = ?auto_215334 ?auto_215341 ) ) ( not ( = ?auto_215335 ?auto_215339 ) ) ( not ( = ?auto_215335 ?auto_215341 ) ) ( not ( = ?auto_215336 ?auto_215339 ) ) ( not ( = ?auto_215336 ?auto_215341 ) ) ( not ( = ?auto_215337 ?auto_215339 ) ) ( not ( = ?auto_215337 ?auto_215341 ) ) ( not ( = ?auto_215342 ?auto_215339 ) ) ( not ( = ?auto_215342 ?auto_215341 ) ) ( not ( = ?auto_215339 ?auto_215341 ) ) ( ON ?auto_215339 ?auto_215342 ) ( not ( = ?auto_215338 ?auto_215341 ) ) ( not ( = ?auto_215334 ?auto_215338 ) ) ( not ( = ?auto_215335 ?auto_215338 ) ) ( not ( = ?auto_215336 ?auto_215338 ) ) ( not ( = ?auto_215337 ?auto_215338 ) ) ( not ( = ?auto_215342 ?auto_215338 ) ) ( not ( = ?auto_215339 ?auto_215338 ) ) ( ON ?auto_215338 ?auto_215340 ) ( not ( = ?auto_215334 ?auto_215340 ) ) ( not ( = ?auto_215335 ?auto_215340 ) ) ( not ( = ?auto_215336 ?auto_215340 ) ) ( not ( = ?auto_215337 ?auto_215340 ) ) ( not ( = ?auto_215342 ?auto_215340 ) ) ( not ( = ?auto_215339 ?auto_215340 ) ) ( not ( = ?auto_215341 ?auto_215340 ) ) ( not ( = ?auto_215338 ?auto_215340 ) ) ( CLEAR ?auto_215339 ) ( ON ?auto_215341 ?auto_215338 ) ( CLEAR ?auto_215341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215340 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215340 ?auto_215338 )
      ( MAKE-4PILE ?auto_215334 ?auto_215335 ?auto_215336 ?auto_215337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215343 - BLOCK
      ?auto_215344 - BLOCK
      ?auto_215345 - BLOCK
      ?auto_215346 - BLOCK
    )
    :vars
    (
      ?auto_215349 - BLOCK
      ?auto_215351 - BLOCK
      ?auto_215348 - BLOCK
      ?auto_215350 - BLOCK
      ?auto_215347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215349 ?auto_215346 ) ( ON-TABLE ?auto_215343 ) ( ON ?auto_215344 ?auto_215343 ) ( ON ?auto_215345 ?auto_215344 ) ( ON ?auto_215346 ?auto_215345 ) ( not ( = ?auto_215343 ?auto_215344 ) ) ( not ( = ?auto_215343 ?auto_215345 ) ) ( not ( = ?auto_215343 ?auto_215346 ) ) ( not ( = ?auto_215343 ?auto_215349 ) ) ( not ( = ?auto_215344 ?auto_215345 ) ) ( not ( = ?auto_215344 ?auto_215346 ) ) ( not ( = ?auto_215344 ?auto_215349 ) ) ( not ( = ?auto_215345 ?auto_215346 ) ) ( not ( = ?auto_215345 ?auto_215349 ) ) ( not ( = ?auto_215346 ?auto_215349 ) ) ( not ( = ?auto_215343 ?auto_215351 ) ) ( not ( = ?auto_215343 ?auto_215348 ) ) ( not ( = ?auto_215344 ?auto_215351 ) ) ( not ( = ?auto_215344 ?auto_215348 ) ) ( not ( = ?auto_215345 ?auto_215351 ) ) ( not ( = ?auto_215345 ?auto_215348 ) ) ( not ( = ?auto_215346 ?auto_215351 ) ) ( not ( = ?auto_215346 ?auto_215348 ) ) ( not ( = ?auto_215349 ?auto_215351 ) ) ( not ( = ?auto_215349 ?auto_215348 ) ) ( not ( = ?auto_215351 ?auto_215348 ) ) ( not ( = ?auto_215350 ?auto_215348 ) ) ( not ( = ?auto_215343 ?auto_215350 ) ) ( not ( = ?auto_215344 ?auto_215350 ) ) ( not ( = ?auto_215345 ?auto_215350 ) ) ( not ( = ?auto_215346 ?auto_215350 ) ) ( not ( = ?auto_215349 ?auto_215350 ) ) ( not ( = ?auto_215351 ?auto_215350 ) ) ( ON ?auto_215350 ?auto_215347 ) ( not ( = ?auto_215343 ?auto_215347 ) ) ( not ( = ?auto_215344 ?auto_215347 ) ) ( not ( = ?auto_215345 ?auto_215347 ) ) ( not ( = ?auto_215346 ?auto_215347 ) ) ( not ( = ?auto_215349 ?auto_215347 ) ) ( not ( = ?auto_215351 ?auto_215347 ) ) ( not ( = ?auto_215348 ?auto_215347 ) ) ( not ( = ?auto_215350 ?auto_215347 ) ) ( ON ?auto_215348 ?auto_215350 ) ( CLEAR ?auto_215348 ) ( ON-TABLE ?auto_215347 ) ( HOLDING ?auto_215351 ) ( CLEAR ?auto_215349 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215343 ?auto_215344 ?auto_215345 ?auto_215346 ?auto_215349 ?auto_215351 )
      ( MAKE-4PILE ?auto_215343 ?auto_215344 ?auto_215345 ?auto_215346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215352 - BLOCK
      ?auto_215353 - BLOCK
      ?auto_215354 - BLOCK
      ?auto_215355 - BLOCK
    )
    :vars
    (
      ?auto_215357 - BLOCK
      ?auto_215360 - BLOCK
      ?auto_215356 - BLOCK
      ?auto_215359 - BLOCK
      ?auto_215358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215357 ?auto_215355 ) ( ON-TABLE ?auto_215352 ) ( ON ?auto_215353 ?auto_215352 ) ( ON ?auto_215354 ?auto_215353 ) ( ON ?auto_215355 ?auto_215354 ) ( not ( = ?auto_215352 ?auto_215353 ) ) ( not ( = ?auto_215352 ?auto_215354 ) ) ( not ( = ?auto_215352 ?auto_215355 ) ) ( not ( = ?auto_215352 ?auto_215357 ) ) ( not ( = ?auto_215353 ?auto_215354 ) ) ( not ( = ?auto_215353 ?auto_215355 ) ) ( not ( = ?auto_215353 ?auto_215357 ) ) ( not ( = ?auto_215354 ?auto_215355 ) ) ( not ( = ?auto_215354 ?auto_215357 ) ) ( not ( = ?auto_215355 ?auto_215357 ) ) ( not ( = ?auto_215352 ?auto_215360 ) ) ( not ( = ?auto_215352 ?auto_215356 ) ) ( not ( = ?auto_215353 ?auto_215360 ) ) ( not ( = ?auto_215353 ?auto_215356 ) ) ( not ( = ?auto_215354 ?auto_215360 ) ) ( not ( = ?auto_215354 ?auto_215356 ) ) ( not ( = ?auto_215355 ?auto_215360 ) ) ( not ( = ?auto_215355 ?auto_215356 ) ) ( not ( = ?auto_215357 ?auto_215360 ) ) ( not ( = ?auto_215357 ?auto_215356 ) ) ( not ( = ?auto_215360 ?auto_215356 ) ) ( not ( = ?auto_215359 ?auto_215356 ) ) ( not ( = ?auto_215352 ?auto_215359 ) ) ( not ( = ?auto_215353 ?auto_215359 ) ) ( not ( = ?auto_215354 ?auto_215359 ) ) ( not ( = ?auto_215355 ?auto_215359 ) ) ( not ( = ?auto_215357 ?auto_215359 ) ) ( not ( = ?auto_215360 ?auto_215359 ) ) ( ON ?auto_215359 ?auto_215358 ) ( not ( = ?auto_215352 ?auto_215358 ) ) ( not ( = ?auto_215353 ?auto_215358 ) ) ( not ( = ?auto_215354 ?auto_215358 ) ) ( not ( = ?auto_215355 ?auto_215358 ) ) ( not ( = ?auto_215357 ?auto_215358 ) ) ( not ( = ?auto_215360 ?auto_215358 ) ) ( not ( = ?auto_215356 ?auto_215358 ) ) ( not ( = ?auto_215359 ?auto_215358 ) ) ( ON ?auto_215356 ?auto_215359 ) ( ON-TABLE ?auto_215358 ) ( CLEAR ?auto_215357 ) ( ON ?auto_215360 ?auto_215356 ) ( CLEAR ?auto_215360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215358 ?auto_215359 ?auto_215356 )
      ( MAKE-4PILE ?auto_215352 ?auto_215353 ?auto_215354 ?auto_215355 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215379 - BLOCK
      ?auto_215380 - BLOCK
      ?auto_215381 - BLOCK
      ?auto_215382 - BLOCK
    )
    :vars
    (
      ?auto_215386 - BLOCK
      ?auto_215384 - BLOCK
      ?auto_215387 - BLOCK
      ?auto_215385 - BLOCK
      ?auto_215383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215379 ) ( ON ?auto_215380 ?auto_215379 ) ( ON ?auto_215381 ?auto_215380 ) ( not ( = ?auto_215379 ?auto_215380 ) ) ( not ( = ?auto_215379 ?auto_215381 ) ) ( not ( = ?auto_215379 ?auto_215382 ) ) ( not ( = ?auto_215379 ?auto_215386 ) ) ( not ( = ?auto_215380 ?auto_215381 ) ) ( not ( = ?auto_215380 ?auto_215382 ) ) ( not ( = ?auto_215380 ?auto_215386 ) ) ( not ( = ?auto_215381 ?auto_215382 ) ) ( not ( = ?auto_215381 ?auto_215386 ) ) ( not ( = ?auto_215382 ?auto_215386 ) ) ( not ( = ?auto_215379 ?auto_215384 ) ) ( not ( = ?auto_215379 ?auto_215387 ) ) ( not ( = ?auto_215380 ?auto_215384 ) ) ( not ( = ?auto_215380 ?auto_215387 ) ) ( not ( = ?auto_215381 ?auto_215384 ) ) ( not ( = ?auto_215381 ?auto_215387 ) ) ( not ( = ?auto_215382 ?auto_215384 ) ) ( not ( = ?auto_215382 ?auto_215387 ) ) ( not ( = ?auto_215386 ?auto_215384 ) ) ( not ( = ?auto_215386 ?auto_215387 ) ) ( not ( = ?auto_215384 ?auto_215387 ) ) ( not ( = ?auto_215385 ?auto_215387 ) ) ( not ( = ?auto_215379 ?auto_215385 ) ) ( not ( = ?auto_215380 ?auto_215385 ) ) ( not ( = ?auto_215381 ?auto_215385 ) ) ( not ( = ?auto_215382 ?auto_215385 ) ) ( not ( = ?auto_215386 ?auto_215385 ) ) ( not ( = ?auto_215384 ?auto_215385 ) ) ( ON ?auto_215385 ?auto_215383 ) ( not ( = ?auto_215379 ?auto_215383 ) ) ( not ( = ?auto_215380 ?auto_215383 ) ) ( not ( = ?auto_215381 ?auto_215383 ) ) ( not ( = ?auto_215382 ?auto_215383 ) ) ( not ( = ?auto_215386 ?auto_215383 ) ) ( not ( = ?auto_215384 ?auto_215383 ) ) ( not ( = ?auto_215387 ?auto_215383 ) ) ( not ( = ?auto_215385 ?auto_215383 ) ) ( ON ?auto_215387 ?auto_215385 ) ( ON-TABLE ?auto_215383 ) ( ON ?auto_215384 ?auto_215387 ) ( ON ?auto_215386 ?auto_215384 ) ( CLEAR ?auto_215386 ) ( HOLDING ?auto_215382 ) ( CLEAR ?auto_215381 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215379 ?auto_215380 ?auto_215381 ?auto_215382 ?auto_215386 )
      ( MAKE-4PILE ?auto_215379 ?auto_215380 ?auto_215381 ?auto_215382 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215388 - BLOCK
      ?auto_215389 - BLOCK
      ?auto_215390 - BLOCK
      ?auto_215391 - BLOCK
    )
    :vars
    (
      ?auto_215395 - BLOCK
      ?auto_215394 - BLOCK
      ?auto_215396 - BLOCK
      ?auto_215392 - BLOCK
      ?auto_215393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215388 ) ( ON ?auto_215389 ?auto_215388 ) ( ON ?auto_215390 ?auto_215389 ) ( not ( = ?auto_215388 ?auto_215389 ) ) ( not ( = ?auto_215388 ?auto_215390 ) ) ( not ( = ?auto_215388 ?auto_215391 ) ) ( not ( = ?auto_215388 ?auto_215395 ) ) ( not ( = ?auto_215389 ?auto_215390 ) ) ( not ( = ?auto_215389 ?auto_215391 ) ) ( not ( = ?auto_215389 ?auto_215395 ) ) ( not ( = ?auto_215390 ?auto_215391 ) ) ( not ( = ?auto_215390 ?auto_215395 ) ) ( not ( = ?auto_215391 ?auto_215395 ) ) ( not ( = ?auto_215388 ?auto_215394 ) ) ( not ( = ?auto_215388 ?auto_215396 ) ) ( not ( = ?auto_215389 ?auto_215394 ) ) ( not ( = ?auto_215389 ?auto_215396 ) ) ( not ( = ?auto_215390 ?auto_215394 ) ) ( not ( = ?auto_215390 ?auto_215396 ) ) ( not ( = ?auto_215391 ?auto_215394 ) ) ( not ( = ?auto_215391 ?auto_215396 ) ) ( not ( = ?auto_215395 ?auto_215394 ) ) ( not ( = ?auto_215395 ?auto_215396 ) ) ( not ( = ?auto_215394 ?auto_215396 ) ) ( not ( = ?auto_215392 ?auto_215396 ) ) ( not ( = ?auto_215388 ?auto_215392 ) ) ( not ( = ?auto_215389 ?auto_215392 ) ) ( not ( = ?auto_215390 ?auto_215392 ) ) ( not ( = ?auto_215391 ?auto_215392 ) ) ( not ( = ?auto_215395 ?auto_215392 ) ) ( not ( = ?auto_215394 ?auto_215392 ) ) ( ON ?auto_215392 ?auto_215393 ) ( not ( = ?auto_215388 ?auto_215393 ) ) ( not ( = ?auto_215389 ?auto_215393 ) ) ( not ( = ?auto_215390 ?auto_215393 ) ) ( not ( = ?auto_215391 ?auto_215393 ) ) ( not ( = ?auto_215395 ?auto_215393 ) ) ( not ( = ?auto_215394 ?auto_215393 ) ) ( not ( = ?auto_215396 ?auto_215393 ) ) ( not ( = ?auto_215392 ?auto_215393 ) ) ( ON ?auto_215396 ?auto_215392 ) ( ON-TABLE ?auto_215393 ) ( ON ?auto_215394 ?auto_215396 ) ( ON ?auto_215395 ?auto_215394 ) ( CLEAR ?auto_215390 ) ( ON ?auto_215391 ?auto_215395 ) ( CLEAR ?auto_215391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215393 ?auto_215392 ?auto_215396 ?auto_215394 ?auto_215395 )
      ( MAKE-4PILE ?auto_215388 ?auto_215389 ?auto_215390 ?auto_215391 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215397 - BLOCK
      ?auto_215398 - BLOCK
      ?auto_215399 - BLOCK
      ?auto_215400 - BLOCK
    )
    :vars
    (
      ?auto_215403 - BLOCK
      ?auto_215405 - BLOCK
      ?auto_215404 - BLOCK
      ?auto_215402 - BLOCK
      ?auto_215401 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215397 ) ( ON ?auto_215398 ?auto_215397 ) ( not ( = ?auto_215397 ?auto_215398 ) ) ( not ( = ?auto_215397 ?auto_215399 ) ) ( not ( = ?auto_215397 ?auto_215400 ) ) ( not ( = ?auto_215397 ?auto_215403 ) ) ( not ( = ?auto_215398 ?auto_215399 ) ) ( not ( = ?auto_215398 ?auto_215400 ) ) ( not ( = ?auto_215398 ?auto_215403 ) ) ( not ( = ?auto_215399 ?auto_215400 ) ) ( not ( = ?auto_215399 ?auto_215403 ) ) ( not ( = ?auto_215400 ?auto_215403 ) ) ( not ( = ?auto_215397 ?auto_215405 ) ) ( not ( = ?auto_215397 ?auto_215404 ) ) ( not ( = ?auto_215398 ?auto_215405 ) ) ( not ( = ?auto_215398 ?auto_215404 ) ) ( not ( = ?auto_215399 ?auto_215405 ) ) ( not ( = ?auto_215399 ?auto_215404 ) ) ( not ( = ?auto_215400 ?auto_215405 ) ) ( not ( = ?auto_215400 ?auto_215404 ) ) ( not ( = ?auto_215403 ?auto_215405 ) ) ( not ( = ?auto_215403 ?auto_215404 ) ) ( not ( = ?auto_215405 ?auto_215404 ) ) ( not ( = ?auto_215402 ?auto_215404 ) ) ( not ( = ?auto_215397 ?auto_215402 ) ) ( not ( = ?auto_215398 ?auto_215402 ) ) ( not ( = ?auto_215399 ?auto_215402 ) ) ( not ( = ?auto_215400 ?auto_215402 ) ) ( not ( = ?auto_215403 ?auto_215402 ) ) ( not ( = ?auto_215405 ?auto_215402 ) ) ( ON ?auto_215402 ?auto_215401 ) ( not ( = ?auto_215397 ?auto_215401 ) ) ( not ( = ?auto_215398 ?auto_215401 ) ) ( not ( = ?auto_215399 ?auto_215401 ) ) ( not ( = ?auto_215400 ?auto_215401 ) ) ( not ( = ?auto_215403 ?auto_215401 ) ) ( not ( = ?auto_215405 ?auto_215401 ) ) ( not ( = ?auto_215404 ?auto_215401 ) ) ( not ( = ?auto_215402 ?auto_215401 ) ) ( ON ?auto_215404 ?auto_215402 ) ( ON-TABLE ?auto_215401 ) ( ON ?auto_215405 ?auto_215404 ) ( ON ?auto_215403 ?auto_215405 ) ( ON ?auto_215400 ?auto_215403 ) ( CLEAR ?auto_215400 ) ( HOLDING ?auto_215399 ) ( CLEAR ?auto_215398 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215397 ?auto_215398 ?auto_215399 )
      ( MAKE-4PILE ?auto_215397 ?auto_215398 ?auto_215399 ?auto_215400 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215406 - BLOCK
      ?auto_215407 - BLOCK
      ?auto_215408 - BLOCK
      ?auto_215409 - BLOCK
    )
    :vars
    (
      ?auto_215413 - BLOCK
      ?auto_215412 - BLOCK
      ?auto_215414 - BLOCK
      ?auto_215410 - BLOCK
      ?auto_215411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215406 ) ( ON ?auto_215407 ?auto_215406 ) ( not ( = ?auto_215406 ?auto_215407 ) ) ( not ( = ?auto_215406 ?auto_215408 ) ) ( not ( = ?auto_215406 ?auto_215409 ) ) ( not ( = ?auto_215406 ?auto_215413 ) ) ( not ( = ?auto_215407 ?auto_215408 ) ) ( not ( = ?auto_215407 ?auto_215409 ) ) ( not ( = ?auto_215407 ?auto_215413 ) ) ( not ( = ?auto_215408 ?auto_215409 ) ) ( not ( = ?auto_215408 ?auto_215413 ) ) ( not ( = ?auto_215409 ?auto_215413 ) ) ( not ( = ?auto_215406 ?auto_215412 ) ) ( not ( = ?auto_215406 ?auto_215414 ) ) ( not ( = ?auto_215407 ?auto_215412 ) ) ( not ( = ?auto_215407 ?auto_215414 ) ) ( not ( = ?auto_215408 ?auto_215412 ) ) ( not ( = ?auto_215408 ?auto_215414 ) ) ( not ( = ?auto_215409 ?auto_215412 ) ) ( not ( = ?auto_215409 ?auto_215414 ) ) ( not ( = ?auto_215413 ?auto_215412 ) ) ( not ( = ?auto_215413 ?auto_215414 ) ) ( not ( = ?auto_215412 ?auto_215414 ) ) ( not ( = ?auto_215410 ?auto_215414 ) ) ( not ( = ?auto_215406 ?auto_215410 ) ) ( not ( = ?auto_215407 ?auto_215410 ) ) ( not ( = ?auto_215408 ?auto_215410 ) ) ( not ( = ?auto_215409 ?auto_215410 ) ) ( not ( = ?auto_215413 ?auto_215410 ) ) ( not ( = ?auto_215412 ?auto_215410 ) ) ( ON ?auto_215410 ?auto_215411 ) ( not ( = ?auto_215406 ?auto_215411 ) ) ( not ( = ?auto_215407 ?auto_215411 ) ) ( not ( = ?auto_215408 ?auto_215411 ) ) ( not ( = ?auto_215409 ?auto_215411 ) ) ( not ( = ?auto_215413 ?auto_215411 ) ) ( not ( = ?auto_215412 ?auto_215411 ) ) ( not ( = ?auto_215414 ?auto_215411 ) ) ( not ( = ?auto_215410 ?auto_215411 ) ) ( ON ?auto_215414 ?auto_215410 ) ( ON-TABLE ?auto_215411 ) ( ON ?auto_215412 ?auto_215414 ) ( ON ?auto_215413 ?auto_215412 ) ( ON ?auto_215409 ?auto_215413 ) ( CLEAR ?auto_215407 ) ( ON ?auto_215408 ?auto_215409 ) ( CLEAR ?auto_215408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215411 ?auto_215410 ?auto_215414 ?auto_215412 ?auto_215413 ?auto_215409 )
      ( MAKE-4PILE ?auto_215406 ?auto_215407 ?auto_215408 ?auto_215409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215415 - BLOCK
      ?auto_215416 - BLOCK
      ?auto_215417 - BLOCK
      ?auto_215418 - BLOCK
    )
    :vars
    (
      ?auto_215423 - BLOCK
      ?auto_215421 - BLOCK
      ?auto_215422 - BLOCK
      ?auto_215419 - BLOCK
      ?auto_215420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215415 ) ( not ( = ?auto_215415 ?auto_215416 ) ) ( not ( = ?auto_215415 ?auto_215417 ) ) ( not ( = ?auto_215415 ?auto_215418 ) ) ( not ( = ?auto_215415 ?auto_215423 ) ) ( not ( = ?auto_215416 ?auto_215417 ) ) ( not ( = ?auto_215416 ?auto_215418 ) ) ( not ( = ?auto_215416 ?auto_215423 ) ) ( not ( = ?auto_215417 ?auto_215418 ) ) ( not ( = ?auto_215417 ?auto_215423 ) ) ( not ( = ?auto_215418 ?auto_215423 ) ) ( not ( = ?auto_215415 ?auto_215421 ) ) ( not ( = ?auto_215415 ?auto_215422 ) ) ( not ( = ?auto_215416 ?auto_215421 ) ) ( not ( = ?auto_215416 ?auto_215422 ) ) ( not ( = ?auto_215417 ?auto_215421 ) ) ( not ( = ?auto_215417 ?auto_215422 ) ) ( not ( = ?auto_215418 ?auto_215421 ) ) ( not ( = ?auto_215418 ?auto_215422 ) ) ( not ( = ?auto_215423 ?auto_215421 ) ) ( not ( = ?auto_215423 ?auto_215422 ) ) ( not ( = ?auto_215421 ?auto_215422 ) ) ( not ( = ?auto_215419 ?auto_215422 ) ) ( not ( = ?auto_215415 ?auto_215419 ) ) ( not ( = ?auto_215416 ?auto_215419 ) ) ( not ( = ?auto_215417 ?auto_215419 ) ) ( not ( = ?auto_215418 ?auto_215419 ) ) ( not ( = ?auto_215423 ?auto_215419 ) ) ( not ( = ?auto_215421 ?auto_215419 ) ) ( ON ?auto_215419 ?auto_215420 ) ( not ( = ?auto_215415 ?auto_215420 ) ) ( not ( = ?auto_215416 ?auto_215420 ) ) ( not ( = ?auto_215417 ?auto_215420 ) ) ( not ( = ?auto_215418 ?auto_215420 ) ) ( not ( = ?auto_215423 ?auto_215420 ) ) ( not ( = ?auto_215421 ?auto_215420 ) ) ( not ( = ?auto_215422 ?auto_215420 ) ) ( not ( = ?auto_215419 ?auto_215420 ) ) ( ON ?auto_215422 ?auto_215419 ) ( ON-TABLE ?auto_215420 ) ( ON ?auto_215421 ?auto_215422 ) ( ON ?auto_215423 ?auto_215421 ) ( ON ?auto_215418 ?auto_215423 ) ( ON ?auto_215417 ?auto_215418 ) ( CLEAR ?auto_215417 ) ( HOLDING ?auto_215416 ) ( CLEAR ?auto_215415 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215415 ?auto_215416 )
      ( MAKE-4PILE ?auto_215415 ?auto_215416 ?auto_215417 ?auto_215418 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215424 - BLOCK
      ?auto_215425 - BLOCK
      ?auto_215426 - BLOCK
      ?auto_215427 - BLOCK
    )
    :vars
    (
      ?auto_215432 - BLOCK
      ?auto_215428 - BLOCK
      ?auto_215430 - BLOCK
      ?auto_215429 - BLOCK
      ?auto_215431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215424 ) ( not ( = ?auto_215424 ?auto_215425 ) ) ( not ( = ?auto_215424 ?auto_215426 ) ) ( not ( = ?auto_215424 ?auto_215427 ) ) ( not ( = ?auto_215424 ?auto_215432 ) ) ( not ( = ?auto_215425 ?auto_215426 ) ) ( not ( = ?auto_215425 ?auto_215427 ) ) ( not ( = ?auto_215425 ?auto_215432 ) ) ( not ( = ?auto_215426 ?auto_215427 ) ) ( not ( = ?auto_215426 ?auto_215432 ) ) ( not ( = ?auto_215427 ?auto_215432 ) ) ( not ( = ?auto_215424 ?auto_215428 ) ) ( not ( = ?auto_215424 ?auto_215430 ) ) ( not ( = ?auto_215425 ?auto_215428 ) ) ( not ( = ?auto_215425 ?auto_215430 ) ) ( not ( = ?auto_215426 ?auto_215428 ) ) ( not ( = ?auto_215426 ?auto_215430 ) ) ( not ( = ?auto_215427 ?auto_215428 ) ) ( not ( = ?auto_215427 ?auto_215430 ) ) ( not ( = ?auto_215432 ?auto_215428 ) ) ( not ( = ?auto_215432 ?auto_215430 ) ) ( not ( = ?auto_215428 ?auto_215430 ) ) ( not ( = ?auto_215429 ?auto_215430 ) ) ( not ( = ?auto_215424 ?auto_215429 ) ) ( not ( = ?auto_215425 ?auto_215429 ) ) ( not ( = ?auto_215426 ?auto_215429 ) ) ( not ( = ?auto_215427 ?auto_215429 ) ) ( not ( = ?auto_215432 ?auto_215429 ) ) ( not ( = ?auto_215428 ?auto_215429 ) ) ( ON ?auto_215429 ?auto_215431 ) ( not ( = ?auto_215424 ?auto_215431 ) ) ( not ( = ?auto_215425 ?auto_215431 ) ) ( not ( = ?auto_215426 ?auto_215431 ) ) ( not ( = ?auto_215427 ?auto_215431 ) ) ( not ( = ?auto_215432 ?auto_215431 ) ) ( not ( = ?auto_215428 ?auto_215431 ) ) ( not ( = ?auto_215430 ?auto_215431 ) ) ( not ( = ?auto_215429 ?auto_215431 ) ) ( ON ?auto_215430 ?auto_215429 ) ( ON-TABLE ?auto_215431 ) ( ON ?auto_215428 ?auto_215430 ) ( ON ?auto_215432 ?auto_215428 ) ( ON ?auto_215427 ?auto_215432 ) ( ON ?auto_215426 ?auto_215427 ) ( CLEAR ?auto_215424 ) ( ON ?auto_215425 ?auto_215426 ) ( CLEAR ?auto_215425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215431 ?auto_215429 ?auto_215430 ?auto_215428 ?auto_215432 ?auto_215427 ?auto_215426 )
      ( MAKE-4PILE ?auto_215424 ?auto_215425 ?auto_215426 ?auto_215427 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215433 - BLOCK
      ?auto_215434 - BLOCK
      ?auto_215435 - BLOCK
      ?auto_215436 - BLOCK
    )
    :vars
    (
      ?auto_215438 - BLOCK
      ?auto_215437 - BLOCK
      ?auto_215441 - BLOCK
      ?auto_215440 - BLOCK
      ?auto_215439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215433 ?auto_215434 ) ) ( not ( = ?auto_215433 ?auto_215435 ) ) ( not ( = ?auto_215433 ?auto_215436 ) ) ( not ( = ?auto_215433 ?auto_215438 ) ) ( not ( = ?auto_215434 ?auto_215435 ) ) ( not ( = ?auto_215434 ?auto_215436 ) ) ( not ( = ?auto_215434 ?auto_215438 ) ) ( not ( = ?auto_215435 ?auto_215436 ) ) ( not ( = ?auto_215435 ?auto_215438 ) ) ( not ( = ?auto_215436 ?auto_215438 ) ) ( not ( = ?auto_215433 ?auto_215437 ) ) ( not ( = ?auto_215433 ?auto_215441 ) ) ( not ( = ?auto_215434 ?auto_215437 ) ) ( not ( = ?auto_215434 ?auto_215441 ) ) ( not ( = ?auto_215435 ?auto_215437 ) ) ( not ( = ?auto_215435 ?auto_215441 ) ) ( not ( = ?auto_215436 ?auto_215437 ) ) ( not ( = ?auto_215436 ?auto_215441 ) ) ( not ( = ?auto_215438 ?auto_215437 ) ) ( not ( = ?auto_215438 ?auto_215441 ) ) ( not ( = ?auto_215437 ?auto_215441 ) ) ( not ( = ?auto_215440 ?auto_215441 ) ) ( not ( = ?auto_215433 ?auto_215440 ) ) ( not ( = ?auto_215434 ?auto_215440 ) ) ( not ( = ?auto_215435 ?auto_215440 ) ) ( not ( = ?auto_215436 ?auto_215440 ) ) ( not ( = ?auto_215438 ?auto_215440 ) ) ( not ( = ?auto_215437 ?auto_215440 ) ) ( ON ?auto_215440 ?auto_215439 ) ( not ( = ?auto_215433 ?auto_215439 ) ) ( not ( = ?auto_215434 ?auto_215439 ) ) ( not ( = ?auto_215435 ?auto_215439 ) ) ( not ( = ?auto_215436 ?auto_215439 ) ) ( not ( = ?auto_215438 ?auto_215439 ) ) ( not ( = ?auto_215437 ?auto_215439 ) ) ( not ( = ?auto_215441 ?auto_215439 ) ) ( not ( = ?auto_215440 ?auto_215439 ) ) ( ON ?auto_215441 ?auto_215440 ) ( ON-TABLE ?auto_215439 ) ( ON ?auto_215437 ?auto_215441 ) ( ON ?auto_215438 ?auto_215437 ) ( ON ?auto_215436 ?auto_215438 ) ( ON ?auto_215435 ?auto_215436 ) ( ON ?auto_215434 ?auto_215435 ) ( CLEAR ?auto_215434 ) ( HOLDING ?auto_215433 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215433 )
      ( MAKE-4PILE ?auto_215433 ?auto_215434 ?auto_215435 ?auto_215436 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215442 - BLOCK
      ?auto_215443 - BLOCK
      ?auto_215444 - BLOCK
      ?auto_215445 - BLOCK
    )
    :vars
    (
      ?auto_215447 - BLOCK
      ?auto_215449 - BLOCK
      ?auto_215450 - BLOCK
      ?auto_215448 - BLOCK
      ?auto_215446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215442 ?auto_215443 ) ) ( not ( = ?auto_215442 ?auto_215444 ) ) ( not ( = ?auto_215442 ?auto_215445 ) ) ( not ( = ?auto_215442 ?auto_215447 ) ) ( not ( = ?auto_215443 ?auto_215444 ) ) ( not ( = ?auto_215443 ?auto_215445 ) ) ( not ( = ?auto_215443 ?auto_215447 ) ) ( not ( = ?auto_215444 ?auto_215445 ) ) ( not ( = ?auto_215444 ?auto_215447 ) ) ( not ( = ?auto_215445 ?auto_215447 ) ) ( not ( = ?auto_215442 ?auto_215449 ) ) ( not ( = ?auto_215442 ?auto_215450 ) ) ( not ( = ?auto_215443 ?auto_215449 ) ) ( not ( = ?auto_215443 ?auto_215450 ) ) ( not ( = ?auto_215444 ?auto_215449 ) ) ( not ( = ?auto_215444 ?auto_215450 ) ) ( not ( = ?auto_215445 ?auto_215449 ) ) ( not ( = ?auto_215445 ?auto_215450 ) ) ( not ( = ?auto_215447 ?auto_215449 ) ) ( not ( = ?auto_215447 ?auto_215450 ) ) ( not ( = ?auto_215449 ?auto_215450 ) ) ( not ( = ?auto_215448 ?auto_215450 ) ) ( not ( = ?auto_215442 ?auto_215448 ) ) ( not ( = ?auto_215443 ?auto_215448 ) ) ( not ( = ?auto_215444 ?auto_215448 ) ) ( not ( = ?auto_215445 ?auto_215448 ) ) ( not ( = ?auto_215447 ?auto_215448 ) ) ( not ( = ?auto_215449 ?auto_215448 ) ) ( ON ?auto_215448 ?auto_215446 ) ( not ( = ?auto_215442 ?auto_215446 ) ) ( not ( = ?auto_215443 ?auto_215446 ) ) ( not ( = ?auto_215444 ?auto_215446 ) ) ( not ( = ?auto_215445 ?auto_215446 ) ) ( not ( = ?auto_215447 ?auto_215446 ) ) ( not ( = ?auto_215449 ?auto_215446 ) ) ( not ( = ?auto_215450 ?auto_215446 ) ) ( not ( = ?auto_215448 ?auto_215446 ) ) ( ON ?auto_215450 ?auto_215448 ) ( ON-TABLE ?auto_215446 ) ( ON ?auto_215449 ?auto_215450 ) ( ON ?auto_215447 ?auto_215449 ) ( ON ?auto_215445 ?auto_215447 ) ( ON ?auto_215444 ?auto_215445 ) ( ON ?auto_215443 ?auto_215444 ) ( ON ?auto_215442 ?auto_215443 ) ( CLEAR ?auto_215442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_215446 ?auto_215448 ?auto_215450 ?auto_215449 ?auto_215447 ?auto_215445 ?auto_215444 ?auto_215443 )
      ( MAKE-4PILE ?auto_215442 ?auto_215443 ?auto_215444 ?auto_215445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215455 - BLOCK
      ?auto_215456 - BLOCK
      ?auto_215457 - BLOCK
      ?auto_215458 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_215458 ) ( CLEAR ?auto_215457 ) ( ON-TABLE ?auto_215455 ) ( ON ?auto_215456 ?auto_215455 ) ( ON ?auto_215457 ?auto_215456 ) ( not ( = ?auto_215455 ?auto_215456 ) ) ( not ( = ?auto_215455 ?auto_215457 ) ) ( not ( = ?auto_215455 ?auto_215458 ) ) ( not ( = ?auto_215456 ?auto_215457 ) ) ( not ( = ?auto_215456 ?auto_215458 ) ) ( not ( = ?auto_215457 ?auto_215458 ) ) )
    :subtasks
    ( ( !STACK ?auto_215458 ?auto_215457 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215459 - BLOCK
      ?auto_215460 - BLOCK
      ?auto_215461 - BLOCK
      ?auto_215462 - BLOCK
    )
    :vars
    (
      ?auto_215463 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_215461 ) ( ON-TABLE ?auto_215459 ) ( ON ?auto_215460 ?auto_215459 ) ( ON ?auto_215461 ?auto_215460 ) ( not ( = ?auto_215459 ?auto_215460 ) ) ( not ( = ?auto_215459 ?auto_215461 ) ) ( not ( = ?auto_215459 ?auto_215462 ) ) ( not ( = ?auto_215460 ?auto_215461 ) ) ( not ( = ?auto_215460 ?auto_215462 ) ) ( not ( = ?auto_215461 ?auto_215462 ) ) ( ON ?auto_215462 ?auto_215463 ) ( CLEAR ?auto_215462 ) ( HAND-EMPTY ) ( not ( = ?auto_215459 ?auto_215463 ) ) ( not ( = ?auto_215460 ?auto_215463 ) ) ( not ( = ?auto_215461 ?auto_215463 ) ) ( not ( = ?auto_215462 ?auto_215463 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215462 ?auto_215463 )
      ( MAKE-4PILE ?auto_215459 ?auto_215460 ?auto_215461 ?auto_215462 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215464 - BLOCK
      ?auto_215465 - BLOCK
      ?auto_215466 - BLOCK
      ?auto_215467 - BLOCK
    )
    :vars
    (
      ?auto_215468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215464 ) ( ON ?auto_215465 ?auto_215464 ) ( not ( = ?auto_215464 ?auto_215465 ) ) ( not ( = ?auto_215464 ?auto_215466 ) ) ( not ( = ?auto_215464 ?auto_215467 ) ) ( not ( = ?auto_215465 ?auto_215466 ) ) ( not ( = ?auto_215465 ?auto_215467 ) ) ( not ( = ?auto_215466 ?auto_215467 ) ) ( ON ?auto_215467 ?auto_215468 ) ( CLEAR ?auto_215467 ) ( not ( = ?auto_215464 ?auto_215468 ) ) ( not ( = ?auto_215465 ?auto_215468 ) ) ( not ( = ?auto_215466 ?auto_215468 ) ) ( not ( = ?auto_215467 ?auto_215468 ) ) ( HOLDING ?auto_215466 ) ( CLEAR ?auto_215465 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215464 ?auto_215465 ?auto_215466 )
      ( MAKE-4PILE ?auto_215464 ?auto_215465 ?auto_215466 ?auto_215467 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215469 - BLOCK
      ?auto_215470 - BLOCK
      ?auto_215471 - BLOCK
      ?auto_215472 - BLOCK
    )
    :vars
    (
      ?auto_215473 - BLOCK
      ?auto_215476 - BLOCK
      ?auto_215474 - BLOCK
      ?auto_215475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215469 ) ( ON ?auto_215470 ?auto_215469 ) ( not ( = ?auto_215469 ?auto_215470 ) ) ( not ( = ?auto_215469 ?auto_215471 ) ) ( not ( = ?auto_215469 ?auto_215472 ) ) ( not ( = ?auto_215470 ?auto_215471 ) ) ( not ( = ?auto_215470 ?auto_215472 ) ) ( not ( = ?auto_215471 ?auto_215472 ) ) ( ON ?auto_215472 ?auto_215473 ) ( not ( = ?auto_215469 ?auto_215473 ) ) ( not ( = ?auto_215470 ?auto_215473 ) ) ( not ( = ?auto_215471 ?auto_215473 ) ) ( not ( = ?auto_215472 ?auto_215473 ) ) ( CLEAR ?auto_215470 ) ( ON ?auto_215471 ?auto_215472 ) ( CLEAR ?auto_215471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215476 ) ( ON ?auto_215474 ?auto_215476 ) ( ON ?auto_215475 ?auto_215474 ) ( ON ?auto_215473 ?auto_215475 ) ( not ( = ?auto_215476 ?auto_215474 ) ) ( not ( = ?auto_215476 ?auto_215475 ) ) ( not ( = ?auto_215476 ?auto_215473 ) ) ( not ( = ?auto_215476 ?auto_215472 ) ) ( not ( = ?auto_215476 ?auto_215471 ) ) ( not ( = ?auto_215474 ?auto_215475 ) ) ( not ( = ?auto_215474 ?auto_215473 ) ) ( not ( = ?auto_215474 ?auto_215472 ) ) ( not ( = ?auto_215474 ?auto_215471 ) ) ( not ( = ?auto_215475 ?auto_215473 ) ) ( not ( = ?auto_215475 ?auto_215472 ) ) ( not ( = ?auto_215475 ?auto_215471 ) ) ( not ( = ?auto_215469 ?auto_215476 ) ) ( not ( = ?auto_215469 ?auto_215474 ) ) ( not ( = ?auto_215469 ?auto_215475 ) ) ( not ( = ?auto_215470 ?auto_215476 ) ) ( not ( = ?auto_215470 ?auto_215474 ) ) ( not ( = ?auto_215470 ?auto_215475 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215476 ?auto_215474 ?auto_215475 ?auto_215473 ?auto_215472 )
      ( MAKE-4PILE ?auto_215469 ?auto_215470 ?auto_215471 ?auto_215472 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215477 - BLOCK
      ?auto_215478 - BLOCK
      ?auto_215479 - BLOCK
      ?auto_215480 - BLOCK
    )
    :vars
    (
      ?auto_215484 - BLOCK
      ?auto_215483 - BLOCK
      ?auto_215481 - BLOCK
      ?auto_215482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215477 ) ( not ( = ?auto_215477 ?auto_215478 ) ) ( not ( = ?auto_215477 ?auto_215479 ) ) ( not ( = ?auto_215477 ?auto_215480 ) ) ( not ( = ?auto_215478 ?auto_215479 ) ) ( not ( = ?auto_215478 ?auto_215480 ) ) ( not ( = ?auto_215479 ?auto_215480 ) ) ( ON ?auto_215480 ?auto_215484 ) ( not ( = ?auto_215477 ?auto_215484 ) ) ( not ( = ?auto_215478 ?auto_215484 ) ) ( not ( = ?auto_215479 ?auto_215484 ) ) ( not ( = ?auto_215480 ?auto_215484 ) ) ( ON ?auto_215479 ?auto_215480 ) ( CLEAR ?auto_215479 ) ( ON-TABLE ?auto_215483 ) ( ON ?auto_215481 ?auto_215483 ) ( ON ?auto_215482 ?auto_215481 ) ( ON ?auto_215484 ?auto_215482 ) ( not ( = ?auto_215483 ?auto_215481 ) ) ( not ( = ?auto_215483 ?auto_215482 ) ) ( not ( = ?auto_215483 ?auto_215484 ) ) ( not ( = ?auto_215483 ?auto_215480 ) ) ( not ( = ?auto_215483 ?auto_215479 ) ) ( not ( = ?auto_215481 ?auto_215482 ) ) ( not ( = ?auto_215481 ?auto_215484 ) ) ( not ( = ?auto_215481 ?auto_215480 ) ) ( not ( = ?auto_215481 ?auto_215479 ) ) ( not ( = ?auto_215482 ?auto_215484 ) ) ( not ( = ?auto_215482 ?auto_215480 ) ) ( not ( = ?auto_215482 ?auto_215479 ) ) ( not ( = ?auto_215477 ?auto_215483 ) ) ( not ( = ?auto_215477 ?auto_215481 ) ) ( not ( = ?auto_215477 ?auto_215482 ) ) ( not ( = ?auto_215478 ?auto_215483 ) ) ( not ( = ?auto_215478 ?auto_215481 ) ) ( not ( = ?auto_215478 ?auto_215482 ) ) ( HOLDING ?auto_215478 ) ( CLEAR ?auto_215477 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215477 ?auto_215478 )
      ( MAKE-4PILE ?auto_215477 ?auto_215478 ?auto_215479 ?auto_215480 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215485 - BLOCK
      ?auto_215486 - BLOCK
      ?auto_215487 - BLOCK
      ?auto_215488 - BLOCK
    )
    :vars
    (
      ?auto_215490 - BLOCK
      ?auto_215492 - BLOCK
      ?auto_215489 - BLOCK
      ?auto_215491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215485 ) ( not ( = ?auto_215485 ?auto_215486 ) ) ( not ( = ?auto_215485 ?auto_215487 ) ) ( not ( = ?auto_215485 ?auto_215488 ) ) ( not ( = ?auto_215486 ?auto_215487 ) ) ( not ( = ?auto_215486 ?auto_215488 ) ) ( not ( = ?auto_215487 ?auto_215488 ) ) ( ON ?auto_215488 ?auto_215490 ) ( not ( = ?auto_215485 ?auto_215490 ) ) ( not ( = ?auto_215486 ?auto_215490 ) ) ( not ( = ?auto_215487 ?auto_215490 ) ) ( not ( = ?auto_215488 ?auto_215490 ) ) ( ON ?auto_215487 ?auto_215488 ) ( ON-TABLE ?auto_215492 ) ( ON ?auto_215489 ?auto_215492 ) ( ON ?auto_215491 ?auto_215489 ) ( ON ?auto_215490 ?auto_215491 ) ( not ( = ?auto_215492 ?auto_215489 ) ) ( not ( = ?auto_215492 ?auto_215491 ) ) ( not ( = ?auto_215492 ?auto_215490 ) ) ( not ( = ?auto_215492 ?auto_215488 ) ) ( not ( = ?auto_215492 ?auto_215487 ) ) ( not ( = ?auto_215489 ?auto_215491 ) ) ( not ( = ?auto_215489 ?auto_215490 ) ) ( not ( = ?auto_215489 ?auto_215488 ) ) ( not ( = ?auto_215489 ?auto_215487 ) ) ( not ( = ?auto_215491 ?auto_215490 ) ) ( not ( = ?auto_215491 ?auto_215488 ) ) ( not ( = ?auto_215491 ?auto_215487 ) ) ( not ( = ?auto_215485 ?auto_215492 ) ) ( not ( = ?auto_215485 ?auto_215489 ) ) ( not ( = ?auto_215485 ?auto_215491 ) ) ( not ( = ?auto_215486 ?auto_215492 ) ) ( not ( = ?auto_215486 ?auto_215489 ) ) ( not ( = ?auto_215486 ?auto_215491 ) ) ( CLEAR ?auto_215485 ) ( ON ?auto_215486 ?auto_215487 ) ( CLEAR ?auto_215486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215492 ?auto_215489 ?auto_215491 ?auto_215490 ?auto_215488 ?auto_215487 )
      ( MAKE-4PILE ?auto_215485 ?auto_215486 ?auto_215487 ?auto_215488 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215493 - BLOCK
      ?auto_215494 - BLOCK
      ?auto_215495 - BLOCK
      ?auto_215496 - BLOCK
    )
    :vars
    (
      ?auto_215499 - BLOCK
      ?auto_215500 - BLOCK
      ?auto_215498 - BLOCK
      ?auto_215497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215493 ?auto_215494 ) ) ( not ( = ?auto_215493 ?auto_215495 ) ) ( not ( = ?auto_215493 ?auto_215496 ) ) ( not ( = ?auto_215494 ?auto_215495 ) ) ( not ( = ?auto_215494 ?auto_215496 ) ) ( not ( = ?auto_215495 ?auto_215496 ) ) ( ON ?auto_215496 ?auto_215499 ) ( not ( = ?auto_215493 ?auto_215499 ) ) ( not ( = ?auto_215494 ?auto_215499 ) ) ( not ( = ?auto_215495 ?auto_215499 ) ) ( not ( = ?auto_215496 ?auto_215499 ) ) ( ON ?auto_215495 ?auto_215496 ) ( ON-TABLE ?auto_215500 ) ( ON ?auto_215498 ?auto_215500 ) ( ON ?auto_215497 ?auto_215498 ) ( ON ?auto_215499 ?auto_215497 ) ( not ( = ?auto_215500 ?auto_215498 ) ) ( not ( = ?auto_215500 ?auto_215497 ) ) ( not ( = ?auto_215500 ?auto_215499 ) ) ( not ( = ?auto_215500 ?auto_215496 ) ) ( not ( = ?auto_215500 ?auto_215495 ) ) ( not ( = ?auto_215498 ?auto_215497 ) ) ( not ( = ?auto_215498 ?auto_215499 ) ) ( not ( = ?auto_215498 ?auto_215496 ) ) ( not ( = ?auto_215498 ?auto_215495 ) ) ( not ( = ?auto_215497 ?auto_215499 ) ) ( not ( = ?auto_215497 ?auto_215496 ) ) ( not ( = ?auto_215497 ?auto_215495 ) ) ( not ( = ?auto_215493 ?auto_215500 ) ) ( not ( = ?auto_215493 ?auto_215498 ) ) ( not ( = ?auto_215493 ?auto_215497 ) ) ( not ( = ?auto_215494 ?auto_215500 ) ) ( not ( = ?auto_215494 ?auto_215498 ) ) ( not ( = ?auto_215494 ?auto_215497 ) ) ( ON ?auto_215494 ?auto_215495 ) ( CLEAR ?auto_215494 ) ( HOLDING ?auto_215493 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215493 )
      ( MAKE-4PILE ?auto_215493 ?auto_215494 ?auto_215495 ?auto_215496 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215501 - BLOCK
      ?auto_215502 - BLOCK
      ?auto_215503 - BLOCK
      ?auto_215504 - BLOCK
    )
    :vars
    (
      ?auto_215507 - BLOCK
      ?auto_215506 - BLOCK
      ?auto_215508 - BLOCK
      ?auto_215505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215501 ?auto_215502 ) ) ( not ( = ?auto_215501 ?auto_215503 ) ) ( not ( = ?auto_215501 ?auto_215504 ) ) ( not ( = ?auto_215502 ?auto_215503 ) ) ( not ( = ?auto_215502 ?auto_215504 ) ) ( not ( = ?auto_215503 ?auto_215504 ) ) ( ON ?auto_215504 ?auto_215507 ) ( not ( = ?auto_215501 ?auto_215507 ) ) ( not ( = ?auto_215502 ?auto_215507 ) ) ( not ( = ?auto_215503 ?auto_215507 ) ) ( not ( = ?auto_215504 ?auto_215507 ) ) ( ON ?auto_215503 ?auto_215504 ) ( ON-TABLE ?auto_215506 ) ( ON ?auto_215508 ?auto_215506 ) ( ON ?auto_215505 ?auto_215508 ) ( ON ?auto_215507 ?auto_215505 ) ( not ( = ?auto_215506 ?auto_215508 ) ) ( not ( = ?auto_215506 ?auto_215505 ) ) ( not ( = ?auto_215506 ?auto_215507 ) ) ( not ( = ?auto_215506 ?auto_215504 ) ) ( not ( = ?auto_215506 ?auto_215503 ) ) ( not ( = ?auto_215508 ?auto_215505 ) ) ( not ( = ?auto_215508 ?auto_215507 ) ) ( not ( = ?auto_215508 ?auto_215504 ) ) ( not ( = ?auto_215508 ?auto_215503 ) ) ( not ( = ?auto_215505 ?auto_215507 ) ) ( not ( = ?auto_215505 ?auto_215504 ) ) ( not ( = ?auto_215505 ?auto_215503 ) ) ( not ( = ?auto_215501 ?auto_215506 ) ) ( not ( = ?auto_215501 ?auto_215508 ) ) ( not ( = ?auto_215501 ?auto_215505 ) ) ( not ( = ?auto_215502 ?auto_215506 ) ) ( not ( = ?auto_215502 ?auto_215508 ) ) ( not ( = ?auto_215502 ?auto_215505 ) ) ( ON ?auto_215502 ?auto_215503 ) ( ON ?auto_215501 ?auto_215502 ) ( CLEAR ?auto_215501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215506 ?auto_215508 ?auto_215505 ?auto_215507 ?auto_215504 ?auto_215503 ?auto_215502 )
      ( MAKE-4PILE ?auto_215501 ?auto_215502 ?auto_215503 ?auto_215504 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215509 - BLOCK
      ?auto_215510 - BLOCK
      ?auto_215511 - BLOCK
      ?auto_215512 - BLOCK
    )
    :vars
    (
      ?auto_215513 - BLOCK
      ?auto_215515 - BLOCK
      ?auto_215516 - BLOCK
      ?auto_215514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215509 ?auto_215510 ) ) ( not ( = ?auto_215509 ?auto_215511 ) ) ( not ( = ?auto_215509 ?auto_215512 ) ) ( not ( = ?auto_215510 ?auto_215511 ) ) ( not ( = ?auto_215510 ?auto_215512 ) ) ( not ( = ?auto_215511 ?auto_215512 ) ) ( ON ?auto_215512 ?auto_215513 ) ( not ( = ?auto_215509 ?auto_215513 ) ) ( not ( = ?auto_215510 ?auto_215513 ) ) ( not ( = ?auto_215511 ?auto_215513 ) ) ( not ( = ?auto_215512 ?auto_215513 ) ) ( ON ?auto_215511 ?auto_215512 ) ( ON-TABLE ?auto_215515 ) ( ON ?auto_215516 ?auto_215515 ) ( ON ?auto_215514 ?auto_215516 ) ( ON ?auto_215513 ?auto_215514 ) ( not ( = ?auto_215515 ?auto_215516 ) ) ( not ( = ?auto_215515 ?auto_215514 ) ) ( not ( = ?auto_215515 ?auto_215513 ) ) ( not ( = ?auto_215515 ?auto_215512 ) ) ( not ( = ?auto_215515 ?auto_215511 ) ) ( not ( = ?auto_215516 ?auto_215514 ) ) ( not ( = ?auto_215516 ?auto_215513 ) ) ( not ( = ?auto_215516 ?auto_215512 ) ) ( not ( = ?auto_215516 ?auto_215511 ) ) ( not ( = ?auto_215514 ?auto_215513 ) ) ( not ( = ?auto_215514 ?auto_215512 ) ) ( not ( = ?auto_215514 ?auto_215511 ) ) ( not ( = ?auto_215509 ?auto_215515 ) ) ( not ( = ?auto_215509 ?auto_215516 ) ) ( not ( = ?auto_215509 ?auto_215514 ) ) ( not ( = ?auto_215510 ?auto_215515 ) ) ( not ( = ?auto_215510 ?auto_215516 ) ) ( not ( = ?auto_215510 ?auto_215514 ) ) ( ON ?auto_215510 ?auto_215511 ) ( HOLDING ?auto_215509 ) ( CLEAR ?auto_215510 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_215515 ?auto_215516 ?auto_215514 ?auto_215513 ?auto_215512 ?auto_215511 ?auto_215510 ?auto_215509 )
      ( MAKE-4PILE ?auto_215509 ?auto_215510 ?auto_215511 ?auto_215512 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215517 - BLOCK
      ?auto_215518 - BLOCK
      ?auto_215519 - BLOCK
      ?auto_215520 - BLOCK
    )
    :vars
    (
      ?auto_215521 - BLOCK
      ?auto_215523 - BLOCK
      ?auto_215522 - BLOCK
      ?auto_215524 - BLOCK
      ?auto_215525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215517 ?auto_215518 ) ) ( not ( = ?auto_215517 ?auto_215519 ) ) ( not ( = ?auto_215517 ?auto_215520 ) ) ( not ( = ?auto_215518 ?auto_215519 ) ) ( not ( = ?auto_215518 ?auto_215520 ) ) ( not ( = ?auto_215519 ?auto_215520 ) ) ( ON ?auto_215520 ?auto_215521 ) ( not ( = ?auto_215517 ?auto_215521 ) ) ( not ( = ?auto_215518 ?auto_215521 ) ) ( not ( = ?auto_215519 ?auto_215521 ) ) ( not ( = ?auto_215520 ?auto_215521 ) ) ( ON ?auto_215519 ?auto_215520 ) ( ON-TABLE ?auto_215523 ) ( ON ?auto_215522 ?auto_215523 ) ( ON ?auto_215524 ?auto_215522 ) ( ON ?auto_215521 ?auto_215524 ) ( not ( = ?auto_215523 ?auto_215522 ) ) ( not ( = ?auto_215523 ?auto_215524 ) ) ( not ( = ?auto_215523 ?auto_215521 ) ) ( not ( = ?auto_215523 ?auto_215520 ) ) ( not ( = ?auto_215523 ?auto_215519 ) ) ( not ( = ?auto_215522 ?auto_215524 ) ) ( not ( = ?auto_215522 ?auto_215521 ) ) ( not ( = ?auto_215522 ?auto_215520 ) ) ( not ( = ?auto_215522 ?auto_215519 ) ) ( not ( = ?auto_215524 ?auto_215521 ) ) ( not ( = ?auto_215524 ?auto_215520 ) ) ( not ( = ?auto_215524 ?auto_215519 ) ) ( not ( = ?auto_215517 ?auto_215523 ) ) ( not ( = ?auto_215517 ?auto_215522 ) ) ( not ( = ?auto_215517 ?auto_215524 ) ) ( not ( = ?auto_215518 ?auto_215523 ) ) ( not ( = ?auto_215518 ?auto_215522 ) ) ( not ( = ?auto_215518 ?auto_215524 ) ) ( ON ?auto_215518 ?auto_215519 ) ( CLEAR ?auto_215518 ) ( ON ?auto_215517 ?auto_215525 ) ( CLEAR ?auto_215517 ) ( HAND-EMPTY ) ( not ( = ?auto_215517 ?auto_215525 ) ) ( not ( = ?auto_215518 ?auto_215525 ) ) ( not ( = ?auto_215519 ?auto_215525 ) ) ( not ( = ?auto_215520 ?auto_215525 ) ) ( not ( = ?auto_215521 ?auto_215525 ) ) ( not ( = ?auto_215523 ?auto_215525 ) ) ( not ( = ?auto_215522 ?auto_215525 ) ) ( not ( = ?auto_215524 ?auto_215525 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215517 ?auto_215525 )
      ( MAKE-4PILE ?auto_215517 ?auto_215518 ?auto_215519 ?auto_215520 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215526 - BLOCK
      ?auto_215527 - BLOCK
      ?auto_215528 - BLOCK
      ?auto_215529 - BLOCK
    )
    :vars
    (
      ?auto_215530 - BLOCK
      ?auto_215533 - BLOCK
      ?auto_215534 - BLOCK
      ?auto_215531 - BLOCK
      ?auto_215532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215526 ?auto_215527 ) ) ( not ( = ?auto_215526 ?auto_215528 ) ) ( not ( = ?auto_215526 ?auto_215529 ) ) ( not ( = ?auto_215527 ?auto_215528 ) ) ( not ( = ?auto_215527 ?auto_215529 ) ) ( not ( = ?auto_215528 ?auto_215529 ) ) ( ON ?auto_215529 ?auto_215530 ) ( not ( = ?auto_215526 ?auto_215530 ) ) ( not ( = ?auto_215527 ?auto_215530 ) ) ( not ( = ?auto_215528 ?auto_215530 ) ) ( not ( = ?auto_215529 ?auto_215530 ) ) ( ON ?auto_215528 ?auto_215529 ) ( ON-TABLE ?auto_215533 ) ( ON ?auto_215534 ?auto_215533 ) ( ON ?auto_215531 ?auto_215534 ) ( ON ?auto_215530 ?auto_215531 ) ( not ( = ?auto_215533 ?auto_215534 ) ) ( not ( = ?auto_215533 ?auto_215531 ) ) ( not ( = ?auto_215533 ?auto_215530 ) ) ( not ( = ?auto_215533 ?auto_215529 ) ) ( not ( = ?auto_215533 ?auto_215528 ) ) ( not ( = ?auto_215534 ?auto_215531 ) ) ( not ( = ?auto_215534 ?auto_215530 ) ) ( not ( = ?auto_215534 ?auto_215529 ) ) ( not ( = ?auto_215534 ?auto_215528 ) ) ( not ( = ?auto_215531 ?auto_215530 ) ) ( not ( = ?auto_215531 ?auto_215529 ) ) ( not ( = ?auto_215531 ?auto_215528 ) ) ( not ( = ?auto_215526 ?auto_215533 ) ) ( not ( = ?auto_215526 ?auto_215534 ) ) ( not ( = ?auto_215526 ?auto_215531 ) ) ( not ( = ?auto_215527 ?auto_215533 ) ) ( not ( = ?auto_215527 ?auto_215534 ) ) ( not ( = ?auto_215527 ?auto_215531 ) ) ( ON ?auto_215526 ?auto_215532 ) ( CLEAR ?auto_215526 ) ( not ( = ?auto_215526 ?auto_215532 ) ) ( not ( = ?auto_215527 ?auto_215532 ) ) ( not ( = ?auto_215528 ?auto_215532 ) ) ( not ( = ?auto_215529 ?auto_215532 ) ) ( not ( = ?auto_215530 ?auto_215532 ) ) ( not ( = ?auto_215533 ?auto_215532 ) ) ( not ( = ?auto_215534 ?auto_215532 ) ) ( not ( = ?auto_215531 ?auto_215532 ) ) ( HOLDING ?auto_215527 ) ( CLEAR ?auto_215528 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215533 ?auto_215534 ?auto_215531 ?auto_215530 ?auto_215529 ?auto_215528 ?auto_215527 )
      ( MAKE-4PILE ?auto_215526 ?auto_215527 ?auto_215528 ?auto_215529 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215535 - BLOCK
      ?auto_215536 - BLOCK
      ?auto_215537 - BLOCK
      ?auto_215538 - BLOCK
    )
    :vars
    (
      ?auto_215539 - BLOCK
      ?auto_215541 - BLOCK
      ?auto_215542 - BLOCK
      ?auto_215540 - BLOCK
      ?auto_215543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215535 ?auto_215536 ) ) ( not ( = ?auto_215535 ?auto_215537 ) ) ( not ( = ?auto_215535 ?auto_215538 ) ) ( not ( = ?auto_215536 ?auto_215537 ) ) ( not ( = ?auto_215536 ?auto_215538 ) ) ( not ( = ?auto_215537 ?auto_215538 ) ) ( ON ?auto_215538 ?auto_215539 ) ( not ( = ?auto_215535 ?auto_215539 ) ) ( not ( = ?auto_215536 ?auto_215539 ) ) ( not ( = ?auto_215537 ?auto_215539 ) ) ( not ( = ?auto_215538 ?auto_215539 ) ) ( ON ?auto_215537 ?auto_215538 ) ( ON-TABLE ?auto_215541 ) ( ON ?auto_215542 ?auto_215541 ) ( ON ?auto_215540 ?auto_215542 ) ( ON ?auto_215539 ?auto_215540 ) ( not ( = ?auto_215541 ?auto_215542 ) ) ( not ( = ?auto_215541 ?auto_215540 ) ) ( not ( = ?auto_215541 ?auto_215539 ) ) ( not ( = ?auto_215541 ?auto_215538 ) ) ( not ( = ?auto_215541 ?auto_215537 ) ) ( not ( = ?auto_215542 ?auto_215540 ) ) ( not ( = ?auto_215542 ?auto_215539 ) ) ( not ( = ?auto_215542 ?auto_215538 ) ) ( not ( = ?auto_215542 ?auto_215537 ) ) ( not ( = ?auto_215540 ?auto_215539 ) ) ( not ( = ?auto_215540 ?auto_215538 ) ) ( not ( = ?auto_215540 ?auto_215537 ) ) ( not ( = ?auto_215535 ?auto_215541 ) ) ( not ( = ?auto_215535 ?auto_215542 ) ) ( not ( = ?auto_215535 ?auto_215540 ) ) ( not ( = ?auto_215536 ?auto_215541 ) ) ( not ( = ?auto_215536 ?auto_215542 ) ) ( not ( = ?auto_215536 ?auto_215540 ) ) ( ON ?auto_215535 ?auto_215543 ) ( not ( = ?auto_215535 ?auto_215543 ) ) ( not ( = ?auto_215536 ?auto_215543 ) ) ( not ( = ?auto_215537 ?auto_215543 ) ) ( not ( = ?auto_215538 ?auto_215543 ) ) ( not ( = ?auto_215539 ?auto_215543 ) ) ( not ( = ?auto_215541 ?auto_215543 ) ) ( not ( = ?auto_215542 ?auto_215543 ) ) ( not ( = ?auto_215540 ?auto_215543 ) ) ( CLEAR ?auto_215537 ) ( ON ?auto_215536 ?auto_215535 ) ( CLEAR ?auto_215536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215543 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215543 ?auto_215535 )
      ( MAKE-4PILE ?auto_215535 ?auto_215536 ?auto_215537 ?auto_215538 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215544 - BLOCK
      ?auto_215545 - BLOCK
      ?auto_215546 - BLOCK
      ?auto_215547 - BLOCK
    )
    :vars
    (
      ?auto_215552 - BLOCK
      ?auto_215549 - BLOCK
      ?auto_215551 - BLOCK
      ?auto_215550 - BLOCK
      ?auto_215548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215544 ?auto_215545 ) ) ( not ( = ?auto_215544 ?auto_215546 ) ) ( not ( = ?auto_215544 ?auto_215547 ) ) ( not ( = ?auto_215545 ?auto_215546 ) ) ( not ( = ?auto_215545 ?auto_215547 ) ) ( not ( = ?auto_215546 ?auto_215547 ) ) ( ON ?auto_215547 ?auto_215552 ) ( not ( = ?auto_215544 ?auto_215552 ) ) ( not ( = ?auto_215545 ?auto_215552 ) ) ( not ( = ?auto_215546 ?auto_215552 ) ) ( not ( = ?auto_215547 ?auto_215552 ) ) ( ON-TABLE ?auto_215549 ) ( ON ?auto_215551 ?auto_215549 ) ( ON ?auto_215550 ?auto_215551 ) ( ON ?auto_215552 ?auto_215550 ) ( not ( = ?auto_215549 ?auto_215551 ) ) ( not ( = ?auto_215549 ?auto_215550 ) ) ( not ( = ?auto_215549 ?auto_215552 ) ) ( not ( = ?auto_215549 ?auto_215547 ) ) ( not ( = ?auto_215549 ?auto_215546 ) ) ( not ( = ?auto_215551 ?auto_215550 ) ) ( not ( = ?auto_215551 ?auto_215552 ) ) ( not ( = ?auto_215551 ?auto_215547 ) ) ( not ( = ?auto_215551 ?auto_215546 ) ) ( not ( = ?auto_215550 ?auto_215552 ) ) ( not ( = ?auto_215550 ?auto_215547 ) ) ( not ( = ?auto_215550 ?auto_215546 ) ) ( not ( = ?auto_215544 ?auto_215549 ) ) ( not ( = ?auto_215544 ?auto_215551 ) ) ( not ( = ?auto_215544 ?auto_215550 ) ) ( not ( = ?auto_215545 ?auto_215549 ) ) ( not ( = ?auto_215545 ?auto_215551 ) ) ( not ( = ?auto_215545 ?auto_215550 ) ) ( ON ?auto_215544 ?auto_215548 ) ( not ( = ?auto_215544 ?auto_215548 ) ) ( not ( = ?auto_215545 ?auto_215548 ) ) ( not ( = ?auto_215546 ?auto_215548 ) ) ( not ( = ?auto_215547 ?auto_215548 ) ) ( not ( = ?auto_215552 ?auto_215548 ) ) ( not ( = ?auto_215549 ?auto_215548 ) ) ( not ( = ?auto_215551 ?auto_215548 ) ) ( not ( = ?auto_215550 ?auto_215548 ) ) ( ON ?auto_215545 ?auto_215544 ) ( CLEAR ?auto_215545 ) ( ON-TABLE ?auto_215548 ) ( HOLDING ?auto_215546 ) ( CLEAR ?auto_215547 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215549 ?auto_215551 ?auto_215550 ?auto_215552 ?auto_215547 ?auto_215546 )
      ( MAKE-4PILE ?auto_215544 ?auto_215545 ?auto_215546 ?auto_215547 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215553 - BLOCK
      ?auto_215554 - BLOCK
      ?auto_215555 - BLOCK
      ?auto_215556 - BLOCK
    )
    :vars
    (
      ?auto_215559 - BLOCK
      ?auto_215558 - BLOCK
      ?auto_215561 - BLOCK
      ?auto_215557 - BLOCK
      ?auto_215560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215553 ?auto_215554 ) ) ( not ( = ?auto_215553 ?auto_215555 ) ) ( not ( = ?auto_215553 ?auto_215556 ) ) ( not ( = ?auto_215554 ?auto_215555 ) ) ( not ( = ?auto_215554 ?auto_215556 ) ) ( not ( = ?auto_215555 ?auto_215556 ) ) ( ON ?auto_215556 ?auto_215559 ) ( not ( = ?auto_215553 ?auto_215559 ) ) ( not ( = ?auto_215554 ?auto_215559 ) ) ( not ( = ?auto_215555 ?auto_215559 ) ) ( not ( = ?auto_215556 ?auto_215559 ) ) ( ON-TABLE ?auto_215558 ) ( ON ?auto_215561 ?auto_215558 ) ( ON ?auto_215557 ?auto_215561 ) ( ON ?auto_215559 ?auto_215557 ) ( not ( = ?auto_215558 ?auto_215561 ) ) ( not ( = ?auto_215558 ?auto_215557 ) ) ( not ( = ?auto_215558 ?auto_215559 ) ) ( not ( = ?auto_215558 ?auto_215556 ) ) ( not ( = ?auto_215558 ?auto_215555 ) ) ( not ( = ?auto_215561 ?auto_215557 ) ) ( not ( = ?auto_215561 ?auto_215559 ) ) ( not ( = ?auto_215561 ?auto_215556 ) ) ( not ( = ?auto_215561 ?auto_215555 ) ) ( not ( = ?auto_215557 ?auto_215559 ) ) ( not ( = ?auto_215557 ?auto_215556 ) ) ( not ( = ?auto_215557 ?auto_215555 ) ) ( not ( = ?auto_215553 ?auto_215558 ) ) ( not ( = ?auto_215553 ?auto_215561 ) ) ( not ( = ?auto_215553 ?auto_215557 ) ) ( not ( = ?auto_215554 ?auto_215558 ) ) ( not ( = ?auto_215554 ?auto_215561 ) ) ( not ( = ?auto_215554 ?auto_215557 ) ) ( ON ?auto_215553 ?auto_215560 ) ( not ( = ?auto_215553 ?auto_215560 ) ) ( not ( = ?auto_215554 ?auto_215560 ) ) ( not ( = ?auto_215555 ?auto_215560 ) ) ( not ( = ?auto_215556 ?auto_215560 ) ) ( not ( = ?auto_215559 ?auto_215560 ) ) ( not ( = ?auto_215558 ?auto_215560 ) ) ( not ( = ?auto_215561 ?auto_215560 ) ) ( not ( = ?auto_215557 ?auto_215560 ) ) ( ON ?auto_215554 ?auto_215553 ) ( ON-TABLE ?auto_215560 ) ( CLEAR ?auto_215556 ) ( ON ?auto_215555 ?auto_215554 ) ( CLEAR ?auto_215555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215560 ?auto_215553 ?auto_215554 )
      ( MAKE-4PILE ?auto_215553 ?auto_215554 ?auto_215555 ?auto_215556 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215562 - BLOCK
      ?auto_215563 - BLOCK
      ?auto_215564 - BLOCK
      ?auto_215565 - BLOCK
    )
    :vars
    (
      ?auto_215566 - BLOCK
      ?auto_215569 - BLOCK
      ?auto_215568 - BLOCK
      ?auto_215567 - BLOCK
      ?auto_215570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215562 ?auto_215563 ) ) ( not ( = ?auto_215562 ?auto_215564 ) ) ( not ( = ?auto_215562 ?auto_215565 ) ) ( not ( = ?auto_215563 ?auto_215564 ) ) ( not ( = ?auto_215563 ?auto_215565 ) ) ( not ( = ?auto_215564 ?auto_215565 ) ) ( not ( = ?auto_215562 ?auto_215566 ) ) ( not ( = ?auto_215563 ?auto_215566 ) ) ( not ( = ?auto_215564 ?auto_215566 ) ) ( not ( = ?auto_215565 ?auto_215566 ) ) ( ON-TABLE ?auto_215569 ) ( ON ?auto_215568 ?auto_215569 ) ( ON ?auto_215567 ?auto_215568 ) ( ON ?auto_215566 ?auto_215567 ) ( not ( = ?auto_215569 ?auto_215568 ) ) ( not ( = ?auto_215569 ?auto_215567 ) ) ( not ( = ?auto_215569 ?auto_215566 ) ) ( not ( = ?auto_215569 ?auto_215565 ) ) ( not ( = ?auto_215569 ?auto_215564 ) ) ( not ( = ?auto_215568 ?auto_215567 ) ) ( not ( = ?auto_215568 ?auto_215566 ) ) ( not ( = ?auto_215568 ?auto_215565 ) ) ( not ( = ?auto_215568 ?auto_215564 ) ) ( not ( = ?auto_215567 ?auto_215566 ) ) ( not ( = ?auto_215567 ?auto_215565 ) ) ( not ( = ?auto_215567 ?auto_215564 ) ) ( not ( = ?auto_215562 ?auto_215569 ) ) ( not ( = ?auto_215562 ?auto_215568 ) ) ( not ( = ?auto_215562 ?auto_215567 ) ) ( not ( = ?auto_215563 ?auto_215569 ) ) ( not ( = ?auto_215563 ?auto_215568 ) ) ( not ( = ?auto_215563 ?auto_215567 ) ) ( ON ?auto_215562 ?auto_215570 ) ( not ( = ?auto_215562 ?auto_215570 ) ) ( not ( = ?auto_215563 ?auto_215570 ) ) ( not ( = ?auto_215564 ?auto_215570 ) ) ( not ( = ?auto_215565 ?auto_215570 ) ) ( not ( = ?auto_215566 ?auto_215570 ) ) ( not ( = ?auto_215569 ?auto_215570 ) ) ( not ( = ?auto_215568 ?auto_215570 ) ) ( not ( = ?auto_215567 ?auto_215570 ) ) ( ON ?auto_215563 ?auto_215562 ) ( ON-TABLE ?auto_215570 ) ( ON ?auto_215564 ?auto_215563 ) ( CLEAR ?auto_215564 ) ( HOLDING ?auto_215565 ) ( CLEAR ?auto_215566 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215569 ?auto_215568 ?auto_215567 ?auto_215566 ?auto_215565 )
      ( MAKE-4PILE ?auto_215562 ?auto_215563 ?auto_215564 ?auto_215565 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215571 - BLOCK
      ?auto_215572 - BLOCK
      ?auto_215573 - BLOCK
      ?auto_215574 - BLOCK
    )
    :vars
    (
      ?auto_215579 - BLOCK
      ?auto_215578 - BLOCK
      ?auto_215577 - BLOCK
      ?auto_215576 - BLOCK
      ?auto_215575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215571 ?auto_215572 ) ) ( not ( = ?auto_215571 ?auto_215573 ) ) ( not ( = ?auto_215571 ?auto_215574 ) ) ( not ( = ?auto_215572 ?auto_215573 ) ) ( not ( = ?auto_215572 ?auto_215574 ) ) ( not ( = ?auto_215573 ?auto_215574 ) ) ( not ( = ?auto_215571 ?auto_215579 ) ) ( not ( = ?auto_215572 ?auto_215579 ) ) ( not ( = ?auto_215573 ?auto_215579 ) ) ( not ( = ?auto_215574 ?auto_215579 ) ) ( ON-TABLE ?auto_215578 ) ( ON ?auto_215577 ?auto_215578 ) ( ON ?auto_215576 ?auto_215577 ) ( ON ?auto_215579 ?auto_215576 ) ( not ( = ?auto_215578 ?auto_215577 ) ) ( not ( = ?auto_215578 ?auto_215576 ) ) ( not ( = ?auto_215578 ?auto_215579 ) ) ( not ( = ?auto_215578 ?auto_215574 ) ) ( not ( = ?auto_215578 ?auto_215573 ) ) ( not ( = ?auto_215577 ?auto_215576 ) ) ( not ( = ?auto_215577 ?auto_215579 ) ) ( not ( = ?auto_215577 ?auto_215574 ) ) ( not ( = ?auto_215577 ?auto_215573 ) ) ( not ( = ?auto_215576 ?auto_215579 ) ) ( not ( = ?auto_215576 ?auto_215574 ) ) ( not ( = ?auto_215576 ?auto_215573 ) ) ( not ( = ?auto_215571 ?auto_215578 ) ) ( not ( = ?auto_215571 ?auto_215577 ) ) ( not ( = ?auto_215571 ?auto_215576 ) ) ( not ( = ?auto_215572 ?auto_215578 ) ) ( not ( = ?auto_215572 ?auto_215577 ) ) ( not ( = ?auto_215572 ?auto_215576 ) ) ( ON ?auto_215571 ?auto_215575 ) ( not ( = ?auto_215571 ?auto_215575 ) ) ( not ( = ?auto_215572 ?auto_215575 ) ) ( not ( = ?auto_215573 ?auto_215575 ) ) ( not ( = ?auto_215574 ?auto_215575 ) ) ( not ( = ?auto_215579 ?auto_215575 ) ) ( not ( = ?auto_215578 ?auto_215575 ) ) ( not ( = ?auto_215577 ?auto_215575 ) ) ( not ( = ?auto_215576 ?auto_215575 ) ) ( ON ?auto_215572 ?auto_215571 ) ( ON-TABLE ?auto_215575 ) ( ON ?auto_215573 ?auto_215572 ) ( CLEAR ?auto_215579 ) ( ON ?auto_215574 ?auto_215573 ) ( CLEAR ?auto_215574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215575 ?auto_215571 ?auto_215572 ?auto_215573 )
      ( MAKE-4PILE ?auto_215571 ?auto_215572 ?auto_215573 ?auto_215574 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215580 - BLOCK
      ?auto_215581 - BLOCK
      ?auto_215582 - BLOCK
      ?auto_215583 - BLOCK
    )
    :vars
    (
      ?auto_215585 - BLOCK
      ?auto_215584 - BLOCK
      ?auto_215588 - BLOCK
      ?auto_215586 - BLOCK
      ?auto_215587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215580 ?auto_215581 ) ) ( not ( = ?auto_215580 ?auto_215582 ) ) ( not ( = ?auto_215580 ?auto_215583 ) ) ( not ( = ?auto_215581 ?auto_215582 ) ) ( not ( = ?auto_215581 ?auto_215583 ) ) ( not ( = ?auto_215582 ?auto_215583 ) ) ( not ( = ?auto_215580 ?auto_215585 ) ) ( not ( = ?auto_215581 ?auto_215585 ) ) ( not ( = ?auto_215582 ?auto_215585 ) ) ( not ( = ?auto_215583 ?auto_215585 ) ) ( ON-TABLE ?auto_215584 ) ( ON ?auto_215588 ?auto_215584 ) ( ON ?auto_215586 ?auto_215588 ) ( not ( = ?auto_215584 ?auto_215588 ) ) ( not ( = ?auto_215584 ?auto_215586 ) ) ( not ( = ?auto_215584 ?auto_215585 ) ) ( not ( = ?auto_215584 ?auto_215583 ) ) ( not ( = ?auto_215584 ?auto_215582 ) ) ( not ( = ?auto_215588 ?auto_215586 ) ) ( not ( = ?auto_215588 ?auto_215585 ) ) ( not ( = ?auto_215588 ?auto_215583 ) ) ( not ( = ?auto_215588 ?auto_215582 ) ) ( not ( = ?auto_215586 ?auto_215585 ) ) ( not ( = ?auto_215586 ?auto_215583 ) ) ( not ( = ?auto_215586 ?auto_215582 ) ) ( not ( = ?auto_215580 ?auto_215584 ) ) ( not ( = ?auto_215580 ?auto_215588 ) ) ( not ( = ?auto_215580 ?auto_215586 ) ) ( not ( = ?auto_215581 ?auto_215584 ) ) ( not ( = ?auto_215581 ?auto_215588 ) ) ( not ( = ?auto_215581 ?auto_215586 ) ) ( ON ?auto_215580 ?auto_215587 ) ( not ( = ?auto_215580 ?auto_215587 ) ) ( not ( = ?auto_215581 ?auto_215587 ) ) ( not ( = ?auto_215582 ?auto_215587 ) ) ( not ( = ?auto_215583 ?auto_215587 ) ) ( not ( = ?auto_215585 ?auto_215587 ) ) ( not ( = ?auto_215584 ?auto_215587 ) ) ( not ( = ?auto_215588 ?auto_215587 ) ) ( not ( = ?auto_215586 ?auto_215587 ) ) ( ON ?auto_215581 ?auto_215580 ) ( ON-TABLE ?auto_215587 ) ( ON ?auto_215582 ?auto_215581 ) ( ON ?auto_215583 ?auto_215582 ) ( CLEAR ?auto_215583 ) ( HOLDING ?auto_215585 ) ( CLEAR ?auto_215586 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215584 ?auto_215588 ?auto_215586 ?auto_215585 )
      ( MAKE-4PILE ?auto_215580 ?auto_215581 ?auto_215582 ?auto_215583 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215589 - BLOCK
      ?auto_215590 - BLOCK
      ?auto_215591 - BLOCK
      ?auto_215592 - BLOCK
    )
    :vars
    (
      ?auto_215596 - BLOCK
      ?auto_215593 - BLOCK
      ?auto_215595 - BLOCK
      ?auto_215594 - BLOCK
      ?auto_215597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215589 ?auto_215590 ) ) ( not ( = ?auto_215589 ?auto_215591 ) ) ( not ( = ?auto_215589 ?auto_215592 ) ) ( not ( = ?auto_215590 ?auto_215591 ) ) ( not ( = ?auto_215590 ?auto_215592 ) ) ( not ( = ?auto_215591 ?auto_215592 ) ) ( not ( = ?auto_215589 ?auto_215596 ) ) ( not ( = ?auto_215590 ?auto_215596 ) ) ( not ( = ?auto_215591 ?auto_215596 ) ) ( not ( = ?auto_215592 ?auto_215596 ) ) ( ON-TABLE ?auto_215593 ) ( ON ?auto_215595 ?auto_215593 ) ( ON ?auto_215594 ?auto_215595 ) ( not ( = ?auto_215593 ?auto_215595 ) ) ( not ( = ?auto_215593 ?auto_215594 ) ) ( not ( = ?auto_215593 ?auto_215596 ) ) ( not ( = ?auto_215593 ?auto_215592 ) ) ( not ( = ?auto_215593 ?auto_215591 ) ) ( not ( = ?auto_215595 ?auto_215594 ) ) ( not ( = ?auto_215595 ?auto_215596 ) ) ( not ( = ?auto_215595 ?auto_215592 ) ) ( not ( = ?auto_215595 ?auto_215591 ) ) ( not ( = ?auto_215594 ?auto_215596 ) ) ( not ( = ?auto_215594 ?auto_215592 ) ) ( not ( = ?auto_215594 ?auto_215591 ) ) ( not ( = ?auto_215589 ?auto_215593 ) ) ( not ( = ?auto_215589 ?auto_215595 ) ) ( not ( = ?auto_215589 ?auto_215594 ) ) ( not ( = ?auto_215590 ?auto_215593 ) ) ( not ( = ?auto_215590 ?auto_215595 ) ) ( not ( = ?auto_215590 ?auto_215594 ) ) ( ON ?auto_215589 ?auto_215597 ) ( not ( = ?auto_215589 ?auto_215597 ) ) ( not ( = ?auto_215590 ?auto_215597 ) ) ( not ( = ?auto_215591 ?auto_215597 ) ) ( not ( = ?auto_215592 ?auto_215597 ) ) ( not ( = ?auto_215596 ?auto_215597 ) ) ( not ( = ?auto_215593 ?auto_215597 ) ) ( not ( = ?auto_215595 ?auto_215597 ) ) ( not ( = ?auto_215594 ?auto_215597 ) ) ( ON ?auto_215590 ?auto_215589 ) ( ON-TABLE ?auto_215597 ) ( ON ?auto_215591 ?auto_215590 ) ( ON ?auto_215592 ?auto_215591 ) ( CLEAR ?auto_215594 ) ( ON ?auto_215596 ?auto_215592 ) ( CLEAR ?auto_215596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215597 ?auto_215589 ?auto_215590 ?auto_215591 ?auto_215592 )
      ( MAKE-4PILE ?auto_215589 ?auto_215590 ?auto_215591 ?auto_215592 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215598 - BLOCK
      ?auto_215599 - BLOCK
      ?auto_215600 - BLOCK
      ?auto_215601 - BLOCK
    )
    :vars
    (
      ?auto_215602 - BLOCK
      ?auto_215603 - BLOCK
      ?auto_215606 - BLOCK
      ?auto_215605 - BLOCK
      ?auto_215604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215598 ?auto_215599 ) ) ( not ( = ?auto_215598 ?auto_215600 ) ) ( not ( = ?auto_215598 ?auto_215601 ) ) ( not ( = ?auto_215599 ?auto_215600 ) ) ( not ( = ?auto_215599 ?auto_215601 ) ) ( not ( = ?auto_215600 ?auto_215601 ) ) ( not ( = ?auto_215598 ?auto_215602 ) ) ( not ( = ?auto_215599 ?auto_215602 ) ) ( not ( = ?auto_215600 ?auto_215602 ) ) ( not ( = ?auto_215601 ?auto_215602 ) ) ( ON-TABLE ?auto_215603 ) ( ON ?auto_215606 ?auto_215603 ) ( not ( = ?auto_215603 ?auto_215606 ) ) ( not ( = ?auto_215603 ?auto_215605 ) ) ( not ( = ?auto_215603 ?auto_215602 ) ) ( not ( = ?auto_215603 ?auto_215601 ) ) ( not ( = ?auto_215603 ?auto_215600 ) ) ( not ( = ?auto_215606 ?auto_215605 ) ) ( not ( = ?auto_215606 ?auto_215602 ) ) ( not ( = ?auto_215606 ?auto_215601 ) ) ( not ( = ?auto_215606 ?auto_215600 ) ) ( not ( = ?auto_215605 ?auto_215602 ) ) ( not ( = ?auto_215605 ?auto_215601 ) ) ( not ( = ?auto_215605 ?auto_215600 ) ) ( not ( = ?auto_215598 ?auto_215603 ) ) ( not ( = ?auto_215598 ?auto_215606 ) ) ( not ( = ?auto_215598 ?auto_215605 ) ) ( not ( = ?auto_215599 ?auto_215603 ) ) ( not ( = ?auto_215599 ?auto_215606 ) ) ( not ( = ?auto_215599 ?auto_215605 ) ) ( ON ?auto_215598 ?auto_215604 ) ( not ( = ?auto_215598 ?auto_215604 ) ) ( not ( = ?auto_215599 ?auto_215604 ) ) ( not ( = ?auto_215600 ?auto_215604 ) ) ( not ( = ?auto_215601 ?auto_215604 ) ) ( not ( = ?auto_215602 ?auto_215604 ) ) ( not ( = ?auto_215603 ?auto_215604 ) ) ( not ( = ?auto_215606 ?auto_215604 ) ) ( not ( = ?auto_215605 ?auto_215604 ) ) ( ON ?auto_215599 ?auto_215598 ) ( ON-TABLE ?auto_215604 ) ( ON ?auto_215600 ?auto_215599 ) ( ON ?auto_215601 ?auto_215600 ) ( ON ?auto_215602 ?auto_215601 ) ( CLEAR ?auto_215602 ) ( HOLDING ?auto_215605 ) ( CLEAR ?auto_215606 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215603 ?auto_215606 ?auto_215605 )
      ( MAKE-4PILE ?auto_215598 ?auto_215599 ?auto_215600 ?auto_215601 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215607 - BLOCK
      ?auto_215608 - BLOCK
      ?auto_215609 - BLOCK
      ?auto_215610 - BLOCK
    )
    :vars
    (
      ?auto_215614 - BLOCK
      ?auto_215615 - BLOCK
      ?auto_215613 - BLOCK
      ?auto_215612 - BLOCK
      ?auto_215611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215607 ?auto_215608 ) ) ( not ( = ?auto_215607 ?auto_215609 ) ) ( not ( = ?auto_215607 ?auto_215610 ) ) ( not ( = ?auto_215608 ?auto_215609 ) ) ( not ( = ?auto_215608 ?auto_215610 ) ) ( not ( = ?auto_215609 ?auto_215610 ) ) ( not ( = ?auto_215607 ?auto_215614 ) ) ( not ( = ?auto_215608 ?auto_215614 ) ) ( not ( = ?auto_215609 ?auto_215614 ) ) ( not ( = ?auto_215610 ?auto_215614 ) ) ( ON-TABLE ?auto_215615 ) ( ON ?auto_215613 ?auto_215615 ) ( not ( = ?auto_215615 ?auto_215613 ) ) ( not ( = ?auto_215615 ?auto_215612 ) ) ( not ( = ?auto_215615 ?auto_215614 ) ) ( not ( = ?auto_215615 ?auto_215610 ) ) ( not ( = ?auto_215615 ?auto_215609 ) ) ( not ( = ?auto_215613 ?auto_215612 ) ) ( not ( = ?auto_215613 ?auto_215614 ) ) ( not ( = ?auto_215613 ?auto_215610 ) ) ( not ( = ?auto_215613 ?auto_215609 ) ) ( not ( = ?auto_215612 ?auto_215614 ) ) ( not ( = ?auto_215612 ?auto_215610 ) ) ( not ( = ?auto_215612 ?auto_215609 ) ) ( not ( = ?auto_215607 ?auto_215615 ) ) ( not ( = ?auto_215607 ?auto_215613 ) ) ( not ( = ?auto_215607 ?auto_215612 ) ) ( not ( = ?auto_215608 ?auto_215615 ) ) ( not ( = ?auto_215608 ?auto_215613 ) ) ( not ( = ?auto_215608 ?auto_215612 ) ) ( ON ?auto_215607 ?auto_215611 ) ( not ( = ?auto_215607 ?auto_215611 ) ) ( not ( = ?auto_215608 ?auto_215611 ) ) ( not ( = ?auto_215609 ?auto_215611 ) ) ( not ( = ?auto_215610 ?auto_215611 ) ) ( not ( = ?auto_215614 ?auto_215611 ) ) ( not ( = ?auto_215615 ?auto_215611 ) ) ( not ( = ?auto_215613 ?auto_215611 ) ) ( not ( = ?auto_215612 ?auto_215611 ) ) ( ON ?auto_215608 ?auto_215607 ) ( ON-TABLE ?auto_215611 ) ( ON ?auto_215609 ?auto_215608 ) ( ON ?auto_215610 ?auto_215609 ) ( ON ?auto_215614 ?auto_215610 ) ( CLEAR ?auto_215613 ) ( ON ?auto_215612 ?auto_215614 ) ( CLEAR ?auto_215612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215611 ?auto_215607 ?auto_215608 ?auto_215609 ?auto_215610 ?auto_215614 )
      ( MAKE-4PILE ?auto_215607 ?auto_215608 ?auto_215609 ?auto_215610 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215616 - BLOCK
      ?auto_215617 - BLOCK
      ?auto_215618 - BLOCK
      ?auto_215619 - BLOCK
    )
    :vars
    (
      ?auto_215622 - BLOCK
      ?auto_215620 - BLOCK
      ?auto_215624 - BLOCK
      ?auto_215623 - BLOCK
      ?auto_215621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215616 ?auto_215617 ) ) ( not ( = ?auto_215616 ?auto_215618 ) ) ( not ( = ?auto_215616 ?auto_215619 ) ) ( not ( = ?auto_215617 ?auto_215618 ) ) ( not ( = ?auto_215617 ?auto_215619 ) ) ( not ( = ?auto_215618 ?auto_215619 ) ) ( not ( = ?auto_215616 ?auto_215622 ) ) ( not ( = ?auto_215617 ?auto_215622 ) ) ( not ( = ?auto_215618 ?auto_215622 ) ) ( not ( = ?auto_215619 ?auto_215622 ) ) ( ON-TABLE ?auto_215620 ) ( not ( = ?auto_215620 ?auto_215624 ) ) ( not ( = ?auto_215620 ?auto_215623 ) ) ( not ( = ?auto_215620 ?auto_215622 ) ) ( not ( = ?auto_215620 ?auto_215619 ) ) ( not ( = ?auto_215620 ?auto_215618 ) ) ( not ( = ?auto_215624 ?auto_215623 ) ) ( not ( = ?auto_215624 ?auto_215622 ) ) ( not ( = ?auto_215624 ?auto_215619 ) ) ( not ( = ?auto_215624 ?auto_215618 ) ) ( not ( = ?auto_215623 ?auto_215622 ) ) ( not ( = ?auto_215623 ?auto_215619 ) ) ( not ( = ?auto_215623 ?auto_215618 ) ) ( not ( = ?auto_215616 ?auto_215620 ) ) ( not ( = ?auto_215616 ?auto_215624 ) ) ( not ( = ?auto_215616 ?auto_215623 ) ) ( not ( = ?auto_215617 ?auto_215620 ) ) ( not ( = ?auto_215617 ?auto_215624 ) ) ( not ( = ?auto_215617 ?auto_215623 ) ) ( ON ?auto_215616 ?auto_215621 ) ( not ( = ?auto_215616 ?auto_215621 ) ) ( not ( = ?auto_215617 ?auto_215621 ) ) ( not ( = ?auto_215618 ?auto_215621 ) ) ( not ( = ?auto_215619 ?auto_215621 ) ) ( not ( = ?auto_215622 ?auto_215621 ) ) ( not ( = ?auto_215620 ?auto_215621 ) ) ( not ( = ?auto_215624 ?auto_215621 ) ) ( not ( = ?auto_215623 ?auto_215621 ) ) ( ON ?auto_215617 ?auto_215616 ) ( ON-TABLE ?auto_215621 ) ( ON ?auto_215618 ?auto_215617 ) ( ON ?auto_215619 ?auto_215618 ) ( ON ?auto_215622 ?auto_215619 ) ( ON ?auto_215623 ?auto_215622 ) ( CLEAR ?auto_215623 ) ( HOLDING ?auto_215624 ) ( CLEAR ?auto_215620 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215620 ?auto_215624 )
      ( MAKE-4PILE ?auto_215616 ?auto_215617 ?auto_215618 ?auto_215619 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215625 - BLOCK
      ?auto_215626 - BLOCK
      ?auto_215627 - BLOCK
      ?auto_215628 - BLOCK
    )
    :vars
    (
      ?auto_215631 - BLOCK
      ?auto_215630 - BLOCK
      ?auto_215632 - BLOCK
      ?auto_215629 - BLOCK
      ?auto_215633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215625 ?auto_215626 ) ) ( not ( = ?auto_215625 ?auto_215627 ) ) ( not ( = ?auto_215625 ?auto_215628 ) ) ( not ( = ?auto_215626 ?auto_215627 ) ) ( not ( = ?auto_215626 ?auto_215628 ) ) ( not ( = ?auto_215627 ?auto_215628 ) ) ( not ( = ?auto_215625 ?auto_215631 ) ) ( not ( = ?auto_215626 ?auto_215631 ) ) ( not ( = ?auto_215627 ?auto_215631 ) ) ( not ( = ?auto_215628 ?auto_215631 ) ) ( ON-TABLE ?auto_215630 ) ( not ( = ?auto_215630 ?auto_215632 ) ) ( not ( = ?auto_215630 ?auto_215629 ) ) ( not ( = ?auto_215630 ?auto_215631 ) ) ( not ( = ?auto_215630 ?auto_215628 ) ) ( not ( = ?auto_215630 ?auto_215627 ) ) ( not ( = ?auto_215632 ?auto_215629 ) ) ( not ( = ?auto_215632 ?auto_215631 ) ) ( not ( = ?auto_215632 ?auto_215628 ) ) ( not ( = ?auto_215632 ?auto_215627 ) ) ( not ( = ?auto_215629 ?auto_215631 ) ) ( not ( = ?auto_215629 ?auto_215628 ) ) ( not ( = ?auto_215629 ?auto_215627 ) ) ( not ( = ?auto_215625 ?auto_215630 ) ) ( not ( = ?auto_215625 ?auto_215632 ) ) ( not ( = ?auto_215625 ?auto_215629 ) ) ( not ( = ?auto_215626 ?auto_215630 ) ) ( not ( = ?auto_215626 ?auto_215632 ) ) ( not ( = ?auto_215626 ?auto_215629 ) ) ( ON ?auto_215625 ?auto_215633 ) ( not ( = ?auto_215625 ?auto_215633 ) ) ( not ( = ?auto_215626 ?auto_215633 ) ) ( not ( = ?auto_215627 ?auto_215633 ) ) ( not ( = ?auto_215628 ?auto_215633 ) ) ( not ( = ?auto_215631 ?auto_215633 ) ) ( not ( = ?auto_215630 ?auto_215633 ) ) ( not ( = ?auto_215632 ?auto_215633 ) ) ( not ( = ?auto_215629 ?auto_215633 ) ) ( ON ?auto_215626 ?auto_215625 ) ( ON-TABLE ?auto_215633 ) ( ON ?auto_215627 ?auto_215626 ) ( ON ?auto_215628 ?auto_215627 ) ( ON ?auto_215631 ?auto_215628 ) ( ON ?auto_215629 ?auto_215631 ) ( CLEAR ?auto_215630 ) ( ON ?auto_215632 ?auto_215629 ) ( CLEAR ?auto_215632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215633 ?auto_215625 ?auto_215626 ?auto_215627 ?auto_215628 ?auto_215631 ?auto_215629 )
      ( MAKE-4PILE ?auto_215625 ?auto_215626 ?auto_215627 ?auto_215628 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215634 - BLOCK
      ?auto_215635 - BLOCK
      ?auto_215636 - BLOCK
      ?auto_215637 - BLOCK
    )
    :vars
    (
      ?auto_215640 - BLOCK
      ?auto_215642 - BLOCK
      ?auto_215641 - BLOCK
      ?auto_215639 - BLOCK
      ?auto_215638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215634 ?auto_215635 ) ) ( not ( = ?auto_215634 ?auto_215636 ) ) ( not ( = ?auto_215634 ?auto_215637 ) ) ( not ( = ?auto_215635 ?auto_215636 ) ) ( not ( = ?auto_215635 ?auto_215637 ) ) ( not ( = ?auto_215636 ?auto_215637 ) ) ( not ( = ?auto_215634 ?auto_215640 ) ) ( not ( = ?auto_215635 ?auto_215640 ) ) ( not ( = ?auto_215636 ?auto_215640 ) ) ( not ( = ?auto_215637 ?auto_215640 ) ) ( not ( = ?auto_215642 ?auto_215641 ) ) ( not ( = ?auto_215642 ?auto_215639 ) ) ( not ( = ?auto_215642 ?auto_215640 ) ) ( not ( = ?auto_215642 ?auto_215637 ) ) ( not ( = ?auto_215642 ?auto_215636 ) ) ( not ( = ?auto_215641 ?auto_215639 ) ) ( not ( = ?auto_215641 ?auto_215640 ) ) ( not ( = ?auto_215641 ?auto_215637 ) ) ( not ( = ?auto_215641 ?auto_215636 ) ) ( not ( = ?auto_215639 ?auto_215640 ) ) ( not ( = ?auto_215639 ?auto_215637 ) ) ( not ( = ?auto_215639 ?auto_215636 ) ) ( not ( = ?auto_215634 ?auto_215642 ) ) ( not ( = ?auto_215634 ?auto_215641 ) ) ( not ( = ?auto_215634 ?auto_215639 ) ) ( not ( = ?auto_215635 ?auto_215642 ) ) ( not ( = ?auto_215635 ?auto_215641 ) ) ( not ( = ?auto_215635 ?auto_215639 ) ) ( ON ?auto_215634 ?auto_215638 ) ( not ( = ?auto_215634 ?auto_215638 ) ) ( not ( = ?auto_215635 ?auto_215638 ) ) ( not ( = ?auto_215636 ?auto_215638 ) ) ( not ( = ?auto_215637 ?auto_215638 ) ) ( not ( = ?auto_215640 ?auto_215638 ) ) ( not ( = ?auto_215642 ?auto_215638 ) ) ( not ( = ?auto_215641 ?auto_215638 ) ) ( not ( = ?auto_215639 ?auto_215638 ) ) ( ON ?auto_215635 ?auto_215634 ) ( ON-TABLE ?auto_215638 ) ( ON ?auto_215636 ?auto_215635 ) ( ON ?auto_215637 ?auto_215636 ) ( ON ?auto_215640 ?auto_215637 ) ( ON ?auto_215639 ?auto_215640 ) ( ON ?auto_215641 ?auto_215639 ) ( CLEAR ?auto_215641 ) ( HOLDING ?auto_215642 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215642 )
      ( MAKE-4PILE ?auto_215634 ?auto_215635 ?auto_215636 ?auto_215637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215643 - BLOCK
      ?auto_215644 - BLOCK
      ?auto_215645 - BLOCK
      ?auto_215646 - BLOCK
    )
    :vars
    (
      ?auto_215651 - BLOCK
      ?auto_215650 - BLOCK
      ?auto_215648 - BLOCK
      ?auto_215647 - BLOCK
      ?auto_215649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215643 ?auto_215644 ) ) ( not ( = ?auto_215643 ?auto_215645 ) ) ( not ( = ?auto_215643 ?auto_215646 ) ) ( not ( = ?auto_215644 ?auto_215645 ) ) ( not ( = ?auto_215644 ?auto_215646 ) ) ( not ( = ?auto_215645 ?auto_215646 ) ) ( not ( = ?auto_215643 ?auto_215651 ) ) ( not ( = ?auto_215644 ?auto_215651 ) ) ( not ( = ?auto_215645 ?auto_215651 ) ) ( not ( = ?auto_215646 ?auto_215651 ) ) ( not ( = ?auto_215650 ?auto_215648 ) ) ( not ( = ?auto_215650 ?auto_215647 ) ) ( not ( = ?auto_215650 ?auto_215651 ) ) ( not ( = ?auto_215650 ?auto_215646 ) ) ( not ( = ?auto_215650 ?auto_215645 ) ) ( not ( = ?auto_215648 ?auto_215647 ) ) ( not ( = ?auto_215648 ?auto_215651 ) ) ( not ( = ?auto_215648 ?auto_215646 ) ) ( not ( = ?auto_215648 ?auto_215645 ) ) ( not ( = ?auto_215647 ?auto_215651 ) ) ( not ( = ?auto_215647 ?auto_215646 ) ) ( not ( = ?auto_215647 ?auto_215645 ) ) ( not ( = ?auto_215643 ?auto_215650 ) ) ( not ( = ?auto_215643 ?auto_215648 ) ) ( not ( = ?auto_215643 ?auto_215647 ) ) ( not ( = ?auto_215644 ?auto_215650 ) ) ( not ( = ?auto_215644 ?auto_215648 ) ) ( not ( = ?auto_215644 ?auto_215647 ) ) ( ON ?auto_215643 ?auto_215649 ) ( not ( = ?auto_215643 ?auto_215649 ) ) ( not ( = ?auto_215644 ?auto_215649 ) ) ( not ( = ?auto_215645 ?auto_215649 ) ) ( not ( = ?auto_215646 ?auto_215649 ) ) ( not ( = ?auto_215651 ?auto_215649 ) ) ( not ( = ?auto_215650 ?auto_215649 ) ) ( not ( = ?auto_215648 ?auto_215649 ) ) ( not ( = ?auto_215647 ?auto_215649 ) ) ( ON ?auto_215644 ?auto_215643 ) ( ON-TABLE ?auto_215649 ) ( ON ?auto_215645 ?auto_215644 ) ( ON ?auto_215646 ?auto_215645 ) ( ON ?auto_215651 ?auto_215646 ) ( ON ?auto_215647 ?auto_215651 ) ( ON ?auto_215648 ?auto_215647 ) ( ON ?auto_215650 ?auto_215648 ) ( CLEAR ?auto_215650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_215649 ?auto_215643 ?auto_215644 ?auto_215645 ?auto_215646 ?auto_215651 ?auto_215647 ?auto_215648 )
      ( MAKE-4PILE ?auto_215643 ?auto_215644 ?auto_215645 ?auto_215646 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215655 - BLOCK
      ?auto_215656 - BLOCK
      ?auto_215657 - BLOCK
    )
    :vars
    (
      ?auto_215658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215658 ?auto_215657 ) ( CLEAR ?auto_215658 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215655 ) ( ON ?auto_215656 ?auto_215655 ) ( ON ?auto_215657 ?auto_215656 ) ( not ( = ?auto_215655 ?auto_215656 ) ) ( not ( = ?auto_215655 ?auto_215657 ) ) ( not ( = ?auto_215655 ?auto_215658 ) ) ( not ( = ?auto_215656 ?auto_215657 ) ) ( not ( = ?auto_215656 ?auto_215658 ) ) ( not ( = ?auto_215657 ?auto_215658 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215658 ?auto_215657 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215659 - BLOCK
      ?auto_215660 - BLOCK
      ?auto_215661 - BLOCK
    )
    :vars
    (
      ?auto_215662 - BLOCK
      ?auto_215663 - BLOCK
      ?auto_215664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215662 ?auto_215661 ) ( CLEAR ?auto_215662 ) ( ON-TABLE ?auto_215659 ) ( ON ?auto_215660 ?auto_215659 ) ( ON ?auto_215661 ?auto_215660 ) ( not ( = ?auto_215659 ?auto_215660 ) ) ( not ( = ?auto_215659 ?auto_215661 ) ) ( not ( = ?auto_215659 ?auto_215662 ) ) ( not ( = ?auto_215660 ?auto_215661 ) ) ( not ( = ?auto_215660 ?auto_215662 ) ) ( not ( = ?auto_215661 ?auto_215662 ) ) ( HOLDING ?auto_215663 ) ( CLEAR ?auto_215664 ) ( not ( = ?auto_215659 ?auto_215663 ) ) ( not ( = ?auto_215659 ?auto_215664 ) ) ( not ( = ?auto_215660 ?auto_215663 ) ) ( not ( = ?auto_215660 ?auto_215664 ) ) ( not ( = ?auto_215661 ?auto_215663 ) ) ( not ( = ?auto_215661 ?auto_215664 ) ) ( not ( = ?auto_215662 ?auto_215663 ) ) ( not ( = ?auto_215662 ?auto_215664 ) ) ( not ( = ?auto_215663 ?auto_215664 ) ) )
    :subtasks
    ( ( !STACK ?auto_215663 ?auto_215664 )
      ( MAKE-3PILE ?auto_215659 ?auto_215660 ?auto_215661 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215665 - BLOCK
      ?auto_215666 - BLOCK
      ?auto_215667 - BLOCK
    )
    :vars
    (
      ?auto_215668 - BLOCK
      ?auto_215670 - BLOCK
      ?auto_215669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215668 ?auto_215667 ) ( ON-TABLE ?auto_215665 ) ( ON ?auto_215666 ?auto_215665 ) ( ON ?auto_215667 ?auto_215666 ) ( not ( = ?auto_215665 ?auto_215666 ) ) ( not ( = ?auto_215665 ?auto_215667 ) ) ( not ( = ?auto_215665 ?auto_215668 ) ) ( not ( = ?auto_215666 ?auto_215667 ) ) ( not ( = ?auto_215666 ?auto_215668 ) ) ( not ( = ?auto_215667 ?auto_215668 ) ) ( CLEAR ?auto_215670 ) ( not ( = ?auto_215665 ?auto_215669 ) ) ( not ( = ?auto_215665 ?auto_215670 ) ) ( not ( = ?auto_215666 ?auto_215669 ) ) ( not ( = ?auto_215666 ?auto_215670 ) ) ( not ( = ?auto_215667 ?auto_215669 ) ) ( not ( = ?auto_215667 ?auto_215670 ) ) ( not ( = ?auto_215668 ?auto_215669 ) ) ( not ( = ?auto_215668 ?auto_215670 ) ) ( not ( = ?auto_215669 ?auto_215670 ) ) ( ON ?auto_215669 ?auto_215668 ) ( CLEAR ?auto_215669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215665 ?auto_215666 ?auto_215667 ?auto_215668 )
      ( MAKE-3PILE ?auto_215665 ?auto_215666 ?auto_215667 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215671 - BLOCK
      ?auto_215672 - BLOCK
      ?auto_215673 - BLOCK
    )
    :vars
    (
      ?auto_215674 - BLOCK
      ?auto_215676 - BLOCK
      ?auto_215675 - BLOCK
      ?auto_215677 - BLOCK
      ?auto_215678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215674 ?auto_215673 ) ( ON-TABLE ?auto_215671 ) ( ON ?auto_215672 ?auto_215671 ) ( ON ?auto_215673 ?auto_215672 ) ( not ( = ?auto_215671 ?auto_215672 ) ) ( not ( = ?auto_215671 ?auto_215673 ) ) ( not ( = ?auto_215671 ?auto_215674 ) ) ( not ( = ?auto_215672 ?auto_215673 ) ) ( not ( = ?auto_215672 ?auto_215674 ) ) ( not ( = ?auto_215673 ?auto_215674 ) ) ( not ( = ?auto_215671 ?auto_215676 ) ) ( not ( = ?auto_215671 ?auto_215675 ) ) ( not ( = ?auto_215672 ?auto_215676 ) ) ( not ( = ?auto_215672 ?auto_215675 ) ) ( not ( = ?auto_215673 ?auto_215676 ) ) ( not ( = ?auto_215673 ?auto_215675 ) ) ( not ( = ?auto_215674 ?auto_215676 ) ) ( not ( = ?auto_215674 ?auto_215675 ) ) ( not ( = ?auto_215676 ?auto_215675 ) ) ( ON ?auto_215676 ?auto_215674 ) ( CLEAR ?auto_215676 ) ( HOLDING ?auto_215675 ) ( CLEAR ?auto_215677 ) ( ON-TABLE ?auto_215678 ) ( ON ?auto_215677 ?auto_215678 ) ( not ( = ?auto_215678 ?auto_215677 ) ) ( not ( = ?auto_215678 ?auto_215675 ) ) ( not ( = ?auto_215677 ?auto_215675 ) ) ( not ( = ?auto_215671 ?auto_215677 ) ) ( not ( = ?auto_215671 ?auto_215678 ) ) ( not ( = ?auto_215672 ?auto_215677 ) ) ( not ( = ?auto_215672 ?auto_215678 ) ) ( not ( = ?auto_215673 ?auto_215677 ) ) ( not ( = ?auto_215673 ?auto_215678 ) ) ( not ( = ?auto_215674 ?auto_215677 ) ) ( not ( = ?auto_215674 ?auto_215678 ) ) ( not ( = ?auto_215676 ?auto_215677 ) ) ( not ( = ?auto_215676 ?auto_215678 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215678 ?auto_215677 ?auto_215675 )
      ( MAKE-3PILE ?auto_215671 ?auto_215672 ?auto_215673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215679 - BLOCK
      ?auto_215680 - BLOCK
      ?auto_215681 - BLOCK
    )
    :vars
    (
      ?auto_215682 - BLOCK
      ?auto_215683 - BLOCK
      ?auto_215686 - BLOCK
      ?auto_215684 - BLOCK
      ?auto_215685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215682 ?auto_215681 ) ( ON-TABLE ?auto_215679 ) ( ON ?auto_215680 ?auto_215679 ) ( ON ?auto_215681 ?auto_215680 ) ( not ( = ?auto_215679 ?auto_215680 ) ) ( not ( = ?auto_215679 ?auto_215681 ) ) ( not ( = ?auto_215679 ?auto_215682 ) ) ( not ( = ?auto_215680 ?auto_215681 ) ) ( not ( = ?auto_215680 ?auto_215682 ) ) ( not ( = ?auto_215681 ?auto_215682 ) ) ( not ( = ?auto_215679 ?auto_215683 ) ) ( not ( = ?auto_215679 ?auto_215686 ) ) ( not ( = ?auto_215680 ?auto_215683 ) ) ( not ( = ?auto_215680 ?auto_215686 ) ) ( not ( = ?auto_215681 ?auto_215683 ) ) ( not ( = ?auto_215681 ?auto_215686 ) ) ( not ( = ?auto_215682 ?auto_215683 ) ) ( not ( = ?auto_215682 ?auto_215686 ) ) ( not ( = ?auto_215683 ?auto_215686 ) ) ( ON ?auto_215683 ?auto_215682 ) ( CLEAR ?auto_215684 ) ( ON-TABLE ?auto_215685 ) ( ON ?auto_215684 ?auto_215685 ) ( not ( = ?auto_215685 ?auto_215684 ) ) ( not ( = ?auto_215685 ?auto_215686 ) ) ( not ( = ?auto_215684 ?auto_215686 ) ) ( not ( = ?auto_215679 ?auto_215684 ) ) ( not ( = ?auto_215679 ?auto_215685 ) ) ( not ( = ?auto_215680 ?auto_215684 ) ) ( not ( = ?auto_215680 ?auto_215685 ) ) ( not ( = ?auto_215681 ?auto_215684 ) ) ( not ( = ?auto_215681 ?auto_215685 ) ) ( not ( = ?auto_215682 ?auto_215684 ) ) ( not ( = ?auto_215682 ?auto_215685 ) ) ( not ( = ?auto_215683 ?auto_215684 ) ) ( not ( = ?auto_215683 ?auto_215685 ) ) ( ON ?auto_215686 ?auto_215683 ) ( CLEAR ?auto_215686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215679 ?auto_215680 ?auto_215681 ?auto_215682 ?auto_215683 )
      ( MAKE-3PILE ?auto_215679 ?auto_215680 ?auto_215681 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215687 - BLOCK
      ?auto_215688 - BLOCK
      ?auto_215689 - BLOCK
    )
    :vars
    (
      ?auto_215692 - BLOCK
      ?auto_215690 - BLOCK
      ?auto_215693 - BLOCK
      ?auto_215694 - BLOCK
      ?auto_215691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215692 ?auto_215689 ) ( ON-TABLE ?auto_215687 ) ( ON ?auto_215688 ?auto_215687 ) ( ON ?auto_215689 ?auto_215688 ) ( not ( = ?auto_215687 ?auto_215688 ) ) ( not ( = ?auto_215687 ?auto_215689 ) ) ( not ( = ?auto_215687 ?auto_215692 ) ) ( not ( = ?auto_215688 ?auto_215689 ) ) ( not ( = ?auto_215688 ?auto_215692 ) ) ( not ( = ?auto_215689 ?auto_215692 ) ) ( not ( = ?auto_215687 ?auto_215690 ) ) ( not ( = ?auto_215687 ?auto_215693 ) ) ( not ( = ?auto_215688 ?auto_215690 ) ) ( not ( = ?auto_215688 ?auto_215693 ) ) ( not ( = ?auto_215689 ?auto_215690 ) ) ( not ( = ?auto_215689 ?auto_215693 ) ) ( not ( = ?auto_215692 ?auto_215690 ) ) ( not ( = ?auto_215692 ?auto_215693 ) ) ( not ( = ?auto_215690 ?auto_215693 ) ) ( ON ?auto_215690 ?auto_215692 ) ( ON-TABLE ?auto_215694 ) ( not ( = ?auto_215694 ?auto_215691 ) ) ( not ( = ?auto_215694 ?auto_215693 ) ) ( not ( = ?auto_215691 ?auto_215693 ) ) ( not ( = ?auto_215687 ?auto_215691 ) ) ( not ( = ?auto_215687 ?auto_215694 ) ) ( not ( = ?auto_215688 ?auto_215691 ) ) ( not ( = ?auto_215688 ?auto_215694 ) ) ( not ( = ?auto_215689 ?auto_215691 ) ) ( not ( = ?auto_215689 ?auto_215694 ) ) ( not ( = ?auto_215692 ?auto_215691 ) ) ( not ( = ?auto_215692 ?auto_215694 ) ) ( not ( = ?auto_215690 ?auto_215691 ) ) ( not ( = ?auto_215690 ?auto_215694 ) ) ( ON ?auto_215693 ?auto_215690 ) ( CLEAR ?auto_215693 ) ( HOLDING ?auto_215691 ) ( CLEAR ?auto_215694 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215694 ?auto_215691 )
      ( MAKE-3PILE ?auto_215687 ?auto_215688 ?auto_215689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215695 - BLOCK
      ?auto_215696 - BLOCK
      ?auto_215697 - BLOCK
    )
    :vars
    (
      ?auto_215700 - BLOCK
      ?auto_215699 - BLOCK
      ?auto_215698 - BLOCK
      ?auto_215701 - BLOCK
      ?auto_215702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215700 ?auto_215697 ) ( ON-TABLE ?auto_215695 ) ( ON ?auto_215696 ?auto_215695 ) ( ON ?auto_215697 ?auto_215696 ) ( not ( = ?auto_215695 ?auto_215696 ) ) ( not ( = ?auto_215695 ?auto_215697 ) ) ( not ( = ?auto_215695 ?auto_215700 ) ) ( not ( = ?auto_215696 ?auto_215697 ) ) ( not ( = ?auto_215696 ?auto_215700 ) ) ( not ( = ?auto_215697 ?auto_215700 ) ) ( not ( = ?auto_215695 ?auto_215699 ) ) ( not ( = ?auto_215695 ?auto_215698 ) ) ( not ( = ?auto_215696 ?auto_215699 ) ) ( not ( = ?auto_215696 ?auto_215698 ) ) ( not ( = ?auto_215697 ?auto_215699 ) ) ( not ( = ?auto_215697 ?auto_215698 ) ) ( not ( = ?auto_215700 ?auto_215699 ) ) ( not ( = ?auto_215700 ?auto_215698 ) ) ( not ( = ?auto_215699 ?auto_215698 ) ) ( ON ?auto_215699 ?auto_215700 ) ( ON-TABLE ?auto_215701 ) ( not ( = ?auto_215701 ?auto_215702 ) ) ( not ( = ?auto_215701 ?auto_215698 ) ) ( not ( = ?auto_215702 ?auto_215698 ) ) ( not ( = ?auto_215695 ?auto_215702 ) ) ( not ( = ?auto_215695 ?auto_215701 ) ) ( not ( = ?auto_215696 ?auto_215702 ) ) ( not ( = ?auto_215696 ?auto_215701 ) ) ( not ( = ?auto_215697 ?auto_215702 ) ) ( not ( = ?auto_215697 ?auto_215701 ) ) ( not ( = ?auto_215700 ?auto_215702 ) ) ( not ( = ?auto_215700 ?auto_215701 ) ) ( not ( = ?auto_215699 ?auto_215702 ) ) ( not ( = ?auto_215699 ?auto_215701 ) ) ( ON ?auto_215698 ?auto_215699 ) ( CLEAR ?auto_215701 ) ( ON ?auto_215702 ?auto_215698 ) ( CLEAR ?auto_215702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215695 ?auto_215696 ?auto_215697 ?auto_215700 ?auto_215699 ?auto_215698 )
      ( MAKE-3PILE ?auto_215695 ?auto_215696 ?auto_215697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215703 - BLOCK
      ?auto_215704 - BLOCK
      ?auto_215705 - BLOCK
    )
    :vars
    (
      ?auto_215710 - BLOCK
      ?auto_215709 - BLOCK
      ?auto_215706 - BLOCK
      ?auto_215708 - BLOCK
      ?auto_215707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215710 ?auto_215705 ) ( ON-TABLE ?auto_215703 ) ( ON ?auto_215704 ?auto_215703 ) ( ON ?auto_215705 ?auto_215704 ) ( not ( = ?auto_215703 ?auto_215704 ) ) ( not ( = ?auto_215703 ?auto_215705 ) ) ( not ( = ?auto_215703 ?auto_215710 ) ) ( not ( = ?auto_215704 ?auto_215705 ) ) ( not ( = ?auto_215704 ?auto_215710 ) ) ( not ( = ?auto_215705 ?auto_215710 ) ) ( not ( = ?auto_215703 ?auto_215709 ) ) ( not ( = ?auto_215703 ?auto_215706 ) ) ( not ( = ?auto_215704 ?auto_215709 ) ) ( not ( = ?auto_215704 ?auto_215706 ) ) ( not ( = ?auto_215705 ?auto_215709 ) ) ( not ( = ?auto_215705 ?auto_215706 ) ) ( not ( = ?auto_215710 ?auto_215709 ) ) ( not ( = ?auto_215710 ?auto_215706 ) ) ( not ( = ?auto_215709 ?auto_215706 ) ) ( ON ?auto_215709 ?auto_215710 ) ( not ( = ?auto_215708 ?auto_215707 ) ) ( not ( = ?auto_215708 ?auto_215706 ) ) ( not ( = ?auto_215707 ?auto_215706 ) ) ( not ( = ?auto_215703 ?auto_215707 ) ) ( not ( = ?auto_215703 ?auto_215708 ) ) ( not ( = ?auto_215704 ?auto_215707 ) ) ( not ( = ?auto_215704 ?auto_215708 ) ) ( not ( = ?auto_215705 ?auto_215707 ) ) ( not ( = ?auto_215705 ?auto_215708 ) ) ( not ( = ?auto_215710 ?auto_215707 ) ) ( not ( = ?auto_215710 ?auto_215708 ) ) ( not ( = ?auto_215709 ?auto_215707 ) ) ( not ( = ?auto_215709 ?auto_215708 ) ) ( ON ?auto_215706 ?auto_215709 ) ( ON ?auto_215707 ?auto_215706 ) ( CLEAR ?auto_215707 ) ( HOLDING ?auto_215708 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215708 )
      ( MAKE-3PILE ?auto_215703 ?auto_215704 ?auto_215705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215711 - BLOCK
      ?auto_215712 - BLOCK
      ?auto_215713 - BLOCK
    )
    :vars
    (
      ?auto_215717 - BLOCK
      ?auto_215714 - BLOCK
      ?auto_215715 - BLOCK
      ?auto_215716 - BLOCK
      ?auto_215718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215717 ?auto_215713 ) ( ON-TABLE ?auto_215711 ) ( ON ?auto_215712 ?auto_215711 ) ( ON ?auto_215713 ?auto_215712 ) ( not ( = ?auto_215711 ?auto_215712 ) ) ( not ( = ?auto_215711 ?auto_215713 ) ) ( not ( = ?auto_215711 ?auto_215717 ) ) ( not ( = ?auto_215712 ?auto_215713 ) ) ( not ( = ?auto_215712 ?auto_215717 ) ) ( not ( = ?auto_215713 ?auto_215717 ) ) ( not ( = ?auto_215711 ?auto_215714 ) ) ( not ( = ?auto_215711 ?auto_215715 ) ) ( not ( = ?auto_215712 ?auto_215714 ) ) ( not ( = ?auto_215712 ?auto_215715 ) ) ( not ( = ?auto_215713 ?auto_215714 ) ) ( not ( = ?auto_215713 ?auto_215715 ) ) ( not ( = ?auto_215717 ?auto_215714 ) ) ( not ( = ?auto_215717 ?auto_215715 ) ) ( not ( = ?auto_215714 ?auto_215715 ) ) ( ON ?auto_215714 ?auto_215717 ) ( not ( = ?auto_215716 ?auto_215718 ) ) ( not ( = ?auto_215716 ?auto_215715 ) ) ( not ( = ?auto_215718 ?auto_215715 ) ) ( not ( = ?auto_215711 ?auto_215718 ) ) ( not ( = ?auto_215711 ?auto_215716 ) ) ( not ( = ?auto_215712 ?auto_215718 ) ) ( not ( = ?auto_215712 ?auto_215716 ) ) ( not ( = ?auto_215713 ?auto_215718 ) ) ( not ( = ?auto_215713 ?auto_215716 ) ) ( not ( = ?auto_215717 ?auto_215718 ) ) ( not ( = ?auto_215717 ?auto_215716 ) ) ( not ( = ?auto_215714 ?auto_215718 ) ) ( not ( = ?auto_215714 ?auto_215716 ) ) ( ON ?auto_215715 ?auto_215714 ) ( ON ?auto_215718 ?auto_215715 ) ( ON ?auto_215716 ?auto_215718 ) ( CLEAR ?auto_215716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215711 ?auto_215712 ?auto_215713 ?auto_215717 ?auto_215714 ?auto_215715 ?auto_215718 )
      ( MAKE-3PILE ?auto_215711 ?auto_215712 ?auto_215713 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215719 - BLOCK
      ?auto_215720 - BLOCK
      ?auto_215721 - BLOCK
    )
    :vars
    (
      ?auto_215722 - BLOCK
      ?auto_215726 - BLOCK
      ?auto_215723 - BLOCK
      ?auto_215725 - BLOCK
      ?auto_215724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215722 ?auto_215721 ) ( ON-TABLE ?auto_215719 ) ( ON ?auto_215720 ?auto_215719 ) ( ON ?auto_215721 ?auto_215720 ) ( not ( = ?auto_215719 ?auto_215720 ) ) ( not ( = ?auto_215719 ?auto_215721 ) ) ( not ( = ?auto_215719 ?auto_215722 ) ) ( not ( = ?auto_215720 ?auto_215721 ) ) ( not ( = ?auto_215720 ?auto_215722 ) ) ( not ( = ?auto_215721 ?auto_215722 ) ) ( not ( = ?auto_215719 ?auto_215726 ) ) ( not ( = ?auto_215719 ?auto_215723 ) ) ( not ( = ?auto_215720 ?auto_215726 ) ) ( not ( = ?auto_215720 ?auto_215723 ) ) ( not ( = ?auto_215721 ?auto_215726 ) ) ( not ( = ?auto_215721 ?auto_215723 ) ) ( not ( = ?auto_215722 ?auto_215726 ) ) ( not ( = ?auto_215722 ?auto_215723 ) ) ( not ( = ?auto_215726 ?auto_215723 ) ) ( ON ?auto_215726 ?auto_215722 ) ( not ( = ?auto_215725 ?auto_215724 ) ) ( not ( = ?auto_215725 ?auto_215723 ) ) ( not ( = ?auto_215724 ?auto_215723 ) ) ( not ( = ?auto_215719 ?auto_215724 ) ) ( not ( = ?auto_215719 ?auto_215725 ) ) ( not ( = ?auto_215720 ?auto_215724 ) ) ( not ( = ?auto_215720 ?auto_215725 ) ) ( not ( = ?auto_215721 ?auto_215724 ) ) ( not ( = ?auto_215721 ?auto_215725 ) ) ( not ( = ?auto_215722 ?auto_215724 ) ) ( not ( = ?auto_215722 ?auto_215725 ) ) ( not ( = ?auto_215726 ?auto_215724 ) ) ( not ( = ?auto_215726 ?auto_215725 ) ) ( ON ?auto_215723 ?auto_215726 ) ( ON ?auto_215724 ?auto_215723 ) ( HOLDING ?auto_215725 ) ( CLEAR ?auto_215724 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_215719 ?auto_215720 ?auto_215721 ?auto_215722 ?auto_215726 ?auto_215723 ?auto_215724 ?auto_215725 )
      ( MAKE-3PILE ?auto_215719 ?auto_215720 ?auto_215721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215727 - BLOCK
      ?auto_215728 - BLOCK
      ?auto_215729 - BLOCK
    )
    :vars
    (
      ?auto_215731 - BLOCK
      ?auto_215733 - BLOCK
      ?auto_215734 - BLOCK
      ?auto_215732 - BLOCK
      ?auto_215730 - BLOCK
      ?auto_215735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215731 ?auto_215729 ) ( ON-TABLE ?auto_215727 ) ( ON ?auto_215728 ?auto_215727 ) ( ON ?auto_215729 ?auto_215728 ) ( not ( = ?auto_215727 ?auto_215728 ) ) ( not ( = ?auto_215727 ?auto_215729 ) ) ( not ( = ?auto_215727 ?auto_215731 ) ) ( not ( = ?auto_215728 ?auto_215729 ) ) ( not ( = ?auto_215728 ?auto_215731 ) ) ( not ( = ?auto_215729 ?auto_215731 ) ) ( not ( = ?auto_215727 ?auto_215733 ) ) ( not ( = ?auto_215727 ?auto_215734 ) ) ( not ( = ?auto_215728 ?auto_215733 ) ) ( not ( = ?auto_215728 ?auto_215734 ) ) ( not ( = ?auto_215729 ?auto_215733 ) ) ( not ( = ?auto_215729 ?auto_215734 ) ) ( not ( = ?auto_215731 ?auto_215733 ) ) ( not ( = ?auto_215731 ?auto_215734 ) ) ( not ( = ?auto_215733 ?auto_215734 ) ) ( ON ?auto_215733 ?auto_215731 ) ( not ( = ?auto_215732 ?auto_215730 ) ) ( not ( = ?auto_215732 ?auto_215734 ) ) ( not ( = ?auto_215730 ?auto_215734 ) ) ( not ( = ?auto_215727 ?auto_215730 ) ) ( not ( = ?auto_215727 ?auto_215732 ) ) ( not ( = ?auto_215728 ?auto_215730 ) ) ( not ( = ?auto_215728 ?auto_215732 ) ) ( not ( = ?auto_215729 ?auto_215730 ) ) ( not ( = ?auto_215729 ?auto_215732 ) ) ( not ( = ?auto_215731 ?auto_215730 ) ) ( not ( = ?auto_215731 ?auto_215732 ) ) ( not ( = ?auto_215733 ?auto_215730 ) ) ( not ( = ?auto_215733 ?auto_215732 ) ) ( ON ?auto_215734 ?auto_215733 ) ( ON ?auto_215730 ?auto_215734 ) ( CLEAR ?auto_215730 ) ( ON ?auto_215732 ?auto_215735 ) ( CLEAR ?auto_215732 ) ( HAND-EMPTY ) ( not ( = ?auto_215727 ?auto_215735 ) ) ( not ( = ?auto_215728 ?auto_215735 ) ) ( not ( = ?auto_215729 ?auto_215735 ) ) ( not ( = ?auto_215731 ?auto_215735 ) ) ( not ( = ?auto_215733 ?auto_215735 ) ) ( not ( = ?auto_215734 ?auto_215735 ) ) ( not ( = ?auto_215732 ?auto_215735 ) ) ( not ( = ?auto_215730 ?auto_215735 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215732 ?auto_215735 )
      ( MAKE-3PILE ?auto_215727 ?auto_215728 ?auto_215729 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215736 - BLOCK
      ?auto_215737 - BLOCK
      ?auto_215738 - BLOCK
    )
    :vars
    (
      ?auto_215742 - BLOCK
      ?auto_215740 - BLOCK
      ?auto_215743 - BLOCK
      ?auto_215744 - BLOCK
      ?auto_215741 - BLOCK
      ?auto_215739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215742 ?auto_215738 ) ( ON-TABLE ?auto_215736 ) ( ON ?auto_215737 ?auto_215736 ) ( ON ?auto_215738 ?auto_215737 ) ( not ( = ?auto_215736 ?auto_215737 ) ) ( not ( = ?auto_215736 ?auto_215738 ) ) ( not ( = ?auto_215736 ?auto_215742 ) ) ( not ( = ?auto_215737 ?auto_215738 ) ) ( not ( = ?auto_215737 ?auto_215742 ) ) ( not ( = ?auto_215738 ?auto_215742 ) ) ( not ( = ?auto_215736 ?auto_215740 ) ) ( not ( = ?auto_215736 ?auto_215743 ) ) ( not ( = ?auto_215737 ?auto_215740 ) ) ( not ( = ?auto_215737 ?auto_215743 ) ) ( not ( = ?auto_215738 ?auto_215740 ) ) ( not ( = ?auto_215738 ?auto_215743 ) ) ( not ( = ?auto_215742 ?auto_215740 ) ) ( not ( = ?auto_215742 ?auto_215743 ) ) ( not ( = ?auto_215740 ?auto_215743 ) ) ( ON ?auto_215740 ?auto_215742 ) ( not ( = ?auto_215744 ?auto_215741 ) ) ( not ( = ?auto_215744 ?auto_215743 ) ) ( not ( = ?auto_215741 ?auto_215743 ) ) ( not ( = ?auto_215736 ?auto_215741 ) ) ( not ( = ?auto_215736 ?auto_215744 ) ) ( not ( = ?auto_215737 ?auto_215741 ) ) ( not ( = ?auto_215737 ?auto_215744 ) ) ( not ( = ?auto_215738 ?auto_215741 ) ) ( not ( = ?auto_215738 ?auto_215744 ) ) ( not ( = ?auto_215742 ?auto_215741 ) ) ( not ( = ?auto_215742 ?auto_215744 ) ) ( not ( = ?auto_215740 ?auto_215741 ) ) ( not ( = ?auto_215740 ?auto_215744 ) ) ( ON ?auto_215743 ?auto_215740 ) ( ON ?auto_215744 ?auto_215739 ) ( CLEAR ?auto_215744 ) ( not ( = ?auto_215736 ?auto_215739 ) ) ( not ( = ?auto_215737 ?auto_215739 ) ) ( not ( = ?auto_215738 ?auto_215739 ) ) ( not ( = ?auto_215742 ?auto_215739 ) ) ( not ( = ?auto_215740 ?auto_215739 ) ) ( not ( = ?auto_215743 ?auto_215739 ) ) ( not ( = ?auto_215744 ?auto_215739 ) ) ( not ( = ?auto_215741 ?auto_215739 ) ) ( HOLDING ?auto_215741 ) ( CLEAR ?auto_215743 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215736 ?auto_215737 ?auto_215738 ?auto_215742 ?auto_215740 ?auto_215743 ?auto_215741 )
      ( MAKE-3PILE ?auto_215736 ?auto_215737 ?auto_215738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215745 - BLOCK
      ?auto_215746 - BLOCK
      ?auto_215747 - BLOCK
    )
    :vars
    (
      ?auto_215748 - BLOCK
      ?auto_215753 - BLOCK
      ?auto_215752 - BLOCK
      ?auto_215749 - BLOCK
      ?auto_215750 - BLOCK
      ?auto_215751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215748 ?auto_215747 ) ( ON-TABLE ?auto_215745 ) ( ON ?auto_215746 ?auto_215745 ) ( ON ?auto_215747 ?auto_215746 ) ( not ( = ?auto_215745 ?auto_215746 ) ) ( not ( = ?auto_215745 ?auto_215747 ) ) ( not ( = ?auto_215745 ?auto_215748 ) ) ( not ( = ?auto_215746 ?auto_215747 ) ) ( not ( = ?auto_215746 ?auto_215748 ) ) ( not ( = ?auto_215747 ?auto_215748 ) ) ( not ( = ?auto_215745 ?auto_215753 ) ) ( not ( = ?auto_215745 ?auto_215752 ) ) ( not ( = ?auto_215746 ?auto_215753 ) ) ( not ( = ?auto_215746 ?auto_215752 ) ) ( not ( = ?auto_215747 ?auto_215753 ) ) ( not ( = ?auto_215747 ?auto_215752 ) ) ( not ( = ?auto_215748 ?auto_215753 ) ) ( not ( = ?auto_215748 ?auto_215752 ) ) ( not ( = ?auto_215753 ?auto_215752 ) ) ( ON ?auto_215753 ?auto_215748 ) ( not ( = ?auto_215749 ?auto_215750 ) ) ( not ( = ?auto_215749 ?auto_215752 ) ) ( not ( = ?auto_215750 ?auto_215752 ) ) ( not ( = ?auto_215745 ?auto_215750 ) ) ( not ( = ?auto_215745 ?auto_215749 ) ) ( not ( = ?auto_215746 ?auto_215750 ) ) ( not ( = ?auto_215746 ?auto_215749 ) ) ( not ( = ?auto_215747 ?auto_215750 ) ) ( not ( = ?auto_215747 ?auto_215749 ) ) ( not ( = ?auto_215748 ?auto_215750 ) ) ( not ( = ?auto_215748 ?auto_215749 ) ) ( not ( = ?auto_215753 ?auto_215750 ) ) ( not ( = ?auto_215753 ?auto_215749 ) ) ( ON ?auto_215752 ?auto_215753 ) ( ON ?auto_215749 ?auto_215751 ) ( not ( = ?auto_215745 ?auto_215751 ) ) ( not ( = ?auto_215746 ?auto_215751 ) ) ( not ( = ?auto_215747 ?auto_215751 ) ) ( not ( = ?auto_215748 ?auto_215751 ) ) ( not ( = ?auto_215753 ?auto_215751 ) ) ( not ( = ?auto_215752 ?auto_215751 ) ) ( not ( = ?auto_215749 ?auto_215751 ) ) ( not ( = ?auto_215750 ?auto_215751 ) ) ( CLEAR ?auto_215752 ) ( ON ?auto_215750 ?auto_215749 ) ( CLEAR ?auto_215750 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215751 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215751 ?auto_215749 )
      ( MAKE-3PILE ?auto_215745 ?auto_215746 ?auto_215747 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215754 - BLOCK
      ?auto_215755 - BLOCK
      ?auto_215756 - BLOCK
    )
    :vars
    (
      ?auto_215762 - BLOCK
      ?auto_215757 - BLOCK
      ?auto_215761 - BLOCK
      ?auto_215760 - BLOCK
      ?auto_215758 - BLOCK
      ?auto_215759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215762 ?auto_215756 ) ( ON-TABLE ?auto_215754 ) ( ON ?auto_215755 ?auto_215754 ) ( ON ?auto_215756 ?auto_215755 ) ( not ( = ?auto_215754 ?auto_215755 ) ) ( not ( = ?auto_215754 ?auto_215756 ) ) ( not ( = ?auto_215754 ?auto_215762 ) ) ( not ( = ?auto_215755 ?auto_215756 ) ) ( not ( = ?auto_215755 ?auto_215762 ) ) ( not ( = ?auto_215756 ?auto_215762 ) ) ( not ( = ?auto_215754 ?auto_215757 ) ) ( not ( = ?auto_215754 ?auto_215761 ) ) ( not ( = ?auto_215755 ?auto_215757 ) ) ( not ( = ?auto_215755 ?auto_215761 ) ) ( not ( = ?auto_215756 ?auto_215757 ) ) ( not ( = ?auto_215756 ?auto_215761 ) ) ( not ( = ?auto_215762 ?auto_215757 ) ) ( not ( = ?auto_215762 ?auto_215761 ) ) ( not ( = ?auto_215757 ?auto_215761 ) ) ( ON ?auto_215757 ?auto_215762 ) ( not ( = ?auto_215760 ?auto_215758 ) ) ( not ( = ?auto_215760 ?auto_215761 ) ) ( not ( = ?auto_215758 ?auto_215761 ) ) ( not ( = ?auto_215754 ?auto_215758 ) ) ( not ( = ?auto_215754 ?auto_215760 ) ) ( not ( = ?auto_215755 ?auto_215758 ) ) ( not ( = ?auto_215755 ?auto_215760 ) ) ( not ( = ?auto_215756 ?auto_215758 ) ) ( not ( = ?auto_215756 ?auto_215760 ) ) ( not ( = ?auto_215762 ?auto_215758 ) ) ( not ( = ?auto_215762 ?auto_215760 ) ) ( not ( = ?auto_215757 ?auto_215758 ) ) ( not ( = ?auto_215757 ?auto_215760 ) ) ( ON ?auto_215760 ?auto_215759 ) ( not ( = ?auto_215754 ?auto_215759 ) ) ( not ( = ?auto_215755 ?auto_215759 ) ) ( not ( = ?auto_215756 ?auto_215759 ) ) ( not ( = ?auto_215762 ?auto_215759 ) ) ( not ( = ?auto_215757 ?auto_215759 ) ) ( not ( = ?auto_215761 ?auto_215759 ) ) ( not ( = ?auto_215760 ?auto_215759 ) ) ( not ( = ?auto_215758 ?auto_215759 ) ) ( ON ?auto_215758 ?auto_215760 ) ( CLEAR ?auto_215758 ) ( ON-TABLE ?auto_215759 ) ( HOLDING ?auto_215761 ) ( CLEAR ?auto_215757 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215754 ?auto_215755 ?auto_215756 ?auto_215762 ?auto_215757 ?auto_215761 )
      ( MAKE-3PILE ?auto_215754 ?auto_215755 ?auto_215756 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215763 - BLOCK
      ?auto_215764 - BLOCK
      ?auto_215765 - BLOCK
    )
    :vars
    (
      ?auto_215767 - BLOCK
      ?auto_215768 - BLOCK
      ?auto_215766 - BLOCK
      ?auto_215769 - BLOCK
      ?auto_215770 - BLOCK
      ?auto_215771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215767 ?auto_215765 ) ( ON-TABLE ?auto_215763 ) ( ON ?auto_215764 ?auto_215763 ) ( ON ?auto_215765 ?auto_215764 ) ( not ( = ?auto_215763 ?auto_215764 ) ) ( not ( = ?auto_215763 ?auto_215765 ) ) ( not ( = ?auto_215763 ?auto_215767 ) ) ( not ( = ?auto_215764 ?auto_215765 ) ) ( not ( = ?auto_215764 ?auto_215767 ) ) ( not ( = ?auto_215765 ?auto_215767 ) ) ( not ( = ?auto_215763 ?auto_215768 ) ) ( not ( = ?auto_215763 ?auto_215766 ) ) ( not ( = ?auto_215764 ?auto_215768 ) ) ( not ( = ?auto_215764 ?auto_215766 ) ) ( not ( = ?auto_215765 ?auto_215768 ) ) ( not ( = ?auto_215765 ?auto_215766 ) ) ( not ( = ?auto_215767 ?auto_215768 ) ) ( not ( = ?auto_215767 ?auto_215766 ) ) ( not ( = ?auto_215768 ?auto_215766 ) ) ( ON ?auto_215768 ?auto_215767 ) ( not ( = ?auto_215769 ?auto_215770 ) ) ( not ( = ?auto_215769 ?auto_215766 ) ) ( not ( = ?auto_215770 ?auto_215766 ) ) ( not ( = ?auto_215763 ?auto_215770 ) ) ( not ( = ?auto_215763 ?auto_215769 ) ) ( not ( = ?auto_215764 ?auto_215770 ) ) ( not ( = ?auto_215764 ?auto_215769 ) ) ( not ( = ?auto_215765 ?auto_215770 ) ) ( not ( = ?auto_215765 ?auto_215769 ) ) ( not ( = ?auto_215767 ?auto_215770 ) ) ( not ( = ?auto_215767 ?auto_215769 ) ) ( not ( = ?auto_215768 ?auto_215770 ) ) ( not ( = ?auto_215768 ?auto_215769 ) ) ( ON ?auto_215769 ?auto_215771 ) ( not ( = ?auto_215763 ?auto_215771 ) ) ( not ( = ?auto_215764 ?auto_215771 ) ) ( not ( = ?auto_215765 ?auto_215771 ) ) ( not ( = ?auto_215767 ?auto_215771 ) ) ( not ( = ?auto_215768 ?auto_215771 ) ) ( not ( = ?auto_215766 ?auto_215771 ) ) ( not ( = ?auto_215769 ?auto_215771 ) ) ( not ( = ?auto_215770 ?auto_215771 ) ) ( ON ?auto_215770 ?auto_215769 ) ( ON-TABLE ?auto_215771 ) ( CLEAR ?auto_215768 ) ( ON ?auto_215766 ?auto_215770 ) ( CLEAR ?auto_215766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215771 ?auto_215769 ?auto_215770 )
      ( MAKE-3PILE ?auto_215763 ?auto_215764 ?auto_215765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215772 - BLOCK
      ?auto_215773 - BLOCK
      ?auto_215774 - BLOCK
    )
    :vars
    (
      ?auto_215779 - BLOCK
      ?auto_215780 - BLOCK
      ?auto_215778 - BLOCK
      ?auto_215776 - BLOCK
      ?auto_215777 - BLOCK
      ?auto_215775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215779 ?auto_215774 ) ( ON-TABLE ?auto_215772 ) ( ON ?auto_215773 ?auto_215772 ) ( ON ?auto_215774 ?auto_215773 ) ( not ( = ?auto_215772 ?auto_215773 ) ) ( not ( = ?auto_215772 ?auto_215774 ) ) ( not ( = ?auto_215772 ?auto_215779 ) ) ( not ( = ?auto_215773 ?auto_215774 ) ) ( not ( = ?auto_215773 ?auto_215779 ) ) ( not ( = ?auto_215774 ?auto_215779 ) ) ( not ( = ?auto_215772 ?auto_215780 ) ) ( not ( = ?auto_215772 ?auto_215778 ) ) ( not ( = ?auto_215773 ?auto_215780 ) ) ( not ( = ?auto_215773 ?auto_215778 ) ) ( not ( = ?auto_215774 ?auto_215780 ) ) ( not ( = ?auto_215774 ?auto_215778 ) ) ( not ( = ?auto_215779 ?auto_215780 ) ) ( not ( = ?auto_215779 ?auto_215778 ) ) ( not ( = ?auto_215780 ?auto_215778 ) ) ( not ( = ?auto_215776 ?auto_215777 ) ) ( not ( = ?auto_215776 ?auto_215778 ) ) ( not ( = ?auto_215777 ?auto_215778 ) ) ( not ( = ?auto_215772 ?auto_215777 ) ) ( not ( = ?auto_215772 ?auto_215776 ) ) ( not ( = ?auto_215773 ?auto_215777 ) ) ( not ( = ?auto_215773 ?auto_215776 ) ) ( not ( = ?auto_215774 ?auto_215777 ) ) ( not ( = ?auto_215774 ?auto_215776 ) ) ( not ( = ?auto_215779 ?auto_215777 ) ) ( not ( = ?auto_215779 ?auto_215776 ) ) ( not ( = ?auto_215780 ?auto_215777 ) ) ( not ( = ?auto_215780 ?auto_215776 ) ) ( ON ?auto_215776 ?auto_215775 ) ( not ( = ?auto_215772 ?auto_215775 ) ) ( not ( = ?auto_215773 ?auto_215775 ) ) ( not ( = ?auto_215774 ?auto_215775 ) ) ( not ( = ?auto_215779 ?auto_215775 ) ) ( not ( = ?auto_215780 ?auto_215775 ) ) ( not ( = ?auto_215778 ?auto_215775 ) ) ( not ( = ?auto_215776 ?auto_215775 ) ) ( not ( = ?auto_215777 ?auto_215775 ) ) ( ON ?auto_215777 ?auto_215776 ) ( ON-TABLE ?auto_215775 ) ( ON ?auto_215778 ?auto_215777 ) ( CLEAR ?auto_215778 ) ( HOLDING ?auto_215780 ) ( CLEAR ?auto_215779 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215772 ?auto_215773 ?auto_215774 ?auto_215779 ?auto_215780 )
      ( MAKE-3PILE ?auto_215772 ?auto_215773 ?auto_215774 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215781 - BLOCK
      ?auto_215782 - BLOCK
      ?auto_215783 - BLOCK
    )
    :vars
    (
      ?auto_215785 - BLOCK
      ?auto_215784 - BLOCK
      ?auto_215787 - BLOCK
      ?auto_215788 - BLOCK
      ?auto_215789 - BLOCK
      ?auto_215786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215785 ?auto_215783 ) ( ON-TABLE ?auto_215781 ) ( ON ?auto_215782 ?auto_215781 ) ( ON ?auto_215783 ?auto_215782 ) ( not ( = ?auto_215781 ?auto_215782 ) ) ( not ( = ?auto_215781 ?auto_215783 ) ) ( not ( = ?auto_215781 ?auto_215785 ) ) ( not ( = ?auto_215782 ?auto_215783 ) ) ( not ( = ?auto_215782 ?auto_215785 ) ) ( not ( = ?auto_215783 ?auto_215785 ) ) ( not ( = ?auto_215781 ?auto_215784 ) ) ( not ( = ?auto_215781 ?auto_215787 ) ) ( not ( = ?auto_215782 ?auto_215784 ) ) ( not ( = ?auto_215782 ?auto_215787 ) ) ( not ( = ?auto_215783 ?auto_215784 ) ) ( not ( = ?auto_215783 ?auto_215787 ) ) ( not ( = ?auto_215785 ?auto_215784 ) ) ( not ( = ?auto_215785 ?auto_215787 ) ) ( not ( = ?auto_215784 ?auto_215787 ) ) ( not ( = ?auto_215788 ?auto_215789 ) ) ( not ( = ?auto_215788 ?auto_215787 ) ) ( not ( = ?auto_215789 ?auto_215787 ) ) ( not ( = ?auto_215781 ?auto_215789 ) ) ( not ( = ?auto_215781 ?auto_215788 ) ) ( not ( = ?auto_215782 ?auto_215789 ) ) ( not ( = ?auto_215782 ?auto_215788 ) ) ( not ( = ?auto_215783 ?auto_215789 ) ) ( not ( = ?auto_215783 ?auto_215788 ) ) ( not ( = ?auto_215785 ?auto_215789 ) ) ( not ( = ?auto_215785 ?auto_215788 ) ) ( not ( = ?auto_215784 ?auto_215789 ) ) ( not ( = ?auto_215784 ?auto_215788 ) ) ( ON ?auto_215788 ?auto_215786 ) ( not ( = ?auto_215781 ?auto_215786 ) ) ( not ( = ?auto_215782 ?auto_215786 ) ) ( not ( = ?auto_215783 ?auto_215786 ) ) ( not ( = ?auto_215785 ?auto_215786 ) ) ( not ( = ?auto_215784 ?auto_215786 ) ) ( not ( = ?auto_215787 ?auto_215786 ) ) ( not ( = ?auto_215788 ?auto_215786 ) ) ( not ( = ?auto_215789 ?auto_215786 ) ) ( ON ?auto_215789 ?auto_215788 ) ( ON-TABLE ?auto_215786 ) ( ON ?auto_215787 ?auto_215789 ) ( CLEAR ?auto_215785 ) ( ON ?auto_215784 ?auto_215787 ) ( CLEAR ?auto_215784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215786 ?auto_215788 ?auto_215789 ?auto_215787 )
      ( MAKE-3PILE ?auto_215781 ?auto_215782 ?auto_215783 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215808 - BLOCK
      ?auto_215809 - BLOCK
      ?auto_215810 - BLOCK
    )
    :vars
    (
      ?auto_215811 - BLOCK
      ?auto_215812 - BLOCK
      ?auto_215816 - BLOCK
      ?auto_215815 - BLOCK
      ?auto_215813 - BLOCK
      ?auto_215814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215808 ) ( ON ?auto_215809 ?auto_215808 ) ( not ( = ?auto_215808 ?auto_215809 ) ) ( not ( = ?auto_215808 ?auto_215810 ) ) ( not ( = ?auto_215808 ?auto_215811 ) ) ( not ( = ?auto_215809 ?auto_215810 ) ) ( not ( = ?auto_215809 ?auto_215811 ) ) ( not ( = ?auto_215810 ?auto_215811 ) ) ( not ( = ?auto_215808 ?auto_215812 ) ) ( not ( = ?auto_215808 ?auto_215816 ) ) ( not ( = ?auto_215809 ?auto_215812 ) ) ( not ( = ?auto_215809 ?auto_215816 ) ) ( not ( = ?auto_215810 ?auto_215812 ) ) ( not ( = ?auto_215810 ?auto_215816 ) ) ( not ( = ?auto_215811 ?auto_215812 ) ) ( not ( = ?auto_215811 ?auto_215816 ) ) ( not ( = ?auto_215812 ?auto_215816 ) ) ( not ( = ?auto_215815 ?auto_215813 ) ) ( not ( = ?auto_215815 ?auto_215816 ) ) ( not ( = ?auto_215813 ?auto_215816 ) ) ( not ( = ?auto_215808 ?auto_215813 ) ) ( not ( = ?auto_215808 ?auto_215815 ) ) ( not ( = ?auto_215809 ?auto_215813 ) ) ( not ( = ?auto_215809 ?auto_215815 ) ) ( not ( = ?auto_215810 ?auto_215813 ) ) ( not ( = ?auto_215810 ?auto_215815 ) ) ( not ( = ?auto_215811 ?auto_215813 ) ) ( not ( = ?auto_215811 ?auto_215815 ) ) ( not ( = ?auto_215812 ?auto_215813 ) ) ( not ( = ?auto_215812 ?auto_215815 ) ) ( ON ?auto_215815 ?auto_215814 ) ( not ( = ?auto_215808 ?auto_215814 ) ) ( not ( = ?auto_215809 ?auto_215814 ) ) ( not ( = ?auto_215810 ?auto_215814 ) ) ( not ( = ?auto_215811 ?auto_215814 ) ) ( not ( = ?auto_215812 ?auto_215814 ) ) ( not ( = ?auto_215816 ?auto_215814 ) ) ( not ( = ?auto_215815 ?auto_215814 ) ) ( not ( = ?auto_215813 ?auto_215814 ) ) ( ON ?auto_215813 ?auto_215815 ) ( ON-TABLE ?auto_215814 ) ( ON ?auto_215816 ?auto_215813 ) ( ON ?auto_215812 ?auto_215816 ) ( ON ?auto_215811 ?auto_215812 ) ( CLEAR ?auto_215811 ) ( HOLDING ?auto_215810 ) ( CLEAR ?auto_215809 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215808 ?auto_215809 ?auto_215810 ?auto_215811 )
      ( MAKE-3PILE ?auto_215808 ?auto_215809 ?auto_215810 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215817 - BLOCK
      ?auto_215818 - BLOCK
      ?auto_215819 - BLOCK
    )
    :vars
    (
      ?auto_215820 - BLOCK
      ?auto_215823 - BLOCK
      ?auto_215824 - BLOCK
      ?auto_215825 - BLOCK
      ?auto_215822 - BLOCK
      ?auto_215821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215817 ) ( ON ?auto_215818 ?auto_215817 ) ( not ( = ?auto_215817 ?auto_215818 ) ) ( not ( = ?auto_215817 ?auto_215819 ) ) ( not ( = ?auto_215817 ?auto_215820 ) ) ( not ( = ?auto_215818 ?auto_215819 ) ) ( not ( = ?auto_215818 ?auto_215820 ) ) ( not ( = ?auto_215819 ?auto_215820 ) ) ( not ( = ?auto_215817 ?auto_215823 ) ) ( not ( = ?auto_215817 ?auto_215824 ) ) ( not ( = ?auto_215818 ?auto_215823 ) ) ( not ( = ?auto_215818 ?auto_215824 ) ) ( not ( = ?auto_215819 ?auto_215823 ) ) ( not ( = ?auto_215819 ?auto_215824 ) ) ( not ( = ?auto_215820 ?auto_215823 ) ) ( not ( = ?auto_215820 ?auto_215824 ) ) ( not ( = ?auto_215823 ?auto_215824 ) ) ( not ( = ?auto_215825 ?auto_215822 ) ) ( not ( = ?auto_215825 ?auto_215824 ) ) ( not ( = ?auto_215822 ?auto_215824 ) ) ( not ( = ?auto_215817 ?auto_215822 ) ) ( not ( = ?auto_215817 ?auto_215825 ) ) ( not ( = ?auto_215818 ?auto_215822 ) ) ( not ( = ?auto_215818 ?auto_215825 ) ) ( not ( = ?auto_215819 ?auto_215822 ) ) ( not ( = ?auto_215819 ?auto_215825 ) ) ( not ( = ?auto_215820 ?auto_215822 ) ) ( not ( = ?auto_215820 ?auto_215825 ) ) ( not ( = ?auto_215823 ?auto_215822 ) ) ( not ( = ?auto_215823 ?auto_215825 ) ) ( ON ?auto_215825 ?auto_215821 ) ( not ( = ?auto_215817 ?auto_215821 ) ) ( not ( = ?auto_215818 ?auto_215821 ) ) ( not ( = ?auto_215819 ?auto_215821 ) ) ( not ( = ?auto_215820 ?auto_215821 ) ) ( not ( = ?auto_215823 ?auto_215821 ) ) ( not ( = ?auto_215824 ?auto_215821 ) ) ( not ( = ?auto_215825 ?auto_215821 ) ) ( not ( = ?auto_215822 ?auto_215821 ) ) ( ON ?auto_215822 ?auto_215825 ) ( ON-TABLE ?auto_215821 ) ( ON ?auto_215824 ?auto_215822 ) ( ON ?auto_215823 ?auto_215824 ) ( ON ?auto_215820 ?auto_215823 ) ( CLEAR ?auto_215818 ) ( ON ?auto_215819 ?auto_215820 ) ( CLEAR ?auto_215819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215821 ?auto_215825 ?auto_215822 ?auto_215824 ?auto_215823 ?auto_215820 )
      ( MAKE-3PILE ?auto_215817 ?auto_215818 ?auto_215819 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215826 - BLOCK
      ?auto_215827 - BLOCK
      ?auto_215828 - BLOCK
    )
    :vars
    (
      ?auto_215829 - BLOCK
      ?auto_215834 - BLOCK
      ?auto_215831 - BLOCK
      ?auto_215830 - BLOCK
      ?auto_215833 - BLOCK
      ?auto_215832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215826 ) ( not ( = ?auto_215826 ?auto_215827 ) ) ( not ( = ?auto_215826 ?auto_215828 ) ) ( not ( = ?auto_215826 ?auto_215829 ) ) ( not ( = ?auto_215827 ?auto_215828 ) ) ( not ( = ?auto_215827 ?auto_215829 ) ) ( not ( = ?auto_215828 ?auto_215829 ) ) ( not ( = ?auto_215826 ?auto_215834 ) ) ( not ( = ?auto_215826 ?auto_215831 ) ) ( not ( = ?auto_215827 ?auto_215834 ) ) ( not ( = ?auto_215827 ?auto_215831 ) ) ( not ( = ?auto_215828 ?auto_215834 ) ) ( not ( = ?auto_215828 ?auto_215831 ) ) ( not ( = ?auto_215829 ?auto_215834 ) ) ( not ( = ?auto_215829 ?auto_215831 ) ) ( not ( = ?auto_215834 ?auto_215831 ) ) ( not ( = ?auto_215830 ?auto_215833 ) ) ( not ( = ?auto_215830 ?auto_215831 ) ) ( not ( = ?auto_215833 ?auto_215831 ) ) ( not ( = ?auto_215826 ?auto_215833 ) ) ( not ( = ?auto_215826 ?auto_215830 ) ) ( not ( = ?auto_215827 ?auto_215833 ) ) ( not ( = ?auto_215827 ?auto_215830 ) ) ( not ( = ?auto_215828 ?auto_215833 ) ) ( not ( = ?auto_215828 ?auto_215830 ) ) ( not ( = ?auto_215829 ?auto_215833 ) ) ( not ( = ?auto_215829 ?auto_215830 ) ) ( not ( = ?auto_215834 ?auto_215833 ) ) ( not ( = ?auto_215834 ?auto_215830 ) ) ( ON ?auto_215830 ?auto_215832 ) ( not ( = ?auto_215826 ?auto_215832 ) ) ( not ( = ?auto_215827 ?auto_215832 ) ) ( not ( = ?auto_215828 ?auto_215832 ) ) ( not ( = ?auto_215829 ?auto_215832 ) ) ( not ( = ?auto_215834 ?auto_215832 ) ) ( not ( = ?auto_215831 ?auto_215832 ) ) ( not ( = ?auto_215830 ?auto_215832 ) ) ( not ( = ?auto_215833 ?auto_215832 ) ) ( ON ?auto_215833 ?auto_215830 ) ( ON-TABLE ?auto_215832 ) ( ON ?auto_215831 ?auto_215833 ) ( ON ?auto_215834 ?auto_215831 ) ( ON ?auto_215829 ?auto_215834 ) ( ON ?auto_215828 ?auto_215829 ) ( CLEAR ?auto_215828 ) ( HOLDING ?auto_215827 ) ( CLEAR ?auto_215826 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215826 ?auto_215827 )
      ( MAKE-3PILE ?auto_215826 ?auto_215827 ?auto_215828 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215835 - BLOCK
      ?auto_215836 - BLOCK
      ?auto_215837 - BLOCK
    )
    :vars
    (
      ?auto_215841 - BLOCK
      ?auto_215839 - BLOCK
      ?auto_215842 - BLOCK
      ?auto_215840 - BLOCK
      ?auto_215843 - BLOCK
      ?auto_215838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215835 ) ( not ( = ?auto_215835 ?auto_215836 ) ) ( not ( = ?auto_215835 ?auto_215837 ) ) ( not ( = ?auto_215835 ?auto_215841 ) ) ( not ( = ?auto_215836 ?auto_215837 ) ) ( not ( = ?auto_215836 ?auto_215841 ) ) ( not ( = ?auto_215837 ?auto_215841 ) ) ( not ( = ?auto_215835 ?auto_215839 ) ) ( not ( = ?auto_215835 ?auto_215842 ) ) ( not ( = ?auto_215836 ?auto_215839 ) ) ( not ( = ?auto_215836 ?auto_215842 ) ) ( not ( = ?auto_215837 ?auto_215839 ) ) ( not ( = ?auto_215837 ?auto_215842 ) ) ( not ( = ?auto_215841 ?auto_215839 ) ) ( not ( = ?auto_215841 ?auto_215842 ) ) ( not ( = ?auto_215839 ?auto_215842 ) ) ( not ( = ?auto_215840 ?auto_215843 ) ) ( not ( = ?auto_215840 ?auto_215842 ) ) ( not ( = ?auto_215843 ?auto_215842 ) ) ( not ( = ?auto_215835 ?auto_215843 ) ) ( not ( = ?auto_215835 ?auto_215840 ) ) ( not ( = ?auto_215836 ?auto_215843 ) ) ( not ( = ?auto_215836 ?auto_215840 ) ) ( not ( = ?auto_215837 ?auto_215843 ) ) ( not ( = ?auto_215837 ?auto_215840 ) ) ( not ( = ?auto_215841 ?auto_215843 ) ) ( not ( = ?auto_215841 ?auto_215840 ) ) ( not ( = ?auto_215839 ?auto_215843 ) ) ( not ( = ?auto_215839 ?auto_215840 ) ) ( ON ?auto_215840 ?auto_215838 ) ( not ( = ?auto_215835 ?auto_215838 ) ) ( not ( = ?auto_215836 ?auto_215838 ) ) ( not ( = ?auto_215837 ?auto_215838 ) ) ( not ( = ?auto_215841 ?auto_215838 ) ) ( not ( = ?auto_215839 ?auto_215838 ) ) ( not ( = ?auto_215842 ?auto_215838 ) ) ( not ( = ?auto_215840 ?auto_215838 ) ) ( not ( = ?auto_215843 ?auto_215838 ) ) ( ON ?auto_215843 ?auto_215840 ) ( ON-TABLE ?auto_215838 ) ( ON ?auto_215842 ?auto_215843 ) ( ON ?auto_215839 ?auto_215842 ) ( ON ?auto_215841 ?auto_215839 ) ( ON ?auto_215837 ?auto_215841 ) ( CLEAR ?auto_215835 ) ( ON ?auto_215836 ?auto_215837 ) ( CLEAR ?auto_215836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215838 ?auto_215840 ?auto_215843 ?auto_215842 ?auto_215839 ?auto_215841 ?auto_215837 )
      ( MAKE-3PILE ?auto_215835 ?auto_215836 ?auto_215837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215844 - BLOCK
      ?auto_215845 - BLOCK
      ?auto_215846 - BLOCK
    )
    :vars
    (
      ?auto_215852 - BLOCK
      ?auto_215849 - BLOCK
      ?auto_215850 - BLOCK
      ?auto_215848 - BLOCK
      ?auto_215851 - BLOCK
      ?auto_215847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215844 ?auto_215845 ) ) ( not ( = ?auto_215844 ?auto_215846 ) ) ( not ( = ?auto_215844 ?auto_215852 ) ) ( not ( = ?auto_215845 ?auto_215846 ) ) ( not ( = ?auto_215845 ?auto_215852 ) ) ( not ( = ?auto_215846 ?auto_215852 ) ) ( not ( = ?auto_215844 ?auto_215849 ) ) ( not ( = ?auto_215844 ?auto_215850 ) ) ( not ( = ?auto_215845 ?auto_215849 ) ) ( not ( = ?auto_215845 ?auto_215850 ) ) ( not ( = ?auto_215846 ?auto_215849 ) ) ( not ( = ?auto_215846 ?auto_215850 ) ) ( not ( = ?auto_215852 ?auto_215849 ) ) ( not ( = ?auto_215852 ?auto_215850 ) ) ( not ( = ?auto_215849 ?auto_215850 ) ) ( not ( = ?auto_215848 ?auto_215851 ) ) ( not ( = ?auto_215848 ?auto_215850 ) ) ( not ( = ?auto_215851 ?auto_215850 ) ) ( not ( = ?auto_215844 ?auto_215851 ) ) ( not ( = ?auto_215844 ?auto_215848 ) ) ( not ( = ?auto_215845 ?auto_215851 ) ) ( not ( = ?auto_215845 ?auto_215848 ) ) ( not ( = ?auto_215846 ?auto_215851 ) ) ( not ( = ?auto_215846 ?auto_215848 ) ) ( not ( = ?auto_215852 ?auto_215851 ) ) ( not ( = ?auto_215852 ?auto_215848 ) ) ( not ( = ?auto_215849 ?auto_215851 ) ) ( not ( = ?auto_215849 ?auto_215848 ) ) ( ON ?auto_215848 ?auto_215847 ) ( not ( = ?auto_215844 ?auto_215847 ) ) ( not ( = ?auto_215845 ?auto_215847 ) ) ( not ( = ?auto_215846 ?auto_215847 ) ) ( not ( = ?auto_215852 ?auto_215847 ) ) ( not ( = ?auto_215849 ?auto_215847 ) ) ( not ( = ?auto_215850 ?auto_215847 ) ) ( not ( = ?auto_215848 ?auto_215847 ) ) ( not ( = ?auto_215851 ?auto_215847 ) ) ( ON ?auto_215851 ?auto_215848 ) ( ON-TABLE ?auto_215847 ) ( ON ?auto_215850 ?auto_215851 ) ( ON ?auto_215849 ?auto_215850 ) ( ON ?auto_215852 ?auto_215849 ) ( ON ?auto_215846 ?auto_215852 ) ( ON ?auto_215845 ?auto_215846 ) ( CLEAR ?auto_215845 ) ( HOLDING ?auto_215844 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215844 )
      ( MAKE-3PILE ?auto_215844 ?auto_215845 ?auto_215846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215853 - BLOCK
      ?auto_215854 - BLOCK
      ?auto_215855 - BLOCK
    )
    :vars
    (
      ?auto_215861 - BLOCK
      ?auto_215856 - BLOCK
      ?auto_215857 - BLOCK
      ?auto_215860 - BLOCK
      ?auto_215859 - BLOCK
      ?auto_215858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215853 ?auto_215854 ) ) ( not ( = ?auto_215853 ?auto_215855 ) ) ( not ( = ?auto_215853 ?auto_215861 ) ) ( not ( = ?auto_215854 ?auto_215855 ) ) ( not ( = ?auto_215854 ?auto_215861 ) ) ( not ( = ?auto_215855 ?auto_215861 ) ) ( not ( = ?auto_215853 ?auto_215856 ) ) ( not ( = ?auto_215853 ?auto_215857 ) ) ( not ( = ?auto_215854 ?auto_215856 ) ) ( not ( = ?auto_215854 ?auto_215857 ) ) ( not ( = ?auto_215855 ?auto_215856 ) ) ( not ( = ?auto_215855 ?auto_215857 ) ) ( not ( = ?auto_215861 ?auto_215856 ) ) ( not ( = ?auto_215861 ?auto_215857 ) ) ( not ( = ?auto_215856 ?auto_215857 ) ) ( not ( = ?auto_215860 ?auto_215859 ) ) ( not ( = ?auto_215860 ?auto_215857 ) ) ( not ( = ?auto_215859 ?auto_215857 ) ) ( not ( = ?auto_215853 ?auto_215859 ) ) ( not ( = ?auto_215853 ?auto_215860 ) ) ( not ( = ?auto_215854 ?auto_215859 ) ) ( not ( = ?auto_215854 ?auto_215860 ) ) ( not ( = ?auto_215855 ?auto_215859 ) ) ( not ( = ?auto_215855 ?auto_215860 ) ) ( not ( = ?auto_215861 ?auto_215859 ) ) ( not ( = ?auto_215861 ?auto_215860 ) ) ( not ( = ?auto_215856 ?auto_215859 ) ) ( not ( = ?auto_215856 ?auto_215860 ) ) ( ON ?auto_215860 ?auto_215858 ) ( not ( = ?auto_215853 ?auto_215858 ) ) ( not ( = ?auto_215854 ?auto_215858 ) ) ( not ( = ?auto_215855 ?auto_215858 ) ) ( not ( = ?auto_215861 ?auto_215858 ) ) ( not ( = ?auto_215856 ?auto_215858 ) ) ( not ( = ?auto_215857 ?auto_215858 ) ) ( not ( = ?auto_215860 ?auto_215858 ) ) ( not ( = ?auto_215859 ?auto_215858 ) ) ( ON ?auto_215859 ?auto_215860 ) ( ON-TABLE ?auto_215858 ) ( ON ?auto_215857 ?auto_215859 ) ( ON ?auto_215856 ?auto_215857 ) ( ON ?auto_215861 ?auto_215856 ) ( ON ?auto_215855 ?auto_215861 ) ( ON ?auto_215854 ?auto_215855 ) ( ON ?auto_215853 ?auto_215854 ) ( CLEAR ?auto_215853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_215858 ?auto_215860 ?auto_215859 ?auto_215857 ?auto_215856 ?auto_215861 ?auto_215855 ?auto_215854 )
      ( MAKE-3PILE ?auto_215853 ?auto_215854 ?auto_215855 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215867 - BLOCK
      ?auto_215868 - BLOCK
      ?auto_215869 - BLOCK
      ?auto_215870 - BLOCK
      ?auto_215871 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_215871 ) ( CLEAR ?auto_215870 ) ( ON-TABLE ?auto_215867 ) ( ON ?auto_215868 ?auto_215867 ) ( ON ?auto_215869 ?auto_215868 ) ( ON ?auto_215870 ?auto_215869 ) ( not ( = ?auto_215867 ?auto_215868 ) ) ( not ( = ?auto_215867 ?auto_215869 ) ) ( not ( = ?auto_215867 ?auto_215870 ) ) ( not ( = ?auto_215867 ?auto_215871 ) ) ( not ( = ?auto_215868 ?auto_215869 ) ) ( not ( = ?auto_215868 ?auto_215870 ) ) ( not ( = ?auto_215868 ?auto_215871 ) ) ( not ( = ?auto_215869 ?auto_215870 ) ) ( not ( = ?auto_215869 ?auto_215871 ) ) ( not ( = ?auto_215870 ?auto_215871 ) ) )
    :subtasks
    ( ( !STACK ?auto_215871 ?auto_215870 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215872 - BLOCK
      ?auto_215873 - BLOCK
      ?auto_215874 - BLOCK
      ?auto_215875 - BLOCK
      ?auto_215876 - BLOCK
    )
    :vars
    (
      ?auto_215877 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_215875 ) ( ON-TABLE ?auto_215872 ) ( ON ?auto_215873 ?auto_215872 ) ( ON ?auto_215874 ?auto_215873 ) ( ON ?auto_215875 ?auto_215874 ) ( not ( = ?auto_215872 ?auto_215873 ) ) ( not ( = ?auto_215872 ?auto_215874 ) ) ( not ( = ?auto_215872 ?auto_215875 ) ) ( not ( = ?auto_215872 ?auto_215876 ) ) ( not ( = ?auto_215873 ?auto_215874 ) ) ( not ( = ?auto_215873 ?auto_215875 ) ) ( not ( = ?auto_215873 ?auto_215876 ) ) ( not ( = ?auto_215874 ?auto_215875 ) ) ( not ( = ?auto_215874 ?auto_215876 ) ) ( not ( = ?auto_215875 ?auto_215876 ) ) ( ON ?auto_215876 ?auto_215877 ) ( CLEAR ?auto_215876 ) ( HAND-EMPTY ) ( not ( = ?auto_215872 ?auto_215877 ) ) ( not ( = ?auto_215873 ?auto_215877 ) ) ( not ( = ?auto_215874 ?auto_215877 ) ) ( not ( = ?auto_215875 ?auto_215877 ) ) ( not ( = ?auto_215876 ?auto_215877 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215876 ?auto_215877 )
      ( MAKE-5PILE ?auto_215872 ?auto_215873 ?auto_215874 ?auto_215875 ?auto_215876 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215878 - BLOCK
      ?auto_215879 - BLOCK
      ?auto_215880 - BLOCK
      ?auto_215881 - BLOCK
      ?auto_215882 - BLOCK
    )
    :vars
    (
      ?auto_215883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215878 ) ( ON ?auto_215879 ?auto_215878 ) ( ON ?auto_215880 ?auto_215879 ) ( not ( = ?auto_215878 ?auto_215879 ) ) ( not ( = ?auto_215878 ?auto_215880 ) ) ( not ( = ?auto_215878 ?auto_215881 ) ) ( not ( = ?auto_215878 ?auto_215882 ) ) ( not ( = ?auto_215879 ?auto_215880 ) ) ( not ( = ?auto_215879 ?auto_215881 ) ) ( not ( = ?auto_215879 ?auto_215882 ) ) ( not ( = ?auto_215880 ?auto_215881 ) ) ( not ( = ?auto_215880 ?auto_215882 ) ) ( not ( = ?auto_215881 ?auto_215882 ) ) ( ON ?auto_215882 ?auto_215883 ) ( CLEAR ?auto_215882 ) ( not ( = ?auto_215878 ?auto_215883 ) ) ( not ( = ?auto_215879 ?auto_215883 ) ) ( not ( = ?auto_215880 ?auto_215883 ) ) ( not ( = ?auto_215881 ?auto_215883 ) ) ( not ( = ?auto_215882 ?auto_215883 ) ) ( HOLDING ?auto_215881 ) ( CLEAR ?auto_215880 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215878 ?auto_215879 ?auto_215880 ?auto_215881 )
      ( MAKE-5PILE ?auto_215878 ?auto_215879 ?auto_215880 ?auto_215881 ?auto_215882 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215884 - BLOCK
      ?auto_215885 - BLOCK
      ?auto_215886 - BLOCK
      ?auto_215887 - BLOCK
      ?auto_215888 - BLOCK
    )
    :vars
    (
      ?auto_215889 - BLOCK
      ?auto_215890 - BLOCK
      ?auto_215891 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215884 ) ( ON ?auto_215885 ?auto_215884 ) ( ON ?auto_215886 ?auto_215885 ) ( not ( = ?auto_215884 ?auto_215885 ) ) ( not ( = ?auto_215884 ?auto_215886 ) ) ( not ( = ?auto_215884 ?auto_215887 ) ) ( not ( = ?auto_215884 ?auto_215888 ) ) ( not ( = ?auto_215885 ?auto_215886 ) ) ( not ( = ?auto_215885 ?auto_215887 ) ) ( not ( = ?auto_215885 ?auto_215888 ) ) ( not ( = ?auto_215886 ?auto_215887 ) ) ( not ( = ?auto_215886 ?auto_215888 ) ) ( not ( = ?auto_215887 ?auto_215888 ) ) ( ON ?auto_215888 ?auto_215889 ) ( not ( = ?auto_215884 ?auto_215889 ) ) ( not ( = ?auto_215885 ?auto_215889 ) ) ( not ( = ?auto_215886 ?auto_215889 ) ) ( not ( = ?auto_215887 ?auto_215889 ) ) ( not ( = ?auto_215888 ?auto_215889 ) ) ( CLEAR ?auto_215886 ) ( ON ?auto_215887 ?auto_215888 ) ( CLEAR ?auto_215887 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215890 ) ( ON ?auto_215891 ?auto_215890 ) ( ON ?auto_215889 ?auto_215891 ) ( not ( = ?auto_215890 ?auto_215891 ) ) ( not ( = ?auto_215890 ?auto_215889 ) ) ( not ( = ?auto_215890 ?auto_215888 ) ) ( not ( = ?auto_215890 ?auto_215887 ) ) ( not ( = ?auto_215891 ?auto_215889 ) ) ( not ( = ?auto_215891 ?auto_215888 ) ) ( not ( = ?auto_215891 ?auto_215887 ) ) ( not ( = ?auto_215884 ?auto_215890 ) ) ( not ( = ?auto_215884 ?auto_215891 ) ) ( not ( = ?auto_215885 ?auto_215890 ) ) ( not ( = ?auto_215885 ?auto_215891 ) ) ( not ( = ?auto_215886 ?auto_215890 ) ) ( not ( = ?auto_215886 ?auto_215891 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215890 ?auto_215891 ?auto_215889 ?auto_215888 )
      ( MAKE-5PILE ?auto_215884 ?auto_215885 ?auto_215886 ?auto_215887 ?auto_215888 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215892 - BLOCK
      ?auto_215893 - BLOCK
      ?auto_215894 - BLOCK
      ?auto_215895 - BLOCK
      ?auto_215896 - BLOCK
    )
    :vars
    (
      ?auto_215897 - BLOCK
      ?auto_215898 - BLOCK
      ?auto_215899 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215892 ) ( ON ?auto_215893 ?auto_215892 ) ( not ( = ?auto_215892 ?auto_215893 ) ) ( not ( = ?auto_215892 ?auto_215894 ) ) ( not ( = ?auto_215892 ?auto_215895 ) ) ( not ( = ?auto_215892 ?auto_215896 ) ) ( not ( = ?auto_215893 ?auto_215894 ) ) ( not ( = ?auto_215893 ?auto_215895 ) ) ( not ( = ?auto_215893 ?auto_215896 ) ) ( not ( = ?auto_215894 ?auto_215895 ) ) ( not ( = ?auto_215894 ?auto_215896 ) ) ( not ( = ?auto_215895 ?auto_215896 ) ) ( ON ?auto_215896 ?auto_215897 ) ( not ( = ?auto_215892 ?auto_215897 ) ) ( not ( = ?auto_215893 ?auto_215897 ) ) ( not ( = ?auto_215894 ?auto_215897 ) ) ( not ( = ?auto_215895 ?auto_215897 ) ) ( not ( = ?auto_215896 ?auto_215897 ) ) ( ON ?auto_215895 ?auto_215896 ) ( CLEAR ?auto_215895 ) ( ON-TABLE ?auto_215898 ) ( ON ?auto_215899 ?auto_215898 ) ( ON ?auto_215897 ?auto_215899 ) ( not ( = ?auto_215898 ?auto_215899 ) ) ( not ( = ?auto_215898 ?auto_215897 ) ) ( not ( = ?auto_215898 ?auto_215896 ) ) ( not ( = ?auto_215898 ?auto_215895 ) ) ( not ( = ?auto_215899 ?auto_215897 ) ) ( not ( = ?auto_215899 ?auto_215896 ) ) ( not ( = ?auto_215899 ?auto_215895 ) ) ( not ( = ?auto_215892 ?auto_215898 ) ) ( not ( = ?auto_215892 ?auto_215899 ) ) ( not ( = ?auto_215893 ?auto_215898 ) ) ( not ( = ?auto_215893 ?auto_215899 ) ) ( not ( = ?auto_215894 ?auto_215898 ) ) ( not ( = ?auto_215894 ?auto_215899 ) ) ( HOLDING ?auto_215894 ) ( CLEAR ?auto_215893 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215892 ?auto_215893 ?auto_215894 )
      ( MAKE-5PILE ?auto_215892 ?auto_215893 ?auto_215894 ?auto_215895 ?auto_215896 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215900 - BLOCK
      ?auto_215901 - BLOCK
      ?auto_215902 - BLOCK
      ?auto_215903 - BLOCK
      ?auto_215904 - BLOCK
    )
    :vars
    (
      ?auto_215906 - BLOCK
      ?auto_215907 - BLOCK
      ?auto_215905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215900 ) ( ON ?auto_215901 ?auto_215900 ) ( not ( = ?auto_215900 ?auto_215901 ) ) ( not ( = ?auto_215900 ?auto_215902 ) ) ( not ( = ?auto_215900 ?auto_215903 ) ) ( not ( = ?auto_215900 ?auto_215904 ) ) ( not ( = ?auto_215901 ?auto_215902 ) ) ( not ( = ?auto_215901 ?auto_215903 ) ) ( not ( = ?auto_215901 ?auto_215904 ) ) ( not ( = ?auto_215902 ?auto_215903 ) ) ( not ( = ?auto_215902 ?auto_215904 ) ) ( not ( = ?auto_215903 ?auto_215904 ) ) ( ON ?auto_215904 ?auto_215906 ) ( not ( = ?auto_215900 ?auto_215906 ) ) ( not ( = ?auto_215901 ?auto_215906 ) ) ( not ( = ?auto_215902 ?auto_215906 ) ) ( not ( = ?auto_215903 ?auto_215906 ) ) ( not ( = ?auto_215904 ?auto_215906 ) ) ( ON ?auto_215903 ?auto_215904 ) ( ON-TABLE ?auto_215907 ) ( ON ?auto_215905 ?auto_215907 ) ( ON ?auto_215906 ?auto_215905 ) ( not ( = ?auto_215907 ?auto_215905 ) ) ( not ( = ?auto_215907 ?auto_215906 ) ) ( not ( = ?auto_215907 ?auto_215904 ) ) ( not ( = ?auto_215907 ?auto_215903 ) ) ( not ( = ?auto_215905 ?auto_215906 ) ) ( not ( = ?auto_215905 ?auto_215904 ) ) ( not ( = ?auto_215905 ?auto_215903 ) ) ( not ( = ?auto_215900 ?auto_215907 ) ) ( not ( = ?auto_215900 ?auto_215905 ) ) ( not ( = ?auto_215901 ?auto_215907 ) ) ( not ( = ?auto_215901 ?auto_215905 ) ) ( not ( = ?auto_215902 ?auto_215907 ) ) ( not ( = ?auto_215902 ?auto_215905 ) ) ( CLEAR ?auto_215901 ) ( ON ?auto_215902 ?auto_215903 ) ( CLEAR ?auto_215902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215907 ?auto_215905 ?auto_215906 ?auto_215904 ?auto_215903 )
      ( MAKE-5PILE ?auto_215900 ?auto_215901 ?auto_215902 ?auto_215903 ?auto_215904 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215908 - BLOCK
      ?auto_215909 - BLOCK
      ?auto_215910 - BLOCK
      ?auto_215911 - BLOCK
      ?auto_215912 - BLOCK
    )
    :vars
    (
      ?auto_215914 - BLOCK
      ?auto_215913 - BLOCK
      ?auto_215915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215908 ) ( not ( = ?auto_215908 ?auto_215909 ) ) ( not ( = ?auto_215908 ?auto_215910 ) ) ( not ( = ?auto_215908 ?auto_215911 ) ) ( not ( = ?auto_215908 ?auto_215912 ) ) ( not ( = ?auto_215909 ?auto_215910 ) ) ( not ( = ?auto_215909 ?auto_215911 ) ) ( not ( = ?auto_215909 ?auto_215912 ) ) ( not ( = ?auto_215910 ?auto_215911 ) ) ( not ( = ?auto_215910 ?auto_215912 ) ) ( not ( = ?auto_215911 ?auto_215912 ) ) ( ON ?auto_215912 ?auto_215914 ) ( not ( = ?auto_215908 ?auto_215914 ) ) ( not ( = ?auto_215909 ?auto_215914 ) ) ( not ( = ?auto_215910 ?auto_215914 ) ) ( not ( = ?auto_215911 ?auto_215914 ) ) ( not ( = ?auto_215912 ?auto_215914 ) ) ( ON ?auto_215911 ?auto_215912 ) ( ON-TABLE ?auto_215913 ) ( ON ?auto_215915 ?auto_215913 ) ( ON ?auto_215914 ?auto_215915 ) ( not ( = ?auto_215913 ?auto_215915 ) ) ( not ( = ?auto_215913 ?auto_215914 ) ) ( not ( = ?auto_215913 ?auto_215912 ) ) ( not ( = ?auto_215913 ?auto_215911 ) ) ( not ( = ?auto_215915 ?auto_215914 ) ) ( not ( = ?auto_215915 ?auto_215912 ) ) ( not ( = ?auto_215915 ?auto_215911 ) ) ( not ( = ?auto_215908 ?auto_215913 ) ) ( not ( = ?auto_215908 ?auto_215915 ) ) ( not ( = ?auto_215909 ?auto_215913 ) ) ( not ( = ?auto_215909 ?auto_215915 ) ) ( not ( = ?auto_215910 ?auto_215913 ) ) ( not ( = ?auto_215910 ?auto_215915 ) ) ( ON ?auto_215910 ?auto_215911 ) ( CLEAR ?auto_215910 ) ( HOLDING ?auto_215909 ) ( CLEAR ?auto_215908 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215908 ?auto_215909 )
      ( MAKE-5PILE ?auto_215908 ?auto_215909 ?auto_215910 ?auto_215911 ?auto_215912 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215916 - BLOCK
      ?auto_215917 - BLOCK
      ?auto_215918 - BLOCK
      ?auto_215919 - BLOCK
      ?auto_215920 - BLOCK
    )
    :vars
    (
      ?auto_215922 - BLOCK
      ?auto_215923 - BLOCK
      ?auto_215921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215916 ) ( not ( = ?auto_215916 ?auto_215917 ) ) ( not ( = ?auto_215916 ?auto_215918 ) ) ( not ( = ?auto_215916 ?auto_215919 ) ) ( not ( = ?auto_215916 ?auto_215920 ) ) ( not ( = ?auto_215917 ?auto_215918 ) ) ( not ( = ?auto_215917 ?auto_215919 ) ) ( not ( = ?auto_215917 ?auto_215920 ) ) ( not ( = ?auto_215918 ?auto_215919 ) ) ( not ( = ?auto_215918 ?auto_215920 ) ) ( not ( = ?auto_215919 ?auto_215920 ) ) ( ON ?auto_215920 ?auto_215922 ) ( not ( = ?auto_215916 ?auto_215922 ) ) ( not ( = ?auto_215917 ?auto_215922 ) ) ( not ( = ?auto_215918 ?auto_215922 ) ) ( not ( = ?auto_215919 ?auto_215922 ) ) ( not ( = ?auto_215920 ?auto_215922 ) ) ( ON ?auto_215919 ?auto_215920 ) ( ON-TABLE ?auto_215923 ) ( ON ?auto_215921 ?auto_215923 ) ( ON ?auto_215922 ?auto_215921 ) ( not ( = ?auto_215923 ?auto_215921 ) ) ( not ( = ?auto_215923 ?auto_215922 ) ) ( not ( = ?auto_215923 ?auto_215920 ) ) ( not ( = ?auto_215923 ?auto_215919 ) ) ( not ( = ?auto_215921 ?auto_215922 ) ) ( not ( = ?auto_215921 ?auto_215920 ) ) ( not ( = ?auto_215921 ?auto_215919 ) ) ( not ( = ?auto_215916 ?auto_215923 ) ) ( not ( = ?auto_215916 ?auto_215921 ) ) ( not ( = ?auto_215917 ?auto_215923 ) ) ( not ( = ?auto_215917 ?auto_215921 ) ) ( not ( = ?auto_215918 ?auto_215923 ) ) ( not ( = ?auto_215918 ?auto_215921 ) ) ( ON ?auto_215918 ?auto_215919 ) ( CLEAR ?auto_215916 ) ( ON ?auto_215917 ?auto_215918 ) ( CLEAR ?auto_215917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215923 ?auto_215921 ?auto_215922 ?auto_215920 ?auto_215919 ?auto_215918 )
      ( MAKE-5PILE ?auto_215916 ?auto_215917 ?auto_215918 ?auto_215919 ?auto_215920 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215924 - BLOCK
      ?auto_215925 - BLOCK
      ?auto_215926 - BLOCK
      ?auto_215927 - BLOCK
      ?auto_215928 - BLOCK
    )
    :vars
    (
      ?auto_215929 - BLOCK
      ?auto_215930 - BLOCK
      ?auto_215931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215924 ?auto_215925 ) ) ( not ( = ?auto_215924 ?auto_215926 ) ) ( not ( = ?auto_215924 ?auto_215927 ) ) ( not ( = ?auto_215924 ?auto_215928 ) ) ( not ( = ?auto_215925 ?auto_215926 ) ) ( not ( = ?auto_215925 ?auto_215927 ) ) ( not ( = ?auto_215925 ?auto_215928 ) ) ( not ( = ?auto_215926 ?auto_215927 ) ) ( not ( = ?auto_215926 ?auto_215928 ) ) ( not ( = ?auto_215927 ?auto_215928 ) ) ( ON ?auto_215928 ?auto_215929 ) ( not ( = ?auto_215924 ?auto_215929 ) ) ( not ( = ?auto_215925 ?auto_215929 ) ) ( not ( = ?auto_215926 ?auto_215929 ) ) ( not ( = ?auto_215927 ?auto_215929 ) ) ( not ( = ?auto_215928 ?auto_215929 ) ) ( ON ?auto_215927 ?auto_215928 ) ( ON-TABLE ?auto_215930 ) ( ON ?auto_215931 ?auto_215930 ) ( ON ?auto_215929 ?auto_215931 ) ( not ( = ?auto_215930 ?auto_215931 ) ) ( not ( = ?auto_215930 ?auto_215929 ) ) ( not ( = ?auto_215930 ?auto_215928 ) ) ( not ( = ?auto_215930 ?auto_215927 ) ) ( not ( = ?auto_215931 ?auto_215929 ) ) ( not ( = ?auto_215931 ?auto_215928 ) ) ( not ( = ?auto_215931 ?auto_215927 ) ) ( not ( = ?auto_215924 ?auto_215930 ) ) ( not ( = ?auto_215924 ?auto_215931 ) ) ( not ( = ?auto_215925 ?auto_215930 ) ) ( not ( = ?auto_215925 ?auto_215931 ) ) ( not ( = ?auto_215926 ?auto_215930 ) ) ( not ( = ?auto_215926 ?auto_215931 ) ) ( ON ?auto_215926 ?auto_215927 ) ( ON ?auto_215925 ?auto_215926 ) ( CLEAR ?auto_215925 ) ( HOLDING ?auto_215924 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215924 )
      ( MAKE-5PILE ?auto_215924 ?auto_215925 ?auto_215926 ?auto_215927 ?auto_215928 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215932 - BLOCK
      ?auto_215933 - BLOCK
      ?auto_215934 - BLOCK
      ?auto_215935 - BLOCK
      ?auto_215936 - BLOCK
    )
    :vars
    (
      ?auto_215938 - BLOCK
      ?auto_215937 - BLOCK
      ?auto_215939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215932 ?auto_215933 ) ) ( not ( = ?auto_215932 ?auto_215934 ) ) ( not ( = ?auto_215932 ?auto_215935 ) ) ( not ( = ?auto_215932 ?auto_215936 ) ) ( not ( = ?auto_215933 ?auto_215934 ) ) ( not ( = ?auto_215933 ?auto_215935 ) ) ( not ( = ?auto_215933 ?auto_215936 ) ) ( not ( = ?auto_215934 ?auto_215935 ) ) ( not ( = ?auto_215934 ?auto_215936 ) ) ( not ( = ?auto_215935 ?auto_215936 ) ) ( ON ?auto_215936 ?auto_215938 ) ( not ( = ?auto_215932 ?auto_215938 ) ) ( not ( = ?auto_215933 ?auto_215938 ) ) ( not ( = ?auto_215934 ?auto_215938 ) ) ( not ( = ?auto_215935 ?auto_215938 ) ) ( not ( = ?auto_215936 ?auto_215938 ) ) ( ON ?auto_215935 ?auto_215936 ) ( ON-TABLE ?auto_215937 ) ( ON ?auto_215939 ?auto_215937 ) ( ON ?auto_215938 ?auto_215939 ) ( not ( = ?auto_215937 ?auto_215939 ) ) ( not ( = ?auto_215937 ?auto_215938 ) ) ( not ( = ?auto_215937 ?auto_215936 ) ) ( not ( = ?auto_215937 ?auto_215935 ) ) ( not ( = ?auto_215939 ?auto_215938 ) ) ( not ( = ?auto_215939 ?auto_215936 ) ) ( not ( = ?auto_215939 ?auto_215935 ) ) ( not ( = ?auto_215932 ?auto_215937 ) ) ( not ( = ?auto_215932 ?auto_215939 ) ) ( not ( = ?auto_215933 ?auto_215937 ) ) ( not ( = ?auto_215933 ?auto_215939 ) ) ( not ( = ?auto_215934 ?auto_215937 ) ) ( not ( = ?auto_215934 ?auto_215939 ) ) ( ON ?auto_215934 ?auto_215935 ) ( ON ?auto_215933 ?auto_215934 ) ( ON ?auto_215932 ?auto_215933 ) ( CLEAR ?auto_215932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215937 ?auto_215939 ?auto_215938 ?auto_215936 ?auto_215935 ?auto_215934 ?auto_215933 )
      ( MAKE-5PILE ?auto_215932 ?auto_215933 ?auto_215934 ?auto_215935 ?auto_215936 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215940 - BLOCK
      ?auto_215941 - BLOCK
      ?auto_215942 - BLOCK
      ?auto_215943 - BLOCK
      ?auto_215944 - BLOCK
    )
    :vars
    (
      ?auto_215945 - BLOCK
      ?auto_215947 - BLOCK
      ?auto_215946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215940 ?auto_215941 ) ) ( not ( = ?auto_215940 ?auto_215942 ) ) ( not ( = ?auto_215940 ?auto_215943 ) ) ( not ( = ?auto_215940 ?auto_215944 ) ) ( not ( = ?auto_215941 ?auto_215942 ) ) ( not ( = ?auto_215941 ?auto_215943 ) ) ( not ( = ?auto_215941 ?auto_215944 ) ) ( not ( = ?auto_215942 ?auto_215943 ) ) ( not ( = ?auto_215942 ?auto_215944 ) ) ( not ( = ?auto_215943 ?auto_215944 ) ) ( ON ?auto_215944 ?auto_215945 ) ( not ( = ?auto_215940 ?auto_215945 ) ) ( not ( = ?auto_215941 ?auto_215945 ) ) ( not ( = ?auto_215942 ?auto_215945 ) ) ( not ( = ?auto_215943 ?auto_215945 ) ) ( not ( = ?auto_215944 ?auto_215945 ) ) ( ON ?auto_215943 ?auto_215944 ) ( ON-TABLE ?auto_215947 ) ( ON ?auto_215946 ?auto_215947 ) ( ON ?auto_215945 ?auto_215946 ) ( not ( = ?auto_215947 ?auto_215946 ) ) ( not ( = ?auto_215947 ?auto_215945 ) ) ( not ( = ?auto_215947 ?auto_215944 ) ) ( not ( = ?auto_215947 ?auto_215943 ) ) ( not ( = ?auto_215946 ?auto_215945 ) ) ( not ( = ?auto_215946 ?auto_215944 ) ) ( not ( = ?auto_215946 ?auto_215943 ) ) ( not ( = ?auto_215940 ?auto_215947 ) ) ( not ( = ?auto_215940 ?auto_215946 ) ) ( not ( = ?auto_215941 ?auto_215947 ) ) ( not ( = ?auto_215941 ?auto_215946 ) ) ( not ( = ?auto_215942 ?auto_215947 ) ) ( not ( = ?auto_215942 ?auto_215946 ) ) ( ON ?auto_215942 ?auto_215943 ) ( ON ?auto_215941 ?auto_215942 ) ( HOLDING ?auto_215940 ) ( CLEAR ?auto_215941 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_215947 ?auto_215946 ?auto_215945 ?auto_215944 ?auto_215943 ?auto_215942 ?auto_215941 ?auto_215940 )
      ( MAKE-5PILE ?auto_215940 ?auto_215941 ?auto_215942 ?auto_215943 ?auto_215944 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215948 - BLOCK
      ?auto_215949 - BLOCK
      ?auto_215950 - BLOCK
      ?auto_215951 - BLOCK
      ?auto_215952 - BLOCK
    )
    :vars
    (
      ?auto_215954 - BLOCK
      ?auto_215955 - BLOCK
      ?auto_215953 - BLOCK
      ?auto_215956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215948 ?auto_215949 ) ) ( not ( = ?auto_215948 ?auto_215950 ) ) ( not ( = ?auto_215948 ?auto_215951 ) ) ( not ( = ?auto_215948 ?auto_215952 ) ) ( not ( = ?auto_215949 ?auto_215950 ) ) ( not ( = ?auto_215949 ?auto_215951 ) ) ( not ( = ?auto_215949 ?auto_215952 ) ) ( not ( = ?auto_215950 ?auto_215951 ) ) ( not ( = ?auto_215950 ?auto_215952 ) ) ( not ( = ?auto_215951 ?auto_215952 ) ) ( ON ?auto_215952 ?auto_215954 ) ( not ( = ?auto_215948 ?auto_215954 ) ) ( not ( = ?auto_215949 ?auto_215954 ) ) ( not ( = ?auto_215950 ?auto_215954 ) ) ( not ( = ?auto_215951 ?auto_215954 ) ) ( not ( = ?auto_215952 ?auto_215954 ) ) ( ON ?auto_215951 ?auto_215952 ) ( ON-TABLE ?auto_215955 ) ( ON ?auto_215953 ?auto_215955 ) ( ON ?auto_215954 ?auto_215953 ) ( not ( = ?auto_215955 ?auto_215953 ) ) ( not ( = ?auto_215955 ?auto_215954 ) ) ( not ( = ?auto_215955 ?auto_215952 ) ) ( not ( = ?auto_215955 ?auto_215951 ) ) ( not ( = ?auto_215953 ?auto_215954 ) ) ( not ( = ?auto_215953 ?auto_215952 ) ) ( not ( = ?auto_215953 ?auto_215951 ) ) ( not ( = ?auto_215948 ?auto_215955 ) ) ( not ( = ?auto_215948 ?auto_215953 ) ) ( not ( = ?auto_215949 ?auto_215955 ) ) ( not ( = ?auto_215949 ?auto_215953 ) ) ( not ( = ?auto_215950 ?auto_215955 ) ) ( not ( = ?auto_215950 ?auto_215953 ) ) ( ON ?auto_215950 ?auto_215951 ) ( ON ?auto_215949 ?auto_215950 ) ( CLEAR ?auto_215949 ) ( ON ?auto_215948 ?auto_215956 ) ( CLEAR ?auto_215948 ) ( HAND-EMPTY ) ( not ( = ?auto_215948 ?auto_215956 ) ) ( not ( = ?auto_215949 ?auto_215956 ) ) ( not ( = ?auto_215950 ?auto_215956 ) ) ( not ( = ?auto_215951 ?auto_215956 ) ) ( not ( = ?auto_215952 ?auto_215956 ) ) ( not ( = ?auto_215954 ?auto_215956 ) ) ( not ( = ?auto_215955 ?auto_215956 ) ) ( not ( = ?auto_215953 ?auto_215956 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215948 ?auto_215956 )
      ( MAKE-5PILE ?auto_215948 ?auto_215949 ?auto_215950 ?auto_215951 ?auto_215952 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215957 - BLOCK
      ?auto_215958 - BLOCK
      ?auto_215959 - BLOCK
      ?auto_215960 - BLOCK
      ?auto_215961 - BLOCK
    )
    :vars
    (
      ?auto_215963 - BLOCK
      ?auto_215964 - BLOCK
      ?auto_215965 - BLOCK
      ?auto_215962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215957 ?auto_215958 ) ) ( not ( = ?auto_215957 ?auto_215959 ) ) ( not ( = ?auto_215957 ?auto_215960 ) ) ( not ( = ?auto_215957 ?auto_215961 ) ) ( not ( = ?auto_215958 ?auto_215959 ) ) ( not ( = ?auto_215958 ?auto_215960 ) ) ( not ( = ?auto_215958 ?auto_215961 ) ) ( not ( = ?auto_215959 ?auto_215960 ) ) ( not ( = ?auto_215959 ?auto_215961 ) ) ( not ( = ?auto_215960 ?auto_215961 ) ) ( ON ?auto_215961 ?auto_215963 ) ( not ( = ?auto_215957 ?auto_215963 ) ) ( not ( = ?auto_215958 ?auto_215963 ) ) ( not ( = ?auto_215959 ?auto_215963 ) ) ( not ( = ?auto_215960 ?auto_215963 ) ) ( not ( = ?auto_215961 ?auto_215963 ) ) ( ON ?auto_215960 ?auto_215961 ) ( ON-TABLE ?auto_215964 ) ( ON ?auto_215965 ?auto_215964 ) ( ON ?auto_215963 ?auto_215965 ) ( not ( = ?auto_215964 ?auto_215965 ) ) ( not ( = ?auto_215964 ?auto_215963 ) ) ( not ( = ?auto_215964 ?auto_215961 ) ) ( not ( = ?auto_215964 ?auto_215960 ) ) ( not ( = ?auto_215965 ?auto_215963 ) ) ( not ( = ?auto_215965 ?auto_215961 ) ) ( not ( = ?auto_215965 ?auto_215960 ) ) ( not ( = ?auto_215957 ?auto_215964 ) ) ( not ( = ?auto_215957 ?auto_215965 ) ) ( not ( = ?auto_215958 ?auto_215964 ) ) ( not ( = ?auto_215958 ?auto_215965 ) ) ( not ( = ?auto_215959 ?auto_215964 ) ) ( not ( = ?auto_215959 ?auto_215965 ) ) ( ON ?auto_215959 ?auto_215960 ) ( ON ?auto_215957 ?auto_215962 ) ( CLEAR ?auto_215957 ) ( not ( = ?auto_215957 ?auto_215962 ) ) ( not ( = ?auto_215958 ?auto_215962 ) ) ( not ( = ?auto_215959 ?auto_215962 ) ) ( not ( = ?auto_215960 ?auto_215962 ) ) ( not ( = ?auto_215961 ?auto_215962 ) ) ( not ( = ?auto_215963 ?auto_215962 ) ) ( not ( = ?auto_215964 ?auto_215962 ) ) ( not ( = ?auto_215965 ?auto_215962 ) ) ( HOLDING ?auto_215958 ) ( CLEAR ?auto_215959 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215964 ?auto_215965 ?auto_215963 ?auto_215961 ?auto_215960 ?auto_215959 ?auto_215958 )
      ( MAKE-5PILE ?auto_215957 ?auto_215958 ?auto_215959 ?auto_215960 ?auto_215961 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215966 - BLOCK
      ?auto_215967 - BLOCK
      ?auto_215968 - BLOCK
      ?auto_215969 - BLOCK
      ?auto_215970 - BLOCK
    )
    :vars
    (
      ?auto_215974 - BLOCK
      ?auto_215972 - BLOCK
      ?auto_215971 - BLOCK
      ?auto_215973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215966 ?auto_215967 ) ) ( not ( = ?auto_215966 ?auto_215968 ) ) ( not ( = ?auto_215966 ?auto_215969 ) ) ( not ( = ?auto_215966 ?auto_215970 ) ) ( not ( = ?auto_215967 ?auto_215968 ) ) ( not ( = ?auto_215967 ?auto_215969 ) ) ( not ( = ?auto_215967 ?auto_215970 ) ) ( not ( = ?auto_215968 ?auto_215969 ) ) ( not ( = ?auto_215968 ?auto_215970 ) ) ( not ( = ?auto_215969 ?auto_215970 ) ) ( ON ?auto_215970 ?auto_215974 ) ( not ( = ?auto_215966 ?auto_215974 ) ) ( not ( = ?auto_215967 ?auto_215974 ) ) ( not ( = ?auto_215968 ?auto_215974 ) ) ( not ( = ?auto_215969 ?auto_215974 ) ) ( not ( = ?auto_215970 ?auto_215974 ) ) ( ON ?auto_215969 ?auto_215970 ) ( ON-TABLE ?auto_215972 ) ( ON ?auto_215971 ?auto_215972 ) ( ON ?auto_215974 ?auto_215971 ) ( not ( = ?auto_215972 ?auto_215971 ) ) ( not ( = ?auto_215972 ?auto_215974 ) ) ( not ( = ?auto_215972 ?auto_215970 ) ) ( not ( = ?auto_215972 ?auto_215969 ) ) ( not ( = ?auto_215971 ?auto_215974 ) ) ( not ( = ?auto_215971 ?auto_215970 ) ) ( not ( = ?auto_215971 ?auto_215969 ) ) ( not ( = ?auto_215966 ?auto_215972 ) ) ( not ( = ?auto_215966 ?auto_215971 ) ) ( not ( = ?auto_215967 ?auto_215972 ) ) ( not ( = ?auto_215967 ?auto_215971 ) ) ( not ( = ?auto_215968 ?auto_215972 ) ) ( not ( = ?auto_215968 ?auto_215971 ) ) ( ON ?auto_215968 ?auto_215969 ) ( ON ?auto_215966 ?auto_215973 ) ( not ( = ?auto_215966 ?auto_215973 ) ) ( not ( = ?auto_215967 ?auto_215973 ) ) ( not ( = ?auto_215968 ?auto_215973 ) ) ( not ( = ?auto_215969 ?auto_215973 ) ) ( not ( = ?auto_215970 ?auto_215973 ) ) ( not ( = ?auto_215974 ?auto_215973 ) ) ( not ( = ?auto_215972 ?auto_215973 ) ) ( not ( = ?auto_215971 ?auto_215973 ) ) ( CLEAR ?auto_215968 ) ( ON ?auto_215967 ?auto_215966 ) ( CLEAR ?auto_215967 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215973 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215973 ?auto_215966 )
      ( MAKE-5PILE ?auto_215966 ?auto_215967 ?auto_215968 ?auto_215969 ?auto_215970 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215975 - BLOCK
      ?auto_215976 - BLOCK
      ?auto_215977 - BLOCK
      ?auto_215978 - BLOCK
      ?auto_215979 - BLOCK
    )
    :vars
    (
      ?auto_215980 - BLOCK
      ?auto_215982 - BLOCK
      ?auto_215981 - BLOCK
      ?auto_215983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215975 ?auto_215976 ) ) ( not ( = ?auto_215975 ?auto_215977 ) ) ( not ( = ?auto_215975 ?auto_215978 ) ) ( not ( = ?auto_215975 ?auto_215979 ) ) ( not ( = ?auto_215976 ?auto_215977 ) ) ( not ( = ?auto_215976 ?auto_215978 ) ) ( not ( = ?auto_215976 ?auto_215979 ) ) ( not ( = ?auto_215977 ?auto_215978 ) ) ( not ( = ?auto_215977 ?auto_215979 ) ) ( not ( = ?auto_215978 ?auto_215979 ) ) ( ON ?auto_215979 ?auto_215980 ) ( not ( = ?auto_215975 ?auto_215980 ) ) ( not ( = ?auto_215976 ?auto_215980 ) ) ( not ( = ?auto_215977 ?auto_215980 ) ) ( not ( = ?auto_215978 ?auto_215980 ) ) ( not ( = ?auto_215979 ?auto_215980 ) ) ( ON ?auto_215978 ?auto_215979 ) ( ON-TABLE ?auto_215982 ) ( ON ?auto_215981 ?auto_215982 ) ( ON ?auto_215980 ?auto_215981 ) ( not ( = ?auto_215982 ?auto_215981 ) ) ( not ( = ?auto_215982 ?auto_215980 ) ) ( not ( = ?auto_215982 ?auto_215979 ) ) ( not ( = ?auto_215982 ?auto_215978 ) ) ( not ( = ?auto_215981 ?auto_215980 ) ) ( not ( = ?auto_215981 ?auto_215979 ) ) ( not ( = ?auto_215981 ?auto_215978 ) ) ( not ( = ?auto_215975 ?auto_215982 ) ) ( not ( = ?auto_215975 ?auto_215981 ) ) ( not ( = ?auto_215976 ?auto_215982 ) ) ( not ( = ?auto_215976 ?auto_215981 ) ) ( not ( = ?auto_215977 ?auto_215982 ) ) ( not ( = ?auto_215977 ?auto_215981 ) ) ( ON ?auto_215975 ?auto_215983 ) ( not ( = ?auto_215975 ?auto_215983 ) ) ( not ( = ?auto_215976 ?auto_215983 ) ) ( not ( = ?auto_215977 ?auto_215983 ) ) ( not ( = ?auto_215978 ?auto_215983 ) ) ( not ( = ?auto_215979 ?auto_215983 ) ) ( not ( = ?auto_215980 ?auto_215983 ) ) ( not ( = ?auto_215982 ?auto_215983 ) ) ( not ( = ?auto_215981 ?auto_215983 ) ) ( ON ?auto_215976 ?auto_215975 ) ( CLEAR ?auto_215976 ) ( ON-TABLE ?auto_215983 ) ( HOLDING ?auto_215977 ) ( CLEAR ?auto_215978 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215982 ?auto_215981 ?auto_215980 ?auto_215979 ?auto_215978 ?auto_215977 )
      ( MAKE-5PILE ?auto_215975 ?auto_215976 ?auto_215977 ?auto_215978 ?auto_215979 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215984 - BLOCK
      ?auto_215985 - BLOCK
      ?auto_215986 - BLOCK
      ?auto_215987 - BLOCK
      ?auto_215988 - BLOCK
    )
    :vars
    (
      ?auto_215989 - BLOCK
      ?auto_215992 - BLOCK
      ?auto_215991 - BLOCK
      ?auto_215990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215984 ?auto_215985 ) ) ( not ( = ?auto_215984 ?auto_215986 ) ) ( not ( = ?auto_215984 ?auto_215987 ) ) ( not ( = ?auto_215984 ?auto_215988 ) ) ( not ( = ?auto_215985 ?auto_215986 ) ) ( not ( = ?auto_215985 ?auto_215987 ) ) ( not ( = ?auto_215985 ?auto_215988 ) ) ( not ( = ?auto_215986 ?auto_215987 ) ) ( not ( = ?auto_215986 ?auto_215988 ) ) ( not ( = ?auto_215987 ?auto_215988 ) ) ( ON ?auto_215988 ?auto_215989 ) ( not ( = ?auto_215984 ?auto_215989 ) ) ( not ( = ?auto_215985 ?auto_215989 ) ) ( not ( = ?auto_215986 ?auto_215989 ) ) ( not ( = ?auto_215987 ?auto_215989 ) ) ( not ( = ?auto_215988 ?auto_215989 ) ) ( ON ?auto_215987 ?auto_215988 ) ( ON-TABLE ?auto_215992 ) ( ON ?auto_215991 ?auto_215992 ) ( ON ?auto_215989 ?auto_215991 ) ( not ( = ?auto_215992 ?auto_215991 ) ) ( not ( = ?auto_215992 ?auto_215989 ) ) ( not ( = ?auto_215992 ?auto_215988 ) ) ( not ( = ?auto_215992 ?auto_215987 ) ) ( not ( = ?auto_215991 ?auto_215989 ) ) ( not ( = ?auto_215991 ?auto_215988 ) ) ( not ( = ?auto_215991 ?auto_215987 ) ) ( not ( = ?auto_215984 ?auto_215992 ) ) ( not ( = ?auto_215984 ?auto_215991 ) ) ( not ( = ?auto_215985 ?auto_215992 ) ) ( not ( = ?auto_215985 ?auto_215991 ) ) ( not ( = ?auto_215986 ?auto_215992 ) ) ( not ( = ?auto_215986 ?auto_215991 ) ) ( ON ?auto_215984 ?auto_215990 ) ( not ( = ?auto_215984 ?auto_215990 ) ) ( not ( = ?auto_215985 ?auto_215990 ) ) ( not ( = ?auto_215986 ?auto_215990 ) ) ( not ( = ?auto_215987 ?auto_215990 ) ) ( not ( = ?auto_215988 ?auto_215990 ) ) ( not ( = ?auto_215989 ?auto_215990 ) ) ( not ( = ?auto_215992 ?auto_215990 ) ) ( not ( = ?auto_215991 ?auto_215990 ) ) ( ON ?auto_215985 ?auto_215984 ) ( ON-TABLE ?auto_215990 ) ( CLEAR ?auto_215987 ) ( ON ?auto_215986 ?auto_215985 ) ( CLEAR ?auto_215986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215990 ?auto_215984 ?auto_215985 )
      ( MAKE-5PILE ?auto_215984 ?auto_215985 ?auto_215986 ?auto_215987 ?auto_215988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_215993 - BLOCK
      ?auto_215994 - BLOCK
      ?auto_215995 - BLOCK
      ?auto_215996 - BLOCK
      ?auto_215997 - BLOCK
    )
    :vars
    (
      ?auto_215998 - BLOCK
      ?auto_215999 - BLOCK
      ?auto_216000 - BLOCK
      ?auto_216001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215993 ?auto_215994 ) ) ( not ( = ?auto_215993 ?auto_215995 ) ) ( not ( = ?auto_215993 ?auto_215996 ) ) ( not ( = ?auto_215993 ?auto_215997 ) ) ( not ( = ?auto_215994 ?auto_215995 ) ) ( not ( = ?auto_215994 ?auto_215996 ) ) ( not ( = ?auto_215994 ?auto_215997 ) ) ( not ( = ?auto_215995 ?auto_215996 ) ) ( not ( = ?auto_215995 ?auto_215997 ) ) ( not ( = ?auto_215996 ?auto_215997 ) ) ( ON ?auto_215997 ?auto_215998 ) ( not ( = ?auto_215993 ?auto_215998 ) ) ( not ( = ?auto_215994 ?auto_215998 ) ) ( not ( = ?auto_215995 ?auto_215998 ) ) ( not ( = ?auto_215996 ?auto_215998 ) ) ( not ( = ?auto_215997 ?auto_215998 ) ) ( ON-TABLE ?auto_215999 ) ( ON ?auto_216000 ?auto_215999 ) ( ON ?auto_215998 ?auto_216000 ) ( not ( = ?auto_215999 ?auto_216000 ) ) ( not ( = ?auto_215999 ?auto_215998 ) ) ( not ( = ?auto_215999 ?auto_215997 ) ) ( not ( = ?auto_215999 ?auto_215996 ) ) ( not ( = ?auto_216000 ?auto_215998 ) ) ( not ( = ?auto_216000 ?auto_215997 ) ) ( not ( = ?auto_216000 ?auto_215996 ) ) ( not ( = ?auto_215993 ?auto_215999 ) ) ( not ( = ?auto_215993 ?auto_216000 ) ) ( not ( = ?auto_215994 ?auto_215999 ) ) ( not ( = ?auto_215994 ?auto_216000 ) ) ( not ( = ?auto_215995 ?auto_215999 ) ) ( not ( = ?auto_215995 ?auto_216000 ) ) ( ON ?auto_215993 ?auto_216001 ) ( not ( = ?auto_215993 ?auto_216001 ) ) ( not ( = ?auto_215994 ?auto_216001 ) ) ( not ( = ?auto_215995 ?auto_216001 ) ) ( not ( = ?auto_215996 ?auto_216001 ) ) ( not ( = ?auto_215997 ?auto_216001 ) ) ( not ( = ?auto_215998 ?auto_216001 ) ) ( not ( = ?auto_215999 ?auto_216001 ) ) ( not ( = ?auto_216000 ?auto_216001 ) ) ( ON ?auto_215994 ?auto_215993 ) ( ON-TABLE ?auto_216001 ) ( ON ?auto_215995 ?auto_215994 ) ( CLEAR ?auto_215995 ) ( HOLDING ?auto_215996 ) ( CLEAR ?auto_215997 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215999 ?auto_216000 ?auto_215998 ?auto_215997 ?auto_215996 )
      ( MAKE-5PILE ?auto_215993 ?auto_215994 ?auto_215995 ?auto_215996 ?auto_215997 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216002 - BLOCK
      ?auto_216003 - BLOCK
      ?auto_216004 - BLOCK
      ?auto_216005 - BLOCK
      ?auto_216006 - BLOCK
    )
    :vars
    (
      ?auto_216007 - BLOCK
      ?auto_216008 - BLOCK
      ?auto_216010 - BLOCK
      ?auto_216009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216002 ?auto_216003 ) ) ( not ( = ?auto_216002 ?auto_216004 ) ) ( not ( = ?auto_216002 ?auto_216005 ) ) ( not ( = ?auto_216002 ?auto_216006 ) ) ( not ( = ?auto_216003 ?auto_216004 ) ) ( not ( = ?auto_216003 ?auto_216005 ) ) ( not ( = ?auto_216003 ?auto_216006 ) ) ( not ( = ?auto_216004 ?auto_216005 ) ) ( not ( = ?auto_216004 ?auto_216006 ) ) ( not ( = ?auto_216005 ?auto_216006 ) ) ( ON ?auto_216006 ?auto_216007 ) ( not ( = ?auto_216002 ?auto_216007 ) ) ( not ( = ?auto_216003 ?auto_216007 ) ) ( not ( = ?auto_216004 ?auto_216007 ) ) ( not ( = ?auto_216005 ?auto_216007 ) ) ( not ( = ?auto_216006 ?auto_216007 ) ) ( ON-TABLE ?auto_216008 ) ( ON ?auto_216010 ?auto_216008 ) ( ON ?auto_216007 ?auto_216010 ) ( not ( = ?auto_216008 ?auto_216010 ) ) ( not ( = ?auto_216008 ?auto_216007 ) ) ( not ( = ?auto_216008 ?auto_216006 ) ) ( not ( = ?auto_216008 ?auto_216005 ) ) ( not ( = ?auto_216010 ?auto_216007 ) ) ( not ( = ?auto_216010 ?auto_216006 ) ) ( not ( = ?auto_216010 ?auto_216005 ) ) ( not ( = ?auto_216002 ?auto_216008 ) ) ( not ( = ?auto_216002 ?auto_216010 ) ) ( not ( = ?auto_216003 ?auto_216008 ) ) ( not ( = ?auto_216003 ?auto_216010 ) ) ( not ( = ?auto_216004 ?auto_216008 ) ) ( not ( = ?auto_216004 ?auto_216010 ) ) ( ON ?auto_216002 ?auto_216009 ) ( not ( = ?auto_216002 ?auto_216009 ) ) ( not ( = ?auto_216003 ?auto_216009 ) ) ( not ( = ?auto_216004 ?auto_216009 ) ) ( not ( = ?auto_216005 ?auto_216009 ) ) ( not ( = ?auto_216006 ?auto_216009 ) ) ( not ( = ?auto_216007 ?auto_216009 ) ) ( not ( = ?auto_216008 ?auto_216009 ) ) ( not ( = ?auto_216010 ?auto_216009 ) ) ( ON ?auto_216003 ?auto_216002 ) ( ON-TABLE ?auto_216009 ) ( ON ?auto_216004 ?auto_216003 ) ( CLEAR ?auto_216006 ) ( ON ?auto_216005 ?auto_216004 ) ( CLEAR ?auto_216005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216009 ?auto_216002 ?auto_216003 ?auto_216004 )
      ( MAKE-5PILE ?auto_216002 ?auto_216003 ?auto_216004 ?auto_216005 ?auto_216006 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216011 - BLOCK
      ?auto_216012 - BLOCK
      ?auto_216013 - BLOCK
      ?auto_216014 - BLOCK
      ?auto_216015 - BLOCK
    )
    :vars
    (
      ?auto_216018 - BLOCK
      ?auto_216017 - BLOCK
      ?auto_216016 - BLOCK
      ?auto_216019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216011 ?auto_216012 ) ) ( not ( = ?auto_216011 ?auto_216013 ) ) ( not ( = ?auto_216011 ?auto_216014 ) ) ( not ( = ?auto_216011 ?auto_216015 ) ) ( not ( = ?auto_216012 ?auto_216013 ) ) ( not ( = ?auto_216012 ?auto_216014 ) ) ( not ( = ?auto_216012 ?auto_216015 ) ) ( not ( = ?auto_216013 ?auto_216014 ) ) ( not ( = ?auto_216013 ?auto_216015 ) ) ( not ( = ?auto_216014 ?auto_216015 ) ) ( not ( = ?auto_216011 ?auto_216018 ) ) ( not ( = ?auto_216012 ?auto_216018 ) ) ( not ( = ?auto_216013 ?auto_216018 ) ) ( not ( = ?auto_216014 ?auto_216018 ) ) ( not ( = ?auto_216015 ?auto_216018 ) ) ( ON-TABLE ?auto_216017 ) ( ON ?auto_216016 ?auto_216017 ) ( ON ?auto_216018 ?auto_216016 ) ( not ( = ?auto_216017 ?auto_216016 ) ) ( not ( = ?auto_216017 ?auto_216018 ) ) ( not ( = ?auto_216017 ?auto_216015 ) ) ( not ( = ?auto_216017 ?auto_216014 ) ) ( not ( = ?auto_216016 ?auto_216018 ) ) ( not ( = ?auto_216016 ?auto_216015 ) ) ( not ( = ?auto_216016 ?auto_216014 ) ) ( not ( = ?auto_216011 ?auto_216017 ) ) ( not ( = ?auto_216011 ?auto_216016 ) ) ( not ( = ?auto_216012 ?auto_216017 ) ) ( not ( = ?auto_216012 ?auto_216016 ) ) ( not ( = ?auto_216013 ?auto_216017 ) ) ( not ( = ?auto_216013 ?auto_216016 ) ) ( ON ?auto_216011 ?auto_216019 ) ( not ( = ?auto_216011 ?auto_216019 ) ) ( not ( = ?auto_216012 ?auto_216019 ) ) ( not ( = ?auto_216013 ?auto_216019 ) ) ( not ( = ?auto_216014 ?auto_216019 ) ) ( not ( = ?auto_216015 ?auto_216019 ) ) ( not ( = ?auto_216018 ?auto_216019 ) ) ( not ( = ?auto_216017 ?auto_216019 ) ) ( not ( = ?auto_216016 ?auto_216019 ) ) ( ON ?auto_216012 ?auto_216011 ) ( ON-TABLE ?auto_216019 ) ( ON ?auto_216013 ?auto_216012 ) ( ON ?auto_216014 ?auto_216013 ) ( CLEAR ?auto_216014 ) ( HOLDING ?auto_216015 ) ( CLEAR ?auto_216018 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216017 ?auto_216016 ?auto_216018 ?auto_216015 )
      ( MAKE-5PILE ?auto_216011 ?auto_216012 ?auto_216013 ?auto_216014 ?auto_216015 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216020 - BLOCK
      ?auto_216021 - BLOCK
      ?auto_216022 - BLOCK
      ?auto_216023 - BLOCK
      ?auto_216024 - BLOCK
    )
    :vars
    (
      ?auto_216027 - BLOCK
      ?auto_216026 - BLOCK
      ?auto_216025 - BLOCK
      ?auto_216028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216020 ?auto_216021 ) ) ( not ( = ?auto_216020 ?auto_216022 ) ) ( not ( = ?auto_216020 ?auto_216023 ) ) ( not ( = ?auto_216020 ?auto_216024 ) ) ( not ( = ?auto_216021 ?auto_216022 ) ) ( not ( = ?auto_216021 ?auto_216023 ) ) ( not ( = ?auto_216021 ?auto_216024 ) ) ( not ( = ?auto_216022 ?auto_216023 ) ) ( not ( = ?auto_216022 ?auto_216024 ) ) ( not ( = ?auto_216023 ?auto_216024 ) ) ( not ( = ?auto_216020 ?auto_216027 ) ) ( not ( = ?auto_216021 ?auto_216027 ) ) ( not ( = ?auto_216022 ?auto_216027 ) ) ( not ( = ?auto_216023 ?auto_216027 ) ) ( not ( = ?auto_216024 ?auto_216027 ) ) ( ON-TABLE ?auto_216026 ) ( ON ?auto_216025 ?auto_216026 ) ( ON ?auto_216027 ?auto_216025 ) ( not ( = ?auto_216026 ?auto_216025 ) ) ( not ( = ?auto_216026 ?auto_216027 ) ) ( not ( = ?auto_216026 ?auto_216024 ) ) ( not ( = ?auto_216026 ?auto_216023 ) ) ( not ( = ?auto_216025 ?auto_216027 ) ) ( not ( = ?auto_216025 ?auto_216024 ) ) ( not ( = ?auto_216025 ?auto_216023 ) ) ( not ( = ?auto_216020 ?auto_216026 ) ) ( not ( = ?auto_216020 ?auto_216025 ) ) ( not ( = ?auto_216021 ?auto_216026 ) ) ( not ( = ?auto_216021 ?auto_216025 ) ) ( not ( = ?auto_216022 ?auto_216026 ) ) ( not ( = ?auto_216022 ?auto_216025 ) ) ( ON ?auto_216020 ?auto_216028 ) ( not ( = ?auto_216020 ?auto_216028 ) ) ( not ( = ?auto_216021 ?auto_216028 ) ) ( not ( = ?auto_216022 ?auto_216028 ) ) ( not ( = ?auto_216023 ?auto_216028 ) ) ( not ( = ?auto_216024 ?auto_216028 ) ) ( not ( = ?auto_216027 ?auto_216028 ) ) ( not ( = ?auto_216026 ?auto_216028 ) ) ( not ( = ?auto_216025 ?auto_216028 ) ) ( ON ?auto_216021 ?auto_216020 ) ( ON-TABLE ?auto_216028 ) ( ON ?auto_216022 ?auto_216021 ) ( ON ?auto_216023 ?auto_216022 ) ( CLEAR ?auto_216027 ) ( ON ?auto_216024 ?auto_216023 ) ( CLEAR ?auto_216024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216028 ?auto_216020 ?auto_216021 ?auto_216022 ?auto_216023 )
      ( MAKE-5PILE ?auto_216020 ?auto_216021 ?auto_216022 ?auto_216023 ?auto_216024 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216029 - BLOCK
      ?auto_216030 - BLOCK
      ?auto_216031 - BLOCK
      ?auto_216032 - BLOCK
      ?auto_216033 - BLOCK
    )
    :vars
    (
      ?auto_216034 - BLOCK
      ?auto_216035 - BLOCK
      ?auto_216036 - BLOCK
      ?auto_216037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216029 ?auto_216030 ) ) ( not ( = ?auto_216029 ?auto_216031 ) ) ( not ( = ?auto_216029 ?auto_216032 ) ) ( not ( = ?auto_216029 ?auto_216033 ) ) ( not ( = ?auto_216030 ?auto_216031 ) ) ( not ( = ?auto_216030 ?auto_216032 ) ) ( not ( = ?auto_216030 ?auto_216033 ) ) ( not ( = ?auto_216031 ?auto_216032 ) ) ( not ( = ?auto_216031 ?auto_216033 ) ) ( not ( = ?auto_216032 ?auto_216033 ) ) ( not ( = ?auto_216029 ?auto_216034 ) ) ( not ( = ?auto_216030 ?auto_216034 ) ) ( not ( = ?auto_216031 ?auto_216034 ) ) ( not ( = ?auto_216032 ?auto_216034 ) ) ( not ( = ?auto_216033 ?auto_216034 ) ) ( ON-TABLE ?auto_216035 ) ( ON ?auto_216036 ?auto_216035 ) ( not ( = ?auto_216035 ?auto_216036 ) ) ( not ( = ?auto_216035 ?auto_216034 ) ) ( not ( = ?auto_216035 ?auto_216033 ) ) ( not ( = ?auto_216035 ?auto_216032 ) ) ( not ( = ?auto_216036 ?auto_216034 ) ) ( not ( = ?auto_216036 ?auto_216033 ) ) ( not ( = ?auto_216036 ?auto_216032 ) ) ( not ( = ?auto_216029 ?auto_216035 ) ) ( not ( = ?auto_216029 ?auto_216036 ) ) ( not ( = ?auto_216030 ?auto_216035 ) ) ( not ( = ?auto_216030 ?auto_216036 ) ) ( not ( = ?auto_216031 ?auto_216035 ) ) ( not ( = ?auto_216031 ?auto_216036 ) ) ( ON ?auto_216029 ?auto_216037 ) ( not ( = ?auto_216029 ?auto_216037 ) ) ( not ( = ?auto_216030 ?auto_216037 ) ) ( not ( = ?auto_216031 ?auto_216037 ) ) ( not ( = ?auto_216032 ?auto_216037 ) ) ( not ( = ?auto_216033 ?auto_216037 ) ) ( not ( = ?auto_216034 ?auto_216037 ) ) ( not ( = ?auto_216035 ?auto_216037 ) ) ( not ( = ?auto_216036 ?auto_216037 ) ) ( ON ?auto_216030 ?auto_216029 ) ( ON-TABLE ?auto_216037 ) ( ON ?auto_216031 ?auto_216030 ) ( ON ?auto_216032 ?auto_216031 ) ( ON ?auto_216033 ?auto_216032 ) ( CLEAR ?auto_216033 ) ( HOLDING ?auto_216034 ) ( CLEAR ?auto_216036 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216035 ?auto_216036 ?auto_216034 )
      ( MAKE-5PILE ?auto_216029 ?auto_216030 ?auto_216031 ?auto_216032 ?auto_216033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216038 - BLOCK
      ?auto_216039 - BLOCK
      ?auto_216040 - BLOCK
      ?auto_216041 - BLOCK
      ?auto_216042 - BLOCK
    )
    :vars
    (
      ?auto_216044 - BLOCK
      ?auto_216043 - BLOCK
      ?auto_216045 - BLOCK
      ?auto_216046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216038 ?auto_216039 ) ) ( not ( = ?auto_216038 ?auto_216040 ) ) ( not ( = ?auto_216038 ?auto_216041 ) ) ( not ( = ?auto_216038 ?auto_216042 ) ) ( not ( = ?auto_216039 ?auto_216040 ) ) ( not ( = ?auto_216039 ?auto_216041 ) ) ( not ( = ?auto_216039 ?auto_216042 ) ) ( not ( = ?auto_216040 ?auto_216041 ) ) ( not ( = ?auto_216040 ?auto_216042 ) ) ( not ( = ?auto_216041 ?auto_216042 ) ) ( not ( = ?auto_216038 ?auto_216044 ) ) ( not ( = ?auto_216039 ?auto_216044 ) ) ( not ( = ?auto_216040 ?auto_216044 ) ) ( not ( = ?auto_216041 ?auto_216044 ) ) ( not ( = ?auto_216042 ?auto_216044 ) ) ( ON-TABLE ?auto_216043 ) ( ON ?auto_216045 ?auto_216043 ) ( not ( = ?auto_216043 ?auto_216045 ) ) ( not ( = ?auto_216043 ?auto_216044 ) ) ( not ( = ?auto_216043 ?auto_216042 ) ) ( not ( = ?auto_216043 ?auto_216041 ) ) ( not ( = ?auto_216045 ?auto_216044 ) ) ( not ( = ?auto_216045 ?auto_216042 ) ) ( not ( = ?auto_216045 ?auto_216041 ) ) ( not ( = ?auto_216038 ?auto_216043 ) ) ( not ( = ?auto_216038 ?auto_216045 ) ) ( not ( = ?auto_216039 ?auto_216043 ) ) ( not ( = ?auto_216039 ?auto_216045 ) ) ( not ( = ?auto_216040 ?auto_216043 ) ) ( not ( = ?auto_216040 ?auto_216045 ) ) ( ON ?auto_216038 ?auto_216046 ) ( not ( = ?auto_216038 ?auto_216046 ) ) ( not ( = ?auto_216039 ?auto_216046 ) ) ( not ( = ?auto_216040 ?auto_216046 ) ) ( not ( = ?auto_216041 ?auto_216046 ) ) ( not ( = ?auto_216042 ?auto_216046 ) ) ( not ( = ?auto_216044 ?auto_216046 ) ) ( not ( = ?auto_216043 ?auto_216046 ) ) ( not ( = ?auto_216045 ?auto_216046 ) ) ( ON ?auto_216039 ?auto_216038 ) ( ON-TABLE ?auto_216046 ) ( ON ?auto_216040 ?auto_216039 ) ( ON ?auto_216041 ?auto_216040 ) ( ON ?auto_216042 ?auto_216041 ) ( CLEAR ?auto_216045 ) ( ON ?auto_216044 ?auto_216042 ) ( CLEAR ?auto_216044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216046 ?auto_216038 ?auto_216039 ?auto_216040 ?auto_216041 ?auto_216042 )
      ( MAKE-5PILE ?auto_216038 ?auto_216039 ?auto_216040 ?auto_216041 ?auto_216042 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216047 - BLOCK
      ?auto_216048 - BLOCK
      ?auto_216049 - BLOCK
      ?auto_216050 - BLOCK
      ?auto_216051 - BLOCK
    )
    :vars
    (
      ?auto_216054 - BLOCK
      ?auto_216053 - BLOCK
      ?auto_216052 - BLOCK
      ?auto_216055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216047 ?auto_216048 ) ) ( not ( = ?auto_216047 ?auto_216049 ) ) ( not ( = ?auto_216047 ?auto_216050 ) ) ( not ( = ?auto_216047 ?auto_216051 ) ) ( not ( = ?auto_216048 ?auto_216049 ) ) ( not ( = ?auto_216048 ?auto_216050 ) ) ( not ( = ?auto_216048 ?auto_216051 ) ) ( not ( = ?auto_216049 ?auto_216050 ) ) ( not ( = ?auto_216049 ?auto_216051 ) ) ( not ( = ?auto_216050 ?auto_216051 ) ) ( not ( = ?auto_216047 ?auto_216054 ) ) ( not ( = ?auto_216048 ?auto_216054 ) ) ( not ( = ?auto_216049 ?auto_216054 ) ) ( not ( = ?auto_216050 ?auto_216054 ) ) ( not ( = ?auto_216051 ?auto_216054 ) ) ( ON-TABLE ?auto_216053 ) ( not ( = ?auto_216053 ?auto_216052 ) ) ( not ( = ?auto_216053 ?auto_216054 ) ) ( not ( = ?auto_216053 ?auto_216051 ) ) ( not ( = ?auto_216053 ?auto_216050 ) ) ( not ( = ?auto_216052 ?auto_216054 ) ) ( not ( = ?auto_216052 ?auto_216051 ) ) ( not ( = ?auto_216052 ?auto_216050 ) ) ( not ( = ?auto_216047 ?auto_216053 ) ) ( not ( = ?auto_216047 ?auto_216052 ) ) ( not ( = ?auto_216048 ?auto_216053 ) ) ( not ( = ?auto_216048 ?auto_216052 ) ) ( not ( = ?auto_216049 ?auto_216053 ) ) ( not ( = ?auto_216049 ?auto_216052 ) ) ( ON ?auto_216047 ?auto_216055 ) ( not ( = ?auto_216047 ?auto_216055 ) ) ( not ( = ?auto_216048 ?auto_216055 ) ) ( not ( = ?auto_216049 ?auto_216055 ) ) ( not ( = ?auto_216050 ?auto_216055 ) ) ( not ( = ?auto_216051 ?auto_216055 ) ) ( not ( = ?auto_216054 ?auto_216055 ) ) ( not ( = ?auto_216053 ?auto_216055 ) ) ( not ( = ?auto_216052 ?auto_216055 ) ) ( ON ?auto_216048 ?auto_216047 ) ( ON-TABLE ?auto_216055 ) ( ON ?auto_216049 ?auto_216048 ) ( ON ?auto_216050 ?auto_216049 ) ( ON ?auto_216051 ?auto_216050 ) ( ON ?auto_216054 ?auto_216051 ) ( CLEAR ?auto_216054 ) ( HOLDING ?auto_216052 ) ( CLEAR ?auto_216053 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216053 ?auto_216052 )
      ( MAKE-5PILE ?auto_216047 ?auto_216048 ?auto_216049 ?auto_216050 ?auto_216051 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216056 - BLOCK
      ?auto_216057 - BLOCK
      ?auto_216058 - BLOCK
      ?auto_216059 - BLOCK
      ?auto_216060 - BLOCK
    )
    :vars
    (
      ?auto_216063 - BLOCK
      ?auto_216061 - BLOCK
      ?auto_216064 - BLOCK
      ?auto_216062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216056 ?auto_216057 ) ) ( not ( = ?auto_216056 ?auto_216058 ) ) ( not ( = ?auto_216056 ?auto_216059 ) ) ( not ( = ?auto_216056 ?auto_216060 ) ) ( not ( = ?auto_216057 ?auto_216058 ) ) ( not ( = ?auto_216057 ?auto_216059 ) ) ( not ( = ?auto_216057 ?auto_216060 ) ) ( not ( = ?auto_216058 ?auto_216059 ) ) ( not ( = ?auto_216058 ?auto_216060 ) ) ( not ( = ?auto_216059 ?auto_216060 ) ) ( not ( = ?auto_216056 ?auto_216063 ) ) ( not ( = ?auto_216057 ?auto_216063 ) ) ( not ( = ?auto_216058 ?auto_216063 ) ) ( not ( = ?auto_216059 ?auto_216063 ) ) ( not ( = ?auto_216060 ?auto_216063 ) ) ( ON-TABLE ?auto_216061 ) ( not ( = ?auto_216061 ?auto_216064 ) ) ( not ( = ?auto_216061 ?auto_216063 ) ) ( not ( = ?auto_216061 ?auto_216060 ) ) ( not ( = ?auto_216061 ?auto_216059 ) ) ( not ( = ?auto_216064 ?auto_216063 ) ) ( not ( = ?auto_216064 ?auto_216060 ) ) ( not ( = ?auto_216064 ?auto_216059 ) ) ( not ( = ?auto_216056 ?auto_216061 ) ) ( not ( = ?auto_216056 ?auto_216064 ) ) ( not ( = ?auto_216057 ?auto_216061 ) ) ( not ( = ?auto_216057 ?auto_216064 ) ) ( not ( = ?auto_216058 ?auto_216061 ) ) ( not ( = ?auto_216058 ?auto_216064 ) ) ( ON ?auto_216056 ?auto_216062 ) ( not ( = ?auto_216056 ?auto_216062 ) ) ( not ( = ?auto_216057 ?auto_216062 ) ) ( not ( = ?auto_216058 ?auto_216062 ) ) ( not ( = ?auto_216059 ?auto_216062 ) ) ( not ( = ?auto_216060 ?auto_216062 ) ) ( not ( = ?auto_216063 ?auto_216062 ) ) ( not ( = ?auto_216061 ?auto_216062 ) ) ( not ( = ?auto_216064 ?auto_216062 ) ) ( ON ?auto_216057 ?auto_216056 ) ( ON-TABLE ?auto_216062 ) ( ON ?auto_216058 ?auto_216057 ) ( ON ?auto_216059 ?auto_216058 ) ( ON ?auto_216060 ?auto_216059 ) ( ON ?auto_216063 ?auto_216060 ) ( CLEAR ?auto_216061 ) ( ON ?auto_216064 ?auto_216063 ) ( CLEAR ?auto_216064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216062 ?auto_216056 ?auto_216057 ?auto_216058 ?auto_216059 ?auto_216060 ?auto_216063 )
      ( MAKE-5PILE ?auto_216056 ?auto_216057 ?auto_216058 ?auto_216059 ?auto_216060 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216065 - BLOCK
      ?auto_216066 - BLOCK
      ?auto_216067 - BLOCK
      ?auto_216068 - BLOCK
      ?auto_216069 - BLOCK
    )
    :vars
    (
      ?auto_216070 - BLOCK
      ?auto_216073 - BLOCK
      ?auto_216071 - BLOCK
      ?auto_216072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216065 ?auto_216066 ) ) ( not ( = ?auto_216065 ?auto_216067 ) ) ( not ( = ?auto_216065 ?auto_216068 ) ) ( not ( = ?auto_216065 ?auto_216069 ) ) ( not ( = ?auto_216066 ?auto_216067 ) ) ( not ( = ?auto_216066 ?auto_216068 ) ) ( not ( = ?auto_216066 ?auto_216069 ) ) ( not ( = ?auto_216067 ?auto_216068 ) ) ( not ( = ?auto_216067 ?auto_216069 ) ) ( not ( = ?auto_216068 ?auto_216069 ) ) ( not ( = ?auto_216065 ?auto_216070 ) ) ( not ( = ?auto_216066 ?auto_216070 ) ) ( not ( = ?auto_216067 ?auto_216070 ) ) ( not ( = ?auto_216068 ?auto_216070 ) ) ( not ( = ?auto_216069 ?auto_216070 ) ) ( not ( = ?auto_216073 ?auto_216071 ) ) ( not ( = ?auto_216073 ?auto_216070 ) ) ( not ( = ?auto_216073 ?auto_216069 ) ) ( not ( = ?auto_216073 ?auto_216068 ) ) ( not ( = ?auto_216071 ?auto_216070 ) ) ( not ( = ?auto_216071 ?auto_216069 ) ) ( not ( = ?auto_216071 ?auto_216068 ) ) ( not ( = ?auto_216065 ?auto_216073 ) ) ( not ( = ?auto_216065 ?auto_216071 ) ) ( not ( = ?auto_216066 ?auto_216073 ) ) ( not ( = ?auto_216066 ?auto_216071 ) ) ( not ( = ?auto_216067 ?auto_216073 ) ) ( not ( = ?auto_216067 ?auto_216071 ) ) ( ON ?auto_216065 ?auto_216072 ) ( not ( = ?auto_216065 ?auto_216072 ) ) ( not ( = ?auto_216066 ?auto_216072 ) ) ( not ( = ?auto_216067 ?auto_216072 ) ) ( not ( = ?auto_216068 ?auto_216072 ) ) ( not ( = ?auto_216069 ?auto_216072 ) ) ( not ( = ?auto_216070 ?auto_216072 ) ) ( not ( = ?auto_216073 ?auto_216072 ) ) ( not ( = ?auto_216071 ?auto_216072 ) ) ( ON ?auto_216066 ?auto_216065 ) ( ON-TABLE ?auto_216072 ) ( ON ?auto_216067 ?auto_216066 ) ( ON ?auto_216068 ?auto_216067 ) ( ON ?auto_216069 ?auto_216068 ) ( ON ?auto_216070 ?auto_216069 ) ( ON ?auto_216071 ?auto_216070 ) ( CLEAR ?auto_216071 ) ( HOLDING ?auto_216073 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216073 )
      ( MAKE-5PILE ?auto_216065 ?auto_216066 ?auto_216067 ?auto_216068 ?auto_216069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216074 - BLOCK
      ?auto_216075 - BLOCK
      ?auto_216076 - BLOCK
      ?auto_216077 - BLOCK
      ?auto_216078 - BLOCK
    )
    :vars
    (
      ?auto_216080 - BLOCK
      ?auto_216079 - BLOCK
      ?auto_216081 - BLOCK
      ?auto_216082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216074 ?auto_216075 ) ) ( not ( = ?auto_216074 ?auto_216076 ) ) ( not ( = ?auto_216074 ?auto_216077 ) ) ( not ( = ?auto_216074 ?auto_216078 ) ) ( not ( = ?auto_216075 ?auto_216076 ) ) ( not ( = ?auto_216075 ?auto_216077 ) ) ( not ( = ?auto_216075 ?auto_216078 ) ) ( not ( = ?auto_216076 ?auto_216077 ) ) ( not ( = ?auto_216076 ?auto_216078 ) ) ( not ( = ?auto_216077 ?auto_216078 ) ) ( not ( = ?auto_216074 ?auto_216080 ) ) ( not ( = ?auto_216075 ?auto_216080 ) ) ( not ( = ?auto_216076 ?auto_216080 ) ) ( not ( = ?auto_216077 ?auto_216080 ) ) ( not ( = ?auto_216078 ?auto_216080 ) ) ( not ( = ?auto_216079 ?auto_216081 ) ) ( not ( = ?auto_216079 ?auto_216080 ) ) ( not ( = ?auto_216079 ?auto_216078 ) ) ( not ( = ?auto_216079 ?auto_216077 ) ) ( not ( = ?auto_216081 ?auto_216080 ) ) ( not ( = ?auto_216081 ?auto_216078 ) ) ( not ( = ?auto_216081 ?auto_216077 ) ) ( not ( = ?auto_216074 ?auto_216079 ) ) ( not ( = ?auto_216074 ?auto_216081 ) ) ( not ( = ?auto_216075 ?auto_216079 ) ) ( not ( = ?auto_216075 ?auto_216081 ) ) ( not ( = ?auto_216076 ?auto_216079 ) ) ( not ( = ?auto_216076 ?auto_216081 ) ) ( ON ?auto_216074 ?auto_216082 ) ( not ( = ?auto_216074 ?auto_216082 ) ) ( not ( = ?auto_216075 ?auto_216082 ) ) ( not ( = ?auto_216076 ?auto_216082 ) ) ( not ( = ?auto_216077 ?auto_216082 ) ) ( not ( = ?auto_216078 ?auto_216082 ) ) ( not ( = ?auto_216080 ?auto_216082 ) ) ( not ( = ?auto_216079 ?auto_216082 ) ) ( not ( = ?auto_216081 ?auto_216082 ) ) ( ON ?auto_216075 ?auto_216074 ) ( ON-TABLE ?auto_216082 ) ( ON ?auto_216076 ?auto_216075 ) ( ON ?auto_216077 ?auto_216076 ) ( ON ?auto_216078 ?auto_216077 ) ( ON ?auto_216080 ?auto_216078 ) ( ON ?auto_216081 ?auto_216080 ) ( ON ?auto_216079 ?auto_216081 ) ( CLEAR ?auto_216079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_216082 ?auto_216074 ?auto_216075 ?auto_216076 ?auto_216077 ?auto_216078 ?auto_216080 ?auto_216081 )
      ( MAKE-5PILE ?auto_216074 ?auto_216075 ?auto_216076 ?auto_216077 ?auto_216078 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216085 - BLOCK
      ?auto_216086 - BLOCK
    )
    :vars
    (
      ?auto_216087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216087 ?auto_216086 ) ( CLEAR ?auto_216087 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216085 ) ( ON ?auto_216086 ?auto_216085 ) ( not ( = ?auto_216085 ?auto_216086 ) ) ( not ( = ?auto_216085 ?auto_216087 ) ) ( not ( = ?auto_216086 ?auto_216087 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216087 ?auto_216086 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216088 - BLOCK
      ?auto_216089 - BLOCK
    )
    :vars
    (
      ?auto_216090 - BLOCK
      ?auto_216091 - BLOCK
      ?auto_216092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216090 ?auto_216089 ) ( CLEAR ?auto_216090 ) ( ON-TABLE ?auto_216088 ) ( ON ?auto_216089 ?auto_216088 ) ( not ( = ?auto_216088 ?auto_216089 ) ) ( not ( = ?auto_216088 ?auto_216090 ) ) ( not ( = ?auto_216089 ?auto_216090 ) ) ( HOLDING ?auto_216091 ) ( CLEAR ?auto_216092 ) ( not ( = ?auto_216088 ?auto_216091 ) ) ( not ( = ?auto_216088 ?auto_216092 ) ) ( not ( = ?auto_216089 ?auto_216091 ) ) ( not ( = ?auto_216089 ?auto_216092 ) ) ( not ( = ?auto_216090 ?auto_216091 ) ) ( not ( = ?auto_216090 ?auto_216092 ) ) ( not ( = ?auto_216091 ?auto_216092 ) ) )
    :subtasks
    ( ( !STACK ?auto_216091 ?auto_216092 )
      ( MAKE-2PILE ?auto_216088 ?auto_216089 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216093 - BLOCK
      ?auto_216094 - BLOCK
    )
    :vars
    (
      ?auto_216095 - BLOCK
      ?auto_216097 - BLOCK
      ?auto_216096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216095 ?auto_216094 ) ( ON-TABLE ?auto_216093 ) ( ON ?auto_216094 ?auto_216093 ) ( not ( = ?auto_216093 ?auto_216094 ) ) ( not ( = ?auto_216093 ?auto_216095 ) ) ( not ( = ?auto_216094 ?auto_216095 ) ) ( CLEAR ?auto_216097 ) ( not ( = ?auto_216093 ?auto_216096 ) ) ( not ( = ?auto_216093 ?auto_216097 ) ) ( not ( = ?auto_216094 ?auto_216096 ) ) ( not ( = ?auto_216094 ?auto_216097 ) ) ( not ( = ?auto_216095 ?auto_216096 ) ) ( not ( = ?auto_216095 ?auto_216097 ) ) ( not ( = ?auto_216096 ?auto_216097 ) ) ( ON ?auto_216096 ?auto_216095 ) ( CLEAR ?auto_216096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216093 ?auto_216094 ?auto_216095 )
      ( MAKE-2PILE ?auto_216093 ?auto_216094 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216098 - BLOCK
      ?auto_216099 - BLOCK
    )
    :vars
    (
      ?auto_216100 - BLOCK
      ?auto_216101 - BLOCK
      ?auto_216102 - BLOCK
      ?auto_216105 - BLOCK
      ?auto_216104 - BLOCK
      ?auto_216103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216100 ?auto_216099 ) ( ON-TABLE ?auto_216098 ) ( ON ?auto_216099 ?auto_216098 ) ( not ( = ?auto_216098 ?auto_216099 ) ) ( not ( = ?auto_216098 ?auto_216100 ) ) ( not ( = ?auto_216099 ?auto_216100 ) ) ( not ( = ?auto_216098 ?auto_216101 ) ) ( not ( = ?auto_216098 ?auto_216102 ) ) ( not ( = ?auto_216099 ?auto_216101 ) ) ( not ( = ?auto_216099 ?auto_216102 ) ) ( not ( = ?auto_216100 ?auto_216101 ) ) ( not ( = ?auto_216100 ?auto_216102 ) ) ( not ( = ?auto_216101 ?auto_216102 ) ) ( ON ?auto_216101 ?auto_216100 ) ( CLEAR ?auto_216101 ) ( HOLDING ?auto_216102 ) ( CLEAR ?auto_216105 ) ( ON-TABLE ?auto_216104 ) ( ON ?auto_216103 ?auto_216104 ) ( ON ?auto_216105 ?auto_216103 ) ( not ( = ?auto_216104 ?auto_216103 ) ) ( not ( = ?auto_216104 ?auto_216105 ) ) ( not ( = ?auto_216104 ?auto_216102 ) ) ( not ( = ?auto_216103 ?auto_216105 ) ) ( not ( = ?auto_216103 ?auto_216102 ) ) ( not ( = ?auto_216105 ?auto_216102 ) ) ( not ( = ?auto_216098 ?auto_216105 ) ) ( not ( = ?auto_216098 ?auto_216104 ) ) ( not ( = ?auto_216098 ?auto_216103 ) ) ( not ( = ?auto_216099 ?auto_216105 ) ) ( not ( = ?auto_216099 ?auto_216104 ) ) ( not ( = ?auto_216099 ?auto_216103 ) ) ( not ( = ?auto_216100 ?auto_216105 ) ) ( not ( = ?auto_216100 ?auto_216104 ) ) ( not ( = ?auto_216100 ?auto_216103 ) ) ( not ( = ?auto_216101 ?auto_216105 ) ) ( not ( = ?auto_216101 ?auto_216104 ) ) ( not ( = ?auto_216101 ?auto_216103 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216104 ?auto_216103 ?auto_216105 ?auto_216102 )
      ( MAKE-2PILE ?auto_216098 ?auto_216099 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216106 - BLOCK
      ?auto_216107 - BLOCK
    )
    :vars
    (
      ?auto_216109 - BLOCK
      ?auto_216110 - BLOCK
      ?auto_216111 - BLOCK
      ?auto_216113 - BLOCK
      ?auto_216112 - BLOCK
      ?auto_216108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216109 ?auto_216107 ) ( ON-TABLE ?auto_216106 ) ( ON ?auto_216107 ?auto_216106 ) ( not ( = ?auto_216106 ?auto_216107 ) ) ( not ( = ?auto_216106 ?auto_216109 ) ) ( not ( = ?auto_216107 ?auto_216109 ) ) ( not ( = ?auto_216106 ?auto_216110 ) ) ( not ( = ?auto_216106 ?auto_216111 ) ) ( not ( = ?auto_216107 ?auto_216110 ) ) ( not ( = ?auto_216107 ?auto_216111 ) ) ( not ( = ?auto_216109 ?auto_216110 ) ) ( not ( = ?auto_216109 ?auto_216111 ) ) ( not ( = ?auto_216110 ?auto_216111 ) ) ( ON ?auto_216110 ?auto_216109 ) ( CLEAR ?auto_216113 ) ( ON-TABLE ?auto_216112 ) ( ON ?auto_216108 ?auto_216112 ) ( ON ?auto_216113 ?auto_216108 ) ( not ( = ?auto_216112 ?auto_216108 ) ) ( not ( = ?auto_216112 ?auto_216113 ) ) ( not ( = ?auto_216112 ?auto_216111 ) ) ( not ( = ?auto_216108 ?auto_216113 ) ) ( not ( = ?auto_216108 ?auto_216111 ) ) ( not ( = ?auto_216113 ?auto_216111 ) ) ( not ( = ?auto_216106 ?auto_216113 ) ) ( not ( = ?auto_216106 ?auto_216112 ) ) ( not ( = ?auto_216106 ?auto_216108 ) ) ( not ( = ?auto_216107 ?auto_216113 ) ) ( not ( = ?auto_216107 ?auto_216112 ) ) ( not ( = ?auto_216107 ?auto_216108 ) ) ( not ( = ?auto_216109 ?auto_216113 ) ) ( not ( = ?auto_216109 ?auto_216112 ) ) ( not ( = ?auto_216109 ?auto_216108 ) ) ( not ( = ?auto_216110 ?auto_216113 ) ) ( not ( = ?auto_216110 ?auto_216112 ) ) ( not ( = ?auto_216110 ?auto_216108 ) ) ( ON ?auto_216111 ?auto_216110 ) ( CLEAR ?auto_216111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216106 ?auto_216107 ?auto_216109 ?auto_216110 )
      ( MAKE-2PILE ?auto_216106 ?auto_216107 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216114 - BLOCK
      ?auto_216115 - BLOCK
    )
    :vars
    (
      ?auto_216120 - BLOCK
      ?auto_216118 - BLOCK
      ?auto_216121 - BLOCK
      ?auto_216119 - BLOCK
      ?auto_216116 - BLOCK
      ?auto_216117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216120 ?auto_216115 ) ( ON-TABLE ?auto_216114 ) ( ON ?auto_216115 ?auto_216114 ) ( not ( = ?auto_216114 ?auto_216115 ) ) ( not ( = ?auto_216114 ?auto_216120 ) ) ( not ( = ?auto_216115 ?auto_216120 ) ) ( not ( = ?auto_216114 ?auto_216118 ) ) ( not ( = ?auto_216114 ?auto_216121 ) ) ( not ( = ?auto_216115 ?auto_216118 ) ) ( not ( = ?auto_216115 ?auto_216121 ) ) ( not ( = ?auto_216120 ?auto_216118 ) ) ( not ( = ?auto_216120 ?auto_216121 ) ) ( not ( = ?auto_216118 ?auto_216121 ) ) ( ON ?auto_216118 ?auto_216120 ) ( ON-TABLE ?auto_216119 ) ( ON ?auto_216116 ?auto_216119 ) ( not ( = ?auto_216119 ?auto_216116 ) ) ( not ( = ?auto_216119 ?auto_216117 ) ) ( not ( = ?auto_216119 ?auto_216121 ) ) ( not ( = ?auto_216116 ?auto_216117 ) ) ( not ( = ?auto_216116 ?auto_216121 ) ) ( not ( = ?auto_216117 ?auto_216121 ) ) ( not ( = ?auto_216114 ?auto_216117 ) ) ( not ( = ?auto_216114 ?auto_216119 ) ) ( not ( = ?auto_216114 ?auto_216116 ) ) ( not ( = ?auto_216115 ?auto_216117 ) ) ( not ( = ?auto_216115 ?auto_216119 ) ) ( not ( = ?auto_216115 ?auto_216116 ) ) ( not ( = ?auto_216120 ?auto_216117 ) ) ( not ( = ?auto_216120 ?auto_216119 ) ) ( not ( = ?auto_216120 ?auto_216116 ) ) ( not ( = ?auto_216118 ?auto_216117 ) ) ( not ( = ?auto_216118 ?auto_216119 ) ) ( not ( = ?auto_216118 ?auto_216116 ) ) ( ON ?auto_216121 ?auto_216118 ) ( CLEAR ?auto_216121 ) ( HOLDING ?auto_216117 ) ( CLEAR ?auto_216116 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216119 ?auto_216116 ?auto_216117 )
      ( MAKE-2PILE ?auto_216114 ?auto_216115 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216122 - BLOCK
      ?auto_216123 - BLOCK
    )
    :vars
    (
      ?auto_216128 - BLOCK
      ?auto_216124 - BLOCK
      ?auto_216126 - BLOCK
      ?auto_216127 - BLOCK
      ?auto_216125 - BLOCK
      ?auto_216129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216128 ?auto_216123 ) ( ON-TABLE ?auto_216122 ) ( ON ?auto_216123 ?auto_216122 ) ( not ( = ?auto_216122 ?auto_216123 ) ) ( not ( = ?auto_216122 ?auto_216128 ) ) ( not ( = ?auto_216123 ?auto_216128 ) ) ( not ( = ?auto_216122 ?auto_216124 ) ) ( not ( = ?auto_216122 ?auto_216126 ) ) ( not ( = ?auto_216123 ?auto_216124 ) ) ( not ( = ?auto_216123 ?auto_216126 ) ) ( not ( = ?auto_216128 ?auto_216124 ) ) ( not ( = ?auto_216128 ?auto_216126 ) ) ( not ( = ?auto_216124 ?auto_216126 ) ) ( ON ?auto_216124 ?auto_216128 ) ( ON-TABLE ?auto_216127 ) ( ON ?auto_216125 ?auto_216127 ) ( not ( = ?auto_216127 ?auto_216125 ) ) ( not ( = ?auto_216127 ?auto_216129 ) ) ( not ( = ?auto_216127 ?auto_216126 ) ) ( not ( = ?auto_216125 ?auto_216129 ) ) ( not ( = ?auto_216125 ?auto_216126 ) ) ( not ( = ?auto_216129 ?auto_216126 ) ) ( not ( = ?auto_216122 ?auto_216129 ) ) ( not ( = ?auto_216122 ?auto_216127 ) ) ( not ( = ?auto_216122 ?auto_216125 ) ) ( not ( = ?auto_216123 ?auto_216129 ) ) ( not ( = ?auto_216123 ?auto_216127 ) ) ( not ( = ?auto_216123 ?auto_216125 ) ) ( not ( = ?auto_216128 ?auto_216129 ) ) ( not ( = ?auto_216128 ?auto_216127 ) ) ( not ( = ?auto_216128 ?auto_216125 ) ) ( not ( = ?auto_216124 ?auto_216129 ) ) ( not ( = ?auto_216124 ?auto_216127 ) ) ( not ( = ?auto_216124 ?auto_216125 ) ) ( ON ?auto_216126 ?auto_216124 ) ( CLEAR ?auto_216125 ) ( ON ?auto_216129 ?auto_216126 ) ( CLEAR ?auto_216129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216122 ?auto_216123 ?auto_216128 ?auto_216124 ?auto_216126 )
      ( MAKE-2PILE ?auto_216122 ?auto_216123 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216130 - BLOCK
      ?auto_216131 - BLOCK
    )
    :vars
    (
      ?auto_216136 - BLOCK
      ?auto_216135 - BLOCK
      ?auto_216132 - BLOCK
      ?auto_216133 - BLOCK
      ?auto_216134 - BLOCK
      ?auto_216137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216136 ?auto_216131 ) ( ON-TABLE ?auto_216130 ) ( ON ?auto_216131 ?auto_216130 ) ( not ( = ?auto_216130 ?auto_216131 ) ) ( not ( = ?auto_216130 ?auto_216136 ) ) ( not ( = ?auto_216131 ?auto_216136 ) ) ( not ( = ?auto_216130 ?auto_216135 ) ) ( not ( = ?auto_216130 ?auto_216132 ) ) ( not ( = ?auto_216131 ?auto_216135 ) ) ( not ( = ?auto_216131 ?auto_216132 ) ) ( not ( = ?auto_216136 ?auto_216135 ) ) ( not ( = ?auto_216136 ?auto_216132 ) ) ( not ( = ?auto_216135 ?auto_216132 ) ) ( ON ?auto_216135 ?auto_216136 ) ( ON-TABLE ?auto_216133 ) ( not ( = ?auto_216133 ?auto_216134 ) ) ( not ( = ?auto_216133 ?auto_216137 ) ) ( not ( = ?auto_216133 ?auto_216132 ) ) ( not ( = ?auto_216134 ?auto_216137 ) ) ( not ( = ?auto_216134 ?auto_216132 ) ) ( not ( = ?auto_216137 ?auto_216132 ) ) ( not ( = ?auto_216130 ?auto_216137 ) ) ( not ( = ?auto_216130 ?auto_216133 ) ) ( not ( = ?auto_216130 ?auto_216134 ) ) ( not ( = ?auto_216131 ?auto_216137 ) ) ( not ( = ?auto_216131 ?auto_216133 ) ) ( not ( = ?auto_216131 ?auto_216134 ) ) ( not ( = ?auto_216136 ?auto_216137 ) ) ( not ( = ?auto_216136 ?auto_216133 ) ) ( not ( = ?auto_216136 ?auto_216134 ) ) ( not ( = ?auto_216135 ?auto_216137 ) ) ( not ( = ?auto_216135 ?auto_216133 ) ) ( not ( = ?auto_216135 ?auto_216134 ) ) ( ON ?auto_216132 ?auto_216135 ) ( ON ?auto_216137 ?auto_216132 ) ( CLEAR ?auto_216137 ) ( HOLDING ?auto_216134 ) ( CLEAR ?auto_216133 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216133 ?auto_216134 )
      ( MAKE-2PILE ?auto_216130 ?auto_216131 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216138 - BLOCK
      ?auto_216139 - BLOCK
    )
    :vars
    (
      ?auto_216141 - BLOCK
      ?auto_216142 - BLOCK
      ?auto_216143 - BLOCK
      ?auto_216145 - BLOCK
      ?auto_216140 - BLOCK
      ?auto_216144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216141 ?auto_216139 ) ( ON-TABLE ?auto_216138 ) ( ON ?auto_216139 ?auto_216138 ) ( not ( = ?auto_216138 ?auto_216139 ) ) ( not ( = ?auto_216138 ?auto_216141 ) ) ( not ( = ?auto_216139 ?auto_216141 ) ) ( not ( = ?auto_216138 ?auto_216142 ) ) ( not ( = ?auto_216138 ?auto_216143 ) ) ( not ( = ?auto_216139 ?auto_216142 ) ) ( not ( = ?auto_216139 ?auto_216143 ) ) ( not ( = ?auto_216141 ?auto_216142 ) ) ( not ( = ?auto_216141 ?auto_216143 ) ) ( not ( = ?auto_216142 ?auto_216143 ) ) ( ON ?auto_216142 ?auto_216141 ) ( ON-TABLE ?auto_216145 ) ( not ( = ?auto_216145 ?auto_216140 ) ) ( not ( = ?auto_216145 ?auto_216144 ) ) ( not ( = ?auto_216145 ?auto_216143 ) ) ( not ( = ?auto_216140 ?auto_216144 ) ) ( not ( = ?auto_216140 ?auto_216143 ) ) ( not ( = ?auto_216144 ?auto_216143 ) ) ( not ( = ?auto_216138 ?auto_216144 ) ) ( not ( = ?auto_216138 ?auto_216145 ) ) ( not ( = ?auto_216138 ?auto_216140 ) ) ( not ( = ?auto_216139 ?auto_216144 ) ) ( not ( = ?auto_216139 ?auto_216145 ) ) ( not ( = ?auto_216139 ?auto_216140 ) ) ( not ( = ?auto_216141 ?auto_216144 ) ) ( not ( = ?auto_216141 ?auto_216145 ) ) ( not ( = ?auto_216141 ?auto_216140 ) ) ( not ( = ?auto_216142 ?auto_216144 ) ) ( not ( = ?auto_216142 ?auto_216145 ) ) ( not ( = ?auto_216142 ?auto_216140 ) ) ( ON ?auto_216143 ?auto_216142 ) ( ON ?auto_216144 ?auto_216143 ) ( CLEAR ?auto_216145 ) ( ON ?auto_216140 ?auto_216144 ) ( CLEAR ?auto_216140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216138 ?auto_216139 ?auto_216141 ?auto_216142 ?auto_216143 ?auto_216144 )
      ( MAKE-2PILE ?auto_216138 ?auto_216139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216146 - BLOCK
      ?auto_216147 - BLOCK
    )
    :vars
    (
      ?auto_216149 - BLOCK
      ?auto_216153 - BLOCK
      ?auto_216152 - BLOCK
      ?auto_216150 - BLOCK
      ?auto_216151 - BLOCK
      ?auto_216148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216149 ?auto_216147 ) ( ON-TABLE ?auto_216146 ) ( ON ?auto_216147 ?auto_216146 ) ( not ( = ?auto_216146 ?auto_216147 ) ) ( not ( = ?auto_216146 ?auto_216149 ) ) ( not ( = ?auto_216147 ?auto_216149 ) ) ( not ( = ?auto_216146 ?auto_216153 ) ) ( not ( = ?auto_216146 ?auto_216152 ) ) ( not ( = ?auto_216147 ?auto_216153 ) ) ( not ( = ?auto_216147 ?auto_216152 ) ) ( not ( = ?auto_216149 ?auto_216153 ) ) ( not ( = ?auto_216149 ?auto_216152 ) ) ( not ( = ?auto_216153 ?auto_216152 ) ) ( ON ?auto_216153 ?auto_216149 ) ( not ( = ?auto_216150 ?auto_216151 ) ) ( not ( = ?auto_216150 ?auto_216148 ) ) ( not ( = ?auto_216150 ?auto_216152 ) ) ( not ( = ?auto_216151 ?auto_216148 ) ) ( not ( = ?auto_216151 ?auto_216152 ) ) ( not ( = ?auto_216148 ?auto_216152 ) ) ( not ( = ?auto_216146 ?auto_216148 ) ) ( not ( = ?auto_216146 ?auto_216150 ) ) ( not ( = ?auto_216146 ?auto_216151 ) ) ( not ( = ?auto_216147 ?auto_216148 ) ) ( not ( = ?auto_216147 ?auto_216150 ) ) ( not ( = ?auto_216147 ?auto_216151 ) ) ( not ( = ?auto_216149 ?auto_216148 ) ) ( not ( = ?auto_216149 ?auto_216150 ) ) ( not ( = ?auto_216149 ?auto_216151 ) ) ( not ( = ?auto_216153 ?auto_216148 ) ) ( not ( = ?auto_216153 ?auto_216150 ) ) ( not ( = ?auto_216153 ?auto_216151 ) ) ( ON ?auto_216152 ?auto_216153 ) ( ON ?auto_216148 ?auto_216152 ) ( ON ?auto_216151 ?auto_216148 ) ( CLEAR ?auto_216151 ) ( HOLDING ?auto_216150 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216150 )
      ( MAKE-2PILE ?auto_216146 ?auto_216147 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216154 - BLOCK
      ?auto_216155 - BLOCK
    )
    :vars
    (
      ?auto_216159 - BLOCK
      ?auto_216157 - BLOCK
      ?auto_216160 - BLOCK
      ?auto_216158 - BLOCK
      ?auto_216161 - BLOCK
      ?auto_216156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216159 ?auto_216155 ) ( ON-TABLE ?auto_216154 ) ( ON ?auto_216155 ?auto_216154 ) ( not ( = ?auto_216154 ?auto_216155 ) ) ( not ( = ?auto_216154 ?auto_216159 ) ) ( not ( = ?auto_216155 ?auto_216159 ) ) ( not ( = ?auto_216154 ?auto_216157 ) ) ( not ( = ?auto_216154 ?auto_216160 ) ) ( not ( = ?auto_216155 ?auto_216157 ) ) ( not ( = ?auto_216155 ?auto_216160 ) ) ( not ( = ?auto_216159 ?auto_216157 ) ) ( not ( = ?auto_216159 ?auto_216160 ) ) ( not ( = ?auto_216157 ?auto_216160 ) ) ( ON ?auto_216157 ?auto_216159 ) ( not ( = ?auto_216158 ?auto_216161 ) ) ( not ( = ?auto_216158 ?auto_216156 ) ) ( not ( = ?auto_216158 ?auto_216160 ) ) ( not ( = ?auto_216161 ?auto_216156 ) ) ( not ( = ?auto_216161 ?auto_216160 ) ) ( not ( = ?auto_216156 ?auto_216160 ) ) ( not ( = ?auto_216154 ?auto_216156 ) ) ( not ( = ?auto_216154 ?auto_216158 ) ) ( not ( = ?auto_216154 ?auto_216161 ) ) ( not ( = ?auto_216155 ?auto_216156 ) ) ( not ( = ?auto_216155 ?auto_216158 ) ) ( not ( = ?auto_216155 ?auto_216161 ) ) ( not ( = ?auto_216159 ?auto_216156 ) ) ( not ( = ?auto_216159 ?auto_216158 ) ) ( not ( = ?auto_216159 ?auto_216161 ) ) ( not ( = ?auto_216157 ?auto_216156 ) ) ( not ( = ?auto_216157 ?auto_216158 ) ) ( not ( = ?auto_216157 ?auto_216161 ) ) ( ON ?auto_216160 ?auto_216157 ) ( ON ?auto_216156 ?auto_216160 ) ( ON ?auto_216161 ?auto_216156 ) ( ON ?auto_216158 ?auto_216161 ) ( CLEAR ?auto_216158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216154 ?auto_216155 ?auto_216159 ?auto_216157 ?auto_216160 ?auto_216156 ?auto_216161 )
      ( MAKE-2PILE ?auto_216154 ?auto_216155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216162 - BLOCK
      ?auto_216163 - BLOCK
    )
    :vars
    (
      ?auto_216167 - BLOCK
      ?auto_216166 - BLOCK
      ?auto_216169 - BLOCK
      ?auto_216168 - BLOCK
      ?auto_216165 - BLOCK
      ?auto_216164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216167 ?auto_216163 ) ( ON-TABLE ?auto_216162 ) ( ON ?auto_216163 ?auto_216162 ) ( not ( = ?auto_216162 ?auto_216163 ) ) ( not ( = ?auto_216162 ?auto_216167 ) ) ( not ( = ?auto_216163 ?auto_216167 ) ) ( not ( = ?auto_216162 ?auto_216166 ) ) ( not ( = ?auto_216162 ?auto_216169 ) ) ( not ( = ?auto_216163 ?auto_216166 ) ) ( not ( = ?auto_216163 ?auto_216169 ) ) ( not ( = ?auto_216167 ?auto_216166 ) ) ( not ( = ?auto_216167 ?auto_216169 ) ) ( not ( = ?auto_216166 ?auto_216169 ) ) ( ON ?auto_216166 ?auto_216167 ) ( not ( = ?auto_216168 ?auto_216165 ) ) ( not ( = ?auto_216168 ?auto_216164 ) ) ( not ( = ?auto_216168 ?auto_216169 ) ) ( not ( = ?auto_216165 ?auto_216164 ) ) ( not ( = ?auto_216165 ?auto_216169 ) ) ( not ( = ?auto_216164 ?auto_216169 ) ) ( not ( = ?auto_216162 ?auto_216164 ) ) ( not ( = ?auto_216162 ?auto_216168 ) ) ( not ( = ?auto_216162 ?auto_216165 ) ) ( not ( = ?auto_216163 ?auto_216164 ) ) ( not ( = ?auto_216163 ?auto_216168 ) ) ( not ( = ?auto_216163 ?auto_216165 ) ) ( not ( = ?auto_216167 ?auto_216164 ) ) ( not ( = ?auto_216167 ?auto_216168 ) ) ( not ( = ?auto_216167 ?auto_216165 ) ) ( not ( = ?auto_216166 ?auto_216164 ) ) ( not ( = ?auto_216166 ?auto_216168 ) ) ( not ( = ?auto_216166 ?auto_216165 ) ) ( ON ?auto_216169 ?auto_216166 ) ( ON ?auto_216164 ?auto_216169 ) ( ON ?auto_216165 ?auto_216164 ) ( HOLDING ?auto_216168 ) ( CLEAR ?auto_216165 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_216162 ?auto_216163 ?auto_216167 ?auto_216166 ?auto_216169 ?auto_216164 ?auto_216165 ?auto_216168 )
      ( MAKE-2PILE ?auto_216162 ?auto_216163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216170 - BLOCK
      ?auto_216171 - BLOCK
    )
    :vars
    (
      ?auto_216174 - BLOCK
      ?auto_216173 - BLOCK
      ?auto_216177 - BLOCK
      ?auto_216176 - BLOCK
      ?auto_216175 - BLOCK
      ?auto_216172 - BLOCK
      ?auto_216178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216174 ?auto_216171 ) ( ON-TABLE ?auto_216170 ) ( ON ?auto_216171 ?auto_216170 ) ( not ( = ?auto_216170 ?auto_216171 ) ) ( not ( = ?auto_216170 ?auto_216174 ) ) ( not ( = ?auto_216171 ?auto_216174 ) ) ( not ( = ?auto_216170 ?auto_216173 ) ) ( not ( = ?auto_216170 ?auto_216177 ) ) ( not ( = ?auto_216171 ?auto_216173 ) ) ( not ( = ?auto_216171 ?auto_216177 ) ) ( not ( = ?auto_216174 ?auto_216173 ) ) ( not ( = ?auto_216174 ?auto_216177 ) ) ( not ( = ?auto_216173 ?auto_216177 ) ) ( ON ?auto_216173 ?auto_216174 ) ( not ( = ?auto_216176 ?auto_216175 ) ) ( not ( = ?auto_216176 ?auto_216172 ) ) ( not ( = ?auto_216176 ?auto_216177 ) ) ( not ( = ?auto_216175 ?auto_216172 ) ) ( not ( = ?auto_216175 ?auto_216177 ) ) ( not ( = ?auto_216172 ?auto_216177 ) ) ( not ( = ?auto_216170 ?auto_216172 ) ) ( not ( = ?auto_216170 ?auto_216176 ) ) ( not ( = ?auto_216170 ?auto_216175 ) ) ( not ( = ?auto_216171 ?auto_216172 ) ) ( not ( = ?auto_216171 ?auto_216176 ) ) ( not ( = ?auto_216171 ?auto_216175 ) ) ( not ( = ?auto_216174 ?auto_216172 ) ) ( not ( = ?auto_216174 ?auto_216176 ) ) ( not ( = ?auto_216174 ?auto_216175 ) ) ( not ( = ?auto_216173 ?auto_216172 ) ) ( not ( = ?auto_216173 ?auto_216176 ) ) ( not ( = ?auto_216173 ?auto_216175 ) ) ( ON ?auto_216177 ?auto_216173 ) ( ON ?auto_216172 ?auto_216177 ) ( ON ?auto_216175 ?auto_216172 ) ( CLEAR ?auto_216175 ) ( ON ?auto_216176 ?auto_216178 ) ( CLEAR ?auto_216176 ) ( HAND-EMPTY ) ( not ( = ?auto_216170 ?auto_216178 ) ) ( not ( = ?auto_216171 ?auto_216178 ) ) ( not ( = ?auto_216174 ?auto_216178 ) ) ( not ( = ?auto_216173 ?auto_216178 ) ) ( not ( = ?auto_216177 ?auto_216178 ) ) ( not ( = ?auto_216176 ?auto_216178 ) ) ( not ( = ?auto_216175 ?auto_216178 ) ) ( not ( = ?auto_216172 ?auto_216178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216176 ?auto_216178 )
      ( MAKE-2PILE ?auto_216170 ?auto_216171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216179 - BLOCK
      ?auto_216180 - BLOCK
    )
    :vars
    (
      ?auto_216187 - BLOCK
      ?auto_216182 - BLOCK
      ?auto_216186 - BLOCK
      ?auto_216185 - BLOCK
      ?auto_216183 - BLOCK
      ?auto_216181 - BLOCK
      ?auto_216184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216187 ?auto_216180 ) ( ON-TABLE ?auto_216179 ) ( ON ?auto_216180 ?auto_216179 ) ( not ( = ?auto_216179 ?auto_216180 ) ) ( not ( = ?auto_216179 ?auto_216187 ) ) ( not ( = ?auto_216180 ?auto_216187 ) ) ( not ( = ?auto_216179 ?auto_216182 ) ) ( not ( = ?auto_216179 ?auto_216186 ) ) ( not ( = ?auto_216180 ?auto_216182 ) ) ( not ( = ?auto_216180 ?auto_216186 ) ) ( not ( = ?auto_216187 ?auto_216182 ) ) ( not ( = ?auto_216187 ?auto_216186 ) ) ( not ( = ?auto_216182 ?auto_216186 ) ) ( ON ?auto_216182 ?auto_216187 ) ( not ( = ?auto_216185 ?auto_216183 ) ) ( not ( = ?auto_216185 ?auto_216181 ) ) ( not ( = ?auto_216185 ?auto_216186 ) ) ( not ( = ?auto_216183 ?auto_216181 ) ) ( not ( = ?auto_216183 ?auto_216186 ) ) ( not ( = ?auto_216181 ?auto_216186 ) ) ( not ( = ?auto_216179 ?auto_216181 ) ) ( not ( = ?auto_216179 ?auto_216185 ) ) ( not ( = ?auto_216179 ?auto_216183 ) ) ( not ( = ?auto_216180 ?auto_216181 ) ) ( not ( = ?auto_216180 ?auto_216185 ) ) ( not ( = ?auto_216180 ?auto_216183 ) ) ( not ( = ?auto_216187 ?auto_216181 ) ) ( not ( = ?auto_216187 ?auto_216185 ) ) ( not ( = ?auto_216187 ?auto_216183 ) ) ( not ( = ?auto_216182 ?auto_216181 ) ) ( not ( = ?auto_216182 ?auto_216185 ) ) ( not ( = ?auto_216182 ?auto_216183 ) ) ( ON ?auto_216186 ?auto_216182 ) ( ON ?auto_216181 ?auto_216186 ) ( ON ?auto_216185 ?auto_216184 ) ( CLEAR ?auto_216185 ) ( not ( = ?auto_216179 ?auto_216184 ) ) ( not ( = ?auto_216180 ?auto_216184 ) ) ( not ( = ?auto_216187 ?auto_216184 ) ) ( not ( = ?auto_216182 ?auto_216184 ) ) ( not ( = ?auto_216186 ?auto_216184 ) ) ( not ( = ?auto_216185 ?auto_216184 ) ) ( not ( = ?auto_216183 ?auto_216184 ) ) ( not ( = ?auto_216181 ?auto_216184 ) ) ( HOLDING ?auto_216183 ) ( CLEAR ?auto_216181 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216179 ?auto_216180 ?auto_216187 ?auto_216182 ?auto_216186 ?auto_216181 ?auto_216183 )
      ( MAKE-2PILE ?auto_216179 ?auto_216180 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216188 - BLOCK
      ?auto_216189 - BLOCK
    )
    :vars
    (
      ?auto_216195 - BLOCK
      ?auto_216196 - BLOCK
      ?auto_216193 - BLOCK
      ?auto_216190 - BLOCK
      ?auto_216194 - BLOCK
      ?auto_216192 - BLOCK
      ?auto_216191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216195 ?auto_216189 ) ( ON-TABLE ?auto_216188 ) ( ON ?auto_216189 ?auto_216188 ) ( not ( = ?auto_216188 ?auto_216189 ) ) ( not ( = ?auto_216188 ?auto_216195 ) ) ( not ( = ?auto_216189 ?auto_216195 ) ) ( not ( = ?auto_216188 ?auto_216196 ) ) ( not ( = ?auto_216188 ?auto_216193 ) ) ( not ( = ?auto_216189 ?auto_216196 ) ) ( not ( = ?auto_216189 ?auto_216193 ) ) ( not ( = ?auto_216195 ?auto_216196 ) ) ( not ( = ?auto_216195 ?auto_216193 ) ) ( not ( = ?auto_216196 ?auto_216193 ) ) ( ON ?auto_216196 ?auto_216195 ) ( not ( = ?auto_216190 ?auto_216194 ) ) ( not ( = ?auto_216190 ?auto_216192 ) ) ( not ( = ?auto_216190 ?auto_216193 ) ) ( not ( = ?auto_216194 ?auto_216192 ) ) ( not ( = ?auto_216194 ?auto_216193 ) ) ( not ( = ?auto_216192 ?auto_216193 ) ) ( not ( = ?auto_216188 ?auto_216192 ) ) ( not ( = ?auto_216188 ?auto_216190 ) ) ( not ( = ?auto_216188 ?auto_216194 ) ) ( not ( = ?auto_216189 ?auto_216192 ) ) ( not ( = ?auto_216189 ?auto_216190 ) ) ( not ( = ?auto_216189 ?auto_216194 ) ) ( not ( = ?auto_216195 ?auto_216192 ) ) ( not ( = ?auto_216195 ?auto_216190 ) ) ( not ( = ?auto_216195 ?auto_216194 ) ) ( not ( = ?auto_216196 ?auto_216192 ) ) ( not ( = ?auto_216196 ?auto_216190 ) ) ( not ( = ?auto_216196 ?auto_216194 ) ) ( ON ?auto_216193 ?auto_216196 ) ( ON ?auto_216192 ?auto_216193 ) ( ON ?auto_216190 ?auto_216191 ) ( not ( = ?auto_216188 ?auto_216191 ) ) ( not ( = ?auto_216189 ?auto_216191 ) ) ( not ( = ?auto_216195 ?auto_216191 ) ) ( not ( = ?auto_216196 ?auto_216191 ) ) ( not ( = ?auto_216193 ?auto_216191 ) ) ( not ( = ?auto_216190 ?auto_216191 ) ) ( not ( = ?auto_216194 ?auto_216191 ) ) ( not ( = ?auto_216192 ?auto_216191 ) ) ( CLEAR ?auto_216192 ) ( ON ?auto_216194 ?auto_216190 ) ( CLEAR ?auto_216194 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216191 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216191 ?auto_216190 )
      ( MAKE-2PILE ?auto_216188 ?auto_216189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216197 - BLOCK
      ?auto_216198 - BLOCK
    )
    :vars
    (
      ?auto_216205 - BLOCK
      ?auto_216201 - BLOCK
      ?auto_216199 - BLOCK
      ?auto_216203 - BLOCK
      ?auto_216204 - BLOCK
      ?auto_216202 - BLOCK
      ?auto_216200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216205 ?auto_216198 ) ( ON-TABLE ?auto_216197 ) ( ON ?auto_216198 ?auto_216197 ) ( not ( = ?auto_216197 ?auto_216198 ) ) ( not ( = ?auto_216197 ?auto_216205 ) ) ( not ( = ?auto_216198 ?auto_216205 ) ) ( not ( = ?auto_216197 ?auto_216201 ) ) ( not ( = ?auto_216197 ?auto_216199 ) ) ( not ( = ?auto_216198 ?auto_216201 ) ) ( not ( = ?auto_216198 ?auto_216199 ) ) ( not ( = ?auto_216205 ?auto_216201 ) ) ( not ( = ?auto_216205 ?auto_216199 ) ) ( not ( = ?auto_216201 ?auto_216199 ) ) ( ON ?auto_216201 ?auto_216205 ) ( not ( = ?auto_216203 ?auto_216204 ) ) ( not ( = ?auto_216203 ?auto_216202 ) ) ( not ( = ?auto_216203 ?auto_216199 ) ) ( not ( = ?auto_216204 ?auto_216202 ) ) ( not ( = ?auto_216204 ?auto_216199 ) ) ( not ( = ?auto_216202 ?auto_216199 ) ) ( not ( = ?auto_216197 ?auto_216202 ) ) ( not ( = ?auto_216197 ?auto_216203 ) ) ( not ( = ?auto_216197 ?auto_216204 ) ) ( not ( = ?auto_216198 ?auto_216202 ) ) ( not ( = ?auto_216198 ?auto_216203 ) ) ( not ( = ?auto_216198 ?auto_216204 ) ) ( not ( = ?auto_216205 ?auto_216202 ) ) ( not ( = ?auto_216205 ?auto_216203 ) ) ( not ( = ?auto_216205 ?auto_216204 ) ) ( not ( = ?auto_216201 ?auto_216202 ) ) ( not ( = ?auto_216201 ?auto_216203 ) ) ( not ( = ?auto_216201 ?auto_216204 ) ) ( ON ?auto_216199 ?auto_216201 ) ( ON ?auto_216203 ?auto_216200 ) ( not ( = ?auto_216197 ?auto_216200 ) ) ( not ( = ?auto_216198 ?auto_216200 ) ) ( not ( = ?auto_216205 ?auto_216200 ) ) ( not ( = ?auto_216201 ?auto_216200 ) ) ( not ( = ?auto_216199 ?auto_216200 ) ) ( not ( = ?auto_216203 ?auto_216200 ) ) ( not ( = ?auto_216204 ?auto_216200 ) ) ( not ( = ?auto_216202 ?auto_216200 ) ) ( ON ?auto_216204 ?auto_216203 ) ( CLEAR ?auto_216204 ) ( ON-TABLE ?auto_216200 ) ( HOLDING ?auto_216202 ) ( CLEAR ?auto_216199 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216197 ?auto_216198 ?auto_216205 ?auto_216201 ?auto_216199 ?auto_216202 )
      ( MAKE-2PILE ?auto_216197 ?auto_216198 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216206 - BLOCK
      ?auto_216207 - BLOCK
    )
    :vars
    (
      ?auto_216212 - BLOCK
      ?auto_216214 - BLOCK
      ?auto_216213 - BLOCK
      ?auto_216210 - BLOCK
      ?auto_216211 - BLOCK
      ?auto_216209 - BLOCK
      ?auto_216208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216212 ?auto_216207 ) ( ON-TABLE ?auto_216206 ) ( ON ?auto_216207 ?auto_216206 ) ( not ( = ?auto_216206 ?auto_216207 ) ) ( not ( = ?auto_216206 ?auto_216212 ) ) ( not ( = ?auto_216207 ?auto_216212 ) ) ( not ( = ?auto_216206 ?auto_216214 ) ) ( not ( = ?auto_216206 ?auto_216213 ) ) ( not ( = ?auto_216207 ?auto_216214 ) ) ( not ( = ?auto_216207 ?auto_216213 ) ) ( not ( = ?auto_216212 ?auto_216214 ) ) ( not ( = ?auto_216212 ?auto_216213 ) ) ( not ( = ?auto_216214 ?auto_216213 ) ) ( ON ?auto_216214 ?auto_216212 ) ( not ( = ?auto_216210 ?auto_216211 ) ) ( not ( = ?auto_216210 ?auto_216209 ) ) ( not ( = ?auto_216210 ?auto_216213 ) ) ( not ( = ?auto_216211 ?auto_216209 ) ) ( not ( = ?auto_216211 ?auto_216213 ) ) ( not ( = ?auto_216209 ?auto_216213 ) ) ( not ( = ?auto_216206 ?auto_216209 ) ) ( not ( = ?auto_216206 ?auto_216210 ) ) ( not ( = ?auto_216206 ?auto_216211 ) ) ( not ( = ?auto_216207 ?auto_216209 ) ) ( not ( = ?auto_216207 ?auto_216210 ) ) ( not ( = ?auto_216207 ?auto_216211 ) ) ( not ( = ?auto_216212 ?auto_216209 ) ) ( not ( = ?auto_216212 ?auto_216210 ) ) ( not ( = ?auto_216212 ?auto_216211 ) ) ( not ( = ?auto_216214 ?auto_216209 ) ) ( not ( = ?auto_216214 ?auto_216210 ) ) ( not ( = ?auto_216214 ?auto_216211 ) ) ( ON ?auto_216213 ?auto_216214 ) ( ON ?auto_216210 ?auto_216208 ) ( not ( = ?auto_216206 ?auto_216208 ) ) ( not ( = ?auto_216207 ?auto_216208 ) ) ( not ( = ?auto_216212 ?auto_216208 ) ) ( not ( = ?auto_216214 ?auto_216208 ) ) ( not ( = ?auto_216213 ?auto_216208 ) ) ( not ( = ?auto_216210 ?auto_216208 ) ) ( not ( = ?auto_216211 ?auto_216208 ) ) ( not ( = ?auto_216209 ?auto_216208 ) ) ( ON ?auto_216211 ?auto_216210 ) ( ON-TABLE ?auto_216208 ) ( CLEAR ?auto_216213 ) ( ON ?auto_216209 ?auto_216211 ) ( CLEAR ?auto_216209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216208 ?auto_216210 ?auto_216211 )
      ( MAKE-2PILE ?auto_216206 ?auto_216207 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216215 - BLOCK
      ?auto_216216 - BLOCK
    )
    :vars
    (
      ?auto_216222 - BLOCK
      ?auto_216218 - BLOCK
      ?auto_216223 - BLOCK
      ?auto_216219 - BLOCK
      ?auto_216217 - BLOCK
      ?auto_216220 - BLOCK
      ?auto_216221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216222 ?auto_216216 ) ( ON-TABLE ?auto_216215 ) ( ON ?auto_216216 ?auto_216215 ) ( not ( = ?auto_216215 ?auto_216216 ) ) ( not ( = ?auto_216215 ?auto_216222 ) ) ( not ( = ?auto_216216 ?auto_216222 ) ) ( not ( = ?auto_216215 ?auto_216218 ) ) ( not ( = ?auto_216215 ?auto_216223 ) ) ( not ( = ?auto_216216 ?auto_216218 ) ) ( not ( = ?auto_216216 ?auto_216223 ) ) ( not ( = ?auto_216222 ?auto_216218 ) ) ( not ( = ?auto_216222 ?auto_216223 ) ) ( not ( = ?auto_216218 ?auto_216223 ) ) ( ON ?auto_216218 ?auto_216222 ) ( not ( = ?auto_216219 ?auto_216217 ) ) ( not ( = ?auto_216219 ?auto_216220 ) ) ( not ( = ?auto_216219 ?auto_216223 ) ) ( not ( = ?auto_216217 ?auto_216220 ) ) ( not ( = ?auto_216217 ?auto_216223 ) ) ( not ( = ?auto_216220 ?auto_216223 ) ) ( not ( = ?auto_216215 ?auto_216220 ) ) ( not ( = ?auto_216215 ?auto_216219 ) ) ( not ( = ?auto_216215 ?auto_216217 ) ) ( not ( = ?auto_216216 ?auto_216220 ) ) ( not ( = ?auto_216216 ?auto_216219 ) ) ( not ( = ?auto_216216 ?auto_216217 ) ) ( not ( = ?auto_216222 ?auto_216220 ) ) ( not ( = ?auto_216222 ?auto_216219 ) ) ( not ( = ?auto_216222 ?auto_216217 ) ) ( not ( = ?auto_216218 ?auto_216220 ) ) ( not ( = ?auto_216218 ?auto_216219 ) ) ( not ( = ?auto_216218 ?auto_216217 ) ) ( ON ?auto_216219 ?auto_216221 ) ( not ( = ?auto_216215 ?auto_216221 ) ) ( not ( = ?auto_216216 ?auto_216221 ) ) ( not ( = ?auto_216222 ?auto_216221 ) ) ( not ( = ?auto_216218 ?auto_216221 ) ) ( not ( = ?auto_216223 ?auto_216221 ) ) ( not ( = ?auto_216219 ?auto_216221 ) ) ( not ( = ?auto_216217 ?auto_216221 ) ) ( not ( = ?auto_216220 ?auto_216221 ) ) ( ON ?auto_216217 ?auto_216219 ) ( ON-TABLE ?auto_216221 ) ( ON ?auto_216220 ?auto_216217 ) ( CLEAR ?auto_216220 ) ( HOLDING ?auto_216223 ) ( CLEAR ?auto_216218 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216215 ?auto_216216 ?auto_216222 ?auto_216218 ?auto_216223 )
      ( MAKE-2PILE ?auto_216215 ?auto_216216 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216224 - BLOCK
      ?auto_216225 - BLOCK
    )
    :vars
    (
      ?auto_216230 - BLOCK
      ?auto_216229 - BLOCK
      ?auto_216228 - BLOCK
      ?auto_216226 - BLOCK
      ?auto_216227 - BLOCK
      ?auto_216232 - BLOCK
      ?auto_216231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216230 ?auto_216225 ) ( ON-TABLE ?auto_216224 ) ( ON ?auto_216225 ?auto_216224 ) ( not ( = ?auto_216224 ?auto_216225 ) ) ( not ( = ?auto_216224 ?auto_216230 ) ) ( not ( = ?auto_216225 ?auto_216230 ) ) ( not ( = ?auto_216224 ?auto_216229 ) ) ( not ( = ?auto_216224 ?auto_216228 ) ) ( not ( = ?auto_216225 ?auto_216229 ) ) ( not ( = ?auto_216225 ?auto_216228 ) ) ( not ( = ?auto_216230 ?auto_216229 ) ) ( not ( = ?auto_216230 ?auto_216228 ) ) ( not ( = ?auto_216229 ?auto_216228 ) ) ( ON ?auto_216229 ?auto_216230 ) ( not ( = ?auto_216226 ?auto_216227 ) ) ( not ( = ?auto_216226 ?auto_216232 ) ) ( not ( = ?auto_216226 ?auto_216228 ) ) ( not ( = ?auto_216227 ?auto_216232 ) ) ( not ( = ?auto_216227 ?auto_216228 ) ) ( not ( = ?auto_216232 ?auto_216228 ) ) ( not ( = ?auto_216224 ?auto_216232 ) ) ( not ( = ?auto_216224 ?auto_216226 ) ) ( not ( = ?auto_216224 ?auto_216227 ) ) ( not ( = ?auto_216225 ?auto_216232 ) ) ( not ( = ?auto_216225 ?auto_216226 ) ) ( not ( = ?auto_216225 ?auto_216227 ) ) ( not ( = ?auto_216230 ?auto_216232 ) ) ( not ( = ?auto_216230 ?auto_216226 ) ) ( not ( = ?auto_216230 ?auto_216227 ) ) ( not ( = ?auto_216229 ?auto_216232 ) ) ( not ( = ?auto_216229 ?auto_216226 ) ) ( not ( = ?auto_216229 ?auto_216227 ) ) ( ON ?auto_216226 ?auto_216231 ) ( not ( = ?auto_216224 ?auto_216231 ) ) ( not ( = ?auto_216225 ?auto_216231 ) ) ( not ( = ?auto_216230 ?auto_216231 ) ) ( not ( = ?auto_216229 ?auto_216231 ) ) ( not ( = ?auto_216228 ?auto_216231 ) ) ( not ( = ?auto_216226 ?auto_216231 ) ) ( not ( = ?auto_216227 ?auto_216231 ) ) ( not ( = ?auto_216232 ?auto_216231 ) ) ( ON ?auto_216227 ?auto_216226 ) ( ON-TABLE ?auto_216231 ) ( ON ?auto_216232 ?auto_216227 ) ( CLEAR ?auto_216229 ) ( ON ?auto_216228 ?auto_216232 ) ( CLEAR ?auto_216228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216231 ?auto_216226 ?auto_216227 ?auto_216232 )
      ( MAKE-2PILE ?auto_216224 ?auto_216225 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216233 - BLOCK
      ?auto_216234 - BLOCK
    )
    :vars
    (
      ?auto_216235 - BLOCK
      ?auto_216241 - BLOCK
      ?auto_216239 - BLOCK
      ?auto_216238 - BLOCK
      ?auto_216237 - BLOCK
      ?auto_216236 - BLOCK
      ?auto_216240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216235 ?auto_216234 ) ( ON-TABLE ?auto_216233 ) ( ON ?auto_216234 ?auto_216233 ) ( not ( = ?auto_216233 ?auto_216234 ) ) ( not ( = ?auto_216233 ?auto_216235 ) ) ( not ( = ?auto_216234 ?auto_216235 ) ) ( not ( = ?auto_216233 ?auto_216241 ) ) ( not ( = ?auto_216233 ?auto_216239 ) ) ( not ( = ?auto_216234 ?auto_216241 ) ) ( not ( = ?auto_216234 ?auto_216239 ) ) ( not ( = ?auto_216235 ?auto_216241 ) ) ( not ( = ?auto_216235 ?auto_216239 ) ) ( not ( = ?auto_216241 ?auto_216239 ) ) ( not ( = ?auto_216238 ?auto_216237 ) ) ( not ( = ?auto_216238 ?auto_216236 ) ) ( not ( = ?auto_216238 ?auto_216239 ) ) ( not ( = ?auto_216237 ?auto_216236 ) ) ( not ( = ?auto_216237 ?auto_216239 ) ) ( not ( = ?auto_216236 ?auto_216239 ) ) ( not ( = ?auto_216233 ?auto_216236 ) ) ( not ( = ?auto_216233 ?auto_216238 ) ) ( not ( = ?auto_216233 ?auto_216237 ) ) ( not ( = ?auto_216234 ?auto_216236 ) ) ( not ( = ?auto_216234 ?auto_216238 ) ) ( not ( = ?auto_216234 ?auto_216237 ) ) ( not ( = ?auto_216235 ?auto_216236 ) ) ( not ( = ?auto_216235 ?auto_216238 ) ) ( not ( = ?auto_216235 ?auto_216237 ) ) ( not ( = ?auto_216241 ?auto_216236 ) ) ( not ( = ?auto_216241 ?auto_216238 ) ) ( not ( = ?auto_216241 ?auto_216237 ) ) ( ON ?auto_216238 ?auto_216240 ) ( not ( = ?auto_216233 ?auto_216240 ) ) ( not ( = ?auto_216234 ?auto_216240 ) ) ( not ( = ?auto_216235 ?auto_216240 ) ) ( not ( = ?auto_216241 ?auto_216240 ) ) ( not ( = ?auto_216239 ?auto_216240 ) ) ( not ( = ?auto_216238 ?auto_216240 ) ) ( not ( = ?auto_216237 ?auto_216240 ) ) ( not ( = ?auto_216236 ?auto_216240 ) ) ( ON ?auto_216237 ?auto_216238 ) ( ON-TABLE ?auto_216240 ) ( ON ?auto_216236 ?auto_216237 ) ( ON ?auto_216239 ?auto_216236 ) ( CLEAR ?auto_216239 ) ( HOLDING ?auto_216241 ) ( CLEAR ?auto_216235 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216233 ?auto_216234 ?auto_216235 ?auto_216241 )
      ( MAKE-2PILE ?auto_216233 ?auto_216234 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216242 - BLOCK
      ?auto_216243 - BLOCK
    )
    :vars
    (
      ?auto_216246 - BLOCK
      ?auto_216245 - BLOCK
      ?auto_216244 - BLOCK
      ?auto_216247 - BLOCK
      ?auto_216250 - BLOCK
      ?auto_216248 - BLOCK
      ?auto_216249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216246 ?auto_216243 ) ( ON-TABLE ?auto_216242 ) ( ON ?auto_216243 ?auto_216242 ) ( not ( = ?auto_216242 ?auto_216243 ) ) ( not ( = ?auto_216242 ?auto_216246 ) ) ( not ( = ?auto_216243 ?auto_216246 ) ) ( not ( = ?auto_216242 ?auto_216245 ) ) ( not ( = ?auto_216242 ?auto_216244 ) ) ( not ( = ?auto_216243 ?auto_216245 ) ) ( not ( = ?auto_216243 ?auto_216244 ) ) ( not ( = ?auto_216246 ?auto_216245 ) ) ( not ( = ?auto_216246 ?auto_216244 ) ) ( not ( = ?auto_216245 ?auto_216244 ) ) ( not ( = ?auto_216247 ?auto_216250 ) ) ( not ( = ?auto_216247 ?auto_216248 ) ) ( not ( = ?auto_216247 ?auto_216244 ) ) ( not ( = ?auto_216250 ?auto_216248 ) ) ( not ( = ?auto_216250 ?auto_216244 ) ) ( not ( = ?auto_216248 ?auto_216244 ) ) ( not ( = ?auto_216242 ?auto_216248 ) ) ( not ( = ?auto_216242 ?auto_216247 ) ) ( not ( = ?auto_216242 ?auto_216250 ) ) ( not ( = ?auto_216243 ?auto_216248 ) ) ( not ( = ?auto_216243 ?auto_216247 ) ) ( not ( = ?auto_216243 ?auto_216250 ) ) ( not ( = ?auto_216246 ?auto_216248 ) ) ( not ( = ?auto_216246 ?auto_216247 ) ) ( not ( = ?auto_216246 ?auto_216250 ) ) ( not ( = ?auto_216245 ?auto_216248 ) ) ( not ( = ?auto_216245 ?auto_216247 ) ) ( not ( = ?auto_216245 ?auto_216250 ) ) ( ON ?auto_216247 ?auto_216249 ) ( not ( = ?auto_216242 ?auto_216249 ) ) ( not ( = ?auto_216243 ?auto_216249 ) ) ( not ( = ?auto_216246 ?auto_216249 ) ) ( not ( = ?auto_216245 ?auto_216249 ) ) ( not ( = ?auto_216244 ?auto_216249 ) ) ( not ( = ?auto_216247 ?auto_216249 ) ) ( not ( = ?auto_216250 ?auto_216249 ) ) ( not ( = ?auto_216248 ?auto_216249 ) ) ( ON ?auto_216250 ?auto_216247 ) ( ON-TABLE ?auto_216249 ) ( ON ?auto_216248 ?auto_216250 ) ( ON ?auto_216244 ?auto_216248 ) ( CLEAR ?auto_216246 ) ( ON ?auto_216245 ?auto_216244 ) ( CLEAR ?auto_216245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216249 ?auto_216247 ?auto_216250 ?auto_216248 ?auto_216244 )
      ( MAKE-2PILE ?auto_216242 ?auto_216243 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216269 - BLOCK
      ?auto_216270 - BLOCK
    )
    :vars
    (
      ?auto_216272 - BLOCK
      ?auto_216271 - BLOCK
      ?auto_216274 - BLOCK
      ?auto_216277 - BLOCK
      ?auto_216273 - BLOCK
      ?auto_216276 - BLOCK
      ?auto_216275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216269 ) ( not ( = ?auto_216269 ?auto_216270 ) ) ( not ( = ?auto_216269 ?auto_216272 ) ) ( not ( = ?auto_216270 ?auto_216272 ) ) ( not ( = ?auto_216269 ?auto_216271 ) ) ( not ( = ?auto_216269 ?auto_216274 ) ) ( not ( = ?auto_216270 ?auto_216271 ) ) ( not ( = ?auto_216270 ?auto_216274 ) ) ( not ( = ?auto_216272 ?auto_216271 ) ) ( not ( = ?auto_216272 ?auto_216274 ) ) ( not ( = ?auto_216271 ?auto_216274 ) ) ( not ( = ?auto_216277 ?auto_216273 ) ) ( not ( = ?auto_216277 ?auto_216276 ) ) ( not ( = ?auto_216277 ?auto_216274 ) ) ( not ( = ?auto_216273 ?auto_216276 ) ) ( not ( = ?auto_216273 ?auto_216274 ) ) ( not ( = ?auto_216276 ?auto_216274 ) ) ( not ( = ?auto_216269 ?auto_216276 ) ) ( not ( = ?auto_216269 ?auto_216277 ) ) ( not ( = ?auto_216269 ?auto_216273 ) ) ( not ( = ?auto_216270 ?auto_216276 ) ) ( not ( = ?auto_216270 ?auto_216277 ) ) ( not ( = ?auto_216270 ?auto_216273 ) ) ( not ( = ?auto_216272 ?auto_216276 ) ) ( not ( = ?auto_216272 ?auto_216277 ) ) ( not ( = ?auto_216272 ?auto_216273 ) ) ( not ( = ?auto_216271 ?auto_216276 ) ) ( not ( = ?auto_216271 ?auto_216277 ) ) ( not ( = ?auto_216271 ?auto_216273 ) ) ( ON ?auto_216277 ?auto_216275 ) ( not ( = ?auto_216269 ?auto_216275 ) ) ( not ( = ?auto_216270 ?auto_216275 ) ) ( not ( = ?auto_216272 ?auto_216275 ) ) ( not ( = ?auto_216271 ?auto_216275 ) ) ( not ( = ?auto_216274 ?auto_216275 ) ) ( not ( = ?auto_216277 ?auto_216275 ) ) ( not ( = ?auto_216273 ?auto_216275 ) ) ( not ( = ?auto_216276 ?auto_216275 ) ) ( ON ?auto_216273 ?auto_216277 ) ( ON-TABLE ?auto_216275 ) ( ON ?auto_216276 ?auto_216273 ) ( ON ?auto_216274 ?auto_216276 ) ( ON ?auto_216271 ?auto_216274 ) ( ON ?auto_216272 ?auto_216271 ) ( CLEAR ?auto_216272 ) ( HOLDING ?auto_216270 ) ( CLEAR ?auto_216269 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216269 ?auto_216270 ?auto_216272 )
      ( MAKE-2PILE ?auto_216269 ?auto_216270 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216278 - BLOCK
      ?auto_216279 - BLOCK
    )
    :vars
    (
      ?auto_216280 - BLOCK
      ?auto_216282 - BLOCK
      ?auto_216286 - BLOCK
      ?auto_216283 - BLOCK
      ?auto_216284 - BLOCK
      ?auto_216285 - BLOCK
      ?auto_216281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216278 ) ( not ( = ?auto_216278 ?auto_216279 ) ) ( not ( = ?auto_216278 ?auto_216280 ) ) ( not ( = ?auto_216279 ?auto_216280 ) ) ( not ( = ?auto_216278 ?auto_216282 ) ) ( not ( = ?auto_216278 ?auto_216286 ) ) ( not ( = ?auto_216279 ?auto_216282 ) ) ( not ( = ?auto_216279 ?auto_216286 ) ) ( not ( = ?auto_216280 ?auto_216282 ) ) ( not ( = ?auto_216280 ?auto_216286 ) ) ( not ( = ?auto_216282 ?auto_216286 ) ) ( not ( = ?auto_216283 ?auto_216284 ) ) ( not ( = ?auto_216283 ?auto_216285 ) ) ( not ( = ?auto_216283 ?auto_216286 ) ) ( not ( = ?auto_216284 ?auto_216285 ) ) ( not ( = ?auto_216284 ?auto_216286 ) ) ( not ( = ?auto_216285 ?auto_216286 ) ) ( not ( = ?auto_216278 ?auto_216285 ) ) ( not ( = ?auto_216278 ?auto_216283 ) ) ( not ( = ?auto_216278 ?auto_216284 ) ) ( not ( = ?auto_216279 ?auto_216285 ) ) ( not ( = ?auto_216279 ?auto_216283 ) ) ( not ( = ?auto_216279 ?auto_216284 ) ) ( not ( = ?auto_216280 ?auto_216285 ) ) ( not ( = ?auto_216280 ?auto_216283 ) ) ( not ( = ?auto_216280 ?auto_216284 ) ) ( not ( = ?auto_216282 ?auto_216285 ) ) ( not ( = ?auto_216282 ?auto_216283 ) ) ( not ( = ?auto_216282 ?auto_216284 ) ) ( ON ?auto_216283 ?auto_216281 ) ( not ( = ?auto_216278 ?auto_216281 ) ) ( not ( = ?auto_216279 ?auto_216281 ) ) ( not ( = ?auto_216280 ?auto_216281 ) ) ( not ( = ?auto_216282 ?auto_216281 ) ) ( not ( = ?auto_216286 ?auto_216281 ) ) ( not ( = ?auto_216283 ?auto_216281 ) ) ( not ( = ?auto_216284 ?auto_216281 ) ) ( not ( = ?auto_216285 ?auto_216281 ) ) ( ON ?auto_216284 ?auto_216283 ) ( ON-TABLE ?auto_216281 ) ( ON ?auto_216285 ?auto_216284 ) ( ON ?auto_216286 ?auto_216285 ) ( ON ?auto_216282 ?auto_216286 ) ( ON ?auto_216280 ?auto_216282 ) ( CLEAR ?auto_216278 ) ( ON ?auto_216279 ?auto_216280 ) ( CLEAR ?auto_216279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216281 ?auto_216283 ?auto_216284 ?auto_216285 ?auto_216286 ?auto_216282 ?auto_216280 )
      ( MAKE-2PILE ?auto_216278 ?auto_216279 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216287 - BLOCK
      ?auto_216288 - BLOCK
    )
    :vars
    (
      ?auto_216294 - BLOCK
      ?auto_216290 - BLOCK
      ?auto_216292 - BLOCK
      ?auto_216295 - BLOCK
      ?auto_216293 - BLOCK
      ?auto_216289 - BLOCK
      ?auto_216291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216287 ?auto_216288 ) ) ( not ( = ?auto_216287 ?auto_216294 ) ) ( not ( = ?auto_216288 ?auto_216294 ) ) ( not ( = ?auto_216287 ?auto_216290 ) ) ( not ( = ?auto_216287 ?auto_216292 ) ) ( not ( = ?auto_216288 ?auto_216290 ) ) ( not ( = ?auto_216288 ?auto_216292 ) ) ( not ( = ?auto_216294 ?auto_216290 ) ) ( not ( = ?auto_216294 ?auto_216292 ) ) ( not ( = ?auto_216290 ?auto_216292 ) ) ( not ( = ?auto_216295 ?auto_216293 ) ) ( not ( = ?auto_216295 ?auto_216289 ) ) ( not ( = ?auto_216295 ?auto_216292 ) ) ( not ( = ?auto_216293 ?auto_216289 ) ) ( not ( = ?auto_216293 ?auto_216292 ) ) ( not ( = ?auto_216289 ?auto_216292 ) ) ( not ( = ?auto_216287 ?auto_216289 ) ) ( not ( = ?auto_216287 ?auto_216295 ) ) ( not ( = ?auto_216287 ?auto_216293 ) ) ( not ( = ?auto_216288 ?auto_216289 ) ) ( not ( = ?auto_216288 ?auto_216295 ) ) ( not ( = ?auto_216288 ?auto_216293 ) ) ( not ( = ?auto_216294 ?auto_216289 ) ) ( not ( = ?auto_216294 ?auto_216295 ) ) ( not ( = ?auto_216294 ?auto_216293 ) ) ( not ( = ?auto_216290 ?auto_216289 ) ) ( not ( = ?auto_216290 ?auto_216295 ) ) ( not ( = ?auto_216290 ?auto_216293 ) ) ( ON ?auto_216295 ?auto_216291 ) ( not ( = ?auto_216287 ?auto_216291 ) ) ( not ( = ?auto_216288 ?auto_216291 ) ) ( not ( = ?auto_216294 ?auto_216291 ) ) ( not ( = ?auto_216290 ?auto_216291 ) ) ( not ( = ?auto_216292 ?auto_216291 ) ) ( not ( = ?auto_216295 ?auto_216291 ) ) ( not ( = ?auto_216293 ?auto_216291 ) ) ( not ( = ?auto_216289 ?auto_216291 ) ) ( ON ?auto_216293 ?auto_216295 ) ( ON-TABLE ?auto_216291 ) ( ON ?auto_216289 ?auto_216293 ) ( ON ?auto_216292 ?auto_216289 ) ( ON ?auto_216290 ?auto_216292 ) ( ON ?auto_216294 ?auto_216290 ) ( ON ?auto_216288 ?auto_216294 ) ( CLEAR ?auto_216288 ) ( HOLDING ?auto_216287 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216287 )
      ( MAKE-2PILE ?auto_216287 ?auto_216288 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_216296 - BLOCK
      ?auto_216297 - BLOCK
    )
    :vars
    (
      ?auto_216299 - BLOCK
      ?auto_216301 - BLOCK
      ?auto_216298 - BLOCK
      ?auto_216304 - BLOCK
      ?auto_216303 - BLOCK
      ?auto_216300 - BLOCK
      ?auto_216302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216296 ?auto_216297 ) ) ( not ( = ?auto_216296 ?auto_216299 ) ) ( not ( = ?auto_216297 ?auto_216299 ) ) ( not ( = ?auto_216296 ?auto_216301 ) ) ( not ( = ?auto_216296 ?auto_216298 ) ) ( not ( = ?auto_216297 ?auto_216301 ) ) ( not ( = ?auto_216297 ?auto_216298 ) ) ( not ( = ?auto_216299 ?auto_216301 ) ) ( not ( = ?auto_216299 ?auto_216298 ) ) ( not ( = ?auto_216301 ?auto_216298 ) ) ( not ( = ?auto_216304 ?auto_216303 ) ) ( not ( = ?auto_216304 ?auto_216300 ) ) ( not ( = ?auto_216304 ?auto_216298 ) ) ( not ( = ?auto_216303 ?auto_216300 ) ) ( not ( = ?auto_216303 ?auto_216298 ) ) ( not ( = ?auto_216300 ?auto_216298 ) ) ( not ( = ?auto_216296 ?auto_216300 ) ) ( not ( = ?auto_216296 ?auto_216304 ) ) ( not ( = ?auto_216296 ?auto_216303 ) ) ( not ( = ?auto_216297 ?auto_216300 ) ) ( not ( = ?auto_216297 ?auto_216304 ) ) ( not ( = ?auto_216297 ?auto_216303 ) ) ( not ( = ?auto_216299 ?auto_216300 ) ) ( not ( = ?auto_216299 ?auto_216304 ) ) ( not ( = ?auto_216299 ?auto_216303 ) ) ( not ( = ?auto_216301 ?auto_216300 ) ) ( not ( = ?auto_216301 ?auto_216304 ) ) ( not ( = ?auto_216301 ?auto_216303 ) ) ( ON ?auto_216304 ?auto_216302 ) ( not ( = ?auto_216296 ?auto_216302 ) ) ( not ( = ?auto_216297 ?auto_216302 ) ) ( not ( = ?auto_216299 ?auto_216302 ) ) ( not ( = ?auto_216301 ?auto_216302 ) ) ( not ( = ?auto_216298 ?auto_216302 ) ) ( not ( = ?auto_216304 ?auto_216302 ) ) ( not ( = ?auto_216303 ?auto_216302 ) ) ( not ( = ?auto_216300 ?auto_216302 ) ) ( ON ?auto_216303 ?auto_216304 ) ( ON-TABLE ?auto_216302 ) ( ON ?auto_216300 ?auto_216303 ) ( ON ?auto_216298 ?auto_216300 ) ( ON ?auto_216301 ?auto_216298 ) ( ON ?auto_216299 ?auto_216301 ) ( ON ?auto_216297 ?auto_216299 ) ( ON ?auto_216296 ?auto_216297 ) ( CLEAR ?auto_216296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_216302 ?auto_216304 ?auto_216303 ?auto_216300 ?auto_216298 ?auto_216301 ?auto_216299 ?auto_216297 )
      ( MAKE-2PILE ?auto_216296 ?auto_216297 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216311 - BLOCK
      ?auto_216312 - BLOCK
      ?auto_216313 - BLOCK
      ?auto_216314 - BLOCK
      ?auto_216315 - BLOCK
      ?auto_216316 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_216316 ) ( CLEAR ?auto_216315 ) ( ON-TABLE ?auto_216311 ) ( ON ?auto_216312 ?auto_216311 ) ( ON ?auto_216313 ?auto_216312 ) ( ON ?auto_216314 ?auto_216313 ) ( ON ?auto_216315 ?auto_216314 ) ( not ( = ?auto_216311 ?auto_216312 ) ) ( not ( = ?auto_216311 ?auto_216313 ) ) ( not ( = ?auto_216311 ?auto_216314 ) ) ( not ( = ?auto_216311 ?auto_216315 ) ) ( not ( = ?auto_216311 ?auto_216316 ) ) ( not ( = ?auto_216312 ?auto_216313 ) ) ( not ( = ?auto_216312 ?auto_216314 ) ) ( not ( = ?auto_216312 ?auto_216315 ) ) ( not ( = ?auto_216312 ?auto_216316 ) ) ( not ( = ?auto_216313 ?auto_216314 ) ) ( not ( = ?auto_216313 ?auto_216315 ) ) ( not ( = ?auto_216313 ?auto_216316 ) ) ( not ( = ?auto_216314 ?auto_216315 ) ) ( not ( = ?auto_216314 ?auto_216316 ) ) ( not ( = ?auto_216315 ?auto_216316 ) ) )
    :subtasks
    ( ( !STACK ?auto_216316 ?auto_216315 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216317 - BLOCK
      ?auto_216318 - BLOCK
      ?auto_216319 - BLOCK
      ?auto_216320 - BLOCK
      ?auto_216321 - BLOCK
      ?auto_216322 - BLOCK
    )
    :vars
    (
      ?auto_216323 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216321 ) ( ON-TABLE ?auto_216317 ) ( ON ?auto_216318 ?auto_216317 ) ( ON ?auto_216319 ?auto_216318 ) ( ON ?auto_216320 ?auto_216319 ) ( ON ?auto_216321 ?auto_216320 ) ( not ( = ?auto_216317 ?auto_216318 ) ) ( not ( = ?auto_216317 ?auto_216319 ) ) ( not ( = ?auto_216317 ?auto_216320 ) ) ( not ( = ?auto_216317 ?auto_216321 ) ) ( not ( = ?auto_216317 ?auto_216322 ) ) ( not ( = ?auto_216318 ?auto_216319 ) ) ( not ( = ?auto_216318 ?auto_216320 ) ) ( not ( = ?auto_216318 ?auto_216321 ) ) ( not ( = ?auto_216318 ?auto_216322 ) ) ( not ( = ?auto_216319 ?auto_216320 ) ) ( not ( = ?auto_216319 ?auto_216321 ) ) ( not ( = ?auto_216319 ?auto_216322 ) ) ( not ( = ?auto_216320 ?auto_216321 ) ) ( not ( = ?auto_216320 ?auto_216322 ) ) ( not ( = ?auto_216321 ?auto_216322 ) ) ( ON ?auto_216322 ?auto_216323 ) ( CLEAR ?auto_216322 ) ( HAND-EMPTY ) ( not ( = ?auto_216317 ?auto_216323 ) ) ( not ( = ?auto_216318 ?auto_216323 ) ) ( not ( = ?auto_216319 ?auto_216323 ) ) ( not ( = ?auto_216320 ?auto_216323 ) ) ( not ( = ?auto_216321 ?auto_216323 ) ) ( not ( = ?auto_216322 ?auto_216323 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216322 ?auto_216323 )
      ( MAKE-6PILE ?auto_216317 ?auto_216318 ?auto_216319 ?auto_216320 ?auto_216321 ?auto_216322 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216324 - BLOCK
      ?auto_216325 - BLOCK
      ?auto_216326 - BLOCK
      ?auto_216327 - BLOCK
      ?auto_216328 - BLOCK
      ?auto_216329 - BLOCK
    )
    :vars
    (
      ?auto_216330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216324 ) ( ON ?auto_216325 ?auto_216324 ) ( ON ?auto_216326 ?auto_216325 ) ( ON ?auto_216327 ?auto_216326 ) ( not ( = ?auto_216324 ?auto_216325 ) ) ( not ( = ?auto_216324 ?auto_216326 ) ) ( not ( = ?auto_216324 ?auto_216327 ) ) ( not ( = ?auto_216324 ?auto_216328 ) ) ( not ( = ?auto_216324 ?auto_216329 ) ) ( not ( = ?auto_216325 ?auto_216326 ) ) ( not ( = ?auto_216325 ?auto_216327 ) ) ( not ( = ?auto_216325 ?auto_216328 ) ) ( not ( = ?auto_216325 ?auto_216329 ) ) ( not ( = ?auto_216326 ?auto_216327 ) ) ( not ( = ?auto_216326 ?auto_216328 ) ) ( not ( = ?auto_216326 ?auto_216329 ) ) ( not ( = ?auto_216327 ?auto_216328 ) ) ( not ( = ?auto_216327 ?auto_216329 ) ) ( not ( = ?auto_216328 ?auto_216329 ) ) ( ON ?auto_216329 ?auto_216330 ) ( CLEAR ?auto_216329 ) ( not ( = ?auto_216324 ?auto_216330 ) ) ( not ( = ?auto_216325 ?auto_216330 ) ) ( not ( = ?auto_216326 ?auto_216330 ) ) ( not ( = ?auto_216327 ?auto_216330 ) ) ( not ( = ?auto_216328 ?auto_216330 ) ) ( not ( = ?auto_216329 ?auto_216330 ) ) ( HOLDING ?auto_216328 ) ( CLEAR ?auto_216327 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216324 ?auto_216325 ?auto_216326 ?auto_216327 ?auto_216328 )
      ( MAKE-6PILE ?auto_216324 ?auto_216325 ?auto_216326 ?auto_216327 ?auto_216328 ?auto_216329 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216331 - BLOCK
      ?auto_216332 - BLOCK
      ?auto_216333 - BLOCK
      ?auto_216334 - BLOCK
      ?auto_216335 - BLOCK
      ?auto_216336 - BLOCK
    )
    :vars
    (
      ?auto_216337 - BLOCK
      ?auto_216338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216331 ) ( ON ?auto_216332 ?auto_216331 ) ( ON ?auto_216333 ?auto_216332 ) ( ON ?auto_216334 ?auto_216333 ) ( not ( = ?auto_216331 ?auto_216332 ) ) ( not ( = ?auto_216331 ?auto_216333 ) ) ( not ( = ?auto_216331 ?auto_216334 ) ) ( not ( = ?auto_216331 ?auto_216335 ) ) ( not ( = ?auto_216331 ?auto_216336 ) ) ( not ( = ?auto_216332 ?auto_216333 ) ) ( not ( = ?auto_216332 ?auto_216334 ) ) ( not ( = ?auto_216332 ?auto_216335 ) ) ( not ( = ?auto_216332 ?auto_216336 ) ) ( not ( = ?auto_216333 ?auto_216334 ) ) ( not ( = ?auto_216333 ?auto_216335 ) ) ( not ( = ?auto_216333 ?auto_216336 ) ) ( not ( = ?auto_216334 ?auto_216335 ) ) ( not ( = ?auto_216334 ?auto_216336 ) ) ( not ( = ?auto_216335 ?auto_216336 ) ) ( ON ?auto_216336 ?auto_216337 ) ( not ( = ?auto_216331 ?auto_216337 ) ) ( not ( = ?auto_216332 ?auto_216337 ) ) ( not ( = ?auto_216333 ?auto_216337 ) ) ( not ( = ?auto_216334 ?auto_216337 ) ) ( not ( = ?auto_216335 ?auto_216337 ) ) ( not ( = ?auto_216336 ?auto_216337 ) ) ( CLEAR ?auto_216334 ) ( ON ?auto_216335 ?auto_216336 ) ( CLEAR ?auto_216335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216338 ) ( ON ?auto_216337 ?auto_216338 ) ( not ( = ?auto_216338 ?auto_216337 ) ) ( not ( = ?auto_216338 ?auto_216336 ) ) ( not ( = ?auto_216338 ?auto_216335 ) ) ( not ( = ?auto_216331 ?auto_216338 ) ) ( not ( = ?auto_216332 ?auto_216338 ) ) ( not ( = ?auto_216333 ?auto_216338 ) ) ( not ( = ?auto_216334 ?auto_216338 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216338 ?auto_216337 ?auto_216336 )
      ( MAKE-6PILE ?auto_216331 ?auto_216332 ?auto_216333 ?auto_216334 ?auto_216335 ?auto_216336 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216339 - BLOCK
      ?auto_216340 - BLOCK
      ?auto_216341 - BLOCK
      ?auto_216342 - BLOCK
      ?auto_216343 - BLOCK
      ?auto_216344 - BLOCK
    )
    :vars
    (
      ?auto_216346 - BLOCK
      ?auto_216345 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216339 ) ( ON ?auto_216340 ?auto_216339 ) ( ON ?auto_216341 ?auto_216340 ) ( not ( = ?auto_216339 ?auto_216340 ) ) ( not ( = ?auto_216339 ?auto_216341 ) ) ( not ( = ?auto_216339 ?auto_216342 ) ) ( not ( = ?auto_216339 ?auto_216343 ) ) ( not ( = ?auto_216339 ?auto_216344 ) ) ( not ( = ?auto_216340 ?auto_216341 ) ) ( not ( = ?auto_216340 ?auto_216342 ) ) ( not ( = ?auto_216340 ?auto_216343 ) ) ( not ( = ?auto_216340 ?auto_216344 ) ) ( not ( = ?auto_216341 ?auto_216342 ) ) ( not ( = ?auto_216341 ?auto_216343 ) ) ( not ( = ?auto_216341 ?auto_216344 ) ) ( not ( = ?auto_216342 ?auto_216343 ) ) ( not ( = ?auto_216342 ?auto_216344 ) ) ( not ( = ?auto_216343 ?auto_216344 ) ) ( ON ?auto_216344 ?auto_216346 ) ( not ( = ?auto_216339 ?auto_216346 ) ) ( not ( = ?auto_216340 ?auto_216346 ) ) ( not ( = ?auto_216341 ?auto_216346 ) ) ( not ( = ?auto_216342 ?auto_216346 ) ) ( not ( = ?auto_216343 ?auto_216346 ) ) ( not ( = ?auto_216344 ?auto_216346 ) ) ( ON ?auto_216343 ?auto_216344 ) ( CLEAR ?auto_216343 ) ( ON-TABLE ?auto_216345 ) ( ON ?auto_216346 ?auto_216345 ) ( not ( = ?auto_216345 ?auto_216346 ) ) ( not ( = ?auto_216345 ?auto_216344 ) ) ( not ( = ?auto_216345 ?auto_216343 ) ) ( not ( = ?auto_216339 ?auto_216345 ) ) ( not ( = ?auto_216340 ?auto_216345 ) ) ( not ( = ?auto_216341 ?auto_216345 ) ) ( not ( = ?auto_216342 ?auto_216345 ) ) ( HOLDING ?auto_216342 ) ( CLEAR ?auto_216341 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216339 ?auto_216340 ?auto_216341 ?auto_216342 )
      ( MAKE-6PILE ?auto_216339 ?auto_216340 ?auto_216341 ?auto_216342 ?auto_216343 ?auto_216344 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216347 - BLOCK
      ?auto_216348 - BLOCK
      ?auto_216349 - BLOCK
      ?auto_216350 - BLOCK
      ?auto_216351 - BLOCK
      ?auto_216352 - BLOCK
    )
    :vars
    (
      ?auto_216354 - BLOCK
      ?auto_216353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216347 ) ( ON ?auto_216348 ?auto_216347 ) ( ON ?auto_216349 ?auto_216348 ) ( not ( = ?auto_216347 ?auto_216348 ) ) ( not ( = ?auto_216347 ?auto_216349 ) ) ( not ( = ?auto_216347 ?auto_216350 ) ) ( not ( = ?auto_216347 ?auto_216351 ) ) ( not ( = ?auto_216347 ?auto_216352 ) ) ( not ( = ?auto_216348 ?auto_216349 ) ) ( not ( = ?auto_216348 ?auto_216350 ) ) ( not ( = ?auto_216348 ?auto_216351 ) ) ( not ( = ?auto_216348 ?auto_216352 ) ) ( not ( = ?auto_216349 ?auto_216350 ) ) ( not ( = ?auto_216349 ?auto_216351 ) ) ( not ( = ?auto_216349 ?auto_216352 ) ) ( not ( = ?auto_216350 ?auto_216351 ) ) ( not ( = ?auto_216350 ?auto_216352 ) ) ( not ( = ?auto_216351 ?auto_216352 ) ) ( ON ?auto_216352 ?auto_216354 ) ( not ( = ?auto_216347 ?auto_216354 ) ) ( not ( = ?auto_216348 ?auto_216354 ) ) ( not ( = ?auto_216349 ?auto_216354 ) ) ( not ( = ?auto_216350 ?auto_216354 ) ) ( not ( = ?auto_216351 ?auto_216354 ) ) ( not ( = ?auto_216352 ?auto_216354 ) ) ( ON ?auto_216351 ?auto_216352 ) ( ON-TABLE ?auto_216353 ) ( ON ?auto_216354 ?auto_216353 ) ( not ( = ?auto_216353 ?auto_216354 ) ) ( not ( = ?auto_216353 ?auto_216352 ) ) ( not ( = ?auto_216353 ?auto_216351 ) ) ( not ( = ?auto_216347 ?auto_216353 ) ) ( not ( = ?auto_216348 ?auto_216353 ) ) ( not ( = ?auto_216349 ?auto_216353 ) ) ( not ( = ?auto_216350 ?auto_216353 ) ) ( CLEAR ?auto_216349 ) ( ON ?auto_216350 ?auto_216351 ) ( CLEAR ?auto_216350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216353 ?auto_216354 ?auto_216352 ?auto_216351 )
      ( MAKE-6PILE ?auto_216347 ?auto_216348 ?auto_216349 ?auto_216350 ?auto_216351 ?auto_216352 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216355 - BLOCK
      ?auto_216356 - BLOCK
      ?auto_216357 - BLOCK
      ?auto_216358 - BLOCK
      ?auto_216359 - BLOCK
      ?auto_216360 - BLOCK
    )
    :vars
    (
      ?auto_216362 - BLOCK
      ?auto_216361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216355 ) ( ON ?auto_216356 ?auto_216355 ) ( not ( = ?auto_216355 ?auto_216356 ) ) ( not ( = ?auto_216355 ?auto_216357 ) ) ( not ( = ?auto_216355 ?auto_216358 ) ) ( not ( = ?auto_216355 ?auto_216359 ) ) ( not ( = ?auto_216355 ?auto_216360 ) ) ( not ( = ?auto_216356 ?auto_216357 ) ) ( not ( = ?auto_216356 ?auto_216358 ) ) ( not ( = ?auto_216356 ?auto_216359 ) ) ( not ( = ?auto_216356 ?auto_216360 ) ) ( not ( = ?auto_216357 ?auto_216358 ) ) ( not ( = ?auto_216357 ?auto_216359 ) ) ( not ( = ?auto_216357 ?auto_216360 ) ) ( not ( = ?auto_216358 ?auto_216359 ) ) ( not ( = ?auto_216358 ?auto_216360 ) ) ( not ( = ?auto_216359 ?auto_216360 ) ) ( ON ?auto_216360 ?auto_216362 ) ( not ( = ?auto_216355 ?auto_216362 ) ) ( not ( = ?auto_216356 ?auto_216362 ) ) ( not ( = ?auto_216357 ?auto_216362 ) ) ( not ( = ?auto_216358 ?auto_216362 ) ) ( not ( = ?auto_216359 ?auto_216362 ) ) ( not ( = ?auto_216360 ?auto_216362 ) ) ( ON ?auto_216359 ?auto_216360 ) ( ON-TABLE ?auto_216361 ) ( ON ?auto_216362 ?auto_216361 ) ( not ( = ?auto_216361 ?auto_216362 ) ) ( not ( = ?auto_216361 ?auto_216360 ) ) ( not ( = ?auto_216361 ?auto_216359 ) ) ( not ( = ?auto_216355 ?auto_216361 ) ) ( not ( = ?auto_216356 ?auto_216361 ) ) ( not ( = ?auto_216357 ?auto_216361 ) ) ( not ( = ?auto_216358 ?auto_216361 ) ) ( ON ?auto_216358 ?auto_216359 ) ( CLEAR ?auto_216358 ) ( HOLDING ?auto_216357 ) ( CLEAR ?auto_216356 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216355 ?auto_216356 ?auto_216357 )
      ( MAKE-6PILE ?auto_216355 ?auto_216356 ?auto_216357 ?auto_216358 ?auto_216359 ?auto_216360 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216363 - BLOCK
      ?auto_216364 - BLOCK
      ?auto_216365 - BLOCK
      ?auto_216366 - BLOCK
      ?auto_216367 - BLOCK
      ?auto_216368 - BLOCK
    )
    :vars
    (
      ?auto_216370 - BLOCK
      ?auto_216369 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216363 ) ( ON ?auto_216364 ?auto_216363 ) ( not ( = ?auto_216363 ?auto_216364 ) ) ( not ( = ?auto_216363 ?auto_216365 ) ) ( not ( = ?auto_216363 ?auto_216366 ) ) ( not ( = ?auto_216363 ?auto_216367 ) ) ( not ( = ?auto_216363 ?auto_216368 ) ) ( not ( = ?auto_216364 ?auto_216365 ) ) ( not ( = ?auto_216364 ?auto_216366 ) ) ( not ( = ?auto_216364 ?auto_216367 ) ) ( not ( = ?auto_216364 ?auto_216368 ) ) ( not ( = ?auto_216365 ?auto_216366 ) ) ( not ( = ?auto_216365 ?auto_216367 ) ) ( not ( = ?auto_216365 ?auto_216368 ) ) ( not ( = ?auto_216366 ?auto_216367 ) ) ( not ( = ?auto_216366 ?auto_216368 ) ) ( not ( = ?auto_216367 ?auto_216368 ) ) ( ON ?auto_216368 ?auto_216370 ) ( not ( = ?auto_216363 ?auto_216370 ) ) ( not ( = ?auto_216364 ?auto_216370 ) ) ( not ( = ?auto_216365 ?auto_216370 ) ) ( not ( = ?auto_216366 ?auto_216370 ) ) ( not ( = ?auto_216367 ?auto_216370 ) ) ( not ( = ?auto_216368 ?auto_216370 ) ) ( ON ?auto_216367 ?auto_216368 ) ( ON-TABLE ?auto_216369 ) ( ON ?auto_216370 ?auto_216369 ) ( not ( = ?auto_216369 ?auto_216370 ) ) ( not ( = ?auto_216369 ?auto_216368 ) ) ( not ( = ?auto_216369 ?auto_216367 ) ) ( not ( = ?auto_216363 ?auto_216369 ) ) ( not ( = ?auto_216364 ?auto_216369 ) ) ( not ( = ?auto_216365 ?auto_216369 ) ) ( not ( = ?auto_216366 ?auto_216369 ) ) ( ON ?auto_216366 ?auto_216367 ) ( CLEAR ?auto_216364 ) ( ON ?auto_216365 ?auto_216366 ) ( CLEAR ?auto_216365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216369 ?auto_216370 ?auto_216368 ?auto_216367 ?auto_216366 )
      ( MAKE-6PILE ?auto_216363 ?auto_216364 ?auto_216365 ?auto_216366 ?auto_216367 ?auto_216368 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216371 - BLOCK
      ?auto_216372 - BLOCK
      ?auto_216373 - BLOCK
      ?auto_216374 - BLOCK
      ?auto_216375 - BLOCK
      ?auto_216376 - BLOCK
    )
    :vars
    (
      ?auto_216378 - BLOCK
      ?auto_216377 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216371 ) ( not ( = ?auto_216371 ?auto_216372 ) ) ( not ( = ?auto_216371 ?auto_216373 ) ) ( not ( = ?auto_216371 ?auto_216374 ) ) ( not ( = ?auto_216371 ?auto_216375 ) ) ( not ( = ?auto_216371 ?auto_216376 ) ) ( not ( = ?auto_216372 ?auto_216373 ) ) ( not ( = ?auto_216372 ?auto_216374 ) ) ( not ( = ?auto_216372 ?auto_216375 ) ) ( not ( = ?auto_216372 ?auto_216376 ) ) ( not ( = ?auto_216373 ?auto_216374 ) ) ( not ( = ?auto_216373 ?auto_216375 ) ) ( not ( = ?auto_216373 ?auto_216376 ) ) ( not ( = ?auto_216374 ?auto_216375 ) ) ( not ( = ?auto_216374 ?auto_216376 ) ) ( not ( = ?auto_216375 ?auto_216376 ) ) ( ON ?auto_216376 ?auto_216378 ) ( not ( = ?auto_216371 ?auto_216378 ) ) ( not ( = ?auto_216372 ?auto_216378 ) ) ( not ( = ?auto_216373 ?auto_216378 ) ) ( not ( = ?auto_216374 ?auto_216378 ) ) ( not ( = ?auto_216375 ?auto_216378 ) ) ( not ( = ?auto_216376 ?auto_216378 ) ) ( ON ?auto_216375 ?auto_216376 ) ( ON-TABLE ?auto_216377 ) ( ON ?auto_216378 ?auto_216377 ) ( not ( = ?auto_216377 ?auto_216378 ) ) ( not ( = ?auto_216377 ?auto_216376 ) ) ( not ( = ?auto_216377 ?auto_216375 ) ) ( not ( = ?auto_216371 ?auto_216377 ) ) ( not ( = ?auto_216372 ?auto_216377 ) ) ( not ( = ?auto_216373 ?auto_216377 ) ) ( not ( = ?auto_216374 ?auto_216377 ) ) ( ON ?auto_216374 ?auto_216375 ) ( ON ?auto_216373 ?auto_216374 ) ( CLEAR ?auto_216373 ) ( HOLDING ?auto_216372 ) ( CLEAR ?auto_216371 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216371 ?auto_216372 )
      ( MAKE-6PILE ?auto_216371 ?auto_216372 ?auto_216373 ?auto_216374 ?auto_216375 ?auto_216376 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216379 - BLOCK
      ?auto_216380 - BLOCK
      ?auto_216381 - BLOCK
      ?auto_216382 - BLOCK
      ?auto_216383 - BLOCK
      ?auto_216384 - BLOCK
    )
    :vars
    (
      ?auto_216386 - BLOCK
      ?auto_216385 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216379 ) ( not ( = ?auto_216379 ?auto_216380 ) ) ( not ( = ?auto_216379 ?auto_216381 ) ) ( not ( = ?auto_216379 ?auto_216382 ) ) ( not ( = ?auto_216379 ?auto_216383 ) ) ( not ( = ?auto_216379 ?auto_216384 ) ) ( not ( = ?auto_216380 ?auto_216381 ) ) ( not ( = ?auto_216380 ?auto_216382 ) ) ( not ( = ?auto_216380 ?auto_216383 ) ) ( not ( = ?auto_216380 ?auto_216384 ) ) ( not ( = ?auto_216381 ?auto_216382 ) ) ( not ( = ?auto_216381 ?auto_216383 ) ) ( not ( = ?auto_216381 ?auto_216384 ) ) ( not ( = ?auto_216382 ?auto_216383 ) ) ( not ( = ?auto_216382 ?auto_216384 ) ) ( not ( = ?auto_216383 ?auto_216384 ) ) ( ON ?auto_216384 ?auto_216386 ) ( not ( = ?auto_216379 ?auto_216386 ) ) ( not ( = ?auto_216380 ?auto_216386 ) ) ( not ( = ?auto_216381 ?auto_216386 ) ) ( not ( = ?auto_216382 ?auto_216386 ) ) ( not ( = ?auto_216383 ?auto_216386 ) ) ( not ( = ?auto_216384 ?auto_216386 ) ) ( ON ?auto_216383 ?auto_216384 ) ( ON-TABLE ?auto_216385 ) ( ON ?auto_216386 ?auto_216385 ) ( not ( = ?auto_216385 ?auto_216386 ) ) ( not ( = ?auto_216385 ?auto_216384 ) ) ( not ( = ?auto_216385 ?auto_216383 ) ) ( not ( = ?auto_216379 ?auto_216385 ) ) ( not ( = ?auto_216380 ?auto_216385 ) ) ( not ( = ?auto_216381 ?auto_216385 ) ) ( not ( = ?auto_216382 ?auto_216385 ) ) ( ON ?auto_216382 ?auto_216383 ) ( ON ?auto_216381 ?auto_216382 ) ( CLEAR ?auto_216379 ) ( ON ?auto_216380 ?auto_216381 ) ( CLEAR ?auto_216380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216385 ?auto_216386 ?auto_216384 ?auto_216383 ?auto_216382 ?auto_216381 )
      ( MAKE-6PILE ?auto_216379 ?auto_216380 ?auto_216381 ?auto_216382 ?auto_216383 ?auto_216384 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216387 - BLOCK
      ?auto_216388 - BLOCK
      ?auto_216389 - BLOCK
      ?auto_216390 - BLOCK
      ?auto_216391 - BLOCK
      ?auto_216392 - BLOCK
    )
    :vars
    (
      ?auto_216393 - BLOCK
      ?auto_216394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216387 ?auto_216388 ) ) ( not ( = ?auto_216387 ?auto_216389 ) ) ( not ( = ?auto_216387 ?auto_216390 ) ) ( not ( = ?auto_216387 ?auto_216391 ) ) ( not ( = ?auto_216387 ?auto_216392 ) ) ( not ( = ?auto_216388 ?auto_216389 ) ) ( not ( = ?auto_216388 ?auto_216390 ) ) ( not ( = ?auto_216388 ?auto_216391 ) ) ( not ( = ?auto_216388 ?auto_216392 ) ) ( not ( = ?auto_216389 ?auto_216390 ) ) ( not ( = ?auto_216389 ?auto_216391 ) ) ( not ( = ?auto_216389 ?auto_216392 ) ) ( not ( = ?auto_216390 ?auto_216391 ) ) ( not ( = ?auto_216390 ?auto_216392 ) ) ( not ( = ?auto_216391 ?auto_216392 ) ) ( ON ?auto_216392 ?auto_216393 ) ( not ( = ?auto_216387 ?auto_216393 ) ) ( not ( = ?auto_216388 ?auto_216393 ) ) ( not ( = ?auto_216389 ?auto_216393 ) ) ( not ( = ?auto_216390 ?auto_216393 ) ) ( not ( = ?auto_216391 ?auto_216393 ) ) ( not ( = ?auto_216392 ?auto_216393 ) ) ( ON ?auto_216391 ?auto_216392 ) ( ON-TABLE ?auto_216394 ) ( ON ?auto_216393 ?auto_216394 ) ( not ( = ?auto_216394 ?auto_216393 ) ) ( not ( = ?auto_216394 ?auto_216392 ) ) ( not ( = ?auto_216394 ?auto_216391 ) ) ( not ( = ?auto_216387 ?auto_216394 ) ) ( not ( = ?auto_216388 ?auto_216394 ) ) ( not ( = ?auto_216389 ?auto_216394 ) ) ( not ( = ?auto_216390 ?auto_216394 ) ) ( ON ?auto_216390 ?auto_216391 ) ( ON ?auto_216389 ?auto_216390 ) ( ON ?auto_216388 ?auto_216389 ) ( CLEAR ?auto_216388 ) ( HOLDING ?auto_216387 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216387 )
      ( MAKE-6PILE ?auto_216387 ?auto_216388 ?auto_216389 ?auto_216390 ?auto_216391 ?auto_216392 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216395 - BLOCK
      ?auto_216396 - BLOCK
      ?auto_216397 - BLOCK
      ?auto_216398 - BLOCK
      ?auto_216399 - BLOCK
      ?auto_216400 - BLOCK
    )
    :vars
    (
      ?auto_216402 - BLOCK
      ?auto_216401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216395 ?auto_216396 ) ) ( not ( = ?auto_216395 ?auto_216397 ) ) ( not ( = ?auto_216395 ?auto_216398 ) ) ( not ( = ?auto_216395 ?auto_216399 ) ) ( not ( = ?auto_216395 ?auto_216400 ) ) ( not ( = ?auto_216396 ?auto_216397 ) ) ( not ( = ?auto_216396 ?auto_216398 ) ) ( not ( = ?auto_216396 ?auto_216399 ) ) ( not ( = ?auto_216396 ?auto_216400 ) ) ( not ( = ?auto_216397 ?auto_216398 ) ) ( not ( = ?auto_216397 ?auto_216399 ) ) ( not ( = ?auto_216397 ?auto_216400 ) ) ( not ( = ?auto_216398 ?auto_216399 ) ) ( not ( = ?auto_216398 ?auto_216400 ) ) ( not ( = ?auto_216399 ?auto_216400 ) ) ( ON ?auto_216400 ?auto_216402 ) ( not ( = ?auto_216395 ?auto_216402 ) ) ( not ( = ?auto_216396 ?auto_216402 ) ) ( not ( = ?auto_216397 ?auto_216402 ) ) ( not ( = ?auto_216398 ?auto_216402 ) ) ( not ( = ?auto_216399 ?auto_216402 ) ) ( not ( = ?auto_216400 ?auto_216402 ) ) ( ON ?auto_216399 ?auto_216400 ) ( ON-TABLE ?auto_216401 ) ( ON ?auto_216402 ?auto_216401 ) ( not ( = ?auto_216401 ?auto_216402 ) ) ( not ( = ?auto_216401 ?auto_216400 ) ) ( not ( = ?auto_216401 ?auto_216399 ) ) ( not ( = ?auto_216395 ?auto_216401 ) ) ( not ( = ?auto_216396 ?auto_216401 ) ) ( not ( = ?auto_216397 ?auto_216401 ) ) ( not ( = ?auto_216398 ?auto_216401 ) ) ( ON ?auto_216398 ?auto_216399 ) ( ON ?auto_216397 ?auto_216398 ) ( ON ?auto_216396 ?auto_216397 ) ( ON ?auto_216395 ?auto_216396 ) ( CLEAR ?auto_216395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216401 ?auto_216402 ?auto_216400 ?auto_216399 ?auto_216398 ?auto_216397 ?auto_216396 )
      ( MAKE-6PILE ?auto_216395 ?auto_216396 ?auto_216397 ?auto_216398 ?auto_216399 ?auto_216400 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216403 - BLOCK
      ?auto_216404 - BLOCK
      ?auto_216405 - BLOCK
      ?auto_216406 - BLOCK
      ?auto_216407 - BLOCK
      ?auto_216408 - BLOCK
    )
    :vars
    (
      ?auto_216409 - BLOCK
      ?auto_216410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216403 ?auto_216404 ) ) ( not ( = ?auto_216403 ?auto_216405 ) ) ( not ( = ?auto_216403 ?auto_216406 ) ) ( not ( = ?auto_216403 ?auto_216407 ) ) ( not ( = ?auto_216403 ?auto_216408 ) ) ( not ( = ?auto_216404 ?auto_216405 ) ) ( not ( = ?auto_216404 ?auto_216406 ) ) ( not ( = ?auto_216404 ?auto_216407 ) ) ( not ( = ?auto_216404 ?auto_216408 ) ) ( not ( = ?auto_216405 ?auto_216406 ) ) ( not ( = ?auto_216405 ?auto_216407 ) ) ( not ( = ?auto_216405 ?auto_216408 ) ) ( not ( = ?auto_216406 ?auto_216407 ) ) ( not ( = ?auto_216406 ?auto_216408 ) ) ( not ( = ?auto_216407 ?auto_216408 ) ) ( ON ?auto_216408 ?auto_216409 ) ( not ( = ?auto_216403 ?auto_216409 ) ) ( not ( = ?auto_216404 ?auto_216409 ) ) ( not ( = ?auto_216405 ?auto_216409 ) ) ( not ( = ?auto_216406 ?auto_216409 ) ) ( not ( = ?auto_216407 ?auto_216409 ) ) ( not ( = ?auto_216408 ?auto_216409 ) ) ( ON ?auto_216407 ?auto_216408 ) ( ON-TABLE ?auto_216410 ) ( ON ?auto_216409 ?auto_216410 ) ( not ( = ?auto_216410 ?auto_216409 ) ) ( not ( = ?auto_216410 ?auto_216408 ) ) ( not ( = ?auto_216410 ?auto_216407 ) ) ( not ( = ?auto_216403 ?auto_216410 ) ) ( not ( = ?auto_216404 ?auto_216410 ) ) ( not ( = ?auto_216405 ?auto_216410 ) ) ( not ( = ?auto_216406 ?auto_216410 ) ) ( ON ?auto_216406 ?auto_216407 ) ( ON ?auto_216405 ?auto_216406 ) ( ON ?auto_216404 ?auto_216405 ) ( HOLDING ?auto_216403 ) ( CLEAR ?auto_216404 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_216410 ?auto_216409 ?auto_216408 ?auto_216407 ?auto_216406 ?auto_216405 ?auto_216404 ?auto_216403 )
      ( MAKE-6PILE ?auto_216403 ?auto_216404 ?auto_216405 ?auto_216406 ?auto_216407 ?auto_216408 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216411 - BLOCK
      ?auto_216412 - BLOCK
      ?auto_216413 - BLOCK
      ?auto_216414 - BLOCK
      ?auto_216415 - BLOCK
      ?auto_216416 - BLOCK
    )
    :vars
    (
      ?auto_216418 - BLOCK
      ?auto_216417 - BLOCK
      ?auto_216419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216411 ?auto_216412 ) ) ( not ( = ?auto_216411 ?auto_216413 ) ) ( not ( = ?auto_216411 ?auto_216414 ) ) ( not ( = ?auto_216411 ?auto_216415 ) ) ( not ( = ?auto_216411 ?auto_216416 ) ) ( not ( = ?auto_216412 ?auto_216413 ) ) ( not ( = ?auto_216412 ?auto_216414 ) ) ( not ( = ?auto_216412 ?auto_216415 ) ) ( not ( = ?auto_216412 ?auto_216416 ) ) ( not ( = ?auto_216413 ?auto_216414 ) ) ( not ( = ?auto_216413 ?auto_216415 ) ) ( not ( = ?auto_216413 ?auto_216416 ) ) ( not ( = ?auto_216414 ?auto_216415 ) ) ( not ( = ?auto_216414 ?auto_216416 ) ) ( not ( = ?auto_216415 ?auto_216416 ) ) ( ON ?auto_216416 ?auto_216418 ) ( not ( = ?auto_216411 ?auto_216418 ) ) ( not ( = ?auto_216412 ?auto_216418 ) ) ( not ( = ?auto_216413 ?auto_216418 ) ) ( not ( = ?auto_216414 ?auto_216418 ) ) ( not ( = ?auto_216415 ?auto_216418 ) ) ( not ( = ?auto_216416 ?auto_216418 ) ) ( ON ?auto_216415 ?auto_216416 ) ( ON-TABLE ?auto_216417 ) ( ON ?auto_216418 ?auto_216417 ) ( not ( = ?auto_216417 ?auto_216418 ) ) ( not ( = ?auto_216417 ?auto_216416 ) ) ( not ( = ?auto_216417 ?auto_216415 ) ) ( not ( = ?auto_216411 ?auto_216417 ) ) ( not ( = ?auto_216412 ?auto_216417 ) ) ( not ( = ?auto_216413 ?auto_216417 ) ) ( not ( = ?auto_216414 ?auto_216417 ) ) ( ON ?auto_216414 ?auto_216415 ) ( ON ?auto_216413 ?auto_216414 ) ( ON ?auto_216412 ?auto_216413 ) ( CLEAR ?auto_216412 ) ( ON ?auto_216411 ?auto_216419 ) ( CLEAR ?auto_216411 ) ( HAND-EMPTY ) ( not ( = ?auto_216411 ?auto_216419 ) ) ( not ( = ?auto_216412 ?auto_216419 ) ) ( not ( = ?auto_216413 ?auto_216419 ) ) ( not ( = ?auto_216414 ?auto_216419 ) ) ( not ( = ?auto_216415 ?auto_216419 ) ) ( not ( = ?auto_216416 ?auto_216419 ) ) ( not ( = ?auto_216418 ?auto_216419 ) ) ( not ( = ?auto_216417 ?auto_216419 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216411 ?auto_216419 )
      ( MAKE-6PILE ?auto_216411 ?auto_216412 ?auto_216413 ?auto_216414 ?auto_216415 ?auto_216416 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216420 - BLOCK
      ?auto_216421 - BLOCK
      ?auto_216422 - BLOCK
      ?auto_216423 - BLOCK
      ?auto_216424 - BLOCK
      ?auto_216425 - BLOCK
    )
    :vars
    (
      ?auto_216427 - BLOCK
      ?auto_216428 - BLOCK
      ?auto_216426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216420 ?auto_216421 ) ) ( not ( = ?auto_216420 ?auto_216422 ) ) ( not ( = ?auto_216420 ?auto_216423 ) ) ( not ( = ?auto_216420 ?auto_216424 ) ) ( not ( = ?auto_216420 ?auto_216425 ) ) ( not ( = ?auto_216421 ?auto_216422 ) ) ( not ( = ?auto_216421 ?auto_216423 ) ) ( not ( = ?auto_216421 ?auto_216424 ) ) ( not ( = ?auto_216421 ?auto_216425 ) ) ( not ( = ?auto_216422 ?auto_216423 ) ) ( not ( = ?auto_216422 ?auto_216424 ) ) ( not ( = ?auto_216422 ?auto_216425 ) ) ( not ( = ?auto_216423 ?auto_216424 ) ) ( not ( = ?auto_216423 ?auto_216425 ) ) ( not ( = ?auto_216424 ?auto_216425 ) ) ( ON ?auto_216425 ?auto_216427 ) ( not ( = ?auto_216420 ?auto_216427 ) ) ( not ( = ?auto_216421 ?auto_216427 ) ) ( not ( = ?auto_216422 ?auto_216427 ) ) ( not ( = ?auto_216423 ?auto_216427 ) ) ( not ( = ?auto_216424 ?auto_216427 ) ) ( not ( = ?auto_216425 ?auto_216427 ) ) ( ON ?auto_216424 ?auto_216425 ) ( ON-TABLE ?auto_216428 ) ( ON ?auto_216427 ?auto_216428 ) ( not ( = ?auto_216428 ?auto_216427 ) ) ( not ( = ?auto_216428 ?auto_216425 ) ) ( not ( = ?auto_216428 ?auto_216424 ) ) ( not ( = ?auto_216420 ?auto_216428 ) ) ( not ( = ?auto_216421 ?auto_216428 ) ) ( not ( = ?auto_216422 ?auto_216428 ) ) ( not ( = ?auto_216423 ?auto_216428 ) ) ( ON ?auto_216423 ?auto_216424 ) ( ON ?auto_216422 ?auto_216423 ) ( ON ?auto_216420 ?auto_216426 ) ( CLEAR ?auto_216420 ) ( not ( = ?auto_216420 ?auto_216426 ) ) ( not ( = ?auto_216421 ?auto_216426 ) ) ( not ( = ?auto_216422 ?auto_216426 ) ) ( not ( = ?auto_216423 ?auto_216426 ) ) ( not ( = ?auto_216424 ?auto_216426 ) ) ( not ( = ?auto_216425 ?auto_216426 ) ) ( not ( = ?auto_216427 ?auto_216426 ) ) ( not ( = ?auto_216428 ?auto_216426 ) ) ( HOLDING ?auto_216421 ) ( CLEAR ?auto_216422 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216428 ?auto_216427 ?auto_216425 ?auto_216424 ?auto_216423 ?auto_216422 ?auto_216421 )
      ( MAKE-6PILE ?auto_216420 ?auto_216421 ?auto_216422 ?auto_216423 ?auto_216424 ?auto_216425 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216429 - BLOCK
      ?auto_216430 - BLOCK
      ?auto_216431 - BLOCK
      ?auto_216432 - BLOCK
      ?auto_216433 - BLOCK
      ?auto_216434 - BLOCK
    )
    :vars
    (
      ?auto_216436 - BLOCK
      ?auto_216437 - BLOCK
      ?auto_216435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216429 ?auto_216430 ) ) ( not ( = ?auto_216429 ?auto_216431 ) ) ( not ( = ?auto_216429 ?auto_216432 ) ) ( not ( = ?auto_216429 ?auto_216433 ) ) ( not ( = ?auto_216429 ?auto_216434 ) ) ( not ( = ?auto_216430 ?auto_216431 ) ) ( not ( = ?auto_216430 ?auto_216432 ) ) ( not ( = ?auto_216430 ?auto_216433 ) ) ( not ( = ?auto_216430 ?auto_216434 ) ) ( not ( = ?auto_216431 ?auto_216432 ) ) ( not ( = ?auto_216431 ?auto_216433 ) ) ( not ( = ?auto_216431 ?auto_216434 ) ) ( not ( = ?auto_216432 ?auto_216433 ) ) ( not ( = ?auto_216432 ?auto_216434 ) ) ( not ( = ?auto_216433 ?auto_216434 ) ) ( ON ?auto_216434 ?auto_216436 ) ( not ( = ?auto_216429 ?auto_216436 ) ) ( not ( = ?auto_216430 ?auto_216436 ) ) ( not ( = ?auto_216431 ?auto_216436 ) ) ( not ( = ?auto_216432 ?auto_216436 ) ) ( not ( = ?auto_216433 ?auto_216436 ) ) ( not ( = ?auto_216434 ?auto_216436 ) ) ( ON ?auto_216433 ?auto_216434 ) ( ON-TABLE ?auto_216437 ) ( ON ?auto_216436 ?auto_216437 ) ( not ( = ?auto_216437 ?auto_216436 ) ) ( not ( = ?auto_216437 ?auto_216434 ) ) ( not ( = ?auto_216437 ?auto_216433 ) ) ( not ( = ?auto_216429 ?auto_216437 ) ) ( not ( = ?auto_216430 ?auto_216437 ) ) ( not ( = ?auto_216431 ?auto_216437 ) ) ( not ( = ?auto_216432 ?auto_216437 ) ) ( ON ?auto_216432 ?auto_216433 ) ( ON ?auto_216431 ?auto_216432 ) ( ON ?auto_216429 ?auto_216435 ) ( not ( = ?auto_216429 ?auto_216435 ) ) ( not ( = ?auto_216430 ?auto_216435 ) ) ( not ( = ?auto_216431 ?auto_216435 ) ) ( not ( = ?auto_216432 ?auto_216435 ) ) ( not ( = ?auto_216433 ?auto_216435 ) ) ( not ( = ?auto_216434 ?auto_216435 ) ) ( not ( = ?auto_216436 ?auto_216435 ) ) ( not ( = ?auto_216437 ?auto_216435 ) ) ( CLEAR ?auto_216431 ) ( ON ?auto_216430 ?auto_216429 ) ( CLEAR ?auto_216430 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216435 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216435 ?auto_216429 )
      ( MAKE-6PILE ?auto_216429 ?auto_216430 ?auto_216431 ?auto_216432 ?auto_216433 ?auto_216434 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216438 - BLOCK
      ?auto_216439 - BLOCK
      ?auto_216440 - BLOCK
      ?auto_216441 - BLOCK
      ?auto_216442 - BLOCK
      ?auto_216443 - BLOCK
    )
    :vars
    (
      ?auto_216446 - BLOCK
      ?auto_216445 - BLOCK
      ?auto_216444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216438 ?auto_216439 ) ) ( not ( = ?auto_216438 ?auto_216440 ) ) ( not ( = ?auto_216438 ?auto_216441 ) ) ( not ( = ?auto_216438 ?auto_216442 ) ) ( not ( = ?auto_216438 ?auto_216443 ) ) ( not ( = ?auto_216439 ?auto_216440 ) ) ( not ( = ?auto_216439 ?auto_216441 ) ) ( not ( = ?auto_216439 ?auto_216442 ) ) ( not ( = ?auto_216439 ?auto_216443 ) ) ( not ( = ?auto_216440 ?auto_216441 ) ) ( not ( = ?auto_216440 ?auto_216442 ) ) ( not ( = ?auto_216440 ?auto_216443 ) ) ( not ( = ?auto_216441 ?auto_216442 ) ) ( not ( = ?auto_216441 ?auto_216443 ) ) ( not ( = ?auto_216442 ?auto_216443 ) ) ( ON ?auto_216443 ?auto_216446 ) ( not ( = ?auto_216438 ?auto_216446 ) ) ( not ( = ?auto_216439 ?auto_216446 ) ) ( not ( = ?auto_216440 ?auto_216446 ) ) ( not ( = ?auto_216441 ?auto_216446 ) ) ( not ( = ?auto_216442 ?auto_216446 ) ) ( not ( = ?auto_216443 ?auto_216446 ) ) ( ON ?auto_216442 ?auto_216443 ) ( ON-TABLE ?auto_216445 ) ( ON ?auto_216446 ?auto_216445 ) ( not ( = ?auto_216445 ?auto_216446 ) ) ( not ( = ?auto_216445 ?auto_216443 ) ) ( not ( = ?auto_216445 ?auto_216442 ) ) ( not ( = ?auto_216438 ?auto_216445 ) ) ( not ( = ?auto_216439 ?auto_216445 ) ) ( not ( = ?auto_216440 ?auto_216445 ) ) ( not ( = ?auto_216441 ?auto_216445 ) ) ( ON ?auto_216441 ?auto_216442 ) ( ON ?auto_216438 ?auto_216444 ) ( not ( = ?auto_216438 ?auto_216444 ) ) ( not ( = ?auto_216439 ?auto_216444 ) ) ( not ( = ?auto_216440 ?auto_216444 ) ) ( not ( = ?auto_216441 ?auto_216444 ) ) ( not ( = ?auto_216442 ?auto_216444 ) ) ( not ( = ?auto_216443 ?auto_216444 ) ) ( not ( = ?auto_216446 ?auto_216444 ) ) ( not ( = ?auto_216445 ?auto_216444 ) ) ( ON ?auto_216439 ?auto_216438 ) ( CLEAR ?auto_216439 ) ( ON-TABLE ?auto_216444 ) ( HOLDING ?auto_216440 ) ( CLEAR ?auto_216441 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216445 ?auto_216446 ?auto_216443 ?auto_216442 ?auto_216441 ?auto_216440 )
      ( MAKE-6PILE ?auto_216438 ?auto_216439 ?auto_216440 ?auto_216441 ?auto_216442 ?auto_216443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216447 - BLOCK
      ?auto_216448 - BLOCK
      ?auto_216449 - BLOCK
      ?auto_216450 - BLOCK
      ?auto_216451 - BLOCK
      ?auto_216452 - BLOCK
    )
    :vars
    (
      ?auto_216454 - BLOCK
      ?auto_216453 - BLOCK
      ?auto_216455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216447 ?auto_216448 ) ) ( not ( = ?auto_216447 ?auto_216449 ) ) ( not ( = ?auto_216447 ?auto_216450 ) ) ( not ( = ?auto_216447 ?auto_216451 ) ) ( not ( = ?auto_216447 ?auto_216452 ) ) ( not ( = ?auto_216448 ?auto_216449 ) ) ( not ( = ?auto_216448 ?auto_216450 ) ) ( not ( = ?auto_216448 ?auto_216451 ) ) ( not ( = ?auto_216448 ?auto_216452 ) ) ( not ( = ?auto_216449 ?auto_216450 ) ) ( not ( = ?auto_216449 ?auto_216451 ) ) ( not ( = ?auto_216449 ?auto_216452 ) ) ( not ( = ?auto_216450 ?auto_216451 ) ) ( not ( = ?auto_216450 ?auto_216452 ) ) ( not ( = ?auto_216451 ?auto_216452 ) ) ( ON ?auto_216452 ?auto_216454 ) ( not ( = ?auto_216447 ?auto_216454 ) ) ( not ( = ?auto_216448 ?auto_216454 ) ) ( not ( = ?auto_216449 ?auto_216454 ) ) ( not ( = ?auto_216450 ?auto_216454 ) ) ( not ( = ?auto_216451 ?auto_216454 ) ) ( not ( = ?auto_216452 ?auto_216454 ) ) ( ON ?auto_216451 ?auto_216452 ) ( ON-TABLE ?auto_216453 ) ( ON ?auto_216454 ?auto_216453 ) ( not ( = ?auto_216453 ?auto_216454 ) ) ( not ( = ?auto_216453 ?auto_216452 ) ) ( not ( = ?auto_216453 ?auto_216451 ) ) ( not ( = ?auto_216447 ?auto_216453 ) ) ( not ( = ?auto_216448 ?auto_216453 ) ) ( not ( = ?auto_216449 ?auto_216453 ) ) ( not ( = ?auto_216450 ?auto_216453 ) ) ( ON ?auto_216450 ?auto_216451 ) ( ON ?auto_216447 ?auto_216455 ) ( not ( = ?auto_216447 ?auto_216455 ) ) ( not ( = ?auto_216448 ?auto_216455 ) ) ( not ( = ?auto_216449 ?auto_216455 ) ) ( not ( = ?auto_216450 ?auto_216455 ) ) ( not ( = ?auto_216451 ?auto_216455 ) ) ( not ( = ?auto_216452 ?auto_216455 ) ) ( not ( = ?auto_216454 ?auto_216455 ) ) ( not ( = ?auto_216453 ?auto_216455 ) ) ( ON ?auto_216448 ?auto_216447 ) ( ON-TABLE ?auto_216455 ) ( CLEAR ?auto_216450 ) ( ON ?auto_216449 ?auto_216448 ) ( CLEAR ?auto_216449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216455 ?auto_216447 ?auto_216448 )
      ( MAKE-6PILE ?auto_216447 ?auto_216448 ?auto_216449 ?auto_216450 ?auto_216451 ?auto_216452 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216456 - BLOCK
      ?auto_216457 - BLOCK
      ?auto_216458 - BLOCK
      ?auto_216459 - BLOCK
      ?auto_216460 - BLOCK
      ?auto_216461 - BLOCK
    )
    :vars
    (
      ?auto_216463 - BLOCK
      ?auto_216462 - BLOCK
      ?auto_216464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216456 ?auto_216457 ) ) ( not ( = ?auto_216456 ?auto_216458 ) ) ( not ( = ?auto_216456 ?auto_216459 ) ) ( not ( = ?auto_216456 ?auto_216460 ) ) ( not ( = ?auto_216456 ?auto_216461 ) ) ( not ( = ?auto_216457 ?auto_216458 ) ) ( not ( = ?auto_216457 ?auto_216459 ) ) ( not ( = ?auto_216457 ?auto_216460 ) ) ( not ( = ?auto_216457 ?auto_216461 ) ) ( not ( = ?auto_216458 ?auto_216459 ) ) ( not ( = ?auto_216458 ?auto_216460 ) ) ( not ( = ?auto_216458 ?auto_216461 ) ) ( not ( = ?auto_216459 ?auto_216460 ) ) ( not ( = ?auto_216459 ?auto_216461 ) ) ( not ( = ?auto_216460 ?auto_216461 ) ) ( ON ?auto_216461 ?auto_216463 ) ( not ( = ?auto_216456 ?auto_216463 ) ) ( not ( = ?auto_216457 ?auto_216463 ) ) ( not ( = ?auto_216458 ?auto_216463 ) ) ( not ( = ?auto_216459 ?auto_216463 ) ) ( not ( = ?auto_216460 ?auto_216463 ) ) ( not ( = ?auto_216461 ?auto_216463 ) ) ( ON ?auto_216460 ?auto_216461 ) ( ON-TABLE ?auto_216462 ) ( ON ?auto_216463 ?auto_216462 ) ( not ( = ?auto_216462 ?auto_216463 ) ) ( not ( = ?auto_216462 ?auto_216461 ) ) ( not ( = ?auto_216462 ?auto_216460 ) ) ( not ( = ?auto_216456 ?auto_216462 ) ) ( not ( = ?auto_216457 ?auto_216462 ) ) ( not ( = ?auto_216458 ?auto_216462 ) ) ( not ( = ?auto_216459 ?auto_216462 ) ) ( ON ?auto_216456 ?auto_216464 ) ( not ( = ?auto_216456 ?auto_216464 ) ) ( not ( = ?auto_216457 ?auto_216464 ) ) ( not ( = ?auto_216458 ?auto_216464 ) ) ( not ( = ?auto_216459 ?auto_216464 ) ) ( not ( = ?auto_216460 ?auto_216464 ) ) ( not ( = ?auto_216461 ?auto_216464 ) ) ( not ( = ?auto_216463 ?auto_216464 ) ) ( not ( = ?auto_216462 ?auto_216464 ) ) ( ON ?auto_216457 ?auto_216456 ) ( ON-TABLE ?auto_216464 ) ( ON ?auto_216458 ?auto_216457 ) ( CLEAR ?auto_216458 ) ( HOLDING ?auto_216459 ) ( CLEAR ?auto_216460 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216462 ?auto_216463 ?auto_216461 ?auto_216460 ?auto_216459 )
      ( MAKE-6PILE ?auto_216456 ?auto_216457 ?auto_216458 ?auto_216459 ?auto_216460 ?auto_216461 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216465 - BLOCK
      ?auto_216466 - BLOCK
      ?auto_216467 - BLOCK
      ?auto_216468 - BLOCK
      ?auto_216469 - BLOCK
      ?auto_216470 - BLOCK
    )
    :vars
    (
      ?auto_216471 - BLOCK
      ?auto_216473 - BLOCK
      ?auto_216472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216465 ?auto_216466 ) ) ( not ( = ?auto_216465 ?auto_216467 ) ) ( not ( = ?auto_216465 ?auto_216468 ) ) ( not ( = ?auto_216465 ?auto_216469 ) ) ( not ( = ?auto_216465 ?auto_216470 ) ) ( not ( = ?auto_216466 ?auto_216467 ) ) ( not ( = ?auto_216466 ?auto_216468 ) ) ( not ( = ?auto_216466 ?auto_216469 ) ) ( not ( = ?auto_216466 ?auto_216470 ) ) ( not ( = ?auto_216467 ?auto_216468 ) ) ( not ( = ?auto_216467 ?auto_216469 ) ) ( not ( = ?auto_216467 ?auto_216470 ) ) ( not ( = ?auto_216468 ?auto_216469 ) ) ( not ( = ?auto_216468 ?auto_216470 ) ) ( not ( = ?auto_216469 ?auto_216470 ) ) ( ON ?auto_216470 ?auto_216471 ) ( not ( = ?auto_216465 ?auto_216471 ) ) ( not ( = ?auto_216466 ?auto_216471 ) ) ( not ( = ?auto_216467 ?auto_216471 ) ) ( not ( = ?auto_216468 ?auto_216471 ) ) ( not ( = ?auto_216469 ?auto_216471 ) ) ( not ( = ?auto_216470 ?auto_216471 ) ) ( ON ?auto_216469 ?auto_216470 ) ( ON-TABLE ?auto_216473 ) ( ON ?auto_216471 ?auto_216473 ) ( not ( = ?auto_216473 ?auto_216471 ) ) ( not ( = ?auto_216473 ?auto_216470 ) ) ( not ( = ?auto_216473 ?auto_216469 ) ) ( not ( = ?auto_216465 ?auto_216473 ) ) ( not ( = ?auto_216466 ?auto_216473 ) ) ( not ( = ?auto_216467 ?auto_216473 ) ) ( not ( = ?auto_216468 ?auto_216473 ) ) ( ON ?auto_216465 ?auto_216472 ) ( not ( = ?auto_216465 ?auto_216472 ) ) ( not ( = ?auto_216466 ?auto_216472 ) ) ( not ( = ?auto_216467 ?auto_216472 ) ) ( not ( = ?auto_216468 ?auto_216472 ) ) ( not ( = ?auto_216469 ?auto_216472 ) ) ( not ( = ?auto_216470 ?auto_216472 ) ) ( not ( = ?auto_216471 ?auto_216472 ) ) ( not ( = ?auto_216473 ?auto_216472 ) ) ( ON ?auto_216466 ?auto_216465 ) ( ON-TABLE ?auto_216472 ) ( ON ?auto_216467 ?auto_216466 ) ( CLEAR ?auto_216469 ) ( ON ?auto_216468 ?auto_216467 ) ( CLEAR ?auto_216468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216472 ?auto_216465 ?auto_216466 ?auto_216467 )
      ( MAKE-6PILE ?auto_216465 ?auto_216466 ?auto_216467 ?auto_216468 ?auto_216469 ?auto_216470 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216474 - BLOCK
      ?auto_216475 - BLOCK
      ?auto_216476 - BLOCK
      ?auto_216477 - BLOCK
      ?auto_216478 - BLOCK
      ?auto_216479 - BLOCK
    )
    :vars
    (
      ?auto_216481 - BLOCK
      ?auto_216482 - BLOCK
      ?auto_216480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216474 ?auto_216475 ) ) ( not ( = ?auto_216474 ?auto_216476 ) ) ( not ( = ?auto_216474 ?auto_216477 ) ) ( not ( = ?auto_216474 ?auto_216478 ) ) ( not ( = ?auto_216474 ?auto_216479 ) ) ( not ( = ?auto_216475 ?auto_216476 ) ) ( not ( = ?auto_216475 ?auto_216477 ) ) ( not ( = ?auto_216475 ?auto_216478 ) ) ( not ( = ?auto_216475 ?auto_216479 ) ) ( not ( = ?auto_216476 ?auto_216477 ) ) ( not ( = ?auto_216476 ?auto_216478 ) ) ( not ( = ?auto_216476 ?auto_216479 ) ) ( not ( = ?auto_216477 ?auto_216478 ) ) ( not ( = ?auto_216477 ?auto_216479 ) ) ( not ( = ?auto_216478 ?auto_216479 ) ) ( ON ?auto_216479 ?auto_216481 ) ( not ( = ?auto_216474 ?auto_216481 ) ) ( not ( = ?auto_216475 ?auto_216481 ) ) ( not ( = ?auto_216476 ?auto_216481 ) ) ( not ( = ?auto_216477 ?auto_216481 ) ) ( not ( = ?auto_216478 ?auto_216481 ) ) ( not ( = ?auto_216479 ?auto_216481 ) ) ( ON-TABLE ?auto_216482 ) ( ON ?auto_216481 ?auto_216482 ) ( not ( = ?auto_216482 ?auto_216481 ) ) ( not ( = ?auto_216482 ?auto_216479 ) ) ( not ( = ?auto_216482 ?auto_216478 ) ) ( not ( = ?auto_216474 ?auto_216482 ) ) ( not ( = ?auto_216475 ?auto_216482 ) ) ( not ( = ?auto_216476 ?auto_216482 ) ) ( not ( = ?auto_216477 ?auto_216482 ) ) ( ON ?auto_216474 ?auto_216480 ) ( not ( = ?auto_216474 ?auto_216480 ) ) ( not ( = ?auto_216475 ?auto_216480 ) ) ( not ( = ?auto_216476 ?auto_216480 ) ) ( not ( = ?auto_216477 ?auto_216480 ) ) ( not ( = ?auto_216478 ?auto_216480 ) ) ( not ( = ?auto_216479 ?auto_216480 ) ) ( not ( = ?auto_216481 ?auto_216480 ) ) ( not ( = ?auto_216482 ?auto_216480 ) ) ( ON ?auto_216475 ?auto_216474 ) ( ON-TABLE ?auto_216480 ) ( ON ?auto_216476 ?auto_216475 ) ( ON ?auto_216477 ?auto_216476 ) ( CLEAR ?auto_216477 ) ( HOLDING ?auto_216478 ) ( CLEAR ?auto_216479 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216482 ?auto_216481 ?auto_216479 ?auto_216478 )
      ( MAKE-6PILE ?auto_216474 ?auto_216475 ?auto_216476 ?auto_216477 ?auto_216478 ?auto_216479 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216483 - BLOCK
      ?auto_216484 - BLOCK
      ?auto_216485 - BLOCK
      ?auto_216486 - BLOCK
      ?auto_216487 - BLOCK
      ?auto_216488 - BLOCK
    )
    :vars
    (
      ?auto_216489 - BLOCK
      ?auto_216490 - BLOCK
      ?auto_216491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216483 ?auto_216484 ) ) ( not ( = ?auto_216483 ?auto_216485 ) ) ( not ( = ?auto_216483 ?auto_216486 ) ) ( not ( = ?auto_216483 ?auto_216487 ) ) ( not ( = ?auto_216483 ?auto_216488 ) ) ( not ( = ?auto_216484 ?auto_216485 ) ) ( not ( = ?auto_216484 ?auto_216486 ) ) ( not ( = ?auto_216484 ?auto_216487 ) ) ( not ( = ?auto_216484 ?auto_216488 ) ) ( not ( = ?auto_216485 ?auto_216486 ) ) ( not ( = ?auto_216485 ?auto_216487 ) ) ( not ( = ?auto_216485 ?auto_216488 ) ) ( not ( = ?auto_216486 ?auto_216487 ) ) ( not ( = ?auto_216486 ?auto_216488 ) ) ( not ( = ?auto_216487 ?auto_216488 ) ) ( ON ?auto_216488 ?auto_216489 ) ( not ( = ?auto_216483 ?auto_216489 ) ) ( not ( = ?auto_216484 ?auto_216489 ) ) ( not ( = ?auto_216485 ?auto_216489 ) ) ( not ( = ?auto_216486 ?auto_216489 ) ) ( not ( = ?auto_216487 ?auto_216489 ) ) ( not ( = ?auto_216488 ?auto_216489 ) ) ( ON-TABLE ?auto_216490 ) ( ON ?auto_216489 ?auto_216490 ) ( not ( = ?auto_216490 ?auto_216489 ) ) ( not ( = ?auto_216490 ?auto_216488 ) ) ( not ( = ?auto_216490 ?auto_216487 ) ) ( not ( = ?auto_216483 ?auto_216490 ) ) ( not ( = ?auto_216484 ?auto_216490 ) ) ( not ( = ?auto_216485 ?auto_216490 ) ) ( not ( = ?auto_216486 ?auto_216490 ) ) ( ON ?auto_216483 ?auto_216491 ) ( not ( = ?auto_216483 ?auto_216491 ) ) ( not ( = ?auto_216484 ?auto_216491 ) ) ( not ( = ?auto_216485 ?auto_216491 ) ) ( not ( = ?auto_216486 ?auto_216491 ) ) ( not ( = ?auto_216487 ?auto_216491 ) ) ( not ( = ?auto_216488 ?auto_216491 ) ) ( not ( = ?auto_216489 ?auto_216491 ) ) ( not ( = ?auto_216490 ?auto_216491 ) ) ( ON ?auto_216484 ?auto_216483 ) ( ON-TABLE ?auto_216491 ) ( ON ?auto_216485 ?auto_216484 ) ( ON ?auto_216486 ?auto_216485 ) ( CLEAR ?auto_216488 ) ( ON ?auto_216487 ?auto_216486 ) ( CLEAR ?auto_216487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216491 ?auto_216483 ?auto_216484 ?auto_216485 ?auto_216486 )
      ( MAKE-6PILE ?auto_216483 ?auto_216484 ?auto_216485 ?auto_216486 ?auto_216487 ?auto_216488 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216492 - BLOCK
      ?auto_216493 - BLOCK
      ?auto_216494 - BLOCK
      ?auto_216495 - BLOCK
      ?auto_216496 - BLOCK
      ?auto_216497 - BLOCK
    )
    :vars
    (
      ?auto_216500 - BLOCK
      ?auto_216498 - BLOCK
      ?auto_216499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216492 ?auto_216493 ) ) ( not ( = ?auto_216492 ?auto_216494 ) ) ( not ( = ?auto_216492 ?auto_216495 ) ) ( not ( = ?auto_216492 ?auto_216496 ) ) ( not ( = ?auto_216492 ?auto_216497 ) ) ( not ( = ?auto_216493 ?auto_216494 ) ) ( not ( = ?auto_216493 ?auto_216495 ) ) ( not ( = ?auto_216493 ?auto_216496 ) ) ( not ( = ?auto_216493 ?auto_216497 ) ) ( not ( = ?auto_216494 ?auto_216495 ) ) ( not ( = ?auto_216494 ?auto_216496 ) ) ( not ( = ?auto_216494 ?auto_216497 ) ) ( not ( = ?auto_216495 ?auto_216496 ) ) ( not ( = ?auto_216495 ?auto_216497 ) ) ( not ( = ?auto_216496 ?auto_216497 ) ) ( not ( = ?auto_216492 ?auto_216500 ) ) ( not ( = ?auto_216493 ?auto_216500 ) ) ( not ( = ?auto_216494 ?auto_216500 ) ) ( not ( = ?auto_216495 ?auto_216500 ) ) ( not ( = ?auto_216496 ?auto_216500 ) ) ( not ( = ?auto_216497 ?auto_216500 ) ) ( ON-TABLE ?auto_216498 ) ( ON ?auto_216500 ?auto_216498 ) ( not ( = ?auto_216498 ?auto_216500 ) ) ( not ( = ?auto_216498 ?auto_216497 ) ) ( not ( = ?auto_216498 ?auto_216496 ) ) ( not ( = ?auto_216492 ?auto_216498 ) ) ( not ( = ?auto_216493 ?auto_216498 ) ) ( not ( = ?auto_216494 ?auto_216498 ) ) ( not ( = ?auto_216495 ?auto_216498 ) ) ( ON ?auto_216492 ?auto_216499 ) ( not ( = ?auto_216492 ?auto_216499 ) ) ( not ( = ?auto_216493 ?auto_216499 ) ) ( not ( = ?auto_216494 ?auto_216499 ) ) ( not ( = ?auto_216495 ?auto_216499 ) ) ( not ( = ?auto_216496 ?auto_216499 ) ) ( not ( = ?auto_216497 ?auto_216499 ) ) ( not ( = ?auto_216500 ?auto_216499 ) ) ( not ( = ?auto_216498 ?auto_216499 ) ) ( ON ?auto_216493 ?auto_216492 ) ( ON-TABLE ?auto_216499 ) ( ON ?auto_216494 ?auto_216493 ) ( ON ?auto_216495 ?auto_216494 ) ( ON ?auto_216496 ?auto_216495 ) ( CLEAR ?auto_216496 ) ( HOLDING ?auto_216497 ) ( CLEAR ?auto_216500 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216498 ?auto_216500 ?auto_216497 )
      ( MAKE-6PILE ?auto_216492 ?auto_216493 ?auto_216494 ?auto_216495 ?auto_216496 ?auto_216497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216501 - BLOCK
      ?auto_216502 - BLOCK
      ?auto_216503 - BLOCK
      ?auto_216504 - BLOCK
      ?auto_216505 - BLOCK
      ?auto_216506 - BLOCK
    )
    :vars
    (
      ?auto_216508 - BLOCK
      ?auto_216509 - BLOCK
      ?auto_216507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216501 ?auto_216502 ) ) ( not ( = ?auto_216501 ?auto_216503 ) ) ( not ( = ?auto_216501 ?auto_216504 ) ) ( not ( = ?auto_216501 ?auto_216505 ) ) ( not ( = ?auto_216501 ?auto_216506 ) ) ( not ( = ?auto_216502 ?auto_216503 ) ) ( not ( = ?auto_216502 ?auto_216504 ) ) ( not ( = ?auto_216502 ?auto_216505 ) ) ( not ( = ?auto_216502 ?auto_216506 ) ) ( not ( = ?auto_216503 ?auto_216504 ) ) ( not ( = ?auto_216503 ?auto_216505 ) ) ( not ( = ?auto_216503 ?auto_216506 ) ) ( not ( = ?auto_216504 ?auto_216505 ) ) ( not ( = ?auto_216504 ?auto_216506 ) ) ( not ( = ?auto_216505 ?auto_216506 ) ) ( not ( = ?auto_216501 ?auto_216508 ) ) ( not ( = ?auto_216502 ?auto_216508 ) ) ( not ( = ?auto_216503 ?auto_216508 ) ) ( not ( = ?auto_216504 ?auto_216508 ) ) ( not ( = ?auto_216505 ?auto_216508 ) ) ( not ( = ?auto_216506 ?auto_216508 ) ) ( ON-TABLE ?auto_216509 ) ( ON ?auto_216508 ?auto_216509 ) ( not ( = ?auto_216509 ?auto_216508 ) ) ( not ( = ?auto_216509 ?auto_216506 ) ) ( not ( = ?auto_216509 ?auto_216505 ) ) ( not ( = ?auto_216501 ?auto_216509 ) ) ( not ( = ?auto_216502 ?auto_216509 ) ) ( not ( = ?auto_216503 ?auto_216509 ) ) ( not ( = ?auto_216504 ?auto_216509 ) ) ( ON ?auto_216501 ?auto_216507 ) ( not ( = ?auto_216501 ?auto_216507 ) ) ( not ( = ?auto_216502 ?auto_216507 ) ) ( not ( = ?auto_216503 ?auto_216507 ) ) ( not ( = ?auto_216504 ?auto_216507 ) ) ( not ( = ?auto_216505 ?auto_216507 ) ) ( not ( = ?auto_216506 ?auto_216507 ) ) ( not ( = ?auto_216508 ?auto_216507 ) ) ( not ( = ?auto_216509 ?auto_216507 ) ) ( ON ?auto_216502 ?auto_216501 ) ( ON-TABLE ?auto_216507 ) ( ON ?auto_216503 ?auto_216502 ) ( ON ?auto_216504 ?auto_216503 ) ( ON ?auto_216505 ?auto_216504 ) ( CLEAR ?auto_216508 ) ( ON ?auto_216506 ?auto_216505 ) ( CLEAR ?auto_216506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216507 ?auto_216501 ?auto_216502 ?auto_216503 ?auto_216504 ?auto_216505 )
      ( MAKE-6PILE ?auto_216501 ?auto_216502 ?auto_216503 ?auto_216504 ?auto_216505 ?auto_216506 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216510 - BLOCK
      ?auto_216511 - BLOCK
      ?auto_216512 - BLOCK
      ?auto_216513 - BLOCK
      ?auto_216514 - BLOCK
      ?auto_216515 - BLOCK
    )
    :vars
    (
      ?auto_216518 - BLOCK
      ?auto_216516 - BLOCK
      ?auto_216517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216510 ?auto_216511 ) ) ( not ( = ?auto_216510 ?auto_216512 ) ) ( not ( = ?auto_216510 ?auto_216513 ) ) ( not ( = ?auto_216510 ?auto_216514 ) ) ( not ( = ?auto_216510 ?auto_216515 ) ) ( not ( = ?auto_216511 ?auto_216512 ) ) ( not ( = ?auto_216511 ?auto_216513 ) ) ( not ( = ?auto_216511 ?auto_216514 ) ) ( not ( = ?auto_216511 ?auto_216515 ) ) ( not ( = ?auto_216512 ?auto_216513 ) ) ( not ( = ?auto_216512 ?auto_216514 ) ) ( not ( = ?auto_216512 ?auto_216515 ) ) ( not ( = ?auto_216513 ?auto_216514 ) ) ( not ( = ?auto_216513 ?auto_216515 ) ) ( not ( = ?auto_216514 ?auto_216515 ) ) ( not ( = ?auto_216510 ?auto_216518 ) ) ( not ( = ?auto_216511 ?auto_216518 ) ) ( not ( = ?auto_216512 ?auto_216518 ) ) ( not ( = ?auto_216513 ?auto_216518 ) ) ( not ( = ?auto_216514 ?auto_216518 ) ) ( not ( = ?auto_216515 ?auto_216518 ) ) ( ON-TABLE ?auto_216516 ) ( not ( = ?auto_216516 ?auto_216518 ) ) ( not ( = ?auto_216516 ?auto_216515 ) ) ( not ( = ?auto_216516 ?auto_216514 ) ) ( not ( = ?auto_216510 ?auto_216516 ) ) ( not ( = ?auto_216511 ?auto_216516 ) ) ( not ( = ?auto_216512 ?auto_216516 ) ) ( not ( = ?auto_216513 ?auto_216516 ) ) ( ON ?auto_216510 ?auto_216517 ) ( not ( = ?auto_216510 ?auto_216517 ) ) ( not ( = ?auto_216511 ?auto_216517 ) ) ( not ( = ?auto_216512 ?auto_216517 ) ) ( not ( = ?auto_216513 ?auto_216517 ) ) ( not ( = ?auto_216514 ?auto_216517 ) ) ( not ( = ?auto_216515 ?auto_216517 ) ) ( not ( = ?auto_216518 ?auto_216517 ) ) ( not ( = ?auto_216516 ?auto_216517 ) ) ( ON ?auto_216511 ?auto_216510 ) ( ON-TABLE ?auto_216517 ) ( ON ?auto_216512 ?auto_216511 ) ( ON ?auto_216513 ?auto_216512 ) ( ON ?auto_216514 ?auto_216513 ) ( ON ?auto_216515 ?auto_216514 ) ( CLEAR ?auto_216515 ) ( HOLDING ?auto_216518 ) ( CLEAR ?auto_216516 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216516 ?auto_216518 )
      ( MAKE-6PILE ?auto_216510 ?auto_216511 ?auto_216512 ?auto_216513 ?auto_216514 ?auto_216515 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216519 - BLOCK
      ?auto_216520 - BLOCK
      ?auto_216521 - BLOCK
      ?auto_216522 - BLOCK
      ?auto_216523 - BLOCK
      ?auto_216524 - BLOCK
    )
    :vars
    (
      ?auto_216527 - BLOCK
      ?auto_216525 - BLOCK
      ?auto_216526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216519 ?auto_216520 ) ) ( not ( = ?auto_216519 ?auto_216521 ) ) ( not ( = ?auto_216519 ?auto_216522 ) ) ( not ( = ?auto_216519 ?auto_216523 ) ) ( not ( = ?auto_216519 ?auto_216524 ) ) ( not ( = ?auto_216520 ?auto_216521 ) ) ( not ( = ?auto_216520 ?auto_216522 ) ) ( not ( = ?auto_216520 ?auto_216523 ) ) ( not ( = ?auto_216520 ?auto_216524 ) ) ( not ( = ?auto_216521 ?auto_216522 ) ) ( not ( = ?auto_216521 ?auto_216523 ) ) ( not ( = ?auto_216521 ?auto_216524 ) ) ( not ( = ?auto_216522 ?auto_216523 ) ) ( not ( = ?auto_216522 ?auto_216524 ) ) ( not ( = ?auto_216523 ?auto_216524 ) ) ( not ( = ?auto_216519 ?auto_216527 ) ) ( not ( = ?auto_216520 ?auto_216527 ) ) ( not ( = ?auto_216521 ?auto_216527 ) ) ( not ( = ?auto_216522 ?auto_216527 ) ) ( not ( = ?auto_216523 ?auto_216527 ) ) ( not ( = ?auto_216524 ?auto_216527 ) ) ( ON-TABLE ?auto_216525 ) ( not ( = ?auto_216525 ?auto_216527 ) ) ( not ( = ?auto_216525 ?auto_216524 ) ) ( not ( = ?auto_216525 ?auto_216523 ) ) ( not ( = ?auto_216519 ?auto_216525 ) ) ( not ( = ?auto_216520 ?auto_216525 ) ) ( not ( = ?auto_216521 ?auto_216525 ) ) ( not ( = ?auto_216522 ?auto_216525 ) ) ( ON ?auto_216519 ?auto_216526 ) ( not ( = ?auto_216519 ?auto_216526 ) ) ( not ( = ?auto_216520 ?auto_216526 ) ) ( not ( = ?auto_216521 ?auto_216526 ) ) ( not ( = ?auto_216522 ?auto_216526 ) ) ( not ( = ?auto_216523 ?auto_216526 ) ) ( not ( = ?auto_216524 ?auto_216526 ) ) ( not ( = ?auto_216527 ?auto_216526 ) ) ( not ( = ?auto_216525 ?auto_216526 ) ) ( ON ?auto_216520 ?auto_216519 ) ( ON-TABLE ?auto_216526 ) ( ON ?auto_216521 ?auto_216520 ) ( ON ?auto_216522 ?auto_216521 ) ( ON ?auto_216523 ?auto_216522 ) ( ON ?auto_216524 ?auto_216523 ) ( CLEAR ?auto_216525 ) ( ON ?auto_216527 ?auto_216524 ) ( CLEAR ?auto_216527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216526 ?auto_216519 ?auto_216520 ?auto_216521 ?auto_216522 ?auto_216523 ?auto_216524 )
      ( MAKE-6PILE ?auto_216519 ?auto_216520 ?auto_216521 ?auto_216522 ?auto_216523 ?auto_216524 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216528 - BLOCK
      ?auto_216529 - BLOCK
      ?auto_216530 - BLOCK
      ?auto_216531 - BLOCK
      ?auto_216532 - BLOCK
      ?auto_216533 - BLOCK
    )
    :vars
    (
      ?auto_216535 - BLOCK
      ?auto_216534 - BLOCK
      ?auto_216536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216528 ?auto_216529 ) ) ( not ( = ?auto_216528 ?auto_216530 ) ) ( not ( = ?auto_216528 ?auto_216531 ) ) ( not ( = ?auto_216528 ?auto_216532 ) ) ( not ( = ?auto_216528 ?auto_216533 ) ) ( not ( = ?auto_216529 ?auto_216530 ) ) ( not ( = ?auto_216529 ?auto_216531 ) ) ( not ( = ?auto_216529 ?auto_216532 ) ) ( not ( = ?auto_216529 ?auto_216533 ) ) ( not ( = ?auto_216530 ?auto_216531 ) ) ( not ( = ?auto_216530 ?auto_216532 ) ) ( not ( = ?auto_216530 ?auto_216533 ) ) ( not ( = ?auto_216531 ?auto_216532 ) ) ( not ( = ?auto_216531 ?auto_216533 ) ) ( not ( = ?auto_216532 ?auto_216533 ) ) ( not ( = ?auto_216528 ?auto_216535 ) ) ( not ( = ?auto_216529 ?auto_216535 ) ) ( not ( = ?auto_216530 ?auto_216535 ) ) ( not ( = ?auto_216531 ?auto_216535 ) ) ( not ( = ?auto_216532 ?auto_216535 ) ) ( not ( = ?auto_216533 ?auto_216535 ) ) ( not ( = ?auto_216534 ?auto_216535 ) ) ( not ( = ?auto_216534 ?auto_216533 ) ) ( not ( = ?auto_216534 ?auto_216532 ) ) ( not ( = ?auto_216528 ?auto_216534 ) ) ( not ( = ?auto_216529 ?auto_216534 ) ) ( not ( = ?auto_216530 ?auto_216534 ) ) ( not ( = ?auto_216531 ?auto_216534 ) ) ( ON ?auto_216528 ?auto_216536 ) ( not ( = ?auto_216528 ?auto_216536 ) ) ( not ( = ?auto_216529 ?auto_216536 ) ) ( not ( = ?auto_216530 ?auto_216536 ) ) ( not ( = ?auto_216531 ?auto_216536 ) ) ( not ( = ?auto_216532 ?auto_216536 ) ) ( not ( = ?auto_216533 ?auto_216536 ) ) ( not ( = ?auto_216535 ?auto_216536 ) ) ( not ( = ?auto_216534 ?auto_216536 ) ) ( ON ?auto_216529 ?auto_216528 ) ( ON-TABLE ?auto_216536 ) ( ON ?auto_216530 ?auto_216529 ) ( ON ?auto_216531 ?auto_216530 ) ( ON ?auto_216532 ?auto_216531 ) ( ON ?auto_216533 ?auto_216532 ) ( ON ?auto_216535 ?auto_216533 ) ( CLEAR ?auto_216535 ) ( HOLDING ?auto_216534 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216534 )
      ( MAKE-6PILE ?auto_216528 ?auto_216529 ?auto_216530 ?auto_216531 ?auto_216532 ?auto_216533 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216537 - BLOCK
      ?auto_216538 - BLOCK
      ?auto_216539 - BLOCK
      ?auto_216540 - BLOCK
      ?auto_216541 - BLOCK
      ?auto_216542 - BLOCK
    )
    :vars
    (
      ?auto_216543 - BLOCK
      ?auto_216545 - BLOCK
      ?auto_216544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216537 ?auto_216538 ) ) ( not ( = ?auto_216537 ?auto_216539 ) ) ( not ( = ?auto_216537 ?auto_216540 ) ) ( not ( = ?auto_216537 ?auto_216541 ) ) ( not ( = ?auto_216537 ?auto_216542 ) ) ( not ( = ?auto_216538 ?auto_216539 ) ) ( not ( = ?auto_216538 ?auto_216540 ) ) ( not ( = ?auto_216538 ?auto_216541 ) ) ( not ( = ?auto_216538 ?auto_216542 ) ) ( not ( = ?auto_216539 ?auto_216540 ) ) ( not ( = ?auto_216539 ?auto_216541 ) ) ( not ( = ?auto_216539 ?auto_216542 ) ) ( not ( = ?auto_216540 ?auto_216541 ) ) ( not ( = ?auto_216540 ?auto_216542 ) ) ( not ( = ?auto_216541 ?auto_216542 ) ) ( not ( = ?auto_216537 ?auto_216543 ) ) ( not ( = ?auto_216538 ?auto_216543 ) ) ( not ( = ?auto_216539 ?auto_216543 ) ) ( not ( = ?auto_216540 ?auto_216543 ) ) ( not ( = ?auto_216541 ?auto_216543 ) ) ( not ( = ?auto_216542 ?auto_216543 ) ) ( not ( = ?auto_216545 ?auto_216543 ) ) ( not ( = ?auto_216545 ?auto_216542 ) ) ( not ( = ?auto_216545 ?auto_216541 ) ) ( not ( = ?auto_216537 ?auto_216545 ) ) ( not ( = ?auto_216538 ?auto_216545 ) ) ( not ( = ?auto_216539 ?auto_216545 ) ) ( not ( = ?auto_216540 ?auto_216545 ) ) ( ON ?auto_216537 ?auto_216544 ) ( not ( = ?auto_216537 ?auto_216544 ) ) ( not ( = ?auto_216538 ?auto_216544 ) ) ( not ( = ?auto_216539 ?auto_216544 ) ) ( not ( = ?auto_216540 ?auto_216544 ) ) ( not ( = ?auto_216541 ?auto_216544 ) ) ( not ( = ?auto_216542 ?auto_216544 ) ) ( not ( = ?auto_216543 ?auto_216544 ) ) ( not ( = ?auto_216545 ?auto_216544 ) ) ( ON ?auto_216538 ?auto_216537 ) ( ON-TABLE ?auto_216544 ) ( ON ?auto_216539 ?auto_216538 ) ( ON ?auto_216540 ?auto_216539 ) ( ON ?auto_216541 ?auto_216540 ) ( ON ?auto_216542 ?auto_216541 ) ( ON ?auto_216543 ?auto_216542 ) ( ON ?auto_216545 ?auto_216543 ) ( CLEAR ?auto_216545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_216544 ?auto_216537 ?auto_216538 ?auto_216539 ?auto_216540 ?auto_216541 ?auto_216542 ?auto_216543 )
      ( MAKE-6PILE ?auto_216537 ?auto_216538 ?auto_216539 ?auto_216540 ?auto_216541 ?auto_216542 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216547 - BLOCK
    )
    :vars
    (
      ?auto_216548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216548 ?auto_216547 ) ( CLEAR ?auto_216548 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216547 ) ( not ( = ?auto_216547 ?auto_216548 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216548 ?auto_216547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216549 - BLOCK
    )
    :vars
    (
      ?auto_216550 - BLOCK
      ?auto_216551 - BLOCK
      ?auto_216552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216550 ?auto_216549 ) ( CLEAR ?auto_216550 ) ( ON-TABLE ?auto_216549 ) ( not ( = ?auto_216549 ?auto_216550 ) ) ( HOLDING ?auto_216551 ) ( CLEAR ?auto_216552 ) ( not ( = ?auto_216549 ?auto_216551 ) ) ( not ( = ?auto_216549 ?auto_216552 ) ) ( not ( = ?auto_216550 ?auto_216551 ) ) ( not ( = ?auto_216550 ?auto_216552 ) ) ( not ( = ?auto_216551 ?auto_216552 ) ) )
    :subtasks
    ( ( !STACK ?auto_216551 ?auto_216552 )
      ( MAKE-1PILE ?auto_216549 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216553 - BLOCK
    )
    :vars
    (
      ?auto_216555 - BLOCK
      ?auto_216556 - BLOCK
      ?auto_216554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216555 ?auto_216553 ) ( ON-TABLE ?auto_216553 ) ( not ( = ?auto_216553 ?auto_216555 ) ) ( CLEAR ?auto_216556 ) ( not ( = ?auto_216553 ?auto_216554 ) ) ( not ( = ?auto_216553 ?auto_216556 ) ) ( not ( = ?auto_216555 ?auto_216554 ) ) ( not ( = ?auto_216555 ?auto_216556 ) ) ( not ( = ?auto_216554 ?auto_216556 ) ) ( ON ?auto_216554 ?auto_216555 ) ( CLEAR ?auto_216554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216553 ?auto_216555 )
      ( MAKE-1PILE ?auto_216553 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216557 - BLOCK
    )
    :vars
    (
      ?auto_216558 - BLOCK
      ?auto_216560 - BLOCK
      ?auto_216559 - BLOCK
      ?auto_216562 - BLOCK
      ?auto_216563 - BLOCK
      ?auto_216564 - BLOCK
      ?auto_216561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216558 ?auto_216557 ) ( ON-TABLE ?auto_216557 ) ( not ( = ?auto_216557 ?auto_216558 ) ) ( not ( = ?auto_216557 ?auto_216560 ) ) ( not ( = ?auto_216557 ?auto_216559 ) ) ( not ( = ?auto_216558 ?auto_216560 ) ) ( not ( = ?auto_216558 ?auto_216559 ) ) ( not ( = ?auto_216560 ?auto_216559 ) ) ( ON ?auto_216560 ?auto_216558 ) ( CLEAR ?auto_216560 ) ( HOLDING ?auto_216559 ) ( CLEAR ?auto_216562 ) ( ON-TABLE ?auto_216563 ) ( ON ?auto_216564 ?auto_216563 ) ( ON ?auto_216561 ?auto_216564 ) ( ON ?auto_216562 ?auto_216561 ) ( not ( = ?auto_216563 ?auto_216564 ) ) ( not ( = ?auto_216563 ?auto_216561 ) ) ( not ( = ?auto_216563 ?auto_216562 ) ) ( not ( = ?auto_216563 ?auto_216559 ) ) ( not ( = ?auto_216564 ?auto_216561 ) ) ( not ( = ?auto_216564 ?auto_216562 ) ) ( not ( = ?auto_216564 ?auto_216559 ) ) ( not ( = ?auto_216561 ?auto_216562 ) ) ( not ( = ?auto_216561 ?auto_216559 ) ) ( not ( = ?auto_216562 ?auto_216559 ) ) ( not ( = ?auto_216557 ?auto_216562 ) ) ( not ( = ?auto_216557 ?auto_216563 ) ) ( not ( = ?auto_216557 ?auto_216564 ) ) ( not ( = ?auto_216557 ?auto_216561 ) ) ( not ( = ?auto_216558 ?auto_216562 ) ) ( not ( = ?auto_216558 ?auto_216563 ) ) ( not ( = ?auto_216558 ?auto_216564 ) ) ( not ( = ?auto_216558 ?auto_216561 ) ) ( not ( = ?auto_216560 ?auto_216562 ) ) ( not ( = ?auto_216560 ?auto_216563 ) ) ( not ( = ?auto_216560 ?auto_216564 ) ) ( not ( = ?auto_216560 ?auto_216561 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216563 ?auto_216564 ?auto_216561 ?auto_216562 ?auto_216559 )
      ( MAKE-1PILE ?auto_216557 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216565 - BLOCK
    )
    :vars
    (
      ?auto_216567 - BLOCK
      ?auto_216566 - BLOCK
      ?auto_216570 - BLOCK
      ?auto_216572 - BLOCK
      ?auto_216569 - BLOCK
      ?auto_216568 - BLOCK
      ?auto_216571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216567 ?auto_216565 ) ( ON-TABLE ?auto_216565 ) ( not ( = ?auto_216565 ?auto_216567 ) ) ( not ( = ?auto_216565 ?auto_216566 ) ) ( not ( = ?auto_216565 ?auto_216570 ) ) ( not ( = ?auto_216567 ?auto_216566 ) ) ( not ( = ?auto_216567 ?auto_216570 ) ) ( not ( = ?auto_216566 ?auto_216570 ) ) ( ON ?auto_216566 ?auto_216567 ) ( CLEAR ?auto_216572 ) ( ON-TABLE ?auto_216569 ) ( ON ?auto_216568 ?auto_216569 ) ( ON ?auto_216571 ?auto_216568 ) ( ON ?auto_216572 ?auto_216571 ) ( not ( = ?auto_216569 ?auto_216568 ) ) ( not ( = ?auto_216569 ?auto_216571 ) ) ( not ( = ?auto_216569 ?auto_216572 ) ) ( not ( = ?auto_216569 ?auto_216570 ) ) ( not ( = ?auto_216568 ?auto_216571 ) ) ( not ( = ?auto_216568 ?auto_216572 ) ) ( not ( = ?auto_216568 ?auto_216570 ) ) ( not ( = ?auto_216571 ?auto_216572 ) ) ( not ( = ?auto_216571 ?auto_216570 ) ) ( not ( = ?auto_216572 ?auto_216570 ) ) ( not ( = ?auto_216565 ?auto_216572 ) ) ( not ( = ?auto_216565 ?auto_216569 ) ) ( not ( = ?auto_216565 ?auto_216568 ) ) ( not ( = ?auto_216565 ?auto_216571 ) ) ( not ( = ?auto_216567 ?auto_216572 ) ) ( not ( = ?auto_216567 ?auto_216569 ) ) ( not ( = ?auto_216567 ?auto_216568 ) ) ( not ( = ?auto_216567 ?auto_216571 ) ) ( not ( = ?auto_216566 ?auto_216572 ) ) ( not ( = ?auto_216566 ?auto_216569 ) ) ( not ( = ?auto_216566 ?auto_216568 ) ) ( not ( = ?auto_216566 ?auto_216571 ) ) ( ON ?auto_216570 ?auto_216566 ) ( CLEAR ?auto_216570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216565 ?auto_216567 ?auto_216566 )
      ( MAKE-1PILE ?auto_216565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216573 - BLOCK
    )
    :vars
    (
      ?auto_216576 - BLOCK
      ?auto_216579 - BLOCK
      ?auto_216580 - BLOCK
      ?auto_216574 - BLOCK
      ?auto_216575 - BLOCK
      ?auto_216577 - BLOCK
      ?auto_216578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216576 ?auto_216573 ) ( ON-TABLE ?auto_216573 ) ( not ( = ?auto_216573 ?auto_216576 ) ) ( not ( = ?auto_216573 ?auto_216579 ) ) ( not ( = ?auto_216573 ?auto_216580 ) ) ( not ( = ?auto_216576 ?auto_216579 ) ) ( not ( = ?auto_216576 ?auto_216580 ) ) ( not ( = ?auto_216579 ?auto_216580 ) ) ( ON ?auto_216579 ?auto_216576 ) ( ON-TABLE ?auto_216574 ) ( ON ?auto_216575 ?auto_216574 ) ( ON ?auto_216577 ?auto_216575 ) ( not ( = ?auto_216574 ?auto_216575 ) ) ( not ( = ?auto_216574 ?auto_216577 ) ) ( not ( = ?auto_216574 ?auto_216578 ) ) ( not ( = ?auto_216574 ?auto_216580 ) ) ( not ( = ?auto_216575 ?auto_216577 ) ) ( not ( = ?auto_216575 ?auto_216578 ) ) ( not ( = ?auto_216575 ?auto_216580 ) ) ( not ( = ?auto_216577 ?auto_216578 ) ) ( not ( = ?auto_216577 ?auto_216580 ) ) ( not ( = ?auto_216578 ?auto_216580 ) ) ( not ( = ?auto_216573 ?auto_216578 ) ) ( not ( = ?auto_216573 ?auto_216574 ) ) ( not ( = ?auto_216573 ?auto_216575 ) ) ( not ( = ?auto_216573 ?auto_216577 ) ) ( not ( = ?auto_216576 ?auto_216578 ) ) ( not ( = ?auto_216576 ?auto_216574 ) ) ( not ( = ?auto_216576 ?auto_216575 ) ) ( not ( = ?auto_216576 ?auto_216577 ) ) ( not ( = ?auto_216579 ?auto_216578 ) ) ( not ( = ?auto_216579 ?auto_216574 ) ) ( not ( = ?auto_216579 ?auto_216575 ) ) ( not ( = ?auto_216579 ?auto_216577 ) ) ( ON ?auto_216580 ?auto_216579 ) ( CLEAR ?auto_216580 ) ( HOLDING ?auto_216578 ) ( CLEAR ?auto_216577 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216574 ?auto_216575 ?auto_216577 ?auto_216578 )
      ( MAKE-1PILE ?auto_216573 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216581 - BLOCK
    )
    :vars
    (
      ?auto_216583 - BLOCK
      ?auto_216585 - BLOCK
      ?auto_216586 - BLOCK
      ?auto_216588 - BLOCK
      ?auto_216584 - BLOCK
      ?auto_216582 - BLOCK
      ?auto_216587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216583 ?auto_216581 ) ( ON-TABLE ?auto_216581 ) ( not ( = ?auto_216581 ?auto_216583 ) ) ( not ( = ?auto_216581 ?auto_216585 ) ) ( not ( = ?auto_216581 ?auto_216586 ) ) ( not ( = ?auto_216583 ?auto_216585 ) ) ( not ( = ?auto_216583 ?auto_216586 ) ) ( not ( = ?auto_216585 ?auto_216586 ) ) ( ON ?auto_216585 ?auto_216583 ) ( ON-TABLE ?auto_216588 ) ( ON ?auto_216584 ?auto_216588 ) ( ON ?auto_216582 ?auto_216584 ) ( not ( = ?auto_216588 ?auto_216584 ) ) ( not ( = ?auto_216588 ?auto_216582 ) ) ( not ( = ?auto_216588 ?auto_216587 ) ) ( not ( = ?auto_216588 ?auto_216586 ) ) ( not ( = ?auto_216584 ?auto_216582 ) ) ( not ( = ?auto_216584 ?auto_216587 ) ) ( not ( = ?auto_216584 ?auto_216586 ) ) ( not ( = ?auto_216582 ?auto_216587 ) ) ( not ( = ?auto_216582 ?auto_216586 ) ) ( not ( = ?auto_216587 ?auto_216586 ) ) ( not ( = ?auto_216581 ?auto_216587 ) ) ( not ( = ?auto_216581 ?auto_216588 ) ) ( not ( = ?auto_216581 ?auto_216584 ) ) ( not ( = ?auto_216581 ?auto_216582 ) ) ( not ( = ?auto_216583 ?auto_216587 ) ) ( not ( = ?auto_216583 ?auto_216588 ) ) ( not ( = ?auto_216583 ?auto_216584 ) ) ( not ( = ?auto_216583 ?auto_216582 ) ) ( not ( = ?auto_216585 ?auto_216587 ) ) ( not ( = ?auto_216585 ?auto_216588 ) ) ( not ( = ?auto_216585 ?auto_216584 ) ) ( not ( = ?auto_216585 ?auto_216582 ) ) ( ON ?auto_216586 ?auto_216585 ) ( CLEAR ?auto_216582 ) ( ON ?auto_216587 ?auto_216586 ) ( CLEAR ?auto_216587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216581 ?auto_216583 ?auto_216585 ?auto_216586 )
      ( MAKE-1PILE ?auto_216581 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216589 - BLOCK
    )
    :vars
    (
      ?auto_216592 - BLOCK
      ?auto_216593 - BLOCK
      ?auto_216594 - BLOCK
      ?auto_216596 - BLOCK
      ?auto_216595 - BLOCK
      ?auto_216591 - BLOCK
      ?auto_216590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216592 ?auto_216589 ) ( ON-TABLE ?auto_216589 ) ( not ( = ?auto_216589 ?auto_216592 ) ) ( not ( = ?auto_216589 ?auto_216593 ) ) ( not ( = ?auto_216589 ?auto_216594 ) ) ( not ( = ?auto_216592 ?auto_216593 ) ) ( not ( = ?auto_216592 ?auto_216594 ) ) ( not ( = ?auto_216593 ?auto_216594 ) ) ( ON ?auto_216593 ?auto_216592 ) ( ON-TABLE ?auto_216596 ) ( ON ?auto_216595 ?auto_216596 ) ( not ( = ?auto_216596 ?auto_216595 ) ) ( not ( = ?auto_216596 ?auto_216591 ) ) ( not ( = ?auto_216596 ?auto_216590 ) ) ( not ( = ?auto_216596 ?auto_216594 ) ) ( not ( = ?auto_216595 ?auto_216591 ) ) ( not ( = ?auto_216595 ?auto_216590 ) ) ( not ( = ?auto_216595 ?auto_216594 ) ) ( not ( = ?auto_216591 ?auto_216590 ) ) ( not ( = ?auto_216591 ?auto_216594 ) ) ( not ( = ?auto_216590 ?auto_216594 ) ) ( not ( = ?auto_216589 ?auto_216590 ) ) ( not ( = ?auto_216589 ?auto_216596 ) ) ( not ( = ?auto_216589 ?auto_216595 ) ) ( not ( = ?auto_216589 ?auto_216591 ) ) ( not ( = ?auto_216592 ?auto_216590 ) ) ( not ( = ?auto_216592 ?auto_216596 ) ) ( not ( = ?auto_216592 ?auto_216595 ) ) ( not ( = ?auto_216592 ?auto_216591 ) ) ( not ( = ?auto_216593 ?auto_216590 ) ) ( not ( = ?auto_216593 ?auto_216596 ) ) ( not ( = ?auto_216593 ?auto_216595 ) ) ( not ( = ?auto_216593 ?auto_216591 ) ) ( ON ?auto_216594 ?auto_216593 ) ( ON ?auto_216590 ?auto_216594 ) ( CLEAR ?auto_216590 ) ( HOLDING ?auto_216591 ) ( CLEAR ?auto_216595 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216596 ?auto_216595 ?auto_216591 )
      ( MAKE-1PILE ?auto_216589 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216597 - BLOCK
    )
    :vars
    (
      ?auto_216599 - BLOCK
      ?auto_216600 - BLOCK
      ?auto_216603 - BLOCK
      ?auto_216604 - BLOCK
      ?auto_216601 - BLOCK
      ?auto_216598 - BLOCK
      ?auto_216602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216599 ?auto_216597 ) ( ON-TABLE ?auto_216597 ) ( not ( = ?auto_216597 ?auto_216599 ) ) ( not ( = ?auto_216597 ?auto_216600 ) ) ( not ( = ?auto_216597 ?auto_216603 ) ) ( not ( = ?auto_216599 ?auto_216600 ) ) ( not ( = ?auto_216599 ?auto_216603 ) ) ( not ( = ?auto_216600 ?auto_216603 ) ) ( ON ?auto_216600 ?auto_216599 ) ( ON-TABLE ?auto_216604 ) ( ON ?auto_216601 ?auto_216604 ) ( not ( = ?auto_216604 ?auto_216601 ) ) ( not ( = ?auto_216604 ?auto_216598 ) ) ( not ( = ?auto_216604 ?auto_216602 ) ) ( not ( = ?auto_216604 ?auto_216603 ) ) ( not ( = ?auto_216601 ?auto_216598 ) ) ( not ( = ?auto_216601 ?auto_216602 ) ) ( not ( = ?auto_216601 ?auto_216603 ) ) ( not ( = ?auto_216598 ?auto_216602 ) ) ( not ( = ?auto_216598 ?auto_216603 ) ) ( not ( = ?auto_216602 ?auto_216603 ) ) ( not ( = ?auto_216597 ?auto_216602 ) ) ( not ( = ?auto_216597 ?auto_216604 ) ) ( not ( = ?auto_216597 ?auto_216601 ) ) ( not ( = ?auto_216597 ?auto_216598 ) ) ( not ( = ?auto_216599 ?auto_216602 ) ) ( not ( = ?auto_216599 ?auto_216604 ) ) ( not ( = ?auto_216599 ?auto_216601 ) ) ( not ( = ?auto_216599 ?auto_216598 ) ) ( not ( = ?auto_216600 ?auto_216602 ) ) ( not ( = ?auto_216600 ?auto_216604 ) ) ( not ( = ?auto_216600 ?auto_216601 ) ) ( not ( = ?auto_216600 ?auto_216598 ) ) ( ON ?auto_216603 ?auto_216600 ) ( ON ?auto_216602 ?auto_216603 ) ( CLEAR ?auto_216601 ) ( ON ?auto_216598 ?auto_216602 ) ( CLEAR ?auto_216598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216597 ?auto_216599 ?auto_216600 ?auto_216603 ?auto_216602 )
      ( MAKE-1PILE ?auto_216597 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216605 - BLOCK
    )
    :vars
    (
      ?auto_216612 - BLOCK
      ?auto_216610 - BLOCK
      ?auto_216611 - BLOCK
      ?auto_216608 - BLOCK
      ?auto_216606 - BLOCK
      ?auto_216607 - BLOCK
      ?auto_216609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216612 ?auto_216605 ) ( ON-TABLE ?auto_216605 ) ( not ( = ?auto_216605 ?auto_216612 ) ) ( not ( = ?auto_216605 ?auto_216610 ) ) ( not ( = ?auto_216605 ?auto_216611 ) ) ( not ( = ?auto_216612 ?auto_216610 ) ) ( not ( = ?auto_216612 ?auto_216611 ) ) ( not ( = ?auto_216610 ?auto_216611 ) ) ( ON ?auto_216610 ?auto_216612 ) ( ON-TABLE ?auto_216608 ) ( not ( = ?auto_216608 ?auto_216606 ) ) ( not ( = ?auto_216608 ?auto_216607 ) ) ( not ( = ?auto_216608 ?auto_216609 ) ) ( not ( = ?auto_216608 ?auto_216611 ) ) ( not ( = ?auto_216606 ?auto_216607 ) ) ( not ( = ?auto_216606 ?auto_216609 ) ) ( not ( = ?auto_216606 ?auto_216611 ) ) ( not ( = ?auto_216607 ?auto_216609 ) ) ( not ( = ?auto_216607 ?auto_216611 ) ) ( not ( = ?auto_216609 ?auto_216611 ) ) ( not ( = ?auto_216605 ?auto_216609 ) ) ( not ( = ?auto_216605 ?auto_216608 ) ) ( not ( = ?auto_216605 ?auto_216606 ) ) ( not ( = ?auto_216605 ?auto_216607 ) ) ( not ( = ?auto_216612 ?auto_216609 ) ) ( not ( = ?auto_216612 ?auto_216608 ) ) ( not ( = ?auto_216612 ?auto_216606 ) ) ( not ( = ?auto_216612 ?auto_216607 ) ) ( not ( = ?auto_216610 ?auto_216609 ) ) ( not ( = ?auto_216610 ?auto_216608 ) ) ( not ( = ?auto_216610 ?auto_216606 ) ) ( not ( = ?auto_216610 ?auto_216607 ) ) ( ON ?auto_216611 ?auto_216610 ) ( ON ?auto_216609 ?auto_216611 ) ( ON ?auto_216607 ?auto_216609 ) ( CLEAR ?auto_216607 ) ( HOLDING ?auto_216606 ) ( CLEAR ?auto_216608 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216608 ?auto_216606 )
      ( MAKE-1PILE ?auto_216605 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216613 - BLOCK
    )
    :vars
    (
      ?auto_216618 - BLOCK
      ?auto_216619 - BLOCK
      ?auto_216617 - BLOCK
      ?auto_216616 - BLOCK
      ?auto_216620 - BLOCK
      ?auto_216614 - BLOCK
      ?auto_216615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216618 ?auto_216613 ) ( ON-TABLE ?auto_216613 ) ( not ( = ?auto_216613 ?auto_216618 ) ) ( not ( = ?auto_216613 ?auto_216619 ) ) ( not ( = ?auto_216613 ?auto_216617 ) ) ( not ( = ?auto_216618 ?auto_216619 ) ) ( not ( = ?auto_216618 ?auto_216617 ) ) ( not ( = ?auto_216619 ?auto_216617 ) ) ( ON ?auto_216619 ?auto_216618 ) ( ON-TABLE ?auto_216616 ) ( not ( = ?auto_216616 ?auto_216620 ) ) ( not ( = ?auto_216616 ?auto_216614 ) ) ( not ( = ?auto_216616 ?auto_216615 ) ) ( not ( = ?auto_216616 ?auto_216617 ) ) ( not ( = ?auto_216620 ?auto_216614 ) ) ( not ( = ?auto_216620 ?auto_216615 ) ) ( not ( = ?auto_216620 ?auto_216617 ) ) ( not ( = ?auto_216614 ?auto_216615 ) ) ( not ( = ?auto_216614 ?auto_216617 ) ) ( not ( = ?auto_216615 ?auto_216617 ) ) ( not ( = ?auto_216613 ?auto_216615 ) ) ( not ( = ?auto_216613 ?auto_216616 ) ) ( not ( = ?auto_216613 ?auto_216620 ) ) ( not ( = ?auto_216613 ?auto_216614 ) ) ( not ( = ?auto_216618 ?auto_216615 ) ) ( not ( = ?auto_216618 ?auto_216616 ) ) ( not ( = ?auto_216618 ?auto_216620 ) ) ( not ( = ?auto_216618 ?auto_216614 ) ) ( not ( = ?auto_216619 ?auto_216615 ) ) ( not ( = ?auto_216619 ?auto_216616 ) ) ( not ( = ?auto_216619 ?auto_216620 ) ) ( not ( = ?auto_216619 ?auto_216614 ) ) ( ON ?auto_216617 ?auto_216619 ) ( ON ?auto_216615 ?auto_216617 ) ( ON ?auto_216614 ?auto_216615 ) ( CLEAR ?auto_216616 ) ( ON ?auto_216620 ?auto_216614 ) ( CLEAR ?auto_216620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216613 ?auto_216618 ?auto_216619 ?auto_216617 ?auto_216615 ?auto_216614 )
      ( MAKE-1PILE ?auto_216613 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216621 - BLOCK
    )
    :vars
    (
      ?auto_216625 - BLOCK
      ?auto_216628 - BLOCK
      ?auto_216622 - BLOCK
      ?auto_216627 - BLOCK
      ?auto_216623 - BLOCK
      ?auto_216624 - BLOCK
      ?auto_216626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216625 ?auto_216621 ) ( ON-TABLE ?auto_216621 ) ( not ( = ?auto_216621 ?auto_216625 ) ) ( not ( = ?auto_216621 ?auto_216628 ) ) ( not ( = ?auto_216621 ?auto_216622 ) ) ( not ( = ?auto_216625 ?auto_216628 ) ) ( not ( = ?auto_216625 ?auto_216622 ) ) ( not ( = ?auto_216628 ?auto_216622 ) ) ( ON ?auto_216628 ?auto_216625 ) ( not ( = ?auto_216627 ?auto_216623 ) ) ( not ( = ?auto_216627 ?auto_216624 ) ) ( not ( = ?auto_216627 ?auto_216626 ) ) ( not ( = ?auto_216627 ?auto_216622 ) ) ( not ( = ?auto_216623 ?auto_216624 ) ) ( not ( = ?auto_216623 ?auto_216626 ) ) ( not ( = ?auto_216623 ?auto_216622 ) ) ( not ( = ?auto_216624 ?auto_216626 ) ) ( not ( = ?auto_216624 ?auto_216622 ) ) ( not ( = ?auto_216626 ?auto_216622 ) ) ( not ( = ?auto_216621 ?auto_216626 ) ) ( not ( = ?auto_216621 ?auto_216627 ) ) ( not ( = ?auto_216621 ?auto_216623 ) ) ( not ( = ?auto_216621 ?auto_216624 ) ) ( not ( = ?auto_216625 ?auto_216626 ) ) ( not ( = ?auto_216625 ?auto_216627 ) ) ( not ( = ?auto_216625 ?auto_216623 ) ) ( not ( = ?auto_216625 ?auto_216624 ) ) ( not ( = ?auto_216628 ?auto_216626 ) ) ( not ( = ?auto_216628 ?auto_216627 ) ) ( not ( = ?auto_216628 ?auto_216623 ) ) ( not ( = ?auto_216628 ?auto_216624 ) ) ( ON ?auto_216622 ?auto_216628 ) ( ON ?auto_216626 ?auto_216622 ) ( ON ?auto_216624 ?auto_216626 ) ( ON ?auto_216623 ?auto_216624 ) ( CLEAR ?auto_216623 ) ( HOLDING ?auto_216627 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216627 )
      ( MAKE-1PILE ?auto_216621 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216629 - BLOCK
    )
    :vars
    (
      ?auto_216635 - BLOCK
      ?auto_216631 - BLOCK
      ?auto_216633 - BLOCK
      ?auto_216636 - BLOCK
      ?auto_216630 - BLOCK
      ?auto_216632 - BLOCK
      ?auto_216634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216635 ?auto_216629 ) ( ON-TABLE ?auto_216629 ) ( not ( = ?auto_216629 ?auto_216635 ) ) ( not ( = ?auto_216629 ?auto_216631 ) ) ( not ( = ?auto_216629 ?auto_216633 ) ) ( not ( = ?auto_216635 ?auto_216631 ) ) ( not ( = ?auto_216635 ?auto_216633 ) ) ( not ( = ?auto_216631 ?auto_216633 ) ) ( ON ?auto_216631 ?auto_216635 ) ( not ( = ?auto_216636 ?auto_216630 ) ) ( not ( = ?auto_216636 ?auto_216632 ) ) ( not ( = ?auto_216636 ?auto_216634 ) ) ( not ( = ?auto_216636 ?auto_216633 ) ) ( not ( = ?auto_216630 ?auto_216632 ) ) ( not ( = ?auto_216630 ?auto_216634 ) ) ( not ( = ?auto_216630 ?auto_216633 ) ) ( not ( = ?auto_216632 ?auto_216634 ) ) ( not ( = ?auto_216632 ?auto_216633 ) ) ( not ( = ?auto_216634 ?auto_216633 ) ) ( not ( = ?auto_216629 ?auto_216634 ) ) ( not ( = ?auto_216629 ?auto_216636 ) ) ( not ( = ?auto_216629 ?auto_216630 ) ) ( not ( = ?auto_216629 ?auto_216632 ) ) ( not ( = ?auto_216635 ?auto_216634 ) ) ( not ( = ?auto_216635 ?auto_216636 ) ) ( not ( = ?auto_216635 ?auto_216630 ) ) ( not ( = ?auto_216635 ?auto_216632 ) ) ( not ( = ?auto_216631 ?auto_216634 ) ) ( not ( = ?auto_216631 ?auto_216636 ) ) ( not ( = ?auto_216631 ?auto_216630 ) ) ( not ( = ?auto_216631 ?auto_216632 ) ) ( ON ?auto_216633 ?auto_216631 ) ( ON ?auto_216634 ?auto_216633 ) ( ON ?auto_216632 ?auto_216634 ) ( ON ?auto_216630 ?auto_216632 ) ( ON ?auto_216636 ?auto_216630 ) ( CLEAR ?auto_216636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216629 ?auto_216635 ?auto_216631 ?auto_216633 ?auto_216634 ?auto_216632 ?auto_216630 )
      ( MAKE-1PILE ?auto_216629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216637 - BLOCK
    )
    :vars
    (
      ?auto_216640 - BLOCK
      ?auto_216641 - BLOCK
      ?auto_216643 - BLOCK
      ?auto_216638 - BLOCK
      ?auto_216642 - BLOCK
      ?auto_216644 - BLOCK
      ?auto_216639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216640 ?auto_216637 ) ( ON-TABLE ?auto_216637 ) ( not ( = ?auto_216637 ?auto_216640 ) ) ( not ( = ?auto_216637 ?auto_216641 ) ) ( not ( = ?auto_216637 ?auto_216643 ) ) ( not ( = ?auto_216640 ?auto_216641 ) ) ( not ( = ?auto_216640 ?auto_216643 ) ) ( not ( = ?auto_216641 ?auto_216643 ) ) ( ON ?auto_216641 ?auto_216640 ) ( not ( = ?auto_216638 ?auto_216642 ) ) ( not ( = ?auto_216638 ?auto_216644 ) ) ( not ( = ?auto_216638 ?auto_216639 ) ) ( not ( = ?auto_216638 ?auto_216643 ) ) ( not ( = ?auto_216642 ?auto_216644 ) ) ( not ( = ?auto_216642 ?auto_216639 ) ) ( not ( = ?auto_216642 ?auto_216643 ) ) ( not ( = ?auto_216644 ?auto_216639 ) ) ( not ( = ?auto_216644 ?auto_216643 ) ) ( not ( = ?auto_216639 ?auto_216643 ) ) ( not ( = ?auto_216637 ?auto_216639 ) ) ( not ( = ?auto_216637 ?auto_216638 ) ) ( not ( = ?auto_216637 ?auto_216642 ) ) ( not ( = ?auto_216637 ?auto_216644 ) ) ( not ( = ?auto_216640 ?auto_216639 ) ) ( not ( = ?auto_216640 ?auto_216638 ) ) ( not ( = ?auto_216640 ?auto_216642 ) ) ( not ( = ?auto_216640 ?auto_216644 ) ) ( not ( = ?auto_216641 ?auto_216639 ) ) ( not ( = ?auto_216641 ?auto_216638 ) ) ( not ( = ?auto_216641 ?auto_216642 ) ) ( not ( = ?auto_216641 ?auto_216644 ) ) ( ON ?auto_216643 ?auto_216641 ) ( ON ?auto_216639 ?auto_216643 ) ( ON ?auto_216644 ?auto_216639 ) ( ON ?auto_216642 ?auto_216644 ) ( HOLDING ?auto_216638 ) ( CLEAR ?auto_216642 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_216637 ?auto_216640 ?auto_216641 ?auto_216643 ?auto_216639 ?auto_216644 ?auto_216642 ?auto_216638 )
      ( MAKE-1PILE ?auto_216637 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216645 - BLOCK
    )
    :vars
    (
      ?auto_216647 - BLOCK
      ?auto_216649 - BLOCK
      ?auto_216652 - BLOCK
      ?auto_216648 - BLOCK
      ?auto_216650 - BLOCK
      ?auto_216651 - BLOCK
      ?auto_216646 - BLOCK
      ?auto_216653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216647 ?auto_216645 ) ( ON-TABLE ?auto_216645 ) ( not ( = ?auto_216645 ?auto_216647 ) ) ( not ( = ?auto_216645 ?auto_216649 ) ) ( not ( = ?auto_216645 ?auto_216652 ) ) ( not ( = ?auto_216647 ?auto_216649 ) ) ( not ( = ?auto_216647 ?auto_216652 ) ) ( not ( = ?auto_216649 ?auto_216652 ) ) ( ON ?auto_216649 ?auto_216647 ) ( not ( = ?auto_216648 ?auto_216650 ) ) ( not ( = ?auto_216648 ?auto_216651 ) ) ( not ( = ?auto_216648 ?auto_216646 ) ) ( not ( = ?auto_216648 ?auto_216652 ) ) ( not ( = ?auto_216650 ?auto_216651 ) ) ( not ( = ?auto_216650 ?auto_216646 ) ) ( not ( = ?auto_216650 ?auto_216652 ) ) ( not ( = ?auto_216651 ?auto_216646 ) ) ( not ( = ?auto_216651 ?auto_216652 ) ) ( not ( = ?auto_216646 ?auto_216652 ) ) ( not ( = ?auto_216645 ?auto_216646 ) ) ( not ( = ?auto_216645 ?auto_216648 ) ) ( not ( = ?auto_216645 ?auto_216650 ) ) ( not ( = ?auto_216645 ?auto_216651 ) ) ( not ( = ?auto_216647 ?auto_216646 ) ) ( not ( = ?auto_216647 ?auto_216648 ) ) ( not ( = ?auto_216647 ?auto_216650 ) ) ( not ( = ?auto_216647 ?auto_216651 ) ) ( not ( = ?auto_216649 ?auto_216646 ) ) ( not ( = ?auto_216649 ?auto_216648 ) ) ( not ( = ?auto_216649 ?auto_216650 ) ) ( not ( = ?auto_216649 ?auto_216651 ) ) ( ON ?auto_216652 ?auto_216649 ) ( ON ?auto_216646 ?auto_216652 ) ( ON ?auto_216651 ?auto_216646 ) ( ON ?auto_216650 ?auto_216651 ) ( CLEAR ?auto_216650 ) ( ON ?auto_216648 ?auto_216653 ) ( CLEAR ?auto_216648 ) ( HAND-EMPTY ) ( not ( = ?auto_216645 ?auto_216653 ) ) ( not ( = ?auto_216647 ?auto_216653 ) ) ( not ( = ?auto_216649 ?auto_216653 ) ) ( not ( = ?auto_216652 ?auto_216653 ) ) ( not ( = ?auto_216648 ?auto_216653 ) ) ( not ( = ?auto_216650 ?auto_216653 ) ) ( not ( = ?auto_216651 ?auto_216653 ) ) ( not ( = ?auto_216646 ?auto_216653 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216648 ?auto_216653 )
      ( MAKE-1PILE ?auto_216645 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216654 - BLOCK
    )
    :vars
    (
      ?auto_216661 - BLOCK
      ?auto_216658 - BLOCK
      ?auto_216662 - BLOCK
      ?auto_216659 - BLOCK
      ?auto_216656 - BLOCK
      ?auto_216657 - BLOCK
      ?auto_216655 - BLOCK
      ?auto_216660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216661 ?auto_216654 ) ( ON-TABLE ?auto_216654 ) ( not ( = ?auto_216654 ?auto_216661 ) ) ( not ( = ?auto_216654 ?auto_216658 ) ) ( not ( = ?auto_216654 ?auto_216662 ) ) ( not ( = ?auto_216661 ?auto_216658 ) ) ( not ( = ?auto_216661 ?auto_216662 ) ) ( not ( = ?auto_216658 ?auto_216662 ) ) ( ON ?auto_216658 ?auto_216661 ) ( not ( = ?auto_216659 ?auto_216656 ) ) ( not ( = ?auto_216659 ?auto_216657 ) ) ( not ( = ?auto_216659 ?auto_216655 ) ) ( not ( = ?auto_216659 ?auto_216662 ) ) ( not ( = ?auto_216656 ?auto_216657 ) ) ( not ( = ?auto_216656 ?auto_216655 ) ) ( not ( = ?auto_216656 ?auto_216662 ) ) ( not ( = ?auto_216657 ?auto_216655 ) ) ( not ( = ?auto_216657 ?auto_216662 ) ) ( not ( = ?auto_216655 ?auto_216662 ) ) ( not ( = ?auto_216654 ?auto_216655 ) ) ( not ( = ?auto_216654 ?auto_216659 ) ) ( not ( = ?auto_216654 ?auto_216656 ) ) ( not ( = ?auto_216654 ?auto_216657 ) ) ( not ( = ?auto_216661 ?auto_216655 ) ) ( not ( = ?auto_216661 ?auto_216659 ) ) ( not ( = ?auto_216661 ?auto_216656 ) ) ( not ( = ?auto_216661 ?auto_216657 ) ) ( not ( = ?auto_216658 ?auto_216655 ) ) ( not ( = ?auto_216658 ?auto_216659 ) ) ( not ( = ?auto_216658 ?auto_216656 ) ) ( not ( = ?auto_216658 ?auto_216657 ) ) ( ON ?auto_216662 ?auto_216658 ) ( ON ?auto_216655 ?auto_216662 ) ( ON ?auto_216657 ?auto_216655 ) ( ON ?auto_216659 ?auto_216660 ) ( CLEAR ?auto_216659 ) ( not ( = ?auto_216654 ?auto_216660 ) ) ( not ( = ?auto_216661 ?auto_216660 ) ) ( not ( = ?auto_216658 ?auto_216660 ) ) ( not ( = ?auto_216662 ?auto_216660 ) ) ( not ( = ?auto_216659 ?auto_216660 ) ) ( not ( = ?auto_216656 ?auto_216660 ) ) ( not ( = ?auto_216657 ?auto_216660 ) ) ( not ( = ?auto_216655 ?auto_216660 ) ) ( HOLDING ?auto_216656 ) ( CLEAR ?auto_216657 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216654 ?auto_216661 ?auto_216658 ?auto_216662 ?auto_216655 ?auto_216657 ?auto_216656 )
      ( MAKE-1PILE ?auto_216654 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216663 - BLOCK
    )
    :vars
    (
      ?auto_216664 - BLOCK
      ?auto_216667 - BLOCK
      ?auto_216669 - BLOCK
      ?auto_216668 - BLOCK
      ?auto_216666 - BLOCK
      ?auto_216665 - BLOCK
      ?auto_216670 - BLOCK
      ?auto_216671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216664 ?auto_216663 ) ( ON-TABLE ?auto_216663 ) ( not ( = ?auto_216663 ?auto_216664 ) ) ( not ( = ?auto_216663 ?auto_216667 ) ) ( not ( = ?auto_216663 ?auto_216669 ) ) ( not ( = ?auto_216664 ?auto_216667 ) ) ( not ( = ?auto_216664 ?auto_216669 ) ) ( not ( = ?auto_216667 ?auto_216669 ) ) ( ON ?auto_216667 ?auto_216664 ) ( not ( = ?auto_216668 ?auto_216666 ) ) ( not ( = ?auto_216668 ?auto_216665 ) ) ( not ( = ?auto_216668 ?auto_216670 ) ) ( not ( = ?auto_216668 ?auto_216669 ) ) ( not ( = ?auto_216666 ?auto_216665 ) ) ( not ( = ?auto_216666 ?auto_216670 ) ) ( not ( = ?auto_216666 ?auto_216669 ) ) ( not ( = ?auto_216665 ?auto_216670 ) ) ( not ( = ?auto_216665 ?auto_216669 ) ) ( not ( = ?auto_216670 ?auto_216669 ) ) ( not ( = ?auto_216663 ?auto_216670 ) ) ( not ( = ?auto_216663 ?auto_216668 ) ) ( not ( = ?auto_216663 ?auto_216666 ) ) ( not ( = ?auto_216663 ?auto_216665 ) ) ( not ( = ?auto_216664 ?auto_216670 ) ) ( not ( = ?auto_216664 ?auto_216668 ) ) ( not ( = ?auto_216664 ?auto_216666 ) ) ( not ( = ?auto_216664 ?auto_216665 ) ) ( not ( = ?auto_216667 ?auto_216670 ) ) ( not ( = ?auto_216667 ?auto_216668 ) ) ( not ( = ?auto_216667 ?auto_216666 ) ) ( not ( = ?auto_216667 ?auto_216665 ) ) ( ON ?auto_216669 ?auto_216667 ) ( ON ?auto_216670 ?auto_216669 ) ( ON ?auto_216665 ?auto_216670 ) ( ON ?auto_216668 ?auto_216671 ) ( not ( = ?auto_216663 ?auto_216671 ) ) ( not ( = ?auto_216664 ?auto_216671 ) ) ( not ( = ?auto_216667 ?auto_216671 ) ) ( not ( = ?auto_216669 ?auto_216671 ) ) ( not ( = ?auto_216668 ?auto_216671 ) ) ( not ( = ?auto_216666 ?auto_216671 ) ) ( not ( = ?auto_216665 ?auto_216671 ) ) ( not ( = ?auto_216670 ?auto_216671 ) ) ( CLEAR ?auto_216665 ) ( ON ?auto_216666 ?auto_216668 ) ( CLEAR ?auto_216666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216671 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216671 ?auto_216668 )
      ( MAKE-1PILE ?auto_216663 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216672 - BLOCK
    )
    :vars
    (
      ?auto_216674 - BLOCK
      ?auto_216677 - BLOCK
      ?auto_216680 - BLOCK
      ?auto_216678 - BLOCK
      ?auto_216675 - BLOCK
      ?auto_216679 - BLOCK
      ?auto_216673 - BLOCK
      ?auto_216676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216674 ?auto_216672 ) ( ON-TABLE ?auto_216672 ) ( not ( = ?auto_216672 ?auto_216674 ) ) ( not ( = ?auto_216672 ?auto_216677 ) ) ( not ( = ?auto_216672 ?auto_216680 ) ) ( not ( = ?auto_216674 ?auto_216677 ) ) ( not ( = ?auto_216674 ?auto_216680 ) ) ( not ( = ?auto_216677 ?auto_216680 ) ) ( ON ?auto_216677 ?auto_216674 ) ( not ( = ?auto_216678 ?auto_216675 ) ) ( not ( = ?auto_216678 ?auto_216679 ) ) ( not ( = ?auto_216678 ?auto_216673 ) ) ( not ( = ?auto_216678 ?auto_216680 ) ) ( not ( = ?auto_216675 ?auto_216679 ) ) ( not ( = ?auto_216675 ?auto_216673 ) ) ( not ( = ?auto_216675 ?auto_216680 ) ) ( not ( = ?auto_216679 ?auto_216673 ) ) ( not ( = ?auto_216679 ?auto_216680 ) ) ( not ( = ?auto_216673 ?auto_216680 ) ) ( not ( = ?auto_216672 ?auto_216673 ) ) ( not ( = ?auto_216672 ?auto_216678 ) ) ( not ( = ?auto_216672 ?auto_216675 ) ) ( not ( = ?auto_216672 ?auto_216679 ) ) ( not ( = ?auto_216674 ?auto_216673 ) ) ( not ( = ?auto_216674 ?auto_216678 ) ) ( not ( = ?auto_216674 ?auto_216675 ) ) ( not ( = ?auto_216674 ?auto_216679 ) ) ( not ( = ?auto_216677 ?auto_216673 ) ) ( not ( = ?auto_216677 ?auto_216678 ) ) ( not ( = ?auto_216677 ?auto_216675 ) ) ( not ( = ?auto_216677 ?auto_216679 ) ) ( ON ?auto_216680 ?auto_216677 ) ( ON ?auto_216673 ?auto_216680 ) ( ON ?auto_216678 ?auto_216676 ) ( not ( = ?auto_216672 ?auto_216676 ) ) ( not ( = ?auto_216674 ?auto_216676 ) ) ( not ( = ?auto_216677 ?auto_216676 ) ) ( not ( = ?auto_216680 ?auto_216676 ) ) ( not ( = ?auto_216678 ?auto_216676 ) ) ( not ( = ?auto_216675 ?auto_216676 ) ) ( not ( = ?auto_216679 ?auto_216676 ) ) ( not ( = ?auto_216673 ?auto_216676 ) ) ( ON ?auto_216675 ?auto_216678 ) ( CLEAR ?auto_216675 ) ( ON-TABLE ?auto_216676 ) ( HOLDING ?auto_216679 ) ( CLEAR ?auto_216673 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216672 ?auto_216674 ?auto_216677 ?auto_216680 ?auto_216673 ?auto_216679 )
      ( MAKE-1PILE ?auto_216672 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216681 - BLOCK
    )
    :vars
    (
      ?auto_216689 - BLOCK
      ?auto_216688 - BLOCK
      ?auto_216684 - BLOCK
      ?auto_216686 - BLOCK
      ?auto_216682 - BLOCK
      ?auto_216687 - BLOCK
      ?auto_216685 - BLOCK
      ?auto_216683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216689 ?auto_216681 ) ( ON-TABLE ?auto_216681 ) ( not ( = ?auto_216681 ?auto_216689 ) ) ( not ( = ?auto_216681 ?auto_216688 ) ) ( not ( = ?auto_216681 ?auto_216684 ) ) ( not ( = ?auto_216689 ?auto_216688 ) ) ( not ( = ?auto_216689 ?auto_216684 ) ) ( not ( = ?auto_216688 ?auto_216684 ) ) ( ON ?auto_216688 ?auto_216689 ) ( not ( = ?auto_216686 ?auto_216682 ) ) ( not ( = ?auto_216686 ?auto_216687 ) ) ( not ( = ?auto_216686 ?auto_216685 ) ) ( not ( = ?auto_216686 ?auto_216684 ) ) ( not ( = ?auto_216682 ?auto_216687 ) ) ( not ( = ?auto_216682 ?auto_216685 ) ) ( not ( = ?auto_216682 ?auto_216684 ) ) ( not ( = ?auto_216687 ?auto_216685 ) ) ( not ( = ?auto_216687 ?auto_216684 ) ) ( not ( = ?auto_216685 ?auto_216684 ) ) ( not ( = ?auto_216681 ?auto_216685 ) ) ( not ( = ?auto_216681 ?auto_216686 ) ) ( not ( = ?auto_216681 ?auto_216682 ) ) ( not ( = ?auto_216681 ?auto_216687 ) ) ( not ( = ?auto_216689 ?auto_216685 ) ) ( not ( = ?auto_216689 ?auto_216686 ) ) ( not ( = ?auto_216689 ?auto_216682 ) ) ( not ( = ?auto_216689 ?auto_216687 ) ) ( not ( = ?auto_216688 ?auto_216685 ) ) ( not ( = ?auto_216688 ?auto_216686 ) ) ( not ( = ?auto_216688 ?auto_216682 ) ) ( not ( = ?auto_216688 ?auto_216687 ) ) ( ON ?auto_216684 ?auto_216688 ) ( ON ?auto_216685 ?auto_216684 ) ( ON ?auto_216686 ?auto_216683 ) ( not ( = ?auto_216681 ?auto_216683 ) ) ( not ( = ?auto_216689 ?auto_216683 ) ) ( not ( = ?auto_216688 ?auto_216683 ) ) ( not ( = ?auto_216684 ?auto_216683 ) ) ( not ( = ?auto_216686 ?auto_216683 ) ) ( not ( = ?auto_216682 ?auto_216683 ) ) ( not ( = ?auto_216687 ?auto_216683 ) ) ( not ( = ?auto_216685 ?auto_216683 ) ) ( ON ?auto_216682 ?auto_216686 ) ( ON-TABLE ?auto_216683 ) ( CLEAR ?auto_216685 ) ( ON ?auto_216687 ?auto_216682 ) ( CLEAR ?auto_216687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216683 ?auto_216686 ?auto_216682 )
      ( MAKE-1PILE ?auto_216681 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216690 - BLOCK
    )
    :vars
    (
      ?auto_216691 - BLOCK
      ?auto_216692 - BLOCK
      ?auto_216698 - BLOCK
      ?auto_216696 - BLOCK
      ?auto_216695 - BLOCK
      ?auto_216693 - BLOCK
      ?auto_216694 - BLOCK
      ?auto_216697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216691 ?auto_216690 ) ( ON-TABLE ?auto_216690 ) ( not ( = ?auto_216690 ?auto_216691 ) ) ( not ( = ?auto_216690 ?auto_216692 ) ) ( not ( = ?auto_216690 ?auto_216698 ) ) ( not ( = ?auto_216691 ?auto_216692 ) ) ( not ( = ?auto_216691 ?auto_216698 ) ) ( not ( = ?auto_216692 ?auto_216698 ) ) ( ON ?auto_216692 ?auto_216691 ) ( not ( = ?auto_216696 ?auto_216695 ) ) ( not ( = ?auto_216696 ?auto_216693 ) ) ( not ( = ?auto_216696 ?auto_216694 ) ) ( not ( = ?auto_216696 ?auto_216698 ) ) ( not ( = ?auto_216695 ?auto_216693 ) ) ( not ( = ?auto_216695 ?auto_216694 ) ) ( not ( = ?auto_216695 ?auto_216698 ) ) ( not ( = ?auto_216693 ?auto_216694 ) ) ( not ( = ?auto_216693 ?auto_216698 ) ) ( not ( = ?auto_216694 ?auto_216698 ) ) ( not ( = ?auto_216690 ?auto_216694 ) ) ( not ( = ?auto_216690 ?auto_216696 ) ) ( not ( = ?auto_216690 ?auto_216695 ) ) ( not ( = ?auto_216690 ?auto_216693 ) ) ( not ( = ?auto_216691 ?auto_216694 ) ) ( not ( = ?auto_216691 ?auto_216696 ) ) ( not ( = ?auto_216691 ?auto_216695 ) ) ( not ( = ?auto_216691 ?auto_216693 ) ) ( not ( = ?auto_216692 ?auto_216694 ) ) ( not ( = ?auto_216692 ?auto_216696 ) ) ( not ( = ?auto_216692 ?auto_216695 ) ) ( not ( = ?auto_216692 ?auto_216693 ) ) ( ON ?auto_216698 ?auto_216692 ) ( ON ?auto_216696 ?auto_216697 ) ( not ( = ?auto_216690 ?auto_216697 ) ) ( not ( = ?auto_216691 ?auto_216697 ) ) ( not ( = ?auto_216692 ?auto_216697 ) ) ( not ( = ?auto_216698 ?auto_216697 ) ) ( not ( = ?auto_216696 ?auto_216697 ) ) ( not ( = ?auto_216695 ?auto_216697 ) ) ( not ( = ?auto_216693 ?auto_216697 ) ) ( not ( = ?auto_216694 ?auto_216697 ) ) ( ON ?auto_216695 ?auto_216696 ) ( ON-TABLE ?auto_216697 ) ( ON ?auto_216693 ?auto_216695 ) ( CLEAR ?auto_216693 ) ( HOLDING ?auto_216694 ) ( CLEAR ?auto_216698 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216690 ?auto_216691 ?auto_216692 ?auto_216698 ?auto_216694 )
      ( MAKE-1PILE ?auto_216690 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216699 - BLOCK
    )
    :vars
    (
      ?auto_216701 - BLOCK
      ?auto_216705 - BLOCK
      ?auto_216700 - BLOCK
      ?auto_216703 - BLOCK
      ?auto_216702 - BLOCK
      ?auto_216704 - BLOCK
      ?auto_216707 - BLOCK
      ?auto_216706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216701 ?auto_216699 ) ( ON-TABLE ?auto_216699 ) ( not ( = ?auto_216699 ?auto_216701 ) ) ( not ( = ?auto_216699 ?auto_216705 ) ) ( not ( = ?auto_216699 ?auto_216700 ) ) ( not ( = ?auto_216701 ?auto_216705 ) ) ( not ( = ?auto_216701 ?auto_216700 ) ) ( not ( = ?auto_216705 ?auto_216700 ) ) ( ON ?auto_216705 ?auto_216701 ) ( not ( = ?auto_216703 ?auto_216702 ) ) ( not ( = ?auto_216703 ?auto_216704 ) ) ( not ( = ?auto_216703 ?auto_216707 ) ) ( not ( = ?auto_216703 ?auto_216700 ) ) ( not ( = ?auto_216702 ?auto_216704 ) ) ( not ( = ?auto_216702 ?auto_216707 ) ) ( not ( = ?auto_216702 ?auto_216700 ) ) ( not ( = ?auto_216704 ?auto_216707 ) ) ( not ( = ?auto_216704 ?auto_216700 ) ) ( not ( = ?auto_216707 ?auto_216700 ) ) ( not ( = ?auto_216699 ?auto_216707 ) ) ( not ( = ?auto_216699 ?auto_216703 ) ) ( not ( = ?auto_216699 ?auto_216702 ) ) ( not ( = ?auto_216699 ?auto_216704 ) ) ( not ( = ?auto_216701 ?auto_216707 ) ) ( not ( = ?auto_216701 ?auto_216703 ) ) ( not ( = ?auto_216701 ?auto_216702 ) ) ( not ( = ?auto_216701 ?auto_216704 ) ) ( not ( = ?auto_216705 ?auto_216707 ) ) ( not ( = ?auto_216705 ?auto_216703 ) ) ( not ( = ?auto_216705 ?auto_216702 ) ) ( not ( = ?auto_216705 ?auto_216704 ) ) ( ON ?auto_216700 ?auto_216705 ) ( ON ?auto_216703 ?auto_216706 ) ( not ( = ?auto_216699 ?auto_216706 ) ) ( not ( = ?auto_216701 ?auto_216706 ) ) ( not ( = ?auto_216705 ?auto_216706 ) ) ( not ( = ?auto_216700 ?auto_216706 ) ) ( not ( = ?auto_216703 ?auto_216706 ) ) ( not ( = ?auto_216702 ?auto_216706 ) ) ( not ( = ?auto_216704 ?auto_216706 ) ) ( not ( = ?auto_216707 ?auto_216706 ) ) ( ON ?auto_216702 ?auto_216703 ) ( ON-TABLE ?auto_216706 ) ( ON ?auto_216704 ?auto_216702 ) ( CLEAR ?auto_216700 ) ( ON ?auto_216707 ?auto_216704 ) ( CLEAR ?auto_216707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216706 ?auto_216703 ?auto_216702 ?auto_216704 )
      ( MAKE-1PILE ?auto_216699 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216708 - BLOCK
    )
    :vars
    (
      ?auto_216709 - BLOCK
      ?auto_216711 - BLOCK
      ?auto_216716 - BLOCK
      ?auto_216712 - BLOCK
      ?auto_216715 - BLOCK
      ?auto_216710 - BLOCK
      ?auto_216713 - BLOCK
      ?auto_216714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216709 ?auto_216708 ) ( ON-TABLE ?auto_216708 ) ( not ( = ?auto_216708 ?auto_216709 ) ) ( not ( = ?auto_216708 ?auto_216711 ) ) ( not ( = ?auto_216708 ?auto_216716 ) ) ( not ( = ?auto_216709 ?auto_216711 ) ) ( not ( = ?auto_216709 ?auto_216716 ) ) ( not ( = ?auto_216711 ?auto_216716 ) ) ( ON ?auto_216711 ?auto_216709 ) ( not ( = ?auto_216712 ?auto_216715 ) ) ( not ( = ?auto_216712 ?auto_216710 ) ) ( not ( = ?auto_216712 ?auto_216713 ) ) ( not ( = ?auto_216712 ?auto_216716 ) ) ( not ( = ?auto_216715 ?auto_216710 ) ) ( not ( = ?auto_216715 ?auto_216713 ) ) ( not ( = ?auto_216715 ?auto_216716 ) ) ( not ( = ?auto_216710 ?auto_216713 ) ) ( not ( = ?auto_216710 ?auto_216716 ) ) ( not ( = ?auto_216713 ?auto_216716 ) ) ( not ( = ?auto_216708 ?auto_216713 ) ) ( not ( = ?auto_216708 ?auto_216712 ) ) ( not ( = ?auto_216708 ?auto_216715 ) ) ( not ( = ?auto_216708 ?auto_216710 ) ) ( not ( = ?auto_216709 ?auto_216713 ) ) ( not ( = ?auto_216709 ?auto_216712 ) ) ( not ( = ?auto_216709 ?auto_216715 ) ) ( not ( = ?auto_216709 ?auto_216710 ) ) ( not ( = ?auto_216711 ?auto_216713 ) ) ( not ( = ?auto_216711 ?auto_216712 ) ) ( not ( = ?auto_216711 ?auto_216715 ) ) ( not ( = ?auto_216711 ?auto_216710 ) ) ( ON ?auto_216712 ?auto_216714 ) ( not ( = ?auto_216708 ?auto_216714 ) ) ( not ( = ?auto_216709 ?auto_216714 ) ) ( not ( = ?auto_216711 ?auto_216714 ) ) ( not ( = ?auto_216716 ?auto_216714 ) ) ( not ( = ?auto_216712 ?auto_216714 ) ) ( not ( = ?auto_216715 ?auto_216714 ) ) ( not ( = ?auto_216710 ?auto_216714 ) ) ( not ( = ?auto_216713 ?auto_216714 ) ) ( ON ?auto_216715 ?auto_216712 ) ( ON-TABLE ?auto_216714 ) ( ON ?auto_216710 ?auto_216715 ) ( ON ?auto_216713 ?auto_216710 ) ( CLEAR ?auto_216713 ) ( HOLDING ?auto_216716 ) ( CLEAR ?auto_216711 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216708 ?auto_216709 ?auto_216711 ?auto_216716 )
      ( MAKE-1PILE ?auto_216708 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216717 - BLOCK
    )
    :vars
    (
      ?auto_216720 - BLOCK
      ?auto_216725 - BLOCK
      ?auto_216721 - BLOCK
      ?auto_216723 - BLOCK
      ?auto_216724 - BLOCK
      ?auto_216722 - BLOCK
      ?auto_216718 - BLOCK
      ?auto_216719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216720 ?auto_216717 ) ( ON-TABLE ?auto_216717 ) ( not ( = ?auto_216717 ?auto_216720 ) ) ( not ( = ?auto_216717 ?auto_216725 ) ) ( not ( = ?auto_216717 ?auto_216721 ) ) ( not ( = ?auto_216720 ?auto_216725 ) ) ( not ( = ?auto_216720 ?auto_216721 ) ) ( not ( = ?auto_216725 ?auto_216721 ) ) ( ON ?auto_216725 ?auto_216720 ) ( not ( = ?auto_216723 ?auto_216724 ) ) ( not ( = ?auto_216723 ?auto_216722 ) ) ( not ( = ?auto_216723 ?auto_216718 ) ) ( not ( = ?auto_216723 ?auto_216721 ) ) ( not ( = ?auto_216724 ?auto_216722 ) ) ( not ( = ?auto_216724 ?auto_216718 ) ) ( not ( = ?auto_216724 ?auto_216721 ) ) ( not ( = ?auto_216722 ?auto_216718 ) ) ( not ( = ?auto_216722 ?auto_216721 ) ) ( not ( = ?auto_216718 ?auto_216721 ) ) ( not ( = ?auto_216717 ?auto_216718 ) ) ( not ( = ?auto_216717 ?auto_216723 ) ) ( not ( = ?auto_216717 ?auto_216724 ) ) ( not ( = ?auto_216717 ?auto_216722 ) ) ( not ( = ?auto_216720 ?auto_216718 ) ) ( not ( = ?auto_216720 ?auto_216723 ) ) ( not ( = ?auto_216720 ?auto_216724 ) ) ( not ( = ?auto_216720 ?auto_216722 ) ) ( not ( = ?auto_216725 ?auto_216718 ) ) ( not ( = ?auto_216725 ?auto_216723 ) ) ( not ( = ?auto_216725 ?auto_216724 ) ) ( not ( = ?auto_216725 ?auto_216722 ) ) ( ON ?auto_216723 ?auto_216719 ) ( not ( = ?auto_216717 ?auto_216719 ) ) ( not ( = ?auto_216720 ?auto_216719 ) ) ( not ( = ?auto_216725 ?auto_216719 ) ) ( not ( = ?auto_216721 ?auto_216719 ) ) ( not ( = ?auto_216723 ?auto_216719 ) ) ( not ( = ?auto_216724 ?auto_216719 ) ) ( not ( = ?auto_216722 ?auto_216719 ) ) ( not ( = ?auto_216718 ?auto_216719 ) ) ( ON ?auto_216724 ?auto_216723 ) ( ON-TABLE ?auto_216719 ) ( ON ?auto_216722 ?auto_216724 ) ( ON ?auto_216718 ?auto_216722 ) ( CLEAR ?auto_216725 ) ( ON ?auto_216721 ?auto_216718 ) ( CLEAR ?auto_216721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216719 ?auto_216723 ?auto_216724 ?auto_216722 ?auto_216718 )
      ( MAKE-1PILE ?auto_216717 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216726 - BLOCK
    )
    :vars
    (
      ?auto_216733 - BLOCK
      ?auto_216730 - BLOCK
      ?auto_216728 - BLOCK
      ?auto_216727 - BLOCK
      ?auto_216734 - BLOCK
      ?auto_216731 - BLOCK
      ?auto_216732 - BLOCK
      ?auto_216729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216733 ?auto_216726 ) ( ON-TABLE ?auto_216726 ) ( not ( = ?auto_216726 ?auto_216733 ) ) ( not ( = ?auto_216726 ?auto_216730 ) ) ( not ( = ?auto_216726 ?auto_216728 ) ) ( not ( = ?auto_216733 ?auto_216730 ) ) ( not ( = ?auto_216733 ?auto_216728 ) ) ( not ( = ?auto_216730 ?auto_216728 ) ) ( not ( = ?auto_216727 ?auto_216734 ) ) ( not ( = ?auto_216727 ?auto_216731 ) ) ( not ( = ?auto_216727 ?auto_216732 ) ) ( not ( = ?auto_216727 ?auto_216728 ) ) ( not ( = ?auto_216734 ?auto_216731 ) ) ( not ( = ?auto_216734 ?auto_216732 ) ) ( not ( = ?auto_216734 ?auto_216728 ) ) ( not ( = ?auto_216731 ?auto_216732 ) ) ( not ( = ?auto_216731 ?auto_216728 ) ) ( not ( = ?auto_216732 ?auto_216728 ) ) ( not ( = ?auto_216726 ?auto_216732 ) ) ( not ( = ?auto_216726 ?auto_216727 ) ) ( not ( = ?auto_216726 ?auto_216734 ) ) ( not ( = ?auto_216726 ?auto_216731 ) ) ( not ( = ?auto_216733 ?auto_216732 ) ) ( not ( = ?auto_216733 ?auto_216727 ) ) ( not ( = ?auto_216733 ?auto_216734 ) ) ( not ( = ?auto_216733 ?auto_216731 ) ) ( not ( = ?auto_216730 ?auto_216732 ) ) ( not ( = ?auto_216730 ?auto_216727 ) ) ( not ( = ?auto_216730 ?auto_216734 ) ) ( not ( = ?auto_216730 ?auto_216731 ) ) ( ON ?auto_216727 ?auto_216729 ) ( not ( = ?auto_216726 ?auto_216729 ) ) ( not ( = ?auto_216733 ?auto_216729 ) ) ( not ( = ?auto_216730 ?auto_216729 ) ) ( not ( = ?auto_216728 ?auto_216729 ) ) ( not ( = ?auto_216727 ?auto_216729 ) ) ( not ( = ?auto_216734 ?auto_216729 ) ) ( not ( = ?auto_216731 ?auto_216729 ) ) ( not ( = ?auto_216732 ?auto_216729 ) ) ( ON ?auto_216734 ?auto_216727 ) ( ON-TABLE ?auto_216729 ) ( ON ?auto_216731 ?auto_216734 ) ( ON ?auto_216732 ?auto_216731 ) ( ON ?auto_216728 ?auto_216732 ) ( CLEAR ?auto_216728 ) ( HOLDING ?auto_216730 ) ( CLEAR ?auto_216733 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216726 ?auto_216733 ?auto_216730 )
      ( MAKE-1PILE ?auto_216726 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216735 - BLOCK
    )
    :vars
    (
      ?auto_216740 - BLOCK
      ?auto_216742 - BLOCK
      ?auto_216736 - BLOCK
      ?auto_216737 - BLOCK
      ?auto_216741 - BLOCK
      ?auto_216738 - BLOCK
      ?auto_216743 - BLOCK
      ?auto_216739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216740 ?auto_216735 ) ( ON-TABLE ?auto_216735 ) ( not ( = ?auto_216735 ?auto_216740 ) ) ( not ( = ?auto_216735 ?auto_216742 ) ) ( not ( = ?auto_216735 ?auto_216736 ) ) ( not ( = ?auto_216740 ?auto_216742 ) ) ( not ( = ?auto_216740 ?auto_216736 ) ) ( not ( = ?auto_216742 ?auto_216736 ) ) ( not ( = ?auto_216737 ?auto_216741 ) ) ( not ( = ?auto_216737 ?auto_216738 ) ) ( not ( = ?auto_216737 ?auto_216743 ) ) ( not ( = ?auto_216737 ?auto_216736 ) ) ( not ( = ?auto_216741 ?auto_216738 ) ) ( not ( = ?auto_216741 ?auto_216743 ) ) ( not ( = ?auto_216741 ?auto_216736 ) ) ( not ( = ?auto_216738 ?auto_216743 ) ) ( not ( = ?auto_216738 ?auto_216736 ) ) ( not ( = ?auto_216743 ?auto_216736 ) ) ( not ( = ?auto_216735 ?auto_216743 ) ) ( not ( = ?auto_216735 ?auto_216737 ) ) ( not ( = ?auto_216735 ?auto_216741 ) ) ( not ( = ?auto_216735 ?auto_216738 ) ) ( not ( = ?auto_216740 ?auto_216743 ) ) ( not ( = ?auto_216740 ?auto_216737 ) ) ( not ( = ?auto_216740 ?auto_216741 ) ) ( not ( = ?auto_216740 ?auto_216738 ) ) ( not ( = ?auto_216742 ?auto_216743 ) ) ( not ( = ?auto_216742 ?auto_216737 ) ) ( not ( = ?auto_216742 ?auto_216741 ) ) ( not ( = ?auto_216742 ?auto_216738 ) ) ( ON ?auto_216737 ?auto_216739 ) ( not ( = ?auto_216735 ?auto_216739 ) ) ( not ( = ?auto_216740 ?auto_216739 ) ) ( not ( = ?auto_216742 ?auto_216739 ) ) ( not ( = ?auto_216736 ?auto_216739 ) ) ( not ( = ?auto_216737 ?auto_216739 ) ) ( not ( = ?auto_216741 ?auto_216739 ) ) ( not ( = ?auto_216738 ?auto_216739 ) ) ( not ( = ?auto_216743 ?auto_216739 ) ) ( ON ?auto_216741 ?auto_216737 ) ( ON-TABLE ?auto_216739 ) ( ON ?auto_216738 ?auto_216741 ) ( ON ?auto_216743 ?auto_216738 ) ( ON ?auto_216736 ?auto_216743 ) ( CLEAR ?auto_216740 ) ( ON ?auto_216742 ?auto_216736 ) ( CLEAR ?auto_216742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216739 ?auto_216737 ?auto_216741 ?auto_216738 ?auto_216743 ?auto_216736 )
      ( MAKE-1PILE ?auto_216735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216762 - BLOCK
    )
    :vars
    (
      ?auto_216764 - BLOCK
      ?auto_216768 - BLOCK
      ?auto_216770 - BLOCK
      ?auto_216765 - BLOCK
      ?auto_216766 - BLOCK
      ?auto_216769 - BLOCK
      ?auto_216763 - BLOCK
      ?auto_216767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216762 ?auto_216764 ) ) ( not ( = ?auto_216762 ?auto_216768 ) ) ( not ( = ?auto_216762 ?auto_216770 ) ) ( not ( = ?auto_216764 ?auto_216768 ) ) ( not ( = ?auto_216764 ?auto_216770 ) ) ( not ( = ?auto_216768 ?auto_216770 ) ) ( not ( = ?auto_216765 ?auto_216766 ) ) ( not ( = ?auto_216765 ?auto_216769 ) ) ( not ( = ?auto_216765 ?auto_216763 ) ) ( not ( = ?auto_216765 ?auto_216770 ) ) ( not ( = ?auto_216766 ?auto_216769 ) ) ( not ( = ?auto_216766 ?auto_216763 ) ) ( not ( = ?auto_216766 ?auto_216770 ) ) ( not ( = ?auto_216769 ?auto_216763 ) ) ( not ( = ?auto_216769 ?auto_216770 ) ) ( not ( = ?auto_216763 ?auto_216770 ) ) ( not ( = ?auto_216762 ?auto_216763 ) ) ( not ( = ?auto_216762 ?auto_216765 ) ) ( not ( = ?auto_216762 ?auto_216766 ) ) ( not ( = ?auto_216762 ?auto_216769 ) ) ( not ( = ?auto_216764 ?auto_216763 ) ) ( not ( = ?auto_216764 ?auto_216765 ) ) ( not ( = ?auto_216764 ?auto_216766 ) ) ( not ( = ?auto_216764 ?auto_216769 ) ) ( not ( = ?auto_216768 ?auto_216763 ) ) ( not ( = ?auto_216768 ?auto_216765 ) ) ( not ( = ?auto_216768 ?auto_216766 ) ) ( not ( = ?auto_216768 ?auto_216769 ) ) ( ON ?auto_216765 ?auto_216767 ) ( not ( = ?auto_216762 ?auto_216767 ) ) ( not ( = ?auto_216764 ?auto_216767 ) ) ( not ( = ?auto_216768 ?auto_216767 ) ) ( not ( = ?auto_216770 ?auto_216767 ) ) ( not ( = ?auto_216765 ?auto_216767 ) ) ( not ( = ?auto_216766 ?auto_216767 ) ) ( not ( = ?auto_216769 ?auto_216767 ) ) ( not ( = ?auto_216763 ?auto_216767 ) ) ( ON ?auto_216766 ?auto_216765 ) ( ON-TABLE ?auto_216767 ) ( ON ?auto_216769 ?auto_216766 ) ( ON ?auto_216763 ?auto_216769 ) ( ON ?auto_216770 ?auto_216763 ) ( ON ?auto_216768 ?auto_216770 ) ( ON ?auto_216764 ?auto_216768 ) ( CLEAR ?auto_216764 ) ( HOLDING ?auto_216762 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216762 ?auto_216764 )
      ( MAKE-1PILE ?auto_216762 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216771 - BLOCK
    )
    :vars
    (
      ?auto_216775 - BLOCK
      ?auto_216779 - BLOCK
      ?auto_216772 - BLOCK
      ?auto_216778 - BLOCK
      ?auto_216773 - BLOCK
      ?auto_216777 - BLOCK
      ?auto_216776 - BLOCK
      ?auto_216774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216771 ?auto_216775 ) ) ( not ( = ?auto_216771 ?auto_216779 ) ) ( not ( = ?auto_216771 ?auto_216772 ) ) ( not ( = ?auto_216775 ?auto_216779 ) ) ( not ( = ?auto_216775 ?auto_216772 ) ) ( not ( = ?auto_216779 ?auto_216772 ) ) ( not ( = ?auto_216778 ?auto_216773 ) ) ( not ( = ?auto_216778 ?auto_216777 ) ) ( not ( = ?auto_216778 ?auto_216776 ) ) ( not ( = ?auto_216778 ?auto_216772 ) ) ( not ( = ?auto_216773 ?auto_216777 ) ) ( not ( = ?auto_216773 ?auto_216776 ) ) ( not ( = ?auto_216773 ?auto_216772 ) ) ( not ( = ?auto_216777 ?auto_216776 ) ) ( not ( = ?auto_216777 ?auto_216772 ) ) ( not ( = ?auto_216776 ?auto_216772 ) ) ( not ( = ?auto_216771 ?auto_216776 ) ) ( not ( = ?auto_216771 ?auto_216778 ) ) ( not ( = ?auto_216771 ?auto_216773 ) ) ( not ( = ?auto_216771 ?auto_216777 ) ) ( not ( = ?auto_216775 ?auto_216776 ) ) ( not ( = ?auto_216775 ?auto_216778 ) ) ( not ( = ?auto_216775 ?auto_216773 ) ) ( not ( = ?auto_216775 ?auto_216777 ) ) ( not ( = ?auto_216779 ?auto_216776 ) ) ( not ( = ?auto_216779 ?auto_216778 ) ) ( not ( = ?auto_216779 ?auto_216773 ) ) ( not ( = ?auto_216779 ?auto_216777 ) ) ( ON ?auto_216778 ?auto_216774 ) ( not ( = ?auto_216771 ?auto_216774 ) ) ( not ( = ?auto_216775 ?auto_216774 ) ) ( not ( = ?auto_216779 ?auto_216774 ) ) ( not ( = ?auto_216772 ?auto_216774 ) ) ( not ( = ?auto_216778 ?auto_216774 ) ) ( not ( = ?auto_216773 ?auto_216774 ) ) ( not ( = ?auto_216777 ?auto_216774 ) ) ( not ( = ?auto_216776 ?auto_216774 ) ) ( ON ?auto_216773 ?auto_216778 ) ( ON-TABLE ?auto_216774 ) ( ON ?auto_216777 ?auto_216773 ) ( ON ?auto_216776 ?auto_216777 ) ( ON ?auto_216772 ?auto_216776 ) ( ON ?auto_216779 ?auto_216772 ) ( ON ?auto_216775 ?auto_216779 ) ( ON ?auto_216771 ?auto_216775 ) ( CLEAR ?auto_216771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_216774 ?auto_216778 ?auto_216773 ?auto_216777 ?auto_216776 ?auto_216772 ?auto_216779 ?auto_216775 )
      ( MAKE-1PILE ?auto_216771 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216787 - BLOCK
      ?auto_216788 - BLOCK
      ?auto_216789 - BLOCK
      ?auto_216790 - BLOCK
      ?auto_216791 - BLOCK
      ?auto_216792 - BLOCK
      ?auto_216793 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_216793 ) ( CLEAR ?auto_216792 ) ( ON-TABLE ?auto_216787 ) ( ON ?auto_216788 ?auto_216787 ) ( ON ?auto_216789 ?auto_216788 ) ( ON ?auto_216790 ?auto_216789 ) ( ON ?auto_216791 ?auto_216790 ) ( ON ?auto_216792 ?auto_216791 ) ( not ( = ?auto_216787 ?auto_216788 ) ) ( not ( = ?auto_216787 ?auto_216789 ) ) ( not ( = ?auto_216787 ?auto_216790 ) ) ( not ( = ?auto_216787 ?auto_216791 ) ) ( not ( = ?auto_216787 ?auto_216792 ) ) ( not ( = ?auto_216787 ?auto_216793 ) ) ( not ( = ?auto_216788 ?auto_216789 ) ) ( not ( = ?auto_216788 ?auto_216790 ) ) ( not ( = ?auto_216788 ?auto_216791 ) ) ( not ( = ?auto_216788 ?auto_216792 ) ) ( not ( = ?auto_216788 ?auto_216793 ) ) ( not ( = ?auto_216789 ?auto_216790 ) ) ( not ( = ?auto_216789 ?auto_216791 ) ) ( not ( = ?auto_216789 ?auto_216792 ) ) ( not ( = ?auto_216789 ?auto_216793 ) ) ( not ( = ?auto_216790 ?auto_216791 ) ) ( not ( = ?auto_216790 ?auto_216792 ) ) ( not ( = ?auto_216790 ?auto_216793 ) ) ( not ( = ?auto_216791 ?auto_216792 ) ) ( not ( = ?auto_216791 ?auto_216793 ) ) ( not ( = ?auto_216792 ?auto_216793 ) ) )
    :subtasks
    ( ( !STACK ?auto_216793 ?auto_216792 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216794 - BLOCK
      ?auto_216795 - BLOCK
      ?auto_216796 - BLOCK
      ?auto_216797 - BLOCK
      ?auto_216798 - BLOCK
      ?auto_216799 - BLOCK
      ?auto_216800 - BLOCK
    )
    :vars
    (
      ?auto_216801 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216799 ) ( ON-TABLE ?auto_216794 ) ( ON ?auto_216795 ?auto_216794 ) ( ON ?auto_216796 ?auto_216795 ) ( ON ?auto_216797 ?auto_216796 ) ( ON ?auto_216798 ?auto_216797 ) ( ON ?auto_216799 ?auto_216798 ) ( not ( = ?auto_216794 ?auto_216795 ) ) ( not ( = ?auto_216794 ?auto_216796 ) ) ( not ( = ?auto_216794 ?auto_216797 ) ) ( not ( = ?auto_216794 ?auto_216798 ) ) ( not ( = ?auto_216794 ?auto_216799 ) ) ( not ( = ?auto_216794 ?auto_216800 ) ) ( not ( = ?auto_216795 ?auto_216796 ) ) ( not ( = ?auto_216795 ?auto_216797 ) ) ( not ( = ?auto_216795 ?auto_216798 ) ) ( not ( = ?auto_216795 ?auto_216799 ) ) ( not ( = ?auto_216795 ?auto_216800 ) ) ( not ( = ?auto_216796 ?auto_216797 ) ) ( not ( = ?auto_216796 ?auto_216798 ) ) ( not ( = ?auto_216796 ?auto_216799 ) ) ( not ( = ?auto_216796 ?auto_216800 ) ) ( not ( = ?auto_216797 ?auto_216798 ) ) ( not ( = ?auto_216797 ?auto_216799 ) ) ( not ( = ?auto_216797 ?auto_216800 ) ) ( not ( = ?auto_216798 ?auto_216799 ) ) ( not ( = ?auto_216798 ?auto_216800 ) ) ( not ( = ?auto_216799 ?auto_216800 ) ) ( ON ?auto_216800 ?auto_216801 ) ( CLEAR ?auto_216800 ) ( HAND-EMPTY ) ( not ( = ?auto_216794 ?auto_216801 ) ) ( not ( = ?auto_216795 ?auto_216801 ) ) ( not ( = ?auto_216796 ?auto_216801 ) ) ( not ( = ?auto_216797 ?auto_216801 ) ) ( not ( = ?auto_216798 ?auto_216801 ) ) ( not ( = ?auto_216799 ?auto_216801 ) ) ( not ( = ?auto_216800 ?auto_216801 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216800 ?auto_216801 )
      ( MAKE-7PILE ?auto_216794 ?auto_216795 ?auto_216796 ?auto_216797 ?auto_216798 ?auto_216799 ?auto_216800 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216802 - BLOCK
      ?auto_216803 - BLOCK
      ?auto_216804 - BLOCK
      ?auto_216805 - BLOCK
      ?auto_216806 - BLOCK
      ?auto_216807 - BLOCK
      ?auto_216808 - BLOCK
    )
    :vars
    (
      ?auto_216809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216802 ) ( ON ?auto_216803 ?auto_216802 ) ( ON ?auto_216804 ?auto_216803 ) ( ON ?auto_216805 ?auto_216804 ) ( ON ?auto_216806 ?auto_216805 ) ( not ( = ?auto_216802 ?auto_216803 ) ) ( not ( = ?auto_216802 ?auto_216804 ) ) ( not ( = ?auto_216802 ?auto_216805 ) ) ( not ( = ?auto_216802 ?auto_216806 ) ) ( not ( = ?auto_216802 ?auto_216807 ) ) ( not ( = ?auto_216802 ?auto_216808 ) ) ( not ( = ?auto_216803 ?auto_216804 ) ) ( not ( = ?auto_216803 ?auto_216805 ) ) ( not ( = ?auto_216803 ?auto_216806 ) ) ( not ( = ?auto_216803 ?auto_216807 ) ) ( not ( = ?auto_216803 ?auto_216808 ) ) ( not ( = ?auto_216804 ?auto_216805 ) ) ( not ( = ?auto_216804 ?auto_216806 ) ) ( not ( = ?auto_216804 ?auto_216807 ) ) ( not ( = ?auto_216804 ?auto_216808 ) ) ( not ( = ?auto_216805 ?auto_216806 ) ) ( not ( = ?auto_216805 ?auto_216807 ) ) ( not ( = ?auto_216805 ?auto_216808 ) ) ( not ( = ?auto_216806 ?auto_216807 ) ) ( not ( = ?auto_216806 ?auto_216808 ) ) ( not ( = ?auto_216807 ?auto_216808 ) ) ( ON ?auto_216808 ?auto_216809 ) ( CLEAR ?auto_216808 ) ( not ( = ?auto_216802 ?auto_216809 ) ) ( not ( = ?auto_216803 ?auto_216809 ) ) ( not ( = ?auto_216804 ?auto_216809 ) ) ( not ( = ?auto_216805 ?auto_216809 ) ) ( not ( = ?auto_216806 ?auto_216809 ) ) ( not ( = ?auto_216807 ?auto_216809 ) ) ( not ( = ?auto_216808 ?auto_216809 ) ) ( HOLDING ?auto_216807 ) ( CLEAR ?auto_216806 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216802 ?auto_216803 ?auto_216804 ?auto_216805 ?auto_216806 ?auto_216807 )
      ( MAKE-7PILE ?auto_216802 ?auto_216803 ?auto_216804 ?auto_216805 ?auto_216806 ?auto_216807 ?auto_216808 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216810 - BLOCK
      ?auto_216811 - BLOCK
      ?auto_216812 - BLOCK
      ?auto_216813 - BLOCK
      ?auto_216814 - BLOCK
      ?auto_216815 - BLOCK
      ?auto_216816 - BLOCK
    )
    :vars
    (
      ?auto_216817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216810 ) ( ON ?auto_216811 ?auto_216810 ) ( ON ?auto_216812 ?auto_216811 ) ( ON ?auto_216813 ?auto_216812 ) ( ON ?auto_216814 ?auto_216813 ) ( not ( = ?auto_216810 ?auto_216811 ) ) ( not ( = ?auto_216810 ?auto_216812 ) ) ( not ( = ?auto_216810 ?auto_216813 ) ) ( not ( = ?auto_216810 ?auto_216814 ) ) ( not ( = ?auto_216810 ?auto_216815 ) ) ( not ( = ?auto_216810 ?auto_216816 ) ) ( not ( = ?auto_216811 ?auto_216812 ) ) ( not ( = ?auto_216811 ?auto_216813 ) ) ( not ( = ?auto_216811 ?auto_216814 ) ) ( not ( = ?auto_216811 ?auto_216815 ) ) ( not ( = ?auto_216811 ?auto_216816 ) ) ( not ( = ?auto_216812 ?auto_216813 ) ) ( not ( = ?auto_216812 ?auto_216814 ) ) ( not ( = ?auto_216812 ?auto_216815 ) ) ( not ( = ?auto_216812 ?auto_216816 ) ) ( not ( = ?auto_216813 ?auto_216814 ) ) ( not ( = ?auto_216813 ?auto_216815 ) ) ( not ( = ?auto_216813 ?auto_216816 ) ) ( not ( = ?auto_216814 ?auto_216815 ) ) ( not ( = ?auto_216814 ?auto_216816 ) ) ( not ( = ?auto_216815 ?auto_216816 ) ) ( ON ?auto_216816 ?auto_216817 ) ( not ( = ?auto_216810 ?auto_216817 ) ) ( not ( = ?auto_216811 ?auto_216817 ) ) ( not ( = ?auto_216812 ?auto_216817 ) ) ( not ( = ?auto_216813 ?auto_216817 ) ) ( not ( = ?auto_216814 ?auto_216817 ) ) ( not ( = ?auto_216815 ?auto_216817 ) ) ( not ( = ?auto_216816 ?auto_216817 ) ) ( CLEAR ?auto_216814 ) ( ON ?auto_216815 ?auto_216816 ) ( CLEAR ?auto_216815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216817 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216817 ?auto_216816 )
      ( MAKE-7PILE ?auto_216810 ?auto_216811 ?auto_216812 ?auto_216813 ?auto_216814 ?auto_216815 ?auto_216816 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216818 - BLOCK
      ?auto_216819 - BLOCK
      ?auto_216820 - BLOCK
      ?auto_216821 - BLOCK
      ?auto_216822 - BLOCK
      ?auto_216823 - BLOCK
      ?auto_216824 - BLOCK
    )
    :vars
    (
      ?auto_216825 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216818 ) ( ON ?auto_216819 ?auto_216818 ) ( ON ?auto_216820 ?auto_216819 ) ( ON ?auto_216821 ?auto_216820 ) ( not ( = ?auto_216818 ?auto_216819 ) ) ( not ( = ?auto_216818 ?auto_216820 ) ) ( not ( = ?auto_216818 ?auto_216821 ) ) ( not ( = ?auto_216818 ?auto_216822 ) ) ( not ( = ?auto_216818 ?auto_216823 ) ) ( not ( = ?auto_216818 ?auto_216824 ) ) ( not ( = ?auto_216819 ?auto_216820 ) ) ( not ( = ?auto_216819 ?auto_216821 ) ) ( not ( = ?auto_216819 ?auto_216822 ) ) ( not ( = ?auto_216819 ?auto_216823 ) ) ( not ( = ?auto_216819 ?auto_216824 ) ) ( not ( = ?auto_216820 ?auto_216821 ) ) ( not ( = ?auto_216820 ?auto_216822 ) ) ( not ( = ?auto_216820 ?auto_216823 ) ) ( not ( = ?auto_216820 ?auto_216824 ) ) ( not ( = ?auto_216821 ?auto_216822 ) ) ( not ( = ?auto_216821 ?auto_216823 ) ) ( not ( = ?auto_216821 ?auto_216824 ) ) ( not ( = ?auto_216822 ?auto_216823 ) ) ( not ( = ?auto_216822 ?auto_216824 ) ) ( not ( = ?auto_216823 ?auto_216824 ) ) ( ON ?auto_216824 ?auto_216825 ) ( not ( = ?auto_216818 ?auto_216825 ) ) ( not ( = ?auto_216819 ?auto_216825 ) ) ( not ( = ?auto_216820 ?auto_216825 ) ) ( not ( = ?auto_216821 ?auto_216825 ) ) ( not ( = ?auto_216822 ?auto_216825 ) ) ( not ( = ?auto_216823 ?auto_216825 ) ) ( not ( = ?auto_216824 ?auto_216825 ) ) ( ON ?auto_216823 ?auto_216824 ) ( CLEAR ?auto_216823 ) ( ON-TABLE ?auto_216825 ) ( HOLDING ?auto_216822 ) ( CLEAR ?auto_216821 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216818 ?auto_216819 ?auto_216820 ?auto_216821 ?auto_216822 )
      ( MAKE-7PILE ?auto_216818 ?auto_216819 ?auto_216820 ?auto_216821 ?auto_216822 ?auto_216823 ?auto_216824 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216826 - BLOCK
      ?auto_216827 - BLOCK
      ?auto_216828 - BLOCK
      ?auto_216829 - BLOCK
      ?auto_216830 - BLOCK
      ?auto_216831 - BLOCK
      ?auto_216832 - BLOCK
    )
    :vars
    (
      ?auto_216833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216826 ) ( ON ?auto_216827 ?auto_216826 ) ( ON ?auto_216828 ?auto_216827 ) ( ON ?auto_216829 ?auto_216828 ) ( not ( = ?auto_216826 ?auto_216827 ) ) ( not ( = ?auto_216826 ?auto_216828 ) ) ( not ( = ?auto_216826 ?auto_216829 ) ) ( not ( = ?auto_216826 ?auto_216830 ) ) ( not ( = ?auto_216826 ?auto_216831 ) ) ( not ( = ?auto_216826 ?auto_216832 ) ) ( not ( = ?auto_216827 ?auto_216828 ) ) ( not ( = ?auto_216827 ?auto_216829 ) ) ( not ( = ?auto_216827 ?auto_216830 ) ) ( not ( = ?auto_216827 ?auto_216831 ) ) ( not ( = ?auto_216827 ?auto_216832 ) ) ( not ( = ?auto_216828 ?auto_216829 ) ) ( not ( = ?auto_216828 ?auto_216830 ) ) ( not ( = ?auto_216828 ?auto_216831 ) ) ( not ( = ?auto_216828 ?auto_216832 ) ) ( not ( = ?auto_216829 ?auto_216830 ) ) ( not ( = ?auto_216829 ?auto_216831 ) ) ( not ( = ?auto_216829 ?auto_216832 ) ) ( not ( = ?auto_216830 ?auto_216831 ) ) ( not ( = ?auto_216830 ?auto_216832 ) ) ( not ( = ?auto_216831 ?auto_216832 ) ) ( ON ?auto_216832 ?auto_216833 ) ( not ( = ?auto_216826 ?auto_216833 ) ) ( not ( = ?auto_216827 ?auto_216833 ) ) ( not ( = ?auto_216828 ?auto_216833 ) ) ( not ( = ?auto_216829 ?auto_216833 ) ) ( not ( = ?auto_216830 ?auto_216833 ) ) ( not ( = ?auto_216831 ?auto_216833 ) ) ( not ( = ?auto_216832 ?auto_216833 ) ) ( ON ?auto_216831 ?auto_216832 ) ( ON-TABLE ?auto_216833 ) ( CLEAR ?auto_216829 ) ( ON ?auto_216830 ?auto_216831 ) ( CLEAR ?auto_216830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216833 ?auto_216832 ?auto_216831 )
      ( MAKE-7PILE ?auto_216826 ?auto_216827 ?auto_216828 ?auto_216829 ?auto_216830 ?auto_216831 ?auto_216832 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216834 - BLOCK
      ?auto_216835 - BLOCK
      ?auto_216836 - BLOCK
      ?auto_216837 - BLOCK
      ?auto_216838 - BLOCK
      ?auto_216839 - BLOCK
      ?auto_216840 - BLOCK
    )
    :vars
    (
      ?auto_216841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216834 ) ( ON ?auto_216835 ?auto_216834 ) ( ON ?auto_216836 ?auto_216835 ) ( not ( = ?auto_216834 ?auto_216835 ) ) ( not ( = ?auto_216834 ?auto_216836 ) ) ( not ( = ?auto_216834 ?auto_216837 ) ) ( not ( = ?auto_216834 ?auto_216838 ) ) ( not ( = ?auto_216834 ?auto_216839 ) ) ( not ( = ?auto_216834 ?auto_216840 ) ) ( not ( = ?auto_216835 ?auto_216836 ) ) ( not ( = ?auto_216835 ?auto_216837 ) ) ( not ( = ?auto_216835 ?auto_216838 ) ) ( not ( = ?auto_216835 ?auto_216839 ) ) ( not ( = ?auto_216835 ?auto_216840 ) ) ( not ( = ?auto_216836 ?auto_216837 ) ) ( not ( = ?auto_216836 ?auto_216838 ) ) ( not ( = ?auto_216836 ?auto_216839 ) ) ( not ( = ?auto_216836 ?auto_216840 ) ) ( not ( = ?auto_216837 ?auto_216838 ) ) ( not ( = ?auto_216837 ?auto_216839 ) ) ( not ( = ?auto_216837 ?auto_216840 ) ) ( not ( = ?auto_216838 ?auto_216839 ) ) ( not ( = ?auto_216838 ?auto_216840 ) ) ( not ( = ?auto_216839 ?auto_216840 ) ) ( ON ?auto_216840 ?auto_216841 ) ( not ( = ?auto_216834 ?auto_216841 ) ) ( not ( = ?auto_216835 ?auto_216841 ) ) ( not ( = ?auto_216836 ?auto_216841 ) ) ( not ( = ?auto_216837 ?auto_216841 ) ) ( not ( = ?auto_216838 ?auto_216841 ) ) ( not ( = ?auto_216839 ?auto_216841 ) ) ( not ( = ?auto_216840 ?auto_216841 ) ) ( ON ?auto_216839 ?auto_216840 ) ( ON-TABLE ?auto_216841 ) ( ON ?auto_216838 ?auto_216839 ) ( CLEAR ?auto_216838 ) ( HOLDING ?auto_216837 ) ( CLEAR ?auto_216836 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216834 ?auto_216835 ?auto_216836 ?auto_216837 )
      ( MAKE-7PILE ?auto_216834 ?auto_216835 ?auto_216836 ?auto_216837 ?auto_216838 ?auto_216839 ?auto_216840 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216842 - BLOCK
      ?auto_216843 - BLOCK
      ?auto_216844 - BLOCK
      ?auto_216845 - BLOCK
      ?auto_216846 - BLOCK
      ?auto_216847 - BLOCK
      ?auto_216848 - BLOCK
    )
    :vars
    (
      ?auto_216849 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216842 ) ( ON ?auto_216843 ?auto_216842 ) ( ON ?auto_216844 ?auto_216843 ) ( not ( = ?auto_216842 ?auto_216843 ) ) ( not ( = ?auto_216842 ?auto_216844 ) ) ( not ( = ?auto_216842 ?auto_216845 ) ) ( not ( = ?auto_216842 ?auto_216846 ) ) ( not ( = ?auto_216842 ?auto_216847 ) ) ( not ( = ?auto_216842 ?auto_216848 ) ) ( not ( = ?auto_216843 ?auto_216844 ) ) ( not ( = ?auto_216843 ?auto_216845 ) ) ( not ( = ?auto_216843 ?auto_216846 ) ) ( not ( = ?auto_216843 ?auto_216847 ) ) ( not ( = ?auto_216843 ?auto_216848 ) ) ( not ( = ?auto_216844 ?auto_216845 ) ) ( not ( = ?auto_216844 ?auto_216846 ) ) ( not ( = ?auto_216844 ?auto_216847 ) ) ( not ( = ?auto_216844 ?auto_216848 ) ) ( not ( = ?auto_216845 ?auto_216846 ) ) ( not ( = ?auto_216845 ?auto_216847 ) ) ( not ( = ?auto_216845 ?auto_216848 ) ) ( not ( = ?auto_216846 ?auto_216847 ) ) ( not ( = ?auto_216846 ?auto_216848 ) ) ( not ( = ?auto_216847 ?auto_216848 ) ) ( ON ?auto_216848 ?auto_216849 ) ( not ( = ?auto_216842 ?auto_216849 ) ) ( not ( = ?auto_216843 ?auto_216849 ) ) ( not ( = ?auto_216844 ?auto_216849 ) ) ( not ( = ?auto_216845 ?auto_216849 ) ) ( not ( = ?auto_216846 ?auto_216849 ) ) ( not ( = ?auto_216847 ?auto_216849 ) ) ( not ( = ?auto_216848 ?auto_216849 ) ) ( ON ?auto_216847 ?auto_216848 ) ( ON-TABLE ?auto_216849 ) ( ON ?auto_216846 ?auto_216847 ) ( CLEAR ?auto_216844 ) ( ON ?auto_216845 ?auto_216846 ) ( CLEAR ?auto_216845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216849 ?auto_216848 ?auto_216847 ?auto_216846 )
      ( MAKE-7PILE ?auto_216842 ?auto_216843 ?auto_216844 ?auto_216845 ?auto_216846 ?auto_216847 ?auto_216848 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216850 - BLOCK
      ?auto_216851 - BLOCK
      ?auto_216852 - BLOCK
      ?auto_216853 - BLOCK
      ?auto_216854 - BLOCK
      ?auto_216855 - BLOCK
      ?auto_216856 - BLOCK
    )
    :vars
    (
      ?auto_216857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216850 ) ( ON ?auto_216851 ?auto_216850 ) ( not ( = ?auto_216850 ?auto_216851 ) ) ( not ( = ?auto_216850 ?auto_216852 ) ) ( not ( = ?auto_216850 ?auto_216853 ) ) ( not ( = ?auto_216850 ?auto_216854 ) ) ( not ( = ?auto_216850 ?auto_216855 ) ) ( not ( = ?auto_216850 ?auto_216856 ) ) ( not ( = ?auto_216851 ?auto_216852 ) ) ( not ( = ?auto_216851 ?auto_216853 ) ) ( not ( = ?auto_216851 ?auto_216854 ) ) ( not ( = ?auto_216851 ?auto_216855 ) ) ( not ( = ?auto_216851 ?auto_216856 ) ) ( not ( = ?auto_216852 ?auto_216853 ) ) ( not ( = ?auto_216852 ?auto_216854 ) ) ( not ( = ?auto_216852 ?auto_216855 ) ) ( not ( = ?auto_216852 ?auto_216856 ) ) ( not ( = ?auto_216853 ?auto_216854 ) ) ( not ( = ?auto_216853 ?auto_216855 ) ) ( not ( = ?auto_216853 ?auto_216856 ) ) ( not ( = ?auto_216854 ?auto_216855 ) ) ( not ( = ?auto_216854 ?auto_216856 ) ) ( not ( = ?auto_216855 ?auto_216856 ) ) ( ON ?auto_216856 ?auto_216857 ) ( not ( = ?auto_216850 ?auto_216857 ) ) ( not ( = ?auto_216851 ?auto_216857 ) ) ( not ( = ?auto_216852 ?auto_216857 ) ) ( not ( = ?auto_216853 ?auto_216857 ) ) ( not ( = ?auto_216854 ?auto_216857 ) ) ( not ( = ?auto_216855 ?auto_216857 ) ) ( not ( = ?auto_216856 ?auto_216857 ) ) ( ON ?auto_216855 ?auto_216856 ) ( ON-TABLE ?auto_216857 ) ( ON ?auto_216854 ?auto_216855 ) ( ON ?auto_216853 ?auto_216854 ) ( CLEAR ?auto_216853 ) ( HOLDING ?auto_216852 ) ( CLEAR ?auto_216851 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216850 ?auto_216851 ?auto_216852 )
      ( MAKE-7PILE ?auto_216850 ?auto_216851 ?auto_216852 ?auto_216853 ?auto_216854 ?auto_216855 ?auto_216856 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216858 - BLOCK
      ?auto_216859 - BLOCK
      ?auto_216860 - BLOCK
      ?auto_216861 - BLOCK
      ?auto_216862 - BLOCK
      ?auto_216863 - BLOCK
      ?auto_216864 - BLOCK
    )
    :vars
    (
      ?auto_216865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216858 ) ( ON ?auto_216859 ?auto_216858 ) ( not ( = ?auto_216858 ?auto_216859 ) ) ( not ( = ?auto_216858 ?auto_216860 ) ) ( not ( = ?auto_216858 ?auto_216861 ) ) ( not ( = ?auto_216858 ?auto_216862 ) ) ( not ( = ?auto_216858 ?auto_216863 ) ) ( not ( = ?auto_216858 ?auto_216864 ) ) ( not ( = ?auto_216859 ?auto_216860 ) ) ( not ( = ?auto_216859 ?auto_216861 ) ) ( not ( = ?auto_216859 ?auto_216862 ) ) ( not ( = ?auto_216859 ?auto_216863 ) ) ( not ( = ?auto_216859 ?auto_216864 ) ) ( not ( = ?auto_216860 ?auto_216861 ) ) ( not ( = ?auto_216860 ?auto_216862 ) ) ( not ( = ?auto_216860 ?auto_216863 ) ) ( not ( = ?auto_216860 ?auto_216864 ) ) ( not ( = ?auto_216861 ?auto_216862 ) ) ( not ( = ?auto_216861 ?auto_216863 ) ) ( not ( = ?auto_216861 ?auto_216864 ) ) ( not ( = ?auto_216862 ?auto_216863 ) ) ( not ( = ?auto_216862 ?auto_216864 ) ) ( not ( = ?auto_216863 ?auto_216864 ) ) ( ON ?auto_216864 ?auto_216865 ) ( not ( = ?auto_216858 ?auto_216865 ) ) ( not ( = ?auto_216859 ?auto_216865 ) ) ( not ( = ?auto_216860 ?auto_216865 ) ) ( not ( = ?auto_216861 ?auto_216865 ) ) ( not ( = ?auto_216862 ?auto_216865 ) ) ( not ( = ?auto_216863 ?auto_216865 ) ) ( not ( = ?auto_216864 ?auto_216865 ) ) ( ON ?auto_216863 ?auto_216864 ) ( ON-TABLE ?auto_216865 ) ( ON ?auto_216862 ?auto_216863 ) ( ON ?auto_216861 ?auto_216862 ) ( CLEAR ?auto_216859 ) ( ON ?auto_216860 ?auto_216861 ) ( CLEAR ?auto_216860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216865 ?auto_216864 ?auto_216863 ?auto_216862 ?auto_216861 )
      ( MAKE-7PILE ?auto_216858 ?auto_216859 ?auto_216860 ?auto_216861 ?auto_216862 ?auto_216863 ?auto_216864 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216866 - BLOCK
      ?auto_216867 - BLOCK
      ?auto_216868 - BLOCK
      ?auto_216869 - BLOCK
      ?auto_216870 - BLOCK
      ?auto_216871 - BLOCK
      ?auto_216872 - BLOCK
    )
    :vars
    (
      ?auto_216873 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216866 ) ( not ( = ?auto_216866 ?auto_216867 ) ) ( not ( = ?auto_216866 ?auto_216868 ) ) ( not ( = ?auto_216866 ?auto_216869 ) ) ( not ( = ?auto_216866 ?auto_216870 ) ) ( not ( = ?auto_216866 ?auto_216871 ) ) ( not ( = ?auto_216866 ?auto_216872 ) ) ( not ( = ?auto_216867 ?auto_216868 ) ) ( not ( = ?auto_216867 ?auto_216869 ) ) ( not ( = ?auto_216867 ?auto_216870 ) ) ( not ( = ?auto_216867 ?auto_216871 ) ) ( not ( = ?auto_216867 ?auto_216872 ) ) ( not ( = ?auto_216868 ?auto_216869 ) ) ( not ( = ?auto_216868 ?auto_216870 ) ) ( not ( = ?auto_216868 ?auto_216871 ) ) ( not ( = ?auto_216868 ?auto_216872 ) ) ( not ( = ?auto_216869 ?auto_216870 ) ) ( not ( = ?auto_216869 ?auto_216871 ) ) ( not ( = ?auto_216869 ?auto_216872 ) ) ( not ( = ?auto_216870 ?auto_216871 ) ) ( not ( = ?auto_216870 ?auto_216872 ) ) ( not ( = ?auto_216871 ?auto_216872 ) ) ( ON ?auto_216872 ?auto_216873 ) ( not ( = ?auto_216866 ?auto_216873 ) ) ( not ( = ?auto_216867 ?auto_216873 ) ) ( not ( = ?auto_216868 ?auto_216873 ) ) ( not ( = ?auto_216869 ?auto_216873 ) ) ( not ( = ?auto_216870 ?auto_216873 ) ) ( not ( = ?auto_216871 ?auto_216873 ) ) ( not ( = ?auto_216872 ?auto_216873 ) ) ( ON ?auto_216871 ?auto_216872 ) ( ON-TABLE ?auto_216873 ) ( ON ?auto_216870 ?auto_216871 ) ( ON ?auto_216869 ?auto_216870 ) ( ON ?auto_216868 ?auto_216869 ) ( CLEAR ?auto_216868 ) ( HOLDING ?auto_216867 ) ( CLEAR ?auto_216866 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216866 ?auto_216867 )
      ( MAKE-7PILE ?auto_216866 ?auto_216867 ?auto_216868 ?auto_216869 ?auto_216870 ?auto_216871 ?auto_216872 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216874 - BLOCK
      ?auto_216875 - BLOCK
      ?auto_216876 - BLOCK
      ?auto_216877 - BLOCK
      ?auto_216878 - BLOCK
      ?auto_216879 - BLOCK
      ?auto_216880 - BLOCK
    )
    :vars
    (
      ?auto_216881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_216874 ) ( not ( = ?auto_216874 ?auto_216875 ) ) ( not ( = ?auto_216874 ?auto_216876 ) ) ( not ( = ?auto_216874 ?auto_216877 ) ) ( not ( = ?auto_216874 ?auto_216878 ) ) ( not ( = ?auto_216874 ?auto_216879 ) ) ( not ( = ?auto_216874 ?auto_216880 ) ) ( not ( = ?auto_216875 ?auto_216876 ) ) ( not ( = ?auto_216875 ?auto_216877 ) ) ( not ( = ?auto_216875 ?auto_216878 ) ) ( not ( = ?auto_216875 ?auto_216879 ) ) ( not ( = ?auto_216875 ?auto_216880 ) ) ( not ( = ?auto_216876 ?auto_216877 ) ) ( not ( = ?auto_216876 ?auto_216878 ) ) ( not ( = ?auto_216876 ?auto_216879 ) ) ( not ( = ?auto_216876 ?auto_216880 ) ) ( not ( = ?auto_216877 ?auto_216878 ) ) ( not ( = ?auto_216877 ?auto_216879 ) ) ( not ( = ?auto_216877 ?auto_216880 ) ) ( not ( = ?auto_216878 ?auto_216879 ) ) ( not ( = ?auto_216878 ?auto_216880 ) ) ( not ( = ?auto_216879 ?auto_216880 ) ) ( ON ?auto_216880 ?auto_216881 ) ( not ( = ?auto_216874 ?auto_216881 ) ) ( not ( = ?auto_216875 ?auto_216881 ) ) ( not ( = ?auto_216876 ?auto_216881 ) ) ( not ( = ?auto_216877 ?auto_216881 ) ) ( not ( = ?auto_216878 ?auto_216881 ) ) ( not ( = ?auto_216879 ?auto_216881 ) ) ( not ( = ?auto_216880 ?auto_216881 ) ) ( ON ?auto_216879 ?auto_216880 ) ( ON-TABLE ?auto_216881 ) ( ON ?auto_216878 ?auto_216879 ) ( ON ?auto_216877 ?auto_216878 ) ( ON ?auto_216876 ?auto_216877 ) ( CLEAR ?auto_216874 ) ( ON ?auto_216875 ?auto_216876 ) ( CLEAR ?auto_216875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216881 ?auto_216880 ?auto_216879 ?auto_216878 ?auto_216877 ?auto_216876 )
      ( MAKE-7PILE ?auto_216874 ?auto_216875 ?auto_216876 ?auto_216877 ?auto_216878 ?auto_216879 ?auto_216880 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216882 - BLOCK
      ?auto_216883 - BLOCK
      ?auto_216884 - BLOCK
      ?auto_216885 - BLOCK
      ?auto_216886 - BLOCK
      ?auto_216887 - BLOCK
      ?auto_216888 - BLOCK
    )
    :vars
    (
      ?auto_216889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216882 ?auto_216883 ) ) ( not ( = ?auto_216882 ?auto_216884 ) ) ( not ( = ?auto_216882 ?auto_216885 ) ) ( not ( = ?auto_216882 ?auto_216886 ) ) ( not ( = ?auto_216882 ?auto_216887 ) ) ( not ( = ?auto_216882 ?auto_216888 ) ) ( not ( = ?auto_216883 ?auto_216884 ) ) ( not ( = ?auto_216883 ?auto_216885 ) ) ( not ( = ?auto_216883 ?auto_216886 ) ) ( not ( = ?auto_216883 ?auto_216887 ) ) ( not ( = ?auto_216883 ?auto_216888 ) ) ( not ( = ?auto_216884 ?auto_216885 ) ) ( not ( = ?auto_216884 ?auto_216886 ) ) ( not ( = ?auto_216884 ?auto_216887 ) ) ( not ( = ?auto_216884 ?auto_216888 ) ) ( not ( = ?auto_216885 ?auto_216886 ) ) ( not ( = ?auto_216885 ?auto_216887 ) ) ( not ( = ?auto_216885 ?auto_216888 ) ) ( not ( = ?auto_216886 ?auto_216887 ) ) ( not ( = ?auto_216886 ?auto_216888 ) ) ( not ( = ?auto_216887 ?auto_216888 ) ) ( ON ?auto_216888 ?auto_216889 ) ( not ( = ?auto_216882 ?auto_216889 ) ) ( not ( = ?auto_216883 ?auto_216889 ) ) ( not ( = ?auto_216884 ?auto_216889 ) ) ( not ( = ?auto_216885 ?auto_216889 ) ) ( not ( = ?auto_216886 ?auto_216889 ) ) ( not ( = ?auto_216887 ?auto_216889 ) ) ( not ( = ?auto_216888 ?auto_216889 ) ) ( ON ?auto_216887 ?auto_216888 ) ( ON-TABLE ?auto_216889 ) ( ON ?auto_216886 ?auto_216887 ) ( ON ?auto_216885 ?auto_216886 ) ( ON ?auto_216884 ?auto_216885 ) ( ON ?auto_216883 ?auto_216884 ) ( CLEAR ?auto_216883 ) ( HOLDING ?auto_216882 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216882 )
      ( MAKE-7PILE ?auto_216882 ?auto_216883 ?auto_216884 ?auto_216885 ?auto_216886 ?auto_216887 ?auto_216888 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216890 - BLOCK
      ?auto_216891 - BLOCK
      ?auto_216892 - BLOCK
      ?auto_216893 - BLOCK
      ?auto_216894 - BLOCK
      ?auto_216895 - BLOCK
      ?auto_216896 - BLOCK
    )
    :vars
    (
      ?auto_216897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216890 ?auto_216891 ) ) ( not ( = ?auto_216890 ?auto_216892 ) ) ( not ( = ?auto_216890 ?auto_216893 ) ) ( not ( = ?auto_216890 ?auto_216894 ) ) ( not ( = ?auto_216890 ?auto_216895 ) ) ( not ( = ?auto_216890 ?auto_216896 ) ) ( not ( = ?auto_216891 ?auto_216892 ) ) ( not ( = ?auto_216891 ?auto_216893 ) ) ( not ( = ?auto_216891 ?auto_216894 ) ) ( not ( = ?auto_216891 ?auto_216895 ) ) ( not ( = ?auto_216891 ?auto_216896 ) ) ( not ( = ?auto_216892 ?auto_216893 ) ) ( not ( = ?auto_216892 ?auto_216894 ) ) ( not ( = ?auto_216892 ?auto_216895 ) ) ( not ( = ?auto_216892 ?auto_216896 ) ) ( not ( = ?auto_216893 ?auto_216894 ) ) ( not ( = ?auto_216893 ?auto_216895 ) ) ( not ( = ?auto_216893 ?auto_216896 ) ) ( not ( = ?auto_216894 ?auto_216895 ) ) ( not ( = ?auto_216894 ?auto_216896 ) ) ( not ( = ?auto_216895 ?auto_216896 ) ) ( ON ?auto_216896 ?auto_216897 ) ( not ( = ?auto_216890 ?auto_216897 ) ) ( not ( = ?auto_216891 ?auto_216897 ) ) ( not ( = ?auto_216892 ?auto_216897 ) ) ( not ( = ?auto_216893 ?auto_216897 ) ) ( not ( = ?auto_216894 ?auto_216897 ) ) ( not ( = ?auto_216895 ?auto_216897 ) ) ( not ( = ?auto_216896 ?auto_216897 ) ) ( ON ?auto_216895 ?auto_216896 ) ( ON-TABLE ?auto_216897 ) ( ON ?auto_216894 ?auto_216895 ) ( ON ?auto_216893 ?auto_216894 ) ( ON ?auto_216892 ?auto_216893 ) ( ON ?auto_216891 ?auto_216892 ) ( ON ?auto_216890 ?auto_216891 ) ( CLEAR ?auto_216890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216897 ?auto_216896 ?auto_216895 ?auto_216894 ?auto_216893 ?auto_216892 ?auto_216891 )
      ( MAKE-7PILE ?auto_216890 ?auto_216891 ?auto_216892 ?auto_216893 ?auto_216894 ?auto_216895 ?auto_216896 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216898 - BLOCK
      ?auto_216899 - BLOCK
      ?auto_216900 - BLOCK
      ?auto_216901 - BLOCK
      ?auto_216902 - BLOCK
      ?auto_216903 - BLOCK
      ?auto_216904 - BLOCK
    )
    :vars
    (
      ?auto_216905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216898 ?auto_216899 ) ) ( not ( = ?auto_216898 ?auto_216900 ) ) ( not ( = ?auto_216898 ?auto_216901 ) ) ( not ( = ?auto_216898 ?auto_216902 ) ) ( not ( = ?auto_216898 ?auto_216903 ) ) ( not ( = ?auto_216898 ?auto_216904 ) ) ( not ( = ?auto_216899 ?auto_216900 ) ) ( not ( = ?auto_216899 ?auto_216901 ) ) ( not ( = ?auto_216899 ?auto_216902 ) ) ( not ( = ?auto_216899 ?auto_216903 ) ) ( not ( = ?auto_216899 ?auto_216904 ) ) ( not ( = ?auto_216900 ?auto_216901 ) ) ( not ( = ?auto_216900 ?auto_216902 ) ) ( not ( = ?auto_216900 ?auto_216903 ) ) ( not ( = ?auto_216900 ?auto_216904 ) ) ( not ( = ?auto_216901 ?auto_216902 ) ) ( not ( = ?auto_216901 ?auto_216903 ) ) ( not ( = ?auto_216901 ?auto_216904 ) ) ( not ( = ?auto_216902 ?auto_216903 ) ) ( not ( = ?auto_216902 ?auto_216904 ) ) ( not ( = ?auto_216903 ?auto_216904 ) ) ( ON ?auto_216904 ?auto_216905 ) ( not ( = ?auto_216898 ?auto_216905 ) ) ( not ( = ?auto_216899 ?auto_216905 ) ) ( not ( = ?auto_216900 ?auto_216905 ) ) ( not ( = ?auto_216901 ?auto_216905 ) ) ( not ( = ?auto_216902 ?auto_216905 ) ) ( not ( = ?auto_216903 ?auto_216905 ) ) ( not ( = ?auto_216904 ?auto_216905 ) ) ( ON ?auto_216903 ?auto_216904 ) ( ON-TABLE ?auto_216905 ) ( ON ?auto_216902 ?auto_216903 ) ( ON ?auto_216901 ?auto_216902 ) ( ON ?auto_216900 ?auto_216901 ) ( ON ?auto_216899 ?auto_216900 ) ( HOLDING ?auto_216898 ) ( CLEAR ?auto_216899 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_216905 ?auto_216904 ?auto_216903 ?auto_216902 ?auto_216901 ?auto_216900 ?auto_216899 ?auto_216898 )
      ( MAKE-7PILE ?auto_216898 ?auto_216899 ?auto_216900 ?auto_216901 ?auto_216902 ?auto_216903 ?auto_216904 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216906 - BLOCK
      ?auto_216907 - BLOCK
      ?auto_216908 - BLOCK
      ?auto_216909 - BLOCK
      ?auto_216910 - BLOCK
      ?auto_216911 - BLOCK
      ?auto_216912 - BLOCK
    )
    :vars
    (
      ?auto_216913 - BLOCK
      ?auto_216914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216906 ?auto_216907 ) ) ( not ( = ?auto_216906 ?auto_216908 ) ) ( not ( = ?auto_216906 ?auto_216909 ) ) ( not ( = ?auto_216906 ?auto_216910 ) ) ( not ( = ?auto_216906 ?auto_216911 ) ) ( not ( = ?auto_216906 ?auto_216912 ) ) ( not ( = ?auto_216907 ?auto_216908 ) ) ( not ( = ?auto_216907 ?auto_216909 ) ) ( not ( = ?auto_216907 ?auto_216910 ) ) ( not ( = ?auto_216907 ?auto_216911 ) ) ( not ( = ?auto_216907 ?auto_216912 ) ) ( not ( = ?auto_216908 ?auto_216909 ) ) ( not ( = ?auto_216908 ?auto_216910 ) ) ( not ( = ?auto_216908 ?auto_216911 ) ) ( not ( = ?auto_216908 ?auto_216912 ) ) ( not ( = ?auto_216909 ?auto_216910 ) ) ( not ( = ?auto_216909 ?auto_216911 ) ) ( not ( = ?auto_216909 ?auto_216912 ) ) ( not ( = ?auto_216910 ?auto_216911 ) ) ( not ( = ?auto_216910 ?auto_216912 ) ) ( not ( = ?auto_216911 ?auto_216912 ) ) ( ON ?auto_216912 ?auto_216913 ) ( not ( = ?auto_216906 ?auto_216913 ) ) ( not ( = ?auto_216907 ?auto_216913 ) ) ( not ( = ?auto_216908 ?auto_216913 ) ) ( not ( = ?auto_216909 ?auto_216913 ) ) ( not ( = ?auto_216910 ?auto_216913 ) ) ( not ( = ?auto_216911 ?auto_216913 ) ) ( not ( = ?auto_216912 ?auto_216913 ) ) ( ON ?auto_216911 ?auto_216912 ) ( ON-TABLE ?auto_216913 ) ( ON ?auto_216910 ?auto_216911 ) ( ON ?auto_216909 ?auto_216910 ) ( ON ?auto_216908 ?auto_216909 ) ( ON ?auto_216907 ?auto_216908 ) ( CLEAR ?auto_216907 ) ( ON ?auto_216906 ?auto_216914 ) ( CLEAR ?auto_216906 ) ( HAND-EMPTY ) ( not ( = ?auto_216906 ?auto_216914 ) ) ( not ( = ?auto_216907 ?auto_216914 ) ) ( not ( = ?auto_216908 ?auto_216914 ) ) ( not ( = ?auto_216909 ?auto_216914 ) ) ( not ( = ?auto_216910 ?auto_216914 ) ) ( not ( = ?auto_216911 ?auto_216914 ) ) ( not ( = ?auto_216912 ?auto_216914 ) ) ( not ( = ?auto_216913 ?auto_216914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216906 ?auto_216914 )
      ( MAKE-7PILE ?auto_216906 ?auto_216907 ?auto_216908 ?auto_216909 ?auto_216910 ?auto_216911 ?auto_216912 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216915 - BLOCK
      ?auto_216916 - BLOCK
      ?auto_216917 - BLOCK
      ?auto_216918 - BLOCK
      ?auto_216919 - BLOCK
      ?auto_216920 - BLOCK
      ?auto_216921 - BLOCK
    )
    :vars
    (
      ?auto_216923 - BLOCK
      ?auto_216922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216915 ?auto_216916 ) ) ( not ( = ?auto_216915 ?auto_216917 ) ) ( not ( = ?auto_216915 ?auto_216918 ) ) ( not ( = ?auto_216915 ?auto_216919 ) ) ( not ( = ?auto_216915 ?auto_216920 ) ) ( not ( = ?auto_216915 ?auto_216921 ) ) ( not ( = ?auto_216916 ?auto_216917 ) ) ( not ( = ?auto_216916 ?auto_216918 ) ) ( not ( = ?auto_216916 ?auto_216919 ) ) ( not ( = ?auto_216916 ?auto_216920 ) ) ( not ( = ?auto_216916 ?auto_216921 ) ) ( not ( = ?auto_216917 ?auto_216918 ) ) ( not ( = ?auto_216917 ?auto_216919 ) ) ( not ( = ?auto_216917 ?auto_216920 ) ) ( not ( = ?auto_216917 ?auto_216921 ) ) ( not ( = ?auto_216918 ?auto_216919 ) ) ( not ( = ?auto_216918 ?auto_216920 ) ) ( not ( = ?auto_216918 ?auto_216921 ) ) ( not ( = ?auto_216919 ?auto_216920 ) ) ( not ( = ?auto_216919 ?auto_216921 ) ) ( not ( = ?auto_216920 ?auto_216921 ) ) ( ON ?auto_216921 ?auto_216923 ) ( not ( = ?auto_216915 ?auto_216923 ) ) ( not ( = ?auto_216916 ?auto_216923 ) ) ( not ( = ?auto_216917 ?auto_216923 ) ) ( not ( = ?auto_216918 ?auto_216923 ) ) ( not ( = ?auto_216919 ?auto_216923 ) ) ( not ( = ?auto_216920 ?auto_216923 ) ) ( not ( = ?auto_216921 ?auto_216923 ) ) ( ON ?auto_216920 ?auto_216921 ) ( ON-TABLE ?auto_216923 ) ( ON ?auto_216919 ?auto_216920 ) ( ON ?auto_216918 ?auto_216919 ) ( ON ?auto_216917 ?auto_216918 ) ( ON ?auto_216915 ?auto_216922 ) ( CLEAR ?auto_216915 ) ( not ( = ?auto_216915 ?auto_216922 ) ) ( not ( = ?auto_216916 ?auto_216922 ) ) ( not ( = ?auto_216917 ?auto_216922 ) ) ( not ( = ?auto_216918 ?auto_216922 ) ) ( not ( = ?auto_216919 ?auto_216922 ) ) ( not ( = ?auto_216920 ?auto_216922 ) ) ( not ( = ?auto_216921 ?auto_216922 ) ) ( not ( = ?auto_216923 ?auto_216922 ) ) ( HOLDING ?auto_216916 ) ( CLEAR ?auto_216917 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216923 ?auto_216921 ?auto_216920 ?auto_216919 ?auto_216918 ?auto_216917 ?auto_216916 )
      ( MAKE-7PILE ?auto_216915 ?auto_216916 ?auto_216917 ?auto_216918 ?auto_216919 ?auto_216920 ?auto_216921 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216924 - BLOCK
      ?auto_216925 - BLOCK
      ?auto_216926 - BLOCK
      ?auto_216927 - BLOCK
      ?auto_216928 - BLOCK
      ?auto_216929 - BLOCK
      ?auto_216930 - BLOCK
    )
    :vars
    (
      ?auto_216931 - BLOCK
      ?auto_216932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216924 ?auto_216925 ) ) ( not ( = ?auto_216924 ?auto_216926 ) ) ( not ( = ?auto_216924 ?auto_216927 ) ) ( not ( = ?auto_216924 ?auto_216928 ) ) ( not ( = ?auto_216924 ?auto_216929 ) ) ( not ( = ?auto_216924 ?auto_216930 ) ) ( not ( = ?auto_216925 ?auto_216926 ) ) ( not ( = ?auto_216925 ?auto_216927 ) ) ( not ( = ?auto_216925 ?auto_216928 ) ) ( not ( = ?auto_216925 ?auto_216929 ) ) ( not ( = ?auto_216925 ?auto_216930 ) ) ( not ( = ?auto_216926 ?auto_216927 ) ) ( not ( = ?auto_216926 ?auto_216928 ) ) ( not ( = ?auto_216926 ?auto_216929 ) ) ( not ( = ?auto_216926 ?auto_216930 ) ) ( not ( = ?auto_216927 ?auto_216928 ) ) ( not ( = ?auto_216927 ?auto_216929 ) ) ( not ( = ?auto_216927 ?auto_216930 ) ) ( not ( = ?auto_216928 ?auto_216929 ) ) ( not ( = ?auto_216928 ?auto_216930 ) ) ( not ( = ?auto_216929 ?auto_216930 ) ) ( ON ?auto_216930 ?auto_216931 ) ( not ( = ?auto_216924 ?auto_216931 ) ) ( not ( = ?auto_216925 ?auto_216931 ) ) ( not ( = ?auto_216926 ?auto_216931 ) ) ( not ( = ?auto_216927 ?auto_216931 ) ) ( not ( = ?auto_216928 ?auto_216931 ) ) ( not ( = ?auto_216929 ?auto_216931 ) ) ( not ( = ?auto_216930 ?auto_216931 ) ) ( ON ?auto_216929 ?auto_216930 ) ( ON-TABLE ?auto_216931 ) ( ON ?auto_216928 ?auto_216929 ) ( ON ?auto_216927 ?auto_216928 ) ( ON ?auto_216926 ?auto_216927 ) ( ON ?auto_216924 ?auto_216932 ) ( not ( = ?auto_216924 ?auto_216932 ) ) ( not ( = ?auto_216925 ?auto_216932 ) ) ( not ( = ?auto_216926 ?auto_216932 ) ) ( not ( = ?auto_216927 ?auto_216932 ) ) ( not ( = ?auto_216928 ?auto_216932 ) ) ( not ( = ?auto_216929 ?auto_216932 ) ) ( not ( = ?auto_216930 ?auto_216932 ) ) ( not ( = ?auto_216931 ?auto_216932 ) ) ( CLEAR ?auto_216926 ) ( ON ?auto_216925 ?auto_216924 ) ( CLEAR ?auto_216925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216932 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216932 ?auto_216924 )
      ( MAKE-7PILE ?auto_216924 ?auto_216925 ?auto_216926 ?auto_216927 ?auto_216928 ?auto_216929 ?auto_216930 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216933 - BLOCK
      ?auto_216934 - BLOCK
      ?auto_216935 - BLOCK
      ?auto_216936 - BLOCK
      ?auto_216937 - BLOCK
      ?auto_216938 - BLOCK
      ?auto_216939 - BLOCK
    )
    :vars
    (
      ?auto_216941 - BLOCK
      ?auto_216940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216933 ?auto_216934 ) ) ( not ( = ?auto_216933 ?auto_216935 ) ) ( not ( = ?auto_216933 ?auto_216936 ) ) ( not ( = ?auto_216933 ?auto_216937 ) ) ( not ( = ?auto_216933 ?auto_216938 ) ) ( not ( = ?auto_216933 ?auto_216939 ) ) ( not ( = ?auto_216934 ?auto_216935 ) ) ( not ( = ?auto_216934 ?auto_216936 ) ) ( not ( = ?auto_216934 ?auto_216937 ) ) ( not ( = ?auto_216934 ?auto_216938 ) ) ( not ( = ?auto_216934 ?auto_216939 ) ) ( not ( = ?auto_216935 ?auto_216936 ) ) ( not ( = ?auto_216935 ?auto_216937 ) ) ( not ( = ?auto_216935 ?auto_216938 ) ) ( not ( = ?auto_216935 ?auto_216939 ) ) ( not ( = ?auto_216936 ?auto_216937 ) ) ( not ( = ?auto_216936 ?auto_216938 ) ) ( not ( = ?auto_216936 ?auto_216939 ) ) ( not ( = ?auto_216937 ?auto_216938 ) ) ( not ( = ?auto_216937 ?auto_216939 ) ) ( not ( = ?auto_216938 ?auto_216939 ) ) ( ON ?auto_216939 ?auto_216941 ) ( not ( = ?auto_216933 ?auto_216941 ) ) ( not ( = ?auto_216934 ?auto_216941 ) ) ( not ( = ?auto_216935 ?auto_216941 ) ) ( not ( = ?auto_216936 ?auto_216941 ) ) ( not ( = ?auto_216937 ?auto_216941 ) ) ( not ( = ?auto_216938 ?auto_216941 ) ) ( not ( = ?auto_216939 ?auto_216941 ) ) ( ON ?auto_216938 ?auto_216939 ) ( ON-TABLE ?auto_216941 ) ( ON ?auto_216937 ?auto_216938 ) ( ON ?auto_216936 ?auto_216937 ) ( ON ?auto_216933 ?auto_216940 ) ( not ( = ?auto_216933 ?auto_216940 ) ) ( not ( = ?auto_216934 ?auto_216940 ) ) ( not ( = ?auto_216935 ?auto_216940 ) ) ( not ( = ?auto_216936 ?auto_216940 ) ) ( not ( = ?auto_216937 ?auto_216940 ) ) ( not ( = ?auto_216938 ?auto_216940 ) ) ( not ( = ?auto_216939 ?auto_216940 ) ) ( not ( = ?auto_216941 ?auto_216940 ) ) ( ON ?auto_216934 ?auto_216933 ) ( CLEAR ?auto_216934 ) ( ON-TABLE ?auto_216940 ) ( HOLDING ?auto_216935 ) ( CLEAR ?auto_216936 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216941 ?auto_216939 ?auto_216938 ?auto_216937 ?auto_216936 ?auto_216935 )
      ( MAKE-7PILE ?auto_216933 ?auto_216934 ?auto_216935 ?auto_216936 ?auto_216937 ?auto_216938 ?auto_216939 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216942 - BLOCK
      ?auto_216943 - BLOCK
      ?auto_216944 - BLOCK
      ?auto_216945 - BLOCK
      ?auto_216946 - BLOCK
      ?auto_216947 - BLOCK
      ?auto_216948 - BLOCK
    )
    :vars
    (
      ?auto_216949 - BLOCK
      ?auto_216950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216942 ?auto_216943 ) ) ( not ( = ?auto_216942 ?auto_216944 ) ) ( not ( = ?auto_216942 ?auto_216945 ) ) ( not ( = ?auto_216942 ?auto_216946 ) ) ( not ( = ?auto_216942 ?auto_216947 ) ) ( not ( = ?auto_216942 ?auto_216948 ) ) ( not ( = ?auto_216943 ?auto_216944 ) ) ( not ( = ?auto_216943 ?auto_216945 ) ) ( not ( = ?auto_216943 ?auto_216946 ) ) ( not ( = ?auto_216943 ?auto_216947 ) ) ( not ( = ?auto_216943 ?auto_216948 ) ) ( not ( = ?auto_216944 ?auto_216945 ) ) ( not ( = ?auto_216944 ?auto_216946 ) ) ( not ( = ?auto_216944 ?auto_216947 ) ) ( not ( = ?auto_216944 ?auto_216948 ) ) ( not ( = ?auto_216945 ?auto_216946 ) ) ( not ( = ?auto_216945 ?auto_216947 ) ) ( not ( = ?auto_216945 ?auto_216948 ) ) ( not ( = ?auto_216946 ?auto_216947 ) ) ( not ( = ?auto_216946 ?auto_216948 ) ) ( not ( = ?auto_216947 ?auto_216948 ) ) ( ON ?auto_216948 ?auto_216949 ) ( not ( = ?auto_216942 ?auto_216949 ) ) ( not ( = ?auto_216943 ?auto_216949 ) ) ( not ( = ?auto_216944 ?auto_216949 ) ) ( not ( = ?auto_216945 ?auto_216949 ) ) ( not ( = ?auto_216946 ?auto_216949 ) ) ( not ( = ?auto_216947 ?auto_216949 ) ) ( not ( = ?auto_216948 ?auto_216949 ) ) ( ON ?auto_216947 ?auto_216948 ) ( ON-TABLE ?auto_216949 ) ( ON ?auto_216946 ?auto_216947 ) ( ON ?auto_216945 ?auto_216946 ) ( ON ?auto_216942 ?auto_216950 ) ( not ( = ?auto_216942 ?auto_216950 ) ) ( not ( = ?auto_216943 ?auto_216950 ) ) ( not ( = ?auto_216944 ?auto_216950 ) ) ( not ( = ?auto_216945 ?auto_216950 ) ) ( not ( = ?auto_216946 ?auto_216950 ) ) ( not ( = ?auto_216947 ?auto_216950 ) ) ( not ( = ?auto_216948 ?auto_216950 ) ) ( not ( = ?auto_216949 ?auto_216950 ) ) ( ON ?auto_216943 ?auto_216942 ) ( ON-TABLE ?auto_216950 ) ( CLEAR ?auto_216945 ) ( ON ?auto_216944 ?auto_216943 ) ( CLEAR ?auto_216944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216950 ?auto_216942 ?auto_216943 )
      ( MAKE-7PILE ?auto_216942 ?auto_216943 ?auto_216944 ?auto_216945 ?auto_216946 ?auto_216947 ?auto_216948 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216951 - BLOCK
      ?auto_216952 - BLOCK
      ?auto_216953 - BLOCK
      ?auto_216954 - BLOCK
      ?auto_216955 - BLOCK
      ?auto_216956 - BLOCK
      ?auto_216957 - BLOCK
    )
    :vars
    (
      ?auto_216959 - BLOCK
      ?auto_216958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216951 ?auto_216952 ) ) ( not ( = ?auto_216951 ?auto_216953 ) ) ( not ( = ?auto_216951 ?auto_216954 ) ) ( not ( = ?auto_216951 ?auto_216955 ) ) ( not ( = ?auto_216951 ?auto_216956 ) ) ( not ( = ?auto_216951 ?auto_216957 ) ) ( not ( = ?auto_216952 ?auto_216953 ) ) ( not ( = ?auto_216952 ?auto_216954 ) ) ( not ( = ?auto_216952 ?auto_216955 ) ) ( not ( = ?auto_216952 ?auto_216956 ) ) ( not ( = ?auto_216952 ?auto_216957 ) ) ( not ( = ?auto_216953 ?auto_216954 ) ) ( not ( = ?auto_216953 ?auto_216955 ) ) ( not ( = ?auto_216953 ?auto_216956 ) ) ( not ( = ?auto_216953 ?auto_216957 ) ) ( not ( = ?auto_216954 ?auto_216955 ) ) ( not ( = ?auto_216954 ?auto_216956 ) ) ( not ( = ?auto_216954 ?auto_216957 ) ) ( not ( = ?auto_216955 ?auto_216956 ) ) ( not ( = ?auto_216955 ?auto_216957 ) ) ( not ( = ?auto_216956 ?auto_216957 ) ) ( ON ?auto_216957 ?auto_216959 ) ( not ( = ?auto_216951 ?auto_216959 ) ) ( not ( = ?auto_216952 ?auto_216959 ) ) ( not ( = ?auto_216953 ?auto_216959 ) ) ( not ( = ?auto_216954 ?auto_216959 ) ) ( not ( = ?auto_216955 ?auto_216959 ) ) ( not ( = ?auto_216956 ?auto_216959 ) ) ( not ( = ?auto_216957 ?auto_216959 ) ) ( ON ?auto_216956 ?auto_216957 ) ( ON-TABLE ?auto_216959 ) ( ON ?auto_216955 ?auto_216956 ) ( ON ?auto_216951 ?auto_216958 ) ( not ( = ?auto_216951 ?auto_216958 ) ) ( not ( = ?auto_216952 ?auto_216958 ) ) ( not ( = ?auto_216953 ?auto_216958 ) ) ( not ( = ?auto_216954 ?auto_216958 ) ) ( not ( = ?auto_216955 ?auto_216958 ) ) ( not ( = ?auto_216956 ?auto_216958 ) ) ( not ( = ?auto_216957 ?auto_216958 ) ) ( not ( = ?auto_216959 ?auto_216958 ) ) ( ON ?auto_216952 ?auto_216951 ) ( ON-TABLE ?auto_216958 ) ( ON ?auto_216953 ?auto_216952 ) ( CLEAR ?auto_216953 ) ( HOLDING ?auto_216954 ) ( CLEAR ?auto_216955 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216959 ?auto_216957 ?auto_216956 ?auto_216955 ?auto_216954 )
      ( MAKE-7PILE ?auto_216951 ?auto_216952 ?auto_216953 ?auto_216954 ?auto_216955 ?auto_216956 ?auto_216957 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216960 - BLOCK
      ?auto_216961 - BLOCK
      ?auto_216962 - BLOCK
      ?auto_216963 - BLOCK
      ?auto_216964 - BLOCK
      ?auto_216965 - BLOCK
      ?auto_216966 - BLOCK
    )
    :vars
    (
      ?auto_216967 - BLOCK
      ?auto_216968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216960 ?auto_216961 ) ) ( not ( = ?auto_216960 ?auto_216962 ) ) ( not ( = ?auto_216960 ?auto_216963 ) ) ( not ( = ?auto_216960 ?auto_216964 ) ) ( not ( = ?auto_216960 ?auto_216965 ) ) ( not ( = ?auto_216960 ?auto_216966 ) ) ( not ( = ?auto_216961 ?auto_216962 ) ) ( not ( = ?auto_216961 ?auto_216963 ) ) ( not ( = ?auto_216961 ?auto_216964 ) ) ( not ( = ?auto_216961 ?auto_216965 ) ) ( not ( = ?auto_216961 ?auto_216966 ) ) ( not ( = ?auto_216962 ?auto_216963 ) ) ( not ( = ?auto_216962 ?auto_216964 ) ) ( not ( = ?auto_216962 ?auto_216965 ) ) ( not ( = ?auto_216962 ?auto_216966 ) ) ( not ( = ?auto_216963 ?auto_216964 ) ) ( not ( = ?auto_216963 ?auto_216965 ) ) ( not ( = ?auto_216963 ?auto_216966 ) ) ( not ( = ?auto_216964 ?auto_216965 ) ) ( not ( = ?auto_216964 ?auto_216966 ) ) ( not ( = ?auto_216965 ?auto_216966 ) ) ( ON ?auto_216966 ?auto_216967 ) ( not ( = ?auto_216960 ?auto_216967 ) ) ( not ( = ?auto_216961 ?auto_216967 ) ) ( not ( = ?auto_216962 ?auto_216967 ) ) ( not ( = ?auto_216963 ?auto_216967 ) ) ( not ( = ?auto_216964 ?auto_216967 ) ) ( not ( = ?auto_216965 ?auto_216967 ) ) ( not ( = ?auto_216966 ?auto_216967 ) ) ( ON ?auto_216965 ?auto_216966 ) ( ON-TABLE ?auto_216967 ) ( ON ?auto_216964 ?auto_216965 ) ( ON ?auto_216960 ?auto_216968 ) ( not ( = ?auto_216960 ?auto_216968 ) ) ( not ( = ?auto_216961 ?auto_216968 ) ) ( not ( = ?auto_216962 ?auto_216968 ) ) ( not ( = ?auto_216963 ?auto_216968 ) ) ( not ( = ?auto_216964 ?auto_216968 ) ) ( not ( = ?auto_216965 ?auto_216968 ) ) ( not ( = ?auto_216966 ?auto_216968 ) ) ( not ( = ?auto_216967 ?auto_216968 ) ) ( ON ?auto_216961 ?auto_216960 ) ( ON-TABLE ?auto_216968 ) ( ON ?auto_216962 ?auto_216961 ) ( CLEAR ?auto_216964 ) ( ON ?auto_216963 ?auto_216962 ) ( CLEAR ?auto_216963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216968 ?auto_216960 ?auto_216961 ?auto_216962 )
      ( MAKE-7PILE ?auto_216960 ?auto_216961 ?auto_216962 ?auto_216963 ?auto_216964 ?auto_216965 ?auto_216966 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216969 - BLOCK
      ?auto_216970 - BLOCK
      ?auto_216971 - BLOCK
      ?auto_216972 - BLOCK
      ?auto_216973 - BLOCK
      ?auto_216974 - BLOCK
      ?auto_216975 - BLOCK
    )
    :vars
    (
      ?auto_216977 - BLOCK
      ?auto_216976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216969 ?auto_216970 ) ) ( not ( = ?auto_216969 ?auto_216971 ) ) ( not ( = ?auto_216969 ?auto_216972 ) ) ( not ( = ?auto_216969 ?auto_216973 ) ) ( not ( = ?auto_216969 ?auto_216974 ) ) ( not ( = ?auto_216969 ?auto_216975 ) ) ( not ( = ?auto_216970 ?auto_216971 ) ) ( not ( = ?auto_216970 ?auto_216972 ) ) ( not ( = ?auto_216970 ?auto_216973 ) ) ( not ( = ?auto_216970 ?auto_216974 ) ) ( not ( = ?auto_216970 ?auto_216975 ) ) ( not ( = ?auto_216971 ?auto_216972 ) ) ( not ( = ?auto_216971 ?auto_216973 ) ) ( not ( = ?auto_216971 ?auto_216974 ) ) ( not ( = ?auto_216971 ?auto_216975 ) ) ( not ( = ?auto_216972 ?auto_216973 ) ) ( not ( = ?auto_216972 ?auto_216974 ) ) ( not ( = ?auto_216972 ?auto_216975 ) ) ( not ( = ?auto_216973 ?auto_216974 ) ) ( not ( = ?auto_216973 ?auto_216975 ) ) ( not ( = ?auto_216974 ?auto_216975 ) ) ( ON ?auto_216975 ?auto_216977 ) ( not ( = ?auto_216969 ?auto_216977 ) ) ( not ( = ?auto_216970 ?auto_216977 ) ) ( not ( = ?auto_216971 ?auto_216977 ) ) ( not ( = ?auto_216972 ?auto_216977 ) ) ( not ( = ?auto_216973 ?auto_216977 ) ) ( not ( = ?auto_216974 ?auto_216977 ) ) ( not ( = ?auto_216975 ?auto_216977 ) ) ( ON ?auto_216974 ?auto_216975 ) ( ON-TABLE ?auto_216977 ) ( ON ?auto_216969 ?auto_216976 ) ( not ( = ?auto_216969 ?auto_216976 ) ) ( not ( = ?auto_216970 ?auto_216976 ) ) ( not ( = ?auto_216971 ?auto_216976 ) ) ( not ( = ?auto_216972 ?auto_216976 ) ) ( not ( = ?auto_216973 ?auto_216976 ) ) ( not ( = ?auto_216974 ?auto_216976 ) ) ( not ( = ?auto_216975 ?auto_216976 ) ) ( not ( = ?auto_216977 ?auto_216976 ) ) ( ON ?auto_216970 ?auto_216969 ) ( ON-TABLE ?auto_216976 ) ( ON ?auto_216971 ?auto_216970 ) ( ON ?auto_216972 ?auto_216971 ) ( CLEAR ?auto_216972 ) ( HOLDING ?auto_216973 ) ( CLEAR ?auto_216974 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216977 ?auto_216975 ?auto_216974 ?auto_216973 )
      ( MAKE-7PILE ?auto_216969 ?auto_216970 ?auto_216971 ?auto_216972 ?auto_216973 ?auto_216974 ?auto_216975 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216978 - BLOCK
      ?auto_216979 - BLOCK
      ?auto_216980 - BLOCK
      ?auto_216981 - BLOCK
      ?auto_216982 - BLOCK
      ?auto_216983 - BLOCK
      ?auto_216984 - BLOCK
    )
    :vars
    (
      ?auto_216985 - BLOCK
      ?auto_216986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216978 ?auto_216979 ) ) ( not ( = ?auto_216978 ?auto_216980 ) ) ( not ( = ?auto_216978 ?auto_216981 ) ) ( not ( = ?auto_216978 ?auto_216982 ) ) ( not ( = ?auto_216978 ?auto_216983 ) ) ( not ( = ?auto_216978 ?auto_216984 ) ) ( not ( = ?auto_216979 ?auto_216980 ) ) ( not ( = ?auto_216979 ?auto_216981 ) ) ( not ( = ?auto_216979 ?auto_216982 ) ) ( not ( = ?auto_216979 ?auto_216983 ) ) ( not ( = ?auto_216979 ?auto_216984 ) ) ( not ( = ?auto_216980 ?auto_216981 ) ) ( not ( = ?auto_216980 ?auto_216982 ) ) ( not ( = ?auto_216980 ?auto_216983 ) ) ( not ( = ?auto_216980 ?auto_216984 ) ) ( not ( = ?auto_216981 ?auto_216982 ) ) ( not ( = ?auto_216981 ?auto_216983 ) ) ( not ( = ?auto_216981 ?auto_216984 ) ) ( not ( = ?auto_216982 ?auto_216983 ) ) ( not ( = ?auto_216982 ?auto_216984 ) ) ( not ( = ?auto_216983 ?auto_216984 ) ) ( ON ?auto_216984 ?auto_216985 ) ( not ( = ?auto_216978 ?auto_216985 ) ) ( not ( = ?auto_216979 ?auto_216985 ) ) ( not ( = ?auto_216980 ?auto_216985 ) ) ( not ( = ?auto_216981 ?auto_216985 ) ) ( not ( = ?auto_216982 ?auto_216985 ) ) ( not ( = ?auto_216983 ?auto_216985 ) ) ( not ( = ?auto_216984 ?auto_216985 ) ) ( ON ?auto_216983 ?auto_216984 ) ( ON-TABLE ?auto_216985 ) ( ON ?auto_216978 ?auto_216986 ) ( not ( = ?auto_216978 ?auto_216986 ) ) ( not ( = ?auto_216979 ?auto_216986 ) ) ( not ( = ?auto_216980 ?auto_216986 ) ) ( not ( = ?auto_216981 ?auto_216986 ) ) ( not ( = ?auto_216982 ?auto_216986 ) ) ( not ( = ?auto_216983 ?auto_216986 ) ) ( not ( = ?auto_216984 ?auto_216986 ) ) ( not ( = ?auto_216985 ?auto_216986 ) ) ( ON ?auto_216979 ?auto_216978 ) ( ON-TABLE ?auto_216986 ) ( ON ?auto_216980 ?auto_216979 ) ( ON ?auto_216981 ?auto_216980 ) ( CLEAR ?auto_216983 ) ( ON ?auto_216982 ?auto_216981 ) ( CLEAR ?auto_216982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216986 ?auto_216978 ?auto_216979 ?auto_216980 ?auto_216981 )
      ( MAKE-7PILE ?auto_216978 ?auto_216979 ?auto_216980 ?auto_216981 ?auto_216982 ?auto_216983 ?auto_216984 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216987 - BLOCK
      ?auto_216988 - BLOCK
      ?auto_216989 - BLOCK
      ?auto_216990 - BLOCK
      ?auto_216991 - BLOCK
      ?auto_216992 - BLOCK
      ?auto_216993 - BLOCK
    )
    :vars
    (
      ?auto_216994 - BLOCK
      ?auto_216995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216987 ?auto_216988 ) ) ( not ( = ?auto_216987 ?auto_216989 ) ) ( not ( = ?auto_216987 ?auto_216990 ) ) ( not ( = ?auto_216987 ?auto_216991 ) ) ( not ( = ?auto_216987 ?auto_216992 ) ) ( not ( = ?auto_216987 ?auto_216993 ) ) ( not ( = ?auto_216988 ?auto_216989 ) ) ( not ( = ?auto_216988 ?auto_216990 ) ) ( not ( = ?auto_216988 ?auto_216991 ) ) ( not ( = ?auto_216988 ?auto_216992 ) ) ( not ( = ?auto_216988 ?auto_216993 ) ) ( not ( = ?auto_216989 ?auto_216990 ) ) ( not ( = ?auto_216989 ?auto_216991 ) ) ( not ( = ?auto_216989 ?auto_216992 ) ) ( not ( = ?auto_216989 ?auto_216993 ) ) ( not ( = ?auto_216990 ?auto_216991 ) ) ( not ( = ?auto_216990 ?auto_216992 ) ) ( not ( = ?auto_216990 ?auto_216993 ) ) ( not ( = ?auto_216991 ?auto_216992 ) ) ( not ( = ?auto_216991 ?auto_216993 ) ) ( not ( = ?auto_216992 ?auto_216993 ) ) ( ON ?auto_216993 ?auto_216994 ) ( not ( = ?auto_216987 ?auto_216994 ) ) ( not ( = ?auto_216988 ?auto_216994 ) ) ( not ( = ?auto_216989 ?auto_216994 ) ) ( not ( = ?auto_216990 ?auto_216994 ) ) ( not ( = ?auto_216991 ?auto_216994 ) ) ( not ( = ?auto_216992 ?auto_216994 ) ) ( not ( = ?auto_216993 ?auto_216994 ) ) ( ON-TABLE ?auto_216994 ) ( ON ?auto_216987 ?auto_216995 ) ( not ( = ?auto_216987 ?auto_216995 ) ) ( not ( = ?auto_216988 ?auto_216995 ) ) ( not ( = ?auto_216989 ?auto_216995 ) ) ( not ( = ?auto_216990 ?auto_216995 ) ) ( not ( = ?auto_216991 ?auto_216995 ) ) ( not ( = ?auto_216992 ?auto_216995 ) ) ( not ( = ?auto_216993 ?auto_216995 ) ) ( not ( = ?auto_216994 ?auto_216995 ) ) ( ON ?auto_216988 ?auto_216987 ) ( ON-TABLE ?auto_216995 ) ( ON ?auto_216989 ?auto_216988 ) ( ON ?auto_216990 ?auto_216989 ) ( ON ?auto_216991 ?auto_216990 ) ( CLEAR ?auto_216991 ) ( HOLDING ?auto_216992 ) ( CLEAR ?auto_216993 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216994 ?auto_216993 ?auto_216992 )
      ( MAKE-7PILE ?auto_216987 ?auto_216988 ?auto_216989 ?auto_216990 ?auto_216991 ?auto_216992 ?auto_216993 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216996 - BLOCK
      ?auto_216997 - BLOCK
      ?auto_216998 - BLOCK
      ?auto_216999 - BLOCK
      ?auto_217000 - BLOCK
      ?auto_217001 - BLOCK
      ?auto_217002 - BLOCK
    )
    :vars
    (
      ?auto_217003 - BLOCK
      ?auto_217004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216996 ?auto_216997 ) ) ( not ( = ?auto_216996 ?auto_216998 ) ) ( not ( = ?auto_216996 ?auto_216999 ) ) ( not ( = ?auto_216996 ?auto_217000 ) ) ( not ( = ?auto_216996 ?auto_217001 ) ) ( not ( = ?auto_216996 ?auto_217002 ) ) ( not ( = ?auto_216997 ?auto_216998 ) ) ( not ( = ?auto_216997 ?auto_216999 ) ) ( not ( = ?auto_216997 ?auto_217000 ) ) ( not ( = ?auto_216997 ?auto_217001 ) ) ( not ( = ?auto_216997 ?auto_217002 ) ) ( not ( = ?auto_216998 ?auto_216999 ) ) ( not ( = ?auto_216998 ?auto_217000 ) ) ( not ( = ?auto_216998 ?auto_217001 ) ) ( not ( = ?auto_216998 ?auto_217002 ) ) ( not ( = ?auto_216999 ?auto_217000 ) ) ( not ( = ?auto_216999 ?auto_217001 ) ) ( not ( = ?auto_216999 ?auto_217002 ) ) ( not ( = ?auto_217000 ?auto_217001 ) ) ( not ( = ?auto_217000 ?auto_217002 ) ) ( not ( = ?auto_217001 ?auto_217002 ) ) ( ON ?auto_217002 ?auto_217003 ) ( not ( = ?auto_216996 ?auto_217003 ) ) ( not ( = ?auto_216997 ?auto_217003 ) ) ( not ( = ?auto_216998 ?auto_217003 ) ) ( not ( = ?auto_216999 ?auto_217003 ) ) ( not ( = ?auto_217000 ?auto_217003 ) ) ( not ( = ?auto_217001 ?auto_217003 ) ) ( not ( = ?auto_217002 ?auto_217003 ) ) ( ON-TABLE ?auto_217003 ) ( ON ?auto_216996 ?auto_217004 ) ( not ( = ?auto_216996 ?auto_217004 ) ) ( not ( = ?auto_216997 ?auto_217004 ) ) ( not ( = ?auto_216998 ?auto_217004 ) ) ( not ( = ?auto_216999 ?auto_217004 ) ) ( not ( = ?auto_217000 ?auto_217004 ) ) ( not ( = ?auto_217001 ?auto_217004 ) ) ( not ( = ?auto_217002 ?auto_217004 ) ) ( not ( = ?auto_217003 ?auto_217004 ) ) ( ON ?auto_216997 ?auto_216996 ) ( ON-TABLE ?auto_217004 ) ( ON ?auto_216998 ?auto_216997 ) ( ON ?auto_216999 ?auto_216998 ) ( ON ?auto_217000 ?auto_216999 ) ( CLEAR ?auto_217002 ) ( ON ?auto_217001 ?auto_217000 ) ( CLEAR ?auto_217001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_217004 ?auto_216996 ?auto_216997 ?auto_216998 ?auto_216999 ?auto_217000 )
      ( MAKE-7PILE ?auto_216996 ?auto_216997 ?auto_216998 ?auto_216999 ?auto_217000 ?auto_217001 ?auto_217002 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_217005 - BLOCK
      ?auto_217006 - BLOCK
      ?auto_217007 - BLOCK
      ?auto_217008 - BLOCK
      ?auto_217009 - BLOCK
      ?auto_217010 - BLOCK
      ?auto_217011 - BLOCK
    )
    :vars
    (
      ?auto_217013 - BLOCK
      ?auto_217012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217005 ?auto_217006 ) ) ( not ( = ?auto_217005 ?auto_217007 ) ) ( not ( = ?auto_217005 ?auto_217008 ) ) ( not ( = ?auto_217005 ?auto_217009 ) ) ( not ( = ?auto_217005 ?auto_217010 ) ) ( not ( = ?auto_217005 ?auto_217011 ) ) ( not ( = ?auto_217006 ?auto_217007 ) ) ( not ( = ?auto_217006 ?auto_217008 ) ) ( not ( = ?auto_217006 ?auto_217009 ) ) ( not ( = ?auto_217006 ?auto_217010 ) ) ( not ( = ?auto_217006 ?auto_217011 ) ) ( not ( = ?auto_217007 ?auto_217008 ) ) ( not ( = ?auto_217007 ?auto_217009 ) ) ( not ( = ?auto_217007 ?auto_217010 ) ) ( not ( = ?auto_217007 ?auto_217011 ) ) ( not ( = ?auto_217008 ?auto_217009 ) ) ( not ( = ?auto_217008 ?auto_217010 ) ) ( not ( = ?auto_217008 ?auto_217011 ) ) ( not ( = ?auto_217009 ?auto_217010 ) ) ( not ( = ?auto_217009 ?auto_217011 ) ) ( not ( = ?auto_217010 ?auto_217011 ) ) ( not ( = ?auto_217005 ?auto_217013 ) ) ( not ( = ?auto_217006 ?auto_217013 ) ) ( not ( = ?auto_217007 ?auto_217013 ) ) ( not ( = ?auto_217008 ?auto_217013 ) ) ( not ( = ?auto_217009 ?auto_217013 ) ) ( not ( = ?auto_217010 ?auto_217013 ) ) ( not ( = ?auto_217011 ?auto_217013 ) ) ( ON-TABLE ?auto_217013 ) ( ON ?auto_217005 ?auto_217012 ) ( not ( = ?auto_217005 ?auto_217012 ) ) ( not ( = ?auto_217006 ?auto_217012 ) ) ( not ( = ?auto_217007 ?auto_217012 ) ) ( not ( = ?auto_217008 ?auto_217012 ) ) ( not ( = ?auto_217009 ?auto_217012 ) ) ( not ( = ?auto_217010 ?auto_217012 ) ) ( not ( = ?auto_217011 ?auto_217012 ) ) ( not ( = ?auto_217013 ?auto_217012 ) ) ( ON ?auto_217006 ?auto_217005 ) ( ON-TABLE ?auto_217012 ) ( ON ?auto_217007 ?auto_217006 ) ( ON ?auto_217008 ?auto_217007 ) ( ON ?auto_217009 ?auto_217008 ) ( ON ?auto_217010 ?auto_217009 ) ( CLEAR ?auto_217010 ) ( HOLDING ?auto_217011 ) ( CLEAR ?auto_217013 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_217013 ?auto_217011 )
      ( MAKE-7PILE ?auto_217005 ?auto_217006 ?auto_217007 ?auto_217008 ?auto_217009 ?auto_217010 ?auto_217011 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_217014 - BLOCK
      ?auto_217015 - BLOCK
      ?auto_217016 - BLOCK
      ?auto_217017 - BLOCK
      ?auto_217018 - BLOCK
      ?auto_217019 - BLOCK
      ?auto_217020 - BLOCK
    )
    :vars
    (
      ?auto_217022 - BLOCK
      ?auto_217021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217014 ?auto_217015 ) ) ( not ( = ?auto_217014 ?auto_217016 ) ) ( not ( = ?auto_217014 ?auto_217017 ) ) ( not ( = ?auto_217014 ?auto_217018 ) ) ( not ( = ?auto_217014 ?auto_217019 ) ) ( not ( = ?auto_217014 ?auto_217020 ) ) ( not ( = ?auto_217015 ?auto_217016 ) ) ( not ( = ?auto_217015 ?auto_217017 ) ) ( not ( = ?auto_217015 ?auto_217018 ) ) ( not ( = ?auto_217015 ?auto_217019 ) ) ( not ( = ?auto_217015 ?auto_217020 ) ) ( not ( = ?auto_217016 ?auto_217017 ) ) ( not ( = ?auto_217016 ?auto_217018 ) ) ( not ( = ?auto_217016 ?auto_217019 ) ) ( not ( = ?auto_217016 ?auto_217020 ) ) ( not ( = ?auto_217017 ?auto_217018 ) ) ( not ( = ?auto_217017 ?auto_217019 ) ) ( not ( = ?auto_217017 ?auto_217020 ) ) ( not ( = ?auto_217018 ?auto_217019 ) ) ( not ( = ?auto_217018 ?auto_217020 ) ) ( not ( = ?auto_217019 ?auto_217020 ) ) ( not ( = ?auto_217014 ?auto_217022 ) ) ( not ( = ?auto_217015 ?auto_217022 ) ) ( not ( = ?auto_217016 ?auto_217022 ) ) ( not ( = ?auto_217017 ?auto_217022 ) ) ( not ( = ?auto_217018 ?auto_217022 ) ) ( not ( = ?auto_217019 ?auto_217022 ) ) ( not ( = ?auto_217020 ?auto_217022 ) ) ( ON-TABLE ?auto_217022 ) ( ON ?auto_217014 ?auto_217021 ) ( not ( = ?auto_217014 ?auto_217021 ) ) ( not ( = ?auto_217015 ?auto_217021 ) ) ( not ( = ?auto_217016 ?auto_217021 ) ) ( not ( = ?auto_217017 ?auto_217021 ) ) ( not ( = ?auto_217018 ?auto_217021 ) ) ( not ( = ?auto_217019 ?auto_217021 ) ) ( not ( = ?auto_217020 ?auto_217021 ) ) ( not ( = ?auto_217022 ?auto_217021 ) ) ( ON ?auto_217015 ?auto_217014 ) ( ON-TABLE ?auto_217021 ) ( ON ?auto_217016 ?auto_217015 ) ( ON ?auto_217017 ?auto_217016 ) ( ON ?auto_217018 ?auto_217017 ) ( ON ?auto_217019 ?auto_217018 ) ( CLEAR ?auto_217022 ) ( ON ?auto_217020 ?auto_217019 ) ( CLEAR ?auto_217020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_217021 ?auto_217014 ?auto_217015 ?auto_217016 ?auto_217017 ?auto_217018 ?auto_217019 )
      ( MAKE-7PILE ?auto_217014 ?auto_217015 ?auto_217016 ?auto_217017 ?auto_217018 ?auto_217019 ?auto_217020 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_217023 - BLOCK
      ?auto_217024 - BLOCK
      ?auto_217025 - BLOCK
      ?auto_217026 - BLOCK
      ?auto_217027 - BLOCK
      ?auto_217028 - BLOCK
      ?auto_217029 - BLOCK
    )
    :vars
    (
      ?auto_217031 - BLOCK
      ?auto_217030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217023 ?auto_217024 ) ) ( not ( = ?auto_217023 ?auto_217025 ) ) ( not ( = ?auto_217023 ?auto_217026 ) ) ( not ( = ?auto_217023 ?auto_217027 ) ) ( not ( = ?auto_217023 ?auto_217028 ) ) ( not ( = ?auto_217023 ?auto_217029 ) ) ( not ( = ?auto_217024 ?auto_217025 ) ) ( not ( = ?auto_217024 ?auto_217026 ) ) ( not ( = ?auto_217024 ?auto_217027 ) ) ( not ( = ?auto_217024 ?auto_217028 ) ) ( not ( = ?auto_217024 ?auto_217029 ) ) ( not ( = ?auto_217025 ?auto_217026 ) ) ( not ( = ?auto_217025 ?auto_217027 ) ) ( not ( = ?auto_217025 ?auto_217028 ) ) ( not ( = ?auto_217025 ?auto_217029 ) ) ( not ( = ?auto_217026 ?auto_217027 ) ) ( not ( = ?auto_217026 ?auto_217028 ) ) ( not ( = ?auto_217026 ?auto_217029 ) ) ( not ( = ?auto_217027 ?auto_217028 ) ) ( not ( = ?auto_217027 ?auto_217029 ) ) ( not ( = ?auto_217028 ?auto_217029 ) ) ( not ( = ?auto_217023 ?auto_217031 ) ) ( not ( = ?auto_217024 ?auto_217031 ) ) ( not ( = ?auto_217025 ?auto_217031 ) ) ( not ( = ?auto_217026 ?auto_217031 ) ) ( not ( = ?auto_217027 ?auto_217031 ) ) ( not ( = ?auto_217028 ?auto_217031 ) ) ( not ( = ?auto_217029 ?auto_217031 ) ) ( ON ?auto_217023 ?auto_217030 ) ( not ( = ?auto_217023 ?auto_217030 ) ) ( not ( = ?auto_217024 ?auto_217030 ) ) ( not ( = ?auto_217025 ?auto_217030 ) ) ( not ( = ?auto_217026 ?auto_217030 ) ) ( not ( = ?auto_217027 ?auto_217030 ) ) ( not ( = ?auto_217028 ?auto_217030 ) ) ( not ( = ?auto_217029 ?auto_217030 ) ) ( not ( = ?auto_217031 ?auto_217030 ) ) ( ON ?auto_217024 ?auto_217023 ) ( ON-TABLE ?auto_217030 ) ( ON ?auto_217025 ?auto_217024 ) ( ON ?auto_217026 ?auto_217025 ) ( ON ?auto_217027 ?auto_217026 ) ( ON ?auto_217028 ?auto_217027 ) ( ON ?auto_217029 ?auto_217028 ) ( CLEAR ?auto_217029 ) ( HOLDING ?auto_217031 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_217031 )
      ( MAKE-7PILE ?auto_217023 ?auto_217024 ?auto_217025 ?auto_217026 ?auto_217027 ?auto_217028 ?auto_217029 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_217032 - BLOCK
      ?auto_217033 - BLOCK
      ?auto_217034 - BLOCK
      ?auto_217035 - BLOCK
      ?auto_217036 - BLOCK
      ?auto_217037 - BLOCK
      ?auto_217038 - BLOCK
    )
    :vars
    (
      ?auto_217040 - BLOCK
      ?auto_217039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217032 ?auto_217033 ) ) ( not ( = ?auto_217032 ?auto_217034 ) ) ( not ( = ?auto_217032 ?auto_217035 ) ) ( not ( = ?auto_217032 ?auto_217036 ) ) ( not ( = ?auto_217032 ?auto_217037 ) ) ( not ( = ?auto_217032 ?auto_217038 ) ) ( not ( = ?auto_217033 ?auto_217034 ) ) ( not ( = ?auto_217033 ?auto_217035 ) ) ( not ( = ?auto_217033 ?auto_217036 ) ) ( not ( = ?auto_217033 ?auto_217037 ) ) ( not ( = ?auto_217033 ?auto_217038 ) ) ( not ( = ?auto_217034 ?auto_217035 ) ) ( not ( = ?auto_217034 ?auto_217036 ) ) ( not ( = ?auto_217034 ?auto_217037 ) ) ( not ( = ?auto_217034 ?auto_217038 ) ) ( not ( = ?auto_217035 ?auto_217036 ) ) ( not ( = ?auto_217035 ?auto_217037 ) ) ( not ( = ?auto_217035 ?auto_217038 ) ) ( not ( = ?auto_217036 ?auto_217037 ) ) ( not ( = ?auto_217036 ?auto_217038 ) ) ( not ( = ?auto_217037 ?auto_217038 ) ) ( not ( = ?auto_217032 ?auto_217040 ) ) ( not ( = ?auto_217033 ?auto_217040 ) ) ( not ( = ?auto_217034 ?auto_217040 ) ) ( not ( = ?auto_217035 ?auto_217040 ) ) ( not ( = ?auto_217036 ?auto_217040 ) ) ( not ( = ?auto_217037 ?auto_217040 ) ) ( not ( = ?auto_217038 ?auto_217040 ) ) ( ON ?auto_217032 ?auto_217039 ) ( not ( = ?auto_217032 ?auto_217039 ) ) ( not ( = ?auto_217033 ?auto_217039 ) ) ( not ( = ?auto_217034 ?auto_217039 ) ) ( not ( = ?auto_217035 ?auto_217039 ) ) ( not ( = ?auto_217036 ?auto_217039 ) ) ( not ( = ?auto_217037 ?auto_217039 ) ) ( not ( = ?auto_217038 ?auto_217039 ) ) ( not ( = ?auto_217040 ?auto_217039 ) ) ( ON ?auto_217033 ?auto_217032 ) ( ON-TABLE ?auto_217039 ) ( ON ?auto_217034 ?auto_217033 ) ( ON ?auto_217035 ?auto_217034 ) ( ON ?auto_217036 ?auto_217035 ) ( ON ?auto_217037 ?auto_217036 ) ( ON ?auto_217038 ?auto_217037 ) ( ON ?auto_217040 ?auto_217038 ) ( CLEAR ?auto_217040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_217039 ?auto_217032 ?auto_217033 ?auto_217034 ?auto_217035 ?auto_217036 ?auto_217037 ?auto_217038 )
      ( MAKE-7PILE ?auto_217032 ?auto_217033 ?auto_217034 ?auto_217035 ?auto_217036 ?auto_217037 ?auto_217038 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217049 - BLOCK
      ?auto_217050 - BLOCK
      ?auto_217051 - BLOCK
      ?auto_217052 - BLOCK
      ?auto_217053 - BLOCK
      ?auto_217054 - BLOCK
      ?auto_217055 - BLOCK
      ?auto_217056 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_217056 ) ( CLEAR ?auto_217055 ) ( ON-TABLE ?auto_217049 ) ( ON ?auto_217050 ?auto_217049 ) ( ON ?auto_217051 ?auto_217050 ) ( ON ?auto_217052 ?auto_217051 ) ( ON ?auto_217053 ?auto_217052 ) ( ON ?auto_217054 ?auto_217053 ) ( ON ?auto_217055 ?auto_217054 ) ( not ( = ?auto_217049 ?auto_217050 ) ) ( not ( = ?auto_217049 ?auto_217051 ) ) ( not ( = ?auto_217049 ?auto_217052 ) ) ( not ( = ?auto_217049 ?auto_217053 ) ) ( not ( = ?auto_217049 ?auto_217054 ) ) ( not ( = ?auto_217049 ?auto_217055 ) ) ( not ( = ?auto_217049 ?auto_217056 ) ) ( not ( = ?auto_217050 ?auto_217051 ) ) ( not ( = ?auto_217050 ?auto_217052 ) ) ( not ( = ?auto_217050 ?auto_217053 ) ) ( not ( = ?auto_217050 ?auto_217054 ) ) ( not ( = ?auto_217050 ?auto_217055 ) ) ( not ( = ?auto_217050 ?auto_217056 ) ) ( not ( = ?auto_217051 ?auto_217052 ) ) ( not ( = ?auto_217051 ?auto_217053 ) ) ( not ( = ?auto_217051 ?auto_217054 ) ) ( not ( = ?auto_217051 ?auto_217055 ) ) ( not ( = ?auto_217051 ?auto_217056 ) ) ( not ( = ?auto_217052 ?auto_217053 ) ) ( not ( = ?auto_217052 ?auto_217054 ) ) ( not ( = ?auto_217052 ?auto_217055 ) ) ( not ( = ?auto_217052 ?auto_217056 ) ) ( not ( = ?auto_217053 ?auto_217054 ) ) ( not ( = ?auto_217053 ?auto_217055 ) ) ( not ( = ?auto_217053 ?auto_217056 ) ) ( not ( = ?auto_217054 ?auto_217055 ) ) ( not ( = ?auto_217054 ?auto_217056 ) ) ( not ( = ?auto_217055 ?auto_217056 ) ) )
    :subtasks
    ( ( !STACK ?auto_217056 ?auto_217055 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217057 - BLOCK
      ?auto_217058 - BLOCK
      ?auto_217059 - BLOCK
      ?auto_217060 - BLOCK
      ?auto_217061 - BLOCK
      ?auto_217062 - BLOCK
      ?auto_217063 - BLOCK
      ?auto_217064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_217063 ) ( ON-TABLE ?auto_217057 ) ( ON ?auto_217058 ?auto_217057 ) ( ON ?auto_217059 ?auto_217058 ) ( ON ?auto_217060 ?auto_217059 ) ( ON ?auto_217061 ?auto_217060 ) ( ON ?auto_217062 ?auto_217061 ) ( ON ?auto_217063 ?auto_217062 ) ( not ( = ?auto_217057 ?auto_217058 ) ) ( not ( = ?auto_217057 ?auto_217059 ) ) ( not ( = ?auto_217057 ?auto_217060 ) ) ( not ( = ?auto_217057 ?auto_217061 ) ) ( not ( = ?auto_217057 ?auto_217062 ) ) ( not ( = ?auto_217057 ?auto_217063 ) ) ( not ( = ?auto_217057 ?auto_217064 ) ) ( not ( = ?auto_217058 ?auto_217059 ) ) ( not ( = ?auto_217058 ?auto_217060 ) ) ( not ( = ?auto_217058 ?auto_217061 ) ) ( not ( = ?auto_217058 ?auto_217062 ) ) ( not ( = ?auto_217058 ?auto_217063 ) ) ( not ( = ?auto_217058 ?auto_217064 ) ) ( not ( = ?auto_217059 ?auto_217060 ) ) ( not ( = ?auto_217059 ?auto_217061 ) ) ( not ( = ?auto_217059 ?auto_217062 ) ) ( not ( = ?auto_217059 ?auto_217063 ) ) ( not ( = ?auto_217059 ?auto_217064 ) ) ( not ( = ?auto_217060 ?auto_217061 ) ) ( not ( = ?auto_217060 ?auto_217062 ) ) ( not ( = ?auto_217060 ?auto_217063 ) ) ( not ( = ?auto_217060 ?auto_217064 ) ) ( not ( = ?auto_217061 ?auto_217062 ) ) ( not ( = ?auto_217061 ?auto_217063 ) ) ( not ( = ?auto_217061 ?auto_217064 ) ) ( not ( = ?auto_217062 ?auto_217063 ) ) ( not ( = ?auto_217062 ?auto_217064 ) ) ( not ( = ?auto_217063 ?auto_217064 ) ) ( ON-TABLE ?auto_217064 ) ( CLEAR ?auto_217064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_217064 )
      ( MAKE-8PILE ?auto_217057 ?auto_217058 ?auto_217059 ?auto_217060 ?auto_217061 ?auto_217062 ?auto_217063 ?auto_217064 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217065 - BLOCK
      ?auto_217066 - BLOCK
      ?auto_217067 - BLOCK
      ?auto_217068 - BLOCK
      ?auto_217069 - BLOCK
      ?auto_217070 - BLOCK
      ?auto_217071 - BLOCK
      ?auto_217072 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_217065 ) ( ON ?auto_217066 ?auto_217065 ) ( ON ?auto_217067 ?auto_217066 ) ( ON ?auto_217068 ?auto_217067 ) ( ON ?auto_217069 ?auto_217068 ) ( ON ?auto_217070 ?auto_217069 ) ( not ( = ?auto_217065 ?auto_217066 ) ) ( not ( = ?auto_217065 ?auto_217067 ) ) ( not ( = ?auto_217065 ?auto_217068 ) ) ( not ( = ?auto_217065 ?auto_217069 ) ) ( not ( = ?auto_217065 ?auto_217070 ) ) ( not ( = ?auto_217065 ?auto_217071 ) ) ( not ( = ?auto_217065 ?auto_217072 ) ) ( not ( = ?auto_217066 ?auto_217067 ) ) ( not ( = ?auto_217066 ?auto_217068 ) ) ( not ( = ?auto_217066 ?auto_217069 ) ) ( not ( = ?auto_217066 ?auto_217070 ) ) ( not ( = ?auto_217066 ?auto_217071 ) ) ( not ( = ?auto_217066 ?auto_217072 ) ) ( not ( = ?auto_217067 ?auto_217068 ) ) ( not ( = ?auto_217067 ?auto_217069 ) ) ( not ( = ?auto_217067 ?auto_217070 ) ) ( not ( = ?auto_217067 ?auto_217071 ) ) ( not ( = ?auto_217067 ?auto_217072 ) ) ( not ( = ?auto_217068 ?auto_217069 ) ) ( not ( = ?auto_217068 ?auto_217070 ) ) ( not ( = ?auto_217068 ?auto_217071 ) ) ( not ( = ?auto_217068 ?auto_217072 ) ) ( not ( = ?auto_217069 ?auto_217070 ) ) ( not ( = ?auto_217069 ?auto_217071 ) ) ( not ( = ?auto_217069 ?auto_217072 ) ) ( not ( = ?auto_217070 ?auto_217071 ) ) ( not ( = ?auto_217070 ?auto_217072 ) ) ( not ( = ?auto_217071 ?auto_217072 ) ) ( ON-TABLE ?auto_217072 ) ( CLEAR ?auto_217072 ) ( HOLDING ?auto_217071 ) ( CLEAR ?auto_217070 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_217065 ?auto_217066 ?auto_217067 ?auto_217068 ?auto_217069 ?auto_217070 ?auto_217071 )
      ( MAKE-8PILE ?auto_217065 ?auto_217066 ?auto_217067 ?auto_217068 ?auto_217069 ?auto_217070 ?auto_217071 ?auto_217072 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217073 - BLOCK
      ?auto_217074 - BLOCK
      ?auto_217075 - BLOCK
      ?auto_217076 - BLOCK
      ?auto_217077 - BLOCK
      ?auto_217078 - BLOCK
      ?auto_217079 - BLOCK
      ?auto_217080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_217073 ) ( ON ?auto_217074 ?auto_217073 ) ( ON ?auto_217075 ?auto_217074 ) ( ON ?auto_217076 ?auto_217075 ) ( ON ?auto_217077 ?auto_217076 ) ( ON ?auto_217078 ?auto_217077 ) ( not ( = ?auto_217073 ?auto_217074 ) ) ( not ( = ?auto_217073 ?auto_217075 ) ) ( not ( = ?auto_217073 ?auto_217076 ) ) ( not ( = ?auto_217073 ?auto_217077 ) ) ( not ( = ?auto_217073 ?auto_217078 ) ) ( not ( = ?auto_217073 ?auto_217079 ) ) ( not ( = ?auto_217073 ?auto_217080 ) ) ( not ( = ?auto_217074 ?auto_217075 ) ) ( not ( = ?auto_217074 ?auto_217076 ) ) ( not ( = ?auto_217074 ?auto_217077 ) ) ( not ( = ?auto_217074 ?auto_217078 ) ) ( not ( = ?auto_217074 ?auto_217079 ) ) ( not ( = ?auto_217074 ?auto_217080 ) ) ( not ( = ?auto_217075 ?auto_217076 ) ) ( not ( = ?auto_217075 ?auto_217077 ) ) ( not ( = ?auto_217075 ?auto_217078 ) ) ( not ( = ?auto_217075 ?auto_217079 ) ) ( not ( = ?auto_217075 ?auto_217080 ) ) ( not ( = ?auto_217076 ?auto_217077 ) ) ( not ( = ?auto_217076 ?auto_217078 ) ) ( not ( = ?auto_217076 ?auto_217079 ) ) ( not ( = ?auto_217076 ?auto_217080 ) ) ( not ( = ?auto_217077 ?auto_217078 ) ) ( not ( = ?auto_217077 ?auto_217079 ) ) ( not ( = ?auto_217077 ?auto_217080 ) ) ( not ( = ?auto_217078 ?auto_217079 ) ) ( not ( = ?auto_217078 ?auto_217080 ) ) ( not ( = ?auto_217079 ?auto_217080 ) ) ( ON-TABLE ?auto_217080 ) ( CLEAR ?auto_217078 ) ( ON ?auto_217079 ?auto_217080 ) ( CLEAR ?auto_217079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_217080 )
      ( MAKE-8PILE ?auto_217073 ?auto_217074 ?auto_217075 ?auto_217076 ?auto_217077 ?auto_217078 ?auto_217079 ?auto_217080 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217081 - BLOCK
      ?auto_217082 - BLOCK
      ?auto_217083 - BLOCK
      ?auto_217084 - BLOCK
      ?auto_217085 - BLOCK
      ?auto_217086 - BLOCK
      ?auto_217087 - BLOCK
      ?auto_217088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_217081 ) ( ON ?auto_217082 ?auto_217081 ) ( ON ?auto_217083 ?auto_217082 ) ( ON ?auto_217084 ?auto_217083 ) ( ON ?auto_217085 ?auto_217084 ) ( not ( = ?auto_217081 ?auto_217082 ) ) ( not ( = ?auto_217081 ?auto_217083 ) ) ( not ( = ?auto_217081 ?auto_217084 ) ) ( not ( = ?auto_217081 ?auto_217085 ) ) ( not ( = ?auto_217081 ?auto_217086 ) ) ( not ( = ?auto_217081 ?auto_217087 ) ) ( not ( = ?auto_217081 ?auto_217088 ) ) ( not ( = ?auto_217082 ?auto_217083 ) ) ( not ( = ?auto_217082 ?auto_217084 ) ) ( not ( = ?auto_217082 ?auto_217085 ) ) ( not ( = ?auto_217082 ?auto_217086 ) ) ( not ( = ?auto_217082 ?auto_217087 ) ) ( not ( = ?auto_217082 ?auto_217088 ) ) ( not ( = ?auto_217083 ?auto_217084 ) ) ( not ( = ?auto_217083 ?auto_217085 ) ) ( not ( = ?auto_217083 ?auto_217086 ) ) ( not ( = ?auto_217083 ?auto_217087 ) ) ( not ( = ?auto_217083 ?auto_217088 ) ) ( not ( = ?auto_217084 ?auto_217085 ) ) ( not ( = ?auto_217084 ?auto_217086 ) ) ( not ( = ?auto_217084 ?auto_217087 ) ) ( not ( = ?auto_217084 ?auto_217088 ) ) ( not ( = ?auto_217085 ?auto_217086 ) ) ( not ( = ?auto_217085 ?auto_217087 ) ) ( not ( = ?auto_217085 ?auto_217088 ) ) ( not ( = ?auto_217086 ?auto_217087 ) ) ( not ( = ?auto_217086 ?auto_217088 ) ) ( not ( = ?auto_217087 ?auto_217088 ) ) ( ON-TABLE ?auto_217088 ) ( ON ?auto_217087 ?auto_217088 ) ( CLEAR ?auto_217087 ) ( HOLDING ?auto_217086 ) ( CLEAR ?auto_217085 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_217081 ?auto_217082 ?auto_217083 ?auto_217084 ?auto_217085 ?auto_217086 )
      ( MAKE-8PILE ?auto_217081 ?auto_217082 ?auto_217083 ?auto_217084 ?auto_217085 ?auto_217086 ?auto_217087 ?auto_217088 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217089 - BLOCK
      ?auto_217090 - BLOCK
      ?auto_217091 - BLOCK
      ?auto_217092 - BLOCK
      ?auto_217093 - BLOCK
      ?auto_217094 - BLOCK
      ?auto_217095 - BLOCK
      ?auto_217096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_217089 ) ( ON ?auto_217090 ?auto_217089 ) ( ON ?auto_217091 ?auto_217090 ) ( ON ?auto_217092 ?auto_217091 ) ( ON ?auto_217093 ?auto_217092 ) ( not ( = ?auto_217089 ?auto_217090 ) ) ( not ( = ?auto_217089 ?auto_217091 ) ) ( not ( = ?auto_217089 ?auto_217092 ) ) ( not ( = ?auto_217089 ?auto_217093 ) ) ( not ( = ?auto_217089 ?auto_217094 ) ) ( not ( = ?auto_217089 ?auto_217095 ) ) ( not ( = ?auto_217089 ?auto_217096 ) ) ( not ( = ?auto_217090 ?auto_217091 ) ) ( not ( = ?auto_217090 ?auto_217092 ) ) ( not ( = ?auto_217090 ?auto_217093 ) ) ( not ( = ?auto_217090 ?auto_217094 ) ) ( not ( = ?auto_217090 ?auto_217095 ) ) ( not ( = ?auto_217090 ?auto_217096 ) ) ( not ( = ?auto_217091 ?auto_217092 ) ) ( not ( = ?auto_217091 ?auto_217093 ) ) ( not ( = ?auto_217091 ?auto_217094 ) ) ( not ( = ?auto_217091 ?auto_217095 ) ) ( not ( = ?auto_217091 ?auto_217096 ) ) ( not ( = ?auto_217092 ?auto_217093 ) ) ( not ( = ?auto_217092 ?auto_217094 ) ) ( not ( = ?auto_217092 ?auto_217095 ) ) ( not ( = ?auto_217092 ?auto_217096 ) ) ( not ( = ?auto_217093 ?auto_217094 ) ) ( not ( = ?auto_217093 ?auto_217095 ) ) ( not ( = ?auto_217093 ?auto_217096 ) ) ( not ( = ?auto_217094 ?auto_217095 ) ) ( not ( = ?auto_217094 ?auto_217096 ) ) ( not ( = ?auto_217095 ?auto_217096 ) ) ( ON-TABLE ?auto_217096 ) ( ON ?auto_217095 ?auto_217096 ) ( CLEAR ?auto_217093 ) ( ON ?auto_217094 ?auto_217095 ) ( CLEAR ?auto_217094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_217096 ?auto_217095 )
      ( MAKE-8PILE ?auto_217089 ?auto_217090 ?auto_217091 ?auto_217092 ?auto_217093 ?auto_217094 ?auto_217095 ?auto_217096 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217097 - BLOCK
      ?auto_217098 - BLOCK
      ?auto_217099 - BLOCK
      ?auto_217100 - BLOCK
      ?auto_217101 - BLOCK
      ?auto_217102 - BLOCK
      ?auto_217103 - BLOCK
      ?auto_217104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_217097 ) ( ON ?auto_217098 ?auto_217097 ) ( ON ?auto_217099 ?auto_217098 ) ( ON ?auto_217100 ?auto_217099 ) ( not ( = ?auto_217097 ?auto_217098 ) ) ( not ( = ?auto_217097 ?auto_217099 ) ) ( not ( = ?auto_217097 ?auto_217100 ) ) ( not ( = ?auto_217097 ?auto_217101 ) ) ( not ( = ?auto_217097 ?auto_217102 ) ) ( not ( = ?auto_217097 ?auto_217103 ) ) ( not ( = ?auto_217097 ?auto_217104 ) ) ( not ( = ?auto_217098 ?auto_217099 ) ) ( not ( = ?auto_217098 ?auto_217100 ) ) ( not ( = ?auto_217098 ?auto_217101 ) ) ( not ( = ?auto_217098 ?auto_217102 ) ) ( not ( = ?auto_217098 ?auto_217103 ) ) ( not ( = ?auto_217098 ?auto_217104 ) ) ( not ( = ?auto_217099 ?auto_217100 ) ) ( not ( = ?auto_217099 ?auto_217101 ) ) ( not ( = ?auto_217099 ?auto_217102 ) ) ( not ( = ?auto_217099 ?auto_217103 ) ) ( not ( = ?auto_217099 ?auto_217104 ) ) ( not ( = ?auto_217100 ?auto_217101 ) ) ( not ( = ?auto_217100 ?auto_217102 ) ) ( not ( = ?auto_217100 ?auto_217103 ) ) ( not ( = ?auto_217100 ?auto_217104 ) ) ( not ( = ?auto_217101 ?auto_217102 ) ) ( not ( = ?auto_217101 ?auto_217103 ) ) ( not ( = ?auto_217101 ?auto_217104 ) ) ( not ( = ?auto_217102 ?auto_217103 ) ) ( not ( = ?auto_217102 ?auto_217104 ) ) ( not ( = ?auto_217103 ?auto_217104 ) ) ( ON-TABLE ?auto_217104 ) ( ON ?auto_217103 ?auto_217104 ) ( ON ?auto_217102 ?auto_217103 ) ( CLEAR ?auto_217102 ) ( HOLDING ?auto_217101 ) ( CLEAR ?auto_217100 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_217097 ?auto_217098 ?auto_217099 ?auto_217100 ?auto_217101 )
      ( MAKE-8PILE ?auto_217097 ?auto_217098 ?auto_217099 ?auto_217100 ?auto_217101 ?auto_217102 ?auto_217103 ?auto_217104 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217105 - BLOCK
      ?auto_217106 - BLOCK
      ?auto_217107 - BLOCK
      ?auto_217108 - BLOCK
      ?auto_217109 - BLOCK
      ?auto_217110 - BLOCK
      ?auto_217111 - BLOCK
      ?auto_217112 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_217105 ) ( ON ?auto_217106 ?auto_217105 ) ( ON ?auto_217107 ?auto_217106 ) ( ON ?auto_217108 ?auto_217107 ) ( not ( = ?auto_217105 ?auto_217106 ) ) ( not ( = ?auto_217105 ?auto_217107 ) ) ( not ( = ?auto_217105 ?auto_217108 ) ) ( not ( = ?auto_217105 ?auto_217109 ) ) ( not ( = ?auto_217105 ?auto_217110 ) ) ( not ( = ?auto_217105 ?auto_217111 ) ) ( not ( = ?auto_217105 ?auto_217112 ) ) ( not ( = ?auto_217106 ?auto_217107 ) ) ( not ( = ?auto_217106 ?auto_217108 ) ) ( not ( = ?auto_217106 ?auto_217109 ) ) ( not ( = ?auto_217106 ?auto_217110 ) ) ( not ( = ?auto_217106 ?auto_217111 ) ) ( not ( = ?auto_217106 ?auto_217112 ) ) ( not ( = ?auto_217107 ?auto_217108 ) ) ( not ( = ?auto_217107 ?auto_217109 ) ) ( not ( = ?auto_217107 ?auto_217110 ) ) ( not ( = ?auto_217107 ?auto_217111 ) ) ( not ( = ?auto_217107 ?auto_217112 ) ) ( not ( = ?auto_217108 ?auto_217109 ) ) ( not ( = ?auto_217108 ?auto_217110 ) ) ( not ( = ?auto_217108 ?auto_217111 ) ) ( not ( = ?auto_217108 ?auto_217112 ) ) ( not ( = ?auto_217109 ?auto_217110 ) ) ( not ( = ?auto_217109 ?auto_217111 ) ) ( not ( = ?auto_217109 ?auto_217112 ) ) ( not ( = ?auto_217110 ?auto_217111 ) ) ( not ( = ?auto_217110 ?auto_217112 ) ) ( not ( = ?auto_217111 ?auto_217112 ) ) ( ON-TABLE ?auto_217112 ) ( ON ?auto_217111 ?auto_217112 ) ( ON ?auto_217110 ?auto_217111 ) ( CLEAR ?auto_217108 ) ( ON ?auto_217109 ?auto_217110 ) ( CLEAR ?auto_217109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_217112 ?auto_217111 ?auto_217110 )
      ( MAKE-8PILE ?auto_217105 ?auto_217106 ?auto_217107 ?auto_217108 ?auto_217109 ?auto_217110 ?auto_217111 ?auto_217112 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217113 - BLOCK
      ?auto_217114 - BLOCK
      ?auto_217115 - BLOCK
      ?auto_217116 - BLOCK
      ?auto_217117 - BLOCK
      ?auto_217118 - BLOCK
      ?auto_217119 - BLOCK
      ?auto_217120 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_217113 ) ( ON ?auto_217114 ?auto_217113 ) ( ON ?auto_217115 ?auto_217114 ) ( not ( = ?auto_217113 ?auto_217114 ) ) ( not ( = ?auto_217113 ?auto_217115 ) ) ( not ( = ?auto_217113 ?auto_217116 ) ) ( not ( = ?auto_217113 ?auto_217117 ) ) ( not ( = ?auto_217113 ?auto_217118 ) ) ( not ( = ?auto_217113 ?auto_217119 ) ) ( not ( = ?auto_217113 ?auto_217120 ) ) ( not ( = ?auto_217114 ?auto_217115 ) ) ( not ( = ?auto_217114 ?auto_217116 ) ) ( not ( = ?auto_217114 ?auto_217117 ) ) ( not ( = ?auto_217114 ?auto_217118 ) ) ( not ( = ?auto_217114 ?auto_217119 ) ) ( not ( = ?auto_217114 ?auto_217120 ) ) ( not ( = ?auto_217115 ?auto_217116 ) ) ( not ( = ?auto_217115 ?auto_217117 ) ) ( not ( = ?auto_217115 ?auto_217118 ) ) ( not ( = ?auto_217115 ?auto_217119 ) ) ( not ( = ?auto_217115 ?auto_217120 ) ) ( not ( = ?auto_217116 ?auto_217117 ) ) ( not ( = ?auto_217116 ?auto_217118 ) ) ( not ( = ?auto_217116 ?auto_217119 ) ) ( not ( = ?auto_217116 ?auto_217120 ) ) ( not ( = ?auto_217117 ?auto_217118 ) ) ( not ( = ?auto_217117 ?auto_217119 ) ) ( not ( = ?auto_217117 ?auto_217120 ) ) ( not ( = ?auto_217118 ?auto_217119 ) ) ( not ( = ?auto_217118 ?auto_217120 ) ) ( not ( = ?auto_217119 ?auto_217120 ) ) ( ON-TABLE ?auto_217120 ) ( ON ?auto_217119 ?auto_217120 ) ( ON ?auto_217118 ?auto_217119 ) ( ON ?auto_217117 ?auto_217118 ) ( CLEAR ?auto_217117 ) ( HOLDING ?auto_217116 ) ( CLEAR ?auto_217115 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_217113 ?auto_217114 ?auto_217115 ?auto_217116 )
      ( MAKE-8PILE ?auto_217113 ?auto_217114 ?auto_217115 ?auto_217116 ?auto_217117 ?auto_217118 ?auto_217119 ?auto_217120 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217121 - BLOCK
      ?auto_217122 - BLOCK
      ?auto_217123 - BLOCK
      ?auto_217124 - BLOCK
      ?auto_217125 - BLOCK
      ?auto_217126 - BLOCK
      ?auto_217127 - BLOCK
      ?auto_217128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_217121 ) ( ON ?auto_217122 ?auto_217121 ) ( ON ?auto_217123 ?auto_217122 ) ( not ( = ?auto_217121 ?auto_217122 ) ) ( not ( = ?auto_217121 ?auto_217123 ) ) ( not ( = ?auto_217121 ?auto_217124 ) ) ( not ( = ?auto_217121 ?auto_217125 ) ) ( not ( = ?auto_217121 ?auto_217126 ) ) ( not ( = ?auto_217121 ?auto_217127 ) ) ( not ( = ?auto_217121 ?auto_217128 ) ) ( not ( = ?auto_217122 ?auto_217123 ) ) ( not ( = ?auto_217122 ?auto_217124 ) ) ( not ( = ?auto_217122 ?auto_217125 ) ) ( not ( = ?auto_217122 ?auto_217126 ) ) ( not ( = ?auto_217122 ?auto_217127 ) ) ( not ( = ?auto_217122 ?auto_217128 ) ) ( not ( = ?auto_217123 ?auto_217124 ) ) ( not ( = ?auto_217123 ?auto_217125 ) ) ( not ( = ?auto_217123 ?auto_217126 ) ) ( not ( = ?auto_217123 ?auto_217127 ) ) ( not ( = ?auto_217123 ?auto_217128 ) ) ( not ( = ?auto_217124 ?auto_217125 ) ) ( not ( = ?auto_217124 ?auto_217126 ) ) ( not ( = ?auto_217124 ?auto_217127 ) ) ( not ( = ?auto_217124 ?auto_217128 ) ) ( not ( = ?auto_217125 ?auto_217126 ) ) ( not ( = ?auto_217125 ?auto_217127 ) ) ( not ( = ?auto_217125 ?auto_217128 ) ) ( not ( = ?auto_217126 ?auto_217127 ) ) ( not ( = ?auto_217126 ?auto_217128 ) ) ( not ( = ?auto_217127 ?auto_217128 ) ) ( ON-TABLE ?auto_217128 ) ( ON ?auto_217127 ?auto_217128 ) ( ON ?auto_217126 ?auto_217127 ) ( ON ?auto_217125 ?auto_217126 ) ( CLEAR ?auto_217123 ) ( ON ?auto_217124 ?auto_217125 ) ( CLEAR ?auto_217124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_217128 ?auto_217127 ?auto_217126 ?auto_217125 )
      ( MAKE-8PILE ?auto_217121 ?auto_217122 ?auto_217123 ?auto_217124 ?auto_217125 ?auto_217126 ?auto_217127 ?auto_217128 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217129 - BLOCK
      ?auto_217130 - BLOCK
      ?auto_217131 - BLOCK
      ?auto_217132 - BLOCK
      ?auto_217133 - BLOCK
      ?auto_217134 - BLOCK
      ?auto_217135 - BLOCK
      ?auto_217136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_217129 ) ( ON ?auto_217130 ?auto_217129 ) ( not ( = ?auto_217129 ?auto_217130 ) ) ( not ( = ?auto_217129 ?auto_217131 ) ) ( not ( = ?auto_217129 ?auto_217132 ) ) ( not ( = ?auto_217129 ?auto_217133 ) ) ( not ( = ?auto_217129 ?auto_217134 ) ) ( not ( = ?auto_217129 ?auto_217135 ) ) ( not ( = ?auto_217129 ?auto_217136 ) ) ( not ( = ?auto_217130 ?auto_217131 ) ) ( not ( = ?auto_217130 ?auto_217132 ) ) ( not ( = ?auto_217130 ?auto_217133 ) ) ( not ( = ?auto_217130 ?auto_217134 ) ) ( not ( = ?auto_217130 ?auto_217135 ) ) ( not ( = ?auto_217130 ?auto_217136 ) ) ( not ( = ?auto_217131 ?auto_217132 ) ) ( not ( = ?auto_217131 ?auto_217133 ) ) ( not ( = ?auto_217131 ?auto_217134 ) ) ( not ( = ?auto_217131 ?auto_217135 ) ) ( not ( = ?auto_217131 ?auto_217136 ) ) ( not ( = ?auto_217132 ?auto_217133 ) ) ( not ( = ?auto_217132 ?auto_217134 ) ) ( not ( = ?auto_217132 ?auto_217135 ) ) ( not ( = ?auto_217132 ?auto_217136 ) ) ( not ( = ?auto_217133 ?auto_217134 ) ) ( not ( = ?auto_217133 ?auto_217135 ) ) ( not ( = ?auto_217133 ?auto_217136 ) ) ( not ( = ?auto_217134 ?auto_217135 ) ) ( not ( = ?auto_217134 ?auto_217136 ) ) ( not ( = ?auto_217135 ?auto_217136 ) ) ( ON-TABLE ?auto_217136 ) ( ON ?auto_217135 ?auto_217136 ) ( ON ?auto_217134 ?auto_217135 ) ( ON ?auto_217133 ?auto_217134 ) ( ON ?auto_217132 ?auto_217133 ) ( CLEAR ?auto_217132 ) ( HOLDING ?auto_217131 ) ( CLEAR ?auto_217130 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_217129 ?auto_217130 ?auto_217131 )
      ( MAKE-8PILE ?auto_217129 ?auto_217130 ?auto_217131 ?auto_217132 ?auto_217133 ?auto_217134 ?auto_217135 ?auto_217136 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217137 - BLOCK
      ?auto_217138 - BLOCK
      ?auto_217139 - BLOCK
      ?auto_217140 - BLOCK
      ?auto_217141 - BLOCK
      ?auto_217142 - BLOCK
      ?auto_217143 - BLOCK
      ?auto_217144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_217137 ) ( ON ?auto_217138 ?auto_217137 ) ( not ( = ?auto_217137 ?auto_217138 ) ) ( not ( = ?auto_217137 ?auto_217139 ) ) ( not ( = ?auto_217137 ?auto_217140 ) ) ( not ( = ?auto_217137 ?auto_217141 ) ) ( not ( = ?auto_217137 ?auto_217142 ) ) ( not ( = ?auto_217137 ?auto_217143 ) ) ( not ( = ?auto_217137 ?auto_217144 ) ) ( not ( = ?auto_217138 ?auto_217139 ) ) ( not ( = ?auto_217138 ?auto_217140 ) ) ( not ( = ?auto_217138 ?auto_217141 ) ) ( not ( = ?auto_217138 ?auto_217142 ) ) ( not ( = ?auto_217138 ?auto_217143 ) ) ( not ( = ?auto_217138 ?auto_217144 ) ) ( not ( = ?auto_217139 ?auto_217140 ) ) ( not ( = ?auto_217139 ?auto_217141 ) ) ( not ( = ?auto_217139 ?auto_217142 ) ) ( not ( = ?auto_217139 ?auto_217143 ) ) ( not ( = ?auto_217139 ?auto_217144 ) ) ( not ( = ?auto_217140 ?auto_217141 ) ) ( not ( = ?auto_217140 ?auto_217142 ) ) ( not ( = ?auto_217140 ?auto_217143 ) ) ( not ( = ?auto_217140 ?auto_217144 ) ) ( not ( = ?auto_217141 ?auto_217142 ) ) ( not ( = ?auto_217141 ?auto_217143 ) ) ( not ( = ?auto_217141 ?auto_217144 ) ) ( not ( = ?auto_217142 ?auto_217143 ) ) ( not ( = ?auto_217142 ?auto_217144 ) ) ( not ( = ?auto_217143 ?auto_217144 ) ) ( ON-TABLE ?auto_217144 ) ( ON ?auto_217143 ?auto_217144 ) ( ON ?auto_217142 ?auto_217143 ) ( ON ?auto_217141 ?auto_217142 ) ( ON ?auto_217140 ?auto_217141 ) ( CLEAR ?auto_217138 ) ( ON ?auto_217139 ?auto_217140 ) ( CLEAR ?auto_217139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_217144 ?auto_217143 ?auto_217142 ?auto_217141 ?auto_217140 )
      ( MAKE-8PILE ?auto_217137 ?auto_217138 ?auto_217139 ?auto_217140 ?auto_217141 ?auto_217142 ?auto_217143 ?auto_217144 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217145 - BLOCK
      ?auto_217146 - BLOCK
      ?auto_217147 - BLOCK
      ?auto_217148 - BLOCK
      ?auto_217149 - BLOCK
      ?auto_217150 - BLOCK
      ?auto_217151 - BLOCK
      ?auto_217152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_217145 ) ( not ( = ?auto_217145 ?auto_217146 ) ) ( not ( = ?auto_217145 ?auto_217147 ) ) ( not ( = ?auto_217145 ?auto_217148 ) ) ( not ( = ?auto_217145 ?auto_217149 ) ) ( not ( = ?auto_217145 ?auto_217150 ) ) ( not ( = ?auto_217145 ?auto_217151 ) ) ( not ( = ?auto_217145 ?auto_217152 ) ) ( not ( = ?auto_217146 ?auto_217147 ) ) ( not ( = ?auto_217146 ?auto_217148 ) ) ( not ( = ?auto_217146 ?auto_217149 ) ) ( not ( = ?auto_217146 ?auto_217150 ) ) ( not ( = ?auto_217146 ?auto_217151 ) ) ( not ( = ?auto_217146 ?auto_217152 ) ) ( not ( = ?auto_217147 ?auto_217148 ) ) ( not ( = ?auto_217147 ?auto_217149 ) ) ( not ( = ?auto_217147 ?auto_217150 ) ) ( not ( = ?auto_217147 ?auto_217151 ) ) ( not ( = ?auto_217147 ?auto_217152 ) ) ( not ( = ?auto_217148 ?auto_217149 ) ) ( not ( = ?auto_217148 ?auto_217150 ) ) ( not ( = ?auto_217148 ?auto_217151 ) ) ( not ( = ?auto_217148 ?auto_217152 ) ) ( not ( = ?auto_217149 ?auto_217150 ) ) ( not ( = ?auto_217149 ?auto_217151 ) ) ( not ( = ?auto_217149 ?auto_217152 ) ) ( not ( = ?auto_217150 ?auto_217151 ) ) ( not ( = ?auto_217150 ?auto_217152 ) ) ( not ( = ?auto_217151 ?auto_217152 ) ) ( ON-TABLE ?auto_217152 ) ( ON ?auto_217151 ?auto_217152 ) ( ON ?auto_217150 ?auto_217151 ) ( ON ?auto_217149 ?auto_217150 ) ( ON ?auto_217148 ?auto_217149 ) ( ON ?auto_217147 ?auto_217148 ) ( CLEAR ?auto_217147 ) ( HOLDING ?auto_217146 ) ( CLEAR ?auto_217145 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_217145 ?auto_217146 )
      ( MAKE-8PILE ?auto_217145 ?auto_217146 ?auto_217147 ?auto_217148 ?auto_217149 ?auto_217150 ?auto_217151 ?auto_217152 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217153 - BLOCK
      ?auto_217154 - BLOCK
      ?auto_217155 - BLOCK
      ?auto_217156 - BLOCK
      ?auto_217157 - BLOCK
      ?auto_217158 - BLOCK
      ?auto_217159 - BLOCK
      ?auto_217160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_217153 ) ( not ( = ?auto_217153 ?auto_217154 ) ) ( not ( = ?auto_217153 ?auto_217155 ) ) ( not ( = ?auto_217153 ?auto_217156 ) ) ( not ( = ?auto_217153 ?auto_217157 ) ) ( not ( = ?auto_217153 ?auto_217158 ) ) ( not ( = ?auto_217153 ?auto_217159 ) ) ( not ( = ?auto_217153 ?auto_217160 ) ) ( not ( = ?auto_217154 ?auto_217155 ) ) ( not ( = ?auto_217154 ?auto_217156 ) ) ( not ( = ?auto_217154 ?auto_217157 ) ) ( not ( = ?auto_217154 ?auto_217158 ) ) ( not ( = ?auto_217154 ?auto_217159 ) ) ( not ( = ?auto_217154 ?auto_217160 ) ) ( not ( = ?auto_217155 ?auto_217156 ) ) ( not ( = ?auto_217155 ?auto_217157 ) ) ( not ( = ?auto_217155 ?auto_217158 ) ) ( not ( = ?auto_217155 ?auto_217159 ) ) ( not ( = ?auto_217155 ?auto_217160 ) ) ( not ( = ?auto_217156 ?auto_217157 ) ) ( not ( = ?auto_217156 ?auto_217158 ) ) ( not ( = ?auto_217156 ?auto_217159 ) ) ( not ( = ?auto_217156 ?auto_217160 ) ) ( not ( = ?auto_217157 ?auto_217158 ) ) ( not ( = ?auto_217157 ?auto_217159 ) ) ( not ( = ?auto_217157 ?auto_217160 ) ) ( not ( = ?auto_217158 ?auto_217159 ) ) ( not ( = ?auto_217158 ?auto_217160 ) ) ( not ( = ?auto_217159 ?auto_217160 ) ) ( ON-TABLE ?auto_217160 ) ( ON ?auto_217159 ?auto_217160 ) ( ON ?auto_217158 ?auto_217159 ) ( ON ?auto_217157 ?auto_217158 ) ( ON ?auto_217156 ?auto_217157 ) ( ON ?auto_217155 ?auto_217156 ) ( CLEAR ?auto_217153 ) ( ON ?auto_217154 ?auto_217155 ) ( CLEAR ?auto_217154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_217160 ?auto_217159 ?auto_217158 ?auto_217157 ?auto_217156 ?auto_217155 )
      ( MAKE-8PILE ?auto_217153 ?auto_217154 ?auto_217155 ?auto_217156 ?auto_217157 ?auto_217158 ?auto_217159 ?auto_217160 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217161 - BLOCK
      ?auto_217162 - BLOCK
      ?auto_217163 - BLOCK
      ?auto_217164 - BLOCK
      ?auto_217165 - BLOCK
      ?auto_217166 - BLOCK
      ?auto_217167 - BLOCK
      ?auto_217168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217161 ?auto_217162 ) ) ( not ( = ?auto_217161 ?auto_217163 ) ) ( not ( = ?auto_217161 ?auto_217164 ) ) ( not ( = ?auto_217161 ?auto_217165 ) ) ( not ( = ?auto_217161 ?auto_217166 ) ) ( not ( = ?auto_217161 ?auto_217167 ) ) ( not ( = ?auto_217161 ?auto_217168 ) ) ( not ( = ?auto_217162 ?auto_217163 ) ) ( not ( = ?auto_217162 ?auto_217164 ) ) ( not ( = ?auto_217162 ?auto_217165 ) ) ( not ( = ?auto_217162 ?auto_217166 ) ) ( not ( = ?auto_217162 ?auto_217167 ) ) ( not ( = ?auto_217162 ?auto_217168 ) ) ( not ( = ?auto_217163 ?auto_217164 ) ) ( not ( = ?auto_217163 ?auto_217165 ) ) ( not ( = ?auto_217163 ?auto_217166 ) ) ( not ( = ?auto_217163 ?auto_217167 ) ) ( not ( = ?auto_217163 ?auto_217168 ) ) ( not ( = ?auto_217164 ?auto_217165 ) ) ( not ( = ?auto_217164 ?auto_217166 ) ) ( not ( = ?auto_217164 ?auto_217167 ) ) ( not ( = ?auto_217164 ?auto_217168 ) ) ( not ( = ?auto_217165 ?auto_217166 ) ) ( not ( = ?auto_217165 ?auto_217167 ) ) ( not ( = ?auto_217165 ?auto_217168 ) ) ( not ( = ?auto_217166 ?auto_217167 ) ) ( not ( = ?auto_217166 ?auto_217168 ) ) ( not ( = ?auto_217167 ?auto_217168 ) ) ( ON-TABLE ?auto_217168 ) ( ON ?auto_217167 ?auto_217168 ) ( ON ?auto_217166 ?auto_217167 ) ( ON ?auto_217165 ?auto_217166 ) ( ON ?auto_217164 ?auto_217165 ) ( ON ?auto_217163 ?auto_217164 ) ( ON ?auto_217162 ?auto_217163 ) ( CLEAR ?auto_217162 ) ( HOLDING ?auto_217161 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_217161 )
      ( MAKE-8PILE ?auto_217161 ?auto_217162 ?auto_217163 ?auto_217164 ?auto_217165 ?auto_217166 ?auto_217167 ?auto_217168 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217169 - BLOCK
      ?auto_217170 - BLOCK
      ?auto_217171 - BLOCK
      ?auto_217172 - BLOCK
      ?auto_217173 - BLOCK
      ?auto_217174 - BLOCK
      ?auto_217175 - BLOCK
      ?auto_217176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217169 ?auto_217170 ) ) ( not ( = ?auto_217169 ?auto_217171 ) ) ( not ( = ?auto_217169 ?auto_217172 ) ) ( not ( = ?auto_217169 ?auto_217173 ) ) ( not ( = ?auto_217169 ?auto_217174 ) ) ( not ( = ?auto_217169 ?auto_217175 ) ) ( not ( = ?auto_217169 ?auto_217176 ) ) ( not ( = ?auto_217170 ?auto_217171 ) ) ( not ( = ?auto_217170 ?auto_217172 ) ) ( not ( = ?auto_217170 ?auto_217173 ) ) ( not ( = ?auto_217170 ?auto_217174 ) ) ( not ( = ?auto_217170 ?auto_217175 ) ) ( not ( = ?auto_217170 ?auto_217176 ) ) ( not ( = ?auto_217171 ?auto_217172 ) ) ( not ( = ?auto_217171 ?auto_217173 ) ) ( not ( = ?auto_217171 ?auto_217174 ) ) ( not ( = ?auto_217171 ?auto_217175 ) ) ( not ( = ?auto_217171 ?auto_217176 ) ) ( not ( = ?auto_217172 ?auto_217173 ) ) ( not ( = ?auto_217172 ?auto_217174 ) ) ( not ( = ?auto_217172 ?auto_217175 ) ) ( not ( = ?auto_217172 ?auto_217176 ) ) ( not ( = ?auto_217173 ?auto_217174 ) ) ( not ( = ?auto_217173 ?auto_217175 ) ) ( not ( = ?auto_217173 ?auto_217176 ) ) ( not ( = ?auto_217174 ?auto_217175 ) ) ( not ( = ?auto_217174 ?auto_217176 ) ) ( not ( = ?auto_217175 ?auto_217176 ) ) ( ON-TABLE ?auto_217176 ) ( ON ?auto_217175 ?auto_217176 ) ( ON ?auto_217174 ?auto_217175 ) ( ON ?auto_217173 ?auto_217174 ) ( ON ?auto_217172 ?auto_217173 ) ( ON ?auto_217171 ?auto_217172 ) ( ON ?auto_217170 ?auto_217171 ) ( ON ?auto_217169 ?auto_217170 ) ( CLEAR ?auto_217169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_217176 ?auto_217175 ?auto_217174 ?auto_217173 ?auto_217172 ?auto_217171 ?auto_217170 )
      ( MAKE-8PILE ?auto_217169 ?auto_217170 ?auto_217171 ?auto_217172 ?auto_217173 ?auto_217174 ?auto_217175 ?auto_217176 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217177 - BLOCK
      ?auto_217178 - BLOCK
      ?auto_217179 - BLOCK
      ?auto_217180 - BLOCK
      ?auto_217181 - BLOCK
      ?auto_217182 - BLOCK
      ?auto_217183 - BLOCK
      ?auto_217184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217177 ?auto_217178 ) ) ( not ( = ?auto_217177 ?auto_217179 ) ) ( not ( = ?auto_217177 ?auto_217180 ) ) ( not ( = ?auto_217177 ?auto_217181 ) ) ( not ( = ?auto_217177 ?auto_217182 ) ) ( not ( = ?auto_217177 ?auto_217183 ) ) ( not ( = ?auto_217177 ?auto_217184 ) ) ( not ( = ?auto_217178 ?auto_217179 ) ) ( not ( = ?auto_217178 ?auto_217180 ) ) ( not ( = ?auto_217178 ?auto_217181 ) ) ( not ( = ?auto_217178 ?auto_217182 ) ) ( not ( = ?auto_217178 ?auto_217183 ) ) ( not ( = ?auto_217178 ?auto_217184 ) ) ( not ( = ?auto_217179 ?auto_217180 ) ) ( not ( = ?auto_217179 ?auto_217181 ) ) ( not ( = ?auto_217179 ?auto_217182 ) ) ( not ( = ?auto_217179 ?auto_217183 ) ) ( not ( = ?auto_217179 ?auto_217184 ) ) ( not ( = ?auto_217180 ?auto_217181 ) ) ( not ( = ?auto_217180 ?auto_217182 ) ) ( not ( = ?auto_217180 ?auto_217183 ) ) ( not ( = ?auto_217180 ?auto_217184 ) ) ( not ( = ?auto_217181 ?auto_217182 ) ) ( not ( = ?auto_217181 ?auto_217183 ) ) ( not ( = ?auto_217181 ?auto_217184 ) ) ( not ( = ?auto_217182 ?auto_217183 ) ) ( not ( = ?auto_217182 ?auto_217184 ) ) ( not ( = ?auto_217183 ?auto_217184 ) ) ( ON-TABLE ?auto_217184 ) ( ON ?auto_217183 ?auto_217184 ) ( ON ?auto_217182 ?auto_217183 ) ( ON ?auto_217181 ?auto_217182 ) ( ON ?auto_217180 ?auto_217181 ) ( ON ?auto_217179 ?auto_217180 ) ( ON ?auto_217178 ?auto_217179 ) ( HOLDING ?auto_217177 ) ( CLEAR ?auto_217178 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_217184 ?auto_217183 ?auto_217182 ?auto_217181 ?auto_217180 ?auto_217179 ?auto_217178 ?auto_217177 )
      ( MAKE-8PILE ?auto_217177 ?auto_217178 ?auto_217179 ?auto_217180 ?auto_217181 ?auto_217182 ?auto_217183 ?auto_217184 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217185 - BLOCK
      ?auto_217186 - BLOCK
      ?auto_217187 - BLOCK
      ?auto_217188 - BLOCK
      ?auto_217189 - BLOCK
      ?auto_217190 - BLOCK
      ?auto_217191 - BLOCK
      ?auto_217192 - BLOCK
    )
    :vars
    (
      ?auto_217193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217185 ?auto_217186 ) ) ( not ( = ?auto_217185 ?auto_217187 ) ) ( not ( = ?auto_217185 ?auto_217188 ) ) ( not ( = ?auto_217185 ?auto_217189 ) ) ( not ( = ?auto_217185 ?auto_217190 ) ) ( not ( = ?auto_217185 ?auto_217191 ) ) ( not ( = ?auto_217185 ?auto_217192 ) ) ( not ( = ?auto_217186 ?auto_217187 ) ) ( not ( = ?auto_217186 ?auto_217188 ) ) ( not ( = ?auto_217186 ?auto_217189 ) ) ( not ( = ?auto_217186 ?auto_217190 ) ) ( not ( = ?auto_217186 ?auto_217191 ) ) ( not ( = ?auto_217186 ?auto_217192 ) ) ( not ( = ?auto_217187 ?auto_217188 ) ) ( not ( = ?auto_217187 ?auto_217189 ) ) ( not ( = ?auto_217187 ?auto_217190 ) ) ( not ( = ?auto_217187 ?auto_217191 ) ) ( not ( = ?auto_217187 ?auto_217192 ) ) ( not ( = ?auto_217188 ?auto_217189 ) ) ( not ( = ?auto_217188 ?auto_217190 ) ) ( not ( = ?auto_217188 ?auto_217191 ) ) ( not ( = ?auto_217188 ?auto_217192 ) ) ( not ( = ?auto_217189 ?auto_217190 ) ) ( not ( = ?auto_217189 ?auto_217191 ) ) ( not ( = ?auto_217189 ?auto_217192 ) ) ( not ( = ?auto_217190 ?auto_217191 ) ) ( not ( = ?auto_217190 ?auto_217192 ) ) ( not ( = ?auto_217191 ?auto_217192 ) ) ( ON-TABLE ?auto_217192 ) ( ON ?auto_217191 ?auto_217192 ) ( ON ?auto_217190 ?auto_217191 ) ( ON ?auto_217189 ?auto_217190 ) ( ON ?auto_217188 ?auto_217189 ) ( ON ?auto_217187 ?auto_217188 ) ( ON ?auto_217186 ?auto_217187 ) ( CLEAR ?auto_217186 ) ( ON ?auto_217185 ?auto_217193 ) ( CLEAR ?auto_217185 ) ( HAND-EMPTY ) ( not ( = ?auto_217185 ?auto_217193 ) ) ( not ( = ?auto_217186 ?auto_217193 ) ) ( not ( = ?auto_217187 ?auto_217193 ) ) ( not ( = ?auto_217188 ?auto_217193 ) ) ( not ( = ?auto_217189 ?auto_217193 ) ) ( not ( = ?auto_217190 ?auto_217193 ) ) ( not ( = ?auto_217191 ?auto_217193 ) ) ( not ( = ?auto_217192 ?auto_217193 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_217185 ?auto_217193 )
      ( MAKE-8PILE ?auto_217185 ?auto_217186 ?auto_217187 ?auto_217188 ?auto_217189 ?auto_217190 ?auto_217191 ?auto_217192 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217194 - BLOCK
      ?auto_217195 - BLOCK
      ?auto_217196 - BLOCK
      ?auto_217197 - BLOCK
      ?auto_217198 - BLOCK
      ?auto_217199 - BLOCK
      ?auto_217200 - BLOCK
      ?auto_217201 - BLOCK
    )
    :vars
    (
      ?auto_217202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217194 ?auto_217195 ) ) ( not ( = ?auto_217194 ?auto_217196 ) ) ( not ( = ?auto_217194 ?auto_217197 ) ) ( not ( = ?auto_217194 ?auto_217198 ) ) ( not ( = ?auto_217194 ?auto_217199 ) ) ( not ( = ?auto_217194 ?auto_217200 ) ) ( not ( = ?auto_217194 ?auto_217201 ) ) ( not ( = ?auto_217195 ?auto_217196 ) ) ( not ( = ?auto_217195 ?auto_217197 ) ) ( not ( = ?auto_217195 ?auto_217198 ) ) ( not ( = ?auto_217195 ?auto_217199 ) ) ( not ( = ?auto_217195 ?auto_217200 ) ) ( not ( = ?auto_217195 ?auto_217201 ) ) ( not ( = ?auto_217196 ?auto_217197 ) ) ( not ( = ?auto_217196 ?auto_217198 ) ) ( not ( = ?auto_217196 ?auto_217199 ) ) ( not ( = ?auto_217196 ?auto_217200 ) ) ( not ( = ?auto_217196 ?auto_217201 ) ) ( not ( = ?auto_217197 ?auto_217198 ) ) ( not ( = ?auto_217197 ?auto_217199 ) ) ( not ( = ?auto_217197 ?auto_217200 ) ) ( not ( = ?auto_217197 ?auto_217201 ) ) ( not ( = ?auto_217198 ?auto_217199 ) ) ( not ( = ?auto_217198 ?auto_217200 ) ) ( not ( = ?auto_217198 ?auto_217201 ) ) ( not ( = ?auto_217199 ?auto_217200 ) ) ( not ( = ?auto_217199 ?auto_217201 ) ) ( not ( = ?auto_217200 ?auto_217201 ) ) ( ON-TABLE ?auto_217201 ) ( ON ?auto_217200 ?auto_217201 ) ( ON ?auto_217199 ?auto_217200 ) ( ON ?auto_217198 ?auto_217199 ) ( ON ?auto_217197 ?auto_217198 ) ( ON ?auto_217196 ?auto_217197 ) ( ON ?auto_217194 ?auto_217202 ) ( CLEAR ?auto_217194 ) ( not ( = ?auto_217194 ?auto_217202 ) ) ( not ( = ?auto_217195 ?auto_217202 ) ) ( not ( = ?auto_217196 ?auto_217202 ) ) ( not ( = ?auto_217197 ?auto_217202 ) ) ( not ( = ?auto_217198 ?auto_217202 ) ) ( not ( = ?auto_217199 ?auto_217202 ) ) ( not ( = ?auto_217200 ?auto_217202 ) ) ( not ( = ?auto_217201 ?auto_217202 ) ) ( HOLDING ?auto_217195 ) ( CLEAR ?auto_217196 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_217201 ?auto_217200 ?auto_217199 ?auto_217198 ?auto_217197 ?auto_217196 ?auto_217195 )
      ( MAKE-8PILE ?auto_217194 ?auto_217195 ?auto_217196 ?auto_217197 ?auto_217198 ?auto_217199 ?auto_217200 ?auto_217201 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217203 - BLOCK
      ?auto_217204 - BLOCK
      ?auto_217205 - BLOCK
      ?auto_217206 - BLOCK
      ?auto_217207 - BLOCK
      ?auto_217208 - BLOCK
      ?auto_217209 - BLOCK
      ?auto_217210 - BLOCK
    )
    :vars
    (
      ?auto_217211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217203 ?auto_217204 ) ) ( not ( = ?auto_217203 ?auto_217205 ) ) ( not ( = ?auto_217203 ?auto_217206 ) ) ( not ( = ?auto_217203 ?auto_217207 ) ) ( not ( = ?auto_217203 ?auto_217208 ) ) ( not ( = ?auto_217203 ?auto_217209 ) ) ( not ( = ?auto_217203 ?auto_217210 ) ) ( not ( = ?auto_217204 ?auto_217205 ) ) ( not ( = ?auto_217204 ?auto_217206 ) ) ( not ( = ?auto_217204 ?auto_217207 ) ) ( not ( = ?auto_217204 ?auto_217208 ) ) ( not ( = ?auto_217204 ?auto_217209 ) ) ( not ( = ?auto_217204 ?auto_217210 ) ) ( not ( = ?auto_217205 ?auto_217206 ) ) ( not ( = ?auto_217205 ?auto_217207 ) ) ( not ( = ?auto_217205 ?auto_217208 ) ) ( not ( = ?auto_217205 ?auto_217209 ) ) ( not ( = ?auto_217205 ?auto_217210 ) ) ( not ( = ?auto_217206 ?auto_217207 ) ) ( not ( = ?auto_217206 ?auto_217208 ) ) ( not ( = ?auto_217206 ?auto_217209 ) ) ( not ( = ?auto_217206 ?auto_217210 ) ) ( not ( = ?auto_217207 ?auto_217208 ) ) ( not ( = ?auto_217207 ?auto_217209 ) ) ( not ( = ?auto_217207 ?auto_217210 ) ) ( not ( = ?auto_217208 ?auto_217209 ) ) ( not ( = ?auto_217208 ?auto_217210 ) ) ( not ( = ?auto_217209 ?auto_217210 ) ) ( ON-TABLE ?auto_217210 ) ( ON ?auto_217209 ?auto_217210 ) ( ON ?auto_217208 ?auto_217209 ) ( ON ?auto_217207 ?auto_217208 ) ( ON ?auto_217206 ?auto_217207 ) ( ON ?auto_217205 ?auto_217206 ) ( ON ?auto_217203 ?auto_217211 ) ( not ( = ?auto_217203 ?auto_217211 ) ) ( not ( = ?auto_217204 ?auto_217211 ) ) ( not ( = ?auto_217205 ?auto_217211 ) ) ( not ( = ?auto_217206 ?auto_217211 ) ) ( not ( = ?auto_217207 ?auto_217211 ) ) ( not ( = ?auto_217208 ?auto_217211 ) ) ( not ( = ?auto_217209 ?auto_217211 ) ) ( not ( = ?auto_217210 ?auto_217211 ) ) ( CLEAR ?auto_217205 ) ( ON ?auto_217204 ?auto_217203 ) ( CLEAR ?auto_217204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_217211 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_217211 ?auto_217203 )
      ( MAKE-8PILE ?auto_217203 ?auto_217204 ?auto_217205 ?auto_217206 ?auto_217207 ?auto_217208 ?auto_217209 ?auto_217210 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217212 - BLOCK
      ?auto_217213 - BLOCK
      ?auto_217214 - BLOCK
      ?auto_217215 - BLOCK
      ?auto_217216 - BLOCK
      ?auto_217217 - BLOCK
      ?auto_217218 - BLOCK
      ?auto_217219 - BLOCK
    )
    :vars
    (
      ?auto_217220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217212 ?auto_217213 ) ) ( not ( = ?auto_217212 ?auto_217214 ) ) ( not ( = ?auto_217212 ?auto_217215 ) ) ( not ( = ?auto_217212 ?auto_217216 ) ) ( not ( = ?auto_217212 ?auto_217217 ) ) ( not ( = ?auto_217212 ?auto_217218 ) ) ( not ( = ?auto_217212 ?auto_217219 ) ) ( not ( = ?auto_217213 ?auto_217214 ) ) ( not ( = ?auto_217213 ?auto_217215 ) ) ( not ( = ?auto_217213 ?auto_217216 ) ) ( not ( = ?auto_217213 ?auto_217217 ) ) ( not ( = ?auto_217213 ?auto_217218 ) ) ( not ( = ?auto_217213 ?auto_217219 ) ) ( not ( = ?auto_217214 ?auto_217215 ) ) ( not ( = ?auto_217214 ?auto_217216 ) ) ( not ( = ?auto_217214 ?auto_217217 ) ) ( not ( = ?auto_217214 ?auto_217218 ) ) ( not ( = ?auto_217214 ?auto_217219 ) ) ( not ( = ?auto_217215 ?auto_217216 ) ) ( not ( = ?auto_217215 ?auto_217217 ) ) ( not ( = ?auto_217215 ?auto_217218 ) ) ( not ( = ?auto_217215 ?auto_217219 ) ) ( not ( = ?auto_217216 ?auto_217217 ) ) ( not ( = ?auto_217216 ?auto_217218 ) ) ( not ( = ?auto_217216 ?auto_217219 ) ) ( not ( = ?auto_217217 ?auto_217218 ) ) ( not ( = ?auto_217217 ?auto_217219 ) ) ( not ( = ?auto_217218 ?auto_217219 ) ) ( ON-TABLE ?auto_217219 ) ( ON ?auto_217218 ?auto_217219 ) ( ON ?auto_217217 ?auto_217218 ) ( ON ?auto_217216 ?auto_217217 ) ( ON ?auto_217215 ?auto_217216 ) ( ON ?auto_217212 ?auto_217220 ) ( not ( = ?auto_217212 ?auto_217220 ) ) ( not ( = ?auto_217213 ?auto_217220 ) ) ( not ( = ?auto_217214 ?auto_217220 ) ) ( not ( = ?auto_217215 ?auto_217220 ) ) ( not ( = ?auto_217216 ?auto_217220 ) ) ( not ( = ?auto_217217 ?auto_217220 ) ) ( not ( = ?auto_217218 ?auto_217220 ) ) ( not ( = ?auto_217219 ?auto_217220 ) ) ( ON ?auto_217213 ?auto_217212 ) ( CLEAR ?auto_217213 ) ( ON-TABLE ?auto_217220 ) ( HOLDING ?auto_217214 ) ( CLEAR ?auto_217215 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_217219 ?auto_217218 ?auto_217217 ?auto_217216 ?auto_217215 ?auto_217214 )
      ( MAKE-8PILE ?auto_217212 ?auto_217213 ?auto_217214 ?auto_217215 ?auto_217216 ?auto_217217 ?auto_217218 ?auto_217219 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217221 - BLOCK
      ?auto_217222 - BLOCK
      ?auto_217223 - BLOCK
      ?auto_217224 - BLOCK
      ?auto_217225 - BLOCK
      ?auto_217226 - BLOCK
      ?auto_217227 - BLOCK
      ?auto_217228 - BLOCK
    )
    :vars
    (
      ?auto_217229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217221 ?auto_217222 ) ) ( not ( = ?auto_217221 ?auto_217223 ) ) ( not ( = ?auto_217221 ?auto_217224 ) ) ( not ( = ?auto_217221 ?auto_217225 ) ) ( not ( = ?auto_217221 ?auto_217226 ) ) ( not ( = ?auto_217221 ?auto_217227 ) ) ( not ( = ?auto_217221 ?auto_217228 ) ) ( not ( = ?auto_217222 ?auto_217223 ) ) ( not ( = ?auto_217222 ?auto_217224 ) ) ( not ( = ?auto_217222 ?auto_217225 ) ) ( not ( = ?auto_217222 ?auto_217226 ) ) ( not ( = ?auto_217222 ?auto_217227 ) ) ( not ( = ?auto_217222 ?auto_217228 ) ) ( not ( = ?auto_217223 ?auto_217224 ) ) ( not ( = ?auto_217223 ?auto_217225 ) ) ( not ( = ?auto_217223 ?auto_217226 ) ) ( not ( = ?auto_217223 ?auto_217227 ) ) ( not ( = ?auto_217223 ?auto_217228 ) ) ( not ( = ?auto_217224 ?auto_217225 ) ) ( not ( = ?auto_217224 ?auto_217226 ) ) ( not ( = ?auto_217224 ?auto_217227 ) ) ( not ( = ?auto_217224 ?auto_217228 ) ) ( not ( = ?auto_217225 ?auto_217226 ) ) ( not ( = ?auto_217225 ?auto_217227 ) ) ( not ( = ?auto_217225 ?auto_217228 ) ) ( not ( = ?auto_217226 ?auto_217227 ) ) ( not ( = ?auto_217226 ?auto_217228 ) ) ( not ( = ?auto_217227 ?auto_217228 ) ) ( ON-TABLE ?auto_217228 ) ( ON ?auto_217227 ?auto_217228 ) ( ON ?auto_217226 ?auto_217227 ) ( ON ?auto_217225 ?auto_217226 ) ( ON ?auto_217224 ?auto_217225 ) ( ON ?auto_217221 ?auto_217229 ) ( not ( = ?auto_217221 ?auto_217229 ) ) ( not ( = ?auto_217222 ?auto_217229 ) ) ( not ( = ?auto_217223 ?auto_217229 ) ) ( not ( = ?auto_217224 ?auto_217229 ) ) ( not ( = ?auto_217225 ?auto_217229 ) ) ( not ( = ?auto_217226 ?auto_217229 ) ) ( not ( = ?auto_217227 ?auto_217229 ) ) ( not ( = ?auto_217228 ?auto_217229 ) ) ( ON ?auto_217222 ?auto_217221 ) ( ON-TABLE ?auto_217229 ) ( CLEAR ?auto_217224 ) ( ON ?auto_217223 ?auto_217222 ) ( CLEAR ?auto_217223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_217229 ?auto_217221 ?auto_217222 )
      ( MAKE-8PILE ?auto_217221 ?auto_217222 ?auto_217223 ?auto_217224 ?auto_217225 ?auto_217226 ?auto_217227 ?auto_217228 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217230 - BLOCK
      ?auto_217231 - BLOCK
      ?auto_217232 - BLOCK
      ?auto_217233 - BLOCK
      ?auto_217234 - BLOCK
      ?auto_217235 - BLOCK
      ?auto_217236 - BLOCK
      ?auto_217237 - BLOCK
    )
    :vars
    (
      ?auto_217238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217230 ?auto_217231 ) ) ( not ( = ?auto_217230 ?auto_217232 ) ) ( not ( = ?auto_217230 ?auto_217233 ) ) ( not ( = ?auto_217230 ?auto_217234 ) ) ( not ( = ?auto_217230 ?auto_217235 ) ) ( not ( = ?auto_217230 ?auto_217236 ) ) ( not ( = ?auto_217230 ?auto_217237 ) ) ( not ( = ?auto_217231 ?auto_217232 ) ) ( not ( = ?auto_217231 ?auto_217233 ) ) ( not ( = ?auto_217231 ?auto_217234 ) ) ( not ( = ?auto_217231 ?auto_217235 ) ) ( not ( = ?auto_217231 ?auto_217236 ) ) ( not ( = ?auto_217231 ?auto_217237 ) ) ( not ( = ?auto_217232 ?auto_217233 ) ) ( not ( = ?auto_217232 ?auto_217234 ) ) ( not ( = ?auto_217232 ?auto_217235 ) ) ( not ( = ?auto_217232 ?auto_217236 ) ) ( not ( = ?auto_217232 ?auto_217237 ) ) ( not ( = ?auto_217233 ?auto_217234 ) ) ( not ( = ?auto_217233 ?auto_217235 ) ) ( not ( = ?auto_217233 ?auto_217236 ) ) ( not ( = ?auto_217233 ?auto_217237 ) ) ( not ( = ?auto_217234 ?auto_217235 ) ) ( not ( = ?auto_217234 ?auto_217236 ) ) ( not ( = ?auto_217234 ?auto_217237 ) ) ( not ( = ?auto_217235 ?auto_217236 ) ) ( not ( = ?auto_217235 ?auto_217237 ) ) ( not ( = ?auto_217236 ?auto_217237 ) ) ( ON-TABLE ?auto_217237 ) ( ON ?auto_217236 ?auto_217237 ) ( ON ?auto_217235 ?auto_217236 ) ( ON ?auto_217234 ?auto_217235 ) ( ON ?auto_217230 ?auto_217238 ) ( not ( = ?auto_217230 ?auto_217238 ) ) ( not ( = ?auto_217231 ?auto_217238 ) ) ( not ( = ?auto_217232 ?auto_217238 ) ) ( not ( = ?auto_217233 ?auto_217238 ) ) ( not ( = ?auto_217234 ?auto_217238 ) ) ( not ( = ?auto_217235 ?auto_217238 ) ) ( not ( = ?auto_217236 ?auto_217238 ) ) ( not ( = ?auto_217237 ?auto_217238 ) ) ( ON ?auto_217231 ?auto_217230 ) ( ON-TABLE ?auto_217238 ) ( ON ?auto_217232 ?auto_217231 ) ( CLEAR ?auto_217232 ) ( HOLDING ?auto_217233 ) ( CLEAR ?auto_217234 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_217237 ?auto_217236 ?auto_217235 ?auto_217234 ?auto_217233 )
      ( MAKE-8PILE ?auto_217230 ?auto_217231 ?auto_217232 ?auto_217233 ?auto_217234 ?auto_217235 ?auto_217236 ?auto_217237 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217239 - BLOCK
      ?auto_217240 - BLOCK
      ?auto_217241 - BLOCK
      ?auto_217242 - BLOCK
      ?auto_217243 - BLOCK
      ?auto_217244 - BLOCK
      ?auto_217245 - BLOCK
      ?auto_217246 - BLOCK
    )
    :vars
    (
      ?auto_217247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217239 ?auto_217240 ) ) ( not ( = ?auto_217239 ?auto_217241 ) ) ( not ( = ?auto_217239 ?auto_217242 ) ) ( not ( = ?auto_217239 ?auto_217243 ) ) ( not ( = ?auto_217239 ?auto_217244 ) ) ( not ( = ?auto_217239 ?auto_217245 ) ) ( not ( = ?auto_217239 ?auto_217246 ) ) ( not ( = ?auto_217240 ?auto_217241 ) ) ( not ( = ?auto_217240 ?auto_217242 ) ) ( not ( = ?auto_217240 ?auto_217243 ) ) ( not ( = ?auto_217240 ?auto_217244 ) ) ( not ( = ?auto_217240 ?auto_217245 ) ) ( not ( = ?auto_217240 ?auto_217246 ) ) ( not ( = ?auto_217241 ?auto_217242 ) ) ( not ( = ?auto_217241 ?auto_217243 ) ) ( not ( = ?auto_217241 ?auto_217244 ) ) ( not ( = ?auto_217241 ?auto_217245 ) ) ( not ( = ?auto_217241 ?auto_217246 ) ) ( not ( = ?auto_217242 ?auto_217243 ) ) ( not ( = ?auto_217242 ?auto_217244 ) ) ( not ( = ?auto_217242 ?auto_217245 ) ) ( not ( = ?auto_217242 ?auto_217246 ) ) ( not ( = ?auto_217243 ?auto_217244 ) ) ( not ( = ?auto_217243 ?auto_217245 ) ) ( not ( = ?auto_217243 ?auto_217246 ) ) ( not ( = ?auto_217244 ?auto_217245 ) ) ( not ( = ?auto_217244 ?auto_217246 ) ) ( not ( = ?auto_217245 ?auto_217246 ) ) ( ON-TABLE ?auto_217246 ) ( ON ?auto_217245 ?auto_217246 ) ( ON ?auto_217244 ?auto_217245 ) ( ON ?auto_217243 ?auto_217244 ) ( ON ?auto_217239 ?auto_217247 ) ( not ( = ?auto_217239 ?auto_217247 ) ) ( not ( = ?auto_217240 ?auto_217247 ) ) ( not ( = ?auto_217241 ?auto_217247 ) ) ( not ( = ?auto_217242 ?auto_217247 ) ) ( not ( = ?auto_217243 ?auto_217247 ) ) ( not ( = ?auto_217244 ?auto_217247 ) ) ( not ( = ?auto_217245 ?auto_217247 ) ) ( not ( = ?auto_217246 ?auto_217247 ) ) ( ON ?auto_217240 ?auto_217239 ) ( ON-TABLE ?auto_217247 ) ( ON ?auto_217241 ?auto_217240 ) ( CLEAR ?auto_217243 ) ( ON ?auto_217242 ?auto_217241 ) ( CLEAR ?auto_217242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_217247 ?auto_217239 ?auto_217240 ?auto_217241 )
      ( MAKE-8PILE ?auto_217239 ?auto_217240 ?auto_217241 ?auto_217242 ?auto_217243 ?auto_217244 ?auto_217245 ?auto_217246 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217248 - BLOCK
      ?auto_217249 - BLOCK
      ?auto_217250 - BLOCK
      ?auto_217251 - BLOCK
      ?auto_217252 - BLOCK
      ?auto_217253 - BLOCK
      ?auto_217254 - BLOCK
      ?auto_217255 - BLOCK
    )
    :vars
    (
      ?auto_217256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217248 ?auto_217249 ) ) ( not ( = ?auto_217248 ?auto_217250 ) ) ( not ( = ?auto_217248 ?auto_217251 ) ) ( not ( = ?auto_217248 ?auto_217252 ) ) ( not ( = ?auto_217248 ?auto_217253 ) ) ( not ( = ?auto_217248 ?auto_217254 ) ) ( not ( = ?auto_217248 ?auto_217255 ) ) ( not ( = ?auto_217249 ?auto_217250 ) ) ( not ( = ?auto_217249 ?auto_217251 ) ) ( not ( = ?auto_217249 ?auto_217252 ) ) ( not ( = ?auto_217249 ?auto_217253 ) ) ( not ( = ?auto_217249 ?auto_217254 ) ) ( not ( = ?auto_217249 ?auto_217255 ) ) ( not ( = ?auto_217250 ?auto_217251 ) ) ( not ( = ?auto_217250 ?auto_217252 ) ) ( not ( = ?auto_217250 ?auto_217253 ) ) ( not ( = ?auto_217250 ?auto_217254 ) ) ( not ( = ?auto_217250 ?auto_217255 ) ) ( not ( = ?auto_217251 ?auto_217252 ) ) ( not ( = ?auto_217251 ?auto_217253 ) ) ( not ( = ?auto_217251 ?auto_217254 ) ) ( not ( = ?auto_217251 ?auto_217255 ) ) ( not ( = ?auto_217252 ?auto_217253 ) ) ( not ( = ?auto_217252 ?auto_217254 ) ) ( not ( = ?auto_217252 ?auto_217255 ) ) ( not ( = ?auto_217253 ?auto_217254 ) ) ( not ( = ?auto_217253 ?auto_217255 ) ) ( not ( = ?auto_217254 ?auto_217255 ) ) ( ON-TABLE ?auto_217255 ) ( ON ?auto_217254 ?auto_217255 ) ( ON ?auto_217253 ?auto_217254 ) ( ON ?auto_217248 ?auto_217256 ) ( not ( = ?auto_217248 ?auto_217256 ) ) ( not ( = ?auto_217249 ?auto_217256 ) ) ( not ( = ?auto_217250 ?auto_217256 ) ) ( not ( = ?auto_217251 ?auto_217256 ) ) ( not ( = ?auto_217252 ?auto_217256 ) ) ( not ( = ?auto_217253 ?auto_217256 ) ) ( not ( = ?auto_217254 ?auto_217256 ) ) ( not ( = ?auto_217255 ?auto_217256 ) ) ( ON ?auto_217249 ?auto_217248 ) ( ON-TABLE ?auto_217256 ) ( ON ?auto_217250 ?auto_217249 ) ( ON ?auto_217251 ?auto_217250 ) ( CLEAR ?auto_217251 ) ( HOLDING ?auto_217252 ) ( CLEAR ?auto_217253 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_217255 ?auto_217254 ?auto_217253 ?auto_217252 )
      ( MAKE-8PILE ?auto_217248 ?auto_217249 ?auto_217250 ?auto_217251 ?auto_217252 ?auto_217253 ?auto_217254 ?auto_217255 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217257 - BLOCK
      ?auto_217258 - BLOCK
      ?auto_217259 - BLOCK
      ?auto_217260 - BLOCK
      ?auto_217261 - BLOCK
      ?auto_217262 - BLOCK
      ?auto_217263 - BLOCK
      ?auto_217264 - BLOCK
    )
    :vars
    (
      ?auto_217265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217257 ?auto_217258 ) ) ( not ( = ?auto_217257 ?auto_217259 ) ) ( not ( = ?auto_217257 ?auto_217260 ) ) ( not ( = ?auto_217257 ?auto_217261 ) ) ( not ( = ?auto_217257 ?auto_217262 ) ) ( not ( = ?auto_217257 ?auto_217263 ) ) ( not ( = ?auto_217257 ?auto_217264 ) ) ( not ( = ?auto_217258 ?auto_217259 ) ) ( not ( = ?auto_217258 ?auto_217260 ) ) ( not ( = ?auto_217258 ?auto_217261 ) ) ( not ( = ?auto_217258 ?auto_217262 ) ) ( not ( = ?auto_217258 ?auto_217263 ) ) ( not ( = ?auto_217258 ?auto_217264 ) ) ( not ( = ?auto_217259 ?auto_217260 ) ) ( not ( = ?auto_217259 ?auto_217261 ) ) ( not ( = ?auto_217259 ?auto_217262 ) ) ( not ( = ?auto_217259 ?auto_217263 ) ) ( not ( = ?auto_217259 ?auto_217264 ) ) ( not ( = ?auto_217260 ?auto_217261 ) ) ( not ( = ?auto_217260 ?auto_217262 ) ) ( not ( = ?auto_217260 ?auto_217263 ) ) ( not ( = ?auto_217260 ?auto_217264 ) ) ( not ( = ?auto_217261 ?auto_217262 ) ) ( not ( = ?auto_217261 ?auto_217263 ) ) ( not ( = ?auto_217261 ?auto_217264 ) ) ( not ( = ?auto_217262 ?auto_217263 ) ) ( not ( = ?auto_217262 ?auto_217264 ) ) ( not ( = ?auto_217263 ?auto_217264 ) ) ( ON-TABLE ?auto_217264 ) ( ON ?auto_217263 ?auto_217264 ) ( ON ?auto_217262 ?auto_217263 ) ( ON ?auto_217257 ?auto_217265 ) ( not ( = ?auto_217257 ?auto_217265 ) ) ( not ( = ?auto_217258 ?auto_217265 ) ) ( not ( = ?auto_217259 ?auto_217265 ) ) ( not ( = ?auto_217260 ?auto_217265 ) ) ( not ( = ?auto_217261 ?auto_217265 ) ) ( not ( = ?auto_217262 ?auto_217265 ) ) ( not ( = ?auto_217263 ?auto_217265 ) ) ( not ( = ?auto_217264 ?auto_217265 ) ) ( ON ?auto_217258 ?auto_217257 ) ( ON-TABLE ?auto_217265 ) ( ON ?auto_217259 ?auto_217258 ) ( ON ?auto_217260 ?auto_217259 ) ( CLEAR ?auto_217262 ) ( ON ?auto_217261 ?auto_217260 ) ( CLEAR ?auto_217261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_217265 ?auto_217257 ?auto_217258 ?auto_217259 ?auto_217260 )
      ( MAKE-8PILE ?auto_217257 ?auto_217258 ?auto_217259 ?auto_217260 ?auto_217261 ?auto_217262 ?auto_217263 ?auto_217264 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217266 - BLOCK
      ?auto_217267 - BLOCK
      ?auto_217268 - BLOCK
      ?auto_217269 - BLOCK
      ?auto_217270 - BLOCK
      ?auto_217271 - BLOCK
      ?auto_217272 - BLOCK
      ?auto_217273 - BLOCK
    )
    :vars
    (
      ?auto_217274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217266 ?auto_217267 ) ) ( not ( = ?auto_217266 ?auto_217268 ) ) ( not ( = ?auto_217266 ?auto_217269 ) ) ( not ( = ?auto_217266 ?auto_217270 ) ) ( not ( = ?auto_217266 ?auto_217271 ) ) ( not ( = ?auto_217266 ?auto_217272 ) ) ( not ( = ?auto_217266 ?auto_217273 ) ) ( not ( = ?auto_217267 ?auto_217268 ) ) ( not ( = ?auto_217267 ?auto_217269 ) ) ( not ( = ?auto_217267 ?auto_217270 ) ) ( not ( = ?auto_217267 ?auto_217271 ) ) ( not ( = ?auto_217267 ?auto_217272 ) ) ( not ( = ?auto_217267 ?auto_217273 ) ) ( not ( = ?auto_217268 ?auto_217269 ) ) ( not ( = ?auto_217268 ?auto_217270 ) ) ( not ( = ?auto_217268 ?auto_217271 ) ) ( not ( = ?auto_217268 ?auto_217272 ) ) ( not ( = ?auto_217268 ?auto_217273 ) ) ( not ( = ?auto_217269 ?auto_217270 ) ) ( not ( = ?auto_217269 ?auto_217271 ) ) ( not ( = ?auto_217269 ?auto_217272 ) ) ( not ( = ?auto_217269 ?auto_217273 ) ) ( not ( = ?auto_217270 ?auto_217271 ) ) ( not ( = ?auto_217270 ?auto_217272 ) ) ( not ( = ?auto_217270 ?auto_217273 ) ) ( not ( = ?auto_217271 ?auto_217272 ) ) ( not ( = ?auto_217271 ?auto_217273 ) ) ( not ( = ?auto_217272 ?auto_217273 ) ) ( ON-TABLE ?auto_217273 ) ( ON ?auto_217272 ?auto_217273 ) ( ON ?auto_217266 ?auto_217274 ) ( not ( = ?auto_217266 ?auto_217274 ) ) ( not ( = ?auto_217267 ?auto_217274 ) ) ( not ( = ?auto_217268 ?auto_217274 ) ) ( not ( = ?auto_217269 ?auto_217274 ) ) ( not ( = ?auto_217270 ?auto_217274 ) ) ( not ( = ?auto_217271 ?auto_217274 ) ) ( not ( = ?auto_217272 ?auto_217274 ) ) ( not ( = ?auto_217273 ?auto_217274 ) ) ( ON ?auto_217267 ?auto_217266 ) ( ON-TABLE ?auto_217274 ) ( ON ?auto_217268 ?auto_217267 ) ( ON ?auto_217269 ?auto_217268 ) ( ON ?auto_217270 ?auto_217269 ) ( CLEAR ?auto_217270 ) ( HOLDING ?auto_217271 ) ( CLEAR ?auto_217272 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_217273 ?auto_217272 ?auto_217271 )
      ( MAKE-8PILE ?auto_217266 ?auto_217267 ?auto_217268 ?auto_217269 ?auto_217270 ?auto_217271 ?auto_217272 ?auto_217273 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217275 - BLOCK
      ?auto_217276 - BLOCK
      ?auto_217277 - BLOCK
      ?auto_217278 - BLOCK
      ?auto_217279 - BLOCK
      ?auto_217280 - BLOCK
      ?auto_217281 - BLOCK
      ?auto_217282 - BLOCK
    )
    :vars
    (
      ?auto_217283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217275 ?auto_217276 ) ) ( not ( = ?auto_217275 ?auto_217277 ) ) ( not ( = ?auto_217275 ?auto_217278 ) ) ( not ( = ?auto_217275 ?auto_217279 ) ) ( not ( = ?auto_217275 ?auto_217280 ) ) ( not ( = ?auto_217275 ?auto_217281 ) ) ( not ( = ?auto_217275 ?auto_217282 ) ) ( not ( = ?auto_217276 ?auto_217277 ) ) ( not ( = ?auto_217276 ?auto_217278 ) ) ( not ( = ?auto_217276 ?auto_217279 ) ) ( not ( = ?auto_217276 ?auto_217280 ) ) ( not ( = ?auto_217276 ?auto_217281 ) ) ( not ( = ?auto_217276 ?auto_217282 ) ) ( not ( = ?auto_217277 ?auto_217278 ) ) ( not ( = ?auto_217277 ?auto_217279 ) ) ( not ( = ?auto_217277 ?auto_217280 ) ) ( not ( = ?auto_217277 ?auto_217281 ) ) ( not ( = ?auto_217277 ?auto_217282 ) ) ( not ( = ?auto_217278 ?auto_217279 ) ) ( not ( = ?auto_217278 ?auto_217280 ) ) ( not ( = ?auto_217278 ?auto_217281 ) ) ( not ( = ?auto_217278 ?auto_217282 ) ) ( not ( = ?auto_217279 ?auto_217280 ) ) ( not ( = ?auto_217279 ?auto_217281 ) ) ( not ( = ?auto_217279 ?auto_217282 ) ) ( not ( = ?auto_217280 ?auto_217281 ) ) ( not ( = ?auto_217280 ?auto_217282 ) ) ( not ( = ?auto_217281 ?auto_217282 ) ) ( ON-TABLE ?auto_217282 ) ( ON ?auto_217281 ?auto_217282 ) ( ON ?auto_217275 ?auto_217283 ) ( not ( = ?auto_217275 ?auto_217283 ) ) ( not ( = ?auto_217276 ?auto_217283 ) ) ( not ( = ?auto_217277 ?auto_217283 ) ) ( not ( = ?auto_217278 ?auto_217283 ) ) ( not ( = ?auto_217279 ?auto_217283 ) ) ( not ( = ?auto_217280 ?auto_217283 ) ) ( not ( = ?auto_217281 ?auto_217283 ) ) ( not ( = ?auto_217282 ?auto_217283 ) ) ( ON ?auto_217276 ?auto_217275 ) ( ON-TABLE ?auto_217283 ) ( ON ?auto_217277 ?auto_217276 ) ( ON ?auto_217278 ?auto_217277 ) ( ON ?auto_217279 ?auto_217278 ) ( CLEAR ?auto_217281 ) ( ON ?auto_217280 ?auto_217279 ) ( CLEAR ?auto_217280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_217283 ?auto_217275 ?auto_217276 ?auto_217277 ?auto_217278 ?auto_217279 )
      ( MAKE-8PILE ?auto_217275 ?auto_217276 ?auto_217277 ?auto_217278 ?auto_217279 ?auto_217280 ?auto_217281 ?auto_217282 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217284 - BLOCK
      ?auto_217285 - BLOCK
      ?auto_217286 - BLOCK
      ?auto_217287 - BLOCK
      ?auto_217288 - BLOCK
      ?auto_217289 - BLOCK
      ?auto_217290 - BLOCK
      ?auto_217291 - BLOCK
    )
    :vars
    (
      ?auto_217292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217284 ?auto_217285 ) ) ( not ( = ?auto_217284 ?auto_217286 ) ) ( not ( = ?auto_217284 ?auto_217287 ) ) ( not ( = ?auto_217284 ?auto_217288 ) ) ( not ( = ?auto_217284 ?auto_217289 ) ) ( not ( = ?auto_217284 ?auto_217290 ) ) ( not ( = ?auto_217284 ?auto_217291 ) ) ( not ( = ?auto_217285 ?auto_217286 ) ) ( not ( = ?auto_217285 ?auto_217287 ) ) ( not ( = ?auto_217285 ?auto_217288 ) ) ( not ( = ?auto_217285 ?auto_217289 ) ) ( not ( = ?auto_217285 ?auto_217290 ) ) ( not ( = ?auto_217285 ?auto_217291 ) ) ( not ( = ?auto_217286 ?auto_217287 ) ) ( not ( = ?auto_217286 ?auto_217288 ) ) ( not ( = ?auto_217286 ?auto_217289 ) ) ( not ( = ?auto_217286 ?auto_217290 ) ) ( not ( = ?auto_217286 ?auto_217291 ) ) ( not ( = ?auto_217287 ?auto_217288 ) ) ( not ( = ?auto_217287 ?auto_217289 ) ) ( not ( = ?auto_217287 ?auto_217290 ) ) ( not ( = ?auto_217287 ?auto_217291 ) ) ( not ( = ?auto_217288 ?auto_217289 ) ) ( not ( = ?auto_217288 ?auto_217290 ) ) ( not ( = ?auto_217288 ?auto_217291 ) ) ( not ( = ?auto_217289 ?auto_217290 ) ) ( not ( = ?auto_217289 ?auto_217291 ) ) ( not ( = ?auto_217290 ?auto_217291 ) ) ( ON-TABLE ?auto_217291 ) ( ON ?auto_217284 ?auto_217292 ) ( not ( = ?auto_217284 ?auto_217292 ) ) ( not ( = ?auto_217285 ?auto_217292 ) ) ( not ( = ?auto_217286 ?auto_217292 ) ) ( not ( = ?auto_217287 ?auto_217292 ) ) ( not ( = ?auto_217288 ?auto_217292 ) ) ( not ( = ?auto_217289 ?auto_217292 ) ) ( not ( = ?auto_217290 ?auto_217292 ) ) ( not ( = ?auto_217291 ?auto_217292 ) ) ( ON ?auto_217285 ?auto_217284 ) ( ON-TABLE ?auto_217292 ) ( ON ?auto_217286 ?auto_217285 ) ( ON ?auto_217287 ?auto_217286 ) ( ON ?auto_217288 ?auto_217287 ) ( ON ?auto_217289 ?auto_217288 ) ( CLEAR ?auto_217289 ) ( HOLDING ?auto_217290 ) ( CLEAR ?auto_217291 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_217291 ?auto_217290 )
      ( MAKE-8PILE ?auto_217284 ?auto_217285 ?auto_217286 ?auto_217287 ?auto_217288 ?auto_217289 ?auto_217290 ?auto_217291 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217293 - BLOCK
      ?auto_217294 - BLOCK
      ?auto_217295 - BLOCK
      ?auto_217296 - BLOCK
      ?auto_217297 - BLOCK
      ?auto_217298 - BLOCK
      ?auto_217299 - BLOCK
      ?auto_217300 - BLOCK
    )
    :vars
    (
      ?auto_217301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217293 ?auto_217294 ) ) ( not ( = ?auto_217293 ?auto_217295 ) ) ( not ( = ?auto_217293 ?auto_217296 ) ) ( not ( = ?auto_217293 ?auto_217297 ) ) ( not ( = ?auto_217293 ?auto_217298 ) ) ( not ( = ?auto_217293 ?auto_217299 ) ) ( not ( = ?auto_217293 ?auto_217300 ) ) ( not ( = ?auto_217294 ?auto_217295 ) ) ( not ( = ?auto_217294 ?auto_217296 ) ) ( not ( = ?auto_217294 ?auto_217297 ) ) ( not ( = ?auto_217294 ?auto_217298 ) ) ( not ( = ?auto_217294 ?auto_217299 ) ) ( not ( = ?auto_217294 ?auto_217300 ) ) ( not ( = ?auto_217295 ?auto_217296 ) ) ( not ( = ?auto_217295 ?auto_217297 ) ) ( not ( = ?auto_217295 ?auto_217298 ) ) ( not ( = ?auto_217295 ?auto_217299 ) ) ( not ( = ?auto_217295 ?auto_217300 ) ) ( not ( = ?auto_217296 ?auto_217297 ) ) ( not ( = ?auto_217296 ?auto_217298 ) ) ( not ( = ?auto_217296 ?auto_217299 ) ) ( not ( = ?auto_217296 ?auto_217300 ) ) ( not ( = ?auto_217297 ?auto_217298 ) ) ( not ( = ?auto_217297 ?auto_217299 ) ) ( not ( = ?auto_217297 ?auto_217300 ) ) ( not ( = ?auto_217298 ?auto_217299 ) ) ( not ( = ?auto_217298 ?auto_217300 ) ) ( not ( = ?auto_217299 ?auto_217300 ) ) ( ON-TABLE ?auto_217300 ) ( ON ?auto_217293 ?auto_217301 ) ( not ( = ?auto_217293 ?auto_217301 ) ) ( not ( = ?auto_217294 ?auto_217301 ) ) ( not ( = ?auto_217295 ?auto_217301 ) ) ( not ( = ?auto_217296 ?auto_217301 ) ) ( not ( = ?auto_217297 ?auto_217301 ) ) ( not ( = ?auto_217298 ?auto_217301 ) ) ( not ( = ?auto_217299 ?auto_217301 ) ) ( not ( = ?auto_217300 ?auto_217301 ) ) ( ON ?auto_217294 ?auto_217293 ) ( ON-TABLE ?auto_217301 ) ( ON ?auto_217295 ?auto_217294 ) ( ON ?auto_217296 ?auto_217295 ) ( ON ?auto_217297 ?auto_217296 ) ( ON ?auto_217298 ?auto_217297 ) ( CLEAR ?auto_217300 ) ( ON ?auto_217299 ?auto_217298 ) ( CLEAR ?auto_217299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_217301 ?auto_217293 ?auto_217294 ?auto_217295 ?auto_217296 ?auto_217297 ?auto_217298 )
      ( MAKE-8PILE ?auto_217293 ?auto_217294 ?auto_217295 ?auto_217296 ?auto_217297 ?auto_217298 ?auto_217299 ?auto_217300 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217302 - BLOCK
      ?auto_217303 - BLOCK
      ?auto_217304 - BLOCK
      ?auto_217305 - BLOCK
      ?auto_217306 - BLOCK
      ?auto_217307 - BLOCK
      ?auto_217308 - BLOCK
      ?auto_217309 - BLOCK
    )
    :vars
    (
      ?auto_217310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217302 ?auto_217303 ) ) ( not ( = ?auto_217302 ?auto_217304 ) ) ( not ( = ?auto_217302 ?auto_217305 ) ) ( not ( = ?auto_217302 ?auto_217306 ) ) ( not ( = ?auto_217302 ?auto_217307 ) ) ( not ( = ?auto_217302 ?auto_217308 ) ) ( not ( = ?auto_217302 ?auto_217309 ) ) ( not ( = ?auto_217303 ?auto_217304 ) ) ( not ( = ?auto_217303 ?auto_217305 ) ) ( not ( = ?auto_217303 ?auto_217306 ) ) ( not ( = ?auto_217303 ?auto_217307 ) ) ( not ( = ?auto_217303 ?auto_217308 ) ) ( not ( = ?auto_217303 ?auto_217309 ) ) ( not ( = ?auto_217304 ?auto_217305 ) ) ( not ( = ?auto_217304 ?auto_217306 ) ) ( not ( = ?auto_217304 ?auto_217307 ) ) ( not ( = ?auto_217304 ?auto_217308 ) ) ( not ( = ?auto_217304 ?auto_217309 ) ) ( not ( = ?auto_217305 ?auto_217306 ) ) ( not ( = ?auto_217305 ?auto_217307 ) ) ( not ( = ?auto_217305 ?auto_217308 ) ) ( not ( = ?auto_217305 ?auto_217309 ) ) ( not ( = ?auto_217306 ?auto_217307 ) ) ( not ( = ?auto_217306 ?auto_217308 ) ) ( not ( = ?auto_217306 ?auto_217309 ) ) ( not ( = ?auto_217307 ?auto_217308 ) ) ( not ( = ?auto_217307 ?auto_217309 ) ) ( not ( = ?auto_217308 ?auto_217309 ) ) ( ON ?auto_217302 ?auto_217310 ) ( not ( = ?auto_217302 ?auto_217310 ) ) ( not ( = ?auto_217303 ?auto_217310 ) ) ( not ( = ?auto_217304 ?auto_217310 ) ) ( not ( = ?auto_217305 ?auto_217310 ) ) ( not ( = ?auto_217306 ?auto_217310 ) ) ( not ( = ?auto_217307 ?auto_217310 ) ) ( not ( = ?auto_217308 ?auto_217310 ) ) ( not ( = ?auto_217309 ?auto_217310 ) ) ( ON ?auto_217303 ?auto_217302 ) ( ON-TABLE ?auto_217310 ) ( ON ?auto_217304 ?auto_217303 ) ( ON ?auto_217305 ?auto_217304 ) ( ON ?auto_217306 ?auto_217305 ) ( ON ?auto_217307 ?auto_217306 ) ( ON ?auto_217308 ?auto_217307 ) ( CLEAR ?auto_217308 ) ( HOLDING ?auto_217309 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_217309 )
      ( MAKE-8PILE ?auto_217302 ?auto_217303 ?auto_217304 ?auto_217305 ?auto_217306 ?auto_217307 ?auto_217308 ?auto_217309 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_217311 - BLOCK
      ?auto_217312 - BLOCK
      ?auto_217313 - BLOCK
      ?auto_217314 - BLOCK
      ?auto_217315 - BLOCK
      ?auto_217316 - BLOCK
      ?auto_217317 - BLOCK
      ?auto_217318 - BLOCK
    )
    :vars
    (
      ?auto_217319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_217311 ?auto_217312 ) ) ( not ( = ?auto_217311 ?auto_217313 ) ) ( not ( = ?auto_217311 ?auto_217314 ) ) ( not ( = ?auto_217311 ?auto_217315 ) ) ( not ( = ?auto_217311 ?auto_217316 ) ) ( not ( = ?auto_217311 ?auto_217317 ) ) ( not ( = ?auto_217311 ?auto_217318 ) ) ( not ( = ?auto_217312 ?auto_217313 ) ) ( not ( = ?auto_217312 ?auto_217314 ) ) ( not ( = ?auto_217312 ?auto_217315 ) ) ( not ( = ?auto_217312 ?auto_217316 ) ) ( not ( = ?auto_217312 ?auto_217317 ) ) ( not ( = ?auto_217312 ?auto_217318 ) ) ( not ( = ?auto_217313 ?auto_217314 ) ) ( not ( = ?auto_217313 ?auto_217315 ) ) ( not ( = ?auto_217313 ?auto_217316 ) ) ( not ( = ?auto_217313 ?auto_217317 ) ) ( not ( = ?auto_217313 ?auto_217318 ) ) ( not ( = ?auto_217314 ?auto_217315 ) ) ( not ( = ?auto_217314 ?auto_217316 ) ) ( not ( = ?auto_217314 ?auto_217317 ) ) ( not ( = ?auto_217314 ?auto_217318 ) ) ( not ( = ?auto_217315 ?auto_217316 ) ) ( not ( = ?auto_217315 ?auto_217317 ) ) ( not ( = ?auto_217315 ?auto_217318 ) ) ( not ( = ?auto_217316 ?auto_217317 ) ) ( not ( = ?auto_217316 ?auto_217318 ) ) ( not ( = ?auto_217317 ?auto_217318 ) ) ( ON ?auto_217311 ?auto_217319 ) ( not ( = ?auto_217311 ?auto_217319 ) ) ( not ( = ?auto_217312 ?auto_217319 ) ) ( not ( = ?auto_217313 ?auto_217319 ) ) ( not ( = ?auto_217314 ?auto_217319 ) ) ( not ( = ?auto_217315 ?auto_217319 ) ) ( not ( = ?auto_217316 ?auto_217319 ) ) ( not ( = ?auto_217317 ?auto_217319 ) ) ( not ( = ?auto_217318 ?auto_217319 ) ) ( ON ?auto_217312 ?auto_217311 ) ( ON-TABLE ?auto_217319 ) ( ON ?auto_217313 ?auto_217312 ) ( ON ?auto_217314 ?auto_217313 ) ( ON ?auto_217315 ?auto_217314 ) ( ON ?auto_217316 ?auto_217315 ) ( ON ?auto_217317 ?auto_217316 ) ( ON ?auto_217318 ?auto_217317 ) ( CLEAR ?auto_217318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_217319 ?auto_217311 ?auto_217312 ?auto_217313 ?auto_217314 ?auto_217315 ?auto_217316 ?auto_217317 )
      ( MAKE-8PILE ?auto_217311 ?auto_217312 ?auto_217313 ?auto_217314 ?auto_217315 ?auto_217316 ?auto_217317 ?auto_217318 ) )
  )

)

