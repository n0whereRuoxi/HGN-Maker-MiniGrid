( define ( domain Rover )
  ( :requirements :strips :typing :equality :htn )
  ( :types camera lander mode objective rover store waypoint )
  ( :predicates
    ( AT ?R - ROVER ?Y - WAYPOINT )
    ( AT_LANDER ?L - LANDER ?Y - WAYPOINT )
    ( CAN_TRAVERSE ?R - ROVER ?X - WAYPOINT ?Y - WAYPOINT )
    ( EQUIPPED_FOR_SOIL_ANALYSIS ?R - ROVER )
    ( EQUIPPED_FOR_ROCK_ANALYSIS ?R - ROVER )
    ( EQUIPPED_FOR_IMAGING ?R - ROVER )
    ( EMPTY ?S - STORE )
    ( HAVE_ROCK_ANALYSIS ?R - ROVER ?W - WAYPOINT )
    ( HAVE_SOIL_ANALYSIS ?R - ROVER ?W - WAYPOINT )
    ( FULL ?S - STORE )
    ( CALIBRATED ?C - CAMERA ?R - ROVER )
    ( SUPPORTS ?C - CAMERA ?M - MODE )
    ( AVAILABLE ?R - ROVER )
    ( VISIBLE ?W - WAYPOINT ?P - WAYPOINT )
    ( HAVE_IMAGE ?R - ROVER ?O - OBJECTIVE ?M - MODE )
    ( COMMUNICATED_SOIL_DATA ?W - WAYPOINT )
    ( COMMUNICATED_ROCK_DATA ?W - WAYPOINT )
    ( COMMUNICATED_IMAGE_DATA ?O - OBJECTIVE ?M - MODE )
    ( AT_SOIL_SAMPLE ?W - WAYPOINT )
    ( AT_ROCK_SAMPLE ?W - WAYPOINT )
    ( VISIBLE_FROM ?O - OBJECTIVE ?W - WAYPOINT )
    ( STORE_OF ?S - STORE ?R - ROVER )
    ( CALIBRATION_TARGET ?I - CAMERA ?O - OBJECTIVE )
    ( ON_BOARD ?I - CAMERA ?R - ROVER )
    ( CHANNEL_FREE ?L - LANDER )
  )
  ( :action !NAVIGATE
    :parameters
    (
      ?R - ROVER
      ?Y - WAYPOINT
      ?Z - WAYPOINT
    )
    :precondition
    ( and ( CAN_TRAVERSE ?R ?Y ?Z ) ( AVAILABLE ?R ) ( AT ?R ?Y ) ( VISIBLE ?Y ?Z ) )
    :effect
    ( and ( not ( AT ?R ?Y ) ) ( AT ?R ?Z ) )
  )
  ( :action !SAMPLE_SOIL
    :parameters
    (
      ?R - ROVER
      ?S - STORE
      ?P - WAYPOINT
    )
    :precondition
    ( and ( AT ?R ?P ) ( AT_SOIL_SAMPLE ?P ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?R ) ( STORE_OF ?S ?R ) ( EMPTY ?S ) )
    :effect
    ( and ( not ( EMPTY ?S ) ) ( FULL ?S ) ( HAVE_SOIL_ANALYSIS ?R ?P ) ( not ( AT_SOIL_SAMPLE ?P ) ) )
  )
  ( :action !SAMPLE_ROCK
    :parameters
    (
      ?R - ROVER
      ?S - STORE
      ?P - WAYPOINT
    )
    :precondition
    ( and ( AT ?R ?P ) ( AT_ROCK_SAMPLE ?P ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?R ) ( STORE_OF ?S ?R ) ( EMPTY ?S ) )
    :effect
    ( and ( not ( EMPTY ?S ) ) ( FULL ?S ) ( HAVE_ROCK_ANALYSIS ?R ?P ) ( not ( AT_ROCK_SAMPLE ?P ) ) )
  )
  ( :action !DROP
    :parameters
    (
      ?R - ROVER
      ?S - STORE
    )
    :precondition
    ( and ( STORE_OF ?S ?R ) ( FULL ?S ) )
    :effect
    ( and ( not ( FULL ?S ) ) ( EMPTY ?S ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?R - ROVER
      ?I - CAMERA
      ?T - OBJECTIVE
      ?W - WAYPOINT
    )
    :precondition
    ( and ( EQUIPPED_FOR_IMAGING ?R ) ( CALIBRATION_TARGET ?I ?T ) ( AT ?R ?W ) ( VISIBLE_FROM ?T ?W ) ( ON_BOARD ?I ?R ) )
    :effect
    ( and ( CALIBRATED ?I ?R ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?R - ROVER
      ?P - WAYPOINT
      ?O - OBJECTIVE
      ?I - CAMERA
      ?M - MODE
    )
    :precondition
    ( and ( CALIBRATED ?I ?R ) ( ON_BOARD ?I ?R ) ( EQUIPPED_FOR_IMAGING ?R ) ( SUPPORTS ?I ?M ) ( VISIBLE_FROM ?O ?P ) ( AT ?R ?P ) )
    :effect
    ( and ( HAVE_IMAGE ?R ?O ?M ) ( not ( CALIBRATED ?I ?R ) ) )
  )
  ( :action !COMMUNICATE_SOIL_DATA
    :parameters
    (
      ?R - ROVER
      ?L - LANDER
      ?P - WAYPOINT
      ?X - WAYPOINT
      ?Y - WAYPOINT
    )
    :precondition
    ( and ( AT ?R ?X ) ( AT_LANDER ?L ?Y ) ( HAVE_SOIL_ANALYSIS ?R ?P ) ( VISIBLE ?X ?Y ) ( AVAILABLE ?R ) ( CHANNEL_FREE ?L ) )
    :effect
    ( and ( CHANNEL_FREE ?L ) ( COMMUNICATED_SOIL_DATA ?P ) ( AVAILABLE ?R ) )
  )
  ( :action !COMMUNICATE_ROCK_DATA
    :parameters
    (
      ?R - ROVER
      ?L - LANDER
      ?P - WAYPOINT
      ?X - WAYPOINT
      ?Y - WAYPOINT
    )
    :precondition
    ( and ( AT ?R ?X ) ( AT_LANDER ?L ?Y ) ( HAVE_ROCK_ANALYSIS ?R ?P ) ( VISIBLE ?X ?Y ) ( AVAILABLE ?R ) ( CHANNEL_FREE ?L ) )
    :effect
    ( and ( CHANNEL_FREE ?L ) ( COMMUNICATED_ROCK_DATA ?P ) ( AVAILABLE ?R ) )
  )
  ( :action !COMMUNICATE_IMAGE_DATA
    :parameters
    (
      ?R - ROVER
      ?L - LANDER
      ?O - OBJECTIVE
      ?M - MODE
      ?X - WAYPOINT
      ?Y - WAYPOINT
    )
    :precondition
    ( and ( AT ?R ?X ) ( AT_LANDER ?L ?Y ) ( HAVE_IMAGE ?R ?O ?M ) ( VISIBLE ?X ?Y ) ( AVAILABLE ?R ) ( CHANNEL_FREE ?L ) )
    :effect
    ( and ( CHANNEL_FREE ?L ) ( COMMUNICATED_IMAGE_DATA ?O ?M ) ( AVAILABLE ?R ) )
  )
  ( :method GET_SOIL_DATA
    :parameters
    (
      ?LOCATION - WAYPOINT
    )
    :precondition
    ( and ( COMMUNICATED_SOIL_DATA ?LOCATION ) )
    :subtasks
    (  )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?LOCATION - WAYPOINT
    )
    :precondition
    ( and ( COMMUNICATED_ROCK_DATA ?LOCATION ) )
    :subtasks
    (  )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?OBJECTIVE - OBJECTIVE
      ?MODE - MODE
    )
    :precondition
    ( and ( COMMUNICATED_IMAGE_DATA ?OBJECTIVE ?MODE ) )
    :subtasks
    (  )
  )

  ( :method GET_SOIL_DATA-VERIFY
    :parameters
    (
      ?LOCATION - WAYPOINT
    )
    :precondition
    ( and ( COMMUNICATED_SOIL_DATA ?LOCATION ) )
    :subtasks
    (  )
  )

  ( :method GET_ROCK_DATA-VERIFY
    :parameters
    (
      ?LOCATION - WAYPOINT
    )
    :precondition
    ( and ( COMMUNICATED_ROCK_DATA ?LOCATION ) )
    :subtasks
    (  )
  )

  ( :method GET_IMAGE_DATA-VERIFY
    :parameters
    (
      ?OBJECTIVE - OBJECTIVE
      ?MODE - MODE
    )
    :precondition
    ( and ( COMMUNICATED_IMAGE_DATA ?OBJECTIVE ?MODE ) )
    :subtasks
    (  )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2 - OBJECTIVE
      ?AUTO_3 - MODE
    )
    :vars
    (
      ?AUTO_4 - ROVER
      ?AUTO_7 - WAYPOINT
      ?AUTO_6 - LANDER
      ?AUTO_5 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_4 ?AUTO_7 ) ( AT_LANDER ?AUTO_6 ?AUTO_5 ) ( HAVE_IMAGE ?AUTO_4 ?AUTO_2 ?AUTO_3 ) ( VISIBLE ?AUTO_7 ?AUTO_5 ) ( AVAILABLE ?AUTO_4 ) ( CHANNEL_FREE ?AUTO_6 ) ( not ( = ?AUTO_7 ?AUTO_5 ) ) )
    :subtasks
    ( ( !COMMUNICATE_IMAGE_DATA ?AUTO_4 ?AUTO_6 ?AUTO_2 ?AUTO_3 ?AUTO_7 ?AUTO_5 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2 ?AUTO_3 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8 - OBJECTIVE
      ?AUTO_9 - MODE
    )
    :vars
    (
      ?AUTO_10 - ROVER
      ?AUTO_13 - WAYPOINT
      ?AUTO_12 - LANDER
      ?AUTO_11 - WAYPOINT
      ?AUTO_14 - CAMERA
    )
    :precondition
    ( and ( AT ?AUTO_10 ?AUTO_13 ) ( AT_LANDER ?AUTO_12 ?AUTO_11 ) ( VISIBLE ?AUTO_13 ?AUTO_11 ) ( AVAILABLE ?AUTO_10 ) ( CHANNEL_FREE ?AUTO_12 ) ( not ( = ?AUTO_13 ?AUTO_11 ) ) ( CALIBRATED ?AUTO_14 ?AUTO_10 ) ( ON_BOARD ?AUTO_14 ?AUTO_10 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10 ) ( SUPPORTS ?AUTO_14 ?AUTO_9 ) ( VISIBLE_FROM ?AUTO_8 ?AUTO_13 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_10 ?AUTO_13 ?AUTO_8 ?AUTO_14 ?AUTO_9 )
      ( GET_IMAGE_DATA ?AUTO_8 ?AUTO_9 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8 ?AUTO_9 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_15 - OBJECTIVE
      ?AUTO_16 - MODE
    )
    :vars
    (
      ?AUTO_20 - ROVER
      ?AUTO_19 - WAYPOINT
      ?AUTO_18 - LANDER
      ?AUTO_17 - WAYPOINT
      ?AUTO_21 - CAMERA
    )
    :precondition
    ( and ( AT ?AUTO_20 ?AUTO_19 ) ( AT_LANDER ?AUTO_18 ?AUTO_17 ) ( VISIBLE ?AUTO_19 ?AUTO_17 ) ( AVAILABLE ?AUTO_20 ) ( CHANNEL_FREE ?AUTO_18 ) ( not ( = ?AUTO_19 ?AUTO_17 ) ) ( ON_BOARD ?AUTO_21 ?AUTO_20 ) ( EQUIPPED_FOR_IMAGING ?AUTO_20 ) ( SUPPORTS ?AUTO_21 ?AUTO_16 ) ( VISIBLE_FROM ?AUTO_15 ?AUTO_19 ) ( CALIBRATION_TARGET ?AUTO_21 ?AUTO_15 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_20 ?AUTO_21 ?AUTO_15 ?AUTO_19 )
      ( GET_IMAGE_DATA ?AUTO_15 ?AUTO_16 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_15 ?AUTO_16 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_22 - OBJECTIVE
      ?AUTO_23 - MODE
    )
    :vars
    (
      ?AUTO_24 - LANDER
      ?AUTO_25 - WAYPOINT
      ?AUTO_26 - WAYPOINT
      ?AUTO_28 - ROVER
      ?AUTO_27 - CAMERA
      ?AUTO_29 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_24 ?AUTO_25 ) ( VISIBLE ?AUTO_26 ?AUTO_25 ) ( AVAILABLE ?AUTO_28 ) ( CHANNEL_FREE ?AUTO_24 ) ( not ( = ?AUTO_26 ?AUTO_25 ) ) ( ON_BOARD ?AUTO_27 ?AUTO_28 ) ( EQUIPPED_FOR_IMAGING ?AUTO_28 ) ( SUPPORTS ?AUTO_27 ?AUTO_23 ) ( VISIBLE_FROM ?AUTO_22 ?AUTO_26 ) ( CALIBRATION_TARGET ?AUTO_27 ?AUTO_22 ) ( CAN_TRAVERSE ?AUTO_28 ?AUTO_29 ?AUTO_26 ) ( AT ?AUTO_28 ?AUTO_29 ) ( VISIBLE ?AUTO_29 ?AUTO_26 ) ( not ( = ?AUTO_25 ?AUTO_29 ) ) ( not ( = ?AUTO_26 ?AUTO_29 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_28 ?AUTO_29 ?AUTO_26 )
      ( GET_IMAGE_DATA ?AUTO_22 ?AUTO_23 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_22 ?AUTO_23 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_31 - WAYPOINT
    )
    :vars
    (
      ?AUTO_32 - ROVER
      ?AUTO_34 - LANDER
      ?AUTO_33 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_32 ?AUTO_31 ) ( AT_LANDER ?AUTO_34 ?AUTO_33 ) ( HAVE_ROCK_ANALYSIS ?AUTO_32 ?AUTO_31 ) ( VISIBLE ?AUTO_31 ?AUTO_33 ) ( AVAILABLE ?AUTO_32 ) ( CHANNEL_FREE ?AUTO_34 ) ( not ( = ?AUTO_31 ?AUTO_33 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_32 ?AUTO_34 ?AUTO_31 ?AUTO_31 ?AUTO_33 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_31 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_35 - WAYPOINT
    )
    :vars
    (
      ?AUTO_38 - ROVER
      ?AUTO_36 - LANDER
      ?AUTO_37 - WAYPOINT
      ?AUTO_39 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_38 ?AUTO_35 ) ( AT_LANDER ?AUTO_36 ?AUTO_37 ) ( VISIBLE ?AUTO_35 ?AUTO_37 ) ( AVAILABLE ?AUTO_38 ) ( CHANNEL_FREE ?AUTO_36 ) ( not ( = ?AUTO_35 ?AUTO_37 ) ) ( AT_ROCK_SAMPLE ?AUTO_35 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_38 ) ( STORE_OF ?AUTO_39 ?AUTO_38 ) ( EMPTY ?AUTO_39 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_38 ?AUTO_39 ?AUTO_35 )
      ( GET_ROCK_DATA ?AUTO_35 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_35 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_40 - WAYPOINT
    )
    :vars
    (
      ?AUTO_41 - LANDER
      ?AUTO_43 - WAYPOINT
      ?AUTO_42 - ROVER
      ?AUTO_44 - STORE
      ?AUTO_45 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_41 ?AUTO_43 ) ( VISIBLE ?AUTO_40 ?AUTO_43 ) ( AVAILABLE ?AUTO_42 ) ( CHANNEL_FREE ?AUTO_41 ) ( not ( = ?AUTO_40 ?AUTO_43 ) ) ( AT_ROCK_SAMPLE ?AUTO_40 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_42 ) ( STORE_OF ?AUTO_44 ?AUTO_42 ) ( EMPTY ?AUTO_44 ) ( CAN_TRAVERSE ?AUTO_42 ?AUTO_45 ?AUTO_40 ) ( AT ?AUTO_42 ?AUTO_45 ) ( VISIBLE ?AUTO_45 ?AUTO_40 ) ( not ( = ?AUTO_40 ?AUTO_45 ) ) ( not ( = ?AUTO_43 ?AUTO_45 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_42 ?AUTO_45 ?AUTO_40 )
      ( GET_ROCK_DATA ?AUTO_40 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_40 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_51 - WAYPOINT
    )
    :vars
    (
      ?AUTO_52 - ROVER
      ?AUTO_54 - LANDER
      ?AUTO_53 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_52 ?AUTO_51 ) ( AT_LANDER ?AUTO_54 ?AUTO_53 ) ( HAVE_SOIL_ANALYSIS ?AUTO_52 ?AUTO_51 ) ( VISIBLE ?AUTO_51 ?AUTO_53 ) ( AVAILABLE ?AUTO_52 ) ( CHANNEL_FREE ?AUTO_54 ) ( not ( = ?AUTO_51 ?AUTO_53 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_52 ?AUTO_54 ?AUTO_51 ?AUTO_51 ?AUTO_53 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_51 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_55 - WAYPOINT
    )
    :vars
    (
      ?AUTO_56 - ROVER
      ?AUTO_58 - LANDER
      ?AUTO_57 - WAYPOINT
      ?AUTO_59 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_56 ?AUTO_55 ) ( AT_LANDER ?AUTO_58 ?AUTO_57 ) ( VISIBLE ?AUTO_55 ?AUTO_57 ) ( AVAILABLE ?AUTO_56 ) ( CHANNEL_FREE ?AUTO_58 ) ( not ( = ?AUTO_55 ?AUTO_57 ) ) ( AT_SOIL_SAMPLE ?AUTO_55 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_56 ) ( STORE_OF ?AUTO_59 ?AUTO_56 ) ( EMPTY ?AUTO_59 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_56 ?AUTO_59 ?AUTO_55 )
      ( GET_SOIL_DATA ?AUTO_55 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_55 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_77 - WAYPOINT
    )
    :vars
    (
      ?AUTO_78 - ROVER
      ?AUTO_80 - LANDER
      ?AUTO_81 - WAYPOINT
      ?AUTO_79 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_78 ?AUTO_77 ) ( AT_LANDER ?AUTO_80 ?AUTO_81 ) ( VISIBLE ?AUTO_77 ?AUTO_81 ) ( AVAILABLE ?AUTO_78 ) ( CHANNEL_FREE ?AUTO_80 ) ( not ( = ?AUTO_77 ?AUTO_81 ) ) ( AT_ROCK_SAMPLE ?AUTO_77 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_78 ) ( STORE_OF ?AUTO_79 ?AUTO_78 ) ( FULL ?AUTO_79 ) )
    :subtasks
    ( ( !DROP ?AUTO_78 ?AUTO_79 )
      ( GET_ROCK_DATA ?AUTO_77 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_77 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_92 - WAYPOINT
    )
    :vars
    (
      ?AUTO_93 - ROVER
      ?AUTO_95 - WAYPOINT
      ?AUTO_94 - LANDER
    )
    :precondition
    ( and ( AT ?AUTO_93 ?AUTO_95 ) ( AT_LANDER ?AUTO_94 ?AUTO_92 ) ( HAVE_SOIL_ANALYSIS ?AUTO_93 ?AUTO_92 ) ( VISIBLE ?AUTO_95 ?AUTO_92 ) ( AVAILABLE ?AUTO_93 ) ( CHANNEL_FREE ?AUTO_94 ) ( not ( = ?AUTO_92 ?AUTO_95 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_93 ?AUTO_94 ?AUTO_92 ?AUTO_95 ?AUTO_92 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_92 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_96 - WAYPOINT
    )
    :vars
    (
      ?AUTO_98 - LANDER
      ?AUTO_97 - ROVER
      ?AUTO_99 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_98 ?AUTO_96 ) ( HAVE_SOIL_ANALYSIS ?AUTO_97 ?AUTO_96 ) ( VISIBLE ?AUTO_99 ?AUTO_96 ) ( AVAILABLE ?AUTO_97 ) ( CHANNEL_FREE ?AUTO_98 ) ( not ( = ?AUTO_96 ?AUTO_99 ) ) ( CAN_TRAVERSE ?AUTO_97 ?AUTO_96 ?AUTO_99 ) ( AT ?AUTO_97 ?AUTO_96 ) ( VISIBLE ?AUTO_96 ?AUTO_99 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_97 ?AUTO_96 ?AUTO_99 )
      ( GET_SOIL_DATA ?AUTO_96 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_96 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_101 - WAYPOINT
    )
    :vars
    (
      ?AUTO_103 - LANDER
      ?AUTO_102 - WAYPOINT
      ?AUTO_104 - ROVER
      ?AUTO_105 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_103 ?AUTO_101 ) ( VISIBLE ?AUTO_102 ?AUTO_101 ) ( AVAILABLE ?AUTO_104 ) ( CHANNEL_FREE ?AUTO_103 ) ( not ( = ?AUTO_101 ?AUTO_102 ) ) ( CAN_TRAVERSE ?AUTO_104 ?AUTO_101 ?AUTO_102 ) ( AT ?AUTO_104 ?AUTO_101 ) ( VISIBLE ?AUTO_101 ?AUTO_102 ) ( AT_SOIL_SAMPLE ?AUTO_101 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_104 ) ( STORE_OF ?AUTO_105 ?AUTO_104 ) ( EMPTY ?AUTO_105 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_104 ?AUTO_105 ?AUTO_101 )
      ( GET_SOIL_DATA ?AUTO_101 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_101 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_106 - WAYPOINT
    )
    :vars
    (
      ?AUTO_108 - LANDER
      ?AUTO_107 - WAYPOINT
      ?AUTO_109 - ROVER
      ?AUTO_110 - STORE
      ?AUTO_111 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_108 ?AUTO_106 ) ( VISIBLE ?AUTO_107 ?AUTO_106 ) ( AVAILABLE ?AUTO_109 ) ( CHANNEL_FREE ?AUTO_108 ) ( not ( = ?AUTO_106 ?AUTO_107 ) ) ( CAN_TRAVERSE ?AUTO_109 ?AUTO_106 ?AUTO_107 ) ( VISIBLE ?AUTO_106 ?AUTO_107 ) ( AT_SOIL_SAMPLE ?AUTO_106 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_109 ) ( STORE_OF ?AUTO_110 ?AUTO_109 ) ( EMPTY ?AUTO_110 ) ( CAN_TRAVERSE ?AUTO_109 ?AUTO_111 ?AUTO_106 ) ( AT ?AUTO_109 ?AUTO_111 ) ( VISIBLE ?AUTO_111 ?AUTO_106 ) ( not ( = ?AUTO_106 ?AUTO_111 ) ) ( not ( = ?AUTO_107 ?AUTO_111 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_109 ?AUTO_111 ?AUTO_106 )
      ( GET_SOIL_DATA ?AUTO_106 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_106 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_112 - WAYPOINT
    )
    :vars
    (
      ?AUTO_113 - LANDER
      ?AUTO_114 - WAYPOINT
      ?AUTO_115 - ROVER
      ?AUTO_116 - STORE
      ?AUTO_117 - WAYPOINT
      ?AUTO_118 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_113 ?AUTO_112 ) ( VISIBLE ?AUTO_114 ?AUTO_112 ) ( AVAILABLE ?AUTO_115 ) ( CHANNEL_FREE ?AUTO_113 ) ( not ( = ?AUTO_112 ?AUTO_114 ) ) ( CAN_TRAVERSE ?AUTO_115 ?AUTO_112 ?AUTO_114 ) ( VISIBLE ?AUTO_112 ?AUTO_114 ) ( AT_SOIL_SAMPLE ?AUTO_112 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_115 ) ( STORE_OF ?AUTO_116 ?AUTO_115 ) ( EMPTY ?AUTO_116 ) ( CAN_TRAVERSE ?AUTO_115 ?AUTO_117 ?AUTO_112 ) ( VISIBLE ?AUTO_117 ?AUTO_112 ) ( not ( = ?AUTO_112 ?AUTO_117 ) ) ( not ( = ?AUTO_114 ?AUTO_117 ) ) ( CAN_TRAVERSE ?AUTO_115 ?AUTO_118 ?AUTO_117 ) ( AT ?AUTO_115 ?AUTO_118 ) ( VISIBLE ?AUTO_118 ?AUTO_117 ) ( not ( = ?AUTO_112 ?AUTO_118 ) ) ( not ( = ?AUTO_114 ?AUTO_118 ) ) ( not ( = ?AUTO_117 ?AUTO_118 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_115 ?AUTO_118 ?AUTO_117 )
      ( GET_SOIL_DATA ?AUTO_112 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_112 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_119 - WAYPOINT
    )
    :vars
    (
      ?AUTO_121 - LANDER
      ?AUTO_120 - WAYPOINT
      ?AUTO_123 - ROVER
      ?AUTO_122 - STORE
      ?AUTO_125 - WAYPOINT
      ?AUTO_124 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_121 ?AUTO_119 ) ( VISIBLE ?AUTO_120 ?AUTO_119 ) ( AVAILABLE ?AUTO_123 ) ( CHANNEL_FREE ?AUTO_121 ) ( not ( = ?AUTO_119 ?AUTO_120 ) ) ( CAN_TRAVERSE ?AUTO_123 ?AUTO_119 ?AUTO_120 ) ( VISIBLE ?AUTO_119 ?AUTO_120 ) ( AT_SOIL_SAMPLE ?AUTO_119 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_123 ) ( STORE_OF ?AUTO_122 ?AUTO_123 ) ( EMPTY ?AUTO_122 ) ( CAN_TRAVERSE ?AUTO_123 ?AUTO_125 ?AUTO_119 ) ( VISIBLE ?AUTO_125 ?AUTO_119 ) ( not ( = ?AUTO_119 ?AUTO_125 ) ) ( not ( = ?AUTO_120 ?AUTO_125 ) ) ( CAN_TRAVERSE ?AUTO_123 ?AUTO_124 ?AUTO_125 ) ( VISIBLE ?AUTO_124 ?AUTO_125 ) ( not ( = ?AUTO_119 ?AUTO_124 ) ) ( not ( = ?AUTO_120 ?AUTO_124 ) ) ( not ( = ?AUTO_125 ?AUTO_124 ) ) ( CAN_TRAVERSE ?AUTO_123 ?AUTO_120 ?AUTO_124 ) ( AT ?AUTO_123 ?AUTO_120 ) ( VISIBLE ?AUTO_120 ?AUTO_124 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_123 ?AUTO_120 ?AUTO_124 )
      ( GET_SOIL_DATA ?AUTO_119 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_119 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_126 - WAYPOINT
    )
    :vars
    (
      ?AUTO_131 - LANDER
      ?AUTO_128 - WAYPOINT
      ?AUTO_127 - ROVER
      ?AUTO_130 - STORE
      ?AUTO_132 - WAYPOINT
      ?AUTO_129 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_131 ?AUTO_126 ) ( VISIBLE ?AUTO_128 ?AUTO_126 ) ( AVAILABLE ?AUTO_127 ) ( CHANNEL_FREE ?AUTO_131 ) ( not ( = ?AUTO_126 ?AUTO_128 ) ) ( CAN_TRAVERSE ?AUTO_127 ?AUTO_126 ?AUTO_128 ) ( VISIBLE ?AUTO_126 ?AUTO_128 ) ( AT_SOIL_SAMPLE ?AUTO_126 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_127 ) ( STORE_OF ?AUTO_130 ?AUTO_127 ) ( CAN_TRAVERSE ?AUTO_127 ?AUTO_132 ?AUTO_126 ) ( VISIBLE ?AUTO_132 ?AUTO_126 ) ( not ( = ?AUTO_126 ?AUTO_132 ) ) ( not ( = ?AUTO_128 ?AUTO_132 ) ) ( CAN_TRAVERSE ?AUTO_127 ?AUTO_129 ?AUTO_132 ) ( VISIBLE ?AUTO_129 ?AUTO_132 ) ( not ( = ?AUTO_126 ?AUTO_129 ) ) ( not ( = ?AUTO_128 ?AUTO_129 ) ) ( not ( = ?AUTO_132 ?AUTO_129 ) ) ( CAN_TRAVERSE ?AUTO_127 ?AUTO_128 ?AUTO_129 ) ( AT ?AUTO_127 ?AUTO_128 ) ( VISIBLE ?AUTO_128 ?AUTO_129 ) ( FULL ?AUTO_130 ) )
    :subtasks
    ( ( !DROP ?AUTO_127 ?AUTO_130 )
      ( GET_SOIL_DATA ?AUTO_126 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_126 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_133 - WAYPOINT
    )
    :vars
    (
      ?AUTO_139 - LANDER
      ?AUTO_137 - WAYPOINT
      ?AUTO_136 - ROVER
      ?AUTO_134 - STORE
      ?AUTO_138 - WAYPOINT
      ?AUTO_135 - WAYPOINT
      ?AUTO_140 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_139 ?AUTO_133 ) ( VISIBLE ?AUTO_137 ?AUTO_133 ) ( AVAILABLE ?AUTO_136 ) ( CHANNEL_FREE ?AUTO_139 ) ( not ( = ?AUTO_133 ?AUTO_137 ) ) ( CAN_TRAVERSE ?AUTO_136 ?AUTO_133 ?AUTO_137 ) ( VISIBLE ?AUTO_133 ?AUTO_137 ) ( AT_SOIL_SAMPLE ?AUTO_133 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_136 ) ( STORE_OF ?AUTO_134 ?AUTO_136 ) ( CAN_TRAVERSE ?AUTO_136 ?AUTO_138 ?AUTO_133 ) ( VISIBLE ?AUTO_138 ?AUTO_133 ) ( not ( = ?AUTO_133 ?AUTO_138 ) ) ( not ( = ?AUTO_137 ?AUTO_138 ) ) ( CAN_TRAVERSE ?AUTO_136 ?AUTO_135 ?AUTO_138 ) ( VISIBLE ?AUTO_135 ?AUTO_138 ) ( not ( = ?AUTO_133 ?AUTO_135 ) ) ( not ( = ?AUTO_137 ?AUTO_135 ) ) ( not ( = ?AUTO_138 ?AUTO_135 ) ) ( CAN_TRAVERSE ?AUTO_136 ?AUTO_137 ?AUTO_135 ) ( VISIBLE ?AUTO_137 ?AUTO_135 ) ( FULL ?AUTO_134 ) ( CAN_TRAVERSE ?AUTO_136 ?AUTO_140 ?AUTO_137 ) ( AT ?AUTO_136 ?AUTO_140 ) ( VISIBLE ?AUTO_140 ?AUTO_137 ) ( not ( = ?AUTO_133 ?AUTO_140 ) ) ( not ( = ?AUTO_137 ?AUTO_140 ) ) ( not ( = ?AUTO_138 ?AUTO_140 ) ) ( not ( = ?AUTO_135 ?AUTO_140 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_136 ?AUTO_140 ?AUTO_137 )
      ( GET_SOIL_DATA ?AUTO_133 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_133 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_142 - WAYPOINT
    )
    :vars
    (
      ?AUTO_145 - LANDER
      ?AUTO_144 - WAYPOINT
      ?AUTO_146 - ROVER
      ?AUTO_147 - STORE
      ?AUTO_148 - WAYPOINT
      ?AUTO_149 - WAYPOINT
      ?AUTO_143 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_145 ?AUTO_142 ) ( VISIBLE ?AUTO_144 ?AUTO_142 ) ( AVAILABLE ?AUTO_146 ) ( CHANNEL_FREE ?AUTO_145 ) ( not ( = ?AUTO_142 ?AUTO_144 ) ) ( CAN_TRAVERSE ?AUTO_146 ?AUTO_142 ?AUTO_144 ) ( VISIBLE ?AUTO_142 ?AUTO_144 ) ( AT_SOIL_SAMPLE ?AUTO_142 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_146 ) ( STORE_OF ?AUTO_147 ?AUTO_146 ) ( CAN_TRAVERSE ?AUTO_146 ?AUTO_148 ?AUTO_142 ) ( VISIBLE ?AUTO_148 ?AUTO_142 ) ( not ( = ?AUTO_142 ?AUTO_148 ) ) ( not ( = ?AUTO_144 ?AUTO_148 ) ) ( CAN_TRAVERSE ?AUTO_146 ?AUTO_149 ?AUTO_148 ) ( VISIBLE ?AUTO_149 ?AUTO_148 ) ( not ( = ?AUTO_142 ?AUTO_149 ) ) ( not ( = ?AUTO_144 ?AUTO_149 ) ) ( not ( = ?AUTO_148 ?AUTO_149 ) ) ( CAN_TRAVERSE ?AUTO_146 ?AUTO_144 ?AUTO_149 ) ( VISIBLE ?AUTO_144 ?AUTO_149 ) ( CAN_TRAVERSE ?AUTO_146 ?AUTO_143 ?AUTO_144 ) ( AT ?AUTO_146 ?AUTO_143 ) ( VISIBLE ?AUTO_143 ?AUTO_144 ) ( not ( = ?AUTO_142 ?AUTO_143 ) ) ( not ( = ?AUTO_144 ?AUTO_143 ) ) ( not ( = ?AUTO_148 ?AUTO_143 ) ) ( not ( = ?AUTO_149 ?AUTO_143 ) ) ( AT_ROCK_SAMPLE ?AUTO_143 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_146 ) ( EMPTY ?AUTO_147 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_146 ?AUTO_147 ?AUTO_143 )
      ( GET_SOIL_DATA ?AUTO_142 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_142 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_171 - WAYPOINT
    )
    :vars
    (
      ?AUTO_173 - LANDER
      ?AUTO_174 - WAYPOINT
      ?AUTO_172 - ROVER
      ?AUTO_175 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_173 ?AUTO_174 ) ( VISIBLE ?AUTO_171 ?AUTO_174 ) ( AVAILABLE ?AUTO_172 ) ( CHANNEL_FREE ?AUTO_173 ) ( not ( = ?AUTO_171 ?AUTO_174 ) ) ( AT_SOIL_SAMPLE ?AUTO_171 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_172 ) ( STORE_OF ?AUTO_175 ?AUTO_172 ) ( EMPTY ?AUTO_175 ) ( CAN_TRAVERSE ?AUTO_172 ?AUTO_174 ?AUTO_171 ) ( AT ?AUTO_172 ?AUTO_174 ) ( VISIBLE ?AUTO_174 ?AUTO_171 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_172 ?AUTO_174 ?AUTO_171 )
      ( GET_SOIL_DATA ?AUTO_171 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_171 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_176 - WAYPOINT
    )
    :vars
    (
      ?AUTO_179 - LANDER
      ?AUTO_178 - WAYPOINT
      ?AUTO_177 - ROVER
      ?AUTO_180 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_179 ?AUTO_178 ) ( VISIBLE ?AUTO_176 ?AUTO_178 ) ( AVAILABLE ?AUTO_177 ) ( CHANNEL_FREE ?AUTO_179 ) ( not ( = ?AUTO_176 ?AUTO_178 ) ) ( AT_SOIL_SAMPLE ?AUTO_176 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_177 ) ( STORE_OF ?AUTO_180 ?AUTO_177 ) ( CAN_TRAVERSE ?AUTO_177 ?AUTO_178 ?AUTO_176 ) ( AT ?AUTO_177 ?AUTO_178 ) ( VISIBLE ?AUTO_178 ?AUTO_176 ) ( FULL ?AUTO_180 ) )
    :subtasks
    ( ( !DROP ?AUTO_177 ?AUTO_180 )
      ( GET_SOIL_DATA ?AUTO_176 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_176 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_182 - WAYPOINT
    )
    :vars
    (
      ?AUTO_184 - LANDER
      ?AUTO_185 - WAYPOINT
      ?AUTO_186 - ROVER
      ?AUTO_183 - STORE
      ?AUTO_187 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_184 ?AUTO_185 ) ( VISIBLE ?AUTO_182 ?AUTO_185 ) ( AVAILABLE ?AUTO_186 ) ( CHANNEL_FREE ?AUTO_184 ) ( not ( = ?AUTO_182 ?AUTO_185 ) ) ( AT_SOIL_SAMPLE ?AUTO_182 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_186 ) ( STORE_OF ?AUTO_183 ?AUTO_186 ) ( EMPTY ?AUTO_183 ) ( CAN_TRAVERSE ?AUTO_186 ?AUTO_185 ?AUTO_182 ) ( VISIBLE ?AUTO_185 ?AUTO_182 ) ( CAN_TRAVERSE ?AUTO_186 ?AUTO_187 ?AUTO_185 ) ( AT ?AUTO_186 ?AUTO_187 ) ( VISIBLE ?AUTO_187 ?AUTO_185 ) ( not ( = ?AUTO_182 ?AUTO_187 ) ) ( not ( = ?AUTO_185 ?AUTO_187 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_186 ?AUTO_187 ?AUTO_185 )
      ( GET_SOIL_DATA ?AUTO_182 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_182 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_188 - WAYPOINT
    )
    :vars
    (
      ?AUTO_190 - LANDER
      ?AUTO_189 - WAYPOINT
      ?AUTO_193 - ROVER
      ?AUTO_192 - STORE
      ?AUTO_191 - WAYPOINT
      ?AUTO_194 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_190 ?AUTO_189 ) ( VISIBLE ?AUTO_188 ?AUTO_189 ) ( AVAILABLE ?AUTO_193 ) ( CHANNEL_FREE ?AUTO_190 ) ( not ( = ?AUTO_188 ?AUTO_189 ) ) ( AT_SOIL_SAMPLE ?AUTO_188 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_193 ) ( STORE_OF ?AUTO_192 ?AUTO_193 ) ( EMPTY ?AUTO_192 ) ( CAN_TRAVERSE ?AUTO_193 ?AUTO_189 ?AUTO_188 ) ( VISIBLE ?AUTO_189 ?AUTO_188 ) ( CAN_TRAVERSE ?AUTO_193 ?AUTO_191 ?AUTO_189 ) ( VISIBLE ?AUTO_191 ?AUTO_189 ) ( not ( = ?AUTO_188 ?AUTO_191 ) ) ( not ( = ?AUTO_189 ?AUTO_191 ) ) ( CAN_TRAVERSE ?AUTO_193 ?AUTO_194 ?AUTO_191 ) ( AT ?AUTO_193 ?AUTO_194 ) ( VISIBLE ?AUTO_194 ?AUTO_191 ) ( not ( = ?AUTO_188 ?AUTO_194 ) ) ( not ( = ?AUTO_189 ?AUTO_194 ) ) ( not ( = ?AUTO_191 ?AUTO_194 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_193 ?AUTO_194 ?AUTO_191 )
      ( GET_SOIL_DATA ?AUTO_188 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_188 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_196 - WAYPOINT
    )
    :vars
    (
      ?AUTO_198 - ROVER
      ?AUTO_200 - LANDER
      ?AUTO_199 - WAYPOINT
      ?AUTO_197 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_198 ?AUTO_196 ) ( AT_LANDER ?AUTO_200 ?AUTO_199 ) ( VISIBLE ?AUTO_196 ?AUTO_199 ) ( AVAILABLE ?AUTO_198 ) ( CHANNEL_FREE ?AUTO_200 ) ( not ( = ?AUTO_196 ?AUTO_199 ) ) ( AT_SOIL_SAMPLE ?AUTO_196 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_198 ) ( STORE_OF ?AUTO_197 ?AUTO_198 ) ( FULL ?AUTO_197 ) )
    :subtasks
    ( ( !DROP ?AUTO_198 ?AUTO_197 )
      ( GET_SOIL_DATA ?AUTO_196 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_196 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_201 - WAYPOINT
    )
    :vars
    (
      ?AUTO_203 - LANDER
      ?AUTO_205 - WAYPOINT
      ?AUTO_202 - ROVER
      ?AUTO_204 - STORE
      ?AUTO_206 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_203 ?AUTO_205 ) ( VISIBLE ?AUTO_201 ?AUTO_205 ) ( AVAILABLE ?AUTO_202 ) ( CHANNEL_FREE ?AUTO_203 ) ( not ( = ?AUTO_201 ?AUTO_205 ) ) ( AT_SOIL_SAMPLE ?AUTO_201 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_202 ) ( STORE_OF ?AUTO_204 ?AUTO_202 ) ( FULL ?AUTO_204 ) ( CAN_TRAVERSE ?AUTO_202 ?AUTO_206 ?AUTO_201 ) ( AT ?AUTO_202 ?AUTO_206 ) ( VISIBLE ?AUTO_206 ?AUTO_201 ) ( not ( = ?AUTO_201 ?AUTO_206 ) ) ( not ( = ?AUTO_205 ?AUTO_206 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_202 ?AUTO_206 ?AUTO_201 )
      ( GET_SOIL_DATA ?AUTO_201 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_201 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_208 - WAYPOINT
    )
    :vars
    (
      ?AUTO_211 - LANDER
      ?AUTO_213 - WAYPOINT
      ?AUTO_209 - ROVER
      ?AUTO_212 - STORE
      ?AUTO_210 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_211 ?AUTO_213 ) ( VISIBLE ?AUTO_208 ?AUTO_213 ) ( AVAILABLE ?AUTO_209 ) ( CHANNEL_FREE ?AUTO_211 ) ( not ( = ?AUTO_208 ?AUTO_213 ) ) ( AT_SOIL_SAMPLE ?AUTO_208 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_209 ) ( STORE_OF ?AUTO_212 ?AUTO_209 ) ( CAN_TRAVERSE ?AUTO_209 ?AUTO_210 ?AUTO_208 ) ( AT ?AUTO_209 ?AUTO_210 ) ( VISIBLE ?AUTO_210 ?AUTO_208 ) ( not ( = ?AUTO_208 ?AUTO_210 ) ) ( not ( = ?AUTO_213 ?AUTO_210 ) ) ( AT_ROCK_SAMPLE ?AUTO_210 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_209 ) ( EMPTY ?AUTO_212 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_209 ?AUTO_212 ?AUTO_210 )
      ( GET_SOIL_DATA ?AUTO_208 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_208 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_315 - OBJECTIVE
      ?AUTO_316 - MODE
    )
    :vars
    (
      ?AUTO_318 - LANDER
      ?AUTO_317 - WAYPOINT
      ?AUTO_319 - WAYPOINT
      ?AUTO_320 - ROVER
      ?AUTO_321 - CAMERA
      ?AUTO_322 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_318 ?AUTO_317 ) ( VISIBLE ?AUTO_319 ?AUTO_317 ) ( AVAILABLE ?AUTO_320 ) ( CHANNEL_FREE ?AUTO_318 ) ( not ( = ?AUTO_319 ?AUTO_317 ) ) ( CALIBRATED ?AUTO_321 ?AUTO_320 ) ( ON_BOARD ?AUTO_321 ?AUTO_320 ) ( EQUIPPED_FOR_IMAGING ?AUTO_320 ) ( SUPPORTS ?AUTO_321 ?AUTO_316 ) ( VISIBLE_FROM ?AUTO_315 ?AUTO_319 ) ( CAN_TRAVERSE ?AUTO_320 ?AUTO_322 ?AUTO_319 ) ( AT ?AUTO_320 ?AUTO_322 ) ( VISIBLE ?AUTO_322 ?AUTO_319 ) ( not ( = ?AUTO_317 ?AUTO_322 ) ) ( not ( = ?AUTO_319 ?AUTO_322 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_320 ?AUTO_322 ?AUTO_319 )
      ( GET_IMAGE_DATA ?AUTO_315 ?AUTO_316 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_315 ?AUTO_316 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_325 - OBJECTIVE
      ?AUTO_326 - MODE
    )
    :vars
    (
      ?AUTO_328 - LANDER
      ?AUTO_331 - WAYPOINT
      ?AUTO_327 - WAYPOINT
      ?AUTO_330 - ROVER
      ?AUTO_332 - CAMERA
      ?AUTO_329 - WAYPOINT
      ?AUTO_333 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_328 ?AUTO_331 ) ( VISIBLE ?AUTO_327 ?AUTO_331 ) ( AVAILABLE ?AUTO_330 ) ( CHANNEL_FREE ?AUTO_328 ) ( not ( = ?AUTO_327 ?AUTO_331 ) ) ( ON_BOARD ?AUTO_332 ?AUTO_330 ) ( EQUIPPED_FOR_IMAGING ?AUTO_330 ) ( SUPPORTS ?AUTO_332 ?AUTO_326 ) ( VISIBLE_FROM ?AUTO_325 ?AUTO_327 ) ( CAN_TRAVERSE ?AUTO_330 ?AUTO_329 ?AUTO_327 ) ( AT ?AUTO_330 ?AUTO_329 ) ( VISIBLE ?AUTO_329 ?AUTO_327 ) ( not ( = ?AUTO_331 ?AUTO_329 ) ) ( not ( = ?AUTO_327 ?AUTO_329 ) ) ( CALIBRATION_TARGET ?AUTO_332 ?AUTO_333 ) ( VISIBLE_FROM ?AUTO_333 ?AUTO_329 ) ( not ( = ?AUTO_325 ?AUTO_333 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_330 ?AUTO_332 ?AUTO_333 ?AUTO_329 )
      ( GET_IMAGE_DATA ?AUTO_325 ?AUTO_326 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_325 ?AUTO_326 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_350 - OBJECTIVE
      ?AUTO_351 - MODE
    )
    :vars
    (
      ?AUTO_352 - LANDER
      ?AUTO_355 - WAYPOINT
      ?AUTO_353 - WAYPOINT
      ?AUTO_358 - ROVER
      ?AUTO_356 - CAMERA
      ?AUTO_357 - WAYPOINT
      ?AUTO_354 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_352 ?AUTO_355 ) ( VISIBLE ?AUTO_353 ?AUTO_355 ) ( AVAILABLE ?AUTO_358 ) ( CHANNEL_FREE ?AUTO_352 ) ( not ( = ?AUTO_353 ?AUTO_355 ) ) ( ON_BOARD ?AUTO_356 ?AUTO_358 ) ( EQUIPPED_FOR_IMAGING ?AUTO_358 ) ( SUPPORTS ?AUTO_356 ?AUTO_351 ) ( VISIBLE_FROM ?AUTO_350 ?AUTO_353 ) ( CAN_TRAVERSE ?AUTO_358 ?AUTO_357 ?AUTO_353 ) ( VISIBLE ?AUTO_357 ?AUTO_353 ) ( not ( = ?AUTO_355 ?AUTO_357 ) ) ( not ( = ?AUTO_353 ?AUTO_357 ) ) ( CALIBRATION_TARGET ?AUTO_356 ?AUTO_354 ) ( VISIBLE_FROM ?AUTO_354 ?AUTO_357 ) ( not ( = ?AUTO_350 ?AUTO_354 ) ) ( CAN_TRAVERSE ?AUTO_358 ?AUTO_353 ?AUTO_357 ) ( AT ?AUTO_358 ?AUTO_353 ) ( VISIBLE ?AUTO_353 ?AUTO_357 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_358 ?AUTO_353 ?AUTO_357 )
      ( GET_IMAGE_DATA ?AUTO_350 ?AUTO_351 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_350 ?AUTO_351 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_403 - WAYPOINT
    )
    :vars
    (
      ?AUTO_405 - LANDER
      ?AUTO_406 - WAYPOINT
      ?AUTO_404 - ROVER
      ?AUTO_407 - STORE
      ?AUTO_408 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_405 ?AUTO_406 ) ( VISIBLE ?AUTO_403 ?AUTO_406 ) ( AVAILABLE ?AUTO_404 ) ( CHANNEL_FREE ?AUTO_405 ) ( not ( = ?AUTO_403 ?AUTO_406 ) ) ( AT_ROCK_SAMPLE ?AUTO_403 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_404 ) ( STORE_OF ?AUTO_407 ?AUTO_404 ) ( FULL ?AUTO_407 ) ( CAN_TRAVERSE ?AUTO_404 ?AUTO_408 ?AUTO_403 ) ( AT ?AUTO_404 ?AUTO_408 ) ( VISIBLE ?AUTO_408 ?AUTO_403 ) ( not ( = ?AUTO_403 ?AUTO_408 ) ) ( not ( = ?AUTO_406 ?AUTO_408 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_404 ?AUTO_408 ?AUTO_403 )
      ( GET_ROCK_DATA ?AUTO_403 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_403 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_410 - WAYPOINT
    )
    :vars
    (
      ?AUTO_415 - LANDER
      ?AUTO_414 - WAYPOINT
      ?AUTO_411 - ROVER
      ?AUTO_413 - STORE
      ?AUTO_412 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_415 ?AUTO_414 ) ( VISIBLE ?AUTO_410 ?AUTO_414 ) ( AVAILABLE ?AUTO_411 ) ( CHANNEL_FREE ?AUTO_415 ) ( not ( = ?AUTO_410 ?AUTO_414 ) ) ( AT_ROCK_SAMPLE ?AUTO_410 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_411 ) ( STORE_OF ?AUTO_413 ?AUTO_411 ) ( CAN_TRAVERSE ?AUTO_411 ?AUTO_412 ?AUTO_410 ) ( AT ?AUTO_411 ?AUTO_412 ) ( VISIBLE ?AUTO_412 ?AUTO_410 ) ( not ( = ?AUTO_410 ?AUTO_412 ) ) ( not ( = ?AUTO_414 ?AUTO_412 ) ) ( AT_ROCK_SAMPLE ?AUTO_412 ) ( EMPTY ?AUTO_413 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_411 ?AUTO_413 ?AUTO_412 )
      ( GET_ROCK_DATA ?AUTO_410 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_410 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_459 - WAYPOINT
    )
    :vars
    (
      ?AUTO_461 - LANDER
      ?AUTO_464 - WAYPOINT
      ?AUTO_463 - ROVER
      ?AUTO_462 - STORE
      ?AUTO_460 - WAYPOINT
      ?AUTO_465 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_461 ?AUTO_464 ) ( VISIBLE ?AUTO_459 ?AUTO_464 ) ( AVAILABLE ?AUTO_463 ) ( CHANNEL_FREE ?AUTO_461 ) ( not ( = ?AUTO_459 ?AUTO_464 ) ) ( AT_ROCK_SAMPLE ?AUTO_459 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_463 ) ( STORE_OF ?AUTO_462 ?AUTO_463 ) ( FULL ?AUTO_462 ) ( CAN_TRAVERSE ?AUTO_463 ?AUTO_460 ?AUTO_459 ) ( VISIBLE ?AUTO_460 ?AUTO_459 ) ( not ( = ?AUTO_459 ?AUTO_460 ) ) ( not ( = ?AUTO_464 ?AUTO_460 ) ) ( CAN_TRAVERSE ?AUTO_463 ?AUTO_465 ?AUTO_460 ) ( AT ?AUTO_463 ?AUTO_465 ) ( VISIBLE ?AUTO_465 ?AUTO_460 ) ( not ( = ?AUTO_459 ?AUTO_465 ) ) ( not ( = ?AUTO_464 ?AUTO_465 ) ) ( not ( = ?AUTO_460 ?AUTO_465 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_463 ?AUTO_465 ?AUTO_460 )
      ( GET_ROCK_DATA ?AUTO_459 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_459 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_467 - WAYPOINT
    )
    :vars
    (
      ?AUTO_473 - LANDER
      ?AUTO_469 - WAYPOINT
      ?AUTO_468 - ROVER
      ?AUTO_470 - STORE
      ?AUTO_471 - WAYPOINT
      ?AUTO_472 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_473 ?AUTO_469 ) ( VISIBLE ?AUTO_467 ?AUTO_469 ) ( AVAILABLE ?AUTO_468 ) ( CHANNEL_FREE ?AUTO_473 ) ( not ( = ?AUTO_467 ?AUTO_469 ) ) ( AT_ROCK_SAMPLE ?AUTO_467 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_468 ) ( STORE_OF ?AUTO_470 ?AUTO_468 ) ( CAN_TRAVERSE ?AUTO_468 ?AUTO_471 ?AUTO_467 ) ( VISIBLE ?AUTO_471 ?AUTO_467 ) ( not ( = ?AUTO_467 ?AUTO_471 ) ) ( not ( = ?AUTO_469 ?AUTO_471 ) ) ( CAN_TRAVERSE ?AUTO_468 ?AUTO_472 ?AUTO_471 ) ( AT ?AUTO_468 ?AUTO_472 ) ( VISIBLE ?AUTO_472 ?AUTO_471 ) ( not ( = ?AUTO_467 ?AUTO_472 ) ) ( not ( = ?AUTO_469 ?AUTO_472 ) ) ( not ( = ?AUTO_471 ?AUTO_472 ) ) ( AT_ROCK_SAMPLE ?AUTO_472 ) ( EMPTY ?AUTO_470 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_468 ?AUTO_470 ?AUTO_472 )
      ( GET_ROCK_DATA ?AUTO_467 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_467 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_489 - WAYPOINT
    )
    :vars
    (
      ?AUTO_490 - ROVER
      ?AUTO_492 - WAYPOINT
      ?AUTO_491 - LANDER
    )
    :precondition
    ( and ( AT ?AUTO_490 ?AUTO_492 ) ( AT_LANDER ?AUTO_491 ?AUTO_489 ) ( HAVE_ROCK_ANALYSIS ?AUTO_490 ?AUTO_489 ) ( VISIBLE ?AUTO_492 ?AUTO_489 ) ( AVAILABLE ?AUTO_490 ) ( CHANNEL_FREE ?AUTO_491 ) ( not ( = ?AUTO_489 ?AUTO_492 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_490 ?AUTO_491 ?AUTO_489 ?AUTO_492 ?AUTO_489 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_489 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_493 - WAYPOINT
    )
    :vars
    (
      ?AUTO_495 - LANDER
      ?AUTO_494 - ROVER
      ?AUTO_496 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_495 ?AUTO_493 ) ( HAVE_ROCK_ANALYSIS ?AUTO_494 ?AUTO_493 ) ( VISIBLE ?AUTO_496 ?AUTO_493 ) ( AVAILABLE ?AUTO_494 ) ( CHANNEL_FREE ?AUTO_495 ) ( not ( = ?AUTO_493 ?AUTO_496 ) ) ( CAN_TRAVERSE ?AUTO_494 ?AUTO_493 ?AUTO_496 ) ( AT ?AUTO_494 ?AUTO_493 ) ( VISIBLE ?AUTO_493 ?AUTO_496 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_494 ?AUTO_493 ?AUTO_496 )
      ( GET_ROCK_DATA ?AUTO_493 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_493 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_497 - WAYPOINT
    )
    :vars
    (
      ?AUTO_499 - LANDER
      ?AUTO_500 - WAYPOINT
      ?AUTO_498 - ROVER
      ?AUTO_501 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_499 ?AUTO_497 ) ( VISIBLE ?AUTO_500 ?AUTO_497 ) ( AVAILABLE ?AUTO_498 ) ( CHANNEL_FREE ?AUTO_499 ) ( not ( = ?AUTO_497 ?AUTO_500 ) ) ( CAN_TRAVERSE ?AUTO_498 ?AUTO_497 ?AUTO_500 ) ( AT ?AUTO_498 ?AUTO_497 ) ( VISIBLE ?AUTO_497 ?AUTO_500 ) ( AT_ROCK_SAMPLE ?AUTO_497 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_498 ) ( STORE_OF ?AUTO_501 ?AUTO_498 ) ( EMPTY ?AUTO_501 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_498 ?AUTO_501 ?AUTO_497 )
      ( GET_ROCK_DATA ?AUTO_497 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_497 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_502 - WAYPOINT
    )
    :vars
    (
      ?AUTO_505 - LANDER
      ?AUTO_504 - WAYPOINT
      ?AUTO_503 - ROVER
      ?AUTO_506 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_505 ?AUTO_502 ) ( VISIBLE ?AUTO_504 ?AUTO_502 ) ( AVAILABLE ?AUTO_503 ) ( CHANNEL_FREE ?AUTO_505 ) ( not ( = ?AUTO_502 ?AUTO_504 ) ) ( CAN_TRAVERSE ?AUTO_503 ?AUTO_502 ?AUTO_504 ) ( VISIBLE ?AUTO_502 ?AUTO_504 ) ( AT_ROCK_SAMPLE ?AUTO_502 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_503 ) ( STORE_OF ?AUTO_506 ?AUTO_503 ) ( EMPTY ?AUTO_506 ) ( CAN_TRAVERSE ?AUTO_503 ?AUTO_504 ?AUTO_502 ) ( AT ?AUTO_503 ?AUTO_504 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_503 ?AUTO_504 ?AUTO_502 )
      ( GET_ROCK_DATA ?AUTO_502 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_502 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_507 - WAYPOINT
    )
    :vars
    (
      ?AUTO_510 - LANDER
      ?AUTO_509 - WAYPOINT
      ?AUTO_508 - ROVER
      ?AUTO_511 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_510 ?AUTO_507 ) ( VISIBLE ?AUTO_509 ?AUTO_507 ) ( AVAILABLE ?AUTO_508 ) ( CHANNEL_FREE ?AUTO_510 ) ( not ( = ?AUTO_507 ?AUTO_509 ) ) ( CAN_TRAVERSE ?AUTO_508 ?AUTO_507 ?AUTO_509 ) ( VISIBLE ?AUTO_507 ?AUTO_509 ) ( AT_ROCK_SAMPLE ?AUTO_507 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_508 ) ( STORE_OF ?AUTO_511 ?AUTO_508 ) ( CAN_TRAVERSE ?AUTO_508 ?AUTO_509 ?AUTO_507 ) ( AT ?AUTO_508 ?AUTO_509 ) ( FULL ?AUTO_511 ) )
    :subtasks
    ( ( !DROP ?AUTO_508 ?AUTO_511 )
      ( GET_ROCK_DATA ?AUTO_507 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_507 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_515 - WAYPOINT
    )
    :vars
    (
      ?AUTO_517 - LANDER
      ?AUTO_518 - WAYPOINT
      ?AUTO_519 - ROVER
      ?AUTO_516 - STORE
      ?AUTO_520 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_517 ?AUTO_515 ) ( VISIBLE ?AUTO_518 ?AUTO_515 ) ( AVAILABLE ?AUTO_519 ) ( CHANNEL_FREE ?AUTO_517 ) ( not ( = ?AUTO_515 ?AUTO_518 ) ) ( CAN_TRAVERSE ?AUTO_519 ?AUTO_515 ?AUTO_518 ) ( VISIBLE ?AUTO_515 ?AUTO_518 ) ( AT_ROCK_SAMPLE ?AUTO_515 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_519 ) ( STORE_OF ?AUTO_516 ?AUTO_519 ) ( CAN_TRAVERSE ?AUTO_519 ?AUTO_518 ?AUTO_515 ) ( FULL ?AUTO_516 ) ( CAN_TRAVERSE ?AUTO_519 ?AUTO_520 ?AUTO_518 ) ( AT ?AUTO_519 ?AUTO_520 ) ( VISIBLE ?AUTO_520 ?AUTO_518 ) ( not ( = ?AUTO_515 ?AUTO_520 ) ) ( not ( = ?AUTO_518 ?AUTO_520 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_519 ?AUTO_520 ?AUTO_518 )
      ( GET_ROCK_DATA ?AUTO_515 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_515 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_522 - WAYPOINT
    )
    :vars
    (
      ?AUTO_524 - LANDER
      ?AUTO_526 - WAYPOINT
      ?AUTO_527 - ROVER
      ?AUTO_525 - STORE
      ?AUTO_523 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_524 ?AUTO_522 ) ( VISIBLE ?AUTO_526 ?AUTO_522 ) ( AVAILABLE ?AUTO_527 ) ( CHANNEL_FREE ?AUTO_524 ) ( not ( = ?AUTO_522 ?AUTO_526 ) ) ( CAN_TRAVERSE ?AUTO_527 ?AUTO_522 ?AUTO_526 ) ( VISIBLE ?AUTO_522 ?AUTO_526 ) ( AT_ROCK_SAMPLE ?AUTO_522 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_527 ) ( STORE_OF ?AUTO_525 ?AUTO_527 ) ( CAN_TRAVERSE ?AUTO_527 ?AUTO_526 ?AUTO_522 ) ( CAN_TRAVERSE ?AUTO_527 ?AUTO_523 ?AUTO_526 ) ( AT ?AUTO_527 ?AUTO_523 ) ( VISIBLE ?AUTO_523 ?AUTO_526 ) ( not ( = ?AUTO_522 ?AUTO_523 ) ) ( not ( = ?AUTO_526 ?AUTO_523 ) ) ( AT_ROCK_SAMPLE ?AUTO_523 ) ( EMPTY ?AUTO_525 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_527 ?AUTO_525 ?AUTO_523 )
      ( GET_ROCK_DATA ?AUTO_522 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_522 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_529 - WAYPOINT
    )
    :vars
    (
      ?AUTO_530 - LANDER
      ?AUTO_532 - WAYPOINT
      ?AUTO_531 - ROVER
      ?AUTO_534 - STORE
      ?AUTO_533 - WAYPOINT
      ?AUTO_535 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_530 ?AUTO_529 ) ( VISIBLE ?AUTO_532 ?AUTO_529 ) ( AVAILABLE ?AUTO_531 ) ( CHANNEL_FREE ?AUTO_530 ) ( not ( = ?AUTO_529 ?AUTO_532 ) ) ( CAN_TRAVERSE ?AUTO_531 ?AUTO_529 ?AUTO_532 ) ( VISIBLE ?AUTO_529 ?AUTO_532 ) ( AT_ROCK_SAMPLE ?AUTO_529 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_531 ) ( STORE_OF ?AUTO_534 ?AUTO_531 ) ( CAN_TRAVERSE ?AUTO_531 ?AUTO_532 ?AUTO_529 ) ( FULL ?AUTO_534 ) ( CAN_TRAVERSE ?AUTO_531 ?AUTO_533 ?AUTO_532 ) ( VISIBLE ?AUTO_533 ?AUTO_532 ) ( not ( = ?AUTO_529 ?AUTO_533 ) ) ( not ( = ?AUTO_532 ?AUTO_533 ) ) ( CAN_TRAVERSE ?AUTO_531 ?AUTO_535 ?AUTO_533 ) ( AT ?AUTO_531 ?AUTO_535 ) ( VISIBLE ?AUTO_535 ?AUTO_533 ) ( not ( = ?AUTO_529 ?AUTO_535 ) ) ( not ( = ?AUTO_532 ?AUTO_535 ) ) ( not ( = ?AUTO_533 ?AUTO_535 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_531 ?AUTO_535 ?AUTO_533 )
      ( GET_ROCK_DATA ?AUTO_529 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_529 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_537 - WAYPOINT
    )
    :vars
    (
      ?AUTO_540 - LANDER
      ?AUTO_543 - WAYPOINT
      ?AUTO_541 - ROVER
      ?AUTO_538 - STORE
      ?AUTO_542 - WAYPOINT
      ?AUTO_539 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_540 ?AUTO_537 ) ( VISIBLE ?AUTO_543 ?AUTO_537 ) ( AVAILABLE ?AUTO_541 ) ( CHANNEL_FREE ?AUTO_540 ) ( not ( = ?AUTO_537 ?AUTO_543 ) ) ( CAN_TRAVERSE ?AUTO_541 ?AUTO_537 ?AUTO_543 ) ( VISIBLE ?AUTO_537 ?AUTO_543 ) ( AT_ROCK_SAMPLE ?AUTO_537 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_541 ) ( STORE_OF ?AUTO_538 ?AUTO_541 ) ( CAN_TRAVERSE ?AUTO_541 ?AUTO_543 ?AUTO_537 ) ( CAN_TRAVERSE ?AUTO_541 ?AUTO_542 ?AUTO_543 ) ( VISIBLE ?AUTO_542 ?AUTO_543 ) ( not ( = ?AUTO_537 ?AUTO_542 ) ) ( not ( = ?AUTO_543 ?AUTO_542 ) ) ( CAN_TRAVERSE ?AUTO_541 ?AUTO_539 ?AUTO_542 ) ( AT ?AUTO_541 ?AUTO_539 ) ( VISIBLE ?AUTO_539 ?AUTO_542 ) ( not ( = ?AUTO_537 ?AUTO_539 ) ) ( not ( = ?AUTO_543 ?AUTO_539 ) ) ( not ( = ?AUTO_542 ?AUTO_539 ) ) ( AT_ROCK_SAMPLE ?AUTO_539 ) ( EMPTY ?AUTO_538 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_541 ?AUTO_538 ?AUTO_539 )
      ( GET_ROCK_DATA ?AUTO_537 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_537 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_552 - OBJECTIVE
      ?AUTO_553 - MODE
    )
    :vars
    (
      ?AUTO_556 - LANDER
      ?AUTO_555 - WAYPOINT
      ?AUTO_554 - ROVER
      ?AUTO_557 - WAYPOINT
      ?AUTO_558 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_556 ?AUTO_555 ) ( HAVE_IMAGE ?AUTO_554 ?AUTO_552 ?AUTO_553 ) ( VISIBLE ?AUTO_557 ?AUTO_555 ) ( AVAILABLE ?AUTO_554 ) ( CHANNEL_FREE ?AUTO_556 ) ( not ( = ?AUTO_557 ?AUTO_555 ) ) ( CAN_TRAVERSE ?AUTO_554 ?AUTO_558 ?AUTO_557 ) ( AT ?AUTO_554 ?AUTO_558 ) ( VISIBLE ?AUTO_558 ?AUTO_557 ) ( not ( = ?AUTO_555 ?AUTO_558 ) ) ( not ( = ?AUTO_557 ?AUTO_558 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_554 ?AUTO_558 ?AUTO_557 )
      ( GET_IMAGE_DATA ?AUTO_552 ?AUTO_553 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_552 ?AUTO_553 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_559 - OBJECTIVE
      ?AUTO_560 - MODE
    )
    :vars
    (
      ?AUTO_564 - LANDER
      ?AUTO_561 - WAYPOINT
      ?AUTO_563 - WAYPOINT
      ?AUTO_562 - ROVER
      ?AUTO_565 - WAYPOINT
      ?AUTO_566 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_564 ?AUTO_561 ) ( VISIBLE ?AUTO_563 ?AUTO_561 ) ( AVAILABLE ?AUTO_562 ) ( CHANNEL_FREE ?AUTO_564 ) ( not ( = ?AUTO_563 ?AUTO_561 ) ) ( CAN_TRAVERSE ?AUTO_562 ?AUTO_565 ?AUTO_563 ) ( AT ?AUTO_562 ?AUTO_565 ) ( VISIBLE ?AUTO_565 ?AUTO_563 ) ( not ( = ?AUTO_561 ?AUTO_565 ) ) ( not ( = ?AUTO_563 ?AUTO_565 ) ) ( CALIBRATED ?AUTO_566 ?AUTO_562 ) ( ON_BOARD ?AUTO_566 ?AUTO_562 ) ( EQUIPPED_FOR_IMAGING ?AUTO_562 ) ( SUPPORTS ?AUTO_566 ?AUTO_560 ) ( VISIBLE_FROM ?AUTO_559 ?AUTO_565 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_562 ?AUTO_565 ?AUTO_559 ?AUTO_566 ?AUTO_560 )
      ( GET_IMAGE_DATA ?AUTO_559 ?AUTO_560 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_559 ?AUTO_560 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_567 - OBJECTIVE
      ?AUTO_568 - MODE
    )
    :vars
    (
      ?AUTO_570 - LANDER
      ?AUTO_571 - WAYPOINT
      ?AUTO_573 - WAYPOINT
      ?AUTO_569 - ROVER
      ?AUTO_572 - WAYPOINT
      ?AUTO_574 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_570 ?AUTO_571 ) ( VISIBLE ?AUTO_573 ?AUTO_571 ) ( AVAILABLE ?AUTO_569 ) ( CHANNEL_FREE ?AUTO_570 ) ( not ( = ?AUTO_573 ?AUTO_571 ) ) ( CAN_TRAVERSE ?AUTO_569 ?AUTO_572 ?AUTO_573 ) ( AT ?AUTO_569 ?AUTO_572 ) ( VISIBLE ?AUTO_572 ?AUTO_573 ) ( not ( = ?AUTO_571 ?AUTO_572 ) ) ( not ( = ?AUTO_573 ?AUTO_572 ) ) ( ON_BOARD ?AUTO_574 ?AUTO_569 ) ( EQUIPPED_FOR_IMAGING ?AUTO_569 ) ( SUPPORTS ?AUTO_574 ?AUTO_568 ) ( VISIBLE_FROM ?AUTO_567 ?AUTO_572 ) ( CALIBRATION_TARGET ?AUTO_574 ?AUTO_567 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_569 ?AUTO_574 ?AUTO_567 ?AUTO_572 )
      ( GET_IMAGE_DATA ?AUTO_567 ?AUTO_568 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_567 ?AUTO_568 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_575 - OBJECTIVE
      ?AUTO_576 - MODE
    )
    :vars
    (
      ?AUTO_582 - LANDER
      ?AUTO_580 - WAYPOINT
      ?AUTO_579 - WAYPOINT
      ?AUTO_581 - ROVER
      ?AUTO_577 - WAYPOINT
      ?AUTO_578 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_582 ?AUTO_580 ) ( VISIBLE ?AUTO_579 ?AUTO_580 ) ( AVAILABLE ?AUTO_581 ) ( CHANNEL_FREE ?AUTO_582 ) ( not ( = ?AUTO_579 ?AUTO_580 ) ) ( CAN_TRAVERSE ?AUTO_581 ?AUTO_577 ?AUTO_579 ) ( VISIBLE ?AUTO_577 ?AUTO_579 ) ( not ( = ?AUTO_580 ?AUTO_577 ) ) ( not ( = ?AUTO_579 ?AUTO_577 ) ) ( ON_BOARD ?AUTO_578 ?AUTO_581 ) ( EQUIPPED_FOR_IMAGING ?AUTO_581 ) ( SUPPORTS ?AUTO_578 ?AUTO_576 ) ( VISIBLE_FROM ?AUTO_575 ?AUTO_577 ) ( CALIBRATION_TARGET ?AUTO_578 ?AUTO_575 ) ( CAN_TRAVERSE ?AUTO_581 ?AUTO_579 ?AUTO_577 ) ( AT ?AUTO_581 ?AUTO_579 ) ( VISIBLE ?AUTO_579 ?AUTO_577 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_581 ?AUTO_579 ?AUTO_577 )
      ( GET_IMAGE_DATA ?AUTO_575 ?AUTO_576 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_575 ?AUTO_576 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_618 - WAYPOINT
    )
    :vars
    (
      ?AUTO_619 - LANDER
      ?AUTO_620 - WAYPOINT
      ?AUTO_621 - ROVER
      ?AUTO_622 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_619 ?AUTO_618 ) ( VISIBLE ?AUTO_620 ?AUTO_618 ) ( AVAILABLE ?AUTO_621 ) ( CHANNEL_FREE ?AUTO_619 ) ( not ( = ?AUTO_618 ?AUTO_620 ) ) ( CAN_TRAVERSE ?AUTO_621 ?AUTO_618 ?AUTO_620 ) ( VISIBLE ?AUTO_618 ?AUTO_620 ) ( AT_SOIL_SAMPLE ?AUTO_618 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_621 ) ( STORE_OF ?AUTO_622 ?AUTO_621 ) ( EMPTY ?AUTO_622 ) ( CAN_TRAVERSE ?AUTO_621 ?AUTO_620 ?AUTO_618 ) ( AT ?AUTO_621 ?AUTO_620 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_621 ?AUTO_620 ?AUTO_618 )
      ( GET_SOIL_DATA ?AUTO_618 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_618 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_623 - WAYPOINT
    )
    :vars
    (
      ?AUTO_625 - LANDER
      ?AUTO_624 - WAYPOINT
      ?AUTO_626 - ROVER
      ?AUTO_627 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_625 ?AUTO_623 ) ( VISIBLE ?AUTO_624 ?AUTO_623 ) ( AVAILABLE ?AUTO_626 ) ( CHANNEL_FREE ?AUTO_625 ) ( not ( = ?AUTO_623 ?AUTO_624 ) ) ( CAN_TRAVERSE ?AUTO_626 ?AUTO_623 ?AUTO_624 ) ( VISIBLE ?AUTO_623 ?AUTO_624 ) ( AT_SOIL_SAMPLE ?AUTO_623 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_626 ) ( STORE_OF ?AUTO_627 ?AUTO_626 ) ( CAN_TRAVERSE ?AUTO_626 ?AUTO_624 ?AUTO_623 ) ( AT ?AUTO_626 ?AUTO_624 ) ( FULL ?AUTO_627 ) )
    :subtasks
    ( ( !DROP ?AUTO_626 ?AUTO_627 )
      ( GET_SOIL_DATA ?AUTO_623 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_623 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_631 - WAYPOINT
    )
    :vars
    (
      ?AUTO_635 - LANDER
      ?AUTO_632 - WAYPOINT
      ?AUTO_633 - ROVER
      ?AUTO_634 - STORE
      ?AUTO_636 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_635 ?AUTO_631 ) ( VISIBLE ?AUTO_632 ?AUTO_631 ) ( AVAILABLE ?AUTO_633 ) ( CHANNEL_FREE ?AUTO_635 ) ( not ( = ?AUTO_631 ?AUTO_632 ) ) ( CAN_TRAVERSE ?AUTO_633 ?AUTO_631 ?AUTO_632 ) ( VISIBLE ?AUTO_631 ?AUTO_632 ) ( AT_SOIL_SAMPLE ?AUTO_631 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_633 ) ( STORE_OF ?AUTO_634 ?AUTO_633 ) ( EMPTY ?AUTO_634 ) ( CAN_TRAVERSE ?AUTO_633 ?AUTO_632 ?AUTO_631 ) ( CAN_TRAVERSE ?AUTO_633 ?AUTO_636 ?AUTO_632 ) ( AT ?AUTO_633 ?AUTO_636 ) ( VISIBLE ?AUTO_636 ?AUTO_632 ) ( not ( = ?AUTO_631 ?AUTO_636 ) ) ( not ( = ?AUTO_632 ?AUTO_636 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_633 ?AUTO_636 ?AUTO_632 )
      ( GET_SOIL_DATA ?AUTO_631 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_631 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_657 - WAYPOINT
    )
    :vars
    (
      ?AUTO_661 - LANDER
      ?AUTO_658 - WAYPOINT
      ?AUTO_660 - ROVER
      ?AUTO_659 - STORE
      ?AUTO_662 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_661 ?AUTO_658 ) ( VISIBLE ?AUTO_657 ?AUTO_658 ) ( AVAILABLE ?AUTO_660 ) ( CHANNEL_FREE ?AUTO_661 ) ( not ( = ?AUTO_657 ?AUTO_658 ) ) ( AT_ROCK_SAMPLE ?AUTO_657 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_660 ) ( STORE_OF ?AUTO_659 ?AUTO_660 ) ( EMPTY ?AUTO_659 ) ( CAN_TRAVERSE ?AUTO_660 ?AUTO_662 ?AUTO_657 ) ( VISIBLE ?AUTO_662 ?AUTO_657 ) ( not ( = ?AUTO_657 ?AUTO_662 ) ) ( not ( = ?AUTO_658 ?AUTO_662 ) ) ( CAN_TRAVERSE ?AUTO_660 ?AUTO_658 ?AUTO_662 ) ( AT ?AUTO_660 ?AUTO_658 ) ( VISIBLE ?AUTO_658 ?AUTO_662 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_660 ?AUTO_658 ?AUTO_662 )
      ( GET_ROCK_DATA ?AUTO_657 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_657 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_663 - WAYPOINT
    )
    :vars
    (
      ?AUTO_668 - LANDER
      ?AUTO_667 - WAYPOINT
      ?AUTO_664 - ROVER
      ?AUTO_666 - STORE
      ?AUTO_665 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_668 ?AUTO_667 ) ( VISIBLE ?AUTO_663 ?AUTO_667 ) ( AVAILABLE ?AUTO_664 ) ( CHANNEL_FREE ?AUTO_668 ) ( not ( = ?AUTO_663 ?AUTO_667 ) ) ( AT_ROCK_SAMPLE ?AUTO_663 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_664 ) ( STORE_OF ?AUTO_666 ?AUTO_664 ) ( CAN_TRAVERSE ?AUTO_664 ?AUTO_665 ?AUTO_663 ) ( VISIBLE ?AUTO_665 ?AUTO_663 ) ( not ( = ?AUTO_663 ?AUTO_665 ) ) ( not ( = ?AUTO_667 ?AUTO_665 ) ) ( CAN_TRAVERSE ?AUTO_664 ?AUTO_667 ?AUTO_665 ) ( AT ?AUTO_664 ?AUTO_667 ) ( VISIBLE ?AUTO_667 ?AUTO_665 ) ( FULL ?AUTO_666 ) )
    :subtasks
    ( ( !DROP ?AUTO_664 ?AUTO_666 )
      ( GET_ROCK_DATA ?AUTO_663 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_663 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_671 - WAYPOINT
    )
    :vars
    (
      ?AUTO_675 - LANDER
      ?AUTO_672 - WAYPOINT
      ?AUTO_673 - ROVER
      ?AUTO_674 - STORE
      ?AUTO_676 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_675 ?AUTO_672 ) ( VISIBLE ?AUTO_671 ?AUTO_672 ) ( AVAILABLE ?AUTO_673 ) ( CHANNEL_FREE ?AUTO_675 ) ( not ( = ?AUTO_671 ?AUTO_672 ) ) ( AT_ROCK_SAMPLE ?AUTO_671 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_673 ) ( STORE_OF ?AUTO_674 ?AUTO_673 ) ( CAN_TRAVERSE ?AUTO_673 ?AUTO_676 ?AUTO_671 ) ( AT ?AUTO_673 ?AUTO_676 ) ( VISIBLE ?AUTO_676 ?AUTO_671 ) ( not ( = ?AUTO_671 ?AUTO_676 ) ) ( not ( = ?AUTO_672 ?AUTO_676 ) ) ( FULL ?AUTO_674 ) )
    :subtasks
    ( ( !DROP ?AUTO_673 ?AUTO_674 )
      ( GET_ROCK_DATA ?AUTO_671 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_671 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_680 - WAYPOINT
    )
    :vars
    (
      ?AUTO_684 - LANDER
      ?AUTO_681 - WAYPOINT
      ?AUTO_682 - ROVER
      ?AUTO_683 - STORE
      ?AUTO_685 - WAYPOINT
      ?AUTO_686 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_684 ?AUTO_681 ) ( VISIBLE ?AUTO_680 ?AUTO_681 ) ( AVAILABLE ?AUTO_682 ) ( CHANNEL_FREE ?AUTO_684 ) ( not ( = ?AUTO_680 ?AUTO_681 ) ) ( AT_ROCK_SAMPLE ?AUTO_680 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_682 ) ( STORE_OF ?AUTO_683 ?AUTO_682 ) ( EMPTY ?AUTO_683 ) ( CAN_TRAVERSE ?AUTO_682 ?AUTO_685 ?AUTO_680 ) ( VISIBLE ?AUTO_685 ?AUTO_680 ) ( not ( = ?AUTO_680 ?AUTO_685 ) ) ( not ( = ?AUTO_681 ?AUTO_685 ) ) ( CAN_TRAVERSE ?AUTO_682 ?AUTO_686 ?AUTO_685 ) ( AT ?AUTO_682 ?AUTO_686 ) ( VISIBLE ?AUTO_686 ?AUTO_685 ) ( not ( = ?AUTO_680 ?AUTO_686 ) ) ( not ( = ?AUTO_681 ?AUTO_686 ) ) ( not ( = ?AUTO_685 ?AUTO_686 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_682 ?AUTO_686 ?AUTO_685 )
      ( GET_ROCK_DATA ?AUTO_680 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_680 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_697 - WAYPOINT
    )
    :vars
    (
      ?AUTO_699 - LANDER
      ?AUTO_700 - WAYPOINT
      ?AUTO_698 - ROVER
      ?AUTO_701 - STORE
      ?AUTO_702 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_699 ?AUTO_700 ) ( VISIBLE ?AUTO_697 ?AUTO_700 ) ( AVAILABLE ?AUTO_698 ) ( CHANNEL_FREE ?AUTO_699 ) ( not ( = ?AUTO_697 ?AUTO_700 ) ) ( AT_SOIL_SAMPLE ?AUTO_697 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_698 ) ( STORE_OF ?AUTO_701 ?AUTO_698 ) ( EMPTY ?AUTO_701 ) ( CAN_TRAVERSE ?AUTO_698 ?AUTO_702 ?AUTO_697 ) ( AT ?AUTO_698 ?AUTO_702 ) ( VISIBLE ?AUTO_702 ?AUTO_697 ) ( not ( = ?AUTO_697 ?AUTO_702 ) ) ( not ( = ?AUTO_700 ?AUTO_702 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_698 ?AUTO_702 ?AUTO_697 )
      ( GET_SOIL_DATA ?AUTO_697 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_697 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_740 - WAYPOINT
    )
    :vars
    (
      ?AUTO_745 - LANDER
      ?AUTO_744 - WAYPOINT
      ?AUTO_743 - ROVER
      ?AUTO_741 - STORE
      ?AUTO_742 - WAYPOINT
      ?AUTO_746 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_745 ?AUTO_744 ) ( VISIBLE ?AUTO_740 ?AUTO_744 ) ( AVAILABLE ?AUTO_743 ) ( CHANNEL_FREE ?AUTO_745 ) ( not ( = ?AUTO_740 ?AUTO_744 ) ) ( AT_ROCK_SAMPLE ?AUTO_740 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_743 ) ( STORE_OF ?AUTO_741 ?AUTO_743 ) ( EMPTY ?AUTO_741 ) ( CAN_TRAVERSE ?AUTO_743 ?AUTO_742 ?AUTO_740 ) ( VISIBLE ?AUTO_742 ?AUTO_740 ) ( not ( = ?AUTO_740 ?AUTO_742 ) ) ( not ( = ?AUTO_744 ?AUTO_742 ) ) ( CAN_TRAVERSE ?AUTO_743 ?AUTO_744 ?AUTO_742 ) ( VISIBLE ?AUTO_744 ?AUTO_742 ) ( CAN_TRAVERSE ?AUTO_743 ?AUTO_746 ?AUTO_744 ) ( AT ?AUTO_743 ?AUTO_746 ) ( VISIBLE ?AUTO_746 ?AUTO_744 ) ( not ( = ?AUTO_740 ?AUTO_746 ) ) ( not ( = ?AUTO_744 ?AUTO_746 ) ) ( not ( = ?AUTO_742 ?AUTO_746 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_743 ?AUTO_746 ?AUTO_744 )
      ( GET_ROCK_DATA ?AUTO_740 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_740 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_747 - WAYPOINT
    )
    :vars
    (
      ?AUTO_750 - LANDER
      ?AUTO_751 - WAYPOINT
      ?AUTO_752 - ROVER
      ?AUTO_748 - STORE
      ?AUTO_749 - WAYPOINT
      ?AUTO_753 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_750 ?AUTO_751 ) ( VISIBLE ?AUTO_747 ?AUTO_751 ) ( AVAILABLE ?AUTO_752 ) ( CHANNEL_FREE ?AUTO_750 ) ( not ( = ?AUTO_747 ?AUTO_751 ) ) ( AT_ROCK_SAMPLE ?AUTO_747 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_752 ) ( STORE_OF ?AUTO_748 ?AUTO_752 ) ( CAN_TRAVERSE ?AUTO_752 ?AUTO_749 ?AUTO_747 ) ( VISIBLE ?AUTO_749 ?AUTO_747 ) ( not ( = ?AUTO_747 ?AUTO_749 ) ) ( not ( = ?AUTO_751 ?AUTO_749 ) ) ( CAN_TRAVERSE ?AUTO_752 ?AUTO_751 ?AUTO_749 ) ( VISIBLE ?AUTO_751 ?AUTO_749 ) ( CAN_TRAVERSE ?AUTO_752 ?AUTO_753 ?AUTO_751 ) ( AT ?AUTO_752 ?AUTO_753 ) ( VISIBLE ?AUTO_753 ?AUTO_751 ) ( not ( = ?AUTO_747 ?AUTO_753 ) ) ( not ( = ?AUTO_751 ?AUTO_753 ) ) ( not ( = ?AUTO_749 ?AUTO_753 ) ) ( FULL ?AUTO_748 ) )
    :subtasks
    ( ( !DROP ?AUTO_752 ?AUTO_748 )
      ( GET_ROCK_DATA ?AUTO_747 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_747 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_767 - OBJECTIVE
      ?AUTO_768 - MODE
    )
    :vars
    (
      ?AUTO_771 - LANDER
      ?AUTO_770 - WAYPOINT
      ?AUTO_769 - ROVER
      ?AUTO_772 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_771 ?AUTO_770 ) ( HAVE_IMAGE ?AUTO_769 ?AUTO_767 ?AUTO_768 ) ( VISIBLE ?AUTO_772 ?AUTO_770 ) ( AVAILABLE ?AUTO_769 ) ( CHANNEL_FREE ?AUTO_771 ) ( not ( = ?AUTO_772 ?AUTO_770 ) ) ( CAN_TRAVERSE ?AUTO_769 ?AUTO_770 ?AUTO_772 ) ( AT ?AUTO_769 ?AUTO_770 ) ( VISIBLE ?AUTO_770 ?AUTO_772 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_769 ?AUTO_770 ?AUTO_772 )
      ( GET_IMAGE_DATA ?AUTO_767 ?AUTO_768 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_767 ?AUTO_768 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_773 - OBJECTIVE
      ?AUTO_774 - MODE
    )
    :vars
    (
      ?AUTO_778 - LANDER
      ?AUTO_775 - WAYPOINT
      ?AUTO_777 - WAYPOINT
      ?AUTO_776 - ROVER
      ?AUTO_779 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_778 ?AUTO_775 ) ( VISIBLE ?AUTO_777 ?AUTO_775 ) ( AVAILABLE ?AUTO_776 ) ( CHANNEL_FREE ?AUTO_778 ) ( not ( = ?AUTO_777 ?AUTO_775 ) ) ( CAN_TRAVERSE ?AUTO_776 ?AUTO_775 ?AUTO_777 ) ( AT ?AUTO_776 ?AUTO_775 ) ( VISIBLE ?AUTO_775 ?AUTO_777 ) ( CALIBRATED ?AUTO_779 ?AUTO_776 ) ( ON_BOARD ?AUTO_779 ?AUTO_776 ) ( EQUIPPED_FOR_IMAGING ?AUTO_776 ) ( SUPPORTS ?AUTO_779 ?AUTO_774 ) ( VISIBLE_FROM ?AUTO_773 ?AUTO_775 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_776 ?AUTO_775 ?AUTO_773 ?AUTO_779 ?AUTO_774 )
      ( GET_IMAGE_DATA ?AUTO_773 ?AUTO_774 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_773 ?AUTO_774 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_780 - OBJECTIVE
      ?AUTO_781 - MODE
    )
    :vars
    (
      ?AUTO_784 - LANDER
      ?AUTO_783 - WAYPOINT
      ?AUTO_785 - WAYPOINT
      ?AUTO_782 - ROVER
      ?AUTO_786 - CAMERA
      ?AUTO_787 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_784 ?AUTO_783 ) ( VISIBLE ?AUTO_785 ?AUTO_783 ) ( AVAILABLE ?AUTO_782 ) ( CHANNEL_FREE ?AUTO_784 ) ( not ( = ?AUTO_785 ?AUTO_783 ) ) ( CAN_TRAVERSE ?AUTO_782 ?AUTO_783 ?AUTO_785 ) ( VISIBLE ?AUTO_783 ?AUTO_785 ) ( CALIBRATED ?AUTO_786 ?AUTO_782 ) ( ON_BOARD ?AUTO_786 ?AUTO_782 ) ( EQUIPPED_FOR_IMAGING ?AUTO_782 ) ( SUPPORTS ?AUTO_786 ?AUTO_781 ) ( VISIBLE_FROM ?AUTO_780 ?AUTO_783 ) ( CAN_TRAVERSE ?AUTO_782 ?AUTO_787 ?AUTO_783 ) ( AT ?AUTO_782 ?AUTO_787 ) ( VISIBLE ?AUTO_787 ?AUTO_783 ) ( not ( = ?AUTO_783 ?AUTO_787 ) ) ( not ( = ?AUTO_785 ?AUTO_787 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_782 ?AUTO_787 ?AUTO_783 )
      ( GET_IMAGE_DATA ?AUTO_780 ?AUTO_781 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_780 ?AUTO_781 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_790 - OBJECTIVE
      ?AUTO_791 - MODE
    )
    :vars
    (
      ?AUTO_792 - LANDER
      ?AUTO_795 - WAYPOINT
      ?AUTO_794 - WAYPOINT
      ?AUTO_796 - ROVER
      ?AUTO_793 - CAMERA
      ?AUTO_797 - WAYPOINT
      ?AUTO_798 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_792 ?AUTO_795 ) ( VISIBLE ?AUTO_794 ?AUTO_795 ) ( AVAILABLE ?AUTO_796 ) ( CHANNEL_FREE ?AUTO_792 ) ( not ( = ?AUTO_794 ?AUTO_795 ) ) ( CAN_TRAVERSE ?AUTO_796 ?AUTO_795 ?AUTO_794 ) ( VISIBLE ?AUTO_795 ?AUTO_794 ) ( CALIBRATED ?AUTO_793 ?AUTO_796 ) ( ON_BOARD ?AUTO_793 ?AUTO_796 ) ( EQUIPPED_FOR_IMAGING ?AUTO_796 ) ( SUPPORTS ?AUTO_793 ?AUTO_791 ) ( VISIBLE_FROM ?AUTO_790 ?AUTO_795 ) ( CAN_TRAVERSE ?AUTO_796 ?AUTO_797 ?AUTO_795 ) ( VISIBLE ?AUTO_797 ?AUTO_795 ) ( not ( = ?AUTO_795 ?AUTO_797 ) ) ( not ( = ?AUTO_794 ?AUTO_797 ) ) ( CAN_TRAVERSE ?AUTO_796 ?AUTO_798 ?AUTO_797 ) ( AT ?AUTO_796 ?AUTO_798 ) ( VISIBLE ?AUTO_798 ?AUTO_797 ) ( not ( = ?AUTO_795 ?AUTO_798 ) ) ( not ( = ?AUTO_794 ?AUTO_798 ) ) ( not ( = ?AUTO_797 ?AUTO_798 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_796 ?AUTO_798 ?AUTO_797 )
      ( GET_IMAGE_DATA ?AUTO_790 ?AUTO_791 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_790 ?AUTO_791 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_805 - OBJECTIVE
      ?AUTO_806 - MODE
    )
    :vars
    (
      ?AUTO_809 - LANDER
      ?AUTO_808 - WAYPOINT
      ?AUTO_807 - WAYPOINT
      ?AUTO_812 - ROVER
      ?AUTO_813 - CAMERA
      ?AUTO_810 - WAYPOINT
      ?AUTO_811 - WAYPOINT
      ?AUTO_814 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_809 ?AUTO_808 ) ( VISIBLE ?AUTO_807 ?AUTO_808 ) ( AVAILABLE ?AUTO_812 ) ( CHANNEL_FREE ?AUTO_809 ) ( not ( = ?AUTO_807 ?AUTO_808 ) ) ( CAN_TRAVERSE ?AUTO_812 ?AUTO_808 ?AUTO_807 ) ( VISIBLE ?AUTO_808 ?AUTO_807 ) ( ON_BOARD ?AUTO_813 ?AUTO_812 ) ( EQUIPPED_FOR_IMAGING ?AUTO_812 ) ( SUPPORTS ?AUTO_813 ?AUTO_806 ) ( VISIBLE_FROM ?AUTO_805 ?AUTO_808 ) ( CAN_TRAVERSE ?AUTO_812 ?AUTO_810 ?AUTO_808 ) ( VISIBLE ?AUTO_810 ?AUTO_808 ) ( not ( = ?AUTO_808 ?AUTO_810 ) ) ( not ( = ?AUTO_807 ?AUTO_810 ) ) ( CAN_TRAVERSE ?AUTO_812 ?AUTO_811 ?AUTO_810 ) ( AT ?AUTO_812 ?AUTO_811 ) ( VISIBLE ?AUTO_811 ?AUTO_810 ) ( not ( = ?AUTO_808 ?AUTO_811 ) ) ( not ( = ?AUTO_807 ?AUTO_811 ) ) ( not ( = ?AUTO_810 ?AUTO_811 ) ) ( CALIBRATION_TARGET ?AUTO_813 ?AUTO_814 ) ( VISIBLE_FROM ?AUTO_814 ?AUTO_811 ) ( not ( = ?AUTO_805 ?AUTO_814 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_812 ?AUTO_813 ?AUTO_814 ?AUTO_811 )
      ( GET_IMAGE_DATA ?AUTO_805 ?AUTO_806 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_805 ?AUTO_806 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_815 - OBJECTIVE
      ?AUTO_816 - MODE
    )
    :vars
    (
      ?AUTO_818 - LANDER
      ?AUTO_824 - WAYPOINT
      ?AUTO_821 - WAYPOINT
      ?AUTO_823 - ROVER
      ?AUTO_819 - CAMERA
      ?AUTO_822 - WAYPOINT
      ?AUTO_820 - WAYPOINT
      ?AUTO_817 - OBJECTIVE
      ?AUTO_825 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_818 ?AUTO_824 ) ( VISIBLE ?AUTO_821 ?AUTO_824 ) ( AVAILABLE ?AUTO_823 ) ( CHANNEL_FREE ?AUTO_818 ) ( not ( = ?AUTO_821 ?AUTO_824 ) ) ( CAN_TRAVERSE ?AUTO_823 ?AUTO_824 ?AUTO_821 ) ( VISIBLE ?AUTO_824 ?AUTO_821 ) ( ON_BOARD ?AUTO_819 ?AUTO_823 ) ( EQUIPPED_FOR_IMAGING ?AUTO_823 ) ( SUPPORTS ?AUTO_819 ?AUTO_816 ) ( VISIBLE_FROM ?AUTO_815 ?AUTO_824 ) ( CAN_TRAVERSE ?AUTO_823 ?AUTO_822 ?AUTO_824 ) ( VISIBLE ?AUTO_822 ?AUTO_824 ) ( not ( = ?AUTO_824 ?AUTO_822 ) ) ( not ( = ?AUTO_821 ?AUTO_822 ) ) ( CAN_TRAVERSE ?AUTO_823 ?AUTO_820 ?AUTO_822 ) ( VISIBLE ?AUTO_820 ?AUTO_822 ) ( not ( = ?AUTO_824 ?AUTO_820 ) ) ( not ( = ?AUTO_821 ?AUTO_820 ) ) ( not ( = ?AUTO_822 ?AUTO_820 ) ) ( CALIBRATION_TARGET ?AUTO_819 ?AUTO_817 ) ( VISIBLE_FROM ?AUTO_817 ?AUTO_820 ) ( not ( = ?AUTO_815 ?AUTO_817 ) ) ( CAN_TRAVERSE ?AUTO_823 ?AUTO_825 ?AUTO_820 ) ( AT ?AUTO_823 ?AUTO_825 ) ( VISIBLE ?AUTO_825 ?AUTO_820 ) ( not ( = ?AUTO_824 ?AUTO_825 ) ) ( not ( = ?AUTO_821 ?AUTO_825 ) ) ( not ( = ?AUTO_822 ?AUTO_825 ) ) ( not ( = ?AUTO_820 ?AUTO_825 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_823 ?AUTO_825 ?AUTO_820 )
      ( GET_IMAGE_DATA ?AUTO_815 ?AUTO_816 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_815 ?AUTO_816 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_826 - OBJECTIVE
      ?AUTO_827 - MODE
    )
    :vars
    (
      ?AUTO_831 - LANDER
      ?AUTO_835 - WAYPOINT
      ?AUTO_833 - WAYPOINT
      ?AUTO_832 - ROVER
      ?AUTO_836 - CAMERA
      ?AUTO_834 - WAYPOINT
      ?AUTO_828 - WAYPOINT
      ?AUTO_830 - OBJECTIVE
      ?AUTO_829 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_831 ?AUTO_835 ) ( VISIBLE ?AUTO_833 ?AUTO_835 ) ( AVAILABLE ?AUTO_832 ) ( CHANNEL_FREE ?AUTO_831 ) ( not ( = ?AUTO_833 ?AUTO_835 ) ) ( CAN_TRAVERSE ?AUTO_832 ?AUTO_835 ?AUTO_833 ) ( VISIBLE ?AUTO_835 ?AUTO_833 ) ( ON_BOARD ?AUTO_836 ?AUTO_832 ) ( EQUIPPED_FOR_IMAGING ?AUTO_832 ) ( SUPPORTS ?AUTO_836 ?AUTO_827 ) ( VISIBLE_FROM ?AUTO_826 ?AUTO_835 ) ( CAN_TRAVERSE ?AUTO_832 ?AUTO_834 ?AUTO_835 ) ( VISIBLE ?AUTO_834 ?AUTO_835 ) ( not ( = ?AUTO_835 ?AUTO_834 ) ) ( not ( = ?AUTO_833 ?AUTO_834 ) ) ( CAN_TRAVERSE ?AUTO_832 ?AUTO_828 ?AUTO_834 ) ( VISIBLE ?AUTO_828 ?AUTO_834 ) ( not ( = ?AUTO_835 ?AUTO_828 ) ) ( not ( = ?AUTO_833 ?AUTO_828 ) ) ( not ( = ?AUTO_834 ?AUTO_828 ) ) ( CALIBRATION_TARGET ?AUTO_836 ?AUTO_830 ) ( VISIBLE_FROM ?AUTO_830 ?AUTO_828 ) ( not ( = ?AUTO_826 ?AUTO_830 ) ) ( CAN_TRAVERSE ?AUTO_832 ?AUTO_829 ?AUTO_828 ) ( VISIBLE ?AUTO_829 ?AUTO_828 ) ( not ( = ?AUTO_835 ?AUTO_829 ) ) ( not ( = ?AUTO_833 ?AUTO_829 ) ) ( not ( = ?AUTO_834 ?AUTO_829 ) ) ( not ( = ?AUTO_828 ?AUTO_829 ) ) ( CAN_TRAVERSE ?AUTO_832 ?AUTO_835 ?AUTO_829 ) ( AT ?AUTO_832 ?AUTO_835 ) ( VISIBLE ?AUTO_835 ?AUTO_829 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_832 ?AUTO_835 ?AUTO_829 )
      ( GET_IMAGE_DATA ?AUTO_826 ?AUTO_827 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_826 ?AUTO_827 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_837 - OBJECTIVE
      ?AUTO_838 - MODE
    )
    :vars
    (
      ?AUTO_845 - LANDER
      ?AUTO_839 - WAYPOINT
      ?AUTO_841 - WAYPOINT
      ?AUTO_842 - ROVER
      ?AUTO_847 - CAMERA
      ?AUTO_846 - WAYPOINT
      ?AUTO_843 - WAYPOINT
      ?AUTO_840 - OBJECTIVE
      ?AUTO_844 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_845 ?AUTO_839 ) ( VISIBLE ?AUTO_841 ?AUTO_839 ) ( AVAILABLE ?AUTO_842 ) ( CHANNEL_FREE ?AUTO_845 ) ( not ( = ?AUTO_841 ?AUTO_839 ) ) ( CAN_TRAVERSE ?AUTO_842 ?AUTO_839 ?AUTO_841 ) ( VISIBLE ?AUTO_839 ?AUTO_841 ) ( ON_BOARD ?AUTO_847 ?AUTO_842 ) ( EQUIPPED_FOR_IMAGING ?AUTO_842 ) ( SUPPORTS ?AUTO_847 ?AUTO_838 ) ( VISIBLE_FROM ?AUTO_837 ?AUTO_839 ) ( CAN_TRAVERSE ?AUTO_842 ?AUTO_846 ?AUTO_839 ) ( VISIBLE ?AUTO_846 ?AUTO_839 ) ( not ( = ?AUTO_839 ?AUTO_846 ) ) ( not ( = ?AUTO_841 ?AUTO_846 ) ) ( CAN_TRAVERSE ?AUTO_842 ?AUTO_843 ?AUTO_846 ) ( VISIBLE ?AUTO_843 ?AUTO_846 ) ( not ( = ?AUTO_839 ?AUTO_843 ) ) ( not ( = ?AUTO_841 ?AUTO_843 ) ) ( not ( = ?AUTO_846 ?AUTO_843 ) ) ( CALIBRATION_TARGET ?AUTO_847 ?AUTO_840 ) ( VISIBLE_FROM ?AUTO_840 ?AUTO_843 ) ( not ( = ?AUTO_837 ?AUTO_840 ) ) ( CAN_TRAVERSE ?AUTO_842 ?AUTO_844 ?AUTO_843 ) ( VISIBLE ?AUTO_844 ?AUTO_843 ) ( not ( = ?AUTO_839 ?AUTO_844 ) ) ( not ( = ?AUTO_841 ?AUTO_844 ) ) ( not ( = ?AUTO_846 ?AUTO_844 ) ) ( not ( = ?AUTO_843 ?AUTO_844 ) ) ( CAN_TRAVERSE ?AUTO_842 ?AUTO_839 ?AUTO_844 ) ( VISIBLE ?AUTO_839 ?AUTO_844 ) ( AT ?AUTO_842 ?AUTO_846 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_842 ?AUTO_846 ?AUTO_839 )
      ( GET_IMAGE_DATA ?AUTO_837 ?AUTO_838 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_837 ?AUTO_838 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_874 - WAYPOINT
    )
    :vars
    (
      ?AUTO_876 - LANDER
      ?AUTO_878 - WAYPOINT
      ?AUTO_875 - ROVER
      ?AUTO_877 - STORE
      ?AUTO_879 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_876 ?AUTO_874 ) ( VISIBLE ?AUTO_878 ?AUTO_874 ) ( AVAILABLE ?AUTO_875 ) ( CHANNEL_FREE ?AUTO_876 ) ( not ( = ?AUTO_874 ?AUTO_878 ) ) ( CAN_TRAVERSE ?AUTO_875 ?AUTO_874 ?AUTO_878 ) ( VISIBLE ?AUTO_874 ?AUTO_878 ) ( AT_ROCK_SAMPLE ?AUTO_874 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_875 ) ( STORE_OF ?AUTO_877 ?AUTO_875 ) ( EMPTY ?AUTO_877 ) ( CAN_TRAVERSE ?AUTO_875 ?AUTO_879 ?AUTO_874 ) ( AT ?AUTO_875 ?AUTO_879 ) ( VISIBLE ?AUTO_879 ?AUTO_874 ) ( not ( = ?AUTO_874 ?AUTO_879 ) ) ( not ( = ?AUTO_878 ?AUTO_879 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_875 ?AUTO_879 ?AUTO_874 )
      ( GET_ROCK_DATA ?AUTO_874 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_874 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_884 - WAYPOINT
    )
    :vars
    (
      ?AUTO_885 - LANDER
      ?AUTO_888 - WAYPOINT
      ?AUTO_887 - ROVER
      ?AUTO_889 - STORE
      ?AUTO_886 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_885 ?AUTO_884 ) ( VISIBLE ?AUTO_888 ?AUTO_884 ) ( AVAILABLE ?AUTO_887 ) ( CHANNEL_FREE ?AUTO_885 ) ( not ( = ?AUTO_884 ?AUTO_888 ) ) ( CAN_TRAVERSE ?AUTO_887 ?AUTO_884 ?AUTO_888 ) ( VISIBLE ?AUTO_884 ?AUTO_888 ) ( AT_ROCK_SAMPLE ?AUTO_884 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_887 ) ( STORE_OF ?AUTO_889 ?AUTO_887 ) ( CAN_TRAVERSE ?AUTO_887 ?AUTO_886 ?AUTO_884 ) ( AT ?AUTO_887 ?AUTO_886 ) ( VISIBLE ?AUTO_886 ?AUTO_884 ) ( not ( = ?AUTO_884 ?AUTO_886 ) ) ( not ( = ?AUTO_888 ?AUTO_886 ) ) ( FULL ?AUTO_889 ) )
    :subtasks
    ( ( !DROP ?AUTO_887 ?AUTO_889 )
      ( GET_ROCK_DATA ?AUTO_884 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_884 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_890 - WAYPOINT
    )
    :vars
    (
      ?AUTO_891 - LANDER
      ?AUTO_892 - WAYPOINT
      ?AUTO_894 - ROVER
      ?AUTO_895 - STORE
      ?AUTO_893 - WAYPOINT
      ?AUTO_896 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_891 ?AUTO_890 ) ( VISIBLE ?AUTO_892 ?AUTO_890 ) ( AVAILABLE ?AUTO_894 ) ( CHANNEL_FREE ?AUTO_891 ) ( not ( = ?AUTO_890 ?AUTO_892 ) ) ( CAN_TRAVERSE ?AUTO_894 ?AUTO_890 ?AUTO_892 ) ( VISIBLE ?AUTO_890 ?AUTO_892 ) ( AT_ROCK_SAMPLE ?AUTO_890 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_894 ) ( STORE_OF ?AUTO_895 ?AUTO_894 ) ( CAN_TRAVERSE ?AUTO_894 ?AUTO_893 ?AUTO_890 ) ( VISIBLE ?AUTO_893 ?AUTO_890 ) ( not ( = ?AUTO_890 ?AUTO_893 ) ) ( not ( = ?AUTO_892 ?AUTO_893 ) ) ( FULL ?AUTO_895 ) ( CAN_TRAVERSE ?AUTO_894 ?AUTO_896 ?AUTO_893 ) ( AT ?AUTO_894 ?AUTO_896 ) ( VISIBLE ?AUTO_896 ?AUTO_893 ) ( not ( = ?AUTO_890 ?AUTO_896 ) ) ( not ( = ?AUTO_892 ?AUTO_896 ) ) ( not ( = ?AUTO_893 ?AUTO_896 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_894 ?AUTO_896 ?AUTO_893 )
      ( GET_ROCK_DATA ?AUTO_890 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_890 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_898 - WAYPOINT
    )
    :vars
    (
      ?AUTO_904 - LANDER
      ?AUTO_900 - WAYPOINT
      ?AUTO_903 - ROVER
      ?AUTO_901 - STORE
      ?AUTO_902 - WAYPOINT
      ?AUTO_899 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_904 ?AUTO_898 ) ( VISIBLE ?AUTO_900 ?AUTO_898 ) ( AVAILABLE ?AUTO_903 ) ( CHANNEL_FREE ?AUTO_904 ) ( not ( = ?AUTO_898 ?AUTO_900 ) ) ( CAN_TRAVERSE ?AUTO_903 ?AUTO_898 ?AUTO_900 ) ( VISIBLE ?AUTO_898 ?AUTO_900 ) ( AT_ROCK_SAMPLE ?AUTO_898 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_903 ) ( STORE_OF ?AUTO_901 ?AUTO_903 ) ( CAN_TRAVERSE ?AUTO_903 ?AUTO_902 ?AUTO_898 ) ( VISIBLE ?AUTO_902 ?AUTO_898 ) ( not ( = ?AUTO_898 ?AUTO_902 ) ) ( not ( = ?AUTO_900 ?AUTO_902 ) ) ( CAN_TRAVERSE ?AUTO_903 ?AUTO_899 ?AUTO_902 ) ( AT ?AUTO_903 ?AUTO_899 ) ( VISIBLE ?AUTO_899 ?AUTO_902 ) ( not ( = ?AUTO_898 ?AUTO_899 ) ) ( not ( = ?AUTO_900 ?AUTO_899 ) ) ( not ( = ?AUTO_902 ?AUTO_899 ) ) ( AT_ROCK_SAMPLE ?AUTO_899 ) ( EMPTY ?AUTO_901 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_903 ?AUTO_901 ?AUTO_899 )
      ( GET_ROCK_DATA ?AUTO_898 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_898 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10817 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10818 - LANDER
      ?AUTO_10821 - WAYPOINT
      ?AUTO_10823 - ROVER
      ?AUTO_10819 - STORE
      ?AUTO_10822 - WAYPOINT
      ?AUTO_10820 - WAYPOINT
      ?AUTO_10824 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10818 ?AUTO_10817 ) ( VISIBLE ?AUTO_10821 ?AUTO_10817 ) ( AVAILABLE ?AUTO_10823 ) ( CHANNEL_FREE ?AUTO_10818 ) ( not ( = ?AUTO_10817 ?AUTO_10821 ) ) ( CAN_TRAVERSE ?AUTO_10823 ?AUTO_10817 ?AUTO_10821 ) ( VISIBLE ?AUTO_10817 ?AUTO_10821 ) ( AT_ROCK_SAMPLE ?AUTO_10817 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10823 ) ( STORE_OF ?AUTO_10819 ?AUTO_10823 ) ( EMPTY ?AUTO_10819 ) ( CAN_TRAVERSE ?AUTO_10823 ?AUTO_10822 ?AUTO_10817 ) ( VISIBLE ?AUTO_10822 ?AUTO_10817 ) ( not ( = ?AUTO_10817 ?AUTO_10822 ) ) ( not ( = ?AUTO_10821 ?AUTO_10822 ) ) ( CAN_TRAVERSE ?AUTO_10823 ?AUTO_10820 ?AUTO_10822 ) ( VISIBLE ?AUTO_10820 ?AUTO_10822 ) ( not ( = ?AUTO_10817 ?AUTO_10820 ) ) ( not ( = ?AUTO_10821 ?AUTO_10820 ) ) ( not ( = ?AUTO_10822 ?AUTO_10820 ) ) ( CAN_TRAVERSE ?AUTO_10823 ?AUTO_10824 ?AUTO_10820 ) ( AT ?AUTO_10823 ?AUTO_10824 ) ( VISIBLE ?AUTO_10824 ?AUTO_10820 ) ( not ( = ?AUTO_10817 ?AUTO_10824 ) ) ( not ( = ?AUTO_10821 ?AUTO_10824 ) ) ( not ( = ?AUTO_10822 ?AUTO_10824 ) ) ( not ( = ?AUTO_10820 ?AUTO_10824 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10823 ?AUTO_10824 ?AUTO_10820 )
      ( GET_ROCK_DATA ?AUTO_10817 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10817 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_914 - WAYPOINT
    )
    :vars
    (
      ?AUTO_915 - ROVER
      ?AUTO_918 - WAYPOINT
      ?AUTO_917 - LANDER
      ?AUTO_916 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_915 ?AUTO_918 ) ( AT_LANDER ?AUTO_917 ?AUTO_916 ) ( HAVE_ROCK_ANALYSIS ?AUTO_915 ?AUTO_914 ) ( VISIBLE ?AUTO_918 ?AUTO_916 ) ( AVAILABLE ?AUTO_915 ) ( CHANNEL_FREE ?AUTO_917 ) ( not ( = ?AUTO_914 ?AUTO_918 ) ) ( not ( = ?AUTO_914 ?AUTO_916 ) ) ( not ( = ?AUTO_918 ?AUTO_916 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_915 ?AUTO_917 ?AUTO_914 ?AUTO_918 ?AUTO_916 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_914 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_919 - WAYPOINT
    )
    :vars
    (
      ?AUTO_922 - LANDER
      ?AUTO_921 - WAYPOINT
      ?AUTO_920 - ROVER
      ?AUTO_923 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_922 ?AUTO_921 ) ( HAVE_ROCK_ANALYSIS ?AUTO_920 ?AUTO_919 ) ( VISIBLE ?AUTO_923 ?AUTO_921 ) ( AVAILABLE ?AUTO_920 ) ( CHANNEL_FREE ?AUTO_922 ) ( not ( = ?AUTO_919 ?AUTO_923 ) ) ( not ( = ?AUTO_919 ?AUTO_921 ) ) ( not ( = ?AUTO_923 ?AUTO_921 ) ) ( CAN_TRAVERSE ?AUTO_920 ?AUTO_919 ?AUTO_923 ) ( AT ?AUTO_920 ?AUTO_919 ) ( VISIBLE ?AUTO_919 ?AUTO_923 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_920 ?AUTO_919 ?AUTO_923 )
      ( GET_ROCK_DATA ?AUTO_919 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_919 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_925 - WAYPOINT
    )
    :vars
    (
      ?AUTO_929 - LANDER
      ?AUTO_926 - WAYPOINT
      ?AUTO_928 - WAYPOINT
      ?AUTO_927 - ROVER
      ?AUTO_930 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_929 ?AUTO_926 ) ( VISIBLE ?AUTO_928 ?AUTO_926 ) ( AVAILABLE ?AUTO_927 ) ( CHANNEL_FREE ?AUTO_929 ) ( not ( = ?AUTO_925 ?AUTO_928 ) ) ( not ( = ?AUTO_925 ?AUTO_926 ) ) ( not ( = ?AUTO_928 ?AUTO_926 ) ) ( CAN_TRAVERSE ?AUTO_927 ?AUTO_925 ?AUTO_928 ) ( AT ?AUTO_927 ?AUTO_925 ) ( VISIBLE ?AUTO_925 ?AUTO_928 ) ( AT_ROCK_SAMPLE ?AUTO_925 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_927 ) ( STORE_OF ?AUTO_930 ?AUTO_927 ) ( EMPTY ?AUTO_930 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_927 ?AUTO_930 ?AUTO_925 )
      ( GET_ROCK_DATA ?AUTO_925 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_925 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_932 - WAYPOINT
    )
    :vars
    (
      ?AUTO_937 - LANDER
      ?AUTO_936 - WAYPOINT
      ?AUTO_933 - WAYPOINT
      ?AUTO_935 - ROVER
      ?AUTO_934 - STORE
      ?AUTO_938 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_937 ?AUTO_936 ) ( VISIBLE ?AUTO_933 ?AUTO_936 ) ( AVAILABLE ?AUTO_935 ) ( CHANNEL_FREE ?AUTO_937 ) ( not ( = ?AUTO_932 ?AUTO_933 ) ) ( not ( = ?AUTO_932 ?AUTO_936 ) ) ( not ( = ?AUTO_933 ?AUTO_936 ) ) ( CAN_TRAVERSE ?AUTO_935 ?AUTO_932 ?AUTO_933 ) ( VISIBLE ?AUTO_932 ?AUTO_933 ) ( AT_ROCK_SAMPLE ?AUTO_932 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_935 ) ( STORE_OF ?AUTO_934 ?AUTO_935 ) ( EMPTY ?AUTO_934 ) ( CAN_TRAVERSE ?AUTO_935 ?AUTO_938 ?AUTO_932 ) ( AT ?AUTO_935 ?AUTO_938 ) ( VISIBLE ?AUTO_938 ?AUTO_932 ) ( not ( = ?AUTO_932 ?AUTO_938 ) ) ( not ( = ?AUTO_936 ?AUTO_938 ) ) ( not ( = ?AUTO_933 ?AUTO_938 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_935 ?AUTO_938 ?AUTO_932 )
      ( GET_ROCK_DATA ?AUTO_932 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_932 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_949 - WAYPOINT
    )
    :vars
    (
      ?AUTO_951 - LANDER
      ?AUTO_952 - WAYPOINT
      ?AUTO_950 - ROVER
      ?AUTO_953 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_951 ?AUTO_952 ) ( VISIBLE ?AUTO_949 ?AUTO_952 ) ( AVAILABLE ?AUTO_950 ) ( CHANNEL_FREE ?AUTO_951 ) ( not ( = ?AUTO_949 ?AUTO_952 ) ) ( AT_ROCK_SAMPLE ?AUTO_949 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_950 ) ( STORE_OF ?AUTO_953 ?AUTO_950 ) ( EMPTY ?AUTO_953 ) ( CAN_TRAVERSE ?AUTO_950 ?AUTO_952 ?AUTO_949 ) ( AT ?AUTO_950 ?AUTO_952 ) ( VISIBLE ?AUTO_952 ?AUTO_949 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_950 ?AUTO_952 ?AUTO_949 )
      ( GET_ROCK_DATA ?AUTO_949 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_949 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_954 - WAYPOINT
    )
    :vars
    (
      ?AUTO_956 - LANDER
      ?AUTO_958 - WAYPOINT
      ?AUTO_955 - ROVER
      ?AUTO_957 - STORE
      ?AUTO_959 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_956 ?AUTO_958 ) ( VISIBLE ?AUTO_954 ?AUTO_958 ) ( AVAILABLE ?AUTO_955 ) ( CHANNEL_FREE ?AUTO_956 ) ( not ( = ?AUTO_954 ?AUTO_958 ) ) ( AT_ROCK_SAMPLE ?AUTO_954 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_955 ) ( STORE_OF ?AUTO_957 ?AUTO_955 ) ( EMPTY ?AUTO_957 ) ( CAN_TRAVERSE ?AUTO_955 ?AUTO_958 ?AUTO_954 ) ( VISIBLE ?AUTO_958 ?AUTO_954 ) ( CAN_TRAVERSE ?AUTO_955 ?AUTO_959 ?AUTO_958 ) ( AT ?AUTO_955 ?AUTO_959 ) ( VISIBLE ?AUTO_959 ?AUTO_958 ) ( not ( = ?AUTO_954 ?AUTO_959 ) ) ( not ( = ?AUTO_958 ?AUTO_959 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_955 ?AUTO_959 ?AUTO_958 )
      ( GET_ROCK_DATA ?AUTO_954 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_954 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_961 - WAYPOINT
    )
    :vars
    (
      ?AUTO_965 - LANDER
      ?AUTO_963 - WAYPOINT
      ?AUTO_966 - ROVER
      ?AUTO_964 - STORE
      ?AUTO_962 - WAYPOINT
      ?AUTO_967 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_965 ?AUTO_963 ) ( VISIBLE ?AUTO_961 ?AUTO_963 ) ( AVAILABLE ?AUTO_966 ) ( CHANNEL_FREE ?AUTO_965 ) ( not ( = ?AUTO_961 ?AUTO_963 ) ) ( AT_ROCK_SAMPLE ?AUTO_961 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_966 ) ( STORE_OF ?AUTO_964 ?AUTO_966 ) ( EMPTY ?AUTO_964 ) ( CAN_TRAVERSE ?AUTO_966 ?AUTO_963 ?AUTO_961 ) ( VISIBLE ?AUTO_963 ?AUTO_961 ) ( CAN_TRAVERSE ?AUTO_966 ?AUTO_962 ?AUTO_963 ) ( VISIBLE ?AUTO_962 ?AUTO_963 ) ( not ( = ?AUTO_961 ?AUTO_962 ) ) ( not ( = ?AUTO_963 ?AUTO_962 ) ) ( CAN_TRAVERSE ?AUTO_966 ?AUTO_967 ?AUTO_962 ) ( AT ?AUTO_966 ?AUTO_967 ) ( VISIBLE ?AUTO_967 ?AUTO_962 ) ( not ( = ?AUTO_961 ?AUTO_967 ) ) ( not ( = ?AUTO_963 ?AUTO_967 ) ) ( not ( = ?AUTO_962 ?AUTO_967 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_966 ?AUTO_967 ?AUTO_962 )
      ( GET_ROCK_DATA ?AUTO_961 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_961 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_968 - WAYPOINT
    )
    :vars
    (
      ?AUTO_971 - LANDER
      ?AUTO_970 - WAYPOINT
      ?AUTO_969 - ROVER
      ?AUTO_972 - STORE
      ?AUTO_974 - WAYPOINT
      ?AUTO_973 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_971 ?AUTO_970 ) ( VISIBLE ?AUTO_968 ?AUTO_970 ) ( AVAILABLE ?AUTO_969 ) ( CHANNEL_FREE ?AUTO_971 ) ( not ( = ?AUTO_968 ?AUTO_970 ) ) ( AT_ROCK_SAMPLE ?AUTO_968 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_969 ) ( STORE_OF ?AUTO_972 ?AUTO_969 ) ( CAN_TRAVERSE ?AUTO_969 ?AUTO_970 ?AUTO_968 ) ( VISIBLE ?AUTO_970 ?AUTO_968 ) ( CAN_TRAVERSE ?AUTO_969 ?AUTO_974 ?AUTO_970 ) ( VISIBLE ?AUTO_974 ?AUTO_970 ) ( not ( = ?AUTO_968 ?AUTO_974 ) ) ( not ( = ?AUTO_970 ?AUTO_974 ) ) ( CAN_TRAVERSE ?AUTO_969 ?AUTO_973 ?AUTO_974 ) ( AT ?AUTO_969 ?AUTO_973 ) ( VISIBLE ?AUTO_973 ?AUTO_974 ) ( not ( = ?AUTO_968 ?AUTO_973 ) ) ( not ( = ?AUTO_970 ?AUTO_973 ) ) ( not ( = ?AUTO_974 ?AUTO_973 ) ) ( FULL ?AUTO_972 ) )
    :subtasks
    ( ( !DROP ?AUTO_969 ?AUTO_972 )
      ( GET_ROCK_DATA ?AUTO_968 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_968 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1012 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1013 - LANDER
      ?AUTO_1016 - WAYPOINT
      ?AUTO_1017 - ROVER
      ?AUTO_1014 - STORE
      ?AUTO_1015 - WAYPOINT
      ?AUTO_1018 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1013 ?AUTO_1012 ) ( VISIBLE ?AUTO_1016 ?AUTO_1012 ) ( AVAILABLE ?AUTO_1017 ) ( CHANNEL_FREE ?AUTO_1013 ) ( not ( = ?AUTO_1012 ?AUTO_1016 ) ) ( CAN_TRAVERSE ?AUTO_1017 ?AUTO_1012 ?AUTO_1016 ) ( VISIBLE ?AUTO_1012 ?AUTO_1016 ) ( AT_ROCK_SAMPLE ?AUTO_1012 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1017 ) ( STORE_OF ?AUTO_1014 ?AUTO_1017 ) ( EMPTY ?AUTO_1014 ) ( CAN_TRAVERSE ?AUTO_1017 ?AUTO_1015 ?AUTO_1012 ) ( VISIBLE ?AUTO_1015 ?AUTO_1012 ) ( not ( = ?AUTO_1012 ?AUTO_1015 ) ) ( not ( = ?AUTO_1016 ?AUTO_1015 ) ) ( CAN_TRAVERSE ?AUTO_1017 ?AUTO_1018 ?AUTO_1015 ) ( AT ?AUTO_1017 ?AUTO_1018 ) ( VISIBLE ?AUTO_1018 ?AUTO_1015 ) ( not ( = ?AUTO_1012 ?AUTO_1018 ) ) ( not ( = ?AUTO_1016 ?AUTO_1018 ) ) ( not ( = ?AUTO_1015 ?AUTO_1018 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1017 ?AUTO_1018 ?AUTO_1015 )
      ( GET_ROCK_DATA ?AUTO_1012 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1012 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1019 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1021 - LANDER
      ?AUTO_1025 - WAYPOINT
      ?AUTO_1022 - ROVER
      ?AUTO_1024 - STORE
      ?AUTO_1020 - WAYPOINT
      ?AUTO_1023 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1021 ?AUTO_1019 ) ( VISIBLE ?AUTO_1025 ?AUTO_1019 ) ( AVAILABLE ?AUTO_1022 ) ( CHANNEL_FREE ?AUTO_1021 ) ( not ( = ?AUTO_1019 ?AUTO_1025 ) ) ( CAN_TRAVERSE ?AUTO_1022 ?AUTO_1019 ?AUTO_1025 ) ( VISIBLE ?AUTO_1019 ?AUTO_1025 ) ( AT_ROCK_SAMPLE ?AUTO_1019 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1022 ) ( STORE_OF ?AUTO_1024 ?AUTO_1022 ) ( CAN_TRAVERSE ?AUTO_1022 ?AUTO_1020 ?AUTO_1019 ) ( VISIBLE ?AUTO_1020 ?AUTO_1019 ) ( not ( = ?AUTO_1019 ?AUTO_1020 ) ) ( not ( = ?AUTO_1025 ?AUTO_1020 ) ) ( CAN_TRAVERSE ?AUTO_1022 ?AUTO_1023 ?AUTO_1020 ) ( AT ?AUTO_1022 ?AUTO_1023 ) ( VISIBLE ?AUTO_1023 ?AUTO_1020 ) ( not ( = ?AUTO_1019 ?AUTO_1023 ) ) ( not ( = ?AUTO_1025 ?AUTO_1023 ) ) ( not ( = ?AUTO_1020 ?AUTO_1023 ) ) ( FULL ?AUTO_1024 ) )
    :subtasks
    ( ( !DROP ?AUTO_1022 ?AUTO_1024 )
      ( GET_ROCK_DATA ?AUTO_1019 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1019 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1054 - OBJECTIVE
      ?AUTO_1055 - MODE
    )
    :vars
    (
      ?AUTO_1056 - LANDER
      ?AUTO_1059 - WAYPOINT
      ?AUTO_1057 - WAYPOINT
      ?AUTO_1060 - ROVER
      ?AUTO_1058 - WAYPOINT
      ?AUTO_1061 - CAMERA
      ?AUTO_1062 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1056 ?AUTO_1059 ) ( VISIBLE ?AUTO_1057 ?AUTO_1059 ) ( AVAILABLE ?AUTO_1060 ) ( CHANNEL_FREE ?AUTO_1056 ) ( not ( = ?AUTO_1057 ?AUTO_1059 ) ) ( CAN_TRAVERSE ?AUTO_1060 ?AUTO_1058 ?AUTO_1057 ) ( VISIBLE ?AUTO_1058 ?AUTO_1057 ) ( not ( = ?AUTO_1059 ?AUTO_1058 ) ) ( not ( = ?AUTO_1057 ?AUTO_1058 ) ) ( CALIBRATED ?AUTO_1061 ?AUTO_1060 ) ( ON_BOARD ?AUTO_1061 ?AUTO_1060 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1060 ) ( SUPPORTS ?AUTO_1061 ?AUTO_1055 ) ( VISIBLE_FROM ?AUTO_1054 ?AUTO_1058 ) ( CAN_TRAVERSE ?AUTO_1060 ?AUTO_1062 ?AUTO_1058 ) ( AT ?AUTO_1060 ?AUTO_1062 ) ( VISIBLE ?AUTO_1062 ?AUTO_1058 ) ( not ( = ?AUTO_1059 ?AUTO_1062 ) ) ( not ( = ?AUTO_1057 ?AUTO_1062 ) ) ( not ( = ?AUTO_1058 ?AUTO_1062 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1060 ?AUTO_1062 ?AUTO_1058 )
      ( GET_IMAGE_DATA ?AUTO_1054 ?AUTO_1055 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1054 ?AUTO_1055 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1063 - OBJECTIVE
      ?AUTO_1064 - MODE
    )
    :vars
    (
      ?AUTO_1068 - LANDER
      ?AUTO_1070 - WAYPOINT
      ?AUTO_1067 - WAYPOINT
      ?AUTO_1069 - ROVER
      ?AUTO_1066 - WAYPOINT
      ?AUTO_1065 - CAMERA
      ?AUTO_1071 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1068 ?AUTO_1070 ) ( VISIBLE ?AUTO_1067 ?AUTO_1070 ) ( AVAILABLE ?AUTO_1069 ) ( CHANNEL_FREE ?AUTO_1068 ) ( not ( = ?AUTO_1067 ?AUTO_1070 ) ) ( CAN_TRAVERSE ?AUTO_1069 ?AUTO_1066 ?AUTO_1067 ) ( VISIBLE ?AUTO_1066 ?AUTO_1067 ) ( not ( = ?AUTO_1070 ?AUTO_1066 ) ) ( not ( = ?AUTO_1067 ?AUTO_1066 ) ) ( CALIBRATED ?AUTO_1065 ?AUTO_1069 ) ( ON_BOARD ?AUTO_1065 ?AUTO_1069 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1069 ) ( SUPPORTS ?AUTO_1065 ?AUTO_1064 ) ( VISIBLE_FROM ?AUTO_1063 ?AUTO_1066 ) ( CAN_TRAVERSE ?AUTO_1069 ?AUTO_1071 ?AUTO_1066 ) ( VISIBLE ?AUTO_1071 ?AUTO_1066 ) ( not ( = ?AUTO_1070 ?AUTO_1071 ) ) ( not ( = ?AUTO_1067 ?AUTO_1071 ) ) ( not ( = ?AUTO_1066 ?AUTO_1071 ) ) ( CAN_TRAVERSE ?AUTO_1069 ?AUTO_1070 ?AUTO_1071 ) ( AT ?AUTO_1069 ?AUTO_1070 ) ( VISIBLE ?AUTO_1070 ?AUTO_1071 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1069 ?AUTO_1070 ?AUTO_1071 )
      ( GET_IMAGE_DATA ?AUTO_1063 ?AUTO_1064 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1063 ?AUTO_1064 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1072 - OBJECTIVE
      ?AUTO_1073 - MODE
    )
    :vars
    (
      ?AUTO_1079 - LANDER
      ?AUTO_1075 - WAYPOINT
      ?AUTO_1077 - WAYPOINT
      ?AUTO_1076 - ROVER
      ?AUTO_1078 - WAYPOINT
      ?AUTO_1074 - CAMERA
      ?AUTO_1080 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1079 ?AUTO_1075 ) ( VISIBLE ?AUTO_1077 ?AUTO_1075 ) ( AVAILABLE ?AUTO_1076 ) ( CHANNEL_FREE ?AUTO_1079 ) ( not ( = ?AUTO_1077 ?AUTO_1075 ) ) ( CAN_TRAVERSE ?AUTO_1076 ?AUTO_1078 ?AUTO_1077 ) ( VISIBLE ?AUTO_1078 ?AUTO_1077 ) ( not ( = ?AUTO_1075 ?AUTO_1078 ) ) ( not ( = ?AUTO_1077 ?AUTO_1078 ) ) ( CALIBRATED ?AUTO_1074 ?AUTO_1076 ) ( ON_BOARD ?AUTO_1074 ?AUTO_1076 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1076 ) ( SUPPORTS ?AUTO_1074 ?AUTO_1073 ) ( VISIBLE_FROM ?AUTO_1072 ?AUTO_1078 ) ( CAN_TRAVERSE ?AUTO_1076 ?AUTO_1080 ?AUTO_1078 ) ( VISIBLE ?AUTO_1080 ?AUTO_1078 ) ( not ( = ?AUTO_1075 ?AUTO_1080 ) ) ( not ( = ?AUTO_1077 ?AUTO_1080 ) ) ( not ( = ?AUTO_1078 ?AUTO_1080 ) ) ( CAN_TRAVERSE ?AUTO_1076 ?AUTO_1075 ?AUTO_1080 ) ( VISIBLE ?AUTO_1075 ?AUTO_1080 ) ( CAN_TRAVERSE ?AUTO_1076 ?AUTO_1077 ?AUTO_1075 ) ( AT ?AUTO_1076 ?AUTO_1077 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1076 ?AUTO_1077 ?AUTO_1075 )
      ( GET_IMAGE_DATA ?AUTO_1072 ?AUTO_1073 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1072 ?AUTO_1073 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1081 - OBJECTIVE
      ?AUTO_1082 - MODE
    )
    :vars
    (
      ?AUTO_1084 - LANDER
      ?AUTO_1085 - WAYPOINT
      ?AUTO_1086 - WAYPOINT
      ?AUTO_1083 - ROVER
      ?AUTO_1089 - WAYPOINT
      ?AUTO_1087 - CAMERA
      ?AUTO_1088 - WAYPOINT
      ?AUTO_1090 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1084 ?AUTO_1085 ) ( VISIBLE ?AUTO_1086 ?AUTO_1085 ) ( AVAILABLE ?AUTO_1083 ) ( CHANNEL_FREE ?AUTO_1084 ) ( not ( = ?AUTO_1086 ?AUTO_1085 ) ) ( CAN_TRAVERSE ?AUTO_1083 ?AUTO_1089 ?AUTO_1086 ) ( VISIBLE ?AUTO_1089 ?AUTO_1086 ) ( not ( = ?AUTO_1085 ?AUTO_1089 ) ) ( not ( = ?AUTO_1086 ?AUTO_1089 ) ) ( ON_BOARD ?AUTO_1087 ?AUTO_1083 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1083 ) ( SUPPORTS ?AUTO_1087 ?AUTO_1082 ) ( VISIBLE_FROM ?AUTO_1081 ?AUTO_1089 ) ( CAN_TRAVERSE ?AUTO_1083 ?AUTO_1088 ?AUTO_1089 ) ( VISIBLE ?AUTO_1088 ?AUTO_1089 ) ( not ( = ?AUTO_1085 ?AUTO_1088 ) ) ( not ( = ?AUTO_1086 ?AUTO_1088 ) ) ( not ( = ?AUTO_1089 ?AUTO_1088 ) ) ( CAN_TRAVERSE ?AUTO_1083 ?AUTO_1085 ?AUTO_1088 ) ( VISIBLE ?AUTO_1085 ?AUTO_1088 ) ( CAN_TRAVERSE ?AUTO_1083 ?AUTO_1086 ?AUTO_1085 ) ( AT ?AUTO_1083 ?AUTO_1086 ) ( CALIBRATION_TARGET ?AUTO_1087 ?AUTO_1090 ) ( VISIBLE_FROM ?AUTO_1090 ?AUTO_1086 ) ( not ( = ?AUTO_1081 ?AUTO_1090 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1083 ?AUTO_1087 ?AUTO_1090 ?AUTO_1086 )
      ( GET_IMAGE_DATA ?AUTO_1081 ?AUTO_1082 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1081 ?AUTO_1082 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1091 - OBJECTIVE
      ?AUTO_1092 - MODE
    )
    :vars
    (
      ?AUTO_1095 - LANDER
      ?AUTO_1093 - WAYPOINT
      ?AUTO_1094 - WAYPOINT
      ?AUTO_1097 - ROVER
      ?AUTO_1096 - WAYPOINT
      ?AUTO_1098 - CAMERA
      ?AUTO_1099 - WAYPOINT
      ?AUTO_1100 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1095 ?AUTO_1093 ) ( VISIBLE ?AUTO_1094 ?AUTO_1093 ) ( AVAILABLE ?AUTO_1097 ) ( CHANNEL_FREE ?AUTO_1095 ) ( not ( = ?AUTO_1094 ?AUTO_1093 ) ) ( CAN_TRAVERSE ?AUTO_1097 ?AUTO_1096 ?AUTO_1094 ) ( VISIBLE ?AUTO_1096 ?AUTO_1094 ) ( not ( = ?AUTO_1093 ?AUTO_1096 ) ) ( not ( = ?AUTO_1094 ?AUTO_1096 ) ) ( ON_BOARD ?AUTO_1098 ?AUTO_1097 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1097 ) ( SUPPORTS ?AUTO_1098 ?AUTO_1092 ) ( VISIBLE_FROM ?AUTO_1091 ?AUTO_1096 ) ( CAN_TRAVERSE ?AUTO_1097 ?AUTO_1099 ?AUTO_1096 ) ( VISIBLE ?AUTO_1099 ?AUTO_1096 ) ( not ( = ?AUTO_1093 ?AUTO_1099 ) ) ( not ( = ?AUTO_1094 ?AUTO_1099 ) ) ( not ( = ?AUTO_1096 ?AUTO_1099 ) ) ( CAN_TRAVERSE ?AUTO_1097 ?AUTO_1093 ?AUTO_1099 ) ( VISIBLE ?AUTO_1093 ?AUTO_1099 ) ( CAN_TRAVERSE ?AUTO_1097 ?AUTO_1094 ?AUTO_1093 ) ( CALIBRATION_TARGET ?AUTO_1098 ?AUTO_1100 ) ( VISIBLE_FROM ?AUTO_1100 ?AUTO_1094 ) ( not ( = ?AUTO_1091 ?AUTO_1100 ) ) ( CAN_TRAVERSE ?AUTO_1097 ?AUTO_1099 ?AUTO_1094 ) ( AT ?AUTO_1097 ?AUTO_1099 ) ( VISIBLE ?AUTO_1099 ?AUTO_1094 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1097 ?AUTO_1099 ?AUTO_1094 )
      ( GET_IMAGE_DATA ?AUTO_1091 ?AUTO_1092 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1091 ?AUTO_1092 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1127 - OBJECTIVE
      ?AUTO_1128 - MODE
    )
    :vars
    (
      ?AUTO_1131 - LANDER
      ?AUTO_1134 - WAYPOINT
      ?AUTO_1130 - WAYPOINT
      ?AUTO_1129 - ROVER
      ?AUTO_1132 - WAYPOINT
      ?AUTO_1136 - CAMERA
      ?AUTO_1135 - WAYPOINT
      ?AUTO_1133 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1131 ?AUTO_1134 ) ( VISIBLE ?AUTO_1130 ?AUTO_1134 ) ( AVAILABLE ?AUTO_1129 ) ( CHANNEL_FREE ?AUTO_1131 ) ( not ( = ?AUTO_1130 ?AUTO_1134 ) ) ( CAN_TRAVERSE ?AUTO_1129 ?AUTO_1132 ?AUTO_1130 ) ( VISIBLE ?AUTO_1132 ?AUTO_1130 ) ( not ( = ?AUTO_1134 ?AUTO_1132 ) ) ( not ( = ?AUTO_1130 ?AUTO_1132 ) ) ( ON_BOARD ?AUTO_1136 ?AUTO_1129 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1129 ) ( SUPPORTS ?AUTO_1136 ?AUTO_1128 ) ( VISIBLE_FROM ?AUTO_1127 ?AUTO_1132 ) ( CAN_TRAVERSE ?AUTO_1129 ?AUTO_1135 ?AUTO_1132 ) ( VISIBLE ?AUTO_1135 ?AUTO_1132 ) ( not ( = ?AUTO_1134 ?AUTO_1135 ) ) ( not ( = ?AUTO_1130 ?AUTO_1135 ) ) ( not ( = ?AUTO_1132 ?AUTO_1135 ) ) ( CAN_TRAVERSE ?AUTO_1129 ?AUTO_1134 ?AUTO_1135 ) ( VISIBLE ?AUTO_1134 ?AUTO_1135 ) ( CAN_TRAVERSE ?AUTO_1129 ?AUTO_1130 ?AUTO_1134 ) ( CALIBRATION_TARGET ?AUTO_1136 ?AUTO_1133 ) ( VISIBLE_FROM ?AUTO_1133 ?AUTO_1130 ) ( not ( = ?AUTO_1127 ?AUTO_1133 ) ) ( CAN_TRAVERSE ?AUTO_1129 ?AUTO_1135 ?AUTO_1130 ) ( VISIBLE ?AUTO_1135 ?AUTO_1130 ) ( AT ?AUTO_1129 ?AUTO_1134 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1129 ?AUTO_1134 ?AUTO_1135 )
      ( GET_IMAGE_DATA ?AUTO_1127 ?AUTO_1128 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1127 ?AUTO_1128 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1162 - OBJECTIVE
      ?AUTO_1163 - MODE
    )
    :vars
    (
      ?AUTO_1164 - LANDER
      ?AUTO_1165 - WAYPOINT
      ?AUTO_1166 - WAYPOINT
      ?AUTO_1168 - ROVER
      ?AUTO_1167 - WAYPOINT
      ?AUTO_1169 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1164 ?AUTO_1165 ) ( VISIBLE ?AUTO_1166 ?AUTO_1165 ) ( AVAILABLE ?AUTO_1168 ) ( CHANNEL_FREE ?AUTO_1164 ) ( not ( = ?AUTO_1166 ?AUTO_1165 ) ) ( CAN_TRAVERSE ?AUTO_1168 ?AUTO_1167 ?AUTO_1166 ) ( VISIBLE ?AUTO_1167 ?AUTO_1166 ) ( not ( = ?AUTO_1165 ?AUTO_1167 ) ) ( not ( = ?AUTO_1166 ?AUTO_1167 ) ) ( CALIBRATED ?AUTO_1169 ?AUTO_1168 ) ( ON_BOARD ?AUTO_1169 ?AUTO_1168 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1168 ) ( SUPPORTS ?AUTO_1169 ?AUTO_1163 ) ( VISIBLE_FROM ?AUTO_1162 ?AUTO_1167 ) ( CAN_TRAVERSE ?AUTO_1168 ?AUTO_1166 ?AUTO_1167 ) ( AT ?AUTO_1168 ?AUTO_1166 ) ( VISIBLE ?AUTO_1166 ?AUTO_1167 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1168 ?AUTO_1166 ?AUTO_1167 )
      ( GET_IMAGE_DATA ?AUTO_1162 ?AUTO_1163 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1162 ?AUTO_1163 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1170 - OBJECTIVE
      ?AUTO_1171 - MODE
    )
    :vars
    (
      ?AUTO_1175 - LANDER
      ?AUTO_1172 - WAYPOINT
      ?AUTO_1176 - WAYPOINT
      ?AUTO_1173 - ROVER
      ?AUTO_1174 - WAYPOINT
      ?AUTO_1177 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1175 ?AUTO_1172 ) ( VISIBLE ?AUTO_1176 ?AUTO_1172 ) ( AVAILABLE ?AUTO_1173 ) ( CHANNEL_FREE ?AUTO_1175 ) ( not ( = ?AUTO_1176 ?AUTO_1172 ) ) ( CAN_TRAVERSE ?AUTO_1173 ?AUTO_1174 ?AUTO_1176 ) ( VISIBLE ?AUTO_1174 ?AUTO_1176 ) ( not ( = ?AUTO_1172 ?AUTO_1174 ) ) ( not ( = ?AUTO_1176 ?AUTO_1174 ) ) ( CALIBRATED ?AUTO_1177 ?AUTO_1173 ) ( ON_BOARD ?AUTO_1177 ?AUTO_1173 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1173 ) ( SUPPORTS ?AUTO_1177 ?AUTO_1171 ) ( VISIBLE_FROM ?AUTO_1170 ?AUTO_1174 ) ( CAN_TRAVERSE ?AUTO_1173 ?AUTO_1176 ?AUTO_1174 ) ( VISIBLE ?AUTO_1176 ?AUTO_1174 ) ( CAN_TRAVERSE ?AUTO_1173 ?AUTO_1172 ?AUTO_1176 ) ( AT ?AUTO_1173 ?AUTO_1172 ) ( VISIBLE ?AUTO_1172 ?AUTO_1176 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1173 ?AUTO_1172 ?AUTO_1176 )
      ( GET_IMAGE_DATA ?AUTO_1170 ?AUTO_1171 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1170 ?AUTO_1171 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1178 - OBJECTIVE
      ?AUTO_1179 - MODE
    )
    :vars
    (
      ?AUTO_1185 - LANDER
      ?AUTO_1181 - WAYPOINT
      ?AUTO_1180 - WAYPOINT
      ?AUTO_1183 - ROVER
      ?AUTO_1184 - WAYPOINT
      ?AUTO_1182 - CAMERA
      ?AUTO_1186 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1185 ?AUTO_1181 ) ( VISIBLE ?AUTO_1180 ?AUTO_1181 ) ( AVAILABLE ?AUTO_1183 ) ( CHANNEL_FREE ?AUTO_1185 ) ( not ( = ?AUTO_1180 ?AUTO_1181 ) ) ( CAN_TRAVERSE ?AUTO_1183 ?AUTO_1184 ?AUTO_1180 ) ( VISIBLE ?AUTO_1184 ?AUTO_1180 ) ( not ( = ?AUTO_1181 ?AUTO_1184 ) ) ( not ( = ?AUTO_1180 ?AUTO_1184 ) ) ( CALIBRATED ?AUTO_1182 ?AUTO_1183 ) ( ON_BOARD ?AUTO_1182 ?AUTO_1183 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1183 ) ( SUPPORTS ?AUTO_1182 ?AUTO_1179 ) ( VISIBLE_FROM ?AUTO_1178 ?AUTO_1184 ) ( CAN_TRAVERSE ?AUTO_1183 ?AUTO_1180 ?AUTO_1184 ) ( VISIBLE ?AUTO_1180 ?AUTO_1184 ) ( CAN_TRAVERSE ?AUTO_1183 ?AUTO_1181 ?AUTO_1180 ) ( VISIBLE ?AUTO_1181 ?AUTO_1180 ) ( CAN_TRAVERSE ?AUTO_1183 ?AUTO_1186 ?AUTO_1181 ) ( AT ?AUTO_1183 ?AUTO_1186 ) ( VISIBLE ?AUTO_1186 ?AUTO_1181 ) ( not ( = ?AUTO_1181 ?AUTO_1186 ) ) ( not ( = ?AUTO_1180 ?AUTO_1186 ) ) ( not ( = ?AUTO_1184 ?AUTO_1186 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1183 ?AUTO_1186 ?AUTO_1181 )
      ( GET_IMAGE_DATA ?AUTO_1178 ?AUTO_1179 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1178 ?AUTO_1179 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1189 - OBJECTIVE
      ?AUTO_1190 - MODE
    )
    :vars
    (
      ?AUTO_1195 - LANDER
      ?AUTO_1193 - WAYPOINT
      ?AUTO_1191 - WAYPOINT
      ?AUTO_1192 - ROVER
      ?AUTO_1196 - WAYPOINT
      ?AUTO_1197 - CAMERA
      ?AUTO_1194 - WAYPOINT
      ?AUTO_1198 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1195 ?AUTO_1193 ) ( VISIBLE ?AUTO_1191 ?AUTO_1193 ) ( AVAILABLE ?AUTO_1192 ) ( CHANNEL_FREE ?AUTO_1195 ) ( not ( = ?AUTO_1191 ?AUTO_1193 ) ) ( CAN_TRAVERSE ?AUTO_1192 ?AUTO_1196 ?AUTO_1191 ) ( VISIBLE ?AUTO_1196 ?AUTO_1191 ) ( not ( = ?AUTO_1193 ?AUTO_1196 ) ) ( not ( = ?AUTO_1191 ?AUTO_1196 ) ) ( ON_BOARD ?AUTO_1197 ?AUTO_1192 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1192 ) ( SUPPORTS ?AUTO_1197 ?AUTO_1190 ) ( VISIBLE_FROM ?AUTO_1189 ?AUTO_1196 ) ( CAN_TRAVERSE ?AUTO_1192 ?AUTO_1191 ?AUTO_1196 ) ( VISIBLE ?AUTO_1191 ?AUTO_1196 ) ( CAN_TRAVERSE ?AUTO_1192 ?AUTO_1193 ?AUTO_1191 ) ( VISIBLE ?AUTO_1193 ?AUTO_1191 ) ( CAN_TRAVERSE ?AUTO_1192 ?AUTO_1194 ?AUTO_1193 ) ( AT ?AUTO_1192 ?AUTO_1194 ) ( VISIBLE ?AUTO_1194 ?AUTO_1193 ) ( not ( = ?AUTO_1193 ?AUTO_1194 ) ) ( not ( = ?AUTO_1191 ?AUTO_1194 ) ) ( not ( = ?AUTO_1196 ?AUTO_1194 ) ) ( CALIBRATION_TARGET ?AUTO_1197 ?AUTO_1198 ) ( VISIBLE_FROM ?AUTO_1198 ?AUTO_1194 ) ( not ( = ?AUTO_1189 ?AUTO_1198 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1192 ?AUTO_1197 ?AUTO_1198 ?AUTO_1194 )
      ( GET_IMAGE_DATA ?AUTO_1189 ?AUTO_1190 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1189 ?AUTO_1190 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1199 - OBJECTIVE
      ?AUTO_1200 - MODE
    )
    :vars
    (
      ?AUTO_1208 - LANDER
      ?AUTO_1206 - WAYPOINT
      ?AUTO_1201 - WAYPOINT
      ?AUTO_1202 - ROVER
      ?AUTO_1207 - WAYPOINT
      ?AUTO_1205 - CAMERA
      ?AUTO_1203 - WAYPOINT
      ?AUTO_1204 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1208 ?AUTO_1206 ) ( VISIBLE ?AUTO_1201 ?AUTO_1206 ) ( AVAILABLE ?AUTO_1202 ) ( CHANNEL_FREE ?AUTO_1208 ) ( not ( = ?AUTO_1201 ?AUTO_1206 ) ) ( CAN_TRAVERSE ?AUTO_1202 ?AUTO_1207 ?AUTO_1201 ) ( VISIBLE ?AUTO_1207 ?AUTO_1201 ) ( not ( = ?AUTO_1206 ?AUTO_1207 ) ) ( not ( = ?AUTO_1201 ?AUTO_1207 ) ) ( ON_BOARD ?AUTO_1205 ?AUTO_1202 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1202 ) ( SUPPORTS ?AUTO_1205 ?AUTO_1200 ) ( VISIBLE_FROM ?AUTO_1199 ?AUTO_1207 ) ( CAN_TRAVERSE ?AUTO_1202 ?AUTO_1201 ?AUTO_1207 ) ( VISIBLE ?AUTO_1201 ?AUTO_1207 ) ( CAN_TRAVERSE ?AUTO_1202 ?AUTO_1206 ?AUTO_1201 ) ( VISIBLE ?AUTO_1206 ?AUTO_1201 ) ( CAN_TRAVERSE ?AUTO_1202 ?AUTO_1203 ?AUTO_1206 ) ( VISIBLE ?AUTO_1203 ?AUTO_1206 ) ( not ( = ?AUTO_1206 ?AUTO_1203 ) ) ( not ( = ?AUTO_1201 ?AUTO_1203 ) ) ( not ( = ?AUTO_1207 ?AUTO_1203 ) ) ( CALIBRATION_TARGET ?AUTO_1205 ?AUTO_1204 ) ( VISIBLE_FROM ?AUTO_1204 ?AUTO_1203 ) ( not ( = ?AUTO_1199 ?AUTO_1204 ) ) ( CAN_TRAVERSE ?AUTO_1202 ?AUTO_1207 ?AUTO_1203 ) ( AT ?AUTO_1202 ?AUTO_1207 ) ( VISIBLE ?AUTO_1207 ?AUTO_1203 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1202 ?AUTO_1207 ?AUTO_1203 )
      ( GET_IMAGE_DATA ?AUTO_1199 ?AUTO_1200 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1199 ?AUTO_1200 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1278 - OBJECTIVE
      ?AUTO_1279 - MODE
    )
    :vars
    (
      ?AUTO_1281 - LANDER
      ?AUTO_1285 - WAYPOINT
      ?AUTO_1280 - WAYPOINT
      ?AUTO_1283 - ROVER
      ?AUTO_1282 - WAYPOINT
      ?AUTO_1284 - CAMERA
      ?AUTO_1286 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1281 ?AUTO_1285 ) ( VISIBLE ?AUTO_1280 ?AUTO_1285 ) ( AVAILABLE ?AUTO_1283 ) ( CHANNEL_FREE ?AUTO_1281 ) ( not ( = ?AUTO_1280 ?AUTO_1285 ) ) ( CAN_TRAVERSE ?AUTO_1283 ?AUTO_1282 ?AUTO_1280 ) ( AT ?AUTO_1283 ?AUTO_1282 ) ( VISIBLE ?AUTO_1282 ?AUTO_1280 ) ( not ( = ?AUTO_1285 ?AUTO_1282 ) ) ( not ( = ?AUTO_1280 ?AUTO_1282 ) ) ( ON_BOARD ?AUTO_1284 ?AUTO_1283 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1283 ) ( SUPPORTS ?AUTO_1284 ?AUTO_1279 ) ( VISIBLE_FROM ?AUTO_1278 ?AUTO_1282 ) ( CALIBRATION_TARGET ?AUTO_1284 ?AUTO_1286 ) ( VISIBLE_FROM ?AUTO_1286 ?AUTO_1282 ) ( not ( = ?AUTO_1278 ?AUTO_1286 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1283 ?AUTO_1284 ?AUTO_1286 ?AUTO_1282 )
      ( GET_IMAGE_DATA ?AUTO_1278 ?AUTO_1279 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1278 ?AUTO_1279 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1289 - OBJECTIVE
      ?AUTO_1290 - MODE
    )
    :vars
    (
      ?AUTO_1296 - LANDER
      ?AUTO_1294 - WAYPOINT
      ?AUTO_1297 - WAYPOINT
      ?AUTO_1292 - ROVER
      ?AUTO_1295 - WAYPOINT
      ?AUTO_1293 - CAMERA
      ?AUTO_1291 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1296 ?AUTO_1294 ) ( VISIBLE ?AUTO_1297 ?AUTO_1294 ) ( AVAILABLE ?AUTO_1292 ) ( CHANNEL_FREE ?AUTO_1296 ) ( not ( = ?AUTO_1297 ?AUTO_1294 ) ) ( CAN_TRAVERSE ?AUTO_1292 ?AUTO_1295 ?AUTO_1297 ) ( VISIBLE ?AUTO_1295 ?AUTO_1297 ) ( not ( = ?AUTO_1294 ?AUTO_1295 ) ) ( not ( = ?AUTO_1297 ?AUTO_1295 ) ) ( ON_BOARD ?AUTO_1293 ?AUTO_1292 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1292 ) ( SUPPORTS ?AUTO_1293 ?AUTO_1290 ) ( VISIBLE_FROM ?AUTO_1289 ?AUTO_1295 ) ( CALIBRATION_TARGET ?AUTO_1293 ?AUTO_1291 ) ( VISIBLE_FROM ?AUTO_1291 ?AUTO_1295 ) ( not ( = ?AUTO_1289 ?AUTO_1291 ) ) ( CAN_TRAVERSE ?AUTO_1292 ?AUTO_1297 ?AUTO_1295 ) ( AT ?AUTO_1292 ?AUTO_1297 ) ( VISIBLE ?AUTO_1297 ?AUTO_1295 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1292 ?AUTO_1297 ?AUTO_1295 )
      ( GET_IMAGE_DATA ?AUTO_1289 ?AUTO_1290 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1289 ?AUTO_1290 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1358 - OBJECTIVE
      ?AUTO_1359 - MODE
    )
    :vars
    (
      ?AUTO_1360 - LANDER
      ?AUTO_1362 - WAYPOINT
      ?AUTO_1364 - WAYPOINT
      ?AUTO_1363 - ROVER
      ?AUTO_1367 - CAMERA
      ?AUTO_1361 - WAYPOINT
      ?AUTO_1366 - WAYPOINT
      ?AUTO_1365 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1360 ?AUTO_1362 ) ( VISIBLE ?AUTO_1364 ?AUTO_1362 ) ( AVAILABLE ?AUTO_1363 ) ( CHANNEL_FREE ?AUTO_1360 ) ( not ( = ?AUTO_1364 ?AUTO_1362 ) ) ( CAN_TRAVERSE ?AUTO_1363 ?AUTO_1362 ?AUTO_1364 ) ( VISIBLE ?AUTO_1362 ?AUTO_1364 ) ( ON_BOARD ?AUTO_1367 ?AUTO_1363 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1363 ) ( SUPPORTS ?AUTO_1367 ?AUTO_1359 ) ( VISIBLE_FROM ?AUTO_1358 ?AUTO_1362 ) ( CAN_TRAVERSE ?AUTO_1363 ?AUTO_1361 ?AUTO_1362 ) ( VISIBLE ?AUTO_1361 ?AUTO_1362 ) ( not ( = ?AUTO_1362 ?AUTO_1361 ) ) ( not ( = ?AUTO_1364 ?AUTO_1361 ) ) ( CAN_TRAVERSE ?AUTO_1363 ?AUTO_1366 ?AUTO_1361 ) ( VISIBLE ?AUTO_1366 ?AUTO_1361 ) ( not ( = ?AUTO_1362 ?AUTO_1366 ) ) ( not ( = ?AUTO_1364 ?AUTO_1366 ) ) ( not ( = ?AUTO_1361 ?AUTO_1366 ) ) ( CALIBRATION_TARGET ?AUTO_1367 ?AUTO_1365 ) ( VISIBLE_FROM ?AUTO_1365 ?AUTO_1366 ) ( not ( = ?AUTO_1358 ?AUTO_1365 ) ) ( CAN_TRAVERSE ?AUTO_1363 ?AUTO_1361 ?AUTO_1366 ) ( AT ?AUTO_1363 ?AUTO_1361 ) ( VISIBLE ?AUTO_1361 ?AUTO_1366 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1363 ?AUTO_1361 ?AUTO_1366 )
      ( GET_IMAGE_DATA ?AUTO_1358 ?AUTO_1359 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1358 ?AUTO_1359 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1399 - OBJECTIVE
      ?AUTO_1400 - MODE
    )
    :vars
    (
      ?AUTO_1405 - LANDER
      ?AUTO_1403 - WAYPOINT
      ?AUTO_1404 - WAYPOINT
      ?AUTO_1401 - ROVER
      ?AUTO_1402 - WAYPOINT
      ?AUTO_1406 - CAMERA
      ?AUTO_1407 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1405 ?AUTO_1403 ) ( VISIBLE ?AUTO_1404 ?AUTO_1403 ) ( AVAILABLE ?AUTO_1401 ) ( CHANNEL_FREE ?AUTO_1405 ) ( not ( = ?AUTO_1404 ?AUTO_1403 ) ) ( CAN_TRAVERSE ?AUTO_1401 ?AUTO_1402 ?AUTO_1404 ) ( VISIBLE ?AUTO_1402 ?AUTO_1404 ) ( not ( = ?AUTO_1403 ?AUTO_1402 ) ) ( not ( = ?AUTO_1404 ?AUTO_1402 ) ) ( ON_BOARD ?AUTO_1406 ?AUTO_1401 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1401 ) ( SUPPORTS ?AUTO_1406 ?AUTO_1400 ) ( VISIBLE_FROM ?AUTO_1399 ?AUTO_1402 ) ( CALIBRATION_TARGET ?AUTO_1406 ?AUTO_1399 ) ( CAN_TRAVERSE ?AUTO_1401 ?AUTO_1407 ?AUTO_1402 ) ( AT ?AUTO_1401 ?AUTO_1407 ) ( VISIBLE ?AUTO_1407 ?AUTO_1402 ) ( not ( = ?AUTO_1403 ?AUTO_1407 ) ) ( not ( = ?AUTO_1404 ?AUTO_1407 ) ) ( not ( = ?AUTO_1402 ?AUTO_1407 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1401 ?AUTO_1407 ?AUTO_1402 )
      ( GET_IMAGE_DATA ?AUTO_1399 ?AUTO_1400 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1399 ?AUTO_1400 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1427 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1431 - LANDER
      ?AUTO_1430 - WAYPOINT
      ?AUTO_1428 - ROVER
      ?AUTO_1429 - STORE
      ?AUTO_1432 - WAYPOINT
      ?AUTO_1433 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1431 ?AUTO_1430 ) ( VISIBLE ?AUTO_1427 ?AUTO_1430 ) ( AVAILABLE ?AUTO_1428 ) ( CHANNEL_FREE ?AUTO_1431 ) ( not ( = ?AUTO_1427 ?AUTO_1430 ) ) ( AT_SOIL_SAMPLE ?AUTO_1427 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1428 ) ( STORE_OF ?AUTO_1429 ?AUTO_1428 ) ( EMPTY ?AUTO_1429 ) ( CAN_TRAVERSE ?AUTO_1428 ?AUTO_1432 ?AUTO_1427 ) ( VISIBLE ?AUTO_1432 ?AUTO_1427 ) ( not ( = ?AUTO_1427 ?AUTO_1432 ) ) ( not ( = ?AUTO_1430 ?AUTO_1432 ) ) ( CAN_TRAVERSE ?AUTO_1428 ?AUTO_1433 ?AUTO_1432 ) ( AT ?AUTO_1428 ?AUTO_1433 ) ( VISIBLE ?AUTO_1433 ?AUTO_1432 ) ( not ( = ?AUTO_1427 ?AUTO_1433 ) ) ( not ( = ?AUTO_1430 ?AUTO_1433 ) ) ( not ( = ?AUTO_1432 ?AUTO_1433 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1428 ?AUTO_1433 ?AUTO_1432 )
      ( GET_SOIL_DATA ?AUTO_1427 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1427 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1468 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1469 - ROVER
      ?AUTO_1472 - WAYPOINT
      ?AUTO_1471 - LANDER
      ?AUTO_1470 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_1469 ?AUTO_1472 ) ( AT_LANDER ?AUTO_1471 ?AUTO_1470 ) ( HAVE_SOIL_ANALYSIS ?AUTO_1469 ?AUTO_1468 ) ( VISIBLE ?AUTO_1472 ?AUTO_1470 ) ( AVAILABLE ?AUTO_1469 ) ( CHANNEL_FREE ?AUTO_1471 ) ( not ( = ?AUTO_1468 ?AUTO_1472 ) ) ( not ( = ?AUTO_1468 ?AUTO_1470 ) ) ( not ( = ?AUTO_1472 ?AUTO_1470 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_1469 ?AUTO_1471 ?AUTO_1468 ?AUTO_1472 ?AUTO_1470 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1468 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1473 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1475 - LANDER
      ?AUTO_1474 - WAYPOINT
      ?AUTO_1476 - ROVER
      ?AUTO_1477 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1475 ?AUTO_1474 ) ( HAVE_SOIL_ANALYSIS ?AUTO_1476 ?AUTO_1473 ) ( VISIBLE ?AUTO_1477 ?AUTO_1474 ) ( AVAILABLE ?AUTO_1476 ) ( CHANNEL_FREE ?AUTO_1475 ) ( not ( = ?AUTO_1473 ?AUTO_1477 ) ) ( not ( = ?AUTO_1473 ?AUTO_1474 ) ) ( not ( = ?AUTO_1477 ?AUTO_1474 ) ) ( CAN_TRAVERSE ?AUTO_1476 ?AUTO_1473 ?AUTO_1477 ) ( AT ?AUTO_1476 ?AUTO_1473 ) ( VISIBLE ?AUTO_1473 ?AUTO_1477 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1476 ?AUTO_1473 ?AUTO_1477 )
      ( GET_SOIL_DATA ?AUTO_1473 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1473 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1481 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1484 - LANDER
      ?AUTO_1483 - WAYPOINT
      ?AUTO_1485 - WAYPOINT
      ?AUTO_1482 - ROVER
      ?AUTO_1486 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1484 ?AUTO_1483 ) ( VISIBLE ?AUTO_1485 ?AUTO_1483 ) ( AVAILABLE ?AUTO_1482 ) ( CHANNEL_FREE ?AUTO_1484 ) ( not ( = ?AUTO_1481 ?AUTO_1485 ) ) ( not ( = ?AUTO_1481 ?AUTO_1483 ) ) ( not ( = ?AUTO_1485 ?AUTO_1483 ) ) ( CAN_TRAVERSE ?AUTO_1482 ?AUTO_1481 ?AUTO_1485 ) ( AT ?AUTO_1482 ?AUTO_1481 ) ( VISIBLE ?AUTO_1481 ?AUTO_1485 ) ( AT_SOIL_SAMPLE ?AUTO_1481 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1482 ) ( STORE_OF ?AUTO_1486 ?AUTO_1482 ) ( EMPTY ?AUTO_1486 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1482 ?AUTO_1486 ?AUTO_1481 )
      ( GET_SOIL_DATA ?AUTO_1481 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1481 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1487 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1488 - LANDER
      ?AUTO_1489 - WAYPOINT
      ?AUTO_1490 - WAYPOINT
      ?AUTO_1491 - ROVER
      ?AUTO_1492 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1488 ?AUTO_1489 ) ( VISIBLE ?AUTO_1490 ?AUTO_1489 ) ( AVAILABLE ?AUTO_1491 ) ( CHANNEL_FREE ?AUTO_1488 ) ( not ( = ?AUTO_1487 ?AUTO_1490 ) ) ( not ( = ?AUTO_1487 ?AUTO_1489 ) ) ( not ( = ?AUTO_1490 ?AUTO_1489 ) ) ( CAN_TRAVERSE ?AUTO_1491 ?AUTO_1487 ?AUTO_1490 ) ( AT ?AUTO_1491 ?AUTO_1487 ) ( VISIBLE ?AUTO_1487 ?AUTO_1490 ) ( AT_SOIL_SAMPLE ?AUTO_1487 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1491 ) ( STORE_OF ?AUTO_1492 ?AUTO_1491 ) ( FULL ?AUTO_1492 ) )
    :subtasks
    ( ( !DROP ?AUTO_1491 ?AUTO_1492 )
      ( GET_SOIL_DATA ?AUTO_1487 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1487 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1493 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1494 - LANDER
      ?AUTO_1495 - WAYPOINT
      ?AUTO_1498 - WAYPOINT
      ?AUTO_1497 - ROVER
      ?AUTO_1496 - STORE
      ?AUTO_1499 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1494 ?AUTO_1495 ) ( VISIBLE ?AUTO_1498 ?AUTO_1495 ) ( AVAILABLE ?AUTO_1497 ) ( CHANNEL_FREE ?AUTO_1494 ) ( not ( = ?AUTO_1493 ?AUTO_1498 ) ) ( not ( = ?AUTO_1493 ?AUTO_1495 ) ) ( not ( = ?AUTO_1498 ?AUTO_1495 ) ) ( CAN_TRAVERSE ?AUTO_1497 ?AUTO_1493 ?AUTO_1498 ) ( VISIBLE ?AUTO_1493 ?AUTO_1498 ) ( AT_SOIL_SAMPLE ?AUTO_1493 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1497 ) ( STORE_OF ?AUTO_1496 ?AUTO_1497 ) ( FULL ?AUTO_1496 ) ( CAN_TRAVERSE ?AUTO_1497 ?AUTO_1499 ?AUTO_1493 ) ( AT ?AUTO_1497 ?AUTO_1499 ) ( VISIBLE ?AUTO_1499 ?AUTO_1493 ) ( not ( = ?AUTO_1493 ?AUTO_1499 ) ) ( not ( = ?AUTO_1495 ?AUTO_1499 ) ) ( not ( = ?AUTO_1498 ?AUTO_1499 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1497 ?AUTO_1499 ?AUTO_1493 )
      ( GET_SOIL_DATA ?AUTO_1493 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1493 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1501 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1503 - LANDER
      ?AUTO_1506 - WAYPOINT
      ?AUTO_1502 - WAYPOINT
      ?AUTO_1507 - ROVER
      ?AUTO_1505 - STORE
      ?AUTO_1504 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1503 ?AUTO_1506 ) ( VISIBLE ?AUTO_1502 ?AUTO_1506 ) ( AVAILABLE ?AUTO_1507 ) ( CHANNEL_FREE ?AUTO_1503 ) ( not ( = ?AUTO_1501 ?AUTO_1502 ) ) ( not ( = ?AUTO_1501 ?AUTO_1506 ) ) ( not ( = ?AUTO_1502 ?AUTO_1506 ) ) ( CAN_TRAVERSE ?AUTO_1507 ?AUTO_1501 ?AUTO_1502 ) ( VISIBLE ?AUTO_1501 ?AUTO_1502 ) ( AT_SOIL_SAMPLE ?AUTO_1501 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1507 ) ( STORE_OF ?AUTO_1505 ?AUTO_1507 ) ( CAN_TRAVERSE ?AUTO_1507 ?AUTO_1504 ?AUTO_1501 ) ( AT ?AUTO_1507 ?AUTO_1504 ) ( VISIBLE ?AUTO_1504 ?AUTO_1501 ) ( not ( = ?AUTO_1501 ?AUTO_1504 ) ) ( not ( = ?AUTO_1506 ?AUTO_1504 ) ) ( not ( = ?AUTO_1502 ?AUTO_1504 ) ) ( AT_ROCK_SAMPLE ?AUTO_1504 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1507 ) ( EMPTY ?AUTO_1505 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1507 ?AUTO_1505 ?AUTO_1504 )
      ( GET_SOIL_DATA ?AUTO_1501 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1501 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1535 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1536 - LANDER
      ?AUTO_1540 - WAYPOINT
      ?AUTO_1538 - WAYPOINT
      ?AUTO_1539 - ROVER
      ?AUTO_1537 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1536 ?AUTO_1540 ) ( VISIBLE ?AUTO_1538 ?AUTO_1540 ) ( AVAILABLE ?AUTO_1539 ) ( CHANNEL_FREE ?AUTO_1536 ) ( not ( = ?AUTO_1535 ?AUTO_1538 ) ) ( not ( = ?AUTO_1535 ?AUTO_1540 ) ) ( not ( = ?AUTO_1538 ?AUTO_1540 ) ) ( CAN_TRAVERSE ?AUTO_1539 ?AUTO_1535 ?AUTO_1538 ) ( AT ?AUTO_1539 ?AUTO_1535 ) ( VISIBLE ?AUTO_1535 ?AUTO_1538 ) ( AT_ROCK_SAMPLE ?AUTO_1535 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1539 ) ( STORE_OF ?AUTO_1537 ?AUTO_1539 ) ( FULL ?AUTO_1537 ) )
    :subtasks
    ( ( !DROP ?AUTO_1539 ?AUTO_1537 )
      ( GET_ROCK_DATA ?AUTO_1535 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1535 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1543 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1548 - LANDER
      ?AUTO_1547 - WAYPOINT
      ?AUTO_1545 - WAYPOINT
      ?AUTO_1546 - ROVER
      ?AUTO_1544 - STORE
      ?AUTO_1549 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1548 ?AUTO_1547 ) ( VISIBLE ?AUTO_1545 ?AUTO_1547 ) ( AVAILABLE ?AUTO_1546 ) ( CHANNEL_FREE ?AUTO_1548 ) ( not ( = ?AUTO_1543 ?AUTO_1545 ) ) ( not ( = ?AUTO_1543 ?AUTO_1547 ) ) ( not ( = ?AUTO_1545 ?AUTO_1547 ) ) ( CAN_TRAVERSE ?AUTO_1546 ?AUTO_1543 ?AUTO_1545 ) ( VISIBLE ?AUTO_1543 ?AUTO_1545 ) ( AT_ROCK_SAMPLE ?AUTO_1543 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1546 ) ( STORE_OF ?AUTO_1544 ?AUTO_1546 ) ( FULL ?AUTO_1544 ) ( CAN_TRAVERSE ?AUTO_1546 ?AUTO_1549 ?AUTO_1543 ) ( AT ?AUTO_1546 ?AUTO_1549 ) ( VISIBLE ?AUTO_1549 ?AUTO_1543 ) ( not ( = ?AUTO_1543 ?AUTO_1549 ) ) ( not ( = ?AUTO_1547 ?AUTO_1549 ) ) ( not ( = ?AUTO_1545 ?AUTO_1549 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1546 ?AUTO_1549 ?AUTO_1543 )
      ( GET_ROCK_DATA ?AUTO_1543 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1543 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1551 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1555 - LANDER
      ?AUTO_1554 - WAYPOINT
      ?AUTO_1552 - WAYPOINT
      ?AUTO_1556 - ROVER
      ?AUTO_1553 - STORE
      ?AUTO_1557 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1555 ?AUTO_1554 ) ( VISIBLE ?AUTO_1552 ?AUTO_1554 ) ( AVAILABLE ?AUTO_1556 ) ( CHANNEL_FREE ?AUTO_1555 ) ( not ( = ?AUTO_1551 ?AUTO_1552 ) ) ( not ( = ?AUTO_1551 ?AUTO_1554 ) ) ( not ( = ?AUTO_1552 ?AUTO_1554 ) ) ( CAN_TRAVERSE ?AUTO_1556 ?AUTO_1551 ?AUTO_1552 ) ( VISIBLE ?AUTO_1551 ?AUTO_1552 ) ( AT_ROCK_SAMPLE ?AUTO_1551 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1556 ) ( STORE_OF ?AUTO_1553 ?AUTO_1556 ) ( CAN_TRAVERSE ?AUTO_1556 ?AUTO_1557 ?AUTO_1551 ) ( AT ?AUTO_1556 ?AUTO_1557 ) ( VISIBLE ?AUTO_1557 ?AUTO_1551 ) ( not ( = ?AUTO_1551 ?AUTO_1557 ) ) ( not ( = ?AUTO_1554 ?AUTO_1557 ) ) ( not ( = ?AUTO_1552 ?AUTO_1557 ) ) ( AT_ROCK_SAMPLE ?AUTO_1557 ) ( EMPTY ?AUTO_1553 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1556 ?AUTO_1553 ?AUTO_1557 )
      ( GET_ROCK_DATA ?AUTO_1551 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1551 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1632 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1633 - LANDER
      ?AUTO_1634 - WAYPOINT
      ?AUTO_1636 - ROVER
      ?AUTO_1635 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1633 ?AUTO_1632 ) ( VISIBLE ?AUTO_1634 ?AUTO_1632 ) ( AVAILABLE ?AUTO_1636 ) ( CHANNEL_FREE ?AUTO_1633 ) ( not ( = ?AUTO_1632 ?AUTO_1634 ) ) ( CAN_TRAVERSE ?AUTO_1636 ?AUTO_1632 ?AUTO_1634 ) ( AT ?AUTO_1636 ?AUTO_1632 ) ( VISIBLE ?AUTO_1632 ?AUTO_1634 ) ( AT_ROCK_SAMPLE ?AUTO_1632 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1636 ) ( STORE_OF ?AUTO_1635 ?AUTO_1636 ) ( FULL ?AUTO_1635 ) )
    :subtasks
    ( ( !DROP ?AUTO_1636 ?AUTO_1635 )
      ( GET_ROCK_DATA ?AUTO_1632 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1632 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1637 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1641 - LANDER
      ?AUTO_1638 - WAYPOINT
      ?AUTO_1639 - ROVER
      ?AUTO_1640 - STORE
      ?AUTO_1642 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1641 ?AUTO_1637 ) ( VISIBLE ?AUTO_1638 ?AUTO_1637 ) ( AVAILABLE ?AUTO_1639 ) ( CHANNEL_FREE ?AUTO_1641 ) ( not ( = ?AUTO_1637 ?AUTO_1638 ) ) ( CAN_TRAVERSE ?AUTO_1639 ?AUTO_1637 ?AUTO_1638 ) ( VISIBLE ?AUTO_1637 ?AUTO_1638 ) ( AT_ROCK_SAMPLE ?AUTO_1637 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1639 ) ( STORE_OF ?AUTO_1640 ?AUTO_1639 ) ( FULL ?AUTO_1640 ) ( CAN_TRAVERSE ?AUTO_1639 ?AUTO_1642 ?AUTO_1637 ) ( AT ?AUTO_1639 ?AUTO_1642 ) ( VISIBLE ?AUTO_1642 ?AUTO_1637 ) ( not ( = ?AUTO_1637 ?AUTO_1642 ) ) ( not ( = ?AUTO_1638 ?AUTO_1642 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1639 ?AUTO_1642 ?AUTO_1637 )
      ( GET_ROCK_DATA ?AUTO_1637 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1637 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1644 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1647 - LANDER
      ?AUTO_1649 - WAYPOINT
      ?AUTO_1646 - ROVER
      ?AUTO_1648 - STORE
      ?AUTO_1645 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1647 ?AUTO_1644 ) ( VISIBLE ?AUTO_1649 ?AUTO_1644 ) ( AVAILABLE ?AUTO_1646 ) ( CHANNEL_FREE ?AUTO_1647 ) ( not ( = ?AUTO_1644 ?AUTO_1649 ) ) ( CAN_TRAVERSE ?AUTO_1646 ?AUTO_1644 ?AUTO_1649 ) ( VISIBLE ?AUTO_1644 ?AUTO_1649 ) ( AT_ROCK_SAMPLE ?AUTO_1644 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1646 ) ( STORE_OF ?AUTO_1648 ?AUTO_1646 ) ( CAN_TRAVERSE ?AUTO_1646 ?AUTO_1645 ?AUTO_1644 ) ( AT ?AUTO_1646 ?AUTO_1645 ) ( VISIBLE ?AUTO_1645 ?AUTO_1644 ) ( not ( = ?AUTO_1644 ?AUTO_1645 ) ) ( not ( = ?AUTO_1649 ?AUTO_1645 ) ) ( AT_ROCK_SAMPLE ?AUTO_1645 ) ( EMPTY ?AUTO_1648 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1646 ?AUTO_1648 ?AUTO_1645 )
      ( GET_ROCK_DATA ?AUTO_1644 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1644 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1700 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1703 - LANDER
      ?AUTO_1701 - WAYPOINT
      ?AUTO_1704 - WAYPOINT
      ?AUTO_1702 - ROVER
      ?AUTO_1705 - STORE
      ?AUTO_1706 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1703 ?AUTO_1701 ) ( VISIBLE ?AUTO_1704 ?AUTO_1701 ) ( AVAILABLE ?AUTO_1702 ) ( CHANNEL_FREE ?AUTO_1703 ) ( not ( = ?AUTO_1700 ?AUTO_1704 ) ) ( not ( = ?AUTO_1700 ?AUTO_1701 ) ) ( not ( = ?AUTO_1704 ?AUTO_1701 ) ) ( CAN_TRAVERSE ?AUTO_1702 ?AUTO_1700 ?AUTO_1704 ) ( VISIBLE ?AUTO_1700 ?AUTO_1704 ) ( AT_SOIL_SAMPLE ?AUTO_1700 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1702 ) ( STORE_OF ?AUTO_1705 ?AUTO_1702 ) ( EMPTY ?AUTO_1705 ) ( CAN_TRAVERSE ?AUTO_1702 ?AUTO_1706 ?AUTO_1700 ) ( AT ?AUTO_1702 ?AUTO_1706 ) ( VISIBLE ?AUTO_1706 ?AUTO_1700 ) ( not ( = ?AUTO_1700 ?AUTO_1706 ) ) ( not ( = ?AUTO_1701 ?AUTO_1706 ) ) ( not ( = ?AUTO_1704 ?AUTO_1706 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1702 ?AUTO_1706 ?AUTO_1700 )
      ( GET_SOIL_DATA ?AUTO_1700 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1700 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1708 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1710 - LANDER
      ?AUTO_1711 - WAYPOINT
      ?AUTO_1713 - WAYPOINT
      ?AUTO_1712 - ROVER
      ?AUTO_1709 - STORE
      ?AUTO_1714 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1710 ?AUTO_1711 ) ( VISIBLE ?AUTO_1713 ?AUTO_1711 ) ( AVAILABLE ?AUTO_1712 ) ( CHANNEL_FREE ?AUTO_1710 ) ( not ( = ?AUTO_1708 ?AUTO_1713 ) ) ( not ( = ?AUTO_1708 ?AUTO_1711 ) ) ( not ( = ?AUTO_1713 ?AUTO_1711 ) ) ( CAN_TRAVERSE ?AUTO_1712 ?AUTO_1708 ?AUTO_1713 ) ( VISIBLE ?AUTO_1708 ?AUTO_1713 ) ( AT_SOIL_SAMPLE ?AUTO_1708 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1712 ) ( STORE_OF ?AUTO_1709 ?AUTO_1712 ) ( EMPTY ?AUTO_1709 ) ( CAN_TRAVERSE ?AUTO_1712 ?AUTO_1714 ?AUTO_1708 ) ( VISIBLE ?AUTO_1714 ?AUTO_1708 ) ( not ( = ?AUTO_1708 ?AUTO_1714 ) ) ( not ( = ?AUTO_1711 ?AUTO_1714 ) ) ( not ( = ?AUTO_1713 ?AUTO_1714 ) ) ( CAN_TRAVERSE ?AUTO_1712 ?AUTO_1711 ?AUTO_1714 ) ( AT ?AUTO_1712 ?AUTO_1711 ) ( VISIBLE ?AUTO_1711 ?AUTO_1714 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1712 ?AUTO_1711 ?AUTO_1714 )
      ( GET_SOIL_DATA ?AUTO_1708 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1708 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1715 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1721 - LANDER
      ?AUTO_1719 - WAYPOINT
      ?AUTO_1720 - WAYPOINT
      ?AUTO_1716 - ROVER
      ?AUTO_1717 - STORE
      ?AUTO_1718 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1721 ?AUTO_1719 ) ( VISIBLE ?AUTO_1720 ?AUTO_1719 ) ( AVAILABLE ?AUTO_1716 ) ( CHANNEL_FREE ?AUTO_1721 ) ( not ( = ?AUTO_1715 ?AUTO_1720 ) ) ( not ( = ?AUTO_1715 ?AUTO_1719 ) ) ( not ( = ?AUTO_1720 ?AUTO_1719 ) ) ( CAN_TRAVERSE ?AUTO_1716 ?AUTO_1715 ?AUTO_1720 ) ( VISIBLE ?AUTO_1715 ?AUTO_1720 ) ( AT_SOIL_SAMPLE ?AUTO_1715 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1716 ) ( STORE_OF ?AUTO_1717 ?AUTO_1716 ) ( CAN_TRAVERSE ?AUTO_1716 ?AUTO_1718 ?AUTO_1715 ) ( VISIBLE ?AUTO_1718 ?AUTO_1715 ) ( not ( = ?AUTO_1715 ?AUTO_1718 ) ) ( not ( = ?AUTO_1719 ?AUTO_1718 ) ) ( not ( = ?AUTO_1720 ?AUTO_1718 ) ) ( CAN_TRAVERSE ?AUTO_1716 ?AUTO_1719 ?AUTO_1718 ) ( AT ?AUTO_1716 ?AUTO_1719 ) ( VISIBLE ?AUTO_1719 ?AUTO_1718 ) ( FULL ?AUTO_1717 ) )
    :subtasks
    ( ( !DROP ?AUTO_1716 ?AUTO_1717 )
      ( GET_SOIL_DATA ?AUTO_1715 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1715 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1724 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1725 - LANDER
      ?AUTO_1726 - WAYPOINT
      ?AUTO_1727 - WAYPOINT
      ?AUTO_1729 - ROVER
      ?AUTO_1728 - STORE
      ?AUTO_1730 - WAYPOINT
      ?AUTO_1731 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1725 ?AUTO_1726 ) ( VISIBLE ?AUTO_1727 ?AUTO_1726 ) ( AVAILABLE ?AUTO_1729 ) ( CHANNEL_FREE ?AUTO_1725 ) ( not ( = ?AUTO_1724 ?AUTO_1727 ) ) ( not ( = ?AUTO_1724 ?AUTO_1726 ) ) ( not ( = ?AUTO_1727 ?AUTO_1726 ) ) ( CAN_TRAVERSE ?AUTO_1729 ?AUTO_1724 ?AUTO_1727 ) ( VISIBLE ?AUTO_1724 ?AUTO_1727 ) ( AT_SOIL_SAMPLE ?AUTO_1724 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1729 ) ( STORE_OF ?AUTO_1728 ?AUTO_1729 ) ( CAN_TRAVERSE ?AUTO_1729 ?AUTO_1730 ?AUTO_1724 ) ( VISIBLE ?AUTO_1730 ?AUTO_1724 ) ( not ( = ?AUTO_1724 ?AUTO_1730 ) ) ( not ( = ?AUTO_1726 ?AUTO_1730 ) ) ( not ( = ?AUTO_1727 ?AUTO_1730 ) ) ( CAN_TRAVERSE ?AUTO_1729 ?AUTO_1726 ?AUTO_1730 ) ( VISIBLE ?AUTO_1726 ?AUTO_1730 ) ( FULL ?AUTO_1728 ) ( CAN_TRAVERSE ?AUTO_1729 ?AUTO_1731 ?AUTO_1726 ) ( AT ?AUTO_1729 ?AUTO_1731 ) ( VISIBLE ?AUTO_1731 ?AUTO_1726 ) ( not ( = ?AUTO_1724 ?AUTO_1731 ) ) ( not ( = ?AUTO_1726 ?AUTO_1731 ) ) ( not ( = ?AUTO_1727 ?AUTO_1731 ) ) ( not ( = ?AUTO_1730 ?AUTO_1731 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1729 ?AUTO_1731 ?AUTO_1726 )
      ( GET_SOIL_DATA ?AUTO_1724 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1724 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1733 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1740 - LANDER
      ?AUTO_1735 - WAYPOINT
      ?AUTO_1736 - WAYPOINT
      ?AUTO_1738 - ROVER
      ?AUTO_1739 - STORE
      ?AUTO_1737 - WAYPOINT
      ?AUTO_1734 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1740 ?AUTO_1735 ) ( VISIBLE ?AUTO_1736 ?AUTO_1735 ) ( AVAILABLE ?AUTO_1738 ) ( CHANNEL_FREE ?AUTO_1740 ) ( not ( = ?AUTO_1733 ?AUTO_1736 ) ) ( not ( = ?AUTO_1733 ?AUTO_1735 ) ) ( not ( = ?AUTO_1736 ?AUTO_1735 ) ) ( CAN_TRAVERSE ?AUTO_1738 ?AUTO_1733 ?AUTO_1736 ) ( VISIBLE ?AUTO_1733 ?AUTO_1736 ) ( AT_SOIL_SAMPLE ?AUTO_1733 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1738 ) ( STORE_OF ?AUTO_1739 ?AUTO_1738 ) ( CAN_TRAVERSE ?AUTO_1738 ?AUTO_1737 ?AUTO_1733 ) ( VISIBLE ?AUTO_1737 ?AUTO_1733 ) ( not ( = ?AUTO_1733 ?AUTO_1737 ) ) ( not ( = ?AUTO_1735 ?AUTO_1737 ) ) ( not ( = ?AUTO_1736 ?AUTO_1737 ) ) ( CAN_TRAVERSE ?AUTO_1738 ?AUTO_1735 ?AUTO_1737 ) ( VISIBLE ?AUTO_1735 ?AUTO_1737 ) ( CAN_TRAVERSE ?AUTO_1738 ?AUTO_1734 ?AUTO_1735 ) ( AT ?AUTO_1738 ?AUTO_1734 ) ( VISIBLE ?AUTO_1734 ?AUTO_1735 ) ( not ( = ?AUTO_1733 ?AUTO_1734 ) ) ( not ( = ?AUTO_1735 ?AUTO_1734 ) ) ( not ( = ?AUTO_1736 ?AUTO_1734 ) ) ( not ( = ?AUTO_1737 ?AUTO_1734 ) ) ( AT_ROCK_SAMPLE ?AUTO_1734 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1738 ) ( EMPTY ?AUTO_1739 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1738 ?AUTO_1739 ?AUTO_1734 )
      ( GET_SOIL_DATA ?AUTO_1733 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1733 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1744 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1745 - LANDER
      ?AUTO_1749 - WAYPOINT
      ?AUTO_1747 - WAYPOINT
      ?AUTO_1748 - ROVER
      ?AUTO_1750 - STORE
      ?AUTO_1746 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1745 ?AUTO_1749 ) ( VISIBLE ?AUTO_1747 ?AUTO_1749 ) ( AVAILABLE ?AUTO_1748 ) ( CHANNEL_FREE ?AUTO_1745 ) ( not ( = ?AUTO_1744 ?AUTO_1747 ) ) ( not ( = ?AUTO_1744 ?AUTO_1749 ) ) ( not ( = ?AUTO_1747 ?AUTO_1749 ) ) ( CAN_TRAVERSE ?AUTO_1748 ?AUTO_1744 ?AUTO_1747 ) ( VISIBLE ?AUTO_1744 ?AUTO_1747 ) ( AT_SOIL_SAMPLE ?AUTO_1744 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1748 ) ( STORE_OF ?AUTO_1750 ?AUTO_1748 ) ( CAN_TRAVERSE ?AUTO_1748 ?AUTO_1746 ?AUTO_1744 ) ( AT ?AUTO_1748 ?AUTO_1746 ) ( VISIBLE ?AUTO_1746 ?AUTO_1744 ) ( not ( = ?AUTO_1744 ?AUTO_1746 ) ) ( not ( = ?AUTO_1749 ?AUTO_1746 ) ) ( not ( = ?AUTO_1747 ?AUTO_1746 ) ) ( FULL ?AUTO_1750 ) )
    :subtasks
    ( ( !DROP ?AUTO_1748 ?AUTO_1750 )
      ( GET_SOIL_DATA ?AUTO_1744 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1744 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1755 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1759 - LANDER
      ?AUTO_1760 - WAYPOINT
      ?AUTO_1761 - WAYPOINT
      ?AUTO_1757 - ROVER
      ?AUTO_1756 - STORE
      ?AUTO_1758 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1759 ?AUTO_1760 ) ( VISIBLE ?AUTO_1761 ?AUTO_1760 ) ( AVAILABLE ?AUTO_1757 ) ( CHANNEL_FREE ?AUTO_1759 ) ( not ( = ?AUTO_1755 ?AUTO_1761 ) ) ( not ( = ?AUTO_1755 ?AUTO_1760 ) ) ( not ( = ?AUTO_1761 ?AUTO_1760 ) ) ( CAN_TRAVERSE ?AUTO_1757 ?AUTO_1755 ?AUTO_1761 ) ( VISIBLE ?AUTO_1755 ?AUTO_1761 ) ( AT_SOIL_SAMPLE ?AUTO_1755 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1757 ) ( STORE_OF ?AUTO_1756 ?AUTO_1757 ) ( CAN_TRAVERSE ?AUTO_1757 ?AUTO_1758 ?AUTO_1755 ) ( VISIBLE ?AUTO_1758 ?AUTO_1755 ) ( not ( = ?AUTO_1755 ?AUTO_1758 ) ) ( not ( = ?AUTO_1760 ?AUTO_1758 ) ) ( not ( = ?AUTO_1761 ?AUTO_1758 ) ) ( FULL ?AUTO_1756 ) ( CAN_TRAVERSE ?AUTO_1757 ?AUTO_1761 ?AUTO_1758 ) ( AT ?AUTO_1757 ?AUTO_1761 ) ( VISIBLE ?AUTO_1761 ?AUTO_1758 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1757 ?AUTO_1761 ?AUTO_1758 )
      ( GET_SOIL_DATA ?AUTO_1755 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1755 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1763 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1766 - LANDER
      ?AUTO_1769 - WAYPOINT
      ?AUTO_1767 - WAYPOINT
      ?AUTO_1768 - ROVER
      ?AUTO_1765 - STORE
      ?AUTO_1764 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1766 ?AUTO_1769 ) ( VISIBLE ?AUTO_1767 ?AUTO_1769 ) ( AVAILABLE ?AUTO_1768 ) ( CHANNEL_FREE ?AUTO_1766 ) ( not ( = ?AUTO_1763 ?AUTO_1767 ) ) ( not ( = ?AUTO_1763 ?AUTO_1769 ) ) ( not ( = ?AUTO_1767 ?AUTO_1769 ) ) ( CAN_TRAVERSE ?AUTO_1768 ?AUTO_1763 ?AUTO_1767 ) ( VISIBLE ?AUTO_1763 ?AUTO_1767 ) ( AT_SOIL_SAMPLE ?AUTO_1763 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1768 ) ( STORE_OF ?AUTO_1765 ?AUTO_1768 ) ( CAN_TRAVERSE ?AUTO_1768 ?AUTO_1764 ?AUTO_1763 ) ( VISIBLE ?AUTO_1764 ?AUTO_1763 ) ( not ( = ?AUTO_1763 ?AUTO_1764 ) ) ( not ( = ?AUTO_1769 ?AUTO_1764 ) ) ( not ( = ?AUTO_1767 ?AUTO_1764 ) ) ( CAN_TRAVERSE ?AUTO_1768 ?AUTO_1767 ?AUTO_1764 ) ( AT ?AUTO_1768 ?AUTO_1767 ) ( VISIBLE ?AUTO_1767 ?AUTO_1764 ) ( AT_ROCK_SAMPLE ?AUTO_1767 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1768 ) ( EMPTY ?AUTO_1765 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1768 ?AUTO_1765 ?AUTO_1767 )
      ( GET_SOIL_DATA ?AUTO_1763 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1763 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1811 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1812 - LANDER
      ?AUTO_1817 - WAYPOINT
      ?AUTO_1814 - WAYPOINT
      ?AUTO_1813 - ROVER
      ?AUTO_1816 - STORE
      ?AUTO_1815 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1812 ?AUTO_1817 ) ( VISIBLE ?AUTO_1814 ?AUTO_1817 ) ( AVAILABLE ?AUTO_1813 ) ( CHANNEL_FREE ?AUTO_1812 ) ( not ( = ?AUTO_1811 ?AUTO_1814 ) ) ( not ( = ?AUTO_1811 ?AUTO_1817 ) ) ( not ( = ?AUTO_1814 ?AUTO_1817 ) ) ( CAN_TRAVERSE ?AUTO_1813 ?AUTO_1811 ?AUTO_1814 ) ( VISIBLE ?AUTO_1811 ?AUTO_1814 ) ( AT_ROCK_SAMPLE ?AUTO_1811 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1813 ) ( STORE_OF ?AUTO_1816 ?AUTO_1813 ) ( EMPTY ?AUTO_1816 ) ( CAN_TRAVERSE ?AUTO_1813 ?AUTO_1815 ?AUTO_1811 ) ( VISIBLE ?AUTO_1815 ?AUTO_1811 ) ( not ( = ?AUTO_1811 ?AUTO_1815 ) ) ( not ( = ?AUTO_1817 ?AUTO_1815 ) ) ( not ( = ?AUTO_1814 ?AUTO_1815 ) ) ( CAN_TRAVERSE ?AUTO_1813 ?AUTO_1817 ?AUTO_1815 ) ( AT ?AUTO_1813 ?AUTO_1817 ) ( VISIBLE ?AUTO_1817 ?AUTO_1815 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1813 ?AUTO_1817 ?AUTO_1815 )
      ( GET_ROCK_DATA ?AUTO_1811 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1811 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1818 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1824 - LANDER
      ?AUTO_1823 - WAYPOINT
      ?AUTO_1821 - WAYPOINT
      ?AUTO_1819 - ROVER
      ?AUTO_1822 - STORE
      ?AUTO_1820 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1824 ?AUTO_1823 ) ( VISIBLE ?AUTO_1821 ?AUTO_1823 ) ( AVAILABLE ?AUTO_1819 ) ( CHANNEL_FREE ?AUTO_1824 ) ( not ( = ?AUTO_1818 ?AUTO_1821 ) ) ( not ( = ?AUTO_1818 ?AUTO_1823 ) ) ( not ( = ?AUTO_1821 ?AUTO_1823 ) ) ( CAN_TRAVERSE ?AUTO_1819 ?AUTO_1818 ?AUTO_1821 ) ( VISIBLE ?AUTO_1818 ?AUTO_1821 ) ( AT_ROCK_SAMPLE ?AUTO_1818 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1819 ) ( STORE_OF ?AUTO_1822 ?AUTO_1819 ) ( CAN_TRAVERSE ?AUTO_1819 ?AUTO_1820 ?AUTO_1818 ) ( VISIBLE ?AUTO_1820 ?AUTO_1818 ) ( not ( = ?AUTO_1818 ?AUTO_1820 ) ) ( not ( = ?AUTO_1823 ?AUTO_1820 ) ) ( not ( = ?AUTO_1821 ?AUTO_1820 ) ) ( CAN_TRAVERSE ?AUTO_1819 ?AUTO_1823 ?AUTO_1820 ) ( AT ?AUTO_1819 ?AUTO_1823 ) ( VISIBLE ?AUTO_1823 ?AUTO_1820 ) ( FULL ?AUTO_1822 ) )
    :subtasks
    ( ( !DROP ?AUTO_1819 ?AUTO_1822 )
      ( GET_ROCK_DATA ?AUTO_1818 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1818 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1827 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1833 - LANDER
      ?AUTO_1830 - WAYPOINT
      ?AUTO_1829 - WAYPOINT
      ?AUTO_1828 - ROVER
      ?AUTO_1831 - STORE
      ?AUTO_1832 - WAYPOINT
      ?AUTO_1834 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1833 ?AUTO_1830 ) ( VISIBLE ?AUTO_1829 ?AUTO_1830 ) ( AVAILABLE ?AUTO_1828 ) ( CHANNEL_FREE ?AUTO_1833 ) ( not ( = ?AUTO_1827 ?AUTO_1829 ) ) ( not ( = ?AUTO_1827 ?AUTO_1830 ) ) ( not ( = ?AUTO_1829 ?AUTO_1830 ) ) ( CAN_TRAVERSE ?AUTO_1828 ?AUTO_1827 ?AUTO_1829 ) ( VISIBLE ?AUTO_1827 ?AUTO_1829 ) ( AT_ROCK_SAMPLE ?AUTO_1827 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1828 ) ( STORE_OF ?AUTO_1831 ?AUTO_1828 ) ( CAN_TRAVERSE ?AUTO_1828 ?AUTO_1832 ?AUTO_1827 ) ( VISIBLE ?AUTO_1832 ?AUTO_1827 ) ( not ( = ?AUTO_1827 ?AUTO_1832 ) ) ( not ( = ?AUTO_1830 ?AUTO_1832 ) ) ( not ( = ?AUTO_1829 ?AUTO_1832 ) ) ( CAN_TRAVERSE ?AUTO_1828 ?AUTO_1830 ?AUTO_1832 ) ( VISIBLE ?AUTO_1830 ?AUTO_1832 ) ( FULL ?AUTO_1831 ) ( CAN_TRAVERSE ?AUTO_1828 ?AUTO_1834 ?AUTO_1830 ) ( AT ?AUTO_1828 ?AUTO_1834 ) ( VISIBLE ?AUTO_1834 ?AUTO_1830 ) ( not ( = ?AUTO_1827 ?AUTO_1834 ) ) ( not ( = ?AUTO_1830 ?AUTO_1834 ) ) ( not ( = ?AUTO_1829 ?AUTO_1834 ) ) ( not ( = ?AUTO_1832 ?AUTO_1834 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1828 ?AUTO_1834 ?AUTO_1830 )
      ( GET_ROCK_DATA ?AUTO_1827 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1827 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1836 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1839 - LANDER
      ?AUTO_1842 - WAYPOINT
      ?AUTO_1841 - WAYPOINT
      ?AUTO_1838 - ROVER
      ?AUTO_1837 - STORE
      ?AUTO_1843 - WAYPOINT
      ?AUTO_1840 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1839 ?AUTO_1842 ) ( VISIBLE ?AUTO_1841 ?AUTO_1842 ) ( AVAILABLE ?AUTO_1838 ) ( CHANNEL_FREE ?AUTO_1839 ) ( not ( = ?AUTO_1836 ?AUTO_1841 ) ) ( not ( = ?AUTO_1836 ?AUTO_1842 ) ) ( not ( = ?AUTO_1841 ?AUTO_1842 ) ) ( CAN_TRAVERSE ?AUTO_1838 ?AUTO_1836 ?AUTO_1841 ) ( VISIBLE ?AUTO_1836 ?AUTO_1841 ) ( AT_ROCK_SAMPLE ?AUTO_1836 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1838 ) ( STORE_OF ?AUTO_1837 ?AUTO_1838 ) ( CAN_TRAVERSE ?AUTO_1838 ?AUTO_1843 ?AUTO_1836 ) ( VISIBLE ?AUTO_1843 ?AUTO_1836 ) ( not ( = ?AUTO_1836 ?AUTO_1843 ) ) ( not ( = ?AUTO_1842 ?AUTO_1843 ) ) ( not ( = ?AUTO_1841 ?AUTO_1843 ) ) ( CAN_TRAVERSE ?AUTO_1838 ?AUTO_1842 ?AUTO_1843 ) ( VISIBLE ?AUTO_1842 ?AUTO_1843 ) ( CAN_TRAVERSE ?AUTO_1838 ?AUTO_1840 ?AUTO_1842 ) ( AT ?AUTO_1838 ?AUTO_1840 ) ( VISIBLE ?AUTO_1840 ?AUTO_1842 ) ( not ( = ?AUTO_1836 ?AUTO_1840 ) ) ( not ( = ?AUTO_1842 ?AUTO_1840 ) ) ( not ( = ?AUTO_1841 ?AUTO_1840 ) ) ( not ( = ?AUTO_1843 ?AUTO_1840 ) ) ( AT_ROCK_SAMPLE ?AUTO_1840 ) ( EMPTY ?AUTO_1837 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1838 ?AUTO_1837 ?AUTO_1840 )
      ( GET_ROCK_DATA ?AUTO_1836 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1836 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1847 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1852 - LANDER
      ?AUTO_1850 - WAYPOINT
      ?AUTO_1848 - WAYPOINT
      ?AUTO_1853 - ROVER
      ?AUTO_1851 - STORE
      ?AUTO_1849 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1852 ?AUTO_1850 ) ( VISIBLE ?AUTO_1848 ?AUTO_1850 ) ( AVAILABLE ?AUTO_1853 ) ( CHANNEL_FREE ?AUTO_1852 ) ( not ( = ?AUTO_1847 ?AUTO_1848 ) ) ( not ( = ?AUTO_1847 ?AUTO_1850 ) ) ( not ( = ?AUTO_1848 ?AUTO_1850 ) ) ( CAN_TRAVERSE ?AUTO_1853 ?AUTO_1847 ?AUTO_1848 ) ( VISIBLE ?AUTO_1847 ?AUTO_1848 ) ( AT_ROCK_SAMPLE ?AUTO_1847 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1853 ) ( STORE_OF ?AUTO_1851 ?AUTO_1853 ) ( CAN_TRAVERSE ?AUTO_1853 ?AUTO_1849 ?AUTO_1847 ) ( AT ?AUTO_1853 ?AUTO_1849 ) ( VISIBLE ?AUTO_1849 ?AUTO_1847 ) ( not ( = ?AUTO_1847 ?AUTO_1849 ) ) ( not ( = ?AUTO_1850 ?AUTO_1849 ) ) ( not ( = ?AUTO_1848 ?AUTO_1849 ) ) ( FULL ?AUTO_1851 ) )
    :subtasks
    ( ( !DROP ?AUTO_1853 ?AUTO_1851 )
      ( GET_ROCK_DATA ?AUTO_1847 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1847 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1858 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1861 - LANDER
      ?AUTO_1863 - WAYPOINT
      ?AUTO_1864 - WAYPOINT
      ?AUTO_1860 - ROVER
      ?AUTO_1862 - STORE
      ?AUTO_1859 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1861 ?AUTO_1863 ) ( VISIBLE ?AUTO_1864 ?AUTO_1863 ) ( AVAILABLE ?AUTO_1860 ) ( CHANNEL_FREE ?AUTO_1861 ) ( not ( = ?AUTO_1858 ?AUTO_1864 ) ) ( not ( = ?AUTO_1858 ?AUTO_1863 ) ) ( not ( = ?AUTO_1864 ?AUTO_1863 ) ) ( CAN_TRAVERSE ?AUTO_1860 ?AUTO_1858 ?AUTO_1864 ) ( VISIBLE ?AUTO_1858 ?AUTO_1864 ) ( AT_ROCK_SAMPLE ?AUTO_1858 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1860 ) ( STORE_OF ?AUTO_1862 ?AUTO_1860 ) ( CAN_TRAVERSE ?AUTO_1860 ?AUTO_1859 ?AUTO_1858 ) ( VISIBLE ?AUTO_1859 ?AUTO_1858 ) ( not ( = ?AUTO_1858 ?AUTO_1859 ) ) ( not ( = ?AUTO_1863 ?AUTO_1859 ) ) ( not ( = ?AUTO_1864 ?AUTO_1859 ) ) ( FULL ?AUTO_1862 ) ( CAN_TRAVERSE ?AUTO_1860 ?AUTO_1864 ?AUTO_1859 ) ( AT ?AUTO_1860 ?AUTO_1864 ) ( VISIBLE ?AUTO_1864 ?AUTO_1859 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1860 ?AUTO_1864 ?AUTO_1859 )
      ( GET_ROCK_DATA ?AUTO_1858 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1858 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1866 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1869 - LANDER
      ?AUTO_1871 - WAYPOINT
      ?AUTO_1868 - WAYPOINT
      ?AUTO_1870 - ROVER
      ?AUTO_1867 - STORE
      ?AUTO_1872 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1869 ?AUTO_1871 ) ( VISIBLE ?AUTO_1868 ?AUTO_1871 ) ( AVAILABLE ?AUTO_1870 ) ( CHANNEL_FREE ?AUTO_1869 ) ( not ( = ?AUTO_1866 ?AUTO_1868 ) ) ( not ( = ?AUTO_1866 ?AUTO_1871 ) ) ( not ( = ?AUTO_1868 ?AUTO_1871 ) ) ( CAN_TRAVERSE ?AUTO_1870 ?AUTO_1866 ?AUTO_1868 ) ( VISIBLE ?AUTO_1866 ?AUTO_1868 ) ( AT_ROCK_SAMPLE ?AUTO_1866 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1870 ) ( STORE_OF ?AUTO_1867 ?AUTO_1870 ) ( CAN_TRAVERSE ?AUTO_1870 ?AUTO_1872 ?AUTO_1866 ) ( VISIBLE ?AUTO_1872 ?AUTO_1866 ) ( not ( = ?AUTO_1866 ?AUTO_1872 ) ) ( not ( = ?AUTO_1871 ?AUTO_1872 ) ) ( not ( = ?AUTO_1868 ?AUTO_1872 ) ) ( CAN_TRAVERSE ?AUTO_1870 ?AUTO_1868 ?AUTO_1872 ) ( AT ?AUTO_1870 ?AUTO_1868 ) ( VISIBLE ?AUTO_1868 ?AUTO_1872 ) ( AT_ROCK_SAMPLE ?AUTO_1868 ) ( EMPTY ?AUTO_1867 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1870 ?AUTO_1867 ?AUTO_1868 )
      ( GET_ROCK_DATA ?AUTO_1866 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1866 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1898 - OBJECTIVE
      ?AUTO_1899 - MODE
    )
    :vars
    (
      ?AUTO_1902 - LANDER
      ?AUTO_1901 - WAYPOINT
      ?AUTO_1903 - WAYPOINT
      ?AUTO_1904 - ROVER
      ?AUTO_1900 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1902 ?AUTO_1901 ) ( VISIBLE ?AUTO_1903 ?AUTO_1901 ) ( AVAILABLE ?AUTO_1904 ) ( CHANNEL_FREE ?AUTO_1902 ) ( not ( = ?AUTO_1903 ?AUTO_1901 ) ) ( CALIBRATED ?AUTO_1900 ?AUTO_1904 ) ( ON_BOARD ?AUTO_1900 ?AUTO_1904 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1904 ) ( SUPPORTS ?AUTO_1900 ?AUTO_1899 ) ( VISIBLE_FROM ?AUTO_1898 ?AUTO_1903 ) ( CAN_TRAVERSE ?AUTO_1904 ?AUTO_1901 ?AUTO_1903 ) ( AT ?AUTO_1904 ?AUTO_1901 ) ( VISIBLE ?AUTO_1901 ?AUTO_1903 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1904 ?AUTO_1901 ?AUTO_1903 )
      ( GET_IMAGE_DATA ?AUTO_1898 ?AUTO_1899 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1898 ?AUTO_1899 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1905 - OBJECTIVE
      ?AUTO_1906 - MODE
    )
    :vars
    (
      ?AUTO_1910 - LANDER
      ?AUTO_1909 - WAYPOINT
      ?AUTO_1908 - WAYPOINT
      ?AUTO_1911 - ROVER
      ?AUTO_1907 - CAMERA
      ?AUTO_1912 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1910 ?AUTO_1909 ) ( VISIBLE ?AUTO_1908 ?AUTO_1909 ) ( AVAILABLE ?AUTO_1911 ) ( CHANNEL_FREE ?AUTO_1910 ) ( not ( = ?AUTO_1908 ?AUTO_1909 ) ) ( CALIBRATED ?AUTO_1907 ?AUTO_1911 ) ( ON_BOARD ?AUTO_1907 ?AUTO_1911 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1911 ) ( SUPPORTS ?AUTO_1907 ?AUTO_1906 ) ( VISIBLE_FROM ?AUTO_1905 ?AUTO_1908 ) ( CAN_TRAVERSE ?AUTO_1911 ?AUTO_1909 ?AUTO_1908 ) ( VISIBLE ?AUTO_1909 ?AUTO_1908 ) ( CAN_TRAVERSE ?AUTO_1911 ?AUTO_1912 ?AUTO_1909 ) ( AT ?AUTO_1911 ?AUTO_1912 ) ( VISIBLE ?AUTO_1912 ?AUTO_1909 ) ( not ( = ?AUTO_1909 ?AUTO_1912 ) ) ( not ( = ?AUTO_1908 ?AUTO_1912 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1911 ?AUTO_1912 ?AUTO_1909 )
      ( GET_IMAGE_DATA ?AUTO_1905 ?AUTO_1906 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1905 ?AUTO_1906 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1913 - OBJECTIVE
      ?AUTO_1914 - MODE
    )
    :vars
    (
      ?AUTO_1918 - LANDER
      ?AUTO_1920 - WAYPOINT
      ?AUTO_1916 - WAYPOINT
      ?AUTO_1915 - ROVER
      ?AUTO_1917 - CAMERA
      ?AUTO_1919 - WAYPOINT
      ?AUTO_1921 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1918 ?AUTO_1920 ) ( VISIBLE ?AUTO_1916 ?AUTO_1920 ) ( AVAILABLE ?AUTO_1915 ) ( CHANNEL_FREE ?AUTO_1918 ) ( not ( = ?AUTO_1916 ?AUTO_1920 ) ) ( ON_BOARD ?AUTO_1917 ?AUTO_1915 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1915 ) ( SUPPORTS ?AUTO_1917 ?AUTO_1914 ) ( VISIBLE_FROM ?AUTO_1913 ?AUTO_1916 ) ( CAN_TRAVERSE ?AUTO_1915 ?AUTO_1920 ?AUTO_1916 ) ( VISIBLE ?AUTO_1920 ?AUTO_1916 ) ( CAN_TRAVERSE ?AUTO_1915 ?AUTO_1919 ?AUTO_1920 ) ( AT ?AUTO_1915 ?AUTO_1919 ) ( VISIBLE ?AUTO_1919 ?AUTO_1920 ) ( not ( = ?AUTO_1920 ?AUTO_1919 ) ) ( not ( = ?AUTO_1916 ?AUTO_1919 ) ) ( CALIBRATION_TARGET ?AUTO_1917 ?AUTO_1921 ) ( VISIBLE_FROM ?AUTO_1921 ?AUTO_1919 ) ( not ( = ?AUTO_1913 ?AUTO_1921 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1915 ?AUTO_1917 ?AUTO_1921 ?AUTO_1919 )
      ( GET_IMAGE_DATA ?AUTO_1913 ?AUTO_1914 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1913 ?AUTO_1914 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1922 - OBJECTIVE
      ?AUTO_1923 - MODE
    )
    :vars
    (
      ?AUTO_1925 - LANDER
      ?AUTO_1924 - WAYPOINT
      ?AUTO_1926 - WAYPOINT
      ?AUTO_1929 - ROVER
      ?AUTO_1927 - CAMERA
      ?AUTO_1928 - WAYPOINT
      ?AUTO_1930 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1925 ?AUTO_1924 ) ( VISIBLE ?AUTO_1926 ?AUTO_1924 ) ( AVAILABLE ?AUTO_1929 ) ( CHANNEL_FREE ?AUTO_1925 ) ( not ( = ?AUTO_1926 ?AUTO_1924 ) ) ( ON_BOARD ?AUTO_1927 ?AUTO_1929 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1929 ) ( SUPPORTS ?AUTO_1927 ?AUTO_1923 ) ( VISIBLE_FROM ?AUTO_1922 ?AUTO_1926 ) ( CAN_TRAVERSE ?AUTO_1929 ?AUTO_1924 ?AUTO_1926 ) ( VISIBLE ?AUTO_1924 ?AUTO_1926 ) ( CAN_TRAVERSE ?AUTO_1929 ?AUTO_1928 ?AUTO_1924 ) ( VISIBLE ?AUTO_1928 ?AUTO_1924 ) ( not ( = ?AUTO_1924 ?AUTO_1928 ) ) ( not ( = ?AUTO_1926 ?AUTO_1928 ) ) ( CALIBRATION_TARGET ?AUTO_1927 ?AUTO_1930 ) ( VISIBLE_FROM ?AUTO_1930 ?AUTO_1928 ) ( not ( = ?AUTO_1922 ?AUTO_1930 ) ) ( CAN_TRAVERSE ?AUTO_1929 ?AUTO_1924 ?AUTO_1928 ) ( AT ?AUTO_1929 ?AUTO_1924 ) ( VISIBLE ?AUTO_1924 ?AUTO_1928 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1929 ?AUTO_1924 ?AUTO_1928 )
      ( GET_IMAGE_DATA ?AUTO_1922 ?AUTO_1923 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1922 ?AUTO_1923 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1945 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1948 - LANDER
      ?AUTO_1947 - WAYPOINT
      ?AUTO_1946 - ROVER
      ?AUTO_1949 - WAYPOINT
      ?AUTO_1950 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1948 ?AUTO_1947 ) ( HAVE_SOIL_ANALYSIS ?AUTO_1946 ?AUTO_1945 ) ( VISIBLE ?AUTO_1949 ?AUTO_1947 ) ( AVAILABLE ?AUTO_1946 ) ( CHANNEL_FREE ?AUTO_1948 ) ( not ( = ?AUTO_1945 ?AUTO_1949 ) ) ( not ( = ?AUTO_1945 ?AUTO_1947 ) ) ( not ( = ?AUTO_1949 ?AUTO_1947 ) ) ( CAN_TRAVERSE ?AUTO_1946 ?AUTO_1950 ?AUTO_1949 ) ( AT ?AUTO_1946 ?AUTO_1950 ) ( VISIBLE ?AUTO_1950 ?AUTO_1949 ) ( not ( = ?AUTO_1945 ?AUTO_1950 ) ) ( not ( = ?AUTO_1947 ?AUTO_1950 ) ) ( not ( = ?AUTO_1949 ?AUTO_1950 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1946 ?AUTO_1950 ?AUTO_1949 )
      ( GET_SOIL_DATA ?AUTO_1945 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1945 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1951 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1956 - LANDER
      ?AUTO_1954 - WAYPOINT
      ?AUTO_1952 - ROVER
      ?AUTO_1955 - WAYPOINT
      ?AUTO_1953 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1956 ?AUTO_1954 ) ( HAVE_SOIL_ANALYSIS ?AUTO_1952 ?AUTO_1951 ) ( VISIBLE ?AUTO_1955 ?AUTO_1954 ) ( AVAILABLE ?AUTO_1952 ) ( CHANNEL_FREE ?AUTO_1956 ) ( not ( = ?AUTO_1951 ?AUTO_1955 ) ) ( not ( = ?AUTO_1951 ?AUTO_1954 ) ) ( not ( = ?AUTO_1955 ?AUTO_1954 ) ) ( CAN_TRAVERSE ?AUTO_1952 ?AUTO_1953 ?AUTO_1955 ) ( VISIBLE ?AUTO_1953 ?AUTO_1955 ) ( not ( = ?AUTO_1951 ?AUTO_1953 ) ) ( not ( = ?AUTO_1954 ?AUTO_1953 ) ) ( not ( = ?AUTO_1955 ?AUTO_1953 ) ) ( CAN_TRAVERSE ?AUTO_1952 ?AUTO_1951 ?AUTO_1953 ) ( AT ?AUTO_1952 ?AUTO_1951 ) ( VISIBLE ?AUTO_1951 ?AUTO_1953 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1952 ?AUTO_1951 ?AUTO_1953 )
      ( GET_SOIL_DATA ?AUTO_1951 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1951 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1957 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1960 - LANDER
      ?AUTO_1962 - WAYPOINT
      ?AUTO_1961 - WAYPOINT
      ?AUTO_1958 - ROVER
      ?AUTO_1959 - WAYPOINT
      ?AUTO_1963 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1960 ?AUTO_1962 ) ( VISIBLE ?AUTO_1961 ?AUTO_1962 ) ( AVAILABLE ?AUTO_1958 ) ( CHANNEL_FREE ?AUTO_1960 ) ( not ( = ?AUTO_1957 ?AUTO_1961 ) ) ( not ( = ?AUTO_1957 ?AUTO_1962 ) ) ( not ( = ?AUTO_1961 ?AUTO_1962 ) ) ( CAN_TRAVERSE ?AUTO_1958 ?AUTO_1959 ?AUTO_1961 ) ( VISIBLE ?AUTO_1959 ?AUTO_1961 ) ( not ( = ?AUTO_1957 ?AUTO_1959 ) ) ( not ( = ?AUTO_1962 ?AUTO_1959 ) ) ( not ( = ?AUTO_1961 ?AUTO_1959 ) ) ( CAN_TRAVERSE ?AUTO_1958 ?AUTO_1957 ?AUTO_1959 ) ( AT ?AUTO_1958 ?AUTO_1957 ) ( VISIBLE ?AUTO_1957 ?AUTO_1959 ) ( AT_SOIL_SAMPLE ?AUTO_1957 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1958 ) ( STORE_OF ?AUTO_1963 ?AUTO_1958 ) ( EMPTY ?AUTO_1963 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1958 ?AUTO_1963 ?AUTO_1957 )
      ( GET_SOIL_DATA ?AUTO_1957 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1957 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1970 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1973 - LANDER
      ?AUTO_1974 - WAYPOINT
      ?AUTO_1976 - WAYPOINT
      ?AUTO_1971 - ROVER
      ?AUTO_1975 - WAYPOINT
      ?AUTO_1972 - STORE
      ?AUTO_1977 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1973 ?AUTO_1974 ) ( VISIBLE ?AUTO_1976 ?AUTO_1974 ) ( AVAILABLE ?AUTO_1971 ) ( CHANNEL_FREE ?AUTO_1973 ) ( not ( = ?AUTO_1970 ?AUTO_1976 ) ) ( not ( = ?AUTO_1970 ?AUTO_1974 ) ) ( not ( = ?AUTO_1976 ?AUTO_1974 ) ) ( CAN_TRAVERSE ?AUTO_1971 ?AUTO_1975 ?AUTO_1976 ) ( VISIBLE ?AUTO_1975 ?AUTO_1976 ) ( not ( = ?AUTO_1970 ?AUTO_1975 ) ) ( not ( = ?AUTO_1974 ?AUTO_1975 ) ) ( not ( = ?AUTO_1976 ?AUTO_1975 ) ) ( CAN_TRAVERSE ?AUTO_1971 ?AUTO_1970 ?AUTO_1975 ) ( VISIBLE ?AUTO_1970 ?AUTO_1975 ) ( AT_SOIL_SAMPLE ?AUTO_1970 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1971 ) ( STORE_OF ?AUTO_1972 ?AUTO_1971 ) ( EMPTY ?AUTO_1972 ) ( CAN_TRAVERSE ?AUTO_1971 ?AUTO_1977 ?AUTO_1970 ) ( AT ?AUTO_1971 ?AUTO_1977 ) ( VISIBLE ?AUTO_1977 ?AUTO_1970 ) ( not ( = ?AUTO_1970 ?AUTO_1977 ) ) ( not ( = ?AUTO_1974 ?AUTO_1977 ) ) ( not ( = ?AUTO_1976 ?AUTO_1977 ) ) ( not ( = ?AUTO_1975 ?AUTO_1977 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1971 ?AUTO_1977 ?AUTO_1970 )
      ( GET_SOIL_DATA ?AUTO_1970 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1970 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1978 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1985 - LANDER
      ?AUTO_1984 - WAYPOINT
      ?AUTO_1982 - WAYPOINT
      ?AUTO_1980 - ROVER
      ?AUTO_1983 - WAYPOINT
      ?AUTO_1981 - STORE
      ?AUTO_1979 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1985 ?AUTO_1984 ) ( VISIBLE ?AUTO_1982 ?AUTO_1984 ) ( AVAILABLE ?AUTO_1980 ) ( CHANNEL_FREE ?AUTO_1985 ) ( not ( = ?AUTO_1978 ?AUTO_1982 ) ) ( not ( = ?AUTO_1978 ?AUTO_1984 ) ) ( not ( = ?AUTO_1982 ?AUTO_1984 ) ) ( CAN_TRAVERSE ?AUTO_1980 ?AUTO_1983 ?AUTO_1982 ) ( VISIBLE ?AUTO_1983 ?AUTO_1982 ) ( not ( = ?AUTO_1978 ?AUTO_1983 ) ) ( not ( = ?AUTO_1984 ?AUTO_1983 ) ) ( not ( = ?AUTO_1982 ?AUTO_1983 ) ) ( CAN_TRAVERSE ?AUTO_1980 ?AUTO_1978 ?AUTO_1983 ) ( VISIBLE ?AUTO_1978 ?AUTO_1983 ) ( AT_SOIL_SAMPLE ?AUTO_1978 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1980 ) ( STORE_OF ?AUTO_1981 ?AUTO_1980 ) ( CAN_TRAVERSE ?AUTO_1980 ?AUTO_1979 ?AUTO_1978 ) ( AT ?AUTO_1980 ?AUTO_1979 ) ( VISIBLE ?AUTO_1979 ?AUTO_1978 ) ( not ( = ?AUTO_1978 ?AUTO_1979 ) ) ( not ( = ?AUTO_1984 ?AUTO_1979 ) ) ( not ( = ?AUTO_1982 ?AUTO_1979 ) ) ( not ( = ?AUTO_1983 ?AUTO_1979 ) ) ( FULL ?AUTO_1981 ) )
    :subtasks
    ( ( !DROP ?AUTO_1980 ?AUTO_1981 )
      ( GET_SOIL_DATA ?AUTO_1978 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1978 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2008 - OBJECTIVE
      ?AUTO_2009 - MODE
    )
    :vars
    (
      ?AUTO_2013 - LANDER
      ?AUTO_2011 - WAYPOINT
      ?AUTO_2012 - WAYPOINT
      ?AUTO_2010 - ROVER
      ?AUTO_2014 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2013 ?AUTO_2011 ) ( VISIBLE ?AUTO_2012 ?AUTO_2011 ) ( AVAILABLE ?AUTO_2010 ) ( CHANNEL_FREE ?AUTO_2013 ) ( not ( = ?AUTO_2012 ?AUTO_2011 ) ) ( ON_BOARD ?AUTO_2014 ?AUTO_2010 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2010 ) ( SUPPORTS ?AUTO_2014 ?AUTO_2009 ) ( VISIBLE_FROM ?AUTO_2008 ?AUTO_2012 ) ( CALIBRATION_TARGET ?AUTO_2014 ?AUTO_2008 ) ( CAN_TRAVERSE ?AUTO_2010 ?AUTO_2011 ?AUTO_2012 ) ( AT ?AUTO_2010 ?AUTO_2011 ) ( VISIBLE ?AUTO_2011 ?AUTO_2012 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2010 ?AUTO_2011 ?AUTO_2012 )
      ( GET_IMAGE_DATA ?AUTO_2008 ?AUTO_2009 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2008 ?AUTO_2009 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2047 - OBJECTIVE
      ?AUTO_2048 - MODE
    )
    :vars
    (
      ?AUTO_2052 - LANDER
      ?AUTO_2049 - WAYPOINT
      ?AUTO_2051 - WAYPOINT
      ?AUTO_2053 - ROVER
      ?AUTO_2050 - CAMERA
      ?AUTO_2054 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2052 ?AUTO_2049 ) ( VISIBLE ?AUTO_2051 ?AUTO_2049 ) ( AVAILABLE ?AUTO_2053 ) ( CHANNEL_FREE ?AUTO_2052 ) ( not ( = ?AUTO_2051 ?AUTO_2049 ) ) ( ON_BOARD ?AUTO_2050 ?AUTO_2053 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2053 ) ( SUPPORTS ?AUTO_2050 ?AUTO_2048 ) ( VISIBLE_FROM ?AUTO_2047 ?AUTO_2051 ) ( CAN_TRAVERSE ?AUTO_2053 ?AUTO_2049 ?AUTO_2051 ) ( AT ?AUTO_2053 ?AUTO_2049 ) ( VISIBLE ?AUTO_2049 ?AUTO_2051 ) ( CALIBRATION_TARGET ?AUTO_2050 ?AUTO_2054 ) ( VISIBLE_FROM ?AUTO_2054 ?AUTO_2049 ) ( not ( = ?AUTO_2047 ?AUTO_2054 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2053 ?AUTO_2050 ?AUTO_2054 ?AUTO_2049 )
      ( GET_IMAGE_DATA ?AUTO_2047 ?AUTO_2048 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2047 ?AUTO_2048 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2055 - OBJECTIVE
      ?AUTO_2056 - MODE
    )
    :vars
    (
      ?AUTO_2060 - LANDER
      ?AUTO_2061 - WAYPOINT
      ?AUTO_2059 - WAYPOINT
      ?AUTO_2058 - ROVER
      ?AUTO_2057 - CAMERA
      ?AUTO_2062 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2060 ?AUTO_2061 ) ( VISIBLE ?AUTO_2059 ?AUTO_2061 ) ( AVAILABLE ?AUTO_2058 ) ( CHANNEL_FREE ?AUTO_2060 ) ( not ( = ?AUTO_2059 ?AUTO_2061 ) ) ( ON_BOARD ?AUTO_2057 ?AUTO_2058 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2058 ) ( SUPPORTS ?AUTO_2057 ?AUTO_2056 ) ( VISIBLE_FROM ?AUTO_2055 ?AUTO_2059 ) ( CAN_TRAVERSE ?AUTO_2058 ?AUTO_2061 ?AUTO_2059 ) ( VISIBLE ?AUTO_2061 ?AUTO_2059 ) ( CALIBRATION_TARGET ?AUTO_2057 ?AUTO_2062 ) ( VISIBLE_FROM ?AUTO_2062 ?AUTO_2061 ) ( not ( = ?AUTO_2055 ?AUTO_2062 ) ) ( CAN_TRAVERSE ?AUTO_2058 ?AUTO_2059 ?AUTO_2061 ) ( AT ?AUTO_2058 ?AUTO_2059 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2058 ?AUTO_2059 ?AUTO_2061 )
      ( GET_IMAGE_DATA ?AUTO_2055 ?AUTO_2056 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2055 ?AUTO_2056 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2104 - OBJECTIVE
      ?AUTO_2105 - MODE
    )
    :vars
    (
      ?AUTO_2109 - LANDER
      ?AUTO_2106 - WAYPOINT
      ?AUTO_2107 - WAYPOINT
      ?AUTO_2108 - ROVER
      ?AUTO_2111 - CAMERA
      ?AUTO_2112 - WAYPOINT
      ?AUTO_2110 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2109 ?AUTO_2106 ) ( VISIBLE ?AUTO_2107 ?AUTO_2106 ) ( AVAILABLE ?AUTO_2108 ) ( CHANNEL_FREE ?AUTO_2109 ) ( not ( = ?AUTO_2107 ?AUTO_2106 ) ) ( ON_BOARD ?AUTO_2111 ?AUTO_2108 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2108 ) ( SUPPORTS ?AUTO_2111 ?AUTO_2105 ) ( VISIBLE_FROM ?AUTO_2104 ?AUTO_2107 ) ( CAN_TRAVERSE ?AUTO_2108 ?AUTO_2112 ?AUTO_2107 ) ( VISIBLE ?AUTO_2112 ?AUTO_2107 ) ( not ( = ?AUTO_2106 ?AUTO_2112 ) ) ( not ( = ?AUTO_2107 ?AUTO_2112 ) ) ( CALIBRATION_TARGET ?AUTO_2111 ?AUTO_2110 ) ( VISIBLE_FROM ?AUTO_2110 ?AUTO_2112 ) ( not ( = ?AUTO_2104 ?AUTO_2110 ) ) ( CAN_TRAVERSE ?AUTO_2108 ?AUTO_2107 ?AUTO_2112 ) ( VISIBLE ?AUTO_2107 ?AUTO_2112 ) ( CAN_TRAVERSE ?AUTO_2108 ?AUTO_2106 ?AUTO_2107 ) ( AT ?AUTO_2108 ?AUTO_2106 ) ( VISIBLE ?AUTO_2106 ?AUTO_2107 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2108 ?AUTO_2106 ?AUTO_2107 )
      ( GET_IMAGE_DATA ?AUTO_2104 ?AUTO_2105 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2104 ?AUTO_2105 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2134 - OBJECTIVE
      ?AUTO_2135 - MODE
    )
    :vars
    (
      ?AUTO_2137 - LANDER
      ?AUTO_2139 - WAYPOINT
      ?AUTO_2136 - WAYPOINT
      ?AUTO_2138 - ROVER
      ?AUTO_2140 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2137 ?AUTO_2139 ) ( VISIBLE ?AUTO_2136 ?AUTO_2139 ) ( AVAILABLE ?AUTO_2138 ) ( CHANNEL_FREE ?AUTO_2137 ) ( not ( = ?AUTO_2136 ?AUTO_2139 ) ) ( CAN_TRAVERSE ?AUTO_2138 ?AUTO_2139 ?AUTO_2136 ) ( AT ?AUTO_2138 ?AUTO_2139 ) ( VISIBLE ?AUTO_2139 ?AUTO_2136 ) ( ON_BOARD ?AUTO_2140 ?AUTO_2138 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2138 ) ( SUPPORTS ?AUTO_2140 ?AUTO_2135 ) ( VISIBLE_FROM ?AUTO_2134 ?AUTO_2139 ) ( CALIBRATION_TARGET ?AUTO_2140 ?AUTO_2134 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2138 ?AUTO_2140 ?AUTO_2134 ?AUTO_2139 )
      ( GET_IMAGE_DATA ?AUTO_2134 ?AUTO_2135 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2134 ?AUTO_2135 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2141 - OBJECTIVE
      ?AUTO_2142 - MODE
    )
    :vars
    (
      ?AUTO_2144 - LANDER
      ?AUTO_2143 - WAYPOINT
      ?AUTO_2145 - WAYPOINT
      ?AUTO_2147 - ROVER
      ?AUTO_2146 - CAMERA
      ?AUTO_2148 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2144 ?AUTO_2143 ) ( VISIBLE ?AUTO_2145 ?AUTO_2143 ) ( AVAILABLE ?AUTO_2147 ) ( CHANNEL_FREE ?AUTO_2144 ) ( not ( = ?AUTO_2145 ?AUTO_2143 ) ) ( CAN_TRAVERSE ?AUTO_2147 ?AUTO_2143 ?AUTO_2145 ) ( VISIBLE ?AUTO_2143 ?AUTO_2145 ) ( ON_BOARD ?AUTO_2146 ?AUTO_2147 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2147 ) ( SUPPORTS ?AUTO_2146 ?AUTO_2142 ) ( VISIBLE_FROM ?AUTO_2141 ?AUTO_2143 ) ( CALIBRATION_TARGET ?AUTO_2146 ?AUTO_2141 ) ( CAN_TRAVERSE ?AUTO_2147 ?AUTO_2148 ?AUTO_2143 ) ( AT ?AUTO_2147 ?AUTO_2148 ) ( VISIBLE ?AUTO_2148 ?AUTO_2143 ) ( not ( = ?AUTO_2143 ?AUTO_2148 ) ) ( not ( = ?AUTO_2145 ?AUTO_2148 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2147 ?AUTO_2148 ?AUTO_2143 )
      ( GET_IMAGE_DATA ?AUTO_2141 ?AUTO_2142 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2141 ?AUTO_2142 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2260 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2262 - LANDER
      ?AUTO_2261 - WAYPOINT
      ?AUTO_2263 - ROVER
      ?AUTO_2264 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2262 ?AUTO_2260 ) ( VISIBLE ?AUTO_2261 ?AUTO_2260 ) ( AVAILABLE ?AUTO_2263 ) ( CHANNEL_FREE ?AUTO_2262 ) ( not ( = ?AUTO_2260 ?AUTO_2261 ) ) ( CAN_TRAVERSE ?AUTO_2263 ?AUTO_2260 ?AUTO_2261 ) ( AT ?AUTO_2263 ?AUTO_2260 ) ( VISIBLE ?AUTO_2260 ?AUTO_2261 ) ( AT_SOIL_SAMPLE ?AUTO_2260 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2263 ) ( STORE_OF ?AUTO_2264 ?AUTO_2263 ) ( FULL ?AUTO_2264 ) )
    :subtasks
    ( ( !DROP ?AUTO_2263 ?AUTO_2264 )
      ( GET_SOIL_DATA ?AUTO_2260 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2260 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2265 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2267 - LANDER
      ?AUTO_2268 - WAYPOINT
      ?AUTO_2269 - ROVER
      ?AUTO_2266 - STORE
      ?AUTO_2270 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2267 ?AUTO_2265 ) ( VISIBLE ?AUTO_2268 ?AUTO_2265 ) ( AVAILABLE ?AUTO_2269 ) ( CHANNEL_FREE ?AUTO_2267 ) ( not ( = ?AUTO_2265 ?AUTO_2268 ) ) ( CAN_TRAVERSE ?AUTO_2269 ?AUTO_2265 ?AUTO_2268 ) ( VISIBLE ?AUTO_2265 ?AUTO_2268 ) ( AT_SOIL_SAMPLE ?AUTO_2265 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2269 ) ( STORE_OF ?AUTO_2266 ?AUTO_2269 ) ( FULL ?AUTO_2266 ) ( CAN_TRAVERSE ?AUTO_2269 ?AUTO_2270 ?AUTO_2265 ) ( AT ?AUTO_2269 ?AUTO_2270 ) ( VISIBLE ?AUTO_2270 ?AUTO_2265 ) ( not ( = ?AUTO_2265 ?AUTO_2270 ) ) ( not ( = ?AUTO_2268 ?AUTO_2270 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2269 ?AUTO_2270 ?AUTO_2265 )
      ( GET_SOIL_DATA ?AUTO_2265 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2265 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2272 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2276 - LANDER
      ?AUTO_2277 - WAYPOINT
      ?AUTO_2275 - ROVER
      ?AUTO_2274 - STORE
      ?AUTO_2273 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2276 ?AUTO_2272 ) ( VISIBLE ?AUTO_2277 ?AUTO_2272 ) ( AVAILABLE ?AUTO_2275 ) ( CHANNEL_FREE ?AUTO_2276 ) ( not ( = ?AUTO_2272 ?AUTO_2277 ) ) ( CAN_TRAVERSE ?AUTO_2275 ?AUTO_2272 ?AUTO_2277 ) ( VISIBLE ?AUTO_2272 ?AUTO_2277 ) ( AT_SOIL_SAMPLE ?AUTO_2272 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2275 ) ( STORE_OF ?AUTO_2274 ?AUTO_2275 ) ( CAN_TRAVERSE ?AUTO_2275 ?AUTO_2273 ?AUTO_2272 ) ( AT ?AUTO_2275 ?AUTO_2273 ) ( VISIBLE ?AUTO_2273 ?AUTO_2272 ) ( not ( = ?AUTO_2272 ?AUTO_2273 ) ) ( not ( = ?AUTO_2277 ?AUTO_2273 ) ) ( AT_ROCK_SAMPLE ?AUTO_2273 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2275 ) ( EMPTY ?AUTO_2274 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2275 ?AUTO_2274 ?AUTO_2273 )
      ( GET_SOIL_DATA ?AUTO_2272 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2272 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2313 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2316 - LANDER
      ?AUTO_2315 - WAYPOINT
      ?AUTO_2317 - ROVER
      ?AUTO_2314 - STORE
      ?AUTO_2318 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2316 ?AUTO_2315 ) ( VISIBLE ?AUTO_2313 ?AUTO_2315 ) ( AVAILABLE ?AUTO_2317 ) ( CHANNEL_FREE ?AUTO_2316 ) ( not ( = ?AUTO_2313 ?AUTO_2315 ) ) ( AT_SOIL_SAMPLE ?AUTO_2313 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2317 ) ( STORE_OF ?AUTO_2314 ?AUTO_2317 ) ( CAN_TRAVERSE ?AUTO_2317 ?AUTO_2315 ?AUTO_2313 ) ( VISIBLE ?AUTO_2315 ?AUTO_2313 ) ( FULL ?AUTO_2314 ) ( CAN_TRAVERSE ?AUTO_2317 ?AUTO_2318 ?AUTO_2315 ) ( AT ?AUTO_2317 ?AUTO_2318 ) ( VISIBLE ?AUTO_2318 ?AUTO_2315 ) ( not ( = ?AUTO_2313 ?AUTO_2318 ) ) ( not ( = ?AUTO_2315 ?AUTO_2318 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2317 ?AUTO_2318 ?AUTO_2315 )
      ( GET_SOIL_DATA ?AUTO_2313 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2313 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2320 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2324 - LANDER
      ?AUTO_2325 - WAYPOINT
      ?AUTO_2323 - ROVER
      ?AUTO_2322 - STORE
      ?AUTO_2321 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2324 ?AUTO_2325 ) ( VISIBLE ?AUTO_2320 ?AUTO_2325 ) ( AVAILABLE ?AUTO_2323 ) ( CHANNEL_FREE ?AUTO_2324 ) ( not ( = ?AUTO_2320 ?AUTO_2325 ) ) ( AT_SOIL_SAMPLE ?AUTO_2320 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2323 ) ( STORE_OF ?AUTO_2322 ?AUTO_2323 ) ( CAN_TRAVERSE ?AUTO_2323 ?AUTO_2325 ?AUTO_2320 ) ( VISIBLE ?AUTO_2325 ?AUTO_2320 ) ( CAN_TRAVERSE ?AUTO_2323 ?AUTO_2321 ?AUTO_2325 ) ( AT ?AUTO_2323 ?AUTO_2321 ) ( VISIBLE ?AUTO_2321 ?AUTO_2325 ) ( not ( = ?AUTO_2320 ?AUTO_2321 ) ) ( not ( = ?AUTO_2325 ?AUTO_2321 ) ) ( AT_ROCK_SAMPLE ?AUTO_2321 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2323 ) ( EMPTY ?AUTO_2322 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2323 ?AUTO_2322 ?AUTO_2321 )
      ( GET_SOIL_DATA ?AUTO_2320 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2320 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2361 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2364 - LANDER
      ?AUTO_2363 - WAYPOINT
      ?AUTO_2362 - ROVER
      ?AUTO_2365 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2364 ?AUTO_2363 ) ( VISIBLE ?AUTO_2361 ?AUTO_2363 ) ( AVAILABLE ?AUTO_2362 ) ( CHANNEL_FREE ?AUTO_2364 ) ( not ( = ?AUTO_2361 ?AUTO_2363 ) ) ( AT_ROCK_SAMPLE ?AUTO_2361 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2362 ) ( STORE_OF ?AUTO_2365 ?AUTO_2362 ) ( CAN_TRAVERSE ?AUTO_2362 ?AUTO_2363 ?AUTO_2361 ) ( AT ?AUTO_2362 ?AUTO_2363 ) ( VISIBLE ?AUTO_2363 ?AUTO_2361 ) ( FULL ?AUTO_2365 ) )
    :subtasks
    ( ( !DROP ?AUTO_2362 ?AUTO_2365 )
      ( GET_ROCK_DATA ?AUTO_2361 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2361 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2368 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2370 - LANDER
      ?AUTO_2369 - WAYPOINT
      ?AUTO_2372 - ROVER
      ?AUTO_2371 - STORE
      ?AUTO_2373 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2370 ?AUTO_2369 ) ( VISIBLE ?AUTO_2368 ?AUTO_2369 ) ( AVAILABLE ?AUTO_2372 ) ( CHANNEL_FREE ?AUTO_2370 ) ( not ( = ?AUTO_2368 ?AUTO_2369 ) ) ( AT_ROCK_SAMPLE ?AUTO_2368 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2372 ) ( STORE_OF ?AUTO_2371 ?AUTO_2372 ) ( CAN_TRAVERSE ?AUTO_2372 ?AUTO_2369 ?AUTO_2368 ) ( VISIBLE ?AUTO_2369 ?AUTO_2368 ) ( FULL ?AUTO_2371 ) ( CAN_TRAVERSE ?AUTO_2372 ?AUTO_2373 ?AUTO_2369 ) ( AT ?AUTO_2372 ?AUTO_2373 ) ( VISIBLE ?AUTO_2373 ?AUTO_2369 ) ( not ( = ?AUTO_2368 ?AUTO_2373 ) ) ( not ( = ?AUTO_2369 ?AUTO_2373 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2372 ?AUTO_2373 ?AUTO_2369 )
      ( GET_ROCK_DATA ?AUTO_2368 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2368 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2375 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2379 - LANDER
      ?AUTO_2378 - WAYPOINT
      ?AUTO_2377 - ROVER
      ?AUTO_2380 - STORE
      ?AUTO_2376 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2379 ?AUTO_2378 ) ( VISIBLE ?AUTO_2375 ?AUTO_2378 ) ( AVAILABLE ?AUTO_2377 ) ( CHANNEL_FREE ?AUTO_2379 ) ( not ( = ?AUTO_2375 ?AUTO_2378 ) ) ( AT_ROCK_SAMPLE ?AUTO_2375 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2377 ) ( STORE_OF ?AUTO_2380 ?AUTO_2377 ) ( CAN_TRAVERSE ?AUTO_2377 ?AUTO_2378 ?AUTO_2375 ) ( VISIBLE ?AUTO_2378 ?AUTO_2375 ) ( CAN_TRAVERSE ?AUTO_2377 ?AUTO_2376 ?AUTO_2378 ) ( AT ?AUTO_2377 ?AUTO_2376 ) ( VISIBLE ?AUTO_2376 ?AUTO_2378 ) ( not ( = ?AUTO_2375 ?AUTO_2376 ) ) ( not ( = ?AUTO_2378 ?AUTO_2376 ) ) ( AT_ROCK_SAMPLE ?AUTO_2376 ) ( EMPTY ?AUTO_2380 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2377 ?AUTO_2380 ?AUTO_2376 )
      ( GET_ROCK_DATA ?AUTO_2375 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2375 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2396 - OBJECTIVE
      ?AUTO_2397 - MODE
    )
    :vars
    (
      ?AUTO_2402 - ROVER
      ?AUTO_2401 - WAYPOINT
      ?AUTO_2400 - LANDER
      ?AUTO_2399 - WAYPOINT
      ?AUTO_2398 - CAMERA
      ?AUTO_2403 - OBJECTIVE
    )
    :precondition
    ( and ( AT ?AUTO_2402 ?AUTO_2401 ) ( AT_LANDER ?AUTO_2400 ?AUTO_2399 ) ( VISIBLE ?AUTO_2401 ?AUTO_2399 ) ( AVAILABLE ?AUTO_2402 ) ( CHANNEL_FREE ?AUTO_2400 ) ( not ( = ?AUTO_2401 ?AUTO_2399 ) ) ( ON_BOARD ?AUTO_2398 ?AUTO_2402 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2402 ) ( SUPPORTS ?AUTO_2398 ?AUTO_2397 ) ( VISIBLE_FROM ?AUTO_2396 ?AUTO_2401 ) ( CALIBRATION_TARGET ?AUTO_2398 ?AUTO_2403 ) ( VISIBLE_FROM ?AUTO_2403 ?AUTO_2401 ) ( not ( = ?AUTO_2396 ?AUTO_2403 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2402 ?AUTO_2398 ?AUTO_2403 ?AUTO_2401 )
      ( GET_IMAGE_DATA ?AUTO_2396 ?AUTO_2397 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2396 ?AUTO_2397 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2469 - OBJECTIVE
      ?AUTO_2470 - MODE
    )
    :vars
    (
      ?AUTO_2473 - LANDER
      ?AUTO_2471 - WAYPOINT
      ?AUTO_2474 - WAYPOINT
      ?AUTO_2472 - ROVER
      ?AUTO_2475 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2473 ?AUTO_2471 ) ( VISIBLE ?AUTO_2474 ?AUTO_2471 ) ( AVAILABLE ?AUTO_2472 ) ( CHANNEL_FREE ?AUTO_2473 ) ( not ( = ?AUTO_2474 ?AUTO_2471 ) ) ( CAN_TRAVERSE ?AUTO_2472 ?AUTO_2471 ?AUTO_2474 ) ( VISIBLE ?AUTO_2471 ?AUTO_2474 ) ( ON_BOARD ?AUTO_2475 ?AUTO_2472 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2472 ) ( SUPPORTS ?AUTO_2475 ?AUTO_2470 ) ( VISIBLE_FROM ?AUTO_2469 ?AUTO_2471 ) ( CALIBRATION_TARGET ?AUTO_2475 ?AUTO_2469 ) ( CAN_TRAVERSE ?AUTO_2472 ?AUTO_2474 ?AUTO_2471 ) ( AT ?AUTO_2472 ?AUTO_2474 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2472 ?AUTO_2474 ?AUTO_2471 )
      ( GET_IMAGE_DATA ?AUTO_2469 ?AUTO_2470 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2469 ?AUTO_2470 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2571 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2574 - LANDER
      ?AUTO_2575 - WAYPOINT
      ?AUTO_2576 - WAYPOINT
      ?AUTO_2573 - ROVER
      ?AUTO_2572 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2574 ?AUTO_2575 ) ( VISIBLE ?AUTO_2576 ?AUTO_2575 ) ( AVAILABLE ?AUTO_2573 ) ( CHANNEL_FREE ?AUTO_2574 ) ( not ( = ?AUTO_2571 ?AUTO_2576 ) ) ( not ( = ?AUTO_2571 ?AUTO_2575 ) ) ( not ( = ?AUTO_2576 ?AUTO_2575 ) ) ( CAN_TRAVERSE ?AUTO_2573 ?AUTO_2571 ?AUTO_2576 ) ( VISIBLE ?AUTO_2571 ?AUTO_2576 ) ( AT_ROCK_SAMPLE ?AUTO_2571 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2573 ) ( STORE_OF ?AUTO_2572 ?AUTO_2573 ) ( EMPTY ?AUTO_2572 ) ( CAN_TRAVERSE ?AUTO_2573 ?AUTO_2576 ?AUTO_2571 ) ( AT ?AUTO_2573 ?AUTO_2576 ) ( VISIBLE ?AUTO_2576 ?AUTO_2571 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2573 ?AUTO_2576 ?AUTO_2571 )
      ( GET_ROCK_DATA ?AUTO_2571 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2571 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2577 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2582 - LANDER
      ?AUTO_2581 - WAYPOINT
      ?AUTO_2580 - WAYPOINT
      ?AUTO_2579 - ROVER
      ?AUTO_2578 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2582 ?AUTO_2581 ) ( VISIBLE ?AUTO_2580 ?AUTO_2581 ) ( AVAILABLE ?AUTO_2579 ) ( CHANNEL_FREE ?AUTO_2582 ) ( not ( = ?AUTO_2577 ?AUTO_2580 ) ) ( not ( = ?AUTO_2577 ?AUTO_2581 ) ) ( not ( = ?AUTO_2580 ?AUTO_2581 ) ) ( CAN_TRAVERSE ?AUTO_2579 ?AUTO_2577 ?AUTO_2580 ) ( VISIBLE ?AUTO_2577 ?AUTO_2580 ) ( AT_ROCK_SAMPLE ?AUTO_2577 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2579 ) ( STORE_OF ?AUTO_2578 ?AUTO_2579 ) ( CAN_TRAVERSE ?AUTO_2579 ?AUTO_2580 ?AUTO_2577 ) ( AT ?AUTO_2579 ?AUTO_2580 ) ( VISIBLE ?AUTO_2580 ?AUTO_2577 ) ( FULL ?AUTO_2578 ) )
    :subtasks
    ( ( !DROP ?AUTO_2579 ?AUTO_2578 )
      ( GET_ROCK_DATA ?AUTO_2577 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2577 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2587 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2590 - LANDER
      ?AUTO_2591 - WAYPOINT
      ?AUTO_2592 - WAYPOINT
      ?AUTO_2589 - ROVER
      ?AUTO_2588 - STORE
      ?AUTO_2593 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2590 ?AUTO_2591 ) ( VISIBLE ?AUTO_2592 ?AUTO_2591 ) ( AVAILABLE ?AUTO_2589 ) ( CHANNEL_FREE ?AUTO_2590 ) ( not ( = ?AUTO_2587 ?AUTO_2592 ) ) ( not ( = ?AUTO_2587 ?AUTO_2591 ) ) ( not ( = ?AUTO_2592 ?AUTO_2591 ) ) ( CAN_TRAVERSE ?AUTO_2589 ?AUTO_2587 ?AUTO_2592 ) ( VISIBLE ?AUTO_2587 ?AUTO_2592 ) ( AT_ROCK_SAMPLE ?AUTO_2587 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2589 ) ( STORE_OF ?AUTO_2588 ?AUTO_2589 ) ( EMPTY ?AUTO_2588 ) ( CAN_TRAVERSE ?AUTO_2589 ?AUTO_2592 ?AUTO_2587 ) ( VISIBLE ?AUTO_2592 ?AUTO_2587 ) ( CAN_TRAVERSE ?AUTO_2589 ?AUTO_2593 ?AUTO_2592 ) ( AT ?AUTO_2589 ?AUTO_2593 ) ( VISIBLE ?AUTO_2593 ?AUTO_2592 ) ( not ( = ?AUTO_2587 ?AUTO_2593 ) ) ( not ( = ?AUTO_2591 ?AUTO_2593 ) ) ( not ( = ?AUTO_2592 ?AUTO_2593 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2589 ?AUTO_2593 ?AUTO_2592 )
      ( GET_ROCK_DATA ?AUTO_2587 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2587 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2663 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2666 - LANDER
      ?AUTO_2664 - WAYPOINT
      ?AUTO_2668 - ROVER
      ?AUTO_2665 - STORE
      ?AUTO_2667 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2666 ?AUTO_2664 ) ( VISIBLE ?AUTO_2663 ?AUTO_2664 ) ( AVAILABLE ?AUTO_2668 ) ( CHANNEL_FREE ?AUTO_2666 ) ( not ( = ?AUTO_2663 ?AUTO_2664 ) ) ( AT_ROCK_SAMPLE ?AUTO_2663 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2668 ) ( STORE_OF ?AUTO_2665 ?AUTO_2668 ) ( CAN_TRAVERSE ?AUTO_2668 ?AUTO_2667 ?AUTO_2663 ) ( AT ?AUTO_2668 ?AUTO_2667 ) ( VISIBLE ?AUTO_2667 ?AUTO_2663 ) ( not ( = ?AUTO_2663 ?AUTO_2667 ) ) ( not ( = ?AUTO_2664 ?AUTO_2667 ) ) ( AT_SOIL_SAMPLE ?AUTO_2667 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2668 ) ( EMPTY ?AUTO_2665 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_2668 ?AUTO_2665 ?AUTO_2667 )
      ( GET_ROCK_DATA ?AUTO_2663 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2663 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2707 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2708 - LANDER
      ?AUTO_2711 - WAYPOINT
      ?AUTO_2712 - ROVER
      ?AUTO_2709 - STORE
      ?AUTO_2710 - WAYPOINT
      ?AUTO_2713 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2708 ?AUTO_2711 ) ( VISIBLE ?AUTO_2707 ?AUTO_2711 ) ( AVAILABLE ?AUTO_2712 ) ( CHANNEL_FREE ?AUTO_2708 ) ( not ( = ?AUTO_2707 ?AUTO_2711 ) ) ( AT_SOIL_SAMPLE ?AUTO_2707 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2712 ) ( STORE_OF ?AUTO_2709 ?AUTO_2712 ) ( FULL ?AUTO_2709 ) ( CAN_TRAVERSE ?AUTO_2712 ?AUTO_2710 ?AUTO_2707 ) ( VISIBLE ?AUTO_2710 ?AUTO_2707 ) ( not ( = ?AUTO_2707 ?AUTO_2710 ) ) ( not ( = ?AUTO_2711 ?AUTO_2710 ) ) ( CAN_TRAVERSE ?AUTO_2712 ?AUTO_2713 ?AUTO_2710 ) ( AT ?AUTO_2712 ?AUTO_2713 ) ( VISIBLE ?AUTO_2713 ?AUTO_2710 ) ( not ( = ?AUTO_2707 ?AUTO_2713 ) ) ( not ( = ?AUTO_2711 ?AUTO_2713 ) ) ( not ( = ?AUTO_2710 ?AUTO_2713 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2712 ?AUTO_2713 ?AUTO_2710 )
      ( GET_SOIL_DATA ?AUTO_2707 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2707 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2715 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2716 - LANDER
      ?AUTO_2719 - WAYPOINT
      ?AUTO_2717 - ROVER
      ?AUTO_2721 - STORE
      ?AUTO_2720 - WAYPOINT
      ?AUTO_2718 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2716 ?AUTO_2719 ) ( VISIBLE ?AUTO_2715 ?AUTO_2719 ) ( AVAILABLE ?AUTO_2717 ) ( CHANNEL_FREE ?AUTO_2716 ) ( not ( = ?AUTO_2715 ?AUTO_2719 ) ) ( AT_SOIL_SAMPLE ?AUTO_2715 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2717 ) ( STORE_OF ?AUTO_2721 ?AUTO_2717 ) ( CAN_TRAVERSE ?AUTO_2717 ?AUTO_2720 ?AUTO_2715 ) ( VISIBLE ?AUTO_2720 ?AUTO_2715 ) ( not ( = ?AUTO_2715 ?AUTO_2720 ) ) ( not ( = ?AUTO_2719 ?AUTO_2720 ) ) ( CAN_TRAVERSE ?AUTO_2717 ?AUTO_2718 ?AUTO_2720 ) ( AT ?AUTO_2717 ?AUTO_2718 ) ( VISIBLE ?AUTO_2718 ?AUTO_2720 ) ( not ( = ?AUTO_2715 ?AUTO_2718 ) ) ( not ( = ?AUTO_2719 ?AUTO_2718 ) ) ( not ( = ?AUTO_2720 ?AUTO_2718 ) ) ( AT_SOIL_SAMPLE ?AUTO_2718 ) ( EMPTY ?AUTO_2721 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_2717 ?AUTO_2721 ?AUTO_2718 )
      ( GET_SOIL_DATA ?AUTO_2715 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2715 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8894 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8898 - LANDER
      ?AUTO_8899 - WAYPOINT
      ?AUTO_8897 - ROVER
      ?AUTO_8895 - STORE
      ?AUTO_8900 - WAYPOINT
      ?AUTO_8896 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8898 ?AUTO_8899 ) ( VISIBLE ?AUTO_8894 ?AUTO_8899 ) ( AVAILABLE ?AUTO_8897 ) ( CHANNEL_FREE ?AUTO_8898 ) ( not ( = ?AUTO_8894 ?AUTO_8899 ) ) ( AT_SOIL_SAMPLE ?AUTO_8894 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8897 ) ( STORE_OF ?AUTO_8895 ?AUTO_8897 ) ( EMPTY ?AUTO_8895 ) ( CAN_TRAVERSE ?AUTO_8897 ?AUTO_8900 ?AUTO_8894 ) ( VISIBLE ?AUTO_8900 ?AUTO_8894 ) ( not ( = ?AUTO_8894 ?AUTO_8900 ) ) ( not ( = ?AUTO_8899 ?AUTO_8900 ) ) ( CAN_TRAVERSE ?AUTO_8897 ?AUTO_8896 ?AUTO_8900 ) ( VISIBLE ?AUTO_8896 ?AUTO_8900 ) ( not ( = ?AUTO_8894 ?AUTO_8896 ) ) ( not ( = ?AUTO_8899 ?AUTO_8896 ) ) ( not ( = ?AUTO_8900 ?AUTO_8896 ) ) ( CAN_TRAVERSE ?AUTO_8897 ?AUTO_8899 ?AUTO_8896 ) ( AT ?AUTO_8897 ?AUTO_8899 ) ( VISIBLE ?AUTO_8899 ?AUTO_8896 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8897 ?AUTO_8899 ?AUTO_8896 )
      ( GET_SOIL_DATA ?AUTO_8894 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8894 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2796 - OBJECTIVE
      ?AUTO_2797 - MODE
    )
    :vars
    (
      ?AUTO_2802 - LANDER
      ?AUTO_2799 - WAYPOINT
      ?AUTO_2800 - WAYPOINT
      ?AUTO_2798 - ROVER
      ?AUTO_2801 - CAMERA
      ?AUTO_2803 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2802 ?AUTO_2799 ) ( VISIBLE ?AUTO_2800 ?AUTO_2799 ) ( AVAILABLE ?AUTO_2798 ) ( CHANNEL_FREE ?AUTO_2802 ) ( not ( = ?AUTO_2800 ?AUTO_2799 ) ) ( ON_BOARD ?AUTO_2801 ?AUTO_2798 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2798 ) ( SUPPORTS ?AUTO_2801 ?AUTO_2797 ) ( VISIBLE_FROM ?AUTO_2796 ?AUTO_2800 ) ( CALIBRATION_TARGET ?AUTO_2801 ?AUTO_2796 ) ( CAN_TRAVERSE ?AUTO_2798 ?AUTO_2799 ?AUTO_2800 ) ( VISIBLE ?AUTO_2799 ?AUTO_2800 ) ( CAN_TRAVERSE ?AUTO_2798 ?AUTO_2803 ?AUTO_2799 ) ( AT ?AUTO_2798 ?AUTO_2803 ) ( VISIBLE ?AUTO_2803 ?AUTO_2799 ) ( not ( = ?AUTO_2799 ?AUTO_2803 ) ) ( not ( = ?AUTO_2800 ?AUTO_2803 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2798 ?AUTO_2803 ?AUTO_2799 )
      ( GET_IMAGE_DATA ?AUTO_2796 ?AUTO_2797 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2796 ?AUTO_2797 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2855 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2858 - LANDER
      ?AUTO_2857 - WAYPOINT
      ?AUTO_2856 - ROVER
      ?AUTO_2859 - WAYPOINT
      ?AUTO_2860 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2858 ?AUTO_2857 ) ( HAVE_ROCK_ANALYSIS ?AUTO_2856 ?AUTO_2855 ) ( VISIBLE ?AUTO_2859 ?AUTO_2857 ) ( AVAILABLE ?AUTO_2856 ) ( CHANNEL_FREE ?AUTO_2858 ) ( not ( = ?AUTO_2855 ?AUTO_2859 ) ) ( not ( = ?AUTO_2855 ?AUTO_2857 ) ) ( not ( = ?AUTO_2859 ?AUTO_2857 ) ) ( CAN_TRAVERSE ?AUTO_2856 ?AUTO_2860 ?AUTO_2859 ) ( AT ?AUTO_2856 ?AUTO_2860 ) ( VISIBLE ?AUTO_2860 ?AUTO_2859 ) ( not ( = ?AUTO_2855 ?AUTO_2860 ) ) ( not ( = ?AUTO_2857 ?AUTO_2860 ) ) ( not ( = ?AUTO_2859 ?AUTO_2860 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2856 ?AUTO_2860 ?AUTO_2859 )
      ( GET_ROCK_DATA ?AUTO_2855 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2855 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2861 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2866 - LANDER
      ?AUTO_2864 - WAYPOINT
      ?AUTO_2863 - ROVER
      ?AUTO_2865 - WAYPOINT
      ?AUTO_2862 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2866 ?AUTO_2864 ) ( HAVE_ROCK_ANALYSIS ?AUTO_2863 ?AUTO_2861 ) ( VISIBLE ?AUTO_2865 ?AUTO_2864 ) ( AVAILABLE ?AUTO_2863 ) ( CHANNEL_FREE ?AUTO_2866 ) ( not ( = ?AUTO_2861 ?AUTO_2865 ) ) ( not ( = ?AUTO_2861 ?AUTO_2864 ) ) ( not ( = ?AUTO_2865 ?AUTO_2864 ) ) ( CAN_TRAVERSE ?AUTO_2863 ?AUTO_2862 ?AUTO_2865 ) ( VISIBLE ?AUTO_2862 ?AUTO_2865 ) ( not ( = ?AUTO_2861 ?AUTO_2862 ) ) ( not ( = ?AUTO_2864 ?AUTO_2862 ) ) ( not ( = ?AUTO_2865 ?AUTO_2862 ) ) ( CAN_TRAVERSE ?AUTO_2863 ?AUTO_2861 ?AUTO_2862 ) ( AT ?AUTO_2863 ?AUTO_2861 ) ( VISIBLE ?AUTO_2861 ?AUTO_2862 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2863 ?AUTO_2861 ?AUTO_2862 )
      ( GET_ROCK_DATA ?AUTO_2861 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2861 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2867 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2870 - LANDER
      ?AUTO_2872 - WAYPOINT
      ?AUTO_2871 - WAYPOINT
      ?AUTO_2869 - ROVER
      ?AUTO_2868 - WAYPOINT
      ?AUTO_2873 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2870 ?AUTO_2872 ) ( VISIBLE ?AUTO_2871 ?AUTO_2872 ) ( AVAILABLE ?AUTO_2869 ) ( CHANNEL_FREE ?AUTO_2870 ) ( not ( = ?AUTO_2867 ?AUTO_2871 ) ) ( not ( = ?AUTO_2867 ?AUTO_2872 ) ) ( not ( = ?AUTO_2871 ?AUTO_2872 ) ) ( CAN_TRAVERSE ?AUTO_2869 ?AUTO_2868 ?AUTO_2871 ) ( VISIBLE ?AUTO_2868 ?AUTO_2871 ) ( not ( = ?AUTO_2867 ?AUTO_2868 ) ) ( not ( = ?AUTO_2872 ?AUTO_2868 ) ) ( not ( = ?AUTO_2871 ?AUTO_2868 ) ) ( CAN_TRAVERSE ?AUTO_2869 ?AUTO_2867 ?AUTO_2868 ) ( AT ?AUTO_2869 ?AUTO_2867 ) ( VISIBLE ?AUTO_2867 ?AUTO_2868 ) ( AT_ROCK_SAMPLE ?AUTO_2867 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2869 ) ( STORE_OF ?AUTO_2873 ?AUTO_2869 ) ( EMPTY ?AUTO_2873 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2869 ?AUTO_2873 ?AUTO_2867 )
      ( GET_ROCK_DATA ?AUTO_2867 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2867 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2875 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2878 - LANDER
      ?AUTO_2877 - WAYPOINT
      ?AUTO_2881 - WAYPOINT
      ?AUTO_2876 - ROVER
      ?AUTO_2880 - WAYPOINT
      ?AUTO_2879 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2878 ?AUTO_2877 ) ( VISIBLE ?AUTO_2881 ?AUTO_2877 ) ( AVAILABLE ?AUTO_2876 ) ( CHANNEL_FREE ?AUTO_2878 ) ( not ( = ?AUTO_2875 ?AUTO_2881 ) ) ( not ( = ?AUTO_2875 ?AUTO_2877 ) ) ( not ( = ?AUTO_2881 ?AUTO_2877 ) ) ( CAN_TRAVERSE ?AUTO_2876 ?AUTO_2880 ?AUTO_2881 ) ( VISIBLE ?AUTO_2880 ?AUTO_2881 ) ( not ( = ?AUTO_2875 ?AUTO_2880 ) ) ( not ( = ?AUTO_2877 ?AUTO_2880 ) ) ( not ( = ?AUTO_2881 ?AUTO_2880 ) ) ( CAN_TRAVERSE ?AUTO_2876 ?AUTO_2875 ?AUTO_2880 ) ( VISIBLE ?AUTO_2875 ?AUTO_2880 ) ( AT_ROCK_SAMPLE ?AUTO_2875 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2876 ) ( STORE_OF ?AUTO_2879 ?AUTO_2876 ) ( EMPTY ?AUTO_2879 ) ( CAN_TRAVERSE ?AUTO_2876 ?AUTO_2880 ?AUTO_2875 ) ( AT ?AUTO_2876 ?AUTO_2880 ) ( VISIBLE ?AUTO_2880 ?AUTO_2875 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2876 ?AUTO_2880 ?AUTO_2875 )
      ( GET_ROCK_DATA ?AUTO_2875 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2875 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2882 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2888 - LANDER
      ?AUTO_2884 - WAYPOINT
      ?AUTO_2887 - WAYPOINT
      ?AUTO_2885 - ROVER
      ?AUTO_2886 - WAYPOINT
      ?AUTO_2883 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2888 ?AUTO_2884 ) ( VISIBLE ?AUTO_2887 ?AUTO_2884 ) ( AVAILABLE ?AUTO_2885 ) ( CHANNEL_FREE ?AUTO_2888 ) ( not ( = ?AUTO_2882 ?AUTO_2887 ) ) ( not ( = ?AUTO_2882 ?AUTO_2884 ) ) ( not ( = ?AUTO_2887 ?AUTO_2884 ) ) ( CAN_TRAVERSE ?AUTO_2885 ?AUTO_2886 ?AUTO_2887 ) ( VISIBLE ?AUTO_2886 ?AUTO_2887 ) ( not ( = ?AUTO_2882 ?AUTO_2886 ) ) ( not ( = ?AUTO_2884 ?AUTO_2886 ) ) ( not ( = ?AUTO_2887 ?AUTO_2886 ) ) ( CAN_TRAVERSE ?AUTO_2885 ?AUTO_2882 ?AUTO_2886 ) ( VISIBLE ?AUTO_2882 ?AUTO_2886 ) ( AT_ROCK_SAMPLE ?AUTO_2882 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2885 ) ( STORE_OF ?AUTO_2883 ?AUTO_2885 ) ( EMPTY ?AUTO_2883 ) ( CAN_TRAVERSE ?AUTO_2885 ?AUTO_2886 ?AUTO_2882 ) ( VISIBLE ?AUTO_2886 ?AUTO_2882 ) ( CAN_TRAVERSE ?AUTO_2885 ?AUTO_2887 ?AUTO_2886 ) ( AT ?AUTO_2885 ?AUTO_2887 ) ( VISIBLE ?AUTO_2887 ?AUTO_2886 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2885 ?AUTO_2887 ?AUTO_2886 )
      ( GET_ROCK_DATA ?AUTO_2882 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2882 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2889 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2895 - LANDER
      ?AUTO_2893 - WAYPOINT
      ?AUTO_2892 - WAYPOINT
      ?AUTO_2894 - ROVER
      ?AUTO_2890 - WAYPOINT
      ?AUTO_2891 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2895 ?AUTO_2893 ) ( VISIBLE ?AUTO_2892 ?AUTO_2893 ) ( AVAILABLE ?AUTO_2894 ) ( CHANNEL_FREE ?AUTO_2895 ) ( not ( = ?AUTO_2889 ?AUTO_2892 ) ) ( not ( = ?AUTO_2889 ?AUTO_2893 ) ) ( not ( = ?AUTO_2892 ?AUTO_2893 ) ) ( CAN_TRAVERSE ?AUTO_2894 ?AUTO_2890 ?AUTO_2892 ) ( VISIBLE ?AUTO_2890 ?AUTO_2892 ) ( not ( = ?AUTO_2889 ?AUTO_2890 ) ) ( not ( = ?AUTO_2893 ?AUTO_2890 ) ) ( not ( = ?AUTO_2892 ?AUTO_2890 ) ) ( CAN_TRAVERSE ?AUTO_2894 ?AUTO_2889 ?AUTO_2890 ) ( VISIBLE ?AUTO_2889 ?AUTO_2890 ) ( AT_ROCK_SAMPLE ?AUTO_2889 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2894 ) ( STORE_OF ?AUTO_2891 ?AUTO_2894 ) ( CAN_TRAVERSE ?AUTO_2894 ?AUTO_2890 ?AUTO_2889 ) ( VISIBLE ?AUTO_2890 ?AUTO_2889 ) ( CAN_TRAVERSE ?AUTO_2894 ?AUTO_2892 ?AUTO_2890 ) ( AT ?AUTO_2894 ?AUTO_2892 ) ( VISIBLE ?AUTO_2892 ?AUTO_2890 ) ( FULL ?AUTO_2891 ) )
    :subtasks
    ( ( !DROP ?AUTO_2894 ?AUTO_2891 )
      ( GET_ROCK_DATA ?AUTO_2889 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2889 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2899 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2901 - LANDER
      ?AUTO_2904 - WAYPOINT
      ?AUTO_2905 - WAYPOINT
      ?AUTO_2903 - ROVER
      ?AUTO_2900 - WAYPOINT
      ?AUTO_2902 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2901 ?AUTO_2904 ) ( VISIBLE ?AUTO_2905 ?AUTO_2904 ) ( AVAILABLE ?AUTO_2903 ) ( CHANNEL_FREE ?AUTO_2901 ) ( not ( = ?AUTO_2899 ?AUTO_2905 ) ) ( not ( = ?AUTO_2899 ?AUTO_2904 ) ) ( not ( = ?AUTO_2905 ?AUTO_2904 ) ) ( CAN_TRAVERSE ?AUTO_2903 ?AUTO_2900 ?AUTO_2905 ) ( VISIBLE ?AUTO_2900 ?AUTO_2905 ) ( not ( = ?AUTO_2899 ?AUTO_2900 ) ) ( not ( = ?AUTO_2904 ?AUTO_2900 ) ) ( not ( = ?AUTO_2905 ?AUTO_2900 ) ) ( CAN_TRAVERSE ?AUTO_2903 ?AUTO_2899 ?AUTO_2900 ) ( VISIBLE ?AUTO_2899 ?AUTO_2900 ) ( AT_ROCK_SAMPLE ?AUTO_2899 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2903 ) ( STORE_OF ?AUTO_2902 ?AUTO_2903 ) ( EMPTY ?AUTO_2902 ) ( CAN_TRAVERSE ?AUTO_2903 ?AUTO_2900 ?AUTO_2899 ) ( VISIBLE ?AUTO_2900 ?AUTO_2899 ) ( CAN_TRAVERSE ?AUTO_2903 ?AUTO_2905 ?AUTO_2900 ) ( VISIBLE ?AUTO_2905 ?AUTO_2900 ) ( CAN_TRAVERSE ?AUTO_2903 ?AUTO_2904 ?AUTO_2905 ) ( AT ?AUTO_2903 ?AUTO_2904 ) ( VISIBLE ?AUTO_2904 ?AUTO_2905 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2903 ?AUTO_2904 ?AUTO_2905 )
      ( GET_ROCK_DATA ?AUTO_2899 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2899 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2906 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2907 - LANDER
      ?AUTO_2910 - WAYPOINT
      ?AUTO_2909 - WAYPOINT
      ?AUTO_2911 - ROVER
      ?AUTO_2908 - WAYPOINT
      ?AUTO_2912 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2907 ?AUTO_2910 ) ( VISIBLE ?AUTO_2909 ?AUTO_2910 ) ( AVAILABLE ?AUTO_2911 ) ( CHANNEL_FREE ?AUTO_2907 ) ( not ( = ?AUTO_2906 ?AUTO_2909 ) ) ( not ( = ?AUTO_2906 ?AUTO_2910 ) ) ( not ( = ?AUTO_2909 ?AUTO_2910 ) ) ( CAN_TRAVERSE ?AUTO_2911 ?AUTO_2908 ?AUTO_2909 ) ( VISIBLE ?AUTO_2908 ?AUTO_2909 ) ( not ( = ?AUTO_2906 ?AUTO_2908 ) ) ( not ( = ?AUTO_2910 ?AUTO_2908 ) ) ( not ( = ?AUTO_2909 ?AUTO_2908 ) ) ( CAN_TRAVERSE ?AUTO_2911 ?AUTO_2906 ?AUTO_2908 ) ( VISIBLE ?AUTO_2906 ?AUTO_2908 ) ( AT_ROCK_SAMPLE ?AUTO_2906 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2911 ) ( STORE_OF ?AUTO_2912 ?AUTO_2911 ) ( CAN_TRAVERSE ?AUTO_2911 ?AUTO_2908 ?AUTO_2906 ) ( VISIBLE ?AUTO_2908 ?AUTO_2906 ) ( CAN_TRAVERSE ?AUTO_2911 ?AUTO_2909 ?AUTO_2908 ) ( VISIBLE ?AUTO_2909 ?AUTO_2908 ) ( CAN_TRAVERSE ?AUTO_2911 ?AUTO_2910 ?AUTO_2909 ) ( AT ?AUTO_2911 ?AUTO_2910 ) ( VISIBLE ?AUTO_2910 ?AUTO_2909 ) ( FULL ?AUTO_2912 ) )
    :subtasks
    ( ( !DROP ?AUTO_2911 ?AUTO_2912 )
      ( GET_ROCK_DATA ?AUTO_2906 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2906 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2933 - OBJECTIVE
      ?AUTO_2934 - MODE
    )
    :vars
    (
      ?AUTO_2938 - LANDER
      ?AUTO_2936 - WAYPOINT
      ?AUTO_2935 - ROVER
      ?AUTO_2937 - WAYPOINT
      ?AUTO_2939 - WAYPOINT
      ?AUTO_2940 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2938 ?AUTO_2936 ) ( HAVE_IMAGE ?AUTO_2935 ?AUTO_2933 ?AUTO_2934 ) ( VISIBLE ?AUTO_2937 ?AUTO_2936 ) ( AVAILABLE ?AUTO_2935 ) ( CHANNEL_FREE ?AUTO_2938 ) ( not ( = ?AUTO_2937 ?AUTO_2936 ) ) ( CAN_TRAVERSE ?AUTO_2935 ?AUTO_2939 ?AUTO_2937 ) ( VISIBLE ?AUTO_2939 ?AUTO_2937 ) ( not ( = ?AUTO_2936 ?AUTO_2939 ) ) ( not ( = ?AUTO_2937 ?AUTO_2939 ) ) ( CAN_TRAVERSE ?AUTO_2935 ?AUTO_2940 ?AUTO_2939 ) ( AT ?AUTO_2935 ?AUTO_2940 ) ( VISIBLE ?AUTO_2940 ?AUTO_2939 ) ( not ( = ?AUTO_2936 ?AUTO_2940 ) ) ( not ( = ?AUTO_2937 ?AUTO_2940 ) ) ( not ( = ?AUTO_2939 ?AUTO_2940 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2935 ?AUTO_2940 ?AUTO_2939 )
      ( GET_IMAGE_DATA ?AUTO_2933 ?AUTO_2934 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2933 ?AUTO_2934 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2943 - OBJECTIVE
      ?AUTO_2944 - MODE
    )
    :vars
    (
      ?AUTO_2950 - LANDER
      ?AUTO_2947 - WAYPOINT
      ?AUTO_2946 - WAYPOINT
      ?AUTO_2949 - ROVER
      ?AUTO_2945 - WAYPOINT
      ?AUTO_2948 - WAYPOINT
      ?AUTO_2951 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2950 ?AUTO_2947 ) ( VISIBLE ?AUTO_2946 ?AUTO_2947 ) ( AVAILABLE ?AUTO_2949 ) ( CHANNEL_FREE ?AUTO_2950 ) ( not ( = ?AUTO_2946 ?AUTO_2947 ) ) ( CAN_TRAVERSE ?AUTO_2949 ?AUTO_2945 ?AUTO_2946 ) ( VISIBLE ?AUTO_2945 ?AUTO_2946 ) ( not ( = ?AUTO_2947 ?AUTO_2945 ) ) ( not ( = ?AUTO_2946 ?AUTO_2945 ) ) ( CAN_TRAVERSE ?AUTO_2949 ?AUTO_2948 ?AUTO_2945 ) ( AT ?AUTO_2949 ?AUTO_2948 ) ( VISIBLE ?AUTO_2948 ?AUTO_2945 ) ( not ( = ?AUTO_2947 ?AUTO_2948 ) ) ( not ( = ?AUTO_2946 ?AUTO_2948 ) ) ( not ( = ?AUTO_2945 ?AUTO_2948 ) ) ( CALIBRATED ?AUTO_2951 ?AUTO_2949 ) ( ON_BOARD ?AUTO_2951 ?AUTO_2949 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2949 ) ( SUPPORTS ?AUTO_2951 ?AUTO_2944 ) ( VISIBLE_FROM ?AUTO_2943 ?AUTO_2948 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_2949 ?AUTO_2948 ?AUTO_2943 ?AUTO_2951 ?AUTO_2944 )
      ( GET_IMAGE_DATA ?AUTO_2943 ?AUTO_2944 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2943 ?AUTO_2944 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2952 - OBJECTIVE
      ?AUTO_2953 - MODE
    )
    :vars
    (
      ?AUTO_2958 - LANDER
      ?AUTO_2959 - WAYPOINT
      ?AUTO_2957 - WAYPOINT
      ?AUTO_2955 - ROVER
      ?AUTO_2954 - WAYPOINT
      ?AUTO_2956 - WAYPOINT
      ?AUTO_2960 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2958 ?AUTO_2959 ) ( VISIBLE ?AUTO_2957 ?AUTO_2959 ) ( AVAILABLE ?AUTO_2955 ) ( CHANNEL_FREE ?AUTO_2958 ) ( not ( = ?AUTO_2957 ?AUTO_2959 ) ) ( CAN_TRAVERSE ?AUTO_2955 ?AUTO_2954 ?AUTO_2957 ) ( VISIBLE ?AUTO_2954 ?AUTO_2957 ) ( not ( = ?AUTO_2959 ?AUTO_2954 ) ) ( not ( = ?AUTO_2957 ?AUTO_2954 ) ) ( CAN_TRAVERSE ?AUTO_2955 ?AUTO_2956 ?AUTO_2954 ) ( VISIBLE ?AUTO_2956 ?AUTO_2954 ) ( not ( = ?AUTO_2959 ?AUTO_2956 ) ) ( not ( = ?AUTO_2957 ?AUTO_2956 ) ) ( not ( = ?AUTO_2954 ?AUTO_2956 ) ) ( CALIBRATED ?AUTO_2960 ?AUTO_2955 ) ( ON_BOARD ?AUTO_2960 ?AUTO_2955 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2955 ) ( SUPPORTS ?AUTO_2960 ?AUTO_2953 ) ( VISIBLE_FROM ?AUTO_2952 ?AUTO_2956 ) ( CAN_TRAVERSE ?AUTO_2955 ?AUTO_2954 ?AUTO_2956 ) ( AT ?AUTO_2955 ?AUTO_2954 ) ( VISIBLE ?AUTO_2954 ?AUTO_2956 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2955 ?AUTO_2954 ?AUTO_2956 )
      ( GET_IMAGE_DATA ?AUTO_2952 ?AUTO_2953 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2952 ?AUTO_2953 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2961 - OBJECTIVE
      ?AUTO_2962 - MODE
    )
    :vars
    (
      ?AUTO_2969 - LANDER
      ?AUTO_2966 - WAYPOINT
      ?AUTO_2968 - WAYPOINT
      ?AUTO_2964 - ROVER
      ?AUTO_2963 - WAYPOINT
      ?AUTO_2967 - WAYPOINT
      ?AUTO_2965 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2969 ?AUTO_2966 ) ( VISIBLE ?AUTO_2968 ?AUTO_2966 ) ( AVAILABLE ?AUTO_2964 ) ( CHANNEL_FREE ?AUTO_2969 ) ( not ( = ?AUTO_2968 ?AUTO_2966 ) ) ( CAN_TRAVERSE ?AUTO_2964 ?AUTO_2963 ?AUTO_2968 ) ( VISIBLE ?AUTO_2963 ?AUTO_2968 ) ( not ( = ?AUTO_2966 ?AUTO_2963 ) ) ( not ( = ?AUTO_2968 ?AUTO_2963 ) ) ( CAN_TRAVERSE ?AUTO_2964 ?AUTO_2967 ?AUTO_2963 ) ( VISIBLE ?AUTO_2967 ?AUTO_2963 ) ( not ( = ?AUTO_2966 ?AUTO_2967 ) ) ( not ( = ?AUTO_2968 ?AUTO_2967 ) ) ( not ( = ?AUTO_2963 ?AUTO_2967 ) ) ( CALIBRATED ?AUTO_2965 ?AUTO_2964 ) ( ON_BOARD ?AUTO_2965 ?AUTO_2964 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2964 ) ( SUPPORTS ?AUTO_2965 ?AUTO_2962 ) ( VISIBLE_FROM ?AUTO_2961 ?AUTO_2967 ) ( CAN_TRAVERSE ?AUTO_2964 ?AUTO_2963 ?AUTO_2967 ) ( VISIBLE ?AUTO_2963 ?AUTO_2967 ) ( CAN_TRAVERSE ?AUTO_2964 ?AUTO_2968 ?AUTO_2963 ) ( AT ?AUTO_2964 ?AUTO_2968 ) ( VISIBLE ?AUTO_2968 ?AUTO_2963 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2964 ?AUTO_2968 ?AUTO_2963 )
      ( GET_IMAGE_DATA ?AUTO_2961 ?AUTO_2962 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2961 ?AUTO_2962 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2978 - OBJECTIVE
      ?AUTO_2979 - MODE
    )
    :vars
    (
      ?AUTO_2982 - LANDER
      ?AUTO_2980 - WAYPOINT
      ?AUTO_2986 - WAYPOINT
      ?AUTO_2981 - ROVER
      ?AUTO_2985 - WAYPOINT
      ?AUTO_2983 - WAYPOINT
      ?AUTO_2984 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2982 ?AUTO_2980 ) ( VISIBLE ?AUTO_2986 ?AUTO_2980 ) ( AVAILABLE ?AUTO_2981 ) ( CHANNEL_FREE ?AUTO_2982 ) ( not ( = ?AUTO_2986 ?AUTO_2980 ) ) ( CAN_TRAVERSE ?AUTO_2981 ?AUTO_2985 ?AUTO_2986 ) ( VISIBLE ?AUTO_2985 ?AUTO_2986 ) ( not ( = ?AUTO_2980 ?AUTO_2985 ) ) ( not ( = ?AUTO_2986 ?AUTO_2985 ) ) ( CAN_TRAVERSE ?AUTO_2981 ?AUTO_2983 ?AUTO_2985 ) ( VISIBLE ?AUTO_2983 ?AUTO_2985 ) ( not ( = ?AUTO_2980 ?AUTO_2983 ) ) ( not ( = ?AUTO_2986 ?AUTO_2983 ) ) ( not ( = ?AUTO_2985 ?AUTO_2983 ) ) ( CALIBRATED ?AUTO_2984 ?AUTO_2981 ) ( ON_BOARD ?AUTO_2984 ?AUTO_2981 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2981 ) ( SUPPORTS ?AUTO_2984 ?AUTO_2979 ) ( VISIBLE_FROM ?AUTO_2978 ?AUTO_2983 ) ( CAN_TRAVERSE ?AUTO_2981 ?AUTO_2985 ?AUTO_2983 ) ( VISIBLE ?AUTO_2985 ?AUTO_2983 ) ( CAN_TRAVERSE ?AUTO_2981 ?AUTO_2986 ?AUTO_2985 ) ( VISIBLE ?AUTO_2986 ?AUTO_2985 ) ( CAN_TRAVERSE ?AUTO_2981 ?AUTO_2980 ?AUTO_2986 ) ( AT ?AUTO_2981 ?AUTO_2980 ) ( VISIBLE ?AUTO_2980 ?AUTO_2986 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2981 ?AUTO_2980 ?AUTO_2986 )
      ( GET_IMAGE_DATA ?AUTO_2978 ?AUTO_2979 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2978 ?AUTO_2979 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2991 - OBJECTIVE
      ?AUTO_2992 - MODE
    )
    :vars
    (
      ?AUTO_2999 - LANDER
      ?AUTO_2997 - WAYPOINT
      ?AUTO_2998 - WAYPOINT
      ?AUTO_2994 - ROVER
      ?AUTO_2996 - WAYPOINT
      ?AUTO_2993 - WAYPOINT
      ?AUTO_2995 - CAMERA
      ?AUTO_3000 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2999 ?AUTO_2997 ) ( VISIBLE ?AUTO_2998 ?AUTO_2997 ) ( AVAILABLE ?AUTO_2994 ) ( CHANNEL_FREE ?AUTO_2999 ) ( not ( = ?AUTO_2998 ?AUTO_2997 ) ) ( CAN_TRAVERSE ?AUTO_2994 ?AUTO_2996 ?AUTO_2998 ) ( VISIBLE ?AUTO_2996 ?AUTO_2998 ) ( not ( = ?AUTO_2997 ?AUTO_2996 ) ) ( not ( = ?AUTO_2998 ?AUTO_2996 ) ) ( CAN_TRAVERSE ?AUTO_2994 ?AUTO_2993 ?AUTO_2996 ) ( VISIBLE ?AUTO_2993 ?AUTO_2996 ) ( not ( = ?AUTO_2997 ?AUTO_2993 ) ) ( not ( = ?AUTO_2998 ?AUTO_2993 ) ) ( not ( = ?AUTO_2996 ?AUTO_2993 ) ) ( ON_BOARD ?AUTO_2995 ?AUTO_2994 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2994 ) ( SUPPORTS ?AUTO_2995 ?AUTO_2992 ) ( VISIBLE_FROM ?AUTO_2991 ?AUTO_2993 ) ( CAN_TRAVERSE ?AUTO_2994 ?AUTO_2996 ?AUTO_2993 ) ( VISIBLE ?AUTO_2996 ?AUTO_2993 ) ( CAN_TRAVERSE ?AUTO_2994 ?AUTO_2998 ?AUTO_2996 ) ( VISIBLE ?AUTO_2998 ?AUTO_2996 ) ( CAN_TRAVERSE ?AUTO_2994 ?AUTO_2997 ?AUTO_2998 ) ( AT ?AUTO_2994 ?AUTO_2997 ) ( VISIBLE ?AUTO_2997 ?AUTO_2998 ) ( CALIBRATION_TARGET ?AUTO_2995 ?AUTO_3000 ) ( VISIBLE_FROM ?AUTO_3000 ?AUTO_2997 ) ( not ( = ?AUTO_2991 ?AUTO_3000 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2994 ?AUTO_2995 ?AUTO_3000 ?AUTO_2997 )
      ( GET_IMAGE_DATA ?AUTO_2991 ?AUTO_2992 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2991 ?AUTO_2992 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3001 - OBJECTIVE
      ?AUTO_3002 - MODE
    )
    :vars
    (
      ?AUTO_3010 - LANDER
      ?AUTO_3009 - WAYPOINT
      ?AUTO_3007 - WAYPOINT
      ?AUTO_3006 - ROVER
      ?AUTO_3004 - WAYPOINT
      ?AUTO_3003 - WAYPOINT
      ?AUTO_3008 - CAMERA
      ?AUTO_3005 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3010 ?AUTO_3009 ) ( VISIBLE ?AUTO_3007 ?AUTO_3009 ) ( AVAILABLE ?AUTO_3006 ) ( CHANNEL_FREE ?AUTO_3010 ) ( not ( = ?AUTO_3007 ?AUTO_3009 ) ) ( CAN_TRAVERSE ?AUTO_3006 ?AUTO_3004 ?AUTO_3007 ) ( VISIBLE ?AUTO_3004 ?AUTO_3007 ) ( not ( = ?AUTO_3009 ?AUTO_3004 ) ) ( not ( = ?AUTO_3007 ?AUTO_3004 ) ) ( CAN_TRAVERSE ?AUTO_3006 ?AUTO_3003 ?AUTO_3004 ) ( VISIBLE ?AUTO_3003 ?AUTO_3004 ) ( not ( = ?AUTO_3009 ?AUTO_3003 ) ) ( not ( = ?AUTO_3007 ?AUTO_3003 ) ) ( not ( = ?AUTO_3004 ?AUTO_3003 ) ) ( ON_BOARD ?AUTO_3008 ?AUTO_3006 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3006 ) ( SUPPORTS ?AUTO_3008 ?AUTO_3002 ) ( VISIBLE_FROM ?AUTO_3001 ?AUTO_3003 ) ( CAN_TRAVERSE ?AUTO_3006 ?AUTO_3004 ?AUTO_3003 ) ( VISIBLE ?AUTO_3004 ?AUTO_3003 ) ( CAN_TRAVERSE ?AUTO_3006 ?AUTO_3007 ?AUTO_3004 ) ( VISIBLE ?AUTO_3007 ?AUTO_3004 ) ( CAN_TRAVERSE ?AUTO_3006 ?AUTO_3009 ?AUTO_3007 ) ( VISIBLE ?AUTO_3009 ?AUTO_3007 ) ( CALIBRATION_TARGET ?AUTO_3008 ?AUTO_3005 ) ( VISIBLE_FROM ?AUTO_3005 ?AUTO_3009 ) ( not ( = ?AUTO_3001 ?AUTO_3005 ) ) ( CAN_TRAVERSE ?AUTO_3006 ?AUTO_3007 ?AUTO_3009 ) ( AT ?AUTO_3006 ?AUTO_3007 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3006 ?AUTO_3007 ?AUTO_3009 )
      ( GET_IMAGE_DATA ?AUTO_3001 ?AUTO_3002 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3001 ?AUTO_3002 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3039 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3041 - LANDER
      ?AUTO_3040 - WAYPOINT
      ?AUTO_3043 - WAYPOINT
      ?AUTO_3045 - ROVER
      ?AUTO_3044 - STORE
      ?AUTO_3042 - WAYPOINT
      ?AUTO_3046 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3041 ?AUTO_3040 ) ( VISIBLE ?AUTO_3043 ?AUTO_3040 ) ( AVAILABLE ?AUTO_3045 ) ( CHANNEL_FREE ?AUTO_3041 ) ( not ( = ?AUTO_3039 ?AUTO_3043 ) ) ( not ( = ?AUTO_3039 ?AUTO_3040 ) ) ( not ( = ?AUTO_3043 ?AUTO_3040 ) ) ( CAN_TRAVERSE ?AUTO_3045 ?AUTO_3039 ?AUTO_3043 ) ( VISIBLE ?AUTO_3039 ?AUTO_3043 ) ( AT_SOIL_SAMPLE ?AUTO_3039 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3045 ) ( STORE_OF ?AUTO_3044 ?AUTO_3045 ) ( EMPTY ?AUTO_3044 ) ( CAN_TRAVERSE ?AUTO_3045 ?AUTO_3042 ?AUTO_3039 ) ( VISIBLE ?AUTO_3042 ?AUTO_3039 ) ( not ( = ?AUTO_3039 ?AUTO_3042 ) ) ( not ( = ?AUTO_3040 ?AUTO_3042 ) ) ( not ( = ?AUTO_3043 ?AUTO_3042 ) ) ( CAN_TRAVERSE ?AUTO_3045 ?AUTO_3046 ?AUTO_3042 ) ( AT ?AUTO_3045 ?AUTO_3046 ) ( VISIBLE ?AUTO_3046 ?AUTO_3042 ) ( not ( = ?AUTO_3039 ?AUTO_3046 ) ) ( not ( = ?AUTO_3040 ?AUTO_3046 ) ) ( not ( = ?AUTO_3043 ?AUTO_3046 ) ) ( not ( = ?AUTO_3042 ?AUTO_3046 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3045 ?AUTO_3046 ?AUTO_3042 )
      ( GET_SOIL_DATA ?AUTO_3039 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3039 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3081 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3083 - LANDER
      ?AUTO_3086 - WAYPOINT
      ?AUTO_3084 - WAYPOINT
      ?AUTO_3082 - ROVER
      ?AUTO_3087 - STORE
      ?AUTO_3085 - WAYPOINT
      ?AUTO_3088 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3083 ?AUTO_3086 ) ( VISIBLE ?AUTO_3084 ?AUTO_3086 ) ( AVAILABLE ?AUTO_3082 ) ( CHANNEL_FREE ?AUTO_3083 ) ( not ( = ?AUTO_3081 ?AUTO_3084 ) ) ( not ( = ?AUTO_3081 ?AUTO_3086 ) ) ( not ( = ?AUTO_3084 ?AUTO_3086 ) ) ( CAN_TRAVERSE ?AUTO_3082 ?AUTO_3081 ?AUTO_3084 ) ( VISIBLE ?AUTO_3081 ?AUTO_3084 ) ( AT_ROCK_SAMPLE ?AUTO_3081 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3082 ) ( STORE_OF ?AUTO_3087 ?AUTO_3082 ) ( EMPTY ?AUTO_3087 ) ( CAN_TRAVERSE ?AUTO_3082 ?AUTO_3085 ?AUTO_3081 ) ( VISIBLE ?AUTO_3085 ?AUTO_3081 ) ( not ( = ?AUTO_3081 ?AUTO_3085 ) ) ( not ( = ?AUTO_3086 ?AUTO_3085 ) ) ( not ( = ?AUTO_3084 ?AUTO_3085 ) ) ( CAN_TRAVERSE ?AUTO_3082 ?AUTO_3088 ?AUTO_3085 ) ( AT ?AUTO_3082 ?AUTO_3088 ) ( VISIBLE ?AUTO_3088 ?AUTO_3085 ) ( not ( = ?AUTO_3081 ?AUTO_3088 ) ) ( not ( = ?AUTO_3086 ?AUTO_3088 ) ) ( not ( = ?AUTO_3084 ?AUTO_3088 ) ) ( not ( = ?AUTO_3085 ?AUTO_3088 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3082 ?AUTO_3088 ?AUTO_3085 )
      ( GET_ROCK_DATA ?AUTO_3081 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3081 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3107 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3111 - LANDER
      ?AUTO_3109 - WAYPOINT
      ?AUTO_3108 - ROVER
      ?AUTO_3110 - STORE
      ?AUTO_3112 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3111 ?AUTO_3109 ) ( VISIBLE ?AUTO_3107 ?AUTO_3109 ) ( AVAILABLE ?AUTO_3108 ) ( CHANNEL_FREE ?AUTO_3111 ) ( not ( = ?AUTO_3107 ?AUTO_3109 ) ) ( AT_SOIL_SAMPLE ?AUTO_3107 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3108 ) ( STORE_OF ?AUTO_3110 ?AUTO_3108 ) ( CAN_TRAVERSE ?AUTO_3108 ?AUTO_3112 ?AUTO_3107 ) ( AT ?AUTO_3108 ?AUTO_3112 ) ( VISIBLE ?AUTO_3112 ?AUTO_3107 ) ( not ( = ?AUTO_3107 ?AUTO_3112 ) ) ( not ( = ?AUTO_3109 ?AUTO_3112 ) ) ( FULL ?AUTO_3110 ) )
    :subtasks
    ( ( !DROP ?AUTO_3108 ?AUTO_3110 )
      ( GET_SOIL_DATA ?AUTO_3107 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3107 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3124 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3129 - LANDER
      ?AUTO_3128 - WAYPOINT
      ?AUTO_3130 - ROVER
      ?AUTO_3125 - STORE
      ?AUTO_3126 - WAYPOINT
      ?AUTO_3127 - WAYPOINT
      ?AUTO_3131 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3129 ?AUTO_3128 ) ( VISIBLE ?AUTO_3124 ?AUTO_3128 ) ( AVAILABLE ?AUTO_3130 ) ( CHANNEL_FREE ?AUTO_3129 ) ( not ( = ?AUTO_3124 ?AUTO_3128 ) ) ( AT_SOIL_SAMPLE ?AUTO_3124 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3130 ) ( STORE_OF ?AUTO_3125 ?AUTO_3130 ) ( EMPTY ?AUTO_3125 ) ( CAN_TRAVERSE ?AUTO_3130 ?AUTO_3126 ?AUTO_3124 ) ( VISIBLE ?AUTO_3126 ?AUTO_3124 ) ( not ( = ?AUTO_3124 ?AUTO_3126 ) ) ( not ( = ?AUTO_3128 ?AUTO_3126 ) ) ( CAN_TRAVERSE ?AUTO_3130 ?AUTO_3127 ?AUTO_3126 ) ( VISIBLE ?AUTO_3127 ?AUTO_3126 ) ( not ( = ?AUTO_3124 ?AUTO_3127 ) ) ( not ( = ?AUTO_3128 ?AUTO_3127 ) ) ( not ( = ?AUTO_3126 ?AUTO_3127 ) ) ( CAN_TRAVERSE ?AUTO_3130 ?AUTO_3131 ?AUTO_3127 ) ( AT ?AUTO_3130 ?AUTO_3131 ) ( VISIBLE ?AUTO_3131 ?AUTO_3127 ) ( not ( = ?AUTO_3124 ?AUTO_3131 ) ) ( not ( = ?AUTO_3128 ?AUTO_3131 ) ) ( not ( = ?AUTO_3126 ?AUTO_3131 ) ) ( not ( = ?AUTO_3127 ?AUTO_3131 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3130 ?AUTO_3131 ?AUTO_3127 )
      ( GET_SOIL_DATA ?AUTO_3124 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3124 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3174 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3179 - LANDER
      ?AUTO_3180 - WAYPOINT
      ?AUTO_3175 - ROVER
      ?AUTO_3178 - STORE
      ?AUTO_3177 - WAYPOINT
      ?AUTO_3176 - WAYPOINT
      ?AUTO_3181 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3179 ?AUTO_3180 ) ( VISIBLE ?AUTO_3174 ?AUTO_3180 ) ( AVAILABLE ?AUTO_3175 ) ( CHANNEL_FREE ?AUTO_3179 ) ( not ( = ?AUTO_3174 ?AUTO_3180 ) ) ( AT_ROCK_SAMPLE ?AUTO_3174 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3175 ) ( STORE_OF ?AUTO_3178 ?AUTO_3175 ) ( EMPTY ?AUTO_3178 ) ( CAN_TRAVERSE ?AUTO_3175 ?AUTO_3177 ?AUTO_3174 ) ( VISIBLE ?AUTO_3177 ?AUTO_3174 ) ( not ( = ?AUTO_3174 ?AUTO_3177 ) ) ( not ( = ?AUTO_3180 ?AUTO_3177 ) ) ( CAN_TRAVERSE ?AUTO_3175 ?AUTO_3176 ?AUTO_3177 ) ( VISIBLE ?AUTO_3176 ?AUTO_3177 ) ( not ( = ?AUTO_3174 ?AUTO_3176 ) ) ( not ( = ?AUTO_3180 ?AUTO_3176 ) ) ( not ( = ?AUTO_3177 ?AUTO_3176 ) ) ( CAN_TRAVERSE ?AUTO_3175 ?AUTO_3181 ?AUTO_3176 ) ( AT ?AUTO_3175 ?AUTO_3181 ) ( VISIBLE ?AUTO_3181 ?AUTO_3176 ) ( not ( = ?AUTO_3174 ?AUTO_3181 ) ) ( not ( = ?AUTO_3180 ?AUTO_3181 ) ) ( not ( = ?AUTO_3177 ?AUTO_3181 ) ) ( not ( = ?AUTO_3176 ?AUTO_3181 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3175 ?AUTO_3181 ?AUTO_3176 )
      ( GET_ROCK_DATA ?AUTO_3174 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3174 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3265 - OBJECTIVE
      ?AUTO_3266 - MODE
    )
    :vars
    (
      ?AUTO_3272 - LANDER
      ?AUTO_3271 - WAYPOINT
      ?AUTO_3269 - WAYPOINT
      ?AUTO_3267 - ROVER
      ?AUTO_3273 - CAMERA
      ?AUTO_3268 - WAYPOINT
      ?AUTO_3270 - WAYPOINT
      ?AUTO_3274 - OBJECTIVE
      ?AUTO_3275 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3272 ?AUTO_3271 ) ( VISIBLE ?AUTO_3269 ?AUTO_3271 ) ( AVAILABLE ?AUTO_3267 ) ( CHANNEL_FREE ?AUTO_3272 ) ( not ( = ?AUTO_3269 ?AUTO_3271 ) ) ( CAN_TRAVERSE ?AUTO_3267 ?AUTO_3271 ?AUTO_3269 ) ( VISIBLE ?AUTO_3271 ?AUTO_3269 ) ( ON_BOARD ?AUTO_3273 ?AUTO_3267 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3267 ) ( SUPPORTS ?AUTO_3273 ?AUTO_3266 ) ( VISIBLE_FROM ?AUTO_3265 ?AUTO_3271 ) ( CAN_TRAVERSE ?AUTO_3267 ?AUTO_3268 ?AUTO_3271 ) ( VISIBLE ?AUTO_3268 ?AUTO_3271 ) ( not ( = ?AUTO_3271 ?AUTO_3268 ) ) ( not ( = ?AUTO_3269 ?AUTO_3268 ) ) ( CAN_TRAVERSE ?AUTO_3267 ?AUTO_3270 ?AUTO_3268 ) ( VISIBLE ?AUTO_3270 ?AUTO_3268 ) ( not ( = ?AUTO_3271 ?AUTO_3270 ) ) ( not ( = ?AUTO_3269 ?AUTO_3270 ) ) ( not ( = ?AUTO_3268 ?AUTO_3270 ) ) ( CALIBRATION_TARGET ?AUTO_3273 ?AUTO_3274 ) ( VISIBLE_FROM ?AUTO_3274 ?AUTO_3270 ) ( not ( = ?AUTO_3265 ?AUTO_3274 ) ) ( CAN_TRAVERSE ?AUTO_3267 ?AUTO_3275 ?AUTO_3270 ) ( VISIBLE ?AUTO_3275 ?AUTO_3270 ) ( not ( = ?AUTO_3271 ?AUTO_3275 ) ) ( not ( = ?AUTO_3269 ?AUTO_3275 ) ) ( not ( = ?AUTO_3268 ?AUTO_3275 ) ) ( not ( = ?AUTO_3270 ?AUTO_3275 ) ) ( CAN_TRAVERSE ?AUTO_3267 ?AUTO_3269 ?AUTO_3275 ) ( AT ?AUTO_3267 ?AUTO_3269 ) ( VISIBLE ?AUTO_3269 ?AUTO_3275 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3267 ?AUTO_3269 ?AUTO_3275 )
      ( GET_IMAGE_DATA ?AUTO_3265 ?AUTO_3266 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3265 ?AUTO_3266 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3323 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3327 - LANDER
      ?AUTO_3324 - WAYPOINT
      ?AUTO_3328 - ROVER
      ?AUTO_3326 - STORE
      ?AUTO_3325 - WAYPOINT
      ?AUTO_3329 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3327 ?AUTO_3324 ) ( VISIBLE ?AUTO_3323 ?AUTO_3324 ) ( AVAILABLE ?AUTO_3328 ) ( CHANNEL_FREE ?AUTO_3327 ) ( not ( = ?AUTO_3323 ?AUTO_3324 ) ) ( AT_SOIL_SAMPLE ?AUTO_3323 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3328 ) ( STORE_OF ?AUTO_3326 ?AUTO_3328 ) ( CAN_TRAVERSE ?AUTO_3328 ?AUTO_3324 ?AUTO_3323 ) ( VISIBLE ?AUTO_3324 ?AUTO_3323 ) ( CAN_TRAVERSE ?AUTO_3328 ?AUTO_3325 ?AUTO_3324 ) ( VISIBLE ?AUTO_3325 ?AUTO_3324 ) ( not ( = ?AUTO_3323 ?AUTO_3325 ) ) ( not ( = ?AUTO_3324 ?AUTO_3325 ) ) ( AT_ROCK_SAMPLE ?AUTO_3325 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3328 ) ( CAN_TRAVERSE ?AUTO_3328 ?AUTO_3329 ?AUTO_3325 ) ( AT ?AUTO_3328 ?AUTO_3329 ) ( VISIBLE ?AUTO_3329 ?AUTO_3325 ) ( not ( = ?AUTO_3323 ?AUTO_3329 ) ) ( not ( = ?AUTO_3324 ?AUTO_3329 ) ) ( not ( = ?AUTO_3325 ?AUTO_3329 ) ) ( FULL ?AUTO_3326 ) )
    :subtasks
    ( ( !DROP ?AUTO_3328 ?AUTO_3326 )
      ( GET_SOIL_DATA ?AUTO_3323 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3323 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3369 - OBJECTIVE
      ?AUTO_3370 - MODE
    )
    :vars
    (
      ?AUTO_3374 - LANDER
      ?AUTO_3375 - WAYPOINT
      ?AUTO_3371 - WAYPOINT
      ?AUTO_3372 - ROVER
      ?AUTO_3376 - WAYPOINT
      ?AUTO_3373 - CAMERA
      ?AUTO_3377 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3374 ?AUTO_3375 ) ( VISIBLE ?AUTO_3371 ?AUTO_3375 ) ( AVAILABLE ?AUTO_3372 ) ( CHANNEL_FREE ?AUTO_3374 ) ( not ( = ?AUTO_3371 ?AUTO_3375 ) ) ( CAN_TRAVERSE ?AUTO_3372 ?AUTO_3376 ?AUTO_3371 ) ( VISIBLE ?AUTO_3376 ?AUTO_3371 ) ( not ( = ?AUTO_3375 ?AUTO_3376 ) ) ( not ( = ?AUTO_3371 ?AUTO_3376 ) ) ( ON_BOARD ?AUTO_3373 ?AUTO_3372 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3372 ) ( SUPPORTS ?AUTO_3373 ?AUTO_3370 ) ( VISIBLE_FROM ?AUTO_3369 ?AUTO_3376 ) ( CALIBRATION_TARGET ?AUTO_3373 ?AUTO_3369 ) ( CAN_TRAVERSE ?AUTO_3372 ?AUTO_3371 ?AUTO_3376 ) ( VISIBLE ?AUTO_3371 ?AUTO_3376 ) ( CAN_TRAVERSE ?AUTO_3372 ?AUTO_3377 ?AUTO_3371 ) ( AT ?AUTO_3372 ?AUTO_3377 ) ( VISIBLE ?AUTO_3377 ?AUTO_3371 ) ( not ( = ?AUTO_3375 ?AUTO_3377 ) ) ( not ( = ?AUTO_3371 ?AUTO_3377 ) ) ( not ( = ?AUTO_3376 ?AUTO_3377 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3372 ?AUTO_3377 ?AUTO_3371 )
      ( GET_IMAGE_DATA ?AUTO_3369 ?AUTO_3370 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3369 ?AUTO_3370 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3378 - OBJECTIVE
      ?AUTO_3379 - MODE
    )
    :vars
    (
      ?AUTO_3380 - LANDER
      ?AUTO_3386 - WAYPOINT
      ?AUTO_3385 - WAYPOINT
      ?AUTO_3383 - ROVER
      ?AUTO_3381 - WAYPOINT
      ?AUTO_3382 - CAMERA
      ?AUTO_3384 - WAYPOINT
      ?AUTO_3387 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3380 ?AUTO_3386 ) ( VISIBLE ?AUTO_3385 ?AUTO_3386 ) ( AVAILABLE ?AUTO_3383 ) ( CHANNEL_FREE ?AUTO_3380 ) ( not ( = ?AUTO_3385 ?AUTO_3386 ) ) ( CAN_TRAVERSE ?AUTO_3383 ?AUTO_3381 ?AUTO_3385 ) ( VISIBLE ?AUTO_3381 ?AUTO_3385 ) ( not ( = ?AUTO_3386 ?AUTO_3381 ) ) ( not ( = ?AUTO_3385 ?AUTO_3381 ) ) ( ON_BOARD ?AUTO_3382 ?AUTO_3383 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3383 ) ( SUPPORTS ?AUTO_3382 ?AUTO_3379 ) ( VISIBLE_FROM ?AUTO_3378 ?AUTO_3381 ) ( CALIBRATION_TARGET ?AUTO_3382 ?AUTO_3378 ) ( CAN_TRAVERSE ?AUTO_3383 ?AUTO_3385 ?AUTO_3381 ) ( VISIBLE ?AUTO_3385 ?AUTO_3381 ) ( CAN_TRAVERSE ?AUTO_3383 ?AUTO_3384 ?AUTO_3385 ) ( VISIBLE ?AUTO_3384 ?AUTO_3385 ) ( not ( = ?AUTO_3386 ?AUTO_3384 ) ) ( not ( = ?AUTO_3385 ?AUTO_3384 ) ) ( not ( = ?AUTO_3381 ?AUTO_3384 ) ) ( CAN_TRAVERSE ?AUTO_3383 ?AUTO_3387 ?AUTO_3384 ) ( AT ?AUTO_3383 ?AUTO_3387 ) ( VISIBLE ?AUTO_3387 ?AUTO_3384 ) ( not ( = ?AUTO_3386 ?AUTO_3387 ) ) ( not ( = ?AUTO_3385 ?AUTO_3387 ) ) ( not ( = ?AUTO_3381 ?AUTO_3387 ) ) ( not ( = ?AUTO_3384 ?AUTO_3387 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3383 ?AUTO_3387 ?AUTO_3384 )
      ( GET_IMAGE_DATA ?AUTO_3378 ?AUTO_3379 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3378 ?AUTO_3379 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3429 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3431 - LANDER
      ?AUTO_3430 - WAYPOINT
      ?AUTO_3433 - WAYPOINT
      ?AUTO_3432 - ROVER
      ?AUTO_3434 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3431 ?AUTO_3430 ) ( VISIBLE ?AUTO_3433 ?AUTO_3430 ) ( AVAILABLE ?AUTO_3432 ) ( CHANNEL_FREE ?AUTO_3431 ) ( not ( = ?AUTO_3429 ?AUTO_3433 ) ) ( not ( = ?AUTO_3429 ?AUTO_3430 ) ) ( not ( = ?AUTO_3433 ?AUTO_3430 ) ) ( CAN_TRAVERSE ?AUTO_3432 ?AUTO_3429 ?AUTO_3433 ) ( VISIBLE ?AUTO_3429 ?AUTO_3433 ) ( AT_SOIL_SAMPLE ?AUTO_3429 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3432 ) ( STORE_OF ?AUTO_3434 ?AUTO_3432 ) ( EMPTY ?AUTO_3434 ) ( CAN_TRAVERSE ?AUTO_3432 ?AUTO_3433 ?AUTO_3429 ) ( AT ?AUTO_3432 ?AUTO_3433 ) ( VISIBLE ?AUTO_3433 ?AUTO_3429 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3432 ?AUTO_3433 ?AUTO_3429 )
      ( GET_SOIL_DATA ?AUTO_3429 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3429 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3435 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3436 - LANDER
      ?AUTO_3440 - WAYPOINT
      ?AUTO_3438 - WAYPOINT
      ?AUTO_3439 - ROVER
      ?AUTO_3437 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3436 ?AUTO_3440 ) ( VISIBLE ?AUTO_3438 ?AUTO_3440 ) ( AVAILABLE ?AUTO_3439 ) ( CHANNEL_FREE ?AUTO_3436 ) ( not ( = ?AUTO_3435 ?AUTO_3438 ) ) ( not ( = ?AUTO_3435 ?AUTO_3440 ) ) ( not ( = ?AUTO_3438 ?AUTO_3440 ) ) ( CAN_TRAVERSE ?AUTO_3439 ?AUTO_3435 ?AUTO_3438 ) ( VISIBLE ?AUTO_3435 ?AUTO_3438 ) ( AT_SOIL_SAMPLE ?AUTO_3435 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3439 ) ( STORE_OF ?AUTO_3437 ?AUTO_3439 ) ( CAN_TRAVERSE ?AUTO_3439 ?AUTO_3438 ?AUTO_3435 ) ( AT ?AUTO_3439 ?AUTO_3438 ) ( VISIBLE ?AUTO_3438 ?AUTO_3435 ) ( FULL ?AUTO_3437 ) )
    :subtasks
    ( ( !DROP ?AUTO_3439 ?AUTO_3437 )
      ( GET_SOIL_DATA ?AUTO_3435 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3435 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3441 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3443 - LANDER
      ?AUTO_3442 - WAYPOINT
      ?AUTO_3445 - WAYPOINT
      ?AUTO_3446 - ROVER
      ?AUTO_3444 - STORE
      ?AUTO_3447 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3443 ?AUTO_3442 ) ( VISIBLE ?AUTO_3445 ?AUTO_3442 ) ( AVAILABLE ?AUTO_3446 ) ( CHANNEL_FREE ?AUTO_3443 ) ( not ( = ?AUTO_3441 ?AUTO_3445 ) ) ( not ( = ?AUTO_3441 ?AUTO_3442 ) ) ( not ( = ?AUTO_3445 ?AUTO_3442 ) ) ( CAN_TRAVERSE ?AUTO_3446 ?AUTO_3441 ?AUTO_3445 ) ( VISIBLE ?AUTO_3441 ?AUTO_3445 ) ( AT_SOIL_SAMPLE ?AUTO_3441 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3446 ) ( STORE_OF ?AUTO_3444 ?AUTO_3446 ) ( CAN_TRAVERSE ?AUTO_3446 ?AUTO_3445 ?AUTO_3441 ) ( VISIBLE ?AUTO_3445 ?AUTO_3441 ) ( FULL ?AUTO_3444 ) ( CAN_TRAVERSE ?AUTO_3446 ?AUTO_3447 ?AUTO_3445 ) ( AT ?AUTO_3446 ?AUTO_3447 ) ( VISIBLE ?AUTO_3447 ?AUTO_3445 ) ( not ( = ?AUTO_3441 ?AUTO_3447 ) ) ( not ( = ?AUTO_3442 ?AUTO_3447 ) ) ( not ( = ?AUTO_3445 ?AUTO_3447 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3446 ?AUTO_3447 ?AUTO_3445 )
      ( GET_SOIL_DATA ?AUTO_3441 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3441 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3449 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3451 - LANDER
      ?AUTO_3454 - WAYPOINT
      ?AUTO_3450 - WAYPOINT
      ?AUTO_3455 - ROVER
      ?AUTO_3452 - STORE
      ?AUTO_3453 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3451 ?AUTO_3454 ) ( VISIBLE ?AUTO_3450 ?AUTO_3454 ) ( AVAILABLE ?AUTO_3455 ) ( CHANNEL_FREE ?AUTO_3451 ) ( not ( = ?AUTO_3449 ?AUTO_3450 ) ) ( not ( = ?AUTO_3449 ?AUTO_3454 ) ) ( not ( = ?AUTO_3450 ?AUTO_3454 ) ) ( CAN_TRAVERSE ?AUTO_3455 ?AUTO_3449 ?AUTO_3450 ) ( VISIBLE ?AUTO_3449 ?AUTO_3450 ) ( AT_SOIL_SAMPLE ?AUTO_3449 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3455 ) ( STORE_OF ?AUTO_3452 ?AUTO_3455 ) ( CAN_TRAVERSE ?AUTO_3455 ?AUTO_3450 ?AUTO_3449 ) ( VISIBLE ?AUTO_3450 ?AUTO_3449 ) ( CAN_TRAVERSE ?AUTO_3455 ?AUTO_3453 ?AUTO_3450 ) ( AT ?AUTO_3455 ?AUTO_3453 ) ( VISIBLE ?AUTO_3453 ?AUTO_3450 ) ( not ( = ?AUTO_3449 ?AUTO_3453 ) ) ( not ( = ?AUTO_3454 ?AUTO_3453 ) ) ( not ( = ?AUTO_3450 ?AUTO_3453 ) ) ( AT_SOIL_SAMPLE ?AUTO_3453 ) ( EMPTY ?AUTO_3452 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_3455 ?AUTO_3452 ?AUTO_3453 )
      ( GET_SOIL_DATA ?AUTO_3449 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3449 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3463 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3466 - LANDER
      ?AUTO_3467 - WAYPOINT
      ?AUTO_3468 - WAYPOINT
      ?AUTO_3464 - ROVER
      ?AUTO_3469 - STORE
      ?AUTO_3465 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3466 ?AUTO_3467 ) ( VISIBLE ?AUTO_3468 ?AUTO_3467 ) ( AVAILABLE ?AUTO_3464 ) ( CHANNEL_FREE ?AUTO_3466 ) ( not ( = ?AUTO_3463 ?AUTO_3468 ) ) ( not ( = ?AUTO_3463 ?AUTO_3467 ) ) ( not ( = ?AUTO_3468 ?AUTO_3467 ) ) ( CAN_TRAVERSE ?AUTO_3464 ?AUTO_3463 ?AUTO_3468 ) ( VISIBLE ?AUTO_3463 ?AUTO_3468 ) ( AT_SOIL_SAMPLE ?AUTO_3463 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3464 ) ( STORE_OF ?AUTO_3469 ?AUTO_3464 ) ( CAN_TRAVERSE ?AUTO_3464 ?AUTO_3468 ?AUTO_3463 ) ( VISIBLE ?AUTO_3468 ?AUTO_3463 ) ( CAN_TRAVERSE ?AUTO_3464 ?AUTO_3465 ?AUTO_3468 ) ( VISIBLE ?AUTO_3465 ?AUTO_3468 ) ( not ( = ?AUTO_3463 ?AUTO_3465 ) ) ( not ( = ?AUTO_3467 ?AUTO_3465 ) ) ( not ( = ?AUTO_3468 ?AUTO_3465 ) ) ( AT_SOIL_SAMPLE ?AUTO_3465 ) ( EMPTY ?AUTO_3469 ) ( CAN_TRAVERSE ?AUTO_3464 ?AUTO_3467 ?AUTO_3465 ) ( AT ?AUTO_3464 ?AUTO_3467 ) ( VISIBLE ?AUTO_3467 ?AUTO_3465 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3464 ?AUTO_3467 ?AUTO_3465 )
      ( GET_SOIL_DATA ?AUTO_3463 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3463 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3571 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3575 - LANDER
      ?AUTO_3576 - WAYPOINT
      ?AUTO_3573 - WAYPOINT
      ?AUTO_3574 - ROVER
      ?AUTO_3572 - WAYPOINT
      ?AUTO_3577 - STORE
      ?AUTO_3578 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3575 ?AUTO_3576 ) ( VISIBLE ?AUTO_3573 ?AUTO_3576 ) ( AVAILABLE ?AUTO_3574 ) ( CHANNEL_FREE ?AUTO_3575 ) ( not ( = ?AUTO_3571 ?AUTO_3573 ) ) ( not ( = ?AUTO_3571 ?AUTO_3576 ) ) ( not ( = ?AUTO_3573 ?AUTO_3576 ) ) ( CAN_TRAVERSE ?AUTO_3574 ?AUTO_3572 ?AUTO_3573 ) ( VISIBLE ?AUTO_3572 ?AUTO_3573 ) ( not ( = ?AUTO_3571 ?AUTO_3572 ) ) ( not ( = ?AUTO_3576 ?AUTO_3572 ) ) ( not ( = ?AUTO_3573 ?AUTO_3572 ) ) ( CAN_TRAVERSE ?AUTO_3574 ?AUTO_3571 ?AUTO_3572 ) ( VISIBLE ?AUTO_3571 ?AUTO_3572 ) ( AT_ROCK_SAMPLE ?AUTO_3571 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3574 ) ( STORE_OF ?AUTO_3577 ?AUTO_3574 ) ( EMPTY ?AUTO_3577 ) ( CAN_TRAVERSE ?AUTO_3574 ?AUTO_3578 ?AUTO_3571 ) ( AT ?AUTO_3574 ?AUTO_3578 ) ( VISIBLE ?AUTO_3578 ?AUTO_3571 ) ( not ( = ?AUTO_3571 ?AUTO_3578 ) ) ( not ( = ?AUTO_3576 ?AUTO_3578 ) ) ( not ( = ?AUTO_3573 ?AUTO_3578 ) ) ( not ( = ?AUTO_3572 ?AUTO_3578 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3574 ?AUTO_3578 ?AUTO_3571 )
      ( GET_ROCK_DATA ?AUTO_3571 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3571 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3579 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3581 - LANDER
      ?AUTO_3582 - WAYPOINT
      ?AUTO_3580 - WAYPOINT
      ?AUTO_3585 - ROVER
      ?AUTO_3583 - WAYPOINT
      ?AUTO_3584 - STORE
      ?AUTO_3586 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3581 ?AUTO_3582 ) ( VISIBLE ?AUTO_3580 ?AUTO_3582 ) ( AVAILABLE ?AUTO_3585 ) ( CHANNEL_FREE ?AUTO_3581 ) ( not ( = ?AUTO_3579 ?AUTO_3580 ) ) ( not ( = ?AUTO_3579 ?AUTO_3582 ) ) ( not ( = ?AUTO_3580 ?AUTO_3582 ) ) ( CAN_TRAVERSE ?AUTO_3585 ?AUTO_3583 ?AUTO_3580 ) ( VISIBLE ?AUTO_3583 ?AUTO_3580 ) ( not ( = ?AUTO_3579 ?AUTO_3583 ) ) ( not ( = ?AUTO_3582 ?AUTO_3583 ) ) ( not ( = ?AUTO_3580 ?AUTO_3583 ) ) ( CAN_TRAVERSE ?AUTO_3585 ?AUTO_3579 ?AUTO_3583 ) ( VISIBLE ?AUTO_3579 ?AUTO_3583 ) ( AT_ROCK_SAMPLE ?AUTO_3579 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3585 ) ( STORE_OF ?AUTO_3584 ?AUTO_3585 ) ( CAN_TRAVERSE ?AUTO_3585 ?AUTO_3586 ?AUTO_3579 ) ( AT ?AUTO_3585 ?AUTO_3586 ) ( VISIBLE ?AUTO_3586 ?AUTO_3579 ) ( not ( = ?AUTO_3579 ?AUTO_3586 ) ) ( not ( = ?AUTO_3582 ?AUTO_3586 ) ) ( not ( = ?AUTO_3580 ?AUTO_3586 ) ) ( not ( = ?AUTO_3583 ?AUTO_3586 ) ) ( FULL ?AUTO_3584 ) )
    :subtasks
    ( ( !DROP ?AUTO_3585 ?AUTO_3584 )
      ( GET_ROCK_DATA ?AUTO_3579 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3579 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3596 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3603 - LANDER
      ?AUTO_3600 - WAYPOINT
      ?AUTO_3598 - WAYPOINT
      ?AUTO_3599 - ROVER
      ?AUTO_3601 - WAYPOINT
      ?AUTO_3602 - STORE
      ?AUTO_3597 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3603 ?AUTO_3600 ) ( VISIBLE ?AUTO_3598 ?AUTO_3600 ) ( AVAILABLE ?AUTO_3599 ) ( CHANNEL_FREE ?AUTO_3603 ) ( not ( = ?AUTO_3596 ?AUTO_3598 ) ) ( not ( = ?AUTO_3596 ?AUTO_3600 ) ) ( not ( = ?AUTO_3598 ?AUTO_3600 ) ) ( CAN_TRAVERSE ?AUTO_3599 ?AUTO_3601 ?AUTO_3598 ) ( VISIBLE ?AUTO_3601 ?AUTO_3598 ) ( not ( = ?AUTO_3596 ?AUTO_3601 ) ) ( not ( = ?AUTO_3600 ?AUTO_3601 ) ) ( not ( = ?AUTO_3598 ?AUTO_3601 ) ) ( CAN_TRAVERSE ?AUTO_3599 ?AUTO_3596 ?AUTO_3601 ) ( VISIBLE ?AUTO_3596 ?AUTO_3601 ) ( AT_ROCK_SAMPLE ?AUTO_3596 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3599 ) ( STORE_OF ?AUTO_3602 ?AUTO_3599 ) ( EMPTY ?AUTO_3602 ) ( CAN_TRAVERSE ?AUTO_3599 ?AUTO_3597 ?AUTO_3596 ) ( VISIBLE ?AUTO_3597 ?AUTO_3596 ) ( not ( = ?AUTO_3596 ?AUTO_3597 ) ) ( not ( = ?AUTO_3600 ?AUTO_3597 ) ) ( not ( = ?AUTO_3598 ?AUTO_3597 ) ) ( not ( = ?AUTO_3601 ?AUTO_3597 ) ) ( CAN_TRAVERSE ?AUTO_3599 ?AUTO_3598 ?AUTO_3597 ) ( AT ?AUTO_3599 ?AUTO_3598 ) ( VISIBLE ?AUTO_3598 ?AUTO_3597 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3599 ?AUTO_3598 ?AUTO_3597 )
      ( GET_ROCK_DATA ?AUTO_3596 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3596 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3629 - OBJECTIVE
      ?AUTO_3628 - MODE
    )
    :vars
    (
      ?AUTO_3633 - LANDER
      ?AUTO_3631 - WAYPOINT
      ?AUTO_3632 - WAYPOINT
      ?AUTO_3634 - ROVER
      ?AUTO_3630 - CAMERA
      ?AUTO_3635 - WAYPOINT
      ?AUTO_3636 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3633 ?AUTO_3631 ) ( VISIBLE ?AUTO_3632 ?AUTO_3631 ) ( AVAILABLE ?AUTO_3634 ) ( CHANNEL_FREE ?AUTO_3633 ) ( not ( = ?AUTO_3632 ?AUTO_3631 ) ) ( CALIBRATED ?AUTO_3630 ?AUTO_3634 ) ( ON_BOARD ?AUTO_3630 ?AUTO_3634 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3634 ) ( SUPPORTS ?AUTO_3630 ?AUTO_3628 ) ( VISIBLE_FROM ?AUTO_3629 ?AUTO_3632 ) ( CAN_TRAVERSE ?AUTO_3634 ?AUTO_3635 ?AUTO_3632 ) ( VISIBLE ?AUTO_3635 ?AUTO_3632 ) ( not ( = ?AUTO_3631 ?AUTO_3635 ) ) ( not ( = ?AUTO_3632 ?AUTO_3635 ) ) ( CAN_TRAVERSE ?AUTO_3634 ?AUTO_3636 ?AUTO_3635 ) ( AT ?AUTO_3634 ?AUTO_3636 ) ( VISIBLE ?AUTO_3636 ?AUTO_3635 ) ( not ( = ?AUTO_3631 ?AUTO_3636 ) ) ( not ( = ?AUTO_3632 ?AUTO_3636 ) ) ( not ( = ?AUTO_3635 ?AUTO_3636 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3634 ?AUTO_3636 ?AUTO_3635 )
      ( GET_IMAGE_DATA ?AUTO_3629 ?AUTO_3628 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3629 ?AUTO_3628 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3638 - OBJECTIVE
      ?AUTO_3637 - MODE
    )
    :vars
    (
      ?AUTO_3639 - LANDER
      ?AUTO_3641 - WAYPOINT
      ?AUTO_3643 - WAYPOINT
      ?AUTO_3640 - ROVER
      ?AUTO_3645 - CAMERA
      ?AUTO_3642 - WAYPOINT
      ?AUTO_3644 - WAYPOINT
      ?AUTO_3646 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3639 ?AUTO_3641 ) ( VISIBLE ?AUTO_3643 ?AUTO_3641 ) ( AVAILABLE ?AUTO_3640 ) ( CHANNEL_FREE ?AUTO_3639 ) ( not ( = ?AUTO_3643 ?AUTO_3641 ) ) ( CALIBRATED ?AUTO_3645 ?AUTO_3640 ) ( ON_BOARD ?AUTO_3645 ?AUTO_3640 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3640 ) ( SUPPORTS ?AUTO_3645 ?AUTO_3637 ) ( VISIBLE_FROM ?AUTO_3638 ?AUTO_3643 ) ( CAN_TRAVERSE ?AUTO_3640 ?AUTO_3642 ?AUTO_3643 ) ( VISIBLE ?AUTO_3642 ?AUTO_3643 ) ( not ( = ?AUTO_3641 ?AUTO_3642 ) ) ( not ( = ?AUTO_3643 ?AUTO_3642 ) ) ( CAN_TRAVERSE ?AUTO_3640 ?AUTO_3644 ?AUTO_3642 ) ( VISIBLE ?AUTO_3644 ?AUTO_3642 ) ( not ( = ?AUTO_3641 ?AUTO_3644 ) ) ( not ( = ?AUTO_3643 ?AUTO_3644 ) ) ( not ( = ?AUTO_3642 ?AUTO_3644 ) ) ( CAN_TRAVERSE ?AUTO_3640 ?AUTO_3646 ?AUTO_3644 ) ( AT ?AUTO_3640 ?AUTO_3646 ) ( VISIBLE ?AUTO_3646 ?AUTO_3644 ) ( not ( = ?AUTO_3641 ?AUTO_3646 ) ) ( not ( = ?AUTO_3643 ?AUTO_3646 ) ) ( not ( = ?AUTO_3642 ?AUTO_3646 ) ) ( not ( = ?AUTO_3644 ?AUTO_3646 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3640 ?AUTO_3646 ?AUTO_3644 )
      ( GET_IMAGE_DATA ?AUTO_3638 ?AUTO_3637 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3638 ?AUTO_3637 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3650 - OBJECTIVE
      ?AUTO_3649 - MODE
    )
    :vars
    (
      ?AUTO_3654 - LANDER
      ?AUTO_3657 - WAYPOINT
      ?AUTO_3656 - WAYPOINT
      ?AUTO_3651 - ROVER
      ?AUTO_3655 - CAMERA
      ?AUTO_3653 - WAYPOINT
      ?AUTO_3652 - WAYPOINT
      ?AUTO_3658 - WAYPOINT
      ?AUTO_3659 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3654 ?AUTO_3657 ) ( VISIBLE ?AUTO_3656 ?AUTO_3657 ) ( AVAILABLE ?AUTO_3651 ) ( CHANNEL_FREE ?AUTO_3654 ) ( not ( = ?AUTO_3656 ?AUTO_3657 ) ) ( CALIBRATED ?AUTO_3655 ?AUTO_3651 ) ( ON_BOARD ?AUTO_3655 ?AUTO_3651 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3651 ) ( SUPPORTS ?AUTO_3655 ?AUTO_3649 ) ( VISIBLE_FROM ?AUTO_3650 ?AUTO_3656 ) ( CAN_TRAVERSE ?AUTO_3651 ?AUTO_3653 ?AUTO_3656 ) ( VISIBLE ?AUTO_3653 ?AUTO_3656 ) ( not ( = ?AUTO_3657 ?AUTO_3653 ) ) ( not ( = ?AUTO_3656 ?AUTO_3653 ) ) ( CAN_TRAVERSE ?AUTO_3651 ?AUTO_3652 ?AUTO_3653 ) ( VISIBLE ?AUTO_3652 ?AUTO_3653 ) ( not ( = ?AUTO_3657 ?AUTO_3652 ) ) ( not ( = ?AUTO_3656 ?AUTO_3652 ) ) ( not ( = ?AUTO_3653 ?AUTO_3652 ) ) ( CAN_TRAVERSE ?AUTO_3651 ?AUTO_3658 ?AUTO_3652 ) ( VISIBLE ?AUTO_3658 ?AUTO_3652 ) ( not ( = ?AUTO_3657 ?AUTO_3658 ) ) ( not ( = ?AUTO_3656 ?AUTO_3658 ) ) ( not ( = ?AUTO_3653 ?AUTO_3658 ) ) ( not ( = ?AUTO_3652 ?AUTO_3658 ) ) ( CAN_TRAVERSE ?AUTO_3651 ?AUTO_3659 ?AUTO_3658 ) ( AT ?AUTO_3651 ?AUTO_3659 ) ( VISIBLE ?AUTO_3659 ?AUTO_3658 ) ( not ( = ?AUTO_3657 ?AUTO_3659 ) ) ( not ( = ?AUTO_3656 ?AUTO_3659 ) ) ( not ( = ?AUTO_3653 ?AUTO_3659 ) ) ( not ( = ?AUTO_3652 ?AUTO_3659 ) ) ( not ( = ?AUTO_3658 ?AUTO_3659 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3651 ?AUTO_3659 ?AUTO_3658 )
      ( GET_IMAGE_DATA ?AUTO_3650 ?AUTO_3649 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3650 ?AUTO_3649 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3661 - OBJECTIVE
      ?AUTO_3660 - MODE
    )
    :vars
    (
      ?AUTO_3664 - LANDER
      ?AUTO_3668 - WAYPOINT
      ?AUTO_3667 - WAYPOINT
      ?AUTO_3663 - ROVER
      ?AUTO_3666 - CAMERA
      ?AUTO_3665 - WAYPOINT
      ?AUTO_3669 - WAYPOINT
      ?AUTO_3662 - WAYPOINT
      ?AUTO_3670 - WAYPOINT
      ?AUTO_3671 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3664 ?AUTO_3668 ) ( VISIBLE ?AUTO_3667 ?AUTO_3668 ) ( AVAILABLE ?AUTO_3663 ) ( CHANNEL_FREE ?AUTO_3664 ) ( not ( = ?AUTO_3667 ?AUTO_3668 ) ) ( ON_BOARD ?AUTO_3666 ?AUTO_3663 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3663 ) ( SUPPORTS ?AUTO_3666 ?AUTO_3660 ) ( VISIBLE_FROM ?AUTO_3661 ?AUTO_3667 ) ( CAN_TRAVERSE ?AUTO_3663 ?AUTO_3665 ?AUTO_3667 ) ( VISIBLE ?AUTO_3665 ?AUTO_3667 ) ( not ( = ?AUTO_3668 ?AUTO_3665 ) ) ( not ( = ?AUTO_3667 ?AUTO_3665 ) ) ( CAN_TRAVERSE ?AUTO_3663 ?AUTO_3669 ?AUTO_3665 ) ( VISIBLE ?AUTO_3669 ?AUTO_3665 ) ( not ( = ?AUTO_3668 ?AUTO_3669 ) ) ( not ( = ?AUTO_3667 ?AUTO_3669 ) ) ( not ( = ?AUTO_3665 ?AUTO_3669 ) ) ( CAN_TRAVERSE ?AUTO_3663 ?AUTO_3662 ?AUTO_3669 ) ( VISIBLE ?AUTO_3662 ?AUTO_3669 ) ( not ( = ?AUTO_3668 ?AUTO_3662 ) ) ( not ( = ?AUTO_3667 ?AUTO_3662 ) ) ( not ( = ?AUTO_3665 ?AUTO_3662 ) ) ( not ( = ?AUTO_3669 ?AUTO_3662 ) ) ( CAN_TRAVERSE ?AUTO_3663 ?AUTO_3670 ?AUTO_3662 ) ( AT ?AUTO_3663 ?AUTO_3670 ) ( VISIBLE ?AUTO_3670 ?AUTO_3662 ) ( not ( = ?AUTO_3668 ?AUTO_3670 ) ) ( not ( = ?AUTO_3667 ?AUTO_3670 ) ) ( not ( = ?AUTO_3665 ?AUTO_3670 ) ) ( not ( = ?AUTO_3669 ?AUTO_3670 ) ) ( not ( = ?AUTO_3662 ?AUTO_3670 ) ) ( CALIBRATION_TARGET ?AUTO_3666 ?AUTO_3671 ) ( VISIBLE_FROM ?AUTO_3671 ?AUTO_3670 ) ( not ( = ?AUTO_3661 ?AUTO_3671 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_3663 ?AUTO_3666 ?AUTO_3671 ?AUTO_3670 )
      ( GET_IMAGE_DATA ?AUTO_3661 ?AUTO_3660 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3661 ?AUTO_3660 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3673 - OBJECTIVE
      ?AUTO_3672 - MODE
    )
    :vars
    (
      ?AUTO_3675 - LANDER
      ?AUTO_3680 - WAYPOINT
      ?AUTO_3679 - WAYPOINT
      ?AUTO_3682 - ROVER
      ?AUTO_3678 - CAMERA
      ?AUTO_3674 - WAYPOINT
      ?AUTO_3677 - WAYPOINT
      ?AUTO_3683 - WAYPOINT
      ?AUTO_3681 - WAYPOINT
      ?AUTO_3676 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3675 ?AUTO_3680 ) ( VISIBLE ?AUTO_3679 ?AUTO_3680 ) ( AVAILABLE ?AUTO_3682 ) ( CHANNEL_FREE ?AUTO_3675 ) ( not ( = ?AUTO_3679 ?AUTO_3680 ) ) ( ON_BOARD ?AUTO_3678 ?AUTO_3682 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3682 ) ( SUPPORTS ?AUTO_3678 ?AUTO_3672 ) ( VISIBLE_FROM ?AUTO_3673 ?AUTO_3679 ) ( CAN_TRAVERSE ?AUTO_3682 ?AUTO_3674 ?AUTO_3679 ) ( VISIBLE ?AUTO_3674 ?AUTO_3679 ) ( not ( = ?AUTO_3680 ?AUTO_3674 ) ) ( not ( = ?AUTO_3679 ?AUTO_3674 ) ) ( CAN_TRAVERSE ?AUTO_3682 ?AUTO_3677 ?AUTO_3674 ) ( VISIBLE ?AUTO_3677 ?AUTO_3674 ) ( not ( = ?AUTO_3680 ?AUTO_3677 ) ) ( not ( = ?AUTO_3679 ?AUTO_3677 ) ) ( not ( = ?AUTO_3674 ?AUTO_3677 ) ) ( CAN_TRAVERSE ?AUTO_3682 ?AUTO_3683 ?AUTO_3677 ) ( VISIBLE ?AUTO_3683 ?AUTO_3677 ) ( not ( = ?AUTO_3680 ?AUTO_3683 ) ) ( not ( = ?AUTO_3679 ?AUTO_3683 ) ) ( not ( = ?AUTO_3674 ?AUTO_3683 ) ) ( not ( = ?AUTO_3677 ?AUTO_3683 ) ) ( CAN_TRAVERSE ?AUTO_3682 ?AUTO_3681 ?AUTO_3683 ) ( VISIBLE ?AUTO_3681 ?AUTO_3683 ) ( not ( = ?AUTO_3680 ?AUTO_3681 ) ) ( not ( = ?AUTO_3679 ?AUTO_3681 ) ) ( not ( = ?AUTO_3674 ?AUTO_3681 ) ) ( not ( = ?AUTO_3677 ?AUTO_3681 ) ) ( not ( = ?AUTO_3683 ?AUTO_3681 ) ) ( CALIBRATION_TARGET ?AUTO_3678 ?AUTO_3676 ) ( VISIBLE_FROM ?AUTO_3676 ?AUTO_3681 ) ( not ( = ?AUTO_3673 ?AUTO_3676 ) ) ( CAN_TRAVERSE ?AUTO_3682 ?AUTO_3674 ?AUTO_3681 ) ( AT ?AUTO_3682 ?AUTO_3674 ) ( VISIBLE ?AUTO_3674 ?AUTO_3681 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3682 ?AUTO_3674 ?AUTO_3681 )
      ( GET_IMAGE_DATA ?AUTO_3673 ?AUTO_3672 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3673 ?AUTO_3672 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3687 - OBJECTIVE
      ?AUTO_3686 - MODE
    )
    :vars
    (
      ?AUTO_3688 - LANDER
      ?AUTO_3694 - WAYPOINT
      ?AUTO_3691 - WAYPOINT
      ?AUTO_3693 - ROVER
      ?AUTO_3690 - CAMERA
      ?AUTO_3696 - WAYPOINT
      ?AUTO_3697 - WAYPOINT
      ?AUTO_3689 - WAYPOINT
      ?AUTO_3695 - WAYPOINT
      ?AUTO_3692 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3688 ?AUTO_3694 ) ( VISIBLE ?AUTO_3691 ?AUTO_3694 ) ( AVAILABLE ?AUTO_3693 ) ( CHANNEL_FREE ?AUTO_3688 ) ( not ( = ?AUTO_3691 ?AUTO_3694 ) ) ( ON_BOARD ?AUTO_3690 ?AUTO_3693 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3693 ) ( SUPPORTS ?AUTO_3690 ?AUTO_3686 ) ( VISIBLE_FROM ?AUTO_3687 ?AUTO_3691 ) ( CAN_TRAVERSE ?AUTO_3693 ?AUTO_3696 ?AUTO_3691 ) ( VISIBLE ?AUTO_3696 ?AUTO_3691 ) ( not ( = ?AUTO_3694 ?AUTO_3696 ) ) ( not ( = ?AUTO_3691 ?AUTO_3696 ) ) ( CAN_TRAVERSE ?AUTO_3693 ?AUTO_3697 ?AUTO_3696 ) ( VISIBLE ?AUTO_3697 ?AUTO_3696 ) ( not ( = ?AUTO_3694 ?AUTO_3697 ) ) ( not ( = ?AUTO_3691 ?AUTO_3697 ) ) ( not ( = ?AUTO_3696 ?AUTO_3697 ) ) ( CAN_TRAVERSE ?AUTO_3693 ?AUTO_3689 ?AUTO_3697 ) ( VISIBLE ?AUTO_3689 ?AUTO_3697 ) ( not ( = ?AUTO_3694 ?AUTO_3689 ) ) ( not ( = ?AUTO_3691 ?AUTO_3689 ) ) ( not ( = ?AUTO_3696 ?AUTO_3689 ) ) ( not ( = ?AUTO_3697 ?AUTO_3689 ) ) ( CAN_TRAVERSE ?AUTO_3693 ?AUTO_3695 ?AUTO_3689 ) ( VISIBLE ?AUTO_3695 ?AUTO_3689 ) ( not ( = ?AUTO_3694 ?AUTO_3695 ) ) ( not ( = ?AUTO_3691 ?AUTO_3695 ) ) ( not ( = ?AUTO_3696 ?AUTO_3695 ) ) ( not ( = ?AUTO_3697 ?AUTO_3695 ) ) ( not ( = ?AUTO_3689 ?AUTO_3695 ) ) ( CALIBRATION_TARGET ?AUTO_3690 ?AUTO_3692 ) ( VISIBLE_FROM ?AUTO_3692 ?AUTO_3695 ) ( not ( = ?AUTO_3687 ?AUTO_3692 ) ) ( CAN_TRAVERSE ?AUTO_3693 ?AUTO_3696 ?AUTO_3695 ) ( VISIBLE ?AUTO_3696 ?AUTO_3695 ) ( AT ?AUTO_3693 ?AUTO_3697 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3693 ?AUTO_3697 ?AUTO_3696 )
      ( GET_IMAGE_DATA ?AUTO_3687 ?AUTO_3686 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3687 ?AUTO_3686 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3719 - OBJECTIVE
      ?AUTO_3718 - MODE
    )
    :vars
    (
      ?AUTO_3722 - LANDER
      ?AUTO_3727 - WAYPOINT
      ?AUTO_3728 - WAYPOINT
      ?AUTO_3720 - ROVER
      ?AUTO_3725 - CAMERA
      ?AUTO_3724 - WAYPOINT
      ?AUTO_3721 - WAYPOINT
      ?AUTO_3729 - WAYPOINT
      ?AUTO_3726 - WAYPOINT
      ?AUTO_3723 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3722 ?AUTO_3727 ) ( VISIBLE ?AUTO_3728 ?AUTO_3727 ) ( AVAILABLE ?AUTO_3720 ) ( CHANNEL_FREE ?AUTO_3722 ) ( not ( = ?AUTO_3728 ?AUTO_3727 ) ) ( ON_BOARD ?AUTO_3725 ?AUTO_3720 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3720 ) ( SUPPORTS ?AUTO_3725 ?AUTO_3718 ) ( VISIBLE_FROM ?AUTO_3719 ?AUTO_3728 ) ( CAN_TRAVERSE ?AUTO_3720 ?AUTO_3724 ?AUTO_3728 ) ( VISIBLE ?AUTO_3724 ?AUTO_3728 ) ( not ( = ?AUTO_3727 ?AUTO_3724 ) ) ( not ( = ?AUTO_3728 ?AUTO_3724 ) ) ( CAN_TRAVERSE ?AUTO_3720 ?AUTO_3721 ?AUTO_3724 ) ( VISIBLE ?AUTO_3721 ?AUTO_3724 ) ( not ( = ?AUTO_3727 ?AUTO_3721 ) ) ( not ( = ?AUTO_3728 ?AUTO_3721 ) ) ( not ( = ?AUTO_3724 ?AUTO_3721 ) ) ( CAN_TRAVERSE ?AUTO_3720 ?AUTO_3729 ?AUTO_3721 ) ( VISIBLE ?AUTO_3729 ?AUTO_3721 ) ( not ( = ?AUTO_3727 ?AUTO_3729 ) ) ( not ( = ?AUTO_3728 ?AUTO_3729 ) ) ( not ( = ?AUTO_3724 ?AUTO_3729 ) ) ( not ( = ?AUTO_3721 ?AUTO_3729 ) ) ( CAN_TRAVERSE ?AUTO_3720 ?AUTO_3726 ?AUTO_3729 ) ( VISIBLE ?AUTO_3726 ?AUTO_3729 ) ( not ( = ?AUTO_3727 ?AUTO_3726 ) ) ( not ( = ?AUTO_3728 ?AUTO_3726 ) ) ( not ( = ?AUTO_3724 ?AUTO_3726 ) ) ( not ( = ?AUTO_3721 ?AUTO_3726 ) ) ( not ( = ?AUTO_3729 ?AUTO_3726 ) ) ( CALIBRATION_TARGET ?AUTO_3725 ?AUTO_3723 ) ( VISIBLE_FROM ?AUTO_3723 ?AUTO_3726 ) ( not ( = ?AUTO_3719 ?AUTO_3723 ) ) ( CAN_TRAVERSE ?AUTO_3720 ?AUTO_3724 ?AUTO_3726 ) ( VISIBLE ?AUTO_3724 ?AUTO_3726 ) ( AT ?AUTO_3720 ?AUTO_3729 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3720 ?AUTO_3729 ?AUTO_3721 )
      ( GET_IMAGE_DATA ?AUTO_3719 ?AUTO_3718 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3719 ?AUTO_3718 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3731 - OBJECTIVE
      ?AUTO_3730 - MODE
    )
    :vars
    (
      ?AUTO_3737 - LANDER
      ?AUTO_3740 - WAYPOINT
      ?AUTO_3734 - WAYPOINT
      ?AUTO_3732 - ROVER
      ?AUTO_3741 - CAMERA
      ?AUTO_3736 - WAYPOINT
      ?AUTO_3738 - WAYPOINT
      ?AUTO_3735 - WAYPOINT
      ?AUTO_3739 - WAYPOINT
      ?AUTO_3733 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3737 ?AUTO_3740 ) ( VISIBLE ?AUTO_3734 ?AUTO_3740 ) ( AVAILABLE ?AUTO_3732 ) ( CHANNEL_FREE ?AUTO_3737 ) ( not ( = ?AUTO_3734 ?AUTO_3740 ) ) ( ON_BOARD ?AUTO_3741 ?AUTO_3732 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3732 ) ( SUPPORTS ?AUTO_3741 ?AUTO_3730 ) ( VISIBLE_FROM ?AUTO_3731 ?AUTO_3734 ) ( CAN_TRAVERSE ?AUTO_3732 ?AUTO_3736 ?AUTO_3734 ) ( VISIBLE ?AUTO_3736 ?AUTO_3734 ) ( not ( = ?AUTO_3740 ?AUTO_3736 ) ) ( not ( = ?AUTO_3734 ?AUTO_3736 ) ) ( CAN_TRAVERSE ?AUTO_3732 ?AUTO_3738 ?AUTO_3736 ) ( VISIBLE ?AUTO_3738 ?AUTO_3736 ) ( not ( = ?AUTO_3740 ?AUTO_3738 ) ) ( not ( = ?AUTO_3734 ?AUTO_3738 ) ) ( not ( = ?AUTO_3736 ?AUTO_3738 ) ) ( CAN_TRAVERSE ?AUTO_3732 ?AUTO_3735 ?AUTO_3738 ) ( VISIBLE ?AUTO_3735 ?AUTO_3738 ) ( not ( = ?AUTO_3740 ?AUTO_3735 ) ) ( not ( = ?AUTO_3734 ?AUTO_3735 ) ) ( not ( = ?AUTO_3736 ?AUTO_3735 ) ) ( not ( = ?AUTO_3738 ?AUTO_3735 ) ) ( CAN_TRAVERSE ?AUTO_3732 ?AUTO_3739 ?AUTO_3735 ) ( VISIBLE ?AUTO_3739 ?AUTO_3735 ) ( not ( = ?AUTO_3740 ?AUTO_3739 ) ) ( not ( = ?AUTO_3734 ?AUTO_3739 ) ) ( not ( = ?AUTO_3736 ?AUTO_3739 ) ) ( not ( = ?AUTO_3738 ?AUTO_3739 ) ) ( not ( = ?AUTO_3735 ?AUTO_3739 ) ) ( CALIBRATION_TARGET ?AUTO_3741 ?AUTO_3733 ) ( VISIBLE_FROM ?AUTO_3733 ?AUTO_3739 ) ( not ( = ?AUTO_3731 ?AUTO_3733 ) ) ( CAN_TRAVERSE ?AUTO_3732 ?AUTO_3736 ?AUTO_3739 ) ( VISIBLE ?AUTO_3736 ?AUTO_3739 ) ( CAN_TRAVERSE ?AUTO_3732 ?AUTO_3734 ?AUTO_3735 ) ( AT ?AUTO_3732 ?AUTO_3734 ) ( VISIBLE ?AUTO_3734 ?AUTO_3735 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3732 ?AUTO_3734 ?AUTO_3735 )
      ( GET_IMAGE_DATA ?AUTO_3731 ?AUTO_3730 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3731 ?AUTO_3730 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3812 - OBJECTIVE
      ?AUTO_3813 - MODE
    )
    :vars
    (
      ?AUTO_3817 - LANDER
      ?AUTO_3814 - WAYPOINT
      ?AUTO_3818 - WAYPOINT
      ?AUTO_3815 - ROVER
      ?AUTO_3816 - WAYPOINT
      ?AUTO_3819 - CAMERA
      ?AUTO_3820 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3817 ?AUTO_3814 ) ( VISIBLE ?AUTO_3818 ?AUTO_3814 ) ( AVAILABLE ?AUTO_3815 ) ( CHANNEL_FREE ?AUTO_3817 ) ( not ( = ?AUTO_3818 ?AUTO_3814 ) ) ( CAN_TRAVERSE ?AUTO_3815 ?AUTO_3816 ?AUTO_3818 ) ( VISIBLE ?AUTO_3816 ?AUTO_3818 ) ( not ( = ?AUTO_3814 ?AUTO_3816 ) ) ( not ( = ?AUTO_3818 ?AUTO_3816 ) ) ( ON_BOARD ?AUTO_3819 ?AUTO_3815 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3815 ) ( SUPPORTS ?AUTO_3819 ?AUTO_3813 ) ( VISIBLE_FROM ?AUTO_3812 ?AUTO_3816 ) ( CAN_TRAVERSE ?AUTO_3815 ?AUTO_3818 ?AUTO_3816 ) ( AT ?AUTO_3815 ?AUTO_3818 ) ( VISIBLE ?AUTO_3818 ?AUTO_3816 ) ( CALIBRATION_TARGET ?AUTO_3819 ?AUTO_3820 ) ( VISIBLE_FROM ?AUTO_3820 ?AUTO_3818 ) ( not ( = ?AUTO_3812 ?AUTO_3820 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_3815 ?AUTO_3819 ?AUTO_3820 ?AUTO_3818 )
      ( GET_IMAGE_DATA ?AUTO_3812 ?AUTO_3813 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3812 ?AUTO_3813 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3821 - OBJECTIVE
      ?AUTO_3822 - MODE
    )
    :vars
    (
      ?AUTO_3823 - LANDER
      ?AUTO_3828 - WAYPOINT
      ?AUTO_3824 - WAYPOINT
      ?AUTO_3825 - ROVER
      ?AUTO_3829 - WAYPOINT
      ?AUTO_3827 - CAMERA
      ?AUTO_3826 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3823 ?AUTO_3828 ) ( VISIBLE ?AUTO_3824 ?AUTO_3828 ) ( AVAILABLE ?AUTO_3825 ) ( CHANNEL_FREE ?AUTO_3823 ) ( not ( = ?AUTO_3824 ?AUTO_3828 ) ) ( CAN_TRAVERSE ?AUTO_3825 ?AUTO_3829 ?AUTO_3824 ) ( VISIBLE ?AUTO_3829 ?AUTO_3824 ) ( not ( = ?AUTO_3828 ?AUTO_3829 ) ) ( not ( = ?AUTO_3824 ?AUTO_3829 ) ) ( ON_BOARD ?AUTO_3827 ?AUTO_3825 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3825 ) ( SUPPORTS ?AUTO_3827 ?AUTO_3822 ) ( VISIBLE_FROM ?AUTO_3821 ?AUTO_3829 ) ( CAN_TRAVERSE ?AUTO_3825 ?AUTO_3824 ?AUTO_3829 ) ( VISIBLE ?AUTO_3824 ?AUTO_3829 ) ( CALIBRATION_TARGET ?AUTO_3827 ?AUTO_3826 ) ( VISIBLE_FROM ?AUTO_3826 ?AUTO_3824 ) ( not ( = ?AUTO_3821 ?AUTO_3826 ) ) ( AT ?AUTO_3825 ?AUTO_3829 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3825 ?AUTO_3829 ?AUTO_3824 )
      ( GET_IMAGE_DATA ?AUTO_3821 ?AUTO_3822 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3821 ?AUTO_3822 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3832 - OBJECTIVE
      ?AUTO_3833 - MODE
    )
    :vars
    (
      ?AUTO_3838 - LANDER
      ?AUTO_3834 - WAYPOINT
      ?AUTO_3840 - WAYPOINT
      ?AUTO_3837 - ROVER
      ?AUTO_3839 - WAYPOINT
      ?AUTO_3835 - CAMERA
      ?AUTO_3836 - OBJECTIVE
      ?AUTO_3841 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3838 ?AUTO_3834 ) ( VISIBLE ?AUTO_3840 ?AUTO_3834 ) ( AVAILABLE ?AUTO_3837 ) ( CHANNEL_FREE ?AUTO_3838 ) ( not ( = ?AUTO_3840 ?AUTO_3834 ) ) ( CAN_TRAVERSE ?AUTO_3837 ?AUTO_3839 ?AUTO_3840 ) ( VISIBLE ?AUTO_3839 ?AUTO_3840 ) ( not ( = ?AUTO_3834 ?AUTO_3839 ) ) ( not ( = ?AUTO_3840 ?AUTO_3839 ) ) ( ON_BOARD ?AUTO_3835 ?AUTO_3837 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3837 ) ( SUPPORTS ?AUTO_3835 ?AUTO_3833 ) ( VISIBLE_FROM ?AUTO_3832 ?AUTO_3839 ) ( CAN_TRAVERSE ?AUTO_3837 ?AUTO_3840 ?AUTO_3839 ) ( VISIBLE ?AUTO_3840 ?AUTO_3839 ) ( CALIBRATION_TARGET ?AUTO_3835 ?AUTO_3836 ) ( VISIBLE_FROM ?AUTO_3836 ?AUTO_3840 ) ( not ( = ?AUTO_3832 ?AUTO_3836 ) ) ( CAN_TRAVERSE ?AUTO_3837 ?AUTO_3841 ?AUTO_3839 ) ( AT ?AUTO_3837 ?AUTO_3841 ) ( VISIBLE ?AUTO_3841 ?AUTO_3839 ) ( not ( = ?AUTO_3834 ?AUTO_3841 ) ) ( not ( = ?AUTO_3840 ?AUTO_3841 ) ) ( not ( = ?AUTO_3839 ?AUTO_3841 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3837 ?AUTO_3841 ?AUTO_3839 )
      ( GET_IMAGE_DATA ?AUTO_3832 ?AUTO_3833 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3832 ?AUTO_3833 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3846 - OBJECTIVE
      ?AUTO_3847 - MODE
    )
    :vars
    (
      ?AUTO_3850 - LANDER
      ?AUTO_3849 - WAYPOINT
      ?AUTO_3848 - WAYPOINT
      ?AUTO_3852 - ROVER
      ?AUTO_3853 - WAYPOINT
      ?AUTO_3851 - CAMERA
      ?AUTO_3854 - OBJECTIVE
      ?AUTO_3855 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3850 ?AUTO_3849 ) ( VISIBLE ?AUTO_3848 ?AUTO_3849 ) ( AVAILABLE ?AUTO_3852 ) ( CHANNEL_FREE ?AUTO_3850 ) ( not ( = ?AUTO_3848 ?AUTO_3849 ) ) ( CAN_TRAVERSE ?AUTO_3852 ?AUTO_3853 ?AUTO_3848 ) ( VISIBLE ?AUTO_3853 ?AUTO_3848 ) ( not ( = ?AUTO_3849 ?AUTO_3853 ) ) ( not ( = ?AUTO_3848 ?AUTO_3853 ) ) ( ON_BOARD ?AUTO_3851 ?AUTO_3852 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3852 ) ( SUPPORTS ?AUTO_3851 ?AUTO_3847 ) ( VISIBLE_FROM ?AUTO_3846 ?AUTO_3853 ) ( CAN_TRAVERSE ?AUTO_3852 ?AUTO_3848 ?AUTO_3853 ) ( VISIBLE ?AUTO_3848 ?AUTO_3853 ) ( CALIBRATION_TARGET ?AUTO_3851 ?AUTO_3854 ) ( VISIBLE_FROM ?AUTO_3854 ?AUTO_3848 ) ( not ( = ?AUTO_3846 ?AUTO_3854 ) ) ( CAN_TRAVERSE ?AUTO_3852 ?AUTO_3855 ?AUTO_3853 ) ( VISIBLE ?AUTO_3855 ?AUTO_3853 ) ( not ( = ?AUTO_3849 ?AUTO_3855 ) ) ( not ( = ?AUTO_3848 ?AUTO_3855 ) ) ( not ( = ?AUTO_3853 ?AUTO_3855 ) ) ( CAN_TRAVERSE ?AUTO_3852 ?AUTO_3849 ?AUTO_3855 ) ( AT ?AUTO_3852 ?AUTO_3849 ) ( VISIBLE ?AUTO_3849 ?AUTO_3855 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3852 ?AUTO_3849 ?AUTO_3855 )
      ( GET_IMAGE_DATA ?AUTO_3846 ?AUTO_3847 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3846 ?AUTO_3847 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3991 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3994 - LANDER
      ?AUTO_3993 - WAYPOINT
      ?AUTO_3992 - ROVER
      ?AUTO_3996 - STORE
      ?AUTO_3995 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3994 ?AUTO_3993 ) ( VISIBLE ?AUTO_3991 ?AUTO_3993 ) ( AVAILABLE ?AUTO_3992 ) ( CHANNEL_FREE ?AUTO_3994 ) ( not ( = ?AUTO_3991 ?AUTO_3993 ) ) ( AT_ROCK_SAMPLE ?AUTO_3991 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3992 ) ( STORE_OF ?AUTO_3996 ?AUTO_3992 ) ( CAN_TRAVERSE ?AUTO_3992 ?AUTO_3993 ?AUTO_3991 ) ( VISIBLE ?AUTO_3993 ?AUTO_3991 ) ( CAN_TRAVERSE ?AUTO_3992 ?AUTO_3995 ?AUTO_3993 ) ( AT ?AUTO_3992 ?AUTO_3995 ) ( VISIBLE ?AUTO_3995 ?AUTO_3993 ) ( not ( = ?AUTO_3991 ?AUTO_3995 ) ) ( not ( = ?AUTO_3993 ?AUTO_3995 ) ) ( FULL ?AUTO_3996 ) )
    :subtasks
    ( ( !DROP ?AUTO_3992 ?AUTO_3996 )
      ( GET_ROCK_DATA ?AUTO_3991 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3991 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4036 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4038 - LANDER
      ?AUTO_4042 - WAYPOINT
      ?AUTO_4041 - WAYPOINT
      ?AUTO_4040 - ROVER
      ?AUTO_4037 - STORE
      ?AUTO_4039 - WAYPOINT
      ?AUTO_4043 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4038 ?AUTO_4042 ) ( VISIBLE ?AUTO_4041 ?AUTO_4042 ) ( AVAILABLE ?AUTO_4040 ) ( CHANNEL_FREE ?AUTO_4038 ) ( not ( = ?AUTO_4036 ?AUTO_4041 ) ) ( not ( = ?AUTO_4036 ?AUTO_4042 ) ) ( not ( = ?AUTO_4041 ?AUTO_4042 ) ) ( CAN_TRAVERSE ?AUTO_4040 ?AUTO_4036 ?AUTO_4041 ) ( VISIBLE ?AUTO_4036 ?AUTO_4041 ) ( AT_ROCK_SAMPLE ?AUTO_4036 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4040 ) ( STORE_OF ?AUTO_4037 ?AUTO_4040 ) ( EMPTY ?AUTO_4037 ) ( CAN_TRAVERSE ?AUTO_4040 ?AUTO_4039 ?AUTO_4036 ) ( VISIBLE ?AUTO_4039 ?AUTO_4036 ) ( not ( = ?AUTO_4036 ?AUTO_4039 ) ) ( not ( = ?AUTO_4042 ?AUTO_4039 ) ) ( not ( = ?AUTO_4041 ?AUTO_4039 ) ) ( CAN_TRAVERSE ?AUTO_4040 ?AUTO_4043 ?AUTO_4039 ) ( VISIBLE ?AUTO_4043 ?AUTO_4039 ) ( not ( = ?AUTO_4036 ?AUTO_4043 ) ) ( not ( = ?AUTO_4042 ?AUTO_4043 ) ) ( not ( = ?AUTO_4041 ?AUTO_4043 ) ) ( not ( = ?AUTO_4039 ?AUTO_4043 ) ) ( CAN_TRAVERSE ?AUTO_4040 ?AUTO_4041 ?AUTO_4043 ) ( AT ?AUTO_4040 ?AUTO_4041 ) ( VISIBLE ?AUTO_4041 ?AUTO_4043 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4040 ?AUTO_4041 ?AUTO_4043 )
      ( GET_ROCK_DATA ?AUTO_4036 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4036 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4091 - OBJECTIVE
      ?AUTO_4092 - MODE
    )
    :vars
    (
      ?AUTO_4097 - LANDER
      ?AUTO_4096 - WAYPOINT
      ?AUTO_4098 - WAYPOINT
      ?AUTO_4095 - ROVER
      ?AUTO_4094 - WAYPOINT
      ?AUTO_4099 - WAYPOINT
      ?AUTO_4093 - CAMERA
      ?AUTO_4100 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4097 ?AUTO_4096 ) ( VISIBLE ?AUTO_4098 ?AUTO_4096 ) ( AVAILABLE ?AUTO_4095 ) ( CHANNEL_FREE ?AUTO_4097 ) ( not ( = ?AUTO_4098 ?AUTO_4096 ) ) ( CAN_TRAVERSE ?AUTO_4095 ?AUTO_4094 ?AUTO_4098 ) ( VISIBLE ?AUTO_4094 ?AUTO_4098 ) ( not ( = ?AUTO_4096 ?AUTO_4094 ) ) ( not ( = ?AUTO_4098 ?AUTO_4094 ) ) ( CAN_TRAVERSE ?AUTO_4095 ?AUTO_4099 ?AUTO_4094 ) ( VISIBLE ?AUTO_4099 ?AUTO_4094 ) ( not ( = ?AUTO_4096 ?AUTO_4099 ) ) ( not ( = ?AUTO_4098 ?AUTO_4099 ) ) ( not ( = ?AUTO_4094 ?AUTO_4099 ) ) ( ON_BOARD ?AUTO_4093 ?AUTO_4095 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4095 ) ( SUPPORTS ?AUTO_4093 ?AUTO_4092 ) ( VISIBLE_FROM ?AUTO_4091 ?AUTO_4099 ) ( CAN_TRAVERSE ?AUTO_4095 ?AUTO_4094 ?AUTO_4099 ) ( AT ?AUTO_4095 ?AUTO_4094 ) ( VISIBLE ?AUTO_4094 ?AUTO_4099 ) ( CALIBRATION_TARGET ?AUTO_4093 ?AUTO_4100 ) ( VISIBLE_FROM ?AUTO_4100 ?AUTO_4094 ) ( not ( = ?AUTO_4091 ?AUTO_4100 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4095 ?AUTO_4093 ?AUTO_4100 ?AUTO_4094 )
      ( GET_IMAGE_DATA ?AUTO_4091 ?AUTO_4092 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4091 ?AUTO_4092 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4105 - OBJECTIVE
      ?AUTO_4106 - MODE
    )
    :vars
    (
      ?AUTO_4114 - LANDER
      ?AUTO_4112 - WAYPOINT
      ?AUTO_4111 - WAYPOINT
      ?AUTO_4109 - ROVER
      ?AUTO_4110 - WAYPOINT
      ?AUTO_4108 - WAYPOINT
      ?AUTO_4107 - CAMERA
      ?AUTO_4113 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4114 ?AUTO_4112 ) ( VISIBLE ?AUTO_4111 ?AUTO_4112 ) ( AVAILABLE ?AUTO_4109 ) ( CHANNEL_FREE ?AUTO_4114 ) ( not ( = ?AUTO_4111 ?AUTO_4112 ) ) ( CAN_TRAVERSE ?AUTO_4109 ?AUTO_4110 ?AUTO_4111 ) ( VISIBLE ?AUTO_4110 ?AUTO_4111 ) ( not ( = ?AUTO_4112 ?AUTO_4110 ) ) ( not ( = ?AUTO_4111 ?AUTO_4110 ) ) ( CAN_TRAVERSE ?AUTO_4109 ?AUTO_4108 ?AUTO_4110 ) ( VISIBLE ?AUTO_4108 ?AUTO_4110 ) ( not ( = ?AUTO_4112 ?AUTO_4108 ) ) ( not ( = ?AUTO_4111 ?AUTO_4108 ) ) ( not ( = ?AUTO_4110 ?AUTO_4108 ) ) ( ON_BOARD ?AUTO_4107 ?AUTO_4109 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4109 ) ( SUPPORTS ?AUTO_4107 ?AUTO_4106 ) ( VISIBLE_FROM ?AUTO_4105 ?AUTO_4108 ) ( CAN_TRAVERSE ?AUTO_4109 ?AUTO_4110 ?AUTO_4108 ) ( VISIBLE ?AUTO_4110 ?AUTO_4108 ) ( CALIBRATION_TARGET ?AUTO_4107 ?AUTO_4113 ) ( VISIBLE_FROM ?AUTO_4113 ?AUTO_4110 ) ( not ( = ?AUTO_4105 ?AUTO_4113 ) ) ( AT ?AUTO_4109 ?AUTO_4108 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4109 ?AUTO_4108 ?AUTO_4110 )
      ( GET_IMAGE_DATA ?AUTO_4105 ?AUTO_4106 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4105 ?AUTO_4106 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4115 - OBJECTIVE
      ?AUTO_4116 - MODE
    )
    :vars
    (
      ?AUTO_4117 - LANDER
      ?AUTO_4123 - WAYPOINT
      ?AUTO_4121 - WAYPOINT
      ?AUTO_4122 - ROVER
      ?AUTO_4120 - WAYPOINT
      ?AUTO_4118 - WAYPOINT
      ?AUTO_4119 - CAMERA
      ?AUTO_4124 - OBJECTIVE
      ?AUTO_4125 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4117 ?AUTO_4123 ) ( VISIBLE ?AUTO_4121 ?AUTO_4123 ) ( AVAILABLE ?AUTO_4122 ) ( CHANNEL_FREE ?AUTO_4117 ) ( not ( = ?AUTO_4121 ?AUTO_4123 ) ) ( CAN_TRAVERSE ?AUTO_4122 ?AUTO_4120 ?AUTO_4121 ) ( VISIBLE ?AUTO_4120 ?AUTO_4121 ) ( not ( = ?AUTO_4123 ?AUTO_4120 ) ) ( not ( = ?AUTO_4121 ?AUTO_4120 ) ) ( CAN_TRAVERSE ?AUTO_4122 ?AUTO_4118 ?AUTO_4120 ) ( VISIBLE ?AUTO_4118 ?AUTO_4120 ) ( not ( = ?AUTO_4123 ?AUTO_4118 ) ) ( not ( = ?AUTO_4121 ?AUTO_4118 ) ) ( not ( = ?AUTO_4120 ?AUTO_4118 ) ) ( ON_BOARD ?AUTO_4119 ?AUTO_4122 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4122 ) ( SUPPORTS ?AUTO_4119 ?AUTO_4116 ) ( VISIBLE_FROM ?AUTO_4115 ?AUTO_4118 ) ( CAN_TRAVERSE ?AUTO_4122 ?AUTO_4120 ?AUTO_4118 ) ( VISIBLE ?AUTO_4120 ?AUTO_4118 ) ( CALIBRATION_TARGET ?AUTO_4119 ?AUTO_4124 ) ( VISIBLE_FROM ?AUTO_4124 ?AUTO_4120 ) ( not ( = ?AUTO_4115 ?AUTO_4124 ) ) ( CAN_TRAVERSE ?AUTO_4122 ?AUTO_4125 ?AUTO_4118 ) ( AT ?AUTO_4122 ?AUTO_4125 ) ( VISIBLE ?AUTO_4125 ?AUTO_4118 ) ( not ( = ?AUTO_4123 ?AUTO_4125 ) ) ( not ( = ?AUTO_4121 ?AUTO_4125 ) ) ( not ( = ?AUTO_4120 ?AUTO_4125 ) ) ( not ( = ?AUTO_4118 ?AUTO_4125 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4122 ?AUTO_4125 ?AUTO_4118 )
      ( GET_IMAGE_DATA ?AUTO_4115 ?AUTO_4116 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4115 ?AUTO_4116 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4126 - OBJECTIVE
      ?AUTO_4127 - MODE
    )
    :vars
    (
      ?AUTO_4131 - LANDER
      ?AUTO_4133 - WAYPOINT
      ?AUTO_4130 - WAYPOINT
      ?AUTO_4128 - ROVER
      ?AUTO_4134 - WAYPOINT
      ?AUTO_4129 - WAYPOINT
      ?AUTO_4135 - CAMERA
      ?AUTO_4132 - OBJECTIVE
      ?AUTO_4136 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4131 ?AUTO_4133 ) ( VISIBLE ?AUTO_4130 ?AUTO_4133 ) ( AVAILABLE ?AUTO_4128 ) ( CHANNEL_FREE ?AUTO_4131 ) ( not ( = ?AUTO_4130 ?AUTO_4133 ) ) ( CAN_TRAVERSE ?AUTO_4128 ?AUTO_4134 ?AUTO_4130 ) ( VISIBLE ?AUTO_4134 ?AUTO_4130 ) ( not ( = ?AUTO_4133 ?AUTO_4134 ) ) ( not ( = ?AUTO_4130 ?AUTO_4134 ) ) ( CAN_TRAVERSE ?AUTO_4128 ?AUTO_4129 ?AUTO_4134 ) ( VISIBLE ?AUTO_4129 ?AUTO_4134 ) ( not ( = ?AUTO_4133 ?AUTO_4129 ) ) ( not ( = ?AUTO_4130 ?AUTO_4129 ) ) ( not ( = ?AUTO_4134 ?AUTO_4129 ) ) ( ON_BOARD ?AUTO_4135 ?AUTO_4128 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4128 ) ( SUPPORTS ?AUTO_4135 ?AUTO_4127 ) ( VISIBLE_FROM ?AUTO_4126 ?AUTO_4129 ) ( CAN_TRAVERSE ?AUTO_4128 ?AUTO_4134 ?AUTO_4129 ) ( VISIBLE ?AUTO_4134 ?AUTO_4129 ) ( CALIBRATION_TARGET ?AUTO_4135 ?AUTO_4132 ) ( VISIBLE_FROM ?AUTO_4132 ?AUTO_4134 ) ( not ( = ?AUTO_4126 ?AUTO_4132 ) ) ( CAN_TRAVERSE ?AUTO_4128 ?AUTO_4136 ?AUTO_4129 ) ( VISIBLE ?AUTO_4136 ?AUTO_4129 ) ( not ( = ?AUTO_4133 ?AUTO_4136 ) ) ( not ( = ?AUTO_4130 ?AUTO_4136 ) ) ( not ( = ?AUTO_4134 ?AUTO_4136 ) ) ( not ( = ?AUTO_4129 ?AUTO_4136 ) ) ( CAN_TRAVERSE ?AUTO_4128 ?AUTO_4130 ?AUTO_4136 ) ( AT ?AUTO_4128 ?AUTO_4130 ) ( VISIBLE ?AUTO_4130 ?AUTO_4136 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4128 ?AUTO_4130 ?AUTO_4136 )
      ( GET_IMAGE_DATA ?AUTO_4126 ?AUTO_4127 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4126 ?AUTO_4127 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4188 - OBJECTIVE
      ?AUTO_4189 - MODE
    )
    :vars
    (
      ?AUTO_4192 - LANDER
      ?AUTO_4190 - WAYPOINT
      ?AUTO_4193 - WAYPOINT
      ?AUTO_4196 - ROVER
      ?AUTO_4195 - WAYPOINT
      ?AUTO_4191 - CAMERA
      ?AUTO_4194 - WAYPOINT
      ?AUTO_4197 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4192 ?AUTO_4190 ) ( VISIBLE ?AUTO_4193 ?AUTO_4190 ) ( AVAILABLE ?AUTO_4196 ) ( CHANNEL_FREE ?AUTO_4192 ) ( not ( = ?AUTO_4193 ?AUTO_4190 ) ) ( CAN_TRAVERSE ?AUTO_4196 ?AUTO_4195 ?AUTO_4193 ) ( VISIBLE ?AUTO_4195 ?AUTO_4193 ) ( not ( = ?AUTO_4190 ?AUTO_4195 ) ) ( not ( = ?AUTO_4193 ?AUTO_4195 ) ) ( ON_BOARD ?AUTO_4191 ?AUTO_4196 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4196 ) ( SUPPORTS ?AUTO_4191 ?AUTO_4189 ) ( VISIBLE_FROM ?AUTO_4188 ?AUTO_4195 ) ( CALIBRATION_TARGET ?AUTO_4191 ?AUTO_4188 ) ( CAN_TRAVERSE ?AUTO_4196 ?AUTO_4194 ?AUTO_4195 ) ( VISIBLE ?AUTO_4194 ?AUTO_4195 ) ( not ( = ?AUTO_4190 ?AUTO_4194 ) ) ( not ( = ?AUTO_4193 ?AUTO_4194 ) ) ( not ( = ?AUTO_4195 ?AUTO_4194 ) ) ( CAN_TRAVERSE ?AUTO_4196 ?AUTO_4197 ?AUTO_4194 ) ( AT ?AUTO_4196 ?AUTO_4197 ) ( VISIBLE ?AUTO_4197 ?AUTO_4194 ) ( not ( = ?AUTO_4190 ?AUTO_4197 ) ) ( not ( = ?AUTO_4193 ?AUTO_4197 ) ) ( not ( = ?AUTO_4195 ?AUTO_4197 ) ) ( not ( = ?AUTO_4194 ?AUTO_4197 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4196 ?AUTO_4197 ?AUTO_4194 )
      ( GET_IMAGE_DATA ?AUTO_4188 ?AUTO_4189 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4188 ?AUTO_4189 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4198 - OBJECTIVE
      ?AUTO_4199 - MODE
    )
    :vars
    (
      ?AUTO_4201 - LANDER
      ?AUTO_4202 - WAYPOINT
      ?AUTO_4203 - WAYPOINT
      ?AUTO_4204 - ROVER
      ?AUTO_4200 - WAYPOINT
      ?AUTO_4206 - CAMERA
      ?AUTO_4205 - WAYPOINT
      ?AUTO_4207 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4201 ?AUTO_4202 ) ( VISIBLE ?AUTO_4203 ?AUTO_4202 ) ( AVAILABLE ?AUTO_4204 ) ( CHANNEL_FREE ?AUTO_4201 ) ( not ( = ?AUTO_4203 ?AUTO_4202 ) ) ( CAN_TRAVERSE ?AUTO_4204 ?AUTO_4200 ?AUTO_4203 ) ( VISIBLE ?AUTO_4200 ?AUTO_4203 ) ( not ( = ?AUTO_4202 ?AUTO_4200 ) ) ( not ( = ?AUTO_4203 ?AUTO_4200 ) ) ( ON_BOARD ?AUTO_4206 ?AUTO_4204 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4204 ) ( SUPPORTS ?AUTO_4206 ?AUTO_4199 ) ( VISIBLE_FROM ?AUTO_4198 ?AUTO_4200 ) ( CALIBRATION_TARGET ?AUTO_4206 ?AUTO_4198 ) ( CAN_TRAVERSE ?AUTO_4204 ?AUTO_4205 ?AUTO_4200 ) ( VISIBLE ?AUTO_4205 ?AUTO_4200 ) ( not ( = ?AUTO_4202 ?AUTO_4205 ) ) ( not ( = ?AUTO_4203 ?AUTO_4205 ) ) ( not ( = ?AUTO_4200 ?AUTO_4205 ) ) ( CAN_TRAVERSE ?AUTO_4204 ?AUTO_4207 ?AUTO_4205 ) ( VISIBLE ?AUTO_4207 ?AUTO_4205 ) ( not ( = ?AUTO_4202 ?AUTO_4207 ) ) ( not ( = ?AUTO_4203 ?AUTO_4207 ) ) ( not ( = ?AUTO_4200 ?AUTO_4207 ) ) ( not ( = ?AUTO_4205 ?AUTO_4207 ) ) ( CAN_TRAVERSE ?AUTO_4204 ?AUTO_4203 ?AUTO_4207 ) ( AT ?AUTO_4204 ?AUTO_4203 ) ( VISIBLE ?AUTO_4203 ?AUTO_4207 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4204 ?AUTO_4203 ?AUTO_4207 )
      ( GET_IMAGE_DATA ?AUTO_4198 ?AUTO_4199 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4198 ?AUTO_4199 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4343 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4345 - LANDER
      ?AUTO_4346 - WAYPOINT
      ?AUTO_4344 - ROVER
      ?AUTO_4347 - STORE
      ?AUTO_4348 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4345 ?AUTO_4343 ) ( VISIBLE ?AUTO_4346 ?AUTO_4343 ) ( AVAILABLE ?AUTO_4344 ) ( CHANNEL_FREE ?AUTO_4345 ) ( not ( = ?AUTO_4343 ?AUTO_4346 ) ) ( CAN_TRAVERSE ?AUTO_4344 ?AUTO_4343 ?AUTO_4346 ) ( VISIBLE ?AUTO_4343 ?AUTO_4346 ) ( AT_ROCK_SAMPLE ?AUTO_4343 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4344 ) ( STORE_OF ?AUTO_4347 ?AUTO_4344 ) ( EMPTY ?AUTO_4347 ) ( CAN_TRAVERSE ?AUTO_4344 ?AUTO_4346 ?AUTO_4343 ) ( CAN_TRAVERSE ?AUTO_4344 ?AUTO_4348 ?AUTO_4346 ) ( AT ?AUTO_4344 ?AUTO_4348 ) ( VISIBLE ?AUTO_4348 ?AUTO_4346 ) ( not ( = ?AUTO_4343 ?AUTO_4348 ) ) ( not ( = ?AUTO_4346 ?AUTO_4348 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4344 ?AUTO_4348 ?AUTO_4346 )
      ( GET_ROCK_DATA ?AUTO_4343 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4343 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4349 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4351 - LANDER
      ?AUTO_4350 - WAYPOINT
      ?AUTO_4354 - ROVER
      ?AUTO_4353 - STORE
      ?AUTO_4352 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4351 ?AUTO_4349 ) ( VISIBLE ?AUTO_4350 ?AUTO_4349 ) ( AVAILABLE ?AUTO_4354 ) ( CHANNEL_FREE ?AUTO_4351 ) ( not ( = ?AUTO_4349 ?AUTO_4350 ) ) ( CAN_TRAVERSE ?AUTO_4354 ?AUTO_4349 ?AUTO_4350 ) ( VISIBLE ?AUTO_4349 ?AUTO_4350 ) ( AT_ROCK_SAMPLE ?AUTO_4349 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4354 ) ( STORE_OF ?AUTO_4353 ?AUTO_4354 ) ( CAN_TRAVERSE ?AUTO_4354 ?AUTO_4350 ?AUTO_4349 ) ( CAN_TRAVERSE ?AUTO_4354 ?AUTO_4352 ?AUTO_4350 ) ( AT ?AUTO_4354 ?AUTO_4352 ) ( VISIBLE ?AUTO_4352 ?AUTO_4350 ) ( not ( = ?AUTO_4349 ?AUTO_4352 ) ) ( not ( = ?AUTO_4350 ?AUTO_4352 ) ) ( FULL ?AUTO_4353 ) )
    :subtasks
    ( ( !DROP ?AUTO_4354 ?AUTO_4353 )
      ( GET_ROCK_DATA ?AUTO_4349 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4349 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4356 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4360 - LANDER
      ?AUTO_4361 - WAYPOINT
      ?AUTO_4358 - ROVER
      ?AUTO_4359 - STORE
      ?AUTO_4357 - WAYPOINT
      ?AUTO_4362 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4360 ?AUTO_4356 ) ( VISIBLE ?AUTO_4361 ?AUTO_4356 ) ( AVAILABLE ?AUTO_4358 ) ( CHANNEL_FREE ?AUTO_4360 ) ( not ( = ?AUTO_4356 ?AUTO_4361 ) ) ( CAN_TRAVERSE ?AUTO_4358 ?AUTO_4356 ?AUTO_4361 ) ( VISIBLE ?AUTO_4356 ?AUTO_4361 ) ( AT_ROCK_SAMPLE ?AUTO_4356 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4358 ) ( STORE_OF ?AUTO_4359 ?AUTO_4358 ) ( EMPTY ?AUTO_4359 ) ( CAN_TRAVERSE ?AUTO_4358 ?AUTO_4361 ?AUTO_4356 ) ( CAN_TRAVERSE ?AUTO_4358 ?AUTO_4357 ?AUTO_4361 ) ( VISIBLE ?AUTO_4357 ?AUTO_4361 ) ( not ( = ?AUTO_4356 ?AUTO_4357 ) ) ( not ( = ?AUTO_4361 ?AUTO_4357 ) ) ( CAN_TRAVERSE ?AUTO_4358 ?AUTO_4362 ?AUTO_4357 ) ( AT ?AUTO_4358 ?AUTO_4362 ) ( VISIBLE ?AUTO_4362 ?AUTO_4357 ) ( not ( = ?AUTO_4356 ?AUTO_4362 ) ) ( not ( = ?AUTO_4361 ?AUTO_4362 ) ) ( not ( = ?AUTO_4357 ?AUTO_4362 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4358 ?AUTO_4362 ?AUTO_4357 )
      ( GET_ROCK_DATA ?AUTO_4356 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4356 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4369 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4374 - LANDER
      ?AUTO_4372 - WAYPOINT
      ?AUTO_4375 - ROVER
      ?AUTO_4373 - STORE
      ?AUTO_4370 - WAYPOINT
      ?AUTO_4371 - WAYPOINT
      ?AUTO_4376 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4374 ?AUTO_4369 ) ( VISIBLE ?AUTO_4372 ?AUTO_4369 ) ( AVAILABLE ?AUTO_4375 ) ( CHANNEL_FREE ?AUTO_4374 ) ( not ( = ?AUTO_4369 ?AUTO_4372 ) ) ( CAN_TRAVERSE ?AUTO_4375 ?AUTO_4369 ?AUTO_4372 ) ( VISIBLE ?AUTO_4369 ?AUTO_4372 ) ( AT_ROCK_SAMPLE ?AUTO_4369 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4375 ) ( STORE_OF ?AUTO_4373 ?AUTO_4375 ) ( EMPTY ?AUTO_4373 ) ( CAN_TRAVERSE ?AUTO_4375 ?AUTO_4372 ?AUTO_4369 ) ( CAN_TRAVERSE ?AUTO_4375 ?AUTO_4370 ?AUTO_4372 ) ( VISIBLE ?AUTO_4370 ?AUTO_4372 ) ( not ( = ?AUTO_4369 ?AUTO_4370 ) ) ( not ( = ?AUTO_4372 ?AUTO_4370 ) ) ( CAN_TRAVERSE ?AUTO_4375 ?AUTO_4371 ?AUTO_4370 ) ( VISIBLE ?AUTO_4371 ?AUTO_4370 ) ( not ( = ?AUTO_4369 ?AUTO_4371 ) ) ( not ( = ?AUTO_4372 ?AUTO_4371 ) ) ( not ( = ?AUTO_4370 ?AUTO_4371 ) ) ( CAN_TRAVERSE ?AUTO_4375 ?AUTO_4376 ?AUTO_4371 ) ( AT ?AUTO_4375 ?AUTO_4376 ) ( VISIBLE ?AUTO_4376 ?AUTO_4371 ) ( not ( = ?AUTO_4369 ?AUTO_4376 ) ) ( not ( = ?AUTO_4372 ?AUTO_4376 ) ) ( not ( = ?AUTO_4370 ?AUTO_4376 ) ) ( not ( = ?AUTO_4371 ?AUTO_4376 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4375 ?AUTO_4376 ?AUTO_4371 )
      ( GET_ROCK_DATA ?AUTO_4369 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4369 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4402 - OBJECTIVE
      ?AUTO_4403 - MODE
    )
    :vars
    (
      ?AUTO_4407 - LANDER
      ?AUTO_4405 - WAYPOINT
      ?AUTO_4404 - WAYPOINT
      ?AUTO_4406 - ROVER
      ?AUTO_4408 - CAMERA
      ?AUTO_4409 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4407 ?AUTO_4405 ) ( VISIBLE ?AUTO_4404 ?AUTO_4405 ) ( AVAILABLE ?AUTO_4406 ) ( CHANNEL_FREE ?AUTO_4407 ) ( not ( = ?AUTO_4404 ?AUTO_4405 ) ) ( CAN_TRAVERSE ?AUTO_4406 ?AUTO_4405 ?AUTO_4404 ) ( AT ?AUTO_4406 ?AUTO_4405 ) ( VISIBLE ?AUTO_4405 ?AUTO_4404 ) ( ON_BOARD ?AUTO_4408 ?AUTO_4406 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4406 ) ( SUPPORTS ?AUTO_4408 ?AUTO_4403 ) ( VISIBLE_FROM ?AUTO_4402 ?AUTO_4405 ) ( CALIBRATION_TARGET ?AUTO_4408 ?AUTO_4409 ) ( VISIBLE_FROM ?AUTO_4409 ?AUTO_4405 ) ( not ( = ?AUTO_4402 ?AUTO_4409 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4406 ?AUTO_4408 ?AUTO_4409 ?AUTO_4405 )
      ( GET_IMAGE_DATA ?AUTO_4402 ?AUTO_4403 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4402 ?AUTO_4403 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4410 - OBJECTIVE
      ?AUTO_4411 - MODE
    )
    :vars
    (
      ?AUTO_4417 - LANDER
      ?AUTO_4413 - WAYPOINT
      ?AUTO_4414 - WAYPOINT
      ?AUTO_4412 - ROVER
      ?AUTO_4416 - CAMERA
      ?AUTO_4415 - OBJECTIVE
      ?AUTO_4418 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4417 ?AUTO_4413 ) ( VISIBLE ?AUTO_4414 ?AUTO_4413 ) ( AVAILABLE ?AUTO_4412 ) ( CHANNEL_FREE ?AUTO_4417 ) ( not ( = ?AUTO_4414 ?AUTO_4413 ) ) ( CAN_TRAVERSE ?AUTO_4412 ?AUTO_4413 ?AUTO_4414 ) ( VISIBLE ?AUTO_4413 ?AUTO_4414 ) ( ON_BOARD ?AUTO_4416 ?AUTO_4412 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4412 ) ( SUPPORTS ?AUTO_4416 ?AUTO_4411 ) ( VISIBLE_FROM ?AUTO_4410 ?AUTO_4413 ) ( CALIBRATION_TARGET ?AUTO_4416 ?AUTO_4415 ) ( VISIBLE_FROM ?AUTO_4415 ?AUTO_4413 ) ( not ( = ?AUTO_4410 ?AUTO_4415 ) ) ( CAN_TRAVERSE ?AUTO_4412 ?AUTO_4418 ?AUTO_4413 ) ( AT ?AUTO_4412 ?AUTO_4418 ) ( VISIBLE ?AUTO_4418 ?AUTO_4413 ) ( not ( = ?AUTO_4413 ?AUTO_4418 ) ) ( not ( = ?AUTO_4414 ?AUTO_4418 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4412 ?AUTO_4418 ?AUTO_4413 )
      ( GET_IMAGE_DATA ?AUTO_4410 ?AUTO_4411 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4410 ?AUTO_4411 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4478 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4482 - LANDER
      ?AUTO_4480 - WAYPOINT
      ?AUTO_4481 - WAYPOINT
      ?AUTO_4479 - ROVER
      ?AUTO_4483 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4482 ?AUTO_4480 ) ( VISIBLE ?AUTO_4481 ?AUTO_4480 ) ( AVAILABLE ?AUTO_4479 ) ( CHANNEL_FREE ?AUTO_4482 ) ( not ( = ?AUTO_4478 ?AUTO_4481 ) ) ( not ( = ?AUTO_4478 ?AUTO_4480 ) ) ( not ( = ?AUTO_4481 ?AUTO_4480 ) ) ( CAN_TRAVERSE ?AUTO_4479 ?AUTO_4478 ?AUTO_4481 ) ( VISIBLE ?AUTO_4478 ?AUTO_4481 ) ( AT_SOIL_SAMPLE ?AUTO_4478 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4479 ) ( STORE_OF ?AUTO_4483 ?AUTO_4479 ) ( EMPTY ?AUTO_4483 ) ( CAN_TRAVERSE ?AUTO_4479 ?AUTO_4481 ?AUTO_4478 ) ( VISIBLE ?AUTO_4481 ?AUTO_4478 ) ( CAN_TRAVERSE ?AUTO_4479 ?AUTO_4480 ?AUTO_4481 ) ( AT ?AUTO_4479 ?AUTO_4480 ) ( VISIBLE ?AUTO_4480 ?AUTO_4481 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4479 ?AUTO_4480 ?AUTO_4481 )
      ( GET_SOIL_DATA ?AUTO_4478 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4478 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4488 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4493 - LANDER
      ?AUTO_4489 - WAYPOINT
      ?AUTO_4490 - WAYPOINT
      ?AUTO_4491 - ROVER
      ?AUTO_4492 - STORE
      ?AUTO_4494 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4493 ?AUTO_4489 ) ( VISIBLE ?AUTO_4490 ?AUTO_4489 ) ( AVAILABLE ?AUTO_4491 ) ( CHANNEL_FREE ?AUTO_4493 ) ( not ( = ?AUTO_4488 ?AUTO_4490 ) ) ( not ( = ?AUTO_4488 ?AUTO_4489 ) ) ( not ( = ?AUTO_4490 ?AUTO_4489 ) ) ( CAN_TRAVERSE ?AUTO_4491 ?AUTO_4488 ?AUTO_4490 ) ( VISIBLE ?AUTO_4488 ?AUTO_4490 ) ( AT_SOIL_SAMPLE ?AUTO_4488 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4491 ) ( STORE_OF ?AUTO_4492 ?AUTO_4491 ) ( EMPTY ?AUTO_4492 ) ( CAN_TRAVERSE ?AUTO_4491 ?AUTO_4490 ?AUTO_4488 ) ( VISIBLE ?AUTO_4490 ?AUTO_4488 ) ( CAN_TRAVERSE ?AUTO_4491 ?AUTO_4489 ?AUTO_4490 ) ( VISIBLE ?AUTO_4489 ?AUTO_4490 ) ( CAN_TRAVERSE ?AUTO_4491 ?AUTO_4494 ?AUTO_4489 ) ( AT ?AUTO_4491 ?AUTO_4494 ) ( VISIBLE ?AUTO_4494 ?AUTO_4489 ) ( not ( = ?AUTO_4488 ?AUTO_4494 ) ) ( not ( = ?AUTO_4489 ?AUTO_4494 ) ) ( not ( = ?AUTO_4490 ?AUTO_4494 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4491 ?AUTO_4494 ?AUTO_4489 )
      ( GET_SOIL_DATA ?AUTO_4488 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4488 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4519 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4520 - LANDER
      ?AUTO_4522 - WAYPOINT
      ?AUTO_4523 - ROVER
      ?AUTO_4521 - STORE
      ?AUTO_4525 - WAYPOINT
      ?AUTO_4524 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4520 ?AUTO_4522 ) ( VISIBLE ?AUTO_4519 ?AUTO_4522 ) ( AVAILABLE ?AUTO_4523 ) ( CHANNEL_FREE ?AUTO_4520 ) ( not ( = ?AUTO_4519 ?AUTO_4522 ) ) ( AT_SOIL_SAMPLE ?AUTO_4519 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4523 ) ( STORE_OF ?AUTO_4521 ?AUTO_4523 ) ( CAN_TRAVERSE ?AUTO_4523 ?AUTO_4525 ?AUTO_4519 ) ( VISIBLE ?AUTO_4525 ?AUTO_4519 ) ( not ( = ?AUTO_4519 ?AUTO_4525 ) ) ( not ( = ?AUTO_4522 ?AUTO_4525 ) ) ( CAN_TRAVERSE ?AUTO_4523 ?AUTO_4524 ?AUTO_4525 ) ( AT ?AUTO_4523 ?AUTO_4524 ) ( VISIBLE ?AUTO_4524 ?AUTO_4525 ) ( not ( = ?AUTO_4519 ?AUTO_4524 ) ) ( not ( = ?AUTO_4522 ?AUTO_4524 ) ) ( not ( = ?AUTO_4525 ?AUTO_4524 ) ) ( FULL ?AUTO_4521 ) )
    :subtasks
    ( ( !DROP ?AUTO_4523 ?AUTO_4521 )
      ( GET_SOIL_DATA ?AUTO_4519 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4519 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4530 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4531 - LANDER
      ?AUTO_4532 - WAYPOINT
      ?AUTO_4534 - ROVER
      ?AUTO_4535 - STORE
      ?AUTO_4533 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4531 ?AUTO_4532 ) ( VISIBLE ?AUTO_4530 ?AUTO_4532 ) ( AVAILABLE ?AUTO_4534 ) ( CHANNEL_FREE ?AUTO_4531 ) ( not ( = ?AUTO_4530 ?AUTO_4532 ) ) ( AT_SOIL_SAMPLE ?AUTO_4530 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4534 ) ( STORE_OF ?AUTO_4535 ?AUTO_4534 ) ( EMPTY ?AUTO_4535 ) ( CAN_TRAVERSE ?AUTO_4534 ?AUTO_4533 ?AUTO_4530 ) ( VISIBLE ?AUTO_4533 ?AUTO_4530 ) ( not ( = ?AUTO_4530 ?AUTO_4533 ) ) ( not ( = ?AUTO_4532 ?AUTO_4533 ) ) ( CAN_TRAVERSE ?AUTO_4534 ?AUTO_4532 ?AUTO_4533 ) ( AT ?AUTO_4534 ?AUTO_4532 ) ( VISIBLE ?AUTO_4532 ?AUTO_4533 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4534 ?AUTO_4532 ?AUTO_4533 )
      ( GET_SOIL_DATA ?AUTO_4530 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4530 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4624 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4626 - LANDER
      ?AUTO_4627 - WAYPOINT
      ?AUTO_4629 - WAYPOINT
      ?AUTO_4625 - ROVER
      ?AUTO_4628 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4626 ?AUTO_4627 ) ( VISIBLE ?AUTO_4629 ?AUTO_4627 ) ( AVAILABLE ?AUTO_4625 ) ( CHANNEL_FREE ?AUTO_4626 ) ( not ( = ?AUTO_4624 ?AUTO_4629 ) ) ( not ( = ?AUTO_4624 ?AUTO_4627 ) ) ( not ( = ?AUTO_4629 ?AUTO_4627 ) ) ( CAN_TRAVERSE ?AUTO_4625 ?AUTO_4624 ?AUTO_4629 ) ( VISIBLE ?AUTO_4624 ?AUTO_4629 ) ( AT_ROCK_SAMPLE ?AUTO_4624 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4625 ) ( STORE_OF ?AUTO_4628 ?AUTO_4625 ) ( EMPTY ?AUTO_4628 ) ( CAN_TRAVERSE ?AUTO_4625 ?AUTO_4629 ?AUTO_4624 ) ( VISIBLE ?AUTO_4629 ?AUTO_4624 ) ( CAN_TRAVERSE ?AUTO_4625 ?AUTO_4627 ?AUTO_4629 ) ( AT ?AUTO_4625 ?AUTO_4627 ) ( VISIBLE ?AUTO_4627 ?AUTO_4629 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4625 ?AUTO_4627 ?AUTO_4629 )
      ( GET_ROCK_DATA ?AUTO_4624 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4624 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4673 - OBJECTIVE
      ?AUTO_4674 - MODE
    )
    :vars
    (
      ?AUTO_4676 - LANDER
      ?AUTO_4678 - WAYPOINT
      ?AUTO_4679 - WAYPOINT
      ?AUTO_4681 - ROVER
      ?AUTO_4675 - WAYPOINT
      ?AUTO_4677 - WAYPOINT
      ?AUTO_4680 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4676 ?AUTO_4678 ) ( VISIBLE ?AUTO_4679 ?AUTO_4678 ) ( AVAILABLE ?AUTO_4681 ) ( CHANNEL_FREE ?AUTO_4676 ) ( not ( = ?AUTO_4679 ?AUTO_4678 ) ) ( CAN_TRAVERSE ?AUTO_4681 ?AUTO_4675 ?AUTO_4679 ) ( VISIBLE ?AUTO_4675 ?AUTO_4679 ) ( not ( = ?AUTO_4678 ?AUTO_4675 ) ) ( not ( = ?AUTO_4679 ?AUTO_4675 ) ) ( CAN_TRAVERSE ?AUTO_4681 ?AUTO_4677 ?AUTO_4675 ) ( AT ?AUTO_4681 ?AUTO_4677 ) ( VISIBLE ?AUTO_4677 ?AUTO_4675 ) ( not ( = ?AUTO_4678 ?AUTO_4677 ) ) ( not ( = ?AUTO_4679 ?AUTO_4677 ) ) ( not ( = ?AUTO_4675 ?AUTO_4677 ) ) ( ON_BOARD ?AUTO_4680 ?AUTO_4681 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4681 ) ( SUPPORTS ?AUTO_4680 ?AUTO_4674 ) ( VISIBLE_FROM ?AUTO_4673 ?AUTO_4677 ) ( CALIBRATION_TARGET ?AUTO_4680 ?AUTO_4673 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4681 ?AUTO_4680 ?AUTO_4673 ?AUTO_4677 )
      ( GET_IMAGE_DATA ?AUTO_4673 ?AUTO_4674 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4673 ?AUTO_4674 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4682 - OBJECTIVE
      ?AUTO_4683 - MODE
    )
    :vars
    (
      ?AUTO_4685 - LANDER
      ?AUTO_4690 - WAYPOINT
      ?AUTO_4689 - WAYPOINT
      ?AUTO_4688 - ROVER
      ?AUTO_4686 - WAYPOINT
      ?AUTO_4687 - WAYPOINT
      ?AUTO_4684 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4685 ?AUTO_4690 ) ( VISIBLE ?AUTO_4689 ?AUTO_4690 ) ( AVAILABLE ?AUTO_4688 ) ( CHANNEL_FREE ?AUTO_4685 ) ( not ( = ?AUTO_4689 ?AUTO_4690 ) ) ( CAN_TRAVERSE ?AUTO_4688 ?AUTO_4686 ?AUTO_4689 ) ( VISIBLE ?AUTO_4686 ?AUTO_4689 ) ( not ( = ?AUTO_4690 ?AUTO_4686 ) ) ( not ( = ?AUTO_4689 ?AUTO_4686 ) ) ( CAN_TRAVERSE ?AUTO_4688 ?AUTO_4687 ?AUTO_4686 ) ( VISIBLE ?AUTO_4687 ?AUTO_4686 ) ( not ( = ?AUTO_4690 ?AUTO_4687 ) ) ( not ( = ?AUTO_4689 ?AUTO_4687 ) ) ( not ( = ?AUTO_4686 ?AUTO_4687 ) ) ( ON_BOARD ?AUTO_4684 ?AUTO_4688 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4688 ) ( SUPPORTS ?AUTO_4684 ?AUTO_4683 ) ( VISIBLE_FROM ?AUTO_4682 ?AUTO_4687 ) ( CALIBRATION_TARGET ?AUTO_4684 ?AUTO_4682 ) ( CAN_TRAVERSE ?AUTO_4688 ?AUTO_4689 ?AUTO_4687 ) ( AT ?AUTO_4688 ?AUTO_4689 ) ( VISIBLE ?AUTO_4689 ?AUTO_4687 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4688 ?AUTO_4689 ?AUTO_4687 )
      ( GET_IMAGE_DATA ?AUTO_4682 ?AUTO_4683 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4682 ?AUTO_4683 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4695 - OBJECTIVE
      ?AUTO_4696 - MODE
    )
    :vars
    (
      ?AUTO_4701 - LANDER
      ?AUTO_4700 - WAYPOINT
      ?AUTO_4699 - WAYPOINT
      ?AUTO_4697 - ROVER
      ?AUTO_4698 - WAYPOINT
      ?AUTO_4703 - WAYPOINT
      ?AUTO_4702 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4701 ?AUTO_4700 ) ( VISIBLE ?AUTO_4699 ?AUTO_4700 ) ( AVAILABLE ?AUTO_4697 ) ( CHANNEL_FREE ?AUTO_4701 ) ( not ( = ?AUTO_4699 ?AUTO_4700 ) ) ( CAN_TRAVERSE ?AUTO_4697 ?AUTO_4698 ?AUTO_4699 ) ( VISIBLE ?AUTO_4698 ?AUTO_4699 ) ( not ( = ?AUTO_4700 ?AUTO_4698 ) ) ( not ( = ?AUTO_4699 ?AUTO_4698 ) ) ( CAN_TRAVERSE ?AUTO_4697 ?AUTO_4703 ?AUTO_4698 ) ( VISIBLE ?AUTO_4703 ?AUTO_4698 ) ( not ( = ?AUTO_4700 ?AUTO_4703 ) ) ( not ( = ?AUTO_4699 ?AUTO_4703 ) ) ( not ( = ?AUTO_4698 ?AUTO_4703 ) ) ( ON_BOARD ?AUTO_4702 ?AUTO_4697 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4697 ) ( SUPPORTS ?AUTO_4702 ?AUTO_4696 ) ( VISIBLE_FROM ?AUTO_4695 ?AUTO_4703 ) ( CALIBRATION_TARGET ?AUTO_4702 ?AUTO_4695 ) ( CAN_TRAVERSE ?AUTO_4697 ?AUTO_4699 ?AUTO_4703 ) ( VISIBLE ?AUTO_4699 ?AUTO_4703 ) ( CAN_TRAVERSE ?AUTO_4697 ?AUTO_4700 ?AUTO_4699 ) ( AT ?AUTO_4697 ?AUTO_4700 ) ( VISIBLE ?AUTO_4700 ?AUTO_4699 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4697 ?AUTO_4700 ?AUTO_4699 )
      ( GET_IMAGE_DATA ?AUTO_4695 ?AUTO_4696 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4695 ?AUTO_4696 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4754 - OBJECTIVE
      ?AUTO_4755 - MODE
    )
    :vars
    (
      ?AUTO_4759 - LANDER
      ?AUTO_4760 - WAYPOINT
      ?AUTO_4757 - WAYPOINT
      ?AUTO_4756 - ROVER
      ?AUTO_4758 - CAMERA
      ?AUTO_4761 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4759 ?AUTO_4760 ) ( VISIBLE ?AUTO_4757 ?AUTO_4760 ) ( AVAILABLE ?AUTO_4756 ) ( CHANNEL_FREE ?AUTO_4759 ) ( not ( = ?AUTO_4757 ?AUTO_4760 ) ) ( CAN_TRAVERSE ?AUTO_4756 ?AUTO_4760 ?AUTO_4757 ) ( VISIBLE ?AUTO_4760 ?AUTO_4757 ) ( CALIBRATED ?AUTO_4758 ?AUTO_4756 ) ( ON_BOARD ?AUTO_4758 ?AUTO_4756 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4756 ) ( SUPPORTS ?AUTO_4758 ?AUTO_4755 ) ( VISIBLE_FROM ?AUTO_4754 ?AUTO_4760 ) ( CAN_TRAVERSE ?AUTO_4756 ?AUTO_4761 ?AUTO_4760 ) ( VISIBLE ?AUTO_4761 ?AUTO_4760 ) ( not ( = ?AUTO_4760 ?AUTO_4761 ) ) ( not ( = ?AUTO_4757 ?AUTO_4761 ) ) ( CAN_TRAVERSE ?AUTO_4756 ?AUTO_4757 ?AUTO_4761 ) ( AT ?AUTO_4756 ?AUTO_4757 ) ( VISIBLE ?AUTO_4757 ?AUTO_4761 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4756 ?AUTO_4757 ?AUTO_4761 )
      ( GET_IMAGE_DATA ?AUTO_4754 ?AUTO_4755 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4754 ?AUTO_4755 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4762 - OBJECTIVE
      ?AUTO_4763 - MODE
    )
    :vars
    (
      ?AUTO_4766 - LANDER
      ?AUTO_4764 - WAYPOINT
      ?AUTO_4768 - WAYPOINT
      ?AUTO_4769 - ROVER
      ?AUTO_4767 - CAMERA
      ?AUTO_4765 - WAYPOINT
      ?AUTO_4770 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4766 ?AUTO_4764 ) ( VISIBLE ?AUTO_4768 ?AUTO_4764 ) ( AVAILABLE ?AUTO_4769 ) ( CHANNEL_FREE ?AUTO_4766 ) ( not ( = ?AUTO_4768 ?AUTO_4764 ) ) ( CAN_TRAVERSE ?AUTO_4769 ?AUTO_4764 ?AUTO_4768 ) ( VISIBLE ?AUTO_4764 ?AUTO_4768 ) ( ON_BOARD ?AUTO_4767 ?AUTO_4769 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4769 ) ( SUPPORTS ?AUTO_4767 ?AUTO_4763 ) ( VISIBLE_FROM ?AUTO_4762 ?AUTO_4764 ) ( CAN_TRAVERSE ?AUTO_4769 ?AUTO_4765 ?AUTO_4764 ) ( VISIBLE ?AUTO_4765 ?AUTO_4764 ) ( not ( = ?AUTO_4764 ?AUTO_4765 ) ) ( not ( = ?AUTO_4768 ?AUTO_4765 ) ) ( CAN_TRAVERSE ?AUTO_4769 ?AUTO_4768 ?AUTO_4765 ) ( AT ?AUTO_4769 ?AUTO_4768 ) ( VISIBLE ?AUTO_4768 ?AUTO_4765 ) ( CALIBRATION_TARGET ?AUTO_4767 ?AUTO_4770 ) ( VISIBLE_FROM ?AUTO_4770 ?AUTO_4768 ) ( not ( = ?AUTO_4762 ?AUTO_4770 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4769 ?AUTO_4767 ?AUTO_4770 ?AUTO_4768 )
      ( GET_IMAGE_DATA ?AUTO_4762 ?AUTO_4763 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4762 ?AUTO_4763 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5003 - OBJECTIVE
      ?AUTO_5004 - MODE
    )
    :vars
    (
      ?AUTO_5008 - LANDER
      ?AUTO_5007 - WAYPOINT
      ?AUTO_5005 - WAYPOINT
      ?AUTO_5009 - ROVER
      ?AUTO_5011 - CAMERA
      ?AUTO_5010 - WAYPOINT
      ?AUTO_5006 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5008 ?AUTO_5007 ) ( VISIBLE ?AUTO_5005 ?AUTO_5007 ) ( AVAILABLE ?AUTO_5009 ) ( CHANNEL_FREE ?AUTO_5008 ) ( not ( = ?AUTO_5005 ?AUTO_5007 ) ) ( ON_BOARD ?AUTO_5011 ?AUTO_5009 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5009 ) ( SUPPORTS ?AUTO_5011 ?AUTO_5004 ) ( VISIBLE_FROM ?AUTO_5003 ?AUTO_5005 ) ( CAN_TRAVERSE ?AUTO_5009 ?AUTO_5007 ?AUTO_5005 ) ( VISIBLE ?AUTO_5007 ?AUTO_5005 ) ( CAN_TRAVERSE ?AUTO_5009 ?AUTO_5010 ?AUTO_5007 ) ( VISIBLE ?AUTO_5010 ?AUTO_5007 ) ( not ( = ?AUTO_5007 ?AUTO_5010 ) ) ( not ( = ?AUTO_5005 ?AUTO_5010 ) ) ( CALIBRATION_TARGET ?AUTO_5011 ?AUTO_5006 ) ( VISIBLE_FROM ?AUTO_5006 ?AUTO_5010 ) ( not ( = ?AUTO_5003 ?AUTO_5006 ) ) ( CAN_TRAVERSE ?AUTO_5009 ?AUTO_5007 ?AUTO_5010 ) ( VISIBLE ?AUTO_5007 ?AUTO_5010 ) ( CAN_TRAVERSE ?AUTO_5009 ?AUTO_5005 ?AUTO_5007 ) ( AT ?AUTO_5009 ?AUTO_5005 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5009 ?AUTO_5005 ?AUTO_5007 )
      ( GET_IMAGE_DATA ?AUTO_5003 ?AUTO_5004 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5003 ?AUTO_5004 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5030 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5033 - LANDER
      ?AUTO_5031 - WAYPOINT
      ?AUTO_5034 - ROVER
      ?AUTO_5035 - WAYPOINT
      ?AUTO_5032 - WAYPOINT
      ?AUTO_5036 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5033 ?AUTO_5031 ) ( HAVE_SOIL_ANALYSIS ?AUTO_5034 ?AUTO_5030 ) ( VISIBLE ?AUTO_5035 ?AUTO_5031 ) ( AVAILABLE ?AUTO_5034 ) ( CHANNEL_FREE ?AUTO_5033 ) ( not ( = ?AUTO_5030 ?AUTO_5035 ) ) ( not ( = ?AUTO_5030 ?AUTO_5031 ) ) ( not ( = ?AUTO_5035 ?AUTO_5031 ) ) ( CAN_TRAVERSE ?AUTO_5034 ?AUTO_5032 ?AUTO_5035 ) ( VISIBLE ?AUTO_5032 ?AUTO_5035 ) ( not ( = ?AUTO_5030 ?AUTO_5032 ) ) ( not ( = ?AUTO_5031 ?AUTO_5032 ) ) ( not ( = ?AUTO_5035 ?AUTO_5032 ) ) ( CAN_TRAVERSE ?AUTO_5034 ?AUTO_5030 ?AUTO_5032 ) ( VISIBLE ?AUTO_5030 ?AUTO_5032 ) ( CAN_TRAVERSE ?AUTO_5034 ?AUTO_5036 ?AUTO_5030 ) ( AT ?AUTO_5034 ?AUTO_5036 ) ( VISIBLE ?AUTO_5036 ?AUTO_5030 ) ( not ( = ?AUTO_5030 ?AUTO_5036 ) ) ( not ( = ?AUTO_5031 ?AUTO_5036 ) ) ( not ( = ?AUTO_5035 ?AUTO_5036 ) ) ( not ( = ?AUTO_5032 ?AUTO_5036 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5034 ?AUTO_5036 ?AUTO_5030 )
      ( GET_SOIL_DATA ?AUTO_5030 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5030 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5047 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5050 - LANDER
      ?AUTO_5048 - WAYPOINT
      ?AUTO_5051 - WAYPOINT
      ?AUTO_5049 - ROVER
      ?AUTO_5052 - WAYPOINT
      ?AUTO_5053 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5050 ?AUTO_5048 ) ( VISIBLE ?AUTO_5051 ?AUTO_5048 ) ( AVAILABLE ?AUTO_5049 ) ( CHANNEL_FREE ?AUTO_5050 ) ( not ( = ?AUTO_5047 ?AUTO_5051 ) ) ( not ( = ?AUTO_5047 ?AUTO_5048 ) ) ( not ( = ?AUTO_5051 ?AUTO_5048 ) ) ( CAN_TRAVERSE ?AUTO_5049 ?AUTO_5052 ?AUTO_5051 ) ( VISIBLE ?AUTO_5052 ?AUTO_5051 ) ( not ( = ?AUTO_5047 ?AUTO_5052 ) ) ( not ( = ?AUTO_5048 ?AUTO_5052 ) ) ( not ( = ?AUTO_5051 ?AUTO_5052 ) ) ( CAN_TRAVERSE ?AUTO_5049 ?AUTO_5047 ?AUTO_5052 ) ( VISIBLE ?AUTO_5047 ?AUTO_5052 ) ( AT_SOIL_SAMPLE ?AUTO_5047 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5049 ) ( STORE_OF ?AUTO_5053 ?AUTO_5049 ) ( EMPTY ?AUTO_5053 ) ( CAN_TRAVERSE ?AUTO_5049 ?AUTO_5052 ?AUTO_5047 ) ( AT ?AUTO_5049 ?AUTO_5052 ) ( VISIBLE ?AUTO_5052 ?AUTO_5047 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5049 ?AUTO_5052 ?AUTO_5047 )
      ( GET_SOIL_DATA ?AUTO_5047 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5047 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5054 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5059 - LANDER
      ?AUTO_5060 - WAYPOINT
      ?AUTO_5057 - WAYPOINT
      ?AUTO_5055 - ROVER
      ?AUTO_5056 - WAYPOINT
      ?AUTO_5058 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5059 ?AUTO_5060 ) ( VISIBLE ?AUTO_5057 ?AUTO_5060 ) ( AVAILABLE ?AUTO_5055 ) ( CHANNEL_FREE ?AUTO_5059 ) ( not ( = ?AUTO_5054 ?AUTO_5057 ) ) ( not ( = ?AUTO_5054 ?AUTO_5060 ) ) ( not ( = ?AUTO_5057 ?AUTO_5060 ) ) ( CAN_TRAVERSE ?AUTO_5055 ?AUTO_5056 ?AUTO_5057 ) ( VISIBLE ?AUTO_5056 ?AUTO_5057 ) ( not ( = ?AUTO_5054 ?AUTO_5056 ) ) ( not ( = ?AUTO_5060 ?AUTO_5056 ) ) ( not ( = ?AUTO_5057 ?AUTO_5056 ) ) ( CAN_TRAVERSE ?AUTO_5055 ?AUTO_5054 ?AUTO_5056 ) ( VISIBLE ?AUTO_5054 ?AUTO_5056 ) ( AT_SOIL_SAMPLE ?AUTO_5054 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5055 ) ( STORE_OF ?AUTO_5058 ?AUTO_5055 ) ( CAN_TRAVERSE ?AUTO_5055 ?AUTO_5056 ?AUTO_5054 ) ( AT ?AUTO_5055 ?AUTO_5056 ) ( VISIBLE ?AUTO_5056 ?AUTO_5054 ) ( FULL ?AUTO_5058 ) )
    :subtasks
    ( ( !DROP ?AUTO_5055 ?AUTO_5058 )
      ( GET_SOIL_DATA ?AUTO_5054 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5054 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5063 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5069 - LANDER
      ?AUTO_5064 - WAYPOINT
      ?AUTO_5068 - WAYPOINT
      ?AUTO_5067 - ROVER
      ?AUTO_5065 - WAYPOINT
      ?AUTO_5066 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5069 ?AUTO_5064 ) ( VISIBLE ?AUTO_5068 ?AUTO_5064 ) ( AVAILABLE ?AUTO_5067 ) ( CHANNEL_FREE ?AUTO_5069 ) ( not ( = ?AUTO_5063 ?AUTO_5068 ) ) ( not ( = ?AUTO_5063 ?AUTO_5064 ) ) ( not ( = ?AUTO_5068 ?AUTO_5064 ) ) ( CAN_TRAVERSE ?AUTO_5067 ?AUTO_5065 ?AUTO_5068 ) ( VISIBLE ?AUTO_5065 ?AUTO_5068 ) ( not ( = ?AUTO_5063 ?AUTO_5065 ) ) ( not ( = ?AUTO_5064 ?AUTO_5065 ) ) ( not ( = ?AUTO_5068 ?AUTO_5065 ) ) ( CAN_TRAVERSE ?AUTO_5067 ?AUTO_5063 ?AUTO_5065 ) ( VISIBLE ?AUTO_5063 ?AUTO_5065 ) ( AT_SOIL_SAMPLE ?AUTO_5063 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5067 ) ( STORE_OF ?AUTO_5066 ?AUTO_5067 ) ( EMPTY ?AUTO_5066 ) ( CAN_TRAVERSE ?AUTO_5067 ?AUTO_5065 ?AUTO_5063 ) ( VISIBLE ?AUTO_5065 ?AUTO_5063 ) ( CAN_TRAVERSE ?AUTO_5067 ?AUTO_5068 ?AUTO_5065 ) ( AT ?AUTO_5067 ?AUTO_5068 ) ( VISIBLE ?AUTO_5068 ?AUTO_5065 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5067 ?AUTO_5068 ?AUTO_5065 )
      ( GET_SOIL_DATA ?AUTO_5063 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5063 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5070 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5074 - LANDER
      ?AUTO_5073 - WAYPOINT
      ?AUTO_5072 - WAYPOINT
      ?AUTO_5075 - ROVER
      ?AUTO_5076 - WAYPOINT
      ?AUTO_5071 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5074 ?AUTO_5073 ) ( VISIBLE ?AUTO_5072 ?AUTO_5073 ) ( AVAILABLE ?AUTO_5075 ) ( CHANNEL_FREE ?AUTO_5074 ) ( not ( = ?AUTO_5070 ?AUTO_5072 ) ) ( not ( = ?AUTO_5070 ?AUTO_5073 ) ) ( not ( = ?AUTO_5072 ?AUTO_5073 ) ) ( CAN_TRAVERSE ?AUTO_5075 ?AUTO_5076 ?AUTO_5072 ) ( VISIBLE ?AUTO_5076 ?AUTO_5072 ) ( not ( = ?AUTO_5070 ?AUTO_5076 ) ) ( not ( = ?AUTO_5073 ?AUTO_5076 ) ) ( not ( = ?AUTO_5072 ?AUTO_5076 ) ) ( CAN_TRAVERSE ?AUTO_5075 ?AUTO_5070 ?AUTO_5076 ) ( VISIBLE ?AUTO_5070 ?AUTO_5076 ) ( AT_SOIL_SAMPLE ?AUTO_5070 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5075 ) ( STORE_OF ?AUTO_5071 ?AUTO_5075 ) ( EMPTY ?AUTO_5071 ) ( CAN_TRAVERSE ?AUTO_5075 ?AUTO_5076 ?AUTO_5070 ) ( VISIBLE ?AUTO_5076 ?AUTO_5070 ) ( CAN_TRAVERSE ?AUTO_5075 ?AUTO_5072 ?AUTO_5076 ) ( VISIBLE ?AUTO_5072 ?AUTO_5076 ) ( CAN_TRAVERSE ?AUTO_5075 ?AUTO_5073 ?AUTO_5072 ) ( AT ?AUTO_5075 ?AUTO_5073 ) ( VISIBLE ?AUTO_5073 ?AUTO_5072 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5075 ?AUTO_5073 ?AUTO_5072 )
      ( GET_SOIL_DATA ?AUTO_5070 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5070 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5090 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5092 - LANDER
      ?AUTO_5091 - WAYPOINT
      ?AUTO_5093 - ROVER
      ?AUTO_5094 - WAYPOINT
      ?AUTO_5095 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5092 ?AUTO_5091 ) ( HAVE_SOIL_ANALYSIS ?AUTO_5093 ?AUTO_5090 ) ( VISIBLE ?AUTO_5094 ?AUTO_5091 ) ( AVAILABLE ?AUTO_5093 ) ( CHANNEL_FREE ?AUTO_5092 ) ( not ( = ?AUTO_5090 ?AUTO_5094 ) ) ( not ( = ?AUTO_5090 ?AUTO_5091 ) ) ( not ( = ?AUTO_5094 ?AUTO_5091 ) ) ( CAN_TRAVERSE ?AUTO_5093 ?AUTO_5090 ?AUTO_5094 ) ( VISIBLE ?AUTO_5090 ?AUTO_5094 ) ( CAN_TRAVERSE ?AUTO_5093 ?AUTO_5095 ?AUTO_5090 ) ( AT ?AUTO_5093 ?AUTO_5095 ) ( VISIBLE ?AUTO_5095 ?AUTO_5090 ) ( not ( = ?AUTO_5090 ?AUTO_5095 ) ) ( not ( = ?AUTO_5091 ?AUTO_5095 ) ) ( not ( = ?AUTO_5094 ?AUTO_5095 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5093 ?AUTO_5095 ?AUTO_5090 )
      ( GET_SOIL_DATA ?AUTO_5090 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5090 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5096 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5100 - LANDER
      ?AUTO_5099 - WAYPOINT
      ?AUTO_5098 - ROVER
      ?AUTO_5097 - WAYPOINT
      ?AUTO_5101 - WAYPOINT
      ?AUTO_5102 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5100 ?AUTO_5099 ) ( HAVE_SOIL_ANALYSIS ?AUTO_5098 ?AUTO_5096 ) ( VISIBLE ?AUTO_5097 ?AUTO_5099 ) ( AVAILABLE ?AUTO_5098 ) ( CHANNEL_FREE ?AUTO_5100 ) ( not ( = ?AUTO_5096 ?AUTO_5097 ) ) ( not ( = ?AUTO_5096 ?AUTO_5099 ) ) ( not ( = ?AUTO_5097 ?AUTO_5099 ) ) ( CAN_TRAVERSE ?AUTO_5098 ?AUTO_5096 ?AUTO_5097 ) ( VISIBLE ?AUTO_5096 ?AUTO_5097 ) ( CAN_TRAVERSE ?AUTO_5098 ?AUTO_5101 ?AUTO_5096 ) ( VISIBLE ?AUTO_5101 ?AUTO_5096 ) ( not ( = ?AUTO_5096 ?AUTO_5101 ) ) ( not ( = ?AUTO_5099 ?AUTO_5101 ) ) ( not ( = ?AUTO_5097 ?AUTO_5101 ) ) ( CAN_TRAVERSE ?AUTO_5098 ?AUTO_5102 ?AUTO_5101 ) ( AT ?AUTO_5098 ?AUTO_5102 ) ( VISIBLE ?AUTO_5102 ?AUTO_5101 ) ( not ( = ?AUTO_5096 ?AUTO_5102 ) ) ( not ( = ?AUTO_5099 ?AUTO_5102 ) ) ( not ( = ?AUTO_5097 ?AUTO_5102 ) ) ( not ( = ?AUTO_5101 ?AUTO_5102 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5098 ?AUTO_5102 ?AUTO_5101 )
      ( GET_SOIL_DATA ?AUTO_5096 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5096 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5133 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5134 - LANDER
      ?AUTO_5136 - WAYPOINT
      ?AUTO_5137 - ROVER
      ?AUTO_5135 - WAYPOINT
      ?AUTO_5138 - WAYPOINT
      ?AUTO_5139 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5134 ?AUTO_5136 ) ( HAVE_ROCK_ANALYSIS ?AUTO_5137 ?AUTO_5133 ) ( VISIBLE ?AUTO_5135 ?AUTO_5136 ) ( AVAILABLE ?AUTO_5137 ) ( CHANNEL_FREE ?AUTO_5134 ) ( not ( = ?AUTO_5133 ?AUTO_5135 ) ) ( not ( = ?AUTO_5133 ?AUTO_5136 ) ) ( not ( = ?AUTO_5135 ?AUTO_5136 ) ) ( CAN_TRAVERSE ?AUTO_5137 ?AUTO_5138 ?AUTO_5135 ) ( VISIBLE ?AUTO_5138 ?AUTO_5135 ) ( not ( = ?AUTO_5133 ?AUTO_5138 ) ) ( not ( = ?AUTO_5136 ?AUTO_5138 ) ) ( not ( = ?AUTO_5135 ?AUTO_5138 ) ) ( CAN_TRAVERSE ?AUTO_5137 ?AUTO_5139 ?AUTO_5138 ) ( AT ?AUTO_5137 ?AUTO_5139 ) ( VISIBLE ?AUTO_5139 ?AUTO_5138 ) ( not ( = ?AUTO_5133 ?AUTO_5139 ) ) ( not ( = ?AUTO_5136 ?AUTO_5139 ) ) ( not ( = ?AUTO_5135 ?AUTO_5139 ) ) ( not ( = ?AUTO_5138 ?AUTO_5139 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5137 ?AUTO_5139 ?AUTO_5138 )
      ( GET_ROCK_DATA ?AUTO_5133 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5133 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5140 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5142 - LANDER
      ?AUTO_5145 - WAYPOINT
      ?AUTO_5141 - ROVER
      ?AUTO_5143 - WAYPOINT
      ?AUTO_5144 - WAYPOINT
      ?AUTO_5146 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5142 ?AUTO_5145 ) ( HAVE_ROCK_ANALYSIS ?AUTO_5141 ?AUTO_5140 ) ( VISIBLE ?AUTO_5143 ?AUTO_5145 ) ( AVAILABLE ?AUTO_5141 ) ( CHANNEL_FREE ?AUTO_5142 ) ( not ( = ?AUTO_5140 ?AUTO_5143 ) ) ( not ( = ?AUTO_5140 ?AUTO_5145 ) ) ( not ( = ?AUTO_5143 ?AUTO_5145 ) ) ( CAN_TRAVERSE ?AUTO_5141 ?AUTO_5144 ?AUTO_5143 ) ( VISIBLE ?AUTO_5144 ?AUTO_5143 ) ( not ( = ?AUTO_5140 ?AUTO_5144 ) ) ( not ( = ?AUTO_5145 ?AUTO_5144 ) ) ( not ( = ?AUTO_5143 ?AUTO_5144 ) ) ( CAN_TRAVERSE ?AUTO_5141 ?AUTO_5146 ?AUTO_5144 ) ( VISIBLE ?AUTO_5146 ?AUTO_5144 ) ( not ( = ?AUTO_5140 ?AUTO_5146 ) ) ( not ( = ?AUTO_5145 ?AUTO_5146 ) ) ( not ( = ?AUTO_5143 ?AUTO_5146 ) ) ( not ( = ?AUTO_5144 ?AUTO_5146 ) ) ( CAN_TRAVERSE ?AUTO_5141 ?AUTO_5140 ?AUTO_5146 ) ( AT ?AUTO_5141 ?AUTO_5140 ) ( VISIBLE ?AUTO_5140 ?AUTO_5146 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5141 ?AUTO_5140 ?AUTO_5146 )
      ( GET_ROCK_DATA ?AUTO_5140 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5140 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5147 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5149 - LANDER
      ?AUTO_5150 - WAYPOINT
      ?AUTO_5152 - WAYPOINT
      ?AUTO_5148 - ROVER
      ?AUTO_5153 - WAYPOINT
      ?AUTO_5151 - WAYPOINT
      ?AUTO_5154 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5149 ?AUTO_5150 ) ( VISIBLE ?AUTO_5152 ?AUTO_5150 ) ( AVAILABLE ?AUTO_5148 ) ( CHANNEL_FREE ?AUTO_5149 ) ( not ( = ?AUTO_5147 ?AUTO_5152 ) ) ( not ( = ?AUTO_5147 ?AUTO_5150 ) ) ( not ( = ?AUTO_5152 ?AUTO_5150 ) ) ( CAN_TRAVERSE ?AUTO_5148 ?AUTO_5153 ?AUTO_5152 ) ( VISIBLE ?AUTO_5153 ?AUTO_5152 ) ( not ( = ?AUTO_5147 ?AUTO_5153 ) ) ( not ( = ?AUTO_5150 ?AUTO_5153 ) ) ( not ( = ?AUTO_5152 ?AUTO_5153 ) ) ( CAN_TRAVERSE ?AUTO_5148 ?AUTO_5151 ?AUTO_5153 ) ( VISIBLE ?AUTO_5151 ?AUTO_5153 ) ( not ( = ?AUTO_5147 ?AUTO_5151 ) ) ( not ( = ?AUTO_5150 ?AUTO_5151 ) ) ( not ( = ?AUTO_5152 ?AUTO_5151 ) ) ( not ( = ?AUTO_5153 ?AUTO_5151 ) ) ( CAN_TRAVERSE ?AUTO_5148 ?AUTO_5147 ?AUTO_5151 ) ( AT ?AUTO_5148 ?AUTO_5147 ) ( VISIBLE ?AUTO_5147 ?AUTO_5151 ) ( AT_ROCK_SAMPLE ?AUTO_5147 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5148 ) ( STORE_OF ?AUTO_5154 ?AUTO_5148 ) ( EMPTY ?AUTO_5154 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5148 ?AUTO_5154 ?AUTO_5147 )
      ( GET_ROCK_DATA ?AUTO_5147 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5147 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5155 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5156 - LANDER
      ?AUTO_5162 - WAYPOINT
      ?AUTO_5158 - WAYPOINT
      ?AUTO_5157 - ROVER
      ?AUTO_5159 - WAYPOINT
      ?AUTO_5161 - WAYPOINT
      ?AUTO_5160 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5156 ?AUTO_5162 ) ( VISIBLE ?AUTO_5158 ?AUTO_5162 ) ( AVAILABLE ?AUTO_5157 ) ( CHANNEL_FREE ?AUTO_5156 ) ( not ( = ?AUTO_5155 ?AUTO_5158 ) ) ( not ( = ?AUTO_5155 ?AUTO_5162 ) ) ( not ( = ?AUTO_5158 ?AUTO_5162 ) ) ( CAN_TRAVERSE ?AUTO_5157 ?AUTO_5159 ?AUTO_5158 ) ( VISIBLE ?AUTO_5159 ?AUTO_5158 ) ( not ( = ?AUTO_5155 ?AUTO_5159 ) ) ( not ( = ?AUTO_5162 ?AUTO_5159 ) ) ( not ( = ?AUTO_5158 ?AUTO_5159 ) ) ( CAN_TRAVERSE ?AUTO_5157 ?AUTO_5161 ?AUTO_5159 ) ( VISIBLE ?AUTO_5161 ?AUTO_5159 ) ( not ( = ?AUTO_5155 ?AUTO_5161 ) ) ( not ( = ?AUTO_5162 ?AUTO_5161 ) ) ( not ( = ?AUTO_5158 ?AUTO_5161 ) ) ( not ( = ?AUTO_5159 ?AUTO_5161 ) ) ( CAN_TRAVERSE ?AUTO_5157 ?AUTO_5155 ?AUTO_5161 ) ( VISIBLE ?AUTO_5155 ?AUTO_5161 ) ( AT_ROCK_SAMPLE ?AUTO_5155 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5157 ) ( STORE_OF ?AUTO_5160 ?AUTO_5157 ) ( EMPTY ?AUTO_5160 ) ( CAN_TRAVERSE ?AUTO_5157 ?AUTO_5161 ?AUTO_5155 ) ( AT ?AUTO_5157 ?AUTO_5161 ) ( VISIBLE ?AUTO_5161 ?AUTO_5155 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5157 ?AUTO_5161 ?AUTO_5155 )
      ( GET_ROCK_DATA ?AUTO_5155 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5155 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5163 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5165 - LANDER
      ?AUTO_5166 - WAYPOINT
      ?AUTO_5168 - WAYPOINT
      ?AUTO_5164 - ROVER
      ?AUTO_5169 - WAYPOINT
      ?AUTO_5167 - WAYPOINT
      ?AUTO_5170 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5165 ?AUTO_5166 ) ( VISIBLE ?AUTO_5168 ?AUTO_5166 ) ( AVAILABLE ?AUTO_5164 ) ( CHANNEL_FREE ?AUTO_5165 ) ( not ( = ?AUTO_5163 ?AUTO_5168 ) ) ( not ( = ?AUTO_5163 ?AUTO_5166 ) ) ( not ( = ?AUTO_5168 ?AUTO_5166 ) ) ( CAN_TRAVERSE ?AUTO_5164 ?AUTO_5169 ?AUTO_5168 ) ( VISIBLE ?AUTO_5169 ?AUTO_5168 ) ( not ( = ?AUTO_5163 ?AUTO_5169 ) ) ( not ( = ?AUTO_5166 ?AUTO_5169 ) ) ( not ( = ?AUTO_5168 ?AUTO_5169 ) ) ( CAN_TRAVERSE ?AUTO_5164 ?AUTO_5167 ?AUTO_5169 ) ( VISIBLE ?AUTO_5167 ?AUTO_5169 ) ( not ( = ?AUTO_5163 ?AUTO_5167 ) ) ( not ( = ?AUTO_5166 ?AUTO_5167 ) ) ( not ( = ?AUTO_5168 ?AUTO_5167 ) ) ( not ( = ?AUTO_5169 ?AUTO_5167 ) ) ( CAN_TRAVERSE ?AUTO_5164 ?AUTO_5163 ?AUTO_5167 ) ( VISIBLE ?AUTO_5163 ?AUTO_5167 ) ( AT_ROCK_SAMPLE ?AUTO_5163 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5164 ) ( STORE_OF ?AUTO_5170 ?AUTO_5164 ) ( CAN_TRAVERSE ?AUTO_5164 ?AUTO_5167 ?AUTO_5163 ) ( AT ?AUTO_5164 ?AUTO_5167 ) ( VISIBLE ?AUTO_5167 ?AUTO_5163 ) ( FULL ?AUTO_5170 ) )
    :subtasks
    ( ( !DROP ?AUTO_5164 ?AUTO_5170 )
      ( GET_ROCK_DATA ?AUTO_5163 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5163 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5172 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5173 - LANDER
      ?AUTO_5174 - WAYPOINT
      ?AUTO_5176 - WAYPOINT
      ?AUTO_5178 - ROVER
      ?AUTO_5177 - WAYPOINT
      ?AUTO_5175 - WAYPOINT
      ?AUTO_5179 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5173 ?AUTO_5174 ) ( VISIBLE ?AUTO_5176 ?AUTO_5174 ) ( AVAILABLE ?AUTO_5178 ) ( CHANNEL_FREE ?AUTO_5173 ) ( not ( = ?AUTO_5172 ?AUTO_5176 ) ) ( not ( = ?AUTO_5172 ?AUTO_5174 ) ) ( not ( = ?AUTO_5176 ?AUTO_5174 ) ) ( CAN_TRAVERSE ?AUTO_5178 ?AUTO_5177 ?AUTO_5176 ) ( VISIBLE ?AUTO_5177 ?AUTO_5176 ) ( not ( = ?AUTO_5172 ?AUTO_5177 ) ) ( not ( = ?AUTO_5174 ?AUTO_5177 ) ) ( not ( = ?AUTO_5176 ?AUTO_5177 ) ) ( CAN_TRAVERSE ?AUTO_5178 ?AUTO_5175 ?AUTO_5177 ) ( VISIBLE ?AUTO_5175 ?AUTO_5177 ) ( not ( = ?AUTO_5172 ?AUTO_5175 ) ) ( not ( = ?AUTO_5174 ?AUTO_5175 ) ) ( not ( = ?AUTO_5176 ?AUTO_5175 ) ) ( not ( = ?AUTO_5177 ?AUTO_5175 ) ) ( CAN_TRAVERSE ?AUTO_5178 ?AUTO_5172 ?AUTO_5175 ) ( VISIBLE ?AUTO_5172 ?AUTO_5175 ) ( AT_ROCK_SAMPLE ?AUTO_5172 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5178 ) ( STORE_OF ?AUTO_5179 ?AUTO_5178 ) ( EMPTY ?AUTO_5179 ) ( CAN_TRAVERSE ?AUTO_5178 ?AUTO_5175 ?AUTO_5172 ) ( VISIBLE ?AUTO_5175 ?AUTO_5172 ) ( CAN_TRAVERSE ?AUTO_5178 ?AUTO_5177 ?AUTO_5175 ) ( AT ?AUTO_5178 ?AUTO_5177 ) ( VISIBLE ?AUTO_5177 ?AUTO_5175 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5178 ?AUTO_5177 ?AUTO_5175 )
      ( GET_ROCK_DATA ?AUTO_5172 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5172 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5180 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5184 - LANDER
      ?AUTO_5183 - WAYPOINT
      ?AUTO_5185 - WAYPOINT
      ?AUTO_5187 - ROVER
      ?AUTO_5182 - WAYPOINT
      ?AUTO_5186 - WAYPOINT
      ?AUTO_5181 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5184 ?AUTO_5183 ) ( VISIBLE ?AUTO_5185 ?AUTO_5183 ) ( AVAILABLE ?AUTO_5187 ) ( CHANNEL_FREE ?AUTO_5184 ) ( not ( = ?AUTO_5180 ?AUTO_5185 ) ) ( not ( = ?AUTO_5180 ?AUTO_5183 ) ) ( not ( = ?AUTO_5185 ?AUTO_5183 ) ) ( CAN_TRAVERSE ?AUTO_5187 ?AUTO_5182 ?AUTO_5185 ) ( VISIBLE ?AUTO_5182 ?AUTO_5185 ) ( not ( = ?AUTO_5180 ?AUTO_5182 ) ) ( not ( = ?AUTO_5183 ?AUTO_5182 ) ) ( not ( = ?AUTO_5185 ?AUTO_5182 ) ) ( CAN_TRAVERSE ?AUTO_5187 ?AUTO_5186 ?AUTO_5182 ) ( VISIBLE ?AUTO_5186 ?AUTO_5182 ) ( not ( = ?AUTO_5180 ?AUTO_5186 ) ) ( not ( = ?AUTO_5183 ?AUTO_5186 ) ) ( not ( = ?AUTO_5185 ?AUTO_5186 ) ) ( not ( = ?AUTO_5182 ?AUTO_5186 ) ) ( CAN_TRAVERSE ?AUTO_5187 ?AUTO_5180 ?AUTO_5186 ) ( VISIBLE ?AUTO_5180 ?AUTO_5186 ) ( AT_ROCK_SAMPLE ?AUTO_5180 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5187 ) ( STORE_OF ?AUTO_5181 ?AUTO_5187 ) ( CAN_TRAVERSE ?AUTO_5187 ?AUTO_5186 ?AUTO_5180 ) ( VISIBLE ?AUTO_5186 ?AUTO_5180 ) ( CAN_TRAVERSE ?AUTO_5187 ?AUTO_5182 ?AUTO_5186 ) ( AT ?AUTO_5187 ?AUTO_5182 ) ( VISIBLE ?AUTO_5182 ?AUTO_5186 ) ( FULL ?AUTO_5181 ) )
    :subtasks
    ( ( !DROP ?AUTO_5187 ?AUTO_5181 )
      ( GET_ROCK_DATA ?AUTO_5180 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5180 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5190 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5194 - LANDER
      ?AUTO_5196 - WAYPOINT
      ?AUTO_5195 - WAYPOINT
      ?AUTO_5191 - ROVER
      ?AUTO_5192 - WAYPOINT
      ?AUTO_5193 - WAYPOINT
      ?AUTO_5197 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5194 ?AUTO_5196 ) ( VISIBLE ?AUTO_5195 ?AUTO_5196 ) ( AVAILABLE ?AUTO_5191 ) ( CHANNEL_FREE ?AUTO_5194 ) ( not ( = ?AUTO_5190 ?AUTO_5195 ) ) ( not ( = ?AUTO_5190 ?AUTO_5196 ) ) ( not ( = ?AUTO_5195 ?AUTO_5196 ) ) ( CAN_TRAVERSE ?AUTO_5191 ?AUTO_5192 ?AUTO_5195 ) ( VISIBLE ?AUTO_5192 ?AUTO_5195 ) ( not ( = ?AUTO_5190 ?AUTO_5192 ) ) ( not ( = ?AUTO_5196 ?AUTO_5192 ) ) ( not ( = ?AUTO_5195 ?AUTO_5192 ) ) ( CAN_TRAVERSE ?AUTO_5191 ?AUTO_5193 ?AUTO_5192 ) ( VISIBLE ?AUTO_5193 ?AUTO_5192 ) ( not ( = ?AUTO_5190 ?AUTO_5193 ) ) ( not ( = ?AUTO_5196 ?AUTO_5193 ) ) ( not ( = ?AUTO_5195 ?AUTO_5193 ) ) ( not ( = ?AUTO_5192 ?AUTO_5193 ) ) ( CAN_TRAVERSE ?AUTO_5191 ?AUTO_5190 ?AUTO_5193 ) ( VISIBLE ?AUTO_5190 ?AUTO_5193 ) ( AT_ROCK_SAMPLE ?AUTO_5190 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5191 ) ( STORE_OF ?AUTO_5197 ?AUTO_5191 ) ( EMPTY ?AUTO_5197 ) ( CAN_TRAVERSE ?AUTO_5191 ?AUTO_5193 ?AUTO_5190 ) ( VISIBLE ?AUTO_5193 ?AUTO_5190 ) ( CAN_TRAVERSE ?AUTO_5191 ?AUTO_5192 ?AUTO_5193 ) ( VISIBLE ?AUTO_5192 ?AUTO_5193 ) ( CAN_TRAVERSE ?AUTO_5191 ?AUTO_5195 ?AUTO_5192 ) ( AT ?AUTO_5191 ?AUTO_5195 ) ( VISIBLE ?AUTO_5195 ?AUTO_5192 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5191 ?AUTO_5195 ?AUTO_5192 )
      ( GET_ROCK_DATA ?AUTO_5190 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5190 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5198 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5204 - LANDER
      ?AUTO_5202 - WAYPOINT
      ?AUTO_5203 - WAYPOINT
      ?AUTO_5200 - ROVER
      ?AUTO_5205 - WAYPOINT
      ?AUTO_5201 - WAYPOINT
      ?AUTO_5199 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5204 ?AUTO_5202 ) ( VISIBLE ?AUTO_5203 ?AUTO_5202 ) ( AVAILABLE ?AUTO_5200 ) ( CHANNEL_FREE ?AUTO_5204 ) ( not ( = ?AUTO_5198 ?AUTO_5203 ) ) ( not ( = ?AUTO_5198 ?AUTO_5202 ) ) ( not ( = ?AUTO_5203 ?AUTO_5202 ) ) ( CAN_TRAVERSE ?AUTO_5200 ?AUTO_5205 ?AUTO_5203 ) ( VISIBLE ?AUTO_5205 ?AUTO_5203 ) ( not ( = ?AUTO_5198 ?AUTO_5205 ) ) ( not ( = ?AUTO_5202 ?AUTO_5205 ) ) ( not ( = ?AUTO_5203 ?AUTO_5205 ) ) ( CAN_TRAVERSE ?AUTO_5200 ?AUTO_5201 ?AUTO_5205 ) ( VISIBLE ?AUTO_5201 ?AUTO_5205 ) ( not ( = ?AUTO_5198 ?AUTO_5201 ) ) ( not ( = ?AUTO_5202 ?AUTO_5201 ) ) ( not ( = ?AUTO_5203 ?AUTO_5201 ) ) ( not ( = ?AUTO_5205 ?AUTO_5201 ) ) ( CAN_TRAVERSE ?AUTO_5200 ?AUTO_5198 ?AUTO_5201 ) ( VISIBLE ?AUTO_5198 ?AUTO_5201 ) ( AT_ROCK_SAMPLE ?AUTO_5198 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5200 ) ( STORE_OF ?AUTO_5199 ?AUTO_5200 ) ( EMPTY ?AUTO_5199 ) ( CAN_TRAVERSE ?AUTO_5200 ?AUTO_5201 ?AUTO_5198 ) ( VISIBLE ?AUTO_5201 ?AUTO_5198 ) ( CAN_TRAVERSE ?AUTO_5200 ?AUTO_5205 ?AUTO_5201 ) ( VISIBLE ?AUTO_5205 ?AUTO_5201 ) ( CAN_TRAVERSE ?AUTO_5200 ?AUTO_5203 ?AUTO_5205 ) ( VISIBLE ?AUTO_5203 ?AUTO_5205 ) ( CAN_TRAVERSE ?AUTO_5200 ?AUTO_5202 ?AUTO_5203 ) ( AT ?AUTO_5200 ?AUTO_5202 ) ( VISIBLE ?AUTO_5202 ?AUTO_5203 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5200 ?AUTO_5202 ?AUTO_5203 )
      ( GET_ROCK_DATA ?AUTO_5198 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5198 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5236 - OBJECTIVE
      ?AUTO_5237 - MODE
    )
    :vars
    (
      ?AUTO_5239 - LANDER
      ?AUTO_5242 - WAYPOINT
      ?AUTO_5240 - ROVER
      ?AUTO_5238 - WAYPOINT
      ?AUTO_5241 - WAYPOINT
      ?AUTO_5243 - WAYPOINT
      ?AUTO_5244 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5239 ?AUTO_5242 ) ( HAVE_IMAGE ?AUTO_5240 ?AUTO_5236 ?AUTO_5237 ) ( VISIBLE ?AUTO_5238 ?AUTO_5242 ) ( AVAILABLE ?AUTO_5240 ) ( CHANNEL_FREE ?AUTO_5239 ) ( not ( = ?AUTO_5238 ?AUTO_5242 ) ) ( CAN_TRAVERSE ?AUTO_5240 ?AUTO_5241 ?AUTO_5238 ) ( VISIBLE ?AUTO_5241 ?AUTO_5238 ) ( not ( = ?AUTO_5242 ?AUTO_5241 ) ) ( not ( = ?AUTO_5238 ?AUTO_5241 ) ) ( CAN_TRAVERSE ?AUTO_5240 ?AUTO_5243 ?AUTO_5241 ) ( VISIBLE ?AUTO_5243 ?AUTO_5241 ) ( not ( = ?AUTO_5242 ?AUTO_5243 ) ) ( not ( = ?AUTO_5238 ?AUTO_5243 ) ) ( not ( = ?AUTO_5241 ?AUTO_5243 ) ) ( CAN_TRAVERSE ?AUTO_5240 ?AUTO_5244 ?AUTO_5243 ) ( AT ?AUTO_5240 ?AUTO_5244 ) ( VISIBLE ?AUTO_5244 ?AUTO_5243 ) ( not ( = ?AUTO_5242 ?AUTO_5244 ) ) ( not ( = ?AUTO_5238 ?AUTO_5244 ) ) ( not ( = ?AUTO_5241 ?AUTO_5244 ) ) ( not ( = ?AUTO_5243 ?AUTO_5244 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5240 ?AUTO_5244 ?AUTO_5243 )
      ( GET_IMAGE_DATA ?AUTO_5236 ?AUTO_5237 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5236 ?AUTO_5237 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5283 - OBJECTIVE
      ?AUTO_5284 - MODE
    )
    :vars
    (
      ?AUTO_5287 - LANDER
      ?AUTO_5288 - WAYPOINT
      ?AUTO_5286 - WAYPOINT
      ?AUTO_5285 - ROVER
      ?AUTO_5290 - WAYPOINT
      ?AUTO_5289 - CAMERA
      ?AUTO_5291 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5287 ?AUTO_5288 ) ( VISIBLE ?AUTO_5286 ?AUTO_5288 ) ( AVAILABLE ?AUTO_5285 ) ( CHANNEL_FREE ?AUTO_5287 ) ( not ( = ?AUTO_5286 ?AUTO_5288 ) ) ( CAN_TRAVERSE ?AUTO_5285 ?AUTO_5290 ?AUTO_5286 ) ( VISIBLE ?AUTO_5290 ?AUTO_5286 ) ( not ( = ?AUTO_5288 ?AUTO_5290 ) ) ( not ( = ?AUTO_5286 ?AUTO_5290 ) ) ( ON_BOARD ?AUTO_5289 ?AUTO_5285 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5285 ) ( SUPPORTS ?AUTO_5289 ?AUTO_5284 ) ( VISIBLE_FROM ?AUTO_5283 ?AUTO_5290 ) ( CAN_TRAVERSE ?AUTO_5285 ?AUTO_5286 ?AUTO_5290 ) ( VISIBLE ?AUTO_5286 ?AUTO_5290 ) ( CAN_TRAVERSE ?AUTO_5285 ?AUTO_5288 ?AUTO_5286 ) ( AT ?AUTO_5285 ?AUTO_5288 ) ( VISIBLE ?AUTO_5288 ?AUTO_5286 ) ( CALIBRATION_TARGET ?AUTO_5289 ?AUTO_5291 ) ( VISIBLE_FROM ?AUTO_5291 ?AUTO_5288 ) ( not ( = ?AUTO_5283 ?AUTO_5291 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_5285 ?AUTO_5289 ?AUTO_5291 ?AUTO_5288 )
      ( GET_IMAGE_DATA ?AUTO_5283 ?AUTO_5284 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5283 ?AUTO_5284 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5331 - OBJECTIVE
      ?AUTO_5332 - MODE
    )
    :vars
    (
      ?AUTO_5333 - LANDER
      ?AUTO_5337 - WAYPOINT
      ?AUTO_5338 - WAYPOINT
      ?AUTO_5336 - ROVER
      ?AUTO_5335 - WAYPOINT
      ?AUTO_5334 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5333 ?AUTO_5337 ) ( VISIBLE ?AUTO_5338 ?AUTO_5337 ) ( AVAILABLE ?AUTO_5336 ) ( CHANNEL_FREE ?AUTO_5333 ) ( not ( = ?AUTO_5338 ?AUTO_5337 ) ) ( CAN_TRAVERSE ?AUTO_5336 ?AUTO_5335 ?AUTO_5338 ) ( VISIBLE ?AUTO_5335 ?AUTO_5338 ) ( not ( = ?AUTO_5337 ?AUTO_5335 ) ) ( not ( = ?AUTO_5338 ?AUTO_5335 ) ) ( ON_BOARD ?AUTO_5334 ?AUTO_5336 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5336 ) ( SUPPORTS ?AUTO_5334 ?AUTO_5332 ) ( VISIBLE_FROM ?AUTO_5331 ?AUTO_5335 ) ( CALIBRATION_TARGET ?AUTO_5334 ?AUTO_5331 ) ( CAN_TRAVERSE ?AUTO_5336 ?AUTO_5338 ?AUTO_5335 ) ( VISIBLE ?AUTO_5338 ?AUTO_5335 ) ( CAN_TRAVERSE ?AUTO_5336 ?AUTO_5337 ?AUTO_5338 ) ( AT ?AUTO_5336 ?AUTO_5337 ) ( VISIBLE ?AUTO_5337 ?AUTO_5338 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5336 ?AUTO_5337 ?AUTO_5338 )
      ( GET_IMAGE_DATA ?AUTO_5331 ?AUTO_5332 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5331 ?AUTO_5332 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5339 - OBJECTIVE
      ?AUTO_5340 - MODE
    )
    :vars
    (
      ?AUTO_5342 - LANDER
      ?AUTO_5341 - WAYPOINT
      ?AUTO_5343 - WAYPOINT
      ?AUTO_5344 - ROVER
      ?AUTO_5346 - WAYPOINT
      ?AUTO_5345 - CAMERA
      ?AUTO_5347 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5342 ?AUTO_5341 ) ( VISIBLE ?AUTO_5343 ?AUTO_5341 ) ( AVAILABLE ?AUTO_5344 ) ( CHANNEL_FREE ?AUTO_5342 ) ( not ( = ?AUTO_5343 ?AUTO_5341 ) ) ( CAN_TRAVERSE ?AUTO_5344 ?AUTO_5346 ?AUTO_5343 ) ( VISIBLE ?AUTO_5346 ?AUTO_5343 ) ( not ( = ?AUTO_5341 ?AUTO_5346 ) ) ( not ( = ?AUTO_5343 ?AUTO_5346 ) ) ( ON_BOARD ?AUTO_5345 ?AUTO_5344 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5344 ) ( SUPPORTS ?AUTO_5345 ?AUTO_5340 ) ( VISIBLE_FROM ?AUTO_5339 ?AUTO_5346 ) ( CALIBRATION_TARGET ?AUTO_5345 ?AUTO_5339 ) ( CAN_TRAVERSE ?AUTO_5344 ?AUTO_5343 ?AUTO_5346 ) ( VISIBLE ?AUTO_5343 ?AUTO_5346 ) ( CAN_TRAVERSE ?AUTO_5344 ?AUTO_5341 ?AUTO_5343 ) ( VISIBLE ?AUTO_5341 ?AUTO_5343 ) ( CAN_TRAVERSE ?AUTO_5344 ?AUTO_5347 ?AUTO_5341 ) ( AT ?AUTO_5344 ?AUTO_5347 ) ( VISIBLE ?AUTO_5347 ?AUTO_5341 ) ( not ( = ?AUTO_5341 ?AUTO_5347 ) ) ( not ( = ?AUTO_5343 ?AUTO_5347 ) ) ( not ( = ?AUTO_5346 ?AUTO_5347 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5344 ?AUTO_5347 ?AUTO_5341 )
      ( GET_IMAGE_DATA ?AUTO_5339 ?AUTO_5340 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5339 ?AUTO_5340 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5400 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5403 - LANDER
      ?AUTO_5404 - WAYPOINT
      ?AUTO_5405 - WAYPOINT
      ?AUTO_5402 - ROVER
      ?AUTO_5401 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5403 ?AUTO_5404 ) ( VISIBLE ?AUTO_5405 ?AUTO_5404 ) ( AVAILABLE ?AUTO_5402 ) ( CHANNEL_FREE ?AUTO_5403 ) ( not ( = ?AUTO_5400 ?AUTO_5405 ) ) ( not ( = ?AUTO_5400 ?AUTO_5404 ) ) ( not ( = ?AUTO_5405 ?AUTO_5404 ) ) ( CAN_TRAVERSE ?AUTO_5402 ?AUTO_5400 ?AUTO_5405 ) ( VISIBLE ?AUTO_5400 ?AUTO_5405 ) ( AT_SOIL_SAMPLE ?AUTO_5400 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5402 ) ( STORE_OF ?AUTO_5401 ?AUTO_5402 ) ( CAN_TRAVERSE ?AUTO_5402 ?AUTO_5405 ?AUTO_5400 ) ( VISIBLE ?AUTO_5405 ?AUTO_5400 ) ( CAN_TRAVERSE ?AUTO_5402 ?AUTO_5404 ?AUTO_5405 ) ( AT ?AUTO_5402 ?AUTO_5404 ) ( VISIBLE ?AUTO_5404 ?AUTO_5405 ) ( FULL ?AUTO_5401 ) )
    :subtasks
    ( ( !DROP ?AUTO_5402 ?AUTO_5401 )
      ( GET_SOIL_DATA ?AUTO_5400 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5400 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_12289 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12292 - LANDER
      ?AUTO_12294 - WAYPOINT
      ?AUTO_12293 - WAYPOINT
      ?AUTO_12290 - ROVER
      ?AUTO_12291 - STORE
      ?AUTO_12295 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12292 ?AUTO_12294 ) ( VISIBLE ?AUTO_12293 ?AUTO_12294 ) ( AVAILABLE ?AUTO_12290 ) ( CHANNEL_FREE ?AUTO_12292 ) ( not ( = ?AUTO_12289 ?AUTO_12293 ) ) ( not ( = ?AUTO_12289 ?AUTO_12294 ) ) ( not ( = ?AUTO_12293 ?AUTO_12294 ) ) ( CAN_TRAVERSE ?AUTO_12290 ?AUTO_12289 ?AUTO_12293 ) ( VISIBLE ?AUTO_12289 ?AUTO_12293 ) ( AT_SOIL_SAMPLE ?AUTO_12289 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12290 ) ( STORE_OF ?AUTO_12291 ?AUTO_12290 ) ( EMPTY ?AUTO_12291 ) ( CAN_TRAVERSE ?AUTO_12290 ?AUTO_12295 ?AUTO_12289 ) ( VISIBLE ?AUTO_12295 ?AUTO_12289 ) ( not ( = ?AUTO_12289 ?AUTO_12295 ) ) ( not ( = ?AUTO_12294 ?AUTO_12295 ) ) ( not ( = ?AUTO_12293 ?AUTO_12295 ) ) ( CAN_TRAVERSE ?AUTO_12290 ?AUTO_12293 ?AUTO_12295 ) ( AT ?AUTO_12290 ?AUTO_12293 ) ( VISIBLE ?AUTO_12293 ?AUTO_12295 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12290 ?AUTO_12293 ?AUTO_12295 )
      ( GET_SOIL_DATA ?AUTO_12289 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_12289 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5486 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5492 - LANDER
      ?AUTO_5489 - WAYPOINT
      ?AUTO_5488 - WAYPOINT
      ?AUTO_5487 - ROVER
      ?AUTO_5491 - STORE
      ?AUTO_5490 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5492 ?AUTO_5489 ) ( VISIBLE ?AUTO_5488 ?AUTO_5489 ) ( AVAILABLE ?AUTO_5487 ) ( CHANNEL_FREE ?AUTO_5492 ) ( not ( = ?AUTO_5486 ?AUTO_5488 ) ) ( not ( = ?AUTO_5486 ?AUTO_5489 ) ) ( not ( = ?AUTO_5488 ?AUTO_5489 ) ) ( CAN_TRAVERSE ?AUTO_5487 ?AUTO_5486 ?AUTO_5488 ) ( VISIBLE ?AUTO_5486 ?AUTO_5488 ) ( AT_SOIL_SAMPLE ?AUTO_5486 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5487 ) ( STORE_OF ?AUTO_5491 ?AUTO_5487 ) ( CAN_TRAVERSE ?AUTO_5487 ?AUTO_5490 ?AUTO_5486 ) ( VISIBLE ?AUTO_5490 ?AUTO_5486 ) ( not ( = ?AUTO_5486 ?AUTO_5490 ) ) ( not ( = ?AUTO_5489 ?AUTO_5490 ) ) ( not ( = ?AUTO_5488 ?AUTO_5490 ) ) ( AT_ROCK_SAMPLE ?AUTO_5490 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5487 ) ( CAN_TRAVERSE ?AUTO_5487 ?AUTO_5488 ?AUTO_5490 ) ( AT ?AUTO_5487 ?AUTO_5488 ) ( VISIBLE ?AUTO_5488 ?AUTO_5490 ) ( FULL ?AUTO_5491 ) )
    :subtasks
    ( ( !DROP ?AUTO_5487 ?AUTO_5491 )
      ( GET_SOIL_DATA ?AUTO_5486 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5486 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5527 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5528 - LANDER
      ?AUTO_5531 - WAYPOINT
      ?AUTO_5530 - WAYPOINT
      ?AUTO_5529 - ROVER
      ?AUTO_5532 - WAYPOINT
      ?AUTO_5533 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5528 ?AUTO_5531 ) ( VISIBLE ?AUTO_5530 ?AUTO_5531 ) ( AVAILABLE ?AUTO_5529 ) ( CHANNEL_FREE ?AUTO_5528 ) ( not ( = ?AUTO_5527 ?AUTO_5530 ) ) ( not ( = ?AUTO_5527 ?AUTO_5531 ) ) ( not ( = ?AUTO_5530 ?AUTO_5531 ) ) ( CAN_TRAVERSE ?AUTO_5529 ?AUTO_5532 ?AUTO_5530 ) ( VISIBLE ?AUTO_5532 ?AUTO_5530 ) ( not ( = ?AUTO_5527 ?AUTO_5532 ) ) ( not ( = ?AUTO_5531 ?AUTO_5532 ) ) ( not ( = ?AUTO_5530 ?AUTO_5532 ) ) ( CAN_TRAVERSE ?AUTO_5529 ?AUTO_5527 ?AUTO_5532 ) ( VISIBLE ?AUTO_5527 ?AUTO_5532 ) ( AT_ROCK_SAMPLE ?AUTO_5527 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5529 ) ( STORE_OF ?AUTO_5533 ?AUTO_5529 ) ( EMPTY ?AUTO_5533 ) ( CAN_TRAVERSE ?AUTO_5529 ?AUTO_5530 ?AUTO_5527 ) ( AT ?AUTO_5529 ?AUTO_5530 ) ( VISIBLE ?AUTO_5530 ?AUTO_5527 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5529 ?AUTO_5530 ?AUTO_5527 )
      ( GET_ROCK_DATA ?AUTO_5527 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5527 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5534 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5540 - LANDER
      ?AUTO_5539 - WAYPOINT
      ?AUTO_5536 - WAYPOINT
      ?AUTO_5537 - ROVER
      ?AUTO_5538 - WAYPOINT
      ?AUTO_5535 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5540 ?AUTO_5539 ) ( VISIBLE ?AUTO_5536 ?AUTO_5539 ) ( AVAILABLE ?AUTO_5537 ) ( CHANNEL_FREE ?AUTO_5540 ) ( not ( = ?AUTO_5534 ?AUTO_5536 ) ) ( not ( = ?AUTO_5534 ?AUTO_5539 ) ) ( not ( = ?AUTO_5536 ?AUTO_5539 ) ) ( CAN_TRAVERSE ?AUTO_5537 ?AUTO_5538 ?AUTO_5536 ) ( VISIBLE ?AUTO_5538 ?AUTO_5536 ) ( not ( = ?AUTO_5534 ?AUTO_5538 ) ) ( not ( = ?AUTO_5539 ?AUTO_5538 ) ) ( not ( = ?AUTO_5536 ?AUTO_5538 ) ) ( CAN_TRAVERSE ?AUTO_5537 ?AUTO_5534 ?AUTO_5538 ) ( VISIBLE ?AUTO_5534 ?AUTO_5538 ) ( AT_ROCK_SAMPLE ?AUTO_5534 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5537 ) ( STORE_OF ?AUTO_5535 ?AUTO_5537 ) ( CAN_TRAVERSE ?AUTO_5537 ?AUTO_5536 ?AUTO_5534 ) ( AT ?AUTO_5537 ?AUTO_5536 ) ( VISIBLE ?AUTO_5536 ?AUTO_5534 ) ( FULL ?AUTO_5535 ) )
    :subtasks
    ( ( !DROP ?AUTO_5537 ?AUTO_5535 )
      ( GET_ROCK_DATA ?AUTO_5534 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5534 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5580 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5585 - LANDER
      ?AUTO_5586 - WAYPOINT
      ?AUTO_5584 - WAYPOINT
      ?AUTO_5581 - ROVER
      ?AUTO_5582 - WAYPOINT
      ?AUTO_5583 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5585 ?AUTO_5586 ) ( VISIBLE ?AUTO_5584 ?AUTO_5586 ) ( AVAILABLE ?AUTO_5581 ) ( CHANNEL_FREE ?AUTO_5585 ) ( not ( = ?AUTO_5580 ?AUTO_5584 ) ) ( not ( = ?AUTO_5580 ?AUTO_5586 ) ) ( not ( = ?AUTO_5584 ?AUTO_5586 ) ) ( CAN_TRAVERSE ?AUTO_5581 ?AUTO_5582 ?AUTO_5584 ) ( VISIBLE ?AUTO_5582 ?AUTO_5584 ) ( not ( = ?AUTO_5580 ?AUTO_5582 ) ) ( not ( = ?AUTO_5586 ?AUTO_5582 ) ) ( not ( = ?AUTO_5584 ?AUTO_5582 ) ) ( CAN_TRAVERSE ?AUTO_5581 ?AUTO_5580 ?AUTO_5582 ) ( VISIBLE ?AUTO_5580 ?AUTO_5582 ) ( AT_ROCK_SAMPLE ?AUTO_5580 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5581 ) ( STORE_OF ?AUTO_5583 ?AUTO_5581 ) ( EMPTY ?AUTO_5583 ) ( CAN_TRAVERSE ?AUTO_5581 ?AUTO_5584 ?AUTO_5580 ) ( VISIBLE ?AUTO_5584 ?AUTO_5580 ) ( AT ?AUTO_5581 ?AUTO_5582 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5581 ?AUTO_5582 ?AUTO_5584 )
      ( GET_ROCK_DATA ?AUTO_5580 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5580 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5587 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5593 - LANDER
      ?AUTO_5590 - WAYPOINT
      ?AUTO_5591 - WAYPOINT
      ?AUTO_5589 - ROVER
      ?AUTO_5588 - WAYPOINT
      ?AUTO_5592 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5593 ?AUTO_5590 ) ( VISIBLE ?AUTO_5591 ?AUTO_5590 ) ( AVAILABLE ?AUTO_5589 ) ( CHANNEL_FREE ?AUTO_5593 ) ( not ( = ?AUTO_5587 ?AUTO_5591 ) ) ( not ( = ?AUTO_5587 ?AUTO_5590 ) ) ( not ( = ?AUTO_5591 ?AUTO_5590 ) ) ( CAN_TRAVERSE ?AUTO_5589 ?AUTO_5588 ?AUTO_5591 ) ( VISIBLE ?AUTO_5588 ?AUTO_5591 ) ( not ( = ?AUTO_5587 ?AUTO_5588 ) ) ( not ( = ?AUTO_5590 ?AUTO_5588 ) ) ( not ( = ?AUTO_5591 ?AUTO_5588 ) ) ( CAN_TRAVERSE ?AUTO_5589 ?AUTO_5587 ?AUTO_5588 ) ( VISIBLE ?AUTO_5587 ?AUTO_5588 ) ( AT_ROCK_SAMPLE ?AUTO_5587 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5589 ) ( STORE_OF ?AUTO_5592 ?AUTO_5589 ) ( CAN_TRAVERSE ?AUTO_5589 ?AUTO_5591 ?AUTO_5587 ) ( VISIBLE ?AUTO_5591 ?AUTO_5587 ) ( AT ?AUTO_5589 ?AUTO_5588 ) ( FULL ?AUTO_5592 ) )
    :subtasks
    ( ( !DROP ?AUTO_5589 ?AUTO_5592 )
      ( GET_ROCK_DATA ?AUTO_5587 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5587 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5596 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5599 - LANDER
      ?AUTO_5597 - WAYPOINT
      ?AUTO_5600 - WAYPOINT
      ?AUTO_5598 - ROVER
      ?AUTO_5601 - WAYPOINT
      ?AUTO_5602 - STORE
      ?AUTO_5603 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5599 ?AUTO_5597 ) ( VISIBLE ?AUTO_5600 ?AUTO_5597 ) ( AVAILABLE ?AUTO_5598 ) ( CHANNEL_FREE ?AUTO_5599 ) ( not ( = ?AUTO_5596 ?AUTO_5600 ) ) ( not ( = ?AUTO_5596 ?AUTO_5597 ) ) ( not ( = ?AUTO_5600 ?AUTO_5597 ) ) ( CAN_TRAVERSE ?AUTO_5598 ?AUTO_5601 ?AUTO_5600 ) ( VISIBLE ?AUTO_5601 ?AUTO_5600 ) ( not ( = ?AUTO_5596 ?AUTO_5601 ) ) ( not ( = ?AUTO_5597 ?AUTO_5601 ) ) ( not ( = ?AUTO_5600 ?AUTO_5601 ) ) ( CAN_TRAVERSE ?AUTO_5598 ?AUTO_5596 ?AUTO_5601 ) ( VISIBLE ?AUTO_5596 ?AUTO_5601 ) ( AT_ROCK_SAMPLE ?AUTO_5596 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5598 ) ( STORE_OF ?AUTO_5602 ?AUTO_5598 ) ( CAN_TRAVERSE ?AUTO_5598 ?AUTO_5600 ?AUTO_5596 ) ( VISIBLE ?AUTO_5600 ?AUTO_5596 ) ( FULL ?AUTO_5602 ) ( CAN_TRAVERSE ?AUTO_5598 ?AUTO_5603 ?AUTO_5601 ) ( AT ?AUTO_5598 ?AUTO_5603 ) ( VISIBLE ?AUTO_5603 ?AUTO_5601 ) ( not ( = ?AUTO_5596 ?AUTO_5603 ) ) ( not ( = ?AUTO_5597 ?AUTO_5603 ) ) ( not ( = ?AUTO_5600 ?AUTO_5603 ) ) ( not ( = ?AUTO_5601 ?AUTO_5603 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5598 ?AUTO_5603 ?AUTO_5601 )
      ( GET_ROCK_DATA ?AUTO_5596 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5596 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5604 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5611 - LANDER
      ?AUTO_5607 - WAYPOINT
      ?AUTO_5610 - WAYPOINT
      ?AUTO_5605 - ROVER
      ?AUTO_5609 - WAYPOINT
      ?AUTO_5606 - STORE
      ?AUTO_5608 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5611 ?AUTO_5607 ) ( VISIBLE ?AUTO_5610 ?AUTO_5607 ) ( AVAILABLE ?AUTO_5605 ) ( CHANNEL_FREE ?AUTO_5611 ) ( not ( = ?AUTO_5604 ?AUTO_5610 ) ) ( not ( = ?AUTO_5604 ?AUTO_5607 ) ) ( not ( = ?AUTO_5610 ?AUTO_5607 ) ) ( CAN_TRAVERSE ?AUTO_5605 ?AUTO_5609 ?AUTO_5610 ) ( VISIBLE ?AUTO_5609 ?AUTO_5610 ) ( not ( = ?AUTO_5604 ?AUTO_5609 ) ) ( not ( = ?AUTO_5607 ?AUTO_5609 ) ) ( not ( = ?AUTO_5610 ?AUTO_5609 ) ) ( CAN_TRAVERSE ?AUTO_5605 ?AUTO_5604 ?AUTO_5609 ) ( VISIBLE ?AUTO_5604 ?AUTO_5609 ) ( AT_ROCK_SAMPLE ?AUTO_5604 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5605 ) ( STORE_OF ?AUTO_5606 ?AUTO_5605 ) ( CAN_TRAVERSE ?AUTO_5605 ?AUTO_5610 ?AUTO_5604 ) ( VISIBLE ?AUTO_5610 ?AUTO_5604 ) ( CAN_TRAVERSE ?AUTO_5605 ?AUTO_5608 ?AUTO_5609 ) ( AT ?AUTO_5605 ?AUTO_5608 ) ( VISIBLE ?AUTO_5608 ?AUTO_5609 ) ( not ( = ?AUTO_5604 ?AUTO_5608 ) ) ( not ( = ?AUTO_5607 ?AUTO_5608 ) ) ( not ( = ?AUTO_5610 ?AUTO_5608 ) ) ( not ( = ?AUTO_5609 ?AUTO_5608 ) ) ( AT_ROCK_SAMPLE ?AUTO_5608 ) ( EMPTY ?AUTO_5606 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5605 ?AUTO_5606 ?AUTO_5608 )
      ( GET_ROCK_DATA ?AUTO_5604 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5604 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5633 - OBJECTIVE
      ?AUTO_5634 - MODE
    )
    :vars
    (
      ?AUTO_5638 - LANDER
      ?AUTO_5636 - WAYPOINT
      ?AUTO_5639 - WAYPOINT
      ?AUTO_5635 - ROVER
      ?AUTO_5637 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5638 ?AUTO_5636 ) ( VISIBLE ?AUTO_5639 ?AUTO_5636 ) ( AVAILABLE ?AUTO_5635 ) ( CHANNEL_FREE ?AUTO_5638 ) ( not ( = ?AUTO_5639 ?AUTO_5636 ) ) ( CAN_TRAVERSE ?AUTO_5635 ?AUTO_5636 ?AUTO_5639 ) ( VISIBLE ?AUTO_5636 ?AUTO_5639 ) ( CALIBRATED ?AUTO_5637 ?AUTO_5635 ) ( ON_BOARD ?AUTO_5637 ?AUTO_5635 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5635 ) ( SUPPORTS ?AUTO_5637 ?AUTO_5634 ) ( VISIBLE_FROM ?AUTO_5633 ?AUTO_5636 ) ( CAN_TRAVERSE ?AUTO_5635 ?AUTO_5639 ?AUTO_5636 ) ( AT ?AUTO_5635 ?AUTO_5639 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5635 ?AUTO_5639 ?AUTO_5636 )
      ( GET_IMAGE_DATA ?AUTO_5633 ?AUTO_5634 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5633 ?AUTO_5634 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5640 - OBJECTIVE
      ?AUTO_5641 - MODE
    )
    :vars
    (
      ?AUTO_5643 - LANDER
      ?AUTO_5646 - WAYPOINT
      ?AUTO_5644 - WAYPOINT
      ?AUTO_5642 - ROVER
      ?AUTO_5645 - CAMERA
      ?AUTO_5647 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5643 ?AUTO_5646 ) ( VISIBLE ?AUTO_5644 ?AUTO_5646 ) ( AVAILABLE ?AUTO_5642 ) ( CHANNEL_FREE ?AUTO_5643 ) ( not ( = ?AUTO_5644 ?AUTO_5646 ) ) ( CAN_TRAVERSE ?AUTO_5642 ?AUTO_5646 ?AUTO_5644 ) ( VISIBLE ?AUTO_5646 ?AUTO_5644 ) ( ON_BOARD ?AUTO_5645 ?AUTO_5642 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5642 ) ( SUPPORTS ?AUTO_5645 ?AUTO_5641 ) ( VISIBLE_FROM ?AUTO_5640 ?AUTO_5646 ) ( CAN_TRAVERSE ?AUTO_5642 ?AUTO_5644 ?AUTO_5646 ) ( AT ?AUTO_5642 ?AUTO_5644 ) ( CALIBRATION_TARGET ?AUTO_5645 ?AUTO_5647 ) ( VISIBLE_FROM ?AUTO_5647 ?AUTO_5644 ) ( not ( = ?AUTO_5640 ?AUTO_5647 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_5642 ?AUTO_5645 ?AUTO_5647 ?AUTO_5644 )
      ( GET_IMAGE_DATA ?AUTO_5640 ?AUTO_5641 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5640 ?AUTO_5641 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5648 - OBJECTIVE
      ?AUTO_5649 - MODE
    )
    :vars
    (
      ?AUTO_5650 - LANDER
      ?AUTO_5653 - WAYPOINT
      ?AUTO_5655 - WAYPOINT
      ?AUTO_5651 - ROVER
      ?AUTO_5654 - CAMERA
      ?AUTO_5652 - OBJECTIVE
      ?AUTO_5656 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5650 ?AUTO_5653 ) ( VISIBLE ?AUTO_5655 ?AUTO_5653 ) ( AVAILABLE ?AUTO_5651 ) ( CHANNEL_FREE ?AUTO_5650 ) ( not ( = ?AUTO_5655 ?AUTO_5653 ) ) ( CAN_TRAVERSE ?AUTO_5651 ?AUTO_5653 ?AUTO_5655 ) ( VISIBLE ?AUTO_5653 ?AUTO_5655 ) ( ON_BOARD ?AUTO_5654 ?AUTO_5651 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5651 ) ( SUPPORTS ?AUTO_5654 ?AUTO_5649 ) ( VISIBLE_FROM ?AUTO_5648 ?AUTO_5653 ) ( CAN_TRAVERSE ?AUTO_5651 ?AUTO_5655 ?AUTO_5653 ) ( CALIBRATION_TARGET ?AUTO_5654 ?AUTO_5652 ) ( VISIBLE_FROM ?AUTO_5652 ?AUTO_5655 ) ( not ( = ?AUTO_5648 ?AUTO_5652 ) ) ( CAN_TRAVERSE ?AUTO_5651 ?AUTO_5656 ?AUTO_5655 ) ( AT ?AUTO_5651 ?AUTO_5656 ) ( VISIBLE ?AUTO_5656 ?AUTO_5655 ) ( not ( = ?AUTO_5653 ?AUTO_5656 ) ) ( not ( = ?AUTO_5655 ?AUTO_5656 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5651 ?AUTO_5656 ?AUTO_5655 )
      ( GET_IMAGE_DATA ?AUTO_5648 ?AUTO_5649 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5648 ?AUTO_5649 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5750 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5751 - LANDER
      ?AUTO_5754 - WAYPOINT
      ?AUTO_5755 - WAYPOINT
      ?AUTO_5752 - ROVER
      ?AUTO_5753 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5751 ?AUTO_5754 ) ( VISIBLE ?AUTO_5755 ?AUTO_5754 ) ( AVAILABLE ?AUTO_5752 ) ( CHANNEL_FREE ?AUTO_5751 ) ( not ( = ?AUTO_5750 ?AUTO_5755 ) ) ( not ( = ?AUTO_5750 ?AUTO_5754 ) ) ( not ( = ?AUTO_5755 ?AUTO_5754 ) ) ( CAN_TRAVERSE ?AUTO_5752 ?AUTO_5750 ?AUTO_5755 ) ( VISIBLE ?AUTO_5750 ?AUTO_5755 ) ( AT_ROCK_SAMPLE ?AUTO_5750 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5752 ) ( STORE_OF ?AUTO_5753 ?AUTO_5752 ) ( CAN_TRAVERSE ?AUTO_5752 ?AUTO_5755 ?AUTO_5750 ) ( VISIBLE ?AUTO_5755 ?AUTO_5750 ) ( CAN_TRAVERSE ?AUTO_5752 ?AUTO_5754 ?AUTO_5755 ) ( AT ?AUTO_5752 ?AUTO_5754 ) ( VISIBLE ?AUTO_5754 ?AUTO_5755 ) ( FULL ?AUTO_5753 ) )
    :subtasks
    ( ( !DROP ?AUTO_5752 ?AUTO_5753 )
      ( GET_ROCK_DATA ?AUTO_5750 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5750 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5839 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5841 - LANDER
      ?AUTO_5843 - WAYPOINT
      ?AUTO_5845 - ROVER
      ?AUTO_5842 - STORE
      ?AUTO_5844 - WAYPOINT
      ?AUTO_5840 - WAYPOINT
      ?AUTO_5846 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5841 ?AUTO_5839 ) ( VISIBLE ?AUTO_5843 ?AUTO_5839 ) ( AVAILABLE ?AUTO_5845 ) ( CHANNEL_FREE ?AUTO_5841 ) ( not ( = ?AUTO_5839 ?AUTO_5843 ) ) ( CAN_TRAVERSE ?AUTO_5845 ?AUTO_5839 ?AUTO_5843 ) ( VISIBLE ?AUTO_5839 ?AUTO_5843 ) ( AT_SOIL_SAMPLE ?AUTO_5839 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5845 ) ( STORE_OF ?AUTO_5842 ?AUTO_5845 ) ( EMPTY ?AUTO_5842 ) ( CAN_TRAVERSE ?AUTO_5845 ?AUTO_5844 ?AUTO_5839 ) ( VISIBLE ?AUTO_5844 ?AUTO_5839 ) ( not ( = ?AUTO_5839 ?AUTO_5844 ) ) ( not ( = ?AUTO_5843 ?AUTO_5844 ) ) ( CAN_TRAVERSE ?AUTO_5845 ?AUTO_5840 ?AUTO_5844 ) ( VISIBLE ?AUTO_5840 ?AUTO_5844 ) ( not ( = ?AUTO_5839 ?AUTO_5840 ) ) ( not ( = ?AUTO_5843 ?AUTO_5840 ) ) ( not ( = ?AUTO_5844 ?AUTO_5840 ) ) ( CAN_TRAVERSE ?AUTO_5845 ?AUTO_5846 ?AUTO_5840 ) ( AT ?AUTO_5845 ?AUTO_5846 ) ( VISIBLE ?AUTO_5846 ?AUTO_5840 ) ( not ( = ?AUTO_5839 ?AUTO_5846 ) ) ( not ( = ?AUTO_5843 ?AUTO_5846 ) ) ( not ( = ?AUTO_5844 ?AUTO_5846 ) ) ( not ( = ?AUTO_5840 ?AUTO_5846 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5845 ?AUTO_5846 ?AUTO_5840 )
      ( GET_SOIL_DATA ?AUTO_5839 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5839 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5847 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5854 - LANDER
      ?AUTO_5852 - WAYPOINT
      ?AUTO_5849 - ROVER
      ?AUTO_5853 - STORE
      ?AUTO_5851 - WAYPOINT
      ?AUTO_5848 - WAYPOINT
      ?AUTO_5850 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5854 ?AUTO_5847 ) ( VISIBLE ?AUTO_5852 ?AUTO_5847 ) ( AVAILABLE ?AUTO_5849 ) ( CHANNEL_FREE ?AUTO_5854 ) ( not ( = ?AUTO_5847 ?AUTO_5852 ) ) ( CAN_TRAVERSE ?AUTO_5849 ?AUTO_5847 ?AUTO_5852 ) ( VISIBLE ?AUTO_5847 ?AUTO_5852 ) ( AT_SOIL_SAMPLE ?AUTO_5847 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5849 ) ( STORE_OF ?AUTO_5853 ?AUTO_5849 ) ( CAN_TRAVERSE ?AUTO_5849 ?AUTO_5851 ?AUTO_5847 ) ( VISIBLE ?AUTO_5851 ?AUTO_5847 ) ( not ( = ?AUTO_5847 ?AUTO_5851 ) ) ( not ( = ?AUTO_5852 ?AUTO_5851 ) ) ( CAN_TRAVERSE ?AUTO_5849 ?AUTO_5848 ?AUTO_5851 ) ( VISIBLE ?AUTO_5848 ?AUTO_5851 ) ( not ( = ?AUTO_5847 ?AUTO_5848 ) ) ( not ( = ?AUTO_5852 ?AUTO_5848 ) ) ( not ( = ?AUTO_5851 ?AUTO_5848 ) ) ( CAN_TRAVERSE ?AUTO_5849 ?AUTO_5850 ?AUTO_5848 ) ( AT ?AUTO_5849 ?AUTO_5850 ) ( VISIBLE ?AUTO_5850 ?AUTO_5848 ) ( not ( = ?AUTO_5847 ?AUTO_5850 ) ) ( not ( = ?AUTO_5852 ?AUTO_5850 ) ) ( not ( = ?AUTO_5851 ?AUTO_5850 ) ) ( not ( = ?AUTO_5848 ?AUTO_5850 ) ) ( FULL ?AUTO_5853 ) )
    :subtasks
    ( ( !DROP ?AUTO_5849 ?AUTO_5853 )
      ( GET_SOIL_DATA ?AUTO_5847 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5847 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5856 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5858 - LANDER
      ?AUTO_5861 - WAYPOINT
      ?AUTO_5863 - ROVER
      ?AUTO_5860 - STORE
      ?AUTO_5857 - WAYPOINT
      ?AUTO_5862 - WAYPOINT
      ?AUTO_5859 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5858 ?AUTO_5856 ) ( VISIBLE ?AUTO_5861 ?AUTO_5856 ) ( AVAILABLE ?AUTO_5863 ) ( CHANNEL_FREE ?AUTO_5858 ) ( not ( = ?AUTO_5856 ?AUTO_5861 ) ) ( CAN_TRAVERSE ?AUTO_5863 ?AUTO_5856 ?AUTO_5861 ) ( VISIBLE ?AUTO_5856 ?AUTO_5861 ) ( AT_SOIL_SAMPLE ?AUTO_5856 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5863 ) ( STORE_OF ?AUTO_5860 ?AUTO_5863 ) ( EMPTY ?AUTO_5860 ) ( CAN_TRAVERSE ?AUTO_5863 ?AUTO_5857 ?AUTO_5856 ) ( VISIBLE ?AUTO_5857 ?AUTO_5856 ) ( not ( = ?AUTO_5856 ?AUTO_5857 ) ) ( not ( = ?AUTO_5861 ?AUTO_5857 ) ) ( CAN_TRAVERSE ?AUTO_5863 ?AUTO_5862 ?AUTO_5857 ) ( VISIBLE ?AUTO_5862 ?AUTO_5857 ) ( not ( = ?AUTO_5856 ?AUTO_5862 ) ) ( not ( = ?AUTO_5861 ?AUTO_5862 ) ) ( not ( = ?AUTO_5857 ?AUTO_5862 ) ) ( CAN_TRAVERSE ?AUTO_5863 ?AUTO_5859 ?AUTO_5862 ) ( VISIBLE ?AUTO_5859 ?AUTO_5862 ) ( not ( = ?AUTO_5856 ?AUTO_5859 ) ) ( not ( = ?AUTO_5861 ?AUTO_5859 ) ) ( not ( = ?AUTO_5857 ?AUTO_5859 ) ) ( not ( = ?AUTO_5862 ?AUTO_5859 ) ) ( CAN_TRAVERSE ?AUTO_5863 ?AUTO_5861 ?AUTO_5859 ) ( AT ?AUTO_5863 ?AUTO_5861 ) ( VISIBLE ?AUTO_5861 ?AUTO_5859 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5863 ?AUTO_5861 ?AUTO_5859 )
      ( GET_SOIL_DATA ?AUTO_5856 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5856 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5864 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5865 - LANDER
      ?AUTO_5870 - WAYPOINT
      ?AUTO_5868 - ROVER
      ?AUTO_5867 - STORE
      ?AUTO_5866 - WAYPOINT
      ?AUTO_5869 - WAYPOINT
      ?AUTO_5871 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5865 ?AUTO_5864 ) ( VISIBLE ?AUTO_5870 ?AUTO_5864 ) ( AVAILABLE ?AUTO_5868 ) ( CHANNEL_FREE ?AUTO_5865 ) ( not ( = ?AUTO_5864 ?AUTO_5870 ) ) ( CAN_TRAVERSE ?AUTO_5868 ?AUTO_5864 ?AUTO_5870 ) ( VISIBLE ?AUTO_5864 ?AUTO_5870 ) ( AT_SOIL_SAMPLE ?AUTO_5864 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5868 ) ( STORE_OF ?AUTO_5867 ?AUTO_5868 ) ( CAN_TRAVERSE ?AUTO_5868 ?AUTO_5866 ?AUTO_5864 ) ( VISIBLE ?AUTO_5866 ?AUTO_5864 ) ( not ( = ?AUTO_5864 ?AUTO_5866 ) ) ( not ( = ?AUTO_5870 ?AUTO_5866 ) ) ( CAN_TRAVERSE ?AUTO_5868 ?AUTO_5869 ?AUTO_5866 ) ( VISIBLE ?AUTO_5869 ?AUTO_5866 ) ( not ( = ?AUTO_5864 ?AUTO_5869 ) ) ( not ( = ?AUTO_5870 ?AUTO_5869 ) ) ( not ( = ?AUTO_5866 ?AUTO_5869 ) ) ( CAN_TRAVERSE ?AUTO_5868 ?AUTO_5871 ?AUTO_5869 ) ( VISIBLE ?AUTO_5871 ?AUTO_5869 ) ( not ( = ?AUTO_5864 ?AUTO_5871 ) ) ( not ( = ?AUTO_5870 ?AUTO_5871 ) ) ( not ( = ?AUTO_5866 ?AUTO_5871 ) ) ( not ( = ?AUTO_5869 ?AUTO_5871 ) ) ( CAN_TRAVERSE ?AUTO_5868 ?AUTO_5870 ?AUTO_5871 ) ( AT ?AUTO_5868 ?AUTO_5870 ) ( VISIBLE ?AUTO_5870 ?AUTO_5871 ) ( FULL ?AUTO_5867 ) )
    :subtasks
    ( ( !DROP ?AUTO_5868 ?AUTO_5867 )
      ( GET_SOIL_DATA ?AUTO_5864 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5864 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5885 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5889 - LANDER
      ?AUTO_5887 - WAYPOINT
      ?AUTO_5886 - ROVER
      ?AUTO_5888 - WAYPOINT
      ?AUTO_5890 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5889 ?AUTO_5887 ) ( HAVE_ROCK_ANALYSIS ?AUTO_5886 ?AUTO_5885 ) ( VISIBLE ?AUTO_5888 ?AUTO_5887 ) ( AVAILABLE ?AUTO_5886 ) ( CHANNEL_FREE ?AUTO_5889 ) ( not ( = ?AUTO_5885 ?AUTO_5888 ) ) ( not ( = ?AUTO_5885 ?AUTO_5887 ) ) ( not ( = ?AUTO_5888 ?AUTO_5887 ) ) ( CAN_TRAVERSE ?AUTO_5886 ?AUTO_5885 ?AUTO_5888 ) ( VISIBLE ?AUTO_5885 ?AUTO_5888 ) ( CAN_TRAVERSE ?AUTO_5886 ?AUTO_5890 ?AUTO_5885 ) ( AT ?AUTO_5886 ?AUTO_5890 ) ( VISIBLE ?AUTO_5890 ?AUTO_5885 ) ( not ( = ?AUTO_5885 ?AUTO_5890 ) ) ( not ( = ?AUTO_5887 ?AUTO_5890 ) ) ( not ( = ?AUTO_5888 ?AUTO_5890 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5886 ?AUTO_5890 ?AUTO_5885 )
      ( GET_ROCK_DATA ?AUTO_5885 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5885 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5912 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5913 - LANDER
      ?AUTO_5914 - WAYPOINT
      ?AUTO_5916 - WAYPOINT
      ?AUTO_5915 - ROVER
      ?AUTO_5917 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5913 ?AUTO_5914 ) ( VISIBLE ?AUTO_5916 ?AUTO_5914 ) ( AVAILABLE ?AUTO_5915 ) ( CHANNEL_FREE ?AUTO_5913 ) ( not ( = ?AUTO_5912 ?AUTO_5916 ) ) ( not ( = ?AUTO_5912 ?AUTO_5914 ) ) ( not ( = ?AUTO_5916 ?AUTO_5914 ) ) ( CAN_TRAVERSE ?AUTO_5915 ?AUTO_5912 ?AUTO_5916 ) ( VISIBLE ?AUTO_5912 ?AUTO_5916 ) ( AT_ROCK_SAMPLE ?AUTO_5912 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5915 ) ( STORE_OF ?AUTO_5917 ?AUTO_5915 ) ( CAN_TRAVERSE ?AUTO_5915 ?AUTO_5916 ?AUTO_5912 ) ( VISIBLE ?AUTO_5916 ?AUTO_5912 ) ( FULL ?AUTO_5917 ) ( CAN_TRAVERSE ?AUTO_5915 ?AUTO_5914 ?AUTO_5916 ) ( AT ?AUTO_5915 ?AUTO_5914 ) ( VISIBLE ?AUTO_5914 ?AUTO_5916 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5915 ?AUTO_5914 ?AUTO_5916 )
      ( GET_ROCK_DATA ?AUTO_5912 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5912 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5918 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5920 - LANDER
      ?AUTO_5923 - WAYPOINT
      ?AUTO_5919 - WAYPOINT
      ?AUTO_5921 - ROVER
      ?AUTO_5922 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5920 ?AUTO_5923 ) ( VISIBLE ?AUTO_5919 ?AUTO_5923 ) ( AVAILABLE ?AUTO_5921 ) ( CHANNEL_FREE ?AUTO_5920 ) ( not ( = ?AUTO_5918 ?AUTO_5919 ) ) ( not ( = ?AUTO_5918 ?AUTO_5923 ) ) ( not ( = ?AUTO_5919 ?AUTO_5923 ) ) ( CAN_TRAVERSE ?AUTO_5921 ?AUTO_5918 ?AUTO_5919 ) ( VISIBLE ?AUTO_5918 ?AUTO_5919 ) ( AT_ROCK_SAMPLE ?AUTO_5918 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5921 ) ( STORE_OF ?AUTO_5922 ?AUTO_5921 ) ( CAN_TRAVERSE ?AUTO_5921 ?AUTO_5919 ?AUTO_5918 ) ( VISIBLE ?AUTO_5919 ?AUTO_5918 ) ( CAN_TRAVERSE ?AUTO_5921 ?AUTO_5923 ?AUTO_5919 ) ( AT ?AUTO_5921 ?AUTO_5923 ) ( VISIBLE ?AUTO_5923 ?AUTO_5919 ) ( AT_SOIL_SAMPLE ?AUTO_5923 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5921 ) ( EMPTY ?AUTO_5922 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_5921 ?AUTO_5922 ?AUTO_5923 )
      ( GET_ROCK_DATA ?AUTO_5918 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5918 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5951 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5953 - LANDER
      ?AUTO_5952 - WAYPOINT
      ?AUTO_5957 - WAYPOINT
      ?AUTO_5958 - ROVER
      ?AUTO_5955 - STORE
      ?AUTO_5956 - WAYPOINT
      ?AUTO_5954 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5953 ?AUTO_5952 ) ( VISIBLE ?AUTO_5957 ?AUTO_5952 ) ( AVAILABLE ?AUTO_5958 ) ( CHANNEL_FREE ?AUTO_5953 ) ( not ( = ?AUTO_5951 ?AUTO_5957 ) ) ( not ( = ?AUTO_5951 ?AUTO_5952 ) ) ( not ( = ?AUTO_5957 ?AUTO_5952 ) ) ( CAN_TRAVERSE ?AUTO_5958 ?AUTO_5951 ?AUTO_5957 ) ( VISIBLE ?AUTO_5951 ?AUTO_5957 ) ( AT_ROCK_SAMPLE ?AUTO_5951 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5958 ) ( STORE_OF ?AUTO_5955 ?AUTO_5958 ) ( CAN_TRAVERSE ?AUTO_5958 ?AUTO_5956 ?AUTO_5951 ) ( VISIBLE ?AUTO_5956 ?AUTO_5951 ) ( not ( = ?AUTO_5951 ?AUTO_5956 ) ) ( not ( = ?AUTO_5952 ?AUTO_5956 ) ) ( not ( = ?AUTO_5957 ?AUTO_5956 ) ) ( CAN_TRAVERSE ?AUTO_5958 ?AUTO_5954 ?AUTO_5956 ) ( AT ?AUTO_5958 ?AUTO_5954 ) ( VISIBLE ?AUTO_5954 ?AUTO_5956 ) ( not ( = ?AUTO_5951 ?AUTO_5954 ) ) ( not ( = ?AUTO_5952 ?AUTO_5954 ) ) ( not ( = ?AUTO_5957 ?AUTO_5954 ) ) ( not ( = ?AUTO_5956 ?AUTO_5954 ) ) ( FULL ?AUTO_5955 ) )
    :subtasks
    ( ( !DROP ?AUTO_5958 ?AUTO_5955 )
      ( GET_ROCK_DATA ?AUTO_5951 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5951 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6052 - OBJECTIVE
      ?AUTO_6053 - MODE
    )
    :vars
    (
      ?AUTO_6058 - LANDER
      ?AUTO_6060 - WAYPOINT
      ?AUTO_6059 - WAYPOINT
      ?AUTO_6055 - ROVER
      ?AUTO_6054 - WAYPOINT
      ?AUTO_6061 - WAYPOINT
      ?AUTO_6057 - CAMERA
      ?AUTO_6056 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6058 ?AUTO_6060 ) ( VISIBLE ?AUTO_6059 ?AUTO_6060 ) ( AVAILABLE ?AUTO_6055 ) ( CHANNEL_FREE ?AUTO_6058 ) ( not ( = ?AUTO_6059 ?AUTO_6060 ) ) ( CAN_TRAVERSE ?AUTO_6055 ?AUTO_6054 ?AUTO_6059 ) ( VISIBLE ?AUTO_6054 ?AUTO_6059 ) ( not ( = ?AUTO_6060 ?AUTO_6054 ) ) ( not ( = ?AUTO_6059 ?AUTO_6054 ) ) ( CAN_TRAVERSE ?AUTO_6055 ?AUTO_6061 ?AUTO_6054 ) ( VISIBLE ?AUTO_6061 ?AUTO_6054 ) ( not ( = ?AUTO_6060 ?AUTO_6061 ) ) ( not ( = ?AUTO_6059 ?AUTO_6061 ) ) ( not ( = ?AUTO_6054 ?AUTO_6061 ) ) ( ON_BOARD ?AUTO_6057 ?AUTO_6055 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6055 ) ( SUPPORTS ?AUTO_6057 ?AUTO_6053 ) ( VISIBLE_FROM ?AUTO_6052 ?AUTO_6061 ) ( CAN_TRAVERSE ?AUTO_6055 ?AUTO_6054 ?AUTO_6061 ) ( VISIBLE ?AUTO_6054 ?AUTO_6061 ) ( CAN_TRAVERSE ?AUTO_6055 ?AUTO_6059 ?AUTO_6054 ) ( VISIBLE ?AUTO_6059 ?AUTO_6054 ) ( CAN_TRAVERSE ?AUTO_6055 ?AUTO_6060 ?AUTO_6059 ) ( VISIBLE ?AUTO_6060 ?AUTO_6059 ) ( CALIBRATION_TARGET ?AUTO_6057 ?AUTO_6056 ) ( VISIBLE_FROM ?AUTO_6056 ?AUTO_6060 ) ( not ( = ?AUTO_6052 ?AUTO_6056 ) ) ( CAN_TRAVERSE ?AUTO_6055 ?AUTO_6059 ?AUTO_6060 ) ( AT ?AUTO_6055 ?AUTO_6054 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6055 ?AUTO_6054 ?AUTO_6059 )
      ( GET_IMAGE_DATA ?AUTO_6052 ?AUTO_6053 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6052 ?AUTO_6053 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6062 - OBJECTIVE
      ?AUTO_6063 - MODE
    )
    :vars
    (
      ?AUTO_6068 - LANDER
      ?AUTO_6069 - WAYPOINT
      ?AUTO_6067 - WAYPOINT
      ?AUTO_6070 - ROVER
      ?AUTO_6066 - WAYPOINT
      ?AUTO_6071 - WAYPOINT
      ?AUTO_6064 - CAMERA
      ?AUTO_6065 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6068 ?AUTO_6069 ) ( VISIBLE ?AUTO_6067 ?AUTO_6069 ) ( AVAILABLE ?AUTO_6070 ) ( CHANNEL_FREE ?AUTO_6068 ) ( not ( = ?AUTO_6067 ?AUTO_6069 ) ) ( CAN_TRAVERSE ?AUTO_6070 ?AUTO_6066 ?AUTO_6067 ) ( VISIBLE ?AUTO_6066 ?AUTO_6067 ) ( not ( = ?AUTO_6069 ?AUTO_6066 ) ) ( not ( = ?AUTO_6067 ?AUTO_6066 ) ) ( CAN_TRAVERSE ?AUTO_6070 ?AUTO_6071 ?AUTO_6066 ) ( VISIBLE ?AUTO_6071 ?AUTO_6066 ) ( not ( = ?AUTO_6069 ?AUTO_6071 ) ) ( not ( = ?AUTO_6067 ?AUTO_6071 ) ) ( not ( = ?AUTO_6066 ?AUTO_6071 ) ) ( ON_BOARD ?AUTO_6064 ?AUTO_6070 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6070 ) ( SUPPORTS ?AUTO_6064 ?AUTO_6063 ) ( VISIBLE_FROM ?AUTO_6062 ?AUTO_6071 ) ( CAN_TRAVERSE ?AUTO_6070 ?AUTO_6066 ?AUTO_6071 ) ( VISIBLE ?AUTO_6066 ?AUTO_6071 ) ( CAN_TRAVERSE ?AUTO_6070 ?AUTO_6067 ?AUTO_6066 ) ( VISIBLE ?AUTO_6067 ?AUTO_6066 ) ( CAN_TRAVERSE ?AUTO_6070 ?AUTO_6069 ?AUTO_6067 ) ( VISIBLE ?AUTO_6069 ?AUTO_6067 ) ( CALIBRATION_TARGET ?AUTO_6064 ?AUTO_6065 ) ( VISIBLE_FROM ?AUTO_6065 ?AUTO_6069 ) ( not ( = ?AUTO_6062 ?AUTO_6065 ) ) ( CAN_TRAVERSE ?AUTO_6070 ?AUTO_6067 ?AUTO_6069 ) ( AT ?AUTO_6070 ?AUTO_6071 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6070 ?AUTO_6071 ?AUTO_6066 )
      ( GET_IMAGE_DATA ?AUTO_6062 ?AUTO_6063 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6062 ?AUTO_6063 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6076 - OBJECTIVE
      ?AUTO_6077 - MODE
    )
    :vars
    (
      ?AUTO_6081 - LANDER
      ?AUTO_6083 - WAYPOINT
      ?AUTO_6085 - WAYPOINT
      ?AUTO_6079 - ROVER
      ?AUTO_6084 - WAYPOINT
      ?AUTO_6080 - WAYPOINT
      ?AUTO_6082 - CAMERA
      ?AUTO_6078 - OBJECTIVE
      ?AUTO_6086 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6081 ?AUTO_6083 ) ( VISIBLE ?AUTO_6085 ?AUTO_6083 ) ( AVAILABLE ?AUTO_6079 ) ( CHANNEL_FREE ?AUTO_6081 ) ( not ( = ?AUTO_6085 ?AUTO_6083 ) ) ( CAN_TRAVERSE ?AUTO_6079 ?AUTO_6084 ?AUTO_6085 ) ( VISIBLE ?AUTO_6084 ?AUTO_6085 ) ( not ( = ?AUTO_6083 ?AUTO_6084 ) ) ( not ( = ?AUTO_6085 ?AUTO_6084 ) ) ( CAN_TRAVERSE ?AUTO_6079 ?AUTO_6080 ?AUTO_6084 ) ( VISIBLE ?AUTO_6080 ?AUTO_6084 ) ( not ( = ?AUTO_6083 ?AUTO_6080 ) ) ( not ( = ?AUTO_6085 ?AUTO_6080 ) ) ( not ( = ?AUTO_6084 ?AUTO_6080 ) ) ( ON_BOARD ?AUTO_6082 ?AUTO_6079 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6079 ) ( SUPPORTS ?AUTO_6082 ?AUTO_6077 ) ( VISIBLE_FROM ?AUTO_6076 ?AUTO_6080 ) ( CAN_TRAVERSE ?AUTO_6079 ?AUTO_6084 ?AUTO_6080 ) ( VISIBLE ?AUTO_6084 ?AUTO_6080 ) ( CAN_TRAVERSE ?AUTO_6079 ?AUTO_6085 ?AUTO_6084 ) ( VISIBLE ?AUTO_6085 ?AUTO_6084 ) ( CAN_TRAVERSE ?AUTO_6079 ?AUTO_6083 ?AUTO_6085 ) ( VISIBLE ?AUTO_6083 ?AUTO_6085 ) ( CALIBRATION_TARGET ?AUTO_6082 ?AUTO_6078 ) ( VISIBLE_FROM ?AUTO_6078 ?AUTO_6083 ) ( not ( = ?AUTO_6076 ?AUTO_6078 ) ) ( CAN_TRAVERSE ?AUTO_6079 ?AUTO_6085 ?AUTO_6083 ) ( CAN_TRAVERSE ?AUTO_6079 ?AUTO_6086 ?AUTO_6080 ) ( AT ?AUTO_6079 ?AUTO_6086 ) ( VISIBLE ?AUTO_6086 ?AUTO_6080 ) ( not ( = ?AUTO_6083 ?AUTO_6086 ) ) ( not ( = ?AUTO_6085 ?AUTO_6086 ) ) ( not ( = ?AUTO_6084 ?AUTO_6086 ) ) ( not ( = ?AUTO_6080 ?AUTO_6086 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6079 ?AUTO_6086 ?AUTO_6080 )
      ( GET_IMAGE_DATA ?AUTO_6076 ?AUTO_6077 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6076 ?AUTO_6077 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6177 - OBJECTIVE
      ?AUTO_6178 - MODE
    )
    :vars
    (
      ?AUTO_6183 - LANDER
      ?AUTO_6184 - WAYPOINT
      ?AUTO_6181 - WAYPOINT
      ?AUTO_6180 - ROVER
      ?AUTO_6179 - CAMERA
      ?AUTO_6182 - WAYPOINT
      ?AUTO_6185 - WAYPOINT
      ?AUTO_6186 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6183 ?AUTO_6184 ) ( VISIBLE ?AUTO_6181 ?AUTO_6184 ) ( AVAILABLE ?AUTO_6180 ) ( CHANNEL_FREE ?AUTO_6183 ) ( not ( = ?AUTO_6181 ?AUTO_6184 ) ) ( ON_BOARD ?AUTO_6179 ?AUTO_6180 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6180 ) ( SUPPORTS ?AUTO_6179 ?AUTO_6178 ) ( VISIBLE_FROM ?AUTO_6177 ?AUTO_6181 ) ( CAN_TRAVERSE ?AUTO_6180 ?AUTO_6182 ?AUTO_6181 ) ( VISIBLE ?AUTO_6182 ?AUTO_6181 ) ( not ( = ?AUTO_6184 ?AUTO_6182 ) ) ( not ( = ?AUTO_6181 ?AUTO_6182 ) ) ( CAN_TRAVERSE ?AUTO_6180 ?AUTO_6185 ?AUTO_6182 ) ( AT ?AUTO_6180 ?AUTO_6185 ) ( VISIBLE ?AUTO_6185 ?AUTO_6182 ) ( not ( = ?AUTO_6184 ?AUTO_6185 ) ) ( not ( = ?AUTO_6181 ?AUTO_6185 ) ) ( not ( = ?AUTO_6182 ?AUTO_6185 ) ) ( CALIBRATION_TARGET ?AUTO_6179 ?AUTO_6186 ) ( VISIBLE_FROM ?AUTO_6186 ?AUTO_6185 ) ( not ( = ?AUTO_6177 ?AUTO_6186 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_6180 ?AUTO_6179 ?AUTO_6186 ?AUTO_6185 )
      ( GET_IMAGE_DATA ?AUTO_6177 ?AUTO_6178 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6177 ?AUTO_6178 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6187 - OBJECTIVE
      ?AUTO_6188 - MODE
    )
    :vars
    (
      ?AUTO_6194 - LANDER
      ?AUTO_6190 - WAYPOINT
      ?AUTO_6196 - WAYPOINT
      ?AUTO_6189 - ROVER
      ?AUTO_6192 - CAMERA
      ?AUTO_6193 - WAYPOINT
      ?AUTO_6191 - WAYPOINT
      ?AUTO_6195 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6194 ?AUTO_6190 ) ( VISIBLE ?AUTO_6196 ?AUTO_6190 ) ( AVAILABLE ?AUTO_6189 ) ( CHANNEL_FREE ?AUTO_6194 ) ( not ( = ?AUTO_6196 ?AUTO_6190 ) ) ( ON_BOARD ?AUTO_6192 ?AUTO_6189 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6189 ) ( SUPPORTS ?AUTO_6192 ?AUTO_6188 ) ( VISIBLE_FROM ?AUTO_6187 ?AUTO_6196 ) ( CAN_TRAVERSE ?AUTO_6189 ?AUTO_6193 ?AUTO_6196 ) ( VISIBLE ?AUTO_6193 ?AUTO_6196 ) ( not ( = ?AUTO_6190 ?AUTO_6193 ) ) ( not ( = ?AUTO_6196 ?AUTO_6193 ) ) ( CAN_TRAVERSE ?AUTO_6189 ?AUTO_6191 ?AUTO_6193 ) ( VISIBLE ?AUTO_6191 ?AUTO_6193 ) ( not ( = ?AUTO_6190 ?AUTO_6191 ) ) ( not ( = ?AUTO_6196 ?AUTO_6191 ) ) ( not ( = ?AUTO_6193 ?AUTO_6191 ) ) ( CALIBRATION_TARGET ?AUTO_6192 ?AUTO_6195 ) ( VISIBLE_FROM ?AUTO_6195 ?AUTO_6191 ) ( not ( = ?AUTO_6187 ?AUTO_6195 ) ) ( CAN_TRAVERSE ?AUTO_6189 ?AUTO_6196 ?AUTO_6191 ) ( AT ?AUTO_6189 ?AUTO_6196 ) ( VISIBLE ?AUTO_6196 ?AUTO_6191 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6189 ?AUTO_6196 ?AUTO_6191 )
      ( GET_IMAGE_DATA ?AUTO_6187 ?AUTO_6188 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6187 ?AUTO_6188 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6205 - OBJECTIVE
      ?AUTO_6206 - MODE
    )
    :vars
    (
      ?AUTO_6208 - LANDER
      ?AUTO_6209 - WAYPOINT
      ?AUTO_6214 - WAYPOINT
      ?AUTO_6207 - ROVER
      ?AUTO_6210 - CAMERA
      ?AUTO_6213 - WAYPOINT
      ?AUTO_6211 - WAYPOINT
      ?AUTO_6212 - OBJECTIVE
      ?AUTO_6215 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6208 ?AUTO_6209 ) ( VISIBLE ?AUTO_6214 ?AUTO_6209 ) ( AVAILABLE ?AUTO_6207 ) ( CHANNEL_FREE ?AUTO_6208 ) ( not ( = ?AUTO_6214 ?AUTO_6209 ) ) ( ON_BOARD ?AUTO_6210 ?AUTO_6207 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6207 ) ( SUPPORTS ?AUTO_6210 ?AUTO_6206 ) ( VISIBLE_FROM ?AUTO_6205 ?AUTO_6214 ) ( CAN_TRAVERSE ?AUTO_6207 ?AUTO_6213 ?AUTO_6214 ) ( VISIBLE ?AUTO_6213 ?AUTO_6214 ) ( not ( = ?AUTO_6209 ?AUTO_6213 ) ) ( not ( = ?AUTO_6214 ?AUTO_6213 ) ) ( CAN_TRAVERSE ?AUTO_6207 ?AUTO_6211 ?AUTO_6213 ) ( VISIBLE ?AUTO_6211 ?AUTO_6213 ) ( not ( = ?AUTO_6209 ?AUTO_6211 ) ) ( not ( = ?AUTO_6214 ?AUTO_6211 ) ) ( not ( = ?AUTO_6213 ?AUTO_6211 ) ) ( CALIBRATION_TARGET ?AUTO_6210 ?AUTO_6212 ) ( VISIBLE_FROM ?AUTO_6212 ?AUTO_6211 ) ( not ( = ?AUTO_6205 ?AUTO_6212 ) ) ( CAN_TRAVERSE ?AUTO_6207 ?AUTO_6214 ?AUTO_6211 ) ( VISIBLE ?AUTO_6214 ?AUTO_6211 ) ( CAN_TRAVERSE ?AUTO_6207 ?AUTO_6215 ?AUTO_6214 ) ( AT ?AUTO_6207 ?AUTO_6215 ) ( VISIBLE ?AUTO_6215 ?AUTO_6214 ) ( not ( = ?AUTO_6209 ?AUTO_6215 ) ) ( not ( = ?AUTO_6214 ?AUTO_6215 ) ) ( not ( = ?AUTO_6213 ?AUTO_6215 ) ) ( not ( = ?AUTO_6211 ?AUTO_6215 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6207 ?AUTO_6215 ?AUTO_6214 )
      ( GET_IMAGE_DATA ?AUTO_6205 ?AUTO_6206 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6205 ?AUTO_6206 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6222 - OBJECTIVE
      ?AUTO_6223 - MODE
    )
    :vars
    (
      ?AUTO_6226 - LANDER
      ?AUTO_6232 - WAYPOINT
      ?AUTO_6228 - WAYPOINT
      ?AUTO_6229 - ROVER
      ?AUTO_6224 - CAMERA
      ?AUTO_6230 - WAYPOINT
      ?AUTO_6225 - WAYPOINT
      ?AUTO_6231 - OBJECTIVE
      ?AUTO_6227 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6226 ?AUTO_6232 ) ( VISIBLE ?AUTO_6228 ?AUTO_6232 ) ( AVAILABLE ?AUTO_6229 ) ( CHANNEL_FREE ?AUTO_6226 ) ( not ( = ?AUTO_6228 ?AUTO_6232 ) ) ( ON_BOARD ?AUTO_6224 ?AUTO_6229 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6229 ) ( SUPPORTS ?AUTO_6224 ?AUTO_6223 ) ( VISIBLE_FROM ?AUTO_6222 ?AUTO_6228 ) ( CAN_TRAVERSE ?AUTO_6229 ?AUTO_6230 ?AUTO_6228 ) ( VISIBLE ?AUTO_6230 ?AUTO_6228 ) ( not ( = ?AUTO_6232 ?AUTO_6230 ) ) ( not ( = ?AUTO_6228 ?AUTO_6230 ) ) ( CAN_TRAVERSE ?AUTO_6229 ?AUTO_6225 ?AUTO_6230 ) ( VISIBLE ?AUTO_6225 ?AUTO_6230 ) ( not ( = ?AUTO_6232 ?AUTO_6225 ) ) ( not ( = ?AUTO_6228 ?AUTO_6225 ) ) ( not ( = ?AUTO_6230 ?AUTO_6225 ) ) ( CALIBRATION_TARGET ?AUTO_6224 ?AUTO_6231 ) ( VISIBLE_FROM ?AUTO_6231 ?AUTO_6225 ) ( not ( = ?AUTO_6222 ?AUTO_6231 ) ) ( CAN_TRAVERSE ?AUTO_6229 ?AUTO_6228 ?AUTO_6225 ) ( VISIBLE ?AUTO_6228 ?AUTO_6225 ) ( CAN_TRAVERSE ?AUTO_6229 ?AUTO_6227 ?AUTO_6228 ) ( VISIBLE ?AUTO_6227 ?AUTO_6228 ) ( not ( = ?AUTO_6232 ?AUTO_6227 ) ) ( not ( = ?AUTO_6228 ?AUTO_6227 ) ) ( not ( = ?AUTO_6230 ?AUTO_6227 ) ) ( not ( = ?AUTO_6225 ?AUTO_6227 ) ) ( CAN_TRAVERSE ?AUTO_6229 ?AUTO_6232 ?AUTO_6227 ) ( AT ?AUTO_6229 ?AUTO_6232 ) ( VISIBLE ?AUTO_6232 ?AUTO_6227 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6229 ?AUTO_6232 ?AUTO_6227 )
      ( GET_IMAGE_DATA ?AUTO_6222 ?AUTO_6223 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6222 ?AUTO_6223 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6280 - OBJECTIVE
      ?AUTO_6281 - MODE
    )
    :vars
    (
      ?AUTO_6282 - LANDER
      ?AUTO_6285 - WAYPOINT
      ?AUTO_6283 - WAYPOINT
      ?AUTO_6284 - ROVER
      ?AUTO_6286 - CAMERA
      ?AUTO_6287 - OBJECTIVE
      ?AUTO_6288 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6282 ?AUTO_6285 ) ( VISIBLE ?AUTO_6283 ?AUTO_6285 ) ( AVAILABLE ?AUTO_6284 ) ( CHANNEL_FREE ?AUTO_6282 ) ( not ( = ?AUTO_6283 ?AUTO_6285 ) ) ( ON_BOARD ?AUTO_6286 ?AUTO_6284 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6284 ) ( SUPPORTS ?AUTO_6286 ?AUTO_6281 ) ( VISIBLE_FROM ?AUTO_6280 ?AUTO_6283 ) ( CALIBRATION_TARGET ?AUTO_6286 ?AUTO_6287 ) ( VISIBLE_FROM ?AUTO_6287 ?AUTO_6283 ) ( not ( = ?AUTO_6280 ?AUTO_6287 ) ) ( CAN_TRAVERSE ?AUTO_6284 ?AUTO_6288 ?AUTO_6283 ) ( AT ?AUTO_6284 ?AUTO_6288 ) ( VISIBLE ?AUTO_6288 ?AUTO_6283 ) ( not ( = ?AUTO_6285 ?AUTO_6288 ) ) ( not ( = ?AUTO_6283 ?AUTO_6288 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6284 ?AUTO_6288 ?AUTO_6283 )
      ( GET_IMAGE_DATA ?AUTO_6280 ?AUTO_6281 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6280 ?AUTO_6281 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6291 - OBJECTIVE
      ?AUTO_6292 - MODE
    )
    :vars
    (
      ?AUTO_6298 - LANDER
      ?AUTO_6299 - WAYPOINT
      ?AUTO_6293 - WAYPOINT
      ?AUTO_6294 - ROVER
      ?AUTO_6297 - CAMERA
      ?AUTO_6295 - OBJECTIVE
      ?AUTO_6296 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6298 ?AUTO_6299 ) ( VISIBLE ?AUTO_6293 ?AUTO_6299 ) ( AVAILABLE ?AUTO_6294 ) ( CHANNEL_FREE ?AUTO_6298 ) ( not ( = ?AUTO_6293 ?AUTO_6299 ) ) ( ON_BOARD ?AUTO_6297 ?AUTO_6294 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6294 ) ( SUPPORTS ?AUTO_6297 ?AUTO_6292 ) ( VISIBLE_FROM ?AUTO_6291 ?AUTO_6293 ) ( CALIBRATION_TARGET ?AUTO_6297 ?AUTO_6295 ) ( VISIBLE_FROM ?AUTO_6295 ?AUTO_6293 ) ( not ( = ?AUTO_6291 ?AUTO_6295 ) ) ( CAN_TRAVERSE ?AUTO_6294 ?AUTO_6296 ?AUTO_6293 ) ( VISIBLE ?AUTO_6296 ?AUTO_6293 ) ( not ( = ?AUTO_6299 ?AUTO_6296 ) ) ( not ( = ?AUTO_6293 ?AUTO_6296 ) ) ( CAN_TRAVERSE ?AUTO_6294 ?AUTO_6299 ?AUTO_6296 ) ( AT ?AUTO_6294 ?AUTO_6299 ) ( VISIBLE ?AUTO_6299 ?AUTO_6296 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6294 ?AUTO_6299 ?AUTO_6296 )
      ( GET_IMAGE_DATA ?AUTO_6291 ?AUTO_6292 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6291 ?AUTO_6292 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6346 - OBJECTIVE
      ?AUTO_6347 - MODE
    )
    :vars
    (
      ?AUTO_6353 - LANDER
      ?AUTO_6350 - WAYPOINT
      ?AUTO_6349 - WAYPOINT
      ?AUTO_6352 - ROVER
      ?AUTO_6348 - CAMERA
      ?AUTO_6351 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6353 ?AUTO_6350 ) ( VISIBLE ?AUTO_6349 ?AUTO_6350 ) ( AVAILABLE ?AUTO_6352 ) ( CHANNEL_FREE ?AUTO_6353 ) ( not ( = ?AUTO_6349 ?AUTO_6350 ) ) ( ON_BOARD ?AUTO_6348 ?AUTO_6352 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6352 ) ( SUPPORTS ?AUTO_6348 ?AUTO_6347 ) ( VISIBLE_FROM ?AUTO_6346 ?AUTO_6349 ) ( CALIBRATION_TARGET ?AUTO_6348 ?AUTO_6346 ) ( CAN_TRAVERSE ?AUTO_6352 ?AUTO_6351 ?AUTO_6349 ) ( VISIBLE ?AUTO_6351 ?AUTO_6349 ) ( not ( = ?AUTO_6350 ?AUTO_6351 ) ) ( not ( = ?AUTO_6349 ?AUTO_6351 ) ) ( CAN_TRAVERSE ?AUTO_6352 ?AUTO_6350 ?AUTO_6351 ) ( AT ?AUTO_6352 ?AUTO_6350 ) ( VISIBLE ?AUTO_6350 ?AUTO_6351 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6352 ?AUTO_6350 ?AUTO_6351 )
      ( GET_IMAGE_DATA ?AUTO_6346 ?AUTO_6347 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6346 ?AUTO_6347 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6388 - OBJECTIVE
      ?AUTO_6389 - MODE
    )
    :vars
    (
      ?AUTO_6394 - LANDER
      ?AUTO_6393 - WAYPOINT
      ?AUTO_6390 - WAYPOINT
      ?AUTO_6392 - ROVER
      ?AUTO_6391 - CAMERA
      ?AUTO_6395 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6394 ?AUTO_6393 ) ( VISIBLE ?AUTO_6390 ?AUTO_6393 ) ( AVAILABLE ?AUTO_6392 ) ( CHANNEL_FREE ?AUTO_6394 ) ( not ( = ?AUTO_6390 ?AUTO_6393 ) ) ( CAN_TRAVERSE ?AUTO_6392 ?AUTO_6393 ?AUTO_6390 ) ( VISIBLE ?AUTO_6393 ?AUTO_6390 ) ( CALIBRATED ?AUTO_6391 ?AUTO_6392 ) ( ON_BOARD ?AUTO_6391 ?AUTO_6392 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6392 ) ( SUPPORTS ?AUTO_6391 ?AUTO_6389 ) ( VISIBLE_FROM ?AUTO_6388 ?AUTO_6393 ) ( CAN_TRAVERSE ?AUTO_6392 ?AUTO_6390 ?AUTO_6393 ) ( CAN_TRAVERSE ?AUTO_6392 ?AUTO_6395 ?AUTO_6390 ) ( AT ?AUTO_6392 ?AUTO_6395 ) ( VISIBLE ?AUTO_6395 ?AUTO_6390 ) ( not ( = ?AUTO_6393 ?AUTO_6395 ) ) ( not ( = ?AUTO_6390 ?AUTO_6395 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6392 ?AUTO_6395 ?AUTO_6390 )
      ( GET_IMAGE_DATA ?AUTO_6388 ?AUTO_6389 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6388 ?AUTO_6389 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6406 - OBJECTIVE
      ?AUTO_6407 - MODE
    )
    :vars
    (
      ?AUTO_6412 - LANDER
      ?AUTO_6410 - WAYPOINT
      ?AUTO_6413 - WAYPOINT
      ?AUTO_6411 - ROVER
      ?AUTO_6409 - CAMERA
      ?AUTO_6408 - WAYPOINT
      ?AUTO_6414 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6412 ?AUTO_6410 ) ( VISIBLE ?AUTO_6413 ?AUTO_6410 ) ( AVAILABLE ?AUTO_6411 ) ( CHANNEL_FREE ?AUTO_6412 ) ( not ( = ?AUTO_6413 ?AUTO_6410 ) ) ( CAN_TRAVERSE ?AUTO_6411 ?AUTO_6410 ?AUTO_6413 ) ( VISIBLE ?AUTO_6410 ?AUTO_6413 ) ( ON_BOARD ?AUTO_6409 ?AUTO_6411 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6411 ) ( SUPPORTS ?AUTO_6409 ?AUTO_6407 ) ( VISIBLE_FROM ?AUTO_6406 ?AUTO_6410 ) ( CAN_TRAVERSE ?AUTO_6411 ?AUTO_6413 ?AUTO_6410 ) ( CAN_TRAVERSE ?AUTO_6411 ?AUTO_6408 ?AUTO_6413 ) ( AT ?AUTO_6411 ?AUTO_6408 ) ( VISIBLE ?AUTO_6408 ?AUTO_6413 ) ( not ( = ?AUTO_6410 ?AUTO_6408 ) ) ( not ( = ?AUTO_6413 ?AUTO_6408 ) ) ( CALIBRATION_TARGET ?AUTO_6409 ?AUTO_6414 ) ( VISIBLE_FROM ?AUTO_6414 ?AUTO_6408 ) ( not ( = ?AUTO_6406 ?AUTO_6414 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_6411 ?AUTO_6409 ?AUTO_6414 ?AUTO_6408 )
      ( GET_IMAGE_DATA ?AUTO_6406 ?AUTO_6407 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6406 ?AUTO_6407 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6417 - OBJECTIVE
      ?AUTO_6418 - MODE
    )
    :vars
    (
      ?AUTO_6423 - LANDER
      ?AUTO_6425 - WAYPOINT
      ?AUTO_6421 - WAYPOINT
      ?AUTO_6420 - ROVER
      ?AUTO_6422 - CAMERA
      ?AUTO_6419 - WAYPOINT
      ?AUTO_6424 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6423 ?AUTO_6425 ) ( VISIBLE ?AUTO_6421 ?AUTO_6425 ) ( AVAILABLE ?AUTO_6420 ) ( CHANNEL_FREE ?AUTO_6423 ) ( not ( = ?AUTO_6421 ?AUTO_6425 ) ) ( CAN_TRAVERSE ?AUTO_6420 ?AUTO_6425 ?AUTO_6421 ) ( VISIBLE ?AUTO_6425 ?AUTO_6421 ) ( ON_BOARD ?AUTO_6422 ?AUTO_6420 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6420 ) ( SUPPORTS ?AUTO_6422 ?AUTO_6418 ) ( VISIBLE_FROM ?AUTO_6417 ?AUTO_6425 ) ( CAN_TRAVERSE ?AUTO_6420 ?AUTO_6421 ?AUTO_6425 ) ( CAN_TRAVERSE ?AUTO_6420 ?AUTO_6419 ?AUTO_6421 ) ( VISIBLE ?AUTO_6419 ?AUTO_6421 ) ( not ( = ?AUTO_6425 ?AUTO_6419 ) ) ( not ( = ?AUTO_6421 ?AUTO_6419 ) ) ( CALIBRATION_TARGET ?AUTO_6422 ?AUTO_6424 ) ( VISIBLE_FROM ?AUTO_6424 ?AUTO_6419 ) ( not ( = ?AUTO_6417 ?AUTO_6424 ) ) ( CAN_TRAVERSE ?AUTO_6420 ?AUTO_6421 ?AUTO_6419 ) ( AT ?AUTO_6420 ?AUTO_6421 ) ( VISIBLE ?AUTO_6421 ?AUTO_6419 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6420 ?AUTO_6421 ?AUTO_6419 )
      ( GET_IMAGE_DATA ?AUTO_6417 ?AUTO_6418 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6417 ?AUTO_6418 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6428 - OBJECTIVE
      ?AUTO_6429 - MODE
    )
    :vars
    (
      ?AUTO_6434 - LANDER
      ?AUTO_6431 - WAYPOINT
      ?AUTO_6433 - WAYPOINT
      ?AUTO_6432 - ROVER
      ?AUTO_6435 - CAMERA
      ?AUTO_6436 - WAYPOINT
      ?AUTO_6430 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6434 ?AUTO_6431 ) ( VISIBLE ?AUTO_6433 ?AUTO_6431 ) ( AVAILABLE ?AUTO_6432 ) ( CHANNEL_FREE ?AUTO_6434 ) ( not ( = ?AUTO_6433 ?AUTO_6431 ) ) ( CAN_TRAVERSE ?AUTO_6432 ?AUTO_6431 ?AUTO_6433 ) ( VISIBLE ?AUTO_6431 ?AUTO_6433 ) ( ON_BOARD ?AUTO_6435 ?AUTO_6432 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6432 ) ( SUPPORTS ?AUTO_6435 ?AUTO_6429 ) ( VISIBLE_FROM ?AUTO_6428 ?AUTO_6431 ) ( CAN_TRAVERSE ?AUTO_6432 ?AUTO_6433 ?AUTO_6431 ) ( CAN_TRAVERSE ?AUTO_6432 ?AUTO_6436 ?AUTO_6433 ) ( VISIBLE ?AUTO_6436 ?AUTO_6433 ) ( not ( = ?AUTO_6431 ?AUTO_6436 ) ) ( not ( = ?AUTO_6433 ?AUTO_6436 ) ) ( CALIBRATION_TARGET ?AUTO_6435 ?AUTO_6430 ) ( VISIBLE_FROM ?AUTO_6430 ?AUTO_6436 ) ( not ( = ?AUTO_6428 ?AUTO_6430 ) ) ( CAN_TRAVERSE ?AUTO_6432 ?AUTO_6433 ?AUTO_6436 ) ( VISIBLE ?AUTO_6433 ?AUTO_6436 ) ( AT ?AUTO_6432 ?AUTO_6431 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6432 ?AUTO_6431 ?AUTO_6433 )
      ( GET_IMAGE_DATA ?AUTO_6428 ?AUTO_6429 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6428 ?AUTO_6429 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6499 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6501 - LANDER
      ?AUTO_6503 - WAYPOINT
      ?AUTO_6504 - ROVER
      ?AUTO_6500 - STORE
      ?AUTO_6502 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6501 ?AUTO_6503 ) ( VISIBLE ?AUTO_6499 ?AUTO_6503 ) ( AVAILABLE ?AUTO_6504 ) ( CHANNEL_FREE ?AUTO_6501 ) ( not ( = ?AUTO_6499 ?AUTO_6503 ) ) ( AT_SOIL_SAMPLE ?AUTO_6499 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6504 ) ( STORE_OF ?AUTO_6500 ?AUTO_6504 ) ( FULL ?AUTO_6500 ) ( CAN_TRAVERSE ?AUTO_6504 ?AUTO_6502 ?AUTO_6499 ) ( VISIBLE ?AUTO_6502 ?AUTO_6499 ) ( not ( = ?AUTO_6499 ?AUTO_6502 ) ) ( not ( = ?AUTO_6503 ?AUTO_6502 ) ) ( CAN_TRAVERSE ?AUTO_6504 ?AUTO_6503 ?AUTO_6502 ) ( AT ?AUTO_6504 ?AUTO_6503 ) ( VISIBLE ?AUTO_6503 ?AUTO_6502 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6504 ?AUTO_6503 ?AUTO_6502 )
      ( GET_SOIL_DATA ?AUTO_6499 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6499 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6518 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6519 - LANDER
      ?AUTO_6522 - WAYPOINT
      ?AUTO_6521 - ROVER
      ?AUTO_6523 - STORE
      ?AUTO_6520 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6519 ?AUTO_6522 ) ( VISIBLE ?AUTO_6518 ?AUTO_6522 ) ( AVAILABLE ?AUTO_6521 ) ( CHANNEL_FREE ?AUTO_6519 ) ( not ( = ?AUTO_6518 ?AUTO_6522 ) ) ( AT_SOIL_SAMPLE ?AUTO_6518 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6521 ) ( STORE_OF ?AUTO_6523 ?AUTO_6521 ) ( CAN_TRAVERSE ?AUTO_6521 ?AUTO_6520 ?AUTO_6518 ) ( VISIBLE ?AUTO_6520 ?AUTO_6518 ) ( not ( = ?AUTO_6518 ?AUTO_6520 ) ) ( not ( = ?AUTO_6522 ?AUTO_6520 ) ) ( CAN_TRAVERSE ?AUTO_6521 ?AUTO_6522 ?AUTO_6520 ) ( AT ?AUTO_6521 ?AUTO_6522 ) ( VISIBLE ?AUTO_6522 ?AUTO_6520 ) ( AT_SOIL_SAMPLE ?AUTO_6522 ) ( EMPTY ?AUTO_6523 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6521 ?AUTO_6523 ?AUTO_6522 )
      ( GET_SOIL_DATA ?AUTO_6518 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6518 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6524 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6526 - LANDER
      ?AUTO_6527 - WAYPOINT
      ?AUTO_6529 - ROVER
      ?AUTO_6528 - STORE
      ?AUTO_6525 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6526 ?AUTO_6527 ) ( VISIBLE ?AUTO_6524 ?AUTO_6527 ) ( AVAILABLE ?AUTO_6529 ) ( CHANNEL_FREE ?AUTO_6526 ) ( not ( = ?AUTO_6524 ?AUTO_6527 ) ) ( AT_SOIL_SAMPLE ?AUTO_6524 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6529 ) ( STORE_OF ?AUTO_6528 ?AUTO_6529 ) ( CAN_TRAVERSE ?AUTO_6529 ?AUTO_6525 ?AUTO_6524 ) ( VISIBLE ?AUTO_6525 ?AUTO_6524 ) ( not ( = ?AUTO_6524 ?AUTO_6525 ) ) ( not ( = ?AUTO_6527 ?AUTO_6525 ) ) ( CAN_TRAVERSE ?AUTO_6529 ?AUTO_6527 ?AUTO_6525 ) ( VISIBLE ?AUTO_6527 ?AUTO_6525 ) ( AT_SOIL_SAMPLE ?AUTO_6527 ) ( EMPTY ?AUTO_6528 ) ( CAN_TRAVERSE ?AUTO_6529 ?AUTO_6525 ?AUTO_6527 ) ( AT ?AUTO_6529 ?AUTO_6525 ) ( VISIBLE ?AUTO_6525 ?AUTO_6527 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6529 ?AUTO_6525 ?AUTO_6527 )
      ( GET_SOIL_DATA ?AUTO_6524 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6524 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6562 - OBJECTIVE
      ?AUTO_6563 - MODE
    )
    :vars
    (
      ?AUTO_6569 - LANDER
      ?AUTO_6565 - WAYPOINT
      ?AUTO_6564 - WAYPOINT
      ?AUTO_6568 - ROVER
      ?AUTO_6567 - CAMERA
      ?AUTO_6566 - WAYPOINT
      ?AUTO_6570 - OBJECTIVE
      ?AUTO_6571 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6569 ?AUTO_6565 ) ( VISIBLE ?AUTO_6564 ?AUTO_6565 ) ( AVAILABLE ?AUTO_6568 ) ( CHANNEL_FREE ?AUTO_6569 ) ( not ( = ?AUTO_6564 ?AUTO_6565 ) ) ( ON_BOARD ?AUTO_6567 ?AUTO_6568 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6568 ) ( SUPPORTS ?AUTO_6567 ?AUTO_6563 ) ( VISIBLE_FROM ?AUTO_6562 ?AUTO_6564 ) ( CAN_TRAVERSE ?AUTO_6568 ?AUTO_6566 ?AUTO_6564 ) ( VISIBLE ?AUTO_6566 ?AUTO_6564 ) ( not ( = ?AUTO_6565 ?AUTO_6566 ) ) ( not ( = ?AUTO_6564 ?AUTO_6566 ) ) ( CALIBRATION_TARGET ?AUTO_6567 ?AUTO_6570 ) ( VISIBLE_FROM ?AUTO_6570 ?AUTO_6566 ) ( not ( = ?AUTO_6562 ?AUTO_6570 ) ) ( CAN_TRAVERSE ?AUTO_6568 ?AUTO_6571 ?AUTO_6566 ) ( AT ?AUTO_6568 ?AUTO_6571 ) ( VISIBLE ?AUTO_6571 ?AUTO_6566 ) ( not ( = ?AUTO_6565 ?AUTO_6571 ) ) ( not ( = ?AUTO_6564 ?AUTO_6571 ) ) ( not ( = ?AUTO_6566 ?AUTO_6571 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6568 ?AUTO_6571 ?AUTO_6566 )
      ( GET_IMAGE_DATA ?AUTO_6562 ?AUTO_6563 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6562 ?AUTO_6563 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6620 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6621 - LANDER
      ?AUTO_6625 - WAYPOINT
      ?AUTO_6622 - ROVER
      ?AUTO_6623 - STORE
      ?AUTO_6624 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6621 ?AUTO_6620 ) ( VISIBLE ?AUTO_6625 ?AUTO_6620 ) ( AVAILABLE ?AUTO_6622 ) ( CHANNEL_FREE ?AUTO_6621 ) ( not ( = ?AUTO_6620 ?AUTO_6625 ) ) ( CAN_TRAVERSE ?AUTO_6622 ?AUTO_6620 ?AUTO_6625 ) ( VISIBLE ?AUTO_6620 ?AUTO_6625 ) ( AT_SOIL_SAMPLE ?AUTO_6620 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6622 ) ( STORE_OF ?AUTO_6623 ?AUTO_6622 ) ( CAN_TRAVERSE ?AUTO_6622 ?AUTO_6624 ?AUTO_6620 ) ( AT ?AUTO_6622 ?AUTO_6624 ) ( VISIBLE ?AUTO_6624 ?AUTO_6620 ) ( not ( = ?AUTO_6620 ?AUTO_6624 ) ) ( not ( = ?AUTO_6625 ?AUTO_6624 ) ) ( FULL ?AUTO_6623 ) )
    :subtasks
    ( ( !DROP ?AUTO_6622 ?AUTO_6623 )
      ( GET_SOIL_DATA ?AUTO_6620 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6620 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6626 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6629 - LANDER
      ?AUTO_6631 - WAYPOINT
      ?AUTO_6628 - ROVER
      ?AUTO_6627 - STORE
      ?AUTO_6630 - WAYPOINT
      ?AUTO_6632 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6629 ?AUTO_6626 ) ( VISIBLE ?AUTO_6631 ?AUTO_6626 ) ( AVAILABLE ?AUTO_6628 ) ( CHANNEL_FREE ?AUTO_6629 ) ( not ( = ?AUTO_6626 ?AUTO_6631 ) ) ( CAN_TRAVERSE ?AUTO_6628 ?AUTO_6626 ?AUTO_6631 ) ( VISIBLE ?AUTO_6626 ?AUTO_6631 ) ( AT_SOIL_SAMPLE ?AUTO_6626 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6628 ) ( STORE_OF ?AUTO_6627 ?AUTO_6628 ) ( CAN_TRAVERSE ?AUTO_6628 ?AUTO_6630 ?AUTO_6626 ) ( VISIBLE ?AUTO_6630 ?AUTO_6626 ) ( not ( = ?AUTO_6626 ?AUTO_6630 ) ) ( not ( = ?AUTO_6631 ?AUTO_6630 ) ) ( FULL ?AUTO_6627 ) ( CAN_TRAVERSE ?AUTO_6628 ?AUTO_6632 ?AUTO_6630 ) ( AT ?AUTO_6628 ?AUTO_6632 ) ( VISIBLE ?AUTO_6632 ?AUTO_6630 ) ( not ( = ?AUTO_6626 ?AUTO_6632 ) ) ( not ( = ?AUTO_6631 ?AUTO_6632 ) ) ( not ( = ?AUTO_6630 ?AUTO_6632 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6628 ?AUTO_6632 ?AUTO_6630 )
      ( GET_SOIL_DATA ?AUTO_6626 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6626 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6634 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6638 - LANDER
      ?AUTO_6639 - WAYPOINT
      ?AUTO_6636 - ROVER
      ?AUTO_6637 - STORE
      ?AUTO_6635 - WAYPOINT
      ?AUTO_6640 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6638 ?AUTO_6634 ) ( VISIBLE ?AUTO_6639 ?AUTO_6634 ) ( AVAILABLE ?AUTO_6636 ) ( CHANNEL_FREE ?AUTO_6638 ) ( not ( = ?AUTO_6634 ?AUTO_6639 ) ) ( CAN_TRAVERSE ?AUTO_6636 ?AUTO_6634 ?AUTO_6639 ) ( VISIBLE ?AUTO_6634 ?AUTO_6639 ) ( AT_SOIL_SAMPLE ?AUTO_6634 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6636 ) ( STORE_OF ?AUTO_6637 ?AUTO_6636 ) ( CAN_TRAVERSE ?AUTO_6636 ?AUTO_6635 ?AUTO_6634 ) ( VISIBLE ?AUTO_6635 ?AUTO_6634 ) ( not ( = ?AUTO_6634 ?AUTO_6635 ) ) ( not ( = ?AUTO_6639 ?AUTO_6635 ) ) ( CAN_TRAVERSE ?AUTO_6636 ?AUTO_6640 ?AUTO_6635 ) ( AT ?AUTO_6636 ?AUTO_6640 ) ( VISIBLE ?AUTO_6640 ?AUTO_6635 ) ( not ( = ?AUTO_6634 ?AUTO_6640 ) ) ( not ( = ?AUTO_6639 ?AUTO_6640 ) ) ( not ( = ?AUTO_6635 ?AUTO_6640 ) ) ( AT_SOIL_SAMPLE ?AUTO_6640 ) ( EMPTY ?AUTO_6637 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6636 ?AUTO_6637 ?AUTO_6640 )
      ( GET_SOIL_DATA ?AUTO_6634 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6634 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6687 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6689 - LANDER
      ?AUTO_6693 - WAYPOINT
      ?AUTO_6692 - ROVER
      ?AUTO_6691 - STORE
      ?AUTO_6690 - WAYPOINT
      ?AUTO_6688 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6689 ?AUTO_6687 ) ( VISIBLE ?AUTO_6693 ?AUTO_6687 ) ( AVAILABLE ?AUTO_6692 ) ( CHANNEL_FREE ?AUTO_6689 ) ( not ( = ?AUTO_6687 ?AUTO_6693 ) ) ( CAN_TRAVERSE ?AUTO_6692 ?AUTO_6687 ?AUTO_6693 ) ( VISIBLE ?AUTO_6687 ?AUTO_6693 ) ( AT_ROCK_SAMPLE ?AUTO_6687 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6692 ) ( STORE_OF ?AUTO_6691 ?AUTO_6692 ) ( CAN_TRAVERSE ?AUTO_6692 ?AUTO_6690 ?AUTO_6687 ) ( VISIBLE ?AUTO_6690 ?AUTO_6687 ) ( not ( = ?AUTO_6687 ?AUTO_6690 ) ) ( not ( = ?AUTO_6693 ?AUTO_6690 ) ) ( CAN_TRAVERSE ?AUTO_6692 ?AUTO_6688 ?AUTO_6690 ) ( AT ?AUTO_6692 ?AUTO_6688 ) ( VISIBLE ?AUTO_6688 ?AUTO_6690 ) ( not ( = ?AUTO_6687 ?AUTO_6688 ) ) ( not ( = ?AUTO_6693 ?AUTO_6688 ) ) ( not ( = ?AUTO_6690 ?AUTO_6688 ) ) ( AT_SOIL_SAMPLE ?AUTO_6688 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6692 ) ( EMPTY ?AUTO_6691 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6692 ?AUTO_6691 ?AUTO_6688 )
      ( GET_ROCK_DATA ?AUTO_6687 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6687 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6751 - OBJECTIVE
      ?AUTO_6752 - MODE
    )
    :vars
    (
      ?AUTO_6757 - LANDER
      ?AUTO_6753 - WAYPOINT
      ?AUTO_6755 - WAYPOINT
      ?AUTO_6756 - ROVER
      ?AUTO_6754 - WAYPOINT
      ?AUTO_6758 - CAMERA
      ?AUTO_6759 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6757 ?AUTO_6753 ) ( VISIBLE ?AUTO_6755 ?AUTO_6753 ) ( AVAILABLE ?AUTO_6756 ) ( CHANNEL_FREE ?AUTO_6757 ) ( not ( = ?AUTO_6755 ?AUTO_6753 ) ) ( CAN_TRAVERSE ?AUTO_6756 ?AUTO_6754 ?AUTO_6755 ) ( VISIBLE ?AUTO_6754 ?AUTO_6755 ) ( not ( = ?AUTO_6753 ?AUTO_6754 ) ) ( not ( = ?AUTO_6755 ?AUTO_6754 ) ) ( ON_BOARD ?AUTO_6758 ?AUTO_6756 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6756 ) ( SUPPORTS ?AUTO_6758 ?AUTO_6752 ) ( VISIBLE_FROM ?AUTO_6751 ?AUTO_6754 ) ( CALIBRATION_TARGET ?AUTO_6758 ?AUTO_6751 ) ( CAN_TRAVERSE ?AUTO_6756 ?AUTO_6759 ?AUTO_6754 ) ( VISIBLE ?AUTO_6759 ?AUTO_6754 ) ( not ( = ?AUTO_6753 ?AUTO_6759 ) ) ( not ( = ?AUTO_6755 ?AUTO_6759 ) ) ( not ( = ?AUTO_6754 ?AUTO_6759 ) ) ( CAN_TRAVERSE ?AUTO_6756 ?AUTO_6753 ?AUTO_6759 ) ( AT ?AUTO_6756 ?AUTO_6753 ) ( VISIBLE ?AUTO_6753 ?AUTO_6759 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6756 ?AUTO_6753 ?AUTO_6759 )
      ( GET_IMAGE_DATA ?AUTO_6751 ?AUTO_6752 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6751 ?AUTO_6752 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6760 - OBJECTIVE
      ?AUTO_6761 - MODE
    )
    :vars
    (
      ?AUTO_6766 - LANDER
      ?AUTO_6763 - WAYPOINT
      ?AUTO_6767 - WAYPOINT
      ?AUTO_6765 - ROVER
      ?AUTO_6768 - WAYPOINT
      ?AUTO_6764 - CAMERA
      ?AUTO_6762 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6766 ?AUTO_6763 ) ( VISIBLE ?AUTO_6767 ?AUTO_6763 ) ( AVAILABLE ?AUTO_6765 ) ( CHANNEL_FREE ?AUTO_6766 ) ( not ( = ?AUTO_6767 ?AUTO_6763 ) ) ( CAN_TRAVERSE ?AUTO_6765 ?AUTO_6768 ?AUTO_6767 ) ( VISIBLE ?AUTO_6768 ?AUTO_6767 ) ( not ( = ?AUTO_6763 ?AUTO_6768 ) ) ( not ( = ?AUTO_6767 ?AUTO_6768 ) ) ( ON_BOARD ?AUTO_6764 ?AUTO_6765 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6765 ) ( SUPPORTS ?AUTO_6764 ?AUTO_6761 ) ( VISIBLE_FROM ?AUTO_6760 ?AUTO_6768 ) ( CALIBRATION_TARGET ?AUTO_6764 ?AUTO_6760 ) ( CAN_TRAVERSE ?AUTO_6765 ?AUTO_6762 ?AUTO_6768 ) ( VISIBLE ?AUTO_6762 ?AUTO_6768 ) ( not ( = ?AUTO_6763 ?AUTO_6762 ) ) ( not ( = ?AUTO_6767 ?AUTO_6762 ) ) ( not ( = ?AUTO_6768 ?AUTO_6762 ) ) ( CAN_TRAVERSE ?AUTO_6765 ?AUTO_6763 ?AUTO_6762 ) ( VISIBLE ?AUTO_6763 ?AUTO_6762 ) ( CAN_TRAVERSE ?AUTO_6765 ?AUTO_6767 ?AUTO_6763 ) ( AT ?AUTO_6765 ?AUTO_6767 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6765 ?AUTO_6767 ?AUTO_6763 )
      ( GET_IMAGE_DATA ?AUTO_6760 ?AUTO_6761 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6760 ?AUTO_6761 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6842 - OBJECTIVE
      ?AUTO_6843 - MODE
    )
    :vars
    (
      ?AUTO_6846 - LANDER
      ?AUTO_6844 - WAYPOINT
      ?AUTO_6850 - WAYPOINT
      ?AUTO_6848 - ROVER
      ?AUTO_6847 - CAMERA
      ?AUTO_6849 - WAYPOINT
      ?AUTO_6845 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6846 ?AUTO_6844 ) ( VISIBLE ?AUTO_6850 ?AUTO_6844 ) ( AVAILABLE ?AUTO_6848 ) ( CHANNEL_FREE ?AUTO_6846 ) ( not ( = ?AUTO_6850 ?AUTO_6844 ) ) ( CAN_TRAVERSE ?AUTO_6848 ?AUTO_6844 ?AUTO_6850 ) ( VISIBLE ?AUTO_6844 ?AUTO_6850 ) ( CALIBRATED ?AUTO_6847 ?AUTO_6848 ) ( ON_BOARD ?AUTO_6847 ?AUTO_6848 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6848 ) ( SUPPORTS ?AUTO_6847 ?AUTO_6843 ) ( VISIBLE_FROM ?AUTO_6842 ?AUTO_6844 ) ( CAN_TRAVERSE ?AUTO_6848 ?AUTO_6849 ?AUTO_6844 ) ( VISIBLE ?AUTO_6849 ?AUTO_6844 ) ( not ( = ?AUTO_6844 ?AUTO_6849 ) ) ( not ( = ?AUTO_6850 ?AUTO_6849 ) ) ( CAN_TRAVERSE ?AUTO_6848 ?AUTO_6845 ?AUTO_6849 ) ( VISIBLE ?AUTO_6845 ?AUTO_6849 ) ( not ( = ?AUTO_6844 ?AUTO_6845 ) ) ( not ( = ?AUTO_6850 ?AUTO_6845 ) ) ( not ( = ?AUTO_6849 ?AUTO_6845 ) ) ( CAN_TRAVERSE ?AUTO_6848 ?AUTO_6850 ?AUTO_6845 ) ( AT ?AUTO_6848 ?AUTO_6850 ) ( VISIBLE ?AUTO_6850 ?AUTO_6845 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6848 ?AUTO_6850 ?AUTO_6845 )
      ( GET_IMAGE_DATA ?AUTO_6842 ?AUTO_6843 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6842 ?AUTO_6843 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6853 - OBJECTIVE
      ?AUTO_6854 - MODE
    )
    :vars
    (
      ?AUTO_6859 - LANDER
      ?AUTO_6855 - WAYPOINT
      ?AUTO_6861 - WAYPOINT
      ?AUTO_6856 - ROVER
      ?AUTO_6860 - CAMERA
      ?AUTO_6858 - WAYPOINT
      ?AUTO_6857 - WAYPOINT
      ?AUTO_6862 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6859 ?AUTO_6855 ) ( VISIBLE ?AUTO_6861 ?AUTO_6855 ) ( AVAILABLE ?AUTO_6856 ) ( CHANNEL_FREE ?AUTO_6859 ) ( not ( = ?AUTO_6861 ?AUTO_6855 ) ) ( CAN_TRAVERSE ?AUTO_6856 ?AUTO_6855 ?AUTO_6861 ) ( VISIBLE ?AUTO_6855 ?AUTO_6861 ) ( ON_BOARD ?AUTO_6860 ?AUTO_6856 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6856 ) ( SUPPORTS ?AUTO_6860 ?AUTO_6854 ) ( VISIBLE_FROM ?AUTO_6853 ?AUTO_6855 ) ( CAN_TRAVERSE ?AUTO_6856 ?AUTO_6858 ?AUTO_6855 ) ( VISIBLE ?AUTO_6858 ?AUTO_6855 ) ( not ( = ?AUTO_6855 ?AUTO_6858 ) ) ( not ( = ?AUTO_6861 ?AUTO_6858 ) ) ( CAN_TRAVERSE ?AUTO_6856 ?AUTO_6857 ?AUTO_6858 ) ( VISIBLE ?AUTO_6857 ?AUTO_6858 ) ( not ( = ?AUTO_6855 ?AUTO_6857 ) ) ( not ( = ?AUTO_6861 ?AUTO_6857 ) ) ( not ( = ?AUTO_6858 ?AUTO_6857 ) ) ( CAN_TRAVERSE ?AUTO_6856 ?AUTO_6861 ?AUTO_6857 ) ( AT ?AUTO_6856 ?AUTO_6861 ) ( VISIBLE ?AUTO_6861 ?AUTO_6857 ) ( CALIBRATION_TARGET ?AUTO_6860 ?AUTO_6862 ) ( VISIBLE_FROM ?AUTO_6862 ?AUTO_6861 ) ( not ( = ?AUTO_6853 ?AUTO_6862 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_6856 ?AUTO_6860 ?AUTO_6862 ?AUTO_6861 )
      ( GET_IMAGE_DATA ?AUTO_6853 ?AUTO_6854 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6853 ?AUTO_6854 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6863 - OBJECTIVE
      ?AUTO_6864 - MODE
    )
    :vars
    (
      ?AUTO_6870 - LANDER
      ?AUTO_6868 - WAYPOINT
      ?AUTO_6865 - WAYPOINT
      ?AUTO_6867 - ROVER
      ?AUTO_6866 - CAMERA
      ?AUTO_6871 - WAYPOINT
      ?AUTO_6869 - WAYPOINT
      ?AUTO_6872 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6870 ?AUTO_6868 ) ( VISIBLE ?AUTO_6865 ?AUTO_6868 ) ( AVAILABLE ?AUTO_6867 ) ( CHANNEL_FREE ?AUTO_6870 ) ( not ( = ?AUTO_6865 ?AUTO_6868 ) ) ( CAN_TRAVERSE ?AUTO_6867 ?AUTO_6868 ?AUTO_6865 ) ( VISIBLE ?AUTO_6868 ?AUTO_6865 ) ( ON_BOARD ?AUTO_6866 ?AUTO_6867 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6867 ) ( SUPPORTS ?AUTO_6866 ?AUTO_6864 ) ( VISIBLE_FROM ?AUTO_6863 ?AUTO_6868 ) ( CAN_TRAVERSE ?AUTO_6867 ?AUTO_6871 ?AUTO_6868 ) ( VISIBLE ?AUTO_6871 ?AUTO_6868 ) ( not ( = ?AUTO_6868 ?AUTO_6871 ) ) ( not ( = ?AUTO_6865 ?AUTO_6871 ) ) ( CAN_TRAVERSE ?AUTO_6867 ?AUTO_6869 ?AUTO_6871 ) ( VISIBLE ?AUTO_6869 ?AUTO_6871 ) ( not ( = ?AUTO_6868 ?AUTO_6869 ) ) ( not ( = ?AUTO_6865 ?AUTO_6869 ) ) ( not ( = ?AUTO_6871 ?AUTO_6869 ) ) ( CAN_TRAVERSE ?AUTO_6867 ?AUTO_6865 ?AUTO_6869 ) ( VISIBLE ?AUTO_6865 ?AUTO_6869 ) ( CALIBRATION_TARGET ?AUTO_6866 ?AUTO_6872 ) ( VISIBLE_FROM ?AUTO_6872 ?AUTO_6865 ) ( not ( = ?AUTO_6863 ?AUTO_6872 ) ) ( AT ?AUTO_6867 ?AUTO_6868 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6867 ?AUTO_6868 ?AUTO_6865 )
      ( GET_IMAGE_DATA ?AUTO_6863 ?AUTO_6864 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6863 ?AUTO_6864 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6903 - OBJECTIVE
      ?AUTO_6904 - MODE
    )
    :vars
    (
      ?AUTO_6909 - LANDER
      ?AUTO_6907 - WAYPOINT
      ?AUTO_6905 - WAYPOINT
      ?AUTO_6908 - ROVER
      ?AUTO_6906 - CAMERA
      ?AUTO_6910 - WAYPOINT
      ?AUTO_6911 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6909 ?AUTO_6907 ) ( VISIBLE ?AUTO_6905 ?AUTO_6907 ) ( AVAILABLE ?AUTO_6908 ) ( CHANNEL_FREE ?AUTO_6909 ) ( not ( = ?AUTO_6905 ?AUTO_6907 ) ) ( ON_BOARD ?AUTO_6906 ?AUTO_6908 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6908 ) ( SUPPORTS ?AUTO_6906 ?AUTO_6904 ) ( VISIBLE_FROM ?AUTO_6903 ?AUTO_6905 ) ( CALIBRATION_TARGET ?AUTO_6906 ?AUTO_6903 ) ( CAN_TRAVERSE ?AUTO_6908 ?AUTO_6910 ?AUTO_6905 ) ( VISIBLE ?AUTO_6910 ?AUTO_6905 ) ( not ( = ?AUTO_6907 ?AUTO_6910 ) ) ( not ( = ?AUTO_6905 ?AUTO_6910 ) ) ( CAN_TRAVERSE ?AUTO_6908 ?AUTO_6911 ?AUTO_6910 ) ( AT ?AUTO_6908 ?AUTO_6911 ) ( VISIBLE ?AUTO_6911 ?AUTO_6910 ) ( not ( = ?AUTO_6907 ?AUTO_6911 ) ) ( not ( = ?AUTO_6905 ?AUTO_6911 ) ) ( not ( = ?AUTO_6910 ?AUTO_6911 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6908 ?AUTO_6911 ?AUTO_6910 )
      ( GET_IMAGE_DATA ?AUTO_6903 ?AUTO_6904 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6903 ?AUTO_6904 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6912 - OBJECTIVE
      ?AUTO_6913 - MODE
    )
    :vars
    (
      ?AUTO_6918 - LANDER
      ?AUTO_6919 - WAYPOINT
      ?AUTO_6916 - WAYPOINT
      ?AUTO_6920 - ROVER
      ?AUTO_6917 - CAMERA
      ?AUTO_6914 - WAYPOINT
      ?AUTO_6915 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6918 ?AUTO_6919 ) ( VISIBLE ?AUTO_6916 ?AUTO_6919 ) ( AVAILABLE ?AUTO_6920 ) ( CHANNEL_FREE ?AUTO_6918 ) ( not ( = ?AUTO_6916 ?AUTO_6919 ) ) ( ON_BOARD ?AUTO_6917 ?AUTO_6920 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6920 ) ( SUPPORTS ?AUTO_6917 ?AUTO_6913 ) ( VISIBLE_FROM ?AUTO_6912 ?AUTO_6916 ) ( CALIBRATION_TARGET ?AUTO_6917 ?AUTO_6912 ) ( CAN_TRAVERSE ?AUTO_6920 ?AUTO_6914 ?AUTO_6916 ) ( VISIBLE ?AUTO_6914 ?AUTO_6916 ) ( not ( = ?AUTO_6919 ?AUTO_6914 ) ) ( not ( = ?AUTO_6916 ?AUTO_6914 ) ) ( CAN_TRAVERSE ?AUTO_6920 ?AUTO_6915 ?AUTO_6914 ) ( VISIBLE ?AUTO_6915 ?AUTO_6914 ) ( not ( = ?AUTO_6919 ?AUTO_6915 ) ) ( not ( = ?AUTO_6916 ?AUTO_6915 ) ) ( not ( = ?AUTO_6914 ?AUTO_6915 ) ) ( CAN_TRAVERSE ?AUTO_6920 ?AUTO_6919 ?AUTO_6915 ) ( AT ?AUTO_6920 ?AUTO_6919 ) ( VISIBLE ?AUTO_6919 ?AUTO_6915 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6920 ?AUTO_6919 ?AUTO_6915 )
      ( GET_IMAGE_DATA ?AUTO_6912 ?AUTO_6913 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6912 ?AUTO_6913 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6947 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6952 - LANDER
      ?AUTO_6948 - WAYPOINT
      ?AUTO_6953 - ROVER
      ?AUTO_6949 - STORE
      ?AUTO_6950 - WAYPOINT
      ?AUTO_6951 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6952 ?AUTO_6948 ) ( VISIBLE ?AUTO_6947 ?AUTO_6948 ) ( AVAILABLE ?AUTO_6953 ) ( CHANNEL_FREE ?AUTO_6952 ) ( not ( = ?AUTO_6947 ?AUTO_6948 ) ) ( AT_ROCK_SAMPLE ?AUTO_6947 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6953 ) ( STORE_OF ?AUTO_6949 ?AUTO_6953 ) ( EMPTY ?AUTO_6949 ) ( CAN_TRAVERSE ?AUTO_6953 ?AUTO_6950 ?AUTO_6947 ) ( VISIBLE ?AUTO_6950 ?AUTO_6947 ) ( not ( = ?AUTO_6947 ?AUTO_6950 ) ) ( not ( = ?AUTO_6948 ?AUTO_6950 ) ) ( CAN_TRAVERSE ?AUTO_6953 ?AUTO_6951 ?AUTO_6950 ) ( VISIBLE ?AUTO_6951 ?AUTO_6950 ) ( not ( = ?AUTO_6947 ?AUTO_6951 ) ) ( not ( = ?AUTO_6948 ?AUTO_6951 ) ) ( not ( = ?AUTO_6950 ?AUTO_6951 ) ) ( CAN_TRAVERSE ?AUTO_6953 ?AUTO_6948 ?AUTO_6951 ) ( AT ?AUTO_6953 ?AUTO_6948 ) ( VISIBLE ?AUTO_6948 ?AUTO_6951 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6953 ?AUTO_6948 ?AUTO_6951 )
      ( GET_ROCK_DATA ?AUTO_6947 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6947 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6986 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6989 - LANDER
      ?AUTO_6987 - WAYPOINT
      ?AUTO_6988 - WAYPOINT
      ?AUTO_6992 - ROVER
      ?AUTO_6991 - STORE
      ?AUTO_6990 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6989 ?AUTO_6987 ) ( VISIBLE ?AUTO_6988 ?AUTO_6987 ) ( AVAILABLE ?AUTO_6992 ) ( CHANNEL_FREE ?AUTO_6989 ) ( not ( = ?AUTO_6986 ?AUTO_6988 ) ) ( not ( = ?AUTO_6986 ?AUTO_6987 ) ) ( not ( = ?AUTO_6988 ?AUTO_6987 ) ) ( CAN_TRAVERSE ?AUTO_6992 ?AUTO_6986 ?AUTO_6988 ) ( VISIBLE ?AUTO_6986 ?AUTO_6988 ) ( AT_SOIL_SAMPLE ?AUTO_6986 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6992 ) ( STORE_OF ?AUTO_6991 ?AUTO_6992 ) ( EMPTY ?AUTO_6991 ) ( CAN_TRAVERSE ?AUTO_6992 ?AUTO_6990 ?AUTO_6986 ) ( VISIBLE ?AUTO_6990 ?AUTO_6986 ) ( not ( = ?AUTO_6986 ?AUTO_6990 ) ) ( not ( = ?AUTO_6987 ?AUTO_6990 ) ) ( not ( = ?AUTO_6988 ?AUTO_6990 ) ) ( CAN_TRAVERSE ?AUTO_6992 ?AUTO_6987 ?AUTO_6990 ) ( VISIBLE ?AUTO_6987 ?AUTO_6990 ) ( CAN_TRAVERSE ?AUTO_6992 ?AUTO_6988 ?AUTO_6987 ) ( AT ?AUTO_6992 ?AUTO_6988 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6992 ?AUTO_6988 ?AUTO_6987 )
      ( GET_SOIL_DATA ?AUTO_6986 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6986 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7025 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7026 - LANDER
      ?AUTO_7028 - WAYPOINT
      ?AUTO_7027 - WAYPOINT
      ?AUTO_7029 - ROVER
      ?AUTO_7030 - STORE
      ?AUTO_7031 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7026 ?AUTO_7028 ) ( VISIBLE ?AUTO_7027 ?AUTO_7028 ) ( AVAILABLE ?AUTO_7029 ) ( CHANNEL_FREE ?AUTO_7026 ) ( not ( = ?AUTO_7025 ?AUTO_7027 ) ) ( not ( = ?AUTO_7025 ?AUTO_7028 ) ) ( not ( = ?AUTO_7027 ?AUTO_7028 ) ) ( CAN_TRAVERSE ?AUTO_7029 ?AUTO_7025 ?AUTO_7027 ) ( VISIBLE ?AUTO_7025 ?AUTO_7027 ) ( AT_SOIL_SAMPLE ?AUTO_7025 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7029 ) ( STORE_OF ?AUTO_7030 ?AUTO_7029 ) ( EMPTY ?AUTO_7030 ) ( CAN_TRAVERSE ?AUTO_7029 ?AUTO_7027 ?AUTO_7025 ) ( VISIBLE ?AUTO_7027 ?AUTO_7025 ) ( CAN_TRAVERSE ?AUTO_7029 ?AUTO_7031 ?AUTO_7027 ) ( AT ?AUTO_7029 ?AUTO_7031 ) ( VISIBLE ?AUTO_7031 ?AUTO_7027 ) ( not ( = ?AUTO_7025 ?AUTO_7031 ) ) ( not ( = ?AUTO_7028 ?AUTO_7031 ) ) ( not ( = ?AUTO_7027 ?AUTO_7031 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7029 ?AUTO_7031 ?AUTO_7027 )
      ( GET_SOIL_DATA ?AUTO_7025 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7025 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7032 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7034 - LANDER
      ?AUTO_7037 - WAYPOINT
      ?AUTO_7036 - WAYPOINT
      ?AUTO_7033 - ROVER
      ?AUTO_7035 - STORE
      ?AUTO_7038 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7034 ?AUTO_7037 ) ( VISIBLE ?AUTO_7036 ?AUTO_7037 ) ( AVAILABLE ?AUTO_7033 ) ( CHANNEL_FREE ?AUTO_7034 ) ( not ( = ?AUTO_7032 ?AUTO_7036 ) ) ( not ( = ?AUTO_7032 ?AUTO_7037 ) ) ( not ( = ?AUTO_7036 ?AUTO_7037 ) ) ( CAN_TRAVERSE ?AUTO_7033 ?AUTO_7032 ?AUTO_7036 ) ( VISIBLE ?AUTO_7032 ?AUTO_7036 ) ( AT_SOIL_SAMPLE ?AUTO_7032 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7033 ) ( STORE_OF ?AUTO_7035 ?AUTO_7033 ) ( CAN_TRAVERSE ?AUTO_7033 ?AUTO_7036 ?AUTO_7032 ) ( VISIBLE ?AUTO_7036 ?AUTO_7032 ) ( CAN_TRAVERSE ?AUTO_7033 ?AUTO_7038 ?AUTO_7036 ) ( AT ?AUTO_7033 ?AUTO_7038 ) ( VISIBLE ?AUTO_7038 ?AUTO_7036 ) ( not ( = ?AUTO_7032 ?AUTO_7038 ) ) ( not ( = ?AUTO_7037 ?AUTO_7038 ) ) ( not ( = ?AUTO_7036 ?AUTO_7038 ) ) ( FULL ?AUTO_7035 ) )
    :subtasks
    ( ( !DROP ?AUTO_7033 ?AUTO_7035 )
      ( GET_SOIL_DATA ?AUTO_7032 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7032 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7040 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7042 - LANDER
      ?AUTO_7044 - WAYPOINT
      ?AUTO_7045 - WAYPOINT
      ?AUTO_7046 - ROVER
      ?AUTO_7041 - STORE
      ?AUTO_7043 - WAYPOINT
      ?AUTO_7047 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7042 ?AUTO_7044 ) ( VISIBLE ?AUTO_7045 ?AUTO_7044 ) ( AVAILABLE ?AUTO_7046 ) ( CHANNEL_FREE ?AUTO_7042 ) ( not ( = ?AUTO_7040 ?AUTO_7045 ) ) ( not ( = ?AUTO_7040 ?AUTO_7044 ) ) ( not ( = ?AUTO_7045 ?AUTO_7044 ) ) ( CAN_TRAVERSE ?AUTO_7046 ?AUTO_7040 ?AUTO_7045 ) ( VISIBLE ?AUTO_7040 ?AUTO_7045 ) ( AT_SOIL_SAMPLE ?AUTO_7040 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7046 ) ( STORE_OF ?AUTO_7041 ?AUTO_7046 ) ( EMPTY ?AUTO_7041 ) ( CAN_TRAVERSE ?AUTO_7046 ?AUTO_7045 ?AUTO_7040 ) ( VISIBLE ?AUTO_7045 ?AUTO_7040 ) ( CAN_TRAVERSE ?AUTO_7046 ?AUTO_7043 ?AUTO_7045 ) ( VISIBLE ?AUTO_7043 ?AUTO_7045 ) ( not ( = ?AUTO_7040 ?AUTO_7043 ) ) ( not ( = ?AUTO_7044 ?AUTO_7043 ) ) ( not ( = ?AUTO_7045 ?AUTO_7043 ) ) ( CAN_TRAVERSE ?AUTO_7046 ?AUTO_7047 ?AUTO_7043 ) ( AT ?AUTO_7046 ?AUTO_7047 ) ( VISIBLE ?AUTO_7047 ?AUTO_7043 ) ( not ( = ?AUTO_7040 ?AUTO_7047 ) ) ( not ( = ?AUTO_7044 ?AUTO_7047 ) ) ( not ( = ?AUTO_7045 ?AUTO_7047 ) ) ( not ( = ?AUTO_7043 ?AUTO_7047 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7046 ?AUTO_7047 ?AUTO_7043 )
      ( GET_SOIL_DATA ?AUTO_7040 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7040 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7048 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7052 - LANDER
      ?AUTO_7054 - WAYPOINT
      ?AUTO_7055 - WAYPOINT
      ?AUTO_7050 - ROVER
      ?AUTO_7051 - STORE
      ?AUTO_7053 - WAYPOINT
      ?AUTO_7049 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7052 ?AUTO_7054 ) ( VISIBLE ?AUTO_7055 ?AUTO_7054 ) ( AVAILABLE ?AUTO_7050 ) ( CHANNEL_FREE ?AUTO_7052 ) ( not ( = ?AUTO_7048 ?AUTO_7055 ) ) ( not ( = ?AUTO_7048 ?AUTO_7054 ) ) ( not ( = ?AUTO_7055 ?AUTO_7054 ) ) ( CAN_TRAVERSE ?AUTO_7050 ?AUTO_7048 ?AUTO_7055 ) ( VISIBLE ?AUTO_7048 ?AUTO_7055 ) ( AT_SOIL_SAMPLE ?AUTO_7048 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7050 ) ( STORE_OF ?AUTO_7051 ?AUTO_7050 ) ( EMPTY ?AUTO_7051 ) ( CAN_TRAVERSE ?AUTO_7050 ?AUTO_7055 ?AUTO_7048 ) ( VISIBLE ?AUTO_7055 ?AUTO_7048 ) ( CAN_TRAVERSE ?AUTO_7050 ?AUTO_7053 ?AUTO_7055 ) ( VISIBLE ?AUTO_7053 ?AUTO_7055 ) ( not ( = ?AUTO_7048 ?AUTO_7053 ) ) ( not ( = ?AUTO_7054 ?AUTO_7053 ) ) ( not ( = ?AUTO_7055 ?AUTO_7053 ) ) ( CAN_TRAVERSE ?AUTO_7050 ?AUTO_7049 ?AUTO_7053 ) ( VISIBLE ?AUTO_7049 ?AUTO_7053 ) ( not ( = ?AUTO_7048 ?AUTO_7049 ) ) ( not ( = ?AUTO_7054 ?AUTO_7049 ) ) ( not ( = ?AUTO_7055 ?AUTO_7049 ) ) ( not ( = ?AUTO_7053 ?AUTO_7049 ) ) ( CAN_TRAVERSE ?AUTO_7050 ?AUTO_7054 ?AUTO_7049 ) ( AT ?AUTO_7050 ?AUTO_7054 ) ( VISIBLE ?AUTO_7054 ?AUTO_7049 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7050 ?AUTO_7054 ?AUTO_7049 )
      ( GET_SOIL_DATA ?AUTO_7048 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7048 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7192 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7194 - LANDER
      ?AUTO_7195 - WAYPOINT
      ?AUTO_7198 - ROVER
      ?AUTO_7193 - STORE
      ?AUTO_7197 - WAYPOINT
      ?AUTO_7196 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7194 ?AUTO_7195 ) ( VISIBLE ?AUTO_7192 ?AUTO_7195 ) ( AVAILABLE ?AUTO_7198 ) ( CHANNEL_FREE ?AUTO_7194 ) ( not ( = ?AUTO_7192 ?AUTO_7195 ) ) ( AT_SOIL_SAMPLE ?AUTO_7192 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7198 ) ( STORE_OF ?AUTO_7193 ?AUTO_7198 ) ( CAN_TRAVERSE ?AUTO_7198 ?AUTO_7197 ?AUTO_7192 ) ( VISIBLE ?AUTO_7197 ?AUTO_7192 ) ( not ( = ?AUTO_7192 ?AUTO_7197 ) ) ( not ( = ?AUTO_7195 ?AUTO_7197 ) ) ( CAN_TRAVERSE ?AUTO_7198 ?AUTO_7196 ?AUTO_7197 ) ( AT ?AUTO_7198 ?AUTO_7196 ) ( VISIBLE ?AUTO_7196 ?AUTO_7197 ) ( not ( = ?AUTO_7192 ?AUTO_7196 ) ) ( not ( = ?AUTO_7195 ?AUTO_7196 ) ) ( not ( = ?AUTO_7197 ?AUTO_7196 ) ) ( AT_ROCK_SAMPLE ?AUTO_7196 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7198 ) ( EMPTY ?AUTO_7193 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_7198 ?AUTO_7193 ?AUTO_7196 )
      ( GET_SOIL_DATA ?AUTO_7192 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7192 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7252 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7257 - LANDER
      ?AUTO_7256 - WAYPOINT
      ?AUTO_7254 - ROVER
      ?AUTO_7258 - STORE
      ?AUTO_7253 - WAYPOINT
      ?AUTO_7255 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7257 ?AUTO_7252 ) ( VISIBLE ?AUTO_7256 ?AUTO_7252 ) ( AVAILABLE ?AUTO_7254 ) ( CHANNEL_FREE ?AUTO_7257 ) ( not ( = ?AUTO_7252 ?AUTO_7256 ) ) ( CAN_TRAVERSE ?AUTO_7254 ?AUTO_7252 ?AUTO_7256 ) ( VISIBLE ?AUTO_7252 ?AUTO_7256 ) ( AT_ROCK_SAMPLE ?AUTO_7252 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7254 ) ( STORE_OF ?AUTO_7258 ?AUTO_7254 ) ( CAN_TRAVERSE ?AUTO_7254 ?AUTO_7253 ?AUTO_7252 ) ( VISIBLE ?AUTO_7253 ?AUTO_7252 ) ( not ( = ?AUTO_7252 ?AUTO_7253 ) ) ( not ( = ?AUTO_7256 ?AUTO_7253 ) ) ( FULL ?AUTO_7258 ) ( CAN_TRAVERSE ?AUTO_7254 ?AUTO_7255 ?AUTO_7253 ) ( VISIBLE ?AUTO_7255 ?AUTO_7253 ) ( not ( = ?AUTO_7252 ?AUTO_7255 ) ) ( not ( = ?AUTO_7256 ?AUTO_7255 ) ) ( not ( = ?AUTO_7253 ?AUTO_7255 ) ) ( CAN_TRAVERSE ?AUTO_7254 ?AUTO_7256 ?AUTO_7255 ) ( AT ?AUTO_7254 ?AUTO_7256 ) ( VISIBLE ?AUTO_7256 ?AUTO_7255 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7254 ?AUTO_7256 ?AUTO_7255 )
      ( GET_ROCK_DATA ?AUTO_7252 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7252 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7260 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7263 - LANDER
      ?AUTO_7265 - WAYPOINT
      ?AUTO_7264 - ROVER
      ?AUTO_7262 - STORE
      ?AUTO_7261 - WAYPOINT
      ?AUTO_7266 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7263 ?AUTO_7260 ) ( VISIBLE ?AUTO_7265 ?AUTO_7260 ) ( AVAILABLE ?AUTO_7264 ) ( CHANNEL_FREE ?AUTO_7263 ) ( not ( = ?AUTO_7260 ?AUTO_7265 ) ) ( CAN_TRAVERSE ?AUTO_7264 ?AUTO_7260 ?AUTO_7265 ) ( VISIBLE ?AUTO_7260 ?AUTO_7265 ) ( AT_ROCK_SAMPLE ?AUTO_7260 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7264 ) ( STORE_OF ?AUTO_7262 ?AUTO_7264 ) ( CAN_TRAVERSE ?AUTO_7264 ?AUTO_7261 ?AUTO_7260 ) ( VISIBLE ?AUTO_7261 ?AUTO_7260 ) ( not ( = ?AUTO_7260 ?AUTO_7261 ) ) ( not ( = ?AUTO_7265 ?AUTO_7261 ) ) ( CAN_TRAVERSE ?AUTO_7264 ?AUTO_7266 ?AUTO_7261 ) ( VISIBLE ?AUTO_7266 ?AUTO_7261 ) ( not ( = ?AUTO_7260 ?AUTO_7266 ) ) ( not ( = ?AUTO_7265 ?AUTO_7266 ) ) ( not ( = ?AUTO_7261 ?AUTO_7266 ) ) ( CAN_TRAVERSE ?AUTO_7264 ?AUTO_7265 ?AUTO_7266 ) ( AT ?AUTO_7264 ?AUTO_7265 ) ( VISIBLE ?AUTO_7265 ?AUTO_7266 ) ( AT_ROCK_SAMPLE ?AUTO_7265 ) ( EMPTY ?AUTO_7262 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_7264 ?AUTO_7262 ?AUTO_7265 )
      ( GET_ROCK_DATA ?AUTO_7260 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7260 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7308 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7311 - LANDER
      ?AUTO_7310 - WAYPOINT
      ?AUTO_7309 - ROVER
      ?AUTO_7312 - STORE
      ?AUTO_7313 - WAYPOINT
      ?AUTO_7314 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7311 ?AUTO_7310 ) ( VISIBLE ?AUTO_7308 ?AUTO_7310 ) ( AVAILABLE ?AUTO_7309 ) ( CHANNEL_FREE ?AUTO_7311 ) ( not ( = ?AUTO_7308 ?AUTO_7310 ) ) ( AT_ROCK_SAMPLE ?AUTO_7308 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7309 ) ( STORE_OF ?AUTO_7312 ?AUTO_7309 ) ( CAN_TRAVERSE ?AUTO_7309 ?AUTO_7310 ?AUTO_7308 ) ( VISIBLE ?AUTO_7310 ?AUTO_7308 ) ( CAN_TRAVERSE ?AUTO_7309 ?AUTO_7313 ?AUTO_7310 ) ( VISIBLE ?AUTO_7313 ?AUTO_7310 ) ( not ( = ?AUTO_7308 ?AUTO_7313 ) ) ( not ( = ?AUTO_7310 ?AUTO_7313 ) ) ( FULL ?AUTO_7312 ) ( CAN_TRAVERSE ?AUTO_7309 ?AUTO_7314 ?AUTO_7313 ) ( AT ?AUTO_7309 ?AUTO_7314 ) ( VISIBLE ?AUTO_7314 ?AUTO_7313 ) ( not ( = ?AUTO_7308 ?AUTO_7314 ) ) ( not ( = ?AUTO_7310 ?AUTO_7314 ) ) ( not ( = ?AUTO_7313 ?AUTO_7314 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7309 ?AUTO_7314 ?AUTO_7313 )
      ( GET_ROCK_DATA ?AUTO_7308 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7308 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7316 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7322 - LANDER
      ?AUTO_7317 - WAYPOINT
      ?AUTO_7320 - ROVER
      ?AUTO_7319 - STORE
      ?AUTO_7321 - WAYPOINT
      ?AUTO_7318 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7322 ?AUTO_7317 ) ( VISIBLE ?AUTO_7316 ?AUTO_7317 ) ( AVAILABLE ?AUTO_7320 ) ( CHANNEL_FREE ?AUTO_7322 ) ( not ( = ?AUTO_7316 ?AUTO_7317 ) ) ( AT_ROCK_SAMPLE ?AUTO_7316 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7320 ) ( STORE_OF ?AUTO_7319 ?AUTO_7320 ) ( CAN_TRAVERSE ?AUTO_7320 ?AUTO_7317 ?AUTO_7316 ) ( VISIBLE ?AUTO_7317 ?AUTO_7316 ) ( CAN_TRAVERSE ?AUTO_7320 ?AUTO_7321 ?AUTO_7317 ) ( VISIBLE ?AUTO_7321 ?AUTO_7317 ) ( not ( = ?AUTO_7316 ?AUTO_7321 ) ) ( not ( = ?AUTO_7317 ?AUTO_7321 ) ) ( CAN_TRAVERSE ?AUTO_7320 ?AUTO_7318 ?AUTO_7321 ) ( AT ?AUTO_7320 ?AUTO_7318 ) ( VISIBLE ?AUTO_7318 ?AUTO_7321 ) ( not ( = ?AUTO_7316 ?AUTO_7318 ) ) ( not ( = ?AUTO_7317 ?AUTO_7318 ) ) ( not ( = ?AUTO_7321 ?AUTO_7318 ) ) ( AT_ROCK_SAMPLE ?AUTO_7318 ) ( EMPTY ?AUTO_7319 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_7320 ?AUTO_7319 ?AUTO_7318 )
      ( GET_ROCK_DATA ?AUTO_7316 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7316 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7327 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7329 - LANDER
      ?AUTO_7330 - WAYPOINT
      ?AUTO_7332 - ROVER
      ?AUTO_7333 - STORE
      ?AUTO_7328 - WAYPOINT
      ?AUTO_7331 - WAYPOINT
      ?AUTO_7334 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7329 ?AUTO_7330 ) ( VISIBLE ?AUTO_7327 ?AUTO_7330 ) ( AVAILABLE ?AUTO_7332 ) ( CHANNEL_FREE ?AUTO_7329 ) ( not ( = ?AUTO_7327 ?AUTO_7330 ) ) ( AT_ROCK_SAMPLE ?AUTO_7327 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7332 ) ( STORE_OF ?AUTO_7333 ?AUTO_7332 ) ( CAN_TRAVERSE ?AUTO_7332 ?AUTO_7330 ?AUTO_7327 ) ( VISIBLE ?AUTO_7330 ?AUTO_7327 ) ( CAN_TRAVERSE ?AUTO_7332 ?AUTO_7328 ?AUTO_7330 ) ( VISIBLE ?AUTO_7328 ?AUTO_7330 ) ( not ( = ?AUTO_7327 ?AUTO_7328 ) ) ( not ( = ?AUTO_7330 ?AUTO_7328 ) ) ( FULL ?AUTO_7333 ) ( CAN_TRAVERSE ?AUTO_7332 ?AUTO_7331 ?AUTO_7328 ) ( VISIBLE ?AUTO_7331 ?AUTO_7328 ) ( not ( = ?AUTO_7327 ?AUTO_7331 ) ) ( not ( = ?AUTO_7330 ?AUTO_7331 ) ) ( not ( = ?AUTO_7328 ?AUTO_7331 ) ) ( CAN_TRAVERSE ?AUTO_7332 ?AUTO_7334 ?AUTO_7331 ) ( AT ?AUTO_7332 ?AUTO_7334 ) ( VISIBLE ?AUTO_7334 ?AUTO_7331 ) ( not ( = ?AUTO_7327 ?AUTO_7334 ) ) ( not ( = ?AUTO_7330 ?AUTO_7334 ) ) ( not ( = ?AUTO_7328 ?AUTO_7334 ) ) ( not ( = ?AUTO_7331 ?AUTO_7334 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7332 ?AUTO_7334 ?AUTO_7331 )
      ( GET_ROCK_DATA ?AUTO_7327 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7327 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7336 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7337 - LANDER
      ?AUTO_7342 - WAYPOINT
      ?AUTO_7339 - ROVER
      ?AUTO_7340 - STORE
      ?AUTO_7338 - WAYPOINT
      ?AUTO_7341 - WAYPOINT
      ?AUTO_7343 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7337 ?AUTO_7342 ) ( VISIBLE ?AUTO_7336 ?AUTO_7342 ) ( AVAILABLE ?AUTO_7339 ) ( CHANNEL_FREE ?AUTO_7337 ) ( not ( = ?AUTO_7336 ?AUTO_7342 ) ) ( AT_ROCK_SAMPLE ?AUTO_7336 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7339 ) ( STORE_OF ?AUTO_7340 ?AUTO_7339 ) ( CAN_TRAVERSE ?AUTO_7339 ?AUTO_7342 ?AUTO_7336 ) ( VISIBLE ?AUTO_7342 ?AUTO_7336 ) ( CAN_TRAVERSE ?AUTO_7339 ?AUTO_7338 ?AUTO_7342 ) ( VISIBLE ?AUTO_7338 ?AUTO_7342 ) ( not ( = ?AUTO_7336 ?AUTO_7338 ) ) ( not ( = ?AUTO_7342 ?AUTO_7338 ) ) ( CAN_TRAVERSE ?AUTO_7339 ?AUTO_7341 ?AUTO_7338 ) ( VISIBLE ?AUTO_7341 ?AUTO_7338 ) ( not ( = ?AUTO_7336 ?AUTO_7341 ) ) ( not ( = ?AUTO_7342 ?AUTO_7341 ) ) ( not ( = ?AUTO_7338 ?AUTO_7341 ) ) ( CAN_TRAVERSE ?AUTO_7339 ?AUTO_7343 ?AUTO_7341 ) ( AT ?AUTO_7339 ?AUTO_7343 ) ( VISIBLE ?AUTO_7343 ?AUTO_7341 ) ( not ( = ?AUTO_7336 ?AUTO_7343 ) ) ( not ( = ?AUTO_7342 ?AUTO_7343 ) ) ( not ( = ?AUTO_7338 ?AUTO_7343 ) ) ( not ( = ?AUTO_7341 ?AUTO_7343 ) ) ( AT_ROCK_SAMPLE ?AUTO_7343 ) ( EMPTY ?AUTO_7340 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_7339 ?AUTO_7340 ?AUTO_7343 )
      ( GET_ROCK_DATA ?AUTO_7336 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7336 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7398 - OBJECTIVE
      ?AUTO_7399 - MODE
    )
    :vars
    (
      ?AUTO_7405 - LANDER
      ?AUTO_7402 - WAYPOINT
      ?AUTO_7403 - WAYPOINT
      ?AUTO_7401 - ROVER
      ?AUTO_7400 - CAMERA
      ?AUTO_7404 - WAYPOINT
      ?AUTO_7406 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7405 ?AUTO_7402 ) ( VISIBLE ?AUTO_7403 ?AUTO_7402 ) ( AVAILABLE ?AUTO_7401 ) ( CHANNEL_FREE ?AUTO_7405 ) ( not ( = ?AUTO_7403 ?AUTO_7402 ) ) ( CALIBRATED ?AUTO_7400 ?AUTO_7401 ) ( ON_BOARD ?AUTO_7400 ?AUTO_7401 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7401 ) ( SUPPORTS ?AUTO_7400 ?AUTO_7399 ) ( VISIBLE_FROM ?AUTO_7398 ?AUTO_7403 ) ( CAN_TRAVERSE ?AUTO_7401 ?AUTO_7402 ?AUTO_7403 ) ( VISIBLE ?AUTO_7402 ?AUTO_7403 ) ( CAN_TRAVERSE ?AUTO_7401 ?AUTO_7404 ?AUTO_7402 ) ( VISIBLE ?AUTO_7404 ?AUTO_7402 ) ( not ( = ?AUTO_7402 ?AUTO_7404 ) ) ( not ( = ?AUTO_7403 ?AUTO_7404 ) ) ( CAN_TRAVERSE ?AUTO_7401 ?AUTO_7406 ?AUTO_7404 ) ( AT ?AUTO_7401 ?AUTO_7406 ) ( VISIBLE ?AUTO_7406 ?AUTO_7404 ) ( not ( = ?AUTO_7402 ?AUTO_7406 ) ) ( not ( = ?AUTO_7403 ?AUTO_7406 ) ) ( not ( = ?AUTO_7404 ?AUTO_7406 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7401 ?AUTO_7406 ?AUTO_7404 )
      ( GET_IMAGE_DATA ?AUTO_7398 ?AUTO_7399 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7398 ?AUTO_7399 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7419 - OBJECTIVE
      ?AUTO_7420 - MODE
    )
    :vars
    (
      ?AUTO_7423 - LANDER
      ?AUTO_7427 - WAYPOINT
      ?AUTO_7424 - WAYPOINT
      ?AUTO_7422 - ROVER
      ?AUTO_7421 - CAMERA
      ?AUTO_7426 - WAYPOINT
      ?AUTO_7425 - WAYPOINT
      ?AUTO_7428 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7423 ?AUTO_7427 ) ( VISIBLE ?AUTO_7424 ?AUTO_7427 ) ( AVAILABLE ?AUTO_7422 ) ( CHANNEL_FREE ?AUTO_7423 ) ( not ( = ?AUTO_7424 ?AUTO_7427 ) ) ( CALIBRATED ?AUTO_7421 ?AUTO_7422 ) ( ON_BOARD ?AUTO_7421 ?AUTO_7422 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7422 ) ( SUPPORTS ?AUTO_7421 ?AUTO_7420 ) ( VISIBLE_FROM ?AUTO_7419 ?AUTO_7424 ) ( CAN_TRAVERSE ?AUTO_7422 ?AUTO_7427 ?AUTO_7424 ) ( VISIBLE ?AUTO_7427 ?AUTO_7424 ) ( CAN_TRAVERSE ?AUTO_7422 ?AUTO_7426 ?AUTO_7427 ) ( VISIBLE ?AUTO_7426 ?AUTO_7427 ) ( not ( = ?AUTO_7427 ?AUTO_7426 ) ) ( not ( = ?AUTO_7424 ?AUTO_7426 ) ) ( CAN_TRAVERSE ?AUTO_7422 ?AUTO_7425 ?AUTO_7426 ) ( VISIBLE ?AUTO_7425 ?AUTO_7426 ) ( not ( = ?AUTO_7427 ?AUTO_7425 ) ) ( not ( = ?AUTO_7424 ?AUTO_7425 ) ) ( not ( = ?AUTO_7426 ?AUTO_7425 ) ) ( CAN_TRAVERSE ?AUTO_7422 ?AUTO_7428 ?AUTO_7425 ) ( AT ?AUTO_7422 ?AUTO_7428 ) ( VISIBLE ?AUTO_7428 ?AUTO_7425 ) ( not ( = ?AUTO_7427 ?AUTO_7428 ) ) ( not ( = ?AUTO_7424 ?AUTO_7428 ) ) ( not ( = ?AUTO_7426 ?AUTO_7428 ) ) ( not ( = ?AUTO_7425 ?AUTO_7428 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7422 ?AUTO_7428 ?AUTO_7425 )
      ( GET_IMAGE_DATA ?AUTO_7419 ?AUTO_7420 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7419 ?AUTO_7420 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7439 - OBJECTIVE
      ?AUTO_7440 - MODE
    )
    :vars
    (
      ?AUTO_7444 - LANDER
      ?AUTO_7443 - WAYPOINT
      ?AUTO_7448 - WAYPOINT
      ?AUTO_7446 - ROVER
      ?AUTO_7442 - CAMERA
      ?AUTO_7445 - WAYPOINT
      ?AUTO_7441 - WAYPOINT
      ?AUTO_7447 - WAYPOINT
      ?AUTO_7449 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7444 ?AUTO_7443 ) ( VISIBLE ?AUTO_7448 ?AUTO_7443 ) ( AVAILABLE ?AUTO_7446 ) ( CHANNEL_FREE ?AUTO_7444 ) ( not ( = ?AUTO_7448 ?AUTO_7443 ) ) ( ON_BOARD ?AUTO_7442 ?AUTO_7446 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7446 ) ( SUPPORTS ?AUTO_7442 ?AUTO_7440 ) ( VISIBLE_FROM ?AUTO_7439 ?AUTO_7448 ) ( CAN_TRAVERSE ?AUTO_7446 ?AUTO_7443 ?AUTO_7448 ) ( VISIBLE ?AUTO_7443 ?AUTO_7448 ) ( CAN_TRAVERSE ?AUTO_7446 ?AUTO_7445 ?AUTO_7443 ) ( VISIBLE ?AUTO_7445 ?AUTO_7443 ) ( not ( = ?AUTO_7443 ?AUTO_7445 ) ) ( not ( = ?AUTO_7448 ?AUTO_7445 ) ) ( CAN_TRAVERSE ?AUTO_7446 ?AUTO_7441 ?AUTO_7445 ) ( VISIBLE ?AUTO_7441 ?AUTO_7445 ) ( not ( = ?AUTO_7443 ?AUTO_7441 ) ) ( not ( = ?AUTO_7448 ?AUTO_7441 ) ) ( not ( = ?AUTO_7445 ?AUTO_7441 ) ) ( CAN_TRAVERSE ?AUTO_7446 ?AUTO_7447 ?AUTO_7441 ) ( AT ?AUTO_7446 ?AUTO_7447 ) ( VISIBLE ?AUTO_7447 ?AUTO_7441 ) ( not ( = ?AUTO_7443 ?AUTO_7447 ) ) ( not ( = ?AUTO_7448 ?AUTO_7447 ) ) ( not ( = ?AUTO_7445 ?AUTO_7447 ) ) ( not ( = ?AUTO_7441 ?AUTO_7447 ) ) ( CALIBRATION_TARGET ?AUTO_7442 ?AUTO_7449 ) ( VISIBLE_FROM ?AUTO_7449 ?AUTO_7447 ) ( not ( = ?AUTO_7439 ?AUTO_7449 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_7446 ?AUTO_7442 ?AUTO_7449 ?AUTO_7447 )
      ( GET_IMAGE_DATA ?AUTO_7439 ?AUTO_7440 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7439 ?AUTO_7440 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7500 - OBJECTIVE
      ?AUTO_7501 - MODE
    )
    :vars
    (
      ?AUTO_7505 - LANDER
      ?AUTO_7502 - WAYPOINT
      ?AUTO_7504 - WAYPOINT
      ?AUTO_7508 - ROVER
      ?AUTO_7507 - WAYPOINT
      ?AUTO_7506 - WAYPOINT
      ?AUTO_7503 - CAMERA
      ?AUTO_7509 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7505 ?AUTO_7502 ) ( VISIBLE ?AUTO_7504 ?AUTO_7502 ) ( AVAILABLE ?AUTO_7508 ) ( CHANNEL_FREE ?AUTO_7505 ) ( not ( = ?AUTO_7504 ?AUTO_7502 ) ) ( CAN_TRAVERSE ?AUTO_7508 ?AUTO_7507 ?AUTO_7504 ) ( VISIBLE ?AUTO_7507 ?AUTO_7504 ) ( not ( = ?AUTO_7502 ?AUTO_7507 ) ) ( not ( = ?AUTO_7504 ?AUTO_7507 ) ) ( CAN_TRAVERSE ?AUTO_7508 ?AUTO_7506 ?AUTO_7507 ) ( VISIBLE ?AUTO_7506 ?AUTO_7507 ) ( not ( = ?AUTO_7502 ?AUTO_7506 ) ) ( not ( = ?AUTO_7504 ?AUTO_7506 ) ) ( not ( = ?AUTO_7507 ?AUTO_7506 ) ) ( ON_BOARD ?AUTO_7503 ?AUTO_7508 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7508 ) ( SUPPORTS ?AUTO_7503 ?AUTO_7501 ) ( VISIBLE_FROM ?AUTO_7500 ?AUTO_7506 ) ( CAN_TRAVERSE ?AUTO_7508 ?AUTO_7507 ?AUTO_7506 ) ( VISIBLE ?AUTO_7507 ?AUTO_7506 ) ( CAN_TRAVERSE ?AUTO_7508 ?AUTO_7504 ?AUTO_7507 ) ( AT ?AUTO_7508 ?AUTO_7504 ) ( VISIBLE ?AUTO_7504 ?AUTO_7507 ) ( CALIBRATION_TARGET ?AUTO_7503 ?AUTO_7509 ) ( VISIBLE_FROM ?AUTO_7509 ?AUTO_7504 ) ( not ( = ?AUTO_7500 ?AUTO_7509 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_7508 ?AUTO_7503 ?AUTO_7509 ?AUTO_7504 )
      ( GET_IMAGE_DATA ?AUTO_7500 ?AUTO_7501 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7500 ?AUTO_7501 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7510 - OBJECTIVE
      ?AUTO_7511 - MODE
    )
    :vars
    (
      ?AUTO_7517 - LANDER
      ?AUTO_7514 - WAYPOINT
      ?AUTO_7518 - WAYPOINT
      ?AUTO_7519 - ROVER
      ?AUTO_7516 - WAYPOINT
      ?AUTO_7515 - WAYPOINT
      ?AUTO_7512 - CAMERA
      ?AUTO_7513 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7517 ?AUTO_7514 ) ( VISIBLE ?AUTO_7518 ?AUTO_7514 ) ( AVAILABLE ?AUTO_7519 ) ( CHANNEL_FREE ?AUTO_7517 ) ( not ( = ?AUTO_7518 ?AUTO_7514 ) ) ( CAN_TRAVERSE ?AUTO_7519 ?AUTO_7516 ?AUTO_7518 ) ( VISIBLE ?AUTO_7516 ?AUTO_7518 ) ( not ( = ?AUTO_7514 ?AUTO_7516 ) ) ( not ( = ?AUTO_7518 ?AUTO_7516 ) ) ( CAN_TRAVERSE ?AUTO_7519 ?AUTO_7515 ?AUTO_7516 ) ( VISIBLE ?AUTO_7515 ?AUTO_7516 ) ( not ( = ?AUTO_7514 ?AUTO_7515 ) ) ( not ( = ?AUTO_7518 ?AUTO_7515 ) ) ( not ( = ?AUTO_7516 ?AUTO_7515 ) ) ( ON_BOARD ?AUTO_7512 ?AUTO_7519 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7519 ) ( SUPPORTS ?AUTO_7512 ?AUTO_7511 ) ( VISIBLE_FROM ?AUTO_7510 ?AUTO_7515 ) ( CAN_TRAVERSE ?AUTO_7519 ?AUTO_7516 ?AUTO_7515 ) ( VISIBLE ?AUTO_7516 ?AUTO_7515 ) ( CAN_TRAVERSE ?AUTO_7519 ?AUTO_7518 ?AUTO_7516 ) ( VISIBLE ?AUTO_7518 ?AUTO_7516 ) ( CALIBRATION_TARGET ?AUTO_7512 ?AUTO_7513 ) ( VISIBLE_FROM ?AUTO_7513 ?AUTO_7518 ) ( not ( = ?AUTO_7510 ?AUTO_7513 ) ) ( AT ?AUTO_7519 ?AUTO_7516 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7519 ?AUTO_7516 ?AUTO_7518 )
      ( GET_IMAGE_DATA ?AUTO_7510 ?AUTO_7511 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7510 ?AUTO_7511 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7630 - OBJECTIVE
      ?AUTO_7631 - MODE
    )
    :vars
    (
      ?AUTO_7637 - LANDER
      ?AUTO_7632 - WAYPOINT
      ?AUTO_7633 - WAYPOINT
      ?AUTO_7636 - ROVER
      ?AUTO_7634 - CAMERA
      ?AUTO_7635 - WAYPOINT
      ?AUTO_7638 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7637 ?AUTO_7632 ) ( VISIBLE ?AUTO_7633 ?AUTO_7632 ) ( AVAILABLE ?AUTO_7636 ) ( CHANNEL_FREE ?AUTO_7637 ) ( not ( = ?AUTO_7633 ?AUTO_7632 ) ) ( CAN_TRAVERSE ?AUTO_7636 ?AUTO_7632 ?AUTO_7633 ) ( VISIBLE ?AUTO_7632 ?AUTO_7633 ) ( ON_BOARD ?AUTO_7634 ?AUTO_7636 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7636 ) ( SUPPORTS ?AUTO_7634 ?AUTO_7631 ) ( VISIBLE_FROM ?AUTO_7630 ?AUTO_7632 ) ( CALIBRATION_TARGET ?AUTO_7634 ?AUTO_7630 ) ( CAN_TRAVERSE ?AUTO_7636 ?AUTO_7635 ?AUTO_7632 ) ( VISIBLE ?AUTO_7635 ?AUTO_7632 ) ( not ( = ?AUTO_7632 ?AUTO_7635 ) ) ( not ( = ?AUTO_7633 ?AUTO_7635 ) ) ( CAN_TRAVERSE ?AUTO_7636 ?AUTO_7638 ?AUTO_7635 ) ( AT ?AUTO_7636 ?AUTO_7638 ) ( VISIBLE ?AUTO_7638 ?AUTO_7635 ) ( not ( = ?AUTO_7632 ?AUTO_7638 ) ) ( not ( = ?AUTO_7633 ?AUTO_7638 ) ) ( not ( = ?AUTO_7635 ?AUTO_7638 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7636 ?AUTO_7638 ?AUTO_7635 )
      ( GET_IMAGE_DATA ?AUTO_7630 ?AUTO_7631 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7630 ?AUTO_7631 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7739 - OBJECTIVE
      ?AUTO_7740 - MODE
    )
    :vars
    (
      ?AUTO_7746 - LANDER
      ?AUTO_7743 - WAYPOINT
      ?AUTO_7747 - WAYPOINT
      ?AUTO_7742 - ROVER
      ?AUTO_7741 - WAYPOINT
      ?AUTO_7744 - CAMERA
      ?AUTO_7745 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7746 ?AUTO_7743 ) ( VISIBLE ?AUTO_7747 ?AUTO_7743 ) ( AVAILABLE ?AUTO_7742 ) ( CHANNEL_FREE ?AUTO_7746 ) ( not ( = ?AUTO_7747 ?AUTO_7743 ) ) ( CAN_TRAVERSE ?AUTO_7742 ?AUTO_7741 ?AUTO_7747 ) ( VISIBLE ?AUTO_7741 ?AUTO_7747 ) ( not ( = ?AUTO_7743 ?AUTO_7741 ) ) ( not ( = ?AUTO_7747 ?AUTO_7741 ) ) ( CALIBRATED ?AUTO_7744 ?AUTO_7742 ) ( ON_BOARD ?AUTO_7744 ?AUTO_7742 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7742 ) ( SUPPORTS ?AUTO_7744 ?AUTO_7740 ) ( VISIBLE_FROM ?AUTO_7739 ?AUTO_7741 ) ( CAN_TRAVERSE ?AUTO_7742 ?AUTO_7745 ?AUTO_7741 ) ( VISIBLE ?AUTO_7745 ?AUTO_7741 ) ( not ( = ?AUTO_7743 ?AUTO_7745 ) ) ( not ( = ?AUTO_7747 ?AUTO_7745 ) ) ( not ( = ?AUTO_7741 ?AUTO_7745 ) ) ( CAN_TRAVERSE ?AUTO_7742 ?AUTO_7747 ?AUTO_7745 ) ( AT ?AUTO_7742 ?AUTO_7747 ) ( VISIBLE ?AUTO_7747 ?AUTO_7745 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7742 ?AUTO_7747 ?AUTO_7745 )
      ( GET_IMAGE_DATA ?AUTO_7739 ?AUTO_7740 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7739 ?AUTO_7740 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7754 - OBJECTIVE
      ?AUTO_7755 - MODE
    )
    :vars
    (
      ?AUTO_7758 - LANDER
      ?AUTO_7762 - WAYPOINT
      ?AUTO_7756 - WAYPOINT
      ?AUTO_7760 - ROVER
      ?AUTO_7759 - WAYPOINT
      ?AUTO_7761 - CAMERA
      ?AUTO_7757 - WAYPOINT
      ?AUTO_7763 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7758 ?AUTO_7762 ) ( VISIBLE ?AUTO_7756 ?AUTO_7762 ) ( AVAILABLE ?AUTO_7760 ) ( CHANNEL_FREE ?AUTO_7758 ) ( not ( = ?AUTO_7756 ?AUTO_7762 ) ) ( CAN_TRAVERSE ?AUTO_7760 ?AUTO_7759 ?AUTO_7756 ) ( VISIBLE ?AUTO_7759 ?AUTO_7756 ) ( not ( = ?AUTO_7762 ?AUTO_7759 ) ) ( not ( = ?AUTO_7756 ?AUTO_7759 ) ) ( ON_BOARD ?AUTO_7761 ?AUTO_7760 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7760 ) ( SUPPORTS ?AUTO_7761 ?AUTO_7755 ) ( VISIBLE_FROM ?AUTO_7754 ?AUTO_7759 ) ( CAN_TRAVERSE ?AUTO_7760 ?AUTO_7757 ?AUTO_7759 ) ( VISIBLE ?AUTO_7757 ?AUTO_7759 ) ( not ( = ?AUTO_7762 ?AUTO_7757 ) ) ( not ( = ?AUTO_7756 ?AUTO_7757 ) ) ( not ( = ?AUTO_7759 ?AUTO_7757 ) ) ( CAN_TRAVERSE ?AUTO_7760 ?AUTO_7756 ?AUTO_7757 ) ( AT ?AUTO_7760 ?AUTO_7756 ) ( VISIBLE ?AUTO_7756 ?AUTO_7757 ) ( CALIBRATION_TARGET ?AUTO_7761 ?AUTO_7763 ) ( VISIBLE_FROM ?AUTO_7763 ?AUTO_7756 ) ( not ( = ?AUTO_7754 ?AUTO_7763 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_7760 ?AUTO_7761 ?AUTO_7763 ?AUTO_7756 )
      ( GET_IMAGE_DATA ?AUTO_7754 ?AUTO_7755 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7754 ?AUTO_7755 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7842 - OBJECTIVE
      ?AUTO_7843 - MODE
    )
    :vars
    (
      ?AUTO_7844 - LANDER
      ?AUTO_7845 - WAYPOINT
      ?AUTO_7849 - WAYPOINT
      ?AUTO_7847 - ROVER
      ?AUTO_7846 - CAMERA
      ?AUTO_7848 - WAYPOINT
      ?AUTO_7850 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7844 ?AUTO_7845 ) ( VISIBLE ?AUTO_7849 ?AUTO_7845 ) ( AVAILABLE ?AUTO_7847 ) ( CHANNEL_FREE ?AUTO_7844 ) ( not ( = ?AUTO_7849 ?AUTO_7845 ) ) ( ON_BOARD ?AUTO_7846 ?AUTO_7847 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7847 ) ( SUPPORTS ?AUTO_7846 ?AUTO_7843 ) ( VISIBLE_FROM ?AUTO_7842 ?AUTO_7849 ) ( CAN_TRAVERSE ?AUTO_7847 ?AUTO_7845 ?AUTO_7849 ) ( VISIBLE ?AUTO_7845 ?AUTO_7849 ) ( CAN_TRAVERSE ?AUTO_7847 ?AUTO_7848 ?AUTO_7845 ) ( VISIBLE ?AUTO_7848 ?AUTO_7845 ) ( not ( = ?AUTO_7845 ?AUTO_7848 ) ) ( not ( = ?AUTO_7849 ?AUTO_7848 ) ) ( CALIBRATION_TARGET ?AUTO_7846 ?AUTO_7850 ) ( VISIBLE_FROM ?AUTO_7850 ?AUTO_7848 ) ( not ( = ?AUTO_7842 ?AUTO_7850 ) ) ( CAN_TRAVERSE ?AUTO_7847 ?AUTO_7849 ?AUTO_7848 ) ( AT ?AUTO_7847 ?AUTO_7849 ) ( VISIBLE ?AUTO_7849 ?AUTO_7848 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7847 ?AUTO_7849 ?AUTO_7848 )
      ( GET_IMAGE_DATA ?AUTO_7842 ?AUTO_7843 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7842 ?AUTO_7843 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7921 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7925 - LANDER
      ?AUTO_7924 - WAYPOINT
      ?AUTO_7923 - ROVER
      ?AUTO_7922 - STORE
      ?AUTO_7926 - WAYPOINT
      ?AUTO_7927 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7925 ?AUTO_7924 ) ( VISIBLE ?AUTO_7921 ?AUTO_7924 ) ( AVAILABLE ?AUTO_7923 ) ( CHANNEL_FREE ?AUTO_7925 ) ( not ( = ?AUTO_7921 ?AUTO_7924 ) ) ( AT_ROCK_SAMPLE ?AUTO_7921 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7923 ) ( STORE_OF ?AUTO_7922 ?AUTO_7923 ) ( CAN_TRAVERSE ?AUTO_7923 ?AUTO_7926 ?AUTO_7921 ) ( VISIBLE ?AUTO_7926 ?AUTO_7921 ) ( not ( = ?AUTO_7921 ?AUTO_7926 ) ) ( not ( = ?AUTO_7924 ?AUTO_7926 ) ) ( CAN_TRAVERSE ?AUTO_7923 ?AUTO_7924 ?AUTO_7926 ) ( VISIBLE ?AUTO_7924 ?AUTO_7926 ) ( FULL ?AUTO_7922 ) ( CAN_TRAVERSE ?AUTO_7923 ?AUTO_7927 ?AUTO_7924 ) ( AT ?AUTO_7923 ?AUTO_7927 ) ( VISIBLE ?AUTO_7927 ?AUTO_7924 ) ( not ( = ?AUTO_7921 ?AUTO_7927 ) ) ( not ( = ?AUTO_7924 ?AUTO_7927 ) ) ( not ( = ?AUTO_7926 ?AUTO_7927 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7923 ?AUTO_7927 ?AUTO_7924 )
      ( GET_ROCK_DATA ?AUTO_7921 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7921 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7929 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7934 - LANDER
      ?AUTO_7935 - WAYPOINT
      ?AUTO_7931 - ROVER
      ?AUTO_7933 - STORE
      ?AUTO_7930 - WAYPOINT
      ?AUTO_7932 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7934 ?AUTO_7935 ) ( VISIBLE ?AUTO_7929 ?AUTO_7935 ) ( AVAILABLE ?AUTO_7931 ) ( CHANNEL_FREE ?AUTO_7934 ) ( not ( = ?AUTO_7929 ?AUTO_7935 ) ) ( AT_ROCK_SAMPLE ?AUTO_7929 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7931 ) ( STORE_OF ?AUTO_7933 ?AUTO_7931 ) ( CAN_TRAVERSE ?AUTO_7931 ?AUTO_7930 ?AUTO_7929 ) ( VISIBLE ?AUTO_7930 ?AUTO_7929 ) ( not ( = ?AUTO_7929 ?AUTO_7930 ) ) ( not ( = ?AUTO_7935 ?AUTO_7930 ) ) ( CAN_TRAVERSE ?AUTO_7931 ?AUTO_7935 ?AUTO_7930 ) ( VISIBLE ?AUTO_7935 ?AUTO_7930 ) ( CAN_TRAVERSE ?AUTO_7931 ?AUTO_7932 ?AUTO_7935 ) ( AT ?AUTO_7931 ?AUTO_7932 ) ( VISIBLE ?AUTO_7932 ?AUTO_7935 ) ( not ( = ?AUTO_7929 ?AUTO_7932 ) ) ( not ( = ?AUTO_7935 ?AUTO_7932 ) ) ( not ( = ?AUTO_7930 ?AUTO_7932 ) ) ( AT_SOIL_SAMPLE ?AUTO_7932 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7931 ) ( EMPTY ?AUTO_7933 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_7931 ?AUTO_7933 ?AUTO_7932 )
      ( GET_ROCK_DATA ?AUTO_7929 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7929 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8058 - OBJECTIVE
      ?AUTO_8059 - MODE
    )
    :vars
    (
      ?AUTO_8060 - LANDER
      ?AUTO_8063 - WAYPOINT
      ?AUTO_8064 - WAYPOINT
      ?AUTO_8061 - ROVER
      ?AUTO_8062 - CAMERA
      ?AUTO_8065 - OBJECTIVE
      ?AUTO_8066 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8060 ?AUTO_8063 ) ( VISIBLE ?AUTO_8064 ?AUTO_8063 ) ( AVAILABLE ?AUTO_8061 ) ( CHANNEL_FREE ?AUTO_8060 ) ( not ( = ?AUTO_8064 ?AUTO_8063 ) ) ( ON_BOARD ?AUTO_8062 ?AUTO_8061 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8061 ) ( SUPPORTS ?AUTO_8062 ?AUTO_8059 ) ( VISIBLE_FROM ?AUTO_8058 ?AUTO_8064 ) ( CAN_TRAVERSE ?AUTO_8061 ?AUTO_8063 ?AUTO_8064 ) ( VISIBLE ?AUTO_8063 ?AUTO_8064 ) ( CALIBRATION_TARGET ?AUTO_8062 ?AUTO_8065 ) ( VISIBLE_FROM ?AUTO_8065 ?AUTO_8063 ) ( not ( = ?AUTO_8058 ?AUTO_8065 ) ) ( CAN_TRAVERSE ?AUTO_8061 ?AUTO_8066 ?AUTO_8063 ) ( AT ?AUTO_8061 ?AUTO_8066 ) ( VISIBLE ?AUTO_8066 ?AUTO_8063 ) ( not ( = ?AUTO_8063 ?AUTO_8066 ) ) ( not ( = ?AUTO_8064 ?AUTO_8066 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8061 ?AUTO_8066 ?AUTO_8063 )
      ( GET_IMAGE_DATA ?AUTO_8058 ?AUTO_8059 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8058 ?AUTO_8059 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8106 - OBJECTIVE
      ?AUTO_8107 - MODE
    )
    :vars
    (
      ?AUTO_8109 - LANDER
      ?AUTO_8108 - WAYPOINT
      ?AUTO_8114 - WAYPOINT
      ?AUTO_8113 - ROVER
      ?AUTO_8111 - CAMERA
      ?AUTO_8110 - OBJECTIVE
      ?AUTO_8112 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8109 ?AUTO_8108 ) ( VISIBLE ?AUTO_8114 ?AUTO_8108 ) ( AVAILABLE ?AUTO_8113 ) ( CHANNEL_FREE ?AUTO_8109 ) ( not ( = ?AUTO_8114 ?AUTO_8108 ) ) ( ON_BOARD ?AUTO_8111 ?AUTO_8113 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8113 ) ( SUPPORTS ?AUTO_8111 ?AUTO_8107 ) ( VISIBLE_FROM ?AUTO_8106 ?AUTO_8114 ) ( CAN_TRAVERSE ?AUTO_8113 ?AUTO_8108 ?AUTO_8114 ) ( VISIBLE ?AUTO_8108 ?AUTO_8114 ) ( CALIBRATION_TARGET ?AUTO_8111 ?AUTO_8110 ) ( VISIBLE_FROM ?AUTO_8110 ?AUTO_8108 ) ( not ( = ?AUTO_8106 ?AUTO_8110 ) ) ( CAN_TRAVERSE ?AUTO_8113 ?AUTO_8112 ?AUTO_8108 ) ( VISIBLE ?AUTO_8112 ?AUTO_8108 ) ( not ( = ?AUTO_8108 ?AUTO_8112 ) ) ( not ( = ?AUTO_8114 ?AUTO_8112 ) ) ( CAN_TRAVERSE ?AUTO_8113 ?AUTO_8114 ?AUTO_8112 ) ( AT ?AUTO_8113 ?AUTO_8114 ) ( VISIBLE ?AUTO_8114 ?AUTO_8112 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8113 ?AUTO_8114 ?AUTO_8112 )
      ( GET_IMAGE_DATA ?AUTO_8106 ?AUTO_8107 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8106 ?AUTO_8107 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8156 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8160 - LANDER
      ?AUTO_8159 - WAYPOINT
      ?AUTO_8162 - WAYPOINT
      ?AUTO_8161 - ROVER
      ?AUTO_8158 - WAYPOINT
      ?AUTO_8157 - STORE
      ?AUTO_8163 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8160 ?AUTO_8159 ) ( VISIBLE ?AUTO_8162 ?AUTO_8159 ) ( AVAILABLE ?AUTO_8161 ) ( CHANNEL_FREE ?AUTO_8160 ) ( not ( = ?AUTO_8156 ?AUTO_8162 ) ) ( not ( = ?AUTO_8156 ?AUTO_8159 ) ) ( not ( = ?AUTO_8162 ?AUTO_8159 ) ) ( CAN_TRAVERSE ?AUTO_8161 ?AUTO_8158 ?AUTO_8162 ) ( VISIBLE ?AUTO_8158 ?AUTO_8162 ) ( not ( = ?AUTO_8156 ?AUTO_8158 ) ) ( not ( = ?AUTO_8159 ?AUTO_8158 ) ) ( not ( = ?AUTO_8162 ?AUTO_8158 ) ) ( CAN_TRAVERSE ?AUTO_8161 ?AUTO_8156 ?AUTO_8158 ) ( VISIBLE ?AUTO_8156 ?AUTO_8158 ) ( AT_ROCK_SAMPLE ?AUTO_8156 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8161 ) ( STORE_OF ?AUTO_8157 ?AUTO_8161 ) ( EMPTY ?AUTO_8157 ) ( CAN_TRAVERSE ?AUTO_8161 ?AUTO_8158 ?AUTO_8156 ) ( VISIBLE ?AUTO_8158 ?AUTO_8156 ) ( CAN_TRAVERSE ?AUTO_8161 ?AUTO_8162 ?AUTO_8158 ) ( VISIBLE ?AUTO_8162 ?AUTO_8158 ) ( CAN_TRAVERSE ?AUTO_8161 ?AUTO_8163 ?AUTO_8162 ) ( AT ?AUTO_8161 ?AUTO_8163 ) ( VISIBLE ?AUTO_8163 ?AUTO_8162 ) ( not ( = ?AUTO_8156 ?AUTO_8163 ) ) ( not ( = ?AUTO_8159 ?AUTO_8163 ) ) ( not ( = ?AUTO_8162 ?AUTO_8163 ) ) ( not ( = ?AUTO_8158 ?AUTO_8163 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8161 ?AUTO_8163 ?AUTO_8162 )
      ( GET_ROCK_DATA ?AUTO_8156 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8156 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8166 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8169 - LANDER
      ?AUTO_8173 - WAYPOINT
      ?AUTO_8170 - WAYPOINT
      ?AUTO_8171 - ROVER
      ?AUTO_8172 - WAYPOINT
      ?AUTO_8168 - STORE
      ?AUTO_8167 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8169 ?AUTO_8173 ) ( VISIBLE ?AUTO_8170 ?AUTO_8173 ) ( AVAILABLE ?AUTO_8171 ) ( CHANNEL_FREE ?AUTO_8169 ) ( not ( = ?AUTO_8166 ?AUTO_8170 ) ) ( not ( = ?AUTO_8166 ?AUTO_8173 ) ) ( not ( = ?AUTO_8170 ?AUTO_8173 ) ) ( CAN_TRAVERSE ?AUTO_8171 ?AUTO_8172 ?AUTO_8170 ) ( VISIBLE ?AUTO_8172 ?AUTO_8170 ) ( not ( = ?AUTO_8166 ?AUTO_8172 ) ) ( not ( = ?AUTO_8173 ?AUTO_8172 ) ) ( not ( = ?AUTO_8170 ?AUTO_8172 ) ) ( CAN_TRAVERSE ?AUTO_8171 ?AUTO_8166 ?AUTO_8172 ) ( VISIBLE ?AUTO_8166 ?AUTO_8172 ) ( AT_ROCK_SAMPLE ?AUTO_8166 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8171 ) ( STORE_OF ?AUTO_8168 ?AUTO_8171 ) ( EMPTY ?AUTO_8168 ) ( CAN_TRAVERSE ?AUTO_8171 ?AUTO_8172 ?AUTO_8166 ) ( VISIBLE ?AUTO_8172 ?AUTO_8166 ) ( CAN_TRAVERSE ?AUTO_8171 ?AUTO_8170 ?AUTO_8172 ) ( VISIBLE ?AUTO_8170 ?AUTO_8172 ) ( CAN_TRAVERSE ?AUTO_8171 ?AUTO_8167 ?AUTO_8170 ) ( VISIBLE ?AUTO_8167 ?AUTO_8170 ) ( not ( = ?AUTO_8166 ?AUTO_8167 ) ) ( not ( = ?AUTO_8173 ?AUTO_8167 ) ) ( not ( = ?AUTO_8170 ?AUTO_8167 ) ) ( not ( = ?AUTO_8172 ?AUTO_8167 ) ) ( CAN_TRAVERSE ?AUTO_8171 ?AUTO_8173 ?AUTO_8167 ) ( AT ?AUTO_8171 ?AUTO_8173 ) ( VISIBLE ?AUTO_8173 ?AUTO_8167 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8171 ?AUTO_8173 ?AUTO_8167 )
      ( GET_ROCK_DATA ?AUTO_8166 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8166 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8225 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8227 - LANDER
      ?AUTO_8230 - WAYPOINT
      ?AUTO_8231 - WAYPOINT
      ?AUTO_8226 - ROVER
      ?AUTO_8229 - STORE
      ?AUTO_8228 - WAYPOINT
      ?AUTO_8232 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8227 ?AUTO_8230 ) ( VISIBLE ?AUTO_8231 ?AUTO_8230 ) ( AVAILABLE ?AUTO_8226 ) ( CHANNEL_FREE ?AUTO_8227 ) ( not ( = ?AUTO_8225 ?AUTO_8231 ) ) ( not ( = ?AUTO_8225 ?AUTO_8230 ) ) ( not ( = ?AUTO_8231 ?AUTO_8230 ) ) ( CAN_TRAVERSE ?AUTO_8226 ?AUTO_8225 ?AUTO_8231 ) ( VISIBLE ?AUTO_8225 ?AUTO_8231 ) ( AT_SOIL_SAMPLE ?AUTO_8225 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8226 ) ( STORE_OF ?AUTO_8229 ?AUTO_8226 ) ( CAN_TRAVERSE ?AUTO_8226 ?AUTO_8228 ?AUTO_8225 ) ( VISIBLE ?AUTO_8228 ?AUTO_8225 ) ( not ( = ?AUTO_8225 ?AUTO_8228 ) ) ( not ( = ?AUTO_8230 ?AUTO_8228 ) ) ( not ( = ?AUTO_8231 ?AUTO_8228 ) ) ( FULL ?AUTO_8229 ) ( CAN_TRAVERSE ?AUTO_8226 ?AUTO_8232 ?AUTO_8228 ) ( AT ?AUTO_8226 ?AUTO_8232 ) ( VISIBLE ?AUTO_8232 ?AUTO_8228 ) ( not ( = ?AUTO_8225 ?AUTO_8232 ) ) ( not ( = ?AUTO_8230 ?AUTO_8232 ) ) ( not ( = ?AUTO_8231 ?AUTO_8232 ) ) ( not ( = ?AUTO_8228 ?AUTO_8232 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8226 ?AUTO_8232 ?AUTO_8228 )
      ( GET_SOIL_DATA ?AUTO_8225 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8225 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8233 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8235 - LANDER
      ?AUTO_8238 - WAYPOINT
      ?AUTO_8234 - WAYPOINT
      ?AUTO_8236 - ROVER
      ?AUTO_8240 - STORE
      ?AUTO_8239 - WAYPOINT
      ?AUTO_8237 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8235 ?AUTO_8238 ) ( VISIBLE ?AUTO_8234 ?AUTO_8238 ) ( AVAILABLE ?AUTO_8236 ) ( CHANNEL_FREE ?AUTO_8235 ) ( not ( = ?AUTO_8233 ?AUTO_8234 ) ) ( not ( = ?AUTO_8233 ?AUTO_8238 ) ) ( not ( = ?AUTO_8234 ?AUTO_8238 ) ) ( CAN_TRAVERSE ?AUTO_8236 ?AUTO_8233 ?AUTO_8234 ) ( VISIBLE ?AUTO_8233 ?AUTO_8234 ) ( AT_SOIL_SAMPLE ?AUTO_8233 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8236 ) ( STORE_OF ?AUTO_8240 ?AUTO_8236 ) ( CAN_TRAVERSE ?AUTO_8236 ?AUTO_8239 ?AUTO_8233 ) ( VISIBLE ?AUTO_8239 ?AUTO_8233 ) ( not ( = ?AUTO_8233 ?AUTO_8239 ) ) ( not ( = ?AUTO_8238 ?AUTO_8239 ) ) ( not ( = ?AUTO_8234 ?AUTO_8239 ) ) ( CAN_TRAVERSE ?AUTO_8236 ?AUTO_8237 ?AUTO_8239 ) ( AT ?AUTO_8236 ?AUTO_8237 ) ( VISIBLE ?AUTO_8237 ?AUTO_8239 ) ( not ( = ?AUTO_8233 ?AUTO_8237 ) ) ( not ( = ?AUTO_8238 ?AUTO_8237 ) ) ( not ( = ?AUTO_8234 ?AUTO_8237 ) ) ( not ( = ?AUTO_8239 ?AUTO_8237 ) ) ( AT_SOIL_SAMPLE ?AUTO_8237 ) ( EMPTY ?AUTO_8240 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_8236 ?AUTO_8240 ?AUTO_8237 )
      ( GET_SOIL_DATA ?AUTO_8233 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8233 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8281 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8285 - LANDER
      ?AUTO_8283 - WAYPOINT
      ?AUTO_8282 - WAYPOINT
      ?AUTO_8287 - ROVER
      ?AUTO_8284 - WAYPOINT
      ?AUTO_8286 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8285 ?AUTO_8283 ) ( VISIBLE ?AUTO_8282 ?AUTO_8283 ) ( AVAILABLE ?AUTO_8287 ) ( CHANNEL_FREE ?AUTO_8285 ) ( not ( = ?AUTO_8281 ?AUTO_8282 ) ) ( not ( = ?AUTO_8281 ?AUTO_8283 ) ) ( not ( = ?AUTO_8282 ?AUTO_8283 ) ) ( CAN_TRAVERSE ?AUTO_8287 ?AUTO_8284 ?AUTO_8282 ) ( VISIBLE ?AUTO_8284 ?AUTO_8282 ) ( not ( = ?AUTO_8281 ?AUTO_8284 ) ) ( not ( = ?AUTO_8283 ?AUTO_8284 ) ) ( not ( = ?AUTO_8282 ?AUTO_8284 ) ) ( CAN_TRAVERSE ?AUTO_8287 ?AUTO_8281 ?AUTO_8284 ) ( AT ?AUTO_8287 ?AUTO_8281 ) ( VISIBLE ?AUTO_8281 ?AUTO_8284 ) ( AT_SOIL_SAMPLE ?AUTO_8281 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8287 ) ( STORE_OF ?AUTO_8286 ?AUTO_8287 ) ( FULL ?AUTO_8286 ) )
    :subtasks
    ( ( !DROP ?AUTO_8287 ?AUTO_8286 )
      ( GET_SOIL_DATA ?AUTO_8281 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8281 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8288 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8290 - LANDER
      ?AUTO_8291 - WAYPOINT
      ?AUTO_8294 - WAYPOINT
      ?AUTO_8293 - ROVER
      ?AUTO_8292 - WAYPOINT
      ?AUTO_8289 - STORE
      ?AUTO_8295 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8290 ?AUTO_8291 ) ( VISIBLE ?AUTO_8294 ?AUTO_8291 ) ( AVAILABLE ?AUTO_8293 ) ( CHANNEL_FREE ?AUTO_8290 ) ( not ( = ?AUTO_8288 ?AUTO_8294 ) ) ( not ( = ?AUTO_8288 ?AUTO_8291 ) ) ( not ( = ?AUTO_8294 ?AUTO_8291 ) ) ( CAN_TRAVERSE ?AUTO_8293 ?AUTO_8292 ?AUTO_8294 ) ( VISIBLE ?AUTO_8292 ?AUTO_8294 ) ( not ( = ?AUTO_8288 ?AUTO_8292 ) ) ( not ( = ?AUTO_8291 ?AUTO_8292 ) ) ( not ( = ?AUTO_8294 ?AUTO_8292 ) ) ( CAN_TRAVERSE ?AUTO_8293 ?AUTO_8288 ?AUTO_8292 ) ( VISIBLE ?AUTO_8288 ?AUTO_8292 ) ( AT_SOIL_SAMPLE ?AUTO_8288 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8293 ) ( STORE_OF ?AUTO_8289 ?AUTO_8293 ) ( FULL ?AUTO_8289 ) ( CAN_TRAVERSE ?AUTO_8293 ?AUTO_8295 ?AUTO_8288 ) ( AT ?AUTO_8293 ?AUTO_8295 ) ( VISIBLE ?AUTO_8295 ?AUTO_8288 ) ( not ( = ?AUTO_8288 ?AUTO_8295 ) ) ( not ( = ?AUTO_8291 ?AUTO_8295 ) ) ( not ( = ?AUTO_8294 ?AUTO_8295 ) ) ( not ( = ?AUTO_8292 ?AUTO_8295 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8293 ?AUTO_8295 ?AUTO_8288 )
      ( GET_SOIL_DATA ?AUTO_8288 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8288 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8296 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8303 - LANDER
      ?AUTO_8302 - WAYPOINT
      ?AUTO_8299 - WAYPOINT
      ?AUTO_8300 - ROVER
      ?AUTO_8297 - WAYPOINT
      ?AUTO_8301 - STORE
      ?AUTO_8298 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8303 ?AUTO_8302 ) ( VISIBLE ?AUTO_8299 ?AUTO_8302 ) ( AVAILABLE ?AUTO_8300 ) ( CHANNEL_FREE ?AUTO_8303 ) ( not ( = ?AUTO_8296 ?AUTO_8299 ) ) ( not ( = ?AUTO_8296 ?AUTO_8302 ) ) ( not ( = ?AUTO_8299 ?AUTO_8302 ) ) ( CAN_TRAVERSE ?AUTO_8300 ?AUTO_8297 ?AUTO_8299 ) ( VISIBLE ?AUTO_8297 ?AUTO_8299 ) ( not ( = ?AUTO_8296 ?AUTO_8297 ) ) ( not ( = ?AUTO_8302 ?AUTO_8297 ) ) ( not ( = ?AUTO_8299 ?AUTO_8297 ) ) ( CAN_TRAVERSE ?AUTO_8300 ?AUTO_8296 ?AUTO_8297 ) ( VISIBLE ?AUTO_8296 ?AUTO_8297 ) ( AT_SOIL_SAMPLE ?AUTO_8296 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8300 ) ( STORE_OF ?AUTO_8301 ?AUTO_8300 ) ( CAN_TRAVERSE ?AUTO_8300 ?AUTO_8298 ?AUTO_8296 ) ( AT ?AUTO_8300 ?AUTO_8298 ) ( VISIBLE ?AUTO_8298 ?AUTO_8296 ) ( not ( = ?AUTO_8296 ?AUTO_8298 ) ) ( not ( = ?AUTO_8302 ?AUTO_8298 ) ) ( not ( = ?AUTO_8299 ?AUTO_8298 ) ) ( not ( = ?AUTO_8297 ?AUTO_8298 ) ) ( AT_SOIL_SAMPLE ?AUTO_8298 ) ( EMPTY ?AUTO_8301 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_8300 ?AUTO_8301 ?AUTO_8298 )
      ( GET_SOIL_DATA ?AUTO_8296 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8296 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8304 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8305 - LANDER
      ?AUTO_8310 - WAYPOINT
      ?AUTO_8309 - WAYPOINT
      ?AUTO_8311 - ROVER
      ?AUTO_8306 - WAYPOINT
      ?AUTO_8308 - STORE
      ?AUTO_8307 - WAYPOINT
      ?AUTO_8312 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8305 ?AUTO_8310 ) ( VISIBLE ?AUTO_8309 ?AUTO_8310 ) ( AVAILABLE ?AUTO_8311 ) ( CHANNEL_FREE ?AUTO_8305 ) ( not ( = ?AUTO_8304 ?AUTO_8309 ) ) ( not ( = ?AUTO_8304 ?AUTO_8310 ) ) ( not ( = ?AUTO_8309 ?AUTO_8310 ) ) ( CAN_TRAVERSE ?AUTO_8311 ?AUTO_8306 ?AUTO_8309 ) ( VISIBLE ?AUTO_8306 ?AUTO_8309 ) ( not ( = ?AUTO_8304 ?AUTO_8306 ) ) ( not ( = ?AUTO_8310 ?AUTO_8306 ) ) ( not ( = ?AUTO_8309 ?AUTO_8306 ) ) ( CAN_TRAVERSE ?AUTO_8311 ?AUTO_8304 ?AUTO_8306 ) ( VISIBLE ?AUTO_8304 ?AUTO_8306 ) ( AT_SOIL_SAMPLE ?AUTO_8304 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8311 ) ( STORE_OF ?AUTO_8308 ?AUTO_8311 ) ( CAN_TRAVERSE ?AUTO_8311 ?AUTO_8307 ?AUTO_8304 ) ( VISIBLE ?AUTO_8307 ?AUTO_8304 ) ( not ( = ?AUTO_8304 ?AUTO_8307 ) ) ( not ( = ?AUTO_8310 ?AUTO_8307 ) ) ( not ( = ?AUTO_8309 ?AUTO_8307 ) ) ( not ( = ?AUTO_8306 ?AUTO_8307 ) ) ( AT_SOIL_SAMPLE ?AUTO_8307 ) ( EMPTY ?AUTO_8308 ) ( CAN_TRAVERSE ?AUTO_8311 ?AUTO_8312 ?AUTO_8307 ) ( AT ?AUTO_8311 ?AUTO_8312 ) ( VISIBLE ?AUTO_8312 ?AUTO_8307 ) ( not ( = ?AUTO_8304 ?AUTO_8312 ) ) ( not ( = ?AUTO_8310 ?AUTO_8312 ) ) ( not ( = ?AUTO_8309 ?AUTO_8312 ) ) ( not ( = ?AUTO_8306 ?AUTO_8312 ) ) ( not ( = ?AUTO_8307 ?AUTO_8312 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8311 ?AUTO_8312 ?AUTO_8307 )
      ( GET_SOIL_DATA ?AUTO_8304 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8304 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8317 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8323 - LANDER
      ?AUTO_8319 - WAYPOINT
      ?AUTO_8325 - WAYPOINT
      ?AUTO_8320 - ROVER
      ?AUTO_8322 - WAYPOINT
      ?AUTO_8324 - STORE
      ?AUTO_8318 - WAYPOINT
      ?AUTO_8321 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8323 ?AUTO_8319 ) ( VISIBLE ?AUTO_8325 ?AUTO_8319 ) ( AVAILABLE ?AUTO_8320 ) ( CHANNEL_FREE ?AUTO_8323 ) ( not ( = ?AUTO_8317 ?AUTO_8325 ) ) ( not ( = ?AUTO_8317 ?AUTO_8319 ) ) ( not ( = ?AUTO_8325 ?AUTO_8319 ) ) ( CAN_TRAVERSE ?AUTO_8320 ?AUTO_8322 ?AUTO_8325 ) ( VISIBLE ?AUTO_8322 ?AUTO_8325 ) ( not ( = ?AUTO_8317 ?AUTO_8322 ) ) ( not ( = ?AUTO_8319 ?AUTO_8322 ) ) ( not ( = ?AUTO_8325 ?AUTO_8322 ) ) ( CAN_TRAVERSE ?AUTO_8320 ?AUTO_8317 ?AUTO_8322 ) ( VISIBLE ?AUTO_8317 ?AUTO_8322 ) ( AT_SOIL_SAMPLE ?AUTO_8317 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8320 ) ( STORE_OF ?AUTO_8324 ?AUTO_8320 ) ( CAN_TRAVERSE ?AUTO_8320 ?AUTO_8318 ?AUTO_8317 ) ( VISIBLE ?AUTO_8318 ?AUTO_8317 ) ( not ( = ?AUTO_8317 ?AUTO_8318 ) ) ( not ( = ?AUTO_8319 ?AUTO_8318 ) ) ( not ( = ?AUTO_8325 ?AUTO_8318 ) ) ( not ( = ?AUTO_8322 ?AUTO_8318 ) ) ( AT_SOIL_SAMPLE ?AUTO_8318 ) ( EMPTY ?AUTO_8324 ) ( CAN_TRAVERSE ?AUTO_8320 ?AUTO_8321 ?AUTO_8318 ) ( VISIBLE ?AUTO_8321 ?AUTO_8318 ) ( not ( = ?AUTO_8317 ?AUTO_8321 ) ) ( not ( = ?AUTO_8319 ?AUTO_8321 ) ) ( not ( = ?AUTO_8325 ?AUTO_8321 ) ) ( not ( = ?AUTO_8322 ?AUTO_8321 ) ) ( not ( = ?AUTO_8318 ?AUTO_8321 ) ) ( CAN_TRAVERSE ?AUTO_8320 ?AUTO_8319 ?AUTO_8321 ) ( AT ?AUTO_8320 ?AUTO_8319 ) ( VISIBLE ?AUTO_8319 ?AUTO_8321 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8320 ?AUTO_8319 ?AUTO_8321 )
      ( GET_SOIL_DATA ?AUTO_8317 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8317 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8336 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8339 - LANDER
      ?AUTO_8341 - WAYPOINT
      ?AUTO_8337 - ROVER
      ?AUTO_8338 - WAYPOINT
      ?AUTO_8340 - WAYPOINT
      ?AUTO_8342 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8339 ?AUTO_8341 ) ( HAVE_SOIL_ANALYSIS ?AUTO_8337 ?AUTO_8336 ) ( VISIBLE ?AUTO_8338 ?AUTO_8341 ) ( AVAILABLE ?AUTO_8337 ) ( CHANNEL_FREE ?AUTO_8339 ) ( not ( = ?AUTO_8336 ?AUTO_8338 ) ) ( not ( = ?AUTO_8336 ?AUTO_8341 ) ) ( not ( = ?AUTO_8338 ?AUTO_8341 ) ) ( CAN_TRAVERSE ?AUTO_8337 ?AUTO_8340 ?AUTO_8338 ) ( VISIBLE ?AUTO_8340 ?AUTO_8338 ) ( not ( = ?AUTO_8336 ?AUTO_8340 ) ) ( not ( = ?AUTO_8341 ?AUTO_8340 ) ) ( not ( = ?AUTO_8338 ?AUTO_8340 ) ) ( CAN_TRAVERSE ?AUTO_8337 ?AUTO_8342 ?AUTO_8340 ) ( AT ?AUTO_8337 ?AUTO_8342 ) ( VISIBLE ?AUTO_8342 ?AUTO_8340 ) ( not ( = ?AUTO_8336 ?AUTO_8342 ) ) ( not ( = ?AUTO_8341 ?AUTO_8342 ) ) ( not ( = ?AUTO_8338 ?AUTO_8342 ) ) ( not ( = ?AUTO_8340 ?AUTO_8342 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8337 ?AUTO_8342 ?AUTO_8340 )
      ( GET_SOIL_DATA ?AUTO_8336 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8336 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8386 - OBJECTIVE
      ?AUTO_8387 - MODE
    )
    :vars
    (
      ?AUTO_8391 - LANDER
      ?AUTO_8394 - WAYPOINT
      ?AUTO_8390 - WAYPOINT
      ?AUTO_8393 - ROVER
      ?AUTO_8388 - WAYPOINT
      ?AUTO_8392 - WAYPOINT
      ?AUTO_8389 - WAYPOINT
      ?AUTO_8395 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8391 ?AUTO_8394 ) ( VISIBLE ?AUTO_8390 ?AUTO_8394 ) ( AVAILABLE ?AUTO_8393 ) ( CHANNEL_FREE ?AUTO_8391 ) ( not ( = ?AUTO_8390 ?AUTO_8394 ) ) ( CAN_TRAVERSE ?AUTO_8393 ?AUTO_8388 ?AUTO_8390 ) ( VISIBLE ?AUTO_8388 ?AUTO_8390 ) ( not ( = ?AUTO_8394 ?AUTO_8388 ) ) ( not ( = ?AUTO_8390 ?AUTO_8388 ) ) ( CAN_TRAVERSE ?AUTO_8393 ?AUTO_8392 ?AUTO_8388 ) ( VISIBLE ?AUTO_8392 ?AUTO_8388 ) ( not ( = ?AUTO_8394 ?AUTO_8392 ) ) ( not ( = ?AUTO_8390 ?AUTO_8392 ) ) ( not ( = ?AUTO_8388 ?AUTO_8392 ) ) ( CAN_TRAVERSE ?AUTO_8393 ?AUTO_8389 ?AUTO_8392 ) ( AT ?AUTO_8393 ?AUTO_8389 ) ( VISIBLE ?AUTO_8389 ?AUTO_8392 ) ( not ( = ?AUTO_8394 ?AUTO_8389 ) ) ( not ( = ?AUTO_8390 ?AUTO_8389 ) ) ( not ( = ?AUTO_8388 ?AUTO_8389 ) ) ( not ( = ?AUTO_8392 ?AUTO_8389 ) ) ( CALIBRATED ?AUTO_8395 ?AUTO_8393 ) ( ON_BOARD ?AUTO_8395 ?AUTO_8393 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8393 ) ( SUPPORTS ?AUTO_8395 ?AUTO_8387 ) ( VISIBLE_FROM ?AUTO_8386 ?AUTO_8389 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_8393 ?AUTO_8389 ?AUTO_8386 ?AUTO_8395 ?AUTO_8387 )
      ( GET_IMAGE_DATA ?AUTO_8386 ?AUTO_8387 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8386 ?AUTO_8387 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8396 - OBJECTIVE
      ?AUTO_8397 - MODE
    )
    :vars
    (
      ?AUTO_8405 - LANDER
      ?AUTO_8400 - WAYPOINT
      ?AUTO_8403 - WAYPOINT
      ?AUTO_8398 - ROVER
      ?AUTO_8399 - WAYPOINT
      ?AUTO_8404 - WAYPOINT
      ?AUTO_8401 - WAYPOINT
      ?AUTO_8402 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8405 ?AUTO_8400 ) ( VISIBLE ?AUTO_8403 ?AUTO_8400 ) ( AVAILABLE ?AUTO_8398 ) ( CHANNEL_FREE ?AUTO_8405 ) ( not ( = ?AUTO_8403 ?AUTO_8400 ) ) ( CAN_TRAVERSE ?AUTO_8398 ?AUTO_8399 ?AUTO_8403 ) ( VISIBLE ?AUTO_8399 ?AUTO_8403 ) ( not ( = ?AUTO_8400 ?AUTO_8399 ) ) ( not ( = ?AUTO_8403 ?AUTO_8399 ) ) ( CAN_TRAVERSE ?AUTO_8398 ?AUTO_8404 ?AUTO_8399 ) ( VISIBLE ?AUTO_8404 ?AUTO_8399 ) ( not ( = ?AUTO_8400 ?AUTO_8404 ) ) ( not ( = ?AUTO_8403 ?AUTO_8404 ) ) ( not ( = ?AUTO_8399 ?AUTO_8404 ) ) ( CAN_TRAVERSE ?AUTO_8398 ?AUTO_8401 ?AUTO_8404 ) ( AT ?AUTO_8398 ?AUTO_8401 ) ( VISIBLE ?AUTO_8401 ?AUTO_8404 ) ( not ( = ?AUTO_8400 ?AUTO_8401 ) ) ( not ( = ?AUTO_8403 ?AUTO_8401 ) ) ( not ( = ?AUTO_8399 ?AUTO_8401 ) ) ( not ( = ?AUTO_8404 ?AUTO_8401 ) ) ( ON_BOARD ?AUTO_8402 ?AUTO_8398 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8398 ) ( SUPPORTS ?AUTO_8402 ?AUTO_8397 ) ( VISIBLE_FROM ?AUTO_8396 ?AUTO_8401 ) ( CALIBRATION_TARGET ?AUTO_8402 ?AUTO_8396 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_8398 ?AUTO_8402 ?AUTO_8396 ?AUTO_8401 )
      ( GET_IMAGE_DATA ?AUTO_8396 ?AUTO_8397 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8396 ?AUTO_8397 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8406 - OBJECTIVE
      ?AUTO_8407 - MODE
    )
    :vars
    (
      ?AUTO_8410 - LANDER
      ?AUTO_8415 - WAYPOINT
      ?AUTO_8414 - WAYPOINT
      ?AUTO_8413 - ROVER
      ?AUTO_8408 - WAYPOINT
      ?AUTO_8409 - WAYPOINT
      ?AUTO_8411 - WAYPOINT
      ?AUTO_8412 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8410 ?AUTO_8415 ) ( VISIBLE ?AUTO_8414 ?AUTO_8415 ) ( AVAILABLE ?AUTO_8413 ) ( CHANNEL_FREE ?AUTO_8410 ) ( not ( = ?AUTO_8414 ?AUTO_8415 ) ) ( CAN_TRAVERSE ?AUTO_8413 ?AUTO_8408 ?AUTO_8414 ) ( VISIBLE ?AUTO_8408 ?AUTO_8414 ) ( not ( = ?AUTO_8415 ?AUTO_8408 ) ) ( not ( = ?AUTO_8414 ?AUTO_8408 ) ) ( CAN_TRAVERSE ?AUTO_8413 ?AUTO_8409 ?AUTO_8408 ) ( VISIBLE ?AUTO_8409 ?AUTO_8408 ) ( not ( = ?AUTO_8415 ?AUTO_8409 ) ) ( not ( = ?AUTO_8414 ?AUTO_8409 ) ) ( not ( = ?AUTO_8408 ?AUTO_8409 ) ) ( CAN_TRAVERSE ?AUTO_8413 ?AUTO_8411 ?AUTO_8409 ) ( VISIBLE ?AUTO_8411 ?AUTO_8409 ) ( not ( = ?AUTO_8415 ?AUTO_8411 ) ) ( not ( = ?AUTO_8414 ?AUTO_8411 ) ) ( not ( = ?AUTO_8408 ?AUTO_8411 ) ) ( not ( = ?AUTO_8409 ?AUTO_8411 ) ) ( ON_BOARD ?AUTO_8412 ?AUTO_8413 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8413 ) ( SUPPORTS ?AUTO_8412 ?AUTO_8407 ) ( VISIBLE_FROM ?AUTO_8406 ?AUTO_8411 ) ( CALIBRATION_TARGET ?AUTO_8412 ?AUTO_8406 ) ( CAN_TRAVERSE ?AUTO_8413 ?AUTO_8409 ?AUTO_8411 ) ( AT ?AUTO_8413 ?AUTO_8409 ) ( VISIBLE ?AUTO_8409 ?AUTO_8411 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8413 ?AUTO_8409 ?AUTO_8411 )
      ( GET_IMAGE_DATA ?AUTO_8406 ?AUTO_8407 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8406 ?AUTO_8407 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8416 - OBJECTIVE
      ?AUTO_8417 - MODE
    )
    :vars
    (
      ?AUTO_8425 - LANDER
      ?AUTO_8421 - WAYPOINT
      ?AUTO_8424 - WAYPOINT
      ?AUTO_8422 - ROVER
      ?AUTO_8423 - WAYPOINT
      ?AUTO_8420 - WAYPOINT
      ?AUTO_8419 - WAYPOINT
      ?AUTO_8418 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8425 ?AUTO_8421 ) ( VISIBLE ?AUTO_8424 ?AUTO_8421 ) ( AVAILABLE ?AUTO_8422 ) ( CHANNEL_FREE ?AUTO_8425 ) ( not ( = ?AUTO_8424 ?AUTO_8421 ) ) ( CAN_TRAVERSE ?AUTO_8422 ?AUTO_8423 ?AUTO_8424 ) ( VISIBLE ?AUTO_8423 ?AUTO_8424 ) ( not ( = ?AUTO_8421 ?AUTO_8423 ) ) ( not ( = ?AUTO_8424 ?AUTO_8423 ) ) ( CAN_TRAVERSE ?AUTO_8422 ?AUTO_8420 ?AUTO_8423 ) ( VISIBLE ?AUTO_8420 ?AUTO_8423 ) ( not ( = ?AUTO_8421 ?AUTO_8420 ) ) ( not ( = ?AUTO_8424 ?AUTO_8420 ) ) ( not ( = ?AUTO_8423 ?AUTO_8420 ) ) ( CAN_TRAVERSE ?AUTO_8422 ?AUTO_8419 ?AUTO_8420 ) ( VISIBLE ?AUTO_8419 ?AUTO_8420 ) ( not ( = ?AUTO_8421 ?AUTO_8419 ) ) ( not ( = ?AUTO_8424 ?AUTO_8419 ) ) ( not ( = ?AUTO_8423 ?AUTO_8419 ) ) ( not ( = ?AUTO_8420 ?AUTO_8419 ) ) ( ON_BOARD ?AUTO_8418 ?AUTO_8422 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8422 ) ( SUPPORTS ?AUTO_8418 ?AUTO_8417 ) ( VISIBLE_FROM ?AUTO_8416 ?AUTO_8419 ) ( CALIBRATION_TARGET ?AUTO_8418 ?AUTO_8416 ) ( CAN_TRAVERSE ?AUTO_8422 ?AUTO_8420 ?AUTO_8419 ) ( VISIBLE ?AUTO_8420 ?AUTO_8419 ) ( CAN_TRAVERSE ?AUTO_8422 ?AUTO_8424 ?AUTO_8420 ) ( AT ?AUTO_8422 ?AUTO_8424 ) ( VISIBLE ?AUTO_8424 ?AUTO_8420 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8422 ?AUTO_8424 ?AUTO_8420 )
      ( GET_IMAGE_DATA ?AUTO_8416 ?AUTO_8417 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8416 ?AUTO_8417 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8454 - OBJECTIVE
      ?AUTO_8455 - MODE
    )
    :vars
    (
      ?AUTO_8460 - LANDER
      ?AUTO_8457 - WAYPOINT
      ?AUTO_8463 - WAYPOINT
      ?AUTO_8461 - ROVER
      ?AUTO_8462 - WAYPOINT
      ?AUTO_8456 - WAYPOINT
      ?AUTO_8459 - WAYPOINT
      ?AUTO_8458 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8460 ?AUTO_8457 ) ( VISIBLE ?AUTO_8463 ?AUTO_8457 ) ( AVAILABLE ?AUTO_8461 ) ( CHANNEL_FREE ?AUTO_8460 ) ( not ( = ?AUTO_8463 ?AUTO_8457 ) ) ( CAN_TRAVERSE ?AUTO_8461 ?AUTO_8462 ?AUTO_8463 ) ( VISIBLE ?AUTO_8462 ?AUTO_8463 ) ( not ( = ?AUTO_8457 ?AUTO_8462 ) ) ( not ( = ?AUTO_8463 ?AUTO_8462 ) ) ( CAN_TRAVERSE ?AUTO_8461 ?AUTO_8456 ?AUTO_8462 ) ( VISIBLE ?AUTO_8456 ?AUTO_8462 ) ( not ( = ?AUTO_8457 ?AUTO_8456 ) ) ( not ( = ?AUTO_8463 ?AUTO_8456 ) ) ( not ( = ?AUTO_8462 ?AUTO_8456 ) ) ( CAN_TRAVERSE ?AUTO_8461 ?AUTO_8459 ?AUTO_8456 ) ( VISIBLE ?AUTO_8459 ?AUTO_8456 ) ( not ( = ?AUTO_8457 ?AUTO_8459 ) ) ( not ( = ?AUTO_8463 ?AUTO_8459 ) ) ( not ( = ?AUTO_8462 ?AUTO_8459 ) ) ( not ( = ?AUTO_8456 ?AUTO_8459 ) ) ( ON_BOARD ?AUTO_8458 ?AUTO_8461 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8461 ) ( SUPPORTS ?AUTO_8458 ?AUTO_8455 ) ( VISIBLE_FROM ?AUTO_8454 ?AUTO_8459 ) ( CALIBRATION_TARGET ?AUTO_8458 ?AUTO_8454 ) ( CAN_TRAVERSE ?AUTO_8461 ?AUTO_8456 ?AUTO_8459 ) ( VISIBLE ?AUTO_8456 ?AUTO_8459 ) ( CAN_TRAVERSE ?AUTO_8461 ?AUTO_8463 ?AUTO_8456 ) ( VISIBLE ?AUTO_8463 ?AUTO_8456 ) ( AT ?AUTO_8461 ?AUTO_8462 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8461 ?AUTO_8462 ?AUTO_8463 )
      ( GET_IMAGE_DATA ?AUTO_8454 ?AUTO_8455 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8454 ?AUTO_8455 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8599 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8602 - LANDER
      ?AUTO_8601 - WAYPOINT
      ?AUTO_8600 - ROVER
      ?AUTO_8603 - STORE
      ?AUTO_8604 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8602 ?AUTO_8599 ) ( VISIBLE ?AUTO_8601 ?AUTO_8599 ) ( AVAILABLE ?AUTO_8600 ) ( CHANNEL_FREE ?AUTO_8602 ) ( not ( = ?AUTO_8599 ?AUTO_8601 ) ) ( CAN_TRAVERSE ?AUTO_8600 ?AUTO_8599 ?AUTO_8601 ) ( VISIBLE ?AUTO_8599 ?AUTO_8601 ) ( AT_ROCK_SAMPLE ?AUTO_8599 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8600 ) ( STORE_OF ?AUTO_8603 ?AUTO_8600 ) ( CAN_TRAVERSE ?AUTO_8600 ?AUTO_8604 ?AUTO_8599 ) ( AT ?AUTO_8600 ?AUTO_8604 ) ( VISIBLE ?AUTO_8604 ?AUTO_8599 ) ( not ( = ?AUTO_8599 ?AUTO_8604 ) ) ( not ( = ?AUTO_8601 ?AUTO_8604 ) ) ( AT_SOIL_SAMPLE ?AUTO_8604 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8600 ) ( EMPTY ?AUTO_8603 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_8600 ?AUTO_8603 ?AUTO_8604 )
      ( GET_ROCK_DATA ?AUTO_8599 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8599 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8672 - OBJECTIVE
      ?AUTO_8673 - MODE
    )
    :vars
    (
      ?AUTO_8674 - LANDER
      ?AUTO_8676 - WAYPOINT
      ?AUTO_8678 - WAYPOINT
      ?AUTO_8677 - ROVER
      ?AUTO_8679 - CAMERA
      ?AUTO_8675 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8674 ?AUTO_8676 ) ( VISIBLE ?AUTO_8678 ?AUTO_8676 ) ( AVAILABLE ?AUTO_8677 ) ( CHANNEL_FREE ?AUTO_8674 ) ( not ( = ?AUTO_8678 ?AUTO_8676 ) ) ( CALIBRATED ?AUTO_8679 ?AUTO_8677 ) ( ON_BOARD ?AUTO_8679 ?AUTO_8677 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8677 ) ( SUPPORTS ?AUTO_8679 ?AUTO_8673 ) ( VISIBLE_FROM ?AUTO_8672 ?AUTO_8678 ) ( CAN_TRAVERSE ?AUTO_8677 ?AUTO_8675 ?AUTO_8678 ) ( VISIBLE ?AUTO_8675 ?AUTO_8678 ) ( not ( = ?AUTO_8676 ?AUTO_8675 ) ) ( not ( = ?AUTO_8678 ?AUTO_8675 ) ) ( CAN_TRAVERSE ?AUTO_8677 ?AUTO_8676 ?AUTO_8675 ) ( AT ?AUTO_8677 ?AUTO_8676 ) ( VISIBLE ?AUTO_8676 ?AUTO_8675 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8677 ?AUTO_8676 ?AUTO_8675 )
      ( GET_IMAGE_DATA ?AUTO_8672 ?AUTO_8673 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8672 ?AUTO_8673 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8680 - OBJECTIVE
      ?AUTO_8681 - MODE
    )
    :vars
    (
      ?AUTO_8686 - LANDER
      ?AUTO_8687 - WAYPOINT
      ?AUTO_8684 - WAYPOINT
      ?AUTO_8683 - ROVER
      ?AUTO_8682 - CAMERA
      ?AUTO_8685 - WAYPOINT
      ?AUTO_8688 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8686 ?AUTO_8687 ) ( VISIBLE ?AUTO_8684 ?AUTO_8687 ) ( AVAILABLE ?AUTO_8683 ) ( CHANNEL_FREE ?AUTO_8686 ) ( not ( = ?AUTO_8684 ?AUTO_8687 ) ) ( CALIBRATED ?AUTO_8682 ?AUTO_8683 ) ( ON_BOARD ?AUTO_8682 ?AUTO_8683 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8683 ) ( SUPPORTS ?AUTO_8682 ?AUTO_8681 ) ( VISIBLE_FROM ?AUTO_8680 ?AUTO_8684 ) ( CAN_TRAVERSE ?AUTO_8683 ?AUTO_8685 ?AUTO_8684 ) ( VISIBLE ?AUTO_8685 ?AUTO_8684 ) ( not ( = ?AUTO_8687 ?AUTO_8685 ) ) ( not ( = ?AUTO_8684 ?AUTO_8685 ) ) ( CAN_TRAVERSE ?AUTO_8683 ?AUTO_8687 ?AUTO_8685 ) ( VISIBLE ?AUTO_8687 ?AUTO_8685 ) ( CAN_TRAVERSE ?AUTO_8683 ?AUTO_8688 ?AUTO_8687 ) ( AT ?AUTO_8683 ?AUTO_8688 ) ( VISIBLE ?AUTO_8688 ?AUTO_8687 ) ( not ( = ?AUTO_8687 ?AUTO_8688 ) ) ( not ( = ?AUTO_8684 ?AUTO_8688 ) ) ( not ( = ?AUTO_8685 ?AUTO_8688 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8683 ?AUTO_8688 ?AUTO_8687 )
      ( GET_IMAGE_DATA ?AUTO_8680 ?AUTO_8681 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8680 ?AUTO_8681 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8689 - OBJECTIVE
      ?AUTO_8690 - MODE
    )
    :vars
    (
      ?AUTO_8691 - LANDER
      ?AUTO_8693 - WAYPOINT
      ?AUTO_8695 - WAYPOINT
      ?AUTO_8696 - ROVER
      ?AUTO_8694 - CAMERA
      ?AUTO_8692 - WAYPOINT
      ?AUTO_8697 - WAYPOINT
      ?AUTO_8698 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8691 ?AUTO_8693 ) ( VISIBLE ?AUTO_8695 ?AUTO_8693 ) ( AVAILABLE ?AUTO_8696 ) ( CHANNEL_FREE ?AUTO_8691 ) ( not ( = ?AUTO_8695 ?AUTO_8693 ) ) ( ON_BOARD ?AUTO_8694 ?AUTO_8696 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8696 ) ( SUPPORTS ?AUTO_8694 ?AUTO_8690 ) ( VISIBLE_FROM ?AUTO_8689 ?AUTO_8695 ) ( CAN_TRAVERSE ?AUTO_8696 ?AUTO_8692 ?AUTO_8695 ) ( VISIBLE ?AUTO_8692 ?AUTO_8695 ) ( not ( = ?AUTO_8693 ?AUTO_8692 ) ) ( not ( = ?AUTO_8695 ?AUTO_8692 ) ) ( CAN_TRAVERSE ?AUTO_8696 ?AUTO_8693 ?AUTO_8692 ) ( VISIBLE ?AUTO_8693 ?AUTO_8692 ) ( CAN_TRAVERSE ?AUTO_8696 ?AUTO_8697 ?AUTO_8693 ) ( AT ?AUTO_8696 ?AUTO_8697 ) ( VISIBLE ?AUTO_8697 ?AUTO_8693 ) ( not ( = ?AUTO_8693 ?AUTO_8697 ) ) ( not ( = ?AUTO_8695 ?AUTO_8697 ) ) ( not ( = ?AUTO_8692 ?AUTO_8697 ) ) ( CALIBRATION_TARGET ?AUTO_8694 ?AUTO_8698 ) ( VISIBLE_FROM ?AUTO_8698 ?AUTO_8697 ) ( not ( = ?AUTO_8689 ?AUTO_8698 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_8696 ?AUTO_8694 ?AUTO_8698 ?AUTO_8697 )
      ( GET_IMAGE_DATA ?AUTO_8689 ?AUTO_8690 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8689 ?AUTO_8690 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8699 - OBJECTIVE
      ?AUTO_8700 - MODE
    )
    :vars
    (
      ?AUTO_8702 - LANDER
      ?AUTO_8706 - WAYPOINT
      ?AUTO_8701 - WAYPOINT
      ?AUTO_8707 - ROVER
      ?AUTO_8703 - CAMERA
      ?AUTO_8705 - WAYPOINT
      ?AUTO_8704 - WAYPOINT
      ?AUTO_8708 - OBJECTIVE
      ?AUTO_8709 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8702 ?AUTO_8706 ) ( VISIBLE ?AUTO_8701 ?AUTO_8706 ) ( AVAILABLE ?AUTO_8707 ) ( CHANNEL_FREE ?AUTO_8702 ) ( not ( = ?AUTO_8701 ?AUTO_8706 ) ) ( ON_BOARD ?AUTO_8703 ?AUTO_8707 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8707 ) ( SUPPORTS ?AUTO_8703 ?AUTO_8700 ) ( VISIBLE_FROM ?AUTO_8699 ?AUTO_8701 ) ( CAN_TRAVERSE ?AUTO_8707 ?AUTO_8705 ?AUTO_8701 ) ( VISIBLE ?AUTO_8705 ?AUTO_8701 ) ( not ( = ?AUTO_8706 ?AUTO_8705 ) ) ( not ( = ?AUTO_8701 ?AUTO_8705 ) ) ( CAN_TRAVERSE ?AUTO_8707 ?AUTO_8706 ?AUTO_8705 ) ( VISIBLE ?AUTO_8706 ?AUTO_8705 ) ( CAN_TRAVERSE ?AUTO_8707 ?AUTO_8704 ?AUTO_8706 ) ( VISIBLE ?AUTO_8704 ?AUTO_8706 ) ( not ( = ?AUTO_8706 ?AUTO_8704 ) ) ( not ( = ?AUTO_8701 ?AUTO_8704 ) ) ( not ( = ?AUTO_8705 ?AUTO_8704 ) ) ( CALIBRATION_TARGET ?AUTO_8703 ?AUTO_8708 ) ( VISIBLE_FROM ?AUTO_8708 ?AUTO_8704 ) ( not ( = ?AUTO_8699 ?AUTO_8708 ) ) ( CAN_TRAVERSE ?AUTO_8707 ?AUTO_8709 ?AUTO_8704 ) ( AT ?AUTO_8707 ?AUTO_8709 ) ( VISIBLE ?AUTO_8709 ?AUTO_8704 ) ( not ( = ?AUTO_8706 ?AUTO_8709 ) ) ( not ( = ?AUTO_8701 ?AUTO_8709 ) ) ( not ( = ?AUTO_8705 ?AUTO_8709 ) ) ( not ( = ?AUTO_8704 ?AUTO_8709 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8707 ?AUTO_8709 ?AUTO_8704 )
      ( GET_IMAGE_DATA ?AUTO_8699 ?AUTO_8700 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8699 ?AUTO_8700 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8750 - OBJECTIVE
      ?AUTO_8751 - MODE
    )
    :vars
    (
      ?AUTO_8754 - LANDER
      ?AUTO_8753 - WAYPOINT
      ?AUTO_8757 - WAYPOINT
      ?AUTO_8759 - ROVER
      ?AUTO_8756 - CAMERA
      ?AUTO_8752 - WAYPOINT
      ?AUTO_8758 - WAYPOINT
      ?AUTO_8755 - OBJECTIVE
      ?AUTO_8760 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8754 ?AUTO_8753 ) ( VISIBLE ?AUTO_8757 ?AUTO_8753 ) ( AVAILABLE ?AUTO_8759 ) ( CHANNEL_FREE ?AUTO_8754 ) ( not ( = ?AUTO_8757 ?AUTO_8753 ) ) ( ON_BOARD ?AUTO_8756 ?AUTO_8759 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8759 ) ( SUPPORTS ?AUTO_8756 ?AUTO_8751 ) ( VISIBLE_FROM ?AUTO_8750 ?AUTO_8757 ) ( CAN_TRAVERSE ?AUTO_8759 ?AUTO_8752 ?AUTO_8757 ) ( VISIBLE ?AUTO_8752 ?AUTO_8757 ) ( not ( = ?AUTO_8753 ?AUTO_8752 ) ) ( not ( = ?AUTO_8757 ?AUTO_8752 ) ) ( CAN_TRAVERSE ?AUTO_8759 ?AUTO_8753 ?AUTO_8752 ) ( VISIBLE ?AUTO_8753 ?AUTO_8752 ) ( CAN_TRAVERSE ?AUTO_8759 ?AUTO_8758 ?AUTO_8753 ) ( VISIBLE ?AUTO_8758 ?AUTO_8753 ) ( not ( = ?AUTO_8753 ?AUTO_8758 ) ) ( not ( = ?AUTO_8757 ?AUTO_8758 ) ) ( not ( = ?AUTO_8752 ?AUTO_8758 ) ) ( CALIBRATION_TARGET ?AUTO_8756 ?AUTO_8755 ) ( VISIBLE_FROM ?AUTO_8755 ?AUTO_8758 ) ( not ( = ?AUTO_8750 ?AUTO_8755 ) ) ( CAN_TRAVERSE ?AUTO_8759 ?AUTO_8760 ?AUTO_8758 ) ( VISIBLE ?AUTO_8760 ?AUTO_8758 ) ( not ( = ?AUTO_8753 ?AUTO_8760 ) ) ( not ( = ?AUTO_8757 ?AUTO_8760 ) ) ( not ( = ?AUTO_8752 ?AUTO_8760 ) ) ( not ( = ?AUTO_8758 ?AUTO_8760 ) ) ( CAN_TRAVERSE ?AUTO_8759 ?AUTO_8752 ?AUTO_8760 ) ( AT ?AUTO_8759 ?AUTO_8752 ) ( VISIBLE ?AUTO_8752 ?AUTO_8760 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8759 ?AUTO_8752 ?AUTO_8760 )
      ( GET_IMAGE_DATA ?AUTO_8750 ?AUTO_8751 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8750 ?AUTO_8751 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8793 - OBJECTIVE
      ?AUTO_8794 - MODE
    )
    :vars
    (
      ?AUTO_8796 - LANDER
      ?AUTO_8799 - WAYPOINT
      ?AUTO_8800 - WAYPOINT
      ?AUTO_8795 - ROVER
      ?AUTO_8801 - CAMERA
      ?AUTO_8797 - OBJECTIVE
      ?AUTO_8798 - WAYPOINT
      ?AUTO_8802 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8796 ?AUTO_8799 ) ( VISIBLE ?AUTO_8800 ?AUTO_8799 ) ( AVAILABLE ?AUTO_8795 ) ( CHANNEL_FREE ?AUTO_8796 ) ( not ( = ?AUTO_8800 ?AUTO_8799 ) ) ( ON_BOARD ?AUTO_8801 ?AUTO_8795 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8795 ) ( SUPPORTS ?AUTO_8801 ?AUTO_8794 ) ( VISIBLE_FROM ?AUTO_8793 ?AUTO_8800 ) ( CALIBRATION_TARGET ?AUTO_8801 ?AUTO_8797 ) ( VISIBLE_FROM ?AUTO_8797 ?AUTO_8800 ) ( not ( = ?AUTO_8793 ?AUTO_8797 ) ) ( CAN_TRAVERSE ?AUTO_8795 ?AUTO_8798 ?AUTO_8800 ) ( VISIBLE ?AUTO_8798 ?AUTO_8800 ) ( not ( = ?AUTO_8799 ?AUTO_8798 ) ) ( not ( = ?AUTO_8800 ?AUTO_8798 ) ) ( CAN_TRAVERSE ?AUTO_8795 ?AUTO_8802 ?AUTO_8798 ) ( AT ?AUTO_8795 ?AUTO_8802 ) ( VISIBLE ?AUTO_8802 ?AUTO_8798 ) ( not ( = ?AUTO_8799 ?AUTO_8802 ) ) ( not ( = ?AUTO_8800 ?AUTO_8802 ) ) ( not ( = ?AUTO_8798 ?AUTO_8802 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8795 ?AUTO_8802 ?AUTO_8798 )
      ( GET_IMAGE_DATA ?AUTO_8793 ?AUTO_8794 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8793 ?AUTO_8794 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8803 - OBJECTIVE
      ?AUTO_8804 - MODE
    )
    :vars
    (
      ?AUTO_8806 - LANDER
      ?AUTO_8812 - WAYPOINT
      ?AUTO_8810 - WAYPOINT
      ?AUTO_8809 - ROVER
      ?AUTO_8805 - CAMERA
      ?AUTO_8807 - OBJECTIVE
      ?AUTO_8808 - WAYPOINT
      ?AUTO_8811 - WAYPOINT
      ?AUTO_8813 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8806 ?AUTO_8812 ) ( VISIBLE ?AUTO_8810 ?AUTO_8812 ) ( AVAILABLE ?AUTO_8809 ) ( CHANNEL_FREE ?AUTO_8806 ) ( not ( = ?AUTO_8810 ?AUTO_8812 ) ) ( ON_BOARD ?AUTO_8805 ?AUTO_8809 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8809 ) ( SUPPORTS ?AUTO_8805 ?AUTO_8804 ) ( VISIBLE_FROM ?AUTO_8803 ?AUTO_8810 ) ( CALIBRATION_TARGET ?AUTO_8805 ?AUTO_8807 ) ( VISIBLE_FROM ?AUTO_8807 ?AUTO_8810 ) ( not ( = ?AUTO_8803 ?AUTO_8807 ) ) ( CAN_TRAVERSE ?AUTO_8809 ?AUTO_8808 ?AUTO_8810 ) ( VISIBLE ?AUTO_8808 ?AUTO_8810 ) ( not ( = ?AUTO_8812 ?AUTO_8808 ) ) ( not ( = ?AUTO_8810 ?AUTO_8808 ) ) ( CAN_TRAVERSE ?AUTO_8809 ?AUTO_8811 ?AUTO_8808 ) ( VISIBLE ?AUTO_8811 ?AUTO_8808 ) ( not ( = ?AUTO_8812 ?AUTO_8811 ) ) ( not ( = ?AUTO_8810 ?AUTO_8811 ) ) ( not ( = ?AUTO_8808 ?AUTO_8811 ) ) ( CAN_TRAVERSE ?AUTO_8809 ?AUTO_8813 ?AUTO_8811 ) ( AT ?AUTO_8809 ?AUTO_8813 ) ( VISIBLE ?AUTO_8813 ?AUTO_8811 ) ( not ( = ?AUTO_8812 ?AUTO_8813 ) ) ( not ( = ?AUTO_8810 ?AUTO_8813 ) ) ( not ( = ?AUTO_8808 ?AUTO_8813 ) ) ( not ( = ?AUTO_8811 ?AUTO_8813 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8809 ?AUTO_8813 ?AUTO_8811 )
      ( GET_IMAGE_DATA ?AUTO_8803 ?AUTO_8804 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8803 ?AUTO_8804 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9027 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9029 - LANDER
      ?AUTO_9028 - WAYPOINT
      ?AUTO_9032 - ROVER
      ?AUTO_9031 - STORE
      ?AUTO_9030 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9029 ?AUTO_9027 ) ( VISIBLE ?AUTO_9028 ?AUTO_9027 ) ( AVAILABLE ?AUTO_9032 ) ( CHANNEL_FREE ?AUTO_9029 ) ( not ( = ?AUTO_9027 ?AUTO_9028 ) ) ( CAN_TRAVERSE ?AUTO_9032 ?AUTO_9027 ?AUTO_9028 ) ( VISIBLE ?AUTO_9027 ?AUTO_9028 ) ( AT_SOIL_SAMPLE ?AUTO_9027 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9032 ) ( STORE_OF ?AUTO_9031 ?AUTO_9032 ) ( CAN_TRAVERSE ?AUTO_9032 ?AUTO_9030 ?AUTO_9027 ) ( AT ?AUTO_9032 ?AUTO_9030 ) ( VISIBLE ?AUTO_9030 ?AUTO_9027 ) ( not ( = ?AUTO_9027 ?AUTO_9030 ) ) ( not ( = ?AUTO_9028 ?AUTO_9030 ) ) ( AT_SOIL_SAMPLE ?AUTO_9030 ) ( EMPTY ?AUTO_9031 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_9032 ?AUTO_9031 ?AUTO_9030 )
      ( GET_SOIL_DATA ?AUTO_9027 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9027 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9085 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9089 - LANDER
      ?AUTO_9090 - WAYPOINT
      ?AUTO_9087 - ROVER
      ?AUTO_9088 - STORE
      ?AUTO_9086 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9089 ?AUTO_9090 ) ( VISIBLE ?AUTO_9085 ?AUTO_9090 ) ( AVAILABLE ?AUTO_9087 ) ( CHANNEL_FREE ?AUTO_9089 ) ( not ( = ?AUTO_9085 ?AUTO_9090 ) ) ( AT_SOIL_SAMPLE ?AUTO_9085 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9087 ) ( STORE_OF ?AUTO_9088 ?AUTO_9087 ) ( CAN_TRAVERSE ?AUTO_9087 ?AUTO_9090 ?AUTO_9085 ) ( VISIBLE ?AUTO_9090 ?AUTO_9085 ) ( CAN_TRAVERSE ?AUTO_9087 ?AUTO_9086 ?AUTO_9090 ) ( AT ?AUTO_9087 ?AUTO_9086 ) ( VISIBLE ?AUTO_9086 ?AUTO_9090 ) ( not ( = ?AUTO_9085 ?AUTO_9086 ) ) ( not ( = ?AUTO_9090 ?AUTO_9086 ) ) ( AT_SOIL_SAMPLE ?AUTO_9086 ) ( EMPTY ?AUTO_9088 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_9087 ?AUTO_9088 ?AUTO_9086 )
      ( GET_SOIL_DATA ?AUTO_9085 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9085 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9137 - OBJECTIVE
      ?AUTO_9138 - MODE
    )
    :vars
    (
      ?AUTO_9144 - LANDER
      ?AUTO_9140 - WAYPOINT
      ?AUTO_9143 - WAYPOINT
      ?AUTO_9139 - ROVER
      ?AUTO_9141 - CAMERA
      ?AUTO_9145 - WAYPOINT
      ?AUTO_9142 - WAYPOINT
      ?AUTO_9146 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9144 ?AUTO_9140 ) ( VISIBLE ?AUTO_9143 ?AUTO_9140 ) ( AVAILABLE ?AUTO_9139 ) ( CHANNEL_FREE ?AUTO_9144 ) ( not ( = ?AUTO_9143 ?AUTO_9140 ) ) ( CAN_TRAVERSE ?AUTO_9139 ?AUTO_9140 ?AUTO_9143 ) ( VISIBLE ?AUTO_9140 ?AUTO_9143 ) ( CALIBRATED ?AUTO_9141 ?AUTO_9139 ) ( ON_BOARD ?AUTO_9141 ?AUTO_9139 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9139 ) ( SUPPORTS ?AUTO_9141 ?AUTO_9138 ) ( VISIBLE_FROM ?AUTO_9137 ?AUTO_9140 ) ( CAN_TRAVERSE ?AUTO_9139 ?AUTO_9145 ?AUTO_9140 ) ( VISIBLE ?AUTO_9145 ?AUTO_9140 ) ( not ( = ?AUTO_9140 ?AUTO_9145 ) ) ( not ( = ?AUTO_9143 ?AUTO_9145 ) ) ( CAN_TRAVERSE ?AUTO_9139 ?AUTO_9142 ?AUTO_9145 ) ( VISIBLE ?AUTO_9142 ?AUTO_9145 ) ( not ( = ?AUTO_9140 ?AUTO_9142 ) ) ( not ( = ?AUTO_9143 ?AUTO_9142 ) ) ( not ( = ?AUTO_9145 ?AUTO_9142 ) ) ( CAN_TRAVERSE ?AUTO_9139 ?AUTO_9146 ?AUTO_9142 ) ( AT ?AUTO_9139 ?AUTO_9146 ) ( VISIBLE ?AUTO_9146 ?AUTO_9142 ) ( not ( = ?AUTO_9140 ?AUTO_9146 ) ) ( not ( = ?AUTO_9143 ?AUTO_9146 ) ) ( not ( = ?AUTO_9145 ?AUTO_9146 ) ) ( not ( = ?AUTO_9142 ?AUTO_9146 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9139 ?AUTO_9146 ?AUTO_9142 )
      ( GET_IMAGE_DATA ?AUTO_9137 ?AUTO_9138 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9137 ?AUTO_9138 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9147 - OBJECTIVE
      ?AUTO_9148 - MODE
    )
    :vars
    (
      ?AUTO_9152 - LANDER
      ?AUTO_9149 - WAYPOINT
      ?AUTO_9150 - WAYPOINT
      ?AUTO_9154 - ROVER
      ?AUTO_9151 - CAMERA
      ?AUTO_9153 - WAYPOINT
      ?AUTO_9156 - WAYPOINT
      ?AUTO_9155 - WAYPOINT
      ?AUTO_9157 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9152 ?AUTO_9149 ) ( VISIBLE ?AUTO_9150 ?AUTO_9149 ) ( AVAILABLE ?AUTO_9154 ) ( CHANNEL_FREE ?AUTO_9152 ) ( not ( = ?AUTO_9150 ?AUTO_9149 ) ) ( CAN_TRAVERSE ?AUTO_9154 ?AUTO_9149 ?AUTO_9150 ) ( VISIBLE ?AUTO_9149 ?AUTO_9150 ) ( CALIBRATED ?AUTO_9151 ?AUTO_9154 ) ( ON_BOARD ?AUTO_9151 ?AUTO_9154 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9154 ) ( SUPPORTS ?AUTO_9151 ?AUTO_9148 ) ( VISIBLE_FROM ?AUTO_9147 ?AUTO_9149 ) ( CAN_TRAVERSE ?AUTO_9154 ?AUTO_9153 ?AUTO_9149 ) ( VISIBLE ?AUTO_9153 ?AUTO_9149 ) ( not ( = ?AUTO_9149 ?AUTO_9153 ) ) ( not ( = ?AUTO_9150 ?AUTO_9153 ) ) ( CAN_TRAVERSE ?AUTO_9154 ?AUTO_9156 ?AUTO_9153 ) ( VISIBLE ?AUTO_9156 ?AUTO_9153 ) ( not ( = ?AUTO_9149 ?AUTO_9156 ) ) ( not ( = ?AUTO_9150 ?AUTO_9156 ) ) ( not ( = ?AUTO_9153 ?AUTO_9156 ) ) ( CAN_TRAVERSE ?AUTO_9154 ?AUTO_9155 ?AUTO_9156 ) ( VISIBLE ?AUTO_9155 ?AUTO_9156 ) ( not ( = ?AUTO_9149 ?AUTO_9155 ) ) ( not ( = ?AUTO_9150 ?AUTO_9155 ) ) ( not ( = ?AUTO_9153 ?AUTO_9155 ) ) ( not ( = ?AUTO_9156 ?AUTO_9155 ) ) ( CAN_TRAVERSE ?AUTO_9154 ?AUTO_9157 ?AUTO_9155 ) ( AT ?AUTO_9154 ?AUTO_9157 ) ( VISIBLE ?AUTO_9157 ?AUTO_9155 ) ( not ( = ?AUTO_9149 ?AUTO_9157 ) ) ( not ( = ?AUTO_9150 ?AUTO_9157 ) ) ( not ( = ?AUTO_9153 ?AUTO_9157 ) ) ( not ( = ?AUTO_9156 ?AUTO_9157 ) ) ( not ( = ?AUTO_9155 ?AUTO_9157 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9154 ?AUTO_9157 ?AUTO_9155 )
      ( GET_IMAGE_DATA ?AUTO_9147 ?AUTO_9148 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9147 ?AUTO_9148 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9198 - OBJECTIVE
      ?AUTO_9199 - MODE
    )
    :vars
    (
      ?AUTO_9205 - LANDER
      ?AUTO_9201 - WAYPOINT
      ?AUTO_9202 - WAYPOINT
      ?AUTO_9200 - ROVER
      ?AUTO_9203 - CAMERA
      ?AUTO_9204 - WAYPOINT
      ?AUTO_9206 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9205 ?AUTO_9201 ) ( VISIBLE ?AUTO_9202 ?AUTO_9201 ) ( AVAILABLE ?AUTO_9200 ) ( CHANNEL_FREE ?AUTO_9205 ) ( not ( = ?AUTO_9202 ?AUTO_9201 ) ) ( CAN_TRAVERSE ?AUTO_9200 ?AUTO_9201 ?AUTO_9202 ) ( VISIBLE ?AUTO_9201 ?AUTO_9202 ) ( ON_BOARD ?AUTO_9203 ?AUTO_9200 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9200 ) ( SUPPORTS ?AUTO_9203 ?AUTO_9199 ) ( VISIBLE_FROM ?AUTO_9198 ?AUTO_9201 ) ( CAN_TRAVERSE ?AUTO_9200 ?AUTO_9204 ?AUTO_9201 ) ( AT ?AUTO_9200 ?AUTO_9204 ) ( VISIBLE ?AUTO_9204 ?AUTO_9201 ) ( not ( = ?AUTO_9201 ?AUTO_9204 ) ) ( not ( = ?AUTO_9202 ?AUTO_9204 ) ) ( CALIBRATION_TARGET ?AUTO_9203 ?AUTO_9206 ) ( VISIBLE_FROM ?AUTO_9206 ?AUTO_9204 ) ( not ( = ?AUTO_9198 ?AUTO_9206 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_9200 ?AUTO_9203 ?AUTO_9206 ?AUTO_9204 )
      ( GET_IMAGE_DATA ?AUTO_9198 ?AUTO_9199 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9198 ?AUTO_9199 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9209 - OBJECTIVE
      ?AUTO_9210 - MODE
    )
    :vars
    (
      ?AUTO_9211 - LANDER
      ?AUTO_9213 - WAYPOINT
      ?AUTO_9217 - WAYPOINT
      ?AUTO_9215 - ROVER
      ?AUTO_9214 - CAMERA
      ?AUTO_9216 - WAYPOINT
      ?AUTO_9212 - OBJECTIVE
      ?AUTO_9218 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9211 ?AUTO_9213 ) ( VISIBLE ?AUTO_9217 ?AUTO_9213 ) ( AVAILABLE ?AUTO_9215 ) ( CHANNEL_FREE ?AUTO_9211 ) ( not ( = ?AUTO_9217 ?AUTO_9213 ) ) ( CAN_TRAVERSE ?AUTO_9215 ?AUTO_9213 ?AUTO_9217 ) ( VISIBLE ?AUTO_9213 ?AUTO_9217 ) ( ON_BOARD ?AUTO_9214 ?AUTO_9215 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9215 ) ( SUPPORTS ?AUTO_9214 ?AUTO_9210 ) ( VISIBLE_FROM ?AUTO_9209 ?AUTO_9213 ) ( CAN_TRAVERSE ?AUTO_9215 ?AUTO_9216 ?AUTO_9213 ) ( VISIBLE ?AUTO_9216 ?AUTO_9213 ) ( not ( = ?AUTO_9213 ?AUTO_9216 ) ) ( not ( = ?AUTO_9217 ?AUTO_9216 ) ) ( CALIBRATION_TARGET ?AUTO_9214 ?AUTO_9212 ) ( VISIBLE_FROM ?AUTO_9212 ?AUTO_9216 ) ( not ( = ?AUTO_9209 ?AUTO_9212 ) ) ( CAN_TRAVERSE ?AUTO_9215 ?AUTO_9218 ?AUTO_9216 ) ( AT ?AUTO_9215 ?AUTO_9218 ) ( VISIBLE ?AUTO_9218 ?AUTO_9216 ) ( not ( = ?AUTO_9213 ?AUTO_9218 ) ) ( not ( = ?AUTO_9217 ?AUTO_9218 ) ) ( not ( = ?AUTO_9216 ?AUTO_9218 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9215 ?AUTO_9218 ?AUTO_9216 )
      ( GET_IMAGE_DATA ?AUTO_9209 ?AUTO_9210 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9209 ?AUTO_9210 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9219 - OBJECTIVE
      ?AUTO_9220 - MODE
    )
    :vars
    (
      ?AUTO_9226 - LANDER
      ?AUTO_9224 - WAYPOINT
      ?AUTO_9227 - WAYPOINT
      ?AUTO_9222 - ROVER
      ?AUTO_9221 - CAMERA
      ?AUTO_9225 - WAYPOINT
      ?AUTO_9228 - OBJECTIVE
      ?AUTO_9223 - WAYPOINT
      ?AUTO_9229 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9226 ?AUTO_9224 ) ( VISIBLE ?AUTO_9227 ?AUTO_9224 ) ( AVAILABLE ?AUTO_9222 ) ( CHANNEL_FREE ?AUTO_9226 ) ( not ( = ?AUTO_9227 ?AUTO_9224 ) ) ( CAN_TRAVERSE ?AUTO_9222 ?AUTO_9224 ?AUTO_9227 ) ( VISIBLE ?AUTO_9224 ?AUTO_9227 ) ( ON_BOARD ?AUTO_9221 ?AUTO_9222 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9222 ) ( SUPPORTS ?AUTO_9221 ?AUTO_9220 ) ( VISIBLE_FROM ?AUTO_9219 ?AUTO_9224 ) ( CAN_TRAVERSE ?AUTO_9222 ?AUTO_9225 ?AUTO_9224 ) ( VISIBLE ?AUTO_9225 ?AUTO_9224 ) ( not ( = ?AUTO_9224 ?AUTO_9225 ) ) ( not ( = ?AUTO_9227 ?AUTO_9225 ) ) ( CALIBRATION_TARGET ?AUTO_9221 ?AUTO_9228 ) ( VISIBLE_FROM ?AUTO_9228 ?AUTO_9225 ) ( not ( = ?AUTO_9219 ?AUTO_9228 ) ) ( CAN_TRAVERSE ?AUTO_9222 ?AUTO_9223 ?AUTO_9225 ) ( VISIBLE ?AUTO_9223 ?AUTO_9225 ) ( not ( = ?AUTO_9224 ?AUTO_9223 ) ) ( not ( = ?AUTO_9227 ?AUTO_9223 ) ) ( not ( = ?AUTO_9225 ?AUTO_9223 ) ) ( CAN_TRAVERSE ?AUTO_9222 ?AUTO_9229 ?AUTO_9223 ) ( AT ?AUTO_9222 ?AUTO_9229 ) ( VISIBLE ?AUTO_9229 ?AUTO_9223 ) ( not ( = ?AUTO_9224 ?AUTO_9229 ) ) ( not ( = ?AUTO_9227 ?AUTO_9229 ) ) ( not ( = ?AUTO_9225 ?AUTO_9229 ) ) ( not ( = ?AUTO_9223 ?AUTO_9229 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9222 ?AUTO_9229 ?AUTO_9223 )
      ( GET_IMAGE_DATA ?AUTO_9219 ?AUTO_9220 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9219 ?AUTO_9220 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9232 - OBJECTIVE
      ?AUTO_9233 - MODE
    )
    :vars
    (
      ?AUTO_9240 - LANDER
      ?AUTO_9237 - WAYPOINT
      ?AUTO_9239 - WAYPOINT
      ?AUTO_9234 - ROVER
      ?AUTO_9242 - CAMERA
      ?AUTO_9238 - WAYPOINT
      ?AUTO_9241 - OBJECTIVE
      ?AUTO_9235 - WAYPOINT
      ?AUTO_9236 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9240 ?AUTO_9237 ) ( VISIBLE ?AUTO_9239 ?AUTO_9237 ) ( AVAILABLE ?AUTO_9234 ) ( CHANNEL_FREE ?AUTO_9240 ) ( not ( = ?AUTO_9239 ?AUTO_9237 ) ) ( CAN_TRAVERSE ?AUTO_9234 ?AUTO_9237 ?AUTO_9239 ) ( VISIBLE ?AUTO_9237 ?AUTO_9239 ) ( ON_BOARD ?AUTO_9242 ?AUTO_9234 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9234 ) ( SUPPORTS ?AUTO_9242 ?AUTO_9233 ) ( VISIBLE_FROM ?AUTO_9232 ?AUTO_9237 ) ( CAN_TRAVERSE ?AUTO_9234 ?AUTO_9238 ?AUTO_9237 ) ( VISIBLE ?AUTO_9238 ?AUTO_9237 ) ( not ( = ?AUTO_9237 ?AUTO_9238 ) ) ( not ( = ?AUTO_9239 ?AUTO_9238 ) ) ( CALIBRATION_TARGET ?AUTO_9242 ?AUTO_9241 ) ( VISIBLE_FROM ?AUTO_9241 ?AUTO_9238 ) ( not ( = ?AUTO_9232 ?AUTO_9241 ) ) ( CAN_TRAVERSE ?AUTO_9234 ?AUTO_9235 ?AUTO_9238 ) ( VISIBLE ?AUTO_9235 ?AUTO_9238 ) ( not ( = ?AUTO_9237 ?AUTO_9235 ) ) ( not ( = ?AUTO_9239 ?AUTO_9235 ) ) ( not ( = ?AUTO_9238 ?AUTO_9235 ) ) ( CAN_TRAVERSE ?AUTO_9234 ?AUTO_9236 ?AUTO_9235 ) ( VISIBLE ?AUTO_9236 ?AUTO_9235 ) ( not ( = ?AUTO_9237 ?AUTO_9236 ) ) ( not ( = ?AUTO_9239 ?AUTO_9236 ) ) ( not ( = ?AUTO_9238 ?AUTO_9236 ) ) ( not ( = ?AUTO_9235 ?AUTO_9236 ) ) ( CAN_TRAVERSE ?AUTO_9234 ?AUTO_9237 ?AUTO_9236 ) ( AT ?AUTO_9234 ?AUTO_9237 ) ( VISIBLE ?AUTO_9237 ?AUTO_9236 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9234 ?AUTO_9237 ?AUTO_9236 )
      ( GET_IMAGE_DATA ?AUTO_9232 ?AUTO_9233 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9232 ?AUTO_9233 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9322 - OBJECTIVE
      ?AUTO_9323 - MODE
    )
    :vars
    (
      ?AUTO_9324 - LANDER
      ?AUTO_9326 - WAYPOINT
      ?AUTO_9327 - WAYPOINT
      ?AUTO_9325 - ROVER
      ?AUTO_9328 - CAMERA
      ?AUTO_9329 - WAYPOINT
      ?AUTO_9330 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9324 ?AUTO_9326 ) ( VISIBLE ?AUTO_9327 ?AUTO_9326 ) ( AVAILABLE ?AUTO_9325 ) ( CHANNEL_FREE ?AUTO_9324 ) ( not ( = ?AUTO_9327 ?AUTO_9326 ) ) ( CALIBRATED ?AUTO_9328 ?AUTO_9325 ) ( ON_BOARD ?AUTO_9328 ?AUTO_9325 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9325 ) ( SUPPORTS ?AUTO_9328 ?AUTO_9323 ) ( VISIBLE_FROM ?AUTO_9322 ?AUTO_9327 ) ( CAN_TRAVERSE ?AUTO_9325 ?AUTO_9329 ?AUTO_9327 ) ( VISIBLE ?AUTO_9329 ?AUTO_9327 ) ( not ( = ?AUTO_9326 ?AUTO_9329 ) ) ( not ( = ?AUTO_9327 ?AUTO_9329 ) ) ( CAN_TRAVERSE ?AUTO_9325 ?AUTO_9330 ?AUTO_9329 ) ( VISIBLE ?AUTO_9330 ?AUTO_9329 ) ( not ( = ?AUTO_9326 ?AUTO_9330 ) ) ( not ( = ?AUTO_9327 ?AUTO_9330 ) ) ( not ( = ?AUTO_9329 ?AUTO_9330 ) ) ( CAN_TRAVERSE ?AUTO_9325 ?AUTO_9326 ?AUTO_9330 ) ( AT ?AUTO_9325 ?AUTO_9326 ) ( VISIBLE ?AUTO_9326 ?AUTO_9330 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9325 ?AUTO_9326 ?AUTO_9330 )
      ( GET_IMAGE_DATA ?AUTO_9322 ?AUTO_9323 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9322 ?AUTO_9323 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9331 - OBJECTIVE
      ?AUTO_9332 - MODE
    )
    :vars
    (
      ?AUTO_9333 - LANDER
      ?AUTO_9335 - WAYPOINT
      ?AUTO_9336 - WAYPOINT
      ?AUTO_9338 - ROVER
      ?AUTO_9339 - CAMERA
      ?AUTO_9334 - WAYPOINT
      ?AUTO_9337 - WAYPOINT
      ?AUTO_9340 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9333 ?AUTO_9335 ) ( VISIBLE ?AUTO_9336 ?AUTO_9335 ) ( AVAILABLE ?AUTO_9338 ) ( CHANNEL_FREE ?AUTO_9333 ) ( not ( = ?AUTO_9336 ?AUTO_9335 ) ) ( ON_BOARD ?AUTO_9339 ?AUTO_9338 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9338 ) ( SUPPORTS ?AUTO_9339 ?AUTO_9332 ) ( VISIBLE_FROM ?AUTO_9331 ?AUTO_9336 ) ( CAN_TRAVERSE ?AUTO_9338 ?AUTO_9334 ?AUTO_9336 ) ( VISIBLE ?AUTO_9334 ?AUTO_9336 ) ( not ( = ?AUTO_9335 ?AUTO_9334 ) ) ( not ( = ?AUTO_9336 ?AUTO_9334 ) ) ( CAN_TRAVERSE ?AUTO_9338 ?AUTO_9337 ?AUTO_9334 ) ( VISIBLE ?AUTO_9337 ?AUTO_9334 ) ( not ( = ?AUTO_9335 ?AUTO_9337 ) ) ( not ( = ?AUTO_9336 ?AUTO_9337 ) ) ( not ( = ?AUTO_9334 ?AUTO_9337 ) ) ( CAN_TRAVERSE ?AUTO_9338 ?AUTO_9335 ?AUTO_9337 ) ( AT ?AUTO_9338 ?AUTO_9335 ) ( VISIBLE ?AUTO_9335 ?AUTO_9337 ) ( CALIBRATION_TARGET ?AUTO_9339 ?AUTO_9340 ) ( VISIBLE_FROM ?AUTO_9340 ?AUTO_9335 ) ( not ( = ?AUTO_9331 ?AUTO_9340 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_9338 ?AUTO_9339 ?AUTO_9340 ?AUTO_9335 )
      ( GET_IMAGE_DATA ?AUTO_9331 ?AUTO_9332 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9331 ?AUTO_9332 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9341 - OBJECTIVE
      ?AUTO_9342 - MODE
    )
    :vars
    (
      ?AUTO_9343 - LANDER
      ?AUTO_9344 - WAYPOINT
      ?AUTO_9349 - WAYPOINT
      ?AUTO_9348 - ROVER
      ?AUTO_9345 - CAMERA
      ?AUTO_9347 - WAYPOINT
      ?AUTO_9346 - WAYPOINT
      ?AUTO_9350 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9343 ?AUTO_9344 ) ( VISIBLE ?AUTO_9349 ?AUTO_9344 ) ( AVAILABLE ?AUTO_9348 ) ( CHANNEL_FREE ?AUTO_9343 ) ( not ( = ?AUTO_9349 ?AUTO_9344 ) ) ( ON_BOARD ?AUTO_9345 ?AUTO_9348 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9348 ) ( SUPPORTS ?AUTO_9345 ?AUTO_9342 ) ( VISIBLE_FROM ?AUTO_9341 ?AUTO_9349 ) ( CAN_TRAVERSE ?AUTO_9348 ?AUTO_9347 ?AUTO_9349 ) ( VISIBLE ?AUTO_9347 ?AUTO_9349 ) ( not ( = ?AUTO_9344 ?AUTO_9347 ) ) ( not ( = ?AUTO_9349 ?AUTO_9347 ) ) ( CAN_TRAVERSE ?AUTO_9348 ?AUTO_9346 ?AUTO_9347 ) ( VISIBLE ?AUTO_9346 ?AUTO_9347 ) ( not ( = ?AUTO_9344 ?AUTO_9346 ) ) ( not ( = ?AUTO_9349 ?AUTO_9346 ) ) ( not ( = ?AUTO_9347 ?AUTO_9346 ) ) ( CAN_TRAVERSE ?AUTO_9348 ?AUTO_9344 ?AUTO_9346 ) ( VISIBLE ?AUTO_9344 ?AUTO_9346 ) ( CALIBRATION_TARGET ?AUTO_9345 ?AUTO_9350 ) ( VISIBLE_FROM ?AUTO_9350 ?AUTO_9344 ) ( not ( = ?AUTO_9341 ?AUTO_9350 ) ) ( CAN_TRAVERSE ?AUTO_9348 ?AUTO_9349 ?AUTO_9344 ) ( AT ?AUTO_9348 ?AUTO_9349 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9348 ?AUTO_9349 ?AUTO_9344 )
      ( GET_IMAGE_DATA ?AUTO_9341 ?AUTO_9342 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9341 ?AUTO_9342 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9380 - OBJECTIVE
      ?AUTO_9381 - MODE
    )
    :vars
    (
      ?AUTO_9382 - LANDER
      ?AUTO_9384 - WAYPOINT
      ?AUTO_9386 - WAYPOINT
      ?AUTO_9385 - ROVER
      ?AUTO_9383 - CAMERA
      ?AUTO_9387 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9382 ?AUTO_9384 ) ( VISIBLE ?AUTO_9386 ?AUTO_9384 ) ( AVAILABLE ?AUTO_9385 ) ( CHANNEL_FREE ?AUTO_9382 ) ( not ( = ?AUTO_9386 ?AUTO_9384 ) ) ( ON_BOARD ?AUTO_9383 ?AUTO_9385 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9385 ) ( SUPPORTS ?AUTO_9383 ?AUTO_9381 ) ( VISIBLE_FROM ?AUTO_9380 ?AUTO_9386 ) ( CALIBRATION_TARGET ?AUTO_9383 ?AUTO_9387 ) ( VISIBLE_FROM ?AUTO_9387 ?AUTO_9386 ) ( not ( = ?AUTO_9380 ?AUTO_9387 ) ) ( CAN_TRAVERSE ?AUTO_9385 ?AUTO_9384 ?AUTO_9386 ) ( AT ?AUTO_9385 ?AUTO_9384 ) ( VISIBLE ?AUTO_9384 ?AUTO_9386 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9385 ?AUTO_9384 ?AUTO_9386 )
      ( GET_IMAGE_DATA ?AUTO_9380 ?AUTO_9381 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9380 ?AUTO_9381 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9388 - OBJECTIVE
      ?AUTO_9389 - MODE
    )
    :vars
    (
      ?AUTO_9392 - LANDER
      ?AUTO_9393 - WAYPOINT
      ?AUTO_9395 - WAYPOINT
      ?AUTO_9394 - ROVER
      ?AUTO_9391 - CAMERA
      ?AUTO_9390 - OBJECTIVE
      ?AUTO_9396 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9392 ?AUTO_9393 ) ( VISIBLE ?AUTO_9395 ?AUTO_9393 ) ( AVAILABLE ?AUTO_9394 ) ( CHANNEL_FREE ?AUTO_9392 ) ( not ( = ?AUTO_9395 ?AUTO_9393 ) ) ( ON_BOARD ?AUTO_9391 ?AUTO_9394 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9394 ) ( SUPPORTS ?AUTO_9391 ?AUTO_9389 ) ( VISIBLE_FROM ?AUTO_9388 ?AUTO_9395 ) ( CALIBRATION_TARGET ?AUTO_9391 ?AUTO_9390 ) ( VISIBLE_FROM ?AUTO_9390 ?AUTO_9395 ) ( not ( = ?AUTO_9388 ?AUTO_9390 ) ) ( CAN_TRAVERSE ?AUTO_9394 ?AUTO_9393 ?AUTO_9395 ) ( VISIBLE ?AUTO_9393 ?AUTO_9395 ) ( CAN_TRAVERSE ?AUTO_9394 ?AUTO_9396 ?AUTO_9393 ) ( AT ?AUTO_9394 ?AUTO_9396 ) ( VISIBLE ?AUTO_9396 ?AUTO_9393 ) ( not ( = ?AUTO_9393 ?AUTO_9396 ) ) ( not ( = ?AUTO_9395 ?AUTO_9396 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9394 ?AUTO_9396 ?AUTO_9393 )
      ( GET_IMAGE_DATA ?AUTO_9388 ?AUTO_9389 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9388 ?AUTO_9389 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9543 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9544 - LANDER
      ?AUTO_9548 - WAYPOINT
      ?AUTO_9546 - WAYPOINT
      ?AUTO_9545 - ROVER
      ?AUTO_9547 - STORE
      ?AUTO_9549 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9544 ?AUTO_9548 ) ( VISIBLE ?AUTO_9546 ?AUTO_9548 ) ( AVAILABLE ?AUTO_9545 ) ( CHANNEL_FREE ?AUTO_9544 ) ( not ( = ?AUTO_9543 ?AUTO_9546 ) ) ( not ( = ?AUTO_9543 ?AUTO_9548 ) ) ( not ( = ?AUTO_9546 ?AUTO_9548 ) ) ( CAN_TRAVERSE ?AUTO_9545 ?AUTO_9543 ?AUTO_9546 ) ( VISIBLE ?AUTO_9543 ?AUTO_9546 ) ( AT_ROCK_SAMPLE ?AUTO_9543 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9545 ) ( STORE_OF ?AUTO_9547 ?AUTO_9545 ) ( EMPTY ?AUTO_9547 ) ( CAN_TRAVERSE ?AUTO_9545 ?AUTO_9546 ?AUTO_9543 ) ( VISIBLE ?AUTO_9546 ?AUTO_9543 ) ( CAN_TRAVERSE ?AUTO_9545 ?AUTO_9548 ?AUTO_9546 ) ( VISIBLE ?AUTO_9548 ?AUTO_9546 ) ( CAN_TRAVERSE ?AUTO_9545 ?AUTO_9549 ?AUTO_9548 ) ( AT ?AUTO_9545 ?AUTO_9549 ) ( VISIBLE ?AUTO_9549 ?AUTO_9548 ) ( not ( = ?AUTO_9543 ?AUTO_9549 ) ) ( not ( = ?AUTO_9548 ?AUTO_9549 ) ) ( not ( = ?AUTO_9546 ?AUTO_9549 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9545 ?AUTO_9549 ?AUTO_9548 )
      ( GET_ROCK_DATA ?AUTO_9543 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9543 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9550 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9555 - LANDER
      ?AUTO_9554 - WAYPOINT
      ?AUTO_9553 - WAYPOINT
      ?AUTO_9556 - ROVER
      ?AUTO_9551 - STORE
      ?AUTO_9552 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9555 ?AUTO_9554 ) ( VISIBLE ?AUTO_9553 ?AUTO_9554 ) ( AVAILABLE ?AUTO_9556 ) ( CHANNEL_FREE ?AUTO_9555 ) ( not ( = ?AUTO_9550 ?AUTO_9553 ) ) ( not ( = ?AUTO_9550 ?AUTO_9554 ) ) ( not ( = ?AUTO_9553 ?AUTO_9554 ) ) ( CAN_TRAVERSE ?AUTO_9556 ?AUTO_9550 ?AUTO_9553 ) ( VISIBLE ?AUTO_9550 ?AUTO_9553 ) ( AT_ROCK_SAMPLE ?AUTO_9550 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9556 ) ( STORE_OF ?AUTO_9551 ?AUTO_9556 ) ( CAN_TRAVERSE ?AUTO_9556 ?AUTO_9553 ?AUTO_9550 ) ( VISIBLE ?AUTO_9553 ?AUTO_9550 ) ( CAN_TRAVERSE ?AUTO_9556 ?AUTO_9554 ?AUTO_9553 ) ( VISIBLE ?AUTO_9554 ?AUTO_9553 ) ( CAN_TRAVERSE ?AUTO_9556 ?AUTO_9552 ?AUTO_9554 ) ( AT ?AUTO_9556 ?AUTO_9552 ) ( VISIBLE ?AUTO_9552 ?AUTO_9554 ) ( not ( = ?AUTO_9550 ?AUTO_9552 ) ) ( not ( = ?AUTO_9554 ?AUTO_9552 ) ) ( not ( = ?AUTO_9553 ?AUTO_9552 ) ) ( FULL ?AUTO_9551 ) )
    :subtasks
    ( ( !DROP ?AUTO_9556 ?AUTO_9551 )
      ( GET_ROCK_DATA ?AUTO_9550 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9550 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9795 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9797 - LANDER
      ?AUTO_9800 - WAYPOINT
      ?AUTO_9796 - WAYPOINT
      ?AUTO_9799 - ROVER
      ?AUTO_9798 - STORE
      ?AUTO_9801 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9797 ?AUTO_9800 ) ( VISIBLE ?AUTO_9796 ?AUTO_9800 ) ( AVAILABLE ?AUTO_9799 ) ( CHANNEL_FREE ?AUTO_9797 ) ( not ( = ?AUTO_9795 ?AUTO_9796 ) ) ( not ( = ?AUTO_9795 ?AUTO_9800 ) ) ( not ( = ?AUTO_9796 ?AUTO_9800 ) ) ( CAN_TRAVERSE ?AUTO_9799 ?AUTO_9795 ?AUTO_9796 ) ( VISIBLE ?AUTO_9795 ?AUTO_9796 ) ( AT_SOIL_SAMPLE ?AUTO_9795 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9799 ) ( STORE_OF ?AUTO_9798 ?AUTO_9799 ) ( CAN_TRAVERSE ?AUTO_9799 ?AUTO_9801 ?AUTO_9795 ) ( VISIBLE ?AUTO_9801 ?AUTO_9795 ) ( not ( = ?AUTO_9795 ?AUTO_9801 ) ) ( not ( = ?AUTO_9800 ?AUTO_9801 ) ) ( not ( = ?AUTO_9796 ?AUTO_9801 ) ) ( FULL ?AUTO_9798 ) ( CAN_TRAVERSE ?AUTO_9799 ?AUTO_9796 ?AUTO_9801 ) ( VISIBLE ?AUTO_9796 ?AUTO_9801 ) ( CAN_TRAVERSE ?AUTO_9799 ?AUTO_9800 ?AUTO_9796 ) ( AT ?AUTO_9799 ?AUTO_9800 ) ( VISIBLE ?AUTO_9800 ?AUTO_9796 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9799 ?AUTO_9800 ?AUTO_9796 )
      ( GET_SOIL_DATA ?AUTO_9795 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9795 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9802 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9806 - LANDER
      ?AUTO_9807 - WAYPOINT
      ?AUTO_9803 - WAYPOINT
      ?AUTO_9808 - ROVER
      ?AUTO_9805 - STORE
      ?AUTO_9804 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9806 ?AUTO_9807 ) ( VISIBLE ?AUTO_9803 ?AUTO_9807 ) ( AVAILABLE ?AUTO_9808 ) ( CHANNEL_FREE ?AUTO_9806 ) ( not ( = ?AUTO_9802 ?AUTO_9803 ) ) ( not ( = ?AUTO_9802 ?AUTO_9807 ) ) ( not ( = ?AUTO_9803 ?AUTO_9807 ) ) ( CAN_TRAVERSE ?AUTO_9808 ?AUTO_9802 ?AUTO_9803 ) ( VISIBLE ?AUTO_9802 ?AUTO_9803 ) ( AT_SOIL_SAMPLE ?AUTO_9802 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9808 ) ( STORE_OF ?AUTO_9805 ?AUTO_9808 ) ( CAN_TRAVERSE ?AUTO_9808 ?AUTO_9804 ?AUTO_9802 ) ( VISIBLE ?AUTO_9804 ?AUTO_9802 ) ( not ( = ?AUTO_9802 ?AUTO_9804 ) ) ( not ( = ?AUTO_9807 ?AUTO_9804 ) ) ( not ( = ?AUTO_9803 ?AUTO_9804 ) ) ( CAN_TRAVERSE ?AUTO_9808 ?AUTO_9803 ?AUTO_9804 ) ( VISIBLE ?AUTO_9803 ?AUTO_9804 ) ( CAN_TRAVERSE ?AUTO_9808 ?AUTO_9807 ?AUTO_9803 ) ( AT ?AUTO_9808 ?AUTO_9807 ) ( VISIBLE ?AUTO_9807 ?AUTO_9803 ) ( AT_SOIL_SAMPLE ?AUTO_9807 ) ( EMPTY ?AUTO_9805 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_9808 ?AUTO_9805 ?AUTO_9807 )
      ( GET_SOIL_DATA ?AUTO_9802 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9802 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9809 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9811 - LANDER
      ?AUTO_9815 - WAYPOINT
      ?AUTO_9812 - WAYPOINT
      ?AUTO_9813 - ROVER
      ?AUTO_9810 - STORE
      ?AUTO_9814 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9811 ?AUTO_9815 ) ( VISIBLE ?AUTO_9812 ?AUTO_9815 ) ( AVAILABLE ?AUTO_9813 ) ( CHANNEL_FREE ?AUTO_9811 ) ( not ( = ?AUTO_9809 ?AUTO_9812 ) ) ( not ( = ?AUTO_9809 ?AUTO_9815 ) ) ( not ( = ?AUTO_9812 ?AUTO_9815 ) ) ( CAN_TRAVERSE ?AUTO_9813 ?AUTO_9809 ?AUTO_9812 ) ( VISIBLE ?AUTO_9809 ?AUTO_9812 ) ( AT_SOIL_SAMPLE ?AUTO_9809 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9813 ) ( STORE_OF ?AUTO_9810 ?AUTO_9813 ) ( CAN_TRAVERSE ?AUTO_9813 ?AUTO_9814 ?AUTO_9809 ) ( VISIBLE ?AUTO_9814 ?AUTO_9809 ) ( not ( = ?AUTO_9809 ?AUTO_9814 ) ) ( not ( = ?AUTO_9815 ?AUTO_9814 ) ) ( not ( = ?AUTO_9812 ?AUTO_9814 ) ) ( CAN_TRAVERSE ?AUTO_9813 ?AUTO_9812 ?AUTO_9814 ) ( VISIBLE ?AUTO_9812 ?AUTO_9814 ) ( CAN_TRAVERSE ?AUTO_9813 ?AUTO_9815 ?AUTO_9812 ) ( VISIBLE ?AUTO_9815 ?AUTO_9812 ) ( AT_SOIL_SAMPLE ?AUTO_9815 ) ( EMPTY ?AUTO_9810 ) ( CAN_TRAVERSE ?AUTO_9813 ?AUTO_9812 ?AUTO_9815 ) ( AT ?AUTO_9813 ?AUTO_9812 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9813 ?AUTO_9812 ?AUTO_9815 )
      ( GET_SOIL_DATA ?AUTO_9809 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9809 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9829 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9832 - LANDER
      ?AUTO_9830 - WAYPOINT
      ?AUTO_9835 - WAYPOINT
      ?AUTO_9833 - ROVER
      ?AUTO_9834 - STORE
      ?AUTO_9831 - WAYPOINT
      ?AUTO_9836 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9832 ?AUTO_9830 ) ( VISIBLE ?AUTO_9835 ?AUTO_9830 ) ( AVAILABLE ?AUTO_9833 ) ( CHANNEL_FREE ?AUTO_9832 ) ( not ( = ?AUTO_9829 ?AUTO_9835 ) ) ( not ( = ?AUTO_9829 ?AUTO_9830 ) ) ( not ( = ?AUTO_9835 ?AUTO_9830 ) ) ( CAN_TRAVERSE ?AUTO_9833 ?AUTO_9829 ?AUTO_9835 ) ( VISIBLE ?AUTO_9829 ?AUTO_9835 ) ( AT_SOIL_SAMPLE ?AUTO_9829 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9833 ) ( STORE_OF ?AUTO_9834 ?AUTO_9833 ) ( CAN_TRAVERSE ?AUTO_9833 ?AUTO_9831 ?AUTO_9829 ) ( VISIBLE ?AUTO_9831 ?AUTO_9829 ) ( not ( = ?AUTO_9829 ?AUTO_9831 ) ) ( not ( = ?AUTO_9830 ?AUTO_9831 ) ) ( not ( = ?AUTO_9835 ?AUTO_9831 ) ) ( CAN_TRAVERSE ?AUTO_9833 ?AUTO_9835 ?AUTO_9831 ) ( VISIBLE ?AUTO_9835 ?AUTO_9831 ) ( CAN_TRAVERSE ?AUTO_9833 ?AUTO_9830 ?AUTO_9835 ) ( VISIBLE ?AUTO_9830 ?AUTO_9835 ) ( AT_SOIL_SAMPLE ?AUTO_9830 ) ( EMPTY ?AUTO_9834 ) ( CAN_TRAVERSE ?AUTO_9833 ?AUTO_9836 ?AUTO_9830 ) ( AT ?AUTO_9833 ?AUTO_9836 ) ( VISIBLE ?AUTO_9836 ?AUTO_9830 ) ( not ( = ?AUTO_9829 ?AUTO_9836 ) ) ( not ( = ?AUTO_9830 ?AUTO_9836 ) ) ( not ( = ?AUTO_9835 ?AUTO_9836 ) ) ( not ( = ?AUTO_9831 ?AUTO_9836 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9833 ?AUTO_9836 ?AUTO_9830 )
      ( GET_SOIL_DATA ?AUTO_9829 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9829 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9869 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9876 - LANDER
      ?AUTO_9870 - WAYPOINT
      ?AUTO_9874 - ROVER
      ?AUTO_9872 - STORE
      ?AUTO_9873 - WAYPOINT
      ?AUTO_9875 - WAYPOINT
      ?AUTO_9871 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9876 ?AUTO_9870 ) ( VISIBLE ?AUTO_9869 ?AUTO_9870 ) ( AVAILABLE ?AUTO_9874 ) ( CHANNEL_FREE ?AUTO_9876 ) ( not ( = ?AUTO_9869 ?AUTO_9870 ) ) ( AT_ROCK_SAMPLE ?AUTO_9869 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9874 ) ( STORE_OF ?AUTO_9872 ?AUTO_9874 ) ( CAN_TRAVERSE ?AUTO_9874 ?AUTO_9873 ?AUTO_9869 ) ( VISIBLE ?AUTO_9873 ?AUTO_9869 ) ( not ( = ?AUTO_9869 ?AUTO_9873 ) ) ( not ( = ?AUTO_9870 ?AUTO_9873 ) ) ( CAN_TRAVERSE ?AUTO_9874 ?AUTO_9875 ?AUTO_9873 ) ( VISIBLE ?AUTO_9875 ?AUTO_9873 ) ( not ( = ?AUTO_9869 ?AUTO_9875 ) ) ( not ( = ?AUTO_9870 ?AUTO_9875 ) ) ( not ( = ?AUTO_9873 ?AUTO_9875 ) ) ( CAN_TRAVERSE ?AUTO_9874 ?AUTO_9871 ?AUTO_9875 ) ( AT ?AUTO_9874 ?AUTO_9871 ) ( VISIBLE ?AUTO_9871 ?AUTO_9875 ) ( not ( = ?AUTO_9869 ?AUTO_9871 ) ) ( not ( = ?AUTO_9870 ?AUTO_9871 ) ) ( not ( = ?AUTO_9873 ?AUTO_9871 ) ) ( not ( = ?AUTO_9875 ?AUTO_9871 ) ) ( FULL ?AUTO_9872 ) )
    :subtasks
    ( ( !DROP ?AUTO_9874 ?AUTO_9872 )
      ( GET_ROCK_DATA ?AUTO_9869 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9869 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9893 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9896 - LANDER
      ?AUTO_9899 - WAYPOINT
      ?AUTO_9897 - ROVER
      ?AUTO_9895 - STORE
      ?AUTO_9898 - WAYPOINT
      ?AUTO_9894 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9896 ?AUTO_9899 ) ( VISIBLE ?AUTO_9893 ?AUTO_9899 ) ( AVAILABLE ?AUTO_9897 ) ( CHANNEL_FREE ?AUTO_9896 ) ( not ( = ?AUTO_9893 ?AUTO_9899 ) ) ( AT_ROCK_SAMPLE ?AUTO_9893 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9897 ) ( STORE_OF ?AUTO_9895 ?AUTO_9897 ) ( CAN_TRAVERSE ?AUTO_9897 ?AUTO_9898 ?AUTO_9893 ) ( VISIBLE ?AUTO_9898 ?AUTO_9893 ) ( not ( = ?AUTO_9893 ?AUTO_9898 ) ) ( not ( = ?AUTO_9899 ?AUTO_9898 ) ) ( FULL ?AUTO_9895 ) ( CAN_TRAVERSE ?AUTO_9897 ?AUTO_9894 ?AUTO_9898 ) ( VISIBLE ?AUTO_9894 ?AUTO_9898 ) ( not ( = ?AUTO_9893 ?AUTO_9894 ) ) ( not ( = ?AUTO_9899 ?AUTO_9894 ) ) ( not ( = ?AUTO_9898 ?AUTO_9894 ) ) ( CAN_TRAVERSE ?AUTO_9897 ?AUTO_9899 ?AUTO_9894 ) ( AT ?AUTO_9897 ?AUTO_9899 ) ( VISIBLE ?AUTO_9899 ?AUTO_9894 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9897 ?AUTO_9899 ?AUTO_9894 )
      ( GET_ROCK_DATA ?AUTO_9893 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9893 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9900 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9906 - LANDER
      ?AUTO_9901 - WAYPOINT
      ?AUTO_9903 - ROVER
      ?AUTO_9905 - STORE
      ?AUTO_9902 - WAYPOINT
      ?AUTO_9904 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9906 ?AUTO_9901 ) ( VISIBLE ?AUTO_9900 ?AUTO_9901 ) ( AVAILABLE ?AUTO_9903 ) ( CHANNEL_FREE ?AUTO_9906 ) ( not ( = ?AUTO_9900 ?AUTO_9901 ) ) ( AT_ROCK_SAMPLE ?AUTO_9900 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9903 ) ( STORE_OF ?AUTO_9905 ?AUTO_9903 ) ( CAN_TRAVERSE ?AUTO_9903 ?AUTO_9902 ?AUTO_9900 ) ( VISIBLE ?AUTO_9902 ?AUTO_9900 ) ( not ( = ?AUTO_9900 ?AUTO_9902 ) ) ( not ( = ?AUTO_9901 ?AUTO_9902 ) ) ( CAN_TRAVERSE ?AUTO_9903 ?AUTO_9904 ?AUTO_9902 ) ( VISIBLE ?AUTO_9904 ?AUTO_9902 ) ( not ( = ?AUTO_9900 ?AUTO_9904 ) ) ( not ( = ?AUTO_9901 ?AUTO_9904 ) ) ( not ( = ?AUTO_9902 ?AUTO_9904 ) ) ( CAN_TRAVERSE ?AUTO_9903 ?AUTO_9901 ?AUTO_9904 ) ( AT ?AUTO_9903 ?AUTO_9901 ) ( VISIBLE ?AUTO_9901 ?AUTO_9904 ) ( AT_SOIL_SAMPLE ?AUTO_9901 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9903 ) ( EMPTY ?AUTO_9905 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_9903 ?AUTO_9905 ?AUTO_9901 )
      ( GET_ROCK_DATA ?AUTO_9900 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9900 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9921 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9927 - LANDER
      ?AUTO_9924 - WAYPOINT
      ?AUTO_9926 - ROVER
      ?AUTO_9922 - STORE
      ?AUTO_9925 - WAYPOINT
      ?AUTO_9923 - WAYPOINT
      ?AUTO_9928 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9927 ?AUTO_9924 ) ( VISIBLE ?AUTO_9921 ?AUTO_9924 ) ( AVAILABLE ?AUTO_9926 ) ( CHANNEL_FREE ?AUTO_9927 ) ( not ( = ?AUTO_9921 ?AUTO_9924 ) ) ( AT_ROCK_SAMPLE ?AUTO_9921 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9926 ) ( STORE_OF ?AUTO_9922 ?AUTO_9926 ) ( CAN_TRAVERSE ?AUTO_9926 ?AUTO_9925 ?AUTO_9921 ) ( VISIBLE ?AUTO_9925 ?AUTO_9921 ) ( not ( = ?AUTO_9921 ?AUTO_9925 ) ) ( not ( = ?AUTO_9924 ?AUTO_9925 ) ) ( CAN_TRAVERSE ?AUTO_9926 ?AUTO_9923 ?AUTO_9925 ) ( VISIBLE ?AUTO_9923 ?AUTO_9925 ) ( not ( = ?AUTO_9921 ?AUTO_9923 ) ) ( not ( = ?AUTO_9924 ?AUTO_9923 ) ) ( not ( = ?AUTO_9925 ?AUTO_9923 ) ) ( CAN_TRAVERSE ?AUTO_9926 ?AUTO_9924 ?AUTO_9923 ) ( VISIBLE ?AUTO_9924 ?AUTO_9923 ) ( AT_SOIL_SAMPLE ?AUTO_9924 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9926 ) ( EMPTY ?AUTO_9922 ) ( CAN_TRAVERSE ?AUTO_9926 ?AUTO_9928 ?AUTO_9924 ) ( AT ?AUTO_9926 ?AUTO_9928 ) ( VISIBLE ?AUTO_9928 ?AUTO_9924 ) ( not ( = ?AUTO_9921 ?AUTO_9928 ) ) ( not ( = ?AUTO_9924 ?AUTO_9928 ) ) ( not ( = ?AUTO_9925 ?AUTO_9928 ) ) ( not ( = ?AUTO_9923 ?AUTO_9928 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9926 ?AUTO_9928 ?AUTO_9924 )
      ( GET_ROCK_DATA ?AUTO_9921 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9921 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9993 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9994 - LANDER
      ?AUTO_9996 - WAYPOINT
      ?AUTO_9995 - ROVER
      ?AUTO_9997 - STORE
      ?AUTO_9998 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9994 ?AUTO_9993 ) ( VISIBLE ?AUTO_9996 ?AUTO_9993 ) ( AVAILABLE ?AUTO_9995 ) ( CHANNEL_FREE ?AUTO_9994 ) ( not ( = ?AUTO_9993 ?AUTO_9996 ) ) ( CAN_TRAVERSE ?AUTO_9995 ?AUTO_9993 ?AUTO_9996 ) ( VISIBLE ?AUTO_9993 ?AUTO_9996 ) ( AT_SOIL_SAMPLE ?AUTO_9993 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9995 ) ( STORE_OF ?AUTO_9997 ?AUTO_9995 ) ( CAN_TRAVERSE ?AUTO_9995 ?AUTO_9996 ?AUTO_9993 ) ( FULL ?AUTO_9997 ) ( CAN_TRAVERSE ?AUTO_9995 ?AUTO_9998 ?AUTO_9996 ) ( AT ?AUTO_9995 ?AUTO_9998 ) ( VISIBLE ?AUTO_9998 ?AUTO_9996 ) ( not ( = ?AUTO_9993 ?AUTO_9998 ) ) ( not ( = ?AUTO_9996 ?AUTO_9998 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9995 ?AUTO_9998 ?AUTO_9996 )
      ( GET_SOIL_DATA ?AUTO_9993 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9993 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10000 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10002 - LANDER
      ?AUTO_10001 - WAYPOINT
      ?AUTO_10005 - ROVER
      ?AUTO_10004 - STORE
      ?AUTO_10003 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10002 ?AUTO_10000 ) ( VISIBLE ?AUTO_10001 ?AUTO_10000 ) ( AVAILABLE ?AUTO_10005 ) ( CHANNEL_FREE ?AUTO_10002 ) ( not ( = ?AUTO_10000 ?AUTO_10001 ) ) ( CAN_TRAVERSE ?AUTO_10005 ?AUTO_10000 ?AUTO_10001 ) ( VISIBLE ?AUTO_10000 ?AUTO_10001 ) ( AT_SOIL_SAMPLE ?AUTO_10000 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10005 ) ( STORE_OF ?AUTO_10004 ?AUTO_10005 ) ( CAN_TRAVERSE ?AUTO_10005 ?AUTO_10001 ?AUTO_10000 ) ( CAN_TRAVERSE ?AUTO_10005 ?AUTO_10003 ?AUTO_10001 ) ( AT ?AUTO_10005 ?AUTO_10003 ) ( VISIBLE ?AUTO_10003 ?AUTO_10001 ) ( not ( = ?AUTO_10000 ?AUTO_10003 ) ) ( not ( = ?AUTO_10001 ?AUTO_10003 ) ) ( AT_SOIL_SAMPLE ?AUTO_10003 ) ( EMPTY ?AUTO_10004 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_10005 ?AUTO_10004 ?AUTO_10003 )
      ( GET_SOIL_DATA ?AUTO_10000 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10000 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10007 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10012 - LANDER
      ?AUTO_10009 - WAYPOINT
      ?AUTO_10010 - ROVER
      ?AUTO_10008 - STORE
      ?AUTO_10011 - WAYPOINT
      ?AUTO_10013 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10012 ?AUTO_10007 ) ( VISIBLE ?AUTO_10009 ?AUTO_10007 ) ( AVAILABLE ?AUTO_10010 ) ( CHANNEL_FREE ?AUTO_10012 ) ( not ( = ?AUTO_10007 ?AUTO_10009 ) ) ( CAN_TRAVERSE ?AUTO_10010 ?AUTO_10007 ?AUTO_10009 ) ( VISIBLE ?AUTO_10007 ?AUTO_10009 ) ( AT_SOIL_SAMPLE ?AUTO_10007 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10010 ) ( STORE_OF ?AUTO_10008 ?AUTO_10010 ) ( CAN_TRAVERSE ?AUTO_10010 ?AUTO_10009 ?AUTO_10007 ) ( FULL ?AUTO_10008 ) ( CAN_TRAVERSE ?AUTO_10010 ?AUTO_10011 ?AUTO_10009 ) ( VISIBLE ?AUTO_10011 ?AUTO_10009 ) ( not ( = ?AUTO_10007 ?AUTO_10011 ) ) ( not ( = ?AUTO_10009 ?AUTO_10011 ) ) ( CAN_TRAVERSE ?AUTO_10010 ?AUTO_10013 ?AUTO_10011 ) ( AT ?AUTO_10010 ?AUTO_10013 ) ( VISIBLE ?AUTO_10013 ?AUTO_10011 ) ( not ( = ?AUTO_10007 ?AUTO_10013 ) ) ( not ( = ?AUTO_10009 ?AUTO_10013 ) ) ( not ( = ?AUTO_10011 ?AUTO_10013 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10010 ?AUTO_10013 ?AUTO_10011 )
      ( GET_SOIL_DATA ?AUTO_10007 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10007 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10015 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10017 - LANDER
      ?AUTO_10016 - WAYPOINT
      ?AUTO_10020 - ROVER
      ?AUTO_10019 - STORE
      ?AUTO_10021 - WAYPOINT
      ?AUTO_10018 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10017 ?AUTO_10015 ) ( VISIBLE ?AUTO_10016 ?AUTO_10015 ) ( AVAILABLE ?AUTO_10020 ) ( CHANNEL_FREE ?AUTO_10017 ) ( not ( = ?AUTO_10015 ?AUTO_10016 ) ) ( CAN_TRAVERSE ?AUTO_10020 ?AUTO_10015 ?AUTO_10016 ) ( VISIBLE ?AUTO_10015 ?AUTO_10016 ) ( AT_SOIL_SAMPLE ?AUTO_10015 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10020 ) ( STORE_OF ?AUTO_10019 ?AUTO_10020 ) ( CAN_TRAVERSE ?AUTO_10020 ?AUTO_10016 ?AUTO_10015 ) ( CAN_TRAVERSE ?AUTO_10020 ?AUTO_10021 ?AUTO_10016 ) ( VISIBLE ?AUTO_10021 ?AUTO_10016 ) ( not ( = ?AUTO_10015 ?AUTO_10021 ) ) ( not ( = ?AUTO_10016 ?AUTO_10021 ) ) ( CAN_TRAVERSE ?AUTO_10020 ?AUTO_10018 ?AUTO_10021 ) ( AT ?AUTO_10020 ?AUTO_10018 ) ( VISIBLE ?AUTO_10018 ?AUTO_10021 ) ( not ( = ?AUTO_10015 ?AUTO_10018 ) ) ( not ( = ?AUTO_10016 ?AUTO_10018 ) ) ( not ( = ?AUTO_10021 ?AUTO_10018 ) ) ( AT_ROCK_SAMPLE ?AUTO_10018 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10020 ) ( EMPTY ?AUTO_10019 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_10020 ?AUTO_10019 ?AUTO_10018 )
      ( GET_SOIL_DATA ?AUTO_10015 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10015 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10063 - OBJECTIVE
      ?AUTO_10064 - MODE
    )
    :vars
    (
      ?AUTO_10065 - LANDER
      ?AUTO_10066 - WAYPOINT
      ?AUTO_10068 - WAYPOINT
      ?AUTO_10067 - ROVER
      ?AUTO_10069 - CAMERA
      ?AUTO_10070 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10065 ?AUTO_10066 ) ( VISIBLE ?AUTO_10068 ?AUTO_10066 ) ( AVAILABLE ?AUTO_10067 ) ( CHANNEL_FREE ?AUTO_10065 ) ( not ( = ?AUTO_10068 ?AUTO_10066 ) ) ( CAN_TRAVERSE ?AUTO_10067 ?AUTO_10066 ?AUTO_10068 ) ( VISIBLE ?AUTO_10066 ?AUTO_10068 ) ( ON_BOARD ?AUTO_10069 ?AUTO_10067 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10067 ) ( SUPPORTS ?AUTO_10069 ?AUTO_10064 ) ( VISIBLE_FROM ?AUTO_10063 ?AUTO_10066 ) ( CALIBRATION_TARGET ?AUTO_10069 ?AUTO_10063 ) ( CAN_TRAVERSE ?AUTO_10067 ?AUTO_10068 ?AUTO_10066 ) ( CAN_TRAVERSE ?AUTO_10067 ?AUTO_10070 ?AUTO_10068 ) ( AT ?AUTO_10067 ?AUTO_10070 ) ( VISIBLE ?AUTO_10070 ?AUTO_10068 ) ( not ( = ?AUTO_10066 ?AUTO_10070 ) ) ( not ( = ?AUTO_10068 ?AUTO_10070 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10067 ?AUTO_10070 ?AUTO_10068 )
      ( GET_IMAGE_DATA ?AUTO_10063 ?AUTO_10064 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10063 ?AUTO_10064 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10077 - OBJECTIVE
      ?AUTO_10078 - MODE
    )
    :vars
    (
      ?AUTO_10084 - LANDER
      ?AUTO_10082 - WAYPOINT
      ?AUTO_10079 - WAYPOINT
      ?AUTO_10081 - ROVER
      ?AUTO_10080 - CAMERA
      ?AUTO_10083 - WAYPOINT
      ?AUTO_10085 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10084 ?AUTO_10082 ) ( VISIBLE ?AUTO_10079 ?AUTO_10082 ) ( AVAILABLE ?AUTO_10081 ) ( CHANNEL_FREE ?AUTO_10084 ) ( not ( = ?AUTO_10079 ?AUTO_10082 ) ) ( CAN_TRAVERSE ?AUTO_10081 ?AUTO_10082 ?AUTO_10079 ) ( VISIBLE ?AUTO_10082 ?AUTO_10079 ) ( ON_BOARD ?AUTO_10080 ?AUTO_10081 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10081 ) ( SUPPORTS ?AUTO_10080 ?AUTO_10078 ) ( VISIBLE_FROM ?AUTO_10077 ?AUTO_10082 ) ( CALIBRATION_TARGET ?AUTO_10080 ?AUTO_10077 ) ( CAN_TRAVERSE ?AUTO_10081 ?AUTO_10079 ?AUTO_10082 ) ( CAN_TRAVERSE ?AUTO_10081 ?AUTO_10083 ?AUTO_10079 ) ( VISIBLE ?AUTO_10083 ?AUTO_10079 ) ( not ( = ?AUTO_10082 ?AUTO_10083 ) ) ( not ( = ?AUTO_10079 ?AUTO_10083 ) ) ( CAN_TRAVERSE ?AUTO_10081 ?AUTO_10085 ?AUTO_10083 ) ( AT ?AUTO_10081 ?AUTO_10085 ) ( VISIBLE ?AUTO_10085 ?AUTO_10083 ) ( not ( = ?AUTO_10082 ?AUTO_10085 ) ) ( not ( = ?AUTO_10079 ?AUTO_10085 ) ) ( not ( = ?AUTO_10083 ?AUTO_10085 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10081 ?AUTO_10085 ?AUTO_10083 )
      ( GET_IMAGE_DATA ?AUTO_10077 ?AUTO_10078 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10077 ?AUTO_10078 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10127 - OBJECTIVE
      ?AUTO_10128 - MODE
    )
    :vars
    (
      ?AUTO_10131 - LANDER
      ?AUTO_10130 - WAYPOINT
      ?AUTO_10132 - WAYPOINT
      ?AUTO_10129 - ROVER
      ?AUTO_10134 - CAMERA
      ?AUTO_10133 - OBJECTIVE
      ?AUTO_10135 - WAYPOINT
      ?AUTO_10136 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10131 ?AUTO_10130 ) ( VISIBLE ?AUTO_10132 ?AUTO_10130 ) ( AVAILABLE ?AUTO_10129 ) ( CHANNEL_FREE ?AUTO_10131 ) ( not ( = ?AUTO_10132 ?AUTO_10130 ) ) ( ON_BOARD ?AUTO_10134 ?AUTO_10129 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10129 ) ( SUPPORTS ?AUTO_10134 ?AUTO_10128 ) ( VISIBLE_FROM ?AUTO_10127 ?AUTO_10132 ) ( CALIBRATION_TARGET ?AUTO_10134 ?AUTO_10133 ) ( VISIBLE_FROM ?AUTO_10133 ?AUTO_10132 ) ( not ( = ?AUTO_10127 ?AUTO_10133 ) ) ( CAN_TRAVERSE ?AUTO_10129 ?AUTO_10135 ?AUTO_10132 ) ( VISIBLE ?AUTO_10135 ?AUTO_10132 ) ( not ( = ?AUTO_10130 ?AUTO_10135 ) ) ( not ( = ?AUTO_10132 ?AUTO_10135 ) ) ( CAN_TRAVERSE ?AUTO_10129 ?AUTO_10130 ?AUTO_10135 ) ( VISIBLE ?AUTO_10130 ?AUTO_10135 ) ( CAN_TRAVERSE ?AUTO_10129 ?AUTO_10136 ?AUTO_10130 ) ( AT ?AUTO_10129 ?AUTO_10136 ) ( VISIBLE ?AUTO_10136 ?AUTO_10130 ) ( not ( = ?AUTO_10130 ?AUTO_10136 ) ) ( not ( = ?AUTO_10132 ?AUTO_10136 ) ) ( not ( = ?AUTO_10135 ?AUTO_10136 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10129 ?AUTO_10136 ?AUTO_10130 )
      ( GET_IMAGE_DATA ?AUTO_10127 ?AUTO_10128 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10127 ?AUTO_10128 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10214 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10216 - LANDER
      ?AUTO_10218 - WAYPOINT
      ?AUTO_10219 - ROVER
      ?AUTO_10220 - STORE
      ?AUTO_10215 - WAYPOINT
      ?AUTO_10217 - WAYPOINT
      ?AUTO_10221 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10216 ?AUTO_10218 ) ( VISIBLE ?AUTO_10214 ?AUTO_10218 ) ( AVAILABLE ?AUTO_10219 ) ( CHANNEL_FREE ?AUTO_10216 ) ( not ( = ?AUTO_10214 ?AUTO_10218 ) ) ( AT_SOIL_SAMPLE ?AUTO_10214 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10219 ) ( STORE_OF ?AUTO_10220 ?AUTO_10219 ) ( CAN_TRAVERSE ?AUTO_10219 ?AUTO_10215 ?AUTO_10214 ) ( VISIBLE ?AUTO_10215 ?AUTO_10214 ) ( not ( = ?AUTO_10214 ?AUTO_10215 ) ) ( not ( = ?AUTO_10218 ?AUTO_10215 ) ) ( AT_ROCK_SAMPLE ?AUTO_10215 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10219 ) ( EMPTY ?AUTO_10220 ) ( CAN_TRAVERSE ?AUTO_10219 ?AUTO_10217 ?AUTO_10215 ) ( VISIBLE ?AUTO_10217 ?AUTO_10215 ) ( not ( = ?AUTO_10214 ?AUTO_10217 ) ) ( not ( = ?AUTO_10218 ?AUTO_10217 ) ) ( not ( = ?AUTO_10215 ?AUTO_10217 ) ) ( CAN_TRAVERSE ?AUTO_10219 ?AUTO_10218 ?AUTO_10217 ) ( VISIBLE ?AUTO_10218 ?AUTO_10217 ) ( CAN_TRAVERSE ?AUTO_10219 ?AUTO_10221 ?AUTO_10218 ) ( AT ?AUTO_10219 ?AUTO_10221 ) ( VISIBLE ?AUTO_10221 ?AUTO_10218 ) ( not ( = ?AUTO_10214 ?AUTO_10221 ) ) ( not ( = ?AUTO_10218 ?AUTO_10221 ) ) ( not ( = ?AUTO_10215 ?AUTO_10221 ) ) ( not ( = ?AUTO_10217 ?AUTO_10221 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10219 ?AUTO_10221 ?AUTO_10218 )
      ( GET_SOIL_DATA ?AUTO_10214 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10214 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10277 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10280 - LANDER
      ?AUTO_10282 - WAYPOINT
      ?AUTO_10279 - ROVER
      ?AUTO_10278 - STORE
      ?AUTO_10283 - WAYPOINT
      ?AUTO_10281 - WAYPOINT
      ?AUTO_10284 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10280 ?AUTO_10282 ) ( VISIBLE ?AUTO_10277 ?AUTO_10282 ) ( AVAILABLE ?AUTO_10279 ) ( CHANNEL_FREE ?AUTO_10280 ) ( not ( = ?AUTO_10277 ?AUTO_10282 ) ) ( AT_ROCK_SAMPLE ?AUTO_10277 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10279 ) ( STORE_OF ?AUTO_10278 ?AUTO_10279 ) ( CAN_TRAVERSE ?AUTO_10279 ?AUTO_10283 ?AUTO_10277 ) ( VISIBLE ?AUTO_10283 ?AUTO_10277 ) ( not ( = ?AUTO_10277 ?AUTO_10283 ) ) ( not ( = ?AUTO_10282 ?AUTO_10283 ) ) ( CAN_TRAVERSE ?AUTO_10279 ?AUTO_10281 ?AUTO_10283 ) ( VISIBLE ?AUTO_10281 ?AUTO_10283 ) ( not ( = ?AUTO_10277 ?AUTO_10281 ) ) ( not ( = ?AUTO_10282 ?AUTO_10281 ) ) ( not ( = ?AUTO_10283 ?AUTO_10281 ) ) ( AT_ROCK_SAMPLE ?AUTO_10281 ) ( EMPTY ?AUTO_10278 ) ( CAN_TRAVERSE ?AUTO_10279 ?AUTO_10284 ?AUTO_10281 ) ( VISIBLE ?AUTO_10284 ?AUTO_10281 ) ( not ( = ?AUTO_10277 ?AUTO_10284 ) ) ( not ( = ?AUTO_10282 ?AUTO_10284 ) ) ( not ( = ?AUTO_10283 ?AUTO_10284 ) ) ( not ( = ?AUTO_10281 ?AUTO_10284 ) ) ( CAN_TRAVERSE ?AUTO_10279 ?AUTO_10282 ?AUTO_10284 ) ( AT ?AUTO_10279 ?AUTO_10282 ) ( VISIBLE ?AUTO_10282 ?AUTO_10284 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10279 ?AUTO_10282 ?AUTO_10284 )
      ( GET_ROCK_DATA ?AUTO_10277 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10277 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10325 - OBJECTIVE
      ?AUTO_10326 - MODE
    )
    :vars
    (
      ?AUTO_10330 - LANDER
      ?AUTO_10329 - WAYPOINT
      ?AUTO_10327 - WAYPOINT
      ?AUTO_10332 - ROVER
      ?AUTO_10331 - CAMERA
      ?AUTO_10328 - WAYPOINT
      ?AUTO_10333 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10330 ?AUTO_10329 ) ( VISIBLE ?AUTO_10327 ?AUTO_10329 ) ( AVAILABLE ?AUTO_10332 ) ( CHANNEL_FREE ?AUTO_10330 ) ( not ( = ?AUTO_10327 ?AUTO_10329 ) ) ( CAN_TRAVERSE ?AUTO_10332 ?AUTO_10329 ?AUTO_10327 ) ( VISIBLE ?AUTO_10329 ?AUTO_10327 ) ( CALIBRATED ?AUTO_10331 ?AUTO_10332 ) ( ON_BOARD ?AUTO_10331 ?AUTO_10332 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10332 ) ( SUPPORTS ?AUTO_10331 ?AUTO_10326 ) ( VISIBLE_FROM ?AUTO_10325 ?AUTO_10329 ) ( CAN_TRAVERSE ?AUTO_10332 ?AUTO_10327 ?AUTO_10329 ) ( CAN_TRAVERSE ?AUTO_10332 ?AUTO_10328 ?AUTO_10327 ) ( VISIBLE ?AUTO_10328 ?AUTO_10327 ) ( not ( = ?AUTO_10329 ?AUTO_10328 ) ) ( not ( = ?AUTO_10327 ?AUTO_10328 ) ) ( CAN_TRAVERSE ?AUTO_10332 ?AUTO_10333 ?AUTO_10328 ) ( AT ?AUTO_10332 ?AUTO_10333 ) ( VISIBLE ?AUTO_10333 ?AUTO_10328 ) ( not ( = ?AUTO_10329 ?AUTO_10333 ) ) ( not ( = ?AUTO_10327 ?AUTO_10333 ) ) ( not ( = ?AUTO_10328 ?AUTO_10333 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10332 ?AUTO_10333 ?AUTO_10328 )
      ( GET_IMAGE_DATA ?AUTO_10325 ?AUTO_10326 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10325 ?AUTO_10326 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10334 - OBJECTIVE
      ?AUTO_10335 - MODE
    )
    :vars
    (
      ?AUTO_10337 - LANDER
      ?AUTO_10340 - WAYPOINT
      ?AUTO_10336 - WAYPOINT
      ?AUTO_10341 - ROVER
      ?AUTO_10339 - CAMERA
      ?AUTO_10338 - WAYPOINT
      ?AUTO_10342 - WAYPOINT
      ?AUTO_10343 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10337 ?AUTO_10340 ) ( VISIBLE ?AUTO_10336 ?AUTO_10340 ) ( AVAILABLE ?AUTO_10341 ) ( CHANNEL_FREE ?AUTO_10337 ) ( not ( = ?AUTO_10336 ?AUTO_10340 ) ) ( CAN_TRAVERSE ?AUTO_10341 ?AUTO_10340 ?AUTO_10336 ) ( VISIBLE ?AUTO_10340 ?AUTO_10336 ) ( ON_BOARD ?AUTO_10339 ?AUTO_10341 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10341 ) ( SUPPORTS ?AUTO_10339 ?AUTO_10335 ) ( VISIBLE_FROM ?AUTO_10334 ?AUTO_10340 ) ( CAN_TRAVERSE ?AUTO_10341 ?AUTO_10336 ?AUTO_10340 ) ( CAN_TRAVERSE ?AUTO_10341 ?AUTO_10338 ?AUTO_10336 ) ( VISIBLE ?AUTO_10338 ?AUTO_10336 ) ( not ( = ?AUTO_10340 ?AUTO_10338 ) ) ( not ( = ?AUTO_10336 ?AUTO_10338 ) ) ( CAN_TRAVERSE ?AUTO_10341 ?AUTO_10342 ?AUTO_10338 ) ( AT ?AUTO_10341 ?AUTO_10342 ) ( VISIBLE ?AUTO_10342 ?AUTO_10338 ) ( not ( = ?AUTO_10340 ?AUTO_10342 ) ) ( not ( = ?AUTO_10336 ?AUTO_10342 ) ) ( not ( = ?AUTO_10338 ?AUTO_10342 ) ) ( CALIBRATION_TARGET ?AUTO_10339 ?AUTO_10343 ) ( VISIBLE_FROM ?AUTO_10343 ?AUTO_10342 ) ( not ( = ?AUTO_10334 ?AUTO_10343 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_10341 ?AUTO_10339 ?AUTO_10343 ?AUTO_10342 )
      ( GET_IMAGE_DATA ?AUTO_10334 ?AUTO_10335 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10334 ?AUTO_10335 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10344 - OBJECTIVE
      ?AUTO_10345 - MODE
    )
    :vars
    (
      ?AUTO_10351 - LANDER
      ?AUTO_10346 - WAYPOINT
      ?AUTO_10350 - WAYPOINT
      ?AUTO_10349 - ROVER
      ?AUTO_10347 - CAMERA
      ?AUTO_10353 - WAYPOINT
      ?AUTO_10352 - WAYPOINT
      ?AUTO_10348 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10351 ?AUTO_10346 ) ( VISIBLE ?AUTO_10350 ?AUTO_10346 ) ( AVAILABLE ?AUTO_10349 ) ( CHANNEL_FREE ?AUTO_10351 ) ( not ( = ?AUTO_10350 ?AUTO_10346 ) ) ( CAN_TRAVERSE ?AUTO_10349 ?AUTO_10346 ?AUTO_10350 ) ( VISIBLE ?AUTO_10346 ?AUTO_10350 ) ( ON_BOARD ?AUTO_10347 ?AUTO_10349 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10349 ) ( SUPPORTS ?AUTO_10347 ?AUTO_10345 ) ( VISIBLE_FROM ?AUTO_10344 ?AUTO_10346 ) ( CAN_TRAVERSE ?AUTO_10349 ?AUTO_10350 ?AUTO_10346 ) ( CAN_TRAVERSE ?AUTO_10349 ?AUTO_10353 ?AUTO_10350 ) ( VISIBLE ?AUTO_10353 ?AUTO_10350 ) ( not ( = ?AUTO_10346 ?AUTO_10353 ) ) ( not ( = ?AUTO_10350 ?AUTO_10353 ) ) ( CAN_TRAVERSE ?AUTO_10349 ?AUTO_10352 ?AUTO_10353 ) ( VISIBLE ?AUTO_10352 ?AUTO_10353 ) ( not ( = ?AUTO_10346 ?AUTO_10352 ) ) ( not ( = ?AUTO_10350 ?AUTO_10352 ) ) ( not ( = ?AUTO_10353 ?AUTO_10352 ) ) ( CALIBRATION_TARGET ?AUTO_10347 ?AUTO_10348 ) ( VISIBLE_FROM ?AUTO_10348 ?AUTO_10352 ) ( not ( = ?AUTO_10344 ?AUTO_10348 ) ) ( CAN_TRAVERSE ?AUTO_10349 ?AUTO_10353 ?AUTO_10352 ) ( AT ?AUTO_10349 ?AUTO_10353 ) ( VISIBLE ?AUTO_10353 ?AUTO_10352 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10349 ?AUTO_10353 ?AUTO_10352 )
      ( GET_IMAGE_DATA ?AUTO_10344 ?AUTO_10345 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10344 ?AUTO_10345 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10588 - OBJECTIVE
      ?AUTO_10589 - MODE
    )
    :vars
    (
      ?AUTO_10592 - LANDER
      ?AUTO_10590 - WAYPOINT
      ?AUTO_10591 - WAYPOINT
      ?AUTO_10593 - ROVER
      ?AUTO_10597 - CAMERA
      ?AUTO_10595 - WAYPOINT
      ?AUTO_10594 - WAYPOINT
      ?AUTO_10596 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10592 ?AUTO_10590 ) ( VISIBLE ?AUTO_10591 ?AUTO_10590 ) ( AVAILABLE ?AUTO_10593 ) ( CHANNEL_FREE ?AUTO_10592 ) ( not ( = ?AUTO_10591 ?AUTO_10590 ) ) ( ON_BOARD ?AUTO_10597 ?AUTO_10593 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10593 ) ( SUPPORTS ?AUTO_10597 ?AUTO_10589 ) ( VISIBLE_FROM ?AUTO_10588 ?AUTO_10591 ) ( CAN_TRAVERSE ?AUTO_10593 ?AUTO_10595 ?AUTO_10591 ) ( VISIBLE ?AUTO_10595 ?AUTO_10591 ) ( not ( = ?AUTO_10590 ?AUTO_10595 ) ) ( not ( = ?AUTO_10591 ?AUTO_10595 ) ) ( CAN_TRAVERSE ?AUTO_10593 ?AUTO_10594 ?AUTO_10595 ) ( VISIBLE ?AUTO_10594 ?AUTO_10595 ) ( not ( = ?AUTO_10590 ?AUTO_10594 ) ) ( not ( = ?AUTO_10591 ?AUTO_10594 ) ) ( not ( = ?AUTO_10595 ?AUTO_10594 ) ) ( CALIBRATION_TARGET ?AUTO_10597 ?AUTO_10596 ) ( VISIBLE_FROM ?AUTO_10596 ?AUTO_10594 ) ( not ( = ?AUTO_10588 ?AUTO_10596 ) ) ( CAN_TRAVERSE ?AUTO_10593 ?AUTO_10590 ?AUTO_10594 ) ( AT ?AUTO_10593 ?AUTO_10590 ) ( VISIBLE ?AUTO_10590 ?AUTO_10594 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10593 ?AUTO_10590 ?AUTO_10594 )
      ( GET_IMAGE_DATA ?AUTO_10588 ?AUTO_10589 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10588 ?AUTO_10589 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10630 - OBJECTIVE
      ?AUTO_10631 - MODE
    )
    :vars
    (
      ?AUTO_10634 - LANDER
      ?AUTO_10633 - WAYPOINT
      ?AUTO_10638 - WAYPOINT
      ?AUTO_10632 - ROVER
      ?AUTO_10636 - WAYPOINT
      ?AUTO_10635 - CAMERA
      ?AUTO_10637 - WAYPOINT
      ?AUTO_10639 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10634 ?AUTO_10633 ) ( VISIBLE ?AUTO_10638 ?AUTO_10633 ) ( AVAILABLE ?AUTO_10632 ) ( CHANNEL_FREE ?AUTO_10634 ) ( not ( = ?AUTO_10638 ?AUTO_10633 ) ) ( CAN_TRAVERSE ?AUTO_10632 ?AUTO_10636 ?AUTO_10638 ) ( VISIBLE ?AUTO_10636 ?AUTO_10638 ) ( not ( = ?AUTO_10633 ?AUTO_10636 ) ) ( not ( = ?AUTO_10638 ?AUTO_10636 ) ) ( ON_BOARD ?AUTO_10635 ?AUTO_10632 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10632 ) ( SUPPORTS ?AUTO_10635 ?AUTO_10631 ) ( VISIBLE_FROM ?AUTO_10630 ?AUTO_10636 ) ( CAN_TRAVERSE ?AUTO_10632 ?AUTO_10637 ?AUTO_10636 ) ( AT ?AUTO_10632 ?AUTO_10637 ) ( VISIBLE ?AUTO_10637 ?AUTO_10636 ) ( not ( = ?AUTO_10633 ?AUTO_10637 ) ) ( not ( = ?AUTO_10638 ?AUTO_10637 ) ) ( not ( = ?AUTO_10636 ?AUTO_10637 ) ) ( CALIBRATION_TARGET ?AUTO_10635 ?AUTO_10639 ) ( VISIBLE_FROM ?AUTO_10639 ?AUTO_10637 ) ( not ( = ?AUTO_10630 ?AUTO_10639 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_10632 ?AUTO_10635 ?AUTO_10639 ?AUTO_10637 )
      ( GET_IMAGE_DATA ?AUTO_10630 ?AUTO_10631 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10630 ?AUTO_10631 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10640 - OBJECTIVE
      ?AUTO_10641 - MODE
    )
    :vars
    (
      ?AUTO_10647 - LANDER
      ?AUTO_10646 - WAYPOINT
      ?AUTO_10642 - WAYPOINT
      ?AUTO_10644 - ROVER
      ?AUTO_10649 - WAYPOINT
      ?AUTO_10648 - CAMERA
      ?AUTO_10643 - WAYPOINT
      ?AUTO_10645 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10647 ?AUTO_10646 ) ( VISIBLE ?AUTO_10642 ?AUTO_10646 ) ( AVAILABLE ?AUTO_10644 ) ( CHANNEL_FREE ?AUTO_10647 ) ( not ( = ?AUTO_10642 ?AUTO_10646 ) ) ( CAN_TRAVERSE ?AUTO_10644 ?AUTO_10649 ?AUTO_10642 ) ( VISIBLE ?AUTO_10649 ?AUTO_10642 ) ( not ( = ?AUTO_10646 ?AUTO_10649 ) ) ( not ( = ?AUTO_10642 ?AUTO_10649 ) ) ( ON_BOARD ?AUTO_10648 ?AUTO_10644 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10644 ) ( SUPPORTS ?AUTO_10648 ?AUTO_10641 ) ( VISIBLE_FROM ?AUTO_10640 ?AUTO_10649 ) ( CAN_TRAVERSE ?AUTO_10644 ?AUTO_10643 ?AUTO_10649 ) ( VISIBLE ?AUTO_10643 ?AUTO_10649 ) ( not ( = ?AUTO_10646 ?AUTO_10643 ) ) ( not ( = ?AUTO_10642 ?AUTO_10643 ) ) ( not ( = ?AUTO_10649 ?AUTO_10643 ) ) ( CALIBRATION_TARGET ?AUTO_10648 ?AUTO_10645 ) ( VISIBLE_FROM ?AUTO_10645 ?AUTO_10643 ) ( not ( = ?AUTO_10640 ?AUTO_10645 ) ) ( CAN_TRAVERSE ?AUTO_10644 ?AUTO_10649 ?AUTO_10643 ) ( AT ?AUTO_10644 ?AUTO_10649 ) ( VISIBLE ?AUTO_10649 ?AUTO_10643 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10644 ?AUTO_10649 ?AUTO_10643 )
      ( GET_IMAGE_DATA ?AUTO_10640 ?AUTO_10641 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10640 ?AUTO_10641 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10861 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10866 - LANDER
      ?AUTO_10864 - WAYPOINT
      ?AUTO_10862 - WAYPOINT
      ?AUTO_10867 - ROVER
      ?AUTO_10865 - STORE
      ?AUTO_10863 - WAYPOINT
      ?AUTO_10868 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10866 ?AUTO_10864 ) ( VISIBLE ?AUTO_10862 ?AUTO_10864 ) ( AVAILABLE ?AUTO_10867 ) ( CHANNEL_FREE ?AUTO_10866 ) ( not ( = ?AUTO_10861 ?AUTO_10862 ) ) ( not ( = ?AUTO_10861 ?AUTO_10864 ) ) ( not ( = ?AUTO_10862 ?AUTO_10864 ) ) ( CAN_TRAVERSE ?AUTO_10867 ?AUTO_10861 ?AUTO_10862 ) ( VISIBLE ?AUTO_10861 ?AUTO_10862 ) ( AT_SOIL_SAMPLE ?AUTO_10861 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10867 ) ( STORE_OF ?AUTO_10865 ?AUTO_10867 ) ( EMPTY ?AUTO_10865 ) ( CAN_TRAVERSE ?AUTO_10867 ?AUTO_10863 ?AUTO_10861 ) ( VISIBLE ?AUTO_10863 ?AUTO_10861 ) ( not ( = ?AUTO_10861 ?AUTO_10863 ) ) ( not ( = ?AUTO_10864 ?AUTO_10863 ) ) ( not ( = ?AUTO_10862 ?AUTO_10863 ) ) ( CAN_TRAVERSE ?AUTO_10867 ?AUTO_10868 ?AUTO_10863 ) ( VISIBLE ?AUTO_10868 ?AUTO_10863 ) ( not ( = ?AUTO_10861 ?AUTO_10868 ) ) ( not ( = ?AUTO_10864 ?AUTO_10868 ) ) ( not ( = ?AUTO_10862 ?AUTO_10868 ) ) ( not ( = ?AUTO_10863 ?AUTO_10868 ) ) ( CAN_TRAVERSE ?AUTO_10867 ?AUTO_10862 ?AUTO_10868 ) ( AT ?AUTO_10867 ?AUTO_10862 ) ( VISIBLE ?AUTO_10862 ?AUTO_10868 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10867 ?AUTO_10862 ?AUTO_10868 )
      ( GET_SOIL_DATA ?AUTO_10861 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10861 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10870 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10875 - LANDER
      ?AUTO_10876 - WAYPOINT
      ?AUTO_10874 - WAYPOINT
      ?AUTO_10872 - ROVER
      ?AUTO_10871 - STORE
      ?AUTO_10873 - WAYPOINT
      ?AUTO_10877 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10875 ?AUTO_10876 ) ( VISIBLE ?AUTO_10874 ?AUTO_10876 ) ( AVAILABLE ?AUTO_10872 ) ( CHANNEL_FREE ?AUTO_10875 ) ( not ( = ?AUTO_10870 ?AUTO_10874 ) ) ( not ( = ?AUTO_10870 ?AUTO_10876 ) ) ( not ( = ?AUTO_10874 ?AUTO_10876 ) ) ( CAN_TRAVERSE ?AUTO_10872 ?AUTO_10870 ?AUTO_10874 ) ( VISIBLE ?AUTO_10870 ?AUTO_10874 ) ( AT_SOIL_SAMPLE ?AUTO_10870 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10872 ) ( STORE_OF ?AUTO_10871 ?AUTO_10872 ) ( EMPTY ?AUTO_10871 ) ( CAN_TRAVERSE ?AUTO_10872 ?AUTO_10873 ?AUTO_10870 ) ( VISIBLE ?AUTO_10873 ?AUTO_10870 ) ( not ( = ?AUTO_10870 ?AUTO_10873 ) ) ( not ( = ?AUTO_10876 ?AUTO_10873 ) ) ( not ( = ?AUTO_10874 ?AUTO_10873 ) ) ( CAN_TRAVERSE ?AUTO_10872 ?AUTO_10877 ?AUTO_10873 ) ( VISIBLE ?AUTO_10877 ?AUTO_10873 ) ( not ( = ?AUTO_10870 ?AUTO_10877 ) ) ( not ( = ?AUTO_10876 ?AUTO_10877 ) ) ( not ( = ?AUTO_10874 ?AUTO_10877 ) ) ( not ( = ?AUTO_10873 ?AUTO_10877 ) ) ( CAN_TRAVERSE ?AUTO_10872 ?AUTO_10874 ?AUTO_10877 ) ( VISIBLE ?AUTO_10874 ?AUTO_10877 ) ( CAN_TRAVERSE ?AUTO_10872 ?AUTO_10876 ?AUTO_10874 ) ( AT ?AUTO_10872 ?AUTO_10876 ) ( VISIBLE ?AUTO_10876 ?AUTO_10874 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10872 ?AUTO_10876 ?AUTO_10874 )
      ( GET_SOIL_DATA ?AUTO_10870 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10870 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10878 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10884 - LANDER
      ?AUTO_10882 - WAYPOINT
      ?AUTO_10880 - WAYPOINT
      ?AUTO_10883 - ROVER
      ?AUTO_10885 - STORE
      ?AUTO_10879 - WAYPOINT
      ?AUTO_10881 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10884 ?AUTO_10882 ) ( VISIBLE ?AUTO_10880 ?AUTO_10882 ) ( AVAILABLE ?AUTO_10883 ) ( CHANNEL_FREE ?AUTO_10884 ) ( not ( = ?AUTO_10878 ?AUTO_10880 ) ) ( not ( = ?AUTO_10878 ?AUTO_10882 ) ) ( not ( = ?AUTO_10880 ?AUTO_10882 ) ) ( CAN_TRAVERSE ?AUTO_10883 ?AUTO_10878 ?AUTO_10880 ) ( VISIBLE ?AUTO_10878 ?AUTO_10880 ) ( AT_SOIL_SAMPLE ?AUTO_10878 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10883 ) ( STORE_OF ?AUTO_10885 ?AUTO_10883 ) ( CAN_TRAVERSE ?AUTO_10883 ?AUTO_10879 ?AUTO_10878 ) ( VISIBLE ?AUTO_10879 ?AUTO_10878 ) ( not ( = ?AUTO_10878 ?AUTO_10879 ) ) ( not ( = ?AUTO_10882 ?AUTO_10879 ) ) ( not ( = ?AUTO_10880 ?AUTO_10879 ) ) ( CAN_TRAVERSE ?AUTO_10883 ?AUTO_10881 ?AUTO_10879 ) ( VISIBLE ?AUTO_10881 ?AUTO_10879 ) ( not ( = ?AUTO_10878 ?AUTO_10881 ) ) ( not ( = ?AUTO_10882 ?AUTO_10881 ) ) ( not ( = ?AUTO_10880 ?AUTO_10881 ) ) ( not ( = ?AUTO_10879 ?AUTO_10881 ) ) ( CAN_TRAVERSE ?AUTO_10883 ?AUTO_10880 ?AUTO_10881 ) ( VISIBLE ?AUTO_10880 ?AUTO_10881 ) ( CAN_TRAVERSE ?AUTO_10883 ?AUTO_10882 ?AUTO_10880 ) ( AT ?AUTO_10883 ?AUTO_10882 ) ( VISIBLE ?AUTO_10882 ?AUTO_10880 ) ( FULL ?AUTO_10885 ) )
    :subtasks
    ( ( !DROP ?AUTO_10883 ?AUTO_10885 )
      ( GET_SOIL_DATA ?AUTO_10878 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10878 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10890 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10895 - LANDER
      ?AUTO_10897 - WAYPOINT
      ?AUTO_10896 - WAYPOINT
      ?AUTO_10894 - ROVER
      ?AUTO_10893 - STORE
      ?AUTO_10891 - WAYPOINT
      ?AUTO_10892 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10895 ?AUTO_10897 ) ( VISIBLE ?AUTO_10896 ?AUTO_10897 ) ( AVAILABLE ?AUTO_10894 ) ( CHANNEL_FREE ?AUTO_10895 ) ( not ( = ?AUTO_10890 ?AUTO_10896 ) ) ( not ( = ?AUTO_10890 ?AUTO_10897 ) ) ( not ( = ?AUTO_10896 ?AUTO_10897 ) ) ( CAN_TRAVERSE ?AUTO_10894 ?AUTO_10890 ?AUTO_10896 ) ( VISIBLE ?AUTO_10890 ?AUTO_10896 ) ( AT_SOIL_SAMPLE ?AUTO_10890 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10894 ) ( STORE_OF ?AUTO_10893 ?AUTO_10894 ) ( CAN_TRAVERSE ?AUTO_10894 ?AUTO_10891 ?AUTO_10890 ) ( VISIBLE ?AUTO_10891 ?AUTO_10890 ) ( not ( = ?AUTO_10890 ?AUTO_10891 ) ) ( not ( = ?AUTO_10897 ?AUTO_10891 ) ) ( not ( = ?AUTO_10896 ?AUTO_10891 ) ) ( CAN_TRAVERSE ?AUTO_10894 ?AUTO_10892 ?AUTO_10891 ) ( AT ?AUTO_10894 ?AUTO_10892 ) ( VISIBLE ?AUTO_10892 ?AUTO_10891 ) ( not ( = ?AUTO_10890 ?AUTO_10892 ) ) ( not ( = ?AUTO_10897 ?AUTO_10892 ) ) ( not ( = ?AUTO_10896 ?AUTO_10892 ) ) ( not ( = ?AUTO_10891 ?AUTO_10892 ) ) ( FULL ?AUTO_10893 ) )
    :subtasks
    ( ( !DROP ?AUTO_10894 ?AUTO_10893 )
      ( GET_SOIL_DATA ?AUTO_10890 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10890 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10969 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10971 - LANDER
      ?AUTO_10973 - WAYPOINT
      ?AUTO_10970 - WAYPOINT
      ?AUTO_10975 - ROVER
      ?AUTO_10974 - STORE
      ?AUTO_10976 - WAYPOINT
      ?AUTO_10972 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10971 ?AUTO_10973 ) ( VISIBLE ?AUTO_10970 ?AUTO_10973 ) ( AVAILABLE ?AUTO_10975 ) ( CHANNEL_FREE ?AUTO_10971 ) ( not ( = ?AUTO_10969 ?AUTO_10970 ) ) ( not ( = ?AUTO_10969 ?AUTO_10973 ) ) ( not ( = ?AUTO_10970 ?AUTO_10973 ) ) ( CAN_TRAVERSE ?AUTO_10975 ?AUTO_10969 ?AUTO_10970 ) ( VISIBLE ?AUTO_10969 ?AUTO_10970 ) ( AT_ROCK_SAMPLE ?AUTO_10969 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10975 ) ( STORE_OF ?AUTO_10974 ?AUTO_10975 ) ( EMPTY ?AUTO_10974 ) ( CAN_TRAVERSE ?AUTO_10975 ?AUTO_10976 ?AUTO_10969 ) ( VISIBLE ?AUTO_10976 ?AUTO_10969 ) ( not ( = ?AUTO_10969 ?AUTO_10976 ) ) ( not ( = ?AUTO_10973 ?AUTO_10976 ) ) ( not ( = ?AUTO_10970 ?AUTO_10976 ) ) ( CAN_TRAVERSE ?AUTO_10975 ?AUTO_10972 ?AUTO_10976 ) ( VISIBLE ?AUTO_10972 ?AUTO_10976 ) ( not ( = ?AUTO_10969 ?AUTO_10972 ) ) ( not ( = ?AUTO_10973 ?AUTO_10972 ) ) ( not ( = ?AUTO_10970 ?AUTO_10972 ) ) ( not ( = ?AUTO_10976 ?AUTO_10972 ) ) ( CAN_TRAVERSE ?AUTO_10975 ?AUTO_10970 ?AUTO_10972 ) ( VISIBLE ?AUTO_10970 ?AUTO_10972 ) ( CAN_TRAVERSE ?AUTO_10975 ?AUTO_10973 ?AUTO_10970 ) ( AT ?AUTO_10975 ?AUTO_10973 ) ( VISIBLE ?AUTO_10973 ?AUTO_10970 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10975 ?AUTO_10973 ?AUTO_10970 )
      ( GET_ROCK_DATA ?AUTO_10969 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10969 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10977 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10983 - LANDER
      ?AUTO_10981 - WAYPOINT
      ?AUTO_10980 - WAYPOINT
      ?AUTO_10982 - ROVER
      ?AUTO_10984 - STORE
      ?AUTO_10979 - WAYPOINT
      ?AUTO_10978 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10983 ?AUTO_10981 ) ( VISIBLE ?AUTO_10980 ?AUTO_10981 ) ( AVAILABLE ?AUTO_10982 ) ( CHANNEL_FREE ?AUTO_10983 ) ( not ( = ?AUTO_10977 ?AUTO_10980 ) ) ( not ( = ?AUTO_10977 ?AUTO_10981 ) ) ( not ( = ?AUTO_10980 ?AUTO_10981 ) ) ( CAN_TRAVERSE ?AUTO_10982 ?AUTO_10977 ?AUTO_10980 ) ( VISIBLE ?AUTO_10977 ?AUTO_10980 ) ( AT_ROCK_SAMPLE ?AUTO_10977 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10982 ) ( STORE_OF ?AUTO_10984 ?AUTO_10982 ) ( CAN_TRAVERSE ?AUTO_10982 ?AUTO_10979 ?AUTO_10977 ) ( VISIBLE ?AUTO_10979 ?AUTO_10977 ) ( not ( = ?AUTO_10977 ?AUTO_10979 ) ) ( not ( = ?AUTO_10981 ?AUTO_10979 ) ) ( not ( = ?AUTO_10980 ?AUTO_10979 ) ) ( CAN_TRAVERSE ?AUTO_10982 ?AUTO_10978 ?AUTO_10979 ) ( VISIBLE ?AUTO_10978 ?AUTO_10979 ) ( not ( = ?AUTO_10977 ?AUTO_10978 ) ) ( not ( = ?AUTO_10981 ?AUTO_10978 ) ) ( not ( = ?AUTO_10980 ?AUTO_10978 ) ) ( not ( = ?AUTO_10979 ?AUTO_10978 ) ) ( CAN_TRAVERSE ?AUTO_10982 ?AUTO_10980 ?AUTO_10978 ) ( VISIBLE ?AUTO_10980 ?AUTO_10978 ) ( CAN_TRAVERSE ?AUTO_10982 ?AUTO_10981 ?AUTO_10980 ) ( AT ?AUTO_10982 ?AUTO_10981 ) ( VISIBLE ?AUTO_10981 ?AUTO_10980 ) ( FULL ?AUTO_10984 ) )
    :subtasks
    ( ( !DROP ?AUTO_10982 ?AUTO_10984 )
      ( GET_ROCK_DATA ?AUTO_10977 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10977 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11067 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11069 - LANDER
      ?AUTO_11070 - WAYPOINT
      ?AUTO_11071 - ROVER
      ?AUTO_11072 - STORE
      ?AUTO_11068 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11069 ?AUTO_11070 ) ( VISIBLE ?AUTO_11067 ?AUTO_11070 ) ( AVAILABLE ?AUTO_11071 ) ( CHANNEL_FREE ?AUTO_11069 ) ( not ( = ?AUTO_11067 ?AUTO_11070 ) ) ( AT_SOIL_SAMPLE ?AUTO_11067 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11071 ) ( STORE_OF ?AUTO_11072 ?AUTO_11071 ) ( CAN_TRAVERSE ?AUTO_11071 ?AUTO_11070 ?AUTO_11067 ) ( VISIBLE ?AUTO_11070 ?AUTO_11067 ) ( CAN_TRAVERSE ?AUTO_11071 ?AUTO_11068 ?AUTO_11070 ) ( AT ?AUTO_11071 ?AUTO_11068 ) ( VISIBLE ?AUTO_11068 ?AUTO_11070 ) ( not ( = ?AUTO_11067 ?AUTO_11068 ) ) ( not ( = ?AUTO_11070 ?AUTO_11068 ) ) ( FULL ?AUTO_11072 ) )
    :subtasks
    ( ( !DROP ?AUTO_11071 ?AUTO_11072 )
      ( GET_SOIL_DATA ?AUTO_11067 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11067 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11269 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11271 - LANDER
      ?AUTO_11273 - WAYPOINT
      ?AUTO_11274 - ROVER
      ?AUTO_11272 - STORE
      ?AUTO_11270 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11271 ?AUTO_11273 ) ( VISIBLE ?AUTO_11269 ?AUTO_11273 ) ( AVAILABLE ?AUTO_11274 ) ( CHANNEL_FREE ?AUTO_11271 ) ( not ( = ?AUTO_11269 ?AUTO_11273 ) ) ( AT_SOIL_SAMPLE ?AUTO_11269 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11274 ) ( STORE_OF ?AUTO_11272 ?AUTO_11274 ) ( CAN_TRAVERSE ?AUTO_11274 ?AUTO_11270 ?AUTO_11269 ) ( VISIBLE ?AUTO_11270 ?AUTO_11269 ) ( not ( = ?AUTO_11269 ?AUTO_11270 ) ) ( not ( = ?AUTO_11273 ?AUTO_11270 ) ) ( AT_ROCK_SAMPLE ?AUTO_11270 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11274 ) ( CAN_TRAVERSE ?AUTO_11274 ?AUTO_11273 ?AUTO_11270 ) ( AT ?AUTO_11274 ?AUTO_11273 ) ( VISIBLE ?AUTO_11273 ?AUTO_11270 ) ( FULL ?AUTO_11272 ) )
    :subtasks
    ( ( !DROP ?AUTO_11274 ?AUTO_11272 )
      ( GET_SOIL_DATA ?AUTO_11269 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11269 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11275 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11279 - LANDER
      ?AUTO_11277 - WAYPOINT
      ?AUTO_11280 - ROVER
      ?AUTO_11276 - STORE
      ?AUTO_11278 - WAYPOINT
      ?AUTO_11281 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11279 ?AUTO_11277 ) ( VISIBLE ?AUTO_11275 ?AUTO_11277 ) ( AVAILABLE ?AUTO_11280 ) ( CHANNEL_FREE ?AUTO_11279 ) ( not ( = ?AUTO_11275 ?AUTO_11277 ) ) ( AT_SOIL_SAMPLE ?AUTO_11275 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11280 ) ( STORE_OF ?AUTO_11276 ?AUTO_11280 ) ( CAN_TRAVERSE ?AUTO_11280 ?AUTO_11278 ?AUTO_11275 ) ( VISIBLE ?AUTO_11278 ?AUTO_11275 ) ( not ( = ?AUTO_11275 ?AUTO_11278 ) ) ( not ( = ?AUTO_11277 ?AUTO_11278 ) ) ( AT_ROCK_SAMPLE ?AUTO_11278 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11280 ) ( CAN_TRAVERSE ?AUTO_11280 ?AUTO_11277 ?AUTO_11278 ) ( VISIBLE ?AUTO_11277 ?AUTO_11278 ) ( FULL ?AUTO_11276 ) ( CAN_TRAVERSE ?AUTO_11280 ?AUTO_11281 ?AUTO_11277 ) ( AT ?AUTO_11280 ?AUTO_11281 ) ( VISIBLE ?AUTO_11281 ?AUTO_11277 ) ( not ( = ?AUTO_11275 ?AUTO_11281 ) ) ( not ( = ?AUTO_11277 ?AUTO_11281 ) ) ( not ( = ?AUTO_11278 ?AUTO_11281 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11280 ?AUTO_11281 ?AUTO_11277 )
      ( GET_SOIL_DATA ?AUTO_11275 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11275 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11283 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11285 - LANDER
      ?AUTO_11288 - WAYPOINT
      ?AUTO_11284 - ROVER
      ?AUTO_11287 - STORE
      ?AUTO_11286 - WAYPOINT
      ?AUTO_11289 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11285 ?AUTO_11288 ) ( VISIBLE ?AUTO_11283 ?AUTO_11288 ) ( AVAILABLE ?AUTO_11284 ) ( CHANNEL_FREE ?AUTO_11285 ) ( not ( = ?AUTO_11283 ?AUTO_11288 ) ) ( AT_SOIL_SAMPLE ?AUTO_11283 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11284 ) ( STORE_OF ?AUTO_11287 ?AUTO_11284 ) ( CAN_TRAVERSE ?AUTO_11284 ?AUTO_11286 ?AUTO_11283 ) ( VISIBLE ?AUTO_11286 ?AUTO_11283 ) ( not ( = ?AUTO_11283 ?AUTO_11286 ) ) ( not ( = ?AUTO_11288 ?AUTO_11286 ) ) ( AT_ROCK_SAMPLE ?AUTO_11286 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11284 ) ( CAN_TRAVERSE ?AUTO_11284 ?AUTO_11288 ?AUTO_11286 ) ( VISIBLE ?AUTO_11288 ?AUTO_11286 ) ( CAN_TRAVERSE ?AUTO_11284 ?AUTO_11289 ?AUTO_11288 ) ( AT ?AUTO_11284 ?AUTO_11289 ) ( VISIBLE ?AUTO_11289 ?AUTO_11288 ) ( not ( = ?AUTO_11283 ?AUTO_11289 ) ) ( not ( = ?AUTO_11288 ?AUTO_11289 ) ) ( not ( = ?AUTO_11286 ?AUTO_11289 ) ) ( AT_ROCK_SAMPLE ?AUTO_11289 ) ( EMPTY ?AUTO_11287 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_11284 ?AUTO_11287 ?AUTO_11289 )
      ( GET_SOIL_DATA ?AUTO_11283 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11283 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11470 - OBJECTIVE
      ?AUTO_11471 - MODE
    )
    :vars
    (
      ?AUTO_11473 - LANDER
      ?AUTO_11472 - WAYPOINT
      ?AUTO_11474 - WAYPOINT
      ?AUTO_11477 - ROVER
      ?AUTO_11476 - CAMERA
      ?AUTO_11475 - WAYPOINT
      ?AUTO_11478 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11473 ?AUTO_11472 ) ( VISIBLE ?AUTO_11474 ?AUTO_11472 ) ( AVAILABLE ?AUTO_11477 ) ( CHANNEL_FREE ?AUTO_11473 ) ( not ( = ?AUTO_11474 ?AUTO_11472 ) ) ( CAN_TRAVERSE ?AUTO_11477 ?AUTO_11472 ?AUTO_11474 ) ( VISIBLE ?AUTO_11472 ?AUTO_11474 ) ( ON_BOARD ?AUTO_11476 ?AUTO_11477 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11477 ) ( SUPPORTS ?AUTO_11476 ?AUTO_11471 ) ( VISIBLE_FROM ?AUTO_11470 ?AUTO_11472 ) ( CAN_TRAVERSE ?AUTO_11477 ?AUTO_11475 ?AUTO_11472 ) ( VISIBLE ?AUTO_11475 ?AUTO_11472 ) ( not ( = ?AUTO_11472 ?AUTO_11475 ) ) ( not ( = ?AUTO_11474 ?AUTO_11475 ) ) ( CALIBRATION_TARGET ?AUTO_11476 ?AUTO_11478 ) ( VISIBLE_FROM ?AUTO_11478 ?AUTO_11475 ) ( not ( = ?AUTO_11470 ?AUTO_11478 ) ) ( CAN_TRAVERSE ?AUTO_11477 ?AUTO_11474 ?AUTO_11475 ) ( AT ?AUTO_11477 ?AUTO_11474 ) ( VISIBLE ?AUTO_11474 ?AUTO_11475 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11477 ?AUTO_11474 ?AUTO_11475 )
      ( GET_IMAGE_DATA ?AUTO_11470 ?AUTO_11471 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11470 ?AUTO_11471 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11491 - OBJECTIVE
      ?AUTO_11492 - MODE
    )
    :vars
    (
      ?AUTO_11496 - LANDER
      ?AUTO_11499 - WAYPOINT
      ?AUTO_11494 - WAYPOINT
      ?AUTO_11498 - ROVER
      ?AUTO_11495 - CAMERA
      ?AUTO_11493 - WAYPOINT
      ?AUTO_11497 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11496 ?AUTO_11499 ) ( VISIBLE ?AUTO_11494 ?AUTO_11499 ) ( AVAILABLE ?AUTO_11498 ) ( CHANNEL_FREE ?AUTO_11496 ) ( not ( = ?AUTO_11494 ?AUTO_11499 ) ) ( CAN_TRAVERSE ?AUTO_11498 ?AUTO_11499 ?AUTO_11494 ) ( VISIBLE ?AUTO_11499 ?AUTO_11494 ) ( ON_BOARD ?AUTO_11495 ?AUTO_11498 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11498 ) ( SUPPORTS ?AUTO_11495 ?AUTO_11492 ) ( VISIBLE_FROM ?AUTO_11491 ?AUTO_11499 ) ( CAN_TRAVERSE ?AUTO_11498 ?AUTO_11493 ?AUTO_11499 ) ( VISIBLE ?AUTO_11493 ?AUTO_11499 ) ( not ( = ?AUTO_11499 ?AUTO_11493 ) ) ( not ( = ?AUTO_11494 ?AUTO_11493 ) ) ( CALIBRATION_TARGET ?AUTO_11495 ?AUTO_11497 ) ( VISIBLE_FROM ?AUTO_11497 ?AUTO_11493 ) ( not ( = ?AUTO_11491 ?AUTO_11497 ) ) ( CAN_TRAVERSE ?AUTO_11498 ?AUTO_11494 ?AUTO_11493 ) ( VISIBLE ?AUTO_11494 ?AUTO_11493 ) ( AT ?AUTO_11498 ?AUTO_11499 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11498 ?AUTO_11499 ?AUTO_11494 )
      ( GET_IMAGE_DATA ?AUTO_11491 ?AUTO_11492 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11491 ?AUTO_11492 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11539 - OBJECTIVE
      ?AUTO_11540 - MODE
    )
    :vars
    (
      ?AUTO_11544 - LANDER
      ?AUTO_11545 - WAYPOINT
      ?AUTO_11543 - WAYPOINT
      ?AUTO_11541 - ROVER
      ?AUTO_11542 - CAMERA
      ?AUTO_11547 - WAYPOINT
      ?AUTO_11546 - WAYPOINT
      ?AUTO_11548 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11544 ?AUTO_11545 ) ( VISIBLE ?AUTO_11543 ?AUTO_11545 ) ( AVAILABLE ?AUTO_11541 ) ( CHANNEL_FREE ?AUTO_11544 ) ( not ( = ?AUTO_11543 ?AUTO_11545 ) ) ( ON_BOARD ?AUTO_11542 ?AUTO_11541 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11541 ) ( SUPPORTS ?AUTO_11542 ?AUTO_11540 ) ( VISIBLE_FROM ?AUTO_11539 ?AUTO_11543 ) ( CALIBRATION_TARGET ?AUTO_11542 ?AUTO_11539 ) ( CAN_TRAVERSE ?AUTO_11541 ?AUTO_11547 ?AUTO_11543 ) ( VISIBLE ?AUTO_11547 ?AUTO_11543 ) ( not ( = ?AUTO_11545 ?AUTO_11547 ) ) ( not ( = ?AUTO_11543 ?AUTO_11547 ) ) ( CAN_TRAVERSE ?AUTO_11541 ?AUTO_11546 ?AUTO_11547 ) ( VISIBLE ?AUTO_11546 ?AUTO_11547 ) ( not ( = ?AUTO_11545 ?AUTO_11546 ) ) ( not ( = ?AUTO_11543 ?AUTO_11546 ) ) ( not ( = ?AUTO_11547 ?AUTO_11546 ) ) ( CAN_TRAVERSE ?AUTO_11541 ?AUTO_11548 ?AUTO_11546 ) ( AT ?AUTO_11541 ?AUTO_11548 ) ( VISIBLE ?AUTO_11548 ?AUTO_11546 ) ( not ( = ?AUTO_11545 ?AUTO_11548 ) ) ( not ( = ?AUTO_11543 ?AUTO_11548 ) ) ( not ( = ?AUTO_11547 ?AUTO_11548 ) ) ( not ( = ?AUTO_11546 ?AUTO_11548 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11541 ?AUTO_11548 ?AUTO_11546 )
      ( GET_IMAGE_DATA ?AUTO_11539 ?AUTO_11540 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11539 ?AUTO_11540 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11571 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11573 - LANDER
      ?AUTO_11576 - WAYPOINT
      ?AUTO_11574 - ROVER
      ?AUTO_11572 - STORE
      ?AUTO_11575 - WAYPOINT
      ?AUTO_11577 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11573 ?AUTO_11576 ) ( VISIBLE ?AUTO_11571 ?AUTO_11576 ) ( AVAILABLE ?AUTO_11574 ) ( CHANNEL_FREE ?AUTO_11573 ) ( not ( = ?AUTO_11571 ?AUTO_11576 ) ) ( AT_SOIL_SAMPLE ?AUTO_11571 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11574 ) ( STORE_OF ?AUTO_11572 ?AUTO_11574 ) ( EMPTY ?AUTO_11572 ) ( CAN_TRAVERSE ?AUTO_11574 ?AUTO_11575 ?AUTO_11571 ) ( VISIBLE ?AUTO_11575 ?AUTO_11571 ) ( not ( = ?AUTO_11571 ?AUTO_11575 ) ) ( not ( = ?AUTO_11576 ?AUTO_11575 ) ) ( CAN_TRAVERSE ?AUTO_11574 ?AUTO_11576 ?AUTO_11575 ) ( VISIBLE ?AUTO_11576 ?AUTO_11575 ) ( CAN_TRAVERSE ?AUTO_11574 ?AUTO_11577 ?AUTO_11576 ) ( AT ?AUTO_11574 ?AUTO_11577 ) ( VISIBLE ?AUTO_11577 ?AUTO_11576 ) ( not ( = ?AUTO_11571 ?AUTO_11577 ) ) ( not ( = ?AUTO_11576 ?AUTO_11577 ) ) ( not ( = ?AUTO_11575 ?AUTO_11577 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11574 ?AUTO_11577 ?AUTO_11576 )
      ( GET_SOIL_DATA ?AUTO_11571 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11571 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11614 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11615 - LANDER
      ?AUTO_11616 - WAYPOINT
      ?AUTO_11618 - ROVER
      ?AUTO_11619 - STORE
      ?AUTO_11617 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11615 ?AUTO_11614 ) ( VISIBLE ?AUTO_11616 ?AUTO_11614 ) ( AVAILABLE ?AUTO_11618 ) ( CHANNEL_FREE ?AUTO_11615 ) ( not ( = ?AUTO_11614 ?AUTO_11616 ) ) ( CAN_TRAVERSE ?AUTO_11618 ?AUTO_11614 ?AUTO_11616 ) ( VISIBLE ?AUTO_11614 ?AUTO_11616 ) ( AT_SOIL_SAMPLE ?AUTO_11614 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11618 ) ( STORE_OF ?AUTO_11619 ?AUTO_11618 ) ( EMPTY ?AUTO_11619 ) ( CAN_TRAVERSE ?AUTO_11618 ?AUTO_11617 ?AUTO_11614 ) ( VISIBLE ?AUTO_11617 ?AUTO_11614 ) ( not ( = ?AUTO_11614 ?AUTO_11617 ) ) ( not ( = ?AUTO_11616 ?AUTO_11617 ) ) ( CAN_TRAVERSE ?AUTO_11618 ?AUTO_11616 ?AUTO_11617 ) ( AT ?AUTO_11618 ?AUTO_11616 ) ( VISIBLE ?AUTO_11616 ?AUTO_11617 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11618 ?AUTO_11616 ?AUTO_11617 )
      ( GET_SOIL_DATA ?AUTO_11614 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11614 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11677 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11680 - LANDER
      ?AUTO_11681 - WAYPOINT
      ?AUTO_11679 - WAYPOINT
      ?AUTO_11678 - ROVER
      ?AUTO_11683 - WAYPOINT
      ?AUTO_11682 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11680 ?AUTO_11681 ) ( VISIBLE ?AUTO_11679 ?AUTO_11681 ) ( AVAILABLE ?AUTO_11678 ) ( CHANNEL_FREE ?AUTO_11680 ) ( not ( = ?AUTO_11677 ?AUTO_11679 ) ) ( not ( = ?AUTO_11677 ?AUTO_11681 ) ) ( not ( = ?AUTO_11679 ?AUTO_11681 ) ) ( CAN_TRAVERSE ?AUTO_11678 ?AUTO_11683 ?AUTO_11679 ) ( VISIBLE ?AUTO_11683 ?AUTO_11679 ) ( not ( = ?AUTO_11677 ?AUTO_11683 ) ) ( not ( = ?AUTO_11681 ?AUTO_11683 ) ) ( not ( = ?AUTO_11679 ?AUTO_11683 ) ) ( CAN_TRAVERSE ?AUTO_11678 ?AUTO_11677 ?AUTO_11683 ) ( VISIBLE ?AUTO_11677 ?AUTO_11683 ) ( AT_SOIL_SAMPLE ?AUTO_11677 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11678 ) ( STORE_OF ?AUTO_11682 ?AUTO_11678 ) ( CAN_TRAVERSE ?AUTO_11678 ?AUTO_11683 ?AUTO_11677 ) ( VISIBLE ?AUTO_11683 ?AUTO_11677 ) ( CAN_TRAVERSE ?AUTO_11678 ?AUTO_11679 ?AUTO_11683 ) ( AT ?AUTO_11678 ?AUTO_11679 ) ( VISIBLE ?AUTO_11679 ?AUTO_11683 ) ( FULL ?AUTO_11682 ) )
    :subtasks
    ( ( !DROP ?AUTO_11678 ?AUTO_11682 )
      ( GET_SOIL_DATA ?AUTO_11677 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11677 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11685 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11689 - LANDER
      ?AUTO_11688 - WAYPOINT
      ?AUTO_11690 - WAYPOINT
      ?AUTO_11686 - ROVER
      ?AUTO_11687 - WAYPOINT
      ?AUTO_11691 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11689 ?AUTO_11688 ) ( VISIBLE ?AUTO_11690 ?AUTO_11688 ) ( AVAILABLE ?AUTO_11686 ) ( CHANNEL_FREE ?AUTO_11689 ) ( not ( = ?AUTO_11685 ?AUTO_11690 ) ) ( not ( = ?AUTO_11685 ?AUTO_11688 ) ) ( not ( = ?AUTO_11690 ?AUTO_11688 ) ) ( CAN_TRAVERSE ?AUTO_11686 ?AUTO_11687 ?AUTO_11690 ) ( VISIBLE ?AUTO_11687 ?AUTO_11690 ) ( not ( = ?AUTO_11685 ?AUTO_11687 ) ) ( not ( = ?AUTO_11688 ?AUTO_11687 ) ) ( not ( = ?AUTO_11690 ?AUTO_11687 ) ) ( CAN_TRAVERSE ?AUTO_11686 ?AUTO_11685 ?AUTO_11687 ) ( VISIBLE ?AUTO_11685 ?AUTO_11687 ) ( AT_SOIL_SAMPLE ?AUTO_11685 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11686 ) ( STORE_OF ?AUTO_11691 ?AUTO_11686 ) ( CAN_TRAVERSE ?AUTO_11686 ?AUTO_11687 ?AUTO_11685 ) ( VISIBLE ?AUTO_11687 ?AUTO_11685 ) ( CAN_TRAVERSE ?AUTO_11686 ?AUTO_11690 ?AUTO_11687 ) ( VISIBLE ?AUTO_11690 ?AUTO_11687 ) ( FULL ?AUTO_11691 ) ( CAN_TRAVERSE ?AUTO_11686 ?AUTO_11688 ?AUTO_11690 ) ( AT ?AUTO_11686 ?AUTO_11688 ) ( VISIBLE ?AUTO_11688 ?AUTO_11690 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11686 ?AUTO_11688 ?AUTO_11690 )
      ( GET_SOIL_DATA ?AUTO_11685 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11685 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11692 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11696 - LANDER
      ?AUTO_11694 - WAYPOINT
      ?AUTO_11698 - WAYPOINT
      ?AUTO_11697 - ROVER
      ?AUTO_11693 - WAYPOINT
      ?AUTO_11695 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11696 ?AUTO_11694 ) ( VISIBLE ?AUTO_11698 ?AUTO_11694 ) ( AVAILABLE ?AUTO_11697 ) ( CHANNEL_FREE ?AUTO_11696 ) ( not ( = ?AUTO_11692 ?AUTO_11698 ) ) ( not ( = ?AUTO_11692 ?AUTO_11694 ) ) ( not ( = ?AUTO_11698 ?AUTO_11694 ) ) ( CAN_TRAVERSE ?AUTO_11697 ?AUTO_11693 ?AUTO_11698 ) ( VISIBLE ?AUTO_11693 ?AUTO_11698 ) ( not ( = ?AUTO_11692 ?AUTO_11693 ) ) ( not ( = ?AUTO_11694 ?AUTO_11693 ) ) ( not ( = ?AUTO_11698 ?AUTO_11693 ) ) ( CAN_TRAVERSE ?AUTO_11697 ?AUTO_11692 ?AUTO_11693 ) ( VISIBLE ?AUTO_11692 ?AUTO_11693 ) ( AT_SOIL_SAMPLE ?AUTO_11692 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11697 ) ( STORE_OF ?AUTO_11695 ?AUTO_11697 ) ( CAN_TRAVERSE ?AUTO_11697 ?AUTO_11693 ?AUTO_11692 ) ( VISIBLE ?AUTO_11693 ?AUTO_11692 ) ( CAN_TRAVERSE ?AUTO_11697 ?AUTO_11698 ?AUTO_11693 ) ( VISIBLE ?AUTO_11698 ?AUTO_11693 ) ( CAN_TRAVERSE ?AUTO_11697 ?AUTO_11694 ?AUTO_11698 ) ( AT ?AUTO_11697 ?AUTO_11694 ) ( VISIBLE ?AUTO_11694 ?AUTO_11698 ) ( AT_SOIL_SAMPLE ?AUTO_11694 ) ( EMPTY ?AUTO_11695 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_11697 ?AUTO_11695 ?AUTO_11694 )
      ( GET_SOIL_DATA ?AUTO_11692 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11692 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11699 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11701 - LANDER
      ?AUTO_11700 - WAYPOINT
      ?AUTO_11703 - WAYPOINT
      ?AUTO_11704 - ROVER
      ?AUTO_11705 - WAYPOINT
      ?AUTO_11702 - STORE
      ?AUTO_11706 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11701 ?AUTO_11700 ) ( VISIBLE ?AUTO_11703 ?AUTO_11700 ) ( AVAILABLE ?AUTO_11704 ) ( CHANNEL_FREE ?AUTO_11701 ) ( not ( = ?AUTO_11699 ?AUTO_11703 ) ) ( not ( = ?AUTO_11699 ?AUTO_11700 ) ) ( not ( = ?AUTO_11703 ?AUTO_11700 ) ) ( CAN_TRAVERSE ?AUTO_11704 ?AUTO_11705 ?AUTO_11703 ) ( VISIBLE ?AUTO_11705 ?AUTO_11703 ) ( not ( = ?AUTO_11699 ?AUTO_11705 ) ) ( not ( = ?AUTO_11700 ?AUTO_11705 ) ) ( not ( = ?AUTO_11703 ?AUTO_11705 ) ) ( CAN_TRAVERSE ?AUTO_11704 ?AUTO_11699 ?AUTO_11705 ) ( VISIBLE ?AUTO_11699 ?AUTO_11705 ) ( AT_SOIL_SAMPLE ?AUTO_11699 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11704 ) ( STORE_OF ?AUTO_11702 ?AUTO_11704 ) ( CAN_TRAVERSE ?AUTO_11704 ?AUTO_11705 ?AUTO_11699 ) ( VISIBLE ?AUTO_11705 ?AUTO_11699 ) ( CAN_TRAVERSE ?AUTO_11704 ?AUTO_11703 ?AUTO_11705 ) ( VISIBLE ?AUTO_11703 ?AUTO_11705 ) ( CAN_TRAVERSE ?AUTO_11704 ?AUTO_11700 ?AUTO_11703 ) ( VISIBLE ?AUTO_11700 ?AUTO_11703 ) ( AT_SOIL_SAMPLE ?AUTO_11700 ) ( EMPTY ?AUTO_11702 ) ( CAN_TRAVERSE ?AUTO_11704 ?AUTO_11706 ?AUTO_11700 ) ( AT ?AUTO_11704 ?AUTO_11706 ) ( VISIBLE ?AUTO_11706 ?AUTO_11700 ) ( not ( = ?AUTO_11699 ?AUTO_11706 ) ) ( not ( = ?AUTO_11700 ?AUTO_11706 ) ) ( not ( = ?AUTO_11703 ?AUTO_11706 ) ) ( not ( = ?AUTO_11705 ?AUTO_11706 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11704 ?AUTO_11706 ?AUTO_11700 )
      ( GET_SOIL_DATA ?AUTO_11699 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11699 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11707 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11709 - LANDER
      ?AUTO_11711 - WAYPOINT
      ?AUTO_11712 - WAYPOINT
      ?AUTO_11708 - ROVER
      ?AUTO_11710 - WAYPOINT
      ?AUTO_11714 - STORE
      ?AUTO_11713 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11709 ?AUTO_11711 ) ( VISIBLE ?AUTO_11712 ?AUTO_11711 ) ( AVAILABLE ?AUTO_11708 ) ( CHANNEL_FREE ?AUTO_11709 ) ( not ( = ?AUTO_11707 ?AUTO_11712 ) ) ( not ( = ?AUTO_11707 ?AUTO_11711 ) ) ( not ( = ?AUTO_11712 ?AUTO_11711 ) ) ( CAN_TRAVERSE ?AUTO_11708 ?AUTO_11710 ?AUTO_11712 ) ( VISIBLE ?AUTO_11710 ?AUTO_11712 ) ( not ( = ?AUTO_11707 ?AUTO_11710 ) ) ( not ( = ?AUTO_11711 ?AUTO_11710 ) ) ( not ( = ?AUTO_11712 ?AUTO_11710 ) ) ( CAN_TRAVERSE ?AUTO_11708 ?AUTO_11707 ?AUTO_11710 ) ( VISIBLE ?AUTO_11707 ?AUTO_11710 ) ( AT_SOIL_SAMPLE ?AUTO_11707 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11708 ) ( STORE_OF ?AUTO_11714 ?AUTO_11708 ) ( CAN_TRAVERSE ?AUTO_11708 ?AUTO_11710 ?AUTO_11707 ) ( VISIBLE ?AUTO_11710 ?AUTO_11707 ) ( CAN_TRAVERSE ?AUTO_11708 ?AUTO_11712 ?AUTO_11710 ) ( VISIBLE ?AUTO_11712 ?AUTO_11710 ) ( CAN_TRAVERSE ?AUTO_11708 ?AUTO_11711 ?AUTO_11712 ) ( VISIBLE ?AUTO_11711 ?AUTO_11712 ) ( AT_SOIL_SAMPLE ?AUTO_11711 ) ( CAN_TRAVERSE ?AUTO_11708 ?AUTO_11713 ?AUTO_11711 ) ( AT ?AUTO_11708 ?AUTO_11713 ) ( VISIBLE ?AUTO_11713 ?AUTO_11711 ) ( not ( = ?AUTO_11707 ?AUTO_11713 ) ) ( not ( = ?AUTO_11711 ?AUTO_11713 ) ) ( not ( = ?AUTO_11712 ?AUTO_11713 ) ) ( not ( = ?AUTO_11710 ?AUTO_11713 ) ) ( FULL ?AUTO_11714 ) )
    :subtasks
    ( ( !DROP ?AUTO_11708 ?AUTO_11714 )
      ( GET_SOIL_DATA ?AUTO_11707 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11707 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11717 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11718 - LANDER
      ?AUTO_11722 - WAYPOINT
      ?AUTO_11723 - WAYPOINT
      ?AUTO_11719 - ROVER
      ?AUTO_11720 - WAYPOINT
      ?AUTO_11724 - STORE
      ?AUTO_11721 - WAYPOINT
      ?AUTO_11725 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11718 ?AUTO_11722 ) ( VISIBLE ?AUTO_11723 ?AUTO_11722 ) ( AVAILABLE ?AUTO_11719 ) ( CHANNEL_FREE ?AUTO_11718 ) ( not ( = ?AUTO_11717 ?AUTO_11723 ) ) ( not ( = ?AUTO_11717 ?AUTO_11722 ) ) ( not ( = ?AUTO_11723 ?AUTO_11722 ) ) ( CAN_TRAVERSE ?AUTO_11719 ?AUTO_11720 ?AUTO_11723 ) ( VISIBLE ?AUTO_11720 ?AUTO_11723 ) ( not ( = ?AUTO_11717 ?AUTO_11720 ) ) ( not ( = ?AUTO_11722 ?AUTO_11720 ) ) ( not ( = ?AUTO_11723 ?AUTO_11720 ) ) ( CAN_TRAVERSE ?AUTO_11719 ?AUTO_11717 ?AUTO_11720 ) ( VISIBLE ?AUTO_11717 ?AUTO_11720 ) ( AT_SOIL_SAMPLE ?AUTO_11717 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11719 ) ( STORE_OF ?AUTO_11724 ?AUTO_11719 ) ( CAN_TRAVERSE ?AUTO_11719 ?AUTO_11720 ?AUTO_11717 ) ( VISIBLE ?AUTO_11720 ?AUTO_11717 ) ( CAN_TRAVERSE ?AUTO_11719 ?AUTO_11723 ?AUTO_11720 ) ( VISIBLE ?AUTO_11723 ?AUTO_11720 ) ( CAN_TRAVERSE ?AUTO_11719 ?AUTO_11722 ?AUTO_11723 ) ( VISIBLE ?AUTO_11722 ?AUTO_11723 ) ( AT_SOIL_SAMPLE ?AUTO_11722 ) ( EMPTY ?AUTO_11724 ) ( CAN_TRAVERSE ?AUTO_11719 ?AUTO_11721 ?AUTO_11722 ) ( VISIBLE ?AUTO_11721 ?AUTO_11722 ) ( not ( = ?AUTO_11717 ?AUTO_11721 ) ) ( not ( = ?AUTO_11722 ?AUTO_11721 ) ) ( not ( = ?AUTO_11723 ?AUTO_11721 ) ) ( not ( = ?AUTO_11720 ?AUTO_11721 ) ) ( CAN_TRAVERSE ?AUTO_11719 ?AUTO_11725 ?AUTO_11721 ) ( AT ?AUTO_11719 ?AUTO_11725 ) ( VISIBLE ?AUTO_11725 ?AUTO_11721 ) ( not ( = ?AUTO_11717 ?AUTO_11725 ) ) ( not ( = ?AUTO_11722 ?AUTO_11725 ) ) ( not ( = ?AUTO_11723 ?AUTO_11725 ) ) ( not ( = ?AUTO_11720 ?AUTO_11725 ) ) ( not ( = ?AUTO_11721 ?AUTO_11725 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11719 ?AUTO_11725 ?AUTO_11721 )
      ( GET_SOIL_DATA ?AUTO_11717 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11717 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11776 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11778 - LANDER
      ?AUTO_11781 - WAYPOINT
      ?AUTO_11780 - WAYPOINT
      ?AUTO_11777 - ROVER
      ?AUTO_11779 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11778 ?AUTO_11781 ) ( VISIBLE ?AUTO_11780 ?AUTO_11781 ) ( AVAILABLE ?AUTO_11777 ) ( CHANNEL_FREE ?AUTO_11778 ) ( not ( = ?AUTO_11776 ?AUTO_11780 ) ) ( not ( = ?AUTO_11776 ?AUTO_11781 ) ) ( not ( = ?AUTO_11780 ?AUTO_11781 ) ) ( CAN_TRAVERSE ?AUTO_11777 ?AUTO_11776 ?AUTO_11780 ) ( VISIBLE ?AUTO_11776 ?AUTO_11780 ) ( AT_SOIL_SAMPLE ?AUTO_11776 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11777 ) ( STORE_OF ?AUTO_11779 ?AUTO_11777 ) ( CAN_TRAVERSE ?AUTO_11777 ?AUTO_11780 ?AUTO_11776 ) ( VISIBLE ?AUTO_11780 ?AUTO_11776 ) ( FULL ?AUTO_11779 ) ( CAN_TRAVERSE ?AUTO_11777 ?AUTO_11781 ?AUTO_11780 ) ( AT ?AUTO_11777 ?AUTO_11781 ) ( VISIBLE ?AUTO_11781 ?AUTO_11780 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11777 ?AUTO_11781 ?AUTO_11780 )
      ( GET_SOIL_DATA ?AUTO_11776 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11776 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11782 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11783 - LANDER
      ?AUTO_11785 - WAYPOINT
      ?AUTO_11786 - WAYPOINT
      ?AUTO_11787 - ROVER
      ?AUTO_11784 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11783 ?AUTO_11785 ) ( VISIBLE ?AUTO_11786 ?AUTO_11785 ) ( AVAILABLE ?AUTO_11787 ) ( CHANNEL_FREE ?AUTO_11783 ) ( not ( = ?AUTO_11782 ?AUTO_11786 ) ) ( not ( = ?AUTO_11782 ?AUTO_11785 ) ) ( not ( = ?AUTO_11786 ?AUTO_11785 ) ) ( CAN_TRAVERSE ?AUTO_11787 ?AUTO_11782 ?AUTO_11786 ) ( VISIBLE ?AUTO_11782 ?AUTO_11786 ) ( AT_SOIL_SAMPLE ?AUTO_11782 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11787 ) ( STORE_OF ?AUTO_11784 ?AUTO_11787 ) ( CAN_TRAVERSE ?AUTO_11787 ?AUTO_11786 ?AUTO_11782 ) ( VISIBLE ?AUTO_11786 ?AUTO_11782 ) ( CAN_TRAVERSE ?AUTO_11787 ?AUTO_11785 ?AUTO_11786 ) ( AT ?AUTO_11787 ?AUTO_11785 ) ( VISIBLE ?AUTO_11785 ?AUTO_11786 ) ( AT_SOIL_SAMPLE ?AUTO_11785 ) ( EMPTY ?AUTO_11784 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_11787 ?AUTO_11784 ?AUTO_11785 )
      ( GET_SOIL_DATA ?AUTO_11782 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11782 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11795 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11797 - LANDER
      ?AUTO_11801 - WAYPOINT
      ?AUTO_11798 - WAYPOINT
      ?AUTO_11799 - ROVER
      ?AUTO_11796 - STORE
      ?AUTO_11800 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11797 ?AUTO_11801 ) ( VISIBLE ?AUTO_11798 ?AUTO_11801 ) ( AVAILABLE ?AUTO_11799 ) ( CHANNEL_FREE ?AUTO_11797 ) ( not ( = ?AUTO_11795 ?AUTO_11798 ) ) ( not ( = ?AUTO_11795 ?AUTO_11801 ) ) ( not ( = ?AUTO_11798 ?AUTO_11801 ) ) ( CAN_TRAVERSE ?AUTO_11799 ?AUTO_11795 ?AUTO_11798 ) ( VISIBLE ?AUTO_11795 ?AUTO_11798 ) ( AT_SOIL_SAMPLE ?AUTO_11795 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11799 ) ( STORE_OF ?AUTO_11796 ?AUTO_11799 ) ( CAN_TRAVERSE ?AUTO_11799 ?AUTO_11798 ?AUTO_11795 ) ( VISIBLE ?AUTO_11798 ?AUTO_11795 ) ( CAN_TRAVERSE ?AUTO_11799 ?AUTO_11801 ?AUTO_11798 ) ( VISIBLE ?AUTO_11801 ?AUTO_11798 ) ( AT_SOIL_SAMPLE ?AUTO_11801 ) ( CAN_TRAVERSE ?AUTO_11799 ?AUTO_11800 ?AUTO_11801 ) ( AT ?AUTO_11799 ?AUTO_11800 ) ( VISIBLE ?AUTO_11800 ?AUTO_11801 ) ( not ( = ?AUTO_11795 ?AUTO_11800 ) ) ( not ( = ?AUTO_11801 ?AUTO_11800 ) ) ( not ( = ?AUTO_11798 ?AUTO_11800 ) ) ( FULL ?AUTO_11796 ) )
    :subtasks
    ( ( !DROP ?AUTO_11799 ?AUTO_11796 )
      ( GET_SOIL_DATA ?AUTO_11795 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11795 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11804 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11808 - LANDER
      ?AUTO_11807 - WAYPOINT
      ?AUTO_11810 - WAYPOINT
      ?AUTO_11805 - ROVER
      ?AUTO_11809 - STORE
      ?AUTO_11806 - WAYPOINT
      ?AUTO_11811 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11808 ?AUTO_11807 ) ( VISIBLE ?AUTO_11810 ?AUTO_11807 ) ( AVAILABLE ?AUTO_11805 ) ( CHANNEL_FREE ?AUTO_11808 ) ( not ( = ?AUTO_11804 ?AUTO_11810 ) ) ( not ( = ?AUTO_11804 ?AUTO_11807 ) ) ( not ( = ?AUTO_11810 ?AUTO_11807 ) ) ( CAN_TRAVERSE ?AUTO_11805 ?AUTO_11804 ?AUTO_11810 ) ( VISIBLE ?AUTO_11804 ?AUTO_11810 ) ( AT_SOIL_SAMPLE ?AUTO_11804 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11805 ) ( STORE_OF ?AUTO_11809 ?AUTO_11805 ) ( CAN_TRAVERSE ?AUTO_11805 ?AUTO_11810 ?AUTO_11804 ) ( VISIBLE ?AUTO_11810 ?AUTO_11804 ) ( CAN_TRAVERSE ?AUTO_11805 ?AUTO_11807 ?AUTO_11810 ) ( VISIBLE ?AUTO_11807 ?AUTO_11810 ) ( AT_SOIL_SAMPLE ?AUTO_11807 ) ( EMPTY ?AUTO_11809 ) ( CAN_TRAVERSE ?AUTO_11805 ?AUTO_11806 ?AUTO_11807 ) ( VISIBLE ?AUTO_11806 ?AUTO_11807 ) ( not ( = ?AUTO_11804 ?AUTO_11806 ) ) ( not ( = ?AUTO_11807 ?AUTO_11806 ) ) ( not ( = ?AUTO_11810 ?AUTO_11806 ) ) ( CAN_TRAVERSE ?AUTO_11805 ?AUTO_11811 ?AUTO_11806 ) ( AT ?AUTO_11805 ?AUTO_11811 ) ( VISIBLE ?AUTO_11811 ?AUTO_11806 ) ( not ( = ?AUTO_11804 ?AUTO_11811 ) ) ( not ( = ?AUTO_11807 ?AUTO_11811 ) ) ( not ( = ?AUTO_11810 ?AUTO_11811 ) ) ( not ( = ?AUTO_11806 ?AUTO_11811 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11805 ?AUTO_11811 ?AUTO_11806 )
      ( GET_SOIL_DATA ?AUTO_11804 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11804 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11936 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11942 - LANDER
      ?AUTO_11939 - WAYPOINT
      ?AUTO_11938 - WAYPOINT
      ?AUTO_11937 - ROVER
      ?AUTO_11940 - WAYPOINT
      ?AUTO_11941 - STORE
      ?AUTO_11943 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11942 ?AUTO_11939 ) ( VISIBLE ?AUTO_11938 ?AUTO_11939 ) ( AVAILABLE ?AUTO_11937 ) ( CHANNEL_FREE ?AUTO_11942 ) ( not ( = ?AUTO_11936 ?AUTO_11938 ) ) ( not ( = ?AUTO_11936 ?AUTO_11939 ) ) ( not ( = ?AUTO_11938 ?AUTO_11939 ) ) ( CAN_TRAVERSE ?AUTO_11937 ?AUTO_11940 ?AUTO_11938 ) ( VISIBLE ?AUTO_11940 ?AUTO_11938 ) ( not ( = ?AUTO_11936 ?AUTO_11940 ) ) ( not ( = ?AUTO_11939 ?AUTO_11940 ) ) ( not ( = ?AUTO_11938 ?AUTO_11940 ) ) ( CAN_TRAVERSE ?AUTO_11937 ?AUTO_11936 ?AUTO_11940 ) ( VISIBLE ?AUTO_11936 ?AUTO_11940 ) ( AT_ROCK_SAMPLE ?AUTO_11936 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11937 ) ( STORE_OF ?AUTO_11941 ?AUTO_11937 ) ( EMPTY ?AUTO_11941 ) ( CAN_TRAVERSE ?AUTO_11937 ?AUTO_11938 ?AUTO_11936 ) ( VISIBLE ?AUTO_11938 ?AUTO_11936 ) ( CAN_TRAVERSE ?AUTO_11937 ?AUTO_11943 ?AUTO_11940 ) ( AT ?AUTO_11937 ?AUTO_11943 ) ( VISIBLE ?AUTO_11943 ?AUTO_11940 ) ( not ( = ?AUTO_11936 ?AUTO_11943 ) ) ( not ( = ?AUTO_11939 ?AUTO_11943 ) ) ( not ( = ?AUTO_11938 ?AUTO_11943 ) ) ( not ( = ?AUTO_11940 ?AUTO_11943 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11937 ?AUTO_11943 ?AUTO_11940 )
      ( GET_ROCK_DATA ?AUTO_11936 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11936 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11982 - OBJECTIVE
      ?AUTO_11983 - MODE
    )
    :vars
    (
      ?AUTO_11986 - LANDER
      ?AUTO_11984 - WAYPOINT
      ?AUTO_11988 - WAYPOINT
      ?AUTO_11989 - ROVER
      ?AUTO_11987 - CAMERA
      ?AUTO_11985 - OBJECTIVE
      ?AUTO_11990 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11986 ?AUTO_11984 ) ( VISIBLE ?AUTO_11988 ?AUTO_11984 ) ( AVAILABLE ?AUTO_11989 ) ( CHANNEL_FREE ?AUTO_11986 ) ( not ( = ?AUTO_11988 ?AUTO_11984 ) ) ( ON_BOARD ?AUTO_11987 ?AUTO_11989 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11989 ) ( SUPPORTS ?AUTO_11987 ?AUTO_11983 ) ( VISIBLE_FROM ?AUTO_11982 ?AUTO_11988 ) ( CAN_TRAVERSE ?AUTO_11989 ?AUTO_11984 ?AUTO_11988 ) ( VISIBLE ?AUTO_11984 ?AUTO_11988 ) ( CALIBRATION_TARGET ?AUTO_11987 ?AUTO_11985 ) ( VISIBLE_FROM ?AUTO_11985 ?AUTO_11984 ) ( not ( = ?AUTO_11982 ?AUTO_11985 ) ) ( CAN_TRAVERSE ?AUTO_11989 ?AUTO_11988 ?AUTO_11984 ) ( CAN_TRAVERSE ?AUTO_11989 ?AUTO_11990 ?AUTO_11988 ) ( AT ?AUTO_11989 ?AUTO_11990 ) ( VISIBLE ?AUTO_11990 ?AUTO_11988 ) ( not ( = ?AUTO_11984 ?AUTO_11990 ) ) ( not ( = ?AUTO_11988 ?AUTO_11990 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11989 ?AUTO_11990 ?AUTO_11988 )
      ( GET_IMAGE_DATA ?AUTO_11982 ?AUTO_11983 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11982 ?AUTO_11983 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11991 - OBJECTIVE
      ?AUTO_11992 - MODE
    )
    :vars
    (
      ?AUTO_11994 - LANDER
      ?AUTO_11993 - WAYPOINT
      ?AUTO_11997 - WAYPOINT
      ?AUTO_11996 - ROVER
      ?AUTO_11999 - CAMERA
      ?AUTO_11995 - OBJECTIVE
      ?AUTO_11998 - WAYPOINT
      ?AUTO_12000 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11994 ?AUTO_11993 ) ( VISIBLE ?AUTO_11997 ?AUTO_11993 ) ( AVAILABLE ?AUTO_11996 ) ( CHANNEL_FREE ?AUTO_11994 ) ( not ( = ?AUTO_11997 ?AUTO_11993 ) ) ( ON_BOARD ?AUTO_11999 ?AUTO_11996 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11996 ) ( SUPPORTS ?AUTO_11999 ?AUTO_11992 ) ( VISIBLE_FROM ?AUTO_11991 ?AUTO_11997 ) ( CAN_TRAVERSE ?AUTO_11996 ?AUTO_11993 ?AUTO_11997 ) ( VISIBLE ?AUTO_11993 ?AUTO_11997 ) ( CALIBRATION_TARGET ?AUTO_11999 ?AUTO_11995 ) ( VISIBLE_FROM ?AUTO_11995 ?AUTO_11993 ) ( not ( = ?AUTO_11991 ?AUTO_11995 ) ) ( CAN_TRAVERSE ?AUTO_11996 ?AUTO_11997 ?AUTO_11993 ) ( CAN_TRAVERSE ?AUTO_11996 ?AUTO_11998 ?AUTO_11997 ) ( VISIBLE ?AUTO_11998 ?AUTO_11997 ) ( not ( = ?AUTO_11993 ?AUTO_11998 ) ) ( not ( = ?AUTO_11997 ?AUTO_11998 ) ) ( CAN_TRAVERSE ?AUTO_11996 ?AUTO_12000 ?AUTO_11998 ) ( AT ?AUTO_11996 ?AUTO_12000 ) ( VISIBLE ?AUTO_12000 ?AUTO_11998 ) ( not ( = ?AUTO_11993 ?AUTO_12000 ) ) ( not ( = ?AUTO_11997 ?AUTO_12000 ) ) ( not ( = ?AUTO_11998 ?AUTO_12000 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11996 ?AUTO_12000 ?AUTO_11998 )
      ( GET_IMAGE_DATA ?AUTO_11991 ?AUTO_11992 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11991 ?AUTO_11992 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_12074 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12078 - LANDER
      ?AUTO_12079 - WAYPOINT
      ?AUTO_12076 - ROVER
      ?AUTO_12075 - STORE
      ?AUTO_12077 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12078 ?AUTO_12079 ) ( VISIBLE ?AUTO_12074 ?AUTO_12079 ) ( AVAILABLE ?AUTO_12076 ) ( CHANNEL_FREE ?AUTO_12078 ) ( not ( = ?AUTO_12074 ?AUTO_12079 ) ) ( AT_SOIL_SAMPLE ?AUTO_12074 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12076 ) ( STORE_OF ?AUTO_12075 ?AUTO_12076 ) ( CAN_TRAVERSE ?AUTO_12076 ?AUTO_12077 ?AUTO_12074 ) ( AT ?AUTO_12076 ?AUTO_12077 ) ( VISIBLE ?AUTO_12077 ?AUTO_12074 ) ( not ( = ?AUTO_12074 ?AUTO_12077 ) ) ( not ( = ?AUTO_12079 ?AUTO_12077 ) ) ( AT_SOIL_SAMPLE ?AUTO_12077 ) ( EMPTY ?AUTO_12075 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_12076 ?AUTO_12075 ?AUTO_12077 )
      ( GET_SOIL_DATA ?AUTO_12074 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_12074 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12204 - OBJECTIVE
      ?AUTO_12205 - MODE
    )
    :vars
    (
      ?AUTO_12211 - LANDER
      ?AUTO_12212 - WAYPOINT
      ?AUTO_12206 - WAYPOINT
      ?AUTO_12209 - ROVER
      ?AUTO_12207 - CAMERA
      ?AUTO_12208 - WAYPOINT
      ?AUTO_12213 - WAYPOINT
      ?AUTO_12210 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12211 ?AUTO_12212 ) ( VISIBLE ?AUTO_12206 ?AUTO_12212 ) ( AVAILABLE ?AUTO_12209 ) ( CHANNEL_FREE ?AUTO_12211 ) ( not ( = ?AUTO_12206 ?AUTO_12212 ) ) ( CAN_TRAVERSE ?AUTO_12209 ?AUTO_12212 ?AUTO_12206 ) ( VISIBLE ?AUTO_12212 ?AUTO_12206 ) ( ON_BOARD ?AUTO_12207 ?AUTO_12209 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12209 ) ( SUPPORTS ?AUTO_12207 ?AUTO_12205 ) ( VISIBLE_FROM ?AUTO_12204 ?AUTO_12212 ) ( CAN_TRAVERSE ?AUTO_12209 ?AUTO_12206 ?AUTO_12212 ) ( CAN_TRAVERSE ?AUTO_12209 ?AUTO_12208 ?AUTO_12206 ) ( VISIBLE ?AUTO_12208 ?AUTO_12206 ) ( not ( = ?AUTO_12212 ?AUTO_12208 ) ) ( not ( = ?AUTO_12206 ?AUTO_12208 ) ) ( CAN_TRAVERSE ?AUTO_12209 ?AUTO_12213 ?AUTO_12208 ) ( VISIBLE ?AUTO_12213 ?AUTO_12208 ) ( not ( = ?AUTO_12212 ?AUTO_12213 ) ) ( not ( = ?AUTO_12206 ?AUTO_12213 ) ) ( not ( = ?AUTO_12208 ?AUTO_12213 ) ) ( CALIBRATION_TARGET ?AUTO_12207 ?AUTO_12210 ) ( VISIBLE_FROM ?AUTO_12210 ?AUTO_12213 ) ( not ( = ?AUTO_12204 ?AUTO_12210 ) ) ( CAN_TRAVERSE ?AUTO_12209 ?AUTO_12206 ?AUTO_12213 ) ( AT ?AUTO_12209 ?AUTO_12206 ) ( VISIBLE ?AUTO_12206 ?AUTO_12213 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12209 ?AUTO_12206 ?AUTO_12213 )
      ( GET_IMAGE_DATA ?AUTO_12204 ?AUTO_12205 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12204 ?AUTO_12205 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12222 - OBJECTIVE
      ?AUTO_12223 - MODE
    )
    :vars
    (
      ?AUTO_12224 - LANDER
      ?AUTO_12229 - WAYPOINT
      ?AUTO_12228 - WAYPOINT
      ?AUTO_12227 - ROVER
      ?AUTO_12225 - CAMERA
      ?AUTO_12226 - WAYPOINT
      ?AUTO_12231 - WAYPOINT
      ?AUTO_12230 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12224 ?AUTO_12229 ) ( VISIBLE ?AUTO_12228 ?AUTO_12229 ) ( AVAILABLE ?AUTO_12227 ) ( CHANNEL_FREE ?AUTO_12224 ) ( not ( = ?AUTO_12228 ?AUTO_12229 ) ) ( CAN_TRAVERSE ?AUTO_12227 ?AUTO_12229 ?AUTO_12228 ) ( VISIBLE ?AUTO_12229 ?AUTO_12228 ) ( ON_BOARD ?AUTO_12225 ?AUTO_12227 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12227 ) ( SUPPORTS ?AUTO_12225 ?AUTO_12223 ) ( VISIBLE_FROM ?AUTO_12222 ?AUTO_12229 ) ( CAN_TRAVERSE ?AUTO_12227 ?AUTO_12228 ?AUTO_12229 ) ( CAN_TRAVERSE ?AUTO_12227 ?AUTO_12226 ?AUTO_12228 ) ( VISIBLE ?AUTO_12226 ?AUTO_12228 ) ( not ( = ?AUTO_12229 ?AUTO_12226 ) ) ( not ( = ?AUTO_12228 ?AUTO_12226 ) ) ( CAN_TRAVERSE ?AUTO_12227 ?AUTO_12231 ?AUTO_12226 ) ( VISIBLE ?AUTO_12231 ?AUTO_12226 ) ( not ( = ?AUTO_12229 ?AUTO_12231 ) ) ( not ( = ?AUTO_12228 ?AUTO_12231 ) ) ( not ( = ?AUTO_12226 ?AUTO_12231 ) ) ( CALIBRATION_TARGET ?AUTO_12225 ?AUTO_12230 ) ( VISIBLE_FROM ?AUTO_12230 ?AUTO_12231 ) ( not ( = ?AUTO_12222 ?AUTO_12230 ) ) ( CAN_TRAVERSE ?AUTO_12227 ?AUTO_12228 ?AUTO_12231 ) ( VISIBLE ?AUTO_12228 ?AUTO_12231 ) ( AT ?AUTO_12227 ?AUTO_12226 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12227 ?AUTO_12226 ?AUTO_12228 )
      ( GET_IMAGE_DATA ?AUTO_12222 ?AUTO_12223 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12222 ?AUTO_12223 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12242 - OBJECTIVE
      ?AUTO_12243 - MODE
    )
    :vars
    (
      ?AUTO_12249 - LANDER
      ?AUTO_12244 - WAYPOINT
      ?AUTO_12251 - WAYPOINT
      ?AUTO_12250 - ROVER
      ?AUTO_12246 - CAMERA
      ?AUTO_12248 - WAYPOINT
      ?AUTO_12245 - WAYPOINT
      ?AUTO_12247 - OBJECTIVE
      ?AUTO_12252 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12249 ?AUTO_12244 ) ( VISIBLE ?AUTO_12251 ?AUTO_12244 ) ( AVAILABLE ?AUTO_12250 ) ( CHANNEL_FREE ?AUTO_12249 ) ( not ( = ?AUTO_12251 ?AUTO_12244 ) ) ( CAN_TRAVERSE ?AUTO_12250 ?AUTO_12244 ?AUTO_12251 ) ( VISIBLE ?AUTO_12244 ?AUTO_12251 ) ( ON_BOARD ?AUTO_12246 ?AUTO_12250 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12250 ) ( SUPPORTS ?AUTO_12246 ?AUTO_12243 ) ( VISIBLE_FROM ?AUTO_12242 ?AUTO_12244 ) ( CAN_TRAVERSE ?AUTO_12250 ?AUTO_12251 ?AUTO_12244 ) ( CAN_TRAVERSE ?AUTO_12250 ?AUTO_12248 ?AUTO_12251 ) ( VISIBLE ?AUTO_12248 ?AUTO_12251 ) ( not ( = ?AUTO_12244 ?AUTO_12248 ) ) ( not ( = ?AUTO_12251 ?AUTO_12248 ) ) ( CAN_TRAVERSE ?AUTO_12250 ?AUTO_12245 ?AUTO_12248 ) ( VISIBLE ?AUTO_12245 ?AUTO_12248 ) ( not ( = ?AUTO_12244 ?AUTO_12245 ) ) ( not ( = ?AUTO_12251 ?AUTO_12245 ) ) ( not ( = ?AUTO_12248 ?AUTO_12245 ) ) ( CALIBRATION_TARGET ?AUTO_12246 ?AUTO_12247 ) ( VISIBLE_FROM ?AUTO_12247 ?AUTO_12245 ) ( not ( = ?AUTO_12242 ?AUTO_12247 ) ) ( CAN_TRAVERSE ?AUTO_12250 ?AUTO_12251 ?AUTO_12245 ) ( VISIBLE ?AUTO_12251 ?AUTO_12245 ) ( CAN_TRAVERSE ?AUTO_12250 ?AUTO_12252 ?AUTO_12248 ) ( AT ?AUTO_12250 ?AUTO_12252 ) ( VISIBLE ?AUTO_12252 ?AUTO_12248 ) ( not ( = ?AUTO_12244 ?AUTO_12252 ) ) ( not ( = ?AUTO_12251 ?AUTO_12252 ) ) ( not ( = ?AUTO_12248 ?AUTO_12252 ) ) ( not ( = ?AUTO_12245 ?AUTO_12252 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12250 ?AUTO_12252 ?AUTO_12248 )
      ( GET_IMAGE_DATA ?AUTO_12242 ?AUTO_12243 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12242 ?AUTO_12243 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_12321 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12325 - LANDER
      ?AUTO_12324 - WAYPOINT
      ?AUTO_12326 - WAYPOINT
      ?AUTO_12323 - ROVER
      ?AUTO_12327 - STORE
      ?AUTO_12322 - WAYPOINT
      ?AUTO_12328 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12325 ?AUTO_12324 ) ( VISIBLE ?AUTO_12326 ?AUTO_12324 ) ( AVAILABLE ?AUTO_12323 ) ( CHANNEL_FREE ?AUTO_12325 ) ( not ( = ?AUTO_12321 ?AUTO_12326 ) ) ( not ( = ?AUTO_12321 ?AUTO_12324 ) ) ( not ( = ?AUTO_12326 ?AUTO_12324 ) ) ( CAN_TRAVERSE ?AUTO_12323 ?AUTO_12321 ?AUTO_12326 ) ( VISIBLE ?AUTO_12321 ?AUTO_12326 ) ( AT_SOIL_SAMPLE ?AUTO_12321 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12323 ) ( STORE_OF ?AUTO_12327 ?AUTO_12323 ) ( EMPTY ?AUTO_12327 ) ( CAN_TRAVERSE ?AUTO_12323 ?AUTO_12322 ?AUTO_12321 ) ( VISIBLE ?AUTO_12322 ?AUTO_12321 ) ( not ( = ?AUTO_12321 ?AUTO_12322 ) ) ( not ( = ?AUTO_12324 ?AUTO_12322 ) ) ( not ( = ?AUTO_12326 ?AUTO_12322 ) ) ( CAN_TRAVERSE ?AUTO_12323 ?AUTO_12326 ?AUTO_12322 ) ( VISIBLE ?AUTO_12326 ?AUTO_12322 ) ( CAN_TRAVERSE ?AUTO_12323 ?AUTO_12328 ?AUTO_12326 ) ( AT ?AUTO_12323 ?AUTO_12328 ) ( VISIBLE ?AUTO_12328 ?AUTO_12326 ) ( not ( = ?AUTO_12321 ?AUTO_12328 ) ) ( not ( = ?AUTO_12324 ?AUTO_12328 ) ) ( not ( = ?AUTO_12326 ?AUTO_12328 ) ) ( not ( = ?AUTO_12322 ?AUTO_12328 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12323 ?AUTO_12328 ?AUTO_12326 )
      ( GET_SOIL_DATA ?AUTO_12321 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_12321 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12371 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12374 - LANDER
      ?AUTO_12376 - WAYPOINT
      ?AUTO_12377 - WAYPOINT
      ?AUTO_12372 - ROVER
      ?AUTO_12373 - STORE
      ?AUTO_12375 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12374 ?AUTO_12376 ) ( VISIBLE ?AUTO_12377 ?AUTO_12376 ) ( AVAILABLE ?AUTO_12372 ) ( CHANNEL_FREE ?AUTO_12374 ) ( not ( = ?AUTO_12371 ?AUTO_12377 ) ) ( not ( = ?AUTO_12371 ?AUTO_12376 ) ) ( not ( = ?AUTO_12377 ?AUTO_12376 ) ) ( CAN_TRAVERSE ?AUTO_12372 ?AUTO_12371 ?AUTO_12377 ) ( VISIBLE ?AUTO_12371 ?AUTO_12377 ) ( AT_ROCK_SAMPLE ?AUTO_12371 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12372 ) ( STORE_OF ?AUTO_12373 ?AUTO_12372 ) ( EMPTY ?AUTO_12373 ) ( CAN_TRAVERSE ?AUTO_12372 ?AUTO_12375 ?AUTO_12371 ) ( VISIBLE ?AUTO_12375 ?AUTO_12371 ) ( not ( = ?AUTO_12371 ?AUTO_12375 ) ) ( not ( = ?AUTO_12376 ?AUTO_12375 ) ) ( not ( = ?AUTO_12377 ?AUTO_12375 ) ) ( CAN_TRAVERSE ?AUTO_12372 ?AUTO_12377 ?AUTO_12375 ) ( AT ?AUTO_12372 ?AUTO_12377 ) ( VISIBLE ?AUTO_12377 ?AUTO_12375 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12372 ?AUTO_12377 ?AUTO_12375 )
      ( GET_ROCK_DATA ?AUTO_12371 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12371 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12403 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12408 - LANDER
      ?AUTO_12406 - WAYPOINT
      ?AUTO_12409 - WAYPOINT
      ?AUTO_12407 - ROVER
      ?AUTO_12405 - STORE
      ?AUTO_12404 - WAYPOINT
      ?AUTO_12410 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12408 ?AUTO_12406 ) ( VISIBLE ?AUTO_12409 ?AUTO_12406 ) ( AVAILABLE ?AUTO_12407 ) ( CHANNEL_FREE ?AUTO_12408 ) ( not ( = ?AUTO_12403 ?AUTO_12409 ) ) ( not ( = ?AUTO_12403 ?AUTO_12406 ) ) ( not ( = ?AUTO_12409 ?AUTO_12406 ) ) ( CAN_TRAVERSE ?AUTO_12407 ?AUTO_12403 ?AUTO_12409 ) ( VISIBLE ?AUTO_12403 ?AUTO_12409 ) ( AT_ROCK_SAMPLE ?AUTO_12403 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12407 ) ( STORE_OF ?AUTO_12405 ?AUTO_12407 ) ( EMPTY ?AUTO_12405 ) ( CAN_TRAVERSE ?AUTO_12407 ?AUTO_12404 ?AUTO_12403 ) ( VISIBLE ?AUTO_12404 ?AUTO_12403 ) ( not ( = ?AUTO_12403 ?AUTO_12404 ) ) ( not ( = ?AUTO_12406 ?AUTO_12404 ) ) ( not ( = ?AUTO_12409 ?AUTO_12404 ) ) ( CAN_TRAVERSE ?AUTO_12407 ?AUTO_12409 ?AUTO_12404 ) ( VISIBLE ?AUTO_12409 ?AUTO_12404 ) ( CAN_TRAVERSE ?AUTO_12407 ?AUTO_12410 ?AUTO_12409 ) ( AT ?AUTO_12407 ?AUTO_12410 ) ( VISIBLE ?AUTO_12410 ?AUTO_12409 ) ( not ( = ?AUTO_12403 ?AUTO_12410 ) ) ( not ( = ?AUTO_12406 ?AUTO_12410 ) ) ( not ( = ?AUTO_12409 ?AUTO_12410 ) ) ( not ( = ?AUTO_12404 ?AUTO_12410 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12407 ?AUTO_12410 ?AUTO_12409 )
      ( GET_ROCK_DATA ?AUTO_12403 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12403 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12507 - OBJECTIVE
      ?AUTO_12508 - MODE
    )
    :vars
    (
      ?AUTO_12514 - LANDER
      ?AUTO_12512 - WAYPOINT
      ?AUTO_12511 - WAYPOINT
      ?AUTO_12515 - ROVER
      ?AUTO_12510 - WAYPOINT
      ?AUTO_12509 - WAYPOINT
      ?AUTO_12513 - CAMERA
      ?AUTO_12516 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12514 ?AUTO_12512 ) ( VISIBLE ?AUTO_12511 ?AUTO_12512 ) ( AVAILABLE ?AUTO_12515 ) ( CHANNEL_FREE ?AUTO_12514 ) ( not ( = ?AUTO_12511 ?AUTO_12512 ) ) ( CAN_TRAVERSE ?AUTO_12515 ?AUTO_12510 ?AUTO_12511 ) ( VISIBLE ?AUTO_12510 ?AUTO_12511 ) ( not ( = ?AUTO_12512 ?AUTO_12510 ) ) ( not ( = ?AUTO_12511 ?AUTO_12510 ) ) ( CAN_TRAVERSE ?AUTO_12515 ?AUTO_12509 ?AUTO_12510 ) ( VISIBLE ?AUTO_12509 ?AUTO_12510 ) ( not ( = ?AUTO_12512 ?AUTO_12509 ) ) ( not ( = ?AUTO_12511 ?AUTO_12509 ) ) ( not ( = ?AUTO_12510 ?AUTO_12509 ) ) ( ON_BOARD ?AUTO_12513 ?AUTO_12515 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12515 ) ( SUPPORTS ?AUTO_12513 ?AUTO_12508 ) ( VISIBLE_FROM ?AUTO_12507 ?AUTO_12509 ) ( CALIBRATION_TARGET ?AUTO_12513 ?AUTO_12507 ) ( CAN_TRAVERSE ?AUTO_12515 ?AUTO_12516 ?AUTO_12509 ) ( AT ?AUTO_12515 ?AUTO_12516 ) ( VISIBLE ?AUTO_12516 ?AUTO_12509 ) ( not ( = ?AUTO_12512 ?AUTO_12516 ) ) ( not ( = ?AUTO_12511 ?AUTO_12516 ) ) ( not ( = ?AUTO_12510 ?AUTO_12516 ) ) ( not ( = ?AUTO_12509 ?AUTO_12516 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12515 ?AUTO_12516 ?AUTO_12509 )
      ( GET_IMAGE_DATA ?AUTO_12507 ?AUTO_12508 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12507 ?AUTO_12508 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12638 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12641 - LANDER
      ?AUTO_12643 - WAYPOINT
      ?AUTO_12639 - ROVER
      ?AUTO_12644 - STORE
      ?AUTO_12640 - WAYPOINT
      ?AUTO_12642 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12641 ?AUTO_12643 ) ( VISIBLE ?AUTO_12638 ?AUTO_12643 ) ( AVAILABLE ?AUTO_12639 ) ( CHANNEL_FREE ?AUTO_12641 ) ( not ( = ?AUTO_12638 ?AUTO_12643 ) ) ( AT_ROCK_SAMPLE ?AUTO_12638 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12639 ) ( STORE_OF ?AUTO_12644 ?AUTO_12639 ) ( CAN_TRAVERSE ?AUTO_12639 ?AUTO_12640 ?AUTO_12638 ) ( VISIBLE ?AUTO_12640 ?AUTO_12638 ) ( not ( = ?AUTO_12638 ?AUTO_12640 ) ) ( not ( = ?AUTO_12643 ?AUTO_12640 ) ) ( CAN_TRAVERSE ?AUTO_12639 ?AUTO_12642 ?AUTO_12640 ) ( AT ?AUTO_12639 ?AUTO_12642 ) ( VISIBLE ?AUTO_12642 ?AUTO_12640 ) ( not ( = ?AUTO_12638 ?AUTO_12642 ) ) ( not ( = ?AUTO_12643 ?AUTO_12642 ) ) ( not ( = ?AUTO_12640 ?AUTO_12642 ) ) ( FULL ?AUTO_12644 ) )
    :subtasks
    ( ( !DROP ?AUTO_12639 ?AUTO_12644 )
      ( GET_ROCK_DATA ?AUTO_12638 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12638 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12699 - OBJECTIVE
      ?AUTO_12700 - MODE
    )
    :vars
    (
      ?AUTO_12703 - LANDER
      ?AUTO_12706 - WAYPOINT
      ?AUTO_12702 - WAYPOINT
      ?AUTO_12701 - ROVER
      ?AUTO_12705 - CAMERA
      ?AUTO_12707 - OBJECTIVE
      ?AUTO_12704 - WAYPOINT
      ?AUTO_12708 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12703 ?AUTO_12706 ) ( VISIBLE ?AUTO_12702 ?AUTO_12706 ) ( AVAILABLE ?AUTO_12701 ) ( CHANNEL_FREE ?AUTO_12703 ) ( not ( = ?AUTO_12702 ?AUTO_12706 ) ) ( ON_BOARD ?AUTO_12705 ?AUTO_12701 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12701 ) ( SUPPORTS ?AUTO_12705 ?AUTO_12700 ) ( VISIBLE_FROM ?AUTO_12699 ?AUTO_12702 ) ( CAN_TRAVERSE ?AUTO_12701 ?AUTO_12706 ?AUTO_12702 ) ( VISIBLE ?AUTO_12706 ?AUTO_12702 ) ( CALIBRATION_TARGET ?AUTO_12705 ?AUTO_12707 ) ( VISIBLE_FROM ?AUTO_12707 ?AUTO_12706 ) ( not ( = ?AUTO_12699 ?AUTO_12707 ) ) ( CAN_TRAVERSE ?AUTO_12701 ?AUTO_12704 ?AUTO_12706 ) ( VISIBLE ?AUTO_12704 ?AUTO_12706 ) ( not ( = ?AUTO_12706 ?AUTO_12704 ) ) ( not ( = ?AUTO_12702 ?AUTO_12704 ) ) ( CAN_TRAVERSE ?AUTO_12701 ?AUTO_12708 ?AUTO_12704 ) ( AT ?AUTO_12701 ?AUTO_12708 ) ( VISIBLE ?AUTO_12708 ?AUTO_12704 ) ( not ( = ?AUTO_12706 ?AUTO_12708 ) ) ( not ( = ?AUTO_12702 ?AUTO_12708 ) ) ( not ( = ?AUTO_12704 ?AUTO_12708 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12701 ?AUTO_12708 ?AUTO_12704 )
      ( GET_IMAGE_DATA ?AUTO_12699 ?AUTO_12700 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12699 ?AUTO_12700 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_12743 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12744 - LANDER
      ?AUTO_12749 - WAYPOINT
      ?AUTO_12745 - ROVER
      ?AUTO_12748 - STORE
      ?AUTO_12746 - WAYPOINT
      ?AUTO_12747 - WAYPOINT
      ?AUTO_12750 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12744 ?AUTO_12749 ) ( VISIBLE ?AUTO_12743 ?AUTO_12749 ) ( AVAILABLE ?AUTO_12745 ) ( CHANNEL_FREE ?AUTO_12744 ) ( not ( = ?AUTO_12743 ?AUTO_12749 ) ) ( AT_SOIL_SAMPLE ?AUTO_12743 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12745 ) ( STORE_OF ?AUTO_12748 ?AUTO_12745 ) ( EMPTY ?AUTO_12748 ) ( CAN_TRAVERSE ?AUTO_12745 ?AUTO_12746 ?AUTO_12743 ) ( VISIBLE ?AUTO_12746 ?AUTO_12743 ) ( not ( = ?AUTO_12743 ?AUTO_12746 ) ) ( not ( = ?AUTO_12749 ?AUTO_12746 ) ) ( CAN_TRAVERSE ?AUTO_12745 ?AUTO_12749 ?AUTO_12746 ) ( VISIBLE ?AUTO_12749 ?AUTO_12746 ) ( CAN_TRAVERSE ?AUTO_12745 ?AUTO_12747 ?AUTO_12749 ) ( VISIBLE ?AUTO_12747 ?AUTO_12749 ) ( not ( = ?AUTO_12743 ?AUTO_12747 ) ) ( not ( = ?AUTO_12749 ?AUTO_12747 ) ) ( not ( = ?AUTO_12746 ?AUTO_12747 ) ) ( CAN_TRAVERSE ?AUTO_12745 ?AUTO_12750 ?AUTO_12747 ) ( AT ?AUTO_12745 ?AUTO_12750 ) ( VISIBLE ?AUTO_12750 ?AUTO_12747 ) ( not ( = ?AUTO_12743 ?AUTO_12750 ) ) ( not ( = ?AUTO_12749 ?AUTO_12750 ) ) ( not ( = ?AUTO_12746 ?AUTO_12750 ) ) ( not ( = ?AUTO_12747 ?AUTO_12750 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12745 ?AUTO_12750 ?AUTO_12747 )
      ( GET_SOIL_DATA ?AUTO_12743 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_12743 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12825 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12829 - LANDER
      ?AUTO_12828 - WAYPOINT
      ?AUTO_12826 - ROVER
      ?AUTO_12831 - STORE
      ?AUTO_12830 - WAYPOINT
      ?AUTO_12827 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12829 ?AUTO_12828 ) ( VISIBLE ?AUTO_12825 ?AUTO_12828 ) ( AVAILABLE ?AUTO_12826 ) ( CHANNEL_FREE ?AUTO_12829 ) ( not ( = ?AUTO_12825 ?AUTO_12828 ) ) ( AT_ROCK_SAMPLE ?AUTO_12825 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12826 ) ( STORE_OF ?AUTO_12831 ?AUTO_12826 ) ( CAN_TRAVERSE ?AUTO_12826 ?AUTO_12830 ?AUTO_12825 ) ( VISIBLE ?AUTO_12830 ?AUTO_12825 ) ( not ( = ?AUTO_12825 ?AUTO_12830 ) ) ( not ( = ?AUTO_12828 ?AUTO_12830 ) ) ( CAN_TRAVERSE ?AUTO_12826 ?AUTO_12827 ?AUTO_12830 ) ( AT ?AUTO_12826 ?AUTO_12827 ) ( VISIBLE ?AUTO_12827 ?AUTO_12830 ) ( not ( = ?AUTO_12825 ?AUTO_12827 ) ) ( not ( = ?AUTO_12828 ?AUTO_12827 ) ) ( not ( = ?AUTO_12830 ?AUTO_12827 ) ) ( AT_SOIL_SAMPLE ?AUTO_12827 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12826 ) ( EMPTY ?AUTO_12831 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_12826 ?AUTO_12831 ?AUTO_12827 )
      ( GET_ROCK_DATA ?AUTO_12825 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12825 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12842 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12847 - LANDER
      ?AUTO_12845 - WAYPOINT
      ?AUTO_12848 - ROVER
      ?AUTO_12843 - STORE
      ?AUTO_12844 - WAYPOINT
      ?AUTO_12849 - WAYPOINT
      ?AUTO_12846 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12847 ?AUTO_12845 ) ( VISIBLE ?AUTO_12842 ?AUTO_12845 ) ( AVAILABLE ?AUTO_12848 ) ( CHANNEL_FREE ?AUTO_12847 ) ( not ( = ?AUTO_12842 ?AUTO_12845 ) ) ( AT_ROCK_SAMPLE ?AUTO_12842 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12848 ) ( STORE_OF ?AUTO_12843 ?AUTO_12848 ) ( CAN_TRAVERSE ?AUTO_12848 ?AUTO_12844 ?AUTO_12842 ) ( VISIBLE ?AUTO_12844 ?AUTO_12842 ) ( not ( = ?AUTO_12842 ?AUTO_12844 ) ) ( not ( = ?AUTO_12845 ?AUTO_12844 ) ) ( CAN_TRAVERSE ?AUTO_12848 ?AUTO_12849 ?AUTO_12844 ) ( VISIBLE ?AUTO_12849 ?AUTO_12844 ) ( not ( = ?AUTO_12842 ?AUTO_12849 ) ) ( not ( = ?AUTO_12845 ?AUTO_12849 ) ) ( not ( = ?AUTO_12844 ?AUTO_12849 ) ) ( AT_SOIL_SAMPLE ?AUTO_12849 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12848 ) ( EMPTY ?AUTO_12843 ) ( CAN_TRAVERSE ?AUTO_12848 ?AUTO_12846 ?AUTO_12849 ) ( VISIBLE ?AUTO_12846 ?AUTO_12849 ) ( not ( = ?AUTO_12842 ?AUTO_12846 ) ) ( not ( = ?AUTO_12845 ?AUTO_12846 ) ) ( not ( = ?AUTO_12844 ?AUTO_12846 ) ) ( not ( = ?AUTO_12849 ?AUTO_12846 ) ) ( CAN_TRAVERSE ?AUTO_12848 ?AUTO_12845 ?AUTO_12846 ) ( AT ?AUTO_12848 ?AUTO_12845 ) ( VISIBLE ?AUTO_12845 ?AUTO_12846 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12848 ?AUTO_12845 ?AUTO_12846 )
      ( GET_ROCK_DATA ?AUTO_12842 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12842 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12854 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12856 - LANDER
      ?AUTO_12858 - WAYPOINT
      ?AUTO_12855 - ROVER
      ?AUTO_12859 - STORE
      ?AUTO_12857 - WAYPOINT
      ?AUTO_12860 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12856 ?AUTO_12858 ) ( VISIBLE ?AUTO_12854 ?AUTO_12858 ) ( AVAILABLE ?AUTO_12855 ) ( CHANNEL_FREE ?AUTO_12856 ) ( not ( = ?AUTO_12854 ?AUTO_12858 ) ) ( AT_ROCK_SAMPLE ?AUTO_12854 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12855 ) ( STORE_OF ?AUTO_12859 ?AUTO_12855 ) ( CAN_TRAVERSE ?AUTO_12855 ?AUTO_12857 ?AUTO_12854 ) ( VISIBLE ?AUTO_12857 ?AUTO_12854 ) ( not ( = ?AUTO_12854 ?AUTO_12857 ) ) ( not ( = ?AUTO_12858 ?AUTO_12857 ) ) ( CAN_TRAVERSE ?AUTO_12855 ?AUTO_12860 ?AUTO_12857 ) ( VISIBLE ?AUTO_12860 ?AUTO_12857 ) ( not ( = ?AUTO_12854 ?AUTO_12860 ) ) ( not ( = ?AUTO_12858 ?AUTO_12860 ) ) ( not ( = ?AUTO_12857 ?AUTO_12860 ) ) ( AT_SOIL_SAMPLE ?AUTO_12860 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12855 ) ( EMPTY ?AUTO_12859 ) ( CAN_TRAVERSE ?AUTO_12855 ?AUTO_12857 ?AUTO_12860 ) ( AT ?AUTO_12855 ?AUTO_12857 ) ( VISIBLE ?AUTO_12857 ?AUTO_12860 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12855 ?AUTO_12857 ?AUTO_12860 )
      ( GET_ROCK_DATA ?AUTO_12854 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12854 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_12910 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12913 - LANDER
      ?AUTO_12911 - WAYPOINT
      ?AUTO_12915 - ROVER
      ?AUTO_12912 - STORE
      ?AUTO_12914 - WAYPOINT
      ?AUTO_12916 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12913 ?AUTO_12910 ) ( VISIBLE ?AUTO_12911 ?AUTO_12910 ) ( AVAILABLE ?AUTO_12915 ) ( CHANNEL_FREE ?AUTO_12913 ) ( not ( = ?AUTO_12910 ?AUTO_12911 ) ) ( CAN_TRAVERSE ?AUTO_12915 ?AUTO_12910 ?AUTO_12911 ) ( VISIBLE ?AUTO_12910 ?AUTO_12911 ) ( AT_SOIL_SAMPLE ?AUTO_12910 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12915 ) ( STORE_OF ?AUTO_12912 ?AUTO_12915 ) ( CAN_TRAVERSE ?AUTO_12915 ?AUTO_12911 ?AUTO_12910 ) ( CAN_TRAVERSE ?AUTO_12915 ?AUTO_12914 ?AUTO_12911 ) ( VISIBLE ?AUTO_12914 ?AUTO_12911 ) ( not ( = ?AUTO_12910 ?AUTO_12914 ) ) ( not ( = ?AUTO_12911 ?AUTO_12914 ) ) ( CAN_TRAVERSE ?AUTO_12915 ?AUTO_12916 ?AUTO_12914 ) ( AT ?AUTO_12915 ?AUTO_12916 ) ( VISIBLE ?AUTO_12916 ?AUTO_12914 ) ( not ( = ?AUTO_12910 ?AUTO_12916 ) ) ( not ( = ?AUTO_12911 ?AUTO_12916 ) ) ( not ( = ?AUTO_12914 ?AUTO_12916 ) ) ( AT_SOIL_SAMPLE ?AUTO_12916 ) ( EMPTY ?AUTO_12912 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_12915 ?AUTO_12912 ?AUTO_12916 )
      ( GET_SOIL_DATA ?AUTO_12910 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_12910 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_12925 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12929 - LANDER
      ?AUTO_12927 - WAYPOINT
      ?AUTO_12930 - ROVER
      ?AUTO_12931 - STORE
      ?AUTO_12928 - WAYPOINT
      ?AUTO_12926 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12929 ?AUTO_12925 ) ( VISIBLE ?AUTO_12927 ?AUTO_12925 ) ( AVAILABLE ?AUTO_12930 ) ( CHANNEL_FREE ?AUTO_12929 ) ( not ( = ?AUTO_12925 ?AUTO_12927 ) ) ( CAN_TRAVERSE ?AUTO_12930 ?AUTO_12925 ?AUTO_12927 ) ( VISIBLE ?AUTO_12925 ?AUTO_12927 ) ( AT_SOIL_SAMPLE ?AUTO_12925 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12930 ) ( STORE_OF ?AUTO_12931 ?AUTO_12930 ) ( CAN_TRAVERSE ?AUTO_12930 ?AUTO_12927 ?AUTO_12925 ) ( CAN_TRAVERSE ?AUTO_12930 ?AUTO_12928 ?AUTO_12927 ) ( VISIBLE ?AUTO_12928 ?AUTO_12927 ) ( not ( = ?AUTO_12925 ?AUTO_12928 ) ) ( not ( = ?AUTO_12927 ?AUTO_12928 ) ) ( CAN_TRAVERSE ?AUTO_12930 ?AUTO_12926 ?AUTO_12928 ) ( VISIBLE ?AUTO_12926 ?AUTO_12928 ) ( not ( = ?AUTO_12925 ?AUTO_12926 ) ) ( not ( = ?AUTO_12927 ?AUTO_12926 ) ) ( not ( = ?AUTO_12928 ?AUTO_12926 ) ) ( AT_SOIL_SAMPLE ?AUTO_12926 ) ( EMPTY ?AUTO_12931 ) ( CAN_TRAVERSE ?AUTO_12930 ?AUTO_12928 ?AUTO_12926 ) ( AT ?AUTO_12930 ?AUTO_12928 ) ( VISIBLE ?AUTO_12928 ?AUTO_12926 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12930 ?AUTO_12928 ?AUTO_12926 )
      ( GET_SOIL_DATA ?AUTO_12925 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_12925 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13236 - OBJECTIVE
      ?AUTO_13237 - MODE
    )
    :vars
    (
      ?AUTO_13241 - LANDER
      ?AUTO_13243 - WAYPOINT
      ?AUTO_13242 - WAYPOINT
      ?AUTO_13244 - ROVER
      ?AUTO_13245 - CAMERA
      ?AUTO_13240 - WAYPOINT
      ?AUTO_13239 - WAYPOINT
      ?AUTO_13238 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13241 ?AUTO_13243 ) ( VISIBLE ?AUTO_13242 ?AUTO_13243 ) ( AVAILABLE ?AUTO_13244 ) ( CHANNEL_FREE ?AUTO_13241 ) ( not ( = ?AUTO_13242 ?AUTO_13243 ) ) ( ON_BOARD ?AUTO_13245 ?AUTO_13244 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13244 ) ( SUPPORTS ?AUTO_13245 ?AUTO_13237 ) ( VISIBLE_FROM ?AUTO_13236 ?AUTO_13242 ) ( CAN_TRAVERSE ?AUTO_13244 ?AUTO_13240 ?AUTO_13242 ) ( VISIBLE ?AUTO_13240 ?AUTO_13242 ) ( not ( = ?AUTO_13243 ?AUTO_13240 ) ) ( not ( = ?AUTO_13242 ?AUTO_13240 ) ) ( CAN_TRAVERSE ?AUTO_13244 ?AUTO_13239 ?AUTO_13240 ) ( VISIBLE ?AUTO_13239 ?AUTO_13240 ) ( not ( = ?AUTO_13243 ?AUTO_13239 ) ) ( not ( = ?AUTO_13242 ?AUTO_13239 ) ) ( not ( = ?AUTO_13240 ?AUTO_13239 ) ) ( CALIBRATION_TARGET ?AUTO_13245 ?AUTO_13238 ) ( VISIBLE_FROM ?AUTO_13238 ?AUTO_13239 ) ( not ( = ?AUTO_13236 ?AUTO_13238 ) ) ( CAN_TRAVERSE ?AUTO_13244 ?AUTO_13242 ?AUTO_13239 ) ( VISIBLE ?AUTO_13242 ?AUTO_13239 ) ( AT ?AUTO_13244 ?AUTO_13240 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13244 ?AUTO_13240 ?AUTO_13242 )
      ( GET_IMAGE_DATA ?AUTO_13236 ?AUTO_13237 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13236 ?AUTO_13237 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13246 - OBJECTIVE
      ?AUTO_13247 - MODE
    )
    :vars
    (
      ?AUTO_13249 - LANDER
      ?AUTO_13252 - WAYPOINT
      ?AUTO_13251 - WAYPOINT
      ?AUTO_13255 - ROVER
      ?AUTO_13250 - CAMERA
      ?AUTO_13248 - WAYPOINT
      ?AUTO_13253 - WAYPOINT
      ?AUTO_13254 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13249 ?AUTO_13252 ) ( VISIBLE ?AUTO_13251 ?AUTO_13252 ) ( AVAILABLE ?AUTO_13255 ) ( CHANNEL_FREE ?AUTO_13249 ) ( not ( = ?AUTO_13251 ?AUTO_13252 ) ) ( ON_BOARD ?AUTO_13250 ?AUTO_13255 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13255 ) ( SUPPORTS ?AUTO_13250 ?AUTO_13247 ) ( VISIBLE_FROM ?AUTO_13246 ?AUTO_13251 ) ( CAN_TRAVERSE ?AUTO_13255 ?AUTO_13248 ?AUTO_13251 ) ( VISIBLE ?AUTO_13248 ?AUTO_13251 ) ( not ( = ?AUTO_13252 ?AUTO_13248 ) ) ( not ( = ?AUTO_13251 ?AUTO_13248 ) ) ( CAN_TRAVERSE ?AUTO_13255 ?AUTO_13253 ?AUTO_13248 ) ( VISIBLE ?AUTO_13253 ?AUTO_13248 ) ( not ( = ?AUTO_13252 ?AUTO_13253 ) ) ( not ( = ?AUTO_13251 ?AUTO_13253 ) ) ( not ( = ?AUTO_13248 ?AUTO_13253 ) ) ( CALIBRATION_TARGET ?AUTO_13250 ?AUTO_13254 ) ( VISIBLE_FROM ?AUTO_13254 ?AUTO_13253 ) ( not ( = ?AUTO_13246 ?AUTO_13254 ) ) ( CAN_TRAVERSE ?AUTO_13255 ?AUTO_13251 ?AUTO_13253 ) ( VISIBLE ?AUTO_13251 ?AUTO_13253 ) ( CAN_TRAVERSE ?AUTO_13255 ?AUTO_13252 ?AUTO_13248 ) ( AT ?AUTO_13255 ?AUTO_13252 ) ( VISIBLE ?AUTO_13252 ?AUTO_13248 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13255 ?AUTO_13252 ?AUTO_13248 )
      ( GET_IMAGE_DATA ?AUTO_13246 ?AUTO_13247 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13246 ?AUTO_13247 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13327 - OBJECTIVE
      ?AUTO_13326 - MODE
    )
    :vars
    (
      ?AUTO_13329 - LANDER
      ?AUTO_13328 - WAYPOINT
      ?AUTO_13330 - WAYPOINT
      ?AUTO_13331 - ROVER
      ?AUTO_13333 - CAMERA
      ?AUTO_13335 - WAYPOINT
      ?AUTO_13332 - WAYPOINT
      ?AUTO_13334 - WAYPOINT
      ?AUTO_13336 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13329 ?AUTO_13328 ) ( VISIBLE ?AUTO_13330 ?AUTO_13328 ) ( AVAILABLE ?AUTO_13331 ) ( CHANNEL_FREE ?AUTO_13329 ) ( not ( = ?AUTO_13330 ?AUTO_13328 ) ) ( ON_BOARD ?AUTO_13333 ?AUTO_13331 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13331 ) ( SUPPORTS ?AUTO_13333 ?AUTO_13326 ) ( VISIBLE_FROM ?AUTO_13327 ?AUTO_13330 ) ( CAN_TRAVERSE ?AUTO_13331 ?AUTO_13335 ?AUTO_13330 ) ( VISIBLE ?AUTO_13335 ?AUTO_13330 ) ( not ( = ?AUTO_13328 ?AUTO_13335 ) ) ( not ( = ?AUTO_13330 ?AUTO_13335 ) ) ( CAN_TRAVERSE ?AUTO_13331 ?AUTO_13332 ?AUTO_13335 ) ( VISIBLE ?AUTO_13332 ?AUTO_13335 ) ( not ( = ?AUTO_13328 ?AUTO_13332 ) ) ( not ( = ?AUTO_13330 ?AUTO_13332 ) ) ( not ( = ?AUTO_13335 ?AUTO_13332 ) ) ( CAN_TRAVERSE ?AUTO_13331 ?AUTO_13334 ?AUTO_13332 ) ( AT ?AUTO_13331 ?AUTO_13334 ) ( VISIBLE ?AUTO_13334 ?AUTO_13332 ) ( not ( = ?AUTO_13328 ?AUTO_13334 ) ) ( not ( = ?AUTO_13330 ?AUTO_13334 ) ) ( not ( = ?AUTO_13335 ?AUTO_13334 ) ) ( not ( = ?AUTO_13332 ?AUTO_13334 ) ) ( CALIBRATION_TARGET ?AUTO_13333 ?AUTO_13336 ) ( VISIBLE_FROM ?AUTO_13336 ?AUTO_13334 ) ( not ( = ?AUTO_13327 ?AUTO_13336 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_13331 ?AUTO_13333 ?AUTO_13336 ?AUTO_13334 )
      ( GET_IMAGE_DATA ?AUTO_13327 ?AUTO_13326 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13327 ?AUTO_13326 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13338 - OBJECTIVE
      ?AUTO_13337 - MODE
    )
    :vars
    (
      ?AUTO_13343 - LANDER
      ?AUTO_13346 - WAYPOINT
      ?AUTO_13339 - WAYPOINT
      ?AUTO_13341 - ROVER
      ?AUTO_13345 - CAMERA
      ?AUTO_13342 - WAYPOINT
      ?AUTO_13340 - WAYPOINT
      ?AUTO_13344 - WAYPOINT
      ?AUTO_13347 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13343 ?AUTO_13346 ) ( VISIBLE ?AUTO_13339 ?AUTO_13346 ) ( AVAILABLE ?AUTO_13341 ) ( CHANNEL_FREE ?AUTO_13343 ) ( not ( = ?AUTO_13339 ?AUTO_13346 ) ) ( ON_BOARD ?AUTO_13345 ?AUTO_13341 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13341 ) ( SUPPORTS ?AUTO_13345 ?AUTO_13337 ) ( VISIBLE_FROM ?AUTO_13338 ?AUTO_13339 ) ( CAN_TRAVERSE ?AUTO_13341 ?AUTO_13342 ?AUTO_13339 ) ( VISIBLE ?AUTO_13342 ?AUTO_13339 ) ( not ( = ?AUTO_13346 ?AUTO_13342 ) ) ( not ( = ?AUTO_13339 ?AUTO_13342 ) ) ( CAN_TRAVERSE ?AUTO_13341 ?AUTO_13340 ?AUTO_13342 ) ( VISIBLE ?AUTO_13340 ?AUTO_13342 ) ( not ( = ?AUTO_13346 ?AUTO_13340 ) ) ( not ( = ?AUTO_13339 ?AUTO_13340 ) ) ( not ( = ?AUTO_13342 ?AUTO_13340 ) ) ( CAN_TRAVERSE ?AUTO_13341 ?AUTO_13344 ?AUTO_13340 ) ( VISIBLE ?AUTO_13344 ?AUTO_13340 ) ( not ( = ?AUTO_13346 ?AUTO_13344 ) ) ( not ( = ?AUTO_13339 ?AUTO_13344 ) ) ( not ( = ?AUTO_13342 ?AUTO_13344 ) ) ( not ( = ?AUTO_13340 ?AUTO_13344 ) ) ( CALIBRATION_TARGET ?AUTO_13345 ?AUTO_13347 ) ( VISIBLE_FROM ?AUTO_13347 ?AUTO_13344 ) ( not ( = ?AUTO_13338 ?AUTO_13347 ) ) ( CAN_TRAVERSE ?AUTO_13341 ?AUTO_13342 ?AUTO_13344 ) ( AT ?AUTO_13341 ?AUTO_13342 ) ( VISIBLE ?AUTO_13342 ?AUTO_13344 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13341 ?AUTO_13342 ?AUTO_13344 )
      ( GET_IMAGE_DATA ?AUTO_13338 ?AUTO_13337 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13338 ?AUTO_13337 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13359 - OBJECTIVE
      ?AUTO_13358 - MODE
    )
    :vars
    (
      ?AUTO_13363 - LANDER
      ?AUTO_13367 - WAYPOINT
      ?AUTO_13364 - WAYPOINT
      ?AUTO_13368 - ROVER
      ?AUTO_13361 - CAMERA
      ?AUTO_13366 - WAYPOINT
      ?AUTO_13365 - WAYPOINT
      ?AUTO_13362 - WAYPOINT
      ?AUTO_13360 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13363 ?AUTO_13367 ) ( VISIBLE ?AUTO_13364 ?AUTO_13367 ) ( AVAILABLE ?AUTO_13368 ) ( CHANNEL_FREE ?AUTO_13363 ) ( not ( = ?AUTO_13364 ?AUTO_13367 ) ) ( ON_BOARD ?AUTO_13361 ?AUTO_13368 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13368 ) ( SUPPORTS ?AUTO_13361 ?AUTO_13358 ) ( VISIBLE_FROM ?AUTO_13359 ?AUTO_13364 ) ( CAN_TRAVERSE ?AUTO_13368 ?AUTO_13366 ?AUTO_13364 ) ( VISIBLE ?AUTO_13366 ?AUTO_13364 ) ( not ( = ?AUTO_13367 ?AUTO_13366 ) ) ( not ( = ?AUTO_13364 ?AUTO_13366 ) ) ( CAN_TRAVERSE ?AUTO_13368 ?AUTO_13365 ?AUTO_13366 ) ( VISIBLE ?AUTO_13365 ?AUTO_13366 ) ( not ( = ?AUTO_13367 ?AUTO_13365 ) ) ( not ( = ?AUTO_13364 ?AUTO_13365 ) ) ( not ( = ?AUTO_13366 ?AUTO_13365 ) ) ( CAN_TRAVERSE ?AUTO_13368 ?AUTO_13362 ?AUTO_13365 ) ( VISIBLE ?AUTO_13362 ?AUTO_13365 ) ( not ( = ?AUTO_13367 ?AUTO_13362 ) ) ( not ( = ?AUTO_13364 ?AUTO_13362 ) ) ( not ( = ?AUTO_13366 ?AUTO_13362 ) ) ( not ( = ?AUTO_13365 ?AUTO_13362 ) ) ( CALIBRATION_TARGET ?AUTO_13361 ?AUTO_13360 ) ( VISIBLE_FROM ?AUTO_13360 ?AUTO_13362 ) ( not ( = ?AUTO_13359 ?AUTO_13360 ) ) ( CAN_TRAVERSE ?AUTO_13368 ?AUTO_13366 ?AUTO_13362 ) ( VISIBLE ?AUTO_13366 ?AUTO_13362 ) ( CAN_TRAVERSE ?AUTO_13368 ?AUTO_13364 ?AUTO_13366 ) ( AT ?AUTO_13368 ?AUTO_13364 ) ( VISIBLE ?AUTO_13364 ?AUTO_13366 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13368 ?AUTO_13364 ?AUTO_13366 )
      ( GET_IMAGE_DATA ?AUTO_13359 ?AUTO_13358 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13359 ?AUTO_13358 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_13517 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13519 - LANDER
      ?AUTO_13518 - WAYPOINT
      ?AUTO_13522 - WAYPOINT
      ?AUTO_13521 - ROVER
      ?AUTO_13520 - STORE
      ?AUTO_13523 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13519 ?AUTO_13518 ) ( VISIBLE ?AUTO_13522 ?AUTO_13518 ) ( AVAILABLE ?AUTO_13521 ) ( CHANNEL_FREE ?AUTO_13519 ) ( not ( = ?AUTO_13517 ?AUTO_13522 ) ) ( not ( = ?AUTO_13517 ?AUTO_13518 ) ) ( not ( = ?AUTO_13522 ?AUTO_13518 ) ) ( CAN_TRAVERSE ?AUTO_13521 ?AUTO_13517 ?AUTO_13522 ) ( VISIBLE ?AUTO_13517 ?AUTO_13522 ) ( AT_ROCK_SAMPLE ?AUTO_13517 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_13521 ) ( STORE_OF ?AUTO_13520 ?AUTO_13521 ) ( CAN_TRAVERSE ?AUTO_13521 ?AUTO_13522 ?AUTO_13517 ) ( VISIBLE ?AUTO_13522 ?AUTO_13517 ) ( FULL ?AUTO_13520 ) ( CAN_TRAVERSE ?AUTO_13521 ?AUTO_13523 ?AUTO_13522 ) ( AT ?AUTO_13521 ?AUTO_13523 ) ( VISIBLE ?AUTO_13523 ?AUTO_13522 ) ( not ( = ?AUTO_13517 ?AUTO_13523 ) ) ( not ( = ?AUTO_13518 ?AUTO_13523 ) ) ( not ( = ?AUTO_13522 ?AUTO_13523 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13521 ?AUTO_13523 ?AUTO_13522 )
      ( GET_ROCK_DATA ?AUTO_13517 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_13517 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_13533 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13534 - LANDER
      ?AUTO_13538 - WAYPOINT
      ?AUTO_13536 - WAYPOINT
      ?AUTO_13535 - ROVER
      ?AUTO_13539 - STORE
      ?AUTO_13537 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13534 ?AUTO_13538 ) ( VISIBLE ?AUTO_13536 ?AUTO_13538 ) ( AVAILABLE ?AUTO_13535 ) ( CHANNEL_FREE ?AUTO_13534 ) ( not ( = ?AUTO_13533 ?AUTO_13536 ) ) ( not ( = ?AUTO_13533 ?AUTO_13538 ) ) ( not ( = ?AUTO_13536 ?AUTO_13538 ) ) ( CAN_TRAVERSE ?AUTO_13535 ?AUTO_13533 ?AUTO_13536 ) ( VISIBLE ?AUTO_13533 ?AUTO_13536 ) ( AT_ROCK_SAMPLE ?AUTO_13533 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_13535 ) ( STORE_OF ?AUTO_13539 ?AUTO_13535 ) ( CAN_TRAVERSE ?AUTO_13535 ?AUTO_13536 ?AUTO_13533 ) ( VISIBLE ?AUTO_13536 ?AUTO_13533 ) ( CAN_TRAVERSE ?AUTO_13535 ?AUTO_13537 ?AUTO_13536 ) ( AT ?AUTO_13535 ?AUTO_13537 ) ( VISIBLE ?AUTO_13537 ?AUTO_13536 ) ( not ( = ?AUTO_13533 ?AUTO_13537 ) ) ( not ( = ?AUTO_13538 ?AUTO_13537 ) ) ( not ( = ?AUTO_13536 ?AUTO_13537 ) ) ( AT_SOIL_SAMPLE ?AUTO_13537 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_13535 ) ( EMPTY ?AUTO_13539 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_13535 ?AUTO_13539 ?AUTO_13537 )
      ( GET_ROCK_DATA ?AUTO_13533 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_13533 ) )
  )

)

