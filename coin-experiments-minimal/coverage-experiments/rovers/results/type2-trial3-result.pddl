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
      ?AUTO_28 - WAYPOINT
      ?AUTO_27 - ROVER
      ?AUTO_26 - CAMERA
      ?AUTO_29 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_24 ?AUTO_25 ) ( VISIBLE ?AUTO_28 ?AUTO_25 ) ( AVAILABLE ?AUTO_27 ) ( CHANNEL_FREE ?AUTO_24 ) ( not ( = ?AUTO_28 ?AUTO_25 ) ) ( ON_BOARD ?AUTO_26 ?AUTO_27 ) ( EQUIPPED_FOR_IMAGING ?AUTO_27 ) ( SUPPORTS ?AUTO_26 ?AUTO_23 ) ( VISIBLE_FROM ?AUTO_22 ?AUTO_28 ) ( CALIBRATION_TARGET ?AUTO_26 ?AUTO_22 ) ( CAN_TRAVERSE ?AUTO_27 ?AUTO_29 ?AUTO_28 ) ( AT ?AUTO_27 ?AUTO_29 ) ( VISIBLE ?AUTO_29 ?AUTO_28 ) ( not ( = ?AUTO_25 ?AUTO_29 ) ) ( not ( = ?AUTO_28 ?AUTO_29 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_27 ?AUTO_29 ?AUTO_28 )
      ( GET_IMAGE_DATA ?AUTO_22 ?AUTO_23 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_22 ?AUTO_23 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_30 - OBJECTIVE
      ?AUTO_31 - MODE
    )
    :vars
    (
      ?AUTO_36 - LANDER
      ?AUTO_33 - WAYPOINT
      ?AUTO_35 - WAYPOINT
      ?AUTO_34 - ROVER
      ?AUTO_32 - CAMERA
      ?AUTO_37 - WAYPOINT
      ?AUTO_38 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_36 ?AUTO_33 ) ( VISIBLE ?AUTO_35 ?AUTO_33 ) ( AVAILABLE ?AUTO_34 ) ( CHANNEL_FREE ?AUTO_36 ) ( not ( = ?AUTO_35 ?AUTO_33 ) ) ( ON_BOARD ?AUTO_32 ?AUTO_34 ) ( EQUIPPED_FOR_IMAGING ?AUTO_34 ) ( SUPPORTS ?AUTO_32 ?AUTO_31 ) ( VISIBLE_FROM ?AUTO_30 ?AUTO_35 ) ( CALIBRATION_TARGET ?AUTO_32 ?AUTO_30 ) ( CAN_TRAVERSE ?AUTO_34 ?AUTO_37 ?AUTO_35 ) ( VISIBLE ?AUTO_37 ?AUTO_35 ) ( not ( = ?AUTO_33 ?AUTO_37 ) ) ( not ( = ?AUTO_35 ?AUTO_37 ) ) ( CAN_TRAVERSE ?AUTO_34 ?AUTO_38 ?AUTO_37 ) ( AT ?AUTO_34 ?AUTO_38 ) ( VISIBLE ?AUTO_38 ?AUTO_37 ) ( not ( = ?AUTO_33 ?AUTO_38 ) ) ( not ( = ?AUTO_35 ?AUTO_38 ) ) ( not ( = ?AUTO_37 ?AUTO_38 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_34 ?AUTO_38 ?AUTO_37 )
      ( GET_IMAGE_DATA ?AUTO_30 ?AUTO_31 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_30 ?AUTO_31 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_61 - OBJECTIVE
      ?AUTO_62 - MODE
    )
    :vars
    (
      ?AUTO_65 - LANDER
      ?AUTO_66 - WAYPOINT
      ?AUTO_67 - WAYPOINT
      ?AUTO_63 - ROVER
      ?AUTO_64 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_65 ?AUTO_66 ) ( VISIBLE ?AUTO_67 ?AUTO_66 ) ( AVAILABLE ?AUTO_63 ) ( CHANNEL_FREE ?AUTO_65 ) ( not ( = ?AUTO_67 ?AUTO_66 ) ) ( ON_BOARD ?AUTO_64 ?AUTO_63 ) ( EQUIPPED_FOR_IMAGING ?AUTO_63 ) ( SUPPORTS ?AUTO_64 ?AUTO_62 ) ( VISIBLE_FROM ?AUTO_61 ?AUTO_67 ) ( CALIBRATION_TARGET ?AUTO_64 ?AUTO_61 ) ( CAN_TRAVERSE ?AUTO_63 ?AUTO_66 ?AUTO_67 ) ( AT ?AUTO_63 ?AUTO_66 ) ( VISIBLE ?AUTO_66 ?AUTO_67 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_63 ?AUTO_66 ?AUTO_67 )
      ( GET_IMAGE_DATA ?AUTO_61 ?AUTO_62 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_61 ?AUTO_62 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_68 - OBJECTIVE
      ?AUTO_69 - MODE
    )
    :vars
    (
      ?AUTO_73 - LANDER
      ?AUTO_70 - WAYPOINT
      ?AUTO_71 - WAYPOINT
      ?AUTO_72 - ROVER
      ?AUTO_74 - CAMERA
      ?AUTO_75 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_73 ?AUTO_70 ) ( VISIBLE ?AUTO_71 ?AUTO_70 ) ( AVAILABLE ?AUTO_72 ) ( CHANNEL_FREE ?AUTO_73 ) ( not ( = ?AUTO_71 ?AUTO_70 ) ) ( ON_BOARD ?AUTO_74 ?AUTO_72 ) ( EQUIPPED_FOR_IMAGING ?AUTO_72 ) ( SUPPORTS ?AUTO_74 ?AUTO_69 ) ( VISIBLE_FROM ?AUTO_68 ?AUTO_71 ) ( CALIBRATION_TARGET ?AUTO_74 ?AUTO_68 ) ( CAN_TRAVERSE ?AUTO_72 ?AUTO_70 ?AUTO_71 ) ( VISIBLE ?AUTO_70 ?AUTO_71 ) ( CAN_TRAVERSE ?AUTO_72 ?AUTO_75 ?AUTO_70 ) ( AT ?AUTO_72 ?AUTO_75 ) ( VISIBLE ?AUTO_75 ?AUTO_70 ) ( not ( = ?AUTO_70 ?AUTO_75 ) ) ( not ( = ?AUTO_71 ?AUTO_75 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_72 ?AUTO_75 ?AUTO_70 )
      ( GET_IMAGE_DATA ?AUTO_68 ?AUTO_69 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_68 ?AUTO_69 ) )
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
      ?AUTO_79 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_78 ?AUTO_77 ) ( AT_LANDER ?AUTO_80 ?AUTO_79 ) ( HAVE_ROCK_ANALYSIS ?AUTO_78 ?AUTO_77 ) ( VISIBLE ?AUTO_77 ?AUTO_79 ) ( AVAILABLE ?AUTO_78 ) ( CHANNEL_FREE ?AUTO_80 ) ( not ( = ?AUTO_77 ?AUTO_79 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_78 ?AUTO_80 ?AUTO_77 ?AUTO_77 ?AUTO_79 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_77 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_81 - WAYPOINT
    )
    :vars
    (
      ?AUTO_82 - ROVER
      ?AUTO_84 - LANDER
      ?AUTO_83 - WAYPOINT
      ?AUTO_85 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_82 ?AUTO_81 ) ( AT_LANDER ?AUTO_84 ?AUTO_83 ) ( VISIBLE ?AUTO_81 ?AUTO_83 ) ( AVAILABLE ?AUTO_82 ) ( CHANNEL_FREE ?AUTO_84 ) ( not ( = ?AUTO_81 ?AUTO_83 ) ) ( AT_ROCK_SAMPLE ?AUTO_81 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_82 ) ( STORE_OF ?AUTO_85 ?AUTO_82 ) ( EMPTY ?AUTO_85 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_82 ?AUTO_85 ?AUTO_81 )
      ( GET_ROCK_DATA ?AUTO_81 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_81 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_89 - WAYPOINT
    )
    :vars
    (
      ?AUTO_92 - LANDER
      ?AUTO_93 - WAYPOINT
      ?AUTO_91 - ROVER
      ?AUTO_90 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_92 ?AUTO_93 ) ( VISIBLE ?AUTO_89 ?AUTO_93 ) ( AVAILABLE ?AUTO_91 ) ( CHANNEL_FREE ?AUTO_92 ) ( not ( = ?AUTO_89 ?AUTO_93 ) ) ( AT_ROCK_SAMPLE ?AUTO_89 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_91 ) ( STORE_OF ?AUTO_90 ?AUTO_91 ) ( EMPTY ?AUTO_90 ) ( CAN_TRAVERSE ?AUTO_91 ?AUTO_93 ?AUTO_89 ) ( AT ?AUTO_91 ?AUTO_93 ) ( VISIBLE ?AUTO_93 ?AUTO_89 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_91 ?AUTO_93 ?AUTO_89 )
      ( GET_ROCK_DATA ?AUTO_89 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_89 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_94 - WAYPOINT
    )
    :vars
    (
      ?AUTO_95 - LANDER
      ?AUTO_98 - WAYPOINT
      ?AUTO_97 - ROVER
      ?AUTO_96 - STORE
      ?AUTO_99 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_95 ?AUTO_98 ) ( VISIBLE ?AUTO_94 ?AUTO_98 ) ( AVAILABLE ?AUTO_97 ) ( CHANNEL_FREE ?AUTO_95 ) ( not ( = ?AUTO_94 ?AUTO_98 ) ) ( AT_ROCK_SAMPLE ?AUTO_94 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_97 ) ( STORE_OF ?AUTO_96 ?AUTO_97 ) ( EMPTY ?AUTO_96 ) ( CAN_TRAVERSE ?AUTO_97 ?AUTO_98 ?AUTO_94 ) ( VISIBLE ?AUTO_98 ?AUTO_94 ) ( CAN_TRAVERSE ?AUTO_97 ?AUTO_99 ?AUTO_98 ) ( AT ?AUTO_97 ?AUTO_99 ) ( VISIBLE ?AUTO_99 ?AUTO_98 ) ( not ( = ?AUTO_94 ?AUTO_99 ) ) ( not ( = ?AUTO_98 ?AUTO_99 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_97 ?AUTO_99 ?AUTO_98 )
      ( GET_ROCK_DATA ?AUTO_94 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_94 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_101 - WAYPOINT
    )
    :vars
    (
      ?AUTO_102 - ROVER
      ?AUTO_104 - LANDER
      ?AUTO_103 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_102 ?AUTO_101 ) ( AT_LANDER ?AUTO_104 ?AUTO_103 ) ( HAVE_SOIL_ANALYSIS ?AUTO_102 ?AUTO_101 ) ( VISIBLE ?AUTO_101 ?AUTO_103 ) ( AVAILABLE ?AUTO_102 ) ( CHANNEL_FREE ?AUTO_104 ) ( not ( = ?AUTO_101 ?AUTO_103 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_102 ?AUTO_104 ?AUTO_101 ?AUTO_101 ?AUTO_103 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_101 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_105 - WAYPOINT
    )
    :vars
    (
      ?AUTO_106 - ROVER
      ?AUTO_108 - LANDER
      ?AUTO_107 - WAYPOINT
      ?AUTO_109 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_106 ?AUTO_105 ) ( AT_LANDER ?AUTO_108 ?AUTO_107 ) ( VISIBLE ?AUTO_105 ?AUTO_107 ) ( AVAILABLE ?AUTO_106 ) ( CHANNEL_FREE ?AUTO_108 ) ( not ( = ?AUTO_105 ?AUTO_107 ) ) ( AT_SOIL_SAMPLE ?AUTO_105 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_106 ) ( STORE_OF ?AUTO_109 ?AUTO_106 ) ( EMPTY ?AUTO_109 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_106 ?AUTO_109 ?AUTO_105 )
      ( GET_SOIL_DATA ?AUTO_105 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_105 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_110 - WAYPOINT
    )
    :vars
    (
      ?AUTO_112 - LANDER
      ?AUTO_113 - WAYPOINT
      ?AUTO_111 - ROVER
      ?AUTO_114 - STORE
      ?AUTO_115 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_112 ?AUTO_113 ) ( VISIBLE ?AUTO_110 ?AUTO_113 ) ( AVAILABLE ?AUTO_111 ) ( CHANNEL_FREE ?AUTO_112 ) ( not ( = ?AUTO_110 ?AUTO_113 ) ) ( AT_SOIL_SAMPLE ?AUTO_110 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_111 ) ( STORE_OF ?AUTO_114 ?AUTO_111 ) ( EMPTY ?AUTO_114 ) ( CAN_TRAVERSE ?AUTO_111 ?AUTO_115 ?AUTO_110 ) ( AT ?AUTO_111 ?AUTO_115 ) ( VISIBLE ?AUTO_115 ?AUTO_110 ) ( not ( = ?AUTO_110 ?AUTO_115 ) ) ( not ( = ?AUTO_113 ?AUTO_115 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_111 ?AUTO_115 ?AUTO_110 )
      ( GET_SOIL_DATA ?AUTO_110 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_110 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_116 - WAYPOINT
    )
    :vars
    (
      ?AUTO_117 - LANDER
      ?AUTO_121 - WAYPOINT
      ?AUTO_118 - ROVER
      ?AUTO_120 - STORE
      ?AUTO_119 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_117 ?AUTO_121 ) ( VISIBLE ?AUTO_116 ?AUTO_121 ) ( AVAILABLE ?AUTO_118 ) ( CHANNEL_FREE ?AUTO_117 ) ( not ( = ?AUTO_116 ?AUTO_121 ) ) ( AT_SOIL_SAMPLE ?AUTO_116 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_118 ) ( STORE_OF ?AUTO_120 ?AUTO_118 ) ( CAN_TRAVERSE ?AUTO_118 ?AUTO_119 ?AUTO_116 ) ( AT ?AUTO_118 ?AUTO_119 ) ( VISIBLE ?AUTO_119 ?AUTO_116 ) ( not ( = ?AUTO_116 ?AUTO_119 ) ) ( not ( = ?AUTO_121 ?AUTO_119 ) ) ( FULL ?AUTO_120 ) )
    :subtasks
    ( ( !DROP ?AUTO_118 ?AUTO_120 )
      ( GET_SOIL_DATA ?AUTO_116 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_116 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_122 - WAYPOINT
    )
    :vars
    (
      ?AUTO_124 - LANDER
      ?AUTO_127 - WAYPOINT
      ?AUTO_123 - ROVER
      ?AUTO_125 - STORE
      ?AUTO_126 - WAYPOINT
      ?AUTO_128 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_124 ?AUTO_127 ) ( VISIBLE ?AUTO_122 ?AUTO_127 ) ( AVAILABLE ?AUTO_123 ) ( CHANNEL_FREE ?AUTO_124 ) ( not ( = ?AUTO_122 ?AUTO_127 ) ) ( AT_SOIL_SAMPLE ?AUTO_122 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_123 ) ( STORE_OF ?AUTO_125 ?AUTO_123 ) ( CAN_TRAVERSE ?AUTO_123 ?AUTO_126 ?AUTO_122 ) ( VISIBLE ?AUTO_126 ?AUTO_122 ) ( not ( = ?AUTO_122 ?AUTO_126 ) ) ( not ( = ?AUTO_127 ?AUTO_126 ) ) ( FULL ?AUTO_125 ) ( CAN_TRAVERSE ?AUTO_123 ?AUTO_128 ?AUTO_126 ) ( AT ?AUTO_123 ?AUTO_128 ) ( VISIBLE ?AUTO_128 ?AUTO_126 ) ( not ( = ?AUTO_122 ?AUTO_128 ) ) ( not ( = ?AUTO_127 ?AUTO_128 ) ) ( not ( = ?AUTO_126 ?AUTO_128 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_123 ?AUTO_128 ?AUTO_126 )
      ( GET_SOIL_DATA ?AUTO_122 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_122 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_130 - WAYPOINT
    )
    :vars
    (
      ?AUTO_134 - LANDER
      ?AUTO_133 - WAYPOINT
      ?AUTO_135 - ROVER
      ?AUTO_136 - STORE
      ?AUTO_132 - WAYPOINT
      ?AUTO_131 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_134 ?AUTO_133 ) ( VISIBLE ?AUTO_130 ?AUTO_133 ) ( AVAILABLE ?AUTO_135 ) ( CHANNEL_FREE ?AUTO_134 ) ( not ( = ?AUTO_130 ?AUTO_133 ) ) ( AT_SOIL_SAMPLE ?AUTO_130 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_135 ) ( STORE_OF ?AUTO_136 ?AUTO_135 ) ( CAN_TRAVERSE ?AUTO_135 ?AUTO_132 ?AUTO_130 ) ( VISIBLE ?AUTO_132 ?AUTO_130 ) ( not ( = ?AUTO_130 ?AUTO_132 ) ) ( not ( = ?AUTO_133 ?AUTO_132 ) ) ( CAN_TRAVERSE ?AUTO_135 ?AUTO_131 ?AUTO_132 ) ( AT ?AUTO_135 ?AUTO_131 ) ( VISIBLE ?AUTO_131 ?AUTO_132 ) ( not ( = ?AUTO_130 ?AUTO_131 ) ) ( not ( = ?AUTO_133 ?AUTO_131 ) ) ( not ( = ?AUTO_132 ?AUTO_131 ) ) ( AT_ROCK_SAMPLE ?AUTO_131 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_135 ) ( EMPTY ?AUTO_136 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_135 ?AUTO_136 ?AUTO_131 )
      ( GET_SOIL_DATA ?AUTO_130 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_130 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_140 - WAYPOINT
    )
    :vars
    (
      ?AUTO_142 - LANDER
      ?AUTO_144 - WAYPOINT
      ?AUTO_141 - ROVER
      ?AUTO_145 - STORE
      ?AUTO_146 - WAYPOINT
      ?AUTO_143 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_142 ?AUTO_144 ) ( VISIBLE ?AUTO_140 ?AUTO_144 ) ( AVAILABLE ?AUTO_141 ) ( CHANNEL_FREE ?AUTO_142 ) ( not ( = ?AUTO_140 ?AUTO_144 ) ) ( AT_SOIL_SAMPLE ?AUTO_140 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_141 ) ( STORE_OF ?AUTO_145 ?AUTO_141 ) ( CAN_TRAVERSE ?AUTO_141 ?AUTO_146 ?AUTO_140 ) ( VISIBLE ?AUTO_146 ?AUTO_140 ) ( not ( = ?AUTO_140 ?AUTO_146 ) ) ( not ( = ?AUTO_144 ?AUTO_146 ) ) ( CAN_TRAVERSE ?AUTO_141 ?AUTO_143 ?AUTO_146 ) ( VISIBLE ?AUTO_143 ?AUTO_146 ) ( not ( = ?AUTO_140 ?AUTO_143 ) ) ( not ( = ?AUTO_144 ?AUTO_143 ) ) ( not ( = ?AUTO_146 ?AUTO_143 ) ) ( AT_ROCK_SAMPLE ?AUTO_143 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_141 ) ( EMPTY ?AUTO_145 ) ( CAN_TRAVERSE ?AUTO_141 ?AUTO_144 ?AUTO_143 ) ( AT ?AUTO_141 ?AUTO_144 ) ( VISIBLE ?AUTO_144 ?AUTO_143 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_141 ?AUTO_144 ?AUTO_143 )
      ( GET_SOIL_DATA ?AUTO_140 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_140 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_203 - WAYPOINT
    )
    :vars
    (
      ?AUTO_207 - LANDER
      ?AUTO_205 - WAYPOINT
      ?AUTO_204 - ROVER
      ?AUTO_206 - STORE
      ?AUTO_208 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_207 ?AUTO_205 ) ( VISIBLE ?AUTO_203 ?AUTO_205 ) ( AVAILABLE ?AUTO_204 ) ( CHANNEL_FREE ?AUTO_207 ) ( not ( = ?AUTO_203 ?AUTO_205 ) ) ( AT_ROCK_SAMPLE ?AUTO_203 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_204 ) ( STORE_OF ?AUTO_206 ?AUTO_204 ) ( EMPTY ?AUTO_206 ) ( CAN_TRAVERSE ?AUTO_204 ?AUTO_208 ?AUTO_203 ) ( AT ?AUTO_204 ?AUTO_208 ) ( VISIBLE ?AUTO_208 ?AUTO_203 ) ( not ( = ?AUTO_203 ?AUTO_208 ) ) ( not ( = ?AUTO_205 ?AUTO_208 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_204 ?AUTO_208 ?AUTO_203 )
      ( GET_ROCK_DATA ?AUTO_203 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_203 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_209 - WAYPOINT
    )
    :vars
    (
      ?AUTO_213 - LANDER
      ?AUTO_212 - WAYPOINT
      ?AUTO_211 - ROVER
      ?AUTO_210 - STORE
      ?AUTO_214 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_213 ?AUTO_212 ) ( VISIBLE ?AUTO_209 ?AUTO_212 ) ( AVAILABLE ?AUTO_211 ) ( CHANNEL_FREE ?AUTO_213 ) ( not ( = ?AUTO_209 ?AUTO_212 ) ) ( AT_ROCK_SAMPLE ?AUTO_209 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_211 ) ( STORE_OF ?AUTO_210 ?AUTO_211 ) ( EMPTY ?AUTO_210 ) ( CAN_TRAVERSE ?AUTO_211 ?AUTO_214 ?AUTO_209 ) ( VISIBLE ?AUTO_214 ?AUTO_209 ) ( not ( = ?AUTO_209 ?AUTO_214 ) ) ( not ( = ?AUTO_212 ?AUTO_214 ) ) ( CAN_TRAVERSE ?AUTO_211 ?AUTO_212 ?AUTO_214 ) ( AT ?AUTO_211 ?AUTO_212 ) ( VISIBLE ?AUTO_212 ?AUTO_214 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_211 ?AUTO_212 ?AUTO_214 )
      ( GET_ROCK_DATA ?AUTO_209 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_209 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_233 - OBJECTIVE
      ?AUTO_234 - MODE
    )
    :vars
    (
      ?AUTO_236 - LANDER
      ?AUTO_235 - WAYPOINT
      ?AUTO_237 - WAYPOINT
      ?AUTO_238 - ROVER
      ?AUTO_239 - CAMERA
      ?AUTO_240 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_236 ?AUTO_235 ) ( VISIBLE ?AUTO_237 ?AUTO_235 ) ( AVAILABLE ?AUTO_238 ) ( CHANNEL_FREE ?AUTO_236 ) ( not ( = ?AUTO_237 ?AUTO_235 ) ) ( CALIBRATED ?AUTO_239 ?AUTO_238 ) ( ON_BOARD ?AUTO_239 ?AUTO_238 ) ( EQUIPPED_FOR_IMAGING ?AUTO_238 ) ( SUPPORTS ?AUTO_239 ?AUTO_234 ) ( VISIBLE_FROM ?AUTO_233 ?AUTO_237 ) ( CAN_TRAVERSE ?AUTO_238 ?AUTO_240 ?AUTO_237 ) ( AT ?AUTO_238 ?AUTO_240 ) ( VISIBLE ?AUTO_240 ?AUTO_237 ) ( not ( = ?AUTO_235 ?AUTO_240 ) ) ( not ( = ?AUTO_237 ?AUTO_240 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_238 ?AUTO_240 ?AUTO_237 )
      ( GET_IMAGE_DATA ?AUTO_233 ?AUTO_234 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_233 ?AUTO_234 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_251 - OBJECTIVE
      ?AUTO_252 - MODE
    )
    :vars
    (
      ?AUTO_254 - LANDER
      ?AUTO_257 - WAYPOINT
      ?AUTO_253 - WAYPOINT
      ?AUTO_256 - ROVER
      ?AUTO_255 - CAMERA
      ?AUTO_258 - WAYPOINT
      ?AUTO_259 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_254 ?AUTO_257 ) ( VISIBLE ?AUTO_253 ?AUTO_257 ) ( AVAILABLE ?AUTO_256 ) ( CHANNEL_FREE ?AUTO_254 ) ( not ( = ?AUTO_253 ?AUTO_257 ) ) ( ON_BOARD ?AUTO_255 ?AUTO_256 ) ( EQUIPPED_FOR_IMAGING ?AUTO_256 ) ( SUPPORTS ?AUTO_255 ?AUTO_252 ) ( VISIBLE_FROM ?AUTO_251 ?AUTO_253 ) ( CAN_TRAVERSE ?AUTO_256 ?AUTO_258 ?AUTO_253 ) ( AT ?AUTO_256 ?AUTO_258 ) ( VISIBLE ?AUTO_258 ?AUTO_253 ) ( not ( = ?AUTO_257 ?AUTO_258 ) ) ( not ( = ?AUTO_253 ?AUTO_258 ) ) ( CALIBRATION_TARGET ?AUTO_255 ?AUTO_259 ) ( VISIBLE_FROM ?AUTO_259 ?AUTO_258 ) ( not ( = ?AUTO_251 ?AUTO_259 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_256 ?AUTO_255 ?AUTO_259 ?AUTO_258 )
      ( GET_IMAGE_DATA ?AUTO_251 ?AUTO_252 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_251 ?AUTO_252 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_273 - WAYPOINT
    )
    :vars
    (
      ?AUTO_274 - ROVER
      ?AUTO_276 - WAYPOINT
      ?AUTO_275 - LANDER
    )
    :precondition
    ( and ( AT ?AUTO_274 ?AUTO_276 ) ( AT_LANDER ?AUTO_275 ?AUTO_273 ) ( HAVE_SOIL_ANALYSIS ?AUTO_274 ?AUTO_273 ) ( VISIBLE ?AUTO_276 ?AUTO_273 ) ( AVAILABLE ?AUTO_274 ) ( CHANNEL_FREE ?AUTO_275 ) ( not ( = ?AUTO_273 ?AUTO_276 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_274 ?AUTO_275 ?AUTO_273 ?AUTO_276 ?AUTO_273 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_273 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_277 - WAYPOINT
    )
    :vars
    (
      ?AUTO_279 - LANDER
      ?AUTO_280 - ROVER
      ?AUTO_278 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_279 ?AUTO_277 ) ( HAVE_SOIL_ANALYSIS ?AUTO_280 ?AUTO_277 ) ( VISIBLE ?AUTO_278 ?AUTO_277 ) ( AVAILABLE ?AUTO_280 ) ( CHANNEL_FREE ?AUTO_279 ) ( not ( = ?AUTO_277 ?AUTO_278 ) ) ( CAN_TRAVERSE ?AUTO_280 ?AUTO_277 ?AUTO_278 ) ( AT ?AUTO_280 ?AUTO_277 ) ( VISIBLE ?AUTO_277 ?AUTO_278 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_280 ?AUTO_277 ?AUTO_278 )
      ( GET_SOIL_DATA ?AUTO_277 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_277 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_283 - WAYPOINT
    )
    :vars
    (
      ?AUTO_286 - LANDER
      ?AUTO_284 - WAYPOINT
      ?AUTO_285 - ROVER
      ?AUTO_287 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_286 ?AUTO_283 ) ( VISIBLE ?AUTO_284 ?AUTO_283 ) ( AVAILABLE ?AUTO_285 ) ( CHANNEL_FREE ?AUTO_286 ) ( not ( = ?AUTO_283 ?AUTO_284 ) ) ( CAN_TRAVERSE ?AUTO_285 ?AUTO_283 ?AUTO_284 ) ( AT ?AUTO_285 ?AUTO_283 ) ( VISIBLE ?AUTO_283 ?AUTO_284 ) ( AT_SOIL_SAMPLE ?AUTO_283 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_285 ) ( STORE_OF ?AUTO_287 ?AUTO_285 ) ( EMPTY ?AUTO_287 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_285 ?AUTO_287 ?AUTO_283 )
      ( GET_SOIL_DATA ?AUTO_283 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_283 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_288 - WAYPOINT
    )
    :vars
    (
      ?AUTO_291 - LANDER
      ?AUTO_289 - WAYPOINT
      ?AUTO_290 - ROVER
      ?AUTO_292 - STORE
      ?AUTO_293 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_291 ?AUTO_288 ) ( VISIBLE ?AUTO_289 ?AUTO_288 ) ( AVAILABLE ?AUTO_290 ) ( CHANNEL_FREE ?AUTO_291 ) ( not ( = ?AUTO_288 ?AUTO_289 ) ) ( CAN_TRAVERSE ?AUTO_290 ?AUTO_288 ?AUTO_289 ) ( VISIBLE ?AUTO_288 ?AUTO_289 ) ( AT_SOIL_SAMPLE ?AUTO_288 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_290 ) ( STORE_OF ?AUTO_292 ?AUTO_290 ) ( EMPTY ?AUTO_292 ) ( CAN_TRAVERSE ?AUTO_290 ?AUTO_293 ?AUTO_288 ) ( AT ?AUTO_290 ?AUTO_293 ) ( VISIBLE ?AUTO_293 ?AUTO_288 ) ( not ( = ?AUTO_288 ?AUTO_293 ) ) ( not ( = ?AUTO_289 ?AUTO_293 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_290 ?AUTO_293 ?AUTO_288 )
      ( GET_SOIL_DATA ?AUTO_288 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_288 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_297 - WAYPOINT
    )
    :vars
    (
      ?AUTO_300 - LANDER
      ?AUTO_302 - WAYPOINT
      ?AUTO_301 - ROVER
      ?AUTO_298 - STORE
      ?AUTO_299 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_300 ?AUTO_297 ) ( VISIBLE ?AUTO_302 ?AUTO_297 ) ( AVAILABLE ?AUTO_301 ) ( CHANNEL_FREE ?AUTO_300 ) ( not ( = ?AUTO_297 ?AUTO_302 ) ) ( CAN_TRAVERSE ?AUTO_301 ?AUTO_297 ?AUTO_302 ) ( VISIBLE ?AUTO_297 ?AUTO_302 ) ( AT_SOIL_SAMPLE ?AUTO_297 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_301 ) ( STORE_OF ?AUTO_298 ?AUTO_301 ) ( CAN_TRAVERSE ?AUTO_301 ?AUTO_299 ?AUTO_297 ) ( AT ?AUTO_301 ?AUTO_299 ) ( VISIBLE ?AUTO_299 ?AUTO_297 ) ( not ( = ?AUTO_297 ?AUTO_299 ) ) ( not ( = ?AUTO_302 ?AUTO_299 ) ) ( FULL ?AUTO_298 ) )
    :subtasks
    ( ( !DROP ?AUTO_301 ?AUTO_298 )
      ( GET_SOIL_DATA ?AUTO_297 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_297 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_303 - WAYPOINT
    )
    :vars
    (
      ?AUTO_308 - LANDER
      ?AUTO_304 - WAYPOINT
      ?AUTO_307 - ROVER
      ?AUTO_306 - STORE
      ?AUTO_305 - WAYPOINT
      ?AUTO_309 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_308 ?AUTO_303 ) ( VISIBLE ?AUTO_304 ?AUTO_303 ) ( AVAILABLE ?AUTO_307 ) ( CHANNEL_FREE ?AUTO_308 ) ( not ( = ?AUTO_303 ?AUTO_304 ) ) ( CAN_TRAVERSE ?AUTO_307 ?AUTO_303 ?AUTO_304 ) ( VISIBLE ?AUTO_303 ?AUTO_304 ) ( AT_SOIL_SAMPLE ?AUTO_303 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_307 ) ( STORE_OF ?AUTO_306 ?AUTO_307 ) ( CAN_TRAVERSE ?AUTO_307 ?AUTO_305 ?AUTO_303 ) ( VISIBLE ?AUTO_305 ?AUTO_303 ) ( not ( = ?AUTO_303 ?AUTO_305 ) ) ( not ( = ?AUTO_304 ?AUTO_305 ) ) ( FULL ?AUTO_306 ) ( CAN_TRAVERSE ?AUTO_307 ?AUTO_309 ?AUTO_305 ) ( AT ?AUTO_307 ?AUTO_309 ) ( VISIBLE ?AUTO_309 ?AUTO_305 ) ( not ( = ?AUTO_303 ?AUTO_309 ) ) ( not ( = ?AUTO_304 ?AUTO_309 ) ) ( not ( = ?AUTO_305 ?AUTO_309 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_307 ?AUTO_309 ?AUTO_305 )
      ( GET_SOIL_DATA ?AUTO_303 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_303 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_321 - WAYPOINT
    )
    :vars
    (
      ?AUTO_322 - ROVER
      ?AUTO_324 - WAYPOINT
      ?AUTO_323 - LANDER
    )
    :precondition
    ( and ( AT ?AUTO_322 ?AUTO_324 ) ( AT_LANDER ?AUTO_323 ?AUTO_321 ) ( HAVE_ROCK_ANALYSIS ?AUTO_322 ?AUTO_321 ) ( VISIBLE ?AUTO_324 ?AUTO_321 ) ( AVAILABLE ?AUTO_322 ) ( CHANNEL_FREE ?AUTO_323 ) ( not ( = ?AUTO_321 ?AUTO_324 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_322 ?AUTO_323 ?AUTO_321 ?AUTO_324 ?AUTO_321 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_321 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_326 - WAYPOINT
    )
    :vars
    (
      ?AUTO_328 - LANDER
      ?AUTO_327 - ROVER
      ?AUTO_329 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_328 ?AUTO_326 ) ( HAVE_ROCK_ANALYSIS ?AUTO_327 ?AUTO_326 ) ( VISIBLE ?AUTO_329 ?AUTO_326 ) ( AVAILABLE ?AUTO_327 ) ( CHANNEL_FREE ?AUTO_328 ) ( not ( = ?AUTO_326 ?AUTO_329 ) ) ( CAN_TRAVERSE ?AUTO_327 ?AUTO_326 ?AUTO_329 ) ( AT ?AUTO_327 ?AUTO_326 ) ( VISIBLE ?AUTO_326 ?AUTO_329 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_327 ?AUTO_326 ?AUTO_329 )
      ( GET_ROCK_DATA ?AUTO_326 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_326 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_330 - WAYPOINT
    )
    :vars
    (
      ?AUTO_332 - LANDER
      ?AUTO_333 - WAYPOINT
      ?AUTO_331 - ROVER
      ?AUTO_334 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_332 ?AUTO_330 ) ( VISIBLE ?AUTO_333 ?AUTO_330 ) ( AVAILABLE ?AUTO_331 ) ( CHANNEL_FREE ?AUTO_332 ) ( not ( = ?AUTO_330 ?AUTO_333 ) ) ( CAN_TRAVERSE ?AUTO_331 ?AUTO_330 ?AUTO_333 ) ( AT ?AUTO_331 ?AUTO_330 ) ( VISIBLE ?AUTO_330 ?AUTO_333 ) ( AT_ROCK_SAMPLE ?AUTO_330 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_331 ) ( STORE_OF ?AUTO_334 ?AUTO_331 ) ( EMPTY ?AUTO_334 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_331 ?AUTO_334 ?AUTO_330 )
      ( GET_ROCK_DATA ?AUTO_330 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_330 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_335 - WAYPOINT
    )
    :vars
    (
      ?AUTO_337 - LANDER
      ?AUTO_339 - WAYPOINT
      ?AUTO_336 - ROVER
      ?AUTO_338 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_337 ?AUTO_335 ) ( VISIBLE ?AUTO_339 ?AUTO_335 ) ( AVAILABLE ?AUTO_336 ) ( CHANNEL_FREE ?AUTO_337 ) ( not ( = ?AUTO_335 ?AUTO_339 ) ) ( CAN_TRAVERSE ?AUTO_336 ?AUTO_335 ?AUTO_339 ) ( AT ?AUTO_336 ?AUTO_335 ) ( VISIBLE ?AUTO_335 ?AUTO_339 ) ( AT_ROCK_SAMPLE ?AUTO_335 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_336 ) ( STORE_OF ?AUTO_338 ?AUTO_336 ) ( FULL ?AUTO_338 ) )
    :subtasks
    ( ( !DROP ?AUTO_336 ?AUTO_338 )
      ( GET_ROCK_DATA ?AUTO_335 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_335 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_341 - WAYPOINT
    )
    :vars
    (
      ?AUTO_345 - LANDER
      ?AUTO_344 - WAYPOINT
      ?AUTO_343 - ROVER
      ?AUTO_342 - STORE
      ?AUTO_346 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_345 ?AUTO_341 ) ( VISIBLE ?AUTO_344 ?AUTO_341 ) ( AVAILABLE ?AUTO_343 ) ( CHANNEL_FREE ?AUTO_345 ) ( not ( = ?AUTO_341 ?AUTO_344 ) ) ( CAN_TRAVERSE ?AUTO_343 ?AUTO_341 ?AUTO_344 ) ( VISIBLE ?AUTO_341 ?AUTO_344 ) ( AT_ROCK_SAMPLE ?AUTO_341 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_343 ) ( STORE_OF ?AUTO_342 ?AUTO_343 ) ( EMPTY ?AUTO_342 ) ( CAN_TRAVERSE ?AUTO_343 ?AUTO_346 ?AUTO_341 ) ( AT ?AUTO_343 ?AUTO_346 ) ( VISIBLE ?AUTO_346 ?AUTO_341 ) ( not ( = ?AUTO_341 ?AUTO_346 ) ) ( not ( = ?AUTO_344 ?AUTO_346 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_343 ?AUTO_346 ?AUTO_341 )
      ( GET_ROCK_DATA ?AUTO_341 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_341 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_350 - WAYPOINT
    )
    :vars
    (
      ?AUTO_353 - LANDER
      ?AUTO_354 - WAYPOINT
      ?AUTO_352 - ROVER
      ?AUTO_351 - STORE
      ?AUTO_355 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_353 ?AUTO_350 ) ( VISIBLE ?AUTO_354 ?AUTO_350 ) ( AVAILABLE ?AUTO_352 ) ( CHANNEL_FREE ?AUTO_353 ) ( not ( = ?AUTO_350 ?AUTO_354 ) ) ( CAN_TRAVERSE ?AUTO_352 ?AUTO_350 ?AUTO_354 ) ( VISIBLE ?AUTO_350 ?AUTO_354 ) ( AT_ROCK_SAMPLE ?AUTO_350 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_352 ) ( STORE_OF ?AUTO_351 ?AUTO_352 ) ( CAN_TRAVERSE ?AUTO_352 ?AUTO_355 ?AUTO_350 ) ( AT ?AUTO_352 ?AUTO_355 ) ( VISIBLE ?AUTO_355 ?AUTO_350 ) ( not ( = ?AUTO_350 ?AUTO_355 ) ) ( not ( = ?AUTO_354 ?AUTO_355 ) ) ( FULL ?AUTO_351 ) )
    :subtasks
    ( ( !DROP ?AUTO_352 ?AUTO_351 )
      ( GET_ROCK_DATA ?AUTO_350 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_350 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_356 - WAYPOINT
    )
    :vars
    (
      ?AUTO_361 - LANDER
      ?AUTO_360 - WAYPOINT
      ?AUTO_357 - ROVER
      ?AUTO_358 - STORE
      ?AUTO_359 - WAYPOINT
      ?AUTO_362 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_361 ?AUTO_356 ) ( VISIBLE ?AUTO_360 ?AUTO_356 ) ( AVAILABLE ?AUTO_357 ) ( CHANNEL_FREE ?AUTO_361 ) ( not ( = ?AUTO_356 ?AUTO_360 ) ) ( CAN_TRAVERSE ?AUTO_357 ?AUTO_356 ?AUTO_360 ) ( VISIBLE ?AUTO_356 ?AUTO_360 ) ( AT_ROCK_SAMPLE ?AUTO_356 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_357 ) ( STORE_OF ?AUTO_358 ?AUTO_357 ) ( CAN_TRAVERSE ?AUTO_357 ?AUTO_359 ?AUTO_356 ) ( VISIBLE ?AUTO_359 ?AUTO_356 ) ( not ( = ?AUTO_356 ?AUTO_359 ) ) ( not ( = ?AUTO_360 ?AUTO_359 ) ) ( FULL ?AUTO_358 ) ( CAN_TRAVERSE ?AUTO_357 ?AUTO_362 ?AUTO_359 ) ( AT ?AUTO_357 ?AUTO_362 ) ( VISIBLE ?AUTO_362 ?AUTO_359 ) ( not ( = ?AUTO_356 ?AUTO_362 ) ) ( not ( = ?AUTO_360 ?AUTO_362 ) ) ( not ( = ?AUTO_359 ?AUTO_362 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_357 ?AUTO_362 ?AUTO_359 )
      ( GET_ROCK_DATA ?AUTO_356 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_356 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_364 - WAYPOINT
    )
    :vars
    (
      ?AUTO_369 - LANDER
      ?AUTO_366 - WAYPOINT
      ?AUTO_370 - ROVER
      ?AUTO_368 - STORE
      ?AUTO_365 - WAYPOINT
      ?AUTO_367 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_369 ?AUTO_364 ) ( VISIBLE ?AUTO_366 ?AUTO_364 ) ( AVAILABLE ?AUTO_370 ) ( CHANNEL_FREE ?AUTO_369 ) ( not ( = ?AUTO_364 ?AUTO_366 ) ) ( CAN_TRAVERSE ?AUTO_370 ?AUTO_364 ?AUTO_366 ) ( VISIBLE ?AUTO_364 ?AUTO_366 ) ( AT_ROCK_SAMPLE ?AUTO_364 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_370 ) ( STORE_OF ?AUTO_368 ?AUTO_370 ) ( CAN_TRAVERSE ?AUTO_370 ?AUTO_365 ?AUTO_364 ) ( VISIBLE ?AUTO_365 ?AUTO_364 ) ( not ( = ?AUTO_364 ?AUTO_365 ) ) ( not ( = ?AUTO_366 ?AUTO_365 ) ) ( CAN_TRAVERSE ?AUTO_370 ?AUTO_367 ?AUTO_365 ) ( AT ?AUTO_370 ?AUTO_367 ) ( VISIBLE ?AUTO_367 ?AUTO_365 ) ( not ( = ?AUTO_364 ?AUTO_367 ) ) ( not ( = ?AUTO_366 ?AUTO_367 ) ) ( not ( = ?AUTO_365 ?AUTO_367 ) ) ( AT_ROCK_SAMPLE ?AUTO_367 ) ( EMPTY ?AUTO_368 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_370 ?AUTO_368 ?AUTO_367 )
      ( GET_ROCK_DATA ?AUTO_364 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_364 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5556 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5562 - LANDER
      ?AUTO_5559 - WAYPOINT
      ?AUTO_5560 - ROVER
      ?AUTO_5557 - STORE
      ?AUTO_5561 - WAYPOINT
      ?AUTO_5558 - WAYPOINT
      ?AUTO_5563 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5562 ?AUTO_5556 ) ( VISIBLE ?AUTO_5559 ?AUTO_5556 ) ( AVAILABLE ?AUTO_5560 ) ( CHANNEL_FREE ?AUTO_5562 ) ( not ( = ?AUTO_5556 ?AUTO_5559 ) ) ( CAN_TRAVERSE ?AUTO_5560 ?AUTO_5556 ?AUTO_5559 ) ( VISIBLE ?AUTO_5556 ?AUTO_5559 ) ( AT_ROCK_SAMPLE ?AUTO_5556 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5560 ) ( STORE_OF ?AUTO_5557 ?AUTO_5560 ) ( EMPTY ?AUTO_5557 ) ( CAN_TRAVERSE ?AUTO_5560 ?AUTO_5561 ?AUTO_5556 ) ( VISIBLE ?AUTO_5561 ?AUTO_5556 ) ( not ( = ?AUTO_5556 ?AUTO_5561 ) ) ( not ( = ?AUTO_5559 ?AUTO_5561 ) ) ( CAN_TRAVERSE ?AUTO_5560 ?AUTO_5558 ?AUTO_5561 ) ( VISIBLE ?AUTO_5558 ?AUTO_5561 ) ( not ( = ?AUTO_5556 ?AUTO_5558 ) ) ( not ( = ?AUTO_5559 ?AUTO_5558 ) ) ( not ( = ?AUTO_5561 ?AUTO_5558 ) ) ( CAN_TRAVERSE ?AUTO_5560 ?AUTO_5563 ?AUTO_5558 ) ( AT ?AUTO_5560 ?AUTO_5563 ) ( VISIBLE ?AUTO_5563 ?AUTO_5558 ) ( not ( = ?AUTO_5556 ?AUTO_5563 ) ) ( not ( = ?AUTO_5559 ?AUTO_5563 ) ) ( not ( = ?AUTO_5561 ?AUTO_5563 ) ) ( not ( = ?AUTO_5558 ?AUTO_5563 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5560 ?AUTO_5563 ?AUTO_5558 )
      ( GET_ROCK_DATA ?AUTO_5556 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5556 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_392 - WAYPOINT
    )
    :vars
    (
      ?AUTO_394 - LANDER
      ?AUTO_395 - WAYPOINT
      ?AUTO_393 - ROVER
      ?AUTO_396 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_394 ?AUTO_395 ) ( VISIBLE ?AUTO_392 ?AUTO_395 ) ( AVAILABLE ?AUTO_393 ) ( CHANNEL_FREE ?AUTO_394 ) ( not ( = ?AUTO_392 ?AUTO_395 ) ) ( AT_SOIL_SAMPLE ?AUTO_392 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_393 ) ( STORE_OF ?AUTO_396 ?AUTO_393 ) ( EMPTY ?AUTO_396 ) ( CAN_TRAVERSE ?AUTO_393 ?AUTO_395 ?AUTO_392 ) ( AT ?AUTO_393 ?AUTO_395 ) ( VISIBLE ?AUTO_395 ?AUTO_392 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_393 ?AUTO_395 ?AUTO_392 )
      ( GET_SOIL_DATA ?AUTO_392 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_392 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_418 - WAYPOINT
    )
    :vars
    (
      ?AUTO_419 - ROVER
      ?AUTO_422 - WAYPOINT
      ?AUTO_421 - LANDER
      ?AUTO_420 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_419 ?AUTO_422 ) ( AT_LANDER ?AUTO_421 ?AUTO_420 ) ( HAVE_SOIL_ANALYSIS ?AUTO_419 ?AUTO_418 ) ( VISIBLE ?AUTO_422 ?AUTO_420 ) ( AVAILABLE ?AUTO_419 ) ( CHANNEL_FREE ?AUTO_421 ) ( not ( = ?AUTO_418 ?AUTO_422 ) ) ( not ( = ?AUTO_418 ?AUTO_420 ) ) ( not ( = ?AUTO_422 ?AUTO_420 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_419 ?AUTO_421 ?AUTO_418 ?AUTO_422 ?AUTO_420 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_418 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_423 - WAYPOINT
    )
    :vars
    (
      ?AUTO_424 - LANDER
      ?AUTO_426 - WAYPOINT
      ?AUTO_425 - ROVER
      ?AUTO_427 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_424 ?AUTO_426 ) ( HAVE_SOIL_ANALYSIS ?AUTO_425 ?AUTO_423 ) ( VISIBLE ?AUTO_427 ?AUTO_426 ) ( AVAILABLE ?AUTO_425 ) ( CHANNEL_FREE ?AUTO_424 ) ( not ( = ?AUTO_423 ?AUTO_427 ) ) ( not ( = ?AUTO_423 ?AUTO_426 ) ) ( not ( = ?AUTO_427 ?AUTO_426 ) ) ( CAN_TRAVERSE ?AUTO_425 ?AUTO_423 ?AUTO_427 ) ( AT ?AUTO_425 ?AUTO_423 ) ( VISIBLE ?AUTO_423 ?AUTO_427 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_425 ?AUTO_423 ?AUTO_427 )
      ( GET_SOIL_DATA ?AUTO_423 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_423 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_430 - WAYPOINT
    )
    :vars
    (
      ?AUTO_431 - LANDER
      ?AUTO_433 - WAYPOINT
      ?AUTO_432 - WAYPOINT
      ?AUTO_434 - ROVER
      ?AUTO_435 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_431 ?AUTO_433 ) ( VISIBLE ?AUTO_432 ?AUTO_433 ) ( AVAILABLE ?AUTO_434 ) ( CHANNEL_FREE ?AUTO_431 ) ( not ( = ?AUTO_430 ?AUTO_432 ) ) ( not ( = ?AUTO_430 ?AUTO_433 ) ) ( not ( = ?AUTO_432 ?AUTO_433 ) ) ( CAN_TRAVERSE ?AUTO_434 ?AUTO_430 ?AUTO_432 ) ( AT ?AUTO_434 ?AUTO_430 ) ( VISIBLE ?AUTO_430 ?AUTO_432 ) ( AT_SOIL_SAMPLE ?AUTO_430 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_434 ) ( STORE_OF ?AUTO_435 ?AUTO_434 ) ( EMPTY ?AUTO_435 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_434 ?AUTO_435 ?AUTO_430 )
      ( GET_SOIL_DATA ?AUTO_430 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_430 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_436 - WAYPOINT
    )
    :vars
    (
      ?AUTO_438 - LANDER
      ?AUTO_440 - WAYPOINT
      ?AUTO_437 - WAYPOINT
      ?AUTO_439 - ROVER
      ?AUTO_441 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_438 ?AUTO_440 ) ( VISIBLE ?AUTO_437 ?AUTO_440 ) ( AVAILABLE ?AUTO_439 ) ( CHANNEL_FREE ?AUTO_438 ) ( not ( = ?AUTO_436 ?AUTO_437 ) ) ( not ( = ?AUTO_436 ?AUTO_440 ) ) ( not ( = ?AUTO_437 ?AUTO_440 ) ) ( CAN_TRAVERSE ?AUTO_439 ?AUTO_436 ?AUTO_437 ) ( VISIBLE ?AUTO_436 ?AUTO_437 ) ( AT_SOIL_SAMPLE ?AUTO_436 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_439 ) ( STORE_OF ?AUTO_441 ?AUTO_439 ) ( EMPTY ?AUTO_441 ) ( CAN_TRAVERSE ?AUTO_439 ?AUTO_437 ?AUTO_436 ) ( AT ?AUTO_439 ?AUTO_437 ) ( VISIBLE ?AUTO_437 ?AUTO_436 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_439 ?AUTO_437 ?AUTO_436 )
      ( GET_SOIL_DATA ?AUTO_436 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_436 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_442 - WAYPOINT
    )
    :vars
    (
      ?AUTO_444 - LANDER
      ?AUTO_445 - WAYPOINT
      ?AUTO_443 - WAYPOINT
      ?AUTO_446 - ROVER
      ?AUTO_447 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_444 ?AUTO_445 ) ( VISIBLE ?AUTO_443 ?AUTO_445 ) ( AVAILABLE ?AUTO_446 ) ( CHANNEL_FREE ?AUTO_444 ) ( not ( = ?AUTO_442 ?AUTO_443 ) ) ( not ( = ?AUTO_442 ?AUTO_445 ) ) ( not ( = ?AUTO_443 ?AUTO_445 ) ) ( CAN_TRAVERSE ?AUTO_446 ?AUTO_442 ?AUTO_443 ) ( VISIBLE ?AUTO_442 ?AUTO_443 ) ( AT_SOIL_SAMPLE ?AUTO_442 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_446 ) ( STORE_OF ?AUTO_447 ?AUTO_446 ) ( CAN_TRAVERSE ?AUTO_446 ?AUTO_443 ?AUTO_442 ) ( AT ?AUTO_446 ?AUTO_443 ) ( VISIBLE ?AUTO_443 ?AUTO_442 ) ( FULL ?AUTO_447 ) )
    :subtasks
    ( ( !DROP ?AUTO_446 ?AUTO_447 )
      ( GET_SOIL_DATA ?AUTO_442 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_442 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_453 - WAYPOINT
    )
    :vars
    (
      ?AUTO_455 - LANDER
      ?AUTO_456 - WAYPOINT
      ?AUTO_457 - WAYPOINT
      ?AUTO_454 - ROVER
      ?AUTO_458 - STORE
      ?AUTO_459 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_455 ?AUTO_456 ) ( VISIBLE ?AUTO_457 ?AUTO_456 ) ( AVAILABLE ?AUTO_454 ) ( CHANNEL_FREE ?AUTO_455 ) ( not ( = ?AUTO_453 ?AUTO_457 ) ) ( not ( = ?AUTO_453 ?AUTO_456 ) ) ( not ( = ?AUTO_457 ?AUTO_456 ) ) ( CAN_TRAVERSE ?AUTO_454 ?AUTO_453 ?AUTO_457 ) ( VISIBLE ?AUTO_453 ?AUTO_457 ) ( AT_SOIL_SAMPLE ?AUTO_453 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_454 ) ( STORE_OF ?AUTO_458 ?AUTO_454 ) ( EMPTY ?AUTO_458 ) ( CAN_TRAVERSE ?AUTO_454 ?AUTO_457 ?AUTO_453 ) ( VISIBLE ?AUTO_457 ?AUTO_453 ) ( CAN_TRAVERSE ?AUTO_454 ?AUTO_459 ?AUTO_457 ) ( AT ?AUTO_454 ?AUTO_459 ) ( VISIBLE ?AUTO_459 ?AUTO_457 ) ( not ( = ?AUTO_453 ?AUTO_459 ) ) ( not ( = ?AUTO_456 ?AUTO_459 ) ) ( not ( = ?AUTO_457 ?AUTO_459 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_454 ?AUTO_459 ?AUTO_457 )
      ( GET_SOIL_DATA ?AUTO_453 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_453 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_461 - WAYPOINT
    )
    :vars
    (
      ?AUTO_462 - ROVER
      ?AUTO_465 - WAYPOINT
      ?AUTO_464 - LANDER
      ?AUTO_463 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_462 ?AUTO_465 ) ( AT_LANDER ?AUTO_464 ?AUTO_463 ) ( HAVE_ROCK_ANALYSIS ?AUTO_462 ?AUTO_461 ) ( VISIBLE ?AUTO_465 ?AUTO_463 ) ( AVAILABLE ?AUTO_462 ) ( CHANNEL_FREE ?AUTO_464 ) ( not ( = ?AUTO_461 ?AUTO_465 ) ) ( not ( = ?AUTO_461 ?AUTO_463 ) ) ( not ( = ?AUTO_465 ?AUTO_463 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_462 ?AUTO_464 ?AUTO_461 ?AUTO_465 ?AUTO_463 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_461 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_467 - WAYPOINT
    )
    :vars
    (
      ?AUTO_469 - LANDER
      ?AUTO_471 - WAYPOINT
      ?AUTO_468 - ROVER
      ?AUTO_470 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_469 ?AUTO_471 ) ( HAVE_ROCK_ANALYSIS ?AUTO_468 ?AUTO_467 ) ( VISIBLE ?AUTO_470 ?AUTO_471 ) ( AVAILABLE ?AUTO_468 ) ( CHANNEL_FREE ?AUTO_469 ) ( not ( = ?AUTO_467 ?AUTO_470 ) ) ( not ( = ?AUTO_467 ?AUTO_471 ) ) ( not ( = ?AUTO_470 ?AUTO_471 ) ) ( CAN_TRAVERSE ?AUTO_468 ?AUTO_467 ?AUTO_470 ) ( AT ?AUTO_468 ?AUTO_467 ) ( VISIBLE ?AUTO_467 ?AUTO_470 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_468 ?AUTO_467 ?AUTO_470 )
      ( GET_ROCK_DATA ?AUTO_467 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_467 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_472 - WAYPOINT
    )
    :vars
    (
      ?AUTO_475 - LANDER
      ?AUTO_473 - WAYPOINT
      ?AUTO_476 - WAYPOINT
      ?AUTO_474 - ROVER
      ?AUTO_477 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_475 ?AUTO_473 ) ( VISIBLE ?AUTO_476 ?AUTO_473 ) ( AVAILABLE ?AUTO_474 ) ( CHANNEL_FREE ?AUTO_475 ) ( not ( = ?AUTO_472 ?AUTO_476 ) ) ( not ( = ?AUTO_472 ?AUTO_473 ) ) ( not ( = ?AUTO_476 ?AUTO_473 ) ) ( CAN_TRAVERSE ?AUTO_474 ?AUTO_472 ?AUTO_476 ) ( AT ?AUTO_474 ?AUTO_472 ) ( VISIBLE ?AUTO_472 ?AUTO_476 ) ( AT_ROCK_SAMPLE ?AUTO_472 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_474 ) ( STORE_OF ?AUTO_477 ?AUTO_474 ) ( EMPTY ?AUTO_477 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_474 ?AUTO_477 ?AUTO_472 )
      ( GET_ROCK_DATA ?AUTO_472 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_472 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_478 - WAYPOINT
    )
    :vars
    (
      ?AUTO_483 - LANDER
      ?AUTO_479 - WAYPOINT
      ?AUTO_481 - WAYPOINT
      ?AUTO_480 - ROVER
      ?AUTO_482 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_483 ?AUTO_479 ) ( VISIBLE ?AUTO_481 ?AUTO_479 ) ( AVAILABLE ?AUTO_480 ) ( CHANNEL_FREE ?AUTO_483 ) ( not ( = ?AUTO_478 ?AUTO_481 ) ) ( not ( = ?AUTO_478 ?AUTO_479 ) ) ( not ( = ?AUTO_481 ?AUTO_479 ) ) ( CAN_TRAVERSE ?AUTO_480 ?AUTO_478 ?AUTO_481 ) ( AT ?AUTO_480 ?AUTO_478 ) ( VISIBLE ?AUTO_478 ?AUTO_481 ) ( AT_ROCK_SAMPLE ?AUTO_478 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_480 ) ( STORE_OF ?AUTO_482 ?AUTO_480 ) ( FULL ?AUTO_482 ) )
    :subtasks
    ( ( !DROP ?AUTO_480 ?AUTO_482 )
      ( GET_ROCK_DATA ?AUTO_478 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_478 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_485 - WAYPOINT
    )
    :vars
    (
      ?AUTO_489 - LANDER
      ?AUTO_490 - WAYPOINT
      ?AUTO_486 - WAYPOINT
      ?AUTO_487 - ROVER
      ?AUTO_488 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_489 ?AUTO_490 ) ( VISIBLE ?AUTO_486 ?AUTO_490 ) ( AVAILABLE ?AUTO_487 ) ( CHANNEL_FREE ?AUTO_489 ) ( not ( = ?AUTO_485 ?AUTO_486 ) ) ( not ( = ?AUTO_485 ?AUTO_490 ) ) ( not ( = ?AUTO_486 ?AUTO_490 ) ) ( CAN_TRAVERSE ?AUTO_487 ?AUTO_485 ?AUTO_486 ) ( VISIBLE ?AUTO_485 ?AUTO_486 ) ( AT_ROCK_SAMPLE ?AUTO_485 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_487 ) ( STORE_OF ?AUTO_488 ?AUTO_487 ) ( EMPTY ?AUTO_488 ) ( CAN_TRAVERSE ?AUTO_487 ?AUTO_486 ?AUTO_485 ) ( AT ?AUTO_487 ?AUTO_486 ) ( VISIBLE ?AUTO_486 ?AUTO_485 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_487 ?AUTO_486 ?AUTO_485 )
      ( GET_ROCK_DATA ?AUTO_485 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_485 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_491 - WAYPOINT
    )
    :vars
    (
      ?AUTO_495 - LANDER
      ?AUTO_493 - WAYPOINT
      ?AUTO_492 - WAYPOINT
      ?AUTO_494 - ROVER
      ?AUTO_496 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_495 ?AUTO_493 ) ( VISIBLE ?AUTO_492 ?AUTO_493 ) ( AVAILABLE ?AUTO_494 ) ( CHANNEL_FREE ?AUTO_495 ) ( not ( = ?AUTO_491 ?AUTO_492 ) ) ( not ( = ?AUTO_491 ?AUTO_493 ) ) ( not ( = ?AUTO_492 ?AUTO_493 ) ) ( CAN_TRAVERSE ?AUTO_494 ?AUTO_491 ?AUTO_492 ) ( VISIBLE ?AUTO_491 ?AUTO_492 ) ( AT_ROCK_SAMPLE ?AUTO_491 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_494 ) ( STORE_OF ?AUTO_496 ?AUTO_494 ) ( CAN_TRAVERSE ?AUTO_494 ?AUTO_492 ?AUTO_491 ) ( AT ?AUTO_494 ?AUTO_492 ) ( VISIBLE ?AUTO_492 ?AUTO_491 ) ( FULL ?AUTO_496 ) )
    :subtasks
    ( ( !DROP ?AUTO_494 ?AUTO_496 )
      ( GET_ROCK_DATA ?AUTO_491 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_491 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_502 - WAYPOINT
    )
    :vars
    (
      ?AUTO_505 - LANDER
      ?AUTO_507 - WAYPOINT
      ?AUTO_504 - WAYPOINT
      ?AUTO_503 - ROVER
      ?AUTO_506 - STORE
      ?AUTO_508 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_505 ?AUTO_507 ) ( VISIBLE ?AUTO_504 ?AUTO_507 ) ( AVAILABLE ?AUTO_503 ) ( CHANNEL_FREE ?AUTO_505 ) ( not ( = ?AUTO_502 ?AUTO_504 ) ) ( not ( = ?AUTO_502 ?AUTO_507 ) ) ( not ( = ?AUTO_504 ?AUTO_507 ) ) ( CAN_TRAVERSE ?AUTO_503 ?AUTO_502 ?AUTO_504 ) ( VISIBLE ?AUTO_502 ?AUTO_504 ) ( AT_ROCK_SAMPLE ?AUTO_502 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_503 ) ( STORE_OF ?AUTO_506 ?AUTO_503 ) ( EMPTY ?AUTO_506 ) ( CAN_TRAVERSE ?AUTO_503 ?AUTO_504 ?AUTO_502 ) ( VISIBLE ?AUTO_504 ?AUTO_502 ) ( CAN_TRAVERSE ?AUTO_503 ?AUTO_508 ?AUTO_504 ) ( AT ?AUTO_503 ?AUTO_508 ) ( VISIBLE ?AUTO_508 ?AUTO_504 ) ( not ( = ?AUTO_502 ?AUTO_508 ) ) ( not ( = ?AUTO_507 ?AUTO_508 ) ) ( not ( = ?AUTO_504 ?AUTO_508 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_503 ?AUTO_508 ?AUTO_504 )
      ( GET_ROCK_DATA ?AUTO_502 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_502 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_526 - WAYPOINT
    )
    :vars
    (
      ?AUTO_528 - LANDER
      ?AUTO_529 - WAYPOINT
      ?AUTO_527 - ROVER
      ?AUTO_531 - STORE
      ?AUTO_530 - WAYPOINT
      ?AUTO_532 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_528 ?AUTO_529 ) ( VISIBLE ?AUTO_526 ?AUTO_529 ) ( AVAILABLE ?AUTO_527 ) ( CHANNEL_FREE ?AUTO_528 ) ( not ( = ?AUTO_526 ?AUTO_529 ) ) ( AT_SOIL_SAMPLE ?AUTO_526 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_527 ) ( STORE_OF ?AUTO_531 ?AUTO_527 ) ( EMPTY ?AUTO_531 ) ( CAN_TRAVERSE ?AUTO_527 ?AUTO_530 ?AUTO_526 ) ( VISIBLE ?AUTO_530 ?AUTO_526 ) ( not ( = ?AUTO_526 ?AUTO_530 ) ) ( not ( = ?AUTO_529 ?AUTO_530 ) ) ( CAN_TRAVERSE ?AUTO_527 ?AUTO_532 ?AUTO_530 ) ( AT ?AUTO_527 ?AUTO_532 ) ( VISIBLE ?AUTO_532 ?AUTO_530 ) ( not ( = ?AUTO_526 ?AUTO_532 ) ) ( not ( = ?AUTO_529 ?AUTO_532 ) ) ( not ( = ?AUTO_530 ?AUTO_532 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_527 ?AUTO_532 ?AUTO_530 )
      ( GET_SOIL_DATA ?AUTO_526 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_526 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_591 - OBJECTIVE
      ?AUTO_590 - MODE
    )
    :vars
    (
      ?AUTO_594 - LANDER
      ?AUTO_593 - WAYPOINT
      ?AUTO_592 - ROVER
      ?AUTO_595 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_594 ?AUTO_593 ) ( HAVE_IMAGE ?AUTO_592 ?AUTO_591 ?AUTO_590 ) ( VISIBLE ?AUTO_595 ?AUTO_593 ) ( AVAILABLE ?AUTO_592 ) ( CHANNEL_FREE ?AUTO_594 ) ( not ( = ?AUTO_595 ?AUTO_593 ) ) ( CAN_TRAVERSE ?AUTO_592 ?AUTO_593 ?AUTO_595 ) ( AT ?AUTO_592 ?AUTO_593 ) ( VISIBLE ?AUTO_593 ?AUTO_595 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_592 ?AUTO_593 ?AUTO_595 )
      ( GET_IMAGE_DATA ?AUTO_591 ?AUTO_590 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_591 ?AUTO_590 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_597 - OBJECTIVE
      ?AUTO_596 - MODE
    )
    :vars
    (
      ?AUTO_601 - LANDER
      ?AUTO_598 - WAYPOINT
      ?AUTO_600 - WAYPOINT
      ?AUTO_599 - ROVER
      ?AUTO_602 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_601 ?AUTO_598 ) ( VISIBLE ?AUTO_600 ?AUTO_598 ) ( AVAILABLE ?AUTO_599 ) ( CHANNEL_FREE ?AUTO_601 ) ( not ( = ?AUTO_600 ?AUTO_598 ) ) ( CAN_TRAVERSE ?AUTO_599 ?AUTO_598 ?AUTO_600 ) ( AT ?AUTO_599 ?AUTO_598 ) ( VISIBLE ?AUTO_598 ?AUTO_600 ) ( CALIBRATED ?AUTO_602 ?AUTO_599 ) ( ON_BOARD ?AUTO_602 ?AUTO_599 ) ( EQUIPPED_FOR_IMAGING ?AUTO_599 ) ( SUPPORTS ?AUTO_602 ?AUTO_596 ) ( VISIBLE_FROM ?AUTO_597 ?AUTO_598 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_599 ?AUTO_598 ?AUTO_597 ?AUTO_602 ?AUTO_596 )
      ( GET_IMAGE_DATA ?AUTO_597 ?AUTO_596 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_597 ?AUTO_596 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_604 - OBJECTIVE
      ?AUTO_603 - MODE
    )
    :vars
    (
      ?AUTO_608 - LANDER
      ?AUTO_606 - WAYPOINT
      ?AUTO_607 - WAYPOINT
      ?AUTO_605 - ROVER
      ?AUTO_609 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_608 ?AUTO_606 ) ( VISIBLE ?AUTO_607 ?AUTO_606 ) ( AVAILABLE ?AUTO_605 ) ( CHANNEL_FREE ?AUTO_608 ) ( not ( = ?AUTO_607 ?AUTO_606 ) ) ( CAN_TRAVERSE ?AUTO_605 ?AUTO_606 ?AUTO_607 ) ( AT ?AUTO_605 ?AUTO_606 ) ( VISIBLE ?AUTO_606 ?AUTO_607 ) ( ON_BOARD ?AUTO_609 ?AUTO_605 ) ( EQUIPPED_FOR_IMAGING ?AUTO_605 ) ( SUPPORTS ?AUTO_609 ?AUTO_603 ) ( VISIBLE_FROM ?AUTO_604 ?AUTO_606 ) ( CALIBRATION_TARGET ?AUTO_609 ?AUTO_604 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_605 ?AUTO_609 ?AUTO_604 ?AUTO_606 )
      ( GET_IMAGE_DATA ?AUTO_604 ?AUTO_603 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_604 ?AUTO_603 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_611 - OBJECTIVE
      ?AUTO_610 - MODE
    )
    :vars
    (
      ?AUTO_615 - LANDER
      ?AUTO_612 - WAYPOINT
      ?AUTO_614 - WAYPOINT
      ?AUTO_613 - ROVER
      ?AUTO_616 - CAMERA
      ?AUTO_617 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_615 ?AUTO_612 ) ( VISIBLE ?AUTO_614 ?AUTO_612 ) ( AVAILABLE ?AUTO_613 ) ( CHANNEL_FREE ?AUTO_615 ) ( not ( = ?AUTO_614 ?AUTO_612 ) ) ( CAN_TRAVERSE ?AUTO_613 ?AUTO_612 ?AUTO_614 ) ( VISIBLE ?AUTO_612 ?AUTO_614 ) ( ON_BOARD ?AUTO_616 ?AUTO_613 ) ( EQUIPPED_FOR_IMAGING ?AUTO_613 ) ( SUPPORTS ?AUTO_616 ?AUTO_610 ) ( VISIBLE_FROM ?AUTO_611 ?AUTO_612 ) ( CALIBRATION_TARGET ?AUTO_616 ?AUTO_611 ) ( CAN_TRAVERSE ?AUTO_613 ?AUTO_617 ?AUTO_612 ) ( AT ?AUTO_613 ?AUTO_617 ) ( VISIBLE ?AUTO_617 ?AUTO_612 ) ( not ( = ?AUTO_612 ?AUTO_617 ) ) ( not ( = ?AUTO_614 ?AUTO_617 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_613 ?AUTO_617 ?AUTO_612 )
      ( GET_IMAGE_DATA ?AUTO_611 ?AUTO_610 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_611 ?AUTO_610 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_621 - OBJECTIVE
      ?AUTO_620 - MODE
    )
    :vars
    (
      ?AUTO_627 - LANDER
      ?AUTO_626 - WAYPOINT
      ?AUTO_623 - WAYPOINT
      ?AUTO_625 - ROVER
      ?AUTO_624 - CAMERA
      ?AUTO_622 - WAYPOINT
      ?AUTO_628 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_627 ?AUTO_626 ) ( VISIBLE ?AUTO_623 ?AUTO_626 ) ( AVAILABLE ?AUTO_625 ) ( CHANNEL_FREE ?AUTO_627 ) ( not ( = ?AUTO_623 ?AUTO_626 ) ) ( CAN_TRAVERSE ?AUTO_625 ?AUTO_626 ?AUTO_623 ) ( VISIBLE ?AUTO_626 ?AUTO_623 ) ( ON_BOARD ?AUTO_624 ?AUTO_625 ) ( EQUIPPED_FOR_IMAGING ?AUTO_625 ) ( SUPPORTS ?AUTO_624 ?AUTO_620 ) ( VISIBLE_FROM ?AUTO_621 ?AUTO_626 ) ( CALIBRATION_TARGET ?AUTO_624 ?AUTO_621 ) ( CAN_TRAVERSE ?AUTO_625 ?AUTO_622 ?AUTO_626 ) ( VISIBLE ?AUTO_622 ?AUTO_626 ) ( not ( = ?AUTO_626 ?AUTO_622 ) ) ( not ( = ?AUTO_623 ?AUTO_622 ) ) ( CAN_TRAVERSE ?AUTO_625 ?AUTO_628 ?AUTO_622 ) ( AT ?AUTO_625 ?AUTO_628 ) ( VISIBLE ?AUTO_628 ?AUTO_622 ) ( not ( = ?AUTO_626 ?AUTO_628 ) ) ( not ( = ?AUTO_623 ?AUTO_628 ) ) ( not ( = ?AUTO_622 ?AUTO_628 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_625 ?AUTO_628 ?AUTO_622 )
      ( GET_IMAGE_DATA ?AUTO_621 ?AUTO_620 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_621 ?AUTO_620 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_675 - WAYPOINT
    )
    :vars
    (
      ?AUTO_676 - LANDER
      ?AUTO_678 - WAYPOINT
      ?AUTO_679 - ROVER
      ?AUTO_677 - STORE
      ?AUTO_680 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_676 ?AUTO_678 ) ( VISIBLE ?AUTO_675 ?AUTO_678 ) ( AVAILABLE ?AUTO_679 ) ( CHANNEL_FREE ?AUTO_676 ) ( not ( = ?AUTO_675 ?AUTO_678 ) ) ( AT_ROCK_SAMPLE ?AUTO_675 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_679 ) ( STORE_OF ?AUTO_677 ?AUTO_679 ) ( CAN_TRAVERSE ?AUTO_679 ?AUTO_678 ?AUTO_675 ) ( VISIBLE ?AUTO_678 ?AUTO_675 ) ( CAN_TRAVERSE ?AUTO_679 ?AUTO_680 ?AUTO_678 ) ( AT ?AUTO_679 ?AUTO_680 ) ( VISIBLE ?AUTO_680 ?AUTO_678 ) ( not ( = ?AUTO_675 ?AUTO_680 ) ) ( not ( = ?AUTO_678 ?AUTO_680 ) ) ( FULL ?AUTO_677 ) )
    :subtasks
    ( ( !DROP ?AUTO_679 ?AUTO_677 )
      ( GET_ROCK_DATA ?AUTO_675 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_675 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_681 - WAYPOINT
    )
    :vars
    (
      ?AUTO_682 - LANDER
      ?AUTO_686 - WAYPOINT
      ?AUTO_685 - ROVER
      ?AUTO_683 - STORE
      ?AUTO_684 - WAYPOINT
      ?AUTO_687 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_682 ?AUTO_686 ) ( VISIBLE ?AUTO_681 ?AUTO_686 ) ( AVAILABLE ?AUTO_685 ) ( CHANNEL_FREE ?AUTO_682 ) ( not ( = ?AUTO_681 ?AUTO_686 ) ) ( AT_ROCK_SAMPLE ?AUTO_681 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_685 ) ( STORE_OF ?AUTO_683 ?AUTO_685 ) ( CAN_TRAVERSE ?AUTO_685 ?AUTO_686 ?AUTO_681 ) ( VISIBLE ?AUTO_686 ?AUTO_681 ) ( CAN_TRAVERSE ?AUTO_685 ?AUTO_684 ?AUTO_686 ) ( VISIBLE ?AUTO_684 ?AUTO_686 ) ( not ( = ?AUTO_681 ?AUTO_684 ) ) ( not ( = ?AUTO_686 ?AUTO_684 ) ) ( FULL ?AUTO_683 ) ( CAN_TRAVERSE ?AUTO_685 ?AUTO_687 ?AUTO_684 ) ( AT ?AUTO_685 ?AUTO_687 ) ( VISIBLE ?AUTO_687 ?AUTO_684 ) ( not ( = ?AUTO_681 ?AUTO_687 ) ) ( not ( = ?AUTO_686 ?AUTO_687 ) ) ( not ( = ?AUTO_684 ?AUTO_687 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_685 ?AUTO_687 ?AUTO_684 )
      ( GET_ROCK_DATA ?AUTO_681 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_681 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_689 - WAYPOINT
    )
    :vars
    (
      ?AUTO_690 - LANDER
      ?AUTO_692 - WAYPOINT
      ?AUTO_695 - ROVER
      ?AUTO_694 - STORE
      ?AUTO_691 - WAYPOINT
      ?AUTO_693 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_690 ?AUTO_692 ) ( VISIBLE ?AUTO_689 ?AUTO_692 ) ( AVAILABLE ?AUTO_695 ) ( CHANNEL_FREE ?AUTO_690 ) ( not ( = ?AUTO_689 ?AUTO_692 ) ) ( AT_ROCK_SAMPLE ?AUTO_689 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_695 ) ( STORE_OF ?AUTO_694 ?AUTO_695 ) ( CAN_TRAVERSE ?AUTO_695 ?AUTO_692 ?AUTO_689 ) ( VISIBLE ?AUTO_692 ?AUTO_689 ) ( CAN_TRAVERSE ?AUTO_695 ?AUTO_691 ?AUTO_692 ) ( VISIBLE ?AUTO_691 ?AUTO_692 ) ( not ( = ?AUTO_689 ?AUTO_691 ) ) ( not ( = ?AUTO_692 ?AUTO_691 ) ) ( CAN_TRAVERSE ?AUTO_695 ?AUTO_693 ?AUTO_691 ) ( AT ?AUTO_695 ?AUTO_693 ) ( VISIBLE ?AUTO_693 ?AUTO_691 ) ( not ( = ?AUTO_689 ?AUTO_693 ) ) ( not ( = ?AUTO_692 ?AUTO_693 ) ) ( not ( = ?AUTO_691 ?AUTO_693 ) ) ( AT_SOIL_SAMPLE ?AUTO_693 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_695 ) ( EMPTY ?AUTO_694 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_695 ?AUTO_694 ?AUTO_693 )
      ( GET_ROCK_DATA ?AUTO_689 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_689 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_704 - OBJECTIVE
      ?AUTO_705 - MODE
    )
    :vars
    (
      ?AUTO_708 - LANDER
      ?AUTO_707 - WAYPOINT
      ?AUTO_706 - ROVER
      ?AUTO_709 - WAYPOINT
      ?AUTO_710 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_708 ?AUTO_707 ) ( HAVE_IMAGE ?AUTO_706 ?AUTO_704 ?AUTO_705 ) ( VISIBLE ?AUTO_709 ?AUTO_707 ) ( AVAILABLE ?AUTO_706 ) ( CHANNEL_FREE ?AUTO_708 ) ( not ( = ?AUTO_709 ?AUTO_707 ) ) ( CAN_TRAVERSE ?AUTO_706 ?AUTO_710 ?AUTO_709 ) ( AT ?AUTO_706 ?AUTO_710 ) ( VISIBLE ?AUTO_710 ?AUTO_709 ) ( not ( = ?AUTO_707 ?AUTO_710 ) ) ( not ( = ?AUTO_709 ?AUTO_710 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_706 ?AUTO_710 ?AUTO_709 )
      ( GET_IMAGE_DATA ?AUTO_704 ?AUTO_705 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_704 ?AUTO_705 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_711 - OBJECTIVE
      ?AUTO_712 - MODE
    )
    :vars
    (
      ?AUTO_716 - LANDER
      ?AUTO_713 - WAYPOINT
      ?AUTO_715 - WAYPOINT
      ?AUTO_714 - ROVER
      ?AUTO_717 - WAYPOINT
      ?AUTO_718 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_716 ?AUTO_713 ) ( VISIBLE ?AUTO_715 ?AUTO_713 ) ( AVAILABLE ?AUTO_714 ) ( CHANNEL_FREE ?AUTO_716 ) ( not ( = ?AUTO_715 ?AUTO_713 ) ) ( CAN_TRAVERSE ?AUTO_714 ?AUTO_717 ?AUTO_715 ) ( AT ?AUTO_714 ?AUTO_717 ) ( VISIBLE ?AUTO_717 ?AUTO_715 ) ( not ( = ?AUTO_713 ?AUTO_717 ) ) ( not ( = ?AUTO_715 ?AUTO_717 ) ) ( CALIBRATED ?AUTO_718 ?AUTO_714 ) ( ON_BOARD ?AUTO_718 ?AUTO_714 ) ( EQUIPPED_FOR_IMAGING ?AUTO_714 ) ( SUPPORTS ?AUTO_718 ?AUTO_712 ) ( VISIBLE_FROM ?AUTO_711 ?AUTO_717 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_714 ?AUTO_717 ?AUTO_711 ?AUTO_718 ?AUTO_712 )
      ( GET_IMAGE_DATA ?AUTO_711 ?AUTO_712 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_711 ?AUTO_712 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_719 - OBJECTIVE
      ?AUTO_720 - MODE
    )
    :vars
    (
      ?AUTO_722 - LANDER
      ?AUTO_723 - WAYPOINT
      ?AUTO_725 - WAYPOINT
      ?AUTO_721 - ROVER
      ?AUTO_724 - WAYPOINT
      ?AUTO_726 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_722 ?AUTO_723 ) ( VISIBLE ?AUTO_725 ?AUTO_723 ) ( AVAILABLE ?AUTO_721 ) ( CHANNEL_FREE ?AUTO_722 ) ( not ( = ?AUTO_725 ?AUTO_723 ) ) ( CAN_TRAVERSE ?AUTO_721 ?AUTO_724 ?AUTO_725 ) ( AT ?AUTO_721 ?AUTO_724 ) ( VISIBLE ?AUTO_724 ?AUTO_725 ) ( not ( = ?AUTO_723 ?AUTO_724 ) ) ( not ( = ?AUTO_725 ?AUTO_724 ) ) ( ON_BOARD ?AUTO_726 ?AUTO_721 ) ( EQUIPPED_FOR_IMAGING ?AUTO_721 ) ( SUPPORTS ?AUTO_726 ?AUTO_720 ) ( VISIBLE_FROM ?AUTO_719 ?AUTO_724 ) ( CALIBRATION_TARGET ?AUTO_726 ?AUTO_719 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_721 ?AUTO_726 ?AUTO_719 ?AUTO_724 )
      ( GET_IMAGE_DATA ?AUTO_719 ?AUTO_720 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_719 ?AUTO_720 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_727 - OBJECTIVE
      ?AUTO_728 - MODE
    )
    :vars
    (
      ?AUTO_731 - LANDER
      ?AUTO_733 - WAYPOINT
      ?AUTO_729 - WAYPOINT
      ?AUTO_730 - ROVER
      ?AUTO_734 - WAYPOINT
      ?AUTO_732 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_731 ?AUTO_733 ) ( VISIBLE ?AUTO_729 ?AUTO_733 ) ( AVAILABLE ?AUTO_730 ) ( CHANNEL_FREE ?AUTO_731 ) ( not ( = ?AUTO_729 ?AUTO_733 ) ) ( CAN_TRAVERSE ?AUTO_730 ?AUTO_734 ?AUTO_729 ) ( VISIBLE ?AUTO_734 ?AUTO_729 ) ( not ( = ?AUTO_733 ?AUTO_734 ) ) ( not ( = ?AUTO_729 ?AUTO_734 ) ) ( ON_BOARD ?AUTO_732 ?AUTO_730 ) ( EQUIPPED_FOR_IMAGING ?AUTO_730 ) ( SUPPORTS ?AUTO_732 ?AUTO_728 ) ( VISIBLE_FROM ?AUTO_727 ?AUTO_734 ) ( CALIBRATION_TARGET ?AUTO_732 ?AUTO_727 ) ( CAN_TRAVERSE ?AUTO_730 ?AUTO_729 ?AUTO_734 ) ( AT ?AUTO_730 ?AUTO_729 ) ( VISIBLE ?AUTO_729 ?AUTO_734 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_730 ?AUTO_729 ?AUTO_734 )
      ( GET_IMAGE_DATA ?AUTO_727 ?AUTO_728 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_727 ?AUTO_728 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_778 - WAYPOINT
    )
    :vars
    (
      ?AUTO_782 - LANDER
      ?AUTO_781 - WAYPOINT
      ?AUTO_780 - ROVER
      ?AUTO_779 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_782 ?AUTO_778 ) ( VISIBLE ?AUTO_781 ?AUTO_778 ) ( AVAILABLE ?AUTO_780 ) ( CHANNEL_FREE ?AUTO_782 ) ( not ( = ?AUTO_778 ?AUTO_781 ) ) ( CAN_TRAVERSE ?AUTO_780 ?AUTO_778 ?AUTO_781 ) ( VISIBLE ?AUTO_778 ?AUTO_781 ) ( AT_ROCK_SAMPLE ?AUTO_778 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_780 ) ( STORE_OF ?AUTO_779 ?AUTO_780 ) ( EMPTY ?AUTO_779 ) ( CAN_TRAVERSE ?AUTO_780 ?AUTO_781 ?AUTO_778 ) ( AT ?AUTO_780 ?AUTO_781 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_780 ?AUTO_781 ?AUTO_778 )
      ( GET_ROCK_DATA ?AUTO_778 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_778 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_783 - WAYPOINT
    )
    :vars
    (
      ?AUTO_784 - LANDER
      ?AUTO_787 - WAYPOINT
      ?AUTO_786 - ROVER
      ?AUTO_785 - STORE
      ?AUTO_788 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_784 ?AUTO_783 ) ( VISIBLE ?AUTO_787 ?AUTO_783 ) ( AVAILABLE ?AUTO_786 ) ( CHANNEL_FREE ?AUTO_784 ) ( not ( = ?AUTO_783 ?AUTO_787 ) ) ( CAN_TRAVERSE ?AUTO_786 ?AUTO_783 ?AUTO_787 ) ( VISIBLE ?AUTO_783 ?AUTO_787 ) ( AT_ROCK_SAMPLE ?AUTO_783 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_786 ) ( STORE_OF ?AUTO_785 ?AUTO_786 ) ( EMPTY ?AUTO_785 ) ( CAN_TRAVERSE ?AUTO_786 ?AUTO_787 ?AUTO_783 ) ( CAN_TRAVERSE ?AUTO_786 ?AUTO_788 ?AUTO_787 ) ( AT ?AUTO_786 ?AUTO_788 ) ( VISIBLE ?AUTO_788 ?AUTO_787 ) ( not ( = ?AUTO_783 ?AUTO_788 ) ) ( not ( = ?AUTO_787 ?AUTO_788 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_786 ?AUTO_788 ?AUTO_787 )
      ( GET_ROCK_DATA ?AUTO_783 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_783 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_790 - WAYPOINT
    )
    :vars
    (
      ?AUTO_793 - LANDER
      ?AUTO_792 - WAYPOINT
      ?AUTO_794 - ROVER
      ?AUTO_795 - STORE
      ?AUTO_791 - WAYPOINT
      ?AUTO_796 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_793 ?AUTO_790 ) ( VISIBLE ?AUTO_792 ?AUTO_790 ) ( AVAILABLE ?AUTO_794 ) ( CHANNEL_FREE ?AUTO_793 ) ( not ( = ?AUTO_790 ?AUTO_792 ) ) ( CAN_TRAVERSE ?AUTO_794 ?AUTO_790 ?AUTO_792 ) ( VISIBLE ?AUTO_790 ?AUTO_792 ) ( AT_ROCK_SAMPLE ?AUTO_790 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_794 ) ( STORE_OF ?AUTO_795 ?AUTO_794 ) ( EMPTY ?AUTO_795 ) ( CAN_TRAVERSE ?AUTO_794 ?AUTO_792 ?AUTO_790 ) ( CAN_TRAVERSE ?AUTO_794 ?AUTO_791 ?AUTO_792 ) ( VISIBLE ?AUTO_791 ?AUTO_792 ) ( not ( = ?AUTO_790 ?AUTO_791 ) ) ( not ( = ?AUTO_792 ?AUTO_791 ) ) ( CAN_TRAVERSE ?AUTO_794 ?AUTO_796 ?AUTO_791 ) ( AT ?AUTO_794 ?AUTO_796 ) ( VISIBLE ?AUTO_796 ?AUTO_791 ) ( not ( = ?AUTO_790 ?AUTO_796 ) ) ( not ( = ?AUTO_792 ?AUTO_796 ) ) ( not ( = ?AUTO_791 ?AUTO_796 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_794 ?AUTO_796 ?AUTO_791 )
      ( GET_ROCK_DATA ?AUTO_790 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_790 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_797 - WAYPOINT
    )
    :vars
    (
      ?AUTO_800 - LANDER
      ?AUTO_798 - WAYPOINT
      ?AUTO_802 - ROVER
      ?AUTO_801 - STORE
      ?AUTO_799 - WAYPOINT
      ?AUTO_803 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_800 ?AUTO_797 ) ( VISIBLE ?AUTO_798 ?AUTO_797 ) ( AVAILABLE ?AUTO_802 ) ( CHANNEL_FREE ?AUTO_800 ) ( not ( = ?AUTO_797 ?AUTO_798 ) ) ( CAN_TRAVERSE ?AUTO_802 ?AUTO_797 ?AUTO_798 ) ( VISIBLE ?AUTO_797 ?AUTO_798 ) ( AT_ROCK_SAMPLE ?AUTO_797 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_802 ) ( STORE_OF ?AUTO_801 ?AUTO_802 ) ( CAN_TRAVERSE ?AUTO_802 ?AUTO_798 ?AUTO_797 ) ( CAN_TRAVERSE ?AUTO_802 ?AUTO_799 ?AUTO_798 ) ( VISIBLE ?AUTO_799 ?AUTO_798 ) ( not ( = ?AUTO_797 ?AUTO_799 ) ) ( not ( = ?AUTO_798 ?AUTO_799 ) ) ( CAN_TRAVERSE ?AUTO_802 ?AUTO_803 ?AUTO_799 ) ( AT ?AUTO_802 ?AUTO_803 ) ( VISIBLE ?AUTO_803 ?AUTO_799 ) ( not ( = ?AUTO_797 ?AUTO_803 ) ) ( not ( = ?AUTO_798 ?AUTO_803 ) ) ( not ( = ?AUTO_799 ?AUTO_803 ) ) ( FULL ?AUTO_801 ) )
    :subtasks
    ( ( !DROP ?AUTO_802 ?AUTO_801 )
      ( GET_ROCK_DATA ?AUTO_797 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_797 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_821 - WAYPOINT
    )
    :vars
    (
      ?AUTO_825 - LANDER
      ?AUTO_824 - WAYPOINT
      ?AUTO_822 - WAYPOINT
      ?AUTO_823 - ROVER
      ?AUTO_826 - STORE
      ?AUTO_827 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_825 ?AUTO_824 ) ( VISIBLE ?AUTO_822 ?AUTO_824 ) ( AVAILABLE ?AUTO_823 ) ( CHANNEL_FREE ?AUTO_825 ) ( not ( = ?AUTO_821 ?AUTO_822 ) ) ( not ( = ?AUTO_821 ?AUTO_824 ) ) ( not ( = ?AUTO_822 ?AUTO_824 ) ) ( CAN_TRAVERSE ?AUTO_823 ?AUTO_821 ?AUTO_822 ) ( VISIBLE ?AUTO_821 ?AUTO_822 ) ( AT_SOIL_SAMPLE ?AUTO_821 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_823 ) ( STORE_OF ?AUTO_826 ?AUTO_823 ) ( EMPTY ?AUTO_826 ) ( CAN_TRAVERSE ?AUTO_823 ?AUTO_827 ?AUTO_821 ) ( AT ?AUTO_823 ?AUTO_827 ) ( VISIBLE ?AUTO_827 ?AUTO_821 ) ( not ( = ?AUTO_821 ?AUTO_827 ) ) ( not ( = ?AUTO_824 ?AUTO_827 ) ) ( not ( = ?AUTO_822 ?AUTO_827 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_823 ?AUTO_827 ?AUTO_821 )
      ( GET_SOIL_DATA ?AUTO_821 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_821 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_843 - OBJECTIVE
      ?AUTO_844 - MODE
    )
    :vars
    (
      ?AUTO_846 - LANDER
      ?AUTO_845 - WAYPOINT
      ?AUTO_847 - WAYPOINT
      ?AUTO_848 - ROVER
      ?AUTO_849 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_846 ?AUTO_845 ) ( VISIBLE ?AUTO_847 ?AUTO_845 ) ( AVAILABLE ?AUTO_848 ) ( CHANNEL_FREE ?AUTO_846 ) ( not ( = ?AUTO_847 ?AUTO_845 ) ) ( CALIBRATED ?AUTO_849 ?AUTO_848 ) ( ON_BOARD ?AUTO_849 ?AUTO_848 ) ( EQUIPPED_FOR_IMAGING ?AUTO_848 ) ( SUPPORTS ?AUTO_849 ?AUTO_844 ) ( VISIBLE_FROM ?AUTO_843 ?AUTO_847 ) ( CAN_TRAVERSE ?AUTO_848 ?AUTO_845 ?AUTO_847 ) ( AT ?AUTO_848 ?AUTO_845 ) ( VISIBLE ?AUTO_845 ?AUTO_847 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_848 ?AUTO_845 ?AUTO_847 )
      ( GET_IMAGE_DATA ?AUTO_843 ?AUTO_844 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_843 ?AUTO_844 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_850 - OBJECTIVE
      ?AUTO_851 - MODE
    )
    :vars
    (
      ?AUTO_853 - LANDER
      ?AUTO_852 - WAYPOINT
      ?AUTO_855 - WAYPOINT
      ?AUTO_854 - ROVER
      ?AUTO_856 - CAMERA
      ?AUTO_857 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_853 ?AUTO_852 ) ( VISIBLE ?AUTO_855 ?AUTO_852 ) ( AVAILABLE ?AUTO_854 ) ( CHANNEL_FREE ?AUTO_853 ) ( not ( = ?AUTO_855 ?AUTO_852 ) ) ( ON_BOARD ?AUTO_856 ?AUTO_854 ) ( EQUIPPED_FOR_IMAGING ?AUTO_854 ) ( SUPPORTS ?AUTO_856 ?AUTO_851 ) ( VISIBLE_FROM ?AUTO_850 ?AUTO_855 ) ( CAN_TRAVERSE ?AUTO_854 ?AUTO_852 ?AUTO_855 ) ( AT ?AUTO_854 ?AUTO_852 ) ( VISIBLE ?AUTO_852 ?AUTO_855 ) ( CALIBRATION_TARGET ?AUTO_856 ?AUTO_857 ) ( VISIBLE_FROM ?AUTO_857 ?AUTO_852 ) ( not ( = ?AUTO_850 ?AUTO_857 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_854 ?AUTO_856 ?AUTO_857 ?AUTO_852 )
      ( GET_IMAGE_DATA ?AUTO_850 ?AUTO_851 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_850 ?AUTO_851 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_860 - OBJECTIVE
      ?AUTO_861 - MODE
    )
    :vars
    (
      ?AUTO_862 - LANDER
      ?AUTO_867 - WAYPOINT
      ?AUTO_864 - WAYPOINT
      ?AUTO_865 - ROVER
      ?AUTO_863 - CAMERA
      ?AUTO_866 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_862 ?AUTO_867 ) ( VISIBLE ?AUTO_864 ?AUTO_867 ) ( AVAILABLE ?AUTO_865 ) ( CHANNEL_FREE ?AUTO_862 ) ( not ( = ?AUTO_864 ?AUTO_867 ) ) ( ON_BOARD ?AUTO_863 ?AUTO_865 ) ( EQUIPPED_FOR_IMAGING ?AUTO_865 ) ( SUPPORTS ?AUTO_863 ?AUTO_861 ) ( VISIBLE_FROM ?AUTO_860 ?AUTO_864 ) ( CAN_TRAVERSE ?AUTO_865 ?AUTO_867 ?AUTO_864 ) ( VISIBLE ?AUTO_867 ?AUTO_864 ) ( CALIBRATION_TARGET ?AUTO_863 ?AUTO_866 ) ( VISIBLE_FROM ?AUTO_866 ?AUTO_867 ) ( not ( = ?AUTO_860 ?AUTO_866 ) ) ( CAN_TRAVERSE ?AUTO_865 ?AUTO_864 ?AUTO_867 ) ( AT ?AUTO_865 ?AUTO_864 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_865 ?AUTO_864 ?AUTO_867 )
      ( GET_IMAGE_DATA ?AUTO_860 ?AUTO_861 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_860 ?AUTO_861 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_890 - OBJECTIVE
      ?AUTO_891 - MODE
    )
    :vars
    (
      ?AUTO_895 - LANDER
      ?AUTO_892 - WAYPOINT
      ?AUTO_894 - WAYPOINT
      ?AUTO_896 - ROVER
      ?AUTO_893 - CAMERA
      ?AUTO_897 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_895 ?AUTO_892 ) ( VISIBLE ?AUTO_894 ?AUTO_892 ) ( AVAILABLE ?AUTO_896 ) ( CHANNEL_FREE ?AUTO_895 ) ( not ( = ?AUTO_894 ?AUTO_892 ) ) ( CALIBRATED ?AUTO_893 ?AUTO_896 ) ( ON_BOARD ?AUTO_893 ?AUTO_896 ) ( EQUIPPED_FOR_IMAGING ?AUTO_896 ) ( SUPPORTS ?AUTO_893 ?AUTO_891 ) ( VISIBLE_FROM ?AUTO_890 ?AUTO_894 ) ( CAN_TRAVERSE ?AUTO_896 ?AUTO_892 ?AUTO_894 ) ( VISIBLE ?AUTO_892 ?AUTO_894 ) ( CAN_TRAVERSE ?AUTO_896 ?AUTO_897 ?AUTO_892 ) ( AT ?AUTO_896 ?AUTO_897 ) ( VISIBLE ?AUTO_897 ?AUTO_892 ) ( not ( = ?AUTO_892 ?AUTO_897 ) ) ( not ( = ?AUTO_894 ?AUTO_897 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_896 ?AUTO_897 ?AUTO_892 )
      ( GET_IMAGE_DATA ?AUTO_890 ?AUTO_891 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_890 ?AUTO_891 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_956 - OBJECTIVE
      ?AUTO_957 - MODE
    )
    :vars
    (
      ?AUTO_960 - ROVER
      ?AUTO_961 - WAYPOINT
      ?AUTO_958 - LANDER
      ?AUTO_962 - WAYPOINT
      ?AUTO_959 - CAMERA
      ?AUTO_963 - OBJECTIVE
    )
    :precondition
    ( and ( AT ?AUTO_960 ?AUTO_961 ) ( AT_LANDER ?AUTO_958 ?AUTO_962 ) ( VISIBLE ?AUTO_961 ?AUTO_962 ) ( AVAILABLE ?AUTO_960 ) ( CHANNEL_FREE ?AUTO_958 ) ( not ( = ?AUTO_961 ?AUTO_962 ) ) ( ON_BOARD ?AUTO_959 ?AUTO_960 ) ( EQUIPPED_FOR_IMAGING ?AUTO_960 ) ( SUPPORTS ?AUTO_959 ?AUTO_957 ) ( VISIBLE_FROM ?AUTO_956 ?AUTO_961 ) ( CALIBRATION_TARGET ?AUTO_959 ?AUTO_963 ) ( VISIBLE_FROM ?AUTO_963 ?AUTO_961 ) ( not ( = ?AUTO_956 ?AUTO_963 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_960 ?AUTO_959 ?AUTO_963 ?AUTO_961 )
      ( GET_IMAGE_DATA ?AUTO_956 ?AUTO_957 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_956 ?AUTO_957 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_968 - OBJECTIVE
      ?AUTO_969 - MODE
    )
    :vars
    (
      ?AUTO_971 - LANDER
      ?AUTO_972 - WAYPOINT
      ?AUTO_970 - WAYPOINT
      ?AUTO_973 - ROVER
      ?AUTO_975 - CAMERA
      ?AUTO_974 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_971 ?AUTO_972 ) ( VISIBLE ?AUTO_970 ?AUTO_972 ) ( AVAILABLE ?AUTO_973 ) ( CHANNEL_FREE ?AUTO_971 ) ( not ( = ?AUTO_970 ?AUTO_972 ) ) ( ON_BOARD ?AUTO_975 ?AUTO_973 ) ( EQUIPPED_FOR_IMAGING ?AUTO_973 ) ( SUPPORTS ?AUTO_975 ?AUTO_969 ) ( VISIBLE_FROM ?AUTO_968 ?AUTO_970 ) ( CALIBRATION_TARGET ?AUTO_975 ?AUTO_974 ) ( VISIBLE_FROM ?AUTO_974 ?AUTO_970 ) ( not ( = ?AUTO_968 ?AUTO_974 ) ) ( CAN_TRAVERSE ?AUTO_973 ?AUTO_972 ?AUTO_970 ) ( AT ?AUTO_973 ?AUTO_972 ) ( VISIBLE ?AUTO_972 ?AUTO_970 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_973 ?AUTO_972 ?AUTO_970 )
      ( GET_IMAGE_DATA ?AUTO_968 ?AUTO_969 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_968 ?AUTO_969 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_976 - OBJECTIVE
      ?AUTO_977 - MODE
    )
    :vars
    (
      ?AUTO_981 - LANDER
      ?AUTO_983 - WAYPOINT
      ?AUTO_978 - WAYPOINT
      ?AUTO_980 - ROVER
      ?AUTO_982 - CAMERA
      ?AUTO_979 - OBJECTIVE
      ?AUTO_984 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_981 ?AUTO_983 ) ( VISIBLE ?AUTO_978 ?AUTO_983 ) ( AVAILABLE ?AUTO_980 ) ( CHANNEL_FREE ?AUTO_981 ) ( not ( = ?AUTO_978 ?AUTO_983 ) ) ( ON_BOARD ?AUTO_982 ?AUTO_980 ) ( EQUIPPED_FOR_IMAGING ?AUTO_980 ) ( SUPPORTS ?AUTO_982 ?AUTO_977 ) ( VISIBLE_FROM ?AUTO_976 ?AUTO_978 ) ( CALIBRATION_TARGET ?AUTO_982 ?AUTO_979 ) ( VISIBLE_FROM ?AUTO_979 ?AUTO_978 ) ( not ( = ?AUTO_976 ?AUTO_979 ) ) ( CAN_TRAVERSE ?AUTO_980 ?AUTO_983 ?AUTO_978 ) ( VISIBLE ?AUTO_983 ?AUTO_978 ) ( CAN_TRAVERSE ?AUTO_980 ?AUTO_984 ?AUTO_983 ) ( AT ?AUTO_980 ?AUTO_984 ) ( VISIBLE ?AUTO_984 ?AUTO_983 ) ( not ( = ?AUTO_983 ?AUTO_984 ) ) ( not ( = ?AUTO_978 ?AUTO_984 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_980 ?AUTO_984 ?AUTO_983 )
      ( GET_IMAGE_DATA ?AUTO_976 ?AUTO_977 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_976 ?AUTO_977 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1048 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1051 - LANDER
      ?AUTO_1049 - WAYPOINT
      ?AUTO_1052 - ROVER
      ?AUTO_1050 - STORE
      ?AUTO_1053 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1051 ?AUTO_1049 ) ( VISIBLE ?AUTO_1048 ?AUTO_1049 ) ( AVAILABLE ?AUTO_1052 ) ( CHANNEL_FREE ?AUTO_1051 ) ( not ( = ?AUTO_1048 ?AUTO_1049 ) ) ( AT_SOIL_SAMPLE ?AUTO_1048 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1052 ) ( STORE_OF ?AUTO_1050 ?AUTO_1052 ) ( EMPTY ?AUTO_1050 ) ( CAN_TRAVERSE ?AUTO_1052 ?AUTO_1049 ?AUTO_1048 ) ( VISIBLE ?AUTO_1049 ?AUTO_1048 ) ( CAN_TRAVERSE ?AUTO_1052 ?AUTO_1053 ?AUTO_1049 ) ( AT ?AUTO_1052 ?AUTO_1053 ) ( VISIBLE ?AUTO_1053 ?AUTO_1049 ) ( not ( = ?AUTO_1048 ?AUTO_1053 ) ) ( not ( = ?AUTO_1049 ?AUTO_1053 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1052 ?AUTO_1053 ?AUTO_1049 )
      ( GET_SOIL_DATA ?AUTO_1048 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1048 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1068 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1070 - LANDER
      ?AUTO_1071 - WAYPOINT
      ?AUTO_1069 - ROVER
      ?AUTO_1072 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1070 ?AUTO_1068 ) ( VISIBLE ?AUTO_1071 ?AUTO_1068 ) ( AVAILABLE ?AUTO_1069 ) ( CHANNEL_FREE ?AUTO_1070 ) ( not ( = ?AUTO_1068 ?AUTO_1071 ) ) ( CAN_TRAVERSE ?AUTO_1069 ?AUTO_1068 ?AUTO_1071 ) ( VISIBLE ?AUTO_1068 ?AUTO_1071 ) ( AT_SOIL_SAMPLE ?AUTO_1068 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1069 ) ( STORE_OF ?AUTO_1072 ?AUTO_1069 ) ( EMPTY ?AUTO_1072 ) ( CAN_TRAVERSE ?AUTO_1069 ?AUTO_1071 ?AUTO_1068 ) ( AT ?AUTO_1069 ?AUTO_1071 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1069 ?AUTO_1071 ?AUTO_1068 )
      ( GET_SOIL_DATA ?AUTO_1068 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1068 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1073 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1075 - LANDER
      ?AUTO_1076 - WAYPOINT
      ?AUTO_1074 - ROVER
      ?AUTO_1077 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1075 ?AUTO_1073 ) ( VISIBLE ?AUTO_1076 ?AUTO_1073 ) ( AVAILABLE ?AUTO_1074 ) ( CHANNEL_FREE ?AUTO_1075 ) ( not ( = ?AUTO_1073 ?AUTO_1076 ) ) ( CAN_TRAVERSE ?AUTO_1074 ?AUTO_1073 ?AUTO_1076 ) ( VISIBLE ?AUTO_1073 ?AUTO_1076 ) ( AT_SOIL_SAMPLE ?AUTO_1073 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1074 ) ( STORE_OF ?AUTO_1077 ?AUTO_1074 ) ( CAN_TRAVERSE ?AUTO_1074 ?AUTO_1076 ?AUTO_1073 ) ( AT ?AUTO_1074 ?AUTO_1076 ) ( FULL ?AUTO_1077 ) )
    :subtasks
    ( ( !DROP ?AUTO_1074 ?AUTO_1077 )
      ( GET_SOIL_DATA ?AUTO_1073 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1073 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1121 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1124 - LANDER
      ?AUTO_1122 - WAYPOINT
      ?AUTO_1125 - WAYPOINT
      ?AUTO_1126 - ROVER
      ?AUTO_1123 - STORE
      ?AUTO_1127 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1124 ?AUTO_1122 ) ( VISIBLE ?AUTO_1125 ?AUTO_1122 ) ( AVAILABLE ?AUTO_1126 ) ( CHANNEL_FREE ?AUTO_1124 ) ( not ( = ?AUTO_1121 ?AUTO_1125 ) ) ( not ( = ?AUTO_1121 ?AUTO_1122 ) ) ( not ( = ?AUTO_1125 ?AUTO_1122 ) ) ( CAN_TRAVERSE ?AUTO_1126 ?AUTO_1121 ?AUTO_1125 ) ( VISIBLE ?AUTO_1121 ?AUTO_1125 ) ( AT_SOIL_SAMPLE ?AUTO_1121 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1126 ) ( STORE_OF ?AUTO_1123 ?AUTO_1126 ) ( CAN_TRAVERSE ?AUTO_1126 ?AUTO_1127 ?AUTO_1121 ) ( AT ?AUTO_1126 ?AUTO_1127 ) ( VISIBLE ?AUTO_1127 ?AUTO_1121 ) ( not ( = ?AUTO_1121 ?AUTO_1127 ) ) ( not ( = ?AUTO_1122 ?AUTO_1127 ) ) ( not ( = ?AUTO_1125 ?AUTO_1127 ) ) ( FULL ?AUTO_1123 ) )
    :subtasks
    ( ( !DROP ?AUTO_1126 ?AUTO_1123 )
      ( GET_SOIL_DATA ?AUTO_1121 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1121 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1128 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1129 - LANDER
      ?AUTO_1133 - WAYPOINT
      ?AUTO_1131 - WAYPOINT
      ?AUTO_1134 - ROVER
      ?AUTO_1132 - STORE
      ?AUTO_1130 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1129 ?AUTO_1133 ) ( VISIBLE ?AUTO_1131 ?AUTO_1133 ) ( AVAILABLE ?AUTO_1134 ) ( CHANNEL_FREE ?AUTO_1129 ) ( not ( = ?AUTO_1128 ?AUTO_1131 ) ) ( not ( = ?AUTO_1128 ?AUTO_1133 ) ) ( not ( = ?AUTO_1131 ?AUTO_1133 ) ) ( CAN_TRAVERSE ?AUTO_1134 ?AUTO_1128 ?AUTO_1131 ) ( VISIBLE ?AUTO_1128 ?AUTO_1131 ) ( AT_SOIL_SAMPLE ?AUTO_1128 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1134 ) ( STORE_OF ?AUTO_1132 ?AUTO_1134 ) ( CAN_TRAVERSE ?AUTO_1134 ?AUTO_1130 ?AUTO_1128 ) ( VISIBLE ?AUTO_1130 ?AUTO_1128 ) ( not ( = ?AUTO_1128 ?AUTO_1130 ) ) ( not ( = ?AUTO_1133 ?AUTO_1130 ) ) ( not ( = ?AUTO_1131 ?AUTO_1130 ) ) ( FULL ?AUTO_1132 ) ( CAN_TRAVERSE ?AUTO_1134 ?AUTO_1131 ?AUTO_1130 ) ( AT ?AUTO_1134 ?AUTO_1131 ) ( VISIBLE ?AUTO_1131 ?AUTO_1130 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1134 ?AUTO_1131 ?AUTO_1130 )
      ( GET_SOIL_DATA ?AUTO_1128 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1128 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1136 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1141 - LANDER
      ?AUTO_1142 - WAYPOINT
      ?AUTO_1137 - WAYPOINT
      ?AUTO_1140 - ROVER
      ?AUTO_1139 - STORE
      ?AUTO_1138 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1141 ?AUTO_1142 ) ( VISIBLE ?AUTO_1137 ?AUTO_1142 ) ( AVAILABLE ?AUTO_1140 ) ( CHANNEL_FREE ?AUTO_1141 ) ( not ( = ?AUTO_1136 ?AUTO_1137 ) ) ( not ( = ?AUTO_1136 ?AUTO_1142 ) ) ( not ( = ?AUTO_1137 ?AUTO_1142 ) ) ( CAN_TRAVERSE ?AUTO_1140 ?AUTO_1136 ?AUTO_1137 ) ( VISIBLE ?AUTO_1136 ?AUTO_1137 ) ( AT_SOIL_SAMPLE ?AUTO_1136 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1140 ) ( STORE_OF ?AUTO_1139 ?AUTO_1140 ) ( CAN_TRAVERSE ?AUTO_1140 ?AUTO_1138 ?AUTO_1136 ) ( VISIBLE ?AUTO_1138 ?AUTO_1136 ) ( not ( = ?AUTO_1136 ?AUTO_1138 ) ) ( not ( = ?AUTO_1142 ?AUTO_1138 ) ) ( not ( = ?AUTO_1137 ?AUTO_1138 ) ) ( FULL ?AUTO_1139 ) ( CAN_TRAVERSE ?AUTO_1140 ?AUTO_1137 ?AUTO_1138 ) ( VISIBLE ?AUTO_1137 ?AUTO_1138 ) ( CAN_TRAVERSE ?AUTO_1140 ?AUTO_1142 ?AUTO_1137 ) ( AT ?AUTO_1140 ?AUTO_1142 ) ( VISIBLE ?AUTO_1142 ?AUTO_1137 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1140 ?AUTO_1142 ?AUTO_1137 )
      ( GET_SOIL_DATA ?AUTO_1136 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1136 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1143 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1146 - LANDER
      ?AUTO_1145 - WAYPOINT
      ?AUTO_1149 - WAYPOINT
      ?AUTO_1144 - ROVER
      ?AUTO_1147 - STORE
      ?AUTO_1148 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1146 ?AUTO_1145 ) ( VISIBLE ?AUTO_1149 ?AUTO_1145 ) ( AVAILABLE ?AUTO_1144 ) ( CHANNEL_FREE ?AUTO_1146 ) ( not ( = ?AUTO_1143 ?AUTO_1149 ) ) ( not ( = ?AUTO_1143 ?AUTO_1145 ) ) ( not ( = ?AUTO_1149 ?AUTO_1145 ) ) ( CAN_TRAVERSE ?AUTO_1144 ?AUTO_1143 ?AUTO_1149 ) ( VISIBLE ?AUTO_1143 ?AUTO_1149 ) ( AT_SOIL_SAMPLE ?AUTO_1143 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1144 ) ( STORE_OF ?AUTO_1147 ?AUTO_1144 ) ( CAN_TRAVERSE ?AUTO_1144 ?AUTO_1148 ?AUTO_1143 ) ( VISIBLE ?AUTO_1148 ?AUTO_1143 ) ( not ( = ?AUTO_1143 ?AUTO_1148 ) ) ( not ( = ?AUTO_1145 ?AUTO_1148 ) ) ( not ( = ?AUTO_1149 ?AUTO_1148 ) ) ( CAN_TRAVERSE ?AUTO_1144 ?AUTO_1149 ?AUTO_1148 ) ( VISIBLE ?AUTO_1149 ?AUTO_1148 ) ( CAN_TRAVERSE ?AUTO_1144 ?AUTO_1145 ?AUTO_1149 ) ( AT ?AUTO_1144 ?AUTO_1145 ) ( VISIBLE ?AUTO_1145 ?AUTO_1149 ) ( AT_SOIL_SAMPLE ?AUTO_1145 ) ( EMPTY ?AUTO_1147 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1144 ?AUTO_1147 ?AUTO_1145 )
      ( GET_SOIL_DATA ?AUTO_1143 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1143 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1150 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1155 - LANDER
      ?AUTO_1153 - WAYPOINT
      ?AUTO_1154 - WAYPOINT
      ?AUTO_1152 - ROVER
      ?AUTO_1151 - STORE
      ?AUTO_1156 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1155 ?AUTO_1153 ) ( VISIBLE ?AUTO_1154 ?AUTO_1153 ) ( AVAILABLE ?AUTO_1152 ) ( CHANNEL_FREE ?AUTO_1155 ) ( not ( = ?AUTO_1150 ?AUTO_1154 ) ) ( not ( = ?AUTO_1150 ?AUTO_1153 ) ) ( not ( = ?AUTO_1154 ?AUTO_1153 ) ) ( CAN_TRAVERSE ?AUTO_1152 ?AUTO_1150 ?AUTO_1154 ) ( VISIBLE ?AUTO_1150 ?AUTO_1154 ) ( AT_SOIL_SAMPLE ?AUTO_1150 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1152 ) ( STORE_OF ?AUTO_1151 ?AUTO_1152 ) ( CAN_TRAVERSE ?AUTO_1152 ?AUTO_1156 ?AUTO_1150 ) ( VISIBLE ?AUTO_1156 ?AUTO_1150 ) ( not ( = ?AUTO_1150 ?AUTO_1156 ) ) ( not ( = ?AUTO_1153 ?AUTO_1156 ) ) ( not ( = ?AUTO_1154 ?AUTO_1156 ) ) ( CAN_TRAVERSE ?AUTO_1152 ?AUTO_1154 ?AUTO_1156 ) ( VISIBLE ?AUTO_1154 ?AUTO_1156 ) ( CAN_TRAVERSE ?AUTO_1152 ?AUTO_1153 ?AUTO_1154 ) ( VISIBLE ?AUTO_1153 ?AUTO_1154 ) ( AT_SOIL_SAMPLE ?AUTO_1153 ) ( EMPTY ?AUTO_1151 ) ( CAN_TRAVERSE ?AUTO_1152 ?AUTO_1154 ?AUTO_1153 ) ( AT ?AUTO_1152 ?AUTO_1154 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1152 ?AUTO_1154 ?AUTO_1153 )
      ( GET_SOIL_DATA ?AUTO_1150 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1150 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1170 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1171 - LANDER
      ?AUTO_1175 - WAYPOINT
      ?AUTO_1174 - WAYPOINT
      ?AUTO_1173 - ROVER
      ?AUTO_1172 - STORE
      ?AUTO_1176 - WAYPOINT
      ?AUTO_1177 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1171 ?AUTO_1175 ) ( VISIBLE ?AUTO_1174 ?AUTO_1175 ) ( AVAILABLE ?AUTO_1173 ) ( CHANNEL_FREE ?AUTO_1171 ) ( not ( = ?AUTO_1170 ?AUTO_1174 ) ) ( not ( = ?AUTO_1170 ?AUTO_1175 ) ) ( not ( = ?AUTO_1174 ?AUTO_1175 ) ) ( CAN_TRAVERSE ?AUTO_1173 ?AUTO_1170 ?AUTO_1174 ) ( VISIBLE ?AUTO_1170 ?AUTO_1174 ) ( AT_SOIL_SAMPLE ?AUTO_1170 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1173 ) ( STORE_OF ?AUTO_1172 ?AUTO_1173 ) ( CAN_TRAVERSE ?AUTO_1173 ?AUTO_1176 ?AUTO_1170 ) ( VISIBLE ?AUTO_1176 ?AUTO_1170 ) ( not ( = ?AUTO_1170 ?AUTO_1176 ) ) ( not ( = ?AUTO_1175 ?AUTO_1176 ) ) ( not ( = ?AUTO_1174 ?AUTO_1176 ) ) ( CAN_TRAVERSE ?AUTO_1173 ?AUTO_1174 ?AUTO_1176 ) ( VISIBLE ?AUTO_1174 ?AUTO_1176 ) ( CAN_TRAVERSE ?AUTO_1173 ?AUTO_1175 ?AUTO_1174 ) ( VISIBLE ?AUTO_1175 ?AUTO_1174 ) ( AT_SOIL_SAMPLE ?AUTO_1175 ) ( EMPTY ?AUTO_1172 ) ( CAN_TRAVERSE ?AUTO_1173 ?AUTO_1177 ?AUTO_1175 ) ( AT ?AUTO_1173 ?AUTO_1177 ) ( VISIBLE ?AUTO_1177 ?AUTO_1175 ) ( not ( = ?AUTO_1170 ?AUTO_1177 ) ) ( not ( = ?AUTO_1175 ?AUTO_1177 ) ) ( not ( = ?AUTO_1174 ?AUTO_1177 ) ) ( not ( = ?AUTO_1176 ?AUTO_1177 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1173 ?AUTO_1177 ?AUTO_1175 )
      ( GET_SOIL_DATA ?AUTO_1170 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1170 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1194 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1197 - LANDER
      ?AUTO_1198 - WAYPOINT
      ?AUTO_1196 - ROVER
      ?AUTO_1199 - STORE
      ?AUTO_1195 - WAYPOINT
      ?AUTO_1200 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1197 ?AUTO_1198 ) ( VISIBLE ?AUTO_1194 ?AUTO_1198 ) ( AVAILABLE ?AUTO_1196 ) ( CHANNEL_FREE ?AUTO_1197 ) ( not ( = ?AUTO_1194 ?AUTO_1198 ) ) ( AT_ROCK_SAMPLE ?AUTO_1194 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1196 ) ( STORE_OF ?AUTO_1199 ?AUTO_1196 ) ( EMPTY ?AUTO_1199 ) ( CAN_TRAVERSE ?AUTO_1196 ?AUTO_1195 ?AUTO_1194 ) ( VISIBLE ?AUTO_1195 ?AUTO_1194 ) ( not ( = ?AUTO_1194 ?AUTO_1195 ) ) ( not ( = ?AUTO_1198 ?AUTO_1195 ) ) ( CAN_TRAVERSE ?AUTO_1196 ?AUTO_1200 ?AUTO_1195 ) ( AT ?AUTO_1196 ?AUTO_1200 ) ( VISIBLE ?AUTO_1200 ?AUTO_1195 ) ( not ( = ?AUTO_1194 ?AUTO_1200 ) ) ( not ( = ?AUTO_1198 ?AUTO_1200 ) ) ( not ( = ?AUTO_1195 ?AUTO_1200 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1196 ?AUTO_1200 ?AUTO_1195 )
      ( GET_ROCK_DATA ?AUTO_1194 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1194 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1202 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1206 - LANDER
      ?AUTO_1205 - WAYPOINT
      ?AUTO_1207 - ROVER
      ?AUTO_1203 - STORE
      ?AUTO_1204 - WAYPOINT
      ?AUTO_1208 - WAYPOINT
      ?AUTO_1209 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1206 ?AUTO_1205 ) ( VISIBLE ?AUTO_1202 ?AUTO_1205 ) ( AVAILABLE ?AUTO_1207 ) ( CHANNEL_FREE ?AUTO_1206 ) ( not ( = ?AUTO_1202 ?AUTO_1205 ) ) ( AT_ROCK_SAMPLE ?AUTO_1202 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1207 ) ( STORE_OF ?AUTO_1203 ?AUTO_1207 ) ( EMPTY ?AUTO_1203 ) ( CAN_TRAVERSE ?AUTO_1207 ?AUTO_1204 ?AUTO_1202 ) ( VISIBLE ?AUTO_1204 ?AUTO_1202 ) ( not ( = ?AUTO_1202 ?AUTO_1204 ) ) ( not ( = ?AUTO_1205 ?AUTO_1204 ) ) ( CAN_TRAVERSE ?AUTO_1207 ?AUTO_1208 ?AUTO_1204 ) ( VISIBLE ?AUTO_1208 ?AUTO_1204 ) ( not ( = ?AUTO_1202 ?AUTO_1208 ) ) ( not ( = ?AUTO_1205 ?AUTO_1208 ) ) ( not ( = ?AUTO_1204 ?AUTO_1208 ) ) ( CAN_TRAVERSE ?AUTO_1207 ?AUTO_1209 ?AUTO_1208 ) ( AT ?AUTO_1207 ?AUTO_1209 ) ( VISIBLE ?AUTO_1209 ?AUTO_1208 ) ( not ( = ?AUTO_1202 ?AUTO_1209 ) ) ( not ( = ?AUTO_1205 ?AUTO_1209 ) ) ( not ( = ?AUTO_1204 ?AUTO_1209 ) ) ( not ( = ?AUTO_1208 ?AUTO_1209 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1207 ?AUTO_1209 ?AUTO_1208 )
      ( GET_ROCK_DATA ?AUTO_1202 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1202 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1210 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1213 - LANDER
      ?AUTO_1215 - WAYPOINT
      ?AUTO_1214 - ROVER
      ?AUTO_1211 - STORE
      ?AUTO_1217 - WAYPOINT
      ?AUTO_1216 - WAYPOINT
      ?AUTO_1212 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1213 ?AUTO_1215 ) ( VISIBLE ?AUTO_1210 ?AUTO_1215 ) ( AVAILABLE ?AUTO_1214 ) ( CHANNEL_FREE ?AUTO_1213 ) ( not ( = ?AUTO_1210 ?AUTO_1215 ) ) ( AT_ROCK_SAMPLE ?AUTO_1210 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1214 ) ( STORE_OF ?AUTO_1211 ?AUTO_1214 ) ( CAN_TRAVERSE ?AUTO_1214 ?AUTO_1217 ?AUTO_1210 ) ( VISIBLE ?AUTO_1217 ?AUTO_1210 ) ( not ( = ?AUTO_1210 ?AUTO_1217 ) ) ( not ( = ?AUTO_1215 ?AUTO_1217 ) ) ( CAN_TRAVERSE ?AUTO_1214 ?AUTO_1216 ?AUTO_1217 ) ( VISIBLE ?AUTO_1216 ?AUTO_1217 ) ( not ( = ?AUTO_1210 ?AUTO_1216 ) ) ( not ( = ?AUTO_1215 ?AUTO_1216 ) ) ( not ( = ?AUTO_1217 ?AUTO_1216 ) ) ( CAN_TRAVERSE ?AUTO_1214 ?AUTO_1212 ?AUTO_1216 ) ( AT ?AUTO_1214 ?AUTO_1212 ) ( VISIBLE ?AUTO_1212 ?AUTO_1216 ) ( not ( = ?AUTO_1210 ?AUTO_1212 ) ) ( not ( = ?AUTO_1215 ?AUTO_1212 ) ) ( not ( = ?AUTO_1217 ?AUTO_1212 ) ) ( not ( = ?AUTO_1216 ?AUTO_1212 ) ) ( FULL ?AUTO_1211 ) )
    :subtasks
    ( ( !DROP ?AUTO_1214 ?AUTO_1211 )
      ( GET_ROCK_DATA ?AUTO_1210 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1210 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1220 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1224 - LANDER
      ?AUTO_1222 - WAYPOINT
      ?AUTO_1225 - ROVER
      ?AUTO_1223 - STORE
      ?AUTO_1221 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1224 ?AUTO_1222 ) ( VISIBLE ?AUTO_1220 ?AUTO_1222 ) ( AVAILABLE ?AUTO_1225 ) ( CHANNEL_FREE ?AUTO_1224 ) ( not ( = ?AUTO_1220 ?AUTO_1222 ) ) ( AT_ROCK_SAMPLE ?AUTO_1220 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1225 ) ( STORE_OF ?AUTO_1223 ?AUTO_1225 ) ( CAN_TRAVERSE ?AUTO_1225 ?AUTO_1221 ?AUTO_1220 ) ( AT ?AUTO_1225 ?AUTO_1221 ) ( VISIBLE ?AUTO_1221 ?AUTO_1220 ) ( not ( = ?AUTO_1220 ?AUTO_1221 ) ) ( not ( = ?AUTO_1222 ?AUTO_1221 ) ) ( FULL ?AUTO_1223 ) )
    :subtasks
    ( ( !DROP ?AUTO_1225 ?AUTO_1223 )
      ( GET_ROCK_DATA ?AUTO_1220 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1220 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1226 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1228 - LANDER
      ?AUTO_1227 - WAYPOINT
      ?AUTO_1231 - ROVER
      ?AUTO_1229 - STORE
      ?AUTO_1230 - WAYPOINT
      ?AUTO_1232 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1228 ?AUTO_1227 ) ( VISIBLE ?AUTO_1226 ?AUTO_1227 ) ( AVAILABLE ?AUTO_1231 ) ( CHANNEL_FREE ?AUTO_1228 ) ( not ( = ?AUTO_1226 ?AUTO_1227 ) ) ( AT_ROCK_SAMPLE ?AUTO_1226 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1231 ) ( STORE_OF ?AUTO_1229 ?AUTO_1231 ) ( CAN_TRAVERSE ?AUTO_1231 ?AUTO_1230 ?AUTO_1226 ) ( VISIBLE ?AUTO_1230 ?AUTO_1226 ) ( not ( = ?AUTO_1226 ?AUTO_1230 ) ) ( not ( = ?AUTO_1227 ?AUTO_1230 ) ) ( FULL ?AUTO_1229 ) ( CAN_TRAVERSE ?AUTO_1231 ?AUTO_1232 ?AUTO_1230 ) ( AT ?AUTO_1231 ?AUTO_1232 ) ( VISIBLE ?AUTO_1232 ?AUTO_1230 ) ( not ( = ?AUTO_1226 ?AUTO_1232 ) ) ( not ( = ?AUTO_1227 ?AUTO_1232 ) ) ( not ( = ?AUTO_1230 ?AUTO_1232 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1231 ?AUTO_1232 ?AUTO_1230 )
      ( GET_ROCK_DATA ?AUTO_1226 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1226 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1234 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1240 - LANDER
      ?AUTO_1237 - WAYPOINT
      ?AUTO_1239 - ROVER
      ?AUTO_1236 - STORE
      ?AUTO_1235 - WAYPOINT
      ?AUTO_1238 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1240 ?AUTO_1237 ) ( VISIBLE ?AUTO_1234 ?AUTO_1237 ) ( AVAILABLE ?AUTO_1239 ) ( CHANNEL_FREE ?AUTO_1240 ) ( not ( = ?AUTO_1234 ?AUTO_1237 ) ) ( AT_ROCK_SAMPLE ?AUTO_1234 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1239 ) ( STORE_OF ?AUTO_1236 ?AUTO_1239 ) ( CAN_TRAVERSE ?AUTO_1239 ?AUTO_1235 ?AUTO_1234 ) ( VISIBLE ?AUTO_1235 ?AUTO_1234 ) ( not ( = ?AUTO_1234 ?AUTO_1235 ) ) ( not ( = ?AUTO_1237 ?AUTO_1235 ) ) ( FULL ?AUTO_1236 ) ( CAN_TRAVERSE ?AUTO_1239 ?AUTO_1238 ?AUTO_1235 ) ( VISIBLE ?AUTO_1238 ?AUTO_1235 ) ( not ( = ?AUTO_1234 ?AUTO_1238 ) ) ( not ( = ?AUTO_1237 ?AUTO_1238 ) ) ( not ( = ?AUTO_1235 ?AUTO_1238 ) ) ( CAN_TRAVERSE ?AUTO_1239 ?AUTO_1237 ?AUTO_1238 ) ( AT ?AUTO_1239 ?AUTO_1237 ) ( VISIBLE ?AUTO_1237 ?AUTO_1238 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1239 ?AUTO_1237 ?AUTO_1238 )
      ( GET_ROCK_DATA ?AUTO_1234 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1234 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1241 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1245 - LANDER
      ?AUTO_1247 - WAYPOINT
      ?AUTO_1243 - ROVER
      ?AUTO_1246 - STORE
      ?AUTO_1242 - WAYPOINT
      ?AUTO_1244 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1245 ?AUTO_1247 ) ( VISIBLE ?AUTO_1241 ?AUTO_1247 ) ( AVAILABLE ?AUTO_1243 ) ( CHANNEL_FREE ?AUTO_1245 ) ( not ( = ?AUTO_1241 ?AUTO_1247 ) ) ( AT_ROCK_SAMPLE ?AUTO_1241 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1243 ) ( STORE_OF ?AUTO_1246 ?AUTO_1243 ) ( CAN_TRAVERSE ?AUTO_1243 ?AUTO_1242 ?AUTO_1241 ) ( VISIBLE ?AUTO_1242 ?AUTO_1241 ) ( not ( = ?AUTO_1241 ?AUTO_1242 ) ) ( not ( = ?AUTO_1247 ?AUTO_1242 ) ) ( CAN_TRAVERSE ?AUTO_1243 ?AUTO_1244 ?AUTO_1242 ) ( VISIBLE ?AUTO_1244 ?AUTO_1242 ) ( not ( = ?AUTO_1241 ?AUTO_1244 ) ) ( not ( = ?AUTO_1247 ?AUTO_1244 ) ) ( not ( = ?AUTO_1242 ?AUTO_1244 ) ) ( CAN_TRAVERSE ?AUTO_1243 ?AUTO_1247 ?AUTO_1244 ) ( AT ?AUTO_1243 ?AUTO_1247 ) ( VISIBLE ?AUTO_1247 ?AUTO_1244 ) ( AT_SOIL_SAMPLE ?AUTO_1247 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1243 ) ( EMPTY ?AUTO_1246 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1243 ?AUTO_1246 ?AUTO_1247 )
      ( GET_ROCK_DATA ?AUTO_1241 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1241 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1262 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1264 - LANDER
      ?AUTO_1268 - WAYPOINT
      ?AUTO_1267 - ROVER
      ?AUTO_1266 - STORE
      ?AUTO_1265 - WAYPOINT
      ?AUTO_1263 - WAYPOINT
      ?AUTO_1269 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1264 ?AUTO_1268 ) ( VISIBLE ?AUTO_1262 ?AUTO_1268 ) ( AVAILABLE ?AUTO_1267 ) ( CHANNEL_FREE ?AUTO_1264 ) ( not ( = ?AUTO_1262 ?AUTO_1268 ) ) ( AT_ROCK_SAMPLE ?AUTO_1262 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1267 ) ( STORE_OF ?AUTO_1266 ?AUTO_1267 ) ( CAN_TRAVERSE ?AUTO_1267 ?AUTO_1265 ?AUTO_1262 ) ( VISIBLE ?AUTO_1265 ?AUTO_1262 ) ( not ( = ?AUTO_1262 ?AUTO_1265 ) ) ( not ( = ?AUTO_1268 ?AUTO_1265 ) ) ( CAN_TRAVERSE ?AUTO_1267 ?AUTO_1263 ?AUTO_1265 ) ( VISIBLE ?AUTO_1263 ?AUTO_1265 ) ( not ( = ?AUTO_1262 ?AUTO_1263 ) ) ( not ( = ?AUTO_1268 ?AUTO_1263 ) ) ( not ( = ?AUTO_1265 ?AUTO_1263 ) ) ( CAN_TRAVERSE ?AUTO_1267 ?AUTO_1268 ?AUTO_1263 ) ( VISIBLE ?AUTO_1268 ?AUTO_1263 ) ( AT_SOIL_SAMPLE ?AUTO_1268 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1267 ) ( EMPTY ?AUTO_1266 ) ( CAN_TRAVERSE ?AUTO_1267 ?AUTO_1269 ?AUTO_1268 ) ( AT ?AUTO_1267 ?AUTO_1269 ) ( VISIBLE ?AUTO_1269 ?AUTO_1268 ) ( not ( = ?AUTO_1262 ?AUTO_1269 ) ) ( not ( = ?AUTO_1268 ?AUTO_1269 ) ) ( not ( = ?AUTO_1265 ?AUTO_1269 ) ) ( not ( = ?AUTO_1263 ?AUTO_1269 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1267 ?AUTO_1269 ?AUTO_1268 )
      ( GET_ROCK_DATA ?AUTO_1262 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1262 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1336 - OBJECTIVE
      ?AUTO_1337 - MODE
    )
    :vars
    (
      ?AUTO_1340 - LANDER
      ?AUTO_1339 - WAYPOINT
      ?AUTO_1342 - WAYPOINT
      ?AUTO_1341 - ROVER
      ?AUTO_1343 - CAMERA
      ?AUTO_1338 - WAYPOINT
      ?AUTO_1344 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1340 ?AUTO_1339 ) ( VISIBLE ?AUTO_1342 ?AUTO_1339 ) ( AVAILABLE ?AUTO_1341 ) ( CHANNEL_FREE ?AUTO_1340 ) ( not ( = ?AUTO_1342 ?AUTO_1339 ) ) ( CALIBRATED ?AUTO_1343 ?AUTO_1341 ) ( ON_BOARD ?AUTO_1343 ?AUTO_1341 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1341 ) ( SUPPORTS ?AUTO_1343 ?AUTO_1337 ) ( VISIBLE_FROM ?AUTO_1336 ?AUTO_1342 ) ( CAN_TRAVERSE ?AUTO_1341 ?AUTO_1338 ?AUTO_1342 ) ( VISIBLE ?AUTO_1338 ?AUTO_1342 ) ( not ( = ?AUTO_1339 ?AUTO_1338 ) ) ( not ( = ?AUTO_1342 ?AUTO_1338 ) ) ( CAN_TRAVERSE ?AUTO_1341 ?AUTO_1344 ?AUTO_1338 ) ( AT ?AUTO_1341 ?AUTO_1344 ) ( VISIBLE ?AUTO_1344 ?AUTO_1338 ) ( not ( = ?AUTO_1339 ?AUTO_1344 ) ) ( not ( = ?AUTO_1342 ?AUTO_1344 ) ) ( not ( = ?AUTO_1338 ?AUTO_1344 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1341 ?AUTO_1344 ?AUTO_1338 )
      ( GET_IMAGE_DATA ?AUTO_1336 ?AUTO_1337 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1336 ?AUTO_1337 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1349 - OBJECTIVE
      ?AUTO_1350 - MODE
    )
    :vars
    (
      ?AUTO_1353 - LANDER
      ?AUTO_1357 - WAYPOINT
      ?AUTO_1356 - WAYPOINT
      ?AUTO_1355 - ROVER
      ?AUTO_1351 - CAMERA
      ?AUTO_1354 - WAYPOINT
      ?AUTO_1352 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1353 ?AUTO_1357 ) ( VISIBLE ?AUTO_1356 ?AUTO_1357 ) ( AVAILABLE ?AUTO_1355 ) ( CHANNEL_FREE ?AUTO_1353 ) ( not ( = ?AUTO_1356 ?AUTO_1357 ) ) ( CALIBRATED ?AUTO_1351 ?AUTO_1355 ) ( ON_BOARD ?AUTO_1351 ?AUTO_1355 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1355 ) ( SUPPORTS ?AUTO_1351 ?AUTO_1350 ) ( VISIBLE_FROM ?AUTO_1349 ?AUTO_1356 ) ( CAN_TRAVERSE ?AUTO_1355 ?AUTO_1354 ?AUTO_1356 ) ( VISIBLE ?AUTO_1354 ?AUTO_1356 ) ( not ( = ?AUTO_1357 ?AUTO_1354 ) ) ( not ( = ?AUTO_1356 ?AUTO_1354 ) ) ( CAN_TRAVERSE ?AUTO_1355 ?AUTO_1352 ?AUTO_1354 ) ( VISIBLE ?AUTO_1352 ?AUTO_1354 ) ( not ( = ?AUTO_1357 ?AUTO_1352 ) ) ( not ( = ?AUTO_1356 ?AUTO_1352 ) ) ( not ( = ?AUTO_1354 ?AUTO_1352 ) ) ( CAN_TRAVERSE ?AUTO_1355 ?AUTO_1357 ?AUTO_1352 ) ( AT ?AUTO_1355 ?AUTO_1357 ) ( VISIBLE ?AUTO_1357 ?AUTO_1352 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1355 ?AUTO_1357 ?AUTO_1352 )
      ( GET_IMAGE_DATA ?AUTO_1349 ?AUTO_1350 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1349 ?AUTO_1350 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1358 - OBJECTIVE
      ?AUTO_1359 - MODE
    )
    :vars
    (
      ?AUTO_1365 - LANDER
      ?AUTO_1362 - WAYPOINT
      ?AUTO_1363 - WAYPOINT
      ?AUTO_1364 - ROVER
      ?AUTO_1360 - CAMERA
      ?AUTO_1366 - WAYPOINT
      ?AUTO_1361 - WAYPOINT
      ?AUTO_1367 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1365 ?AUTO_1362 ) ( VISIBLE ?AUTO_1363 ?AUTO_1362 ) ( AVAILABLE ?AUTO_1364 ) ( CHANNEL_FREE ?AUTO_1365 ) ( not ( = ?AUTO_1363 ?AUTO_1362 ) ) ( ON_BOARD ?AUTO_1360 ?AUTO_1364 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1364 ) ( SUPPORTS ?AUTO_1360 ?AUTO_1359 ) ( VISIBLE_FROM ?AUTO_1358 ?AUTO_1363 ) ( CAN_TRAVERSE ?AUTO_1364 ?AUTO_1366 ?AUTO_1363 ) ( VISIBLE ?AUTO_1366 ?AUTO_1363 ) ( not ( = ?AUTO_1362 ?AUTO_1366 ) ) ( not ( = ?AUTO_1363 ?AUTO_1366 ) ) ( CAN_TRAVERSE ?AUTO_1364 ?AUTO_1361 ?AUTO_1366 ) ( VISIBLE ?AUTO_1361 ?AUTO_1366 ) ( not ( = ?AUTO_1362 ?AUTO_1361 ) ) ( not ( = ?AUTO_1363 ?AUTO_1361 ) ) ( not ( = ?AUTO_1366 ?AUTO_1361 ) ) ( CAN_TRAVERSE ?AUTO_1364 ?AUTO_1362 ?AUTO_1361 ) ( AT ?AUTO_1364 ?AUTO_1362 ) ( VISIBLE ?AUTO_1362 ?AUTO_1361 ) ( CALIBRATION_TARGET ?AUTO_1360 ?AUTO_1367 ) ( VISIBLE_FROM ?AUTO_1367 ?AUTO_1362 ) ( not ( = ?AUTO_1358 ?AUTO_1367 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1364 ?AUTO_1360 ?AUTO_1367 ?AUTO_1362 )
      ( GET_IMAGE_DATA ?AUTO_1358 ?AUTO_1359 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1358 ?AUTO_1359 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1368 - OBJECTIVE
      ?AUTO_1369 - MODE
    )
    :vars
    (
      ?AUTO_1371 - LANDER
      ?AUTO_1376 - WAYPOINT
      ?AUTO_1372 - WAYPOINT
      ?AUTO_1373 - ROVER
      ?AUTO_1374 - CAMERA
      ?AUTO_1375 - WAYPOINT
      ?AUTO_1370 - WAYPOINT
      ?AUTO_1377 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1371 ?AUTO_1376 ) ( VISIBLE ?AUTO_1372 ?AUTO_1376 ) ( AVAILABLE ?AUTO_1373 ) ( CHANNEL_FREE ?AUTO_1371 ) ( not ( = ?AUTO_1372 ?AUTO_1376 ) ) ( ON_BOARD ?AUTO_1374 ?AUTO_1373 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1373 ) ( SUPPORTS ?AUTO_1374 ?AUTO_1369 ) ( VISIBLE_FROM ?AUTO_1368 ?AUTO_1372 ) ( CAN_TRAVERSE ?AUTO_1373 ?AUTO_1375 ?AUTO_1372 ) ( VISIBLE ?AUTO_1375 ?AUTO_1372 ) ( not ( = ?AUTO_1376 ?AUTO_1375 ) ) ( not ( = ?AUTO_1372 ?AUTO_1375 ) ) ( CAN_TRAVERSE ?AUTO_1373 ?AUTO_1370 ?AUTO_1375 ) ( VISIBLE ?AUTO_1370 ?AUTO_1375 ) ( not ( = ?AUTO_1376 ?AUTO_1370 ) ) ( not ( = ?AUTO_1372 ?AUTO_1370 ) ) ( not ( = ?AUTO_1375 ?AUTO_1370 ) ) ( CAN_TRAVERSE ?AUTO_1373 ?AUTO_1376 ?AUTO_1370 ) ( VISIBLE ?AUTO_1376 ?AUTO_1370 ) ( CALIBRATION_TARGET ?AUTO_1374 ?AUTO_1377 ) ( VISIBLE_FROM ?AUTO_1377 ?AUTO_1376 ) ( not ( = ?AUTO_1368 ?AUTO_1377 ) ) ( CAN_TRAVERSE ?AUTO_1373 ?AUTO_1372 ?AUTO_1376 ) ( AT ?AUTO_1373 ?AUTO_1372 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1373 ?AUTO_1372 ?AUTO_1376 )
      ( GET_IMAGE_DATA ?AUTO_1368 ?AUTO_1369 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1368 ?AUTO_1369 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1418 - OBJECTIVE
      ?AUTO_1419 - MODE
    )
    :vars
    (
      ?AUTO_1421 - LANDER
      ?AUTO_1425 - WAYPOINT
      ?AUTO_1422 - WAYPOINT
      ?AUTO_1424 - ROVER
      ?AUTO_1420 - CAMERA
      ?AUTO_1423 - WAYPOINT
      ?AUTO_1426 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1421 ?AUTO_1425 ) ( VISIBLE ?AUTO_1422 ?AUTO_1425 ) ( AVAILABLE ?AUTO_1424 ) ( CHANNEL_FREE ?AUTO_1421 ) ( not ( = ?AUTO_1422 ?AUTO_1425 ) ) ( ON_BOARD ?AUTO_1420 ?AUTO_1424 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1424 ) ( SUPPORTS ?AUTO_1420 ?AUTO_1419 ) ( VISIBLE_FROM ?AUTO_1418 ?AUTO_1422 ) ( CAN_TRAVERSE ?AUTO_1424 ?AUTO_1425 ?AUTO_1422 ) ( VISIBLE ?AUTO_1425 ?AUTO_1422 ) ( CAN_TRAVERSE ?AUTO_1424 ?AUTO_1423 ?AUTO_1425 ) ( AT ?AUTO_1424 ?AUTO_1423 ) ( VISIBLE ?AUTO_1423 ?AUTO_1425 ) ( not ( = ?AUTO_1425 ?AUTO_1423 ) ) ( not ( = ?AUTO_1422 ?AUTO_1423 ) ) ( CALIBRATION_TARGET ?AUTO_1420 ?AUTO_1426 ) ( VISIBLE_FROM ?AUTO_1426 ?AUTO_1423 ) ( not ( = ?AUTO_1418 ?AUTO_1426 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1424 ?AUTO_1420 ?AUTO_1426 ?AUTO_1423 )
      ( GET_IMAGE_DATA ?AUTO_1418 ?AUTO_1419 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1418 ?AUTO_1419 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1427 - OBJECTIVE
      ?AUTO_1428 - MODE
    )
    :vars
    (
      ?AUTO_1434 - LANDER
      ?AUTO_1431 - WAYPOINT
      ?AUTO_1432 - WAYPOINT
      ?AUTO_1430 - ROVER
      ?AUTO_1433 - CAMERA
      ?AUTO_1429 - WAYPOINT
      ?AUTO_1435 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1434 ?AUTO_1431 ) ( VISIBLE ?AUTO_1432 ?AUTO_1431 ) ( AVAILABLE ?AUTO_1430 ) ( CHANNEL_FREE ?AUTO_1434 ) ( not ( = ?AUTO_1432 ?AUTO_1431 ) ) ( ON_BOARD ?AUTO_1433 ?AUTO_1430 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1430 ) ( SUPPORTS ?AUTO_1433 ?AUTO_1428 ) ( VISIBLE_FROM ?AUTO_1427 ?AUTO_1432 ) ( CAN_TRAVERSE ?AUTO_1430 ?AUTO_1431 ?AUTO_1432 ) ( VISIBLE ?AUTO_1431 ?AUTO_1432 ) ( CAN_TRAVERSE ?AUTO_1430 ?AUTO_1429 ?AUTO_1431 ) ( VISIBLE ?AUTO_1429 ?AUTO_1431 ) ( not ( = ?AUTO_1431 ?AUTO_1429 ) ) ( not ( = ?AUTO_1432 ?AUTO_1429 ) ) ( CALIBRATION_TARGET ?AUTO_1433 ?AUTO_1435 ) ( VISIBLE_FROM ?AUTO_1435 ?AUTO_1429 ) ( not ( = ?AUTO_1427 ?AUTO_1435 ) ) ( CAN_TRAVERSE ?AUTO_1430 ?AUTO_1431 ?AUTO_1429 ) ( AT ?AUTO_1430 ?AUTO_1431 ) ( VISIBLE ?AUTO_1431 ?AUTO_1429 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1430 ?AUTO_1431 ?AUTO_1429 )
      ( GET_IMAGE_DATA ?AUTO_1427 ?AUTO_1428 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1427 ?AUTO_1428 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1450 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1453 - LANDER
      ?AUTO_1452 - WAYPOINT
      ?AUTO_1451 - ROVER
      ?AUTO_1454 - WAYPOINT
      ?AUTO_1455 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1453 ?AUTO_1452 ) ( HAVE_SOIL_ANALYSIS ?AUTO_1451 ?AUTO_1450 ) ( VISIBLE ?AUTO_1454 ?AUTO_1452 ) ( AVAILABLE ?AUTO_1451 ) ( CHANNEL_FREE ?AUTO_1453 ) ( not ( = ?AUTO_1450 ?AUTO_1454 ) ) ( not ( = ?AUTO_1450 ?AUTO_1452 ) ) ( not ( = ?AUTO_1454 ?AUTO_1452 ) ) ( CAN_TRAVERSE ?AUTO_1451 ?AUTO_1455 ?AUTO_1454 ) ( AT ?AUTO_1451 ?AUTO_1455 ) ( VISIBLE ?AUTO_1455 ?AUTO_1454 ) ( not ( = ?AUTO_1450 ?AUTO_1455 ) ) ( not ( = ?AUTO_1452 ?AUTO_1455 ) ) ( not ( = ?AUTO_1454 ?AUTO_1455 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1451 ?AUTO_1455 ?AUTO_1454 )
      ( GET_SOIL_DATA ?AUTO_1450 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1450 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1456 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1461 - LANDER
      ?AUTO_1459 - WAYPOINT
      ?AUTO_1458 - ROVER
      ?AUTO_1460 - WAYPOINT
      ?AUTO_1457 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1461 ?AUTO_1459 ) ( HAVE_SOIL_ANALYSIS ?AUTO_1458 ?AUTO_1456 ) ( VISIBLE ?AUTO_1460 ?AUTO_1459 ) ( AVAILABLE ?AUTO_1458 ) ( CHANNEL_FREE ?AUTO_1461 ) ( not ( = ?AUTO_1456 ?AUTO_1460 ) ) ( not ( = ?AUTO_1456 ?AUTO_1459 ) ) ( not ( = ?AUTO_1460 ?AUTO_1459 ) ) ( CAN_TRAVERSE ?AUTO_1458 ?AUTO_1457 ?AUTO_1460 ) ( VISIBLE ?AUTO_1457 ?AUTO_1460 ) ( not ( = ?AUTO_1456 ?AUTO_1457 ) ) ( not ( = ?AUTO_1459 ?AUTO_1457 ) ) ( not ( = ?AUTO_1460 ?AUTO_1457 ) ) ( CAN_TRAVERSE ?AUTO_1458 ?AUTO_1456 ?AUTO_1457 ) ( AT ?AUTO_1458 ?AUTO_1456 ) ( VISIBLE ?AUTO_1456 ?AUTO_1457 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1458 ?AUTO_1456 ?AUTO_1457 )
      ( GET_SOIL_DATA ?AUTO_1456 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1456 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1462 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1465 - LANDER
      ?AUTO_1467 - WAYPOINT
      ?AUTO_1466 - WAYPOINT
      ?AUTO_1463 - ROVER
      ?AUTO_1464 - WAYPOINT
      ?AUTO_1468 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1465 ?AUTO_1467 ) ( VISIBLE ?AUTO_1466 ?AUTO_1467 ) ( AVAILABLE ?AUTO_1463 ) ( CHANNEL_FREE ?AUTO_1465 ) ( not ( = ?AUTO_1462 ?AUTO_1466 ) ) ( not ( = ?AUTO_1462 ?AUTO_1467 ) ) ( not ( = ?AUTO_1466 ?AUTO_1467 ) ) ( CAN_TRAVERSE ?AUTO_1463 ?AUTO_1464 ?AUTO_1466 ) ( VISIBLE ?AUTO_1464 ?AUTO_1466 ) ( not ( = ?AUTO_1462 ?AUTO_1464 ) ) ( not ( = ?AUTO_1467 ?AUTO_1464 ) ) ( not ( = ?AUTO_1466 ?AUTO_1464 ) ) ( CAN_TRAVERSE ?AUTO_1463 ?AUTO_1462 ?AUTO_1464 ) ( AT ?AUTO_1463 ?AUTO_1462 ) ( VISIBLE ?AUTO_1462 ?AUTO_1464 ) ( AT_SOIL_SAMPLE ?AUTO_1462 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1463 ) ( STORE_OF ?AUTO_1468 ?AUTO_1463 ) ( EMPTY ?AUTO_1468 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1463 ?AUTO_1468 ?AUTO_1462 )
      ( GET_SOIL_DATA ?AUTO_1462 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1462 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1475 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1478 - LANDER
      ?AUTO_1477 - WAYPOINT
      ?AUTO_1481 - WAYPOINT
      ?AUTO_1476 - ROVER
      ?AUTO_1480 - WAYPOINT
      ?AUTO_1479 - STORE
      ?AUTO_1482 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1478 ?AUTO_1477 ) ( VISIBLE ?AUTO_1481 ?AUTO_1477 ) ( AVAILABLE ?AUTO_1476 ) ( CHANNEL_FREE ?AUTO_1478 ) ( not ( = ?AUTO_1475 ?AUTO_1481 ) ) ( not ( = ?AUTO_1475 ?AUTO_1477 ) ) ( not ( = ?AUTO_1481 ?AUTO_1477 ) ) ( CAN_TRAVERSE ?AUTO_1476 ?AUTO_1480 ?AUTO_1481 ) ( VISIBLE ?AUTO_1480 ?AUTO_1481 ) ( not ( = ?AUTO_1475 ?AUTO_1480 ) ) ( not ( = ?AUTO_1477 ?AUTO_1480 ) ) ( not ( = ?AUTO_1481 ?AUTO_1480 ) ) ( CAN_TRAVERSE ?AUTO_1476 ?AUTO_1475 ?AUTO_1480 ) ( VISIBLE ?AUTO_1475 ?AUTO_1480 ) ( AT_SOIL_SAMPLE ?AUTO_1475 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1476 ) ( STORE_OF ?AUTO_1479 ?AUTO_1476 ) ( EMPTY ?AUTO_1479 ) ( CAN_TRAVERSE ?AUTO_1476 ?AUTO_1482 ?AUTO_1475 ) ( AT ?AUTO_1476 ?AUTO_1482 ) ( VISIBLE ?AUTO_1482 ?AUTO_1475 ) ( not ( = ?AUTO_1475 ?AUTO_1482 ) ) ( not ( = ?AUTO_1477 ?AUTO_1482 ) ) ( not ( = ?AUTO_1481 ?AUTO_1482 ) ) ( not ( = ?AUTO_1480 ?AUTO_1482 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1476 ?AUTO_1482 ?AUTO_1475 )
      ( GET_SOIL_DATA ?AUTO_1475 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1475 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1483 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1490 - LANDER
      ?AUTO_1486 - WAYPOINT
      ?AUTO_1487 - WAYPOINT
      ?AUTO_1485 - ROVER
      ?AUTO_1488 - WAYPOINT
      ?AUTO_1489 - STORE
      ?AUTO_1484 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1490 ?AUTO_1486 ) ( VISIBLE ?AUTO_1487 ?AUTO_1486 ) ( AVAILABLE ?AUTO_1485 ) ( CHANNEL_FREE ?AUTO_1490 ) ( not ( = ?AUTO_1483 ?AUTO_1487 ) ) ( not ( = ?AUTO_1483 ?AUTO_1486 ) ) ( not ( = ?AUTO_1487 ?AUTO_1486 ) ) ( CAN_TRAVERSE ?AUTO_1485 ?AUTO_1488 ?AUTO_1487 ) ( VISIBLE ?AUTO_1488 ?AUTO_1487 ) ( not ( = ?AUTO_1483 ?AUTO_1488 ) ) ( not ( = ?AUTO_1486 ?AUTO_1488 ) ) ( not ( = ?AUTO_1487 ?AUTO_1488 ) ) ( CAN_TRAVERSE ?AUTO_1485 ?AUTO_1483 ?AUTO_1488 ) ( VISIBLE ?AUTO_1483 ?AUTO_1488 ) ( AT_SOIL_SAMPLE ?AUTO_1483 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1485 ) ( STORE_OF ?AUTO_1489 ?AUTO_1485 ) ( CAN_TRAVERSE ?AUTO_1485 ?AUTO_1484 ?AUTO_1483 ) ( AT ?AUTO_1485 ?AUTO_1484 ) ( VISIBLE ?AUTO_1484 ?AUTO_1483 ) ( not ( = ?AUTO_1483 ?AUTO_1484 ) ) ( not ( = ?AUTO_1486 ?AUTO_1484 ) ) ( not ( = ?AUTO_1487 ?AUTO_1484 ) ) ( not ( = ?AUTO_1488 ?AUTO_1484 ) ) ( FULL ?AUTO_1489 ) )
    :subtasks
    ( ( !DROP ?AUTO_1485 ?AUTO_1489 )
      ( GET_SOIL_DATA ?AUTO_1483 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1483 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1536 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1537 - ROVER
      ?AUTO_1538 - LANDER
      ?AUTO_1539 - WAYPOINT
      ?AUTO_1540 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_1537 ?AUTO_1536 ) ( AT_LANDER ?AUTO_1538 ?AUTO_1539 ) ( VISIBLE ?AUTO_1536 ?AUTO_1539 ) ( AVAILABLE ?AUTO_1537 ) ( CHANNEL_FREE ?AUTO_1538 ) ( not ( = ?AUTO_1536 ?AUTO_1539 ) ) ( AT_ROCK_SAMPLE ?AUTO_1536 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1537 ) ( STORE_OF ?AUTO_1540 ?AUTO_1537 ) ( FULL ?AUTO_1540 ) )
    :subtasks
    ( ( !DROP ?AUTO_1537 ?AUTO_1540 )
      ( GET_ROCK_DATA ?AUTO_1536 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1536 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1562 - OBJECTIVE
      ?AUTO_1563 - MODE
    )
    :vars
    (
      ?AUTO_1567 - LANDER
      ?AUTO_1565 - WAYPOINT
      ?AUTO_1568 - WAYPOINT
      ?AUTO_1564 - ROVER
      ?AUTO_1566 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1567 ?AUTO_1565 ) ( VISIBLE ?AUTO_1568 ?AUTO_1565 ) ( AVAILABLE ?AUTO_1564 ) ( CHANNEL_FREE ?AUTO_1567 ) ( not ( = ?AUTO_1568 ?AUTO_1565 ) ) ( CAN_TRAVERSE ?AUTO_1564 ?AUTO_1565 ?AUTO_1568 ) ( VISIBLE ?AUTO_1565 ?AUTO_1568 ) ( CALIBRATED ?AUTO_1566 ?AUTO_1564 ) ( ON_BOARD ?AUTO_1566 ?AUTO_1564 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1564 ) ( SUPPORTS ?AUTO_1566 ?AUTO_1563 ) ( VISIBLE_FROM ?AUTO_1562 ?AUTO_1565 ) ( CAN_TRAVERSE ?AUTO_1564 ?AUTO_1568 ?AUTO_1565 ) ( AT ?AUTO_1564 ?AUTO_1568 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1564 ?AUTO_1568 ?AUTO_1565 )
      ( GET_IMAGE_DATA ?AUTO_1562 ?AUTO_1563 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1562 ?AUTO_1563 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1569 - OBJECTIVE
      ?AUTO_1570 - MODE
    )
    :vars
    (
      ?AUTO_1575 - LANDER
      ?AUTO_1571 - WAYPOINT
      ?AUTO_1572 - WAYPOINT
      ?AUTO_1574 - ROVER
      ?AUTO_1573 - CAMERA
      ?AUTO_1576 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1575 ?AUTO_1571 ) ( VISIBLE ?AUTO_1572 ?AUTO_1571 ) ( AVAILABLE ?AUTO_1574 ) ( CHANNEL_FREE ?AUTO_1575 ) ( not ( = ?AUTO_1572 ?AUTO_1571 ) ) ( CAN_TRAVERSE ?AUTO_1574 ?AUTO_1571 ?AUTO_1572 ) ( VISIBLE ?AUTO_1571 ?AUTO_1572 ) ( ON_BOARD ?AUTO_1573 ?AUTO_1574 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1574 ) ( SUPPORTS ?AUTO_1573 ?AUTO_1570 ) ( VISIBLE_FROM ?AUTO_1569 ?AUTO_1571 ) ( CAN_TRAVERSE ?AUTO_1574 ?AUTO_1572 ?AUTO_1571 ) ( AT ?AUTO_1574 ?AUTO_1572 ) ( CALIBRATION_TARGET ?AUTO_1573 ?AUTO_1576 ) ( VISIBLE_FROM ?AUTO_1576 ?AUTO_1572 ) ( not ( = ?AUTO_1569 ?AUTO_1576 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1574 ?AUTO_1573 ?AUTO_1576 ?AUTO_1572 )
      ( GET_IMAGE_DATA ?AUTO_1569 ?AUTO_1570 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1569 ?AUTO_1570 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1577 - OBJECTIVE
      ?AUTO_1578 - MODE
    )
    :vars
    (
      ?AUTO_1583 - LANDER
      ?AUTO_1582 - WAYPOINT
      ?AUTO_1580 - WAYPOINT
      ?AUTO_1581 - ROVER
      ?AUTO_1579 - CAMERA
      ?AUTO_1584 - OBJECTIVE
      ?AUTO_1585 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1583 ?AUTO_1582 ) ( VISIBLE ?AUTO_1580 ?AUTO_1582 ) ( AVAILABLE ?AUTO_1581 ) ( CHANNEL_FREE ?AUTO_1583 ) ( not ( = ?AUTO_1580 ?AUTO_1582 ) ) ( CAN_TRAVERSE ?AUTO_1581 ?AUTO_1582 ?AUTO_1580 ) ( VISIBLE ?AUTO_1582 ?AUTO_1580 ) ( ON_BOARD ?AUTO_1579 ?AUTO_1581 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1581 ) ( SUPPORTS ?AUTO_1579 ?AUTO_1578 ) ( VISIBLE_FROM ?AUTO_1577 ?AUTO_1582 ) ( CAN_TRAVERSE ?AUTO_1581 ?AUTO_1580 ?AUTO_1582 ) ( CALIBRATION_TARGET ?AUTO_1579 ?AUTO_1584 ) ( VISIBLE_FROM ?AUTO_1584 ?AUTO_1580 ) ( not ( = ?AUTO_1577 ?AUTO_1584 ) ) ( CAN_TRAVERSE ?AUTO_1581 ?AUTO_1585 ?AUTO_1580 ) ( AT ?AUTO_1581 ?AUTO_1585 ) ( VISIBLE ?AUTO_1585 ?AUTO_1580 ) ( not ( = ?AUTO_1582 ?AUTO_1585 ) ) ( not ( = ?AUTO_1580 ?AUTO_1585 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1581 ?AUTO_1585 ?AUTO_1580 )
      ( GET_IMAGE_DATA ?AUTO_1577 ?AUTO_1578 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1577 ?AUTO_1578 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1643 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1646 - LANDER
      ?AUTO_1645 - WAYPOINT
      ?AUTO_1647 - ROVER
      ?AUTO_1644 - STORE
      ?AUTO_1648 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1646 ?AUTO_1643 ) ( VISIBLE ?AUTO_1645 ?AUTO_1643 ) ( AVAILABLE ?AUTO_1647 ) ( CHANNEL_FREE ?AUTO_1646 ) ( not ( = ?AUTO_1643 ?AUTO_1645 ) ) ( CAN_TRAVERSE ?AUTO_1647 ?AUTO_1643 ?AUTO_1645 ) ( VISIBLE ?AUTO_1643 ?AUTO_1645 ) ( AT_SOIL_SAMPLE ?AUTO_1643 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1647 ) ( STORE_OF ?AUTO_1644 ?AUTO_1647 ) ( EMPTY ?AUTO_1644 ) ( CAN_TRAVERSE ?AUTO_1647 ?AUTO_1645 ?AUTO_1643 ) ( CAN_TRAVERSE ?AUTO_1647 ?AUTO_1648 ?AUTO_1645 ) ( AT ?AUTO_1647 ?AUTO_1648 ) ( VISIBLE ?AUTO_1648 ?AUTO_1645 ) ( not ( = ?AUTO_1643 ?AUTO_1648 ) ) ( not ( = ?AUTO_1645 ?AUTO_1648 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1647 ?AUTO_1648 ?AUTO_1645 )
      ( GET_SOIL_DATA ?AUTO_1643 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1643 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1673 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1678 - LANDER
      ?AUTO_1676 - WAYPOINT
      ?AUTO_1675 - WAYPOINT
      ?AUTO_1677 - ROVER
      ?AUTO_1674 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1678 ?AUTO_1676 ) ( VISIBLE ?AUTO_1675 ?AUTO_1676 ) ( AVAILABLE ?AUTO_1677 ) ( CHANNEL_FREE ?AUTO_1678 ) ( not ( = ?AUTO_1673 ?AUTO_1675 ) ) ( not ( = ?AUTO_1673 ?AUTO_1676 ) ) ( not ( = ?AUTO_1675 ?AUTO_1676 ) ) ( CAN_TRAVERSE ?AUTO_1677 ?AUTO_1673 ?AUTO_1675 ) ( VISIBLE ?AUTO_1673 ?AUTO_1675 ) ( AT_ROCK_SAMPLE ?AUTO_1673 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1677 ) ( STORE_OF ?AUTO_1674 ?AUTO_1677 ) ( EMPTY ?AUTO_1674 ) ( CAN_TRAVERSE ?AUTO_1677 ?AUTO_1675 ?AUTO_1673 ) ( VISIBLE ?AUTO_1675 ?AUTO_1673 ) ( CAN_TRAVERSE ?AUTO_1677 ?AUTO_1676 ?AUTO_1675 ) ( AT ?AUTO_1677 ?AUTO_1676 ) ( VISIBLE ?AUTO_1676 ?AUTO_1675 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1677 ?AUTO_1676 ?AUTO_1675 )
      ( GET_ROCK_DATA ?AUTO_1673 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1673 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1679 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1683 - LANDER
      ?AUTO_1682 - WAYPOINT
      ?AUTO_1684 - WAYPOINT
      ?AUTO_1680 - ROVER
      ?AUTO_1681 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1683 ?AUTO_1682 ) ( VISIBLE ?AUTO_1684 ?AUTO_1682 ) ( AVAILABLE ?AUTO_1680 ) ( CHANNEL_FREE ?AUTO_1683 ) ( not ( = ?AUTO_1679 ?AUTO_1684 ) ) ( not ( = ?AUTO_1679 ?AUTO_1682 ) ) ( not ( = ?AUTO_1684 ?AUTO_1682 ) ) ( CAN_TRAVERSE ?AUTO_1680 ?AUTO_1679 ?AUTO_1684 ) ( VISIBLE ?AUTO_1679 ?AUTO_1684 ) ( AT_ROCK_SAMPLE ?AUTO_1679 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1680 ) ( STORE_OF ?AUTO_1681 ?AUTO_1680 ) ( CAN_TRAVERSE ?AUTO_1680 ?AUTO_1684 ?AUTO_1679 ) ( VISIBLE ?AUTO_1684 ?AUTO_1679 ) ( CAN_TRAVERSE ?AUTO_1680 ?AUTO_1682 ?AUTO_1684 ) ( AT ?AUTO_1680 ?AUTO_1682 ) ( VISIBLE ?AUTO_1682 ?AUTO_1684 ) ( FULL ?AUTO_1681 ) )
    :subtasks
    ( ( !DROP ?AUTO_1680 ?AUTO_1681 )
      ( GET_ROCK_DATA ?AUTO_1679 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1679 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1741 - OBJECTIVE
      ?AUTO_1742 - MODE
    )
    :vars
    (
      ?AUTO_1746 - LANDER
      ?AUTO_1744 - WAYPOINT
      ?AUTO_1747 - WAYPOINT
      ?AUTO_1743 - ROVER
      ?AUTO_1745 - WAYPOINT
      ?AUTO_1748 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1746 ?AUTO_1744 ) ( VISIBLE ?AUTO_1747 ?AUTO_1744 ) ( AVAILABLE ?AUTO_1743 ) ( CHANNEL_FREE ?AUTO_1746 ) ( not ( = ?AUTO_1747 ?AUTO_1744 ) ) ( CAN_TRAVERSE ?AUTO_1743 ?AUTO_1745 ?AUTO_1747 ) ( VISIBLE ?AUTO_1745 ?AUTO_1747 ) ( not ( = ?AUTO_1744 ?AUTO_1745 ) ) ( not ( = ?AUTO_1747 ?AUTO_1745 ) ) ( ON_BOARD ?AUTO_1748 ?AUTO_1743 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1743 ) ( SUPPORTS ?AUTO_1748 ?AUTO_1742 ) ( VISIBLE_FROM ?AUTO_1741 ?AUTO_1745 ) ( CALIBRATION_TARGET ?AUTO_1748 ?AUTO_1741 ) ( CAN_TRAVERSE ?AUTO_1743 ?AUTO_1747 ?AUTO_1745 ) ( VISIBLE ?AUTO_1747 ?AUTO_1745 ) ( CAN_TRAVERSE ?AUTO_1743 ?AUTO_1744 ?AUTO_1747 ) ( AT ?AUTO_1743 ?AUTO_1744 ) ( VISIBLE ?AUTO_1744 ?AUTO_1747 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1743 ?AUTO_1744 ?AUTO_1747 )
      ( GET_IMAGE_DATA ?AUTO_1741 ?AUTO_1742 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1741 ?AUTO_1742 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1779 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1781 - LANDER
      ?AUTO_1780 - WAYPOINT
      ?AUTO_1782 - ROVER
      ?AUTO_1783 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1781 ?AUTO_1780 ) ( VISIBLE ?AUTO_1779 ?AUTO_1780 ) ( AVAILABLE ?AUTO_1782 ) ( CHANNEL_FREE ?AUTO_1781 ) ( not ( = ?AUTO_1779 ?AUTO_1780 ) ) ( AT_SOIL_SAMPLE ?AUTO_1779 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1782 ) ( STORE_OF ?AUTO_1783 ?AUTO_1782 ) ( CAN_TRAVERSE ?AUTO_1782 ?AUTO_1780 ?AUTO_1779 ) ( AT ?AUTO_1782 ?AUTO_1780 ) ( VISIBLE ?AUTO_1780 ?AUTO_1779 ) ( FULL ?AUTO_1783 ) )
    :subtasks
    ( ( !DROP ?AUTO_1782 ?AUTO_1783 )
      ( GET_SOIL_DATA ?AUTO_1779 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1779 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1818 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1822 - LANDER
      ?AUTO_1821 - WAYPOINT
      ?AUTO_1819 - ROVER
      ?AUTO_1820 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1822 ?AUTO_1821 ) ( VISIBLE ?AUTO_1818 ?AUTO_1821 ) ( AVAILABLE ?AUTO_1819 ) ( CHANNEL_FREE ?AUTO_1822 ) ( not ( = ?AUTO_1818 ?AUTO_1821 ) ) ( AT_ROCK_SAMPLE ?AUTO_1818 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1819 ) ( STORE_OF ?AUTO_1820 ?AUTO_1819 ) ( CAN_TRAVERSE ?AUTO_1819 ?AUTO_1821 ?AUTO_1818 ) ( AT ?AUTO_1819 ?AUTO_1821 ) ( VISIBLE ?AUTO_1821 ?AUTO_1818 ) ( FULL ?AUTO_1820 ) )
    :subtasks
    ( ( !DROP ?AUTO_1819 ?AUTO_1820 )
      ( GET_ROCK_DATA ?AUTO_1818 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1818 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1865 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1870 - LANDER
      ?AUTO_1866 - WAYPOINT
      ?AUTO_1868 - WAYPOINT
      ?AUTO_1869 - ROVER
      ?AUTO_1867 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1870 ?AUTO_1866 ) ( VISIBLE ?AUTO_1868 ?AUTO_1866 ) ( AVAILABLE ?AUTO_1869 ) ( CHANNEL_FREE ?AUTO_1870 ) ( not ( = ?AUTO_1865 ?AUTO_1868 ) ) ( not ( = ?AUTO_1865 ?AUTO_1866 ) ) ( not ( = ?AUTO_1868 ?AUTO_1866 ) ) ( CAN_TRAVERSE ?AUTO_1869 ?AUTO_1865 ?AUTO_1868 ) ( VISIBLE ?AUTO_1865 ?AUTO_1868 ) ( AT_SOIL_SAMPLE ?AUTO_1865 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1869 ) ( STORE_OF ?AUTO_1867 ?AUTO_1869 ) ( EMPTY ?AUTO_1867 ) ( CAN_TRAVERSE ?AUTO_1869 ?AUTO_1868 ?AUTO_1865 ) ( VISIBLE ?AUTO_1868 ?AUTO_1865 ) ( CAN_TRAVERSE ?AUTO_1869 ?AUTO_1866 ?AUTO_1868 ) ( AT ?AUTO_1869 ?AUTO_1866 ) ( VISIBLE ?AUTO_1866 ?AUTO_1868 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1869 ?AUTO_1866 ?AUTO_1868 )
      ( GET_SOIL_DATA ?AUTO_1865 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1865 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1871 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1872 - LANDER
      ?AUTO_1875 - WAYPOINT
      ?AUTO_1873 - WAYPOINT
      ?AUTO_1876 - ROVER
      ?AUTO_1874 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1872 ?AUTO_1875 ) ( VISIBLE ?AUTO_1873 ?AUTO_1875 ) ( AVAILABLE ?AUTO_1876 ) ( CHANNEL_FREE ?AUTO_1872 ) ( not ( = ?AUTO_1871 ?AUTO_1873 ) ) ( not ( = ?AUTO_1871 ?AUTO_1875 ) ) ( not ( = ?AUTO_1873 ?AUTO_1875 ) ) ( CAN_TRAVERSE ?AUTO_1876 ?AUTO_1871 ?AUTO_1873 ) ( VISIBLE ?AUTO_1871 ?AUTO_1873 ) ( AT_SOIL_SAMPLE ?AUTO_1871 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1876 ) ( STORE_OF ?AUTO_1874 ?AUTO_1876 ) ( CAN_TRAVERSE ?AUTO_1876 ?AUTO_1873 ?AUTO_1871 ) ( VISIBLE ?AUTO_1873 ?AUTO_1871 ) ( CAN_TRAVERSE ?AUTO_1876 ?AUTO_1875 ?AUTO_1873 ) ( AT ?AUTO_1876 ?AUTO_1875 ) ( VISIBLE ?AUTO_1875 ?AUTO_1873 ) ( FULL ?AUTO_1874 ) )
    :subtasks
    ( ( !DROP ?AUTO_1876 ?AUTO_1874 )
      ( GET_SOIL_DATA ?AUTO_1871 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1871 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1910 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1911 - LANDER
      ?AUTO_1912 - WAYPOINT
      ?AUTO_1913 - WAYPOINT
      ?AUTO_1914 - ROVER
      ?AUTO_1915 - STORE
      ?AUTO_1916 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1911 ?AUTO_1912 ) ( VISIBLE ?AUTO_1913 ?AUTO_1912 ) ( AVAILABLE ?AUTO_1914 ) ( CHANNEL_FREE ?AUTO_1911 ) ( not ( = ?AUTO_1910 ?AUTO_1913 ) ) ( not ( = ?AUTO_1910 ?AUTO_1912 ) ) ( not ( = ?AUTO_1913 ?AUTO_1912 ) ) ( CAN_TRAVERSE ?AUTO_1914 ?AUTO_1910 ?AUTO_1913 ) ( VISIBLE ?AUTO_1910 ?AUTO_1913 ) ( AT_ROCK_SAMPLE ?AUTO_1910 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1914 ) ( STORE_OF ?AUTO_1915 ?AUTO_1914 ) ( CAN_TRAVERSE ?AUTO_1914 ?AUTO_1913 ?AUTO_1910 ) ( VISIBLE ?AUTO_1913 ?AUTO_1910 ) ( CAN_TRAVERSE ?AUTO_1914 ?AUTO_1916 ?AUTO_1913 ) ( AT ?AUTO_1914 ?AUTO_1916 ) ( VISIBLE ?AUTO_1916 ?AUTO_1913 ) ( not ( = ?AUTO_1910 ?AUTO_1916 ) ) ( not ( = ?AUTO_1912 ?AUTO_1916 ) ) ( not ( = ?AUTO_1913 ?AUTO_1916 ) ) ( FULL ?AUTO_1915 ) )
    :subtasks
    ( ( !DROP ?AUTO_1914 ?AUTO_1915 )
      ( GET_ROCK_DATA ?AUTO_1910 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1910 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1975 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1977 - LANDER
      ?AUTO_1976 - WAYPOINT
      ?AUTO_1979 - ROVER
      ?AUTO_1978 - STORE
      ?AUTO_1980 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1977 ?AUTO_1975 ) ( VISIBLE ?AUTO_1976 ?AUTO_1975 ) ( AVAILABLE ?AUTO_1979 ) ( CHANNEL_FREE ?AUTO_1977 ) ( not ( = ?AUTO_1975 ?AUTO_1976 ) ) ( CAN_TRAVERSE ?AUTO_1979 ?AUTO_1975 ?AUTO_1976 ) ( VISIBLE ?AUTO_1975 ?AUTO_1976 ) ( AT_ROCK_SAMPLE ?AUTO_1975 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1979 ) ( STORE_OF ?AUTO_1978 ?AUTO_1979 ) ( CAN_TRAVERSE ?AUTO_1979 ?AUTO_1976 ?AUTO_1975 ) ( CAN_TRAVERSE ?AUTO_1979 ?AUTO_1980 ?AUTO_1976 ) ( AT ?AUTO_1979 ?AUTO_1980 ) ( VISIBLE ?AUTO_1980 ?AUTO_1976 ) ( not ( = ?AUTO_1975 ?AUTO_1980 ) ) ( not ( = ?AUTO_1976 ?AUTO_1980 ) ) ( FULL ?AUTO_1978 ) )
    :subtasks
    ( ( !DROP ?AUTO_1979 ?AUTO_1978 )
      ( GET_ROCK_DATA ?AUTO_1975 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1975 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1988 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1989 - LANDER
      ?AUTO_1992 - WAYPOINT
      ?AUTO_1991 - ROVER
      ?AUTO_1990 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1989 ?AUTO_1988 ) ( VISIBLE ?AUTO_1992 ?AUTO_1988 ) ( AVAILABLE ?AUTO_1991 ) ( CHANNEL_FREE ?AUTO_1989 ) ( not ( = ?AUTO_1988 ?AUTO_1992 ) ) ( CAN_TRAVERSE ?AUTO_1991 ?AUTO_1988 ?AUTO_1992 ) ( VISIBLE ?AUTO_1988 ?AUTO_1992 ) ( AT_ROCK_SAMPLE ?AUTO_1988 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1991 ) ( STORE_OF ?AUTO_1990 ?AUTO_1991 ) ( CAN_TRAVERSE ?AUTO_1991 ?AUTO_1992 ?AUTO_1988 ) ( AT ?AUTO_1991 ?AUTO_1992 ) ( FULL ?AUTO_1990 ) )
    :subtasks
    ( ( !DROP ?AUTO_1991 ?AUTO_1990 )
      ( GET_ROCK_DATA ?AUTO_1988 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1988 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2024 - OBJECTIVE
      ?AUTO_2025 - MODE
    )
    :vars
    (
      ?AUTO_2030 - LANDER
      ?AUTO_2028 - WAYPOINT
      ?AUTO_2029 - WAYPOINT
      ?AUTO_2031 - ROVER
      ?AUTO_2027 - WAYPOINT
      ?AUTO_2026 - CAMERA
      ?AUTO_2032 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2030 ?AUTO_2028 ) ( VISIBLE ?AUTO_2029 ?AUTO_2028 ) ( AVAILABLE ?AUTO_2031 ) ( CHANNEL_FREE ?AUTO_2030 ) ( not ( = ?AUTO_2029 ?AUTO_2028 ) ) ( CAN_TRAVERSE ?AUTO_2031 ?AUTO_2027 ?AUTO_2029 ) ( VISIBLE ?AUTO_2027 ?AUTO_2029 ) ( not ( = ?AUTO_2028 ?AUTO_2027 ) ) ( not ( = ?AUTO_2029 ?AUTO_2027 ) ) ( ON_BOARD ?AUTO_2026 ?AUTO_2031 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2031 ) ( SUPPORTS ?AUTO_2026 ?AUTO_2025 ) ( VISIBLE_FROM ?AUTO_2024 ?AUTO_2027 ) ( CALIBRATION_TARGET ?AUTO_2026 ?AUTO_2024 ) ( CAN_TRAVERSE ?AUTO_2031 ?AUTO_2032 ?AUTO_2027 ) ( AT ?AUTO_2031 ?AUTO_2032 ) ( VISIBLE ?AUTO_2032 ?AUTO_2027 ) ( not ( = ?AUTO_2028 ?AUTO_2032 ) ) ( not ( = ?AUTO_2029 ?AUTO_2032 ) ) ( not ( = ?AUTO_2027 ?AUTO_2032 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2031 ?AUTO_2032 ?AUTO_2027 )
      ( GET_IMAGE_DATA ?AUTO_2024 ?AUTO_2025 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2024 ?AUTO_2025 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2112 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2116 - LANDER
      ?AUTO_2115 - WAYPOINT
      ?AUTO_2113 - WAYPOINT
      ?AUTO_2114 - ROVER
      ?AUTO_2117 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2116 ?AUTO_2115 ) ( VISIBLE ?AUTO_2113 ?AUTO_2115 ) ( AVAILABLE ?AUTO_2114 ) ( CHANNEL_FREE ?AUTO_2116 ) ( not ( = ?AUTO_2112 ?AUTO_2113 ) ) ( not ( = ?AUTO_2112 ?AUTO_2115 ) ) ( not ( = ?AUTO_2113 ?AUTO_2115 ) ) ( CAN_TRAVERSE ?AUTO_2114 ?AUTO_2112 ?AUTO_2113 ) ( AT ?AUTO_2114 ?AUTO_2112 ) ( VISIBLE ?AUTO_2112 ?AUTO_2113 ) ( AT_SOIL_SAMPLE ?AUTO_2112 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2114 ) ( STORE_OF ?AUTO_2117 ?AUTO_2114 ) ( FULL ?AUTO_2117 ) )
    :subtasks
    ( ( !DROP ?AUTO_2114 ?AUTO_2117 )
      ( GET_SOIL_DATA ?AUTO_2112 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2112 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2118 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2122 - LANDER
      ?AUTO_2123 - WAYPOINT
      ?AUTO_2119 - WAYPOINT
      ?AUTO_2120 - ROVER
      ?AUTO_2121 - STORE
      ?AUTO_2124 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2122 ?AUTO_2123 ) ( VISIBLE ?AUTO_2119 ?AUTO_2123 ) ( AVAILABLE ?AUTO_2120 ) ( CHANNEL_FREE ?AUTO_2122 ) ( not ( = ?AUTO_2118 ?AUTO_2119 ) ) ( not ( = ?AUTO_2118 ?AUTO_2123 ) ) ( not ( = ?AUTO_2119 ?AUTO_2123 ) ) ( CAN_TRAVERSE ?AUTO_2120 ?AUTO_2118 ?AUTO_2119 ) ( VISIBLE ?AUTO_2118 ?AUTO_2119 ) ( AT_SOIL_SAMPLE ?AUTO_2118 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2120 ) ( STORE_OF ?AUTO_2121 ?AUTO_2120 ) ( FULL ?AUTO_2121 ) ( CAN_TRAVERSE ?AUTO_2120 ?AUTO_2124 ?AUTO_2118 ) ( AT ?AUTO_2120 ?AUTO_2124 ) ( VISIBLE ?AUTO_2124 ?AUTO_2118 ) ( not ( = ?AUTO_2118 ?AUTO_2124 ) ) ( not ( = ?AUTO_2123 ?AUTO_2124 ) ) ( not ( = ?AUTO_2119 ?AUTO_2124 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2120 ?AUTO_2124 ?AUTO_2118 )
      ( GET_SOIL_DATA ?AUTO_2118 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2118 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2126 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2129 - LANDER
      ?AUTO_2127 - WAYPOINT
      ?AUTO_2128 - WAYPOINT
      ?AUTO_2132 - ROVER
      ?AUTO_2130 - STORE
      ?AUTO_2131 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2129 ?AUTO_2127 ) ( VISIBLE ?AUTO_2128 ?AUTO_2127 ) ( AVAILABLE ?AUTO_2132 ) ( CHANNEL_FREE ?AUTO_2129 ) ( not ( = ?AUTO_2126 ?AUTO_2128 ) ) ( not ( = ?AUTO_2126 ?AUTO_2127 ) ) ( not ( = ?AUTO_2128 ?AUTO_2127 ) ) ( CAN_TRAVERSE ?AUTO_2132 ?AUTO_2126 ?AUTO_2128 ) ( VISIBLE ?AUTO_2126 ?AUTO_2128 ) ( AT_SOIL_SAMPLE ?AUTO_2126 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2132 ) ( STORE_OF ?AUTO_2130 ?AUTO_2132 ) ( CAN_TRAVERSE ?AUTO_2132 ?AUTO_2131 ?AUTO_2126 ) ( AT ?AUTO_2132 ?AUTO_2131 ) ( VISIBLE ?AUTO_2131 ?AUTO_2126 ) ( not ( = ?AUTO_2126 ?AUTO_2131 ) ) ( not ( = ?AUTO_2127 ?AUTO_2131 ) ) ( not ( = ?AUTO_2128 ?AUTO_2131 ) ) ( AT_ROCK_SAMPLE ?AUTO_2131 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2132 ) ( EMPTY ?AUTO_2130 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2132 ?AUTO_2130 ?AUTO_2131 )
      ( GET_SOIL_DATA ?AUTO_2126 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2126 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2168 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2172 - LANDER
      ?AUTO_2170 - WAYPOINT
      ?AUTO_2169 - WAYPOINT
      ?AUTO_2173 - ROVER
      ?AUTO_2171 - STORE
      ?AUTO_2174 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2172 ?AUTO_2170 ) ( VISIBLE ?AUTO_2169 ?AUTO_2170 ) ( AVAILABLE ?AUTO_2173 ) ( CHANNEL_FREE ?AUTO_2172 ) ( not ( = ?AUTO_2168 ?AUTO_2169 ) ) ( not ( = ?AUTO_2168 ?AUTO_2170 ) ) ( not ( = ?AUTO_2169 ?AUTO_2170 ) ) ( CAN_TRAVERSE ?AUTO_2173 ?AUTO_2168 ?AUTO_2169 ) ( VISIBLE ?AUTO_2168 ?AUTO_2169 ) ( AT_ROCK_SAMPLE ?AUTO_2168 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2173 ) ( STORE_OF ?AUTO_2171 ?AUTO_2173 ) ( FULL ?AUTO_2171 ) ( CAN_TRAVERSE ?AUTO_2173 ?AUTO_2174 ?AUTO_2168 ) ( AT ?AUTO_2173 ?AUTO_2174 ) ( VISIBLE ?AUTO_2174 ?AUTO_2168 ) ( not ( = ?AUTO_2168 ?AUTO_2174 ) ) ( not ( = ?AUTO_2170 ?AUTO_2174 ) ) ( not ( = ?AUTO_2169 ?AUTO_2174 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2173 ?AUTO_2174 ?AUTO_2168 )
      ( GET_ROCK_DATA ?AUTO_2168 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2168 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2176 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2178 - LANDER
      ?AUTO_2182 - WAYPOINT
      ?AUTO_2177 - WAYPOINT
      ?AUTO_2179 - ROVER
      ?AUTO_2180 - STORE
      ?AUTO_2181 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2178 ?AUTO_2182 ) ( VISIBLE ?AUTO_2177 ?AUTO_2182 ) ( AVAILABLE ?AUTO_2179 ) ( CHANNEL_FREE ?AUTO_2178 ) ( not ( = ?AUTO_2176 ?AUTO_2177 ) ) ( not ( = ?AUTO_2176 ?AUTO_2182 ) ) ( not ( = ?AUTO_2177 ?AUTO_2182 ) ) ( CAN_TRAVERSE ?AUTO_2179 ?AUTO_2176 ?AUTO_2177 ) ( VISIBLE ?AUTO_2176 ?AUTO_2177 ) ( AT_ROCK_SAMPLE ?AUTO_2176 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2179 ) ( STORE_OF ?AUTO_2180 ?AUTO_2179 ) ( CAN_TRAVERSE ?AUTO_2179 ?AUTO_2181 ?AUTO_2176 ) ( AT ?AUTO_2179 ?AUTO_2181 ) ( VISIBLE ?AUTO_2181 ?AUTO_2176 ) ( not ( = ?AUTO_2176 ?AUTO_2181 ) ) ( not ( = ?AUTO_2182 ?AUTO_2181 ) ) ( not ( = ?AUTO_2177 ?AUTO_2181 ) ) ( AT_ROCK_SAMPLE ?AUTO_2181 ) ( EMPTY ?AUTO_2180 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2179 ?AUTO_2180 ?AUTO_2181 )
      ( GET_ROCK_DATA ?AUTO_2176 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2176 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2227 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2229 - LANDER
      ?AUTO_2231 - WAYPOINT
      ?AUTO_2228 - ROVER
      ?AUTO_2230 - STORE
      ?AUTO_2232 - WAYPOINT
      ?AUTO_2233 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2229 ?AUTO_2231 ) ( VISIBLE ?AUTO_2227 ?AUTO_2231 ) ( AVAILABLE ?AUTO_2228 ) ( CHANNEL_FREE ?AUTO_2229 ) ( not ( = ?AUTO_2227 ?AUTO_2231 ) ) ( AT_ROCK_SAMPLE ?AUTO_2227 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2228 ) ( STORE_OF ?AUTO_2230 ?AUTO_2228 ) ( CAN_TRAVERSE ?AUTO_2228 ?AUTO_2232 ?AUTO_2227 ) ( VISIBLE ?AUTO_2232 ?AUTO_2227 ) ( not ( = ?AUTO_2227 ?AUTO_2232 ) ) ( not ( = ?AUTO_2231 ?AUTO_2232 ) ) ( CAN_TRAVERSE ?AUTO_2228 ?AUTO_2233 ?AUTO_2232 ) ( AT ?AUTO_2228 ?AUTO_2233 ) ( VISIBLE ?AUTO_2233 ?AUTO_2232 ) ( not ( = ?AUTO_2227 ?AUTO_2233 ) ) ( not ( = ?AUTO_2231 ?AUTO_2233 ) ) ( not ( = ?AUTO_2232 ?AUTO_2233 ) ) ( AT_ROCK_SAMPLE ?AUTO_2233 ) ( EMPTY ?AUTO_2230 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2228 ?AUTO_2230 ?AUTO_2233 )
      ( GET_ROCK_DATA ?AUTO_2227 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2227 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2262 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2265 - LANDER
      ?AUTO_2263 - WAYPOINT
      ?AUTO_2264 - ROVER
      ?AUTO_2266 - STORE
      ?AUTO_2267 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2265 ?AUTO_2262 ) ( VISIBLE ?AUTO_2263 ?AUTO_2262 ) ( AVAILABLE ?AUTO_2264 ) ( CHANNEL_FREE ?AUTO_2265 ) ( not ( = ?AUTO_2262 ?AUTO_2263 ) ) ( CAN_TRAVERSE ?AUTO_2264 ?AUTO_2262 ?AUTO_2263 ) ( VISIBLE ?AUTO_2262 ?AUTO_2263 ) ( AT_ROCK_SAMPLE ?AUTO_2262 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2264 ) ( STORE_OF ?AUTO_2266 ?AUTO_2264 ) ( FULL ?AUTO_2266 ) ( CAN_TRAVERSE ?AUTO_2264 ?AUTO_2267 ?AUTO_2262 ) ( AT ?AUTO_2264 ?AUTO_2267 ) ( VISIBLE ?AUTO_2267 ?AUTO_2262 ) ( not ( = ?AUTO_2262 ?AUTO_2267 ) ) ( not ( = ?AUTO_2263 ?AUTO_2267 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2264 ?AUTO_2267 ?AUTO_2262 )
      ( GET_ROCK_DATA ?AUTO_2262 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2262 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2269 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2273 - LANDER
      ?AUTO_2271 - WAYPOINT
      ?AUTO_2274 - ROVER
      ?AUTO_2270 - STORE
      ?AUTO_2272 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2273 ?AUTO_2269 ) ( VISIBLE ?AUTO_2271 ?AUTO_2269 ) ( AVAILABLE ?AUTO_2274 ) ( CHANNEL_FREE ?AUTO_2273 ) ( not ( = ?AUTO_2269 ?AUTO_2271 ) ) ( CAN_TRAVERSE ?AUTO_2274 ?AUTO_2269 ?AUTO_2271 ) ( VISIBLE ?AUTO_2269 ?AUTO_2271 ) ( AT_ROCK_SAMPLE ?AUTO_2269 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2274 ) ( STORE_OF ?AUTO_2270 ?AUTO_2274 ) ( CAN_TRAVERSE ?AUTO_2274 ?AUTO_2272 ?AUTO_2269 ) ( AT ?AUTO_2274 ?AUTO_2272 ) ( VISIBLE ?AUTO_2272 ?AUTO_2269 ) ( not ( = ?AUTO_2269 ?AUTO_2272 ) ) ( not ( = ?AUTO_2271 ?AUTO_2272 ) ) ( AT_ROCK_SAMPLE ?AUTO_2272 ) ( EMPTY ?AUTO_2270 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2274 ?AUTO_2270 ?AUTO_2272 )
      ( GET_ROCK_DATA ?AUTO_2269 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2269 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3064 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3069 - LANDER
      ?AUTO_3068 - WAYPOINT
      ?AUTO_3065 - ROVER
      ?AUTO_3067 - STORE
      ?AUTO_3066 - WAYPOINT
      ?AUTO_3070 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3069 ?AUTO_3064 ) ( VISIBLE ?AUTO_3068 ?AUTO_3064 ) ( AVAILABLE ?AUTO_3065 ) ( CHANNEL_FREE ?AUTO_3069 ) ( not ( = ?AUTO_3064 ?AUTO_3068 ) ) ( CAN_TRAVERSE ?AUTO_3065 ?AUTO_3064 ?AUTO_3068 ) ( VISIBLE ?AUTO_3064 ?AUTO_3068 ) ( AT_ROCK_SAMPLE ?AUTO_3064 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3065 ) ( STORE_OF ?AUTO_3067 ?AUTO_3065 ) ( EMPTY ?AUTO_3067 ) ( CAN_TRAVERSE ?AUTO_3065 ?AUTO_3066 ?AUTO_3064 ) ( VISIBLE ?AUTO_3066 ?AUTO_3064 ) ( not ( = ?AUTO_3064 ?AUTO_3066 ) ) ( not ( = ?AUTO_3068 ?AUTO_3066 ) ) ( CAN_TRAVERSE ?AUTO_3065 ?AUTO_3070 ?AUTO_3066 ) ( AT ?AUTO_3065 ?AUTO_3070 ) ( VISIBLE ?AUTO_3070 ?AUTO_3066 ) ( not ( = ?AUTO_3064 ?AUTO_3070 ) ) ( not ( = ?AUTO_3068 ?AUTO_3070 ) ) ( not ( = ?AUTO_3066 ?AUTO_3070 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3065 ?AUTO_3070 ?AUTO_3066 )
      ( GET_ROCK_DATA ?AUTO_3064 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3064 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6219 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6224 - LANDER
      ?AUTO_6223 - WAYPOINT
      ?AUTO_6221 - ROVER
      ?AUTO_6222 - STORE
      ?AUTO_6220 - WAYPOINT
      ?AUTO_6225 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6224 ?AUTO_6219 ) ( VISIBLE ?AUTO_6223 ?AUTO_6219 ) ( AVAILABLE ?AUTO_6221 ) ( CHANNEL_FREE ?AUTO_6224 ) ( not ( = ?AUTO_6219 ?AUTO_6223 ) ) ( CAN_TRAVERSE ?AUTO_6221 ?AUTO_6219 ?AUTO_6223 ) ( VISIBLE ?AUTO_6219 ?AUTO_6223 ) ( AT_ROCK_SAMPLE ?AUTO_6219 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6221 ) ( STORE_OF ?AUTO_6222 ?AUTO_6221 ) ( CAN_TRAVERSE ?AUTO_6221 ?AUTO_6220 ?AUTO_6219 ) ( VISIBLE ?AUTO_6220 ?AUTO_6219 ) ( not ( = ?AUTO_6219 ?AUTO_6220 ) ) ( not ( = ?AUTO_6223 ?AUTO_6220 ) ) ( CAN_TRAVERSE ?AUTO_6221 ?AUTO_6225 ?AUTO_6220 ) ( AT ?AUTO_6221 ?AUTO_6225 ) ( VISIBLE ?AUTO_6225 ?AUTO_6220 ) ( not ( = ?AUTO_6219 ?AUTO_6225 ) ) ( not ( = ?AUTO_6223 ?AUTO_6225 ) ) ( not ( = ?AUTO_6220 ?AUTO_6225 ) ) ( FULL ?AUTO_6222 ) )
    :subtasks
    ( ( !DROP ?AUTO_6221 ?AUTO_6222 )
      ( GET_ROCK_DATA ?AUTO_6219 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6219 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2333 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2338 - LANDER
      ?AUTO_2337 - WAYPOINT
      ?AUTO_2336 - WAYPOINT
      ?AUTO_2335 - ROVER
      ?AUTO_2334 - STORE
      ?AUTO_2339 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2338 ?AUTO_2337 ) ( VISIBLE ?AUTO_2336 ?AUTO_2337 ) ( AVAILABLE ?AUTO_2335 ) ( CHANNEL_FREE ?AUTO_2338 ) ( not ( = ?AUTO_2333 ?AUTO_2336 ) ) ( not ( = ?AUTO_2333 ?AUTO_2337 ) ) ( not ( = ?AUTO_2336 ?AUTO_2337 ) ) ( CAN_TRAVERSE ?AUTO_2335 ?AUTO_2333 ?AUTO_2336 ) ( VISIBLE ?AUTO_2333 ?AUTO_2336 ) ( AT_SOIL_SAMPLE ?AUTO_2333 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2335 ) ( STORE_OF ?AUTO_2334 ?AUTO_2335 ) ( EMPTY ?AUTO_2334 ) ( CAN_TRAVERSE ?AUTO_2335 ?AUTO_2339 ?AUTO_2333 ) ( VISIBLE ?AUTO_2339 ?AUTO_2333 ) ( not ( = ?AUTO_2333 ?AUTO_2339 ) ) ( not ( = ?AUTO_2337 ?AUTO_2339 ) ) ( not ( = ?AUTO_2336 ?AUTO_2339 ) ) ( CAN_TRAVERSE ?AUTO_2335 ?AUTO_2337 ?AUTO_2339 ) ( AT ?AUTO_2335 ?AUTO_2337 ) ( VISIBLE ?AUTO_2337 ?AUTO_2339 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2335 ?AUTO_2337 ?AUTO_2339 )
      ( GET_SOIL_DATA ?AUTO_2333 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2333 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2340 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2343 - LANDER
      ?AUTO_2345 - WAYPOINT
      ?AUTO_2346 - WAYPOINT
      ?AUTO_2341 - ROVER
      ?AUTO_2344 - STORE
      ?AUTO_2342 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2343 ?AUTO_2345 ) ( VISIBLE ?AUTO_2346 ?AUTO_2345 ) ( AVAILABLE ?AUTO_2341 ) ( CHANNEL_FREE ?AUTO_2343 ) ( not ( = ?AUTO_2340 ?AUTO_2346 ) ) ( not ( = ?AUTO_2340 ?AUTO_2345 ) ) ( not ( = ?AUTO_2346 ?AUTO_2345 ) ) ( CAN_TRAVERSE ?AUTO_2341 ?AUTO_2340 ?AUTO_2346 ) ( VISIBLE ?AUTO_2340 ?AUTO_2346 ) ( AT_SOIL_SAMPLE ?AUTO_2340 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2341 ) ( STORE_OF ?AUTO_2344 ?AUTO_2341 ) ( CAN_TRAVERSE ?AUTO_2341 ?AUTO_2342 ?AUTO_2340 ) ( VISIBLE ?AUTO_2342 ?AUTO_2340 ) ( not ( = ?AUTO_2340 ?AUTO_2342 ) ) ( not ( = ?AUTO_2345 ?AUTO_2342 ) ) ( not ( = ?AUTO_2346 ?AUTO_2342 ) ) ( CAN_TRAVERSE ?AUTO_2341 ?AUTO_2345 ?AUTO_2342 ) ( AT ?AUTO_2341 ?AUTO_2345 ) ( VISIBLE ?AUTO_2345 ?AUTO_2342 ) ( FULL ?AUTO_2344 ) )
    :subtasks
    ( ( !DROP ?AUTO_2341 ?AUTO_2344 )
      ( GET_SOIL_DATA ?AUTO_2340 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2340 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2349 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2354 - LANDER
      ?AUTO_2351 - WAYPOINT
      ?AUTO_2355 - WAYPOINT
      ?AUTO_2352 - ROVER
      ?AUTO_2350 - STORE
      ?AUTO_2353 - WAYPOINT
      ?AUTO_2356 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2354 ?AUTO_2351 ) ( VISIBLE ?AUTO_2355 ?AUTO_2351 ) ( AVAILABLE ?AUTO_2352 ) ( CHANNEL_FREE ?AUTO_2354 ) ( not ( = ?AUTO_2349 ?AUTO_2355 ) ) ( not ( = ?AUTO_2349 ?AUTO_2351 ) ) ( not ( = ?AUTO_2355 ?AUTO_2351 ) ) ( CAN_TRAVERSE ?AUTO_2352 ?AUTO_2349 ?AUTO_2355 ) ( VISIBLE ?AUTO_2349 ?AUTO_2355 ) ( AT_SOIL_SAMPLE ?AUTO_2349 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2352 ) ( STORE_OF ?AUTO_2350 ?AUTO_2352 ) ( CAN_TRAVERSE ?AUTO_2352 ?AUTO_2353 ?AUTO_2349 ) ( VISIBLE ?AUTO_2353 ?AUTO_2349 ) ( not ( = ?AUTO_2349 ?AUTO_2353 ) ) ( not ( = ?AUTO_2351 ?AUTO_2353 ) ) ( not ( = ?AUTO_2355 ?AUTO_2353 ) ) ( CAN_TRAVERSE ?AUTO_2352 ?AUTO_2351 ?AUTO_2353 ) ( VISIBLE ?AUTO_2351 ?AUTO_2353 ) ( FULL ?AUTO_2350 ) ( CAN_TRAVERSE ?AUTO_2352 ?AUTO_2356 ?AUTO_2351 ) ( AT ?AUTO_2352 ?AUTO_2356 ) ( VISIBLE ?AUTO_2356 ?AUTO_2351 ) ( not ( = ?AUTO_2349 ?AUTO_2356 ) ) ( not ( = ?AUTO_2351 ?AUTO_2356 ) ) ( not ( = ?AUTO_2355 ?AUTO_2356 ) ) ( not ( = ?AUTO_2353 ?AUTO_2356 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2352 ?AUTO_2356 ?AUTO_2351 )
      ( GET_SOIL_DATA ?AUTO_2349 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2349 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2358 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2362 - LANDER
      ?AUTO_2360 - WAYPOINT
      ?AUTO_2361 - WAYPOINT
      ?AUTO_2364 - ROVER
      ?AUTO_2365 - STORE
      ?AUTO_2363 - WAYPOINT
      ?AUTO_2359 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2362 ?AUTO_2360 ) ( VISIBLE ?AUTO_2361 ?AUTO_2360 ) ( AVAILABLE ?AUTO_2364 ) ( CHANNEL_FREE ?AUTO_2362 ) ( not ( = ?AUTO_2358 ?AUTO_2361 ) ) ( not ( = ?AUTO_2358 ?AUTO_2360 ) ) ( not ( = ?AUTO_2361 ?AUTO_2360 ) ) ( CAN_TRAVERSE ?AUTO_2364 ?AUTO_2358 ?AUTO_2361 ) ( VISIBLE ?AUTO_2358 ?AUTO_2361 ) ( AT_SOIL_SAMPLE ?AUTO_2358 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2364 ) ( STORE_OF ?AUTO_2365 ?AUTO_2364 ) ( CAN_TRAVERSE ?AUTO_2364 ?AUTO_2363 ?AUTO_2358 ) ( VISIBLE ?AUTO_2363 ?AUTO_2358 ) ( not ( = ?AUTO_2358 ?AUTO_2363 ) ) ( not ( = ?AUTO_2360 ?AUTO_2363 ) ) ( not ( = ?AUTO_2361 ?AUTO_2363 ) ) ( CAN_TRAVERSE ?AUTO_2364 ?AUTO_2360 ?AUTO_2363 ) ( VISIBLE ?AUTO_2360 ?AUTO_2363 ) ( CAN_TRAVERSE ?AUTO_2364 ?AUTO_2359 ?AUTO_2360 ) ( AT ?AUTO_2364 ?AUTO_2359 ) ( VISIBLE ?AUTO_2359 ?AUTO_2360 ) ( not ( = ?AUTO_2358 ?AUTO_2359 ) ) ( not ( = ?AUTO_2360 ?AUTO_2359 ) ) ( not ( = ?AUTO_2361 ?AUTO_2359 ) ) ( not ( = ?AUTO_2363 ?AUTO_2359 ) ) ( AT_ROCK_SAMPLE ?AUTO_2359 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2364 ) ( EMPTY ?AUTO_2365 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2364 ?AUTO_2365 ?AUTO_2359 )
      ( GET_SOIL_DATA ?AUTO_2358 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2358 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2388 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2391 - LANDER
      ?AUTO_2390 - WAYPOINT
      ?AUTO_2393 - WAYPOINT
      ?AUTO_2389 - ROVER
      ?AUTO_2394 - STORE
      ?AUTO_2392 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2391 ?AUTO_2390 ) ( VISIBLE ?AUTO_2393 ?AUTO_2390 ) ( AVAILABLE ?AUTO_2389 ) ( CHANNEL_FREE ?AUTO_2391 ) ( not ( = ?AUTO_2388 ?AUTO_2393 ) ) ( not ( = ?AUTO_2388 ?AUTO_2390 ) ) ( not ( = ?AUTO_2393 ?AUTO_2390 ) ) ( CAN_TRAVERSE ?AUTO_2389 ?AUTO_2388 ?AUTO_2393 ) ( VISIBLE ?AUTO_2388 ?AUTO_2393 ) ( AT_SOIL_SAMPLE ?AUTO_2388 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2389 ) ( STORE_OF ?AUTO_2394 ?AUTO_2389 ) ( CAN_TRAVERSE ?AUTO_2389 ?AUTO_2392 ?AUTO_2388 ) ( VISIBLE ?AUTO_2392 ?AUTO_2388 ) ( not ( = ?AUTO_2388 ?AUTO_2392 ) ) ( not ( = ?AUTO_2390 ?AUTO_2392 ) ) ( not ( = ?AUTO_2393 ?AUTO_2392 ) ) ( CAN_TRAVERSE ?AUTO_2389 ?AUTO_2393 ?AUTO_2392 ) ( AT ?AUTO_2389 ?AUTO_2393 ) ( VISIBLE ?AUTO_2393 ?AUTO_2392 ) ( AT_ROCK_SAMPLE ?AUTO_2393 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2389 ) ( EMPTY ?AUTO_2394 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2389 ?AUTO_2394 ?AUTO_2393 )
      ( GET_SOIL_DATA ?AUTO_2388 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2388 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2428 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2430 - LANDER
      ?AUTO_2431 - WAYPOINT
      ?AUTO_2429 - WAYPOINT
      ?AUTO_2433 - ROVER
      ?AUTO_2432 - STORE
      ?AUTO_2434 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2430 ?AUTO_2431 ) ( VISIBLE ?AUTO_2429 ?AUTO_2431 ) ( AVAILABLE ?AUTO_2433 ) ( CHANNEL_FREE ?AUTO_2430 ) ( not ( = ?AUTO_2428 ?AUTO_2429 ) ) ( not ( = ?AUTO_2428 ?AUTO_2431 ) ) ( not ( = ?AUTO_2429 ?AUTO_2431 ) ) ( CAN_TRAVERSE ?AUTO_2433 ?AUTO_2428 ?AUTO_2429 ) ( VISIBLE ?AUTO_2428 ?AUTO_2429 ) ( AT_ROCK_SAMPLE ?AUTO_2428 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2433 ) ( STORE_OF ?AUTO_2432 ?AUTO_2433 ) ( EMPTY ?AUTO_2432 ) ( CAN_TRAVERSE ?AUTO_2433 ?AUTO_2434 ?AUTO_2428 ) ( AT ?AUTO_2433 ?AUTO_2434 ) ( VISIBLE ?AUTO_2434 ?AUTO_2428 ) ( not ( = ?AUTO_2428 ?AUTO_2434 ) ) ( not ( = ?AUTO_2431 ?AUTO_2434 ) ) ( not ( = ?AUTO_2429 ?AUTO_2434 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2433 ?AUTO_2434 ?AUTO_2428 )
      ( GET_ROCK_DATA ?AUTO_2428 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2428 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2436 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2439 - LANDER
      ?AUTO_2440 - WAYPOINT
      ?AUTO_2442 - WAYPOINT
      ?AUTO_2437 - ROVER
      ?AUTO_2441 - STORE
      ?AUTO_2438 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2439 ?AUTO_2440 ) ( VISIBLE ?AUTO_2442 ?AUTO_2440 ) ( AVAILABLE ?AUTO_2437 ) ( CHANNEL_FREE ?AUTO_2439 ) ( not ( = ?AUTO_2436 ?AUTO_2442 ) ) ( not ( = ?AUTO_2436 ?AUTO_2440 ) ) ( not ( = ?AUTO_2442 ?AUTO_2440 ) ) ( CAN_TRAVERSE ?AUTO_2437 ?AUTO_2436 ?AUTO_2442 ) ( VISIBLE ?AUTO_2436 ?AUTO_2442 ) ( AT_ROCK_SAMPLE ?AUTO_2436 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2437 ) ( STORE_OF ?AUTO_2441 ?AUTO_2437 ) ( EMPTY ?AUTO_2441 ) ( CAN_TRAVERSE ?AUTO_2437 ?AUTO_2438 ?AUTO_2436 ) ( VISIBLE ?AUTO_2438 ?AUTO_2436 ) ( not ( = ?AUTO_2436 ?AUTO_2438 ) ) ( not ( = ?AUTO_2440 ?AUTO_2438 ) ) ( not ( = ?AUTO_2442 ?AUTO_2438 ) ) ( CAN_TRAVERSE ?AUTO_2437 ?AUTO_2440 ?AUTO_2438 ) ( AT ?AUTO_2437 ?AUTO_2440 ) ( VISIBLE ?AUTO_2440 ?AUTO_2438 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2437 ?AUTO_2440 ?AUTO_2438 )
      ( GET_ROCK_DATA ?AUTO_2436 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2436 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2443 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2445 - LANDER
      ?AUTO_2449 - WAYPOINT
      ?AUTO_2447 - WAYPOINT
      ?AUTO_2448 - ROVER
      ?AUTO_2446 - STORE
      ?AUTO_2444 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2445 ?AUTO_2449 ) ( VISIBLE ?AUTO_2447 ?AUTO_2449 ) ( AVAILABLE ?AUTO_2448 ) ( CHANNEL_FREE ?AUTO_2445 ) ( not ( = ?AUTO_2443 ?AUTO_2447 ) ) ( not ( = ?AUTO_2443 ?AUTO_2449 ) ) ( not ( = ?AUTO_2447 ?AUTO_2449 ) ) ( CAN_TRAVERSE ?AUTO_2448 ?AUTO_2443 ?AUTO_2447 ) ( VISIBLE ?AUTO_2443 ?AUTO_2447 ) ( AT_ROCK_SAMPLE ?AUTO_2443 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2448 ) ( STORE_OF ?AUTO_2446 ?AUTO_2448 ) ( CAN_TRAVERSE ?AUTO_2448 ?AUTO_2444 ?AUTO_2443 ) ( VISIBLE ?AUTO_2444 ?AUTO_2443 ) ( not ( = ?AUTO_2443 ?AUTO_2444 ) ) ( not ( = ?AUTO_2449 ?AUTO_2444 ) ) ( not ( = ?AUTO_2447 ?AUTO_2444 ) ) ( CAN_TRAVERSE ?AUTO_2448 ?AUTO_2449 ?AUTO_2444 ) ( AT ?AUTO_2448 ?AUTO_2449 ) ( VISIBLE ?AUTO_2449 ?AUTO_2444 ) ( FULL ?AUTO_2446 ) )
    :subtasks
    ( ( !DROP ?AUTO_2448 ?AUTO_2446 )
      ( GET_ROCK_DATA ?AUTO_2443 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2443 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2452 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2455 - LANDER
      ?AUTO_2453 - WAYPOINT
      ?AUTO_2458 - WAYPOINT
      ?AUTO_2456 - ROVER
      ?AUTO_2457 - STORE
      ?AUTO_2454 - WAYPOINT
      ?AUTO_2459 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2455 ?AUTO_2453 ) ( VISIBLE ?AUTO_2458 ?AUTO_2453 ) ( AVAILABLE ?AUTO_2456 ) ( CHANNEL_FREE ?AUTO_2455 ) ( not ( = ?AUTO_2452 ?AUTO_2458 ) ) ( not ( = ?AUTO_2452 ?AUTO_2453 ) ) ( not ( = ?AUTO_2458 ?AUTO_2453 ) ) ( CAN_TRAVERSE ?AUTO_2456 ?AUTO_2452 ?AUTO_2458 ) ( VISIBLE ?AUTO_2452 ?AUTO_2458 ) ( AT_ROCK_SAMPLE ?AUTO_2452 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2456 ) ( STORE_OF ?AUTO_2457 ?AUTO_2456 ) ( CAN_TRAVERSE ?AUTO_2456 ?AUTO_2454 ?AUTO_2452 ) ( VISIBLE ?AUTO_2454 ?AUTO_2452 ) ( not ( = ?AUTO_2452 ?AUTO_2454 ) ) ( not ( = ?AUTO_2453 ?AUTO_2454 ) ) ( not ( = ?AUTO_2458 ?AUTO_2454 ) ) ( CAN_TRAVERSE ?AUTO_2456 ?AUTO_2453 ?AUTO_2454 ) ( VISIBLE ?AUTO_2453 ?AUTO_2454 ) ( FULL ?AUTO_2457 ) ( CAN_TRAVERSE ?AUTO_2456 ?AUTO_2459 ?AUTO_2453 ) ( AT ?AUTO_2456 ?AUTO_2459 ) ( VISIBLE ?AUTO_2459 ?AUTO_2453 ) ( not ( = ?AUTO_2452 ?AUTO_2459 ) ) ( not ( = ?AUTO_2453 ?AUTO_2459 ) ) ( not ( = ?AUTO_2458 ?AUTO_2459 ) ) ( not ( = ?AUTO_2454 ?AUTO_2459 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2456 ?AUTO_2459 ?AUTO_2453 )
      ( GET_ROCK_DATA ?AUTO_2452 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2452 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2461 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2465 - LANDER
      ?AUTO_2468 - WAYPOINT
      ?AUTO_2466 - WAYPOINT
      ?AUTO_2467 - ROVER
      ?AUTO_2463 - STORE
      ?AUTO_2464 - WAYPOINT
      ?AUTO_2462 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2465 ?AUTO_2468 ) ( VISIBLE ?AUTO_2466 ?AUTO_2468 ) ( AVAILABLE ?AUTO_2467 ) ( CHANNEL_FREE ?AUTO_2465 ) ( not ( = ?AUTO_2461 ?AUTO_2466 ) ) ( not ( = ?AUTO_2461 ?AUTO_2468 ) ) ( not ( = ?AUTO_2466 ?AUTO_2468 ) ) ( CAN_TRAVERSE ?AUTO_2467 ?AUTO_2461 ?AUTO_2466 ) ( VISIBLE ?AUTO_2461 ?AUTO_2466 ) ( AT_ROCK_SAMPLE ?AUTO_2461 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2467 ) ( STORE_OF ?AUTO_2463 ?AUTO_2467 ) ( CAN_TRAVERSE ?AUTO_2467 ?AUTO_2464 ?AUTO_2461 ) ( VISIBLE ?AUTO_2464 ?AUTO_2461 ) ( not ( = ?AUTO_2461 ?AUTO_2464 ) ) ( not ( = ?AUTO_2468 ?AUTO_2464 ) ) ( not ( = ?AUTO_2466 ?AUTO_2464 ) ) ( CAN_TRAVERSE ?AUTO_2467 ?AUTO_2468 ?AUTO_2464 ) ( VISIBLE ?AUTO_2468 ?AUTO_2464 ) ( CAN_TRAVERSE ?AUTO_2467 ?AUTO_2462 ?AUTO_2468 ) ( AT ?AUTO_2467 ?AUTO_2462 ) ( VISIBLE ?AUTO_2462 ?AUTO_2468 ) ( not ( = ?AUTO_2461 ?AUTO_2462 ) ) ( not ( = ?AUTO_2468 ?AUTO_2462 ) ) ( not ( = ?AUTO_2466 ?AUTO_2462 ) ) ( not ( = ?AUTO_2464 ?AUTO_2462 ) ) ( AT_ROCK_SAMPLE ?AUTO_2462 ) ( EMPTY ?AUTO_2463 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2467 ?AUTO_2463 ?AUTO_2462 )
      ( GET_ROCK_DATA ?AUTO_2461 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2461 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2472 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2477 - LANDER
      ?AUTO_2475 - WAYPOINT
      ?AUTO_2476 - WAYPOINT
      ?AUTO_2473 - ROVER
      ?AUTO_2478 - STORE
      ?AUTO_2474 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2477 ?AUTO_2475 ) ( VISIBLE ?AUTO_2476 ?AUTO_2475 ) ( AVAILABLE ?AUTO_2473 ) ( CHANNEL_FREE ?AUTO_2477 ) ( not ( = ?AUTO_2472 ?AUTO_2476 ) ) ( not ( = ?AUTO_2472 ?AUTO_2475 ) ) ( not ( = ?AUTO_2476 ?AUTO_2475 ) ) ( CAN_TRAVERSE ?AUTO_2473 ?AUTO_2472 ?AUTO_2476 ) ( VISIBLE ?AUTO_2472 ?AUTO_2476 ) ( AT_ROCK_SAMPLE ?AUTO_2472 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2473 ) ( STORE_OF ?AUTO_2478 ?AUTO_2473 ) ( CAN_TRAVERSE ?AUTO_2473 ?AUTO_2474 ?AUTO_2472 ) ( AT ?AUTO_2473 ?AUTO_2474 ) ( VISIBLE ?AUTO_2474 ?AUTO_2472 ) ( not ( = ?AUTO_2472 ?AUTO_2474 ) ) ( not ( = ?AUTO_2475 ?AUTO_2474 ) ) ( not ( = ?AUTO_2476 ?AUTO_2474 ) ) ( FULL ?AUTO_2478 ) )
    :subtasks
    ( ( !DROP ?AUTO_2473 ?AUTO_2478 )
      ( GET_ROCK_DATA ?AUTO_2472 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2472 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2483 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2486 - LANDER
      ?AUTO_2487 - WAYPOINT
      ?AUTO_2488 - WAYPOINT
      ?AUTO_2489 - ROVER
      ?AUTO_2484 - STORE
      ?AUTO_2485 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2486 ?AUTO_2487 ) ( VISIBLE ?AUTO_2488 ?AUTO_2487 ) ( AVAILABLE ?AUTO_2489 ) ( CHANNEL_FREE ?AUTO_2486 ) ( not ( = ?AUTO_2483 ?AUTO_2488 ) ) ( not ( = ?AUTO_2483 ?AUTO_2487 ) ) ( not ( = ?AUTO_2488 ?AUTO_2487 ) ) ( CAN_TRAVERSE ?AUTO_2489 ?AUTO_2483 ?AUTO_2488 ) ( VISIBLE ?AUTO_2483 ?AUTO_2488 ) ( AT_ROCK_SAMPLE ?AUTO_2483 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2489 ) ( STORE_OF ?AUTO_2484 ?AUTO_2489 ) ( CAN_TRAVERSE ?AUTO_2489 ?AUTO_2485 ?AUTO_2483 ) ( VISIBLE ?AUTO_2485 ?AUTO_2483 ) ( not ( = ?AUTO_2483 ?AUTO_2485 ) ) ( not ( = ?AUTO_2487 ?AUTO_2485 ) ) ( not ( = ?AUTO_2488 ?AUTO_2485 ) ) ( FULL ?AUTO_2484 ) ( CAN_TRAVERSE ?AUTO_2489 ?AUTO_2488 ?AUTO_2485 ) ( AT ?AUTO_2489 ?AUTO_2488 ) ( VISIBLE ?AUTO_2488 ?AUTO_2485 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2489 ?AUTO_2488 ?AUTO_2485 )
      ( GET_ROCK_DATA ?AUTO_2483 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2483 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2491 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2494 - LANDER
      ?AUTO_2492 - WAYPOINT
      ?AUTO_2496 - WAYPOINT
      ?AUTO_2493 - ROVER
      ?AUTO_2497 - STORE
      ?AUTO_2495 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2494 ?AUTO_2492 ) ( VISIBLE ?AUTO_2496 ?AUTO_2492 ) ( AVAILABLE ?AUTO_2493 ) ( CHANNEL_FREE ?AUTO_2494 ) ( not ( = ?AUTO_2491 ?AUTO_2496 ) ) ( not ( = ?AUTO_2491 ?AUTO_2492 ) ) ( not ( = ?AUTO_2496 ?AUTO_2492 ) ) ( CAN_TRAVERSE ?AUTO_2493 ?AUTO_2491 ?AUTO_2496 ) ( VISIBLE ?AUTO_2491 ?AUTO_2496 ) ( AT_ROCK_SAMPLE ?AUTO_2491 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2493 ) ( STORE_OF ?AUTO_2497 ?AUTO_2493 ) ( CAN_TRAVERSE ?AUTO_2493 ?AUTO_2495 ?AUTO_2491 ) ( VISIBLE ?AUTO_2495 ?AUTO_2491 ) ( not ( = ?AUTO_2491 ?AUTO_2495 ) ) ( not ( = ?AUTO_2492 ?AUTO_2495 ) ) ( not ( = ?AUTO_2496 ?AUTO_2495 ) ) ( CAN_TRAVERSE ?AUTO_2493 ?AUTO_2496 ?AUTO_2495 ) ( AT ?AUTO_2493 ?AUTO_2496 ) ( VISIBLE ?AUTO_2496 ?AUTO_2495 ) ( AT_ROCK_SAMPLE ?AUTO_2496 ) ( EMPTY ?AUTO_2497 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2493 ?AUTO_2497 ?AUTO_2496 )
      ( GET_ROCK_DATA ?AUTO_2491 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2491 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2636 - OBJECTIVE
      ?AUTO_2637 - MODE
    )
    :vars
    (
      ?AUTO_2642 - LANDER
      ?AUTO_2644 - WAYPOINT
      ?AUTO_2638 - WAYPOINT
      ?AUTO_2640 - ROVER
      ?AUTO_2639 - CAMERA
      ?AUTO_2643 - WAYPOINT
      ?AUTO_2641 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2642 ?AUTO_2644 ) ( VISIBLE ?AUTO_2638 ?AUTO_2644 ) ( AVAILABLE ?AUTO_2640 ) ( CHANNEL_FREE ?AUTO_2642 ) ( not ( = ?AUTO_2638 ?AUTO_2644 ) ) ( ON_BOARD ?AUTO_2639 ?AUTO_2640 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2640 ) ( SUPPORTS ?AUTO_2639 ?AUTO_2637 ) ( VISIBLE_FROM ?AUTO_2636 ?AUTO_2638 ) ( CAN_TRAVERSE ?AUTO_2640 ?AUTO_2643 ?AUTO_2638 ) ( VISIBLE ?AUTO_2643 ?AUTO_2638 ) ( not ( = ?AUTO_2644 ?AUTO_2643 ) ) ( not ( = ?AUTO_2638 ?AUTO_2643 ) ) ( CALIBRATION_TARGET ?AUTO_2639 ?AUTO_2641 ) ( VISIBLE_FROM ?AUTO_2641 ?AUTO_2643 ) ( not ( = ?AUTO_2636 ?AUTO_2641 ) ) ( CAN_TRAVERSE ?AUTO_2640 ?AUTO_2638 ?AUTO_2643 ) ( AT ?AUTO_2640 ?AUTO_2638 ) ( VISIBLE ?AUTO_2638 ?AUTO_2643 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2640 ?AUTO_2638 ?AUTO_2643 )
      ( GET_IMAGE_DATA ?AUTO_2636 ?AUTO_2637 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2636 ?AUTO_2637 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2790 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2792 - LANDER
      ?AUTO_2793 - WAYPOINT
      ?AUTO_2794 - ROVER
      ?AUTO_2791 - STORE
      ?AUTO_2795 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2792 ?AUTO_2793 ) ( VISIBLE ?AUTO_2790 ?AUTO_2793 ) ( AVAILABLE ?AUTO_2794 ) ( CHANNEL_FREE ?AUTO_2792 ) ( not ( = ?AUTO_2790 ?AUTO_2793 ) ) ( AT_ROCK_SAMPLE ?AUTO_2790 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2794 ) ( STORE_OF ?AUTO_2791 ?AUTO_2794 ) ( FULL ?AUTO_2791 ) ( CAN_TRAVERSE ?AUTO_2794 ?AUTO_2795 ?AUTO_2790 ) ( AT ?AUTO_2794 ?AUTO_2795 ) ( VISIBLE ?AUTO_2795 ?AUTO_2790 ) ( not ( = ?AUTO_2790 ?AUTO_2795 ) ) ( not ( = ?AUTO_2793 ?AUTO_2795 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2794 ?AUTO_2795 ?AUTO_2790 )
      ( GET_ROCK_DATA ?AUTO_2790 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2790 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2797 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2798 - LANDER
      ?AUTO_2799 - WAYPOINT
      ?AUTO_2800 - ROVER
      ?AUTO_2801 - STORE
      ?AUTO_2802 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2798 ?AUTO_2799 ) ( VISIBLE ?AUTO_2797 ?AUTO_2799 ) ( AVAILABLE ?AUTO_2800 ) ( CHANNEL_FREE ?AUTO_2798 ) ( not ( = ?AUTO_2797 ?AUTO_2799 ) ) ( AT_ROCK_SAMPLE ?AUTO_2797 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2800 ) ( STORE_OF ?AUTO_2801 ?AUTO_2800 ) ( CAN_TRAVERSE ?AUTO_2800 ?AUTO_2802 ?AUTO_2797 ) ( AT ?AUTO_2800 ?AUTO_2802 ) ( VISIBLE ?AUTO_2802 ?AUTO_2797 ) ( not ( = ?AUTO_2797 ?AUTO_2802 ) ) ( not ( = ?AUTO_2799 ?AUTO_2802 ) ) ( AT_ROCK_SAMPLE ?AUTO_2802 ) ( EMPTY ?AUTO_2801 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2800 ?AUTO_2801 ?AUTO_2802 )
      ( GET_ROCK_DATA ?AUTO_2797 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2797 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2811 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2817 - LANDER
      ?AUTO_2813 - WAYPOINT
      ?AUTO_2814 - ROVER
      ?AUTO_2816 - STORE
      ?AUTO_2812 - WAYPOINT
      ?AUTO_2815 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2817 ?AUTO_2813 ) ( VISIBLE ?AUTO_2811 ?AUTO_2813 ) ( AVAILABLE ?AUTO_2814 ) ( CHANNEL_FREE ?AUTO_2817 ) ( not ( = ?AUTO_2811 ?AUTO_2813 ) ) ( AT_ROCK_SAMPLE ?AUTO_2811 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2814 ) ( STORE_OF ?AUTO_2816 ?AUTO_2814 ) ( CAN_TRAVERSE ?AUTO_2814 ?AUTO_2812 ?AUTO_2811 ) ( VISIBLE ?AUTO_2812 ?AUTO_2811 ) ( not ( = ?AUTO_2811 ?AUTO_2812 ) ) ( not ( = ?AUTO_2813 ?AUTO_2812 ) ) ( AT_ROCK_SAMPLE ?AUTO_2812 ) ( CAN_TRAVERSE ?AUTO_2814 ?AUTO_2815 ?AUTO_2812 ) ( AT ?AUTO_2814 ?AUTO_2815 ) ( VISIBLE ?AUTO_2815 ?AUTO_2812 ) ( not ( = ?AUTO_2811 ?AUTO_2815 ) ) ( not ( = ?AUTO_2813 ?AUTO_2815 ) ) ( not ( = ?AUTO_2812 ?AUTO_2815 ) ) ( FULL ?AUTO_2816 ) )
    :subtasks
    ( ( !DROP ?AUTO_2814 ?AUTO_2816 )
      ( GET_ROCK_DATA ?AUTO_2811 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2811 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7134 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7136 - LANDER
      ?AUTO_7135 - WAYPOINT
      ?AUTO_7138 - ROVER
      ?AUTO_7139 - STORE
      ?AUTO_7137 - WAYPOINT
      ?AUTO_7140 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7136 ?AUTO_7135 ) ( VISIBLE ?AUTO_7134 ?AUTO_7135 ) ( AVAILABLE ?AUTO_7138 ) ( CHANNEL_FREE ?AUTO_7136 ) ( not ( = ?AUTO_7134 ?AUTO_7135 ) ) ( AT_ROCK_SAMPLE ?AUTO_7134 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7138 ) ( STORE_OF ?AUTO_7139 ?AUTO_7138 ) ( EMPTY ?AUTO_7139 ) ( CAN_TRAVERSE ?AUTO_7138 ?AUTO_7137 ?AUTO_7134 ) ( VISIBLE ?AUTO_7137 ?AUTO_7134 ) ( not ( = ?AUTO_7134 ?AUTO_7137 ) ) ( not ( = ?AUTO_7135 ?AUTO_7137 ) ) ( CAN_TRAVERSE ?AUTO_7138 ?AUTO_7140 ?AUTO_7137 ) ( VISIBLE ?AUTO_7140 ?AUTO_7137 ) ( not ( = ?AUTO_7134 ?AUTO_7140 ) ) ( not ( = ?AUTO_7135 ?AUTO_7140 ) ) ( not ( = ?AUTO_7137 ?AUTO_7140 ) ) ( CAN_TRAVERSE ?AUTO_7138 ?AUTO_7135 ?AUTO_7140 ) ( AT ?AUTO_7138 ?AUTO_7135 ) ( VISIBLE ?AUTO_7135 ?AUTO_7140 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7138 ?AUTO_7135 ?AUTO_7140 )
      ( GET_ROCK_DATA ?AUTO_7134 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7134 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2828 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2833 - LANDER
      ?AUTO_2831 - WAYPOINT
      ?AUTO_2834 - ROVER
      ?AUTO_2830 - STORE
      ?AUTO_2832 - WAYPOINT
      ?AUTO_2829 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2833 ?AUTO_2831 ) ( VISIBLE ?AUTO_2828 ?AUTO_2831 ) ( AVAILABLE ?AUTO_2834 ) ( CHANNEL_FREE ?AUTO_2833 ) ( not ( = ?AUTO_2828 ?AUTO_2831 ) ) ( AT_ROCK_SAMPLE ?AUTO_2828 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2834 ) ( STORE_OF ?AUTO_2830 ?AUTO_2834 ) ( CAN_TRAVERSE ?AUTO_2834 ?AUTO_2832 ?AUTO_2828 ) ( VISIBLE ?AUTO_2832 ?AUTO_2828 ) ( not ( = ?AUTO_2828 ?AUTO_2832 ) ) ( not ( = ?AUTO_2831 ?AUTO_2832 ) ) ( AT_ROCK_SAMPLE ?AUTO_2832 ) ( CAN_TRAVERSE ?AUTO_2834 ?AUTO_2829 ?AUTO_2832 ) ( VISIBLE ?AUTO_2829 ?AUTO_2832 ) ( not ( = ?AUTO_2828 ?AUTO_2829 ) ) ( not ( = ?AUTO_2831 ?AUTO_2829 ) ) ( not ( = ?AUTO_2832 ?AUTO_2829 ) ) ( CAN_TRAVERSE ?AUTO_2834 ?AUTO_2831 ?AUTO_2829 ) ( AT ?AUTO_2834 ?AUTO_2831 ) ( VISIBLE ?AUTO_2831 ?AUTO_2829 ) ( FULL ?AUTO_2830 ) )
    :subtasks
    ( ( !DROP ?AUTO_2834 ?AUTO_2830 )
      ( GET_ROCK_DATA ?AUTO_2828 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2828 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2883 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2887 - LANDER
      ?AUTO_2885 - WAYPOINT
      ?AUTO_2888 - ROVER
      ?AUTO_2886 - STORE
      ?AUTO_2884 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2887 ?AUTO_2885 ) ( VISIBLE ?AUTO_2883 ?AUTO_2885 ) ( AVAILABLE ?AUTO_2888 ) ( CHANNEL_FREE ?AUTO_2887 ) ( not ( = ?AUTO_2883 ?AUTO_2885 ) ) ( AT_SOIL_SAMPLE ?AUTO_2883 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2888 ) ( STORE_OF ?AUTO_2886 ?AUTO_2888 ) ( EMPTY ?AUTO_2886 ) ( CAN_TRAVERSE ?AUTO_2888 ?AUTO_2884 ?AUTO_2883 ) ( VISIBLE ?AUTO_2884 ?AUTO_2883 ) ( not ( = ?AUTO_2883 ?AUTO_2884 ) ) ( not ( = ?AUTO_2885 ?AUTO_2884 ) ) ( CAN_TRAVERSE ?AUTO_2888 ?AUTO_2885 ?AUTO_2884 ) ( AT ?AUTO_2888 ?AUTO_2885 ) ( VISIBLE ?AUTO_2885 ?AUTO_2884 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2888 ?AUTO_2885 ?AUTO_2884 )
      ( GET_SOIL_DATA ?AUTO_2883 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2883 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2921 - OBJECTIVE
      ?AUTO_2922 - MODE
    )
    :vars
    (
      ?AUTO_2923 - LANDER
      ?AUTO_2926 - WAYPOINT
      ?AUTO_2924 - WAYPOINT
      ?AUTO_2925 - ROVER
      ?AUTO_2928 - CAMERA
      ?AUTO_2927 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2923 ?AUTO_2926 ) ( VISIBLE ?AUTO_2924 ?AUTO_2926 ) ( AVAILABLE ?AUTO_2925 ) ( CHANNEL_FREE ?AUTO_2923 ) ( not ( = ?AUTO_2924 ?AUTO_2926 ) ) ( ON_BOARD ?AUTO_2928 ?AUTO_2925 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2925 ) ( SUPPORTS ?AUTO_2928 ?AUTO_2922 ) ( VISIBLE_FROM ?AUTO_2921 ?AUTO_2924 ) ( CALIBRATION_TARGET ?AUTO_2928 ?AUTO_2921 ) ( CAN_TRAVERSE ?AUTO_2925 ?AUTO_2927 ?AUTO_2924 ) ( VISIBLE ?AUTO_2927 ?AUTO_2924 ) ( not ( = ?AUTO_2926 ?AUTO_2927 ) ) ( not ( = ?AUTO_2924 ?AUTO_2927 ) ) ( CAN_TRAVERSE ?AUTO_2925 ?AUTO_2926 ?AUTO_2927 ) ( AT ?AUTO_2925 ?AUTO_2926 ) ( VISIBLE ?AUTO_2926 ?AUTO_2927 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2925 ?AUTO_2926 ?AUTO_2927 )
      ( GET_IMAGE_DATA ?AUTO_2921 ?AUTO_2922 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2921 ?AUTO_2922 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2929 - OBJECTIVE
      ?AUTO_2930 - MODE
    )
    :vars
    (
      ?AUTO_2931 - LANDER
      ?AUTO_2933 - WAYPOINT
      ?AUTO_2936 - WAYPOINT
      ?AUTO_2934 - ROVER
      ?AUTO_2935 - CAMERA
      ?AUTO_2932 - WAYPOINT
      ?AUTO_2937 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2931 ?AUTO_2933 ) ( VISIBLE ?AUTO_2936 ?AUTO_2933 ) ( AVAILABLE ?AUTO_2934 ) ( CHANNEL_FREE ?AUTO_2931 ) ( not ( = ?AUTO_2936 ?AUTO_2933 ) ) ( ON_BOARD ?AUTO_2935 ?AUTO_2934 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2934 ) ( SUPPORTS ?AUTO_2935 ?AUTO_2930 ) ( VISIBLE_FROM ?AUTO_2929 ?AUTO_2936 ) ( CALIBRATION_TARGET ?AUTO_2935 ?AUTO_2929 ) ( CAN_TRAVERSE ?AUTO_2934 ?AUTO_2932 ?AUTO_2936 ) ( VISIBLE ?AUTO_2932 ?AUTO_2936 ) ( not ( = ?AUTO_2933 ?AUTO_2932 ) ) ( not ( = ?AUTO_2936 ?AUTO_2932 ) ) ( CAN_TRAVERSE ?AUTO_2934 ?AUTO_2933 ?AUTO_2932 ) ( VISIBLE ?AUTO_2933 ?AUTO_2932 ) ( CAN_TRAVERSE ?AUTO_2934 ?AUTO_2937 ?AUTO_2933 ) ( AT ?AUTO_2934 ?AUTO_2937 ) ( VISIBLE ?AUTO_2937 ?AUTO_2933 ) ( not ( = ?AUTO_2933 ?AUTO_2937 ) ) ( not ( = ?AUTO_2936 ?AUTO_2937 ) ) ( not ( = ?AUTO_2932 ?AUTO_2937 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2934 ?AUTO_2937 ?AUTO_2933 )
      ( GET_IMAGE_DATA ?AUTO_2929 ?AUTO_2930 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2929 ?AUTO_2930 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2938 - OBJECTIVE
      ?AUTO_2939 - MODE
    )
    :vars
    (
      ?AUTO_2943 - LANDER
      ?AUTO_2945 - WAYPOINT
      ?AUTO_2942 - WAYPOINT
      ?AUTO_2940 - ROVER
      ?AUTO_2946 - CAMERA
      ?AUTO_2941 - WAYPOINT
      ?AUTO_2944 - WAYPOINT
      ?AUTO_2947 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2943 ?AUTO_2945 ) ( VISIBLE ?AUTO_2942 ?AUTO_2945 ) ( AVAILABLE ?AUTO_2940 ) ( CHANNEL_FREE ?AUTO_2943 ) ( not ( = ?AUTO_2942 ?AUTO_2945 ) ) ( ON_BOARD ?AUTO_2946 ?AUTO_2940 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2940 ) ( SUPPORTS ?AUTO_2946 ?AUTO_2939 ) ( VISIBLE_FROM ?AUTO_2938 ?AUTO_2942 ) ( CALIBRATION_TARGET ?AUTO_2946 ?AUTO_2938 ) ( CAN_TRAVERSE ?AUTO_2940 ?AUTO_2941 ?AUTO_2942 ) ( VISIBLE ?AUTO_2941 ?AUTO_2942 ) ( not ( = ?AUTO_2945 ?AUTO_2941 ) ) ( not ( = ?AUTO_2942 ?AUTO_2941 ) ) ( CAN_TRAVERSE ?AUTO_2940 ?AUTO_2945 ?AUTO_2941 ) ( VISIBLE ?AUTO_2945 ?AUTO_2941 ) ( CAN_TRAVERSE ?AUTO_2940 ?AUTO_2944 ?AUTO_2945 ) ( VISIBLE ?AUTO_2944 ?AUTO_2945 ) ( not ( = ?AUTO_2945 ?AUTO_2944 ) ) ( not ( = ?AUTO_2942 ?AUTO_2944 ) ) ( not ( = ?AUTO_2941 ?AUTO_2944 ) ) ( CAN_TRAVERSE ?AUTO_2940 ?AUTO_2947 ?AUTO_2944 ) ( AT ?AUTO_2940 ?AUTO_2947 ) ( VISIBLE ?AUTO_2947 ?AUTO_2944 ) ( not ( = ?AUTO_2945 ?AUTO_2947 ) ) ( not ( = ?AUTO_2942 ?AUTO_2947 ) ) ( not ( = ?AUTO_2941 ?AUTO_2947 ) ) ( not ( = ?AUTO_2944 ?AUTO_2947 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2940 ?AUTO_2947 ?AUTO_2944 )
      ( GET_IMAGE_DATA ?AUTO_2938 ?AUTO_2939 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2938 ?AUTO_2939 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2950 - OBJECTIVE
      ?AUTO_2951 - MODE
    )
    :vars
    (
      ?AUTO_2955 - LANDER
      ?AUTO_2959 - WAYPOINT
      ?AUTO_2957 - WAYPOINT
      ?AUTO_2953 - ROVER
      ?AUTO_2958 - CAMERA
      ?AUTO_2954 - WAYPOINT
      ?AUTO_2952 - WAYPOINT
      ?AUTO_2956 - WAYPOINT
      ?AUTO_2960 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2955 ?AUTO_2959 ) ( VISIBLE ?AUTO_2957 ?AUTO_2959 ) ( AVAILABLE ?AUTO_2953 ) ( CHANNEL_FREE ?AUTO_2955 ) ( not ( = ?AUTO_2957 ?AUTO_2959 ) ) ( ON_BOARD ?AUTO_2958 ?AUTO_2953 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2953 ) ( SUPPORTS ?AUTO_2958 ?AUTO_2951 ) ( VISIBLE_FROM ?AUTO_2950 ?AUTO_2957 ) ( CALIBRATION_TARGET ?AUTO_2958 ?AUTO_2950 ) ( CAN_TRAVERSE ?AUTO_2953 ?AUTO_2954 ?AUTO_2957 ) ( VISIBLE ?AUTO_2954 ?AUTO_2957 ) ( not ( = ?AUTO_2959 ?AUTO_2954 ) ) ( not ( = ?AUTO_2957 ?AUTO_2954 ) ) ( CAN_TRAVERSE ?AUTO_2953 ?AUTO_2959 ?AUTO_2954 ) ( VISIBLE ?AUTO_2959 ?AUTO_2954 ) ( CAN_TRAVERSE ?AUTO_2953 ?AUTO_2952 ?AUTO_2959 ) ( VISIBLE ?AUTO_2952 ?AUTO_2959 ) ( not ( = ?AUTO_2959 ?AUTO_2952 ) ) ( not ( = ?AUTO_2957 ?AUTO_2952 ) ) ( not ( = ?AUTO_2954 ?AUTO_2952 ) ) ( CAN_TRAVERSE ?AUTO_2953 ?AUTO_2956 ?AUTO_2952 ) ( VISIBLE ?AUTO_2956 ?AUTO_2952 ) ( not ( = ?AUTO_2959 ?AUTO_2956 ) ) ( not ( = ?AUTO_2957 ?AUTO_2956 ) ) ( not ( = ?AUTO_2954 ?AUTO_2956 ) ) ( not ( = ?AUTO_2952 ?AUTO_2956 ) ) ( CAN_TRAVERSE ?AUTO_2953 ?AUTO_2960 ?AUTO_2956 ) ( AT ?AUTO_2953 ?AUTO_2960 ) ( VISIBLE ?AUTO_2960 ?AUTO_2956 ) ( not ( = ?AUTO_2959 ?AUTO_2960 ) ) ( not ( = ?AUTO_2957 ?AUTO_2960 ) ) ( not ( = ?AUTO_2954 ?AUTO_2960 ) ) ( not ( = ?AUTO_2952 ?AUTO_2960 ) ) ( not ( = ?AUTO_2956 ?AUTO_2960 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2953 ?AUTO_2960 ?AUTO_2956 )
      ( GET_IMAGE_DATA ?AUTO_2950 ?AUTO_2951 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2950 ?AUTO_2951 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3113 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3118 - LANDER
      ?AUTO_3115 - WAYPOINT
      ?AUTO_3117 - ROVER
      ?AUTO_3114 - STORE
      ?AUTO_3116 - WAYPOINT
      ?AUTO_3119 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3118 ?AUTO_3115 ) ( VISIBLE ?AUTO_3113 ?AUTO_3115 ) ( AVAILABLE ?AUTO_3117 ) ( CHANNEL_FREE ?AUTO_3118 ) ( not ( = ?AUTO_3113 ?AUTO_3115 ) ) ( AT_SOIL_SAMPLE ?AUTO_3113 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3117 ) ( STORE_OF ?AUTO_3114 ?AUTO_3117 ) ( EMPTY ?AUTO_3114 ) ( CAN_TRAVERSE ?AUTO_3117 ?AUTO_3115 ?AUTO_3113 ) ( VISIBLE ?AUTO_3115 ?AUTO_3113 ) ( CAN_TRAVERSE ?AUTO_3117 ?AUTO_3116 ?AUTO_3115 ) ( VISIBLE ?AUTO_3116 ?AUTO_3115 ) ( not ( = ?AUTO_3113 ?AUTO_3116 ) ) ( not ( = ?AUTO_3115 ?AUTO_3116 ) ) ( CAN_TRAVERSE ?AUTO_3117 ?AUTO_3119 ?AUTO_3116 ) ( AT ?AUTO_3117 ?AUTO_3119 ) ( VISIBLE ?AUTO_3119 ?AUTO_3116 ) ( not ( = ?AUTO_3113 ?AUTO_3119 ) ) ( not ( = ?AUTO_3115 ?AUTO_3119 ) ) ( not ( = ?AUTO_3116 ?AUTO_3119 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3117 ?AUTO_3119 ?AUTO_3116 )
      ( GET_SOIL_DATA ?AUTO_3113 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3113 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3180 - OBJECTIVE
      ?AUTO_3181 - MODE
    )
    :vars
    (
      ?AUTO_3185 - LANDER
      ?AUTO_3183 - WAYPOINT
      ?AUTO_3186 - WAYPOINT
      ?AUTO_3182 - ROVER
      ?AUTO_3184 - CAMERA
      ?AUTO_3187 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3185 ?AUTO_3183 ) ( VISIBLE ?AUTO_3186 ?AUTO_3183 ) ( AVAILABLE ?AUTO_3182 ) ( CHANNEL_FREE ?AUTO_3185 ) ( not ( = ?AUTO_3186 ?AUTO_3183 ) ) ( CAN_TRAVERSE ?AUTO_3182 ?AUTO_3183 ?AUTO_3186 ) ( VISIBLE ?AUTO_3183 ?AUTO_3186 ) ( CALIBRATED ?AUTO_3184 ?AUTO_3182 ) ( ON_BOARD ?AUTO_3184 ?AUTO_3182 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3182 ) ( SUPPORTS ?AUTO_3184 ?AUTO_3181 ) ( VISIBLE_FROM ?AUTO_3180 ?AUTO_3183 ) ( CAN_TRAVERSE ?AUTO_3182 ?AUTO_3187 ?AUTO_3183 ) ( AT ?AUTO_3182 ?AUTO_3187 ) ( VISIBLE ?AUTO_3187 ?AUTO_3183 ) ( not ( = ?AUTO_3183 ?AUTO_3187 ) ) ( not ( = ?AUTO_3186 ?AUTO_3187 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3182 ?AUTO_3187 ?AUTO_3183 )
      ( GET_IMAGE_DATA ?AUTO_3180 ?AUTO_3181 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3180 ?AUTO_3181 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3190 - OBJECTIVE
      ?AUTO_3191 - MODE
    )
    :vars
    (
      ?AUTO_3195 - LANDER
      ?AUTO_3197 - WAYPOINT
      ?AUTO_3194 - WAYPOINT
      ?AUTO_3193 - ROVER
      ?AUTO_3196 - CAMERA
      ?AUTO_3192 - WAYPOINT
      ?AUTO_3198 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3195 ?AUTO_3197 ) ( VISIBLE ?AUTO_3194 ?AUTO_3197 ) ( AVAILABLE ?AUTO_3193 ) ( CHANNEL_FREE ?AUTO_3195 ) ( not ( = ?AUTO_3194 ?AUTO_3197 ) ) ( CAN_TRAVERSE ?AUTO_3193 ?AUTO_3197 ?AUTO_3194 ) ( VISIBLE ?AUTO_3197 ?AUTO_3194 ) ( ON_BOARD ?AUTO_3196 ?AUTO_3193 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3193 ) ( SUPPORTS ?AUTO_3196 ?AUTO_3191 ) ( VISIBLE_FROM ?AUTO_3190 ?AUTO_3197 ) ( CAN_TRAVERSE ?AUTO_3193 ?AUTO_3192 ?AUTO_3197 ) ( AT ?AUTO_3193 ?AUTO_3192 ) ( VISIBLE ?AUTO_3192 ?AUTO_3197 ) ( not ( = ?AUTO_3197 ?AUTO_3192 ) ) ( not ( = ?AUTO_3194 ?AUTO_3192 ) ) ( CALIBRATION_TARGET ?AUTO_3196 ?AUTO_3198 ) ( VISIBLE_FROM ?AUTO_3198 ?AUTO_3192 ) ( not ( = ?AUTO_3190 ?AUTO_3198 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_3193 ?AUTO_3196 ?AUTO_3198 ?AUTO_3192 )
      ( GET_IMAGE_DATA ?AUTO_3190 ?AUTO_3191 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3190 ?AUTO_3191 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3256 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3261 - LANDER
      ?AUTO_3257 - WAYPOINT
      ?AUTO_3262 - WAYPOINT
      ?AUTO_3258 - ROVER
      ?AUTO_3259 - STORE
      ?AUTO_3260 - WAYPOINT
      ?AUTO_3263 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3261 ?AUTO_3257 ) ( VISIBLE ?AUTO_3262 ?AUTO_3257 ) ( AVAILABLE ?AUTO_3258 ) ( CHANNEL_FREE ?AUTO_3261 ) ( not ( = ?AUTO_3256 ?AUTO_3262 ) ) ( not ( = ?AUTO_3256 ?AUTO_3257 ) ) ( not ( = ?AUTO_3262 ?AUTO_3257 ) ) ( CAN_TRAVERSE ?AUTO_3258 ?AUTO_3256 ?AUTO_3262 ) ( VISIBLE ?AUTO_3256 ?AUTO_3262 ) ( AT_SOIL_SAMPLE ?AUTO_3256 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3258 ) ( STORE_OF ?AUTO_3259 ?AUTO_3258 ) ( EMPTY ?AUTO_3259 ) ( CAN_TRAVERSE ?AUTO_3258 ?AUTO_3260 ?AUTO_3256 ) ( VISIBLE ?AUTO_3260 ?AUTO_3256 ) ( not ( = ?AUTO_3256 ?AUTO_3260 ) ) ( not ( = ?AUTO_3257 ?AUTO_3260 ) ) ( not ( = ?AUTO_3262 ?AUTO_3260 ) ) ( CAN_TRAVERSE ?AUTO_3258 ?AUTO_3263 ?AUTO_3260 ) ( AT ?AUTO_3258 ?AUTO_3263 ) ( VISIBLE ?AUTO_3263 ?AUTO_3260 ) ( not ( = ?AUTO_3256 ?AUTO_3263 ) ) ( not ( = ?AUTO_3257 ?AUTO_3263 ) ) ( not ( = ?AUTO_3262 ?AUTO_3263 ) ) ( not ( = ?AUTO_3260 ?AUTO_3263 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3258 ?AUTO_3263 ?AUTO_3260 )
      ( GET_SOIL_DATA ?AUTO_3256 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3256 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3265 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3270 - LANDER
      ?AUTO_3272 - WAYPOINT
      ?AUTO_3271 - WAYPOINT
      ?AUTO_3266 - ROVER
      ?AUTO_3268 - STORE
      ?AUTO_3269 - WAYPOINT
      ?AUTO_3267 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3270 ?AUTO_3272 ) ( VISIBLE ?AUTO_3271 ?AUTO_3272 ) ( AVAILABLE ?AUTO_3266 ) ( CHANNEL_FREE ?AUTO_3270 ) ( not ( = ?AUTO_3265 ?AUTO_3271 ) ) ( not ( = ?AUTO_3265 ?AUTO_3272 ) ) ( not ( = ?AUTO_3271 ?AUTO_3272 ) ) ( CAN_TRAVERSE ?AUTO_3266 ?AUTO_3265 ?AUTO_3271 ) ( VISIBLE ?AUTO_3265 ?AUTO_3271 ) ( AT_SOIL_SAMPLE ?AUTO_3265 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3266 ) ( STORE_OF ?AUTO_3268 ?AUTO_3266 ) ( EMPTY ?AUTO_3268 ) ( CAN_TRAVERSE ?AUTO_3266 ?AUTO_3269 ?AUTO_3265 ) ( VISIBLE ?AUTO_3269 ?AUTO_3265 ) ( not ( = ?AUTO_3265 ?AUTO_3269 ) ) ( not ( = ?AUTO_3272 ?AUTO_3269 ) ) ( not ( = ?AUTO_3271 ?AUTO_3269 ) ) ( CAN_TRAVERSE ?AUTO_3266 ?AUTO_3267 ?AUTO_3269 ) ( VISIBLE ?AUTO_3267 ?AUTO_3269 ) ( not ( = ?AUTO_3265 ?AUTO_3267 ) ) ( not ( = ?AUTO_3272 ?AUTO_3267 ) ) ( not ( = ?AUTO_3271 ?AUTO_3267 ) ) ( not ( = ?AUTO_3269 ?AUTO_3267 ) ) ( CAN_TRAVERSE ?AUTO_3266 ?AUTO_3272 ?AUTO_3267 ) ( AT ?AUTO_3266 ?AUTO_3272 ) ( VISIBLE ?AUTO_3272 ?AUTO_3267 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3266 ?AUTO_3272 ?AUTO_3267 )
      ( GET_SOIL_DATA ?AUTO_3265 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3265 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3273 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3278 - LANDER
      ?AUTO_3275 - WAYPOINT
      ?AUTO_3277 - WAYPOINT
      ?AUTO_3280 - ROVER
      ?AUTO_3276 - STORE
      ?AUTO_3279 - WAYPOINT
      ?AUTO_3274 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3278 ?AUTO_3275 ) ( VISIBLE ?AUTO_3277 ?AUTO_3275 ) ( AVAILABLE ?AUTO_3280 ) ( CHANNEL_FREE ?AUTO_3278 ) ( not ( = ?AUTO_3273 ?AUTO_3277 ) ) ( not ( = ?AUTO_3273 ?AUTO_3275 ) ) ( not ( = ?AUTO_3277 ?AUTO_3275 ) ) ( CAN_TRAVERSE ?AUTO_3280 ?AUTO_3273 ?AUTO_3277 ) ( VISIBLE ?AUTO_3273 ?AUTO_3277 ) ( AT_SOIL_SAMPLE ?AUTO_3273 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3280 ) ( STORE_OF ?AUTO_3276 ?AUTO_3280 ) ( CAN_TRAVERSE ?AUTO_3280 ?AUTO_3279 ?AUTO_3273 ) ( VISIBLE ?AUTO_3279 ?AUTO_3273 ) ( not ( = ?AUTO_3273 ?AUTO_3279 ) ) ( not ( = ?AUTO_3275 ?AUTO_3279 ) ) ( not ( = ?AUTO_3277 ?AUTO_3279 ) ) ( CAN_TRAVERSE ?AUTO_3280 ?AUTO_3274 ?AUTO_3279 ) ( VISIBLE ?AUTO_3274 ?AUTO_3279 ) ( not ( = ?AUTO_3273 ?AUTO_3274 ) ) ( not ( = ?AUTO_3275 ?AUTO_3274 ) ) ( not ( = ?AUTO_3277 ?AUTO_3274 ) ) ( not ( = ?AUTO_3279 ?AUTO_3274 ) ) ( CAN_TRAVERSE ?AUTO_3280 ?AUTO_3275 ?AUTO_3274 ) ( AT ?AUTO_3280 ?AUTO_3275 ) ( VISIBLE ?AUTO_3275 ?AUTO_3274 ) ( FULL ?AUTO_3276 ) )
    :subtasks
    ( ( !DROP ?AUTO_3280 ?AUTO_3276 )
      ( GET_SOIL_DATA ?AUTO_3273 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3273 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3315 - OBJECTIVE
      ?AUTO_3316 - MODE
    )
    :vars
    (
      ?AUTO_3321 - LANDER
      ?AUTO_3317 - WAYPOINT
      ?AUTO_3320 - WAYPOINT
      ?AUTO_3318 - ROVER
      ?AUTO_3323 - CAMERA
      ?AUTO_3322 - WAYPOINT
      ?AUTO_3319 - WAYPOINT
      ?AUTO_3324 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3321 ?AUTO_3317 ) ( VISIBLE ?AUTO_3320 ?AUTO_3317 ) ( AVAILABLE ?AUTO_3318 ) ( CHANNEL_FREE ?AUTO_3321 ) ( not ( = ?AUTO_3320 ?AUTO_3317 ) ) ( ON_BOARD ?AUTO_3323 ?AUTO_3318 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3318 ) ( SUPPORTS ?AUTO_3323 ?AUTO_3316 ) ( VISIBLE_FROM ?AUTO_3315 ?AUTO_3320 ) ( CAN_TRAVERSE ?AUTO_3318 ?AUTO_3322 ?AUTO_3320 ) ( VISIBLE ?AUTO_3322 ?AUTO_3320 ) ( not ( = ?AUTO_3317 ?AUTO_3322 ) ) ( not ( = ?AUTO_3320 ?AUTO_3322 ) ) ( CAN_TRAVERSE ?AUTO_3318 ?AUTO_3319 ?AUTO_3322 ) ( AT ?AUTO_3318 ?AUTO_3319 ) ( VISIBLE ?AUTO_3319 ?AUTO_3322 ) ( not ( = ?AUTO_3317 ?AUTO_3319 ) ) ( not ( = ?AUTO_3320 ?AUTO_3319 ) ) ( not ( = ?AUTO_3322 ?AUTO_3319 ) ) ( CALIBRATION_TARGET ?AUTO_3323 ?AUTO_3324 ) ( VISIBLE_FROM ?AUTO_3324 ?AUTO_3319 ) ( not ( = ?AUTO_3315 ?AUTO_3324 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_3318 ?AUTO_3323 ?AUTO_3324 ?AUTO_3319 )
      ( GET_IMAGE_DATA ?AUTO_3315 ?AUTO_3316 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3315 ?AUTO_3316 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3497 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3500 - LANDER
      ?AUTO_3498 - WAYPOINT
      ?AUTO_3499 - ROVER
      ?AUTO_3501 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3500 ?AUTO_3497 ) ( VISIBLE ?AUTO_3498 ?AUTO_3497 ) ( AVAILABLE ?AUTO_3499 ) ( CHANNEL_FREE ?AUTO_3500 ) ( not ( = ?AUTO_3497 ?AUTO_3498 ) ) ( CAN_TRAVERSE ?AUTO_3499 ?AUTO_3497 ?AUTO_3498 ) ( AT ?AUTO_3499 ?AUTO_3497 ) ( VISIBLE ?AUTO_3497 ?AUTO_3498 ) ( AT_SOIL_SAMPLE ?AUTO_3497 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3499 ) ( STORE_OF ?AUTO_3501 ?AUTO_3499 ) ( FULL ?AUTO_3501 ) )
    :subtasks
    ( ( !DROP ?AUTO_3499 ?AUTO_3501 )
      ( GET_SOIL_DATA ?AUTO_3497 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3497 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3502 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3503 - LANDER
      ?AUTO_3505 - WAYPOINT
      ?AUTO_3504 - ROVER
      ?AUTO_3506 - STORE
      ?AUTO_3507 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3503 ?AUTO_3502 ) ( VISIBLE ?AUTO_3505 ?AUTO_3502 ) ( AVAILABLE ?AUTO_3504 ) ( CHANNEL_FREE ?AUTO_3503 ) ( not ( = ?AUTO_3502 ?AUTO_3505 ) ) ( CAN_TRAVERSE ?AUTO_3504 ?AUTO_3502 ?AUTO_3505 ) ( VISIBLE ?AUTO_3502 ?AUTO_3505 ) ( AT_SOIL_SAMPLE ?AUTO_3502 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3504 ) ( STORE_OF ?AUTO_3506 ?AUTO_3504 ) ( FULL ?AUTO_3506 ) ( CAN_TRAVERSE ?AUTO_3504 ?AUTO_3507 ?AUTO_3502 ) ( AT ?AUTO_3504 ?AUTO_3507 ) ( VISIBLE ?AUTO_3507 ?AUTO_3502 ) ( not ( = ?AUTO_3502 ?AUTO_3507 ) ) ( not ( = ?AUTO_3505 ?AUTO_3507 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3504 ?AUTO_3507 ?AUTO_3502 )
      ( GET_SOIL_DATA ?AUTO_3502 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3502 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3509 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3512 - LANDER
      ?AUTO_3511 - WAYPOINT
      ?AUTO_3513 - ROVER
      ?AUTO_3514 - STORE
      ?AUTO_3510 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3512 ?AUTO_3509 ) ( VISIBLE ?AUTO_3511 ?AUTO_3509 ) ( AVAILABLE ?AUTO_3513 ) ( CHANNEL_FREE ?AUTO_3512 ) ( not ( = ?AUTO_3509 ?AUTO_3511 ) ) ( CAN_TRAVERSE ?AUTO_3513 ?AUTO_3509 ?AUTO_3511 ) ( VISIBLE ?AUTO_3509 ?AUTO_3511 ) ( AT_SOIL_SAMPLE ?AUTO_3509 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3513 ) ( STORE_OF ?AUTO_3514 ?AUTO_3513 ) ( CAN_TRAVERSE ?AUTO_3513 ?AUTO_3510 ?AUTO_3509 ) ( AT ?AUTO_3513 ?AUTO_3510 ) ( VISIBLE ?AUTO_3510 ?AUTO_3509 ) ( not ( = ?AUTO_3509 ?AUTO_3510 ) ) ( not ( = ?AUTO_3511 ?AUTO_3510 ) ) ( AT_ROCK_SAMPLE ?AUTO_3510 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3513 ) ( EMPTY ?AUTO_3514 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_3513 ?AUTO_3514 ?AUTO_3510 )
      ( GET_SOIL_DATA ?AUTO_3509 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3509 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5731 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5735 - LANDER
      ?AUTO_5733 - WAYPOINT
      ?AUTO_5734 - ROVER
      ?AUTO_5736 - STORE
      ?AUTO_5732 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5735 ?AUTO_5731 ) ( VISIBLE ?AUTO_5733 ?AUTO_5731 ) ( AVAILABLE ?AUTO_5734 ) ( CHANNEL_FREE ?AUTO_5735 ) ( not ( = ?AUTO_5731 ?AUTO_5733 ) ) ( CAN_TRAVERSE ?AUTO_5734 ?AUTO_5731 ?AUTO_5733 ) ( VISIBLE ?AUTO_5731 ?AUTO_5733 ) ( AT_SOIL_SAMPLE ?AUTO_5731 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5734 ) ( STORE_OF ?AUTO_5736 ?AUTO_5734 ) ( EMPTY ?AUTO_5736 ) ( CAN_TRAVERSE ?AUTO_5734 ?AUTO_5732 ?AUTO_5731 ) ( VISIBLE ?AUTO_5732 ?AUTO_5731 ) ( not ( = ?AUTO_5731 ?AUTO_5732 ) ) ( not ( = ?AUTO_5733 ?AUTO_5732 ) ) ( CAN_TRAVERSE ?AUTO_5734 ?AUTO_5733 ?AUTO_5732 ) ( AT ?AUTO_5734 ?AUTO_5733 ) ( VISIBLE ?AUTO_5733 ?AUTO_5732 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5734 ?AUTO_5733 ?AUTO_5732 )
      ( GET_SOIL_DATA ?AUTO_5731 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5731 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3531 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3535 - LANDER
      ?AUTO_3534 - WAYPOINT
      ?AUTO_3533 - ROVER
      ?AUTO_3532 - STORE
      ?AUTO_3536 - WAYPOINT
      ?AUTO_3537 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3535 ?AUTO_3531 ) ( VISIBLE ?AUTO_3534 ?AUTO_3531 ) ( AVAILABLE ?AUTO_3533 ) ( CHANNEL_FREE ?AUTO_3535 ) ( not ( = ?AUTO_3531 ?AUTO_3534 ) ) ( CAN_TRAVERSE ?AUTO_3533 ?AUTO_3531 ?AUTO_3534 ) ( VISIBLE ?AUTO_3531 ?AUTO_3534 ) ( AT_SOIL_SAMPLE ?AUTO_3531 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3533 ) ( STORE_OF ?AUTO_3532 ?AUTO_3533 ) ( CAN_TRAVERSE ?AUTO_3533 ?AUTO_3536 ?AUTO_3531 ) ( VISIBLE ?AUTO_3536 ?AUTO_3531 ) ( not ( = ?AUTO_3531 ?AUTO_3536 ) ) ( not ( = ?AUTO_3534 ?AUTO_3536 ) ) ( AT_ROCK_SAMPLE ?AUTO_3536 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3533 ) ( EMPTY ?AUTO_3532 ) ( CAN_TRAVERSE ?AUTO_3533 ?AUTO_3534 ?AUTO_3536 ) ( VISIBLE ?AUTO_3534 ?AUTO_3536 ) ( CAN_TRAVERSE ?AUTO_3533 ?AUTO_3537 ?AUTO_3534 ) ( AT ?AUTO_3533 ?AUTO_3537 ) ( VISIBLE ?AUTO_3537 ?AUTO_3534 ) ( not ( = ?AUTO_3531 ?AUTO_3537 ) ) ( not ( = ?AUTO_3534 ?AUTO_3537 ) ) ( not ( = ?AUTO_3536 ?AUTO_3537 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3533 ?AUTO_3537 ?AUTO_3534 )
      ( GET_SOIL_DATA ?AUTO_3531 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3531 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3563 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3566 - LANDER
      ?AUTO_3565 - WAYPOINT
      ?AUTO_3564 - ROVER
      ?AUTO_3567 - STORE
      ?AUTO_3568 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3566 ?AUTO_3565 ) ( VISIBLE ?AUTO_3563 ?AUTO_3565 ) ( AVAILABLE ?AUTO_3564 ) ( CHANNEL_FREE ?AUTO_3566 ) ( not ( = ?AUTO_3563 ?AUTO_3565 ) ) ( AT_ROCK_SAMPLE ?AUTO_3563 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3564 ) ( STORE_OF ?AUTO_3567 ?AUTO_3564 ) ( CAN_TRAVERSE ?AUTO_3564 ?AUTO_3565 ?AUTO_3563 ) ( VISIBLE ?AUTO_3565 ?AUTO_3563 ) ( FULL ?AUTO_3567 ) ( CAN_TRAVERSE ?AUTO_3564 ?AUTO_3568 ?AUTO_3565 ) ( AT ?AUTO_3564 ?AUTO_3568 ) ( VISIBLE ?AUTO_3568 ?AUTO_3565 ) ( not ( = ?AUTO_3563 ?AUTO_3568 ) ) ( not ( = ?AUTO_3565 ?AUTO_3568 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3564 ?AUTO_3568 ?AUTO_3565 )
      ( GET_ROCK_DATA ?AUTO_3563 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3563 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3570 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3571 - LANDER
      ?AUTO_3575 - WAYPOINT
      ?AUTO_3574 - ROVER
      ?AUTO_3573 - STORE
      ?AUTO_3572 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3571 ?AUTO_3575 ) ( VISIBLE ?AUTO_3570 ?AUTO_3575 ) ( AVAILABLE ?AUTO_3574 ) ( CHANNEL_FREE ?AUTO_3571 ) ( not ( = ?AUTO_3570 ?AUTO_3575 ) ) ( AT_ROCK_SAMPLE ?AUTO_3570 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3574 ) ( STORE_OF ?AUTO_3573 ?AUTO_3574 ) ( CAN_TRAVERSE ?AUTO_3574 ?AUTO_3575 ?AUTO_3570 ) ( VISIBLE ?AUTO_3575 ?AUTO_3570 ) ( CAN_TRAVERSE ?AUTO_3574 ?AUTO_3572 ?AUTO_3575 ) ( AT ?AUTO_3574 ?AUTO_3572 ) ( VISIBLE ?AUTO_3572 ?AUTO_3575 ) ( not ( = ?AUTO_3570 ?AUTO_3572 ) ) ( not ( = ?AUTO_3575 ?AUTO_3572 ) ) ( AT_ROCK_SAMPLE ?AUTO_3572 ) ( EMPTY ?AUTO_3573 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_3574 ?AUTO_3573 ?AUTO_3572 )
      ( GET_ROCK_DATA ?AUTO_3570 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3570 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3652 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3653 - ROVER
      ?AUTO_3654 - LANDER
      ?AUTO_3655 - WAYPOINT
      ?AUTO_3656 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_3653 ?AUTO_3652 ) ( AT_LANDER ?AUTO_3654 ?AUTO_3655 ) ( VISIBLE ?AUTO_3652 ?AUTO_3655 ) ( AVAILABLE ?AUTO_3653 ) ( CHANNEL_FREE ?AUTO_3654 ) ( not ( = ?AUTO_3652 ?AUTO_3655 ) ) ( AT_SOIL_SAMPLE ?AUTO_3652 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3653 ) ( STORE_OF ?AUTO_3656 ?AUTO_3653 ) ( FULL ?AUTO_3656 ) )
    :subtasks
    ( ( !DROP ?AUTO_3653 ?AUTO_3656 )
      ( GET_SOIL_DATA ?AUTO_3652 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3652 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3657 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3659 - LANDER
      ?AUTO_3660 - WAYPOINT
      ?AUTO_3658 - ROVER
      ?AUTO_3661 - STORE
      ?AUTO_3662 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3659 ?AUTO_3660 ) ( VISIBLE ?AUTO_3657 ?AUTO_3660 ) ( AVAILABLE ?AUTO_3658 ) ( CHANNEL_FREE ?AUTO_3659 ) ( not ( = ?AUTO_3657 ?AUTO_3660 ) ) ( AT_SOIL_SAMPLE ?AUTO_3657 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3658 ) ( STORE_OF ?AUTO_3661 ?AUTO_3658 ) ( FULL ?AUTO_3661 ) ( CAN_TRAVERSE ?AUTO_3658 ?AUTO_3662 ?AUTO_3657 ) ( AT ?AUTO_3658 ?AUTO_3662 ) ( VISIBLE ?AUTO_3662 ?AUTO_3657 ) ( not ( = ?AUTO_3657 ?AUTO_3662 ) ) ( not ( = ?AUTO_3660 ?AUTO_3662 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3658 ?AUTO_3662 ?AUTO_3657 )
      ( GET_SOIL_DATA ?AUTO_3657 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3657 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3664 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3668 - LANDER
      ?AUTO_3669 - WAYPOINT
      ?AUTO_3666 - ROVER
      ?AUTO_3665 - STORE
      ?AUTO_3667 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3668 ?AUTO_3669 ) ( VISIBLE ?AUTO_3664 ?AUTO_3669 ) ( AVAILABLE ?AUTO_3666 ) ( CHANNEL_FREE ?AUTO_3668 ) ( not ( = ?AUTO_3664 ?AUTO_3669 ) ) ( AT_SOIL_SAMPLE ?AUTO_3664 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3666 ) ( STORE_OF ?AUTO_3665 ?AUTO_3666 ) ( CAN_TRAVERSE ?AUTO_3666 ?AUTO_3667 ?AUTO_3664 ) ( AT ?AUTO_3666 ?AUTO_3667 ) ( VISIBLE ?AUTO_3667 ?AUTO_3664 ) ( not ( = ?AUTO_3664 ?AUTO_3667 ) ) ( not ( = ?AUTO_3669 ?AUTO_3667 ) ) ( AT_ROCK_SAMPLE ?AUTO_3667 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3666 ) ( EMPTY ?AUTO_3665 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_3666 ?AUTO_3665 ?AUTO_3667 )
      ( GET_SOIL_DATA ?AUTO_3664 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3664 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3787 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3788 - LANDER
      ?AUTO_3790 - WAYPOINT
      ?AUTO_3789 - ROVER
      ?AUTO_3792 - STORE
      ?AUTO_3791 - WAYPOINT
      ?AUTO_3793 - WAYPOINT
      ?AUTO_3794 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3788 ?AUTO_3790 ) ( VISIBLE ?AUTO_3787 ?AUTO_3790 ) ( AVAILABLE ?AUTO_3789 ) ( CHANNEL_FREE ?AUTO_3788 ) ( not ( = ?AUTO_3787 ?AUTO_3790 ) ) ( AT_SOIL_SAMPLE ?AUTO_3787 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3789 ) ( STORE_OF ?AUTO_3792 ?AUTO_3789 ) ( FULL ?AUTO_3792 ) ( CAN_TRAVERSE ?AUTO_3789 ?AUTO_3791 ?AUTO_3787 ) ( VISIBLE ?AUTO_3791 ?AUTO_3787 ) ( not ( = ?AUTO_3787 ?AUTO_3791 ) ) ( not ( = ?AUTO_3790 ?AUTO_3791 ) ) ( CAN_TRAVERSE ?AUTO_3789 ?AUTO_3793 ?AUTO_3791 ) ( VISIBLE ?AUTO_3793 ?AUTO_3791 ) ( not ( = ?AUTO_3787 ?AUTO_3793 ) ) ( not ( = ?AUTO_3790 ?AUTO_3793 ) ) ( not ( = ?AUTO_3791 ?AUTO_3793 ) ) ( CAN_TRAVERSE ?AUTO_3789 ?AUTO_3794 ?AUTO_3793 ) ( AT ?AUTO_3789 ?AUTO_3794 ) ( VISIBLE ?AUTO_3794 ?AUTO_3793 ) ( not ( = ?AUTO_3787 ?AUTO_3794 ) ) ( not ( = ?AUTO_3790 ?AUTO_3794 ) ) ( not ( = ?AUTO_3791 ?AUTO_3794 ) ) ( not ( = ?AUTO_3793 ?AUTO_3794 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3789 ?AUTO_3794 ?AUTO_3793 )
      ( GET_SOIL_DATA ?AUTO_3787 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3787 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3796 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3799 - LANDER
      ?AUTO_3797 - WAYPOINT
      ?AUTO_3800 - ROVER
      ?AUTO_3802 - STORE
      ?AUTO_3803 - WAYPOINT
      ?AUTO_3798 - WAYPOINT
      ?AUTO_3801 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3799 ?AUTO_3797 ) ( VISIBLE ?AUTO_3796 ?AUTO_3797 ) ( AVAILABLE ?AUTO_3800 ) ( CHANNEL_FREE ?AUTO_3799 ) ( not ( = ?AUTO_3796 ?AUTO_3797 ) ) ( AT_SOIL_SAMPLE ?AUTO_3796 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3800 ) ( STORE_OF ?AUTO_3802 ?AUTO_3800 ) ( CAN_TRAVERSE ?AUTO_3800 ?AUTO_3803 ?AUTO_3796 ) ( VISIBLE ?AUTO_3803 ?AUTO_3796 ) ( not ( = ?AUTO_3796 ?AUTO_3803 ) ) ( not ( = ?AUTO_3797 ?AUTO_3803 ) ) ( CAN_TRAVERSE ?AUTO_3800 ?AUTO_3798 ?AUTO_3803 ) ( VISIBLE ?AUTO_3798 ?AUTO_3803 ) ( not ( = ?AUTO_3796 ?AUTO_3798 ) ) ( not ( = ?AUTO_3797 ?AUTO_3798 ) ) ( not ( = ?AUTO_3803 ?AUTO_3798 ) ) ( CAN_TRAVERSE ?AUTO_3800 ?AUTO_3801 ?AUTO_3798 ) ( AT ?AUTO_3800 ?AUTO_3801 ) ( VISIBLE ?AUTO_3801 ?AUTO_3798 ) ( not ( = ?AUTO_3796 ?AUTO_3801 ) ) ( not ( = ?AUTO_3797 ?AUTO_3801 ) ) ( not ( = ?AUTO_3803 ?AUTO_3801 ) ) ( not ( = ?AUTO_3798 ?AUTO_3801 ) ) ( AT_ROCK_SAMPLE ?AUTO_3801 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3800 ) ( EMPTY ?AUTO_3802 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_3800 ?AUTO_3802 ?AUTO_3801 )
      ( GET_SOIL_DATA ?AUTO_3796 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3796 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3969 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3972 - LANDER
      ?AUTO_3971 - WAYPOINT
      ?AUTO_3970 - ROVER
      ?AUTO_3973 - WAYPOINT
      ?AUTO_3974 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3972 ?AUTO_3971 ) ( HAVE_ROCK_ANALYSIS ?AUTO_3970 ?AUTO_3969 ) ( VISIBLE ?AUTO_3973 ?AUTO_3971 ) ( AVAILABLE ?AUTO_3970 ) ( CHANNEL_FREE ?AUTO_3972 ) ( not ( = ?AUTO_3969 ?AUTO_3973 ) ) ( not ( = ?AUTO_3969 ?AUTO_3971 ) ) ( not ( = ?AUTO_3973 ?AUTO_3971 ) ) ( CAN_TRAVERSE ?AUTO_3970 ?AUTO_3974 ?AUTO_3973 ) ( AT ?AUTO_3970 ?AUTO_3974 ) ( VISIBLE ?AUTO_3974 ?AUTO_3973 ) ( not ( = ?AUTO_3969 ?AUTO_3974 ) ) ( not ( = ?AUTO_3971 ?AUTO_3974 ) ) ( not ( = ?AUTO_3973 ?AUTO_3974 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3970 ?AUTO_3974 ?AUTO_3973 )
      ( GET_ROCK_DATA ?AUTO_3969 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3969 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3975 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3980 - LANDER
      ?AUTO_3977 - WAYPOINT
      ?AUTO_3976 - ROVER
      ?AUTO_3979 - WAYPOINT
      ?AUTO_3978 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3980 ?AUTO_3977 ) ( HAVE_ROCK_ANALYSIS ?AUTO_3976 ?AUTO_3975 ) ( VISIBLE ?AUTO_3979 ?AUTO_3977 ) ( AVAILABLE ?AUTO_3976 ) ( CHANNEL_FREE ?AUTO_3980 ) ( not ( = ?AUTO_3975 ?AUTO_3979 ) ) ( not ( = ?AUTO_3975 ?AUTO_3977 ) ) ( not ( = ?AUTO_3979 ?AUTO_3977 ) ) ( CAN_TRAVERSE ?AUTO_3976 ?AUTO_3978 ?AUTO_3979 ) ( VISIBLE ?AUTO_3978 ?AUTO_3979 ) ( not ( = ?AUTO_3975 ?AUTO_3978 ) ) ( not ( = ?AUTO_3977 ?AUTO_3978 ) ) ( not ( = ?AUTO_3979 ?AUTO_3978 ) ) ( CAN_TRAVERSE ?AUTO_3976 ?AUTO_3975 ?AUTO_3978 ) ( AT ?AUTO_3976 ?AUTO_3975 ) ( VISIBLE ?AUTO_3975 ?AUTO_3978 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3976 ?AUTO_3975 ?AUTO_3978 )
      ( GET_ROCK_DATA ?AUTO_3975 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3975 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3981 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3984 - LANDER
      ?AUTO_3983 - WAYPOINT
      ?AUTO_3985 - WAYPOINT
      ?AUTO_3982 - ROVER
      ?AUTO_3986 - WAYPOINT
      ?AUTO_3987 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3984 ?AUTO_3983 ) ( VISIBLE ?AUTO_3985 ?AUTO_3983 ) ( AVAILABLE ?AUTO_3982 ) ( CHANNEL_FREE ?AUTO_3984 ) ( not ( = ?AUTO_3981 ?AUTO_3985 ) ) ( not ( = ?AUTO_3981 ?AUTO_3983 ) ) ( not ( = ?AUTO_3985 ?AUTO_3983 ) ) ( CAN_TRAVERSE ?AUTO_3982 ?AUTO_3986 ?AUTO_3985 ) ( VISIBLE ?AUTO_3986 ?AUTO_3985 ) ( not ( = ?AUTO_3981 ?AUTO_3986 ) ) ( not ( = ?AUTO_3983 ?AUTO_3986 ) ) ( not ( = ?AUTO_3985 ?AUTO_3986 ) ) ( CAN_TRAVERSE ?AUTO_3982 ?AUTO_3981 ?AUTO_3986 ) ( AT ?AUTO_3982 ?AUTO_3981 ) ( VISIBLE ?AUTO_3981 ?AUTO_3986 ) ( AT_ROCK_SAMPLE ?AUTO_3981 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3982 ) ( STORE_OF ?AUTO_3987 ?AUTO_3982 ) ( EMPTY ?AUTO_3987 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_3982 ?AUTO_3987 ?AUTO_3981 )
      ( GET_ROCK_DATA ?AUTO_3981 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3981 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3988 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3993 - LANDER
      ?AUTO_3991 - WAYPOINT
      ?AUTO_3992 - WAYPOINT
      ?AUTO_3989 - ROVER
      ?AUTO_3990 - WAYPOINT
      ?AUTO_3994 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3993 ?AUTO_3991 ) ( VISIBLE ?AUTO_3992 ?AUTO_3991 ) ( AVAILABLE ?AUTO_3989 ) ( CHANNEL_FREE ?AUTO_3993 ) ( not ( = ?AUTO_3988 ?AUTO_3992 ) ) ( not ( = ?AUTO_3988 ?AUTO_3991 ) ) ( not ( = ?AUTO_3992 ?AUTO_3991 ) ) ( CAN_TRAVERSE ?AUTO_3989 ?AUTO_3990 ?AUTO_3992 ) ( VISIBLE ?AUTO_3990 ?AUTO_3992 ) ( not ( = ?AUTO_3988 ?AUTO_3990 ) ) ( not ( = ?AUTO_3991 ?AUTO_3990 ) ) ( not ( = ?AUTO_3992 ?AUTO_3990 ) ) ( CAN_TRAVERSE ?AUTO_3989 ?AUTO_3988 ?AUTO_3990 ) ( VISIBLE ?AUTO_3988 ?AUTO_3990 ) ( AT_ROCK_SAMPLE ?AUTO_3988 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3989 ) ( STORE_OF ?AUTO_3994 ?AUTO_3989 ) ( EMPTY ?AUTO_3994 ) ( CAN_TRAVERSE ?AUTO_3989 ?AUTO_3990 ?AUTO_3988 ) ( AT ?AUTO_3989 ?AUTO_3990 ) ( VISIBLE ?AUTO_3990 ?AUTO_3988 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3989 ?AUTO_3990 ?AUTO_3988 )
      ( GET_ROCK_DATA ?AUTO_3988 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3988 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3995 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4001 - LANDER
      ?AUTO_3999 - WAYPOINT
      ?AUTO_4000 - WAYPOINT
      ?AUTO_3997 - ROVER
      ?AUTO_3998 - WAYPOINT
      ?AUTO_3996 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4001 ?AUTO_3999 ) ( VISIBLE ?AUTO_4000 ?AUTO_3999 ) ( AVAILABLE ?AUTO_3997 ) ( CHANNEL_FREE ?AUTO_4001 ) ( not ( = ?AUTO_3995 ?AUTO_4000 ) ) ( not ( = ?AUTO_3995 ?AUTO_3999 ) ) ( not ( = ?AUTO_4000 ?AUTO_3999 ) ) ( CAN_TRAVERSE ?AUTO_3997 ?AUTO_3998 ?AUTO_4000 ) ( VISIBLE ?AUTO_3998 ?AUTO_4000 ) ( not ( = ?AUTO_3995 ?AUTO_3998 ) ) ( not ( = ?AUTO_3999 ?AUTO_3998 ) ) ( not ( = ?AUTO_4000 ?AUTO_3998 ) ) ( CAN_TRAVERSE ?AUTO_3997 ?AUTO_3995 ?AUTO_3998 ) ( VISIBLE ?AUTO_3995 ?AUTO_3998 ) ( AT_ROCK_SAMPLE ?AUTO_3995 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3997 ) ( STORE_OF ?AUTO_3996 ?AUTO_3997 ) ( EMPTY ?AUTO_3996 ) ( CAN_TRAVERSE ?AUTO_3997 ?AUTO_3998 ?AUTO_3995 ) ( VISIBLE ?AUTO_3998 ?AUTO_3995 ) ( CAN_TRAVERSE ?AUTO_3997 ?AUTO_4000 ?AUTO_3998 ) ( AT ?AUTO_3997 ?AUTO_4000 ) ( VISIBLE ?AUTO_4000 ?AUTO_3998 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3997 ?AUTO_4000 ?AUTO_3998 )
      ( GET_ROCK_DATA ?AUTO_3995 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3995 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4002 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4003 - LANDER
      ?AUTO_4004 - WAYPOINT
      ?AUTO_4007 - WAYPOINT
      ?AUTO_4005 - ROVER
      ?AUTO_4008 - WAYPOINT
      ?AUTO_4006 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4003 ?AUTO_4004 ) ( VISIBLE ?AUTO_4007 ?AUTO_4004 ) ( AVAILABLE ?AUTO_4005 ) ( CHANNEL_FREE ?AUTO_4003 ) ( not ( = ?AUTO_4002 ?AUTO_4007 ) ) ( not ( = ?AUTO_4002 ?AUTO_4004 ) ) ( not ( = ?AUTO_4007 ?AUTO_4004 ) ) ( CAN_TRAVERSE ?AUTO_4005 ?AUTO_4008 ?AUTO_4007 ) ( VISIBLE ?AUTO_4008 ?AUTO_4007 ) ( not ( = ?AUTO_4002 ?AUTO_4008 ) ) ( not ( = ?AUTO_4004 ?AUTO_4008 ) ) ( not ( = ?AUTO_4007 ?AUTO_4008 ) ) ( CAN_TRAVERSE ?AUTO_4005 ?AUTO_4002 ?AUTO_4008 ) ( VISIBLE ?AUTO_4002 ?AUTO_4008 ) ( AT_ROCK_SAMPLE ?AUTO_4002 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4005 ) ( STORE_OF ?AUTO_4006 ?AUTO_4005 ) ( CAN_TRAVERSE ?AUTO_4005 ?AUTO_4008 ?AUTO_4002 ) ( VISIBLE ?AUTO_4008 ?AUTO_4002 ) ( CAN_TRAVERSE ?AUTO_4005 ?AUTO_4007 ?AUTO_4008 ) ( AT ?AUTO_4005 ?AUTO_4007 ) ( VISIBLE ?AUTO_4007 ?AUTO_4008 ) ( FULL ?AUTO_4006 ) )
    :subtasks
    ( ( !DROP ?AUTO_4005 ?AUTO_4006 )
      ( GET_ROCK_DATA ?AUTO_4002 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4002 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4023 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4025 - LANDER
      ?AUTO_4028 - WAYPOINT
      ?AUTO_4024 - WAYPOINT
      ?AUTO_4027 - ROVER
      ?AUTO_4029 - WAYPOINT
      ?AUTO_4026 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4025 ?AUTO_4028 ) ( VISIBLE ?AUTO_4024 ?AUTO_4028 ) ( AVAILABLE ?AUTO_4027 ) ( CHANNEL_FREE ?AUTO_4025 ) ( not ( = ?AUTO_4023 ?AUTO_4024 ) ) ( not ( = ?AUTO_4023 ?AUTO_4028 ) ) ( not ( = ?AUTO_4024 ?AUTO_4028 ) ) ( CAN_TRAVERSE ?AUTO_4027 ?AUTO_4029 ?AUTO_4024 ) ( VISIBLE ?AUTO_4029 ?AUTO_4024 ) ( not ( = ?AUTO_4023 ?AUTO_4029 ) ) ( not ( = ?AUTO_4028 ?AUTO_4029 ) ) ( not ( = ?AUTO_4024 ?AUTO_4029 ) ) ( CAN_TRAVERSE ?AUTO_4027 ?AUTO_4023 ?AUTO_4029 ) ( VISIBLE ?AUTO_4023 ?AUTO_4029 ) ( AT_ROCK_SAMPLE ?AUTO_4023 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4027 ) ( STORE_OF ?AUTO_4026 ?AUTO_4027 ) ( EMPTY ?AUTO_4026 ) ( CAN_TRAVERSE ?AUTO_4027 ?AUTO_4029 ?AUTO_4023 ) ( VISIBLE ?AUTO_4029 ?AUTO_4023 ) ( CAN_TRAVERSE ?AUTO_4027 ?AUTO_4024 ?AUTO_4029 ) ( VISIBLE ?AUTO_4024 ?AUTO_4029 ) ( CAN_TRAVERSE ?AUTO_4027 ?AUTO_4028 ?AUTO_4024 ) ( AT ?AUTO_4027 ?AUTO_4028 ) ( VISIBLE ?AUTO_4028 ?AUTO_4024 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4027 ?AUTO_4028 ?AUTO_4024 )
      ( GET_ROCK_DATA ?AUTO_4023 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4023 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4111 - OBJECTIVE
      ?AUTO_4112 - MODE
    )
    :vars
    (
      ?AUTO_4113 - LANDER
      ?AUTO_4115 - WAYPOINT
      ?AUTO_4117 - WAYPOINT
      ?AUTO_4116 - ROVER
      ?AUTO_4114 - WAYPOINT
      ?AUTO_4118 - CAMERA
      ?AUTO_4119 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4113 ?AUTO_4115 ) ( VISIBLE ?AUTO_4117 ?AUTO_4115 ) ( AVAILABLE ?AUTO_4116 ) ( CHANNEL_FREE ?AUTO_4113 ) ( not ( = ?AUTO_4117 ?AUTO_4115 ) ) ( CAN_TRAVERSE ?AUTO_4116 ?AUTO_4114 ?AUTO_4117 ) ( VISIBLE ?AUTO_4114 ?AUTO_4117 ) ( not ( = ?AUTO_4115 ?AUTO_4114 ) ) ( not ( = ?AUTO_4117 ?AUTO_4114 ) ) ( CALIBRATED ?AUTO_4118 ?AUTO_4116 ) ( ON_BOARD ?AUTO_4118 ?AUTO_4116 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4116 ) ( SUPPORTS ?AUTO_4118 ?AUTO_4112 ) ( VISIBLE_FROM ?AUTO_4111 ?AUTO_4114 ) ( CAN_TRAVERSE ?AUTO_4116 ?AUTO_4119 ?AUTO_4114 ) ( AT ?AUTO_4116 ?AUTO_4119 ) ( VISIBLE ?AUTO_4119 ?AUTO_4114 ) ( not ( = ?AUTO_4115 ?AUTO_4119 ) ) ( not ( = ?AUTO_4117 ?AUTO_4119 ) ) ( not ( = ?AUTO_4114 ?AUTO_4119 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4116 ?AUTO_4119 ?AUTO_4114 )
      ( GET_IMAGE_DATA ?AUTO_4111 ?AUTO_4112 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4111 ?AUTO_4112 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4130 - OBJECTIVE
      ?AUTO_4131 - MODE
    )
    :vars
    (
      ?AUTO_4138 - LANDER
      ?AUTO_4135 - WAYPOINT
      ?AUTO_4134 - WAYPOINT
      ?AUTO_4137 - ROVER
      ?AUTO_4132 - WAYPOINT
      ?AUTO_4136 - CAMERA
      ?AUTO_4133 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4138 ?AUTO_4135 ) ( VISIBLE ?AUTO_4134 ?AUTO_4135 ) ( AVAILABLE ?AUTO_4137 ) ( CHANNEL_FREE ?AUTO_4138 ) ( not ( = ?AUTO_4134 ?AUTO_4135 ) ) ( CAN_TRAVERSE ?AUTO_4137 ?AUTO_4132 ?AUTO_4134 ) ( VISIBLE ?AUTO_4132 ?AUTO_4134 ) ( not ( = ?AUTO_4135 ?AUTO_4132 ) ) ( not ( = ?AUTO_4134 ?AUTO_4132 ) ) ( CALIBRATED ?AUTO_4136 ?AUTO_4137 ) ( ON_BOARD ?AUTO_4136 ?AUTO_4137 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4137 ) ( SUPPORTS ?AUTO_4136 ?AUTO_4131 ) ( VISIBLE_FROM ?AUTO_4130 ?AUTO_4132 ) ( CAN_TRAVERSE ?AUTO_4137 ?AUTO_4133 ?AUTO_4132 ) ( VISIBLE ?AUTO_4133 ?AUTO_4132 ) ( not ( = ?AUTO_4135 ?AUTO_4133 ) ) ( not ( = ?AUTO_4134 ?AUTO_4133 ) ) ( not ( = ?AUTO_4132 ?AUTO_4133 ) ) ( CAN_TRAVERSE ?AUTO_4137 ?AUTO_4134 ?AUTO_4133 ) ( AT ?AUTO_4137 ?AUTO_4134 ) ( VISIBLE ?AUTO_4134 ?AUTO_4133 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4137 ?AUTO_4134 ?AUTO_4133 )
      ( GET_IMAGE_DATA ?AUTO_4130 ?AUTO_4131 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4130 ?AUTO_4131 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4145 - OBJECTIVE
      ?AUTO_4146 - MODE
    )
    :vars
    (
      ?AUTO_4153 - LANDER
      ?AUTO_4150 - WAYPOINT
      ?AUTO_4148 - WAYPOINT
      ?AUTO_4147 - ROVER
      ?AUTO_4152 - WAYPOINT
      ?AUTO_4151 - CAMERA
      ?AUTO_4149 - WAYPOINT
      ?AUTO_4154 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4153 ?AUTO_4150 ) ( VISIBLE ?AUTO_4148 ?AUTO_4150 ) ( AVAILABLE ?AUTO_4147 ) ( CHANNEL_FREE ?AUTO_4153 ) ( not ( = ?AUTO_4148 ?AUTO_4150 ) ) ( CAN_TRAVERSE ?AUTO_4147 ?AUTO_4152 ?AUTO_4148 ) ( VISIBLE ?AUTO_4152 ?AUTO_4148 ) ( not ( = ?AUTO_4150 ?AUTO_4152 ) ) ( not ( = ?AUTO_4148 ?AUTO_4152 ) ) ( ON_BOARD ?AUTO_4151 ?AUTO_4147 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4147 ) ( SUPPORTS ?AUTO_4151 ?AUTO_4146 ) ( VISIBLE_FROM ?AUTO_4145 ?AUTO_4152 ) ( CAN_TRAVERSE ?AUTO_4147 ?AUTO_4149 ?AUTO_4152 ) ( VISIBLE ?AUTO_4149 ?AUTO_4152 ) ( not ( = ?AUTO_4150 ?AUTO_4149 ) ) ( not ( = ?AUTO_4148 ?AUTO_4149 ) ) ( not ( = ?AUTO_4152 ?AUTO_4149 ) ) ( CAN_TRAVERSE ?AUTO_4147 ?AUTO_4148 ?AUTO_4149 ) ( AT ?AUTO_4147 ?AUTO_4148 ) ( VISIBLE ?AUTO_4148 ?AUTO_4149 ) ( CALIBRATION_TARGET ?AUTO_4151 ?AUTO_4154 ) ( VISIBLE_FROM ?AUTO_4154 ?AUTO_4148 ) ( not ( = ?AUTO_4145 ?AUTO_4154 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4147 ?AUTO_4151 ?AUTO_4154 ?AUTO_4148 )
      ( GET_IMAGE_DATA ?AUTO_4145 ?AUTO_4146 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4145 ?AUTO_4146 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4183 - OBJECTIVE
      ?AUTO_4184 - MODE
    )
    :vars
    (
      ?AUTO_4188 - LANDER
      ?AUTO_4185 - WAYPOINT
      ?AUTO_4186 - WAYPOINT
      ?AUTO_4187 - ROVER
      ?AUTO_4189 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4188 ?AUTO_4185 ) ( VISIBLE ?AUTO_4186 ?AUTO_4185 ) ( AVAILABLE ?AUTO_4187 ) ( CHANNEL_FREE ?AUTO_4188 ) ( not ( = ?AUTO_4186 ?AUTO_4185 ) ) ( CAN_TRAVERSE ?AUTO_4187 ?AUTO_4185 ?AUTO_4186 ) ( VISIBLE ?AUTO_4185 ?AUTO_4186 ) ( ON_BOARD ?AUTO_4189 ?AUTO_4187 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4187 ) ( SUPPORTS ?AUTO_4189 ?AUTO_4184 ) ( VISIBLE_FROM ?AUTO_4183 ?AUTO_4185 ) ( CALIBRATION_TARGET ?AUTO_4189 ?AUTO_4183 ) ( CAN_TRAVERSE ?AUTO_4187 ?AUTO_4186 ?AUTO_4185 ) ( AT ?AUTO_4187 ?AUTO_4186 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4187 ?AUTO_4186 ?AUTO_4185 )
      ( GET_IMAGE_DATA ?AUTO_4183 ?AUTO_4184 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4183 ?AUTO_4184 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4190 - OBJECTIVE
      ?AUTO_4191 - MODE
    )
    :vars
    (
      ?AUTO_4192 - LANDER
      ?AUTO_4193 - WAYPOINT
      ?AUTO_4194 - WAYPOINT
      ?AUTO_4195 - ROVER
      ?AUTO_4196 - CAMERA
      ?AUTO_4197 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4192 ?AUTO_4193 ) ( VISIBLE ?AUTO_4194 ?AUTO_4193 ) ( AVAILABLE ?AUTO_4195 ) ( CHANNEL_FREE ?AUTO_4192 ) ( not ( = ?AUTO_4194 ?AUTO_4193 ) ) ( CAN_TRAVERSE ?AUTO_4195 ?AUTO_4193 ?AUTO_4194 ) ( VISIBLE ?AUTO_4193 ?AUTO_4194 ) ( ON_BOARD ?AUTO_4196 ?AUTO_4195 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4195 ) ( SUPPORTS ?AUTO_4196 ?AUTO_4191 ) ( VISIBLE_FROM ?AUTO_4190 ?AUTO_4193 ) ( CALIBRATION_TARGET ?AUTO_4196 ?AUTO_4190 ) ( CAN_TRAVERSE ?AUTO_4195 ?AUTO_4194 ?AUTO_4193 ) ( CAN_TRAVERSE ?AUTO_4195 ?AUTO_4197 ?AUTO_4194 ) ( AT ?AUTO_4195 ?AUTO_4197 ) ( VISIBLE ?AUTO_4197 ?AUTO_4194 ) ( not ( = ?AUTO_4193 ?AUTO_4197 ) ) ( not ( = ?AUTO_4194 ?AUTO_4197 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4195 ?AUTO_4197 ?AUTO_4194 )
      ( GET_IMAGE_DATA ?AUTO_4190 ?AUTO_4191 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4190 ?AUTO_4191 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4198 - OBJECTIVE
      ?AUTO_4199 - MODE
    )
    :vars
    (
      ?AUTO_4202 - LANDER
      ?AUTO_4200 - WAYPOINT
      ?AUTO_4204 - WAYPOINT
      ?AUTO_4203 - ROVER
      ?AUTO_4201 - CAMERA
      ?AUTO_4205 - WAYPOINT
      ?AUTO_4206 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4202 ?AUTO_4200 ) ( VISIBLE ?AUTO_4204 ?AUTO_4200 ) ( AVAILABLE ?AUTO_4203 ) ( CHANNEL_FREE ?AUTO_4202 ) ( not ( = ?AUTO_4204 ?AUTO_4200 ) ) ( CAN_TRAVERSE ?AUTO_4203 ?AUTO_4200 ?AUTO_4204 ) ( VISIBLE ?AUTO_4200 ?AUTO_4204 ) ( ON_BOARD ?AUTO_4201 ?AUTO_4203 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4203 ) ( SUPPORTS ?AUTO_4201 ?AUTO_4199 ) ( VISIBLE_FROM ?AUTO_4198 ?AUTO_4200 ) ( CALIBRATION_TARGET ?AUTO_4201 ?AUTO_4198 ) ( CAN_TRAVERSE ?AUTO_4203 ?AUTO_4204 ?AUTO_4200 ) ( CAN_TRAVERSE ?AUTO_4203 ?AUTO_4205 ?AUTO_4204 ) ( VISIBLE ?AUTO_4205 ?AUTO_4204 ) ( not ( = ?AUTO_4200 ?AUTO_4205 ) ) ( not ( = ?AUTO_4204 ?AUTO_4205 ) ) ( CAN_TRAVERSE ?AUTO_4203 ?AUTO_4206 ?AUTO_4205 ) ( AT ?AUTO_4203 ?AUTO_4206 ) ( VISIBLE ?AUTO_4206 ?AUTO_4205 ) ( not ( = ?AUTO_4200 ?AUTO_4206 ) ) ( not ( = ?AUTO_4204 ?AUTO_4206 ) ) ( not ( = ?AUTO_4205 ?AUTO_4206 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4203 ?AUTO_4206 ?AUTO_4205 )
      ( GET_IMAGE_DATA ?AUTO_4198 ?AUTO_4199 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4198 ?AUTO_4199 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4207 - OBJECTIVE
      ?AUTO_4208 - MODE
    )
    :vars
    (
      ?AUTO_4212 - LANDER
      ?AUTO_4214 - WAYPOINT
      ?AUTO_4211 - WAYPOINT
      ?AUTO_4210 - ROVER
      ?AUTO_4209 - CAMERA
      ?AUTO_4215 - WAYPOINT
      ?AUTO_4213 - WAYPOINT
      ?AUTO_4216 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4212 ?AUTO_4214 ) ( VISIBLE ?AUTO_4211 ?AUTO_4214 ) ( AVAILABLE ?AUTO_4210 ) ( CHANNEL_FREE ?AUTO_4212 ) ( not ( = ?AUTO_4211 ?AUTO_4214 ) ) ( CAN_TRAVERSE ?AUTO_4210 ?AUTO_4214 ?AUTO_4211 ) ( VISIBLE ?AUTO_4214 ?AUTO_4211 ) ( ON_BOARD ?AUTO_4209 ?AUTO_4210 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4210 ) ( SUPPORTS ?AUTO_4209 ?AUTO_4208 ) ( VISIBLE_FROM ?AUTO_4207 ?AUTO_4214 ) ( CALIBRATION_TARGET ?AUTO_4209 ?AUTO_4207 ) ( CAN_TRAVERSE ?AUTO_4210 ?AUTO_4211 ?AUTO_4214 ) ( CAN_TRAVERSE ?AUTO_4210 ?AUTO_4215 ?AUTO_4211 ) ( VISIBLE ?AUTO_4215 ?AUTO_4211 ) ( not ( = ?AUTO_4214 ?AUTO_4215 ) ) ( not ( = ?AUTO_4211 ?AUTO_4215 ) ) ( CAN_TRAVERSE ?AUTO_4210 ?AUTO_4213 ?AUTO_4215 ) ( VISIBLE ?AUTO_4213 ?AUTO_4215 ) ( not ( = ?AUTO_4214 ?AUTO_4213 ) ) ( not ( = ?AUTO_4211 ?AUTO_4213 ) ) ( not ( = ?AUTO_4215 ?AUTO_4213 ) ) ( CAN_TRAVERSE ?AUTO_4210 ?AUTO_4216 ?AUTO_4213 ) ( AT ?AUTO_4210 ?AUTO_4216 ) ( VISIBLE ?AUTO_4216 ?AUTO_4213 ) ( not ( = ?AUTO_4214 ?AUTO_4216 ) ) ( not ( = ?AUTO_4211 ?AUTO_4216 ) ) ( not ( = ?AUTO_4215 ?AUTO_4216 ) ) ( not ( = ?AUTO_4213 ?AUTO_4216 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4210 ?AUTO_4216 ?AUTO_4213 )
      ( GET_IMAGE_DATA ?AUTO_4207 ?AUTO_4208 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4207 ?AUTO_4208 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4269 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4273 - LANDER
      ?AUTO_4270 - WAYPOINT
      ?AUTO_4272 - ROVER
      ?AUTO_4274 - WAYPOINT
      ?AUTO_4271 - WAYPOINT
      ?AUTO_4275 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4273 ?AUTO_4270 ) ( HAVE_SOIL_ANALYSIS ?AUTO_4272 ?AUTO_4269 ) ( VISIBLE ?AUTO_4274 ?AUTO_4270 ) ( AVAILABLE ?AUTO_4272 ) ( CHANNEL_FREE ?AUTO_4273 ) ( not ( = ?AUTO_4269 ?AUTO_4274 ) ) ( not ( = ?AUTO_4269 ?AUTO_4270 ) ) ( not ( = ?AUTO_4274 ?AUTO_4270 ) ) ( CAN_TRAVERSE ?AUTO_4272 ?AUTO_4271 ?AUTO_4274 ) ( VISIBLE ?AUTO_4271 ?AUTO_4274 ) ( not ( = ?AUTO_4269 ?AUTO_4271 ) ) ( not ( = ?AUTO_4270 ?AUTO_4271 ) ) ( not ( = ?AUTO_4274 ?AUTO_4271 ) ) ( CAN_TRAVERSE ?AUTO_4272 ?AUTO_4275 ?AUTO_4271 ) ( AT ?AUTO_4272 ?AUTO_4275 ) ( VISIBLE ?AUTO_4275 ?AUTO_4271 ) ( not ( = ?AUTO_4269 ?AUTO_4275 ) ) ( not ( = ?AUTO_4270 ?AUTO_4275 ) ) ( not ( = ?AUTO_4274 ?AUTO_4275 ) ) ( not ( = ?AUTO_4271 ?AUTO_4275 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4272 ?AUTO_4275 ?AUTO_4271 )
      ( GET_SOIL_DATA ?AUTO_4269 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4269 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4276 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4278 - LANDER
      ?AUTO_4279 - WAYPOINT
      ?AUTO_4282 - ROVER
      ?AUTO_4281 - WAYPOINT
      ?AUTO_4280 - WAYPOINT
      ?AUTO_4277 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4278 ?AUTO_4279 ) ( HAVE_SOIL_ANALYSIS ?AUTO_4282 ?AUTO_4276 ) ( VISIBLE ?AUTO_4281 ?AUTO_4279 ) ( AVAILABLE ?AUTO_4282 ) ( CHANNEL_FREE ?AUTO_4278 ) ( not ( = ?AUTO_4276 ?AUTO_4281 ) ) ( not ( = ?AUTO_4276 ?AUTO_4279 ) ) ( not ( = ?AUTO_4281 ?AUTO_4279 ) ) ( CAN_TRAVERSE ?AUTO_4282 ?AUTO_4280 ?AUTO_4281 ) ( VISIBLE ?AUTO_4280 ?AUTO_4281 ) ( not ( = ?AUTO_4276 ?AUTO_4280 ) ) ( not ( = ?AUTO_4279 ?AUTO_4280 ) ) ( not ( = ?AUTO_4281 ?AUTO_4280 ) ) ( CAN_TRAVERSE ?AUTO_4282 ?AUTO_4277 ?AUTO_4280 ) ( VISIBLE ?AUTO_4277 ?AUTO_4280 ) ( not ( = ?AUTO_4276 ?AUTO_4277 ) ) ( not ( = ?AUTO_4279 ?AUTO_4277 ) ) ( not ( = ?AUTO_4281 ?AUTO_4277 ) ) ( not ( = ?AUTO_4280 ?AUTO_4277 ) ) ( CAN_TRAVERSE ?AUTO_4282 ?AUTO_4276 ?AUTO_4277 ) ( AT ?AUTO_4282 ?AUTO_4276 ) ( VISIBLE ?AUTO_4276 ?AUTO_4277 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4282 ?AUTO_4276 ?AUTO_4277 )
      ( GET_SOIL_DATA ?AUTO_4276 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4276 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4283 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4288 - LANDER
      ?AUTO_4289 - WAYPOINT
      ?AUTO_4285 - WAYPOINT
      ?AUTO_4284 - ROVER
      ?AUTO_4287 - WAYPOINT
      ?AUTO_4286 - WAYPOINT
      ?AUTO_4290 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4288 ?AUTO_4289 ) ( VISIBLE ?AUTO_4285 ?AUTO_4289 ) ( AVAILABLE ?AUTO_4284 ) ( CHANNEL_FREE ?AUTO_4288 ) ( not ( = ?AUTO_4283 ?AUTO_4285 ) ) ( not ( = ?AUTO_4283 ?AUTO_4289 ) ) ( not ( = ?AUTO_4285 ?AUTO_4289 ) ) ( CAN_TRAVERSE ?AUTO_4284 ?AUTO_4287 ?AUTO_4285 ) ( VISIBLE ?AUTO_4287 ?AUTO_4285 ) ( not ( = ?AUTO_4283 ?AUTO_4287 ) ) ( not ( = ?AUTO_4289 ?AUTO_4287 ) ) ( not ( = ?AUTO_4285 ?AUTO_4287 ) ) ( CAN_TRAVERSE ?AUTO_4284 ?AUTO_4286 ?AUTO_4287 ) ( VISIBLE ?AUTO_4286 ?AUTO_4287 ) ( not ( = ?AUTO_4283 ?AUTO_4286 ) ) ( not ( = ?AUTO_4289 ?AUTO_4286 ) ) ( not ( = ?AUTO_4285 ?AUTO_4286 ) ) ( not ( = ?AUTO_4287 ?AUTO_4286 ) ) ( CAN_TRAVERSE ?AUTO_4284 ?AUTO_4283 ?AUTO_4286 ) ( AT ?AUTO_4284 ?AUTO_4283 ) ( VISIBLE ?AUTO_4283 ?AUTO_4286 ) ( AT_SOIL_SAMPLE ?AUTO_4283 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4284 ) ( STORE_OF ?AUTO_4290 ?AUTO_4284 ) ( EMPTY ?AUTO_4290 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4284 ?AUTO_4290 ?AUTO_4283 )
      ( GET_SOIL_DATA ?AUTO_4283 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4283 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4291 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4292 - LANDER
      ?AUTO_4295 - WAYPOINT
      ?AUTO_4294 - WAYPOINT
      ?AUTO_4293 - ROVER
      ?AUTO_4296 - WAYPOINT
      ?AUTO_4298 - WAYPOINT
      ?AUTO_4297 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4292 ?AUTO_4295 ) ( VISIBLE ?AUTO_4294 ?AUTO_4295 ) ( AVAILABLE ?AUTO_4293 ) ( CHANNEL_FREE ?AUTO_4292 ) ( not ( = ?AUTO_4291 ?AUTO_4294 ) ) ( not ( = ?AUTO_4291 ?AUTO_4295 ) ) ( not ( = ?AUTO_4294 ?AUTO_4295 ) ) ( CAN_TRAVERSE ?AUTO_4293 ?AUTO_4296 ?AUTO_4294 ) ( VISIBLE ?AUTO_4296 ?AUTO_4294 ) ( not ( = ?AUTO_4291 ?AUTO_4296 ) ) ( not ( = ?AUTO_4295 ?AUTO_4296 ) ) ( not ( = ?AUTO_4294 ?AUTO_4296 ) ) ( CAN_TRAVERSE ?AUTO_4293 ?AUTO_4298 ?AUTO_4296 ) ( VISIBLE ?AUTO_4298 ?AUTO_4296 ) ( not ( = ?AUTO_4291 ?AUTO_4298 ) ) ( not ( = ?AUTO_4295 ?AUTO_4298 ) ) ( not ( = ?AUTO_4294 ?AUTO_4298 ) ) ( not ( = ?AUTO_4296 ?AUTO_4298 ) ) ( CAN_TRAVERSE ?AUTO_4293 ?AUTO_4291 ?AUTO_4298 ) ( VISIBLE ?AUTO_4291 ?AUTO_4298 ) ( AT_SOIL_SAMPLE ?AUTO_4291 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4293 ) ( STORE_OF ?AUTO_4297 ?AUTO_4293 ) ( EMPTY ?AUTO_4297 ) ( CAN_TRAVERSE ?AUTO_4293 ?AUTO_4296 ?AUTO_4291 ) ( AT ?AUTO_4293 ?AUTO_4296 ) ( VISIBLE ?AUTO_4296 ?AUTO_4291 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4293 ?AUTO_4296 ?AUTO_4291 )
      ( GET_SOIL_DATA ?AUTO_4291 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4291 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4299 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4302 - LANDER
      ?AUTO_4304 - WAYPOINT
      ?AUTO_4305 - WAYPOINT
      ?AUTO_4300 - ROVER
      ?AUTO_4306 - WAYPOINT
      ?AUTO_4301 - WAYPOINT
      ?AUTO_4303 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4302 ?AUTO_4304 ) ( VISIBLE ?AUTO_4305 ?AUTO_4304 ) ( AVAILABLE ?AUTO_4300 ) ( CHANNEL_FREE ?AUTO_4302 ) ( not ( = ?AUTO_4299 ?AUTO_4305 ) ) ( not ( = ?AUTO_4299 ?AUTO_4304 ) ) ( not ( = ?AUTO_4305 ?AUTO_4304 ) ) ( CAN_TRAVERSE ?AUTO_4300 ?AUTO_4306 ?AUTO_4305 ) ( VISIBLE ?AUTO_4306 ?AUTO_4305 ) ( not ( = ?AUTO_4299 ?AUTO_4306 ) ) ( not ( = ?AUTO_4304 ?AUTO_4306 ) ) ( not ( = ?AUTO_4305 ?AUTO_4306 ) ) ( CAN_TRAVERSE ?AUTO_4300 ?AUTO_4301 ?AUTO_4306 ) ( VISIBLE ?AUTO_4301 ?AUTO_4306 ) ( not ( = ?AUTO_4299 ?AUTO_4301 ) ) ( not ( = ?AUTO_4304 ?AUTO_4301 ) ) ( not ( = ?AUTO_4305 ?AUTO_4301 ) ) ( not ( = ?AUTO_4306 ?AUTO_4301 ) ) ( CAN_TRAVERSE ?AUTO_4300 ?AUTO_4299 ?AUTO_4301 ) ( VISIBLE ?AUTO_4299 ?AUTO_4301 ) ( AT_SOIL_SAMPLE ?AUTO_4299 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4300 ) ( STORE_OF ?AUTO_4303 ?AUTO_4300 ) ( EMPTY ?AUTO_4303 ) ( CAN_TRAVERSE ?AUTO_4300 ?AUTO_4306 ?AUTO_4299 ) ( VISIBLE ?AUTO_4306 ?AUTO_4299 ) ( CAN_TRAVERSE ?AUTO_4300 ?AUTO_4305 ?AUTO_4306 ) ( AT ?AUTO_4300 ?AUTO_4305 ) ( VISIBLE ?AUTO_4305 ?AUTO_4306 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4300 ?AUTO_4305 ?AUTO_4306 )
      ( GET_SOIL_DATA ?AUTO_4299 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4299 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4307 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4312 - LANDER
      ?AUTO_4310 - WAYPOINT
      ?AUTO_4313 - WAYPOINT
      ?AUTO_4311 - ROVER
      ?AUTO_4308 - WAYPOINT
      ?AUTO_4309 - WAYPOINT
      ?AUTO_4314 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4312 ?AUTO_4310 ) ( VISIBLE ?AUTO_4313 ?AUTO_4310 ) ( AVAILABLE ?AUTO_4311 ) ( CHANNEL_FREE ?AUTO_4312 ) ( not ( = ?AUTO_4307 ?AUTO_4313 ) ) ( not ( = ?AUTO_4307 ?AUTO_4310 ) ) ( not ( = ?AUTO_4313 ?AUTO_4310 ) ) ( CAN_TRAVERSE ?AUTO_4311 ?AUTO_4308 ?AUTO_4313 ) ( VISIBLE ?AUTO_4308 ?AUTO_4313 ) ( not ( = ?AUTO_4307 ?AUTO_4308 ) ) ( not ( = ?AUTO_4310 ?AUTO_4308 ) ) ( not ( = ?AUTO_4313 ?AUTO_4308 ) ) ( CAN_TRAVERSE ?AUTO_4311 ?AUTO_4309 ?AUTO_4308 ) ( VISIBLE ?AUTO_4309 ?AUTO_4308 ) ( not ( = ?AUTO_4307 ?AUTO_4309 ) ) ( not ( = ?AUTO_4310 ?AUTO_4309 ) ) ( not ( = ?AUTO_4313 ?AUTO_4309 ) ) ( not ( = ?AUTO_4308 ?AUTO_4309 ) ) ( CAN_TRAVERSE ?AUTO_4311 ?AUTO_4307 ?AUTO_4309 ) ( VISIBLE ?AUTO_4307 ?AUTO_4309 ) ( AT_SOIL_SAMPLE ?AUTO_4307 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4311 ) ( STORE_OF ?AUTO_4314 ?AUTO_4311 ) ( CAN_TRAVERSE ?AUTO_4311 ?AUTO_4308 ?AUTO_4307 ) ( VISIBLE ?AUTO_4308 ?AUTO_4307 ) ( CAN_TRAVERSE ?AUTO_4311 ?AUTO_4313 ?AUTO_4308 ) ( AT ?AUTO_4311 ?AUTO_4313 ) ( VISIBLE ?AUTO_4313 ?AUTO_4308 ) ( FULL ?AUTO_4314 ) )
    :subtasks
    ( ( !DROP ?AUTO_4311 ?AUTO_4314 )
      ( GET_SOIL_DATA ?AUTO_4307 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4307 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4318 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4325 - LANDER
      ?AUTO_4320 - WAYPOINT
      ?AUTO_4322 - WAYPOINT
      ?AUTO_4319 - ROVER
      ?AUTO_4321 - WAYPOINT
      ?AUTO_4323 - WAYPOINT
      ?AUTO_4324 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4325 ?AUTO_4320 ) ( VISIBLE ?AUTO_4322 ?AUTO_4320 ) ( AVAILABLE ?AUTO_4319 ) ( CHANNEL_FREE ?AUTO_4325 ) ( not ( = ?AUTO_4318 ?AUTO_4322 ) ) ( not ( = ?AUTO_4318 ?AUTO_4320 ) ) ( not ( = ?AUTO_4322 ?AUTO_4320 ) ) ( CAN_TRAVERSE ?AUTO_4319 ?AUTO_4321 ?AUTO_4322 ) ( VISIBLE ?AUTO_4321 ?AUTO_4322 ) ( not ( = ?AUTO_4318 ?AUTO_4321 ) ) ( not ( = ?AUTO_4320 ?AUTO_4321 ) ) ( not ( = ?AUTO_4322 ?AUTO_4321 ) ) ( CAN_TRAVERSE ?AUTO_4319 ?AUTO_4323 ?AUTO_4321 ) ( VISIBLE ?AUTO_4323 ?AUTO_4321 ) ( not ( = ?AUTO_4318 ?AUTO_4323 ) ) ( not ( = ?AUTO_4320 ?AUTO_4323 ) ) ( not ( = ?AUTO_4322 ?AUTO_4323 ) ) ( not ( = ?AUTO_4321 ?AUTO_4323 ) ) ( CAN_TRAVERSE ?AUTO_4319 ?AUTO_4318 ?AUTO_4323 ) ( VISIBLE ?AUTO_4318 ?AUTO_4323 ) ( AT_SOIL_SAMPLE ?AUTO_4318 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4319 ) ( STORE_OF ?AUTO_4324 ?AUTO_4319 ) ( EMPTY ?AUTO_4324 ) ( CAN_TRAVERSE ?AUTO_4319 ?AUTO_4321 ?AUTO_4318 ) ( VISIBLE ?AUTO_4321 ?AUTO_4318 ) ( CAN_TRAVERSE ?AUTO_4319 ?AUTO_4322 ?AUTO_4321 ) ( VISIBLE ?AUTO_4322 ?AUTO_4321 ) ( CAN_TRAVERSE ?AUTO_4319 ?AUTO_4320 ?AUTO_4322 ) ( AT ?AUTO_4319 ?AUTO_4320 ) ( VISIBLE ?AUTO_4320 ?AUTO_4322 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4319 ?AUTO_4320 ?AUTO_4322 )
      ( GET_SOIL_DATA ?AUTO_4318 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4318 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4330 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4337 - LANDER
      ?AUTO_4331 - WAYPOINT
      ?AUTO_4335 - WAYPOINT
      ?AUTO_4336 - ROVER
      ?AUTO_4333 - WAYPOINT
      ?AUTO_4334 - WAYPOINT
      ?AUTO_4332 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4337 ?AUTO_4331 ) ( VISIBLE ?AUTO_4335 ?AUTO_4331 ) ( AVAILABLE ?AUTO_4336 ) ( CHANNEL_FREE ?AUTO_4337 ) ( not ( = ?AUTO_4330 ?AUTO_4335 ) ) ( not ( = ?AUTO_4330 ?AUTO_4331 ) ) ( not ( = ?AUTO_4335 ?AUTO_4331 ) ) ( CAN_TRAVERSE ?AUTO_4336 ?AUTO_4333 ?AUTO_4335 ) ( VISIBLE ?AUTO_4333 ?AUTO_4335 ) ( not ( = ?AUTO_4330 ?AUTO_4333 ) ) ( not ( = ?AUTO_4331 ?AUTO_4333 ) ) ( not ( = ?AUTO_4335 ?AUTO_4333 ) ) ( CAN_TRAVERSE ?AUTO_4336 ?AUTO_4334 ?AUTO_4333 ) ( VISIBLE ?AUTO_4334 ?AUTO_4333 ) ( not ( = ?AUTO_4330 ?AUTO_4334 ) ) ( not ( = ?AUTO_4331 ?AUTO_4334 ) ) ( not ( = ?AUTO_4335 ?AUTO_4334 ) ) ( not ( = ?AUTO_4333 ?AUTO_4334 ) ) ( CAN_TRAVERSE ?AUTO_4336 ?AUTO_4330 ?AUTO_4334 ) ( VISIBLE ?AUTO_4330 ?AUTO_4334 ) ( AT_SOIL_SAMPLE ?AUTO_4330 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4336 ) ( STORE_OF ?AUTO_4332 ?AUTO_4336 ) ( EMPTY ?AUTO_4332 ) ( CAN_TRAVERSE ?AUTO_4336 ?AUTO_4333 ?AUTO_4330 ) ( VISIBLE ?AUTO_4333 ?AUTO_4330 ) ( AT ?AUTO_4336 ?AUTO_4334 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4336 ?AUTO_4334 ?AUTO_4333 )
      ( GET_SOIL_DATA ?AUTO_4330 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4330 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4370 - OBJECTIVE
      ?AUTO_4371 - MODE
    )
    :vars
    (
      ?AUTO_4375 - LANDER
      ?AUTO_4372 - WAYPOINT
      ?AUTO_4376 - WAYPOINT
      ?AUTO_4373 - ROVER
      ?AUTO_4377 - WAYPOINT
      ?AUTO_4374 - CAMERA
      ?AUTO_4378 - WAYPOINT
      ?AUTO_4379 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4375 ?AUTO_4372 ) ( VISIBLE ?AUTO_4376 ?AUTO_4372 ) ( AVAILABLE ?AUTO_4373 ) ( CHANNEL_FREE ?AUTO_4375 ) ( not ( = ?AUTO_4376 ?AUTO_4372 ) ) ( CAN_TRAVERSE ?AUTO_4373 ?AUTO_4377 ?AUTO_4376 ) ( VISIBLE ?AUTO_4377 ?AUTO_4376 ) ( not ( = ?AUTO_4372 ?AUTO_4377 ) ) ( not ( = ?AUTO_4376 ?AUTO_4377 ) ) ( ON_BOARD ?AUTO_4374 ?AUTO_4373 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4373 ) ( SUPPORTS ?AUTO_4374 ?AUTO_4371 ) ( VISIBLE_FROM ?AUTO_4370 ?AUTO_4377 ) ( CAN_TRAVERSE ?AUTO_4373 ?AUTO_4378 ?AUTO_4377 ) ( AT ?AUTO_4373 ?AUTO_4378 ) ( VISIBLE ?AUTO_4378 ?AUTO_4377 ) ( not ( = ?AUTO_4372 ?AUTO_4378 ) ) ( not ( = ?AUTO_4376 ?AUTO_4378 ) ) ( not ( = ?AUTO_4377 ?AUTO_4378 ) ) ( CALIBRATION_TARGET ?AUTO_4374 ?AUTO_4379 ) ( VISIBLE_FROM ?AUTO_4379 ?AUTO_4378 ) ( not ( = ?AUTO_4370 ?AUTO_4379 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4373 ?AUTO_4374 ?AUTO_4379 ?AUTO_4378 )
      ( GET_IMAGE_DATA ?AUTO_4370 ?AUTO_4371 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4370 ?AUTO_4371 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4380 - OBJECTIVE
      ?AUTO_4381 - MODE
    )
    :vars
    (
      ?AUTO_4384 - LANDER
      ?AUTO_4382 - WAYPOINT
      ?AUTO_4383 - WAYPOINT
      ?AUTO_4388 - ROVER
      ?AUTO_4387 - WAYPOINT
      ?AUTO_4385 - CAMERA
      ?AUTO_4389 - WAYPOINT
      ?AUTO_4386 - OBJECTIVE
      ?AUTO_4390 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4384 ?AUTO_4382 ) ( VISIBLE ?AUTO_4383 ?AUTO_4382 ) ( AVAILABLE ?AUTO_4388 ) ( CHANNEL_FREE ?AUTO_4384 ) ( not ( = ?AUTO_4383 ?AUTO_4382 ) ) ( CAN_TRAVERSE ?AUTO_4388 ?AUTO_4387 ?AUTO_4383 ) ( VISIBLE ?AUTO_4387 ?AUTO_4383 ) ( not ( = ?AUTO_4382 ?AUTO_4387 ) ) ( not ( = ?AUTO_4383 ?AUTO_4387 ) ) ( ON_BOARD ?AUTO_4385 ?AUTO_4388 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4388 ) ( SUPPORTS ?AUTO_4385 ?AUTO_4381 ) ( VISIBLE_FROM ?AUTO_4380 ?AUTO_4387 ) ( CAN_TRAVERSE ?AUTO_4388 ?AUTO_4389 ?AUTO_4387 ) ( VISIBLE ?AUTO_4389 ?AUTO_4387 ) ( not ( = ?AUTO_4382 ?AUTO_4389 ) ) ( not ( = ?AUTO_4383 ?AUTO_4389 ) ) ( not ( = ?AUTO_4387 ?AUTO_4389 ) ) ( CALIBRATION_TARGET ?AUTO_4385 ?AUTO_4386 ) ( VISIBLE_FROM ?AUTO_4386 ?AUTO_4389 ) ( not ( = ?AUTO_4380 ?AUTO_4386 ) ) ( CAN_TRAVERSE ?AUTO_4388 ?AUTO_4390 ?AUTO_4389 ) ( AT ?AUTO_4388 ?AUTO_4390 ) ( VISIBLE ?AUTO_4390 ?AUTO_4389 ) ( not ( = ?AUTO_4382 ?AUTO_4390 ) ) ( not ( = ?AUTO_4383 ?AUTO_4390 ) ) ( not ( = ?AUTO_4387 ?AUTO_4390 ) ) ( not ( = ?AUTO_4389 ?AUTO_4390 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4388 ?AUTO_4390 ?AUTO_4389 )
      ( GET_IMAGE_DATA ?AUTO_4380 ?AUTO_4381 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4380 ?AUTO_4381 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4503 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4506 - LANDER
      ?AUTO_4508 - WAYPOINT
      ?AUTO_4509 - ROVER
      ?AUTO_4504 - STORE
      ?AUTO_4507 - WAYPOINT
      ?AUTO_4505 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4506 ?AUTO_4503 ) ( VISIBLE ?AUTO_4508 ?AUTO_4503 ) ( AVAILABLE ?AUTO_4509 ) ( CHANNEL_FREE ?AUTO_4506 ) ( not ( = ?AUTO_4503 ?AUTO_4508 ) ) ( CAN_TRAVERSE ?AUTO_4509 ?AUTO_4503 ?AUTO_4508 ) ( VISIBLE ?AUTO_4503 ?AUTO_4508 ) ( AT_ROCK_SAMPLE ?AUTO_4503 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4509 ) ( STORE_OF ?AUTO_4504 ?AUTO_4509 ) ( CAN_TRAVERSE ?AUTO_4509 ?AUTO_4507 ?AUTO_4503 ) ( VISIBLE ?AUTO_4507 ?AUTO_4503 ) ( not ( = ?AUTO_4503 ?AUTO_4507 ) ) ( not ( = ?AUTO_4508 ?AUTO_4507 ) ) ( CAN_TRAVERSE ?AUTO_4509 ?AUTO_4505 ?AUTO_4507 ) ( AT ?AUTO_4509 ?AUTO_4505 ) ( VISIBLE ?AUTO_4505 ?AUTO_4507 ) ( not ( = ?AUTO_4503 ?AUTO_4505 ) ) ( not ( = ?AUTO_4508 ?AUTO_4505 ) ) ( not ( = ?AUTO_4507 ?AUTO_4505 ) ) ( AT_SOIL_SAMPLE ?AUTO_4505 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4509 ) ( EMPTY ?AUTO_4504 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4509 ?AUTO_4504 ?AUTO_4505 )
      ( GET_ROCK_DATA ?AUTO_4503 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4503 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4526 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4533 - LANDER
      ?AUTO_4527 - WAYPOINT
      ?AUTO_4532 - ROVER
      ?AUTO_4530 - STORE
      ?AUTO_4531 - WAYPOINT
      ?AUTO_4529 - WAYPOINT
      ?AUTO_4528 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4533 ?AUTO_4526 ) ( VISIBLE ?AUTO_4527 ?AUTO_4526 ) ( AVAILABLE ?AUTO_4532 ) ( CHANNEL_FREE ?AUTO_4533 ) ( not ( = ?AUTO_4526 ?AUTO_4527 ) ) ( CAN_TRAVERSE ?AUTO_4532 ?AUTO_4526 ?AUTO_4527 ) ( VISIBLE ?AUTO_4526 ?AUTO_4527 ) ( AT_ROCK_SAMPLE ?AUTO_4526 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4532 ) ( STORE_OF ?AUTO_4530 ?AUTO_4532 ) ( CAN_TRAVERSE ?AUTO_4532 ?AUTO_4531 ?AUTO_4526 ) ( VISIBLE ?AUTO_4531 ?AUTO_4526 ) ( not ( = ?AUTO_4526 ?AUTO_4531 ) ) ( not ( = ?AUTO_4527 ?AUTO_4531 ) ) ( CAN_TRAVERSE ?AUTO_4532 ?AUTO_4529 ?AUTO_4531 ) ( VISIBLE ?AUTO_4529 ?AUTO_4531 ) ( not ( = ?AUTO_4526 ?AUTO_4529 ) ) ( not ( = ?AUTO_4527 ?AUTO_4529 ) ) ( not ( = ?AUTO_4531 ?AUTO_4529 ) ) ( AT_SOIL_SAMPLE ?AUTO_4529 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4532 ) ( EMPTY ?AUTO_4530 ) ( CAN_TRAVERSE ?AUTO_4532 ?AUTO_4528 ?AUTO_4529 ) ( VISIBLE ?AUTO_4528 ?AUTO_4529 ) ( not ( = ?AUTO_4526 ?AUTO_4528 ) ) ( not ( = ?AUTO_4527 ?AUTO_4528 ) ) ( not ( = ?AUTO_4531 ?AUTO_4528 ) ) ( not ( = ?AUTO_4529 ?AUTO_4528 ) ) ( CAN_TRAVERSE ?AUTO_4532 ?AUTO_4527 ?AUTO_4528 ) ( AT ?AUTO_4532 ?AUTO_4527 ) ( VISIBLE ?AUTO_4527 ?AUTO_4528 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4532 ?AUTO_4527 ?AUTO_4528 )
      ( GET_ROCK_DATA ?AUTO_4526 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4526 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4562 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4563 - LANDER
      ?AUTO_4567 - WAYPOINT
      ?AUTO_4565 - ROVER
      ?AUTO_4566 - STORE
      ?AUTO_4564 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4563 ?AUTO_4567 ) ( VISIBLE ?AUTO_4562 ?AUTO_4567 ) ( AVAILABLE ?AUTO_4565 ) ( CHANNEL_FREE ?AUTO_4563 ) ( not ( = ?AUTO_4562 ?AUTO_4567 ) ) ( AT_SOIL_SAMPLE ?AUTO_4562 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4565 ) ( STORE_OF ?AUTO_4566 ?AUTO_4565 ) ( CAN_TRAVERSE ?AUTO_4565 ?AUTO_4567 ?AUTO_4562 ) ( VISIBLE ?AUTO_4567 ?AUTO_4562 ) ( CAN_TRAVERSE ?AUTO_4565 ?AUTO_4564 ?AUTO_4567 ) ( AT ?AUTO_4565 ?AUTO_4564 ) ( VISIBLE ?AUTO_4564 ?AUTO_4567 ) ( not ( = ?AUTO_4562 ?AUTO_4564 ) ) ( not ( = ?AUTO_4567 ?AUTO_4564 ) ) ( FULL ?AUTO_4566 ) )
    :subtasks
    ( ( !DROP ?AUTO_4565 ?AUTO_4566 )
      ( GET_SOIL_DATA ?AUTO_4562 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4562 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4569 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4571 - LANDER
      ?AUTO_4572 - WAYPOINT
      ?AUTO_4573 - ROVER
      ?AUTO_4574 - STORE
      ?AUTO_4570 - WAYPOINT
      ?AUTO_4575 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4571 ?AUTO_4572 ) ( VISIBLE ?AUTO_4569 ?AUTO_4572 ) ( AVAILABLE ?AUTO_4573 ) ( CHANNEL_FREE ?AUTO_4571 ) ( not ( = ?AUTO_4569 ?AUTO_4572 ) ) ( AT_SOIL_SAMPLE ?AUTO_4569 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4573 ) ( STORE_OF ?AUTO_4574 ?AUTO_4573 ) ( CAN_TRAVERSE ?AUTO_4573 ?AUTO_4572 ?AUTO_4569 ) ( VISIBLE ?AUTO_4572 ?AUTO_4569 ) ( CAN_TRAVERSE ?AUTO_4573 ?AUTO_4570 ?AUTO_4572 ) ( VISIBLE ?AUTO_4570 ?AUTO_4572 ) ( not ( = ?AUTO_4569 ?AUTO_4570 ) ) ( not ( = ?AUTO_4572 ?AUTO_4570 ) ) ( FULL ?AUTO_4574 ) ( CAN_TRAVERSE ?AUTO_4573 ?AUTO_4575 ?AUTO_4570 ) ( AT ?AUTO_4573 ?AUTO_4575 ) ( VISIBLE ?AUTO_4575 ?AUTO_4570 ) ( not ( = ?AUTO_4569 ?AUTO_4575 ) ) ( not ( = ?AUTO_4572 ?AUTO_4575 ) ) ( not ( = ?AUTO_4570 ?AUTO_4575 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4573 ?AUTO_4575 ?AUTO_4570 )
      ( GET_SOIL_DATA ?AUTO_4569 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4569 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4576 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4579 - LANDER
      ?AUTO_4580 - WAYPOINT
      ?AUTO_4581 - ROVER
      ?AUTO_4578 - STORE
      ?AUTO_4577 - WAYPOINT
      ?AUTO_4582 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4579 ?AUTO_4580 ) ( VISIBLE ?AUTO_4576 ?AUTO_4580 ) ( AVAILABLE ?AUTO_4581 ) ( CHANNEL_FREE ?AUTO_4579 ) ( not ( = ?AUTO_4576 ?AUTO_4580 ) ) ( AT_SOIL_SAMPLE ?AUTO_4576 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4581 ) ( STORE_OF ?AUTO_4578 ?AUTO_4581 ) ( CAN_TRAVERSE ?AUTO_4581 ?AUTO_4580 ?AUTO_4576 ) ( VISIBLE ?AUTO_4580 ?AUTO_4576 ) ( CAN_TRAVERSE ?AUTO_4581 ?AUTO_4577 ?AUTO_4580 ) ( VISIBLE ?AUTO_4577 ?AUTO_4580 ) ( not ( = ?AUTO_4576 ?AUTO_4577 ) ) ( not ( = ?AUTO_4580 ?AUTO_4577 ) ) ( CAN_TRAVERSE ?AUTO_4581 ?AUTO_4582 ?AUTO_4577 ) ( AT ?AUTO_4581 ?AUTO_4582 ) ( VISIBLE ?AUTO_4582 ?AUTO_4577 ) ( not ( = ?AUTO_4576 ?AUTO_4582 ) ) ( not ( = ?AUTO_4580 ?AUTO_4582 ) ) ( not ( = ?AUTO_4577 ?AUTO_4582 ) ) ( AT_SOIL_SAMPLE ?AUTO_4582 ) ( EMPTY ?AUTO_4578 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4581 ?AUTO_4578 ?AUTO_4582 )
      ( GET_SOIL_DATA ?AUTO_4576 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4576 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4640 - OBJECTIVE
      ?AUTO_4641 - MODE
    )
    :vars
    (
      ?AUTO_4643 - LANDER
      ?AUTO_4642 - WAYPOINT
      ?AUTO_4647 - WAYPOINT
      ?AUTO_4644 - ROVER
      ?AUTO_4645 - CAMERA
      ?AUTO_4646 - WAYPOINT
      ?AUTO_4648 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4643 ?AUTO_4642 ) ( VISIBLE ?AUTO_4647 ?AUTO_4642 ) ( AVAILABLE ?AUTO_4644 ) ( CHANNEL_FREE ?AUTO_4643 ) ( not ( = ?AUTO_4647 ?AUTO_4642 ) ) ( CAN_TRAVERSE ?AUTO_4644 ?AUTO_4642 ?AUTO_4647 ) ( VISIBLE ?AUTO_4642 ?AUTO_4647 ) ( CALIBRATED ?AUTO_4645 ?AUTO_4644 ) ( ON_BOARD ?AUTO_4645 ?AUTO_4644 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4644 ) ( SUPPORTS ?AUTO_4645 ?AUTO_4641 ) ( VISIBLE_FROM ?AUTO_4640 ?AUTO_4642 ) ( CAN_TRAVERSE ?AUTO_4644 ?AUTO_4646 ?AUTO_4642 ) ( VISIBLE ?AUTO_4646 ?AUTO_4642 ) ( not ( = ?AUTO_4642 ?AUTO_4646 ) ) ( not ( = ?AUTO_4647 ?AUTO_4646 ) ) ( CAN_TRAVERSE ?AUTO_4644 ?AUTO_4648 ?AUTO_4646 ) ( AT ?AUTO_4644 ?AUTO_4648 ) ( VISIBLE ?AUTO_4648 ?AUTO_4646 ) ( not ( = ?AUTO_4642 ?AUTO_4648 ) ) ( not ( = ?AUTO_4647 ?AUTO_4648 ) ) ( not ( = ?AUTO_4646 ?AUTO_4648 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4644 ?AUTO_4648 ?AUTO_4646 )
      ( GET_IMAGE_DATA ?AUTO_4640 ?AUTO_4641 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4640 ?AUTO_4641 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4649 - OBJECTIVE
      ?AUTO_4650 - MODE
    )
    :vars
    (
      ?AUTO_4656 - LANDER
      ?AUTO_4653 - WAYPOINT
      ?AUTO_4652 - WAYPOINT
      ?AUTO_4655 - ROVER
      ?AUTO_4654 - CAMERA
      ?AUTO_4651 - WAYPOINT
      ?AUTO_4657 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4656 ?AUTO_4653 ) ( VISIBLE ?AUTO_4652 ?AUTO_4653 ) ( AVAILABLE ?AUTO_4655 ) ( CHANNEL_FREE ?AUTO_4656 ) ( not ( = ?AUTO_4652 ?AUTO_4653 ) ) ( CAN_TRAVERSE ?AUTO_4655 ?AUTO_4653 ?AUTO_4652 ) ( VISIBLE ?AUTO_4653 ?AUTO_4652 ) ( CALIBRATED ?AUTO_4654 ?AUTO_4655 ) ( ON_BOARD ?AUTO_4654 ?AUTO_4655 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4655 ) ( SUPPORTS ?AUTO_4654 ?AUTO_4650 ) ( VISIBLE_FROM ?AUTO_4649 ?AUTO_4653 ) ( CAN_TRAVERSE ?AUTO_4655 ?AUTO_4651 ?AUTO_4653 ) ( VISIBLE ?AUTO_4651 ?AUTO_4653 ) ( not ( = ?AUTO_4653 ?AUTO_4651 ) ) ( not ( = ?AUTO_4652 ?AUTO_4651 ) ) ( CAN_TRAVERSE ?AUTO_4655 ?AUTO_4657 ?AUTO_4651 ) ( VISIBLE ?AUTO_4657 ?AUTO_4651 ) ( not ( = ?AUTO_4653 ?AUTO_4657 ) ) ( not ( = ?AUTO_4652 ?AUTO_4657 ) ) ( not ( = ?AUTO_4651 ?AUTO_4657 ) ) ( CAN_TRAVERSE ?AUTO_4655 ?AUTO_4652 ?AUTO_4657 ) ( AT ?AUTO_4655 ?AUTO_4652 ) ( VISIBLE ?AUTO_4652 ?AUTO_4657 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4655 ?AUTO_4652 ?AUTO_4657 )
      ( GET_IMAGE_DATA ?AUTO_4649 ?AUTO_4650 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4649 ?AUTO_4650 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4658 - OBJECTIVE
      ?AUTO_4659 - MODE
    )
    :vars
    (
      ?AUTO_4662 - LANDER
      ?AUTO_4666 - WAYPOINT
      ?AUTO_4661 - WAYPOINT
      ?AUTO_4665 - ROVER
      ?AUTO_4664 - CAMERA
      ?AUTO_4663 - WAYPOINT
      ?AUTO_4660 - WAYPOINT
      ?AUTO_4667 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4662 ?AUTO_4666 ) ( VISIBLE ?AUTO_4661 ?AUTO_4666 ) ( AVAILABLE ?AUTO_4665 ) ( CHANNEL_FREE ?AUTO_4662 ) ( not ( = ?AUTO_4661 ?AUTO_4666 ) ) ( CAN_TRAVERSE ?AUTO_4665 ?AUTO_4666 ?AUTO_4661 ) ( VISIBLE ?AUTO_4666 ?AUTO_4661 ) ( ON_BOARD ?AUTO_4664 ?AUTO_4665 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4665 ) ( SUPPORTS ?AUTO_4664 ?AUTO_4659 ) ( VISIBLE_FROM ?AUTO_4658 ?AUTO_4666 ) ( CAN_TRAVERSE ?AUTO_4665 ?AUTO_4663 ?AUTO_4666 ) ( VISIBLE ?AUTO_4663 ?AUTO_4666 ) ( not ( = ?AUTO_4666 ?AUTO_4663 ) ) ( not ( = ?AUTO_4661 ?AUTO_4663 ) ) ( CAN_TRAVERSE ?AUTO_4665 ?AUTO_4660 ?AUTO_4663 ) ( VISIBLE ?AUTO_4660 ?AUTO_4663 ) ( not ( = ?AUTO_4666 ?AUTO_4660 ) ) ( not ( = ?AUTO_4661 ?AUTO_4660 ) ) ( not ( = ?AUTO_4663 ?AUTO_4660 ) ) ( CAN_TRAVERSE ?AUTO_4665 ?AUTO_4661 ?AUTO_4660 ) ( AT ?AUTO_4665 ?AUTO_4661 ) ( VISIBLE ?AUTO_4661 ?AUTO_4660 ) ( CALIBRATION_TARGET ?AUTO_4664 ?AUTO_4667 ) ( VISIBLE_FROM ?AUTO_4667 ?AUTO_4661 ) ( not ( = ?AUTO_4658 ?AUTO_4667 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4665 ?AUTO_4664 ?AUTO_4667 ?AUTO_4661 )
      ( GET_IMAGE_DATA ?AUTO_4658 ?AUTO_4659 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4658 ?AUTO_4659 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4727 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4731 - LANDER
      ?AUTO_4728 - WAYPOINT
      ?AUTO_4730 - ROVER
      ?AUTO_4729 - STORE
      ?AUTO_4732 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4731 ?AUTO_4728 ) ( VISIBLE ?AUTO_4727 ?AUTO_4728 ) ( AVAILABLE ?AUTO_4730 ) ( CHANNEL_FREE ?AUTO_4731 ) ( not ( = ?AUTO_4727 ?AUTO_4728 ) ) ( AT_SOIL_SAMPLE ?AUTO_4727 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4730 ) ( STORE_OF ?AUTO_4729 ?AUTO_4730 ) ( CAN_TRAVERSE ?AUTO_4730 ?AUTO_4732 ?AUTO_4727 ) ( AT ?AUTO_4730 ?AUTO_4732 ) ( VISIBLE ?AUTO_4732 ?AUTO_4727 ) ( not ( = ?AUTO_4727 ?AUTO_4732 ) ) ( not ( = ?AUTO_4728 ?AUTO_4732 ) ) ( AT_SOIL_SAMPLE ?AUTO_4732 ) ( EMPTY ?AUTO_4729 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4730 ?AUTO_4729 ?AUTO_4732 )
      ( GET_SOIL_DATA ?AUTO_4727 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4727 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4765 - OBJECTIVE
      ?AUTO_4766 - MODE
    )
    :vars
    (
      ?AUTO_4770 - LANDER
      ?AUTO_4769 - WAYPOINT
      ?AUTO_4767 - WAYPOINT
      ?AUTO_4771 - ROVER
      ?AUTO_4768 - CAMERA
      ?AUTO_4772 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4770 ?AUTO_4769 ) ( VISIBLE ?AUTO_4767 ?AUTO_4769 ) ( AVAILABLE ?AUTO_4771 ) ( CHANNEL_FREE ?AUTO_4770 ) ( not ( = ?AUTO_4767 ?AUTO_4769 ) ) ( CAN_TRAVERSE ?AUTO_4771 ?AUTO_4769 ?AUTO_4767 ) ( VISIBLE ?AUTO_4769 ?AUTO_4767 ) ( CALIBRATED ?AUTO_4768 ?AUTO_4771 ) ( ON_BOARD ?AUTO_4768 ?AUTO_4771 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4771 ) ( SUPPORTS ?AUTO_4768 ?AUTO_4766 ) ( VISIBLE_FROM ?AUTO_4765 ?AUTO_4769 ) ( CAN_TRAVERSE ?AUTO_4771 ?AUTO_4767 ?AUTO_4769 ) ( CAN_TRAVERSE ?AUTO_4771 ?AUTO_4772 ?AUTO_4767 ) ( AT ?AUTO_4771 ?AUTO_4772 ) ( VISIBLE ?AUTO_4772 ?AUTO_4767 ) ( not ( = ?AUTO_4769 ?AUTO_4772 ) ) ( not ( = ?AUTO_4767 ?AUTO_4772 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4771 ?AUTO_4772 ?AUTO_4767 )
      ( GET_IMAGE_DATA ?AUTO_4765 ?AUTO_4766 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4765 ?AUTO_4766 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4773 - OBJECTIVE
      ?AUTO_4774 - MODE
    )
    :vars
    (
      ?AUTO_4778 - LANDER
      ?AUTO_4777 - WAYPOINT
      ?AUTO_4779 - WAYPOINT
      ?AUTO_4776 - ROVER
      ?AUTO_4775 - CAMERA
      ?AUTO_4780 - WAYPOINT
      ?AUTO_4781 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4778 ?AUTO_4777 ) ( VISIBLE ?AUTO_4779 ?AUTO_4777 ) ( AVAILABLE ?AUTO_4776 ) ( CHANNEL_FREE ?AUTO_4778 ) ( not ( = ?AUTO_4779 ?AUTO_4777 ) ) ( CAN_TRAVERSE ?AUTO_4776 ?AUTO_4777 ?AUTO_4779 ) ( VISIBLE ?AUTO_4777 ?AUTO_4779 ) ( CALIBRATED ?AUTO_4775 ?AUTO_4776 ) ( ON_BOARD ?AUTO_4775 ?AUTO_4776 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4776 ) ( SUPPORTS ?AUTO_4775 ?AUTO_4774 ) ( VISIBLE_FROM ?AUTO_4773 ?AUTO_4777 ) ( CAN_TRAVERSE ?AUTO_4776 ?AUTO_4779 ?AUTO_4777 ) ( CAN_TRAVERSE ?AUTO_4776 ?AUTO_4780 ?AUTO_4779 ) ( VISIBLE ?AUTO_4780 ?AUTO_4779 ) ( not ( = ?AUTO_4777 ?AUTO_4780 ) ) ( not ( = ?AUTO_4779 ?AUTO_4780 ) ) ( CAN_TRAVERSE ?AUTO_4776 ?AUTO_4781 ?AUTO_4780 ) ( AT ?AUTO_4776 ?AUTO_4781 ) ( VISIBLE ?AUTO_4781 ?AUTO_4780 ) ( not ( = ?AUTO_4777 ?AUTO_4781 ) ) ( not ( = ?AUTO_4779 ?AUTO_4781 ) ) ( not ( = ?AUTO_4780 ?AUTO_4781 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4776 ?AUTO_4781 ?AUTO_4780 )
      ( GET_IMAGE_DATA ?AUTO_4773 ?AUTO_4774 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4773 ?AUTO_4774 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4782 - OBJECTIVE
      ?AUTO_4783 - MODE
    )
    :vars
    (
      ?AUTO_4788 - LANDER
      ?AUTO_4787 - WAYPOINT
      ?AUTO_4790 - WAYPOINT
      ?AUTO_4786 - ROVER
      ?AUTO_4785 - CAMERA
      ?AUTO_4784 - WAYPOINT
      ?AUTO_4789 - WAYPOINT
      ?AUTO_4791 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4788 ?AUTO_4787 ) ( VISIBLE ?AUTO_4790 ?AUTO_4787 ) ( AVAILABLE ?AUTO_4786 ) ( CHANNEL_FREE ?AUTO_4788 ) ( not ( = ?AUTO_4790 ?AUTO_4787 ) ) ( CAN_TRAVERSE ?AUTO_4786 ?AUTO_4787 ?AUTO_4790 ) ( VISIBLE ?AUTO_4787 ?AUTO_4790 ) ( ON_BOARD ?AUTO_4785 ?AUTO_4786 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4786 ) ( SUPPORTS ?AUTO_4785 ?AUTO_4783 ) ( VISIBLE_FROM ?AUTO_4782 ?AUTO_4787 ) ( CAN_TRAVERSE ?AUTO_4786 ?AUTO_4790 ?AUTO_4787 ) ( CAN_TRAVERSE ?AUTO_4786 ?AUTO_4784 ?AUTO_4790 ) ( VISIBLE ?AUTO_4784 ?AUTO_4790 ) ( not ( = ?AUTO_4787 ?AUTO_4784 ) ) ( not ( = ?AUTO_4790 ?AUTO_4784 ) ) ( CAN_TRAVERSE ?AUTO_4786 ?AUTO_4789 ?AUTO_4784 ) ( AT ?AUTO_4786 ?AUTO_4789 ) ( VISIBLE ?AUTO_4789 ?AUTO_4784 ) ( not ( = ?AUTO_4787 ?AUTO_4789 ) ) ( not ( = ?AUTO_4790 ?AUTO_4789 ) ) ( not ( = ?AUTO_4784 ?AUTO_4789 ) ) ( CALIBRATION_TARGET ?AUTO_4785 ?AUTO_4791 ) ( VISIBLE_FROM ?AUTO_4791 ?AUTO_4789 ) ( not ( = ?AUTO_4782 ?AUTO_4791 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4786 ?AUTO_4785 ?AUTO_4791 ?AUTO_4789 )
      ( GET_IMAGE_DATA ?AUTO_4782 ?AUTO_4783 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4782 ?AUTO_4783 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4792 - OBJECTIVE
      ?AUTO_4793 - MODE
    )
    :vars
    (
      ?AUTO_4795 - LANDER
      ?AUTO_4801 - WAYPOINT
      ?AUTO_4797 - WAYPOINT
      ?AUTO_4796 - ROVER
      ?AUTO_4800 - CAMERA
      ?AUTO_4794 - WAYPOINT
      ?AUTO_4798 - WAYPOINT
      ?AUTO_4799 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4795 ?AUTO_4801 ) ( VISIBLE ?AUTO_4797 ?AUTO_4801 ) ( AVAILABLE ?AUTO_4796 ) ( CHANNEL_FREE ?AUTO_4795 ) ( not ( = ?AUTO_4797 ?AUTO_4801 ) ) ( CAN_TRAVERSE ?AUTO_4796 ?AUTO_4801 ?AUTO_4797 ) ( VISIBLE ?AUTO_4801 ?AUTO_4797 ) ( ON_BOARD ?AUTO_4800 ?AUTO_4796 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4796 ) ( SUPPORTS ?AUTO_4800 ?AUTO_4793 ) ( VISIBLE_FROM ?AUTO_4792 ?AUTO_4801 ) ( CAN_TRAVERSE ?AUTO_4796 ?AUTO_4797 ?AUTO_4801 ) ( CAN_TRAVERSE ?AUTO_4796 ?AUTO_4794 ?AUTO_4797 ) ( VISIBLE ?AUTO_4794 ?AUTO_4797 ) ( not ( = ?AUTO_4801 ?AUTO_4794 ) ) ( not ( = ?AUTO_4797 ?AUTO_4794 ) ) ( CAN_TRAVERSE ?AUTO_4796 ?AUTO_4798 ?AUTO_4794 ) ( VISIBLE ?AUTO_4798 ?AUTO_4794 ) ( not ( = ?AUTO_4801 ?AUTO_4798 ) ) ( not ( = ?AUTO_4797 ?AUTO_4798 ) ) ( not ( = ?AUTO_4794 ?AUTO_4798 ) ) ( CALIBRATION_TARGET ?AUTO_4800 ?AUTO_4799 ) ( VISIBLE_FROM ?AUTO_4799 ?AUTO_4798 ) ( not ( = ?AUTO_4792 ?AUTO_4799 ) ) ( CAN_TRAVERSE ?AUTO_4796 ?AUTO_4797 ?AUTO_4798 ) ( AT ?AUTO_4796 ?AUTO_4797 ) ( VISIBLE ?AUTO_4797 ?AUTO_4798 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4796 ?AUTO_4797 ?AUTO_4798 )
      ( GET_IMAGE_DATA ?AUTO_4792 ?AUTO_4793 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4792 ?AUTO_4793 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4810 - OBJECTIVE
      ?AUTO_4811 - MODE
    )
    :vars
    (
      ?AUTO_4814 - LANDER
      ?AUTO_4819 - WAYPOINT
      ?AUTO_4818 - WAYPOINT
      ?AUTO_4817 - ROVER
      ?AUTO_4816 - CAMERA
      ?AUTO_4813 - WAYPOINT
      ?AUTO_4812 - WAYPOINT
      ?AUTO_4815 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4814 ?AUTO_4819 ) ( VISIBLE ?AUTO_4818 ?AUTO_4819 ) ( AVAILABLE ?AUTO_4817 ) ( CHANNEL_FREE ?AUTO_4814 ) ( not ( = ?AUTO_4818 ?AUTO_4819 ) ) ( CAN_TRAVERSE ?AUTO_4817 ?AUTO_4819 ?AUTO_4818 ) ( VISIBLE ?AUTO_4819 ?AUTO_4818 ) ( ON_BOARD ?AUTO_4816 ?AUTO_4817 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4817 ) ( SUPPORTS ?AUTO_4816 ?AUTO_4811 ) ( VISIBLE_FROM ?AUTO_4810 ?AUTO_4819 ) ( CAN_TRAVERSE ?AUTO_4817 ?AUTO_4818 ?AUTO_4819 ) ( CAN_TRAVERSE ?AUTO_4817 ?AUTO_4813 ?AUTO_4818 ) ( VISIBLE ?AUTO_4813 ?AUTO_4818 ) ( not ( = ?AUTO_4819 ?AUTO_4813 ) ) ( not ( = ?AUTO_4818 ?AUTO_4813 ) ) ( CAN_TRAVERSE ?AUTO_4817 ?AUTO_4812 ?AUTO_4813 ) ( VISIBLE ?AUTO_4812 ?AUTO_4813 ) ( not ( = ?AUTO_4819 ?AUTO_4812 ) ) ( not ( = ?AUTO_4818 ?AUTO_4812 ) ) ( not ( = ?AUTO_4813 ?AUTO_4812 ) ) ( CALIBRATION_TARGET ?AUTO_4816 ?AUTO_4815 ) ( VISIBLE_FROM ?AUTO_4815 ?AUTO_4812 ) ( not ( = ?AUTO_4810 ?AUTO_4815 ) ) ( CAN_TRAVERSE ?AUTO_4817 ?AUTO_4818 ?AUTO_4812 ) ( VISIBLE ?AUTO_4818 ?AUTO_4812 ) ( AT ?AUTO_4817 ?AUTO_4813 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4817 ?AUTO_4813 ?AUTO_4818 )
      ( GET_IMAGE_DATA ?AUTO_4810 ?AUTO_4811 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4810 ?AUTO_4811 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4830 - OBJECTIVE
      ?AUTO_4831 - MODE
    )
    :vars
    (
      ?AUTO_4832 - LANDER
      ?AUTO_4837 - WAYPOINT
      ?AUTO_4833 - WAYPOINT
      ?AUTO_4839 - ROVER
      ?AUTO_4835 - CAMERA
      ?AUTO_4838 - WAYPOINT
      ?AUTO_4836 - WAYPOINT
      ?AUTO_4834 - OBJECTIVE
      ?AUTO_4840 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4832 ?AUTO_4837 ) ( VISIBLE ?AUTO_4833 ?AUTO_4837 ) ( AVAILABLE ?AUTO_4839 ) ( CHANNEL_FREE ?AUTO_4832 ) ( not ( = ?AUTO_4833 ?AUTO_4837 ) ) ( CAN_TRAVERSE ?AUTO_4839 ?AUTO_4837 ?AUTO_4833 ) ( VISIBLE ?AUTO_4837 ?AUTO_4833 ) ( ON_BOARD ?AUTO_4835 ?AUTO_4839 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4839 ) ( SUPPORTS ?AUTO_4835 ?AUTO_4831 ) ( VISIBLE_FROM ?AUTO_4830 ?AUTO_4837 ) ( CAN_TRAVERSE ?AUTO_4839 ?AUTO_4833 ?AUTO_4837 ) ( CAN_TRAVERSE ?AUTO_4839 ?AUTO_4838 ?AUTO_4833 ) ( VISIBLE ?AUTO_4838 ?AUTO_4833 ) ( not ( = ?AUTO_4837 ?AUTO_4838 ) ) ( not ( = ?AUTO_4833 ?AUTO_4838 ) ) ( CAN_TRAVERSE ?AUTO_4839 ?AUTO_4836 ?AUTO_4838 ) ( VISIBLE ?AUTO_4836 ?AUTO_4838 ) ( not ( = ?AUTO_4837 ?AUTO_4836 ) ) ( not ( = ?AUTO_4833 ?AUTO_4836 ) ) ( not ( = ?AUTO_4838 ?AUTO_4836 ) ) ( CALIBRATION_TARGET ?AUTO_4835 ?AUTO_4834 ) ( VISIBLE_FROM ?AUTO_4834 ?AUTO_4836 ) ( not ( = ?AUTO_4830 ?AUTO_4834 ) ) ( CAN_TRAVERSE ?AUTO_4839 ?AUTO_4833 ?AUTO_4836 ) ( VISIBLE ?AUTO_4833 ?AUTO_4836 ) ( CAN_TRAVERSE ?AUTO_4839 ?AUTO_4840 ?AUTO_4838 ) ( AT ?AUTO_4839 ?AUTO_4840 ) ( VISIBLE ?AUTO_4840 ?AUTO_4838 ) ( not ( = ?AUTO_4837 ?AUTO_4840 ) ) ( not ( = ?AUTO_4833 ?AUTO_4840 ) ) ( not ( = ?AUTO_4838 ?AUTO_4840 ) ) ( not ( = ?AUTO_4836 ?AUTO_4840 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4839 ?AUTO_4840 ?AUTO_4838 )
      ( GET_IMAGE_DATA ?AUTO_4830 ?AUTO_4831 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4830 ?AUTO_4831 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4877 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4883 - LANDER
      ?AUTO_4880 - WAYPOINT
      ?AUTO_4878 - WAYPOINT
      ?AUTO_4879 - ROVER
      ?AUTO_4881 - STORE
      ?AUTO_4882 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4883 ?AUTO_4880 ) ( VISIBLE ?AUTO_4878 ?AUTO_4880 ) ( AVAILABLE ?AUTO_4879 ) ( CHANNEL_FREE ?AUTO_4883 ) ( not ( = ?AUTO_4877 ?AUTO_4878 ) ) ( not ( = ?AUTO_4877 ?AUTO_4880 ) ) ( not ( = ?AUTO_4878 ?AUTO_4880 ) ) ( CAN_TRAVERSE ?AUTO_4879 ?AUTO_4877 ?AUTO_4878 ) ( VISIBLE ?AUTO_4877 ?AUTO_4878 ) ( AT_SOIL_SAMPLE ?AUTO_4877 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4879 ) ( STORE_OF ?AUTO_4881 ?AUTO_4879 ) ( EMPTY ?AUTO_4881 ) ( CAN_TRAVERSE ?AUTO_4879 ?AUTO_4882 ?AUTO_4877 ) ( VISIBLE ?AUTO_4882 ?AUTO_4877 ) ( not ( = ?AUTO_4877 ?AUTO_4882 ) ) ( not ( = ?AUTO_4880 ?AUTO_4882 ) ) ( not ( = ?AUTO_4878 ?AUTO_4882 ) ) ( CAN_TRAVERSE ?AUTO_4879 ?AUTO_4878 ?AUTO_4882 ) ( AT ?AUTO_4879 ?AUTO_4878 ) ( VISIBLE ?AUTO_4878 ?AUTO_4882 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4879 ?AUTO_4878 ?AUTO_4882 )
      ( GET_SOIL_DATA ?AUTO_4877 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4877 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4909 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4911 - LANDER
      ?AUTO_4910 - WAYPOINT
      ?AUTO_4913 - WAYPOINT
      ?AUTO_4914 - ROVER
      ?AUTO_4912 - STORE
      ?AUTO_4915 - WAYPOINT
      ?AUTO_4916 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4911 ?AUTO_4910 ) ( VISIBLE ?AUTO_4913 ?AUTO_4910 ) ( AVAILABLE ?AUTO_4914 ) ( CHANNEL_FREE ?AUTO_4911 ) ( not ( = ?AUTO_4909 ?AUTO_4913 ) ) ( not ( = ?AUTO_4909 ?AUTO_4910 ) ) ( not ( = ?AUTO_4913 ?AUTO_4910 ) ) ( CAN_TRAVERSE ?AUTO_4914 ?AUTO_4909 ?AUTO_4913 ) ( VISIBLE ?AUTO_4909 ?AUTO_4913 ) ( AT_SOIL_SAMPLE ?AUTO_4909 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4914 ) ( STORE_OF ?AUTO_4912 ?AUTO_4914 ) ( EMPTY ?AUTO_4912 ) ( CAN_TRAVERSE ?AUTO_4914 ?AUTO_4915 ?AUTO_4909 ) ( VISIBLE ?AUTO_4915 ?AUTO_4909 ) ( not ( = ?AUTO_4909 ?AUTO_4915 ) ) ( not ( = ?AUTO_4910 ?AUTO_4915 ) ) ( not ( = ?AUTO_4913 ?AUTO_4915 ) ) ( CAN_TRAVERSE ?AUTO_4914 ?AUTO_4913 ?AUTO_4915 ) ( VISIBLE ?AUTO_4913 ?AUTO_4915 ) ( CAN_TRAVERSE ?AUTO_4914 ?AUTO_4916 ?AUTO_4913 ) ( AT ?AUTO_4914 ?AUTO_4916 ) ( VISIBLE ?AUTO_4916 ?AUTO_4913 ) ( not ( = ?AUTO_4909 ?AUTO_4916 ) ) ( not ( = ?AUTO_4910 ?AUTO_4916 ) ) ( not ( = ?AUTO_4913 ?AUTO_4916 ) ) ( not ( = ?AUTO_4915 ?AUTO_4916 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4914 ?AUTO_4916 ?AUTO_4913 )
      ( GET_SOIL_DATA ?AUTO_4909 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4909 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4959 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4960 - LANDER
      ?AUTO_4964 - WAYPOINT
      ?AUTO_4961 - WAYPOINT
      ?AUTO_4965 - ROVER
      ?AUTO_4962 - STORE
      ?AUTO_4963 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4960 ?AUTO_4964 ) ( VISIBLE ?AUTO_4961 ?AUTO_4964 ) ( AVAILABLE ?AUTO_4965 ) ( CHANNEL_FREE ?AUTO_4960 ) ( not ( = ?AUTO_4959 ?AUTO_4961 ) ) ( not ( = ?AUTO_4959 ?AUTO_4964 ) ) ( not ( = ?AUTO_4961 ?AUTO_4964 ) ) ( CAN_TRAVERSE ?AUTO_4965 ?AUTO_4959 ?AUTO_4961 ) ( VISIBLE ?AUTO_4959 ?AUTO_4961 ) ( AT_ROCK_SAMPLE ?AUTO_4959 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4965 ) ( STORE_OF ?AUTO_4962 ?AUTO_4965 ) ( EMPTY ?AUTO_4962 ) ( CAN_TRAVERSE ?AUTO_4965 ?AUTO_4963 ?AUTO_4959 ) ( VISIBLE ?AUTO_4963 ?AUTO_4959 ) ( not ( = ?AUTO_4959 ?AUTO_4963 ) ) ( not ( = ?AUTO_4964 ?AUTO_4963 ) ) ( not ( = ?AUTO_4961 ?AUTO_4963 ) ) ( CAN_TRAVERSE ?AUTO_4965 ?AUTO_4961 ?AUTO_4963 ) ( AT ?AUTO_4965 ?AUTO_4961 ) ( VISIBLE ?AUTO_4961 ?AUTO_4963 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4965 ?AUTO_4961 ?AUTO_4963 )
      ( GET_ROCK_DATA ?AUTO_4959 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4959 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4991 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4992 - LANDER
      ?AUTO_4993 - WAYPOINT
      ?AUTO_4996 - WAYPOINT
      ?AUTO_4995 - ROVER
      ?AUTO_4994 - STORE
      ?AUTO_4997 - WAYPOINT
      ?AUTO_4998 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4992 ?AUTO_4993 ) ( VISIBLE ?AUTO_4996 ?AUTO_4993 ) ( AVAILABLE ?AUTO_4995 ) ( CHANNEL_FREE ?AUTO_4992 ) ( not ( = ?AUTO_4991 ?AUTO_4996 ) ) ( not ( = ?AUTO_4991 ?AUTO_4993 ) ) ( not ( = ?AUTO_4996 ?AUTO_4993 ) ) ( CAN_TRAVERSE ?AUTO_4995 ?AUTO_4991 ?AUTO_4996 ) ( VISIBLE ?AUTO_4991 ?AUTO_4996 ) ( AT_ROCK_SAMPLE ?AUTO_4991 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4995 ) ( STORE_OF ?AUTO_4994 ?AUTO_4995 ) ( EMPTY ?AUTO_4994 ) ( CAN_TRAVERSE ?AUTO_4995 ?AUTO_4997 ?AUTO_4991 ) ( VISIBLE ?AUTO_4997 ?AUTO_4991 ) ( not ( = ?AUTO_4991 ?AUTO_4997 ) ) ( not ( = ?AUTO_4993 ?AUTO_4997 ) ) ( not ( = ?AUTO_4996 ?AUTO_4997 ) ) ( CAN_TRAVERSE ?AUTO_4995 ?AUTO_4996 ?AUTO_4997 ) ( VISIBLE ?AUTO_4996 ?AUTO_4997 ) ( CAN_TRAVERSE ?AUTO_4995 ?AUTO_4998 ?AUTO_4996 ) ( AT ?AUTO_4995 ?AUTO_4998 ) ( VISIBLE ?AUTO_4998 ?AUTO_4996 ) ( not ( = ?AUTO_4991 ?AUTO_4998 ) ) ( not ( = ?AUTO_4993 ?AUTO_4998 ) ) ( not ( = ?AUTO_4996 ?AUTO_4998 ) ) ( not ( = ?AUTO_4997 ?AUTO_4998 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4995 ?AUTO_4998 ?AUTO_4996 )
      ( GET_ROCK_DATA ?AUTO_4991 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4991 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5059 - OBJECTIVE
      ?AUTO_5060 - MODE
    )
    :vars
    (
      ?AUTO_5063 - LANDER
      ?AUTO_5062 - WAYPOINT
      ?AUTO_5064 - WAYPOINT
      ?AUTO_5065 - ROVER
      ?AUTO_5061 - WAYPOINT
      ?AUTO_5066 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5063 ?AUTO_5062 ) ( VISIBLE ?AUTO_5064 ?AUTO_5062 ) ( AVAILABLE ?AUTO_5065 ) ( CHANNEL_FREE ?AUTO_5063 ) ( not ( = ?AUTO_5064 ?AUTO_5062 ) ) ( CAN_TRAVERSE ?AUTO_5065 ?AUTO_5061 ?AUTO_5064 ) ( VISIBLE ?AUTO_5061 ?AUTO_5064 ) ( not ( = ?AUTO_5062 ?AUTO_5061 ) ) ( not ( = ?AUTO_5064 ?AUTO_5061 ) ) ( CALIBRATED ?AUTO_5066 ?AUTO_5065 ) ( ON_BOARD ?AUTO_5066 ?AUTO_5065 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5065 ) ( SUPPORTS ?AUTO_5066 ?AUTO_5060 ) ( VISIBLE_FROM ?AUTO_5059 ?AUTO_5061 ) ( CAN_TRAVERSE ?AUTO_5065 ?AUTO_5064 ?AUTO_5061 ) ( AT ?AUTO_5065 ?AUTO_5064 ) ( VISIBLE ?AUTO_5064 ?AUTO_5061 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5065 ?AUTO_5064 ?AUTO_5061 )
      ( GET_IMAGE_DATA ?AUTO_5059 ?AUTO_5060 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5059 ?AUTO_5060 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5069 - OBJECTIVE
      ?AUTO_5070 - MODE
    )
    :vars
    (
      ?AUTO_5076 - LANDER
      ?AUTO_5073 - WAYPOINT
      ?AUTO_5071 - WAYPOINT
      ?AUTO_5072 - ROVER
      ?AUTO_5074 - WAYPOINT
      ?AUTO_5075 - CAMERA
      ?AUTO_5077 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5076 ?AUTO_5073 ) ( VISIBLE ?AUTO_5071 ?AUTO_5073 ) ( AVAILABLE ?AUTO_5072 ) ( CHANNEL_FREE ?AUTO_5076 ) ( not ( = ?AUTO_5071 ?AUTO_5073 ) ) ( CAN_TRAVERSE ?AUTO_5072 ?AUTO_5074 ?AUTO_5071 ) ( VISIBLE ?AUTO_5074 ?AUTO_5071 ) ( not ( = ?AUTO_5073 ?AUTO_5074 ) ) ( not ( = ?AUTO_5071 ?AUTO_5074 ) ) ( ON_BOARD ?AUTO_5075 ?AUTO_5072 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5072 ) ( SUPPORTS ?AUTO_5075 ?AUTO_5070 ) ( VISIBLE_FROM ?AUTO_5069 ?AUTO_5074 ) ( CAN_TRAVERSE ?AUTO_5072 ?AUTO_5071 ?AUTO_5074 ) ( AT ?AUTO_5072 ?AUTO_5071 ) ( VISIBLE ?AUTO_5071 ?AUTO_5074 ) ( CALIBRATION_TARGET ?AUTO_5075 ?AUTO_5077 ) ( VISIBLE_FROM ?AUTO_5077 ?AUTO_5071 ) ( not ( = ?AUTO_5069 ?AUTO_5077 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_5072 ?AUTO_5075 ?AUTO_5077 ?AUTO_5071 )
      ( GET_IMAGE_DATA ?AUTO_5069 ?AUTO_5070 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5069 ?AUTO_5070 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5078 - OBJECTIVE
      ?AUTO_5079 - MODE
    )
    :vars
    (
      ?AUTO_5080 - LANDER
      ?AUTO_5081 - WAYPOINT
      ?AUTO_5084 - WAYPOINT
      ?AUTO_5085 - ROVER
      ?AUTO_5082 - WAYPOINT
      ?AUTO_5083 - CAMERA
      ?AUTO_5086 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5080 ?AUTO_5081 ) ( VISIBLE ?AUTO_5084 ?AUTO_5081 ) ( AVAILABLE ?AUTO_5085 ) ( CHANNEL_FREE ?AUTO_5080 ) ( not ( = ?AUTO_5084 ?AUTO_5081 ) ) ( CAN_TRAVERSE ?AUTO_5085 ?AUTO_5082 ?AUTO_5084 ) ( VISIBLE ?AUTO_5082 ?AUTO_5084 ) ( not ( = ?AUTO_5081 ?AUTO_5082 ) ) ( not ( = ?AUTO_5084 ?AUTO_5082 ) ) ( ON_BOARD ?AUTO_5083 ?AUTO_5085 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5085 ) ( SUPPORTS ?AUTO_5083 ?AUTO_5079 ) ( VISIBLE_FROM ?AUTO_5078 ?AUTO_5082 ) ( CAN_TRAVERSE ?AUTO_5085 ?AUTO_5084 ?AUTO_5082 ) ( VISIBLE ?AUTO_5084 ?AUTO_5082 ) ( CALIBRATION_TARGET ?AUTO_5083 ?AUTO_5086 ) ( VISIBLE_FROM ?AUTO_5086 ?AUTO_5084 ) ( not ( = ?AUTO_5078 ?AUTO_5086 ) ) ( AT ?AUTO_5085 ?AUTO_5082 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5085 ?AUTO_5082 ?AUTO_5084 )
      ( GET_IMAGE_DATA ?AUTO_5078 ?AUTO_5079 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5078 ?AUTO_5079 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5089 - OBJECTIVE
      ?AUTO_5090 - MODE
    )
    :vars
    (
      ?AUTO_5092 - LANDER
      ?AUTO_5096 - WAYPOINT
      ?AUTO_5093 - WAYPOINT
      ?AUTO_5095 - ROVER
      ?AUTO_5091 - WAYPOINT
      ?AUTO_5094 - CAMERA
      ?AUTO_5097 - OBJECTIVE
      ?AUTO_5098 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5092 ?AUTO_5096 ) ( VISIBLE ?AUTO_5093 ?AUTO_5096 ) ( AVAILABLE ?AUTO_5095 ) ( CHANNEL_FREE ?AUTO_5092 ) ( not ( = ?AUTO_5093 ?AUTO_5096 ) ) ( CAN_TRAVERSE ?AUTO_5095 ?AUTO_5091 ?AUTO_5093 ) ( VISIBLE ?AUTO_5091 ?AUTO_5093 ) ( not ( = ?AUTO_5096 ?AUTO_5091 ) ) ( not ( = ?AUTO_5093 ?AUTO_5091 ) ) ( ON_BOARD ?AUTO_5094 ?AUTO_5095 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5095 ) ( SUPPORTS ?AUTO_5094 ?AUTO_5090 ) ( VISIBLE_FROM ?AUTO_5089 ?AUTO_5091 ) ( CAN_TRAVERSE ?AUTO_5095 ?AUTO_5093 ?AUTO_5091 ) ( VISIBLE ?AUTO_5093 ?AUTO_5091 ) ( CALIBRATION_TARGET ?AUTO_5094 ?AUTO_5097 ) ( VISIBLE_FROM ?AUTO_5097 ?AUTO_5093 ) ( not ( = ?AUTO_5089 ?AUTO_5097 ) ) ( CAN_TRAVERSE ?AUTO_5095 ?AUTO_5098 ?AUTO_5091 ) ( AT ?AUTO_5095 ?AUTO_5098 ) ( VISIBLE ?AUTO_5098 ?AUTO_5091 ) ( not ( = ?AUTO_5096 ?AUTO_5098 ) ) ( not ( = ?AUTO_5093 ?AUTO_5098 ) ) ( not ( = ?AUTO_5091 ?AUTO_5098 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5095 ?AUTO_5098 ?AUTO_5091 )
      ( GET_IMAGE_DATA ?AUTO_5089 ?AUTO_5090 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5089 ?AUTO_5090 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5103 - OBJECTIVE
      ?AUTO_5104 - MODE
    )
    :vars
    (
      ?AUTO_5105 - LANDER
      ?AUTO_5112 - WAYPOINT
      ?AUTO_5109 - WAYPOINT
      ?AUTO_5107 - ROVER
      ?AUTO_5110 - WAYPOINT
      ?AUTO_5106 - CAMERA
      ?AUTO_5108 - OBJECTIVE
      ?AUTO_5111 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5105 ?AUTO_5112 ) ( VISIBLE ?AUTO_5109 ?AUTO_5112 ) ( AVAILABLE ?AUTO_5107 ) ( CHANNEL_FREE ?AUTO_5105 ) ( not ( = ?AUTO_5109 ?AUTO_5112 ) ) ( CAN_TRAVERSE ?AUTO_5107 ?AUTO_5110 ?AUTO_5109 ) ( VISIBLE ?AUTO_5110 ?AUTO_5109 ) ( not ( = ?AUTO_5112 ?AUTO_5110 ) ) ( not ( = ?AUTO_5109 ?AUTO_5110 ) ) ( ON_BOARD ?AUTO_5106 ?AUTO_5107 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5107 ) ( SUPPORTS ?AUTO_5106 ?AUTO_5104 ) ( VISIBLE_FROM ?AUTO_5103 ?AUTO_5110 ) ( CAN_TRAVERSE ?AUTO_5107 ?AUTO_5109 ?AUTO_5110 ) ( VISIBLE ?AUTO_5109 ?AUTO_5110 ) ( CALIBRATION_TARGET ?AUTO_5106 ?AUTO_5108 ) ( VISIBLE_FROM ?AUTO_5108 ?AUTO_5109 ) ( not ( = ?AUTO_5103 ?AUTO_5108 ) ) ( CAN_TRAVERSE ?AUTO_5107 ?AUTO_5111 ?AUTO_5110 ) ( VISIBLE ?AUTO_5111 ?AUTO_5110 ) ( not ( = ?AUTO_5112 ?AUTO_5111 ) ) ( not ( = ?AUTO_5109 ?AUTO_5111 ) ) ( not ( = ?AUTO_5110 ?AUTO_5111 ) ) ( CAN_TRAVERSE ?AUTO_5107 ?AUTO_5112 ?AUTO_5111 ) ( AT ?AUTO_5107 ?AUTO_5112 ) ( VISIBLE ?AUTO_5112 ?AUTO_5111 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5107 ?AUTO_5112 ?AUTO_5111 )
      ( GET_IMAGE_DATA ?AUTO_5103 ?AUTO_5104 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5103 ?AUTO_5104 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5171 - OBJECTIVE
      ?AUTO_5172 - MODE
    )
    :vars
    (
      ?AUTO_5175 - LANDER
      ?AUTO_5177 - WAYPOINT
      ?AUTO_5174 - WAYPOINT
      ?AUTO_5173 - ROVER
      ?AUTO_5176 - WAYPOINT
      ?AUTO_5178 - CAMERA
      ?AUTO_5179 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5175 ?AUTO_5177 ) ( VISIBLE ?AUTO_5174 ?AUTO_5177 ) ( AVAILABLE ?AUTO_5173 ) ( CHANNEL_FREE ?AUTO_5175 ) ( not ( = ?AUTO_5174 ?AUTO_5177 ) ) ( CAN_TRAVERSE ?AUTO_5173 ?AUTO_5176 ?AUTO_5174 ) ( AT ?AUTO_5173 ?AUTO_5176 ) ( VISIBLE ?AUTO_5176 ?AUTO_5174 ) ( not ( = ?AUTO_5177 ?AUTO_5176 ) ) ( not ( = ?AUTO_5174 ?AUTO_5176 ) ) ( ON_BOARD ?AUTO_5178 ?AUTO_5173 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5173 ) ( SUPPORTS ?AUTO_5178 ?AUTO_5172 ) ( VISIBLE_FROM ?AUTO_5171 ?AUTO_5176 ) ( CALIBRATION_TARGET ?AUTO_5178 ?AUTO_5179 ) ( VISIBLE_FROM ?AUTO_5179 ?AUTO_5176 ) ( not ( = ?AUTO_5171 ?AUTO_5179 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_5173 ?AUTO_5178 ?AUTO_5179 ?AUTO_5176 )
      ( GET_IMAGE_DATA ?AUTO_5171 ?AUTO_5172 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5171 ?AUTO_5172 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5180 - OBJECTIVE
      ?AUTO_5181 - MODE
    )
    :vars
    (
      ?AUTO_5188 - LANDER
      ?AUTO_5182 - WAYPOINT
      ?AUTO_5185 - WAYPOINT
      ?AUTO_5187 - ROVER
      ?AUTO_5186 - WAYPOINT
      ?AUTO_5184 - CAMERA
      ?AUTO_5183 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5188 ?AUTO_5182 ) ( VISIBLE ?AUTO_5185 ?AUTO_5182 ) ( AVAILABLE ?AUTO_5187 ) ( CHANNEL_FREE ?AUTO_5188 ) ( not ( = ?AUTO_5185 ?AUTO_5182 ) ) ( CAN_TRAVERSE ?AUTO_5187 ?AUTO_5186 ?AUTO_5185 ) ( VISIBLE ?AUTO_5186 ?AUTO_5185 ) ( not ( = ?AUTO_5182 ?AUTO_5186 ) ) ( not ( = ?AUTO_5185 ?AUTO_5186 ) ) ( ON_BOARD ?AUTO_5184 ?AUTO_5187 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5187 ) ( SUPPORTS ?AUTO_5184 ?AUTO_5181 ) ( VISIBLE_FROM ?AUTO_5180 ?AUTO_5186 ) ( CALIBRATION_TARGET ?AUTO_5184 ?AUTO_5183 ) ( VISIBLE_FROM ?AUTO_5183 ?AUTO_5186 ) ( not ( = ?AUTO_5180 ?AUTO_5183 ) ) ( CAN_TRAVERSE ?AUTO_5187 ?AUTO_5185 ?AUTO_5186 ) ( AT ?AUTO_5187 ?AUTO_5185 ) ( VISIBLE ?AUTO_5185 ?AUTO_5186 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5187 ?AUTO_5185 ?AUTO_5186 )
      ( GET_IMAGE_DATA ?AUTO_5180 ?AUTO_5181 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5180 ?AUTO_5181 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5195 - OBJECTIVE
      ?AUTO_5196 - MODE
    )
    :vars
    (
      ?AUTO_5198 - LANDER
      ?AUTO_5200 - WAYPOINT
      ?AUTO_5202 - WAYPOINT
      ?AUTO_5203 - ROVER
      ?AUTO_5201 - WAYPOINT
      ?AUTO_5197 - CAMERA
      ?AUTO_5199 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5198 ?AUTO_5200 ) ( VISIBLE ?AUTO_5202 ?AUTO_5200 ) ( AVAILABLE ?AUTO_5203 ) ( CHANNEL_FREE ?AUTO_5198 ) ( not ( = ?AUTO_5202 ?AUTO_5200 ) ) ( CAN_TRAVERSE ?AUTO_5203 ?AUTO_5201 ?AUTO_5202 ) ( VISIBLE ?AUTO_5201 ?AUTO_5202 ) ( not ( = ?AUTO_5200 ?AUTO_5201 ) ) ( not ( = ?AUTO_5202 ?AUTO_5201 ) ) ( ON_BOARD ?AUTO_5197 ?AUTO_5203 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5203 ) ( SUPPORTS ?AUTO_5197 ?AUTO_5196 ) ( VISIBLE_FROM ?AUTO_5195 ?AUTO_5201 ) ( CALIBRATION_TARGET ?AUTO_5197 ?AUTO_5199 ) ( VISIBLE_FROM ?AUTO_5199 ?AUTO_5201 ) ( not ( = ?AUTO_5195 ?AUTO_5199 ) ) ( CAN_TRAVERSE ?AUTO_5203 ?AUTO_5202 ?AUTO_5201 ) ( VISIBLE ?AUTO_5202 ?AUTO_5201 ) ( CAN_TRAVERSE ?AUTO_5203 ?AUTO_5200 ?AUTO_5202 ) ( AT ?AUTO_5203 ?AUTO_5200 ) ( VISIBLE ?AUTO_5200 ?AUTO_5202 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5203 ?AUTO_5200 ?AUTO_5202 )
      ( GET_IMAGE_DATA ?AUTO_5195 ?AUTO_5196 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5195 ?AUTO_5196 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5251 - OBJECTIVE
      ?AUTO_5252 - MODE
    )
    :vars
    (
      ?AUTO_5257 - LANDER
      ?AUTO_5253 - WAYPOINT
      ?AUTO_5256 - WAYPOINT
      ?AUTO_5258 - ROVER
      ?AUTO_5254 - WAYPOINT
      ?AUTO_5255 - CAMERA
      ?AUTO_5259 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5257 ?AUTO_5253 ) ( VISIBLE ?AUTO_5256 ?AUTO_5253 ) ( AVAILABLE ?AUTO_5258 ) ( CHANNEL_FREE ?AUTO_5257 ) ( not ( = ?AUTO_5256 ?AUTO_5253 ) ) ( CAN_TRAVERSE ?AUTO_5258 ?AUTO_5254 ?AUTO_5256 ) ( VISIBLE ?AUTO_5254 ?AUTO_5256 ) ( not ( = ?AUTO_5253 ?AUTO_5254 ) ) ( not ( = ?AUTO_5256 ?AUTO_5254 ) ) ( ON_BOARD ?AUTO_5255 ?AUTO_5258 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5258 ) ( SUPPORTS ?AUTO_5255 ?AUTO_5252 ) ( VISIBLE_FROM ?AUTO_5251 ?AUTO_5254 ) ( CALIBRATION_TARGET ?AUTO_5255 ?AUTO_5251 ) ( CAN_TRAVERSE ?AUTO_5258 ?AUTO_5256 ?AUTO_5254 ) ( VISIBLE ?AUTO_5256 ?AUTO_5254 ) ( CAN_TRAVERSE ?AUTO_5258 ?AUTO_5253 ?AUTO_5256 ) ( VISIBLE ?AUTO_5253 ?AUTO_5256 ) ( CAN_TRAVERSE ?AUTO_5258 ?AUTO_5259 ?AUTO_5253 ) ( AT ?AUTO_5258 ?AUTO_5259 ) ( VISIBLE ?AUTO_5259 ?AUTO_5253 ) ( not ( = ?AUTO_5253 ?AUTO_5259 ) ) ( not ( = ?AUTO_5256 ?AUTO_5259 ) ) ( not ( = ?AUTO_5254 ?AUTO_5259 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5258 ?AUTO_5259 ?AUTO_5253 )
      ( GET_IMAGE_DATA ?AUTO_5251 ?AUTO_5252 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5251 ?AUTO_5252 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5313 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5317 - LANDER
      ?AUTO_5318 - WAYPOINT
      ?AUTO_5316 - ROVER
      ?AUTO_5314 - STORE
      ?AUTO_5315 - WAYPOINT
      ?AUTO_5319 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5317 ?AUTO_5318 ) ( VISIBLE ?AUTO_5313 ?AUTO_5318 ) ( AVAILABLE ?AUTO_5316 ) ( CHANNEL_FREE ?AUTO_5317 ) ( not ( = ?AUTO_5313 ?AUTO_5318 ) ) ( AT_ROCK_SAMPLE ?AUTO_5313 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5316 ) ( STORE_OF ?AUTO_5314 ?AUTO_5316 ) ( EMPTY ?AUTO_5314 ) ( CAN_TRAVERSE ?AUTO_5316 ?AUTO_5315 ?AUTO_5313 ) ( VISIBLE ?AUTO_5315 ?AUTO_5313 ) ( not ( = ?AUTO_5313 ?AUTO_5315 ) ) ( not ( = ?AUTO_5318 ?AUTO_5315 ) ) ( CAN_TRAVERSE ?AUTO_5316 ?AUTO_5318 ?AUTO_5315 ) ( VISIBLE ?AUTO_5318 ?AUTO_5315 ) ( CAN_TRAVERSE ?AUTO_5316 ?AUTO_5319 ?AUTO_5318 ) ( AT ?AUTO_5316 ?AUTO_5319 ) ( VISIBLE ?AUTO_5319 ?AUTO_5318 ) ( not ( = ?AUTO_5313 ?AUTO_5319 ) ) ( not ( = ?AUTO_5318 ?AUTO_5319 ) ) ( not ( = ?AUTO_5315 ?AUTO_5319 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5316 ?AUTO_5319 ?AUTO_5318 )
      ( GET_ROCK_DATA ?AUTO_5313 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5313 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5320 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5324 - LANDER
      ?AUTO_5323 - WAYPOINT
      ?AUTO_5325 - ROVER
      ?AUTO_5321 - STORE
      ?AUTO_5322 - WAYPOINT
      ?AUTO_5326 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5324 ?AUTO_5323 ) ( VISIBLE ?AUTO_5320 ?AUTO_5323 ) ( AVAILABLE ?AUTO_5325 ) ( CHANNEL_FREE ?AUTO_5324 ) ( not ( = ?AUTO_5320 ?AUTO_5323 ) ) ( AT_ROCK_SAMPLE ?AUTO_5320 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5325 ) ( STORE_OF ?AUTO_5321 ?AUTO_5325 ) ( CAN_TRAVERSE ?AUTO_5325 ?AUTO_5322 ?AUTO_5320 ) ( VISIBLE ?AUTO_5322 ?AUTO_5320 ) ( not ( = ?AUTO_5320 ?AUTO_5322 ) ) ( not ( = ?AUTO_5323 ?AUTO_5322 ) ) ( CAN_TRAVERSE ?AUTO_5325 ?AUTO_5323 ?AUTO_5322 ) ( VISIBLE ?AUTO_5323 ?AUTO_5322 ) ( CAN_TRAVERSE ?AUTO_5325 ?AUTO_5326 ?AUTO_5323 ) ( AT ?AUTO_5325 ?AUTO_5326 ) ( VISIBLE ?AUTO_5326 ?AUTO_5323 ) ( not ( = ?AUTO_5320 ?AUTO_5326 ) ) ( not ( = ?AUTO_5323 ?AUTO_5326 ) ) ( not ( = ?AUTO_5322 ?AUTO_5326 ) ) ( FULL ?AUTO_5321 ) )
    :subtasks
    ( ( !DROP ?AUTO_5325 ?AUTO_5321 )
      ( GET_ROCK_DATA ?AUTO_5320 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5320 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5378 - OBJECTIVE
      ?AUTO_5379 - MODE
    )
    :vars
    (
      ?AUTO_5383 - LANDER
      ?AUTO_5384 - WAYPOINT
      ?AUTO_5382 - WAYPOINT
      ?AUTO_5386 - ROVER
      ?AUTO_5380 - CAMERA
      ?AUTO_5385 - WAYPOINT
      ?AUTO_5381 - WAYPOINT
      ?AUTO_5387 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5383 ?AUTO_5384 ) ( VISIBLE ?AUTO_5382 ?AUTO_5384 ) ( AVAILABLE ?AUTO_5386 ) ( CHANNEL_FREE ?AUTO_5383 ) ( not ( = ?AUTO_5382 ?AUTO_5384 ) ) ( CAN_TRAVERSE ?AUTO_5386 ?AUTO_5384 ?AUTO_5382 ) ( VISIBLE ?AUTO_5384 ?AUTO_5382 ) ( ON_BOARD ?AUTO_5380 ?AUTO_5386 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5386 ) ( SUPPORTS ?AUTO_5380 ?AUTO_5379 ) ( VISIBLE_FROM ?AUTO_5378 ?AUTO_5384 ) ( CAN_TRAVERSE ?AUTO_5386 ?AUTO_5385 ?AUTO_5384 ) ( VISIBLE ?AUTO_5385 ?AUTO_5384 ) ( not ( = ?AUTO_5384 ?AUTO_5385 ) ) ( not ( = ?AUTO_5382 ?AUTO_5385 ) ) ( CAN_TRAVERSE ?AUTO_5386 ?AUTO_5381 ?AUTO_5385 ) ( AT ?AUTO_5386 ?AUTO_5381 ) ( VISIBLE ?AUTO_5381 ?AUTO_5385 ) ( not ( = ?AUTO_5384 ?AUTO_5381 ) ) ( not ( = ?AUTO_5382 ?AUTO_5381 ) ) ( not ( = ?AUTO_5385 ?AUTO_5381 ) ) ( CALIBRATION_TARGET ?AUTO_5380 ?AUTO_5387 ) ( VISIBLE_FROM ?AUTO_5387 ?AUTO_5381 ) ( not ( = ?AUTO_5378 ?AUTO_5387 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_5386 ?AUTO_5380 ?AUTO_5387 ?AUTO_5381 )
      ( GET_IMAGE_DATA ?AUTO_5378 ?AUTO_5379 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5378 ?AUTO_5379 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5388 - OBJECTIVE
      ?AUTO_5389 - MODE
    )
    :vars
    (
      ?AUTO_5397 - LANDER
      ?AUTO_5395 - WAYPOINT
      ?AUTO_5394 - WAYPOINT
      ?AUTO_5390 - ROVER
      ?AUTO_5396 - CAMERA
      ?AUTO_5391 - WAYPOINT
      ?AUTO_5392 - WAYPOINT
      ?AUTO_5393 - OBJECTIVE
      ?AUTO_5398 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5397 ?AUTO_5395 ) ( VISIBLE ?AUTO_5394 ?AUTO_5395 ) ( AVAILABLE ?AUTO_5390 ) ( CHANNEL_FREE ?AUTO_5397 ) ( not ( = ?AUTO_5394 ?AUTO_5395 ) ) ( CAN_TRAVERSE ?AUTO_5390 ?AUTO_5395 ?AUTO_5394 ) ( VISIBLE ?AUTO_5395 ?AUTO_5394 ) ( ON_BOARD ?AUTO_5396 ?AUTO_5390 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5390 ) ( SUPPORTS ?AUTO_5396 ?AUTO_5389 ) ( VISIBLE_FROM ?AUTO_5388 ?AUTO_5395 ) ( CAN_TRAVERSE ?AUTO_5390 ?AUTO_5391 ?AUTO_5395 ) ( VISIBLE ?AUTO_5391 ?AUTO_5395 ) ( not ( = ?AUTO_5395 ?AUTO_5391 ) ) ( not ( = ?AUTO_5394 ?AUTO_5391 ) ) ( CAN_TRAVERSE ?AUTO_5390 ?AUTO_5392 ?AUTO_5391 ) ( VISIBLE ?AUTO_5392 ?AUTO_5391 ) ( not ( = ?AUTO_5395 ?AUTO_5392 ) ) ( not ( = ?AUTO_5394 ?AUTO_5392 ) ) ( not ( = ?AUTO_5391 ?AUTO_5392 ) ) ( CALIBRATION_TARGET ?AUTO_5396 ?AUTO_5393 ) ( VISIBLE_FROM ?AUTO_5393 ?AUTO_5392 ) ( not ( = ?AUTO_5388 ?AUTO_5393 ) ) ( CAN_TRAVERSE ?AUTO_5390 ?AUTO_5398 ?AUTO_5392 ) ( AT ?AUTO_5390 ?AUTO_5398 ) ( VISIBLE ?AUTO_5398 ?AUTO_5392 ) ( not ( = ?AUTO_5395 ?AUTO_5398 ) ) ( not ( = ?AUTO_5394 ?AUTO_5398 ) ) ( not ( = ?AUTO_5391 ?AUTO_5398 ) ) ( not ( = ?AUTO_5392 ?AUTO_5398 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5390 ?AUTO_5398 ?AUTO_5392 )
      ( GET_IMAGE_DATA ?AUTO_5388 ?AUTO_5389 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5388 ?AUTO_5389 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5399 - OBJECTIVE
      ?AUTO_5400 - MODE
    )
    :vars
    (
      ?AUTO_5407 - LANDER
      ?AUTO_5408 - WAYPOINT
      ?AUTO_5405 - WAYPOINT
      ?AUTO_5401 - ROVER
      ?AUTO_5402 - CAMERA
      ?AUTO_5404 - WAYPOINT
      ?AUTO_5409 - WAYPOINT
      ?AUTO_5403 - OBJECTIVE
      ?AUTO_5406 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5407 ?AUTO_5408 ) ( VISIBLE ?AUTO_5405 ?AUTO_5408 ) ( AVAILABLE ?AUTO_5401 ) ( CHANNEL_FREE ?AUTO_5407 ) ( not ( = ?AUTO_5405 ?AUTO_5408 ) ) ( CAN_TRAVERSE ?AUTO_5401 ?AUTO_5408 ?AUTO_5405 ) ( VISIBLE ?AUTO_5408 ?AUTO_5405 ) ( ON_BOARD ?AUTO_5402 ?AUTO_5401 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5401 ) ( SUPPORTS ?AUTO_5402 ?AUTO_5400 ) ( VISIBLE_FROM ?AUTO_5399 ?AUTO_5408 ) ( CAN_TRAVERSE ?AUTO_5401 ?AUTO_5404 ?AUTO_5408 ) ( VISIBLE ?AUTO_5404 ?AUTO_5408 ) ( not ( = ?AUTO_5408 ?AUTO_5404 ) ) ( not ( = ?AUTO_5405 ?AUTO_5404 ) ) ( CAN_TRAVERSE ?AUTO_5401 ?AUTO_5409 ?AUTO_5404 ) ( VISIBLE ?AUTO_5409 ?AUTO_5404 ) ( not ( = ?AUTO_5408 ?AUTO_5409 ) ) ( not ( = ?AUTO_5405 ?AUTO_5409 ) ) ( not ( = ?AUTO_5404 ?AUTO_5409 ) ) ( CALIBRATION_TARGET ?AUTO_5402 ?AUTO_5403 ) ( VISIBLE_FROM ?AUTO_5403 ?AUTO_5409 ) ( not ( = ?AUTO_5399 ?AUTO_5403 ) ) ( CAN_TRAVERSE ?AUTO_5401 ?AUTO_5406 ?AUTO_5409 ) ( VISIBLE ?AUTO_5406 ?AUTO_5409 ) ( not ( = ?AUTO_5408 ?AUTO_5406 ) ) ( not ( = ?AUTO_5405 ?AUTO_5406 ) ) ( not ( = ?AUTO_5404 ?AUTO_5406 ) ) ( not ( = ?AUTO_5409 ?AUTO_5406 ) ) ( CAN_TRAVERSE ?AUTO_5401 ?AUTO_5408 ?AUTO_5406 ) ( AT ?AUTO_5401 ?AUTO_5408 ) ( VISIBLE ?AUTO_5408 ?AUTO_5406 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5401 ?AUTO_5408 ?AUTO_5406 )
      ( GET_IMAGE_DATA ?AUTO_5399 ?AUTO_5400 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5399 ?AUTO_5400 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5410 - OBJECTIVE
      ?AUTO_5411 - MODE
    )
    :vars
    (
      ?AUTO_5420 - LANDER
      ?AUTO_5414 - WAYPOINT
      ?AUTO_5416 - WAYPOINT
      ?AUTO_5415 - ROVER
      ?AUTO_5417 - CAMERA
      ?AUTO_5418 - WAYPOINT
      ?AUTO_5419 - WAYPOINT
      ?AUTO_5412 - OBJECTIVE
      ?AUTO_5413 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5420 ?AUTO_5414 ) ( VISIBLE ?AUTO_5416 ?AUTO_5414 ) ( AVAILABLE ?AUTO_5415 ) ( CHANNEL_FREE ?AUTO_5420 ) ( not ( = ?AUTO_5416 ?AUTO_5414 ) ) ( CAN_TRAVERSE ?AUTO_5415 ?AUTO_5414 ?AUTO_5416 ) ( VISIBLE ?AUTO_5414 ?AUTO_5416 ) ( ON_BOARD ?AUTO_5417 ?AUTO_5415 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5415 ) ( SUPPORTS ?AUTO_5417 ?AUTO_5411 ) ( VISIBLE_FROM ?AUTO_5410 ?AUTO_5414 ) ( CAN_TRAVERSE ?AUTO_5415 ?AUTO_5418 ?AUTO_5414 ) ( VISIBLE ?AUTO_5418 ?AUTO_5414 ) ( not ( = ?AUTO_5414 ?AUTO_5418 ) ) ( not ( = ?AUTO_5416 ?AUTO_5418 ) ) ( CAN_TRAVERSE ?AUTO_5415 ?AUTO_5419 ?AUTO_5418 ) ( VISIBLE ?AUTO_5419 ?AUTO_5418 ) ( not ( = ?AUTO_5414 ?AUTO_5419 ) ) ( not ( = ?AUTO_5416 ?AUTO_5419 ) ) ( not ( = ?AUTO_5418 ?AUTO_5419 ) ) ( CALIBRATION_TARGET ?AUTO_5417 ?AUTO_5412 ) ( VISIBLE_FROM ?AUTO_5412 ?AUTO_5419 ) ( not ( = ?AUTO_5410 ?AUTO_5412 ) ) ( CAN_TRAVERSE ?AUTO_5415 ?AUTO_5413 ?AUTO_5419 ) ( VISIBLE ?AUTO_5413 ?AUTO_5419 ) ( not ( = ?AUTO_5414 ?AUTO_5413 ) ) ( not ( = ?AUTO_5416 ?AUTO_5413 ) ) ( not ( = ?AUTO_5418 ?AUTO_5413 ) ) ( not ( = ?AUTO_5419 ?AUTO_5413 ) ) ( CAN_TRAVERSE ?AUTO_5415 ?AUTO_5414 ?AUTO_5413 ) ( VISIBLE ?AUTO_5414 ?AUTO_5413 ) ( AT ?AUTO_5415 ?AUTO_5418 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5415 ?AUTO_5418 ?AUTO_5414 )
      ( GET_IMAGE_DATA ?AUTO_5410 ?AUTO_5411 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5410 ?AUTO_5411 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5442 - OBJECTIVE
      ?AUTO_5443 - MODE
    )
    :vars
    (
      ?AUTO_5447 - LANDER
      ?AUTO_5445 - WAYPOINT
      ?AUTO_5448 - WAYPOINT
      ?AUTO_5444 - ROVER
      ?AUTO_5446 - CAMERA
      ?AUTO_5449 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5447 ?AUTO_5445 ) ( VISIBLE ?AUTO_5448 ?AUTO_5445 ) ( AVAILABLE ?AUTO_5444 ) ( CHANNEL_FREE ?AUTO_5447 ) ( not ( = ?AUTO_5448 ?AUTO_5445 ) ) ( CAN_TRAVERSE ?AUTO_5444 ?AUTO_5445 ?AUTO_5448 ) ( AT ?AUTO_5444 ?AUTO_5445 ) ( VISIBLE ?AUTO_5445 ?AUTO_5448 ) ( ON_BOARD ?AUTO_5446 ?AUTO_5444 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5444 ) ( SUPPORTS ?AUTO_5446 ?AUTO_5443 ) ( VISIBLE_FROM ?AUTO_5442 ?AUTO_5445 ) ( CALIBRATION_TARGET ?AUTO_5446 ?AUTO_5449 ) ( VISIBLE_FROM ?AUTO_5449 ?AUTO_5445 ) ( not ( = ?AUTO_5442 ?AUTO_5449 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_5444 ?AUTO_5446 ?AUTO_5449 ?AUTO_5445 )
      ( GET_IMAGE_DATA ?AUTO_5442 ?AUTO_5443 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5442 ?AUTO_5443 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5503 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5505 - LANDER
      ?AUTO_5504 - WAYPOINT
      ?AUTO_5507 - ROVER
      ?AUTO_5508 - STORE
      ?AUTO_5506 - WAYPOINT
      ?AUTO_5509 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5505 ?AUTO_5503 ) ( VISIBLE ?AUTO_5504 ?AUTO_5503 ) ( AVAILABLE ?AUTO_5507 ) ( CHANNEL_FREE ?AUTO_5505 ) ( not ( = ?AUTO_5503 ?AUTO_5504 ) ) ( CAN_TRAVERSE ?AUTO_5507 ?AUTO_5503 ?AUTO_5504 ) ( VISIBLE ?AUTO_5503 ?AUTO_5504 ) ( AT_SOIL_SAMPLE ?AUTO_5503 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5507 ) ( STORE_OF ?AUTO_5508 ?AUTO_5507 ) ( EMPTY ?AUTO_5508 ) ( CAN_TRAVERSE ?AUTO_5507 ?AUTO_5506 ?AUTO_5503 ) ( VISIBLE ?AUTO_5506 ?AUTO_5503 ) ( not ( = ?AUTO_5503 ?AUTO_5506 ) ) ( not ( = ?AUTO_5504 ?AUTO_5506 ) ) ( CAN_TRAVERSE ?AUTO_5507 ?AUTO_5509 ?AUTO_5506 ) ( AT ?AUTO_5507 ?AUTO_5509 ) ( VISIBLE ?AUTO_5509 ?AUTO_5506 ) ( not ( = ?AUTO_5503 ?AUTO_5509 ) ) ( not ( = ?AUTO_5504 ?AUTO_5509 ) ) ( not ( = ?AUTO_5506 ?AUTO_5509 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5507 ?AUTO_5509 ?AUTO_5506 )
      ( GET_SOIL_DATA ?AUTO_5503 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5503 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5511 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5517 - LANDER
      ?AUTO_5513 - WAYPOINT
      ?AUTO_5514 - ROVER
      ?AUTO_5512 - STORE
      ?AUTO_5516 - WAYPOINT
      ?AUTO_5515 - WAYPOINT
      ?AUTO_5518 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5517 ?AUTO_5511 ) ( VISIBLE ?AUTO_5513 ?AUTO_5511 ) ( AVAILABLE ?AUTO_5514 ) ( CHANNEL_FREE ?AUTO_5517 ) ( not ( = ?AUTO_5511 ?AUTO_5513 ) ) ( CAN_TRAVERSE ?AUTO_5514 ?AUTO_5511 ?AUTO_5513 ) ( VISIBLE ?AUTO_5511 ?AUTO_5513 ) ( AT_SOIL_SAMPLE ?AUTO_5511 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5514 ) ( STORE_OF ?AUTO_5512 ?AUTO_5514 ) ( EMPTY ?AUTO_5512 ) ( CAN_TRAVERSE ?AUTO_5514 ?AUTO_5516 ?AUTO_5511 ) ( VISIBLE ?AUTO_5516 ?AUTO_5511 ) ( not ( = ?AUTO_5511 ?AUTO_5516 ) ) ( not ( = ?AUTO_5513 ?AUTO_5516 ) ) ( CAN_TRAVERSE ?AUTO_5514 ?AUTO_5515 ?AUTO_5516 ) ( VISIBLE ?AUTO_5515 ?AUTO_5516 ) ( not ( = ?AUTO_5511 ?AUTO_5515 ) ) ( not ( = ?AUTO_5513 ?AUTO_5515 ) ) ( not ( = ?AUTO_5516 ?AUTO_5515 ) ) ( CAN_TRAVERSE ?AUTO_5514 ?AUTO_5518 ?AUTO_5515 ) ( AT ?AUTO_5514 ?AUTO_5518 ) ( VISIBLE ?AUTO_5518 ?AUTO_5515 ) ( not ( = ?AUTO_5511 ?AUTO_5518 ) ) ( not ( = ?AUTO_5513 ?AUTO_5518 ) ) ( not ( = ?AUTO_5516 ?AUTO_5518 ) ) ( not ( = ?AUTO_5515 ?AUTO_5518 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5514 ?AUTO_5518 ?AUTO_5515 )
      ( GET_SOIL_DATA ?AUTO_5511 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5511 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5583 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5585 - LANDER
      ?AUTO_5584 - WAYPOINT
      ?AUTO_5587 - ROVER
      ?AUTO_5586 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5585 ?AUTO_5584 ) ( VISIBLE ?AUTO_5583 ?AUTO_5584 ) ( AVAILABLE ?AUTO_5587 ) ( CHANNEL_FREE ?AUTO_5585 ) ( not ( = ?AUTO_5583 ?AUTO_5584 ) ) ( AT_ROCK_SAMPLE ?AUTO_5583 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5587 ) ( STORE_OF ?AUTO_5586 ?AUTO_5587 ) ( FULL ?AUTO_5586 ) ( CAN_TRAVERSE ?AUTO_5587 ?AUTO_5584 ?AUTO_5583 ) ( AT ?AUTO_5587 ?AUTO_5584 ) ( VISIBLE ?AUTO_5584 ?AUTO_5583 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5587 ?AUTO_5584 ?AUTO_5583 )
      ( GET_ROCK_DATA ?AUTO_5583 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5583 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5588 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5590 - LANDER
      ?AUTO_5589 - WAYPOINT
      ?AUTO_5591 - ROVER
      ?AUTO_5592 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5590 ?AUTO_5589 ) ( VISIBLE ?AUTO_5588 ?AUTO_5589 ) ( AVAILABLE ?AUTO_5591 ) ( CHANNEL_FREE ?AUTO_5590 ) ( not ( = ?AUTO_5588 ?AUTO_5589 ) ) ( AT_ROCK_SAMPLE ?AUTO_5588 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5591 ) ( STORE_OF ?AUTO_5592 ?AUTO_5591 ) ( CAN_TRAVERSE ?AUTO_5591 ?AUTO_5589 ?AUTO_5588 ) ( AT ?AUTO_5591 ?AUTO_5589 ) ( VISIBLE ?AUTO_5589 ?AUTO_5588 ) ( AT_ROCK_SAMPLE ?AUTO_5589 ) ( EMPTY ?AUTO_5592 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5591 ?AUTO_5592 ?AUTO_5589 )
      ( GET_ROCK_DATA ?AUTO_5588 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5588 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5642 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5647 - LANDER
      ?AUTO_5643 - WAYPOINT
      ?AUTO_5644 - WAYPOINT
      ?AUTO_5645 - ROVER
      ?AUTO_5646 - STORE
      ?AUTO_5648 - WAYPOINT
      ?AUTO_5649 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5647 ?AUTO_5643 ) ( VISIBLE ?AUTO_5644 ?AUTO_5643 ) ( AVAILABLE ?AUTO_5645 ) ( CHANNEL_FREE ?AUTO_5647 ) ( not ( = ?AUTO_5642 ?AUTO_5644 ) ) ( not ( = ?AUTO_5642 ?AUTO_5643 ) ) ( not ( = ?AUTO_5644 ?AUTO_5643 ) ) ( CAN_TRAVERSE ?AUTO_5645 ?AUTO_5642 ?AUTO_5644 ) ( VISIBLE ?AUTO_5642 ?AUTO_5644 ) ( AT_ROCK_SAMPLE ?AUTO_5642 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5645 ) ( STORE_OF ?AUTO_5646 ?AUTO_5645 ) ( CAN_TRAVERSE ?AUTO_5645 ?AUTO_5648 ?AUTO_5642 ) ( VISIBLE ?AUTO_5648 ?AUTO_5642 ) ( not ( = ?AUTO_5642 ?AUTO_5648 ) ) ( not ( = ?AUTO_5643 ?AUTO_5648 ) ) ( not ( = ?AUTO_5644 ?AUTO_5648 ) ) ( FULL ?AUTO_5646 ) ( CAN_TRAVERSE ?AUTO_5645 ?AUTO_5649 ?AUTO_5648 ) ( AT ?AUTO_5645 ?AUTO_5649 ) ( VISIBLE ?AUTO_5649 ?AUTO_5648 ) ( not ( = ?AUTO_5642 ?AUTO_5649 ) ) ( not ( = ?AUTO_5643 ?AUTO_5649 ) ) ( not ( = ?AUTO_5644 ?AUTO_5649 ) ) ( not ( = ?AUTO_5648 ?AUTO_5649 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5645 ?AUTO_5649 ?AUTO_5648 )
      ( GET_ROCK_DATA ?AUTO_5642 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5642 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5651 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5656 - LANDER
      ?AUTO_5655 - WAYPOINT
      ?AUTO_5654 - WAYPOINT
      ?AUTO_5652 - ROVER
      ?AUTO_5653 - STORE
      ?AUTO_5657 - WAYPOINT
      ?AUTO_5658 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5656 ?AUTO_5655 ) ( VISIBLE ?AUTO_5654 ?AUTO_5655 ) ( AVAILABLE ?AUTO_5652 ) ( CHANNEL_FREE ?AUTO_5656 ) ( not ( = ?AUTO_5651 ?AUTO_5654 ) ) ( not ( = ?AUTO_5651 ?AUTO_5655 ) ) ( not ( = ?AUTO_5654 ?AUTO_5655 ) ) ( CAN_TRAVERSE ?AUTO_5652 ?AUTO_5651 ?AUTO_5654 ) ( VISIBLE ?AUTO_5651 ?AUTO_5654 ) ( AT_ROCK_SAMPLE ?AUTO_5651 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5652 ) ( STORE_OF ?AUTO_5653 ?AUTO_5652 ) ( CAN_TRAVERSE ?AUTO_5652 ?AUTO_5657 ?AUTO_5651 ) ( VISIBLE ?AUTO_5657 ?AUTO_5651 ) ( not ( = ?AUTO_5651 ?AUTO_5657 ) ) ( not ( = ?AUTO_5655 ?AUTO_5657 ) ) ( not ( = ?AUTO_5654 ?AUTO_5657 ) ) ( CAN_TRAVERSE ?AUTO_5652 ?AUTO_5658 ?AUTO_5657 ) ( AT ?AUTO_5652 ?AUTO_5658 ) ( VISIBLE ?AUTO_5658 ?AUTO_5657 ) ( not ( = ?AUTO_5651 ?AUTO_5658 ) ) ( not ( = ?AUTO_5655 ?AUTO_5658 ) ) ( not ( = ?AUTO_5654 ?AUTO_5658 ) ) ( not ( = ?AUTO_5657 ?AUTO_5658 ) ) ( AT_ROCK_SAMPLE ?AUTO_5658 ) ( EMPTY ?AUTO_5653 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5652 ?AUTO_5653 ?AUTO_5658 )
      ( GET_ROCK_DATA ?AUTO_5651 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5651 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5662 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5663 - LANDER
      ?AUTO_5669 - WAYPOINT
      ?AUTO_5665 - WAYPOINT
      ?AUTO_5666 - ROVER
      ?AUTO_5668 - STORE
      ?AUTO_5664 - WAYPOINT
      ?AUTO_5667 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5663 ?AUTO_5669 ) ( VISIBLE ?AUTO_5665 ?AUTO_5669 ) ( AVAILABLE ?AUTO_5666 ) ( CHANNEL_FREE ?AUTO_5663 ) ( not ( = ?AUTO_5662 ?AUTO_5665 ) ) ( not ( = ?AUTO_5662 ?AUTO_5669 ) ) ( not ( = ?AUTO_5665 ?AUTO_5669 ) ) ( CAN_TRAVERSE ?AUTO_5666 ?AUTO_5662 ?AUTO_5665 ) ( VISIBLE ?AUTO_5662 ?AUTO_5665 ) ( AT_ROCK_SAMPLE ?AUTO_5662 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5666 ) ( STORE_OF ?AUTO_5668 ?AUTO_5666 ) ( CAN_TRAVERSE ?AUTO_5666 ?AUTO_5664 ?AUTO_5662 ) ( VISIBLE ?AUTO_5664 ?AUTO_5662 ) ( not ( = ?AUTO_5662 ?AUTO_5664 ) ) ( not ( = ?AUTO_5669 ?AUTO_5664 ) ) ( not ( = ?AUTO_5665 ?AUTO_5664 ) ) ( FULL ?AUTO_5668 ) ( CAN_TRAVERSE ?AUTO_5666 ?AUTO_5667 ?AUTO_5664 ) ( VISIBLE ?AUTO_5667 ?AUTO_5664 ) ( not ( = ?AUTO_5662 ?AUTO_5667 ) ) ( not ( = ?AUTO_5669 ?AUTO_5667 ) ) ( not ( = ?AUTO_5665 ?AUTO_5667 ) ) ( not ( = ?AUTO_5664 ?AUTO_5667 ) ) ( CAN_TRAVERSE ?AUTO_5666 ?AUTO_5669 ?AUTO_5667 ) ( AT ?AUTO_5666 ?AUTO_5669 ) ( VISIBLE ?AUTO_5669 ?AUTO_5667 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5666 ?AUTO_5669 ?AUTO_5667 )
      ( GET_ROCK_DATA ?AUTO_5662 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5662 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5670 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5674 - LANDER
      ?AUTO_5671 - WAYPOINT
      ?AUTO_5676 - WAYPOINT
      ?AUTO_5675 - ROVER
      ?AUTO_5672 - STORE
      ?AUTO_5673 - WAYPOINT
      ?AUTO_5677 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5674 ?AUTO_5671 ) ( VISIBLE ?AUTO_5676 ?AUTO_5671 ) ( AVAILABLE ?AUTO_5675 ) ( CHANNEL_FREE ?AUTO_5674 ) ( not ( = ?AUTO_5670 ?AUTO_5676 ) ) ( not ( = ?AUTO_5670 ?AUTO_5671 ) ) ( not ( = ?AUTO_5676 ?AUTO_5671 ) ) ( CAN_TRAVERSE ?AUTO_5675 ?AUTO_5670 ?AUTO_5676 ) ( VISIBLE ?AUTO_5670 ?AUTO_5676 ) ( AT_ROCK_SAMPLE ?AUTO_5670 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5675 ) ( STORE_OF ?AUTO_5672 ?AUTO_5675 ) ( CAN_TRAVERSE ?AUTO_5675 ?AUTO_5673 ?AUTO_5670 ) ( VISIBLE ?AUTO_5673 ?AUTO_5670 ) ( not ( = ?AUTO_5670 ?AUTO_5673 ) ) ( not ( = ?AUTO_5671 ?AUTO_5673 ) ) ( not ( = ?AUTO_5676 ?AUTO_5673 ) ) ( CAN_TRAVERSE ?AUTO_5675 ?AUTO_5677 ?AUTO_5673 ) ( VISIBLE ?AUTO_5677 ?AUTO_5673 ) ( not ( = ?AUTO_5670 ?AUTO_5677 ) ) ( not ( = ?AUTO_5671 ?AUTO_5677 ) ) ( not ( = ?AUTO_5676 ?AUTO_5677 ) ) ( not ( = ?AUTO_5673 ?AUTO_5677 ) ) ( CAN_TRAVERSE ?AUTO_5675 ?AUTO_5671 ?AUTO_5677 ) ( AT ?AUTO_5675 ?AUTO_5671 ) ( VISIBLE ?AUTO_5671 ?AUTO_5677 ) ( AT_ROCK_SAMPLE ?AUTO_5671 ) ( EMPTY ?AUTO_5672 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5675 ?AUTO_5672 ?AUTO_5671 )
      ( GET_ROCK_DATA ?AUTO_5670 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5670 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5680 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5686 - LANDER
      ?AUTO_5682 - WAYPOINT
      ?AUTO_5681 - WAYPOINT
      ?AUTO_5684 - ROVER
      ?AUTO_5687 - STORE
      ?AUTO_5683 - WAYPOINT
      ?AUTO_5685 - WAYPOINT
      ?AUTO_5688 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5686 ?AUTO_5682 ) ( VISIBLE ?AUTO_5681 ?AUTO_5682 ) ( AVAILABLE ?AUTO_5684 ) ( CHANNEL_FREE ?AUTO_5686 ) ( not ( = ?AUTO_5680 ?AUTO_5681 ) ) ( not ( = ?AUTO_5680 ?AUTO_5682 ) ) ( not ( = ?AUTO_5681 ?AUTO_5682 ) ) ( CAN_TRAVERSE ?AUTO_5684 ?AUTO_5680 ?AUTO_5681 ) ( VISIBLE ?AUTO_5680 ?AUTO_5681 ) ( AT_ROCK_SAMPLE ?AUTO_5680 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5684 ) ( STORE_OF ?AUTO_5687 ?AUTO_5684 ) ( CAN_TRAVERSE ?AUTO_5684 ?AUTO_5683 ?AUTO_5680 ) ( VISIBLE ?AUTO_5683 ?AUTO_5680 ) ( not ( = ?AUTO_5680 ?AUTO_5683 ) ) ( not ( = ?AUTO_5682 ?AUTO_5683 ) ) ( not ( = ?AUTO_5681 ?AUTO_5683 ) ) ( CAN_TRAVERSE ?AUTO_5684 ?AUTO_5685 ?AUTO_5683 ) ( VISIBLE ?AUTO_5685 ?AUTO_5683 ) ( not ( = ?AUTO_5680 ?AUTO_5685 ) ) ( not ( = ?AUTO_5682 ?AUTO_5685 ) ) ( not ( = ?AUTO_5681 ?AUTO_5685 ) ) ( not ( = ?AUTO_5683 ?AUTO_5685 ) ) ( CAN_TRAVERSE ?AUTO_5684 ?AUTO_5682 ?AUTO_5685 ) ( VISIBLE ?AUTO_5682 ?AUTO_5685 ) ( AT_ROCK_SAMPLE ?AUTO_5682 ) ( EMPTY ?AUTO_5687 ) ( CAN_TRAVERSE ?AUTO_5684 ?AUTO_5688 ?AUTO_5682 ) ( AT ?AUTO_5684 ?AUTO_5688 ) ( VISIBLE ?AUTO_5688 ?AUTO_5682 ) ( not ( = ?AUTO_5680 ?AUTO_5688 ) ) ( not ( = ?AUTO_5682 ?AUTO_5688 ) ) ( not ( = ?AUTO_5681 ?AUTO_5688 ) ) ( not ( = ?AUTO_5683 ?AUTO_5688 ) ) ( not ( = ?AUTO_5685 ?AUTO_5688 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5684 ?AUTO_5688 ?AUTO_5682 )
      ( GET_ROCK_DATA ?AUTO_5680 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5680 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5842 - OBJECTIVE
      ?AUTO_5843 - MODE
    )
    :vars
    (
      ?AUTO_5846 - LANDER
      ?AUTO_5844 - WAYPOINT
      ?AUTO_5849 - WAYPOINT
      ?AUTO_5845 - ROVER
      ?AUTO_5847 - CAMERA
      ?AUTO_5848 - OBJECTIVE
      ?AUTO_5850 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5846 ?AUTO_5844 ) ( VISIBLE ?AUTO_5849 ?AUTO_5844 ) ( AVAILABLE ?AUTO_5845 ) ( CHANNEL_FREE ?AUTO_5846 ) ( not ( = ?AUTO_5849 ?AUTO_5844 ) ) ( ON_BOARD ?AUTO_5847 ?AUTO_5845 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5845 ) ( SUPPORTS ?AUTO_5847 ?AUTO_5843 ) ( VISIBLE_FROM ?AUTO_5842 ?AUTO_5849 ) ( CAN_TRAVERSE ?AUTO_5845 ?AUTO_5844 ?AUTO_5849 ) ( VISIBLE ?AUTO_5844 ?AUTO_5849 ) ( CALIBRATION_TARGET ?AUTO_5847 ?AUTO_5848 ) ( VISIBLE_FROM ?AUTO_5848 ?AUTO_5844 ) ( not ( = ?AUTO_5842 ?AUTO_5848 ) ) ( CAN_TRAVERSE ?AUTO_5845 ?AUTO_5850 ?AUTO_5844 ) ( AT ?AUTO_5845 ?AUTO_5850 ) ( VISIBLE ?AUTO_5850 ?AUTO_5844 ) ( not ( = ?AUTO_5844 ?AUTO_5850 ) ) ( not ( = ?AUTO_5849 ?AUTO_5850 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5845 ?AUTO_5850 ?AUTO_5844 )
      ( GET_IMAGE_DATA ?AUTO_5842 ?AUTO_5843 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5842 ?AUTO_5843 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5857 - OBJECTIVE
      ?AUTO_5858 - MODE
    )
    :vars
    (
      ?AUTO_5863 - LANDER
      ?AUTO_5861 - WAYPOINT
      ?AUTO_5862 - WAYPOINT
      ?AUTO_5864 - ROVER
      ?AUTO_5860 - CAMERA
      ?AUTO_5865 - OBJECTIVE
      ?AUTO_5859 - WAYPOINT
      ?AUTO_5866 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5863 ?AUTO_5861 ) ( VISIBLE ?AUTO_5862 ?AUTO_5861 ) ( AVAILABLE ?AUTO_5864 ) ( CHANNEL_FREE ?AUTO_5863 ) ( not ( = ?AUTO_5862 ?AUTO_5861 ) ) ( ON_BOARD ?AUTO_5860 ?AUTO_5864 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5864 ) ( SUPPORTS ?AUTO_5860 ?AUTO_5858 ) ( VISIBLE_FROM ?AUTO_5857 ?AUTO_5862 ) ( CAN_TRAVERSE ?AUTO_5864 ?AUTO_5861 ?AUTO_5862 ) ( VISIBLE ?AUTO_5861 ?AUTO_5862 ) ( CALIBRATION_TARGET ?AUTO_5860 ?AUTO_5865 ) ( VISIBLE_FROM ?AUTO_5865 ?AUTO_5861 ) ( not ( = ?AUTO_5857 ?AUTO_5865 ) ) ( CAN_TRAVERSE ?AUTO_5864 ?AUTO_5859 ?AUTO_5861 ) ( VISIBLE ?AUTO_5859 ?AUTO_5861 ) ( not ( = ?AUTO_5861 ?AUTO_5859 ) ) ( not ( = ?AUTO_5862 ?AUTO_5859 ) ) ( CAN_TRAVERSE ?AUTO_5864 ?AUTO_5866 ?AUTO_5859 ) ( AT ?AUTO_5864 ?AUTO_5866 ) ( VISIBLE ?AUTO_5866 ?AUTO_5859 ) ( not ( = ?AUTO_5861 ?AUTO_5866 ) ) ( not ( = ?AUTO_5862 ?AUTO_5866 ) ) ( not ( = ?AUTO_5859 ?AUTO_5866 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5864 ?AUTO_5866 ?AUTO_5859 )
      ( GET_IMAGE_DATA ?AUTO_5857 ?AUTO_5858 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5857 ?AUTO_5858 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5994 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5997 - LANDER
      ?AUTO_5995 - WAYPOINT
      ?AUTO_5996 - ROVER
      ?AUTO_5998 - STORE
      ?AUTO_5999 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5997 ?AUTO_5995 ) ( VISIBLE ?AUTO_5994 ?AUTO_5995 ) ( AVAILABLE ?AUTO_5996 ) ( CHANNEL_FREE ?AUTO_5997 ) ( not ( = ?AUTO_5994 ?AUTO_5995 ) ) ( AT_SOIL_SAMPLE ?AUTO_5994 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5996 ) ( STORE_OF ?AUTO_5998 ?AUTO_5996 ) ( FULL ?AUTO_5998 ) ( CAN_TRAVERSE ?AUTO_5996 ?AUTO_5999 ?AUTO_5994 ) ( VISIBLE ?AUTO_5999 ?AUTO_5994 ) ( not ( = ?AUTO_5994 ?AUTO_5999 ) ) ( not ( = ?AUTO_5995 ?AUTO_5999 ) ) ( CAN_TRAVERSE ?AUTO_5996 ?AUTO_5995 ?AUTO_5999 ) ( AT ?AUTO_5996 ?AUTO_5995 ) ( VISIBLE ?AUTO_5995 ?AUTO_5999 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5996 ?AUTO_5995 ?AUTO_5999 )
      ( GET_SOIL_DATA ?AUTO_5994 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5994 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6002 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6004 - LANDER
      ?AUTO_6007 - WAYPOINT
      ?AUTO_6005 - ROVER
      ?AUTO_6006 - STORE
      ?AUTO_6003 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6004 ?AUTO_6007 ) ( VISIBLE ?AUTO_6002 ?AUTO_6007 ) ( AVAILABLE ?AUTO_6005 ) ( CHANNEL_FREE ?AUTO_6004 ) ( not ( = ?AUTO_6002 ?AUTO_6007 ) ) ( AT_SOIL_SAMPLE ?AUTO_6002 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6005 ) ( STORE_OF ?AUTO_6006 ?AUTO_6005 ) ( CAN_TRAVERSE ?AUTO_6005 ?AUTO_6003 ?AUTO_6002 ) ( VISIBLE ?AUTO_6003 ?AUTO_6002 ) ( not ( = ?AUTO_6002 ?AUTO_6003 ) ) ( not ( = ?AUTO_6007 ?AUTO_6003 ) ) ( CAN_TRAVERSE ?AUTO_6005 ?AUTO_6007 ?AUTO_6003 ) ( AT ?AUTO_6005 ?AUTO_6007 ) ( VISIBLE ?AUTO_6007 ?AUTO_6003 ) ( AT_SOIL_SAMPLE ?AUTO_6007 ) ( EMPTY ?AUTO_6006 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6005 ?AUTO_6006 ?AUTO_6007 )
      ( GET_SOIL_DATA ?AUTO_6002 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6002 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9695 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9699 - LANDER
      ?AUTO_9701 - WAYPOINT
      ?AUTO_9698 - WAYPOINT
      ?AUTO_9696 - ROVER
      ?AUTO_9700 - STORE
      ?AUTO_9697 - WAYPOINT
      ?AUTO_9702 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9699 ?AUTO_9701 ) ( VISIBLE ?AUTO_9698 ?AUTO_9701 ) ( AVAILABLE ?AUTO_9696 ) ( CHANNEL_FREE ?AUTO_9699 ) ( not ( = ?AUTO_9695 ?AUTO_9698 ) ) ( not ( = ?AUTO_9695 ?AUTO_9701 ) ) ( not ( = ?AUTO_9698 ?AUTO_9701 ) ) ( CAN_TRAVERSE ?AUTO_9696 ?AUTO_9695 ?AUTO_9698 ) ( VISIBLE ?AUTO_9695 ?AUTO_9698 ) ( AT_ROCK_SAMPLE ?AUTO_9695 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9696 ) ( STORE_OF ?AUTO_9700 ?AUTO_9696 ) ( EMPTY ?AUTO_9700 ) ( CAN_TRAVERSE ?AUTO_9696 ?AUTO_9697 ?AUTO_9695 ) ( VISIBLE ?AUTO_9697 ?AUTO_9695 ) ( not ( = ?AUTO_9695 ?AUTO_9697 ) ) ( not ( = ?AUTO_9701 ?AUTO_9697 ) ) ( not ( = ?AUTO_9698 ?AUTO_9697 ) ) ( CAN_TRAVERSE ?AUTO_9696 ?AUTO_9702 ?AUTO_9697 ) ( VISIBLE ?AUTO_9702 ?AUTO_9697 ) ( not ( = ?AUTO_9695 ?AUTO_9702 ) ) ( not ( = ?AUTO_9701 ?AUTO_9702 ) ) ( not ( = ?AUTO_9698 ?AUTO_9702 ) ) ( not ( = ?AUTO_9697 ?AUTO_9702 ) ) ( CAN_TRAVERSE ?AUTO_9696 ?AUTO_9698 ?AUTO_9702 ) ( AT ?AUTO_9696 ?AUTO_9698 ) ( VISIBLE ?AUTO_9698 ?AUTO_9702 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9696 ?AUTO_9698 ?AUTO_9702 )
      ( GET_ROCK_DATA ?AUTO_9695 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9695 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6098 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6104 - LANDER
      ?AUTO_6102 - WAYPOINT
      ?AUTO_6100 - WAYPOINT
      ?AUTO_6103 - ROVER
      ?AUTO_6101 - STORE
      ?AUTO_6105 - WAYPOINT
      ?AUTO_6099 - WAYPOINT
      ?AUTO_6106 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6104 ?AUTO_6102 ) ( VISIBLE ?AUTO_6100 ?AUTO_6102 ) ( AVAILABLE ?AUTO_6103 ) ( CHANNEL_FREE ?AUTO_6104 ) ( not ( = ?AUTO_6098 ?AUTO_6100 ) ) ( not ( = ?AUTO_6098 ?AUTO_6102 ) ) ( not ( = ?AUTO_6100 ?AUTO_6102 ) ) ( CAN_TRAVERSE ?AUTO_6103 ?AUTO_6098 ?AUTO_6100 ) ( VISIBLE ?AUTO_6098 ?AUTO_6100 ) ( AT_ROCK_SAMPLE ?AUTO_6098 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6103 ) ( STORE_OF ?AUTO_6101 ?AUTO_6103 ) ( CAN_TRAVERSE ?AUTO_6103 ?AUTO_6105 ?AUTO_6098 ) ( VISIBLE ?AUTO_6105 ?AUTO_6098 ) ( not ( = ?AUTO_6098 ?AUTO_6105 ) ) ( not ( = ?AUTO_6102 ?AUTO_6105 ) ) ( not ( = ?AUTO_6100 ?AUTO_6105 ) ) ( CAN_TRAVERSE ?AUTO_6103 ?AUTO_6099 ?AUTO_6105 ) ( VISIBLE ?AUTO_6099 ?AUTO_6105 ) ( not ( = ?AUTO_6098 ?AUTO_6099 ) ) ( not ( = ?AUTO_6102 ?AUTO_6099 ) ) ( not ( = ?AUTO_6100 ?AUTO_6099 ) ) ( not ( = ?AUTO_6105 ?AUTO_6099 ) ) ( AT_ROCK_SAMPLE ?AUTO_6099 ) ( EMPTY ?AUTO_6101 ) ( CAN_TRAVERSE ?AUTO_6103 ?AUTO_6100 ?AUTO_6099 ) ( VISIBLE ?AUTO_6100 ?AUTO_6099 ) ( CAN_TRAVERSE ?AUTO_6103 ?AUTO_6106 ?AUTO_6100 ) ( AT ?AUTO_6103 ?AUTO_6106 ) ( VISIBLE ?AUTO_6106 ?AUTO_6100 ) ( not ( = ?AUTO_6098 ?AUTO_6106 ) ) ( not ( = ?AUTO_6102 ?AUTO_6106 ) ) ( not ( = ?AUTO_6100 ?AUTO_6106 ) ) ( not ( = ?AUTO_6105 ?AUTO_6106 ) ) ( not ( = ?AUTO_6099 ?AUTO_6106 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6103 ?AUTO_6106 ?AUTO_6100 )
      ( GET_ROCK_DATA ?AUTO_6098 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6098 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6239 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6244 - LANDER
      ?AUTO_6243 - WAYPOINT
      ?AUTO_6242 - ROVER
      ?AUTO_6240 - STORE
      ?AUTO_6241 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6244 ?AUTO_6239 ) ( VISIBLE ?AUTO_6243 ?AUTO_6239 ) ( AVAILABLE ?AUTO_6242 ) ( CHANNEL_FREE ?AUTO_6244 ) ( not ( = ?AUTO_6239 ?AUTO_6243 ) ) ( CAN_TRAVERSE ?AUTO_6242 ?AUTO_6239 ?AUTO_6243 ) ( VISIBLE ?AUTO_6239 ?AUTO_6243 ) ( AT_ROCK_SAMPLE ?AUTO_6239 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6242 ) ( STORE_OF ?AUTO_6240 ?AUTO_6242 ) ( EMPTY ?AUTO_6240 ) ( CAN_TRAVERSE ?AUTO_6242 ?AUTO_6241 ?AUTO_6239 ) ( VISIBLE ?AUTO_6241 ?AUTO_6239 ) ( not ( = ?AUTO_6239 ?AUTO_6241 ) ) ( not ( = ?AUTO_6243 ?AUTO_6241 ) ) ( CAN_TRAVERSE ?AUTO_6242 ?AUTO_6243 ?AUTO_6241 ) ( AT ?AUTO_6242 ?AUTO_6243 ) ( VISIBLE ?AUTO_6243 ?AUTO_6241 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6242 ?AUTO_6243 ?AUTO_6241 )
      ( GET_ROCK_DATA ?AUTO_6239 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6239 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6336 - OBJECTIVE
      ?AUTO_6337 - MODE
    )
    :vars
    (
      ?AUTO_6341 - LANDER
      ?AUTO_6343 - WAYPOINT
      ?AUTO_6338 - WAYPOINT
      ?AUTO_6342 - ROVER
      ?AUTO_6339 - CAMERA
      ?AUTO_6340 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6341 ?AUTO_6343 ) ( VISIBLE ?AUTO_6338 ?AUTO_6343 ) ( AVAILABLE ?AUTO_6342 ) ( CHANNEL_FREE ?AUTO_6341 ) ( not ( = ?AUTO_6338 ?AUTO_6343 ) ) ( CAN_TRAVERSE ?AUTO_6342 ?AUTO_6343 ?AUTO_6338 ) ( VISIBLE ?AUTO_6343 ?AUTO_6338 ) ( ON_BOARD ?AUTO_6339 ?AUTO_6342 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6342 ) ( SUPPORTS ?AUTO_6339 ?AUTO_6337 ) ( VISIBLE_FROM ?AUTO_6336 ?AUTO_6343 ) ( CALIBRATION_TARGET ?AUTO_6339 ?AUTO_6336 ) ( CAN_TRAVERSE ?AUTO_6342 ?AUTO_6340 ?AUTO_6343 ) ( VISIBLE ?AUTO_6340 ?AUTO_6343 ) ( not ( = ?AUTO_6343 ?AUTO_6340 ) ) ( not ( = ?AUTO_6338 ?AUTO_6340 ) ) ( CAN_TRAVERSE ?AUTO_6342 ?AUTO_6338 ?AUTO_6340 ) ( AT ?AUTO_6342 ?AUTO_6338 ) ( VISIBLE ?AUTO_6338 ?AUTO_6340 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6342 ?AUTO_6338 ?AUTO_6340 )
      ( GET_IMAGE_DATA ?AUTO_6336 ?AUTO_6337 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6336 ?AUTO_6337 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6383 - OBJECTIVE
      ?AUTO_6384 - MODE
    )
    :vars
    (
      ?AUTO_6387 - LANDER
      ?AUTO_6385 - WAYPOINT
      ?AUTO_6388 - WAYPOINT
      ?AUTO_6390 - ROVER
      ?AUTO_6386 - CAMERA
      ?AUTO_6389 - OBJECTIVE
      ?AUTO_6391 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6387 ?AUTO_6385 ) ( VISIBLE ?AUTO_6388 ?AUTO_6385 ) ( AVAILABLE ?AUTO_6390 ) ( CHANNEL_FREE ?AUTO_6387 ) ( not ( = ?AUTO_6388 ?AUTO_6385 ) ) ( CAN_TRAVERSE ?AUTO_6390 ?AUTO_6385 ?AUTO_6388 ) ( VISIBLE ?AUTO_6385 ?AUTO_6388 ) ( ON_BOARD ?AUTO_6386 ?AUTO_6390 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6390 ) ( SUPPORTS ?AUTO_6386 ?AUTO_6384 ) ( VISIBLE_FROM ?AUTO_6383 ?AUTO_6385 ) ( CALIBRATION_TARGET ?AUTO_6386 ?AUTO_6389 ) ( VISIBLE_FROM ?AUTO_6389 ?AUTO_6385 ) ( not ( = ?AUTO_6383 ?AUTO_6389 ) ) ( CAN_TRAVERSE ?AUTO_6390 ?AUTO_6391 ?AUTO_6385 ) ( AT ?AUTO_6390 ?AUTO_6391 ) ( VISIBLE ?AUTO_6391 ?AUTO_6385 ) ( not ( = ?AUTO_6385 ?AUTO_6391 ) ) ( not ( = ?AUTO_6388 ?AUTO_6391 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6390 ?AUTO_6391 ?AUTO_6385 )
      ( GET_IMAGE_DATA ?AUTO_6383 ?AUTO_6384 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6383 ?AUTO_6384 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6398 - OBJECTIVE
      ?AUTO_6399 - MODE
    )
    :vars
    (
      ?AUTO_6406 - LANDER
      ?AUTO_6405 - WAYPOINT
      ?AUTO_6402 - WAYPOINT
      ?AUTO_6400 - ROVER
      ?AUTO_6401 - CAMERA
      ?AUTO_6403 - OBJECTIVE
      ?AUTO_6404 - WAYPOINT
      ?AUTO_6407 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6406 ?AUTO_6405 ) ( VISIBLE ?AUTO_6402 ?AUTO_6405 ) ( AVAILABLE ?AUTO_6400 ) ( CHANNEL_FREE ?AUTO_6406 ) ( not ( = ?AUTO_6402 ?AUTO_6405 ) ) ( CAN_TRAVERSE ?AUTO_6400 ?AUTO_6405 ?AUTO_6402 ) ( VISIBLE ?AUTO_6405 ?AUTO_6402 ) ( ON_BOARD ?AUTO_6401 ?AUTO_6400 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6400 ) ( SUPPORTS ?AUTO_6401 ?AUTO_6399 ) ( VISIBLE_FROM ?AUTO_6398 ?AUTO_6405 ) ( CALIBRATION_TARGET ?AUTO_6401 ?AUTO_6403 ) ( VISIBLE_FROM ?AUTO_6403 ?AUTO_6405 ) ( not ( = ?AUTO_6398 ?AUTO_6403 ) ) ( CAN_TRAVERSE ?AUTO_6400 ?AUTO_6404 ?AUTO_6405 ) ( VISIBLE ?AUTO_6404 ?AUTO_6405 ) ( not ( = ?AUTO_6405 ?AUTO_6404 ) ) ( not ( = ?AUTO_6402 ?AUTO_6404 ) ) ( CAN_TRAVERSE ?AUTO_6400 ?AUTO_6407 ?AUTO_6404 ) ( AT ?AUTO_6400 ?AUTO_6407 ) ( VISIBLE ?AUTO_6407 ?AUTO_6404 ) ( not ( = ?AUTO_6405 ?AUTO_6407 ) ) ( not ( = ?AUTO_6402 ?AUTO_6407 ) ) ( not ( = ?AUTO_6404 ?AUTO_6407 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6400 ?AUTO_6407 ?AUTO_6404 )
      ( GET_IMAGE_DATA ?AUTO_6398 ?AUTO_6399 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6398 ?AUTO_6399 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6436 - OBJECTIVE
      ?AUTO_6437 - MODE
    )
    :vars
    (
      ?AUTO_6440 - LANDER
      ?AUTO_6442 - WAYPOINT
      ?AUTO_6443 - WAYPOINT
      ?AUTO_6439 - ROVER
      ?AUTO_6438 - CAMERA
      ?AUTO_6444 - OBJECTIVE
      ?AUTO_6441 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6440 ?AUTO_6442 ) ( VISIBLE ?AUTO_6443 ?AUTO_6442 ) ( AVAILABLE ?AUTO_6439 ) ( CHANNEL_FREE ?AUTO_6440 ) ( not ( = ?AUTO_6443 ?AUTO_6442 ) ) ( CAN_TRAVERSE ?AUTO_6439 ?AUTO_6442 ?AUTO_6443 ) ( VISIBLE ?AUTO_6442 ?AUTO_6443 ) ( ON_BOARD ?AUTO_6438 ?AUTO_6439 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6439 ) ( SUPPORTS ?AUTO_6438 ?AUTO_6437 ) ( VISIBLE_FROM ?AUTO_6436 ?AUTO_6442 ) ( CALIBRATION_TARGET ?AUTO_6438 ?AUTO_6444 ) ( VISIBLE_FROM ?AUTO_6444 ?AUTO_6442 ) ( not ( = ?AUTO_6436 ?AUTO_6444 ) ) ( CAN_TRAVERSE ?AUTO_6439 ?AUTO_6441 ?AUTO_6442 ) ( VISIBLE ?AUTO_6441 ?AUTO_6442 ) ( not ( = ?AUTO_6442 ?AUTO_6441 ) ) ( not ( = ?AUTO_6443 ?AUTO_6441 ) ) ( CAN_TRAVERSE ?AUTO_6439 ?AUTO_6443 ?AUTO_6441 ) ( AT ?AUTO_6439 ?AUTO_6443 ) ( VISIBLE ?AUTO_6443 ?AUTO_6441 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6439 ?AUTO_6443 ?AUTO_6441 )
      ( GET_IMAGE_DATA ?AUTO_6436 ?AUTO_6437 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6436 ?AUTO_6437 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6477 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6479 - LANDER
      ?AUTO_6480 - WAYPOINT
      ?AUTO_6482 - WAYPOINT
      ?AUTO_6478 - ROVER
      ?AUTO_6481 - STORE
      ?AUTO_6483 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6479 ?AUTO_6480 ) ( VISIBLE ?AUTO_6482 ?AUTO_6480 ) ( AVAILABLE ?AUTO_6478 ) ( CHANNEL_FREE ?AUTO_6479 ) ( not ( = ?AUTO_6477 ?AUTO_6482 ) ) ( not ( = ?AUTO_6477 ?AUTO_6480 ) ) ( not ( = ?AUTO_6482 ?AUTO_6480 ) ) ( CAN_TRAVERSE ?AUTO_6478 ?AUTO_6477 ?AUTO_6482 ) ( VISIBLE ?AUTO_6477 ?AUTO_6482 ) ( AT_ROCK_SAMPLE ?AUTO_6477 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6478 ) ( STORE_OF ?AUTO_6481 ?AUTO_6478 ) ( EMPTY ?AUTO_6481 ) ( CAN_TRAVERSE ?AUTO_6478 ?AUTO_6482 ?AUTO_6477 ) ( VISIBLE ?AUTO_6482 ?AUTO_6477 ) ( CAN_TRAVERSE ?AUTO_6478 ?AUTO_6480 ?AUTO_6482 ) ( VISIBLE ?AUTO_6480 ?AUTO_6482 ) ( CAN_TRAVERSE ?AUTO_6478 ?AUTO_6483 ?AUTO_6480 ) ( AT ?AUTO_6478 ?AUTO_6483 ) ( VISIBLE ?AUTO_6483 ?AUTO_6480 ) ( not ( = ?AUTO_6477 ?AUTO_6483 ) ) ( not ( = ?AUTO_6480 ?AUTO_6483 ) ) ( not ( = ?AUTO_6482 ?AUTO_6483 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6478 ?AUTO_6483 ?AUTO_6480 )
      ( GET_ROCK_DATA ?AUTO_6477 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6477 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6484 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6488 - LANDER
      ?AUTO_6487 - WAYPOINT
      ?AUTO_6486 - WAYPOINT
      ?AUTO_6485 - ROVER
      ?AUTO_6489 - STORE
      ?AUTO_6490 - WAYPOINT
      ?AUTO_6491 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6488 ?AUTO_6487 ) ( VISIBLE ?AUTO_6486 ?AUTO_6487 ) ( AVAILABLE ?AUTO_6485 ) ( CHANNEL_FREE ?AUTO_6488 ) ( not ( = ?AUTO_6484 ?AUTO_6486 ) ) ( not ( = ?AUTO_6484 ?AUTO_6487 ) ) ( not ( = ?AUTO_6486 ?AUTO_6487 ) ) ( CAN_TRAVERSE ?AUTO_6485 ?AUTO_6484 ?AUTO_6486 ) ( VISIBLE ?AUTO_6484 ?AUTO_6486 ) ( AT_ROCK_SAMPLE ?AUTO_6484 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6485 ) ( STORE_OF ?AUTO_6489 ?AUTO_6485 ) ( EMPTY ?AUTO_6489 ) ( CAN_TRAVERSE ?AUTO_6485 ?AUTO_6486 ?AUTO_6484 ) ( VISIBLE ?AUTO_6486 ?AUTO_6484 ) ( CAN_TRAVERSE ?AUTO_6485 ?AUTO_6487 ?AUTO_6486 ) ( VISIBLE ?AUTO_6487 ?AUTO_6486 ) ( CAN_TRAVERSE ?AUTO_6485 ?AUTO_6490 ?AUTO_6487 ) ( VISIBLE ?AUTO_6490 ?AUTO_6487 ) ( not ( = ?AUTO_6484 ?AUTO_6490 ) ) ( not ( = ?AUTO_6487 ?AUTO_6490 ) ) ( not ( = ?AUTO_6486 ?AUTO_6490 ) ) ( CAN_TRAVERSE ?AUTO_6485 ?AUTO_6491 ?AUTO_6490 ) ( AT ?AUTO_6485 ?AUTO_6491 ) ( VISIBLE ?AUTO_6491 ?AUTO_6490 ) ( not ( = ?AUTO_6484 ?AUTO_6491 ) ) ( not ( = ?AUTO_6487 ?AUTO_6491 ) ) ( not ( = ?AUTO_6486 ?AUTO_6491 ) ) ( not ( = ?AUTO_6490 ?AUTO_6491 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6485 ?AUTO_6491 ?AUTO_6490 )
      ( GET_ROCK_DATA ?AUTO_6484 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6484 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6529 - OBJECTIVE
      ?AUTO_6530 - MODE
    )
    :vars
    (
      ?AUTO_6531 - LANDER
      ?AUTO_6536 - WAYPOINT
      ?AUTO_6532 - WAYPOINT
      ?AUTO_6533 - ROVER
      ?AUTO_6535 - WAYPOINT
      ?AUTO_6534 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6531 ?AUTO_6536 ) ( VISIBLE ?AUTO_6532 ?AUTO_6536 ) ( AVAILABLE ?AUTO_6533 ) ( CHANNEL_FREE ?AUTO_6531 ) ( not ( = ?AUTO_6532 ?AUTO_6536 ) ) ( CAN_TRAVERSE ?AUTO_6533 ?AUTO_6535 ?AUTO_6532 ) ( VISIBLE ?AUTO_6535 ?AUTO_6532 ) ( not ( = ?AUTO_6536 ?AUTO_6535 ) ) ( not ( = ?AUTO_6532 ?AUTO_6535 ) ) ( CALIBRATED ?AUTO_6534 ?AUTO_6533 ) ( ON_BOARD ?AUTO_6534 ?AUTO_6533 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6533 ) ( SUPPORTS ?AUTO_6534 ?AUTO_6530 ) ( VISIBLE_FROM ?AUTO_6529 ?AUTO_6535 ) ( CAN_TRAVERSE ?AUTO_6533 ?AUTO_6532 ?AUTO_6535 ) ( VISIBLE ?AUTO_6532 ?AUTO_6535 ) ( CAN_TRAVERSE ?AUTO_6533 ?AUTO_6536 ?AUTO_6532 ) ( AT ?AUTO_6533 ?AUTO_6536 ) ( VISIBLE ?AUTO_6536 ?AUTO_6532 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6533 ?AUTO_6536 ?AUTO_6532 )
      ( GET_IMAGE_DATA ?AUTO_6529 ?AUTO_6530 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6529 ?AUTO_6530 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6537 - OBJECTIVE
      ?AUTO_6538 - MODE
    )
    :vars
    (
      ?AUTO_6540 - LANDER
      ?AUTO_6544 - WAYPOINT
      ?AUTO_6539 - WAYPOINT
      ?AUTO_6542 - ROVER
      ?AUTO_6541 - WAYPOINT
      ?AUTO_6543 - CAMERA
      ?AUTO_6545 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6540 ?AUTO_6544 ) ( VISIBLE ?AUTO_6539 ?AUTO_6544 ) ( AVAILABLE ?AUTO_6542 ) ( CHANNEL_FREE ?AUTO_6540 ) ( not ( = ?AUTO_6539 ?AUTO_6544 ) ) ( CAN_TRAVERSE ?AUTO_6542 ?AUTO_6541 ?AUTO_6539 ) ( VISIBLE ?AUTO_6541 ?AUTO_6539 ) ( not ( = ?AUTO_6544 ?AUTO_6541 ) ) ( not ( = ?AUTO_6539 ?AUTO_6541 ) ) ( ON_BOARD ?AUTO_6543 ?AUTO_6542 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6542 ) ( SUPPORTS ?AUTO_6543 ?AUTO_6538 ) ( VISIBLE_FROM ?AUTO_6537 ?AUTO_6541 ) ( CAN_TRAVERSE ?AUTO_6542 ?AUTO_6539 ?AUTO_6541 ) ( VISIBLE ?AUTO_6539 ?AUTO_6541 ) ( CAN_TRAVERSE ?AUTO_6542 ?AUTO_6544 ?AUTO_6539 ) ( AT ?AUTO_6542 ?AUTO_6544 ) ( VISIBLE ?AUTO_6544 ?AUTO_6539 ) ( CALIBRATION_TARGET ?AUTO_6543 ?AUTO_6545 ) ( VISIBLE_FROM ?AUTO_6545 ?AUTO_6544 ) ( not ( = ?AUTO_6537 ?AUTO_6545 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_6542 ?AUTO_6543 ?AUTO_6545 ?AUTO_6544 )
      ( GET_IMAGE_DATA ?AUTO_6537 ?AUTO_6538 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6537 ?AUTO_6538 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6546 - OBJECTIVE
      ?AUTO_6547 - MODE
    )
    :vars
    (
      ?AUTO_6554 - LANDER
      ?AUTO_6550 - WAYPOINT
      ?AUTO_6551 - WAYPOINT
      ?AUTO_6553 - ROVER
      ?AUTO_6548 - WAYPOINT
      ?AUTO_6552 - CAMERA
      ?AUTO_6549 - OBJECTIVE
      ?AUTO_6555 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6554 ?AUTO_6550 ) ( VISIBLE ?AUTO_6551 ?AUTO_6550 ) ( AVAILABLE ?AUTO_6553 ) ( CHANNEL_FREE ?AUTO_6554 ) ( not ( = ?AUTO_6551 ?AUTO_6550 ) ) ( CAN_TRAVERSE ?AUTO_6553 ?AUTO_6548 ?AUTO_6551 ) ( VISIBLE ?AUTO_6548 ?AUTO_6551 ) ( not ( = ?AUTO_6550 ?AUTO_6548 ) ) ( not ( = ?AUTO_6551 ?AUTO_6548 ) ) ( ON_BOARD ?AUTO_6552 ?AUTO_6553 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6553 ) ( SUPPORTS ?AUTO_6552 ?AUTO_6547 ) ( VISIBLE_FROM ?AUTO_6546 ?AUTO_6548 ) ( CAN_TRAVERSE ?AUTO_6553 ?AUTO_6551 ?AUTO_6548 ) ( VISIBLE ?AUTO_6551 ?AUTO_6548 ) ( CAN_TRAVERSE ?AUTO_6553 ?AUTO_6550 ?AUTO_6551 ) ( VISIBLE ?AUTO_6550 ?AUTO_6551 ) ( CALIBRATION_TARGET ?AUTO_6552 ?AUTO_6549 ) ( VISIBLE_FROM ?AUTO_6549 ?AUTO_6550 ) ( not ( = ?AUTO_6546 ?AUTO_6549 ) ) ( CAN_TRAVERSE ?AUTO_6553 ?AUTO_6555 ?AUTO_6550 ) ( AT ?AUTO_6553 ?AUTO_6555 ) ( VISIBLE ?AUTO_6555 ?AUTO_6550 ) ( not ( = ?AUTO_6550 ?AUTO_6555 ) ) ( not ( = ?AUTO_6551 ?AUTO_6555 ) ) ( not ( = ?AUTO_6548 ?AUTO_6555 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6553 ?AUTO_6555 ?AUTO_6550 )
      ( GET_IMAGE_DATA ?AUTO_6546 ?AUTO_6547 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6546 ?AUTO_6547 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6556 - OBJECTIVE
      ?AUTO_6557 - MODE
    )
    :vars
    (
      ?AUTO_6559 - LANDER
      ?AUTO_6561 - WAYPOINT
      ?AUTO_6558 - WAYPOINT
      ?AUTO_6565 - ROVER
      ?AUTO_6562 - WAYPOINT
      ?AUTO_6564 - CAMERA
      ?AUTO_6560 - OBJECTIVE
      ?AUTO_6563 - WAYPOINT
      ?AUTO_6566 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6559 ?AUTO_6561 ) ( VISIBLE ?AUTO_6558 ?AUTO_6561 ) ( AVAILABLE ?AUTO_6565 ) ( CHANNEL_FREE ?AUTO_6559 ) ( not ( = ?AUTO_6558 ?AUTO_6561 ) ) ( CAN_TRAVERSE ?AUTO_6565 ?AUTO_6562 ?AUTO_6558 ) ( VISIBLE ?AUTO_6562 ?AUTO_6558 ) ( not ( = ?AUTO_6561 ?AUTO_6562 ) ) ( not ( = ?AUTO_6558 ?AUTO_6562 ) ) ( ON_BOARD ?AUTO_6564 ?AUTO_6565 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6565 ) ( SUPPORTS ?AUTO_6564 ?AUTO_6557 ) ( VISIBLE_FROM ?AUTO_6556 ?AUTO_6562 ) ( CAN_TRAVERSE ?AUTO_6565 ?AUTO_6558 ?AUTO_6562 ) ( VISIBLE ?AUTO_6558 ?AUTO_6562 ) ( CAN_TRAVERSE ?AUTO_6565 ?AUTO_6561 ?AUTO_6558 ) ( VISIBLE ?AUTO_6561 ?AUTO_6558 ) ( CALIBRATION_TARGET ?AUTO_6564 ?AUTO_6560 ) ( VISIBLE_FROM ?AUTO_6560 ?AUTO_6561 ) ( not ( = ?AUTO_6556 ?AUTO_6560 ) ) ( CAN_TRAVERSE ?AUTO_6565 ?AUTO_6563 ?AUTO_6561 ) ( VISIBLE ?AUTO_6563 ?AUTO_6561 ) ( not ( = ?AUTO_6561 ?AUTO_6563 ) ) ( not ( = ?AUTO_6558 ?AUTO_6563 ) ) ( not ( = ?AUTO_6562 ?AUTO_6563 ) ) ( CAN_TRAVERSE ?AUTO_6565 ?AUTO_6566 ?AUTO_6563 ) ( AT ?AUTO_6565 ?AUTO_6566 ) ( VISIBLE ?AUTO_6566 ?AUTO_6563 ) ( not ( = ?AUTO_6561 ?AUTO_6566 ) ) ( not ( = ?AUTO_6558 ?AUTO_6566 ) ) ( not ( = ?AUTO_6562 ?AUTO_6566 ) ) ( not ( = ?AUTO_6563 ?AUTO_6566 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6565 ?AUTO_6566 ?AUTO_6563 )
      ( GET_IMAGE_DATA ?AUTO_6556 ?AUTO_6557 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6556 ?AUTO_6557 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6624 - OBJECTIVE
      ?AUTO_6625 - MODE
    )
    :vars
    (
      ?AUTO_6629 - LANDER
      ?AUTO_6627 - WAYPOINT
      ?AUTO_6631 - WAYPOINT
      ?AUTO_6630 - ROVER
      ?AUTO_6628 - CAMERA
      ?AUTO_6626 - WAYPOINT
      ?AUTO_6632 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6629 ?AUTO_6627 ) ( VISIBLE ?AUTO_6631 ?AUTO_6627 ) ( AVAILABLE ?AUTO_6630 ) ( CHANNEL_FREE ?AUTO_6629 ) ( not ( = ?AUTO_6631 ?AUTO_6627 ) ) ( ON_BOARD ?AUTO_6628 ?AUTO_6630 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6630 ) ( SUPPORTS ?AUTO_6628 ?AUTO_6625 ) ( VISIBLE_FROM ?AUTO_6624 ?AUTO_6631 ) ( CALIBRATION_TARGET ?AUTO_6628 ?AUTO_6624 ) ( CAN_TRAVERSE ?AUTO_6630 ?AUTO_6627 ?AUTO_6631 ) ( VISIBLE ?AUTO_6627 ?AUTO_6631 ) ( CAN_TRAVERSE ?AUTO_6630 ?AUTO_6626 ?AUTO_6627 ) ( VISIBLE ?AUTO_6626 ?AUTO_6627 ) ( not ( = ?AUTO_6627 ?AUTO_6626 ) ) ( not ( = ?AUTO_6631 ?AUTO_6626 ) ) ( CAN_TRAVERSE ?AUTO_6630 ?AUTO_6632 ?AUTO_6626 ) ( AT ?AUTO_6630 ?AUTO_6632 ) ( VISIBLE ?AUTO_6632 ?AUTO_6626 ) ( not ( = ?AUTO_6627 ?AUTO_6632 ) ) ( not ( = ?AUTO_6631 ?AUTO_6632 ) ) ( not ( = ?AUTO_6626 ?AUTO_6632 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6630 ?AUTO_6632 ?AUTO_6626 )
      ( GET_IMAGE_DATA ?AUTO_6624 ?AUTO_6625 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6624 ?AUTO_6625 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6665 - OBJECTIVE
      ?AUTO_6666 - MODE
    )
    :vars
    (
      ?AUTO_6672 - LANDER
      ?AUTO_6667 - WAYPOINT
      ?AUTO_6670 - WAYPOINT
      ?AUTO_6669 - ROVER
      ?AUTO_6668 - CAMERA
      ?AUTO_6671 - WAYPOINT
      ?AUTO_6673 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6672 ?AUTO_6667 ) ( VISIBLE ?AUTO_6670 ?AUTO_6667 ) ( AVAILABLE ?AUTO_6669 ) ( CHANNEL_FREE ?AUTO_6672 ) ( not ( = ?AUTO_6670 ?AUTO_6667 ) ) ( ON_BOARD ?AUTO_6668 ?AUTO_6669 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6669 ) ( SUPPORTS ?AUTO_6668 ?AUTO_6666 ) ( VISIBLE_FROM ?AUTO_6665 ?AUTO_6670 ) ( CAN_TRAVERSE ?AUTO_6669 ?AUTO_6671 ?AUTO_6670 ) ( VISIBLE ?AUTO_6671 ?AUTO_6670 ) ( not ( = ?AUTO_6667 ?AUTO_6671 ) ) ( not ( = ?AUTO_6670 ?AUTO_6671 ) ) ( CALIBRATION_TARGET ?AUTO_6668 ?AUTO_6673 ) ( VISIBLE_FROM ?AUTO_6673 ?AUTO_6671 ) ( not ( = ?AUTO_6665 ?AUTO_6673 ) ) ( CAN_TRAVERSE ?AUTO_6669 ?AUTO_6667 ?AUTO_6671 ) ( AT ?AUTO_6669 ?AUTO_6667 ) ( VISIBLE ?AUTO_6667 ?AUTO_6671 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6669 ?AUTO_6667 ?AUTO_6671 )
      ( GET_IMAGE_DATA ?AUTO_6665 ?AUTO_6666 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6665 ?AUTO_6666 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6697 - OBJECTIVE
      ?AUTO_6698 - MODE
    )
    :vars
    (
      ?AUTO_6703 - LANDER
      ?AUTO_6701 - WAYPOINT
      ?AUTO_6702 - WAYPOINT
      ?AUTO_6704 - ROVER
      ?AUTO_6700 - CAMERA
      ?AUTO_6699 - OBJECTIVE
      ?AUTO_6705 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6703 ?AUTO_6701 ) ( VISIBLE ?AUTO_6702 ?AUTO_6701 ) ( AVAILABLE ?AUTO_6704 ) ( CHANNEL_FREE ?AUTO_6703 ) ( not ( = ?AUTO_6702 ?AUTO_6701 ) ) ( ON_BOARD ?AUTO_6700 ?AUTO_6704 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6704 ) ( SUPPORTS ?AUTO_6700 ?AUTO_6698 ) ( VISIBLE_FROM ?AUTO_6697 ?AUTO_6702 ) ( CALIBRATION_TARGET ?AUTO_6700 ?AUTO_6699 ) ( VISIBLE_FROM ?AUTO_6699 ?AUTO_6702 ) ( not ( = ?AUTO_6697 ?AUTO_6699 ) ) ( CAN_TRAVERSE ?AUTO_6704 ?AUTO_6705 ?AUTO_6702 ) ( AT ?AUTO_6704 ?AUTO_6705 ) ( VISIBLE ?AUTO_6705 ?AUTO_6702 ) ( not ( = ?AUTO_6701 ?AUTO_6705 ) ) ( not ( = ?AUTO_6702 ?AUTO_6705 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6704 ?AUTO_6705 ?AUTO_6702 )
      ( GET_IMAGE_DATA ?AUTO_6697 ?AUTO_6698 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6697 ?AUTO_6698 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6706 - OBJECTIVE
      ?AUTO_6707 - MODE
    )
    :vars
    (
      ?AUTO_6713 - LANDER
      ?AUTO_6711 - WAYPOINT
      ?AUTO_6712 - WAYPOINT
      ?AUTO_6710 - ROVER
      ?AUTO_6709 - CAMERA
      ?AUTO_6708 - OBJECTIVE
      ?AUTO_6714 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6713 ?AUTO_6711 ) ( VISIBLE ?AUTO_6712 ?AUTO_6711 ) ( AVAILABLE ?AUTO_6710 ) ( CHANNEL_FREE ?AUTO_6713 ) ( not ( = ?AUTO_6712 ?AUTO_6711 ) ) ( ON_BOARD ?AUTO_6709 ?AUTO_6710 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6710 ) ( SUPPORTS ?AUTO_6709 ?AUTO_6707 ) ( VISIBLE_FROM ?AUTO_6706 ?AUTO_6712 ) ( CALIBRATION_TARGET ?AUTO_6709 ?AUTO_6708 ) ( VISIBLE_FROM ?AUTO_6708 ?AUTO_6712 ) ( not ( = ?AUTO_6706 ?AUTO_6708 ) ) ( CAN_TRAVERSE ?AUTO_6710 ?AUTO_6714 ?AUTO_6712 ) ( VISIBLE ?AUTO_6714 ?AUTO_6712 ) ( not ( = ?AUTO_6711 ?AUTO_6714 ) ) ( not ( = ?AUTO_6712 ?AUTO_6714 ) ) ( CAN_TRAVERSE ?AUTO_6710 ?AUTO_6711 ?AUTO_6714 ) ( AT ?AUTO_6710 ?AUTO_6711 ) ( VISIBLE ?AUTO_6711 ?AUTO_6714 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6710 ?AUTO_6711 ?AUTO_6714 )
      ( GET_IMAGE_DATA ?AUTO_6706 ?AUTO_6707 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6706 ?AUTO_6707 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6715 - OBJECTIVE
      ?AUTO_6716 - MODE
    )
    :vars
    (
      ?AUTO_6722 - LANDER
      ?AUTO_6718 - WAYPOINT
      ?AUTO_6723 - WAYPOINT
      ?AUTO_6721 - ROVER
      ?AUTO_6719 - CAMERA
      ?AUTO_6720 - OBJECTIVE
      ?AUTO_6717 - WAYPOINT
      ?AUTO_6724 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6722 ?AUTO_6718 ) ( VISIBLE ?AUTO_6723 ?AUTO_6718 ) ( AVAILABLE ?AUTO_6721 ) ( CHANNEL_FREE ?AUTO_6722 ) ( not ( = ?AUTO_6723 ?AUTO_6718 ) ) ( ON_BOARD ?AUTO_6719 ?AUTO_6721 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6721 ) ( SUPPORTS ?AUTO_6719 ?AUTO_6716 ) ( VISIBLE_FROM ?AUTO_6715 ?AUTO_6723 ) ( CALIBRATION_TARGET ?AUTO_6719 ?AUTO_6720 ) ( VISIBLE_FROM ?AUTO_6720 ?AUTO_6723 ) ( not ( = ?AUTO_6715 ?AUTO_6720 ) ) ( CAN_TRAVERSE ?AUTO_6721 ?AUTO_6717 ?AUTO_6723 ) ( VISIBLE ?AUTO_6717 ?AUTO_6723 ) ( not ( = ?AUTO_6718 ?AUTO_6717 ) ) ( not ( = ?AUTO_6723 ?AUTO_6717 ) ) ( CAN_TRAVERSE ?AUTO_6721 ?AUTO_6718 ?AUTO_6717 ) ( VISIBLE ?AUTO_6718 ?AUTO_6717 ) ( CAN_TRAVERSE ?AUTO_6721 ?AUTO_6724 ?AUTO_6718 ) ( AT ?AUTO_6721 ?AUTO_6724 ) ( VISIBLE ?AUTO_6724 ?AUTO_6718 ) ( not ( = ?AUTO_6718 ?AUTO_6724 ) ) ( not ( = ?AUTO_6723 ?AUTO_6724 ) ) ( not ( = ?AUTO_6717 ?AUTO_6724 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6721 ?AUTO_6724 ?AUTO_6718 )
      ( GET_IMAGE_DATA ?AUTO_6715 ?AUTO_6716 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6715 ?AUTO_6716 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6795 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6797 - LANDER
      ?AUTO_6796 - WAYPOINT
      ?AUTO_6799 - ROVER
      ?AUTO_6798 - STORE
      ?AUTO_6800 - WAYPOINT
      ?AUTO_6801 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6797 ?AUTO_6796 ) ( VISIBLE ?AUTO_6795 ?AUTO_6796 ) ( AVAILABLE ?AUTO_6799 ) ( CHANNEL_FREE ?AUTO_6797 ) ( not ( = ?AUTO_6795 ?AUTO_6796 ) ) ( AT_SOIL_SAMPLE ?AUTO_6795 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6799 ) ( STORE_OF ?AUTO_6798 ?AUTO_6799 ) ( CAN_TRAVERSE ?AUTO_6799 ?AUTO_6800 ?AUTO_6795 ) ( VISIBLE ?AUTO_6800 ?AUTO_6795 ) ( not ( = ?AUTO_6795 ?AUTO_6800 ) ) ( not ( = ?AUTO_6796 ?AUTO_6800 ) ) ( AT_ROCK_SAMPLE ?AUTO_6800 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6799 ) ( EMPTY ?AUTO_6798 ) ( CAN_TRAVERSE ?AUTO_6799 ?AUTO_6801 ?AUTO_6800 ) ( VISIBLE ?AUTO_6801 ?AUTO_6800 ) ( not ( = ?AUTO_6795 ?AUTO_6801 ) ) ( not ( = ?AUTO_6796 ?AUTO_6801 ) ) ( not ( = ?AUTO_6800 ?AUTO_6801 ) ) ( CAN_TRAVERSE ?AUTO_6799 ?AUTO_6796 ?AUTO_6801 ) ( AT ?AUTO_6799 ?AUTO_6796 ) ( VISIBLE ?AUTO_6796 ?AUTO_6801 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6799 ?AUTO_6796 ?AUTO_6801 )
      ( GET_SOIL_DATA ?AUTO_6795 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6795 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6802 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6803 - LANDER
      ?AUTO_6808 - WAYPOINT
      ?AUTO_6807 - ROVER
      ?AUTO_6804 - STORE
      ?AUTO_6806 - WAYPOINT
      ?AUTO_6805 - WAYPOINT
      ?AUTO_6809 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6803 ?AUTO_6808 ) ( VISIBLE ?AUTO_6802 ?AUTO_6808 ) ( AVAILABLE ?AUTO_6807 ) ( CHANNEL_FREE ?AUTO_6803 ) ( not ( = ?AUTO_6802 ?AUTO_6808 ) ) ( AT_SOIL_SAMPLE ?AUTO_6802 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6807 ) ( STORE_OF ?AUTO_6804 ?AUTO_6807 ) ( CAN_TRAVERSE ?AUTO_6807 ?AUTO_6806 ?AUTO_6802 ) ( VISIBLE ?AUTO_6806 ?AUTO_6802 ) ( not ( = ?AUTO_6802 ?AUTO_6806 ) ) ( not ( = ?AUTO_6808 ?AUTO_6806 ) ) ( AT_ROCK_SAMPLE ?AUTO_6806 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6807 ) ( EMPTY ?AUTO_6804 ) ( CAN_TRAVERSE ?AUTO_6807 ?AUTO_6805 ?AUTO_6806 ) ( VISIBLE ?AUTO_6805 ?AUTO_6806 ) ( not ( = ?AUTO_6802 ?AUTO_6805 ) ) ( not ( = ?AUTO_6808 ?AUTO_6805 ) ) ( not ( = ?AUTO_6806 ?AUTO_6805 ) ) ( CAN_TRAVERSE ?AUTO_6807 ?AUTO_6808 ?AUTO_6805 ) ( VISIBLE ?AUTO_6808 ?AUTO_6805 ) ( CAN_TRAVERSE ?AUTO_6807 ?AUTO_6809 ?AUTO_6808 ) ( AT ?AUTO_6807 ?AUTO_6809 ) ( VISIBLE ?AUTO_6809 ?AUTO_6808 ) ( not ( = ?AUTO_6802 ?AUTO_6809 ) ) ( not ( = ?AUTO_6808 ?AUTO_6809 ) ) ( not ( = ?AUTO_6806 ?AUTO_6809 ) ) ( not ( = ?AUTO_6805 ?AUTO_6809 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6807 ?AUTO_6809 ?AUTO_6808 )
      ( GET_SOIL_DATA ?AUTO_6802 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6802 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6832 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6833 - LANDER
      ?AUTO_6836 - WAYPOINT
      ?AUTO_6834 - ROVER
      ?AUTO_6835 - STORE
      ?AUTO_6837 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6833 ?AUTO_6836 ) ( VISIBLE ?AUTO_6832 ?AUTO_6836 ) ( AVAILABLE ?AUTO_6834 ) ( CHANNEL_FREE ?AUTO_6833 ) ( not ( = ?AUTO_6832 ?AUTO_6836 ) ) ( AT_ROCK_SAMPLE ?AUTO_6832 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6834 ) ( STORE_OF ?AUTO_6835 ?AUTO_6834 ) ( CAN_TRAVERSE ?AUTO_6834 ?AUTO_6837 ?AUTO_6832 ) ( AT ?AUTO_6834 ?AUTO_6837 ) ( VISIBLE ?AUTO_6837 ?AUTO_6832 ) ( not ( = ?AUTO_6832 ?AUTO_6837 ) ) ( not ( = ?AUTO_6836 ?AUTO_6837 ) ) ( AT_SOIL_SAMPLE ?AUTO_6837 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6834 ) ( EMPTY ?AUTO_6835 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6834 ?AUTO_6835 ?AUTO_6837 )
      ( GET_ROCK_DATA ?AUTO_6832 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6832 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6865 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6871 - LANDER
      ?AUTO_6869 - WAYPOINT
      ?AUTO_6870 - ROVER
      ?AUTO_6868 - STORE
      ?AUTO_6867 - WAYPOINT
      ?AUTO_6866 - WAYPOINT
      ?AUTO_6872 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6871 ?AUTO_6869 ) ( VISIBLE ?AUTO_6865 ?AUTO_6869 ) ( AVAILABLE ?AUTO_6870 ) ( CHANNEL_FREE ?AUTO_6871 ) ( not ( = ?AUTO_6865 ?AUTO_6869 ) ) ( AT_ROCK_SAMPLE ?AUTO_6865 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6870 ) ( STORE_OF ?AUTO_6868 ?AUTO_6870 ) ( CAN_TRAVERSE ?AUTO_6870 ?AUTO_6867 ?AUTO_6865 ) ( VISIBLE ?AUTO_6867 ?AUTO_6865 ) ( not ( = ?AUTO_6865 ?AUTO_6867 ) ) ( not ( = ?AUTO_6869 ?AUTO_6867 ) ) ( CAN_TRAVERSE ?AUTO_6870 ?AUTO_6866 ?AUTO_6867 ) ( VISIBLE ?AUTO_6866 ?AUTO_6867 ) ( not ( = ?AUTO_6865 ?AUTO_6866 ) ) ( not ( = ?AUTO_6869 ?AUTO_6866 ) ) ( not ( = ?AUTO_6867 ?AUTO_6866 ) ) ( AT_ROCK_SAMPLE ?AUTO_6866 ) ( EMPTY ?AUTO_6868 ) ( CAN_TRAVERSE ?AUTO_6870 ?AUTO_6872 ?AUTO_6866 ) ( VISIBLE ?AUTO_6872 ?AUTO_6866 ) ( not ( = ?AUTO_6865 ?AUTO_6872 ) ) ( not ( = ?AUTO_6869 ?AUTO_6872 ) ) ( not ( = ?AUTO_6867 ?AUTO_6872 ) ) ( not ( = ?AUTO_6866 ?AUTO_6872 ) ) ( CAN_TRAVERSE ?AUTO_6870 ?AUTO_6869 ?AUTO_6872 ) ( AT ?AUTO_6870 ?AUTO_6869 ) ( VISIBLE ?AUTO_6869 ?AUTO_6872 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6870 ?AUTO_6869 ?AUTO_6872 )
      ( GET_ROCK_DATA ?AUTO_6865 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6865 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6951 - OBJECTIVE
      ?AUTO_6952 - MODE
    )
    :vars
    (
      ?AUTO_6953 - LANDER
      ?AUTO_6956 - WAYPOINT
      ?AUTO_6957 - WAYPOINT
      ?AUTO_6954 - ROVER
      ?AUTO_6955 - WAYPOINT
      ?AUTO_6958 - CAMERA
      ?AUTO_6959 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6953 ?AUTO_6956 ) ( VISIBLE ?AUTO_6957 ?AUTO_6956 ) ( AVAILABLE ?AUTO_6954 ) ( CHANNEL_FREE ?AUTO_6953 ) ( not ( = ?AUTO_6957 ?AUTO_6956 ) ) ( CAN_TRAVERSE ?AUTO_6954 ?AUTO_6955 ?AUTO_6957 ) ( VISIBLE ?AUTO_6955 ?AUTO_6957 ) ( not ( = ?AUTO_6956 ?AUTO_6955 ) ) ( not ( = ?AUTO_6957 ?AUTO_6955 ) ) ( CALIBRATED ?AUTO_6958 ?AUTO_6954 ) ( ON_BOARD ?AUTO_6958 ?AUTO_6954 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6954 ) ( SUPPORTS ?AUTO_6958 ?AUTO_6952 ) ( VISIBLE_FROM ?AUTO_6951 ?AUTO_6955 ) ( CAN_TRAVERSE ?AUTO_6954 ?AUTO_6957 ?AUTO_6955 ) ( VISIBLE ?AUTO_6957 ?AUTO_6955 ) ( CAN_TRAVERSE ?AUTO_6954 ?AUTO_6956 ?AUTO_6957 ) ( VISIBLE ?AUTO_6956 ?AUTO_6957 ) ( CAN_TRAVERSE ?AUTO_6954 ?AUTO_6959 ?AUTO_6956 ) ( AT ?AUTO_6954 ?AUTO_6959 ) ( VISIBLE ?AUTO_6959 ?AUTO_6956 ) ( not ( = ?AUTO_6956 ?AUTO_6959 ) ) ( not ( = ?AUTO_6957 ?AUTO_6959 ) ) ( not ( = ?AUTO_6955 ?AUTO_6959 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6954 ?AUTO_6959 ?AUTO_6956 )
      ( GET_IMAGE_DATA ?AUTO_6951 ?AUTO_6952 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6951 ?AUTO_6952 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6970 - OBJECTIVE
      ?AUTO_6971 - MODE
    )
    :vars
    (
      ?AUTO_6977 - LANDER
      ?AUTO_6978 - WAYPOINT
      ?AUTO_6976 - WAYPOINT
      ?AUTO_6974 - ROVER
      ?AUTO_6972 - WAYPOINT
      ?AUTO_6973 - CAMERA
      ?AUTO_6975 - WAYPOINT
      ?AUTO_6979 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6977 ?AUTO_6978 ) ( VISIBLE ?AUTO_6976 ?AUTO_6978 ) ( AVAILABLE ?AUTO_6974 ) ( CHANNEL_FREE ?AUTO_6977 ) ( not ( = ?AUTO_6976 ?AUTO_6978 ) ) ( CAN_TRAVERSE ?AUTO_6974 ?AUTO_6972 ?AUTO_6976 ) ( VISIBLE ?AUTO_6972 ?AUTO_6976 ) ( not ( = ?AUTO_6978 ?AUTO_6972 ) ) ( not ( = ?AUTO_6976 ?AUTO_6972 ) ) ( ON_BOARD ?AUTO_6973 ?AUTO_6974 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6974 ) ( SUPPORTS ?AUTO_6973 ?AUTO_6971 ) ( VISIBLE_FROM ?AUTO_6970 ?AUTO_6972 ) ( CAN_TRAVERSE ?AUTO_6974 ?AUTO_6976 ?AUTO_6972 ) ( VISIBLE ?AUTO_6976 ?AUTO_6972 ) ( CAN_TRAVERSE ?AUTO_6974 ?AUTO_6978 ?AUTO_6976 ) ( VISIBLE ?AUTO_6978 ?AUTO_6976 ) ( CAN_TRAVERSE ?AUTO_6974 ?AUTO_6975 ?AUTO_6978 ) ( AT ?AUTO_6974 ?AUTO_6975 ) ( VISIBLE ?AUTO_6975 ?AUTO_6978 ) ( not ( = ?AUTO_6978 ?AUTO_6975 ) ) ( not ( = ?AUTO_6976 ?AUTO_6975 ) ) ( not ( = ?AUTO_6972 ?AUTO_6975 ) ) ( CALIBRATION_TARGET ?AUTO_6973 ?AUTO_6979 ) ( VISIBLE_FROM ?AUTO_6979 ?AUTO_6975 ) ( not ( = ?AUTO_6970 ?AUTO_6979 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_6974 ?AUTO_6973 ?AUTO_6979 ?AUTO_6975 )
      ( GET_IMAGE_DATA ?AUTO_6970 ?AUTO_6971 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6970 ?AUTO_6971 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6980 - OBJECTIVE
      ?AUTO_6981 - MODE
    )
    :vars
    (
      ?AUTO_6984 - LANDER
      ?AUTO_6985 - WAYPOINT
      ?AUTO_6987 - WAYPOINT
      ?AUTO_6988 - ROVER
      ?AUTO_6983 - WAYPOINT
      ?AUTO_6982 - CAMERA
      ?AUTO_6986 - WAYPOINT
      ?AUTO_6989 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6984 ?AUTO_6985 ) ( VISIBLE ?AUTO_6987 ?AUTO_6985 ) ( AVAILABLE ?AUTO_6988 ) ( CHANNEL_FREE ?AUTO_6984 ) ( not ( = ?AUTO_6987 ?AUTO_6985 ) ) ( CAN_TRAVERSE ?AUTO_6988 ?AUTO_6983 ?AUTO_6987 ) ( VISIBLE ?AUTO_6983 ?AUTO_6987 ) ( not ( = ?AUTO_6985 ?AUTO_6983 ) ) ( not ( = ?AUTO_6987 ?AUTO_6983 ) ) ( ON_BOARD ?AUTO_6982 ?AUTO_6988 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6988 ) ( SUPPORTS ?AUTO_6982 ?AUTO_6981 ) ( VISIBLE_FROM ?AUTO_6980 ?AUTO_6983 ) ( CAN_TRAVERSE ?AUTO_6988 ?AUTO_6987 ?AUTO_6983 ) ( VISIBLE ?AUTO_6987 ?AUTO_6983 ) ( CAN_TRAVERSE ?AUTO_6988 ?AUTO_6985 ?AUTO_6987 ) ( VISIBLE ?AUTO_6985 ?AUTO_6987 ) ( CAN_TRAVERSE ?AUTO_6988 ?AUTO_6986 ?AUTO_6985 ) ( VISIBLE ?AUTO_6986 ?AUTO_6985 ) ( not ( = ?AUTO_6985 ?AUTO_6986 ) ) ( not ( = ?AUTO_6987 ?AUTO_6986 ) ) ( not ( = ?AUTO_6983 ?AUTO_6986 ) ) ( CALIBRATION_TARGET ?AUTO_6982 ?AUTO_6989 ) ( VISIBLE_FROM ?AUTO_6989 ?AUTO_6986 ) ( not ( = ?AUTO_6980 ?AUTO_6989 ) ) ( CAN_TRAVERSE ?AUTO_6988 ?AUTO_6985 ?AUTO_6986 ) ( AT ?AUTO_6988 ?AUTO_6985 ) ( VISIBLE ?AUTO_6985 ?AUTO_6986 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6988 ?AUTO_6985 ?AUTO_6986 )
      ( GET_IMAGE_DATA ?AUTO_6980 ?AUTO_6981 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6980 ?AUTO_6981 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7005 - OBJECTIVE
      ?AUTO_7006 - MODE
    )
    :vars
    (
      ?AUTO_7010 - LANDER
      ?AUTO_7007 - WAYPOINT
      ?AUTO_7008 - ROVER
      ?AUTO_7009 - WAYPOINT
      ?AUTO_7011 - WAYPOINT
      ?AUTO_7012 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7010 ?AUTO_7007 ) ( HAVE_IMAGE ?AUTO_7008 ?AUTO_7005 ?AUTO_7006 ) ( VISIBLE ?AUTO_7009 ?AUTO_7007 ) ( AVAILABLE ?AUTO_7008 ) ( CHANNEL_FREE ?AUTO_7010 ) ( not ( = ?AUTO_7009 ?AUTO_7007 ) ) ( CAN_TRAVERSE ?AUTO_7008 ?AUTO_7011 ?AUTO_7009 ) ( VISIBLE ?AUTO_7011 ?AUTO_7009 ) ( not ( = ?AUTO_7007 ?AUTO_7011 ) ) ( not ( = ?AUTO_7009 ?AUTO_7011 ) ) ( CAN_TRAVERSE ?AUTO_7008 ?AUTO_7012 ?AUTO_7011 ) ( AT ?AUTO_7008 ?AUTO_7012 ) ( VISIBLE ?AUTO_7012 ?AUTO_7011 ) ( not ( = ?AUTO_7007 ?AUTO_7012 ) ) ( not ( = ?AUTO_7009 ?AUTO_7012 ) ) ( not ( = ?AUTO_7011 ?AUTO_7012 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7008 ?AUTO_7012 ?AUTO_7011 )
      ( GET_IMAGE_DATA ?AUTO_7005 ?AUTO_7006 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7005 ?AUTO_7006 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7013 - OBJECTIVE
      ?AUTO_7014 - MODE
    )
    :vars
    (
      ?AUTO_7018 - LANDER
      ?AUTO_7015 - WAYPOINT
      ?AUTO_7017 - WAYPOINT
      ?AUTO_7016 - ROVER
      ?AUTO_7019 - WAYPOINT
      ?AUTO_7020 - WAYPOINT
      ?AUTO_7021 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7018 ?AUTO_7015 ) ( VISIBLE ?AUTO_7017 ?AUTO_7015 ) ( AVAILABLE ?AUTO_7016 ) ( CHANNEL_FREE ?AUTO_7018 ) ( not ( = ?AUTO_7017 ?AUTO_7015 ) ) ( CAN_TRAVERSE ?AUTO_7016 ?AUTO_7019 ?AUTO_7017 ) ( VISIBLE ?AUTO_7019 ?AUTO_7017 ) ( not ( = ?AUTO_7015 ?AUTO_7019 ) ) ( not ( = ?AUTO_7017 ?AUTO_7019 ) ) ( CAN_TRAVERSE ?AUTO_7016 ?AUTO_7020 ?AUTO_7019 ) ( AT ?AUTO_7016 ?AUTO_7020 ) ( VISIBLE ?AUTO_7020 ?AUTO_7019 ) ( not ( = ?AUTO_7015 ?AUTO_7020 ) ) ( not ( = ?AUTO_7017 ?AUTO_7020 ) ) ( not ( = ?AUTO_7019 ?AUTO_7020 ) ) ( CALIBRATED ?AUTO_7021 ?AUTO_7016 ) ( ON_BOARD ?AUTO_7021 ?AUTO_7016 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7016 ) ( SUPPORTS ?AUTO_7021 ?AUTO_7014 ) ( VISIBLE_FROM ?AUTO_7013 ?AUTO_7020 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_7016 ?AUTO_7020 ?AUTO_7013 ?AUTO_7021 ?AUTO_7014 )
      ( GET_IMAGE_DATA ?AUTO_7013 ?AUTO_7014 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7013 ?AUTO_7014 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7022 - OBJECTIVE
      ?AUTO_7023 - MODE
    )
    :vars
    (
      ?AUTO_7027 - LANDER
      ?AUTO_7026 - WAYPOINT
      ?AUTO_7029 - WAYPOINT
      ?AUTO_7024 - ROVER
      ?AUTO_7028 - WAYPOINT
      ?AUTO_7025 - WAYPOINT
      ?AUTO_7030 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7027 ?AUTO_7026 ) ( VISIBLE ?AUTO_7029 ?AUTO_7026 ) ( AVAILABLE ?AUTO_7024 ) ( CHANNEL_FREE ?AUTO_7027 ) ( not ( = ?AUTO_7029 ?AUTO_7026 ) ) ( CAN_TRAVERSE ?AUTO_7024 ?AUTO_7028 ?AUTO_7029 ) ( VISIBLE ?AUTO_7028 ?AUTO_7029 ) ( not ( = ?AUTO_7026 ?AUTO_7028 ) ) ( not ( = ?AUTO_7029 ?AUTO_7028 ) ) ( CAN_TRAVERSE ?AUTO_7024 ?AUTO_7025 ?AUTO_7028 ) ( VISIBLE ?AUTO_7025 ?AUTO_7028 ) ( not ( = ?AUTO_7026 ?AUTO_7025 ) ) ( not ( = ?AUTO_7029 ?AUTO_7025 ) ) ( not ( = ?AUTO_7028 ?AUTO_7025 ) ) ( CALIBRATED ?AUTO_7030 ?AUTO_7024 ) ( ON_BOARD ?AUTO_7030 ?AUTO_7024 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7024 ) ( SUPPORTS ?AUTO_7030 ?AUTO_7023 ) ( VISIBLE_FROM ?AUTO_7022 ?AUTO_7025 ) ( CAN_TRAVERSE ?AUTO_7024 ?AUTO_7028 ?AUTO_7025 ) ( AT ?AUTO_7024 ?AUTO_7028 ) ( VISIBLE ?AUTO_7028 ?AUTO_7025 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7024 ?AUTO_7028 ?AUTO_7025 )
      ( GET_IMAGE_DATA ?AUTO_7022 ?AUTO_7023 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7022 ?AUTO_7023 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7031 - OBJECTIVE
      ?AUTO_7032 - MODE
    )
    :vars
    (
      ?AUTO_7039 - LANDER
      ?AUTO_7037 - WAYPOINT
      ?AUTO_7036 - WAYPOINT
      ?AUTO_7034 - ROVER
      ?AUTO_7038 - WAYPOINT
      ?AUTO_7033 - WAYPOINT
      ?AUTO_7035 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7039 ?AUTO_7037 ) ( VISIBLE ?AUTO_7036 ?AUTO_7037 ) ( AVAILABLE ?AUTO_7034 ) ( CHANNEL_FREE ?AUTO_7039 ) ( not ( = ?AUTO_7036 ?AUTO_7037 ) ) ( CAN_TRAVERSE ?AUTO_7034 ?AUTO_7038 ?AUTO_7036 ) ( VISIBLE ?AUTO_7038 ?AUTO_7036 ) ( not ( = ?AUTO_7037 ?AUTO_7038 ) ) ( not ( = ?AUTO_7036 ?AUTO_7038 ) ) ( CAN_TRAVERSE ?AUTO_7034 ?AUTO_7033 ?AUTO_7038 ) ( VISIBLE ?AUTO_7033 ?AUTO_7038 ) ( not ( = ?AUTO_7037 ?AUTO_7033 ) ) ( not ( = ?AUTO_7036 ?AUTO_7033 ) ) ( not ( = ?AUTO_7038 ?AUTO_7033 ) ) ( CALIBRATED ?AUTO_7035 ?AUTO_7034 ) ( ON_BOARD ?AUTO_7035 ?AUTO_7034 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7034 ) ( SUPPORTS ?AUTO_7035 ?AUTO_7032 ) ( VISIBLE_FROM ?AUTO_7031 ?AUTO_7033 ) ( CAN_TRAVERSE ?AUTO_7034 ?AUTO_7038 ?AUTO_7033 ) ( VISIBLE ?AUTO_7038 ?AUTO_7033 ) ( CAN_TRAVERSE ?AUTO_7034 ?AUTO_7036 ?AUTO_7038 ) ( AT ?AUTO_7034 ?AUTO_7036 ) ( VISIBLE ?AUTO_7036 ?AUTO_7038 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7034 ?AUTO_7036 ?AUTO_7038 )
      ( GET_IMAGE_DATA ?AUTO_7031 ?AUTO_7032 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7031 ?AUTO_7032 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7040 - OBJECTIVE
      ?AUTO_7041 - MODE
    )
    :vars
    (
      ?AUTO_7042 - LANDER
      ?AUTO_7046 - WAYPOINT
      ?AUTO_7047 - WAYPOINT
      ?AUTO_7043 - ROVER
      ?AUTO_7045 - WAYPOINT
      ?AUTO_7044 - WAYPOINT
      ?AUTO_7048 - CAMERA
      ?AUTO_7049 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7042 ?AUTO_7046 ) ( VISIBLE ?AUTO_7047 ?AUTO_7046 ) ( AVAILABLE ?AUTO_7043 ) ( CHANNEL_FREE ?AUTO_7042 ) ( not ( = ?AUTO_7047 ?AUTO_7046 ) ) ( CAN_TRAVERSE ?AUTO_7043 ?AUTO_7045 ?AUTO_7047 ) ( VISIBLE ?AUTO_7045 ?AUTO_7047 ) ( not ( = ?AUTO_7046 ?AUTO_7045 ) ) ( not ( = ?AUTO_7047 ?AUTO_7045 ) ) ( CAN_TRAVERSE ?AUTO_7043 ?AUTO_7044 ?AUTO_7045 ) ( VISIBLE ?AUTO_7044 ?AUTO_7045 ) ( not ( = ?AUTO_7046 ?AUTO_7044 ) ) ( not ( = ?AUTO_7047 ?AUTO_7044 ) ) ( not ( = ?AUTO_7045 ?AUTO_7044 ) ) ( ON_BOARD ?AUTO_7048 ?AUTO_7043 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7043 ) ( SUPPORTS ?AUTO_7048 ?AUTO_7041 ) ( VISIBLE_FROM ?AUTO_7040 ?AUTO_7044 ) ( CAN_TRAVERSE ?AUTO_7043 ?AUTO_7045 ?AUTO_7044 ) ( VISIBLE ?AUTO_7045 ?AUTO_7044 ) ( CAN_TRAVERSE ?AUTO_7043 ?AUTO_7047 ?AUTO_7045 ) ( AT ?AUTO_7043 ?AUTO_7047 ) ( VISIBLE ?AUTO_7047 ?AUTO_7045 ) ( CALIBRATION_TARGET ?AUTO_7048 ?AUTO_7049 ) ( VISIBLE_FROM ?AUTO_7049 ?AUTO_7047 ) ( not ( = ?AUTO_7040 ?AUTO_7049 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_7043 ?AUTO_7048 ?AUTO_7049 ?AUTO_7047 )
      ( GET_IMAGE_DATA ?AUTO_7040 ?AUTO_7041 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7040 ?AUTO_7041 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7050 - OBJECTIVE
      ?AUTO_7051 - MODE
    )
    :vars
    (
      ?AUTO_7053 - LANDER
      ?AUTO_7055 - WAYPOINT
      ?AUTO_7054 - WAYPOINT
      ?AUTO_7052 - ROVER
      ?AUTO_7057 - WAYPOINT
      ?AUTO_7056 - WAYPOINT
      ?AUTO_7059 - CAMERA
      ?AUTO_7058 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7053 ?AUTO_7055 ) ( VISIBLE ?AUTO_7054 ?AUTO_7055 ) ( AVAILABLE ?AUTO_7052 ) ( CHANNEL_FREE ?AUTO_7053 ) ( not ( = ?AUTO_7054 ?AUTO_7055 ) ) ( CAN_TRAVERSE ?AUTO_7052 ?AUTO_7057 ?AUTO_7054 ) ( VISIBLE ?AUTO_7057 ?AUTO_7054 ) ( not ( = ?AUTO_7055 ?AUTO_7057 ) ) ( not ( = ?AUTO_7054 ?AUTO_7057 ) ) ( CAN_TRAVERSE ?AUTO_7052 ?AUTO_7056 ?AUTO_7057 ) ( VISIBLE ?AUTO_7056 ?AUTO_7057 ) ( not ( = ?AUTO_7055 ?AUTO_7056 ) ) ( not ( = ?AUTO_7054 ?AUTO_7056 ) ) ( not ( = ?AUTO_7057 ?AUTO_7056 ) ) ( ON_BOARD ?AUTO_7059 ?AUTO_7052 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7052 ) ( SUPPORTS ?AUTO_7059 ?AUTO_7051 ) ( VISIBLE_FROM ?AUTO_7050 ?AUTO_7056 ) ( CAN_TRAVERSE ?AUTO_7052 ?AUTO_7057 ?AUTO_7056 ) ( VISIBLE ?AUTO_7057 ?AUTO_7056 ) ( CAN_TRAVERSE ?AUTO_7052 ?AUTO_7054 ?AUTO_7057 ) ( VISIBLE ?AUTO_7054 ?AUTO_7057 ) ( CALIBRATION_TARGET ?AUTO_7059 ?AUTO_7058 ) ( VISIBLE_FROM ?AUTO_7058 ?AUTO_7054 ) ( not ( = ?AUTO_7050 ?AUTO_7058 ) ) ( AT ?AUTO_7052 ?AUTO_7057 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7052 ?AUTO_7057 ?AUTO_7054 )
      ( GET_IMAGE_DATA ?AUTO_7050 ?AUTO_7051 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7050 ?AUTO_7051 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7099 - OBJECTIVE
      ?AUTO_7100 - MODE
    )
    :vars
    (
      ?AUTO_7106 - LANDER
      ?AUTO_7101 - WAYPOINT
      ?AUTO_7104 - WAYPOINT
      ?AUTO_7105 - ROVER
      ?AUTO_7103 - CAMERA
      ?AUTO_7107 - WAYPOINT
      ?AUTO_7102 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7106 ?AUTO_7101 ) ( VISIBLE ?AUTO_7104 ?AUTO_7101 ) ( AVAILABLE ?AUTO_7105 ) ( CHANNEL_FREE ?AUTO_7106 ) ( not ( = ?AUTO_7104 ?AUTO_7101 ) ) ( ON_BOARD ?AUTO_7103 ?AUTO_7105 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7105 ) ( SUPPORTS ?AUTO_7103 ?AUTO_7100 ) ( VISIBLE_FROM ?AUTO_7099 ?AUTO_7104 ) ( CALIBRATION_TARGET ?AUTO_7103 ?AUTO_7099 ) ( CAN_TRAVERSE ?AUTO_7105 ?AUTO_7107 ?AUTO_7104 ) ( VISIBLE ?AUTO_7107 ?AUTO_7104 ) ( not ( = ?AUTO_7101 ?AUTO_7107 ) ) ( not ( = ?AUTO_7104 ?AUTO_7107 ) ) ( CAN_TRAVERSE ?AUTO_7105 ?AUTO_7102 ?AUTO_7107 ) ( VISIBLE ?AUTO_7102 ?AUTO_7107 ) ( not ( = ?AUTO_7101 ?AUTO_7102 ) ) ( not ( = ?AUTO_7104 ?AUTO_7102 ) ) ( not ( = ?AUTO_7107 ?AUTO_7102 ) ) ( CAN_TRAVERSE ?AUTO_7105 ?AUTO_7101 ?AUTO_7102 ) ( AT ?AUTO_7105 ?AUTO_7101 ) ( VISIBLE ?AUTO_7101 ?AUTO_7102 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7105 ?AUTO_7101 ?AUTO_7102 )
      ( GET_IMAGE_DATA ?AUTO_7099 ?AUTO_7100 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7099 ?AUTO_7100 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7173 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7177 - LANDER
      ?AUTO_7175 - WAYPOINT
      ?AUTO_7176 - WAYPOINT
      ?AUTO_7179 - ROVER
      ?AUTO_7174 - STORE
      ?AUTO_7178 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7177 ?AUTO_7175 ) ( VISIBLE ?AUTO_7176 ?AUTO_7175 ) ( AVAILABLE ?AUTO_7179 ) ( CHANNEL_FREE ?AUTO_7177 ) ( not ( = ?AUTO_7173 ?AUTO_7176 ) ) ( not ( = ?AUTO_7173 ?AUTO_7175 ) ) ( not ( = ?AUTO_7176 ?AUTO_7175 ) ) ( CAN_TRAVERSE ?AUTO_7179 ?AUTO_7173 ?AUTO_7176 ) ( VISIBLE ?AUTO_7173 ?AUTO_7176 ) ( AT_SOIL_SAMPLE ?AUTO_7173 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7179 ) ( STORE_OF ?AUTO_7174 ?AUTO_7179 ) ( EMPTY ?AUTO_7174 ) ( CAN_TRAVERSE ?AUTO_7179 ?AUTO_7178 ?AUTO_7173 ) ( VISIBLE ?AUTO_7178 ?AUTO_7173 ) ( not ( = ?AUTO_7173 ?AUTO_7178 ) ) ( not ( = ?AUTO_7175 ?AUTO_7178 ) ) ( not ( = ?AUTO_7176 ?AUTO_7178 ) ) ( CAN_TRAVERSE ?AUTO_7179 ?AUTO_7175 ?AUTO_7178 ) ( VISIBLE ?AUTO_7175 ?AUTO_7178 ) ( CAN_TRAVERSE ?AUTO_7179 ?AUTO_7176 ?AUTO_7175 ) ( AT ?AUTO_7179 ?AUTO_7176 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7179 ?AUTO_7176 ?AUTO_7175 )
      ( GET_SOIL_DATA ?AUTO_7173 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7173 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7219 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7220 - LANDER
      ?AUTO_7221 - WAYPOINT
      ?AUTO_7225 - WAYPOINT
      ?AUTO_7224 - ROVER
      ?AUTO_7223 - STORE
      ?AUTO_7222 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7220 ?AUTO_7221 ) ( VISIBLE ?AUTO_7225 ?AUTO_7221 ) ( AVAILABLE ?AUTO_7224 ) ( CHANNEL_FREE ?AUTO_7220 ) ( not ( = ?AUTO_7219 ?AUTO_7225 ) ) ( not ( = ?AUTO_7219 ?AUTO_7221 ) ) ( not ( = ?AUTO_7225 ?AUTO_7221 ) ) ( CAN_TRAVERSE ?AUTO_7224 ?AUTO_7219 ?AUTO_7225 ) ( VISIBLE ?AUTO_7219 ?AUTO_7225 ) ( AT_SOIL_SAMPLE ?AUTO_7219 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7224 ) ( STORE_OF ?AUTO_7223 ?AUTO_7224 ) ( CAN_TRAVERSE ?AUTO_7224 ?AUTO_7225 ?AUTO_7219 ) ( VISIBLE ?AUTO_7225 ?AUTO_7219 ) ( CAN_TRAVERSE ?AUTO_7224 ?AUTO_7222 ?AUTO_7225 ) ( AT ?AUTO_7224 ?AUTO_7222 ) ( VISIBLE ?AUTO_7222 ?AUTO_7225 ) ( not ( = ?AUTO_7219 ?AUTO_7222 ) ) ( not ( = ?AUTO_7221 ?AUTO_7222 ) ) ( not ( = ?AUTO_7225 ?AUTO_7222 ) ) ( FULL ?AUTO_7223 ) )
    :subtasks
    ( ( !DROP ?AUTO_7224 ?AUTO_7223 )
      ( GET_SOIL_DATA ?AUTO_7219 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7219 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7227 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7231 - LANDER
      ?AUTO_7233 - WAYPOINT
      ?AUTO_7229 - WAYPOINT
      ?AUTO_7228 - ROVER
      ?AUTO_7232 - STORE
      ?AUTO_7230 - WAYPOINT
      ?AUTO_7234 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7231 ?AUTO_7233 ) ( VISIBLE ?AUTO_7229 ?AUTO_7233 ) ( AVAILABLE ?AUTO_7228 ) ( CHANNEL_FREE ?AUTO_7231 ) ( not ( = ?AUTO_7227 ?AUTO_7229 ) ) ( not ( = ?AUTO_7227 ?AUTO_7233 ) ) ( not ( = ?AUTO_7229 ?AUTO_7233 ) ) ( CAN_TRAVERSE ?AUTO_7228 ?AUTO_7227 ?AUTO_7229 ) ( VISIBLE ?AUTO_7227 ?AUTO_7229 ) ( AT_SOIL_SAMPLE ?AUTO_7227 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7228 ) ( STORE_OF ?AUTO_7232 ?AUTO_7228 ) ( EMPTY ?AUTO_7232 ) ( CAN_TRAVERSE ?AUTO_7228 ?AUTO_7229 ?AUTO_7227 ) ( VISIBLE ?AUTO_7229 ?AUTO_7227 ) ( CAN_TRAVERSE ?AUTO_7228 ?AUTO_7230 ?AUTO_7229 ) ( VISIBLE ?AUTO_7230 ?AUTO_7229 ) ( not ( = ?AUTO_7227 ?AUTO_7230 ) ) ( not ( = ?AUTO_7233 ?AUTO_7230 ) ) ( not ( = ?AUTO_7229 ?AUTO_7230 ) ) ( CAN_TRAVERSE ?AUTO_7228 ?AUTO_7234 ?AUTO_7230 ) ( AT ?AUTO_7228 ?AUTO_7234 ) ( VISIBLE ?AUTO_7234 ?AUTO_7230 ) ( not ( = ?AUTO_7227 ?AUTO_7234 ) ) ( not ( = ?AUTO_7233 ?AUTO_7234 ) ) ( not ( = ?AUTO_7229 ?AUTO_7234 ) ) ( not ( = ?AUTO_7230 ?AUTO_7234 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7228 ?AUTO_7234 ?AUTO_7230 )
      ( GET_SOIL_DATA ?AUTO_7227 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7227 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7235 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7238 - LANDER
      ?AUTO_7240 - WAYPOINT
      ?AUTO_7236 - WAYPOINT
      ?AUTO_7237 - ROVER
      ?AUTO_7239 - STORE
      ?AUTO_7241 - WAYPOINT
      ?AUTO_7242 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7238 ?AUTO_7240 ) ( VISIBLE ?AUTO_7236 ?AUTO_7240 ) ( AVAILABLE ?AUTO_7237 ) ( CHANNEL_FREE ?AUTO_7238 ) ( not ( = ?AUTO_7235 ?AUTO_7236 ) ) ( not ( = ?AUTO_7235 ?AUTO_7240 ) ) ( not ( = ?AUTO_7236 ?AUTO_7240 ) ) ( CAN_TRAVERSE ?AUTO_7237 ?AUTO_7235 ?AUTO_7236 ) ( VISIBLE ?AUTO_7235 ?AUTO_7236 ) ( AT_SOIL_SAMPLE ?AUTO_7235 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7237 ) ( STORE_OF ?AUTO_7239 ?AUTO_7237 ) ( EMPTY ?AUTO_7239 ) ( CAN_TRAVERSE ?AUTO_7237 ?AUTO_7236 ?AUTO_7235 ) ( VISIBLE ?AUTO_7236 ?AUTO_7235 ) ( CAN_TRAVERSE ?AUTO_7237 ?AUTO_7241 ?AUTO_7236 ) ( VISIBLE ?AUTO_7241 ?AUTO_7236 ) ( not ( = ?AUTO_7235 ?AUTO_7241 ) ) ( not ( = ?AUTO_7240 ?AUTO_7241 ) ) ( not ( = ?AUTO_7236 ?AUTO_7241 ) ) ( CAN_TRAVERSE ?AUTO_7237 ?AUTO_7242 ?AUTO_7241 ) ( VISIBLE ?AUTO_7242 ?AUTO_7241 ) ( not ( = ?AUTO_7235 ?AUTO_7242 ) ) ( not ( = ?AUTO_7240 ?AUTO_7242 ) ) ( not ( = ?AUTO_7236 ?AUTO_7242 ) ) ( not ( = ?AUTO_7241 ?AUTO_7242 ) ) ( CAN_TRAVERSE ?AUTO_7237 ?AUTO_7240 ?AUTO_7242 ) ( AT ?AUTO_7237 ?AUTO_7240 ) ( VISIBLE ?AUTO_7240 ?AUTO_7242 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7237 ?AUTO_7240 ?AUTO_7242 )
      ( GET_SOIL_DATA ?AUTO_7235 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7235 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7475 - OBJECTIVE
      ?AUTO_7476 - MODE
    )
    :vars
    (
      ?AUTO_7479 - LANDER
      ?AUTO_7482 - WAYPOINT
      ?AUTO_7477 - WAYPOINT
      ?AUTO_7478 - ROVER
      ?AUTO_7480 - CAMERA
      ?AUTO_7483 - WAYPOINT
      ?AUTO_7481 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7479 ?AUTO_7482 ) ( VISIBLE ?AUTO_7477 ?AUTO_7482 ) ( AVAILABLE ?AUTO_7478 ) ( CHANNEL_FREE ?AUTO_7479 ) ( not ( = ?AUTO_7477 ?AUTO_7482 ) ) ( ON_BOARD ?AUTO_7480 ?AUTO_7478 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7478 ) ( SUPPORTS ?AUTO_7480 ?AUTO_7476 ) ( VISIBLE_FROM ?AUTO_7475 ?AUTO_7477 ) ( CAN_TRAVERSE ?AUTO_7478 ?AUTO_7482 ?AUTO_7477 ) ( VISIBLE ?AUTO_7482 ?AUTO_7477 ) ( CAN_TRAVERSE ?AUTO_7478 ?AUTO_7483 ?AUTO_7482 ) ( VISIBLE ?AUTO_7483 ?AUTO_7482 ) ( not ( = ?AUTO_7482 ?AUTO_7483 ) ) ( not ( = ?AUTO_7477 ?AUTO_7483 ) ) ( CALIBRATION_TARGET ?AUTO_7480 ?AUTO_7481 ) ( VISIBLE_FROM ?AUTO_7481 ?AUTO_7483 ) ( not ( = ?AUTO_7475 ?AUTO_7481 ) ) ( CAN_TRAVERSE ?AUTO_7478 ?AUTO_7482 ?AUTO_7483 ) ( VISIBLE ?AUTO_7482 ?AUTO_7483 ) ( CAN_TRAVERSE ?AUTO_7478 ?AUTO_7477 ?AUTO_7482 ) ( AT ?AUTO_7478 ?AUTO_7477 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7478 ?AUTO_7477 ?AUTO_7482 )
      ( GET_IMAGE_DATA ?AUTO_7475 ?AUTO_7476 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7475 ?AUTO_7476 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7755 - OBJECTIVE
      ?AUTO_7756 - MODE
    )
    :vars
    (
      ?AUTO_7762 - LANDER
      ?AUTO_7763 - WAYPOINT
      ?AUTO_7757 - WAYPOINT
      ?AUTO_7759 - ROVER
      ?AUTO_7761 - CAMERA
      ?AUTO_7760 - WAYPOINT
      ?AUTO_7758 - WAYPOINT
      ?AUTO_7764 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7762 ?AUTO_7763 ) ( VISIBLE ?AUTO_7757 ?AUTO_7763 ) ( AVAILABLE ?AUTO_7759 ) ( CHANNEL_FREE ?AUTO_7762 ) ( not ( = ?AUTO_7757 ?AUTO_7763 ) ) ( ON_BOARD ?AUTO_7761 ?AUTO_7759 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7759 ) ( SUPPORTS ?AUTO_7761 ?AUTO_7756 ) ( VISIBLE_FROM ?AUTO_7755 ?AUTO_7757 ) ( CAN_TRAVERSE ?AUTO_7759 ?AUTO_7760 ?AUTO_7757 ) ( VISIBLE ?AUTO_7760 ?AUTO_7757 ) ( not ( = ?AUTO_7763 ?AUTO_7760 ) ) ( not ( = ?AUTO_7757 ?AUTO_7760 ) ) ( CAN_TRAVERSE ?AUTO_7759 ?AUTO_7758 ?AUTO_7760 ) ( VISIBLE ?AUTO_7758 ?AUTO_7760 ) ( not ( = ?AUTO_7763 ?AUTO_7758 ) ) ( not ( = ?AUTO_7757 ?AUTO_7758 ) ) ( not ( = ?AUTO_7760 ?AUTO_7758 ) ) ( CALIBRATION_TARGET ?AUTO_7761 ?AUTO_7764 ) ( VISIBLE_FROM ?AUTO_7764 ?AUTO_7758 ) ( not ( = ?AUTO_7755 ?AUTO_7764 ) ) ( CAN_TRAVERSE ?AUTO_7759 ?AUTO_7760 ?AUTO_7758 ) ( AT ?AUTO_7759 ?AUTO_7760 ) ( VISIBLE ?AUTO_7760 ?AUTO_7758 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7759 ?AUTO_7760 ?AUTO_7758 )
      ( GET_IMAGE_DATA ?AUTO_7755 ?AUTO_7756 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7755 ?AUTO_7756 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7767 - OBJECTIVE
      ?AUTO_7768 - MODE
    )
    :vars
    (
      ?AUTO_7770 - LANDER
      ?AUTO_7772 - WAYPOINT
      ?AUTO_7769 - WAYPOINT
      ?AUTO_7776 - ROVER
      ?AUTO_7774 - CAMERA
      ?AUTO_7775 - WAYPOINT
      ?AUTO_7771 - WAYPOINT
      ?AUTO_7773 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7770 ?AUTO_7772 ) ( VISIBLE ?AUTO_7769 ?AUTO_7772 ) ( AVAILABLE ?AUTO_7776 ) ( CHANNEL_FREE ?AUTO_7770 ) ( not ( = ?AUTO_7769 ?AUTO_7772 ) ) ( ON_BOARD ?AUTO_7774 ?AUTO_7776 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7776 ) ( SUPPORTS ?AUTO_7774 ?AUTO_7768 ) ( VISIBLE_FROM ?AUTO_7767 ?AUTO_7769 ) ( CAN_TRAVERSE ?AUTO_7776 ?AUTO_7775 ?AUTO_7769 ) ( VISIBLE ?AUTO_7775 ?AUTO_7769 ) ( not ( = ?AUTO_7772 ?AUTO_7775 ) ) ( not ( = ?AUTO_7769 ?AUTO_7775 ) ) ( CAN_TRAVERSE ?AUTO_7776 ?AUTO_7771 ?AUTO_7775 ) ( VISIBLE ?AUTO_7771 ?AUTO_7775 ) ( not ( = ?AUTO_7772 ?AUTO_7771 ) ) ( not ( = ?AUTO_7769 ?AUTO_7771 ) ) ( not ( = ?AUTO_7775 ?AUTO_7771 ) ) ( CALIBRATION_TARGET ?AUTO_7774 ?AUTO_7773 ) ( VISIBLE_FROM ?AUTO_7773 ?AUTO_7771 ) ( not ( = ?AUTO_7767 ?AUTO_7773 ) ) ( CAN_TRAVERSE ?AUTO_7776 ?AUTO_7775 ?AUTO_7771 ) ( VISIBLE ?AUTO_7775 ?AUTO_7771 ) ( CAN_TRAVERSE ?AUTO_7776 ?AUTO_7772 ?AUTO_7775 ) ( AT ?AUTO_7776 ?AUTO_7772 ) ( VISIBLE ?AUTO_7772 ?AUTO_7775 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7776 ?AUTO_7772 ?AUTO_7775 )
      ( GET_IMAGE_DATA ?AUTO_7767 ?AUTO_7768 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7767 ?AUTO_7768 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7807 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7812 - LANDER
      ?AUTO_7813 - WAYPOINT
      ?AUTO_7810 - ROVER
      ?AUTO_7809 - STORE
      ?AUTO_7808 - WAYPOINT
      ?AUTO_7811 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7812 ?AUTO_7813 ) ( VISIBLE ?AUTO_7807 ?AUTO_7813 ) ( AVAILABLE ?AUTO_7810 ) ( CHANNEL_FREE ?AUTO_7812 ) ( not ( = ?AUTO_7807 ?AUTO_7813 ) ) ( AT_SOIL_SAMPLE ?AUTO_7807 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7810 ) ( STORE_OF ?AUTO_7809 ?AUTO_7810 ) ( CAN_TRAVERSE ?AUTO_7810 ?AUTO_7808 ?AUTO_7807 ) ( VISIBLE ?AUTO_7808 ?AUTO_7807 ) ( not ( = ?AUTO_7807 ?AUTO_7808 ) ) ( not ( = ?AUTO_7813 ?AUTO_7808 ) ) ( CAN_TRAVERSE ?AUTO_7810 ?AUTO_7811 ?AUTO_7808 ) ( AT ?AUTO_7810 ?AUTO_7811 ) ( VISIBLE ?AUTO_7811 ?AUTO_7808 ) ( not ( = ?AUTO_7807 ?AUTO_7811 ) ) ( not ( = ?AUTO_7813 ?AUTO_7811 ) ) ( not ( = ?AUTO_7808 ?AUTO_7811 ) ) ( FULL ?AUTO_7809 ) )
    :subtasks
    ( ( !DROP ?AUTO_7810 ?AUTO_7809 )
      ( GET_SOIL_DATA ?AUTO_7807 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7807 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7840 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7841 - LANDER
      ?AUTO_7843 - WAYPOINT
      ?AUTO_7845 - ROVER
      ?AUTO_7844 - STORE
      ?AUTO_7842 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7841 ?AUTO_7843 ) ( VISIBLE ?AUTO_7840 ?AUTO_7843 ) ( AVAILABLE ?AUTO_7845 ) ( CHANNEL_FREE ?AUTO_7841 ) ( not ( = ?AUTO_7840 ?AUTO_7843 ) ) ( AT_SOIL_SAMPLE ?AUTO_7840 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7845 ) ( STORE_OF ?AUTO_7844 ?AUTO_7845 ) ( CAN_TRAVERSE ?AUTO_7845 ?AUTO_7842 ?AUTO_7840 ) ( VISIBLE ?AUTO_7842 ?AUTO_7840 ) ( not ( = ?AUTO_7840 ?AUTO_7842 ) ) ( not ( = ?AUTO_7843 ?AUTO_7842 ) ) ( CAN_TRAVERSE ?AUTO_7845 ?AUTO_7843 ?AUTO_7842 ) ( AT ?AUTO_7845 ?AUTO_7843 ) ( VISIBLE ?AUTO_7843 ?AUTO_7842 ) ( FULL ?AUTO_7844 ) )
    :subtasks
    ( ( !DROP ?AUTO_7845 ?AUTO_7844 )
      ( GET_SOIL_DATA ?AUTO_7840 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7840 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7903 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7908 - LANDER
      ?AUTO_7909 - WAYPOINT
      ?AUTO_7905 - ROVER
      ?AUTO_7906 - STORE
      ?AUTO_7907 - WAYPOINT
      ?AUTO_7904 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7908 ?AUTO_7909 ) ( VISIBLE ?AUTO_7903 ?AUTO_7909 ) ( AVAILABLE ?AUTO_7905 ) ( CHANNEL_FREE ?AUTO_7908 ) ( not ( = ?AUTO_7903 ?AUTO_7909 ) ) ( AT_ROCK_SAMPLE ?AUTO_7903 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7905 ) ( STORE_OF ?AUTO_7906 ?AUTO_7905 ) ( CAN_TRAVERSE ?AUTO_7905 ?AUTO_7907 ?AUTO_7903 ) ( VISIBLE ?AUTO_7907 ?AUTO_7903 ) ( not ( = ?AUTO_7903 ?AUTO_7907 ) ) ( not ( = ?AUTO_7909 ?AUTO_7907 ) ) ( AT_SOIL_SAMPLE ?AUTO_7907 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7905 ) ( CAN_TRAVERSE ?AUTO_7905 ?AUTO_7904 ?AUTO_7907 ) ( AT ?AUTO_7905 ?AUTO_7904 ) ( VISIBLE ?AUTO_7904 ?AUTO_7907 ) ( not ( = ?AUTO_7903 ?AUTO_7904 ) ) ( not ( = ?AUTO_7909 ?AUTO_7904 ) ) ( not ( = ?AUTO_7907 ?AUTO_7904 ) ) ( FULL ?AUTO_7906 ) )
    :subtasks
    ( ( !DROP ?AUTO_7905 ?AUTO_7906 )
      ( GET_ROCK_DATA ?AUTO_7903 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7903 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7946 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7947 - LANDER
      ?AUTO_7952 - WAYPOINT
      ?AUTO_7948 - WAYPOINT
      ?AUTO_7950 - ROVER
      ?AUTO_7949 - WAYPOINT
      ?AUTO_7951 - STORE
      ?AUTO_7953 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7947 ?AUTO_7952 ) ( VISIBLE ?AUTO_7948 ?AUTO_7952 ) ( AVAILABLE ?AUTO_7950 ) ( CHANNEL_FREE ?AUTO_7947 ) ( not ( = ?AUTO_7946 ?AUTO_7948 ) ) ( not ( = ?AUTO_7946 ?AUTO_7952 ) ) ( not ( = ?AUTO_7948 ?AUTO_7952 ) ) ( CAN_TRAVERSE ?AUTO_7950 ?AUTO_7949 ?AUTO_7948 ) ( VISIBLE ?AUTO_7949 ?AUTO_7948 ) ( not ( = ?AUTO_7946 ?AUTO_7949 ) ) ( not ( = ?AUTO_7952 ?AUTO_7949 ) ) ( not ( = ?AUTO_7948 ?AUTO_7949 ) ) ( CAN_TRAVERSE ?AUTO_7950 ?AUTO_7946 ?AUTO_7949 ) ( VISIBLE ?AUTO_7946 ?AUTO_7949 ) ( AT_ROCK_SAMPLE ?AUTO_7946 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7950 ) ( STORE_OF ?AUTO_7951 ?AUTO_7950 ) ( EMPTY ?AUTO_7951 ) ( CAN_TRAVERSE ?AUTO_7950 ?AUTO_7953 ?AUTO_7946 ) ( AT ?AUTO_7950 ?AUTO_7953 ) ( VISIBLE ?AUTO_7953 ?AUTO_7946 ) ( not ( = ?AUTO_7946 ?AUTO_7953 ) ) ( not ( = ?AUTO_7952 ?AUTO_7953 ) ) ( not ( = ?AUTO_7948 ?AUTO_7953 ) ) ( not ( = ?AUTO_7949 ?AUTO_7953 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7950 ?AUTO_7953 ?AUTO_7946 )
      ( GET_ROCK_DATA ?AUTO_7946 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7946 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7954 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7957 - LANDER
      ?AUTO_7955 - WAYPOINT
      ?AUTO_7958 - WAYPOINT
      ?AUTO_7959 - ROVER
      ?AUTO_7960 - WAYPOINT
      ?AUTO_7956 - STORE
      ?AUTO_7961 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7957 ?AUTO_7955 ) ( VISIBLE ?AUTO_7958 ?AUTO_7955 ) ( AVAILABLE ?AUTO_7959 ) ( CHANNEL_FREE ?AUTO_7957 ) ( not ( = ?AUTO_7954 ?AUTO_7958 ) ) ( not ( = ?AUTO_7954 ?AUTO_7955 ) ) ( not ( = ?AUTO_7958 ?AUTO_7955 ) ) ( CAN_TRAVERSE ?AUTO_7959 ?AUTO_7960 ?AUTO_7958 ) ( VISIBLE ?AUTO_7960 ?AUTO_7958 ) ( not ( = ?AUTO_7954 ?AUTO_7960 ) ) ( not ( = ?AUTO_7955 ?AUTO_7960 ) ) ( not ( = ?AUTO_7958 ?AUTO_7960 ) ) ( CAN_TRAVERSE ?AUTO_7959 ?AUTO_7954 ?AUTO_7960 ) ( VISIBLE ?AUTO_7954 ?AUTO_7960 ) ( AT_ROCK_SAMPLE ?AUTO_7954 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7959 ) ( STORE_OF ?AUTO_7956 ?AUTO_7959 ) ( CAN_TRAVERSE ?AUTO_7959 ?AUTO_7961 ?AUTO_7954 ) ( AT ?AUTO_7959 ?AUTO_7961 ) ( VISIBLE ?AUTO_7961 ?AUTO_7954 ) ( not ( = ?AUTO_7954 ?AUTO_7961 ) ) ( not ( = ?AUTO_7955 ?AUTO_7961 ) ) ( not ( = ?AUTO_7958 ?AUTO_7961 ) ) ( not ( = ?AUTO_7960 ?AUTO_7961 ) ) ( FULL ?AUTO_7956 ) )
    :subtasks
    ( ( !DROP ?AUTO_7959 ?AUTO_7956 )
      ( GET_ROCK_DATA ?AUTO_7954 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7954 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8001 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8007 - LANDER
      ?AUTO_8008 - WAYPOINT
      ?AUTO_8005 - ROVER
      ?AUTO_8006 - STORE
      ?AUTO_8002 - WAYPOINT
      ?AUTO_8003 - WAYPOINT
      ?AUTO_8004 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8007 ?AUTO_8001 ) ( VISIBLE ?AUTO_8008 ?AUTO_8001 ) ( AVAILABLE ?AUTO_8005 ) ( CHANNEL_FREE ?AUTO_8007 ) ( not ( = ?AUTO_8001 ?AUTO_8008 ) ) ( CAN_TRAVERSE ?AUTO_8005 ?AUTO_8001 ?AUTO_8008 ) ( VISIBLE ?AUTO_8001 ?AUTO_8008 ) ( AT_SOIL_SAMPLE ?AUTO_8001 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8005 ) ( STORE_OF ?AUTO_8006 ?AUTO_8005 ) ( CAN_TRAVERSE ?AUTO_8005 ?AUTO_8002 ?AUTO_8001 ) ( VISIBLE ?AUTO_8002 ?AUTO_8001 ) ( not ( = ?AUTO_8001 ?AUTO_8002 ) ) ( not ( = ?AUTO_8008 ?AUTO_8002 ) ) ( CAN_TRAVERSE ?AUTO_8005 ?AUTO_8003 ?AUTO_8002 ) ( VISIBLE ?AUTO_8003 ?AUTO_8002 ) ( not ( = ?AUTO_8001 ?AUTO_8003 ) ) ( not ( = ?AUTO_8008 ?AUTO_8003 ) ) ( not ( = ?AUTO_8002 ?AUTO_8003 ) ) ( CAN_TRAVERSE ?AUTO_8005 ?AUTO_8004 ?AUTO_8003 ) ( AT ?AUTO_8005 ?AUTO_8004 ) ( VISIBLE ?AUTO_8004 ?AUTO_8003 ) ( not ( = ?AUTO_8001 ?AUTO_8004 ) ) ( not ( = ?AUTO_8008 ?AUTO_8004 ) ) ( not ( = ?AUTO_8002 ?AUTO_8004 ) ) ( not ( = ?AUTO_8003 ?AUTO_8004 ) ) ( FULL ?AUTO_8006 ) )
    :subtasks
    ( ( !DROP ?AUTO_8005 ?AUTO_8006 )
      ( GET_SOIL_DATA ?AUTO_8001 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8001 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8010 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8011 - LANDER
      ?AUTO_8015 - WAYPOINT
      ?AUTO_8012 - ROVER
      ?AUTO_8013 - STORE
      ?AUTO_8017 - WAYPOINT
      ?AUTO_8016 - WAYPOINT
      ?AUTO_8014 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8011 ?AUTO_8010 ) ( VISIBLE ?AUTO_8015 ?AUTO_8010 ) ( AVAILABLE ?AUTO_8012 ) ( CHANNEL_FREE ?AUTO_8011 ) ( not ( = ?AUTO_8010 ?AUTO_8015 ) ) ( CAN_TRAVERSE ?AUTO_8012 ?AUTO_8010 ?AUTO_8015 ) ( VISIBLE ?AUTO_8010 ?AUTO_8015 ) ( AT_SOIL_SAMPLE ?AUTO_8010 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8012 ) ( STORE_OF ?AUTO_8013 ?AUTO_8012 ) ( EMPTY ?AUTO_8013 ) ( CAN_TRAVERSE ?AUTO_8012 ?AUTO_8017 ?AUTO_8010 ) ( VISIBLE ?AUTO_8017 ?AUTO_8010 ) ( not ( = ?AUTO_8010 ?AUTO_8017 ) ) ( not ( = ?AUTO_8015 ?AUTO_8017 ) ) ( CAN_TRAVERSE ?AUTO_8012 ?AUTO_8016 ?AUTO_8017 ) ( VISIBLE ?AUTO_8016 ?AUTO_8017 ) ( not ( = ?AUTO_8010 ?AUTO_8016 ) ) ( not ( = ?AUTO_8015 ?AUTO_8016 ) ) ( not ( = ?AUTO_8017 ?AUTO_8016 ) ) ( CAN_TRAVERSE ?AUTO_8012 ?AUTO_8014 ?AUTO_8016 ) ( VISIBLE ?AUTO_8014 ?AUTO_8016 ) ( not ( = ?AUTO_8010 ?AUTO_8014 ) ) ( not ( = ?AUTO_8015 ?AUTO_8014 ) ) ( not ( = ?AUTO_8017 ?AUTO_8014 ) ) ( not ( = ?AUTO_8016 ?AUTO_8014 ) ) ( CAN_TRAVERSE ?AUTO_8012 ?AUTO_8015 ?AUTO_8014 ) ( AT ?AUTO_8012 ?AUTO_8015 ) ( VISIBLE ?AUTO_8015 ?AUTO_8014 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8012 ?AUTO_8015 ?AUTO_8014 )
      ( GET_SOIL_DATA ?AUTO_8010 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8010 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8018 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8025 - LANDER
      ?AUTO_8023 - WAYPOINT
      ?AUTO_8022 - ROVER
      ?AUTO_8024 - STORE
      ?AUTO_8020 - WAYPOINT
      ?AUTO_8021 - WAYPOINT
      ?AUTO_8019 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8025 ?AUTO_8018 ) ( VISIBLE ?AUTO_8023 ?AUTO_8018 ) ( AVAILABLE ?AUTO_8022 ) ( CHANNEL_FREE ?AUTO_8025 ) ( not ( = ?AUTO_8018 ?AUTO_8023 ) ) ( CAN_TRAVERSE ?AUTO_8022 ?AUTO_8018 ?AUTO_8023 ) ( VISIBLE ?AUTO_8018 ?AUTO_8023 ) ( AT_SOIL_SAMPLE ?AUTO_8018 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8022 ) ( STORE_OF ?AUTO_8024 ?AUTO_8022 ) ( CAN_TRAVERSE ?AUTO_8022 ?AUTO_8020 ?AUTO_8018 ) ( VISIBLE ?AUTO_8020 ?AUTO_8018 ) ( not ( = ?AUTO_8018 ?AUTO_8020 ) ) ( not ( = ?AUTO_8023 ?AUTO_8020 ) ) ( CAN_TRAVERSE ?AUTO_8022 ?AUTO_8021 ?AUTO_8020 ) ( VISIBLE ?AUTO_8021 ?AUTO_8020 ) ( not ( = ?AUTO_8018 ?AUTO_8021 ) ) ( not ( = ?AUTO_8023 ?AUTO_8021 ) ) ( not ( = ?AUTO_8020 ?AUTO_8021 ) ) ( CAN_TRAVERSE ?AUTO_8022 ?AUTO_8019 ?AUTO_8021 ) ( VISIBLE ?AUTO_8019 ?AUTO_8021 ) ( not ( = ?AUTO_8018 ?AUTO_8019 ) ) ( not ( = ?AUTO_8023 ?AUTO_8019 ) ) ( not ( = ?AUTO_8020 ?AUTO_8019 ) ) ( not ( = ?AUTO_8021 ?AUTO_8019 ) ) ( CAN_TRAVERSE ?AUTO_8022 ?AUTO_8023 ?AUTO_8019 ) ( AT ?AUTO_8022 ?AUTO_8023 ) ( VISIBLE ?AUTO_8023 ?AUTO_8019 ) ( FULL ?AUTO_8024 ) )
    :subtasks
    ( ( !DROP ?AUTO_8022 ?AUTO_8024 )
      ( GET_SOIL_DATA ?AUTO_8018 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8018 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8039 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8043 - LANDER
      ?AUTO_8041 - WAYPOINT
      ?AUTO_8040 - ROVER
      ?AUTO_8042 - WAYPOINT
      ?AUTO_8044 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8043 ?AUTO_8041 ) ( HAVE_ROCK_ANALYSIS ?AUTO_8040 ?AUTO_8039 ) ( VISIBLE ?AUTO_8042 ?AUTO_8041 ) ( AVAILABLE ?AUTO_8040 ) ( CHANNEL_FREE ?AUTO_8043 ) ( not ( = ?AUTO_8039 ?AUTO_8042 ) ) ( not ( = ?AUTO_8039 ?AUTO_8041 ) ) ( not ( = ?AUTO_8042 ?AUTO_8041 ) ) ( CAN_TRAVERSE ?AUTO_8040 ?AUTO_8039 ?AUTO_8042 ) ( VISIBLE ?AUTO_8039 ?AUTO_8042 ) ( CAN_TRAVERSE ?AUTO_8040 ?AUTO_8044 ?AUTO_8039 ) ( AT ?AUTO_8040 ?AUTO_8044 ) ( VISIBLE ?AUTO_8044 ?AUTO_8039 ) ( not ( = ?AUTO_8039 ?AUTO_8044 ) ) ( not ( = ?AUTO_8041 ?AUTO_8044 ) ) ( not ( = ?AUTO_8042 ?AUTO_8044 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8040 ?AUTO_8044 ?AUTO_8039 )
      ( GET_ROCK_DATA ?AUTO_8039 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8039 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8066 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8069 - LANDER
      ?AUTO_8071 - WAYPOINT
      ?AUTO_8070 - WAYPOINT
      ?AUTO_8067 - ROVER
      ?AUTO_8068 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8069 ?AUTO_8071 ) ( VISIBLE ?AUTO_8070 ?AUTO_8071 ) ( AVAILABLE ?AUTO_8067 ) ( CHANNEL_FREE ?AUTO_8069 ) ( not ( = ?AUTO_8066 ?AUTO_8070 ) ) ( not ( = ?AUTO_8066 ?AUTO_8071 ) ) ( not ( = ?AUTO_8070 ?AUTO_8071 ) ) ( CAN_TRAVERSE ?AUTO_8067 ?AUTO_8066 ?AUTO_8070 ) ( VISIBLE ?AUTO_8066 ?AUTO_8070 ) ( AT_ROCK_SAMPLE ?AUTO_8066 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8067 ) ( STORE_OF ?AUTO_8068 ?AUTO_8067 ) ( CAN_TRAVERSE ?AUTO_8067 ?AUTO_8070 ?AUTO_8066 ) ( VISIBLE ?AUTO_8070 ?AUTO_8066 ) ( FULL ?AUTO_8068 ) ( CAN_TRAVERSE ?AUTO_8067 ?AUTO_8071 ?AUTO_8070 ) ( AT ?AUTO_8067 ?AUTO_8071 ) ( VISIBLE ?AUTO_8071 ?AUTO_8070 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8067 ?AUTO_8071 ?AUTO_8070 )
      ( GET_ROCK_DATA ?AUTO_8066 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8066 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8072 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8077 - LANDER
      ?AUTO_8073 - WAYPOINT
      ?AUTO_8076 - WAYPOINT
      ?AUTO_8075 - ROVER
      ?AUTO_8074 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8077 ?AUTO_8073 ) ( VISIBLE ?AUTO_8076 ?AUTO_8073 ) ( AVAILABLE ?AUTO_8075 ) ( CHANNEL_FREE ?AUTO_8077 ) ( not ( = ?AUTO_8072 ?AUTO_8076 ) ) ( not ( = ?AUTO_8072 ?AUTO_8073 ) ) ( not ( = ?AUTO_8076 ?AUTO_8073 ) ) ( CAN_TRAVERSE ?AUTO_8075 ?AUTO_8072 ?AUTO_8076 ) ( VISIBLE ?AUTO_8072 ?AUTO_8076 ) ( AT_ROCK_SAMPLE ?AUTO_8072 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8075 ) ( STORE_OF ?AUTO_8074 ?AUTO_8075 ) ( CAN_TRAVERSE ?AUTO_8075 ?AUTO_8076 ?AUTO_8072 ) ( VISIBLE ?AUTO_8076 ?AUTO_8072 ) ( CAN_TRAVERSE ?AUTO_8075 ?AUTO_8073 ?AUTO_8076 ) ( AT ?AUTO_8075 ?AUTO_8073 ) ( VISIBLE ?AUTO_8073 ?AUTO_8076 ) ( AT_SOIL_SAMPLE ?AUTO_8073 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8075 ) ( EMPTY ?AUTO_8074 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_8075 ?AUTO_8074 ?AUTO_8073 )
      ( GET_ROCK_DATA ?AUTO_8072 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8072 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8097 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8101 - LANDER
      ?AUTO_8100 - WAYPOINT
      ?AUTO_8098 - WAYPOINT
      ?AUTO_8103 - ROVER
      ?AUTO_8102 - STORE
      ?AUTO_8099 - WAYPOINT
      ?AUTO_8104 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8101 ?AUTO_8100 ) ( VISIBLE ?AUTO_8098 ?AUTO_8100 ) ( AVAILABLE ?AUTO_8103 ) ( CHANNEL_FREE ?AUTO_8101 ) ( not ( = ?AUTO_8097 ?AUTO_8098 ) ) ( not ( = ?AUTO_8097 ?AUTO_8100 ) ) ( not ( = ?AUTO_8098 ?AUTO_8100 ) ) ( CAN_TRAVERSE ?AUTO_8103 ?AUTO_8097 ?AUTO_8098 ) ( VISIBLE ?AUTO_8097 ?AUTO_8098 ) ( AT_ROCK_SAMPLE ?AUTO_8097 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8103 ) ( STORE_OF ?AUTO_8102 ?AUTO_8103 ) ( EMPTY ?AUTO_8102 ) ( CAN_TRAVERSE ?AUTO_8103 ?AUTO_8099 ?AUTO_8097 ) ( VISIBLE ?AUTO_8099 ?AUTO_8097 ) ( not ( = ?AUTO_8097 ?AUTO_8099 ) ) ( not ( = ?AUTO_8100 ?AUTO_8099 ) ) ( not ( = ?AUTO_8098 ?AUTO_8099 ) ) ( CAN_TRAVERSE ?AUTO_8103 ?AUTO_8104 ?AUTO_8099 ) ( AT ?AUTO_8103 ?AUTO_8104 ) ( VISIBLE ?AUTO_8104 ?AUTO_8099 ) ( not ( = ?AUTO_8097 ?AUTO_8104 ) ) ( not ( = ?AUTO_8100 ?AUTO_8104 ) ) ( not ( = ?AUTO_8098 ?AUTO_8104 ) ) ( not ( = ?AUTO_8099 ?AUTO_8104 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8103 ?AUTO_8104 ?AUTO_8099 )
      ( GET_ROCK_DATA ?AUTO_8097 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8097 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8105 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8111 - LANDER
      ?AUTO_8107 - WAYPOINT
      ?AUTO_8110 - WAYPOINT
      ?AUTO_8112 - ROVER
      ?AUTO_8106 - STORE
      ?AUTO_8109 - WAYPOINT
      ?AUTO_8108 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8111 ?AUTO_8107 ) ( VISIBLE ?AUTO_8110 ?AUTO_8107 ) ( AVAILABLE ?AUTO_8112 ) ( CHANNEL_FREE ?AUTO_8111 ) ( not ( = ?AUTO_8105 ?AUTO_8110 ) ) ( not ( = ?AUTO_8105 ?AUTO_8107 ) ) ( not ( = ?AUTO_8110 ?AUTO_8107 ) ) ( CAN_TRAVERSE ?AUTO_8112 ?AUTO_8105 ?AUTO_8110 ) ( VISIBLE ?AUTO_8105 ?AUTO_8110 ) ( AT_ROCK_SAMPLE ?AUTO_8105 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8112 ) ( STORE_OF ?AUTO_8106 ?AUTO_8112 ) ( CAN_TRAVERSE ?AUTO_8112 ?AUTO_8109 ?AUTO_8105 ) ( VISIBLE ?AUTO_8109 ?AUTO_8105 ) ( not ( = ?AUTO_8105 ?AUTO_8109 ) ) ( not ( = ?AUTO_8107 ?AUTO_8109 ) ) ( not ( = ?AUTO_8110 ?AUTO_8109 ) ) ( CAN_TRAVERSE ?AUTO_8112 ?AUTO_8108 ?AUTO_8109 ) ( AT ?AUTO_8112 ?AUTO_8108 ) ( VISIBLE ?AUTO_8108 ?AUTO_8109 ) ( not ( = ?AUTO_8105 ?AUTO_8108 ) ) ( not ( = ?AUTO_8107 ?AUTO_8108 ) ) ( not ( = ?AUTO_8110 ?AUTO_8108 ) ) ( not ( = ?AUTO_8109 ?AUTO_8108 ) ) ( FULL ?AUTO_8106 ) )
    :subtasks
    ( ( !DROP ?AUTO_8112 ?AUTO_8106 )
      ( GET_ROCK_DATA ?AUTO_8105 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8105 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8173 - OBJECTIVE
      ?AUTO_8174 - MODE
    )
    :vars
    (
      ?AUTO_8177 - LANDER
      ?AUTO_8181 - WAYPOINT
      ?AUTO_8176 - WAYPOINT
      ?AUTO_8179 - ROVER
      ?AUTO_8180 - WAYPOINT
      ?AUTO_8178 - WAYPOINT
      ?AUTO_8175 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8177 ?AUTO_8181 ) ( VISIBLE ?AUTO_8176 ?AUTO_8181 ) ( AVAILABLE ?AUTO_8179 ) ( CHANNEL_FREE ?AUTO_8177 ) ( not ( = ?AUTO_8176 ?AUTO_8181 ) ) ( CAN_TRAVERSE ?AUTO_8179 ?AUTO_8180 ?AUTO_8176 ) ( VISIBLE ?AUTO_8180 ?AUTO_8176 ) ( not ( = ?AUTO_8181 ?AUTO_8180 ) ) ( not ( = ?AUTO_8176 ?AUTO_8180 ) ) ( CAN_TRAVERSE ?AUTO_8179 ?AUTO_8178 ?AUTO_8180 ) ( VISIBLE ?AUTO_8178 ?AUTO_8180 ) ( not ( = ?AUTO_8181 ?AUTO_8178 ) ) ( not ( = ?AUTO_8176 ?AUTO_8178 ) ) ( not ( = ?AUTO_8180 ?AUTO_8178 ) ) ( CALIBRATED ?AUTO_8175 ?AUTO_8179 ) ( ON_BOARD ?AUTO_8175 ?AUTO_8179 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8179 ) ( SUPPORTS ?AUTO_8175 ?AUTO_8174 ) ( VISIBLE_FROM ?AUTO_8173 ?AUTO_8178 ) ( CAN_TRAVERSE ?AUTO_8179 ?AUTO_8180 ?AUTO_8178 ) ( VISIBLE ?AUTO_8180 ?AUTO_8178 ) ( CAN_TRAVERSE ?AUTO_8179 ?AUTO_8176 ?AUTO_8180 ) ( VISIBLE ?AUTO_8176 ?AUTO_8180 ) ( CAN_TRAVERSE ?AUTO_8179 ?AUTO_8181 ?AUTO_8176 ) ( AT ?AUTO_8179 ?AUTO_8181 ) ( VISIBLE ?AUTO_8181 ?AUTO_8176 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8179 ?AUTO_8181 ?AUTO_8176 )
      ( GET_IMAGE_DATA ?AUTO_8173 ?AUTO_8174 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8173 ?AUTO_8174 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8184 - OBJECTIVE
      ?AUTO_8185 - MODE
    )
    :vars
    (
      ?AUTO_8188 - LANDER
      ?AUTO_8190 - WAYPOINT
      ?AUTO_8191 - WAYPOINT
      ?AUTO_8187 - ROVER
      ?AUTO_8189 - WAYPOINT
      ?AUTO_8192 - WAYPOINT
      ?AUTO_8186 - CAMERA
      ?AUTO_8193 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8188 ?AUTO_8190 ) ( VISIBLE ?AUTO_8191 ?AUTO_8190 ) ( AVAILABLE ?AUTO_8187 ) ( CHANNEL_FREE ?AUTO_8188 ) ( not ( = ?AUTO_8191 ?AUTO_8190 ) ) ( CAN_TRAVERSE ?AUTO_8187 ?AUTO_8189 ?AUTO_8191 ) ( VISIBLE ?AUTO_8189 ?AUTO_8191 ) ( not ( = ?AUTO_8190 ?AUTO_8189 ) ) ( not ( = ?AUTO_8191 ?AUTO_8189 ) ) ( CAN_TRAVERSE ?AUTO_8187 ?AUTO_8192 ?AUTO_8189 ) ( VISIBLE ?AUTO_8192 ?AUTO_8189 ) ( not ( = ?AUTO_8190 ?AUTO_8192 ) ) ( not ( = ?AUTO_8191 ?AUTO_8192 ) ) ( not ( = ?AUTO_8189 ?AUTO_8192 ) ) ( ON_BOARD ?AUTO_8186 ?AUTO_8187 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8187 ) ( SUPPORTS ?AUTO_8186 ?AUTO_8185 ) ( VISIBLE_FROM ?AUTO_8184 ?AUTO_8192 ) ( CAN_TRAVERSE ?AUTO_8187 ?AUTO_8189 ?AUTO_8192 ) ( VISIBLE ?AUTO_8189 ?AUTO_8192 ) ( CAN_TRAVERSE ?AUTO_8187 ?AUTO_8191 ?AUTO_8189 ) ( VISIBLE ?AUTO_8191 ?AUTO_8189 ) ( CAN_TRAVERSE ?AUTO_8187 ?AUTO_8190 ?AUTO_8191 ) ( AT ?AUTO_8187 ?AUTO_8190 ) ( VISIBLE ?AUTO_8190 ?AUTO_8191 ) ( CALIBRATION_TARGET ?AUTO_8186 ?AUTO_8193 ) ( VISIBLE_FROM ?AUTO_8193 ?AUTO_8190 ) ( not ( = ?AUTO_8184 ?AUTO_8193 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_8187 ?AUTO_8186 ?AUTO_8193 ?AUTO_8190 )
      ( GET_IMAGE_DATA ?AUTO_8184 ?AUTO_8185 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8184 ?AUTO_8185 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8194 - OBJECTIVE
      ?AUTO_8195 - MODE
    )
    :vars
    (
      ?AUTO_8202 - LANDER
      ?AUTO_8203 - WAYPOINT
      ?AUTO_8198 - WAYPOINT
      ?AUTO_8199 - ROVER
      ?AUTO_8201 - WAYPOINT
      ?AUTO_8196 - WAYPOINT
      ?AUTO_8197 - CAMERA
      ?AUTO_8200 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8202 ?AUTO_8203 ) ( VISIBLE ?AUTO_8198 ?AUTO_8203 ) ( AVAILABLE ?AUTO_8199 ) ( CHANNEL_FREE ?AUTO_8202 ) ( not ( = ?AUTO_8198 ?AUTO_8203 ) ) ( CAN_TRAVERSE ?AUTO_8199 ?AUTO_8201 ?AUTO_8198 ) ( VISIBLE ?AUTO_8201 ?AUTO_8198 ) ( not ( = ?AUTO_8203 ?AUTO_8201 ) ) ( not ( = ?AUTO_8198 ?AUTO_8201 ) ) ( CAN_TRAVERSE ?AUTO_8199 ?AUTO_8196 ?AUTO_8201 ) ( VISIBLE ?AUTO_8196 ?AUTO_8201 ) ( not ( = ?AUTO_8203 ?AUTO_8196 ) ) ( not ( = ?AUTO_8198 ?AUTO_8196 ) ) ( not ( = ?AUTO_8201 ?AUTO_8196 ) ) ( ON_BOARD ?AUTO_8197 ?AUTO_8199 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8199 ) ( SUPPORTS ?AUTO_8197 ?AUTO_8195 ) ( VISIBLE_FROM ?AUTO_8194 ?AUTO_8196 ) ( CAN_TRAVERSE ?AUTO_8199 ?AUTO_8201 ?AUTO_8196 ) ( VISIBLE ?AUTO_8201 ?AUTO_8196 ) ( CAN_TRAVERSE ?AUTO_8199 ?AUTO_8198 ?AUTO_8201 ) ( VISIBLE ?AUTO_8198 ?AUTO_8201 ) ( CAN_TRAVERSE ?AUTO_8199 ?AUTO_8203 ?AUTO_8198 ) ( VISIBLE ?AUTO_8203 ?AUTO_8198 ) ( CALIBRATION_TARGET ?AUTO_8197 ?AUTO_8200 ) ( VISIBLE_FROM ?AUTO_8200 ?AUTO_8203 ) ( not ( = ?AUTO_8194 ?AUTO_8200 ) ) ( CAN_TRAVERSE ?AUTO_8199 ?AUTO_8198 ?AUTO_8203 ) ( AT ?AUTO_8199 ?AUTO_8198 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8199 ?AUTO_8198 ?AUTO_8203 )
      ( GET_IMAGE_DATA ?AUTO_8194 ?AUTO_8195 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8194 ?AUTO_8195 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8206 - OBJECTIVE
      ?AUTO_8207 - MODE
    )
    :vars
    (
      ?AUTO_8208 - LANDER
      ?AUTO_8213 - WAYPOINT
      ?AUTO_8215 - WAYPOINT
      ?AUTO_8214 - ROVER
      ?AUTO_8211 - WAYPOINT
      ?AUTO_8210 - WAYPOINT
      ?AUTO_8212 - CAMERA
      ?AUTO_8209 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8208 ?AUTO_8213 ) ( VISIBLE ?AUTO_8215 ?AUTO_8213 ) ( AVAILABLE ?AUTO_8214 ) ( CHANNEL_FREE ?AUTO_8208 ) ( not ( = ?AUTO_8215 ?AUTO_8213 ) ) ( CAN_TRAVERSE ?AUTO_8214 ?AUTO_8211 ?AUTO_8215 ) ( VISIBLE ?AUTO_8211 ?AUTO_8215 ) ( not ( = ?AUTO_8213 ?AUTO_8211 ) ) ( not ( = ?AUTO_8215 ?AUTO_8211 ) ) ( CAN_TRAVERSE ?AUTO_8214 ?AUTO_8210 ?AUTO_8211 ) ( VISIBLE ?AUTO_8210 ?AUTO_8211 ) ( not ( = ?AUTO_8213 ?AUTO_8210 ) ) ( not ( = ?AUTO_8215 ?AUTO_8210 ) ) ( not ( = ?AUTO_8211 ?AUTO_8210 ) ) ( ON_BOARD ?AUTO_8212 ?AUTO_8214 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8214 ) ( SUPPORTS ?AUTO_8212 ?AUTO_8207 ) ( VISIBLE_FROM ?AUTO_8206 ?AUTO_8210 ) ( CAN_TRAVERSE ?AUTO_8214 ?AUTO_8211 ?AUTO_8210 ) ( VISIBLE ?AUTO_8211 ?AUTO_8210 ) ( CAN_TRAVERSE ?AUTO_8214 ?AUTO_8215 ?AUTO_8211 ) ( VISIBLE ?AUTO_8215 ?AUTO_8211 ) ( CAN_TRAVERSE ?AUTO_8214 ?AUTO_8213 ?AUTO_8215 ) ( VISIBLE ?AUTO_8213 ?AUTO_8215 ) ( CALIBRATION_TARGET ?AUTO_8212 ?AUTO_8209 ) ( VISIBLE_FROM ?AUTO_8209 ?AUTO_8213 ) ( not ( = ?AUTO_8206 ?AUTO_8209 ) ) ( CAN_TRAVERSE ?AUTO_8214 ?AUTO_8215 ?AUTO_8213 ) ( AT ?AUTO_8214 ?AUTO_8211 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8214 ?AUTO_8211 ?AUTO_8215 )
      ( GET_IMAGE_DATA ?AUTO_8206 ?AUTO_8207 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8206 ?AUTO_8207 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8216 - OBJECTIVE
      ?AUTO_8217 - MODE
    )
    :vars
    (
      ?AUTO_8218 - LANDER
      ?AUTO_8221 - WAYPOINT
      ?AUTO_8225 - WAYPOINT
      ?AUTO_8224 - ROVER
      ?AUTO_8223 - WAYPOINT
      ?AUTO_8220 - WAYPOINT
      ?AUTO_8222 - CAMERA
      ?AUTO_8219 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8218 ?AUTO_8221 ) ( VISIBLE ?AUTO_8225 ?AUTO_8221 ) ( AVAILABLE ?AUTO_8224 ) ( CHANNEL_FREE ?AUTO_8218 ) ( not ( = ?AUTO_8225 ?AUTO_8221 ) ) ( CAN_TRAVERSE ?AUTO_8224 ?AUTO_8223 ?AUTO_8225 ) ( VISIBLE ?AUTO_8223 ?AUTO_8225 ) ( not ( = ?AUTO_8221 ?AUTO_8223 ) ) ( not ( = ?AUTO_8225 ?AUTO_8223 ) ) ( CAN_TRAVERSE ?AUTO_8224 ?AUTO_8220 ?AUTO_8223 ) ( VISIBLE ?AUTO_8220 ?AUTO_8223 ) ( not ( = ?AUTO_8221 ?AUTO_8220 ) ) ( not ( = ?AUTO_8225 ?AUTO_8220 ) ) ( not ( = ?AUTO_8223 ?AUTO_8220 ) ) ( ON_BOARD ?AUTO_8222 ?AUTO_8224 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8224 ) ( SUPPORTS ?AUTO_8222 ?AUTO_8217 ) ( VISIBLE_FROM ?AUTO_8216 ?AUTO_8220 ) ( CAN_TRAVERSE ?AUTO_8224 ?AUTO_8223 ?AUTO_8220 ) ( VISIBLE ?AUTO_8223 ?AUTO_8220 ) ( CAN_TRAVERSE ?AUTO_8224 ?AUTO_8225 ?AUTO_8223 ) ( VISIBLE ?AUTO_8225 ?AUTO_8223 ) ( CAN_TRAVERSE ?AUTO_8224 ?AUTO_8221 ?AUTO_8225 ) ( VISIBLE ?AUTO_8221 ?AUTO_8225 ) ( CALIBRATION_TARGET ?AUTO_8222 ?AUTO_8219 ) ( VISIBLE_FROM ?AUTO_8219 ?AUTO_8221 ) ( not ( = ?AUTO_8216 ?AUTO_8219 ) ) ( CAN_TRAVERSE ?AUTO_8224 ?AUTO_8225 ?AUTO_8221 ) ( AT ?AUTO_8224 ?AUTO_8220 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8224 ?AUTO_8220 ?AUTO_8223 )
      ( GET_IMAGE_DATA ?AUTO_8216 ?AUTO_8217 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8216 ?AUTO_8217 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8230 - OBJECTIVE
      ?AUTO_8231 - MODE
    )
    :vars
    (
      ?AUTO_8232 - LANDER
      ?AUTO_8236 - WAYPOINT
      ?AUTO_8237 - WAYPOINT
      ?AUTO_8233 - ROVER
      ?AUTO_8239 - WAYPOINT
      ?AUTO_8235 - WAYPOINT
      ?AUTO_8238 - CAMERA
      ?AUTO_8234 - OBJECTIVE
      ?AUTO_8240 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8232 ?AUTO_8236 ) ( VISIBLE ?AUTO_8237 ?AUTO_8236 ) ( AVAILABLE ?AUTO_8233 ) ( CHANNEL_FREE ?AUTO_8232 ) ( not ( = ?AUTO_8237 ?AUTO_8236 ) ) ( CAN_TRAVERSE ?AUTO_8233 ?AUTO_8239 ?AUTO_8237 ) ( VISIBLE ?AUTO_8239 ?AUTO_8237 ) ( not ( = ?AUTO_8236 ?AUTO_8239 ) ) ( not ( = ?AUTO_8237 ?AUTO_8239 ) ) ( CAN_TRAVERSE ?AUTO_8233 ?AUTO_8235 ?AUTO_8239 ) ( VISIBLE ?AUTO_8235 ?AUTO_8239 ) ( not ( = ?AUTO_8236 ?AUTO_8235 ) ) ( not ( = ?AUTO_8237 ?AUTO_8235 ) ) ( not ( = ?AUTO_8239 ?AUTO_8235 ) ) ( ON_BOARD ?AUTO_8238 ?AUTO_8233 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8233 ) ( SUPPORTS ?AUTO_8238 ?AUTO_8231 ) ( VISIBLE_FROM ?AUTO_8230 ?AUTO_8235 ) ( CAN_TRAVERSE ?AUTO_8233 ?AUTO_8239 ?AUTO_8235 ) ( VISIBLE ?AUTO_8239 ?AUTO_8235 ) ( CAN_TRAVERSE ?AUTO_8233 ?AUTO_8237 ?AUTO_8239 ) ( VISIBLE ?AUTO_8237 ?AUTO_8239 ) ( CAN_TRAVERSE ?AUTO_8233 ?AUTO_8236 ?AUTO_8237 ) ( VISIBLE ?AUTO_8236 ?AUTO_8237 ) ( CALIBRATION_TARGET ?AUTO_8238 ?AUTO_8234 ) ( VISIBLE_FROM ?AUTO_8234 ?AUTO_8236 ) ( not ( = ?AUTO_8230 ?AUTO_8234 ) ) ( CAN_TRAVERSE ?AUTO_8233 ?AUTO_8237 ?AUTO_8236 ) ( CAN_TRAVERSE ?AUTO_8233 ?AUTO_8240 ?AUTO_8235 ) ( AT ?AUTO_8233 ?AUTO_8240 ) ( VISIBLE ?AUTO_8240 ?AUTO_8235 ) ( not ( = ?AUTO_8236 ?AUTO_8240 ) ) ( not ( = ?AUTO_8237 ?AUTO_8240 ) ) ( not ( = ?AUTO_8239 ?AUTO_8240 ) ) ( not ( = ?AUTO_8235 ?AUTO_8240 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8233 ?AUTO_8240 ?AUTO_8235 )
      ( GET_IMAGE_DATA ?AUTO_8230 ?AUTO_8231 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8230 ?AUTO_8231 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8313 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8317 - LANDER
      ?AUTO_8315 - WAYPOINT
      ?AUTO_8314 - ROVER
      ?AUTO_8316 - WAYPOINT
      ?AUTO_8318 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8317 ?AUTO_8315 ) ( HAVE_SOIL_ANALYSIS ?AUTO_8314 ?AUTO_8313 ) ( VISIBLE ?AUTO_8316 ?AUTO_8315 ) ( AVAILABLE ?AUTO_8314 ) ( CHANNEL_FREE ?AUTO_8317 ) ( not ( = ?AUTO_8313 ?AUTO_8316 ) ) ( not ( = ?AUTO_8313 ?AUTO_8315 ) ) ( not ( = ?AUTO_8316 ?AUTO_8315 ) ) ( CAN_TRAVERSE ?AUTO_8314 ?AUTO_8313 ?AUTO_8316 ) ( VISIBLE ?AUTO_8313 ?AUTO_8316 ) ( CAN_TRAVERSE ?AUTO_8314 ?AUTO_8318 ?AUTO_8313 ) ( AT ?AUTO_8314 ?AUTO_8318 ) ( VISIBLE ?AUTO_8318 ?AUTO_8313 ) ( not ( = ?AUTO_8313 ?AUTO_8318 ) ) ( not ( = ?AUTO_8315 ?AUTO_8318 ) ) ( not ( = ?AUTO_8316 ?AUTO_8318 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8314 ?AUTO_8318 ?AUTO_8313 )
      ( GET_SOIL_DATA ?AUTO_8313 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8313 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8382 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8386 - LANDER
      ?AUTO_8388 - WAYPOINT
      ?AUTO_8387 - WAYPOINT
      ?AUTO_8383 - ROVER
      ?AUTO_8384 - WAYPOINT
      ?AUTO_8385 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8386 ?AUTO_8388 ) ( VISIBLE ?AUTO_8387 ?AUTO_8388 ) ( AVAILABLE ?AUTO_8383 ) ( CHANNEL_FREE ?AUTO_8386 ) ( not ( = ?AUTO_8382 ?AUTO_8387 ) ) ( not ( = ?AUTO_8382 ?AUTO_8388 ) ) ( not ( = ?AUTO_8387 ?AUTO_8388 ) ) ( CAN_TRAVERSE ?AUTO_8383 ?AUTO_8384 ?AUTO_8387 ) ( VISIBLE ?AUTO_8384 ?AUTO_8387 ) ( not ( = ?AUTO_8382 ?AUTO_8384 ) ) ( not ( = ?AUTO_8388 ?AUTO_8384 ) ) ( not ( = ?AUTO_8387 ?AUTO_8384 ) ) ( CAN_TRAVERSE ?AUTO_8383 ?AUTO_8382 ?AUTO_8384 ) ( VISIBLE ?AUTO_8382 ?AUTO_8384 ) ( AT_ROCK_SAMPLE ?AUTO_8382 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8383 ) ( STORE_OF ?AUTO_8385 ?AUTO_8383 ) ( CAN_TRAVERSE ?AUTO_8383 ?AUTO_8384 ?AUTO_8382 ) ( AT ?AUTO_8383 ?AUTO_8384 ) ( VISIBLE ?AUTO_8384 ?AUTO_8382 ) ( FULL ?AUTO_8385 ) )
    :subtasks
    ( ( !DROP ?AUTO_8383 ?AUTO_8385 )
      ( GET_ROCK_DATA ?AUTO_8382 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8382 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8418 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8424 - LANDER
      ?AUTO_8420 - WAYPOINT
      ?AUTO_8422 - WAYPOINT
      ?AUTO_8419 - ROVER
      ?AUTO_8421 - WAYPOINT
      ?AUTO_8423 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8424 ?AUTO_8420 ) ( VISIBLE ?AUTO_8422 ?AUTO_8420 ) ( AVAILABLE ?AUTO_8419 ) ( CHANNEL_FREE ?AUTO_8424 ) ( not ( = ?AUTO_8418 ?AUTO_8422 ) ) ( not ( = ?AUTO_8418 ?AUTO_8420 ) ) ( not ( = ?AUTO_8422 ?AUTO_8420 ) ) ( CAN_TRAVERSE ?AUTO_8419 ?AUTO_8421 ?AUTO_8422 ) ( VISIBLE ?AUTO_8421 ?AUTO_8422 ) ( not ( = ?AUTO_8418 ?AUTO_8421 ) ) ( not ( = ?AUTO_8420 ?AUTO_8421 ) ) ( not ( = ?AUTO_8422 ?AUTO_8421 ) ) ( CAN_TRAVERSE ?AUTO_8419 ?AUTO_8418 ?AUTO_8421 ) ( VISIBLE ?AUTO_8418 ?AUTO_8421 ) ( AT_SOIL_SAMPLE ?AUTO_8418 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8419 ) ( STORE_OF ?AUTO_8423 ?AUTO_8419 ) ( EMPTY ?AUTO_8423 ) ( CAN_TRAVERSE ?AUTO_8419 ?AUTO_8421 ?AUTO_8418 ) ( AT ?AUTO_8419 ?AUTO_8421 ) ( VISIBLE ?AUTO_8421 ?AUTO_8418 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8419 ?AUTO_8421 ?AUTO_8418 )
      ( GET_SOIL_DATA ?AUTO_8418 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8418 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8440 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8443 - LANDER
      ?AUTO_8445 - WAYPOINT
      ?AUTO_8446 - WAYPOINT
      ?AUTO_8442 - ROVER
      ?AUTO_8441 - WAYPOINT
      ?AUTO_8444 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8443 ?AUTO_8445 ) ( VISIBLE ?AUTO_8446 ?AUTO_8445 ) ( AVAILABLE ?AUTO_8442 ) ( CHANNEL_FREE ?AUTO_8443 ) ( not ( = ?AUTO_8440 ?AUTO_8446 ) ) ( not ( = ?AUTO_8440 ?AUTO_8445 ) ) ( not ( = ?AUTO_8446 ?AUTO_8445 ) ) ( CAN_TRAVERSE ?AUTO_8442 ?AUTO_8441 ?AUTO_8446 ) ( VISIBLE ?AUTO_8441 ?AUTO_8446 ) ( not ( = ?AUTO_8440 ?AUTO_8441 ) ) ( not ( = ?AUTO_8445 ?AUTO_8441 ) ) ( not ( = ?AUTO_8446 ?AUTO_8441 ) ) ( CAN_TRAVERSE ?AUTO_8442 ?AUTO_8440 ?AUTO_8441 ) ( VISIBLE ?AUTO_8440 ?AUTO_8441 ) ( AT_SOIL_SAMPLE ?AUTO_8440 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8442 ) ( STORE_OF ?AUTO_8444 ?AUTO_8442 ) ( CAN_TRAVERSE ?AUTO_8442 ?AUTO_8441 ?AUTO_8440 ) ( AT ?AUTO_8442 ?AUTO_8441 ) ( VISIBLE ?AUTO_8441 ?AUTO_8440 ) ( FULL ?AUTO_8444 ) )
    :subtasks
    ( ( !DROP ?AUTO_8442 ?AUTO_8444 )
      ( GET_SOIL_DATA ?AUTO_8440 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8440 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8533 - OBJECTIVE
      ?AUTO_8534 - MODE
    )
    :vars
    (
      ?AUTO_8538 - LANDER
      ?AUTO_8536 - WAYPOINT
      ?AUTO_8541 - WAYPOINT
      ?AUTO_8540 - ROVER
      ?AUTO_8535 - WAYPOINT
      ?AUTO_8537 - WAYPOINT
      ?AUTO_8539 - CAMERA
      ?AUTO_8542 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8538 ?AUTO_8536 ) ( VISIBLE ?AUTO_8541 ?AUTO_8536 ) ( AVAILABLE ?AUTO_8540 ) ( CHANNEL_FREE ?AUTO_8538 ) ( not ( = ?AUTO_8541 ?AUTO_8536 ) ) ( CAN_TRAVERSE ?AUTO_8540 ?AUTO_8535 ?AUTO_8541 ) ( VISIBLE ?AUTO_8535 ?AUTO_8541 ) ( not ( = ?AUTO_8536 ?AUTO_8535 ) ) ( not ( = ?AUTO_8541 ?AUTO_8535 ) ) ( CAN_TRAVERSE ?AUTO_8540 ?AUTO_8537 ?AUTO_8535 ) ( VISIBLE ?AUTO_8537 ?AUTO_8535 ) ( not ( = ?AUTO_8536 ?AUTO_8537 ) ) ( not ( = ?AUTO_8541 ?AUTO_8537 ) ) ( not ( = ?AUTO_8535 ?AUTO_8537 ) ) ( ON_BOARD ?AUTO_8539 ?AUTO_8540 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8540 ) ( SUPPORTS ?AUTO_8539 ?AUTO_8534 ) ( VISIBLE_FROM ?AUTO_8533 ?AUTO_8537 ) ( CAN_TRAVERSE ?AUTO_8540 ?AUTO_8535 ?AUTO_8537 ) ( AT ?AUTO_8540 ?AUTO_8535 ) ( VISIBLE ?AUTO_8535 ?AUTO_8537 ) ( CALIBRATION_TARGET ?AUTO_8539 ?AUTO_8542 ) ( VISIBLE_FROM ?AUTO_8542 ?AUTO_8535 ) ( not ( = ?AUTO_8533 ?AUTO_8542 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_8540 ?AUTO_8539 ?AUTO_8542 ?AUTO_8535 )
      ( GET_IMAGE_DATA ?AUTO_8533 ?AUTO_8534 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8533 ?AUTO_8534 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8543 - OBJECTIVE
      ?AUTO_8544 - MODE
    )
    :vars
    (
      ?AUTO_8551 - LANDER
      ?AUTO_8550 - WAYPOINT
      ?AUTO_8546 - WAYPOINT
      ?AUTO_8547 - ROVER
      ?AUTO_8545 - WAYPOINT
      ?AUTO_8548 - WAYPOINT
      ?AUTO_8552 - CAMERA
      ?AUTO_8549 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8551 ?AUTO_8550 ) ( VISIBLE ?AUTO_8546 ?AUTO_8550 ) ( AVAILABLE ?AUTO_8547 ) ( CHANNEL_FREE ?AUTO_8551 ) ( not ( = ?AUTO_8546 ?AUTO_8550 ) ) ( CAN_TRAVERSE ?AUTO_8547 ?AUTO_8545 ?AUTO_8546 ) ( VISIBLE ?AUTO_8545 ?AUTO_8546 ) ( not ( = ?AUTO_8550 ?AUTO_8545 ) ) ( not ( = ?AUTO_8546 ?AUTO_8545 ) ) ( CAN_TRAVERSE ?AUTO_8547 ?AUTO_8548 ?AUTO_8545 ) ( VISIBLE ?AUTO_8548 ?AUTO_8545 ) ( not ( = ?AUTO_8550 ?AUTO_8548 ) ) ( not ( = ?AUTO_8546 ?AUTO_8548 ) ) ( not ( = ?AUTO_8545 ?AUTO_8548 ) ) ( ON_BOARD ?AUTO_8552 ?AUTO_8547 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8547 ) ( SUPPORTS ?AUTO_8552 ?AUTO_8544 ) ( VISIBLE_FROM ?AUTO_8543 ?AUTO_8548 ) ( CAN_TRAVERSE ?AUTO_8547 ?AUTO_8545 ?AUTO_8548 ) ( VISIBLE ?AUTO_8545 ?AUTO_8548 ) ( CALIBRATION_TARGET ?AUTO_8552 ?AUTO_8549 ) ( VISIBLE_FROM ?AUTO_8549 ?AUTO_8545 ) ( not ( = ?AUTO_8543 ?AUTO_8549 ) ) ( CAN_TRAVERSE ?AUTO_8547 ?AUTO_8546 ?AUTO_8545 ) ( AT ?AUTO_8547 ?AUTO_8546 ) ( VISIBLE ?AUTO_8546 ?AUTO_8545 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8547 ?AUTO_8546 ?AUTO_8545 )
      ( GET_IMAGE_DATA ?AUTO_8543 ?AUTO_8544 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8543 ?AUTO_8544 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8571 - OBJECTIVE
      ?AUTO_8572 - MODE
    )
    :vars
    (
      ?AUTO_8578 - LANDER
      ?AUTO_8576 - WAYPOINT
      ?AUTO_8577 - WAYPOINT
      ?AUTO_8580 - ROVER
      ?AUTO_8573 - WAYPOINT
      ?AUTO_8575 - WAYPOINT
      ?AUTO_8574 - CAMERA
      ?AUTO_8579 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8578 ?AUTO_8576 ) ( VISIBLE ?AUTO_8577 ?AUTO_8576 ) ( AVAILABLE ?AUTO_8580 ) ( CHANNEL_FREE ?AUTO_8578 ) ( not ( = ?AUTO_8577 ?AUTO_8576 ) ) ( CAN_TRAVERSE ?AUTO_8580 ?AUTO_8573 ?AUTO_8577 ) ( VISIBLE ?AUTO_8573 ?AUTO_8577 ) ( not ( = ?AUTO_8576 ?AUTO_8573 ) ) ( not ( = ?AUTO_8577 ?AUTO_8573 ) ) ( CAN_TRAVERSE ?AUTO_8580 ?AUTO_8575 ?AUTO_8573 ) ( VISIBLE ?AUTO_8575 ?AUTO_8573 ) ( not ( = ?AUTO_8576 ?AUTO_8575 ) ) ( not ( = ?AUTO_8577 ?AUTO_8575 ) ) ( not ( = ?AUTO_8573 ?AUTO_8575 ) ) ( ON_BOARD ?AUTO_8574 ?AUTO_8580 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8580 ) ( SUPPORTS ?AUTO_8574 ?AUTO_8572 ) ( VISIBLE_FROM ?AUTO_8571 ?AUTO_8575 ) ( CAN_TRAVERSE ?AUTO_8580 ?AUTO_8573 ?AUTO_8575 ) ( VISIBLE ?AUTO_8573 ?AUTO_8575 ) ( CALIBRATION_TARGET ?AUTO_8574 ?AUTO_8579 ) ( VISIBLE_FROM ?AUTO_8579 ?AUTO_8573 ) ( not ( = ?AUTO_8571 ?AUTO_8579 ) ) ( CAN_TRAVERSE ?AUTO_8580 ?AUTO_8577 ?AUTO_8573 ) ( VISIBLE ?AUTO_8577 ?AUTO_8573 ) ( CAN_TRAVERSE ?AUTO_8580 ?AUTO_8576 ?AUTO_8577 ) ( AT ?AUTO_8580 ?AUTO_8576 ) ( VISIBLE ?AUTO_8576 ?AUTO_8577 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8580 ?AUTO_8576 ?AUTO_8577 )
      ( GET_IMAGE_DATA ?AUTO_8571 ?AUTO_8572 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8571 ?AUTO_8572 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8625 - OBJECTIVE
      ?AUTO_8626 - MODE
    )
    :vars
    (
      ?AUTO_8630 - LANDER
      ?AUTO_8634 - WAYPOINT
      ?AUTO_8629 - WAYPOINT
      ?AUTO_8633 - ROVER
      ?AUTO_8627 - WAYPOINT
      ?AUTO_8631 - WAYPOINT
      ?AUTO_8632 - CAMERA
      ?AUTO_8628 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8630 ?AUTO_8634 ) ( VISIBLE ?AUTO_8629 ?AUTO_8634 ) ( AVAILABLE ?AUTO_8633 ) ( CHANNEL_FREE ?AUTO_8630 ) ( not ( = ?AUTO_8629 ?AUTO_8634 ) ) ( CAN_TRAVERSE ?AUTO_8633 ?AUTO_8627 ?AUTO_8629 ) ( VISIBLE ?AUTO_8627 ?AUTO_8629 ) ( not ( = ?AUTO_8634 ?AUTO_8627 ) ) ( not ( = ?AUTO_8629 ?AUTO_8627 ) ) ( CAN_TRAVERSE ?AUTO_8633 ?AUTO_8631 ?AUTO_8627 ) ( VISIBLE ?AUTO_8631 ?AUTO_8627 ) ( not ( = ?AUTO_8634 ?AUTO_8631 ) ) ( not ( = ?AUTO_8629 ?AUTO_8631 ) ) ( not ( = ?AUTO_8627 ?AUTO_8631 ) ) ( ON_BOARD ?AUTO_8632 ?AUTO_8633 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8633 ) ( SUPPORTS ?AUTO_8632 ?AUTO_8626 ) ( VISIBLE_FROM ?AUTO_8625 ?AUTO_8631 ) ( CAN_TRAVERSE ?AUTO_8633 ?AUTO_8627 ?AUTO_8631 ) ( VISIBLE ?AUTO_8627 ?AUTO_8631 ) ( CALIBRATION_TARGET ?AUTO_8632 ?AUTO_8628 ) ( VISIBLE_FROM ?AUTO_8628 ?AUTO_8627 ) ( not ( = ?AUTO_8625 ?AUTO_8628 ) ) ( AT ?AUTO_8633 ?AUTO_8631 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8633 ?AUTO_8631 ?AUTO_8627 )
      ( GET_IMAGE_DATA ?AUTO_8625 ?AUTO_8626 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8625 ?AUTO_8626 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8735 - OBJECTIVE
      ?AUTO_8736 - MODE
    )
    :vars
    (
      ?AUTO_8738 - LANDER
      ?AUTO_8739 - WAYPOINT
      ?AUTO_8743 - WAYPOINT
      ?AUTO_8737 - ROVER
      ?AUTO_8741 - CAMERA
      ?AUTO_8742 - WAYPOINT
      ?AUTO_8740 - WAYPOINT
      ?AUTO_8744 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8738 ?AUTO_8739 ) ( VISIBLE ?AUTO_8743 ?AUTO_8739 ) ( AVAILABLE ?AUTO_8737 ) ( CHANNEL_FREE ?AUTO_8738 ) ( not ( = ?AUTO_8743 ?AUTO_8739 ) ) ( ON_BOARD ?AUTO_8741 ?AUTO_8737 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8737 ) ( SUPPORTS ?AUTO_8741 ?AUTO_8736 ) ( VISIBLE_FROM ?AUTO_8735 ?AUTO_8743 ) ( CAN_TRAVERSE ?AUTO_8737 ?AUTO_8742 ?AUTO_8743 ) ( VISIBLE ?AUTO_8742 ?AUTO_8743 ) ( not ( = ?AUTO_8739 ?AUTO_8742 ) ) ( not ( = ?AUTO_8743 ?AUTO_8742 ) ) ( CAN_TRAVERSE ?AUTO_8737 ?AUTO_8740 ?AUTO_8742 ) ( VISIBLE ?AUTO_8740 ?AUTO_8742 ) ( not ( = ?AUTO_8739 ?AUTO_8740 ) ) ( not ( = ?AUTO_8743 ?AUTO_8740 ) ) ( not ( = ?AUTO_8742 ?AUTO_8740 ) ) ( CALIBRATION_TARGET ?AUTO_8741 ?AUTO_8744 ) ( VISIBLE_FROM ?AUTO_8744 ?AUTO_8740 ) ( not ( = ?AUTO_8735 ?AUTO_8744 ) ) ( CAN_TRAVERSE ?AUTO_8737 ?AUTO_8743 ?AUTO_8740 ) ( AT ?AUTO_8737 ?AUTO_8743 ) ( VISIBLE ?AUTO_8743 ?AUTO_8740 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8737 ?AUTO_8743 ?AUTO_8740 )
      ( GET_IMAGE_DATA ?AUTO_8735 ?AUTO_8736 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8735 ?AUTO_8736 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8753 - OBJECTIVE
      ?AUTO_8754 - MODE
    )
    :vars
    (
      ?AUTO_8757 - LANDER
      ?AUTO_8756 - WAYPOINT
      ?AUTO_8761 - WAYPOINT
      ?AUTO_8759 - ROVER
      ?AUTO_8760 - CAMERA
      ?AUTO_8755 - WAYPOINT
      ?AUTO_8762 - WAYPOINT
      ?AUTO_8758 - OBJECTIVE
      ?AUTO_8763 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8757 ?AUTO_8756 ) ( VISIBLE ?AUTO_8761 ?AUTO_8756 ) ( AVAILABLE ?AUTO_8759 ) ( CHANNEL_FREE ?AUTO_8757 ) ( not ( = ?AUTO_8761 ?AUTO_8756 ) ) ( ON_BOARD ?AUTO_8760 ?AUTO_8759 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8759 ) ( SUPPORTS ?AUTO_8760 ?AUTO_8754 ) ( VISIBLE_FROM ?AUTO_8753 ?AUTO_8761 ) ( CAN_TRAVERSE ?AUTO_8759 ?AUTO_8755 ?AUTO_8761 ) ( VISIBLE ?AUTO_8755 ?AUTO_8761 ) ( not ( = ?AUTO_8756 ?AUTO_8755 ) ) ( not ( = ?AUTO_8761 ?AUTO_8755 ) ) ( CAN_TRAVERSE ?AUTO_8759 ?AUTO_8762 ?AUTO_8755 ) ( VISIBLE ?AUTO_8762 ?AUTO_8755 ) ( not ( = ?AUTO_8756 ?AUTO_8762 ) ) ( not ( = ?AUTO_8761 ?AUTO_8762 ) ) ( not ( = ?AUTO_8755 ?AUTO_8762 ) ) ( CALIBRATION_TARGET ?AUTO_8760 ?AUTO_8758 ) ( VISIBLE_FROM ?AUTO_8758 ?AUTO_8762 ) ( not ( = ?AUTO_8753 ?AUTO_8758 ) ) ( CAN_TRAVERSE ?AUTO_8759 ?AUTO_8761 ?AUTO_8762 ) ( VISIBLE ?AUTO_8761 ?AUTO_8762 ) ( CAN_TRAVERSE ?AUTO_8759 ?AUTO_8763 ?AUTO_8761 ) ( AT ?AUTO_8759 ?AUTO_8763 ) ( VISIBLE ?AUTO_8763 ?AUTO_8761 ) ( not ( = ?AUTO_8756 ?AUTO_8763 ) ) ( not ( = ?AUTO_8761 ?AUTO_8763 ) ) ( not ( = ?AUTO_8755 ?AUTO_8763 ) ) ( not ( = ?AUTO_8762 ?AUTO_8763 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8759 ?AUTO_8763 ?AUTO_8761 )
      ( GET_IMAGE_DATA ?AUTO_8753 ?AUTO_8754 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8753 ?AUTO_8754 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8770 - OBJECTIVE
      ?AUTO_8771 - MODE
    )
    :vars
    (
      ?AUTO_8778 - LANDER
      ?AUTO_8779 - WAYPOINT
      ?AUTO_8773 - WAYPOINT
      ?AUTO_8772 - ROVER
      ?AUTO_8777 - CAMERA
      ?AUTO_8775 - WAYPOINT
      ?AUTO_8776 - WAYPOINT
      ?AUTO_8780 - OBJECTIVE
      ?AUTO_8774 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8778 ?AUTO_8779 ) ( VISIBLE ?AUTO_8773 ?AUTO_8779 ) ( AVAILABLE ?AUTO_8772 ) ( CHANNEL_FREE ?AUTO_8778 ) ( not ( = ?AUTO_8773 ?AUTO_8779 ) ) ( ON_BOARD ?AUTO_8777 ?AUTO_8772 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8772 ) ( SUPPORTS ?AUTO_8777 ?AUTO_8771 ) ( VISIBLE_FROM ?AUTO_8770 ?AUTO_8773 ) ( CAN_TRAVERSE ?AUTO_8772 ?AUTO_8775 ?AUTO_8773 ) ( VISIBLE ?AUTO_8775 ?AUTO_8773 ) ( not ( = ?AUTO_8779 ?AUTO_8775 ) ) ( not ( = ?AUTO_8773 ?AUTO_8775 ) ) ( CAN_TRAVERSE ?AUTO_8772 ?AUTO_8776 ?AUTO_8775 ) ( VISIBLE ?AUTO_8776 ?AUTO_8775 ) ( not ( = ?AUTO_8779 ?AUTO_8776 ) ) ( not ( = ?AUTO_8773 ?AUTO_8776 ) ) ( not ( = ?AUTO_8775 ?AUTO_8776 ) ) ( CALIBRATION_TARGET ?AUTO_8777 ?AUTO_8780 ) ( VISIBLE_FROM ?AUTO_8780 ?AUTO_8776 ) ( not ( = ?AUTO_8770 ?AUTO_8780 ) ) ( CAN_TRAVERSE ?AUTO_8772 ?AUTO_8773 ?AUTO_8776 ) ( VISIBLE ?AUTO_8773 ?AUTO_8776 ) ( CAN_TRAVERSE ?AUTO_8772 ?AUTO_8774 ?AUTO_8773 ) ( VISIBLE ?AUTO_8774 ?AUTO_8773 ) ( not ( = ?AUTO_8779 ?AUTO_8774 ) ) ( not ( = ?AUTO_8773 ?AUTO_8774 ) ) ( not ( = ?AUTO_8775 ?AUTO_8774 ) ) ( not ( = ?AUTO_8776 ?AUTO_8774 ) ) ( CAN_TRAVERSE ?AUTO_8772 ?AUTO_8779 ?AUTO_8774 ) ( AT ?AUTO_8772 ?AUTO_8779 ) ( VISIBLE ?AUTO_8779 ?AUTO_8774 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8772 ?AUTO_8779 ?AUTO_8774 )
      ( GET_IMAGE_DATA ?AUTO_8770 ?AUTO_8771 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8770 ?AUTO_8771 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8842 - OBJECTIVE
      ?AUTO_8843 - MODE
    )
    :vars
    (
      ?AUTO_8846 - LANDER
      ?AUTO_8845 - WAYPOINT
      ?AUTO_8848 - WAYPOINT
      ?AUTO_8847 - ROVER
      ?AUTO_8849 - CAMERA
      ?AUTO_8844 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8846 ?AUTO_8845 ) ( VISIBLE ?AUTO_8848 ?AUTO_8845 ) ( AVAILABLE ?AUTO_8847 ) ( CHANNEL_FREE ?AUTO_8846 ) ( not ( = ?AUTO_8848 ?AUTO_8845 ) ) ( CALIBRATED ?AUTO_8849 ?AUTO_8847 ) ( ON_BOARD ?AUTO_8849 ?AUTO_8847 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8847 ) ( SUPPORTS ?AUTO_8849 ?AUTO_8843 ) ( VISIBLE_FROM ?AUTO_8842 ?AUTO_8848 ) ( CAN_TRAVERSE ?AUTO_8847 ?AUTO_8844 ?AUTO_8848 ) ( VISIBLE ?AUTO_8844 ?AUTO_8848 ) ( not ( = ?AUTO_8845 ?AUTO_8844 ) ) ( not ( = ?AUTO_8848 ?AUTO_8844 ) ) ( CAN_TRAVERSE ?AUTO_8847 ?AUTO_8845 ?AUTO_8844 ) ( AT ?AUTO_8847 ?AUTO_8845 ) ( VISIBLE ?AUTO_8845 ?AUTO_8844 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8847 ?AUTO_8845 ?AUTO_8844 )
      ( GET_IMAGE_DATA ?AUTO_8842 ?AUTO_8843 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8842 ?AUTO_8843 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8852 - OBJECTIVE
      ?AUTO_8853 - MODE
    )
    :vars
    (
      ?AUTO_8857 - LANDER
      ?AUTO_8858 - WAYPOINT
      ?AUTO_8854 - WAYPOINT
      ?AUTO_8855 - ROVER
      ?AUTO_8856 - CAMERA
      ?AUTO_8859 - WAYPOINT
      ?AUTO_8860 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8857 ?AUTO_8858 ) ( VISIBLE ?AUTO_8854 ?AUTO_8858 ) ( AVAILABLE ?AUTO_8855 ) ( CHANNEL_FREE ?AUTO_8857 ) ( not ( = ?AUTO_8854 ?AUTO_8858 ) ) ( CALIBRATED ?AUTO_8856 ?AUTO_8855 ) ( ON_BOARD ?AUTO_8856 ?AUTO_8855 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8855 ) ( SUPPORTS ?AUTO_8856 ?AUTO_8853 ) ( VISIBLE_FROM ?AUTO_8852 ?AUTO_8854 ) ( CAN_TRAVERSE ?AUTO_8855 ?AUTO_8859 ?AUTO_8854 ) ( VISIBLE ?AUTO_8859 ?AUTO_8854 ) ( not ( = ?AUTO_8858 ?AUTO_8859 ) ) ( not ( = ?AUTO_8854 ?AUTO_8859 ) ) ( CAN_TRAVERSE ?AUTO_8855 ?AUTO_8858 ?AUTO_8859 ) ( VISIBLE ?AUTO_8858 ?AUTO_8859 ) ( CAN_TRAVERSE ?AUTO_8855 ?AUTO_8860 ?AUTO_8858 ) ( AT ?AUTO_8855 ?AUTO_8860 ) ( VISIBLE ?AUTO_8860 ?AUTO_8858 ) ( not ( = ?AUTO_8858 ?AUTO_8860 ) ) ( not ( = ?AUTO_8854 ?AUTO_8860 ) ) ( not ( = ?AUTO_8859 ?AUTO_8860 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8855 ?AUTO_8860 ?AUTO_8858 )
      ( GET_IMAGE_DATA ?AUTO_8852 ?AUTO_8853 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8852 ?AUTO_8853 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8867 - OBJECTIVE
      ?AUTO_8868 - MODE
    )
    :vars
    (
      ?AUTO_8870 - LANDER
      ?AUTO_8874 - WAYPOINT
      ?AUTO_8871 - WAYPOINT
      ?AUTO_8872 - ROVER
      ?AUTO_8875 - CAMERA
      ?AUTO_8869 - WAYPOINT
      ?AUTO_8873 - WAYPOINT
      ?AUTO_8876 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8870 ?AUTO_8874 ) ( VISIBLE ?AUTO_8871 ?AUTO_8874 ) ( AVAILABLE ?AUTO_8872 ) ( CHANNEL_FREE ?AUTO_8870 ) ( not ( = ?AUTO_8871 ?AUTO_8874 ) ) ( ON_BOARD ?AUTO_8875 ?AUTO_8872 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8872 ) ( SUPPORTS ?AUTO_8875 ?AUTO_8868 ) ( VISIBLE_FROM ?AUTO_8867 ?AUTO_8871 ) ( CAN_TRAVERSE ?AUTO_8872 ?AUTO_8869 ?AUTO_8871 ) ( VISIBLE ?AUTO_8869 ?AUTO_8871 ) ( not ( = ?AUTO_8874 ?AUTO_8869 ) ) ( not ( = ?AUTO_8871 ?AUTO_8869 ) ) ( CAN_TRAVERSE ?AUTO_8872 ?AUTO_8874 ?AUTO_8869 ) ( VISIBLE ?AUTO_8874 ?AUTO_8869 ) ( CAN_TRAVERSE ?AUTO_8872 ?AUTO_8873 ?AUTO_8874 ) ( AT ?AUTO_8872 ?AUTO_8873 ) ( VISIBLE ?AUTO_8873 ?AUTO_8874 ) ( not ( = ?AUTO_8874 ?AUTO_8873 ) ) ( not ( = ?AUTO_8871 ?AUTO_8873 ) ) ( not ( = ?AUTO_8869 ?AUTO_8873 ) ) ( CALIBRATION_TARGET ?AUTO_8875 ?AUTO_8876 ) ( VISIBLE_FROM ?AUTO_8876 ?AUTO_8873 ) ( not ( = ?AUTO_8867 ?AUTO_8876 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_8872 ?AUTO_8875 ?AUTO_8876 ?AUTO_8873 )
      ( GET_IMAGE_DATA ?AUTO_8867 ?AUTO_8868 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8867 ?AUTO_8868 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8911 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8913 - LANDER
      ?AUTO_8915 - WAYPOINT
      ?AUTO_8914 - ROVER
      ?AUTO_8916 - STORE
      ?AUTO_8912 - WAYPOINT
      ?AUTO_8917 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8913 ?AUTO_8915 ) ( VISIBLE ?AUTO_8911 ?AUTO_8915 ) ( AVAILABLE ?AUTO_8914 ) ( CHANNEL_FREE ?AUTO_8913 ) ( not ( = ?AUTO_8911 ?AUTO_8915 ) ) ( AT_SOIL_SAMPLE ?AUTO_8911 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8914 ) ( STORE_OF ?AUTO_8916 ?AUTO_8914 ) ( CAN_TRAVERSE ?AUTO_8914 ?AUTO_8912 ?AUTO_8911 ) ( VISIBLE ?AUTO_8912 ?AUTO_8911 ) ( not ( = ?AUTO_8911 ?AUTO_8912 ) ) ( not ( = ?AUTO_8915 ?AUTO_8912 ) ) ( CAN_TRAVERSE ?AUTO_8914 ?AUTO_8915 ?AUTO_8912 ) ( VISIBLE ?AUTO_8915 ?AUTO_8912 ) ( FULL ?AUTO_8916 ) ( CAN_TRAVERSE ?AUTO_8914 ?AUTO_8917 ?AUTO_8915 ) ( AT ?AUTO_8914 ?AUTO_8917 ) ( VISIBLE ?AUTO_8917 ?AUTO_8915 ) ( not ( = ?AUTO_8911 ?AUTO_8917 ) ) ( not ( = ?AUTO_8915 ?AUTO_8917 ) ) ( not ( = ?AUTO_8912 ?AUTO_8917 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8914 ?AUTO_8917 ?AUTO_8915 )
      ( GET_SOIL_DATA ?AUTO_8911 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8911 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8919 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8922 - LANDER
      ?AUTO_8925 - WAYPOINT
      ?AUTO_8923 - ROVER
      ?AUTO_8924 - STORE
      ?AUTO_8920 - WAYPOINT
      ?AUTO_8921 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8922 ?AUTO_8925 ) ( VISIBLE ?AUTO_8919 ?AUTO_8925 ) ( AVAILABLE ?AUTO_8923 ) ( CHANNEL_FREE ?AUTO_8922 ) ( not ( = ?AUTO_8919 ?AUTO_8925 ) ) ( AT_SOIL_SAMPLE ?AUTO_8919 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8923 ) ( STORE_OF ?AUTO_8924 ?AUTO_8923 ) ( CAN_TRAVERSE ?AUTO_8923 ?AUTO_8920 ?AUTO_8919 ) ( VISIBLE ?AUTO_8920 ?AUTO_8919 ) ( not ( = ?AUTO_8919 ?AUTO_8920 ) ) ( not ( = ?AUTO_8925 ?AUTO_8920 ) ) ( CAN_TRAVERSE ?AUTO_8923 ?AUTO_8925 ?AUTO_8920 ) ( VISIBLE ?AUTO_8925 ?AUTO_8920 ) ( CAN_TRAVERSE ?AUTO_8923 ?AUTO_8921 ?AUTO_8925 ) ( AT ?AUTO_8923 ?AUTO_8921 ) ( VISIBLE ?AUTO_8921 ?AUTO_8925 ) ( not ( = ?AUTO_8919 ?AUTO_8921 ) ) ( not ( = ?AUTO_8925 ?AUTO_8921 ) ) ( not ( = ?AUTO_8920 ?AUTO_8921 ) ) ( AT_ROCK_SAMPLE ?AUTO_8921 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8923 ) ( EMPTY ?AUTO_8924 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_8923 ?AUTO_8924 ?AUTO_8921 )
      ( GET_SOIL_DATA ?AUTO_8919 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8919 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9001 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9005 - LANDER
      ?AUTO_9004 - WAYPOINT
      ?AUTO_9006 - ROVER
      ?AUTO_9003 - STORE
      ?AUTO_9002 - WAYPOINT
      ?AUTO_9007 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9005 ?AUTO_9004 ) ( VISIBLE ?AUTO_9001 ?AUTO_9004 ) ( AVAILABLE ?AUTO_9006 ) ( CHANNEL_FREE ?AUTO_9005 ) ( not ( = ?AUTO_9001 ?AUTO_9004 ) ) ( AT_ROCK_SAMPLE ?AUTO_9001 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9006 ) ( STORE_OF ?AUTO_9003 ?AUTO_9006 ) ( EMPTY ?AUTO_9003 ) ( CAN_TRAVERSE ?AUTO_9006 ?AUTO_9004 ?AUTO_9001 ) ( VISIBLE ?AUTO_9004 ?AUTO_9001 ) ( CAN_TRAVERSE ?AUTO_9006 ?AUTO_9002 ?AUTO_9004 ) ( VISIBLE ?AUTO_9002 ?AUTO_9004 ) ( not ( = ?AUTO_9001 ?AUTO_9002 ) ) ( not ( = ?AUTO_9004 ?AUTO_9002 ) ) ( CAN_TRAVERSE ?AUTO_9006 ?AUTO_9007 ?AUTO_9002 ) ( AT ?AUTO_9006 ?AUTO_9007 ) ( VISIBLE ?AUTO_9007 ?AUTO_9002 ) ( not ( = ?AUTO_9001 ?AUTO_9007 ) ) ( not ( = ?AUTO_9004 ?AUTO_9007 ) ) ( not ( = ?AUTO_9002 ?AUTO_9007 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9006 ?AUTO_9007 ?AUTO_9002 )
      ( GET_ROCK_DATA ?AUTO_9001 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9001 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9254 - OBJECTIVE
      ?AUTO_9255 - MODE
    )
    :vars
    (
      ?AUTO_9261 - LANDER
      ?AUTO_9259 - WAYPOINT
      ?AUTO_9257 - WAYPOINT
      ?AUTO_9260 - ROVER
      ?AUTO_9258 - CAMERA
      ?AUTO_9256 - WAYPOINT
      ?AUTO_9262 - OBJECTIVE
      ?AUTO_9263 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9261 ?AUTO_9259 ) ( VISIBLE ?AUTO_9257 ?AUTO_9259 ) ( AVAILABLE ?AUTO_9260 ) ( CHANNEL_FREE ?AUTO_9261 ) ( not ( = ?AUTO_9257 ?AUTO_9259 ) ) ( ON_BOARD ?AUTO_9258 ?AUTO_9260 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9260 ) ( SUPPORTS ?AUTO_9258 ?AUTO_9255 ) ( VISIBLE_FROM ?AUTO_9254 ?AUTO_9257 ) ( CAN_TRAVERSE ?AUTO_9260 ?AUTO_9256 ?AUTO_9257 ) ( VISIBLE ?AUTO_9256 ?AUTO_9257 ) ( not ( = ?AUTO_9259 ?AUTO_9256 ) ) ( not ( = ?AUTO_9257 ?AUTO_9256 ) ) ( CALIBRATION_TARGET ?AUTO_9258 ?AUTO_9262 ) ( VISIBLE_FROM ?AUTO_9262 ?AUTO_9256 ) ( not ( = ?AUTO_9254 ?AUTO_9262 ) ) ( CAN_TRAVERSE ?AUTO_9260 ?AUTO_9263 ?AUTO_9256 ) ( AT ?AUTO_9260 ?AUTO_9263 ) ( VISIBLE ?AUTO_9263 ?AUTO_9256 ) ( not ( = ?AUTO_9259 ?AUTO_9263 ) ) ( not ( = ?AUTO_9257 ?AUTO_9263 ) ) ( not ( = ?AUTO_9256 ?AUTO_9263 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9260 ?AUTO_9263 ?AUTO_9256 )
      ( GET_IMAGE_DATA ?AUTO_9254 ?AUTO_9255 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9254 ?AUTO_9255 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9272 - OBJECTIVE
      ?AUTO_9273 - MODE
    )
    :vars
    (
      ?AUTO_9280 - LANDER
      ?AUTO_9278 - WAYPOINT
      ?AUTO_9279 - WAYPOINT
      ?AUTO_9274 - ROVER
      ?AUTO_9276 - CAMERA
      ?AUTO_9277 - WAYPOINT
      ?AUTO_9281 - OBJECTIVE
      ?AUTO_9275 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9280 ?AUTO_9278 ) ( VISIBLE ?AUTO_9279 ?AUTO_9278 ) ( AVAILABLE ?AUTO_9274 ) ( CHANNEL_FREE ?AUTO_9280 ) ( not ( = ?AUTO_9279 ?AUTO_9278 ) ) ( ON_BOARD ?AUTO_9276 ?AUTO_9274 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9274 ) ( SUPPORTS ?AUTO_9276 ?AUTO_9273 ) ( VISIBLE_FROM ?AUTO_9272 ?AUTO_9279 ) ( CAN_TRAVERSE ?AUTO_9274 ?AUTO_9277 ?AUTO_9279 ) ( VISIBLE ?AUTO_9277 ?AUTO_9279 ) ( not ( = ?AUTO_9278 ?AUTO_9277 ) ) ( not ( = ?AUTO_9279 ?AUTO_9277 ) ) ( CALIBRATION_TARGET ?AUTO_9276 ?AUTO_9281 ) ( VISIBLE_FROM ?AUTO_9281 ?AUTO_9277 ) ( not ( = ?AUTO_9272 ?AUTO_9281 ) ) ( CAN_TRAVERSE ?AUTO_9274 ?AUTO_9275 ?AUTO_9277 ) ( VISIBLE ?AUTO_9275 ?AUTO_9277 ) ( not ( = ?AUTO_9278 ?AUTO_9275 ) ) ( not ( = ?AUTO_9279 ?AUTO_9275 ) ) ( not ( = ?AUTO_9277 ?AUTO_9275 ) ) ( CAN_TRAVERSE ?AUTO_9274 ?AUTO_9278 ?AUTO_9275 ) ( AT ?AUTO_9274 ?AUTO_9278 ) ( VISIBLE ?AUTO_9278 ?AUTO_9275 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9274 ?AUTO_9278 ?AUTO_9275 )
      ( GET_IMAGE_DATA ?AUTO_9272 ?AUTO_9273 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9272 ?AUTO_9273 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9290 - OBJECTIVE
      ?AUTO_9291 - MODE
    )
    :vars
    (
      ?AUTO_9295 - LANDER
      ?AUTO_9296 - WAYPOINT
      ?AUTO_9294 - WAYPOINT
      ?AUTO_9299 - ROVER
      ?AUTO_9297 - CAMERA
      ?AUTO_9298 - WAYPOINT
      ?AUTO_9293 - OBJECTIVE
      ?AUTO_9292 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9295 ?AUTO_9296 ) ( VISIBLE ?AUTO_9294 ?AUTO_9296 ) ( AVAILABLE ?AUTO_9299 ) ( CHANNEL_FREE ?AUTO_9295 ) ( not ( = ?AUTO_9294 ?AUTO_9296 ) ) ( ON_BOARD ?AUTO_9297 ?AUTO_9299 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9299 ) ( SUPPORTS ?AUTO_9297 ?AUTO_9291 ) ( VISIBLE_FROM ?AUTO_9290 ?AUTO_9294 ) ( CAN_TRAVERSE ?AUTO_9299 ?AUTO_9298 ?AUTO_9294 ) ( VISIBLE ?AUTO_9298 ?AUTO_9294 ) ( not ( = ?AUTO_9296 ?AUTO_9298 ) ) ( not ( = ?AUTO_9294 ?AUTO_9298 ) ) ( CALIBRATION_TARGET ?AUTO_9297 ?AUTO_9293 ) ( VISIBLE_FROM ?AUTO_9293 ?AUTO_9298 ) ( not ( = ?AUTO_9290 ?AUTO_9293 ) ) ( CAN_TRAVERSE ?AUTO_9299 ?AUTO_9292 ?AUTO_9298 ) ( VISIBLE ?AUTO_9292 ?AUTO_9298 ) ( not ( = ?AUTO_9296 ?AUTO_9292 ) ) ( not ( = ?AUTO_9294 ?AUTO_9292 ) ) ( not ( = ?AUTO_9298 ?AUTO_9292 ) ) ( CAN_TRAVERSE ?AUTO_9299 ?AUTO_9296 ?AUTO_9292 ) ( VISIBLE ?AUTO_9296 ?AUTO_9292 ) ( CAN_TRAVERSE ?AUTO_9299 ?AUTO_9294 ?AUTO_9296 ) ( AT ?AUTO_9299 ?AUTO_9294 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9299 ?AUTO_9294 ?AUTO_9296 )
      ( GET_IMAGE_DATA ?AUTO_9290 ?AUTO_9291 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9290 ?AUTO_9291 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9322 - OBJECTIVE
      ?AUTO_9323 - MODE
    )
    :vars
    (
      ?AUTO_9329 - LANDER
      ?AUTO_9331 - WAYPOINT
      ?AUTO_9330 - WAYPOINT
      ?AUTO_9328 - ROVER
      ?AUTO_9326 - CAMERA
      ?AUTO_9324 - WAYPOINT
      ?AUTO_9327 - OBJECTIVE
      ?AUTO_9325 - WAYPOINT
      ?AUTO_9332 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9329 ?AUTO_9331 ) ( VISIBLE ?AUTO_9330 ?AUTO_9331 ) ( AVAILABLE ?AUTO_9328 ) ( CHANNEL_FREE ?AUTO_9329 ) ( not ( = ?AUTO_9330 ?AUTO_9331 ) ) ( ON_BOARD ?AUTO_9326 ?AUTO_9328 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9328 ) ( SUPPORTS ?AUTO_9326 ?AUTO_9323 ) ( VISIBLE_FROM ?AUTO_9322 ?AUTO_9330 ) ( CAN_TRAVERSE ?AUTO_9328 ?AUTO_9324 ?AUTO_9330 ) ( VISIBLE ?AUTO_9324 ?AUTO_9330 ) ( not ( = ?AUTO_9331 ?AUTO_9324 ) ) ( not ( = ?AUTO_9330 ?AUTO_9324 ) ) ( CALIBRATION_TARGET ?AUTO_9326 ?AUTO_9327 ) ( VISIBLE_FROM ?AUTO_9327 ?AUTO_9324 ) ( not ( = ?AUTO_9322 ?AUTO_9327 ) ) ( CAN_TRAVERSE ?AUTO_9328 ?AUTO_9325 ?AUTO_9324 ) ( VISIBLE ?AUTO_9325 ?AUTO_9324 ) ( not ( = ?AUTO_9331 ?AUTO_9325 ) ) ( not ( = ?AUTO_9330 ?AUTO_9325 ) ) ( not ( = ?AUTO_9324 ?AUTO_9325 ) ) ( CAN_TRAVERSE ?AUTO_9328 ?AUTO_9331 ?AUTO_9325 ) ( VISIBLE ?AUTO_9331 ?AUTO_9325 ) ( CAN_TRAVERSE ?AUTO_9328 ?AUTO_9330 ?AUTO_9331 ) ( CAN_TRAVERSE ?AUTO_9328 ?AUTO_9332 ?AUTO_9330 ) ( AT ?AUTO_9328 ?AUTO_9332 ) ( VISIBLE ?AUTO_9332 ?AUTO_9330 ) ( not ( = ?AUTO_9331 ?AUTO_9332 ) ) ( not ( = ?AUTO_9330 ?AUTO_9332 ) ) ( not ( = ?AUTO_9324 ?AUTO_9332 ) ) ( not ( = ?AUTO_9325 ?AUTO_9332 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9328 ?AUTO_9332 ?AUTO_9330 )
      ( GET_IMAGE_DATA ?AUTO_9322 ?AUTO_9323 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9322 ?AUTO_9323 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9567 - OBJECTIVE
      ?AUTO_9568 - MODE
    )
    :vars
    (
      ?AUTO_9574 - LANDER
      ?AUTO_9576 - WAYPOINT
      ?AUTO_9571 - WAYPOINT
      ?AUTO_9573 - ROVER
      ?AUTO_9572 - CAMERA
      ?AUTO_9570 - WAYPOINT
      ?AUTO_9569 - WAYPOINT
      ?AUTO_9575 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9574 ?AUTO_9576 ) ( VISIBLE ?AUTO_9571 ?AUTO_9576 ) ( AVAILABLE ?AUTO_9573 ) ( CHANNEL_FREE ?AUTO_9574 ) ( not ( = ?AUTO_9571 ?AUTO_9576 ) ) ( ON_BOARD ?AUTO_9572 ?AUTO_9573 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9573 ) ( SUPPORTS ?AUTO_9572 ?AUTO_9568 ) ( VISIBLE_FROM ?AUTO_9567 ?AUTO_9571 ) ( CAN_TRAVERSE ?AUTO_9573 ?AUTO_9570 ?AUTO_9571 ) ( VISIBLE ?AUTO_9570 ?AUTO_9571 ) ( not ( = ?AUTO_9576 ?AUTO_9570 ) ) ( not ( = ?AUTO_9571 ?AUTO_9570 ) ) ( CAN_TRAVERSE ?AUTO_9573 ?AUTO_9569 ?AUTO_9570 ) ( VISIBLE ?AUTO_9569 ?AUTO_9570 ) ( not ( = ?AUTO_9576 ?AUTO_9569 ) ) ( not ( = ?AUTO_9571 ?AUTO_9569 ) ) ( not ( = ?AUTO_9570 ?AUTO_9569 ) ) ( CALIBRATION_TARGET ?AUTO_9572 ?AUTO_9575 ) ( VISIBLE_FROM ?AUTO_9575 ?AUTO_9569 ) ( not ( = ?AUTO_9567 ?AUTO_9575 ) ) ( CAN_TRAVERSE ?AUTO_9573 ?AUTO_9576 ?AUTO_9569 ) ( AT ?AUTO_9573 ?AUTO_9576 ) ( VISIBLE ?AUTO_9576 ?AUTO_9569 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9573 ?AUTO_9576 ?AUTO_9569 )
      ( GET_IMAGE_DATA ?AUTO_9567 ?AUTO_9568 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9567 ?AUTO_9568 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9649 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9653 - LANDER
      ?AUTO_9651 - WAYPOINT
      ?AUTO_9654 - ROVER
      ?AUTO_9650 - STORE
      ?AUTO_9652 - WAYPOINT
      ?AUTO_9655 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9653 ?AUTO_9651 ) ( VISIBLE ?AUTO_9649 ?AUTO_9651 ) ( AVAILABLE ?AUTO_9654 ) ( CHANNEL_FREE ?AUTO_9653 ) ( not ( = ?AUTO_9649 ?AUTO_9651 ) ) ( AT_SOIL_SAMPLE ?AUTO_9649 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9654 ) ( STORE_OF ?AUTO_9650 ?AUTO_9654 ) ( EMPTY ?AUTO_9650 ) ( CAN_TRAVERSE ?AUTO_9654 ?AUTO_9652 ?AUTO_9649 ) ( VISIBLE ?AUTO_9652 ?AUTO_9649 ) ( not ( = ?AUTO_9649 ?AUTO_9652 ) ) ( not ( = ?AUTO_9651 ?AUTO_9652 ) ) ( CAN_TRAVERSE ?AUTO_9654 ?AUTO_9651 ?AUTO_9652 ) ( VISIBLE ?AUTO_9651 ?AUTO_9652 ) ( CAN_TRAVERSE ?AUTO_9654 ?AUTO_9655 ?AUTO_9651 ) ( AT ?AUTO_9654 ?AUTO_9655 ) ( VISIBLE ?AUTO_9655 ?AUTO_9651 ) ( not ( = ?AUTO_9649 ?AUTO_9655 ) ) ( not ( = ?AUTO_9651 ?AUTO_9655 ) ) ( not ( = ?AUTO_9652 ?AUTO_9655 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9654 ?AUTO_9655 ?AUTO_9651 )
      ( GET_SOIL_DATA ?AUTO_9649 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9649 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9774 - OBJECTIVE
      ?AUTO_9775 - MODE
    )
    :vars
    (
      ?AUTO_9777 - LANDER
      ?AUTO_9783 - WAYPOINT
      ?AUTO_9780 - WAYPOINT
      ?AUTO_9778 - ROVER
      ?AUTO_9779 - WAYPOINT
      ?AUTO_9776 - WAYPOINT
      ?AUTO_9782 - CAMERA
      ?AUTO_9781 - OBJECTIVE
      ?AUTO_9784 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9777 ?AUTO_9783 ) ( VISIBLE ?AUTO_9780 ?AUTO_9783 ) ( AVAILABLE ?AUTO_9778 ) ( CHANNEL_FREE ?AUTO_9777 ) ( not ( = ?AUTO_9780 ?AUTO_9783 ) ) ( CAN_TRAVERSE ?AUTO_9778 ?AUTO_9779 ?AUTO_9780 ) ( VISIBLE ?AUTO_9779 ?AUTO_9780 ) ( not ( = ?AUTO_9783 ?AUTO_9779 ) ) ( not ( = ?AUTO_9780 ?AUTO_9779 ) ) ( CAN_TRAVERSE ?AUTO_9778 ?AUTO_9776 ?AUTO_9779 ) ( VISIBLE ?AUTO_9776 ?AUTO_9779 ) ( not ( = ?AUTO_9783 ?AUTO_9776 ) ) ( not ( = ?AUTO_9780 ?AUTO_9776 ) ) ( not ( = ?AUTO_9779 ?AUTO_9776 ) ) ( ON_BOARD ?AUTO_9782 ?AUTO_9778 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9778 ) ( SUPPORTS ?AUTO_9782 ?AUTO_9775 ) ( VISIBLE_FROM ?AUTO_9774 ?AUTO_9776 ) ( CAN_TRAVERSE ?AUTO_9778 ?AUTO_9779 ?AUTO_9776 ) ( VISIBLE ?AUTO_9779 ?AUTO_9776 ) ( CALIBRATION_TARGET ?AUTO_9782 ?AUTO_9781 ) ( VISIBLE_FROM ?AUTO_9781 ?AUTO_9779 ) ( not ( = ?AUTO_9774 ?AUTO_9781 ) ) ( CAN_TRAVERSE ?AUTO_9778 ?AUTO_9784 ?AUTO_9776 ) ( AT ?AUTO_9778 ?AUTO_9784 ) ( VISIBLE ?AUTO_9784 ?AUTO_9776 ) ( not ( = ?AUTO_9783 ?AUTO_9784 ) ) ( not ( = ?AUTO_9780 ?AUTO_9784 ) ) ( not ( = ?AUTO_9779 ?AUTO_9784 ) ) ( not ( = ?AUTO_9776 ?AUTO_9784 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9778 ?AUTO_9784 ?AUTO_9776 )
      ( GET_IMAGE_DATA ?AUTO_9774 ?AUTO_9775 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9774 ?AUTO_9775 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9785 - OBJECTIVE
      ?AUTO_9786 - MODE
    )
    :vars
    (
      ?AUTO_9790 - LANDER
      ?AUTO_9791 - WAYPOINT
      ?AUTO_9794 - WAYPOINT
      ?AUTO_9787 - ROVER
      ?AUTO_9795 - WAYPOINT
      ?AUTO_9788 - WAYPOINT
      ?AUTO_9792 - CAMERA
      ?AUTO_9789 - OBJECTIVE
      ?AUTO_9793 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9790 ?AUTO_9791 ) ( VISIBLE ?AUTO_9794 ?AUTO_9791 ) ( AVAILABLE ?AUTO_9787 ) ( CHANNEL_FREE ?AUTO_9790 ) ( not ( = ?AUTO_9794 ?AUTO_9791 ) ) ( CAN_TRAVERSE ?AUTO_9787 ?AUTO_9795 ?AUTO_9794 ) ( VISIBLE ?AUTO_9795 ?AUTO_9794 ) ( not ( = ?AUTO_9791 ?AUTO_9795 ) ) ( not ( = ?AUTO_9794 ?AUTO_9795 ) ) ( CAN_TRAVERSE ?AUTO_9787 ?AUTO_9788 ?AUTO_9795 ) ( VISIBLE ?AUTO_9788 ?AUTO_9795 ) ( not ( = ?AUTO_9791 ?AUTO_9788 ) ) ( not ( = ?AUTO_9794 ?AUTO_9788 ) ) ( not ( = ?AUTO_9795 ?AUTO_9788 ) ) ( ON_BOARD ?AUTO_9792 ?AUTO_9787 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9787 ) ( SUPPORTS ?AUTO_9792 ?AUTO_9786 ) ( VISIBLE_FROM ?AUTO_9785 ?AUTO_9788 ) ( CAN_TRAVERSE ?AUTO_9787 ?AUTO_9795 ?AUTO_9788 ) ( VISIBLE ?AUTO_9795 ?AUTO_9788 ) ( CALIBRATION_TARGET ?AUTO_9792 ?AUTO_9789 ) ( VISIBLE_FROM ?AUTO_9789 ?AUTO_9795 ) ( not ( = ?AUTO_9785 ?AUTO_9789 ) ) ( CAN_TRAVERSE ?AUTO_9787 ?AUTO_9793 ?AUTO_9788 ) ( VISIBLE ?AUTO_9793 ?AUTO_9788 ) ( not ( = ?AUTO_9791 ?AUTO_9793 ) ) ( not ( = ?AUTO_9794 ?AUTO_9793 ) ) ( not ( = ?AUTO_9795 ?AUTO_9793 ) ) ( not ( = ?AUTO_9788 ?AUTO_9793 ) ) ( CAN_TRAVERSE ?AUTO_9787 ?AUTO_9794 ?AUTO_9793 ) ( AT ?AUTO_9787 ?AUTO_9794 ) ( VISIBLE ?AUTO_9794 ?AUTO_9793 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9787 ?AUTO_9794 ?AUTO_9793 )
      ( GET_IMAGE_DATA ?AUTO_9785 ?AUTO_9786 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9785 ?AUTO_9786 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9847 - OBJECTIVE
      ?AUTO_9848 - MODE
    )
    :vars
    (
      ?AUTO_9852 - LANDER
      ?AUTO_9855 - WAYPOINT
      ?AUTO_9853 - WAYPOINT
      ?AUTO_9851 - ROVER
      ?AUTO_9850 - WAYPOINT
      ?AUTO_9854 - CAMERA
      ?AUTO_9849 - WAYPOINT
      ?AUTO_9856 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9852 ?AUTO_9855 ) ( VISIBLE ?AUTO_9853 ?AUTO_9855 ) ( AVAILABLE ?AUTO_9851 ) ( CHANNEL_FREE ?AUTO_9852 ) ( not ( = ?AUTO_9853 ?AUTO_9855 ) ) ( CAN_TRAVERSE ?AUTO_9851 ?AUTO_9850 ?AUTO_9853 ) ( VISIBLE ?AUTO_9850 ?AUTO_9853 ) ( not ( = ?AUTO_9855 ?AUTO_9850 ) ) ( not ( = ?AUTO_9853 ?AUTO_9850 ) ) ( ON_BOARD ?AUTO_9854 ?AUTO_9851 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9851 ) ( SUPPORTS ?AUTO_9854 ?AUTO_9848 ) ( VISIBLE_FROM ?AUTO_9847 ?AUTO_9850 ) ( CALIBRATION_TARGET ?AUTO_9854 ?AUTO_9847 ) ( CAN_TRAVERSE ?AUTO_9851 ?AUTO_9849 ?AUTO_9850 ) ( VISIBLE ?AUTO_9849 ?AUTO_9850 ) ( not ( = ?AUTO_9855 ?AUTO_9849 ) ) ( not ( = ?AUTO_9853 ?AUTO_9849 ) ) ( not ( = ?AUTO_9850 ?AUTO_9849 ) ) ( CAN_TRAVERSE ?AUTO_9851 ?AUTO_9856 ?AUTO_9849 ) ( AT ?AUTO_9851 ?AUTO_9856 ) ( VISIBLE ?AUTO_9856 ?AUTO_9849 ) ( not ( = ?AUTO_9855 ?AUTO_9856 ) ) ( not ( = ?AUTO_9853 ?AUTO_9856 ) ) ( not ( = ?AUTO_9850 ?AUTO_9856 ) ) ( not ( = ?AUTO_9849 ?AUTO_9856 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9851 ?AUTO_9856 ?AUTO_9849 )
      ( GET_IMAGE_DATA ?AUTO_9847 ?AUTO_9848 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9847 ?AUTO_9848 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9857 - OBJECTIVE
      ?AUTO_9858 - MODE
    )
    :vars
    (
      ?AUTO_9863 - LANDER
      ?AUTO_9865 - WAYPOINT
      ?AUTO_9864 - WAYPOINT
      ?AUTO_9861 - ROVER
      ?AUTO_9859 - WAYPOINT
      ?AUTO_9866 - CAMERA
      ?AUTO_9862 - WAYPOINT
      ?AUTO_9860 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9863 ?AUTO_9865 ) ( VISIBLE ?AUTO_9864 ?AUTO_9865 ) ( AVAILABLE ?AUTO_9861 ) ( CHANNEL_FREE ?AUTO_9863 ) ( not ( = ?AUTO_9864 ?AUTO_9865 ) ) ( CAN_TRAVERSE ?AUTO_9861 ?AUTO_9859 ?AUTO_9864 ) ( VISIBLE ?AUTO_9859 ?AUTO_9864 ) ( not ( = ?AUTO_9865 ?AUTO_9859 ) ) ( not ( = ?AUTO_9864 ?AUTO_9859 ) ) ( ON_BOARD ?AUTO_9866 ?AUTO_9861 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9861 ) ( SUPPORTS ?AUTO_9866 ?AUTO_9858 ) ( VISIBLE_FROM ?AUTO_9857 ?AUTO_9859 ) ( CALIBRATION_TARGET ?AUTO_9866 ?AUTO_9857 ) ( CAN_TRAVERSE ?AUTO_9861 ?AUTO_9862 ?AUTO_9859 ) ( VISIBLE ?AUTO_9862 ?AUTO_9859 ) ( not ( = ?AUTO_9865 ?AUTO_9862 ) ) ( not ( = ?AUTO_9864 ?AUTO_9862 ) ) ( not ( = ?AUTO_9859 ?AUTO_9862 ) ) ( CAN_TRAVERSE ?AUTO_9861 ?AUTO_9860 ?AUTO_9862 ) ( VISIBLE ?AUTO_9860 ?AUTO_9862 ) ( not ( = ?AUTO_9865 ?AUTO_9860 ) ) ( not ( = ?AUTO_9864 ?AUTO_9860 ) ) ( not ( = ?AUTO_9859 ?AUTO_9860 ) ) ( not ( = ?AUTO_9862 ?AUTO_9860 ) ) ( CAN_TRAVERSE ?AUTO_9861 ?AUTO_9864 ?AUTO_9860 ) ( AT ?AUTO_9861 ?AUTO_9864 ) ( VISIBLE ?AUTO_9864 ?AUTO_9860 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9861 ?AUTO_9864 ?AUTO_9860 )
      ( GET_IMAGE_DATA ?AUTO_9857 ?AUTO_9858 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9857 ?AUTO_9858 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9906 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9907 - LANDER
      ?AUTO_9910 - WAYPOINT
      ?AUTO_9911 - ROVER
      ?AUTO_9909 - STORE
      ?AUTO_9912 - WAYPOINT
      ?AUTO_9908 - WAYPOINT
      ?AUTO_9913 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9907 ?AUTO_9910 ) ( VISIBLE ?AUTO_9906 ?AUTO_9910 ) ( AVAILABLE ?AUTO_9911 ) ( CHANNEL_FREE ?AUTO_9907 ) ( not ( = ?AUTO_9906 ?AUTO_9910 ) ) ( AT_SOIL_SAMPLE ?AUTO_9906 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9911 ) ( STORE_OF ?AUTO_9909 ?AUTO_9911 ) ( EMPTY ?AUTO_9909 ) ( CAN_TRAVERSE ?AUTO_9911 ?AUTO_9912 ?AUTO_9906 ) ( VISIBLE ?AUTO_9912 ?AUTO_9906 ) ( not ( = ?AUTO_9906 ?AUTO_9912 ) ) ( not ( = ?AUTO_9910 ?AUTO_9912 ) ) ( CAN_TRAVERSE ?AUTO_9911 ?AUTO_9908 ?AUTO_9912 ) ( VISIBLE ?AUTO_9908 ?AUTO_9912 ) ( not ( = ?AUTO_9906 ?AUTO_9908 ) ) ( not ( = ?AUTO_9910 ?AUTO_9908 ) ) ( not ( = ?AUTO_9912 ?AUTO_9908 ) ) ( CAN_TRAVERSE ?AUTO_9911 ?AUTO_9913 ?AUTO_9908 ) ( AT ?AUTO_9911 ?AUTO_9913 ) ( VISIBLE ?AUTO_9913 ?AUTO_9908 ) ( not ( = ?AUTO_9906 ?AUTO_9913 ) ) ( not ( = ?AUTO_9910 ?AUTO_9913 ) ) ( not ( = ?AUTO_9912 ?AUTO_9913 ) ) ( not ( = ?AUTO_9908 ?AUTO_9913 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9911 ?AUTO_9913 ?AUTO_9908 )
      ( GET_SOIL_DATA ?AUTO_9906 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9906 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10028 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10029 - LANDER
      ?AUTO_10032 - WAYPOINT
      ?AUTO_10031 - ROVER
      ?AUTO_10033 - STORE
      ?AUTO_10034 - WAYPOINT
      ?AUTO_10030 - WAYPOINT
      ?AUTO_10035 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10029 ?AUTO_10028 ) ( VISIBLE ?AUTO_10032 ?AUTO_10028 ) ( AVAILABLE ?AUTO_10031 ) ( CHANNEL_FREE ?AUTO_10029 ) ( not ( = ?AUTO_10028 ?AUTO_10032 ) ) ( CAN_TRAVERSE ?AUTO_10031 ?AUTO_10028 ?AUTO_10032 ) ( VISIBLE ?AUTO_10028 ?AUTO_10032 ) ( AT_ROCK_SAMPLE ?AUTO_10028 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10031 ) ( STORE_OF ?AUTO_10033 ?AUTO_10031 ) ( EMPTY ?AUTO_10033 ) ( CAN_TRAVERSE ?AUTO_10031 ?AUTO_10032 ?AUTO_10028 ) ( CAN_TRAVERSE ?AUTO_10031 ?AUTO_10034 ?AUTO_10032 ) ( VISIBLE ?AUTO_10034 ?AUTO_10032 ) ( not ( = ?AUTO_10028 ?AUTO_10034 ) ) ( not ( = ?AUTO_10032 ?AUTO_10034 ) ) ( CAN_TRAVERSE ?AUTO_10031 ?AUTO_10030 ?AUTO_10034 ) ( VISIBLE ?AUTO_10030 ?AUTO_10034 ) ( not ( = ?AUTO_10028 ?AUTO_10030 ) ) ( not ( = ?AUTO_10032 ?AUTO_10030 ) ) ( not ( = ?AUTO_10034 ?AUTO_10030 ) ) ( CAN_TRAVERSE ?AUTO_10031 ?AUTO_10035 ?AUTO_10030 ) ( AT ?AUTO_10031 ?AUTO_10035 ) ( VISIBLE ?AUTO_10035 ?AUTO_10030 ) ( not ( = ?AUTO_10028 ?AUTO_10035 ) ) ( not ( = ?AUTO_10032 ?AUTO_10035 ) ) ( not ( = ?AUTO_10034 ?AUTO_10035 ) ) ( not ( = ?AUTO_10030 ?AUTO_10035 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10031 ?AUTO_10035 ?AUTO_10030 )
      ( GET_ROCK_DATA ?AUTO_10028 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10028 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10074 - OBJECTIVE
      ?AUTO_10075 - MODE
    )
    :vars
    (
      ?AUTO_10078 - LANDER
      ?AUTO_10077 - WAYPOINT
      ?AUTO_10081 - WAYPOINT
      ?AUTO_10079 - ROVER
      ?AUTO_10080 - CAMERA
      ?AUTO_10076 - OBJECTIVE
      ?AUTO_10082 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10078 ?AUTO_10077 ) ( VISIBLE ?AUTO_10081 ?AUTO_10077 ) ( AVAILABLE ?AUTO_10079 ) ( CHANNEL_FREE ?AUTO_10078 ) ( not ( = ?AUTO_10081 ?AUTO_10077 ) ) ( ON_BOARD ?AUTO_10080 ?AUTO_10079 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10079 ) ( SUPPORTS ?AUTO_10080 ?AUTO_10075 ) ( VISIBLE_FROM ?AUTO_10074 ?AUTO_10081 ) ( CAN_TRAVERSE ?AUTO_10079 ?AUTO_10077 ?AUTO_10081 ) ( VISIBLE ?AUTO_10077 ?AUTO_10081 ) ( CALIBRATION_TARGET ?AUTO_10080 ?AUTO_10076 ) ( VISIBLE_FROM ?AUTO_10076 ?AUTO_10077 ) ( not ( = ?AUTO_10074 ?AUTO_10076 ) ) ( CAN_TRAVERSE ?AUTO_10079 ?AUTO_10081 ?AUTO_10077 ) ( CAN_TRAVERSE ?AUTO_10079 ?AUTO_10082 ?AUTO_10081 ) ( AT ?AUTO_10079 ?AUTO_10082 ) ( VISIBLE ?AUTO_10082 ?AUTO_10081 ) ( not ( = ?AUTO_10077 ?AUTO_10082 ) ) ( not ( = ?AUTO_10081 ?AUTO_10082 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10079 ?AUTO_10082 ?AUTO_10081 )
      ( GET_IMAGE_DATA ?AUTO_10074 ?AUTO_10075 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10074 ?AUTO_10075 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10083 - OBJECTIVE
      ?AUTO_10084 - MODE
    )
    :vars
    (
      ?AUTO_10090 - LANDER
      ?AUTO_10087 - WAYPOINT
      ?AUTO_10086 - WAYPOINT
      ?AUTO_10088 - ROVER
      ?AUTO_10085 - CAMERA
      ?AUTO_10091 - OBJECTIVE
      ?AUTO_10089 - WAYPOINT
      ?AUTO_10092 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10090 ?AUTO_10087 ) ( VISIBLE ?AUTO_10086 ?AUTO_10087 ) ( AVAILABLE ?AUTO_10088 ) ( CHANNEL_FREE ?AUTO_10090 ) ( not ( = ?AUTO_10086 ?AUTO_10087 ) ) ( ON_BOARD ?AUTO_10085 ?AUTO_10088 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10088 ) ( SUPPORTS ?AUTO_10085 ?AUTO_10084 ) ( VISIBLE_FROM ?AUTO_10083 ?AUTO_10086 ) ( CAN_TRAVERSE ?AUTO_10088 ?AUTO_10087 ?AUTO_10086 ) ( VISIBLE ?AUTO_10087 ?AUTO_10086 ) ( CALIBRATION_TARGET ?AUTO_10085 ?AUTO_10091 ) ( VISIBLE_FROM ?AUTO_10091 ?AUTO_10087 ) ( not ( = ?AUTO_10083 ?AUTO_10091 ) ) ( CAN_TRAVERSE ?AUTO_10088 ?AUTO_10086 ?AUTO_10087 ) ( CAN_TRAVERSE ?AUTO_10088 ?AUTO_10089 ?AUTO_10086 ) ( VISIBLE ?AUTO_10089 ?AUTO_10086 ) ( not ( = ?AUTO_10087 ?AUTO_10089 ) ) ( not ( = ?AUTO_10086 ?AUTO_10089 ) ) ( CAN_TRAVERSE ?AUTO_10088 ?AUTO_10092 ?AUTO_10089 ) ( AT ?AUTO_10088 ?AUTO_10092 ) ( VISIBLE ?AUTO_10092 ?AUTO_10089 ) ( not ( = ?AUTO_10087 ?AUTO_10092 ) ) ( not ( = ?AUTO_10086 ?AUTO_10092 ) ) ( not ( = ?AUTO_10089 ?AUTO_10092 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10088 ?AUTO_10092 ?AUTO_10089 )
      ( GET_IMAGE_DATA ?AUTO_10083 ?AUTO_10084 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10083 ?AUTO_10084 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10152 - OBJECTIVE
      ?AUTO_10153 - MODE
    )
    :vars
    (
      ?AUTO_10161 - LANDER
      ?AUTO_10158 - WAYPOINT
      ?AUTO_10157 - WAYPOINT
      ?AUTO_10160 - ROVER
      ?AUTO_10155 - CAMERA
      ?AUTO_10156 - WAYPOINT
      ?AUTO_10159 - WAYPOINT
      ?AUTO_10154 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10161 ?AUTO_10158 ) ( VISIBLE ?AUTO_10157 ?AUTO_10158 ) ( AVAILABLE ?AUTO_10160 ) ( CHANNEL_FREE ?AUTO_10161 ) ( not ( = ?AUTO_10157 ?AUTO_10158 ) ) ( CAN_TRAVERSE ?AUTO_10160 ?AUTO_10158 ?AUTO_10157 ) ( VISIBLE ?AUTO_10158 ?AUTO_10157 ) ( ON_BOARD ?AUTO_10155 ?AUTO_10160 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10160 ) ( SUPPORTS ?AUTO_10155 ?AUTO_10153 ) ( VISIBLE_FROM ?AUTO_10152 ?AUTO_10158 ) ( CAN_TRAVERSE ?AUTO_10160 ?AUTO_10157 ?AUTO_10158 ) ( CAN_TRAVERSE ?AUTO_10160 ?AUTO_10156 ?AUTO_10157 ) ( VISIBLE ?AUTO_10156 ?AUTO_10157 ) ( not ( = ?AUTO_10158 ?AUTO_10156 ) ) ( not ( = ?AUTO_10157 ?AUTO_10156 ) ) ( CAN_TRAVERSE ?AUTO_10160 ?AUTO_10159 ?AUTO_10156 ) ( VISIBLE ?AUTO_10159 ?AUTO_10156 ) ( not ( = ?AUTO_10158 ?AUTO_10159 ) ) ( not ( = ?AUTO_10157 ?AUTO_10159 ) ) ( not ( = ?AUTO_10156 ?AUTO_10159 ) ) ( CALIBRATION_TARGET ?AUTO_10155 ?AUTO_10154 ) ( VISIBLE_FROM ?AUTO_10154 ?AUTO_10159 ) ( not ( = ?AUTO_10152 ?AUTO_10154 ) ) ( CAN_TRAVERSE ?AUTO_10160 ?AUTO_10156 ?AUTO_10159 ) ( AT ?AUTO_10160 ?AUTO_10156 ) ( VISIBLE ?AUTO_10156 ?AUTO_10159 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10160 ?AUTO_10156 ?AUTO_10159 )
      ( GET_IMAGE_DATA ?AUTO_10152 ?AUTO_10153 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10152 ?AUTO_10153 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10311 - OBJECTIVE
      ?AUTO_10312 - MODE
    )
    :vars
    (
      ?AUTO_10315 - LANDER
      ?AUTO_10319 - WAYPOINT
      ?AUTO_10320 - WAYPOINT
      ?AUTO_10318 - ROVER
      ?AUTO_10317 - CAMERA
      ?AUTO_10313 - WAYPOINT
      ?AUTO_10314 - WAYPOINT
      ?AUTO_10316 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10315 ?AUTO_10319 ) ( VISIBLE ?AUTO_10320 ?AUTO_10319 ) ( AVAILABLE ?AUTO_10318 ) ( CHANNEL_FREE ?AUTO_10315 ) ( not ( = ?AUTO_10320 ?AUTO_10319 ) ) ( CAN_TRAVERSE ?AUTO_10318 ?AUTO_10319 ?AUTO_10320 ) ( VISIBLE ?AUTO_10319 ?AUTO_10320 ) ( ON_BOARD ?AUTO_10317 ?AUTO_10318 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10318 ) ( SUPPORTS ?AUTO_10317 ?AUTO_10312 ) ( VISIBLE_FROM ?AUTO_10311 ?AUTO_10319 ) ( CAN_TRAVERSE ?AUTO_10318 ?AUTO_10313 ?AUTO_10319 ) ( VISIBLE ?AUTO_10313 ?AUTO_10319 ) ( not ( = ?AUTO_10319 ?AUTO_10313 ) ) ( not ( = ?AUTO_10320 ?AUTO_10313 ) ) ( CAN_TRAVERSE ?AUTO_10318 ?AUTO_10314 ?AUTO_10313 ) ( VISIBLE ?AUTO_10314 ?AUTO_10313 ) ( not ( = ?AUTO_10319 ?AUTO_10314 ) ) ( not ( = ?AUTO_10320 ?AUTO_10314 ) ) ( not ( = ?AUTO_10313 ?AUTO_10314 ) ) ( CALIBRATION_TARGET ?AUTO_10317 ?AUTO_10316 ) ( VISIBLE_FROM ?AUTO_10316 ?AUTO_10314 ) ( not ( = ?AUTO_10311 ?AUTO_10316 ) ) ( CAN_TRAVERSE ?AUTO_10318 ?AUTO_10313 ?AUTO_10314 ) ( AT ?AUTO_10318 ?AUTO_10313 ) ( VISIBLE ?AUTO_10313 ?AUTO_10314 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10318 ?AUTO_10313 ?AUTO_10314 )
      ( GET_IMAGE_DATA ?AUTO_10311 ?AUTO_10312 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10311 ?AUTO_10312 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10378 - OBJECTIVE
      ?AUTO_10379 - MODE
    )
    :vars
    (
      ?AUTO_10385 - LANDER
      ?AUTO_10382 - WAYPOINT
      ?AUTO_10380 - WAYPOINT
      ?AUTO_10383 - ROVER
      ?AUTO_10381 - CAMERA
      ?AUTO_10384 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10385 ?AUTO_10382 ) ( VISIBLE ?AUTO_10380 ?AUTO_10382 ) ( AVAILABLE ?AUTO_10383 ) ( CHANNEL_FREE ?AUTO_10385 ) ( not ( = ?AUTO_10380 ?AUTO_10382 ) ) ( CAN_TRAVERSE ?AUTO_10383 ?AUTO_10382 ?AUTO_10380 ) ( VISIBLE ?AUTO_10382 ?AUTO_10380 ) ( ON_BOARD ?AUTO_10381 ?AUTO_10383 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10383 ) ( SUPPORTS ?AUTO_10381 ?AUTO_10379 ) ( VISIBLE_FROM ?AUTO_10378 ?AUTO_10382 ) ( CALIBRATION_TARGET ?AUTO_10381 ?AUTO_10384 ) ( VISIBLE_FROM ?AUTO_10384 ?AUTO_10382 ) ( not ( = ?AUTO_10378 ?AUTO_10384 ) ) ( CAN_TRAVERSE ?AUTO_10383 ?AUTO_10380 ?AUTO_10382 ) ( AT ?AUTO_10383 ?AUTO_10380 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10383 ?AUTO_10380 ?AUTO_10382 )
      ( GET_IMAGE_DATA ?AUTO_10378 ?AUTO_10379 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10378 ?AUTO_10379 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10499 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10501 - LANDER
      ?AUTO_10500 - WAYPOINT
      ?AUTO_10504 - ROVER
      ?AUTO_10503 - STORE
      ?AUTO_10502 - WAYPOINT
      ?AUTO_10505 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10501 ?AUTO_10499 ) ( VISIBLE ?AUTO_10500 ?AUTO_10499 ) ( AVAILABLE ?AUTO_10504 ) ( CHANNEL_FREE ?AUTO_10501 ) ( not ( = ?AUTO_10499 ?AUTO_10500 ) ) ( CAN_TRAVERSE ?AUTO_10504 ?AUTO_10499 ?AUTO_10500 ) ( VISIBLE ?AUTO_10499 ?AUTO_10500 ) ( AT_SOIL_SAMPLE ?AUTO_10499 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10504 ) ( STORE_OF ?AUTO_10503 ?AUTO_10504 ) ( EMPTY ?AUTO_10503 ) ( CAN_TRAVERSE ?AUTO_10504 ?AUTO_10500 ?AUTO_10499 ) ( CAN_TRAVERSE ?AUTO_10504 ?AUTO_10502 ?AUTO_10500 ) ( VISIBLE ?AUTO_10502 ?AUTO_10500 ) ( not ( = ?AUTO_10499 ?AUTO_10502 ) ) ( not ( = ?AUTO_10500 ?AUTO_10502 ) ) ( CAN_TRAVERSE ?AUTO_10504 ?AUTO_10505 ?AUTO_10502 ) ( AT ?AUTO_10504 ?AUTO_10505 ) ( VISIBLE ?AUTO_10505 ?AUTO_10502 ) ( not ( = ?AUTO_10499 ?AUTO_10505 ) ) ( not ( = ?AUTO_10500 ?AUTO_10505 ) ) ( not ( = ?AUTO_10502 ?AUTO_10505 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10504 ?AUTO_10505 ?AUTO_10502 )
      ( GET_SOIL_DATA ?AUTO_10499 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10499 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10563 - OBJECTIVE
      ?AUTO_10564 - MODE
    )
    :vars
    (
      ?AUTO_10566 - LANDER
      ?AUTO_10567 - WAYPOINT
      ?AUTO_10568 - WAYPOINT
      ?AUTO_10565 - ROVER
      ?AUTO_10570 - WAYPOINT
      ?AUTO_10571 - CAMERA
      ?AUTO_10569 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10566 ?AUTO_10567 ) ( VISIBLE ?AUTO_10568 ?AUTO_10567 ) ( AVAILABLE ?AUTO_10565 ) ( CHANNEL_FREE ?AUTO_10566 ) ( not ( = ?AUTO_10568 ?AUTO_10567 ) ) ( CAN_TRAVERSE ?AUTO_10565 ?AUTO_10570 ?AUTO_10568 ) ( VISIBLE ?AUTO_10570 ?AUTO_10568 ) ( not ( = ?AUTO_10567 ?AUTO_10570 ) ) ( not ( = ?AUTO_10568 ?AUTO_10570 ) ) ( ON_BOARD ?AUTO_10571 ?AUTO_10565 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10565 ) ( SUPPORTS ?AUTO_10571 ?AUTO_10564 ) ( VISIBLE_FROM ?AUTO_10563 ?AUTO_10570 ) ( CALIBRATION_TARGET ?AUTO_10571 ?AUTO_10563 ) ( CAN_TRAVERSE ?AUTO_10565 ?AUTO_10569 ?AUTO_10570 ) ( VISIBLE ?AUTO_10569 ?AUTO_10570 ) ( not ( = ?AUTO_10567 ?AUTO_10569 ) ) ( not ( = ?AUTO_10568 ?AUTO_10569 ) ) ( not ( = ?AUTO_10570 ?AUTO_10569 ) ) ( CAN_TRAVERSE ?AUTO_10565 ?AUTO_10567 ?AUTO_10569 ) ( AT ?AUTO_10565 ?AUTO_10567 ) ( VISIBLE ?AUTO_10567 ?AUTO_10569 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10565 ?AUTO_10567 ?AUTO_10569 )
      ( GET_IMAGE_DATA ?AUTO_10563 ?AUTO_10564 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10563 ?AUTO_10564 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10572 - OBJECTIVE
      ?AUTO_10573 - MODE
    )
    :vars
    (
      ?AUTO_10576 - LANDER
      ?AUTO_10578 - WAYPOINT
      ?AUTO_10579 - WAYPOINT
      ?AUTO_10574 - ROVER
      ?AUTO_10577 - WAYPOINT
      ?AUTO_10580 - CAMERA
      ?AUTO_10575 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10576 ?AUTO_10578 ) ( VISIBLE ?AUTO_10579 ?AUTO_10578 ) ( AVAILABLE ?AUTO_10574 ) ( CHANNEL_FREE ?AUTO_10576 ) ( not ( = ?AUTO_10579 ?AUTO_10578 ) ) ( CAN_TRAVERSE ?AUTO_10574 ?AUTO_10577 ?AUTO_10579 ) ( VISIBLE ?AUTO_10577 ?AUTO_10579 ) ( not ( = ?AUTO_10578 ?AUTO_10577 ) ) ( not ( = ?AUTO_10579 ?AUTO_10577 ) ) ( ON_BOARD ?AUTO_10580 ?AUTO_10574 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10574 ) ( SUPPORTS ?AUTO_10580 ?AUTO_10573 ) ( VISIBLE_FROM ?AUTO_10572 ?AUTO_10577 ) ( CALIBRATION_TARGET ?AUTO_10580 ?AUTO_10572 ) ( CAN_TRAVERSE ?AUTO_10574 ?AUTO_10575 ?AUTO_10577 ) ( VISIBLE ?AUTO_10575 ?AUTO_10577 ) ( not ( = ?AUTO_10578 ?AUTO_10575 ) ) ( not ( = ?AUTO_10579 ?AUTO_10575 ) ) ( not ( = ?AUTO_10577 ?AUTO_10575 ) ) ( CAN_TRAVERSE ?AUTO_10574 ?AUTO_10578 ?AUTO_10575 ) ( VISIBLE ?AUTO_10578 ?AUTO_10575 ) ( CAN_TRAVERSE ?AUTO_10574 ?AUTO_10579 ?AUTO_10578 ) ( AT ?AUTO_10574 ?AUTO_10579 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10574 ?AUTO_10579 ?AUTO_10578 )
      ( GET_IMAGE_DATA ?AUTO_10572 ?AUTO_10573 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10572 ?AUTO_10573 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10679 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10685 - LANDER
      ?AUTO_10681 - WAYPOINT
      ?AUTO_10682 - ROVER
      ?AUTO_10683 - STORE
      ?AUTO_10684 - WAYPOINT
      ?AUTO_10680 - WAYPOINT
      ?AUTO_10686 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10685 ?AUTO_10681 ) ( VISIBLE ?AUTO_10679 ?AUTO_10681 ) ( AVAILABLE ?AUTO_10682 ) ( CHANNEL_FREE ?AUTO_10685 ) ( not ( = ?AUTO_10679 ?AUTO_10681 ) ) ( AT_SOIL_SAMPLE ?AUTO_10679 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10682 ) ( STORE_OF ?AUTO_10683 ?AUTO_10682 ) ( EMPTY ?AUTO_10683 ) ( CAN_TRAVERSE ?AUTO_10682 ?AUTO_10684 ?AUTO_10679 ) ( VISIBLE ?AUTO_10684 ?AUTO_10679 ) ( not ( = ?AUTO_10679 ?AUTO_10684 ) ) ( not ( = ?AUTO_10681 ?AUTO_10684 ) ) ( CAN_TRAVERSE ?AUTO_10682 ?AUTO_10681 ?AUTO_10684 ) ( VISIBLE ?AUTO_10681 ?AUTO_10684 ) ( CAN_TRAVERSE ?AUTO_10682 ?AUTO_10680 ?AUTO_10681 ) ( VISIBLE ?AUTO_10680 ?AUTO_10681 ) ( not ( = ?AUTO_10679 ?AUTO_10680 ) ) ( not ( = ?AUTO_10681 ?AUTO_10680 ) ) ( not ( = ?AUTO_10684 ?AUTO_10680 ) ) ( CAN_TRAVERSE ?AUTO_10682 ?AUTO_10686 ?AUTO_10680 ) ( AT ?AUTO_10682 ?AUTO_10686 ) ( VISIBLE ?AUTO_10686 ?AUTO_10680 ) ( not ( = ?AUTO_10679 ?AUTO_10686 ) ) ( not ( = ?AUTO_10681 ?AUTO_10686 ) ) ( not ( = ?AUTO_10684 ?AUTO_10686 ) ) ( not ( = ?AUTO_10680 ?AUTO_10686 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10682 ?AUTO_10686 ?AUTO_10680 )
      ( GET_SOIL_DATA ?AUTO_10679 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10679 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10761 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10765 - LANDER
      ?AUTO_10767 - WAYPOINT
      ?AUTO_10763 - ROVER
      ?AUTO_10762 - STORE
      ?AUTO_10764 - WAYPOINT
      ?AUTO_10766 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10765 ?AUTO_10767 ) ( VISIBLE ?AUTO_10761 ?AUTO_10767 ) ( AVAILABLE ?AUTO_10763 ) ( CHANNEL_FREE ?AUTO_10765 ) ( not ( = ?AUTO_10761 ?AUTO_10767 ) ) ( AT_ROCK_SAMPLE ?AUTO_10761 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10763 ) ( STORE_OF ?AUTO_10762 ?AUTO_10763 ) ( CAN_TRAVERSE ?AUTO_10763 ?AUTO_10764 ?AUTO_10761 ) ( VISIBLE ?AUTO_10764 ?AUTO_10761 ) ( not ( = ?AUTO_10761 ?AUTO_10764 ) ) ( not ( = ?AUTO_10767 ?AUTO_10764 ) ) ( CAN_TRAVERSE ?AUTO_10763 ?AUTO_10766 ?AUTO_10764 ) ( AT ?AUTO_10763 ?AUTO_10766 ) ( VISIBLE ?AUTO_10766 ?AUTO_10764 ) ( not ( = ?AUTO_10761 ?AUTO_10766 ) ) ( not ( = ?AUTO_10767 ?AUTO_10766 ) ) ( not ( = ?AUTO_10764 ?AUTO_10766 ) ) ( AT_SOIL_SAMPLE ?AUTO_10766 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10763 ) ( EMPTY ?AUTO_10762 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_10763 ?AUTO_10762 ?AUTO_10766 )
      ( GET_ROCK_DATA ?AUTO_10761 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10761 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10778 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10785 - LANDER
      ?AUTO_10780 - WAYPOINT
      ?AUTO_10784 - ROVER
      ?AUTO_10783 - STORE
      ?AUTO_10779 - WAYPOINT
      ?AUTO_10781 - WAYPOINT
      ?AUTO_10782 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10785 ?AUTO_10780 ) ( VISIBLE ?AUTO_10778 ?AUTO_10780 ) ( AVAILABLE ?AUTO_10784 ) ( CHANNEL_FREE ?AUTO_10785 ) ( not ( = ?AUTO_10778 ?AUTO_10780 ) ) ( AT_ROCK_SAMPLE ?AUTO_10778 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10784 ) ( STORE_OF ?AUTO_10783 ?AUTO_10784 ) ( CAN_TRAVERSE ?AUTO_10784 ?AUTO_10779 ?AUTO_10778 ) ( VISIBLE ?AUTO_10779 ?AUTO_10778 ) ( not ( = ?AUTO_10778 ?AUTO_10779 ) ) ( not ( = ?AUTO_10780 ?AUTO_10779 ) ) ( CAN_TRAVERSE ?AUTO_10784 ?AUTO_10781 ?AUTO_10779 ) ( VISIBLE ?AUTO_10781 ?AUTO_10779 ) ( not ( = ?AUTO_10778 ?AUTO_10781 ) ) ( not ( = ?AUTO_10780 ?AUTO_10781 ) ) ( not ( = ?AUTO_10779 ?AUTO_10781 ) ) ( AT_SOIL_SAMPLE ?AUTO_10781 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10784 ) ( EMPTY ?AUTO_10783 ) ( CAN_TRAVERSE ?AUTO_10784 ?AUTO_10782 ?AUTO_10781 ) ( VISIBLE ?AUTO_10782 ?AUTO_10781 ) ( not ( = ?AUTO_10778 ?AUTO_10782 ) ) ( not ( = ?AUTO_10780 ?AUTO_10782 ) ) ( not ( = ?AUTO_10779 ?AUTO_10782 ) ) ( not ( = ?AUTO_10781 ?AUTO_10782 ) ) ( CAN_TRAVERSE ?AUTO_10784 ?AUTO_10780 ?AUTO_10782 ) ( AT ?AUTO_10784 ?AUTO_10780 ) ( VISIBLE ?AUTO_10780 ?AUTO_10782 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10784 ?AUTO_10780 ?AUTO_10782 )
      ( GET_ROCK_DATA ?AUTO_10778 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10778 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10790 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10794 - LANDER
      ?AUTO_10791 - WAYPOINT
      ?AUTO_10792 - ROVER
      ?AUTO_10795 - STORE
      ?AUTO_10793 - WAYPOINT
      ?AUTO_10796 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10794 ?AUTO_10791 ) ( VISIBLE ?AUTO_10790 ?AUTO_10791 ) ( AVAILABLE ?AUTO_10792 ) ( CHANNEL_FREE ?AUTO_10794 ) ( not ( = ?AUTO_10790 ?AUTO_10791 ) ) ( AT_ROCK_SAMPLE ?AUTO_10790 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10792 ) ( STORE_OF ?AUTO_10795 ?AUTO_10792 ) ( CAN_TRAVERSE ?AUTO_10792 ?AUTO_10793 ?AUTO_10790 ) ( VISIBLE ?AUTO_10793 ?AUTO_10790 ) ( not ( = ?AUTO_10790 ?AUTO_10793 ) ) ( not ( = ?AUTO_10791 ?AUTO_10793 ) ) ( CAN_TRAVERSE ?AUTO_10792 ?AUTO_10796 ?AUTO_10793 ) ( VISIBLE ?AUTO_10796 ?AUTO_10793 ) ( not ( = ?AUTO_10790 ?AUTO_10796 ) ) ( not ( = ?AUTO_10791 ?AUTO_10796 ) ) ( not ( = ?AUTO_10793 ?AUTO_10796 ) ) ( AT_SOIL_SAMPLE ?AUTO_10796 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10792 ) ( EMPTY ?AUTO_10795 ) ( CAN_TRAVERSE ?AUTO_10792 ?AUTO_10793 ?AUTO_10796 ) ( AT ?AUTO_10792 ?AUTO_10793 ) ( VISIBLE ?AUTO_10793 ?AUTO_10796 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10792 ?AUTO_10793 ?AUTO_10796 )
      ( GET_ROCK_DATA ?AUTO_10790 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10790 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10824 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10827 - LANDER
      ?AUTO_10826 - WAYPOINT
      ?AUTO_10828 - ROVER
      ?AUTO_10825 - STORE
      ?AUTO_10829 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10827 ?AUTO_10824 ) ( VISIBLE ?AUTO_10826 ?AUTO_10824 ) ( AVAILABLE ?AUTO_10828 ) ( CHANNEL_FREE ?AUTO_10827 ) ( not ( = ?AUTO_10824 ?AUTO_10826 ) ) ( CAN_TRAVERSE ?AUTO_10828 ?AUTO_10824 ?AUTO_10826 ) ( VISIBLE ?AUTO_10824 ?AUTO_10826 ) ( AT_SOIL_SAMPLE ?AUTO_10824 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10828 ) ( STORE_OF ?AUTO_10825 ?AUTO_10828 ) ( CAN_TRAVERSE ?AUTO_10828 ?AUTO_10826 ?AUTO_10824 ) ( FULL ?AUTO_10825 ) ( CAN_TRAVERSE ?AUTO_10828 ?AUTO_10829 ?AUTO_10826 ) ( AT ?AUTO_10828 ?AUTO_10829 ) ( VISIBLE ?AUTO_10829 ?AUTO_10826 ) ( not ( = ?AUTO_10824 ?AUTO_10829 ) ) ( not ( = ?AUTO_10826 ?AUTO_10829 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10828 ?AUTO_10829 ?AUTO_10826 )
      ( GET_SOIL_DATA ?AUTO_10824 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10824 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10831 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10832 - LANDER
      ?AUTO_10836 - WAYPOINT
      ?AUTO_10834 - ROVER
      ?AUTO_10833 - STORE
      ?AUTO_10835 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10832 ?AUTO_10831 ) ( VISIBLE ?AUTO_10836 ?AUTO_10831 ) ( AVAILABLE ?AUTO_10834 ) ( CHANNEL_FREE ?AUTO_10832 ) ( not ( = ?AUTO_10831 ?AUTO_10836 ) ) ( CAN_TRAVERSE ?AUTO_10834 ?AUTO_10831 ?AUTO_10836 ) ( VISIBLE ?AUTO_10831 ?AUTO_10836 ) ( AT_SOIL_SAMPLE ?AUTO_10831 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10834 ) ( STORE_OF ?AUTO_10833 ?AUTO_10834 ) ( CAN_TRAVERSE ?AUTO_10834 ?AUTO_10836 ?AUTO_10831 ) ( CAN_TRAVERSE ?AUTO_10834 ?AUTO_10835 ?AUTO_10836 ) ( AT ?AUTO_10834 ?AUTO_10835 ) ( VISIBLE ?AUTO_10835 ?AUTO_10836 ) ( not ( = ?AUTO_10831 ?AUTO_10835 ) ) ( not ( = ?AUTO_10836 ?AUTO_10835 ) ) ( AT_SOIL_SAMPLE ?AUTO_10835 ) ( EMPTY ?AUTO_10833 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_10834 ?AUTO_10833 ?AUTO_10835 )
      ( GET_SOIL_DATA ?AUTO_10831 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10831 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10838 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10843 - LANDER
      ?AUTO_10841 - WAYPOINT
      ?AUTO_10839 - ROVER
      ?AUTO_10840 - STORE
      ?AUTO_10842 - WAYPOINT
      ?AUTO_10844 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10843 ?AUTO_10838 ) ( VISIBLE ?AUTO_10841 ?AUTO_10838 ) ( AVAILABLE ?AUTO_10839 ) ( CHANNEL_FREE ?AUTO_10843 ) ( not ( = ?AUTO_10838 ?AUTO_10841 ) ) ( CAN_TRAVERSE ?AUTO_10839 ?AUTO_10838 ?AUTO_10841 ) ( VISIBLE ?AUTO_10838 ?AUTO_10841 ) ( AT_SOIL_SAMPLE ?AUTO_10838 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10839 ) ( STORE_OF ?AUTO_10840 ?AUTO_10839 ) ( CAN_TRAVERSE ?AUTO_10839 ?AUTO_10841 ?AUTO_10838 ) ( FULL ?AUTO_10840 ) ( CAN_TRAVERSE ?AUTO_10839 ?AUTO_10842 ?AUTO_10841 ) ( VISIBLE ?AUTO_10842 ?AUTO_10841 ) ( not ( = ?AUTO_10838 ?AUTO_10842 ) ) ( not ( = ?AUTO_10841 ?AUTO_10842 ) ) ( CAN_TRAVERSE ?AUTO_10839 ?AUTO_10844 ?AUTO_10842 ) ( AT ?AUTO_10839 ?AUTO_10844 ) ( VISIBLE ?AUTO_10844 ?AUTO_10842 ) ( not ( = ?AUTO_10838 ?AUTO_10844 ) ) ( not ( = ?AUTO_10841 ?AUTO_10844 ) ) ( not ( = ?AUTO_10842 ?AUTO_10844 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10839 ?AUTO_10844 ?AUTO_10842 )
      ( GET_SOIL_DATA ?AUTO_10838 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10838 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10846 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10852 - LANDER
      ?AUTO_10847 - WAYPOINT
      ?AUTO_10850 - ROVER
      ?AUTO_10848 - STORE
      ?AUTO_10849 - WAYPOINT
      ?AUTO_10851 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10852 ?AUTO_10846 ) ( VISIBLE ?AUTO_10847 ?AUTO_10846 ) ( AVAILABLE ?AUTO_10850 ) ( CHANNEL_FREE ?AUTO_10852 ) ( not ( = ?AUTO_10846 ?AUTO_10847 ) ) ( CAN_TRAVERSE ?AUTO_10850 ?AUTO_10846 ?AUTO_10847 ) ( VISIBLE ?AUTO_10846 ?AUTO_10847 ) ( AT_SOIL_SAMPLE ?AUTO_10846 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10850 ) ( STORE_OF ?AUTO_10848 ?AUTO_10850 ) ( CAN_TRAVERSE ?AUTO_10850 ?AUTO_10847 ?AUTO_10846 ) ( CAN_TRAVERSE ?AUTO_10850 ?AUTO_10849 ?AUTO_10847 ) ( VISIBLE ?AUTO_10849 ?AUTO_10847 ) ( not ( = ?AUTO_10846 ?AUTO_10849 ) ) ( not ( = ?AUTO_10847 ?AUTO_10849 ) ) ( CAN_TRAVERSE ?AUTO_10850 ?AUTO_10851 ?AUTO_10849 ) ( AT ?AUTO_10850 ?AUTO_10851 ) ( VISIBLE ?AUTO_10851 ?AUTO_10849 ) ( not ( = ?AUTO_10846 ?AUTO_10851 ) ) ( not ( = ?AUTO_10847 ?AUTO_10851 ) ) ( not ( = ?AUTO_10849 ?AUTO_10851 ) ) ( AT_SOIL_SAMPLE ?AUTO_10851 ) ( EMPTY ?AUTO_10848 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_10850 ?AUTO_10848 ?AUTO_10851 )
      ( GET_SOIL_DATA ?AUTO_10846 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10846 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10861 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10864 - LANDER
      ?AUTO_10866 - WAYPOINT
      ?AUTO_10865 - ROVER
      ?AUTO_10863 - STORE
      ?AUTO_10862 - WAYPOINT
      ?AUTO_10867 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10864 ?AUTO_10861 ) ( VISIBLE ?AUTO_10866 ?AUTO_10861 ) ( AVAILABLE ?AUTO_10865 ) ( CHANNEL_FREE ?AUTO_10864 ) ( not ( = ?AUTO_10861 ?AUTO_10866 ) ) ( CAN_TRAVERSE ?AUTO_10865 ?AUTO_10861 ?AUTO_10866 ) ( VISIBLE ?AUTO_10861 ?AUTO_10866 ) ( AT_SOIL_SAMPLE ?AUTO_10861 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10865 ) ( STORE_OF ?AUTO_10863 ?AUTO_10865 ) ( CAN_TRAVERSE ?AUTO_10865 ?AUTO_10866 ?AUTO_10861 ) ( CAN_TRAVERSE ?AUTO_10865 ?AUTO_10862 ?AUTO_10866 ) ( VISIBLE ?AUTO_10862 ?AUTO_10866 ) ( not ( = ?AUTO_10861 ?AUTO_10862 ) ) ( not ( = ?AUTO_10866 ?AUTO_10862 ) ) ( CAN_TRAVERSE ?AUTO_10865 ?AUTO_10867 ?AUTO_10862 ) ( VISIBLE ?AUTO_10867 ?AUTO_10862 ) ( not ( = ?AUTO_10861 ?AUTO_10867 ) ) ( not ( = ?AUTO_10866 ?AUTO_10867 ) ) ( not ( = ?AUTO_10862 ?AUTO_10867 ) ) ( AT_SOIL_SAMPLE ?AUTO_10867 ) ( EMPTY ?AUTO_10863 ) ( CAN_TRAVERSE ?AUTO_10865 ?AUTO_10862 ?AUTO_10867 ) ( AT ?AUTO_10865 ?AUTO_10862 ) ( VISIBLE ?AUTO_10862 ?AUTO_10867 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10865 ?AUTO_10862 ?AUTO_10867 )
      ( GET_SOIL_DATA ?AUTO_10861 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10861 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10919 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10923 - LANDER
      ?AUTO_10921 - WAYPOINT
      ?AUTO_10924 - WAYPOINT
      ?AUTO_10920 - ROVER
      ?AUTO_10925 - STORE
      ?AUTO_10922 - WAYPOINT
      ?AUTO_10926 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10923 ?AUTO_10921 ) ( VISIBLE ?AUTO_10924 ?AUTO_10921 ) ( AVAILABLE ?AUTO_10920 ) ( CHANNEL_FREE ?AUTO_10923 ) ( not ( = ?AUTO_10919 ?AUTO_10924 ) ) ( not ( = ?AUTO_10919 ?AUTO_10921 ) ) ( not ( = ?AUTO_10924 ?AUTO_10921 ) ) ( CAN_TRAVERSE ?AUTO_10920 ?AUTO_10919 ?AUTO_10924 ) ( VISIBLE ?AUTO_10919 ?AUTO_10924 ) ( AT_SOIL_SAMPLE ?AUTO_10919 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10920 ) ( STORE_OF ?AUTO_10925 ?AUTO_10920 ) ( CAN_TRAVERSE ?AUTO_10920 ?AUTO_10922 ?AUTO_10919 ) ( VISIBLE ?AUTO_10922 ?AUTO_10919 ) ( not ( = ?AUTO_10919 ?AUTO_10922 ) ) ( not ( = ?AUTO_10921 ?AUTO_10922 ) ) ( not ( = ?AUTO_10924 ?AUTO_10922 ) ) ( FULL ?AUTO_10925 ) ( CAN_TRAVERSE ?AUTO_10920 ?AUTO_10926 ?AUTO_10922 ) ( AT ?AUTO_10920 ?AUTO_10926 ) ( VISIBLE ?AUTO_10926 ?AUTO_10922 ) ( not ( = ?AUTO_10919 ?AUTO_10926 ) ) ( not ( = ?AUTO_10921 ?AUTO_10926 ) ) ( not ( = ?AUTO_10924 ?AUTO_10926 ) ) ( not ( = ?AUTO_10922 ?AUTO_10926 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10920 ?AUTO_10926 ?AUTO_10922 )
      ( GET_SOIL_DATA ?AUTO_10919 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10919 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10927 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10932 - LANDER
      ?AUTO_10929 - WAYPOINT
      ?AUTO_10933 - WAYPOINT
      ?AUTO_10930 - ROVER
      ?AUTO_10928 - STORE
      ?AUTO_10931 - WAYPOINT
      ?AUTO_10934 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10932 ?AUTO_10929 ) ( VISIBLE ?AUTO_10933 ?AUTO_10929 ) ( AVAILABLE ?AUTO_10930 ) ( CHANNEL_FREE ?AUTO_10932 ) ( not ( = ?AUTO_10927 ?AUTO_10933 ) ) ( not ( = ?AUTO_10927 ?AUTO_10929 ) ) ( not ( = ?AUTO_10933 ?AUTO_10929 ) ) ( CAN_TRAVERSE ?AUTO_10930 ?AUTO_10927 ?AUTO_10933 ) ( VISIBLE ?AUTO_10927 ?AUTO_10933 ) ( AT_SOIL_SAMPLE ?AUTO_10927 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10930 ) ( STORE_OF ?AUTO_10928 ?AUTO_10930 ) ( CAN_TRAVERSE ?AUTO_10930 ?AUTO_10931 ?AUTO_10927 ) ( VISIBLE ?AUTO_10931 ?AUTO_10927 ) ( not ( = ?AUTO_10927 ?AUTO_10931 ) ) ( not ( = ?AUTO_10929 ?AUTO_10931 ) ) ( not ( = ?AUTO_10933 ?AUTO_10931 ) ) ( CAN_TRAVERSE ?AUTO_10930 ?AUTO_10934 ?AUTO_10931 ) ( AT ?AUTO_10930 ?AUTO_10934 ) ( VISIBLE ?AUTO_10934 ?AUTO_10931 ) ( not ( = ?AUTO_10927 ?AUTO_10934 ) ) ( not ( = ?AUTO_10929 ?AUTO_10934 ) ) ( not ( = ?AUTO_10933 ?AUTO_10934 ) ) ( not ( = ?AUTO_10931 ?AUTO_10934 ) ) ( AT_SOIL_SAMPLE ?AUTO_10934 ) ( EMPTY ?AUTO_10928 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_10930 ?AUTO_10928 ?AUTO_10934 )
      ( GET_SOIL_DATA ?AUTO_10927 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10927 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10975 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10977 - LANDER
      ?AUTO_10978 - WAYPOINT
      ?AUTO_10979 - WAYPOINT
      ?AUTO_10976 - ROVER
      ?AUTO_10981 - WAYPOINT
      ?AUTO_10980 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10977 ?AUTO_10978 ) ( VISIBLE ?AUTO_10979 ?AUTO_10978 ) ( AVAILABLE ?AUTO_10976 ) ( CHANNEL_FREE ?AUTO_10977 ) ( not ( = ?AUTO_10975 ?AUTO_10979 ) ) ( not ( = ?AUTO_10975 ?AUTO_10978 ) ) ( not ( = ?AUTO_10979 ?AUTO_10978 ) ) ( CAN_TRAVERSE ?AUTO_10976 ?AUTO_10981 ?AUTO_10979 ) ( VISIBLE ?AUTO_10981 ?AUTO_10979 ) ( not ( = ?AUTO_10975 ?AUTO_10981 ) ) ( not ( = ?AUTO_10978 ?AUTO_10981 ) ) ( not ( = ?AUTO_10979 ?AUTO_10981 ) ) ( CAN_TRAVERSE ?AUTO_10976 ?AUTO_10975 ?AUTO_10981 ) ( AT ?AUTO_10976 ?AUTO_10975 ) ( VISIBLE ?AUTO_10975 ?AUTO_10981 ) ( AT_SOIL_SAMPLE ?AUTO_10975 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10976 ) ( STORE_OF ?AUTO_10980 ?AUTO_10976 ) ( FULL ?AUTO_10980 ) )
    :subtasks
    ( ( !DROP ?AUTO_10976 ?AUTO_10980 )
      ( GET_SOIL_DATA ?AUTO_10975 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10975 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10982 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10986 - LANDER
      ?AUTO_10988 - WAYPOINT
      ?AUTO_10983 - WAYPOINT
      ?AUTO_10984 - ROVER
      ?AUTO_10985 - WAYPOINT
      ?AUTO_10987 - STORE
      ?AUTO_10989 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10986 ?AUTO_10988 ) ( VISIBLE ?AUTO_10983 ?AUTO_10988 ) ( AVAILABLE ?AUTO_10984 ) ( CHANNEL_FREE ?AUTO_10986 ) ( not ( = ?AUTO_10982 ?AUTO_10983 ) ) ( not ( = ?AUTO_10982 ?AUTO_10988 ) ) ( not ( = ?AUTO_10983 ?AUTO_10988 ) ) ( CAN_TRAVERSE ?AUTO_10984 ?AUTO_10985 ?AUTO_10983 ) ( VISIBLE ?AUTO_10985 ?AUTO_10983 ) ( not ( = ?AUTO_10982 ?AUTO_10985 ) ) ( not ( = ?AUTO_10988 ?AUTO_10985 ) ) ( not ( = ?AUTO_10983 ?AUTO_10985 ) ) ( CAN_TRAVERSE ?AUTO_10984 ?AUTO_10982 ?AUTO_10985 ) ( VISIBLE ?AUTO_10982 ?AUTO_10985 ) ( AT_SOIL_SAMPLE ?AUTO_10982 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10984 ) ( STORE_OF ?AUTO_10987 ?AUTO_10984 ) ( FULL ?AUTO_10987 ) ( CAN_TRAVERSE ?AUTO_10984 ?AUTO_10989 ?AUTO_10982 ) ( AT ?AUTO_10984 ?AUTO_10989 ) ( VISIBLE ?AUTO_10989 ?AUTO_10982 ) ( not ( = ?AUTO_10982 ?AUTO_10989 ) ) ( not ( = ?AUTO_10988 ?AUTO_10989 ) ) ( not ( = ?AUTO_10983 ?AUTO_10989 ) ) ( not ( = ?AUTO_10985 ?AUTO_10989 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10984 ?AUTO_10989 ?AUTO_10982 )
      ( GET_SOIL_DATA ?AUTO_10982 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10982 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10990 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10993 - LANDER
      ?AUTO_10991 - WAYPOINT
      ?AUTO_10995 - WAYPOINT
      ?AUTO_10996 - ROVER
      ?AUTO_10997 - WAYPOINT
      ?AUTO_10992 - STORE
      ?AUTO_10994 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10993 ?AUTO_10991 ) ( VISIBLE ?AUTO_10995 ?AUTO_10991 ) ( AVAILABLE ?AUTO_10996 ) ( CHANNEL_FREE ?AUTO_10993 ) ( not ( = ?AUTO_10990 ?AUTO_10995 ) ) ( not ( = ?AUTO_10990 ?AUTO_10991 ) ) ( not ( = ?AUTO_10995 ?AUTO_10991 ) ) ( CAN_TRAVERSE ?AUTO_10996 ?AUTO_10997 ?AUTO_10995 ) ( VISIBLE ?AUTO_10997 ?AUTO_10995 ) ( not ( = ?AUTO_10990 ?AUTO_10997 ) ) ( not ( = ?AUTO_10991 ?AUTO_10997 ) ) ( not ( = ?AUTO_10995 ?AUTO_10997 ) ) ( CAN_TRAVERSE ?AUTO_10996 ?AUTO_10990 ?AUTO_10997 ) ( VISIBLE ?AUTO_10990 ?AUTO_10997 ) ( AT_SOIL_SAMPLE ?AUTO_10990 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10996 ) ( STORE_OF ?AUTO_10992 ?AUTO_10996 ) ( CAN_TRAVERSE ?AUTO_10996 ?AUTO_10994 ?AUTO_10990 ) ( AT ?AUTO_10996 ?AUTO_10994 ) ( VISIBLE ?AUTO_10994 ?AUTO_10990 ) ( not ( = ?AUTO_10990 ?AUTO_10994 ) ) ( not ( = ?AUTO_10991 ?AUTO_10994 ) ) ( not ( = ?AUTO_10995 ?AUTO_10994 ) ) ( not ( = ?AUTO_10997 ?AUTO_10994 ) ) ( AT_SOIL_SAMPLE ?AUTO_10994 ) ( EMPTY ?AUTO_10992 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_10996 ?AUTO_10992 ?AUTO_10994 )
      ( GET_SOIL_DATA ?AUTO_10990 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10990 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10998 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11003 - LANDER
      ?AUTO_10999 - WAYPOINT
      ?AUTO_11001 - WAYPOINT
      ?AUTO_11004 - ROVER
      ?AUTO_11002 - WAYPOINT
      ?AUTO_11000 - STORE
      ?AUTO_11005 - WAYPOINT
      ?AUTO_11006 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11003 ?AUTO_10999 ) ( VISIBLE ?AUTO_11001 ?AUTO_10999 ) ( AVAILABLE ?AUTO_11004 ) ( CHANNEL_FREE ?AUTO_11003 ) ( not ( = ?AUTO_10998 ?AUTO_11001 ) ) ( not ( = ?AUTO_10998 ?AUTO_10999 ) ) ( not ( = ?AUTO_11001 ?AUTO_10999 ) ) ( CAN_TRAVERSE ?AUTO_11004 ?AUTO_11002 ?AUTO_11001 ) ( VISIBLE ?AUTO_11002 ?AUTO_11001 ) ( not ( = ?AUTO_10998 ?AUTO_11002 ) ) ( not ( = ?AUTO_10999 ?AUTO_11002 ) ) ( not ( = ?AUTO_11001 ?AUTO_11002 ) ) ( CAN_TRAVERSE ?AUTO_11004 ?AUTO_10998 ?AUTO_11002 ) ( VISIBLE ?AUTO_10998 ?AUTO_11002 ) ( AT_SOIL_SAMPLE ?AUTO_10998 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11004 ) ( STORE_OF ?AUTO_11000 ?AUTO_11004 ) ( CAN_TRAVERSE ?AUTO_11004 ?AUTO_11005 ?AUTO_10998 ) ( VISIBLE ?AUTO_11005 ?AUTO_10998 ) ( not ( = ?AUTO_10998 ?AUTO_11005 ) ) ( not ( = ?AUTO_10999 ?AUTO_11005 ) ) ( not ( = ?AUTO_11001 ?AUTO_11005 ) ) ( not ( = ?AUTO_11002 ?AUTO_11005 ) ) ( AT_SOIL_SAMPLE ?AUTO_11005 ) ( EMPTY ?AUTO_11000 ) ( CAN_TRAVERSE ?AUTO_11004 ?AUTO_11006 ?AUTO_11005 ) ( AT ?AUTO_11004 ?AUTO_11006 ) ( VISIBLE ?AUTO_11006 ?AUTO_11005 ) ( not ( = ?AUTO_10998 ?AUTO_11006 ) ) ( not ( = ?AUTO_10999 ?AUTO_11006 ) ) ( not ( = ?AUTO_11001 ?AUTO_11006 ) ) ( not ( = ?AUTO_11002 ?AUTO_11006 ) ) ( not ( = ?AUTO_11005 ?AUTO_11006 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11004 ?AUTO_11006 ?AUTO_11005 )
      ( GET_SOIL_DATA ?AUTO_10998 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10998 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11011 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11013 - LANDER
      ?AUTO_11017 - WAYPOINT
      ?AUTO_11019 - WAYPOINT
      ?AUTO_11015 - ROVER
      ?AUTO_11012 - WAYPOINT
      ?AUTO_11018 - STORE
      ?AUTO_11014 - WAYPOINT
      ?AUTO_11016 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11013 ?AUTO_11017 ) ( VISIBLE ?AUTO_11019 ?AUTO_11017 ) ( AVAILABLE ?AUTO_11015 ) ( CHANNEL_FREE ?AUTO_11013 ) ( not ( = ?AUTO_11011 ?AUTO_11019 ) ) ( not ( = ?AUTO_11011 ?AUTO_11017 ) ) ( not ( = ?AUTO_11019 ?AUTO_11017 ) ) ( CAN_TRAVERSE ?AUTO_11015 ?AUTO_11012 ?AUTO_11019 ) ( VISIBLE ?AUTO_11012 ?AUTO_11019 ) ( not ( = ?AUTO_11011 ?AUTO_11012 ) ) ( not ( = ?AUTO_11017 ?AUTO_11012 ) ) ( not ( = ?AUTO_11019 ?AUTO_11012 ) ) ( CAN_TRAVERSE ?AUTO_11015 ?AUTO_11011 ?AUTO_11012 ) ( VISIBLE ?AUTO_11011 ?AUTO_11012 ) ( AT_SOIL_SAMPLE ?AUTO_11011 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11015 ) ( STORE_OF ?AUTO_11018 ?AUTO_11015 ) ( CAN_TRAVERSE ?AUTO_11015 ?AUTO_11014 ?AUTO_11011 ) ( VISIBLE ?AUTO_11014 ?AUTO_11011 ) ( not ( = ?AUTO_11011 ?AUTO_11014 ) ) ( not ( = ?AUTO_11017 ?AUTO_11014 ) ) ( not ( = ?AUTO_11019 ?AUTO_11014 ) ) ( not ( = ?AUTO_11012 ?AUTO_11014 ) ) ( AT_SOIL_SAMPLE ?AUTO_11014 ) ( EMPTY ?AUTO_11018 ) ( CAN_TRAVERSE ?AUTO_11015 ?AUTO_11016 ?AUTO_11014 ) ( VISIBLE ?AUTO_11016 ?AUTO_11014 ) ( not ( = ?AUTO_11011 ?AUTO_11016 ) ) ( not ( = ?AUTO_11017 ?AUTO_11016 ) ) ( not ( = ?AUTO_11019 ?AUTO_11016 ) ) ( not ( = ?AUTO_11012 ?AUTO_11016 ) ) ( not ( = ?AUTO_11014 ?AUTO_11016 ) ) ( CAN_TRAVERSE ?AUTO_11015 ?AUTO_11017 ?AUTO_11016 ) ( AT ?AUTO_11015 ?AUTO_11017 ) ( VISIBLE ?AUTO_11017 ?AUTO_11016 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11015 ?AUTO_11017 ?AUTO_11016 )
      ( GET_SOIL_DATA ?AUTO_11011 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11011 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11071 - OBJECTIVE
      ?AUTO_11072 - MODE
    )
    :vars
    (
      ?AUTO_11078 - LANDER
      ?AUTO_11076 - WAYPOINT
      ?AUTO_11075 - ROVER
      ?AUTO_11077 - WAYPOINT
      ?AUTO_11074 - WAYPOINT
      ?AUTO_11073 - WAYPOINT
      ?AUTO_11079 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11078 ?AUTO_11076 ) ( HAVE_IMAGE ?AUTO_11075 ?AUTO_11071 ?AUTO_11072 ) ( VISIBLE ?AUTO_11077 ?AUTO_11076 ) ( AVAILABLE ?AUTO_11075 ) ( CHANNEL_FREE ?AUTO_11078 ) ( not ( = ?AUTO_11077 ?AUTO_11076 ) ) ( CAN_TRAVERSE ?AUTO_11075 ?AUTO_11074 ?AUTO_11077 ) ( VISIBLE ?AUTO_11074 ?AUTO_11077 ) ( not ( = ?AUTO_11076 ?AUTO_11074 ) ) ( not ( = ?AUTO_11077 ?AUTO_11074 ) ) ( CAN_TRAVERSE ?AUTO_11075 ?AUTO_11073 ?AUTO_11074 ) ( VISIBLE ?AUTO_11073 ?AUTO_11074 ) ( not ( = ?AUTO_11076 ?AUTO_11073 ) ) ( not ( = ?AUTO_11077 ?AUTO_11073 ) ) ( not ( = ?AUTO_11074 ?AUTO_11073 ) ) ( CAN_TRAVERSE ?AUTO_11075 ?AUTO_11079 ?AUTO_11073 ) ( AT ?AUTO_11075 ?AUTO_11079 ) ( VISIBLE ?AUTO_11079 ?AUTO_11073 ) ( not ( = ?AUTO_11076 ?AUTO_11079 ) ) ( not ( = ?AUTO_11077 ?AUTO_11079 ) ) ( not ( = ?AUTO_11074 ?AUTO_11079 ) ) ( not ( = ?AUTO_11073 ?AUTO_11079 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11075 ?AUTO_11079 ?AUTO_11073 )
      ( GET_IMAGE_DATA ?AUTO_11071 ?AUTO_11072 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11071 ?AUTO_11072 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11080 - OBJECTIVE
      ?AUTO_11081 - MODE
    )
    :vars
    (
      ?AUTO_11087 - LANDER
      ?AUTO_11083 - WAYPOINT
      ?AUTO_11084 - WAYPOINT
      ?AUTO_11086 - ROVER
      ?AUTO_11082 - WAYPOINT
      ?AUTO_11085 - WAYPOINT
      ?AUTO_11088 - WAYPOINT
      ?AUTO_11089 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11087 ?AUTO_11083 ) ( VISIBLE ?AUTO_11084 ?AUTO_11083 ) ( AVAILABLE ?AUTO_11086 ) ( CHANNEL_FREE ?AUTO_11087 ) ( not ( = ?AUTO_11084 ?AUTO_11083 ) ) ( CAN_TRAVERSE ?AUTO_11086 ?AUTO_11082 ?AUTO_11084 ) ( VISIBLE ?AUTO_11082 ?AUTO_11084 ) ( not ( = ?AUTO_11083 ?AUTO_11082 ) ) ( not ( = ?AUTO_11084 ?AUTO_11082 ) ) ( CAN_TRAVERSE ?AUTO_11086 ?AUTO_11085 ?AUTO_11082 ) ( VISIBLE ?AUTO_11085 ?AUTO_11082 ) ( not ( = ?AUTO_11083 ?AUTO_11085 ) ) ( not ( = ?AUTO_11084 ?AUTO_11085 ) ) ( not ( = ?AUTO_11082 ?AUTO_11085 ) ) ( CAN_TRAVERSE ?AUTO_11086 ?AUTO_11088 ?AUTO_11085 ) ( AT ?AUTO_11086 ?AUTO_11088 ) ( VISIBLE ?AUTO_11088 ?AUTO_11085 ) ( not ( = ?AUTO_11083 ?AUTO_11088 ) ) ( not ( = ?AUTO_11084 ?AUTO_11088 ) ) ( not ( = ?AUTO_11082 ?AUTO_11088 ) ) ( not ( = ?AUTO_11085 ?AUTO_11088 ) ) ( CALIBRATED ?AUTO_11089 ?AUTO_11086 ) ( ON_BOARD ?AUTO_11089 ?AUTO_11086 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11086 ) ( SUPPORTS ?AUTO_11089 ?AUTO_11081 ) ( VISIBLE_FROM ?AUTO_11080 ?AUTO_11088 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_11086 ?AUTO_11088 ?AUTO_11080 ?AUTO_11089 ?AUTO_11081 )
      ( GET_IMAGE_DATA ?AUTO_11080 ?AUTO_11081 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11080 ?AUTO_11081 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11090 - OBJECTIVE
      ?AUTO_11091 - MODE
    )
    :vars
    (
      ?AUTO_11092 - LANDER
      ?AUTO_11095 - WAYPOINT
      ?AUTO_11097 - WAYPOINT
      ?AUTO_11096 - ROVER
      ?AUTO_11093 - WAYPOINT
      ?AUTO_11098 - WAYPOINT
      ?AUTO_11094 - WAYPOINT
      ?AUTO_11099 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11092 ?AUTO_11095 ) ( VISIBLE ?AUTO_11097 ?AUTO_11095 ) ( AVAILABLE ?AUTO_11096 ) ( CHANNEL_FREE ?AUTO_11092 ) ( not ( = ?AUTO_11097 ?AUTO_11095 ) ) ( CAN_TRAVERSE ?AUTO_11096 ?AUTO_11093 ?AUTO_11097 ) ( VISIBLE ?AUTO_11093 ?AUTO_11097 ) ( not ( = ?AUTO_11095 ?AUTO_11093 ) ) ( not ( = ?AUTO_11097 ?AUTO_11093 ) ) ( CAN_TRAVERSE ?AUTO_11096 ?AUTO_11098 ?AUTO_11093 ) ( VISIBLE ?AUTO_11098 ?AUTO_11093 ) ( not ( = ?AUTO_11095 ?AUTO_11098 ) ) ( not ( = ?AUTO_11097 ?AUTO_11098 ) ) ( not ( = ?AUTO_11093 ?AUTO_11098 ) ) ( CAN_TRAVERSE ?AUTO_11096 ?AUTO_11094 ?AUTO_11098 ) ( AT ?AUTO_11096 ?AUTO_11094 ) ( VISIBLE ?AUTO_11094 ?AUTO_11098 ) ( not ( = ?AUTO_11095 ?AUTO_11094 ) ) ( not ( = ?AUTO_11097 ?AUTO_11094 ) ) ( not ( = ?AUTO_11093 ?AUTO_11094 ) ) ( not ( = ?AUTO_11098 ?AUTO_11094 ) ) ( ON_BOARD ?AUTO_11099 ?AUTO_11096 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11096 ) ( SUPPORTS ?AUTO_11099 ?AUTO_11091 ) ( VISIBLE_FROM ?AUTO_11090 ?AUTO_11094 ) ( CALIBRATION_TARGET ?AUTO_11099 ?AUTO_11090 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_11096 ?AUTO_11099 ?AUTO_11090 ?AUTO_11094 )
      ( GET_IMAGE_DATA ?AUTO_11090 ?AUTO_11091 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11090 ?AUTO_11091 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11100 - OBJECTIVE
      ?AUTO_11101 - MODE
    )
    :vars
    (
      ?AUTO_11104 - LANDER
      ?AUTO_11107 - WAYPOINT
      ?AUTO_11106 - WAYPOINT
      ?AUTO_11108 - ROVER
      ?AUTO_11102 - WAYPOINT
      ?AUTO_11105 - WAYPOINT
      ?AUTO_11109 - WAYPOINT
      ?AUTO_11103 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11104 ?AUTO_11107 ) ( VISIBLE ?AUTO_11106 ?AUTO_11107 ) ( AVAILABLE ?AUTO_11108 ) ( CHANNEL_FREE ?AUTO_11104 ) ( not ( = ?AUTO_11106 ?AUTO_11107 ) ) ( CAN_TRAVERSE ?AUTO_11108 ?AUTO_11102 ?AUTO_11106 ) ( VISIBLE ?AUTO_11102 ?AUTO_11106 ) ( not ( = ?AUTO_11107 ?AUTO_11102 ) ) ( not ( = ?AUTO_11106 ?AUTO_11102 ) ) ( CAN_TRAVERSE ?AUTO_11108 ?AUTO_11105 ?AUTO_11102 ) ( VISIBLE ?AUTO_11105 ?AUTO_11102 ) ( not ( = ?AUTO_11107 ?AUTO_11105 ) ) ( not ( = ?AUTO_11106 ?AUTO_11105 ) ) ( not ( = ?AUTO_11102 ?AUTO_11105 ) ) ( CAN_TRAVERSE ?AUTO_11108 ?AUTO_11109 ?AUTO_11105 ) ( VISIBLE ?AUTO_11109 ?AUTO_11105 ) ( not ( = ?AUTO_11107 ?AUTO_11109 ) ) ( not ( = ?AUTO_11106 ?AUTO_11109 ) ) ( not ( = ?AUTO_11102 ?AUTO_11109 ) ) ( not ( = ?AUTO_11105 ?AUTO_11109 ) ) ( ON_BOARD ?AUTO_11103 ?AUTO_11108 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11108 ) ( SUPPORTS ?AUTO_11103 ?AUTO_11101 ) ( VISIBLE_FROM ?AUTO_11100 ?AUTO_11109 ) ( CALIBRATION_TARGET ?AUTO_11103 ?AUTO_11100 ) ( CAN_TRAVERSE ?AUTO_11108 ?AUTO_11105 ?AUTO_11109 ) ( AT ?AUTO_11108 ?AUTO_11105 ) ( VISIBLE ?AUTO_11105 ?AUTO_11109 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11108 ?AUTO_11105 ?AUTO_11109 )
      ( GET_IMAGE_DATA ?AUTO_11100 ?AUTO_11101 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11100 ?AUTO_11101 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11110 - OBJECTIVE
      ?AUTO_11111 - MODE
    )
    :vars
    (
      ?AUTO_11119 - LANDER
      ?AUTO_11112 - WAYPOINT
      ?AUTO_11114 - WAYPOINT
      ?AUTO_11116 - ROVER
      ?AUTO_11117 - WAYPOINT
      ?AUTO_11118 - WAYPOINT
      ?AUTO_11113 - WAYPOINT
      ?AUTO_11115 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11119 ?AUTO_11112 ) ( VISIBLE ?AUTO_11114 ?AUTO_11112 ) ( AVAILABLE ?AUTO_11116 ) ( CHANNEL_FREE ?AUTO_11119 ) ( not ( = ?AUTO_11114 ?AUTO_11112 ) ) ( CAN_TRAVERSE ?AUTO_11116 ?AUTO_11117 ?AUTO_11114 ) ( VISIBLE ?AUTO_11117 ?AUTO_11114 ) ( not ( = ?AUTO_11112 ?AUTO_11117 ) ) ( not ( = ?AUTO_11114 ?AUTO_11117 ) ) ( CAN_TRAVERSE ?AUTO_11116 ?AUTO_11118 ?AUTO_11117 ) ( VISIBLE ?AUTO_11118 ?AUTO_11117 ) ( not ( = ?AUTO_11112 ?AUTO_11118 ) ) ( not ( = ?AUTO_11114 ?AUTO_11118 ) ) ( not ( = ?AUTO_11117 ?AUTO_11118 ) ) ( CAN_TRAVERSE ?AUTO_11116 ?AUTO_11113 ?AUTO_11118 ) ( VISIBLE ?AUTO_11113 ?AUTO_11118 ) ( not ( = ?AUTO_11112 ?AUTO_11113 ) ) ( not ( = ?AUTO_11114 ?AUTO_11113 ) ) ( not ( = ?AUTO_11117 ?AUTO_11113 ) ) ( not ( = ?AUTO_11118 ?AUTO_11113 ) ) ( ON_BOARD ?AUTO_11115 ?AUTO_11116 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11116 ) ( SUPPORTS ?AUTO_11115 ?AUTO_11111 ) ( VISIBLE_FROM ?AUTO_11110 ?AUTO_11113 ) ( CALIBRATION_TARGET ?AUTO_11115 ?AUTO_11110 ) ( CAN_TRAVERSE ?AUTO_11116 ?AUTO_11118 ?AUTO_11113 ) ( VISIBLE ?AUTO_11118 ?AUTO_11113 ) ( CAN_TRAVERSE ?AUTO_11116 ?AUTO_11114 ?AUTO_11118 ) ( AT ?AUTO_11116 ?AUTO_11114 ) ( VISIBLE ?AUTO_11114 ?AUTO_11118 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11116 ?AUTO_11114 ?AUTO_11118 )
      ( GET_IMAGE_DATA ?AUTO_11110 ?AUTO_11111 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11110 ?AUTO_11111 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11148 - OBJECTIVE
      ?AUTO_11149 - MODE
    )
    :vars
    (
      ?AUTO_11157 - LANDER
      ?AUTO_11151 - WAYPOINT
      ?AUTO_11155 - WAYPOINT
      ?AUTO_11154 - ROVER
      ?AUTO_11156 - WAYPOINT
      ?AUTO_11153 - WAYPOINT
      ?AUTO_11150 - WAYPOINT
      ?AUTO_11152 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11157 ?AUTO_11151 ) ( VISIBLE ?AUTO_11155 ?AUTO_11151 ) ( AVAILABLE ?AUTO_11154 ) ( CHANNEL_FREE ?AUTO_11157 ) ( not ( = ?AUTO_11155 ?AUTO_11151 ) ) ( CAN_TRAVERSE ?AUTO_11154 ?AUTO_11156 ?AUTO_11155 ) ( VISIBLE ?AUTO_11156 ?AUTO_11155 ) ( not ( = ?AUTO_11151 ?AUTO_11156 ) ) ( not ( = ?AUTO_11155 ?AUTO_11156 ) ) ( CAN_TRAVERSE ?AUTO_11154 ?AUTO_11153 ?AUTO_11156 ) ( VISIBLE ?AUTO_11153 ?AUTO_11156 ) ( not ( = ?AUTO_11151 ?AUTO_11153 ) ) ( not ( = ?AUTO_11155 ?AUTO_11153 ) ) ( not ( = ?AUTO_11156 ?AUTO_11153 ) ) ( CAN_TRAVERSE ?AUTO_11154 ?AUTO_11150 ?AUTO_11153 ) ( VISIBLE ?AUTO_11150 ?AUTO_11153 ) ( not ( = ?AUTO_11151 ?AUTO_11150 ) ) ( not ( = ?AUTO_11155 ?AUTO_11150 ) ) ( not ( = ?AUTO_11156 ?AUTO_11150 ) ) ( not ( = ?AUTO_11153 ?AUTO_11150 ) ) ( ON_BOARD ?AUTO_11152 ?AUTO_11154 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11154 ) ( SUPPORTS ?AUTO_11152 ?AUTO_11149 ) ( VISIBLE_FROM ?AUTO_11148 ?AUTO_11150 ) ( CALIBRATION_TARGET ?AUTO_11152 ?AUTO_11148 ) ( CAN_TRAVERSE ?AUTO_11154 ?AUTO_11153 ?AUTO_11150 ) ( VISIBLE ?AUTO_11153 ?AUTO_11150 ) ( CAN_TRAVERSE ?AUTO_11154 ?AUTO_11155 ?AUTO_11153 ) ( VISIBLE ?AUTO_11155 ?AUTO_11153 ) ( AT ?AUTO_11154 ?AUTO_11156 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11154 ?AUTO_11156 ?AUTO_11155 )
      ( GET_IMAGE_DATA ?AUTO_11148 ?AUTO_11149 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11148 ?AUTO_11149 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11233 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11235 - LANDER
      ?AUTO_11240 - WAYPOINT
      ?AUTO_11238 - WAYPOINT
      ?AUTO_11234 - ROVER
      ?AUTO_11237 - WAYPOINT
      ?AUTO_11236 - STORE
      ?AUTO_11239 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11235 ?AUTO_11240 ) ( VISIBLE ?AUTO_11238 ?AUTO_11240 ) ( AVAILABLE ?AUTO_11234 ) ( CHANNEL_FREE ?AUTO_11235 ) ( not ( = ?AUTO_11233 ?AUTO_11238 ) ) ( not ( = ?AUTO_11233 ?AUTO_11240 ) ) ( not ( = ?AUTO_11238 ?AUTO_11240 ) ) ( CAN_TRAVERSE ?AUTO_11234 ?AUTO_11237 ?AUTO_11238 ) ( VISIBLE ?AUTO_11237 ?AUTO_11238 ) ( not ( = ?AUTO_11233 ?AUTO_11237 ) ) ( not ( = ?AUTO_11240 ?AUTO_11237 ) ) ( not ( = ?AUTO_11238 ?AUTO_11237 ) ) ( CAN_TRAVERSE ?AUTO_11234 ?AUTO_11233 ?AUTO_11237 ) ( VISIBLE ?AUTO_11233 ?AUTO_11237 ) ( AT_SOIL_SAMPLE ?AUTO_11233 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11234 ) ( STORE_OF ?AUTO_11236 ?AUTO_11234 ) ( EMPTY ?AUTO_11236 ) ( CAN_TRAVERSE ?AUTO_11234 ?AUTO_11239 ?AUTO_11233 ) ( VISIBLE ?AUTO_11239 ?AUTO_11233 ) ( not ( = ?AUTO_11233 ?AUTO_11239 ) ) ( not ( = ?AUTO_11240 ?AUTO_11239 ) ) ( not ( = ?AUTO_11238 ?AUTO_11239 ) ) ( not ( = ?AUTO_11237 ?AUTO_11239 ) ) ( CAN_TRAVERSE ?AUTO_11234 ?AUTO_11240 ?AUTO_11239 ) ( AT ?AUTO_11234 ?AUTO_11240 ) ( VISIBLE ?AUTO_11240 ?AUTO_11239 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11234 ?AUTO_11240 ?AUTO_11239 )
      ( GET_SOIL_DATA ?AUTO_11233 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11233 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11242 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11246 - LANDER
      ?AUTO_11249 - WAYPOINT
      ?AUTO_11248 - WAYPOINT
      ?AUTO_11245 - ROVER
      ?AUTO_11244 - WAYPOINT
      ?AUTO_11247 - STORE
      ?AUTO_11243 - WAYPOINT
      ?AUTO_11250 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11246 ?AUTO_11249 ) ( VISIBLE ?AUTO_11248 ?AUTO_11249 ) ( AVAILABLE ?AUTO_11245 ) ( CHANNEL_FREE ?AUTO_11246 ) ( not ( = ?AUTO_11242 ?AUTO_11248 ) ) ( not ( = ?AUTO_11242 ?AUTO_11249 ) ) ( not ( = ?AUTO_11248 ?AUTO_11249 ) ) ( CAN_TRAVERSE ?AUTO_11245 ?AUTO_11244 ?AUTO_11248 ) ( VISIBLE ?AUTO_11244 ?AUTO_11248 ) ( not ( = ?AUTO_11242 ?AUTO_11244 ) ) ( not ( = ?AUTO_11249 ?AUTO_11244 ) ) ( not ( = ?AUTO_11248 ?AUTO_11244 ) ) ( CAN_TRAVERSE ?AUTO_11245 ?AUTO_11242 ?AUTO_11244 ) ( VISIBLE ?AUTO_11242 ?AUTO_11244 ) ( AT_SOIL_SAMPLE ?AUTO_11242 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11245 ) ( STORE_OF ?AUTO_11247 ?AUTO_11245 ) ( EMPTY ?AUTO_11247 ) ( CAN_TRAVERSE ?AUTO_11245 ?AUTO_11243 ?AUTO_11242 ) ( VISIBLE ?AUTO_11243 ?AUTO_11242 ) ( not ( = ?AUTO_11242 ?AUTO_11243 ) ) ( not ( = ?AUTO_11249 ?AUTO_11243 ) ) ( not ( = ?AUTO_11248 ?AUTO_11243 ) ) ( not ( = ?AUTO_11244 ?AUTO_11243 ) ) ( CAN_TRAVERSE ?AUTO_11245 ?AUTO_11249 ?AUTO_11243 ) ( VISIBLE ?AUTO_11249 ?AUTO_11243 ) ( CAN_TRAVERSE ?AUTO_11245 ?AUTO_11250 ?AUTO_11249 ) ( AT ?AUTO_11245 ?AUTO_11250 ) ( VISIBLE ?AUTO_11250 ?AUTO_11249 ) ( not ( = ?AUTO_11242 ?AUTO_11250 ) ) ( not ( = ?AUTO_11249 ?AUTO_11250 ) ) ( not ( = ?AUTO_11248 ?AUTO_11250 ) ) ( not ( = ?AUTO_11244 ?AUTO_11250 ) ) ( not ( = ?AUTO_11243 ?AUTO_11250 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11245 ?AUTO_11250 ?AUTO_11249 )
      ( GET_SOIL_DATA ?AUTO_11242 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11242 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11350 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11354 - LANDER
      ?AUTO_11351 - WAYPOINT
      ?AUTO_11356 - ROVER
      ?AUTO_11355 - STORE
      ?AUTO_11353 - WAYPOINT
      ?AUTO_11357 - WAYPOINT
      ?AUTO_11352 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11354 ?AUTO_11351 ) ( VISIBLE ?AUTO_11350 ?AUTO_11351 ) ( AVAILABLE ?AUTO_11356 ) ( CHANNEL_FREE ?AUTO_11354 ) ( not ( = ?AUTO_11350 ?AUTO_11351 ) ) ( AT_SOIL_SAMPLE ?AUTO_11350 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11356 ) ( STORE_OF ?AUTO_11355 ?AUTO_11356 ) ( CAN_TRAVERSE ?AUTO_11356 ?AUTO_11353 ?AUTO_11350 ) ( VISIBLE ?AUTO_11353 ?AUTO_11350 ) ( not ( = ?AUTO_11350 ?AUTO_11353 ) ) ( not ( = ?AUTO_11351 ?AUTO_11353 ) ) ( AT_ROCK_SAMPLE ?AUTO_11353 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11356 ) ( CAN_TRAVERSE ?AUTO_11356 ?AUTO_11357 ?AUTO_11353 ) ( VISIBLE ?AUTO_11357 ?AUTO_11353 ) ( not ( = ?AUTO_11350 ?AUTO_11357 ) ) ( not ( = ?AUTO_11351 ?AUTO_11357 ) ) ( not ( = ?AUTO_11353 ?AUTO_11357 ) ) ( CAN_TRAVERSE ?AUTO_11356 ?AUTO_11352 ?AUTO_11357 ) ( AT ?AUTO_11356 ?AUTO_11352 ) ( VISIBLE ?AUTO_11352 ?AUTO_11357 ) ( not ( = ?AUTO_11350 ?AUTO_11352 ) ) ( not ( = ?AUTO_11351 ?AUTO_11352 ) ) ( not ( = ?AUTO_11353 ?AUTO_11352 ) ) ( not ( = ?AUTO_11357 ?AUTO_11352 ) ) ( AT_SOIL_SAMPLE ?AUTO_11352 ) ( EMPTY ?AUTO_11355 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_11356 ?AUTO_11355 ?AUTO_11352 )
      ( GET_SOIL_DATA ?AUTO_11350 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11350 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11409 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11411 - LANDER
      ?AUTO_11410 - WAYPOINT
      ?AUTO_11413 - ROVER
      ?AUTO_11414 - STORE
      ?AUTO_11415 - WAYPOINT
      ?AUTO_11412 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11411 ?AUTO_11409 ) ( VISIBLE ?AUTO_11410 ?AUTO_11409 ) ( AVAILABLE ?AUTO_11413 ) ( CHANNEL_FREE ?AUTO_11411 ) ( not ( = ?AUTO_11409 ?AUTO_11410 ) ) ( CAN_TRAVERSE ?AUTO_11413 ?AUTO_11409 ?AUTO_11410 ) ( VISIBLE ?AUTO_11409 ?AUTO_11410 ) ( AT_SOIL_SAMPLE ?AUTO_11409 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11413 ) ( STORE_OF ?AUTO_11414 ?AUTO_11413 ) ( CAN_TRAVERSE ?AUTO_11413 ?AUTO_11415 ?AUTO_11409 ) ( VISIBLE ?AUTO_11415 ?AUTO_11409 ) ( not ( = ?AUTO_11409 ?AUTO_11415 ) ) ( not ( = ?AUTO_11410 ?AUTO_11415 ) ) ( CAN_TRAVERSE ?AUTO_11413 ?AUTO_11412 ?AUTO_11415 ) ( AT ?AUTO_11413 ?AUTO_11412 ) ( VISIBLE ?AUTO_11412 ?AUTO_11415 ) ( not ( = ?AUTO_11409 ?AUTO_11412 ) ) ( not ( = ?AUTO_11410 ?AUTO_11412 ) ) ( not ( = ?AUTO_11415 ?AUTO_11412 ) ) ( AT_ROCK_SAMPLE ?AUTO_11412 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11413 ) ( EMPTY ?AUTO_11414 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_11413 ?AUTO_11414 ?AUTO_11412 )
      ( GET_SOIL_DATA ?AUTO_11409 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11409 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11433 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11440 - LANDER
      ?AUTO_11437 - WAYPOINT
      ?AUTO_11434 - ROVER
      ?AUTO_11436 - STORE
      ?AUTO_11435 - WAYPOINT
      ?AUTO_11438 - WAYPOINT
      ?AUTO_11439 - WAYPOINT
      ?AUTO_11441 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11440 ?AUTO_11433 ) ( VISIBLE ?AUTO_11437 ?AUTO_11433 ) ( AVAILABLE ?AUTO_11434 ) ( CHANNEL_FREE ?AUTO_11440 ) ( not ( = ?AUTO_11433 ?AUTO_11437 ) ) ( CAN_TRAVERSE ?AUTO_11434 ?AUTO_11433 ?AUTO_11437 ) ( VISIBLE ?AUTO_11433 ?AUTO_11437 ) ( AT_SOIL_SAMPLE ?AUTO_11433 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11434 ) ( STORE_OF ?AUTO_11436 ?AUTO_11434 ) ( CAN_TRAVERSE ?AUTO_11434 ?AUTO_11435 ?AUTO_11433 ) ( VISIBLE ?AUTO_11435 ?AUTO_11433 ) ( not ( = ?AUTO_11433 ?AUTO_11435 ) ) ( not ( = ?AUTO_11437 ?AUTO_11435 ) ) ( CAN_TRAVERSE ?AUTO_11434 ?AUTO_11438 ?AUTO_11435 ) ( VISIBLE ?AUTO_11438 ?AUTO_11435 ) ( not ( = ?AUTO_11433 ?AUTO_11438 ) ) ( not ( = ?AUTO_11437 ?AUTO_11438 ) ) ( not ( = ?AUTO_11435 ?AUTO_11438 ) ) ( AT_ROCK_SAMPLE ?AUTO_11438 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11434 ) ( CAN_TRAVERSE ?AUTO_11434 ?AUTO_11439 ?AUTO_11438 ) ( VISIBLE ?AUTO_11439 ?AUTO_11438 ) ( not ( = ?AUTO_11433 ?AUTO_11439 ) ) ( not ( = ?AUTO_11437 ?AUTO_11439 ) ) ( not ( = ?AUTO_11435 ?AUTO_11439 ) ) ( not ( = ?AUTO_11438 ?AUTO_11439 ) ) ( FULL ?AUTO_11436 ) ( CAN_TRAVERSE ?AUTO_11434 ?AUTO_11441 ?AUTO_11439 ) ( AT ?AUTO_11434 ?AUTO_11441 ) ( VISIBLE ?AUTO_11441 ?AUTO_11439 ) ( not ( = ?AUTO_11433 ?AUTO_11441 ) ) ( not ( = ?AUTO_11437 ?AUTO_11441 ) ) ( not ( = ?AUTO_11435 ?AUTO_11441 ) ) ( not ( = ?AUTO_11438 ?AUTO_11441 ) ) ( not ( = ?AUTO_11439 ?AUTO_11441 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11434 ?AUTO_11441 ?AUTO_11439 )
      ( GET_SOIL_DATA ?AUTO_11433 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11433 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11442 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11448 - LANDER
      ?AUTO_11450 - WAYPOINT
      ?AUTO_11447 - ROVER
      ?AUTO_11443 - STORE
      ?AUTO_11446 - WAYPOINT
      ?AUTO_11445 - WAYPOINT
      ?AUTO_11449 - WAYPOINT
      ?AUTO_11444 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11448 ?AUTO_11442 ) ( VISIBLE ?AUTO_11450 ?AUTO_11442 ) ( AVAILABLE ?AUTO_11447 ) ( CHANNEL_FREE ?AUTO_11448 ) ( not ( = ?AUTO_11442 ?AUTO_11450 ) ) ( CAN_TRAVERSE ?AUTO_11447 ?AUTO_11442 ?AUTO_11450 ) ( VISIBLE ?AUTO_11442 ?AUTO_11450 ) ( AT_SOIL_SAMPLE ?AUTO_11442 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11447 ) ( STORE_OF ?AUTO_11443 ?AUTO_11447 ) ( CAN_TRAVERSE ?AUTO_11447 ?AUTO_11446 ?AUTO_11442 ) ( VISIBLE ?AUTO_11446 ?AUTO_11442 ) ( not ( = ?AUTO_11442 ?AUTO_11446 ) ) ( not ( = ?AUTO_11450 ?AUTO_11446 ) ) ( CAN_TRAVERSE ?AUTO_11447 ?AUTO_11445 ?AUTO_11446 ) ( VISIBLE ?AUTO_11445 ?AUTO_11446 ) ( not ( = ?AUTO_11442 ?AUTO_11445 ) ) ( not ( = ?AUTO_11450 ?AUTO_11445 ) ) ( not ( = ?AUTO_11446 ?AUTO_11445 ) ) ( AT_ROCK_SAMPLE ?AUTO_11445 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11447 ) ( CAN_TRAVERSE ?AUTO_11447 ?AUTO_11449 ?AUTO_11445 ) ( VISIBLE ?AUTO_11449 ?AUTO_11445 ) ( not ( = ?AUTO_11442 ?AUTO_11449 ) ) ( not ( = ?AUTO_11450 ?AUTO_11449 ) ) ( not ( = ?AUTO_11446 ?AUTO_11449 ) ) ( not ( = ?AUTO_11445 ?AUTO_11449 ) ) ( CAN_TRAVERSE ?AUTO_11447 ?AUTO_11444 ?AUTO_11449 ) ( AT ?AUTO_11447 ?AUTO_11444 ) ( VISIBLE ?AUTO_11444 ?AUTO_11449 ) ( not ( = ?AUTO_11442 ?AUTO_11444 ) ) ( not ( = ?AUTO_11450 ?AUTO_11444 ) ) ( not ( = ?AUTO_11446 ?AUTO_11444 ) ) ( not ( = ?AUTO_11445 ?AUTO_11444 ) ) ( not ( = ?AUTO_11449 ?AUTO_11444 ) ) ( AT_SOIL_SAMPLE ?AUTO_11444 ) ( EMPTY ?AUTO_11443 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_11447 ?AUTO_11443 ?AUTO_11444 )
      ( GET_SOIL_DATA ?AUTO_11442 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11442 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11451 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11454 - LANDER
      ?AUTO_11452 - WAYPOINT
      ?AUTO_11457 - ROVER
      ?AUTO_11455 - STORE
      ?AUTO_11459 - WAYPOINT
      ?AUTO_11456 - WAYPOINT
      ?AUTO_11453 - WAYPOINT
      ?AUTO_11458 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11454 ?AUTO_11451 ) ( VISIBLE ?AUTO_11452 ?AUTO_11451 ) ( AVAILABLE ?AUTO_11457 ) ( CHANNEL_FREE ?AUTO_11454 ) ( not ( = ?AUTO_11451 ?AUTO_11452 ) ) ( CAN_TRAVERSE ?AUTO_11457 ?AUTO_11451 ?AUTO_11452 ) ( VISIBLE ?AUTO_11451 ?AUTO_11452 ) ( AT_SOIL_SAMPLE ?AUTO_11451 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11457 ) ( STORE_OF ?AUTO_11455 ?AUTO_11457 ) ( CAN_TRAVERSE ?AUTO_11457 ?AUTO_11459 ?AUTO_11451 ) ( VISIBLE ?AUTO_11459 ?AUTO_11451 ) ( not ( = ?AUTO_11451 ?AUTO_11459 ) ) ( not ( = ?AUTO_11452 ?AUTO_11459 ) ) ( CAN_TRAVERSE ?AUTO_11457 ?AUTO_11456 ?AUTO_11459 ) ( VISIBLE ?AUTO_11456 ?AUTO_11459 ) ( not ( = ?AUTO_11451 ?AUTO_11456 ) ) ( not ( = ?AUTO_11452 ?AUTO_11456 ) ) ( not ( = ?AUTO_11459 ?AUTO_11456 ) ) ( AT_ROCK_SAMPLE ?AUTO_11456 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11457 ) ( CAN_TRAVERSE ?AUTO_11457 ?AUTO_11453 ?AUTO_11456 ) ( VISIBLE ?AUTO_11453 ?AUTO_11456 ) ( not ( = ?AUTO_11451 ?AUTO_11453 ) ) ( not ( = ?AUTO_11452 ?AUTO_11453 ) ) ( not ( = ?AUTO_11459 ?AUTO_11453 ) ) ( not ( = ?AUTO_11456 ?AUTO_11453 ) ) ( CAN_TRAVERSE ?AUTO_11457 ?AUTO_11458 ?AUTO_11453 ) ( VISIBLE ?AUTO_11458 ?AUTO_11453 ) ( not ( = ?AUTO_11451 ?AUTO_11458 ) ) ( not ( = ?AUTO_11452 ?AUTO_11458 ) ) ( not ( = ?AUTO_11459 ?AUTO_11458 ) ) ( not ( = ?AUTO_11456 ?AUTO_11458 ) ) ( not ( = ?AUTO_11453 ?AUTO_11458 ) ) ( AT_SOIL_SAMPLE ?AUTO_11458 ) ( EMPTY ?AUTO_11455 ) ( CAN_TRAVERSE ?AUTO_11457 ?AUTO_11452 ?AUTO_11458 ) ( AT ?AUTO_11457 ?AUTO_11452 ) ( VISIBLE ?AUTO_11452 ?AUTO_11458 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11457 ?AUTO_11452 ?AUTO_11458 )
      ( GET_SOIL_DATA ?AUTO_11451 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11451 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11525 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11531 - LANDER
      ?AUTO_11526 - WAYPOINT
      ?AUTO_11530 - ROVER
      ?AUTO_11528 - STORE
      ?AUTO_11529 - WAYPOINT
      ?AUTO_11527 - WAYPOINT
      ?AUTO_11532 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11531 ?AUTO_11525 ) ( VISIBLE ?AUTO_11526 ?AUTO_11525 ) ( AVAILABLE ?AUTO_11530 ) ( CHANNEL_FREE ?AUTO_11531 ) ( not ( = ?AUTO_11525 ?AUTO_11526 ) ) ( CAN_TRAVERSE ?AUTO_11530 ?AUTO_11525 ?AUTO_11526 ) ( VISIBLE ?AUTO_11525 ?AUTO_11526 ) ( AT_ROCK_SAMPLE ?AUTO_11525 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11530 ) ( STORE_OF ?AUTO_11528 ?AUTO_11530 ) ( CAN_TRAVERSE ?AUTO_11530 ?AUTO_11529 ?AUTO_11525 ) ( VISIBLE ?AUTO_11529 ?AUTO_11525 ) ( not ( = ?AUTO_11525 ?AUTO_11529 ) ) ( not ( = ?AUTO_11526 ?AUTO_11529 ) ) ( CAN_TRAVERSE ?AUTO_11530 ?AUTO_11527 ?AUTO_11529 ) ( VISIBLE ?AUTO_11527 ?AUTO_11529 ) ( not ( = ?AUTO_11525 ?AUTO_11527 ) ) ( not ( = ?AUTO_11526 ?AUTO_11527 ) ) ( not ( = ?AUTO_11529 ?AUTO_11527 ) ) ( AT_ROCK_SAMPLE ?AUTO_11527 ) ( CAN_TRAVERSE ?AUTO_11530 ?AUTO_11532 ?AUTO_11527 ) ( AT ?AUTO_11530 ?AUTO_11532 ) ( VISIBLE ?AUTO_11532 ?AUTO_11527 ) ( not ( = ?AUTO_11525 ?AUTO_11532 ) ) ( not ( = ?AUTO_11526 ?AUTO_11532 ) ) ( not ( = ?AUTO_11529 ?AUTO_11532 ) ) ( not ( = ?AUTO_11527 ?AUTO_11532 ) ) ( FULL ?AUTO_11528 ) )
    :subtasks
    ( ( !DROP ?AUTO_11530 ?AUTO_11528 )
      ( GET_ROCK_DATA ?AUTO_11525 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11525 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11533 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11538 - LANDER
      ?AUTO_11535 - WAYPOINT
      ?AUTO_11540 - ROVER
      ?AUTO_11536 - STORE
      ?AUTO_11539 - WAYPOINT
      ?AUTO_11534 - WAYPOINT
      ?AUTO_11537 - WAYPOINT
      ?AUTO_11541 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11538 ?AUTO_11533 ) ( VISIBLE ?AUTO_11535 ?AUTO_11533 ) ( AVAILABLE ?AUTO_11540 ) ( CHANNEL_FREE ?AUTO_11538 ) ( not ( = ?AUTO_11533 ?AUTO_11535 ) ) ( CAN_TRAVERSE ?AUTO_11540 ?AUTO_11533 ?AUTO_11535 ) ( VISIBLE ?AUTO_11533 ?AUTO_11535 ) ( AT_ROCK_SAMPLE ?AUTO_11533 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11540 ) ( STORE_OF ?AUTO_11536 ?AUTO_11540 ) ( CAN_TRAVERSE ?AUTO_11540 ?AUTO_11539 ?AUTO_11533 ) ( VISIBLE ?AUTO_11539 ?AUTO_11533 ) ( not ( = ?AUTO_11533 ?AUTO_11539 ) ) ( not ( = ?AUTO_11535 ?AUTO_11539 ) ) ( CAN_TRAVERSE ?AUTO_11540 ?AUTO_11534 ?AUTO_11539 ) ( VISIBLE ?AUTO_11534 ?AUTO_11539 ) ( not ( = ?AUTO_11533 ?AUTO_11534 ) ) ( not ( = ?AUTO_11535 ?AUTO_11534 ) ) ( not ( = ?AUTO_11539 ?AUTO_11534 ) ) ( AT_ROCK_SAMPLE ?AUTO_11534 ) ( CAN_TRAVERSE ?AUTO_11540 ?AUTO_11537 ?AUTO_11534 ) ( VISIBLE ?AUTO_11537 ?AUTO_11534 ) ( not ( = ?AUTO_11533 ?AUTO_11537 ) ) ( not ( = ?AUTO_11535 ?AUTO_11537 ) ) ( not ( = ?AUTO_11539 ?AUTO_11537 ) ) ( not ( = ?AUTO_11534 ?AUTO_11537 ) ) ( FULL ?AUTO_11536 ) ( CAN_TRAVERSE ?AUTO_11540 ?AUTO_11541 ?AUTO_11537 ) ( AT ?AUTO_11540 ?AUTO_11541 ) ( VISIBLE ?AUTO_11541 ?AUTO_11537 ) ( not ( = ?AUTO_11533 ?AUTO_11541 ) ) ( not ( = ?AUTO_11535 ?AUTO_11541 ) ) ( not ( = ?AUTO_11539 ?AUTO_11541 ) ) ( not ( = ?AUTO_11534 ?AUTO_11541 ) ) ( not ( = ?AUTO_11537 ?AUTO_11541 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11540 ?AUTO_11541 ?AUTO_11537 )
      ( GET_ROCK_DATA ?AUTO_11533 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11533 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11542 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11545 - LANDER
      ?AUTO_11549 - WAYPOINT
      ?AUTO_11548 - ROVER
      ?AUTO_11546 - STORE
      ?AUTO_11543 - WAYPOINT
      ?AUTO_11544 - WAYPOINT
      ?AUTO_11547 - WAYPOINT
      ?AUTO_11550 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11545 ?AUTO_11542 ) ( VISIBLE ?AUTO_11549 ?AUTO_11542 ) ( AVAILABLE ?AUTO_11548 ) ( CHANNEL_FREE ?AUTO_11545 ) ( not ( = ?AUTO_11542 ?AUTO_11549 ) ) ( CAN_TRAVERSE ?AUTO_11548 ?AUTO_11542 ?AUTO_11549 ) ( VISIBLE ?AUTO_11542 ?AUTO_11549 ) ( AT_ROCK_SAMPLE ?AUTO_11542 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11548 ) ( STORE_OF ?AUTO_11546 ?AUTO_11548 ) ( CAN_TRAVERSE ?AUTO_11548 ?AUTO_11543 ?AUTO_11542 ) ( VISIBLE ?AUTO_11543 ?AUTO_11542 ) ( not ( = ?AUTO_11542 ?AUTO_11543 ) ) ( not ( = ?AUTO_11549 ?AUTO_11543 ) ) ( CAN_TRAVERSE ?AUTO_11548 ?AUTO_11544 ?AUTO_11543 ) ( VISIBLE ?AUTO_11544 ?AUTO_11543 ) ( not ( = ?AUTO_11542 ?AUTO_11544 ) ) ( not ( = ?AUTO_11549 ?AUTO_11544 ) ) ( not ( = ?AUTO_11543 ?AUTO_11544 ) ) ( AT_ROCK_SAMPLE ?AUTO_11544 ) ( CAN_TRAVERSE ?AUTO_11548 ?AUTO_11547 ?AUTO_11544 ) ( VISIBLE ?AUTO_11547 ?AUTO_11544 ) ( not ( = ?AUTO_11542 ?AUTO_11547 ) ) ( not ( = ?AUTO_11549 ?AUTO_11547 ) ) ( not ( = ?AUTO_11543 ?AUTO_11547 ) ) ( not ( = ?AUTO_11544 ?AUTO_11547 ) ) ( CAN_TRAVERSE ?AUTO_11548 ?AUTO_11550 ?AUTO_11547 ) ( AT ?AUTO_11548 ?AUTO_11550 ) ( VISIBLE ?AUTO_11550 ?AUTO_11547 ) ( not ( = ?AUTO_11542 ?AUTO_11550 ) ) ( not ( = ?AUTO_11549 ?AUTO_11550 ) ) ( not ( = ?AUTO_11543 ?AUTO_11550 ) ) ( not ( = ?AUTO_11544 ?AUTO_11550 ) ) ( not ( = ?AUTO_11547 ?AUTO_11550 ) ) ( AT_SOIL_SAMPLE ?AUTO_11550 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11548 ) ( EMPTY ?AUTO_11546 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_11548 ?AUTO_11546 ?AUTO_11550 )
      ( GET_ROCK_DATA ?AUTO_11542 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11542 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11551 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11558 - LANDER
      ?AUTO_11557 - WAYPOINT
      ?AUTO_11554 - ROVER
      ?AUTO_11553 - STORE
      ?AUTO_11556 - WAYPOINT
      ?AUTO_11552 - WAYPOINT
      ?AUTO_11555 - WAYPOINT
      ?AUTO_11559 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11558 ?AUTO_11551 ) ( VISIBLE ?AUTO_11557 ?AUTO_11551 ) ( AVAILABLE ?AUTO_11554 ) ( CHANNEL_FREE ?AUTO_11558 ) ( not ( = ?AUTO_11551 ?AUTO_11557 ) ) ( CAN_TRAVERSE ?AUTO_11554 ?AUTO_11551 ?AUTO_11557 ) ( VISIBLE ?AUTO_11551 ?AUTO_11557 ) ( AT_ROCK_SAMPLE ?AUTO_11551 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11554 ) ( STORE_OF ?AUTO_11553 ?AUTO_11554 ) ( CAN_TRAVERSE ?AUTO_11554 ?AUTO_11556 ?AUTO_11551 ) ( VISIBLE ?AUTO_11556 ?AUTO_11551 ) ( not ( = ?AUTO_11551 ?AUTO_11556 ) ) ( not ( = ?AUTO_11557 ?AUTO_11556 ) ) ( CAN_TRAVERSE ?AUTO_11554 ?AUTO_11552 ?AUTO_11556 ) ( VISIBLE ?AUTO_11552 ?AUTO_11556 ) ( not ( = ?AUTO_11551 ?AUTO_11552 ) ) ( not ( = ?AUTO_11557 ?AUTO_11552 ) ) ( not ( = ?AUTO_11556 ?AUTO_11552 ) ) ( AT_ROCK_SAMPLE ?AUTO_11552 ) ( CAN_TRAVERSE ?AUTO_11554 ?AUTO_11555 ?AUTO_11552 ) ( VISIBLE ?AUTO_11555 ?AUTO_11552 ) ( not ( = ?AUTO_11551 ?AUTO_11555 ) ) ( not ( = ?AUTO_11557 ?AUTO_11555 ) ) ( not ( = ?AUTO_11556 ?AUTO_11555 ) ) ( not ( = ?AUTO_11552 ?AUTO_11555 ) ) ( CAN_TRAVERSE ?AUTO_11554 ?AUTO_11559 ?AUTO_11555 ) ( VISIBLE ?AUTO_11559 ?AUTO_11555 ) ( not ( = ?AUTO_11551 ?AUTO_11559 ) ) ( not ( = ?AUTO_11557 ?AUTO_11559 ) ) ( not ( = ?AUTO_11556 ?AUTO_11559 ) ) ( not ( = ?AUTO_11552 ?AUTO_11559 ) ) ( not ( = ?AUTO_11555 ?AUTO_11559 ) ) ( AT_SOIL_SAMPLE ?AUTO_11559 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11554 ) ( EMPTY ?AUTO_11553 ) ( CAN_TRAVERSE ?AUTO_11554 ?AUTO_11557 ?AUTO_11559 ) ( AT ?AUTO_11554 ?AUTO_11557 ) ( VISIBLE ?AUTO_11557 ?AUTO_11559 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11554 ?AUTO_11557 ?AUTO_11559 )
      ( GET_ROCK_DATA ?AUTO_11551 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11551 ) )
  )

)

