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
      ?auto_5035 - BLOCK
      ?auto_5036 - BLOCK
      ?auto_5037 - BLOCK
    )
    :vars
    (
      ?auto_5038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5038 ?auto_5037 ) ( CLEAR ?auto_5038 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5035 ) ( ON ?auto_5036 ?auto_5035 ) ( ON ?auto_5037 ?auto_5036 ) ( not ( = ?auto_5035 ?auto_5036 ) ) ( not ( = ?auto_5035 ?auto_5037 ) ) ( not ( = ?auto_5035 ?auto_5038 ) ) ( not ( = ?auto_5036 ?auto_5037 ) ) ( not ( = ?auto_5036 ?auto_5038 ) ) ( not ( = ?auto_5037 ?auto_5038 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5038 ?auto_5037 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5040 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5040 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5040 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5041 - BLOCK
    )
    :vars
    (
      ?auto_5042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5041 ?auto_5042 ) ( CLEAR ?auto_5041 ) ( HAND-EMPTY ) ( not ( = ?auto_5041 ?auto_5042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5041 ?auto_5042 )
      ( MAKE-1PILE ?auto_5041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5045 - BLOCK
      ?auto_5046 - BLOCK
    )
    :vars
    (
      ?auto_5047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5047 ?auto_5046 ) ( CLEAR ?auto_5047 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5045 ) ( ON ?auto_5046 ?auto_5045 ) ( not ( = ?auto_5045 ?auto_5046 ) ) ( not ( = ?auto_5045 ?auto_5047 ) ) ( not ( = ?auto_5046 ?auto_5047 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5047 ?auto_5046 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5048 - BLOCK
      ?auto_5049 - BLOCK
    )
    :vars
    (
      ?auto_5050 - BLOCK
      ?auto_5051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5050 ?auto_5049 ) ( CLEAR ?auto_5050 ) ( ON-TABLE ?auto_5048 ) ( ON ?auto_5049 ?auto_5048 ) ( not ( = ?auto_5048 ?auto_5049 ) ) ( not ( = ?auto_5048 ?auto_5050 ) ) ( not ( = ?auto_5049 ?auto_5050 ) ) ( HOLDING ?auto_5051 ) ( not ( = ?auto_5048 ?auto_5051 ) ) ( not ( = ?auto_5049 ?auto_5051 ) ) ( not ( = ?auto_5050 ?auto_5051 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5051 )
      ( MAKE-2PILE ?auto_5048 ?auto_5049 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5052 - BLOCK
      ?auto_5053 - BLOCK
    )
    :vars
    (
      ?auto_5055 - BLOCK
      ?auto_5054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5055 ?auto_5053 ) ( ON-TABLE ?auto_5052 ) ( ON ?auto_5053 ?auto_5052 ) ( not ( = ?auto_5052 ?auto_5053 ) ) ( not ( = ?auto_5052 ?auto_5055 ) ) ( not ( = ?auto_5053 ?auto_5055 ) ) ( not ( = ?auto_5052 ?auto_5054 ) ) ( not ( = ?auto_5053 ?auto_5054 ) ) ( not ( = ?auto_5055 ?auto_5054 ) ) ( ON ?auto_5054 ?auto_5055 ) ( CLEAR ?auto_5054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5052 ?auto_5053 ?auto_5055 )
      ( MAKE-2PILE ?auto_5052 ?auto_5053 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5058 - BLOCK
      ?auto_5059 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5059 ) ( CLEAR ?auto_5058 ) ( ON-TABLE ?auto_5058 ) ( not ( = ?auto_5058 ?auto_5059 ) ) )
    :subtasks
    ( ( !STACK ?auto_5059 ?auto_5058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5060 - BLOCK
      ?auto_5061 - BLOCK
    )
    :vars
    (
      ?auto_5062 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5060 ) ( ON-TABLE ?auto_5060 ) ( not ( = ?auto_5060 ?auto_5061 ) ) ( ON ?auto_5061 ?auto_5062 ) ( CLEAR ?auto_5061 ) ( HAND-EMPTY ) ( not ( = ?auto_5060 ?auto_5062 ) ) ( not ( = ?auto_5061 ?auto_5062 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5061 ?auto_5062 )
      ( MAKE-2PILE ?auto_5060 ?auto_5061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5063 - BLOCK
      ?auto_5064 - BLOCK
    )
    :vars
    (
      ?auto_5065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5063 ?auto_5064 ) ) ( ON ?auto_5064 ?auto_5065 ) ( CLEAR ?auto_5064 ) ( not ( = ?auto_5063 ?auto_5065 ) ) ( not ( = ?auto_5064 ?auto_5065 ) ) ( HOLDING ?auto_5063 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5063 )
      ( MAKE-2PILE ?auto_5063 ?auto_5064 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5066 - BLOCK
      ?auto_5067 - BLOCK
    )
    :vars
    (
      ?auto_5068 - BLOCK
      ?auto_5069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5066 ?auto_5067 ) ) ( ON ?auto_5067 ?auto_5068 ) ( not ( = ?auto_5066 ?auto_5068 ) ) ( not ( = ?auto_5067 ?auto_5068 ) ) ( ON ?auto_5066 ?auto_5067 ) ( CLEAR ?auto_5066 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5069 ) ( ON ?auto_5068 ?auto_5069 ) ( not ( = ?auto_5069 ?auto_5068 ) ) ( not ( = ?auto_5069 ?auto_5067 ) ) ( not ( = ?auto_5069 ?auto_5066 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5069 ?auto_5068 ?auto_5067 )
      ( MAKE-2PILE ?auto_5066 ?auto_5067 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5071 - BLOCK
    )
    :vars
    (
      ?auto_5072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5072 ?auto_5071 ) ( CLEAR ?auto_5072 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5071 ) ( not ( = ?auto_5071 ?auto_5072 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5072 ?auto_5071 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5073 - BLOCK
    )
    :vars
    (
      ?auto_5074 - BLOCK
      ?auto_5075 - BLOCK
      ?auto_5076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5074 ?auto_5073 ) ( CLEAR ?auto_5074 ) ( ON-TABLE ?auto_5073 ) ( not ( = ?auto_5073 ?auto_5074 ) ) ( HOLDING ?auto_5075 ) ( CLEAR ?auto_5076 ) ( not ( = ?auto_5073 ?auto_5075 ) ) ( not ( = ?auto_5073 ?auto_5076 ) ) ( not ( = ?auto_5074 ?auto_5075 ) ) ( not ( = ?auto_5074 ?auto_5076 ) ) ( not ( = ?auto_5075 ?auto_5076 ) ) )
    :subtasks
    ( ( !STACK ?auto_5075 ?auto_5076 )
      ( MAKE-1PILE ?auto_5073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5163 - BLOCK
    )
    :vars
    (
      ?auto_5165 - BLOCK
      ?auto_5164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5165 ?auto_5163 ) ( ON-TABLE ?auto_5163 ) ( not ( = ?auto_5163 ?auto_5165 ) ) ( not ( = ?auto_5163 ?auto_5164 ) ) ( not ( = ?auto_5165 ?auto_5164 ) ) ( ON ?auto_5164 ?auto_5165 ) ( CLEAR ?auto_5164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5163 ?auto_5165 )
      ( MAKE-1PILE ?auto_5163 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5081 - BLOCK
    )
    :vars
    (
      ?auto_5083 - BLOCK
      ?auto_5082 - BLOCK
      ?auto_5084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5083 ?auto_5081 ) ( ON-TABLE ?auto_5081 ) ( not ( = ?auto_5081 ?auto_5083 ) ) ( not ( = ?auto_5081 ?auto_5082 ) ) ( not ( = ?auto_5081 ?auto_5084 ) ) ( not ( = ?auto_5083 ?auto_5082 ) ) ( not ( = ?auto_5083 ?auto_5084 ) ) ( not ( = ?auto_5082 ?auto_5084 ) ) ( ON ?auto_5082 ?auto_5083 ) ( CLEAR ?auto_5082 ) ( HOLDING ?auto_5084 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5084 )
      ( MAKE-1PILE ?auto_5081 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5085 - BLOCK
    )
    :vars
    (
      ?auto_5088 - BLOCK
      ?auto_5086 - BLOCK
      ?auto_5087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5088 ?auto_5085 ) ( ON-TABLE ?auto_5085 ) ( not ( = ?auto_5085 ?auto_5088 ) ) ( not ( = ?auto_5085 ?auto_5086 ) ) ( not ( = ?auto_5085 ?auto_5087 ) ) ( not ( = ?auto_5088 ?auto_5086 ) ) ( not ( = ?auto_5088 ?auto_5087 ) ) ( not ( = ?auto_5086 ?auto_5087 ) ) ( ON ?auto_5086 ?auto_5088 ) ( ON ?auto_5087 ?auto_5086 ) ( CLEAR ?auto_5087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5085 ?auto_5088 ?auto_5086 )
      ( MAKE-1PILE ?auto_5085 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5092 - BLOCK
      ?auto_5093 - BLOCK
      ?auto_5094 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5094 ) ( CLEAR ?auto_5093 ) ( ON-TABLE ?auto_5092 ) ( ON ?auto_5093 ?auto_5092 ) ( not ( = ?auto_5092 ?auto_5093 ) ) ( not ( = ?auto_5092 ?auto_5094 ) ) ( not ( = ?auto_5093 ?auto_5094 ) ) )
    :subtasks
    ( ( !STACK ?auto_5094 ?auto_5093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5095 - BLOCK
      ?auto_5096 - BLOCK
      ?auto_5097 - BLOCK
    )
    :vars
    (
      ?auto_5098 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5096 ) ( ON-TABLE ?auto_5095 ) ( ON ?auto_5096 ?auto_5095 ) ( not ( = ?auto_5095 ?auto_5096 ) ) ( not ( = ?auto_5095 ?auto_5097 ) ) ( not ( = ?auto_5096 ?auto_5097 ) ) ( ON ?auto_5097 ?auto_5098 ) ( CLEAR ?auto_5097 ) ( HAND-EMPTY ) ( not ( = ?auto_5095 ?auto_5098 ) ) ( not ( = ?auto_5096 ?auto_5098 ) ) ( not ( = ?auto_5097 ?auto_5098 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5097 ?auto_5098 )
      ( MAKE-3PILE ?auto_5095 ?auto_5096 ?auto_5097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5099 - BLOCK
      ?auto_5100 - BLOCK
      ?auto_5101 - BLOCK
    )
    :vars
    (
      ?auto_5102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5099 ) ( not ( = ?auto_5099 ?auto_5100 ) ) ( not ( = ?auto_5099 ?auto_5101 ) ) ( not ( = ?auto_5100 ?auto_5101 ) ) ( ON ?auto_5101 ?auto_5102 ) ( CLEAR ?auto_5101 ) ( not ( = ?auto_5099 ?auto_5102 ) ) ( not ( = ?auto_5100 ?auto_5102 ) ) ( not ( = ?auto_5101 ?auto_5102 ) ) ( HOLDING ?auto_5100 ) ( CLEAR ?auto_5099 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5099 ?auto_5100 )
      ( MAKE-3PILE ?auto_5099 ?auto_5100 ?auto_5101 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5103 - BLOCK
      ?auto_5104 - BLOCK
      ?auto_5105 - BLOCK
    )
    :vars
    (
      ?auto_5106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5103 ) ( not ( = ?auto_5103 ?auto_5104 ) ) ( not ( = ?auto_5103 ?auto_5105 ) ) ( not ( = ?auto_5104 ?auto_5105 ) ) ( ON ?auto_5105 ?auto_5106 ) ( not ( = ?auto_5103 ?auto_5106 ) ) ( not ( = ?auto_5104 ?auto_5106 ) ) ( not ( = ?auto_5105 ?auto_5106 ) ) ( CLEAR ?auto_5103 ) ( ON ?auto_5104 ?auto_5105 ) ( CLEAR ?auto_5104 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5106 ?auto_5105 )
      ( MAKE-3PILE ?auto_5103 ?auto_5104 ?auto_5105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5107 - BLOCK
      ?auto_5108 - BLOCK
      ?auto_5109 - BLOCK
    )
    :vars
    (
      ?auto_5110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5107 ?auto_5108 ) ) ( not ( = ?auto_5107 ?auto_5109 ) ) ( not ( = ?auto_5108 ?auto_5109 ) ) ( ON ?auto_5109 ?auto_5110 ) ( not ( = ?auto_5107 ?auto_5110 ) ) ( not ( = ?auto_5108 ?auto_5110 ) ) ( not ( = ?auto_5109 ?auto_5110 ) ) ( ON ?auto_5108 ?auto_5109 ) ( CLEAR ?auto_5108 ) ( ON-TABLE ?auto_5110 ) ( HOLDING ?auto_5107 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5107 )
      ( MAKE-3PILE ?auto_5107 ?auto_5108 ?auto_5109 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5111 - BLOCK
      ?auto_5112 - BLOCK
      ?auto_5113 - BLOCK
    )
    :vars
    (
      ?auto_5114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5111 ?auto_5112 ) ) ( not ( = ?auto_5111 ?auto_5113 ) ) ( not ( = ?auto_5112 ?auto_5113 ) ) ( ON ?auto_5113 ?auto_5114 ) ( not ( = ?auto_5111 ?auto_5114 ) ) ( not ( = ?auto_5112 ?auto_5114 ) ) ( not ( = ?auto_5113 ?auto_5114 ) ) ( ON ?auto_5112 ?auto_5113 ) ( ON-TABLE ?auto_5114 ) ( ON ?auto_5111 ?auto_5112 ) ( CLEAR ?auto_5111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5114 ?auto_5113 ?auto_5112 )
      ( MAKE-3PILE ?auto_5111 ?auto_5112 ?auto_5113 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5141 - BLOCK
    )
    :vars
    (
      ?auto_5142 - BLOCK
      ?auto_5143 - BLOCK
      ?auto_5144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5141 ?auto_5142 ) ( CLEAR ?auto_5141 ) ( not ( = ?auto_5141 ?auto_5142 ) ) ( HOLDING ?auto_5143 ) ( CLEAR ?auto_5144 ) ( not ( = ?auto_5141 ?auto_5143 ) ) ( not ( = ?auto_5141 ?auto_5144 ) ) ( not ( = ?auto_5142 ?auto_5143 ) ) ( not ( = ?auto_5142 ?auto_5144 ) ) ( not ( = ?auto_5143 ?auto_5144 ) ) )
    :subtasks
    ( ( !STACK ?auto_5143 ?auto_5144 )
      ( MAKE-1PILE ?auto_5141 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5145 - BLOCK
    )
    :vars
    (
      ?auto_5146 - BLOCK
      ?auto_5148 - BLOCK
      ?auto_5147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5145 ?auto_5146 ) ( not ( = ?auto_5145 ?auto_5146 ) ) ( CLEAR ?auto_5148 ) ( not ( = ?auto_5145 ?auto_5147 ) ) ( not ( = ?auto_5145 ?auto_5148 ) ) ( not ( = ?auto_5146 ?auto_5147 ) ) ( not ( = ?auto_5146 ?auto_5148 ) ) ( not ( = ?auto_5147 ?auto_5148 ) ) ( ON ?auto_5147 ?auto_5145 ) ( CLEAR ?auto_5147 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5146 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5146 ?auto_5145 )
      ( MAKE-1PILE ?auto_5145 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5149 - BLOCK
    )
    :vars
    (
      ?auto_5152 - BLOCK
      ?auto_5150 - BLOCK
      ?auto_5151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5149 ?auto_5152 ) ( not ( = ?auto_5149 ?auto_5152 ) ) ( not ( = ?auto_5149 ?auto_5150 ) ) ( not ( = ?auto_5149 ?auto_5151 ) ) ( not ( = ?auto_5152 ?auto_5150 ) ) ( not ( = ?auto_5152 ?auto_5151 ) ) ( not ( = ?auto_5150 ?auto_5151 ) ) ( ON ?auto_5150 ?auto_5149 ) ( CLEAR ?auto_5150 ) ( ON-TABLE ?auto_5152 ) ( HOLDING ?auto_5151 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5151 )
      ( MAKE-1PILE ?auto_5149 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5153 - BLOCK
    )
    :vars
    (
      ?auto_5154 - BLOCK
      ?auto_5155 - BLOCK
      ?auto_5156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5153 ?auto_5154 ) ( not ( = ?auto_5153 ?auto_5154 ) ) ( not ( = ?auto_5153 ?auto_5155 ) ) ( not ( = ?auto_5153 ?auto_5156 ) ) ( not ( = ?auto_5154 ?auto_5155 ) ) ( not ( = ?auto_5154 ?auto_5156 ) ) ( not ( = ?auto_5155 ?auto_5156 ) ) ( ON ?auto_5155 ?auto_5153 ) ( ON-TABLE ?auto_5154 ) ( ON ?auto_5156 ?auto_5155 ) ( CLEAR ?auto_5156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5154 ?auto_5153 ?auto_5155 )
      ( MAKE-1PILE ?auto_5153 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5160 - BLOCK
    )
    :vars
    (
      ?auto_5161 - BLOCK
      ?auto_5162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5161 ?auto_5160 ) ( CLEAR ?auto_5161 ) ( ON-TABLE ?auto_5160 ) ( not ( = ?auto_5160 ?auto_5161 ) ) ( HOLDING ?auto_5162 ) ( not ( = ?auto_5160 ?auto_5162 ) ) ( not ( = ?auto_5161 ?auto_5162 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5162 )
      ( MAKE-1PILE ?auto_5160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5185 - BLOCK
      ?auto_5186 - BLOCK
    )
    :vars
    (
      ?auto_5187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5185 ?auto_5186 ) ) ( ON ?auto_5186 ?auto_5187 ) ( not ( = ?auto_5185 ?auto_5187 ) ) ( not ( = ?auto_5186 ?auto_5187 ) ) ( ON ?auto_5185 ?auto_5186 ) ( CLEAR ?auto_5185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5187 ?auto_5186 )
      ( MAKE-2PILE ?auto_5185 ?auto_5186 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5190 - BLOCK
      ?auto_5191 - BLOCK
    )
    :vars
    (
      ?auto_5192 - BLOCK
      ?auto_5193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5190 ?auto_5191 ) ) ( ON ?auto_5191 ?auto_5192 ) ( CLEAR ?auto_5191 ) ( not ( = ?auto_5190 ?auto_5192 ) ) ( not ( = ?auto_5191 ?auto_5192 ) ) ( ON ?auto_5190 ?auto_5193 ) ( CLEAR ?auto_5190 ) ( HAND-EMPTY ) ( not ( = ?auto_5190 ?auto_5193 ) ) ( not ( = ?auto_5191 ?auto_5193 ) ) ( not ( = ?auto_5192 ?auto_5193 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5190 ?auto_5193 )
      ( MAKE-2PILE ?auto_5190 ?auto_5191 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5194 - BLOCK
      ?auto_5195 - BLOCK
    )
    :vars
    (
      ?auto_5197 - BLOCK
      ?auto_5196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5194 ?auto_5195 ) ) ( not ( = ?auto_5194 ?auto_5197 ) ) ( not ( = ?auto_5195 ?auto_5197 ) ) ( ON ?auto_5194 ?auto_5196 ) ( CLEAR ?auto_5194 ) ( not ( = ?auto_5194 ?auto_5196 ) ) ( not ( = ?auto_5195 ?auto_5196 ) ) ( not ( = ?auto_5197 ?auto_5196 ) ) ( HOLDING ?auto_5195 ) ( CLEAR ?auto_5197 ) ( ON-TABLE ?auto_5197 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5197 ?auto_5195 )
      ( MAKE-2PILE ?auto_5194 ?auto_5195 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5198 - BLOCK
      ?auto_5199 - BLOCK
    )
    :vars
    (
      ?auto_5200 - BLOCK
      ?auto_5201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5198 ?auto_5199 ) ) ( not ( = ?auto_5198 ?auto_5200 ) ) ( not ( = ?auto_5199 ?auto_5200 ) ) ( ON ?auto_5198 ?auto_5201 ) ( not ( = ?auto_5198 ?auto_5201 ) ) ( not ( = ?auto_5199 ?auto_5201 ) ) ( not ( = ?auto_5200 ?auto_5201 ) ) ( CLEAR ?auto_5200 ) ( ON-TABLE ?auto_5200 ) ( ON ?auto_5199 ?auto_5198 ) ( CLEAR ?auto_5199 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5201 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5201 ?auto_5198 )
      ( MAKE-2PILE ?auto_5198 ?auto_5199 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5202 - BLOCK
      ?auto_5203 - BLOCK
    )
    :vars
    (
      ?auto_5204 - BLOCK
      ?auto_5205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5202 ?auto_5203 ) ) ( not ( = ?auto_5202 ?auto_5204 ) ) ( not ( = ?auto_5203 ?auto_5204 ) ) ( ON ?auto_5202 ?auto_5205 ) ( not ( = ?auto_5202 ?auto_5205 ) ) ( not ( = ?auto_5203 ?auto_5205 ) ) ( not ( = ?auto_5204 ?auto_5205 ) ) ( ON ?auto_5203 ?auto_5202 ) ( CLEAR ?auto_5203 ) ( ON-TABLE ?auto_5205 ) ( HOLDING ?auto_5204 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5204 )
      ( MAKE-2PILE ?auto_5202 ?auto_5203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5206 - BLOCK
      ?auto_5207 - BLOCK
    )
    :vars
    (
      ?auto_5208 - BLOCK
      ?auto_5209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5206 ?auto_5207 ) ) ( not ( = ?auto_5206 ?auto_5208 ) ) ( not ( = ?auto_5207 ?auto_5208 ) ) ( ON ?auto_5206 ?auto_5209 ) ( not ( = ?auto_5206 ?auto_5209 ) ) ( not ( = ?auto_5207 ?auto_5209 ) ) ( not ( = ?auto_5208 ?auto_5209 ) ) ( ON ?auto_5207 ?auto_5206 ) ( ON-TABLE ?auto_5209 ) ( ON ?auto_5208 ?auto_5207 ) ( CLEAR ?auto_5208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5209 ?auto_5206 ?auto_5207 )
      ( MAKE-2PILE ?auto_5206 ?auto_5207 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5216 - BLOCK
      ?auto_5217 - BLOCK
      ?auto_5218 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5217 ) ( ON-TABLE ?auto_5216 ) ( ON ?auto_5217 ?auto_5216 ) ( not ( = ?auto_5216 ?auto_5217 ) ) ( not ( = ?auto_5216 ?auto_5218 ) ) ( not ( = ?auto_5217 ?auto_5218 ) ) ( ON-TABLE ?auto_5218 ) ( CLEAR ?auto_5218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_5218 )
      ( MAKE-3PILE ?auto_5216 ?auto_5217 ?auto_5218 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5219 - BLOCK
      ?auto_5220 - BLOCK
      ?auto_5221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5219 ) ( not ( = ?auto_5219 ?auto_5220 ) ) ( not ( = ?auto_5219 ?auto_5221 ) ) ( not ( = ?auto_5220 ?auto_5221 ) ) ( ON-TABLE ?auto_5221 ) ( CLEAR ?auto_5221 ) ( HOLDING ?auto_5220 ) ( CLEAR ?auto_5219 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5219 ?auto_5220 )
      ( MAKE-3PILE ?auto_5219 ?auto_5220 ?auto_5221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5222 - BLOCK
      ?auto_5223 - BLOCK
      ?auto_5224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5222 ) ( not ( = ?auto_5222 ?auto_5223 ) ) ( not ( = ?auto_5222 ?auto_5224 ) ) ( not ( = ?auto_5223 ?auto_5224 ) ) ( ON-TABLE ?auto_5224 ) ( CLEAR ?auto_5222 ) ( ON ?auto_5223 ?auto_5224 ) ( CLEAR ?auto_5223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5224 )
      ( MAKE-3PILE ?auto_5222 ?auto_5223 ?auto_5224 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5225 - BLOCK
      ?auto_5226 - BLOCK
      ?auto_5227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5225 ?auto_5226 ) ) ( not ( = ?auto_5225 ?auto_5227 ) ) ( not ( = ?auto_5226 ?auto_5227 ) ) ( ON-TABLE ?auto_5227 ) ( ON ?auto_5226 ?auto_5227 ) ( CLEAR ?auto_5226 ) ( HOLDING ?auto_5225 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5225 )
      ( MAKE-3PILE ?auto_5225 ?auto_5226 ?auto_5227 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5228 - BLOCK
      ?auto_5229 - BLOCK
      ?auto_5230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5228 ?auto_5229 ) ) ( not ( = ?auto_5228 ?auto_5230 ) ) ( not ( = ?auto_5229 ?auto_5230 ) ) ( ON-TABLE ?auto_5230 ) ( ON ?auto_5229 ?auto_5230 ) ( ON ?auto_5228 ?auto_5229 ) ( CLEAR ?auto_5228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5230 ?auto_5229 )
      ( MAKE-3PILE ?auto_5228 ?auto_5229 ?auto_5230 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5234 - BLOCK
      ?auto_5235 - BLOCK
      ?auto_5236 - BLOCK
    )
    :vars
    (
      ?auto_5237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5234 ?auto_5235 ) ) ( not ( = ?auto_5234 ?auto_5236 ) ) ( not ( = ?auto_5235 ?auto_5236 ) ) ( ON-TABLE ?auto_5236 ) ( ON ?auto_5235 ?auto_5236 ) ( CLEAR ?auto_5235 ) ( ON ?auto_5234 ?auto_5237 ) ( CLEAR ?auto_5234 ) ( HAND-EMPTY ) ( not ( = ?auto_5234 ?auto_5237 ) ) ( not ( = ?auto_5235 ?auto_5237 ) ) ( not ( = ?auto_5236 ?auto_5237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5234 ?auto_5237 )
      ( MAKE-3PILE ?auto_5234 ?auto_5235 ?auto_5236 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5238 - BLOCK
      ?auto_5239 - BLOCK
      ?auto_5240 - BLOCK
    )
    :vars
    (
      ?auto_5241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5238 ?auto_5239 ) ) ( not ( = ?auto_5238 ?auto_5240 ) ) ( not ( = ?auto_5239 ?auto_5240 ) ) ( ON-TABLE ?auto_5240 ) ( ON ?auto_5238 ?auto_5241 ) ( CLEAR ?auto_5238 ) ( not ( = ?auto_5238 ?auto_5241 ) ) ( not ( = ?auto_5239 ?auto_5241 ) ) ( not ( = ?auto_5240 ?auto_5241 ) ) ( HOLDING ?auto_5239 ) ( CLEAR ?auto_5240 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5240 ?auto_5239 )
      ( MAKE-3PILE ?auto_5238 ?auto_5239 ?auto_5240 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5242 - BLOCK
      ?auto_5243 - BLOCK
      ?auto_5244 - BLOCK
    )
    :vars
    (
      ?auto_5245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5242 ?auto_5243 ) ) ( not ( = ?auto_5242 ?auto_5244 ) ) ( not ( = ?auto_5243 ?auto_5244 ) ) ( ON-TABLE ?auto_5244 ) ( ON ?auto_5242 ?auto_5245 ) ( not ( = ?auto_5242 ?auto_5245 ) ) ( not ( = ?auto_5243 ?auto_5245 ) ) ( not ( = ?auto_5244 ?auto_5245 ) ) ( CLEAR ?auto_5244 ) ( ON ?auto_5243 ?auto_5242 ) ( CLEAR ?auto_5243 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5245 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5245 ?auto_5242 )
      ( MAKE-3PILE ?auto_5242 ?auto_5243 ?auto_5244 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5246 - BLOCK
      ?auto_5247 - BLOCK
      ?auto_5248 - BLOCK
    )
    :vars
    (
      ?auto_5249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5246 ?auto_5247 ) ) ( not ( = ?auto_5246 ?auto_5248 ) ) ( not ( = ?auto_5247 ?auto_5248 ) ) ( ON ?auto_5246 ?auto_5249 ) ( not ( = ?auto_5246 ?auto_5249 ) ) ( not ( = ?auto_5247 ?auto_5249 ) ) ( not ( = ?auto_5248 ?auto_5249 ) ) ( ON ?auto_5247 ?auto_5246 ) ( CLEAR ?auto_5247 ) ( ON-TABLE ?auto_5249 ) ( HOLDING ?auto_5248 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5248 )
      ( MAKE-3PILE ?auto_5246 ?auto_5247 ?auto_5248 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5250 - BLOCK
      ?auto_5251 - BLOCK
      ?auto_5252 - BLOCK
    )
    :vars
    (
      ?auto_5253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5250 ?auto_5251 ) ) ( not ( = ?auto_5250 ?auto_5252 ) ) ( not ( = ?auto_5251 ?auto_5252 ) ) ( ON ?auto_5250 ?auto_5253 ) ( not ( = ?auto_5250 ?auto_5253 ) ) ( not ( = ?auto_5251 ?auto_5253 ) ) ( not ( = ?auto_5252 ?auto_5253 ) ) ( ON ?auto_5251 ?auto_5250 ) ( ON-TABLE ?auto_5253 ) ( ON ?auto_5252 ?auto_5251 ) ( CLEAR ?auto_5252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5253 ?auto_5250 ?auto_5251 )
      ( MAKE-3PILE ?auto_5250 ?auto_5251 ?auto_5252 ) )
  )

)

