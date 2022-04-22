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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74013 - BLOCK
      ?auto_74014 - BLOCK
      ?auto_74015 - BLOCK
      ?auto_74016 - BLOCK
      ?auto_74017 - BLOCK
      ?auto_74018 - BLOCK
      ?auto_74019 - BLOCK
    )
    :vars
    (
      ?auto_74020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74020 ?auto_74019 ) ( CLEAR ?auto_74020 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74013 ) ( ON ?auto_74014 ?auto_74013 ) ( ON ?auto_74015 ?auto_74014 ) ( ON ?auto_74016 ?auto_74015 ) ( ON ?auto_74017 ?auto_74016 ) ( ON ?auto_74018 ?auto_74017 ) ( ON ?auto_74019 ?auto_74018 ) ( not ( = ?auto_74013 ?auto_74014 ) ) ( not ( = ?auto_74013 ?auto_74015 ) ) ( not ( = ?auto_74013 ?auto_74016 ) ) ( not ( = ?auto_74013 ?auto_74017 ) ) ( not ( = ?auto_74013 ?auto_74018 ) ) ( not ( = ?auto_74013 ?auto_74019 ) ) ( not ( = ?auto_74013 ?auto_74020 ) ) ( not ( = ?auto_74014 ?auto_74015 ) ) ( not ( = ?auto_74014 ?auto_74016 ) ) ( not ( = ?auto_74014 ?auto_74017 ) ) ( not ( = ?auto_74014 ?auto_74018 ) ) ( not ( = ?auto_74014 ?auto_74019 ) ) ( not ( = ?auto_74014 ?auto_74020 ) ) ( not ( = ?auto_74015 ?auto_74016 ) ) ( not ( = ?auto_74015 ?auto_74017 ) ) ( not ( = ?auto_74015 ?auto_74018 ) ) ( not ( = ?auto_74015 ?auto_74019 ) ) ( not ( = ?auto_74015 ?auto_74020 ) ) ( not ( = ?auto_74016 ?auto_74017 ) ) ( not ( = ?auto_74016 ?auto_74018 ) ) ( not ( = ?auto_74016 ?auto_74019 ) ) ( not ( = ?auto_74016 ?auto_74020 ) ) ( not ( = ?auto_74017 ?auto_74018 ) ) ( not ( = ?auto_74017 ?auto_74019 ) ) ( not ( = ?auto_74017 ?auto_74020 ) ) ( not ( = ?auto_74018 ?auto_74019 ) ) ( not ( = ?auto_74018 ?auto_74020 ) ) ( not ( = ?auto_74019 ?auto_74020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74020 ?auto_74019 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74022 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74022 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_74022 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74023 - BLOCK
    )
    :vars
    (
      ?auto_74024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74023 ?auto_74024 ) ( CLEAR ?auto_74023 ) ( HAND-EMPTY ) ( not ( = ?auto_74023 ?auto_74024 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74023 ?auto_74024 )
      ( MAKE-1PILE ?auto_74023 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74031 - BLOCK
      ?auto_74032 - BLOCK
      ?auto_74033 - BLOCK
      ?auto_74034 - BLOCK
      ?auto_74035 - BLOCK
      ?auto_74036 - BLOCK
    )
    :vars
    (
      ?auto_74037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74037 ?auto_74036 ) ( CLEAR ?auto_74037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74031 ) ( ON ?auto_74032 ?auto_74031 ) ( ON ?auto_74033 ?auto_74032 ) ( ON ?auto_74034 ?auto_74033 ) ( ON ?auto_74035 ?auto_74034 ) ( ON ?auto_74036 ?auto_74035 ) ( not ( = ?auto_74031 ?auto_74032 ) ) ( not ( = ?auto_74031 ?auto_74033 ) ) ( not ( = ?auto_74031 ?auto_74034 ) ) ( not ( = ?auto_74031 ?auto_74035 ) ) ( not ( = ?auto_74031 ?auto_74036 ) ) ( not ( = ?auto_74031 ?auto_74037 ) ) ( not ( = ?auto_74032 ?auto_74033 ) ) ( not ( = ?auto_74032 ?auto_74034 ) ) ( not ( = ?auto_74032 ?auto_74035 ) ) ( not ( = ?auto_74032 ?auto_74036 ) ) ( not ( = ?auto_74032 ?auto_74037 ) ) ( not ( = ?auto_74033 ?auto_74034 ) ) ( not ( = ?auto_74033 ?auto_74035 ) ) ( not ( = ?auto_74033 ?auto_74036 ) ) ( not ( = ?auto_74033 ?auto_74037 ) ) ( not ( = ?auto_74034 ?auto_74035 ) ) ( not ( = ?auto_74034 ?auto_74036 ) ) ( not ( = ?auto_74034 ?auto_74037 ) ) ( not ( = ?auto_74035 ?auto_74036 ) ) ( not ( = ?auto_74035 ?auto_74037 ) ) ( not ( = ?auto_74036 ?auto_74037 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74037 ?auto_74036 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74038 - BLOCK
      ?auto_74039 - BLOCK
      ?auto_74040 - BLOCK
      ?auto_74041 - BLOCK
      ?auto_74042 - BLOCK
      ?auto_74043 - BLOCK
    )
    :vars
    (
      ?auto_74044 - BLOCK
      ?auto_74045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74044 ?auto_74043 ) ( CLEAR ?auto_74044 ) ( ON-TABLE ?auto_74038 ) ( ON ?auto_74039 ?auto_74038 ) ( ON ?auto_74040 ?auto_74039 ) ( ON ?auto_74041 ?auto_74040 ) ( ON ?auto_74042 ?auto_74041 ) ( ON ?auto_74043 ?auto_74042 ) ( not ( = ?auto_74038 ?auto_74039 ) ) ( not ( = ?auto_74038 ?auto_74040 ) ) ( not ( = ?auto_74038 ?auto_74041 ) ) ( not ( = ?auto_74038 ?auto_74042 ) ) ( not ( = ?auto_74038 ?auto_74043 ) ) ( not ( = ?auto_74038 ?auto_74044 ) ) ( not ( = ?auto_74039 ?auto_74040 ) ) ( not ( = ?auto_74039 ?auto_74041 ) ) ( not ( = ?auto_74039 ?auto_74042 ) ) ( not ( = ?auto_74039 ?auto_74043 ) ) ( not ( = ?auto_74039 ?auto_74044 ) ) ( not ( = ?auto_74040 ?auto_74041 ) ) ( not ( = ?auto_74040 ?auto_74042 ) ) ( not ( = ?auto_74040 ?auto_74043 ) ) ( not ( = ?auto_74040 ?auto_74044 ) ) ( not ( = ?auto_74041 ?auto_74042 ) ) ( not ( = ?auto_74041 ?auto_74043 ) ) ( not ( = ?auto_74041 ?auto_74044 ) ) ( not ( = ?auto_74042 ?auto_74043 ) ) ( not ( = ?auto_74042 ?auto_74044 ) ) ( not ( = ?auto_74043 ?auto_74044 ) ) ( HOLDING ?auto_74045 ) ( not ( = ?auto_74038 ?auto_74045 ) ) ( not ( = ?auto_74039 ?auto_74045 ) ) ( not ( = ?auto_74040 ?auto_74045 ) ) ( not ( = ?auto_74041 ?auto_74045 ) ) ( not ( = ?auto_74042 ?auto_74045 ) ) ( not ( = ?auto_74043 ?auto_74045 ) ) ( not ( = ?auto_74044 ?auto_74045 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_74045 )
      ( MAKE-6PILE ?auto_74038 ?auto_74039 ?auto_74040 ?auto_74041 ?auto_74042 ?auto_74043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74046 - BLOCK
      ?auto_74047 - BLOCK
      ?auto_74048 - BLOCK
      ?auto_74049 - BLOCK
      ?auto_74050 - BLOCK
      ?auto_74051 - BLOCK
    )
    :vars
    (
      ?auto_74052 - BLOCK
      ?auto_74053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74052 ?auto_74051 ) ( ON-TABLE ?auto_74046 ) ( ON ?auto_74047 ?auto_74046 ) ( ON ?auto_74048 ?auto_74047 ) ( ON ?auto_74049 ?auto_74048 ) ( ON ?auto_74050 ?auto_74049 ) ( ON ?auto_74051 ?auto_74050 ) ( not ( = ?auto_74046 ?auto_74047 ) ) ( not ( = ?auto_74046 ?auto_74048 ) ) ( not ( = ?auto_74046 ?auto_74049 ) ) ( not ( = ?auto_74046 ?auto_74050 ) ) ( not ( = ?auto_74046 ?auto_74051 ) ) ( not ( = ?auto_74046 ?auto_74052 ) ) ( not ( = ?auto_74047 ?auto_74048 ) ) ( not ( = ?auto_74047 ?auto_74049 ) ) ( not ( = ?auto_74047 ?auto_74050 ) ) ( not ( = ?auto_74047 ?auto_74051 ) ) ( not ( = ?auto_74047 ?auto_74052 ) ) ( not ( = ?auto_74048 ?auto_74049 ) ) ( not ( = ?auto_74048 ?auto_74050 ) ) ( not ( = ?auto_74048 ?auto_74051 ) ) ( not ( = ?auto_74048 ?auto_74052 ) ) ( not ( = ?auto_74049 ?auto_74050 ) ) ( not ( = ?auto_74049 ?auto_74051 ) ) ( not ( = ?auto_74049 ?auto_74052 ) ) ( not ( = ?auto_74050 ?auto_74051 ) ) ( not ( = ?auto_74050 ?auto_74052 ) ) ( not ( = ?auto_74051 ?auto_74052 ) ) ( not ( = ?auto_74046 ?auto_74053 ) ) ( not ( = ?auto_74047 ?auto_74053 ) ) ( not ( = ?auto_74048 ?auto_74053 ) ) ( not ( = ?auto_74049 ?auto_74053 ) ) ( not ( = ?auto_74050 ?auto_74053 ) ) ( not ( = ?auto_74051 ?auto_74053 ) ) ( not ( = ?auto_74052 ?auto_74053 ) ) ( ON ?auto_74053 ?auto_74052 ) ( CLEAR ?auto_74053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74046 ?auto_74047 ?auto_74048 ?auto_74049 ?auto_74050 ?auto_74051 ?auto_74052 )
      ( MAKE-6PILE ?auto_74046 ?auto_74047 ?auto_74048 ?auto_74049 ?auto_74050 ?auto_74051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74056 - BLOCK
      ?auto_74057 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74057 ) ( CLEAR ?auto_74056 ) ( ON-TABLE ?auto_74056 ) ( not ( = ?auto_74056 ?auto_74057 ) ) )
    :subtasks
    ( ( !STACK ?auto_74057 ?auto_74056 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74058 - BLOCK
      ?auto_74059 - BLOCK
    )
    :vars
    (
      ?auto_74060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74058 ) ( ON-TABLE ?auto_74058 ) ( not ( = ?auto_74058 ?auto_74059 ) ) ( ON ?auto_74059 ?auto_74060 ) ( CLEAR ?auto_74059 ) ( HAND-EMPTY ) ( not ( = ?auto_74058 ?auto_74060 ) ) ( not ( = ?auto_74059 ?auto_74060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74059 ?auto_74060 )
      ( MAKE-2PILE ?auto_74058 ?auto_74059 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74061 - BLOCK
      ?auto_74062 - BLOCK
    )
    :vars
    (
      ?auto_74063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74061 ?auto_74062 ) ) ( ON ?auto_74062 ?auto_74063 ) ( CLEAR ?auto_74062 ) ( not ( = ?auto_74061 ?auto_74063 ) ) ( not ( = ?auto_74062 ?auto_74063 ) ) ( HOLDING ?auto_74061 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74061 )
      ( MAKE-2PILE ?auto_74061 ?auto_74062 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74064 - BLOCK
      ?auto_74065 - BLOCK
    )
    :vars
    (
      ?auto_74066 - BLOCK
      ?auto_74068 - BLOCK
      ?auto_74067 - BLOCK
      ?auto_74070 - BLOCK
      ?auto_74071 - BLOCK
      ?auto_74069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74064 ?auto_74065 ) ) ( ON ?auto_74065 ?auto_74066 ) ( not ( = ?auto_74064 ?auto_74066 ) ) ( not ( = ?auto_74065 ?auto_74066 ) ) ( ON ?auto_74064 ?auto_74065 ) ( CLEAR ?auto_74064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74068 ) ( ON ?auto_74067 ?auto_74068 ) ( ON ?auto_74070 ?auto_74067 ) ( ON ?auto_74071 ?auto_74070 ) ( ON ?auto_74069 ?auto_74071 ) ( ON ?auto_74066 ?auto_74069 ) ( not ( = ?auto_74068 ?auto_74067 ) ) ( not ( = ?auto_74068 ?auto_74070 ) ) ( not ( = ?auto_74068 ?auto_74071 ) ) ( not ( = ?auto_74068 ?auto_74069 ) ) ( not ( = ?auto_74068 ?auto_74066 ) ) ( not ( = ?auto_74068 ?auto_74065 ) ) ( not ( = ?auto_74068 ?auto_74064 ) ) ( not ( = ?auto_74067 ?auto_74070 ) ) ( not ( = ?auto_74067 ?auto_74071 ) ) ( not ( = ?auto_74067 ?auto_74069 ) ) ( not ( = ?auto_74067 ?auto_74066 ) ) ( not ( = ?auto_74067 ?auto_74065 ) ) ( not ( = ?auto_74067 ?auto_74064 ) ) ( not ( = ?auto_74070 ?auto_74071 ) ) ( not ( = ?auto_74070 ?auto_74069 ) ) ( not ( = ?auto_74070 ?auto_74066 ) ) ( not ( = ?auto_74070 ?auto_74065 ) ) ( not ( = ?auto_74070 ?auto_74064 ) ) ( not ( = ?auto_74071 ?auto_74069 ) ) ( not ( = ?auto_74071 ?auto_74066 ) ) ( not ( = ?auto_74071 ?auto_74065 ) ) ( not ( = ?auto_74071 ?auto_74064 ) ) ( not ( = ?auto_74069 ?auto_74066 ) ) ( not ( = ?auto_74069 ?auto_74065 ) ) ( not ( = ?auto_74069 ?auto_74064 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74068 ?auto_74067 ?auto_74070 ?auto_74071 ?auto_74069 ?auto_74066 ?auto_74065 )
      ( MAKE-2PILE ?auto_74064 ?auto_74065 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74077 - BLOCK
      ?auto_74078 - BLOCK
      ?auto_74079 - BLOCK
      ?auto_74080 - BLOCK
      ?auto_74081 - BLOCK
    )
    :vars
    (
      ?auto_74082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74082 ?auto_74081 ) ( CLEAR ?auto_74082 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74077 ) ( ON ?auto_74078 ?auto_74077 ) ( ON ?auto_74079 ?auto_74078 ) ( ON ?auto_74080 ?auto_74079 ) ( ON ?auto_74081 ?auto_74080 ) ( not ( = ?auto_74077 ?auto_74078 ) ) ( not ( = ?auto_74077 ?auto_74079 ) ) ( not ( = ?auto_74077 ?auto_74080 ) ) ( not ( = ?auto_74077 ?auto_74081 ) ) ( not ( = ?auto_74077 ?auto_74082 ) ) ( not ( = ?auto_74078 ?auto_74079 ) ) ( not ( = ?auto_74078 ?auto_74080 ) ) ( not ( = ?auto_74078 ?auto_74081 ) ) ( not ( = ?auto_74078 ?auto_74082 ) ) ( not ( = ?auto_74079 ?auto_74080 ) ) ( not ( = ?auto_74079 ?auto_74081 ) ) ( not ( = ?auto_74079 ?auto_74082 ) ) ( not ( = ?auto_74080 ?auto_74081 ) ) ( not ( = ?auto_74080 ?auto_74082 ) ) ( not ( = ?auto_74081 ?auto_74082 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74082 ?auto_74081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74083 - BLOCK
      ?auto_74084 - BLOCK
      ?auto_74085 - BLOCK
      ?auto_74086 - BLOCK
      ?auto_74087 - BLOCK
    )
    :vars
    (
      ?auto_74088 - BLOCK
      ?auto_74089 - BLOCK
      ?auto_74090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74088 ?auto_74087 ) ( CLEAR ?auto_74088 ) ( ON-TABLE ?auto_74083 ) ( ON ?auto_74084 ?auto_74083 ) ( ON ?auto_74085 ?auto_74084 ) ( ON ?auto_74086 ?auto_74085 ) ( ON ?auto_74087 ?auto_74086 ) ( not ( = ?auto_74083 ?auto_74084 ) ) ( not ( = ?auto_74083 ?auto_74085 ) ) ( not ( = ?auto_74083 ?auto_74086 ) ) ( not ( = ?auto_74083 ?auto_74087 ) ) ( not ( = ?auto_74083 ?auto_74088 ) ) ( not ( = ?auto_74084 ?auto_74085 ) ) ( not ( = ?auto_74084 ?auto_74086 ) ) ( not ( = ?auto_74084 ?auto_74087 ) ) ( not ( = ?auto_74084 ?auto_74088 ) ) ( not ( = ?auto_74085 ?auto_74086 ) ) ( not ( = ?auto_74085 ?auto_74087 ) ) ( not ( = ?auto_74085 ?auto_74088 ) ) ( not ( = ?auto_74086 ?auto_74087 ) ) ( not ( = ?auto_74086 ?auto_74088 ) ) ( not ( = ?auto_74087 ?auto_74088 ) ) ( HOLDING ?auto_74089 ) ( CLEAR ?auto_74090 ) ( not ( = ?auto_74083 ?auto_74089 ) ) ( not ( = ?auto_74083 ?auto_74090 ) ) ( not ( = ?auto_74084 ?auto_74089 ) ) ( not ( = ?auto_74084 ?auto_74090 ) ) ( not ( = ?auto_74085 ?auto_74089 ) ) ( not ( = ?auto_74085 ?auto_74090 ) ) ( not ( = ?auto_74086 ?auto_74089 ) ) ( not ( = ?auto_74086 ?auto_74090 ) ) ( not ( = ?auto_74087 ?auto_74089 ) ) ( not ( = ?auto_74087 ?auto_74090 ) ) ( not ( = ?auto_74088 ?auto_74089 ) ) ( not ( = ?auto_74088 ?auto_74090 ) ) ( not ( = ?auto_74089 ?auto_74090 ) ) )
    :subtasks
    ( ( !STACK ?auto_74089 ?auto_74090 )
      ( MAKE-5PILE ?auto_74083 ?auto_74084 ?auto_74085 ?auto_74086 ?auto_74087 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75009 - BLOCK
      ?auto_75010 - BLOCK
      ?auto_75011 - BLOCK
      ?auto_75012 - BLOCK
      ?auto_75013 - BLOCK
    )
    :vars
    (
      ?auto_75015 - BLOCK
      ?auto_75014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75015 ?auto_75013 ) ( ON-TABLE ?auto_75009 ) ( ON ?auto_75010 ?auto_75009 ) ( ON ?auto_75011 ?auto_75010 ) ( ON ?auto_75012 ?auto_75011 ) ( ON ?auto_75013 ?auto_75012 ) ( not ( = ?auto_75009 ?auto_75010 ) ) ( not ( = ?auto_75009 ?auto_75011 ) ) ( not ( = ?auto_75009 ?auto_75012 ) ) ( not ( = ?auto_75009 ?auto_75013 ) ) ( not ( = ?auto_75009 ?auto_75015 ) ) ( not ( = ?auto_75010 ?auto_75011 ) ) ( not ( = ?auto_75010 ?auto_75012 ) ) ( not ( = ?auto_75010 ?auto_75013 ) ) ( not ( = ?auto_75010 ?auto_75015 ) ) ( not ( = ?auto_75011 ?auto_75012 ) ) ( not ( = ?auto_75011 ?auto_75013 ) ) ( not ( = ?auto_75011 ?auto_75015 ) ) ( not ( = ?auto_75012 ?auto_75013 ) ) ( not ( = ?auto_75012 ?auto_75015 ) ) ( not ( = ?auto_75013 ?auto_75015 ) ) ( not ( = ?auto_75009 ?auto_75014 ) ) ( not ( = ?auto_75010 ?auto_75014 ) ) ( not ( = ?auto_75011 ?auto_75014 ) ) ( not ( = ?auto_75012 ?auto_75014 ) ) ( not ( = ?auto_75013 ?auto_75014 ) ) ( not ( = ?auto_75015 ?auto_75014 ) ) ( ON ?auto_75014 ?auto_75015 ) ( CLEAR ?auto_75014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75009 ?auto_75010 ?auto_75011 ?auto_75012 ?auto_75013 ?auto_75015 )
      ( MAKE-5PILE ?auto_75009 ?auto_75010 ?auto_75011 ?auto_75012 ?auto_75013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74099 - BLOCK
      ?auto_74100 - BLOCK
      ?auto_74101 - BLOCK
      ?auto_74102 - BLOCK
      ?auto_74103 - BLOCK
    )
    :vars
    (
      ?auto_74104 - BLOCK
      ?auto_74106 - BLOCK
      ?auto_74105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74104 ?auto_74103 ) ( ON-TABLE ?auto_74099 ) ( ON ?auto_74100 ?auto_74099 ) ( ON ?auto_74101 ?auto_74100 ) ( ON ?auto_74102 ?auto_74101 ) ( ON ?auto_74103 ?auto_74102 ) ( not ( = ?auto_74099 ?auto_74100 ) ) ( not ( = ?auto_74099 ?auto_74101 ) ) ( not ( = ?auto_74099 ?auto_74102 ) ) ( not ( = ?auto_74099 ?auto_74103 ) ) ( not ( = ?auto_74099 ?auto_74104 ) ) ( not ( = ?auto_74100 ?auto_74101 ) ) ( not ( = ?auto_74100 ?auto_74102 ) ) ( not ( = ?auto_74100 ?auto_74103 ) ) ( not ( = ?auto_74100 ?auto_74104 ) ) ( not ( = ?auto_74101 ?auto_74102 ) ) ( not ( = ?auto_74101 ?auto_74103 ) ) ( not ( = ?auto_74101 ?auto_74104 ) ) ( not ( = ?auto_74102 ?auto_74103 ) ) ( not ( = ?auto_74102 ?auto_74104 ) ) ( not ( = ?auto_74103 ?auto_74104 ) ) ( not ( = ?auto_74099 ?auto_74106 ) ) ( not ( = ?auto_74099 ?auto_74105 ) ) ( not ( = ?auto_74100 ?auto_74106 ) ) ( not ( = ?auto_74100 ?auto_74105 ) ) ( not ( = ?auto_74101 ?auto_74106 ) ) ( not ( = ?auto_74101 ?auto_74105 ) ) ( not ( = ?auto_74102 ?auto_74106 ) ) ( not ( = ?auto_74102 ?auto_74105 ) ) ( not ( = ?auto_74103 ?auto_74106 ) ) ( not ( = ?auto_74103 ?auto_74105 ) ) ( not ( = ?auto_74104 ?auto_74106 ) ) ( not ( = ?auto_74104 ?auto_74105 ) ) ( not ( = ?auto_74106 ?auto_74105 ) ) ( ON ?auto_74106 ?auto_74104 ) ( CLEAR ?auto_74106 ) ( HOLDING ?auto_74105 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74105 )
      ( MAKE-5PILE ?auto_74099 ?auto_74100 ?auto_74101 ?auto_74102 ?auto_74103 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74107 - BLOCK
      ?auto_74108 - BLOCK
      ?auto_74109 - BLOCK
      ?auto_74110 - BLOCK
      ?auto_74111 - BLOCK
    )
    :vars
    (
      ?auto_74112 - BLOCK
      ?auto_74114 - BLOCK
      ?auto_74113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74112 ?auto_74111 ) ( ON-TABLE ?auto_74107 ) ( ON ?auto_74108 ?auto_74107 ) ( ON ?auto_74109 ?auto_74108 ) ( ON ?auto_74110 ?auto_74109 ) ( ON ?auto_74111 ?auto_74110 ) ( not ( = ?auto_74107 ?auto_74108 ) ) ( not ( = ?auto_74107 ?auto_74109 ) ) ( not ( = ?auto_74107 ?auto_74110 ) ) ( not ( = ?auto_74107 ?auto_74111 ) ) ( not ( = ?auto_74107 ?auto_74112 ) ) ( not ( = ?auto_74108 ?auto_74109 ) ) ( not ( = ?auto_74108 ?auto_74110 ) ) ( not ( = ?auto_74108 ?auto_74111 ) ) ( not ( = ?auto_74108 ?auto_74112 ) ) ( not ( = ?auto_74109 ?auto_74110 ) ) ( not ( = ?auto_74109 ?auto_74111 ) ) ( not ( = ?auto_74109 ?auto_74112 ) ) ( not ( = ?auto_74110 ?auto_74111 ) ) ( not ( = ?auto_74110 ?auto_74112 ) ) ( not ( = ?auto_74111 ?auto_74112 ) ) ( not ( = ?auto_74107 ?auto_74114 ) ) ( not ( = ?auto_74107 ?auto_74113 ) ) ( not ( = ?auto_74108 ?auto_74114 ) ) ( not ( = ?auto_74108 ?auto_74113 ) ) ( not ( = ?auto_74109 ?auto_74114 ) ) ( not ( = ?auto_74109 ?auto_74113 ) ) ( not ( = ?auto_74110 ?auto_74114 ) ) ( not ( = ?auto_74110 ?auto_74113 ) ) ( not ( = ?auto_74111 ?auto_74114 ) ) ( not ( = ?auto_74111 ?auto_74113 ) ) ( not ( = ?auto_74112 ?auto_74114 ) ) ( not ( = ?auto_74112 ?auto_74113 ) ) ( not ( = ?auto_74114 ?auto_74113 ) ) ( ON ?auto_74114 ?auto_74112 ) ( ON ?auto_74113 ?auto_74114 ) ( CLEAR ?auto_74113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74107 ?auto_74108 ?auto_74109 ?auto_74110 ?auto_74111 ?auto_74112 ?auto_74114 )
      ( MAKE-5PILE ?auto_74107 ?auto_74108 ?auto_74109 ?auto_74110 ?auto_74111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74118 - BLOCK
      ?auto_74119 - BLOCK
      ?auto_74120 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74120 ) ( CLEAR ?auto_74119 ) ( ON-TABLE ?auto_74118 ) ( ON ?auto_74119 ?auto_74118 ) ( not ( = ?auto_74118 ?auto_74119 ) ) ( not ( = ?auto_74118 ?auto_74120 ) ) ( not ( = ?auto_74119 ?auto_74120 ) ) )
    :subtasks
    ( ( !STACK ?auto_74120 ?auto_74119 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74121 - BLOCK
      ?auto_74122 - BLOCK
      ?auto_74123 - BLOCK
    )
    :vars
    (
      ?auto_74124 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74122 ) ( ON-TABLE ?auto_74121 ) ( ON ?auto_74122 ?auto_74121 ) ( not ( = ?auto_74121 ?auto_74122 ) ) ( not ( = ?auto_74121 ?auto_74123 ) ) ( not ( = ?auto_74122 ?auto_74123 ) ) ( ON ?auto_74123 ?auto_74124 ) ( CLEAR ?auto_74123 ) ( HAND-EMPTY ) ( not ( = ?auto_74121 ?auto_74124 ) ) ( not ( = ?auto_74122 ?auto_74124 ) ) ( not ( = ?auto_74123 ?auto_74124 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74123 ?auto_74124 )
      ( MAKE-3PILE ?auto_74121 ?auto_74122 ?auto_74123 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74125 - BLOCK
      ?auto_74126 - BLOCK
      ?auto_74127 - BLOCK
    )
    :vars
    (
      ?auto_74128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74125 ) ( not ( = ?auto_74125 ?auto_74126 ) ) ( not ( = ?auto_74125 ?auto_74127 ) ) ( not ( = ?auto_74126 ?auto_74127 ) ) ( ON ?auto_74127 ?auto_74128 ) ( CLEAR ?auto_74127 ) ( not ( = ?auto_74125 ?auto_74128 ) ) ( not ( = ?auto_74126 ?auto_74128 ) ) ( not ( = ?auto_74127 ?auto_74128 ) ) ( HOLDING ?auto_74126 ) ( CLEAR ?auto_74125 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74125 ?auto_74126 )
      ( MAKE-3PILE ?auto_74125 ?auto_74126 ?auto_74127 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74129 - BLOCK
      ?auto_74130 - BLOCK
      ?auto_74131 - BLOCK
    )
    :vars
    (
      ?auto_74132 - BLOCK
      ?auto_74133 - BLOCK
      ?auto_74134 - BLOCK
      ?auto_74136 - BLOCK
      ?auto_74135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74129 ) ( not ( = ?auto_74129 ?auto_74130 ) ) ( not ( = ?auto_74129 ?auto_74131 ) ) ( not ( = ?auto_74130 ?auto_74131 ) ) ( ON ?auto_74131 ?auto_74132 ) ( not ( = ?auto_74129 ?auto_74132 ) ) ( not ( = ?auto_74130 ?auto_74132 ) ) ( not ( = ?auto_74131 ?auto_74132 ) ) ( CLEAR ?auto_74129 ) ( ON ?auto_74130 ?auto_74131 ) ( CLEAR ?auto_74130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74133 ) ( ON ?auto_74134 ?auto_74133 ) ( ON ?auto_74136 ?auto_74134 ) ( ON ?auto_74135 ?auto_74136 ) ( ON ?auto_74132 ?auto_74135 ) ( not ( = ?auto_74133 ?auto_74134 ) ) ( not ( = ?auto_74133 ?auto_74136 ) ) ( not ( = ?auto_74133 ?auto_74135 ) ) ( not ( = ?auto_74133 ?auto_74132 ) ) ( not ( = ?auto_74133 ?auto_74131 ) ) ( not ( = ?auto_74133 ?auto_74130 ) ) ( not ( = ?auto_74134 ?auto_74136 ) ) ( not ( = ?auto_74134 ?auto_74135 ) ) ( not ( = ?auto_74134 ?auto_74132 ) ) ( not ( = ?auto_74134 ?auto_74131 ) ) ( not ( = ?auto_74134 ?auto_74130 ) ) ( not ( = ?auto_74136 ?auto_74135 ) ) ( not ( = ?auto_74136 ?auto_74132 ) ) ( not ( = ?auto_74136 ?auto_74131 ) ) ( not ( = ?auto_74136 ?auto_74130 ) ) ( not ( = ?auto_74135 ?auto_74132 ) ) ( not ( = ?auto_74135 ?auto_74131 ) ) ( not ( = ?auto_74135 ?auto_74130 ) ) ( not ( = ?auto_74129 ?auto_74133 ) ) ( not ( = ?auto_74129 ?auto_74134 ) ) ( not ( = ?auto_74129 ?auto_74136 ) ) ( not ( = ?auto_74129 ?auto_74135 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74133 ?auto_74134 ?auto_74136 ?auto_74135 ?auto_74132 ?auto_74131 )
      ( MAKE-3PILE ?auto_74129 ?auto_74130 ?auto_74131 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74137 - BLOCK
      ?auto_74138 - BLOCK
      ?auto_74139 - BLOCK
    )
    :vars
    (
      ?auto_74143 - BLOCK
      ?auto_74142 - BLOCK
      ?auto_74144 - BLOCK
      ?auto_74141 - BLOCK
      ?auto_74140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74137 ?auto_74138 ) ) ( not ( = ?auto_74137 ?auto_74139 ) ) ( not ( = ?auto_74138 ?auto_74139 ) ) ( ON ?auto_74139 ?auto_74143 ) ( not ( = ?auto_74137 ?auto_74143 ) ) ( not ( = ?auto_74138 ?auto_74143 ) ) ( not ( = ?auto_74139 ?auto_74143 ) ) ( ON ?auto_74138 ?auto_74139 ) ( CLEAR ?auto_74138 ) ( ON-TABLE ?auto_74142 ) ( ON ?auto_74144 ?auto_74142 ) ( ON ?auto_74141 ?auto_74144 ) ( ON ?auto_74140 ?auto_74141 ) ( ON ?auto_74143 ?auto_74140 ) ( not ( = ?auto_74142 ?auto_74144 ) ) ( not ( = ?auto_74142 ?auto_74141 ) ) ( not ( = ?auto_74142 ?auto_74140 ) ) ( not ( = ?auto_74142 ?auto_74143 ) ) ( not ( = ?auto_74142 ?auto_74139 ) ) ( not ( = ?auto_74142 ?auto_74138 ) ) ( not ( = ?auto_74144 ?auto_74141 ) ) ( not ( = ?auto_74144 ?auto_74140 ) ) ( not ( = ?auto_74144 ?auto_74143 ) ) ( not ( = ?auto_74144 ?auto_74139 ) ) ( not ( = ?auto_74144 ?auto_74138 ) ) ( not ( = ?auto_74141 ?auto_74140 ) ) ( not ( = ?auto_74141 ?auto_74143 ) ) ( not ( = ?auto_74141 ?auto_74139 ) ) ( not ( = ?auto_74141 ?auto_74138 ) ) ( not ( = ?auto_74140 ?auto_74143 ) ) ( not ( = ?auto_74140 ?auto_74139 ) ) ( not ( = ?auto_74140 ?auto_74138 ) ) ( not ( = ?auto_74137 ?auto_74142 ) ) ( not ( = ?auto_74137 ?auto_74144 ) ) ( not ( = ?auto_74137 ?auto_74141 ) ) ( not ( = ?auto_74137 ?auto_74140 ) ) ( HOLDING ?auto_74137 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74137 )
      ( MAKE-3PILE ?auto_74137 ?auto_74138 ?auto_74139 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74145 - BLOCK
      ?auto_74146 - BLOCK
      ?auto_74147 - BLOCK
    )
    :vars
    (
      ?auto_74149 - BLOCK
      ?auto_74151 - BLOCK
      ?auto_74152 - BLOCK
      ?auto_74150 - BLOCK
      ?auto_74148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74145 ?auto_74146 ) ) ( not ( = ?auto_74145 ?auto_74147 ) ) ( not ( = ?auto_74146 ?auto_74147 ) ) ( ON ?auto_74147 ?auto_74149 ) ( not ( = ?auto_74145 ?auto_74149 ) ) ( not ( = ?auto_74146 ?auto_74149 ) ) ( not ( = ?auto_74147 ?auto_74149 ) ) ( ON ?auto_74146 ?auto_74147 ) ( ON-TABLE ?auto_74151 ) ( ON ?auto_74152 ?auto_74151 ) ( ON ?auto_74150 ?auto_74152 ) ( ON ?auto_74148 ?auto_74150 ) ( ON ?auto_74149 ?auto_74148 ) ( not ( = ?auto_74151 ?auto_74152 ) ) ( not ( = ?auto_74151 ?auto_74150 ) ) ( not ( = ?auto_74151 ?auto_74148 ) ) ( not ( = ?auto_74151 ?auto_74149 ) ) ( not ( = ?auto_74151 ?auto_74147 ) ) ( not ( = ?auto_74151 ?auto_74146 ) ) ( not ( = ?auto_74152 ?auto_74150 ) ) ( not ( = ?auto_74152 ?auto_74148 ) ) ( not ( = ?auto_74152 ?auto_74149 ) ) ( not ( = ?auto_74152 ?auto_74147 ) ) ( not ( = ?auto_74152 ?auto_74146 ) ) ( not ( = ?auto_74150 ?auto_74148 ) ) ( not ( = ?auto_74150 ?auto_74149 ) ) ( not ( = ?auto_74150 ?auto_74147 ) ) ( not ( = ?auto_74150 ?auto_74146 ) ) ( not ( = ?auto_74148 ?auto_74149 ) ) ( not ( = ?auto_74148 ?auto_74147 ) ) ( not ( = ?auto_74148 ?auto_74146 ) ) ( not ( = ?auto_74145 ?auto_74151 ) ) ( not ( = ?auto_74145 ?auto_74152 ) ) ( not ( = ?auto_74145 ?auto_74150 ) ) ( not ( = ?auto_74145 ?auto_74148 ) ) ( ON ?auto_74145 ?auto_74146 ) ( CLEAR ?auto_74145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74151 ?auto_74152 ?auto_74150 ?auto_74148 ?auto_74149 ?auto_74147 ?auto_74146 )
      ( MAKE-3PILE ?auto_74145 ?auto_74146 ?auto_74147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74157 - BLOCK
      ?auto_74158 - BLOCK
      ?auto_74159 - BLOCK
      ?auto_74160 - BLOCK
    )
    :vars
    (
      ?auto_74161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74161 ?auto_74160 ) ( CLEAR ?auto_74161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74157 ) ( ON ?auto_74158 ?auto_74157 ) ( ON ?auto_74159 ?auto_74158 ) ( ON ?auto_74160 ?auto_74159 ) ( not ( = ?auto_74157 ?auto_74158 ) ) ( not ( = ?auto_74157 ?auto_74159 ) ) ( not ( = ?auto_74157 ?auto_74160 ) ) ( not ( = ?auto_74157 ?auto_74161 ) ) ( not ( = ?auto_74158 ?auto_74159 ) ) ( not ( = ?auto_74158 ?auto_74160 ) ) ( not ( = ?auto_74158 ?auto_74161 ) ) ( not ( = ?auto_74159 ?auto_74160 ) ) ( not ( = ?auto_74159 ?auto_74161 ) ) ( not ( = ?auto_74160 ?auto_74161 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74161 ?auto_74160 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74162 - BLOCK
      ?auto_74163 - BLOCK
      ?auto_74164 - BLOCK
      ?auto_74165 - BLOCK
    )
    :vars
    (
      ?auto_74166 - BLOCK
      ?auto_74167 - BLOCK
      ?auto_74168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74166 ?auto_74165 ) ( CLEAR ?auto_74166 ) ( ON-TABLE ?auto_74162 ) ( ON ?auto_74163 ?auto_74162 ) ( ON ?auto_74164 ?auto_74163 ) ( ON ?auto_74165 ?auto_74164 ) ( not ( = ?auto_74162 ?auto_74163 ) ) ( not ( = ?auto_74162 ?auto_74164 ) ) ( not ( = ?auto_74162 ?auto_74165 ) ) ( not ( = ?auto_74162 ?auto_74166 ) ) ( not ( = ?auto_74163 ?auto_74164 ) ) ( not ( = ?auto_74163 ?auto_74165 ) ) ( not ( = ?auto_74163 ?auto_74166 ) ) ( not ( = ?auto_74164 ?auto_74165 ) ) ( not ( = ?auto_74164 ?auto_74166 ) ) ( not ( = ?auto_74165 ?auto_74166 ) ) ( HOLDING ?auto_74167 ) ( CLEAR ?auto_74168 ) ( not ( = ?auto_74162 ?auto_74167 ) ) ( not ( = ?auto_74162 ?auto_74168 ) ) ( not ( = ?auto_74163 ?auto_74167 ) ) ( not ( = ?auto_74163 ?auto_74168 ) ) ( not ( = ?auto_74164 ?auto_74167 ) ) ( not ( = ?auto_74164 ?auto_74168 ) ) ( not ( = ?auto_74165 ?auto_74167 ) ) ( not ( = ?auto_74165 ?auto_74168 ) ) ( not ( = ?auto_74166 ?auto_74167 ) ) ( not ( = ?auto_74166 ?auto_74168 ) ) ( not ( = ?auto_74167 ?auto_74168 ) ) )
    :subtasks
    ( ( !STACK ?auto_74167 ?auto_74168 )
      ( MAKE-4PILE ?auto_74162 ?auto_74163 ?auto_74164 ?auto_74165 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74169 - BLOCK
      ?auto_74170 - BLOCK
      ?auto_74171 - BLOCK
      ?auto_74172 - BLOCK
    )
    :vars
    (
      ?auto_74174 - BLOCK
      ?auto_74173 - BLOCK
      ?auto_74175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74174 ?auto_74172 ) ( ON-TABLE ?auto_74169 ) ( ON ?auto_74170 ?auto_74169 ) ( ON ?auto_74171 ?auto_74170 ) ( ON ?auto_74172 ?auto_74171 ) ( not ( = ?auto_74169 ?auto_74170 ) ) ( not ( = ?auto_74169 ?auto_74171 ) ) ( not ( = ?auto_74169 ?auto_74172 ) ) ( not ( = ?auto_74169 ?auto_74174 ) ) ( not ( = ?auto_74170 ?auto_74171 ) ) ( not ( = ?auto_74170 ?auto_74172 ) ) ( not ( = ?auto_74170 ?auto_74174 ) ) ( not ( = ?auto_74171 ?auto_74172 ) ) ( not ( = ?auto_74171 ?auto_74174 ) ) ( not ( = ?auto_74172 ?auto_74174 ) ) ( CLEAR ?auto_74173 ) ( not ( = ?auto_74169 ?auto_74175 ) ) ( not ( = ?auto_74169 ?auto_74173 ) ) ( not ( = ?auto_74170 ?auto_74175 ) ) ( not ( = ?auto_74170 ?auto_74173 ) ) ( not ( = ?auto_74171 ?auto_74175 ) ) ( not ( = ?auto_74171 ?auto_74173 ) ) ( not ( = ?auto_74172 ?auto_74175 ) ) ( not ( = ?auto_74172 ?auto_74173 ) ) ( not ( = ?auto_74174 ?auto_74175 ) ) ( not ( = ?auto_74174 ?auto_74173 ) ) ( not ( = ?auto_74175 ?auto_74173 ) ) ( ON ?auto_74175 ?auto_74174 ) ( CLEAR ?auto_74175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74169 ?auto_74170 ?auto_74171 ?auto_74172 ?auto_74174 )
      ( MAKE-4PILE ?auto_74169 ?auto_74170 ?auto_74171 ?auto_74172 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74176 - BLOCK
      ?auto_74177 - BLOCK
      ?auto_74178 - BLOCK
      ?auto_74179 - BLOCK
    )
    :vars
    (
      ?auto_74180 - BLOCK
      ?auto_74181 - BLOCK
      ?auto_74182 - BLOCK
      ?auto_74183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74180 ?auto_74179 ) ( ON-TABLE ?auto_74176 ) ( ON ?auto_74177 ?auto_74176 ) ( ON ?auto_74178 ?auto_74177 ) ( ON ?auto_74179 ?auto_74178 ) ( not ( = ?auto_74176 ?auto_74177 ) ) ( not ( = ?auto_74176 ?auto_74178 ) ) ( not ( = ?auto_74176 ?auto_74179 ) ) ( not ( = ?auto_74176 ?auto_74180 ) ) ( not ( = ?auto_74177 ?auto_74178 ) ) ( not ( = ?auto_74177 ?auto_74179 ) ) ( not ( = ?auto_74177 ?auto_74180 ) ) ( not ( = ?auto_74178 ?auto_74179 ) ) ( not ( = ?auto_74178 ?auto_74180 ) ) ( not ( = ?auto_74179 ?auto_74180 ) ) ( not ( = ?auto_74176 ?auto_74181 ) ) ( not ( = ?auto_74176 ?auto_74182 ) ) ( not ( = ?auto_74177 ?auto_74181 ) ) ( not ( = ?auto_74177 ?auto_74182 ) ) ( not ( = ?auto_74178 ?auto_74181 ) ) ( not ( = ?auto_74178 ?auto_74182 ) ) ( not ( = ?auto_74179 ?auto_74181 ) ) ( not ( = ?auto_74179 ?auto_74182 ) ) ( not ( = ?auto_74180 ?auto_74181 ) ) ( not ( = ?auto_74180 ?auto_74182 ) ) ( not ( = ?auto_74181 ?auto_74182 ) ) ( ON ?auto_74181 ?auto_74180 ) ( CLEAR ?auto_74181 ) ( HOLDING ?auto_74182 ) ( CLEAR ?auto_74183 ) ( ON-TABLE ?auto_74183 ) ( not ( = ?auto_74183 ?auto_74182 ) ) ( not ( = ?auto_74176 ?auto_74183 ) ) ( not ( = ?auto_74177 ?auto_74183 ) ) ( not ( = ?auto_74178 ?auto_74183 ) ) ( not ( = ?auto_74179 ?auto_74183 ) ) ( not ( = ?auto_74180 ?auto_74183 ) ) ( not ( = ?auto_74181 ?auto_74183 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74183 ?auto_74182 )
      ( MAKE-4PILE ?auto_74176 ?auto_74177 ?auto_74178 ?auto_74179 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75238 - BLOCK
      ?auto_75239 - BLOCK
      ?auto_75240 - BLOCK
      ?auto_75241 - BLOCK
    )
    :vars
    (
      ?auto_75242 - BLOCK
      ?auto_75244 - BLOCK
      ?auto_75243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75242 ?auto_75241 ) ( ON-TABLE ?auto_75238 ) ( ON ?auto_75239 ?auto_75238 ) ( ON ?auto_75240 ?auto_75239 ) ( ON ?auto_75241 ?auto_75240 ) ( not ( = ?auto_75238 ?auto_75239 ) ) ( not ( = ?auto_75238 ?auto_75240 ) ) ( not ( = ?auto_75238 ?auto_75241 ) ) ( not ( = ?auto_75238 ?auto_75242 ) ) ( not ( = ?auto_75239 ?auto_75240 ) ) ( not ( = ?auto_75239 ?auto_75241 ) ) ( not ( = ?auto_75239 ?auto_75242 ) ) ( not ( = ?auto_75240 ?auto_75241 ) ) ( not ( = ?auto_75240 ?auto_75242 ) ) ( not ( = ?auto_75241 ?auto_75242 ) ) ( not ( = ?auto_75238 ?auto_75244 ) ) ( not ( = ?auto_75238 ?auto_75243 ) ) ( not ( = ?auto_75239 ?auto_75244 ) ) ( not ( = ?auto_75239 ?auto_75243 ) ) ( not ( = ?auto_75240 ?auto_75244 ) ) ( not ( = ?auto_75240 ?auto_75243 ) ) ( not ( = ?auto_75241 ?auto_75244 ) ) ( not ( = ?auto_75241 ?auto_75243 ) ) ( not ( = ?auto_75242 ?auto_75244 ) ) ( not ( = ?auto_75242 ?auto_75243 ) ) ( not ( = ?auto_75244 ?auto_75243 ) ) ( ON ?auto_75244 ?auto_75242 ) ( ON ?auto_75243 ?auto_75244 ) ( CLEAR ?auto_75243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75238 ?auto_75239 ?auto_75240 ?auto_75241 ?auto_75242 ?auto_75244 )
      ( MAKE-4PILE ?auto_75238 ?auto_75239 ?auto_75240 ?auto_75241 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74192 - BLOCK
      ?auto_74193 - BLOCK
      ?auto_74194 - BLOCK
      ?auto_74195 - BLOCK
    )
    :vars
    (
      ?auto_74199 - BLOCK
      ?auto_74197 - BLOCK
      ?auto_74196 - BLOCK
      ?auto_74198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74199 ?auto_74195 ) ( ON-TABLE ?auto_74192 ) ( ON ?auto_74193 ?auto_74192 ) ( ON ?auto_74194 ?auto_74193 ) ( ON ?auto_74195 ?auto_74194 ) ( not ( = ?auto_74192 ?auto_74193 ) ) ( not ( = ?auto_74192 ?auto_74194 ) ) ( not ( = ?auto_74192 ?auto_74195 ) ) ( not ( = ?auto_74192 ?auto_74199 ) ) ( not ( = ?auto_74193 ?auto_74194 ) ) ( not ( = ?auto_74193 ?auto_74195 ) ) ( not ( = ?auto_74193 ?auto_74199 ) ) ( not ( = ?auto_74194 ?auto_74195 ) ) ( not ( = ?auto_74194 ?auto_74199 ) ) ( not ( = ?auto_74195 ?auto_74199 ) ) ( not ( = ?auto_74192 ?auto_74197 ) ) ( not ( = ?auto_74192 ?auto_74196 ) ) ( not ( = ?auto_74193 ?auto_74197 ) ) ( not ( = ?auto_74193 ?auto_74196 ) ) ( not ( = ?auto_74194 ?auto_74197 ) ) ( not ( = ?auto_74194 ?auto_74196 ) ) ( not ( = ?auto_74195 ?auto_74197 ) ) ( not ( = ?auto_74195 ?auto_74196 ) ) ( not ( = ?auto_74199 ?auto_74197 ) ) ( not ( = ?auto_74199 ?auto_74196 ) ) ( not ( = ?auto_74197 ?auto_74196 ) ) ( ON ?auto_74197 ?auto_74199 ) ( not ( = ?auto_74198 ?auto_74196 ) ) ( not ( = ?auto_74192 ?auto_74198 ) ) ( not ( = ?auto_74193 ?auto_74198 ) ) ( not ( = ?auto_74194 ?auto_74198 ) ) ( not ( = ?auto_74195 ?auto_74198 ) ) ( not ( = ?auto_74199 ?auto_74198 ) ) ( not ( = ?auto_74197 ?auto_74198 ) ) ( ON ?auto_74196 ?auto_74197 ) ( CLEAR ?auto_74196 ) ( HOLDING ?auto_74198 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74198 )
      ( MAKE-4PILE ?auto_74192 ?auto_74193 ?auto_74194 ?auto_74195 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74200 - BLOCK
      ?auto_74201 - BLOCK
      ?auto_74202 - BLOCK
      ?auto_74203 - BLOCK
    )
    :vars
    (
      ?auto_74207 - BLOCK
      ?auto_74204 - BLOCK
      ?auto_74205 - BLOCK
      ?auto_74206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74207 ?auto_74203 ) ( ON-TABLE ?auto_74200 ) ( ON ?auto_74201 ?auto_74200 ) ( ON ?auto_74202 ?auto_74201 ) ( ON ?auto_74203 ?auto_74202 ) ( not ( = ?auto_74200 ?auto_74201 ) ) ( not ( = ?auto_74200 ?auto_74202 ) ) ( not ( = ?auto_74200 ?auto_74203 ) ) ( not ( = ?auto_74200 ?auto_74207 ) ) ( not ( = ?auto_74201 ?auto_74202 ) ) ( not ( = ?auto_74201 ?auto_74203 ) ) ( not ( = ?auto_74201 ?auto_74207 ) ) ( not ( = ?auto_74202 ?auto_74203 ) ) ( not ( = ?auto_74202 ?auto_74207 ) ) ( not ( = ?auto_74203 ?auto_74207 ) ) ( not ( = ?auto_74200 ?auto_74204 ) ) ( not ( = ?auto_74200 ?auto_74205 ) ) ( not ( = ?auto_74201 ?auto_74204 ) ) ( not ( = ?auto_74201 ?auto_74205 ) ) ( not ( = ?auto_74202 ?auto_74204 ) ) ( not ( = ?auto_74202 ?auto_74205 ) ) ( not ( = ?auto_74203 ?auto_74204 ) ) ( not ( = ?auto_74203 ?auto_74205 ) ) ( not ( = ?auto_74207 ?auto_74204 ) ) ( not ( = ?auto_74207 ?auto_74205 ) ) ( not ( = ?auto_74204 ?auto_74205 ) ) ( ON ?auto_74204 ?auto_74207 ) ( not ( = ?auto_74206 ?auto_74205 ) ) ( not ( = ?auto_74200 ?auto_74206 ) ) ( not ( = ?auto_74201 ?auto_74206 ) ) ( not ( = ?auto_74202 ?auto_74206 ) ) ( not ( = ?auto_74203 ?auto_74206 ) ) ( not ( = ?auto_74207 ?auto_74206 ) ) ( not ( = ?auto_74204 ?auto_74206 ) ) ( ON ?auto_74205 ?auto_74204 ) ( ON ?auto_74206 ?auto_74205 ) ( CLEAR ?auto_74206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74200 ?auto_74201 ?auto_74202 ?auto_74203 ?auto_74207 ?auto_74204 ?auto_74205 )
      ( MAKE-4PILE ?auto_74200 ?auto_74201 ?auto_74202 ?auto_74203 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74212 - BLOCK
      ?auto_74213 - BLOCK
      ?auto_74214 - BLOCK
      ?auto_74215 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74215 ) ( CLEAR ?auto_74214 ) ( ON-TABLE ?auto_74212 ) ( ON ?auto_74213 ?auto_74212 ) ( ON ?auto_74214 ?auto_74213 ) ( not ( = ?auto_74212 ?auto_74213 ) ) ( not ( = ?auto_74212 ?auto_74214 ) ) ( not ( = ?auto_74212 ?auto_74215 ) ) ( not ( = ?auto_74213 ?auto_74214 ) ) ( not ( = ?auto_74213 ?auto_74215 ) ) ( not ( = ?auto_74214 ?auto_74215 ) ) )
    :subtasks
    ( ( !STACK ?auto_74215 ?auto_74214 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74216 - BLOCK
      ?auto_74217 - BLOCK
      ?auto_74218 - BLOCK
      ?auto_74219 - BLOCK
    )
    :vars
    (
      ?auto_74220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74218 ) ( ON-TABLE ?auto_74216 ) ( ON ?auto_74217 ?auto_74216 ) ( ON ?auto_74218 ?auto_74217 ) ( not ( = ?auto_74216 ?auto_74217 ) ) ( not ( = ?auto_74216 ?auto_74218 ) ) ( not ( = ?auto_74216 ?auto_74219 ) ) ( not ( = ?auto_74217 ?auto_74218 ) ) ( not ( = ?auto_74217 ?auto_74219 ) ) ( not ( = ?auto_74218 ?auto_74219 ) ) ( ON ?auto_74219 ?auto_74220 ) ( CLEAR ?auto_74219 ) ( HAND-EMPTY ) ( not ( = ?auto_74216 ?auto_74220 ) ) ( not ( = ?auto_74217 ?auto_74220 ) ) ( not ( = ?auto_74218 ?auto_74220 ) ) ( not ( = ?auto_74219 ?auto_74220 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74219 ?auto_74220 )
      ( MAKE-4PILE ?auto_74216 ?auto_74217 ?auto_74218 ?auto_74219 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74221 - BLOCK
      ?auto_74222 - BLOCK
      ?auto_74223 - BLOCK
      ?auto_74224 - BLOCK
    )
    :vars
    (
      ?auto_74225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74221 ) ( ON ?auto_74222 ?auto_74221 ) ( not ( = ?auto_74221 ?auto_74222 ) ) ( not ( = ?auto_74221 ?auto_74223 ) ) ( not ( = ?auto_74221 ?auto_74224 ) ) ( not ( = ?auto_74222 ?auto_74223 ) ) ( not ( = ?auto_74222 ?auto_74224 ) ) ( not ( = ?auto_74223 ?auto_74224 ) ) ( ON ?auto_74224 ?auto_74225 ) ( CLEAR ?auto_74224 ) ( not ( = ?auto_74221 ?auto_74225 ) ) ( not ( = ?auto_74222 ?auto_74225 ) ) ( not ( = ?auto_74223 ?auto_74225 ) ) ( not ( = ?auto_74224 ?auto_74225 ) ) ( HOLDING ?auto_74223 ) ( CLEAR ?auto_74222 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74221 ?auto_74222 ?auto_74223 )
      ( MAKE-4PILE ?auto_74221 ?auto_74222 ?auto_74223 ?auto_74224 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74226 - BLOCK
      ?auto_74227 - BLOCK
      ?auto_74228 - BLOCK
      ?auto_74229 - BLOCK
    )
    :vars
    (
      ?auto_74230 - BLOCK
      ?auto_74232 - BLOCK
      ?auto_74233 - BLOCK
      ?auto_74231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74226 ) ( ON ?auto_74227 ?auto_74226 ) ( not ( = ?auto_74226 ?auto_74227 ) ) ( not ( = ?auto_74226 ?auto_74228 ) ) ( not ( = ?auto_74226 ?auto_74229 ) ) ( not ( = ?auto_74227 ?auto_74228 ) ) ( not ( = ?auto_74227 ?auto_74229 ) ) ( not ( = ?auto_74228 ?auto_74229 ) ) ( ON ?auto_74229 ?auto_74230 ) ( not ( = ?auto_74226 ?auto_74230 ) ) ( not ( = ?auto_74227 ?auto_74230 ) ) ( not ( = ?auto_74228 ?auto_74230 ) ) ( not ( = ?auto_74229 ?auto_74230 ) ) ( CLEAR ?auto_74227 ) ( ON ?auto_74228 ?auto_74229 ) ( CLEAR ?auto_74228 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74232 ) ( ON ?auto_74233 ?auto_74232 ) ( ON ?auto_74231 ?auto_74233 ) ( ON ?auto_74230 ?auto_74231 ) ( not ( = ?auto_74232 ?auto_74233 ) ) ( not ( = ?auto_74232 ?auto_74231 ) ) ( not ( = ?auto_74232 ?auto_74230 ) ) ( not ( = ?auto_74232 ?auto_74229 ) ) ( not ( = ?auto_74232 ?auto_74228 ) ) ( not ( = ?auto_74233 ?auto_74231 ) ) ( not ( = ?auto_74233 ?auto_74230 ) ) ( not ( = ?auto_74233 ?auto_74229 ) ) ( not ( = ?auto_74233 ?auto_74228 ) ) ( not ( = ?auto_74231 ?auto_74230 ) ) ( not ( = ?auto_74231 ?auto_74229 ) ) ( not ( = ?auto_74231 ?auto_74228 ) ) ( not ( = ?auto_74226 ?auto_74232 ) ) ( not ( = ?auto_74226 ?auto_74233 ) ) ( not ( = ?auto_74226 ?auto_74231 ) ) ( not ( = ?auto_74227 ?auto_74232 ) ) ( not ( = ?auto_74227 ?auto_74233 ) ) ( not ( = ?auto_74227 ?auto_74231 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74232 ?auto_74233 ?auto_74231 ?auto_74230 ?auto_74229 )
      ( MAKE-4PILE ?auto_74226 ?auto_74227 ?auto_74228 ?auto_74229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74234 - BLOCK
      ?auto_74235 - BLOCK
      ?auto_74236 - BLOCK
      ?auto_74237 - BLOCK
    )
    :vars
    (
      ?auto_74238 - BLOCK
      ?auto_74240 - BLOCK
      ?auto_74239 - BLOCK
      ?auto_74241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74234 ) ( not ( = ?auto_74234 ?auto_74235 ) ) ( not ( = ?auto_74234 ?auto_74236 ) ) ( not ( = ?auto_74234 ?auto_74237 ) ) ( not ( = ?auto_74235 ?auto_74236 ) ) ( not ( = ?auto_74235 ?auto_74237 ) ) ( not ( = ?auto_74236 ?auto_74237 ) ) ( ON ?auto_74237 ?auto_74238 ) ( not ( = ?auto_74234 ?auto_74238 ) ) ( not ( = ?auto_74235 ?auto_74238 ) ) ( not ( = ?auto_74236 ?auto_74238 ) ) ( not ( = ?auto_74237 ?auto_74238 ) ) ( ON ?auto_74236 ?auto_74237 ) ( CLEAR ?auto_74236 ) ( ON-TABLE ?auto_74240 ) ( ON ?auto_74239 ?auto_74240 ) ( ON ?auto_74241 ?auto_74239 ) ( ON ?auto_74238 ?auto_74241 ) ( not ( = ?auto_74240 ?auto_74239 ) ) ( not ( = ?auto_74240 ?auto_74241 ) ) ( not ( = ?auto_74240 ?auto_74238 ) ) ( not ( = ?auto_74240 ?auto_74237 ) ) ( not ( = ?auto_74240 ?auto_74236 ) ) ( not ( = ?auto_74239 ?auto_74241 ) ) ( not ( = ?auto_74239 ?auto_74238 ) ) ( not ( = ?auto_74239 ?auto_74237 ) ) ( not ( = ?auto_74239 ?auto_74236 ) ) ( not ( = ?auto_74241 ?auto_74238 ) ) ( not ( = ?auto_74241 ?auto_74237 ) ) ( not ( = ?auto_74241 ?auto_74236 ) ) ( not ( = ?auto_74234 ?auto_74240 ) ) ( not ( = ?auto_74234 ?auto_74239 ) ) ( not ( = ?auto_74234 ?auto_74241 ) ) ( not ( = ?auto_74235 ?auto_74240 ) ) ( not ( = ?auto_74235 ?auto_74239 ) ) ( not ( = ?auto_74235 ?auto_74241 ) ) ( HOLDING ?auto_74235 ) ( CLEAR ?auto_74234 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74234 ?auto_74235 )
      ( MAKE-4PILE ?auto_74234 ?auto_74235 ?auto_74236 ?auto_74237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74242 - BLOCK
      ?auto_74243 - BLOCK
      ?auto_74244 - BLOCK
      ?auto_74245 - BLOCK
    )
    :vars
    (
      ?auto_74247 - BLOCK
      ?auto_74249 - BLOCK
      ?auto_74246 - BLOCK
      ?auto_74248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74242 ) ( not ( = ?auto_74242 ?auto_74243 ) ) ( not ( = ?auto_74242 ?auto_74244 ) ) ( not ( = ?auto_74242 ?auto_74245 ) ) ( not ( = ?auto_74243 ?auto_74244 ) ) ( not ( = ?auto_74243 ?auto_74245 ) ) ( not ( = ?auto_74244 ?auto_74245 ) ) ( ON ?auto_74245 ?auto_74247 ) ( not ( = ?auto_74242 ?auto_74247 ) ) ( not ( = ?auto_74243 ?auto_74247 ) ) ( not ( = ?auto_74244 ?auto_74247 ) ) ( not ( = ?auto_74245 ?auto_74247 ) ) ( ON ?auto_74244 ?auto_74245 ) ( ON-TABLE ?auto_74249 ) ( ON ?auto_74246 ?auto_74249 ) ( ON ?auto_74248 ?auto_74246 ) ( ON ?auto_74247 ?auto_74248 ) ( not ( = ?auto_74249 ?auto_74246 ) ) ( not ( = ?auto_74249 ?auto_74248 ) ) ( not ( = ?auto_74249 ?auto_74247 ) ) ( not ( = ?auto_74249 ?auto_74245 ) ) ( not ( = ?auto_74249 ?auto_74244 ) ) ( not ( = ?auto_74246 ?auto_74248 ) ) ( not ( = ?auto_74246 ?auto_74247 ) ) ( not ( = ?auto_74246 ?auto_74245 ) ) ( not ( = ?auto_74246 ?auto_74244 ) ) ( not ( = ?auto_74248 ?auto_74247 ) ) ( not ( = ?auto_74248 ?auto_74245 ) ) ( not ( = ?auto_74248 ?auto_74244 ) ) ( not ( = ?auto_74242 ?auto_74249 ) ) ( not ( = ?auto_74242 ?auto_74246 ) ) ( not ( = ?auto_74242 ?auto_74248 ) ) ( not ( = ?auto_74243 ?auto_74249 ) ) ( not ( = ?auto_74243 ?auto_74246 ) ) ( not ( = ?auto_74243 ?auto_74248 ) ) ( CLEAR ?auto_74242 ) ( ON ?auto_74243 ?auto_74244 ) ( CLEAR ?auto_74243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74249 ?auto_74246 ?auto_74248 ?auto_74247 ?auto_74245 ?auto_74244 )
      ( MAKE-4PILE ?auto_74242 ?auto_74243 ?auto_74244 ?auto_74245 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74250 - BLOCK
      ?auto_74251 - BLOCK
      ?auto_74252 - BLOCK
      ?auto_74253 - BLOCK
    )
    :vars
    (
      ?auto_74255 - BLOCK
      ?auto_74256 - BLOCK
      ?auto_74257 - BLOCK
      ?auto_74254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74250 ?auto_74251 ) ) ( not ( = ?auto_74250 ?auto_74252 ) ) ( not ( = ?auto_74250 ?auto_74253 ) ) ( not ( = ?auto_74251 ?auto_74252 ) ) ( not ( = ?auto_74251 ?auto_74253 ) ) ( not ( = ?auto_74252 ?auto_74253 ) ) ( ON ?auto_74253 ?auto_74255 ) ( not ( = ?auto_74250 ?auto_74255 ) ) ( not ( = ?auto_74251 ?auto_74255 ) ) ( not ( = ?auto_74252 ?auto_74255 ) ) ( not ( = ?auto_74253 ?auto_74255 ) ) ( ON ?auto_74252 ?auto_74253 ) ( ON-TABLE ?auto_74256 ) ( ON ?auto_74257 ?auto_74256 ) ( ON ?auto_74254 ?auto_74257 ) ( ON ?auto_74255 ?auto_74254 ) ( not ( = ?auto_74256 ?auto_74257 ) ) ( not ( = ?auto_74256 ?auto_74254 ) ) ( not ( = ?auto_74256 ?auto_74255 ) ) ( not ( = ?auto_74256 ?auto_74253 ) ) ( not ( = ?auto_74256 ?auto_74252 ) ) ( not ( = ?auto_74257 ?auto_74254 ) ) ( not ( = ?auto_74257 ?auto_74255 ) ) ( not ( = ?auto_74257 ?auto_74253 ) ) ( not ( = ?auto_74257 ?auto_74252 ) ) ( not ( = ?auto_74254 ?auto_74255 ) ) ( not ( = ?auto_74254 ?auto_74253 ) ) ( not ( = ?auto_74254 ?auto_74252 ) ) ( not ( = ?auto_74250 ?auto_74256 ) ) ( not ( = ?auto_74250 ?auto_74257 ) ) ( not ( = ?auto_74250 ?auto_74254 ) ) ( not ( = ?auto_74251 ?auto_74256 ) ) ( not ( = ?auto_74251 ?auto_74257 ) ) ( not ( = ?auto_74251 ?auto_74254 ) ) ( ON ?auto_74251 ?auto_74252 ) ( CLEAR ?auto_74251 ) ( HOLDING ?auto_74250 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74250 )
      ( MAKE-4PILE ?auto_74250 ?auto_74251 ?auto_74252 ?auto_74253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_74258 - BLOCK
      ?auto_74259 - BLOCK
      ?auto_74260 - BLOCK
      ?auto_74261 - BLOCK
    )
    :vars
    (
      ?auto_74265 - BLOCK
      ?auto_74263 - BLOCK
      ?auto_74264 - BLOCK
      ?auto_74262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74258 ?auto_74259 ) ) ( not ( = ?auto_74258 ?auto_74260 ) ) ( not ( = ?auto_74258 ?auto_74261 ) ) ( not ( = ?auto_74259 ?auto_74260 ) ) ( not ( = ?auto_74259 ?auto_74261 ) ) ( not ( = ?auto_74260 ?auto_74261 ) ) ( ON ?auto_74261 ?auto_74265 ) ( not ( = ?auto_74258 ?auto_74265 ) ) ( not ( = ?auto_74259 ?auto_74265 ) ) ( not ( = ?auto_74260 ?auto_74265 ) ) ( not ( = ?auto_74261 ?auto_74265 ) ) ( ON ?auto_74260 ?auto_74261 ) ( ON-TABLE ?auto_74263 ) ( ON ?auto_74264 ?auto_74263 ) ( ON ?auto_74262 ?auto_74264 ) ( ON ?auto_74265 ?auto_74262 ) ( not ( = ?auto_74263 ?auto_74264 ) ) ( not ( = ?auto_74263 ?auto_74262 ) ) ( not ( = ?auto_74263 ?auto_74265 ) ) ( not ( = ?auto_74263 ?auto_74261 ) ) ( not ( = ?auto_74263 ?auto_74260 ) ) ( not ( = ?auto_74264 ?auto_74262 ) ) ( not ( = ?auto_74264 ?auto_74265 ) ) ( not ( = ?auto_74264 ?auto_74261 ) ) ( not ( = ?auto_74264 ?auto_74260 ) ) ( not ( = ?auto_74262 ?auto_74265 ) ) ( not ( = ?auto_74262 ?auto_74261 ) ) ( not ( = ?auto_74262 ?auto_74260 ) ) ( not ( = ?auto_74258 ?auto_74263 ) ) ( not ( = ?auto_74258 ?auto_74264 ) ) ( not ( = ?auto_74258 ?auto_74262 ) ) ( not ( = ?auto_74259 ?auto_74263 ) ) ( not ( = ?auto_74259 ?auto_74264 ) ) ( not ( = ?auto_74259 ?auto_74262 ) ) ( ON ?auto_74259 ?auto_74260 ) ( ON ?auto_74258 ?auto_74259 ) ( CLEAR ?auto_74258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74263 ?auto_74264 ?auto_74262 ?auto_74265 ?auto_74261 ?auto_74260 ?auto_74259 )
      ( MAKE-4PILE ?auto_74258 ?auto_74259 ?auto_74260 ?auto_74261 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74269 - BLOCK
      ?auto_74270 - BLOCK
      ?auto_74271 - BLOCK
    )
    :vars
    (
      ?auto_74272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74272 ?auto_74271 ) ( CLEAR ?auto_74272 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74269 ) ( ON ?auto_74270 ?auto_74269 ) ( ON ?auto_74271 ?auto_74270 ) ( not ( = ?auto_74269 ?auto_74270 ) ) ( not ( = ?auto_74269 ?auto_74271 ) ) ( not ( = ?auto_74269 ?auto_74272 ) ) ( not ( = ?auto_74270 ?auto_74271 ) ) ( not ( = ?auto_74270 ?auto_74272 ) ) ( not ( = ?auto_74271 ?auto_74272 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74272 ?auto_74271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74273 - BLOCK
      ?auto_74274 - BLOCK
      ?auto_74275 - BLOCK
    )
    :vars
    (
      ?auto_74276 - BLOCK
      ?auto_74277 - BLOCK
      ?auto_74278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74276 ?auto_74275 ) ( CLEAR ?auto_74276 ) ( ON-TABLE ?auto_74273 ) ( ON ?auto_74274 ?auto_74273 ) ( ON ?auto_74275 ?auto_74274 ) ( not ( = ?auto_74273 ?auto_74274 ) ) ( not ( = ?auto_74273 ?auto_74275 ) ) ( not ( = ?auto_74273 ?auto_74276 ) ) ( not ( = ?auto_74274 ?auto_74275 ) ) ( not ( = ?auto_74274 ?auto_74276 ) ) ( not ( = ?auto_74275 ?auto_74276 ) ) ( HOLDING ?auto_74277 ) ( CLEAR ?auto_74278 ) ( not ( = ?auto_74273 ?auto_74277 ) ) ( not ( = ?auto_74273 ?auto_74278 ) ) ( not ( = ?auto_74274 ?auto_74277 ) ) ( not ( = ?auto_74274 ?auto_74278 ) ) ( not ( = ?auto_74275 ?auto_74277 ) ) ( not ( = ?auto_74275 ?auto_74278 ) ) ( not ( = ?auto_74276 ?auto_74277 ) ) ( not ( = ?auto_74276 ?auto_74278 ) ) ( not ( = ?auto_74277 ?auto_74278 ) ) )
    :subtasks
    ( ( !STACK ?auto_74277 ?auto_74278 )
      ( MAKE-3PILE ?auto_74273 ?auto_74274 ?auto_74275 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74279 - BLOCK
      ?auto_74280 - BLOCK
      ?auto_74281 - BLOCK
    )
    :vars
    (
      ?auto_74284 - BLOCK
      ?auto_74283 - BLOCK
      ?auto_74282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74284 ?auto_74281 ) ( ON-TABLE ?auto_74279 ) ( ON ?auto_74280 ?auto_74279 ) ( ON ?auto_74281 ?auto_74280 ) ( not ( = ?auto_74279 ?auto_74280 ) ) ( not ( = ?auto_74279 ?auto_74281 ) ) ( not ( = ?auto_74279 ?auto_74284 ) ) ( not ( = ?auto_74280 ?auto_74281 ) ) ( not ( = ?auto_74280 ?auto_74284 ) ) ( not ( = ?auto_74281 ?auto_74284 ) ) ( CLEAR ?auto_74283 ) ( not ( = ?auto_74279 ?auto_74282 ) ) ( not ( = ?auto_74279 ?auto_74283 ) ) ( not ( = ?auto_74280 ?auto_74282 ) ) ( not ( = ?auto_74280 ?auto_74283 ) ) ( not ( = ?auto_74281 ?auto_74282 ) ) ( not ( = ?auto_74281 ?auto_74283 ) ) ( not ( = ?auto_74284 ?auto_74282 ) ) ( not ( = ?auto_74284 ?auto_74283 ) ) ( not ( = ?auto_74282 ?auto_74283 ) ) ( ON ?auto_74282 ?auto_74284 ) ( CLEAR ?auto_74282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74279 ?auto_74280 ?auto_74281 ?auto_74284 )
      ( MAKE-3PILE ?auto_74279 ?auto_74280 ?auto_74281 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74285 - BLOCK
      ?auto_74286 - BLOCK
      ?auto_74287 - BLOCK
    )
    :vars
    (
      ?auto_74288 - BLOCK
      ?auto_74290 - BLOCK
      ?auto_74289 - BLOCK
      ?auto_74291 - BLOCK
      ?auto_74292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74288 ?auto_74287 ) ( ON-TABLE ?auto_74285 ) ( ON ?auto_74286 ?auto_74285 ) ( ON ?auto_74287 ?auto_74286 ) ( not ( = ?auto_74285 ?auto_74286 ) ) ( not ( = ?auto_74285 ?auto_74287 ) ) ( not ( = ?auto_74285 ?auto_74288 ) ) ( not ( = ?auto_74286 ?auto_74287 ) ) ( not ( = ?auto_74286 ?auto_74288 ) ) ( not ( = ?auto_74287 ?auto_74288 ) ) ( not ( = ?auto_74285 ?auto_74290 ) ) ( not ( = ?auto_74285 ?auto_74289 ) ) ( not ( = ?auto_74286 ?auto_74290 ) ) ( not ( = ?auto_74286 ?auto_74289 ) ) ( not ( = ?auto_74287 ?auto_74290 ) ) ( not ( = ?auto_74287 ?auto_74289 ) ) ( not ( = ?auto_74288 ?auto_74290 ) ) ( not ( = ?auto_74288 ?auto_74289 ) ) ( not ( = ?auto_74290 ?auto_74289 ) ) ( ON ?auto_74290 ?auto_74288 ) ( CLEAR ?auto_74290 ) ( HOLDING ?auto_74289 ) ( CLEAR ?auto_74291 ) ( ON-TABLE ?auto_74292 ) ( ON ?auto_74291 ?auto_74292 ) ( not ( = ?auto_74292 ?auto_74291 ) ) ( not ( = ?auto_74292 ?auto_74289 ) ) ( not ( = ?auto_74291 ?auto_74289 ) ) ( not ( = ?auto_74285 ?auto_74291 ) ) ( not ( = ?auto_74285 ?auto_74292 ) ) ( not ( = ?auto_74286 ?auto_74291 ) ) ( not ( = ?auto_74286 ?auto_74292 ) ) ( not ( = ?auto_74287 ?auto_74291 ) ) ( not ( = ?auto_74287 ?auto_74292 ) ) ( not ( = ?auto_74288 ?auto_74291 ) ) ( not ( = ?auto_74288 ?auto_74292 ) ) ( not ( = ?auto_74290 ?auto_74291 ) ) ( not ( = ?auto_74290 ?auto_74292 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74292 ?auto_74291 ?auto_74289 )
      ( MAKE-3PILE ?auto_74285 ?auto_74286 ?auto_74287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74293 - BLOCK
      ?auto_74294 - BLOCK
      ?auto_74295 - BLOCK
    )
    :vars
    (
      ?auto_74299 - BLOCK
      ?auto_74296 - BLOCK
      ?auto_74297 - BLOCK
      ?auto_74298 - BLOCK
      ?auto_74300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74299 ?auto_74295 ) ( ON-TABLE ?auto_74293 ) ( ON ?auto_74294 ?auto_74293 ) ( ON ?auto_74295 ?auto_74294 ) ( not ( = ?auto_74293 ?auto_74294 ) ) ( not ( = ?auto_74293 ?auto_74295 ) ) ( not ( = ?auto_74293 ?auto_74299 ) ) ( not ( = ?auto_74294 ?auto_74295 ) ) ( not ( = ?auto_74294 ?auto_74299 ) ) ( not ( = ?auto_74295 ?auto_74299 ) ) ( not ( = ?auto_74293 ?auto_74296 ) ) ( not ( = ?auto_74293 ?auto_74297 ) ) ( not ( = ?auto_74294 ?auto_74296 ) ) ( not ( = ?auto_74294 ?auto_74297 ) ) ( not ( = ?auto_74295 ?auto_74296 ) ) ( not ( = ?auto_74295 ?auto_74297 ) ) ( not ( = ?auto_74299 ?auto_74296 ) ) ( not ( = ?auto_74299 ?auto_74297 ) ) ( not ( = ?auto_74296 ?auto_74297 ) ) ( ON ?auto_74296 ?auto_74299 ) ( CLEAR ?auto_74298 ) ( ON-TABLE ?auto_74300 ) ( ON ?auto_74298 ?auto_74300 ) ( not ( = ?auto_74300 ?auto_74298 ) ) ( not ( = ?auto_74300 ?auto_74297 ) ) ( not ( = ?auto_74298 ?auto_74297 ) ) ( not ( = ?auto_74293 ?auto_74298 ) ) ( not ( = ?auto_74293 ?auto_74300 ) ) ( not ( = ?auto_74294 ?auto_74298 ) ) ( not ( = ?auto_74294 ?auto_74300 ) ) ( not ( = ?auto_74295 ?auto_74298 ) ) ( not ( = ?auto_74295 ?auto_74300 ) ) ( not ( = ?auto_74299 ?auto_74298 ) ) ( not ( = ?auto_74299 ?auto_74300 ) ) ( not ( = ?auto_74296 ?auto_74298 ) ) ( not ( = ?auto_74296 ?auto_74300 ) ) ( ON ?auto_74297 ?auto_74296 ) ( CLEAR ?auto_74297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74293 ?auto_74294 ?auto_74295 ?auto_74299 ?auto_74296 )
      ( MAKE-3PILE ?auto_74293 ?auto_74294 ?auto_74295 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74301 - BLOCK
      ?auto_74302 - BLOCK
      ?auto_74303 - BLOCK
    )
    :vars
    (
      ?auto_74307 - BLOCK
      ?auto_74308 - BLOCK
      ?auto_74305 - BLOCK
      ?auto_74306 - BLOCK
      ?auto_74304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74307 ?auto_74303 ) ( ON-TABLE ?auto_74301 ) ( ON ?auto_74302 ?auto_74301 ) ( ON ?auto_74303 ?auto_74302 ) ( not ( = ?auto_74301 ?auto_74302 ) ) ( not ( = ?auto_74301 ?auto_74303 ) ) ( not ( = ?auto_74301 ?auto_74307 ) ) ( not ( = ?auto_74302 ?auto_74303 ) ) ( not ( = ?auto_74302 ?auto_74307 ) ) ( not ( = ?auto_74303 ?auto_74307 ) ) ( not ( = ?auto_74301 ?auto_74308 ) ) ( not ( = ?auto_74301 ?auto_74305 ) ) ( not ( = ?auto_74302 ?auto_74308 ) ) ( not ( = ?auto_74302 ?auto_74305 ) ) ( not ( = ?auto_74303 ?auto_74308 ) ) ( not ( = ?auto_74303 ?auto_74305 ) ) ( not ( = ?auto_74307 ?auto_74308 ) ) ( not ( = ?auto_74307 ?auto_74305 ) ) ( not ( = ?auto_74308 ?auto_74305 ) ) ( ON ?auto_74308 ?auto_74307 ) ( ON-TABLE ?auto_74306 ) ( not ( = ?auto_74306 ?auto_74304 ) ) ( not ( = ?auto_74306 ?auto_74305 ) ) ( not ( = ?auto_74304 ?auto_74305 ) ) ( not ( = ?auto_74301 ?auto_74304 ) ) ( not ( = ?auto_74301 ?auto_74306 ) ) ( not ( = ?auto_74302 ?auto_74304 ) ) ( not ( = ?auto_74302 ?auto_74306 ) ) ( not ( = ?auto_74303 ?auto_74304 ) ) ( not ( = ?auto_74303 ?auto_74306 ) ) ( not ( = ?auto_74307 ?auto_74304 ) ) ( not ( = ?auto_74307 ?auto_74306 ) ) ( not ( = ?auto_74308 ?auto_74304 ) ) ( not ( = ?auto_74308 ?auto_74306 ) ) ( ON ?auto_74305 ?auto_74308 ) ( CLEAR ?auto_74305 ) ( HOLDING ?auto_74304 ) ( CLEAR ?auto_74306 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74306 ?auto_74304 )
      ( MAKE-3PILE ?auto_74301 ?auto_74302 ?auto_74303 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75486 - BLOCK
      ?auto_75487 - BLOCK
      ?auto_75488 - BLOCK
    )
    :vars
    (
      ?auto_75490 - BLOCK
      ?auto_75492 - BLOCK
      ?auto_75489 - BLOCK
      ?auto_75491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75490 ?auto_75488 ) ( ON-TABLE ?auto_75486 ) ( ON ?auto_75487 ?auto_75486 ) ( ON ?auto_75488 ?auto_75487 ) ( not ( = ?auto_75486 ?auto_75487 ) ) ( not ( = ?auto_75486 ?auto_75488 ) ) ( not ( = ?auto_75486 ?auto_75490 ) ) ( not ( = ?auto_75487 ?auto_75488 ) ) ( not ( = ?auto_75487 ?auto_75490 ) ) ( not ( = ?auto_75488 ?auto_75490 ) ) ( not ( = ?auto_75486 ?auto_75492 ) ) ( not ( = ?auto_75486 ?auto_75489 ) ) ( not ( = ?auto_75487 ?auto_75492 ) ) ( not ( = ?auto_75487 ?auto_75489 ) ) ( not ( = ?auto_75488 ?auto_75492 ) ) ( not ( = ?auto_75488 ?auto_75489 ) ) ( not ( = ?auto_75490 ?auto_75492 ) ) ( not ( = ?auto_75490 ?auto_75489 ) ) ( not ( = ?auto_75492 ?auto_75489 ) ) ( ON ?auto_75492 ?auto_75490 ) ( not ( = ?auto_75491 ?auto_75489 ) ) ( not ( = ?auto_75486 ?auto_75491 ) ) ( not ( = ?auto_75487 ?auto_75491 ) ) ( not ( = ?auto_75488 ?auto_75491 ) ) ( not ( = ?auto_75490 ?auto_75491 ) ) ( not ( = ?auto_75492 ?auto_75491 ) ) ( ON ?auto_75489 ?auto_75492 ) ( ON ?auto_75491 ?auto_75489 ) ( CLEAR ?auto_75491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75486 ?auto_75487 ?auto_75488 ?auto_75490 ?auto_75492 ?auto_75489 )
      ( MAKE-3PILE ?auto_75486 ?auto_75487 ?auto_75488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74317 - BLOCK
      ?auto_74318 - BLOCK
      ?auto_74319 - BLOCK
    )
    :vars
    (
      ?auto_74322 - BLOCK
      ?auto_74323 - BLOCK
      ?auto_74320 - BLOCK
      ?auto_74321 - BLOCK
      ?auto_74324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74322 ?auto_74319 ) ( ON-TABLE ?auto_74317 ) ( ON ?auto_74318 ?auto_74317 ) ( ON ?auto_74319 ?auto_74318 ) ( not ( = ?auto_74317 ?auto_74318 ) ) ( not ( = ?auto_74317 ?auto_74319 ) ) ( not ( = ?auto_74317 ?auto_74322 ) ) ( not ( = ?auto_74318 ?auto_74319 ) ) ( not ( = ?auto_74318 ?auto_74322 ) ) ( not ( = ?auto_74319 ?auto_74322 ) ) ( not ( = ?auto_74317 ?auto_74323 ) ) ( not ( = ?auto_74317 ?auto_74320 ) ) ( not ( = ?auto_74318 ?auto_74323 ) ) ( not ( = ?auto_74318 ?auto_74320 ) ) ( not ( = ?auto_74319 ?auto_74323 ) ) ( not ( = ?auto_74319 ?auto_74320 ) ) ( not ( = ?auto_74322 ?auto_74323 ) ) ( not ( = ?auto_74322 ?auto_74320 ) ) ( not ( = ?auto_74323 ?auto_74320 ) ) ( ON ?auto_74323 ?auto_74322 ) ( not ( = ?auto_74321 ?auto_74324 ) ) ( not ( = ?auto_74321 ?auto_74320 ) ) ( not ( = ?auto_74324 ?auto_74320 ) ) ( not ( = ?auto_74317 ?auto_74324 ) ) ( not ( = ?auto_74317 ?auto_74321 ) ) ( not ( = ?auto_74318 ?auto_74324 ) ) ( not ( = ?auto_74318 ?auto_74321 ) ) ( not ( = ?auto_74319 ?auto_74324 ) ) ( not ( = ?auto_74319 ?auto_74321 ) ) ( not ( = ?auto_74322 ?auto_74324 ) ) ( not ( = ?auto_74322 ?auto_74321 ) ) ( not ( = ?auto_74323 ?auto_74324 ) ) ( not ( = ?auto_74323 ?auto_74321 ) ) ( ON ?auto_74320 ?auto_74323 ) ( ON ?auto_74324 ?auto_74320 ) ( CLEAR ?auto_74324 ) ( HOLDING ?auto_74321 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74321 )
      ( MAKE-3PILE ?auto_74317 ?auto_74318 ?auto_74319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_74325 - BLOCK
      ?auto_74326 - BLOCK
      ?auto_74327 - BLOCK
    )
    :vars
    (
      ?auto_74331 - BLOCK
      ?auto_74329 - BLOCK
      ?auto_74328 - BLOCK
      ?auto_74330 - BLOCK
      ?auto_74332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74331 ?auto_74327 ) ( ON-TABLE ?auto_74325 ) ( ON ?auto_74326 ?auto_74325 ) ( ON ?auto_74327 ?auto_74326 ) ( not ( = ?auto_74325 ?auto_74326 ) ) ( not ( = ?auto_74325 ?auto_74327 ) ) ( not ( = ?auto_74325 ?auto_74331 ) ) ( not ( = ?auto_74326 ?auto_74327 ) ) ( not ( = ?auto_74326 ?auto_74331 ) ) ( not ( = ?auto_74327 ?auto_74331 ) ) ( not ( = ?auto_74325 ?auto_74329 ) ) ( not ( = ?auto_74325 ?auto_74328 ) ) ( not ( = ?auto_74326 ?auto_74329 ) ) ( not ( = ?auto_74326 ?auto_74328 ) ) ( not ( = ?auto_74327 ?auto_74329 ) ) ( not ( = ?auto_74327 ?auto_74328 ) ) ( not ( = ?auto_74331 ?auto_74329 ) ) ( not ( = ?auto_74331 ?auto_74328 ) ) ( not ( = ?auto_74329 ?auto_74328 ) ) ( ON ?auto_74329 ?auto_74331 ) ( not ( = ?auto_74330 ?auto_74332 ) ) ( not ( = ?auto_74330 ?auto_74328 ) ) ( not ( = ?auto_74332 ?auto_74328 ) ) ( not ( = ?auto_74325 ?auto_74332 ) ) ( not ( = ?auto_74325 ?auto_74330 ) ) ( not ( = ?auto_74326 ?auto_74332 ) ) ( not ( = ?auto_74326 ?auto_74330 ) ) ( not ( = ?auto_74327 ?auto_74332 ) ) ( not ( = ?auto_74327 ?auto_74330 ) ) ( not ( = ?auto_74331 ?auto_74332 ) ) ( not ( = ?auto_74331 ?auto_74330 ) ) ( not ( = ?auto_74329 ?auto_74332 ) ) ( not ( = ?auto_74329 ?auto_74330 ) ) ( ON ?auto_74328 ?auto_74329 ) ( ON ?auto_74332 ?auto_74328 ) ( ON ?auto_74330 ?auto_74332 ) ( CLEAR ?auto_74330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74325 ?auto_74326 ?auto_74327 ?auto_74331 ?auto_74329 ?auto_74328 ?auto_74332 )
      ( MAKE-3PILE ?auto_74325 ?auto_74326 ?auto_74327 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74338 - BLOCK
      ?auto_74339 - BLOCK
      ?auto_74340 - BLOCK
      ?auto_74341 - BLOCK
      ?auto_74342 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74342 ) ( CLEAR ?auto_74341 ) ( ON-TABLE ?auto_74338 ) ( ON ?auto_74339 ?auto_74338 ) ( ON ?auto_74340 ?auto_74339 ) ( ON ?auto_74341 ?auto_74340 ) ( not ( = ?auto_74338 ?auto_74339 ) ) ( not ( = ?auto_74338 ?auto_74340 ) ) ( not ( = ?auto_74338 ?auto_74341 ) ) ( not ( = ?auto_74338 ?auto_74342 ) ) ( not ( = ?auto_74339 ?auto_74340 ) ) ( not ( = ?auto_74339 ?auto_74341 ) ) ( not ( = ?auto_74339 ?auto_74342 ) ) ( not ( = ?auto_74340 ?auto_74341 ) ) ( not ( = ?auto_74340 ?auto_74342 ) ) ( not ( = ?auto_74341 ?auto_74342 ) ) )
    :subtasks
    ( ( !STACK ?auto_74342 ?auto_74341 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74343 - BLOCK
      ?auto_74344 - BLOCK
      ?auto_74345 - BLOCK
      ?auto_74346 - BLOCK
      ?auto_74347 - BLOCK
    )
    :vars
    (
      ?auto_74348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74346 ) ( ON-TABLE ?auto_74343 ) ( ON ?auto_74344 ?auto_74343 ) ( ON ?auto_74345 ?auto_74344 ) ( ON ?auto_74346 ?auto_74345 ) ( not ( = ?auto_74343 ?auto_74344 ) ) ( not ( = ?auto_74343 ?auto_74345 ) ) ( not ( = ?auto_74343 ?auto_74346 ) ) ( not ( = ?auto_74343 ?auto_74347 ) ) ( not ( = ?auto_74344 ?auto_74345 ) ) ( not ( = ?auto_74344 ?auto_74346 ) ) ( not ( = ?auto_74344 ?auto_74347 ) ) ( not ( = ?auto_74345 ?auto_74346 ) ) ( not ( = ?auto_74345 ?auto_74347 ) ) ( not ( = ?auto_74346 ?auto_74347 ) ) ( ON ?auto_74347 ?auto_74348 ) ( CLEAR ?auto_74347 ) ( HAND-EMPTY ) ( not ( = ?auto_74343 ?auto_74348 ) ) ( not ( = ?auto_74344 ?auto_74348 ) ) ( not ( = ?auto_74345 ?auto_74348 ) ) ( not ( = ?auto_74346 ?auto_74348 ) ) ( not ( = ?auto_74347 ?auto_74348 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74347 ?auto_74348 )
      ( MAKE-5PILE ?auto_74343 ?auto_74344 ?auto_74345 ?auto_74346 ?auto_74347 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74349 - BLOCK
      ?auto_74350 - BLOCK
      ?auto_74351 - BLOCK
      ?auto_74352 - BLOCK
      ?auto_74353 - BLOCK
    )
    :vars
    (
      ?auto_74354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74349 ) ( ON ?auto_74350 ?auto_74349 ) ( ON ?auto_74351 ?auto_74350 ) ( not ( = ?auto_74349 ?auto_74350 ) ) ( not ( = ?auto_74349 ?auto_74351 ) ) ( not ( = ?auto_74349 ?auto_74352 ) ) ( not ( = ?auto_74349 ?auto_74353 ) ) ( not ( = ?auto_74350 ?auto_74351 ) ) ( not ( = ?auto_74350 ?auto_74352 ) ) ( not ( = ?auto_74350 ?auto_74353 ) ) ( not ( = ?auto_74351 ?auto_74352 ) ) ( not ( = ?auto_74351 ?auto_74353 ) ) ( not ( = ?auto_74352 ?auto_74353 ) ) ( ON ?auto_74353 ?auto_74354 ) ( CLEAR ?auto_74353 ) ( not ( = ?auto_74349 ?auto_74354 ) ) ( not ( = ?auto_74350 ?auto_74354 ) ) ( not ( = ?auto_74351 ?auto_74354 ) ) ( not ( = ?auto_74352 ?auto_74354 ) ) ( not ( = ?auto_74353 ?auto_74354 ) ) ( HOLDING ?auto_74352 ) ( CLEAR ?auto_74351 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74349 ?auto_74350 ?auto_74351 ?auto_74352 )
      ( MAKE-5PILE ?auto_74349 ?auto_74350 ?auto_74351 ?auto_74352 ?auto_74353 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74355 - BLOCK
      ?auto_74356 - BLOCK
      ?auto_74357 - BLOCK
      ?auto_74358 - BLOCK
      ?auto_74359 - BLOCK
    )
    :vars
    (
      ?auto_74360 - BLOCK
      ?auto_74362 - BLOCK
      ?auto_74361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74355 ) ( ON ?auto_74356 ?auto_74355 ) ( ON ?auto_74357 ?auto_74356 ) ( not ( = ?auto_74355 ?auto_74356 ) ) ( not ( = ?auto_74355 ?auto_74357 ) ) ( not ( = ?auto_74355 ?auto_74358 ) ) ( not ( = ?auto_74355 ?auto_74359 ) ) ( not ( = ?auto_74356 ?auto_74357 ) ) ( not ( = ?auto_74356 ?auto_74358 ) ) ( not ( = ?auto_74356 ?auto_74359 ) ) ( not ( = ?auto_74357 ?auto_74358 ) ) ( not ( = ?auto_74357 ?auto_74359 ) ) ( not ( = ?auto_74358 ?auto_74359 ) ) ( ON ?auto_74359 ?auto_74360 ) ( not ( = ?auto_74355 ?auto_74360 ) ) ( not ( = ?auto_74356 ?auto_74360 ) ) ( not ( = ?auto_74357 ?auto_74360 ) ) ( not ( = ?auto_74358 ?auto_74360 ) ) ( not ( = ?auto_74359 ?auto_74360 ) ) ( CLEAR ?auto_74357 ) ( ON ?auto_74358 ?auto_74359 ) ( CLEAR ?auto_74358 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74362 ) ( ON ?auto_74361 ?auto_74362 ) ( ON ?auto_74360 ?auto_74361 ) ( not ( = ?auto_74362 ?auto_74361 ) ) ( not ( = ?auto_74362 ?auto_74360 ) ) ( not ( = ?auto_74362 ?auto_74359 ) ) ( not ( = ?auto_74362 ?auto_74358 ) ) ( not ( = ?auto_74361 ?auto_74360 ) ) ( not ( = ?auto_74361 ?auto_74359 ) ) ( not ( = ?auto_74361 ?auto_74358 ) ) ( not ( = ?auto_74355 ?auto_74362 ) ) ( not ( = ?auto_74355 ?auto_74361 ) ) ( not ( = ?auto_74356 ?auto_74362 ) ) ( not ( = ?auto_74356 ?auto_74361 ) ) ( not ( = ?auto_74357 ?auto_74362 ) ) ( not ( = ?auto_74357 ?auto_74361 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74362 ?auto_74361 ?auto_74360 ?auto_74359 )
      ( MAKE-5PILE ?auto_74355 ?auto_74356 ?auto_74357 ?auto_74358 ?auto_74359 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74363 - BLOCK
      ?auto_74364 - BLOCK
      ?auto_74365 - BLOCK
      ?auto_74366 - BLOCK
      ?auto_74367 - BLOCK
    )
    :vars
    (
      ?auto_74370 - BLOCK
      ?auto_74369 - BLOCK
      ?auto_74368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74363 ) ( ON ?auto_74364 ?auto_74363 ) ( not ( = ?auto_74363 ?auto_74364 ) ) ( not ( = ?auto_74363 ?auto_74365 ) ) ( not ( = ?auto_74363 ?auto_74366 ) ) ( not ( = ?auto_74363 ?auto_74367 ) ) ( not ( = ?auto_74364 ?auto_74365 ) ) ( not ( = ?auto_74364 ?auto_74366 ) ) ( not ( = ?auto_74364 ?auto_74367 ) ) ( not ( = ?auto_74365 ?auto_74366 ) ) ( not ( = ?auto_74365 ?auto_74367 ) ) ( not ( = ?auto_74366 ?auto_74367 ) ) ( ON ?auto_74367 ?auto_74370 ) ( not ( = ?auto_74363 ?auto_74370 ) ) ( not ( = ?auto_74364 ?auto_74370 ) ) ( not ( = ?auto_74365 ?auto_74370 ) ) ( not ( = ?auto_74366 ?auto_74370 ) ) ( not ( = ?auto_74367 ?auto_74370 ) ) ( ON ?auto_74366 ?auto_74367 ) ( CLEAR ?auto_74366 ) ( ON-TABLE ?auto_74369 ) ( ON ?auto_74368 ?auto_74369 ) ( ON ?auto_74370 ?auto_74368 ) ( not ( = ?auto_74369 ?auto_74368 ) ) ( not ( = ?auto_74369 ?auto_74370 ) ) ( not ( = ?auto_74369 ?auto_74367 ) ) ( not ( = ?auto_74369 ?auto_74366 ) ) ( not ( = ?auto_74368 ?auto_74370 ) ) ( not ( = ?auto_74368 ?auto_74367 ) ) ( not ( = ?auto_74368 ?auto_74366 ) ) ( not ( = ?auto_74363 ?auto_74369 ) ) ( not ( = ?auto_74363 ?auto_74368 ) ) ( not ( = ?auto_74364 ?auto_74369 ) ) ( not ( = ?auto_74364 ?auto_74368 ) ) ( not ( = ?auto_74365 ?auto_74369 ) ) ( not ( = ?auto_74365 ?auto_74368 ) ) ( HOLDING ?auto_74365 ) ( CLEAR ?auto_74364 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74363 ?auto_74364 ?auto_74365 )
      ( MAKE-5PILE ?auto_74363 ?auto_74364 ?auto_74365 ?auto_74366 ?auto_74367 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74371 - BLOCK
      ?auto_74372 - BLOCK
      ?auto_74373 - BLOCK
      ?auto_74374 - BLOCK
      ?auto_74375 - BLOCK
    )
    :vars
    (
      ?auto_74377 - BLOCK
      ?auto_74378 - BLOCK
      ?auto_74376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74371 ) ( ON ?auto_74372 ?auto_74371 ) ( not ( = ?auto_74371 ?auto_74372 ) ) ( not ( = ?auto_74371 ?auto_74373 ) ) ( not ( = ?auto_74371 ?auto_74374 ) ) ( not ( = ?auto_74371 ?auto_74375 ) ) ( not ( = ?auto_74372 ?auto_74373 ) ) ( not ( = ?auto_74372 ?auto_74374 ) ) ( not ( = ?auto_74372 ?auto_74375 ) ) ( not ( = ?auto_74373 ?auto_74374 ) ) ( not ( = ?auto_74373 ?auto_74375 ) ) ( not ( = ?auto_74374 ?auto_74375 ) ) ( ON ?auto_74375 ?auto_74377 ) ( not ( = ?auto_74371 ?auto_74377 ) ) ( not ( = ?auto_74372 ?auto_74377 ) ) ( not ( = ?auto_74373 ?auto_74377 ) ) ( not ( = ?auto_74374 ?auto_74377 ) ) ( not ( = ?auto_74375 ?auto_74377 ) ) ( ON ?auto_74374 ?auto_74375 ) ( ON-TABLE ?auto_74378 ) ( ON ?auto_74376 ?auto_74378 ) ( ON ?auto_74377 ?auto_74376 ) ( not ( = ?auto_74378 ?auto_74376 ) ) ( not ( = ?auto_74378 ?auto_74377 ) ) ( not ( = ?auto_74378 ?auto_74375 ) ) ( not ( = ?auto_74378 ?auto_74374 ) ) ( not ( = ?auto_74376 ?auto_74377 ) ) ( not ( = ?auto_74376 ?auto_74375 ) ) ( not ( = ?auto_74376 ?auto_74374 ) ) ( not ( = ?auto_74371 ?auto_74378 ) ) ( not ( = ?auto_74371 ?auto_74376 ) ) ( not ( = ?auto_74372 ?auto_74378 ) ) ( not ( = ?auto_74372 ?auto_74376 ) ) ( not ( = ?auto_74373 ?auto_74378 ) ) ( not ( = ?auto_74373 ?auto_74376 ) ) ( CLEAR ?auto_74372 ) ( ON ?auto_74373 ?auto_74374 ) ( CLEAR ?auto_74373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74378 ?auto_74376 ?auto_74377 ?auto_74375 ?auto_74374 )
      ( MAKE-5PILE ?auto_74371 ?auto_74372 ?auto_74373 ?auto_74374 ?auto_74375 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74379 - BLOCK
      ?auto_74380 - BLOCK
      ?auto_74381 - BLOCK
      ?auto_74382 - BLOCK
      ?auto_74383 - BLOCK
    )
    :vars
    (
      ?auto_74385 - BLOCK
      ?auto_74384 - BLOCK
      ?auto_74386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74379 ) ( not ( = ?auto_74379 ?auto_74380 ) ) ( not ( = ?auto_74379 ?auto_74381 ) ) ( not ( = ?auto_74379 ?auto_74382 ) ) ( not ( = ?auto_74379 ?auto_74383 ) ) ( not ( = ?auto_74380 ?auto_74381 ) ) ( not ( = ?auto_74380 ?auto_74382 ) ) ( not ( = ?auto_74380 ?auto_74383 ) ) ( not ( = ?auto_74381 ?auto_74382 ) ) ( not ( = ?auto_74381 ?auto_74383 ) ) ( not ( = ?auto_74382 ?auto_74383 ) ) ( ON ?auto_74383 ?auto_74385 ) ( not ( = ?auto_74379 ?auto_74385 ) ) ( not ( = ?auto_74380 ?auto_74385 ) ) ( not ( = ?auto_74381 ?auto_74385 ) ) ( not ( = ?auto_74382 ?auto_74385 ) ) ( not ( = ?auto_74383 ?auto_74385 ) ) ( ON ?auto_74382 ?auto_74383 ) ( ON-TABLE ?auto_74384 ) ( ON ?auto_74386 ?auto_74384 ) ( ON ?auto_74385 ?auto_74386 ) ( not ( = ?auto_74384 ?auto_74386 ) ) ( not ( = ?auto_74384 ?auto_74385 ) ) ( not ( = ?auto_74384 ?auto_74383 ) ) ( not ( = ?auto_74384 ?auto_74382 ) ) ( not ( = ?auto_74386 ?auto_74385 ) ) ( not ( = ?auto_74386 ?auto_74383 ) ) ( not ( = ?auto_74386 ?auto_74382 ) ) ( not ( = ?auto_74379 ?auto_74384 ) ) ( not ( = ?auto_74379 ?auto_74386 ) ) ( not ( = ?auto_74380 ?auto_74384 ) ) ( not ( = ?auto_74380 ?auto_74386 ) ) ( not ( = ?auto_74381 ?auto_74384 ) ) ( not ( = ?auto_74381 ?auto_74386 ) ) ( ON ?auto_74381 ?auto_74382 ) ( CLEAR ?auto_74381 ) ( HOLDING ?auto_74380 ) ( CLEAR ?auto_74379 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74379 ?auto_74380 )
      ( MAKE-5PILE ?auto_74379 ?auto_74380 ?auto_74381 ?auto_74382 ?auto_74383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74387 - BLOCK
      ?auto_74388 - BLOCK
      ?auto_74389 - BLOCK
      ?auto_74390 - BLOCK
      ?auto_74391 - BLOCK
    )
    :vars
    (
      ?auto_74394 - BLOCK
      ?auto_74393 - BLOCK
      ?auto_74392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74387 ) ( not ( = ?auto_74387 ?auto_74388 ) ) ( not ( = ?auto_74387 ?auto_74389 ) ) ( not ( = ?auto_74387 ?auto_74390 ) ) ( not ( = ?auto_74387 ?auto_74391 ) ) ( not ( = ?auto_74388 ?auto_74389 ) ) ( not ( = ?auto_74388 ?auto_74390 ) ) ( not ( = ?auto_74388 ?auto_74391 ) ) ( not ( = ?auto_74389 ?auto_74390 ) ) ( not ( = ?auto_74389 ?auto_74391 ) ) ( not ( = ?auto_74390 ?auto_74391 ) ) ( ON ?auto_74391 ?auto_74394 ) ( not ( = ?auto_74387 ?auto_74394 ) ) ( not ( = ?auto_74388 ?auto_74394 ) ) ( not ( = ?auto_74389 ?auto_74394 ) ) ( not ( = ?auto_74390 ?auto_74394 ) ) ( not ( = ?auto_74391 ?auto_74394 ) ) ( ON ?auto_74390 ?auto_74391 ) ( ON-TABLE ?auto_74393 ) ( ON ?auto_74392 ?auto_74393 ) ( ON ?auto_74394 ?auto_74392 ) ( not ( = ?auto_74393 ?auto_74392 ) ) ( not ( = ?auto_74393 ?auto_74394 ) ) ( not ( = ?auto_74393 ?auto_74391 ) ) ( not ( = ?auto_74393 ?auto_74390 ) ) ( not ( = ?auto_74392 ?auto_74394 ) ) ( not ( = ?auto_74392 ?auto_74391 ) ) ( not ( = ?auto_74392 ?auto_74390 ) ) ( not ( = ?auto_74387 ?auto_74393 ) ) ( not ( = ?auto_74387 ?auto_74392 ) ) ( not ( = ?auto_74388 ?auto_74393 ) ) ( not ( = ?auto_74388 ?auto_74392 ) ) ( not ( = ?auto_74389 ?auto_74393 ) ) ( not ( = ?auto_74389 ?auto_74392 ) ) ( ON ?auto_74389 ?auto_74390 ) ( CLEAR ?auto_74387 ) ( ON ?auto_74388 ?auto_74389 ) ( CLEAR ?auto_74388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74393 ?auto_74392 ?auto_74394 ?auto_74391 ?auto_74390 ?auto_74389 )
      ( MAKE-5PILE ?auto_74387 ?auto_74388 ?auto_74389 ?auto_74390 ?auto_74391 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74395 - BLOCK
      ?auto_74396 - BLOCK
      ?auto_74397 - BLOCK
      ?auto_74398 - BLOCK
      ?auto_74399 - BLOCK
    )
    :vars
    (
      ?auto_74400 - BLOCK
      ?auto_74401 - BLOCK
      ?auto_74402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74395 ?auto_74396 ) ) ( not ( = ?auto_74395 ?auto_74397 ) ) ( not ( = ?auto_74395 ?auto_74398 ) ) ( not ( = ?auto_74395 ?auto_74399 ) ) ( not ( = ?auto_74396 ?auto_74397 ) ) ( not ( = ?auto_74396 ?auto_74398 ) ) ( not ( = ?auto_74396 ?auto_74399 ) ) ( not ( = ?auto_74397 ?auto_74398 ) ) ( not ( = ?auto_74397 ?auto_74399 ) ) ( not ( = ?auto_74398 ?auto_74399 ) ) ( ON ?auto_74399 ?auto_74400 ) ( not ( = ?auto_74395 ?auto_74400 ) ) ( not ( = ?auto_74396 ?auto_74400 ) ) ( not ( = ?auto_74397 ?auto_74400 ) ) ( not ( = ?auto_74398 ?auto_74400 ) ) ( not ( = ?auto_74399 ?auto_74400 ) ) ( ON ?auto_74398 ?auto_74399 ) ( ON-TABLE ?auto_74401 ) ( ON ?auto_74402 ?auto_74401 ) ( ON ?auto_74400 ?auto_74402 ) ( not ( = ?auto_74401 ?auto_74402 ) ) ( not ( = ?auto_74401 ?auto_74400 ) ) ( not ( = ?auto_74401 ?auto_74399 ) ) ( not ( = ?auto_74401 ?auto_74398 ) ) ( not ( = ?auto_74402 ?auto_74400 ) ) ( not ( = ?auto_74402 ?auto_74399 ) ) ( not ( = ?auto_74402 ?auto_74398 ) ) ( not ( = ?auto_74395 ?auto_74401 ) ) ( not ( = ?auto_74395 ?auto_74402 ) ) ( not ( = ?auto_74396 ?auto_74401 ) ) ( not ( = ?auto_74396 ?auto_74402 ) ) ( not ( = ?auto_74397 ?auto_74401 ) ) ( not ( = ?auto_74397 ?auto_74402 ) ) ( ON ?auto_74397 ?auto_74398 ) ( ON ?auto_74396 ?auto_74397 ) ( CLEAR ?auto_74396 ) ( HOLDING ?auto_74395 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74395 )
      ( MAKE-5PILE ?auto_74395 ?auto_74396 ?auto_74397 ?auto_74398 ?auto_74399 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_74403 - BLOCK
      ?auto_74404 - BLOCK
      ?auto_74405 - BLOCK
      ?auto_74406 - BLOCK
      ?auto_74407 - BLOCK
    )
    :vars
    (
      ?auto_74408 - BLOCK
      ?auto_74410 - BLOCK
      ?auto_74409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74403 ?auto_74404 ) ) ( not ( = ?auto_74403 ?auto_74405 ) ) ( not ( = ?auto_74403 ?auto_74406 ) ) ( not ( = ?auto_74403 ?auto_74407 ) ) ( not ( = ?auto_74404 ?auto_74405 ) ) ( not ( = ?auto_74404 ?auto_74406 ) ) ( not ( = ?auto_74404 ?auto_74407 ) ) ( not ( = ?auto_74405 ?auto_74406 ) ) ( not ( = ?auto_74405 ?auto_74407 ) ) ( not ( = ?auto_74406 ?auto_74407 ) ) ( ON ?auto_74407 ?auto_74408 ) ( not ( = ?auto_74403 ?auto_74408 ) ) ( not ( = ?auto_74404 ?auto_74408 ) ) ( not ( = ?auto_74405 ?auto_74408 ) ) ( not ( = ?auto_74406 ?auto_74408 ) ) ( not ( = ?auto_74407 ?auto_74408 ) ) ( ON ?auto_74406 ?auto_74407 ) ( ON-TABLE ?auto_74410 ) ( ON ?auto_74409 ?auto_74410 ) ( ON ?auto_74408 ?auto_74409 ) ( not ( = ?auto_74410 ?auto_74409 ) ) ( not ( = ?auto_74410 ?auto_74408 ) ) ( not ( = ?auto_74410 ?auto_74407 ) ) ( not ( = ?auto_74410 ?auto_74406 ) ) ( not ( = ?auto_74409 ?auto_74408 ) ) ( not ( = ?auto_74409 ?auto_74407 ) ) ( not ( = ?auto_74409 ?auto_74406 ) ) ( not ( = ?auto_74403 ?auto_74410 ) ) ( not ( = ?auto_74403 ?auto_74409 ) ) ( not ( = ?auto_74404 ?auto_74410 ) ) ( not ( = ?auto_74404 ?auto_74409 ) ) ( not ( = ?auto_74405 ?auto_74410 ) ) ( not ( = ?auto_74405 ?auto_74409 ) ) ( ON ?auto_74405 ?auto_74406 ) ( ON ?auto_74404 ?auto_74405 ) ( ON ?auto_74403 ?auto_74404 ) ( CLEAR ?auto_74403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74410 ?auto_74409 ?auto_74408 ?auto_74407 ?auto_74406 ?auto_74405 ?auto_74404 )
      ( MAKE-5PILE ?auto_74403 ?auto_74404 ?auto_74405 ?auto_74406 ?auto_74407 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74413 - BLOCK
      ?auto_74414 - BLOCK
    )
    :vars
    (
      ?auto_74415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74415 ?auto_74414 ) ( CLEAR ?auto_74415 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74413 ) ( ON ?auto_74414 ?auto_74413 ) ( not ( = ?auto_74413 ?auto_74414 ) ) ( not ( = ?auto_74413 ?auto_74415 ) ) ( not ( = ?auto_74414 ?auto_74415 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74415 ?auto_74414 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74416 - BLOCK
      ?auto_74417 - BLOCK
    )
    :vars
    (
      ?auto_74418 - BLOCK
      ?auto_74419 - BLOCK
      ?auto_74420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74418 ?auto_74417 ) ( CLEAR ?auto_74418 ) ( ON-TABLE ?auto_74416 ) ( ON ?auto_74417 ?auto_74416 ) ( not ( = ?auto_74416 ?auto_74417 ) ) ( not ( = ?auto_74416 ?auto_74418 ) ) ( not ( = ?auto_74417 ?auto_74418 ) ) ( HOLDING ?auto_74419 ) ( CLEAR ?auto_74420 ) ( not ( = ?auto_74416 ?auto_74419 ) ) ( not ( = ?auto_74416 ?auto_74420 ) ) ( not ( = ?auto_74417 ?auto_74419 ) ) ( not ( = ?auto_74417 ?auto_74420 ) ) ( not ( = ?auto_74418 ?auto_74419 ) ) ( not ( = ?auto_74418 ?auto_74420 ) ) ( not ( = ?auto_74419 ?auto_74420 ) ) )
    :subtasks
    ( ( !STACK ?auto_74419 ?auto_74420 )
      ( MAKE-2PILE ?auto_74416 ?auto_74417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74421 - BLOCK
      ?auto_74422 - BLOCK
    )
    :vars
    (
      ?auto_74425 - BLOCK
      ?auto_74424 - BLOCK
      ?auto_74423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74425 ?auto_74422 ) ( ON-TABLE ?auto_74421 ) ( ON ?auto_74422 ?auto_74421 ) ( not ( = ?auto_74421 ?auto_74422 ) ) ( not ( = ?auto_74421 ?auto_74425 ) ) ( not ( = ?auto_74422 ?auto_74425 ) ) ( CLEAR ?auto_74424 ) ( not ( = ?auto_74421 ?auto_74423 ) ) ( not ( = ?auto_74421 ?auto_74424 ) ) ( not ( = ?auto_74422 ?auto_74423 ) ) ( not ( = ?auto_74422 ?auto_74424 ) ) ( not ( = ?auto_74425 ?auto_74423 ) ) ( not ( = ?auto_74425 ?auto_74424 ) ) ( not ( = ?auto_74423 ?auto_74424 ) ) ( ON ?auto_74423 ?auto_74425 ) ( CLEAR ?auto_74423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74421 ?auto_74422 ?auto_74425 )
      ( MAKE-2PILE ?auto_74421 ?auto_74422 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74426 - BLOCK
      ?auto_74427 - BLOCK
    )
    :vars
    (
      ?auto_74428 - BLOCK
      ?auto_74430 - BLOCK
      ?auto_74429 - BLOCK
      ?auto_74431 - BLOCK
      ?auto_74433 - BLOCK
      ?auto_74432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74428 ?auto_74427 ) ( ON-TABLE ?auto_74426 ) ( ON ?auto_74427 ?auto_74426 ) ( not ( = ?auto_74426 ?auto_74427 ) ) ( not ( = ?auto_74426 ?auto_74428 ) ) ( not ( = ?auto_74427 ?auto_74428 ) ) ( not ( = ?auto_74426 ?auto_74430 ) ) ( not ( = ?auto_74426 ?auto_74429 ) ) ( not ( = ?auto_74427 ?auto_74430 ) ) ( not ( = ?auto_74427 ?auto_74429 ) ) ( not ( = ?auto_74428 ?auto_74430 ) ) ( not ( = ?auto_74428 ?auto_74429 ) ) ( not ( = ?auto_74430 ?auto_74429 ) ) ( ON ?auto_74430 ?auto_74428 ) ( CLEAR ?auto_74430 ) ( HOLDING ?auto_74429 ) ( CLEAR ?auto_74431 ) ( ON-TABLE ?auto_74433 ) ( ON ?auto_74432 ?auto_74433 ) ( ON ?auto_74431 ?auto_74432 ) ( not ( = ?auto_74433 ?auto_74432 ) ) ( not ( = ?auto_74433 ?auto_74431 ) ) ( not ( = ?auto_74433 ?auto_74429 ) ) ( not ( = ?auto_74432 ?auto_74431 ) ) ( not ( = ?auto_74432 ?auto_74429 ) ) ( not ( = ?auto_74431 ?auto_74429 ) ) ( not ( = ?auto_74426 ?auto_74431 ) ) ( not ( = ?auto_74426 ?auto_74433 ) ) ( not ( = ?auto_74426 ?auto_74432 ) ) ( not ( = ?auto_74427 ?auto_74431 ) ) ( not ( = ?auto_74427 ?auto_74433 ) ) ( not ( = ?auto_74427 ?auto_74432 ) ) ( not ( = ?auto_74428 ?auto_74431 ) ) ( not ( = ?auto_74428 ?auto_74433 ) ) ( not ( = ?auto_74428 ?auto_74432 ) ) ( not ( = ?auto_74430 ?auto_74431 ) ) ( not ( = ?auto_74430 ?auto_74433 ) ) ( not ( = ?auto_74430 ?auto_74432 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74433 ?auto_74432 ?auto_74431 ?auto_74429 )
      ( MAKE-2PILE ?auto_74426 ?auto_74427 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74434 - BLOCK
      ?auto_74435 - BLOCK
    )
    :vars
    (
      ?auto_74441 - BLOCK
      ?auto_74440 - BLOCK
      ?auto_74437 - BLOCK
      ?auto_74436 - BLOCK
      ?auto_74439 - BLOCK
      ?auto_74438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74441 ?auto_74435 ) ( ON-TABLE ?auto_74434 ) ( ON ?auto_74435 ?auto_74434 ) ( not ( = ?auto_74434 ?auto_74435 ) ) ( not ( = ?auto_74434 ?auto_74441 ) ) ( not ( = ?auto_74435 ?auto_74441 ) ) ( not ( = ?auto_74434 ?auto_74440 ) ) ( not ( = ?auto_74434 ?auto_74437 ) ) ( not ( = ?auto_74435 ?auto_74440 ) ) ( not ( = ?auto_74435 ?auto_74437 ) ) ( not ( = ?auto_74441 ?auto_74440 ) ) ( not ( = ?auto_74441 ?auto_74437 ) ) ( not ( = ?auto_74440 ?auto_74437 ) ) ( ON ?auto_74440 ?auto_74441 ) ( CLEAR ?auto_74436 ) ( ON-TABLE ?auto_74439 ) ( ON ?auto_74438 ?auto_74439 ) ( ON ?auto_74436 ?auto_74438 ) ( not ( = ?auto_74439 ?auto_74438 ) ) ( not ( = ?auto_74439 ?auto_74436 ) ) ( not ( = ?auto_74439 ?auto_74437 ) ) ( not ( = ?auto_74438 ?auto_74436 ) ) ( not ( = ?auto_74438 ?auto_74437 ) ) ( not ( = ?auto_74436 ?auto_74437 ) ) ( not ( = ?auto_74434 ?auto_74436 ) ) ( not ( = ?auto_74434 ?auto_74439 ) ) ( not ( = ?auto_74434 ?auto_74438 ) ) ( not ( = ?auto_74435 ?auto_74436 ) ) ( not ( = ?auto_74435 ?auto_74439 ) ) ( not ( = ?auto_74435 ?auto_74438 ) ) ( not ( = ?auto_74441 ?auto_74436 ) ) ( not ( = ?auto_74441 ?auto_74439 ) ) ( not ( = ?auto_74441 ?auto_74438 ) ) ( not ( = ?auto_74440 ?auto_74436 ) ) ( not ( = ?auto_74440 ?auto_74439 ) ) ( not ( = ?auto_74440 ?auto_74438 ) ) ( ON ?auto_74437 ?auto_74440 ) ( CLEAR ?auto_74437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74434 ?auto_74435 ?auto_74441 ?auto_74440 )
      ( MAKE-2PILE ?auto_74434 ?auto_74435 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74442 - BLOCK
      ?auto_74443 - BLOCK
    )
    :vars
    (
      ?auto_74447 - BLOCK
      ?auto_74444 - BLOCK
      ?auto_74449 - BLOCK
      ?auto_74445 - BLOCK
      ?auto_74448 - BLOCK
      ?auto_74446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74447 ?auto_74443 ) ( ON-TABLE ?auto_74442 ) ( ON ?auto_74443 ?auto_74442 ) ( not ( = ?auto_74442 ?auto_74443 ) ) ( not ( = ?auto_74442 ?auto_74447 ) ) ( not ( = ?auto_74443 ?auto_74447 ) ) ( not ( = ?auto_74442 ?auto_74444 ) ) ( not ( = ?auto_74442 ?auto_74449 ) ) ( not ( = ?auto_74443 ?auto_74444 ) ) ( not ( = ?auto_74443 ?auto_74449 ) ) ( not ( = ?auto_74447 ?auto_74444 ) ) ( not ( = ?auto_74447 ?auto_74449 ) ) ( not ( = ?auto_74444 ?auto_74449 ) ) ( ON ?auto_74444 ?auto_74447 ) ( ON-TABLE ?auto_74445 ) ( ON ?auto_74448 ?auto_74445 ) ( not ( = ?auto_74445 ?auto_74448 ) ) ( not ( = ?auto_74445 ?auto_74446 ) ) ( not ( = ?auto_74445 ?auto_74449 ) ) ( not ( = ?auto_74448 ?auto_74446 ) ) ( not ( = ?auto_74448 ?auto_74449 ) ) ( not ( = ?auto_74446 ?auto_74449 ) ) ( not ( = ?auto_74442 ?auto_74446 ) ) ( not ( = ?auto_74442 ?auto_74445 ) ) ( not ( = ?auto_74442 ?auto_74448 ) ) ( not ( = ?auto_74443 ?auto_74446 ) ) ( not ( = ?auto_74443 ?auto_74445 ) ) ( not ( = ?auto_74443 ?auto_74448 ) ) ( not ( = ?auto_74447 ?auto_74446 ) ) ( not ( = ?auto_74447 ?auto_74445 ) ) ( not ( = ?auto_74447 ?auto_74448 ) ) ( not ( = ?auto_74444 ?auto_74446 ) ) ( not ( = ?auto_74444 ?auto_74445 ) ) ( not ( = ?auto_74444 ?auto_74448 ) ) ( ON ?auto_74449 ?auto_74444 ) ( CLEAR ?auto_74449 ) ( HOLDING ?auto_74446 ) ( CLEAR ?auto_74448 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74445 ?auto_74448 ?auto_74446 )
      ( MAKE-2PILE ?auto_74442 ?auto_74443 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74450 - BLOCK
      ?auto_74451 - BLOCK
    )
    :vars
    (
      ?auto_74453 - BLOCK
      ?auto_74457 - BLOCK
      ?auto_74454 - BLOCK
      ?auto_74452 - BLOCK
      ?auto_74455 - BLOCK
      ?auto_74456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74453 ?auto_74451 ) ( ON-TABLE ?auto_74450 ) ( ON ?auto_74451 ?auto_74450 ) ( not ( = ?auto_74450 ?auto_74451 ) ) ( not ( = ?auto_74450 ?auto_74453 ) ) ( not ( = ?auto_74451 ?auto_74453 ) ) ( not ( = ?auto_74450 ?auto_74457 ) ) ( not ( = ?auto_74450 ?auto_74454 ) ) ( not ( = ?auto_74451 ?auto_74457 ) ) ( not ( = ?auto_74451 ?auto_74454 ) ) ( not ( = ?auto_74453 ?auto_74457 ) ) ( not ( = ?auto_74453 ?auto_74454 ) ) ( not ( = ?auto_74457 ?auto_74454 ) ) ( ON ?auto_74457 ?auto_74453 ) ( ON-TABLE ?auto_74452 ) ( ON ?auto_74455 ?auto_74452 ) ( not ( = ?auto_74452 ?auto_74455 ) ) ( not ( = ?auto_74452 ?auto_74456 ) ) ( not ( = ?auto_74452 ?auto_74454 ) ) ( not ( = ?auto_74455 ?auto_74456 ) ) ( not ( = ?auto_74455 ?auto_74454 ) ) ( not ( = ?auto_74456 ?auto_74454 ) ) ( not ( = ?auto_74450 ?auto_74456 ) ) ( not ( = ?auto_74450 ?auto_74452 ) ) ( not ( = ?auto_74450 ?auto_74455 ) ) ( not ( = ?auto_74451 ?auto_74456 ) ) ( not ( = ?auto_74451 ?auto_74452 ) ) ( not ( = ?auto_74451 ?auto_74455 ) ) ( not ( = ?auto_74453 ?auto_74456 ) ) ( not ( = ?auto_74453 ?auto_74452 ) ) ( not ( = ?auto_74453 ?auto_74455 ) ) ( not ( = ?auto_74457 ?auto_74456 ) ) ( not ( = ?auto_74457 ?auto_74452 ) ) ( not ( = ?auto_74457 ?auto_74455 ) ) ( ON ?auto_74454 ?auto_74457 ) ( CLEAR ?auto_74455 ) ( ON ?auto_74456 ?auto_74454 ) ( CLEAR ?auto_74456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74450 ?auto_74451 ?auto_74453 ?auto_74457 ?auto_74454 )
      ( MAKE-2PILE ?auto_74450 ?auto_74451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74458 - BLOCK
      ?auto_74459 - BLOCK
    )
    :vars
    (
      ?auto_74465 - BLOCK
      ?auto_74464 - BLOCK
      ?auto_74463 - BLOCK
      ?auto_74462 - BLOCK
      ?auto_74460 - BLOCK
      ?auto_74461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74465 ?auto_74459 ) ( ON-TABLE ?auto_74458 ) ( ON ?auto_74459 ?auto_74458 ) ( not ( = ?auto_74458 ?auto_74459 ) ) ( not ( = ?auto_74458 ?auto_74465 ) ) ( not ( = ?auto_74459 ?auto_74465 ) ) ( not ( = ?auto_74458 ?auto_74464 ) ) ( not ( = ?auto_74458 ?auto_74463 ) ) ( not ( = ?auto_74459 ?auto_74464 ) ) ( not ( = ?auto_74459 ?auto_74463 ) ) ( not ( = ?auto_74465 ?auto_74464 ) ) ( not ( = ?auto_74465 ?auto_74463 ) ) ( not ( = ?auto_74464 ?auto_74463 ) ) ( ON ?auto_74464 ?auto_74465 ) ( ON-TABLE ?auto_74462 ) ( not ( = ?auto_74462 ?auto_74460 ) ) ( not ( = ?auto_74462 ?auto_74461 ) ) ( not ( = ?auto_74462 ?auto_74463 ) ) ( not ( = ?auto_74460 ?auto_74461 ) ) ( not ( = ?auto_74460 ?auto_74463 ) ) ( not ( = ?auto_74461 ?auto_74463 ) ) ( not ( = ?auto_74458 ?auto_74461 ) ) ( not ( = ?auto_74458 ?auto_74462 ) ) ( not ( = ?auto_74458 ?auto_74460 ) ) ( not ( = ?auto_74459 ?auto_74461 ) ) ( not ( = ?auto_74459 ?auto_74462 ) ) ( not ( = ?auto_74459 ?auto_74460 ) ) ( not ( = ?auto_74465 ?auto_74461 ) ) ( not ( = ?auto_74465 ?auto_74462 ) ) ( not ( = ?auto_74465 ?auto_74460 ) ) ( not ( = ?auto_74464 ?auto_74461 ) ) ( not ( = ?auto_74464 ?auto_74462 ) ) ( not ( = ?auto_74464 ?auto_74460 ) ) ( ON ?auto_74463 ?auto_74464 ) ( ON ?auto_74461 ?auto_74463 ) ( CLEAR ?auto_74461 ) ( HOLDING ?auto_74460 ) ( CLEAR ?auto_74462 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74462 ?auto_74460 )
      ( MAKE-2PILE ?auto_74458 ?auto_74459 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75759 - BLOCK
      ?auto_75760 - BLOCK
    )
    :vars
    (
      ?auto_75765 - BLOCK
      ?auto_75764 - BLOCK
      ?auto_75763 - BLOCK
      ?auto_75762 - BLOCK
      ?auto_75761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75765 ?auto_75760 ) ( ON-TABLE ?auto_75759 ) ( ON ?auto_75760 ?auto_75759 ) ( not ( = ?auto_75759 ?auto_75760 ) ) ( not ( = ?auto_75759 ?auto_75765 ) ) ( not ( = ?auto_75760 ?auto_75765 ) ) ( not ( = ?auto_75759 ?auto_75764 ) ) ( not ( = ?auto_75759 ?auto_75763 ) ) ( not ( = ?auto_75760 ?auto_75764 ) ) ( not ( = ?auto_75760 ?auto_75763 ) ) ( not ( = ?auto_75765 ?auto_75764 ) ) ( not ( = ?auto_75765 ?auto_75763 ) ) ( not ( = ?auto_75764 ?auto_75763 ) ) ( ON ?auto_75764 ?auto_75765 ) ( not ( = ?auto_75762 ?auto_75761 ) ) ( not ( = ?auto_75762 ?auto_75763 ) ) ( not ( = ?auto_75761 ?auto_75763 ) ) ( not ( = ?auto_75759 ?auto_75761 ) ) ( not ( = ?auto_75759 ?auto_75762 ) ) ( not ( = ?auto_75760 ?auto_75761 ) ) ( not ( = ?auto_75760 ?auto_75762 ) ) ( not ( = ?auto_75765 ?auto_75761 ) ) ( not ( = ?auto_75765 ?auto_75762 ) ) ( not ( = ?auto_75764 ?auto_75761 ) ) ( not ( = ?auto_75764 ?auto_75762 ) ) ( ON ?auto_75763 ?auto_75764 ) ( ON ?auto_75761 ?auto_75763 ) ( ON ?auto_75762 ?auto_75761 ) ( CLEAR ?auto_75762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75759 ?auto_75760 ?auto_75765 ?auto_75764 ?auto_75763 ?auto_75761 )
      ( MAKE-2PILE ?auto_75759 ?auto_75760 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74474 - BLOCK
      ?auto_74475 - BLOCK
    )
    :vars
    (
      ?auto_74478 - BLOCK
      ?auto_74481 - BLOCK
      ?auto_74480 - BLOCK
      ?auto_74476 - BLOCK
      ?auto_74479 - BLOCK
      ?auto_74477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74478 ?auto_74475 ) ( ON-TABLE ?auto_74474 ) ( ON ?auto_74475 ?auto_74474 ) ( not ( = ?auto_74474 ?auto_74475 ) ) ( not ( = ?auto_74474 ?auto_74478 ) ) ( not ( = ?auto_74475 ?auto_74478 ) ) ( not ( = ?auto_74474 ?auto_74481 ) ) ( not ( = ?auto_74474 ?auto_74480 ) ) ( not ( = ?auto_74475 ?auto_74481 ) ) ( not ( = ?auto_74475 ?auto_74480 ) ) ( not ( = ?auto_74478 ?auto_74481 ) ) ( not ( = ?auto_74478 ?auto_74480 ) ) ( not ( = ?auto_74481 ?auto_74480 ) ) ( ON ?auto_74481 ?auto_74478 ) ( not ( = ?auto_74476 ?auto_74479 ) ) ( not ( = ?auto_74476 ?auto_74477 ) ) ( not ( = ?auto_74476 ?auto_74480 ) ) ( not ( = ?auto_74479 ?auto_74477 ) ) ( not ( = ?auto_74479 ?auto_74480 ) ) ( not ( = ?auto_74477 ?auto_74480 ) ) ( not ( = ?auto_74474 ?auto_74477 ) ) ( not ( = ?auto_74474 ?auto_74476 ) ) ( not ( = ?auto_74474 ?auto_74479 ) ) ( not ( = ?auto_74475 ?auto_74477 ) ) ( not ( = ?auto_74475 ?auto_74476 ) ) ( not ( = ?auto_74475 ?auto_74479 ) ) ( not ( = ?auto_74478 ?auto_74477 ) ) ( not ( = ?auto_74478 ?auto_74476 ) ) ( not ( = ?auto_74478 ?auto_74479 ) ) ( not ( = ?auto_74481 ?auto_74477 ) ) ( not ( = ?auto_74481 ?auto_74476 ) ) ( not ( = ?auto_74481 ?auto_74479 ) ) ( ON ?auto_74480 ?auto_74481 ) ( ON ?auto_74477 ?auto_74480 ) ( ON ?auto_74479 ?auto_74477 ) ( CLEAR ?auto_74479 ) ( HOLDING ?auto_74476 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74476 )
      ( MAKE-2PILE ?auto_74474 ?auto_74475 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_74482 - BLOCK
      ?auto_74483 - BLOCK
    )
    :vars
    (
      ?auto_74489 - BLOCK
      ?auto_74485 - BLOCK
      ?auto_74484 - BLOCK
      ?auto_74488 - BLOCK
      ?auto_74486 - BLOCK
      ?auto_74487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74489 ?auto_74483 ) ( ON-TABLE ?auto_74482 ) ( ON ?auto_74483 ?auto_74482 ) ( not ( = ?auto_74482 ?auto_74483 ) ) ( not ( = ?auto_74482 ?auto_74489 ) ) ( not ( = ?auto_74483 ?auto_74489 ) ) ( not ( = ?auto_74482 ?auto_74485 ) ) ( not ( = ?auto_74482 ?auto_74484 ) ) ( not ( = ?auto_74483 ?auto_74485 ) ) ( not ( = ?auto_74483 ?auto_74484 ) ) ( not ( = ?auto_74489 ?auto_74485 ) ) ( not ( = ?auto_74489 ?auto_74484 ) ) ( not ( = ?auto_74485 ?auto_74484 ) ) ( ON ?auto_74485 ?auto_74489 ) ( not ( = ?auto_74488 ?auto_74486 ) ) ( not ( = ?auto_74488 ?auto_74487 ) ) ( not ( = ?auto_74488 ?auto_74484 ) ) ( not ( = ?auto_74486 ?auto_74487 ) ) ( not ( = ?auto_74486 ?auto_74484 ) ) ( not ( = ?auto_74487 ?auto_74484 ) ) ( not ( = ?auto_74482 ?auto_74487 ) ) ( not ( = ?auto_74482 ?auto_74488 ) ) ( not ( = ?auto_74482 ?auto_74486 ) ) ( not ( = ?auto_74483 ?auto_74487 ) ) ( not ( = ?auto_74483 ?auto_74488 ) ) ( not ( = ?auto_74483 ?auto_74486 ) ) ( not ( = ?auto_74489 ?auto_74487 ) ) ( not ( = ?auto_74489 ?auto_74488 ) ) ( not ( = ?auto_74489 ?auto_74486 ) ) ( not ( = ?auto_74485 ?auto_74487 ) ) ( not ( = ?auto_74485 ?auto_74488 ) ) ( not ( = ?auto_74485 ?auto_74486 ) ) ( ON ?auto_74484 ?auto_74485 ) ( ON ?auto_74487 ?auto_74484 ) ( ON ?auto_74486 ?auto_74487 ) ( ON ?auto_74488 ?auto_74486 ) ( CLEAR ?auto_74488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74482 ?auto_74483 ?auto_74489 ?auto_74485 ?auto_74484 ?auto_74487 ?auto_74486 )
      ( MAKE-2PILE ?auto_74482 ?auto_74483 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74496 - BLOCK
      ?auto_74497 - BLOCK
      ?auto_74498 - BLOCK
      ?auto_74499 - BLOCK
      ?auto_74500 - BLOCK
      ?auto_74501 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74501 ) ( CLEAR ?auto_74500 ) ( ON-TABLE ?auto_74496 ) ( ON ?auto_74497 ?auto_74496 ) ( ON ?auto_74498 ?auto_74497 ) ( ON ?auto_74499 ?auto_74498 ) ( ON ?auto_74500 ?auto_74499 ) ( not ( = ?auto_74496 ?auto_74497 ) ) ( not ( = ?auto_74496 ?auto_74498 ) ) ( not ( = ?auto_74496 ?auto_74499 ) ) ( not ( = ?auto_74496 ?auto_74500 ) ) ( not ( = ?auto_74496 ?auto_74501 ) ) ( not ( = ?auto_74497 ?auto_74498 ) ) ( not ( = ?auto_74497 ?auto_74499 ) ) ( not ( = ?auto_74497 ?auto_74500 ) ) ( not ( = ?auto_74497 ?auto_74501 ) ) ( not ( = ?auto_74498 ?auto_74499 ) ) ( not ( = ?auto_74498 ?auto_74500 ) ) ( not ( = ?auto_74498 ?auto_74501 ) ) ( not ( = ?auto_74499 ?auto_74500 ) ) ( not ( = ?auto_74499 ?auto_74501 ) ) ( not ( = ?auto_74500 ?auto_74501 ) ) )
    :subtasks
    ( ( !STACK ?auto_74501 ?auto_74500 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74502 - BLOCK
      ?auto_74503 - BLOCK
      ?auto_74504 - BLOCK
      ?auto_74505 - BLOCK
      ?auto_74506 - BLOCK
      ?auto_74507 - BLOCK
    )
    :vars
    (
      ?auto_74508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74506 ) ( ON-TABLE ?auto_74502 ) ( ON ?auto_74503 ?auto_74502 ) ( ON ?auto_74504 ?auto_74503 ) ( ON ?auto_74505 ?auto_74504 ) ( ON ?auto_74506 ?auto_74505 ) ( not ( = ?auto_74502 ?auto_74503 ) ) ( not ( = ?auto_74502 ?auto_74504 ) ) ( not ( = ?auto_74502 ?auto_74505 ) ) ( not ( = ?auto_74502 ?auto_74506 ) ) ( not ( = ?auto_74502 ?auto_74507 ) ) ( not ( = ?auto_74503 ?auto_74504 ) ) ( not ( = ?auto_74503 ?auto_74505 ) ) ( not ( = ?auto_74503 ?auto_74506 ) ) ( not ( = ?auto_74503 ?auto_74507 ) ) ( not ( = ?auto_74504 ?auto_74505 ) ) ( not ( = ?auto_74504 ?auto_74506 ) ) ( not ( = ?auto_74504 ?auto_74507 ) ) ( not ( = ?auto_74505 ?auto_74506 ) ) ( not ( = ?auto_74505 ?auto_74507 ) ) ( not ( = ?auto_74506 ?auto_74507 ) ) ( ON ?auto_74507 ?auto_74508 ) ( CLEAR ?auto_74507 ) ( HAND-EMPTY ) ( not ( = ?auto_74502 ?auto_74508 ) ) ( not ( = ?auto_74503 ?auto_74508 ) ) ( not ( = ?auto_74504 ?auto_74508 ) ) ( not ( = ?auto_74505 ?auto_74508 ) ) ( not ( = ?auto_74506 ?auto_74508 ) ) ( not ( = ?auto_74507 ?auto_74508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74507 ?auto_74508 )
      ( MAKE-6PILE ?auto_74502 ?auto_74503 ?auto_74504 ?auto_74505 ?auto_74506 ?auto_74507 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74509 - BLOCK
      ?auto_74510 - BLOCK
      ?auto_74511 - BLOCK
      ?auto_74512 - BLOCK
      ?auto_74513 - BLOCK
      ?auto_74514 - BLOCK
    )
    :vars
    (
      ?auto_74515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74509 ) ( ON ?auto_74510 ?auto_74509 ) ( ON ?auto_74511 ?auto_74510 ) ( ON ?auto_74512 ?auto_74511 ) ( not ( = ?auto_74509 ?auto_74510 ) ) ( not ( = ?auto_74509 ?auto_74511 ) ) ( not ( = ?auto_74509 ?auto_74512 ) ) ( not ( = ?auto_74509 ?auto_74513 ) ) ( not ( = ?auto_74509 ?auto_74514 ) ) ( not ( = ?auto_74510 ?auto_74511 ) ) ( not ( = ?auto_74510 ?auto_74512 ) ) ( not ( = ?auto_74510 ?auto_74513 ) ) ( not ( = ?auto_74510 ?auto_74514 ) ) ( not ( = ?auto_74511 ?auto_74512 ) ) ( not ( = ?auto_74511 ?auto_74513 ) ) ( not ( = ?auto_74511 ?auto_74514 ) ) ( not ( = ?auto_74512 ?auto_74513 ) ) ( not ( = ?auto_74512 ?auto_74514 ) ) ( not ( = ?auto_74513 ?auto_74514 ) ) ( ON ?auto_74514 ?auto_74515 ) ( CLEAR ?auto_74514 ) ( not ( = ?auto_74509 ?auto_74515 ) ) ( not ( = ?auto_74510 ?auto_74515 ) ) ( not ( = ?auto_74511 ?auto_74515 ) ) ( not ( = ?auto_74512 ?auto_74515 ) ) ( not ( = ?auto_74513 ?auto_74515 ) ) ( not ( = ?auto_74514 ?auto_74515 ) ) ( HOLDING ?auto_74513 ) ( CLEAR ?auto_74512 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74509 ?auto_74510 ?auto_74511 ?auto_74512 ?auto_74513 )
      ( MAKE-6PILE ?auto_74509 ?auto_74510 ?auto_74511 ?auto_74512 ?auto_74513 ?auto_74514 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74516 - BLOCK
      ?auto_74517 - BLOCK
      ?auto_74518 - BLOCK
      ?auto_74519 - BLOCK
      ?auto_74520 - BLOCK
      ?auto_74521 - BLOCK
    )
    :vars
    (
      ?auto_74522 - BLOCK
      ?auto_74523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74516 ) ( ON ?auto_74517 ?auto_74516 ) ( ON ?auto_74518 ?auto_74517 ) ( ON ?auto_74519 ?auto_74518 ) ( not ( = ?auto_74516 ?auto_74517 ) ) ( not ( = ?auto_74516 ?auto_74518 ) ) ( not ( = ?auto_74516 ?auto_74519 ) ) ( not ( = ?auto_74516 ?auto_74520 ) ) ( not ( = ?auto_74516 ?auto_74521 ) ) ( not ( = ?auto_74517 ?auto_74518 ) ) ( not ( = ?auto_74517 ?auto_74519 ) ) ( not ( = ?auto_74517 ?auto_74520 ) ) ( not ( = ?auto_74517 ?auto_74521 ) ) ( not ( = ?auto_74518 ?auto_74519 ) ) ( not ( = ?auto_74518 ?auto_74520 ) ) ( not ( = ?auto_74518 ?auto_74521 ) ) ( not ( = ?auto_74519 ?auto_74520 ) ) ( not ( = ?auto_74519 ?auto_74521 ) ) ( not ( = ?auto_74520 ?auto_74521 ) ) ( ON ?auto_74521 ?auto_74522 ) ( not ( = ?auto_74516 ?auto_74522 ) ) ( not ( = ?auto_74517 ?auto_74522 ) ) ( not ( = ?auto_74518 ?auto_74522 ) ) ( not ( = ?auto_74519 ?auto_74522 ) ) ( not ( = ?auto_74520 ?auto_74522 ) ) ( not ( = ?auto_74521 ?auto_74522 ) ) ( CLEAR ?auto_74519 ) ( ON ?auto_74520 ?auto_74521 ) ( CLEAR ?auto_74520 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74523 ) ( ON ?auto_74522 ?auto_74523 ) ( not ( = ?auto_74523 ?auto_74522 ) ) ( not ( = ?auto_74523 ?auto_74521 ) ) ( not ( = ?auto_74523 ?auto_74520 ) ) ( not ( = ?auto_74516 ?auto_74523 ) ) ( not ( = ?auto_74517 ?auto_74523 ) ) ( not ( = ?auto_74518 ?auto_74523 ) ) ( not ( = ?auto_74519 ?auto_74523 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74523 ?auto_74522 ?auto_74521 )
      ( MAKE-6PILE ?auto_74516 ?auto_74517 ?auto_74518 ?auto_74519 ?auto_74520 ?auto_74521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74524 - BLOCK
      ?auto_74525 - BLOCK
      ?auto_74526 - BLOCK
      ?auto_74527 - BLOCK
      ?auto_74528 - BLOCK
      ?auto_74529 - BLOCK
    )
    :vars
    (
      ?auto_74531 - BLOCK
      ?auto_74530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74524 ) ( ON ?auto_74525 ?auto_74524 ) ( ON ?auto_74526 ?auto_74525 ) ( not ( = ?auto_74524 ?auto_74525 ) ) ( not ( = ?auto_74524 ?auto_74526 ) ) ( not ( = ?auto_74524 ?auto_74527 ) ) ( not ( = ?auto_74524 ?auto_74528 ) ) ( not ( = ?auto_74524 ?auto_74529 ) ) ( not ( = ?auto_74525 ?auto_74526 ) ) ( not ( = ?auto_74525 ?auto_74527 ) ) ( not ( = ?auto_74525 ?auto_74528 ) ) ( not ( = ?auto_74525 ?auto_74529 ) ) ( not ( = ?auto_74526 ?auto_74527 ) ) ( not ( = ?auto_74526 ?auto_74528 ) ) ( not ( = ?auto_74526 ?auto_74529 ) ) ( not ( = ?auto_74527 ?auto_74528 ) ) ( not ( = ?auto_74527 ?auto_74529 ) ) ( not ( = ?auto_74528 ?auto_74529 ) ) ( ON ?auto_74529 ?auto_74531 ) ( not ( = ?auto_74524 ?auto_74531 ) ) ( not ( = ?auto_74525 ?auto_74531 ) ) ( not ( = ?auto_74526 ?auto_74531 ) ) ( not ( = ?auto_74527 ?auto_74531 ) ) ( not ( = ?auto_74528 ?auto_74531 ) ) ( not ( = ?auto_74529 ?auto_74531 ) ) ( ON ?auto_74528 ?auto_74529 ) ( CLEAR ?auto_74528 ) ( ON-TABLE ?auto_74530 ) ( ON ?auto_74531 ?auto_74530 ) ( not ( = ?auto_74530 ?auto_74531 ) ) ( not ( = ?auto_74530 ?auto_74529 ) ) ( not ( = ?auto_74530 ?auto_74528 ) ) ( not ( = ?auto_74524 ?auto_74530 ) ) ( not ( = ?auto_74525 ?auto_74530 ) ) ( not ( = ?auto_74526 ?auto_74530 ) ) ( not ( = ?auto_74527 ?auto_74530 ) ) ( HOLDING ?auto_74527 ) ( CLEAR ?auto_74526 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74524 ?auto_74525 ?auto_74526 ?auto_74527 )
      ( MAKE-6PILE ?auto_74524 ?auto_74525 ?auto_74526 ?auto_74527 ?auto_74528 ?auto_74529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74532 - BLOCK
      ?auto_74533 - BLOCK
      ?auto_74534 - BLOCK
      ?auto_74535 - BLOCK
      ?auto_74536 - BLOCK
      ?auto_74537 - BLOCK
    )
    :vars
    (
      ?auto_74538 - BLOCK
      ?auto_74539 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74532 ) ( ON ?auto_74533 ?auto_74532 ) ( ON ?auto_74534 ?auto_74533 ) ( not ( = ?auto_74532 ?auto_74533 ) ) ( not ( = ?auto_74532 ?auto_74534 ) ) ( not ( = ?auto_74532 ?auto_74535 ) ) ( not ( = ?auto_74532 ?auto_74536 ) ) ( not ( = ?auto_74532 ?auto_74537 ) ) ( not ( = ?auto_74533 ?auto_74534 ) ) ( not ( = ?auto_74533 ?auto_74535 ) ) ( not ( = ?auto_74533 ?auto_74536 ) ) ( not ( = ?auto_74533 ?auto_74537 ) ) ( not ( = ?auto_74534 ?auto_74535 ) ) ( not ( = ?auto_74534 ?auto_74536 ) ) ( not ( = ?auto_74534 ?auto_74537 ) ) ( not ( = ?auto_74535 ?auto_74536 ) ) ( not ( = ?auto_74535 ?auto_74537 ) ) ( not ( = ?auto_74536 ?auto_74537 ) ) ( ON ?auto_74537 ?auto_74538 ) ( not ( = ?auto_74532 ?auto_74538 ) ) ( not ( = ?auto_74533 ?auto_74538 ) ) ( not ( = ?auto_74534 ?auto_74538 ) ) ( not ( = ?auto_74535 ?auto_74538 ) ) ( not ( = ?auto_74536 ?auto_74538 ) ) ( not ( = ?auto_74537 ?auto_74538 ) ) ( ON ?auto_74536 ?auto_74537 ) ( ON-TABLE ?auto_74539 ) ( ON ?auto_74538 ?auto_74539 ) ( not ( = ?auto_74539 ?auto_74538 ) ) ( not ( = ?auto_74539 ?auto_74537 ) ) ( not ( = ?auto_74539 ?auto_74536 ) ) ( not ( = ?auto_74532 ?auto_74539 ) ) ( not ( = ?auto_74533 ?auto_74539 ) ) ( not ( = ?auto_74534 ?auto_74539 ) ) ( not ( = ?auto_74535 ?auto_74539 ) ) ( CLEAR ?auto_74534 ) ( ON ?auto_74535 ?auto_74536 ) ( CLEAR ?auto_74535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74539 ?auto_74538 ?auto_74537 ?auto_74536 )
      ( MAKE-6PILE ?auto_74532 ?auto_74533 ?auto_74534 ?auto_74535 ?auto_74536 ?auto_74537 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74540 - BLOCK
      ?auto_74541 - BLOCK
      ?auto_74542 - BLOCK
      ?auto_74543 - BLOCK
      ?auto_74544 - BLOCK
      ?auto_74545 - BLOCK
    )
    :vars
    (
      ?auto_74546 - BLOCK
      ?auto_74547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74540 ) ( ON ?auto_74541 ?auto_74540 ) ( not ( = ?auto_74540 ?auto_74541 ) ) ( not ( = ?auto_74540 ?auto_74542 ) ) ( not ( = ?auto_74540 ?auto_74543 ) ) ( not ( = ?auto_74540 ?auto_74544 ) ) ( not ( = ?auto_74540 ?auto_74545 ) ) ( not ( = ?auto_74541 ?auto_74542 ) ) ( not ( = ?auto_74541 ?auto_74543 ) ) ( not ( = ?auto_74541 ?auto_74544 ) ) ( not ( = ?auto_74541 ?auto_74545 ) ) ( not ( = ?auto_74542 ?auto_74543 ) ) ( not ( = ?auto_74542 ?auto_74544 ) ) ( not ( = ?auto_74542 ?auto_74545 ) ) ( not ( = ?auto_74543 ?auto_74544 ) ) ( not ( = ?auto_74543 ?auto_74545 ) ) ( not ( = ?auto_74544 ?auto_74545 ) ) ( ON ?auto_74545 ?auto_74546 ) ( not ( = ?auto_74540 ?auto_74546 ) ) ( not ( = ?auto_74541 ?auto_74546 ) ) ( not ( = ?auto_74542 ?auto_74546 ) ) ( not ( = ?auto_74543 ?auto_74546 ) ) ( not ( = ?auto_74544 ?auto_74546 ) ) ( not ( = ?auto_74545 ?auto_74546 ) ) ( ON ?auto_74544 ?auto_74545 ) ( ON-TABLE ?auto_74547 ) ( ON ?auto_74546 ?auto_74547 ) ( not ( = ?auto_74547 ?auto_74546 ) ) ( not ( = ?auto_74547 ?auto_74545 ) ) ( not ( = ?auto_74547 ?auto_74544 ) ) ( not ( = ?auto_74540 ?auto_74547 ) ) ( not ( = ?auto_74541 ?auto_74547 ) ) ( not ( = ?auto_74542 ?auto_74547 ) ) ( not ( = ?auto_74543 ?auto_74547 ) ) ( ON ?auto_74543 ?auto_74544 ) ( CLEAR ?auto_74543 ) ( HOLDING ?auto_74542 ) ( CLEAR ?auto_74541 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74540 ?auto_74541 ?auto_74542 )
      ( MAKE-6PILE ?auto_74540 ?auto_74541 ?auto_74542 ?auto_74543 ?auto_74544 ?auto_74545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74548 - BLOCK
      ?auto_74549 - BLOCK
      ?auto_74550 - BLOCK
      ?auto_74551 - BLOCK
      ?auto_74552 - BLOCK
      ?auto_74553 - BLOCK
    )
    :vars
    (
      ?auto_74555 - BLOCK
      ?auto_74554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74548 ) ( ON ?auto_74549 ?auto_74548 ) ( not ( = ?auto_74548 ?auto_74549 ) ) ( not ( = ?auto_74548 ?auto_74550 ) ) ( not ( = ?auto_74548 ?auto_74551 ) ) ( not ( = ?auto_74548 ?auto_74552 ) ) ( not ( = ?auto_74548 ?auto_74553 ) ) ( not ( = ?auto_74549 ?auto_74550 ) ) ( not ( = ?auto_74549 ?auto_74551 ) ) ( not ( = ?auto_74549 ?auto_74552 ) ) ( not ( = ?auto_74549 ?auto_74553 ) ) ( not ( = ?auto_74550 ?auto_74551 ) ) ( not ( = ?auto_74550 ?auto_74552 ) ) ( not ( = ?auto_74550 ?auto_74553 ) ) ( not ( = ?auto_74551 ?auto_74552 ) ) ( not ( = ?auto_74551 ?auto_74553 ) ) ( not ( = ?auto_74552 ?auto_74553 ) ) ( ON ?auto_74553 ?auto_74555 ) ( not ( = ?auto_74548 ?auto_74555 ) ) ( not ( = ?auto_74549 ?auto_74555 ) ) ( not ( = ?auto_74550 ?auto_74555 ) ) ( not ( = ?auto_74551 ?auto_74555 ) ) ( not ( = ?auto_74552 ?auto_74555 ) ) ( not ( = ?auto_74553 ?auto_74555 ) ) ( ON ?auto_74552 ?auto_74553 ) ( ON-TABLE ?auto_74554 ) ( ON ?auto_74555 ?auto_74554 ) ( not ( = ?auto_74554 ?auto_74555 ) ) ( not ( = ?auto_74554 ?auto_74553 ) ) ( not ( = ?auto_74554 ?auto_74552 ) ) ( not ( = ?auto_74548 ?auto_74554 ) ) ( not ( = ?auto_74549 ?auto_74554 ) ) ( not ( = ?auto_74550 ?auto_74554 ) ) ( not ( = ?auto_74551 ?auto_74554 ) ) ( ON ?auto_74551 ?auto_74552 ) ( CLEAR ?auto_74549 ) ( ON ?auto_74550 ?auto_74551 ) ( CLEAR ?auto_74550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74554 ?auto_74555 ?auto_74553 ?auto_74552 ?auto_74551 )
      ( MAKE-6PILE ?auto_74548 ?auto_74549 ?auto_74550 ?auto_74551 ?auto_74552 ?auto_74553 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74556 - BLOCK
      ?auto_74557 - BLOCK
      ?auto_74558 - BLOCK
      ?auto_74559 - BLOCK
      ?auto_74560 - BLOCK
      ?auto_74561 - BLOCK
    )
    :vars
    (
      ?auto_74563 - BLOCK
      ?auto_74562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74556 ) ( not ( = ?auto_74556 ?auto_74557 ) ) ( not ( = ?auto_74556 ?auto_74558 ) ) ( not ( = ?auto_74556 ?auto_74559 ) ) ( not ( = ?auto_74556 ?auto_74560 ) ) ( not ( = ?auto_74556 ?auto_74561 ) ) ( not ( = ?auto_74557 ?auto_74558 ) ) ( not ( = ?auto_74557 ?auto_74559 ) ) ( not ( = ?auto_74557 ?auto_74560 ) ) ( not ( = ?auto_74557 ?auto_74561 ) ) ( not ( = ?auto_74558 ?auto_74559 ) ) ( not ( = ?auto_74558 ?auto_74560 ) ) ( not ( = ?auto_74558 ?auto_74561 ) ) ( not ( = ?auto_74559 ?auto_74560 ) ) ( not ( = ?auto_74559 ?auto_74561 ) ) ( not ( = ?auto_74560 ?auto_74561 ) ) ( ON ?auto_74561 ?auto_74563 ) ( not ( = ?auto_74556 ?auto_74563 ) ) ( not ( = ?auto_74557 ?auto_74563 ) ) ( not ( = ?auto_74558 ?auto_74563 ) ) ( not ( = ?auto_74559 ?auto_74563 ) ) ( not ( = ?auto_74560 ?auto_74563 ) ) ( not ( = ?auto_74561 ?auto_74563 ) ) ( ON ?auto_74560 ?auto_74561 ) ( ON-TABLE ?auto_74562 ) ( ON ?auto_74563 ?auto_74562 ) ( not ( = ?auto_74562 ?auto_74563 ) ) ( not ( = ?auto_74562 ?auto_74561 ) ) ( not ( = ?auto_74562 ?auto_74560 ) ) ( not ( = ?auto_74556 ?auto_74562 ) ) ( not ( = ?auto_74557 ?auto_74562 ) ) ( not ( = ?auto_74558 ?auto_74562 ) ) ( not ( = ?auto_74559 ?auto_74562 ) ) ( ON ?auto_74559 ?auto_74560 ) ( ON ?auto_74558 ?auto_74559 ) ( CLEAR ?auto_74558 ) ( HOLDING ?auto_74557 ) ( CLEAR ?auto_74556 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74556 ?auto_74557 )
      ( MAKE-6PILE ?auto_74556 ?auto_74557 ?auto_74558 ?auto_74559 ?auto_74560 ?auto_74561 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74564 - BLOCK
      ?auto_74565 - BLOCK
      ?auto_74566 - BLOCK
      ?auto_74567 - BLOCK
      ?auto_74568 - BLOCK
      ?auto_74569 - BLOCK
    )
    :vars
    (
      ?auto_74571 - BLOCK
      ?auto_74570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74564 ) ( not ( = ?auto_74564 ?auto_74565 ) ) ( not ( = ?auto_74564 ?auto_74566 ) ) ( not ( = ?auto_74564 ?auto_74567 ) ) ( not ( = ?auto_74564 ?auto_74568 ) ) ( not ( = ?auto_74564 ?auto_74569 ) ) ( not ( = ?auto_74565 ?auto_74566 ) ) ( not ( = ?auto_74565 ?auto_74567 ) ) ( not ( = ?auto_74565 ?auto_74568 ) ) ( not ( = ?auto_74565 ?auto_74569 ) ) ( not ( = ?auto_74566 ?auto_74567 ) ) ( not ( = ?auto_74566 ?auto_74568 ) ) ( not ( = ?auto_74566 ?auto_74569 ) ) ( not ( = ?auto_74567 ?auto_74568 ) ) ( not ( = ?auto_74567 ?auto_74569 ) ) ( not ( = ?auto_74568 ?auto_74569 ) ) ( ON ?auto_74569 ?auto_74571 ) ( not ( = ?auto_74564 ?auto_74571 ) ) ( not ( = ?auto_74565 ?auto_74571 ) ) ( not ( = ?auto_74566 ?auto_74571 ) ) ( not ( = ?auto_74567 ?auto_74571 ) ) ( not ( = ?auto_74568 ?auto_74571 ) ) ( not ( = ?auto_74569 ?auto_74571 ) ) ( ON ?auto_74568 ?auto_74569 ) ( ON-TABLE ?auto_74570 ) ( ON ?auto_74571 ?auto_74570 ) ( not ( = ?auto_74570 ?auto_74571 ) ) ( not ( = ?auto_74570 ?auto_74569 ) ) ( not ( = ?auto_74570 ?auto_74568 ) ) ( not ( = ?auto_74564 ?auto_74570 ) ) ( not ( = ?auto_74565 ?auto_74570 ) ) ( not ( = ?auto_74566 ?auto_74570 ) ) ( not ( = ?auto_74567 ?auto_74570 ) ) ( ON ?auto_74567 ?auto_74568 ) ( ON ?auto_74566 ?auto_74567 ) ( CLEAR ?auto_74564 ) ( ON ?auto_74565 ?auto_74566 ) ( CLEAR ?auto_74565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74570 ?auto_74571 ?auto_74569 ?auto_74568 ?auto_74567 ?auto_74566 )
      ( MAKE-6PILE ?auto_74564 ?auto_74565 ?auto_74566 ?auto_74567 ?auto_74568 ?auto_74569 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74572 - BLOCK
      ?auto_74573 - BLOCK
      ?auto_74574 - BLOCK
      ?auto_74575 - BLOCK
      ?auto_74576 - BLOCK
      ?auto_74577 - BLOCK
    )
    :vars
    (
      ?auto_74578 - BLOCK
      ?auto_74579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74572 ?auto_74573 ) ) ( not ( = ?auto_74572 ?auto_74574 ) ) ( not ( = ?auto_74572 ?auto_74575 ) ) ( not ( = ?auto_74572 ?auto_74576 ) ) ( not ( = ?auto_74572 ?auto_74577 ) ) ( not ( = ?auto_74573 ?auto_74574 ) ) ( not ( = ?auto_74573 ?auto_74575 ) ) ( not ( = ?auto_74573 ?auto_74576 ) ) ( not ( = ?auto_74573 ?auto_74577 ) ) ( not ( = ?auto_74574 ?auto_74575 ) ) ( not ( = ?auto_74574 ?auto_74576 ) ) ( not ( = ?auto_74574 ?auto_74577 ) ) ( not ( = ?auto_74575 ?auto_74576 ) ) ( not ( = ?auto_74575 ?auto_74577 ) ) ( not ( = ?auto_74576 ?auto_74577 ) ) ( ON ?auto_74577 ?auto_74578 ) ( not ( = ?auto_74572 ?auto_74578 ) ) ( not ( = ?auto_74573 ?auto_74578 ) ) ( not ( = ?auto_74574 ?auto_74578 ) ) ( not ( = ?auto_74575 ?auto_74578 ) ) ( not ( = ?auto_74576 ?auto_74578 ) ) ( not ( = ?auto_74577 ?auto_74578 ) ) ( ON ?auto_74576 ?auto_74577 ) ( ON-TABLE ?auto_74579 ) ( ON ?auto_74578 ?auto_74579 ) ( not ( = ?auto_74579 ?auto_74578 ) ) ( not ( = ?auto_74579 ?auto_74577 ) ) ( not ( = ?auto_74579 ?auto_74576 ) ) ( not ( = ?auto_74572 ?auto_74579 ) ) ( not ( = ?auto_74573 ?auto_74579 ) ) ( not ( = ?auto_74574 ?auto_74579 ) ) ( not ( = ?auto_74575 ?auto_74579 ) ) ( ON ?auto_74575 ?auto_74576 ) ( ON ?auto_74574 ?auto_74575 ) ( ON ?auto_74573 ?auto_74574 ) ( CLEAR ?auto_74573 ) ( HOLDING ?auto_74572 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74572 )
      ( MAKE-6PILE ?auto_74572 ?auto_74573 ?auto_74574 ?auto_74575 ?auto_74576 ?auto_74577 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_74580 - BLOCK
      ?auto_74581 - BLOCK
      ?auto_74582 - BLOCK
      ?auto_74583 - BLOCK
      ?auto_74584 - BLOCK
      ?auto_74585 - BLOCK
    )
    :vars
    (
      ?auto_74587 - BLOCK
      ?auto_74586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74580 ?auto_74581 ) ) ( not ( = ?auto_74580 ?auto_74582 ) ) ( not ( = ?auto_74580 ?auto_74583 ) ) ( not ( = ?auto_74580 ?auto_74584 ) ) ( not ( = ?auto_74580 ?auto_74585 ) ) ( not ( = ?auto_74581 ?auto_74582 ) ) ( not ( = ?auto_74581 ?auto_74583 ) ) ( not ( = ?auto_74581 ?auto_74584 ) ) ( not ( = ?auto_74581 ?auto_74585 ) ) ( not ( = ?auto_74582 ?auto_74583 ) ) ( not ( = ?auto_74582 ?auto_74584 ) ) ( not ( = ?auto_74582 ?auto_74585 ) ) ( not ( = ?auto_74583 ?auto_74584 ) ) ( not ( = ?auto_74583 ?auto_74585 ) ) ( not ( = ?auto_74584 ?auto_74585 ) ) ( ON ?auto_74585 ?auto_74587 ) ( not ( = ?auto_74580 ?auto_74587 ) ) ( not ( = ?auto_74581 ?auto_74587 ) ) ( not ( = ?auto_74582 ?auto_74587 ) ) ( not ( = ?auto_74583 ?auto_74587 ) ) ( not ( = ?auto_74584 ?auto_74587 ) ) ( not ( = ?auto_74585 ?auto_74587 ) ) ( ON ?auto_74584 ?auto_74585 ) ( ON-TABLE ?auto_74586 ) ( ON ?auto_74587 ?auto_74586 ) ( not ( = ?auto_74586 ?auto_74587 ) ) ( not ( = ?auto_74586 ?auto_74585 ) ) ( not ( = ?auto_74586 ?auto_74584 ) ) ( not ( = ?auto_74580 ?auto_74586 ) ) ( not ( = ?auto_74581 ?auto_74586 ) ) ( not ( = ?auto_74582 ?auto_74586 ) ) ( not ( = ?auto_74583 ?auto_74586 ) ) ( ON ?auto_74583 ?auto_74584 ) ( ON ?auto_74582 ?auto_74583 ) ( ON ?auto_74581 ?auto_74582 ) ( ON ?auto_74580 ?auto_74581 ) ( CLEAR ?auto_74580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74586 ?auto_74587 ?auto_74585 ?auto_74584 ?auto_74583 ?auto_74582 ?auto_74581 )
      ( MAKE-6PILE ?auto_74580 ?auto_74581 ?auto_74582 ?auto_74583 ?auto_74584 ?auto_74585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74589 - BLOCK
    )
    :vars
    (
      ?auto_74590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74590 ?auto_74589 ) ( CLEAR ?auto_74590 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74589 ) ( not ( = ?auto_74589 ?auto_74590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74590 ?auto_74589 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74591 - BLOCK
    )
    :vars
    (
      ?auto_74592 - BLOCK
      ?auto_74593 - BLOCK
      ?auto_74594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74592 ?auto_74591 ) ( CLEAR ?auto_74592 ) ( ON-TABLE ?auto_74591 ) ( not ( = ?auto_74591 ?auto_74592 ) ) ( HOLDING ?auto_74593 ) ( CLEAR ?auto_74594 ) ( not ( = ?auto_74591 ?auto_74593 ) ) ( not ( = ?auto_74591 ?auto_74594 ) ) ( not ( = ?auto_74592 ?auto_74593 ) ) ( not ( = ?auto_74592 ?auto_74594 ) ) ( not ( = ?auto_74593 ?auto_74594 ) ) )
    :subtasks
    ( ( !STACK ?auto_74593 ?auto_74594 )
      ( MAKE-1PILE ?auto_74591 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74595 - BLOCK
    )
    :vars
    (
      ?auto_74596 - BLOCK
      ?auto_74598 - BLOCK
      ?auto_74597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74596 ?auto_74595 ) ( ON-TABLE ?auto_74595 ) ( not ( = ?auto_74595 ?auto_74596 ) ) ( CLEAR ?auto_74598 ) ( not ( = ?auto_74595 ?auto_74597 ) ) ( not ( = ?auto_74595 ?auto_74598 ) ) ( not ( = ?auto_74596 ?auto_74597 ) ) ( not ( = ?auto_74596 ?auto_74598 ) ) ( not ( = ?auto_74597 ?auto_74598 ) ) ( ON ?auto_74597 ?auto_74596 ) ( CLEAR ?auto_74597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74595 ?auto_74596 )
      ( MAKE-1PILE ?auto_74595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74599 - BLOCK
    )
    :vars
    (
      ?auto_74600 - BLOCK
      ?auto_74602 - BLOCK
      ?auto_74601 - BLOCK
      ?auto_74606 - BLOCK
      ?auto_74604 - BLOCK
      ?auto_74605 - BLOCK
      ?auto_74603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74600 ?auto_74599 ) ( ON-TABLE ?auto_74599 ) ( not ( = ?auto_74599 ?auto_74600 ) ) ( not ( = ?auto_74599 ?auto_74602 ) ) ( not ( = ?auto_74599 ?auto_74601 ) ) ( not ( = ?auto_74600 ?auto_74602 ) ) ( not ( = ?auto_74600 ?auto_74601 ) ) ( not ( = ?auto_74602 ?auto_74601 ) ) ( ON ?auto_74602 ?auto_74600 ) ( CLEAR ?auto_74602 ) ( HOLDING ?auto_74601 ) ( CLEAR ?auto_74606 ) ( ON-TABLE ?auto_74604 ) ( ON ?auto_74605 ?auto_74604 ) ( ON ?auto_74603 ?auto_74605 ) ( ON ?auto_74606 ?auto_74603 ) ( not ( = ?auto_74604 ?auto_74605 ) ) ( not ( = ?auto_74604 ?auto_74603 ) ) ( not ( = ?auto_74604 ?auto_74606 ) ) ( not ( = ?auto_74604 ?auto_74601 ) ) ( not ( = ?auto_74605 ?auto_74603 ) ) ( not ( = ?auto_74605 ?auto_74606 ) ) ( not ( = ?auto_74605 ?auto_74601 ) ) ( not ( = ?auto_74603 ?auto_74606 ) ) ( not ( = ?auto_74603 ?auto_74601 ) ) ( not ( = ?auto_74606 ?auto_74601 ) ) ( not ( = ?auto_74599 ?auto_74606 ) ) ( not ( = ?auto_74599 ?auto_74604 ) ) ( not ( = ?auto_74599 ?auto_74605 ) ) ( not ( = ?auto_74599 ?auto_74603 ) ) ( not ( = ?auto_74600 ?auto_74606 ) ) ( not ( = ?auto_74600 ?auto_74604 ) ) ( not ( = ?auto_74600 ?auto_74605 ) ) ( not ( = ?auto_74600 ?auto_74603 ) ) ( not ( = ?auto_74602 ?auto_74606 ) ) ( not ( = ?auto_74602 ?auto_74604 ) ) ( not ( = ?auto_74602 ?auto_74605 ) ) ( not ( = ?auto_74602 ?auto_74603 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74604 ?auto_74605 ?auto_74603 ?auto_74606 ?auto_74601 )
      ( MAKE-1PILE ?auto_74599 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74607 - BLOCK
    )
    :vars
    (
      ?auto_74608 - BLOCK
      ?auto_74613 - BLOCK
      ?auto_74611 - BLOCK
      ?auto_74610 - BLOCK
      ?auto_74609 - BLOCK
      ?auto_74612 - BLOCK
      ?auto_74614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74608 ?auto_74607 ) ( ON-TABLE ?auto_74607 ) ( not ( = ?auto_74607 ?auto_74608 ) ) ( not ( = ?auto_74607 ?auto_74613 ) ) ( not ( = ?auto_74607 ?auto_74611 ) ) ( not ( = ?auto_74608 ?auto_74613 ) ) ( not ( = ?auto_74608 ?auto_74611 ) ) ( not ( = ?auto_74613 ?auto_74611 ) ) ( ON ?auto_74613 ?auto_74608 ) ( CLEAR ?auto_74610 ) ( ON-TABLE ?auto_74609 ) ( ON ?auto_74612 ?auto_74609 ) ( ON ?auto_74614 ?auto_74612 ) ( ON ?auto_74610 ?auto_74614 ) ( not ( = ?auto_74609 ?auto_74612 ) ) ( not ( = ?auto_74609 ?auto_74614 ) ) ( not ( = ?auto_74609 ?auto_74610 ) ) ( not ( = ?auto_74609 ?auto_74611 ) ) ( not ( = ?auto_74612 ?auto_74614 ) ) ( not ( = ?auto_74612 ?auto_74610 ) ) ( not ( = ?auto_74612 ?auto_74611 ) ) ( not ( = ?auto_74614 ?auto_74610 ) ) ( not ( = ?auto_74614 ?auto_74611 ) ) ( not ( = ?auto_74610 ?auto_74611 ) ) ( not ( = ?auto_74607 ?auto_74610 ) ) ( not ( = ?auto_74607 ?auto_74609 ) ) ( not ( = ?auto_74607 ?auto_74612 ) ) ( not ( = ?auto_74607 ?auto_74614 ) ) ( not ( = ?auto_74608 ?auto_74610 ) ) ( not ( = ?auto_74608 ?auto_74609 ) ) ( not ( = ?auto_74608 ?auto_74612 ) ) ( not ( = ?auto_74608 ?auto_74614 ) ) ( not ( = ?auto_74613 ?auto_74610 ) ) ( not ( = ?auto_74613 ?auto_74609 ) ) ( not ( = ?auto_74613 ?auto_74612 ) ) ( not ( = ?auto_74613 ?auto_74614 ) ) ( ON ?auto_74611 ?auto_74613 ) ( CLEAR ?auto_74611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74607 ?auto_74608 ?auto_74613 )
      ( MAKE-1PILE ?auto_74607 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74615 - BLOCK
    )
    :vars
    (
      ?auto_74621 - BLOCK
      ?auto_74616 - BLOCK
      ?auto_74618 - BLOCK
      ?auto_74620 - BLOCK
      ?auto_74622 - BLOCK
      ?auto_74619 - BLOCK
      ?auto_74617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74621 ?auto_74615 ) ( ON-TABLE ?auto_74615 ) ( not ( = ?auto_74615 ?auto_74621 ) ) ( not ( = ?auto_74615 ?auto_74616 ) ) ( not ( = ?auto_74615 ?auto_74618 ) ) ( not ( = ?auto_74621 ?auto_74616 ) ) ( not ( = ?auto_74621 ?auto_74618 ) ) ( not ( = ?auto_74616 ?auto_74618 ) ) ( ON ?auto_74616 ?auto_74621 ) ( ON-TABLE ?auto_74620 ) ( ON ?auto_74622 ?auto_74620 ) ( ON ?auto_74619 ?auto_74622 ) ( not ( = ?auto_74620 ?auto_74622 ) ) ( not ( = ?auto_74620 ?auto_74619 ) ) ( not ( = ?auto_74620 ?auto_74617 ) ) ( not ( = ?auto_74620 ?auto_74618 ) ) ( not ( = ?auto_74622 ?auto_74619 ) ) ( not ( = ?auto_74622 ?auto_74617 ) ) ( not ( = ?auto_74622 ?auto_74618 ) ) ( not ( = ?auto_74619 ?auto_74617 ) ) ( not ( = ?auto_74619 ?auto_74618 ) ) ( not ( = ?auto_74617 ?auto_74618 ) ) ( not ( = ?auto_74615 ?auto_74617 ) ) ( not ( = ?auto_74615 ?auto_74620 ) ) ( not ( = ?auto_74615 ?auto_74622 ) ) ( not ( = ?auto_74615 ?auto_74619 ) ) ( not ( = ?auto_74621 ?auto_74617 ) ) ( not ( = ?auto_74621 ?auto_74620 ) ) ( not ( = ?auto_74621 ?auto_74622 ) ) ( not ( = ?auto_74621 ?auto_74619 ) ) ( not ( = ?auto_74616 ?auto_74617 ) ) ( not ( = ?auto_74616 ?auto_74620 ) ) ( not ( = ?auto_74616 ?auto_74622 ) ) ( not ( = ?auto_74616 ?auto_74619 ) ) ( ON ?auto_74618 ?auto_74616 ) ( CLEAR ?auto_74618 ) ( HOLDING ?auto_74617 ) ( CLEAR ?auto_74619 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74620 ?auto_74622 ?auto_74619 ?auto_74617 )
      ( MAKE-1PILE ?auto_74615 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74623 - BLOCK
    )
    :vars
    (
      ?auto_74629 - BLOCK
      ?auto_74630 - BLOCK
      ?auto_74624 - BLOCK
      ?auto_74627 - BLOCK
      ?auto_74628 - BLOCK
      ?auto_74625 - BLOCK
      ?auto_74626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74629 ?auto_74623 ) ( ON-TABLE ?auto_74623 ) ( not ( = ?auto_74623 ?auto_74629 ) ) ( not ( = ?auto_74623 ?auto_74630 ) ) ( not ( = ?auto_74623 ?auto_74624 ) ) ( not ( = ?auto_74629 ?auto_74630 ) ) ( not ( = ?auto_74629 ?auto_74624 ) ) ( not ( = ?auto_74630 ?auto_74624 ) ) ( ON ?auto_74630 ?auto_74629 ) ( ON-TABLE ?auto_74627 ) ( ON ?auto_74628 ?auto_74627 ) ( ON ?auto_74625 ?auto_74628 ) ( not ( = ?auto_74627 ?auto_74628 ) ) ( not ( = ?auto_74627 ?auto_74625 ) ) ( not ( = ?auto_74627 ?auto_74626 ) ) ( not ( = ?auto_74627 ?auto_74624 ) ) ( not ( = ?auto_74628 ?auto_74625 ) ) ( not ( = ?auto_74628 ?auto_74626 ) ) ( not ( = ?auto_74628 ?auto_74624 ) ) ( not ( = ?auto_74625 ?auto_74626 ) ) ( not ( = ?auto_74625 ?auto_74624 ) ) ( not ( = ?auto_74626 ?auto_74624 ) ) ( not ( = ?auto_74623 ?auto_74626 ) ) ( not ( = ?auto_74623 ?auto_74627 ) ) ( not ( = ?auto_74623 ?auto_74628 ) ) ( not ( = ?auto_74623 ?auto_74625 ) ) ( not ( = ?auto_74629 ?auto_74626 ) ) ( not ( = ?auto_74629 ?auto_74627 ) ) ( not ( = ?auto_74629 ?auto_74628 ) ) ( not ( = ?auto_74629 ?auto_74625 ) ) ( not ( = ?auto_74630 ?auto_74626 ) ) ( not ( = ?auto_74630 ?auto_74627 ) ) ( not ( = ?auto_74630 ?auto_74628 ) ) ( not ( = ?auto_74630 ?auto_74625 ) ) ( ON ?auto_74624 ?auto_74630 ) ( CLEAR ?auto_74625 ) ( ON ?auto_74626 ?auto_74624 ) ( CLEAR ?auto_74626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74623 ?auto_74629 ?auto_74630 ?auto_74624 )
      ( MAKE-1PILE ?auto_74623 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74631 - BLOCK
    )
    :vars
    (
      ?auto_74632 - BLOCK
      ?auto_74636 - BLOCK
      ?auto_74633 - BLOCK
      ?auto_74637 - BLOCK
      ?auto_74638 - BLOCK
      ?auto_74635 - BLOCK
      ?auto_74634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74632 ?auto_74631 ) ( ON-TABLE ?auto_74631 ) ( not ( = ?auto_74631 ?auto_74632 ) ) ( not ( = ?auto_74631 ?auto_74636 ) ) ( not ( = ?auto_74631 ?auto_74633 ) ) ( not ( = ?auto_74632 ?auto_74636 ) ) ( not ( = ?auto_74632 ?auto_74633 ) ) ( not ( = ?auto_74636 ?auto_74633 ) ) ( ON ?auto_74636 ?auto_74632 ) ( ON-TABLE ?auto_74637 ) ( ON ?auto_74638 ?auto_74637 ) ( not ( = ?auto_74637 ?auto_74638 ) ) ( not ( = ?auto_74637 ?auto_74635 ) ) ( not ( = ?auto_74637 ?auto_74634 ) ) ( not ( = ?auto_74637 ?auto_74633 ) ) ( not ( = ?auto_74638 ?auto_74635 ) ) ( not ( = ?auto_74638 ?auto_74634 ) ) ( not ( = ?auto_74638 ?auto_74633 ) ) ( not ( = ?auto_74635 ?auto_74634 ) ) ( not ( = ?auto_74635 ?auto_74633 ) ) ( not ( = ?auto_74634 ?auto_74633 ) ) ( not ( = ?auto_74631 ?auto_74634 ) ) ( not ( = ?auto_74631 ?auto_74637 ) ) ( not ( = ?auto_74631 ?auto_74638 ) ) ( not ( = ?auto_74631 ?auto_74635 ) ) ( not ( = ?auto_74632 ?auto_74634 ) ) ( not ( = ?auto_74632 ?auto_74637 ) ) ( not ( = ?auto_74632 ?auto_74638 ) ) ( not ( = ?auto_74632 ?auto_74635 ) ) ( not ( = ?auto_74636 ?auto_74634 ) ) ( not ( = ?auto_74636 ?auto_74637 ) ) ( not ( = ?auto_74636 ?auto_74638 ) ) ( not ( = ?auto_74636 ?auto_74635 ) ) ( ON ?auto_74633 ?auto_74636 ) ( ON ?auto_74634 ?auto_74633 ) ( CLEAR ?auto_74634 ) ( HOLDING ?auto_74635 ) ( CLEAR ?auto_74638 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74637 ?auto_74638 ?auto_74635 )
      ( MAKE-1PILE ?auto_74631 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74639 - BLOCK
    )
    :vars
    (
      ?auto_74644 - BLOCK
      ?auto_74645 - BLOCK
      ?auto_74643 - BLOCK
      ?auto_74642 - BLOCK
      ?auto_74640 - BLOCK
      ?auto_74641 - BLOCK
      ?auto_74646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74644 ?auto_74639 ) ( ON-TABLE ?auto_74639 ) ( not ( = ?auto_74639 ?auto_74644 ) ) ( not ( = ?auto_74639 ?auto_74645 ) ) ( not ( = ?auto_74639 ?auto_74643 ) ) ( not ( = ?auto_74644 ?auto_74645 ) ) ( not ( = ?auto_74644 ?auto_74643 ) ) ( not ( = ?auto_74645 ?auto_74643 ) ) ( ON ?auto_74645 ?auto_74644 ) ( ON-TABLE ?auto_74642 ) ( ON ?auto_74640 ?auto_74642 ) ( not ( = ?auto_74642 ?auto_74640 ) ) ( not ( = ?auto_74642 ?auto_74641 ) ) ( not ( = ?auto_74642 ?auto_74646 ) ) ( not ( = ?auto_74642 ?auto_74643 ) ) ( not ( = ?auto_74640 ?auto_74641 ) ) ( not ( = ?auto_74640 ?auto_74646 ) ) ( not ( = ?auto_74640 ?auto_74643 ) ) ( not ( = ?auto_74641 ?auto_74646 ) ) ( not ( = ?auto_74641 ?auto_74643 ) ) ( not ( = ?auto_74646 ?auto_74643 ) ) ( not ( = ?auto_74639 ?auto_74646 ) ) ( not ( = ?auto_74639 ?auto_74642 ) ) ( not ( = ?auto_74639 ?auto_74640 ) ) ( not ( = ?auto_74639 ?auto_74641 ) ) ( not ( = ?auto_74644 ?auto_74646 ) ) ( not ( = ?auto_74644 ?auto_74642 ) ) ( not ( = ?auto_74644 ?auto_74640 ) ) ( not ( = ?auto_74644 ?auto_74641 ) ) ( not ( = ?auto_74645 ?auto_74646 ) ) ( not ( = ?auto_74645 ?auto_74642 ) ) ( not ( = ?auto_74645 ?auto_74640 ) ) ( not ( = ?auto_74645 ?auto_74641 ) ) ( ON ?auto_74643 ?auto_74645 ) ( ON ?auto_74646 ?auto_74643 ) ( CLEAR ?auto_74640 ) ( ON ?auto_74641 ?auto_74646 ) ( CLEAR ?auto_74641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74639 ?auto_74644 ?auto_74645 ?auto_74643 ?auto_74646 )
      ( MAKE-1PILE ?auto_74639 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74647 - BLOCK
    )
    :vars
    (
      ?auto_74652 - BLOCK
      ?auto_74648 - BLOCK
      ?auto_74650 - BLOCK
      ?auto_74654 - BLOCK
      ?auto_74651 - BLOCK
      ?auto_74653 - BLOCK
      ?auto_74649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74652 ?auto_74647 ) ( ON-TABLE ?auto_74647 ) ( not ( = ?auto_74647 ?auto_74652 ) ) ( not ( = ?auto_74647 ?auto_74648 ) ) ( not ( = ?auto_74647 ?auto_74650 ) ) ( not ( = ?auto_74652 ?auto_74648 ) ) ( not ( = ?auto_74652 ?auto_74650 ) ) ( not ( = ?auto_74648 ?auto_74650 ) ) ( ON ?auto_74648 ?auto_74652 ) ( ON-TABLE ?auto_74654 ) ( not ( = ?auto_74654 ?auto_74651 ) ) ( not ( = ?auto_74654 ?auto_74653 ) ) ( not ( = ?auto_74654 ?auto_74649 ) ) ( not ( = ?auto_74654 ?auto_74650 ) ) ( not ( = ?auto_74651 ?auto_74653 ) ) ( not ( = ?auto_74651 ?auto_74649 ) ) ( not ( = ?auto_74651 ?auto_74650 ) ) ( not ( = ?auto_74653 ?auto_74649 ) ) ( not ( = ?auto_74653 ?auto_74650 ) ) ( not ( = ?auto_74649 ?auto_74650 ) ) ( not ( = ?auto_74647 ?auto_74649 ) ) ( not ( = ?auto_74647 ?auto_74654 ) ) ( not ( = ?auto_74647 ?auto_74651 ) ) ( not ( = ?auto_74647 ?auto_74653 ) ) ( not ( = ?auto_74652 ?auto_74649 ) ) ( not ( = ?auto_74652 ?auto_74654 ) ) ( not ( = ?auto_74652 ?auto_74651 ) ) ( not ( = ?auto_74652 ?auto_74653 ) ) ( not ( = ?auto_74648 ?auto_74649 ) ) ( not ( = ?auto_74648 ?auto_74654 ) ) ( not ( = ?auto_74648 ?auto_74651 ) ) ( not ( = ?auto_74648 ?auto_74653 ) ) ( ON ?auto_74650 ?auto_74648 ) ( ON ?auto_74649 ?auto_74650 ) ( ON ?auto_74653 ?auto_74649 ) ( CLEAR ?auto_74653 ) ( HOLDING ?auto_74651 ) ( CLEAR ?auto_74654 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74654 ?auto_74651 )
      ( MAKE-1PILE ?auto_74647 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76061 - BLOCK
    )
    :vars
    (
      ?auto_76063 - BLOCK
      ?auto_76066 - BLOCK
      ?auto_76065 - BLOCK
      ?auto_76064 - BLOCK
      ?auto_76067 - BLOCK
      ?auto_76062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76063 ?auto_76061 ) ( ON-TABLE ?auto_76061 ) ( not ( = ?auto_76061 ?auto_76063 ) ) ( not ( = ?auto_76061 ?auto_76066 ) ) ( not ( = ?auto_76061 ?auto_76065 ) ) ( not ( = ?auto_76063 ?auto_76066 ) ) ( not ( = ?auto_76063 ?auto_76065 ) ) ( not ( = ?auto_76066 ?auto_76065 ) ) ( ON ?auto_76066 ?auto_76063 ) ( not ( = ?auto_76064 ?auto_76067 ) ) ( not ( = ?auto_76064 ?auto_76062 ) ) ( not ( = ?auto_76064 ?auto_76065 ) ) ( not ( = ?auto_76067 ?auto_76062 ) ) ( not ( = ?auto_76067 ?auto_76065 ) ) ( not ( = ?auto_76062 ?auto_76065 ) ) ( not ( = ?auto_76061 ?auto_76062 ) ) ( not ( = ?auto_76061 ?auto_76064 ) ) ( not ( = ?auto_76061 ?auto_76067 ) ) ( not ( = ?auto_76063 ?auto_76062 ) ) ( not ( = ?auto_76063 ?auto_76064 ) ) ( not ( = ?auto_76063 ?auto_76067 ) ) ( not ( = ?auto_76066 ?auto_76062 ) ) ( not ( = ?auto_76066 ?auto_76064 ) ) ( not ( = ?auto_76066 ?auto_76067 ) ) ( ON ?auto_76065 ?auto_76066 ) ( ON ?auto_76062 ?auto_76065 ) ( ON ?auto_76067 ?auto_76062 ) ( ON ?auto_76064 ?auto_76067 ) ( CLEAR ?auto_76064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76061 ?auto_76063 ?auto_76066 ?auto_76065 ?auto_76062 ?auto_76067 )
      ( MAKE-1PILE ?auto_76061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74663 - BLOCK
    )
    :vars
    (
      ?auto_74669 - BLOCK
      ?auto_74665 - BLOCK
      ?auto_74666 - BLOCK
      ?auto_74667 - BLOCK
      ?auto_74668 - BLOCK
      ?auto_74664 - BLOCK
      ?auto_74670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74669 ?auto_74663 ) ( ON-TABLE ?auto_74663 ) ( not ( = ?auto_74663 ?auto_74669 ) ) ( not ( = ?auto_74663 ?auto_74665 ) ) ( not ( = ?auto_74663 ?auto_74666 ) ) ( not ( = ?auto_74669 ?auto_74665 ) ) ( not ( = ?auto_74669 ?auto_74666 ) ) ( not ( = ?auto_74665 ?auto_74666 ) ) ( ON ?auto_74665 ?auto_74669 ) ( not ( = ?auto_74667 ?auto_74668 ) ) ( not ( = ?auto_74667 ?auto_74664 ) ) ( not ( = ?auto_74667 ?auto_74670 ) ) ( not ( = ?auto_74667 ?auto_74666 ) ) ( not ( = ?auto_74668 ?auto_74664 ) ) ( not ( = ?auto_74668 ?auto_74670 ) ) ( not ( = ?auto_74668 ?auto_74666 ) ) ( not ( = ?auto_74664 ?auto_74670 ) ) ( not ( = ?auto_74664 ?auto_74666 ) ) ( not ( = ?auto_74670 ?auto_74666 ) ) ( not ( = ?auto_74663 ?auto_74670 ) ) ( not ( = ?auto_74663 ?auto_74667 ) ) ( not ( = ?auto_74663 ?auto_74668 ) ) ( not ( = ?auto_74663 ?auto_74664 ) ) ( not ( = ?auto_74669 ?auto_74670 ) ) ( not ( = ?auto_74669 ?auto_74667 ) ) ( not ( = ?auto_74669 ?auto_74668 ) ) ( not ( = ?auto_74669 ?auto_74664 ) ) ( not ( = ?auto_74665 ?auto_74670 ) ) ( not ( = ?auto_74665 ?auto_74667 ) ) ( not ( = ?auto_74665 ?auto_74668 ) ) ( not ( = ?auto_74665 ?auto_74664 ) ) ( ON ?auto_74666 ?auto_74665 ) ( ON ?auto_74670 ?auto_74666 ) ( ON ?auto_74664 ?auto_74670 ) ( ON ?auto_74668 ?auto_74664 ) ( CLEAR ?auto_74668 ) ( HOLDING ?auto_74667 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74667 )
      ( MAKE-1PILE ?auto_74663 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74671 - BLOCK
    )
    :vars
    (
      ?auto_74672 - BLOCK
      ?auto_74677 - BLOCK
      ?auto_74674 - BLOCK
      ?auto_74678 - BLOCK
      ?auto_74673 - BLOCK
      ?auto_74676 - BLOCK
      ?auto_74675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74672 ?auto_74671 ) ( ON-TABLE ?auto_74671 ) ( not ( = ?auto_74671 ?auto_74672 ) ) ( not ( = ?auto_74671 ?auto_74677 ) ) ( not ( = ?auto_74671 ?auto_74674 ) ) ( not ( = ?auto_74672 ?auto_74677 ) ) ( not ( = ?auto_74672 ?auto_74674 ) ) ( not ( = ?auto_74677 ?auto_74674 ) ) ( ON ?auto_74677 ?auto_74672 ) ( not ( = ?auto_74678 ?auto_74673 ) ) ( not ( = ?auto_74678 ?auto_74676 ) ) ( not ( = ?auto_74678 ?auto_74675 ) ) ( not ( = ?auto_74678 ?auto_74674 ) ) ( not ( = ?auto_74673 ?auto_74676 ) ) ( not ( = ?auto_74673 ?auto_74675 ) ) ( not ( = ?auto_74673 ?auto_74674 ) ) ( not ( = ?auto_74676 ?auto_74675 ) ) ( not ( = ?auto_74676 ?auto_74674 ) ) ( not ( = ?auto_74675 ?auto_74674 ) ) ( not ( = ?auto_74671 ?auto_74675 ) ) ( not ( = ?auto_74671 ?auto_74678 ) ) ( not ( = ?auto_74671 ?auto_74673 ) ) ( not ( = ?auto_74671 ?auto_74676 ) ) ( not ( = ?auto_74672 ?auto_74675 ) ) ( not ( = ?auto_74672 ?auto_74678 ) ) ( not ( = ?auto_74672 ?auto_74673 ) ) ( not ( = ?auto_74672 ?auto_74676 ) ) ( not ( = ?auto_74677 ?auto_74675 ) ) ( not ( = ?auto_74677 ?auto_74678 ) ) ( not ( = ?auto_74677 ?auto_74673 ) ) ( not ( = ?auto_74677 ?auto_74676 ) ) ( ON ?auto_74674 ?auto_74677 ) ( ON ?auto_74675 ?auto_74674 ) ( ON ?auto_74676 ?auto_74675 ) ( ON ?auto_74673 ?auto_74676 ) ( ON ?auto_74678 ?auto_74673 ) ( CLEAR ?auto_74678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74671 ?auto_74672 ?auto_74677 ?auto_74674 ?auto_74675 ?auto_74676 ?auto_74673 )
      ( MAKE-1PILE ?auto_74671 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74686 - BLOCK
      ?auto_74687 - BLOCK
      ?auto_74688 - BLOCK
      ?auto_74689 - BLOCK
      ?auto_74690 - BLOCK
      ?auto_74691 - BLOCK
      ?auto_74692 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_74692 ) ( CLEAR ?auto_74691 ) ( ON-TABLE ?auto_74686 ) ( ON ?auto_74687 ?auto_74686 ) ( ON ?auto_74688 ?auto_74687 ) ( ON ?auto_74689 ?auto_74688 ) ( ON ?auto_74690 ?auto_74689 ) ( ON ?auto_74691 ?auto_74690 ) ( not ( = ?auto_74686 ?auto_74687 ) ) ( not ( = ?auto_74686 ?auto_74688 ) ) ( not ( = ?auto_74686 ?auto_74689 ) ) ( not ( = ?auto_74686 ?auto_74690 ) ) ( not ( = ?auto_74686 ?auto_74691 ) ) ( not ( = ?auto_74686 ?auto_74692 ) ) ( not ( = ?auto_74687 ?auto_74688 ) ) ( not ( = ?auto_74687 ?auto_74689 ) ) ( not ( = ?auto_74687 ?auto_74690 ) ) ( not ( = ?auto_74687 ?auto_74691 ) ) ( not ( = ?auto_74687 ?auto_74692 ) ) ( not ( = ?auto_74688 ?auto_74689 ) ) ( not ( = ?auto_74688 ?auto_74690 ) ) ( not ( = ?auto_74688 ?auto_74691 ) ) ( not ( = ?auto_74688 ?auto_74692 ) ) ( not ( = ?auto_74689 ?auto_74690 ) ) ( not ( = ?auto_74689 ?auto_74691 ) ) ( not ( = ?auto_74689 ?auto_74692 ) ) ( not ( = ?auto_74690 ?auto_74691 ) ) ( not ( = ?auto_74690 ?auto_74692 ) ) ( not ( = ?auto_74691 ?auto_74692 ) ) )
    :subtasks
    ( ( !STACK ?auto_74692 ?auto_74691 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74693 - BLOCK
      ?auto_74694 - BLOCK
      ?auto_74695 - BLOCK
      ?auto_74696 - BLOCK
      ?auto_74697 - BLOCK
      ?auto_74698 - BLOCK
      ?auto_74699 - BLOCK
    )
    :vars
    (
      ?auto_74700 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74698 ) ( ON-TABLE ?auto_74693 ) ( ON ?auto_74694 ?auto_74693 ) ( ON ?auto_74695 ?auto_74694 ) ( ON ?auto_74696 ?auto_74695 ) ( ON ?auto_74697 ?auto_74696 ) ( ON ?auto_74698 ?auto_74697 ) ( not ( = ?auto_74693 ?auto_74694 ) ) ( not ( = ?auto_74693 ?auto_74695 ) ) ( not ( = ?auto_74693 ?auto_74696 ) ) ( not ( = ?auto_74693 ?auto_74697 ) ) ( not ( = ?auto_74693 ?auto_74698 ) ) ( not ( = ?auto_74693 ?auto_74699 ) ) ( not ( = ?auto_74694 ?auto_74695 ) ) ( not ( = ?auto_74694 ?auto_74696 ) ) ( not ( = ?auto_74694 ?auto_74697 ) ) ( not ( = ?auto_74694 ?auto_74698 ) ) ( not ( = ?auto_74694 ?auto_74699 ) ) ( not ( = ?auto_74695 ?auto_74696 ) ) ( not ( = ?auto_74695 ?auto_74697 ) ) ( not ( = ?auto_74695 ?auto_74698 ) ) ( not ( = ?auto_74695 ?auto_74699 ) ) ( not ( = ?auto_74696 ?auto_74697 ) ) ( not ( = ?auto_74696 ?auto_74698 ) ) ( not ( = ?auto_74696 ?auto_74699 ) ) ( not ( = ?auto_74697 ?auto_74698 ) ) ( not ( = ?auto_74697 ?auto_74699 ) ) ( not ( = ?auto_74698 ?auto_74699 ) ) ( ON ?auto_74699 ?auto_74700 ) ( CLEAR ?auto_74699 ) ( HAND-EMPTY ) ( not ( = ?auto_74693 ?auto_74700 ) ) ( not ( = ?auto_74694 ?auto_74700 ) ) ( not ( = ?auto_74695 ?auto_74700 ) ) ( not ( = ?auto_74696 ?auto_74700 ) ) ( not ( = ?auto_74697 ?auto_74700 ) ) ( not ( = ?auto_74698 ?auto_74700 ) ) ( not ( = ?auto_74699 ?auto_74700 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74699 ?auto_74700 )
      ( MAKE-7PILE ?auto_74693 ?auto_74694 ?auto_74695 ?auto_74696 ?auto_74697 ?auto_74698 ?auto_74699 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74701 - BLOCK
      ?auto_74702 - BLOCK
      ?auto_74703 - BLOCK
      ?auto_74704 - BLOCK
      ?auto_74705 - BLOCK
      ?auto_74706 - BLOCK
      ?auto_74707 - BLOCK
    )
    :vars
    (
      ?auto_74708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74701 ) ( ON ?auto_74702 ?auto_74701 ) ( ON ?auto_74703 ?auto_74702 ) ( ON ?auto_74704 ?auto_74703 ) ( ON ?auto_74705 ?auto_74704 ) ( not ( = ?auto_74701 ?auto_74702 ) ) ( not ( = ?auto_74701 ?auto_74703 ) ) ( not ( = ?auto_74701 ?auto_74704 ) ) ( not ( = ?auto_74701 ?auto_74705 ) ) ( not ( = ?auto_74701 ?auto_74706 ) ) ( not ( = ?auto_74701 ?auto_74707 ) ) ( not ( = ?auto_74702 ?auto_74703 ) ) ( not ( = ?auto_74702 ?auto_74704 ) ) ( not ( = ?auto_74702 ?auto_74705 ) ) ( not ( = ?auto_74702 ?auto_74706 ) ) ( not ( = ?auto_74702 ?auto_74707 ) ) ( not ( = ?auto_74703 ?auto_74704 ) ) ( not ( = ?auto_74703 ?auto_74705 ) ) ( not ( = ?auto_74703 ?auto_74706 ) ) ( not ( = ?auto_74703 ?auto_74707 ) ) ( not ( = ?auto_74704 ?auto_74705 ) ) ( not ( = ?auto_74704 ?auto_74706 ) ) ( not ( = ?auto_74704 ?auto_74707 ) ) ( not ( = ?auto_74705 ?auto_74706 ) ) ( not ( = ?auto_74705 ?auto_74707 ) ) ( not ( = ?auto_74706 ?auto_74707 ) ) ( ON ?auto_74707 ?auto_74708 ) ( CLEAR ?auto_74707 ) ( not ( = ?auto_74701 ?auto_74708 ) ) ( not ( = ?auto_74702 ?auto_74708 ) ) ( not ( = ?auto_74703 ?auto_74708 ) ) ( not ( = ?auto_74704 ?auto_74708 ) ) ( not ( = ?auto_74705 ?auto_74708 ) ) ( not ( = ?auto_74706 ?auto_74708 ) ) ( not ( = ?auto_74707 ?auto_74708 ) ) ( HOLDING ?auto_74706 ) ( CLEAR ?auto_74705 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74701 ?auto_74702 ?auto_74703 ?auto_74704 ?auto_74705 ?auto_74706 )
      ( MAKE-7PILE ?auto_74701 ?auto_74702 ?auto_74703 ?auto_74704 ?auto_74705 ?auto_74706 ?auto_74707 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74709 - BLOCK
      ?auto_74710 - BLOCK
      ?auto_74711 - BLOCK
      ?auto_74712 - BLOCK
      ?auto_74713 - BLOCK
      ?auto_74714 - BLOCK
      ?auto_74715 - BLOCK
    )
    :vars
    (
      ?auto_74716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74709 ) ( ON ?auto_74710 ?auto_74709 ) ( ON ?auto_74711 ?auto_74710 ) ( ON ?auto_74712 ?auto_74711 ) ( ON ?auto_74713 ?auto_74712 ) ( not ( = ?auto_74709 ?auto_74710 ) ) ( not ( = ?auto_74709 ?auto_74711 ) ) ( not ( = ?auto_74709 ?auto_74712 ) ) ( not ( = ?auto_74709 ?auto_74713 ) ) ( not ( = ?auto_74709 ?auto_74714 ) ) ( not ( = ?auto_74709 ?auto_74715 ) ) ( not ( = ?auto_74710 ?auto_74711 ) ) ( not ( = ?auto_74710 ?auto_74712 ) ) ( not ( = ?auto_74710 ?auto_74713 ) ) ( not ( = ?auto_74710 ?auto_74714 ) ) ( not ( = ?auto_74710 ?auto_74715 ) ) ( not ( = ?auto_74711 ?auto_74712 ) ) ( not ( = ?auto_74711 ?auto_74713 ) ) ( not ( = ?auto_74711 ?auto_74714 ) ) ( not ( = ?auto_74711 ?auto_74715 ) ) ( not ( = ?auto_74712 ?auto_74713 ) ) ( not ( = ?auto_74712 ?auto_74714 ) ) ( not ( = ?auto_74712 ?auto_74715 ) ) ( not ( = ?auto_74713 ?auto_74714 ) ) ( not ( = ?auto_74713 ?auto_74715 ) ) ( not ( = ?auto_74714 ?auto_74715 ) ) ( ON ?auto_74715 ?auto_74716 ) ( not ( = ?auto_74709 ?auto_74716 ) ) ( not ( = ?auto_74710 ?auto_74716 ) ) ( not ( = ?auto_74711 ?auto_74716 ) ) ( not ( = ?auto_74712 ?auto_74716 ) ) ( not ( = ?auto_74713 ?auto_74716 ) ) ( not ( = ?auto_74714 ?auto_74716 ) ) ( not ( = ?auto_74715 ?auto_74716 ) ) ( CLEAR ?auto_74713 ) ( ON ?auto_74714 ?auto_74715 ) ( CLEAR ?auto_74714 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74716 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74716 ?auto_74715 )
      ( MAKE-7PILE ?auto_74709 ?auto_74710 ?auto_74711 ?auto_74712 ?auto_74713 ?auto_74714 ?auto_74715 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74717 - BLOCK
      ?auto_74718 - BLOCK
      ?auto_74719 - BLOCK
      ?auto_74720 - BLOCK
      ?auto_74721 - BLOCK
      ?auto_74722 - BLOCK
      ?auto_74723 - BLOCK
    )
    :vars
    (
      ?auto_74724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74717 ) ( ON ?auto_74718 ?auto_74717 ) ( ON ?auto_74719 ?auto_74718 ) ( ON ?auto_74720 ?auto_74719 ) ( not ( = ?auto_74717 ?auto_74718 ) ) ( not ( = ?auto_74717 ?auto_74719 ) ) ( not ( = ?auto_74717 ?auto_74720 ) ) ( not ( = ?auto_74717 ?auto_74721 ) ) ( not ( = ?auto_74717 ?auto_74722 ) ) ( not ( = ?auto_74717 ?auto_74723 ) ) ( not ( = ?auto_74718 ?auto_74719 ) ) ( not ( = ?auto_74718 ?auto_74720 ) ) ( not ( = ?auto_74718 ?auto_74721 ) ) ( not ( = ?auto_74718 ?auto_74722 ) ) ( not ( = ?auto_74718 ?auto_74723 ) ) ( not ( = ?auto_74719 ?auto_74720 ) ) ( not ( = ?auto_74719 ?auto_74721 ) ) ( not ( = ?auto_74719 ?auto_74722 ) ) ( not ( = ?auto_74719 ?auto_74723 ) ) ( not ( = ?auto_74720 ?auto_74721 ) ) ( not ( = ?auto_74720 ?auto_74722 ) ) ( not ( = ?auto_74720 ?auto_74723 ) ) ( not ( = ?auto_74721 ?auto_74722 ) ) ( not ( = ?auto_74721 ?auto_74723 ) ) ( not ( = ?auto_74722 ?auto_74723 ) ) ( ON ?auto_74723 ?auto_74724 ) ( not ( = ?auto_74717 ?auto_74724 ) ) ( not ( = ?auto_74718 ?auto_74724 ) ) ( not ( = ?auto_74719 ?auto_74724 ) ) ( not ( = ?auto_74720 ?auto_74724 ) ) ( not ( = ?auto_74721 ?auto_74724 ) ) ( not ( = ?auto_74722 ?auto_74724 ) ) ( not ( = ?auto_74723 ?auto_74724 ) ) ( ON ?auto_74722 ?auto_74723 ) ( CLEAR ?auto_74722 ) ( ON-TABLE ?auto_74724 ) ( HOLDING ?auto_74721 ) ( CLEAR ?auto_74720 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74717 ?auto_74718 ?auto_74719 ?auto_74720 ?auto_74721 )
      ( MAKE-7PILE ?auto_74717 ?auto_74718 ?auto_74719 ?auto_74720 ?auto_74721 ?auto_74722 ?auto_74723 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74725 - BLOCK
      ?auto_74726 - BLOCK
      ?auto_74727 - BLOCK
      ?auto_74728 - BLOCK
      ?auto_74729 - BLOCK
      ?auto_74730 - BLOCK
      ?auto_74731 - BLOCK
    )
    :vars
    (
      ?auto_74732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74725 ) ( ON ?auto_74726 ?auto_74725 ) ( ON ?auto_74727 ?auto_74726 ) ( ON ?auto_74728 ?auto_74727 ) ( not ( = ?auto_74725 ?auto_74726 ) ) ( not ( = ?auto_74725 ?auto_74727 ) ) ( not ( = ?auto_74725 ?auto_74728 ) ) ( not ( = ?auto_74725 ?auto_74729 ) ) ( not ( = ?auto_74725 ?auto_74730 ) ) ( not ( = ?auto_74725 ?auto_74731 ) ) ( not ( = ?auto_74726 ?auto_74727 ) ) ( not ( = ?auto_74726 ?auto_74728 ) ) ( not ( = ?auto_74726 ?auto_74729 ) ) ( not ( = ?auto_74726 ?auto_74730 ) ) ( not ( = ?auto_74726 ?auto_74731 ) ) ( not ( = ?auto_74727 ?auto_74728 ) ) ( not ( = ?auto_74727 ?auto_74729 ) ) ( not ( = ?auto_74727 ?auto_74730 ) ) ( not ( = ?auto_74727 ?auto_74731 ) ) ( not ( = ?auto_74728 ?auto_74729 ) ) ( not ( = ?auto_74728 ?auto_74730 ) ) ( not ( = ?auto_74728 ?auto_74731 ) ) ( not ( = ?auto_74729 ?auto_74730 ) ) ( not ( = ?auto_74729 ?auto_74731 ) ) ( not ( = ?auto_74730 ?auto_74731 ) ) ( ON ?auto_74731 ?auto_74732 ) ( not ( = ?auto_74725 ?auto_74732 ) ) ( not ( = ?auto_74726 ?auto_74732 ) ) ( not ( = ?auto_74727 ?auto_74732 ) ) ( not ( = ?auto_74728 ?auto_74732 ) ) ( not ( = ?auto_74729 ?auto_74732 ) ) ( not ( = ?auto_74730 ?auto_74732 ) ) ( not ( = ?auto_74731 ?auto_74732 ) ) ( ON ?auto_74730 ?auto_74731 ) ( ON-TABLE ?auto_74732 ) ( CLEAR ?auto_74728 ) ( ON ?auto_74729 ?auto_74730 ) ( CLEAR ?auto_74729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74732 ?auto_74731 ?auto_74730 )
      ( MAKE-7PILE ?auto_74725 ?auto_74726 ?auto_74727 ?auto_74728 ?auto_74729 ?auto_74730 ?auto_74731 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74733 - BLOCK
      ?auto_74734 - BLOCK
      ?auto_74735 - BLOCK
      ?auto_74736 - BLOCK
      ?auto_74737 - BLOCK
      ?auto_74738 - BLOCK
      ?auto_74739 - BLOCK
    )
    :vars
    (
      ?auto_74740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74733 ) ( ON ?auto_74734 ?auto_74733 ) ( ON ?auto_74735 ?auto_74734 ) ( not ( = ?auto_74733 ?auto_74734 ) ) ( not ( = ?auto_74733 ?auto_74735 ) ) ( not ( = ?auto_74733 ?auto_74736 ) ) ( not ( = ?auto_74733 ?auto_74737 ) ) ( not ( = ?auto_74733 ?auto_74738 ) ) ( not ( = ?auto_74733 ?auto_74739 ) ) ( not ( = ?auto_74734 ?auto_74735 ) ) ( not ( = ?auto_74734 ?auto_74736 ) ) ( not ( = ?auto_74734 ?auto_74737 ) ) ( not ( = ?auto_74734 ?auto_74738 ) ) ( not ( = ?auto_74734 ?auto_74739 ) ) ( not ( = ?auto_74735 ?auto_74736 ) ) ( not ( = ?auto_74735 ?auto_74737 ) ) ( not ( = ?auto_74735 ?auto_74738 ) ) ( not ( = ?auto_74735 ?auto_74739 ) ) ( not ( = ?auto_74736 ?auto_74737 ) ) ( not ( = ?auto_74736 ?auto_74738 ) ) ( not ( = ?auto_74736 ?auto_74739 ) ) ( not ( = ?auto_74737 ?auto_74738 ) ) ( not ( = ?auto_74737 ?auto_74739 ) ) ( not ( = ?auto_74738 ?auto_74739 ) ) ( ON ?auto_74739 ?auto_74740 ) ( not ( = ?auto_74733 ?auto_74740 ) ) ( not ( = ?auto_74734 ?auto_74740 ) ) ( not ( = ?auto_74735 ?auto_74740 ) ) ( not ( = ?auto_74736 ?auto_74740 ) ) ( not ( = ?auto_74737 ?auto_74740 ) ) ( not ( = ?auto_74738 ?auto_74740 ) ) ( not ( = ?auto_74739 ?auto_74740 ) ) ( ON ?auto_74738 ?auto_74739 ) ( ON-TABLE ?auto_74740 ) ( ON ?auto_74737 ?auto_74738 ) ( CLEAR ?auto_74737 ) ( HOLDING ?auto_74736 ) ( CLEAR ?auto_74735 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74733 ?auto_74734 ?auto_74735 ?auto_74736 )
      ( MAKE-7PILE ?auto_74733 ?auto_74734 ?auto_74735 ?auto_74736 ?auto_74737 ?auto_74738 ?auto_74739 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74741 - BLOCK
      ?auto_74742 - BLOCK
      ?auto_74743 - BLOCK
      ?auto_74744 - BLOCK
      ?auto_74745 - BLOCK
      ?auto_74746 - BLOCK
      ?auto_74747 - BLOCK
    )
    :vars
    (
      ?auto_74748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74741 ) ( ON ?auto_74742 ?auto_74741 ) ( ON ?auto_74743 ?auto_74742 ) ( not ( = ?auto_74741 ?auto_74742 ) ) ( not ( = ?auto_74741 ?auto_74743 ) ) ( not ( = ?auto_74741 ?auto_74744 ) ) ( not ( = ?auto_74741 ?auto_74745 ) ) ( not ( = ?auto_74741 ?auto_74746 ) ) ( not ( = ?auto_74741 ?auto_74747 ) ) ( not ( = ?auto_74742 ?auto_74743 ) ) ( not ( = ?auto_74742 ?auto_74744 ) ) ( not ( = ?auto_74742 ?auto_74745 ) ) ( not ( = ?auto_74742 ?auto_74746 ) ) ( not ( = ?auto_74742 ?auto_74747 ) ) ( not ( = ?auto_74743 ?auto_74744 ) ) ( not ( = ?auto_74743 ?auto_74745 ) ) ( not ( = ?auto_74743 ?auto_74746 ) ) ( not ( = ?auto_74743 ?auto_74747 ) ) ( not ( = ?auto_74744 ?auto_74745 ) ) ( not ( = ?auto_74744 ?auto_74746 ) ) ( not ( = ?auto_74744 ?auto_74747 ) ) ( not ( = ?auto_74745 ?auto_74746 ) ) ( not ( = ?auto_74745 ?auto_74747 ) ) ( not ( = ?auto_74746 ?auto_74747 ) ) ( ON ?auto_74747 ?auto_74748 ) ( not ( = ?auto_74741 ?auto_74748 ) ) ( not ( = ?auto_74742 ?auto_74748 ) ) ( not ( = ?auto_74743 ?auto_74748 ) ) ( not ( = ?auto_74744 ?auto_74748 ) ) ( not ( = ?auto_74745 ?auto_74748 ) ) ( not ( = ?auto_74746 ?auto_74748 ) ) ( not ( = ?auto_74747 ?auto_74748 ) ) ( ON ?auto_74746 ?auto_74747 ) ( ON-TABLE ?auto_74748 ) ( ON ?auto_74745 ?auto_74746 ) ( CLEAR ?auto_74743 ) ( ON ?auto_74744 ?auto_74745 ) ( CLEAR ?auto_74744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74748 ?auto_74747 ?auto_74746 ?auto_74745 )
      ( MAKE-7PILE ?auto_74741 ?auto_74742 ?auto_74743 ?auto_74744 ?auto_74745 ?auto_74746 ?auto_74747 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74749 - BLOCK
      ?auto_74750 - BLOCK
      ?auto_74751 - BLOCK
      ?auto_74752 - BLOCK
      ?auto_74753 - BLOCK
      ?auto_74754 - BLOCK
      ?auto_74755 - BLOCK
    )
    :vars
    (
      ?auto_74756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74749 ) ( ON ?auto_74750 ?auto_74749 ) ( not ( = ?auto_74749 ?auto_74750 ) ) ( not ( = ?auto_74749 ?auto_74751 ) ) ( not ( = ?auto_74749 ?auto_74752 ) ) ( not ( = ?auto_74749 ?auto_74753 ) ) ( not ( = ?auto_74749 ?auto_74754 ) ) ( not ( = ?auto_74749 ?auto_74755 ) ) ( not ( = ?auto_74750 ?auto_74751 ) ) ( not ( = ?auto_74750 ?auto_74752 ) ) ( not ( = ?auto_74750 ?auto_74753 ) ) ( not ( = ?auto_74750 ?auto_74754 ) ) ( not ( = ?auto_74750 ?auto_74755 ) ) ( not ( = ?auto_74751 ?auto_74752 ) ) ( not ( = ?auto_74751 ?auto_74753 ) ) ( not ( = ?auto_74751 ?auto_74754 ) ) ( not ( = ?auto_74751 ?auto_74755 ) ) ( not ( = ?auto_74752 ?auto_74753 ) ) ( not ( = ?auto_74752 ?auto_74754 ) ) ( not ( = ?auto_74752 ?auto_74755 ) ) ( not ( = ?auto_74753 ?auto_74754 ) ) ( not ( = ?auto_74753 ?auto_74755 ) ) ( not ( = ?auto_74754 ?auto_74755 ) ) ( ON ?auto_74755 ?auto_74756 ) ( not ( = ?auto_74749 ?auto_74756 ) ) ( not ( = ?auto_74750 ?auto_74756 ) ) ( not ( = ?auto_74751 ?auto_74756 ) ) ( not ( = ?auto_74752 ?auto_74756 ) ) ( not ( = ?auto_74753 ?auto_74756 ) ) ( not ( = ?auto_74754 ?auto_74756 ) ) ( not ( = ?auto_74755 ?auto_74756 ) ) ( ON ?auto_74754 ?auto_74755 ) ( ON-TABLE ?auto_74756 ) ( ON ?auto_74753 ?auto_74754 ) ( ON ?auto_74752 ?auto_74753 ) ( CLEAR ?auto_74752 ) ( HOLDING ?auto_74751 ) ( CLEAR ?auto_74750 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74749 ?auto_74750 ?auto_74751 )
      ( MAKE-7PILE ?auto_74749 ?auto_74750 ?auto_74751 ?auto_74752 ?auto_74753 ?auto_74754 ?auto_74755 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74757 - BLOCK
      ?auto_74758 - BLOCK
      ?auto_74759 - BLOCK
      ?auto_74760 - BLOCK
      ?auto_74761 - BLOCK
      ?auto_74762 - BLOCK
      ?auto_74763 - BLOCK
    )
    :vars
    (
      ?auto_74764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74757 ) ( ON ?auto_74758 ?auto_74757 ) ( not ( = ?auto_74757 ?auto_74758 ) ) ( not ( = ?auto_74757 ?auto_74759 ) ) ( not ( = ?auto_74757 ?auto_74760 ) ) ( not ( = ?auto_74757 ?auto_74761 ) ) ( not ( = ?auto_74757 ?auto_74762 ) ) ( not ( = ?auto_74757 ?auto_74763 ) ) ( not ( = ?auto_74758 ?auto_74759 ) ) ( not ( = ?auto_74758 ?auto_74760 ) ) ( not ( = ?auto_74758 ?auto_74761 ) ) ( not ( = ?auto_74758 ?auto_74762 ) ) ( not ( = ?auto_74758 ?auto_74763 ) ) ( not ( = ?auto_74759 ?auto_74760 ) ) ( not ( = ?auto_74759 ?auto_74761 ) ) ( not ( = ?auto_74759 ?auto_74762 ) ) ( not ( = ?auto_74759 ?auto_74763 ) ) ( not ( = ?auto_74760 ?auto_74761 ) ) ( not ( = ?auto_74760 ?auto_74762 ) ) ( not ( = ?auto_74760 ?auto_74763 ) ) ( not ( = ?auto_74761 ?auto_74762 ) ) ( not ( = ?auto_74761 ?auto_74763 ) ) ( not ( = ?auto_74762 ?auto_74763 ) ) ( ON ?auto_74763 ?auto_74764 ) ( not ( = ?auto_74757 ?auto_74764 ) ) ( not ( = ?auto_74758 ?auto_74764 ) ) ( not ( = ?auto_74759 ?auto_74764 ) ) ( not ( = ?auto_74760 ?auto_74764 ) ) ( not ( = ?auto_74761 ?auto_74764 ) ) ( not ( = ?auto_74762 ?auto_74764 ) ) ( not ( = ?auto_74763 ?auto_74764 ) ) ( ON ?auto_74762 ?auto_74763 ) ( ON-TABLE ?auto_74764 ) ( ON ?auto_74761 ?auto_74762 ) ( ON ?auto_74760 ?auto_74761 ) ( CLEAR ?auto_74758 ) ( ON ?auto_74759 ?auto_74760 ) ( CLEAR ?auto_74759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74764 ?auto_74763 ?auto_74762 ?auto_74761 ?auto_74760 )
      ( MAKE-7PILE ?auto_74757 ?auto_74758 ?auto_74759 ?auto_74760 ?auto_74761 ?auto_74762 ?auto_74763 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74765 - BLOCK
      ?auto_74766 - BLOCK
      ?auto_74767 - BLOCK
      ?auto_74768 - BLOCK
      ?auto_74769 - BLOCK
      ?auto_74770 - BLOCK
      ?auto_74771 - BLOCK
    )
    :vars
    (
      ?auto_74772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74765 ) ( not ( = ?auto_74765 ?auto_74766 ) ) ( not ( = ?auto_74765 ?auto_74767 ) ) ( not ( = ?auto_74765 ?auto_74768 ) ) ( not ( = ?auto_74765 ?auto_74769 ) ) ( not ( = ?auto_74765 ?auto_74770 ) ) ( not ( = ?auto_74765 ?auto_74771 ) ) ( not ( = ?auto_74766 ?auto_74767 ) ) ( not ( = ?auto_74766 ?auto_74768 ) ) ( not ( = ?auto_74766 ?auto_74769 ) ) ( not ( = ?auto_74766 ?auto_74770 ) ) ( not ( = ?auto_74766 ?auto_74771 ) ) ( not ( = ?auto_74767 ?auto_74768 ) ) ( not ( = ?auto_74767 ?auto_74769 ) ) ( not ( = ?auto_74767 ?auto_74770 ) ) ( not ( = ?auto_74767 ?auto_74771 ) ) ( not ( = ?auto_74768 ?auto_74769 ) ) ( not ( = ?auto_74768 ?auto_74770 ) ) ( not ( = ?auto_74768 ?auto_74771 ) ) ( not ( = ?auto_74769 ?auto_74770 ) ) ( not ( = ?auto_74769 ?auto_74771 ) ) ( not ( = ?auto_74770 ?auto_74771 ) ) ( ON ?auto_74771 ?auto_74772 ) ( not ( = ?auto_74765 ?auto_74772 ) ) ( not ( = ?auto_74766 ?auto_74772 ) ) ( not ( = ?auto_74767 ?auto_74772 ) ) ( not ( = ?auto_74768 ?auto_74772 ) ) ( not ( = ?auto_74769 ?auto_74772 ) ) ( not ( = ?auto_74770 ?auto_74772 ) ) ( not ( = ?auto_74771 ?auto_74772 ) ) ( ON ?auto_74770 ?auto_74771 ) ( ON-TABLE ?auto_74772 ) ( ON ?auto_74769 ?auto_74770 ) ( ON ?auto_74768 ?auto_74769 ) ( ON ?auto_74767 ?auto_74768 ) ( CLEAR ?auto_74767 ) ( HOLDING ?auto_74766 ) ( CLEAR ?auto_74765 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74765 ?auto_74766 )
      ( MAKE-7PILE ?auto_74765 ?auto_74766 ?auto_74767 ?auto_74768 ?auto_74769 ?auto_74770 ?auto_74771 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74773 - BLOCK
      ?auto_74774 - BLOCK
      ?auto_74775 - BLOCK
      ?auto_74776 - BLOCK
      ?auto_74777 - BLOCK
      ?auto_74778 - BLOCK
      ?auto_74779 - BLOCK
    )
    :vars
    (
      ?auto_74780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74773 ) ( not ( = ?auto_74773 ?auto_74774 ) ) ( not ( = ?auto_74773 ?auto_74775 ) ) ( not ( = ?auto_74773 ?auto_74776 ) ) ( not ( = ?auto_74773 ?auto_74777 ) ) ( not ( = ?auto_74773 ?auto_74778 ) ) ( not ( = ?auto_74773 ?auto_74779 ) ) ( not ( = ?auto_74774 ?auto_74775 ) ) ( not ( = ?auto_74774 ?auto_74776 ) ) ( not ( = ?auto_74774 ?auto_74777 ) ) ( not ( = ?auto_74774 ?auto_74778 ) ) ( not ( = ?auto_74774 ?auto_74779 ) ) ( not ( = ?auto_74775 ?auto_74776 ) ) ( not ( = ?auto_74775 ?auto_74777 ) ) ( not ( = ?auto_74775 ?auto_74778 ) ) ( not ( = ?auto_74775 ?auto_74779 ) ) ( not ( = ?auto_74776 ?auto_74777 ) ) ( not ( = ?auto_74776 ?auto_74778 ) ) ( not ( = ?auto_74776 ?auto_74779 ) ) ( not ( = ?auto_74777 ?auto_74778 ) ) ( not ( = ?auto_74777 ?auto_74779 ) ) ( not ( = ?auto_74778 ?auto_74779 ) ) ( ON ?auto_74779 ?auto_74780 ) ( not ( = ?auto_74773 ?auto_74780 ) ) ( not ( = ?auto_74774 ?auto_74780 ) ) ( not ( = ?auto_74775 ?auto_74780 ) ) ( not ( = ?auto_74776 ?auto_74780 ) ) ( not ( = ?auto_74777 ?auto_74780 ) ) ( not ( = ?auto_74778 ?auto_74780 ) ) ( not ( = ?auto_74779 ?auto_74780 ) ) ( ON ?auto_74778 ?auto_74779 ) ( ON-TABLE ?auto_74780 ) ( ON ?auto_74777 ?auto_74778 ) ( ON ?auto_74776 ?auto_74777 ) ( ON ?auto_74775 ?auto_74776 ) ( CLEAR ?auto_74773 ) ( ON ?auto_74774 ?auto_74775 ) ( CLEAR ?auto_74774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74780 ?auto_74779 ?auto_74778 ?auto_74777 ?auto_74776 ?auto_74775 )
      ( MAKE-7PILE ?auto_74773 ?auto_74774 ?auto_74775 ?auto_74776 ?auto_74777 ?auto_74778 ?auto_74779 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74781 - BLOCK
      ?auto_74782 - BLOCK
      ?auto_74783 - BLOCK
      ?auto_74784 - BLOCK
      ?auto_74785 - BLOCK
      ?auto_74786 - BLOCK
      ?auto_74787 - BLOCK
    )
    :vars
    (
      ?auto_74788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74781 ?auto_74782 ) ) ( not ( = ?auto_74781 ?auto_74783 ) ) ( not ( = ?auto_74781 ?auto_74784 ) ) ( not ( = ?auto_74781 ?auto_74785 ) ) ( not ( = ?auto_74781 ?auto_74786 ) ) ( not ( = ?auto_74781 ?auto_74787 ) ) ( not ( = ?auto_74782 ?auto_74783 ) ) ( not ( = ?auto_74782 ?auto_74784 ) ) ( not ( = ?auto_74782 ?auto_74785 ) ) ( not ( = ?auto_74782 ?auto_74786 ) ) ( not ( = ?auto_74782 ?auto_74787 ) ) ( not ( = ?auto_74783 ?auto_74784 ) ) ( not ( = ?auto_74783 ?auto_74785 ) ) ( not ( = ?auto_74783 ?auto_74786 ) ) ( not ( = ?auto_74783 ?auto_74787 ) ) ( not ( = ?auto_74784 ?auto_74785 ) ) ( not ( = ?auto_74784 ?auto_74786 ) ) ( not ( = ?auto_74784 ?auto_74787 ) ) ( not ( = ?auto_74785 ?auto_74786 ) ) ( not ( = ?auto_74785 ?auto_74787 ) ) ( not ( = ?auto_74786 ?auto_74787 ) ) ( ON ?auto_74787 ?auto_74788 ) ( not ( = ?auto_74781 ?auto_74788 ) ) ( not ( = ?auto_74782 ?auto_74788 ) ) ( not ( = ?auto_74783 ?auto_74788 ) ) ( not ( = ?auto_74784 ?auto_74788 ) ) ( not ( = ?auto_74785 ?auto_74788 ) ) ( not ( = ?auto_74786 ?auto_74788 ) ) ( not ( = ?auto_74787 ?auto_74788 ) ) ( ON ?auto_74786 ?auto_74787 ) ( ON-TABLE ?auto_74788 ) ( ON ?auto_74785 ?auto_74786 ) ( ON ?auto_74784 ?auto_74785 ) ( ON ?auto_74783 ?auto_74784 ) ( ON ?auto_74782 ?auto_74783 ) ( CLEAR ?auto_74782 ) ( HOLDING ?auto_74781 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74781 )
      ( MAKE-7PILE ?auto_74781 ?auto_74782 ?auto_74783 ?auto_74784 ?auto_74785 ?auto_74786 ?auto_74787 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74789 - BLOCK
      ?auto_74790 - BLOCK
      ?auto_74791 - BLOCK
      ?auto_74792 - BLOCK
      ?auto_74793 - BLOCK
      ?auto_74794 - BLOCK
      ?auto_74795 - BLOCK
    )
    :vars
    (
      ?auto_74796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_74789 ?auto_74790 ) ) ( not ( = ?auto_74789 ?auto_74791 ) ) ( not ( = ?auto_74789 ?auto_74792 ) ) ( not ( = ?auto_74789 ?auto_74793 ) ) ( not ( = ?auto_74789 ?auto_74794 ) ) ( not ( = ?auto_74789 ?auto_74795 ) ) ( not ( = ?auto_74790 ?auto_74791 ) ) ( not ( = ?auto_74790 ?auto_74792 ) ) ( not ( = ?auto_74790 ?auto_74793 ) ) ( not ( = ?auto_74790 ?auto_74794 ) ) ( not ( = ?auto_74790 ?auto_74795 ) ) ( not ( = ?auto_74791 ?auto_74792 ) ) ( not ( = ?auto_74791 ?auto_74793 ) ) ( not ( = ?auto_74791 ?auto_74794 ) ) ( not ( = ?auto_74791 ?auto_74795 ) ) ( not ( = ?auto_74792 ?auto_74793 ) ) ( not ( = ?auto_74792 ?auto_74794 ) ) ( not ( = ?auto_74792 ?auto_74795 ) ) ( not ( = ?auto_74793 ?auto_74794 ) ) ( not ( = ?auto_74793 ?auto_74795 ) ) ( not ( = ?auto_74794 ?auto_74795 ) ) ( ON ?auto_74795 ?auto_74796 ) ( not ( = ?auto_74789 ?auto_74796 ) ) ( not ( = ?auto_74790 ?auto_74796 ) ) ( not ( = ?auto_74791 ?auto_74796 ) ) ( not ( = ?auto_74792 ?auto_74796 ) ) ( not ( = ?auto_74793 ?auto_74796 ) ) ( not ( = ?auto_74794 ?auto_74796 ) ) ( not ( = ?auto_74795 ?auto_74796 ) ) ( ON ?auto_74794 ?auto_74795 ) ( ON-TABLE ?auto_74796 ) ( ON ?auto_74793 ?auto_74794 ) ( ON ?auto_74792 ?auto_74793 ) ( ON ?auto_74791 ?auto_74792 ) ( ON ?auto_74790 ?auto_74791 ) ( ON ?auto_74789 ?auto_74790 ) ( CLEAR ?auto_74789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74796 ?auto_74795 ?auto_74794 ?auto_74793 ?auto_74792 ?auto_74791 ?auto_74790 )
      ( MAKE-7PILE ?auto_74789 ?auto_74790 ?auto_74791 ?auto_74792 ?auto_74793 ?auto_74794 ?auto_74795 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74903 - BLOCK
    )
    :vars
    (
      ?auto_74904 - BLOCK
      ?auto_74905 - BLOCK
      ?auto_74906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74903 ?auto_74904 ) ( CLEAR ?auto_74903 ) ( not ( = ?auto_74903 ?auto_74904 ) ) ( HOLDING ?auto_74905 ) ( CLEAR ?auto_74906 ) ( not ( = ?auto_74903 ?auto_74905 ) ) ( not ( = ?auto_74903 ?auto_74906 ) ) ( not ( = ?auto_74904 ?auto_74905 ) ) ( not ( = ?auto_74904 ?auto_74906 ) ) ( not ( = ?auto_74905 ?auto_74906 ) ) )
    :subtasks
    ( ( !STACK ?auto_74905 ?auto_74906 )
      ( MAKE-1PILE ?auto_74903 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74907 - BLOCK
    )
    :vars
    (
      ?auto_74909 - BLOCK
      ?auto_74908 - BLOCK
      ?auto_74910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74907 ?auto_74909 ) ( not ( = ?auto_74907 ?auto_74909 ) ) ( CLEAR ?auto_74908 ) ( not ( = ?auto_74907 ?auto_74910 ) ) ( not ( = ?auto_74907 ?auto_74908 ) ) ( not ( = ?auto_74909 ?auto_74910 ) ) ( not ( = ?auto_74909 ?auto_74908 ) ) ( not ( = ?auto_74910 ?auto_74908 ) ) ( ON ?auto_74910 ?auto_74907 ) ( CLEAR ?auto_74910 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74909 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74909 ?auto_74907 )
      ( MAKE-1PILE ?auto_74907 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74911 - BLOCK
    )
    :vars
    (
      ?auto_74913 - BLOCK
      ?auto_74912 - BLOCK
      ?auto_74914 - BLOCK
      ?auto_74918 - BLOCK
      ?auto_74916 - BLOCK
      ?auto_74917 - BLOCK
      ?auto_74915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74911 ?auto_74913 ) ( not ( = ?auto_74911 ?auto_74913 ) ) ( not ( = ?auto_74911 ?auto_74912 ) ) ( not ( = ?auto_74911 ?auto_74914 ) ) ( not ( = ?auto_74913 ?auto_74912 ) ) ( not ( = ?auto_74913 ?auto_74914 ) ) ( not ( = ?auto_74912 ?auto_74914 ) ) ( ON ?auto_74912 ?auto_74911 ) ( CLEAR ?auto_74912 ) ( ON-TABLE ?auto_74913 ) ( HOLDING ?auto_74914 ) ( CLEAR ?auto_74918 ) ( ON-TABLE ?auto_74916 ) ( ON ?auto_74917 ?auto_74916 ) ( ON ?auto_74915 ?auto_74917 ) ( ON ?auto_74918 ?auto_74915 ) ( not ( = ?auto_74916 ?auto_74917 ) ) ( not ( = ?auto_74916 ?auto_74915 ) ) ( not ( = ?auto_74916 ?auto_74918 ) ) ( not ( = ?auto_74916 ?auto_74914 ) ) ( not ( = ?auto_74917 ?auto_74915 ) ) ( not ( = ?auto_74917 ?auto_74918 ) ) ( not ( = ?auto_74917 ?auto_74914 ) ) ( not ( = ?auto_74915 ?auto_74918 ) ) ( not ( = ?auto_74915 ?auto_74914 ) ) ( not ( = ?auto_74918 ?auto_74914 ) ) ( not ( = ?auto_74911 ?auto_74918 ) ) ( not ( = ?auto_74911 ?auto_74916 ) ) ( not ( = ?auto_74911 ?auto_74917 ) ) ( not ( = ?auto_74911 ?auto_74915 ) ) ( not ( = ?auto_74913 ?auto_74918 ) ) ( not ( = ?auto_74913 ?auto_74916 ) ) ( not ( = ?auto_74913 ?auto_74917 ) ) ( not ( = ?auto_74913 ?auto_74915 ) ) ( not ( = ?auto_74912 ?auto_74918 ) ) ( not ( = ?auto_74912 ?auto_74916 ) ) ( not ( = ?auto_74912 ?auto_74917 ) ) ( not ( = ?auto_74912 ?auto_74915 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74916 ?auto_74917 ?auto_74915 ?auto_74918 ?auto_74914 )
      ( MAKE-1PILE ?auto_74911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74919 - BLOCK
    )
    :vars
    (
      ?auto_74922 - BLOCK
      ?auto_74924 - BLOCK
      ?auto_74923 - BLOCK
      ?auto_74926 - BLOCK
      ?auto_74920 - BLOCK
      ?auto_74921 - BLOCK
      ?auto_74925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74919 ?auto_74922 ) ( not ( = ?auto_74919 ?auto_74922 ) ) ( not ( = ?auto_74919 ?auto_74924 ) ) ( not ( = ?auto_74919 ?auto_74923 ) ) ( not ( = ?auto_74922 ?auto_74924 ) ) ( not ( = ?auto_74922 ?auto_74923 ) ) ( not ( = ?auto_74924 ?auto_74923 ) ) ( ON ?auto_74924 ?auto_74919 ) ( ON-TABLE ?auto_74922 ) ( CLEAR ?auto_74926 ) ( ON-TABLE ?auto_74920 ) ( ON ?auto_74921 ?auto_74920 ) ( ON ?auto_74925 ?auto_74921 ) ( ON ?auto_74926 ?auto_74925 ) ( not ( = ?auto_74920 ?auto_74921 ) ) ( not ( = ?auto_74920 ?auto_74925 ) ) ( not ( = ?auto_74920 ?auto_74926 ) ) ( not ( = ?auto_74920 ?auto_74923 ) ) ( not ( = ?auto_74921 ?auto_74925 ) ) ( not ( = ?auto_74921 ?auto_74926 ) ) ( not ( = ?auto_74921 ?auto_74923 ) ) ( not ( = ?auto_74925 ?auto_74926 ) ) ( not ( = ?auto_74925 ?auto_74923 ) ) ( not ( = ?auto_74926 ?auto_74923 ) ) ( not ( = ?auto_74919 ?auto_74926 ) ) ( not ( = ?auto_74919 ?auto_74920 ) ) ( not ( = ?auto_74919 ?auto_74921 ) ) ( not ( = ?auto_74919 ?auto_74925 ) ) ( not ( = ?auto_74922 ?auto_74926 ) ) ( not ( = ?auto_74922 ?auto_74920 ) ) ( not ( = ?auto_74922 ?auto_74921 ) ) ( not ( = ?auto_74922 ?auto_74925 ) ) ( not ( = ?auto_74924 ?auto_74926 ) ) ( not ( = ?auto_74924 ?auto_74920 ) ) ( not ( = ?auto_74924 ?auto_74921 ) ) ( not ( = ?auto_74924 ?auto_74925 ) ) ( ON ?auto_74923 ?auto_74924 ) ( CLEAR ?auto_74923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74922 ?auto_74919 ?auto_74924 )
      ( MAKE-1PILE ?auto_74919 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74927 - BLOCK
    )
    :vars
    (
      ?auto_74931 - BLOCK
      ?auto_74928 - BLOCK
      ?auto_74934 - BLOCK
      ?auto_74929 - BLOCK
      ?auto_74932 - BLOCK
      ?auto_74930 - BLOCK
      ?auto_74933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74927 ?auto_74931 ) ( not ( = ?auto_74927 ?auto_74931 ) ) ( not ( = ?auto_74927 ?auto_74928 ) ) ( not ( = ?auto_74927 ?auto_74934 ) ) ( not ( = ?auto_74931 ?auto_74928 ) ) ( not ( = ?auto_74931 ?auto_74934 ) ) ( not ( = ?auto_74928 ?auto_74934 ) ) ( ON ?auto_74928 ?auto_74927 ) ( ON-TABLE ?auto_74931 ) ( ON-TABLE ?auto_74929 ) ( ON ?auto_74932 ?auto_74929 ) ( ON ?auto_74930 ?auto_74932 ) ( not ( = ?auto_74929 ?auto_74932 ) ) ( not ( = ?auto_74929 ?auto_74930 ) ) ( not ( = ?auto_74929 ?auto_74933 ) ) ( not ( = ?auto_74929 ?auto_74934 ) ) ( not ( = ?auto_74932 ?auto_74930 ) ) ( not ( = ?auto_74932 ?auto_74933 ) ) ( not ( = ?auto_74932 ?auto_74934 ) ) ( not ( = ?auto_74930 ?auto_74933 ) ) ( not ( = ?auto_74930 ?auto_74934 ) ) ( not ( = ?auto_74933 ?auto_74934 ) ) ( not ( = ?auto_74927 ?auto_74933 ) ) ( not ( = ?auto_74927 ?auto_74929 ) ) ( not ( = ?auto_74927 ?auto_74932 ) ) ( not ( = ?auto_74927 ?auto_74930 ) ) ( not ( = ?auto_74931 ?auto_74933 ) ) ( not ( = ?auto_74931 ?auto_74929 ) ) ( not ( = ?auto_74931 ?auto_74932 ) ) ( not ( = ?auto_74931 ?auto_74930 ) ) ( not ( = ?auto_74928 ?auto_74933 ) ) ( not ( = ?auto_74928 ?auto_74929 ) ) ( not ( = ?auto_74928 ?auto_74932 ) ) ( not ( = ?auto_74928 ?auto_74930 ) ) ( ON ?auto_74934 ?auto_74928 ) ( CLEAR ?auto_74934 ) ( HOLDING ?auto_74933 ) ( CLEAR ?auto_74930 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74929 ?auto_74932 ?auto_74930 ?auto_74933 )
      ( MAKE-1PILE ?auto_74927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74935 - BLOCK
    )
    :vars
    (
      ?auto_74937 - BLOCK
      ?auto_74938 - BLOCK
      ?auto_74941 - BLOCK
      ?auto_74936 - BLOCK
      ?auto_74942 - BLOCK
      ?auto_74940 - BLOCK
      ?auto_74939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74935 ?auto_74937 ) ( not ( = ?auto_74935 ?auto_74937 ) ) ( not ( = ?auto_74935 ?auto_74938 ) ) ( not ( = ?auto_74935 ?auto_74941 ) ) ( not ( = ?auto_74937 ?auto_74938 ) ) ( not ( = ?auto_74937 ?auto_74941 ) ) ( not ( = ?auto_74938 ?auto_74941 ) ) ( ON ?auto_74938 ?auto_74935 ) ( ON-TABLE ?auto_74937 ) ( ON-TABLE ?auto_74936 ) ( ON ?auto_74942 ?auto_74936 ) ( ON ?auto_74940 ?auto_74942 ) ( not ( = ?auto_74936 ?auto_74942 ) ) ( not ( = ?auto_74936 ?auto_74940 ) ) ( not ( = ?auto_74936 ?auto_74939 ) ) ( not ( = ?auto_74936 ?auto_74941 ) ) ( not ( = ?auto_74942 ?auto_74940 ) ) ( not ( = ?auto_74942 ?auto_74939 ) ) ( not ( = ?auto_74942 ?auto_74941 ) ) ( not ( = ?auto_74940 ?auto_74939 ) ) ( not ( = ?auto_74940 ?auto_74941 ) ) ( not ( = ?auto_74939 ?auto_74941 ) ) ( not ( = ?auto_74935 ?auto_74939 ) ) ( not ( = ?auto_74935 ?auto_74936 ) ) ( not ( = ?auto_74935 ?auto_74942 ) ) ( not ( = ?auto_74935 ?auto_74940 ) ) ( not ( = ?auto_74937 ?auto_74939 ) ) ( not ( = ?auto_74937 ?auto_74936 ) ) ( not ( = ?auto_74937 ?auto_74942 ) ) ( not ( = ?auto_74937 ?auto_74940 ) ) ( not ( = ?auto_74938 ?auto_74939 ) ) ( not ( = ?auto_74938 ?auto_74936 ) ) ( not ( = ?auto_74938 ?auto_74942 ) ) ( not ( = ?auto_74938 ?auto_74940 ) ) ( ON ?auto_74941 ?auto_74938 ) ( CLEAR ?auto_74940 ) ( ON ?auto_74939 ?auto_74941 ) ( CLEAR ?auto_74939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74937 ?auto_74935 ?auto_74938 ?auto_74941 )
      ( MAKE-1PILE ?auto_74935 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74943 - BLOCK
    )
    :vars
    (
      ?auto_74946 - BLOCK
      ?auto_74949 - BLOCK
      ?auto_74945 - BLOCK
      ?auto_74948 - BLOCK
      ?auto_74944 - BLOCK
      ?auto_74950 - BLOCK
      ?auto_74947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74943 ?auto_74946 ) ( not ( = ?auto_74943 ?auto_74946 ) ) ( not ( = ?auto_74943 ?auto_74949 ) ) ( not ( = ?auto_74943 ?auto_74945 ) ) ( not ( = ?auto_74946 ?auto_74949 ) ) ( not ( = ?auto_74946 ?auto_74945 ) ) ( not ( = ?auto_74949 ?auto_74945 ) ) ( ON ?auto_74949 ?auto_74943 ) ( ON-TABLE ?auto_74946 ) ( ON-TABLE ?auto_74948 ) ( ON ?auto_74944 ?auto_74948 ) ( not ( = ?auto_74948 ?auto_74944 ) ) ( not ( = ?auto_74948 ?auto_74950 ) ) ( not ( = ?auto_74948 ?auto_74947 ) ) ( not ( = ?auto_74948 ?auto_74945 ) ) ( not ( = ?auto_74944 ?auto_74950 ) ) ( not ( = ?auto_74944 ?auto_74947 ) ) ( not ( = ?auto_74944 ?auto_74945 ) ) ( not ( = ?auto_74950 ?auto_74947 ) ) ( not ( = ?auto_74950 ?auto_74945 ) ) ( not ( = ?auto_74947 ?auto_74945 ) ) ( not ( = ?auto_74943 ?auto_74947 ) ) ( not ( = ?auto_74943 ?auto_74948 ) ) ( not ( = ?auto_74943 ?auto_74944 ) ) ( not ( = ?auto_74943 ?auto_74950 ) ) ( not ( = ?auto_74946 ?auto_74947 ) ) ( not ( = ?auto_74946 ?auto_74948 ) ) ( not ( = ?auto_74946 ?auto_74944 ) ) ( not ( = ?auto_74946 ?auto_74950 ) ) ( not ( = ?auto_74949 ?auto_74947 ) ) ( not ( = ?auto_74949 ?auto_74948 ) ) ( not ( = ?auto_74949 ?auto_74944 ) ) ( not ( = ?auto_74949 ?auto_74950 ) ) ( ON ?auto_74945 ?auto_74949 ) ( ON ?auto_74947 ?auto_74945 ) ( CLEAR ?auto_74947 ) ( HOLDING ?auto_74950 ) ( CLEAR ?auto_74944 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74948 ?auto_74944 ?auto_74950 )
      ( MAKE-1PILE ?auto_74943 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74951 - BLOCK
    )
    :vars
    (
      ?auto_74954 - BLOCK
      ?auto_74958 - BLOCK
      ?auto_74956 - BLOCK
      ?auto_74955 - BLOCK
      ?auto_74957 - BLOCK
      ?auto_74953 - BLOCK
      ?auto_74952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74951 ?auto_74954 ) ( not ( = ?auto_74951 ?auto_74954 ) ) ( not ( = ?auto_74951 ?auto_74958 ) ) ( not ( = ?auto_74951 ?auto_74956 ) ) ( not ( = ?auto_74954 ?auto_74958 ) ) ( not ( = ?auto_74954 ?auto_74956 ) ) ( not ( = ?auto_74958 ?auto_74956 ) ) ( ON ?auto_74958 ?auto_74951 ) ( ON-TABLE ?auto_74954 ) ( ON-TABLE ?auto_74955 ) ( ON ?auto_74957 ?auto_74955 ) ( not ( = ?auto_74955 ?auto_74957 ) ) ( not ( = ?auto_74955 ?auto_74953 ) ) ( not ( = ?auto_74955 ?auto_74952 ) ) ( not ( = ?auto_74955 ?auto_74956 ) ) ( not ( = ?auto_74957 ?auto_74953 ) ) ( not ( = ?auto_74957 ?auto_74952 ) ) ( not ( = ?auto_74957 ?auto_74956 ) ) ( not ( = ?auto_74953 ?auto_74952 ) ) ( not ( = ?auto_74953 ?auto_74956 ) ) ( not ( = ?auto_74952 ?auto_74956 ) ) ( not ( = ?auto_74951 ?auto_74952 ) ) ( not ( = ?auto_74951 ?auto_74955 ) ) ( not ( = ?auto_74951 ?auto_74957 ) ) ( not ( = ?auto_74951 ?auto_74953 ) ) ( not ( = ?auto_74954 ?auto_74952 ) ) ( not ( = ?auto_74954 ?auto_74955 ) ) ( not ( = ?auto_74954 ?auto_74957 ) ) ( not ( = ?auto_74954 ?auto_74953 ) ) ( not ( = ?auto_74958 ?auto_74952 ) ) ( not ( = ?auto_74958 ?auto_74955 ) ) ( not ( = ?auto_74958 ?auto_74957 ) ) ( not ( = ?auto_74958 ?auto_74953 ) ) ( ON ?auto_74956 ?auto_74958 ) ( ON ?auto_74952 ?auto_74956 ) ( CLEAR ?auto_74957 ) ( ON ?auto_74953 ?auto_74952 ) ( CLEAR ?auto_74953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74954 ?auto_74951 ?auto_74958 ?auto_74956 ?auto_74952 )
      ( MAKE-1PILE ?auto_74951 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74959 - BLOCK
    )
    :vars
    (
      ?auto_74962 - BLOCK
      ?auto_74966 - BLOCK
      ?auto_74960 - BLOCK
      ?auto_74964 - BLOCK
      ?auto_74961 - BLOCK
      ?auto_74963 - BLOCK
      ?auto_74965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74959 ?auto_74962 ) ( not ( = ?auto_74959 ?auto_74962 ) ) ( not ( = ?auto_74959 ?auto_74966 ) ) ( not ( = ?auto_74959 ?auto_74960 ) ) ( not ( = ?auto_74962 ?auto_74966 ) ) ( not ( = ?auto_74962 ?auto_74960 ) ) ( not ( = ?auto_74966 ?auto_74960 ) ) ( ON ?auto_74966 ?auto_74959 ) ( ON-TABLE ?auto_74962 ) ( ON-TABLE ?auto_74964 ) ( not ( = ?auto_74964 ?auto_74961 ) ) ( not ( = ?auto_74964 ?auto_74963 ) ) ( not ( = ?auto_74964 ?auto_74965 ) ) ( not ( = ?auto_74964 ?auto_74960 ) ) ( not ( = ?auto_74961 ?auto_74963 ) ) ( not ( = ?auto_74961 ?auto_74965 ) ) ( not ( = ?auto_74961 ?auto_74960 ) ) ( not ( = ?auto_74963 ?auto_74965 ) ) ( not ( = ?auto_74963 ?auto_74960 ) ) ( not ( = ?auto_74965 ?auto_74960 ) ) ( not ( = ?auto_74959 ?auto_74965 ) ) ( not ( = ?auto_74959 ?auto_74964 ) ) ( not ( = ?auto_74959 ?auto_74961 ) ) ( not ( = ?auto_74959 ?auto_74963 ) ) ( not ( = ?auto_74962 ?auto_74965 ) ) ( not ( = ?auto_74962 ?auto_74964 ) ) ( not ( = ?auto_74962 ?auto_74961 ) ) ( not ( = ?auto_74962 ?auto_74963 ) ) ( not ( = ?auto_74966 ?auto_74965 ) ) ( not ( = ?auto_74966 ?auto_74964 ) ) ( not ( = ?auto_74966 ?auto_74961 ) ) ( not ( = ?auto_74966 ?auto_74963 ) ) ( ON ?auto_74960 ?auto_74966 ) ( ON ?auto_74965 ?auto_74960 ) ( ON ?auto_74963 ?auto_74965 ) ( CLEAR ?auto_74963 ) ( HOLDING ?auto_74961 ) ( CLEAR ?auto_74964 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74964 ?auto_74961 )
      ( MAKE-1PILE ?auto_74959 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74967 - BLOCK
    )
    :vars
    (
      ?auto_74970 - BLOCK
      ?auto_74972 - BLOCK
      ?auto_74968 - BLOCK
      ?auto_74974 - BLOCK
      ?auto_74973 - BLOCK
      ?auto_74969 - BLOCK
      ?auto_74971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74967 ?auto_74970 ) ( not ( = ?auto_74967 ?auto_74970 ) ) ( not ( = ?auto_74967 ?auto_74972 ) ) ( not ( = ?auto_74967 ?auto_74968 ) ) ( not ( = ?auto_74970 ?auto_74972 ) ) ( not ( = ?auto_74970 ?auto_74968 ) ) ( not ( = ?auto_74972 ?auto_74968 ) ) ( ON ?auto_74972 ?auto_74967 ) ( ON-TABLE ?auto_74970 ) ( ON-TABLE ?auto_74974 ) ( not ( = ?auto_74974 ?auto_74973 ) ) ( not ( = ?auto_74974 ?auto_74969 ) ) ( not ( = ?auto_74974 ?auto_74971 ) ) ( not ( = ?auto_74974 ?auto_74968 ) ) ( not ( = ?auto_74973 ?auto_74969 ) ) ( not ( = ?auto_74973 ?auto_74971 ) ) ( not ( = ?auto_74973 ?auto_74968 ) ) ( not ( = ?auto_74969 ?auto_74971 ) ) ( not ( = ?auto_74969 ?auto_74968 ) ) ( not ( = ?auto_74971 ?auto_74968 ) ) ( not ( = ?auto_74967 ?auto_74971 ) ) ( not ( = ?auto_74967 ?auto_74974 ) ) ( not ( = ?auto_74967 ?auto_74973 ) ) ( not ( = ?auto_74967 ?auto_74969 ) ) ( not ( = ?auto_74970 ?auto_74971 ) ) ( not ( = ?auto_74970 ?auto_74974 ) ) ( not ( = ?auto_74970 ?auto_74973 ) ) ( not ( = ?auto_74970 ?auto_74969 ) ) ( not ( = ?auto_74972 ?auto_74971 ) ) ( not ( = ?auto_74972 ?auto_74974 ) ) ( not ( = ?auto_74972 ?auto_74973 ) ) ( not ( = ?auto_74972 ?auto_74969 ) ) ( ON ?auto_74968 ?auto_74972 ) ( ON ?auto_74971 ?auto_74968 ) ( ON ?auto_74969 ?auto_74971 ) ( CLEAR ?auto_74974 ) ( ON ?auto_74973 ?auto_74969 ) ( CLEAR ?auto_74973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74970 ?auto_74967 ?auto_74972 ?auto_74968 ?auto_74971 ?auto_74969 )
      ( MAKE-1PILE ?auto_74967 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74975 - BLOCK
    )
    :vars
    (
      ?auto_74977 - BLOCK
      ?auto_74976 - BLOCK
      ?auto_74978 - BLOCK
      ?auto_74982 - BLOCK
      ?auto_74981 - BLOCK
      ?auto_74980 - BLOCK
      ?auto_74979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74975 ?auto_74977 ) ( not ( = ?auto_74975 ?auto_74977 ) ) ( not ( = ?auto_74975 ?auto_74976 ) ) ( not ( = ?auto_74975 ?auto_74978 ) ) ( not ( = ?auto_74977 ?auto_74976 ) ) ( not ( = ?auto_74977 ?auto_74978 ) ) ( not ( = ?auto_74976 ?auto_74978 ) ) ( ON ?auto_74976 ?auto_74975 ) ( ON-TABLE ?auto_74977 ) ( not ( = ?auto_74982 ?auto_74981 ) ) ( not ( = ?auto_74982 ?auto_74980 ) ) ( not ( = ?auto_74982 ?auto_74979 ) ) ( not ( = ?auto_74982 ?auto_74978 ) ) ( not ( = ?auto_74981 ?auto_74980 ) ) ( not ( = ?auto_74981 ?auto_74979 ) ) ( not ( = ?auto_74981 ?auto_74978 ) ) ( not ( = ?auto_74980 ?auto_74979 ) ) ( not ( = ?auto_74980 ?auto_74978 ) ) ( not ( = ?auto_74979 ?auto_74978 ) ) ( not ( = ?auto_74975 ?auto_74979 ) ) ( not ( = ?auto_74975 ?auto_74982 ) ) ( not ( = ?auto_74975 ?auto_74981 ) ) ( not ( = ?auto_74975 ?auto_74980 ) ) ( not ( = ?auto_74977 ?auto_74979 ) ) ( not ( = ?auto_74977 ?auto_74982 ) ) ( not ( = ?auto_74977 ?auto_74981 ) ) ( not ( = ?auto_74977 ?auto_74980 ) ) ( not ( = ?auto_74976 ?auto_74979 ) ) ( not ( = ?auto_74976 ?auto_74982 ) ) ( not ( = ?auto_74976 ?auto_74981 ) ) ( not ( = ?auto_74976 ?auto_74980 ) ) ( ON ?auto_74978 ?auto_74976 ) ( ON ?auto_74979 ?auto_74978 ) ( ON ?auto_74980 ?auto_74979 ) ( ON ?auto_74981 ?auto_74980 ) ( CLEAR ?auto_74981 ) ( HOLDING ?auto_74982 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74982 )
      ( MAKE-1PILE ?auto_74975 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_74983 - BLOCK
    )
    :vars
    (
      ?auto_74984 - BLOCK
      ?auto_74987 - BLOCK
      ?auto_74988 - BLOCK
      ?auto_74986 - BLOCK
      ?auto_74990 - BLOCK
      ?auto_74989 - BLOCK
      ?auto_74985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74983 ?auto_74984 ) ( not ( = ?auto_74983 ?auto_74984 ) ) ( not ( = ?auto_74983 ?auto_74987 ) ) ( not ( = ?auto_74983 ?auto_74988 ) ) ( not ( = ?auto_74984 ?auto_74987 ) ) ( not ( = ?auto_74984 ?auto_74988 ) ) ( not ( = ?auto_74987 ?auto_74988 ) ) ( ON ?auto_74987 ?auto_74983 ) ( ON-TABLE ?auto_74984 ) ( not ( = ?auto_74986 ?auto_74990 ) ) ( not ( = ?auto_74986 ?auto_74989 ) ) ( not ( = ?auto_74986 ?auto_74985 ) ) ( not ( = ?auto_74986 ?auto_74988 ) ) ( not ( = ?auto_74990 ?auto_74989 ) ) ( not ( = ?auto_74990 ?auto_74985 ) ) ( not ( = ?auto_74990 ?auto_74988 ) ) ( not ( = ?auto_74989 ?auto_74985 ) ) ( not ( = ?auto_74989 ?auto_74988 ) ) ( not ( = ?auto_74985 ?auto_74988 ) ) ( not ( = ?auto_74983 ?auto_74985 ) ) ( not ( = ?auto_74983 ?auto_74986 ) ) ( not ( = ?auto_74983 ?auto_74990 ) ) ( not ( = ?auto_74983 ?auto_74989 ) ) ( not ( = ?auto_74984 ?auto_74985 ) ) ( not ( = ?auto_74984 ?auto_74986 ) ) ( not ( = ?auto_74984 ?auto_74990 ) ) ( not ( = ?auto_74984 ?auto_74989 ) ) ( not ( = ?auto_74987 ?auto_74985 ) ) ( not ( = ?auto_74987 ?auto_74986 ) ) ( not ( = ?auto_74987 ?auto_74990 ) ) ( not ( = ?auto_74987 ?auto_74989 ) ) ( ON ?auto_74988 ?auto_74987 ) ( ON ?auto_74985 ?auto_74988 ) ( ON ?auto_74989 ?auto_74985 ) ( ON ?auto_74990 ?auto_74989 ) ( ON ?auto_74986 ?auto_74990 ) ( CLEAR ?auto_74986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74984 ?auto_74983 ?auto_74987 ?auto_74988 ?auto_74985 ?auto_74989 ?auto_74990 )
      ( MAKE-1PILE ?auto_74983 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75002 - BLOCK
      ?auto_75003 - BLOCK
      ?auto_75004 - BLOCK
      ?auto_75005 - BLOCK
      ?auto_75006 - BLOCK
    )
    :vars
    (
      ?auto_75007 - BLOCK
      ?auto_75008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75007 ?auto_75006 ) ( CLEAR ?auto_75007 ) ( ON-TABLE ?auto_75002 ) ( ON ?auto_75003 ?auto_75002 ) ( ON ?auto_75004 ?auto_75003 ) ( ON ?auto_75005 ?auto_75004 ) ( ON ?auto_75006 ?auto_75005 ) ( not ( = ?auto_75002 ?auto_75003 ) ) ( not ( = ?auto_75002 ?auto_75004 ) ) ( not ( = ?auto_75002 ?auto_75005 ) ) ( not ( = ?auto_75002 ?auto_75006 ) ) ( not ( = ?auto_75002 ?auto_75007 ) ) ( not ( = ?auto_75003 ?auto_75004 ) ) ( not ( = ?auto_75003 ?auto_75005 ) ) ( not ( = ?auto_75003 ?auto_75006 ) ) ( not ( = ?auto_75003 ?auto_75007 ) ) ( not ( = ?auto_75004 ?auto_75005 ) ) ( not ( = ?auto_75004 ?auto_75006 ) ) ( not ( = ?auto_75004 ?auto_75007 ) ) ( not ( = ?auto_75005 ?auto_75006 ) ) ( not ( = ?auto_75005 ?auto_75007 ) ) ( not ( = ?auto_75006 ?auto_75007 ) ) ( HOLDING ?auto_75008 ) ( not ( = ?auto_75002 ?auto_75008 ) ) ( not ( = ?auto_75003 ?auto_75008 ) ) ( not ( = ?auto_75004 ?auto_75008 ) ) ( not ( = ?auto_75005 ?auto_75008 ) ) ( not ( = ?auto_75006 ?auto_75008 ) ) ( not ( = ?auto_75007 ?auto_75008 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_75008 )
      ( MAKE-5PILE ?auto_75002 ?auto_75003 ?auto_75004 ?auto_75005 ?auto_75006 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75099 - BLOCK
      ?auto_75100 - BLOCK
    )
    :vars
    (
      ?auto_75101 - BLOCK
      ?auto_75102 - BLOCK
      ?auto_75103 - BLOCK
      ?auto_75104 - BLOCK
      ?auto_75105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75099 ?auto_75100 ) ) ( ON ?auto_75100 ?auto_75101 ) ( not ( = ?auto_75099 ?auto_75101 ) ) ( not ( = ?auto_75100 ?auto_75101 ) ) ( ON ?auto_75099 ?auto_75100 ) ( CLEAR ?auto_75099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75102 ) ( ON ?auto_75103 ?auto_75102 ) ( ON ?auto_75104 ?auto_75103 ) ( ON ?auto_75105 ?auto_75104 ) ( ON ?auto_75101 ?auto_75105 ) ( not ( = ?auto_75102 ?auto_75103 ) ) ( not ( = ?auto_75102 ?auto_75104 ) ) ( not ( = ?auto_75102 ?auto_75105 ) ) ( not ( = ?auto_75102 ?auto_75101 ) ) ( not ( = ?auto_75102 ?auto_75100 ) ) ( not ( = ?auto_75102 ?auto_75099 ) ) ( not ( = ?auto_75103 ?auto_75104 ) ) ( not ( = ?auto_75103 ?auto_75105 ) ) ( not ( = ?auto_75103 ?auto_75101 ) ) ( not ( = ?auto_75103 ?auto_75100 ) ) ( not ( = ?auto_75103 ?auto_75099 ) ) ( not ( = ?auto_75104 ?auto_75105 ) ) ( not ( = ?auto_75104 ?auto_75101 ) ) ( not ( = ?auto_75104 ?auto_75100 ) ) ( not ( = ?auto_75104 ?auto_75099 ) ) ( not ( = ?auto_75105 ?auto_75101 ) ) ( not ( = ?auto_75105 ?auto_75100 ) ) ( not ( = ?auto_75105 ?auto_75099 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75102 ?auto_75103 ?auto_75104 ?auto_75105 ?auto_75101 ?auto_75100 )
      ( MAKE-2PILE ?auto_75099 ?auto_75100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75108 - BLOCK
      ?auto_75109 - BLOCK
    )
    :vars
    (
      ?auto_75110 - BLOCK
      ?auto_75111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75108 ?auto_75109 ) ) ( ON ?auto_75109 ?auto_75110 ) ( CLEAR ?auto_75109 ) ( not ( = ?auto_75108 ?auto_75110 ) ) ( not ( = ?auto_75109 ?auto_75110 ) ) ( ON ?auto_75108 ?auto_75111 ) ( CLEAR ?auto_75108 ) ( HAND-EMPTY ) ( not ( = ?auto_75108 ?auto_75111 ) ) ( not ( = ?auto_75109 ?auto_75111 ) ) ( not ( = ?auto_75110 ?auto_75111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75108 ?auto_75111 )
      ( MAKE-2PILE ?auto_75108 ?auto_75109 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75112 - BLOCK
      ?auto_75113 - BLOCK
    )
    :vars
    (
      ?auto_75114 - BLOCK
      ?auto_75115 - BLOCK
      ?auto_75116 - BLOCK
      ?auto_75118 - BLOCK
      ?auto_75117 - BLOCK
      ?auto_75119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75112 ?auto_75113 ) ) ( not ( = ?auto_75112 ?auto_75114 ) ) ( not ( = ?auto_75113 ?auto_75114 ) ) ( ON ?auto_75112 ?auto_75115 ) ( CLEAR ?auto_75112 ) ( not ( = ?auto_75112 ?auto_75115 ) ) ( not ( = ?auto_75113 ?auto_75115 ) ) ( not ( = ?auto_75114 ?auto_75115 ) ) ( HOLDING ?auto_75113 ) ( CLEAR ?auto_75114 ) ( ON-TABLE ?auto_75116 ) ( ON ?auto_75118 ?auto_75116 ) ( ON ?auto_75117 ?auto_75118 ) ( ON ?auto_75119 ?auto_75117 ) ( ON ?auto_75114 ?auto_75119 ) ( not ( = ?auto_75116 ?auto_75118 ) ) ( not ( = ?auto_75116 ?auto_75117 ) ) ( not ( = ?auto_75116 ?auto_75119 ) ) ( not ( = ?auto_75116 ?auto_75114 ) ) ( not ( = ?auto_75116 ?auto_75113 ) ) ( not ( = ?auto_75118 ?auto_75117 ) ) ( not ( = ?auto_75118 ?auto_75119 ) ) ( not ( = ?auto_75118 ?auto_75114 ) ) ( not ( = ?auto_75118 ?auto_75113 ) ) ( not ( = ?auto_75117 ?auto_75119 ) ) ( not ( = ?auto_75117 ?auto_75114 ) ) ( not ( = ?auto_75117 ?auto_75113 ) ) ( not ( = ?auto_75119 ?auto_75114 ) ) ( not ( = ?auto_75119 ?auto_75113 ) ) ( not ( = ?auto_75112 ?auto_75116 ) ) ( not ( = ?auto_75112 ?auto_75118 ) ) ( not ( = ?auto_75112 ?auto_75117 ) ) ( not ( = ?auto_75112 ?auto_75119 ) ) ( not ( = ?auto_75115 ?auto_75116 ) ) ( not ( = ?auto_75115 ?auto_75118 ) ) ( not ( = ?auto_75115 ?auto_75117 ) ) ( not ( = ?auto_75115 ?auto_75119 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75116 ?auto_75118 ?auto_75117 ?auto_75119 ?auto_75114 ?auto_75113 )
      ( MAKE-2PILE ?auto_75112 ?auto_75113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75120 - BLOCK
      ?auto_75121 - BLOCK
    )
    :vars
    (
      ?auto_75124 - BLOCK
      ?auto_75125 - BLOCK
      ?auto_75126 - BLOCK
      ?auto_75123 - BLOCK
      ?auto_75122 - BLOCK
      ?auto_75127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75120 ?auto_75121 ) ) ( not ( = ?auto_75120 ?auto_75124 ) ) ( not ( = ?auto_75121 ?auto_75124 ) ) ( ON ?auto_75120 ?auto_75125 ) ( not ( = ?auto_75120 ?auto_75125 ) ) ( not ( = ?auto_75121 ?auto_75125 ) ) ( not ( = ?auto_75124 ?auto_75125 ) ) ( CLEAR ?auto_75124 ) ( ON-TABLE ?auto_75126 ) ( ON ?auto_75123 ?auto_75126 ) ( ON ?auto_75122 ?auto_75123 ) ( ON ?auto_75127 ?auto_75122 ) ( ON ?auto_75124 ?auto_75127 ) ( not ( = ?auto_75126 ?auto_75123 ) ) ( not ( = ?auto_75126 ?auto_75122 ) ) ( not ( = ?auto_75126 ?auto_75127 ) ) ( not ( = ?auto_75126 ?auto_75124 ) ) ( not ( = ?auto_75126 ?auto_75121 ) ) ( not ( = ?auto_75123 ?auto_75122 ) ) ( not ( = ?auto_75123 ?auto_75127 ) ) ( not ( = ?auto_75123 ?auto_75124 ) ) ( not ( = ?auto_75123 ?auto_75121 ) ) ( not ( = ?auto_75122 ?auto_75127 ) ) ( not ( = ?auto_75122 ?auto_75124 ) ) ( not ( = ?auto_75122 ?auto_75121 ) ) ( not ( = ?auto_75127 ?auto_75124 ) ) ( not ( = ?auto_75127 ?auto_75121 ) ) ( not ( = ?auto_75120 ?auto_75126 ) ) ( not ( = ?auto_75120 ?auto_75123 ) ) ( not ( = ?auto_75120 ?auto_75122 ) ) ( not ( = ?auto_75120 ?auto_75127 ) ) ( not ( = ?auto_75125 ?auto_75126 ) ) ( not ( = ?auto_75125 ?auto_75123 ) ) ( not ( = ?auto_75125 ?auto_75122 ) ) ( not ( = ?auto_75125 ?auto_75127 ) ) ( ON ?auto_75121 ?auto_75120 ) ( CLEAR ?auto_75121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75125 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75125 ?auto_75120 )
      ( MAKE-2PILE ?auto_75120 ?auto_75121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75128 - BLOCK
      ?auto_75129 - BLOCK
    )
    :vars
    (
      ?auto_75132 - BLOCK
      ?auto_75135 - BLOCK
      ?auto_75131 - BLOCK
      ?auto_75130 - BLOCK
      ?auto_75134 - BLOCK
      ?auto_75133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75128 ?auto_75129 ) ) ( not ( = ?auto_75128 ?auto_75132 ) ) ( not ( = ?auto_75129 ?auto_75132 ) ) ( ON ?auto_75128 ?auto_75135 ) ( not ( = ?auto_75128 ?auto_75135 ) ) ( not ( = ?auto_75129 ?auto_75135 ) ) ( not ( = ?auto_75132 ?auto_75135 ) ) ( ON-TABLE ?auto_75131 ) ( ON ?auto_75130 ?auto_75131 ) ( ON ?auto_75134 ?auto_75130 ) ( ON ?auto_75133 ?auto_75134 ) ( not ( = ?auto_75131 ?auto_75130 ) ) ( not ( = ?auto_75131 ?auto_75134 ) ) ( not ( = ?auto_75131 ?auto_75133 ) ) ( not ( = ?auto_75131 ?auto_75132 ) ) ( not ( = ?auto_75131 ?auto_75129 ) ) ( not ( = ?auto_75130 ?auto_75134 ) ) ( not ( = ?auto_75130 ?auto_75133 ) ) ( not ( = ?auto_75130 ?auto_75132 ) ) ( not ( = ?auto_75130 ?auto_75129 ) ) ( not ( = ?auto_75134 ?auto_75133 ) ) ( not ( = ?auto_75134 ?auto_75132 ) ) ( not ( = ?auto_75134 ?auto_75129 ) ) ( not ( = ?auto_75133 ?auto_75132 ) ) ( not ( = ?auto_75133 ?auto_75129 ) ) ( not ( = ?auto_75128 ?auto_75131 ) ) ( not ( = ?auto_75128 ?auto_75130 ) ) ( not ( = ?auto_75128 ?auto_75134 ) ) ( not ( = ?auto_75128 ?auto_75133 ) ) ( not ( = ?auto_75135 ?auto_75131 ) ) ( not ( = ?auto_75135 ?auto_75130 ) ) ( not ( = ?auto_75135 ?auto_75134 ) ) ( not ( = ?auto_75135 ?auto_75133 ) ) ( ON ?auto_75129 ?auto_75128 ) ( CLEAR ?auto_75129 ) ( ON-TABLE ?auto_75135 ) ( HOLDING ?auto_75132 ) ( CLEAR ?auto_75133 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75131 ?auto_75130 ?auto_75134 ?auto_75133 ?auto_75132 )
      ( MAKE-2PILE ?auto_75128 ?auto_75129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75136 - BLOCK
      ?auto_75137 - BLOCK
    )
    :vars
    (
      ?auto_75140 - BLOCK
      ?auto_75142 - BLOCK
      ?auto_75139 - BLOCK
      ?auto_75143 - BLOCK
      ?auto_75141 - BLOCK
      ?auto_75138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75136 ?auto_75137 ) ) ( not ( = ?auto_75136 ?auto_75140 ) ) ( not ( = ?auto_75137 ?auto_75140 ) ) ( ON ?auto_75136 ?auto_75142 ) ( not ( = ?auto_75136 ?auto_75142 ) ) ( not ( = ?auto_75137 ?auto_75142 ) ) ( not ( = ?auto_75140 ?auto_75142 ) ) ( ON-TABLE ?auto_75139 ) ( ON ?auto_75143 ?auto_75139 ) ( ON ?auto_75141 ?auto_75143 ) ( ON ?auto_75138 ?auto_75141 ) ( not ( = ?auto_75139 ?auto_75143 ) ) ( not ( = ?auto_75139 ?auto_75141 ) ) ( not ( = ?auto_75139 ?auto_75138 ) ) ( not ( = ?auto_75139 ?auto_75140 ) ) ( not ( = ?auto_75139 ?auto_75137 ) ) ( not ( = ?auto_75143 ?auto_75141 ) ) ( not ( = ?auto_75143 ?auto_75138 ) ) ( not ( = ?auto_75143 ?auto_75140 ) ) ( not ( = ?auto_75143 ?auto_75137 ) ) ( not ( = ?auto_75141 ?auto_75138 ) ) ( not ( = ?auto_75141 ?auto_75140 ) ) ( not ( = ?auto_75141 ?auto_75137 ) ) ( not ( = ?auto_75138 ?auto_75140 ) ) ( not ( = ?auto_75138 ?auto_75137 ) ) ( not ( = ?auto_75136 ?auto_75139 ) ) ( not ( = ?auto_75136 ?auto_75143 ) ) ( not ( = ?auto_75136 ?auto_75141 ) ) ( not ( = ?auto_75136 ?auto_75138 ) ) ( not ( = ?auto_75142 ?auto_75139 ) ) ( not ( = ?auto_75142 ?auto_75143 ) ) ( not ( = ?auto_75142 ?auto_75141 ) ) ( not ( = ?auto_75142 ?auto_75138 ) ) ( ON ?auto_75137 ?auto_75136 ) ( ON-TABLE ?auto_75142 ) ( CLEAR ?auto_75138 ) ( ON ?auto_75140 ?auto_75137 ) ( CLEAR ?auto_75140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75142 ?auto_75136 ?auto_75137 )
      ( MAKE-2PILE ?auto_75136 ?auto_75137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75144 - BLOCK
      ?auto_75145 - BLOCK
    )
    :vars
    (
      ?auto_75146 - BLOCK
      ?auto_75147 - BLOCK
      ?auto_75150 - BLOCK
      ?auto_75148 - BLOCK
      ?auto_75149 - BLOCK
      ?auto_75151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75144 ?auto_75145 ) ) ( not ( = ?auto_75144 ?auto_75146 ) ) ( not ( = ?auto_75145 ?auto_75146 ) ) ( ON ?auto_75144 ?auto_75147 ) ( not ( = ?auto_75144 ?auto_75147 ) ) ( not ( = ?auto_75145 ?auto_75147 ) ) ( not ( = ?auto_75146 ?auto_75147 ) ) ( ON-TABLE ?auto_75150 ) ( ON ?auto_75148 ?auto_75150 ) ( ON ?auto_75149 ?auto_75148 ) ( not ( = ?auto_75150 ?auto_75148 ) ) ( not ( = ?auto_75150 ?auto_75149 ) ) ( not ( = ?auto_75150 ?auto_75151 ) ) ( not ( = ?auto_75150 ?auto_75146 ) ) ( not ( = ?auto_75150 ?auto_75145 ) ) ( not ( = ?auto_75148 ?auto_75149 ) ) ( not ( = ?auto_75148 ?auto_75151 ) ) ( not ( = ?auto_75148 ?auto_75146 ) ) ( not ( = ?auto_75148 ?auto_75145 ) ) ( not ( = ?auto_75149 ?auto_75151 ) ) ( not ( = ?auto_75149 ?auto_75146 ) ) ( not ( = ?auto_75149 ?auto_75145 ) ) ( not ( = ?auto_75151 ?auto_75146 ) ) ( not ( = ?auto_75151 ?auto_75145 ) ) ( not ( = ?auto_75144 ?auto_75150 ) ) ( not ( = ?auto_75144 ?auto_75148 ) ) ( not ( = ?auto_75144 ?auto_75149 ) ) ( not ( = ?auto_75144 ?auto_75151 ) ) ( not ( = ?auto_75147 ?auto_75150 ) ) ( not ( = ?auto_75147 ?auto_75148 ) ) ( not ( = ?auto_75147 ?auto_75149 ) ) ( not ( = ?auto_75147 ?auto_75151 ) ) ( ON ?auto_75145 ?auto_75144 ) ( ON-TABLE ?auto_75147 ) ( ON ?auto_75146 ?auto_75145 ) ( CLEAR ?auto_75146 ) ( HOLDING ?auto_75151 ) ( CLEAR ?auto_75149 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75150 ?auto_75148 ?auto_75149 ?auto_75151 )
      ( MAKE-2PILE ?auto_75144 ?auto_75145 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75152 - BLOCK
      ?auto_75153 - BLOCK
    )
    :vars
    (
      ?auto_75157 - BLOCK
      ?auto_75156 - BLOCK
      ?auto_75158 - BLOCK
      ?auto_75155 - BLOCK
      ?auto_75154 - BLOCK
      ?auto_75159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75152 ?auto_75153 ) ) ( not ( = ?auto_75152 ?auto_75157 ) ) ( not ( = ?auto_75153 ?auto_75157 ) ) ( ON ?auto_75152 ?auto_75156 ) ( not ( = ?auto_75152 ?auto_75156 ) ) ( not ( = ?auto_75153 ?auto_75156 ) ) ( not ( = ?auto_75157 ?auto_75156 ) ) ( ON-TABLE ?auto_75158 ) ( ON ?auto_75155 ?auto_75158 ) ( ON ?auto_75154 ?auto_75155 ) ( not ( = ?auto_75158 ?auto_75155 ) ) ( not ( = ?auto_75158 ?auto_75154 ) ) ( not ( = ?auto_75158 ?auto_75159 ) ) ( not ( = ?auto_75158 ?auto_75157 ) ) ( not ( = ?auto_75158 ?auto_75153 ) ) ( not ( = ?auto_75155 ?auto_75154 ) ) ( not ( = ?auto_75155 ?auto_75159 ) ) ( not ( = ?auto_75155 ?auto_75157 ) ) ( not ( = ?auto_75155 ?auto_75153 ) ) ( not ( = ?auto_75154 ?auto_75159 ) ) ( not ( = ?auto_75154 ?auto_75157 ) ) ( not ( = ?auto_75154 ?auto_75153 ) ) ( not ( = ?auto_75159 ?auto_75157 ) ) ( not ( = ?auto_75159 ?auto_75153 ) ) ( not ( = ?auto_75152 ?auto_75158 ) ) ( not ( = ?auto_75152 ?auto_75155 ) ) ( not ( = ?auto_75152 ?auto_75154 ) ) ( not ( = ?auto_75152 ?auto_75159 ) ) ( not ( = ?auto_75156 ?auto_75158 ) ) ( not ( = ?auto_75156 ?auto_75155 ) ) ( not ( = ?auto_75156 ?auto_75154 ) ) ( not ( = ?auto_75156 ?auto_75159 ) ) ( ON ?auto_75153 ?auto_75152 ) ( ON-TABLE ?auto_75156 ) ( ON ?auto_75157 ?auto_75153 ) ( CLEAR ?auto_75154 ) ( ON ?auto_75159 ?auto_75157 ) ( CLEAR ?auto_75159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75156 ?auto_75152 ?auto_75153 ?auto_75157 )
      ( MAKE-2PILE ?auto_75152 ?auto_75153 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75160 - BLOCK
      ?auto_75161 - BLOCK
    )
    :vars
    (
      ?auto_75163 - BLOCK
      ?auto_75166 - BLOCK
      ?auto_75162 - BLOCK
      ?auto_75165 - BLOCK
      ?auto_75164 - BLOCK
      ?auto_75167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75160 ?auto_75161 ) ) ( not ( = ?auto_75160 ?auto_75163 ) ) ( not ( = ?auto_75161 ?auto_75163 ) ) ( ON ?auto_75160 ?auto_75166 ) ( not ( = ?auto_75160 ?auto_75166 ) ) ( not ( = ?auto_75161 ?auto_75166 ) ) ( not ( = ?auto_75163 ?auto_75166 ) ) ( ON-TABLE ?auto_75162 ) ( ON ?auto_75165 ?auto_75162 ) ( not ( = ?auto_75162 ?auto_75165 ) ) ( not ( = ?auto_75162 ?auto_75164 ) ) ( not ( = ?auto_75162 ?auto_75167 ) ) ( not ( = ?auto_75162 ?auto_75163 ) ) ( not ( = ?auto_75162 ?auto_75161 ) ) ( not ( = ?auto_75165 ?auto_75164 ) ) ( not ( = ?auto_75165 ?auto_75167 ) ) ( not ( = ?auto_75165 ?auto_75163 ) ) ( not ( = ?auto_75165 ?auto_75161 ) ) ( not ( = ?auto_75164 ?auto_75167 ) ) ( not ( = ?auto_75164 ?auto_75163 ) ) ( not ( = ?auto_75164 ?auto_75161 ) ) ( not ( = ?auto_75167 ?auto_75163 ) ) ( not ( = ?auto_75167 ?auto_75161 ) ) ( not ( = ?auto_75160 ?auto_75162 ) ) ( not ( = ?auto_75160 ?auto_75165 ) ) ( not ( = ?auto_75160 ?auto_75164 ) ) ( not ( = ?auto_75160 ?auto_75167 ) ) ( not ( = ?auto_75166 ?auto_75162 ) ) ( not ( = ?auto_75166 ?auto_75165 ) ) ( not ( = ?auto_75166 ?auto_75164 ) ) ( not ( = ?auto_75166 ?auto_75167 ) ) ( ON ?auto_75161 ?auto_75160 ) ( ON-TABLE ?auto_75166 ) ( ON ?auto_75163 ?auto_75161 ) ( ON ?auto_75167 ?auto_75163 ) ( CLEAR ?auto_75167 ) ( HOLDING ?auto_75164 ) ( CLEAR ?auto_75165 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75162 ?auto_75165 ?auto_75164 )
      ( MAKE-2PILE ?auto_75160 ?auto_75161 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75168 - BLOCK
      ?auto_75169 - BLOCK
    )
    :vars
    (
      ?auto_75170 - BLOCK
      ?auto_75172 - BLOCK
      ?auto_75174 - BLOCK
      ?auto_75171 - BLOCK
      ?auto_75175 - BLOCK
      ?auto_75173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75168 ?auto_75169 ) ) ( not ( = ?auto_75168 ?auto_75170 ) ) ( not ( = ?auto_75169 ?auto_75170 ) ) ( ON ?auto_75168 ?auto_75172 ) ( not ( = ?auto_75168 ?auto_75172 ) ) ( not ( = ?auto_75169 ?auto_75172 ) ) ( not ( = ?auto_75170 ?auto_75172 ) ) ( ON-TABLE ?auto_75174 ) ( ON ?auto_75171 ?auto_75174 ) ( not ( = ?auto_75174 ?auto_75171 ) ) ( not ( = ?auto_75174 ?auto_75175 ) ) ( not ( = ?auto_75174 ?auto_75173 ) ) ( not ( = ?auto_75174 ?auto_75170 ) ) ( not ( = ?auto_75174 ?auto_75169 ) ) ( not ( = ?auto_75171 ?auto_75175 ) ) ( not ( = ?auto_75171 ?auto_75173 ) ) ( not ( = ?auto_75171 ?auto_75170 ) ) ( not ( = ?auto_75171 ?auto_75169 ) ) ( not ( = ?auto_75175 ?auto_75173 ) ) ( not ( = ?auto_75175 ?auto_75170 ) ) ( not ( = ?auto_75175 ?auto_75169 ) ) ( not ( = ?auto_75173 ?auto_75170 ) ) ( not ( = ?auto_75173 ?auto_75169 ) ) ( not ( = ?auto_75168 ?auto_75174 ) ) ( not ( = ?auto_75168 ?auto_75171 ) ) ( not ( = ?auto_75168 ?auto_75175 ) ) ( not ( = ?auto_75168 ?auto_75173 ) ) ( not ( = ?auto_75172 ?auto_75174 ) ) ( not ( = ?auto_75172 ?auto_75171 ) ) ( not ( = ?auto_75172 ?auto_75175 ) ) ( not ( = ?auto_75172 ?auto_75173 ) ) ( ON ?auto_75169 ?auto_75168 ) ( ON-TABLE ?auto_75172 ) ( ON ?auto_75170 ?auto_75169 ) ( ON ?auto_75173 ?auto_75170 ) ( CLEAR ?auto_75171 ) ( ON ?auto_75175 ?auto_75173 ) ( CLEAR ?auto_75175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75172 ?auto_75168 ?auto_75169 ?auto_75170 ?auto_75173 )
      ( MAKE-2PILE ?auto_75168 ?auto_75169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75176 - BLOCK
      ?auto_75177 - BLOCK
    )
    :vars
    (
      ?auto_75181 - BLOCK
      ?auto_75179 - BLOCK
      ?auto_75182 - BLOCK
      ?auto_75183 - BLOCK
      ?auto_75180 - BLOCK
      ?auto_75178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75176 ?auto_75177 ) ) ( not ( = ?auto_75176 ?auto_75181 ) ) ( not ( = ?auto_75177 ?auto_75181 ) ) ( ON ?auto_75176 ?auto_75179 ) ( not ( = ?auto_75176 ?auto_75179 ) ) ( not ( = ?auto_75177 ?auto_75179 ) ) ( not ( = ?auto_75181 ?auto_75179 ) ) ( ON-TABLE ?auto_75182 ) ( not ( = ?auto_75182 ?auto_75183 ) ) ( not ( = ?auto_75182 ?auto_75180 ) ) ( not ( = ?auto_75182 ?auto_75178 ) ) ( not ( = ?auto_75182 ?auto_75181 ) ) ( not ( = ?auto_75182 ?auto_75177 ) ) ( not ( = ?auto_75183 ?auto_75180 ) ) ( not ( = ?auto_75183 ?auto_75178 ) ) ( not ( = ?auto_75183 ?auto_75181 ) ) ( not ( = ?auto_75183 ?auto_75177 ) ) ( not ( = ?auto_75180 ?auto_75178 ) ) ( not ( = ?auto_75180 ?auto_75181 ) ) ( not ( = ?auto_75180 ?auto_75177 ) ) ( not ( = ?auto_75178 ?auto_75181 ) ) ( not ( = ?auto_75178 ?auto_75177 ) ) ( not ( = ?auto_75176 ?auto_75182 ) ) ( not ( = ?auto_75176 ?auto_75183 ) ) ( not ( = ?auto_75176 ?auto_75180 ) ) ( not ( = ?auto_75176 ?auto_75178 ) ) ( not ( = ?auto_75179 ?auto_75182 ) ) ( not ( = ?auto_75179 ?auto_75183 ) ) ( not ( = ?auto_75179 ?auto_75180 ) ) ( not ( = ?auto_75179 ?auto_75178 ) ) ( ON ?auto_75177 ?auto_75176 ) ( ON-TABLE ?auto_75179 ) ( ON ?auto_75181 ?auto_75177 ) ( ON ?auto_75178 ?auto_75181 ) ( ON ?auto_75180 ?auto_75178 ) ( CLEAR ?auto_75180 ) ( HOLDING ?auto_75183 ) ( CLEAR ?auto_75182 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75182 ?auto_75183 )
      ( MAKE-2PILE ?auto_75176 ?auto_75177 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75184 - BLOCK
      ?auto_75185 - BLOCK
    )
    :vars
    (
      ?auto_75190 - BLOCK
      ?auto_75186 - BLOCK
      ?auto_75187 - BLOCK
      ?auto_75191 - BLOCK
      ?auto_75188 - BLOCK
      ?auto_75189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75184 ?auto_75185 ) ) ( not ( = ?auto_75184 ?auto_75190 ) ) ( not ( = ?auto_75185 ?auto_75190 ) ) ( ON ?auto_75184 ?auto_75186 ) ( not ( = ?auto_75184 ?auto_75186 ) ) ( not ( = ?auto_75185 ?auto_75186 ) ) ( not ( = ?auto_75190 ?auto_75186 ) ) ( ON-TABLE ?auto_75187 ) ( not ( = ?auto_75187 ?auto_75191 ) ) ( not ( = ?auto_75187 ?auto_75188 ) ) ( not ( = ?auto_75187 ?auto_75189 ) ) ( not ( = ?auto_75187 ?auto_75190 ) ) ( not ( = ?auto_75187 ?auto_75185 ) ) ( not ( = ?auto_75191 ?auto_75188 ) ) ( not ( = ?auto_75191 ?auto_75189 ) ) ( not ( = ?auto_75191 ?auto_75190 ) ) ( not ( = ?auto_75191 ?auto_75185 ) ) ( not ( = ?auto_75188 ?auto_75189 ) ) ( not ( = ?auto_75188 ?auto_75190 ) ) ( not ( = ?auto_75188 ?auto_75185 ) ) ( not ( = ?auto_75189 ?auto_75190 ) ) ( not ( = ?auto_75189 ?auto_75185 ) ) ( not ( = ?auto_75184 ?auto_75187 ) ) ( not ( = ?auto_75184 ?auto_75191 ) ) ( not ( = ?auto_75184 ?auto_75188 ) ) ( not ( = ?auto_75184 ?auto_75189 ) ) ( not ( = ?auto_75186 ?auto_75187 ) ) ( not ( = ?auto_75186 ?auto_75191 ) ) ( not ( = ?auto_75186 ?auto_75188 ) ) ( not ( = ?auto_75186 ?auto_75189 ) ) ( ON ?auto_75185 ?auto_75184 ) ( ON-TABLE ?auto_75186 ) ( ON ?auto_75190 ?auto_75185 ) ( ON ?auto_75189 ?auto_75190 ) ( ON ?auto_75188 ?auto_75189 ) ( CLEAR ?auto_75187 ) ( ON ?auto_75191 ?auto_75188 ) ( CLEAR ?auto_75191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75186 ?auto_75184 ?auto_75185 ?auto_75190 ?auto_75189 ?auto_75188 )
      ( MAKE-2PILE ?auto_75184 ?auto_75185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75192 - BLOCK
      ?auto_75193 - BLOCK
    )
    :vars
    (
      ?auto_75197 - BLOCK
      ?auto_75199 - BLOCK
      ?auto_75194 - BLOCK
      ?auto_75196 - BLOCK
      ?auto_75195 - BLOCK
      ?auto_75198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75192 ?auto_75193 ) ) ( not ( = ?auto_75192 ?auto_75197 ) ) ( not ( = ?auto_75193 ?auto_75197 ) ) ( ON ?auto_75192 ?auto_75199 ) ( not ( = ?auto_75192 ?auto_75199 ) ) ( not ( = ?auto_75193 ?auto_75199 ) ) ( not ( = ?auto_75197 ?auto_75199 ) ) ( not ( = ?auto_75194 ?auto_75196 ) ) ( not ( = ?auto_75194 ?auto_75195 ) ) ( not ( = ?auto_75194 ?auto_75198 ) ) ( not ( = ?auto_75194 ?auto_75197 ) ) ( not ( = ?auto_75194 ?auto_75193 ) ) ( not ( = ?auto_75196 ?auto_75195 ) ) ( not ( = ?auto_75196 ?auto_75198 ) ) ( not ( = ?auto_75196 ?auto_75197 ) ) ( not ( = ?auto_75196 ?auto_75193 ) ) ( not ( = ?auto_75195 ?auto_75198 ) ) ( not ( = ?auto_75195 ?auto_75197 ) ) ( not ( = ?auto_75195 ?auto_75193 ) ) ( not ( = ?auto_75198 ?auto_75197 ) ) ( not ( = ?auto_75198 ?auto_75193 ) ) ( not ( = ?auto_75192 ?auto_75194 ) ) ( not ( = ?auto_75192 ?auto_75196 ) ) ( not ( = ?auto_75192 ?auto_75195 ) ) ( not ( = ?auto_75192 ?auto_75198 ) ) ( not ( = ?auto_75199 ?auto_75194 ) ) ( not ( = ?auto_75199 ?auto_75196 ) ) ( not ( = ?auto_75199 ?auto_75195 ) ) ( not ( = ?auto_75199 ?auto_75198 ) ) ( ON ?auto_75193 ?auto_75192 ) ( ON-TABLE ?auto_75199 ) ( ON ?auto_75197 ?auto_75193 ) ( ON ?auto_75198 ?auto_75197 ) ( ON ?auto_75195 ?auto_75198 ) ( ON ?auto_75196 ?auto_75195 ) ( CLEAR ?auto_75196 ) ( HOLDING ?auto_75194 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75194 )
      ( MAKE-2PILE ?auto_75192 ?auto_75193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75200 - BLOCK
      ?auto_75201 - BLOCK
    )
    :vars
    (
      ?auto_75203 - BLOCK
      ?auto_75205 - BLOCK
      ?auto_75207 - BLOCK
      ?auto_75202 - BLOCK
      ?auto_75204 - BLOCK
      ?auto_75206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75200 ?auto_75201 ) ) ( not ( = ?auto_75200 ?auto_75203 ) ) ( not ( = ?auto_75201 ?auto_75203 ) ) ( ON ?auto_75200 ?auto_75205 ) ( not ( = ?auto_75200 ?auto_75205 ) ) ( not ( = ?auto_75201 ?auto_75205 ) ) ( not ( = ?auto_75203 ?auto_75205 ) ) ( not ( = ?auto_75207 ?auto_75202 ) ) ( not ( = ?auto_75207 ?auto_75204 ) ) ( not ( = ?auto_75207 ?auto_75206 ) ) ( not ( = ?auto_75207 ?auto_75203 ) ) ( not ( = ?auto_75207 ?auto_75201 ) ) ( not ( = ?auto_75202 ?auto_75204 ) ) ( not ( = ?auto_75202 ?auto_75206 ) ) ( not ( = ?auto_75202 ?auto_75203 ) ) ( not ( = ?auto_75202 ?auto_75201 ) ) ( not ( = ?auto_75204 ?auto_75206 ) ) ( not ( = ?auto_75204 ?auto_75203 ) ) ( not ( = ?auto_75204 ?auto_75201 ) ) ( not ( = ?auto_75206 ?auto_75203 ) ) ( not ( = ?auto_75206 ?auto_75201 ) ) ( not ( = ?auto_75200 ?auto_75207 ) ) ( not ( = ?auto_75200 ?auto_75202 ) ) ( not ( = ?auto_75200 ?auto_75204 ) ) ( not ( = ?auto_75200 ?auto_75206 ) ) ( not ( = ?auto_75205 ?auto_75207 ) ) ( not ( = ?auto_75205 ?auto_75202 ) ) ( not ( = ?auto_75205 ?auto_75204 ) ) ( not ( = ?auto_75205 ?auto_75206 ) ) ( ON ?auto_75201 ?auto_75200 ) ( ON-TABLE ?auto_75205 ) ( ON ?auto_75203 ?auto_75201 ) ( ON ?auto_75206 ?auto_75203 ) ( ON ?auto_75204 ?auto_75206 ) ( ON ?auto_75202 ?auto_75204 ) ( ON ?auto_75207 ?auto_75202 ) ( CLEAR ?auto_75207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_75205 ?auto_75200 ?auto_75201 ?auto_75203 ?auto_75206 ?auto_75204 ?auto_75202 )
      ( MAKE-2PILE ?auto_75200 ?auto_75201 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75231 - BLOCK
      ?auto_75232 - BLOCK
      ?auto_75233 - BLOCK
      ?auto_75234 - BLOCK
    )
    :vars
    (
      ?auto_75236 - BLOCK
      ?auto_75237 - BLOCK
      ?auto_75235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75236 ?auto_75234 ) ( ON-TABLE ?auto_75231 ) ( ON ?auto_75232 ?auto_75231 ) ( ON ?auto_75233 ?auto_75232 ) ( ON ?auto_75234 ?auto_75233 ) ( not ( = ?auto_75231 ?auto_75232 ) ) ( not ( = ?auto_75231 ?auto_75233 ) ) ( not ( = ?auto_75231 ?auto_75234 ) ) ( not ( = ?auto_75231 ?auto_75236 ) ) ( not ( = ?auto_75232 ?auto_75233 ) ) ( not ( = ?auto_75232 ?auto_75234 ) ) ( not ( = ?auto_75232 ?auto_75236 ) ) ( not ( = ?auto_75233 ?auto_75234 ) ) ( not ( = ?auto_75233 ?auto_75236 ) ) ( not ( = ?auto_75234 ?auto_75236 ) ) ( not ( = ?auto_75231 ?auto_75237 ) ) ( not ( = ?auto_75231 ?auto_75235 ) ) ( not ( = ?auto_75232 ?auto_75237 ) ) ( not ( = ?auto_75232 ?auto_75235 ) ) ( not ( = ?auto_75233 ?auto_75237 ) ) ( not ( = ?auto_75233 ?auto_75235 ) ) ( not ( = ?auto_75234 ?auto_75237 ) ) ( not ( = ?auto_75234 ?auto_75235 ) ) ( not ( = ?auto_75236 ?auto_75237 ) ) ( not ( = ?auto_75236 ?auto_75235 ) ) ( not ( = ?auto_75237 ?auto_75235 ) ) ( ON ?auto_75237 ?auto_75236 ) ( CLEAR ?auto_75237 ) ( HOLDING ?auto_75235 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75235 )
      ( MAKE-4PILE ?auto_75231 ?auto_75232 ?auto_75233 ?auto_75234 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75318 - BLOCK
      ?auto_75319 - BLOCK
      ?auto_75320 - BLOCK
    )
    :vars
    (
      ?auto_75321 - BLOCK
      ?auto_75324 - BLOCK
      ?auto_75322 - BLOCK
      ?auto_75323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75318 ) ( not ( = ?auto_75318 ?auto_75319 ) ) ( not ( = ?auto_75318 ?auto_75320 ) ) ( not ( = ?auto_75319 ?auto_75320 ) ) ( ON ?auto_75320 ?auto_75321 ) ( not ( = ?auto_75318 ?auto_75321 ) ) ( not ( = ?auto_75319 ?auto_75321 ) ) ( not ( = ?auto_75320 ?auto_75321 ) ) ( CLEAR ?auto_75318 ) ( ON ?auto_75319 ?auto_75320 ) ( CLEAR ?auto_75319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75324 ) ( ON ?auto_75322 ?auto_75324 ) ( ON ?auto_75323 ?auto_75322 ) ( ON ?auto_75321 ?auto_75323 ) ( not ( = ?auto_75324 ?auto_75322 ) ) ( not ( = ?auto_75324 ?auto_75323 ) ) ( not ( = ?auto_75324 ?auto_75321 ) ) ( not ( = ?auto_75324 ?auto_75320 ) ) ( not ( = ?auto_75324 ?auto_75319 ) ) ( not ( = ?auto_75322 ?auto_75323 ) ) ( not ( = ?auto_75322 ?auto_75321 ) ) ( not ( = ?auto_75322 ?auto_75320 ) ) ( not ( = ?auto_75322 ?auto_75319 ) ) ( not ( = ?auto_75323 ?auto_75321 ) ) ( not ( = ?auto_75323 ?auto_75320 ) ) ( not ( = ?auto_75323 ?auto_75319 ) ) ( not ( = ?auto_75318 ?auto_75324 ) ) ( not ( = ?auto_75318 ?auto_75322 ) ) ( not ( = ?auto_75318 ?auto_75323 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75324 ?auto_75322 ?auto_75323 ?auto_75321 ?auto_75320 )
      ( MAKE-3PILE ?auto_75318 ?auto_75319 ?auto_75320 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75325 - BLOCK
      ?auto_75326 - BLOCK
      ?auto_75327 - BLOCK
    )
    :vars
    (
      ?auto_75331 - BLOCK
      ?auto_75330 - BLOCK
      ?auto_75328 - BLOCK
      ?auto_75329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75325 ?auto_75326 ) ) ( not ( = ?auto_75325 ?auto_75327 ) ) ( not ( = ?auto_75326 ?auto_75327 ) ) ( ON ?auto_75327 ?auto_75331 ) ( not ( = ?auto_75325 ?auto_75331 ) ) ( not ( = ?auto_75326 ?auto_75331 ) ) ( not ( = ?auto_75327 ?auto_75331 ) ) ( ON ?auto_75326 ?auto_75327 ) ( CLEAR ?auto_75326 ) ( ON-TABLE ?auto_75330 ) ( ON ?auto_75328 ?auto_75330 ) ( ON ?auto_75329 ?auto_75328 ) ( ON ?auto_75331 ?auto_75329 ) ( not ( = ?auto_75330 ?auto_75328 ) ) ( not ( = ?auto_75330 ?auto_75329 ) ) ( not ( = ?auto_75330 ?auto_75331 ) ) ( not ( = ?auto_75330 ?auto_75327 ) ) ( not ( = ?auto_75330 ?auto_75326 ) ) ( not ( = ?auto_75328 ?auto_75329 ) ) ( not ( = ?auto_75328 ?auto_75331 ) ) ( not ( = ?auto_75328 ?auto_75327 ) ) ( not ( = ?auto_75328 ?auto_75326 ) ) ( not ( = ?auto_75329 ?auto_75331 ) ) ( not ( = ?auto_75329 ?auto_75327 ) ) ( not ( = ?auto_75329 ?auto_75326 ) ) ( not ( = ?auto_75325 ?auto_75330 ) ) ( not ( = ?auto_75325 ?auto_75328 ) ) ( not ( = ?auto_75325 ?auto_75329 ) ) ( HOLDING ?auto_75325 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75325 )
      ( MAKE-3PILE ?auto_75325 ?auto_75326 ?auto_75327 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75332 - BLOCK
      ?auto_75333 - BLOCK
      ?auto_75334 - BLOCK
    )
    :vars
    (
      ?auto_75335 - BLOCK
      ?auto_75338 - BLOCK
      ?auto_75336 - BLOCK
      ?auto_75337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75332 ?auto_75333 ) ) ( not ( = ?auto_75332 ?auto_75334 ) ) ( not ( = ?auto_75333 ?auto_75334 ) ) ( ON ?auto_75334 ?auto_75335 ) ( not ( = ?auto_75332 ?auto_75335 ) ) ( not ( = ?auto_75333 ?auto_75335 ) ) ( not ( = ?auto_75334 ?auto_75335 ) ) ( ON ?auto_75333 ?auto_75334 ) ( ON-TABLE ?auto_75338 ) ( ON ?auto_75336 ?auto_75338 ) ( ON ?auto_75337 ?auto_75336 ) ( ON ?auto_75335 ?auto_75337 ) ( not ( = ?auto_75338 ?auto_75336 ) ) ( not ( = ?auto_75338 ?auto_75337 ) ) ( not ( = ?auto_75338 ?auto_75335 ) ) ( not ( = ?auto_75338 ?auto_75334 ) ) ( not ( = ?auto_75338 ?auto_75333 ) ) ( not ( = ?auto_75336 ?auto_75337 ) ) ( not ( = ?auto_75336 ?auto_75335 ) ) ( not ( = ?auto_75336 ?auto_75334 ) ) ( not ( = ?auto_75336 ?auto_75333 ) ) ( not ( = ?auto_75337 ?auto_75335 ) ) ( not ( = ?auto_75337 ?auto_75334 ) ) ( not ( = ?auto_75337 ?auto_75333 ) ) ( not ( = ?auto_75332 ?auto_75338 ) ) ( not ( = ?auto_75332 ?auto_75336 ) ) ( not ( = ?auto_75332 ?auto_75337 ) ) ( ON ?auto_75332 ?auto_75333 ) ( CLEAR ?auto_75332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75338 ?auto_75336 ?auto_75337 ?auto_75335 ?auto_75334 ?auto_75333 )
      ( MAKE-3PILE ?auto_75332 ?auto_75333 ?auto_75334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75342 - BLOCK
      ?auto_75343 - BLOCK
      ?auto_75344 - BLOCK
    )
    :vars
    (
      ?auto_75348 - BLOCK
      ?auto_75345 - BLOCK
      ?auto_75346 - BLOCK
      ?auto_75347 - BLOCK
      ?auto_75349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75342 ?auto_75343 ) ) ( not ( = ?auto_75342 ?auto_75344 ) ) ( not ( = ?auto_75343 ?auto_75344 ) ) ( ON ?auto_75344 ?auto_75348 ) ( not ( = ?auto_75342 ?auto_75348 ) ) ( not ( = ?auto_75343 ?auto_75348 ) ) ( not ( = ?auto_75344 ?auto_75348 ) ) ( ON ?auto_75343 ?auto_75344 ) ( CLEAR ?auto_75343 ) ( ON-TABLE ?auto_75345 ) ( ON ?auto_75346 ?auto_75345 ) ( ON ?auto_75347 ?auto_75346 ) ( ON ?auto_75348 ?auto_75347 ) ( not ( = ?auto_75345 ?auto_75346 ) ) ( not ( = ?auto_75345 ?auto_75347 ) ) ( not ( = ?auto_75345 ?auto_75348 ) ) ( not ( = ?auto_75345 ?auto_75344 ) ) ( not ( = ?auto_75345 ?auto_75343 ) ) ( not ( = ?auto_75346 ?auto_75347 ) ) ( not ( = ?auto_75346 ?auto_75348 ) ) ( not ( = ?auto_75346 ?auto_75344 ) ) ( not ( = ?auto_75346 ?auto_75343 ) ) ( not ( = ?auto_75347 ?auto_75348 ) ) ( not ( = ?auto_75347 ?auto_75344 ) ) ( not ( = ?auto_75347 ?auto_75343 ) ) ( not ( = ?auto_75342 ?auto_75345 ) ) ( not ( = ?auto_75342 ?auto_75346 ) ) ( not ( = ?auto_75342 ?auto_75347 ) ) ( ON ?auto_75342 ?auto_75349 ) ( CLEAR ?auto_75342 ) ( HAND-EMPTY ) ( not ( = ?auto_75342 ?auto_75349 ) ) ( not ( = ?auto_75343 ?auto_75349 ) ) ( not ( = ?auto_75344 ?auto_75349 ) ) ( not ( = ?auto_75348 ?auto_75349 ) ) ( not ( = ?auto_75345 ?auto_75349 ) ) ( not ( = ?auto_75346 ?auto_75349 ) ) ( not ( = ?auto_75347 ?auto_75349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75342 ?auto_75349 )
      ( MAKE-3PILE ?auto_75342 ?auto_75343 ?auto_75344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75350 - BLOCK
      ?auto_75351 - BLOCK
      ?auto_75352 - BLOCK
    )
    :vars
    (
      ?auto_75355 - BLOCK
      ?auto_75354 - BLOCK
      ?auto_75356 - BLOCK
      ?auto_75357 - BLOCK
      ?auto_75353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75350 ?auto_75351 ) ) ( not ( = ?auto_75350 ?auto_75352 ) ) ( not ( = ?auto_75351 ?auto_75352 ) ) ( ON ?auto_75352 ?auto_75355 ) ( not ( = ?auto_75350 ?auto_75355 ) ) ( not ( = ?auto_75351 ?auto_75355 ) ) ( not ( = ?auto_75352 ?auto_75355 ) ) ( ON-TABLE ?auto_75354 ) ( ON ?auto_75356 ?auto_75354 ) ( ON ?auto_75357 ?auto_75356 ) ( ON ?auto_75355 ?auto_75357 ) ( not ( = ?auto_75354 ?auto_75356 ) ) ( not ( = ?auto_75354 ?auto_75357 ) ) ( not ( = ?auto_75354 ?auto_75355 ) ) ( not ( = ?auto_75354 ?auto_75352 ) ) ( not ( = ?auto_75354 ?auto_75351 ) ) ( not ( = ?auto_75356 ?auto_75357 ) ) ( not ( = ?auto_75356 ?auto_75355 ) ) ( not ( = ?auto_75356 ?auto_75352 ) ) ( not ( = ?auto_75356 ?auto_75351 ) ) ( not ( = ?auto_75357 ?auto_75355 ) ) ( not ( = ?auto_75357 ?auto_75352 ) ) ( not ( = ?auto_75357 ?auto_75351 ) ) ( not ( = ?auto_75350 ?auto_75354 ) ) ( not ( = ?auto_75350 ?auto_75356 ) ) ( not ( = ?auto_75350 ?auto_75357 ) ) ( ON ?auto_75350 ?auto_75353 ) ( CLEAR ?auto_75350 ) ( not ( = ?auto_75350 ?auto_75353 ) ) ( not ( = ?auto_75351 ?auto_75353 ) ) ( not ( = ?auto_75352 ?auto_75353 ) ) ( not ( = ?auto_75355 ?auto_75353 ) ) ( not ( = ?auto_75354 ?auto_75353 ) ) ( not ( = ?auto_75356 ?auto_75353 ) ) ( not ( = ?auto_75357 ?auto_75353 ) ) ( HOLDING ?auto_75351 ) ( CLEAR ?auto_75352 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75354 ?auto_75356 ?auto_75357 ?auto_75355 ?auto_75352 ?auto_75351 )
      ( MAKE-3PILE ?auto_75350 ?auto_75351 ?auto_75352 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75358 - BLOCK
      ?auto_75359 - BLOCK
      ?auto_75360 - BLOCK
    )
    :vars
    (
      ?auto_75365 - BLOCK
      ?auto_75361 - BLOCK
      ?auto_75363 - BLOCK
      ?auto_75364 - BLOCK
      ?auto_75362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75358 ?auto_75359 ) ) ( not ( = ?auto_75358 ?auto_75360 ) ) ( not ( = ?auto_75359 ?auto_75360 ) ) ( ON ?auto_75360 ?auto_75365 ) ( not ( = ?auto_75358 ?auto_75365 ) ) ( not ( = ?auto_75359 ?auto_75365 ) ) ( not ( = ?auto_75360 ?auto_75365 ) ) ( ON-TABLE ?auto_75361 ) ( ON ?auto_75363 ?auto_75361 ) ( ON ?auto_75364 ?auto_75363 ) ( ON ?auto_75365 ?auto_75364 ) ( not ( = ?auto_75361 ?auto_75363 ) ) ( not ( = ?auto_75361 ?auto_75364 ) ) ( not ( = ?auto_75361 ?auto_75365 ) ) ( not ( = ?auto_75361 ?auto_75360 ) ) ( not ( = ?auto_75361 ?auto_75359 ) ) ( not ( = ?auto_75363 ?auto_75364 ) ) ( not ( = ?auto_75363 ?auto_75365 ) ) ( not ( = ?auto_75363 ?auto_75360 ) ) ( not ( = ?auto_75363 ?auto_75359 ) ) ( not ( = ?auto_75364 ?auto_75365 ) ) ( not ( = ?auto_75364 ?auto_75360 ) ) ( not ( = ?auto_75364 ?auto_75359 ) ) ( not ( = ?auto_75358 ?auto_75361 ) ) ( not ( = ?auto_75358 ?auto_75363 ) ) ( not ( = ?auto_75358 ?auto_75364 ) ) ( ON ?auto_75358 ?auto_75362 ) ( not ( = ?auto_75358 ?auto_75362 ) ) ( not ( = ?auto_75359 ?auto_75362 ) ) ( not ( = ?auto_75360 ?auto_75362 ) ) ( not ( = ?auto_75365 ?auto_75362 ) ) ( not ( = ?auto_75361 ?auto_75362 ) ) ( not ( = ?auto_75363 ?auto_75362 ) ) ( not ( = ?auto_75364 ?auto_75362 ) ) ( CLEAR ?auto_75360 ) ( ON ?auto_75359 ?auto_75358 ) ( CLEAR ?auto_75359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75362 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75362 ?auto_75358 )
      ( MAKE-3PILE ?auto_75358 ?auto_75359 ?auto_75360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75366 - BLOCK
      ?auto_75367 - BLOCK
      ?auto_75368 - BLOCK
    )
    :vars
    (
      ?auto_75369 - BLOCK
      ?auto_75370 - BLOCK
      ?auto_75372 - BLOCK
      ?auto_75373 - BLOCK
      ?auto_75371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75366 ?auto_75367 ) ) ( not ( = ?auto_75366 ?auto_75368 ) ) ( not ( = ?auto_75367 ?auto_75368 ) ) ( not ( = ?auto_75366 ?auto_75369 ) ) ( not ( = ?auto_75367 ?auto_75369 ) ) ( not ( = ?auto_75368 ?auto_75369 ) ) ( ON-TABLE ?auto_75370 ) ( ON ?auto_75372 ?auto_75370 ) ( ON ?auto_75373 ?auto_75372 ) ( ON ?auto_75369 ?auto_75373 ) ( not ( = ?auto_75370 ?auto_75372 ) ) ( not ( = ?auto_75370 ?auto_75373 ) ) ( not ( = ?auto_75370 ?auto_75369 ) ) ( not ( = ?auto_75370 ?auto_75368 ) ) ( not ( = ?auto_75370 ?auto_75367 ) ) ( not ( = ?auto_75372 ?auto_75373 ) ) ( not ( = ?auto_75372 ?auto_75369 ) ) ( not ( = ?auto_75372 ?auto_75368 ) ) ( not ( = ?auto_75372 ?auto_75367 ) ) ( not ( = ?auto_75373 ?auto_75369 ) ) ( not ( = ?auto_75373 ?auto_75368 ) ) ( not ( = ?auto_75373 ?auto_75367 ) ) ( not ( = ?auto_75366 ?auto_75370 ) ) ( not ( = ?auto_75366 ?auto_75372 ) ) ( not ( = ?auto_75366 ?auto_75373 ) ) ( ON ?auto_75366 ?auto_75371 ) ( not ( = ?auto_75366 ?auto_75371 ) ) ( not ( = ?auto_75367 ?auto_75371 ) ) ( not ( = ?auto_75368 ?auto_75371 ) ) ( not ( = ?auto_75369 ?auto_75371 ) ) ( not ( = ?auto_75370 ?auto_75371 ) ) ( not ( = ?auto_75372 ?auto_75371 ) ) ( not ( = ?auto_75373 ?auto_75371 ) ) ( ON ?auto_75367 ?auto_75366 ) ( CLEAR ?auto_75367 ) ( ON-TABLE ?auto_75371 ) ( HOLDING ?auto_75368 ) ( CLEAR ?auto_75369 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75370 ?auto_75372 ?auto_75373 ?auto_75369 ?auto_75368 )
      ( MAKE-3PILE ?auto_75366 ?auto_75367 ?auto_75368 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75374 - BLOCK
      ?auto_75375 - BLOCK
      ?auto_75376 - BLOCK
    )
    :vars
    (
      ?auto_75377 - BLOCK
      ?auto_75378 - BLOCK
      ?auto_75379 - BLOCK
      ?auto_75381 - BLOCK
      ?auto_75380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75374 ?auto_75375 ) ) ( not ( = ?auto_75374 ?auto_75376 ) ) ( not ( = ?auto_75375 ?auto_75376 ) ) ( not ( = ?auto_75374 ?auto_75377 ) ) ( not ( = ?auto_75375 ?auto_75377 ) ) ( not ( = ?auto_75376 ?auto_75377 ) ) ( ON-TABLE ?auto_75378 ) ( ON ?auto_75379 ?auto_75378 ) ( ON ?auto_75381 ?auto_75379 ) ( ON ?auto_75377 ?auto_75381 ) ( not ( = ?auto_75378 ?auto_75379 ) ) ( not ( = ?auto_75378 ?auto_75381 ) ) ( not ( = ?auto_75378 ?auto_75377 ) ) ( not ( = ?auto_75378 ?auto_75376 ) ) ( not ( = ?auto_75378 ?auto_75375 ) ) ( not ( = ?auto_75379 ?auto_75381 ) ) ( not ( = ?auto_75379 ?auto_75377 ) ) ( not ( = ?auto_75379 ?auto_75376 ) ) ( not ( = ?auto_75379 ?auto_75375 ) ) ( not ( = ?auto_75381 ?auto_75377 ) ) ( not ( = ?auto_75381 ?auto_75376 ) ) ( not ( = ?auto_75381 ?auto_75375 ) ) ( not ( = ?auto_75374 ?auto_75378 ) ) ( not ( = ?auto_75374 ?auto_75379 ) ) ( not ( = ?auto_75374 ?auto_75381 ) ) ( ON ?auto_75374 ?auto_75380 ) ( not ( = ?auto_75374 ?auto_75380 ) ) ( not ( = ?auto_75375 ?auto_75380 ) ) ( not ( = ?auto_75376 ?auto_75380 ) ) ( not ( = ?auto_75377 ?auto_75380 ) ) ( not ( = ?auto_75378 ?auto_75380 ) ) ( not ( = ?auto_75379 ?auto_75380 ) ) ( not ( = ?auto_75381 ?auto_75380 ) ) ( ON ?auto_75375 ?auto_75374 ) ( ON-TABLE ?auto_75380 ) ( CLEAR ?auto_75377 ) ( ON ?auto_75376 ?auto_75375 ) ( CLEAR ?auto_75376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75380 ?auto_75374 ?auto_75375 )
      ( MAKE-3PILE ?auto_75374 ?auto_75375 ?auto_75376 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75382 - BLOCK
      ?auto_75383 - BLOCK
      ?auto_75384 - BLOCK
    )
    :vars
    (
      ?auto_75385 - BLOCK
      ?auto_75388 - BLOCK
      ?auto_75387 - BLOCK
      ?auto_75389 - BLOCK
      ?auto_75386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75382 ?auto_75383 ) ) ( not ( = ?auto_75382 ?auto_75384 ) ) ( not ( = ?auto_75383 ?auto_75384 ) ) ( not ( = ?auto_75382 ?auto_75385 ) ) ( not ( = ?auto_75383 ?auto_75385 ) ) ( not ( = ?auto_75384 ?auto_75385 ) ) ( ON-TABLE ?auto_75388 ) ( ON ?auto_75387 ?auto_75388 ) ( ON ?auto_75389 ?auto_75387 ) ( not ( = ?auto_75388 ?auto_75387 ) ) ( not ( = ?auto_75388 ?auto_75389 ) ) ( not ( = ?auto_75388 ?auto_75385 ) ) ( not ( = ?auto_75388 ?auto_75384 ) ) ( not ( = ?auto_75388 ?auto_75383 ) ) ( not ( = ?auto_75387 ?auto_75389 ) ) ( not ( = ?auto_75387 ?auto_75385 ) ) ( not ( = ?auto_75387 ?auto_75384 ) ) ( not ( = ?auto_75387 ?auto_75383 ) ) ( not ( = ?auto_75389 ?auto_75385 ) ) ( not ( = ?auto_75389 ?auto_75384 ) ) ( not ( = ?auto_75389 ?auto_75383 ) ) ( not ( = ?auto_75382 ?auto_75388 ) ) ( not ( = ?auto_75382 ?auto_75387 ) ) ( not ( = ?auto_75382 ?auto_75389 ) ) ( ON ?auto_75382 ?auto_75386 ) ( not ( = ?auto_75382 ?auto_75386 ) ) ( not ( = ?auto_75383 ?auto_75386 ) ) ( not ( = ?auto_75384 ?auto_75386 ) ) ( not ( = ?auto_75385 ?auto_75386 ) ) ( not ( = ?auto_75388 ?auto_75386 ) ) ( not ( = ?auto_75387 ?auto_75386 ) ) ( not ( = ?auto_75389 ?auto_75386 ) ) ( ON ?auto_75383 ?auto_75382 ) ( ON-TABLE ?auto_75386 ) ( ON ?auto_75384 ?auto_75383 ) ( CLEAR ?auto_75384 ) ( HOLDING ?auto_75385 ) ( CLEAR ?auto_75389 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75388 ?auto_75387 ?auto_75389 ?auto_75385 )
      ( MAKE-3PILE ?auto_75382 ?auto_75383 ?auto_75384 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75390 - BLOCK
      ?auto_75391 - BLOCK
      ?auto_75392 - BLOCK
    )
    :vars
    (
      ?auto_75394 - BLOCK
      ?auto_75395 - BLOCK
      ?auto_75397 - BLOCK
      ?auto_75396 - BLOCK
      ?auto_75393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75390 ?auto_75391 ) ) ( not ( = ?auto_75390 ?auto_75392 ) ) ( not ( = ?auto_75391 ?auto_75392 ) ) ( not ( = ?auto_75390 ?auto_75394 ) ) ( not ( = ?auto_75391 ?auto_75394 ) ) ( not ( = ?auto_75392 ?auto_75394 ) ) ( ON-TABLE ?auto_75395 ) ( ON ?auto_75397 ?auto_75395 ) ( ON ?auto_75396 ?auto_75397 ) ( not ( = ?auto_75395 ?auto_75397 ) ) ( not ( = ?auto_75395 ?auto_75396 ) ) ( not ( = ?auto_75395 ?auto_75394 ) ) ( not ( = ?auto_75395 ?auto_75392 ) ) ( not ( = ?auto_75395 ?auto_75391 ) ) ( not ( = ?auto_75397 ?auto_75396 ) ) ( not ( = ?auto_75397 ?auto_75394 ) ) ( not ( = ?auto_75397 ?auto_75392 ) ) ( not ( = ?auto_75397 ?auto_75391 ) ) ( not ( = ?auto_75396 ?auto_75394 ) ) ( not ( = ?auto_75396 ?auto_75392 ) ) ( not ( = ?auto_75396 ?auto_75391 ) ) ( not ( = ?auto_75390 ?auto_75395 ) ) ( not ( = ?auto_75390 ?auto_75397 ) ) ( not ( = ?auto_75390 ?auto_75396 ) ) ( ON ?auto_75390 ?auto_75393 ) ( not ( = ?auto_75390 ?auto_75393 ) ) ( not ( = ?auto_75391 ?auto_75393 ) ) ( not ( = ?auto_75392 ?auto_75393 ) ) ( not ( = ?auto_75394 ?auto_75393 ) ) ( not ( = ?auto_75395 ?auto_75393 ) ) ( not ( = ?auto_75397 ?auto_75393 ) ) ( not ( = ?auto_75396 ?auto_75393 ) ) ( ON ?auto_75391 ?auto_75390 ) ( ON-TABLE ?auto_75393 ) ( ON ?auto_75392 ?auto_75391 ) ( CLEAR ?auto_75396 ) ( ON ?auto_75394 ?auto_75392 ) ( CLEAR ?auto_75394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75393 ?auto_75390 ?auto_75391 ?auto_75392 )
      ( MAKE-3PILE ?auto_75390 ?auto_75391 ?auto_75392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75398 - BLOCK
      ?auto_75399 - BLOCK
      ?auto_75400 - BLOCK
    )
    :vars
    (
      ?auto_75402 - BLOCK
      ?auto_75404 - BLOCK
      ?auto_75405 - BLOCK
      ?auto_75403 - BLOCK
      ?auto_75401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75398 ?auto_75399 ) ) ( not ( = ?auto_75398 ?auto_75400 ) ) ( not ( = ?auto_75399 ?auto_75400 ) ) ( not ( = ?auto_75398 ?auto_75402 ) ) ( not ( = ?auto_75399 ?auto_75402 ) ) ( not ( = ?auto_75400 ?auto_75402 ) ) ( ON-TABLE ?auto_75404 ) ( ON ?auto_75405 ?auto_75404 ) ( not ( = ?auto_75404 ?auto_75405 ) ) ( not ( = ?auto_75404 ?auto_75403 ) ) ( not ( = ?auto_75404 ?auto_75402 ) ) ( not ( = ?auto_75404 ?auto_75400 ) ) ( not ( = ?auto_75404 ?auto_75399 ) ) ( not ( = ?auto_75405 ?auto_75403 ) ) ( not ( = ?auto_75405 ?auto_75402 ) ) ( not ( = ?auto_75405 ?auto_75400 ) ) ( not ( = ?auto_75405 ?auto_75399 ) ) ( not ( = ?auto_75403 ?auto_75402 ) ) ( not ( = ?auto_75403 ?auto_75400 ) ) ( not ( = ?auto_75403 ?auto_75399 ) ) ( not ( = ?auto_75398 ?auto_75404 ) ) ( not ( = ?auto_75398 ?auto_75405 ) ) ( not ( = ?auto_75398 ?auto_75403 ) ) ( ON ?auto_75398 ?auto_75401 ) ( not ( = ?auto_75398 ?auto_75401 ) ) ( not ( = ?auto_75399 ?auto_75401 ) ) ( not ( = ?auto_75400 ?auto_75401 ) ) ( not ( = ?auto_75402 ?auto_75401 ) ) ( not ( = ?auto_75404 ?auto_75401 ) ) ( not ( = ?auto_75405 ?auto_75401 ) ) ( not ( = ?auto_75403 ?auto_75401 ) ) ( ON ?auto_75399 ?auto_75398 ) ( ON-TABLE ?auto_75401 ) ( ON ?auto_75400 ?auto_75399 ) ( ON ?auto_75402 ?auto_75400 ) ( CLEAR ?auto_75402 ) ( HOLDING ?auto_75403 ) ( CLEAR ?auto_75405 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75404 ?auto_75405 ?auto_75403 )
      ( MAKE-3PILE ?auto_75398 ?auto_75399 ?auto_75400 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75406 - BLOCK
      ?auto_75407 - BLOCK
      ?auto_75408 - BLOCK
    )
    :vars
    (
      ?auto_75410 - BLOCK
      ?auto_75409 - BLOCK
      ?auto_75412 - BLOCK
      ?auto_75411 - BLOCK
      ?auto_75413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75406 ?auto_75407 ) ) ( not ( = ?auto_75406 ?auto_75408 ) ) ( not ( = ?auto_75407 ?auto_75408 ) ) ( not ( = ?auto_75406 ?auto_75410 ) ) ( not ( = ?auto_75407 ?auto_75410 ) ) ( not ( = ?auto_75408 ?auto_75410 ) ) ( ON-TABLE ?auto_75409 ) ( ON ?auto_75412 ?auto_75409 ) ( not ( = ?auto_75409 ?auto_75412 ) ) ( not ( = ?auto_75409 ?auto_75411 ) ) ( not ( = ?auto_75409 ?auto_75410 ) ) ( not ( = ?auto_75409 ?auto_75408 ) ) ( not ( = ?auto_75409 ?auto_75407 ) ) ( not ( = ?auto_75412 ?auto_75411 ) ) ( not ( = ?auto_75412 ?auto_75410 ) ) ( not ( = ?auto_75412 ?auto_75408 ) ) ( not ( = ?auto_75412 ?auto_75407 ) ) ( not ( = ?auto_75411 ?auto_75410 ) ) ( not ( = ?auto_75411 ?auto_75408 ) ) ( not ( = ?auto_75411 ?auto_75407 ) ) ( not ( = ?auto_75406 ?auto_75409 ) ) ( not ( = ?auto_75406 ?auto_75412 ) ) ( not ( = ?auto_75406 ?auto_75411 ) ) ( ON ?auto_75406 ?auto_75413 ) ( not ( = ?auto_75406 ?auto_75413 ) ) ( not ( = ?auto_75407 ?auto_75413 ) ) ( not ( = ?auto_75408 ?auto_75413 ) ) ( not ( = ?auto_75410 ?auto_75413 ) ) ( not ( = ?auto_75409 ?auto_75413 ) ) ( not ( = ?auto_75412 ?auto_75413 ) ) ( not ( = ?auto_75411 ?auto_75413 ) ) ( ON ?auto_75407 ?auto_75406 ) ( ON-TABLE ?auto_75413 ) ( ON ?auto_75408 ?auto_75407 ) ( ON ?auto_75410 ?auto_75408 ) ( CLEAR ?auto_75412 ) ( ON ?auto_75411 ?auto_75410 ) ( CLEAR ?auto_75411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75413 ?auto_75406 ?auto_75407 ?auto_75408 ?auto_75410 )
      ( MAKE-3PILE ?auto_75406 ?auto_75407 ?auto_75408 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75414 - BLOCK
      ?auto_75415 - BLOCK
      ?auto_75416 - BLOCK
    )
    :vars
    (
      ?auto_75421 - BLOCK
      ?auto_75419 - BLOCK
      ?auto_75418 - BLOCK
      ?auto_75420 - BLOCK
      ?auto_75417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75414 ?auto_75415 ) ) ( not ( = ?auto_75414 ?auto_75416 ) ) ( not ( = ?auto_75415 ?auto_75416 ) ) ( not ( = ?auto_75414 ?auto_75421 ) ) ( not ( = ?auto_75415 ?auto_75421 ) ) ( not ( = ?auto_75416 ?auto_75421 ) ) ( ON-TABLE ?auto_75419 ) ( not ( = ?auto_75419 ?auto_75418 ) ) ( not ( = ?auto_75419 ?auto_75420 ) ) ( not ( = ?auto_75419 ?auto_75421 ) ) ( not ( = ?auto_75419 ?auto_75416 ) ) ( not ( = ?auto_75419 ?auto_75415 ) ) ( not ( = ?auto_75418 ?auto_75420 ) ) ( not ( = ?auto_75418 ?auto_75421 ) ) ( not ( = ?auto_75418 ?auto_75416 ) ) ( not ( = ?auto_75418 ?auto_75415 ) ) ( not ( = ?auto_75420 ?auto_75421 ) ) ( not ( = ?auto_75420 ?auto_75416 ) ) ( not ( = ?auto_75420 ?auto_75415 ) ) ( not ( = ?auto_75414 ?auto_75419 ) ) ( not ( = ?auto_75414 ?auto_75418 ) ) ( not ( = ?auto_75414 ?auto_75420 ) ) ( ON ?auto_75414 ?auto_75417 ) ( not ( = ?auto_75414 ?auto_75417 ) ) ( not ( = ?auto_75415 ?auto_75417 ) ) ( not ( = ?auto_75416 ?auto_75417 ) ) ( not ( = ?auto_75421 ?auto_75417 ) ) ( not ( = ?auto_75419 ?auto_75417 ) ) ( not ( = ?auto_75418 ?auto_75417 ) ) ( not ( = ?auto_75420 ?auto_75417 ) ) ( ON ?auto_75415 ?auto_75414 ) ( ON-TABLE ?auto_75417 ) ( ON ?auto_75416 ?auto_75415 ) ( ON ?auto_75421 ?auto_75416 ) ( ON ?auto_75420 ?auto_75421 ) ( CLEAR ?auto_75420 ) ( HOLDING ?auto_75418 ) ( CLEAR ?auto_75419 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75419 ?auto_75418 )
      ( MAKE-3PILE ?auto_75414 ?auto_75415 ?auto_75416 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75422 - BLOCK
      ?auto_75423 - BLOCK
      ?auto_75424 - BLOCK
    )
    :vars
    (
      ?auto_75429 - BLOCK
      ?auto_75428 - BLOCK
      ?auto_75427 - BLOCK
      ?auto_75426 - BLOCK
      ?auto_75425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75422 ?auto_75423 ) ) ( not ( = ?auto_75422 ?auto_75424 ) ) ( not ( = ?auto_75423 ?auto_75424 ) ) ( not ( = ?auto_75422 ?auto_75429 ) ) ( not ( = ?auto_75423 ?auto_75429 ) ) ( not ( = ?auto_75424 ?auto_75429 ) ) ( ON-TABLE ?auto_75428 ) ( not ( = ?auto_75428 ?auto_75427 ) ) ( not ( = ?auto_75428 ?auto_75426 ) ) ( not ( = ?auto_75428 ?auto_75429 ) ) ( not ( = ?auto_75428 ?auto_75424 ) ) ( not ( = ?auto_75428 ?auto_75423 ) ) ( not ( = ?auto_75427 ?auto_75426 ) ) ( not ( = ?auto_75427 ?auto_75429 ) ) ( not ( = ?auto_75427 ?auto_75424 ) ) ( not ( = ?auto_75427 ?auto_75423 ) ) ( not ( = ?auto_75426 ?auto_75429 ) ) ( not ( = ?auto_75426 ?auto_75424 ) ) ( not ( = ?auto_75426 ?auto_75423 ) ) ( not ( = ?auto_75422 ?auto_75428 ) ) ( not ( = ?auto_75422 ?auto_75427 ) ) ( not ( = ?auto_75422 ?auto_75426 ) ) ( ON ?auto_75422 ?auto_75425 ) ( not ( = ?auto_75422 ?auto_75425 ) ) ( not ( = ?auto_75423 ?auto_75425 ) ) ( not ( = ?auto_75424 ?auto_75425 ) ) ( not ( = ?auto_75429 ?auto_75425 ) ) ( not ( = ?auto_75428 ?auto_75425 ) ) ( not ( = ?auto_75427 ?auto_75425 ) ) ( not ( = ?auto_75426 ?auto_75425 ) ) ( ON ?auto_75423 ?auto_75422 ) ( ON-TABLE ?auto_75425 ) ( ON ?auto_75424 ?auto_75423 ) ( ON ?auto_75429 ?auto_75424 ) ( ON ?auto_75426 ?auto_75429 ) ( CLEAR ?auto_75428 ) ( ON ?auto_75427 ?auto_75426 ) ( CLEAR ?auto_75427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75425 ?auto_75422 ?auto_75423 ?auto_75424 ?auto_75429 ?auto_75426 )
      ( MAKE-3PILE ?auto_75422 ?auto_75423 ?auto_75424 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75430 - BLOCK
      ?auto_75431 - BLOCK
      ?auto_75432 - BLOCK
    )
    :vars
    (
      ?auto_75433 - BLOCK
      ?auto_75437 - BLOCK
      ?auto_75435 - BLOCK
      ?auto_75434 - BLOCK
      ?auto_75436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75430 ?auto_75431 ) ) ( not ( = ?auto_75430 ?auto_75432 ) ) ( not ( = ?auto_75431 ?auto_75432 ) ) ( not ( = ?auto_75430 ?auto_75433 ) ) ( not ( = ?auto_75431 ?auto_75433 ) ) ( not ( = ?auto_75432 ?auto_75433 ) ) ( not ( = ?auto_75437 ?auto_75435 ) ) ( not ( = ?auto_75437 ?auto_75434 ) ) ( not ( = ?auto_75437 ?auto_75433 ) ) ( not ( = ?auto_75437 ?auto_75432 ) ) ( not ( = ?auto_75437 ?auto_75431 ) ) ( not ( = ?auto_75435 ?auto_75434 ) ) ( not ( = ?auto_75435 ?auto_75433 ) ) ( not ( = ?auto_75435 ?auto_75432 ) ) ( not ( = ?auto_75435 ?auto_75431 ) ) ( not ( = ?auto_75434 ?auto_75433 ) ) ( not ( = ?auto_75434 ?auto_75432 ) ) ( not ( = ?auto_75434 ?auto_75431 ) ) ( not ( = ?auto_75430 ?auto_75437 ) ) ( not ( = ?auto_75430 ?auto_75435 ) ) ( not ( = ?auto_75430 ?auto_75434 ) ) ( ON ?auto_75430 ?auto_75436 ) ( not ( = ?auto_75430 ?auto_75436 ) ) ( not ( = ?auto_75431 ?auto_75436 ) ) ( not ( = ?auto_75432 ?auto_75436 ) ) ( not ( = ?auto_75433 ?auto_75436 ) ) ( not ( = ?auto_75437 ?auto_75436 ) ) ( not ( = ?auto_75435 ?auto_75436 ) ) ( not ( = ?auto_75434 ?auto_75436 ) ) ( ON ?auto_75431 ?auto_75430 ) ( ON-TABLE ?auto_75436 ) ( ON ?auto_75432 ?auto_75431 ) ( ON ?auto_75433 ?auto_75432 ) ( ON ?auto_75434 ?auto_75433 ) ( ON ?auto_75435 ?auto_75434 ) ( CLEAR ?auto_75435 ) ( HOLDING ?auto_75437 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75437 )
      ( MAKE-3PILE ?auto_75430 ?auto_75431 ?auto_75432 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75438 - BLOCK
      ?auto_75439 - BLOCK
      ?auto_75440 - BLOCK
    )
    :vars
    (
      ?auto_75442 - BLOCK
      ?auto_75441 - BLOCK
      ?auto_75444 - BLOCK
      ?auto_75445 - BLOCK
      ?auto_75443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75438 ?auto_75439 ) ) ( not ( = ?auto_75438 ?auto_75440 ) ) ( not ( = ?auto_75439 ?auto_75440 ) ) ( not ( = ?auto_75438 ?auto_75442 ) ) ( not ( = ?auto_75439 ?auto_75442 ) ) ( not ( = ?auto_75440 ?auto_75442 ) ) ( not ( = ?auto_75441 ?auto_75444 ) ) ( not ( = ?auto_75441 ?auto_75445 ) ) ( not ( = ?auto_75441 ?auto_75442 ) ) ( not ( = ?auto_75441 ?auto_75440 ) ) ( not ( = ?auto_75441 ?auto_75439 ) ) ( not ( = ?auto_75444 ?auto_75445 ) ) ( not ( = ?auto_75444 ?auto_75442 ) ) ( not ( = ?auto_75444 ?auto_75440 ) ) ( not ( = ?auto_75444 ?auto_75439 ) ) ( not ( = ?auto_75445 ?auto_75442 ) ) ( not ( = ?auto_75445 ?auto_75440 ) ) ( not ( = ?auto_75445 ?auto_75439 ) ) ( not ( = ?auto_75438 ?auto_75441 ) ) ( not ( = ?auto_75438 ?auto_75444 ) ) ( not ( = ?auto_75438 ?auto_75445 ) ) ( ON ?auto_75438 ?auto_75443 ) ( not ( = ?auto_75438 ?auto_75443 ) ) ( not ( = ?auto_75439 ?auto_75443 ) ) ( not ( = ?auto_75440 ?auto_75443 ) ) ( not ( = ?auto_75442 ?auto_75443 ) ) ( not ( = ?auto_75441 ?auto_75443 ) ) ( not ( = ?auto_75444 ?auto_75443 ) ) ( not ( = ?auto_75445 ?auto_75443 ) ) ( ON ?auto_75439 ?auto_75438 ) ( ON-TABLE ?auto_75443 ) ( ON ?auto_75440 ?auto_75439 ) ( ON ?auto_75442 ?auto_75440 ) ( ON ?auto_75445 ?auto_75442 ) ( ON ?auto_75444 ?auto_75445 ) ( ON ?auto_75441 ?auto_75444 ) ( CLEAR ?auto_75441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_75443 ?auto_75438 ?auto_75439 ?auto_75440 ?auto_75442 ?auto_75445 ?auto_75444 )
      ( MAKE-3PILE ?auto_75438 ?auto_75439 ?auto_75440 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75465 - BLOCK
      ?auto_75466 - BLOCK
      ?auto_75467 - BLOCK
    )
    :vars
    (
      ?auto_75469 - BLOCK
      ?auto_75470 - BLOCK
      ?auto_75468 - BLOCK
      ?auto_75471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75469 ?auto_75467 ) ( ON-TABLE ?auto_75465 ) ( ON ?auto_75466 ?auto_75465 ) ( ON ?auto_75467 ?auto_75466 ) ( not ( = ?auto_75465 ?auto_75466 ) ) ( not ( = ?auto_75465 ?auto_75467 ) ) ( not ( = ?auto_75465 ?auto_75469 ) ) ( not ( = ?auto_75466 ?auto_75467 ) ) ( not ( = ?auto_75466 ?auto_75469 ) ) ( not ( = ?auto_75467 ?auto_75469 ) ) ( not ( = ?auto_75465 ?auto_75470 ) ) ( not ( = ?auto_75465 ?auto_75468 ) ) ( not ( = ?auto_75466 ?auto_75470 ) ) ( not ( = ?auto_75466 ?auto_75468 ) ) ( not ( = ?auto_75467 ?auto_75470 ) ) ( not ( = ?auto_75467 ?auto_75468 ) ) ( not ( = ?auto_75469 ?auto_75470 ) ) ( not ( = ?auto_75469 ?auto_75468 ) ) ( not ( = ?auto_75470 ?auto_75468 ) ) ( ON ?auto_75470 ?auto_75469 ) ( CLEAR ?auto_75470 ) ( HOLDING ?auto_75468 ) ( CLEAR ?auto_75471 ) ( ON-TABLE ?auto_75471 ) ( not ( = ?auto_75471 ?auto_75468 ) ) ( not ( = ?auto_75465 ?auto_75471 ) ) ( not ( = ?auto_75466 ?auto_75471 ) ) ( not ( = ?auto_75467 ?auto_75471 ) ) ( not ( = ?auto_75469 ?auto_75471 ) ) ( not ( = ?auto_75470 ?auto_75471 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75471 ?auto_75468 )
      ( MAKE-3PILE ?auto_75465 ?auto_75466 ?auto_75467 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75472 - BLOCK
      ?auto_75473 - BLOCK
      ?auto_75474 - BLOCK
    )
    :vars
    (
      ?auto_75478 - BLOCK
      ?auto_75475 - BLOCK
      ?auto_75476 - BLOCK
      ?auto_75477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75478 ?auto_75474 ) ( ON-TABLE ?auto_75472 ) ( ON ?auto_75473 ?auto_75472 ) ( ON ?auto_75474 ?auto_75473 ) ( not ( = ?auto_75472 ?auto_75473 ) ) ( not ( = ?auto_75472 ?auto_75474 ) ) ( not ( = ?auto_75472 ?auto_75478 ) ) ( not ( = ?auto_75473 ?auto_75474 ) ) ( not ( = ?auto_75473 ?auto_75478 ) ) ( not ( = ?auto_75474 ?auto_75478 ) ) ( not ( = ?auto_75472 ?auto_75475 ) ) ( not ( = ?auto_75472 ?auto_75476 ) ) ( not ( = ?auto_75473 ?auto_75475 ) ) ( not ( = ?auto_75473 ?auto_75476 ) ) ( not ( = ?auto_75474 ?auto_75475 ) ) ( not ( = ?auto_75474 ?auto_75476 ) ) ( not ( = ?auto_75478 ?auto_75475 ) ) ( not ( = ?auto_75478 ?auto_75476 ) ) ( not ( = ?auto_75475 ?auto_75476 ) ) ( ON ?auto_75475 ?auto_75478 ) ( CLEAR ?auto_75477 ) ( ON-TABLE ?auto_75477 ) ( not ( = ?auto_75477 ?auto_75476 ) ) ( not ( = ?auto_75472 ?auto_75477 ) ) ( not ( = ?auto_75473 ?auto_75477 ) ) ( not ( = ?auto_75474 ?auto_75477 ) ) ( not ( = ?auto_75478 ?auto_75477 ) ) ( not ( = ?auto_75475 ?auto_75477 ) ) ( ON ?auto_75476 ?auto_75475 ) ( CLEAR ?auto_75476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75472 ?auto_75473 ?auto_75474 ?auto_75478 ?auto_75475 )
      ( MAKE-3PILE ?auto_75472 ?auto_75473 ?auto_75474 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75479 - BLOCK
      ?auto_75480 - BLOCK
      ?auto_75481 - BLOCK
    )
    :vars
    (
      ?auto_75485 - BLOCK
      ?auto_75484 - BLOCK
      ?auto_75483 - BLOCK
      ?auto_75482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75485 ?auto_75481 ) ( ON-TABLE ?auto_75479 ) ( ON ?auto_75480 ?auto_75479 ) ( ON ?auto_75481 ?auto_75480 ) ( not ( = ?auto_75479 ?auto_75480 ) ) ( not ( = ?auto_75479 ?auto_75481 ) ) ( not ( = ?auto_75479 ?auto_75485 ) ) ( not ( = ?auto_75480 ?auto_75481 ) ) ( not ( = ?auto_75480 ?auto_75485 ) ) ( not ( = ?auto_75481 ?auto_75485 ) ) ( not ( = ?auto_75479 ?auto_75484 ) ) ( not ( = ?auto_75479 ?auto_75483 ) ) ( not ( = ?auto_75480 ?auto_75484 ) ) ( not ( = ?auto_75480 ?auto_75483 ) ) ( not ( = ?auto_75481 ?auto_75484 ) ) ( not ( = ?auto_75481 ?auto_75483 ) ) ( not ( = ?auto_75485 ?auto_75484 ) ) ( not ( = ?auto_75485 ?auto_75483 ) ) ( not ( = ?auto_75484 ?auto_75483 ) ) ( ON ?auto_75484 ?auto_75485 ) ( not ( = ?auto_75482 ?auto_75483 ) ) ( not ( = ?auto_75479 ?auto_75482 ) ) ( not ( = ?auto_75480 ?auto_75482 ) ) ( not ( = ?auto_75481 ?auto_75482 ) ) ( not ( = ?auto_75485 ?auto_75482 ) ) ( not ( = ?auto_75484 ?auto_75482 ) ) ( ON ?auto_75483 ?auto_75484 ) ( CLEAR ?auto_75483 ) ( HOLDING ?auto_75482 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75482 )
      ( MAKE-3PILE ?auto_75479 ?auto_75480 ?auto_75481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75496 - BLOCK
      ?auto_75497 - BLOCK
      ?auto_75498 - BLOCK
    )
    :vars
    (
      ?auto_75499 - BLOCK
      ?auto_75501 - BLOCK
      ?auto_75500 - BLOCK
      ?auto_75502 - BLOCK
      ?auto_75503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75499 ?auto_75498 ) ( ON-TABLE ?auto_75496 ) ( ON ?auto_75497 ?auto_75496 ) ( ON ?auto_75498 ?auto_75497 ) ( not ( = ?auto_75496 ?auto_75497 ) ) ( not ( = ?auto_75496 ?auto_75498 ) ) ( not ( = ?auto_75496 ?auto_75499 ) ) ( not ( = ?auto_75497 ?auto_75498 ) ) ( not ( = ?auto_75497 ?auto_75499 ) ) ( not ( = ?auto_75498 ?auto_75499 ) ) ( not ( = ?auto_75496 ?auto_75501 ) ) ( not ( = ?auto_75496 ?auto_75500 ) ) ( not ( = ?auto_75497 ?auto_75501 ) ) ( not ( = ?auto_75497 ?auto_75500 ) ) ( not ( = ?auto_75498 ?auto_75501 ) ) ( not ( = ?auto_75498 ?auto_75500 ) ) ( not ( = ?auto_75499 ?auto_75501 ) ) ( not ( = ?auto_75499 ?auto_75500 ) ) ( not ( = ?auto_75501 ?auto_75500 ) ) ( ON ?auto_75501 ?auto_75499 ) ( not ( = ?auto_75502 ?auto_75500 ) ) ( not ( = ?auto_75496 ?auto_75502 ) ) ( not ( = ?auto_75497 ?auto_75502 ) ) ( not ( = ?auto_75498 ?auto_75502 ) ) ( not ( = ?auto_75499 ?auto_75502 ) ) ( not ( = ?auto_75501 ?auto_75502 ) ) ( ON ?auto_75500 ?auto_75501 ) ( CLEAR ?auto_75500 ) ( ON ?auto_75502 ?auto_75503 ) ( CLEAR ?auto_75502 ) ( HAND-EMPTY ) ( not ( = ?auto_75496 ?auto_75503 ) ) ( not ( = ?auto_75497 ?auto_75503 ) ) ( not ( = ?auto_75498 ?auto_75503 ) ) ( not ( = ?auto_75499 ?auto_75503 ) ) ( not ( = ?auto_75501 ?auto_75503 ) ) ( not ( = ?auto_75500 ?auto_75503 ) ) ( not ( = ?auto_75502 ?auto_75503 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75502 ?auto_75503 )
      ( MAKE-3PILE ?auto_75496 ?auto_75497 ?auto_75498 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75504 - BLOCK
      ?auto_75505 - BLOCK
      ?auto_75506 - BLOCK
    )
    :vars
    (
      ?auto_75509 - BLOCK
      ?auto_75511 - BLOCK
      ?auto_75510 - BLOCK
      ?auto_75507 - BLOCK
      ?auto_75508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75509 ?auto_75506 ) ( ON-TABLE ?auto_75504 ) ( ON ?auto_75505 ?auto_75504 ) ( ON ?auto_75506 ?auto_75505 ) ( not ( = ?auto_75504 ?auto_75505 ) ) ( not ( = ?auto_75504 ?auto_75506 ) ) ( not ( = ?auto_75504 ?auto_75509 ) ) ( not ( = ?auto_75505 ?auto_75506 ) ) ( not ( = ?auto_75505 ?auto_75509 ) ) ( not ( = ?auto_75506 ?auto_75509 ) ) ( not ( = ?auto_75504 ?auto_75511 ) ) ( not ( = ?auto_75504 ?auto_75510 ) ) ( not ( = ?auto_75505 ?auto_75511 ) ) ( not ( = ?auto_75505 ?auto_75510 ) ) ( not ( = ?auto_75506 ?auto_75511 ) ) ( not ( = ?auto_75506 ?auto_75510 ) ) ( not ( = ?auto_75509 ?auto_75511 ) ) ( not ( = ?auto_75509 ?auto_75510 ) ) ( not ( = ?auto_75511 ?auto_75510 ) ) ( ON ?auto_75511 ?auto_75509 ) ( not ( = ?auto_75507 ?auto_75510 ) ) ( not ( = ?auto_75504 ?auto_75507 ) ) ( not ( = ?auto_75505 ?auto_75507 ) ) ( not ( = ?auto_75506 ?auto_75507 ) ) ( not ( = ?auto_75509 ?auto_75507 ) ) ( not ( = ?auto_75511 ?auto_75507 ) ) ( ON ?auto_75507 ?auto_75508 ) ( CLEAR ?auto_75507 ) ( not ( = ?auto_75504 ?auto_75508 ) ) ( not ( = ?auto_75505 ?auto_75508 ) ) ( not ( = ?auto_75506 ?auto_75508 ) ) ( not ( = ?auto_75509 ?auto_75508 ) ) ( not ( = ?auto_75511 ?auto_75508 ) ) ( not ( = ?auto_75510 ?auto_75508 ) ) ( not ( = ?auto_75507 ?auto_75508 ) ) ( HOLDING ?auto_75510 ) ( CLEAR ?auto_75511 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75504 ?auto_75505 ?auto_75506 ?auto_75509 ?auto_75511 ?auto_75510 )
      ( MAKE-3PILE ?auto_75504 ?auto_75505 ?auto_75506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75566 - BLOCK
      ?auto_75567 - BLOCK
      ?auto_75568 - BLOCK
      ?auto_75569 - BLOCK
    )
    :vars
    (
      ?auto_75570 - BLOCK
      ?auto_75572 - BLOCK
      ?auto_75571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75566 ) ( ON ?auto_75567 ?auto_75566 ) ( not ( = ?auto_75566 ?auto_75567 ) ) ( not ( = ?auto_75566 ?auto_75568 ) ) ( not ( = ?auto_75566 ?auto_75569 ) ) ( not ( = ?auto_75567 ?auto_75568 ) ) ( not ( = ?auto_75567 ?auto_75569 ) ) ( not ( = ?auto_75568 ?auto_75569 ) ) ( ON ?auto_75569 ?auto_75570 ) ( not ( = ?auto_75566 ?auto_75570 ) ) ( not ( = ?auto_75567 ?auto_75570 ) ) ( not ( = ?auto_75568 ?auto_75570 ) ) ( not ( = ?auto_75569 ?auto_75570 ) ) ( CLEAR ?auto_75567 ) ( ON ?auto_75568 ?auto_75569 ) ( CLEAR ?auto_75568 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75572 ) ( ON ?auto_75571 ?auto_75572 ) ( ON ?auto_75570 ?auto_75571 ) ( not ( = ?auto_75572 ?auto_75571 ) ) ( not ( = ?auto_75572 ?auto_75570 ) ) ( not ( = ?auto_75572 ?auto_75569 ) ) ( not ( = ?auto_75572 ?auto_75568 ) ) ( not ( = ?auto_75571 ?auto_75570 ) ) ( not ( = ?auto_75571 ?auto_75569 ) ) ( not ( = ?auto_75571 ?auto_75568 ) ) ( not ( = ?auto_75566 ?auto_75572 ) ) ( not ( = ?auto_75566 ?auto_75571 ) ) ( not ( = ?auto_75567 ?auto_75572 ) ) ( not ( = ?auto_75567 ?auto_75571 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75572 ?auto_75571 ?auto_75570 ?auto_75569 )
      ( MAKE-4PILE ?auto_75566 ?auto_75567 ?auto_75568 ?auto_75569 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75573 - BLOCK
      ?auto_75574 - BLOCK
      ?auto_75575 - BLOCK
      ?auto_75576 - BLOCK
    )
    :vars
    (
      ?auto_75577 - BLOCK
      ?auto_75579 - BLOCK
      ?auto_75578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75573 ) ( not ( = ?auto_75573 ?auto_75574 ) ) ( not ( = ?auto_75573 ?auto_75575 ) ) ( not ( = ?auto_75573 ?auto_75576 ) ) ( not ( = ?auto_75574 ?auto_75575 ) ) ( not ( = ?auto_75574 ?auto_75576 ) ) ( not ( = ?auto_75575 ?auto_75576 ) ) ( ON ?auto_75576 ?auto_75577 ) ( not ( = ?auto_75573 ?auto_75577 ) ) ( not ( = ?auto_75574 ?auto_75577 ) ) ( not ( = ?auto_75575 ?auto_75577 ) ) ( not ( = ?auto_75576 ?auto_75577 ) ) ( ON ?auto_75575 ?auto_75576 ) ( CLEAR ?auto_75575 ) ( ON-TABLE ?auto_75579 ) ( ON ?auto_75578 ?auto_75579 ) ( ON ?auto_75577 ?auto_75578 ) ( not ( = ?auto_75579 ?auto_75578 ) ) ( not ( = ?auto_75579 ?auto_75577 ) ) ( not ( = ?auto_75579 ?auto_75576 ) ) ( not ( = ?auto_75579 ?auto_75575 ) ) ( not ( = ?auto_75578 ?auto_75577 ) ) ( not ( = ?auto_75578 ?auto_75576 ) ) ( not ( = ?auto_75578 ?auto_75575 ) ) ( not ( = ?auto_75573 ?auto_75579 ) ) ( not ( = ?auto_75573 ?auto_75578 ) ) ( not ( = ?auto_75574 ?auto_75579 ) ) ( not ( = ?auto_75574 ?auto_75578 ) ) ( HOLDING ?auto_75574 ) ( CLEAR ?auto_75573 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75573 ?auto_75574 )
      ( MAKE-4PILE ?auto_75573 ?auto_75574 ?auto_75575 ?auto_75576 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75580 - BLOCK
      ?auto_75581 - BLOCK
      ?auto_75582 - BLOCK
      ?auto_75583 - BLOCK
    )
    :vars
    (
      ?auto_75584 - BLOCK
      ?auto_75586 - BLOCK
      ?auto_75585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75580 ) ( not ( = ?auto_75580 ?auto_75581 ) ) ( not ( = ?auto_75580 ?auto_75582 ) ) ( not ( = ?auto_75580 ?auto_75583 ) ) ( not ( = ?auto_75581 ?auto_75582 ) ) ( not ( = ?auto_75581 ?auto_75583 ) ) ( not ( = ?auto_75582 ?auto_75583 ) ) ( ON ?auto_75583 ?auto_75584 ) ( not ( = ?auto_75580 ?auto_75584 ) ) ( not ( = ?auto_75581 ?auto_75584 ) ) ( not ( = ?auto_75582 ?auto_75584 ) ) ( not ( = ?auto_75583 ?auto_75584 ) ) ( ON ?auto_75582 ?auto_75583 ) ( ON-TABLE ?auto_75586 ) ( ON ?auto_75585 ?auto_75586 ) ( ON ?auto_75584 ?auto_75585 ) ( not ( = ?auto_75586 ?auto_75585 ) ) ( not ( = ?auto_75586 ?auto_75584 ) ) ( not ( = ?auto_75586 ?auto_75583 ) ) ( not ( = ?auto_75586 ?auto_75582 ) ) ( not ( = ?auto_75585 ?auto_75584 ) ) ( not ( = ?auto_75585 ?auto_75583 ) ) ( not ( = ?auto_75585 ?auto_75582 ) ) ( not ( = ?auto_75580 ?auto_75586 ) ) ( not ( = ?auto_75580 ?auto_75585 ) ) ( not ( = ?auto_75581 ?auto_75586 ) ) ( not ( = ?auto_75581 ?auto_75585 ) ) ( CLEAR ?auto_75580 ) ( ON ?auto_75581 ?auto_75582 ) ( CLEAR ?auto_75581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75586 ?auto_75585 ?auto_75584 ?auto_75583 ?auto_75582 )
      ( MAKE-4PILE ?auto_75580 ?auto_75581 ?auto_75582 ?auto_75583 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75587 - BLOCK
      ?auto_75588 - BLOCK
      ?auto_75589 - BLOCK
      ?auto_75590 - BLOCK
    )
    :vars
    (
      ?auto_75593 - BLOCK
      ?auto_75592 - BLOCK
      ?auto_75591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75587 ?auto_75588 ) ) ( not ( = ?auto_75587 ?auto_75589 ) ) ( not ( = ?auto_75587 ?auto_75590 ) ) ( not ( = ?auto_75588 ?auto_75589 ) ) ( not ( = ?auto_75588 ?auto_75590 ) ) ( not ( = ?auto_75589 ?auto_75590 ) ) ( ON ?auto_75590 ?auto_75593 ) ( not ( = ?auto_75587 ?auto_75593 ) ) ( not ( = ?auto_75588 ?auto_75593 ) ) ( not ( = ?auto_75589 ?auto_75593 ) ) ( not ( = ?auto_75590 ?auto_75593 ) ) ( ON ?auto_75589 ?auto_75590 ) ( ON-TABLE ?auto_75592 ) ( ON ?auto_75591 ?auto_75592 ) ( ON ?auto_75593 ?auto_75591 ) ( not ( = ?auto_75592 ?auto_75591 ) ) ( not ( = ?auto_75592 ?auto_75593 ) ) ( not ( = ?auto_75592 ?auto_75590 ) ) ( not ( = ?auto_75592 ?auto_75589 ) ) ( not ( = ?auto_75591 ?auto_75593 ) ) ( not ( = ?auto_75591 ?auto_75590 ) ) ( not ( = ?auto_75591 ?auto_75589 ) ) ( not ( = ?auto_75587 ?auto_75592 ) ) ( not ( = ?auto_75587 ?auto_75591 ) ) ( not ( = ?auto_75588 ?auto_75592 ) ) ( not ( = ?auto_75588 ?auto_75591 ) ) ( ON ?auto_75588 ?auto_75589 ) ( CLEAR ?auto_75588 ) ( HOLDING ?auto_75587 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75587 )
      ( MAKE-4PILE ?auto_75587 ?auto_75588 ?auto_75589 ?auto_75590 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75594 - BLOCK
      ?auto_75595 - BLOCK
      ?auto_75596 - BLOCK
      ?auto_75597 - BLOCK
    )
    :vars
    (
      ?auto_75600 - BLOCK
      ?auto_75598 - BLOCK
      ?auto_75599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75594 ?auto_75595 ) ) ( not ( = ?auto_75594 ?auto_75596 ) ) ( not ( = ?auto_75594 ?auto_75597 ) ) ( not ( = ?auto_75595 ?auto_75596 ) ) ( not ( = ?auto_75595 ?auto_75597 ) ) ( not ( = ?auto_75596 ?auto_75597 ) ) ( ON ?auto_75597 ?auto_75600 ) ( not ( = ?auto_75594 ?auto_75600 ) ) ( not ( = ?auto_75595 ?auto_75600 ) ) ( not ( = ?auto_75596 ?auto_75600 ) ) ( not ( = ?auto_75597 ?auto_75600 ) ) ( ON ?auto_75596 ?auto_75597 ) ( ON-TABLE ?auto_75598 ) ( ON ?auto_75599 ?auto_75598 ) ( ON ?auto_75600 ?auto_75599 ) ( not ( = ?auto_75598 ?auto_75599 ) ) ( not ( = ?auto_75598 ?auto_75600 ) ) ( not ( = ?auto_75598 ?auto_75597 ) ) ( not ( = ?auto_75598 ?auto_75596 ) ) ( not ( = ?auto_75599 ?auto_75600 ) ) ( not ( = ?auto_75599 ?auto_75597 ) ) ( not ( = ?auto_75599 ?auto_75596 ) ) ( not ( = ?auto_75594 ?auto_75598 ) ) ( not ( = ?auto_75594 ?auto_75599 ) ) ( not ( = ?auto_75595 ?auto_75598 ) ) ( not ( = ?auto_75595 ?auto_75599 ) ) ( ON ?auto_75595 ?auto_75596 ) ( ON ?auto_75594 ?auto_75595 ) ( CLEAR ?auto_75594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75598 ?auto_75599 ?auto_75600 ?auto_75597 ?auto_75596 ?auto_75595 )
      ( MAKE-4PILE ?auto_75594 ?auto_75595 ?auto_75596 ?auto_75597 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75605 - BLOCK
      ?auto_75606 - BLOCK
      ?auto_75607 - BLOCK
      ?auto_75608 - BLOCK
    )
    :vars
    (
      ?auto_75611 - BLOCK
      ?auto_75610 - BLOCK
      ?auto_75609 - BLOCK
      ?auto_75612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75605 ?auto_75606 ) ) ( not ( = ?auto_75605 ?auto_75607 ) ) ( not ( = ?auto_75605 ?auto_75608 ) ) ( not ( = ?auto_75606 ?auto_75607 ) ) ( not ( = ?auto_75606 ?auto_75608 ) ) ( not ( = ?auto_75607 ?auto_75608 ) ) ( ON ?auto_75608 ?auto_75611 ) ( not ( = ?auto_75605 ?auto_75611 ) ) ( not ( = ?auto_75606 ?auto_75611 ) ) ( not ( = ?auto_75607 ?auto_75611 ) ) ( not ( = ?auto_75608 ?auto_75611 ) ) ( ON ?auto_75607 ?auto_75608 ) ( ON-TABLE ?auto_75610 ) ( ON ?auto_75609 ?auto_75610 ) ( ON ?auto_75611 ?auto_75609 ) ( not ( = ?auto_75610 ?auto_75609 ) ) ( not ( = ?auto_75610 ?auto_75611 ) ) ( not ( = ?auto_75610 ?auto_75608 ) ) ( not ( = ?auto_75610 ?auto_75607 ) ) ( not ( = ?auto_75609 ?auto_75611 ) ) ( not ( = ?auto_75609 ?auto_75608 ) ) ( not ( = ?auto_75609 ?auto_75607 ) ) ( not ( = ?auto_75605 ?auto_75610 ) ) ( not ( = ?auto_75605 ?auto_75609 ) ) ( not ( = ?auto_75606 ?auto_75610 ) ) ( not ( = ?auto_75606 ?auto_75609 ) ) ( ON ?auto_75606 ?auto_75607 ) ( CLEAR ?auto_75606 ) ( ON ?auto_75605 ?auto_75612 ) ( CLEAR ?auto_75605 ) ( HAND-EMPTY ) ( not ( = ?auto_75605 ?auto_75612 ) ) ( not ( = ?auto_75606 ?auto_75612 ) ) ( not ( = ?auto_75607 ?auto_75612 ) ) ( not ( = ?auto_75608 ?auto_75612 ) ) ( not ( = ?auto_75611 ?auto_75612 ) ) ( not ( = ?auto_75610 ?auto_75612 ) ) ( not ( = ?auto_75609 ?auto_75612 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75605 ?auto_75612 )
      ( MAKE-4PILE ?auto_75605 ?auto_75606 ?auto_75607 ?auto_75608 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75613 - BLOCK
      ?auto_75614 - BLOCK
      ?auto_75615 - BLOCK
      ?auto_75616 - BLOCK
    )
    :vars
    (
      ?auto_75620 - BLOCK
      ?auto_75618 - BLOCK
      ?auto_75619 - BLOCK
      ?auto_75617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75613 ?auto_75614 ) ) ( not ( = ?auto_75613 ?auto_75615 ) ) ( not ( = ?auto_75613 ?auto_75616 ) ) ( not ( = ?auto_75614 ?auto_75615 ) ) ( not ( = ?auto_75614 ?auto_75616 ) ) ( not ( = ?auto_75615 ?auto_75616 ) ) ( ON ?auto_75616 ?auto_75620 ) ( not ( = ?auto_75613 ?auto_75620 ) ) ( not ( = ?auto_75614 ?auto_75620 ) ) ( not ( = ?auto_75615 ?auto_75620 ) ) ( not ( = ?auto_75616 ?auto_75620 ) ) ( ON ?auto_75615 ?auto_75616 ) ( ON-TABLE ?auto_75618 ) ( ON ?auto_75619 ?auto_75618 ) ( ON ?auto_75620 ?auto_75619 ) ( not ( = ?auto_75618 ?auto_75619 ) ) ( not ( = ?auto_75618 ?auto_75620 ) ) ( not ( = ?auto_75618 ?auto_75616 ) ) ( not ( = ?auto_75618 ?auto_75615 ) ) ( not ( = ?auto_75619 ?auto_75620 ) ) ( not ( = ?auto_75619 ?auto_75616 ) ) ( not ( = ?auto_75619 ?auto_75615 ) ) ( not ( = ?auto_75613 ?auto_75618 ) ) ( not ( = ?auto_75613 ?auto_75619 ) ) ( not ( = ?auto_75614 ?auto_75618 ) ) ( not ( = ?auto_75614 ?auto_75619 ) ) ( ON ?auto_75613 ?auto_75617 ) ( CLEAR ?auto_75613 ) ( not ( = ?auto_75613 ?auto_75617 ) ) ( not ( = ?auto_75614 ?auto_75617 ) ) ( not ( = ?auto_75615 ?auto_75617 ) ) ( not ( = ?auto_75616 ?auto_75617 ) ) ( not ( = ?auto_75620 ?auto_75617 ) ) ( not ( = ?auto_75618 ?auto_75617 ) ) ( not ( = ?auto_75619 ?auto_75617 ) ) ( HOLDING ?auto_75614 ) ( CLEAR ?auto_75615 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75618 ?auto_75619 ?auto_75620 ?auto_75616 ?auto_75615 ?auto_75614 )
      ( MAKE-4PILE ?auto_75613 ?auto_75614 ?auto_75615 ?auto_75616 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75621 - BLOCK
      ?auto_75622 - BLOCK
      ?auto_75623 - BLOCK
      ?auto_75624 - BLOCK
    )
    :vars
    (
      ?auto_75626 - BLOCK
      ?auto_75627 - BLOCK
      ?auto_75628 - BLOCK
      ?auto_75625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75621 ?auto_75622 ) ) ( not ( = ?auto_75621 ?auto_75623 ) ) ( not ( = ?auto_75621 ?auto_75624 ) ) ( not ( = ?auto_75622 ?auto_75623 ) ) ( not ( = ?auto_75622 ?auto_75624 ) ) ( not ( = ?auto_75623 ?auto_75624 ) ) ( ON ?auto_75624 ?auto_75626 ) ( not ( = ?auto_75621 ?auto_75626 ) ) ( not ( = ?auto_75622 ?auto_75626 ) ) ( not ( = ?auto_75623 ?auto_75626 ) ) ( not ( = ?auto_75624 ?auto_75626 ) ) ( ON ?auto_75623 ?auto_75624 ) ( ON-TABLE ?auto_75627 ) ( ON ?auto_75628 ?auto_75627 ) ( ON ?auto_75626 ?auto_75628 ) ( not ( = ?auto_75627 ?auto_75628 ) ) ( not ( = ?auto_75627 ?auto_75626 ) ) ( not ( = ?auto_75627 ?auto_75624 ) ) ( not ( = ?auto_75627 ?auto_75623 ) ) ( not ( = ?auto_75628 ?auto_75626 ) ) ( not ( = ?auto_75628 ?auto_75624 ) ) ( not ( = ?auto_75628 ?auto_75623 ) ) ( not ( = ?auto_75621 ?auto_75627 ) ) ( not ( = ?auto_75621 ?auto_75628 ) ) ( not ( = ?auto_75622 ?auto_75627 ) ) ( not ( = ?auto_75622 ?auto_75628 ) ) ( ON ?auto_75621 ?auto_75625 ) ( not ( = ?auto_75621 ?auto_75625 ) ) ( not ( = ?auto_75622 ?auto_75625 ) ) ( not ( = ?auto_75623 ?auto_75625 ) ) ( not ( = ?auto_75624 ?auto_75625 ) ) ( not ( = ?auto_75626 ?auto_75625 ) ) ( not ( = ?auto_75627 ?auto_75625 ) ) ( not ( = ?auto_75628 ?auto_75625 ) ) ( CLEAR ?auto_75623 ) ( ON ?auto_75622 ?auto_75621 ) ( CLEAR ?auto_75622 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75625 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75625 ?auto_75621 )
      ( MAKE-4PILE ?auto_75621 ?auto_75622 ?auto_75623 ?auto_75624 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75629 - BLOCK
      ?auto_75630 - BLOCK
      ?auto_75631 - BLOCK
      ?auto_75632 - BLOCK
    )
    :vars
    (
      ?auto_75636 - BLOCK
      ?auto_75634 - BLOCK
      ?auto_75635 - BLOCK
      ?auto_75633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75629 ?auto_75630 ) ) ( not ( = ?auto_75629 ?auto_75631 ) ) ( not ( = ?auto_75629 ?auto_75632 ) ) ( not ( = ?auto_75630 ?auto_75631 ) ) ( not ( = ?auto_75630 ?auto_75632 ) ) ( not ( = ?auto_75631 ?auto_75632 ) ) ( ON ?auto_75632 ?auto_75636 ) ( not ( = ?auto_75629 ?auto_75636 ) ) ( not ( = ?auto_75630 ?auto_75636 ) ) ( not ( = ?auto_75631 ?auto_75636 ) ) ( not ( = ?auto_75632 ?auto_75636 ) ) ( ON-TABLE ?auto_75634 ) ( ON ?auto_75635 ?auto_75634 ) ( ON ?auto_75636 ?auto_75635 ) ( not ( = ?auto_75634 ?auto_75635 ) ) ( not ( = ?auto_75634 ?auto_75636 ) ) ( not ( = ?auto_75634 ?auto_75632 ) ) ( not ( = ?auto_75634 ?auto_75631 ) ) ( not ( = ?auto_75635 ?auto_75636 ) ) ( not ( = ?auto_75635 ?auto_75632 ) ) ( not ( = ?auto_75635 ?auto_75631 ) ) ( not ( = ?auto_75629 ?auto_75634 ) ) ( not ( = ?auto_75629 ?auto_75635 ) ) ( not ( = ?auto_75630 ?auto_75634 ) ) ( not ( = ?auto_75630 ?auto_75635 ) ) ( ON ?auto_75629 ?auto_75633 ) ( not ( = ?auto_75629 ?auto_75633 ) ) ( not ( = ?auto_75630 ?auto_75633 ) ) ( not ( = ?auto_75631 ?auto_75633 ) ) ( not ( = ?auto_75632 ?auto_75633 ) ) ( not ( = ?auto_75636 ?auto_75633 ) ) ( not ( = ?auto_75634 ?auto_75633 ) ) ( not ( = ?auto_75635 ?auto_75633 ) ) ( ON ?auto_75630 ?auto_75629 ) ( CLEAR ?auto_75630 ) ( ON-TABLE ?auto_75633 ) ( HOLDING ?auto_75631 ) ( CLEAR ?auto_75632 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75634 ?auto_75635 ?auto_75636 ?auto_75632 ?auto_75631 )
      ( MAKE-4PILE ?auto_75629 ?auto_75630 ?auto_75631 ?auto_75632 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75637 - BLOCK
      ?auto_75638 - BLOCK
      ?auto_75639 - BLOCK
      ?auto_75640 - BLOCK
    )
    :vars
    (
      ?auto_75642 - BLOCK
      ?auto_75643 - BLOCK
      ?auto_75644 - BLOCK
      ?auto_75641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75637 ?auto_75638 ) ) ( not ( = ?auto_75637 ?auto_75639 ) ) ( not ( = ?auto_75637 ?auto_75640 ) ) ( not ( = ?auto_75638 ?auto_75639 ) ) ( not ( = ?auto_75638 ?auto_75640 ) ) ( not ( = ?auto_75639 ?auto_75640 ) ) ( ON ?auto_75640 ?auto_75642 ) ( not ( = ?auto_75637 ?auto_75642 ) ) ( not ( = ?auto_75638 ?auto_75642 ) ) ( not ( = ?auto_75639 ?auto_75642 ) ) ( not ( = ?auto_75640 ?auto_75642 ) ) ( ON-TABLE ?auto_75643 ) ( ON ?auto_75644 ?auto_75643 ) ( ON ?auto_75642 ?auto_75644 ) ( not ( = ?auto_75643 ?auto_75644 ) ) ( not ( = ?auto_75643 ?auto_75642 ) ) ( not ( = ?auto_75643 ?auto_75640 ) ) ( not ( = ?auto_75643 ?auto_75639 ) ) ( not ( = ?auto_75644 ?auto_75642 ) ) ( not ( = ?auto_75644 ?auto_75640 ) ) ( not ( = ?auto_75644 ?auto_75639 ) ) ( not ( = ?auto_75637 ?auto_75643 ) ) ( not ( = ?auto_75637 ?auto_75644 ) ) ( not ( = ?auto_75638 ?auto_75643 ) ) ( not ( = ?auto_75638 ?auto_75644 ) ) ( ON ?auto_75637 ?auto_75641 ) ( not ( = ?auto_75637 ?auto_75641 ) ) ( not ( = ?auto_75638 ?auto_75641 ) ) ( not ( = ?auto_75639 ?auto_75641 ) ) ( not ( = ?auto_75640 ?auto_75641 ) ) ( not ( = ?auto_75642 ?auto_75641 ) ) ( not ( = ?auto_75643 ?auto_75641 ) ) ( not ( = ?auto_75644 ?auto_75641 ) ) ( ON ?auto_75638 ?auto_75637 ) ( ON-TABLE ?auto_75641 ) ( CLEAR ?auto_75640 ) ( ON ?auto_75639 ?auto_75638 ) ( CLEAR ?auto_75639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75641 ?auto_75637 ?auto_75638 )
      ( MAKE-4PILE ?auto_75637 ?auto_75638 ?auto_75639 ?auto_75640 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75645 - BLOCK
      ?auto_75646 - BLOCK
      ?auto_75647 - BLOCK
      ?auto_75648 - BLOCK
    )
    :vars
    (
      ?auto_75650 - BLOCK
      ?auto_75652 - BLOCK
      ?auto_75651 - BLOCK
      ?auto_75649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75645 ?auto_75646 ) ) ( not ( = ?auto_75645 ?auto_75647 ) ) ( not ( = ?auto_75645 ?auto_75648 ) ) ( not ( = ?auto_75646 ?auto_75647 ) ) ( not ( = ?auto_75646 ?auto_75648 ) ) ( not ( = ?auto_75647 ?auto_75648 ) ) ( not ( = ?auto_75645 ?auto_75650 ) ) ( not ( = ?auto_75646 ?auto_75650 ) ) ( not ( = ?auto_75647 ?auto_75650 ) ) ( not ( = ?auto_75648 ?auto_75650 ) ) ( ON-TABLE ?auto_75652 ) ( ON ?auto_75651 ?auto_75652 ) ( ON ?auto_75650 ?auto_75651 ) ( not ( = ?auto_75652 ?auto_75651 ) ) ( not ( = ?auto_75652 ?auto_75650 ) ) ( not ( = ?auto_75652 ?auto_75648 ) ) ( not ( = ?auto_75652 ?auto_75647 ) ) ( not ( = ?auto_75651 ?auto_75650 ) ) ( not ( = ?auto_75651 ?auto_75648 ) ) ( not ( = ?auto_75651 ?auto_75647 ) ) ( not ( = ?auto_75645 ?auto_75652 ) ) ( not ( = ?auto_75645 ?auto_75651 ) ) ( not ( = ?auto_75646 ?auto_75652 ) ) ( not ( = ?auto_75646 ?auto_75651 ) ) ( ON ?auto_75645 ?auto_75649 ) ( not ( = ?auto_75645 ?auto_75649 ) ) ( not ( = ?auto_75646 ?auto_75649 ) ) ( not ( = ?auto_75647 ?auto_75649 ) ) ( not ( = ?auto_75648 ?auto_75649 ) ) ( not ( = ?auto_75650 ?auto_75649 ) ) ( not ( = ?auto_75652 ?auto_75649 ) ) ( not ( = ?auto_75651 ?auto_75649 ) ) ( ON ?auto_75646 ?auto_75645 ) ( ON-TABLE ?auto_75649 ) ( ON ?auto_75647 ?auto_75646 ) ( CLEAR ?auto_75647 ) ( HOLDING ?auto_75648 ) ( CLEAR ?auto_75650 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75652 ?auto_75651 ?auto_75650 ?auto_75648 )
      ( MAKE-4PILE ?auto_75645 ?auto_75646 ?auto_75647 ?auto_75648 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75653 - BLOCK
      ?auto_75654 - BLOCK
      ?auto_75655 - BLOCK
      ?auto_75656 - BLOCK
    )
    :vars
    (
      ?auto_75657 - BLOCK
      ?auto_75660 - BLOCK
      ?auto_75658 - BLOCK
      ?auto_75659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75653 ?auto_75654 ) ) ( not ( = ?auto_75653 ?auto_75655 ) ) ( not ( = ?auto_75653 ?auto_75656 ) ) ( not ( = ?auto_75654 ?auto_75655 ) ) ( not ( = ?auto_75654 ?auto_75656 ) ) ( not ( = ?auto_75655 ?auto_75656 ) ) ( not ( = ?auto_75653 ?auto_75657 ) ) ( not ( = ?auto_75654 ?auto_75657 ) ) ( not ( = ?auto_75655 ?auto_75657 ) ) ( not ( = ?auto_75656 ?auto_75657 ) ) ( ON-TABLE ?auto_75660 ) ( ON ?auto_75658 ?auto_75660 ) ( ON ?auto_75657 ?auto_75658 ) ( not ( = ?auto_75660 ?auto_75658 ) ) ( not ( = ?auto_75660 ?auto_75657 ) ) ( not ( = ?auto_75660 ?auto_75656 ) ) ( not ( = ?auto_75660 ?auto_75655 ) ) ( not ( = ?auto_75658 ?auto_75657 ) ) ( not ( = ?auto_75658 ?auto_75656 ) ) ( not ( = ?auto_75658 ?auto_75655 ) ) ( not ( = ?auto_75653 ?auto_75660 ) ) ( not ( = ?auto_75653 ?auto_75658 ) ) ( not ( = ?auto_75654 ?auto_75660 ) ) ( not ( = ?auto_75654 ?auto_75658 ) ) ( ON ?auto_75653 ?auto_75659 ) ( not ( = ?auto_75653 ?auto_75659 ) ) ( not ( = ?auto_75654 ?auto_75659 ) ) ( not ( = ?auto_75655 ?auto_75659 ) ) ( not ( = ?auto_75656 ?auto_75659 ) ) ( not ( = ?auto_75657 ?auto_75659 ) ) ( not ( = ?auto_75660 ?auto_75659 ) ) ( not ( = ?auto_75658 ?auto_75659 ) ) ( ON ?auto_75654 ?auto_75653 ) ( ON-TABLE ?auto_75659 ) ( ON ?auto_75655 ?auto_75654 ) ( CLEAR ?auto_75657 ) ( ON ?auto_75656 ?auto_75655 ) ( CLEAR ?auto_75656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75659 ?auto_75653 ?auto_75654 ?auto_75655 )
      ( MAKE-4PILE ?auto_75653 ?auto_75654 ?auto_75655 ?auto_75656 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75661 - BLOCK
      ?auto_75662 - BLOCK
      ?auto_75663 - BLOCK
      ?auto_75664 - BLOCK
    )
    :vars
    (
      ?auto_75666 - BLOCK
      ?auto_75665 - BLOCK
      ?auto_75668 - BLOCK
      ?auto_75667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75661 ?auto_75662 ) ) ( not ( = ?auto_75661 ?auto_75663 ) ) ( not ( = ?auto_75661 ?auto_75664 ) ) ( not ( = ?auto_75662 ?auto_75663 ) ) ( not ( = ?auto_75662 ?auto_75664 ) ) ( not ( = ?auto_75663 ?auto_75664 ) ) ( not ( = ?auto_75661 ?auto_75666 ) ) ( not ( = ?auto_75662 ?auto_75666 ) ) ( not ( = ?auto_75663 ?auto_75666 ) ) ( not ( = ?auto_75664 ?auto_75666 ) ) ( ON-TABLE ?auto_75665 ) ( ON ?auto_75668 ?auto_75665 ) ( not ( = ?auto_75665 ?auto_75668 ) ) ( not ( = ?auto_75665 ?auto_75666 ) ) ( not ( = ?auto_75665 ?auto_75664 ) ) ( not ( = ?auto_75665 ?auto_75663 ) ) ( not ( = ?auto_75668 ?auto_75666 ) ) ( not ( = ?auto_75668 ?auto_75664 ) ) ( not ( = ?auto_75668 ?auto_75663 ) ) ( not ( = ?auto_75661 ?auto_75665 ) ) ( not ( = ?auto_75661 ?auto_75668 ) ) ( not ( = ?auto_75662 ?auto_75665 ) ) ( not ( = ?auto_75662 ?auto_75668 ) ) ( ON ?auto_75661 ?auto_75667 ) ( not ( = ?auto_75661 ?auto_75667 ) ) ( not ( = ?auto_75662 ?auto_75667 ) ) ( not ( = ?auto_75663 ?auto_75667 ) ) ( not ( = ?auto_75664 ?auto_75667 ) ) ( not ( = ?auto_75666 ?auto_75667 ) ) ( not ( = ?auto_75665 ?auto_75667 ) ) ( not ( = ?auto_75668 ?auto_75667 ) ) ( ON ?auto_75662 ?auto_75661 ) ( ON-TABLE ?auto_75667 ) ( ON ?auto_75663 ?auto_75662 ) ( ON ?auto_75664 ?auto_75663 ) ( CLEAR ?auto_75664 ) ( HOLDING ?auto_75666 ) ( CLEAR ?auto_75668 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75665 ?auto_75668 ?auto_75666 )
      ( MAKE-4PILE ?auto_75661 ?auto_75662 ?auto_75663 ?auto_75664 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75669 - BLOCK
      ?auto_75670 - BLOCK
      ?auto_75671 - BLOCK
      ?auto_75672 - BLOCK
    )
    :vars
    (
      ?auto_75676 - BLOCK
      ?auto_75673 - BLOCK
      ?auto_75674 - BLOCK
      ?auto_75675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75669 ?auto_75670 ) ) ( not ( = ?auto_75669 ?auto_75671 ) ) ( not ( = ?auto_75669 ?auto_75672 ) ) ( not ( = ?auto_75670 ?auto_75671 ) ) ( not ( = ?auto_75670 ?auto_75672 ) ) ( not ( = ?auto_75671 ?auto_75672 ) ) ( not ( = ?auto_75669 ?auto_75676 ) ) ( not ( = ?auto_75670 ?auto_75676 ) ) ( not ( = ?auto_75671 ?auto_75676 ) ) ( not ( = ?auto_75672 ?auto_75676 ) ) ( ON-TABLE ?auto_75673 ) ( ON ?auto_75674 ?auto_75673 ) ( not ( = ?auto_75673 ?auto_75674 ) ) ( not ( = ?auto_75673 ?auto_75676 ) ) ( not ( = ?auto_75673 ?auto_75672 ) ) ( not ( = ?auto_75673 ?auto_75671 ) ) ( not ( = ?auto_75674 ?auto_75676 ) ) ( not ( = ?auto_75674 ?auto_75672 ) ) ( not ( = ?auto_75674 ?auto_75671 ) ) ( not ( = ?auto_75669 ?auto_75673 ) ) ( not ( = ?auto_75669 ?auto_75674 ) ) ( not ( = ?auto_75670 ?auto_75673 ) ) ( not ( = ?auto_75670 ?auto_75674 ) ) ( ON ?auto_75669 ?auto_75675 ) ( not ( = ?auto_75669 ?auto_75675 ) ) ( not ( = ?auto_75670 ?auto_75675 ) ) ( not ( = ?auto_75671 ?auto_75675 ) ) ( not ( = ?auto_75672 ?auto_75675 ) ) ( not ( = ?auto_75676 ?auto_75675 ) ) ( not ( = ?auto_75673 ?auto_75675 ) ) ( not ( = ?auto_75674 ?auto_75675 ) ) ( ON ?auto_75670 ?auto_75669 ) ( ON-TABLE ?auto_75675 ) ( ON ?auto_75671 ?auto_75670 ) ( ON ?auto_75672 ?auto_75671 ) ( CLEAR ?auto_75674 ) ( ON ?auto_75676 ?auto_75672 ) ( CLEAR ?auto_75676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75675 ?auto_75669 ?auto_75670 ?auto_75671 ?auto_75672 )
      ( MAKE-4PILE ?auto_75669 ?auto_75670 ?auto_75671 ?auto_75672 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75677 - BLOCK
      ?auto_75678 - BLOCK
      ?auto_75679 - BLOCK
      ?auto_75680 - BLOCK
    )
    :vars
    (
      ?auto_75682 - BLOCK
      ?auto_75683 - BLOCK
      ?auto_75684 - BLOCK
      ?auto_75681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75677 ?auto_75678 ) ) ( not ( = ?auto_75677 ?auto_75679 ) ) ( not ( = ?auto_75677 ?auto_75680 ) ) ( not ( = ?auto_75678 ?auto_75679 ) ) ( not ( = ?auto_75678 ?auto_75680 ) ) ( not ( = ?auto_75679 ?auto_75680 ) ) ( not ( = ?auto_75677 ?auto_75682 ) ) ( not ( = ?auto_75678 ?auto_75682 ) ) ( not ( = ?auto_75679 ?auto_75682 ) ) ( not ( = ?auto_75680 ?auto_75682 ) ) ( ON-TABLE ?auto_75683 ) ( not ( = ?auto_75683 ?auto_75684 ) ) ( not ( = ?auto_75683 ?auto_75682 ) ) ( not ( = ?auto_75683 ?auto_75680 ) ) ( not ( = ?auto_75683 ?auto_75679 ) ) ( not ( = ?auto_75684 ?auto_75682 ) ) ( not ( = ?auto_75684 ?auto_75680 ) ) ( not ( = ?auto_75684 ?auto_75679 ) ) ( not ( = ?auto_75677 ?auto_75683 ) ) ( not ( = ?auto_75677 ?auto_75684 ) ) ( not ( = ?auto_75678 ?auto_75683 ) ) ( not ( = ?auto_75678 ?auto_75684 ) ) ( ON ?auto_75677 ?auto_75681 ) ( not ( = ?auto_75677 ?auto_75681 ) ) ( not ( = ?auto_75678 ?auto_75681 ) ) ( not ( = ?auto_75679 ?auto_75681 ) ) ( not ( = ?auto_75680 ?auto_75681 ) ) ( not ( = ?auto_75682 ?auto_75681 ) ) ( not ( = ?auto_75683 ?auto_75681 ) ) ( not ( = ?auto_75684 ?auto_75681 ) ) ( ON ?auto_75678 ?auto_75677 ) ( ON-TABLE ?auto_75681 ) ( ON ?auto_75679 ?auto_75678 ) ( ON ?auto_75680 ?auto_75679 ) ( ON ?auto_75682 ?auto_75680 ) ( CLEAR ?auto_75682 ) ( HOLDING ?auto_75684 ) ( CLEAR ?auto_75683 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75683 ?auto_75684 )
      ( MAKE-4PILE ?auto_75677 ?auto_75678 ?auto_75679 ?auto_75680 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75685 - BLOCK
      ?auto_75686 - BLOCK
      ?auto_75687 - BLOCK
      ?auto_75688 - BLOCK
    )
    :vars
    (
      ?auto_75691 - BLOCK
      ?auto_75692 - BLOCK
      ?auto_75690 - BLOCK
      ?auto_75689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75685 ?auto_75686 ) ) ( not ( = ?auto_75685 ?auto_75687 ) ) ( not ( = ?auto_75685 ?auto_75688 ) ) ( not ( = ?auto_75686 ?auto_75687 ) ) ( not ( = ?auto_75686 ?auto_75688 ) ) ( not ( = ?auto_75687 ?auto_75688 ) ) ( not ( = ?auto_75685 ?auto_75691 ) ) ( not ( = ?auto_75686 ?auto_75691 ) ) ( not ( = ?auto_75687 ?auto_75691 ) ) ( not ( = ?auto_75688 ?auto_75691 ) ) ( ON-TABLE ?auto_75692 ) ( not ( = ?auto_75692 ?auto_75690 ) ) ( not ( = ?auto_75692 ?auto_75691 ) ) ( not ( = ?auto_75692 ?auto_75688 ) ) ( not ( = ?auto_75692 ?auto_75687 ) ) ( not ( = ?auto_75690 ?auto_75691 ) ) ( not ( = ?auto_75690 ?auto_75688 ) ) ( not ( = ?auto_75690 ?auto_75687 ) ) ( not ( = ?auto_75685 ?auto_75692 ) ) ( not ( = ?auto_75685 ?auto_75690 ) ) ( not ( = ?auto_75686 ?auto_75692 ) ) ( not ( = ?auto_75686 ?auto_75690 ) ) ( ON ?auto_75685 ?auto_75689 ) ( not ( = ?auto_75685 ?auto_75689 ) ) ( not ( = ?auto_75686 ?auto_75689 ) ) ( not ( = ?auto_75687 ?auto_75689 ) ) ( not ( = ?auto_75688 ?auto_75689 ) ) ( not ( = ?auto_75691 ?auto_75689 ) ) ( not ( = ?auto_75692 ?auto_75689 ) ) ( not ( = ?auto_75690 ?auto_75689 ) ) ( ON ?auto_75686 ?auto_75685 ) ( ON-TABLE ?auto_75689 ) ( ON ?auto_75687 ?auto_75686 ) ( ON ?auto_75688 ?auto_75687 ) ( ON ?auto_75691 ?auto_75688 ) ( CLEAR ?auto_75692 ) ( ON ?auto_75690 ?auto_75691 ) ( CLEAR ?auto_75690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75689 ?auto_75685 ?auto_75686 ?auto_75687 ?auto_75688 ?auto_75691 )
      ( MAKE-4PILE ?auto_75685 ?auto_75686 ?auto_75687 ?auto_75688 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75693 - BLOCK
      ?auto_75694 - BLOCK
      ?auto_75695 - BLOCK
      ?auto_75696 - BLOCK
    )
    :vars
    (
      ?auto_75699 - BLOCK
      ?auto_75700 - BLOCK
      ?auto_75697 - BLOCK
      ?auto_75698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75693 ?auto_75694 ) ) ( not ( = ?auto_75693 ?auto_75695 ) ) ( not ( = ?auto_75693 ?auto_75696 ) ) ( not ( = ?auto_75694 ?auto_75695 ) ) ( not ( = ?auto_75694 ?auto_75696 ) ) ( not ( = ?auto_75695 ?auto_75696 ) ) ( not ( = ?auto_75693 ?auto_75699 ) ) ( not ( = ?auto_75694 ?auto_75699 ) ) ( not ( = ?auto_75695 ?auto_75699 ) ) ( not ( = ?auto_75696 ?auto_75699 ) ) ( not ( = ?auto_75700 ?auto_75697 ) ) ( not ( = ?auto_75700 ?auto_75699 ) ) ( not ( = ?auto_75700 ?auto_75696 ) ) ( not ( = ?auto_75700 ?auto_75695 ) ) ( not ( = ?auto_75697 ?auto_75699 ) ) ( not ( = ?auto_75697 ?auto_75696 ) ) ( not ( = ?auto_75697 ?auto_75695 ) ) ( not ( = ?auto_75693 ?auto_75700 ) ) ( not ( = ?auto_75693 ?auto_75697 ) ) ( not ( = ?auto_75694 ?auto_75700 ) ) ( not ( = ?auto_75694 ?auto_75697 ) ) ( ON ?auto_75693 ?auto_75698 ) ( not ( = ?auto_75693 ?auto_75698 ) ) ( not ( = ?auto_75694 ?auto_75698 ) ) ( not ( = ?auto_75695 ?auto_75698 ) ) ( not ( = ?auto_75696 ?auto_75698 ) ) ( not ( = ?auto_75699 ?auto_75698 ) ) ( not ( = ?auto_75700 ?auto_75698 ) ) ( not ( = ?auto_75697 ?auto_75698 ) ) ( ON ?auto_75694 ?auto_75693 ) ( ON-TABLE ?auto_75698 ) ( ON ?auto_75695 ?auto_75694 ) ( ON ?auto_75696 ?auto_75695 ) ( ON ?auto_75699 ?auto_75696 ) ( ON ?auto_75697 ?auto_75699 ) ( CLEAR ?auto_75697 ) ( HOLDING ?auto_75700 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75700 )
      ( MAKE-4PILE ?auto_75693 ?auto_75694 ?auto_75695 ?auto_75696 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75701 - BLOCK
      ?auto_75702 - BLOCK
      ?auto_75703 - BLOCK
      ?auto_75704 - BLOCK
    )
    :vars
    (
      ?auto_75707 - BLOCK
      ?auto_75706 - BLOCK
      ?auto_75705 - BLOCK
      ?auto_75708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75701 ?auto_75702 ) ) ( not ( = ?auto_75701 ?auto_75703 ) ) ( not ( = ?auto_75701 ?auto_75704 ) ) ( not ( = ?auto_75702 ?auto_75703 ) ) ( not ( = ?auto_75702 ?auto_75704 ) ) ( not ( = ?auto_75703 ?auto_75704 ) ) ( not ( = ?auto_75701 ?auto_75707 ) ) ( not ( = ?auto_75702 ?auto_75707 ) ) ( not ( = ?auto_75703 ?auto_75707 ) ) ( not ( = ?auto_75704 ?auto_75707 ) ) ( not ( = ?auto_75706 ?auto_75705 ) ) ( not ( = ?auto_75706 ?auto_75707 ) ) ( not ( = ?auto_75706 ?auto_75704 ) ) ( not ( = ?auto_75706 ?auto_75703 ) ) ( not ( = ?auto_75705 ?auto_75707 ) ) ( not ( = ?auto_75705 ?auto_75704 ) ) ( not ( = ?auto_75705 ?auto_75703 ) ) ( not ( = ?auto_75701 ?auto_75706 ) ) ( not ( = ?auto_75701 ?auto_75705 ) ) ( not ( = ?auto_75702 ?auto_75706 ) ) ( not ( = ?auto_75702 ?auto_75705 ) ) ( ON ?auto_75701 ?auto_75708 ) ( not ( = ?auto_75701 ?auto_75708 ) ) ( not ( = ?auto_75702 ?auto_75708 ) ) ( not ( = ?auto_75703 ?auto_75708 ) ) ( not ( = ?auto_75704 ?auto_75708 ) ) ( not ( = ?auto_75707 ?auto_75708 ) ) ( not ( = ?auto_75706 ?auto_75708 ) ) ( not ( = ?auto_75705 ?auto_75708 ) ) ( ON ?auto_75702 ?auto_75701 ) ( ON-TABLE ?auto_75708 ) ( ON ?auto_75703 ?auto_75702 ) ( ON ?auto_75704 ?auto_75703 ) ( ON ?auto_75707 ?auto_75704 ) ( ON ?auto_75705 ?auto_75707 ) ( ON ?auto_75706 ?auto_75705 ) ( CLEAR ?auto_75706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_75708 ?auto_75701 ?auto_75702 ?auto_75703 ?auto_75704 ?auto_75707 ?auto_75705 )
      ( MAKE-4PILE ?auto_75701 ?auto_75702 ?auto_75703 ?auto_75704 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75724 - BLOCK
      ?auto_75725 - BLOCK
    )
    :vars
    (
      ?auto_75727 - BLOCK
      ?auto_75728 - BLOCK
      ?auto_75726 - BLOCK
      ?auto_75730 - BLOCK
      ?auto_75729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75727 ?auto_75725 ) ( ON-TABLE ?auto_75724 ) ( ON ?auto_75725 ?auto_75724 ) ( not ( = ?auto_75724 ?auto_75725 ) ) ( not ( = ?auto_75724 ?auto_75727 ) ) ( not ( = ?auto_75725 ?auto_75727 ) ) ( not ( = ?auto_75724 ?auto_75728 ) ) ( not ( = ?auto_75724 ?auto_75726 ) ) ( not ( = ?auto_75725 ?auto_75728 ) ) ( not ( = ?auto_75725 ?auto_75726 ) ) ( not ( = ?auto_75727 ?auto_75728 ) ) ( not ( = ?auto_75727 ?auto_75726 ) ) ( not ( = ?auto_75728 ?auto_75726 ) ) ( ON ?auto_75728 ?auto_75727 ) ( CLEAR ?auto_75728 ) ( HOLDING ?auto_75726 ) ( CLEAR ?auto_75730 ) ( ON-TABLE ?auto_75729 ) ( ON ?auto_75730 ?auto_75729 ) ( not ( = ?auto_75729 ?auto_75730 ) ) ( not ( = ?auto_75729 ?auto_75726 ) ) ( not ( = ?auto_75730 ?auto_75726 ) ) ( not ( = ?auto_75724 ?auto_75730 ) ) ( not ( = ?auto_75724 ?auto_75729 ) ) ( not ( = ?auto_75725 ?auto_75730 ) ) ( not ( = ?auto_75725 ?auto_75729 ) ) ( not ( = ?auto_75727 ?auto_75730 ) ) ( not ( = ?auto_75727 ?auto_75729 ) ) ( not ( = ?auto_75728 ?auto_75730 ) ) ( not ( = ?auto_75728 ?auto_75729 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75729 ?auto_75730 ?auto_75726 )
      ( MAKE-2PILE ?auto_75724 ?auto_75725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75731 - BLOCK
      ?auto_75732 - BLOCK
    )
    :vars
    (
      ?auto_75737 - BLOCK
      ?auto_75734 - BLOCK
      ?auto_75736 - BLOCK
      ?auto_75733 - BLOCK
      ?auto_75735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75737 ?auto_75732 ) ( ON-TABLE ?auto_75731 ) ( ON ?auto_75732 ?auto_75731 ) ( not ( = ?auto_75731 ?auto_75732 ) ) ( not ( = ?auto_75731 ?auto_75737 ) ) ( not ( = ?auto_75732 ?auto_75737 ) ) ( not ( = ?auto_75731 ?auto_75734 ) ) ( not ( = ?auto_75731 ?auto_75736 ) ) ( not ( = ?auto_75732 ?auto_75734 ) ) ( not ( = ?auto_75732 ?auto_75736 ) ) ( not ( = ?auto_75737 ?auto_75734 ) ) ( not ( = ?auto_75737 ?auto_75736 ) ) ( not ( = ?auto_75734 ?auto_75736 ) ) ( ON ?auto_75734 ?auto_75737 ) ( CLEAR ?auto_75733 ) ( ON-TABLE ?auto_75735 ) ( ON ?auto_75733 ?auto_75735 ) ( not ( = ?auto_75735 ?auto_75733 ) ) ( not ( = ?auto_75735 ?auto_75736 ) ) ( not ( = ?auto_75733 ?auto_75736 ) ) ( not ( = ?auto_75731 ?auto_75733 ) ) ( not ( = ?auto_75731 ?auto_75735 ) ) ( not ( = ?auto_75732 ?auto_75733 ) ) ( not ( = ?auto_75732 ?auto_75735 ) ) ( not ( = ?auto_75737 ?auto_75733 ) ) ( not ( = ?auto_75737 ?auto_75735 ) ) ( not ( = ?auto_75734 ?auto_75733 ) ) ( not ( = ?auto_75734 ?auto_75735 ) ) ( ON ?auto_75736 ?auto_75734 ) ( CLEAR ?auto_75736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75731 ?auto_75732 ?auto_75737 ?auto_75734 )
      ( MAKE-2PILE ?auto_75731 ?auto_75732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75738 - BLOCK
      ?auto_75739 - BLOCK
    )
    :vars
    (
      ?auto_75740 - BLOCK
      ?auto_75744 - BLOCK
      ?auto_75742 - BLOCK
      ?auto_75741 - BLOCK
      ?auto_75743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75740 ?auto_75739 ) ( ON-TABLE ?auto_75738 ) ( ON ?auto_75739 ?auto_75738 ) ( not ( = ?auto_75738 ?auto_75739 ) ) ( not ( = ?auto_75738 ?auto_75740 ) ) ( not ( = ?auto_75739 ?auto_75740 ) ) ( not ( = ?auto_75738 ?auto_75744 ) ) ( not ( = ?auto_75738 ?auto_75742 ) ) ( not ( = ?auto_75739 ?auto_75744 ) ) ( not ( = ?auto_75739 ?auto_75742 ) ) ( not ( = ?auto_75740 ?auto_75744 ) ) ( not ( = ?auto_75740 ?auto_75742 ) ) ( not ( = ?auto_75744 ?auto_75742 ) ) ( ON ?auto_75744 ?auto_75740 ) ( ON-TABLE ?auto_75741 ) ( not ( = ?auto_75741 ?auto_75743 ) ) ( not ( = ?auto_75741 ?auto_75742 ) ) ( not ( = ?auto_75743 ?auto_75742 ) ) ( not ( = ?auto_75738 ?auto_75743 ) ) ( not ( = ?auto_75738 ?auto_75741 ) ) ( not ( = ?auto_75739 ?auto_75743 ) ) ( not ( = ?auto_75739 ?auto_75741 ) ) ( not ( = ?auto_75740 ?auto_75743 ) ) ( not ( = ?auto_75740 ?auto_75741 ) ) ( not ( = ?auto_75744 ?auto_75743 ) ) ( not ( = ?auto_75744 ?auto_75741 ) ) ( ON ?auto_75742 ?auto_75744 ) ( CLEAR ?auto_75742 ) ( HOLDING ?auto_75743 ) ( CLEAR ?auto_75741 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75741 ?auto_75743 )
      ( MAKE-2PILE ?auto_75738 ?auto_75739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75745 - BLOCK
      ?auto_75746 - BLOCK
    )
    :vars
    (
      ?auto_75748 - BLOCK
      ?auto_75751 - BLOCK
      ?auto_75747 - BLOCK
      ?auto_75750 - BLOCK
      ?auto_75749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75748 ?auto_75746 ) ( ON-TABLE ?auto_75745 ) ( ON ?auto_75746 ?auto_75745 ) ( not ( = ?auto_75745 ?auto_75746 ) ) ( not ( = ?auto_75745 ?auto_75748 ) ) ( not ( = ?auto_75746 ?auto_75748 ) ) ( not ( = ?auto_75745 ?auto_75751 ) ) ( not ( = ?auto_75745 ?auto_75747 ) ) ( not ( = ?auto_75746 ?auto_75751 ) ) ( not ( = ?auto_75746 ?auto_75747 ) ) ( not ( = ?auto_75748 ?auto_75751 ) ) ( not ( = ?auto_75748 ?auto_75747 ) ) ( not ( = ?auto_75751 ?auto_75747 ) ) ( ON ?auto_75751 ?auto_75748 ) ( ON-TABLE ?auto_75750 ) ( not ( = ?auto_75750 ?auto_75749 ) ) ( not ( = ?auto_75750 ?auto_75747 ) ) ( not ( = ?auto_75749 ?auto_75747 ) ) ( not ( = ?auto_75745 ?auto_75749 ) ) ( not ( = ?auto_75745 ?auto_75750 ) ) ( not ( = ?auto_75746 ?auto_75749 ) ) ( not ( = ?auto_75746 ?auto_75750 ) ) ( not ( = ?auto_75748 ?auto_75749 ) ) ( not ( = ?auto_75748 ?auto_75750 ) ) ( not ( = ?auto_75751 ?auto_75749 ) ) ( not ( = ?auto_75751 ?auto_75750 ) ) ( ON ?auto_75747 ?auto_75751 ) ( CLEAR ?auto_75750 ) ( ON ?auto_75749 ?auto_75747 ) ( CLEAR ?auto_75749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75745 ?auto_75746 ?auto_75748 ?auto_75751 ?auto_75747 )
      ( MAKE-2PILE ?auto_75745 ?auto_75746 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75752 - BLOCK
      ?auto_75753 - BLOCK
    )
    :vars
    (
      ?auto_75755 - BLOCK
      ?auto_75758 - BLOCK
      ?auto_75757 - BLOCK
      ?auto_75756 - BLOCK
      ?auto_75754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75755 ?auto_75753 ) ( ON-TABLE ?auto_75752 ) ( ON ?auto_75753 ?auto_75752 ) ( not ( = ?auto_75752 ?auto_75753 ) ) ( not ( = ?auto_75752 ?auto_75755 ) ) ( not ( = ?auto_75753 ?auto_75755 ) ) ( not ( = ?auto_75752 ?auto_75758 ) ) ( not ( = ?auto_75752 ?auto_75757 ) ) ( not ( = ?auto_75753 ?auto_75758 ) ) ( not ( = ?auto_75753 ?auto_75757 ) ) ( not ( = ?auto_75755 ?auto_75758 ) ) ( not ( = ?auto_75755 ?auto_75757 ) ) ( not ( = ?auto_75758 ?auto_75757 ) ) ( ON ?auto_75758 ?auto_75755 ) ( not ( = ?auto_75756 ?auto_75754 ) ) ( not ( = ?auto_75756 ?auto_75757 ) ) ( not ( = ?auto_75754 ?auto_75757 ) ) ( not ( = ?auto_75752 ?auto_75754 ) ) ( not ( = ?auto_75752 ?auto_75756 ) ) ( not ( = ?auto_75753 ?auto_75754 ) ) ( not ( = ?auto_75753 ?auto_75756 ) ) ( not ( = ?auto_75755 ?auto_75754 ) ) ( not ( = ?auto_75755 ?auto_75756 ) ) ( not ( = ?auto_75758 ?auto_75754 ) ) ( not ( = ?auto_75758 ?auto_75756 ) ) ( ON ?auto_75757 ?auto_75758 ) ( ON ?auto_75754 ?auto_75757 ) ( CLEAR ?auto_75754 ) ( HOLDING ?auto_75756 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75756 )
      ( MAKE-2PILE ?auto_75752 ?auto_75753 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75768 - BLOCK
      ?auto_75769 - BLOCK
    )
    :vars
    (
      ?auto_75770 - BLOCK
      ?auto_75773 - BLOCK
      ?auto_75772 - BLOCK
      ?auto_75771 - BLOCK
      ?auto_75774 - BLOCK
      ?auto_75775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75770 ?auto_75769 ) ( ON-TABLE ?auto_75768 ) ( ON ?auto_75769 ?auto_75768 ) ( not ( = ?auto_75768 ?auto_75769 ) ) ( not ( = ?auto_75768 ?auto_75770 ) ) ( not ( = ?auto_75769 ?auto_75770 ) ) ( not ( = ?auto_75768 ?auto_75773 ) ) ( not ( = ?auto_75768 ?auto_75772 ) ) ( not ( = ?auto_75769 ?auto_75773 ) ) ( not ( = ?auto_75769 ?auto_75772 ) ) ( not ( = ?auto_75770 ?auto_75773 ) ) ( not ( = ?auto_75770 ?auto_75772 ) ) ( not ( = ?auto_75773 ?auto_75772 ) ) ( ON ?auto_75773 ?auto_75770 ) ( not ( = ?auto_75771 ?auto_75774 ) ) ( not ( = ?auto_75771 ?auto_75772 ) ) ( not ( = ?auto_75774 ?auto_75772 ) ) ( not ( = ?auto_75768 ?auto_75774 ) ) ( not ( = ?auto_75768 ?auto_75771 ) ) ( not ( = ?auto_75769 ?auto_75774 ) ) ( not ( = ?auto_75769 ?auto_75771 ) ) ( not ( = ?auto_75770 ?auto_75774 ) ) ( not ( = ?auto_75770 ?auto_75771 ) ) ( not ( = ?auto_75773 ?auto_75774 ) ) ( not ( = ?auto_75773 ?auto_75771 ) ) ( ON ?auto_75772 ?auto_75773 ) ( ON ?auto_75774 ?auto_75772 ) ( CLEAR ?auto_75774 ) ( ON ?auto_75771 ?auto_75775 ) ( CLEAR ?auto_75771 ) ( HAND-EMPTY ) ( not ( = ?auto_75768 ?auto_75775 ) ) ( not ( = ?auto_75769 ?auto_75775 ) ) ( not ( = ?auto_75770 ?auto_75775 ) ) ( not ( = ?auto_75773 ?auto_75775 ) ) ( not ( = ?auto_75772 ?auto_75775 ) ) ( not ( = ?auto_75771 ?auto_75775 ) ) ( not ( = ?auto_75774 ?auto_75775 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75771 ?auto_75775 )
      ( MAKE-2PILE ?auto_75768 ?auto_75769 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75776 - BLOCK
      ?auto_75777 - BLOCK
    )
    :vars
    (
      ?auto_75781 - BLOCK
      ?auto_75779 - BLOCK
      ?auto_75783 - BLOCK
      ?auto_75780 - BLOCK
      ?auto_75778 - BLOCK
      ?auto_75782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75781 ?auto_75777 ) ( ON-TABLE ?auto_75776 ) ( ON ?auto_75777 ?auto_75776 ) ( not ( = ?auto_75776 ?auto_75777 ) ) ( not ( = ?auto_75776 ?auto_75781 ) ) ( not ( = ?auto_75777 ?auto_75781 ) ) ( not ( = ?auto_75776 ?auto_75779 ) ) ( not ( = ?auto_75776 ?auto_75783 ) ) ( not ( = ?auto_75777 ?auto_75779 ) ) ( not ( = ?auto_75777 ?auto_75783 ) ) ( not ( = ?auto_75781 ?auto_75779 ) ) ( not ( = ?auto_75781 ?auto_75783 ) ) ( not ( = ?auto_75779 ?auto_75783 ) ) ( ON ?auto_75779 ?auto_75781 ) ( not ( = ?auto_75780 ?auto_75778 ) ) ( not ( = ?auto_75780 ?auto_75783 ) ) ( not ( = ?auto_75778 ?auto_75783 ) ) ( not ( = ?auto_75776 ?auto_75778 ) ) ( not ( = ?auto_75776 ?auto_75780 ) ) ( not ( = ?auto_75777 ?auto_75778 ) ) ( not ( = ?auto_75777 ?auto_75780 ) ) ( not ( = ?auto_75781 ?auto_75778 ) ) ( not ( = ?auto_75781 ?auto_75780 ) ) ( not ( = ?auto_75779 ?auto_75778 ) ) ( not ( = ?auto_75779 ?auto_75780 ) ) ( ON ?auto_75783 ?auto_75779 ) ( ON ?auto_75780 ?auto_75782 ) ( CLEAR ?auto_75780 ) ( not ( = ?auto_75776 ?auto_75782 ) ) ( not ( = ?auto_75777 ?auto_75782 ) ) ( not ( = ?auto_75781 ?auto_75782 ) ) ( not ( = ?auto_75779 ?auto_75782 ) ) ( not ( = ?auto_75783 ?auto_75782 ) ) ( not ( = ?auto_75780 ?auto_75782 ) ) ( not ( = ?auto_75778 ?auto_75782 ) ) ( HOLDING ?auto_75778 ) ( CLEAR ?auto_75783 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75776 ?auto_75777 ?auto_75781 ?auto_75779 ?auto_75783 ?auto_75778 )
      ( MAKE-2PILE ?auto_75776 ?auto_75777 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75784 - BLOCK
      ?auto_75785 - BLOCK
    )
    :vars
    (
      ?auto_75791 - BLOCK
      ?auto_75788 - BLOCK
      ?auto_75790 - BLOCK
      ?auto_75786 - BLOCK
      ?auto_75789 - BLOCK
      ?auto_75787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75791 ?auto_75785 ) ( ON-TABLE ?auto_75784 ) ( ON ?auto_75785 ?auto_75784 ) ( not ( = ?auto_75784 ?auto_75785 ) ) ( not ( = ?auto_75784 ?auto_75791 ) ) ( not ( = ?auto_75785 ?auto_75791 ) ) ( not ( = ?auto_75784 ?auto_75788 ) ) ( not ( = ?auto_75784 ?auto_75790 ) ) ( not ( = ?auto_75785 ?auto_75788 ) ) ( not ( = ?auto_75785 ?auto_75790 ) ) ( not ( = ?auto_75791 ?auto_75788 ) ) ( not ( = ?auto_75791 ?auto_75790 ) ) ( not ( = ?auto_75788 ?auto_75790 ) ) ( ON ?auto_75788 ?auto_75791 ) ( not ( = ?auto_75786 ?auto_75789 ) ) ( not ( = ?auto_75786 ?auto_75790 ) ) ( not ( = ?auto_75789 ?auto_75790 ) ) ( not ( = ?auto_75784 ?auto_75789 ) ) ( not ( = ?auto_75784 ?auto_75786 ) ) ( not ( = ?auto_75785 ?auto_75789 ) ) ( not ( = ?auto_75785 ?auto_75786 ) ) ( not ( = ?auto_75791 ?auto_75789 ) ) ( not ( = ?auto_75791 ?auto_75786 ) ) ( not ( = ?auto_75788 ?auto_75789 ) ) ( not ( = ?auto_75788 ?auto_75786 ) ) ( ON ?auto_75790 ?auto_75788 ) ( ON ?auto_75786 ?auto_75787 ) ( not ( = ?auto_75784 ?auto_75787 ) ) ( not ( = ?auto_75785 ?auto_75787 ) ) ( not ( = ?auto_75791 ?auto_75787 ) ) ( not ( = ?auto_75788 ?auto_75787 ) ) ( not ( = ?auto_75790 ?auto_75787 ) ) ( not ( = ?auto_75786 ?auto_75787 ) ) ( not ( = ?auto_75789 ?auto_75787 ) ) ( CLEAR ?auto_75790 ) ( ON ?auto_75789 ?auto_75786 ) ( CLEAR ?auto_75789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75787 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75787 ?auto_75786 )
      ( MAKE-2PILE ?auto_75784 ?auto_75785 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75792 - BLOCK
      ?auto_75793 - BLOCK
    )
    :vars
    (
      ?auto_75795 - BLOCK
      ?auto_75799 - BLOCK
      ?auto_75794 - BLOCK
      ?auto_75797 - BLOCK
      ?auto_75796 - BLOCK
      ?auto_75798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75795 ?auto_75793 ) ( ON-TABLE ?auto_75792 ) ( ON ?auto_75793 ?auto_75792 ) ( not ( = ?auto_75792 ?auto_75793 ) ) ( not ( = ?auto_75792 ?auto_75795 ) ) ( not ( = ?auto_75793 ?auto_75795 ) ) ( not ( = ?auto_75792 ?auto_75799 ) ) ( not ( = ?auto_75792 ?auto_75794 ) ) ( not ( = ?auto_75793 ?auto_75799 ) ) ( not ( = ?auto_75793 ?auto_75794 ) ) ( not ( = ?auto_75795 ?auto_75799 ) ) ( not ( = ?auto_75795 ?auto_75794 ) ) ( not ( = ?auto_75799 ?auto_75794 ) ) ( ON ?auto_75799 ?auto_75795 ) ( not ( = ?auto_75797 ?auto_75796 ) ) ( not ( = ?auto_75797 ?auto_75794 ) ) ( not ( = ?auto_75796 ?auto_75794 ) ) ( not ( = ?auto_75792 ?auto_75796 ) ) ( not ( = ?auto_75792 ?auto_75797 ) ) ( not ( = ?auto_75793 ?auto_75796 ) ) ( not ( = ?auto_75793 ?auto_75797 ) ) ( not ( = ?auto_75795 ?auto_75796 ) ) ( not ( = ?auto_75795 ?auto_75797 ) ) ( not ( = ?auto_75799 ?auto_75796 ) ) ( not ( = ?auto_75799 ?auto_75797 ) ) ( ON ?auto_75797 ?auto_75798 ) ( not ( = ?auto_75792 ?auto_75798 ) ) ( not ( = ?auto_75793 ?auto_75798 ) ) ( not ( = ?auto_75795 ?auto_75798 ) ) ( not ( = ?auto_75799 ?auto_75798 ) ) ( not ( = ?auto_75794 ?auto_75798 ) ) ( not ( = ?auto_75797 ?auto_75798 ) ) ( not ( = ?auto_75796 ?auto_75798 ) ) ( ON ?auto_75796 ?auto_75797 ) ( CLEAR ?auto_75796 ) ( ON-TABLE ?auto_75798 ) ( HOLDING ?auto_75794 ) ( CLEAR ?auto_75799 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75792 ?auto_75793 ?auto_75795 ?auto_75799 ?auto_75794 )
      ( MAKE-2PILE ?auto_75792 ?auto_75793 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75843 - BLOCK
      ?auto_75844 - BLOCK
      ?auto_75845 - BLOCK
      ?auto_75846 - BLOCK
      ?auto_75847 - BLOCK
    )
    :vars
    (
      ?auto_75848 - BLOCK
      ?auto_75849 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75843 ) ( ON ?auto_75844 ?auto_75843 ) ( ON ?auto_75845 ?auto_75844 ) ( not ( = ?auto_75843 ?auto_75844 ) ) ( not ( = ?auto_75843 ?auto_75845 ) ) ( not ( = ?auto_75843 ?auto_75846 ) ) ( not ( = ?auto_75843 ?auto_75847 ) ) ( not ( = ?auto_75844 ?auto_75845 ) ) ( not ( = ?auto_75844 ?auto_75846 ) ) ( not ( = ?auto_75844 ?auto_75847 ) ) ( not ( = ?auto_75845 ?auto_75846 ) ) ( not ( = ?auto_75845 ?auto_75847 ) ) ( not ( = ?auto_75846 ?auto_75847 ) ) ( ON ?auto_75847 ?auto_75848 ) ( not ( = ?auto_75843 ?auto_75848 ) ) ( not ( = ?auto_75844 ?auto_75848 ) ) ( not ( = ?auto_75845 ?auto_75848 ) ) ( not ( = ?auto_75846 ?auto_75848 ) ) ( not ( = ?auto_75847 ?auto_75848 ) ) ( CLEAR ?auto_75845 ) ( ON ?auto_75846 ?auto_75847 ) ( CLEAR ?auto_75846 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75849 ) ( ON ?auto_75848 ?auto_75849 ) ( not ( = ?auto_75849 ?auto_75848 ) ) ( not ( = ?auto_75849 ?auto_75847 ) ) ( not ( = ?auto_75849 ?auto_75846 ) ) ( not ( = ?auto_75843 ?auto_75849 ) ) ( not ( = ?auto_75844 ?auto_75849 ) ) ( not ( = ?auto_75845 ?auto_75849 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75849 ?auto_75848 ?auto_75847 )
      ( MAKE-5PILE ?auto_75843 ?auto_75844 ?auto_75845 ?auto_75846 ?auto_75847 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75850 - BLOCK
      ?auto_75851 - BLOCK
      ?auto_75852 - BLOCK
      ?auto_75853 - BLOCK
      ?auto_75854 - BLOCK
    )
    :vars
    (
      ?auto_75856 - BLOCK
      ?auto_75855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75850 ) ( ON ?auto_75851 ?auto_75850 ) ( not ( = ?auto_75850 ?auto_75851 ) ) ( not ( = ?auto_75850 ?auto_75852 ) ) ( not ( = ?auto_75850 ?auto_75853 ) ) ( not ( = ?auto_75850 ?auto_75854 ) ) ( not ( = ?auto_75851 ?auto_75852 ) ) ( not ( = ?auto_75851 ?auto_75853 ) ) ( not ( = ?auto_75851 ?auto_75854 ) ) ( not ( = ?auto_75852 ?auto_75853 ) ) ( not ( = ?auto_75852 ?auto_75854 ) ) ( not ( = ?auto_75853 ?auto_75854 ) ) ( ON ?auto_75854 ?auto_75856 ) ( not ( = ?auto_75850 ?auto_75856 ) ) ( not ( = ?auto_75851 ?auto_75856 ) ) ( not ( = ?auto_75852 ?auto_75856 ) ) ( not ( = ?auto_75853 ?auto_75856 ) ) ( not ( = ?auto_75854 ?auto_75856 ) ) ( ON ?auto_75853 ?auto_75854 ) ( CLEAR ?auto_75853 ) ( ON-TABLE ?auto_75855 ) ( ON ?auto_75856 ?auto_75855 ) ( not ( = ?auto_75855 ?auto_75856 ) ) ( not ( = ?auto_75855 ?auto_75854 ) ) ( not ( = ?auto_75855 ?auto_75853 ) ) ( not ( = ?auto_75850 ?auto_75855 ) ) ( not ( = ?auto_75851 ?auto_75855 ) ) ( not ( = ?auto_75852 ?auto_75855 ) ) ( HOLDING ?auto_75852 ) ( CLEAR ?auto_75851 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75850 ?auto_75851 ?auto_75852 )
      ( MAKE-5PILE ?auto_75850 ?auto_75851 ?auto_75852 ?auto_75853 ?auto_75854 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75857 - BLOCK
      ?auto_75858 - BLOCK
      ?auto_75859 - BLOCK
      ?auto_75860 - BLOCK
      ?auto_75861 - BLOCK
    )
    :vars
    (
      ?auto_75862 - BLOCK
      ?auto_75863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75857 ) ( ON ?auto_75858 ?auto_75857 ) ( not ( = ?auto_75857 ?auto_75858 ) ) ( not ( = ?auto_75857 ?auto_75859 ) ) ( not ( = ?auto_75857 ?auto_75860 ) ) ( not ( = ?auto_75857 ?auto_75861 ) ) ( not ( = ?auto_75858 ?auto_75859 ) ) ( not ( = ?auto_75858 ?auto_75860 ) ) ( not ( = ?auto_75858 ?auto_75861 ) ) ( not ( = ?auto_75859 ?auto_75860 ) ) ( not ( = ?auto_75859 ?auto_75861 ) ) ( not ( = ?auto_75860 ?auto_75861 ) ) ( ON ?auto_75861 ?auto_75862 ) ( not ( = ?auto_75857 ?auto_75862 ) ) ( not ( = ?auto_75858 ?auto_75862 ) ) ( not ( = ?auto_75859 ?auto_75862 ) ) ( not ( = ?auto_75860 ?auto_75862 ) ) ( not ( = ?auto_75861 ?auto_75862 ) ) ( ON ?auto_75860 ?auto_75861 ) ( ON-TABLE ?auto_75863 ) ( ON ?auto_75862 ?auto_75863 ) ( not ( = ?auto_75863 ?auto_75862 ) ) ( not ( = ?auto_75863 ?auto_75861 ) ) ( not ( = ?auto_75863 ?auto_75860 ) ) ( not ( = ?auto_75857 ?auto_75863 ) ) ( not ( = ?auto_75858 ?auto_75863 ) ) ( not ( = ?auto_75859 ?auto_75863 ) ) ( CLEAR ?auto_75858 ) ( ON ?auto_75859 ?auto_75860 ) ( CLEAR ?auto_75859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75863 ?auto_75862 ?auto_75861 ?auto_75860 )
      ( MAKE-5PILE ?auto_75857 ?auto_75858 ?auto_75859 ?auto_75860 ?auto_75861 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75864 - BLOCK
      ?auto_75865 - BLOCK
      ?auto_75866 - BLOCK
      ?auto_75867 - BLOCK
      ?auto_75868 - BLOCK
    )
    :vars
    (
      ?auto_75869 - BLOCK
      ?auto_75870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75864 ) ( not ( = ?auto_75864 ?auto_75865 ) ) ( not ( = ?auto_75864 ?auto_75866 ) ) ( not ( = ?auto_75864 ?auto_75867 ) ) ( not ( = ?auto_75864 ?auto_75868 ) ) ( not ( = ?auto_75865 ?auto_75866 ) ) ( not ( = ?auto_75865 ?auto_75867 ) ) ( not ( = ?auto_75865 ?auto_75868 ) ) ( not ( = ?auto_75866 ?auto_75867 ) ) ( not ( = ?auto_75866 ?auto_75868 ) ) ( not ( = ?auto_75867 ?auto_75868 ) ) ( ON ?auto_75868 ?auto_75869 ) ( not ( = ?auto_75864 ?auto_75869 ) ) ( not ( = ?auto_75865 ?auto_75869 ) ) ( not ( = ?auto_75866 ?auto_75869 ) ) ( not ( = ?auto_75867 ?auto_75869 ) ) ( not ( = ?auto_75868 ?auto_75869 ) ) ( ON ?auto_75867 ?auto_75868 ) ( ON-TABLE ?auto_75870 ) ( ON ?auto_75869 ?auto_75870 ) ( not ( = ?auto_75870 ?auto_75869 ) ) ( not ( = ?auto_75870 ?auto_75868 ) ) ( not ( = ?auto_75870 ?auto_75867 ) ) ( not ( = ?auto_75864 ?auto_75870 ) ) ( not ( = ?auto_75865 ?auto_75870 ) ) ( not ( = ?auto_75866 ?auto_75870 ) ) ( ON ?auto_75866 ?auto_75867 ) ( CLEAR ?auto_75866 ) ( HOLDING ?auto_75865 ) ( CLEAR ?auto_75864 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75864 ?auto_75865 )
      ( MAKE-5PILE ?auto_75864 ?auto_75865 ?auto_75866 ?auto_75867 ?auto_75868 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75871 - BLOCK
      ?auto_75872 - BLOCK
      ?auto_75873 - BLOCK
      ?auto_75874 - BLOCK
      ?auto_75875 - BLOCK
    )
    :vars
    (
      ?auto_75876 - BLOCK
      ?auto_75877 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75871 ) ( not ( = ?auto_75871 ?auto_75872 ) ) ( not ( = ?auto_75871 ?auto_75873 ) ) ( not ( = ?auto_75871 ?auto_75874 ) ) ( not ( = ?auto_75871 ?auto_75875 ) ) ( not ( = ?auto_75872 ?auto_75873 ) ) ( not ( = ?auto_75872 ?auto_75874 ) ) ( not ( = ?auto_75872 ?auto_75875 ) ) ( not ( = ?auto_75873 ?auto_75874 ) ) ( not ( = ?auto_75873 ?auto_75875 ) ) ( not ( = ?auto_75874 ?auto_75875 ) ) ( ON ?auto_75875 ?auto_75876 ) ( not ( = ?auto_75871 ?auto_75876 ) ) ( not ( = ?auto_75872 ?auto_75876 ) ) ( not ( = ?auto_75873 ?auto_75876 ) ) ( not ( = ?auto_75874 ?auto_75876 ) ) ( not ( = ?auto_75875 ?auto_75876 ) ) ( ON ?auto_75874 ?auto_75875 ) ( ON-TABLE ?auto_75877 ) ( ON ?auto_75876 ?auto_75877 ) ( not ( = ?auto_75877 ?auto_75876 ) ) ( not ( = ?auto_75877 ?auto_75875 ) ) ( not ( = ?auto_75877 ?auto_75874 ) ) ( not ( = ?auto_75871 ?auto_75877 ) ) ( not ( = ?auto_75872 ?auto_75877 ) ) ( not ( = ?auto_75873 ?auto_75877 ) ) ( ON ?auto_75873 ?auto_75874 ) ( CLEAR ?auto_75871 ) ( ON ?auto_75872 ?auto_75873 ) ( CLEAR ?auto_75872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75877 ?auto_75876 ?auto_75875 ?auto_75874 ?auto_75873 )
      ( MAKE-5PILE ?auto_75871 ?auto_75872 ?auto_75873 ?auto_75874 ?auto_75875 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75878 - BLOCK
      ?auto_75879 - BLOCK
      ?auto_75880 - BLOCK
      ?auto_75881 - BLOCK
      ?auto_75882 - BLOCK
    )
    :vars
    (
      ?auto_75884 - BLOCK
      ?auto_75883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75878 ?auto_75879 ) ) ( not ( = ?auto_75878 ?auto_75880 ) ) ( not ( = ?auto_75878 ?auto_75881 ) ) ( not ( = ?auto_75878 ?auto_75882 ) ) ( not ( = ?auto_75879 ?auto_75880 ) ) ( not ( = ?auto_75879 ?auto_75881 ) ) ( not ( = ?auto_75879 ?auto_75882 ) ) ( not ( = ?auto_75880 ?auto_75881 ) ) ( not ( = ?auto_75880 ?auto_75882 ) ) ( not ( = ?auto_75881 ?auto_75882 ) ) ( ON ?auto_75882 ?auto_75884 ) ( not ( = ?auto_75878 ?auto_75884 ) ) ( not ( = ?auto_75879 ?auto_75884 ) ) ( not ( = ?auto_75880 ?auto_75884 ) ) ( not ( = ?auto_75881 ?auto_75884 ) ) ( not ( = ?auto_75882 ?auto_75884 ) ) ( ON ?auto_75881 ?auto_75882 ) ( ON-TABLE ?auto_75883 ) ( ON ?auto_75884 ?auto_75883 ) ( not ( = ?auto_75883 ?auto_75884 ) ) ( not ( = ?auto_75883 ?auto_75882 ) ) ( not ( = ?auto_75883 ?auto_75881 ) ) ( not ( = ?auto_75878 ?auto_75883 ) ) ( not ( = ?auto_75879 ?auto_75883 ) ) ( not ( = ?auto_75880 ?auto_75883 ) ) ( ON ?auto_75880 ?auto_75881 ) ( ON ?auto_75879 ?auto_75880 ) ( CLEAR ?auto_75879 ) ( HOLDING ?auto_75878 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75878 )
      ( MAKE-5PILE ?auto_75878 ?auto_75879 ?auto_75880 ?auto_75881 ?auto_75882 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75885 - BLOCK
      ?auto_75886 - BLOCK
      ?auto_75887 - BLOCK
      ?auto_75888 - BLOCK
      ?auto_75889 - BLOCK
    )
    :vars
    (
      ?auto_75890 - BLOCK
      ?auto_75891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75885 ?auto_75886 ) ) ( not ( = ?auto_75885 ?auto_75887 ) ) ( not ( = ?auto_75885 ?auto_75888 ) ) ( not ( = ?auto_75885 ?auto_75889 ) ) ( not ( = ?auto_75886 ?auto_75887 ) ) ( not ( = ?auto_75886 ?auto_75888 ) ) ( not ( = ?auto_75886 ?auto_75889 ) ) ( not ( = ?auto_75887 ?auto_75888 ) ) ( not ( = ?auto_75887 ?auto_75889 ) ) ( not ( = ?auto_75888 ?auto_75889 ) ) ( ON ?auto_75889 ?auto_75890 ) ( not ( = ?auto_75885 ?auto_75890 ) ) ( not ( = ?auto_75886 ?auto_75890 ) ) ( not ( = ?auto_75887 ?auto_75890 ) ) ( not ( = ?auto_75888 ?auto_75890 ) ) ( not ( = ?auto_75889 ?auto_75890 ) ) ( ON ?auto_75888 ?auto_75889 ) ( ON-TABLE ?auto_75891 ) ( ON ?auto_75890 ?auto_75891 ) ( not ( = ?auto_75891 ?auto_75890 ) ) ( not ( = ?auto_75891 ?auto_75889 ) ) ( not ( = ?auto_75891 ?auto_75888 ) ) ( not ( = ?auto_75885 ?auto_75891 ) ) ( not ( = ?auto_75886 ?auto_75891 ) ) ( not ( = ?auto_75887 ?auto_75891 ) ) ( ON ?auto_75887 ?auto_75888 ) ( ON ?auto_75886 ?auto_75887 ) ( ON ?auto_75885 ?auto_75886 ) ( CLEAR ?auto_75885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75891 ?auto_75890 ?auto_75889 ?auto_75888 ?auto_75887 ?auto_75886 )
      ( MAKE-5PILE ?auto_75885 ?auto_75886 ?auto_75887 ?auto_75888 ?auto_75889 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75897 - BLOCK
      ?auto_75898 - BLOCK
      ?auto_75899 - BLOCK
      ?auto_75900 - BLOCK
      ?auto_75901 - BLOCK
    )
    :vars
    (
      ?auto_75902 - BLOCK
      ?auto_75903 - BLOCK
      ?auto_75904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75897 ?auto_75898 ) ) ( not ( = ?auto_75897 ?auto_75899 ) ) ( not ( = ?auto_75897 ?auto_75900 ) ) ( not ( = ?auto_75897 ?auto_75901 ) ) ( not ( = ?auto_75898 ?auto_75899 ) ) ( not ( = ?auto_75898 ?auto_75900 ) ) ( not ( = ?auto_75898 ?auto_75901 ) ) ( not ( = ?auto_75899 ?auto_75900 ) ) ( not ( = ?auto_75899 ?auto_75901 ) ) ( not ( = ?auto_75900 ?auto_75901 ) ) ( ON ?auto_75901 ?auto_75902 ) ( not ( = ?auto_75897 ?auto_75902 ) ) ( not ( = ?auto_75898 ?auto_75902 ) ) ( not ( = ?auto_75899 ?auto_75902 ) ) ( not ( = ?auto_75900 ?auto_75902 ) ) ( not ( = ?auto_75901 ?auto_75902 ) ) ( ON ?auto_75900 ?auto_75901 ) ( ON-TABLE ?auto_75903 ) ( ON ?auto_75902 ?auto_75903 ) ( not ( = ?auto_75903 ?auto_75902 ) ) ( not ( = ?auto_75903 ?auto_75901 ) ) ( not ( = ?auto_75903 ?auto_75900 ) ) ( not ( = ?auto_75897 ?auto_75903 ) ) ( not ( = ?auto_75898 ?auto_75903 ) ) ( not ( = ?auto_75899 ?auto_75903 ) ) ( ON ?auto_75899 ?auto_75900 ) ( ON ?auto_75898 ?auto_75899 ) ( CLEAR ?auto_75898 ) ( ON ?auto_75897 ?auto_75904 ) ( CLEAR ?auto_75897 ) ( HAND-EMPTY ) ( not ( = ?auto_75897 ?auto_75904 ) ) ( not ( = ?auto_75898 ?auto_75904 ) ) ( not ( = ?auto_75899 ?auto_75904 ) ) ( not ( = ?auto_75900 ?auto_75904 ) ) ( not ( = ?auto_75901 ?auto_75904 ) ) ( not ( = ?auto_75902 ?auto_75904 ) ) ( not ( = ?auto_75903 ?auto_75904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75897 ?auto_75904 )
      ( MAKE-5PILE ?auto_75897 ?auto_75898 ?auto_75899 ?auto_75900 ?auto_75901 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75905 - BLOCK
      ?auto_75906 - BLOCK
      ?auto_75907 - BLOCK
      ?auto_75908 - BLOCK
      ?auto_75909 - BLOCK
    )
    :vars
    (
      ?auto_75912 - BLOCK
      ?auto_75911 - BLOCK
      ?auto_75910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75905 ?auto_75906 ) ) ( not ( = ?auto_75905 ?auto_75907 ) ) ( not ( = ?auto_75905 ?auto_75908 ) ) ( not ( = ?auto_75905 ?auto_75909 ) ) ( not ( = ?auto_75906 ?auto_75907 ) ) ( not ( = ?auto_75906 ?auto_75908 ) ) ( not ( = ?auto_75906 ?auto_75909 ) ) ( not ( = ?auto_75907 ?auto_75908 ) ) ( not ( = ?auto_75907 ?auto_75909 ) ) ( not ( = ?auto_75908 ?auto_75909 ) ) ( ON ?auto_75909 ?auto_75912 ) ( not ( = ?auto_75905 ?auto_75912 ) ) ( not ( = ?auto_75906 ?auto_75912 ) ) ( not ( = ?auto_75907 ?auto_75912 ) ) ( not ( = ?auto_75908 ?auto_75912 ) ) ( not ( = ?auto_75909 ?auto_75912 ) ) ( ON ?auto_75908 ?auto_75909 ) ( ON-TABLE ?auto_75911 ) ( ON ?auto_75912 ?auto_75911 ) ( not ( = ?auto_75911 ?auto_75912 ) ) ( not ( = ?auto_75911 ?auto_75909 ) ) ( not ( = ?auto_75911 ?auto_75908 ) ) ( not ( = ?auto_75905 ?auto_75911 ) ) ( not ( = ?auto_75906 ?auto_75911 ) ) ( not ( = ?auto_75907 ?auto_75911 ) ) ( ON ?auto_75907 ?auto_75908 ) ( ON ?auto_75905 ?auto_75910 ) ( CLEAR ?auto_75905 ) ( not ( = ?auto_75905 ?auto_75910 ) ) ( not ( = ?auto_75906 ?auto_75910 ) ) ( not ( = ?auto_75907 ?auto_75910 ) ) ( not ( = ?auto_75908 ?auto_75910 ) ) ( not ( = ?auto_75909 ?auto_75910 ) ) ( not ( = ?auto_75912 ?auto_75910 ) ) ( not ( = ?auto_75911 ?auto_75910 ) ) ( HOLDING ?auto_75906 ) ( CLEAR ?auto_75907 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75911 ?auto_75912 ?auto_75909 ?auto_75908 ?auto_75907 ?auto_75906 )
      ( MAKE-5PILE ?auto_75905 ?auto_75906 ?auto_75907 ?auto_75908 ?auto_75909 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75913 - BLOCK
      ?auto_75914 - BLOCK
      ?auto_75915 - BLOCK
      ?auto_75916 - BLOCK
      ?auto_75917 - BLOCK
    )
    :vars
    (
      ?auto_75920 - BLOCK
      ?auto_75918 - BLOCK
      ?auto_75919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75913 ?auto_75914 ) ) ( not ( = ?auto_75913 ?auto_75915 ) ) ( not ( = ?auto_75913 ?auto_75916 ) ) ( not ( = ?auto_75913 ?auto_75917 ) ) ( not ( = ?auto_75914 ?auto_75915 ) ) ( not ( = ?auto_75914 ?auto_75916 ) ) ( not ( = ?auto_75914 ?auto_75917 ) ) ( not ( = ?auto_75915 ?auto_75916 ) ) ( not ( = ?auto_75915 ?auto_75917 ) ) ( not ( = ?auto_75916 ?auto_75917 ) ) ( ON ?auto_75917 ?auto_75920 ) ( not ( = ?auto_75913 ?auto_75920 ) ) ( not ( = ?auto_75914 ?auto_75920 ) ) ( not ( = ?auto_75915 ?auto_75920 ) ) ( not ( = ?auto_75916 ?auto_75920 ) ) ( not ( = ?auto_75917 ?auto_75920 ) ) ( ON ?auto_75916 ?auto_75917 ) ( ON-TABLE ?auto_75918 ) ( ON ?auto_75920 ?auto_75918 ) ( not ( = ?auto_75918 ?auto_75920 ) ) ( not ( = ?auto_75918 ?auto_75917 ) ) ( not ( = ?auto_75918 ?auto_75916 ) ) ( not ( = ?auto_75913 ?auto_75918 ) ) ( not ( = ?auto_75914 ?auto_75918 ) ) ( not ( = ?auto_75915 ?auto_75918 ) ) ( ON ?auto_75915 ?auto_75916 ) ( ON ?auto_75913 ?auto_75919 ) ( not ( = ?auto_75913 ?auto_75919 ) ) ( not ( = ?auto_75914 ?auto_75919 ) ) ( not ( = ?auto_75915 ?auto_75919 ) ) ( not ( = ?auto_75916 ?auto_75919 ) ) ( not ( = ?auto_75917 ?auto_75919 ) ) ( not ( = ?auto_75920 ?auto_75919 ) ) ( not ( = ?auto_75918 ?auto_75919 ) ) ( CLEAR ?auto_75915 ) ( ON ?auto_75914 ?auto_75913 ) ( CLEAR ?auto_75914 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75919 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75919 ?auto_75913 )
      ( MAKE-5PILE ?auto_75913 ?auto_75914 ?auto_75915 ?auto_75916 ?auto_75917 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75921 - BLOCK
      ?auto_75922 - BLOCK
      ?auto_75923 - BLOCK
      ?auto_75924 - BLOCK
      ?auto_75925 - BLOCK
    )
    :vars
    (
      ?auto_75926 - BLOCK
      ?auto_75927 - BLOCK
      ?auto_75928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75921 ?auto_75922 ) ) ( not ( = ?auto_75921 ?auto_75923 ) ) ( not ( = ?auto_75921 ?auto_75924 ) ) ( not ( = ?auto_75921 ?auto_75925 ) ) ( not ( = ?auto_75922 ?auto_75923 ) ) ( not ( = ?auto_75922 ?auto_75924 ) ) ( not ( = ?auto_75922 ?auto_75925 ) ) ( not ( = ?auto_75923 ?auto_75924 ) ) ( not ( = ?auto_75923 ?auto_75925 ) ) ( not ( = ?auto_75924 ?auto_75925 ) ) ( ON ?auto_75925 ?auto_75926 ) ( not ( = ?auto_75921 ?auto_75926 ) ) ( not ( = ?auto_75922 ?auto_75926 ) ) ( not ( = ?auto_75923 ?auto_75926 ) ) ( not ( = ?auto_75924 ?auto_75926 ) ) ( not ( = ?auto_75925 ?auto_75926 ) ) ( ON ?auto_75924 ?auto_75925 ) ( ON-TABLE ?auto_75927 ) ( ON ?auto_75926 ?auto_75927 ) ( not ( = ?auto_75927 ?auto_75926 ) ) ( not ( = ?auto_75927 ?auto_75925 ) ) ( not ( = ?auto_75927 ?auto_75924 ) ) ( not ( = ?auto_75921 ?auto_75927 ) ) ( not ( = ?auto_75922 ?auto_75927 ) ) ( not ( = ?auto_75923 ?auto_75927 ) ) ( ON ?auto_75921 ?auto_75928 ) ( not ( = ?auto_75921 ?auto_75928 ) ) ( not ( = ?auto_75922 ?auto_75928 ) ) ( not ( = ?auto_75923 ?auto_75928 ) ) ( not ( = ?auto_75924 ?auto_75928 ) ) ( not ( = ?auto_75925 ?auto_75928 ) ) ( not ( = ?auto_75926 ?auto_75928 ) ) ( not ( = ?auto_75927 ?auto_75928 ) ) ( ON ?auto_75922 ?auto_75921 ) ( CLEAR ?auto_75922 ) ( ON-TABLE ?auto_75928 ) ( HOLDING ?auto_75923 ) ( CLEAR ?auto_75924 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75927 ?auto_75926 ?auto_75925 ?auto_75924 ?auto_75923 )
      ( MAKE-5PILE ?auto_75921 ?auto_75922 ?auto_75923 ?auto_75924 ?auto_75925 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75929 - BLOCK
      ?auto_75930 - BLOCK
      ?auto_75931 - BLOCK
      ?auto_75932 - BLOCK
      ?auto_75933 - BLOCK
    )
    :vars
    (
      ?auto_75934 - BLOCK
      ?auto_75936 - BLOCK
      ?auto_75935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75929 ?auto_75930 ) ) ( not ( = ?auto_75929 ?auto_75931 ) ) ( not ( = ?auto_75929 ?auto_75932 ) ) ( not ( = ?auto_75929 ?auto_75933 ) ) ( not ( = ?auto_75930 ?auto_75931 ) ) ( not ( = ?auto_75930 ?auto_75932 ) ) ( not ( = ?auto_75930 ?auto_75933 ) ) ( not ( = ?auto_75931 ?auto_75932 ) ) ( not ( = ?auto_75931 ?auto_75933 ) ) ( not ( = ?auto_75932 ?auto_75933 ) ) ( ON ?auto_75933 ?auto_75934 ) ( not ( = ?auto_75929 ?auto_75934 ) ) ( not ( = ?auto_75930 ?auto_75934 ) ) ( not ( = ?auto_75931 ?auto_75934 ) ) ( not ( = ?auto_75932 ?auto_75934 ) ) ( not ( = ?auto_75933 ?auto_75934 ) ) ( ON ?auto_75932 ?auto_75933 ) ( ON-TABLE ?auto_75936 ) ( ON ?auto_75934 ?auto_75936 ) ( not ( = ?auto_75936 ?auto_75934 ) ) ( not ( = ?auto_75936 ?auto_75933 ) ) ( not ( = ?auto_75936 ?auto_75932 ) ) ( not ( = ?auto_75929 ?auto_75936 ) ) ( not ( = ?auto_75930 ?auto_75936 ) ) ( not ( = ?auto_75931 ?auto_75936 ) ) ( ON ?auto_75929 ?auto_75935 ) ( not ( = ?auto_75929 ?auto_75935 ) ) ( not ( = ?auto_75930 ?auto_75935 ) ) ( not ( = ?auto_75931 ?auto_75935 ) ) ( not ( = ?auto_75932 ?auto_75935 ) ) ( not ( = ?auto_75933 ?auto_75935 ) ) ( not ( = ?auto_75934 ?auto_75935 ) ) ( not ( = ?auto_75936 ?auto_75935 ) ) ( ON ?auto_75930 ?auto_75929 ) ( ON-TABLE ?auto_75935 ) ( CLEAR ?auto_75932 ) ( ON ?auto_75931 ?auto_75930 ) ( CLEAR ?auto_75931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75935 ?auto_75929 ?auto_75930 )
      ( MAKE-5PILE ?auto_75929 ?auto_75930 ?auto_75931 ?auto_75932 ?auto_75933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75937 - BLOCK
      ?auto_75938 - BLOCK
      ?auto_75939 - BLOCK
      ?auto_75940 - BLOCK
      ?auto_75941 - BLOCK
    )
    :vars
    (
      ?auto_75943 - BLOCK
      ?auto_75942 - BLOCK
      ?auto_75944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75937 ?auto_75938 ) ) ( not ( = ?auto_75937 ?auto_75939 ) ) ( not ( = ?auto_75937 ?auto_75940 ) ) ( not ( = ?auto_75937 ?auto_75941 ) ) ( not ( = ?auto_75938 ?auto_75939 ) ) ( not ( = ?auto_75938 ?auto_75940 ) ) ( not ( = ?auto_75938 ?auto_75941 ) ) ( not ( = ?auto_75939 ?auto_75940 ) ) ( not ( = ?auto_75939 ?auto_75941 ) ) ( not ( = ?auto_75940 ?auto_75941 ) ) ( ON ?auto_75941 ?auto_75943 ) ( not ( = ?auto_75937 ?auto_75943 ) ) ( not ( = ?auto_75938 ?auto_75943 ) ) ( not ( = ?auto_75939 ?auto_75943 ) ) ( not ( = ?auto_75940 ?auto_75943 ) ) ( not ( = ?auto_75941 ?auto_75943 ) ) ( ON-TABLE ?auto_75942 ) ( ON ?auto_75943 ?auto_75942 ) ( not ( = ?auto_75942 ?auto_75943 ) ) ( not ( = ?auto_75942 ?auto_75941 ) ) ( not ( = ?auto_75942 ?auto_75940 ) ) ( not ( = ?auto_75937 ?auto_75942 ) ) ( not ( = ?auto_75938 ?auto_75942 ) ) ( not ( = ?auto_75939 ?auto_75942 ) ) ( ON ?auto_75937 ?auto_75944 ) ( not ( = ?auto_75937 ?auto_75944 ) ) ( not ( = ?auto_75938 ?auto_75944 ) ) ( not ( = ?auto_75939 ?auto_75944 ) ) ( not ( = ?auto_75940 ?auto_75944 ) ) ( not ( = ?auto_75941 ?auto_75944 ) ) ( not ( = ?auto_75943 ?auto_75944 ) ) ( not ( = ?auto_75942 ?auto_75944 ) ) ( ON ?auto_75938 ?auto_75937 ) ( ON-TABLE ?auto_75944 ) ( ON ?auto_75939 ?auto_75938 ) ( CLEAR ?auto_75939 ) ( HOLDING ?auto_75940 ) ( CLEAR ?auto_75941 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75942 ?auto_75943 ?auto_75941 ?auto_75940 )
      ( MAKE-5PILE ?auto_75937 ?auto_75938 ?auto_75939 ?auto_75940 ?auto_75941 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75945 - BLOCK
      ?auto_75946 - BLOCK
      ?auto_75947 - BLOCK
      ?auto_75948 - BLOCK
      ?auto_75949 - BLOCK
    )
    :vars
    (
      ?auto_75952 - BLOCK
      ?auto_75951 - BLOCK
      ?auto_75950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75945 ?auto_75946 ) ) ( not ( = ?auto_75945 ?auto_75947 ) ) ( not ( = ?auto_75945 ?auto_75948 ) ) ( not ( = ?auto_75945 ?auto_75949 ) ) ( not ( = ?auto_75946 ?auto_75947 ) ) ( not ( = ?auto_75946 ?auto_75948 ) ) ( not ( = ?auto_75946 ?auto_75949 ) ) ( not ( = ?auto_75947 ?auto_75948 ) ) ( not ( = ?auto_75947 ?auto_75949 ) ) ( not ( = ?auto_75948 ?auto_75949 ) ) ( ON ?auto_75949 ?auto_75952 ) ( not ( = ?auto_75945 ?auto_75952 ) ) ( not ( = ?auto_75946 ?auto_75952 ) ) ( not ( = ?auto_75947 ?auto_75952 ) ) ( not ( = ?auto_75948 ?auto_75952 ) ) ( not ( = ?auto_75949 ?auto_75952 ) ) ( ON-TABLE ?auto_75951 ) ( ON ?auto_75952 ?auto_75951 ) ( not ( = ?auto_75951 ?auto_75952 ) ) ( not ( = ?auto_75951 ?auto_75949 ) ) ( not ( = ?auto_75951 ?auto_75948 ) ) ( not ( = ?auto_75945 ?auto_75951 ) ) ( not ( = ?auto_75946 ?auto_75951 ) ) ( not ( = ?auto_75947 ?auto_75951 ) ) ( ON ?auto_75945 ?auto_75950 ) ( not ( = ?auto_75945 ?auto_75950 ) ) ( not ( = ?auto_75946 ?auto_75950 ) ) ( not ( = ?auto_75947 ?auto_75950 ) ) ( not ( = ?auto_75948 ?auto_75950 ) ) ( not ( = ?auto_75949 ?auto_75950 ) ) ( not ( = ?auto_75952 ?auto_75950 ) ) ( not ( = ?auto_75951 ?auto_75950 ) ) ( ON ?auto_75946 ?auto_75945 ) ( ON-TABLE ?auto_75950 ) ( ON ?auto_75947 ?auto_75946 ) ( CLEAR ?auto_75949 ) ( ON ?auto_75948 ?auto_75947 ) ( CLEAR ?auto_75948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75950 ?auto_75945 ?auto_75946 ?auto_75947 )
      ( MAKE-5PILE ?auto_75945 ?auto_75946 ?auto_75947 ?auto_75948 ?auto_75949 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75953 - BLOCK
      ?auto_75954 - BLOCK
      ?auto_75955 - BLOCK
      ?auto_75956 - BLOCK
      ?auto_75957 - BLOCK
    )
    :vars
    (
      ?auto_75960 - BLOCK
      ?auto_75959 - BLOCK
      ?auto_75958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75953 ?auto_75954 ) ) ( not ( = ?auto_75953 ?auto_75955 ) ) ( not ( = ?auto_75953 ?auto_75956 ) ) ( not ( = ?auto_75953 ?auto_75957 ) ) ( not ( = ?auto_75954 ?auto_75955 ) ) ( not ( = ?auto_75954 ?auto_75956 ) ) ( not ( = ?auto_75954 ?auto_75957 ) ) ( not ( = ?auto_75955 ?auto_75956 ) ) ( not ( = ?auto_75955 ?auto_75957 ) ) ( not ( = ?auto_75956 ?auto_75957 ) ) ( not ( = ?auto_75953 ?auto_75960 ) ) ( not ( = ?auto_75954 ?auto_75960 ) ) ( not ( = ?auto_75955 ?auto_75960 ) ) ( not ( = ?auto_75956 ?auto_75960 ) ) ( not ( = ?auto_75957 ?auto_75960 ) ) ( ON-TABLE ?auto_75959 ) ( ON ?auto_75960 ?auto_75959 ) ( not ( = ?auto_75959 ?auto_75960 ) ) ( not ( = ?auto_75959 ?auto_75957 ) ) ( not ( = ?auto_75959 ?auto_75956 ) ) ( not ( = ?auto_75953 ?auto_75959 ) ) ( not ( = ?auto_75954 ?auto_75959 ) ) ( not ( = ?auto_75955 ?auto_75959 ) ) ( ON ?auto_75953 ?auto_75958 ) ( not ( = ?auto_75953 ?auto_75958 ) ) ( not ( = ?auto_75954 ?auto_75958 ) ) ( not ( = ?auto_75955 ?auto_75958 ) ) ( not ( = ?auto_75956 ?auto_75958 ) ) ( not ( = ?auto_75957 ?auto_75958 ) ) ( not ( = ?auto_75960 ?auto_75958 ) ) ( not ( = ?auto_75959 ?auto_75958 ) ) ( ON ?auto_75954 ?auto_75953 ) ( ON-TABLE ?auto_75958 ) ( ON ?auto_75955 ?auto_75954 ) ( ON ?auto_75956 ?auto_75955 ) ( CLEAR ?auto_75956 ) ( HOLDING ?auto_75957 ) ( CLEAR ?auto_75960 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75959 ?auto_75960 ?auto_75957 )
      ( MAKE-5PILE ?auto_75953 ?auto_75954 ?auto_75955 ?auto_75956 ?auto_75957 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75961 - BLOCK
      ?auto_75962 - BLOCK
      ?auto_75963 - BLOCK
      ?auto_75964 - BLOCK
      ?auto_75965 - BLOCK
    )
    :vars
    (
      ?auto_75968 - BLOCK
      ?auto_75966 - BLOCK
      ?auto_75967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75961 ?auto_75962 ) ) ( not ( = ?auto_75961 ?auto_75963 ) ) ( not ( = ?auto_75961 ?auto_75964 ) ) ( not ( = ?auto_75961 ?auto_75965 ) ) ( not ( = ?auto_75962 ?auto_75963 ) ) ( not ( = ?auto_75962 ?auto_75964 ) ) ( not ( = ?auto_75962 ?auto_75965 ) ) ( not ( = ?auto_75963 ?auto_75964 ) ) ( not ( = ?auto_75963 ?auto_75965 ) ) ( not ( = ?auto_75964 ?auto_75965 ) ) ( not ( = ?auto_75961 ?auto_75968 ) ) ( not ( = ?auto_75962 ?auto_75968 ) ) ( not ( = ?auto_75963 ?auto_75968 ) ) ( not ( = ?auto_75964 ?auto_75968 ) ) ( not ( = ?auto_75965 ?auto_75968 ) ) ( ON-TABLE ?auto_75966 ) ( ON ?auto_75968 ?auto_75966 ) ( not ( = ?auto_75966 ?auto_75968 ) ) ( not ( = ?auto_75966 ?auto_75965 ) ) ( not ( = ?auto_75966 ?auto_75964 ) ) ( not ( = ?auto_75961 ?auto_75966 ) ) ( not ( = ?auto_75962 ?auto_75966 ) ) ( not ( = ?auto_75963 ?auto_75966 ) ) ( ON ?auto_75961 ?auto_75967 ) ( not ( = ?auto_75961 ?auto_75967 ) ) ( not ( = ?auto_75962 ?auto_75967 ) ) ( not ( = ?auto_75963 ?auto_75967 ) ) ( not ( = ?auto_75964 ?auto_75967 ) ) ( not ( = ?auto_75965 ?auto_75967 ) ) ( not ( = ?auto_75968 ?auto_75967 ) ) ( not ( = ?auto_75966 ?auto_75967 ) ) ( ON ?auto_75962 ?auto_75961 ) ( ON-TABLE ?auto_75967 ) ( ON ?auto_75963 ?auto_75962 ) ( ON ?auto_75964 ?auto_75963 ) ( CLEAR ?auto_75968 ) ( ON ?auto_75965 ?auto_75964 ) ( CLEAR ?auto_75965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75967 ?auto_75961 ?auto_75962 ?auto_75963 ?auto_75964 )
      ( MAKE-5PILE ?auto_75961 ?auto_75962 ?auto_75963 ?auto_75964 ?auto_75965 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75969 - BLOCK
      ?auto_75970 - BLOCK
      ?auto_75971 - BLOCK
      ?auto_75972 - BLOCK
      ?auto_75973 - BLOCK
    )
    :vars
    (
      ?auto_75975 - BLOCK
      ?auto_75974 - BLOCK
      ?auto_75976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75969 ?auto_75970 ) ) ( not ( = ?auto_75969 ?auto_75971 ) ) ( not ( = ?auto_75969 ?auto_75972 ) ) ( not ( = ?auto_75969 ?auto_75973 ) ) ( not ( = ?auto_75970 ?auto_75971 ) ) ( not ( = ?auto_75970 ?auto_75972 ) ) ( not ( = ?auto_75970 ?auto_75973 ) ) ( not ( = ?auto_75971 ?auto_75972 ) ) ( not ( = ?auto_75971 ?auto_75973 ) ) ( not ( = ?auto_75972 ?auto_75973 ) ) ( not ( = ?auto_75969 ?auto_75975 ) ) ( not ( = ?auto_75970 ?auto_75975 ) ) ( not ( = ?auto_75971 ?auto_75975 ) ) ( not ( = ?auto_75972 ?auto_75975 ) ) ( not ( = ?auto_75973 ?auto_75975 ) ) ( ON-TABLE ?auto_75974 ) ( not ( = ?auto_75974 ?auto_75975 ) ) ( not ( = ?auto_75974 ?auto_75973 ) ) ( not ( = ?auto_75974 ?auto_75972 ) ) ( not ( = ?auto_75969 ?auto_75974 ) ) ( not ( = ?auto_75970 ?auto_75974 ) ) ( not ( = ?auto_75971 ?auto_75974 ) ) ( ON ?auto_75969 ?auto_75976 ) ( not ( = ?auto_75969 ?auto_75976 ) ) ( not ( = ?auto_75970 ?auto_75976 ) ) ( not ( = ?auto_75971 ?auto_75976 ) ) ( not ( = ?auto_75972 ?auto_75976 ) ) ( not ( = ?auto_75973 ?auto_75976 ) ) ( not ( = ?auto_75975 ?auto_75976 ) ) ( not ( = ?auto_75974 ?auto_75976 ) ) ( ON ?auto_75970 ?auto_75969 ) ( ON-TABLE ?auto_75976 ) ( ON ?auto_75971 ?auto_75970 ) ( ON ?auto_75972 ?auto_75971 ) ( ON ?auto_75973 ?auto_75972 ) ( CLEAR ?auto_75973 ) ( HOLDING ?auto_75975 ) ( CLEAR ?auto_75974 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75974 ?auto_75975 )
      ( MAKE-5PILE ?auto_75969 ?auto_75970 ?auto_75971 ?auto_75972 ?auto_75973 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75977 - BLOCK
      ?auto_75978 - BLOCK
      ?auto_75979 - BLOCK
      ?auto_75980 - BLOCK
      ?auto_75981 - BLOCK
    )
    :vars
    (
      ?auto_75984 - BLOCK
      ?auto_75982 - BLOCK
      ?auto_75983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75977 ?auto_75978 ) ) ( not ( = ?auto_75977 ?auto_75979 ) ) ( not ( = ?auto_75977 ?auto_75980 ) ) ( not ( = ?auto_75977 ?auto_75981 ) ) ( not ( = ?auto_75978 ?auto_75979 ) ) ( not ( = ?auto_75978 ?auto_75980 ) ) ( not ( = ?auto_75978 ?auto_75981 ) ) ( not ( = ?auto_75979 ?auto_75980 ) ) ( not ( = ?auto_75979 ?auto_75981 ) ) ( not ( = ?auto_75980 ?auto_75981 ) ) ( not ( = ?auto_75977 ?auto_75984 ) ) ( not ( = ?auto_75978 ?auto_75984 ) ) ( not ( = ?auto_75979 ?auto_75984 ) ) ( not ( = ?auto_75980 ?auto_75984 ) ) ( not ( = ?auto_75981 ?auto_75984 ) ) ( ON-TABLE ?auto_75982 ) ( not ( = ?auto_75982 ?auto_75984 ) ) ( not ( = ?auto_75982 ?auto_75981 ) ) ( not ( = ?auto_75982 ?auto_75980 ) ) ( not ( = ?auto_75977 ?auto_75982 ) ) ( not ( = ?auto_75978 ?auto_75982 ) ) ( not ( = ?auto_75979 ?auto_75982 ) ) ( ON ?auto_75977 ?auto_75983 ) ( not ( = ?auto_75977 ?auto_75983 ) ) ( not ( = ?auto_75978 ?auto_75983 ) ) ( not ( = ?auto_75979 ?auto_75983 ) ) ( not ( = ?auto_75980 ?auto_75983 ) ) ( not ( = ?auto_75981 ?auto_75983 ) ) ( not ( = ?auto_75984 ?auto_75983 ) ) ( not ( = ?auto_75982 ?auto_75983 ) ) ( ON ?auto_75978 ?auto_75977 ) ( ON-TABLE ?auto_75983 ) ( ON ?auto_75979 ?auto_75978 ) ( ON ?auto_75980 ?auto_75979 ) ( ON ?auto_75981 ?auto_75980 ) ( CLEAR ?auto_75982 ) ( ON ?auto_75984 ?auto_75981 ) ( CLEAR ?auto_75984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75983 ?auto_75977 ?auto_75978 ?auto_75979 ?auto_75980 ?auto_75981 )
      ( MAKE-5PILE ?auto_75977 ?auto_75978 ?auto_75979 ?auto_75980 ?auto_75981 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75985 - BLOCK
      ?auto_75986 - BLOCK
      ?auto_75987 - BLOCK
      ?auto_75988 - BLOCK
      ?auto_75989 - BLOCK
    )
    :vars
    (
      ?auto_75991 - BLOCK
      ?auto_75992 - BLOCK
      ?auto_75990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75985 ?auto_75986 ) ) ( not ( = ?auto_75985 ?auto_75987 ) ) ( not ( = ?auto_75985 ?auto_75988 ) ) ( not ( = ?auto_75985 ?auto_75989 ) ) ( not ( = ?auto_75986 ?auto_75987 ) ) ( not ( = ?auto_75986 ?auto_75988 ) ) ( not ( = ?auto_75986 ?auto_75989 ) ) ( not ( = ?auto_75987 ?auto_75988 ) ) ( not ( = ?auto_75987 ?auto_75989 ) ) ( not ( = ?auto_75988 ?auto_75989 ) ) ( not ( = ?auto_75985 ?auto_75991 ) ) ( not ( = ?auto_75986 ?auto_75991 ) ) ( not ( = ?auto_75987 ?auto_75991 ) ) ( not ( = ?auto_75988 ?auto_75991 ) ) ( not ( = ?auto_75989 ?auto_75991 ) ) ( not ( = ?auto_75992 ?auto_75991 ) ) ( not ( = ?auto_75992 ?auto_75989 ) ) ( not ( = ?auto_75992 ?auto_75988 ) ) ( not ( = ?auto_75985 ?auto_75992 ) ) ( not ( = ?auto_75986 ?auto_75992 ) ) ( not ( = ?auto_75987 ?auto_75992 ) ) ( ON ?auto_75985 ?auto_75990 ) ( not ( = ?auto_75985 ?auto_75990 ) ) ( not ( = ?auto_75986 ?auto_75990 ) ) ( not ( = ?auto_75987 ?auto_75990 ) ) ( not ( = ?auto_75988 ?auto_75990 ) ) ( not ( = ?auto_75989 ?auto_75990 ) ) ( not ( = ?auto_75991 ?auto_75990 ) ) ( not ( = ?auto_75992 ?auto_75990 ) ) ( ON ?auto_75986 ?auto_75985 ) ( ON-TABLE ?auto_75990 ) ( ON ?auto_75987 ?auto_75986 ) ( ON ?auto_75988 ?auto_75987 ) ( ON ?auto_75989 ?auto_75988 ) ( ON ?auto_75991 ?auto_75989 ) ( CLEAR ?auto_75991 ) ( HOLDING ?auto_75992 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75992 )
      ( MAKE-5PILE ?auto_75985 ?auto_75986 ?auto_75987 ?auto_75988 ?auto_75989 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75993 - BLOCK
      ?auto_75994 - BLOCK
      ?auto_75995 - BLOCK
      ?auto_75996 - BLOCK
      ?auto_75997 - BLOCK
    )
    :vars
    (
      ?auto_75999 - BLOCK
      ?auto_76000 - BLOCK
      ?auto_75998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75993 ?auto_75994 ) ) ( not ( = ?auto_75993 ?auto_75995 ) ) ( not ( = ?auto_75993 ?auto_75996 ) ) ( not ( = ?auto_75993 ?auto_75997 ) ) ( not ( = ?auto_75994 ?auto_75995 ) ) ( not ( = ?auto_75994 ?auto_75996 ) ) ( not ( = ?auto_75994 ?auto_75997 ) ) ( not ( = ?auto_75995 ?auto_75996 ) ) ( not ( = ?auto_75995 ?auto_75997 ) ) ( not ( = ?auto_75996 ?auto_75997 ) ) ( not ( = ?auto_75993 ?auto_75999 ) ) ( not ( = ?auto_75994 ?auto_75999 ) ) ( not ( = ?auto_75995 ?auto_75999 ) ) ( not ( = ?auto_75996 ?auto_75999 ) ) ( not ( = ?auto_75997 ?auto_75999 ) ) ( not ( = ?auto_76000 ?auto_75999 ) ) ( not ( = ?auto_76000 ?auto_75997 ) ) ( not ( = ?auto_76000 ?auto_75996 ) ) ( not ( = ?auto_75993 ?auto_76000 ) ) ( not ( = ?auto_75994 ?auto_76000 ) ) ( not ( = ?auto_75995 ?auto_76000 ) ) ( ON ?auto_75993 ?auto_75998 ) ( not ( = ?auto_75993 ?auto_75998 ) ) ( not ( = ?auto_75994 ?auto_75998 ) ) ( not ( = ?auto_75995 ?auto_75998 ) ) ( not ( = ?auto_75996 ?auto_75998 ) ) ( not ( = ?auto_75997 ?auto_75998 ) ) ( not ( = ?auto_75999 ?auto_75998 ) ) ( not ( = ?auto_76000 ?auto_75998 ) ) ( ON ?auto_75994 ?auto_75993 ) ( ON-TABLE ?auto_75998 ) ( ON ?auto_75995 ?auto_75994 ) ( ON ?auto_75996 ?auto_75995 ) ( ON ?auto_75997 ?auto_75996 ) ( ON ?auto_75999 ?auto_75997 ) ( ON ?auto_76000 ?auto_75999 ) ( CLEAR ?auto_76000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_75998 ?auto_75993 ?auto_75994 ?auto_75995 ?auto_75996 ?auto_75997 ?auto_75999 )
      ( MAKE-5PILE ?auto_75993 ?auto_75994 ?auto_75995 ?auto_75996 ?auto_75997 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76012 - BLOCK
    )
    :vars
    (
      ?auto_76015 - BLOCK
      ?auto_76014 - BLOCK
      ?auto_76013 - BLOCK
      ?auto_76017 - BLOCK
      ?auto_76016 - BLOCK
      ?auto_76018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76015 ?auto_76012 ) ( ON-TABLE ?auto_76012 ) ( not ( = ?auto_76012 ?auto_76015 ) ) ( not ( = ?auto_76012 ?auto_76014 ) ) ( not ( = ?auto_76012 ?auto_76013 ) ) ( not ( = ?auto_76015 ?auto_76014 ) ) ( not ( = ?auto_76015 ?auto_76013 ) ) ( not ( = ?auto_76014 ?auto_76013 ) ) ( ON ?auto_76014 ?auto_76015 ) ( CLEAR ?auto_76014 ) ( HOLDING ?auto_76013 ) ( CLEAR ?auto_76017 ) ( ON-TABLE ?auto_76016 ) ( ON ?auto_76018 ?auto_76016 ) ( ON ?auto_76017 ?auto_76018 ) ( not ( = ?auto_76016 ?auto_76018 ) ) ( not ( = ?auto_76016 ?auto_76017 ) ) ( not ( = ?auto_76016 ?auto_76013 ) ) ( not ( = ?auto_76018 ?auto_76017 ) ) ( not ( = ?auto_76018 ?auto_76013 ) ) ( not ( = ?auto_76017 ?auto_76013 ) ) ( not ( = ?auto_76012 ?auto_76017 ) ) ( not ( = ?auto_76012 ?auto_76016 ) ) ( not ( = ?auto_76012 ?auto_76018 ) ) ( not ( = ?auto_76015 ?auto_76017 ) ) ( not ( = ?auto_76015 ?auto_76016 ) ) ( not ( = ?auto_76015 ?auto_76018 ) ) ( not ( = ?auto_76014 ?auto_76017 ) ) ( not ( = ?auto_76014 ?auto_76016 ) ) ( not ( = ?auto_76014 ?auto_76018 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76016 ?auto_76018 ?auto_76017 ?auto_76013 )
      ( MAKE-1PILE ?auto_76012 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76019 - BLOCK
    )
    :vars
    (
      ?auto_76025 - BLOCK
      ?auto_76024 - BLOCK
      ?auto_76023 - BLOCK
      ?auto_76021 - BLOCK
      ?auto_76020 - BLOCK
      ?auto_76022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76025 ?auto_76019 ) ( ON-TABLE ?auto_76019 ) ( not ( = ?auto_76019 ?auto_76025 ) ) ( not ( = ?auto_76019 ?auto_76024 ) ) ( not ( = ?auto_76019 ?auto_76023 ) ) ( not ( = ?auto_76025 ?auto_76024 ) ) ( not ( = ?auto_76025 ?auto_76023 ) ) ( not ( = ?auto_76024 ?auto_76023 ) ) ( ON ?auto_76024 ?auto_76025 ) ( CLEAR ?auto_76021 ) ( ON-TABLE ?auto_76020 ) ( ON ?auto_76022 ?auto_76020 ) ( ON ?auto_76021 ?auto_76022 ) ( not ( = ?auto_76020 ?auto_76022 ) ) ( not ( = ?auto_76020 ?auto_76021 ) ) ( not ( = ?auto_76020 ?auto_76023 ) ) ( not ( = ?auto_76022 ?auto_76021 ) ) ( not ( = ?auto_76022 ?auto_76023 ) ) ( not ( = ?auto_76021 ?auto_76023 ) ) ( not ( = ?auto_76019 ?auto_76021 ) ) ( not ( = ?auto_76019 ?auto_76020 ) ) ( not ( = ?auto_76019 ?auto_76022 ) ) ( not ( = ?auto_76025 ?auto_76021 ) ) ( not ( = ?auto_76025 ?auto_76020 ) ) ( not ( = ?auto_76025 ?auto_76022 ) ) ( not ( = ?auto_76024 ?auto_76021 ) ) ( not ( = ?auto_76024 ?auto_76020 ) ) ( not ( = ?auto_76024 ?auto_76022 ) ) ( ON ?auto_76023 ?auto_76024 ) ( CLEAR ?auto_76023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76019 ?auto_76025 ?auto_76024 )
      ( MAKE-1PILE ?auto_76019 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76026 - BLOCK
    )
    :vars
    (
      ?auto_76030 - BLOCK
      ?auto_76031 - BLOCK
      ?auto_76032 - BLOCK
      ?auto_76029 - BLOCK
      ?auto_76028 - BLOCK
      ?auto_76027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76030 ?auto_76026 ) ( ON-TABLE ?auto_76026 ) ( not ( = ?auto_76026 ?auto_76030 ) ) ( not ( = ?auto_76026 ?auto_76031 ) ) ( not ( = ?auto_76026 ?auto_76032 ) ) ( not ( = ?auto_76030 ?auto_76031 ) ) ( not ( = ?auto_76030 ?auto_76032 ) ) ( not ( = ?auto_76031 ?auto_76032 ) ) ( ON ?auto_76031 ?auto_76030 ) ( ON-TABLE ?auto_76029 ) ( ON ?auto_76028 ?auto_76029 ) ( not ( = ?auto_76029 ?auto_76028 ) ) ( not ( = ?auto_76029 ?auto_76027 ) ) ( not ( = ?auto_76029 ?auto_76032 ) ) ( not ( = ?auto_76028 ?auto_76027 ) ) ( not ( = ?auto_76028 ?auto_76032 ) ) ( not ( = ?auto_76027 ?auto_76032 ) ) ( not ( = ?auto_76026 ?auto_76027 ) ) ( not ( = ?auto_76026 ?auto_76029 ) ) ( not ( = ?auto_76026 ?auto_76028 ) ) ( not ( = ?auto_76030 ?auto_76027 ) ) ( not ( = ?auto_76030 ?auto_76029 ) ) ( not ( = ?auto_76030 ?auto_76028 ) ) ( not ( = ?auto_76031 ?auto_76027 ) ) ( not ( = ?auto_76031 ?auto_76029 ) ) ( not ( = ?auto_76031 ?auto_76028 ) ) ( ON ?auto_76032 ?auto_76031 ) ( CLEAR ?auto_76032 ) ( HOLDING ?auto_76027 ) ( CLEAR ?auto_76028 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76029 ?auto_76028 ?auto_76027 )
      ( MAKE-1PILE ?auto_76026 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76033 - BLOCK
    )
    :vars
    (
      ?auto_76037 - BLOCK
      ?auto_76035 - BLOCK
      ?auto_76038 - BLOCK
      ?auto_76034 - BLOCK
      ?auto_76039 - BLOCK
      ?auto_76036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76037 ?auto_76033 ) ( ON-TABLE ?auto_76033 ) ( not ( = ?auto_76033 ?auto_76037 ) ) ( not ( = ?auto_76033 ?auto_76035 ) ) ( not ( = ?auto_76033 ?auto_76038 ) ) ( not ( = ?auto_76037 ?auto_76035 ) ) ( not ( = ?auto_76037 ?auto_76038 ) ) ( not ( = ?auto_76035 ?auto_76038 ) ) ( ON ?auto_76035 ?auto_76037 ) ( ON-TABLE ?auto_76034 ) ( ON ?auto_76039 ?auto_76034 ) ( not ( = ?auto_76034 ?auto_76039 ) ) ( not ( = ?auto_76034 ?auto_76036 ) ) ( not ( = ?auto_76034 ?auto_76038 ) ) ( not ( = ?auto_76039 ?auto_76036 ) ) ( not ( = ?auto_76039 ?auto_76038 ) ) ( not ( = ?auto_76036 ?auto_76038 ) ) ( not ( = ?auto_76033 ?auto_76036 ) ) ( not ( = ?auto_76033 ?auto_76034 ) ) ( not ( = ?auto_76033 ?auto_76039 ) ) ( not ( = ?auto_76037 ?auto_76036 ) ) ( not ( = ?auto_76037 ?auto_76034 ) ) ( not ( = ?auto_76037 ?auto_76039 ) ) ( not ( = ?auto_76035 ?auto_76036 ) ) ( not ( = ?auto_76035 ?auto_76034 ) ) ( not ( = ?auto_76035 ?auto_76039 ) ) ( ON ?auto_76038 ?auto_76035 ) ( CLEAR ?auto_76039 ) ( ON ?auto_76036 ?auto_76038 ) ( CLEAR ?auto_76036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76033 ?auto_76037 ?auto_76035 ?auto_76038 )
      ( MAKE-1PILE ?auto_76033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76040 - BLOCK
    )
    :vars
    (
      ?auto_76041 - BLOCK
      ?auto_76045 - BLOCK
      ?auto_76044 - BLOCK
      ?auto_76043 - BLOCK
      ?auto_76046 - BLOCK
      ?auto_76042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76041 ?auto_76040 ) ( ON-TABLE ?auto_76040 ) ( not ( = ?auto_76040 ?auto_76041 ) ) ( not ( = ?auto_76040 ?auto_76045 ) ) ( not ( = ?auto_76040 ?auto_76044 ) ) ( not ( = ?auto_76041 ?auto_76045 ) ) ( not ( = ?auto_76041 ?auto_76044 ) ) ( not ( = ?auto_76045 ?auto_76044 ) ) ( ON ?auto_76045 ?auto_76041 ) ( ON-TABLE ?auto_76043 ) ( not ( = ?auto_76043 ?auto_76046 ) ) ( not ( = ?auto_76043 ?auto_76042 ) ) ( not ( = ?auto_76043 ?auto_76044 ) ) ( not ( = ?auto_76046 ?auto_76042 ) ) ( not ( = ?auto_76046 ?auto_76044 ) ) ( not ( = ?auto_76042 ?auto_76044 ) ) ( not ( = ?auto_76040 ?auto_76042 ) ) ( not ( = ?auto_76040 ?auto_76043 ) ) ( not ( = ?auto_76040 ?auto_76046 ) ) ( not ( = ?auto_76041 ?auto_76042 ) ) ( not ( = ?auto_76041 ?auto_76043 ) ) ( not ( = ?auto_76041 ?auto_76046 ) ) ( not ( = ?auto_76045 ?auto_76042 ) ) ( not ( = ?auto_76045 ?auto_76043 ) ) ( not ( = ?auto_76045 ?auto_76046 ) ) ( ON ?auto_76044 ?auto_76045 ) ( ON ?auto_76042 ?auto_76044 ) ( CLEAR ?auto_76042 ) ( HOLDING ?auto_76046 ) ( CLEAR ?auto_76043 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76043 ?auto_76046 )
      ( MAKE-1PILE ?auto_76040 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76047 - BLOCK
    )
    :vars
    (
      ?auto_76049 - BLOCK
      ?auto_76048 - BLOCK
      ?auto_76052 - BLOCK
      ?auto_76051 - BLOCK
      ?auto_76050 - BLOCK
      ?auto_76053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76049 ?auto_76047 ) ( ON-TABLE ?auto_76047 ) ( not ( = ?auto_76047 ?auto_76049 ) ) ( not ( = ?auto_76047 ?auto_76048 ) ) ( not ( = ?auto_76047 ?auto_76052 ) ) ( not ( = ?auto_76049 ?auto_76048 ) ) ( not ( = ?auto_76049 ?auto_76052 ) ) ( not ( = ?auto_76048 ?auto_76052 ) ) ( ON ?auto_76048 ?auto_76049 ) ( ON-TABLE ?auto_76051 ) ( not ( = ?auto_76051 ?auto_76050 ) ) ( not ( = ?auto_76051 ?auto_76053 ) ) ( not ( = ?auto_76051 ?auto_76052 ) ) ( not ( = ?auto_76050 ?auto_76053 ) ) ( not ( = ?auto_76050 ?auto_76052 ) ) ( not ( = ?auto_76053 ?auto_76052 ) ) ( not ( = ?auto_76047 ?auto_76053 ) ) ( not ( = ?auto_76047 ?auto_76051 ) ) ( not ( = ?auto_76047 ?auto_76050 ) ) ( not ( = ?auto_76049 ?auto_76053 ) ) ( not ( = ?auto_76049 ?auto_76051 ) ) ( not ( = ?auto_76049 ?auto_76050 ) ) ( not ( = ?auto_76048 ?auto_76053 ) ) ( not ( = ?auto_76048 ?auto_76051 ) ) ( not ( = ?auto_76048 ?auto_76050 ) ) ( ON ?auto_76052 ?auto_76048 ) ( ON ?auto_76053 ?auto_76052 ) ( CLEAR ?auto_76051 ) ( ON ?auto_76050 ?auto_76053 ) ( CLEAR ?auto_76050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76047 ?auto_76049 ?auto_76048 ?auto_76052 ?auto_76053 )
      ( MAKE-1PILE ?auto_76047 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76054 - BLOCK
    )
    :vars
    (
      ?auto_76059 - BLOCK
      ?auto_76056 - BLOCK
      ?auto_76055 - BLOCK
      ?auto_76058 - BLOCK
      ?auto_76057 - BLOCK
      ?auto_76060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76059 ?auto_76054 ) ( ON-TABLE ?auto_76054 ) ( not ( = ?auto_76054 ?auto_76059 ) ) ( not ( = ?auto_76054 ?auto_76056 ) ) ( not ( = ?auto_76054 ?auto_76055 ) ) ( not ( = ?auto_76059 ?auto_76056 ) ) ( not ( = ?auto_76059 ?auto_76055 ) ) ( not ( = ?auto_76056 ?auto_76055 ) ) ( ON ?auto_76056 ?auto_76059 ) ( not ( = ?auto_76058 ?auto_76057 ) ) ( not ( = ?auto_76058 ?auto_76060 ) ) ( not ( = ?auto_76058 ?auto_76055 ) ) ( not ( = ?auto_76057 ?auto_76060 ) ) ( not ( = ?auto_76057 ?auto_76055 ) ) ( not ( = ?auto_76060 ?auto_76055 ) ) ( not ( = ?auto_76054 ?auto_76060 ) ) ( not ( = ?auto_76054 ?auto_76058 ) ) ( not ( = ?auto_76054 ?auto_76057 ) ) ( not ( = ?auto_76059 ?auto_76060 ) ) ( not ( = ?auto_76059 ?auto_76058 ) ) ( not ( = ?auto_76059 ?auto_76057 ) ) ( not ( = ?auto_76056 ?auto_76060 ) ) ( not ( = ?auto_76056 ?auto_76058 ) ) ( not ( = ?auto_76056 ?auto_76057 ) ) ( ON ?auto_76055 ?auto_76056 ) ( ON ?auto_76060 ?auto_76055 ) ( ON ?auto_76057 ?auto_76060 ) ( CLEAR ?auto_76057 ) ( HOLDING ?auto_76058 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76058 )
      ( MAKE-1PILE ?auto_76054 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76069 - BLOCK
    )
    :vars
    (
      ?auto_76073 - BLOCK
      ?auto_76075 - BLOCK
      ?auto_76072 - BLOCK
      ?auto_76070 - BLOCK
      ?auto_76074 - BLOCK
      ?auto_76071 - BLOCK
      ?auto_76076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76073 ?auto_76069 ) ( ON-TABLE ?auto_76069 ) ( not ( = ?auto_76069 ?auto_76073 ) ) ( not ( = ?auto_76069 ?auto_76075 ) ) ( not ( = ?auto_76069 ?auto_76072 ) ) ( not ( = ?auto_76073 ?auto_76075 ) ) ( not ( = ?auto_76073 ?auto_76072 ) ) ( not ( = ?auto_76075 ?auto_76072 ) ) ( ON ?auto_76075 ?auto_76073 ) ( not ( = ?auto_76070 ?auto_76074 ) ) ( not ( = ?auto_76070 ?auto_76071 ) ) ( not ( = ?auto_76070 ?auto_76072 ) ) ( not ( = ?auto_76074 ?auto_76071 ) ) ( not ( = ?auto_76074 ?auto_76072 ) ) ( not ( = ?auto_76071 ?auto_76072 ) ) ( not ( = ?auto_76069 ?auto_76071 ) ) ( not ( = ?auto_76069 ?auto_76070 ) ) ( not ( = ?auto_76069 ?auto_76074 ) ) ( not ( = ?auto_76073 ?auto_76071 ) ) ( not ( = ?auto_76073 ?auto_76070 ) ) ( not ( = ?auto_76073 ?auto_76074 ) ) ( not ( = ?auto_76075 ?auto_76071 ) ) ( not ( = ?auto_76075 ?auto_76070 ) ) ( not ( = ?auto_76075 ?auto_76074 ) ) ( ON ?auto_76072 ?auto_76075 ) ( ON ?auto_76071 ?auto_76072 ) ( ON ?auto_76074 ?auto_76071 ) ( CLEAR ?auto_76074 ) ( ON ?auto_76070 ?auto_76076 ) ( CLEAR ?auto_76070 ) ( HAND-EMPTY ) ( not ( = ?auto_76069 ?auto_76076 ) ) ( not ( = ?auto_76073 ?auto_76076 ) ) ( not ( = ?auto_76075 ?auto_76076 ) ) ( not ( = ?auto_76072 ?auto_76076 ) ) ( not ( = ?auto_76070 ?auto_76076 ) ) ( not ( = ?auto_76074 ?auto_76076 ) ) ( not ( = ?auto_76071 ?auto_76076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76070 ?auto_76076 )
      ( MAKE-1PILE ?auto_76069 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76077 - BLOCK
    )
    :vars
    (
      ?auto_76081 - BLOCK
      ?auto_76080 - BLOCK
      ?auto_76082 - BLOCK
      ?auto_76079 - BLOCK
      ?auto_76083 - BLOCK
      ?auto_76084 - BLOCK
      ?auto_76078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76081 ?auto_76077 ) ( ON-TABLE ?auto_76077 ) ( not ( = ?auto_76077 ?auto_76081 ) ) ( not ( = ?auto_76077 ?auto_76080 ) ) ( not ( = ?auto_76077 ?auto_76082 ) ) ( not ( = ?auto_76081 ?auto_76080 ) ) ( not ( = ?auto_76081 ?auto_76082 ) ) ( not ( = ?auto_76080 ?auto_76082 ) ) ( ON ?auto_76080 ?auto_76081 ) ( not ( = ?auto_76079 ?auto_76083 ) ) ( not ( = ?auto_76079 ?auto_76084 ) ) ( not ( = ?auto_76079 ?auto_76082 ) ) ( not ( = ?auto_76083 ?auto_76084 ) ) ( not ( = ?auto_76083 ?auto_76082 ) ) ( not ( = ?auto_76084 ?auto_76082 ) ) ( not ( = ?auto_76077 ?auto_76084 ) ) ( not ( = ?auto_76077 ?auto_76079 ) ) ( not ( = ?auto_76077 ?auto_76083 ) ) ( not ( = ?auto_76081 ?auto_76084 ) ) ( not ( = ?auto_76081 ?auto_76079 ) ) ( not ( = ?auto_76081 ?auto_76083 ) ) ( not ( = ?auto_76080 ?auto_76084 ) ) ( not ( = ?auto_76080 ?auto_76079 ) ) ( not ( = ?auto_76080 ?auto_76083 ) ) ( ON ?auto_76082 ?auto_76080 ) ( ON ?auto_76084 ?auto_76082 ) ( ON ?auto_76079 ?auto_76078 ) ( CLEAR ?auto_76079 ) ( not ( = ?auto_76077 ?auto_76078 ) ) ( not ( = ?auto_76081 ?auto_76078 ) ) ( not ( = ?auto_76080 ?auto_76078 ) ) ( not ( = ?auto_76082 ?auto_76078 ) ) ( not ( = ?auto_76079 ?auto_76078 ) ) ( not ( = ?auto_76083 ?auto_76078 ) ) ( not ( = ?auto_76084 ?auto_76078 ) ) ( HOLDING ?auto_76083 ) ( CLEAR ?auto_76084 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76077 ?auto_76081 ?auto_76080 ?auto_76082 ?auto_76084 ?auto_76083 )
      ( MAKE-1PILE ?auto_76077 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76085 - BLOCK
    )
    :vars
    (
      ?auto_76091 - BLOCK
      ?auto_76089 - BLOCK
      ?auto_76090 - BLOCK
      ?auto_76088 - BLOCK
      ?auto_76086 - BLOCK
      ?auto_76092 - BLOCK
      ?auto_76087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76091 ?auto_76085 ) ( ON-TABLE ?auto_76085 ) ( not ( = ?auto_76085 ?auto_76091 ) ) ( not ( = ?auto_76085 ?auto_76089 ) ) ( not ( = ?auto_76085 ?auto_76090 ) ) ( not ( = ?auto_76091 ?auto_76089 ) ) ( not ( = ?auto_76091 ?auto_76090 ) ) ( not ( = ?auto_76089 ?auto_76090 ) ) ( ON ?auto_76089 ?auto_76091 ) ( not ( = ?auto_76088 ?auto_76086 ) ) ( not ( = ?auto_76088 ?auto_76092 ) ) ( not ( = ?auto_76088 ?auto_76090 ) ) ( not ( = ?auto_76086 ?auto_76092 ) ) ( not ( = ?auto_76086 ?auto_76090 ) ) ( not ( = ?auto_76092 ?auto_76090 ) ) ( not ( = ?auto_76085 ?auto_76092 ) ) ( not ( = ?auto_76085 ?auto_76088 ) ) ( not ( = ?auto_76085 ?auto_76086 ) ) ( not ( = ?auto_76091 ?auto_76092 ) ) ( not ( = ?auto_76091 ?auto_76088 ) ) ( not ( = ?auto_76091 ?auto_76086 ) ) ( not ( = ?auto_76089 ?auto_76092 ) ) ( not ( = ?auto_76089 ?auto_76088 ) ) ( not ( = ?auto_76089 ?auto_76086 ) ) ( ON ?auto_76090 ?auto_76089 ) ( ON ?auto_76092 ?auto_76090 ) ( ON ?auto_76088 ?auto_76087 ) ( not ( = ?auto_76085 ?auto_76087 ) ) ( not ( = ?auto_76091 ?auto_76087 ) ) ( not ( = ?auto_76089 ?auto_76087 ) ) ( not ( = ?auto_76090 ?auto_76087 ) ) ( not ( = ?auto_76088 ?auto_76087 ) ) ( not ( = ?auto_76086 ?auto_76087 ) ) ( not ( = ?auto_76092 ?auto_76087 ) ) ( CLEAR ?auto_76092 ) ( ON ?auto_76086 ?auto_76088 ) ( CLEAR ?auto_76086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76087 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76087 ?auto_76088 )
      ( MAKE-1PILE ?auto_76085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76093 - BLOCK
    )
    :vars
    (
      ?auto_76098 - BLOCK
      ?auto_76094 - BLOCK
      ?auto_76095 - BLOCK
      ?auto_76096 - BLOCK
      ?auto_76099 - BLOCK
      ?auto_76097 - BLOCK
      ?auto_76100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76098 ?auto_76093 ) ( ON-TABLE ?auto_76093 ) ( not ( = ?auto_76093 ?auto_76098 ) ) ( not ( = ?auto_76093 ?auto_76094 ) ) ( not ( = ?auto_76093 ?auto_76095 ) ) ( not ( = ?auto_76098 ?auto_76094 ) ) ( not ( = ?auto_76098 ?auto_76095 ) ) ( not ( = ?auto_76094 ?auto_76095 ) ) ( ON ?auto_76094 ?auto_76098 ) ( not ( = ?auto_76096 ?auto_76099 ) ) ( not ( = ?auto_76096 ?auto_76097 ) ) ( not ( = ?auto_76096 ?auto_76095 ) ) ( not ( = ?auto_76099 ?auto_76097 ) ) ( not ( = ?auto_76099 ?auto_76095 ) ) ( not ( = ?auto_76097 ?auto_76095 ) ) ( not ( = ?auto_76093 ?auto_76097 ) ) ( not ( = ?auto_76093 ?auto_76096 ) ) ( not ( = ?auto_76093 ?auto_76099 ) ) ( not ( = ?auto_76098 ?auto_76097 ) ) ( not ( = ?auto_76098 ?auto_76096 ) ) ( not ( = ?auto_76098 ?auto_76099 ) ) ( not ( = ?auto_76094 ?auto_76097 ) ) ( not ( = ?auto_76094 ?auto_76096 ) ) ( not ( = ?auto_76094 ?auto_76099 ) ) ( ON ?auto_76095 ?auto_76094 ) ( ON ?auto_76096 ?auto_76100 ) ( not ( = ?auto_76093 ?auto_76100 ) ) ( not ( = ?auto_76098 ?auto_76100 ) ) ( not ( = ?auto_76094 ?auto_76100 ) ) ( not ( = ?auto_76095 ?auto_76100 ) ) ( not ( = ?auto_76096 ?auto_76100 ) ) ( not ( = ?auto_76099 ?auto_76100 ) ) ( not ( = ?auto_76097 ?auto_76100 ) ) ( ON ?auto_76099 ?auto_76096 ) ( CLEAR ?auto_76099 ) ( ON-TABLE ?auto_76100 ) ( HOLDING ?auto_76097 ) ( CLEAR ?auto_76095 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76093 ?auto_76098 ?auto_76094 ?auto_76095 ?auto_76097 )
      ( MAKE-1PILE ?auto_76093 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76139 - BLOCK
      ?auto_76140 - BLOCK
      ?auto_76141 - BLOCK
      ?auto_76142 - BLOCK
      ?auto_76143 - BLOCK
      ?auto_76144 - BLOCK
    )
    :vars
    (
      ?auto_76145 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76139 ) ( ON ?auto_76140 ?auto_76139 ) ( ON ?auto_76141 ?auto_76140 ) ( ON ?auto_76142 ?auto_76141 ) ( not ( = ?auto_76139 ?auto_76140 ) ) ( not ( = ?auto_76139 ?auto_76141 ) ) ( not ( = ?auto_76139 ?auto_76142 ) ) ( not ( = ?auto_76139 ?auto_76143 ) ) ( not ( = ?auto_76139 ?auto_76144 ) ) ( not ( = ?auto_76140 ?auto_76141 ) ) ( not ( = ?auto_76140 ?auto_76142 ) ) ( not ( = ?auto_76140 ?auto_76143 ) ) ( not ( = ?auto_76140 ?auto_76144 ) ) ( not ( = ?auto_76141 ?auto_76142 ) ) ( not ( = ?auto_76141 ?auto_76143 ) ) ( not ( = ?auto_76141 ?auto_76144 ) ) ( not ( = ?auto_76142 ?auto_76143 ) ) ( not ( = ?auto_76142 ?auto_76144 ) ) ( not ( = ?auto_76143 ?auto_76144 ) ) ( ON ?auto_76144 ?auto_76145 ) ( not ( = ?auto_76139 ?auto_76145 ) ) ( not ( = ?auto_76140 ?auto_76145 ) ) ( not ( = ?auto_76141 ?auto_76145 ) ) ( not ( = ?auto_76142 ?auto_76145 ) ) ( not ( = ?auto_76143 ?auto_76145 ) ) ( not ( = ?auto_76144 ?auto_76145 ) ) ( CLEAR ?auto_76142 ) ( ON ?auto_76143 ?auto_76144 ) ( CLEAR ?auto_76143 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76145 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76145 ?auto_76144 )
      ( MAKE-6PILE ?auto_76139 ?auto_76140 ?auto_76141 ?auto_76142 ?auto_76143 ?auto_76144 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76146 - BLOCK
      ?auto_76147 - BLOCK
      ?auto_76148 - BLOCK
      ?auto_76149 - BLOCK
      ?auto_76150 - BLOCK
      ?auto_76151 - BLOCK
    )
    :vars
    (
      ?auto_76152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76146 ) ( ON ?auto_76147 ?auto_76146 ) ( ON ?auto_76148 ?auto_76147 ) ( not ( = ?auto_76146 ?auto_76147 ) ) ( not ( = ?auto_76146 ?auto_76148 ) ) ( not ( = ?auto_76146 ?auto_76149 ) ) ( not ( = ?auto_76146 ?auto_76150 ) ) ( not ( = ?auto_76146 ?auto_76151 ) ) ( not ( = ?auto_76147 ?auto_76148 ) ) ( not ( = ?auto_76147 ?auto_76149 ) ) ( not ( = ?auto_76147 ?auto_76150 ) ) ( not ( = ?auto_76147 ?auto_76151 ) ) ( not ( = ?auto_76148 ?auto_76149 ) ) ( not ( = ?auto_76148 ?auto_76150 ) ) ( not ( = ?auto_76148 ?auto_76151 ) ) ( not ( = ?auto_76149 ?auto_76150 ) ) ( not ( = ?auto_76149 ?auto_76151 ) ) ( not ( = ?auto_76150 ?auto_76151 ) ) ( ON ?auto_76151 ?auto_76152 ) ( not ( = ?auto_76146 ?auto_76152 ) ) ( not ( = ?auto_76147 ?auto_76152 ) ) ( not ( = ?auto_76148 ?auto_76152 ) ) ( not ( = ?auto_76149 ?auto_76152 ) ) ( not ( = ?auto_76150 ?auto_76152 ) ) ( not ( = ?auto_76151 ?auto_76152 ) ) ( ON ?auto_76150 ?auto_76151 ) ( CLEAR ?auto_76150 ) ( ON-TABLE ?auto_76152 ) ( HOLDING ?auto_76149 ) ( CLEAR ?auto_76148 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76146 ?auto_76147 ?auto_76148 ?auto_76149 )
      ( MAKE-6PILE ?auto_76146 ?auto_76147 ?auto_76148 ?auto_76149 ?auto_76150 ?auto_76151 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76153 - BLOCK
      ?auto_76154 - BLOCK
      ?auto_76155 - BLOCK
      ?auto_76156 - BLOCK
      ?auto_76157 - BLOCK
      ?auto_76158 - BLOCK
    )
    :vars
    (
      ?auto_76159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76153 ) ( ON ?auto_76154 ?auto_76153 ) ( ON ?auto_76155 ?auto_76154 ) ( not ( = ?auto_76153 ?auto_76154 ) ) ( not ( = ?auto_76153 ?auto_76155 ) ) ( not ( = ?auto_76153 ?auto_76156 ) ) ( not ( = ?auto_76153 ?auto_76157 ) ) ( not ( = ?auto_76153 ?auto_76158 ) ) ( not ( = ?auto_76154 ?auto_76155 ) ) ( not ( = ?auto_76154 ?auto_76156 ) ) ( not ( = ?auto_76154 ?auto_76157 ) ) ( not ( = ?auto_76154 ?auto_76158 ) ) ( not ( = ?auto_76155 ?auto_76156 ) ) ( not ( = ?auto_76155 ?auto_76157 ) ) ( not ( = ?auto_76155 ?auto_76158 ) ) ( not ( = ?auto_76156 ?auto_76157 ) ) ( not ( = ?auto_76156 ?auto_76158 ) ) ( not ( = ?auto_76157 ?auto_76158 ) ) ( ON ?auto_76158 ?auto_76159 ) ( not ( = ?auto_76153 ?auto_76159 ) ) ( not ( = ?auto_76154 ?auto_76159 ) ) ( not ( = ?auto_76155 ?auto_76159 ) ) ( not ( = ?auto_76156 ?auto_76159 ) ) ( not ( = ?auto_76157 ?auto_76159 ) ) ( not ( = ?auto_76158 ?auto_76159 ) ) ( ON ?auto_76157 ?auto_76158 ) ( ON-TABLE ?auto_76159 ) ( CLEAR ?auto_76155 ) ( ON ?auto_76156 ?auto_76157 ) ( CLEAR ?auto_76156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76159 ?auto_76158 ?auto_76157 )
      ( MAKE-6PILE ?auto_76153 ?auto_76154 ?auto_76155 ?auto_76156 ?auto_76157 ?auto_76158 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76160 - BLOCK
      ?auto_76161 - BLOCK
      ?auto_76162 - BLOCK
      ?auto_76163 - BLOCK
      ?auto_76164 - BLOCK
      ?auto_76165 - BLOCK
    )
    :vars
    (
      ?auto_76166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76160 ) ( ON ?auto_76161 ?auto_76160 ) ( not ( = ?auto_76160 ?auto_76161 ) ) ( not ( = ?auto_76160 ?auto_76162 ) ) ( not ( = ?auto_76160 ?auto_76163 ) ) ( not ( = ?auto_76160 ?auto_76164 ) ) ( not ( = ?auto_76160 ?auto_76165 ) ) ( not ( = ?auto_76161 ?auto_76162 ) ) ( not ( = ?auto_76161 ?auto_76163 ) ) ( not ( = ?auto_76161 ?auto_76164 ) ) ( not ( = ?auto_76161 ?auto_76165 ) ) ( not ( = ?auto_76162 ?auto_76163 ) ) ( not ( = ?auto_76162 ?auto_76164 ) ) ( not ( = ?auto_76162 ?auto_76165 ) ) ( not ( = ?auto_76163 ?auto_76164 ) ) ( not ( = ?auto_76163 ?auto_76165 ) ) ( not ( = ?auto_76164 ?auto_76165 ) ) ( ON ?auto_76165 ?auto_76166 ) ( not ( = ?auto_76160 ?auto_76166 ) ) ( not ( = ?auto_76161 ?auto_76166 ) ) ( not ( = ?auto_76162 ?auto_76166 ) ) ( not ( = ?auto_76163 ?auto_76166 ) ) ( not ( = ?auto_76164 ?auto_76166 ) ) ( not ( = ?auto_76165 ?auto_76166 ) ) ( ON ?auto_76164 ?auto_76165 ) ( ON-TABLE ?auto_76166 ) ( ON ?auto_76163 ?auto_76164 ) ( CLEAR ?auto_76163 ) ( HOLDING ?auto_76162 ) ( CLEAR ?auto_76161 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76160 ?auto_76161 ?auto_76162 )
      ( MAKE-6PILE ?auto_76160 ?auto_76161 ?auto_76162 ?auto_76163 ?auto_76164 ?auto_76165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76167 - BLOCK
      ?auto_76168 - BLOCK
      ?auto_76169 - BLOCK
      ?auto_76170 - BLOCK
      ?auto_76171 - BLOCK
      ?auto_76172 - BLOCK
    )
    :vars
    (
      ?auto_76173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76167 ) ( ON ?auto_76168 ?auto_76167 ) ( not ( = ?auto_76167 ?auto_76168 ) ) ( not ( = ?auto_76167 ?auto_76169 ) ) ( not ( = ?auto_76167 ?auto_76170 ) ) ( not ( = ?auto_76167 ?auto_76171 ) ) ( not ( = ?auto_76167 ?auto_76172 ) ) ( not ( = ?auto_76168 ?auto_76169 ) ) ( not ( = ?auto_76168 ?auto_76170 ) ) ( not ( = ?auto_76168 ?auto_76171 ) ) ( not ( = ?auto_76168 ?auto_76172 ) ) ( not ( = ?auto_76169 ?auto_76170 ) ) ( not ( = ?auto_76169 ?auto_76171 ) ) ( not ( = ?auto_76169 ?auto_76172 ) ) ( not ( = ?auto_76170 ?auto_76171 ) ) ( not ( = ?auto_76170 ?auto_76172 ) ) ( not ( = ?auto_76171 ?auto_76172 ) ) ( ON ?auto_76172 ?auto_76173 ) ( not ( = ?auto_76167 ?auto_76173 ) ) ( not ( = ?auto_76168 ?auto_76173 ) ) ( not ( = ?auto_76169 ?auto_76173 ) ) ( not ( = ?auto_76170 ?auto_76173 ) ) ( not ( = ?auto_76171 ?auto_76173 ) ) ( not ( = ?auto_76172 ?auto_76173 ) ) ( ON ?auto_76171 ?auto_76172 ) ( ON-TABLE ?auto_76173 ) ( ON ?auto_76170 ?auto_76171 ) ( CLEAR ?auto_76168 ) ( ON ?auto_76169 ?auto_76170 ) ( CLEAR ?auto_76169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76173 ?auto_76172 ?auto_76171 ?auto_76170 )
      ( MAKE-6PILE ?auto_76167 ?auto_76168 ?auto_76169 ?auto_76170 ?auto_76171 ?auto_76172 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76174 - BLOCK
      ?auto_76175 - BLOCK
      ?auto_76176 - BLOCK
      ?auto_76177 - BLOCK
      ?auto_76178 - BLOCK
      ?auto_76179 - BLOCK
    )
    :vars
    (
      ?auto_76180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76174 ) ( not ( = ?auto_76174 ?auto_76175 ) ) ( not ( = ?auto_76174 ?auto_76176 ) ) ( not ( = ?auto_76174 ?auto_76177 ) ) ( not ( = ?auto_76174 ?auto_76178 ) ) ( not ( = ?auto_76174 ?auto_76179 ) ) ( not ( = ?auto_76175 ?auto_76176 ) ) ( not ( = ?auto_76175 ?auto_76177 ) ) ( not ( = ?auto_76175 ?auto_76178 ) ) ( not ( = ?auto_76175 ?auto_76179 ) ) ( not ( = ?auto_76176 ?auto_76177 ) ) ( not ( = ?auto_76176 ?auto_76178 ) ) ( not ( = ?auto_76176 ?auto_76179 ) ) ( not ( = ?auto_76177 ?auto_76178 ) ) ( not ( = ?auto_76177 ?auto_76179 ) ) ( not ( = ?auto_76178 ?auto_76179 ) ) ( ON ?auto_76179 ?auto_76180 ) ( not ( = ?auto_76174 ?auto_76180 ) ) ( not ( = ?auto_76175 ?auto_76180 ) ) ( not ( = ?auto_76176 ?auto_76180 ) ) ( not ( = ?auto_76177 ?auto_76180 ) ) ( not ( = ?auto_76178 ?auto_76180 ) ) ( not ( = ?auto_76179 ?auto_76180 ) ) ( ON ?auto_76178 ?auto_76179 ) ( ON-TABLE ?auto_76180 ) ( ON ?auto_76177 ?auto_76178 ) ( ON ?auto_76176 ?auto_76177 ) ( CLEAR ?auto_76176 ) ( HOLDING ?auto_76175 ) ( CLEAR ?auto_76174 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76174 ?auto_76175 )
      ( MAKE-6PILE ?auto_76174 ?auto_76175 ?auto_76176 ?auto_76177 ?auto_76178 ?auto_76179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76181 - BLOCK
      ?auto_76182 - BLOCK
      ?auto_76183 - BLOCK
      ?auto_76184 - BLOCK
      ?auto_76185 - BLOCK
      ?auto_76186 - BLOCK
    )
    :vars
    (
      ?auto_76187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76181 ) ( not ( = ?auto_76181 ?auto_76182 ) ) ( not ( = ?auto_76181 ?auto_76183 ) ) ( not ( = ?auto_76181 ?auto_76184 ) ) ( not ( = ?auto_76181 ?auto_76185 ) ) ( not ( = ?auto_76181 ?auto_76186 ) ) ( not ( = ?auto_76182 ?auto_76183 ) ) ( not ( = ?auto_76182 ?auto_76184 ) ) ( not ( = ?auto_76182 ?auto_76185 ) ) ( not ( = ?auto_76182 ?auto_76186 ) ) ( not ( = ?auto_76183 ?auto_76184 ) ) ( not ( = ?auto_76183 ?auto_76185 ) ) ( not ( = ?auto_76183 ?auto_76186 ) ) ( not ( = ?auto_76184 ?auto_76185 ) ) ( not ( = ?auto_76184 ?auto_76186 ) ) ( not ( = ?auto_76185 ?auto_76186 ) ) ( ON ?auto_76186 ?auto_76187 ) ( not ( = ?auto_76181 ?auto_76187 ) ) ( not ( = ?auto_76182 ?auto_76187 ) ) ( not ( = ?auto_76183 ?auto_76187 ) ) ( not ( = ?auto_76184 ?auto_76187 ) ) ( not ( = ?auto_76185 ?auto_76187 ) ) ( not ( = ?auto_76186 ?auto_76187 ) ) ( ON ?auto_76185 ?auto_76186 ) ( ON-TABLE ?auto_76187 ) ( ON ?auto_76184 ?auto_76185 ) ( ON ?auto_76183 ?auto_76184 ) ( CLEAR ?auto_76181 ) ( ON ?auto_76182 ?auto_76183 ) ( CLEAR ?auto_76182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76187 ?auto_76186 ?auto_76185 ?auto_76184 ?auto_76183 )
      ( MAKE-6PILE ?auto_76181 ?auto_76182 ?auto_76183 ?auto_76184 ?auto_76185 ?auto_76186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76188 - BLOCK
      ?auto_76189 - BLOCK
      ?auto_76190 - BLOCK
      ?auto_76191 - BLOCK
      ?auto_76192 - BLOCK
      ?auto_76193 - BLOCK
    )
    :vars
    (
      ?auto_76194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76188 ?auto_76189 ) ) ( not ( = ?auto_76188 ?auto_76190 ) ) ( not ( = ?auto_76188 ?auto_76191 ) ) ( not ( = ?auto_76188 ?auto_76192 ) ) ( not ( = ?auto_76188 ?auto_76193 ) ) ( not ( = ?auto_76189 ?auto_76190 ) ) ( not ( = ?auto_76189 ?auto_76191 ) ) ( not ( = ?auto_76189 ?auto_76192 ) ) ( not ( = ?auto_76189 ?auto_76193 ) ) ( not ( = ?auto_76190 ?auto_76191 ) ) ( not ( = ?auto_76190 ?auto_76192 ) ) ( not ( = ?auto_76190 ?auto_76193 ) ) ( not ( = ?auto_76191 ?auto_76192 ) ) ( not ( = ?auto_76191 ?auto_76193 ) ) ( not ( = ?auto_76192 ?auto_76193 ) ) ( ON ?auto_76193 ?auto_76194 ) ( not ( = ?auto_76188 ?auto_76194 ) ) ( not ( = ?auto_76189 ?auto_76194 ) ) ( not ( = ?auto_76190 ?auto_76194 ) ) ( not ( = ?auto_76191 ?auto_76194 ) ) ( not ( = ?auto_76192 ?auto_76194 ) ) ( not ( = ?auto_76193 ?auto_76194 ) ) ( ON ?auto_76192 ?auto_76193 ) ( ON-TABLE ?auto_76194 ) ( ON ?auto_76191 ?auto_76192 ) ( ON ?auto_76190 ?auto_76191 ) ( ON ?auto_76189 ?auto_76190 ) ( CLEAR ?auto_76189 ) ( HOLDING ?auto_76188 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76188 )
      ( MAKE-6PILE ?auto_76188 ?auto_76189 ?auto_76190 ?auto_76191 ?auto_76192 ?auto_76193 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76195 - BLOCK
      ?auto_76196 - BLOCK
      ?auto_76197 - BLOCK
      ?auto_76198 - BLOCK
      ?auto_76199 - BLOCK
      ?auto_76200 - BLOCK
    )
    :vars
    (
      ?auto_76201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76195 ?auto_76196 ) ) ( not ( = ?auto_76195 ?auto_76197 ) ) ( not ( = ?auto_76195 ?auto_76198 ) ) ( not ( = ?auto_76195 ?auto_76199 ) ) ( not ( = ?auto_76195 ?auto_76200 ) ) ( not ( = ?auto_76196 ?auto_76197 ) ) ( not ( = ?auto_76196 ?auto_76198 ) ) ( not ( = ?auto_76196 ?auto_76199 ) ) ( not ( = ?auto_76196 ?auto_76200 ) ) ( not ( = ?auto_76197 ?auto_76198 ) ) ( not ( = ?auto_76197 ?auto_76199 ) ) ( not ( = ?auto_76197 ?auto_76200 ) ) ( not ( = ?auto_76198 ?auto_76199 ) ) ( not ( = ?auto_76198 ?auto_76200 ) ) ( not ( = ?auto_76199 ?auto_76200 ) ) ( ON ?auto_76200 ?auto_76201 ) ( not ( = ?auto_76195 ?auto_76201 ) ) ( not ( = ?auto_76196 ?auto_76201 ) ) ( not ( = ?auto_76197 ?auto_76201 ) ) ( not ( = ?auto_76198 ?auto_76201 ) ) ( not ( = ?auto_76199 ?auto_76201 ) ) ( not ( = ?auto_76200 ?auto_76201 ) ) ( ON ?auto_76199 ?auto_76200 ) ( ON-TABLE ?auto_76201 ) ( ON ?auto_76198 ?auto_76199 ) ( ON ?auto_76197 ?auto_76198 ) ( ON ?auto_76196 ?auto_76197 ) ( ON ?auto_76195 ?auto_76196 ) ( CLEAR ?auto_76195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76201 ?auto_76200 ?auto_76199 ?auto_76198 ?auto_76197 ?auto_76196 )
      ( MAKE-6PILE ?auto_76195 ?auto_76196 ?auto_76197 ?auto_76198 ?auto_76199 ?auto_76200 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76208 - BLOCK
      ?auto_76209 - BLOCK
      ?auto_76210 - BLOCK
      ?auto_76211 - BLOCK
      ?auto_76212 - BLOCK
      ?auto_76213 - BLOCK
    )
    :vars
    (
      ?auto_76214 - BLOCK
      ?auto_76215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76208 ?auto_76209 ) ) ( not ( = ?auto_76208 ?auto_76210 ) ) ( not ( = ?auto_76208 ?auto_76211 ) ) ( not ( = ?auto_76208 ?auto_76212 ) ) ( not ( = ?auto_76208 ?auto_76213 ) ) ( not ( = ?auto_76209 ?auto_76210 ) ) ( not ( = ?auto_76209 ?auto_76211 ) ) ( not ( = ?auto_76209 ?auto_76212 ) ) ( not ( = ?auto_76209 ?auto_76213 ) ) ( not ( = ?auto_76210 ?auto_76211 ) ) ( not ( = ?auto_76210 ?auto_76212 ) ) ( not ( = ?auto_76210 ?auto_76213 ) ) ( not ( = ?auto_76211 ?auto_76212 ) ) ( not ( = ?auto_76211 ?auto_76213 ) ) ( not ( = ?auto_76212 ?auto_76213 ) ) ( ON ?auto_76213 ?auto_76214 ) ( not ( = ?auto_76208 ?auto_76214 ) ) ( not ( = ?auto_76209 ?auto_76214 ) ) ( not ( = ?auto_76210 ?auto_76214 ) ) ( not ( = ?auto_76211 ?auto_76214 ) ) ( not ( = ?auto_76212 ?auto_76214 ) ) ( not ( = ?auto_76213 ?auto_76214 ) ) ( ON ?auto_76212 ?auto_76213 ) ( ON-TABLE ?auto_76214 ) ( ON ?auto_76211 ?auto_76212 ) ( ON ?auto_76210 ?auto_76211 ) ( ON ?auto_76209 ?auto_76210 ) ( CLEAR ?auto_76209 ) ( ON ?auto_76208 ?auto_76215 ) ( CLEAR ?auto_76208 ) ( HAND-EMPTY ) ( not ( = ?auto_76208 ?auto_76215 ) ) ( not ( = ?auto_76209 ?auto_76215 ) ) ( not ( = ?auto_76210 ?auto_76215 ) ) ( not ( = ?auto_76211 ?auto_76215 ) ) ( not ( = ?auto_76212 ?auto_76215 ) ) ( not ( = ?auto_76213 ?auto_76215 ) ) ( not ( = ?auto_76214 ?auto_76215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76208 ?auto_76215 )
      ( MAKE-6PILE ?auto_76208 ?auto_76209 ?auto_76210 ?auto_76211 ?auto_76212 ?auto_76213 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76216 - BLOCK
      ?auto_76217 - BLOCK
      ?auto_76218 - BLOCK
      ?auto_76219 - BLOCK
      ?auto_76220 - BLOCK
      ?auto_76221 - BLOCK
    )
    :vars
    (
      ?auto_76223 - BLOCK
      ?auto_76222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76216 ?auto_76217 ) ) ( not ( = ?auto_76216 ?auto_76218 ) ) ( not ( = ?auto_76216 ?auto_76219 ) ) ( not ( = ?auto_76216 ?auto_76220 ) ) ( not ( = ?auto_76216 ?auto_76221 ) ) ( not ( = ?auto_76217 ?auto_76218 ) ) ( not ( = ?auto_76217 ?auto_76219 ) ) ( not ( = ?auto_76217 ?auto_76220 ) ) ( not ( = ?auto_76217 ?auto_76221 ) ) ( not ( = ?auto_76218 ?auto_76219 ) ) ( not ( = ?auto_76218 ?auto_76220 ) ) ( not ( = ?auto_76218 ?auto_76221 ) ) ( not ( = ?auto_76219 ?auto_76220 ) ) ( not ( = ?auto_76219 ?auto_76221 ) ) ( not ( = ?auto_76220 ?auto_76221 ) ) ( ON ?auto_76221 ?auto_76223 ) ( not ( = ?auto_76216 ?auto_76223 ) ) ( not ( = ?auto_76217 ?auto_76223 ) ) ( not ( = ?auto_76218 ?auto_76223 ) ) ( not ( = ?auto_76219 ?auto_76223 ) ) ( not ( = ?auto_76220 ?auto_76223 ) ) ( not ( = ?auto_76221 ?auto_76223 ) ) ( ON ?auto_76220 ?auto_76221 ) ( ON-TABLE ?auto_76223 ) ( ON ?auto_76219 ?auto_76220 ) ( ON ?auto_76218 ?auto_76219 ) ( ON ?auto_76216 ?auto_76222 ) ( CLEAR ?auto_76216 ) ( not ( = ?auto_76216 ?auto_76222 ) ) ( not ( = ?auto_76217 ?auto_76222 ) ) ( not ( = ?auto_76218 ?auto_76222 ) ) ( not ( = ?auto_76219 ?auto_76222 ) ) ( not ( = ?auto_76220 ?auto_76222 ) ) ( not ( = ?auto_76221 ?auto_76222 ) ) ( not ( = ?auto_76223 ?auto_76222 ) ) ( HOLDING ?auto_76217 ) ( CLEAR ?auto_76218 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76223 ?auto_76221 ?auto_76220 ?auto_76219 ?auto_76218 ?auto_76217 )
      ( MAKE-6PILE ?auto_76216 ?auto_76217 ?auto_76218 ?auto_76219 ?auto_76220 ?auto_76221 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76224 - BLOCK
      ?auto_76225 - BLOCK
      ?auto_76226 - BLOCK
      ?auto_76227 - BLOCK
      ?auto_76228 - BLOCK
      ?auto_76229 - BLOCK
    )
    :vars
    (
      ?auto_76231 - BLOCK
      ?auto_76230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76224 ?auto_76225 ) ) ( not ( = ?auto_76224 ?auto_76226 ) ) ( not ( = ?auto_76224 ?auto_76227 ) ) ( not ( = ?auto_76224 ?auto_76228 ) ) ( not ( = ?auto_76224 ?auto_76229 ) ) ( not ( = ?auto_76225 ?auto_76226 ) ) ( not ( = ?auto_76225 ?auto_76227 ) ) ( not ( = ?auto_76225 ?auto_76228 ) ) ( not ( = ?auto_76225 ?auto_76229 ) ) ( not ( = ?auto_76226 ?auto_76227 ) ) ( not ( = ?auto_76226 ?auto_76228 ) ) ( not ( = ?auto_76226 ?auto_76229 ) ) ( not ( = ?auto_76227 ?auto_76228 ) ) ( not ( = ?auto_76227 ?auto_76229 ) ) ( not ( = ?auto_76228 ?auto_76229 ) ) ( ON ?auto_76229 ?auto_76231 ) ( not ( = ?auto_76224 ?auto_76231 ) ) ( not ( = ?auto_76225 ?auto_76231 ) ) ( not ( = ?auto_76226 ?auto_76231 ) ) ( not ( = ?auto_76227 ?auto_76231 ) ) ( not ( = ?auto_76228 ?auto_76231 ) ) ( not ( = ?auto_76229 ?auto_76231 ) ) ( ON ?auto_76228 ?auto_76229 ) ( ON-TABLE ?auto_76231 ) ( ON ?auto_76227 ?auto_76228 ) ( ON ?auto_76226 ?auto_76227 ) ( ON ?auto_76224 ?auto_76230 ) ( not ( = ?auto_76224 ?auto_76230 ) ) ( not ( = ?auto_76225 ?auto_76230 ) ) ( not ( = ?auto_76226 ?auto_76230 ) ) ( not ( = ?auto_76227 ?auto_76230 ) ) ( not ( = ?auto_76228 ?auto_76230 ) ) ( not ( = ?auto_76229 ?auto_76230 ) ) ( not ( = ?auto_76231 ?auto_76230 ) ) ( CLEAR ?auto_76226 ) ( ON ?auto_76225 ?auto_76224 ) ( CLEAR ?auto_76225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76230 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76230 ?auto_76224 )
      ( MAKE-6PILE ?auto_76224 ?auto_76225 ?auto_76226 ?auto_76227 ?auto_76228 ?auto_76229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76232 - BLOCK
      ?auto_76233 - BLOCK
      ?auto_76234 - BLOCK
      ?auto_76235 - BLOCK
      ?auto_76236 - BLOCK
      ?auto_76237 - BLOCK
    )
    :vars
    (
      ?auto_76238 - BLOCK
      ?auto_76239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76232 ?auto_76233 ) ) ( not ( = ?auto_76232 ?auto_76234 ) ) ( not ( = ?auto_76232 ?auto_76235 ) ) ( not ( = ?auto_76232 ?auto_76236 ) ) ( not ( = ?auto_76232 ?auto_76237 ) ) ( not ( = ?auto_76233 ?auto_76234 ) ) ( not ( = ?auto_76233 ?auto_76235 ) ) ( not ( = ?auto_76233 ?auto_76236 ) ) ( not ( = ?auto_76233 ?auto_76237 ) ) ( not ( = ?auto_76234 ?auto_76235 ) ) ( not ( = ?auto_76234 ?auto_76236 ) ) ( not ( = ?auto_76234 ?auto_76237 ) ) ( not ( = ?auto_76235 ?auto_76236 ) ) ( not ( = ?auto_76235 ?auto_76237 ) ) ( not ( = ?auto_76236 ?auto_76237 ) ) ( ON ?auto_76237 ?auto_76238 ) ( not ( = ?auto_76232 ?auto_76238 ) ) ( not ( = ?auto_76233 ?auto_76238 ) ) ( not ( = ?auto_76234 ?auto_76238 ) ) ( not ( = ?auto_76235 ?auto_76238 ) ) ( not ( = ?auto_76236 ?auto_76238 ) ) ( not ( = ?auto_76237 ?auto_76238 ) ) ( ON ?auto_76236 ?auto_76237 ) ( ON-TABLE ?auto_76238 ) ( ON ?auto_76235 ?auto_76236 ) ( ON ?auto_76232 ?auto_76239 ) ( not ( = ?auto_76232 ?auto_76239 ) ) ( not ( = ?auto_76233 ?auto_76239 ) ) ( not ( = ?auto_76234 ?auto_76239 ) ) ( not ( = ?auto_76235 ?auto_76239 ) ) ( not ( = ?auto_76236 ?auto_76239 ) ) ( not ( = ?auto_76237 ?auto_76239 ) ) ( not ( = ?auto_76238 ?auto_76239 ) ) ( ON ?auto_76233 ?auto_76232 ) ( CLEAR ?auto_76233 ) ( ON-TABLE ?auto_76239 ) ( HOLDING ?auto_76234 ) ( CLEAR ?auto_76235 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76238 ?auto_76237 ?auto_76236 ?auto_76235 ?auto_76234 )
      ( MAKE-6PILE ?auto_76232 ?auto_76233 ?auto_76234 ?auto_76235 ?auto_76236 ?auto_76237 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76240 - BLOCK
      ?auto_76241 - BLOCK
      ?auto_76242 - BLOCK
      ?auto_76243 - BLOCK
      ?auto_76244 - BLOCK
      ?auto_76245 - BLOCK
    )
    :vars
    (
      ?auto_76247 - BLOCK
      ?auto_76246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76240 ?auto_76241 ) ) ( not ( = ?auto_76240 ?auto_76242 ) ) ( not ( = ?auto_76240 ?auto_76243 ) ) ( not ( = ?auto_76240 ?auto_76244 ) ) ( not ( = ?auto_76240 ?auto_76245 ) ) ( not ( = ?auto_76241 ?auto_76242 ) ) ( not ( = ?auto_76241 ?auto_76243 ) ) ( not ( = ?auto_76241 ?auto_76244 ) ) ( not ( = ?auto_76241 ?auto_76245 ) ) ( not ( = ?auto_76242 ?auto_76243 ) ) ( not ( = ?auto_76242 ?auto_76244 ) ) ( not ( = ?auto_76242 ?auto_76245 ) ) ( not ( = ?auto_76243 ?auto_76244 ) ) ( not ( = ?auto_76243 ?auto_76245 ) ) ( not ( = ?auto_76244 ?auto_76245 ) ) ( ON ?auto_76245 ?auto_76247 ) ( not ( = ?auto_76240 ?auto_76247 ) ) ( not ( = ?auto_76241 ?auto_76247 ) ) ( not ( = ?auto_76242 ?auto_76247 ) ) ( not ( = ?auto_76243 ?auto_76247 ) ) ( not ( = ?auto_76244 ?auto_76247 ) ) ( not ( = ?auto_76245 ?auto_76247 ) ) ( ON ?auto_76244 ?auto_76245 ) ( ON-TABLE ?auto_76247 ) ( ON ?auto_76243 ?auto_76244 ) ( ON ?auto_76240 ?auto_76246 ) ( not ( = ?auto_76240 ?auto_76246 ) ) ( not ( = ?auto_76241 ?auto_76246 ) ) ( not ( = ?auto_76242 ?auto_76246 ) ) ( not ( = ?auto_76243 ?auto_76246 ) ) ( not ( = ?auto_76244 ?auto_76246 ) ) ( not ( = ?auto_76245 ?auto_76246 ) ) ( not ( = ?auto_76247 ?auto_76246 ) ) ( ON ?auto_76241 ?auto_76240 ) ( ON-TABLE ?auto_76246 ) ( CLEAR ?auto_76243 ) ( ON ?auto_76242 ?auto_76241 ) ( CLEAR ?auto_76242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76246 ?auto_76240 ?auto_76241 )
      ( MAKE-6PILE ?auto_76240 ?auto_76241 ?auto_76242 ?auto_76243 ?auto_76244 ?auto_76245 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76248 - BLOCK
      ?auto_76249 - BLOCK
      ?auto_76250 - BLOCK
      ?auto_76251 - BLOCK
      ?auto_76252 - BLOCK
      ?auto_76253 - BLOCK
    )
    :vars
    (
      ?auto_76255 - BLOCK
      ?auto_76254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76248 ?auto_76249 ) ) ( not ( = ?auto_76248 ?auto_76250 ) ) ( not ( = ?auto_76248 ?auto_76251 ) ) ( not ( = ?auto_76248 ?auto_76252 ) ) ( not ( = ?auto_76248 ?auto_76253 ) ) ( not ( = ?auto_76249 ?auto_76250 ) ) ( not ( = ?auto_76249 ?auto_76251 ) ) ( not ( = ?auto_76249 ?auto_76252 ) ) ( not ( = ?auto_76249 ?auto_76253 ) ) ( not ( = ?auto_76250 ?auto_76251 ) ) ( not ( = ?auto_76250 ?auto_76252 ) ) ( not ( = ?auto_76250 ?auto_76253 ) ) ( not ( = ?auto_76251 ?auto_76252 ) ) ( not ( = ?auto_76251 ?auto_76253 ) ) ( not ( = ?auto_76252 ?auto_76253 ) ) ( ON ?auto_76253 ?auto_76255 ) ( not ( = ?auto_76248 ?auto_76255 ) ) ( not ( = ?auto_76249 ?auto_76255 ) ) ( not ( = ?auto_76250 ?auto_76255 ) ) ( not ( = ?auto_76251 ?auto_76255 ) ) ( not ( = ?auto_76252 ?auto_76255 ) ) ( not ( = ?auto_76253 ?auto_76255 ) ) ( ON ?auto_76252 ?auto_76253 ) ( ON-TABLE ?auto_76255 ) ( ON ?auto_76248 ?auto_76254 ) ( not ( = ?auto_76248 ?auto_76254 ) ) ( not ( = ?auto_76249 ?auto_76254 ) ) ( not ( = ?auto_76250 ?auto_76254 ) ) ( not ( = ?auto_76251 ?auto_76254 ) ) ( not ( = ?auto_76252 ?auto_76254 ) ) ( not ( = ?auto_76253 ?auto_76254 ) ) ( not ( = ?auto_76255 ?auto_76254 ) ) ( ON ?auto_76249 ?auto_76248 ) ( ON-TABLE ?auto_76254 ) ( ON ?auto_76250 ?auto_76249 ) ( CLEAR ?auto_76250 ) ( HOLDING ?auto_76251 ) ( CLEAR ?auto_76252 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76255 ?auto_76253 ?auto_76252 ?auto_76251 )
      ( MAKE-6PILE ?auto_76248 ?auto_76249 ?auto_76250 ?auto_76251 ?auto_76252 ?auto_76253 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76256 - BLOCK
      ?auto_76257 - BLOCK
      ?auto_76258 - BLOCK
      ?auto_76259 - BLOCK
      ?auto_76260 - BLOCK
      ?auto_76261 - BLOCK
    )
    :vars
    (
      ?auto_76263 - BLOCK
      ?auto_76262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76256 ?auto_76257 ) ) ( not ( = ?auto_76256 ?auto_76258 ) ) ( not ( = ?auto_76256 ?auto_76259 ) ) ( not ( = ?auto_76256 ?auto_76260 ) ) ( not ( = ?auto_76256 ?auto_76261 ) ) ( not ( = ?auto_76257 ?auto_76258 ) ) ( not ( = ?auto_76257 ?auto_76259 ) ) ( not ( = ?auto_76257 ?auto_76260 ) ) ( not ( = ?auto_76257 ?auto_76261 ) ) ( not ( = ?auto_76258 ?auto_76259 ) ) ( not ( = ?auto_76258 ?auto_76260 ) ) ( not ( = ?auto_76258 ?auto_76261 ) ) ( not ( = ?auto_76259 ?auto_76260 ) ) ( not ( = ?auto_76259 ?auto_76261 ) ) ( not ( = ?auto_76260 ?auto_76261 ) ) ( ON ?auto_76261 ?auto_76263 ) ( not ( = ?auto_76256 ?auto_76263 ) ) ( not ( = ?auto_76257 ?auto_76263 ) ) ( not ( = ?auto_76258 ?auto_76263 ) ) ( not ( = ?auto_76259 ?auto_76263 ) ) ( not ( = ?auto_76260 ?auto_76263 ) ) ( not ( = ?auto_76261 ?auto_76263 ) ) ( ON ?auto_76260 ?auto_76261 ) ( ON-TABLE ?auto_76263 ) ( ON ?auto_76256 ?auto_76262 ) ( not ( = ?auto_76256 ?auto_76262 ) ) ( not ( = ?auto_76257 ?auto_76262 ) ) ( not ( = ?auto_76258 ?auto_76262 ) ) ( not ( = ?auto_76259 ?auto_76262 ) ) ( not ( = ?auto_76260 ?auto_76262 ) ) ( not ( = ?auto_76261 ?auto_76262 ) ) ( not ( = ?auto_76263 ?auto_76262 ) ) ( ON ?auto_76257 ?auto_76256 ) ( ON-TABLE ?auto_76262 ) ( ON ?auto_76258 ?auto_76257 ) ( CLEAR ?auto_76260 ) ( ON ?auto_76259 ?auto_76258 ) ( CLEAR ?auto_76259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76262 ?auto_76256 ?auto_76257 ?auto_76258 )
      ( MAKE-6PILE ?auto_76256 ?auto_76257 ?auto_76258 ?auto_76259 ?auto_76260 ?auto_76261 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76264 - BLOCK
      ?auto_76265 - BLOCK
      ?auto_76266 - BLOCK
      ?auto_76267 - BLOCK
      ?auto_76268 - BLOCK
      ?auto_76269 - BLOCK
    )
    :vars
    (
      ?auto_76271 - BLOCK
      ?auto_76270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76264 ?auto_76265 ) ) ( not ( = ?auto_76264 ?auto_76266 ) ) ( not ( = ?auto_76264 ?auto_76267 ) ) ( not ( = ?auto_76264 ?auto_76268 ) ) ( not ( = ?auto_76264 ?auto_76269 ) ) ( not ( = ?auto_76265 ?auto_76266 ) ) ( not ( = ?auto_76265 ?auto_76267 ) ) ( not ( = ?auto_76265 ?auto_76268 ) ) ( not ( = ?auto_76265 ?auto_76269 ) ) ( not ( = ?auto_76266 ?auto_76267 ) ) ( not ( = ?auto_76266 ?auto_76268 ) ) ( not ( = ?auto_76266 ?auto_76269 ) ) ( not ( = ?auto_76267 ?auto_76268 ) ) ( not ( = ?auto_76267 ?auto_76269 ) ) ( not ( = ?auto_76268 ?auto_76269 ) ) ( ON ?auto_76269 ?auto_76271 ) ( not ( = ?auto_76264 ?auto_76271 ) ) ( not ( = ?auto_76265 ?auto_76271 ) ) ( not ( = ?auto_76266 ?auto_76271 ) ) ( not ( = ?auto_76267 ?auto_76271 ) ) ( not ( = ?auto_76268 ?auto_76271 ) ) ( not ( = ?auto_76269 ?auto_76271 ) ) ( ON-TABLE ?auto_76271 ) ( ON ?auto_76264 ?auto_76270 ) ( not ( = ?auto_76264 ?auto_76270 ) ) ( not ( = ?auto_76265 ?auto_76270 ) ) ( not ( = ?auto_76266 ?auto_76270 ) ) ( not ( = ?auto_76267 ?auto_76270 ) ) ( not ( = ?auto_76268 ?auto_76270 ) ) ( not ( = ?auto_76269 ?auto_76270 ) ) ( not ( = ?auto_76271 ?auto_76270 ) ) ( ON ?auto_76265 ?auto_76264 ) ( ON-TABLE ?auto_76270 ) ( ON ?auto_76266 ?auto_76265 ) ( ON ?auto_76267 ?auto_76266 ) ( CLEAR ?auto_76267 ) ( HOLDING ?auto_76268 ) ( CLEAR ?auto_76269 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76271 ?auto_76269 ?auto_76268 )
      ( MAKE-6PILE ?auto_76264 ?auto_76265 ?auto_76266 ?auto_76267 ?auto_76268 ?auto_76269 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76272 - BLOCK
      ?auto_76273 - BLOCK
      ?auto_76274 - BLOCK
      ?auto_76275 - BLOCK
      ?auto_76276 - BLOCK
      ?auto_76277 - BLOCK
    )
    :vars
    (
      ?auto_76278 - BLOCK
      ?auto_76279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76272 ?auto_76273 ) ) ( not ( = ?auto_76272 ?auto_76274 ) ) ( not ( = ?auto_76272 ?auto_76275 ) ) ( not ( = ?auto_76272 ?auto_76276 ) ) ( not ( = ?auto_76272 ?auto_76277 ) ) ( not ( = ?auto_76273 ?auto_76274 ) ) ( not ( = ?auto_76273 ?auto_76275 ) ) ( not ( = ?auto_76273 ?auto_76276 ) ) ( not ( = ?auto_76273 ?auto_76277 ) ) ( not ( = ?auto_76274 ?auto_76275 ) ) ( not ( = ?auto_76274 ?auto_76276 ) ) ( not ( = ?auto_76274 ?auto_76277 ) ) ( not ( = ?auto_76275 ?auto_76276 ) ) ( not ( = ?auto_76275 ?auto_76277 ) ) ( not ( = ?auto_76276 ?auto_76277 ) ) ( ON ?auto_76277 ?auto_76278 ) ( not ( = ?auto_76272 ?auto_76278 ) ) ( not ( = ?auto_76273 ?auto_76278 ) ) ( not ( = ?auto_76274 ?auto_76278 ) ) ( not ( = ?auto_76275 ?auto_76278 ) ) ( not ( = ?auto_76276 ?auto_76278 ) ) ( not ( = ?auto_76277 ?auto_76278 ) ) ( ON-TABLE ?auto_76278 ) ( ON ?auto_76272 ?auto_76279 ) ( not ( = ?auto_76272 ?auto_76279 ) ) ( not ( = ?auto_76273 ?auto_76279 ) ) ( not ( = ?auto_76274 ?auto_76279 ) ) ( not ( = ?auto_76275 ?auto_76279 ) ) ( not ( = ?auto_76276 ?auto_76279 ) ) ( not ( = ?auto_76277 ?auto_76279 ) ) ( not ( = ?auto_76278 ?auto_76279 ) ) ( ON ?auto_76273 ?auto_76272 ) ( ON-TABLE ?auto_76279 ) ( ON ?auto_76274 ?auto_76273 ) ( ON ?auto_76275 ?auto_76274 ) ( CLEAR ?auto_76277 ) ( ON ?auto_76276 ?auto_76275 ) ( CLEAR ?auto_76276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76279 ?auto_76272 ?auto_76273 ?auto_76274 ?auto_76275 )
      ( MAKE-6PILE ?auto_76272 ?auto_76273 ?auto_76274 ?auto_76275 ?auto_76276 ?auto_76277 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76280 - BLOCK
      ?auto_76281 - BLOCK
      ?auto_76282 - BLOCK
      ?auto_76283 - BLOCK
      ?auto_76284 - BLOCK
      ?auto_76285 - BLOCK
    )
    :vars
    (
      ?auto_76286 - BLOCK
      ?auto_76287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76280 ?auto_76281 ) ) ( not ( = ?auto_76280 ?auto_76282 ) ) ( not ( = ?auto_76280 ?auto_76283 ) ) ( not ( = ?auto_76280 ?auto_76284 ) ) ( not ( = ?auto_76280 ?auto_76285 ) ) ( not ( = ?auto_76281 ?auto_76282 ) ) ( not ( = ?auto_76281 ?auto_76283 ) ) ( not ( = ?auto_76281 ?auto_76284 ) ) ( not ( = ?auto_76281 ?auto_76285 ) ) ( not ( = ?auto_76282 ?auto_76283 ) ) ( not ( = ?auto_76282 ?auto_76284 ) ) ( not ( = ?auto_76282 ?auto_76285 ) ) ( not ( = ?auto_76283 ?auto_76284 ) ) ( not ( = ?auto_76283 ?auto_76285 ) ) ( not ( = ?auto_76284 ?auto_76285 ) ) ( not ( = ?auto_76280 ?auto_76286 ) ) ( not ( = ?auto_76281 ?auto_76286 ) ) ( not ( = ?auto_76282 ?auto_76286 ) ) ( not ( = ?auto_76283 ?auto_76286 ) ) ( not ( = ?auto_76284 ?auto_76286 ) ) ( not ( = ?auto_76285 ?auto_76286 ) ) ( ON-TABLE ?auto_76286 ) ( ON ?auto_76280 ?auto_76287 ) ( not ( = ?auto_76280 ?auto_76287 ) ) ( not ( = ?auto_76281 ?auto_76287 ) ) ( not ( = ?auto_76282 ?auto_76287 ) ) ( not ( = ?auto_76283 ?auto_76287 ) ) ( not ( = ?auto_76284 ?auto_76287 ) ) ( not ( = ?auto_76285 ?auto_76287 ) ) ( not ( = ?auto_76286 ?auto_76287 ) ) ( ON ?auto_76281 ?auto_76280 ) ( ON-TABLE ?auto_76287 ) ( ON ?auto_76282 ?auto_76281 ) ( ON ?auto_76283 ?auto_76282 ) ( ON ?auto_76284 ?auto_76283 ) ( CLEAR ?auto_76284 ) ( HOLDING ?auto_76285 ) ( CLEAR ?auto_76286 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76286 ?auto_76285 )
      ( MAKE-6PILE ?auto_76280 ?auto_76281 ?auto_76282 ?auto_76283 ?auto_76284 ?auto_76285 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76288 - BLOCK
      ?auto_76289 - BLOCK
      ?auto_76290 - BLOCK
      ?auto_76291 - BLOCK
      ?auto_76292 - BLOCK
      ?auto_76293 - BLOCK
    )
    :vars
    (
      ?auto_76295 - BLOCK
      ?auto_76294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76288 ?auto_76289 ) ) ( not ( = ?auto_76288 ?auto_76290 ) ) ( not ( = ?auto_76288 ?auto_76291 ) ) ( not ( = ?auto_76288 ?auto_76292 ) ) ( not ( = ?auto_76288 ?auto_76293 ) ) ( not ( = ?auto_76289 ?auto_76290 ) ) ( not ( = ?auto_76289 ?auto_76291 ) ) ( not ( = ?auto_76289 ?auto_76292 ) ) ( not ( = ?auto_76289 ?auto_76293 ) ) ( not ( = ?auto_76290 ?auto_76291 ) ) ( not ( = ?auto_76290 ?auto_76292 ) ) ( not ( = ?auto_76290 ?auto_76293 ) ) ( not ( = ?auto_76291 ?auto_76292 ) ) ( not ( = ?auto_76291 ?auto_76293 ) ) ( not ( = ?auto_76292 ?auto_76293 ) ) ( not ( = ?auto_76288 ?auto_76295 ) ) ( not ( = ?auto_76289 ?auto_76295 ) ) ( not ( = ?auto_76290 ?auto_76295 ) ) ( not ( = ?auto_76291 ?auto_76295 ) ) ( not ( = ?auto_76292 ?auto_76295 ) ) ( not ( = ?auto_76293 ?auto_76295 ) ) ( ON-TABLE ?auto_76295 ) ( ON ?auto_76288 ?auto_76294 ) ( not ( = ?auto_76288 ?auto_76294 ) ) ( not ( = ?auto_76289 ?auto_76294 ) ) ( not ( = ?auto_76290 ?auto_76294 ) ) ( not ( = ?auto_76291 ?auto_76294 ) ) ( not ( = ?auto_76292 ?auto_76294 ) ) ( not ( = ?auto_76293 ?auto_76294 ) ) ( not ( = ?auto_76295 ?auto_76294 ) ) ( ON ?auto_76289 ?auto_76288 ) ( ON-TABLE ?auto_76294 ) ( ON ?auto_76290 ?auto_76289 ) ( ON ?auto_76291 ?auto_76290 ) ( ON ?auto_76292 ?auto_76291 ) ( CLEAR ?auto_76295 ) ( ON ?auto_76293 ?auto_76292 ) ( CLEAR ?auto_76293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76294 ?auto_76288 ?auto_76289 ?auto_76290 ?auto_76291 ?auto_76292 )
      ( MAKE-6PILE ?auto_76288 ?auto_76289 ?auto_76290 ?auto_76291 ?auto_76292 ?auto_76293 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76296 - BLOCK
      ?auto_76297 - BLOCK
      ?auto_76298 - BLOCK
      ?auto_76299 - BLOCK
      ?auto_76300 - BLOCK
      ?auto_76301 - BLOCK
    )
    :vars
    (
      ?auto_76302 - BLOCK
      ?auto_76303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76296 ?auto_76297 ) ) ( not ( = ?auto_76296 ?auto_76298 ) ) ( not ( = ?auto_76296 ?auto_76299 ) ) ( not ( = ?auto_76296 ?auto_76300 ) ) ( not ( = ?auto_76296 ?auto_76301 ) ) ( not ( = ?auto_76297 ?auto_76298 ) ) ( not ( = ?auto_76297 ?auto_76299 ) ) ( not ( = ?auto_76297 ?auto_76300 ) ) ( not ( = ?auto_76297 ?auto_76301 ) ) ( not ( = ?auto_76298 ?auto_76299 ) ) ( not ( = ?auto_76298 ?auto_76300 ) ) ( not ( = ?auto_76298 ?auto_76301 ) ) ( not ( = ?auto_76299 ?auto_76300 ) ) ( not ( = ?auto_76299 ?auto_76301 ) ) ( not ( = ?auto_76300 ?auto_76301 ) ) ( not ( = ?auto_76296 ?auto_76302 ) ) ( not ( = ?auto_76297 ?auto_76302 ) ) ( not ( = ?auto_76298 ?auto_76302 ) ) ( not ( = ?auto_76299 ?auto_76302 ) ) ( not ( = ?auto_76300 ?auto_76302 ) ) ( not ( = ?auto_76301 ?auto_76302 ) ) ( ON ?auto_76296 ?auto_76303 ) ( not ( = ?auto_76296 ?auto_76303 ) ) ( not ( = ?auto_76297 ?auto_76303 ) ) ( not ( = ?auto_76298 ?auto_76303 ) ) ( not ( = ?auto_76299 ?auto_76303 ) ) ( not ( = ?auto_76300 ?auto_76303 ) ) ( not ( = ?auto_76301 ?auto_76303 ) ) ( not ( = ?auto_76302 ?auto_76303 ) ) ( ON ?auto_76297 ?auto_76296 ) ( ON-TABLE ?auto_76303 ) ( ON ?auto_76298 ?auto_76297 ) ( ON ?auto_76299 ?auto_76298 ) ( ON ?auto_76300 ?auto_76299 ) ( ON ?auto_76301 ?auto_76300 ) ( CLEAR ?auto_76301 ) ( HOLDING ?auto_76302 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76302 )
      ( MAKE-6PILE ?auto_76296 ?auto_76297 ?auto_76298 ?auto_76299 ?auto_76300 ?auto_76301 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76304 - BLOCK
      ?auto_76305 - BLOCK
      ?auto_76306 - BLOCK
      ?auto_76307 - BLOCK
      ?auto_76308 - BLOCK
      ?auto_76309 - BLOCK
    )
    :vars
    (
      ?auto_76311 - BLOCK
      ?auto_76310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76304 ?auto_76305 ) ) ( not ( = ?auto_76304 ?auto_76306 ) ) ( not ( = ?auto_76304 ?auto_76307 ) ) ( not ( = ?auto_76304 ?auto_76308 ) ) ( not ( = ?auto_76304 ?auto_76309 ) ) ( not ( = ?auto_76305 ?auto_76306 ) ) ( not ( = ?auto_76305 ?auto_76307 ) ) ( not ( = ?auto_76305 ?auto_76308 ) ) ( not ( = ?auto_76305 ?auto_76309 ) ) ( not ( = ?auto_76306 ?auto_76307 ) ) ( not ( = ?auto_76306 ?auto_76308 ) ) ( not ( = ?auto_76306 ?auto_76309 ) ) ( not ( = ?auto_76307 ?auto_76308 ) ) ( not ( = ?auto_76307 ?auto_76309 ) ) ( not ( = ?auto_76308 ?auto_76309 ) ) ( not ( = ?auto_76304 ?auto_76311 ) ) ( not ( = ?auto_76305 ?auto_76311 ) ) ( not ( = ?auto_76306 ?auto_76311 ) ) ( not ( = ?auto_76307 ?auto_76311 ) ) ( not ( = ?auto_76308 ?auto_76311 ) ) ( not ( = ?auto_76309 ?auto_76311 ) ) ( ON ?auto_76304 ?auto_76310 ) ( not ( = ?auto_76304 ?auto_76310 ) ) ( not ( = ?auto_76305 ?auto_76310 ) ) ( not ( = ?auto_76306 ?auto_76310 ) ) ( not ( = ?auto_76307 ?auto_76310 ) ) ( not ( = ?auto_76308 ?auto_76310 ) ) ( not ( = ?auto_76309 ?auto_76310 ) ) ( not ( = ?auto_76311 ?auto_76310 ) ) ( ON ?auto_76305 ?auto_76304 ) ( ON-TABLE ?auto_76310 ) ( ON ?auto_76306 ?auto_76305 ) ( ON ?auto_76307 ?auto_76306 ) ( ON ?auto_76308 ?auto_76307 ) ( ON ?auto_76309 ?auto_76308 ) ( ON ?auto_76311 ?auto_76309 ) ( CLEAR ?auto_76311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76310 ?auto_76304 ?auto_76305 ?auto_76306 ?auto_76307 ?auto_76308 ?auto_76309 )
      ( MAKE-6PILE ?auto_76304 ?auto_76305 ?auto_76306 ?auto_76307 ?auto_76308 ?auto_76309 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76326 - BLOCK
      ?auto_76327 - BLOCK
      ?auto_76328 - BLOCK
      ?auto_76329 - BLOCK
      ?auto_76330 - BLOCK
      ?auto_76331 - BLOCK
      ?auto_76332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76331 ) ( ON-TABLE ?auto_76326 ) ( ON ?auto_76327 ?auto_76326 ) ( ON ?auto_76328 ?auto_76327 ) ( ON ?auto_76329 ?auto_76328 ) ( ON ?auto_76330 ?auto_76329 ) ( ON ?auto_76331 ?auto_76330 ) ( not ( = ?auto_76326 ?auto_76327 ) ) ( not ( = ?auto_76326 ?auto_76328 ) ) ( not ( = ?auto_76326 ?auto_76329 ) ) ( not ( = ?auto_76326 ?auto_76330 ) ) ( not ( = ?auto_76326 ?auto_76331 ) ) ( not ( = ?auto_76326 ?auto_76332 ) ) ( not ( = ?auto_76327 ?auto_76328 ) ) ( not ( = ?auto_76327 ?auto_76329 ) ) ( not ( = ?auto_76327 ?auto_76330 ) ) ( not ( = ?auto_76327 ?auto_76331 ) ) ( not ( = ?auto_76327 ?auto_76332 ) ) ( not ( = ?auto_76328 ?auto_76329 ) ) ( not ( = ?auto_76328 ?auto_76330 ) ) ( not ( = ?auto_76328 ?auto_76331 ) ) ( not ( = ?auto_76328 ?auto_76332 ) ) ( not ( = ?auto_76329 ?auto_76330 ) ) ( not ( = ?auto_76329 ?auto_76331 ) ) ( not ( = ?auto_76329 ?auto_76332 ) ) ( not ( = ?auto_76330 ?auto_76331 ) ) ( not ( = ?auto_76330 ?auto_76332 ) ) ( not ( = ?auto_76331 ?auto_76332 ) ) ( ON-TABLE ?auto_76332 ) ( CLEAR ?auto_76332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_76332 )
      ( MAKE-7PILE ?auto_76326 ?auto_76327 ?auto_76328 ?auto_76329 ?auto_76330 ?auto_76331 ?auto_76332 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76333 - BLOCK
      ?auto_76334 - BLOCK
      ?auto_76335 - BLOCK
      ?auto_76336 - BLOCK
      ?auto_76337 - BLOCK
      ?auto_76338 - BLOCK
      ?auto_76339 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76333 ) ( ON ?auto_76334 ?auto_76333 ) ( ON ?auto_76335 ?auto_76334 ) ( ON ?auto_76336 ?auto_76335 ) ( ON ?auto_76337 ?auto_76336 ) ( not ( = ?auto_76333 ?auto_76334 ) ) ( not ( = ?auto_76333 ?auto_76335 ) ) ( not ( = ?auto_76333 ?auto_76336 ) ) ( not ( = ?auto_76333 ?auto_76337 ) ) ( not ( = ?auto_76333 ?auto_76338 ) ) ( not ( = ?auto_76333 ?auto_76339 ) ) ( not ( = ?auto_76334 ?auto_76335 ) ) ( not ( = ?auto_76334 ?auto_76336 ) ) ( not ( = ?auto_76334 ?auto_76337 ) ) ( not ( = ?auto_76334 ?auto_76338 ) ) ( not ( = ?auto_76334 ?auto_76339 ) ) ( not ( = ?auto_76335 ?auto_76336 ) ) ( not ( = ?auto_76335 ?auto_76337 ) ) ( not ( = ?auto_76335 ?auto_76338 ) ) ( not ( = ?auto_76335 ?auto_76339 ) ) ( not ( = ?auto_76336 ?auto_76337 ) ) ( not ( = ?auto_76336 ?auto_76338 ) ) ( not ( = ?auto_76336 ?auto_76339 ) ) ( not ( = ?auto_76337 ?auto_76338 ) ) ( not ( = ?auto_76337 ?auto_76339 ) ) ( not ( = ?auto_76338 ?auto_76339 ) ) ( ON-TABLE ?auto_76339 ) ( CLEAR ?auto_76339 ) ( HOLDING ?auto_76338 ) ( CLEAR ?auto_76337 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76333 ?auto_76334 ?auto_76335 ?auto_76336 ?auto_76337 ?auto_76338 )
      ( MAKE-7PILE ?auto_76333 ?auto_76334 ?auto_76335 ?auto_76336 ?auto_76337 ?auto_76338 ?auto_76339 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76340 - BLOCK
      ?auto_76341 - BLOCK
      ?auto_76342 - BLOCK
      ?auto_76343 - BLOCK
      ?auto_76344 - BLOCK
      ?auto_76345 - BLOCK
      ?auto_76346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76340 ) ( ON ?auto_76341 ?auto_76340 ) ( ON ?auto_76342 ?auto_76341 ) ( ON ?auto_76343 ?auto_76342 ) ( ON ?auto_76344 ?auto_76343 ) ( not ( = ?auto_76340 ?auto_76341 ) ) ( not ( = ?auto_76340 ?auto_76342 ) ) ( not ( = ?auto_76340 ?auto_76343 ) ) ( not ( = ?auto_76340 ?auto_76344 ) ) ( not ( = ?auto_76340 ?auto_76345 ) ) ( not ( = ?auto_76340 ?auto_76346 ) ) ( not ( = ?auto_76341 ?auto_76342 ) ) ( not ( = ?auto_76341 ?auto_76343 ) ) ( not ( = ?auto_76341 ?auto_76344 ) ) ( not ( = ?auto_76341 ?auto_76345 ) ) ( not ( = ?auto_76341 ?auto_76346 ) ) ( not ( = ?auto_76342 ?auto_76343 ) ) ( not ( = ?auto_76342 ?auto_76344 ) ) ( not ( = ?auto_76342 ?auto_76345 ) ) ( not ( = ?auto_76342 ?auto_76346 ) ) ( not ( = ?auto_76343 ?auto_76344 ) ) ( not ( = ?auto_76343 ?auto_76345 ) ) ( not ( = ?auto_76343 ?auto_76346 ) ) ( not ( = ?auto_76344 ?auto_76345 ) ) ( not ( = ?auto_76344 ?auto_76346 ) ) ( not ( = ?auto_76345 ?auto_76346 ) ) ( ON-TABLE ?auto_76346 ) ( CLEAR ?auto_76344 ) ( ON ?auto_76345 ?auto_76346 ) ( CLEAR ?auto_76345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76346 )
      ( MAKE-7PILE ?auto_76340 ?auto_76341 ?auto_76342 ?auto_76343 ?auto_76344 ?auto_76345 ?auto_76346 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76347 - BLOCK
      ?auto_76348 - BLOCK
      ?auto_76349 - BLOCK
      ?auto_76350 - BLOCK
      ?auto_76351 - BLOCK
      ?auto_76352 - BLOCK
      ?auto_76353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76347 ) ( ON ?auto_76348 ?auto_76347 ) ( ON ?auto_76349 ?auto_76348 ) ( ON ?auto_76350 ?auto_76349 ) ( not ( = ?auto_76347 ?auto_76348 ) ) ( not ( = ?auto_76347 ?auto_76349 ) ) ( not ( = ?auto_76347 ?auto_76350 ) ) ( not ( = ?auto_76347 ?auto_76351 ) ) ( not ( = ?auto_76347 ?auto_76352 ) ) ( not ( = ?auto_76347 ?auto_76353 ) ) ( not ( = ?auto_76348 ?auto_76349 ) ) ( not ( = ?auto_76348 ?auto_76350 ) ) ( not ( = ?auto_76348 ?auto_76351 ) ) ( not ( = ?auto_76348 ?auto_76352 ) ) ( not ( = ?auto_76348 ?auto_76353 ) ) ( not ( = ?auto_76349 ?auto_76350 ) ) ( not ( = ?auto_76349 ?auto_76351 ) ) ( not ( = ?auto_76349 ?auto_76352 ) ) ( not ( = ?auto_76349 ?auto_76353 ) ) ( not ( = ?auto_76350 ?auto_76351 ) ) ( not ( = ?auto_76350 ?auto_76352 ) ) ( not ( = ?auto_76350 ?auto_76353 ) ) ( not ( = ?auto_76351 ?auto_76352 ) ) ( not ( = ?auto_76351 ?auto_76353 ) ) ( not ( = ?auto_76352 ?auto_76353 ) ) ( ON-TABLE ?auto_76353 ) ( ON ?auto_76352 ?auto_76353 ) ( CLEAR ?auto_76352 ) ( HOLDING ?auto_76351 ) ( CLEAR ?auto_76350 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76347 ?auto_76348 ?auto_76349 ?auto_76350 ?auto_76351 )
      ( MAKE-7PILE ?auto_76347 ?auto_76348 ?auto_76349 ?auto_76350 ?auto_76351 ?auto_76352 ?auto_76353 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76354 - BLOCK
      ?auto_76355 - BLOCK
      ?auto_76356 - BLOCK
      ?auto_76357 - BLOCK
      ?auto_76358 - BLOCK
      ?auto_76359 - BLOCK
      ?auto_76360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76354 ) ( ON ?auto_76355 ?auto_76354 ) ( ON ?auto_76356 ?auto_76355 ) ( ON ?auto_76357 ?auto_76356 ) ( not ( = ?auto_76354 ?auto_76355 ) ) ( not ( = ?auto_76354 ?auto_76356 ) ) ( not ( = ?auto_76354 ?auto_76357 ) ) ( not ( = ?auto_76354 ?auto_76358 ) ) ( not ( = ?auto_76354 ?auto_76359 ) ) ( not ( = ?auto_76354 ?auto_76360 ) ) ( not ( = ?auto_76355 ?auto_76356 ) ) ( not ( = ?auto_76355 ?auto_76357 ) ) ( not ( = ?auto_76355 ?auto_76358 ) ) ( not ( = ?auto_76355 ?auto_76359 ) ) ( not ( = ?auto_76355 ?auto_76360 ) ) ( not ( = ?auto_76356 ?auto_76357 ) ) ( not ( = ?auto_76356 ?auto_76358 ) ) ( not ( = ?auto_76356 ?auto_76359 ) ) ( not ( = ?auto_76356 ?auto_76360 ) ) ( not ( = ?auto_76357 ?auto_76358 ) ) ( not ( = ?auto_76357 ?auto_76359 ) ) ( not ( = ?auto_76357 ?auto_76360 ) ) ( not ( = ?auto_76358 ?auto_76359 ) ) ( not ( = ?auto_76358 ?auto_76360 ) ) ( not ( = ?auto_76359 ?auto_76360 ) ) ( ON-TABLE ?auto_76360 ) ( ON ?auto_76359 ?auto_76360 ) ( CLEAR ?auto_76357 ) ( ON ?auto_76358 ?auto_76359 ) ( CLEAR ?auto_76358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76360 ?auto_76359 )
      ( MAKE-7PILE ?auto_76354 ?auto_76355 ?auto_76356 ?auto_76357 ?auto_76358 ?auto_76359 ?auto_76360 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76361 - BLOCK
      ?auto_76362 - BLOCK
      ?auto_76363 - BLOCK
      ?auto_76364 - BLOCK
      ?auto_76365 - BLOCK
      ?auto_76366 - BLOCK
      ?auto_76367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76361 ) ( ON ?auto_76362 ?auto_76361 ) ( ON ?auto_76363 ?auto_76362 ) ( not ( = ?auto_76361 ?auto_76362 ) ) ( not ( = ?auto_76361 ?auto_76363 ) ) ( not ( = ?auto_76361 ?auto_76364 ) ) ( not ( = ?auto_76361 ?auto_76365 ) ) ( not ( = ?auto_76361 ?auto_76366 ) ) ( not ( = ?auto_76361 ?auto_76367 ) ) ( not ( = ?auto_76362 ?auto_76363 ) ) ( not ( = ?auto_76362 ?auto_76364 ) ) ( not ( = ?auto_76362 ?auto_76365 ) ) ( not ( = ?auto_76362 ?auto_76366 ) ) ( not ( = ?auto_76362 ?auto_76367 ) ) ( not ( = ?auto_76363 ?auto_76364 ) ) ( not ( = ?auto_76363 ?auto_76365 ) ) ( not ( = ?auto_76363 ?auto_76366 ) ) ( not ( = ?auto_76363 ?auto_76367 ) ) ( not ( = ?auto_76364 ?auto_76365 ) ) ( not ( = ?auto_76364 ?auto_76366 ) ) ( not ( = ?auto_76364 ?auto_76367 ) ) ( not ( = ?auto_76365 ?auto_76366 ) ) ( not ( = ?auto_76365 ?auto_76367 ) ) ( not ( = ?auto_76366 ?auto_76367 ) ) ( ON-TABLE ?auto_76367 ) ( ON ?auto_76366 ?auto_76367 ) ( ON ?auto_76365 ?auto_76366 ) ( CLEAR ?auto_76365 ) ( HOLDING ?auto_76364 ) ( CLEAR ?auto_76363 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76361 ?auto_76362 ?auto_76363 ?auto_76364 )
      ( MAKE-7PILE ?auto_76361 ?auto_76362 ?auto_76363 ?auto_76364 ?auto_76365 ?auto_76366 ?auto_76367 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76368 - BLOCK
      ?auto_76369 - BLOCK
      ?auto_76370 - BLOCK
      ?auto_76371 - BLOCK
      ?auto_76372 - BLOCK
      ?auto_76373 - BLOCK
      ?auto_76374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76368 ) ( ON ?auto_76369 ?auto_76368 ) ( ON ?auto_76370 ?auto_76369 ) ( not ( = ?auto_76368 ?auto_76369 ) ) ( not ( = ?auto_76368 ?auto_76370 ) ) ( not ( = ?auto_76368 ?auto_76371 ) ) ( not ( = ?auto_76368 ?auto_76372 ) ) ( not ( = ?auto_76368 ?auto_76373 ) ) ( not ( = ?auto_76368 ?auto_76374 ) ) ( not ( = ?auto_76369 ?auto_76370 ) ) ( not ( = ?auto_76369 ?auto_76371 ) ) ( not ( = ?auto_76369 ?auto_76372 ) ) ( not ( = ?auto_76369 ?auto_76373 ) ) ( not ( = ?auto_76369 ?auto_76374 ) ) ( not ( = ?auto_76370 ?auto_76371 ) ) ( not ( = ?auto_76370 ?auto_76372 ) ) ( not ( = ?auto_76370 ?auto_76373 ) ) ( not ( = ?auto_76370 ?auto_76374 ) ) ( not ( = ?auto_76371 ?auto_76372 ) ) ( not ( = ?auto_76371 ?auto_76373 ) ) ( not ( = ?auto_76371 ?auto_76374 ) ) ( not ( = ?auto_76372 ?auto_76373 ) ) ( not ( = ?auto_76372 ?auto_76374 ) ) ( not ( = ?auto_76373 ?auto_76374 ) ) ( ON-TABLE ?auto_76374 ) ( ON ?auto_76373 ?auto_76374 ) ( ON ?auto_76372 ?auto_76373 ) ( CLEAR ?auto_76370 ) ( ON ?auto_76371 ?auto_76372 ) ( CLEAR ?auto_76371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76374 ?auto_76373 ?auto_76372 )
      ( MAKE-7PILE ?auto_76368 ?auto_76369 ?auto_76370 ?auto_76371 ?auto_76372 ?auto_76373 ?auto_76374 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76375 - BLOCK
      ?auto_76376 - BLOCK
      ?auto_76377 - BLOCK
      ?auto_76378 - BLOCK
      ?auto_76379 - BLOCK
      ?auto_76380 - BLOCK
      ?auto_76381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76375 ) ( ON ?auto_76376 ?auto_76375 ) ( not ( = ?auto_76375 ?auto_76376 ) ) ( not ( = ?auto_76375 ?auto_76377 ) ) ( not ( = ?auto_76375 ?auto_76378 ) ) ( not ( = ?auto_76375 ?auto_76379 ) ) ( not ( = ?auto_76375 ?auto_76380 ) ) ( not ( = ?auto_76375 ?auto_76381 ) ) ( not ( = ?auto_76376 ?auto_76377 ) ) ( not ( = ?auto_76376 ?auto_76378 ) ) ( not ( = ?auto_76376 ?auto_76379 ) ) ( not ( = ?auto_76376 ?auto_76380 ) ) ( not ( = ?auto_76376 ?auto_76381 ) ) ( not ( = ?auto_76377 ?auto_76378 ) ) ( not ( = ?auto_76377 ?auto_76379 ) ) ( not ( = ?auto_76377 ?auto_76380 ) ) ( not ( = ?auto_76377 ?auto_76381 ) ) ( not ( = ?auto_76378 ?auto_76379 ) ) ( not ( = ?auto_76378 ?auto_76380 ) ) ( not ( = ?auto_76378 ?auto_76381 ) ) ( not ( = ?auto_76379 ?auto_76380 ) ) ( not ( = ?auto_76379 ?auto_76381 ) ) ( not ( = ?auto_76380 ?auto_76381 ) ) ( ON-TABLE ?auto_76381 ) ( ON ?auto_76380 ?auto_76381 ) ( ON ?auto_76379 ?auto_76380 ) ( ON ?auto_76378 ?auto_76379 ) ( CLEAR ?auto_76378 ) ( HOLDING ?auto_76377 ) ( CLEAR ?auto_76376 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76375 ?auto_76376 ?auto_76377 )
      ( MAKE-7PILE ?auto_76375 ?auto_76376 ?auto_76377 ?auto_76378 ?auto_76379 ?auto_76380 ?auto_76381 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76382 - BLOCK
      ?auto_76383 - BLOCK
      ?auto_76384 - BLOCK
      ?auto_76385 - BLOCK
      ?auto_76386 - BLOCK
      ?auto_76387 - BLOCK
      ?auto_76388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76382 ) ( ON ?auto_76383 ?auto_76382 ) ( not ( = ?auto_76382 ?auto_76383 ) ) ( not ( = ?auto_76382 ?auto_76384 ) ) ( not ( = ?auto_76382 ?auto_76385 ) ) ( not ( = ?auto_76382 ?auto_76386 ) ) ( not ( = ?auto_76382 ?auto_76387 ) ) ( not ( = ?auto_76382 ?auto_76388 ) ) ( not ( = ?auto_76383 ?auto_76384 ) ) ( not ( = ?auto_76383 ?auto_76385 ) ) ( not ( = ?auto_76383 ?auto_76386 ) ) ( not ( = ?auto_76383 ?auto_76387 ) ) ( not ( = ?auto_76383 ?auto_76388 ) ) ( not ( = ?auto_76384 ?auto_76385 ) ) ( not ( = ?auto_76384 ?auto_76386 ) ) ( not ( = ?auto_76384 ?auto_76387 ) ) ( not ( = ?auto_76384 ?auto_76388 ) ) ( not ( = ?auto_76385 ?auto_76386 ) ) ( not ( = ?auto_76385 ?auto_76387 ) ) ( not ( = ?auto_76385 ?auto_76388 ) ) ( not ( = ?auto_76386 ?auto_76387 ) ) ( not ( = ?auto_76386 ?auto_76388 ) ) ( not ( = ?auto_76387 ?auto_76388 ) ) ( ON-TABLE ?auto_76388 ) ( ON ?auto_76387 ?auto_76388 ) ( ON ?auto_76386 ?auto_76387 ) ( ON ?auto_76385 ?auto_76386 ) ( CLEAR ?auto_76383 ) ( ON ?auto_76384 ?auto_76385 ) ( CLEAR ?auto_76384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76388 ?auto_76387 ?auto_76386 ?auto_76385 )
      ( MAKE-7PILE ?auto_76382 ?auto_76383 ?auto_76384 ?auto_76385 ?auto_76386 ?auto_76387 ?auto_76388 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76389 - BLOCK
      ?auto_76390 - BLOCK
      ?auto_76391 - BLOCK
      ?auto_76392 - BLOCK
      ?auto_76393 - BLOCK
      ?auto_76394 - BLOCK
      ?auto_76395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76389 ) ( not ( = ?auto_76389 ?auto_76390 ) ) ( not ( = ?auto_76389 ?auto_76391 ) ) ( not ( = ?auto_76389 ?auto_76392 ) ) ( not ( = ?auto_76389 ?auto_76393 ) ) ( not ( = ?auto_76389 ?auto_76394 ) ) ( not ( = ?auto_76389 ?auto_76395 ) ) ( not ( = ?auto_76390 ?auto_76391 ) ) ( not ( = ?auto_76390 ?auto_76392 ) ) ( not ( = ?auto_76390 ?auto_76393 ) ) ( not ( = ?auto_76390 ?auto_76394 ) ) ( not ( = ?auto_76390 ?auto_76395 ) ) ( not ( = ?auto_76391 ?auto_76392 ) ) ( not ( = ?auto_76391 ?auto_76393 ) ) ( not ( = ?auto_76391 ?auto_76394 ) ) ( not ( = ?auto_76391 ?auto_76395 ) ) ( not ( = ?auto_76392 ?auto_76393 ) ) ( not ( = ?auto_76392 ?auto_76394 ) ) ( not ( = ?auto_76392 ?auto_76395 ) ) ( not ( = ?auto_76393 ?auto_76394 ) ) ( not ( = ?auto_76393 ?auto_76395 ) ) ( not ( = ?auto_76394 ?auto_76395 ) ) ( ON-TABLE ?auto_76395 ) ( ON ?auto_76394 ?auto_76395 ) ( ON ?auto_76393 ?auto_76394 ) ( ON ?auto_76392 ?auto_76393 ) ( ON ?auto_76391 ?auto_76392 ) ( CLEAR ?auto_76391 ) ( HOLDING ?auto_76390 ) ( CLEAR ?auto_76389 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76389 ?auto_76390 )
      ( MAKE-7PILE ?auto_76389 ?auto_76390 ?auto_76391 ?auto_76392 ?auto_76393 ?auto_76394 ?auto_76395 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76396 - BLOCK
      ?auto_76397 - BLOCK
      ?auto_76398 - BLOCK
      ?auto_76399 - BLOCK
      ?auto_76400 - BLOCK
      ?auto_76401 - BLOCK
      ?auto_76402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76396 ) ( not ( = ?auto_76396 ?auto_76397 ) ) ( not ( = ?auto_76396 ?auto_76398 ) ) ( not ( = ?auto_76396 ?auto_76399 ) ) ( not ( = ?auto_76396 ?auto_76400 ) ) ( not ( = ?auto_76396 ?auto_76401 ) ) ( not ( = ?auto_76396 ?auto_76402 ) ) ( not ( = ?auto_76397 ?auto_76398 ) ) ( not ( = ?auto_76397 ?auto_76399 ) ) ( not ( = ?auto_76397 ?auto_76400 ) ) ( not ( = ?auto_76397 ?auto_76401 ) ) ( not ( = ?auto_76397 ?auto_76402 ) ) ( not ( = ?auto_76398 ?auto_76399 ) ) ( not ( = ?auto_76398 ?auto_76400 ) ) ( not ( = ?auto_76398 ?auto_76401 ) ) ( not ( = ?auto_76398 ?auto_76402 ) ) ( not ( = ?auto_76399 ?auto_76400 ) ) ( not ( = ?auto_76399 ?auto_76401 ) ) ( not ( = ?auto_76399 ?auto_76402 ) ) ( not ( = ?auto_76400 ?auto_76401 ) ) ( not ( = ?auto_76400 ?auto_76402 ) ) ( not ( = ?auto_76401 ?auto_76402 ) ) ( ON-TABLE ?auto_76402 ) ( ON ?auto_76401 ?auto_76402 ) ( ON ?auto_76400 ?auto_76401 ) ( ON ?auto_76399 ?auto_76400 ) ( ON ?auto_76398 ?auto_76399 ) ( CLEAR ?auto_76396 ) ( ON ?auto_76397 ?auto_76398 ) ( CLEAR ?auto_76397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76402 ?auto_76401 ?auto_76400 ?auto_76399 ?auto_76398 )
      ( MAKE-7PILE ?auto_76396 ?auto_76397 ?auto_76398 ?auto_76399 ?auto_76400 ?auto_76401 ?auto_76402 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76403 - BLOCK
      ?auto_76404 - BLOCK
      ?auto_76405 - BLOCK
      ?auto_76406 - BLOCK
      ?auto_76407 - BLOCK
      ?auto_76408 - BLOCK
      ?auto_76409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76403 ?auto_76404 ) ) ( not ( = ?auto_76403 ?auto_76405 ) ) ( not ( = ?auto_76403 ?auto_76406 ) ) ( not ( = ?auto_76403 ?auto_76407 ) ) ( not ( = ?auto_76403 ?auto_76408 ) ) ( not ( = ?auto_76403 ?auto_76409 ) ) ( not ( = ?auto_76404 ?auto_76405 ) ) ( not ( = ?auto_76404 ?auto_76406 ) ) ( not ( = ?auto_76404 ?auto_76407 ) ) ( not ( = ?auto_76404 ?auto_76408 ) ) ( not ( = ?auto_76404 ?auto_76409 ) ) ( not ( = ?auto_76405 ?auto_76406 ) ) ( not ( = ?auto_76405 ?auto_76407 ) ) ( not ( = ?auto_76405 ?auto_76408 ) ) ( not ( = ?auto_76405 ?auto_76409 ) ) ( not ( = ?auto_76406 ?auto_76407 ) ) ( not ( = ?auto_76406 ?auto_76408 ) ) ( not ( = ?auto_76406 ?auto_76409 ) ) ( not ( = ?auto_76407 ?auto_76408 ) ) ( not ( = ?auto_76407 ?auto_76409 ) ) ( not ( = ?auto_76408 ?auto_76409 ) ) ( ON-TABLE ?auto_76409 ) ( ON ?auto_76408 ?auto_76409 ) ( ON ?auto_76407 ?auto_76408 ) ( ON ?auto_76406 ?auto_76407 ) ( ON ?auto_76405 ?auto_76406 ) ( ON ?auto_76404 ?auto_76405 ) ( CLEAR ?auto_76404 ) ( HOLDING ?auto_76403 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76403 )
      ( MAKE-7PILE ?auto_76403 ?auto_76404 ?auto_76405 ?auto_76406 ?auto_76407 ?auto_76408 ?auto_76409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76410 - BLOCK
      ?auto_76411 - BLOCK
      ?auto_76412 - BLOCK
      ?auto_76413 - BLOCK
      ?auto_76414 - BLOCK
      ?auto_76415 - BLOCK
      ?auto_76416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76410 ?auto_76411 ) ) ( not ( = ?auto_76410 ?auto_76412 ) ) ( not ( = ?auto_76410 ?auto_76413 ) ) ( not ( = ?auto_76410 ?auto_76414 ) ) ( not ( = ?auto_76410 ?auto_76415 ) ) ( not ( = ?auto_76410 ?auto_76416 ) ) ( not ( = ?auto_76411 ?auto_76412 ) ) ( not ( = ?auto_76411 ?auto_76413 ) ) ( not ( = ?auto_76411 ?auto_76414 ) ) ( not ( = ?auto_76411 ?auto_76415 ) ) ( not ( = ?auto_76411 ?auto_76416 ) ) ( not ( = ?auto_76412 ?auto_76413 ) ) ( not ( = ?auto_76412 ?auto_76414 ) ) ( not ( = ?auto_76412 ?auto_76415 ) ) ( not ( = ?auto_76412 ?auto_76416 ) ) ( not ( = ?auto_76413 ?auto_76414 ) ) ( not ( = ?auto_76413 ?auto_76415 ) ) ( not ( = ?auto_76413 ?auto_76416 ) ) ( not ( = ?auto_76414 ?auto_76415 ) ) ( not ( = ?auto_76414 ?auto_76416 ) ) ( not ( = ?auto_76415 ?auto_76416 ) ) ( ON-TABLE ?auto_76416 ) ( ON ?auto_76415 ?auto_76416 ) ( ON ?auto_76414 ?auto_76415 ) ( ON ?auto_76413 ?auto_76414 ) ( ON ?auto_76412 ?auto_76413 ) ( ON ?auto_76411 ?auto_76412 ) ( ON ?auto_76410 ?auto_76411 ) ( CLEAR ?auto_76410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76416 ?auto_76415 ?auto_76414 ?auto_76413 ?auto_76412 ?auto_76411 )
      ( MAKE-7PILE ?auto_76410 ?auto_76411 ?auto_76412 ?auto_76413 ?auto_76414 ?auto_76415 ?auto_76416 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76424 - BLOCK
      ?auto_76425 - BLOCK
      ?auto_76426 - BLOCK
      ?auto_76427 - BLOCK
      ?auto_76428 - BLOCK
      ?auto_76429 - BLOCK
      ?auto_76430 - BLOCK
    )
    :vars
    (
      ?auto_76431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76424 ?auto_76425 ) ) ( not ( = ?auto_76424 ?auto_76426 ) ) ( not ( = ?auto_76424 ?auto_76427 ) ) ( not ( = ?auto_76424 ?auto_76428 ) ) ( not ( = ?auto_76424 ?auto_76429 ) ) ( not ( = ?auto_76424 ?auto_76430 ) ) ( not ( = ?auto_76425 ?auto_76426 ) ) ( not ( = ?auto_76425 ?auto_76427 ) ) ( not ( = ?auto_76425 ?auto_76428 ) ) ( not ( = ?auto_76425 ?auto_76429 ) ) ( not ( = ?auto_76425 ?auto_76430 ) ) ( not ( = ?auto_76426 ?auto_76427 ) ) ( not ( = ?auto_76426 ?auto_76428 ) ) ( not ( = ?auto_76426 ?auto_76429 ) ) ( not ( = ?auto_76426 ?auto_76430 ) ) ( not ( = ?auto_76427 ?auto_76428 ) ) ( not ( = ?auto_76427 ?auto_76429 ) ) ( not ( = ?auto_76427 ?auto_76430 ) ) ( not ( = ?auto_76428 ?auto_76429 ) ) ( not ( = ?auto_76428 ?auto_76430 ) ) ( not ( = ?auto_76429 ?auto_76430 ) ) ( ON-TABLE ?auto_76430 ) ( ON ?auto_76429 ?auto_76430 ) ( ON ?auto_76428 ?auto_76429 ) ( ON ?auto_76427 ?auto_76428 ) ( ON ?auto_76426 ?auto_76427 ) ( ON ?auto_76425 ?auto_76426 ) ( CLEAR ?auto_76425 ) ( ON ?auto_76424 ?auto_76431 ) ( CLEAR ?auto_76424 ) ( HAND-EMPTY ) ( not ( = ?auto_76424 ?auto_76431 ) ) ( not ( = ?auto_76425 ?auto_76431 ) ) ( not ( = ?auto_76426 ?auto_76431 ) ) ( not ( = ?auto_76427 ?auto_76431 ) ) ( not ( = ?auto_76428 ?auto_76431 ) ) ( not ( = ?auto_76429 ?auto_76431 ) ) ( not ( = ?auto_76430 ?auto_76431 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76424 ?auto_76431 )
      ( MAKE-7PILE ?auto_76424 ?auto_76425 ?auto_76426 ?auto_76427 ?auto_76428 ?auto_76429 ?auto_76430 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76432 - BLOCK
      ?auto_76433 - BLOCK
      ?auto_76434 - BLOCK
      ?auto_76435 - BLOCK
      ?auto_76436 - BLOCK
      ?auto_76437 - BLOCK
      ?auto_76438 - BLOCK
    )
    :vars
    (
      ?auto_76439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76432 ?auto_76433 ) ) ( not ( = ?auto_76432 ?auto_76434 ) ) ( not ( = ?auto_76432 ?auto_76435 ) ) ( not ( = ?auto_76432 ?auto_76436 ) ) ( not ( = ?auto_76432 ?auto_76437 ) ) ( not ( = ?auto_76432 ?auto_76438 ) ) ( not ( = ?auto_76433 ?auto_76434 ) ) ( not ( = ?auto_76433 ?auto_76435 ) ) ( not ( = ?auto_76433 ?auto_76436 ) ) ( not ( = ?auto_76433 ?auto_76437 ) ) ( not ( = ?auto_76433 ?auto_76438 ) ) ( not ( = ?auto_76434 ?auto_76435 ) ) ( not ( = ?auto_76434 ?auto_76436 ) ) ( not ( = ?auto_76434 ?auto_76437 ) ) ( not ( = ?auto_76434 ?auto_76438 ) ) ( not ( = ?auto_76435 ?auto_76436 ) ) ( not ( = ?auto_76435 ?auto_76437 ) ) ( not ( = ?auto_76435 ?auto_76438 ) ) ( not ( = ?auto_76436 ?auto_76437 ) ) ( not ( = ?auto_76436 ?auto_76438 ) ) ( not ( = ?auto_76437 ?auto_76438 ) ) ( ON-TABLE ?auto_76438 ) ( ON ?auto_76437 ?auto_76438 ) ( ON ?auto_76436 ?auto_76437 ) ( ON ?auto_76435 ?auto_76436 ) ( ON ?auto_76434 ?auto_76435 ) ( ON ?auto_76432 ?auto_76439 ) ( CLEAR ?auto_76432 ) ( not ( = ?auto_76432 ?auto_76439 ) ) ( not ( = ?auto_76433 ?auto_76439 ) ) ( not ( = ?auto_76434 ?auto_76439 ) ) ( not ( = ?auto_76435 ?auto_76439 ) ) ( not ( = ?auto_76436 ?auto_76439 ) ) ( not ( = ?auto_76437 ?auto_76439 ) ) ( not ( = ?auto_76438 ?auto_76439 ) ) ( HOLDING ?auto_76433 ) ( CLEAR ?auto_76434 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76438 ?auto_76437 ?auto_76436 ?auto_76435 ?auto_76434 ?auto_76433 )
      ( MAKE-7PILE ?auto_76432 ?auto_76433 ?auto_76434 ?auto_76435 ?auto_76436 ?auto_76437 ?auto_76438 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76440 - BLOCK
      ?auto_76441 - BLOCK
      ?auto_76442 - BLOCK
      ?auto_76443 - BLOCK
      ?auto_76444 - BLOCK
      ?auto_76445 - BLOCK
      ?auto_76446 - BLOCK
    )
    :vars
    (
      ?auto_76447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76440 ?auto_76441 ) ) ( not ( = ?auto_76440 ?auto_76442 ) ) ( not ( = ?auto_76440 ?auto_76443 ) ) ( not ( = ?auto_76440 ?auto_76444 ) ) ( not ( = ?auto_76440 ?auto_76445 ) ) ( not ( = ?auto_76440 ?auto_76446 ) ) ( not ( = ?auto_76441 ?auto_76442 ) ) ( not ( = ?auto_76441 ?auto_76443 ) ) ( not ( = ?auto_76441 ?auto_76444 ) ) ( not ( = ?auto_76441 ?auto_76445 ) ) ( not ( = ?auto_76441 ?auto_76446 ) ) ( not ( = ?auto_76442 ?auto_76443 ) ) ( not ( = ?auto_76442 ?auto_76444 ) ) ( not ( = ?auto_76442 ?auto_76445 ) ) ( not ( = ?auto_76442 ?auto_76446 ) ) ( not ( = ?auto_76443 ?auto_76444 ) ) ( not ( = ?auto_76443 ?auto_76445 ) ) ( not ( = ?auto_76443 ?auto_76446 ) ) ( not ( = ?auto_76444 ?auto_76445 ) ) ( not ( = ?auto_76444 ?auto_76446 ) ) ( not ( = ?auto_76445 ?auto_76446 ) ) ( ON-TABLE ?auto_76446 ) ( ON ?auto_76445 ?auto_76446 ) ( ON ?auto_76444 ?auto_76445 ) ( ON ?auto_76443 ?auto_76444 ) ( ON ?auto_76442 ?auto_76443 ) ( ON ?auto_76440 ?auto_76447 ) ( not ( = ?auto_76440 ?auto_76447 ) ) ( not ( = ?auto_76441 ?auto_76447 ) ) ( not ( = ?auto_76442 ?auto_76447 ) ) ( not ( = ?auto_76443 ?auto_76447 ) ) ( not ( = ?auto_76444 ?auto_76447 ) ) ( not ( = ?auto_76445 ?auto_76447 ) ) ( not ( = ?auto_76446 ?auto_76447 ) ) ( CLEAR ?auto_76442 ) ( ON ?auto_76441 ?auto_76440 ) ( CLEAR ?auto_76441 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76447 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76447 ?auto_76440 )
      ( MAKE-7PILE ?auto_76440 ?auto_76441 ?auto_76442 ?auto_76443 ?auto_76444 ?auto_76445 ?auto_76446 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76448 - BLOCK
      ?auto_76449 - BLOCK
      ?auto_76450 - BLOCK
      ?auto_76451 - BLOCK
      ?auto_76452 - BLOCK
      ?auto_76453 - BLOCK
      ?auto_76454 - BLOCK
    )
    :vars
    (
      ?auto_76455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76448 ?auto_76449 ) ) ( not ( = ?auto_76448 ?auto_76450 ) ) ( not ( = ?auto_76448 ?auto_76451 ) ) ( not ( = ?auto_76448 ?auto_76452 ) ) ( not ( = ?auto_76448 ?auto_76453 ) ) ( not ( = ?auto_76448 ?auto_76454 ) ) ( not ( = ?auto_76449 ?auto_76450 ) ) ( not ( = ?auto_76449 ?auto_76451 ) ) ( not ( = ?auto_76449 ?auto_76452 ) ) ( not ( = ?auto_76449 ?auto_76453 ) ) ( not ( = ?auto_76449 ?auto_76454 ) ) ( not ( = ?auto_76450 ?auto_76451 ) ) ( not ( = ?auto_76450 ?auto_76452 ) ) ( not ( = ?auto_76450 ?auto_76453 ) ) ( not ( = ?auto_76450 ?auto_76454 ) ) ( not ( = ?auto_76451 ?auto_76452 ) ) ( not ( = ?auto_76451 ?auto_76453 ) ) ( not ( = ?auto_76451 ?auto_76454 ) ) ( not ( = ?auto_76452 ?auto_76453 ) ) ( not ( = ?auto_76452 ?auto_76454 ) ) ( not ( = ?auto_76453 ?auto_76454 ) ) ( ON-TABLE ?auto_76454 ) ( ON ?auto_76453 ?auto_76454 ) ( ON ?auto_76452 ?auto_76453 ) ( ON ?auto_76451 ?auto_76452 ) ( ON ?auto_76448 ?auto_76455 ) ( not ( = ?auto_76448 ?auto_76455 ) ) ( not ( = ?auto_76449 ?auto_76455 ) ) ( not ( = ?auto_76450 ?auto_76455 ) ) ( not ( = ?auto_76451 ?auto_76455 ) ) ( not ( = ?auto_76452 ?auto_76455 ) ) ( not ( = ?auto_76453 ?auto_76455 ) ) ( not ( = ?auto_76454 ?auto_76455 ) ) ( ON ?auto_76449 ?auto_76448 ) ( CLEAR ?auto_76449 ) ( ON-TABLE ?auto_76455 ) ( HOLDING ?auto_76450 ) ( CLEAR ?auto_76451 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76454 ?auto_76453 ?auto_76452 ?auto_76451 ?auto_76450 )
      ( MAKE-7PILE ?auto_76448 ?auto_76449 ?auto_76450 ?auto_76451 ?auto_76452 ?auto_76453 ?auto_76454 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76456 - BLOCK
      ?auto_76457 - BLOCK
      ?auto_76458 - BLOCK
      ?auto_76459 - BLOCK
      ?auto_76460 - BLOCK
      ?auto_76461 - BLOCK
      ?auto_76462 - BLOCK
    )
    :vars
    (
      ?auto_76463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76456 ?auto_76457 ) ) ( not ( = ?auto_76456 ?auto_76458 ) ) ( not ( = ?auto_76456 ?auto_76459 ) ) ( not ( = ?auto_76456 ?auto_76460 ) ) ( not ( = ?auto_76456 ?auto_76461 ) ) ( not ( = ?auto_76456 ?auto_76462 ) ) ( not ( = ?auto_76457 ?auto_76458 ) ) ( not ( = ?auto_76457 ?auto_76459 ) ) ( not ( = ?auto_76457 ?auto_76460 ) ) ( not ( = ?auto_76457 ?auto_76461 ) ) ( not ( = ?auto_76457 ?auto_76462 ) ) ( not ( = ?auto_76458 ?auto_76459 ) ) ( not ( = ?auto_76458 ?auto_76460 ) ) ( not ( = ?auto_76458 ?auto_76461 ) ) ( not ( = ?auto_76458 ?auto_76462 ) ) ( not ( = ?auto_76459 ?auto_76460 ) ) ( not ( = ?auto_76459 ?auto_76461 ) ) ( not ( = ?auto_76459 ?auto_76462 ) ) ( not ( = ?auto_76460 ?auto_76461 ) ) ( not ( = ?auto_76460 ?auto_76462 ) ) ( not ( = ?auto_76461 ?auto_76462 ) ) ( ON-TABLE ?auto_76462 ) ( ON ?auto_76461 ?auto_76462 ) ( ON ?auto_76460 ?auto_76461 ) ( ON ?auto_76459 ?auto_76460 ) ( ON ?auto_76456 ?auto_76463 ) ( not ( = ?auto_76456 ?auto_76463 ) ) ( not ( = ?auto_76457 ?auto_76463 ) ) ( not ( = ?auto_76458 ?auto_76463 ) ) ( not ( = ?auto_76459 ?auto_76463 ) ) ( not ( = ?auto_76460 ?auto_76463 ) ) ( not ( = ?auto_76461 ?auto_76463 ) ) ( not ( = ?auto_76462 ?auto_76463 ) ) ( ON ?auto_76457 ?auto_76456 ) ( ON-TABLE ?auto_76463 ) ( CLEAR ?auto_76459 ) ( ON ?auto_76458 ?auto_76457 ) ( CLEAR ?auto_76458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76463 ?auto_76456 ?auto_76457 )
      ( MAKE-7PILE ?auto_76456 ?auto_76457 ?auto_76458 ?auto_76459 ?auto_76460 ?auto_76461 ?auto_76462 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76464 - BLOCK
      ?auto_76465 - BLOCK
      ?auto_76466 - BLOCK
      ?auto_76467 - BLOCK
      ?auto_76468 - BLOCK
      ?auto_76469 - BLOCK
      ?auto_76470 - BLOCK
    )
    :vars
    (
      ?auto_76471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76464 ?auto_76465 ) ) ( not ( = ?auto_76464 ?auto_76466 ) ) ( not ( = ?auto_76464 ?auto_76467 ) ) ( not ( = ?auto_76464 ?auto_76468 ) ) ( not ( = ?auto_76464 ?auto_76469 ) ) ( not ( = ?auto_76464 ?auto_76470 ) ) ( not ( = ?auto_76465 ?auto_76466 ) ) ( not ( = ?auto_76465 ?auto_76467 ) ) ( not ( = ?auto_76465 ?auto_76468 ) ) ( not ( = ?auto_76465 ?auto_76469 ) ) ( not ( = ?auto_76465 ?auto_76470 ) ) ( not ( = ?auto_76466 ?auto_76467 ) ) ( not ( = ?auto_76466 ?auto_76468 ) ) ( not ( = ?auto_76466 ?auto_76469 ) ) ( not ( = ?auto_76466 ?auto_76470 ) ) ( not ( = ?auto_76467 ?auto_76468 ) ) ( not ( = ?auto_76467 ?auto_76469 ) ) ( not ( = ?auto_76467 ?auto_76470 ) ) ( not ( = ?auto_76468 ?auto_76469 ) ) ( not ( = ?auto_76468 ?auto_76470 ) ) ( not ( = ?auto_76469 ?auto_76470 ) ) ( ON-TABLE ?auto_76470 ) ( ON ?auto_76469 ?auto_76470 ) ( ON ?auto_76468 ?auto_76469 ) ( ON ?auto_76464 ?auto_76471 ) ( not ( = ?auto_76464 ?auto_76471 ) ) ( not ( = ?auto_76465 ?auto_76471 ) ) ( not ( = ?auto_76466 ?auto_76471 ) ) ( not ( = ?auto_76467 ?auto_76471 ) ) ( not ( = ?auto_76468 ?auto_76471 ) ) ( not ( = ?auto_76469 ?auto_76471 ) ) ( not ( = ?auto_76470 ?auto_76471 ) ) ( ON ?auto_76465 ?auto_76464 ) ( ON-TABLE ?auto_76471 ) ( ON ?auto_76466 ?auto_76465 ) ( CLEAR ?auto_76466 ) ( HOLDING ?auto_76467 ) ( CLEAR ?auto_76468 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76470 ?auto_76469 ?auto_76468 ?auto_76467 )
      ( MAKE-7PILE ?auto_76464 ?auto_76465 ?auto_76466 ?auto_76467 ?auto_76468 ?auto_76469 ?auto_76470 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76472 - BLOCK
      ?auto_76473 - BLOCK
      ?auto_76474 - BLOCK
      ?auto_76475 - BLOCK
      ?auto_76476 - BLOCK
      ?auto_76477 - BLOCK
      ?auto_76478 - BLOCK
    )
    :vars
    (
      ?auto_76479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76472 ?auto_76473 ) ) ( not ( = ?auto_76472 ?auto_76474 ) ) ( not ( = ?auto_76472 ?auto_76475 ) ) ( not ( = ?auto_76472 ?auto_76476 ) ) ( not ( = ?auto_76472 ?auto_76477 ) ) ( not ( = ?auto_76472 ?auto_76478 ) ) ( not ( = ?auto_76473 ?auto_76474 ) ) ( not ( = ?auto_76473 ?auto_76475 ) ) ( not ( = ?auto_76473 ?auto_76476 ) ) ( not ( = ?auto_76473 ?auto_76477 ) ) ( not ( = ?auto_76473 ?auto_76478 ) ) ( not ( = ?auto_76474 ?auto_76475 ) ) ( not ( = ?auto_76474 ?auto_76476 ) ) ( not ( = ?auto_76474 ?auto_76477 ) ) ( not ( = ?auto_76474 ?auto_76478 ) ) ( not ( = ?auto_76475 ?auto_76476 ) ) ( not ( = ?auto_76475 ?auto_76477 ) ) ( not ( = ?auto_76475 ?auto_76478 ) ) ( not ( = ?auto_76476 ?auto_76477 ) ) ( not ( = ?auto_76476 ?auto_76478 ) ) ( not ( = ?auto_76477 ?auto_76478 ) ) ( ON-TABLE ?auto_76478 ) ( ON ?auto_76477 ?auto_76478 ) ( ON ?auto_76476 ?auto_76477 ) ( ON ?auto_76472 ?auto_76479 ) ( not ( = ?auto_76472 ?auto_76479 ) ) ( not ( = ?auto_76473 ?auto_76479 ) ) ( not ( = ?auto_76474 ?auto_76479 ) ) ( not ( = ?auto_76475 ?auto_76479 ) ) ( not ( = ?auto_76476 ?auto_76479 ) ) ( not ( = ?auto_76477 ?auto_76479 ) ) ( not ( = ?auto_76478 ?auto_76479 ) ) ( ON ?auto_76473 ?auto_76472 ) ( ON-TABLE ?auto_76479 ) ( ON ?auto_76474 ?auto_76473 ) ( CLEAR ?auto_76476 ) ( ON ?auto_76475 ?auto_76474 ) ( CLEAR ?auto_76475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76479 ?auto_76472 ?auto_76473 ?auto_76474 )
      ( MAKE-7PILE ?auto_76472 ?auto_76473 ?auto_76474 ?auto_76475 ?auto_76476 ?auto_76477 ?auto_76478 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76480 - BLOCK
      ?auto_76481 - BLOCK
      ?auto_76482 - BLOCK
      ?auto_76483 - BLOCK
      ?auto_76484 - BLOCK
      ?auto_76485 - BLOCK
      ?auto_76486 - BLOCK
    )
    :vars
    (
      ?auto_76487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76480 ?auto_76481 ) ) ( not ( = ?auto_76480 ?auto_76482 ) ) ( not ( = ?auto_76480 ?auto_76483 ) ) ( not ( = ?auto_76480 ?auto_76484 ) ) ( not ( = ?auto_76480 ?auto_76485 ) ) ( not ( = ?auto_76480 ?auto_76486 ) ) ( not ( = ?auto_76481 ?auto_76482 ) ) ( not ( = ?auto_76481 ?auto_76483 ) ) ( not ( = ?auto_76481 ?auto_76484 ) ) ( not ( = ?auto_76481 ?auto_76485 ) ) ( not ( = ?auto_76481 ?auto_76486 ) ) ( not ( = ?auto_76482 ?auto_76483 ) ) ( not ( = ?auto_76482 ?auto_76484 ) ) ( not ( = ?auto_76482 ?auto_76485 ) ) ( not ( = ?auto_76482 ?auto_76486 ) ) ( not ( = ?auto_76483 ?auto_76484 ) ) ( not ( = ?auto_76483 ?auto_76485 ) ) ( not ( = ?auto_76483 ?auto_76486 ) ) ( not ( = ?auto_76484 ?auto_76485 ) ) ( not ( = ?auto_76484 ?auto_76486 ) ) ( not ( = ?auto_76485 ?auto_76486 ) ) ( ON-TABLE ?auto_76486 ) ( ON ?auto_76485 ?auto_76486 ) ( ON ?auto_76480 ?auto_76487 ) ( not ( = ?auto_76480 ?auto_76487 ) ) ( not ( = ?auto_76481 ?auto_76487 ) ) ( not ( = ?auto_76482 ?auto_76487 ) ) ( not ( = ?auto_76483 ?auto_76487 ) ) ( not ( = ?auto_76484 ?auto_76487 ) ) ( not ( = ?auto_76485 ?auto_76487 ) ) ( not ( = ?auto_76486 ?auto_76487 ) ) ( ON ?auto_76481 ?auto_76480 ) ( ON-TABLE ?auto_76487 ) ( ON ?auto_76482 ?auto_76481 ) ( ON ?auto_76483 ?auto_76482 ) ( CLEAR ?auto_76483 ) ( HOLDING ?auto_76484 ) ( CLEAR ?auto_76485 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76486 ?auto_76485 ?auto_76484 )
      ( MAKE-7PILE ?auto_76480 ?auto_76481 ?auto_76482 ?auto_76483 ?auto_76484 ?auto_76485 ?auto_76486 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76488 - BLOCK
      ?auto_76489 - BLOCK
      ?auto_76490 - BLOCK
      ?auto_76491 - BLOCK
      ?auto_76492 - BLOCK
      ?auto_76493 - BLOCK
      ?auto_76494 - BLOCK
    )
    :vars
    (
      ?auto_76495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76488 ?auto_76489 ) ) ( not ( = ?auto_76488 ?auto_76490 ) ) ( not ( = ?auto_76488 ?auto_76491 ) ) ( not ( = ?auto_76488 ?auto_76492 ) ) ( not ( = ?auto_76488 ?auto_76493 ) ) ( not ( = ?auto_76488 ?auto_76494 ) ) ( not ( = ?auto_76489 ?auto_76490 ) ) ( not ( = ?auto_76489 ?auto_76491 ) ) ( not ( = ?auto_76489 ?auto_76492 ) ) ( not ( = ?auto_76489 ?auto_76493 ) ) ( not ( = ?auto_76489 ?auto_76494 ) ) ( not ( = ?auto_76490 ?auto_76491 ) ) ( not ( = ?auto_76490 ?auto_76492 ) ) ( not ( = ?auto_76490 ?auto_76493 ) ) ( not ( = ?auto_76490 ?auto_76494 ) ) ( not ( = ?auto_76491 ?auto_76492 ) ) ( not ( = ?auto_76491 ?auto_76493 ) ) ( not ( = ?auto_76491 ?auto_76494 ) ) ( not ( = ?auto_76492 ?auto_76493 ) ) ( not ( = ?auto_76492 ?auto_76494 ) ) ( not ( = ?auto_76493 ?auto_76494 ) ) ( ON-TABLE ?auto_76494 ) ( ON ?auto_76493 ?auto_76494 ) ( ON ?auto_76488 ?auto_76495 ) ( not ( = ?auto_76488 ?auto_76495 ) ) ( not ( = ?auto_76489 ?auto_76495 ) ) ( not ( = ?auto_76490 ?auto_76495 ) ) ( not ( = ?auto_76491 ?auto_76495 ) ) ( not ( = ?auto_76492 ?auto_76495 ) ) ( not ( = ?auto_76493 ?auto_76495 ) ) ( not ( = ?auto_76494 ?auto_76495 ) ) ( ON ?auto_76489 ?auto_76488 ) ( ON-TABLE ?auto_76495 ) ( ON ?auto_76490 ?auto_76489 ) ( ON ?auto_76491 ?auto_76490 ) ( CLEAR ?auto_76493 ) ( ON ?auto_76492 ?auto_76491 ) ( CLEAR ?auto_76492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76495 ?auto_76488 ?auto_76489 ?auto_76490 ?auto_76491 )
      ( MAKE-7PILE ?auto_76488 ?auto_76489 ?auto_76490 ?auto_76491 ?auto_76492 ?auto_76493 ?auto_76494 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76496 - BLOCK
      ?auto_76497 - BLOCK
      ?auto_76498 - BLOCK
      ?auto_76499 - BLOCK
      ?auto_76500 - BLOCK
      ?auto_76501 - BLOCK
      ?auto_76502 - BLOCK
    )
    :vars
    (
      ?auto_76503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76496 ?auto_76497 ) ) ( not ( = ?auto_76496 ?auto_76498 ) ) ( not ( = ?auto_76496 ?auto_76499 ) ) ( not ( = ?auto_76496 ?auto_76500 ) ) ( not ( = ?auto_76496 ?auto_76501 ) ) ( not ( = ?auto_76496 ?auto_76502 ) ) ( not ( = ?auto_76497 ?auto_76498 ) ) ( not ( = ?auto_76497 ?auto_76499 ) ) ( not ( = ?auto_76497 ?auto_76500 ) ) ( not ( = ?auto_76497 ?auto_76501 ) ) ( not ( = ?auto_76497 ?auto_76502 ) ) ( not ( = ?auto_76498 ?auto_76499 ) ) ( not ( = ?auto_76498 ?auto_76500 ) ) ( not ( = ?auto_76498 ?auto_76501 ) ) ( not ( = ?auto_76498 ?auto_76502 ) ) ( not ( = ?auto_76499 ?auto_76500 ) ) ( not ( = ?auto_76499 ?auto_76501 ) ) ( not ( = ?auto_76499 ?auto_76502 ) ) ( not ( = ?auto_76500 ?auto_76501 ) ) ( not ( = ?auto_76500 ?auto_76502 ) ) ( not ( = ?auto_76501 ?auto_76502 ) ) ( ON-TABLE ?auto_76502 ) ( ON ?auto_76496 ?auto_76503 ) ( not ( = ?auto_76496 ?auto_76503 ) ) ( not ( = ?auto_76497 ?auto_76503 ) ) ( not ( = ?auto_76498 ?auto_76503 ) ) ( not ( = ?auto_76499 ?auto_76503 ) ) ( not ( = ?auto_76500 ?auto_76503 ) ) ( not ( = ?auto_76501 ?auto_76503 ) ) ( not ( = ?auto_76502 ?auto_76503 ) ) ( ON ?auto_76497 ?auto_76496 ) ( ON-TABLE ?auto_76503 ) ( ON ?auto_76498 ?auto_76497 ) ( ON ?auto_76499 ?auto_76498 ) ( ON ?auto_76500 ?auto_76499 ) ( CLEAR ?auto_76500 ) ( HOLDING ?auto_76501 ) ( CLEAR ?auto_76502 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76502 ?auto_76501 )
      ( MAKE-7PILE ?auto_76496 ?auto_76497 ?auto_76498 ?auto_76499 ?auto_76500 ?auto_76501 ?auto_76502 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76504 - BLOCK
      ?auto_76505 - BLOCK
      ?auto_76506 - BLOCK
      ?auto_76507 - BLOCK
      ?auto_76508 - BLOCK
      ?auto_76509 - BLOCK
      ?auto_76510 - BLOCK
    )
    :vars
    (
      ?auto_76511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76504 ?auto_76505 ) ) ( not ( = ?auto_76504 ?auto_76506 ) ) ( not ( = ?auto_76504 ?auto_76507 ) ) ( not ( = ?auto_76504 ?auto_76508 ) ) ( not ( = ?auto_76504 ?auto_76509 ) ) ( not ( = ?auto_76504 ?auto_76510 ) ) ( not ( = ?auto_76505 ?auto_76506 ) ) ( not ( = ?auto_76505 ?auto_76507 ) ) ( not ( = ?auto_76505 ?auto_76508 ) ) ( not ( = ?auto_76505 ?auto_76509 ) ) ( not ( = ?auto_76505 ?auto_76510 ) ) ( not ( = ?auto_76506 ?auto_76507 ) ) ( not ( = ?auto_76506 ?auto_76508 ) ) ( not ( = ?auto_76506 ?auto_76509 ) ) ( not ( = ?auto_76506 ?auto_76510 ) ) ( not ( = ?auto_76507 ?auto_76508 ) ) ( not ( = ?auto_76507 ?auto_76509 ) ) ( not ( = ?auto_76507 ?auto_76510 ) ) ( not ( = ?auto_76508 ?auto_76509 ) ) ( not ( = ?auto_76508 ?auto_76510 ) ) ( not ( = ?auto_76509 ?auto_76510 ) ) ( ON-TABLE ?auto_76510 ) ( ON ?auto_76504 ?auto_76511 ) ( not ( = ?auto_76504 ?auto_76511 ) ) ( not ( = ?auto_76505 ?auto_76511 ) ) ( not ( = ?auto_76506 ?auto_76511 ) ) ( not ( = ?auto_76507 ?auto_76511 ) ) ( not ( = ?auto_76508 ?auto_76511 ) ) ( not ( = ?auto_76509 ?auto_76511 ) ) ( not ( = ?auto_76510 ?auto_76511 ) ) ( ON ?auto_76505 ?auto_76504 ) ( ON-TABLE ?auto_76511 ) ( ON ?auto_76506 ?auto_76505 ) ( ON ?auto_76507 ?auto_76506 ) ( ON ?auto_76508 ?auto_76507 ) ( CLEAR ?auto_76510 ) ( ON ?auto_76509 ?auto_76508 ) ( CLEAR ?auto_76509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76511 ?auto_76504 ?auto_76505 ?auto_76506 ?auto_76507 ?auto_76508 )
      ( MAKE-7PILE ?auto_76504 ?auto_76505 ?auto_76506 ?auto_76507 ?auto_76508 ?auto_76509 ?auto_76510 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76512 - BLOCK
      ?auto_76513 - BLOCK
      ?auto_76514 - BLOCK
      ?auto_76515 - BLOCK
      ?auto_76516 - BLOCK
      ?auto_76517 - BLOCK
      ?auto_76518 - BLOCK
    )
    :vars
    (
      ?auto_76519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76512 ?auto_76513 ) ) ( not ( = ?auto_76512 ?auto_76514 ) ) ( not ( = ?auto_76512 ?auto_76515 ) ) ( not ( = ?auto_76512 ?auto_76516 ) ) ( not ( = ?auto_76512 ?auto_76517 ) ) ( not ( = ?auto_76512 ?auto_76518 ) ) ( not ( = ?auto_76513 ?auto_76514 ) ) ( not ( = ?auto_76513 ?auto_76515 ) ) ( not ( = ?auto_76513 ?auto_76516 ) ) ( not ( = ?auto_76513 ?auto_76517 ) ) ( not ( = ?auto_76513 ?auto_76518 ) ) ( not ( = ?auto_76514 ?auto_76515 ) ) ( not ( = ?auto_76514 ?auto_76516 ) ) ( not ( = ?auto_76514 ?auto_76517 ) ) ( not ( = ?auto_76514 ?auto_76518 ) ) ( not ( = ?auto_76515 ?auto_76516 ) ) ( not ( = ?auto_76515 ?auto_76517 ) ) ( not ( = ?auto_76515 ?auto_76518 ) ) ( not ( = ?auto_76516 ?auto_76517 ) ) ( not ( = ?auto_76516 ?auto_76518 ) ) ( not ( = ?auto_76517 ?auto_76518 ) ) ( ON ?auto_76512 ?auto_76519 ) ( not ( = ?auto_76512 ?auto_76519 ) ) ( not ( = ?auto_76513 ?auto_76519 ) ) ( not ( = ?auto_76514 ?auto_76519 ) ) ( not ( = ?auto_76515 ?auto_76519 ) ) ( not ( = ?auto_76516 ?auto_76519 ) ) ( not ( = ?auto_76517 ?auto_76519 ) ) ( not ( = ?auto_76518 ?auto_76519 ) ) ( ON ?auto_76513 ?auto_76512 ) ( ON-TABLE ?auto_76519 ) ( ON ?auto_76514 ?auto_76513 ) ( ON ?auto_76515 ?auto_76514 ) ( ON ?auto_76516 ?auto_76515 ) ( ON ?auto_76517 ?auto_76516 ) ( CLEAR ?auto_76517 ) ( HOLDING ?auto_76518 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76518 )
      ( MAKE-7PILE ?auto_76512 ?auto_76513 ?auto_76514 ?auto_76515 ?auto_76516 ?auto_76517 ?auto_76518 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76520 - BLOCK
      ?auto_76521 - BLOCK
      ?auto_76522 - BLOCK
      ?auto_76523 - BLOCK
      ?auto_76524 - BLOCK
      ?auto_76525 - BLOCK
      ?auto_76526 - BLOCK
    )
    :vars
    (
      ?auto_76527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76520 ?auto_76521 ) ) ( not ( = ?auto_76520 ?auto_76522 ) ) ( not ( = ?auto_76520 ?auto_76523 ) ) ( not ( = ?auto_76520 ?auto_76524 ) ) ( not ( = ?auto_76520 ?auto_76525 ) ) ( not ( = ?auto_76520 ?auto_76526 ) ) ( not ( = ?auto_76521 ?auto_76522 ) ) ( not ( = ?auto_76521 ?auto_76523 ) ) ( not ( = ?auto_76521 ?auto_76524 ) ) ( not ( = ?auto_76521 ?auto_76525 ) ) ( not ( = ?auto_76521 ?auto_76526 ) ) ( not ( = ?auto_76522 ?auto_76523 ) ) ( not ( = ?auto_76522 ?auto_76524 ) ) ( not ( = ?auto_76522 ?auto_76525 ) ) ( not ( = ?auto_76522 ?auto_76526 ) ) ( not ( = ?auto_76523 ?auto_76524 ) ) ( not ( = ?auto_76523 ?auto_76525 ) ) ( not ( = ?auto_76523 ?auto_76526 ) ) ( not ( = ?auto_76524 ?auto_76525 ) ) ( not ( = ?auto_76524 ?auto_76526 ) ) ( not ( = ?auto_76525 ?auto_76526 ) ) ( ON ?auto_76520 ?auto_76527 ) ( not ( = ?auto_76520 ?auto_76527 ) ) ( not ( = ?auto_76521 ?auto_76527 ) ) ( not ( = ?auto_76522 ?auto_76527 ) ) ( not ( = ?auto_76523 ?auto_76527 ) ) ( not ( = ?auto_76524 ?auto_76527 ) ) ( not ( = ?auto_76525 ?auto_76527 ) ) ( not ( = ?auto_76526 ?auto_76527 ) ) ( ON ?auto_76521 ?auto_76520 ) ( ON-TABLE ?auto_76527 ) ( ON ?auto_76522 ?auto_76521 ) ( ON ?auto_76523 ?auto_76522 ) ( ON ?auto_76524 ?auto_76523 ) ( ON ?auto_76525 ?auto_76524 ) ( ON ?auto_76526 ?auto_76525 ) ( CLEAR ?auto_76526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76527 ?auto_76520 ?auto_76521 ?auto_76522 ?auto_76523 ?auto_76524 ?auto_76525 )
      ( MAKE-7PILE ?auto_76520 ?auto_76521 ?auto_76522 ?auto_76523 ?auto_76524 ?auto_76525 ?auto_76526 ) )
  )

)

